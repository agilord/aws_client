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

/// Welcome to the <i>Clean Rooms API Reference</i>.
///
/// Clean Rooms is an Amazon Web Services service that helps multiple parties to
/// join their data together in a secure collaboration workspace. In the
/// collaboration, members who can query and receive results can get insights
/// into the collective datasets without either party getting access to the
/// other party's raw data.
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
  CleanRooms({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'cleanrooms',
            signingName: 'cleanrooms',
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

  /// Retrieves multiple analysis templates within a collaboration by their
  /// Amazon Resource Names (ARNs).
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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

  /// Creates a new analysis template.
  ///
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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
  /// The information in the analysis template. Currently supports
  /// <code>text</code>, the query text for the analysis template.
  ///
  /// Parameter [analysisParameters] :
  /// The parameters of the analysis template.
  ///
  /// Parameter [description] :
  /// The description of the analysis template.
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
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'format': format.toValue(),
      'name': name,
      'source': source,
      if (analysisParameters != null) 'analysisParameters': analysisParameters,
      if (description != null) 'description': description,
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

  /// Creates a new collaboration.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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
    PaymentConfiguration? creatorPaymentConfiguration,
    DataEncryptionMetadata? dataEncryptionMetadata,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'creatorDisplayName': creatorDisplayName,
      'creatorMemberAbilities':
          creatorMemberAbilities.map((e) => e.toValue()).toList(),
      'description': description,
      'members': members,
      'name': name,
      'queryLogStatus': queryLogStatus.toValue(),
      if (creatorPaymentConfiguration != null)
        'creatorPaymentConfiguration': creatorPaymentConfiguration,
      if (dataEncryptionMetadata != null)
        'dataEncryptionMetadata': dataEncryptionMetadata,
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

  /// Provides the details necessary to create a configured audience model
  /// association.
  ///
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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

  /// Creates a new configured table resource.
  ///
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [allowedColumns] :
  /// The columns of the underlying table that can be used by collaborations or
  /// analysis rules.
  ///
  /// Parameter [analysisMethod] :
  /// The analysis method for the configured tables. The only valid value is
  /// currently `DIRECT_QUERY`.
  ///
  /// Parameter [name] :
  /// The name of the configured table.
  ///
  /// Parameter [tableReference] :
  /// A reference to the Glue table being configured.
  ///
  /// Parameter [description] :
  /// A description for the configured table.
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
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'allowedColumns': allowedColumns,
      'analysisMethod': analysisMethod.toValue(),
      'name': name,
      'tableReference': tableReference,
      if (description != null) 'description': description,
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

  /// Creates a new analysis rule for a configured table. Currently, only one
  /// analysis rule can be created for a given configured table.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [analysisRulePolicy] :
  /// The entire created configured table analysis rule object.
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
      'analysisRuleType': analysisRuleType.toValue(),
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

  /// Creates a configured table association. A configured table association
  /// links a configured table with a collaboration.
  ///
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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

  /// Creates a membership for a specific collaboration identifier and joins the
  /// collaboration.
  ///
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [collaborationIdentifier] :
  /// The unique ID for the associated collaboration.
  ///
  /// Parameter [queryLogStatus] :
  /// An indicator as to whether query logging has been enabled or disabled for
  /// the membership.
  ///
  /// Parameter [defaultResultConfiguration] :
  /// The default protected query result configuration as specified by the
  /// member who can receive results.
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
    MembershipProtectedQueryResultConfiguration? defaultResultConfiguration,
    MembershipPaymentConfiguration? paymentConfiguration,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'collaborationIdentifier': collaborationIdentifier,
      'queryLogStatus': queryLogStatus.toValue(),
      if (defaultResultConfiguration != null)
        'defaultResultConfiguration': defaultResultConfiguration,
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

  /// Creates a privacy budget template for a specified membership. Each
  /// membership can have only one privacy budget template, but it can be
  /// deleted and recreated. If you need to change the privacy budget template
  /// for a membership, use the <a>UpdatePrivacyBudgetTemplate</a> operation.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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
  /// Parameter [tags] :
  /// An optional label that you can assign to a resource when you create it.
  /// Each tag consists of a key and an optional value, both of which you
  /// define. When you use tagging, you can also use tag-based access control in
  /// IAM policies to control access to this resource.
  Future<CreatePrivacyBudgetTemplateOutput> createPrivacyBudgetTemplate({
    required PrivacyBudgetTemplateAutoRefresh autoRefresh,
    required String membershipIdentifier,
    required PrivacyBudgetTemplateParametersInput parameters,
    required PrivacyBudgetType privacyBudgetType,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'autoRefresh': autoRefresh.toValue(),
      'parameters': parameters,
      'privacyBudgetType': privacyBudgetType.toValue(),
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

  /// Deletes an analysis template.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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

  /// Deletes a collaboration. It can only be called by the collaboration owner.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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

  /// Provides the information necessary to delete a configured audience model
  /// association.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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

  /// Deletes a configured table.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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

  /// Deletes a configured table analysis rule.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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
          '/configuredTables/${Uri.encodeComponent(configuredTableIdentifier)}/analysisRule/${Uri.encodeComponent(analysisRuleType.toValue())}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a configured table association.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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

  /// Removes the specified member from a collaboration. The removed member is
  /// placed in the Removed status and can't interact with the collaboration.
  /// The removed member's data is inaccessible to active members of the
  /// collaboration.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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

  /// Deletes a specified membership. All resources under a membership must be
  /// deleted.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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

  /// Deletes a privacy budget template for a specified membership.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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

  /// Retrieves an analysis template.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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

  /// Returns metadata about a collaboration.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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

  /// Retrieves an analysis template within a collaboration.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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

  /// Retrieves a configured audience model association within a collaboration.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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

  /// Returns details about a specified privacy budget template.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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

  /// Returns information about a configured audience model association.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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

  /// Retrieves a configured table.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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

  /// Retrieves a configured table analysis rule.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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
          '/configuredTables/${Uri.encodeComponent(configuredTableIdentifier)}/analysisRule/${Uri.encodeComponent(analysisRuleType.toValue())}',
      exceptionFnMap: _exceptionFns,
    );
    return GetConfiguredTableAnalysisRuleOutput.fromJson(response);
  }

  /// Retrieves a configured table association.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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

  /// Retrieves a specified membership for an identifier.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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

  /// Returns details for a specified privacy budget template.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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

  /// Returns query processing metadata.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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

  /// Retrieves the schema for a relation within a collaboration.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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
          '/collaborations/${Uri.encodeComponent(collaborationIdentifier)}/schemas/${Uri.encodeComponent(name)}/analysisRule/${Uri.encodeComponent(type.toValue())}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSchemaAnalysisRuleOutput.fromJson(response);
  }

  /// Lists analysis templates that the caller owns.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [membershipIdentifier] :
  /// The identifier for a membership resource.
  ///
  /// Parameter [maxResults] :
  /// The maximum size of the results that is returned per call.
  ///
  /// Parameter [nextToken] :
  /// The token value retrieved from a previous call to access the next page of
  /// results.
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

  /// Lists analysis templates within a collaboration.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [collaborationIdentifier] :
  /// A unique identifier for the collaboration that the analysis templates
  /// belong to. Currently accepts collaboration ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum size of the results that is returned per call.
  ///
  /// Parameter [nextToken] :
  /// The token value retrieved from a previous call to access the next page of
  /// results.
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

  /// Lists configured audience model associations within a collaboration.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [collaborationIdentifier] :
  /// A unique identifier for the collaboration that the configured audience
  /// model association belongs to. Accepts a collaboration ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum size of the results that is returned per call.
  ///
  /// Parameter [nextToken] :
  /// The token value retrieved from a previous call to access the next page of
  /// results.
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

  /// Returns an array that summarizes each privacy budget template in a
  /// specified collaboration.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [collaborationIdentifier] :
  /// A unique identifier for one of your collaborations.
  ///
  /// Parameter [maxResults] :
  /// The maximum size of the results that is returned per call. Service chooses
  /// a default if it has not been set. Service may return a nextToken even if
  /// the maximum results has not been met.
  ///
  /// Parameter [nextToken] :
  /// The token value retrieved from a previous call to access the next page of
  /// results.
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

  /// Returns an array that summarizes each privacy budget in a specified
  /// collaboration. The summary includes the collaboration ARN, creation time,
  /// creating account, and privacy budget details.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [collaborationIdentifier] :
  /// A unique identifier for one of your collaborations.
  ///
  /// Parameter [privacyBudgetType] :
  /// Specifies the type of the privacy budget.
  ///
  /// Parameter [maxResults] :
  /// The maximum size of the results that is returned per call. Service chooses
  /// a default if it has not been set. Service may return a nextToken even if
  /// the maximum results has not been met.
  ///
  /// Parameter [nextToken] :
  /// The token value retrieved from a previous call to access the next page of
  /// results.
  Future<ListCollaborationPrivacyBudgetsOutput>
      listCollaborationPrivacyBudgets({
    required String collaborationIdentifier,
    required PrivacyBudgetType privacyBudgetType,
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
      'privacyBudgetType': [privacyBudgetType.toValue()],
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

  /// Lists collaborations the caller owns, is active in, or has been invited
  /// to.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum size of the results that is returned per call. Service chooses
  /// a default if it has not been set. Service may return a nextToken even if
  /// the maximum results has not been met.
  ///
  /// Parameter [memberStatus] :
  /// The caller's status in a collaboration.
  ///
  /// Parameter [nextToken] :
  /// The token value retrieved from a previous call to access the next page of
  /// results.
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
      if (memberStatus != null) 'memberStatus': [memberStatus.toValue()],
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

  /// Lists information about requested configured audience model associations.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [membershipIdentifier] :
  /// A unique identifier for a membership that contains the configured audience
  /// model associations that you want to retrieve.
  ///
  /// Parameter [maxResults] :
  /// The maximum size of the results that is returned per call. Service chooses
  /// a default if it has not been set. Service may return a nextToken even if
  /// the maximum results has not been met.
  ///
  /// Parameter [nextToken] :
  /// The token value retrieved from a previous call to access the next page of
  /// results.
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

  /// Lists configured table associations for a membership.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [membershipIdentifier] :
  /// A unique identifier for the membership to list configured table
  /// associations for. Currently accepts the membership ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum size of the results that is returned per call.
  ///
  /// Parameter [nextToken] :
  /// The token value retrieved from a previous call to access the next page of
  /// results.
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

  /// Lists configured tables.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum size of the results that is returned per call.
  ///
  /// Parameter [nextToken] :
  /// The token value retrieved from a previous call to access the next page of
  /// results.
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

  /// Lists all members within a collaboration.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [collaborationIdentifier] :
  /// The identifier of the collaboration in which the members are listed.
  ///
  /// Parameter [maxResults] :
  /// The maximum size of the results that is returned per call.
  ///
  /// Parameter [nextToken] :
  /// The token value retrieved from a previous call to access the next page of
  /// results.
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

  /// Lists all memberships resources within the caller's account.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum size of the results that is returned per call.
  ///
  /// Parameter [nextToken] :
  /// The token value retrieved from a previous call to access the next page of
  /// results.
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
      if (status != null) 'status': [status.toValue()],
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

  /// Returns detailed information about the privacy budget templates in a
  /// specified membership.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [membershipIdentifier] :
  /// A unique identifier for one of your memberships for a collaboration. The
  /// privacy budget templates are retrieved from the collaboration that this
  /// membership belongs to. Accepts a membership ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum size of the results that is returned per call. Service chooses
  /// a default if it has not been set. Service may return a nextToken even if
  /// the maximum results has not been met.
  ///
  /// Parameter [nextToken] :
  /// The token value retrieved from a previous call to access the next page of
  /// results.
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

  /// Returns detailed information about the privacy budgets in a specified
  /// membership.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [membershipIdentifier] :
  /// A unique identifier for one of your memberships for a collaboration. The
  /// privacy budget is retrieved from the collaboration that this membership
  /// belongs to. Accepts a membership ID.
  ///
  /// Parameter [privacyBudgetType] :
  /// The privacy budget type.
  ///
  /// Parameter [maxResults] :
  /// The maximum size of the results that is returned per call. Service chooses
  /// a default if it has not been set. Service may return a nextToken even if
  /// the maximum results has not been met.
  ///
  /// Parameter [nextToken] :
  /// The token value retrieved from a previous call to access the next page of
  /// results.
  Future<ListPrivacyBudgetsOutput> listPrivacyBudgets({
    required String membershipIdentifier,
    required PrivacyBudgetType privacyBudgetType,
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
      'privacyBudgetType': [privacyBudgetType.toValue()],
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

  /// Lists protected queries, sorted by the most recent query.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [membershipIdentifier] :
  /// The identifier for the membership in the collaboration.
  ///
  /// Parameter [maxResults] :
  /// The maximum size of the results that is returned per call. Service chooses
  /// a default if it has not been set. Service can return a nextToken even if
  /// the maximum results has not been met.
  ///
  /// Parameter [nextToken] :
  /// The token value retrieved from a previous call to access the next page of
  /// results.
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
      if (status != null) 'status': [status.toValue()],
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

  /// Lists the schemas for relations within a collaboration.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [collaborationIdentifier] :
  /// A unique identifier for the collaboration that the schema belongs to.
  /// Currently accepts a collaboration ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum size of the results that is returned per call.
  ///
  /// Parameter [nextToken] :
  /// The token value retrieved from a previous call to access the next page of
  /// results.
  ///
  /// Parameter [schemaType] :
  /// If present, filter schemas by schema type. The only valid schema type is
  /// currently `TABLE`.
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
      if (schemaType != null) 'schemaType': [schemaType.toValue()],
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

  /// An estimate of the number of aggregation functions that the member who can
  /// query can run given epsilon and noise parameters.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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

  /// Creates a protected query that is started by Clean Rooms.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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
  /// Parameter [resultConfiguration] :
  /// The details needed to write the query results.
  Future<StartProtectedQueryOutput> startProtectedQuery({
    required String membershipIdentifier,
    required ProtectedQuerySQLParameters sqlParameters,
    required ProtectedQueryType type,
    ProtectedQueryResultConfiguration? resultConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      'sqlParameters': sqlParameters,
      'type': type.toValue(),
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

  /// Updates the analysis template metadata.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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

  /// Updates collaboration metadata and can only be called by the collaboration
  /// owner.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [collaborationIdentifier] :
  /// The identifier for the collaboration.
  ///
  /// Parameter [description] :
  /// A description of the collaboration.
  ///
  /// Parameter [name] :
  /// A human-readable identifier provided by the collaboration owner. Display
  /// names are not unique.
  Future<UpdateCollaborationOutput> updateCollaboration({
    required String collaborationIdentifier,
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
          '/collaborations/${Uri.encodeComponent(collaborationIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateCollaborationOutput.fromJson(response);
  }

  /// Provides the details necessary to update a configured audience model
  /// association.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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

  /// Updates a configured table.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [configuredTableIdentifier] :
  /// The identifier for the configured table to update. Currently accepts the
  /// configured table ID.
  ///
  /// Parameter [description] :
  /// A new description for the configured table.
  ///
  /// Parameter [name] :
  /// A new name for the configured table.
  Future<UpdateConfiguredTableOutput> updateConfiguredTable({
    required String configuredTableIdentifier,
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
          '/configuredTables/${Uri.encodeComponent(configuredTableIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateConfiguredTableOutput.fromJson(response);
  }

  /// Updates a configured table analysis rule.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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
          '/configuredTables/${Uri.encodeComponent(configuredTableIdentifier)}/analysisRule/${Uri.encodeComponent(analysisRuleType.toValue())}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateConfiguredTableAnalysisRuleOutput.fromJson(response);
  }

  /// Updates a configured table association.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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

  /// Updates a membership.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [membershipIdentifier] :
  /// The unique identifier of the membership.
  ///
  /// Parameter [defaultResultConfiguration] :
  /// The default protected query result configuration as specified by the
  /// member who can receive results.
  ///
  /// Parameter [queryLogStatus] :
  /// An indicator as to whether query logging has been enabled or disabled for
  /// the membership.
  Future<UpdateMembershipOutput> updateMembership({
    required String membershipIdentifier,
    MembershipProtectedQueryResultConfiguration? defaultResultConfiguration,
    MembershipQueryLogStatus? queryLogStatus,
  }) async {
    final $payload = <String, dynamic>{
      if (defaultResultConfiguration != null)
        'defaultResultConfiguration': defaultResultConfiguration,
      if (queryLogStatus != null) 'queryLogStatus': queryLogStatus.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/memberships/${Uri.encodeComponent(membershipIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateMembershipOutput.fromJson(response);
  }

  /// Updates the privacy budget template for the specified membership.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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
      'privacyBudgetType': privacyBudgetType.toValue(),
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

  /// Updates the processing of a currently running query.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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
      'targetStatus': targetStatus.toValue(),
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
}

/// Column in configured table that can be used in aggregate function in query.
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
      columnNames: (json['columnNames'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      function: (json['function'] as String).toAggregateFunctionName(),
    );
  }

  Map<String, dynamic> toJson() {
    final columnNames = this.columnNames;
    final function = this.function;
    return {
      'columnNames': columnNames,
      'function': function.toValue(),
    };
  }
}

enum AggregateFunctionName {
  sum,
  sumDistinct,
  count,
  countDistinct,
  avg,
}

extension AggregateFunctionNameValueExtension on AggregateFunctionName {
  String toValue() {
    switch (this) {
      case AggregateFunctionName.sum:
        return 'SUM';
      case AggregateFunctionName.sumDistinct:
        return 'SUM_DISTINCT';
      case AggregateFunctionName.count:
        return 'COUNT';
      case AggregateFunctionName.countDistinct:
        return 'COUNT_DISTINCT';
      case AggregateFunctionName.avg:
        return 'AVG';
    }
  }
}

extension AggregateFunctionNameFromString on String {
  AggregateFunctionName toAggregateFunctionName() {
    switch (this) {
      case 'SUM':
        return AggregateFunctionName.sum;
      case 'SUM_DISTINCT':
        return AggregateFunctionName.sumDistinct;
      case 'COUNT':
        return AggregateFunctionName.count;
      case 'COUNT_DISTINCT':
        return AggregateFunctionName.countDistinct;
      case 'AVG':
        return AggregateFunctionName.avg;
    }
    throw Exception('$this is not known in enum AggregateFunctionName');
  }
}

/// Constraint on query output removing output rows that do not meet a minimum
/// number of distinct values of a specified column.
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
      columnName: json['columnName'] as String,
      minimum: json['minimum'] as int,
      type: (json['type'] as String).toAggregationType(),
    );
  }

  Map<String, dynamic> toJson() {
    final columnName = this.columnName;
    final minimum = this.minimum;
    final type = this.type;
    return {
      'columnName': columnName,
      'minimum': minimum,
      'type': type.toValue(),
    };
  }
}

enum AggregationType {
  countDistinct,
}

extension AggregationTypeValueExtension on AggregationType {
  String toValue() {
    switch (this) {
      case AggregationType.countDistinct:
        return 'COUNT_DISTINCT';
    }
  }
}

extension AggregationTypeFromString on String {
  AggregationType toAggregationType() {
    switch (this) {
      case 'COUNT_DISTINCT':
        return AggregationType.countDistinct;
    }
    throw Exception('$this is not known in enum AggregationType');
  }
}

enum AnalysisFormat {
  sql,
}

extension AnalysisFormatValueExtension on AnalysisFormat {
  String toValue() {
    switch (this) {
      case AnalysisFormat.sql:
        return 'SQL';
    }
  }
}

extension AnalysisFormatFromString on String {
  AnalysisFormat toAnalysisFormat() {
    switch (this) {
      case 'SQL':
        return AnalysisFormat.sql;
    }
    throw Exception('$this is not known in enum AnalysisFormat');
  }
}

enum AnalysisMethod {
  directQuery,
}

extension AnalysisMethodValueExtension on AnalysisMethod {
  String toValue() {
    switch (this) {
      case AnalysisMethod.directQuery:
        return 'DIRECT_QUERY';
    }
  }
}

extension AnalysisMethodFromString on String {
  AnalysisMethod toAnalysisMethod() {
    switch (this) {
      case 'DIRECT_QUERY':
        return AnalysisMethod.directQuery;
    }
    throw Exception('$this is not known in enum AnalysisMethod');
  }
}

/// Optional. The member who can query can provide this placeholder for a
/// literal data value in an analysis template.
class AnalysisParameter {
  /// The name of the parameter. The name must use only alphanumeric, underscore
  /// (_), or hyphen (-) characters but cannot start or end with a hyphen.
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
      name: json['name'] as String,
      type: (json['type'] as String).toParameterType(),
      defaultValue: json['defaultValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    final defaultValue = this.defaultValue;
    return {
      'name': name,
      'type': type.toValue(),
      if (defaultValue != null) 'defaultValue': defaultValue,
    };
  }
}

/// A specification about how data from the configured table can be used in a
/// query.
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

  AnalysisRule({
    required this.collaborationId,
    required this.createTime,
    required this.name,
    required this.policy,
    required this.type,
    required this.updateTime,
  });

  factory AnalysisRule.fromJson(Map<String, dynamic> json) {
    return AnalysisRule(
      collaborationId: json['collaborationId'] as String,
      createTime: nonNullableTimeStampFromJson(json['createTime'] as Object),
      name: json['name'] as String,
      policy:
          AnalysisRulePolicy.fromJson(json['policy'] as Map<String, dynamic>),
      type: (json['type'] as String).toAnalysisRuleType(),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final collaborationId = this.collaborationId;
    final createTime = this.createTime;
    final name = this.name;
    final policy = this.policy;
    final type = this.type;
    final updateTime = this.updateTime;
    return {
      'collaborationId': collaborationId,
      'createTime': unixTimestampToJson(createTime),
      'name': name,
      'policy': policy,
      'type': type.toValue(),
      'updateTime': unixTimestampToJson(updateTime),
    };
  }
}

/// A type of analysis rule that enables query structure and specified queries
/// that produce aggregate statistics.
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
    this.allowedJoinOperators,
    this.joinRequired,
  });

  factory AnalysisRuleAggregation.fromJson(Map<String, dynamic> json) {
    return AnalysisRuleAggregation(
      aggregateColumns: (json['aggregateColumns'] as List)
          .whereNotNull()
          .map((e) => AggregateColumn.fromJson(e as Map<String, dynamic>))
          .toList(),
      dimensionColumns: (json['dimensionColumns'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      joinColumns: (json['joinColumns'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      outputConstraints: (json['outputConstraints'] as List)
          .whereNotNull()
          .map((e) => AggregationConstraint.fromJson(e as Map<String, dynamic>))
          .toList(),
      scalarFunctions: (json['scalarFunctions'] as List)
          .whereNotNull()
          .map((e) => (e as String).toScalarFunctions())
          .toList(),
      allowedJoinOperators: (json['allowedJoinOperators'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toJoinOperator())
          .toList(),
      joinRequired: (json['joinRequired'] as String?)?.toJoinRequiredOption(),
    );
  }

  Map<String, dynamic> toJson() {
    final aggregateColumns = this.aggregateColumns;
    final dimensionColumns = this.dimensionColumns;
    final joinColumns = this.joinColumns;
    final outputConstraints = this.outputConstraints;
    final scalarFunctions = this.scalarFunctions;
    final allowedJoinOperators = this.allowedJoinOperators;
    final joinRequired = this.joinRequired;
    return {
      'aggregateColumns': aggregateColumns,
      'dimensionColumns': dimensionColumns,
      'joinColumns': joinColumns,
      'outputConstraints': outputConstraints,
      'scalarFunctions': scalarFunctions.map((e) => e.toValue()).toList(),
      if (allowedJoinOperators != null)
        'allowedJoinOperators':
            allowedJoinOperators.map((e) => e.toValue()).toList(),
      if (joinRequired != null) 'joinRequired': joinRequired.toValue(),
    };
  }
}

/// A type of analysis rule that enables the table owner to approve custom SQL
/// queries on their configured tables. It supports differential privacy.
class AnalysisRuleCustom {
  /// The ARN of the analysis templates that are allowed by the custom analysis
  /// rule.
  final List<String> allowedAnalyses;

  /// The IDs of the Amazon Web Services accounts that are allowed to query by the
  /// custom analysis rule. Required when <code>allowedAnalyses</code> is
  /// <code>ANY_QUERY</code>.
  final List<String>? allowedAnalysisProviders;

  /// The differential privacy configuration.
  final DifferentialPrivacyConfiguration? differentialPrivacy;

  AnalysisRuleCustom({
    required this.allowedAnalyses,
    this.allowedAnalysisProviders,
    this.differentialPrivacy,
  });

  factory AnalysisRuleCustom.fromJson(Map<String, dynamic> json) {
    return AnalysisRuleCustom(
      allowedAnalyses: (json['allowedAnalyses'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      allowedAnalysisProviders: (json['allowedAnalysisProviders'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      differentialPrivacy: json['differentialPrivacy'] != null
          ? DifferentialPrivacyConfiguration.fromJson(
              json['differentialPrivacy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final allowedAnalyses = this.allowedAnalyses;
    final allowedAnalysisProviders = this.allowedAnalysisProviders;
    final differentialPrivacy = this.differentialPrivacy;
    return {
      'allowedAnalyses': allowedAnalyses,
      if (allowedAnalysisProviders != null)
        'allowedAnalysisProviders': allowedAnalysisProviders,
      if (differentialPrivacy != null)
        'differentialPrivacy': differentialPrivacy,
    };
  }
}

/// A type of analysis rule that enables row-level analysis.
class AnalysisRuleList {
  /// Columns that can be used to join a configured table with the table of the
  /// member who can query and other members' configured tables.
  final List<String> joinColumns;

  /// Columns that can be listed in the output.
  final List<String> listColumns;

  /// The logical operators (if any) that are to be used in an INNER JOIN match
  /// condition. Default is <code>AND</code>.
  final List<JoinOperator>? allowedJoinOperators;

  AnalysisRuleList({
    required this.joinColumns,
    required this.listColumns,
    this.allowedJoinOperators,
  });

  factory AnalysisRuleList.fromJson(Map<String, dynamic> json) {
    return AnalysisRuleList(
      joinColumns: (json['joinColumns'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      listColumns: (json['listColumns'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      allowedJoinOperators: (json['allowedJoinOperators'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toJoinOperator())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final joinColumns = this.joinColumns;
    final listColumns = this.listColumns;
    final allowedJoinOperators = this.allowedJoinOperators;
    return {
      'joinColumns': joinColumns,
      'listColumns': listColumns,
      if (allowedJoinOperators != null)
        'allowedJoinOperators':
            allowedJoinOperators.map((e) => e.toValue()).toList(),
    };
  }
}

/// Controls on the query specifications that can be run on configured table.
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

/// Controls on the query specifications that can be run on configured table.
class AnalysisRulePolicyV1 {
  /// Analysis rule type that enables only aggregation queries on a configured
  /// table.
  final AnalysisRuleAggregation? aggregation;

  /// Analysis rule type that enables custom SQL queries on a configured table.
  final AnalysisRuleCustom? custom;

  /// Analysis rule type that enables only list queries on a configured table.
  final AnalysisRuleList? list;

  AnalysisRulePolicyV1({
    this.aggregation,
    this.custom,
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

enum AnalysisRuleType {
  aggregation,
  list,
  custom,
}

extension AnalysisRuleTypeValueExtension on AnalysisRuleType {
  String toValue() {
    switch (this) {
      case AnalysisRuleType.aggregation:
        return 'AGGREGATION';
      case AnalysisRuleType.list:
        return 'LIST';
      case AnalysisRuleType.custom:
        return 'CUSTOM';
    }
  }
}

extension AnalysisRuleTypeFromString on String {
  AnalysisRuleType toAnalysisRuleType() {
    switch (this) {
      case 'AGGREGATION':
        return AnalysisRuleType.aggregation;
      case 'LIST':
        return AnalysisRuleType.list;
      case 'CUSTOM':
        return AnalysisRuleType.custom;
    }
    throw Exception('$this is not known in enum AnalysisRuleType');
  }
}

/// A relation within an analysis.
class AnalysisSchema {
  /// The tables referenced in the analysis schema.
  final List<String>? referencedTables;

  AnalysisSchema({
    this.referencedTables,
  });

  factory AnalysisSchema.fromJson(Map<String, dynamic> json) {
    return AnalysisSchema(
      referencedTables: (json['referencedTables'] as List?)
          ?.whereNotNull()
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

/// The structure that defines the body of the analysis template.
class AnalysisSource {
  /// The query text.
  final String? text;

  AnalysisSource({
    this.text,
  });

  factory AnalysisSource.fromJson(Map<String, dynamic> json) {
    return AnalysisSource(
      text: json['text'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final text = this.text;
    return {
      if (text != null) 'text': text,
    };
  }
}

/// The analysis template.
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
    this.validations,
  });

  factory AnalysisTemplate.fromJson(Map<String, dynamic> json) {
    return AnalysisTemplate(
      arn: json['arn'] as String,
      collaborationArn: json['collaborationArn'] as String,
      collaborationId: json['collaborationId'] as String,
      createTime: nonNullableTimeStampFromJson(json['createTime'] as Object),
      format: (json['format'] as String).toAnalysisFormat(),
      id: json['id'] as String,
      membershipArn: json['membershipArn'] as String,
      membershipId: json['membershipId'] as String,
      name: json['name'] as String,
      schema: AnalysisSchema.fromJson(json['schema'] as Map<String, dynamic>),
      source: AnalysisSource.fromJson(json['source'] as Map<String, dynamic>),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] as Object),
      analysisParameters: (json['analysisParameters'] as List?)
          ?.whereNotNull()
          .map((e) => AnalysisParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
      validations: (json['validations'] as List?)
          ?.whereNotNull()
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
    final validations = this.validations;
    return {
      'arn': arn,
      'collaborationArn': collaborationArn,
      'collaborationId': collaborationId,
      'createTime': unixTimestampToJson(createTime),
      'format': format.toValue(),
      'id': id,
      'membershipArn': membershipArn,
      'membershipId': membershipId,
      'name': name,
      'schema': schema,
      'source': source,
      'updateTime': unixTimestampToJson(updateTime),
      if (analysisParameters != null) 'analysisParameters': analysisParameters,
      if (description != null) 'description': description,
      if (validations != null) 'validations': validations,
    };
  }
}

/// The metadata of the analysis template.
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
  });

  factory AnalysisTemplateSummary.fromJson(Map<String, dynamic> json) {
    return AnalysisTemplateSummary(
      arn: json['arn'] as String,
      collaborationArn: json['collaborationArn'] as String,
      collaborationId: json['collaborationId'] as String,
      createTime: nonNullableTimeStampFromJson(json['createTime'] as Object),
      id: json['id'] as String,
      membershipArn: json['membershipArn'] as String,
      membershipId: json['membershipId'] as String,
      name: json['name'] as String,
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] as Object),
      description: json['description'] as String?,
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
    };
  }
}

enum AnalysisTemplateValidationStatus {
  valid,
  invalid,
  unableToValidate,
}

extension AnalysisTemplateValidationStatusValueExtension
    on AnalysisTemplateValidationStatus {
  String toValue() {
    switch (this) {
      case AnalysisTemplateValidationStatus.valid:
        return 'VALID';
      case AnalysisTemplateValidationStatus.invalid:
        return 'INVALID';
      case AnalysisTemplateValidationStatus.unableToValidate:
        return 'UNABLE_TO_VALIDATE';
    }
  }
}

extension AnalysisTemplateValidationStatusFromString on String {
  AnalysisTemplateValidationStatus toAnalysisTemplateValidationStatus() {
    switch (this) {
      case 'VALID':
        return AnalysisTemplateValidationStatus.valid;
      case 'INVALID':
        return AnalysisTemplateValidationStatus.invalid;
      case 'UNABLE_TO_VALIDATE':
        return AnalysisTemplateValidationStatus.unableToValidate;
    }
    throw Exception(
        '$this is not known in enum AnalysisTemplateValidationStatus');
  }
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
      status: (json['status'] as String).toAnalysisTemplateValidationStatus(),
      type: (json['type'] as String).toAnalysisTemplateValidationType(),
      reasons: (json['reasons'] as List?)
          ?.whereNotNull()
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
      'status': status.toValue(),
      'type': type.toValue(),
      if (reasons != null) 'reasons': reasons,
    };
  }
}

/// The reasons for the validation results.
class AnalysisTemplateValidationStatusReason {
  /// The validation message.
  final String message;

  AnalysisTemplateValidationStatusReason({
    required this.message,
  });

  factory AnalysisTemplateValidationStatusReason.fromJson(
      Map<String, dynamic> json) {
    return AnalysisTemplateValidationStatusReason(
      message: json['message'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      'message': message,
    };
  }
}

enum AnalysisTemplateValidationType {
  differentialPrivacy,
}

extension AnalysisTemplateValidationTypeValueExtension
    on AnalysisTemplateValidationType {
  String toValue() {
    switch (this) {
      case AnalysisTemplateValidationType.differentialPrivacy:
        return 'DIFFERENTIAL_PRIVACY';
    }
  }
}

extension AnalysisTemplateValidationTypeFromString on String {
  AnalysisTemplateValidationType toAnalysisTemplateValidationType() {
    switch (this) {
      case 'DIFFERENTIAL_PRIVACY':
        return AnalysisTemplateValidationType.differentialPrivacy;
    }
    throw Exception(
        '$this is not known in enum AnalysisTemplateValidationType');
  }
}

/// Details of errors thrown by the call to retrieve multiple analysis templates
/// within a collaboration by their identifiers.
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
      arn: json['arn'] as String,
      code: json['code'] as String,
      message: json['message'] as String,
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
      collaborationAnalysisTemplates: (json['collaborationAnalysisTemplates']
              as List)
          .whereNotNull()
          .map((e) =>
              CollaborationAnalysisTemplate.fromJson(e as Map<String, dynamic>))
          .toList(),
      errors: (json['errors'] as List)
          .whereNotNull()
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

/// An error that describes why a schema could not be fetched.
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
      code: json['code'] as String,
      message: json['message'] as String,
      name: json['name'] as String,
      type: (json['type'] as String).toAnalysisRuleType(),
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
      'type': type.toValue(),
    };
  }
}

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
      analysisRules: (json['analysisRules'] as List)
          .whereNotNull()
          .map((e) => AnalysisRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      errors: (json['errors'] as List)
          .whereNotNull()
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

/// An error describing why a schema could not be fetched.
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
      code: json['code'] as String,
      message: json['message'] as String,
      name: json['name'] as String,
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
      errors: (json['errors'] as List)
          .whereNotNull()
          .map((e) => BatchGetSchemaError.fromJson(e as Map<String, dynamic>))
          .toList(),
      schemas: (json['schemas'] as List)
          .whereNotNull()
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

/// The multi-party data share environment. The collaboration contains metadata
/// about its purpose and participants.
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
  final CollaborationQueryLogStatus queryLogStatus;

  /// The time the collaboration metadata was last updated.
  final DateTime updateTime;

  /// The settings for client-side encryption for cryptographic computing.
  final DataEncryptionMetadata? dataEncryptionMetadata;

  /// A description of the collaboration provided by the collaboration owner.
  final String? description;

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
    this.dataEncryptionMetadata,
    this.description,
    this.membershipArn,
    this.membershipId,
  });

  factory Collaboration.fromJson(Map<String, dynamic> json) {
    return Collaboration(
      arn: json['arn'] as String,
      createTime: nonNullableTimeStampFromJson(json['createTime'] as Object),
      creatorAccountId: json['creatorAccountId'] as String,
      creatorDisplayName: json['creatorDisplayName'] as String,
      id: json['id'] as String,
      memberStatus: (json['memberStatus'] as String).toMemberStatus(),
      name: json['name'] as String,
      queryLogStatus:
          (json['queryLogStatus'] as String).toCollaborationQueryLogStatus(),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] as Object),
      dataEncryptionMetadata: json['dataEncryptionMetadata'] != null
          ? DataEncryptionMetadata.fromJson(
              json['dataEncryptionMetadata'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
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
    final dataEncryptionMetadata = this.dataEncryptionMetadata;
    final description = this.description;
    final membershipArn = this.membershipArn;
    final membershipId = this.membershipId;
    return {
      'arn': arn,
      'createTime': unixTimestampToJson(createTime),
      'creatorAccountId': creatorAccountId,
      'creatorDisplayName': creatorDisplayName,
      'id': id,
      'memberStatus': memberStatus.toValue(),
      'name': name,
      'queryLogStatus': queryLogStatus.toValue(),
      'updateTime': unixTimestampToJson(updateTime),
      if (dataEncryptionMetadata != null)
        'dataEncryptionMetadata': dataEncryptionMetadata,
      if (description != null) 'description': description,
      if (membershipArn != null) 'membershipArn': membershipArn,
      if (membershipId != null) 'membershipId': membershipId,
    };
  }
}

/// The analysis template within a collaboration.
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

  /// The source of the analysis template within a collaboration.
  final AnalysisSource source;

  /// The time that the analysis template in the collaboration was last updated.
  final DateTime updateTime;

  /// The analysis parameters that have been specified in the analysis template.
  final List<AnalysisParameter>? analysisParameters;

  /// The description of the analysis template.
  final String? description;

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
    required this.source,
    required this.updateTime,
    this.analysisParameters,
    this.description,
    this.validations,
  });

  factory CollaborationAnalysisTemplate.fromJson(Map<String, dynamic> json) {
    return CollaborationAnalysisTemplate(
      arn: json['arn'] as String,
      collaborationArn: json['collaborationArn'] as String,
      collaborationId: json['collaborationId'] as String,
      createTime: nonNullableTimeStampFromJson(json['createTime'] as Object),
      creatorAccountId: json['creatorAccountId'] as String,
      format: (json['format'] as String).toAnalysisFormat(),
      id: json['id'] as String,
      name: json['name'] as String,
      schema: AnalysisSchema.fromJson(json['schema'] as Map<String, dynamic>),
      source: AnalysisSource.fromJson(json['source'] as Map<String, dynamic>),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] as Object),
      analysisParameters: (json['analysisParameters'] as List?)
          ?.whereNotNull()
          .map((e) => AnalysisParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
      validations: (json['validations'] as List?)
          ?.whereNotNull()
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
    final source = this.source;
    final updateTime = this.updateTime;
    final analysisParameters = this.analysisParameters;
    final description = this.description;
    final validations = this.validations;
    return {
      'arn': arn,
      'collaborationArn': collaborationArn,
      'collaborationId': collaborationId,
      'createTime': unixTimestampToJson(createTime),
      'creatorAccountId': creatorAccountId,
      'format': format.toValue(),
      'id': id,
      'name': name,
      'schema': schema,
      'source': source,
      'updateTime': unixTimestampToJson(updateTime),
      if (analysisParameters != null) 'analysisParameters': analysisParameters,
      if (description != null) 'description': description,
      if (validations != null) 'validations': validations,
    };
  }
}

/// The metadata of the analysis template within a collaboration.
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
  });

  factory CollaborationAnalysisTemplateSummary.fromJson(
      Map<String, dynamic> json) {
    return CollaborationAnalysisTemplateSummary(
      arn: json['arn'] as String,
      collaborationArn: json['collaborationArn'] as String,
      collaborationId: json['collaborationId'] as String,
      createTime: nonNullableTimeStampFromJson(json['createTime'] as Object),
      creatorAccountId: json['creatorAccountId'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] as Object),
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

/// The configured audience model association within a collaboration.
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
  /// AWS account ID.
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
      arn: json['arn'] as String,
      collaborationArn: json['collaborationArn'] as String,
      collaborationId: json['collaborationId'] as String,
      configuredAudienceModelArn: json['configuredAudienceModelArn'] as String,
      createTime: nonNullableTimeStampFromJson(json['createTime'] as Object),
      creatorAccountId: json['creatorAccountId'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] as Object),
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

/// A summary of the configured audience model association in the collaboration.
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
  /// AWS account ID.
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
      arn: json['arn'] as String,
      collaborationArn: json['collaborationArn'] as String,
      collaborationId: json['collaborationId'] as String,
      createTime: nonNullableTimeStampFromJson(json['createTime'] as Object),
      creatorAccountId: json['creatorAccountId'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] as Object),
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

/// A summary of the collaboration privacy budgets. This summary includes the
/// collaboration information, creation information, epsilon provided, and
/// utility in terms of aggregations.
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
      budget: PrivacyBudget.fromJson(json['budget'] as Map<String, dynamic>),
      collaborationArn: json['collaborationArn'] as String,
      collaborationId: json['collaborationId'] as String,
      createTime: nonNullableTimeStampFromJson(json['createTime'] as Object),
      creatorAccountId: json['creatorAccountId'] as String,
      id: json['id'] as String,
      privacyBudgetTemplateArn: json['privacyBudgetTemplateArn'] as String,
      privacyBudgetTemplateId: json['privacyBudgetTemplateId'] as String,
      type: (json['type'] as String).toPrivacyBudgetType(),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] as Object),
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
      'type': type.toValue(),
      'updateTime': unixTimestampToJson(updateTime),
    };
  }
}

/// An array that specifies the information for a collaboration's privacy budget
/// template.
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
      arn: json['arn'] as String,
      autoRefresh:
          (json['autoRefresh'] as String).toPrivacyBudgetTemplateAutoRefresh(),
      collaborationArn: json['collaborationArn'] as String,
      collaborationId: json['collaborationId'] as String,
      createTime: nonNullableTimeStampFromJson(json['createTime'] as Object),
      creatorAccountId: json['creatorAccountId'] as String,
      id: json['id'] as String,
      parameters: PrivacyBudgetTemplateParametersOutput.fromJson(
          json['parameters'] as Map<String, dynamic>),
      privacyBudgetType:
          (json['privacyBudgetType'] as String).toPrivacyBudgetType(),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] as Object),
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
      'autoRefresh': autoRefresh.toValue(),
      'collaborationArn': collaborationArn,
      'collaborationId': collaborationId,
      'createTime': unixTimestampToJson(createTime),
      'creatorAccountId': creatorAccountId,
      'id': id,
      'parameters': parameters,
      'privacyBudgetType': privacyBudgetType.toValue(),
      'updateTime': unixTimestampToJson(updateTime),
    };
  }
}

