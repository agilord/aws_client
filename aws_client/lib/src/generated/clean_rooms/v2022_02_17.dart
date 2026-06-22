// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: unnecessary_brace_in_string_interps

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

import 'v2022_02_17.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// Welcome to the <i>Clean Rooms API Reference</i>.
///
/// Clean Rooms is an Amazon Web Services service that helps multiple parties to
/// join their data together in a secure collaboration workspace. In the
/// collaboration, members who can run queries and jobs and receive results can
/// get insights into the collective datasets without either party getting
/// access to the other party's raw data.
///
/// To learn more about Clean Rooms concepts, procedures, and best practices,
/// see the <a
/// href="https://docs.aws.amazon.com/clean-rooms/latest/userguide/what-is.html">Clean
/// Rooms User Guide</a>.
///
/// To learn more about SQL commands, functions, and conditions supported in
/// Clean Rooms, see the <a
/// href="https://docs.aws.amazon.com/clean-rooms/latest/sql-reference/sql-reference.html">Clean
/// Rooms SQL Reference</a>.
class CleanRooms {
  final _s.RestJsonProtocol _protocol;
  factory CleanRooms({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'cleanrooms',
    );
    return CleanRooms._(
      protocol: _s.RestJsonProtocol(
        client: client,
        endpointBuilder: () => _s.Endpoint.fromResolved(
            _endpoints.resolveEndpoint(
                region: region,
                endpoint: endpointUrl,
                useFips: useFipsEndpoint,
                useDualStack: useDualStackEndpoint),
            service: service,
            region: region),
        credentials: credentials,
        credentialsProvider: credentialsProvider,
      ),
    );
  }
  CleanRooms._({
    required _s.RestJsonProtocol protocol,
  }) : _protocol = protocol;

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Lists all of the tags that have been added to a resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) associated with the resource you want to
  /// list tags on.
  Future<ListTagsForResourceOutput> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceOutput.fromJson(response);
  }

  /// Tags a resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) associated with the resource you want to
  /// tag.
  ///
  /// Parameter [tags] :
  /// A map of objects specifying each key name and value.
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

  /// Removes a tag or list of tags from a resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) associated with the resource you want to
  /// remove the tag from.
  ///
  /// Parameter [tagKeys] :
  /// A list of key names of tags to be removed.
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

  /// Creates a new analysis template.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [format] :
  /// The format of the analysis template.
  ///
  /// Parameter [membershipIdentifier] :
  /// The identifier for a membership resource.
  ///
  /// Parameter [name] :
  /// The name of the analysis template.
  ///
  /// Parameter [source] :
  /// The information in the analysis template.
  ///
  /// Parameter [analysisParameters] :
  /// The parameters of the analysis template.
  ///
  /// Parameter [description] :
  /// The description of the analysis template.
  ///
  /// Parameter [errorMessageConfiguration] :
  /// The configuration that specifies the level of detail in error messages
  /// returned by analyses using this template. When set to
  /// <code>DETAILED</code>, error messages include more information to help
  /// troubleshoot issues with PySpark jobs. Detailed error messages may expose
  /// underlying data, including sensitive information. Recommended for faster
  /// troubleshooting in development and testing environments.
  ///
  /// Parameter [syntheticDataParameters] :
  /// The parameters for generating synthetic data when running the analysis
  /// template.
  ///
  /// Parameter [tags] :
  /// An optional label that you can assign to a resource when you create it.
  /// Each tag consists of a key and an optional value, both of which you
  /// define. When you use tagging, you can also use tag-based access control in
  /// IAM policies to control access to this resource.
  Future<CreateAnalysisTemplateOutput> createAnalysisTemplate({
    required AnalysisFormat format,
    required String membershipIdentifier,
    required String name,
    required AnalysisSource source,
    List<AnalysisParameter>? analysisParameters,
    String? description,
    ErrorMessageConfiguration? errorMessageConfiguration,
    AnalysisSchema? schema,
    SyntheticDataParameters? syntheticDataParameters,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'format': format.value,
      'name': name,
      'source': source,
      if (analysisParameters != null) 'analysisParameters': analysisParameters,
      if (description != null) 'description': description,
      if (errorMessageConfiguration != null)
        'errorMessageConfiguration': errorMessageConfiguration,
      if (schema != null) 'schema': schema,
      if (syntheticDataParameters != null)
        'syntheticDataParameters': syntheticDataParameters,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/analysistemplates',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAnalysisTemplateOutput.fromJson(response);
  }

  /// Retrieves an analysis template.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [analysisTemplateIdentifier] :
  /// The identifier for the analysis template resource.
  ///
  /// Parameter [membershipIdentifier] :
  /// The identifier for a membership resource.
  Future<GetAnalysisTemplateOutput> getAnalysisTemplate({
    required String analysisTemplateIdentifier,
    required String membershipIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/analysistemplates/${Uri.encodeComponent(analysisTemplateIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetAnalysisTemplateOutput.fromJson(response);
  }

  /// Updates the analysis template metadata.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [analysisTemplateIdentifier] :
  /// The identifier for the analysis template resource.
  ///
  /// Parameter [membershipIdentifier] :
  /// The identifier for a membership resource.
  ///
  /// Parameter [description] :
  /// A new description for the analysis template.
  Future<UpdateAnalysisTemplateOutput> updateAnalysisTemplate({
    required String analysisTemplateIdentifier,
    required String membershipIdentifier,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/analysistemplates/${Uri.encodeComponent(analysisTemplateIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAnalysisTemplateOutput.fromJson(response);
  }

  /// Deletes an analysis template.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [analysisTemplateIdentifier] :
  /// The identifier for the analysis template resource.
  ///
  /// Parameter [membershipIdentifier] :
  /// The identifier for a membership resource.
  Future<void> deleteAnalysisTemplate({
    required String analysisTemplateIdentifier,
    required String membershipIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/analysistemplates/${Uri.encodeComponent(analysisTemplateIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists analysis templates that the caller owns.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [membershipIdentifier] :
  /// The identifier for a membership resource.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that are returned for an API request call.
  /// The service chooses a default number if you don't set one. The service
  /// might return a `nextToken` even if the `maxResults` value has not been
  /// met.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that's used to fetch the next set of results.
  Future<ListAnalysisTemplatesOutput> listAnalysisTemplates({
    required String membershipIdentifier,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/analysistemplates',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAnalysisTemplatesOutput.fromJson(response);
  }

  /// Creates a new collaboration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [creatorDisplayName] :
  /// The display name of the collaboration creator.
  ///
  /// Parameter [creatorMemberAbilities] :
  /// The abilities granted to the collaboration creator.
  ///
  /// Parameter [description] :
  /// A description of the collaboration provided by the collaboration owner.
  ///
  /// Parameter [members] :
  /// A list of initial members, not including the creator. This list is
  /// immutable.
  ///
  /// Parameter [name] :
  /// The display name for a collaboration.
  ///
  /// Parameter [queryLogStatus] :
  /// An indicator as to whether query logging has been enabled or disabled for
  /// the collaboration.
  ///
  /// When <code>ENABLED</code>, Clean Rooms logs details about queries run
  /// within this collaboration and those logs can be viewed in Amazon
  /// CloudWatch Logs. The default value is <code>DISABLED</code>.
  ///
  /// Parameter [allowedResultRegions] :
  /// The Amazon Web Services Regions where collaboration query results can be
  /// stored. When specified, results can only be written to these Regions. This
  /// parameter enables you to meet your compliance and data governance
  /// requirements, and implement regional data governance policies.
  ///
  /// Parameter [analyticsEngine] :
  /// The analytics engine.
  /// <note>
  /// After July 16, 2025, the <code>CLEAN_ROOMS_SQL</code> parameter will no
  /// longer be available.
  /// </note>
  ///
  /// Parameter [autoApprovedChangeRequestTypes] :
  /// The types of change requests that are automatically approved for this
  /// collaboration.
  ///
  /// Parameter [creatorMLMemberAbilities] :
  /// The ML abilities granted to the collaboration creator.
  ///
  /// Parameter [creatorPaymentConfiguration] :
  /// The collaboration creator's payment responsibilities set by the
  /// collaboration creator.
  ///
  /// If the collaboration creator hasn't specified anyone as the member paying
  /// for query compute costs, then the member who can query is the default
  /// payer.
  ///
  /// Parameter [dataEncryptionMetadata] :
  /// The settings for client-side encryption with Cryptographic Computing for
  /// Clean Rooms.
  ///
  /// Parameter [isMetricsEnabled] :
  /// An indicator as to whether metrics have been enabled or disabled for the
  /// collaboration.
  ///
  /// When <code>true</code>, collaboration members can opt in to Amazon
  /// CloudWatch metrics for their membership queries. The default value is
  /// <code>false</code>.
  ///
  /// Parameter [jobLogStatus] :
  /// Specifies whether job logs are enabled for this collaboration.
  ///
  /// When <code>ENABLED</code>, Clean Rooms logs details about jobs run within
  /// this collaboration; those logs can be viewed in Amazon CloudWatch Logs.
  /// The default value is <code>DISABLED</code>.
  ///
  /// Parameter [tags] :
  /// An optional label that you can assign to a resource when you create it.
  /// Each tag consists of a key and an optional value, both of which you
  /// define. When you use tagging, you can also use tag-based access control in
  /// IAM policies to control access to this resource.
  Future<CreateCollaborationOutput> createCollaboration({
    required String creatorDisplayName,
    required List<MemberAbility> creatorMemberAbilities,
    required String description,
    required List<MemberSpecification> members,
    required String name,
    required CollaborationQueryLogStatus queryLogStatus,
    List<SupportedS3Region>? allowedResultRegions,
    AnalyticsEngine? analyticsEngine,
    List<AutoApprovedChangeType>? autoApprovedChangeRequestTypes,
    MLMemberAbilities? creatorMLMemberAbilities,
    PaymentConfiguration? creatorPaymentConfiguration,
    DataEncryptionMetadata? dataEncryptionMetadata,
    bool? isMetricsEnabled,
    CollaborationJobLogStatus? jobLogStatus,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'creatorDisplayName': creatorDisplayName,
      'creatorMemberAbilities':
          creatorMemberAbilities.map((e) => e.value).toList(),
      'description': description,
      'members': members,
      'name': name,
      'queryLogStatus': queryLogStatus.value,
      if (allowedResultRegions != null)
        'allowedResultRegions':
            allowedResultRegions.map((e) => e.value).toList(),
      if (analyticsEngine != null) 'analyticsEngine': analyticsEngine.value,
      if (autoApprovedChangeRequestTypes != null)
        'autoApprovedChangeRequestTypes':
            autoApprovedChangeRequestTypes.map((e) => e.value).toList(),
      if (creatorMLMemberAbilities != null)
        'creatorMLMemberAbilities': creatorMLMemberAbilities,
      if (creatorPaymentConfiguration != null)
        'creatorPaymentConfiguration': creatorPaymentConfiguration,
      if (dataEncryptionMetadata != null)
        'dataEncryptionMetadata': dataEncryptionMetadata,
      if (isMetricsEnabled != null) 'isMetricsEnabled': isMetricsEnabled,
      if (jobLogStatus != null) 'jobLogStatus': jobLogStatus.value,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/collaborations',
      exceptionFnMap: _exceptionFns,
    );
    return CreateCollaborationOutput.fromJson(response);
  }

  /// Returns metadata about a collaboration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [collaborationIdentifier] :
  /// The identifier for the collaboration.
  Future<GetCollaborationOutput> getCollaboration({
    required String collaborationIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/collaborations/${Uri.encodeComponent(collaborationIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetCollaborationOutput.fromJson(response);
  }

  /// Updates collaboration metadata and can only be called by the collaboration
  /// owner.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [collaborationIdentifier] :
  /// The identifier for the collaboration.
  ///
  /// Parameter [analyticsEngine] :
  /// The analytics engine.
  /// <note>
  /// After July 16, 2025, the <code>CLEAN_ROOMS_SQL</code> parameter will no
  /// longer be available.
  /// </note>
  ///
  /// Parameter [description] :
  /// A description of the collaboration.
  ///
  /// Parameter [name] :
  /// A human-readable identifier provided by the collaboration owner. Display
  /// names are not unique.
  Future<UpdateCollaborationOutput> updateCollaboration({
    required String collaborationIdentifier,
    AnalyticsEngine? analyticsEngine,
    String? description,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      if (analyticsEngine != null) 'analyticsEngine': analyticsEngine.value,
      if (description != null) 'description': description,
      if (name != null) 'name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/collaborations/${Uri.encodeComponent(collaborationIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateCollaborationOutput.fromJson(response);
  }

  /// Deletes a collaboration. It can only be called by the collaboration owner.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [collaborationIdentifier] :
  /// The identifier for the collaboration.
  Future<void> deleteCollaboration({
    required String collaborationIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/collaborations/${Uri.encodeComponent(collaborationIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists collaborations the caller owns, is active in, or has been invited
  /// to.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that are returned for an API request call.
  /// The service chooses a default number if you don't set one. The service
  /// might return a `nextToken` even if the `maxResults` value has not been
  /// met.
  ///
  /// Parameter [memberStatus] :
  /// The caller's status in a collaboration.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that's used to fetch the next set of results.
  Future<ListCollaborationsOutput> listCollaborations({
    int? maxResults,
    FilterableMemberStatus? memberStatus,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (memberStatus != null) 'memberStatus': [memberStatus.value],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/collaborations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCollaborationsOutput.fromJson(response);
  }

  /// Retrieves multiple analysis templates within a collaboration by their
  /// Amazon Resource Names (ARNs).
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [analysisTemplateArns] :
  /// The Amazon Resource Name (ARN) associated with the analysis template
  /// within a collaboration.
  ///
  /// Parameter [collaborationIdentifier] :
  /// A unique identifier for the collaboration that the analysis templates
  /// belong to. Currently accepts collaboration ID.
  Future<BatchGetCollaborationAnalysisTemplateOutput>
      batchGetCollaborationAnalysisTemplate({
    required List<String> analysisTemplateArns,
    required String collaborationIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'analysisTemplateArns': analysisTemplateArns,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/collaborations/${Uri.encodeComponent(collaborationIdentifier)}/batch-analysistemplates',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetCollaborationAnalysisTemplateOutput.fromJson(response);
  }

  /// Retrieves multiple schemas by their identifiers.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [collaborationIdentifier] :
  /// A unique identifier for the collaboration that the schemas belong to.
  /// Currently accepts collaboration ID.
  ///
  /// Parameter [names] :
  /// The names for the schema objects to retrieve.
  Future<BatchGetSchemaOutput> batchGetSchema({
    required String collaborationIdentifier,
    required List<String> names,
  }) async {
    final $payload = <String, dynamic>{
      'names': names,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/collaborations/${Uri.encodeComponent(collaborationIdentifier)}/batch-schema',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetSchemaOutput.fromJson(response);
  }

  /// Retrieves multiple analysis rule schemas.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [collaborationIdentifier] :
  /// The unique identifier of the collaboration that contains the schema
  /// analysis rule.
  ///
  /// Parameter [schemaAnalysisRuleRequests] :
  /// The information that's necessary to retrieve a schema analysis rule.
  Future<BatchGetSchemaAnalysisRuleOutput> batchGetSchemaAnalysisRule({
    required String collaborationIdentifier,
    required List<SchemaAnalysisRuleRequest> schemaAnalysisRuleRequests,
  }) async {
    final $payload = <String, dynamic>{
      'schemaAnalysisRuleRequests': schemaAnalysisRuleRequests,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/collaborations/${Uri.encodeComponent(collaborationIdentifier)}/batch-schema-analysis-rule',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetSchemaAnalysisRuleOutput.fromJson(response);
  }

  /// Creates a new change request to modify an existing collaboration. This
  /// enables post-creation modifications to collaborations through a structured
  /// API-driven approach.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [changes] :
  /// The list of changes to apply to the collaboration. Each change specifies
  /// the type of modification and the details of what should be changed.
  ///
  /// Parameter [collaborationIdentifier] :
  /// The identifier of the collaboration that the change request is made
  /// against.
  Future<CreateCollaborationChangeRequestOutput>
      createCollaborationChangeRequest({
    required List<ChangeInput> changes,
    required String collaborationIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'changes': changes,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/collaborations/${Uri.encodeComponent(collaborationIdentifier)}/changeRequests',
      exceptionFnMap: _exceptionFns,
    );
    return CreateCollaborationChangeRequestOutput.fromJson(response);
  }

  /// Removes the specified member from a collaboration. The removed member is
  /// placed in the Removed status and can't interact with the collaboration.
  /// The removed member's data is inaccessible to active members of the
  /// collaboration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accountId] :
  /// The account ID of the member to remove.
  ///
  /// Parameter [collaborationIdentifier] :
  /// The unique identifier for the associated collaboration.
  Future<void> deleteMember({
    required String accountId,
    required String collaborationIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/collaborations/${Uri.encodeComponent(collaborationIdentifier)}/member/${Uri.encodeComponent(accountId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves an analysis template within a collaboration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [analysisTemplateArn] :
  /// The Amazon Resource Name (ARN) associated with the analysis template
  /// within a collaboration.
  ///
  /// Parameter [collaborationIdentifier] :
  /// A unique identifier for the collaboration that the analysis templates
  /// belong to. Currently accepts collaboration ID.
  Future<GetCollaborationAnalysisTemplateOutput>
      getCollaborationAnalysisTemplate({
    required String analysisTemplateArn,
    required String collaborationIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/collaborations/${Uri.encodeComponent(collaborationIdentifier)}/analysistemplates/${Uri.encodeComponent(analysisTemplateArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetCollaborationAnalysisTemplateOutput.fromJson(response);
  }

  /// Retrieves detailed information about a specific collaboration change
  /// request.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [changeRequestIdentifier] :
  /// A unique identifier for the change request to retrieve.
  ///
  /// Parameter [collaborationIdentifier] :
  /// The identifier of the collaboration that the change request is made
  /// against.
  Future<GetCollaborationChangeRequestOutput> getCollaborationChangeRequest({
    required String changeRequestIdentifier,
    required String collaborationIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/collaborations/${Uri.encodeComponent(collaborationIdentifier)}/changeRequests/${Uri.encodeComponent(changeRequestIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetCollaborationChangeRequestOutput.fromJson(response);
  }

  /// Retrieves a configured audience model association within a collaboration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [collaborationIdentifier] :
  /// A unique identifier for the collaboration that the configured audience
  /// model association belongs to. Accepts a collaboration ID.
  ///
  /// Parameter [configuredAudienceModelAssociationIdentifier] :
  /// A unique identifier for the configured audience model association that you
  /// want to retrieve.
  Future<GetCollaborationConfiguredAudienceModelAssociationOutput>
      getCollaborationConfiguredAudienceModelAssociation({
    required String collaborationIdentifier,
    required String configuredAudienceModelAssociationIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/collaborations/${Uri.encodeComponent(collaborationIdentifier)}/configuredaudiencemodelassociations/${Uri.encodeComponent(configuredAudienceModelAssociationIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetCollaborationConfiguredAudienceModelAssociationOutput.fromJson(
        response);
  }

  /// Retrieves an ID namespace association from a specific collaboration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [collaborationIdentifier] :
  /// The unique identifier of the collaboration that contains the ID namespace
  /// association that you want to retrieve.
  ///
  /// Parameter [idNamespaceAssociationIdentifier] :
  /// The unique identifier of the ID namespace association that you want to
  /// retrieve.
  Future<GetCollaborationIdNamespaceAssociationOutput>
      getCollaborationIdNamespaceAssociation({
    required String collaborationIdentifier,
    required String idNamespaceAssociationIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/collaborations/${Uri.encodeComponent(collaborationIdentifier)}/idnamespaceassociations/${Uri.encodeComponent(idNamespaceAssociationIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetCollaborationIdNamespaceAssociationOutput.fromJson(response);
  }

  /// Returns details about a specified privacy budget template.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [collaborationIdentifier] :
  /// A unique identifier for one of your collaborations.
  ///
  /// Parameter [privacyBudgetTemplateIdentifier] :
  /// A unique identifier for one of your privacy budget templates.
  Future<GetCollaborationPrivacyBudgetTemplateOutput>
      getCollaborationPrivacyBudgetTemplate({
    required String collaborationIdentifier,
    required String privacyBudgetTemplateIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/collaborations/${Uri.encodeComponent(collaborationIdentifier)}/privacybudgettemplates/${Uri.encodeComponent(privacyBudgetTemplateIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetCollaborationPrivacyBudgetTemplateOutput.fromJson(response);
  }

  /// Retrieves the schema for a relation within a collaboration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [collaborationIdentifier] :
  /// A unique identifier for the collaboration that the schema belongs to.
  /// Currently accepts a collaboration ID.
  ///
  /// Parameter [name] :
  /// The name of the relation to retrieve the schema for.
  Future<GetSchemaOutput> getSchema({
    required String collaborationIdentifier,
    required String name,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/collaborations/${Uri.encodeComponent(collaborationIdentifier)}/schemas/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSchemaOutput.fromJson(response);
  }

  /// Retrieves a schema analysis rule.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [collaborationIdentifier] :
  /// A unique identifier for the collaboration that the schema belongs to.
  /// Currently accepts a collaboration ID.
  ///
  /// Parameter [name] :
  /// The name of the schema to retrieve the analysis rule for.
  ///
  /// Parameter [type] :
  /// The type of the schema analysis rule to retrieve. Schema analysis rules
  /// are uniquely identified by a combination of the collaboration, the schema
  /// name, and their type.
  Future<GetSchemaAnalysisRuleOutput> getSchemaAnalysisRule({
    required String collaborationIdentifier,
    required String name,
    required AnalysisRuleType type,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/collaborations/${Uri.encodeComponent(collaborationIdentifier)}/schemas/${Uri.encodeComponent(name)}/analysisRule/${Uri.encodeComponent(type.value)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSchemaAnalysisRuleOutput.fromJson(response);
  }

  /// Lists analysis templates within a collaboration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [collaborationIdentifier] :
  /// A unique identifier for the collaboration that the analysis templates
  /// belong to. Currently accepts collaboration ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that are returned for an API request call.
  /// The service chooses a default number if you don't set one. The service
  /// might return a `nextToken` even if the `maxResults` value has not been
  /// met.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that's used to fetch the next set of results.
  Future<ListCollaborationAnalysisTemplatesOutput>
      listCollaborationAnalysisTemplates({
    required String collaborationIdentifier,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/collaborations/${Uri.encodeComponent(collaborationIdentifier)}/analysistemplates',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCollaborationAnalysisTemplatesOutput.fromJson(response);
  }

  /// Lists all change requests for a collaboration with pagination support.
  /// Returns change requests sorted by creation time.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [collaborationIdentifier] :
  /// The identifier of the collaboration that the change request is made
  /// against.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that are returned for an API request call.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that's used to fetch the next set of results.
  ///
  /// Parameter [status] :
  /// A filter to only return change requests with the specified status.
  Future<ListCollaborationChangeRequestsOutput>
      listCollaborationChangeRequests({
    required String collaborationIdentifier,
    int? maxResults,
    String? nextToken,
    ChangeRequestStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (status != null) 'status': [status.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/collaborations/${Uri.encodeComponent(collaborationIdentifier)}/changeRequests',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCollaborationChangeRequestsOutput.fromJson(response);
  }

  /// Lists configured audience model associations within a collaboration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [collaborationIdentifier] :
  /// A unique identifier for the collaboration that the configured audience
  /// model association belongs to. Accepts a collaboration ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that are returned for an API request call.
  /// The service chooses a default number if you don't set one. The service
  /// might return a `nextToken` even if the `maxResults` value has not been
  /// met.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that's used to fetch the next set of results.
  Future<ListCollaborationConfiguredAudienceModelAssociationsOutput>
      listCollaborationConfiguredAudienceModelAssociations({
    required String collaborationIdentifier,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/collaborations/${Uri.encodeComponent(collaborationIdentifier)}/configuredaudiencemodelassociations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCollaborationConfiguredAudienceModelAssociationsOutput.fromJson(
        response);
  }

  /// Returns a list of the ID namespace associations in a collaboration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [collaborationIdentifier] :
  /// The unique identifier of the collaboration that contains the ID namespace
  /// associations that you want to retrieve.
  ///
  /// Parameter [maxResults] :
  /// The maximum size of the results that is returned per call. Service chooses
  /// a default if it has not been set. Service may return a nextToken even if
  /// the maximum results has not been met.&gt;
  ///
  /// Parameter [nextToken] :
  /// The pagination token that's used to fetch the next set of results.
  Future<ListCollaborationIdNamespaceAssociationsOutput>
      listCollaborationIdNamespaceAssociations({
    required String collaborationIdentifier,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/collaborations/${Uri.encodeComponent(collaborationIdentifier)}/idnamespaceassociations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCollaborationIdNamespaceAssociationsOutput.fromJson(response);
  }

  /// Returns an array that summarizes each privacy budget in a specified
  /// collaboration. The summary includes the collaboration ARN, creation time,
  /// creating account, and privacy budget details.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [collaborationIdentifier] :
  /// A unique identifier for one of your collaborations.
  ///
  /// Parameter [privacyBudgetType] :
  /// Specifies the type of the privacy budget.
  ///
  /// Parameter [accessBudgetResourceArn] :
  /// The Amazon Resource Name (ARN) of the Configured Table Association
  /// (ConfiguredTableAssociation) used to filter privacy budgets.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that are returned for an API request call.
  /// The service chooses a default number if you don't set one. The service
  /// might return a `nextToken` even if the `maxResults` value has not been
  /// met.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that's used to fetch the next set of results.
  Future<ListCollaborationPrivacyBudgetsOutput>
      listCollaborationPrivacyBudgets({
    required String collaborationIdentifier,
    required PrivacyBudgetType privacyBudgetType,
    String? accessBudgetResourceArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      'privacyBudgetType': [privacyBudgetType.value],
      if (accessBudgetResourceArn != null)
        'accessBudgetResourceArn': [accessBudgetResourceArn],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/collaborations/${Uri.encodeComponent(collaborationIdentifier)}/privacybudgets',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCollaborationPrivacyBudgetsOutput.fromJson(response);
  }

  /// Returns an array that summarizes each privacy budget template in a
  /// specified collaboration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [collaborationIdentifier] :
  /// A unique identifier for one of your collaborations.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that are returned for an API request call.
  /// The service chooses a default number if you don't set one. The service
  /// might return a `nextToken` even if the `maxResults` value has not been
  /// met.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that's used to fetch the next set of results.
  Future<ListCollaborationPrivacyBudgetTemplatesOutput>
      listCollaborationPrivacyBudgetTemplates({
    required String collaborationIdentifier,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/collaborations/${Uri.encodeComponent(collaborationIdentifier)}/privacybudgettemplates',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCollaborationPrivacyBudgetTemplatesOutput.fromJson(response);
  }

  /// Lists all members within a collaboration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [collaborationIdentifier] :
  /// The identifier of the collaboration in which the members are listed.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that are returned for an API request call.
  /// The service chooses a default number if you don't set one. The service
  /// might return a `nextToken` even if the `maxResults` value has not been
  /// met.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that's used to fetch the next set of results.
  Future<ListMembersOutput> listMembers({
    required String collaborationIdentifier,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/collaborations/${Uri.encodeComponent(collaborationIdentifier)}/members',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMembersOutput.fromJson(response);
  }

  /// Lists the schemas for relations within a collaboration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [collaborationIdentifier] :
  /// A unique identifier for the collaboration that the schema belongs to.
  /// Currently accepts a collaboration ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that are returned for an API request call.
  /// The service chooses a default number if you don't set one. The service
  /// might return a `nextToken` even if the `maxResults` value has not been
  /// met.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that's used to fetch the next set of results.
  ///
  /// Parameter [schemaType] :
  /// If present, filter schemas by schema type.
  Future<ListSchemasOutput> listSchemas({
    required String collaborationIdentifier,
    int? maxResults,
    String? nextToken,
    SchemaType? schemaType,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (schemaType != null) 'schemaType': [schemaType.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/collaborations/${Uri.encodeComponent(collaborationIdentifier)}/schemas',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSchemasOutput.fromJson(response);
  }

  /// Updates an existing collaboration change request. This operation allows
  /// approval actions for pending change requests in collaborations (APPROVE,
  /// DENY, CANCEL, COMMIT).
  ///
  /// For change requests without automatic approval, a member in the
  /// collaboration can manually APPROVE or DENY a change request. The
  /// collaboration owner can manually CANCEL or COMMIT a change request.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [action] :
  /// The action to perform on the change request. Valid values include APPROVE
  /// (approve the change), DENY (reject the change), CANCEL (cancel the
  /// request), and COMMIT (commit after the request is approved).
  ///
  /// For change requests without automatic approval, a member in the
  /// collaboration can manually APPROVE or DENY a change request. The
  /// collaboration owner can manually CANCEL or COMMIT a change request.
  ///
  /// Parameter [changeRequestIdentifier] :
  /// The unique identifier of the specific change request to be updated within
  /// the collaboration.
  ///
  /// Parameter [collaborationIdentifier] :
  /// The unique identifier of the collaboration that contains the change
  /// request to be updated.
  Future<UpdateCollaborationChangeRequestOutput>
      updateCollaborationChangeRequest({
    required ChangeRequestAction action,
    required String changeRequestIdentifier,
    required String collaborationIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'action': action.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/collaborations/${Uri.encodeComponent(collaborationIdentifier)}/changeRequests/${Uri.encodeComponent(changeRequestIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateCollaborationChangeRequestOutput.fromJson(response);
  }

  /// Provides the details necessary to create a configured audience model
  /// association.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [configuredAudienceModelArn] :
  /// A unique identifier for the configured audience model that you want to
  /// associate.
  ///
  /// Parameter [configuredAudienceModelAssociationName] :
  /// The name of the configured audience model association.
  ///
  /// Parameter [manageResourcePolicies] :
  /// When <code>TRUE</code>, indicates that the resource policy for the
  /// configured audience model resource being associated is configured for
  /// Clean Rooms to manage permissions related to the given collaboration. When
  /// <code>FALSE</code>, indicates that the configured audience model resource
  /// owner will manage permissions related to the given collaboration.
  ///
  /// Setting this to <code>TRUE</code> requires you to have permissions to
  /// create, update, and delete the resource policy for the
  /// <code>cleanrooms-ml</code> resource when you call the
  /// <a>DeleteConfiguredAudienceModelAssociation</a> resource. In addition, if
  /// you are the collaboration creator and specify <code>TRUE</code>, you must
  /// have the same permissions when you call the <a>DeleteMember</a> and
  /// <a>DeleteCollaboration</a> APIs.
  ///
  /// Parameter [membershipIdentifier] :
  /// A unique identifier for one of your memberships for a collaboration. The
  /// configured audience model is associated to the collaboration that this
  /// membership belongs to. Accepts a membership ID.
  ///
  /// Parameter [description] :
  /// A description of the configured audience model association.
  ///
  /// Parameter [tags] :
  /// An optional label that you can assign to a resource when you create it.
  /// Each tag consists of a key and an optional value, both of which you
  /// define. When you use tagging, you can also use tag-based access control in
  /// IAM policies to control access to this resource.
  Future<CreateConfiguredAudienceModelAssociationOutput>
      createConfiguredAudienceModelAssociation({
    required String configuredAudienceModelArn,
    required String configuredAudienceModelAssociationName,
    required bool manageResourcePolicies,
    required String membershipIdentifier,
    String? description,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'configuredAudienceModelArn': configuredAudienceModelArn,
      'configuredAudienceModelAssociationName':
          configuredAudienceModelAssociationName,
      'manageResourcePolicies': manageResourcePolicies,
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/configuredaudiencemodelassociations',
      exceptionFnMap: _exceptionFns,
    );
    return CreateConfiguredAudienceModelAssociationOutput.fromJson(response);
  }

  /// Returns information about a configured audience model association.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [configuredAudienceModelAssociationIdentifier] :
  /// A unique identifier for the configured audience model association that you
  /// want to retrieve.
  ///
  /// Parameter [membershipIdentifier] :
  /// A unique identifier for the membership that contains the configured
  /// audience model association that you want to retrieve.
  Future<GetConfiguredAudienceModelAssociationOutput>
      getConfiguredAudienceModelAssociation({
    required String configuredAudienceModelAssociationIdentifier,
    required String membershipIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/configuredaudiencemodelassociations/${Uri.encodeComponent(configuredAudienceModelAssociationIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetConfiguredAudienceModelAssociationOutput.fromJson(response);
  }

  /// Provides the details necessary to update a configured audience model
  /// association.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [configuredAudienceModelAssociationIdentifier] :
  /// A unique identifier for the configured audience model association that you
  /// want to update.
  ///
  /// Parameter [membershipIdentifier] :
  /// A unique identifier of the membership that contains the configured
  /// audience model association that you want to update.
  ///
  /// Parameter [description] :
  /// A new description for the configured audience model association.
  ///
  /// Parameter [name] :
  /// A new name for the configured audience model association.
  Future<UpdateConfiguredAudienceModelAssociationOutput>
      updateConfiguredAudienceModelAssociation({
    required String configuredAudienceModelAssociationIdentifier,
    required String membershipIdentifier,
    String? description,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (name != null) 'name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/configuredaudiencemodelassociations/${Uri.encodeComponent(configuredAudienceModelAssociationIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateConfiguredAudienceModelAssociationOutput.fromJson(response);
  }

  /// Provides the information necessary to delete a configured audience model
  /// association.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [configuredAudienceModelAssociationIdentifier] :
  /// A unique identifier of the configured audience model association that you
  /// want to delete.
  ///
  /// Parameter [membershipIdentifier] :
  /// A unique identifier of the membership that contains the audience model
  /// association that you want to delete.
  Future<void> deleteConfiguredAudienceModelAssociation({
    required String configuredAudienceModelAssociationIdentifier,
    required String membershipIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/configuredaudiencemodelassociations/${Uri.encodeComponent(configuredAudienceModelAssociationIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists information about requested configured audience model associations.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [membershipIdentifier] :
  /// A unique identifier for a membership that contains the configured audience
  /// model associations that you want to retrieve.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that are returned for an API request call.
  /// The service chooses a default number if you don't set one. The service
  /// might return a `nextToken` even if the `maxResults` value has not been
  /// met.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that's used to fetch the next set of results.
  Future<ListConfiguredAudienceModelAssociationsOutput>
      listConfiguredAudienceModelAssociations({
    required String membershipIdentifier,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/configuredaudiencemodelassociations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListConfiguredAudienceModelAssociationsOutput.fromJson(response);
  }

  /// Creates a configured table association. A configured table association
  /// links a configured table with a collaboration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [configuredTableIdentifier] :
  /// A unique identifier for the configured table to be associated to.
  /// Currently accepts a configured table ID.
  ///
  /// Parameter [membershipIdentifier] :
  /// A unique identifier for one of your memberships for a collaboration. The
  /// configured table is associated to the collaboration that this membership
  /// belongs to. Currently accepts a membership ID.
  ///
  /// Parameter [name] :
  /// The name of the configured table association. This name is used to query
  /// the underlying configured table.
  ///
  /// Parameter [roleArn] :
  /// The service will assume this role to access catalog metadata and query the
  /// table.
  ///
  /// Parameter [description] :
  /// A description for the configured table association.
  ///
  /// Parameter [tags] :
  /// An optional label that you can assign to a resource when you create it.
  /// Each tag consists of a key and an optional value, both of which you
  /// define. When you use tagging, you can also use tag-based access control in
  /// IAM policies to control access to this resource.
  Future<CreateConfiguredTableAssociationOutput>
      createConfiguredTableAssociation({
    required String configuredTableIdentifier,
    required String membershipIdentifier,
    required String name,
    required String roleArn,
    String? description,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'configuredTableIdentifier': configuredTableIdentifier,
      'name': name,
      'roleArn': roleArn,
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/configuredTableAssociations',
      exceptionFnMap: _exceptionFns,
    );
    return CreateConfiguredTableAssociationOutput.fromJson(response);
  }

  /// Retrieves a configured table association.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [configuredTableAssociationIdentifier] :
  /// The unique ID for the configured table association to retrieve. Currently
  /// accepts the configured table ID.
  ///
  /// Parameter [membershipIdentifier] :
  /// A unique identifier for the membership that the configured table
  /// association belongs to. Currently accepts the membership ID.
  Future<GetConfiguredTableAssociationOutput> getConfiguredTableAssociation({
    required String configuredTableAssociationIdentifier,
    required String membershipIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/configuredTableAssociations/${Uri.encodeComponent(configuredTableAssociationIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetConfiguredTableAssociationOutput.fromJson(response);
  }

  /// Updates a configured table association.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [configuredTableAssociationIdentifier] :
  /// The unique identifier for the configured table association to update.
  /// Currently accepts the configured table association ID.
  ///
  /// Parameter [membershipIdentifier] :
  /// The unique ID for the membership that the configured table association
  /// belongs to.
  ///
  /// Parameter [description] :
  /// A new description for the configured table association.
  ///
  /// Parameter [roleArn] :
  /// The service will assume this role to access catalog metadata and query the
  /// table.
  Future<UpdateConfiguredTableAssociationOutput>
      updateConfiguredTableAssociation({
    required String configuredTableAssociationIdentifier,
    required String membershipIdentifier,
    String? description,
    String? roleArn,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (roleArn != null) 'roleArn': roleArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/configuredTableAssociations/${Uri.encodeComponent(configuredTableAssociationIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateConfiguredTableAssociationOutput.fromJson(response);
  }

  /// Deletes a configured table association.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [configuredTableAssociationIdentifier] :
  /// The unique ID for the configured table association to be deleted.
  /// Currently accepts the configured table ID.
  ///
  /// Parameter [membershipIdentifier] :
  /// A unique identifier for the membership that the configured table
  /// association belongs to. Currently accepts the membership ID.
  Future<void> deleteConfiguredTableAssociation({
    required String configuredTableAssociationIdentifier,
    required String membershipIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/configuredTableAssociations/${Uri.encodeComponent(configuredTableAssociationIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists configured table associations for a membership.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [membershipIdentifier] :
  /// A unique identifier for the membership to list configured table
  /// associations for. Currently accepts the membership ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that are returned for an API request call.
  /// The service chooses a default number if you don't set one. The service
  /// might return a `nextToken` even if the `maxResults` value has not been
  /// met.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that's used to fetch the next set of results.
  Future<ListConfiguredTableAssociationsOutput>
      listConfiguredTableAssociations({
    required String membershipIdentifier,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/configuredTableAssociations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListConfiguredTableAssociationsOutput.fromJson(response);
  }

  /// Creates a new analysis rule for an associated configured table.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [analysisRulePolicy] :
  /// The analysis rule policy that was created for the configured table
  /// association.
  ///
  /// Parameter [analysisRuleType] :
  /// The type of analysis rule.
  ///
  /// Parameter [configuredTableAssociationIdentifier] :
  /// The unique ID for the configured table association. Currently accepts the
  /// configured table association ID.
  ///
  /// Parameter [membershipIdentifier] :
  /// A unique identifier for the membership that the configured table
  /// association belongs to. Currently accepts the membership ID.
  Future<CreateConfiguredTableAssociationAnalysisRuleOutput>
      createConfiguredTableAssociationAnalysisRule({
    required ConfiguredTableAssociationAnalysisRulePolicy analysisRulePolicy,
    required ConfiguredTableAssociationAnalysisRuleType analysisRuleType,
    required String configuredTableAssociationIdentifier,
    required String membershipIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'analysisRulePolicy': analysisRulePolicy,
      'analysisRuleType': analysisRuleType.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/configuredTableAssociations/${Uri.encodeComponent(configuredTableAssociationIdentifier)}/analysisRule',
      exceptionFnMap: _exceptionFns,
    );
    return CreateConfiguredTableAssociationAnalysisRuleOutput.fromJson(
        response);
  }

  /// Deletes an analysis rule for a configured table association.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [analysisRuleType] :
  /// The type of the analysis rule that you want to delete.
  ///
  /// Parameter [configuredTableAssociationIdentifier] :
  /// The identiﬁer for the conﬁgured table association that's related to the
  /// analysis rule that you want to delete.
  ///
  /// Parameter [membershipIdentifier] :
  /// A unique identifier for the membership that the configured table
  /// association belongs to. Currently accepts the membership ID.
  Future<void> deleteConfiguredTableAssociationAnalysisRule({
    required ConfiguredTableAssociationAnalysisRuleType analysisRuleType,
    required String configuredTableAssociationIdentifier,
    required String membershipIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/configuredTableAssociations/${Uri.encodeComponent(configuredTableAssociationIdentifier)}/analysisRule/${Uri.encodeComponent(analysisRuleType.value)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves the analysis rule for a configured table association.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [analysisRuleType] :
  /// The type of analysis rule that you want to retrieve.
  ///
  /// Parameter [configuredTableAssociationIdentifier] :
  /// The identiﬁer for the conﬁgured table association that's related to the
  /// analysis rule.
  ///
  /// Parameter [membershipIdentifier] :
  /// A unique identifier for the membership that the configured table
  /// association belongs to. Currently accepts the membership ID.
  Future<GetConfiguredTableAssociationAnalysisRuleOutput>
      getConfiguredTableAssociationAnalysisRule({
    required ConfiguredTableAssociationAnalysisRuleType analysisRuleType,
    required String configuredTableAssociationIdentifier,
    required String membershipIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/configuredTableAssociations/${Uri.encodeComponent(configuredTableAssociationIdentifier)}/analysisRule/${Uri.encodeComponent(analysisRuleType.value)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetConfiguredTableAssociationAnalysisRuleOutput.fromJson(response);
  }

  /// Updates the analysis rule for a configured table association.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [analysisRulePolicy] :
  /// The updated analysis rule policy for the conﬁgured table association.
  ///
  /// Parameter [analysisRuleType] :
  /// The analysis rule type that you want to update.
  ///
  /// Parameter [configuredTableAssociationIdentifier] :
  /// The identifier for the configured table association to update.
  ///
  /// Parameter [membershipIdentifier] :
  /// A unique identifier for the membership that the configured table
  /// association belongs to. Currently accepts the membership ID.
  Future<UpdateConfiguredTableAssociationAnalysisRuleOutput>
      updateConfiguredTableAssociationAnalysisRule({
    required ConfiguredTableAssociationAnalysisRulePolicy analysisRulePolicy,
    required ConfiguredTableAssociationAnalysisRuleType analysisRuleType,
    required String configuredTableAssociationIdentifier,
    required String membershipIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'analysisRulePolicy': analysisRulePolicy,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/configuredTableAssociations/${Uri.encodeComponent(configuredTableAssociationIdentifier)}/analysisRule/${Uri.encodeComponent(analysisRuleType.value)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateConfiguredTableAssociationAnalysisRuleOutput.fromJson(
        response);
  }

  /// Creates a new configured table resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [allowedColumns] :
  /// The columns of the underlying table that can be used by collaborations or
  /// analysis rules.
  ///
  /// Parameter [analysisMethod] :
  /// The analysis method allowed for the configured tables.
  ///
  /// <code>DIRECT_QUERY</code> allows SQL queries to be run directly on this
  /// table.
  ///
  /// <code>DIRECT_JOB</code> allows PySpark jobs to be run directly on this
  /// table.
  ///
  /// <code>MULTIPLE</code> allows both SQL queries and PySpark jobs to be run
  /// directly on this table.
  ///
  /// Parameter [name] :
  /// The name of the configured table.
  ///
  /// Parameter [tableReference] :
  /// A reference to the table being configured.
  ///
  /// Parameter [description] :
  /// A description for the configured table.
  ///
  /// Parameter [selectedAnalysisMethods] :
  /// The analysis methods to enable for the configured table. When configured,
  /// you must specify at least two analysis methods.
  ///
  /// Parameter [tags] :
  /// An optional label that you can assign to a resource when you create it.
  /// Each tag consists of a key and an optional value, both of which you
  /// define. When you use tagging, you can also use tag-based access control in
  /// IAM policies to control access to this resource.
  Future<CreateConfiguredTableOutput> createConfiguredTable({
    required List<String> allowedColumns,
    required AnalysisMethod analysisMethod,
    required String name,
    required TableReference tableReference,
    String? description,
    List<SelectedAnalysisMethod>? selectedAnalysisMethods,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'allowedColumns': allowedColumns,
      'analysisMethod': analysisMethod.value,
      'name': name,
      'tableReference': tableReference,
      if (description != null) 'description': description,
      if (selectedAnalysisMethods != null)
        'selectedAnalysisMethods':
            selectedAnalysisMethods.map((e) => e.value).toList(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/configuredTables',
      exceptionFnMap: _exceptionFns,
    );
    return CreateConfiguredTableOutput.fromJson(response);
  }

  /// Retrieves a configured table.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [configuredTableIdentifier] :
  /// The unique ID for the configured table to retrieve.
  Future<GetConfiguredTableOutput> getConfiguredTable({
    required String configuredTableIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/configuredTables/${Uri.encodeComponent(configuredTableIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetConfiguredTableOutput.fromJson(response);
  }

  /// Updates a configured table.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [configuredTableIdentifier] :
  /// The identifier for the configured table to update. Currently accepts the
  /// configured table ID.
  ///
  /// Parameter [allowedColumns] :
  /// The columns of the underlying table that can be used by collaborations or
  /// analysis rules.
  ///
  /// Parameter [analysisMethod] :
  /// The analysis method for the configured table.
  ///
  /// <code>DIRECT_QUERY</code> allows SQL queries to be run directly on this
  /// table.
  ///
  /// <code>DIRECT_JOB</code> allows PySpark jobs to be run directly on this
  /// table.
  ///
  /// <code>MULTIPLE</code> allows both SQL queries and PySpark jobs to be run
  /// directly on this table.
  ///
  /// Parameter [description] :
  /// A new description for the configured table.
  ///
  /// Parameter [name] :
  /// A new name for the configured table.
  ///
  /// Parameter [selectedAnalysisMethods] :
  /// The selected analysis methods for the table configuration update.
  Future<UpdateConfiguredTableOutput> updateConfiguredTable({
    required String configuredTableIdentifier,
    List<String>? allowedColumns,
    AnalysisMethod? analysisMethod,
    String? description,
    String? name,
    List<SelectedAnalysisMethod>? selectedAnalysisMethods,
    TableReference? tableReference,
  }) async {
    final $payload = <String, dynamic>{
      if (allowedColumns != null) 'allowedColumns': allowedColumns,
      if (analysisMethod != null) 'analysisMethod': analysisMethod.value,
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      if (selectedAnalysisMethods != null)
        'selectedAnalysisMethods':
            selectedAnalysisMethods.map((e) => e.value).toList(),
      if (tableReference != null) 'tableReference': tableReference,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/configuredTables/${Uri.encodeComponent(configuredTableIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateConfiguredTableOutput.fromJson(response);
  }

  /// Deletes a configured table.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [configuredTableIdentifier] :
  /// The unique ID for the configured table to delete.
  Future<void> deleteConfiguredTable({
    required String configuredTableIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/configuredTables/${Uri.encodeComponent(configuredTableIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists configured tables.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that are returned for an API request call.
  /// The service chooses a default number if you don't set one. The service
  /// might return a `nextToken` even if the `maxResults` value has not been
  /// met.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that's used to fetch the next set of results.
  Future<ListConfiguredTablesOutput> listConfiguredTables({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/configuredTables',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListConfiguredTablesOutput.fromJson(response);
  }

  /// Creates a new analysis rule for a configured table. Currently, only one
  /// analysis rule can be created for a given configured table.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [analysisRulePolicy] :
  /// The analysis rule policy that was created for the configured table.
  ///
  /// Parameter [analysisRuleType] :
  /// The type of analysis rule.
  ///
  /// Parameter [configuredTableIdentifier] :
  /// The identifier for the configured table to create the analysis rule for.
  /// Currently accepts the configured table ID.
  Future<CreateConfiguredTableAnalysisRuleOutput>
      createConfiguredTableAnalysisRule({
    required ConfiguredTableAnalysisRulePolicy analysisRulePolicy,
    required ConfiguredTableAnalysisRuleType analysisRuleType,
    required String configuredTableIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'analysisRulePolicy': analysisRulePolicy,
      'analysisRuleType': analysisRuleType.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/configuredTables/${Uri.encodeComponent(configuredTableIdentifier)}/analysisRule',
      exceptionFnMap: _exceptionFns,
    );
    return CreateConfiguredTableAnalysisRuleOutput.fromJson(response);
  }

  /// Deletes a configured table analysis rule.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [analysisRuleType] :
  /// The analysis rule type to be deleted. Configured table analysis rules are
  /// uniquely identified by their configured table identifier and analysis rule
  /// type.
  ///
  /// Parameter [configuredTableIdentifier] :
  /// The unique identifier for the configured table that the analysis rule
  /// applies to. Currently accepts the configured table ID.
  Future<void> deleteConfiguredTableAnalysisRule({
    required ConfiguredTableAnalysisRuleType analysisRuleType,
    required String configuredTableIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/configuredTables/${Uri.encodeComponent(configuredTableIdentifier)}/analysisRule/${Uri.encodeComponent(analysisRuleType.value)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves a configured table analysis rule.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [analysisRuleType] :
  /// The analysis rule to be retrieved. Configured table analysis rules are
  /// uniquely identified by their configured table identifier and analysis rule
  /// type.
  ///
  /// Parameter [configuredTableIdentifier] :
  /// The unique identifier for the configured table to retrieve. Currently
  /// accepts the configured table ID.
  Future<GetConfiguredTableAnalysisRuleOutput> getConfiguredTableAnalysisRule({
    required ConfiguredTableAnalysisRuleType analysisRuleType,
    required String configuredTableIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/configuredTables/${Uri.encodeComponent(configuredTableIdentifier)}/analysisRule/${Uri.encodeComponent(analysisRuleType.value)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetConfiguredTableAnalysisRuleOutput.fromJson(response);
  }

  /// Updates a configured table analysis rule.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [analysisRulePolicy] :
  /// The new analysis rule policy for the configured table analysis rule.
  ///
  /// Parameter [analysisRuleType] :
  /// The analysis rule type to be updated. Configured table analysis rules are
  /// uniquely identified by their configured table identifier and analysis rule
  /// type.
  ///
  /// Parameter [configuredTableIdentifier] :
  /// The unique identifier for the configured table that the analysis rule
  /// applies to. Currently accepts the configured table ID.
  Future<UpdateConfiguredTableAnalysisRuleOutput>
      updateConfiguredTableAnalysisRule({
    required ConfiguredTableAnalysisRulePolicy analysisRulePolicy,
    required ConfiguredTableAnalysisRuleType analysisRuleType,
    required String configuredTableIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'analysisRulePolicy': analysisRulePolicy,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/configuredTables/${Uri.encodeComponent(configuredTableIdentifier)}/analysisRule/${Uri.encodeComponent(analysisRuleType.value)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateConfiguredTableAnalysisRuleOutput.fromJson(response);
  }

  /// Creates an ID mapping table.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [inputReferenceConfig] :
  /// The input reference configuration needed to create the ID mapping table.
  ///
  /// Parameter [membershipIdentifier] :
  /// The unique identifier of the membership that contains the ID mapping
  /// table.
  ///
  /// Parameter [name] :
  /// A name for the ID mapping table.
  ///
  /// Parameter [description] :
  /// A description of the ID mapping table.
  ///
  /// Parameter [kmsKeyArn] :
  /// The Amazon Resource Name (ARN) of the Amazon Web Services KMS key. This
  /// value is used to encrypt the mapping table data that is stored by Clean
  /// Rooms.
  ///
  /// Parameter [tags] :
  /// An optional label that you can assign to a resource when you create it.
  /// Each tag consists of a key and an optional value, both of which you
  /// define. When you use tagging, you can also use tag-based access control in
  /// IAM policies to control access to this resource.
  Future<CreateIdMappingTableOutput> createIdMappingTable({
    required IdMappingTableInputReferenceConfig inputReferenceConfig,
    required String membershipIdentifier,
    required String name,
    String? description,
    String? kmsKeyArn,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'inputReferenceConfig': inputReferenceConfig,
      'name': name,
      if (description != null) 'description': description,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/idmappingtables',
      exceptionFnMap: _exceptionFns,
    );
    return CreateIdMappingTableOutput.fromJson(response);
  }

  /// Retrieves an ID mapping table.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [idMappingTableIdentifier] :
  /// The unique identifier of the ID mapping table identifier that you want to
  /// retrieve.
  ///
  /// Parameter [membershipIdentifier] :
  /// The unique identifier of the membership that contains the ID mapping table
  /// that you want to retrieve.
  Future<GetIdMappingTableOutput> getIdMappingTable({
    required String idMappingTableIdentifier,
    required String membershipIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/idmappingtables/${Uri.encodeComponent(idMappingTableIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetIdMappingTableOutput.fromJson(response);
  }

  /// Provides the details that are necessary to update an ID mapping table.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [idMappingTableIdentifier] :
  /// The unique identifier of the ID mapping table that you want to update.
  ///
  /// Parameter [membershipIdentifier] :
  /// The unique identifier of the membership that contains the ID mapping table
  /// that you want to update.
  ///
  /// Parameter [description] :
  /// A new description for the ID mapping table.
  ///
  /// Parameter [kmsKeyArn] :
  /// The Amazon Resource Name (ARN) of the Amazon Web Services KMS key.
  Future<UpdateIdMappingTableOutput> updateIdMappingTable({
    required String idMappingTableIdentifier,
    required String membershipIdentifier,
    String? description,
    String? kmsKeyArn,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/idmappingtables/${Uri.encodeComponent(idMappingTableIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateIdMappingTableOutput.fromJson(response);
  }

  /// Deletes an ID mapping table.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [idMappingTableIdentifier] :
  /// The unique identifier of the ID mapping table that you want to delete.
  ///
  /// Parameter [membershipIdentifier] :
  /// The unique identifier of the membership that contains the ID mapping table
  /// that you want to delete.
  Future<void> deleteIdMappingTable({
    required String idMappingTableIdentifier,
    required String membershipIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/idmappingtables/${Uri.encodeComponent(idMappingTableIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns a list of ID mapping tables.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [membershipIdentifier] :
  /// The unique identifier of the membership that contains the ID mapping
  /// tables that you want to view.
  ///
  /// Parameter [maxResults] :
  /// The maximum size of the results that is returned per call. Service chooses
  /// a default if it has not been set. Service may return a nextToken even if
  /// the maximum results has not been met.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that's used to fetch the next set of results.
  Future<ListIdMappingTablesOutput> listIdMappingTables({
    required String membershipIdentifier,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/idmappingtables',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListIdMappingTablesOutput.fromJson(response);
  }

  /// Defines the information that's necessary to populate an ID mapping table.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [idMappingTableIdentifier] :
  /// The unique identifier of the ID mapping table that you want to populate.
  ///
  /// Parameter [membershipIdentifier] :
  /// The unique identifier of the membership that contains the ID mapping table
  /// that you want to populate.
  ///
  /// Parameter [jobType] :
  /// The job type of the rule-based ID mapping job. Valid values include:
  ///
  /// <code>INCREMENTAL</code>: Processes only new or changed data since the
  /// last job run. This is the default job type if the ID mapping workflow was
  /// created in Entity Resolution with <code>incrementalRunConfig</code>
  /// specified.
  ///
  /// <code>BATCH</code>: Processes all data from the input source, regardless
  /// of previous job runs. This is the default job type if the ID mapping
  /// workflow was created in Entity Resolution but
  /// <code>incrementalRunConfig</code> wasn't specified.
  ///
  /// <code>DELETE_ONLY</code>: Processes only deletion requests from
  /// <code>BatchDeleteUniqueId</code>, which is set in Entity Resolution.
  ///
  /// For more information about <code>incrementalRunConfig</code> and
  /// <code>BatchDeleteUniqueId</code>, see the <a
  /// href="https://docs.aws.amazon.com/entityresolution/latest/apireference/Welcome.html">Entity
  /// Resolution API Reference</a>.
  Future<PopulateIdMappingTableOutput> populateIdMappingTable({
    required String idMappingTableIdentifier,
    required String membershipIdentifier,
    JobType? jobType,
  }) async {
    final $payload = <String, dynamic>{
      if (jobType != null) 'jobType': jobType.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/idmappingtables/${Uri.encodeComponent(idMappingTableIdentifier)}/populate',
      exceptionFnMap: _exceptionFns,
    );
    return PopulateIdMappingTableOutput.fromJson(response);
  }

  /// Creates an ID namespace association.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [inputReferenceConfig] :
  /// The input reference configuration needed to create the ID namespace
  /// association.
  ///
  /// Parameter [membershipIdentifier] :
  /// The unique identifier of the membership that contains the ID namespace
  /// association.
  ///
  /// Parameter [name] :
  /// The name for the ID namespace association.
  ///
  /// Parameter [description] :
  /// The description of the ID namespace association.
  ///
  /// Parameter [idMappingConfig] :
  /// The configuration settings for the ID mapping table.
  ///
  /// Parameter [tags] :
  /// An optional label that you can assign to a resource when you create it.
  /// Each tag consists of a key and an optional value, both of which you
  /// define. When you use tagging, you can also use tag-based access control in
  /// IAM policies to control access to this resource.
  Future<CreateIdNamespaceAssociationOutput> createIdNamespaceAssociation({
    required IdNamespaceAssociationInputReferenceConfig inputReferenceConfig,
    required String membershipIdentifier,
    required String name,
    String? description,
    IdMappingConfig? idMappingConfig,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'inputReferenceConfig': inputReferenceConfig,
      'name': name,
      if (description != null) 'description': description,
      if (idMappingConfig != null) 'idMappingConfig': idMappingConfig,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/idnamespaceassociations',
      exceptionFnMap: _exceptionFns,
    );
    return CreateIdNamespaceAssociationOutput.fromJson(response);
  }

  /// Retrieves an ID namespace association.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [idNamespaceAssociationIdentifier] :
  /// The unique identifier of the ID namespace association that you want to
  /// retrieve.
  ///
  /// Parameter [membershipIdentifier] :
  /// The unique identifier of the membership that contains the ID namespace
  /// association that you want to retrieve.
  Future<GetIdNamespaceAssociationOutput> getIdNamespaceAssociation({
    required String idNamespaceAssociationIdentifier,
    required String membershipIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/idnamespaceassociations/${Uri.encodeComponent(idNamespaceAssociationIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetIdNamespaceAssociationOutput.fromJson(response);
  }

  /// Provides the details that are necessary to update an ID namespace
  /// association.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [idNamespaceAssociationIdentifier] :
  /// The unique identifier of the ID namespace association that you want to
  /// update.
  ///
  /// Parameter [membershipIdentifier] :
  /// The unique identifier of the membership that contains the ID namespace
  /// association that you want to update.
  ///
  /// Parameter [description] :
  /// A new description for the ID namespace association.
  ///
  /// Parameter [idMappingConfig] :
  /// The configuration settings for the ID mapping table.
  ///
  /// Parameter [name] :
  /// A new name for the ID namespace association.
  Future<UpdateIdNamespaceAssociationOutput> updateIdNamespaceAssociation({
    required String idNamespaceAssociationIdentifier,
    required String membershipIdentifier,
    String? description,
    IdMappingConfig? idMappingConfig,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (idMappingConfig != null) 'idMappingConfig': idMappingConfig,
      if (name != null) 'name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/idnamespaceassociations/${Uri.encodeComponent(idNamespaceAssociationIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateIdNamespaceAssociationOutput.fromJson(response);
  }

  /// Deletes an ID namespace association.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [idNamespaceAssociationIdentifier] :
  /// The unique identifier of the ID namespace association that you want to
  /// delete.
  ///
  /// Parameter [membershipIdentifier] :
  /// The unique identifier of the membership that contains the ID namespace
  /// association that you want to delete.
  Future<void> deleteIdNamespaceAssociation({
    required String idNamespaceAssociationIdentifier,
    required String membershipIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/idnamespaceassociations/${Uri.encodeComponent(idNamespaceAssociationIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns a list of ID namespace associations.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [membershipIdentifier] :
  /// The unique identifier of the membership that contains the ID namespace
  /// association that you want to view.
  ///
  /// Parameter [maxResults] :
  /// The maximum size of the results that is returned per call. Service chooses
  /// a default if it has not been set. Service may return a nextToken even if
  /// the maximum results has not been met.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that's used to fetch the next set of results.
  Future<ListIdNamespaceAssociationsOutput> listIdNamespaceAssociations({
    required String membershipIdentifier,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/idnamespaceassociations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListIdNamespaceAssociationsOutput.fromJson(response);
  }

  /// Creates a membership for a specific collaboration identifier and joins the
  /// collaboration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [collaborationIdentifier] :
  /// The unique ID for the associated collaboration.
  ///
  /// Parameter [queryLogStatus] :
  /// An indicator as to whether query logging has been enabled or disabled for
  /// the membership.
  ///
  /// When <code>ENABLED</code>, Clean Rooms logs details about queries run
  /// within this collaboration and those logs can be viewed in Amazon
  /// CloudWatch Logs. The default value is <code>DISABLED</code>.
  ///
  /// Parameter [defaultJobResultConfiguration] :
  /// The default job result configuration that determines how job results are
  /// protected and managed within this membership. This configuration applies
  /// to all jobs.
  ///
  /// Parameter [defaultResultConfiguration] :
  /// The default protected query result configuration as specified by the
  /// member who can receive results.
  ///
  /// Parameter [isMetricsEnabled] :
  /// An indicator as to whether Amazon CloudWatch metrics have been enabled or
  /// disabled for the membership.
  ///
  /// Amazon CloudWatch metrics are only available when the collaboration has
  /// metrics enabled. This option can be set by collaboration members who have
  /// the ability to run queries (analysis runners) or by members who are
  /// configured as payers.
  ///
  /// When <code>true</code>, metrics about query execution are collected in
  /// Amazon CloudWatch. The default value is <code>false</code>.
  ///
  /// Parameter [jobLogStatus] :
  /// An indicator as to whether job logging has been enabled or disabled for
  /// the collaboration.
  ///
  /// When <code>ENABLED</code>, Clean Rooms logs details about jobs run within
  /// this collaboration and those logs can be viewed in Amazon CloudWatch Logs.
  /// The default value is <code>DISABLED</code>.
  ///
  /// Parameter [paymentConfiguration] :
  /// The payment responsibilities accepted by the collaboration member.
  ///
  /// Not required if the collaboration member has the member ability to run
  /// queries.
  ///
  /// Required if the collaboration member doesn't have the member ability to
  /// run queries but is configured as a payer by the collaboration creator.
  ///
  /// Parameter [tags] :
  /// An optional label that you can assign to a resource when you create it.
  /// Each tag consists of a key and an optional value, both of which you
  /// define. When you use tagging, you can also use tag-based access control in
  /// IAM policies to control access to this resource.
  Future<CreateMembershipOutput> createMembership({
    required String collaborationIdentifier,
    required MembershipQueryLogStatus queryLogStatus,
    MembershipProtectedJobResultConfiguration? defaultJobResultConfiguration,
    MembershipProtectedQueryResultConfiguration? defaultResultConfiguration,
    bool? isMetricsEnabled,
    MembershipJobLogStatus? jobLogStatus,
    MembershipPaymentConfiguration? paymentConfiguration,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'collaborationIdentifier': collaborationIdentifier,
      'queryLogStatus': queryLogStatus.value,
      if (defaultJobResultConfiguration != null)
        'defaultJobResultConfiguration': defaultJobResultConfiguration,
      if (defaultResultConfiguration != null)
        'defaultResultConfiguration': defaultResultConfiguration,
      if (isMetricsEnabled != null) 'isMetricsEnabled': isMetricsEnabled,
      if (jobLogStatus != null) 'jobLogStatus': jobLogStatus.value,
      if (paymentConfiguration != null)
        'paymentConfiguration': paymentConfiguration,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/memberships',
      exceptionFnMap: _exceptionFns,
    );
    return CreateMembershipOutput.fromJson(response);
  }

  /// Retrieves a specified membership for an identifier.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [membershipIdentifier] :
  /// The identifier for a membership resource.
  Future<GetMembershipOutput> getMembership({
    required String membershipIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/memberships/${Uri.encodeComponent(membershipIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetMembershipOutput.fromJson(response);
  }

  /// Updates a membership.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [membershipIdentifier] :
  /// The unique identifier of the membership.
  ///
  /// Parameter [defaultJobResultConfiguration] :
  /// The default job result configuration.
  ///
  /// Parameter [defaultResultConfiguration] :
  /// The default protected query result configuration as specified by the
  /// member who can receive results.
  ///
  /// Parameter [jobLogStatus] :
  /// An indicator as to whether job logging has been enabled or disabled for
  /// the collaboration.
  ///
  /// When <code>ENABLED</code>, Clean Rooms logs details about jobs run within
  /// this collaboration and those logs can be viewed in Amazon CloudWatch Logs.
  /// The default value is <code>DISABLED</code>.
  ///
  /// Parameter [membershipPaymentConfiguration] :
  /// The payment configuration to update for the membership.
  ///
  /// Parameter [queryLogStatus] :
  /// An indicator as to whether query logging has been enabled or disabled for
  /// the membership.
  ///
  /// When <code>ENABLED</code>, Clean Rooms logs details about queries run
  /// within this collaboration and those logs can be viewed in Amazon
  /// CloudWatch Logs. The default value is <code>DISABLED</code>.
  Future<UpdateMembershipOutput> updateMembership({
    required String membershipIdentifier,
    MembershipProtectedJobResultConfiguration? defaultJobResultConfiguration,
    MembershipProtectedQueryResultConfiguration? defaultResultConfiguration,
    MembershipJobLogStatus? jobLogStatus,
    UpdateMembershipPaymentConfiguration? membershipPaymentConfiguration,
    MembershipQueryLogStatus? queryLogStatus,
  }) async {
    final $payload = <String, dynamic>{
      if (defaultJobResultConfiguration != null)
        'defaultJobResultConfiguration': defaultJobResultConfiguration,
      if (defaultResultConfiguration != null)
        'defaultResultConfiguration': defaultResultConfiguration,
      if (jobLogStatus != null) 'jobLogStatus': jobLogStatus.value,
      if (membershipPaymentConfiguration != null)
        'membershipPaymentConfiguration': membershipPaymentConfiguration,
      if (queryLogStatus != null) 'queryLogStatus': queryLogStatus.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/memberships/${Uri.encodeComponent(membershipIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateMembershipOutput.fromJson(response);
  }

  /// Deletes a specified membership. All resources under a membership must be
  /// deleted.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [membershipIdentifier] :
  /// The identifier for a membership resource.
  Future<void> deleteMembership({
    required String membershipIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/memberships/${Uri.encodeComponent(membershipIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists all memberships resources within the caller's account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that are returned for an API request call.
  /// The service chooses a default number if you don't set one. The service
  /// might return a `nextToken` even if the `maxResults` value has not been
  /// met.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that's used to fetch the next set of results.
  ///
  /// Parameter [status] :
  /// A filter which will return only memberships in the specified status.
  Future<ListMembershipsOutput> listMemberships({
    int? maxResults,
    String? nextToken,
    MembershipStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (status != null) 'status': [status.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/memberships',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMembershipsOutput.fromJson(response);
  }

  /// Returns job processing metadata.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [membershipIdentifier] :
  /// The identifier for a membership in a protected job instance.
  ///
  /// Parameter [protectedJobIdentifier] :
  /// The identifier for the protected job instance.
  Future<GetProtectedJobOutput> getProtectedJob({
    required String membershipIdentifier,
    required String protectedJobIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/protectedJobs/${Uri.encodeComponent(protectedJobIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetProtectedJobOutput.fromJson(response);
  }

  /// Returns query processing metadata.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [membershipIdentifier] :
  /// The identifier for a membership in a protected query instance.
  ///
  /// Parameter [protectedQueryIdentifier] :
  /// The identifier for a protected query instance.
  Future<GetProtectedQueryOutput> getProtectedQuery({
    required String membershipIdentifier,
    required String protectedQueryIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/protectedQueries/${Uri.encodeComponent(protectedQueryIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetProtectedQueryOutput.fromJson(response);
  }

  /// Returns detailed information about the privacy budgets in a specified
  /// membership.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [membershipIdentifier] :
  /// A unique identifier for one of your memberships for a collaboration. The
  /// privacy budget is retrieved from the collaboration that this membership
  /// belongs to. Accepts a membership ID.
  ///
  /// Parameter [privacyBudgetType] :
  /// The privacy budget type.
  ///
  /// Parameter [accessBudgetResourceArn] :
  /// The Amazon Resource Name (ARN) of the access budget resource to filter
  /// privacy budgets by.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that are returned for an API request call.
  /// The service chooses a default number if you don't set one. The service
  /// might return a `nextToken` even if the `maxResults` value has not been
  /// met.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that's used to fetch the next set of results.
  Future<ListPrivacyBudgetsOutput> listPrivacyBudgets({
    required String membershipIdentifier,
    required PrivacyBudgetType privacyBudgetType,
    String? accessBudgetResourceArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      'privacyBudgetType': [privacyBudgetType.value],
      if (accessBudgetResourceArn != null)
        'accessBudgetResourceArn': [accessBudgetResourceArn],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/privacybudgets',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPrivacyBudgetsOutput.fromJson(response);
  }

  /// Lists protected jobs, sorted by most recent job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [membershipIdentifier] :
  /// The identifier for the membership in the collaboration.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that are returned for an API request call.
  /// The service chooses a default number if you don't set one. The service
  /// might return a `nextToken` even if the `maxResults` value has not been
  /// met.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that's used to fetch the next set of results.
  ///
  /// Parameter [status] :
  /// A filter on the status of the protected job.
  Future<ListProtectedJobsOutput> listProtectedJobs({
    required String membershipIdentifier,
    int? maxResults,
    String? nextToken,
    ProtectedJobStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (status != null) 'status': [status.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/protectedJobs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListProtectedJobsOutput.fromJson(response);
  }

  /// Lists protected queries, sorted by the most recent query.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [membershipIdentifier] :
  /// The identifier for the membership in the collaboration.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that are returned for an API request call.
  /// The service chooses a default number if you don't set one. The service
  /// might return a `nextToken` even if the `maxResults` value has not been
  /// met.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that's used to fetch the next set of results.
  ///
  /// Parameter [status] :
  /// A filter on the status of the protected query.
  Future<ListProtectedQueriesOutput> listProtectedQueries({
    required String membershipIdentifier,
    int? maxResults,
    String? nextToken,
    ProtectedQueryStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (status != null) 'status': [status.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/protectedQueries',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListProtectedQueriesOutput.fromJson(response);
  }

  /// An estimate of the number of aggregation functions that the member who can
  /// query can run given epsilon and noise parameters.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [membershipIdentifier] :
  /// A unique identifier for one of your memberships for a collaboration.
  /// Accepts a membership ID.
  ///
  /// Parameter [parameters] :
  /// Specifies the desired epsilon and noise parameters to preview.
  Future<PreviewPrivacyImpactOutput> previewPrivacyImpact({
    required String membershipIdentifier,
    required PreviewPrivacyImpactParametersInput parameters,
  }) async {
    final $payload = <String, dynamic>{
      'parameters': parameters,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/previewprivacyimpact',
      exceptionFnMap: _exceptionFns,
    );
    return PreviewPrivacyImpactOutput.fromJson(response);
  }

  /// Creates a protected job that is started by Clean Rooms.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [jobParameters] :
  /// The job parameters.
  ///
  /// Parameter [membershipIdentifier] :
  /// A unique identifier for the membership to run this job against. Currently
  /// accepts a membership ID.
  ///
  /// Parameter [type] :
  /// The type of protected job to start.
  ///
  /// Parameter [computeConfiguration] :
  /// The compute configuration for the protected job.
  ///
  /// Parameter [jobComputePayerAccountId] :
  /// The account ID of the member that pays for the job compute costs.
  ///
  /// Parameter [resultConfiguration] :
  /// The details needed to write the job results.
  Future<StartProtectedJobOutput> startProtectedJob({
    required ProtectedJobParameters jobParameters,
    required String membershipIdentifier,
    required ProtectedJobType type,
    ProtectedJobComputeConfiguration? computeConfiguration,
    String? jobComputePayerAccountId,
    ProtectedJobResultConfigurationInput? resultConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      'jobParameters': jobParameters,
      'type': type.value,
      if (computeConfiguration != null)
        'computeConfiguration': computeConfiguration,
      if (jobComputePayerAccountId != null)
        'jobComputePayerAccountId': jobComputePayerAccountId,
      if (resultConfiguration != null)
        'resultConfiguration': resultConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/protectedJobs',
      exceptionFnMap: _exceptionFns,
    );
    return StartProtectedJobOutput.fromJson(response);
  }

  /// Creates a protected query that is started by Clean Rooms.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [membershipIdentifier] :
  /// A unique identifier for the membership to run this query against.
  /// Currently accepts a membership ID.
  ///
  /// Parameter [sqlParameters] :
  /// The protected SQL query parameters.
  ///
  /// Parameter [type] :
  /// The type of the protected query to be started.
  ///
  /// Parameter [computeConfiguration] :
  /// The compute configuration for the protected query.
  ///
  /// Parameter [queryComputePayerAccountId] :
  /// The account ID of the member that pays for the query compute costs.
  ///
  /// Parameter [resultConfiguration] :
  /// The details needed to write the query results.
  Future<StartProtectedQueryOutput> startProtectedQuery({
    required String membershipIdentifier,
    required ProtectedQuerySQLParameters sqlParameters,
    required ProtectedQueryType type,
    ComputeConfiguration? computeConfiguration,
    String? queryComputePayerAccountId,
    ProtectedQueryResultConfiguration? resultConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      'sqlParameters': sqlParameters,
      'type': type.value,
      if (computeConfiguration != null)
        'computeConfiguration': computeConfiguration,
      if (queryComputePayerAccountId != null)
        'queryComputePayerAccountId': queryComputePayerAccountId,
      if (resultConfiguration != null)
        'resultConfiguration': resultConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/protectedQueries',
      exceptionFnMap: _exceptionFns,
    );
    return StartProtectedQueryOutput.fromJson(response);
  }

  /// Updates the processing of a currently running job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [membershipIdentifier] :
  /// The identifier for a member of a protected job instance.
  ///
  /// Parameter [protectedJobIdentifier] :
  /// The identifier of the protected job to update.
  ///
  /// Parameter [targetStatus] :
  /// The target status of a protected job. Used to update the execution status
  /// of a currently running job.
  Future<UpdateProtectedJobOutput> updateProtectedJob({
    required String membershipIdentifier,
    required String protectedJobIdentifier,
    required TargetProtectedJobStatus targetStatus,
  }) async {
    final $payload = <String, dynamic>{
      'targetStatus': targetStatus.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/protectedJobs/${Uri.encodeComponent(protectedJobIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateProtectedJobOutput.fromJson(response);
  }

  /// Updates the processing of a currently running query.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [membershipIdentifier] :
  /// The identifier for a member of a protected query instance.
  ///
  /// Parameter [protectedQueryIdentifier] :
  /// The identifier for a protected query instance.
  ///
  /// Parameter [targetStatus] :
  /// The target status of a query. Used to update the execution status of a
  /// currently running query.
  Future<UpdateProtectedQueryOutput> updateProtectedQuery({
    required String membershipIdentifier,
    required String protectedQueryIdentifier,
    required TargetProtectedQueryStatus targetStatus,
  }) async {
    final $payload = <String, dynamic>{
      'targetStatus': targetStatus.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/protectedQueries/${Uri.encodeComponent(protectedQueryIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateProtectedQueryOutput.fromJson(response);
  }

  /// Creates a privacy budget template for a specified collaboration. Each
  /// collaboration can have only one privacy budget template. If you need to
  /// change the privacy budget template, use the
  /// <a>UpdatePrivacyBudgetTemplate</a> operation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [membershipIdentifier] :
  /// A unique identifier for one of your memberships for a collaboration. The
  /// privacy budget template is created in the collaboration that this
  /// membership belongs to. Accepts a membership ID.
  ///
  /// Parameter [parameters] :
  /// Specifies your parameters for the privacy budget template.
  ///
  /// Parameter [privacyBudgetType] :
  /// Specifies the type of the privacy budget template.
  ///
  /// Parameter [autoRefresh] :
  /// How often the privacy budget refreshes.
  /// <important>
  /// If you plan to regularly bring new data into the collaboration, you can
  /// use <code>CALENDAR_MONTH</code> to automatically get a new privacy budget
  /// for the collaboration every calendar month. Choosing this option allows
  /// arbitrary amounts of information to be revealed about rows of the data
  /// when repeatedly queries across refreshes. Avoid choosing this if the same
  /// rows will be repeatedly queried between privacy budget refreshes.
  /// </important>
  ///
  /// Parameter [tags] :
  /// An optional label that you can assign to a resource when you create it.
  /// Each tag consists of a key and an optional value, both of which you
  /// define. When you use tagging, you can also use tag-based access control in
  /// IAM policies to control access to this resource.
  Future<CreatePrivacyBudgetTemplateOutput> createPrivacyBudgetTemplate({
    required String membershipIdentifier,
    required PrivacyBudgetTemplateParametersInput parameters,
    required PrivacyBudgetType privacyBudgetType,
    PrivacyBudgetTemplateAutoRefresh? autoRefresh,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'parameters': parameters,
      'privacyBudgetType': privacyBudgetType.value,
      if (autoRefresh != null) 'autoRefresh': autoRefresh.value,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/privacybudgettemplates',
      exceptionFnMap: _exceptionFns,
    );
    return CreatePrivacyBudgetTemplateOutput.fromJson(response);
  }

  /// Returns details for a specified privacy budget template.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [membershipIdentifier] :
  /// A unique identifier for one of your memberships for a collaboration. The
  /// privacy budget template is retrieved from the collaboration that this
  /// membership belongs to. Accepts a membership ID.
  ///
  /// Parameter [privacyBudgetTemplateIdentifier] :
  /// A unique identifier for your privacy budget template.
  Future<GetPrivacyBudgetTemplateOutput> getPrivacyBudgetTemplate({
    required String membershipIdentifier,
    required String privacyBudgetTemplateIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/privacybudgettemplates/${Uri.encodeComponent(privacyBudgetTemplateIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetPrivacyBudgetTemplateOutput.fromJson(response);
  }

  /// Updates the privacy budget template for the specified collaboration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [membershipIdentifier] :
  /// A unique identifier for one of your memberships for a collaboration. The
  /// privacy budget template is updated in the collaboration that this
  /// membership belongs to. Accepts a membership ID.
  ///
  /// Parameter [privacyBudgetTemplateIdentifier] :
  /// A unique identifier for your privacy budget template that you want to
  /// update.
  ///
  /// Parameter [privacyBudgetType] :
  /// Specifies the type of the privacy budget template.
  ///
  /// Parameter [parameters] :
  /// Specifies the epsilon and noise parameters for the privacy budget
  /// template.
  Future<UpdatePrivacyBudgetTemplateOutput> updatePrivacyBudgetTemplate({
    required String membershipIdentifier,
    required String privacyBudgetTemplateIdentifier,
    required PrivacyBudgetType privacyBudgetType,
    PrivacyBudgetTemplateUpdateParameters? parameters,
  }) async {
    final $payload = <String, dynamic>{
      'privacyBudgetType': privacyBudgetType.value,
      if (parameters != null) 'parameters': parameters,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/privacybudgettemplates/${Uri.encodeComponent(privacyBudgetTemplateIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdatePrivacyBudgetTemplateOutput.fromJson(response);
  }

  /// Deletes a privacy budget template for a specified collaboration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [membershipIdentifier] :
  /// A unique identifier for one of your memberships for a collaboration. The
  /// privacy budget template is deleted from the collaboration that this
  /// membership belongs to. Accepts a membership ID.
  ///
  /// Parameter [privacyBudgetTemplateIdentifier] :
  /// A unique identifier for your privacy budget template.
  Future<void> deletePrivacyBudgetTemplate({
    required String membershipIdentifier,
    required String privacyBudgetTemplateIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/privacybudgettemplates/${Uri.encodeComponent(privacyBudgetTemplateIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns detailed information about the privacy budget templates in a
  /// specified membership.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [membershipIdentifier] :
  /// A unique identifier for one of your memberships for a collaboration. The
  /// privacy budget templates are retrieved from the collaboration that this
  /// membership belongs to. Accepts a membership ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that are returned for an API request call.
  /// The service chooses a default number if you don't set one. The service
  /// might return a `nextToken` even if the `maxResults` value has not been
  /// met.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that's used to fetch the next set of results.
  Future<ListPrivacyBudgetTemplatesOutput> listPrivacyBudgetTemplates({
    required String membershipIdentifier,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/privacybudgettemplates',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPrivacyBudgetTemplatesOutput.fromJson(response);
  }
}

/// @nodoc
class ListTagsForResourceOutput {
  /// A map of objects specifying each key name and value.
  final Map<String, String> tags;

  ListTagsForResourceOutput({
    required this.tags,
  });

  factory ListTagsForResourceOutput.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceOutput(
      tags:
          ((json['tags'] as Map<String, dynamic>?) ?? const <String, dynamic>{})
              .map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      'tags': tags,
    };
  }
}

/// @nodoc
class TagResourceOutput {
  TagResourceOutput();

  factory TagResourceOutput.fromJson(Map<String, dynamic> _) {
    return TagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UntagResourceOutput {
  UntagResourceOutput();

  factory UntagResourceOutput.fromJson(Map<String, dynamic> _) {
    return UntagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class CreateAnalysisTemplateOutput {
  /// The analysis template.
  final AnalysisTemplate analysisTemplate;

  CreateAnalysisTemplateOutput({
    required this.analysisTemplate,
  });

  factory CreateAnalysisTemplateOutput.fromJson(Map<String, dynamic> json) {
    return CreateAnalysisTemplateOutput(
      analysisTemplate: AnalysisTemplate.fromJson(
          (json['analysisTemplate'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final analysisTemplate = this.analysisTemplate;
    return {
      'analysisTemplate': analysisTemplate,
    };
  }
}

/// @nodoc
class GetAnalysisTemplateOutput {
  /// The analysis template.
  final AnalysisTemplate analysisTemplate;

  GetAnalysisTemplateOutput({
    required this.analysisTemplate,
  });

  factory GetAnalysisTemplateOutput.fromJson(Map<String, dynamic> json) {
    return GetAnalysisTemplateOutput(
      analysisTemplate: AnalysisTemplate.fromJson(
          (json['analysisTemplate'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final analysisTemplate = this.analysisTemplate;
    return {
      'analysisTemplate': analysisTemplate,
    };
  }
}

/// @nodoc
class UpdateAnalysisTemplateOutput {
  /// The analysis template.
  final AnalysisTemplate analysisTemplate;

  UpdateAnalysisTemplateOutput({
    required this.analysisTemplate,
  });

  factory UpdateAnalysisTemplateOutput.fromJson(Map<String, dynamic> json) {
    return UpdateAnalysisTemplateOutput(
      analysisTemplate: AnalysisTemplate.fromJson(
          (json['analysisTemplate'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final analysisTemplate = this.analysisTemplate;
    return {
      'analysisTemplate': analysisTemplate,
    };
  }
}

/// @nodoc
class DeleteAnalysisTemplateOutput {
  DeleteAnalysisTemplateOutput();

  factory DeleteAnalysisTemplateOutput.fromJson(Map<String, dynamic> _) {
    return DeleteAnalysisTemplateOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListAnalysisTemplatesOutput {
  /// Lists analysis template metadata.
  final List<AnalysisTemplateSummary> analysisTemplateSummaries;

  /// The pagination token that's used to fetch the next set of results.
  final String? nextToken;

  ListAnalysisTemplatesOutput({
    required this.analysisTemplateSummaries,
    this.nextToken,
  });

  factory ListAnalysisTemplatesOutput.fromJson(Map<String, dynamic> json) {
    return ListAnalysisTemplatesOutput(
      analysisTemplateSummaries:
          ((json['analysisTemplateSummaries'] as List?) ?? const [])
              .nonNulls
              .map((e) =>
                  AnalysisTemplateSummary.fromJson(e as Map<String, dynamic>))
              .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final analysisTemplateSummaries = this.analysisTemplateSummaries;
    final nextToken = this.nextToken;
    return {
      'analysisTemplateSummaries': analysisTemplateSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class CreateCollaborationOutput {
  /// The collaboration.
  final Collaboration collaboration;

  CreateCollaborationOutput({
    required this.collaboration,
  });

  factory CreateCollaborationOutput.fromJson(Map<String, dynamic> json) {
    return CreateCollaborationOutput(
      collaboration: Collaboration.fromJson(
          (json['collaboration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final collaboration = this.collaboration;
    return {
      'collaboration': collaboration,
    };
  }
}

/// @nodoc
class GetCollaborationOutput {
  /// The entire collaboration for this identifier.
  final Collaboration collaboration;

  GetCollaborationOutput({
    required this.collaboration,
  });

  factory GetCollaborationOutput.fromJson(Map<String, dynamic> json) {
    return GetCollaborationOutput(
      collaboration: Collaboration.fromJson(
          (json['collaboration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final collaboration = this.collaboration;
    return {
      'collaboration': collaboration,
    };
  }
}

/// @nodoc
class UpdateCollaborationOutput {
  /// The entire collaboration that has been updated.
  final Collaboration collaboration;

  UpdateCollaborationOutput({
    required this.collaboration,
  });

  factory UpdateCollaborationOutput.fromJson(Map<String, dynamic> json) {
    return UpdateCollaborationOutput(
      collaboration: Collaboration.fromJson(
          (json['collaboration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final collaboration = this.collaboration;
    return {
      'collaboration': collaboration,
    };
  }
}

/// @nodoc
class DeleteCollaborationOutput {
  DeleteCollaborationOutput();

  factory DeleteCollaborationOutput.fromJson(Map<String, dynamic> _) {
    return DeleteCollaborationOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListCollaborationsOutput {
  /// The list of collaborations.
  final List<CollaborationSummary> collaborationList;

  /// The pagination token that's used to fetch the next set of results.
  final String? nextToken;

  ListCollaborationsOutput({
    required this.collaborationList,
    this.nextToken,
  });

  factory ListCollaborationsOutput.fromJson(Map<String, dynamic> json) {
    return ListCollaborationsOutput(
      collaborationList: ((json['collaborationList'] as List?) ?? const [])
          .nonNulls
          .map((e) => CollaborationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final collaborationList = this.collaborationList;
    final nextToken = this.nextToken;
    return {
      'collaborationList': collaborationList,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class BatchGetCollaborationAnalysisTemplateOutput {
  /// The retrieved list of analysis templates within a collaboration.
  final List<CollaborationAnalysisTemplate> collaborationAnalysisTemplates;

  /// Error reasons for collaboration analysis templates that could not be
  /// retrieved. One error is returned for every collaboration analysis template
  /// that could not be retrieved.
  final List<BatchGetCollaborationAnalysisTemplateError> errors;

  BatchGetCollaborationAnalysisTemplateOutput({
    required this.collaborationAnalysisTemplates,
    required this.errors,
  });

  factory BatchGetCollaborationAnalysisTemplateOutput.fromJson(
      Map<String, dynamic> json) {
    return BatchGetCollaborationAnalysisTemplateOutput(
      collaborationAnalysisTemplates: ((json['collaborationAnalysisTemplates']
                  as List?) ??
              const [])
          .nonNulls
          .map((e) =>
              CollaborationAnalysisTemplate.fromJson(e as Map<String, dynamic>))
          .toList(),
      errors: ((json['errors'] as List?) ?? const [])
          .nonNulls
          .map((e) => BatchGetCollaborationAnalysisTemplateError.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final collaborationAnalysisTemplates = this.collaborationAnalysisTemplates;
    final errors = this.errors;
    return {
      'collaborationAnalysisTemplates': collaborationAnalysisTemplates,
      'errors': errors,
    };
  }
}

/// @nodoc
class BatchGetSchemaOutput {
  /// Error reasons for schemas that could not be retrieved. One error is returned
  /// for every schema that could not be retrieved.
  final List<BatchGetSchemaError> errors;

  /// The retrieved list of schemas.
  final List<Schema> schemas;

  BatchGetSchemaOutput({
    required this.errors,
    required this.schemas,
  });

  factory BatchGetSchemaOutput.fromJson(Map<String, dynamic> json) {
    return BatchGetSchemaOutput(
      errors: ((json['errors'] as List?) ?? const [])
          .nonNulls
          .map((e) => BatchGetSchemaError.fromJson(e as Map<String, dynamic>))
          .toList(),
      schemas: ((json['schemas'] as List?) ?? const [])
          .nonNulls
          .map((e) => Schema.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final schemas = this.schemas;
    return {
      'errors': errors,
      'schemas': schemas,
    };
  }
}

/// @nodoc
class BatchGetSchemaAnalysisRuleOutput {
  /// The retrieved list of analysis rules.
  final List<AnalysisRule> analysisRules;

  /// Error reasons for schemas that could not be retrieved. One error is returned
  /// for every schema that could not be retrieved.
  final List<BatchGetSchemaAnalysisRuleError> errors;

  BatchGetSchemaAnalysisRuleOutput({
    required this.analysisRules,
    required this.errors,
  });

  factory BatchGetSchemaAnalysisRuleOutput.fromJson(Map<String, dynamic> json) {
    return BatchGetSchemaAnalysisRuleOutput(
      analysisRules: ((json['analysisRules'] as List?) ?? const [])
          .nonNulls
          .map((e) => AnalysisRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      errors: ((json['errors'] as List?) ?? const [])
          .nonNulls
          .map((e) => BatchGetSchemaAnalysisRuleError.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final analysisRules = this.analysisRules;
    final errors = this.errors;
    return {
      'analysisRules': analysisRules,
      'errors': errors,
    };
  }
}

/// @nodoc
class CreateCollaborationChangeRequestOutput {
  final CollaborationChangeRequest collaborationChangeRequest;

  CreateCollaborationChangeRequestOutput({
    required this.collaborationChangeRequest,
  });

  factory CreateCollaborationChangeRequestOutput.fromJson(
      Map<String, dynamic> json) {
    return CreateCollaborationChangeRequestOutput(
      collaborationChangeRequest: CollaborationChangeRequest.fromJson(
          (json['collaborationChangeRequest'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final collaborationChangeRequest = this.collaborationChangeRequest;
    return {
      'collaborationChangeRequest': collaborationChangeRequest,
    };
  }
}

/// @nodoc
class DeleteMemberOutput {
  DeleteMemberOutput();

  factory DeleteMemberOutput.fromJson(Map<String, dynamic> _) {
    return DeleteMemberOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class GetCollaborationAnalysisTemplateOutput {
  /// The analysis template within a collaboration.
  final CollaborationAnalysisTemplate collaborationAnalysisTemplate;

  GetCollaborationAnalysisTemplateOutput({
    required this.collaborationAnalysisTemplate,
  });

  factory GetCollaborationAnalysisTemplateOutput.fromJson(
      Map<String, dynamic> json) {
    return GetCollaborationAnalysisTemplateOutput(
      collaborationAnalysisTemplate: CollaborationAnalysisTemplate.fromJson(
          (json['collaborationAnalysisTemplate'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final collaborationAnalysisTemplate = this.collaborationAnalysisTemplate;
    return {
      'collaborationAnalysisTemplate': collaborationAnalysisTemplate,
    };
  }
}

/// @nodoc
class GetCollaborationChangeRequestOutput {
  /// The collaboration change request that was requested.
  final CollaborationChangeRequest collaborationChangeRequest;

  GetCollaborationChangeRequestOutput({
    required this.collaborationChangeRequest,
  });

  factory GetCollaborationChangeRequestOutput.fromJson(
      Map<String, dynamic> json) {
    return GetCollaborationChangeRequestOutput(
      collaborationChangeRequest: CollaborationChangeRequest.fromJson(
          (json['collaborationChangeRequest'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final collaborationChangeRequest = this.collaborationChangeRequest;
    return {
      'collaborationChangeRequest': collaborationChangeRequest,
    };
  }
}

/// @nodoc
class GetCollaborationConfiguredAudienceModelAssociationOutput {
  /// The metadata of the configured audience model association.
  final CollaborationConfiguredAudienceModelAssociation
      collaborationConfiguredAudienceModelAssociation;

  GetCollaborationConfiguredAudienceModelAssociationOutput({
    required this.collaborationConfiguredAudienceModelAssociation,
  });

  factory GetCollaborationConfiguredAudienceModelAssociationOutput.fromJson(
      Map<String, dynamic> json) {
    return GetCollaborationConfiguredAudienceModelAssociationOutput(
      collaborationConfiguredAudienceModelAssociation:
          CollaborationConfiguredAudienceModelAssociation.fromJson(
              (json['collaborationConfiguredAudienceModelAssociation']
                      as Map<String, dynamic>?) ??
                  const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final collaborationConfiguredAudienceModelAssociation =
        this.collaborationConfiguredAudienceModelAssociation;
    return {
      'collaborationConfiguredAudienceModelAssociation':
          collaborationConfiguredAudienceModelAssociation,
    };
  }
}

/// @nodoc
class GetCollaborationIdNamespaceAssociationOutput {
  /// The ID namespace association that you requested.
  final CollaborationIdNamespaceAssociation collaborationIdNamespaceAssociation;

  GetCollaborationIdNamespaceAssociationOutput({
    required this.collaborationIdNamespaceAssociation,
  });

  factory GetCollaborationIdNamespaceAssociationOutput.fromJson(
      Map<String, dynamic> json) {
    return GetCollaborationIdNamespaceAssociationOutput(
      collaborationIdNamespaceAssociation:
          CollaborationIdNamespaceAssociation.fromJson(
              (json['collaborationIdNamespaceAssociation']
                      as Map<String, dynamic>?) ??
                  const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final collaborationIdNamespaceAssociation =
        this.collaborationIdNamespaceAssociation;
    return {
      'collaborationIdNamespaceAssociation':
          collaborationIdNamespaceAssociation,
    };
  }
}

/// @nodoc
class GetCollaborationPrivacyBudgetTemplateOutput {
  /// Returns the details of the privacy budget template that you requested.
  final CollaborationPrivacyBudgetTemplate collaborationPrivacyBudgetTemplate;

  GetCollaborationPrivacyBudgetTemplateOutput({
    required this.collaborationPrivacyBudgetTemplate,
  });

  factory GetCollaborationPrivacyBudgetTemplateOutput.fromJson(
      Map<String, dynamic> json) {
    return GetCollaborationPrivacyBudgetTemplateOutput(
      collaborationPrivacyBudgetTemplate:
          CollaborationPrivacyBudgetTemplate.fromJson(
              (json['collaborationPrivacyBudgetTemplate']
                      as Map<String, dynamic>?) ??
                  const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final collaborationPrivacyBudgetTemplate =
        this.collaborationPrivacyBudgetTemplate;
    return {
      'collaborationPrivacyBudgetTemplate': collaborationPrivacyBudgetTemplate,
    };
  }
}

/// @nodoc
class GetSchemaOutput {
  /// The entire schema object.
  final Schema schema;

  GetSchemaOutput({
    required this.schema,
  });

  factory GetSchemaOutput.fromJson(Map<String, dynamic> json) {
    return GetSchemaOutput(
      schema: Schema.fromJson((json['schema'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final schema = this.schema;
    return {
      'schema': schema,
    };
  }
}

/// @nodoc
class GetSchemaAnalysisRuleOutput {
  /// A specification about how data from the configured table can be used.
  final AnalysisRule analysisRule;

  GetSchemaAnalysisRuleOutput({
    required this.analysisRule,
  });

  factory GetSchemaAnalysisRuleOutput.fromJson(Map<String, dynamic> json) {
    return GetSchemaAnalysisRuleOutput(
      analysisRule: AnalysisRule.fromJson(
          (json['analysisRule'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final analysisRule = this.analysisRule;
    return {
      'analysisRule': analysisRule,
    };
  }
}

/// @nodoc
class ListCollaborationAnalysisTemplatesOutput {
  /// The metadata of the analysis template within a collaboration.
  final List<CollaborationAnalysisTemplateSummary>
      collaborationAnalysisTemplateSummaries;

  /// The pagination token that's used to fetch the next set of results.
  final String? nextToken;

  ListCollaborationAnalysisTemplatesOutput({
    required this.collaborationAnalysisTemplateSummaries,
    this.nextToken,
  });

  factory ListCollaborationAnalysisTemplatesOutput.fromJson(
      Map<String, dynamic> json) {
    return ListCollaborationAnalysisTemplatesOutput(
      collaborationAnalysisTemplateSummaries:
          ((json['collaborationAnalysisTemplateSummaries'] as List?) ??
                  const [])
              .nonNulls
              .map((e) => CollaborationAnalysisTemplateSummary.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final collaborationAnalysisTemplateSummaries =
        this.collaborationAnalysisTemplateSummaries;
    final nextToken = this.nextToken;
    return {
      'collaborationAnalysisTemplateSummaries':
          collaborationAnalysisTemplateSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListCollaborationChangeRequestsOutput {
  /// The list of collaboration change request summaries.
  final List<CollaborationChangeRequestSummary>
      collaborationChangeRequestSummaries;

  /// The pagination token that's used to fetch the next set of results.
  final String? nextToken;

  ListCollaborationChangeRequestsOutput({
    required this.collaborationChangeRequestSummaries,
    this.nextToken,
  });

  factory ListCollaborationChangeRequestsOutput.fromJson(
      Map<String, dynamic> json) {
    return ListCollaborationChangeRequestsOutput(
      collaborationChangeRequestSummaries:
          ((json['collaborationChangeRequestSummaries'] as List?) ?? const [])
              .nonNulls
              .map((e) => CollaborationChangeRequestSummary.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final collaborationChangeRequestSummaries =
        this.collaborationChangeRequestSummaries;
    final nextToken = this.nextToken;
    return {
      'collaborationChangeRequestSummaries':
          collaborationChangeRequestSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListCollaborationConfiguredAudienceModelAssociationsOutput {
  /// The metadata of the configured audience model association within a
  /// collaboration.
  final List<CollaborationConfiguredAudienceModelAssociationSummary>
      collaborationConfiguredAudienceModelAssociationSummaries;

  /// The pagination token that's used to fetch the next set of results.
  final String? nextToken;

  ListCollaborationConfiguredAudienceModelAssociationsOutput({
    required this.collaborationConfiguredAudienceModelAssociationSummaries,
    this.nextToken,
  });

  factory ListCollaborationConfiguredAudienceModelAssociationsOutput.fromJson(
      Map<String, dynamic> json) {
    return ListCollaborationConfiguredAudienceModelAssociationsOutput(
      collaborationConfiguredAudienceModelAssociationSummaries:
          ((json['collaborationConfiguredAudienceModelAssociationSummaries']
                      as List?) ??
                  const [])
              .nonNulls
              .map((e) => CollaborationConfiguredAudienceModelAssociationSummary
                  .fromJson(e as Map<String, dynamic>))
              .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final collaborationConfiguredAudienceModelAssociationSummaries =
        this.collaborationConfiguredAudienceModelAssociationSummaries;
    final nextToken = this.nextToken;
    return {
      'collaborationConfiguredAudienceModelAssociationSummaries':
          collaborationConfiguredAudienceModelAssociationSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListCollaborationIdNamespaceAssociationsOutput {
  /// The summary information of the collaboration ID namespace associations that
  /// you requested.
  final List<CollaborationIdNamespaceAssociationSummary>
      collaborationIdNamespaceAssociationSummaries;

  /// The token value provided to access the next page of results.
  final String? nextToken;

  ListCollaborationIdNamespaceAssociationsOutput({
    required this.collaborationIdNamespaceAssociationSummaries,
    this.nextToken,
  });

  factory ListCollaborationIdNamespaceAssociationsOutput.fromJson(
      Map<String, dynamic> json) {
    return ListCollaborationIdNamespaceAssociationsOutput(
      collaborationIdNamespaceAssociationSummaries:
          ((json['collaborationIdNamespaceAssociationSummaries'] as List?) ??
                  const [])
              .nonNulls
              .map((e) => CollaborationIdNamespaceAssociationSummary.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final collaborationIdNamespaceAssociationSummaries =
        this.collaborationIdNamespaceAssociationSummaries;
    final nextToken = this.nextToken;
    return {
      'collaborationIdNamespaceAssociationSummaries':
          collaborationIdNamespaceAssociationSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListCollaborationPrivacyBudgetsOutput {
  /// Summaries of the collaboration privacy budgets.
  final List<CollaborationPrivacyBudgetSummary>
      collaborationPrivacyBudgetSummaries;

  /// The pagination token that's used to fetch the next set of results.
  final String? nextToken;

  ListCollaborationPrivacyBudgetsOutput({
    required this.collaborationPrivacyBudgetSummaries,
    this.nextToken,
  });

  factory ListCollaborationPrivacyBudgetsOutput.fromJson(
      Map<String, dynamic> json) {
    return ListCollaborationPrivacyBudgetsOutput(
      collaborationPrivacyBudgetSummaries:
          ((json['collaborationPrivacyBudgetSummaries'] as List?) ?? const [])
              .nonNulls
              .map((e) => CollaborationPrivacyBudgetSummary.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final collaborationPrivacyBudgetSummaries =
        this.collaborationPrivacyBudgetSummaries;
    final nextToken = this.nextToken;
    return {
      'collaborationPrivacyBudgetSummaries':
          collaborationPrivacyBudgetSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListCollaborationPrivacyBudgetTemplatesOutput {
  /// An array that summarizes the collaboration privacy budget templates. The
  /// summary includes collaboration information, creation information, the
  /// privacy budget type.
  final List<CollaborationPrivacyBudgetTemplateSummary>
      collaborationPrivacyBudgetTemplateSummaries;

  /// The pagination token that's used to fetch the next set of results.
  final String? nextToken;

  ListCollaborationPrivacyBudgetTemplatesOutput({
    required this.collaborationPrivacyBudgetTemplateSummaries,
    this.nextToken,
  });

  factory ListCollaborationPrivacyBudgetTemplatesOutput.fromJson(
      Map<String, dynamic> json) {
    return ListCollaborationPrivacyBudgetTemplatesOutput(
      collaborationPrivacyBudgetTemplateSummaries:
          ((json['collaborationPrivacyBudgetTemplateSummaries'] as List?) ??
                  const [])
              .nonNulls
              .map((e) => CollaborationPrivacyBudgetTemplateSummary.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final collaborationPrivacyBudgetTemplateSummaries =
        this.collaborationPrivacyBudgetTemplateSummaries;
    final nextToken = this.nextToken;
    return {
      'collaborationPrivacyBudgetTemplateSummaries':
          collaborationPrivacyBudgetTemplateSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListMembersOutput {
  /// The list of members returned by the ListMembers operation.
  final List<MemberSummary> memberSummaries;

  /// The pagination token that's used to fetch the next set of results.
  final String? nextToken;

  ListMembersOutput({
    required this.memberSummaries,
    this.nextToken,
  });

  factory ListMembersOutput.fromJson(Map<String, dynamic> json) {
    return ListMembersOutput(
      memberSummaries: ((json['memberSummaries'] as List?) ?? const [])
          .nonNulls
          .map((e) => MemberSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final memberSummaries = this.memberSummaries;
    final nextToken = this.nextToken;
    return {
      'memberSummaries': memberSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListSchemasOutput {
  /// The retrieved list of schemas.
  final List<SchemaSummary> schemaSummaries;

  /// The pagination token that's used to fetch the next set of results.
  final String? nextToken;

  ListSchemasOutput({
    required this.schemaSummaries,
    this.nextToken,
  });

  factory ListSchemasOutput.fromJson(Map<String, dynamic> json) {
    return ListSchemasOutput(
      schemaSummaries: ((json['schemaSummaries'] as List?) ?? const [])
          .nonNulls
          .map((e) => SchemaSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final schemaSummaries = this.schemaSummaries;
    final nextToken = this.nextToken;
    return {
      'schemaSummaries': schemaSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class UpdateCollaborationChangeRequestOutput {
  final CollaborationChangeRequest collaborationChangeRequest;

  UpdateCollaborationChangeRequestOutput({
    required this.collaborationChangeRequest,
  });

  factory UpdateCollaborationChangeRequestOutput.fromJson(
      Map<String, dynamic> json) {
    return UpdateCollaborationChangeRequestOutput(
      collaborationChangeRequest: CollaborationChangeRequest.fromJson(
          (json['collaborationChangeRequest'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final collaborationChangeRequest = this.collaborationChangeRequest;
    return {
      'collaborationChangeRequest': collaborationChangeRequest,
    };
  }
}

/// @nodoc
class CreateConfiguredAudienceModelAssociationOutput {
  /// Information about the configured audience model association.
  final ConfiguredAudienceModelAssociation configuredAudienceModelAssociation;

  CreateConfiguredAudienceModelAssociationOutput({
    required this.configuredAudienceModelAssociation,
  });

  factory CreateConfiguredAudienceModelAssociationOutput.fromJson(
      Map<String, dynamic> json) {
    return CreateConfiguredAudienceModelAssociationOutput(
      configuredAudienceModelAssociation:
          ConfiguredAudienceModelAssociation.fromJson(
              (json['configuredAudienceModelAssociation']
                      as Map<String, dynamic>?) ??
                  const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final configuredAudienceModelAssociation =
        this.configuredAudienceModelAssociation;
    return {
      'configuredAudienceModelAssociation': configuredAudienceModelAssociation,
    };
  }
}

/// @nodoc
class GetConfiguredAudienceModelAssociationOutput {
  /// Information about the configured audience model association that you
  /// requested.
  final ConfiguredAudienceModelAssociation configuredAudienceModelAssociation;

  GetConfiguredAudienceModelAssociationOutput({
    required this.configuredAudienceModelAssociation,
  });

  factory GetConfiguredAudienceModelAssociationOutput.fromJson(
      Map<String, dynamic> json) {
    return GetConfiguredAudienceModelAssociationOutput(
      configuredAudienceModelAssociation:
          ConfiguredAudienceModelAssociation.fromJson(
              (json['configuredAudienceModelAssociation']
                      as Map<String, dynamic>?) ??
                  const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final configuredAudienceModelAssociation =
        this.configuredAudienceModelAssociation;
    return {
      'configuredAudienceModelAssociation': configuredAudienceModelAssociation,
    };
  }
}

/// @nodoc
class UpdateConfiguredAudienceModelAssociationOutput {
  /// Details about the configured audience model association that you updated.
  final ConfiguredAudienceModelAssociation configuredAudienceModelAssociation;

  UpdateConfiguredAudienceModelAssociationOutput({
    required this.configuredAudienceModelAssociation,
  });

  factory UpdateConfiguredAudienceModelAssociationOutput.fromJson(
      Map<String, dynamic> json) {
    return UpdateConfiguredAudienceModelAssociationOutput(
      configuredAudienceModelAssociation:
          ConfiguredAudienceModelAssociation.fromJson(
              (json['configuredAudienceModelAssociation']
                      as Map<String, dynamic>?) ??
                  const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final configuredAudienceModelAssociation =
        this.configuredAudienceModelAssociation;
    return {
      'configuredAudienceModelAssociation': configuredAudienceModelAssociation,
    };
  }
}

/// @nodoc
class DeleteConfiguredAudienceModelAssociationOutput {
  DeleteConfiguredAudienceModelAssociationOutput();

  factory DeleteConfiguredAudienceModelAssociationOutput.fromJson(
      Map<String, dynamic> _) {
    return DeleteConfiguredAudienceModelAssociationOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListConfiguredAudienceModelAssociationsOutput {
  /// Summaries of the configured audience model associations that you requested.
  final List<ConfiguredAudienceModelAssociationSummary>
      configuredAudienceModelAssociationSummaries;

  /// The token value provided to access the next page of results.
  final String? nextToken;

  ListConfiguredAudienceModelAssociationsOutput({
    required this.configuredAudienceModelAssociationSummaries,
    this.nextToken,
  });

  factory ListConfiguredAudienceModelAssociationsOutput.fromJson(
      Map<String, dynamic> json) {
    return ListConfiguredAudienceModelAssociationsOutput(
      configuredAudienceModelAssociationSummaries:
          ((json['configuredAudienceModelAssociationSummaries'] as List?) ??
                  const [])
              .nonNulls
              .map((e) => ConfiguredAudienceModelAssociationSummary.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configuredAudienceModelAssociationSummaries =
        this.configuredAudienceModelAssociationSummaries;
    final nextToken = this.nextToken;
    return {
      'configuredAudienceModelAssociationSummaries':
          configuredAudienceModelAssociationSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class CreateConfiguredTableAssociationOutput {
  /// The configured table association.
  final ConfiguredTableAssociation configuredTableAssociation;

  CreateConfiguredTableAssociationOutput({
    required this.configuredTableAssociation,
  });

  factory CreateConfiguredTableAssociationOutput.fromJson(
      Map<String, dynamic> json) {
    return CreateConfiguredTableAssociationOutput(
      configuredTableAssociation: ConfiguredTableAssociation.fromJson(
          (json['configuredTableAssociation'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final configuredTableAssociation = this.configuredTableAssociation;
    return {
      'configuredTableAssociation': configuredTableAssociation,
    };
  }
}

/// @nodoc
class GetConfiguredTableAssociationOutput {
  /// The entire configured table association object.
  final ConfiguredTableAssociation configuredTableAssociation;

  GetConfiguredTableAssociationOutput({
    required this.configuredTableAssociation,
  });

  factory GetConfiguredTableAssociationOutput.fromJson(
      Map<String, dynamic> json) {
    return GetConfiguredTableAssociationOutput(
      configuredTableAssociation: ConfiguredTableAssociation.fromJson(
          (json['configuredTableAssociation'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final configuredTableAssociation = this.configuredTableAssociation;
    return {
      'configuredTableAssociation': configuredTableAssociation,
    };
  }
}

/// @nodoc
class UpdateConfiguredTableAssociationOutput {
  /// The entire updated configured table association.
  final ConfiguredTableAssociation configuredTableAssociation;

  UpdateConfiguredTableAssociationOutput({
    required this.configuredTableAssociation,
  });

  factory UpdateConfiguredTableAssociationOutput.fromJson(
      Map<String, dynamic> json) {
    return UpdateConfiguredTableAssociationOutput(
      configuredTableAssociation: ConfiguredTableAssociation.fromJson(
          (json['configuredTableAssociation'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final configuredTableAssociation = this.configuredTableAssociation;
    return {
      'configuredTableAssociation': configuredTableAssociation,
    };
  }
}

/// @nodoc
class DeleteConfiguredTableAssociationOutput {
  DeleteConfiguredTableAssociationOutput();

  factory DeleteConfiguredTableAssociationOutput.fromJson(
      Map<String, dynamic> _) {
    return DeleteConfiguredTableAssociationOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListConfiguredTableAssociationsOutput {
  /// The retrieved list of configured table associations.
  final List<ConfiguredTableAssociationSummary>
      configuredTableAssociationSummaries;

  /// The pagination token that's used to fetch the next set of results.
  final String? nextToken;

  ListConfiguredTableAssociationsOutput({
    required this.configuredTableAssociationSummaries,
    this.nextToken,
  });

  factory ListConfiguredTableAssociationsOutput.fromJson(
      Map<String, dynamic> json) {
    return ListConfiguredTableAssociationsOutput(
      configuredTableAssociationSummaries:
          ((json['configuredTableAssociationSummaries'] as List?) ?? const [])
              .nonNulls
              .map((e) => ConfiguredTableAssociationSummary.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configuredTableAssociationSummaries =
        this.configuredTableAssociationSummaries;
    final nextToken = this.nextToken;
    return {
      'configuredTableAssociationSummaries':
          configuredTableAssociationSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class CreateConfiguredTableAssociationAnalysisRuleOutput {
  /// The analysis rule for the conﬁgured table association. In the console, the
  /// <code>ConfiguredTableAssociationAnalysisRule</code> is referred to as the
  /// <i>collaboration analysis rule</i>.
  final ConfiguredTableAssociationAnalysisRule analysisRule;

  CreateConfiguredTableAssociationAnalysisRuleOutput({
    required this.analysisRule,
  });

  factory CreateConfiguredTableAssociationAnalysisRuleOutput.fromJson(
      Map<String, dynamic> json) {
    return CreateConfiguredTableAssociationAnalysisRuleOutput(
      analysisRule: ConfiguredTableAssociationAnalysisRule.fromJson(
          (json['analysisRule'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final analysisRule = this.analysisRule;
    return {
      'analysisRule': analysisRule,
    };
  }
}

/// @nodoc
class DeleteConfiguredTableAssociationAnalysisRuleOutput {
  DeleteConfiguredTableAssociationAnalysisRuleOutput();

  factory DeleteConfiguredTableAssociationAnalysisRuleOutput.fromJson(
      Map<String, dynamic> _) {
    return DeleteConfiguredTableAssociationAnalysisRuleOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class GetConfiguredTableAssociationAnalysisRuleOutput {
  /// The analysis rule for the conﬁgured table association. In the console, the
  /// <code>ConfiguredTableAssociationAnalysisRule</code> is referred to as the
  /// <i>collaboration analysis rule</i>.
  final ConfiguredTableAssociationAnalysisRule analysisRule;

  GetConfiguredTableAssociationAnalysisRuleOutput({
    required this.analysisRule,
  });

  factory GetConfiguredTableAssociationAnalysisRuleOutput.fromJson(
      Map<String, dynamic> json) {
    return GetConfiguredTableAssociationAnalysisRuleOutput(
      analysisRule: ConfiguredTableAssociationAnalysisRule.fromJson(
          (json['analysisRule'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final analysisRule = this.analysisRule;
    return {
      'analysisRule': analysisRule,
    };
  }
}

/// @nodoc
class UpdateConfiguredTableAssociationAnalysisRuleOutput {
  /// The updated analysis rule for the conﬁgured table association. In the
  /// console, the <code>ConfiguredTableAssociationAnalysisRule</code> is referred
  /// to as the <i>collaboration analysis rule</i>.
  final ConfiguredTableAssociationAnalysisRule analysisRule;

  UpdateConfiguredTableAssociationAnalysisRuleOutput({
    required this.analysisRule,
  });

  factory UpdateConfiguredTableAssociationAnalysisRuleOutput.fromJson(
      Map<String, dynamic> json) {
    return UpdateConfiguredTableAssociationAnalysisRuleOutput(
      analysisRule: ConfiguredTableAssociationAnalysisRule.fromJson(
          (json['analysisRule'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final analysisRule = this.analysisRule;
    return {
      'analysisRule': analysisRule,
    };
  }
}

/// @nodoc
class CreateConfiguredTableOutput {
  /// The created configured table.
  final ConfiguredTable configuredTable;

  CreateConfiguredTableOutput({
    required this.configuredTable,
  });

  factory CreateConfiguredTableOutput.fromJson(Map<String, dynamic> json) {
    return CreateConfiguredTableOutput(
      configuredTable: ConfiguredTable.fromJson(
          (json['configuredTable'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final configuredTable = this.configuredTable;
    return {
      'configuredTable': configuredTable,
    };
  }
}

/// @nodoc
class GetConfiguredTableOutput {
  /// The retrieved configured table.
  final ConfiguredTable configuredTable;

  GetConfiguredTableOutput({
    required this.configuredTable,
  });

  factory GetConfiguredTableOutput.fromJson(Map<String, dynamic> json) {
    return GetConfiguredTableOutput(
      configuredTable: ConfiguredTable.fromJson(
          (json['configuredTable'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final configuredTable = this.configuredTable;
    return {
      'configuredTable': configuredTable,
    };
  }
}

/// @nodoc
class UpdateConfiguredTableOutput {
  /// The updated configured table.
  final ConfiguredTable configuredTable;

  UpdateConfiguredTableOutput({
    required this.configuredTable,
  });

  factory UpdateConfiguredTableOutput.fromJson(Map<String, dynamic> json) {
    return UpdateConfiguredTableOutput(
      configuredTable: ConfiguredTable.fromJson(
          (json['configuredTable'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final configuredTable = this.configuredTable;
    return {
      'configuredTable': configuredTable,
    };
  }
}

/// The empty output for a successful deletion.
///
/// @nodoc
class DeleteConfiguredTableOutput {
  DeleteConfiguredTableOutput();

  factory DeleteConfiguredTableOutput.fromJson(Map<String, dynamic> _) {
    return DeleteConfiguredTableOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListConfiguredTablesOutput {
  /// The configured tables listed by the request.
  final List<ConfiguredTableSummary> configuredTableSummaries;

  /// The pagination token that's used to fetch the next set of results.
  final String? nextToken;

  ListConfiguredTablesOutput({
    required this.configuredTableSummaries,
    this.nextToken,
  });

  factory ListConfiguredTablesOutput.fromJson(Map<String, dynamic> json) {
    return ListConfiguredTablesOutput(
      configuredTableSummaries: ((json['configuredTableSummaries'] as List?) ??
              const [])
          .nonNulls
          .map(
              (e) => ConfiguredTableSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configuredTableSummaries = this.configuredTableSummaries;
    final nextToken = this.nextToken;
    return {
      'configuredTableSummaries': configuredTableSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class CreateConfiguredTableAnalysisRuleOutput {
  /// The analysis rule that was created for the configured table.
  final ConfiguredTableAnalysisRule analysisRule;

  CreateConfiguredTableAnalysisRuleOutput({
    required this.analysisRule,
  });

  factory CreateConfiguredTableAnalysisRuleOutput.fromJson(
      Map<String, dynamic> json) {
    return CreateConfiguredTableAnalysisRuleOutput(
      analysisRule: ConfiguredTableAnalysisRule.fromJson(
          (json['analysisRule'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final analysisRule = this.analysisRule;
    return {
      'analysisRule': analysisRule,
    };
  }
}

/// An empty response that indicates a successful delete.
///
/// @nodoc
class DeleteConfiguredTableAnalysisRuleOutput {
  DeleteConfiguredTableAnalysisRuleOutput();

  factory DeleteConfiguredTableAnalysisRuleOutput.fromJson(
      Map<String, dynamic> _) {
    return DeleteConfiguredTableAnalysisRuleOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class GetConfiguredTableAnalysisRuleOutput {
  /// The entire analysis rule output.
  final ConfiguredTableAnalysisRule analysisRule;

  GetConfiguredTableAnalysisRuleOutput({
    required this.analysisRule,
  });

  factory GetConfiguredTableAnalysisRuleOutput.fromJson(
      Map<String, dynamic> json) {
    return GetConfiguredTableAnalysisRuleOutput(
      analysisRule: ConfiguredTableAnalysisRule.fromJson(
          (json['analysisRule'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final analysisRule = this.analysisRule;
    return {
      'analysisRule': analysisRule,
    };
  }
}

/// @nodoc
class UpdateConfiguredTableAnalysisRuleOutput {
  /// The entire updated analysis rule.
  final ConfiguredTableAnalysisRule analysisRule;

  UpdateConfiguredTableAnalysisRuleOutput({
    required this.analysisRule,
  });

  factory UpdateConfiguredTableAnalysisRuleOutput.fromJson(
      Map<String, dynamic> json) {
    return UpdateConfiguredTableAnalysisRuleOutput(
      analysisRule: ConfiguredTableAnalysisRule.fromJson(
          (json['analysisRule'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final analysisRule = this.analysisRule;
    return {
      'analysisRule': analysisRule,
    };
  }
}

/// @nodoc
class CreateIdMappingTableOutput {
  /// The ID mapping table that was created.
  final IdMappingTable idMappingTable;

  CreateIdMappingTableOutput({
    required this.idMappingTable,
  });

  factory CreateIdMappingTableOutput.fromJson(Map<String, dynamic> json) {
    return CreateIdMappingTableOutput(
      idMappingTable: IdMappingTable.fromJson(
          (json['idMappingTable'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final idMappingTable = this.idMappingTable;
    return {
      'idMappingTable': idMappingTable,
    };
  }
}

/// @nodoc
class GetIdMappingTableOutput {
  /// The ID mapping table that you requested.
  final IdMappingTable idMappingTable;

  GetIdMappingTableOutput({
    required this.idMappingTable,
  });

  factory GetIdMappingTableOutput.fromJson(Map<String, dynamic> json) {
    return GetIdMappingTableOutput(
      idMappingTable: IdMappingTable.fromJson(
          (json['idMappingTable'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final idMappingTable = this.idMappingTable;
    return {
      'idMappingTable': idMappingTable,
    };
  }
}

/// @nodoc
class UpdateIdMappingTableOutput {
  /// The updated ID mapping table.
  final IdMappingTable idMappingTable;

  UpdateIdMappingTableOutput({
    required this.idMappingTable,
  });

  factory UpdateIdMappingTableOutput.fromJson(Map<String, dynamic> json) {
    return UpdateIdMappingTableOutput(
      idMappingTable: IdMappingTable.fromJson(
          (json['idMappingTable'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final idMappingTable = this.idMappingTable;
    return {
      'idMappingTable': idMappingTable,
    };
  }
}

/// @nodoc
class DeleteIdMappingTableOutput {
  DeleteIdMappingTableOutput();

  factory DeleteIdMappingTableOutput.fromJson(Map<String, dynamic> _) {
    return DeleteIdMappingTableOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListIdMappingTablesOutput {
  /// The summary information of the ID mapping tables that you requested.
  final List<IdMappingTableSummary> idMappingTableSummaries;

  /// The token value provided to access the next page of results.
  final String? nextToken;

  ListIdMappingTablesOutput({
    required this.idMappingTableSummaries,
    this.nextToken,
  });

  factory ListIdMappingTablesOutput.fromJson(Map<String, dynamic> json) {
    return ListIdMappingTablesOutput(
      idMappingTableSummaries: ((json['idMappingTableSummaries'] as List?) ??
              const [])
          .nonNulls
          .map((e) => IdMappingTableSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final idMappingTableSummaries = this.idMappingTableSummaries;
    final nextToken = this.nextToken;
    return {
      'idMappingTableSummaries': idMappingTableSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class PopulateIdMappingTableOutput {
  /// The unique identifier of the mapping job that will populate the ID mapping
  /// table.
  final String idMappingJobId;

  PopulateIdMappingTableOutput({
    required this.idMappingJobId,
  });

  factory PopulateIdMappingTableOutput.fromJson(Map<String, dynamic> json) {
    return PopulateIdMappingTableOutput(
      idMappingJobId: (json['idMappingJobId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final idMappingJobId = this.idMappingJobId;
    return {
      'idMappingJobId': idMappingJobId,
    };
  }
}

/// @nodoc
class CreateIdNamespaceAssociationOutput {
  /// The ID namespace association that was created.
  final IdNamespaceAssociation idNamespaceAssociation;

  CreateIdNamespaceAssociationOutput({
    required this.idNamespaceAssociation,
  });

  factory CreateIdNamespaceAssociationOutput.fromJson(
      Map<String, dynamic> json) {
    return CreateIdNamespaceAssociationOutput(
      idNamespaceAssociation: IdNamespaceAssociation.fromJson(
          (json['idNamespaceAssociation'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final idNamespaceAssociation = this.idNamespaceAssociation;
    return {
      'idNamespaceAssociation': idNamespaceAssociation,
    };
  }
}

/// @nodoc
class GetIdNamespaceAssociationOutput {
  /// The ID namespace association that you requested.
  final IdNamespaceAssociation idNamespaceAssociation;

  GetIdNamespaceAssociationOutput({
    required this.idNamespaceAssociation,
  });

  factory GetIdNamespaceAssociationOutput.fromJson(Map<String, dynamic> json) {
    return GetIdNamespaceAssociationOutput(
      idNamespaceAssociation: IdNamespaceAssociation.fromJson(
          (json['idNamespaceAssociation'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final idNamespaceAssociation = this.idNamespaceAssociation;
    return {
      'idNamespaceAssociation': idNamespaceAssociation,
    };
  }
}

/// @nodoc
class UpdateIdNamespaceAssociationOutput {
  /// The updated ID namespace association.
  final IdNamespaceAssociation idNamespaceAssociation;

  UpdateIdNamespaceAssociationOutput({
    required this.idNamespaceAssociation,
  });

  factory UpdateIdNamespaceAssociationOutput.fromJson(
      Map<String, dynamic> json) {
    return UpdateIdNamespaceAssociationOutput(
      idNamespaceAssociation: IdNamespaceAssociation.fromJson(
          (json['idNamespaceAssociation'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final idNamespaceAssociation = this.idNamespaceAssociation;
    return {
      'idNamespaceAssociation': idNamespaceAssociation,
    };
  }
}

/// @nodoc
class DeleteIdNamespaceAssociationOutput {
  DeleteIdNamespaceAssociationOutput();

  factory DeleteIdNamespaceAssociationOutput.fromJson(Map<String, dynamic> _) {
    return DeleteIdNamespaceAssociationOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListIdNamespaceAssociationsOutput {
  /// The summary information of the ID namespace associations that you requested.
  final List<IdNamespaceAssociationSummary> idNamespaceAssociationSummaries;

  /// The token value provided to access the next page of results.
  final String? nextToken;

  ListIdNamespaceAssociationsOutput({
    required this.idNamespaceAssociationSummaries,
    this.nextToken,
  });

  factory ListIdNamespaceAssociationsOutput.fromJson(
      Map<String, dynamic> json) {
    return ListIdNamespaceAssociationsOutput(
      idNamespaceAssociationSummaries: ((json['idNamespaceAssociationSummaries']
                  as List?) ??
              const [])
          .nonNulls
          .map((e) =>
              IdNamespaceAssociationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final idNamespaceAssociationSummaries =
        this.idNamespaceAssociationSummaries;
    final nextToken = this.nextToken;
    return {
      'idNamespaceAssociationSummaries': idNamespaceAssociationSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class CreateMembershipOutput {
  /// The membership that was created.
  final Membership membership;

  CreateMembershipOutput({
    required this.membership,
  });

  factory CreateMembershipOutput.fromJson(Map<String, dynamic> json) {
    return CreateMembershipOutput(
      membership: Membership.fromJson(
          (json['membership'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final membership = this.membership;
    return {
      'membership': membership,
    };
  }
}

/// @nodoc
class GetMembershipOutput {
  /// The membership retrieved for the provided identifier.
  final Membership membership;

  GetMembershipOutput({
    required this.membership,
  });

  factory GetMembershipOutput.fromJson(Map<String, dynamic> json) {
    return GetMembershipOutput(
      membership: Membership.fromJson(
          (json['membership'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final membership = this.membership;
    return {
      'membership': membership,
    };
  }
}

/// @nodoc
class UpdateMembershipOutput {
  final Membership membership;

  UpdateMembershipOutput({
    required this.membership,
  });

  factory UpdateMembershipOutput.fromJson(Map<String, dynamic> json) {
    return UpdateMembershipOutput(
      membership: Membership.fromJson(
          (json['membership'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final membership = this.membership;
    return {
      'membership': membership,
    };
  }
}

/// @nodoc
class DeleteMembershipOutput {
  DeleteMembershipOutput();

  factory DeleteMembershipOutput.fromJson(Map<String, dynamic> _) {
    return DeleteMembershipOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListMembershipsOutput {
  /// The list of memberships returned from the ListMemberships operation.
  final List<MembershipSummary> membershipSummaries;

  /// The pagination token that's used to fetch the next set of results.
  final String? nextToken;

  ListMembershipsOutput({
    required this.membershipSummaries,
    this.nextToken,
  });

  factory ListMembershipsOutput.fromJson(Map<String, dynamic> json) {
    return ListMembershipsOutput(
      membershipSummaries: ((json['membershipSummaries'] as List?) ?? const [])
          .nonNulls
          .map((e) => MembershipSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final membershipSummaries = this.membershipSummaries;
    final nextToken = this.nextToken;
    return {
      'membershipSummaries': membershipSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class GetProtectedJobOutput {
  /// The protected job metadata.
  final ProtectedJob protectedJob;

  GetProtectedJobOutput({
    required this.protectedJob,
  });

  factory GetProtectedJobOutput.fromJson(Map<String, dynamic> json) {
    return GetProtectedJobOutput(
      protectedJob: ProtectedJob.fromJson(
          (json['protectedJob'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final protectedJob = this.protectedJob;
    return {
      'protectedJob': protectedJob,
    };
  }
}

/// @nodoc
class GetProtectedQueryOutput {
  /// The query processing metadata.
  final ProtectedQuery protectedQuery;

  GetProtectedQueryOutput({
    required this.protectedQuery,
  });

  factory GetProtectedQueryOutput.fromJson(Map<String, dynamic> json) {
    return GetProtectedQueryOutput(
      protectedQuery: ProtectedQuery.fromJson(
          (json['protectedQuery'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final protectedQuery = this.protectedQuery;
    return {
      'protectedQuery': protectedQuery,
    };
  }
}

/// @nodoc
class ListPrivacyBudgetsOutput {
  /// An array that summarizes the privacy budgets. The summary includes
  /// collaboration information, membership information, privacy budget template
  /// information, and privacy budget details.
  final List<PrivacyBudgetSummary> privacyBudgetSummaries;

  /// The pagination token that's used to fetch the next set of results.
  final String? nextToken;

  ListPrivacyBudgetsOutput({
    required this.privacyBudgetSummaries,
    this.nextToken,
  });

  factory ListPrivacyBudgetsOutput.fromJson(Map<String, dynamic> json) {
    return ListPrivacyBudgetsOutput(
      privacyBudgetSummaries: ((json['privacyBudgetSummaries'] as List?) ??
              const [])
          .nonNulls
          .map((e) => PrivacyBudgetSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final privacyBudgetSummaries = this.privacyBudgetSummaries;
    final nextToken = this.nextToken;
    return {
      'privacyBudgetSummaries': privacyBudgetSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListProtectedJobsOutput {
  /// A list of protected job summaries.
  final List<ProtectedJobSummary> protectedJobs;

  /// The pagination token that's used to fetch the next set of results.
  final String? nextToken;

  ListProtectedJobsOutput({
    required this.protectedJobs,
    this.nextToken,
  });

  factory ListProtectedJobsOutput.fromJson(Map<String, dynamic> json) {
    return ListProtectedJobsOutput(
      protectedJobs: ((json['protectedJobs'] as List?) ?? const [])
          .nonNulls
          .map((e) => ProtectedJobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final protectedJobs = this.protectedJobs;
    final nextToken = this.nextToken;
    return {
      'protectedJobs': protectedJobs,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListProtectedQueriesOutput {
  /// A list of protected queries.
  final List<ProtectedQuerySummary> protectedQueries;

  /// The pagination token that's used to fetch the next set of results.
  final String? nextToken;

  ListProtectedQueriesOutput({
    required this.protectedQueries,
    this.nextToken,
  });

  factory ListProtectedQueriesOutput.fromJson(Map<String, dynamic> json) {
    return ListProtectedQueriesOutput(
      protectedQueries: ((json['protectedQueries'] as List?) ?? const [])
          .nonNulls
          .map((e) => ProtectedQuerySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final protectedQueries = this.protectedQueries;
    final nextToken = this.nextToken;
    return {
      'protectedQueries': protectedQueries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class PreviewPrivacyImpactOutput {
  /// An estimate of the number of aggregation functions that the member who can
  /// query can run given the epsilon and noise parameters. This does not change
  /// the privacy budget.
  final PrivacyImpact privacyImpact;

  PreviewPrivacyImpactOutput({
    required this.privacyImpact,
  });

  factory PreviewPrivacyImpactOutput.fromJson(Map<String, dynamic> json) {
    return PreviewPrivacyImpactOutput(
      privacyImpact: PrivacyImpact.fromJson(
          (json['privacyImpact'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final privacyImpact = this.privacyImpact;
    return {
      'privacyImpact': privacyImpact,
    };
  }
}

/// @nodoc
class StartProtectedJobOutput {
  /// The protected job.
  final ProtectedJob protectedJob;

  StartProtectedJobOutput({
    required this.protectedJob,
  });

  factory StartProtectedJobOutput.fromJson(Map<String, dynamic> json) {
    return StartProtectedJobOutput(
      protectedJob: ProtectedJob.fromJson(
          (json['protectedJob'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final protectedJob = this.protectedJob;
    return {
      'protectedJob': protectedJob,
    };
  }
}

/// @nodoc
class StartProtectedQueryOutput {
  /// The protected query.
  final ProtectedQuery protectedQuery;

  StartProtectedQueryOutput({
    required this.protectedQuery,
  });

  factory StartProtectedQueryOutput.fromJson(Map<String, dynamic> json) {
    return StartProtectedQueryOutput(
      protectedQuery: ProtectedQuery.fromJson(
          (json['protectedQuery'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final protectedQuery = this.protectedQuery;
    return {
      'protectedQuery': protectedQuery,
    };
  }
}

/// @nodoc
class UpdateProtectedJobOutput {
  /// The protected job output.
  final ProtectedJob protectedJob;

  UpdateProtectedJobOutput({
    required this.protectedJob,
  });

  factory UpdateProtectedJobOutput.fromJson(Map<String, dynamic> json) {
    return UpdateProtectedJobOutput(
      protectedJob: ProtectedJob.fromJson(
          (json['protectedJob'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final protectedJob = this.protectedJob;
    return {
      'protectedJob': protectedJob,
    };
  }
}

/// @nodoc
class UpdateProtectedQueryOutput {
  /// The protected query output.
  final ProtectedQuery protectedQuery;

  UpdateProtectedQueryOutput({
    required this.protectedQuery,
  });

  factory UpdateProtectedQueryOutput.fromJson(Map<String, dynamic> json) {
    return UpdateProtectedQueryOutput(
      protectedQuery: ProtectedQuery.fromJson(
          (json['protectedQuery'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final protectedQuery = this.protectedQuery;
    return {
      'protectedQuery': protectedQuery,
    };
  }
}

/// @nodoc
class CreatePrivacyBudgetTemplateOutput {
  /// A summary of the elements in the privacy budget template.
  final PrivacyBudgetTemplate privacyBudgetTemplate;

  CreatePrivacyBudgetTemplateOutput({
    required this.privacyBudgetTemplate,
  });

  factory CreatePrivacyBudgetTemplateOutput.fromJson(
      Map<String, dynamic> json) {
    return CreatePrivacyBudgetTemplateOutput(
      privacyBudgetTemplate: PrivacyBudgetTemplate.fromJson(
          (json['privacyBudgetTemplate'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final privacyBudgetTemplate = this.privacyBudgetTemplate;
    return {
      'privacyBudgetTemplate': privacyBudgetTemplate,
    };
  }
}

/// @nodoc
class GetPrivacyBudgetTemplateOutput {
  /// Returns the details of the privacy budget template that you requested.
  final PrivacyBudgetTemplate privacyBudgetTemplate;

  GetPrivacyBudgetTemplateOutput({
    required this.privacyBudgetTemplate,
  });

  factory GetPrivacyBudgetTemplateOutput.fromJson(Map<String, dynamic> json) {
    return GetPrivacyBudgetTemplateOutput(
      privacyBudgetTemplate: PrivacyBudgetTemplate.fromJson(
          (json['privacyBudgetTemplate'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final privacyBudgetTemplate = this.privacyBudgetTemplate;
    return {
      'privacyBudgetTemplate': privacyBudgetTemplate,
    };
  }
}

/// @nodoc
class UpdatePrivacyBudgetTemplateOutput {
  /// Summary of the privacy budget template.
  final PrivacyBudgetTemplate privacyBudgetTemplate;

  UpdatePrivacyBudgetTemplateOutput({
    required this.privacyBudgetTemplate,
  });

  factory UpdatePrivacyBudgetTemplateOutput.fromJson(
      Map<String, dynamic> json) {
    return UpdatePrivacyBudgetTemplateOutput(
      privacyBudgetTemplate: PrivacyBudgetTemplate.fromJson(
          (json['privacyBudgetTemplate'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final privacyBudgetTemplate = this.privacyBudgetTemplate;
    return {
      'privacyBudgetTemplate': privacyBudgetTemplate,
    };
  }
}

/// @nodoc
class DeletePrivacyBudgetTemplateOutput {
  DeletePrivacyBudgetTemplateOutput();

  factory DeletePrivacyBudgetTemplateOutput.fromJson(Map<String, dynamic> _) {
    return DeletePrivacyBudgetTemplateOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListPrivacyBudgetTemplatesOutput {
  /// An array that summarizes the privacy budget templates. The summary includes
  /// collaboration information, creation information, and privacy budget type.
  final List<PrivacyBudgetTemplateSummary> privacyBudgetTemplateSummaries;

  /// The pagination token that's used to fetch the next set of results.
  final String? nextToken;

  ListPrivacyBudgetTemplatesOutput({
    required this.privacyBudgetTemplateSummaries,
    this.nextToken,
  });

  factory ListPrivacyBudgetTemplatesOutput.fromJson(Map<String, dynamic> json) {
    return ListPrivacyBudgetTemplatesOutput(
      privacyBudgetTemplateSummaries: ((json['privacyBudgetTemplateSummaries']
                  as List?) ??
              const [])
          .nonNulls
          .map((e) =>
              PrivacyBudgetTemplateSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final privacyBudgetTemplateSummaries = this.privacyBudgetTemplateSummaries;
    final nextToken = this.nextToken;
    return {
      'privacyBudgetTemplateSummaries': privacyBudgetTemplateSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// A summary of the privacy budget template. The summary includes membership
/// information, collaboration information, and creation information.
///
/// @nodoc
class PrivacyBudgetTemplateSummary {
  /// The ARN of the privacy budget template.
  final String arn;

  /// The ARN of the collaboration that contains this privacy budget template.
  final String collaborationArn;

  /// The unique ID of the collaboration that contains this privacy budget
  /// template.
  final String collaborationId;

  /// The time at which the privacy budget template was created.
  final DateTime createTime;

  /// The unique identifier of the privacy budget template.
  final String id;

  /// The Amazon Resource Name (ARN) of the member who created the privacy budget
  /// template.
  final String membershipArn;

  /// The identifier for a membership resource.
  final String membershipId;

  /// The type of the privacy budget template.
  final PrivacyBudgetType privacyBudgetType;

  /// The most recent time at which the privacy budget template was updated.
  final DateTime updateTime;

  PrivacyBudgetTemplateSummary({
    required this.arn,
    required this.collaborationArn,
    required this.collaborationId,
    required this.createTime,
    required this.id,
    required this.membershipArn,
    required this.membershipId,
    required this.privacyBudgetType,
    required this.updateTime,
  });

  factory PrivacyBudgetTemplateSummary.fromJson(Map<String, dynamic> json) {
    return PrivacyBudgetTemplateSummary(
      arn: (json['arn'] as String?) ?? '',
      collaborationArn: (json['collaborationArn'] as String?) ?? '',
      collaborationId: (json['collaborationId'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      id: (json['id'] as String?) ?? '',
      membershipArn: (json['membershipArn'] as String?) ?? '',
      membershipId: (json['membershipId'] as String?) ?? '',
      privacyBudgetType: PrivacyBudgetType.fromString(
          (json['privacyBudgetType'] as String?) ?? ''),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final collaborationArn = this.collaborationArn;
    final collaborationId = this.collaborationId;
    final createTime = this.createTime;
    final id = this.id;
    final membershipArn = this.membershipArn;
    final membershipId = this.membershipId;
    final privacyBudgetType = this.privacyBudgetType;
    final updateTime = this.updateTime;
    return {
      'arn': arn,
      'collaborationArn': collaborationArn,
      'collaborationId': collaborationId,
      'createTime': unixTimestampToJson(createTime),
      'id': id,
      'membershipArn': membershipArn,
      'membershipId': membershipId,
      'privacyBudgetType': privacyBudgetType.value,
      'updateTime': unixTimestampToJson(updateTime),
    };
  }
}

/// @nodoc
class PrivacyBudgetType {
  static const differentialPrivacy =
      PrivacyBudgetType._('DIFFERENTIAL_PRIVACY');
  static const accessBudget = PrivacyBudgetType._('ACCESS_BUDGET');

  final String value;

  const PrivacyBudgetType._(this.value);

  static const values = [differentialPrivacy, accessBudget];

  static PrivacyBudgetType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PrivacyBudgetType._(value));

  @override
  bool operator ==(other) => other is PrivacyBudgetType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An object that defines the privacy budget template.
///
/// @nodoc
class PrivacyBudgetTemplate {
  /// The ARN of the privacy budget template.
  final String arn;

  /// How often the privacy budget refreshes.
  /// <important>
  /// If you plan to regularly bring new data into the collaboration, use
  /// <code>CALENDAR_MONTH</code> to automatically get a new privacy budget for
  /// the collaboration every calendar month. Choosing this option allows
  /// arbitrary amounts of information to be revealed about rows of the data when
  /// repeatedly queried across refreshes. Avoid choosing this if the same rows
  /// will be repeatedly queried between privacy budget refreshes.
  /// </important>
  final PrivacyBudgetTemplateAutoRefresh autoRefresh;

  /// The ARN of the collaboration that contains this privacy budget template.
  final String collaborationArn;

  /// The unique ID of the collaboration that contains this privacy budget
  /// template.
  final String collaborationId;

  /// The time at which the privacy budget template was created.
  final DateTime createTime;

  /// The unique identifier of the privacy budget template.
  final String id;

  /// The Amazon Resource Name (ARN) of the member who created the privacy budget
  /// template.
  final String membershipArn;

  /// The identifier for a membership resource.
  final String membershipId;

  /// Specifies the epsilon and noise parameters for the privacy budget template.
  final PrivacyBudgetTemplateParametersOutput parameters;

  /// Specifies the type of the privacy budget template.
  final PrivacyBudgetType privacyBudgetType;

  /// The most recent time at which the privacy budget template was updated.
  final DateTime updateTime;

  PrivacyBudgetTemplate({
    required this.arn,
    required this.autoRefresh,
    required this.collaborationArn,
    required this.collaborationId,
    required this.createTime,
    required this.id,
    required this.membershipArn,
    required this.membershipId,
    required this.parameters,
    required this.privacyBudgetType,
    required this.updateTime,
  });

  factory PrivacyBudgetTemplate.fromJson(Map<String, dynamic> json) {
    return PrivacyBudgetTemplate(
      arn: (json['arn'] as String?) ?? '',
      autoRefresh: PrivacyBudgetTemplateAutoRefresh.fromString(
          (json['autoRefresh'] as String?) ?? ''),
      collaborationArn: (json['collaborationArn'] as String?) ?? '',
      collaborationId: (json['collaborationId'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      id: (json['id'] as String?) ?? '',
      membershipArn: (json['membershipArn'] as String?) ?? '',
      membershipId: (json['membershipId'] as String?) ?? '',
      parameters: PrivacyBudgetTemplateParametersOutput.fromJson(
          (json['parameters'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      privacyBudgetType: PrivacyBudgetType.fromString(
          (json['privacyBudgetType'] as String?) ?? ''),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final autoRefresh = this.autoRefresh;
    final collaborationArn = this.collaborationArn;
    final collaborationId = this.collaborationId;
    final createTime = this.createTime;
    final id = this.id;
    final membershipArn = this.membershipArn;
    final membershipId = this.membershipId;
    final parameters = this.parameters;
    final privacyBudgetType = this.privacyBudgetType;
    final updateTime = this.updateTime;
    return {
      'arn': arn,
      'autoRefresh': autoRefresh.value,
      'collaborationArn': collaborationArn,
      'collaborationId': collaborationId,
      'createTime': unixTimestampToJson(createTime),
      'id': id,
      'membershipArn': membershipArn,
      'membershipId': membershipId,
      'parameters': parameters,
      'privacyBudgetType': privacyBudgetType.value,
      'updateTime': unixTimestampToJson(updateTime),
    };
  }
}

/// @nodoc
class PrivacyBudgetTemplateAutoRefresh {
  static const calendarMonth =
      PrivacyBudgetTemplateAutoRefresh._('CALENDAR_MONTH');
  static const none = PrivacyBudgetTemplateAutoRefresh._('NONE');

  final String value;

  const PrivacyBudgetTemplateAutoRefresh._(this.value);

  static const values = [calendarMonth, none];

  static PrivacyBudgetTemplateAutoRefresh fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PrivacyBudgetTemplateAutoRefresh._(value));

  @override
  bool operator ==(other) =>
      other is PrivacyBudgetTemplateAutoRefresh && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The epsilon and noise parameters that were used in the privacy budget
/// template.
///
/// @nodoc
class PrivacyBudgetTemplateParametersOutput {
  /// Access budget configuration returned from the privacy budget template,
  /// containing the configured access budget settings.
  final AccessBudgetsPrivacyTemplateParametersOutput? accessBudget;

  /// The epsilon and noise parameters.
  final DifferentialPrivacyTemplateParametersOutput? differentialPrivacy;

  PrivacyBudgetTemplateParametersOutput({
    this.accessBudget,
    this.differentialPrivacy,
  });

  factory PrivacyBudgetTemplateParametersOutput.fromJson(
      Map<String, dynamic> json) {
    return PrivacyBudgetTemplateParametersOutput(
      accessBudget: json['accessBudget'] != null
          ? AccessBudgetsPrivacyTemplateParametersOutput.fromJson(
              json['accessBudget'] as Map<String, dynamic>)
          : null,
      differentialPrivacy: json['differentialPrivacy'] != null
          ? DifferentialPrivacyTemplateParametersOutput.fromJson(
              json['differentialPrivacy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accessBudget = this.accessBudget;
    final differentialPrivacy = this.differentialPrivacy;
    return {
      if (accessBudget != null) 'accessBudget': accessBudget,
      if (differentialPrivacy != null)
        'differentialPrivacy': differentialPrivacy,
    };
  }
}

/// The epsilon and noise parameter values that were used for the differential
/// privacy template.
///
/// @nodoc
class DifferentialPrivacyTemplateParametersOutput {
  /// The epsilon value that you specified.
  final int epsilon;

  /// Noise added per query is measured in terms of the number of users whose
  /// contributions you want to obscure. This value governs the rate at which the
  /// privacy budget is depleted.
  final int usersNoisePerQuery;

  DifferentialPrivacyTemplateParametersOutput({
    required this.epsilon,
    required this.usersNoisePerQuery,
  });

  factory DifferentialPrivacyTemplateParametersOutput.fromJson(
      Map<String, dynamic> json) {
    return DifferentialPrivacyTemplateParametersOutput(
      epsilon: (json['epsilon'] as int?) ?? 0,
      usersNoisePerQuery: (json['usersNoisePerQuery'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final epsilon = this.epsilon;
    final usersNoisePerQuery = this.usersNoisePerQuery;
    return {
      'epsilon': epsilon,
      'usersNoisePerQuery': usersNoisePerQuery,
    };
  }
}

/// Output parameters for privacy budget templates with access budgets support,
/// containing the configured budget information.
///
/// @nodoc
class AccessBudgetsPrivacyTemplateParametersOutput {
  /// An array of budget parameters returned from the access budget configuration.
  final List<BudgetParameter> budgetParameters;

  /// The Amazon Resource Name (ARN) of the resource associated with this privacy
  /// budget template.
  final String resourceArn;

  AccessBudgetsPrivacyTemplateParametersOutput({
    required this.budgetParameters,
    required this.resourceArn,
  });

  factory AccessBudgetsPrivacyTemplateParametersOutput.fromJson(
      Map<String, dynamic> json) {
    return AccessBudgetsPrivacyTemplateParametersOutput(
      budgetParameters: ((json['budgetParameters'] as List?) ?? const [])
          .nonNulls
          .map((e) => BudgetParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceArn: (json['resourceArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final budgetParameters = this.budgetParameters;
    final resourceArn = this.resourceArn;
    return {
      'budgetParameters': budgetParameters,
      'resourceArn': resourceArn,
    };
  }
}

/// Individual budget parameter configuration that defines specific budget
/// allocation settings for access budgets.
///
/// @nodoc
class BudgetParameter {
  /// The budget allocation amount for this specific parameter.
  final int budget;

  /// The type of budget parameter being configured.
  final AccessBudgetType type;

  /// Whether this individual budget parameter automatically refreshes when the
  /// budget period resets.
  final AutoRefreshMode? autoRefresh;

  BudgetParameter({
    required this.budget,
    required this.type,
    this.autoRefresh,
  });

  factory BudgetParameter.fromJson(Map<String, dynamic> json) {
    return BudgetParameter(
      budget: (json['budget'] as int?) ?? 0,
      type: AccessBudgetType.fromString((json['type'] as String?) ?? ''),
      autoRefresh:
          (json['autoRefresh'] as String?)?.let(AutoRefreshMode.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final budget = this.budget;
    final type = this.type;
    final autoRefresh = this.autoRefresh;
    return {
      'budget': budget,
      'type': type.value,
      if (autoRefresh != null) 'autoRefresh': autoRefresh.value,
    };
  }
}

/// @nodoc
class AccessBudgetType {
  static const calendarDay = AccessBudgetType._('CALENDAR_DAY');
  static const calendarMonth = AccessBudgetType._('CALENDAR_MONTH');
  static const calendarWeek = AccessBudgetType._('CALENDAR_WEEK');
  static const lifetime = AccessBudgetType._('LIFETIME');

  final String value;

  const AccessBudgetType._(this.value);

  static const values = [calendarDay, calendarMonth, calendarWeek, lifetime];

  static AccessBudgetType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AccessBudgetType._(value));

  @override
  bool operator ==(other) => other is AccessBudgetType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AutoRefreshMode {
  static const enabled = AutoRefreshMode._('ENABLED');
  static const disabled = AutoRefreshMode._('DISABLED');

  final String value;

  const AutoRefreshMode._(this.value);

  static const values = [enabled, disabled];

  static AutoRefreshMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AutoRefreshMode._(value));

  @override
  bool operator ==(other) => other is AutoRefreshMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The epsilon and noise parameters that you want to update in the privacy
/// budget template.
///
/// @nodoc
class PrivacyBudgetTemplateUpdateParameters {
  /// The new access budget configuration that completely replaces the existing
  /// access budget settings in the privacy budget template.
  final AccessBudgetsPrivacyTemplateUpdateParameters? accessBudget;

  /// An object that specifies the new values for the epsilon and noise
  /// parameters.
  final DifferentialPrivacyTemplateUpdateParameters? differentialPrivacy;

  PrivacyBudgetTemplateUpdateParameters({
    this.accessBudget,
    this.differentialPrivacy,
  });

  Map<String, dynamic> toJson() {
    final accessBudget = this.accessBudget;
    final differentialPrivacy = this.differentialPrivacy;
    return {
      if (accessBudget != null) 'accessBudget': accessBudget,
      if (differentialPrivacy != null)
        'differentialPrivacy': differentialPrivacy,
    };
  }
}

/// The epsilon and noise parameter values that you want to update in the
/// differential privacy template.
///
/// @nodoc
class DifferentialPrivacyTemplateUpdateParameters {
  /// The updated epsilon value that you want to use.
  final int? epsilon;

  /// The updated value of noise added per query. It is measured in terms of the
  /// number of users whose contributions you want to obscure. This value governs
  /// the rate at which the privacy budget is depleted.
  final int? usersNoisePerQuery;

  DifferentialPrivacyTemplateUpdateParameters({
    this.epsilon,
    this.usersNoisePerQuery,
  });

  Map<String, dynamic> toJson() {
    final epsilon = this.epsilon;
    final usersNoisePerQuery = this.usersNoisePerQuery;
    return {
      if (epsilon != null) 'epsilon': epsilon,
      if (usersNoisePerQuery != null) 'usersNoisePerQuery': usersNoisePerQuery,
    };
  }
}

/// Update parameters for privacy budget templates with access budgets
/// functionality, allowing modification of existing budget configurations.
///
/// @nodoc
class AccessBudgetsPrivacyTemplateUpdateParameters {
  /// Updated array of budget parameters for the access budget configuration.
  final List<BudgetParameter> budgetParameters;

  AccessBudgetsPrivacyTemplateUpdateParameters({
    required this.budgetParameters,
  });

  Map<String, dynamic> toJson() {
    final budgetParameters = this.budgetParameters;
    return {
      'budgetParameters': budgetParameters,
    };
  }
}

/// The epsilon and noise parameters that you want to use for the privacy budget
/// template.
///
/// @nodoc
class PrivacyBudgetTemplateParametersInput {
  /// Access budget configuration for the privacy budget template input, enabling
  /// integration with access budget functionality.
  final AccessBudgetsPrivacyTemplateParametersInput? accessBudget;

  /// An object that specifies the epsilon and noise parameters.
  final DifferentialPrivacyTemplateParametersInput? differentialPrivacy;

  PrivacyBudgetTemplateParametersInput({
    this.accessBudget,
    this.differentialPrivacy,
  });

  Map<String, dynamic> toJson() {
    final accessBudget = this.accessBudget;
    final differentialPrivacy = this.differentialPrivacy;
    return {
      if (accessBudget != null) 'accessBudget': accessBudget,
      if (differentialPrivacy != null)
        'differentialPrivacy': differentialPrivacy,
    };
  }
}

/// The epsilon and noise parameter values that you want to use for the
/// differential privacy template.
///
/// @nodoc
class DifferentialPrivacyTemplateParametersInput {
  /// The epsilon value that you want to use.
  final int epsilon;

  /// Noise added per query is measured in terms of the number of users whose
  /// contributions you want to obscure. This value governs the rate at which the
  /// privacy budget is depleted.
  final int usersNoisePerQuery;

  DifferentialPrivacyTemplateParametersInput({
    required this.epsilon,
    required this.usersNoisePerQuery,
  });

  Map<String, dynamic> toJson() {
    final epsilon = this.epsilon;
    final usersNoisePerQuery = this.usersNoisePerQuery;
    return {
      'epsilon': epsilon,
      'usersNoisePerQuery': usersNoisePerQuery,
    };
  }
}

/// Input parameters for privacy budget templates that support access budgets
/// functionality, enabling enhanced budget management capabilities.
///
/// @nodoc
class AccessBudgetsPrivacyTemplateParametersInput {
  /// An array of budget parameters that define the access budget configuration
  /// for the privacy template.
  final List<BudgetParameter> budgetParameters;

  /// The Amazon Resource Name (ARN) of the resource associated with this privacy
  /// budget template.
  final String resourceArn;

  AccessBudgetsPrivacyTemplateParametersInput({
    required this.budgetParameters,
    required this.resourceArn,
  });

  Map<String, dynamic> toJson() {
    final budgetParameters = this.budgetParameters;
    final resourceArn = this.resourceArn;
    return {
      'budgetParameters': budgetParameters,
      'resourceArn': resourceArn,
    };
  }
}

/// The parameters for an Clean Rooms protected query.
///
/// @nodoc
class ProtectedQuery {
  /// The time at which the protected query was created.
  final DateTime createTime;

  /// The identifier for a protected query instance.
  final String id;

  /// The ARN of the membership.
  final String membershipArn;

  /// The identifier for the membership.
  final String membershipId;

  /// The status of the query.
  final ProtectedQueryStatus status;

  /// The compute configuration for the protected query.
  final ComputeConfiguration? computeConfiguration;

  /// The sensitivity parameters of the differential privacy results of the
  /// protected query.
  final DifferentialPrivacyParameters? differentialPrivacy;

  /// An error thrown by the protected query.
  final ProtectedQueryError? error;

  /// The account ID of the member that pays for the query compute costs.
  final String? queryComputePayerAccountId;

  /// The result of the protected query.
  final ProtectedQueryResult? result;

  /// Contains any details needed to write the query results.
  final ProtectedQueryResultConfiguration? resultConfiguration;

  /// The protected query SQL parameters.
  final ProtectedQuerySQLParameters? sqlParameters;

  /// Statistics about protected query execution.
  final ProtectedQueryStatistics? statistics;

  ProtectedQuery({
    required this.createTime,
    required this.id,
    required this.membershipArn,
    required this.membershipId,
    required this.status,
    this.computeConfiguration,
    this.differentialPrivacy,
    this.error,
    this.queryComputePayerAccountId,
    this.result,
    this.resultConfiguration,
    this.sqlParameters,
    this.statistics,
  });

  factory ProtectedQuery.fromJson(Map<String, dynamic> json) {
    return ProtectedQuery(
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      id: (json['id'] as String?) ?? '',
      membershipArn: (json['membershipArn'] as String?) ?? '',
      membershipId: (json['membershipId'] as String?) ?? '',
      status:
          ProtectedQueryStatus.fromString((json['status'] as String?) ?? ''),
      computeConfiguration: json['computeConfiguration'] != null
          ? ComputeConfiguration.fromJson(
              json['computeConfiguration'] as Map<String, dynamic>)
          : null,
      differentialPrivacy: json['differentialPrivacy'] != null
          ? DifferentialPrivacyParameters.fromJson(
              json['differentialPrivacy'] as Map<String, dynamic>)
          : null,
      error: json['error'] != null
          ? ProtectedQueryError.fromJson(json['error'] as Map<String, dynamic>)
          : null,
      queryComputePayerAccountId: json['queryComputePayerAccountId'] as String?,
      result: json['result'] != null
          ? ProtectedQueryResult.fromJson(
              json['result'] as Map<String, dynamic>)
          : null,
      resultConfiguration: json['resultConfiguration'] != null
          ? ProtectedQueryResultConfiguration.fromJson(
              json['resultConfiguration'] as Map<String, dynamic>)
          : null,
      sqlParameters: json['sqlParameters'] != null
          ? ProtectedQuerySQLParameters.fromJson(
              json['sqlParameters'] as Map<String, dynamic>)
          : null,
      statistics: json['statistics'] != null
          ? ProtectedQueryStatistics.fromJson(
              json['statistics'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final id = this.id;
    final membershipArn = this.membershipArn;
    final membershipId = this.membershipId;
    final status = this.status;
    final computeConfiguration = this.computeConfiguration;
    final differentialPrivacy = this.differentialPrivacy;
    final error = this.error;
    final queryComputePayerAccountId = this.queryComputePayerAccountId;
    final result = this.result;
    final resultConfiguration = this.resultConfiguration;
    final sqlParameters = this.sqlParameters;
    final statistics = this.statistics;
    return {
      'createTime': unixTimestampToJson(createTime),
      'id': id,
      'membershipArn': membershipArn,
      'membershipId': membershipId,
      'status': status.value,
      if (computeConfiguration != null)
        'computeConfiguration': computeConfiguration,
      if (differentialPrivacy != null)
        'differentialPrivacy': differentialPrivacy,
      if (error != null) 'error': error,
      if (queryComputePayerAccountId != null)
        'queryComputePayerAccountId': queryComputePayerAccountId,
      if (result != null) 'result': result,
      if (resultConfiguration != null)
        'resultConfiguration': resultConfiguration,
      if (sqlParameters != null) 'sqlParameters': sqlParameters,
      if (statistics != null) 'statistics': statistics,
    };
  }
}

/// The parameters for the SQL type Protected Query.
///
/// @nodoc
class ProtectedQuerySQLParameters {
  /// The Amazon Resource Name (ARN) associated with the analysis template within
  /// a collaboration.
  final String? analysisTemplateArn;

  /// The protected query SQL parameters.
  final Map<String, String>? parameters;

  /// The query string to be submitted.
  final String? queryString;

  ProtectedQuerySQLParameters({
    this.analysisTemplateArn,
    this.parameters,
    this.queryString,
  });

  factory ProtectedQuerySQLParameters.fromJson(Map<String, dynamic> json) {
    return ProtectedQuerySQLParameters(
      analysisTemplateArn: json['analysisTemplateArn'] as String?,
      parameters: (json['parameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      queryString: json['queryString'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final analysisTemplateArn = this.analysisTemplateArn;
    final parameters = this.parameters;
    final queryString = this.queryString;
    return {
      if (analysisTemplateArn != null)
        'analysisTemplateArn': analysisTemplateArn,
      if (parameters != null) 'parameters': parameters,
      if (queryString != null) 'queryString': queryString,
    };
  }
}

/// @nodoc
class ProtectedQueryStatus {
  static const submitted = ProtectedQueryStatus._('SUBMITTED');
  static const started = ProtectedQueryStatus._('STARTED');
  static const cancelled = ProtectedQueryStatus._('CANCELLED');
  static const cancelling = ProtectedQueryStatus._('CANCELLING');
  static const failed = ProtectedQueryStatus._('FAILED');
  static const success = ProtectedQueryStatus._('SUCCESS');
  static const timedOut = ProtectedQueryStatus._('TIMED_OUT');

  final String value;

  const ProtectedQueryStatus._(this.value);

  static const values = [
    submitted,
    started,
    cancelled,
    cancelling,
    failed,
    success,
    timedOut
  ];

  static ProtectedQueryStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ProtectedQueryStatus._(value));

  @override
  bool operator ==(other) =>
      other is ProtectedQueryStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains configurations for protected query results.
///
/// @nodoc
class ProtectedQueryResultConfiguration {
  /// Configuration for protected query results.
  final ProtectedQueryOutputConfiguration outputConfiguration;

  ProtectedQueryResultConfiguration({
    required this.outputConfiguration,
  });

  factory ProtectedQueryResultConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ProtectedQueryResultConfiguration(
      outputConfiguration: ProtectedQueryOutputConfiguration.fromJson(
          (json['outputConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final outputConfiguration = this.outputConfiguration;
    return {
      'outputConfiguration': outputConfiguration,
    };
  }
}

/// Contains statistics about the execution of the protected query.
///
/// @nodoc
class ProtectedQueryStatistics {
  /// The billed resource utilization.
  final BilledResourceUtilization? billedResourceUtilization;

  /// The duration of the protected query, from creation until query completion,
  /// in milliseconds.
  final int? totalDurationInMillis;

  ProtectedQueryStatistics({
    this.billedResourceUtilization,
    this.totalDurationInMillis,
  });

  factory ProtectedQueryStatistics.fromJson(Map<String, dynamic> json) {
    return ProtectedQueryStatistics(
      billedResourceUtilization: json['billedResourceUtilization'] != null
          ? BilledResourceUtilization.fromJson(
              json['billedResourceUtilization'] as Map<String, dynamic>)
          : null,
      totalDurationInMillis: json['totalDurationInMillis'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final billedResourceUtilization = this.billedResourceUtilization;
    final totalDurationInMillis = this.totalDurationInMillis;
    return {
      if (billedResourceUtilization != null)
        'billedResourceUtilization': billedResourceUtilization,
      if (totalDurationInMillis != null)
        'totalDurationInMillis': totalDurationInMillis,
    };
  }
}

/// Details about the query results.
///
/// @nodoc
class ProtectedQueryResult {
  /// The output of the protected query.
  final ProtectedQueryOutput output;

  ProtectedQueryResult({
    required this.output,
  });

  factory ProtectedQueryResult.fromJson(Map<String, dynamic> json) {
    return ProtectedQueryResult(
      output: ProtectedQueryOutput.fromJson(
          (json['output'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final output = this.output;
    return {
      'output': output,
    };
  }
}

/// Details of errors thrown by the protected query.
///
/// @nodoc
class ProtectedQueryError {
  /// An error code for the error.
  final String code;

  /// A description of why the query failed.
  final String message;

  ProtectedQueryError({
    required this.code,
    required this.message,
  });

  factory ProtectedQueryError.fromJson(Map<String, dynamic> json) {
    return ProtectedQueryError(
      code: (json['code'] as String?) ?? '',
      message: (json['message'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      'code': code,
      'message': message,
    };
  }
}

/// An array that contains the sensitivity parameters.
///
/// @nodoc
class DifferentialPrivacyParameters {
  /// Provides the sensitivity parameters that you can use to better understand
  /// the total amount of noise in query results.
  final List<DifferentialPrivacySensitivityParameters> sensitivityParameters;

  DifferentialPrivacyParameters({
    required this.sensitivityParameters,
  });

  factory DifferentialPrivacyParameters.fromJson(Map<String, dynamic> json) {
    return DifferentialPrivacyParameters(
      sensitivityParameters:
          ((json['sensitivityParameters'] as List?) ?? const [])
              .nonNulls
              .map((e) => DifferentialPrivacySensitivityParameters.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final sensitivityParameters = this.sensitivityParameters;
    return {
      'sensitivityParameters': sensitivityParameters,
    };
  }
}

/// The configuration of the compute resources for an analysis with the Spark
/// analytics engine.
///
/// @nodoc
class ComputeConfiguration {
  /// The worker configuration for the compute environment.
  final WorkerComputeConfiguration? worker;

  ComputeConfiguration({
    this.worker,
  });

  factory ComputeConfiguration.fromJson(Map<String, dynamic> json) {
    return ComputeConfiguration(
      worker: json['worker'] != null
          ? WorkerComputeConfiguration.fromJson(
              json['worker'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final worker = this.worker;
    return {
      if (worker != null) 'worker': worker,
    };
  }
}

/// The configuration of the compute resources for workers running an analysis
/// with the Clean Rooms SQL analytics engine.
///
/// @nodoc
class WorkerComputeConfiguration {
  /// The number of workers.
  ///
  /// SQL queries support a minimum value of 2 and a maximum value of 400.
  ///
  /// PySpark jobs support a minimum value of 4 and a maximum value of 128.
  final int? number;

  /// The configuration properties for the worker compute environment. These
  /// properties allow you to customize the compute settings for your Clean Rooms
  /// workloads.
  final WorkerComputeConfigurationProperties? properties;

  /// The worker compute configuration type.
  final WorkerComputeType? type;

  WorkerComputeConfiguration({
    this.number,
    this.properties,
    this.type,
  });

  factory WorkerComputeConfiguration.fromJson(Map<String, dynamic> json) {
    return WorkerComputeConfiguration(
      number: json['number'] as int?,
      properties: json['properties'] != null
          ? WorkerComputeConfigurationProperties.fromJson(
              json['properties'] as Map<String, dynamic>)
          : null,
      type: (json['type'] as String?)?.let(WorkerComputeType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final number = this.number;
    final properties = this.properties;
    final type = this.type;
    return {
      if (number != null) 'number': number,
      if (properties != null) 'properties': properties,
      if (type != null) 'type': type.value,
    };
  }
}

/// @nodoc
class WorkerComputeType {
  static const cr_1x = WorkerComputeType._('CR.1X');
  static const cr_4x = WorkerComputeType._('CR.4X');

  final String value;

  const WorkerComputeType._(this.value);

  static const values = [cr_1x, cr_4x];

  static WorkerComputeType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => WorkerComputeType._(value));

  @override
  bool operator ==(other) => other is WorkerComputeType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The configuration properties that define the compute environment settings
/// for workers in Clean Rooms. These properties enable customization of the
/// underlying compute environment to optimize performance for your specific
/// workloads.
///
/// @nodoc
class WorkerComputeConfigurationProperties {
  /// The Spark configuration properties for SQL and PySpark workloads. This map
  /// contains key-value pairs that configure Apache Spark settings to optimize
  /// performance for your data processing jobs. You can specify up to 50 Spark
  /// properties, with each key being 1-200 characters and each value being 0-500
  /// characters. These properties allow you to adjust compute capacity for large
  /// datasets and complex workloads.
  final Map<String, String>? spark;

  WorkerComputeConfigurationProperties({
    this.spark,
  });

  factory WorkerComputeConfigurationProperties.fromJson(
      Map<String, dynamic> json) {
    return WorkerComputeConfigurationProperties(
      spark: (json['spark'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final spark = this.spark;
    return {
      if (spark != null) 'spark': spark,
    };
  }
}

/// Provides the sensitivity parameters.
///
/// @nodoc
class DifferentialPrivacySensitivityParameters {
  /// The aggregation expression that was run.
  final String aggregationExpression;

  /// The type of aggregation function that was run.
  final DifferentialPrivacyAggregationType aggregationType;

  /// The maximum number of rows contributed by a user in a SQL query.
  final int userContributionLimit;

  /// The upper bound of the aggregation expression.
  final double? maxColumnValue;

  /// The lower bound of the aggregation expression.
  final double? minColumnValue;

  DifferentialPrivacySensitivityParameters({
    required this.aggregationExpression,
    required this.aggregationType,
    required this.userContributionLimit,
    this.maxColumnValue,
    this.minColumnValue,
  });

  factory DifferentialPrivacySensitivityParameters.fromJson(
      Map<String, dynamic> json) {
    return DifferentialPrivacySensitivityParameters(
      aggregationExpression: (json['aggregationExpression'] as String?) ?? '',
      aggregationType: DifferentialPrivacyAggregationType.fromString(
          (json['aggregationType'] as String?) ?? ''),
      userContributionLimit: (json['userContributionLimit'] as int?) ?? 0,
      maxColumnValue: json['maxColumnValue'] as double?,
      minColumnValue: json['minColumnValue'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final aggregationExpression = this.aggregationExpression;
    final aggregationType = this.aggregationType;
    final userContributionLimit = this.userContributionLimit;
    final maxColumnValue = this.maxColumnValue;
    final minColumnValue = this.minColumnValue;
    return {
      'aggregationExpression': aggregationExpression,
      'aggregationType': aggregationType.value,
      'userContributionLimit': userContributionLimit,
      if (maxColumnValue != null) 'maxColumnValue': maxColumnValue,
      if (minColumnValue != null) 'minColumnValue': minColumnValue,
    };
  }
}

/// @nodoc
class DifferentialPrivacyAggregationType {
  static const avg = DifferentialPrivacyAggregationType._('AVG');
  static const count = DifferentialPrivacyAggregationType._('COUNT');
  static const countDistinct =
      DifferentialPrivacyAggregationType._('COUNT_DISTINCT');
  static const sum = DifferentialPrivacyAggregationType._('SUM');
  static const stddev = DifferentialPrivacyAggregationType._('STDDEV');

  final String value;

  const DifferentialPrivacyAggregationType._(this.value);

  static const values = [avg, count, countDistinct, sum, stddev];

  static DifferentialPrivacyAggregationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DifferentialPrivacyAggregationType._(value));

  @override
  bool operator ==(other) =>
      other is DifferentialPrivacyAggregationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains details about the protected query output.
///
/// @nodoc
class ProtectedQueryOutput {
  /// Contains output information for protected queries that use a
  /// <code>distribute</code> output type. This output type lets you send query
  /// results to multiple locations - either to S3 or to collaboration members.
  /// <note>
  /// You can only use the <code>distribute</code> output type with the Spark
  /// analytics engine.
  /// </note>
  final ProtectedQueryDistributeOutput? distribute;

  /// The list of member Amazon Web Services account(s) that received the results
  /// of the query.
  final List<ProtectedQuerySingleMemberOutput>? memberList;

  /// If present, the output for a protected query with an <code>S3</code> output
  /// type.
  final ProtectedQueryS3Output? s3;

  ProtectedQueryOutput({
    this.distribute,
    this.memberList,
    this.s3,
  });

  factory ProtectedQueryOutput.fromJson(Map<String, dynamic> json) {
    return ProtectedQueryOutput(
      distribute: json['distribute'] != null
          ? ProtectedQueryDistributeOutput.fromJson(
              json['distribute'] as Map<String, dynamic>)
          : null,
      memberList: (json['memberList'] as List?)
          ?.nonNulls
          .map((e) => ProtectedQuerySingleMemberOutput.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      s3: json['s3'] != null
          ? ProtectedQueryS3Output.fromJson(json['s3'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final distribute = this.distribute;
    final memberList = this.memberList;
    final s3 = this.s3;
    return {
      if (distribute != null) 'distribute': distribute,
      if (memberList != null) 'memberList': memberList,
      if (s3 != null) 's3': s3,
    };
  }
}

/// Contains output information for protected queries with an S3 output type.
///
/// @nodoc
class ProtectedQueryS3Output {
  /// The S3 location of the result.
  final String location;

  ProtectedQueryS3Output({
    required this.location,
  });

  factory ProtectedQueryS3Output.fromJson(Map<String, dynamic> json) {
    return ProtectedQueryS3Output(
      location: (json['location'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final location = this.location;
    return {
      'location': location,
    };
  }
}

/// Contains the output information for a protected query with a distribute
/// output configuration.
///
/// This output type allows query results to be distributed to multiple
/// receivers, including S3 and collaboration members. It is only available for
/// queries using the Spark analytics engine.
///
/// @nodoc
class ProtectedQueryDistributeOutput {
  /// Contains the output results for each member location specified in the
  /// distribute output configuration. Each entry provides details about the
  /// result distribution to a specific collaboration member.
  final List<ProtectedQuerySingleMemberOutput>? memberList;
  final ProtectedQueryS3Output? s3;

  ProtectedQueryDistributeOutput({
    this.memberList,
    this.s3,
  });

  factory ProtectedQueryDistributeOutput.fromJson(Map<String, dynamic> json) {
    return ProtectedQueryDistributeOutput(
      memberList: (json['memberList'] as List?)
          ?.nonNulls
          .map((e) => ProtectedQuerySingleMemberOutput.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      s3: json['s3'] != null
          ? ProtectedQueryS3Output.fromJson(json['s3'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final memberList = this.memberList;
    final s3 = this.s3;
    return {
      if (memberList != null) 'memberList': memberList,
      if (s3 != null) 's3': s3,
    };
  }
}

/// Details about the member who received the query result.
///
/// @nodoc
class ProtectedQuerySingleMemberOutput {
  /// The Amazon Web Services account ID of the member in the collaboration who
  /// can receive results for the query.
  final String accountId;

  ProtectedQuerySingleMemberOutput({
    required this.accountId,
  });

  factory ProtectedQuerySingleMemberOutput.fromJson(Map<String, dynamic> json) {
    return ProtectedQuerySingleMemberOutput(
      accountId: (json['accountId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    return {
      'accountId': accountId,
    };
  }
}

/// Information related to the utilization of resources that have been billed or
/// charged for in a given context, such as a protected query.
///
/// @nodoc
class BilledResourceUtilization {
  /// The number of Clean Rooms Processing Unit (CRPU) hours that have been
  /// billed.
  final double units;

  BilledResourceUtilization({
    required this.units,
  });

  factory BilledResourceUtilization.fromJson(Map<String, dynamic> json) {
    return BilledResourceUtilization(
      units: (json['units'] as double?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final units = this.units;
    return {
      'units': units,
    };
  }
}

/// Contains configuration details for protected query output.
///
/// @nodoc
class ProtectedQueryOutputConfiguration {
  /// Required configuration for a protected query with a <code>distribute</code>
  /// output type.
  final ProtectedQueryDistributeOutputConfiguration? distribute;

  /// Required configuration for a protected query with a <code>member</code>
  /// output type.
  final ProtectedQueryMemberOutputConfiguration? member;

  /// Required configuration for a protected query with an <code>s3</code> output
  /// type.
  final ProtectedQueryS3OutputConfiguration? s3;

  ProtectedQueryOutputConfiguration({
    this.distribute,
    this.member,
    this.s3,
  });

  factory ProtectedQueryOutputConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ProtectedQueryOutputConfiguration(
      distribute: json['distribute'] != null
          ? ProtectedQueryDistributeOutputConfiguration.fromJson(
              json['distribute'] as Map<String, dynamic>)
          : null,
      member: json['member'] != null
          ? ProtectedQueryMemberOutputConfiguration.fromJson(
              json['member'] as Map<String, dynamic>)
          : null,
      s3: json['s3'] != null
          ? ProtectedQueryS3OutputConfiguration.fromJson(
              json['s3'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final distribute = this.distribute;
    final member = this.member;
    final s3 = this.s3;
    return {
      if (distribute != null) 'distribute': distribute,
      if (member != null) 'member': member,
      if (s3 != null) 's3': s3,
    };
  }
}

/// Contains the configuration to write the query results to S3.
///
/// @nodoc
class ProtectedQueryS3OutputConfiguration {
  /// The S3 bucket to unload the protected query results.
  final String bucket;

  /// Intended file format of the result.
  final ResultFormat resultFormat;

  /// The S3 prefix to unload the protected query results.
  final String? keyPrefix;

  /// Indicates whether files should be output as a single file
  /// (<code>TRUE</code>) or output as multiple files (<code>FALSE</code>). This
  /// parameter is only supported for analyses with the Spark analytics engine.
  final bool? singleFileOutput;

  ProtectedQueryS3OutputConfiguration({
    required this.bucket,
    required this.resultFormat,
    this.keyPrefix,
    this.singleFileOutput,
  });

  factory ProtectedQueryS3OutputConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ProtectedQueryS3OutputConfiguration(
      bucket: (json['bucket'] as String?) ?? '',
      resultFormat:
          ResultFormat.fromString((json['resultFormat'] as String?) ?? ''),
      keyPrefix: json['keyPrefix'] as String?,
      singleFileOutput: json['singleFileOutput'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final resultFormat = this.resultFormat;
    final keyPrefix = this.keyPrefix;
    final singleFileOutput = this.singleFileOutput;
    return {
      'bucket': bucket,
      'resultFormat': resultFormat.value,
      if (keyPrefix != null) 'keyPrefix': keyPrefix,
      if (singleFileOutput != null) 'singleFileOutput': singleFileOutput,
    };
  }
}

/// Contains configuration details for the protected query member output.
///
/// @nodoc
class ProtectedQueryMemberOutputConfiguration {
  /// The unique identifier for the account.
  final String accountId;

  ProtectedQueryMemberOutputConfiguration({
    required this.accountId,
  });

  factory ProtectedQueryMemberOutputConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ProtectedQueryMemberOutputConfiguration(
      accountId: (json['accountId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    return {
      'accountId': accountId,
    };
  }
}

/// Specifies the configuration for distributing protected query results to
/// multiple receivers, including S3 and collaboration members.
///
/// @nodoc
class ProtectedQueryDistributeOutputConfiguration {
  /// A list of locations where you want to distribute the protected query
  /// results. Each location must specify either an S3 destination or a
  /// collaboration member destination.
  /// <important>
  /// You can't specify more than one S3 location.
  ///
  /// You can't specify the query runner's account as a member location.
  ///
  /// You must include either an S3 or member output configuration for each
  /// location, but not both.
  /// </important>
  final List<ProtectedQueryDistributeOutputConfigurationLocation> locations;

  ProtectedQueryDistributeOutputConfiguration({
    required this.locations,
  });

  factory ProtectedQueryDistributeOutputConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ProtectedQueryDistributeOutputConfiguration(
      locations: ((json['locations'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              ProtectedQueryDistributeOutputConfigurationLocation.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final locations = this.locations;
    return {
      'locations': locations,
    };
  }
}

/// Specifies where you'll distribute the results of your protected query. You
/// must configure either an S3 destination or a collaboration member
/// destination.
///
/// @nodoc
class ProtectedQueryDistributeOutputConfigurationLocation {
  final ProtectedQueryMemberOutputConfiguration? member;
  final ProtectedQueryS3OutputConfiguration? s3;

  ProtectedQueryDistributeOutputConfigurationLocation({
    this.member,
    this.s3,
  });

  factory ProtectedQueryDistributeOutputConfigurationLocation.fromJson(
      Map<String, dynamic> json) {
    return ProtectedQueryDistributeOutputConfigurationLocation(
      member: json['member'] != null
          ? ProtectedQueryMemberOutputConfiguration.fromJson(
              json['member'] as Map<String, dynamic>)
          : null,
      s3: json['s3'] != null
          ? ProtectedQueryS3OutputConfiguration.fromJson(
              json['s3'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final member = this.member;
    final s3 = this.s3;
    return {
      if (member != null) 'member': member,
      if (s3 != null) 's3': s3,
    };
  }
}

/// File format of the returned data.
///
/// @nodoc
class ResultFormat {
  static const csv = ResultFormat._('CSV');
  static const parquet = ResultFormat._('PARQUET');

  final String value;

  const ResultFormat._(this.value);

  static const values = [csv, parquet];

  static ResultFormat fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ResultFormat._(value));

  @override
  bool operator ==(other) => other is ResultFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class TargetProtectedQueryStatus {
  static const cancelled = TargetProtectedQueryStatus._('CANCELLED');

  final String value;

  const TargetProtectedQueryStatus._(this.value);

  static const values = [cancelled];

  static TargetProtectedQueryStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TargetProtectedQueryStatus._(value));

  @override
  bool operator ==(other) =>
      other is TargetProtectedQueryStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The parameters for an Clean Rooms protected job.
///
/// @nodoc
class ProtectedJob {
  /// The creation time of the protected job.
  final DateTime createTime;

  /// The identifier for a protected job instance.
  final String id;

  /// The ARN of the membership.
  final String membershipArn;

  /// he identifier for the membership.
  final String membershipId;

  /// The status of the protected job.
  final ProtectedJobStatus status;

  /// The compute configuration for the protected job.
  final ProtectedJobComputeConfiguration? computeConfiguration;

  /// The error from the protected job.
  final ProtectedJobError? error;

  /// The account ID of the member that pays for the job compute costs.
  final String? jobComputePayerAccountId;

  /// The job parameters for the protected job.
  final ProtectedJobParameters? jobParameters;

  /// The result of the protected job.
  final ProtectedJobResult? result;

  /// Contains any details needed to write the job results.
  final ProtectedJobResultConfigurationOutput? resultConfiguration;

  /// The statistics of the protected job.
  final ProtectedJobStatistics? statistics;

  ProtectedJob({
    required this.createTime,
    required this.id,
    required this.membershipArn,
    required this.membershipId,
    required this.status,
    this.computeConfiguration,
    this.error,
    this.jobComputePayerAccountId,
    this.jobParameters,
    this.result,
    this.resultConfiguration,
    this.statistics,
  });

  factory ProtectedJob.fromJson(Map<String, dynamic> json) {
    return ProtectedJob(
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      id: (json['id'] as String?) ?? '',
      membershipArn: (json['membershipArn'] as String?) ?? '',
      membershipId: (json['membershipId'] as String?) ?? '',
      status: ProtectedJobStatus.fromString((json['status'] as String?) ?? ''),
      computeConfiguration: json['computeConfiguration'] != null
          ? ProtectedJobComputeConfiguration.fromJson(
              json['computeConfiguration'] as Map<String, dynamic>)
          : null,
      error: json['error'] != null
          ? ProtectedJobError.fromJson(json['error'] as Map<String, dynamic>)
          : null,
      jobComputePayerAccountId: json['jobComputePayerAccountId'] as String?,
      jobParameters: json['jobParameters'] != null
          ? ProtectedJobParameters.fromJson(
              json['jobParameters'] as Map<String, dynamic>)
          : null,
      result: json['result'] != null
          ? ProtectedJobResult.fromJson(json['result'] as Map<String, dynamic>)
          : null,
      resultConfiguration: json['resultConfiguration'] != null
          ? ProtectedJobResultConfigurationOutput.fromJson(
              json['resultConfiguration'] as Map<String, dynamic>)
          : null,
      statistics: json['statistics'] != null
          ? ProtectedJobStatistics.fromJson(
              json['statistics'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final id = this.id;
    final membershipArn = this.membershipArn;
    final membershipId = this.membershipId;
    final status = this.status;
    final computeConfiguration = this.computeConfiguration;
    final error = this.error;
    final jobComputePayerAccountId = this.jobComputePayerAccountId;
    final jobParameters = this.jobParameters;
    final result = this.result;
    final resultConfiguration = this.resultConfiguration;
    final statistics = this.statistics;
    return {
      'createTime': unixTimestampToJson(createTime),
      'id': id,
      'membershipArn': membershipArn,
      'membershipId': membershipId,
      'status': status.value,
      if (computeConfiguration != null)
        'computeConfiguration': computeConfiguration,
      if (error != null) 'error': error,
      if (jobComputePayerAccountId != null)
        'jobComputePayerAccountId': jobComputePayerAccountId,
      if (jobParameters != null) 'jobParameters': jobParameters,
      if (result != null) 'result': result,
      if (resultConfiguration != null)
        'resultConfiguration': resultConfiguration,
      if (statistics != null) 'statistics': statistics,
    };
  }
}

/// The parameters for the protected job.
///
/// @nodoc
class ProtectedJobParameters {
  /// The ARN of the analysis template.
  final String analysisTemplateArn;

  /// Runtime configuration values passed to the PySpark analysis script.
  /// Parameter names and types must match those defined in the analysis template.
  final Map<String, String>? parameters;

  ProtectedJobParameters({
    required this.analysisTemplateArn,
    this.parameters,
  });

  factory ProtectedJobParameters.fromJson(Map<String, dynamic> json) {
    return ProtectedJobParameters(
      analysisTemplateArn: (json['analysisTemplateArn'] as String?) ?? '',
      parameters: (json['parameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final analysisTemplateArn = this.analysisTemplateArn;
    final parameters = this.parameters;
    return {
      'analysisTemplateArn': analysisTemplateArn,
      if (parameters != null) 'parameters': parameters,
    };
  }
}

/// @nodoc
class ProtectedJobStatus {
  static const submitted = ProtectedJobStatus._('SUBMITTED');
  static const started = ProtectedJobStatus._('STARTED');
  static const cancelled = ProtectedJobStatus._('CANCELLED');
  static const cancelling = ProtectedJobStatus._('CANCELLING');
  static const failed = ProtectedJobStatus._('FAILED');
  static const success = ProtectedJobStatus._('SUCCESS');

  final String value;

  const ProtectedJobStatus._(this.value);

  static const values = [
    submitted,
    started,
    cancelled,
    cancelling,
    failed,
    success
  ];

  static ProtectedJobStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ProtectedJobStatus._(value));

  @override
  bool operator ==(other) =>
      other is ProtectedJobStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The output configuration for a protected job result.
///
/// @nodoc
class ProtectedJobResultConfigurationOutput {
  /// The output configuration.
  final ProtectedJobOutputConfigurationOutput outputConfiguration;

  ProtectedJobResultConfigurationOutput({
    required this.outputConfiguration,
  });

  factory ProtectedJobResultConfigurationOutput.fromJson(
      Map<String, dynamic> json) {
    return ProtectedJobResultConfigurationOutput(
      outputConfiguration: ProtectedJobOutputConfigurationOutput.fromJson(
          (json['outputConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final outputConfiguration = this.outputConfiguration;
    return {
      'outputConfiguration': outputConfiguration,
    };
  }
}

/// Contains statistics about the execution of the protected job.
///
/// @nodoc
class ProtectedJobStatistics {
  /// The billed resource utilization for the protected job.
  final BilledJobResourceUtilization? billedResourceUtilization;

  /// The duration of the protected job, from creation until job completion, in
  /// milliseconds.
  final int? totalDurationInMillis;

  ProtectedJobStatistics({
    this.billedResourceUtilization,
    this.totalDurationInMillis,
  });

  factory ProtectedJobStatistics.fromJson(Map<String, dynamic> json) {
    return ProtectedJobStatistics(
      billedResourceUtilization: json['billedResourceUtilization'] != null
          ? BilledJobResourceUtilization.fromJson(
              json['billedResourceUtilization'] as Map<String, dynamic>)
          : null,
      totalDurationInMillis: json['totalDurationInMillis'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final billedResourceUtilization = this.billedResourceUtilization;
    final totalDurationInMillis = this.totalDurationInMillis;
    return {
      if (billedResourceUtilization != null)
        'billedResourceUtilization': billedResourceUtilization,
      if (totalDurationInMillis != null)
        'totalDurationInMillis': totalDurationInMillis,
    };
  }
}

/// Details about the job results.
///
/// @nodoc
class ProtectedJobResult {
  /// The output of the protected job.
  final ProtectedJobOutput output;

  ProtectedJobResult({
    required this.output,
  });

  factory ProtectedJobResult.fromJson(Map<String, dynamic> json) {
    return ProtectedJobResult(
      output: ProtectedJobOutput.fromJson(
          (json['output'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final output = this.output;
    return {
      'output': output,
    };
  }
}

/// The protected job error.
///
/// @nodoc
class ProtectedJobError {
  /// The error code for the protected job.
  final String code;

  /// The message for the protected job error.
  final String message;

  ProtectedJobError({
    required this.code,
    required this.message,
  });

  factory ProtectedJobError.fromJson(Map<String, dynamic> json) {
    return ProtectedJobError(
      code: (json['code'] as String?) ?? '',
      message: (json['message'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      'code': code,
      'message': message,
    };
  }
}

/// The configuration of the compute resources for a PySpark job.
///
/// @nodoc
class ProtectedJobComputeConfiguration {
  /// The worker configuration for the compute environment.
  final ProtectedJobWorkerComputeConfiguration? worker;

  ProtectedJobComputeConfiguration({
    this.worker,
  });

  factory ProtectedJobComputeConfiguration.fromJson(Map<String, dynamic> json) {
    return ProtectedJobComputeConfiguration(
      worker: json['worker'] != null
          ? ProtectedJobWorkerComputeConfiguration.fromJson(
              json['worker'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final worker = this.worker;
    return {
      if (worker != null) 'worker': worker,
    };
  }
}

/// The configuration of the compute resources for a PySpark job.
///
/// @nodoc
class ProtectedJobWorkerComputeConfiguration {
  /// The number of workers for a PySpark job.
  final int number;

  /// The worker compute configuration type.
  final ProtectedJobWorkerComputeType type;

  /// The configuration properties for the worker compute environment. These
  /// properties allow you to customize the compute settings for your Clean Rooms
  /// workloads.
  final WorkerComputeConfigurationProperties? properties;

  ProtectedJobWorkerComputeConfiguration({
    required this.number,
    required this.type,
    this.properties,
  });

  factory ProtectedJobWorkerComputeConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ProtectedJobWorkerComputeConfiguration(
      number: (json['number'] as int?) ?? 0,
      type: ProtectedJobWorkerComputeType.fromString(
          (json['type'] as String?) ?? ''),
      properties: json['properties'] != null
          ? WorkerComputeConfigurationProperties.fromJson(
              json['properties'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final number = this.number;
    final type = this.type;
    final properties = this.properties;
    return {
      'number': number,
      'type': type.value,
      if (properties != null) 'properties': properties,
    };
  }
}

/// @nodoc
class ProtectedJobWorkerComputeType {
  static const cr_1x = ProtectedJobWorkerComputeType._('CR.1X');
  static const cr_4x = ProtectedJobWorkerComputeType._('CR.4X');

  final String value;

  const ProtectedJobWorkerComputeType._(this.value);

  static const values = [cr_1x, cr_4x];

  static ProtectedJobWorkerComputeType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ProtectedJobWorkerComputeType._(value));

  @override
  bool operator ==(other) =>
      other is ProtectedJobWorkerComputeType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains details about the protected job output.
///
/// @nodoc
class ProtectedJobOutput {
  /// The list of member Amazon Web Services account(s) that received the results
  /// of the job.
  final List<ProtectedJobSingleMemberOutput>? memberList;

  /// If present, the output for a protected job with an `S3` output type.
  final ProtectedJobS3Output? s3;

  ProtectedJobOutput({
    this.memberList,
    this.s3,
  });

  factory ProtectedJobOutput.fromJson(Map<String, dynamic> json) {
    return ProtectedJobOutput(
      memberList: (json['memberList'] as List?)
          ?.nonNulls
          .map((e) => ProtectedJobSingleMemberOutput.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      s3: json['s3'] != null
          ? ProtectedJobS3Output.fromJson(json['s3'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final memberList = this.memberList;
    final s3 = this.s3;
    return {
      if (memberList != null) 'memberList': memberList,
      if (s3 != null) 's3': s3,
    };
  }
}

/// Contains output information for protected jobs with an S3 output type.
///
/// @nodoc
class ProtectedJobS3Output {
  /// The S3 location for the protected job output.
  final String location;

  ProtectedJobS3Output({
    required this.location,
  });

  factory ProtectedJobS3Output.fromJson(Map<String, dynamic> json) {
    return ProtectedJobS3Output(
      location: (json['location'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final location = this.location;
    return {
      'location': location,
    };
  }
}

/// Details about the member who received the job result.
///
/// @nodoc
class ProtectedJobSingleMemberOutput {
  /// The Amazon Web Services account ID of the member in the collaboration who
  /// can receive results from analyses.
  final String accountId;

  ProtectedJobSingleMemberOutput({
    required this.accountId,
  });

  factory ProtectedJobSingleMemberOutput.fromJson(Map<String, dynamic> json) {
    return ProtectedJobSingleMemberOutput(
      accountId: (json['accountId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    return {
      'accountId': accountId,
    };
  }
}

/// Information related to the utilization of resources that have been billed or
/// charged for in a given context, such as a protected job.
///
/// @nodoc
class BilledJobResourceUtilization {
  /// The number of Clean Rooms Processing Unit (CRPU) hours that have been
  /// billed.
  final double units;

  BilledJobResourceUtilization({
    required this.units,
  });

  factory BilledJobResourceUtilization.fromJson(Map<String, dynamic> json) {
    return BilledJobResourceUtilization(
      units: (json['units'] as double?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final units = this.units;
    return {
      'units': units,
    };
  }
}

/// The protected job output configuration output.
///
/// @nodoc
class ProtectedJobOutputConfigurationOutput {
  /// The member output configuration for a protected job.
  final ProtectedJobMemberOutputConfigurationOutput? member;

  /// If present, the output for a protected job with an `S3` output type.
  final ProtectedJobS3OutputConfigurationOutput? s3;

  ProtectedJobOutputConfigurationOutput({
    this.member,
    this.s3,
  });

  factory ProtectedJobOutputConfigurationOutput.fromJson(
      Map<String, dynamic> json) {
    return ProtectedJobOutputConfigurationOutput(
      member: json['member'] != null
          ? ProtectedJobMemberOutputConfigurationOutput.fromJson(
              json['member'] as Map<String, dynamic>)
          : null,
      s3: json['s3'] != null
          ? ProtectedJobS3OutputConfigurationOutput.fromJson(
              json['s3'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final member = this.member;
    final s3 = this.s3;
    return {
      if (member != null) 'member': member,
      if (s3 != null) 's3': s3,
    };
  }
}

/// The output configuration for a protected job's S3 output.
///
/// @nodoc
class ProtectedJobS3OutputConfigurationOutput {
  /// The S3 bucket for job output.
  final String bucket;

  /// The S3 prefix to unload the protected job results.
  final String? keyPrefix;

  ProtectedJobS3OutputConfigurationOutput({
    required this.bucket,
    this.keyPrefix,
  });

  factory ProtectedJobS3OutputConfigurationOutput.fromJson(
      Map<String, dynamic> json) {
    return ProtectedJobS3OutputConfigurationOutput(
      bucket: (json['bucket'] as String?) ?? '',
      keyPrefix: json['keyPrefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final keyPrefix = this.keyPrefix;
    return {
      'bucket': bucket,
      if (keyPrefix != null) 'keyPrefix': keyPrefix,
    };
  }
}

/// The protected job member output configuration output.
///
/// @nodoc
class ProtectedJobMemberOutputConfigurationOutput {
  /// The account ID.
  final String accountId;

  ProtectedJobMemberOutputConfigurationOutput({
    required this.accountId,
  });

  factory ProtectedJobMemberOutputConfigurationOutput.fromJson(
      Map<String, dynamic> json) {
    return ProtectedJobMemberOutputConfigurationOutput(
      accountId: (json['accountId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    return {
      'accountId': accountId,
    };
  }
}

/// @nodoc
class TargetProtectedJobStatus {
  static const cancelled = TargetProtectedJobStatus._('CANCELLED');

  final String value;

  const TargetProtectedJobStatus._(this.value);

  static const values = [cancelled];

  static TargetProtectedJobStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TargetProtectedJobStatus._(value));

  @override
  bool operator ==(other) =>
      other is TargetProtectedJobStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ProtectedQueryType {
  static const sql = ProtectedQueryType._('SQL');

  final String value;

  const ProtectedQueryType._(this.value);

  static const values = [sql];

  static ProtectedQueryType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ProtectedQueryType._(value));

  @override
  bool operator ==(other) =>
      other is ProtectedQueryType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ProtectedJobType {
  static const pyspark = ProtectedJobType._('PYSPARK');

  final String value;

  const ProtectedJobType._(this.value);

  static const values = [pyspark];

  static ProtectedJobType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ProtectedJobType._(value));

  @override
  bool operator ==(other) => other is ProtectedJobType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The protected job result configuration input.
///
/// @nodoc
class ProtectedJobResultConfigurationInput {
  /// The output configuration for a protected job result.
  final ProtectedJobOutputConfigurationInput outputConfiguration;

  ProtectedJobResultConfigurationInput({
    required this.outputConfiguration,
  });

  Map<String, dynamic> toJson() {
    final outputConfiguration = this.outputConfiguration;
    return {
      'outputConfiguration': outputConfiguration,
    };
  }
}

/// The protected job output configuration input.
///
/// @nodoc
class ProtectedJobOutputConfigurationInput {
  /// The member of the protected job output configuration input.
  final ProtectedJobMemberOutputConfigurationInput? member;

  ProtectedJobOutputConfigurationInput({
    this.member,
  });

  Map<String, dynamic> toJson() {
    final member = this.member;
    return {
      if (member != null) 'member': member,
    };
  }
}

/// The protected job member output configuration input.
///
/// @nodoc
class ProtectedJobMemberOutputConfigurationInput {
  /// The account ID.
  final String accountId;

  ProtectedJobMemberOutputConfigurationInput({
    required this.accountId,
  });

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    return {
      'accountId': accountId,
    };
  }
}

/// Provides an estimate of the number of aggregation functions that the member
/// who can query can run given the epsilon and noise parameters.
///
/// @nodoc
class PrivacyImpact {
  /// An object that lists the number and type of aggregation functions you can
  /// perform.
  final DifferentialPrivacyPrivacyImpact? differentialPrivacy;

  PrivacyImpact({
    this.differentialPrivacy,
  });

  factory PrivacyImpact.fromJson(Map<String, dynamic> json) {
    return PrivacyImpact(
      differentialPrivacy: json['differentialPrivacy'] != null
          ? DifferentialPrivacyPrivacyImpact.fromJson(
              json['differentialPrivacy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final differentialPrivacy = this.differentialPrivacy;
    return {
      if (differentialPrivacy != null)
        'differentialPrivacy': differentialPrivacy,
    };
  }
}

/// Information about the number of aggregation functions that the member who
/// can query can run given the epsilon and noise parameters.
///
/// @nodoc
class DifferentialPrivacyPrivacyImpact {
  /// The number of aggregation functions that you can perform.
  final List<DifferentialPrivacyPreviewAggregation> aggregations;

  DifferentialPrivacyPrivacyImpact({
    required this.aggregations,
  });

  factory DifferentialPrivacyPrivacyImpact.fromJson(Map<String, dynamic> json) {
    return DifferentialPrivacyPrivacyImpact(
      aggregations: ((json['aggregations'] as List?) ?? const [])
          .nonNulls
          .map((e) => DifferentialPrivacyPreviewAggregation.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final aggregations = this.aggregations;
    return {
      'aggregations': aggregations,
    };
  }
}

/// Provides an estimate of the number of aggregation functions that the member
/// who can query can run given the epsilon and noise parameters.
///
/// @nodoc
class DifferentialPrivacyPreviewAggregation {
  /// The maximum number of aggregations that the member who can query can run
  /// given the epsilon and noise parameters.
  final int maxCount;

  /// The type of aggregation function.
  final DifferentialPrivacyAggregationType type;

  DifferentialPrivacyPreviewAggregation({
    required this.maxCount,
    required this.type,
  });

  factory DifferentialPrivacyPreviewAggregation.fromJson(
      Map<String, dynamic> json) {
    return DifferentialPrivacyPreviewAggregation(
      maxCount: (json['maxCount'] as int?) ?? 0,
      type: DifferentialPrivacyAggregationType.fromString(
          (json['type'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final maxCount = this.maxCount;
    final type = this.type;
    return {
      'maxCount': maxCount,
      'type': type.value,
    };
  }
}

/// Specifies the updated epsilon and noise parameters to preview. The preview
/// allows you to see how the maximum number of each type of aggregation
/// function would change with the new parameters.
///
/// @nodoc
class PreviewPrivacyImpactParametersInput {
  /// An array that specifies the epsilon and noise parameters.
  final DifferentialPrivacyPreviewParametersInput? differentialPrivacy;

  PreviewPrivacyImpactParametersInput({
    this.differentialPrivacy,
  });

  Map<String, dynamic> toJson() {
    final differentialPrivacy = this.differentialPrivacy;
    return {
      if (differentialPrivacy != null)
        'differentialPrivacy': differentialPrivacy,
    };
  }
}

/// The epsilon and noise parameters that you want to preview.
///
/// @nodoc
class DifferentialPrivacyPreviewParametersInput {
  /// The epsilon value that you want to preview.
  final int epsilon;

  /// Noise added per query is measured in terms of the number of users whose
  /// contributions you want to obscure. This value governs the rate at which the
  /// privacy budget is depleted.
  final int usersNoisePerQuery;

  DifferentialPrivacyPreviewParametersInput({
    required this.epsilon,
    required this.usersNoisePerQuery,
  });

  Map<String, dynamic> toJson() {
    final epsilon = this.epsilon;
    final usersNoisePerQuery = this.usersNoisePerQuery;
    return {
      'epsilon': epsilon,
      'usersNoisePerQuery': usersNoisePerQuery,
    };
  }
}

/// The protected query summary for the objects listed by the request.
///
/// @nodoc
class ProtectedQuerySummary {
  /// The time the protected query was created.
  final DateTime createTime;

  /// The unique ID of the protected query.
  final String id;

  /// The unique ARN for the membership that initiated the protected query.
  final String membershipArn;

  /// The unique ID for the membership that initiated the protected query.
  final String membershipId;

  /// The receiver configuration.
  final List<ReceiverConfiguration> receiverConfigurations;

  /// The status of the protected query.
  final ProtectedQueryStatus status;

  /// The account ID of the member that pays for the query compute costs.
  final String? queryComputePayerAccountId;

  ProtectedQuerySummary({
    required this.createTime,
    required this.id,
    required this.membershipArn,
    required this.membershipId,
    required this.receiverConfigurations,
    required this.status,
    this.queryComputePayerAccountId,
  });

  factory ProtectedQuerySummary.fromJson(Map<String, dynamic> json) {
    return ProtectedQuerySummary(
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      id: (json['id'] as String?) ?? '',
      membershipArn: (json['membershipArn'] as String?) ?? '',
      membershipId: (json['membershipId'] as String?) ?? '',
      receiverConfigurations: ((json['receiverConfigurations'] as List?) ??
              const [])
          .nonNulls
          .map((e) => ReceiverConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      status:
          ProtectedQueryStatus.fromString((json['status'] as String?) ?? ''),
      queryComputePayerAccountId: json['queryComputePayerAccountId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final id = this.id;
    final membershipArn = this.membershipArn;
    final membershipId = this.membershipId;
    final receiverConfigurations = this.receiverConfigurations;
    final status = this.status;
    final queryComputePayerAccountId = this.queryComputePayerAccountId;
    return {
      'createTime': unixTimestampToJson(createTime),
      'id': id,
      'membershipArn': membershipArn,
      'membershipId': membershipId,
      'receiverConfigurations': receiverConfigurations,
      'status': status.value,
      if (queryComputePayerAccountId != null)
        'queryComputePayerAccountId': queryComputePayerAccountId,
    };
  }
}

/// The receiver configuration for a protected query.
///
/// @nodoc
class ReceiverConfiguration {
  /// The type of analysis for the protected query. The results of the query can
  /// be analyzed directly (<code>DIRECT_ANALYSIS</code>) or used as input into
  /// additional analyses (<code>ADDITIONAL_ANALYSIS</code>), such as a query that
  /// is a seed for a lookalike ML model.
  final AnalysisType analysisType;

  /// The configuration details of the receiver configuration.
  final ConfigurationDetails? configurationDetails;

  ReceiverConfiguration({
    required this.analysisType,
    this.configurationDetails,
  });

  factory ReceiverConfiguration.fromJson(Map<String, dynamic> json) {
    return ReceiverConfiguration(
      analysisType:
          AnalysisType.fromString((json['analysisType'] as String?) ?? ''),
      configurationDetails: json['configurationDetails'] != null
          ? ConfigurationDetails.fromJson(
              json['configurationDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final analysisType = this.analysisType;
    final configurationDetails = this.configurationDetails;
    return {
      'analysisType': analysisType.value,
      if (configurationDetails != null)
        'configurationDetails': configurationDetails,
    };
  }
}

/// @nodoc
class AnalysisType {
  static const directAnalysis = AnalysisType._('DIRECT_ANALYSIS');
  static const additionalAnalysis = AnalysisType._('ADDITIONAL_ANALYSIS');

  final String value;

  const AnalysisType._(this.value);

  static const values = [directAnalysis, additionalAnalysis];

  static AnalysisType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => AnalysisType._(value));

  @override
  bool operator ==(other) => other is AnalysisType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The configuration details.
///
/// @nodoc
class ConfigurationDetails {
  /// The direct analysis configuration details.
  final DirectAnalysisConfigurationDetails? directAnalysisConfigurationDetails;

  ConfigurationDetails({
    this.directAnalysisConfigurationDetails,
  });

  factory ConfigurationDetails.fromJson(Map<String, dynamic> json) {
    return ConfigurationDetails(
      directAnalysisConfigurationDetails:
          json['directAnalysisConfigurationDetails'] != null
              ? DirectAnalysisConfigurationDetails.fromJson(
                  json['directAnalysisConfigurationDetails']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final directAnalysisConfigurationDetails =
        this.directAnalysisConfigurationDetails;
    return {
      if (directAnalysisConfigurationDetails != null)
        'directAnalysisConfigurationDetails':
            directAnalysisConfigurationDetails,
    };
  }
}

/// The direct analysis configuration details.
///
/// @nodoc
class DirectAnalysisConfigurationDetails {
  /// The account IDs for the member who received the results of a protected
  /// query.
  final List<String>? receiverAccountIds;

  DirectAnalysisConfigurationDetails({
    this.receiverAccountIds,
  });

  factory DirectAnalysisConfigurationDetails.fromJson(
      Map<String, dynamic> json) {
    return DirectAnalysisConfigurationDetails(
      receiverAccountIds: (json['receiverAccountIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final receiverAccountIds = this.receiverAccountIds;
    return {
      if (receiverAccountIds != null) 'receiverAccountIds': receiverAccountIds,
    };
  }
}

/// The protected job summary for the objects listed by the request.
///
/// @nodoc
class ProtectedJobSummary {
  /// The time the protected job was created.
  final DateTime createTime;

  /// The ID of the protected job.
  final String id;

  /// The unique ARN for the membership that initiated the protected job.
  final String membershipArn;

  /// The unique ID for the membership that initiated the protected job.
  final String membershipId;

  /// The receiver configurations for the protected job.
  final List<ProtectedJobReceiverConfiguration> receiverConfigurations;

  /// The status of the protected job.
  final ProtectedJobStatus status;

  /// The account ID of the member that pays for the job compute costs.
  final String? jobComputePayerAccountId;

  ProtectedJobSummary({
    required this.createTime,
    required this.id,
    required this.membershipArn,
    required this.membershipId,
    required this.receiverConfigurations,
    required this.status,
    this.jobComputePayerAccountId,
  });

  factory ProtectedJobSummary.fromJson(Map<String, dynamic> json) {
    return ProtectedJobSummary(
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      id: (json['id'] as String?) ?? '',
      membershipArn: (json['membershipArn'] as String?) ?? '',
      membershipId: (json['membershipId'] as String?) ?? '',
      receiverConfigurations:
          ((json['receiverConfigurations'] as List?) ?? const [])
              .nonNulls
              .map((e) => ProtectedJobReceiverConfiguration.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      status: ProtectedJobStatus.fromString((json['status'] as String?) ?? ''),
      jobComputePayerAccountId: json['jobComputePayerAccountId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final id = this.id;
    final membershipArn = this.membershipArn;
    final membershipId = this.membershipId;
    final receiverConfigurations = this.receiverConfigurations;
    final status = this.status;
    final jobComputePayerAccountId = this.jobComputePayerAccountId;
    return {
      'createTime': unixTimestampToJson(createTime),
      'id': id,
      'membershipArn': membershipArn,
      'membershipId': membershipId,
      'receiverConfigurations': receiverConfigurations,
      'status': status.value,
      if (jobComputePayerAccountId != null)
        'jobComputePayerAccountId': jobComputePayerAccountId,
    };
  }
}

/// The protected job receiver configuration.
///
/// @nodoc
class ProtectedJobReceiverConfiguration {
  /// The analysis type for the protected job receiver configuration.
  final ProtectedJobAnalysisType analysisType;

  /// The configuration details for the protected job receiver.
  final ProtectedJobConfigurationDetails? configurationDetails;

  ProtectedJobReceiverConfiguration({
    required this.analysisType,
    this.configurationDetails,
  });

  factory ProtectedJobReceiverConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ProtectedJobReceiverConfiguration(
      analysisType: ProtectedJobAnalysisType.fromString(
          (json['analysisType'] as String?) ?? ''),
      configurationDetails: json['configurationDetails'] != null
          ? ProtectedJobConfigurationDetails.fromJson(
              json['configurationDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final analysisType = this.analysisType;
    final configurationDetails = this.configurationDetails;
    return {
      'analysisType': analysisType.value,
      if (configurationDetails != null)
        'configurationDetails': configurationDetails,
    };
  }
}

/// @nodoc
class ProtectedJobAnalysisType {
  static const directAnalysis = ProtectedJobAnalysisType._('DIRECT_ANALYSIS');

  final String value;

  const ProtectedJobAnalysisType._(this.value);

  static const values = [directAnalysis];

  static ProtectedJobAnalysisType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ProtectedJobAnalysisType._(value));

  @override
  bool operator ==(other) =>
      other is ProtectedJobAnalysisType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The protected job configuration details.
///
/// @nodoc
class ProtectedJobConfigurationDetails {
  /// The details needed to configure the direct analysis.
  final ProtectedJobDirectAnalysisConfigurationDetails?
      directAnalysisConfigurationDetails;

  ProtectedJobConfigurationDetails({
    this.directAnalysisConfigurationDetails,
  });

  factory ProtectedJobConfigurationDetails.fromJson(Map<String, dynamic> json) {
    return ProtectedJobConfigurationDetails(
      directAnalysisConfigurationDetails:
          json['directAnalysisConfigurationDetails'] != null
              ? ProtectedJobDirectAnalysisConfigurationDetails.fromJson(
                  json['directAnalysisConfigurationDetails']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final directAnalysisConfigurationDetails =
        this.directAnalysisConfigurationDetails;
    return {
      if (directAnalysisConfigurationDetails != null)
        'directAnalysisConfigurationDetails':
            directAnalysisConfigurationDetails,
    };
  }
}

/// The protected job direct analysis configuration details.
///
/// @nodoc
class ProtectedJobDirectAnalysisConfigurationDetails {
  /// The receiver account IDs.
  final List<String>? receiverAccountIds;

  ProtectedJobDirectAnalysisConfigurationDetails({
    this.receiverAccountIds,
  });

  factory ProtectedJobDirectAnalysisConfigurationDetails.fromJson(
      Map<String, dynamic> json) {
    return ProtectedJobDirectAnalysisConfigurationDetails(
      receiverAccountIds: (json['receiverAccountIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final receiverAccountIds = this.receiverAccountIds;
    return {
      if (receiverAccountIds != null) 'receiverAccountIds': receiverAccountIds,
    };
  }
}

/// An array that summaries the specified privacy budget. This summary includes
/// collaboration information, creation information, membership information, and
/// privacy budget information.
///
/// @nodoc
class PrivacyBudgetSummary {
  /// The provided privacy budget.
  final PrivacyBudget budget;

  /// The ARN of the collaboration that contains this privacy budget.
  final String collaborationArn;

  /// The unique identifier of the collaboration that contains this privacy
  /// budget.
  final String collaborationId;

  /// The time at which the privacy budget was created.
  final DateTime createTime;

  /// The unique identifier of the privacy budget.
  final String id;

  /// The Amazon Resource Name (ARN) of the member who created the privacy budget
  /// summary.
  final String membershipArn;

  /// The identifier for a membership resource.
  final String membershipId;

  /// The ARN of the privacy budget template.
  final String privacyBudgetTemplateArn;

  /// The unique identifier of the privacy budget template.
  final String privacyBudgetTemplateId;

  /// Specifies the type of the privacy budget.
  final PrivacyBudgetType type;

  /// The most recent time at which the privacy budget was updated.
  final DateTime updateTime;

  PrivacyBudgetSummary({
    required this.budget,
    required this.collaborationArn,
    required this.collaborationId,
    required this.createTime,
    required this.id,
    required this.membershipArn,
    required this.membershipId,
    required this.privacyBudgetTemplateArn,
    required this.privacyBudgetTemplateId,
    required this.type,
    required this.updateTime,
  });

  factory PrivacyBudgetSummary.fromJson(Map<String, dynamic> json) {
    return PrivacyBudgetSummary(
      budget: PrivacyBudget.fromJson(
          (json['budget'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      collaborationArn: (json['collaborationArn'] as String?) ?? '',
      collaborationId: (json['collaborationId'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      id: (json['id'] as String?) ?? '',
      membershipArn: (json['membershipArn'] as String?) ?? '',
      membershipId: (json['membershipId'] as String?) ?? '',
      privacyBudgetTemplateArn:
          (json['privacyBudgetTemplateArn'] as String?) ?? '',
      privacyBudgetTemplateId:
          (json['privacyBudgetTemplateId'] as String?) ?? '',
      type: PrivacyBudgetType.fromString((json['type'] as String?) ?? ''),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final budget = this.budget;
    final collaborationArn = this.collaborationArn;
    final collaborationId = this.collaborationId;
    final createTime = this.createTime;
    final id = this.id;
    final membershipArn = this.membershipArn;
    final membershipId = this.membershipId;
    final privacyBudgetTemplateArn = this.privacyBudgetTemplateArn;
    final privacyBudgetTemplateId = this.privacyBudgetTemplateId;
    final type = this.type;
    final updateTime = this.updateTime;
    return {
      'budget': budget,
      'collaborationArn': collaborationArn,
      'collaborationId': collaborationId,
      'createTime': unixTimestampToJson(createTime),
      'id': id,
      'membershipArn': membershipArn,
      'membershipId': membershipId,
      'privacyBudgetTemplateArn': privacyBudgetTemplateArn,
      'privacyBudgetTemplateId': privacyBudgetTemplateId,
      'type': type.value,
      'updateTime': unixTimestampToJson(updateTime),
    };
  }
}

/// The epsilon parameter value and number of each aggregation function that you
/// can perform.
///
/// @nodoc
class PrivacyBudget {
  /// Access budget information associated with this privacy budget.
  final AccessBudget? accessBudget;

  /// An object that specifies the epsilon parameter and the utility in terms of
  /// total aggregations, as well as the remaining aggregations available.
  final DifferentialPrivacyPrivacyBudget? differentialPrivacy;

  PrivacyBudget({
    this.accessBudget,
    this.differentialPrivacy,
  });

  factory PrivacyBudget.fromJson(Map<String, dynamic> json) {
    return PrivacyBudget(
      accessBudget: json['accessBudget'] != null
          ? AccessBudget.fromJson(json['accessBudget'] as Map<String, dynamic>)
          : null,
      differentialPrivacy: json['differentialPrivacy'] != null
          ? DifferentialPrivacyPrivacyBudget.fromJson(
              json['differentialPrivacy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accessBudget = this.accessBudget;
    final differentialPrivacy = this.differentialPrivacy;
    return {
      if (accessBudget != null) 'accessBudget': accessBudget,
      if (differentialPrivacy != null)
        'differentialPrivacy': differentialPrivacy,
    };
  }
}

/// Specifies the configured epsilon value and the utility in terms of total
/// aggregations, as well as the remaining aggregations available.
///
/// @nodoc
class DifferentialPrivacyPrivacyBudget {
  /// This information includes the configured epsilon value and the utility in
  /// terms of total aggregations, as well as the remaining aggregations.
  final List<DifferentialPrivacyPrivacyBudgetAggregation> aggregations;

  /// The epsilon value that you configured.
  final int epsilon;

  DifferentialPrivacyPrivacyBudget({
    required this.aggregations,
    required this.epsilon,
  });

  factory DifferentialPrivacyPrivacyBudget.fromJson(Map<String, dynamic> json) {
    return DifferentialPrivacyPrivacyBudget(
      aggregations: ((json['aggregations'] as List?) ?? const [])
          .nonNulls
          .map((e) => DifferentialPrivacyPrivacyBudgetAggregation.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      epsilon: (json['epsilon'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final aggregations = this.aggregations;
    final epsilon = this.epsilon;
    return {
      'aggregations': aggregations,
      'epsilon': epsilon,
    };
  }
}

/// Controls and tracks usage limits for associated configured tables within a
/// collaboration across queries and job. Supports both period-based budgets
/// that can renew (daily, weekly, or monthly) and fixed lifetime budgets.
/// Contains the resource ARN, remaining budget information, and up to two
/// budget configurations (period-based and lifetime). By default, table usage
/// is unlimited unless a budget is configured.
///
/// @nodoc
class AccessBudget {
  /// The total remaining budget across all budget parameters, showing the lower
  /// value between the per-period budget and lifetime budget for this access
  /// budget. For individual parameter budgets, see <code>remainingBudget</code>.
  final int aggregateRemainingBudget;

  /// Detailed budget information including time bounds, remaining budget, and
  /// refresh settings.
  final List<AccessBudgetDetails> details;

  /// The Amazon Resource Name (ARN) of the access budget resource.
  final String resourceArn;

  AccessBudget({
    required this.aggregateRemainingBudget,
    required this.details,
    required this.resourceArn,
  });

  factory AccessBudget.fromJson(Map<String, dynamic> json) {
    return AccessBudget(
      aggregateRemainingBudget: (json['aggregateRemainingBudget'] as int?) ?? 0,
      details: ((json['details'] as List?) ?? const [])
          .nonNulls
          .map((e) => AccessBudgetDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceArn: (json['resourceArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final aggregateRemainingBudget = this.aggregateRemainingBudget;
    final details = this.details;
    final resourceArn = this.resourceArn;
    return {
      'aggregateRemainingBudget': aggregateRemainingBudget,
      'details': details,
      'resourceArn': resourceArn,
    };
  }
}

/// Detailed information about an access budget including time bounds, budget
/// allocation, and configuration settings.
///
/// @nodoc
class AccessBudgetDetails {
  /// The total budget allocation amount for this access budget.
  final int budget;

  /// Specifies the time period for limiting table usage in queries and jobs. For
  /// calendar-based periods, the budget can renew if auto refresh is enabled. For
  /// lifetime budgets, the limit applies to the total usage throughout the
  /// collaboration. Valid values are:
  ///
  /// <code>CALENDAR_DAY</code> - Limit table usage per day.
  ///
  /// <code>CALENDAR_WEEK</code> - Limit table usage per week.
  ///
  /// <code>CALENDAR_MONTH</code> - Limit table usage per month.
  ///
  /// <code>LIFETIME</code> - Limit total table usage for the collaboration
  /// duration.
  final AccessBudgetType budgetType;

  /// The remaining budget amount available for use within this access budget.
  final int remainingBudget;

  /// The start time for the access budget period.
  final DateTime startTime;

  /// Indicates whether the budget automatically refreshes for each time period
  /// specified in <code>budgetType</code>. Valid values are:
  ///
  /// <code>ENABLED</code> - The budget refreshes automatically at the start of
  /// each period.
  ///
  /// <code>DISABLED</code> - The budget must be refreshed manually.
  ///
  /// <code>NULL</code> - The value is null when <code>budgetType</code> is set to
  /// <code>LIFETIME</code>.
  final AutoRefreshMode? autoRefresh;

  /// The end time for the access budget period.
  final DateTime? endTime;

  AccessBudgetDetails({
    required this.budget,
    required this.budgetType,
    required this.remainingBudget,
    required this.startTime,
    this.autoRefresh,
    this.endTime,
  });

  factory AccessBudgetDetails.fromJson(Map<String, dynamic> json) {
    return AccessBudgetDetails(
      budget: (json['budget'] as int?) ?? 0,
      budgetType:
          AccessBudgetType.fromString((json['budgetType'] as String?) ?? ''),
      remainingBudget: (json['remainingBudget'] as int?) ?? 0,
      startTime: nonNullableTimeStampFromJson(json['startTime'] ?? 0),
      autoRefresh:
          (json['autoRefresh'] as String?)?.let(AutoRefreshMode.fromString),
      endTime: timeStampFromJson(json['endTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final budget = this.budget;
    final budgetType = this.budgetType;
    final remainingBudget = this.remainingBudget;
    final startTime = this.startTime;
    final autoRefresh = this.autoRefresh;
    final endTime = this.endTime;
    return {
      'budget': budget,
      'budgetType': budgetType.value,
      'remainingBudget': remainingBudget,
      'startTime': unixTimestampToJson(startTime),
      if (autoRefresh != null) 'autoRefresh': autoRefresh.value,
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
    };
  }
}

/// Information about the total number of aggregations, as well as the remaining
/// aggregations.
///
/// @nodoc
class DifferentialPrivacyPrivacyBudgetAggregation {
  /// The maximum number of aggregation functions that you can perform with the
  /// given privacy budget.
  final int maxCount;

  /// The remaining number of aggregation functions that can be run with the
  /// available privacy budget.
  final int remainingCount;

  /// The different types of aggregation functions that you can perform.
  final DifferentialPrivacyAggregationType type;

  DifferentialPrivacyPrivacyBudgetAggregation({
    required this.maxCount,
    required this.remainingCount,
    required this.type,
  });

  factory DifferentialPrivacyPrivacyBudgetAggregation.fromJson(
      Map<String, dynamic> json) {
    return DifferentialPrivacyPrivacyBudgetAggregation(
      maxCount: (json['maxCount'] as int?) ?? 0,
      remainingCount: (json['remainingCount'] as int?) ?? 0,
      type: DifferentialPrivacyAggregationType.fromString(
          (json['type'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final maxCount = this.maxCount;
    final remainingCount = this.remainingCount;
    final type = this.type;
    return {
      'maxCount': maxCount,
      'remainingCount': remainingCount,
      'type': type.value,
    };
  }
}

/// The membership object listed by the request.
///
/// @nodoc
class MembershipSummary {
  /// The unique ARN for the membership.
  final String arn;

  /// The unique ARN for the membership's associated collaboration.
  final String collaborationArn;

  /// The identifier of the Amazon Web Services principal that created the
  /// collaboration. Currently only supports Amazon Web Services account ID.
  final String collaborationCreatorAccountId;

  /// The display name of the collaboration creator.
  final String collaborationCreatorDisplayName;

  /// The unique ID for the membership's collaboration.
  final String collaborationId;

  /// The name for the membership's collaboration.
  final String collaborationName;

  /// The time when the membership was created.
  final DateTime createTime;

  /// The unique ID for the membership's collaboration.
  final String id;

  /// The abilities granted to the collaboration member.
  final List<MemberAbility> memberAbilities;

  /// The payment responsibilities accepted by the collaboration member.
  final MembershipPaymentConfiguration paymentConfiguration;

  /// The status of the membership.
  final MembershipStatus status;

  /// The time the membership metadata was last updated.
  final DateTime updateTime;

  /// Provides a summary of the ML abilities for the collaboration member.
  final MLMemberAbilities? mlMemberAbilities;

  MembershipSummary({
    required this.arn,
    required this.collaborationArn,
    required this.collaborationCreatorAccountId,
    required this.collaborationCreatorDisplayName,
    required this.collaborationId,
    required this.collaborationName,
    required this.createTime,
    required this.id,
    required this.memberAbilities,
    required this.paymentConfiguration,
    required this.status,
    required this.updateTime,
    this.mlMemberAbilities,
  });

  factory MembershipSummary.fromJson(Map<String, dynamic> json) {
    return MembershipSummary(
      arn: (json['arn'] as String?) ?? '',
      collaborationArn: (json['collaborationArn'] as String?) ?? '',
      collaborationCreatorAccountId:
          (json['collaborationCreatorAccountId'] as String?) ?? '',
      collaborationCreatorDisplayName:
          (json['collaborationCreatorDisplayName'] as String?) ?? '',
      collaborationId: (json['collaborationId'] as String?) ?? '',
      collaborationName: (json['collaborationName'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      id: (json['id'] as String?) ?? '',
      memberAbilities: ((json['memberAbilities'] as List?) ?? const [])
          .nonNulls
          .map((e) => MemberAbility.fromString((e as String)))
          .toList(),
      paymentConfiguration: MembershipPaymentConfiguration.fromJson(
          (json['paymentConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      status: MembershipStatus.fromString((json['status'] as String?) ?? ''),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      mlMemberAbilities: json['mlMemberAbilities'] != null
          ? MLMemberAbilities.fromJson(
              json['mlMemberAbilities'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final collaborationArn = this.collaborationArn;
    final collaborationCreatorAccountId = this.collaborationCreatorAccountId;
    final collaborationCreatorDisplayName =
        this.collaborationCreatorDisplayName;
    final collaborationId = this.collaborationId;
    final collaborationName = this.collaborationName;
    final createTime = this.createTime;
    final id = this.id;
    final memberAbilities = this.memberAbilities;
    final paymentConfiguration = this.paymentConfiguration;
    final status = this.status;
    final updateTime = this.updateTime;
    final mlMemberAbilities = this.mlMemberAbilities;
    return {
      'arn': arn,
      'collaborationArn': collaborationArn,
      'collaborationCreatorAccountId': collaborationCreatorAccountId,
      'collaborationCreatorDisplayName': collaborationCreatorDisplayName,
      'collaborationId': collaborationId,
      'collaborationName': collaborationName,
      'createTime': unixTimestampToJson(createTime),
      'id': id,
      'memberAbilities': memberAbilities.map((e) => e.value).toList(),
      'paymentConfiguration': paymentConfiguration,
      'status': status.value,
      'updateTime': unixTimestampToJson(updateTime),
      if (mlMemberAbilities != null) 'mlMemberAbilities': mlMemberAbilities,
    };
  }
}

/// @nodoc
class MembershipStatus {
  static const active = MembershipStatus._('ACTIVE');
  static const removed = MembershipStatus._('REMOVED');
  static const collaborationDeleted =
      MembershipStatus._('COLLABORATION_DELETED');

  final String value;

  const MembershipStatus._(this.value);

  static const values = [active, removed, collaborationDeleted];

  static MembershipStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MembershipStatus._(value));

  @override
  bool operator ==(other) => other is MembershipStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The ML member abilities for a collaboration member.
///
/// @nodoc
class MLMemberAbilities {
  /// The custom ML member abilities for a collaboration member.
  final List<CustomMLMemberAbility> customMLMemberAbilities;

  MLMemberAbilities({
    required this.customMLMemberAbilities,
  });

  factory MLMemberAbilities.fromJson(Map<String, dynamic> json) {
    return MLMemberAbilities(
      customMLMemberAbilities:
          ((json['customMLMemberAbilities'] as List?) ?? const [])
              .nonNulls
              .map((e) => CustomMLMemberAbility.fromString((e as String)))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final customMLMemberAbilities = this.customMLMemberAbilities;
    return {
      'customMLMemberAbilities':
          customMLMemberAbilities.map((e) => e.value).toList(),
    };
  }
}

/// An object representing the payment responsibilities accepted by the
/// collaboration member.
///
/// @nodoc
class MembershipPaymentConfiguration {
  /// The payment responsibilities accepted by the collaboration member for query
  /// compute costs.
  final MembershipQueryComputePaymentConfig queryCompute;

  /// The payment responsibilities accepted by the collaboration member for job
  /// compute costs.
  final MembershipJobComputePaymentConfig? jobCompute;

  /// The payment responsibilities accepted by the collaboration member for
  /// machine learning costs.
  final MembershipMLPaymentConfig? machineLearning;

  MembershipPaymentConfiguration({
    required this.queryCompute,
    this.jobCompute,
    this.machineLearning,
  });

  factory MembershipPaymentConfiguration.fromJson(Map<String, dynamic> json) {
    return MembershipPaymentConfiguration(
      queryCompute: MembershipQueryComputePaymentConfig.fromJson(
          (json['queryCompute'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      jobCompute: json['jobCompute'] != null
          ? MembershipJobComputePaymentConfig.fromJson(
              json['jobCompute'] as Map<String, dynamic>)
          : null,
      machineLearning: json['machineLearning'] != null
          ? MembershipMLPaymentConfig.fromJson(
              json['machineLearning'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final queryCompute = this.queryCompute;
    final jobCompute = this.jobCompute;
    final machineLearning = this.machineLearning;
    return {
      'queryCompute': queryCompute,
      if (jobCompute != null) 'jobCompute': jobCompute,
      if (machineLearning != null) 'machineLearning': machineLearning,
    };
  }
}

/// An object representing the payment responsibilities accepted by the
/// collaboration member for query compute costs.
///
/// @nodoc
class MembershipQueryComputePaymentConfig {
  /// Indicates whether the collaboration member has accepted to pay for query
  /// compute costs (<code>TRUE</code>) or has not accepted to pay for query
  /// compute costs (<code>FALSE</code>).
  ///
  /// If the collaboration creator has not specified anyone to pay for query
  /// compute costs, then the member who can query is the default payer.
  ///
  /// An error message is returned for the following reasons:
  ///
  /// <ul>
  /// <li>
  /// If you set the value to <code>FALSE</code> but you are responsible to pay
  /// for query compute costs.
  /// </li>
  /// <li>
  /// If you set the value to <code>TRUE</code> but you are not responsible to pay
  /// for query compute costs.
  /// </li>
  /// </ul>
  final bool isResponsible;

  MembershipQueryComputePaymentConfig({
    required this.isResponsible,
  });

  factory MembershipQueryComputePaymentConfig.fromJson(
      Map<String, dynamic> json) {
    return MembershipQueryComputePaymentConfig(
      isResponsible: (json['isResponsible'] as bool?) ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final isResponsible = this.isResponsible;
    return {
      'isResponsible': isResponsible,
    };
  }
}

/// An object representing the collaboration member's machine learning payment
/// responsibilities set by the collaboration creator.
///
/// @nodoc
class MembershipMLPaymentConfig {
  /// The payment responsibilities accepted by the member for model inference.
  final MembershipModelInferencePaymentConfig? modelInference;

  /// The payment responsibilities accepted by the member for model training.
  final MembershipModelTrainingPaymentConfig? modelTraining;

  /// The payment configuration for synthetic data generation for this machine
  /// learning membership.
  final MembershipSyntheticDataGenerationPaymentConfig? syntheticDataGeneration;

  MembershipMLPaymentConfig({
    this.modelInference,
    this.modelTraining,
    this.syntheticDataGeneration,
  });

  factory MembershipMLPaymentConfig.fromJson(Map<String, dynamic> json) {
    return MembershipMLPaymentConfig(
      modelInference: json['modelInference'] != null
          ? MembershipModelInferencePaymentConfig.fromJson(
              json['modelInference'] as Map<String, dynamic>)
          : null,
      modelTraining: json['modelTraining'] != null
          ? MembershipModelTrainingPaymentConfig.fromJson(
              json['modelTraining'] as Map<String, dynamic>)
          : null,
      syntheticDataGeneration: json['syntheticDataGeneration'] != null
          ? MembershipSyntheticDataGenerationPaymentConfig.fromJson(
              json['syntheticDataGeneration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final modelInference = this.modelInference;
    final modelTraining = this.modelTraining;
    final syntheticDataGeneration = this.syntheticDataGeneration;
    return {
      if (modelInference != null) 'modelInference': modelInference,
      if (modelTraining != null) 'modelTraining': modelTraining,
      if (syntheticDataGeneration != null)
        'syntheticDataGeneration': syntheticDataGeneration,
    };
  }
}

/// An object representing the payment responsibilities accepted by the
/// collaboration member for query and job compute costs.
///
/// @nodoc
class MembershipJobComputePaymentConfig {
  /// Indicates whether the collaboration member has accepted to pay for job
  /// compute costs (<code>TRUE</code>) or has not accepted to pay for query and
  /// job compute costs (<code>FALSE</code>).
  ///
  /// There is only one member who pays for queries and jobs.
  ///
  /// An error message is returned for the following reasons:
  ///
  /// <ul>
  /// <li>
  /// If you set the value to <code>FALSE</code> but you are responsible to pay
  /// for query and job compute costs.
  /// </li>
  /// <li>
  /// If you set the value to <code>TRUE</code> but you are not responsible to pay
  /// for query and job compute costs.
  /// </li>
  /// </ul>
  final bool isResponsible;

  MembershipJobComputePaymentConfig({
    required this.isResponsible,
  });

  factory MembershipJobComputePaymentConfig.fromJson(
      Map<String, dynamic> json) {
    return MembershipJobComputePaymentConfig(
      isResponsible: (json['isResponsible'] as bool?) ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final isResponsible = this.isResponsible;
    return {
      'isResponsible': isResponsible,
    };
  }
}

/// An object representing the collaboration member's model training payment
/// responsibilities set by the collaboration creator.
///
/// @nodoc
class MembershipModelTrainingPaymentConfig {
  /// Indicates whether the collaboration member has accepted to pay for model
  /// training costs (<code>TRUE</code>) or has not accepted to pay for model
  /// training costs (<code>FALSE</code>).
  ///
  /// If the collaboration creator has not specified anyone to pay for model
  /// training costs, then the member who can query is the default payer.
  ///
  /// An error message is returned for the following reasons:
  ///
  /// <ul>
  /// <li>
  /// If you set the value to <code>FALSE</code> but you are responsible to pay
  /// for model training costs.
  /// </li>
  /// <li>
  /// If you set the value to <code>TRUE</code> but you are not responsible to pay
  /// for model training costs.
  /// </li>
  /// </ul>
  final bool isResponsible;

  MembershipModelTrainingPaymentConfig({
    required this.isResponsible,
  });

  factory MembershipModelTrainingPaymentConfig.fromJson(
      Map<String, dynamic> json) {
    return MembershipModelTrainingPaymentConfig(
      isResponsible: (json['isResponsible'] as bool?) ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final isResponsible = this.isResponsible;
    return {
      'isResponsible': isResponsible,
    };
  }
}

/// An object representing the collaboration member's model inference payment
/// responsibilities set by the collaboration creator.
///
/// @nodoc
class MembershipModelInferencePaymentConfig {
  /// Indicates whether the collaboration member has accepted to pay for model
  /// inference costs (<code>TRUE</code>) or has not accepted to pay for model
  /// inference costs (<code>FALSE</code>).
  ///
  /// If the collaboration creator has not specified anyone to pay for model
  /// inference costs, then the member who can query is the default payer.
  ///
  /// An error message is returned for the following reasons:
  ///
  /// <ul>
  /// <li>
  /// If you set the value to <code>FALSE</code> but you are responsible to pay
  /// for model inference costs.
  /// </li>
  /// <li>
  /// If you set the value to <code>TRUE</code> but you are not responsible to pay
  /// for model inference costs.
  /// </li>
  /// </ul>
  final bool isResponsible;

  MembershipModelInferencePaymentConfig({
    required this.isResponsible,
  });

  factory MembershipModelInferencePaymentConfig.fromJson(
      Map<String, dynamic> json) {
    return MembershipModelInferencePaymentConfig(
      isResponsible: (json['isResponsible'] as bool?) ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final isResponsible = this.isResponsible;
    return {
      'isResponsible': isResponsible,
    };
  }
}

/// Configuration for payment for synthetic data generation in a membership.
///
/// @nodoc
class MembershipSyntheticDataGenerationPaymentConfig {
  /// Indicates if this membership is responsible for paying for synthetic data
  /// generation.
  final bool isResponsible;

  MembershipSyntheticDataGenerationPaymentConfig({
    required this.isResponsible,
  });

  factory MembershipSyntheticDataGenerationPaymentConfig.fromJson(
      Map<String, dynamic> json) {
    return MembershipSyntheticDataGenerationPaymentConfig(
      isResponsible: (json['isResponsible'] as bool?) ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final isResponsible = this.isResponsible;
    return {
      'isResponsible': isResponsible,
    };
  }
}

/// @nodoc
class CustomMLMemberAbility {
  static const canReceiveModelOutput =
      CustomMLMemberAbility._('CAN_RECEIVE_MODEL_OUTPUT');
  static const canReceiveInferenceOutput =
      CustomMLMemberAbility._('CAN_RECEIVE_INFERENCE_OUTPUT');

  final String value;

  const CustomMLMemberAbility._(this.value);

  static const values = [canReceiveModelOutput, canReceiveInferenceOutput];

  static CustomMLMemberAbility fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CustomMLMemberAbility._(value));

  @override
  bool operator ==(other) =>
      other is CustomMLMemberAbility && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class MemberAbility {
  static const canQuery = MemberAbility._('CAN_QUERY');
  static const canReceiveResults = MemberAbility._('CAN_RECEIVE_RESULTS');
  static const canRunJob = MemberAbility._('CAN_RUN_JOB');

  final String value;

  const MemberAbility._(this.value);

  static const values = [canQuery, canReceiveResults, canRunJob];

  static MemberAbility fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MemberAbility._(value));

  @override
  bool operator ==(other) => other is MemberAbility && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The membership object.
///
/// @nodoc
class Membership {
  /// The unique ARN for the membership.
  final String arn;

  /// The unique ARN for the membership's associated collaboration.
  final String collaborationArn;

  /// The identifier used to reference members of the collaboration. Currently
  /// only supports Amazon Web Services account ID.
  final String collaborationCreatorAccountId;

  /// The display name of the collaboration creator.
  final String collaborationCreatorDisplayName;

  /// The unique ID for the membership's collaboration.
  final String collaborationId;

  /// The name of the membership's collaboration.
  final String collaborationName;

  /// The time when the membership was created.
  final DateTime createTime;

  /// The unique ID of the membership.
  final String id;

  /// The abilities granted to the collaboration member.
  final List<MemberAbility> memberAbilities;

  /// The payment responsibilities accepted by the collaboration member.
  final MembershipPaymentConfiguration paymentConfiguration;

  /// An indicator as to whether query logging has been enabled or disabled for
  /// the membership.
  ///
  /// When <code>ENABLED</code>, Clean Rooms logs details about queries run within
  /// this collaboration and those logs can be viewed in Amazon CloudWatch Logs.
  /// The default value is <code>DISABLED</code>.
  final MembershipQueryLogStatus queryLogStatus;

  /// The status of the membership.
  final MembershipStatus status;

  /// The time the membership metadata was last updated.
  final DateTime updateTime;

  /// The default job result configuration for the membership.
  final MembershipProtectedJobResultConfiguration?
      defaultJobResultConfiguration;

  /// The default protected query result configuration as specified by the member
  /// who can receive results.
  final MembershipProtectedQueryResultConfiguration? defaultResultConfiguration;

  /// An indicator as to whether Amazon CloudWatch metrics are enabled for the
  /// membership.
  ///
  /// When <code>true</code>, metrics about query execution are collected in
  /// Amazon CloudWatch.
  final bool? isMetricsEnabled;

  /// An indicator as to whether job logging has been enabled or disabled for the
  /// collaboration.
  ///
  /// When <code>ENABLED</code>, Clean Rooms logs details about jobs run within
  /// this collaboration and those logs can be viewed in Amazon CloudWatch Logs.
  /// The default value is <code>DISABLED</code>.
  final MembershipJobLogStatus? jobLogStatus;

  /// Specifies the ML member abilities that are granted to a collaboration
  /// member.
  final MLMemberAbilities? mlMemberAbilities;

  Membership({
    required this.arn,
    required this.collaborationArn,
    required this.collaborationCreatorAccountId,
    required this.collaborationCreatorDisplayName,
    required this.collaborationId,
    required this.collaborationName,
    required this.createTime,
    required this.id,
    required this.memberAbilities,
    required this.paymentConfiguration,
    required this.queryLogStatus,
    required this.status,
    required this.updateTime,
    this.defaultJobResultConfiguration,
    this.defaultResultConfiguration,
    this.isMetricsEnabled,
    this.jobLogStatus,
    this.mlMemberAbilities,
  });

  factory Membership.fromJson(Map<String, dynamic> json) {
    return Membership(
      arn: (json['arn'] as String?) ?? '',
      collaborationArn: (json['collaborationArn'] as String?) ?? '',
      collaborationCreatorAccountId:
          (json['collaborationCreatorAccountId'] as String?) ?? '',
      collaborationCreatorDisplayName:
          (json['collaborationCreatorDisplayName'] as String?) ?? '',
      collaborationId: (json['collaborationId'] as String?) ?? '',
      collaborationName: (json['collaborationName'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      id: (json['id'] as String?) ?? '',
      memberAbilities: ((json['memberAbilities'] as List?) ?? const [])
          .nonNulls
          .map((e) => MemberAbility.fromString((e as String)))
          .toList(),
      paymentConfiguration: MembershipPaymentConfiguration.fromJson(
          (json['paymentConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      queryLogStatus: MembershipQueryLogStatus.fromString(
          (json['queryLogStatus'] as String?) ?? ''),
      status: MembershipStatus.fromString((json['status'] as String?) ?? ''),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      defaultJobResultConfiguration:
          json['defaultJobResultConfiguration'] != null
              ? MembershipProtectedJobResultConfiguration.fromJson(
                  json['defaultJobResultConfiguration'] as Map<String, dynamic>)
              : null,
      defaultResultConfiguration: json['defaultResultConfiguration'] != null
          ? MembershipProtectedQueryResultConfiguration.fromJson(
              json['defaultResultConfiguration'] as Map<String, dynamic>)
          : null,
      isMetricsEnabled: json['isMetricsEnabled'] as bool?,
      jobLogStatus: (json['jobLogStatus'] as String?)
          ?.let(MembershipJobLogStatus.fromString),
      mlMemberAbilities: json['mlMemberAbilities'] != null
          ? MLMemberAbilities.fromJson(
              json['mlMemberAbilities'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final collaborationArn = this.collaborationArn;
    final collaborationCreatorAccountId = this.collaborationCreatorAccountId;
    final collaborationCreatorDisplayName =
        this.collaborationCreatorDisplayName;
    final collaborationId = this.collaborationId;
    final collaborationName = this.collaborationName;
    final createTime = this.createTime;
    final id = this.id;
    final memberAbilities = this.memberAbilities;
    final paymentConfiguration = this.paymentConfiguration;
    final queryLogStatus = this.queryLogStatus;
    final status = this.status;
    final updateTime = this.updateTime;
    final defaultJobResultConfiguration = this.defaultJobResultConfiguration;
    final defaultResultConfiguration = this.defaultResultConfiguration;
    final isMetricsEnabled = this.isMetricsEnabled;
    final jobLogStatus = this.jobLogStatus;
    final mlMemberAbilities = this.mlMemberAbilities;
    return {
      'arn': arn,
      'collaborationArn': collaborationArn,
      'collaborationCreatorAccountId': collaborationCreatorAccountId,
      'collaborationCreatorDisplayName': collaborationCreatorDisplayName,
      'collaborationId': collaborationId,
      'collaborationName': collaborationName,
      'createTime': unixTimestampToJson(createTime),
      'id': id,
      'memberAbilities': memberAbilities.map((e) => e.value).toList(),
      'paymentConfiguration': paymentConfiguration,
      'queryLogStatus': queryLogStatus.value,
      'status': status.value,
      'updateTime': unixTimestampToJson(updateTime),
      if (defaultJobResultConfiguration != null)
        'defaultJobResultConfiguration': defaultJobResultConfiguration,
      if (defaultResultConfiguration != null)
        'defaultResultConfiguration': defaultResultConfiguration,
      if (isMetricsEnabled != null) 'isMetricsEnabled': isMetricsEnabled,
      if (jobLogStatus != null) 'jobLogStatus': jobLogStatus.value,
      if (mlMemberAbilities != null) 'mlMemberAbilities': mlMemberAbilities,
    };
  }
}

/// @nodoc
class MembershipQueryLogStatus {
  static const enabled = MembershipQueryLogStatus._('ENABLED');
  static const disabled = MembershipQueryLogStatus._('DISABLED');

  final String value;

  const MembershipQueryLogStatus._(this.value);

  static const values = [enabled, disabled];

  static MembershipQueryLogStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MembershipQueryLogStatus._(value));

  @override
  bool operator ==(other) =>
      other is MembershipQueryLogStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class MembershipJobLogStatus {
  static const enabled = MembershipJobLogStatus._('ENABLED');
  static const disabled = MembershipJobLogStatus._('DISABLED');

  final String value;

  const MembershipJobLogStatus._(this.value);

  static const values = [enabled, disabled];

  static MembershipJobLogStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MembershipJobLogStatus._(value));

  @override
  bool operator ==(other) =>
      other is MembershipJobLogStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains configurations for protected query results.
///
/// @nodoc
class MembershipProtectedQueryResultConfiguration {
  /// Configuration for protected query results.
  final MembershipProtectedQueryOutputConfiguration outputConfiguration;

  /// The unique ARN for an IAM role that is used by Clean Rooms to write
  /// protected query results to the result location, given by the member who can
  /// receive results.
  final String? roleArn;

  MembershipProtectedQueryResultConfiguration({
    required this.outputConfiguration,
    this.roleArn,
  });

  factory MembershipProtectedQueryResultConfiguration.fromJson(
      Map<String, dynamic> json) {
    return MembershipProtectedQueryResultConfiguration(
      outputConfiguration: MembershipProtectedQueryOutputConfiguration.fromJson(
          (json['outputConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      roleArn: json['roleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final outputConfiguration = this.outputConfiguration;
    final roleArn = this.roleArn;
    return {
      'outputConfiguration': outputConfiguration,
      if (roleArn != null) 'roleArn': roleArn,
    };
  }
}

/// Contains configurations for protected job results.
///
/// @nodoc
class MembershipProtectedJobResultConfiguration {
  /// The output configuration for a protected job result.
  final MembershipProtectedJobOutputConfiguration outputConfiguration;

  /// The unique ARN for an IAM role that is used by Clean Rooms to write
  /// protected job results to the result location, given by the member who can
  /// receive results.
  final String roleArn;

  MembershipProtectedJobResultConfiguration({
    required this.outputConfiguration,
    required this.roleArn,
  });

  factory MembershipProtectedJobResultConfiguration.fromJson(
      Map<String, dynamic> json) {
    return MembershipProtectedJobResultConfiguration(
      outputConfiguration: MembershipProtectedJobOutputConfiguration.fromJson(
          (json['outputConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      roleArn: (json['roleArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final outputConfiguration = this.outputConfiguration;
    final roleArn = this.roleArn;
    return {
      'outputConfiguration': outputConfiguration,
      'roleArn': roleArn,
    };
  }
}

/// Contains configurations for protected job results.
///
/// @nodoc
class MembershipProtectedJobOutputConfiguration {
  /// Contains the configuration to write the job results to S3.
  final ProtectedJobS3OutputConfigurationInput? s3;

  MembershipProtectedJobOutputConfiguration({
    this.s3,
  });

  factory MembershipProtectedJobOutputConfiguration.fromJson(
      Map<String, dynamic> json) {
    return MembershipProtectedJobOutputConfiguration(
      s3: json['s3'] != null
          ? ProtectedJobS3OutputConfigurationInput.fromJson(
              json['s3'] as Map<String, dynamic>)
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

/// Contains input information for protected jobs with an S3 output type.
///
/// @nodoc
class ProtectedJobS3OutputConfigurationInput {
  /// The S3 bucket for job output.
  final String bucket;

  /// The S3 prefix to unload the protected job results.
  final String? keyPrefix;

  ProtectedJobS3OutputConfigurationInput({
    required this.bucket,
    this.keyPrefix,
  });

  factory ProtectedJobS3OutputConfigurationInput.fromJson(
      Map<String, dynamic> json) {
    return ProtectedJobS3OutputConfigurationInput(
      bucket: (json['bucket'] as String?) ?? '',
      keyPrefix: json['keyPrefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final keyPrefix = this.keyPrefix;
    return {
      'bucket': bucket,
      if (keyPrefix != null) 'keyPrefix': keyPrefix,
    };
  }
}

/// Contains configurations for protected query results.
///
/// @nodoc
class MembershipProtectedQueryOutputConfiguration {
  final ProtectedQueryS3OutputConfiguration? s3;

  MembershipProtectedQueryOutputConfiguration({
    this.s3,
  });

  factory MembershipProtectedQueryOutputConfiguration.fromJson(
      Map<String, dynamic> json) {
    return MembershipProtectedQueryOutputConfiguration(
      s3: json['s3'] != null
          ? ProtectedQueryS3OutputConfiguration.fromJson(
              json['s3'] as Map<String, dynamic>)
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

/// An object representing the payment responsibilities to update for the
/// membership.
///
/// @nodoc
class UpdateMembershipPaymentConfiguration {
  final MembershipJobComputePaymentConfig? jobCompute;
  final MembershipMLPaymentConfig? machineLearning;
  final MembershipQueryComputePaymentConfig? queryCompute;

  UpdateMembershipPaymentConfiguration({
    this.jobCompute,
    this.machineLearning,
    this.queryCompute,
  });

  Map<String, dynamic> toJson() {
    final jobCompute = this.jobCompute;
    final machineLearning = this.machineLearning;
    final queryCompute = this.queryCompute;
    return {
      if (jobCompute != null) 'jobCompute': jobCompute,
      if (machineLearning != null) 'machineLearning': machineLearning,
      if (queryCompute != null) 'queryCompute': queryCompute,
    };
  }
}

/// Detailed information about the ID namespace association.
///
/// @nodoc
class IdNamespaceAssociationSummary {
  /// The Amazon Resource Name (ARN) of this ID namespace association.
  final String arn;

  /// The Amazon Resource Name (ARN) of the collaboration that contains this ID
  /// namespace association.
  final String collaborationArn;

  /// The unique identifier of the collaboration that contains this ID namespace
  /// association.
  final String collaborationId;

  /// The time at which this ID namespace association was created.
  final DateTime createTime;

  /// The unique identifier of this ID namespace association.
  final String id;

  /// The input reference configuration details for this ID namespace association.
  final IdNamespaceAssociationInputReferenceConfig inputReferenceConfig;

  /// The input reference properties for this ID namespace association.
  final IdNamespaceAssociationInputReferencePropertiesSummary
      inputReferenceProperties;

  /// The Amazon Resource Name (ARN) of the membership resource for this ID
  /// namespace association.
  final String membershipArn;

  /// The unique identifier of the membership resource for this ID namespace
  /// association.
  final String membershipId;

  /// The name of the ID namespace association.
  final String name;

  /// The most recent time at which this ID namespace association has been
  /// updated.
  final DateTime updateTime;

  /// The description of the ID namespace association.
  final String? description;

  IdNamespaceAssociationSummary({
    required this.arn,
    required this.collaborationArn,
    required this.collaborationId,
    required this.createTime,
    required this.id,
    required this.inputReferenceConfig,
    required this.inputReferenceProperties,
    required this.membershipArn,
    required this.membershipId,
    required this.name,
    required this.updateTime,
    this.description,
  });

  factory IdNamespaceAssociationSummary.fromJson(Map<String, dynamic> json) {
    return IdNamespaceAssociationSummary(
      arn: (json['arn'] as String?) ?? '',
      collaborationArn: (json['collaborationArn'] as String?) ?? '',
      collaborationId: (json['collaborationId'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      id: (json['id'] as String?) ?? '',
      inputReferenceConfig: IdNamespaceAssociationInputReferenceConfig.fromJson(
          (json['inputReferenceConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      inputReferenceProperties:
          IdNamespaceAssociationInputReferencePropertiesSummary.fromJson(
              (json['inputReferenceProperties'] as Map<String, dynamic>?) ??
                  const <String, dynamic>{}),
      membershipArn: (json['membershipArn'] as String?) ?? '',
      membershipId: (json['membershipId'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final collaborationArn = this.collaborationArn;
    final collaborationId = this.collaborationId;
    final createTime = this.createTime;
    final id = this.id;
    final inputReferenceConfig = this.inputReferenceConfig;
    final inputReferenceProperties = this.inputReferenceProperties;
    final membershipArn = this.membershipArn;
    final membershipId = this.membershipId;
    final name = this.name;
    final updateTime = this.updateTime;
    final description = this.description;
    return {
      'arn': arn,
      'collaborationArn': collaborationArn,
      'collaborationId': collaborationId,
      'createTime': unixTimestampToJson(createTime),
      'id': id,
      'inputReferenceConfig': inputReferenceConfig,
      'inputReferenceProperties': inputReferenceProperties,
      'membershipArn': membershipArn,
      'membershipId': membershipId,
      'name': name,
      'updateTime': unixTimestampToJson(updateTime),
      if (description != null) 'description': description,
    };
  }
}

/// Provides the information for the ID namespace association input reference
/// configuration.
///
/// @nodoc
class IdNamespaceAssociationInputReferenceConfig {
  /// The Amazon Resource Name (ARN) of the Entity Resolution resource that is
  /// being associated to the collaboration. Valid resource ARNs are from the ID
  /// namespaces that you own.
  final String inputReferenceArn;

  /// When <code>TRUE</code>, Clean Rooms manages permissions for the ID namespace
  /// association resource.
  ///
  /// When <code>FALSE</code>, the resource owner manages permissions for the ID
  /// namespace association resource.
  final bool manageResourcePolicies;

  IdNamespaceAssociationInputReferenceConfig({
    required this.inputReferenceArn,
    required this.manageResourcePolicies,
  });

  factory IdNamespaceAssociationInputReferenceConfig.fromJson(
      Map<String, dynamic> json) {
    return IdNamespaceAssociationInputReferenceConfig(
      inputReferenceArn: (json['inputReferenceArn'] as String?) ?? '',
      manageResourcePolicies:
          (json['manageResourcePolicies'] as bool?) ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final inputReferenceArn = this.inputReferenceArn;
    final manageResourcePolicies = this.manageResourcePolicies;
    return {
      'inputReferenceArn': inputReferenceArn,
      'manageResourcePolicies': manageResourcePolicies,
    };
  }
}

/// Detailed information about the ID namespace association input reference
/// properties.
///
/// @nodoc
class IdNamespaceAssociationInputReferencePropertiesSummary {
  /// The ID namespace type for this ID namespace association.
  final IdNamespaceType idNamespaceType;

  IdNamespaceAssociationInputReferencePropertiesSummary({
    required this.idNamespaceType,
  });

  factory IdNamespaceAssociationInputReferencePropertiesSummary.fromJson(
      Map<String, dynamic> json) {
    return IdNamespaceAssociationInputReferencePropertiesSummary(
      idNamespaceType: IdNamespaceType.fromString(
          (json['idNamespaceType'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final idNamespaceType = this.idNamespaceType;
    return {
      'idNamespaceType': idNamespaceType.value,
    };
  }
}

/// @nodoc
class IdNamespaceType {
  static const source = IdNamespaceType._('SOURCE');
  static const target = IdNamespaceType._('TARGET');

  final String value;

  const IdNamespaceType._(this.value);

  static const values = [source, target];

  static IdNamespaceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IdNamespaceType._(value));

  @override
  bool operator ==(other) => other is IdNamespaceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Provides information to create the ID namespace association.
///
/// @nodoc
class IdNamespaceAssociation {
  /// The Amazon Resource Name (ARN) of the ID namespace association.
  final String arn;

  /// The Amazon Resource Name (ARN) of the collaboration that contains this ID
  /// namespace association.
  final String collaborationArn;

  /// The unique identifier of the collaboration that contains this ID namespace
  /// association.
  final String collaborationId;

  /// The time at which the ID namespace association was created.
  final DateTime createTime;

  /// The unique identifier for this ID namespace association.
  final String id;

  /// The input reference configuration for the ID namespace association.
  final IdNamespaceAssociationInputReferenceConfig inputReferenceConfig;

  /// The input reference properties for the ID namespace association.
  final IdNamespaceAssociationInputReferenceProperties inputReferenceProperties;

  /// The Amazon Resource Name (ARN) of the membership resource for this ID
  /// namespace association.
  final String membershipArn;

  /// The unique identifier of the membership resource for this ID namespace
  /// association.
  final String membershipId;

  /// The name of this ID namespace association.
  final String name;

  /// The most recent time at which the ID namespace association was updated.
  final DateTime updateTime;

  /// The description of the ID namespace association.
  final String? description;

  /// The configuration settings for the ID mapping table.
  final IdMappingConfig? idMappingConfig;

  IdNamespaceAssociation({
    required this.arn,
    required this.collaborationArn,
    required this.collaborationId,
    required this.createTime,
    required this.id,
    required this.inputReferenceConfig,
    required this.inputReferenceProperties,
    required this.membershipArn,
    required this.membershipId,
    required this.name,
    required this.updateTime,
    this.description,
    this.idMappingConfig,
  });

  factory IdNamespaceAssociation.fromJson(Map<String, dynamic> json) {
    return IdNamespaceAssociation(
      arn: (json['arn'] as String?) ?? '',
      collaborationArn: (json['collaborationArn'] as String?) ?? '',
      collaborationId: (json['collaborationId'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      id: (json['id'] as String?) ?? '',
      inputReferenceConfig: IdNamespaceAssociationInputReferenceConfig.fromJson(
          (json['inputReferenceConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      inputReferenceProperties:
          IdNamespaceAssociationInputReferenceProperties.fromJson(
              (json['inputReferenceProperties'] as Map<String, dynamic>?) ??
                  const <String, dynamic>{}),
      membershipArn: (json['membershipArn'] as String?) ?? '',
      membershipId: (json['membershipId'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      description: json['description'] as String?,
      idMappingConfig: json['idMappingConfig'] != null
          ? IdMappingConfig.fromJson(
              json['idMappingConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final collaborationArn = this.collaborationArn;
    final collaborationId = this.collaborationId;
    final createTime = this.createTime;
    final id = this.id;
    final inputReferenceConfig = this.inputReferenceConfig;
    final inputReferenceProperties = this.inputReferenceProperties;
    final membershipArn = this.membershipArn;
    final membershipId = this.membershipId;
    final name = this.name;
    final updateTime = this.updateTime;
    final description = this.description;
    final idMappingConfig = this.idMappingConfig;
    return {
      'arn': arn,
      'collaborationArn': collaborationArn,
      'collaborationId': collaborationId,
      'createTime': unixTimestampToJson(createTime),
      'id': id,
      'inputReferenceConfig': inputReferenceConfig,
      'inputReferenceProperties': inputReferenceProperties,
      'membershipArn': membershipArn,
      'membershipId': membershipId,
      'name': name,
      'updateTime': unixTimestampToJson(updateTime),
      if (description != null) 'description': description,
      if (idMappingConfig != null) 'idMappingConfig': idMappingConfig,
    };
  }
}

/// Provides the information for the ID namespace association input reference
/// properties.
///
/// @nodoc
class IdNamespaceAssociationInputReferenceProperties {
  /// Defines how ID mapping workflows are supported for this ID namespace
  /// association.
  final List<Document> idMappingWorkflowsSupported;

  /// The ID namespace type for this ID namespace association.
  final IdNamespaceType idNamespaceType;

  IdNamespaceAssociationInputReferenceProperties({
    required this.idMappingWorkflowsSupported,
    required this.idNamespaceType,
  });

  factory IdNamespaceAssociationInputReferenceProperties.fromJson(
      Map<String, dynamic> json) {
    return IdNamespaceAssociationInputReferenceProperties(
      idMappingWorkflowsSupported:
          ((json['idMappingWorkflowsSupported'] as List?) ?? const [])
              .nonNulls
              .map((e) => Document.fromJson(e as Map<String, dynamic>))
              .toList(),
      idNamespaceType: IdNamespaceType.fromString(
          (json['idNamespaceType'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final idMappingWorkflowsSupported = this.idMappingWorkflowsSupported;
    final idNamespaceType = this.idNamespaceType;
    return {
      'idMappingWorkflowsSupported': idMappingWorkflowsSupported,
      'idNamespaceType': idNamespaceType.value,
    };
  }
}

/// The configuration settings for the ID mapping table.
///
/// @nodoc
class IdMappingConfig {
  /// An indicator as to whether you can use your column as a dimension column in
  /// the ID mapping table (<code>TRUE</code>) or not (<code>FALSE</code>).
  ///
  /// Default is <code>FALSE</code>.
  final bool allowUseAsDimensionColumn;

  IdMappingConfig({
    required this.allowUseAsDimensionColumn,
  });

  factory IdMappingConfig.fromJson(Map<String, dynamic> json) {
    return IdMappingConfig(
      allowUseAsDimensionColumn:
          (json['allowUseAsDimensionColumn'] as bool?) ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final allowUseAsDimensionColumn = this.allowUseAsDimensionColumn;
    return {
      'allowUseAsDimensionColumn': allowUseAsDimensionColumn,
    };
  }
}

/// @nodoc
class JobType {
  static const batch = JobType._('BATCH');
  static const incremental = JobType._('INCREMENTAL');
  static const deleteOnly = JobType._('DELETE_ONLY');

  final String value;

  const JobType._(this.value);

  static const values = [batch, incremental, deleteOnly];

  static JobType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => JobType._(value));

  @override
  bool operator ==(other) => other is JobType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Detailed information about the ID mapping table.
///
/// @nodoc
class IdMappingTableSummary {
  /// The Amazon Resource Name (ARN) of this ID mapping table.
  final String arn;

  /// The Amazon Resource Name (ARN) of the collaboration that contains this ID
  /// mapping table.
  final String collaborationArn;

  /// The unique identifier of the collaboration that contains this ID mapping
  /// table.
  final String collaborationId;

  /// The time at which this ID mapping table was created.
  final DateTime createTime;

  /// The unique identifier of this ID mapping table.
  final String id;

  /// The input reference configuration for the ID mapping table.
  final IdMappingTableInputReferenceConfig inputReferenceConfig;

  /// The Amazon Resource Name (ARN) of the membership resource for this ID
  /// mapping table.
  final String membershipArn;

  /// The unique identifier of the membership resource for this ID mapping table.
  final String membershipId;

  /// The name of this ID mapping table.
  final String name;

  /// The most recent time at which this ID mapping table was updated.
  final DateTime updateTime;

  /// The description of this ID mapping table.
  final String? description;

  IdMappingTableSummary({
    required this.arn,
    required this.collaborationArn,
    required this.collaborationId,
    required this.createTime,
    required this.id,
    required this.inputReferenceConfig,
    required this.membershipArn,
    required this.membershipId,
    required this.name,
    required this.updateTime,
    this.description,
  });

  factory IdMappingTableSummary.fromJson(Map<String, dynamic> json) {
    return IdMappingTableSummary(
      arn: (json['arn'] as String?) ?? '',
      collaborationArn: (json['collaborationArn'] as String?) ?? '',
      collaborationId: (json['collaborationId'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      id: (json['id'] as String?) ?? '',
      inputReferenceConfig: IdMappingTableInputReferenceConfig.fromJson(
          (json['inputReferenceConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      membershipArn: (json['membershipArn'] as String?) ?? '',
      membershipId: (json['membershipId'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final collaborationArn = this.collaborationArn;
    final collaborationId = this.collaborationId;
    final createTime = this.createTime;
    final id = this.id;
    final inputReferenceConfig = this.inputReferenceConfig;
    final membershipArn = this.membershipArn;
    final membershipId = this.membershipId;
    final name = this.name;
    final updateTime = this.updateTime;
    final description = this.description;
    return {
      'arn': arn,
      'collaborationArn': collaborationArn,
      'collaborationId': collaborationId,
      'createTime': unixTimestampToJson(createTime),
      'id': id,
      'inputReferenceConfig': inputReferenceConfig,
      'membershipArn': membershipArn,
      'membershipId': membershipId,
      'name': name,
      'updateTime': unixTimestampToJson(updateTime),
      if (description != null) 'description': description,
    };
  }
}

/// Provides the input reference configuration for the ID mapping table.
///
/// @nodoc
class IdMappingTableInputReferenceConfig {
  /// The Amazon Resource Name (ARN) of the referenced resource in Entity
  /// Resolution. Valid values are ID mapping workflow ARNs.
  final String inputReferenceArn;

  /// When <code>TRUE</code>, Clean Rooms manages permissions for the ID mapping
  /// table resource.
  ///
  /// When <code>FALSE</code>, the resource owner manages permissions for the ID
  /// mapping table resource.
  final bool manageResourcePolicies;

  IdMappingTableInputReferenceConfig({
    required this.inputReferenceArn,
    required this.manageResourcePolicies,
  });

  factory IdMappingTableInputReferenceConfig.fromJson(
      Map<String, dynamic> json) {
    return IdMappingTableInputReferenceConfig(
      inputReferenceArn: (json['inputReferenceArn'] as String?) ?? '',
      manageResourcePolicies:
          (json['manageResourcePolicies'] as bool?) ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final inputReferenceArn = this.inputReferenceArn;
    final manageResourcePolicies = this.manageResourcePolicies;
    return {
      'inputReferenceArn': inputReferenceArn,
      'manageResourcePolicies': manageResourcePolicies,
    };
  }
}

/// Describes information about the ID mapping table.
///
/// @nodoc
class IdMappingTable {
  /// The Amazon Resource Name (ARN) of the ID mapping table.
  final String arn;

  /// The Amazon Resource Name (ARN) of the collaboration that contains this ID
  /// mapping table.
  final String collaborationArn;

  /// The unique identifier of the collaboration that contains this ID mapping
  /// table.
  final String collaborationId;

  /// The time at which the ID mapping table was created.
  final DateTime createTime;

  /// The unique identifier of the ID mapping table.
  final String id;

  /// The input reference configuration for the ID mapping table.
  final IdMappingTableInputReferenceConfig inputReferenceConfig;

  /// The input reference properties for the ID mapping table.
  final IdMappingTableInputReferenceProperties inputReferenceProperties;

  /// The Amazon Resource Name (ARN) of the membership resource for the ID mapping
  /// table.
  final String membershipArn;

  /// The unique identifier of the membership resource for the ID mapping table.
  final String membershipId;

  /// The name of the ID mapping table.
  final String name;

  /// The most recent time at which the ID mapping table was updated.
  final DateTime updateTime;

  /// The description of the ID mapping table.
  final String? description;

  /// The Amazon Resource Name (ARN) of the Amazon Web Services KMS key.
  final String? kmsKeyArn;

  IdMappingTable({
    required this.arn,
    required this.collaborationArn,
    required this.collaborationId,
    required this.createTime,
    required this.id,
    required this.inputReferenceConfig,
    required this.inputReferenceProperties,
    required this.membershipArn,
    required this.membershipId,
    required this.name,
    required this.updateTime,
    this.description,
    this.kmsKeyArn,
  });

  factory IdMappingTable.fromJson(Map<String, dynamic> json) {
    return IdMappingTable(
      arn: (json['arn'] as String?) ?? '',
      collaborationArn: (json['collaborationArn'] as String?) ?? '',
      collaborationId: (json['collaborationId'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      id: (json['id'] as String?) ?? '',
      inputReferenceConfig: IdMappingTableInputReferenceConfig.fromJson(
          (json['inputReferenceConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      inputReferenceProperties: IdMappingTableInputReferenceProperties.fromJson(
          (json['inputReferenceProperties'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      membershipArn: (json['membershipArn'] as String?) ?? '',
      membershipId: (json['membershipId'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      description: json['description'] as String?,
      kmsKeyArn: json['kmsKeyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final collaborationArn = this.collaborationArn;
    final collaborationId = this.collaborationId;
    final createTime = this.createTime;
    final id = this.id;
    final inputReferenceConfig = this.inputReferenceConfig;
    final inputReferenceProperties = this.inputReferenceProperties;
    final membershipArn = this.membershipArn;
    final membershipId = this.membershipId;
    final name = this.name;
    final updateTime = this.updateTime;
    final description = this.description;
    final kmsKeyArn = this.kmsKeyArn;
    return {
      'arn': arn,
      'collaborationArn': collaborationArn,
      'collaborationId': collaborationId,
      'createTime': unixTimestampToJson(createTime),
      'id': id,
      'inputReferenceConfig': inputReferenceConfig,
      'inputReferenceProperties': inputReferenceProperties,
      'membershipArn': membershipArn,
      'membershipId': membershipId,
      'name': name,
      'updateTime': unixTimestampToJson(updateTime),
      if (description != null) 'description': description,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
    };
  }
}

/// The input reference properties for the ID mapping table.
///
/// @nodoc
class IdMappingTableInputReferenceProperties {
  /// The input source of the ID mapping table.
  final List<IdMappingTableInputSource> idMappingTableInputSource;

  IdMappingTableInputReferenceProperties({
    required this.idMappingTableInputSource,
  });

  factory IdMappingTableInputReferenceProperties.fromJson(
      Map<String, dynamic> json) {
    return IdMappingTableInputReferenceProperties(
      idMappingTableInputSource:
          ((json['idMappingTableInputSource'] as List?) ?? const [])
              .nonNulls
              .map((e) =>
                  IdMappingTableInputSource.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final idMappingTableInputSource = this.idMappingTableInputSource;
    return {
      'idMappingTableInputSource': idMappingTableInputSource,
    };
  }
}

/// The input source of the ID mapping table.
///
/// @nodoc
class IdMappingTableInputSource {
  /// The unique identifier of the ID namespace association.
  final String idNamespaceAssociationId;

  /// The type of the input source of the ID mapping table.
  final IdNamespaceType type;

  IdMappingTableInputSource({
    required this.idNamespaceAssociationId,
    required this.type,
  });

  factory IdMappingTableInputSource.fromJson(Map<String, dynamic> json) {
    return IdMappingTableInputSource(
      idNamespaceAssociationId:
          (json['idNamespaceAssociationId'] as String?) ?? '',
      type: IdNamespaceType.fromString((json['type'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final idNamespaceAssociationId = this.idNamespaceAssociationId;
    final type = this.type;
    return {
      'idNamespaceAssociationId': idNamespaceAssociationId,
      'type': type.value,
    };
  }
}

/// A configured table analysis rule, which limits how data for this table can
/// be used.
///
/// @nodoc
class ConfiguredTableAnalysisRule {
  /// The unique ARN for the configured table.
  final String configuredTableArn;

  /// The unique ID for the configured table.
  final String configuredTableId;

  /// The time the configured table analysis rule was created.
  final DateTime createTime;

  /// The policy that controls SQL query rules.
  final ConfiguredTableAnalysisRulePolicy policy;

  /// The type of configured table analysis rule.
  final ConfiguredTableAnalysisRuleType type;

  /// The time the configured table analysis rule was last updated.
  final DateTime updateTime;

  ConfiguredTableAnalysisRule({
    required this.configuredTableArn,
    required this.configuredTableId,
    required this.createTime,
    required this.policy,
    required this.type,
    required this.updateTime,
  });

  factory ConfiguredTableAnalysisRule.fromJson(Map<String, dynamic> json) {
    return ConfiguredTableAnalysisRule(
      configuredTableArn: (json['configuredTableArn'] as String?) ?? '',
      configuredTableId: (json['configuredTableId'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      policy: ConfiguredTableAnalysisRulePolicy.fromJson(
          (json['policy'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      type: ConfiguredTableAnalysisRuleType.fromString(
          (json['type'] as String?) ?? ''),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final configuredTableArn = this.configuredTableArn;
    final configuredTableId = this.configuredTableId;
    final createTime = this.createTime;
    final policy = this.policy;
    final type = this.type;
    final updateTime = this.updateTime;
    return {
      'configuredTableArn': configuredTableArn,
      'configuredTableId': configuredTableId,
      'createTime': unixTimestampToJson(createTime),
      'policy': policy,
      'type': type.value,
      'updateTime': unixTimestampToJson(updateTime),
    };
  }
}

/// Controls on the query specifications that can be run on a configured table.
///
/// @nodoc
class ConfiguredTableAnalysisRulePolicy {
  /// Controls on the query specifications that can be run on a configured table.
  final ConfiguredTableAnalysisRulePolicyV1? v1;

  ConfiguredTableAnalysisRulePolicy({
    this.v1,
  });

  factory ConfiguredTableAnalysisRulePolicy.fromJson(
      Map<String, dynamic> json) {
    return ConfiguredTableAnalysisRulePolicy(
      v1: json['v1'] != null
          ? ConfiguredTableAnalysisRulePolicyV1.fromJson(
              json['v1'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final v1 = this.v1;
    return {
      if (v1 != null) 'v1': v1,
    };
  }
}

/// @nodoc
class ConfiguredTableAnalysisRuleType {
  static const aggregation = ConfiguredTableAnalysisRuleType._('AGGREGATION');
  static const list = ConfiguredTableAnalysisRuleType._('LIST');
  static const custom = ConfiguredTableAnalysisRuleType._('CUSTOM');

  final String value;

  const ConfiguredTableAnalysisRuleType._(this.value);

  static const values = [aggregation, list, custom];

  static ConfiguredTableAnalysisRuleType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ConfiguredTableAnalysisRuleType._(value));

  @override
  bool operator ==(other) =>
      other is ConfiguredTableAnalysisRuleType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Controls on the query specifications that can be run on a configured table.
///
/// @nodoc
class ConfiguredTableAnalysisRulePolicyV1 {
  /// Analysis rule type that enables only aggregation queries on a configured
  /// table.
  final AnalysisRuleAggregation? aggregation;
  final AnalysisRuleCustom? custom;

  /// Analysis rule type that enables only list queries on a configured table.
  final AnalysisRuleList? list;

  ConfiguredTableAnalysisRulePolicyV1({
    this.aggregation,
    this.custom,
    this.list,
  });

  factory ConfiguredTableAnalysisRulePolicyV1.fromJson(
      Map<String, dynamic> json) {
    return ConfiguredTableAnalysisRulePolicyV1(
      aggregation: json['aggregation'] != null
          ? AnalysisRuleAggregation.fromJson(
              json['aggregation'] as Map<String, dynamic>)
          : null,
      custom: json['custom'] != null
          ? AnalysisRuleCustom.fromJson(json['custom'] as Map<String, dynamic>)
          : null,
      list: json['list'] != null
          ? AnalysisRuleList.fromJson(json['list'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final aggregation = this.aggregation;
    final custom = this.custom;
    final list = this.list;
    return {
      if (aggregation != null) 'aggregation': aggregation,
      if (custom != null) 'custom': custom,
      if (list != null) 'list': list,
    };
  }
}

/// A type of analysis rule that enables row-level analysis.
///
/// @nodoc
class AnalysisRuleList {
  /// Columns that can be used to join a configured table with the table of the
  /// member who can query and other members' configured tables.
  final List<String> joinColumns;

  /// Columns that can be listed in the output.
  final List<String> listColumns;

  /// An indicator as to whether additional analyses (such as Clean Rooms ML) can
  /// be applied to the output of the direct query.
  final AdditionalAnalyses? additionalAnalyses;

  /// The logical operators (if any) that are to be used in an INNER JOIN match
  /// condition. Default is <code>AND</code>.
  final List<JoinOperator>? allowedJoinOperators;

  AnalysisRuleList({
    required this.joinColumns,
    required this.listColumns,
    this.additionalAnalyses,
    this.allowedJoinOperators,
  });

  factory AnalysisRuleList.fromJson(Map<String, dynamic> json) {
    return AnalysisRuleList(
      joinColumns: ((json['joinColumns'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      listColumns: ((json['listColumns'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      additionalAnalyses: (json['additionalAnalyses'] as String?)
          ?.let(AdditionalAnalyses.fromString),
      allowedJoinOperators: (json['allowedJoinOperators'] as List?)
          ?.nonNulls
          .map((e) => JoinOperator.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final joinColumns = this.joinColumns;
    final listColumns = this.listColumns;
    final additionalAnalyses = this.additionalAnalyses;
    final allowedJoinOperators = this.allowedJoinOperators;
    return {
      'joinColumns': joinColumns,
      'listColumns': listColumns,
      if (additionalAnalyses != null)
        'additionalAnalyses': additionalAnalyses.value,
      if (allowedJoinOperators != null)
        'allowedJoinOperators':
            allowedJoinOperators.map((e) => e.value).toList(),
    };
  }
}

/// A type of analysis rule that enables query structure and specified queries
/// that produce aggregate statistics.
///
/// @nodoc
class AnalysisRuleAggregation {
  /// The columns that query runners are allowed to use in aggregation queries.
  final List<AggregateColumn> aggregateColumns;

  /// The columns that query runners are allowed to select, group by, or filter
  /// by.
  final List<String> dimensionColumns;

  /// Columns in configured table that can be used in join statements and/or as
  /// aggregate columns. They can never be outputted directly.
  final List<String> joinColumns;

  /// Columns that must meet a specific threshold value (after an aggregation
  /// function is applied to it) for each output row to be returned.
  final List<AggregationConstraint> outputConstraints;

  /// Set of scalar functions that are allowed to be used on dimension columns and
  /// the output of aggregation of metrics.
  final List<ScalarFunctions> scalarFunctions;

  /// An indicator as to whether additional analyses (such as Clean Rooms ML) can
  /// be applied to the output of the direct query.
  ///
  /// The <code>additionalAnalyses</code> parameter is currently supported for the
  /// list analysis rule (<code>AnalysisRuleList</code>) and the custom analysis
  /// rule (<code>AnalysisRuleCustom</code>).
  final AdditionalAnalyses? additionalAnalyses;

  /// Which logical operators (if any) are to be used in an INNER JOIN match
  /// condition. Default is <code>AND</code>.
  final List<JoinOperator>? allowedJoinOperators;

  /// Control that requires member who runs query to do a join with their
  /// configured table and/or other configured table in query.
  final JoinRequiredOption? joinRequired;

  AnalysisRuleAggregation({
    required this.aggregateColumns,
    required this.dimensionColumns,
    required this.joinColumns,
    required this.outputConstraints,
    required this.scalarFunctions,
    this.additionalAnalyses,
    this.allowedJoinOperators,
    this.joinRequired,
  });

  factory AnalysisRuleAggregation.fromJson(Map<String, dynamic> json) {
    return AnalysisRuleAggregation(
      aggregateColumns: ((json['aggregateColumns'] as List?) ?? const [])
          .nonNulls
          .map((e) => AggregateColumn.fromJson(e as Map<String, dynamic>))
          .toList(),
      dimensionColumns: ((json['dimensionColumns'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      joinColumns: ((json['joinColumns'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      outputConstraints: ((json['outputConstraints'] as List?) ?? const [])
          .nonNulls
          .map((e) => AggregationConstraint.fromJson(e as Map<String, dynamic>))
          .toList(),
      scalarFunctions: ((json['scalarFunctions'] as List?) ?? const [])
          .nonNulls
          .map((e) => ScalarFunctions.fromString((e as String)))
          .toList(),
      additionalAnalyses: (json['additionalAnalyses'] as String?)
          ?.let(AdditionalAnalyses.fromString),
      allowedJoinOperators: (json['allowedJoinOperators'] as List?)
          ?.nonNulls
          .map((e) => JoinOperator.fromString((e as String)))
          .toList(),
      joinRequired:
          (json['joinRequired'] as String?)?.let(JoinRequiredOption.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final aggregateColumns = this.aggregateColumns;
    final dimensionColumns = this.dimensionColumns;
    final joinColumns = this.joinColumns;
    final outputConstraints = this.outputConstraints;
    final scalarFunctions = this.scalarFunctions;
    final additionalAnalyses = this.additionalAnalyses;
    final allowedJoinOperators = this.allowedJoinOperators;
    final joinRequired = this.joinRequired;
    return {
      'aggregateColumns': aggregateColumns,
      'dimensionColumns': dimensionColumns,
      'joinColumns': joinColumns,
      'outputConstraints': outputConstraints,
      'scalarFunctions': scalarFunctions.map((e) => e.value).toList(),
      if (additionalAnalyses != null)
        'additionalAnalyses': additionalAnalyses.value,
      if (allowedJoinOperators != null)
        'allowedJoinOperators':
            allowedJoinOperators.map((e) => e.value).toList(),
      if (joinRequired != null) 'joinRequired': joinRequired.value,
    };
  }
}

/// A type of analysis rule that enables the table owner to approve custom SQL
/// queries on their configured tables. It supports differential privacy.
///
/// @nodoc
class AnalysisRuleCustom {
  /// The ARN of the analysis templates that are allowed by the custom analysis
  /// rule.
  final List<String> allowedAnalyses;

  /// An indicator as to whether additional analyses (such as Clean Rooms ML) can
  /// be applied to the output of the direct query.
  final AdditionalAnalyses? additionalAnalyses;

  /// The IDs of the Amazon Web Services accounts that are allowed to query by the
  /// custom analysis rule. Required when <code>allowedAnalyses</code> is
  /// <code>ANY_QUERY</code>.
  final List<String>? allowedAnalysisProviders;

  /// The differential privacy configuration.
  final DifferentialPrivacyConfiguration? differentialPrivacy;

  /// A list of columns that aren't allowed to be shown in the query output.
  final List<String>? disallowedOutputColumns;

  AnalysisRuleCustom({
    required this.allowedAnalyses,
    this.additionalAnalyses,
    this.allowedAnalysisProviders,
    this.differentialPrivacy,
    this.disallowedOutputColumns,
  });

  factory AnalysisRuleCustom.fromJson(Map<String, dynamic> json) {
    return AnalysisRuleCustom(
      allowedAnalyses: ((json['allowedAnalyses'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      additionalAnalyses: (json['additionalAnalyses'] as String?)
          ?.let(AdditionalAnalyses.fromString),
      allowedAnalysisProviders: (json['allowedAnalysisProviders'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      differentialPrivacy: json['differentialPrivacy'] != null
          ? DifferentialPrivacyConfiguration.fromJson(
              json['differentialPrivacy'] as Map<String, dynamic>)
          : null,
      disallowedOutputColumns: (json['disallowedOutputColumns'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final allowedAnalyses = this.allowedAnalyses;
    final additionalAnalyses = this.additionalAnalyses;
    final allowedAnalysisProviders = this.allowedAnalysisProviders;
    final differentialPrivacy = this.differentialPrivacy;
    final disallowedOutputColumns = this.disallowedOutputColumns;
    return {
      'allowedAnalyses': allowedAnalyses,
      if (additionalAnalyses != null)
        'additionalAnalyses': additionalAnalyses.value,
      if (allowedAnalysisProviders != null)
        'allowedAnalysisProviders': allowedAnalysisProviders,
      if (differentialPrivacy != null)
        'differentialPrivacy': differentialPrivacy,
      if (disallowedOutputColumns != null)
        'disallowedOutputColumns': disallowedOutputColumns,
    };
  }
}

/// @nodoc
class AdditionalAnalyses {
  static const allowed = AdditionalAnalyses._('ALLOWED');
  static const required = AdditionalAnalyses._('REQUIRED');
  static const notAllowed = AdditionalAnalyses._('NOT_ALLOWED');

  final String value;

  const AdditionalAnalyses._(this.value);

  static const values = [allowed, required, notAllowed];

  static AdditionalAnalyses fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AdditionalAnalyses._(value));

  @override
  bool operator ==(other) =>
      other is AdditionalAnalyses && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specifies the unique identifier for your users.
///
/// @nodoc
class DifferentialPrivacyConfiguration {
  /// The name of the column (such as user_id) that contains the unique identifier
  /// of your users whose privacy you want to protect. If you want to turn on
  /// diﬀerential privacy for two or more tables in a collaboration, you must
  /// conﬁgure the same column as the user identiﬁer column in both analysis
  /// rules.
  final List<DifferentialPrivacyColumn> columns;

  DifferentialPrivacyConfiguration({
    required this.columns,
  });

  factory DifferentialPrivacyConfiguration.fromJson(Map<String, dynamic> json) {
    return DifferentialPrivacyConfiguration(
      columns: ((json['columns'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              DifferentialPrivacyColumn.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final columns = this.columns;
    return {
      'columns': columns,
    };
  }
}

/// Specifies the name of the column that contains the unique identifier of your
/// users, whose privacy you want to protect.
///
/// @nodoc
class DifferentialPrivacyColumn {
  /// The name of the column, such as user_id, that contains the unique identifier
  /// of your users, whose privacy you want to protect. If you want to turn on
  /// differential privacy for two or more tables in a collaboration, you must
  /// configure the same column as the user identifier column in both analysis
  /// rules.
  final String name;

  DifferentialPrivacyColumn({
    required this.name,
  });

  factory DifferentialPrivacyColumn.fromJson(Map<String, dynamic> json) {
    return DifferentialPrivacyColumn(
      name: (json['name'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'name': name,
    };
  }
}

/// @nodoc
class JoinRequiredOption {
  static const queryRunner = JoinRequiredOption._('QUERY_RUNNER');

  final String value;

  const JoinRequiredOption._(this.value);

  static const values = [queryRunner];

  static JoinRequiredOption fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => JoinRequiredOption._(value));

  @override
  bool operator ==(other) =>
      other is JoinRequiredOption && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Constraint on query output removing output rows that do not meet a minimum
/// number of distinct values of a specified column.
///
/// @nodoc
class AggregationConstraint {
  /// Column in aggregation constraint for which there must be a minimum number of
  /// distinct values in an output row for it to be in the query output.
  final String columnName;

  /// The minimum number of distinct values that an output row must be an
  /// aggregation of. Minimum threshold of distinct values for a specified column
  /// that must exist in an output row for it to be in the query output.
  final int minimum;

  /// The type of aggregation the constraint allows. The only valid value is
  /// currently `COUNT_DISTINCT`.
  final AggregationType type;

  AggregationConstraint({
    required this.columnName,
    required this.minimum,
    required this.type,
  });

  factory AggregationConstraint.fromJson(Map<String, dynamic> json) {
    return AggregationConstraint(
      columnName: (json['columnName'] as String?) ?? '',
      minimum: (json['minimum'] as int?) ?? 0,
      type: AggregationType.fromString((json['type'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final columnName = this.columnName;
    final minimum = this.minimum;
    final type = this.type;
    return {
      'columnName': columnName,
      'minimum': minimum,
      'type': type.value,
    };
  }
}

/// @nodoc
class AggregationType {
  static const countDistinct = AggregationType._('COUNT_DISTINCT');

  final String value;

  const AggregationType._(this.value);

  static const values = [countDistinct];

  static AggregationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AggregationType._(value));

  @override
  bool operator ==(other) => other is AggregationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ScalarFunctions {
  static const abs = ScalarFunctions._('ABS');
  static const cast = ScalarFunctions._('CAST');
  static const ceiling = ScalarFunctions._('CEILING');
  static const coalesce = ScalarFunctions._('COALESCE');
  static const convert = ScalarFunctions._('CONVERT');
  static const currentDate = ScalarFunctions._('CURRENT_DATE');
  static const dateadd = ScalarFunctions._('DATEADD');
  static const extract = ScalarFunctions._('EXTRACT');
  static const floor = ScalarFunctions._('FLOOR');
  static const getdate = ScalarFunctions._('GETDATE');
  static const ln = ScalarFunctions._('LN');
  static const log = ScalarFunctions._('LOG');
  static const lower = ScalarFunctions._('LOWER');
  static const round = ScalarFunctions._('ROUND');
  static const rtrim = ScalarFunctions._('RTRIM');
  static const sqrt = ScalarFunctions._('SQRT');
  static const substring = ScalarFunctions._('SUBSTRING');
  static const toChar = ScalarFunctions._('TO_CHAR');
  static const toDate = ScalarFunctions._('TO_DATE');
  static const toNumber = ScalarFunctions._('TO_NUMBER');
  static const toTimestamp = ScalarFunctions._('TO_TIMESTAMP');
  static const trim = ScalarFunctions._('TRIM');
  static const trunc = ScalarFunctions._('TRUNC');
  static const upper = ScalarFunctions._('UPPER');

  final String value;

  const ScalarFunctions._(this.value);

  static const values = [
    abs,
    cast,
    ceiling,
    coalesce,
    convert,
    currentDate,
    dateadd,
    extract,
    floor,
    getdate,
    ln,
    log,
    lower,
    round,
    rtrim,
    sqrt,
    substring,
    toChar,
    toDate,
    toNumber,
    toTimestamp,
    trim,
    trunc,
    upper
  ];

  static ScalarFunctions fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ScalarFunctions._(value));

  @override
  bool operator ==(other) => other is ScalarFunctions && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class JoinOperator {
  static const or = JoinOperator._('OR');
  static const and = JoinOperator._('AND');

  final String value;

  const JoinOperator._(this.value);

  static const values = [or, and];

  static JoinOperator fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => JoinOperator._(value));

  @override
  bool operator ==(other) => other is JoinOperator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Column in configured table that can be used in aggregate function in query.
///
/// @nodoc
class AggregateColumn {
  /// Column names in configured table of aggregate columns.
  final List<String> columnNames;

  /// Aggregation function that can be applied to aggregate column in query.
  final AggregateFunctionName function;

  AggregateColumn({
    required this.columnNames,
    required this.function,
  });

  factory AggregateColumn.fromJson(Map<String, dynamic> json) {
    return AggregateColumn(
      columnNames: ((json['columnNames'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      function:
          AggregateFunctionName.fromString((json['function'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final columnNames = this.columnNames;
    final function = this.function;
    return {
      'columnNames': columnNames,
      'function': function.value,
    };
  }
}

/// @nodoc
class AggregateFunctionName {
  static const sum = AggregateFunctionName._('SUM');
  static const sumDistinct = AggregateFunctionName._('SUM_DISTINCT');
  static const count = AggregateFunctionName._('COUNT');
  static const countDistinct = AggregateFunctionName._('COUNT_DISTINCT');
  static const avg = AggregateFunctionName._('AVG');

  final String value;

  const AggregateFunctionName._(this.value);

  static const values = [sum, sumDistinct, count, countDistinct, avg];

  static AggregateFunctionName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AggregateFunctionName._(value));

  @override
  bool operator ==(other) =>
      other is AggregateFunctionName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The configured table summary for the objects listed by the request.
///
/// @nodoc
class ConfiguredTableSummary {
  /// The analysis method for the configured tables.
  ///
  /// <code>DIRECT_QUERY</code> allows SQL queries to be run directly on this
  /// table.
  ///
  /// <code>DIRECT_JOB</code> allows PySpark jobs to be run directly on this
  /// table.
  ///
  /// <code>MULTIPLE</code> allows both SQL queries and PySpark jobs to be run
  /// directly on this table.
  final AnalysisMethod analysisMethod;

  /// The types of analysis rules associated with this configured table.
  final List<ConfiguredTableAnalysisRuleType> analysisRuleTypes;

  /// The unique ARN of the configured table.
  final String arn;

  /// The time the configured table was created.
  final DateTime createTime;

  /// The unique ID of the configured table.
  final String id;

  /// The name of the configured table.
  final String name;

  /// The time the configured table was last updated.
  final DateTime updateTime;

  /// The selected analysis methods for the configured table summary.
  final List<SelectedAnalysisMethod>? selectedAnalysisMethods;

  ConfiguredTableSummary({
    required this.analysisMethod,
    required this.analysisRuleTypes,
    required this.arn,
    required this.createTime,
    required this.id,
    required this.name,
    required this.updateTime,
    this.selectedAnalysisMethods,
  });

  factory ConfiguredTableSummary.fromJson(Map<String, dynamic> json) {
    return ConfiguredTableSummary(
      analysisMethod:
          AnalysisMethod.fromString((json['analysisMethod'] as String?) ?? ''),
      analysisRuleTypes: ((json['analysisRuleTypes'] as List?) ?? const [])
          .nonNulls
          .map((e) => ConfiguredTableAnalysisRuleType.fromString((e as String)))
          .toList(),
      arn: (json['arn'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      selectedAnalysisMethods: (json['selectedAnalysisMethods'] as List?)
          ?.nonNulls
          .map((e) => SelectedAnalysisMethod.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final analysisMethod = this.analysisMethod;
    final analysisRuleTypes = this.analysisRuleTypes;
    final arn = this.arn;
    final createTime = this.createTime;
    final id = this.id;
    final name = this.name;
    final updateTime = this.updateTime;
    final selectedAnalysisMethods = this.selectedAnalysisMethods;
    return {
      'analysisMethod': analysisMethod.value,
      'analysisRuleTypes': analysisRuleTypes.map((e) => e.value).toList(),
      'arn': arn,
      'createTime': unixTimestampToJson(createTime),
      'id': id,
      'name': name,
      'updateTime': unixTimestampToJson(updateTime),
      if (selectedAnalysisMethods != null)
        'selectedAnalysisMethods':
            selectedAnalysisMethods.map((e) => e.value).toList(),
    };
  }
}

/// @nodoc
class AnalysisMethod {
  static const directQuery = AnalysisMethod._('DIRECT_QUERY');
  static const directJob = AnalysisMethod._('DIRECT_JOB');
  static const multiple = AnalysisMethod._('MULTIPLE');

  final String value;

  const AnalysisMethod._(this.value);

  static const values = [directQuery, directJob, multiple];

  static AnalysisMethod fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AnalysisMethod._(value));

  @override
  bool operator ==(other) => other is AnalysisMethod && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SelectedAnalysisMethod {
  static const directQuery = SelectedAnalysisMethod._('DIRECT_QUERY');
  static const directJob = SelectedAnalysisMethod._('DIRECT_JOB');

  final String value;

  const SelectedAnalysisMethod._(this.value);

  static const values = [directQuery, directJob];

  static SelectedAnalysisMethod fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SelectedAnalysisMethod._(value));

  @override
  bool operator ==(other) =>
      other is SelectedAnalysisMethod && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A table that has been configured for use in a collaboration.
///
/// @nodoc
class ConfiguredTable {
  /// The columns within the underlying Glue table that can be used within
  /// collaborations.
  final List<String> allowedColumns;

  /// The analysis method for the configured table.
  ///
  /// <code>DIRECT_QUERY</code> allows SQL queries to be run directly on this
  /// table.
  ///
  /// <code>DIRECT_JOB</code> allows PySpark jobs to be run directly on this
  /// table.
  ///
  /// <code>MULTIPLE</code> allows both SQL queries and PySpark jobs to be run
  /// directly on this table.
  final AnalysisMethod analysisMethod;

  /// The types of analysis rules associated with this configured table.
  /// Currently, only one analysis rule may be associated with a configured table.
  final List<ConfiguredTableAnalysisRuleType> analysisRuleTypes;

  /// The unique ARN for the configured table.
  final String arn;

  /// The time the configured table was created.
  final DateTime createTime;

  /// The unique ID for the configured table.
  final String id;

  /// A name for the configured table.
  final String name;

  /// The table that this configured table represents.
  final TableReference tableReference;

  /// The time the configured table was last updated
  final DateTime updateTime;

  /// A description for the configured table.
  final String? description;

  /// The selected analysis methods for the configured table.
  final List<SelectedAnalysisMethod>? selectedAnalysisMethods;

  ConfiguredTable({
    required this.allowedColumns,
    required this.analysisMethod,
    required this.analysisRuleTypes,
    required this.arn,
    required this.createTime,
    required this.id,
    required this.name,
    required this.tableReference,
    required this.updateTime,
    this.description,
    this.selectedAnalysisMethods,
  });

  factory ConfiguredTable.fromJson(Map<String, dynamic> json) {
    return ConfiguredTable(
      allowedColumns: ((json['allowedColumns'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      analysisMethod:
          AnalysisMethod.fromString((json['analysisMethod'] as String?) ?? ''),
      analysisRuleTypes: ((json['analysisRuleTypes'] as List?) ?? const [])
          .nonNulls
          .map((e) => ConfiguredTableAnalysisRuleType.fromString((e as String)))
          .toList(),
      arn: (json['arn'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      tableReference: TableReference.fromJson(
          (json['tableReference'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      description: json['description'] as String?,
      selectedAnalysisMethods: (json['selectedAnalysisMethods'] as List?)
          ?.nonNulls
          .map((e) => SelectedAnalysisMethod.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final allowedColumns = this.allowedColumns;
    final analysisMethod = this.analysisMethod;
    final analysisRuleTypes = this.analysisRuleTypes;
    final arn = this.arn;
    final createTime = this.createTime;
    final id = this.id;
    final name = this.name;
    final tableReference = this.tableReference;
    final updateTime = this.updateTime;
    final description = this.description;
    final selectedAnalysisMethods = this.selectedAnalysisMethods;
    return {
      'allowedColumns': allowedColumns,
      'analysisMethod': analysisMethod.value,
      'analysisRuleTypes': analysisRuleTypes.map((e) => e.value).toList(),
      'arn': arn,
      'createTime': unixTimestampToJson(createTime),
      'id': id,
      'name': name,
      'tableReference': tableReference,
      'updateTime': unixTimestampToJson(updateTime),
      if (description != null) 'description': description,
      if (selectedAnalysisMethods != null)
        'selectedAnalysisMethods':
            selectedAnalysisMethods.map((e) => e.value).toList(),
    };
  }
}

/// A pointer to the dataset that underlies this table.
///
/// @nodoc
class TableReference {
  /// If present, a reference to the Athena table referred to by this table
  /// reference.
  final AthenaTableReference? athena;

  /// If present, a reference to the Glue table referred to by this table
  /// reference.
  final GlueTableReference? glue;

  /// If present, a reference to the Snowflake table referred to by this table
  /// reference.
  final SnowflakeTableReference? snowflake;

  TableReference({
    this.athena,
    this.glue,
    this.snowflake,
  });

  factory TableReference.fromJson(Map<String, dynamic> json) {
    return TableReference(
      athena: json['athena'] != null
          ? AthenaTableReference.fromJson(
              json['athena'] as Map<String, dynamic>)
          : null,
      glue: json['glue'] != null
          ? GlueTableReference.fromJson(json['glue'] as Map<String, dynamic>)
          : null,
      snowflake: json['snowflake'] != null
          ? SnowflakeTableReference.fromJson(
              json['snowflake'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final athena = this.athena;
    final glue = this.glue;
    final snowflake = this.snowflake;
    return {
      if (athena != null) 'athena': athena,
      if (glue != null) 'glue': glue,
      if (snowflake != null) 'snowflake': snowflake,
    };
  }
}

/// A reference to a table within an Glue data catalog.
///
/// @nodoc
class GlueTableReference {
  /// The name of the database the Glue table belongs to.
  final String databaseName;

  /// The name of the Glue table.
  final String tableName;

  /// The Amazon Web Services Region where the Glue table is located. This
  /// parameter is required to uniquely identify and access tables across
  /// different Regions.
  final CommercialRegion? region;

  GlueTableReference({
    required this.databaseName,
    required this.tableName,
    this.region,
  });

  factory GlueTableReference.fromJson(Map<String, dynamic> json) {
    return GlueTableReference(
      databaseName: (json['databaseName'] as String?) ?? '',
      tableName: (json['tableName'] as String?) ?? '',
      region: (json['region'] as String?)?.let(CommercialRegion.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final databaseName = this.databaseName;
    final tableName = this.tableName;
    final region = this.region;
    return {
      'databaseName': databaseName,
      'tableName': tableName,
      if (region != null) 'region': region.value,
    };
  }
}

/// A reference to a table within Snowflake.
///
/// @nodoc
class SnowflakeTableReference {
  /// The account identifier for the Snowflake table reference.
  final String accountIdentifier;

  /// The name of the database the Snowflake table belongs to.
  final String databaseName;

  /// The schema name of the Snowflake table reference.
  final String schemaName;

  /// The secret ARN of the Snowflake table reference.
  final String secretArn;

  /// The name of the Snowflake table.
  final String tableName;

  /// The schema of the Snowflake table.
  final SnowflakeTableSchema tableSchema;

  SnowflakeTableReference({
    required this.accountIdentifier,
    required this.databaseName,
    required this.schemaName,
    required this.secretArn,
    required this.tableName,
    required this.tableSchema,
  });

  factory SnowflakeTableReference.fromJson(Map<String, dynamic> json) {
    return SnowflakeTableReference(
      accountIdentifier: (json['accountIdentifier'] as String?) ?? '',
      databaseName: (json['databaseName'] as String?) ?? '',
      schemaName: (json['schemaName'] as String?) ?? '',
      secretArn: (json['secretArn'] as String?) ?? '',
      tableName: (json['tableName'] as String?) ?? '',
      tableSchema: SnowflakeTableSchema.fromJson(
          (json['tableSchema'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final accountIdentifier = this.accountIdentifier;
    final databaseName = this.databaseName;
    final schemaName = this.schemaName;
    final secretArn = this.secretArn;
    final tableName = this.tableName;
    final tableSchema = this.tableSchema;
    return {
      'accountIdentifier': accountIdentifier,
      'databaseName': databaseName,
      'schemaName': schemaName,
      'secretArn': secretArn,
      'tableName': tableName,
      'tableSchema': tableSchema,
    };
  }
}

/// A reference to a table within Athena.
///
/// @nodoc
class AthenaTableReference {
  /// The database name.
  final String databaseName;

  /// The table reference.
  final String tableName;

  /// The workgroup of the Athena table reference.
  final String workGroup;

  /// The catalog name.
  final String? catalogName;

  /// The output location for the Athena table.
  final String? outputLocation;

  /// The Amazon Web Services Region where the Athena table is located. This
  /// parameter is required to uniquely identify and access tables across
  /// different Regions.
  final CommercialRegion? region;

  AthenaTableReference({
    required this.databaseName,
    required this.tableName,
    required this.workGroup,
    this.catalogName,
    this.outputLocation,
    this.region,
  });

  factory AthenaTableReference.fromJson(Map<String, dynamic> json) {
    return AthenaTableReference(
      databaseName: (json['databaseName'] as String?) ?? '',
      tableName: (json['tableName'] as String?) ?? '',
      workGroup: (json['workGroup'] as String?) ?? '',
      catalogName: json['catalogName'] as String?,
      outputLocation: json['outputLocation'] as String?,
      region: (json['region'] as String?)?.let(CommercialRegion.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final databaseName = this.databaseName;
    final tableName = this.tableName;
    final workGroup = this.workGroup;
    final catalogName = this.catalogName;
    final outputLocation = this.outputLocation;
    final region = this.region;
    return {
      'databaseName': databaseName,
      'tableName': tableName,
      'workGroup': workGroup,
      if (catalogName != null) 'catalogName': catalogName,
      if (outputLocation != null) 'outputLocation': outputLocation,
      if (region != null) 'region': region.value,
    };
  }
}

/// @nodoc
class CommercialRegion {
  static const usWest_1 = CommercialRegion._('us-west-1');
  static const usWest_2 = CommercialRegion._('us-west-2');
  static const usEast_1 = CommercialRegion._('us-east-1');
  static const usEast_2 = CommercialRegion._('us-east-2');
  static const afSouth_1 = CommercialRegion._('af-south-1');
  static const apEast_1 = CommercialRegion._('ap-east-1');
  static const apSouth_2 = CommercialRegion._('ap-south-2');
  static const apSoutheast_1 = CommercialRegion._('ap-southeast-1');
  static const apSoutheast_2 = CommercialRegion._('ap-southeast-2');
  static const apSoutheast_3 = CommercialRegion._('ap-southeast-3');
  static const apSoutheast_5 = CommercialRegion._('ap-southeast-5');
  static const apSoutheast_4 = CommercialRegion._('ap-southeast-4');
  static const apSoutheast_7 = CommercialRegion._('ap-southeast-7');
  static const apSouth_1 = CommercialRegion._('ap-south-1');
  static const apNortheast_3 = CommercialRegion._('ap-northeast-3');
  static const apNortheast_1 = CommercialRegion._('ap-northeast-1');
  static const apNortheast_2 = CommercialRegion._('ap-northeast-2');
  static const caCentral_1 = CommercialRegion._('ca-central-1');
  static const caWest_1 = CommercialRegion._('ca-west-1');
  static const euSouth_1 = CommercialRegion._('eu-south-1');
  static const euWest_3 = CommercialRegion._('eu-west-3');
  static const euSouth_2 = CommercialRegion._('eu-south-2');
  static const euCentral_2 = CommercialRegion._('eu-central-2');
  static const euCentral_1 = CommercialRegion._('eu-central-1');
  static const euNorth_1 = CommercialRegion._('eu-north-1');
  static const euWest_1 = CommercialRegion._('eu-west-1');
  static const euWest_2 = CommercialRegion._('eu-west-2');
  static const meSouth_1 = CommercialRegion._('me-south-1');
  static const meCentral_1 = CommercialRegion._('me-central-1');
  static const ilCentral_1 = CommercialRegion._('il-central-1');
  static const saEast_1 = CommercialRegion._('sa-east-1');
  static const mxCentral_1 = CommercialRegion._('mx-central-1');
  static const apEast_2 = CommercialRegion._('ap-east-2');

  final String value;

  const CommercialRegion._(this.value);

  static const values = [
    usWest_1,
    usWest_2,
    usEast_1,
    usEast_2,
    afSouth_1,
    apEast_1,
    apSouth_2,
    apSoutheast_1,
    apSoutheast_2,
    apSoutheast_3,
    apSoutheast_5,
    apSoutheast_4,
    apSoutheast_7,
    apSouth_1,
    apNortheast_3,
    apNortheast_1,
    apNortheast_2,
    caCentral_1,
    caWest_1,
    euSouth_1,
    euWest_3,
    euSouth_2,
    euCentral_2,
    euCentral_1,
    euNorth_1,
    euWest_1,
    euWest_2,
    meSouth_1,
    meCentral_1,
    ilCentral_1,
    saEast_1,
    mxCentral_1,
    apEast_2
  ];

  static CommercialRegion fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CommercialRegion._(value));

  @override
  bool operator ==(other) => other is CommercialRegion && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The schema of a Snowflake table.
///
/// @nodoc
class SnowflakeTableSchema {
  /// The schema of a Snowflake table.
  final List<SnowflakeTableSchemaV1>? v1;

  SnowflakeTableSchema({
    this.v1,
  });

  factory SnowflakeTableSchema.fromJson(Map<String, dynamic> json) {
    return SnowflakeTableSchema(
      v1: (json['v1'] as List?)
          ?.nonNulls
          .map(
              (e) => SnowflakeTableSchemaV1.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final v1 = this.v1;
    return {
      if (v1 != null) 'v1': v1,
    };
  }
}

/// The Snowflake table schema.
///
/// @nodoc
class SnowflakeTableSchemaV1 {
  /// The column name.
  final String columnName;

  /// The column's data type. Supported data types: <code>ARRAY</code>,
  /// <code>BIGINT</code>, <code>BOOLEAN</code>, <code>CHAR</code>,
  /// <code>DATE</code>, <code>DECIMAL</code>, <code>DOUBLE</code>, <code>DOUBLE
  /// PRECISION</code>, <code>FLOAT</code>, <code>FLOAT4</code>, <code>INT</code>,
  /// <code>INTEGER</code>, <code>MAP</code>, <code>NUMERIC</code>,
  /// <code>NUMBER</code>, <code>REAL</code>, <code>SMALLINT</code>,
  /// <code>STRING</code>, <code>TIMESTAMP</code>, <code>TIMESTAMP_LTZ</code>,
  /// <code>TIMESTAMP_NTZ</code>, <code>DATETIME</code>, <code>TINYINT</code>,
  /// <code>VARCHAR</code>, <code>TEXT</code>, <code>CHARACTER</code>.
  final String columnType;

  SnowflakeTableSchemaV1({
    required this.columnName,
    required this.columnType,
  });

  factory SnowflakeTableSchemaV1.fromJson(Map<String, dynamic> json) {
    return SnowflakeTableSchemaV1(
      columnName: (json['columnName'] as String?) ?? '',
      columnType: (json['columnType'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final columnName = this.columnName;
    final columnType = this.columnType;
    return {
      'columnName': columnName,
      'columnType': columnType,
    };
  }
}

/// An analysis rule for a configured table association. This analysis rule
/// specifies how data from the table can be used within its associated
/// collaboration. In the console, the
/// <code>ConfiguredTableAssociationAnalysisRule</code> is referred to as the
/// <i>collaboration analysis rule</i>.
///
/// @nodoc
class ConfiguredTableAssociationAnalysisRule {
  /// The Amazon Resource Name (ARN) of the configured table association.
  final String configuredTableAssociationArn;

  /// The unique identifier for the configured table association.
  final String configuredTableAssociationId;

  /// The creation time of the configured table association analysis rule.
  final DateTime createTime;

  /// The membership identifier for the configured table association analysis
  /// rule.
  final String membershipIdentifier;

  /// The policy of the configured table association analysis rule.
  final ConfiguredTableAssociationAnalysisRulePolicy policy;

  /// The type of the configured table association analysis rule.
  final ConfiguredTableAssociationAnalysisRuleType type;

  /// The update time of the configured table association analysis rule.
  final DateTime updateTime;

  ConfiguredTableAssociationAnalysisRule({
    required this.configuredTableAssociationArn,
    required this.configuredTableAssociationId,
    required this.createTime,
    required this.membershipIdentifier,
    required this.policy,
    required this.type,
    required this.updateTime,
  });

  factory ConfiguredTableAssociationAnalysisRule.fromJson(
      Map<String, dynamic> json) {
    return ConfiguredTableAssociationAnalysisRule(
      configuredTableAssociationArn:
          (json['configuredTableAssociationArn'] as String?) ?? '',
      configuredTableAssociationId:
          (json['configuredTableAssociationId'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      membershipIdentifier: (json['membershipIdentifier'] as String?) ?? '',
      policy: ConfiguredTableAssociationAnalysisRulePolicy.fromJson(
          (json['policy'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      type: ConfiguredTableAssociationAnalysisRuleType.fromString(
          (json['type'] as String?) ?? ''),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final configuredTableAssociationArn = this.configuredTableAssociationArn;
    final configuredTableAssociationId = this.configuredTableAssociationId;
    final createTime = this.createTime;
    final membershipIdentifier = this.membershipIdentifier;
    final policy = this.policy;
    final type = this.type;
    final updateTime = this.updateTime;
    return {
      'configuredTableAssociationArn': configuredTableAssociationArn,
      'configuredTableAssociationId': configuredTableAssociationId,
      'createTime': unixTimestampToJson(createTime),
      'membershipIdentifier': membershipIdentifier,
      'policy': policy,
      'type': type.value,
      'updateTime': unixTimestampToJson(updateTime),
    };
  }
}

/// Controls on the query specifications that can be run on an associated
/// configured table.
///
/// @nodoc
class ConfiguredTableAssociationAnalysisRulePolicy {
  /// The policy for the configured table association analysis rule.
  final ConfiguredTableAssociationAnalysisRulePolicyV1? v1;

  ConfiguredTableAssociationAnalysisRulePolicy({
    this.v1,
  });

  factory ConfiguredTableAssociationAnalysisRulePolicy.fromJson(
      Map<String, dynamic> json) {
    return ConfiguredTableAssociationAnalysisRulePolicy(
      v1: json['v1'] != null
          ? ConfiguredTableAssociationAnalysisRulePolicyV1.fromJson(
              json['v1'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final v1 = this.v1;
    return {
      if (v1 != null) 'v1': v1,
    };
  }
}

/// @nodoc
class ConfiguredTableAssociationAnalysisRuleType {
  static const aggregation =
      ConfiguredTableAssociationAnalysisRuleType._('AGGREGATION');
  static const list = ConfiguredTableAssociationAnalysisRuleType._('LIST');
  static const custom = ConfiguredTableAssociationAnalysisRuleType._('CUSTOM');

  final String value;

  const ConfiguredTableAssociationAnalysisRuleType._(this.value);

  static const values = [aggregation, list, custom];

  static ConfiguredTableAssociationAnalysisRuleType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ConfiguredTableAssociationAnalysisRuleType._(value));

  @override
  bool operator ==(other) =>
      other is ConfiguredTableAssociationAnalysisRuleType &&
      other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Controls on the query specifications that can be run on an associated
/// configured table.
///
/// @nodoc
class ConfiguredTableAssociationAnalysisRulePolicyV1 {
  /// Analysis rule type that enables only aggregation queries on a configured
  /// table.
  final ConfiguredTableAssociationAnalysisRuleAggregation? aggregation;

  /// Analysis rule type that enables the table owner to approve custom SQL
  /// queries on their configured tables. It supports differential privacy.
  final ConfiguredTableAssociationAnalysisRuleCustom? custom;

  /// Analysis rule type that enables only list queries on a configured table.
  final ConfiguredTableAssociationAnalysisRuleList? list;

  ConfiguredTableAssociationAnalysisRulePolicyV1({
    this.aggregation,
    this.custom,
    this.list,
  });

  factory ConfiguredTableAssociationAnalysisRulePolicyV1.fromJson(
      Map<String, dynamic> json) {
    return ConfiguredTableAssociationAnalysisRulePolicyV1(
      aggregation: json['aggregation'] != null
          ? ConfiguredTableAssociationAnalysisRuleAggregation.fromJson(
              json['aggregation'] as Map<String, dynamic>)
          : null,
      custom: json['custom'] != null
          ? ConfiguredTableAssociationAnalysisRuleCustom.fromJson(
              json['custom'] as Map<String, dynamic>)
          : null,
      list: json['list'] != null
          ? ConfiguredTableAssociationAnalysisRuleList.fromJson(
              json['list'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final aggregation = this.aggregation;
    final custom = this.custom;
    final list = this.list;
    return {
      if (aggregation != null) 'aggregation': aggregation,
      if (custom != null) 'custom': custom,
      if (list != null) 'list': list,
    };
  }
}

/// The configured table association analysis rule applied to a configured table
/// with the list analysis rule.
///
/// @nodoc
class ConfiguredTableAssociationAnalysisRuleList {
  /// The list of resources or wildcards (ARNs) that are allowed to perform
  /// additional analysis on query output.
  final List<String>? allowedAdditionalAnalyses;

  /// The list of collaboration members who are allowed to receive results of
  /// queries run with this configured table.
  final List<String>? allowedResultReceivers;

  ConfiguredTableAssociationAnalysisRuleList({
    this.allowedAdditionalAnalyses,
    this.allowedResultReceivers,
  });

  factory ConfiguredTableAssociationAnalysisRuleList.fromJson(
      Map<String, dynamic> json) {
    return ConfiguredTableAssociationAnalysisRuleList(
      allowedAdditionalAnalyses: (json['allowedAdditionalAnalyses'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      allowedResultReceivers: (json['allowedResultReceivers'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final allowedAdditionalAnalyses = this.allowedAdditionalAnalyses;
    final allowedResultReceivers = this.allowedResultReceivers;
    return {
      if (allowedAdditionalAnalyses != null)
        'allowedAdditionalAnalyses': allowedAdditionalAnalyses,
      if (allowedResultReceivers != null)
        'allowedResultReceivers': allowedResultReceivers,
    };
  }
}

/// The configured table association analysis rule applied to a configured table
/// with the aggregation analysis rule.
///
/// @nodoc
class ConfiguredTableAssociationAnalysisRuleAggregation {
  /// The list of resources or wildcards (ARNs) that are allowed to perform
  /// additional analysis on query output.
  ///
  /// The <code>allowedAdditionalAnalyses</code> parameter is currently supported
  /// for the list analysis rule (<code>AnalysisRuleList</code>) and the custom
  /// analysis rule (<code>AnalysisRuleCustom</code>).
  final List<String>? allowedAdditionalAnalyses;

  /// The list of collaboration members who are allowed to receive results of
  /// queries run with this configured table.
  final List<String>? allowedResultReceivers;

  ConfiguredTableAssociationAnalysisRuleAggregation({
    this.allowedAdditionalAnalyses,
    this.allowedResultReceivers,
  });

  factory ConfiguredTableAssociationAnalysisRuleAggregation.fromJson(
      Map<String, dynamic> json) {
    return ConfiguredTableAssociationAnalysisRuleAggregation(
      allowedAdditionalAnalyses: (json['allowedAdditionalAnalyses'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      allowedResultReceivers: (json['allowedResultReceivers'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final allowedAdditionalAnalyses = this.allowedAdditionalAnalyses;
    final allowedResultReceivers = this.allowedResultReceivers;
    return {
      if (allowedAdditionalAnalyses != null)
        'allowedAdditionalAnalyses': allowedAdditionalAnalyses,
      if (allowedResultReceivers != null)
        'allowedResultReceivers': allowedResultReceivers,
    };
  }
}

/// The configured table association analysis rule applied to a configured table
/// with the custom analysis rule.
///
/// @nodoc
class ConfiguredTableAssociationAnalysisRuleCustom {
  /// The list of resources or wildcards (ARNs) that are allowed to perform
  /// additional analysis on query output.
  final List<String>? allowedAdditionalAnalyses;

  /// The list of collaboration members who are allowed to receive results of
  /// queries run with this configured table.
  final List<String>? allowedResultReceivers;

  ConfiguredTableAssociationAnalysisRuleCustom({
    this.allowedAdditionalAnalyses,
    this.allowedResultReceivers,
  });

  factory ConfiguredTableAssociationAnalysisRuleCustom.fromJson(
      Map<String, dynamic> json) {
    return ConfiguredTableAssociationAnalysisRuleCustom(
      allowedAdditionalAnalyses: (json['allowedAdditionalAnalyses'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      allowedResultReceivers: (json['allowedResultReceivers'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final allowedAdditionalAnalyses = this.allowedAdditionalAnalyses;
    final allowedResultReceivers = this.allowedResultReceivers;
    return {
      if (allowedAdditionalAnalyses != null)
        'allowedAdditionalAnalyses': allowedAdditionalAnalyses,
      if (allowedResultReceivers != null)
        'allowedResultReceivers': allowedResultReceivers,
    };
  }
}

/// The configured table association summary for the objects listed by the
/// request.
///
/// @nodoc
class ConfiguredTableAssociationSummary {
  /// The unique ARN for the configured table association.
  final String arn;

  /// The unique configured table ID that this configured table association refers
  /// to.
  final String configuredTableId;

  /// The time the configured table association was created.
  final DateTime createTime;

  /// The unique ID for the configured table association.
  final String id;

  /// The unique ARN for the membership that the configured table association
  /// belongs to.
  final String membershipArn;

  /// The unique ID for the membership that the configured table association
  /// belongs to.
  final String membershipId;

  /// The name of the configured table association. The table is identified by
  /// this name when running Protected Queries against the underlying data.
  final String name;

  /// The time the configured table association was last updated.
  final DateTime updateTime;

  /// The analysis rule types that are associated with the configured table
  /// associations in this summary.
  final List<ConfiguredTableAssociationAnalysisRuleType>? analysisRuleTypes;

  ConfiguredTableAssociationSummary({
    required this.arn,
    required this.configuredTableId,
    required this.createTime,
    required this.id,
    required this.membershipArn,
    required this.membershipId,
    required this.name,
    required this.updateTime,
    this.analysisRuleTypes,
  });

  factory ConfiguredTableAssociationSummary.fromJson(
      Map<String, dynamic> json) {
    return ConfiguredTableAssociationSummary(
      arn: (json['arn'] as String?) ?? '',
      configuredTableId: (json['configuredTableId'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      id: (json['id'] as String?) ?? '',
      membershipArn: (json['membershipArn'] as String?) ?? '',
      membershipId: (json['membershipId'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      analysisRuleTypes: (json['analysisRuleTypes'] as List?)
          ?.nonNulls
          .map((e) => ConfiguredTableAssociationAnalysisRuleType.fromString(
              (e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final configuredTableId = this.configuredTableId;
    final createTime = this.createTime;
    final id = this.id;
    final membershipArn = this.membershipArn;
    final membershipId = this.membershipId;
    final name = this.name;
    final updateTime = this.updateTime;
    final analysisRuleTypes = this.analysisRuleTypes;
    return {
      'arn': arn,
      'configuredTableId': configuredTableId,
      'createTime': unixTimestampToJson(createTime),
      'id': id,
      'membershipArn': membershipArn,
      'membershipId': membershipId,
      'name': name,
      'updateTime': unixTimestampToJson(updateTime),
      if (analysisRuleTypes != null)
        'analysisRuleTypes': analysisRuleTypes.map((e) => e.value).toList(),
    };
  }
}

/// A configured table association links a configured table to a collaboration.
///
/// @nodoc
class ConfiguredTableAssociation {
  /// The unique ARN for the configured table association.
  final String arn;

  /// The unique ARN for the configured table that the association refers to.
  final String configuredTableArn;

  /// The unique ID for the configured table that the association refers to.
  final String configuredTableId;

  /// The time the configured table association was created.
  final DateTime createTime;

  /// The unique ID for the configured table association.
  final String id;

  /// The unique ARN for the membership this configured table association belongs
  /// to.
  final String membershipArn;

  /// The unique ID for the membership this configured table association belongs
  /// to.
  final String membershipId;

  /// The name of the configured table association, in lowercase. The table is
  /// identified by this name when running protected queries against the
  /// underlying data.
  final String name;

  /// The service will assume this role to access catalog metadata and query the
  /// table.
  final String roleArn;

  /// The time the configured table association was last updated.
  final DateTime updateTime;

  /// The analysis rule types for the configured table association.
  final List<ConfiguredTableAssociationAnalysisRuleType>? analysisRuleTypes;

  /// A description of the configured table association.
  final String? description;

  ConfiguredTableAssociation({
    required this.arn,
    required this.configuredTableArn,
    required this.configuredTableId,
    required this.createTime,
    required this.id,
    required this.membershipArn,
    required this.membershipId,
    required this.name,
    required this.roleArn,
    required this.updateTime,
    this.analysisRuleTypes,
    this.description,
  });

  factory ConfiguredTableAssociation.fromJson(Map<String, dynamic> json) {
    return ConfiguredTableAssociation(
      arn: (json['arn'] as String?) ?? '',
      configuredTableArn: (json['configuredTableArn'] as String?) ?? '',
      configuredTableId: (json['configuredTableId'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      id: (json['id'] as String?) ?? '',
      membershipArn: (json['membershipArn'] as String?) ?? '',
      membershipId: (json['membershipId'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      roleArn: (json['roleArn'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      analysisRuleTypes: (json['analysisRuleTypes'] as List?)
          ?.nonNulls
          .map((e) => ConfiguredTableAssociationAnalysisRuleType.fromString(
              (e as String)))
          .toList(),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final configuredTableArn = this.configuredTableArn;
    final configuredTableId = this.configuredTableId;
    final createTime = this.createTime;
    final id = this.id;
    final membershipArn = this.membershipArn;
    final membershipId = this.membershipId;
    final name = this.name;
    final roleArn = this.roleArn;
    final updateTime = this.updateTime;
    final analysisRuleTypes = this.analysisRuleTypes;
    final description = this.description;
    return {
      'arn': arn,
      'configuredTableArn': configuredTableArn,
      'configuredTableId': configuredTableId,
      'createTime': unixTimestampToJson(createTime),
      'id': id,
      'membershipArn': membershipArn,
      'membershipId': membershipId,
      'name': name,
      'roleArn': roleArn,
      'updateTime': unixTimestampToJson(updateTime),
      if (analysisRuleTypes != null)
        'analysisRuleTypes': analysisRuleTypes.map((e) => e.value).toList(),
      if (description != null) 'description': description,
    };
  }
}

/// A summary of the configured audience model association.
///
/// @nodoc
class ConfiguredAudienceModelAssociationSummary {
  /// The Amazon Resource Name (ARN) of the configured audience model association.
  final String arn;

  /// The Amazon Resource Name (ARN) of the collaboration that contains the
  /// configured audience model association.
  final String collaborationArn;

  /// A unique identifier of the collaboration that configured audience model is
  /// associated with.
  final String collaborationId;

  /// The Amazon Resource Name (ARN) of the configured audience model that was
  /// used for this configured audience model association.
  final String configuredAudienceModelArn;

  /// The time at which the configured audience model association was created.
  final DateTime createTime;

  /// A unique identifier of the configured audience model association.
  final String id;

  /// The Amazon Resource Name (ARN) of the membership that contains the
  /// configured audience model association.
  final String membershipArn;

  /// A unique identifier of the membership that contains the configured audience
  /// model association.
  final String membershipId;

  /// The name of the configured audience model association.
  final String name;

  /// The most recent time at which the configured audience model association was
  /// updated.
  final DateTime updateTime;

  /// The description of the configured audience model association.
  final String? description;

  ConfiguredAudienceModelAssociationSummary({
    required this.arn,
    required this.collaborationArn,
    required this.collaborationId,
    required this.configuredAudienceModelArn,
    required this.createTime,
    required this.id,
    required this.membershipArn,
    required this.membershipId,
    required this.name,
    required this.updateTime,
    this.description,
  });

  factory ConfiguredAudienceModelAssociationSummary.fromJson(
      Map<String, dynamic> json) {
    return ConfiguredAudienceModelAssociationSummary(
      arn: (json['arn'] as String?) ?? '',
      collaborationArn: (json['collaborationArn'] as String?) ?? '',
      collaborationId: (json['collaborationId'] as String?) ?? '',
      configuredAudienceModelArn:
          (json['configuredAudienceModelArn'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      id: (json['id'] as String?) ?? '',
      membershipArn: (json['membershipArn'] as String?) ?? '',
      membershipId: (json['membershipId'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final collaborationArn = this.collaborationArn;
    final collaborationId = this.collaborationId;
    final configuredAudienceModelArn = this.configuredAudienceModelArn;
    final createTime = this.createTime;
    final id = this.id;
    final membershipArn = this.membershipArn;
    final membershipId = this.membershipId;
    final name = this.name;
    final updateTime = this.updateTime;
    final description = this.description;
    return {
      'arn': arn,
      'collaborationArn': collaborationArn,
      'collaborationId': collaborationId,
      'configuredAudienceModelArn': configuredAudienceModelArn,
      'createTime': unixTimestampToJson(createTime),
      'id': id,
      'membershipArn': membershipArn,
      'membershipId': membershipId,
      'name': name,
      'updateTime': unixTimestampToJson(updateTime),
      if (description != null) 'description': description,
    };
  }
}

/// Details about the configured audience model association.
///
/// @nodoc
class ConfiguredAudienceModelAssociation {
  /// The Amazon Resource Name (ARN) of the configured audience model association.
  final String arn;

  /// The Amazon Resource Name (ARN) of the collaboration that contains this
  /// configured audience model association.
  final String collaborationArn;

  /// A unique identifier of the collaboration that contains this configured
  /// audience model association.
  final String collaborationId;

  /// The Amazon Resource Name (ARN) of the configured audience model that was
  /// used for this configured audience model association.
  final String configuredAudienceModelArn;

  /// The time at which the configured audience model association was created.
  final DateTime createTime;

  /// A unique identifier of the configured audience model association.
  final String id;

  /// When <code>TRUE</code>, indicates that the resource policy for the
  /// configured audience model resource being associated is configured for Clean
  /// Rooms to manage permissions related to the given collaboration. When
  /// <code>FALSE</code>, indicates that the configured audience model resource
  /// owner will manage permissions related to the given collaboration.
  final bool manageResourcePolicies;

  /// The Amazon Resource Name (ARN) of the membership that contains this
  /// configured audience model association.
  final String membershipArn;

  /// A unique identifier for the membership that contains this configured
  /// audience model association.
  final String membershipId;

  /// The name of the configured audience model association.
  final String name;

  /// The most recent time at which the configured audience model association was
  /// updated.
  final DateTime updateTime;

  /// The description of the configured audience model association.
  final String? description;

  ConfiguredAudienceModelAssociation({
    required this.arn,
    required this.collaborationArn,
    required this.collaborationId,
    required this.configuredAudienceModelArn,
    required this.createTime,
    required this.id,
    required this.manageResourcePolicies,
    required this.membershipArn,
    required this.membershipId,
    required this.name,
    required this.updateTime,
    this.description,
  });

  factory ConfiguredAudienceModelAssociation.fromJson(
      Map<String, dynamic> json) {
    return ConfiguredAudienceModelAssociation(
      arn: (json['arn'] as String?) ?? '',
      collaborationArn: (json['collaborationArn'] as String?) ?? '',
      collaborationId: (json['collaborationId'] as String?) ?? '',
      configuredAudienceModelArn:
          (json['configuredAudienceModelArn'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      id: (json['id'] as String?) ?? '',
      manageResourcePolicies:
          (json['manageResourcePolicies'] as bool?) ?? false,
      membershipArn: (json['membershipArn'] as String?) ?? '',
      membershipId: (json['membershipId'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final collaborationArn = this.collaborationArn;
    final collaborationId = this.collaborationId;
    final configuredAudienceModelArn = this.configuredAudienceModelArn;
    final createTime = this.createTime;
    final id = this.id;
    final manageResourcePolicies = this.manageResourcePolicies;
    final membershipArn = this.membershipArn;
    final membershipId = this.membershipId;
    final name = this.name;
    final updateTime = this.updateTime;
    final description = this.description;
    return {
      'arn': arn,
      'collaborationArn': collaborationArn,
      'collaborationId': collaborationId,
      'configuredAudienceModelArn': configuredAudienceModelArn,
      'createTime': unixTimestampToJson(createTime),
      'id': id,
      'manageResourcePolicies': manageResourcePolicies,
      'membershipArn': membershipArn,
      'membershipId': membershipId,
      'name': name,
      'updateTime': unixTimestampToJson(updateTime),
      if (description != null) 'description': description,
    };
  }
}

/// Represents a request to modify a collaboration. Change requests enable
/// structured modifications to collaborations after they have been created.
///
/// @nodoc
class CollaborationChangeRequest {
  /// The list of changes specified in this change request.
  final List<Change> changes;

  /// The unique identifier for the collaboration being modified.
  final String collaborationId;

  /// The time when the change request was created.
  final DateTime createTime;

  /// The unique identifier for the change request.
  final String id;

  /// Whether the change request was automatically approved based on the
  /// collaboration's auto-approval settings.
  final bool isAutoApproved;

  /// The current status of the change request. Valid values are
  /// <code>PENDING</code>, <code>APPROVED</code>, <code>DENIED</code>,
  /// <code>COMMITTED</code>, and <code>CANCELLED</code>.
  final ChangeRequestStatus status;

  /// The time when the change request was last updated.
  final DateTime updateTime;

  /// A list of approval details from collaboration members, including approval
  /// status and multi-party approval workflow information.
  final Map<String, ApprovalStatusDetails>? approvals;

  CollaborationChangeRequest({
    required this.changes,
    required this.collaborationId,
    required this.createTime,
    required this.id,
    required this.isAutoApproved,
    required this.status,
    required this.updateTime,
    this.approvals,
  });

  factory CollaborationChangeRequest.fromJson(Map<String, dynamic> json) {
    return CollaborationChangeRequest(
      changes: ((json['changes'] as List?) ?? const [])
          .nonNulls
          .map((e) => Change.fromJson(e as Map<String, dynamic>))
          .toList(),
      collaborationId: (json['collaborationId'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      id: (json['id'] as String?) ?? '',
      isAutoApproved: (json['isAutoApproved'] as bool?) ?? false,
      status: ChangeRequestStatus.fromString((json['status'] as String?) ?? ''),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      approvals: (json['approvals'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(
              k, ApprovalStatusDetails.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final changes = this.changes;
    final collaborationId = this.collaborationId;
    final createTime = this.createTime;
    final id = this.id;
    final isAutoApproved = this.isAutoApproved;
    final status = this.status;
    final updateTime = this.updateTime;
    final approvals = this.approvals;
    return {
      'changes': changes,
      'collaborationId': collaborationId,
      'createTime': unixTimestampToJson(createTime),
      'id': id,
      'isAutoApproved': isAutoApproved,
      'status': status.value,
      'updateTime': unixTimestampToJson(updateTime),
      if (approvals != null) 'approvals': approvals,
    };
  }
}

/// @nodoc
class ChangeRequestStatus {
  static const pending = ChangeRequestStatus._('PENDING');
  static const approved = ChangeRequestStatus._('APPROVED');
  static const cancelled = ChangeRequestStatus._('CANCELLED');
  static const denied = ChangeRequestStatus._('DENIED');
  static const committed = ChangeRequestStatus._('COMMITTED');

  final String value;

  const ChangeRequestStatus._(this.value);

  static const values = [pending, approved, cancelled, denied, committed];

  static ChangeRequestStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ChangeRequestStatus._(value));

  @override
  bool operator ==(other) =>
      other is ChangeRequestStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains detailed information about the approval state of a given member in
/// the collaboration for a given collaboration change request.
///
/// @nodoc
class ApprovalStatusDetails {
  /// The approval status of a member's vote on the change request. Valid values
  /// are PENDING (if they haven't voted), APPROVED, or DENIED.
  final ApprovalStatus status;

  ApprovalStatusDetails({
    required this.status,
  });

  factory ApprovalStatusDetails.fromJson(Map<String, dynamic> json) {
    return ApprovalStatusDetails(
      status: ApprovalStatus.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status.value,
    };
  }
}

/// @nodoc
class ApprovalStatus {
  static const approved = ApprovalStatus._('APPROVED');
  static const denied = ApprovalStatus._('DENIED');
  static const pending = ApprovalStatus._('PENDING');

  final String value;

  const ApprovalStatus._(this.value);

  static const values = [approved, denied, pending];

  static ApprovalStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ApprovalStatus._(value));

  @override
  bool operator ==(other) => other is ApprovalStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a single change within a collaboration change request, containing
/// the change identifier and specification.
///
/// @nodoc
class Change {
  /// The specification details for this change.
  final ChangeSpecification specification;

  /// The type of specification for this change.
  final ChangeSpecificationType specificationType;

  /// The list of change types that were applied.
  final List<ChangeType> types;

  Change({
    required this.specification,
    required this.specificationType,
    required this.types,
  });

  factory Change.fromJson(Map<String, dynamic> json) {
    return Change(
      specification: ChangeSpecification.fromJson(
          (json['specification'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      specificationType: ChangeSpecificationType.fromString(
          (json['specificationType'] as String?) ?? ''),
      types: ((json['types'] as List?) ?? const [])
          .nonNulls
          .map((e) => ChangeType.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final specification = this.specification;
    final specificationType = this.specificationType;
    final types = this.types;
    return {
      'specification': specification,
      'specificationType': specificationType.value,
      'types': types.map((e) => e.value).toList(),
    };
  }
}

/// @nodoc
class ChangeSpecificationType {
  static const member = ChangeSpecificationType._('MEMBER');
  static const collaboration = ChangeSpecificationType._('COLLABORATION');

  final String value;

  const ChangeSpecificationType._(this.value);

  static const values = [member, collaboration];

  static ChangeSpecificationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ChangeSpecificationType._(value));

  @override
  bool operator ==(other) =>
      other is ChangeSpecificationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A union that contains the specification details for different types of
/// changes.
///
/// @nodoc
class ChangeSpecification {
  /// The collaboration configuration changes being requested. Currently, this
  /// only supports modifying which change types are auto-approved for the
  /// collaboration.
  final CollaborationChangeSpecification? collaboration;

  /// The member change specification when the change type is <code>MEMBER</code>.
  final MemberChangeSpecification? member;

  ChangeSpecification({
    this.collaboration,
    this.member,
  });

  factory ChangeSpecification.fromJson(Map<String, dynamic> json) {
    return ChangeSpecification(
      collaboration: json['collaboration'] != null
          ? CollaborationChangeSpecification.fromJson(
              json['collaboration'] as Map<String, dynamic>)
          : null,
      member: json['member'] != null
          ? MemberChangeSpecification.fromJson(
              json['member'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final collaboration = this.collaboration;
    final member = this.member;
    return {
      if (collaboration != null) 'collaboration': collaboration,
      if (member != null) 'member': member,
    };
  }
}

/// @nodoc
class ChangeType {
  static const addMember = ChangeType._('ADD_MEMBER');
  static const grantReceiveResultsAbility =
      ChangeType._('GRANT_RECEIVE_RESULTS_ABILITY');
  static const revokeReceiveResultsAbility =
      ChangeType._('REVOKE_RECEIVE_RESULTS_ABILITY');
  static const editAutoApprovedChangeTypes =
      ChangeType._('EDIT_AUTO_APPROVED_CHANGE_TYPES');
  static const addPayerCandidate = ChangeType._('ADD_PAYER_CANDIDATE');
  static const removePayerCandidate = ChangeType._('REMOVE_PAYER_CANDIDATE');
  static const grantCanReceiveModelOutput =
      ChangeType._('GRANT_CAN_RECEIVE_MODEL_OUTPUT');
  static const grantCanReceiveInferenceOutput =
      ChangeType._('GRANT_CAN_RECEIVE_INFERENCE_OUTPUT');
  static const revokeCanReceiveModelOutput =
      ChangeType._('REVOKE_CAN_RECEIVE_MODEL_OUTPUT');
  static const revokeCanReceiveInferenceOutput =
      ChangeType._('REVOKE_CAN_RECEIVE_INFERENCE_OUTPUT');

  final String value;

  const ChangeType._(this.value);

  static const values = [
    addMember,
    grantReceiveResultsAbility,
    revokeReceiveResultsAbility,
    editAutoApprovedChangeTypes,
    addPayerCandidate,
    removePayerCandidate,
    grantCanReceiveModelOutput,
    grantCanReceiveInferenceOutput,
    revokeCanReceiveModelOutput,
    revokeCanReceiveInferenceOutput
  ];

  static ChangeType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ChangeType._(value));

  @override
  bool operator ==(other) => other is ChangeType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specifies changes to collaboration membership, including adding new members
/// with their abilities and display names.
///
/// @nodoc
class MemberChangeSpecification {
  /// The Amazon Web Services account ID of the member to add to the
  /// collaboration.
  final String accountId;

  /// The abilities granted to the collaboration member. These determine what
  /// actions the member can perform within the collaboration.
  /// <note>
  /// The following values are currently not supported: <code>CAN_QUERY</code> and
  /// <code>CAN_RUN_JOB</code>.
  ///
  /// Set the value of <code>memberAbilities</code> to <code>\[\]</code> to allow
  /// a member to contribute data.
  ///
  /// Set the value of <code>memberAbilities</code> to
  /// <code>\[CAN_RECEIVE_RESULTS\]</code> to allow a member to contribute data
  /// and receive results.
  /// </note>
  final List<MemberAbility> memberAbilities;

  /// Specifies the display name that will be shown for this member in the
  /// collaboration. While this field is required when inviting new members, it
  /// becomes optional when modifying abilities of existing collaboration members.
  final String? displayName;
  final MLMemberAbilities? mlMemberAbilities;
  final PaymentConfiguration? paymentConfiguration;

  MemberChangeSpecification({
    required this.accountId,
    required this.memberAbilities,
    this.displayName,
    this.mlMemberAbilities,
    this.paymentConfiguration,
  });

  factory MemberChangeSpecification.fromJson(Map<String, dynamic> json) {
    return MemberChangeSpecification(
      accountId: (json['accountId'] as String?) ?? '',
      memberAbilities: ((json['memberAbilities'] as List?) ?? const [])
          .nonNulls
          .map((e) => MemberAbility.fromString((e as String)))
          .toList(),
      displayName: json['displayName'] as String?,
      mlMemberAbilities: json['mlMemberAbilities'] != null
          ? MLMemberAbilities.fromJson(
              json['mlMemberAbilities'] as Map<String, dynamic>)
          : null,
      paymentConfiguration: json['paymentConfiguration'] != null
          ? PaymentConfiguration.fromJson(
              json['paymentConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final memberAbilities = this.memberAbilities;
    final displayName = this.displayName;
    final mlMemberAbilities = this.mlMemberAbilities;
    final paymentConfiguration = this.paymentConfiguration;
    return {
      'accountId': accountId,
      'memberAbilities': memberAbilities.map((e) => e.value).toList(),
      if (displayName != null) 'displayName': displayName,
      if (mlMemberAbilities != null) 'mlMemberAbilities': mlMemberAbilities,
      if (paymentConfiguration != null)
        'paymentConfiguration': paymentConfiguration,
    };
  }
}

/// Defines the specific changes being requested for a collaboration, including
/// configuration modifications and approval requirements.
///
/// @nodoc
class CollaborationChangeSpecification {
  /// Defines requested updates to properties of the collaboration. Currently,
  /// this only supports modifying which change types are auto-approved for the
  /// collaboration.
  final List<AutoApprovedChangeType>? autoApprovedChangeTypes;

  CollaborationChangeSpecification({
    this.autoApprovedChangeTypes,
  });

  factory CollaborationChangeSpecification.fromJson(Map<String, dynamic> json) {
    return CollaborationChangeSpecification(
      autoApprovedChangeTypes: (json['autoApprovedChangeTypes'] as List?)
          ?.nonNulls
          .map((e) => AutoApprovedChangeType.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final autoApprovedChangeTypes = this.autoApprovedChangeTypes;
    return {
      if (autoApprovedChangeTypes != null)
        'autoApprovedChangeTypes':
            autoApprovedChangeTypes.map((e) => e.value).toList(),
    };
  }
}

/// @nodoc
class AutoApprovedChangeType {
  static const addMember = AutoApprovedChangeType._('ADD_MEMBER');
  static const grantReceiveResultsAbility =
      AutoApprovedChangeType._('GRANT_RECEIVE_RESULTS_ABILITY');
  static const revokeReceiveResultsAbility =
      AutoApprovedChangeType._('REVOKE_RECEIVE_RESULTS_ABILITY');

  final String value;

  const AutoApprovedChangeType._(this.value);

  static const values = [
    addMember,
    grantReceiveResultsAbility,
    revokeReceiveResultsAbility
  ];

  static AutoApprovedChangeType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AutoApprovedChangeType._(value));

  @override
  bool operator ==(other) =>
      other is AutoApprovedChangeType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An object representing the collaboration member's payment responsibilities
/// set by the collaboration creator.
///
/// @nodoc
class PaymentConfiguration {
  /// The collaboration member's payment responsibilities set by the collaboration
  /// creator for query compute costs.
  final QueryComputePaymentConfig queryCompute;

  /// The compute configuration for the job.
  final JobComputePaymentConfig? jobCompute;

  /// An object representing the collaboration member's machine learning payment
  /// responsibilities set by the collaboration creator.
  final MLPaymentConfig? machineLearning;

  PaymentConfiguration({
    required this.queryCompute,
    this.jobCompute,
    this.machineLearning,
  });

  factory PaymentConfiguration.fromJson(Map<String, dynamic> json) {
    return PaymentConfiguration(
      queryCompute: QueryComputePaymentConfig.fromJson(
          (json['queryCompute'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      jobCompute: json['jobCompute'] != null
          ? JobComputePaymentConfig.fromJson(
              json['jobCompute'] as Map<String, dynamic>)
          : null,
      machineLearning: json['machineLearning'] != null
          ? MLPaymentConfig.fromJson(
              json['machineLearning'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final queryCompute = this.queryCompute;
    final jobCompute = this.jobCompute;
    final machineLearning = this.machineLearning;
    return {
      'queryCompute': queryCompute,
      if (jobCompute != null) 'jobCompute': jobCompute,
      if (machineLearning != null) 'machineLearning': machineLearning,
    };
  }
}

/// An object representing the collaboration member's payment responsibilities
/// set by the collaboration creator for query compute costs.
///
/// @nodoc
class QueryComputePaymentConfig {
  /// Indicates whether the collaboration creator has configured the collaboration
  /// member to pay for query compute costs (<code>TRUE</code>) or has not
  /// configured the collaboration member to pay for query compute costs
  /// (<code>FALSE</code>).
  ///
  /// Exactly one member can be configured to pay for query compute costs. An
  /// error is returned if the collaboration creator sets a <code>TRUE</code>
  /// value for more than one member in the collaboration.
  ///
  /// If the collaboration creator hasn't specified anyone as the member paying
  /// for query compute costs, then the member who can query is the default payer.
  /// An error is returned if the collaboration creator sets a <code>FALSE</code>
  /// value for the member who can query.
  final bool isResponsible;

  QueryComputePaymentConfig({
    required this.isResponsible,
  });

  factory QueryComputePaymentConfig.fromJson(Map<String, dynamic> json) {
    return QueryComputePaymentConfig(
      isResponsible: (json['isResponsible'] as bool?) ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final isResponsible = this.isResponsible;
    return {
      'isResponsible': isResponsible,
    };
  }
}

/// An object representing the collaboration member's machine learning payment
/// responsibilities set by the collaboration creator.
///
/// @nodoc
class MLPaymentConfig {
  /// The payment responsibilities accepted by the member for model inference.
  final ModelInferencePaymentConfig? modelInference;

  /// The payment responsibilities accepted by the member for model training.
  final ModelTrainingPaymentConfig? modelTraining;

  /// The payment configuration for machine learning synthetic data generation.
  final SyntheticDataGenerationPaymentConfig? syntheticDataGeneration;

  MLPaymentConfig({
    this.modelInference,
    this.modelTraining,
    this.syntheticDataGeneration,
  });

  factory MLPaymentConfig.fromJson(Map<String, dynamic> json) {
    return MLPaymentConfig(
      modelInference: json['modelInference'] != null
          ? ModelInferencePaymentConfig.fromJson(
              json['modelInference'] as Map<String, dynamic>)
          : null,
      modelTraining: json['modelTraining'] != null
          ? ModelTrainingPaymentConfig.fromJson(
              json['modelTraining'] as Map<String, dynamic>)
          : null,
      syntheticDataGeneration: json['syntheticDataGeneration'] != null
          ? SyntheticDataGenerationPaymentConfig.fromJson(
              json['syntheticDataGeneration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final modelInference = this.modelInference;
    final modelTraining = this.modelTraining;
    final syntheticDataGeneration = this.syntheticDataGeneration;
    return {
      if (modelInference != null) 'modelInference': modelInference,
      if (modelTraining != null) 'modelTraining': modelTraining,
      if (syntheticDataGeneration != null)
        'syntheticDataGeneration': syntheticDataGeneration,
    };
  }
}

/// An object representing the collaboration member's payment responsibilities
/// set by the collaboration creator for query and job compute costs.
///
/// @nodoc
class JobComputePaymentConfig {
  /// Indicates whether the collaboration creator has configured the collaboration
  /// member to pay for query and job compute costs (<code>TRUE</code>) or has not
  /// configured the collaboration member to pay for query and job compute costs
  /// (<code>FALSE</code>).
  ///
  /// Exactly one member can be configured to pay for query and job compute costs.
  /// An error is returned if the collaboration creator sets a <code>TRUE</code>
  /// value for more than one member in the collaboration.
  ///
  /// An error is returned if the collaboration creator sets a <code>FALSE</code>
  /// value for the member who can run queries and jobs.
  final bool isResponsible;

  JobComputePaymentConfig({
    required this.isResponsible,
  });

  factory JobComputePaymentConfig.fromJson(Map<String, dynamic> json) {
    return JobComputePaymentConfig(
      isResponsible: (json['isResponsible'] as bool?) ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final isResponsible = this.isResponsible;
    return {
      'isResponsible': isResponsible,
    };
  }
}

/// An object representing the collaboration member's model training payment
/// responsibilities set by the collaboration creator.
///
/// @nodoc
class ModelTrainingPaymentConfig {
  /// Indicates whether the collaboration creator has configured the collaboration
  /// member to pay for model training costs (<code>TRUE</code>) or has not
  /// configured the collaboration member to pay for model training costs
  /// (<code>FALSE</code>).
  ///
  /// Exactly one member can be configured to pay for model training costs. An
  /// error is returned if the collaboration creator sets a <code>TRUE</code>
  /// value for more than one member in the collaboration.
  ///
  /// If the collaboration creator hasn't specified anyone as the member paying
  /// for model training costs, then the member who can query is the default
  /// payer. An error is returned if the collaboration creator sets a
  /// <code>FALSE</code> value for the member who can query.
  final bool isResponsible;

  ModelTrainingPaymentConfig({
    required this.isResponsible,
  });

  factory ModelTrainingPaymentConfig.fromJson(Map<String, dynamic> json) {
    return ModelTrainingPaymentConfig(
      isResponsible: (json['isResponsible'] as bool?) ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final isResponsible = this.isResponsible;
    return {
      'isResponsible': isResponsible,
    };
  }
}

/// An object representing the collaboration member's model inference payment
/// responsibilities set by the collaboration creator.
///
/// @nodoc
class ModelInferencePaymentConfig {
  /// Indicates whether the collaboration creator has configured the collaboration
  /// member to pay for model inference costs (<code>TRUE</code>) or has not
  /// configured the collaboration member to pay for model inference costs
  /// (<code>FALSE</code>).
  ///
  /// Exactly one member can be configured to pay for model inference costs. An
  /// error is returned if the collaboration creator sets a <code>TRUE</code>
  /// value for more than one member in the collaboration.
  ///
  /// If the collaboration creator hasn't specified anyone as the member paying
  /// for model inference costs, then the member who can query is the default
  /// payer. An error is returned if the collaboration creator sets a
  /// <code>FALSE</code> value for the member who can query.
  final bool isResponsible;

  ModelInferencePaymentConfig({
    required this.isResponsible,
  });

  factory ModelInferencePaymentConfig.fromJson(Map<String, dynamic> json) {
    return ModelInferencePaymentConfig(
      isResponsible: (json['isResponsible'] as bool?) ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final isResponsible = this.isResponsible;
    return {
      'isResponsible': isResponsible,
    };
  }
}

/// Payment configuration for synthetic data generation.
///
/// @nodoc
class SyntheticDataGenerationPaymentConfig {
  /// Indicates who is responsible for paying for synthetic data generation.
  final bool isResponsible;

  SyntheticDataGenerationPaymentConfig({
    required this.isResponsible,
  });

  factory SyntheticDataGenerationPaymentConfig.fromJson(
      Map<String, dynamic> json) {
    return SyntheticDataGenerationPaymentConfig(
      isResponsible: (json['isResponsible'] as bool?) ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final isResponsible = this.isResponsible;
    return {
      'isResponsible': isResponsible,
    };
  }
}

/// @nodoc
class ChangeRequestAction {
  static const approve = ChangeRequestAction._('APPROVE');
  static const deny = ChangeRequestAction._('DENY');
  static const cancel = ChangeRequestAction._('CANCEL');
  static const commit = ChangeRequestAction._('COMMIT');

  final String value;

  const ChangeRequestAction._(this.value);

  static const values = [approve, deny, cancel, commit];

  static ChangeRequestAction fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ChangeRequestAction._(value));

  @override
  bool operator ==(other) =>
      other is ChangeRequestAction && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The schema summary for the objects listed by the request.
///
/// @nodoc
class SchemaSummary {
  /// The types of analysis rules that are associated with this schema object.
  final List<AnalysisRuleType> analysisRuleTypes;

  /// The unique ARN for the collaboration that the schema belongs to.
  final String collaborationArn;

  /// The unique ID for the collaboration that the schema belongs to.
  final String collaborationId;

  /// The time the schema object was created.
  final DateTime createTime;

  /// The unique account ID for the Amazon Web Services account that owns the
  /// schema.
  final String creatorAccountId;

  /// The name for the schema object.
  final String name;

  /// The type of schema object.
  final SchemaType type;

  /// The time the schema object was last updated.
  final DateTime updateTime;

  /// The analysis method for the associated schema.
  ///
  /// <code>DIRECT_QUERY</code> allows SQL queries to be run directly on this
  /// table.
  ///
  /// <code>DIRECT_JOB</code> allows PySpark jobs to be run directly on this
  /// table.
  ///
  /// <code>MULTIPLE</code> allows both SQL queries and PySpark jobs to be run
  /// directly on this table.
  final AnalysisMethod? analysisMethod;

  /// The Amazon Resource Name (ARN) of the schema summary resource.
  final String? resourceArn;

  /// The selected analysis methods for the schema.
  final List<SelectedAnalysisMethod>? selectedAnalysisMethods;

  SchemaSummary({
    required this.analysisRuleTypes,
    required this.collaborationArn,
    required this.collaborationId,
    required this.createTime,
    required this.creatorAccountId,
    required this.name,
    required this.type,
    required this.updateTime,
    this.analysisMethod,
    this.resourceArn,
    this.selectedAnalysisMethods,
  });

  factory SchemaSummary.fromJson(Map<String, dynamic> json) {
    return SchemaSummary(
      analysisRuleTypes: ((json['analysisRuleTypes'] as List?) ?? const [])
          .nonNulls
          .map((e) => AnalysisRuleType.fromString((e as String)))
          .toList(),
      collaborationArn: (json['collaborationArn'] as String?) ?? '',
      collaborationId: (json['collaborationId'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      creatorAccountId: (json['creatorAccountId'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      type: SchemaType.fromString((json['type'] as String?) ?? ''),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      analysisMethod:
          (json['analysisMethod'] as String?)?.let(AnalysisMethod.fromString),
      resourceArn: json['resourceArn'] as String?,
      selectedAnalysisMethods: (json['selectedAnalysisMethods'] as List?)
          ?.nonNulls
          .map((e) => SelectedAnalysisMethod.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final analysisRuleTypes = this.analysisRuleTypes;
    final collaborationArn = this.collaborationArn;
    final collaborationId = this.collaborationId;
    final createTime = this.createTime;
    final creatorAccountId = this.creatorAccountId;
    final name = this.name;
    final type = this.type;
    final updateTime = this.updateTime;
    final analysisMethod = this.analysisMethod;
    final resourceArn = this.resourceArn;
    final selectedAnalysisMethods = this.selectedAnalysisMethods;
    return {
      'analysisRuleTypes': analysisRuleTypes.map((e) => e.value).toList(),
      'collaborationArn': collaborationArn,
      'collaborationId': collaborationId,
      'createTime': unixTimestampToJson(createTime),
      'creatorAccountId': creatorAccountId,
      'name': name,
      'type': type.value,
      'updateTime': unixTimestampToJson(updateTime),
      if (analysisMethod != null) 'analysisMethod': analysisMethod.value,
      if (resourceArn != null) 'resourceArn': resourceArn,
      if (selectedAnalysisMethods != null)
        'selectedAnalysisMethods':
            selectedAnalysisMethods.map((e) => e.value).toList(),
    };
  }
}

/// @nodoc
class SchemaType {
  static const table = SchemaType._('TABLE');
  static const idMappingTable = SchemaType._('ID_MAPPING_TABLE');

  final String value;

  const SchemaType._(this.value);

  static const values = [table, idMappingTable];

  static SchemaType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => SchemaType._(value));

  @override
  bool operator ==(other) => other is SchemaType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AnalysisRuleType {
  static const aggregation = AnalysisRuleType._('AGGREGATION');
  static const list = AnalysisRuleType._('LIST');
  static const custom = AnalysisRuleType._('CUSTOM');
  static const idMappingTable = AnalysisRuleType._('ID_MAPPING_TABLE');

  final String value;

  const AnalysisRuleType._(this.value);

  static const values = [aggregation, list, custom, idMappingTable];

  static AnalysisRuleType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AnalysisRuleType._(value));

  @override
  bool operator ==(other) => other is AnalysisRuleType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The member object listed by the request.
///
/// @nodoc
class MemberSummary {
  /// The abilities granted to the collaboration member.
  final List<MemberAbility> abilities;

  /// The identifier used to reference members of the collaboration. Currently
  /// only supports Amazon Web Services account ID.
  final String accountId;

  /// The time when the member was created.
  final DateTime createTime;

  /// The member's display name.
  final String displayName;

  /// The collaboration member's payment responsibilities set by the collaboration
  /// creator.
  final PaymentConfiguration paymentConfiguration;

  /// The status of the member.
  final MemberStatus status;

  /// The time the member metadata was last updated.
  final DateTime updateTime;

  /// The unique ARN for the member's associated membership, if present.
  final String? membershipArn;

  /// The unique ID for the member's associated membership, if present.
  final String? membershipId;

  /// Provides a summary of the ML abilities for the collaboration member.
  final MLMemberAbilities? mlAbilities;

  MemberSummary({
    required this.abilities,
    required this.accountId,
    required this.createTime,
    required this.displayName,
    required this.paymentConfiguration,
    required this.status,
    required this.updateTime,
    this.membershipArn,
    this.membershipId,
    this.mlAbilities,
  });

  factory MemberSummary.fromJson(Map<String, dynamic> json) {
    return MemberSummary(
      abilities: ((json['abilities'] as List?) ?? const [])
          .nonNulls
          .map((e) => MemberAbility.fromString((e as String)))
          .toList(),
      accountId: (json['accountId'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      displayName: (json['displayName'] as String?) ?? '',
      paymentConfiguration: PaymentConfiguration.fromJson(
          (json['paymentConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      status: MemberStatus.fromString((json['status'] as String?) ?? ''),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      membershipArn: json['membershipArn'] as String?,
      membershipId: json['membershipId'] as String?,
      mlAbilities: json['mlAbilities'] != null
          ? MLMemberAbilities.fromJson(
              json['mlAbilities'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final abilities = this.abilities;
    final accountId = this.accountId;
    final createTime = this.createTime;
    final displayName = this.displayName;
    final paymentConfiguration = this.paymentConfiguration;
    final status = this.status;
    final updateTime = this.updateTime;
    final membershipArn = this.membershipArn;
    final membershipId = this.membershipId;
    final mlAbilities = this.mlAbilities;
    return {
      'abilities': abilities.map((e) => e.value).toList(),
      'accountId': accountId,
      'createTime': unixTimestampToJson(createTime),
      'displayName': displayName,
      'paymentConfiguration': paymentConfiguration,
      'status': status.value,
      'updateTime': unixTimestampToJson(updateTime),
      if (membershipArn != null) 'membershipArn': membershipArn,
      if (membershipId != null) 'membershipId': membershipId,
      if (mlAbilities != null) 'mlAbilities': mlAbilities,
    };
  }
}

/// @nodoc
class MemberStatus {
  static const invited = MemberStatus._('INVITED');
  static const active = MemberStatus._('ACTIVE');
  static const left = MemberStatus._('LEFT');
  static const removed = MemberStatus._('REMOVED');

  final String value;

  const MemberStatus._(this.value);

  static const values = [invited, active, left, removed];

  static MemberStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => MemberStatus._(value));

  @override
  bool operator ==(other) => other is MemberStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A summary of the collaboration's privacy budget template. This summary
/// includes information about who created the privacy budget template and what
/// collaborations it belongs to.
///
/// @nodoc
class CollaborationPrivacyBudgetTemplateSummary {
  /// The ARN of the collaboration privacy budget template.
  final String arn;

  /// The ARN of the collaboration that contains this collaboration privacy budget
  /// template.
  final String collaborationArn;

  /// The unique identifier of the collaboration that contains this collaboration
  /// privacy budget template.
  final String collaborationId;

  /// The time at which the collaboration privacy budget template was created.
  final DateTime createTime;

  /// The unique identifier of the account that created this collaboration privacy
  /// budget template.
  final String creatorAccountId;

  /// The unique identifier of the collaboration privacy budget template.
  final String id;

  /// The type of the privacy budget template.
  final PrivacyBudgetType privacyBudgetType;

  /// The most recent time at which the collaboration privacy budget template was
  /// updated.
  final DateTime updateTime;

  CollaborationPrivacyBudgetTemplateSummary({
    required this.arn,
    required this.collaborationArn,
    required this.collaborationId,
    required this.createTime,
    required this.creatorAccountId,
    required this.id,
    required this.privacyBudgetType,
    required this.updateTime,
  });

  factory CollaborationPrivacyBudgetTemplateSummary.fromJson(
      Map<String, dynamic> json) {
    return CollaborationPrivacyBudgetTemplateSummary(
      arn: (json['arn'] as String?) ?? '',
      collaborationArn: (json['collaborationArn'] as String?) ?? '',
      collaborationId: (json['collaborationId'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      creatorAccountId: (json['creatorAccountId'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      privacyBudgetType: PrivacyBudgetType.fromString(
          (json['privacyBudgetType'] as String?) ?? ''),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final collaborationArn = this.collaborationArn;
    final collaborationId = this.collaborationId;
    final createTime = this.createTime;
    final creatorAccountId = this.creatorAccountId;
    final id = this.id;
    final privacyBudgetType = this.privacyBudgetType;
    final updateTime = this.updateTime;
    return {
      'arn': arn,
      'collaborationArn': collaborationArn,
      'collaborationId': collaborationId,
      'createTime': unixTimestampToJson(createTime),
      'creatorAccountId': creatorAccountId,
      'id': id,
      'privacyBudgetType': privacyBudgetType.value,
      'updateTime': unixTimestampToJson(updateTime),
    };
  }
}

/// A summary of the collaboration privacy budgets. This summary includes the
/// collaboration information, creation information, epsilon provided, and
/// utility in terms of aggregations.
///
/// @nodoc
class CollaborationPrivacyBudgetSummary {
  /// The includes epsilon provided and utility in terms of aggregations.
  final PrivacyBudget budget;

  /// The ARN of the collaboration that includes this privacy budget.
  final String collaborationArn;

  /// The unique identifier of the collaboration that includes this privacy
  /// budget.
  final String collaborationId;

  /// The time at which the privacy budget was created.
  final DateTime createTime;

  /// The unique identifier of the account that created this privacy budget.
  final String creatorAccountId;

  /// The unique identifier of the collaboration privacy budget.
  final String id;

  /// The ARN of the collaboration privacy budget template.
  final String privacyBudgetTemplateArn;

  /// The unique identifier of the collaboration privacy budget template.
  final String privacyBudgetTemplateId;

  /// The type of privacy budget template.
  final PrivacyBudgetType type;

  /// The most recent time at which the privacy budget was updated.
  final DateTime updateTime;

  CollaborationPrivacyBudgetSummary({
    required this.budget,
    required this.collaborationArn,
    required this.collaborationId,
    required this.createTime,
    required this.creatorAccountId,
    required this.id,
    required this.privacyBudgetTemplateArn,
    required this.privacyBudgetTemplateId,
    required this.type,
    required this.updateTime,
  });

  factory CollaborationPrivacyBudgetSummary.fromJson(
      Map<String, dynamic> json) {
    return CollaborationPrivacyBudgetSummary(
      budget: PrivacyBudget.fromJson(
          (json['budget'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      collaborationArn: (json['collaborationArn'] as String?) ?? '',
      collaborationId: (json['collaborationId'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      creatorAccountId: (json['creatorAccountId'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      privacyBudgetTemplateArn:
          (json['privacyBudgetTemplateArn'] as String?) ?? '',
      privacyBudgetTemplateId:
          (json['privacyBudgetTemplateId'] as String?) ?? '',
      type: PrivacyBudgetType.fromString((json['type'] as String?) ?? ''),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final budget = this.budget;
    final collaborationArn = this.collaborationArn;
    final collaborationId = this.collaborationId;
    final createTime = this.createTime;
    final creatorAccountId = this.creatorAccountId;
    final id = this.id;
    final privacyBudgetTemplateArn = this.privacyBudgetTemplateArn;
    final privacyBudgetTemplateId = this.privacyBudgetTemplateId;
    final type = this.type;
    final updateTime = this.updateTime;
    return {
      'budget': budget,
      'collaborationArn': collaborationArn,
      'collaborationId': collaborationId,
      'createTime': unixTimestampToJson(createTime),
      'creatorAccountId': creatorAccountId,
      'id': id,
      'privacyBudgetTemplateArn': privacyBudgetTemplateArn,
      'privacyBudgetTemplateId': privacyBudgetTemplateId,
      'type': type.value,
      'updateTime': unixTimestampToJson(updateTime),
    };
  }
}

/// Provides summary information about the collaboration ID namespace
/// association.
///
/// @nodoc
class CollaborationIdNamespaceAssociationSummary {
  /// The Amazon Resource Name (ARN) of the collaboration ID namespace
  /// association.
  final String arn;

  /// The Amazon Resource Name (ARN) of the collaboration that contains this
  /// collaboration ID namespace association.
  final String collaborationArn;

  /// The unique identifier of the collaboration that contains this collaboration
  /// ID namespace association.
  final String collaborationId;

  /// The time at which the collaboration ID namespace association was created.
  final DateTime createTime;

  /// The Amazon Web Services account that created this collaboration ID namespace
  /// association.
  final String creatorAccountId;

  /// The unique identifier of the collaboration ID namespace association.
  final String id;

  /// The input reference configuration that's used to create the collaboration ID
  /// namespace association.
  final IdNamespaceAssociationInputReferenceConfig inputReferenceConfig;

  /// The input reference properties that are used to create the collaboration ID
  /// namespace association.
  final IdNamespaceAssociationInputReferencePropertiesSummary
      inputReferenceProperties;

  /// The name of the collaboration ID namespace association.
  final String name;

  /// The most recent time at which the collaboration ID namespace association was
  /// updated.
  final DateTime updateTime;

  /// The description of the collaboration ID namepsace association.
  final String? description;

  CollaborationIdNamespaceAssociationSummary({
    required this.arn,
    required this.collaborationArn,
    required this.collaborationId,
    required this.createTime,
    required this.creatorAccountId,
    required this.id,
    required this.inputReferenceConfig,
    required this.inputReferenceProperties,
    required this.name,
    required this.updateTime,
    this.description,
  });

  factory CollaborationIdNamespaceAssociationSummary.fromJson(
      Map<String, dynamic> json) {
    return CollaborationIdNamespaceAssociationSummary(
      arn: (json['arn'] as String?) ?? '',
      collaborationArn: (json['collaborationArn'] as String?) ?? '',
      collaborationId: (json['collaborationId'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      creatorAccountId: (json['creatorAccountId'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      inputReferenceConfig: IdNamespaceAssociationInputReferenceConfig.fromJson(
          (json['inputReferenceConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      inputReferenceProperties:
          IdNamespaceAssociationInputReferencePropertiesSummary.fromJson(
              (json['inputReferenceProperties'] as Map<String, dynamic>?) ??
                  const <String, dynamic>{}),
      name: (json['name'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final collaborationArn = this.collaborationArn;
    final collaborationId = this.collaborationId;
    final createTime = this.createTime;
    final creatorAccountId = this.creatorAccountId;
    final id = this.id;
    final inputReferenceConfig = this.inputReferenceConfig;
    final inputReferenceProperties = this.inputReferenceProperties;
    final name = this.name;
    final updateTime = this.updateTime;
    final description = this.description;
    return {
      'arn': arn,
      'collaborationArn': collaborationArn,
      'collaborationId': collaborationId,
      'createTime': unixTimestampToJson(createTime),
      'creatorAccountId': creatorAccountId,
      'id': id,
      'inputReferenceConfig': inputReferenceConfig,
      'inputReferenceProperties': inputReferenceProperties,
      'name': name,
      'updateTime': unixTimestampToJson(updateTime),
      if (description != null) 'description': description,
    };
  }
}

/// A summary of the configured audience model association in the collaboration.
///
/// @nodoc
class CollaborationConfiguredAudienceModelAssociationSummary {
  /// The Amazon Resource Name (ARN) of the configured audience model association.
  final String arn;

  /// The unique ARN for the configured audience model's associated collaboration.
  final String collaborationArn;

  /// A unique identifier for the collaboration that the configured audience model
  /// associations belong to. Accepts collaboration ID.
  final String collaborationId;

  /// The time at which the configured audience model association was created.
  final DateTime createTime;

  /// The identifier used to reference members of the collaboration. Only supports
  /// Amazon Web Services account ID.
  final String creatorAccountId;

  /// The identifier of the configured audience model association.
  final String id;

  /// The name of the configured audience model association.
  final String name;

  /// The most recent time at which the configured audience model association was
  /// updated.
  final DateTime updateTime;

  /// The description of the configured audience model association.
  final String? description;

  CollaborationConfiguredAudienceModelAssociationSummary({
    required this.arn,
    required this.collaborationArn,
    required this.collaborationId,
    required this.createTime,
    required this.creatorAccountId,
    required this.id,
    required this.name,
    required this.updateTime,
    this.description,
  });

  factory CollaborationConfiguredAudienceModelAssociationSummary.fromJson(
      Map<String, dynamic> json) {
    return CollaborationConfiguredAudienceModelAssociationSummary(
      arn: (json['arn'] as String?) ?? '',
      collaborationArn: (json['collaborationArn'] as String?) ?? '',
      collaborationId: (json['collaborationId'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      creatorAccountId: (json['creatorAccountId'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final collaborationArn = this.collaborationArn;
    final collaborationId = this.collaborationId;
    final createTime = this.createTime;
    final creatorAccountId = this.creatorAccountId;
    final id = this.id;
    final name = this.name;
    final updateTime = this.updateTime;
    final description = this.description;
    return {
      'arn': arn,
      'collaborationArn': collaborationArn,
      'collaborationId': collaborationId,
      'createTime': unixTimestampToJson(createTime),
      'creatorAccountId': creatorAccountId,
      'id': id,
      'name': name,
      'updateTime': unixTimestampToJson(updateTime),
      if (description != null) 'description': description,
    };
  }
}

/// Summary information about a collaboration change request.
///
/// @nodoc
class CollaborationChangeRequestSummary {
  /// Summary of the changes in this change request.
  final List<Change> changes;

  /// The unique identifier for the collaboration.
  final String collaborationId;

  /// The time when the change request was created.
  final DateTime createTime;

  /// The unique identifier for the change request.
  final String id;

  /// Whether the change request was automatically approved.
  final bool isAutoApproved;

  /// The current status of the change request.
  final ChangeRequestStatus status;

  /// The time when the change request was last updated.
  final DateTime updateTime;

  /// Summary of approval statuses from all collaboration members for this change
  /// request.
  final Map<String, ApprovalStatusDetails>? approvals;

  CollaborationChangeRequestSummary({
    required this.changes,
    required this.collaborationId,
    required this.createTime,
    required this.id,
    required this.isAutoApproved,
    required this.status,
    required this.updateTime,
    this.approvals,
  });

  factory CollaborationChangeRequestSummary.fromJson(
      Map<String, dynamic> json) {
    return CollaborationChangeRequestSummary(
      changes: ((json['changes'] as List?) ?? const [])
          .nonNulls
          .map((e) => Change.fromJson(e as Map<String, dynamic>))
          .toList(),
      collaborationId: (json['collaborationId'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      id: (json['id'] as String?) ?? '',
      isAutoApproved: (json['isAutoApproved'] as bool?) ?? false,
      status: ChangeRequestStatus.fromString((json['status'] as String?) ?? ''),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      approvals: (json['approvals'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(
              k, ApprovalStatusDetails.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final changes = this.changes;
    final collaborationId = this.collaborationId;
    final createTime = this.createTime;
    final id = this.id;
    final isAutoApproved = this.isAutoApproved;
    final status = this.status;
    final updateTime = this.updateTime;
    final approvals = this.approvals;
    return {
      'changes': changes,
      'collaborationId': collaborationId,
      'createTime': unixTimestampToJson(createTime),
      'id': id,
      'isAutoApproved': isAutoApproved,
      'status': status.value,
      'updateTime': unixTimestampToJson(updateTime),
      if (approvals != null) 'approvals': approvals,
    };
  }
}

/// The metadata of the analysis template within a collaboration.
///
/// @nodoc
class CollaborationAnalysisTemplateSummary {
  /// The Amazon Resource Name (ARN) of the analysis template.
  final String arn;

  /// The unique ARN for the analysis template’s associated collaboration.
  final String collaborationArn;

  /// A unique identifier for the collaboration that the analysis templates belong
  /// to. Currently accepts collaboration ID.
  final String collaborationId;

  /// The time that the summary of the analysis template in a collaboration was
  /// created.
  final DateTime createTime;

  /// The identifier used to reference members of the collaboration. Currently
  /// only supports Amazon Web Services account ID.
  final String creatorAccountId;

  /// The identifier of the analysis template.
  final String id;

  /// The name of the analysis template.
  final String name;

  /// The time that the summary of the analysis template in the collaboration was
  /// last updated.
  final DateTime updateTime;

  /// The description of the analysis template.
  final String? description;

  /// Indicates if this collaboration analysis template uses synthetic data
  /// generation.
  final bool? isSyntheticData;

  CollaborationAnalysisTemplateSummary({
    required this.arn,
    required this.collaborationArn,
    required this.collaborationId,
    required this.createTime,
    required this.creatorAccountId,
    required this.id,
    required this.name,
    required this.updateTime,
    this.description,
    this.isSyntheticData,
  });

  factory CollaborationAnalysisTemplateSummary.fromJson(
      Map<String, dynamic> json) {
    return CollaborationAnalysisTemplateSummary(
      arn: (json['arn'] as String?) ?? '',
      collaborationArn: (json['collaborationArn'] as String?) ?? '',
      collaborationId: (json['collaborationId'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      creatorAccountId: (json['creatorAccountId'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      description: json['description'] as String?,
      isSyntheticData: json['isSyntheticData'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final collaborationArn = this.collaborationArn;
    final collaborationId = this.collaborationId;
    final createTime = this.createTime;
    final creatorAccountId = this.creatorAccountId;
    final id = this.id;
    final name = this.name;
    final updateTime = this.updateTime;
    final description = this.description;
    final isSyntheticData = this.isSyntheticData;
    return {
      'arn': arn,
      'collaborationArn': collaborationArn,
      'collaborationId': collaborationId,
      'createTime': unixTimestampToJson(createTime),
      'creatorAccountId': creatorAccountId,
      'id': id,
      'name': name,
      'updateTime': unixTimestampToJson(updateTime),
      if (description != null) 'description': description,
      if (isSyntheticData != null) 'isSyntheticData': isSyntheticData,
    };
  }
}

/// A specification about how data from the configured table can be used in a
/// query.
///
/// @nodoc
class AnalysisRule {
  /// The unique ID for the associated collaboration.
  final String collaborationId;

  /// The time the analysis rule was created.
  final DateTime createTime;

  /// The name for the analysis rule.
  final String name;

  /// A policy that describes the associated data usage limitations.
  final AnalysisRulePolicy policy;

  /// The type of analysis rule.
  final AnalysisRuleType type;

  /// The time the analysis rule was last updated.
  final DateTime updateTime;
  final ConfiguredTableAssociationAnalysisRulePolicy? collaborationPolicy;

  /// The consolidated policy for the analysis rule.
  final ConsolidatedPolicy? consolidatedPolicy;

  AnalysisRule({
    required this.collaborationId,
    required this.createTime,
    required this.name,
    required this.policy,
    required this.type,
    required this.updateTime,
    this.collaborationPolicy,
    this.consolidatedPolicy,
  });

  factory AnalysisRule.fromJson(Map<String, dynamic> json) {
    return AnalysisRule(
      collaborationId: (json['collaborationId'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      name: (json['name'] as String?) ?? '',
      policy: AnalysisRulePolicy.fromJson(
          (json['policy'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      type: AnalysisRuleType.fromString((json['type'] as String?) ?? ''),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      collaborationPolicy: json['collaborationPolicy'] != null
          ? ConfiguredTableAssociationAnalysisRulePolicy.fromJson(
              json['collaborationPolicy'] as Map<String, dynamic>)
          : null,
      consolidatedPolicy: json['consolidatedPolicy'] != null
          ? ConsolidatedPolicy.fromJson(
              json['consolidatedPolicy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final collaborationId = this.collaborationId;
    final createTime = this.createTime;
    final name = this.name;
    final policy = this.policy;
    final type = this.type;
    final updateTime = this.updateTime;
    final collaborationPolicy = this.collaborationPolicy;
    final consolidatedPolicy = this.consolidatedPolicy;
    return {
      'collaborationId': collaborationId,
      'createTime': unixTimestampToJson(createTime),
      'name': name,
      'policy': policy,
      'type': type.value,
      'updateTime': unixTimestampToJson(updateTime),
      if (collaborationPolicy != null)
        'collaborationPolicy': collaborationPolicy,
      if (consolidatedPolicy != null) 'consolidatedPolicy': consolidatedPolicy,
    };
  }
}

/// Controls on the query specifications that can be run on configured table.
///
/// @nodoc
class AnalysisRulePolicy {
  /// Controls on the query specifications that can be run on configured table.
  final AnalysisRulePolicyV1? v1;

  AnalysisRulePolicy({
    this.v1,
  });

  factory AnalysisRulePolicy.fromJson(Map<String, dynamic> json) {
    return AnalysisRulePolicy(
      v1: json['v1'] != null
          ? AnalysisRulePolicyV1.fromJson(json['v1'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final v1 = this.v1;
    return {
      if (v1 != null) 'v1': v1,
    };
  }
}

/// Controls on the analysis specifications that can be run on a configured
/// table.
///
/// @nodoc
class ConsolidatedPolicy {
  /// The consolidated policy version 1.
  final ConsolidatedPolicyV1? v1;

  ConsolidatedPolicy({
    this.v1,
  });

  factory ConsolidatedPolicy.fromJson(Map<String, dynamic> json) {
    return ConsolidatedPolicy(
      v1: json['v1'] != null
          ? ConsolidatedPolicyV1.fromJson(json['v1'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final v1 = this.v1;
    return {
      if (v1 != null) 'v1': v1,
    };
  }
}

/// Controls on the analysis specifications that can be run on a configured
/// table.
///
/// @nodoc
class ConsolidatedPolicyV1 {
  /// The aggregation setting for the consolidated policy.
  final ConsolidatedPolicyAggregation? aggregation;

  /// Custom policy
  final ConsolidatedPolicyCustom? custom;

  /// The list of consolidated policies.
  final ConsolidatedPolicyList? list;

  ConsolidatedPolicyV1({
    this.aggregation,
    this.custom,
    this.list,
  });

  factory ConsolidatedPolicyV1.fromJson(Map<String, dynamic> json) {
    return ConsolidatedPolicyV1(
      aggregation: json['aggregation'] != null
          ? ConsolidatedPolicyAggregation.fromJson(
              json['aggregation'] as Map<String, dynamic>)
          : null,
      custom: json['custom'] != null
          ? ConsolidatedPolicyCustom.fromJson(
              json['custom'] as Map<String, dynamic>)
          : null,
      list: json['list'] != null
          ? ConsolidatedPolicyList.fromJson(
              json['list'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final aggregation = this.aggregation;
    final custom = this.custom;
    final list = this.list;
    return {
      if (aggregation != null) 'aggregation': aggregation,
      if (custom != null) 'custom': custom,
      if (list != null) 'list': list,
    };
  }
}

/// Controls on the analysis specifications that can be run on a configured
/// table.
///
/// @nodoc
class ConsolidatedPolicyList {
  /// The columns to join on.
  final List<String> joinColumns;

  /// The columns in the consolidated policy list.
  final List<String> listColumns;

  /// Additional analyses for the consolidated policy list.
  final AdditionalAnalyses? additionalAnalyses;

  /// The additional analyses allowed by the consolidated policy list.
  final List<String>? allowedAdditionalAnalyses;

  /// The allowed join operators in the consolidated policy list.
  final List<JoinOperator>? allowedJoinOperators;

  /// The allowed result receivers.
  final List<String>? allowedResultReceivers;

  ConsolidatedPolicyList({
    required this.joinColumns,
    required this.listColumns,
    this.additionalAnalyses,
    this.allowedAdditionalAnalyses,
    this.allowedJoinOperators,
    this.allowedResultReceivers,
  });

  factory ConsolidatedPolicyList.fromJson(Map<String, dynamic> json) {
    return ConsolidatedPolicyList(
      joinColumns: ((json['joinColumns'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      listColumns: ((json['listColumns'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      additionalAnalyses: (json['additionalAnalyses'] as String?)
          ?.let(AdditionalAnalyses.fromString),
      allowedAdditionalAnalyses: (json['allowedAdditionalAnalyses'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      allowedJoinOperators: (json['allowedJoinOperators'] as List?)
          ?.nonNulls
          .map((e) => JoinOperator.fromString((e as String)))
          .toList(),
      allowedResultReceivers: (json['allowedResultReceivers'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final joinColumns = this.joinColumns;
    final listColumns = this.listColumns;
    final additionalAnalyses = this.additionalAnalyses;
    final allowedAdditionalAnalyses = this.allowedAdditionalAnalyses;
    final allowedJoinOperators = this.allowedJoinOperators;
    final allowedResultReceivers = this.allowedResultReceivers;
    return {
      'joinColumns': joinColumns,
      'listColumns': listColumns,
      if (additionalAnalyses != null)
        'additionalAnalyses': additionalAnalyses.value,
      if (allowedAdditionalAnalyses != null)
        'allowedAdditionalAnalyses': allowedAdditionalAnalyses,
      if (allowedJoinOperators != null)
        'allowedJoinOperators':
            allowedJoinOperators.map((e) => e.value).toList(),
      if (allowedResultReceivers != null)
        'allowedResultReceivers': allowedResultReceivers,
    };
  }
}

/// Controls on the analysis specifications that can be run on a configured
/// table.
///
/// @nodoc
class ConsolidatedPolicyAggregation {
  /// Aggregate columns in consolidated policy aggregation.
  final List<AggregateColumn> aggregateColumns;

  /// The dimension columns of the consolidated policy aggregation.
  final List<String> dimensionColumns;

  /// The columns to join on.
  final List<String> joinColumns;

  /// The output constraints of the consolidated policy aggregation.
  final List<AggregationConstraint> outputConstraints;

  /// The scalar functions.
  final List<ScalarFunctions> scalarFunctions;

  /// Additional analyses for the consolidated policy aggregation.
  final AdditionalAnalyses? additionalAnalyses;

  /// The additional analyses allowed by the consolidated policy aggregation.
  final List<String>? allowedAdditionalAnalyses;

  /// The allowed join operators.
  final List<JoinOperator>? allowedJoinOperators;

  /// The allowed result receivers.
  final List<String>? allowedResultReceivers;

  /// Join required
  final JoinRequiredOption? joinRequired;

  ConsolidatedPolicyAggregation({
    required this.aggregateColumns,
    required this.dimensionColumns,
    required this.joinColumns,
    required this.outputConstraints,
    required this.scalarFunctions,
    this.additionalAnalyses,
    this.allowedAdditionalAnalyses,
    this.allowedJoinOperators,
    this.allowedResultReceivers,
    this.joinRequired,
  });

  factory ConsolidatedPolicyAggregation.fromJson(Map<String, dynamic> json) {
    return ConsolidatedPolicyAggregation(
      aggregateColumns: ((json['aggregateColumns'] as List?) ?? const [])
          .nonNulls
          .map((e) => AggregateColumn.fromJson(e as Map<String, dynamic>))
          .toList(),
      dimensionColumns: ((json['dimensionColumns'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      joinColumns: ((json['joinColumns'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      outputConstraints: ((json['outputConstraints'] as List?) ?? const [])
          .nonNulls
          .map((e) => AggregationConstraint.fromJson(e as Map<String, dynamic>))
          .toList(),
      scalarFunctions: ((json['scalarFunctions'] as List?) ?? const [])
          .nonNulls
          .map((e) => ScalarFunctions.fromString((e as String)))
          .toList(),
      additionalAnalyses: (json['additionalAnalyses'] as String?)
          ?.let(AdditionalAnalyses.fromString),
      allowedAdditionalAnalyses: (json['allowedAdditionalAnalyses'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      allowedJoinOperators: (json['allowedJoinOperators'] as List?)
          ?.nonNulls
          .map((e) => JoinOperator.fromString((e as String)))
          .toList(),
      allowedResultReceivers: (json['allowedResultReceivers'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      joinRequired:
          (json['joinRequired'] as String?)?.let(JoinRequiredOption.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final aggregateColumns = this.aggregateColumns;
    final dimensionColumns = this.dimensionColumns;
    final joinColumns = this.joinColumns;
    final outputConstraints = this.outputConstraints;
    final scalarFunctions = this.scalarFunctions;
    final additionalAnalyses = this.additionalAnalyses;
    final allowedAdditionalAnalyses = this.allowedAdditionalAnalyses;
    final allowedJoinOperators = this.allowedJoinOperators;
    final allowedResultReceivers = this.allowedResultReceivers;
    final joinRequired = this.joinRequired;
    return {
      'aggregateColumns': aggregateColumns,
      'dimensionColumns': dimensionColumns,
      'joinColumns': joinColumns,
      'outputConstraints': outputConstraints,
      'scalarFunctions': scalarFunctions.map((e) => e.value).toList(),
      if (additionalAnalyses != null)
        'additionalAnalyses': additionalAnalyses.value,
      if (allowedAdditionalAnalyses != null)
        'allowedAdditionalAnalyses': allowedAdditionalAnalyses,
      if (allowedJoinOperators != null)
        'allowedJoinOperators':
            allowedJoinOperators.map((e) => e.value).toList(),
      if (allowedResultReceivers != null)
        'allowedResultReceivers': allowedResultReceivers,
      if (joinRequired != null) 'joinRequired': joinRequired.value,
    };
  }
}

/// Controls on the analysis specifications that can be run on a configured
/// table.
///
/// @nodoc
class ConsolidatedPolicyCustom {
  /// The allowed analyses.
  final List<String> allowedAnalyses;

  /// Additional analyses for the consolidated policy.
  final AdditionalAnalyses? additionalAnalyses;

  /// The additional analyses allowed by the consolidated policy.
  final List<String>? allowedAdditionalAnalyses;

  /// The allowed analysis providers.
  final List<String>? allowedAnalysisProviders;

  /// The allowed result receivers.
  final List<String>? allowedResultReceivers;
  final DifferentialPrivacyConfiguration? differentialPrivacy;

  /// Disallowed output columns
  final List<String>? disallowedOutputColumns;

  ConsolidatedPolicyCustom({
    required this.allowedAnalyses,
    this.additionalAnalyses,
    this.allowedAdditionalAnalyses,
    this.allowedAnalysisProviders,
    this.allowedResultReceivers,
    this.differentialPrivacy,
    this.disallowedOutputColumns,
  });

  factory ConsolidatedPolicyCustom.fromJson(Map<String, dynamic> json) {
    return ConsolidatedPolicyCustom(
      allowedAnalyses: ((json['allowedAnalyses'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      additionalAnalyses: (json['additionalAnalyses'] as String?)
          ?.let(AdditionalAnalyses.fromString),
      allowedAdditionalAnalyses: (json['allowedAdditionalAnalyses'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      allowedAnalysisProviders: (json['allowedAnalysisProviders'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      allowedResultReceivers: (json['allowedResultReceivers'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      differentialPrivacy: json['differentialPrivacy'] != null
          ? DifferentialPrivacyConfiguration.fromJson(
              json['differentialPrivacy'] as Map<String, dynamic>)
          : null,
      disallowedOutputColumns: (json['disallowedOutputColumns'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final allowedAnalyses = this.allowedAnalyses;
    final additionalAnalyses = this.additionalAnalyses;
    final allowedAdditionalAnalyses = this.allowedAdditionalAnalyses;
    final allowedAnalysisProviders = this.allowedAnalysisProviders;
    final allowedResultReceivers = this.allowedResultReceivers;
    final differentialPrivacy = this.differentialPrivacy;
    final disallowedOutputColumns = this.disallowedOutputColumns;
    return {
      'allowedAnalyses': allowedAnalyses,
      if (additionalAnalyses != null)
        'additionalAnalyses': additionalAnalyses.value,
      if (allowedAdditionalAnalyses != null)
        'allowedAdditionalAnalyses': allowedAdditionalAnalyses,
      if (allowedAnalysisProviders != null)
        'allowedAnalysisProviders': allowedAnalysisProviders,
      if (allowedResultReceivers != null)
        'allowedResultReceivers': allowedResultReceivers,
      if (differentialPrivacy != null)
        'differentialPrivacy': differentialPrivacy,
      if (disallowedOutputColumns != null)
        'disallowedOutputColumns': disallowedOutputColumns,
    };
  }
}

/// Controls on the query specifications that can be run on configured table.
///
/// @nodoc
class AnalysisRulePolicyV1 {
  /// Analysis rule type that enables only aggregation queries on a configured
  /// table.
  final AnalysisRuleAggregation? aggregation;

  /// Analysis rule type that enables custom SQL queries on a configured table.
  final AnalysisRuleCustom? custom;

  /// The ID mapping table.
  final AnalysisRuleIdMappingTable? idMappingTable;

  /// Analysis rule type that enables only list queries on a configured table.
  final AnalysisRuleList? list;

  AnalysisRulePolicyV1({
    this.aggregation,
    this.custom,
    this.idMappingTable,
    this.list,
  });

  factory AnalysisRulePolicyV1.fromJson(Map<String, dynamic> json) {
    return AnalysisRulePolicyV1(
      aggregation: json['aggregation'] != null
          ? AnalysisRuleAggregation.fromJson(
              json['aggregation'] as Map<String, dynamic>)
          : null,
      custom: json['custom'] != null
          ? AnalysisRuleCustom.fromJson(json['custom'] as Map<String, dynamic>)
          : null,
      idMappingTable: json['idMappingTable'] != null
          ? AnalysisRuleIdMappingTable.fromJson(
              json['idMappingTable'] as Map<String, dynamic>)
          : null,
      list: json['list'] != null
          ? AnalysisRuleList.fromJson(json['list'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final aggregation = this.aggregation;
    final custom = this.custom;
    final idMappingTable = this.idMappingTable;
    final list = this.list;
    return {
      if (aggregation != null) 'aggregation': aggregation,
      if (custom != null) 'custom': custom,
      if (idMappingTable != null) 'idMappingTable': idMappingTable,
      if (list != null) 'list': list,
    };
  }
}

/// Defines details for the analysis rule ID mapping table.
///
/// @nodoc
class AnalysisRuleIdMappingTable {
  /// The columns that query runners are allowed to use in an INNER JOIN
  /// statement.
  final List<String> joinColumns;

  /// The query constraints of the analysis rule ID mapping table.
  final List<QueryConstraint> queryConstraints;

  /// The columns that query runners are allowed to select, group by, or filter
  /// by.
  final List<String>? dimensionColumns;

  AnalysisRuleIdMappingTable({
    required this.joinColumns,
    required this.queryConstraints,
    this.dimensionColumns,
  });

  factory AnalysisRuleIdMappingTable.fromJson(Map<String, dynamic> json) {
    return AnalysisRuleIdMappingTable(
      joinColumns: ((json['joinColumns'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      queryConstraints: ((json['queryConstraints'] as List?) ?? const [])
          .nonNulls
          .map((e) => QueryConstraint.fromJson(e as Map<String, dynamic>))
          .toList(),
      dimensionColumns: (json['dimensionColumns'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final joinColumns = this.joinColumns;
    final queryConstraints = this.queryConstraints;
    final dimensionColumns = this.dimensionColumns;
    return {
      'joinColumns': joinColumns,
      'queryConstraints': queryConstraints,
      if (dimensionColumns != null) 'dimensionColumns': dimensionColumns,
    };
  }
}

/// Provides any necessary query constraint information.
///
/// @nodoc
class QueryConstraint {
  /// An array of column names that specifies which columns are required in the
  /// JOIN statement.
  final QueryConstraintRequireOverlap? requireOverlap;

  QueryConstraint({
    this.requireOverlap,
  });

  factory QueryConstraint.fromJson(Map<String, dynamic> json) {
    return QueryConstraint(
      requireOverlap: json['requireOverlap'] != null
          ? QueryConstraintRequireOverlap.fromJson(
              json['requireOverlap'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final requireOverlap = this.requireOverlap;
    return {
      if (requireOverlap != null) 'requireOverlap': requireOverlap,
    };
  }
}

/// Provides the name of the columns that are required to overlap.
///
/// @nodoc
class QueryConstraintRequireOverlap {
  /// The columns that are required to overlap.
  final List<String>? columns;

  QueryConstraintRequireOverlap({
    this.columns,
  });

  factory QueryConstraintRequireOverlap.fromJson(Map<String, dynamic> json) {
    return QueryConstraintRequireOverlap(
      columns:
          (json['columns'] as List?)?.nonNulls.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final columns = this.columns;
    return {
      if (columns != null) 'columns': columns,
    };
  }
}

/// A schema is a relation within a collaboration.
///
/// @nodoc
class Schema {
  /// The analysis rule types that are associated with the schema. Currently, only
  /// one entry is present.
  final List<AnalysisRuleType> analysisRuleTypes;

  /// The unique Amazon Resource Name (ARN) for the collaboration that the schema
  /// belongs to.
  final String collaborationArn;

  /// The unique ID for the collaboration that the schema belongs to.
  final String collaborationId;

  /// The columns for the relation that this schema represents.
  final List<Column> columns;

  /// The time at which the schema was created.
  final DateTime createTime;

  /// The unique account ID for the Amazon Web Services account that owns the
  /// schema.
  final String creatorAccountId;

  /// A description for the schema.
  final String description;

  /// A name for the schema. The schema relation is referred to by this name when
  /// queried by a protected query.
  final String name;

  /// The partition keys for the dataset underlying this schema.
  final List<Column> partitionKeys;

  /// Details about the status of the schema. Currently, only one entry is
  /// present.
  final List<SchemaStatusDetail> schemaStatusDetails;

  /// The type of schema.
  final SchemaType type;

  /// The most recent time at which the schema was updated.
  final DateTime updateTime;

  /// The analysis method for the schema.
  ///
  /// <code>DIRECT_QUERY</code> allows SQL queries to be run directly on this
  /// table.
  ///
  /// <code>DIRECT_JOB</code> allows PySpark jobs to be run directly on this
  /// table.
  ///
  /// <code>MULTIPLE</code> allows both SQL queries and PySpark jobs to be run
  /// directly on this table.
  final AnalysisMethod? analysisMethod;

  /// The Amazon Resource Name (ARN) of the schema resource.
  final String? resourceArn;

  /// The schema type properties.
  final SchemaTypeProperties? schemaTypeProperties;

  /// The selected analysis methods for the schema.
  final List<SelectedAnalysisMethod>? selectedAnalysisMethods;

  Schema({
    required this.analysisRuleTypes,
    required this.collaborationArn,
    required this.collaborationId,
    required this.columns,
    required this.createTime,
    required this.creatorAccountId,
    required this.description,
    required this.name,
    required this.partitionKeys,
    required this.schemaStatusDetails,
    required this.type,
    required this.updateTime,
    this.analysisMethod,
    this.resourceArn,
    this.schemaTypeProperties,
    this.selectedAnalysisMethods,
  });

  factory Schema.fromJson(Map<String, dynamic> json) {
    return Schema(
      analysisRuleTypes: ((json['analysisRuleTypes'] as List?) ?? const [])
          .nonNulls
          .map((e) => AnalysisRuleType.fromString((e as String)))
          .toList(),
      collaborationArn: (json['collaborationArn'] as String?) ?? '',
      collaborationId: (json['collaborationId'] as String?) ?? '',
      columns: ((json['columns'] as List?) ?? const [])
          .nonNulls
          .map((e) => Column.fromJson(e as Map<String, dynamic>))
          .toList(),
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      creatorAccountId: (json['creatorAccountId'] as String?) ?? '',
      description: (json['description'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      partitionKeys: ((json['partitionKeys'] as List?) ?? const [])
          .nonNulls
          .map((e) => Column.fromJson(e as Map<String, dynamic>))
          .toList(),
      schemaStatusDetails: ((json['schemaStatusDetails'] as List?) ?? const [])
          .nonNulls
          .map((e) => SchemaStatusDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: SchemaType.fromString((json['type'] as String?) ?? ''),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      analysisMethod:
          (json['analysisMethod'] as String?)?.let(AnalysisMethod.fromString),
      resourceArn: json['resourceArn'] as String?,
      schemaTypeProperties: json['schemaTypeProperties'] != null
          ? SchemaTypeProperties.fromJson(
              json['schemaTypeProperties'] as Map<String, dynamic>)
          : null,
      selectedAnalysisMethods: (json['selectedAnalysisMethods'] as List?)
          ?.nonNulls
          .map((e) => SelectedAnalysisMethod.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final analysisRuleTypes = this.analysisRuleTypes;
    final collaborationArn = this.collaborationArn;
    final collaborationId = this.collaborationId;
    final columns = this.columns;
    final createTime = this.createTime;
    final creatorAccountId = this.creatorAccountId;
    final description = this.description;
    final name = this.name;
    final partitionKeys = this.partitionKeys;
    final schemaStatusDetails = this.schemaStatusDetails;
    final type = this.type;
    final updateTime = this.updateTime;
    final analysisMethod = this.analysisMethod;
    final resourceArn = this.resourceArn;
    final schemaTypeProperties = this.schemaTypeProperties;
    final selectedAnalysisMethods = this.selectedAnalysisMethods;
    return {
      'analysisRuleTypes': analysisRuleTypes.map((e) => e.value).toList(),
      'collaborationArn': collaborationArn,
      'collaborationId': collaborationId,
      'columns': columns,
      'createTime': unixTimestampToJson(createTime),
      'creatorAccountId': creatorAccountId,
      'description': description,
      'name': name,
      'partitionKeys': partitionKeys,
      'schemaStatusDetails': schemaStatusDetails,
      'type': type.value,
      'updateTime': unixTimestampToJson(updateTime),
      if (analysisMethod != null) 'analysisMethod': analysisMethod.value,
      if (resourceArn != null) 'resourceArn': resourceArn,
      if (schemaTypeProperties != null)
        'schemaTypeProperties': schemaTypeProperties,
      if (selectedAnalysisMethods != null)
        'selectedAnalysisMethods':
            selectedAnalysisMethods.map((e) => e.value).toList(),
    };
  }
}

/// Information about the schema type properties.
///
/// @nodoc
class SchemaTypeProperties {
  /// The ID mapping table for the schema type properties.
  final IdMappingTableSchemaTypeProperties? idMappingTable;

  SchemaTypeProperties({
    this.idMappingTable,
  });

  factory SchemaTypeProperties.fromJson(Map<String, dynamic> json) {
    return SchemaTypeProperties(
      idMappingTable: json['idMappingTable'] != null
          ? IdMappingTableSchemaTypeProperties.fromJson(
              json['idMappingTable'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final idMappingTable = this.idMappingTable;
    return {
      if (idMappingTable != null) 'idMappingTable': idMappingTable,
    };
  }
}

/// Additional properties that are specific to the type of the associated
/// schema.
///
/// @nodoc
class IdMappingTableSchemaTypeProperties {
  /// Defines which ID namespace associations are used to create the ID mapping
  /// table.
  final List<IdMappingTableInputSource> idMappingTableInputSource;

  IdMappingTableSchemaTypeProperties({
    required this.idMappingTableInputSource,
  });

  factory IdMappingTableSchemaTypeProperties.fromJson(
      Map<String, dynamic> json) {
    return IdMappingTableSchemaTypeProperties(
      idMappingTableInputSource:
          ((json['idMappingTableInputSource'] as List?) ?? const [])
              .nonNulls
              .map((e) =>
                  IdMappingTableInputSource.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final idMappingTableInputSource = this.idMappingTableInputSource;
    return {
      'idMappingTableInputSource': idMappingTableInputSource,
    };
  }
}

/// Information about the schema status.
///
/// A status of <code>READY</code> means that based on the schema analysis rule,
/// queries of the given analysis rule type are properly configured to run
/// queries on this schema.
///
/// @nodoc
class SchemaStatusDetail {
  /// The type of analysis that can be performed on the schema.
  ///
  /// A schema can have an <code>analysisType</code> of
  /// <code>DIRECT_ANALYSIS</code>,
  /// <code>ADDITIONAL_ANALYSIS_FOR_AUDIENCE_GENERATION</code>, or both.
  final AnalysisType analysisType;

  /// The status of the schema, indicating if it is ready to query.
  final SchemaStatus status;

  /// The analysis rule type for which the schema status has been evaluated.
  final AnalysisRuleType? analysisRuleType;

  /// The configuration details of the schema analysis rule for the given type.
  final List<SchemaConfiguration>? configurations;

  /// The reasons why the schema status is set to its current state.
  final List<SchemaStatusReason>? reasons;

  SchemaStatusDetail({
    required this.analysisType,
    required this.status,
    this.analysisRuleType,
    this.configurations,
    this.reasons,
  });

  factory SchemaStatusDetail.fromJson(Map<String, dynamic> json) {
    return SchemaStatusDetail(
      analysisType:
          AnalysisType.fromString((json['analysisType'] as String?) ?? ''),
      status: SchemaStatus.fromString((json['status'] as String?) ?? ''),
      analysisRuleType: (json['analysisRuleType'] as String?)
          ?.let(AnalysisRuleType.fromString),
      configurations: (json['configurations'] as List?)
          ?.nonNulls
          .map((e) => SchemaConfiguration.fromString((e as String)))
          .toList(),
      reasons: (json['reasons'] as List?)
          ?.nonNulls
          .map((e) => SchemaStatusReason.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final analysisType = this.analysisType;
    final status = this.status;
    final analysisRuleType = this.analysisRuleType;
    final configurations = this.configurations;
    final reasons = this.reasons;
    return {
      'analysisType': analysisType.value,
      'status': status.value,
      if (analysisRuleType != null) 'analysisRuleType': analysisRuleType.value,
      if (configurations != null)
        'configurations': configurations.map((e) => e.value).toList(),
      if (reasons != null) 'reasons': reasons,
    };
  }
}

/// @nodoc
class SchemaStatus {
  static const ready = SchemaStatus._('READY');
  static const notReady = SchemaStatus._('NOT_READY');

  final String value;

  const SchemaStatus._(this.value);

  static const values = [ready, notReady];

  static SchemaStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => SchemaStatus._(value));

  @override
  bool operator ==(other) => other is SchemaStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SchemaConfiguration {
  static const differentialPrivacy =
      SchemaConfiguration._('DIFFERENTIAL_PRIVACY');

  final String value;

  const SchemaConfiguration._(this.value);

  static const values = [differentialPrivacy];

  static SchemaConfiguration fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SchemaConfiguration._(value));

  @override
  bool operator ==(other) =>
      other is SchemaConfiguration && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A reason why the schema status is set to its current value.
///
/// @nodoc
class SchemaStatusReason {
  /// The schema status reason code.
  final SchemaStatusReasonCode code;

  /// An explanation of the schema status reason code.
  final String message;

  SchemaStatusReason({
    required this.code,
    required this.message,
  });

  factory SchemaStatusReason.fromJson(Map<String, dynamic> json) {
    return SchemaStatusReason(
      code: SchemaStatusReasonCode.fromString((json['code'] as String?) ?? ''),
      message: (json['message'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      'code': code.value,
      'message': message,
    };
  }
}

/// @nodoc
class SchemaStatusReasonCode {
  static const analysisRuleMissing =
      SchemaStatusReasonCode._('ANALYSIS_RULE_MISSING');
  static const analysisTemplatesNotConfigured =
      SchemaStatusReasonCode._('ANALYSIS_TEMPLATES_NOT_CONFIGURED');
  static const analysisProvidersNotConfigured =
      SchemaStatusReasonCode._('ANALYSIS_PROVIDERS_NOT_CONFIGURED');
  static const differentialPrivacyPolicyNotConfigured =
      SchemaStatusReasonCode._('DIFFERENTIAL_PRIVACY_POLICY_NOT_CONFIGURED');
  static const idMappingTableNotPopulated =
      SchemaStatusReasonCode._('ID_MAPPING_TABLE_NOT_POPULATED');
  static const collaborationAnalysisRuleNotConfigured =
      SchemaStatusReasonCode._('COLLABORATION_ANALYSIS_RULE_NOT_CONFIGURED');
  static const additionalAnalysesNotConfigured =
      SchemaStatusReasonCode._('ADDITIONAL_ANALYSES_NOT_CONFIGURED');
  static const resultReceiversNotConfigured =
      SchemaStatusReasonCode._('RESULT_RECEIVERS_NOT_CONFIGURED');
  static const additionalAnalysesNotAllowed =
      SchemaStatusReasonCode._('ADDITIONAL_ANALYSES_NOT_ALLOWED');
  static const resultReceiversNotAllowed =
      SchemaStatusReasonCode._('RESULT_RECEIVERS_NOT_ALLOWED');
  static const analysisRuleTypesNotCompatible =
      SchemaStatusReasonCode._('ANALYSIS_RULE_TYPES_NOT_COMPATIBLE');

  final String value;

  const SchemaStatusReasonCode._(this.value);

  static const values = [
    analysisRuleMissing,
    analysisTemplatesNotConfigured,
    analysisProvidersNotConfigured,
    differentialPrivacyPolicyNotConfigured,
    idMappingTableNotPopulated,
    collaborationAnalysisRuleNotConfigured,
    additionalAnalysesNotConfigured,
    resultReceiversNotConfigured,
    additionalAnalysesNotAllowed,
    resultReceiversNotAllowed,
    analysisRuleTypesNotCompatible
  ];

  static SchemaStatusReasonCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SchemaStatusReasonCode._(value));

  @override
  bool operator ==(other) =>
      other is SchemaStatusReasonCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A column within a schema relation, derived from the underlying table.
///
/// @nodoc
class Column {
  /// The name of the column.
  final String name;

  /// The type of the column.
  final String type;

  Column({
    required this.name,
    required this.type,
  });

  factory Column.fromJson(Map<String, dynamic> json) {
    return Column(
      name: (json['name'] as String?) ?? '',
      type: (json['type'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    return {
      'name': name,
      'type': type,
    };
  }
}

/// An array that specifies the information for a collaboration's privacy budget
/// template.
///
/// @nodoc
class CollaborationPrivacyBudgetTemplate {
  /// The ARN of the collaboration privacy budget template.
  final String arn;

  /// How often the privacy budget refreshes.
  /// <important>
  /// If you plan to regularly bring new data into the collaboration, use
  /// <code>CALENDAR_MONTH</code> to automatically get a new privacy budget for
  /// the collaboration every calendar month. Choosing this option allows
  /// arbitrary amounts of information to be revealed about rows of the data when
  /// repeatedly queried across refreshes. Avoid choosing this if the same rows
  /// will be repeatedly queried between privacy budget refreshes.
  /// </important>
  final PrivacyBudgetTemplateAutoRefresh autoRefresh;

  /// The ARN of the collaboration that includes this collaboration privacy budget
  /// template.
  final String collaborationArn;

  /// The unique identifier of the collaboration that includes this collaboration
  /// privacy budget template.
  final String collaborationId;

  /// The time at which the collaboration privacy budget template was created.
  final DateTime createTime;

  /// The unique identifier of the account that created this collaboration privacy
  /// budget template.
  final String creatorAccountId;

  /// The unique identifier of the collaboration privacy budget template.
  final String id;

  /// Specifies the epsilon and noise parameters for the privacy budget template.
  final PrivacyBudgetTemplateParametersOutput parameters;

  /// The type of privacy budget template.
  final PrivacyBudgetType privacyBudgetType;

  /// The most recent time at which the collaboration privacy budget template was
  /// updated.
  final DateTime updateTime;

  CollaborationPrivacyBudgetTemplate({
    required this.arn,
    required this.autoRefresh,
    required this.collaborationArn,
    required this.collaborationId,
    required this.createTime,
    required this.creatorAccountId,
    required this.id,
    required this.parameters,
    required this.privacyBudgetType,
    required this.updateTime,
  });

  factory CollaborationPrivacyBudgetTemplate.fromJson(
      Map<String, dynamic> json) {
    return CollaborationPrivacyBudgetTemplate(
      arn: (json['arn'] as String?) ?? '',
      autoRefresh: PrivacyBudgetTemplateAutoRefresh.fromString(
          (json['autoRefresh'] as String?) ?? ''),
      collaborationArn: (json['collaborationArn'] as String?) ?? '',
      collaborationId: (json['collaborationId'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      creatorAccountId: (json['creatorAccountId'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      parameters: PrivacyBudgetTemplateParametersOutput.fromJson(
          (json['parameters'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      privacyBudgetType: PrivacyBudgetType.fromString(
          (json['privacyBudgetType'] as String?) ?? ''),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final autoRefresh = this.autoRefresh;
    final collaborationArn = this.collaborationArn;
    final collaborationId = this.collaborationId;
    final createTime = this.createTime;
    final creatorAccountId = this.creatorAccountId;
    final id = this.id;
    final parameters = this.parameters;
    final privacyBudgetType = this.privacyBudgetType;
    final updateTime = this.updateTime;
    return {
      'arn': arn,
      'autoRefresh': autoRefresh.value,
      'collaborationArn': collaborationArn,
      'collaborationId': collaborationId,
      'createTime': unixTimestampToJson(createTime),
      'creatorAccountId': creatorAccountId,
      'id': id,
      'parameters': parameters,
      'privacyBudgetType': privacyBudgetType.value,
      'updateTime': unixTimestampToJson(updateTime),
    };
  }
}

/// Defines details for the collaboration ID namespace association.
///
/// @nodoc
class CollaborationIdNamespaceAssociation {
  /// The Amazon Resource Name (ARN) of the collaboration ID namespace
  /// association.
  final String arn;

  /// The Amazon Resource Name (ARN) of the collaboration that contains the
  /// collaboration ID namespace association.
  final String collaborationArn;

  /// The unique identifier of the collaboration that contains the collaboration
  /// ID namespace association.
  final String collaborationId;

  /// The time at which the collaboration ID namespace association was created.
  final DateTime createTime;

  /// The unique identifier of the Amazon Web Services account that created the
  /// collaboration ID namespace association.
  final String creatorAccountId;

  /// The unique identifier of the collaboration ID namespace association.
  final String id;

  /// The input reference configuration that's necessary to create the
  /// collaboration ID namespace association.
  final IdNamespaceAssociationInputReferenceConfig inputReferenceConfig;

  /// The input reference properties that are needed to create the collaboration
  /// ID namespace association.
  final IdNamespaceAssociationInputReferenceProperties inputReferenceProperties;

  /// The name of the collaboration ID namespace association.
  final String name;

  /// The most recent time at which the collaboration ID namespace was updated.
  final DateTime updateTime;

  /// The description of the collaboration ID namespace association.
  final String? description;
  final IdMappingConfig? idMappingConfig;

  CollaborationIdNamespaceAssociation({
    required this.arn,
    required this.collaborationArn,
    required this.collaborationId,
    required this.createTime,
    required this.creatorAccountId,
    required this.id,
    required this.inputReferenceConfig,
    required this.inputReferenceProperties,
    required this.name,
    required this.updateTime,
    this.description,
    this.idMappingConfig,
  });

  factory CollaborationIdNamespaceAssociation.fromJson(
      Map<String, dynamic> json) {
    return CollaborationIdNamespaceAssociation(
      arn: (json['arn'] as String?) ?? '',
      collaborationArn: (json['collaborationArn'] as String?) ?? '',
      collaborationId: (json['collaborationId'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      creatorAccountId: (json['creatorAccountId'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      inputReferenceConfig: IdNamespaceAssociationInputReferenceConfig.fromJson(
          (json['inputReferenceConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      inputReferenceProperties:
          IdNamespaceAssociationInputReferenceProperties.fromJson(
              (json['inputReferenceProperties'] as Map<String, dynamic>?) ??
                  const <String, dynamic>{}),
      name: (json['name'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      description: json['description'] as String?,
      idMappingConfig: json['idMappingConfig'] != null
          ? IdMappingConfig.fromJson(
              json['idMappingConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final collaborationArn = this.collaborationArn;
    final collaborationId = this.collaborationId;
    final createTime = this.createTime;
    final creatorAccountId = this.creatorAccountId;
    final id = this.id;
    final inputReferenceConfig = this.inputReferenceConfig;
    final inputReferenceProperties = this.inputReferenceProperties;
    final name = this.name;
    final updateTime = this.updateTime;
    final description = this.description;
    final idMappingConfig = this.idMappingConfig;
    return {
      'arn': arn,
      'collaborationArn': collaborationArn,
      'collaborationId': collaborationId,
      'createTime': unixTimestampToJson(createTime),
      'creatorAccountId': creatorAccountId,
      'id': id,
      'inputReferenceConfig': inputReferenceConfig,
      'inputReferenceProperties': inputReferenceProperties,
      'name': name,
      'updateTime': unixTimestampToJson(updateTime),
      if (description != null) 'description': description,
      if (idMappingConfig != null) 'idMappingConfig': idMappingConfig,
    };
  }
}

/// The configured audience model association within a collaboration.
///
/// @nodoc
class CollaborationConfiguredAudienceModelAssociation {
  /// The Amazon Resource Name (ARN) of the configured audience model association.
  final String arn;

  /// The unique ARN for the configured audience model's associated collaboration.
  final String collaborationArn;

  /// A unique identifier for the collaboration that the configured audience model
  /// associations belong to. Accepts collaboration ID.
  final String collaborationId;

  /// The Amazon Resource Name (ARN) of the configure audience model.
  final String configuredAudienceModelArn;

  /// The time at which the configured audience model association was created.
  final DateTime createTime;

  /// The identifier used to reference members of the collaboration. Only supports
  /// Amazon Web Services account ID.
  final String creatorAccountId;

  /// The identifier of the configured audience model association.
  final String id;

  /// The name of the configured audience model association.
  final String name;

  /// The most recent time at which the configured audience model association was
  /// updated.
  final DateTime updateTime;

  /// The description of the configured audience model association.
  final String? description;

  CollaborationConfiguredAudienceModelAssociation({
    required this.arn,
    required this.collaborationArn,
    required this.collaborationId,
    required this.configuredAudienceModelArn,
    required this.createTime,
    required this.creatorAccountId,
    required this.id,
    required this.name,
    required this.updateTime,
    this.description,
  });

  factory CollaborationConfiguredAudienceModelAssociation.fromJson(
      Map<String, dynamic> json) {
    return CollaborationConfiguredAudienceModelAssociation(
      arn: (json['arn'] as String?) ?? '',
      collaborationArn: (json['collaborationArn'] as String?) ?? '',
      collaborationId: (json['collaborationId'] as String?) ?? '',
      configuredAudienceModelArn:
          (json['configuredAudienceModelArn'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      creatorAccountId: (json['creatorAccountId'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final collaborationArn = this.collaborationArn;
    final collaborationId = this.collaborationId;
    final configuredAudienceModelArn = this.configuredAudienceModelArn;
    final createTime = this.createTime;
    final creatorAccountId = this.creatorAccountId;
    final id = this.id;
    final name = this.name;
    final updateTime = this.updateTime;
    final description = this.description;
    return {
      'arn': arn,
      'collaborationArn': collaborationArn,
      'collaborationId': collaborationId,
      'configuredAudienceModelArn': configuredAudienceModelArn,
      'createTime': unixTimestampToJson(createTime),
      'creatorAccountId': creatorAccountId,
      'id': id,
      'name': name,
      'updateTime': unixTimestampToJson(updateTime),
      if (description != null) 'description': description,
    };
  }
}

/// The analysis template within a collaboration.
///
/// @nodoc
class CollaborationAnalysisTemplate {
  /// The Amazon Resource Name (ARN) of the analysis template.
  final String arn;

  /// The unique ARN for the analysis template’s associated collaboration.
  final String collaborationArn;

  /// A unique identifier for the collaboration that the analysis templates belong
  /// to. Currently accepts collaboration ID.
  final String collaborationId;

  /// The time that the analysis template within a collaboration was created.
  final DateTime createTime;

  /// The identifier used to reference members of the collaboration. Currently
  /// only supports Amazon Web Services account ID.
  final String creatorAccountId;

  /// The format of the analysis template in the collaboration.
  final AnalysisFormat format;

  /// The identifier of the analysis template.
  final String id;

  /// The name of the analysis template.
  final String name;

  /// The entire schema object.
  final AnalysisSchema schema;

  /// The time that the analysis template in the collaboration was last updated.
  final DateTime updateTime;

  /// The analysis parameters that have been specified in the analysis template.
  final List<AnalysisParameter>? analysisParameters;

  /// The description of the analysis template.
  final String? description;

  /// The configuration that specifies the level of detail in error messages
  /// returned by analyses using this template. When set to <code>DETAILED</code>,
  /// error messages include more information to help troubleshoot issues with
  /// PySpark jobs. Detailed error messages may expose underlying data, including
  /// sensitive information. Recommended for faster troubleshooting in development
  /// and testing environments.
  final ErrorMessageConfiguration? errorMessageConfiguration;

  /// The source of the analysis template within a collaboration.
  final AnalysisSource? source;

  /// The source metadata for the collaboration analysis template.
  final AnalysisSourceMetadata? sourceMetadata;

  /// The synthetic data generation parameters configured for this collaboration
  /// analysis template.
  final SyntheticDataParameters? syntheticDataParameters;

  /// The validations that were performed.
  final List<AnalysisTemplateValidationStatusDetail>? validations;

  CollaborationAnalysisTemplate({
    required this.arn,
    required this.collaborationArn,
    required this.collaborationId,
    required this.createTime,
    required this.creatorAccountId,
    required this.format,
    required this.id,
    required this.name,
    required this.schema,
    required this.updateTime,
    this.analysisParameters,
    this.description,
    this.errorMessageConfiguration,
    this.source,
    this.sourceMetadata,
    this.syntheticDataParameters,
    this.validations,
  });

  factory CollaborationAnalysisTemplate.fromJson(Map<String, dynamic> json) {
    return CollaborationAnalysisTemplate(
      arn: (json['arn'] as String?) ?? '',
      collaborationArn: (json['collaborationArn'] as String?) ?? '',
      collaborationId: (json['collaborationId'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      creatorAccountId: (json['creatorAccountId'] as String?) ?? '',
      format: AnalysisFormat.fromString((json['format'] as String?) ?? ''),
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      schema: AnalysisSchema.fromJson(
          (json['schema'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      analysisParameters: (json['analysisParameters'] as List?)
          ?.nonNulls
          .map((e) => AnalysisParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
      errorMessageConfiguration: json['errorMessageConfiguration'] != null
          ? ErrorMessageConfiguration.fromJson(
              json['errorMessageConfiguration'] as Map<String, dynamic>)
          : null,
      source: json['source'] != null
          ? AnalysisSource.fromJson(json['source'] as Map<String, dynamic>)
          : null,
      sourceMetadata: json['sourceMetadata'] != null
          ? AnalysisSourceMetadata.fromJson(
              json['sourceMetadata'] as Map<String, dynamic>)
          : null,
      syntheticDataParameters: json['syntheticDataParameters'] != null
          ? SyntheticDataParameters.fromJson(
              json['syntheticDataParameters'] as Map<String, dynamic>)
          : null,
      validations: (json['validations'] as List?)
          ?.nonNulls
          .map((e) => AnalysisTemplateValidationStatusDetail.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final collaborationArn = this.collaborationArn;
    final collaborationId = this.collaborationId;
    final createTime = this.createTime;
    final creatorAccountId = this.creatorAccountId;
    final format = this.format;
    final id = this.id;
    final name = this.name;
    final schema = this.schema;
    final updateTime = this.updateTime;
    final analysisParameters = this.analysisParameters;
    final description = this.description;
    final errorMessageConfiguration = this.errorMessageConfiguration;
    final source = this.source;
    final sourceMetadata = this.sourceMetadata;
    final syntheticDataParameters = this.syntheticDataParameters;
    final validations = this.validations;
    return {
      'arn': arn,
      'collaborationArn': collaborationArn,
      'collaborationId': collaborationId,
      'createTime': unixTimestampToJson(createTime),
      'creatorAccountId': creatorAccountId,
      'format': format.value,
      'id': id,
      'name': name,
      'schema': schema,
      'updateTime': unixTimestampToJson(updateTime),
      if (analysisParameters != null) 'analysisParameters': analysisParameters,
      if (description != null) 'description': description,
      if (errorMessageConfiguration != null)
        'errorMessageConfiguration': errorMessageConfiguration,
      if (source != null) 'source': source,
      if (sourceMetadata != null) 'sourceMetadata': sourceMetadata,
      if (syntheticDataParameters != null)
        'syntheticDataParameters': syntheticDataParameters,
      if (validations != null) 'validations': validations,
    };
  }
}

/// A relation within an analysis.
///
/// @nodoc
class AnalysisSchema {
  /// The tables referenced in the analysis schema.
  final List<String>? referencedTables;

  AnalysisSchema({
    this.referencedTables,
  });

  factory AnalysisSchema.fromJson(Map<String, dynamic> json) {
    return AnalysisSchema(
      referencedTables: (json['referencedTables'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final referencedTables = this.referencedTables;
    return {
      if (referencedTables != null) 'referencedTables': referencedTables,
    };
  }
}

/// @nodoc
class AnalysisFormat {
  static const sql = AnalysisFormat._('SQL');
  static const pyspark_1_0 = AnalysisFormat._('PYSPARK_1_0');

  final String value;

  const AnalysisFormat._(this.value);

  static const values = [sql, pyspark_1_0];

  static AnalysisFormat fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AnalysisFormat._(value));

  @override
  bool operator ==(other) => other is AnalysisFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The structure that defines the body of the analysis template.
///
/// @nodoc
class AnalysisSource {
  /// The artifacts of the analysis source.
  final AnalysisTemplateArtifacts? artifacts;

  /// The query text.
  final String? text;

  AnalysisSource({
    this.artifacts,
    this.text,
  });

  factory AnalysisSource.fromJson(Map<String, dynamic> json) {
    return AnalysisSource(
      artifacts: json['artifacts'] != null
          ? AnalysisTemplateArtifacts.fromJson(
              json['artifacts'] as Map<String, dynamic>)
          : null,
      text: json['text'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final artifacts = this.artifacts;
    final text = this.text;
    return {
      if (artifacts != null) 'artifacts': artifacts,
      if (text != null) 'text': text,
    };
  }
}

/// The analysis source metadata.
///
/// @nodoc
class AnalysisSourceMetadata {
  /// The artifacts of the analysis source metadata.
  final AnalysisTemplateArtifactMetadata? artifacts;

  AnalysisSourceMetadata({
    this.artifacts,
  });

  factory AnalysisSourceMetadata.fromJson(Map<String, dynamic> json) {
    return AnalysisSourceMetadata(
      artifacts: json['artifacts'] != null
          ? AnalysisTemplateArtifactMetadata.fromJson(
              json['artifacts'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final artifacts = this.artifacts;
    return {
      if (artifacts != null) 'artifacts': artifacts,
    };
  }
}

/// A structure that defines the level of detail included in error messages
/// returned by PySpark jobs. This configuration allows you to control the
/// verbosity of error messages to help with troubleshooting PySpark jobs while
/// maintaining appropriate security controls.
///
/// @nodoc
class ErrorMessageConfiguration {
  /// The level of detail for error messages returned by the PySpark job. When set
  /// to DETAILED, error messages include more information to help troubleshoot
  /// issues with your PySpark job.
  ///
  /// Because this setting may expose sensitive data, it is recommended for
  /// development and testing environments.
  final ErrorMessageType type;

  ErrorMessageConfiguration({
    required this.type,
  });

  factory ErrorMessageConfiguration.fromJson(Map<String, dynamic> json) {
    return ErrorMessageConfiguration(
      type: ErrorMessageType.fromString((json['type'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    return {
      'type': type.value,
    };
  }
}

/// The parameters that control how synthetic data is generated, including
/// privacy settings, column classifications, and other configuration options
/// that affect the data synthesis process.
///
/// @nodoc
class SyntheticDataParameters {
  /// The machine learning-specific parameters for synthetic data generation.
  final MLSyntheticDataParameters? mlSyntheticDataParameters;

  SyntheticDataParameters({
    this.mlSyntheticDataParameters,
  });

  factory SyntheticDataParameters.fromJson(Map<String, dynamic> json) {
    return SyntheticDataParameters(
      mlSyntheticDataParameters: json['mlSyntheticDataParameters'] != null
          ? MLSyntheticDataParameters.fromJson(
              json['mlSyntheticDataParameters'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final mlSyntheticDataParameters = this.mlSyntheticDataParameters;
    return {
      if (mlSyntheticDataParameters != null)
        'mlSyntheticDataParameters': mlSyntheticDataParameters,
    };
  }
}

/// Parameters that control the generation of synthetic data for machine
/// learning, including privacy settings and column classification details.
///
/// @nodoc
class MLSyntheticDataParameters {
  /// Classification details for data columns that specify how each column should
  /// be treated during synthetic data generation.
  final ColumnClassificationDetails columnClassification;

  /// The epsilon value for differential privacy when generating synthetic data.
  /// Lower values provide stronger privacy guarantees but may reduce data
  /// utility.
  final double epsilon;

  /// The maximum acceptable score for membership inference attack vulnerability.
  /// Synthetic data generation fails if the score for the resulting data exceeds
  /// this threshold.
  final double maxMembershipInferenceAttackScore;

  MLSyntheticDataParameters({
    required this.columnClassification,
    required this.epsilon,
    required this.maxMembershipInferenceAttackScore,
  });

  factory MLSyntheticDataParameters.fromJson(Map<String, dynamic> json) {
    return MLSyntheticDataParameters(
      columnClassification: ColumnClassificationDetails.fromJson(
          (json['columnClassification'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      epsilon: (json['epsilon'] as double?) ?? 0,
      maxMembershipInferenceAttackScore:
          (json['maxMembershipInferenceAttackScore'] as double?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final columnClassification = this.columnClassification;
    final epsilon = this.epsilon;
    final maxMembershipInferenceAttackScore =
        this.maxMembershipInferenceAttackScore;
    return {
      'columnClassification': columnClassification,
      'epsilon': epsilon,
      'maxMembershipInferenceAttackScore': maxMembershipInferenceAttackScore,
    };
  }
}

/// Contains classification information for data columns, including mappings
/// that specify how columns should be handled during synthetic data generation
/// and privacy analysis.
///
/// @nodoc
class ColumnClassificationDetails {
  /// A mapping that defines the classification of data columns for synthetic data
  /// generation and specifies how each column should be handled during the
  /// privacy-preserving data synthesis process.
  final List<SyntheticDataColumnProperties> columnMapping;

  ColumnClassificationDetails({
    required this.columnMapping,
  });

  factory ColumnClassificationDetails.fromJson(Map<String, dynamic> json) {
    return ColumnClassificationDetails(
      columnMapping: ((json['columnMapping'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              SyntheticDataColumnProperties.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final columnMapping = this.columnMapping;
    return {
      'columnMapping': columnMapping,
    };
  }
}

/// Properties that define how a specific data column should be handled during
/// synthetic data generation, including its name, type, and role in predictive
/// modeling.
///
/// @nodoc
class SyntheticDataColumnProperties {
  /// The name of the data column as it appears in the dataset.
  final String columnName;

  /// The data type of the column, which determines how the synthetic data
  /// generation algorithm processes and synthesizes values for this column.
  final SyntheticDataColumnType columnType;

  /// Indicates if this column contains predictive values that should be treated
  /// as target variables in machine learning models. This affects how the
  /// synthetic data generation preserves statistical relationships.
  final bool isPredictiveValue;

  SyntheticDataColumnProperties({
    required this.columnName,
    required this.columnType,
    required this.isPredictiveValue,
  });

  factory SyntheticDataColumnProperties.fromJson(Map<String, dynamic> json) {
    return SyntheticDataColumnProperties(
      columnName: (json['columnName'] as String?) ?? '',
      columnType: SyntheticDataColumnType.fromString(
          (json['columnType'] as String?) ?? ''),
      isPredictiveValue: (json['isPredictiveValue'] as bool?) ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final columnName = this.columnName;
    final columnType = this.columnType;
    final isPredictiveValue = this.isPredictiveValue;
    return {
      'columnName': columnName,
      'columnType': columnType.value,
      'isPredictiveValue': isPredictiveValue,
    };
  }
}

/// @nodoc
class SyntheticDataColumnType {
  static const categorical = SyntheticDataColumnType._('CATEGORICAL');
  static const numerical = SyntheticDataColumnType._('NUMERICAL');

  final String value;

  const SyntheticDataColumnType._(this.value);

  static const values = [categorical, numerical];

  static SyntheticDataColumnType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SyntheticDataColumnType._(value));

  @override
  bool operator ==(other) =>
      other is SyntheticDataColumnType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ErrorMessageType {
  static const detailed = ErrorMessageType._('DETAILED');

  final String value;

  const ErrorMessageType._(this.value);

  static const values = [detailed];

  static ErrorMessageType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ErrorMessageType._(value));

  @override
  bool operator ==(other) => other is ErrorMessageType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The status details of the analysis template validation. Clean Rooms
/// Differential Privacy uses a general-purpose query structure to support
/// complex SQL queries and validates whether an analysis template fits that
/// general-purpose query structure. Validation is performed when analysis
/// templates are created and fetched. Because analysis templates are immutable
/// by design, we recommend that you create analysis templates after you
/// associate the configured tables with their analysis rule to your
/// collaboration.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/clean-rooms/latest/userguide/analysis-rules-custom.html#custom-diff-privacy">https://docs.aws.amazon.com/clean-rooms/latest/userguide/analysis-rules-custom.html#custom-diff-privacy</a>.
///
/// @nodoc
class AnalysisTemplateValidationStatusDetail {
  /// The status of the validation.
  final AnalysisTemplateValidationStatus status;

  /// The type of validation that was performed.
  final AnalysisTemplateValidationType type;

  /// The reasons for the validation results.
  final List<AnalysisTemplateValidationStatusReason>? reasons;

  AnalysisTemplateValidationStatusDetail({
    required this.status,
    required this.type,
    this.reasons,
  });

  factory AnalysisTemplateValidationStatusDetail.fromJson(
      Map<String, dynamic> json) {
    return AnalysisTemplateValidationStatusDetail(
      status: AnalysisTemplateValidationStatus.fromString(
          (json['status'] as String?) ?? ''),
      type: AnalysisTemplateValidationType.fromString(
          (json['type'] as String?) ?? ''),
      reasons: (json['reasons'] as List?)
          ?.nonNulls
          .map((e) => AnalysisTemplateValidationStatusReason.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final type = this.type;
    final reasons = this.reasons;
    return {
      'status': status.value,
      'type': type.value,
      if (reasons != null) 'reasons': reasons,
    };
  }
}

/// @nodoc
class AnalysisTemplateValidationType {
  static const differentialPrivacy =
      AnalysisTemplateValidationType._('DIFFERENTIAL_PRIVACY');

  final String value;

  const AnalysisTemplateValidationType._(this.value);

  static const values = [differentialPrivacy];

  static AnalysisTemplateValidationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AnalysisTemplateValidationType._(value));

  @override
  bool operator ==(other) =>
      other is AnalysisTemplateValidationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AnalysisTemplateValidationStatus {
  static const valid = AnalysisTemplateValidationStatus._('VALID');
  static const invalid = AnalysisTemplateValidationStatus._('INVALID');
  static const unableToValidate =
      AnalysisTemplateValidationStatus._('UNABLE_TO_VALIDATE');

  final String value;

  const AnalysisTemplateValidationStatus._(this.value);

  static const values = [valid, invalid, unableToValidate];

  static AnalysisTemplateValidationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AnalysisTemplateValidationStatus._(value));

  @override
  bool operator ==(other) =>
      other is AnalysisTemplateValidationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The reasons for the validation results.
///
/// @nodoc
class AnalysisTemplateValidationStatusReason {
  /// The validation message.
  final String message;

  AnalysisTemplateValidationStatusReason({
    required this.message,
  });

  factory AnalysisTemplateValidationStatusReason.fromJson(
      Map<String, dynamic> json) {
    return AnalysisTemplateValidationStatusReason(
      message: (json['message'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      'message': message,
    };
  }
}

/// Optional. The member who can query can provide this placeholder for a
/// literal data value in an analysis template.
///
/// @nodoc
class AnalysisParameter {
  /// The name of the parameter. The name must use only alphanumeric or underscore
  /// (_) characters.
  final String name;

  /// The type of parameter.
  final ParameterType type;

  /// Optional. The default value that is applied in the analysis template. The
  /// member who can query can override this value in the query editor.
  final String? defaultValue;

  AnalysisParameter({
    required this.name,
    required this.type,
    this.defaultValue,
  });

  factory AnalysisParameter.fromJson(Map<String, dynamic> json) {
    return AnalysisParameter(
      name: (json['name'] as String?) ?? '',
      type: ParameterType.fromString((json['type'] as String?) ?? ''),
      defaultValue: json['defaultValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    final defaultValue = this.defaultValue;
    return {
      'name': name,
      'type': type.value,
      if (defaultValue != null) 'defaultValue': defaultValue,
    };
  }
}

/// @nodoc
class ParameterType {
  static const smallint = ParameterType._('SMALLINT');
  static const integer = ParameterType._('INTEGER');
  static const bigint = ParameterType._('BIGINT');
  static const decimal = ParameterType._('DECIMAL');
  static const real = ParameterType._('REAL');
  static const doublePrecision = ParameterType._('DOUBLE_PRECISION');
  static const boolean = ParameterType._('BOOLEAN');
  static const char = ParameterType._('CHAR');
  static const varchar = ParameterType._('VARCHAR');
  static const date = ParameterType._('DATE');
  static const timestamp = ParameterType._('TIMESTAMP');
  static const timestamptz = ParameterType._('TIMESTAMPTZ');
  static const time = ParameterType._('TIME');
  static const timetz = ParameterType._('TIMETZ');
  static const varbyte = ParameterType._('VARBYTE');
  static const binary = ParameterType._('BINARY');
  static const byte = ParameterType._('BYTE');
  static const character = ParameterType._('CHARACTER');
  static const $double = ParameterType._('DOUBLE');
  static const float = ParameterType._('FLOAT');
  static const $int = ParameterType._('INT');
  static const long = ParameterType._('LONG');
  static const numeric = ParameterType._('NUMERIC');
  static const short = ParameterType._('SHORT');
  static const string = ParameterType._('STRING');
  static const timestampLtz = ParameterType._('TIMESTAMP_LTZ');
  static const timestampNtz = ParameterType._('TIMESTAMP_NTZ');
  static const tinyint = ParameterType._('TINYINT');

  final String value;

  const ParameterType._(this.value);

  static const values = [
    smallint,
    integer,
    bigint,
    decimal,
    real,
    doublePrecision,
    boolean,
    char,
    varchar,
    date,
    timestamp,
    timestamptz,
    time,
    timetz,
    varbyte,
    binary,
    byte,
    character,
    $double,
    float,
    $int,
    long,
    numeric,
    short,
    string,
    timestampLtz,
    timestampNtz,
    tinyint
  ];

  static ParameterType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ParameterType._(value));

  @override
  bool operator ==(other) => other is ParameterType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The analysis template artifact metadata.
///
/// @nodoc
class AnalysisTemplateArtifactMetadata {
  /// The hash of the entry point for the analysis template artifact metadata.
  final Hash entryPointHash;

  /// Additional artifact hashes for the analysis template.
  final List<Hash>? additionalArtifactHashes;

  AnalysisTemplateArtifactMetadata({
    required this.entryPointHash,
    this.additionalArtifactHashes,
  });

  factory AnalysisTemplateArtifactMetadata.fromJson(Map<String, dynamic> json) {
    return AnalysisTemplateArtifactMetadata(
      entryPointHash: Hash.fromJson(
          (json['entryPointHash'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      additionalArtifactHashes: (json['additionalArtifactHashes'] as List?)
          ?.nonNulls
          .map((e) => Hash.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final entryPointHash = this.entryPointHash;
    final additionalArtifactHashes = this.additionalArtifactHashes;
    return {
      'entryPointHash': entryPointHash,
      if (additionalArtifactHashes != null)
        'additionalArtifactHashes': additionalArtifactHashes,
    };
  }
}

/// Hash
///
/// @nodoc
class Hash {
  /// The SHA-256 hash value.
  final String? sha256;

  Hash({
    this.sha256,
  });

  factory Hash.fromJson(Map<String, dynamic> json) {
    return Hash(
      sha256: json['sha256'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sha256 = this.sha256;
    return {
      if (sha256 != null) 'sha256': sha256,
    };
  }
}

/// The analysis template artifacts.
///
/// @nodoc
class AnalysisTemplateArtifacts {
  /// The entry point for the analysis template artifacts.
  final AnalysisTemplateArtifact entryPoint;

  /// The role ARN for the analysis template artifacts.
  final String roleArn;

  /// Additional artifacts for the analysis template.
  final List<AnalysisTemplateArtifact>? additionalArtifacts;

  AnalysisTemplateArtifacts({
    required this.entryPoint,
    required this.roleArn,
    this.additionalArtifacts,
  });

  factory AnalysisTemplateArtifacts.fromJson(Map<String, dynamic> json) {
    return AnalysisTemplateArtifacts(
      entryPoint: AnalysisTemplateArtifact.fromJson(
          (json['entryPoint'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      roleArn: (json['roleArn'] as String?) ?? '',
      additionalArtifacts: (json['additionalArtifacts'] as List?)
          ?.nonNulls
          .map((e) =>
              AnalysisTemplateArtifact.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final entryPoint = this.entryPoint;
    final roleArn = this.roleArn;
    final additionalArtifacts = this.additionalArtifacts;
    return {
      'entryPoint': entryPoint,
      'roleArn': roleArn,
      if (additionalArtifacts != null)
        'additionalArtifacts': additionalArtifacts,
    };
  }
}

/// The analysis template artifact.
///
/// @nodoc
class AnalysisTemplateArtifact {
  /// The artifact location.
  final S3Location location;

  AnalysisTemplateArtifact({
    required this.location,
  });

  factory AnalysisTemplateArtifact.fromJson(Map<String, dynamic> json) {
    return AnalysisTemplateArtifact(
      location: S3Location.fromJson(
          (json['location'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final location = this.location;
    return {
      'location': location,
    };
  }
}

/// The S3 location.
///
/// @nodoc
class S3Location {
  /// The bucket name.
  final String bucket;

  /// The object key.
  final String key;

  S3Location({
    required this.bucket,
    required this.key,
  });

  factory S3Location.fromJson(Map<String, dynamic> json) {
    return S3Location(
      bucket: (json['bucket'] as String?) ?? '',
      key: (json['key'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final key = this.key;
    return {
      'bucket': bucket,
      'key': key,
    };
  }
}

/// Specifies a change to apply to a collaboration.
///
/// @nodoc
class ChangeInput {
  /// The specification details for the change. The structure depends on the
  /// specification type.
  final ChangeSpecification specification;

  /// The type of specification for the change. Currently supports
  /// <code>MEMBER</code> for member-related changes.
  final ChangeSpecificationType specificationType;

  ChangeInput({
    required this.specification,
    required this.specificationType,
  });

  Map<String, dynamic> toJson() {
    final specification = this.specification;
    final specificationType = this.specificationType;
    return {
      'specification': specification,
      'specificationType': specificationType.value,
    };
  }
}

/// An error that describes why a schema could not be fetched.
///
/// @nodoc
class BatchGetSchemaAnalysisRuleError {
  /// An error code for the error.
  final String code;

  /// A description of why the call failed.
  final String message;

  /// An error name for the error.
  final String name;

  /// The analysis rule type.
  final AnalysisRuleType type;

  BatchGetSchemaAnalysisRuleError({
    required this.code,
    required this.message,
    required this.name,
    required this.type,
  });

  factory BatchGetSchemaAnalysisRuleError.fromJson(Map<String, dynamic> json) {
    return BatchGetSchemaAnalysisRuleError(
      code: (json['code'] as String?) ?? '',
      message: (json['message'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      type: AnalysisRuleType.fromString((json['type'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    final name = this.name;
    final type = this.type;
    return {
      'code': code,
      'message': message,
      'name': name,
      'type': type.value,
    };
  }
}

/// Defines the information that's necessary to retrieve an analysis rule
/// schema. Schema analysis rules are uniquely identiﬁed by a combination of the
/// schema name and the analysis rule type for a given collaboration.
///
/// @nodoc
class SchemaAnalysisRuleRequest {
  /// The name of the analysis rule schema that you are requesting.
  final String name;

  /// The type of analysis rule schema that you are requesting.
  final AnalysisRuleType type;

  SchemaAnalysisRuleRequest({
    required this.name,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    return {
      'name': name,
      'type': type.value,
    };
  }
}

/// An error describing why a schema could not be fetched.
///
/// @nodoc
class BatchGetSchemaError {
  /// An error code for the error.
  final String code;

  /// An error message for the error.
  final String message;

  /// An error name for the error.
  final String name;

  BatchGetSchemaError({
    required this.code,
    required this.message,
    required this.name,
  });

  factory BatchGetSchemaError.fromJson(Map<String, dynamic> json) {
    return BatchGetSchemaError(
      code: (json['code'] as String?) ?? '',
      message: (json['message'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    final name = this.name;
    return {
      'code': code,
      'message': message,
      'name': name,
    };
  }
}

/// Details of errors thrown by the call to retrieve multiple analysis templates
/// within a collaboration by their identifiers.
///
/// @nodoc
class BatchGetCollaborationAnalysisTemplateError {
  /// The Amazon Resource Name (ARN) of the analysis template.
  final String arn;

  /// An error code for the error.
  final String code;

  /// A description of why the call failed.
  final String message;

  BatchGetCollaborationAnalysisTemplateError({
    required this.arn,
    required this.code,
    required this.message,
  });

  factory BatchGetCollaborationAnalysisTemplateError.fromJson(
      Map<String, dynamic> json) {
    return BatchGetCollaborationAnalysisTemplateError(
      arn: (json['arn'] as String?) ?? '',
      code: (json['code'] as String?) ?? '',
      message: (json['message'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final code = this.code;
    final message = this.message;
    return {
      'arn': arn,
      'code': code,
      'message': message,
    };
  }
}

/// The metadata of the collaboration.
///
/// @nodoc
class CollaborationSummary {
  /// The ARN of the collaboration.
  final String arn;

  /// The time when the collaboration was created.
  final DateTime createTime;

  /// The identifier used to reference members of the collaboration. Currently
  /// only supports Amazon Web Services account ID.
  final String creatorAccountId;

  /// The display name of the collaboration creator.
  final String creatorDisplayName;

  /// The identifier for the collaboration.
  final String id;

  /// The status of a member in a collaboration.
  final MemberStatus memberStatus;

  /// A human-readable identifier provided by the collaboration owner. Display
  /// names are not unique.
  final String name;

  /// The time the collaboration metadata was last updated.
  final DateTime updateTime;

  /// The analytics engine.
  /// <note>
  /// After July 16, 2025, the <code>CLEAN_ROOMS_SQL</code> parameter will no
  /// longer be available.
  /// </note>
  final AnalyticsEngine? analyticsEngine;

  /// The ARN of a member in a collaboration.
  final String? membershipArn;

  /// The identifier of a member in a collaboration.
  final String? membershipId;

  CollaborationSummary({
    required this.arn,
    required this.createTime,
    required this.creatorAccountId,
    required this.creatorDisplayName,
    required this.id,
    required this.memberStatus,
    required this.name,
    required this.updateTime,
    this.analyticsEngine,
    this.membershipArn,
    this.membershipId,
  });

  factory CollaborationSummary.fromJson(Map<String, dynamic> json) {
    return CollaborationSummary(
      arn: (json['arn'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      creatorAccountId: (json['creatorAccountId'] as String?) ?? '',
      creatorDisplayName: (json['creatorDisplayName'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      memberStatus:
          MemberStatus.fromString((json['memberStatus'] as String?) ?? ''),
      name: (json['name'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      analyticsEngine:
          (json['analyticsEngine'] as String?)?.let(AnalyticsEngine.fromString),
      membershipArn: json['membershipArn'] as String?,
      membershipId: json['membershipId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createTime = this.createTime;
    final creatorAccountId = this.creatorAccountId;
    final creatorDisplayName = this.creatorDisplayName;
    final id = this.id;
    final memberStatus = this.memberStatus;
    final name = this.name;
    final updateTime = this.updateTime;
    final analyticsEngine = this.analyticsEngine;
    final membershipArn = this.membershipArn;
    final membershipId = this.membershipId;
    return {
      'arn': arn,
      'createTime': unixTimestampToJson(createTime),
      'creatorAccountId': creatorAccountId,
      'creatorDisplayName': creatorDisplayName,
      'id': id,
      'memberStatus': memberStatus.value,
      'name': name,
      'updateTime': unixTimestampToJson(updateTime),
      if (analyticsEngine != null) 'analyticsEngine': analyticsEngine.value,
      if (membershipArn != null) 'membershipArn': membershipArn,
      if (membershipId != null) 'membershipId': membershipId,
    };
  }
}

/// @nodoc
class AnalyticsEngine {
  static const spark = AnalyticsEngine._('SPARK');
  static const cleanRoomsSql = AnalyticsEngine._('CLEAN_ROOMS_SQL');

  final String value;

  const AnalyticsEngine._(this.value);

  static const values = [spark, cleanRoomsSql];

  static AnalyticsEngine fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AnalyticsEngine._(value));

  @override
  bool operator ==(other) => other is AnalyticsEngine && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class FilterableMemberStatus {
  static const invited = FilterableMemberStatus._('INVITED');
  static const active = FilterableMemberStatus._('ACTIVE');

  final String value;

  const FilterableMemberStatus._(this.value);

  static const values = [invited, active];

  static FilterableMemberStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FilterableMemberStatus._(value));

  @override
  bool operator ==(other) =>
      other is FilterableMemberStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The multi-party data share environment. The collaboration contains metadata
/// about its purpose and participants.
///
/// @nodoc
class Collaboration {
  /// The unique ARN for the collaboration.
  final String arn;

  /// The time when the collaboration was created.
  final DateTime createTime;

  /// The identifier used to reference members of the collaboration. Currently
  /// only supports Amazon Web Services account ID.
  final String creatorAccountId;

  /// A display name of the collaboration creator.
  final String creatorDisplayName;

  /// The unique ID for the collaboration.
  final String id;

  /// The status of a member in a collaboration.
  final MemberStatus memberStatus;

  /// A human-readable identifier provided by the collaboration owner. Display
  /// names are not unique.
  final String name;

  /// An indicator as to whether query logging has been enabled or disabled for
  /// the collaboration.
  ///
  /// When <code>ENABLED</code>, Clean Rooms logs details about queries run within
  /// this collaboration and those logs can be viewed in Amazon CloudWatch Logs.
  /// The default value is <code>DISABLED</code>.
  final CollaborationQueryLogStatus queryLogStatus;

  /// The time the collaboration metadata was last updated.
  final DateTime updateTime;

  /// The Amazon Web Services Regions where collaboration query results can be
  /// stored. Returns the list of Region identifiers that were specified when the
  /// collaboration was created. This list is used to enforce regional storage
  /// policies and compliance requirements.
  final List<SupportedS3Region>? allowedResultRegions;

  /// The analytics engine for the collaboration.
  /// <note>
  /// After July 16, 2025, the <code>CLEAN_ROOMS_SQL</code> parameter will no
  /// longer be available.
  /// </note>
  final AnalyticsEngine? analyticsEngine;

  /// The types of change requests that are automatically approved for this
  /// collaboration.
  final List<AutoApprovedChangeType>? autoApprovedChangeTypes;

  /// The settings for client-side encryption for cryptographic computing.
  final DataEncryptionMetadata? dataEncryptionMetadata;

  /// A description of the collaboration provided by the collaboration owner.
  final String? description;

  /// An indicator as to whether metrics are enabled for the collaboration.
  ///
  /// When <code>true</code>, collaboration members can opt in to Amazon
  /// CloudWatch metrics for their membership queries.
  final bool? isMetricsEnabled;

  /// An indicator as to whether job logging has been enabled or disabled for the
  /// collaboration.
  ///
  /// When <code>ENABLED</code>, Clean Rooms logs details about jobs run within
  /// this collaboration and those logs can be viewed in Amazon CloudWatch Logs.
  /// The default value is <code>DISABLED</code>.
  final CollaborationJobLogStatus? jobLogStatus;

  /// The unique ARN for your membership within the collaboration.
  final String? membershipArn;

  /// The unique ID for your membership within the collaboration.
  final String? membershipId;

  Collaboration({
    required this.arn,
    required this.createTime,
    required this.creatorAccountId,
    required this.creatorDisplayName,
    required this.id,
    required this.memberStatus,
    required this.name,
    required this.queryLogStatus,
    required this.updateTime,
    this.allowedResultRegions,
    this.analyticsEngine,
    this.autoApprovedChangeTypes,
    this.dataEncryptionMetadata,
    this.description,
    this.isMetricsEnabled,
    this.jobLogStatus,
    this.membershipArn,
    this.membershipId,
  });

  factory Collaboration.fromJson(Map<String, dynamic> json) {
    return Collaboration(
      arn: (json['arn'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      creatorAccountId: (json['creatorAccountId'] as String?) ?? '',
      creatorDisplayName: (json['creatorDisplayName'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      memberStatus:
          MemberStatus.fromString((json['memberStatus'] as String?) ?? ''),
      name: (json['name'] as String?) ?? '',
      queryLogStatus: CollaborationQueryLogStatus.fromString(
          (json['queryLogStatus'] as String?) ?? ''),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      allowedResultRegions: (json['allowedResultRegions'] as List?)
          ?.nonNulls
          .map((e) => SupportedS3Region.fromString((e as String)))
          .toList(),
      analyticsEngine:
          (json['analyticsEngine'] as String?)?.let(AnalyticsEngine.fromString),
      autoApprovedChangeTypes: (json['autoApprovedChangeTypes'] as List?)
          ?.nonNulls
          .map((e) => AutoApprovedChangeType.fromString((e as String)))
          .toList(),
      dataEncryptionMetadata: json['dataEncryptionMetadata'] != null
          ? DataEncryptionMetadata.fromJson(
              json['dataEncryptionMetadata'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      isMetricsEnabled: json['isMetricsEnabled'] as bool?,
      jobLogStatus: (json['jobLogStatus'] as String?)
          ?.let(CollaborationJobLogStatus.fromString),
      membershipArn: json['membershipArn'] as String?,
      membershipId: json['membershipId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createTime = this.createTime;
    final creatorAccountId = this.creatorAccountId;
    final creatorDisplayName = this.creatorDisplayName;
    final id = this.id;
    final memberStatus = this.memberStatus;
    final name = this.name;
    final queryLogStatus = this.queryLogStatus;
    final updateTime = this.updateTime;
    final allowedResultRegions = this.allowedResultRegions;
    final analyticsEngine = this.analyticsEngine;
    final autoApprovedChangeTypes = this.autoApprovedChangeTypes;
    final dataEncryptionMetadata = this.dataEncryptionMetadata;
    final description = this.description;
    final isMetricsEnabled = this.isMetricsEnabled;
    final jobLogStatus = this.jobLogStatus;
    final membershipArn = this.membershipArn;
    final membershipId = this.membershipId;
    return {
      'arn': arn,
      'createTime': unixTimestampToJson(createTime),
      'creatorAccountId': creatorAccountId,
      'creatorDisplayName': creatorDisplayName,
      'id': id,
      'memberStatus': memberStatus.value,
      'name': name,
      'queryLogStatus': queryLogStatus.value,
      'updateTime': unixTimestampToJson(updateTime),
      if (allowedResultRegions != null)
        'allowedResultRegions':
            allowedResultRegions.map((e) => e.value).toList(),
      if (analyticsEngine != null) 'analyticsEngine': analyticsEngine.value,
      if (autoApprovedChangeTypes != null)
        'autoApprovedChangeTypes':
            autoApprovedChangeTypes.map((e) => e.value).toList(),
      if (dataEncryptionMetadata != null)
        'dataEncryptionMetadata': dataEncryptionMetadata,
      if (description != null) 'description': description,
      if (isMetricsEnabled != null) 'isMetricsEnabled': isMetricsEnabled,
      if (jobLogStatus != null) 'jobLogStatus': jobLogStatus.value,
      if (membershipArn != null) 'membershipArn': membershipArn,
      if (membershipId != null) 'membershipId': membershipId,
    };
  }
}

/// The settings for client-side encryption for cryptographic computing.
///
/// @nodoc
class DataEncryptionMetadata {
  /// Indicates whether encrypted tables can contain cleartext data
  /// (<code>TRUE</code>) or are to cryptographically process every column
  /// (<code>FALSE</code>).
  final bool allowCleartext;

  /// Indicates whether Fingerprint columns can contain duplicate entries
  /// (<code>TRUE</code>) or are to contain only non-repeated values
  /// (<code>FALSE</code>).
  final bool allowDuplicates;

  /// Indicates whether Fingerprint columns can be joined on any other Fingerprint
  /// column with a different name (<code>TRUE</code>) or can only be joined on
  /// Fingerprint columns of the same name (<code>FALSE</code>).
  final bool allowJoinsOnColumnsWithDifferentNames;

  /// Indicates whether NULL values are to be copied as NULL to encrypted tables
  /// (<code>TRUE</code>) or cryptographically processed (<code>FALSE</code>).
  final bool preserveNulls;

  DataEncryptionMetadata({
    required this.allowCleartext,
    required this.allowDuplicates,
    required this.allowJoinsOnColumnsWithDifferentNames,
    required this.preserveNulls,
  });

  factory DataEncryptionMetadata.fromJson(Map<String, dynamic> json) {
    return DataEncryptionMetadata(
      allowCleartext: (json['allowCleartext'] as bool?) ?? false,
      allowDuplicates: (json['allowDuplicates'] as bool?) ?? false,
      allowJoinsOnColumnsWithDifferentNames:
          (json['allowJoinsOnColumnsWithDifferentNames'] as bool?) ?? false,
      preserveNulls: (json['preserveNulls'] as bool?) ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final allowCleartext = this.allowCleartext;
    final allowDuplicates = this.allowDuplicates;
    final allowJoinsOnColumnsWithDifferentNames =
        this.allowJoinsOnColumnsWithDifferentNames;
    final preserveNulls = this.preserveNulls;
    return {
      'allowCleartext': allowCleartext,
      'allowDuplicates': allowDuplicates,
      'allowJoinsOnColumnsWithDifferentNames':
          allowJoinsOnColumnsWithDifferentNames,
      'preserveNulls': preserveNulls,
    };
  }
}

/// @nodoc
class CollaborationQueryLogStatus {
  static const enabled = CollaborationQueryLogStatus._('ENABLED');
  static const disabled = CollaborationQueryLogStatus._('DISABLED');

  final String value;

  const CollaborationQueryLogStatus._(this.value);

  static const values = [enabled, disabled];

  static CollaborationQueryLogStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CollaborationQueryLogStatus._(value));

  @override
  bool operator ==(other) =>
      other is CollaborationQueryLogStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class CollaborationJobLogStatus {
  static const enabled = CollaborationJobLogStatus._('ENABLED');
  static const disabled = CollaborationJobLogStatus._('DISABLED');

  final String value;

  const CollaborationJobLogStatus._(this.value);

  static const values = [enabled, disabled];

  static CollaborationJobLogStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CollaborationJobLogStatus._(value));

  @override
  bool operator ==(other) =>
      other is CollaborationJobLogStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SupportedS3Region {
  static const usWest_1 = SupportedS3Region._('us-west-1');
  static const usWest_2 = SupportedS3Region._('us-west-2');
  static const usEast_1 = SupportedS3Region._('us-east-1');
  static const usEast_2 = SupportedS3Region._('us-east-2');
  static const afSouth_1 = SupportedS3Region._('af-south-1');
  static const apEast_1 = SupportedS3Region._('ap-east-1');
  static const apEast_2 = SupportedS3Region._('ap-east-2');
  static const apSouth_2 = SupportedS3Region._('ap-south-2');
  static const apSoutheast_1 = SupportedS3Region._('ap-southeast-1');
  static const apSoutheast_2 = SupportedS3Region._('ap-southeast-2');
  static const apSoutheast_3 = SupportedS3Region._('ap-southeast-3');
  static const apSoutheast_5 = SupportedS3Region._('ap-southeast-5');
  static const apSoutheast_4 = SupportedS3Region._('ap-southeast-4');
  static const apSoutheast_7 = SupportedS3Region._('ap-southeast-7');
  static const apSouth_1 = SupportedS3Region._('ap-south-1');
  static const apNortheast_3 = SupportedS3Region._('ap-northeast-3');
  static const apNortheast_1 = SupportedS3Region._('ap-northeast-1');
  static const apNortheast_2 = SupportedS3Region._('ap-northeast-2');
  static const caCentral_1 = SupportedS3Region._('ca-central-1');
  static const caWest_1 = SupportedS3Region._('ca-west-1');
  static const euSouth_1 = SupportedS3Region._('eu-south-1');
  static const euWest_3 = SupportedS3Region._('eu-west-3');
  static const euSouth_2 = SupportedS3Region._('eu-south-2');
  static const euCentral_2 = SupportedS3Region._('eu-central-2');
  static const euCentral_1 = SupportedS3Region._('eu-central-1');
  static const euNorth_1 = SupportedS3Region._('eu-north-1');
  static const euWest_1 = SupportedS3Region._('eu-west-1');
  static const euWest_2 = SupportedS3Region._('eu-west-2');
  static const meSouth_1 = SupportedS3Region._('me-south-1');
  static const meCentral_1 = SupportedS3Region._('me-central-1');
  static const ilCentral_1 = SupportedS3Region._('il-central-1');
  static const saEast_1 = SupportedS3Region._('sa-east-1');
  static const mxCentral_1 = SupportedS3Region._('mx-central-1');

  final String value;

  const SupportedS3Region._(this.value);

  static const values = [
    usWest_1,
    usWest_2,
    usEast_1,
    usEast_2,
    afSouth_1,
    apEast_1,
    apEast_2,
    apSouth_2,
    apSoutheast_1,
    apSoutheast_2,
    apSoutheast_3,
    apSoutheast_5,
    apSoutheast_4,
    apSoutheast_7,
    apSouth_1,
    apNortheast_3,
    apNortheast_1,
    apNortheast_2,
    caCentral_1,
    caWest_1,
    euSouth_1,
    euWest_3,
    euSouth_2,
    euCentral_2,
    euCentral_1,
    euNorth_1,
    euWest_1,
    euWest_2,
    meSouth_1,
    meCentral_1,
    ilCentral_1,
    saEast_1,
    mxCentral_1
  ];

  static SupportedS3Region fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SupportedS3Region._(value));

  @override
  bool operator ==(other) => other is SupportedS3Region && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Basic metadata used to construct a new member.
///
/// @nodoc
class MemberSpecification {
  /// The identifier used to reference members of the collaboration. Currently
  /// only supports Amazon Web Services account ID.
  final String accountId;

  /// The member's display name.
  final String displayName;

  /// The abilities granted to the collaboration member.
  final List<MemberAbility> memberAbilities;

  /// The ML abilities granted to the collaboration member.
  final MLMemberAbilities? mlMemberAbilities;

  /// The collaboration member's payment responsibilities set by the collaboration
  /// creator.
  ///
  /// If the collaboration creator hasn't speciﬁed anyone as the member paying for
  /// query compute costs, then the member who can query is the default payer.
  final PaymentConfiguration? paymentConfiguration;

  MemberSpecification({
    required this.accountId,
    required this.displayName,
    required this.memberAbilities,
    this.mlMemberAbilities,
    this.paymentConfiguration,
  });

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final displayName = this.displayName;
    final memberAbilities = this.memberAbilities;
    final mlMemberAbilities = this.mlMemberAbilities;
    final paymentConfiguration = this.paymentConfiguration;
    return {
      'accountId': accountId,
      'displayName': displayName,
      'memberAbilities': memberAbilities.map((e) => e.value).toList(),
      if (mlMemberAbilities != null) 'mlMemberAbilities': mlMemberAbilities,
      if (paymentConfiguration != null)
        'paymentConfiguration': paymentConfiguration,
    };
  }
}

/// The metadata of the analysis template.
///
/// @nodoc
class AnalysisTemplateSummary {
  /// The Amazon Resource Name (ARN) of the analysis template.
  final String arn;

  /// The unique ARN for the analysis template summary’s associated collaboration.
  final String collaborationArn;

  /// A unique identifier for the collaboration that the analysis template summary
  /// belongs to. Currently accepts collaboration ID.
  final String collaborationId;

  /// The time that the analysis template summary was created.
  final DateTime createTime;

  /// The identifier of the analysis template.
  final String id;

  /// The Amazon Resource Name (ARN) of the member who created the analysis
  /// template.
  final String membershipArn;

  /// The identifier for a membership resource.
  final String membershipId;

  /// The name of the analysis template.
  final String name;

  /// The time that the analysis template summary was last updated.
  final DateTime updateTime;

  /// The description of the analysis template.
  final String? description;

  /// Indicates if this analysis template summary generated synthetic data.
  final bool? isSyntheticData;

  AnalysisTemplateSummary({
    required this.arn,
    required this.collaborationArn,
    required this.collaborationId,
    required this.createTime,
    required this.id,
    required this.membershipArn,
    required this.membershipId,
    required this.name,
    required this.updateTime,
    this.description,
    this.isSyntheticData,
  });

  factory AnalysisTemplateSummary.fromJson(Map<String, dynamic> json) {
    return AnalysisTemplateSummary(
      arn: (json['arn'] as String?) ?? '',
      collaborationArn: (json['collaborationArn'] as String?) ?? '',
      collaborationId: (json['collaborationId'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      id: (json['id'] as String?) ?? '',
      membershipArn: (json['membershipArn'] as String?) ?? '',
      membershipId: (json['membershipId'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      description: json['description'] as String?,
      isSyntheticData: json['isSyntheticData'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final collaborationArn = this.collaborationArn;
    final collaborationId = this.collaborationId;
    final createTime = this.createTime;
    final id = this.id;
    final membershipArn = this.membershipArn;
    final membershipId = this.membershipId;
    final name = this.name;
    final updateTime = this.updateTime;
    final description = this.description;
    final isSyntheticData = this.isSyntheticData;
    return {
      'arn': arn,
      'collaborationArn': collaborationArn,
      'collaborationId': collaborationId,
      'createTime': unixTimestampToJson(createTime),
      'id': id,
      'membershipArn': membershipArn,
      'membershipId': membershipId,
      'name': name,
      'updateTime': unixTimestampToJson(updateTime),
      if (description != null) 'description': description,
      if (isSyntheticData != null) 'isSyntheticData': isSyntheticData,
    };
  }
}

/// The analysis template.
///
/// @nodoc
class AnalysisTemplate {
  /// The Amazon Resource Name (ARN) of the analysis template.
  final String arn;

  /// The unique ARN for the analysis template’s associated collaboration.
  final String collaborationArn;

  /// The unique ID for the associated collaboration of the analysis template.
  final String collaborationId;

  /// The time that the analysis template was created.
  final DateTime createTime;

  /// The format of the analysis template.
  final AnalysisFormat format;

  /// The identifier for the analysis template.
  final String id;

  /// The Amazon Resource Name (ARN) of the member who created the analysis
  /// template.
  final String membershipArn;

  /// The identifier of a member who created the analysis template.
  final String membershipId;

  /// The name of the analysis template.
  final String name;

  /// The entire schema object.
  final AnalysisSchema schema;

  /// The source of the analysis template.
  final AnalysisSource source;

  /// The time that the analysis template was last updated.
  final DateTime updateTime;

  /// The parameters of the analysis template.
  final List<AnalysisParameter>? analysisParameters;

  /// The description of the analysis template.
  final String? description;

  /// The configuration that specifies the level of detail in error messages
  /// returned by analyses using this template. When set to <code>DETAILED</code>,
  /// error messages include more information to help troubleshoot issues with
  /// PySpark jobs. Detailed error messages may expose underlying data, including
  /// sensitive information. Recommended for faster troubleshooting in development
  /// and testing environments.
  final ErrorMessageConfiguration? errorMessageConfiguration;

  /// The source metadata for the analysis template.
  final AnalysisSourceMetadata? sourceMetadata;

  /// The parameters used to generate synthetic data for this analysis template.
  final SyntheticDataParameters? syntheticDataParameters;

  /// Information about the validations performed on the analysis template.
  final List<AnalysisTemplateValidationStatusDetail>? validations;

  AnalysisTemplate({
    required this.arn,
    required this.collaborationArn,
    required this.collaborationId,
    required this.createTime,
    required this.format,
    required this.id,
    required this.membershipArn,
    required this.membershipId,
    required this.name,
    required this.schema,
    required this.source,
    required this.updateTime,
    this.analysisParameters,
    this.description,
    this.errorMessageConfiguration,
    this.sourceMetadata,
    this.syntheticDataParameters,
    this.validations,
  });

  factory AnalysisTemplate.fromJson(Map<String, dynamic> json) {
    return AnalysisTemplate(
      arn: (json['arn'] as String?) ?? '',
      collaborationArn: (json['collaborationArn'] as String?) ?? '',
      collaborationId: (json['collaborationId'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      format: AnalysisFormat.fromString((json['format'] as String?) ?? ''),
      id: (json['id'] as String?) ?? '',
      membershipArn: (json['membershipArn'] as String?) ?? '',
      membershipId: (json['membershipId'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      schema: AnalysisSchema.fromJson(
          (json['schema'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      source: AnalysisSource.fromJson(
          (json['source'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      analysisParameters: (json['analysisParameters'] as List?)
          ?.nonNulls
          .map((e) => AnalysisParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
      errorMessageConfiguration: json['errorMessageConfiguration'] != null
          ? ErrorMessageConfiguration.fromJson(
              json['errorMessageConfiguration'] as Map<String, dynamic>)
          : null,
      sourceMetadata: json['sourceMetadata'] != null
          ? AnalysisSourceMetadata.fromJson(
              json['sourceMetadata'] as Map<String, dynamic>)
          : null,
      syntheticDataParameters: json['syntheticDataParameters'] != null
          ? SyntheticDataParameters.fromJson(
              json['syntheticDataParameters'] as Map<String, dynamic>)
          : null,
      validations: (json['validations'] as List?)
          ?.nonNulls
          .map((e) => AnalysisTemplateValidationStatusDetail.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final collaborationArn = this.collaborationArn;
    final collaborationId = this.collaborationId;
    final createTime = this.createTime;
    final format = this.format;
    final id = this.id;
    final membershipArn = this.membershipArn;
    final membershipId = this.membershipId;
    final name = this.name;
    final schema = this.schema;
    final source = this.source;
    final updateTime = this.updateTime;
    final analysisParameters = this.analysisParameters;
    final description = this.description;
    final errorMessageConfiguration = this.errorMessageConfiguration;
    final sourceMetadata = this.sourceMetadata;
    final syntheticDataParameters = this.syntheticDataParameters;
    final validations = this.validations;
    return {
      'arn': arn,
      'collaborationArn': collaborationArn,
      'collaborationId': collaborationId,
      'createTime': unixTimestampToJson(createTime),
      'format': format.value,
      'id': id,
      'membershipArn': membershipArn,
      'membershipId': membershipId,
      'name': name,
      'schema': schema,
      'source': source,
      'updateTime': unixTimestampToJson(updateTime),
      if (analysisParameters != null) 'analysisParameters': analysisParameters,
      if (description != null) 'description': description,
      if (errorMessageConfiguration != null)
        'errorMessageConfiguration': errorMessageConfiguration,
      if (sourceMetadata != null) 'sourceMetadata': sourceMetadata,
      if (syntheticDataParameters != null)
        'syntheticDataParameters': syntheticDataParameters,
      if (validations != null) 'validations': validations,
    };
  }
}

/// @nodoc
class Document {
  Document();

  factory Document.fromJson(Map<String, dynamic> _) {
    return Document();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

/// @nodoc
class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

/// @nodoc
class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

/// @nodoc
class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

/// @nodoc
class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

/// @nodoc
class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

/// @nodoc
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
