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

/// Welcome to the <i>AWS Clean Rooms API Reference</i>.
///
/// AWS Clean Rooms is an AWS service that helps multiple parties to join their
/// data together in a secure collaboration workspace. In the collaboration,
/// members who can query and receive results can get insights into the
/// collective datasets without either party getting access to the other party's
/// raw data.
///
/// To learn more about AWS Clean Rooms concepts, procedures, and best
/// practices, see the <a
/// href="https://docs.aws.amazon.com/clean-rooms/latest/userguide/what-is.html">AWS
/// Clean Rooms User Guide</a>.
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
  /// The names for the schema objects to retrieve.&gt;
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
  /// A reference to the AWS Glue table being configured.
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
  /// The type of analysis rule. Valid values are AGGREGATION and LIST.
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
  /// the collaboration.
  ///
  /// Parameter [tags] :
  /// An optional label that you can assign to a resource when you create it.
  /// Each tag consists of a key and an optional value, both of which you
  /// define. When you use tagging, you can also use tag-based access control in
  /// IAM policies to control access to this resource.
  Future<CreateMembershipOutput> createMembership({
    required String collaborationIdentifier,
    required MembershipQueryLogStatus queryLogStatus,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'collaborationIdentifier': collaborationIdentifier,
      'queryLogStatus': queryLogStatus.toValue(),
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

  /// Creates a protected query that is started by AWS Clean Rooms.
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
  /// Parameter [resultConfiguration] :
  /// The details needed to write the query results.
  ///
  /// Parameter [sqlParameters] :
  /// The protected SQL query parameters.
  ///
  /// Parameter [type] :
  /// The type of the protected query to be started.
  Future<StartProtectedQueryOutput> startProtectedQuery({
    required String membershipIdentifier,
    required ProtectedQueryResultConfiguration resultConfiguration,
    required ProtectedQuerySQLParameters sqlParameters,
    required ProtectedQueryType type,
  }) async {
    final $payload = <String, dynamic>{
      'resultConfiguration': resultConfiguration,
      'sqlParameters': sqlParameters,
      'type': type.toValue(),
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
  /// Parameter [queryLogStatus] :
  /// An indicator as to whether query logging has been enabled or disabled for
  /// the collaboration.
  Future<UpdateMembershipOutput> updateMembership({
    required String membershipIdentifier,
    MembershipQueryLogStatus? queryLogStatus,
  }) async {
    final $payload = <String, dynamic>{
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

  /// The type of analysis rule. Valid values are `AGGREGATION` and `LIST`.
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

/// Enables query structure and specified queries that product aggregate
/// statistics.
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

  /// Control that requires member who runs query to do a join with their
  /// configured table and/or other configured table in query
  final JoinRequiredOption? joinRequired;

  AnalysisRuleAggregation({
    required this.aggregateColumns,
    required this.dimensionColumns,
    required this.joinColumns,
    required this.outputConstraints,
    required this.scalarFunctions,
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
      joinRequired: (json['joinRequired'] as String?)?.toJoinRequiredOption(),
    );
  }

  Map<String, dynamic> toJson() {
    final aggregateColumns = this.aggregateColumns;
    final dimensionColumns = this.dimensionColumns;
    final joinColumns = this.joinColumns;
    final outputConstraints = this.outputConstraints;
    final scalarFunctions = this.scalarFunctions;
    final joinRequired = this.joinRequired;
    return {
      'aggregateColumns': aggregateColumns,
      'dimensionColumns': dimensionColumns,
      'joinColumns': joinColumns,
      'outputConstraints': outputConstraints,
      'scalarFunctions': scalarFunctions.map((e) => e.toValue()).toList(),
      if (joinRequired != null) 'joinRequired': joinRequired.toValue(),
    };
  }
}

/// A type of analysis rule that enables row-level analysis.
class AnalysisRuleList {
  /// Columns that can be used to join a configured table with the table of the
  /// member who can query and another members' configured tables.
  final List<String> joinColumns;

  /// Columns that can be listed in the output.
  final List<String> listColumns;

  AnalysisRuleList({
    required this.joinColumns,
    required this.listColumns,
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
    );
  }

  Map<String, dynamic> toJson() {
    final joinColumns = this.joinColumns;
    final listColumns = this.listColumns;
    return {
      'joinColumns': joinColumns,
      'listColumns': listColumns,
    };
  }
}

/// Controls on the query specifications that can be run on configured table..
class AnalysisRulePolicy {
  /// Controls on the query specifications that can be run on configured table..
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

/// Controls on the query specifications that can be run on configured table..
class AnalysisRulePolicyV1 {
  /// Analysis rule type that enables only aggregation queries on a configured
  /// table.
  final AnalysisRuleAggregation? aggregation;

  /// Analysis rule type that enables only list queries on a configured table.
  final AnalysisRuleList? list;

  AnalysisRulePolicyV1({
    this.aggregation,
    this.list,
  });

  factory AnalysisRulePolicyV1.fromJson(Map<String, dynamic> json) {
    return AnalysisRulePolicyV1(
      aggregation: json['aggregation'] != null
          ? AnalysisRuleAggregation.fromJson(
              json['aggregation'] as Map<String, dynamic>)
          : null,
      list: json['list'] != null
          ? AnalysisRuleList.fromJson(json['list'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final aggregation = this.aggregation;
    final list = this.list;
    return {
      if (aggregation != null) 'aggregation': aggregation,
      if (list != null) 'list': list,
    };
  }
}

enum AnalysisRuleType {
  aggregation,
  list,
}

extension AnalysisRuleTypeValueExtension on AnalysisRuleType {
  String toValue() {
    switch (this) {
      case AnalysisRuleType.aggregation:
        return 'AGGREGATION';
      case AnalysisRuleType.list:
        return 'LIST';
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
    }
    throw Exception('$this is not known in enum AnalysisRuleType');
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
  /// only supports AWS account ID.
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
  /// only supports AWS Account ID.
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

/// A column within a schema relation, derived from the underlying AWS Glue
/// table.
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

/// A table that has been configured for use in a collaboration.
class ConfiguredTable {
  /// The columns within the underlying AWS Glue table that can be utilized within
  /// collaborations.
  final List<String> allowedColumns;

  /// The analysis method for the configured table. The only valid value is
  /// currently `DIRECT_QUERY`.
  final AnalysisMethod analysisMethod;

  /// The types of analysis rules associated with this configured table. Valid
  /// values are `AGGREGATION` and `LIST`. Currently, only one analysis rule may
  /// be associated with a configured table.
  final List<ConfiguredTableAnalysisRuleType> analysisRuleTypes;

  /// The unique ARN for the configured table.
  final String arn;

  /// The time the configured table was created.
  final DateTime createTime;

  /// The unique ID for the configured table.
  final String id;

  /// A name for the configured table.
  final String name;

  /// The AWS Glue table that this configured table represents.
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

  /// The type of configured table analysis rule. Valid values are `AGGREGATION`
  /// and `LIST`.
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

  /// Analysis rule type that enables only list queries on a configured table.
  final AnalysisRuleList? list;

  ConfiguredTableAnalysisRulePolicyV1({
    this.aggregation,
    this.list,
  });

  factory ConfiguredTableAnalysisRulePolicyV1.fromJson(
      Map<String, dynamic> json) {
    return ConfiguredTableAnalysisRulePolicyV1(
      aggregation: json['aggregation'] != null
          ? AnalysisRuleAggregation.fromJson(
              json['aggregation'] as Map<String, dynamic>)
          : null,
      list: json['list'] != null
          ? AnalysisRuleList.fromJson(json['list'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final aggregation = this.aggregation;
    final list = this.list;
    return {
      if (aggregation != null) 'aggregation': aggregation,
      if (list != null) 'list': list,
    };
  }
}

enum ConfiguredTableAnalysisRuleType {
  aggregation,
  list,
}

extension ConfiguredTableAnalysisRuleTypeValueExtension
    on ConfiguredTableAnalysisRuleType {
  String toValue() {
    switch (this) {
      case ConfiguredTableAnalysisRuleType.aggregation:
        return 'AGGREGATION';
      case ConfiguredTableAnalysisRuleType.list:
        return 'LIST';
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

/// The settings for client-side encryption for cryptographic computing.
class DataEncryptionMetadata {
  /// Indicates whether encrypted tables can contain cleartext data (true) or are
  /// to cryptographically process every column (false).
  final bool allowCleartext;

  /// Indicates whether Fingerprint columns can contain duplicate entries (true)
  /// or are to contain only non-repeated values (false).
  final bool allowDuplicates;

  /// Indicates whether Fingerprint columns can be joined on any other Fingerprint
  /// column with a different name (true) or can only be joined on Fingerprint
  /// columns of the same name (false).
  final bool allowJoinsOnColumnsWithDifferentNames;

  /// Indicates whether NULL values are to be copied as NULL to encrypted tables
  /// (true) or cryptographically processed (false).
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

class DeleteCollaborationOutput {
  DeleteCollaborationOutput();

  factory DeleteCollaborationOutput.fromJson(Map<String, dynamic> _) {
    return DeleteCollaborationOutput();
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

/// A reference to a table within an AWS Glue data catalog.
class GlueTableReference {
  /// The name of the database the AWS Glue table belongs to.
  final String databaseName;

  /// The name of the AWS Glue table.
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
  /// only supports AWS Account ID.
  final String accountId;

  /// The member's display name.
  final String displayName;

  /// The abilities granted to the collaboration member.
  final List<MemberAbility> memberAbilities;

  MemberSpecification({
    required this.accountId,
    required this.displayName,
    required this.memberAbilities,
  });

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final displayName = this.displayName;
    final memberAbilities = this.memberAbilities;
    return {
      'accountId': accountId,
      'displayName': displayName,
      'memberAbilities': memberAbilities.map((e) => e.toValue()).toList(),
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
  /// only supports AWS Account ID.
  final String accountId;

  /// The time when the member was created.
  final DateTime createTime;

  /// The member's display name.
  final String displayName;

  /// The status of the member. Valid values are `INVITED`, `ACTIVE`, `LEFT`, and
  /// `REMOVED`.
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
    final status = this.status;
    final updateTime = this.updateTime;
    final membershipArn = this.membershipArn;
    final membershipId = this.membershipId;
    return {
      'abilities': abilities.map((e) => e.toValue()).toList(),
      'accountId': accountId,
      'createTime': unixTimestampToJson(createTime),
      'displayName': displayName,
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
  /// only supports AWS account ID.
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

  /// An indicator as to whether query logging has been enabled or disabled for
  /// the collaboration.
  final MembershipQueryLogStatus queryLogStatus;

  /// The status of the membership. Valid values are `ACTIVE`, `REMOVED`, and
  /// `COLLABORATION_DELETED`.
  final MembershipStatus status;

  /// The time the membership metadata was last updated.
  final DateTime updateTime;

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
    required this.queryLogStatus,
    required this.status,
    required this.updateTime,
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
      queryLogStatus:
          (json['queryLogStatus'] as String).toMembershipQueryLogStatus(),
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
    final queryLogStatus = this.queryLogStatus;
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
      'queryLogStatus': queryLogStatus.toValue(),
      'status': status.toValue(),
      'updateTime': unixTimestampToJson(updateTime),
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

  /// The identifier of the AWS principal that created the collaboration.
  /// Currently only supports AWS account ID.
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

  /// The status of the membership. Valid values are `ACTIVE`, `REMOVED`, and
  /// `COLLABORATION_DELETED`.
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
      'status': status.toValue(),
      'updateTime': unixTimestampToJson(updateTime),
    };
  }
}

/// The parameters for an AWS Clean Rooms protected query.
class ProtectedQuery {
  /// The time at which the protected query was created.
  final DateTime createTime;

  /// The identifier for a protected query instance.
  final String id;

  /// The ARN of the membership.
  final String membershipArn;

  /// The identifier for the membership.
  final String membershipId;

  /// Contains any details needed to write the query results.
  final ProtectedQueryResultConfiguration resultConfiguration;

  /// The protected query SQL parameters.
  final ProtectedQuerySQLParameters sqlParameters;

  /// The status of the query.
  final ProtectedQueryStatus status;

  /// An error thrown by the protected query.
  final ProtectedQueryError? error;

  /// The result of the protected query.
  final ProtectedQueryResult? result;

  /// Statistics about protected query execution.
  final ProtectedQueryStatistics? statistics;

  ProtectedQuery({
    required this.createTime,
    required this.id,
    required this.membershipArn,
    required this.membershipId,
    required this.resultConfiguration,
    required this.sqlParameters,
    required this.status,
    this.error,
    this.result,
    this.statistics,
  });

  factory ProtectedQuery.fromJson(Map<String, dynamic> json) {
    return ProtectedQuery(
      createTime: nonNullableTimeStampFromJson(json['createTime'] as Object),
      id: json['id'] as String,
      membershipArn: json['membershipArn'] as String,
      membershipId: json['membershipId'] as String,
      resultConfiguration: ProtectedQueryResultConfiguration.fromJson(
          json['resultConfiguration'] as Map<String, dynamic>),
      sqlParameters: ProtectedQuerySQLParameters.fromJson(
          json['sqlParameters'] as Map<String, dynamic>),
      status: (json['status'] as String).toProtectedQueryStatus(),
      error: json['error'] != null
          ? ProtectedQueryError.fromJson(json['error'] as Map<String, dynamic>)
          : null,
      result: json['result'] != null
          ? ProtectedQueryResult.fromJson(
              json['result'] as Map<String, dynamic>)
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
    final resultConfiguration = this.resultConfiguration;
    final sqlParameters = this.sqlParameters;
    final status = this.status;
    final error = this.error;
    final result = this.result;
    final statistics = this.statistics;
    return {
      'createTime': unixTimestampToJson(createTime),
      'id': id,
      'membershipArn': membershipArn,
      'membershipId': membershipId,
      'resultConfiguration': resultConfiguration,
      'sqlParameters': sqlParameters,
      'status': status.toValue(),
      if (error != null) 'error': error,
      if (result != null) 'result': result,
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
  /// If present, the output for a protected query with an `S3` output type.
  final ProtectedQueryS3Output? s3;

  ProtectedQueryOutput({
    this.s3,
  });

  factory ProtectedQueryOutput.fromJson(Map<String, dynamic> json) {
    return ProtectedQueryOutput(
      s3: json['s3'] != null
          ? ProtectedQueryS3Output.fromJson(json['s3'] as Map<String, dynamic>)
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
  /// The query string to be submitted.
  final String queryString;

  ProtectedQuerySQLParameters({
    required this.queryString,
  });

  factory ProtectedQuerySQLParameters.fromJson(Map<String, dynamic> json) {
    return ProtectedQuerySQLParameters(
      queryString: json['queryString'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final queryString = this.queryString;
    return {
      'queryString': queryString,
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
  trunc,
  abs,
  ceiling,
  floor,
  ln,
  log,
  round,
  sqrt,
  cast,
  lower,
  rtrim,
  upper,
  coalesce,
}

extension ScalarFunctionsValueExtension on ScalarFunctions {
  String toValue() {
    switch (this) {
      case ScalarFunctions.trunc:
        return 'TRUNC';
      case ScalarFunctions.abs:
        return 'ABS';
      case ScalarFunctions.ceiling:
        return 'CEILING';
      case ScalarFunctions.floor:
        return 'FLOOR';
      case ScalarFunctions.ln:
        return 'LN';
      case ScalarFunctions.log:
        return 'LOG';
      case ScalarFunctions.round:
        return 'ROUND';
      case ScalarFunctions.sqrt:
        return 'SQRT';
      case ScalarFunctions.cast:
        return 'CAST';
      case ScalarFunctions.lower:
        return 'LOWER';
      case ScalarFunctions.rtrim:
        return 'RTRIM';
      case ScalarFunctions.upper:
        return 'UPPER';
      case ScalarFunctions.coalesce:
        return 'COALESCE';
    }
  }
}

extension ScalarFunctionsFromString on String {
  ScalarFunctions toScalarFunctions() {
    switch (this) {
      case 'TRUNC':
        return ScalarFunctions.trunc;
      case 'ABS':
        return ScalarFunctions.abs;
      case 'CEILING':
        return ScalarFunctions.ceiling;
      case 'FLOOR':
        return ScalarFunctions.floor;
      case 'LN':
        return ScalarFunctions.ln;
      case 'LOG':
        return ScalarFunctions.log;
      case 'ROUND':
        return ScalarFunctions.round;
      case 'SQRT':
        return ScalarFunctions.sqrt;
      case 'CAST':
        return ScalarFunctions.cast;
      case 'LOWER':
        return ScalarFunctions.lower;
      case 'RTRIM':
        return ScalarFunctions.rtrim;
      case 'UPPER':
        return ScalarFunctions.upper;
      case 'COALESCE':
        return ScalarFunctions.coalesce;
    }
    throw Exception('$this is not known in enum ScalarFunctions');
  }
}

/// A schema is a relation within a collaboration.
class Schema {
  /// The analysis rule types associated with the schema. Valued values are LIST
  /// and AGGREGATION. Currently, only one entry is present.
  final List<AnalysisRuleType> analysisRuleTypes;

  /// The unique ARN for the collaboration that the schema belongs to.
  final String collaborationArn;

  /// The unique ID for the collaboration that the schema belongs to.
  final String collaborationId;

  /// The columns for the relation this schema represents.
  final List<Column> columns;

  /// The time the schema was created.
  final DateTime createTime;

  /// The unique account ID for the AWS account that owns the schema.
  final String creatorAccountId;

  /// A description for the schema.
  final String description;

  /// A name for the schema. The schema relation is referred to by this name when
  /// queried by a protected query.
  final String name;

  /// The partition keys for the dataset underlying this schema.
  final List<Column> partitionKeys;

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
      'type': type.toValue(),
      'updateTime': unixTimestampToJson(updateTime),
      if (analysisMethod != null) 'analysisMethod': analysisMethod.toValue(),
    };
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

  /// The unique account ID for the AWS account that owns the schema.
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
/// be an AWS Glue table.
class TableReference {
  /// If present, a reference to the AWS Glue table referred to by this table
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