/// A summary of the collaboration's privacy budget template. This summary
/// includes information about who created the privacy budget template and what
/// collaborations it belongs to.
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
      arn: json['arn'] as String,
      collaborationArn: json['collaborationArn'] as String,
      collaborationId: json['collaborationId'] as String,
      createTime: nonNullableTimeStampFromJson(json['createTime'] as Object),
      creatorAccountId: json['creatorAccountId'] as String,
      id: json['id'] as String,
      privacyBudgetType:
          (json['privacyBudgetType'] as String).toPrivacyBudgetType(),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] as Object),
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
      'privacyBudgetType': privacyBudgetType.toValue(),
      'updateTime': unixTimestampToJson(updateTime),
    };
  }
}

enum CollaborationQueryLogStatus {
  enabled,
  disabled,
}

extension CollaborationQueryLogStatusValueExtension
    on CollaborationQueryLogStatus {
  String toValue() {
    switch (this) {
      case CollaborationQueryLogStatus.enabled:
        return 'ENABLED';
      case CollaborationQueryLogStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension CollaborationQueryLogStatusFromString on String {
  CollaborationQueryLogStatus toCollaborationQueryLogStatus() {
    switch (this) {
      case 'ENABLED':
        return CollaborationQueryLogStatus.enabled;
      case 'DISABLED':
        return CollaborationQueryLogStatus.disabled;
    }
    throw Exception('$this is not known in enum CollaborationQueryLogStatus');
  }
}

/// The metadata of the collaboration.
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
    this.membershipArn,
    this.membershipId,
  });

  factory CollaborationSummary.fromJson(Map<String, dynamic> json) {
    return CollaborationSummary(
      arn: json['arn'] as String,
      createTime: nonNullableTimeStampFromJson(json['createTime'] as Object),
      creatorAccountId: json['creatorAccountId'] as String,
      creatorDisplayName: json['creatorDisplayName'] as String,
      id: json['id'] as String,
      memberStatus: (json['memberStatus'] as String).toMemberStatus(),
      name: json['name'] as String,
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] as Object),
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
    final membershipArn = this.membershipArn;
    final membershipId = this.membershipId;
    return {
      'arn': arn,
      'createTime': unixTimestampToJson(createTime),
      'creatorAccountId': creatorAccountId,
      'creatorDisplayName': creatorDisplayName,
      'id': id,
      'memberStatus': memberStatus.toValue(),
      'name': name,
      'updateTime': unixTimestampToJson(updateTime),
      if (membershipArn != null) 'membershipArn': membershipArn,
      if (membershipId != null) 'membershipId': membershipId,
    };
  }
}

/// A column within a schema relation, derived from the underlying Glue table.
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
      name: json['name'] as String,
      type: json['type'] as String,
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

/// Details about the configured audience model association.
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
      arn: json['arn'] as String,
      collaborationArn: json['collaborationArn'] as String,
      collaborationId: json['collaborationId'] as String,
      configuredAudienceModelArn: json['configuredAudienceModelArn'] as String,
      createTime: nonNullableTimeStampFromJson(json['createTime'] as Object),
      id: json['id'] as String,
      manageResourcePolicies: json['manageResourcePolicies'] as bool,
      membershipArn: json['membershipArn'] as String,
      membershipId: json['membershipId'] as String,
      name: json['name'] as String,
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] as Object),
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

/// A summary of the configured audience model association.
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
      arn: json['arn'] as String,
      collaborationArn: json['collaborationArn'] as String,
      collaborationId: json['collaborationId'] as String,
      configuredAudienceModelArn: json['configuredAudienceModelArn'] as String,
      createTime: nonNullableTimeStampFromJson(json['createTime'] as Object),
      id: json['id'] as String,
      membershipArn: json['membershipArn'] as String,
      membershipId: json['membershipId'] as String,
      name: json['name'] as String,
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] as Object),
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

/// A table that has been configured for use in a collaboration.
class ConfiguredTable {
  /// The columns within the underlying Glue table that can be utilized within
  /// collaborations.
  final List<String> allowedColumns;

  /// The analysis method for the configured table. The only valid value is
  /// currently `DIRECT_QUERY`.
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

  /// The Glue table that this configured table represents.
  final TableReference tableReference;

  /// The time the configured table was last updated
  final DateTime updateTime;

  /// A description for the configured table.
  final String? description;

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
  });

  factory ConfiguredTable.fromJson(Map<String, dynamic> json) {
    return ConfiguredTable(
      allowedColumns: (json['allowedColumns'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      analysisMethod: (json['analysisMethod'] as String).toAnalysisMethod(),
      analysisRuleTypes: (json['analysisRuleTypes'] as List)
          .whereNotNull()
          .map((e) => (e as String).toConfiguredTableAnalysisRuleType())
          .toList(),
      arn: json['arn'] as String,
      createTime: nonNullableTimeStampFromJson(json['createTime'] as Object),
      id: json['id'] as String,
      name: json['name'] as String,
      tableReference: TableReference.fromJson(
          json['tableReference'] as Map<String, dynamic>),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] as Object),
      description: json['description'] as String?,
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
    return {
      'allowedColumns': allowedColumns,
      'analysisMethod': analysisMethod.toValue(),
      'analysisRuleTypes': analysisRuleTypes.map((e) => e.toValue()).toList(),
      'arn': arn,
      'createTime': unixTimestampToJson(createTime),
      'id': id,
      'name': name,
      'tableReference': tableReference,
      'updateTime': unixTimestampToJson(updateTime),
      if (description != null) 'description': description,
    };
  }
}

/// A configured table analysis rule, which limits how data for this table can
/// be used.
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
      configuredTableArn: json['configuredTableArn'] as String,
      configuredTableId: json['configuredTableId'] as String,
      createTime: nonNullableTimeStampFromJson(json['createTime'] as Object),
      policy: ConfiguredTableAnalysisRulePolicy.fromJson(
          json['policy'] as Map<String, dynamic>),
      type: (json['type'] as String).toConfiguredTableAnalysisRuleType(),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] as Object),
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
      'type': type.toValue(),
      'updateTime': unixTimestampToJson(updateTime),
    };
  }
}

/// Controls on the query specifications that can be run on a configured table.
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

/// Controls on the query specifications that can be run on a configured table.
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

enum ConfiguredTableAnalysisRuleType {
  aggregation,
  list,
  custom,
}

extension ConfiguredTableAnalysisRuleTypeValueExtension
    on ConfiguredTableAnalysisRuleType {
  String toValue() {
    switch (this) {
      case ConfiguredTableAnalysisRuleType.aggregation:
        return 'AGGREGATION';
      case ConfiguredTableAnalysisRuleType.list:
        return 'LIST';
      case ConfiguredTableAnalysisRuleType.custom:
        return 'CUSTOM';
    }
  }
}

extension ConfiguredTableAnalysisRuleTypeFromString on String {
  ConfiguredTableAnalysisRuleType toConfiguredTableAnalysisRuleType() {
    switch (this) {
      case 'AGGREGATION':
        return ConfiguredTableAnalysisRuleType.aggregation;
      case 'LIST':
        return ConfiguredTableAnalysisRuleType.list;
      case 'CUSTOM':
        return ConfiguredTableAnalysisRuleType.custom;
    }
    throw Exception(
        '$this is not known in enum ConfiguredTableAnalysisRuleType');
  }
}

/// A configured table association links a configured table to a collaboration.
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
    this.description,
  });

  factory ConfiguredTableAssociation.fromJson(Map<String, dynamic> json) {
    return ConfiguredTableAssociation(
      arn: json['arn'] as String,
      configuredTableArn: json['configuredTableArn'] as String,
      configuredTableId: json['configuredTableId'] as String,
      createTime: nonNullableTimeStampFromJson(json['createTime'] as Object),
      id: json['id'] as String,
      membershipArn: json['membershipArn'] as String,
      membershipId: json['membershipId'] as String,
      name: json['name'] as String,
      roleArn: json['roleArn'] as String,
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] as Object),
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
      if (description != null) 'description': description,
    };
  }
}

/// The configured table association summary for the objects listed by the
/// request.
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

  ConfiguredTableAssociationSummary({
    required this.arn,
    required this.configuredTableId,
    required this.createTime,
    required this.id,
    required this.membershipArn,
    required this.membershipId,
    required this.name,
    required this.updateTime,
  });

  factory ConfiguredTableAssociationSummary.fromJson(
      Map<String, dynamic> json) {
    return ConfiguredTableAssociationSummary(
      arn: json['arn'] as String,
      configuredTableId: json['configuredTableId'] as String,
      createTime: nonNullableTimeStampFromJson(json['createTime'] as Object),
      id: json['id'] as String,
      membershipArn: json['membershipArn'] as String,
      membershipId: json['membershipId'] as String,
      name: json['name'] as String,
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] as Object),
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
    return {
      'arn': arn,
      'configuredTableId': configuredTableId,
      'createTime': unixTimestampToJson(createTime),
      'id': id,
      'membershipArn': membershipArn,
      'membershipId': membershipId,
      'name': name,
      'updateTime': unixTimestampToJson(updateTime),
    };
  }
}

/// The configured table summary for the objects listed by the request.
class ConfiguredTableSummary {
  /// The analysis method for the configured tables. The only valid value is
  /// currently `DIRECT_QUERY`.
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

  ConfiguredTableSummary({
    required this.analysisMethod,
    required this.analysisRuleTypes,
    required this.arn,
    required this.createTime,
    required this.id,
    required this.name,
    required this.updateTime,
  });

  factory ConfiguredTableSummary.fromJson(Map<String, dynamic> json) {
    return ConfiguredTableSummary(
      analysisMethod: (json['analysisMethod'] as String).toAnalysisMethod(),
      analysisRuleTypes: (json['analysisRuleTypes'] as List)
          .whereNotNull()
          .map((e) => (e as String).toConfiguredTableAnalysisRuleType())
          .toList(),
      arn: json['arn'] as String,
      createTime: nonNullableTimeStampFromJson(json['createTime'] as Object),
      id: json['id'] as String,
      name: json['name'] as String,
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] as Object),
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
    return {
      'analysisMethod': analysisMethod.toValue(),
      'analysisRuleTypes': analysisRuleTypes.map((e) => e.toValue()).toList(),
      'arn': arn,
      'createTime': unixTimestampToJson(createTime),
      'id': id,
      'name': name,
      'updateTime': unixTimestampToJson(updateTime),
    };
  }
}

class CreateAnalysisTemplateOutput {
  /// The analysis template.
  final AnalysisTemplate analysisTemplate;

  CreateAnalysisTemplateOutput({
    required this.analysisTemplate,
  });

  factory CreateAnalysisTemplateOutput.fromJson(Map<String, dynamic> json) {
    return CreateAnalysisTemplateOutput(
      analysisTemplate: AnalysisTemplate.fromJson(
          json['analysisTemplate'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final analysisTemplate = this.analysisTemplate;
    return {
      'analysisTemplate': analysisTemplate,
    };
  }
}

class CreateCollaborationOutput {
  /// The entire created collaboration object.
  final Collaboration collaboration;

  CreateCollaborationOutput({
    required this.collaboration,
  });

  factory CreateCollaborationOutput.fromJson(Map<String, dynamic> json) {
    return CreateCollaborationOutput(
      collaboration:
          Collaboration.fromJson(json['collaboration'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final collaboration = this.collaboration;
    return {
      'collaboration': collaboration,
    };
  }
}

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
              json['configuredAudienceModelAssociation']
                  as Map<String, dynamic>),
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

class CreateConfiguredTableAnalysisRuleOutput {
  /// The entire created analysis rule.
  final ConfiguredTableAnalysisRule analysisRule;

  CreateConfiguredTableAnalysisRuleOutput({
    required this.analysisRule,
  });

  factory CreateConfiguredTableAnalysisRuleOutput.fromJson(
      Map<String, dynamic> json) {
    return CreateConfiguredTableAnalysisRuleOutput(
      analysisRule: ConfiguredTableAnalysisRule.fromJson(
          json['analysisRule'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final analysisRule = this.analysisRule;
    return {
      'analysisRule': analysisRule,
    };
  }
}

class CreateConfiguredTableAssociationOutput {
  /// The entire configured table association object.
  final ConfiguredTableAssociation configuredTableAssociation;

  CreateConfiguredTableAssociationOutput({
    required this.configuredTableAssociation,
  });

  factory CreateConfiguredTableAssociationOutput.fromJson(
      Map<String, dynamic> json) {
    return CreateConfiguredTableAssociationOutput(
      configuredTableAssociation: ConfiguredTableAssociation.fromJson(
          json['configuredTableAssociation'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final configuredTableAssociation = this.configuredTableAssociation;
    return {
      'configuredTableAssociation': configuredTableAssociation,
    };
  }
}

class CreateConfiguredTableOutput {
  /// The created configured table.
  final ConfiguredTable configuredTable;

  CreateConfiguredTableOutput({
    required this.configuredTable,
  });

  factory CreateConfiguredTableOutput.fromJson(Map<String, dynamic> json) {
    return CreateConfiguredTableOutput(
      configuredTable: ConfiguredTable.fromJson(
          json['configuredTable'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final configuredTable = this.configuredTable;
    return {
      'configuredTable': configuredTable,
    };
  }
}

class CreateMembershipOutput {
  /// The membership that was created.
  final Membership membership;

  CreateMembershipOutput({
    required this.membership,
  });

  factory CreateMembershipOutput.fromJson(Map<String, dynamic> json) {
    return CreateMembershipOutput(
      membership:
          Membership.fromJson(json['membership'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final membership = this.membership;
    return {
      'membership': membership,
    };
  }
}

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
          json['privacyBudgetTemplate'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final privacyBudgetTemplate = this.privacyBudgetTemplate;
    return {
      'privacyBudgetTemplate': privacyBudgetTemplate,
    };
  }
}

/// The settings for client-side encryption for cryptographic computing.
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
      allowCleartext: json['allowCleartext'] as bool,
      allowDuplicates: json['allowDuplicates'] as bool,
      allowJoinsOnColumnsWithDifferentNames:
          json['allowJoinsOnColumnsWithDifferentNames'] as bool,
      preserveNulls: json['preserveNulls'] as bool,
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

class DeleteAnalysisTemplateOutput {
  DeleteAnalysisTemplateOutput();

  factory DeleteAnalysisTemplateOutput.fromJson(Map<String, dynamic> _) {
    return DeleteAnalysisTemplateOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteCollaborationOutput {
  DeleteCollaborationOutput();

  factory DeleteCollaborationOutput.fromJson(Map<String, dynamic> _) {
    return DeleteCollaborationOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

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

/// An empty response that indicates a successful delete.
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

/// The empty output for a successful deletion.
class DeleteConfiguredTableOutput {
  DeleteConfiguredTableOutput();

  factory DeleteConfiguredTableOutput.fromJson(Map<String, dynamic> _) {
    return DeleteConfiguredTableOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteMemberOutput {
  DeleteMemberOutput();

  factory DeleteMemberOutput.fromJson(Map<String, dynamic> _) {
    return DeleteMemberOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteMembershipOutput {
  DeleteMembershipOutput();

  factory DeleteMembershipOutput.fromJson(Map<String, dynamic> _) {
    return DeleteMembershipOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeletePrivacyBudgetTemplateOutput {
  DeletePrivacyBudgetTemplateOutput();

  factory DeletePrivacyBudgetTemplateOutput.fromJson(Map<String, dynamic> _) {
    return DeletePrivacyBudgetTemplateOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum DifferentialPrivacyAggregationType {
  avg,
  count,
  countDistinct,
  sum,
  stddev,
}

extension DifferentialPrivacyAggregationTypeValueExtension
    on DifferentialPrivacyAggregationType {
  String toValue() {
    switch (this) {
      case DifferentialPrivacyAggregationType.avg:
        return 'AVG';
      case DifferentialPrivacyAggregationType.count:
        return 'COUNT';
      case DifferentialPrivacyAggregationType.countDistinct:
        return 'COUNT_DISTINCT';
      case DifferentialPrivacyAggregationType.sum:
        return 'SUM';
      case DifferentialPrivacyAggregationType.stddev:
        return 'STDDEV';
    }
  }
}

extension DifferentialPrivacyAggregationTypeFromString on String {
  DifferentialPrivacyAggregationType toDifferentialPrivacyAggregationType() {
    switch (this) {
      case 'AVG':
        return DifferentialPrivacyAggregationType.avg;
      case 'COUNT':
        return DifferentialPrivacyAggregationType.count;
      case 'COUNT_DISTINCT':
        return DifferentialPrivacyAggregationType.countDistinct;
      case 'SUM':
        return DifferentialPrivacyAggregationType.sum;
      case 'STDDEV':
        return DifferentialPrivacyAggregationType.stddev;
    }
    throw Exception(
        '$this is not known in enum DifferentialPrivacyAggregationType');
  }
}

/// Specifies the name of the column that contains the unique identifier of your
/// users, whose privacy you want to protect.
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
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'name': name,
    };
  }
}

/// Specifies the unique identifier for your users.
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
      columns: (json['columns'] as List)
          .whereNotNull()
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

/// An array that contains the sensitivity parameters.
class DifferentialPrivacyParameters {
  /// Provides the sensitivity parameters that you can use to better understand
  /// the total amount of noise in query results.
  final List<DifferentialPrivacySensitivityParameters> sensitivityParameters;

  DifferentialPrivacyParameters({
    required this.sensitivityParameters,
  });

  factory DifferentialPrivacyParameters.fromJson(Map<String, dynamic> json) {
    return DifferentialPrivacyParameters(
      sensitivityParameters: (json['sensitivityParameters'] as List)
          .whereNotNull()
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

/// Provides an estimate of the number of aggregation functions that the member
/// who can query can run given the epsilon and noise parameters.
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
      maxCount: json['maxCount'] as int,
      type: (json['type'] as String).toDifferentialPrivacyAggregationType(),
    );
  }

  Map<String, dynamic> toJson() {
    final maxCount = this.maxCount;
    final type = this.type;
    return {
      'maxCount': maxCount,
      'type': type.toValue(),
    };
  }
}

/// The epsilon and noise parameters that you want to preview.
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

/// Specifies the configured epsilon value and the utility in terms of total
/// aggregations, as well as the remaining aggregations available.
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
      aggregations: (json['aggregations'] as List)
          .whereNotNull()
          .map((e) => DifferentialPrivacyPrivacyBudgetAggregation.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      epsilon: json['epsilon'] as int,
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

/// Information about the total number of aggregations, as well as the remaining
/// aggregations.
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
      maxCount: json['maxCount'] as int,
      remainingCount: json['remainingCount'] as int,
      type: (json['type'] as String).toDifferentialPrivacyAggregationType(),
    );
  }

  Map<String, dynamic> toJson() {
    final maxCount = this.maxCount;
    final remainingCount = this.remainingCount;
    final type = this.type;
    return {
      'maxCount': maxCount,
      'remainingCount': remainingCount,
      'type': type.toValue(),
    };
  }
}

/// Information about the number of aggregation functions that the member who
/// can query can run given the epsilon and noise parameters.
class DifferentialPrivacyPrivacyImpact {
  /// The number of aggregation functions that you can perform.
  final List<DifferentialPrivacyPreviewAggregation> aggregations;

  DifferentialPrivacyPrivacyImpact({
    required this.aggregations,
  });

  factory DifferentialPrivacyPrivacyImpact.fromJson(Map<String, dynamic> json) {
    return DifferentialPrivacyPrivacyImpact(
      aggregations: (json['aggregations'] as List)
          .whereNotNull()
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

/// Provides the sensitivity parameters.
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
      aggregationExpression: json['aggregationExpression'] as String,
      aggregationType: (json['aggregationType'] as String)
          .toDifferentialPrivacyAggregationType(),
      userContributionLimit: json['userContributionLimit'] as int,
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
      'aggregationType': aggregationType.toValue(),
      'userContributionLimit': userContributionLimit,
      if (maxColumnValue != null) 'maxColumnValue': maxColumnValue,
      if (minColumnValue != null) 'minColumnValue': minColumnValue,
    };
  }
}

/// The epsilon and noise parameter values that you want to use for the
/// differential privacy template.
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

/// The epsilon and noise parameter values that were used for the differential
/// privacy template.
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
      epsilon: json['epsilon'] as int,
      usersNoisePerQuery: json['usersNoisePerQuery'] as int,
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

/// The epsilon and noise parameter values that you want to update in the
/// differential privacy template.
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

enum FilterableMemberStatus {
  invited,
  active,
}

extension FilterableMemberStatusValueExtension on FilterableMemberStatus {
  String toValue() {
    switch (this) {
      case FilterableMemberStatus.invited:
        return 'INVITED';
      case FilterableMemberStatus.active:
        return 'ACTIVE';
    }
  }
}

extension FilterableMemberStatusFromString on String {
  FilterableMemberStatus toFilterableMemberStatus() {
    switch (this) {
      case 'INVITED':
        return FilterableMemberStatus.invited;
      case 'ACTIVE':
        return FilterableMemberStatus.active;
    }
    throw Exception('$this is not known in enum FilterableMemberStatus');
  }
}

class GetAnalysisTemplateOutput {
  /// The analysis template.
  final AnalysisTemplate analysisTemplate;

  GetAnalysisTemplateOutput({
    required this.analysisTemplate,
  });

  factory GetAnalysisTemplateOutput.fromJson(Map<String, dynamic> json) {
    return GetAnalysisTemplateOutput(
      analysisTemplate: AnalysisTemplate.fromJson(
          json['analysisTemplate'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final analysisTemplate = this.analysisTemplate;
    return {
      'analysisTemplate': analysisTemplate,
    };
  }
}

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
          json['collaborationAnalysisTemplate'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final collaborationAnalysisTemplate = this.collaborationAnalysisTemplate;
    return {
      'collaborationAnalysisTemplate': collaborationAnalysisTemplate,
    };
  }
}

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
              json['collaborationConfiguredAudienceModelAssociation']
                  as Map<String, dynamic>),
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

class GetCollaborationOutput {
  /// The entire collaboration for this identifier.
  final Collaboration collaboration;

  GetCollaborationOutput({
    required this.collaboration,
  });

  factory GetCollaborationOutput.fromJson(Map<String, dynamic> json) {
    return GetCollaborationOutput(
      collaboration:
          Collaboration.fromJson(json['collaboration'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final collaboration = this.collaboration;
    return {
      'collaboration': collaboration,
    };
  }
}

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
              json['collaborationPrivacyBudgetTemplate']
                  as Map<String, dynamic>),
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
              json['configuredAudienceModelAssociation']
                  as Map<String, dynamic>),
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
          json['analysisRule'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final analysisRule = this.analysisRule;
    return {
      'analysisRule': analysisRule,
    };
  }
}

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
          json['configuredTableAssociation'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final configuredTableAssociation = this.configuredTableAssociation;
    return {
      'configuredTableAssociation': configuredTableAssociation,
    };
  }
}

class GetConfiguredTableOutput {
  /// The retrieved configured table.
  final ConfiguredTable configuredTable;

  GetConfiguredTableOutput({
    required this.configuredTable,
  });

  factory GetConfiguredTableOutput.fromJson(Map<String, dynamic> json) {
    return GetConfiguredTableOutput(
      configuredTable: ConfiguredTable.fromJson(
          json['configuredTable'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final configuredTable = this.configuredTable;
    return {
      'configuredTable': configuredTable,
    };
  }
}

class GetMembershipOutput {
  /// The membership retrieved for the provided identifier.
  final Membership membership;

  GetMembershipOutput({
    required this.membership,
  });

  factory GetMembershipOutput.fromJson(Map<String, dynamic> json) {
    return GetMembershipOutput(
      membership:
          Membership.fromJson(json['membership'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final membership = this.membership;
    return {
      'membership': membership,
    };
  }
}

class GetPrivacyBudgetTemplateOutput {
  /// Returns the details of the privacy budget template that you requested.
  final PrivacyBudgetTemplate privacyBudgetTemplate;

  GetPrivacyBudgetTemplateOutput({
    required this.privacyBudgetTemplate,
  });

  factory GetPrivacyBudgetTemplateOutput.fromJson(Map<String, dynamic> json) {
    return GetPrivacyBudgetTemplateOutput(
      privacyBudgetTemplate: PrivacyBudgetTemplate.fromJson(
          json['privacyBudgetTemplate'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final privacyBudgetTemplate = this.privacyBudgetTemplate;
    return {
      'privacyBudgetTemplate': privacyBudgetTemplate,
    };
  }
}

class GetProtectedQueryOutput {
  /// The query processing metadata.
  final ProtectedQuery protectedQuery;

  GetProtectedQueryOutput({
    required this.protectedQuery,
  });

  factory GetProtectedQueryOutput.fromJson(Map<String, dynamic> json) {
    return GetProtectedQueryOutput(
      protectedQuery: ProtectedQuery.fromJson(
          json['protectedQuery'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final protectedQuery = this.protectedQuery;
    return {
      'protectedQuery': protectedQuery,
    };
  }
}

class GetSchemaAnalysisRuleOutput {
  /// A specification about how data from the configured table can be used.
  final AnalysisRule analysisRule;

  GetSchemaAnalysisRuleOutput({
    required this.analysisRule,
  });

  factory GetSchemaAnalysisRuleOutput.fromJson(Map<String, dynamic> json) {
    return GetSchemaAnalysisRuleOutput(
      analysisRule:
          AnalysisRule.fromJson(json['analysisRule'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final analysisRule = this.analysisRule;
    return {
      'analysisRule': analysisRule,
    };
  }
}

class GetSchemaOutput {
  /// The entire schema object.
  final Schema schema;

  GetSchemaOutput({
    required this.schema,
  });

  factory GetSchemaOutput.fromJson(Map<String, dynamic> json) {
    return GetSchemaOutput(
      schema: Schema.fromJson(json['schema'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final schema = this.schema;
    return {
      'schema': schema,
    };
  }
}

/// A reference to a table within an Glue data catalog.
class GlueTableReference {
  /// The name of the database the Glue table belongs to.
  final String databaseName;

  /// The name of the Glue table.
  final String tableName;

  GlueTableReference({
    required this.databaseName,
    required this.tableName,
  });

  factory GlueTableReference.fromJson(Map<String, dynamic> json) {
    return GlueTableReference(
      databaseName: json['databaseName'] as String,
      tableName: json['tableName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final databaseName = this.databaseName;
    final tableName = this.tableName;
    return {
      'databaseName': databaseName,
      'tableName': tableName,
    };
  }
}

enum JoinOperator {
  or,
  and,
}

extension JoinOperatorValueExtension on JoinOperator {
  String toValue() {
    switch (this) {
      case JoinOperator.or:
        return 'OR';
      case JoinOperator.and:
        return 'AND';
    }
  }
}

extension JoinOperatorFromString on String {
  JoinOperator toJoinOperator() {
    switch (this) {
      case 'OR':
        return JoinOperator.or;
      case 'AND':
        return JoinOperator.and;
    }
    throw Exception('$this is not known in enum JoinOperator');
  }
}

enum JoinRequiredOption {
  queryRunner,
}

extension JoinRequiredOptionValueExtension on JoinRequiredOption {
  String toValue() {
    switch (this) {
      case JoinRequiredOption.queryRunner:
        return 'QUERY_RUNNER';
    }
  }
}

extension JoinRequiredOptionFromString on String {
  JoinRequiredOption toJoinRequiredOption() {
    switch (this) {
      case 'QUERY_RUNNER':
        return JoinRequiredOption.queryRunner;
    }
    throw Exception('$this is not known in enum JoinRequiredOption');
  }
}

class ListAnalysisTemplatesOutput {
  /// Lists analysis template metadata.
  final List<AnalysisTemplateSummary> analysisTemplateSummaries;

  /// The token value retrieved from a previous call to access the next page of
  /// results.
  final String? nextToken;

  ListAnalysisTemplatesOutput({
    required this.analysisTemplateSummaries,
    this.nextToken,
  });

  factory ListAnalysisTemplatesOutput.fromJson(Map<String, dynamic> json) {
    return ListAnalysisTemplatesOutput(
      analysisTemplateSummaries: (json['analysisTemplateSummaries'] as List)
          .whereNotNull()
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

class ListCollaborationAnalysisTemplatesOutput {
  /// The metadata of the analysis template within a collaboration.
  final List<CollaborationAnalysisTemplateSummary>
      collaborationAnalysisTemplateSummaries;

  /// The token value retrieved from a previous call to access the next page of
  /// results.
  final String? nextToken;

  ListCollaborationAnalysisTemplatesOutput({
    required this.collaborationAnalysisTemplateSummaries,
    this.nextToken,
  });

  factory ListCollaborationAnalysisTemplatesOutput.fromJson(
      Map<String, dynamic> json) {
    return ListCollaborationAnalysisTemplatesOutput(
      collaborationAnalysisTemplateSummaries:
          (json['collaborationAnalysisTemplateSummaries'] as List)
              .whereNotNull()
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

class ListCollaborationConfiguredAudienceModelAssociationsOutput {
  /// The metadata of the configured audience model association within a
  /// collaboration.
  final List<CollaborationConfiguredAudienceModelAssociationSummary>
      collaborationConfiguredAudienceModelAssociationSummaries;

  /// The token value retrieved from a previous call to access the next page of
  /// results.
  final String? nextToken;

  ListCollaborationConfiguredAudienceModelAssociationsOutput({
    required this.collaborationConfiguredAudienceModelAssociationSummaries,
    this.nextToken,
  });

  factory ListCollaborationConfiguredAudienceModelAssociationsOutput.fromJson(
      Map<String, dynamic> json) {
    return ListCollaborationConfiguredAudienceModelAssociationsOutput(
      collaborationConfiguredAudienceModelAssociationSummaries:
          (json['collaborationConfiguredAudienceModelAssociationSummaries']
                  as List)
              .whereNotNull()
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

class ListCollaborationPrivacyBudgetTemplatesOutput {
  /// An array that summarizes the collaboration privacy budget templates. The
  /// summary includes collaboration information, creation information, the
  /// privacy budget type.
  final List<CollaborationPrivacyBudgetTemplateSummary>
      collaborationPrivacyBudgetTemplateSummaries;

  /// The token value retrieved from a previous call to access the next page of
  /// results.
  final String? nextToken;

  ListCollaborationPrivacyBudgetTemplatesOutput({
    required this.collaborationPrivacyBudgetTemplateSummaries,
    this.nextToken,
  });

  factory ListCollaborationPrivacyBudgetTemplatesOutput.fromJson(
      Map<String, dynamic> json) {
    return ListCollaborationPrivacyBudgetTemplatesOutput(
      collaborationPrivacyBudgetTemplateSummaries:
          (json['collaborationPrivacyBudgetTemplateSummaries'] as List)
              .whereNotNull()
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

class ListCollaborationPrivacyBudgetsOutput {
  /// Summaries of the collaboration privacy budgets.
  final List<CollaborationPrivacyBudgetSummary>
      collaborationPrivacyBudgetSummaries;

  /// The token value retrieved from a previous call to access the next page of
  /// results.
  final String? nextToken;

  ListCollaborationPrivacyBudgetsOutput({
    required this.collaborationPrivacyBudgetSummaries,
    this.nextToken,
  });

  factory ListCollaborationPrivacyBudgetsOutput.fromJson(
      Map<String, dynamic> json) {
    return ListCollaborationPrivacyBudgetsOutput(
      collaborationPrivacyBudgetSummaries:
          (json['collaborationPrivacyBudgetSummaries'] as List)
              .whereNotNull()
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

class ListCollaborationsOutput {
  /// The list of collaborations.
  final List<CollaborationSummary> collaborationList;

  /// The token value retrieved from a previous call to access the next page of
  /// results.
  final String? nextToken;

  ListCollaborationsOutput({
    required this.collaborationList,
    this.nextToken,
  });

  factory ListCollaborationsOutput.fromJson(Map<String, dynamic> json) {
    return ListCollaborationsOutput(
      collaborationList: (json['collaborationList'] as List)
          .whereNotNull()
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
          (json['configuredAudienceModelAssociationSummaries'] as List)
              .whereNotNull()
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

class ListConfiguredTableAssociationsOutput {
  /// The retrieved list of configured table associations.
  final List<ConfiguredTableAssociationSummary>
      configuredTableAssociationSummaries;

  /// The token value retrieved from a previous call to access the next page of
  /// results.
  final String? nextToken;

  ListConfiguredTableAssociationsOutput({
    required this.configuredTableAssociationSummaries,
    this.nextToken,
  });

  factory ListConfiguredTableAssociationsOutput.fromJson(
      Map<String, dynamic> json) {
    return ListConfiguredTableAssociationsOutput(
      configuredTableAssociationSummaries:
          (json['configuredTableAssociationSummaries'] as List)
              .whereNotNull()
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

class ListConfiguredTablesOutput {
  /// The configured tables listed by the request.
  final List<ConfiguredTableSummary> configuredTableSummaries;

  /// The token value retrieved from a previous call to access the next page of
  /// results.
  final String? nextToken;

  ListConfiguredTablesOutput({
    required this.configuredTableSummaries,
    this.nextToken,
  });

  factory ListConfiguredTablesOutput.fromJson(Map<String, dynamic> json) {
    return ListConfiguredTablesOutput(
      configuredTableSummaries: (json['configuredTableSummaries'] as List)
          .whereNotNull()
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

class ListMembersOutput {
  /// The list of members returned by the ListMembers operation.
  final List<MemberSummary> memberSummaries;

  /// The token value retrieved from a previous call to access the next page of
  /// results.
  final String? nextToken;

  ListMembersOutput({
    required this.memberSummaries,
    this.nextToken,
  });

  factory ListMembersOutput.fromJson(Map<String, dynamic> json) {
    return ListMembersOutput(
      memberSummaries: (json['memberSummaries'] as List)
          .whereNotNull()
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

class ListMembershipsOutput {
  /// The list of memberships returned from the ListMemberships operation.
  final List<MembershipSummary> membershipSummaries;

  /// The token value retrieved from a previous call to access the next page of
  /// results.
  final String? nextToken;

  ListMembershipsOutput({
    required this.membershipSummaries,
    this.nextToken,
  });

  factory ListMembershipsOutput.fromJson(Map<String, dynamic> json) {
    return ListMembershipsOutput(
      membershipSummaries: (json['membershipSummaries'] as List)
          .whereNotNull()
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

class ListPrivacyBudgetTemplatesOutput {
  /// An array that summarizes the privacy budget templates. The summary includes
  /// collaboration information, creation information, and privacy budget type.
  final List<PrivacyBudgetTemplateSummary> privacyBudgetTemplateSummaries;

  /// The token value retrieved from a previous call to access the next page of
  /// results.
  final String? nextToken;

  ListPrivacyBudgetTemplatesOutput({
    required this.privacyBudgetTemplateSummaries,
    this.nextToken,
  });

  factory ListPrivacyBudgetTemplatesOutput.fromJson(Map<String, dynamic> json) {
    return ListPrivacyBudgetTemplatesOutput(
      privacyBudgetTemplateSummaries: (json['privacyBudgetTemplateSummaries']
              as List)
          .whereNotNull()
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

class ListPrivacyBudgetsOutput {
  /// An array that summarizes the privacy budgets. The summary includes
  /// collaboration information, membership information, privacy budget template
  /// information, and privacy budget details.
  final List<PrivacyBudgetSummary> privacyBudgetSummaries;

  /// The token value retrieved from a previous call to access the next page of
  /// results.
  final String? nextToken;

  ListPrivacyBudgetsOutput({
    required this.privacyBudgetSummaries,
    this.nextToken,
  });

  factory ListPrivacyBudgetsOutput.fromJson(Map<String, dynamic> json) {
    return ListPrivacyBudgetsOutput(
      privacyBudgetSummaries: (json['privacyBudgetSummaries'] as List)
          .whereNotNull()
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

class ListProtectedQueriesOutput {
  /// A list of protected queries.
  final List<ProtectedQuerySummary> protectedQueries;

  /// The token value retrieved from a previous call to access the next page of
  /// results.
  final String? nextToken;

  ListProtectedQueriesOutput({
    required this.protectedQueries,
    this.nextToken,
  });

  factory ListProtectedQueriesOutput.fromJson(Map<String, dynamic> json) {
    return ListProtectedQueriesOutput(
      protectedQueries: (json['protectedQueries'] as List)
          .whereNotNull()
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

class ListSchemasOutput {
  /// The retrieved list of schemas.
  final List<SchemaSummary> schemaSummaries;

  /// The token value retrieved from a previous call to access the next page of
  /// results.
  final String? nextToken;

  ListSchemasOutput({
    required this.schemaSummaries,
    this.nextToken,
  });

  factory ListSchemasOutput.fromJson(Map<String, dynamic> json) {
    return ListSchemasOutput(
      schemaSummaries: (json['schemaSummaries'] as List)
          .whereNotNull()
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

class ListTagsForResourceOutput {
  /// A map of objects specifying each key name and value.
  final Map<String, String> tags;

  ListTagsForResourceOutput({
    required this.tags,
  });

  factory ListTagsForResourceOutput.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceOutput(
      tags: (json['tags'] as Map<String, dynamic>)
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

enum MemberAbility {
  canQuery,
  canReceiveResults,
}

extension MemberAbilityValueExtension on MemberAbility {
  String toValue() {
    switch (this) {
      case MemberAbility.canQuery:
        return 'CAN_QUERY';
      case MemberAbility.canReceiveResults:
        return 'CAN_RECEIVE_RESULTS';
    }
  }
}

extension MemberAbilityFromString on String {
  MemberAbility toMemberAbility() {
    switch (this) {
      case 'CAN_QUERY':
        return MemberAbility.canQuery;
      case 'CAN_RECEIVE_RESULTS':
        return MemberAbility.canReceiveResults;
    }
    throw Exception('$this is not known in enum MemberAbility');
  }
}

/// Basic metadata used to construct a new member.
class MemberSpecification {
  /// The identifier used to reference members of the collaboration. Currently
  /// only supports Amazon Web Services account ID.
  final String accountId;

  /// The member's display name.
  final String displayName;

  /// The abilities granted to the collaboration member.
  final List<MemberAbility> memberAbilities;

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
    this.paymentConfiguration,
  });

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final displayName = this.displayName;
    final memberAbilities = this.memberAbilities;
    final paymentConfiguration = this.paymentConfiguration;
    return {
      'accountId': accountId,
      'displayName': displayName,
      'memberAbilities': memberAbilities.map((e) => e.toValue()).toList(),
      if (paymentConfiguration != null)
        'paymentConfiguration': paymentConfiguration,
    };
  }
}

enum MemberStatus {
  invited,
  active,
  left,
  removed,
}

extension MemberStatusValueExtension on MemberStatus {
  String toValue() {
    switch (this) {
      case MemberStatus.invited:
        return 'INVITED';
      case MemberStatus.active:
        return 'ACTIVE';
      case MemberStatus.left:
        return 'LEFT';
      case MemberStatus.removed:
        return 'REMOVED';
    }
  }
}

extension MemberStatusFromString on String {
  MemberStatus toMemberStatus() {
    switch (this) {
      case 'INVITED':
        return MemberStatus.invited;
      case 'ACTIVE':
        return MemberStatus.active;
      case 'LEFT':
        return MemberStatus.left;
      case 'REMOVED':
        return MemberStatus.removed;
    }
    throw Exception('$this is not known in enum MemberStatus');
  }
}

/// The member object listed by the request.
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
  });

  factory MemberSummary.fromJson(Map<String, dynamic> json) {
    return MemberSummary(
      abilities: (json['abilities'] as List)
          .whereNotNull()
          .map((e) => (e as String).toMemberAbility())
          .toList(),
      accountId: json['accountId'] as String,
      createTime: nonNullableTimeStampFromJson(json['createTime'] as Object),
      displayName: json['displayName'] as String,
      paymentConfiguration: PaymentConfiguration.fromJson(
          json['paymentConfiguration'] as Map<String, dynamic>),
      status: (json['status'] as String).toMemberStatus(),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] as Object),
      membershipArn: json['membershipArn'] as String?,
      membershipId: json['membershipId'] as String?,
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
    return {
      'abilities': abilities.map((e) => e.toValue()).toList(),
      'accountId': accountId,
      'createTime': unixTimestampToJson(createTime),
      'displayName': displayName,
      'paymentConfiguration': paymentConfiguration,
      'status': status.toValue(),
      'updateTime': unixTimestampToJson(updateTime),
      if (membershipArn != null) 'membershipArn': membershipArn,
      if (membershipId != null) 'membershipId': membershipId,
    };
  }
}

/// The membership object.
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
  final MembershipQueryLogStatus queryLogStatus;

  /// The status of the membership.
  final MembershipStatus status;

  /// The time the membership metadata was last updated.
  final DateTime updateTime;

  /// The default protected query result configuration as specified by the member
  /// who can receive results.
  final MembershipProtectedQueryResultConfiguration? defaultResultConfiguration;

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
    this.defaultResultConfiguration,
  });

  factory Membership.fromJson(Map<String, dynamic> json) {
    return Membership(
      arn: json['arn'] as String,
      collaborationArn: json['collaborationArn'] as String,
      collaborationCreatorAccountId:
          json['collaborationCreatorAccountId'] as String,
      collaborationCreatorDisplayName:
          json['collaborationCreatorDisplayName'] as String,
      collaborationId: json['collaborationId'] as String,
      collaborationName: json['collaborationName'] as String,
      createTime: nonNullableTimeStampFromJson(json['createTime'] as Object),
      id: json['id'] as String,
      memberAbilities: (json['memberAbilities'] as List)
          .whereNotNull()
          .map((e) => (e as String).toMemberAbility())
          .toList(),
      paymentConfiguration: MembershipPaymentConfiguration.fromJson(
          json['paymentConfiguration'] as Map<String, dynamic>),
      queryLogStatus:
          (json['queryLogStatus'] as String).toMembershipQueryLogStatus(),
      status: (json['status'] as String).toMembershipStatus(),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] as Object),
      defaultResultConfiguration: json['defaultResultConfiguration'] != null
          ? MembershipProtectedQueryResultConfiguration.fromJson(
              json['defaultResultConfiguration'] as Map<String, dynamic>)
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
    final defaultResultConfiguration = this.defaultResultConfiguration;
    return {
      'arn': arn,
      'collaborationArn': collaborationArn,
      'collaborationCreatorAccountId': collaborationCreatorAccountId,
      'collaborationCreatorDisplayName': collaborationCreatorDisplayName,
      'collaborationId': collaborationId,
      'collaborationName': collaborationName,
      'createTime': unixTimestampToJson(createTime),
      'id': id,
      'memberAbilities': memberAbilities.map((e) => e.toValue()).toList(),
      'paymentConfiguration': paymentConfiguration,
      'queryLogStatus': queryLogStatus.toValue(),
      'status': status.toValue(),
      'updateTime': unixTimestampToJson(updateTime),
      if (defaultResultConfiguration != null)
        'defaultResultConfiguration': defaultResultConfiguration,
    };
  }
}

/// An object representing the payment responsibilities accepted by the
/// collaboration member.
class MembershipPaymentConfiguration {
  /// The payment responsibilities accepted by the collaboration member for query
  /// compute costs.
  final MembershipQueryComputePaymentConfig queryCompute;

  MembershipPaymentConfiguration({
    required this.queryCompute,
  });

  factory MembershipPaymentConfiguration.fromJson(Map<String, dynamic> json) {
    return MembershipPaymentConfiguration(
      queryCompute: MembershipQueryComputePaymentConfig.fromJson(
          json['queryCompute'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final queryCompute = this.queryCompute;
    return {
      'queryCompute': queryCompute,
    };
  }
}

/// Contains configurations for protected query results.
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

/// Contains configurations for protected query results.
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
          json['outputConfiguration'] as Map<String, dynamic>),
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

/// An object representing the payment responsibilities accepted by the
/// collaboration member for query compute costs.
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
      isResponsible: json['isResponsible'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final isResponsible = this.isResponsible;
    return {
      'isResponsible': isResponsible,
    };
  }
}

enum MembershipQueryLogStatus {
  enabled,
  disabled,
}

extension MembershipQueryLogStatusValueExtension on MembershipQueryLogStatus {
  String toValue() {
    switch (this) {
      case MembershipQueryLogStatus.enabled:
        return 'ENABLED';
      case MembershipQueryLogStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension MembershipQueryLogStatusFromString on String {
  MembershipQueryLogStatus toMembershipQueryLogStatus() {
    switch (this) {
      case 'ENABLED':
        return MembershipQueryLogStatus.enabled;
      case 'DISABLED':
        return MembershipQueryLogStatus.disabled;
    }
    throw Exception('$this is not known in enum MembershipQueryLogStatus');
  }
}

enum MembershipStatus {
  active,
  removed,
  collaborationDeleted,
}

extension MembershipStatusValueExtension on MembershipStatus {
  String toValue() {
    switch (this) {
      case MembershipStatus.active:
        return 'ACTIVE';
      case MembershipStatus.removed:
        return 'REMOVED';
      case MembershipStatus.collaborationDeleted:
        return 'COLLABORATION_DELETED';
    }
  }
}

extension MembershipStatusFromString on String {
  MembershipStatus toMembershipStatus() {
    switch (this) {
      case 'ACTIVE':
        return MembershipStatus.active;
      case 'REMOVED':
        return MembershipStatus.removed;
      case 'COLLABORATION_DELETED':
        return MembershipStatus.collaborationDeleted;
    }
    throw Exception('$this is not known in enum MembershipStatus');
  }
}

/// The membership object listed by the request.
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
  });

  factory MembershipSummary.fromJson(Map<String, dynamic> json) {
    return MembershipSummary(
      arn: json['arn'] as String,
      collaborationArn: json['collaborationArn'] as String,
      collaborationCreatorAccountId:
          json['collaborationCreatorAccountId'] as String,
      collaborationCreatorDisplayName:
          json['collaborationCreatorDisplayName'] as String,
      collaborationId: json['collaborationId'] as String,
      collaborationName: json['collaborationName'] as String,
      createTime: nonNullableTimeStampFromJson(json['createTime'] as Object),
      id: json['id'] as String,
      memberAbilities: (json['memberAbilities'] as List)
          .whereNotNull()
          .map((e) => (e as String).toMemberAbility())
          .toList(),
      paymentConfiguration: MembershipPaymentConfiguration.fromJson(
          json['paymentConfiguration'] as Map<String, dynamic>),
      status: (json['status'] as String).toMembershipStatus(),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] as Object),
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
    return {
      'arn': arn,
      'collaborationArn': collaborationArn,
      'collaborationCreatorAccountId': collaborationCreatorAccountId,
      'collaborationCreatorDisplayName': collaborationCreatorDisplayName,
      'collaborationId': collaborationId,
      'collaborationName': collaborationName,
      'createTime': unixTimestampToJson(createTime),
      'id': id,
      'memberAbilities': memberAbilities.map((e) => e.toValue()).toList(),
      'paymentConfiguration': paymentConfiguration,
      'status': status.toValue(),
      'updateTime': unixTimestampToJson(updateTime),
    };
  }
}

enum ParameterType {
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
}

extension ParameterTypeValueExtension on ParameterType {
  String toValue() {
    switch (this) {
      case ParameterType.smallint:
        return 'SMALLINT';
      case ParameterType.integer:
        return 'INTEGER';
      case ParameterType.bigint:
        return 'BIGINT';
      case ParameterType.decimal:
        return 'DECIMAL';
      case ParameterType.real:
        return 'REAL';
      case ParameterType.doublePrecision:
        return 'DOUBLE_PRECISION';
      case ParameterType.boolean:
        return 'BOOLEAN';
      case ParameterType.char:
        return 'CHAR';
      case ParameterType.varchar:
        return 'VARCHAR';
      case ParameterType.date:
        return 'DATE';
      case ParameterType.timestamp:
        return 'TIMESTAMP';
      case ParameterType.timestamptz:
        return 'TIMESTAMPTZ';
      case ParameterType.time:
        return 'TIME';
      case ParameterType.timetz:
        return 'TIMETZ';
      case ParameterType.varbyte:
        return 'VARBYTE';
    }
  }
}

extension ParameterTypeFromString on String {
  ParameterType toParameterType() {
    switch (this) {
      case 'SMALLINT':
        return ParameterType.smallint;
      case 'INTEGER':
        return ParameterType.integer;
      case 'BIGINT':
        return ParameterType.bigint;
      case 'DECIMAL':
        return ParameterType.decimal;
      case 'REAL':
        return ParameterType.real;
      case 'DOUBLE_PRECISION':
        return ParameterType.doublePrecision;
      case 'BOOLEAN':
        return ParameterType.boolean;
      case 'CHAR':
        return ParameterType.char;
      case 'VARCHAR':
        return ParameterType.varchar;
      case 'DATE':
        return ParameterType.date;
      case 'TIMESTAMP':
        return ParameterType.timestamp;
      case 'TIMESTAMPTZ':
        return ParameterType.timestamptz;
      case 'TIME':
        return ParameterType.time;
      case 'TIMETZ':
        return ParameterType.timetz;
      case 'VARBYTE':
        return ParameterType.varbyte;
    }
    throw Exception('$this is not known in enum ParameterType');
  }
}

/// An object representing the collaboration member's payment responsibilities
/// set by the collaboration creator.
class PaymentConfiguration {
  /// The collaboration member's payment responsibilities set by the collaboration
  /// creator for query compute costs.
  final QueryComputePaymentConfig queryCompute;

  PaymentConfiguration({
    required this.queryCompute,
  });

  factory PaymentConfiguration.fromJson(Map<String, dynamic> json) {
    return PaymentConfiguration(
      queryCompute: QueryComputePaymentConfig.fromJson(
          json['queryCompute'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final queryCompute = this.queryCompute;
    return {
      'queryCompute': queryCompute,
    };
  }
}

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
      privacyImpact:
          PrivacyImpact.fromJson(json['privacyImpact'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final privacyImpact = this.privacyImpact;
    return {
      'privacyImpact': privacyImpact,
    };
  }
}

/// Specifies the updated epsilon and noise parameters to preview. The preview
/// allows you to see how the maximum number of each type of aggregation
/// function would change with the new parameters.
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

/// The epsilon parameter value and number of each aggregation function that you
/// can perform.
class PrivacyBudget {
  /// An object that specifies the epsilon parameter and the utility in terms of
  /// total aggregations, as well as the remaining aggregations available.
  final DifferentialPrivacyPrivacyBudget? differentialPrivacy;

  PrivacyBudget({
    this.differentialPrivacy,
  });

  factory PrivacyBudget.fromJson(Map<String, dynamic> json) {
    return PrivacyBudget(
      differentialPrivacy: json['differentialPrivacy'] != null
          ? DifferentialPrivacyPrivacyBudget.fromJson(
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

/// An array that summaries the specified privacy budget. This summary includes
/// collaboration information, creation information, membership information, and
/// privacy budget information.
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
      budget: PrivacyBudget.fromJson(json['budget'] as Map<String, dynamic>),
      collaborationArn: json['collaborationArn'] as String,
      collaborationId: json['collaborationId'] as String,
      createTime: nonNullableTimeStampFromJson(json['createTime'] as Object),
      id: json['id'] as String,
      membershipArn: json['membershipArn'] as String,
      membershipId: json['membershipId'] as String,
      privacyBudgetTemplateArn: json['privacyBudgetTemplateArn'] as String,
      privacyBudgetTemplateId: json['privacyBudgetTemplateId'] as String,
      type: (json['type'] as String).toPrivacyBudgetType(),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] as Object),
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
      'type': type.toValue(),
      'updateTime': unixTimestampToJson(updateTime),
    };
  }
}

/// An object that defines the privacy budget template.
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

  /// Specifies the epislon and noise parameters for the privacy budget template.
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
      arn: json['arn'] as String,
      autoRefresh:
          (json['autoRefresh'] as String).toPrivacyBudgetTemplateAutoRefresh(),
      collaborationArn: json['collaborationArn'] as String,
      collaborationId: json['collaborationId'] as String,
      createTime: nonNullableTimeStampFromJson(json['createTime'] as Object),
      id: json['id'] as String,
      membershipArn: json['membershipArn'] as String,
      membershipId: json['membershipId'] as String,
      parameters: PrivacyBudgetTemplateParametersOutput.fromJson(
          json['parameters'] as Map<String, dynamic>),
      privacyBudgetType:
          (json['privacyBudgetType'] as String).toPrivacyBudgetType(),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] as Object),
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
      'autoRefresh': autoRefresh.toValue(),
      'collaborationArn': collaborationArn,
      'collaborationId': collaborationId,
      'createTime': unixTimestampToJson(createTime),
      'id': id,
      'membershipArn': membershipArn,
      'membershipId': membershipId,
      'parameters': parameters,
      'privacyBudgetType': privacyBudgetType.toValue(),
      'updateTime': unixTimestampToJson(updateTime),
    };
  }
}

enum PrivacyBudgetTemplateAutoRefresh {
  calendarMonth,
  none,
}

extension PrivacyBudgetTemplateAutoRefreshValueExtension
    on PrivacyBudgetTemplateAutoRefresh {
  String toValue() {
    switch (this) {
      case PrivacyBudgetTemplateAutoRefresh.calendarMonth:
        return 'CALENDAR_MONTH';
      case PrivacyBudgetTemplateAutoRefresh.none:
        return 'NONE';
    }
  }
}

extension PrivacyBudgetTemplateAutoRefreshFromString on String {
  PrivacyBudgetTemplateAutoRefresh toPrivacyBudgetTemplateAutoRefresh() {
    switch (this) {
      case 'CALENDAR_MONTH':
        return PrivacyBudgetTemplateAutoRefresh.calendarMonth;
      case 'NONE':
        return PrivacyBudgetTemplateAutoRefresh.none;
    }
    throw Exception(
        '$this is not known in enum PrivacyBudgetTemplateAutoRefresh');
  }
}

/// The epsilon and noise parameters that you want to use for the privacy budget
/// template.
class PrivacyBudgetTemplateParametersInput {
  /// An object that specifies the epsilon and noise parameters.
  final DifferentialPrivacyTemplateParametersInput? differentialPrivacy;

  PrivacyBudgetTemplateParametersInput({
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

/// The epsilon and noise parameters that were used in the privacy budget
/// template.
class PrivacyBudgetTemplateParametersOutput {
  /// The epsilon and noise parameters.
  final DifferentialPrivacyTemplateParametersOutput? differentialPrivacy;

  PrivacyBudgetTemplateParametersOutput({
    this.differentialPrivacy,
  });

  factory PrivacyBudgetTemplateParametersOutput.fromJson(
      Map<String, dynamic> json) {
    return PrivacyBudgetTemplateParametersOutput(
      differentialPrivacy: json['differentialPrivacy'] != null
          ? DifferentialPrivacyTemplateParametersOutput.fromJson(
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

/// A summary of the privacy budget template. The summary includes membership
/// information, collaboration information, and creation information.
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
      arn: json['arn'] as String,
      collaborationArn: json['collaborationArn'] as String,
      collaborationId: json['collaborationId'] as String,
      createTime: nonNullableTimeStampFromJson(json['createTime'] as Object),
      id: json['id'] as String,
      membershipArn: json['membershipArn'] as String,
      membershipId: json['membershipId'] as String,
      privacyBudgetType:
          (json['privacyBudgetType'] as String).toPrivacyBudgetType(),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] as Object),
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
      'privacyBudgetType': privacyBudgetType.toValue(),
      'updateTime': unixTimestampToJson(updateTime),
    };
  }
}

/// The epsilon and noise parameters that you want to update in the privacy
/// budget template.
class PrivacyBudgetTemplateUpdateParameters {
  /// An object that specifies the new values for the epsilon and noise
  /// parameters.
  final DifferentialPrivacyTemplateUpdateParameters? differentialPrivacy;

  PrivacyBudgetTemplateUpdateParameters({
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

enum PrivacyBudgetType {
  differentialPrivacy,
}

extension PrivacyBudgetTypeValueExtension on PrivacyBudgetType {
  String toValue() {
    switch (this) {
      case PrivacyBudgetType.differentialPrivacy:
        return 'DIFFERENTIAL_PRIVACY';
    }
  }
}

extension PrivacyBudgetTypeFromString on String {
  PrivacyBudgetType toPrivacyBudgetType() {
    switch (this) {
      case 'DIFFERENTIAL_PRIVACY':
        return PrivacyBudgetType.differentialPrivacy;
    }
    throw Exception('$this is not known in enum PrivacyBudgetType');
  }
}

/// Provides an estimate of the number of aggregation functions that the member
/// who can query can run given the epsilon and noise parameters.
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

/// The parameters for an Clean Rooms protected query.
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

  /// The sensitivity parameters of the differential privacy results of the
  /// protected query.
  final DifferentialPrivacyParameters? differentialPrivacy;

  /// An error thrown by the protected query.
  final ProtectedQueryError? error;

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
    this.differentialPrivacy,
    this.error,
    this.result,
    this.resultConfiguration,
    this.sqlParameters,
    this.statistics,
  });

  factory ProtectedQuery.fromJson(Map<String, dynamic> json) {
    return ProtectedQuery(
      createTime: nonNullableTimeStampFromJson(json['createTime'] as Object),
      id: json['id'] as String,
      membershipArn: json['membershipArn'] as String,
      membershipId: json['membershipId'] as String,
      status: (json['status'] as String).toProtectedQueryStatus(),
      differentialPrivacy: json['differentialPrivacy'] != null
          ? DifferentialPrivacyParameters.fromJson(
              json['differentialPrivacy'] as Map<String, dynamic>)
          : null,
      error: json['error'] != null
          ? ProtectedQueryError.fromJson(json['error'] as Map<String, dynamic>)
          : null,
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
    final differentialPrivacy = this.differentialPrivacy;
    final error = this.error;
    final result = this.result;
    final resultConfiguration = this.resultConfiguration;
    final sqlParameters = this.sqlParameters;
    final statistics = this.statistics;
    return {
      'createTime': unixTimestampToJson(createTime),
      'id': id,
      'membershipArn': membershipArn,
      'membershipId': membershipId,
      'status': status.toValue(),
      if (differentialPrivacy != null)
        'differentialPrivacy': differentialPrivacy,
      if (error != null) 'error': error,
      if (result != null) 'result': result,
      if (resultConfiguration != null)
        'resultConfiguration': resultConfiguration,
      if (sqlParameters != null) 'sqlParameters': sqlParameters,
      if (statistics != null) 'statistics': statistics,
    };
  }
}

/// Details of errors thrown by the protected query.
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
      code: json['code'] as String,
      message: json['message'] as String,
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

/// Contains details about the protected query output.
class ProtectedQueryOutput {
  /// The list of member Amazon Web Services account(s) that received the results
  /// of the query.
  final List<ProtectedQuerySingleMemberOutput>? memberList;

  /// If present, the output for a protected query with an `S3` output type.
  final ProtectedQueryS3Output? s3;

  ProtectedQueryOutput({
    this.memberList,
    this.s3,
  });

  factory ProtectedQueryOutput.fromJson(Map<String, dynamic> json) {
    return ProtectedQueryOutput(
      memberList: (json['memberList'] as List?)
          ?.whereNotNull()
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

/// Contains configuration details for protected query output.
class ProtectedQueryOutputConfiguration {
  /// Required configuration for a protected query with an `S3` output type.
  final ProtectedQueryS3OutputConfiguration? s3;

  ProtectedQueryOutputConfiguration({
    this.s3,
  });

  factory ProtectedQueryOutputConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ProtectedQueryOutputConfiguration(
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

/// Details about the query results.
class ProtectedQueryResult {
  /// The output of the protected query.
  final ProtectedQueryOutput output;

  ProtectedQueryResult({
    required this.output,
  });

  factory ProtectedQueryResult.fromJson(Map<String, dynamic> json) {
    return ProtectedQueryResult(
      output:
          ProtectedQueryOutput.fromJson(json['output'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final output = this.output;
    return {
      'output': output,
    };
  }
}

/// Contains configurations for protected query results.
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
          json['outputConfiguration'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final outputConfiguration = this.outputConfiguration;
    return {
      'outputConfiguration': outputConfiguration,
    };
  }
}

/// Contains output information for protected queries with an S3 output type.
class ProtectedQueryS3Output {
  /// The S3 location of the result.
  final String location;

  ProtectedQueryS3Output({
    required this.location,
  });

  factory ProtectedQueryS3Output.fromJson(Map<String, dynamic> json) {
    return ProtectedQueryS3Output(
      location: json['location'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final location = this.location;
    return {
      'location': location,
    };
  }
}

/// Contains the configuration to write the query results to S3.
class ProtectedQueryS3OutputConfiguration {
  /// The S3 bucket to unload the protected query results.
  final String bucket;

  /// Intended file format of the result.
  final ResultFormat resultFormat;

  /// The S3 prefix to unload the protected query results.
  final String? keyPrefix;

  ProtectedQueryS3OutputConfiguration({
    required this.bucket,
    required this.resultFormat,
    this.keyPrefix,
  });

  factory ProtectedQueryS3OutputConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ProtectedQueryS3OutputConfiguration(
      bucket: json['bucket'] as String,
      resultFormat: (json['resultFormat'] as String).toResultFormat(),
      keyPrefix: json['keyPrefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final resultFormat = this.resultFormat;
    final keyPrefix = this.keyPrefix;
    return {
      'bucket': bucket,
      'resultFormat': resultFormat.toValue(),
      if (keyPrefix != null) 'keyPrefix': keyPrefix,
    };
  }
}

/// The parameters for the SQL type Protected Query.
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

/// Details about the member who received the query result.
class ProtectedQuerySingleMemberOutput {
  /// The Amazon Web Services account ID of the member in the collaboration who
  /// can receive results for the query.
  final String accountId;

  ProtectedQuerySingleMemberOutput({
    required this.accountId,
  });

  factory ProtectedQuerySingleMemberOutput.fromJson(Map<String, dynamic> json) {
    return ProtectedQuerySingleMemberOutput(
      accountId: json['accountId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    return {
      'accountId': accountId,
    };
  }
}

/// Contains statistics about the execution of the protected query.
class ProtectedQueryStatistics {
  /// The duration of the Protected Query, from creation until query completion.
  final int? totalDurationInMillis;

  ProtectedQueryStatistics({
    this.totalDurationInMillis,
  });

  factory ProtectedQueryStatistics.fromJson(Map<String, dynamic> json) {
    return ProtectedQueryStatistics(
      totalDurationInMillis: json['totalDurationInMillis'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final totalDurationInMillis = this.totalDurationInMillis;
    return {
      if (totalDurationInMillis != null)
        'totalDurationInMillis': totalDurationInMillis,
    };
  }
}

enum ProtectedQueryStatus {
  submitted,
  started,
  cancelled,
  cancelling,
  failed,
  success,
  timedOut,
}

extension ProtectedQueryStatusValueExtension on ProtectedQueryStatus {
  String toValue() {
    switch (this) {
      case ProtectedQueryStatus.submitted:
        return 'SUBMITTED';
      case ProtectedQueryStatus.started:
        return 'STARTED';
      case ProtectedQueryStatus.cancelled:
        return 'CANCELLED';
      case ProtectedQueryStatus.cancelling:
        return 'CANCELLING';
      case ProtectedQueryStatus.failed:
        return 'FAILED';
      case ProtectedQueryStatus.success:
        return 'SUCCESS';
      case ProtectedQueryStatus.timedOut:
        return 'TIMED_OUT';
    }
  }
}

extension ProtectedQueryStatusFromString on String {
  ProtectedQueryStatus toProtectedQueryStatus() {
    switch (this) {
      case 'SUBMITTED':
        return ProtectedQueryStatus.submitted;
      case 'STARTED':
        return ProtectedQueryStatus.started;
      case 'CANCELLED':
        return ProtectedQueryStatus.cancelled;
      case 'CANCELLING':
        return ProtectedQueryStatus.cancelling;
      case 'FAILED':
        return ProtectedQueryStatus.failed;
      case 'SUCCESS':
        return ProtectedQueryStatus.success;
      case 'TIMED_OUT':
        return ProtectedQueryStatus.timedOut;
    }
    throw Exception('$this is not known in enum ProtectedQueryStatus');
  }
}

/// The protected query summary for the objects listed by the request.
class ProtectedQuerySummary {
  /// The time the protected query was created.
  final DateTime createTime;

  /// The unique ID of the protected query.
  final String id;

  /// The unique ARN for the membership that initiated the protected query.
  final String membershipArn;

  /// The unique ID for the membership that initiated the protected query.
  final String membershipId;

  /// The status of the protected query. Value values are `SUBMITTED`, `STARTED`,
  /// `CANCELLED`, `CANCELLING`, `FAILED`, `SUCCESS`, `TIMED_OUT`.
  final ProtectedQueryStatus status;

  ProtectedQuerySummary({
    required this.createTime,
    required this.id,
    required this.membershipArn,
    required this.membershipId,
    required this.status,
  });

  factory ProtectedQuerySummary.fromJson(Map<String, dynamic> json) {
    return ProtectedQuerySummary(
      createTime: nonNullableTimeStampFromJson(json['createTime'] as Object),
      id: json['id'] as String,
      membershipArn: json['membershipArn'] as String,
      membershipId: json['membershipId'] as String,
      status: (json['status'] as String).toProtectedQueryStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final id = this.id;
    final membershipArn = this.membershipArn;
    final membershipId = this.membershipId;
    final status = this.status;
    return {
      'createTime': unixTimestampToJson(createTime),
      'id': id,
      'membershipArn': membershipArn,
      'membershipId': membershipId,
      'status': status.toValue(),
    };
  }
}

enum ProtectedQueryType {
  sql,
}

extension ProtectedQueryTypeValueExtension on ProtectedQueryType {
  String toValue() {
    switch (this) {
      case ProtectedQueryType.sql:
        return 'SQL';
    }
  }
}

extension ProtectedQueryTypeFromString on String {
  ProtectedQueryType toProtectedQueryType() {
    switch (this) {
      case 'SQL':
        return ProtectedQueryType.sql;
    }
    throw Exception('$this is not known in enum ProtectedQueryType');
  }
}

/// An object representing the collaboration member's payment responsibilities
/// set by the collaboration creator for query compute costs.
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
      isResponsible: json['isResponsible'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final isResponsible = this.isResponsible;
    return {
      'isResponsible': isResponsible,
    };
  }
}

enum ResultFormat {
  csv,
  parquet,
}

extension ResultFormatValueExtension on ResultFormat {
  String toValue() {
    switch (this) {
      case ResultFormat.csv:
        return 'CSV';
      case ResultFormat.parquet:
        return 'PARQUET';
    }
  }
}

extension ResultFormatFromString on String {
  ResultFormat toResultFormat() {
    switch (this) {
      case 'CSV':
        return ResultFormat.csv;
      case 'PARQUET':
        return ResultFormat.parquet;
    }
    throw Exception('$this is not known in enum ResultFormat');
  }
}

enum ScalarFunctions {
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
  upper,
}

extension ScalarFunctionsValueExtension on ScalarFunctions {
  String toValue() {
    switch (this) {
      case ScalarFunctions.abs:
        return 'ABS';
      case ScalarFunctions.cast:
        return 'CAST';
      case ScalarFunctions.ceiling:
        return 'CEILING';
      case ScalarFunctions.coalesce:
        return 'COALESCE';
      case ScalarFunctions.convert:
        return 'CONVERT';
      case ScalarFunctions.currentDate:
        return 'CURRENT_DATE';
      case ScalarFunctions.dateadd:
        return 'DATEADD';
      case ScalarFunctions.extract:
        return 'EXTRACT';
      case ScalarFunctions.floor:
        return 'FLOOR';
      case ScalarFunctions.getdate:
        return 'GETDATE';
      case ScalarFunctions.ln:
        return 'LN';
      case ScalarFunctions.log:
        return 'LOG';
      case ScalarFunctions.lower:
        return 'LOWER';
      case ScalarFunctions.round:
        return 'ROUND';
      case ScalarFunctions.rtrim:
        return 'RTRIM';
      case ScalarFunctions.sqrt:
        return 'SQRT';
      case ScalarFunctions.substring:
        return 'SUBSTRING';
      case ScalarFunctions.toChar:
        return 'TO_CHAR';
      case ScalarFunctions.toDate:
        return 'TO_DATE';
      case ScalarFunctions.toNumber:
        return 'TO_NUMBER';
      case ScalarFunctions.toTimestamp:
        return 'TO_TIMESTAMP';
      case ScalarFunctions.trim:
        return 'TRIM';
      case ScalarFunctions.trunc:
        return 'TRUNC';
      case ScalarFunctions.upper:
        return 'UPPER';
    }
  }
}

extension ScalarFunctionsFromString on String {
  ScalarFunctions toScalarFunctions() {
    switch (this) {
      case 'ABS':
        return ScalarFunctions.abs;
      case 'CAST':
        return ScalarFunctions.cast;
      case 'CEILING':
        return ScalarFunctions.ceiling;
      case 'COALESCE':
        return ScalarFunctions.coalesce;
      case 'CONVERT':
        return ScalarFunctions.convert;
      case 'CURRENT_DATE':
        return ScalarFunctions.currentDate;
      case 'DATEADD':
        return ScalarFunctions.dateadd;
      case 'EXTRACT':
        return ScalarFunctions.extract;
      case 'FLOOR':
        return ScalarFunctions.floor;
      case 'GETDATE':
        return ScalarFunctions.getdate;
      case 'LN':
        return ScalarFunctions.ln;
      case 'LOG':
        return ScalarFunctions.log;
      case 'LOWER':
        return ScalarFunctions.lower;
      case 'ROUND':
        return ScalarFunctions.round;
      case 'RTRIM':
        return ScalarFunctions.rtrim;
      case 'SQRT':
        return ScalarFunctions.sqrt;
      case 'SUBSTRING':
        return ScalarFunctions.substring;
      case 'TO_CHAR':
        return ScalarFunctions.toChar;
      case 'TO_DATE':
        return ScalarFunctions.toDate;
      case 'TO_NUMBER':
        return ScalarFunctions.toNumber;
      case 'TO_TIMESTAMP':
        return ScalarFunctions.toTimestamp;
      case 'TRIM':
        return ScalarFunctions.trim;
      case 'TRUNC':
        return ScalarFunctions.trunc;
      case 'UPPER':
        return ScalarFunctions.upper;
    }
    throw Exception('$this is not known in enum ScalarFunctions');
  }
}

/// A schema is a relation within a collaboration.
class Schema {
  /// The analysis rule types associated with the schema. Currently, only one
  /// entry is present.
  final List<AnalysisRuleType> analysisRuleTypes;

  /// The unique ARN for the collaboration that the schema belongs to.
  final String collaborationArn;

  /// The unique ID for the collaboration that the schema belongs to.
  final String collaborationId;

  /// The columns for the relation this schema represents.
  final List<Column> columns;

  /// The time the schema was created.
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

  /// The type of schema. The only valid value is currently `TABLE`.
  final SchemaType type;

  /// The time the schema was last updated.
  final DateTime updateTime;

  /// The analysis method for the schema. The only valid value is currently
  /// DIRECT_QUERY.
  final AnalysisMethod? analysisMethod;

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
  });

  factory Schema.fromJson(Map<String, dynamic> json) {
    return Schema(
      analysisRuleTypes: (json['analysisRuleTypes'] as List)
          .whereNotNull()
          .map((e) => (e as String).toAnalysisRuleType())
          .toList(),
      collaborationArn: json['collaborationArn'] as String,
      collaborationId: json['collaborationId'] as String,
      columns: (json['columns'] as List)
          .whereNotNull()
          .map((e) => Column.fromJson(e as Map<String, dynamic>))
          .toList(),
      createTime: nonNullableTimeStampFromJson(json['createTime'] as Object),
      creatorAccountId: json['creatorAccountId'] as String,
      description: json['description'] as String,
      name: json['name'] as String,
      partitionKeys: (json['partitionKeys'] as List)
          .whereNotNull()
          .map((e) => Column.fromJson(e as Map<String, dynamic>))
          .toList(),
      schemaStatusDetails: (json['schemaStatusDetails'] as List)
          .whereNotNull()
          .map((e) => SchemaStatusDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: (json['type'] as String).toSchemaType(),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] as Object),
      analysisMethod: (json['analysisMethod'] as String?)?.toAnalysisMethod(),
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
    return {
      'analysisRuleTypes': analysisRuleTypes.map((e) => e.toValue()).toList(),
      'collaborationArn': collaborationArn,
      'collaborationId': collaborationId,
      'columns': columns,
      'createTime': unixTimestampToJson(createTime),
      'creatorAccountId': creatorAccountId,
      'description': description,
      'name': name,
      'partitionKeys': partitionKeys,
      'schemaStatusDetails': schemaStatusDetails,
      'type': type.toValue(),
      'updateTime': unixTimestampToJson(updateTime),
      if (analysisMethod != null) 'analysisMethod': analysisMethod.toValue(),
    };
  }
}

/// Defines the information that's necessary to retrieve an analysis rule
/// schema. Schema analysis rules are uniquely identiﬁed by a combination of the
/// schema name and the analysis rule type for a given collaboration.
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
      'type': type.toValue(),
    };
  }
}

enum SchemaConfiguration {
  differentialPrivacy,
}

extension SchemaConfigurationValueExtension on SchemaConfiguration {
  String toValue() {
    switch (this) {
      case SchemaConfiguration.differentialPrivacy:
        return 'DIFFERENTIAL_PRIVACY';
    }
  }
}

extension SchemaConfigurationFromString on String {
  SchemaConfiguration toSchemaConfiguration() {
    switch (this) {
      case 'DIFFERENTIAL_PRIVACY':
        return SchemaConfiguration.differentialPrivacy;
    }
    throw Exception('$this is not known in enum SchemaConfiguration');
  }
}

enum SchemaStatus {
  ready,
  notReady,
}

extension SchemaStatusValueExtension on SchemaStatus {
  String toValue() {
    switch (this) {
      case SchemaStatus.ready:
        return 'READY';
      case SchemaStatus.notReady:
        return 'NOT_READY';
    }
  }
}

extension SchemaStatusFromString on String {
  SchemaStatus toSchemaStatus() {
    switch (this) {
      case 'READY':
        return SchemaStatus.ready;
      case 'NOT_READY':
        return SchemaStatus.notReady;
    }
    throw Exception('$this is not known in enum SchemaStatus');
  }
}

/// Information about the schema status.
///
/// A status of <code>READY</code> means that based on the schema analysis rule,
/// queries of the given analysis rule type are properly configured to run
/// queries on this schema.
class SchemaStatusDetail {
  /// The status of the schema.
  final SchemaStatus status;

  /// The analysis rule type for which the schema status has been evaluated.
  final AnalysisRuleType? analysisRuleType;

  /// The configuration details of the schema analysis rule for the given type.
  final List<SchemaConfiguration>? configurations;

  /// The reasons why the schema status is set to its current state.
  final List<SchemaStatusReason>? reasons;

  SchemaStatusDetail({
    required this.status,
    this.analysisRuleType,
    this.configurations,
    this.reasons,
  });

  factory SchemaStatusDetail.fromJson(Map<String, dynamic> json) {
    return SchemaStatusDetail(
      status: (json['status'] as String).toSchemaStatus(),
      analysisRuleType:
          (json['analysisRuleType'] as String?)?.toAnalysisRuleType(),
      configurations: (json['configurations'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toSchemaConfiguration())
          .toList(),
      reasons: (json['reasons'] as List?)
          ?.whereNotNull()
          .map((e) => SchemaStatusReason.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final analysisRuleType = this.analysisRuleType;
    final configurations = this.configurations;
    final reasons = this.reasons;
    return {
      'status': status.toValue(),
      if (analysisRuleType != null)
        'analysisRuleType': analysisRuleType.toValue(),
      if (configurations != null)
        'configurations': configurations.map((e) => e.toValue()).toList(),
      if (reasons != null) 'reasons': reasons,
    };
  }
}

/// A reason why the schema status is set to its current value.
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
      code: (json['code'] as String).toSchemaStatusReasonCode(),
      message: json['message'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      'code': code.toValue(),
      'message': message,
    };
  }
}

enum SchemaStatusReasonCode {
  analysisRuleMissing,
  analysisTemplatesNotConfigured,
  analysisProvidersNotConfigured,
  differentialPrivacyPolicyNotConfigured,
}

extension SchemaStatusReasonCodeValueExtension on SchemaStatusReasonCode {
  String toValue() {
    switch (this) {
      case SchemaStatusReasonCode.analysisRuleMissing:
        return 'ANALYSIS_RULE_MISSING';
      case SchemaStatusReasonCode.analysisTemplatesNotConfigured:
        return 'ANALYSIS_TEMPLATES_NOT_CONFIGURED';
      case SchemaStatusReasonCode.analysisProvidersNotConfigured:
        return 'ANALYSIS_PROVIDERS_NOT_CONFIGURED';
      case SchemaStatusReasonCode.differentialPrivacyPolicyNotConfigured:
        return 'DIFFERENTIAL_PRIVACY_POLICY_NOT_CONFIGURED';
    }
  }
}

extension SchemaStatusReasonCodeFromString on String {
  SchemaStatusReasonCode toSchemaStatusReasonCode() {
    switch (this) {
      case 'ANALYSIS_RULE_MISSING':
        return SchemaStatusReasonCode.analysisRuleMissing;
      case 'ANALYSIS_TEMPLATES_NOT_CONFIGURED':
        return SchemaStatusReasonCode.analysisTemplatesNotConfigured;
      case 'ANALYSIS_PROVIDERS_NOT_CONFIGURED':
        return SchemaStatusReasonCode.analysisProvidersNotConfigured;
      case 'DIFFERENTIAL_PRIVACY_POLICY_NOT_CONFIGURED':
        return SchemaStatusReasonCode.differentialPrivacyPolicyNotConfigured;
    }
    throw Exception('$this is not known in enum SchemaStatusReasonCode');
  }
}

/// The schema summary for the objects listed by the request.
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

  /// The type of schema object. The only valid schema type is currently `TABLE`.
  final SchemaType type;

  /// The time the schema object was last updated.
  final DateTime updateTime;

  /// The analysis method for the associated schema. The only valid value is
  /// currently `DIRECT_QUERY`.
  final AnalysisMethod? analysisMethod;

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
  });

  factory SchemaSummary.fromJson(Map<String, dynamic> json) {
    return SchemaSummary(
      analysisRuleTypes: (json['analysisRuleTypes'] as List)
          .whereNotNull()
          .map((e) => (e as String).toAnalysisRuleType())
          .toList(),
      collaborationArn: json['collaborationArn'] as String,
      collaborationId: json['collaborationId'] as String,
      createTime: nonNullableTimeStampFromJson(json['createTime'] as Object),
      creatorAccountId: json['creatorAccountId'] as String,
      name: json['name'] as String,
      type: (json['type'] as String).toSchemaType(),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] as Object),
      analysisMethod: (json['analysisMethod'] as String?)?.toAnalysisMethod(),
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
    return {
      'analysisRuleTypes': analysisRuleTypes.map((e) => e.toValue()).toList(),
      'collaborationArn': collaborationArn,
      'collaborationId': collaborationId,
      'createTime': unixTimestampToJson(createTime),
      'creatorAccountId': creatorAccountId,
      'name': name,
      'type': type.toValue(),
      'updateTime': unixTimestampToJson(updateTime),
      if (analysisMethod != null) 'analysisMethod': analysisMethod.toValue(),
    };
  }
}

enum SchemaType {
  table,
}

extension SchemaTypeValueExtension on SchemaType {
  String toValue() {
    switch (this) {
      case SchemaType.table:
        return 'TABLE';
    }
  }
}

extension SchemaTypeFromString on String {
  SchemaType toSchemaType() {
    switch (this) {
      case 'TABLE':
        return SchemaType.table;
    }
    throw Exception('$this is not known in enum SchemaType');
  }
}

class StartProtectedQueryOutput {
  /// The protected query.
  final ProtectedQuery protectedQuery;

  StartProtectedQueryOutput({
    required this.protectedQuery,
  });

  factory StartProtectedQueryOutput.fromJson(Map<String, dynamic> json) {
    return StartProtectedQueryOutput(
      protectedQuery: ProtectedQuery.fromJson(
          json['protectedQuery'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final protectedQuery = this.protectedQuery;
    return {
      'protectedQuery': protectedQuery,
    };
  }
}

/// A pointer to the dataset that underlies this table. Currently, this can only
/// be an Glue table.
class TableReference {
  /// If present, a reference to the Glue table referred to by this table
  /// reference.
  final GlueTableReference? glue;

  TableReference({
    this.glue,
  });

  factory TableReference.fromJson(Map<String, dynamic> json) {
    return TableReference(
      glue: json['glue'] != null
          ? GlueTableReference.fromJson(json['glue'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final glue = this.glue;
    return {
      if (glue != null) 'glue': glue,
    };
  }
}

class TagResourceOutput {
  TagResourceOutput();

  factory TagResourceOutput.fromJson(Map<String, dynamic> _) {
    return TagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum TargetProtectedQueryStatus {
  cancelled,
}

extension TargetProtectedQueryStatusValueExtension
    on TargetProtectedQueryStatus {
  String toValue() {
    switch (this) {
      case TargetProtectedQueryStatus.cancelled:
        return 'CANCELLED';
    }
  }
}

extension TargetProtectedQueryStatusFromString on String {
  TargetProtectedQueryStatus toTargetProtectedQueryStatus() {
    switch (this) {
      case 'CANCELLED':
        return TargetProtectedQueryStatus.cancelled;
    }
    throw Exception('$this is not known in enum TargetProtectedQueryStatus');
  }
}

class UntagResourceOutput {
  UntagResourceOutput();

  factory UntagResourceOutput.fromJson(Map<String, dynamic> _) {
    return UntagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateAnalysisTemplateOutput {
  /// The analysis template.
  final AnalysisTemplate analysisTemplate;

  UpdateAnalysisTemplateOutput({
    required this.analysisTemplate,
  });

  factory UpdateAnalysisTemplateOutput.fromJson(Map<String, dynamic> json) {
    return UpdateAnalysisTemplateOutput(
      analysisTemplate: AnalysisTemplate.fromJson(
          json['analysisTemplate'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final analysisTemplate = this.analysisTemplate;
    return {
      'analysisTemplate': analysisTemplate,
    };
  }
}

class UpdateCollaborationOutput {
  /// The entire collaboration that has been updated.
  final Collaboration collaboration;

  UpdateCollaborationOutput({
    required this.collaboration,
  });

  factory UpdateCollaborationOutput.fromJson(Map<String, dynamic> json) {
    return UpdateCollaborationOutput(
      collaboration:
          Collaboration.fromJson(json['collaboration'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final collaboration = this.collaboration;
    return {
      'collaboration': collaboration,
    };
  }
}

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
              json['configuredAudienceModelAssociation']
                  as Map<String, dynamic>),
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
          json['analysisRule'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final analysisRule = this.analysisRule;
    return {
      'analysisRule': analysisRule,
    };
  }
}

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
          json['configuredTableAssociation'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final configuredTableAssociation = this.configuredTableAssociation;
    return {
      'configuredTableAssociation': configuredTableAssociation,
    };
  }
}

class UpdateConfiguredTableOutput {
  /// The updated configured table.
  final ConfiguredTable configuredTable;

  UpdateConfiguredTableOutput({
    required this.configuredTable,
  });

  factory UpdateConfiguredTableOutput.fromJson(Map<String, dynamic> json) {
    return UpdateConfiguredTableOutput(
      configuredTable: ConfiguredTable.fromJson(
          json['configuredTable'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final configuredTable = this.configuredTable;
    return {
      'configuredTable': configuredTable,
    };
  }
}

class UpdateMembershipOutput {
  final Membership membership;

  UpdateMembershipOutput({
    required this.membership,
  });

  factory UpdateMembershipOutput.fromJson(Map<String, dynamic> json) {
    return UpdateMembershipOutput(
      membership:
          Membership.fromJson(json['membership'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final membership = this.membership;
    return {
      'membership': membership,
    };
  }
}

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
          json['privacyBudgetTemplate'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final privacyBudgetTemplate = this.privacyBudgetTemplate;
    return {
      'privacyBudgetTemplate': privacyBudgetTemplate,
    };
  }
}

class UpdateProtectedQueryOutput {
  /// The protected query output.
  final ProtectedQuery protectedQuery;

  UpdateProtectedQueryOutput({
    required this.protectedQuery,
  });

  factory UpdateProtectedQueryOutput.fromJson(Map<String, dynamic> json) {
    return UpdateProtectedQueryOutput(
      protectedQuery: ProtectedQuery.fromJson(
          json['protectedQuery'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final protectedQuery = this.protectedQuery;
    return {
      'protectedQuery': protectedQuery,
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
