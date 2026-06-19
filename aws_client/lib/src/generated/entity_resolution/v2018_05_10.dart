// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
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

/// Welcome to the <i>Entity Resolution API Reference</i>.
///
/// Entity Resolution is an Amazon Web Services service that provides
/// pre-configured entity resolution capabilities that enable developers and
/// analysts at advertising and marketing companies to build an accurate and
/// complete view of their consumers.
///
/// With Entity Resolution, you can match source records containing consumer
/// identifiers, such as name, email address, and phone number. This is true
/// even when these records have incomplete or conflicting identifiers. For
/// example, Entity Resolution can effectively match a source record from a
/// customer relationship management (CRM) system with a source record from a
/// marketing system containing campaign information.
///
/// To learn more about Entity Resolution concepts, procedures, and best
/// practices, see the <a
/// href="https://docs.aws.amazon.com/entityresolution/latest/userguide/what-is-service.html">Entity
/// Resolution User Guide</a>.
class EntityResolution {
  final _s.RestJsonProtocol _protocol;
  EntityResolution({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'entityresolution',
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

  /// Adds a policy statement object. To retrieve a list of existing policy
  /// statements, use the <code>GetPolicy</code> API.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [action] :
  /// The action that the principal can use on the resource.
  ///
  /// For example, <code>entityresolution:GetIdMappingJob</code>,
  /// <code>entityresolution:GetMatchingJob</code>.
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the resource that will be accessed by
  /// the principal.
  ///
  /// Parameter [effect] :
  /// Determines whether the permissions specified in the policy are to be
  /// allowed (<code>Allow</code>) or denied (<code>Deny</code>).
  /// <important>
  /// If you set the value of the <code>effect</code> parameter to
  /// <code>Deny</code> for the <code>AddPolicyStatement</code> operation, you
  /// must also set the value of the <code>effect</code> parameter in the
  /// <code>policy</code> to <code>Deny</code> for the <code>PutPolicy</code>
  /// operation.
  /// </important>
  ///
  /// Parameter [principal] :
  /// The Amazon Web Services service or Amazon Web Services account that can
  /// access the resource defined as ARN.
  ///
  /// Parameter [statementId] :
  /// A statement identifier that differentiates the statement from others in
  /// the same policy.
  ///
  /// Parameter [condition] :
  /// A set of condition keys that you can use in key policies.
  Future<AddPolicyStatementOutput> addPolicyStatement({
    required List<String> action,
    required String arn,
    required StatementEffect effect,
    required List<String> principal,
    required String statementId,
    String? condition,
  }) async {
    final $payload = <String, dynamic>{
      'action': action,
      'effect': effect.value,
      'principal': principal,
      if (condition != null) 'condition': condition,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/policies/${Uri.encodeComponent(arn)}/${Uri.encodeComponent(statementId)}',
      exceptionFnMap: _exceptionFns,
    );
    return AddPolicyStatementOutput.fromJson(response);
  }

  /// Deletes multiple unique IDs in a matching workflow.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [uniqueIds] :
  /// The unique IDs to delete.
  ///
  /// Parameter [workflowName] :
  /// The name of the workflow.
  ///
  /// Parameter [inputSource] :
  /// The input source for the batch delete unique ID operation.
  Future<BatchDeleteUniqueIdOutput> batchDeleteUniqueId({
    required List<String> uniqueIds,
    required String workflowName,
    String? inputSource,
  }) async {
    final headers = <String, String>{
      'uniqueIds': _s.encodeHttpHeaderList(uniqueIds),
      if (inputSource != null) 'inputSource': inputSource.toString(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/matchingworkflows/${Uri.encodeComponent(workflowName)}/uniqueids',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return BatchDeleteUniqueIdOutput.fromJson(response);
  }

  /// Creates an <code>IdMappingWorkflow</code> object which stores the
  /// configuration of the data processing job to be run. Each
  /// <code>IdMappingWorkflow</code> must have a unique workflow name. To modify
  /// an existing workflow, use the UpdateIdMappingWorkflow API.
  /// <important>
  /// Incremental processing is not supported for ID mapping workflows.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ExceedsLimitException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [idMappingTechniques] :
  /// An object which defines the ID mapping technique and any additional
  /// configurations.
  ///
  /// Parameter [inputSourceConfig] :
  /// A list of <code>InputSource</code> objects, which have the fields
  /// <code>InputSourceARN</code> and <code>SchemaName</code>.
  ///
  /// Parameter [workflowName] :
  /// The name of the workflow. There can't be multiple
  /// <code>IdMappingWorkflows</code> with the same name.
  ///
  /// Parameter [description] :
  /// A description of the workflow.
  ///
  /// Parameter [incrementalRunConfig] :
  /// The incremental run configuration for the ID mapping workflow.
  ///
  /// Parameter [outputSourceConfig] :
  /// A list of <code>IdMappingWorkflowOutputSource</code> objects, each of
  /// which contains fields <code>outputS3Path</code> and <code>KMSArn</code>.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role. Entity Resolution assumes
  /// this role to create resources on your behalf as part of workflow
  /// execution.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  Future<CreateIdMappingWorkflowOutput> createIdMappingWorkflow({
    required IdMappingTechniques idMappingTechniques,
    required List<IdMappingWorkflowInputSource> inputSourceConfig,
    required String workflowName,
    String? description,
    IdMappingIncrementalRunConfig? incrementalRunConfig,
    List<IdMappingWorkflowOutputSource>? outputSourceConfig,
    String? roleArn,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'idMappingTechniques': idMappingTechniques,
      'inputSourceConfig': inputSourceConfig,
      'workflowName': workflowName,
      if (description != null) 'description': description,
      if (incrementalRunConfig != null)
        'incrementalRunConfig': incrementalRunConfig,
      if (outputSourceConfig != null) 'outputSourceConfig': outputSourceConfig,
      if (roleArn != null) 'roleArn': roleArn,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/idmappingworkflows',
      exceptionFnMap: _exceptionFns,
    );
    return CreateIdMappingWorkflowOutput.fromJson(response);
  }

  /// Creates an ID namespace object which will help customers provide metadata
  /// explaining their dataset and how to use it. Each ID namespace must have a
  /// unique name. To modify an existing ID namespace, use the UpdateIdNamespace
  /// API.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ExceedsLimitException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [idNamespaceName] :
  /// The name of the ID namespace.
  ///
  /// Parameter [type] :
  /// The type of ID namespace. There are two types: <code>SOURCE</code> and
  /// <code>TARGET</code>.
  ///
  /// The <code>SOURCE</code> contains configurations for <code>sourceId</code>
  /// data that will be processed in an ID mapping workflow.
  ///
  /// The <code>TARGET</code> contains a configuration of <code>targetId</code>
  /// to which all <code>sourceIds</code> will resolve to.
  ///
  /// Parameter [description] :
  /// The description of the ID namespace.
  ///
  /// Parameter [idMappingWorkflowProperties] :
  /// Determines the properties of <code>IdMappingWorflow</code> where this
  /// <code>IdNamespace</code> can be used as a <code>Source</code> or a
  /// <code>Target</code>.
  ///
  /// Parameter [inputSourceConfig] :
  /// A list of <code>InputSource</code> objects, which have the fields
  /// <code>InputSourceARN</code> and <code>SchemaName</code>.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role. Entity Resolution assumes
  /// this role to access the resources defined in this <code>IdNamespace</code>
  /// on your behalf as part of the workflow run.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  Future<CreateIdNamespaceOutput> createIdNamespace({
    required String idNamespaceName,
    required IdNamespaceType type,
    String? description,
    List<IdNamespaceIdMappingWorkflowProperties>? idMappingWorkflowProperties,
    List<IdNamespaceInputSource>? inputSourceConfig,
    String? roleArn,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'idNamespaceName': idNamespaceName,
      'type': type.value,
      if (description != null) 'description': description,
      if (idMappingWorkflowProperties != null)
        'idMappingWorkflowProperties': idMappingWorkflowProperties,
      if (inputSourceConfig != null) 'inputSourceConfig': inputSourceConfig,
      if (roleArn != null) 'roleArn': roleArn,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/idnamespaces',
      exceptionFnMap: _exceptionFns,
    );
    return CreateIdNamespaceOutput.fromJson(response);
  }

  /// Creates a matching workflow that defines the configuration for a data
  /// processing job. The workflow name must be unique. To modify an existing
  /// workflow, use <code>UpdateMatchingWorkflow</code>.
  /// <important>
  /// For workflows where <code>resolutionType</code> is
  /// <code>ML_MATCHING</code> or <code>PROVIDER</code>, incremental processing
  /// is not supported.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ExceedsLimitException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [inputSourceConfig] :
  /// A list of <code>InputSource</code> objects, which have the fields
  /// <code>InputSourceARN</code> and <code>SchemaName</code>.
  ///
  /// Parameter [outputSourceConfig] :
  /// A list of <code>OutputSource</code> objects, each of which contains fields
  /// <code>outputS3Path</code>, <code>applyNormalization</code>,
  /// <code>KMSArn</code>, and <code>output</code>.
  ///
  /// Parameter [resolutionTechniques] :
  /// An object which defines the <code>resolutionType</code> and the
  /// <code>ruleBasedProperties</code>.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role. Entity Resolution assumes
  /// this role to create resources on your behalf as part of workflow
  /// execution.
  ///
  /// Parameter [workflowName] :
  /// The name of the workflow. There can't be multiple
  /// <code>MatchingWorkflows</code> with the same name.
  ///
  /// Parameter [description] :
  /// A description of the workflow.
  ///
  /// Parameter [incrementalRunConfig] :
  /// Optional. An object that defines the incremental run type. This object
  /// contains only the <code>incrementalRunType</code> field, which appears as
  /// "Automatic" in the console.
  /// <important>
  /// For workflows where <code>resolutionType</code> is
  /// <code>ML_MATCHING</code> or <code>PROVIDER</code>, incremental processing
  /// is not supported.
  /// </important>
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  Future<CreateMatchingWorkflowOutput> createMatchingWorkflow({
    required List<InputSource> inputSourceConfig,
    required List<OutputSource> outputSourceConfig,
    required ResolutionTechniques resolutionTechniques,
    required String roleArn,
    required String workflowName,
    String? description,
    IncrementalRunConfig? incrementalRunConfig,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'inputSourceConfig': inputSourceConfig,
      'outputSourceConfig': outputSourceConfig,
      'resolutionTechniques': resolutionTechniques,
      'roleArn': roleArn,
      'workflowName': workflowName,
      if (description != null) 'description': description,
      if (incrementalRunConfig != null)
        'incrementalRunConfig': incrementalRunConfig,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/matchingworkflows',
      exceptionFnMap: _exceptionFns,
    );
    return CreateMatchingWorkflowOutput.fromJson(response);
  }

  /// Creates a schema mapping, which defines the schema of the input customer
  /// records table. The <code>SchemaMapping</code> also provides Entity
  /// Resolution with some metadata about the table, such as the attribute types
  /// of the columns and which columns to match on.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ExceedsLimitException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [mappedInputFields] :
  /// A list of <code>MappedInputFields</code>. Each
  /// <code>MappedInputField</code> corresponds to a column the source data
  /// table, and contains column name plus additional information that Entity
  /// Resolution uses for matching.
  ///
  /// Parameter [schemaName] :
  /// The name of the schema. There can't be multiple
  /// <code>SchemaMappings</code> with the same name.
  ///
  /// Parameter [description] :
  /// A description of the schema.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  Future<CreateSchemaMappingOutput> createSchemaMapping({
    required List<SchemaInputAttribute> mappedInputFields,
    required String schemaName,
    String? description,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'mappedInputFields': mappedInputFields,
      'schemaName': schemaName,
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/schemas',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSchemaMappingOutput.fromJson(response);
  }

  /// Deletes the <code>IdMappingWorkflow</code> with a given name. This
  /// operation will succeed even if a workflow with the given name does not
  /// exist.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [workflowName] :
  /// The name of the workflow to be deleted.
  Future<DeleteIdMappingWorkflowOutput> deleteIdMappingWorkflow({
    required String workflowName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/idmappingworkflows/${Uri.encodeComponent(workflowName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteIdMappingWorkflowOutput.fromJson(response);
  }

  /// Deletes the <code>IdNamespace</code> with a given name.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [idNamespaceName] :
  /// The name of the ID namespace.
  Future<DeleteIdNamespaceOutput> deleteIdNamespace({
    required String idNamespaceName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/idnamespaces/${Uri.encodeComponent(idNamespaceName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteIdNamespaceOutput.fromJson(response);
  }

  /// Deletes the <code>MatchingWorkflow</code> with a given name. This
  /// operation will succeed even if a workflow with the given name does not
  /// exist.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [workflowName] :
  /// The name of the workflow to be retrieved.
  Future<DeleteMatchingWorkflowOutput> deleteMatchingWorkflow({
    required String workflowName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/matchingworkflows/${Uri.encodeComponent(workflowName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteMatchingWorkflowOutput.fromJson(response);
  }

  /// Deletes the policy statement.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The ARN of the resource for which the policy need to be deleted.
  ///
  /// Parameter [statementId] :
  /// A statement identifier that differentiates the statement from others in
  /// the same policy.
  Future<DeletePolicyStatementOutput> deletePolicyStatement({
    required String arn,
    required String statementId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/policies/${Uri.encodeComponent(arn)}/${Uri.encodeComponent(statementId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeletePolicyStatementOutput.fromJson(response);
  }

  /// Deletes the <code>SchemaMapping</code> with a given name. This operation
  /// will succeed even if a schema with the given name does not exist. This
  /// operation will fail if there is a <code>MatchingWorkflow</code> object
  /// that references the <code>SchemaMapping</code> in the workflow's
  /// <code>InputSourceConfig</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [schemaName] :
  /// The name of the schema to delete.
  Future<DeleteSchemaMappingOutput> deleteSchemaMapping({
    required String schemaName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/schemas/${Uri.encodeComponent(schemaName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteSchemaMappingOutput.fromJson(response);
  }

  /// Generates or retrieves Match IDs for records using a rule-based matching
  /// workflow. When you call this operation, it processes your records against
  /// the workflow's matching rules to identify potential matches. For existing
  /// records, it retrieves their Match IDs and associated rules. For records
  /// without matches, it generates new Match IDs. The operation saves results
  /// to Amazon S3.
  ///
  /// The processing type (<code>processingType</code>) you choose affects both
  /// the accuracy and response time of the operation. Additional charges apply
  /// for each API call, whether made through the Entity Resolution console or
  /// directly via the API. The rule-based matching workflow must exist and be
  /// active before calling this operation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [records] :
  /// The records to match.
  ///
  /// Parameter [workflowName] :
  /// The name of the rule-based matching workflow.
  ///
  /// Parameter [processingType] :
  /// The processing mode that determines how Match IDs are generated and
  /// results are saved. Each mode provides different levels of accuracy,
  /// response time, and completeness of results.
  ///
  /// If not specified, defaults to <code>CONSISTENT</code>.
  ///
  /// <code>CONSISTENT</code>: Performs immediate lookup and matching against
  /// all existing records, with results saved synchronously. Provides highest
  /// accuracy but slower response time.
  ///
  /// <code>EVENTUAL</code> (shown as <i>Background</i> in the console):
  /// Performs initial match ID lookup or generation immediately, with record
  /// updates processed asynchronously in the background. Offers faster initial
  /// response time, with complete matching results available later in S3.
  ///
  /// <code>EVENTUAL_NO_LOOKUP</code> (shown as <i>Quick ID generation</i> in
  /// the console): Generates new match IDs without checking existing matches,
  /// with updates processed asynchronously. Provides fastest response time but
  /// should only be used for records known to be unique.
  Future<GenerateMatchIdOutput> generateMatchId({
    required List<Record> records,
    required String workflowName,
    ProcessingType? processingType,
  }) async {
    final $payload = <String, dynamic>{
      'records': records,
      if (processingType != null) 'processingType': processingType.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/matchingworkflows/${Uri.encodeComponent(workflowName)}/generateMatches',
      exceptionFnMap: _exceptionFns,
    );
    return GenerateMatchIdOutput.fromJson(response);
  }

  /// Returns the status, metrics, and errors (if there are any) that are
  /// associated with a job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [jobId] :
  /// The ID of the job.
  ///
  /// Parameter [workflowName] :
  /// The name of the workflow.
  Future<GetIdMappingJobOutput> getIdMappingJob({
    required String jobId,
    required String workflowName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/idmappingworkflows/${Uri.encodeComponent(workflowName)}/jobs/${Uri.encodeComponent(jobId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetIdMappingJobOutput.fromJson(response);
  }

  /// Returns the <code>IdMappingWorkflow</code> with a given name, if it
  /// exists.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [workflowName] :
  /// The name of the workflow.
  Future<GetIdMappingWorkflowOutput> getIdMappingWorkflow({
    required String workflowName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/idmappingworkflows/${Uri.encodeComponent(workflowName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetIdMappingWorkflowOutput.fromJson(response);
  }

  /// Returns the <code>IdNamespace</code> with a given name, if it exists.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [idNamespaceName] :
  /// The name of the ID namespace.
  Future<GetIdNamespaceOutput> getIdNamespace({
    required String idNamespaceName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/idnamespaces/${Uri.encodeComponent(idNamespaceName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetIdNamespaceOutput.fromJson(response);
  }

  /// Returns the corresponding Match ID of a customer record if the record has
  /// been processed in a rule-based matching workflow.
  ///
  /// You can call this API as a dry run of an incremental load on the
  /// rule-based matching workflow.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [record] :
  /// The record to fetch the Match ID for.
  ///
  /// Parameter [workflowName] :
  /// The name of the workflow.
  ///
  /// Parameter [applyNormalization] :
  /// Normalizes the attributes defined in the schema in the input data. For
  /// example, if an attribute has an <code>AttributeType</code> of
  /// <code>PHONE_NUMBER</code>, and the data in the input table is in a format
  /// of 1234567890, Entity Resolution will normalize this field in the output
  /// to (123)-456-7890.
  Future<GetMatchIdOutput> getMatchId({
    required Map<String, String> record,
    required String workflowName,
    bool? applyNormalization,
  }) async {
    final $payload = <String, dynamic>{
      'record': record,
      if (applyNormalization != null) 'applyNormalization': applyNormalization,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/matchingworkflows/${Uri.encodeComponent(workflowName)}/matches',
      exceptionFnMap: _exceptionFns,
    );
    return GetMatchIdOutput.fromJson(response);
  }

  /// Returns the status, metrics, and errors (if there are any) that are
  /// associated with a job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [jobId] :
  /// The ID of the job.
  ///
  /// Parameter [workflowName] :
  /// The name of the workflow.
  Future<GetMatchingJobOutput> getMatchingJob({
    required String jobId,
    required String workflowName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/matchingworkflows/${Uri.encodeComponent(workflowName)}/jobs/${Uri.encodeComponent(jobId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetMatchingJobOutput.fromJson(response);
  }

  /// Returns the <code>MatchingWorkflow</code> with a given name, if it exists.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [workflowName] :
  /// The name of the workflow.
  Future<GetMatchingWorkflowOutput> getMatchingWorkflow({
    required String workflowName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/matchingworkflows/${Uri.encodeComponent(workflowName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetMatchingWorkflowOutput.fromJson(response);
  }

  /// Returns the resource-based policy.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the resource for which the policy need
  /// to be returned.
  Future<GetPolicyOutput> getPolicy({
    required String arn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/policies/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetPolicyOutput.fromJson(response);
  }

  /// Returns the <code>ProviderService</code> of a given name.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [providerName] :
  /// The name of the provider. This name is typically the company name.
  ///
  /// Parameter [providerServiceName] :
  /// The ARN (Amazon Resource Name) of the product that the provider service
  /// provides.
  Future<GetProviderServiceOutput> getProviderService({
    required String providerName,
    required String providerServiceName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/providerservices/${Uri.encodeComponent(providerName)}/${Uri.encodeComponent(providerServiceName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetProviderServiceOutput.fromJson(response);
  }

  /// Returns the SchemaMapping of a given name.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [schemaName] :
  /// The name of the schema to be retrieved.
  Future<GetSchemaMappingOutput> getSchemaMapping({
    required String schemaName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/schemas/${Uri.encodeComponent(schemaName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSchemaMappingOutput.fromJson(response);
  }

  /// Lists all ID mapping jobs for a given workflow.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [workflowName] :
  /// The name of the workflow to be retrieved.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects returned per page.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from the previous API call.
  Future<ListIdMappingJobsOutput> listIdMappingJobs({
    required String workflowName,
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/idmappingworkflows/${Uri.encodeComponent(workflowName)}/jobs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListIdMappingJobsOutput.fromJson(response);
  }

  /// Returns a list of all the <code>IdMappingWorkflows</code> that have been
  /// created for an Amazon Web Services account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects returned per page.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from the previous API call.
  Future<ListIdMappingWorkflowsOutput> listIdMappingWorkflows({
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/idmappingworkflows',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListIdMappingWorkflowsOutput.fromJson(response);
  }

  /// Returns a list of all ID namespaces.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of <code>IdNamespace</code> objects returned per page.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from the previous API call.
  Future<ListIdNamespacesOutput> listIdNamespaces({
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/idnamespaces',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListIdNamespacesOutput.fromJson(response);
  }

  /// Lists all jobs for a given workflow.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [workflowName] :
  /// The name of the workflow to be retrieved.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects returned per page.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from the previous API call.
  Future<ListMatchingJobsOutput> listMatchingJobs({
    required String workflowName,
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/matchingworkflows/${Uri.encodeComponent(workflowName)}/jobs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMatchingJobsOutput.fromJson(response);
  }

  /// Returns a list of all the <code>MatchingWorkflows</code> that have been
  /// created for an Amazon Web Services account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects returned per page.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from the previous API call.
  Future<ListMatchingWorkflowsOutput> listMatchingWorkflows({
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/matchingworkflows',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMatchingWorkflowsOutput.fromJson(response);
  }

  /// Returns a list of all the <code>ProviderServices</code> that are available
  /// in this Amazon Web Services Region.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects returned per page.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from the previous API call.
  ///
  /// Parameter [providerName] :
  /// The name of the provider. This name is typically the company name.
  Future<ListProviderServicesOutput> listProviderServices({
    int? maxResults,
    String? nextToken,
    String? providerName,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (providerName != null) 'providerName': [providerName],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/providerservices',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListProviderServicesOutput.fromJson(response);
  }

  /// Returns a list of all the <code>SchemaMappings</code> that have been
  /// created for an Amazon Web Services account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects returned per page.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from the previous API call.
  Future<ListSchemaMappingsOutput> listSchemaMappings({
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/schemas',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSchemaMappingsOutput.fromJson(response);
  }

  /// Displays the tags associated with an Entity Resolution resource. In Entity
  /// Resolution, <code>SchemaMapping</code>, and <code>MatchingWorkflow</code>
  /// can be tagged.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource for which you want to view tags.
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

  /// Updates the resource-based policy.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the resource for which the policy needs
  /// to be updated.
  ///
  /// Parameter [policy] :
  /// The resource-based policy.
  /// <important>
  /// If you set the value of the <code>effect</code> parameter in the
  /// <code>policy</code> to <code>Deny</code> for the <code>PutPolicy</code>
  /// operation, you must also set the value of the <code>effect</code>
  /// parameter to <code>Deny</code> for the <code>AddPolicyStatement</code>
  /// operation.
  /// </important>
  ///
  /// Parameter [token] :
  /// A unique identifier for the current revision of the policy.
  Future<PutPolicyOutput> putPolicy({
    required String arn,
    required String policy,
    String? token,
  }) async {
    final $payload = <String, dynamic>{
      'policy': policy,
      if (token != null) 'token': token,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/policies/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
    return PutPolicyOutput.fromJson(response);
  }

  /// Starts the <code>IdMappingJob</code> of a workflow. The workflow must have
  /// previously been created using the <code>CreateIdMappingWorkflow</code>
  /// endpoint.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ExceedsLimitException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [workflowName] :
  /// The name of the ID mapping job to be retrieved.
  ///
  /// Parameter [jobType] :
  /// The job type for the ID mapping job.
  ///
  /// If the <code>jobType</code> value is set to <code>INCREMENTAL</code>, only
  /// new or changed data is processed since the last job run. This is the
  /// default value if the <code>CreateIdMappingWorkflow</code> API is
  /// configured with an <code>incrementalRunConfig</code>.
  ///
  /// If the <code>jobType</code> value is set to <code>BATCH</code>, all data
  /// is processed from the input source, regardless of previous job runs. This
  /// is the default value if the <code>CreateIdMappingWorkflow</code> API isn't
  /// configured with an <code>incrementalRunConfig</code>.
  ///
  /// If the <code>jobType</code> value is set to <code>DELETE_ONLY</code>, only
  /// deletion requests from <code>BatchDeleteUniqueIds</code> are processed.
  ///
  /// Parameter [outputSourceConfig] :
  /// A list of <code>OutputSource</code> objects.
  Future<StartIdMappingJobOutput> startIdMappingJob({
    required String workflowName,
    JobType? jobType,
    List<IdMappingJobOutputSource>? outputSourceConfig,
  }) async {
    final $payload = <String, dynamic>{
      if (jobType != null) 'jobType': jobType.value,
      if (outputSourceConfig != null) 'outputSourceConfig': outputSourceConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/idmappingworkflows/${Uri.encodeComponent(workflowName)}/jobs',
      exceptionFnMap: _exceptionFns,
    );
    return StartIdMappingJobOutput.fromJson(response);
  }

  /// Starts the <code>MatchingJob</code> of a workflow. The workflow must have
  /// previously been created using the <code>CreateMatchingWorkflow</code>
  /// endpoint.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ExceedsLimitException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [workflowName] :
  /// The name of the matching job to be retrieved.
  Future<StartMatchingJobOutput> startMatchingJob({
    required String workflowName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/matchingworkflows/${Uri.encodeComponent(workflowName)}/jobs',
      exceptionFnMap: _exceptionFns,
    );
    return StartMatchingJobOutput.fromJson(response);
  }

  /// Assigns one or more tags (key-value pairs) to the specified Entity
  /// Resolution resource. Tags can help you organize and categorize your
  /// resources. You can also use them to scope user permissions by granting a
  /// user permission to access or change only resources with certain tag
  /// values. In Entity Resolution, <code>SchemaMapping</code> and
  /// <code>MatchingWorkflow</code> can be tagged. Tags don't have any semantic
  /// meaning to Amazon Web Services and are interpreted strictly as strings of
  /// characters. You can use the <code>TagResource</code> action with a
  /// resource that already has tags. If you specify a new tag key, this tag is
  /// appended to the list of tags associated with the resource. If you specify
  /// a tag key that is already associated with the resource, the new tag value
  /// that you specify replaces the previous value for that tag.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource for which you want to view tags.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
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

  /// Removes one or more tags from the specified Entity Resolution resource. In
  /// Entity Resolution, <code>SchemaMapping</code>, and
  /// <code>MatchingWorkflow</code> can be tagged.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource for which you want to untag.
  ///
  /// Parameter [tagKeys] :
  /// The list of tag keys to remove from the resource.
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

  /// Updates an existing <code>IdMappingWorkflow</code>. This method is
  /// identical to CreateIdMappingWorkflow, except it uses an HTTP
  /// <code>PUT</code> request instead of a <code>POST</code> request, and the
  /// <code>IdMappingWorkflow</code> must already exist for the method to
  /// succeed.
  /// <important>
  /// Incremental processing is not supported for ID mapping workflows.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [idMappingTechniques] :
  /// An object which defines the ID mapping technique and any additional
  /// configurations.
  ///
  /// Parameter [inputSourceConfig] :
  /// A list of <code>InputSource</code> objects, which have the fields
  /// <code>InputSourceARN</code> and <code>SchemaName</code>.
  ///
  /// Parameter [workflowName] :
  /// The name of the workflow.
  ///
  /// Parameter [description] :
  /// A description of the workflow.
  ///
  /// Parameter [incrementalRunConfig] :
  /// The incremental run configuration for the update ID mapping workflow.
  ///
  /// Parameter [outputSourceConfig] :
  /// A list of <code>OutputSource</code> objects, each of which contains fields
  /// <code>outputS3Path</code> and <code>KMSArn</code>.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role. Entity Resolution assumes
  /// this role to access Amazon Web Services resources on your behalf.
  Future<UpdateIdMappingWorkflowOutput> updateIdMappingWorkflow({
    required IdMappingTechniques idMappingTechniques,
    required List<IdMappingWorkflowInputSource> inputSourceConfig,
    required String workflowName,
    String? description,
    IdMappingIncrementalRunConfig? incrementalRunConfig,
    List<IdMappingWorkflowOutputSource>? outputSourceConfig,
    String? roleArn,
  }) async {
    final $payload = <String, dynamic>{
      'idMappingTechniques': idMappingTechniques,
      'inputSourceConfig': inputSourceConfig,
      if (description != null) 'description': description,
      if (incrementalRunConfig != null)
        'incrementalRunConfig': incrementalRunConfig,
      if (outputSourceConfig != null) 'outputSourceConfig': outputSourceConfig,
      if (roleArn != null) 'roleArn': roleArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/idmappingworkflows/${Uri.encodeComponent(workflowName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateIdMappingWorkflowOutput.fromJson(response);
  }

  /// Updates an existing ID namespace.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [idNamespaceName] :
  /// The name of the ID namespace.
  ///
  /// Parameter [description] :
  /// The description of the ID namespace.
  ///
  /// Parameter [idMappingWorkflowProperties] :
  /// Determines the properties of <code>IdMappingWorkflow</code> where this
  /// <code>IdNamespace</code> can be used as a <code>Source</code> or a
  /// <code>Target</code>.
  ///
  /// Parameter [inputSourceConfig] :
  /// A list of <code>InputSource</code> objects, which have the fields
  /// <code>InputSourceARN</code> and <code>SchemaName</code>.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role. Entity Resolution assumes
  /// this role to access the resources defined in this <code>IdNamespace</code>
  /// on your behalf as part of a workflow run.
  Future<UpdateIdNamespaceOutput> updateIdNamespace({
    required String idNamespaceName,
    String? description,
    List<IdNamespaceIdMappingWorkflowProperties>? idMappingWorkflowProperties,
    List<IdNamespaceInputSource>? inputSourceConfig,
    String? roleArn,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (idMappingWorkflowProperties != null)
        'idMappingWorkflowProperties': idMappingWorkflowProperties,
      if (inputSourceConfig != null) 'inputSourceConfig': inputSourceConfig,
      if (roleArn != null) 'roleArn': roleArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/idnamespaces/${Uri.encodeComponent(idNamespaceName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateIdNamespaceOutput.fromJson(response);
  }

  /// Updates an existing matching workflow. The workflow must already exist for
  /// this operation to succeed.
  /// <important>
  /// For workflows where <code>resolutionType</code> is
  /// <code>ML_MATCHING</code> or <code>PROVIDER</code>, incremental processing
  /// is not supported.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [inputSourceConfig] :
  /// A list of <code>InputSource</code> objects, which have the fields
  /// <code>InputSourceARN</code> and <code>SchemaName</code>.
  ///
  /// Parameter [outputSourceConfig] :
  /// A list of <code>OutputSource</code> objects, each of which contains fields
  /// <code>outputS3Path</code>, <code>applyNormalization</code>,
  /// <code>KMSArn</code>, and <code>output</code>.
  ///
  /// Parameter [resolutionTechniques] :
  /// An object which defines the <code>resolutionType</code> and the
  /// <code>ruleBasedProperties</code>.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role. Entity Resolution assumes
  /// this role to create resources on your behalf as part of workflow
  /// execution.
  ///
  /// Parameter [workflowName] :
  /// The name of the workflow to be retrieved.
  ///
  /// Parameter [description] :
  /// A description of the workflow.
  ///
  /// Parameter [incrementalRunConfig] :
  /// Optional. An object that defines the incremental run type. This object
  /// contains only the <code>incrementalRunType</code> field, which appears as
  /// "Automatic" in the console.
  /// <important>
  /// For workflows where <code>resolutionType</code> is
  /// <code>ML_MATCHING</code> or <code>PROVIDER</code>, incremental processing
  /// is not supported.
  /// </important>
  Future<UpdateMatchingWorkflowOutput> updateMatchingWorkflow({
    required List<InputSource> inputSourceConfig,
    required List<OutputSource> outputSourceConfig,
    required ResolutionTechniques resolutionTechniques,
    required String roleArn,
    required String workflowName,
    String? description,
    IncrementalRunConfig? incrementalRunConfig,
  }) async {
    final $payload = <String, dynamic>{
      'inputSourceConfig': inputSourceConfig,
      'outputSourceConfig': outputSourceConfig,
      'resolutionTechniques': resolutionTechniques,
      'roleArn': roleArn,
      if (description != null) 'description': description,
      if (incrementalRunConfig != null)
        'incrementalRunConfig': incrementalRunConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/matchingworkflows/${Uri.encodeComponent(workflowName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateMatchingWorkflowOutput.fromJson(response);
  }

  /// Updates a schema mapping.
  /// <note>
  /// A schema is immutable if it is being used by a workflow. Therefore, you
  /// can't update a schema mapping if it's associated with a workflow.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [mappedInputFields] :
  /// A list of <code>MappedInputFields</code>. Each
  /// <code>MappedInputField</code> corresponds to a column the source data
  /// table, and contains column name plus additional information that Entity
  /// Resolution uses for matching.
  ///
  /// Parameter [schemaName] :
  /// The name of the schema. There can't be multiple
  /// <code>SchemaMappings</code> with the same name.
  ///
  /// Parameter [description] :
  /// A description of the schema.
  Future<UpdateSchemaMappingOutput> updateSchemaMapping({
    required List<SchemaInputAttribute> mappedInputFields,
    required String schemaName,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      'mappedInputFields': mappedInputFields,
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/schemas/${Uri.encodeComponent(schemaName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateSchemaMappingOutput.fromJson(response);
  }
}

/// @nodoc
class AddPolicyStatementOutput {
  /// The Amazon Resource Name (ARN) of the resource that will be accessed by the
  /// principal.
  final String arn;

  /// A unique identifier for the current revision of the policy.
  final String token;

  /// The resource-based policy.
  final String? policy;

  AddPolicyStatementOutput({
    required this.arn,
    required this.token,
    this.policy,
  });

  factory AddPolicyStatementOutput.fromJson(Map<String, dynamic> json) {
    return AddPolicyStatementOutput(
      arn: (json['arn'] as String?) ?? '',
      token: (json['token'] as String?) ?? '',
      policy: json['policy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final token = this.token;
    final policy = this.policy;
    return {
      'arn': arn,
      'token': token,
      if (policy != null) 'policy': policy,
    };
  }
}

/// @nodoc
class BatchDeleteUniqueIdOutput {
  /// The unique IDs that were deleted.
  final List<DeletedUniqueId> deleted;

  /// The unique IDs that were disconnected.
  final List<String> disconnectedUniqueIds;

  /// The errors from deleting multiple unique IDs.
  final List<DeleteUniqueIdError> errors;

  /// The status of the batch delete unique ID operation.
  final DeleteUniqueIdStatus status;

  BatchDeleteUniqueIdOutput({
    required this.deleted,
    required this.disconnectedUniqueIds,
    required this.errors,
    required this.status,
  });

  factory BatchDeleteUniqueIdOutput.fromJson(Map<String, dynamic> json) {
    return BatchDeleteUniqueIdOutput(
      deleted: ((json['deleted'] as List?) ?? const [])
          .nonNulls
          .map((e) => DeletedUniqueId.fromJson(e as Map<String, dynamic>))
          .toList(),
      disconnectedUniqueIds:
          ((json['disconnectedUniqueIds'] as List?) ?? const [])
              .nonNulls
              .map((e) => e as String)
              .toList(),
      errors: ((json['errors'] as List?) ?? const [])
          .nonNulls
          .map((e) => DeleteUniqueIdError.fromJson(e as Map<String, dynamic>))
          .toList(),
      status:
          DeleteUniqueIdStatus.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final deleted = this.deleted;
    final disconnectedUniqueIds = this.disconnectedUniqueIds;
    final errors = this.errors;
    final status = this.status;
    return {
      'deleted': deleted,
      'disconnectedUniqueIds': disconnectedUniqueIds,
      'errors': errors,
      'status': status.value,
    };
  }
}

/// @nodoc
class CreateIdMappingWorkflowOutput {
  /// An object which defines the ID mapping technique and any additional
  /// configurations.
  final IdMappingTechniques idMappingTechniques;

  /// A list of <code>InputSource</code> objects, which have the fields
  /// <code>InputSourceARN</code> and <code>SchemaName</code>.
  final List<IdMappingWorkflowInputSource> inputSourceConfig;

  /// The ARN (Amazon Resource Name) that Entity Resolution generated for the
  /// <code>IDMappingWorkflow</code>.
  final String workflowArn;

  /// The name of the workflow.
  final String workflowName;

  /// A description of the workflow.
  final String? description;

  /// The incremental run configuration for the ID mapping workflow.
  final IdMappingIncrementalRunConfig? incrementalRunConfig;

  /// A list of <code>IdMappingWorkflowOutputSource</code> objects, each of which
  /// contains fields <code>outputS3Path</code> and <code>KMSArn</code>.
  final List<IdMappingWorkflowOutputSource>? outputSourceConfig;

  /// The Amazon Resource Name (ARN) of the IAM role. Entity Resolution assumes
  /// this role to create resources on your behalf as part of workflow execution.
  final String? roleArn;

  CreateIdMappingWorkflowOutput({
    required this.idMappingTechniques,
    required this.inputSourceConfig,
    required this.workflowArn,
    required this.workflowName,
    this.description,
    this.incrementalRunConfig,
    this.outputSourceConfig,
    this.roleArn,
  });

  factory CreateIdMappingWorkflowOutput.fromJson(Map<String, dynamic> json) {
    return CreateIdMappingWorkflowOutput(
      idMappingTechniques: IdMappingTechniques.fromJson(
          (json['idMappingTechniques'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      inputSourceConfig: ((json['inputSourceConfig'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              IdMappingWorkflowInputSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      workflowArn: (json['workflowArn'] as String?) ?? '',
      workflowName: (json['workflowName'] as String?) ?? '',
      description: json['description'] as String?,
      incrementalRunConfig: json['incrementalRunConfig'] != null
          ? IdMappingIncrementalRunConfig.fromJson(
              json['incrementalRunConfig'] as Map<String, dynamic>)
          : null,
      outputSourceConfig: (json['outputSourceConfig'] as List?)
          ?.nonNulls
          .map((e) =>
              IdMappingWorkflowOutputSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      roleArn: json['roleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final idMappingTechniques = this.idMappingTechniques;
    final inputSourceConfig = this.inputSourceConfig;
    final workflowArn = this.workflowArn;
    final workflowName = this.workflowName;
    final description = this.description;
    final incrementalRunConfig = this.incrementalRunConfig;
    final outputSourceConfig = this.outputSourceConfig;
    final roleArn = this.roleArn;
    return {
      'idMappingTechniques': idMappingTechniques,
      'inputSourceConfig': inputSourceConfig,
      'workflowArn': workflowArn,
      'workflowName': workflowName,
      if (description != null) 'description': description,
      if (incrementalRunConfig != null)
        'incrementalRunConfig': incrementalRunConfig,
      if (outputSourceConfig != null) 'outputSourceConfig': outputSourceConfig,
      if (roleArn != null) 'roleArn': roleArn,
    };
  }
}

/// @nodoc
class CreateIdNamespaceOutput {
  /// The timestamp of when the ID namespace was created.
  final DateTime createdAt;

  /// The Amazon Resource Name (ARN) of the ID namespace.
  final String idNamespaceArn;

  /// The name of the ID namespace.
  final String idNamespaceName;

  /// The type of ID namespace. There are two types: <code>SOURCE</code> and
  /// <code>TARGET</code>.
  ///
  /// The <code>SOURCE</code> contains configurations for <code>sourceId</code>
  /// data that will be processed in an ID mapping workflow.
  ///
  /// The <code>TARGET</code> contains a configuration of <code>targetId</code> to
  /// which all <code>sourceIds</code> will resolve to.
  final IdNamespaceType type;

  /// The timestamp of when the ID namespace was last updated.
  final DateTime updatedAt;

  /// The description of the ID namespace.
  final String? description;

  /// Determines the properties of <code>IdMappingWorkflow</code> where this
  /// <code>IdNamespace</code> can be used as a <code>Source</code> or a
  /// <code>Target</code>.
  final List<IdNamespaceIdMappingWorkflowProperties>?
      idMappingWorkflowProperties;

  /// A list of <code>InputSource</code> objects, which have the fields
  /// <code>InputSourceARN</code> and <code>SchemaName</code>.
  final List<IdNamespaceInputSource>? inputSourceConfig;

  /// The Amazon Resource Name (ARN) of the IAM role. Entity Resolution assumes
  /// this role to access the resources defined in <code>inputSourceConfig</code>
  /// on your behalf as part of the workflow run.
  final String? roleArn;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  CreateIdNamespaceOutput({
    required this.createdAt,
    required this.idNamespaceArn,
    required this.idNamespaceName,
    required this.type,
    required this.updatedAt,
    this.description,
    this.idMappingWorkflowProperties,
    this.inputSourceConfig,
    this.roleArn,
    this.tags,
  });

  factory CreateIdNamespaceOutput.fromJson(Map<String, dynamic> json) {
    return CreateIdNamespaceOutput(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      idNamespaceArn: (json['idNamespaceArn'] as String?) ?? '',
      idNamespaceName: (json['idNamespaceName'] as String?) ?? '',
      type: IdNamespaceType.fromString((json['type'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      description: json['description'] as String?,
      idMappingWorkflowProperties:
          (json['idMappingWorkflowProperties'] as List?)
              ?.nonNulls
              .map((e) => IdNamespaceIdMappingWorkflowProperties.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      inputSourceConfig: (json['inputSourceConfig'] as List?)
          ?.nonNulls
          .map(
              (e) => IdNamespaceInputSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      roleArn: json['roleArn'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final idNamespaceArn = this.idNamespaceArn;
    final idNamespaceName = this.idNamespaceName;
    final type = this.type;
    final updatedAt = this.updatedAt;
    final description = this.description;
    final idMappingWorkflowProperties = this.idMappingWorkflowProperties;
    final inputSourceConfig = this.inputSourceConfig;
    final roleArn = this.roleArn;
    final tags = this.tags;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'idNamespaceArn': idNamespaceArn,
      'idNamespaceName': idNamespaceName,
      'type': type.value,
      'updatedAt': unixTimestampToJson(updatedAt),
      if (description != null) 'description': description,
      if (idMappingWorkflowProperties != null)
        'idMappingWorkflowProperties': idMappingWorkflowProperties,
      if (inputSourceConfig != null) 'inputSourceConfig': inputSourceConfig,
      if (roleArn != null) 'roleArn': roleArn,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class CreateMatchingWorkflowOutput {
  /// A list of <code>InputSource</code> objects, which have the fields
  /// <code>InputSourceARN</code> and <code>SchemaName</code>.
  final List<InputSource> inputSourceConfig;

  /// A list of <code>OutputSource</code> objects, each of which contains fields
  /// <code>outputS3Path</code>, <code>applyNormalization</code>,
  /// <code>KMSArn</code>, and <code>output</code>.
  final List<OutputSource> outputSourceConfig;

  /// An object which defines the <code>resolutionType</code> and the
  /// <code>ruleBasedProperties</code>.
  final ResolutionTechniques resolutionTechniques;

  /// The Amazon Resource Name (ARN) of the IAM role. Entity Resolution assumes
  /// this role to create resources on your behalf as part of workflow execution.
  final String roleArn;

  /// The ARN (Amazon Resource Name) that Entity Resolution generated for the
  /// <code>MatchingWorkflow</code>.
  final String workflowArn;

  /// The name of the workflow.
  final String workflowName;

  /// A description of the workflow.
  final String? description;

  /// An object which defines an incremental run type and has only
  /// <code>incrementalRunType</code> as a field.
  final IncrementalRunConfig? incrementalRunConfig;

  CreateMatchingWorkflowOutput({
    required this.inputSourceConfig,
    required this.outputSourceConfig,
    required this.resolutionTechniques,
    required this.roleArn,
    required this.workflowArn,
    required this.workflowName,
    this.description,
    this.incrementalRunConfig,
  });

  factory CreateMatchingWorkflowOutput.fromJson(Map<String, dynamic> json) {
    return CreateMatchingWorkflowOutput(
      inputSourceConfig: ((json['inputSourceConfig'] as List?) ?? const [])
          .nonNulls
          .map((e) => InputSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      outputSourceConfig: ((json['outputSourceConfig'] as List?) ?? const [])
          .nonNulls
          .map((e) => OutputSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      resolutionTechniques: ResolutionTechniques.fromJson(
          (json['resolutionTechniques'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      roleArn: (json['roleArn'] as String?) ?? '',
      workflowArn: (json['workflowArn'] as String?) ?? '',
      workflowName: (json['workflowName'] as String?) ?? '',
      description: json['description'] as String?,
      incrementalRunConfig: json['incrementalRunConfig'] != null
          ? IncrementalRunConfig.fromJson(
              json['incrementalRunConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final inputSourceConfig = this.inputSourceConfig;
    final outputSourceConfig = this.outputSourceConfig;
    final resolutionTechniques = this.resolutionTechniques;
    final roleArn = this.roleArn;
    final workflowArn = this.workflowArn;
    final workflowName = this.workflowName;
    final description = this.description;
    final incrementalRunConfig = this.incrementalRunConfig;
    return {
      'inputSourceConfig': inputSourceConfig,
      'outputSourceConfig': outputSourceConfig,
      'resolutionTechniques': resolutionTechniques,
      'roleArn': roleArn,
      'workflowArn': workflowArn,
      'workflowName': workflowName,
      if (description != null) 'description': description,
      if (incrementalRunConfig != null)
        'incrementalRunConfig': incrementalRunConfig,
    };
  }
}

/// @nodoc
class CreateSchemaMappingOutput {
  /// A description of the schema.
  final String description;

  /// A list of <code>MappedInputFields</code>. Each <code>MappedInputField</code>
  /// corresponds to a column the source data table, and contains column name plus
  /// additional information that Entity Resolution uses for matching.
  final List<SchemaInputAttribute> mappedInputFields;

  /// The ARN (Amazon Resource Name) that Entity Resolution generated for the
  /// <code>SchemaMapping</code>.
  final String schemaArn;

  /// The name of the schema.
  final String schemaName;

  CreateSchemaMappingOutput({
    required this.description,
    required this.mappedInputFields,
    required this.schemaArn,
    required this.schemaName,
  });

  factory CreateSchemaMappingOutput.fromJson(Map<String, dynamic> json) {
    return CreateSchemaMappingOutput(
      description: (json['description'] as String?) ?? '',
      mappedInputFields: ((json['mappedInputFields'] as List?) ?? const [])
          .nonNulls
          .map((e) => SchemaInputAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      schemaArn: (json['schemaArn'] as String?) ?? '',
      schemaName: (json['schemaName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final mappedInputFields = this.mappedInputFields;
    final schemaArn = this.schemaArn;
    final schemaName = this.schemaName;
    return {
      'description': description,
      'mappedInputFields': mappedInputFields,
      'schemaArn': schemaArn,
      'schemaName': schemaName,
    };
  }
}

/// @nodoc
class DeleteIdMappingWorkflowOutput {
  /// A successful operation message.
  final String message;

  DeleteIdMappingWorkflowOutput({
    required this.message,
  });

  factory DeleteIdMappingWorkflowOutput.fromJson(Map<String, dynamic> json) {
    return DeleteIdMappingWorkflowOutput(
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

/// @nodoc
class DeleteIdNamespaceOutput {
  /// A successful operation message.
  final String message;

  DeleteIdNamespaceOutput({
    required this.message,
  });

  factory DeleteIdNamespaceOutput.fromJson(Map<String, dynamic> json) {
    return DeleteIdNamespaceOutput(
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

/// @nodoc
class DeleteMatchingWorkflowOutput {
  /// A successful operation message.
  final String message;

  DeleteMatchingWorkflowOutput({
    required this.message,
  });

  factory DeleteMatchingWorkflowOutput.fromJson(Map<String, dynamic> json) {
    return DeleteMatchingWorkflowOutput(
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

/// @nodoc
class DeletePolicyStatementOutput {
  /// The ARN of the resource for which the policy need to be deleted.
  final String arn;

  /// A unique identifier for the deleted policy.
  final String token;

  /// The resource-based policy.
  final String? policy;

  DeletePolicyStatementOutput({
    required this.arn,
    required this.token,
    this.policy,
  });

  factory DeletePolicyStatementOutput.fromJson(Map<String, dynamic> json) {
    return DeletePolicyStatementOutput(
      arn: (json['arn'] as String?) ?? '',
      token: (json['token'] as String?) ?? '',
      policy: json['policy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final token = this.token;
    final policy = this.policy;
    return {
      'arn': arn,
      'token': token,
      if (policy != null) 'policy': policy,
    };
  }
}

/// @nodoc
class DeleteSchemaMappingOutput {
  /// A successful operation message.
  final String message;

  DeleteSchemaMappingOutput({
    required this.message,
  });

  factory DeleteSchemaMappingOutput.fromJson(Map<String, dynamic> json) {
    return DeleteSchemaMappingOutput(
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

/// @nodoc
class GenerateMatchIdOutput {
  /// The records that didn't receive a generated Match ID.
  final List<FailedRecord> failedRecords;

  /// The match groups from the generated match ID.
  final List<MatchGroup> matchGroups;

  GenerateMatchIdOutput({
    required this.failedRecords,
    required this.matchGroups,
  });

  factory GenerateMatchIdOutput.fromJson(Map<String, dynamic> json) {
    return GenerateMatchIdOutput(
      failedRecords: ((json['failedRecords'] as List?) ?? const [])
          .nonNulls
          .map((e) => FailedRecord.fromJson(e as Map<String, dynamic>))
          .toList(),
      matchGroups: ((json['matchGroups'] as List?) ?? const [])
          .nonNulls
          .map((e) => MatchGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failedRecords = this.failedRecords;
    final matchGroups = this.matchGroups;
    return {
      'failedRecords': failedRecords,
      'matchGroups': matchGroups,
    };
  }
}

/// @nodoc
class GetIdMappingJobOutput {
  /// The ID of the job.
  final String jobId;

  /// The time at which the job was started.
  final DateTime startTime;

  /// The current status of the job.
  final JobStatus status;

  /// The time at which the job has finished.
  final DateTime? endTime;
  final ErrorDetails? errorDetails;

  /// The job type of the ID mapping job.
  ///
  /// A value of <code>INCREMENTAL</code> indicates that only new or changed data
  /// was processed since the last job run. This is the default job type if the
  /// workflow was created with an <code>incrementalRunConfig</code>.
  ///
  /// A value of <code>BATCH</code> indicates that all data was processed from the
  /// input source, regardless of previous job runs. This is the default job type
  /// if the workflow wasn't created with an <code>incrementalRunConfig</code>.
  ///
  /// A value of <code>DELETE_ONLY</code> indicates that only deletion requests
  /// from <code>BatchDeleteUniqueIds</code> were processed.
  final JobType? jobType;

  /// Metrics associated with the execution, specifically total records processed,
  /// unique IDs generated, and records the execution skipped.
  final IdMappingJobMetrics? metrics;

  /// A list of <code>OutputSource</code> objects.
  final List<IdMappingJobOutputSource>? outputSourceConfig;

  GetIdMappingJobOutput({
    required this.jobId,
    required this.startTime,
    required this.status,
    this.endTime,
    this.errorDetails,
    this.jobType,
    this.metrics,
    this.outputSourceConfig,
  });

  factory GetIdMappingJobOutput.fromJson(Map<String, dynamic> json) {
    return GetIdMappingJobOutput(
      jobId: (json['jobId'] as String?) ?? '',
      startTime: nonNullableTimeStampFromJson(json['startTime'] ?? 0),
      status: JobStatus.fromString((json['status'] as String?) ?? ''),
      endTime: timeStampFromJson(json['endTime']),
      errorDetails: json['errorDetails'] != null
          ? ErrorDetails.fromJson(json['errorDetails'] as Map<String, dynamic>)
          : null,
      jobType: (json['jobType'] as String?)?.let(JobType.fromString),
      metrics: json['metrics'] != null
          ? IdMappingJobMetrics.fromJson(
              json['metrics'] as Map<String, dynamic>)
          : null,
      outputSourceConfig: (json['outputSourceConfig'] as List?)
          ?.nonNulls
          .map((e) =>
              IdMappingJobOutputSource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    final startTime = this.startTime;
    final status = this.status;
    final endTime = this.endTime;
    final errorDetails = this.errorDetails;
    final jobType = this.jobType;
    final metrics = this.metrics;
    final outputSourceConfig = this.outputSourceConfig;
    return {
      'jobId': jobId,
      'startTime': unixTimestampToJson(startTime),
      'status': status.value,
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (errorDetails != null) 'errorDetails': errorDetails,
      if (jobType != null) 'jobType': jobType.value,
      if (metrics != null) 'metrics': metrics,
      if (outputSourceConfig != null) 'outputSourceConfig': outputSourceConfig,
    };
  }
}

/// @nodoc
class GetIdMappingWorkflowOutput {
  /// The timestamp of when the workflow was created.
  final DateTime createdAt;

  /// An object which defines the ID mapping technique and any additional
  /// configurations.
  final IdMappingTechniques idMappingTechniques;

  /// A list of <code>InputSource</code> objects, which have the fields
  /// <code>InputSourceARN</code> and <code>SchemaName</code>.
  final List<IdMappingWorkflowInputSource> inputSourceConfig;

  /// The timestamp of when the workflow was last updated.
  final DateTime updatedAt;

  /// The ARN (Amazon Resource Name) that Entity Resolution generated for the
  /// <code>IdMappingWorkflow</code> .
  final String workflowArn;

  /// The name of the workflow.
  final String workflowName;

  /// A description of the workflow.
  final String? description;

  /// The incremental run configuration for the ID mapping workflow.
  final IdMappingIncrementalRunConfig? incrementalRunConfig;

  /// A list of <code>OutputSource</code> objects, each of which contains fields
  /// <code>outputS3Path</code> and <code>KMSArn</code>.
  final List<IdMappingWorkflowOutputSource>? outputSourceConfig;

  /// The Amazon Resource Name (ARN) of the IAM role. Entity Resolution assumes
  /// this role to access Amazon Web Services resources on your behalf.
  final String? roleArn;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  GetIdMappingWorkflowOutput({
    required this.createdAt,
    required this.idMappingTechniques,
    required this.inputSourceConfig,
    required this.updatedAt,
    required this.workflowArn,
    required this.workflowName,
    this.description,
    this.incrementalRunConfig,
    this.outputSourceConfig,
    this.roleArn,
    this.tags,
  });

  factory GetIdMappingWorkflowOutput.fromJson(Map<String, dynamic> json) {
    return GetIdMappingWorkflowOutput(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      idMappingTechniques: IdMappingTechniques.fromJson(
          (json['idMappingTechniques'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      inputSourceConfig: ((json['inputSourceConfig'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              IdMappingWorkflowInputSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      workflowArn: (json['workflowArn'] as String?) ?? '',
      workflowName: (json['workflowName'] as String?) ?? '',
      description: json['description'] as String?,
      incrementalRunConfig: json['incrementalRunConfig'] != null
          ? IdMappingIncrementalRunConfig.fromJson(
              json['incrementalRunConfig'] as Map<String, dynamic>)
          : null,
      outputSourceConfig: (json['outputSourceConfig'] as List?)
          ?.nonNulls
          .map((e) =>
              IdMappingWorkflowOutputSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      roleArn: json['roleArn'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final idMappingTechniques = this.idMappingTechniques;
    final inputSourceConfig = this.inputSourceConfig;
    final updatedAt = this.updatedAt;
    final workflowArn = this.workflowArn;
    final workflowName = this.workflowName;
    final description = this.description;
    final incrementalRunConfig = this.incrementalRunConfig;
    final outputSourceConfig = this.outputSourceConfig;
    final roleArn = this.roleArn;
    final tags = this.tags;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'idMappingTechniques': idMappingTechniques,
      'inputSourceConfig': inputSourceConfig,
      'updatedAt': unixTimestampToJson(updatedAt),
      'workflowArn': workflowArn,
      'workflowName': workflowName,
      if (description != null) 'description': description,
      if (incrementalRunConfig != null)
        'incrementalRunConfig': incrementalRunConfig,
      if (outputSourceConfig != null) 'outputSourceConfig': outputSourceConfig,
      if (roleArn != null) 'roleArn': roleArn,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class GetIdNamespaceOutput {
  /// The timestamp of when the ID namespace was created.
  final DateTime createdAt;

  /// The Amazon Resource Name (ARN) of the ID namespace.
  final String idNamespaceArn;

  /// The name of the ID namespace.
  final String idNamespaceName;

  /// The type of ID namespace. There are two types: <code>SOURCE</code> and
  /// <code>TARGET</code>.
  ///
  /// The <code>SOURCE</code> contains configurations for <code>sourceId</code>
  /// data that will be processed in an ID mapping workflow.
  ///
  /// The <code>TARGET</code> contains a configuration of <code>targetId</code> to
  /// which all <code>sourceIds</code> will resolve to.
  final IdNamespaceType type;

  /// The timestamp of when the ID namespace was last updated.
  final DateTime updatedAt;

  /// The description of the ID namespace.
  final String? description;

  /// Determines the properties of <code>IdMappingWorkflow</code> where this
  /// <code>IdNamespace</code> can be used as a <code>Source</code> or a
  /// <code>Target</code>.
  final List<IdNamespaceIdMappingWorkflowProperties>?
      idMappingWorkflowProperties;

  /// A list of <code>InputSource</code> objects, which have the fields
  /// <code>InputSourceARN</code> and <code>SchemaName</code>.
  final List<IdNamespaceInputSource>? inputSourceConfig;

  /// The Amazon Resource Name (ARN) of the IAM role. Entity Resolution assumes
  /// this role to access the resources defined in this <code>IdNamespace</code>
  /// on your behalf as part of a workflow run.
  final String? roleArn;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  GetIdNamespaceOutput({
    required this.createdAt,
    required this.idNamespaceArn,
    required this.idNamespaceName,
    required this.type,
    required this.updatedAt,
    this.description,
    this.idMappingWorkflowProperties,
    this.inputSourceConfig,
    this.roleArn,
    this.tags,
  });

  factory GetIdNamespaceOutput.fromJson(Map<String, dynamic> json) {
    return GetIdNamespaceOutput(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      idNamespaceArn: (json['idNamespaceArn'] as String?) ?? '',
      idNamespaceName: (json['idNamespaceName'] as String?) ?? '',
      type: IdNamespaceType.fromString((json['type'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      description: json['description'] as String?,
      idMappingWorkflowProperties:
          (json['idMappingWorkflowProperties'] as List?)
              ?.nonNulls
              .map((e) => IdNamespaceIdMappingWorkflowProperties.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      inputSourceConfig: (json['inputSourceConfig'] as List?)
          ?.nonNulls
          .map(
              (e) => IdNamespaceInputSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      roleArn: json['roleArn'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final idNamespaceArn = this.idNamespaceArn;
    final idNamespaceName = this.idNamespaceName;
    final type = this.type;
    final updatedAt = this.updatedAt;
    final description = this.description;
    final idMappingWorkflowProperties = this.idMappingWorkflowProperties;
    final inputSourceConfig = this.inputSourceConfig;
    final roleArn = this.roleArn;
    final tags = this.tags;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'idNamespaceArn': idNamespaceArn,
      'idNamespaceName': idNamespaceName,
      'type': type.value,
      'updatedAt': unixTimestampToJson(updatedAt),
      if (description != null) 'description': description,
      if (idMappingWorkflowProperties != null)
        'idMappingWorkflowProperties': idMappingWorkflowProperties,
      if (inputSourceConfig != null) 'inputSourceConfig': inputSourceConfig,
      if (roleArn != null) 'roleArn': roleArn,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class GetMatchIdOutput {
  /// The unique identifiers for this group of match records.
  final String? matchId;

  /// The rule the record matched on.
  final String? matchRule;

  GetMatchIdOutput({
    this.matchId,
    this.matchRule,
  });

  factory GetMatchIdOutput.fromJson(Map<String, dynamic> json) {
    return GetMatchIdOutput(
      matchId: json['matchId'] as String?,
      matchRule: json['matchRule'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final matchId = this.matchId;
    final matchRule = this.matchRule;
    return {
      if (matchId != null) 'matchId': matchId,
      if (matchRule != null) 'matchRule': matchRule,
    };
  }
}

/// @nodoc
class GetMatchingJobOutput {
  /// The unique identifier of the matching job.
  final String jobId;

  /// The time at which the job was started.
  final DateTime startTime;

  /// The current status of the job.
  final JobStatus status;

  /// The time at which the job has finished.
  final DateTime? endTime;

  /// An object containing an error message, if there was an error.
  final ErrorDetails? errorDetails;

  /// Metrics associated with the execution, specifically total records processed,
  /// unique IDs generated, and records the execution skipped.
  final JobMetrics? metrics;

  /// A list of <code>OutputSource</code> objects.
  final List<JobOutputSource>? outputSourceConfig;

  GetMatchingJobOutput({
    required this.jobId,
    required this.startTime,
    required this.status,
    this.endTime,
    this.errorDetails,
    this.metrics,
    this.outputSourceConfig,
  });

  factory GetMatchingJobOutput.fromJson(Map<String, dynamic> json) {
    return GetMatchingJobOutput(
      jobId: (json['jobId'] as String?) ?? '',
      startTime: nonNullableTimeStampFromJson(json['startTime'] ?? 0),
      status: JobStatus.fromString((json['status'] as String?) ?? ''),
      endTime: timeStampFromJson(json['endTime']),
      errorDetails: json['errorDetails'] != null
          ? ErrorDetails.fromJson(json['errorDetails'] as Map<String, dynamic>)
          : null,
      metrics: json['metrics'] != null
          ? JobMetrics.fromJson(json['metrics'] as Map<String, dynamic>)
          : null,
      outputSourceConfig: (json['outputSourceConfig'] as List?)
          ?.nonNulls
          .map((e) => JobOutputSource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    final startTime = this.startTime;
    final status = this.status;
    final endTime = this.endTime;
    final errorDetails = this.errorDetails;
    final metrics = this.metrics;
    final outputSourceConfig = this.outputSourceConfig;
    return {
      'jobId': jobId,
      'startTime': unixTimestampToJson(startTime),
      'status': status.value,
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (errorDetails != null) 'errorDetails': errorDetails,
      if (metrics != null) 'metrics': metrics,
      if (outputSourceConfig != null) 'outputSourceConfig': outputSourceConfig,
    };
  }
}

/// @nodoc
class GetMatchingWorkflowOutput {
  /// The timestamp of when the workflow was created.
  final DateTime createdAt;

  /// A list of <code>InputSource</code> objects, which have the fields
  /// <code>InputSourceARN</code> and <code>SchemaName</code>.
  final List<InputSource> inputSourceConfig;

  /// A list of <code>OutputSource</code> objects, each of which contains fields
  /// <code>outputS3Path</code>, <code>applyNormalization</code>,
  /// <code>KMSArn</code>, and <code>output</code>.
  final List<OutputSource> outputSourceConfig;

  /// An object which defines the <code>resolutionType</code> and the
  /// <code>ruleBasedProperties</code>.
  final ResolutionTechniques resolutionTechniques;

  /// The Amazon Resource Name (ARN) of the IAM role. Entity Resolution assumes
  /// this role to access Amazon Web Services resources on your behalf.
  final String roleArn;

  /// The timestamp of when the workflow was last updated.
  final DateTime updatedAt;

  /// The ARN (Amazon Resource Name) that Entity Resolution generated for the
  /// <code>MatchingWorkflow</code>.
  final String workflowArn;

  /// The name of the workflow.
  final String workflowName;

  /// A description of the workflow.
  final String? description;

  /// An object which defines an incremental run type and has only
  /// <code>incrementalRunType</code> as a field.
  final IncrementalRunConfig? incrementalRunConfig;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  GetMatchingWorkflowOutput({
    required this.createdAt,
    required this.inputSourceConfig,
    required this.outputSourceConfig,
    required this.resolutionTechniques,
    required this.roleArn,
    required this.updatedAt,
    required this.workflowArn,
    required this.workflowName,
    this.description,
    this.incrementalRunConfig,
    this.tags,
  });

  factory GetMatchingWorkflowOutput.fromJson(Map<String, dynamic> json) {
    return GetMatchingWorkflowOutput(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      inputSourceConfig: ((json['inputSourceConfig'] as List?) ?? const [])
          .nonNulls
          .map((e) => InputSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      outputSourceConfig: ((json['outputSourceConfig'] as List?) ?? const [])
          .nonNulls
          .map((e) => OutputSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      resolutionTechniques: ResolutionTechniques.fromJson(
          (json['resolutionTechniques'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      roleArn: (json['roleArn'] as String?) ?? '',
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      workflowArn: (json['workflowArn'] as String?) ?? '',
      workflowName: (json['workflowName'] as String?) ?? '',
      description: json['description'] as String?,
      incrementalRunConfig: json['incrementalRunConfig'] != null
          ? IncrementalRunConfig.fromJson(
              json['incrementalRunConfig'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final inputSourceConfig = this.inputSourceConfig;
    final outputSourceConfig = this.outputSourceConfig;
    final resolutionTechniques = this.resolutionTechniques;
    final roleArn = this.roleArn;
    final updatedAt = this.updatedAt;
    final workflowArn = this.workflowArn;
    final workflowName = this.workflowName;
    final description = this.description;
    final incrementalRunConfig = this.incrementalRunConfig;
    final tags = this.tags;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'inputSourceConfig': inputSourceConfig,
      'outputSourceConfig': outputSourceConfig,
      'resolutionTechniques': resolutionTechniques,
      'roleArn': roleArn,
      'updatedAt': unixTimestampToJson(updatedAt),
      'workflowArn': workflowArn,
      'workflowName': workflowName,
      if (description != null) 'description': description,
      if (incrementalRunConfig != null)
        'incrementalRunConfig': incrementalRunConfig,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class GetPolicyOutput {
  /// The Entity Resolution resource ARN.
  final String arn;

  /// A unique identifier for the current revision of the policy.
  final String token;

  /// The resource-based policy.
  final String? policy;

  GetPolicyOutput({
    required this.arn,
    required this.token,
    this.policy,
  });

  factory GetPolicyOutput.fromJson(Map<String, dynamic> json) {
    return GetPolicyOutput(
      arn: (json['arn'] as String?) ?? '',
      token: (json['token'] as String?) ?? '',
      policy: json['policy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final token = this.token;
    final policy = this.policy;
    return {
      'arn': arn,
      'token': token,
      if (policy != null) 'policy': policy,
    };
  }
}

/// @nodoc
class GetProviderServiceOutput {
  /// Specifies whether output data from the provider is anonymized. A value of
  /// <code>TRUE</code> means the output will be anonymized and you can't relate
  /// the data that comes back from the provider to the identifying input. A value
  /// of <code>FALSE</code> means the output won't be anonymized and you can
  /// relate the data that comes back from the provider to your source data.
  final bool anonymizedOutput;

  /// The required configuration fields to use with the provider service.
  final ProviderEndpointConfiguration providerEndpointConfiguration;

  /// The definition of the provider entity output.
  final Document providerEntityOutputDefinition;

  /// The name of the provider. This name is typically the company name.
  final String providerName;

  /// The ARN (Amazon Resource Name) that Entity Resolution generated for the
  /// provider service.
  final String providerServiceArn;

  /// The display name of the provider service.
  final String providerServiceDisplayName;

  /// The name of the product that the provider service provides.
  final String providerServiceName;

  /// The type of provider service.
  final ServiceType providerServiceType;

  /// Input schema for the provider service.
  final ProviderComponentSchema? providerComponentSchema;

  /// The definition of the provider configuration.
  final Document? providerConfigurationDefinition;

  /// The provider configuration required for different ID namespace types.
  final ProviderIdNameSpaceConfiguration? providerIdNameSpaceConfiguration;

  /// The Amazon Web Services accounts and the S3 permissions that are required by
  /// some providers to create an S3 bucket for intermediate data storage.
  final ProviderIntermediateDataAccessConfiguration?
      providerIntermediateDataAccessConfiguration;

  /// Provider service job configurations.
  final Document? providerJobConfiguration;

  GetProviderServiceOutput({
    required this.anonymizedOutput,
    required this.providerEndpointConfiguration,
    required this.providerEntityOutputDefinition,
    required this.providerName,
    required this.providerServiceArn,
    required this.providerServiceDisplayName,
    required this.providerServiceName,
    required this.providerServiceType,
    this.providerComponentSchema,
    this.providerConfigurationDefinition,
    this.providerIdNameSpaceConfiguration,
    this.providerIntermediateDataAccessConfiguration,
    this.providerJobConfiguration,
  });

  factory GetProviderServiceOutput.fromJson(Map<String, dynamic> json) {
    return GetProviderServiceOutput(
      anonymizedOutput: (json['anonymizedOutput'] as bool?) ?? false,
      providerEndpointConfiguration: ProviderEndpointConfiguration.fromJson(
          (json['providerEndpointConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      providerEntityOutputDefinition: Document.fromJson(
          (json['providerEntityOutputDefinition'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      providerName: (json['providerName'] as String?) ?? '',
      providerServiceArn: (json['providerServiceArn'] as String?) ?? '',
      providerServiceDisplayName:
          (json['providerServiceDisplayName'] as String?) ?? '',
      providerServiceName: (json['providerServiceName'] as String?) ?? '',
      providerServiceType: ServiceType.fromString(
          (json['providerServiceType'] as String?) ?? ''),
      providerComponentSchema: json['providerComponentSchema'] != null
          ? ProviderComponentSchema.fromJson(
              json['providerComponentSchema'] as Map<String, dynamic>)
          : null,
      providerConfigurationDefinition:
          json['providerConfigurationDefinition'] != null
              ? Document.fromJson(json['providerConfigurationDefinition']
                  as Map<String, dynamic>)
              : null,
      providerIdNameSpaceConfiguration:
          json['providerIdNameSpaceConfiguration'] != null
              ? ProviderIdNameSpaceConfiguration.fromJson(
                  json['providerIdNameSpaceConfiguration']
                      as Map<String, dynamic>)
              : null,
      providerIntermediateDataAccessConfiguration:
          json['providerIntermediateDataAccessConfiguration'] != null
              ? ProviderIntermediateDataAccessConfiguration.fromJson(
                  json['providerIntermediateDataAccessConfiguration']
                      as Map<String, dynamic>)
              : null,
      providerJobConfiguration: json['providerJobConfiguration'] != null
          ? Document.fromJson(
              json['providerJobConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final anonymizedOutput = this.anonymizedOutput;
    final providerEndpointConfiguration = this.providerEndpointConfiguration;
    final providerEntityOutputDefinition = this.providerEntityOutputDefinition;
    final providerName = this.providerName;
    final providerServiceArn = this.providerServiceArn;
    final providerServiceDisplayName = this.providerServiceDisplayName;
    final providerServiceName = this.providerServiceName;
    final providerServiceType = this.providerServiceType;
    final providerComponentSchema = this.providerComponentSchema;
    final providerConfigurationDefinition =
        this.providerConfigurationDefinition;
    final providerIdNameSpaceConfiguration =
        this.providerIdNameSpaceConfiguration;
    final providerIntermediateDataAccessConfiguration =
        this.providerIntermediateDataAccessConfiguration;
    final providerJobConfiguration = this.providerJobConfiguration;
    return {
      'anonymizedOutput': anonymizedOutput,
      'providerEndpointConfiguration': providerEndpointConfiguration,
      'providerEntityOutputDefinition': providerEntityOutputDefinition,
      'providerName': providerName,
      'providerServiceArn': providerServiceArn,
      'providerServiceDisplayName': providerServiceDisplayName,
      'providerServiceName': providerServiceName,
      'providerServiceType': providerServiceType.value,
      if (providerComponentSchema != null)
        'providerComponentSchema': providerComponentSchema,
      if (providerConfigurationDefinition != null)
        'providerConfigurationDefinition': providerConfigurationDefinition,
      if (providerIdNameSpaceConfiguration != null)
        'providerIdNameSpaceConfiguration': providerIdNameSpaceConfiguration,
      if (providerIntermediateDataAccessConfiguration != null)
        'providerIntermediateDataAccessConfiguration':
            providerIntermediateDataAccessConfiguration,
      if (providerJobConfiguration != null)
        'providerJobConfiguration': providerJobConfiguration,
    };
  }
}

/// @nodoc
class GetSchemaMappingOutput {
  /// The timestamp of when the <code>SchemaMapping</code> was created.
  final DateTime createdAt;

  /// Specifies whether the schema mapping has been applied to a workflow.
  final bool hasWorkflows;

  /// A list of <code>MappedInputFields</code>. Each <code>MappedInputField</code>
  /// corresponds to a column the source data table, and contains column name plus
  /// additional information Entity Resolution uses for matching.
  final List<SchemaInputAttribute> mappedInputFields;

  /// The ARN (Amazon Resource Name) that Entity Resolution generated for the
  /// SchemaMapping.
  final String schemaArn;

  /// The name of the schema.
  final String schemaName;

  /// The timestamp of when the <code>SchemaMapping</code> was last updated.
  final DateTime updatedAt;

  /// A description of the schema.
  final String? description;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  GetSchemaMappingOutput({
    required this.createdAt,
    required this.hasWorkflows,
    required this.mappedInputFields,
    required this.schemaArn,
    required this.schemaName,
    required this.updatedAt,
    this.description,
    this.tags,
  });

  factory GetSchemaMappingOutput.fromJson(Map<String, dynamic> json) {
    return GetSchemaMappingOutput(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      hasWorkflows: (json['hasWorkflows'] as bool?) ?? false,
      mappedInputFields: ((json['mappedInputFields'] as List?) ?? const [])
          .nonNulls
          .map((e) => SchemaInputAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      schemaArn: (json['schemaArn'] as String?) ?? '',
      schemaName: (json['schemaName'] as String?) ?? '',
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      description: json['description'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final hasWorkflows = this.hasWorkflows;
    final mappedInputFields = this.mappedInputFields;
    final schemaArn = this.schemaArn;
    final schemaName = this.schemaName;
    final updatedAt = this.updatedAt;
    final description = this.description;
    final tags = this.tags;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'hasWorkflows': hasWorkflows,
      'mappedInputFields': mappedInputFields,
      'schemaArn': schemaArn,
      'schemaName': schemaName,
      'updatedAt': unixTimestampToJson(updatedAt),
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class ListIdMappingJobsOutput {
  /// A list of <code>JobSummary</code> objects.
  final List<JobSummary>? jobs;

  /// The pagination token from the previous API call.
  final String? nextToken;

  ListIdMappingJobsOutput({
    this.jobs,
    this.nextToken,
  });

  factory ListIdMappingJobsOutput.fromJson(Map<String, dynamic> json) {
    return ListIdMappingJobsOutput(
      jobs: (json['jobs'] as List?)
          ?.nonNulls
          .map((e) => JobSummary.fromJson(e as Map<String, dynamic>))
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

/// @nodoc
class ListIdMappingWorkflowsOutput {
  /// The pagination token from the previous API call.
  final String? nextToken;

  /// A list of <code>IdMappingWorkflowSummary</code> objects.
  final List<IdMappingWorkflowSummary>? workflowSummaries;

  ListIdMappingWorkflowsOutput({
    this.nextToken,
    this.workflowSummaries,
  });

  factory ListIdMappingWorkflowsOutput.fromJson(Map<String, dynamic> json) {
    return ListIdMappingWorkflowsOutput(
      nextToken: json['nextToken'] as String?,
      workflowSummaries: (json['workflowSummaries'] as List?)
          ?.nonNulls
          .map((e) =>
              IdMappingWorkflowSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final workflowSummaries = this.workflowSummaries;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (workflowSummaries != null) 'workflowSummaries': workflowSummaries,
    };
  }
}

/// @nodoc
class ListIdNamespacesOutput {
  /// A list of <code>IdNamespaceSummaries</code> objects.
  final List<IdNamespaceSummary>? idNamespaceSummaries;

  /// The pagination token from the previous API call.
  final String? nextToken;

  ListIdNamespacesOutput({
    this.idNamespaceSummaries,
    this.nextToken,
  });

  factory ListIdNamespacesOutput.fromJson(Map<String, dynamic> json) {
    return ListIdNamespacesOutput(
      idNamespaceSummaries: (json['idNamespaceSummaries'] as List?)
          ?.nonNulls
          .map((e) => IdNamespaceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final idNamespaceSummaries = this.idNamespaceSummaries;
    final nextToken = this.nextToken;
    return {
      if (idNamespaceSummaries != null)
        'idNamespaceSummaries': idNamespaceSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListMatchingJobsOutput {
  /// A list of <code>JobSummary</code> objects, each of which contain the ID,
  /// status, start time, and end time of a job.
  final List<JobSummary>? jobs;

  /// The pagination token from the previous API call.
  final String? nextToken;

  ListMatchingJobsOutput({
    this.jobs,
    this.nextToken,
  });

  factory ListMatchingJobsOutput.fromJson(Map<String, dynamic> json) {
    return ListMatchingJobsOutput(
      jobs: (json['jobs'] as List?)
          ?.nonNulls
          .map((e) => JobSummary.fromJson(e as Map<String, dynamic>))
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

/// @nodoc
class ListMatchingWorkflowsOutput {
  /// The pagination token from the previous API call.
  final String? nextToken;

  /// A list of <code>MatchingWorkflowSummary</code> objects, each of which
  /// contain the fields <code>workflowName</code>, <code>workflowArn</code>,
  /// <code>resolutionType</code>, <code>createdAt</code>, and
  /// <code>updatedAt</code>.
  final List<MatchingWorkflowSummary>? workflowSummaries;

  ListMatchingWorkflowsOutput({
    this.nextToken,
    this.workflowSummaries,
  });

  factory ListMatchingWorkflowsOutput.fromJson(Map<String, dynamic> json) {
    return ListMatchingWorkflowsOutput(
      nextToken: json['nextToken'] as String?,
      workflowSummaries: (json['workflowSummaries'] as List?)
          ?.nonNulls
          .map((e) =>
              MatchingWorkflowSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final workflowSummaries = this.workflowSummaries;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (workflowSummaries != null) 'workflowSummaries': workflowSummaries,
    };
  }
}

/// @nodoc
class ListProviderServicesOutput {
  /// The pagination token from the previous API call.
  final String? nextToken;

  /// A list of <code>ProviderServices</code> objects.
  final List<ProviderServiceSummary>? providerServiceSummaries;

  ListProviderServicesOutput({
    this.nextToken,
    this.providerServiceSummaries,
  });

  factory ListProviderServicesOutput.fromJson(Map<String, dynamic> json) {
    return ListProviderServicesOutput(
      nextToken: json['nextToken'] as String?,
      providerServiceSummaries: (json['providerServiceSummaries'] as List?)
          ?.nonNulls
          .map(
              (e) => ProviderServiceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final providerServiceSummaries = this.providerServiceSummaries;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (providerServiceSummaries != null)
        'providerServiceSummaries': providerServiceSummaries,
    };
  }
}

/// @nodoc
class ListSchemaMappingsOutput {
  /// The pagination token from the previous API call.
  final String? nextToken;

  /// A list of <code>SchemaMappingSummary</code> objects, each of which contain
  /// the fields <code>SchemaName</code>, <code>SchemaArn</code>,
  /// <code>CreatedAt</code>, <code>UpdatedAt</code>.
  final List<SchemaMappingSummary>? schemaList;

  ListSchemaMappingsOutput({
    this.nextToken,
    this.schemaList,
  });

  factory ListSchemaMappingsOutput.fromJson(Map<String, dynamic> json) {
    return ListSchemaMappingsOutput(
      nextToken: json['nextToken'] as String?,
      schemaList: (json['schemaList'] as List?)
          ?.nonNulls
          .map((e) => SchemaMappingSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final schemaList = this.schemaList;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (schemaList != null) 'schemaList': schemaList,
    };
  }
}

/// @nodoc
class ListTagsForResourceOutput {
  /// The tags used to organize, track, or control access for this resource.
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
class PutPolicyOutput {
  /// The Entity Resolution resource ARN.
  final String arn;

  /// A unique identifier for the current revision of the policy.
  final String token;

  /// The resource-based policy.
  final String? policy;

  PutPolicyOutput({
    required this.arn,
    required this.token,
    this.policy,
  });

  factory PutPolicyOutput.fromJson(Map<String, dynamic> json) {
    return PutPolicyOutput(
      arn: (json['arn'] as String?) ?? '',
      token: (json['token'] as String?) ?? '',
      policy: json['policy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final token = this.token;
    final policy = this.policy;
    return {
      'arn': arn,
      'token': token,
      if (policy != null) 'policy': policy,
    };
  }
}

/// @nodoc
class StartIdMappingJobOutput {
  /// The ID of the job.
  final String jobId;

  /// The job type for the started ID mapping job.
  ///
  /// A value of <code>INCREMENTAL</code> indicates that only new or changed data
  /// was processed since the last job run. This is the default job type if the
  /// workflow was created with an <code>incrementalRunConfig</code>.
  ///
  /// A value of <code>BATCH</code> indicates that all data was processed from the
  /// input source, regardless of previous job runs. This is the default job type
  /// if the workflow wasn't created with an <code>incrementalRunConfig</code>.
  ///
  /// A value of <code>DELETE_ONLY</code> indicates that only deletion requests
  /// from <code>BatchDeleteUniqueIds</code> were processed.
  final JobType? jobType;

  /// A list of <code>OutputSource</code> objects.
  final List<IdMappingJobOutputSource>? outputSourceConfig;

  StartIdMappingJobOutput({
    required this.jobId,
    this.jobType,
    this.outputSourceConfig,
  });

  factory StartIdMappingJobOutput.fromJson(Map<String, dynamic> json) {
    return StartIdMappingJobOutput(
      jobId: (json['jobId'] as String?) ?? '',
      jobType: (json['jobType'] as String?)?.let(JobType.fromString),
      outputSourceConfig: (json['outputSourceConfig'] as List?)
          ?.nonNulls
          .map((e) =>
              IdMappingJobOutputSource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    final jobType = this.jobType;
    final outputSourceConfig = this.outputSourceConfig;
    return {
      'jobId': jobId,
      if (jobType != null) 'jobType': jobType.value,
      if (outputSourceConfig != null) 'outputSourceConfig': outputSourceConfig,
    };
  }
}

/// @nodoc
class StartMatchingJobOutput {
  /// The ID of the job.
  final String jobId;

  StartMatchingJobOutput({
    required this.jobId,
  });

  factory StartMatchingJobOutput.fromJson(Map<String, dynamic> json) {
    return StartMatchingJobOutput(
      jobId: (json['jobId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    return {
      'jobId': jobId,
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
class UpdateIdMappingWorkflowOutput {
  /// An object which defines the ID mapping technique and any additional
  /// configurations.
  final IdMappingTechniques idMappingTechniques;

  /// A list of <code>InputSource</code> objects, which have the fields
  /// <code>InputSourceARN</code> and <code>SchemaName</code>.
  final List<IdMappingWorkflowInputSource> inputSourceConfig;

  /// The Amazon Resource Name (ARN) of the workflow role. Entity Resolution
  /// assumes this role to access Amazon Web Services resources on your behalf.
  final String workflowArn;

  /// The name of the workflow.
  final String workflowName;

  /// A description of the workflow.
  final String? description;

  /// The incremental run configuration for the update ID mapping workflow output.
  final IdMappingIncrementalRunConfig? incrementalRunConfig;

  /// A list of <code>OutputSource</code> objects, each of which contains fields
  /// <code>outputS3Path</code> and <code>KMSArn</code>.
  final List<IdMappingWorkflowOutputSource>? outputSourceConfig;

  /// The Amazon Resource Name (ARN) of the IAM role. Entity Resolution assumes
  /// this role to access Amazon Web Services resources on your behalf.
  final String? roleArn;

  UpdateIdMappingWorkflowOutput({
    required this.idMappingTechniques,
    required this.inputSourceConfig,
    required this.workflowArn,
    required this.workflowName,
    this.description,
    this.incrementalRunConfig,
    this.outputSourceConfig,
    this.roleArn,
  });

  factory UpdateIdMappingWorkflowOutput.fromJson(Map<String, dynamic> json) {
    return UpdateIdMappingWorkflowOutput(
      idMappingTechniques: IdMappingTechniques.fromJson(
          (json['idMappingTechniques'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      inputSourceConfig: ((json['inputSourceConfig'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              IdMappingWorkflowInputSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      workflowArn: (json['workflowArn'] as String?) ?? '',
      workflowName: (json['workflowName'] as String?) ?? '',
      description: json['description'] as String?,
      incrementalRunConfig: json['incrementalRunConfig'] != null
          ? IdMappingIncrementalRunConfig.fromJson(
              json['incrementalRunConfig'] as Map<String, dynamic>)
          : null,
      outputSourceConfig: (json['outputSourceConfig'] as List?)
          ?.nonNulls
          .map((e) =>
              IdMappingWorkflowOutputSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      roleArn: json['roleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final idMappingTechniques = this.idMappingTechniques;
    final inputSourceConfig = this.inputSourceConfig;
    final workflowArn = this.workflowArn;
    final workflowName = this.workflowName;
    final description = this.description;
    final incrementalRunConfig = this.incrementalRunConfig;
    final outputSourceConfig = this.outputSourceConfig;
    final roleArn = this.roleArn;
    return {
      'idMappingTechniques': idMappingTechniques,
      'inputSourceConfig': inputSourceConfig,
      'workflowArn': workflowArn,
      'workflowName': workflowName,
      if (description != null) 'description': description,
      if (incrementalRunConfig != null)
        'incrementalRunConfig': incrementalRunConfig,
      if (outputSourceConfig != null) 'outputSourceConfig': outputSourceConfig,
      if (roleArn != null) 'roleArn': roleArn,
    };
  }
}

/// @nodoc
class UpdateIdNamespaceOutput {
  /// The timestamp of when the ID namespace was created.
  final DateTime createdAt;

  /// The Amazon Resource Name (ARN) of the ID namespace.
  final String idNamespaceArn;

  /// The name of the ID namespace.
  final String idNamespaceName;

  /// The type of ID namespace. There are two types: <code>SOURCE</code> and
  /// <code>TARGET</code>.
  ///
  /// The <code>SOURCE</code> contains configurations for <code>sourceId</code>
  /// data that will be processed in an ID mapping workflow.
  ///
  /// The <code>TARGET</code> contains a configuration of <code>targetId</code> to
  /// which all <code>sourceIds</code> will resolve to.
  final IdNamespaceType type;

  /// The timestamp of when the ID namespace was last updated.
  final DateTime updatedAt;

  /// The description of the ID namespace.
  final String? description;

  /// Determines the properties of <code>IdMappingWorkflow</code> where this
  /// <code>IdNamespace</code> can be used as a <code>Source</code> or a
  /// <code>Target</code>.
  final List<IdNamespaceIdMappingWorkflowProperties>?
      idMappingWorkflowProperties;

  /// A list of <code>InputSource</code> objects, which have the fields
  /// <code>InputSourceARN</code> and <code>SchemaName</code>.
  final List<IdNamespaceInputSource>? inputSourceConfig;

  /// The Amazon Resource Name (ARN) of the IAM role. Entity Resolution assumes
  /// this role to access the resources defined in this <code>IdNamespace</code>
  /// on your behalf as part of a workflow run.
  final String? roleArn;

  UpdateIdNamespaceOutput({
    required this.createdAt,
    required this.idNamespaceArn,
    required this.idNamespaceName,
    required this.type,
    required this.updatedAt,
    this.description,
    this.idMappingWorkflowProperties,
    this.inputSourceConfig,
    this.roleArn,
  });

  factory UpdateIdNamespaceOutput.fromJson(Map<String, dynamic> json) {
    return UpdateIdNamespaceOutput(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      idNamespaceArn: (json['idNamespaceArn'] as String?) ?? '',
      idNamespaceName: (json['idNamespaceName'] as String?) ?? '',
      type: IdNamespaceType.fromString((json['type'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      description: json['description'] as String?,
      idMappingWorkflowProperties:
          (json['idMappingWorkflowProperties'] as List?)
              ?.nonNulls
              .map((e) => IdNamespaceIdMappingWorkflowProperties.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      inputSourceConfig: (json['inputSourceConfig'] as List?)
          ?.nonNulls
          .map(
              (e) => IdNamespaceInputSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      roleArn: json['roleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final idNamespaceArn = this.idNamespaceArn;
    final idNamespaceName = this.idNamespaceName;
    final type = this.type;
    final updatedAt = this.updatedAt;
    final description = this.description;
    final idMappingWorkflowProperties = this.idMappingWorkflowProperties;
    final inputSourceConfig = this.inputSourceConfig;
    final roleArn = this.roleArn;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'idNamespaceArn': idNamespaceArn,
      'idNamespaceName': idNamespaceName,
      'type': type.value,
      'updatedAt': unixTimestampToJson(updatedAt),
      if (description != null) 'description': description,
      if (idMappingWorkflowProperties != null)
        'idMappingWorkflowProperties': idMappingWorkflowProperties,
      if (inputSourceConfig != null) 'inputSourceConfig': inputSourceConfig,
      if (roleArn != null) 'roleArn': roleArn,
    };
  }
}

/// @nodoc
class UpdateMatchingWorkflowOutput {
  /// A list of <code>InputSource</code> objects, which have the fields
  /// <code>InputSourceARN</code> and <code>SchemaName</code>.
  final List<InputSource> inputSourceConfig;

  /// A list of <code>OutputSource</code> objects, each of which contains fields
  /// <code>outputS3Path</code>, <code>applyNormalization</code>,
  /// <code>KMSArn</code>, and <code>output</code>.
  final List<OutputSource> outputSourceConfig;

  /// An object which defines the <code>resolutionType</code> and the
  /// <code>ruleBasedProperties</code>.
  final ResolutionTechniques resolutionTechniques;

  /// The Amazon Resource Name (ARN) of the IAM role. Entity Resolution assumes
  /// this role to create resources on your behalf as part of workflow execution.
  final String roleArn;

  /// The name of the workflow.
  final String workflowName;

  /// A description of the workflow.
  final String? description;

  /// An object which defines an incremental run type and has only
  /// <code>incrementalRunType</code> as a field.
  final IncrementalRunConfig? incrementalRunConfig;

  UpdateMatchingWorkflowOutput({
    required this.inputSourceConfig,
    required this.outputSourceConfig,
    required this.resolutionTechniques,
    required this.roleArn,
    required this.workflowName,
    this.description,
    this.incrementalRunConfig,
  });

  factory UpdateMatchingWorkflowOutput.fromJson(Map<String, dynamic> json) {
    return UpdateMatchingWorkflowOutput(
      inputSourceConfig: ((json['inputSourceConfig'] as List?) ?? const [])
          .nonNulls
          .map((e) => InputSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      outputSourceConfig: ((json['outputSourceConfig'] as List?) ?? const [])
          .nonNulls
          .map((e) => OutputSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      resolutionTechniques: ResolutionTechniques.fromJson(
          (json['resolutionTechniques'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      roleArn: (json['roleArn'] as String?) ?? '',
      workflowName: (json['workflowName'] as String?) ?? '',
      description: json['description'] as String?,
      incrementalRunConfig: json['incrementalRunConfig'] != null
          ? IncrementalRunConfig.fromJson(
              json['incrementalRunConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final inputSourceConfig = this.inputSourceConfig;
    final outputSourceConfig = this.outputSourceConfig;
    final resolutionTechniques = this.resolutionTechniques;
    final roleArn = this.roleArn;
    final workflowName = this.workflowName;
    final description = this.description;
    final incrementalRunConfig = this.incrementalRunConfig;
    return {
      'inputSourceConfig': inputSourceConfig,
      'outputSourceConfig': outputSourceConfig,
      'resolutionTechniques': resolutionTechniques,
      'roleArn': roleArn,
      'workflowName': workflowName,
      if (description != null) 'description': description,
      if (incrementalRunConfig != null)
        'incrementalRunConfig': incrementalRunConfig,
    };
  }
}

/// @nodoc
class UpdateSchemaMappingOutput {
  /// A list of <code>MappedInputFields</code>. Each <code>MappedInputField</code>
  /// corresponds to a column the source data table, and contains column name plus
  /// additional information that Entity Resolution uses for matching.
  final List<SchemaInputAttribute> mappedInputFields;

  /// The ARN (Amazon Resource Name) that Entity Resolution generated for the
  /// <code>SchemaMapping</code>.
  final String schemaArn;

  /// The name of the schema.
  final String schemaName;

  /// A description of the schema.
  final String? description;

  UpdateSchemaMappingOutput({
    required this.mappedInputFields,
    required this.schemaArn,
    required this.schemaName,
    this.description,
  });

  factory UpdateSchemaMappingOutput.fromJson(Map<String, dynamic> json) {
    return UpdateSchemaMappingOutput(
      mappedInputFields: ((json['mappedInputFields'] as List?) ?? const [])
          .nonNulls
          .map((e) => SchemaInputAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      schemaArn: (json['schemaArn'] as String?) ?? '',
      schemaName: (json['schemaName'] as String?) ?? '',
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final mappedInputFields = this.mappedInputFields;
    final schemaArn = this.schemaArn;
    final schemaName = this.schemaName;
    final description = this.description;
    return {
      'mappedInputFields': mappedInputFields,
      'schemaArn': schemaArn,
      'schemaName': schemaName,
      if (description != null) 'description': description,
    };
  }
}

/// A configuration object for defining input data fields in Entity Resolution.
/// The <code>SchemaInputAttribute</code> specifies how individual fields in
/// your input data should be processed and matched.
///
/// @nodoc
class SchemaInputAttribute {
  /// A string containing the field name.
  final String fieldName;

  /// The type of the attribute, selected from a list of values.
  ///
  /// LiveRamp supports: <code>NAME</code> | <code>NAME_FIRST</code> |
  /// <code>NAME_MIDDLE</code> | <code>NAME_LAST</code> | <code>ADDRESS</code> |
  /// <code>ADDRESS_STREET1</code> | <code>ADDRESS_STREET2</code> |
  /// <code>ADDRESS_STREET3</code> | <code>ADDRESS_CITY</code> |
  /// <code>ADDRESS_STATE</code> | <code>ADDRESS_COUNTRY</code> |
  /// <code>ADDRESS_POSTALCODE</code> | <code>PHONE</code> |
  /// <code>PHONE_NUMBER</code> | <code>EMAIL_ADDRESS</code> |
  /// <code>UNIQUE_ID</code> | <code>PROVIDER_ID</code>
  ///
  /// TransUnion supports: <code>NAME</code> | <code>NAME_FIRST</code> |
  /// <code>NAME_LAST</code> | <code>ADDRESS</code> | <code>ADDRESS_CITY</code> |
  /// <code>ADDRESS_STATE</code> | <code>ADDRESS_COUNTRY</code> |
  /// <code>ADDRESS_POSTALCODE</code> | <code>PHONE_NUMBER</code> |
  /// <code>EMAIL_ADDRESS</code> | <code>UNIQUE_ID</code> | <code>IPV4</code> |
  /// <code>IPV6</code> | <code>MAID</code>
  ///
  /// Unified ID 2.0 supports: <code>PHONE_NUMBER</code> |
  /// <code>EMAIL_ADDRESS</code> | <code>UNIQUE_ID</code>
  /// <note>
  /// Normalization is only supported for <code>NAME</code>, <code>ADDRESS</code>,
  /// <code>PHONE</code>, and <code>EMAIL_ADDRESS</code>.
  ///
  /// If you want to normalize <code>NAME_FIRST</code>, <code>NAME_MIDDLE</code>,
  /// and <code>NAME_LAST</code>, you must group them by assigning them to the
  /// <code>NAME</code> <code>groupName</code>.
  ///
  /// If you want to normalize <code>ADDRESS_STREET1</code>,
  /// <code>ADDRESS_STREET2</code>, <code>ADDRESS_STREET3</code>,
  /// <code>ADDRESS_CITY</code>, <code>ADDRESS_STATE</code>,
  /// <code>ADDRESS_COUNTRY</code>, and <code>ADDRESS_POSTALCODE</code>, you must
  /// group them by assigning them to the <code>ADDRESS</code>
  /// <code>groupName</code>.
  ///
  /// If you want to normalize <code>PHONE_NUMBER</code> and
  /// <code>PHONE_COUNTRYCODE</code>, you must group them by assigning them to the
  /// <code>PHONE</code> <code>groupName</code>.
  /// </note>
  final SchemaAttributeType type;

  /// A string that instructs Entity Resolution to combine several columns into a
  /// unified column with the identical attribute type.
  ///
  /// For example, when working with columns such as <code>NAME_FIRST</code>,
  /// <code>NAME_MIDDLE</code>, and <code>NAME_LAST</code>, assigning them a
  /// common <code>groupName</code> will prompt Entity Resolution to concatenate
  /// them into a single value.
  final String? groupName;

  /// Indicates if the column values are hashed in the schema input.
  ///
  /// If the value is set to <code>TRUE</code>, the column values are hashed.
  ///
  /// If the value is set to <code>FALSE</code>, the column values are cleartext.
  final bool? hashed;

  /// A key that allows grouping of multiple input attributes into a unified
  /// matching group.
  ///
  /// For example, consider a scenario where the source table contains various
  /// addresses, such as <code>business_address</code> and
  /// <code>shipping_address</code>. By assigning a <code>matchKey</code> called
  /// <code>address</code> to both attributes, Entity Resolution will match
  /// records across these fields to create a consolidated matching group.
  ///
  /// If no <code>matchKey</code> is specified for a column, it won't be utilized
  /// for matching purposes but will still be included in the output table.
  final String? matchKey;

  /// The subtype of the attribute, selected from a list of values.
  final String? subType;

  SchemaInputAttribute({
    required this.fieldName,
    required this.type,
    this.groupName,
    this.hashed,
    this.matchKey,
    this.subType,
  });

  factory SchemaInputAttribute.fromJson(Map<String, dynamic> json) {
    return SchemaInputAttribute(
      fieldName: (json['fieldName'] as String?) ?? '',
      type: SchemaAttributeType.fromString((json['type'] as String?) ?? ''),
      groupName: json['groupName'] as String?,
      hashed: json['hashed'] as bool?,
      matchKey: json['matchKey'] as String?,
      subType: json['subType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fieldName = this.fieldName;
    final type = this.type;
    final groupName = this.groupName;
    final hashed = this.hashed;
    final matchKey = this.matchKey;
    final subType = this.subType;
    return {
      'fieldName': fieldName,
      'type': type.value,
      if (groupName != null) 'groupName': groupName,
      if (hashed != null) 'hashed': hashed,
      if (matchKey != null) 'matchKey': matchKey,
      if (subType != null) 'subType': subType,
    };
  }
}

/// @nodoc
class SchemaAttributeType {
  static const name = SchemaAttributeType._('NAME');
  static const nameFirst = SchemaAttributeType._('NAME_FIRST');
  static const nameMiddle = SchemaAttributeType._('NAME_MIDDLE');
  static const nameLast = SchemaAttributeType._('NAME_LAST');
  static const address = SchemaAttributeType._('ADDRESS');
  static const addressStreet1 = SchemaAttributeType._('ADDRESS_STREET1');
  static const addressStreet2 = SchemaAttributeType._('ADDRESS_STREET2');
  static const addressStreet3 = SchemaAttributeType._('ADDRESS_STREET3');
  static const addressCity = SchemaAttributeType._('ADDRESS_CITY');
  static const addressState = SchemaAttributeType._('ADDRESS_STATE');
  static const addressCountry = SchemaAttributeType._('ADDRESS_COUNTRY');
  static const addressPostalcode = SchemaAttributeType._('ADDRESS_POSTALCODE');
  static const phone = SchemaAttributeType._('PHONE');
  static const phoneNumber = SchemaAttributeType._('PHONE_NUMBER');
  static const phoneCountrycode = SchemaAttributeType._('PHONE_COUNTRYCODE');
  static const emailAddress = SchemaAttributeType._('EMAIL_ADDRESS');
  static const uniqueId = SchemaAttributeType._('UNIQUE_ID');
  static const date = SchemaAttributeType._('DATE');
  static const string = SchemaAttributeType._('STRING');
  static const providerId = SchemaAttributeType._('PROVIDER_ID');
  static const ipv4 = SchemaAttributeType._('IPV4');
  static const ipv6 = SchemaAttributeType._('IPV6');
  static const maid = SchemaAttributeType._('MAID');

  final String value;

  const SchemaAttributeType._(this.value);

  static const values = [
    name,
    nameFirst,
    nameMiddle,
    nameLast,
    address,
    addressStreet1,
    addressStreet2,
    addressStreet3,
    addressCity,
    addressState,
    addressCountry,
    addressPostalcode,
    phone,
    phoneNumber,
    phoneCountrycode,
    emailAddress,
    uniqueId,
    date,
    string,
    providerId,
    ipv4,
    ipv6,
    maid
  ];

  static SchemaAttributeType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SchemaAttributeType._(value));

  @override
  bool operator ==(other) =>
      other is SchemaAttributeType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An object which defines the <code>resolutionType</code> and the
/// <code>ruleBasedProperties</code>.
///
/// @nodoc
class ResolutionTechniques {
  /// The type of matching workflow to create. Specify one of the following types:
  ///
  /// <ul>
  /// <li>
  /// <code>RULE_MATCHING</code>: Match records using configurable rule-based
  /// criteria
  /// </li>
  /// <li>
  /// <code>ML_MATCHING</code>: Match records using machine learning models
  /// </li>
  /// <li>
  /// <code>PROVIDER</code>: Match records using a third-party matching provider
  /// </li>
  /// </ul>
  final ResolutionType resolutionType;

  /// The properties of the provider service.
  final ProviderProperties? providerProperties;

  /// An object which defines the list of matching rules to run and has a field
  /// <code>rules</code>, which is a list of rule objects.
  final RuleBasedProperties? ruleBasedProperties;

  /// An object containing the <code>rules</code> for a matching workflow.
  final RuleConditionProperties? ruleConditionProperties;

  ResolutionTechniques({
    required this.resolutionType,
    this.providerProperties,
    this.ruleBasedProperties,
    this.ruleConditionProperties,
  });

  factory ResolutionTechniques.fromJson(Map<String, dynamic> json) {
    return ResolutionTechniques(
      resolutionType:
          ResolutionType.fromString((json['resolutionType'] as String?) ?? ''),
      providerProperties: json['providerProperties'] != null
          ? ProviderProperties.fromJson(
              json['providerProperties'] as Map<String, dynamic>)
          : null,
      ruleBasedProperties: json['ruleBasedProperties'] != null
          ? RuleBasedProperties.fromJson(
              json['ruleBasedProperties'] as Map<String, dynamic>)
          : null,
      ruleConditionProperties: json['ruleConditionProperties'] != null
          ? RuleConditionProperties.fromJson(
              json['ruleConditionProperties'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final resolutionType = this.resolutionType;
    final providerProperties = this.providerProperties;
    final ruleBasedProperties = this.ruleBasedProperties;
    final ruleConditionProperties = this.ruleConditionProperties;
    return {
      'resolutionType': resolutionType.value,
      if (providerProperties != null) 'providerProperties': providerProperties,
      if (ruleBasedProperties != null)
        'ruleBasedProperties': ruleBasedProperties,
      if (ruleConditionProperties != null)
        'ruleConditionProperties': ruleConditionProperties,
    };
  }
}

/// Optional. An object that defines the incremental run type. This object
/// contains only the <code>incrementalRunType</code> field, which appears as
/// "Automatic" in the console.
/// <important>
/// For workflows where <code>resolutionType</code> is <code>ML_MATCHING</code>
/// or <code>PROVIDER</code>, incremental processing is not supported.
/// </important>
///
/// @nodoc
class IncrementalRunConfig {
  /// The type of incremental run. The only valid value is <code>IMMEDIATE</code>.
  /// This appears as "Automatic" in the console.
  /// <important>
  /// For workflows where <code>resolutionType</code> is <code>ML_MATCHING</code>
  /// or <code>PROVIDER</code>, incremental processing is not supported.
  /// </important>
  final IncrementalRunType? incrementalRunType;

  IncrementalRunConfig({
    this.incrementalRunType,
  });

  factory IncrementalRunConfig.fromJson(Map<String, dynamic> json) {
    return IncrementalRunConfig(
      incrementalRunType: (json['incrementalRunType'] as String?)
          ?.let(IncrementalRunType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final incrementalRunType = this.incrementalRunType;
    return {
      if (incrementalRunType != null)
        'incrementalRunType': incrementalRunType.value,
    };
  }
}

/// @nodoc
class IncrementalRunType {
  static const immediate = IncrementalRunType._('IMMEDIATE');

  final String value;

  const IncrementalRunType._(this.value);

  static const values = [immediate];

  static IncrementalRunType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IncrementalRunType._(value));

  @override
  bool operator ==(other) =>
      other is IncrementalRunType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ResolutionType {
  static const ruleMatching = ResolutionType._('RULE_MATCHING');
  static const mlMatching = ResolutionType._('ML_MATCHING');
  static const provider = ResolutionType._('PROVIDER');

  final String value;

  const ResolutionType._(this.value);

  static const values = [ruleMatching, mlMatching, provider];

  static ResolutionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ResolutionType._(value));

  @override
  bool operator ==(other) => other is ResolutionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An object which defines the list of matching rules to run in a matching
/// workflow.
///
/// @nodoc
class RuleBasedProperties {
  /// The comparison type. You can choose <code>ONE_TO_ONE</code> or
  /// <code>MANY_TO_MANY</code> as the <code>attributeMatchingModel</code>.
  ///
  /// If you choose <code>ONE_TO_ONE</code>, the system can only match attributes
  /// if the sub-types are an exact match. For example, for the <code>Email</code>
  /// attribute type, the system will only consider it a match if the value of the
  /// <code>Email</code> field of Profile A matches the value of the
  /// <code>Email</code> field of Profile B.
  ///
  /// If you choose <code>MANY_TO_MANY</code>, the system can match attributes
  /// across the sub-types of an attribute type. For example, if the value of the
  /// <code>Email</code> field of Profile A and the value of
  /// <code>BusinessEmail</code> field of Profile B matches, the two profiles are
  /// matched on the <code>Email</code> attribute type.
  final AttributeMatchingModel attributeMatchingModel;

  /// A list of <code>Rule</code> objects, each of which have fields
  /// <code>RuleName</code> and <code>MatchingKeys</code>.
  final List<Rule> rules;

  /// An indicator of whether to generate IDs and index the data or not.
  ///
  /// If you choose <code>IDENTIFIER_GENERATION</code>, the process generates IDs
  /// and indexes the data.
  ///
  /// If you choose <code>INDEXING</code>, the process indexes the data without
  /// generating IDs.
  final MatchPurpose? matchPurpose;

  RuleBasedProperties({
    required this.attributeMatchingModel,
    required this.rules,
    this.matchPurpose,
  });

  factory RuleBasedProperties.fromJson(Map<String, dynamic> json) {
    return RuleBasedProperties(
      attributeMatchingModel: AttributeMatchingModel.fromString(
          (json['attributeMatchingModel'] as String?) ?? ''),
      rules: ((json['rules'] as List?) ?? const [])
          .nonNulls
          .map((e) => Rule.fromJson(e as Map<String, dynamic>))
          .toList(),
      matchPurpose:
          (json['matchPurpose'] as String?)?.let(MatchPurpose.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final attributeMatchingModel = this.attributeMatchingModel;
    final rules = this.rules;
    final matchPurpose = this.matchPurpose;
    return {
      'attributeMatchingModel': attributeMatchingModel.value,
      'rules': rules,
      if (matchPurpose != null) 'matchPurpose': matchPurpose.value,
    };
  }
}

/// The properties of a rule condition that provides the ability to use more
/// complex syntax.
///
/// @nodoc
class RuleConditionProperties {
  /// A list of rule objects, each of which have fields <code>ruleName</code> and
  /// <code>condition</code>.
  final List<RuleCondition> rules;

  /// An object that contains configuration settings for the matching process.
  final MatchingConfig? matchingConfig;

  RuleConditionProperties({
    required this.rules,
    this.matchingConfig,
  });

  factory RuleConditionProperties.fromJson(Map<String, dynamic> json) {
    return RuleConditionProperties(
      rules: ((json['rules'] as List?) ?? const [])
          .nonNulls
          .map((e) => RuleCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      matchingConfig: json['matchingConfig'] != null
          ? MatchingConfig.fromJson(
              json['matchingConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final rules = this.rules;
    final matchingConfig = this.matchingConfig;
    return {
      'rules': rules,
      if (matchingConfig != null) 'matchingConfig': matchingConfig,
    };
  }
}

/// An object containing the <code>providerServiceARN</code>,
/// <code>intermediateSourceConfiguration</code>, and
/// <code>providerConfiguration</code>.
///
/// @nodoc
class ProviderProperties {
  /// The ARN of the provider service.
  final String providerServiceArn;

  /// The Amazon S3 location that temporarily stores your data while it processes.
  /// Your information won't be saved permanently.
  final IntermediateSourceConfiguration? intermediateSourceConfiguration;

  /// The required configuration fields to use with the provider service.
  final Document? providerConfiguration;

  ProviderProperties({
    required this.providerServiceArn,
    this.intermediateSourceConfiguration,
    this.providerConfiguration,
  });

  factory ProviderProperties.fromJson(Map<String, dynamic> json) {
    return ProviderProperties(
      providerServiceArn: (json['providerServiceArn'] as String?) ?? '',
      intermediateSourceConfiguration:
          json['intermediateSourceConfiguration'] != null
              ? IntermediateSourceConfiguration.fromJson(
                  json['intermediateSourceConfiguration']
                      as Map<String, dynamic>)
              : null,
      providerConfiguration: json['providerConfiguration'] != null
          ? Document.fromJson(
              json['providerConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final providerServiceArn = this.providerServiceArn;
    final intermediateSourceConfiguration =
        this.intermediateSourceConfiguration;
    final providerConfiguration = this.providerConfiguration;
    return {
      'providerServiceArn': providerServiceArn,
      if (intermediateSourceConfiguration != null)
        'intermediateSourceConfiguration': intermediateSourceConfiguration,
      if (providerConfiguration != null)
        'providerConfiguration': providerConfiguration,
    };
  }
}

/// The Amazon S3 location that temporarily stores your data while it processes.
/// Your information won't be saved permanently.
///
/// @nodoc
class IntermediateSourceConfiguration {
  /// The Amazon S3 location (bucket and prefix). For example:
  /// <code>s3://provider_bucket/DOC-EXAMPLE-BUCKET</code>
  final String intermediateS3Path;

  IntermediateSourceConfiguration({
    required this.intermediateS3Path,
  });

  factory IntermediateSourceConfiguration.fromJson(Map<String, dynamic> json) {
    return IntermediateSourceConfiguration(
      intermediateS3Path: (json['intermediateS3Path'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final intermediateS3Path = this.intermediateS3Path;
    return {
      'intermediateS3Path': intermediateS3Path,
    };
  }
}

/// An object that contains configuration settings for the matching process in a
/// rule-based matching workflow.
///
/// @nodoc
class MatchingConfig {
  /// Enables transitive matching for the rule-based matching workflow. When
  /// enabled, records that match through different rules are grouped together
  /// into the same match group.
  final bool? enableTransitiveMatching;

  MatchingConfig({
    this.enableTransitiveMatching,
  });

  factory MatchingConfig.fromJson(Map<String, dynamic> json) {
    return MatchingConfig(
      enableTransitiveMatching: json['enableTransitiveMatching'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final enableTransitiveMatching = this.enableTransitiveMatching;
    return {
      if (enableTransitiveMatching != null)
        'enableTransitiveMatching': enableTransitiveMatching,
    };
  }
}

/// An object that defines the <code>ruleCondition</code> and the
/// <code>ruleName</code> to use in a matching workflow.
///
/// @nodoc
class RuleCondition {
  /// A statement that specifies the conditions for a matching rule.
  ///
  /// If your data is accurate, use an Exact matching function: <code>Exact</code>
  /// or <code>ExactManyToMany</code>.
  ///
  /// If your data has variations in spelling or pronunciation, use a Fuzzy
  /// matching function: <code>Cosine</code>, <code>Levenshtein</code>, or
  /// <code>Soundex</code>.
  ///
  /// Use operators if you want to combine (<code>AND</code>), separate
  /// (<code>OR</code>), or group matching functions <code>(...)</code>.
  ///
  /// For example: <code>(Cosine(a, 10) AND Exact(b, true)) OR ExactManyToMany(c,
  /// d)</code>
  final String condition;

  /// A name for the matching rule.
  ///
  /// For example: <code>Rule1</code>
  final String ruleName;

  RuleCondition({
    required this.condition,
    required this.ruleName,
  });

  factory RuleCondition.fromJson(Map<String, dynamic> json) {
    return RuleCondition(
      condition: (json['condition'] as String?) ?? '',
      ruleName: (json['ruleName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final condition = this.condition;
    final ruleName = this.ruleName;
    return {
      'condition': condition,
      'ruleName': ruleName,
    };
  }
}

/// @nodoc
class AttributeMatchingModel {
  static const oneToOne = AttributeMatchingModel._('ONE_TO_ONE');
  static const manyToMany = AttributeMatchingModel._('MANY_TO_MANY');

  final String value;

  const AttributeMatchingModel._(this.value);

  static const values = [oneToOne, manyToMany];

  static AttributeMatchingModel fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AttributeMatchingModel._(value));

  @override
  bool operator ==(other) =>
      other is AttributeMatchingModel && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class MatchPurpose {
  static const identifierGeneration = MatchPurpose._('IDENTIFIER_GENERATION');
  static const indexing = MatchPurpose._('INDEXING');

  final String value;

  const MatchPurpose._(this.value);

  static const values = [identifierGeneration, indexing];

  static MatchPurpose fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => MatchPurpose._(value));

  @override
  bool operator ==(other) => other is MatchPurpose && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An object containing the <code>ruleName</code> and
/// <code>matchingKeys</code>.
///
/// @nodoc
class Rule {
  /// A list of <code>MatchingKeys</code>. The <code>MatchingKeys</code> must have
  /// been defined in the <code>SchemaMapping</code>. Two records are considered
  /// to match according to this rule if all of the <code>MatchingKeys</code>
  /// match.
  final List<String> matchingKeys;

  /// A name for the matching rule.
  final String ruleName;

  Rule({
    required this.matchingKeys,
    required this.ruleName,
  });

  factory Rule.fromJson(Map<String, dynamic> json) {
    return Rule(
      matchingKeys: ((json['matchingKeys'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      ruleName: (json['ruleName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final matchingKeys = this.matchingKeys;
    final ruleName = this.ruleName;
    return {
      'matchingKeys': matchingKeys,
      'ruleName': ruleName,
    };
  }
}

/// A list of <code>OutputAttribute</code> objects, each of which have the
/// fields <code>Name</code> and <code>Hashed</code>. Each of these objects
/// selects a column to be included in the output table, and whether the values
/// of the column should be hashed.
///
/// @nodoc
class OutputSource {
  /// A list of <code>OutputAttribute</code> objects, each of which have the
  /// fields <code>Name</code> and <code>Hashed</code>. Each of these objects
  /// selects a column to be included in the output table, and whether the values
  /// of the column should be hashed.
  final List<OutputAttribute> output;

  /// Customer KMS ARN for encryption at rest. If not provided, system will use an
  /// Entity Resolution managed KMS key.
  final String? kMSArn;

  /// Normalizes the attributes defined in the schema in the input data. For
  /// example, if an attribute has an <code>AttributeType</code> of
  /// <code>PHONE_NUMBER</code>, and the data in the input table is in a format of
  /// 1234567890, Entity Resolution will normalize this field in the output to
  /// (123)-456-7890.
  final bool? applyNormalization;

  /// Specifies the Customer Profiles integration configuration for sending
  /// matched output directly to Customer Profiles. When configured, Entity
  /// Resolution automatically creates and updates customer profiles based on
  /// match clusters, eliminating the need for manual Amazon S3 integration setup.
  final CustomerProfilesIntegrationConfig? customerProfilesIntegrationConfig;

  /// The S3 path to which Entity Resolution will write the output table.
  final String? outputS3Path;

  OutputSource({
    required this.output,
    this.kMSArn,
    this.applyNormalization,
    this.customerProfilesIntegrationConfig,
    this.outputS3Path,
  });

  factory OutputSource.fromJson(Map<String, dynamic> json) {
    return OutputSource(
      output: ((json['output'] as List?) ?? const [])
          .nonNulls
          .map((e) => OutputAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      kMSArn: json['KMSArn'] as String?,
      applyNormalization: json['applyNormalization'] as bool?,
      customerProfilesIntegrationConfig:
          json['customerProfilesIntegrationConfig'] != null
              ? CustomerProfilesIntegrationConfig.fromJson(
                  json['customerProfilesIntegrationConfig']
                      as Map<String, dynamic>)
              : null,
      outputS3Path: json['outputS3Path'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final output = this.output;
    final kMSArn = this.kMSArn;
    final applyNormalization = this.applyNormalization;
    final customerProfilesIntegrationConfig =
        this.customerProfilesIntegrationConfig;
    final outputS3Path = this.outputS3Path;
    return {
      'output': output,
      if (kMSArn != null) 'KMSArn': kMSArn,
      if (applyNormalization != null) 'applyNormalization': applyNormalization,
      if (customerProfilesIntegrationConfig != null)
        'customerProfilesIntegrationConfig': customerProfilesIntegrationConfig,
      if (outputS3Path != null) 'outputS3Path': outputS3Path,
    };
  }
}

/// Specifies the configuration for integrating with Customer Profiles. This
/// configuration enables Entity Resolution to send matched output directly to
/// Customer Profiles instead of Amazon S3, creating a unified customer view by
/// automatically updating customer profiles based on match clusters.
///
/// @nodoc
class CustomerProfilesIntegrationConfig {
  /// The Amazon Resource Name (ARN) of the Customer Profiles domain where the
  /// matched output will be sent.
  final String domainArn;

  /// The Amazon Resource Name (ARN) of the Customer Profiles object type that
  /// defines the structure for the matched customer data.
  final String objectTypeArn;

  CustomerProfilesIntegrationConfig({
    required this.domainArn,
    required this.objectTypeArn,
  });

  factory CustomerProfilesIntegrationConfig.fromJson(
      Map<String, dynamic> json) {
    return CustomerProfilesIntegrationConfig(
      domainArn: (json['domainArn'] as String?) ?? '',
      objectTypeArn: (json['objectTypeArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final domainArn = this.domainArn;
    final objectTypeArn = this.objectTypeArn;
    return {
      'domainArn': domainArn,
      'objectTypeArn': objectTypeArn,
    };
  }
}

/// A list of <code>OutputAttribute</code> objects, each of which have the
/// fields <code>Name</code> and <code>Hashed</code>. Each of these objects
/// selects a column to be included in the output table, and whether the values
/// of the column should be hashed.
///
/// @nodoc
class OutputAttribute {
  /// A name of a column to be written to the output. This must be an
  /// <code>InputField</code> name in the schema mapping.
  final String name;

  /// Enables the ability to hash the column values in the output.
  final bool? hashed;

  OutputAttribute({
    required this.name,
    this.hashed,
  });

  factory OutputAttribute.fromJson(Map<String, dynamic> json) {
    return OutputAttribute(
      name: (json['name'] as String?) ?? '',
      hashed: json['hashed'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final hashed = this.hashed;
    return {
      'name': name,
      if (hashed != null) 'hashed': hashed,
    };
  }
}

/// An object containing <code>inputSourceARN</code>, <code>schemaName</code>,
/// and <code>applyNormalization</code>.
///
/// @nodoc
class InputSource {
  /// An Glue table Amazon Resource Name (ARN) for the input source table.
  final String inputSourceARN;

  /// The name of the schema to be retrieved.
  final String schemaName;

  /// Normalizes the attributes defined in the schema in the input data. For
  /// example, if an attribute has an <code>AttributeType</code> of
  /// <code>PHONE_NUMBER</code>, and the data in the input table is in a format of
  /// 1234567890, Entity Resolution will normalize this field in the output to
  /// (123)-456-7890.
  final bool? applyNormalization;

  InputSource({
    required this.inputSourceARN,
    required this.schemaName,
    this.applyNormalization,
  });

  factory InputSource.fromJson(Map<String, dynamic> json) {
    return InputSource(
      inputSourceARN: (json['inputSourceARN'] as String?) ?? '',
      schemaName: (json['schemaName'] as String?) ?? '',
      applyNormalization: json['applyNormalization'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final inputSourceARN = this.inputSourceARN;
    final schemaName = this.schemaName;
    final applyNormalization = this.applyNormalization;
    return {
      'inputSourceARN': inputSourceARN,
      'schemaName': schemaName,
      if (applyNormalization != null) 'applyNormalization': applyNormalization,
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

/// An object containing <code>idMappingType</code>,
/// <code>providerProperties</code>, and <code>ruleBasedProperties</code>.
///
/// @nodoc
class IdNamespaceIdMappingWorkflowProperties {
  /// The type of ID mapping.
  final IdMappingType idMappingType;

  /// An object which defines any additional configurations required by the
  /// provider service.
  final NamespaceProviderProperties? providerProperties;

  /// An object which defines any additional configurations required by rule-based
  /// matching.
  final NamespaceRuleBasedProperties? ruleBasedProperties;

  IdNamespaceIdMappingWorkflowProperties({
    required this.idMappingType,
    this.providerProperties,
    this.ruleBasedProperties,
  });

  factory IdNamespaceIdMappingWorkflowProperties.fromJson(
      Map<String, dynamic> json) {
    return IdNamespaceIdMappingWorkflowProperties(
      idMappingType:
          IdMappingType.fromString((json['idMappingType'] as String?) ?? ''),
      providerProperties: json['providerProperties'] != null
          ? NamespaceProviderProperties.fromJson(
              json['providerProperties'] as Map<String, dynamic>)
          : null,
      ruleBasedProperties: json['ruleBasedProperties'] != null
          ? NamespaceRuleBasedProperties.fromJson(
              json['ruleBasedProperties'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final idMappingType = this.idMappingType;
    final providerProperties = this.providerProperties;
    final ruleBasedProperties = this.ruleBasedProperties;
    return {
      'idMappingType': idMappingType.value,
      if (providerProperties != null) 'providerProperties': providerProperties,
      if (ruleBasedProperties != null)
        'ruleBasedProperties': ruleBasedProperties,
    };
  }
}

/// @nodoc
class IdMappingType {
  static const provider = IdMappingType._('PROVIDER');
  static const ruleBased = IdMappingType._('RULE_BASED');

  final String value;

  const IdMappingType._(this.value);

  static const values = [provider, ruleBased];

  static IdMappingType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IdMappingType._(value));

  @override
  bool operator ==(other) => other is IdMappingType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The rule-based properties of an ID namespace. These properties define how
/// the ID namespace can be used in an ID mapping workflow.
///
/// @nodoc
class NamespaceRuleBasedProperties {
  /// The comparison type. You can either choose <code>ONE_TO_ONE</code> or
  /// <code>MANY_TO_MANY</code> as the <code>attributeMatchingModel</code>.
  ///
  /// If you choose <code>ONE_TO_ONE</code>, the system can only match attributes
  /// if the sub-types are an exact match. For example, for the <code>Email</code>
  /// attribute type, the system will only consider it a match if the value of the
  /// <code>Email</code> field of Profile A matches the value of the
  /// <code>Email</code> field of Profile B.
  ///
  /// If you choose <code>MANY_TO_MANY</code>, the system can match attributes
  /// across the sub-types of an attribute type. For example, if the value of the
  /// <code>Email</code> field of Profile A matches the value of
  /// <code>BusinessEmail</code> field of Profile B, the two profiles are matched
  /// on the <code>Email</code> attribute type.
  final AttributeMatchingModel? attributeMatchingModel;

  /// The type of matching record that is allowed to be used in an ID mapping
  /// workflow.
  ///
  /// If the value is set to <code>ONE_SOURCE_TO_ONE_TARGET</code>, only one
  /// record in the source is matched to one record in the target.
  ///
  /// If the value is set to <code>MANY_SOURCE_TO_ONE_TARGET</code>, all matching
  /// records in the source are matched to one record in the target.
  final List<RecordMatchingModel>? recordMatchingModels;

  /// The sets of rules you can use in an ID mapping workflow. The limitations
  /// specified for the source and target must be compatible.
  final List<IdMappingWorkflowRuleDefinitionType>? ruleDefinitionTypes;

  /// The rules for the ID namespace.
  final List<Rule>? rules;

  NamespaceRuleBasedProperties({
    this.attributeMatchingModel,
    this.recordMatchingModels,
    this.ruleDefinitionTypes,
    this.rules,
  });

  factory NamespaceRuleBasedProperties.fromJson(Map<String, dynamic> json) {
    return NamespaceRuleBasedProperties(
      attributeMatchingModel: (json['attributeMatchingModel'] as String?)
          ?.let(AttributeMatchingModel.fromString),
      recordMatchingModels: (json['recordMatchingModels'] as List?)
          ?.nonNulls
          .map((e) => RecordMatchingModel.fromString((e as String)))
          .toList(),
      ruleDefinitionTypes: (json['ruleDefinitionTypes'] as List?)
          ?.nonNulls
          .map((e) =>
              IdMappingWorkflowRuleDefinitionType.fromString((e as String)))
          .toList(),
      rules: (json['rules'] as List?)
          ?.nonNulls
          .map((e) => Rule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final attributeMatchingModel = this.attributeMatchingModel;
    final recordMatchingModels = this.recordMatchingModels;
    final ruleDefinitionTypes = this.ruleDefinitionTypes;
    final rules = this.rules;
    return {
      if (attributeMatchingModel != null)
        'attributeMatchingModel': attributeMatchingModel.value,
      if (recordMatchingModels != null)
        'recordMatchingModels':
            recordMatchingModels.map((e) => e.value).toList(),
      if (ruleDefinitionTypes != null)
        'ruleDefinitionTypes': ruleDefinitionTypes.map((e) => e.value).toList(),
      if (rules != null) 'rules': rules,
    };
  }
}

/// An object containing <code>providerConfiguration</code> and
/// <code>providerServiceArn</code>.
///
/// @nodoc
class NamespaceProviderProperties {
  /// The Amazon Resource Name (ARN) of the provider service.
  final String providerServiceArn;

  /// An object which defines any additional configurations required by the
  /// provider service.
  final Document? providerConfiguration;

  NamespaceProviderProperties({
    required this.providerServiceArn,
    this.providerConfiguration,
  });

  factory NamespaceProviderProperties.fromJson(Map<String, dynamic> json) {
    return NamespaceProviderProperties(
      providerServiceArn: (json['providerServiceArn'] as String?) ?? '',
      providerConfiguration: json['providerConfiguration'] != null
          ? Document.fromJson(
              json['providerConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final providerServiceArn = this.providerServiceArn;
    final providerConfiguration = this.providerConfiguration;
    return {
      'providerServiceArn': providerServiceArn,
      if (providerConfiguration != null)
        'providerConfiguration': providerConfiguration,
    };
  }
}

/// @nodoc
class RecordMatchingModel {
  static const oneSourceToOneTarget =
      RecordMatchingModel._('ONE_SOURCE_TO_ONE_TARGET');
  static const manySourceToOneTarget =
      RecordMatchingModel._('MANY_SOURCE_TO_ONE_TARGET');

  final String value;

  const RecordMatchingModel._(this.value);

  static const values = [oneSourceToOneTarget, manySourceToOneTarget];

  static RecordMatchingModel fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RecordMatchingModel._(value));

  @override
  bool operator ==(other) =>
      other is RecordMatchingModel && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class IdMappingWorkflowRuleDefinitionType {
  static const source = IdMappingWorkflowRuleDefinitionType._('SOURCE');
  static const target = IdMappingWorkflowRuleDefinitionType._('TARGET');

  final String value;

  const IdMappingWorkflowRuleDefinitionType._(this.value);

  static const values = [source, target];

  static IdMappingWorkflowRuleDefinitionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IdMappingWorkflowRuleDefinitionType._(value));

  @override
  bool operator ==(other) =>
      other is IdMappingWorkflowRuleDefinitionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An object containing <code>inputSourceARN</code> and
/// <code>schemaName</code>.
///
/// @nodoc
class IdNamespaceInputSource {
  /// An Glue table Amazon Resource Name (ARN) or a matching workflow ARN for the
  /// input source table.
  final String inputSourceARN;

  /// The name of the schema.
  final String? schemaName;

  IdNamespaceInputSource({
    required this.inputSourceARN,
    this.schemaName,
  });

  factory IdNamespaceInputSource.fromJson(Map<String, dynamic> json) {
    return IdNamespaceInputSource(
      inputSourceARN: (json['inputSourceARN'] as String?) ?? '',
      schemaName: json['schemaName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final inputSourceARN = this.inputSourceARN;
    final schemaName = this.schemaName;
    return {
      'inputSourceARN': inputSourceARN,
      if (schemaName != null) 'schemaName': schemaName,
    };
  }
}

/// An object which defines the ID mapping technique and any additional
/// configurations.
///
/// @nodoc
class IdMappingTechniques {
  /// The type of ID mapping.
  final IdMappingType idMappingType;

  /// An object which defines any additional configurations required by the
  /// provider service.
  final ProviderProperties? providerProperties;

  /// An object which defines any additional configurations required by rule-based
  /// matching.
  final IdMappingRuleBasedProperties? ruleBasedProperties;

  IdMappingTechniques({
    required this.idMappingType,
    this.providerProperties,
    this.ruleBasedProperties,
  });

  factory IdMappingTechniques.fromJson(Map<String, dynamic> json) {
    return IdMappingTechniques(
      idMappingType:
          IdMappingType.fromString((json['idMappingType'] as String?) ?? ''),
      providerProperties: json['providerProperties'] != null
          ? ProviderProperties.fromJson(
              json['providerProperties'] as Map<String, dynamic>)
          : null,
      ruleBasedProperties: json['ruleBasedProperties'] != null
          ? IdMappingRuleBasedProperties.fromJson(
              json['ruleBasedProperties'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final idMappingType = this.idMappingType;
    final providerProperties = this.providerProperties;
    final ruleBasedProperties = this.ruleBasedProperties;
    return {
      'idMappingType': idMappingType.value,
      if (providerProperties != null) 'providerProperties': providerProperties,
      if (ruleBasedProperties != null)
        'ruleBasedProperties': ruleBasedProperties,
    };
  }
}

/// Incremental run configuration for an ID mapping workflow.
///
/// @nodoc
class IdMappingIncrementalRunConfig {
  /// The incremental run type for an ID mapping workflow.
  ///
  /// It takes only one value: <code>ON_DEMAND</code>. This setting runs the ID
  /// mapping workflow when it's manually triggered through the
  /// <code>StartIdMappingJob</code> API.
  final IdMappingIncrementalRunType? incrementalRunType;

  IdMappingIncrementalRunConfig({
    this.incrementalRunType,
  });

  factory IdMappingIncrementalRunConfig.fromJson(Map<String, dynamic> json) {
    return IdMappingIncrementalRunConfig(
      incrementalRunType: (json['incrementalRunType'] as String?)
          ?.let(IdMappingIncrementalRunType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final incrementalRunType = this.incrementalRunType;
    return {
      if (incrementalRunType != null)
        'incrementalRunType': incrementalRunType.value,
    };
  }
}

/// @nodoc
class IdMappingIncrementalRunType {
  static const onDemand = IdMappingIncrementalRunType._('ON_DEMAND');

  final String value;

  const IdMappingIncrementalRunType._(this.value);

  static const values = [onDemand];

  static IdMappingIncrementalRunType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IdMappingIncrementalRunType._(value));

  @override
  bool operator ==(other) =>
      other is IdMappingIncrementalRunType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An object that defines the list of matching rules to run in an ID mapping
/// workflow.
///
/// @nodoc
class IdMappingRuleBasedProperties {
  /// The comparison type. You can either choose <code>ONE_TO_ONE</code> or
  /// <code>MANY_TO_MANY</code> as the <code>attributeMatchingModel</code>.
  ///
  /// If you choose <code>ONE_TO_ONE</code>, the system can only match attributes
  /// if the sub-types are an exact match. For example, for the <code>Email</code>
  /// attribute type, the system will only consider it a match if the value of the
  /// <code>Email</code> field of Profile A matches the value of the
  /// <code>Email</code> field of Profile B.
  ///
  /// If you choose <code>MANY_TO_MANY</code>, the system can match attributes
  /// across the sub-types of an attribute type. For example, if the value of the
  /// <code>Email</code> field of Profile A matches the value of the
  /// <code>BusinessEmail</code> field of Profile B, the two profiles are matched
  /// on the <code>Email</code> attribute type.
  final AttributeMatchingModel attributeMatchingModel;

  /// The type of matching record that is allowed to be used in an ID mapping
  /// workflow.
  ///
  /// If the value is set to <code>ONE_SOURCE_TO_ONE_TARGET</code>, only one
  /// record in the source can be matched to the same record in the target.
  ///
  /// If the value is set to <code>MANY_SOURCE_TO_ONE_TARGET</code>, multiple
  /// records in the source can be matched to one record in the target.
  final RecordMatchingModel recordMatchingModel;

  /// The set of rules you can use in an ID mapping workflow. The limitations
  /// specified for the source or target to define the match rules must be
  /// compatible.
  final IdMappingWorkflowRuleDefinitionType ruleDefinitionType;

  /// The rules that can be used for ID mapping.
  final List<Rule>? rules;

  IdMappingRuleBasedProperties({
    required this.attributeMatchingModel,
    required this.recordMatchingModel,
    required this.ruleDefinitionType,
    this.rules,
  });

  factory IdMappingRuleBasedProperties.fromJson(Map<String, dynamic> json) {
    return IdMappingRuleBasedProperties(
      attributeMatchingModel: AttributeMatchingModel.fromString(
          (json['attributeMatchingModel'] as String?) ?? ''),
      recordMatchingModel: RecordMatchingModel.fromString(
          (json['recordMatchingModel'] as String?) ?? ''),
      ruleDefinitionType: IdMappingWorkflowRuleDefinitionType.fromString(
          (json['ruleDefinitionType'] as String?) ?? ''),
      rules: (json['rules'] as List?)
          ?.nonNulls
          .map((e) => Rule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final attributeMatchingModel = this.attributeMatchingModel;
    final recordMatchingModel = this.recordMatchingModel;
    final ruleDefinitionType = this.ruleDefinitionType;
    final rules = this.rules;
    return {
      'attributeMatchingModel': attributeMatchingModel.value,
      'recordMatchingModel': recordMatchingModel.value,
      'ruleDefinitionType': ruleDefinitionType.value,
      if (rules != null) 'rules': rules,
    };
  }
}

/// The output source for the ID mapping workflow.
///
/// @nodoc
class IdMappingWorkflowOutputSource {
  /// The S3 path to which Entity Resolution will write the output table.
  final String outputS3Path;

  /// Customer KMS ARN for encryption at rest. If not provided, system will use an
  /// Entity Resolution managed KMS key.
  final String? kMSArn;

  IdMappingWorkflowOutputSource({
    required this.outputS3Path,
    this.kMSArn,
  });

  factory IdMappingWorkflowOutputSource.fromJson(Map<String, dynamic> json) {
    return IdMappingWorkflowOutputSource(
      outputS3Path: (json['outputS3Path'] as String?) ?? '',
      kMSArn: json['KMSArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final outputS3Path = this.outputS3Path;
    final kMSArn = this.kMSArn;
    return {
      'outputS3Path': outputS3Path,
      if (kMSArn != null) 'KMSArn': kMSArn,
    };
  }
}

/// An object containing <code>inputSourceARN</code>, <code>schemaName</code>,
/// and <code>type</code>.
///
/// @nodoc
class IdMappingWorkflowInputSource {
  /// An Glue table Amazon Resource Name (ARN) or a matching workflow ARN for the
  /// input source table.
  final String inputSourceARN;

  /// The name of the schema to be retrieved.
  final String? schemaName;

  /// The type of ID namespace. There are two types: <code>SOURCE</code> and
  /// <code>TARGET</code>.
  ///
  /// The <code>SOURCE</code> contains configurations for <code>sourceId</code>
  /// data that will be processed in an ID mapping workflow.
  ///
  /// The <code>TARGET</code> contains a configuration of <code>targetId</code>
  /// which all <code>sourceIds</code> will resolve to.
  final IdNamespaceType? type;

  IdMappingWorkflowInputSource({
    required this.inputSourceARN,
    this.schemaName,
    this.type,
  });

  factory IdMappingWorkflowInputSource.fromJson(Map<String, dynamic> json) {
    return IdMappingWorkflowInputSource(
      inputSourceARN: (json['inputSourceARN'] as String?) ?? '',
      schemaName: json['schemaName'] as String?,
      type: (json['type'] as String?)?.let(IdNamespaceType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final inputSourceARN = this.inputSourceARN;
    final schemaName = this.schemaName;
    final type = this.type;
    return {
      'inputSourceARN': inputSourceARN,
      if (schemaName != null) 'schemaName': schemaName,
      if (type != null) 'type': type.value,
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

/// An object containing <code>KMSArn</code>, <code>outputS3Path</code>, and
/// <code>roleARN</code>.
///
/// @nodoc
class IdMappingJobOutputSource {
  /// The S3 path to which Entity Resolution will write the output table.
  final String outputS3Path;

  /// The Amazon Resource Name (ARN) of the IAM role. Entity Resolution assumes
  /// this role to access Amazon Web Services resources on your behalf as part of
  /// workflow execution.
  final String roleArn;

  /// Customer KMS ARN for encryption at rest. If not provided, system will use an
  /// Entity Resolution managed KMS key.
  final String? kMSArn;

  IdMappingJobOutputSource({
    required this.outputS3Path,
    required this.roleArn,
    this.kMSArn,
  });

  factory IdMappingJobOutputSource.fromJson(Map<String, dynamic> json) {
    return IdMappingJobOutputSource(
      outputS3Path: (json['outputS3Path'] as String?) ?? '',
      roleArn: (json['roleArn'] as String?) ?? '',
      kMSArn: json['KMSArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final outputS3Path = this.outputS3Path;
    final roleArn = this.roleArn;
    final kMSArn = this.kMSArn;
    return {
      'outputS3Path': outputS3Path,
      'roleArn': roleArn,
      if (kMSArn != null) 'KMSArn': kMSArn,
    };
  }
}

/// An object containing <code>schemaName</code>, <code>schemaArn</code>,
/// <code>createdAt</code>, <code>updatedAt</code>, and
/// <code>hasWorkflows</code>.
///
/// @nodoc
class SchemaMappingSummary {
  /// The timestamp of when the <code>SchemaMapping</code> was created.
  final DateTime createdAt;

  /// Specifies whether the schema mapping has been applied to a workflow.
  final bool hasWorkflows;

  /// The ARN (Amazon Resource Name) that Entity Resolution generated for the
  /// <code>SchemaMapping</code>.
  final String schemaArn;

  /// The name of the schema.
  final String schemaName;

  /// The timestamp of when the <code>SchemaMapping</code> was last updated.
  final DateTime updatedAt;

  SchemaMappingSummary({
    required this.createdAt,
    required this.hasWorkflows,
    required this.schemaArn,
    required this.schemaName,
    required this.updatedAt,
  });

  factory SchemaMappingSummary.fromJson(Map<String, dynamic> json) {
    return SchemaMappingSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      hasWorkflows: (json['hasWorkflows'] as bool?) ?? false,
      schemaArn: (json['schemaArn'] as String?) ?? '',
      schemaName: (json['schemaName'] as String?) ?? '',
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final hasWorkflows = this.hasWorkflows;
    final schemaArn = this.schemaArn;
    final schemaName = this.schemaName;
    final updatedAt = this.updatedAt;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'hasWorkflows': hasWorkflows,
      'schemaArn': schemaArn,
      'schemaName': schemaName,
      'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// A list of <code>ProviderService</code> objects, each of which contain the
/// fields <code>providerName</code>, <code>providerServiceArn</code>,
/// <code>providerServiceName</code>, and <code>providerServiceType</code>.
///
/// @nodoc
class ProviderServiceSummary {
  /// The name of the provider. This name is typically the company name.
  final String providerName;

  /// The ARN (Amazon Resource Name) that Entity Resolution generated for the
  /// <code>providerService</code>.
  final String providerServiceArn;

  /// The display name of the provider service.
  final String providerServiceDisplayName;

  /// The name of the product that the provider service provides.
  final String providerServiceName;

  /// The type of provider service.
  final ServiceType providerServiceType;

  ProviderServiceSummary({
    required this.providerName,
    required this.providerServiceArn,
    required this.providerServiceDisplayName,
    required this.providerServiceName,
    required this.providerServiceType,
  });

  factory ProviderServiceSummary.fromJson(Map<String, dynamic> json) {
    return ProviderServiceSummary(
      providerName: (json['providerName'] as String?) ?? '',
      providerServiceArn: (json['providerServiceArn'] as String?) ?? '',
      providerServiceDisplayName:
          (json['providerServiceDisplayName'] as String?) ?? '',
      providerServiceName: (json['providerServiceName'] as String?) ?? '',
      providerServiceType: ServiceType.fromString(
          (json['providerServiceType'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final providerName = this.providerName;
    final providerServiceArn = this.providerServiceArn;
    final providerServiceDisplayName = this.providerServiceDisplayName;
    final providerServiceName = this.providerServiceName;
    final providerServiceType = this.providerServiceType;
    return {
      'providerName': providerName,
      'providerServiceArn': providerServiceArn,
      'providerServiceDisplayName': providerServiceDisplayName,
      'providerServiceName': providerServiceName,
      'providerServiceType': providerServiceType.value,
    };
  }
}

/// @nodoc
class ServiceType {
  static const assignment = ServiceType._('ASSIGNMENT');
  static const idMapping = ServiceType._('ID_MAPPING');

  final String value;

  const ServiceType._(this.value);

  static const values = [assignment, idMapping];

  static ServiceType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ServiceType._(value));

  @override
  bool operator ==(other) => other is ServiceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A list of <code>MatchingWorkflowSummary</code> objects, each of which
/// contain the fields <code>workflowName</code>, <code>workflowArn</code>,
/// <code>resolutionType</code>, <code>createdAt</code>, <code>updatedAt</code>.
///
/// @nodoc
class MatchingWorkflowSummary {
  /// The timestamp of when the workflow was created.
  final DateTime createdAt;

  /// The method that has been specified for data matching, either using matching
  /// provided by Entity Resolution or through a provider service.
  final ResolutionType resolutionType;

  /// The timestamp of when the workflow was last updated.
  final DateTime updatedAt;

  /// The ARN (Amazon Resource Name) that Entity Resolution generated for the
  /// <code>MatchingWorkflow</code>.
  final String workflowArn;

  /// The name of the workflow.
  final String workflowName;

  MatchingWorkflowSummary({
    required this.createdAt,
    required this.resolutionType,
    required this.updatedAt,
    required this.workflowArn,
    required this.workflowName,
  });

  factory MatchingWorkflowSummary.fromJson(Map<String, dynamic> json) {
    return MatchingWorkflowSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      resolutionType:
          ResolutionType.fromString((json['resolutionType'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      workflowArn: (json['workflowArn'] as String?) ?? '',
      workflowName: (json['workflowName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final resolutionType = this.resolutionType;
    final updatedAt = this.updatedAt;
    final workflowArn = this.workflowArn;
    final workflowName = this.workflowName;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'resolutionType': resolutionType.value,
      'updatedAt': unixTimestampToJson(updatedAt),
      'workflowArn': workflowArn,
      'workflowName': workflowName,
    };
  }
}

/// An object containing the <code>jobId</code>, <code>status</code>,
/// <code>startTime</code>, and <code>endTime</code> of a job.
///
/// @nodoc
class JobSummary {
  /// The ID of the job.
  final String jobId;

  /// The time at which the job was started.
  final DateTime startTime;

  /// The current status of the job.
  final JobStatus status;

  /// The time at which the job has finished.
  final DateTime? endTime;

  JobSummary({
    required this.jobId,
    required this.startTime,
    required this.status,
    this.endTime,
  });

  factory JobSummary.fromJson(Map<String, dynamic> json) {
    return JobSummary(
      jobId: (json['jobId'] as String?) ?? '',
      startTime: nonNullableTimeStampFromJson(json['startTime'] ?? 0),
      status: JobStatus.fromString((json['status'] as String?) ?? ''),
      endTime: timeStampFromJson(json['endTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    final startTime = this.startTime;
    final status = this.status;
    final endTime = this.endTime;
    return {
      'jobId': jobId,
      'startTime': unixTimestampToJson(startTime),
      'status': status.value,
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
    };
  }
}

/// @nodoc
class JobStatus {
  static const running = JobStatus._('RUNNING');
  static const succeeded = JobStatus._('SUCCEEDED');
  static const failed = JobStatus._('FAILED');
  static const queued = JobStatus._('QUEUED');

  final String value;

  const JobStatus._(this.value);

  static const values = [running, succeeded, failed, queued];

  static JobStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => JobStatus._(value));

  @override
  bool operator ==(other) => other is JobStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A summary of ID namespaces.
///
/// @nodoc
class IdNamespaceSummary {
  /// The timestamp of when the ID namespace was created.
  final DateTime createdAt;

  /// The Amazon Resource Name (ARN) of the ID namespace.
  final String idNamespaceArn;

  /// The name of the ID namespace.
  final String idNamespaceName;

  /// The type of ID namespace. There are two types: <code>SOURCE</code> and
  /// <code>TARGET</code>.
  ///
  /// The <code>SOURCE</code> contains configurations for <code>sourceId</code>
  /// data that will be processed in an ID mapping workflow.
  ///
  /// The <code>TARGET</code> contains a configuration of <code>targetId</code>
  /// which all <code>sourceIds</code> will resolve to.
  final IdNamespaceType type;

  /// The timestamp of when the ID namespace was last updated.
  final DateTime updatedAt;

  /// The description of the ID namespace.
  final String? description;

  /// An object which defines any additional configurations required by the ID
  /// mapping workflow.
  final List<IdNamespaceIdMappingWorkflowMetadata>? idMappingWorkflowProperties;

  IdNamespaceSummary({
    required this.createdAt,
    required this.idNamespaceArn,
    required this.idNamespaceName,
    required this.type,
    required this.updatedAt,
    this.description,
    this.idMappingWorkflowProperties,
  });

  factory IdNamespaceSummary.fromJson(Map<String, dynamic> json) {
    return IdNamespaceSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      idNamespaceArn: (json['idNamespaceArn'] as String?) ?? '',
      idNamespaceName: (json['idNamespaceName'] as String?) ?? '',
      type: IdNamespaceType.fromString((json['type'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      description: json['description'] as String?,
      idMappingWorkflowProperties:
          (json['idMappingWorkflowProperties'] as List?)
              ?.nonNulls
              .map((e) => IdNamespaceIdMappingWorkflowMetadata.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final idNamespaceArn = this.idNamespaceArn;
    final idNamespaceName = this.idNamespaceName;
    final type = this.type;
    final updatedAt = this.updatedAt;
    final description = this.description;
    final idMappingWorkflowProperties = this.idMappingWorkflowProperties;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'idNamespaceArn': idNamespaceArn,
      'idNamespaceName': idNamespaceName,
      'type': type.value,
      'updatedAt': unixTimestampToJson(updatedAt),
      if (description != null) 'description': description,
      if (idMappingWorkflowProperties != null)
        'idMappingWorkflowProperties': idMappingWorkflowProperties,
    };
  }
}

/// The settings for the ID namespace for the ID mapping workflow job.
///
/// @nodoc
class IdNamespaceIdMappingWorkflowMetadata {
  /// The type of ID mapping.
  final IdMappingType idMappingType;

  IdNamespaceIdMappingWorkflowMetadata({
    required this.idMappingType,
  });

  factory IdNamespaceIdMappingWorkflowMetadata.fromJson(
      Map<String, dynamic> json) {
    return IdNamespaceIdMappingWorkflowMetadata(
      idMappingType:
          IdMappingType.fromString((json['idMappingType'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final idMappingType = this.idMappingType;
    return {
      'idMappingType': idMappingType.value,
    };
  }
}

/// A list of <code>IdMappingWorkflowSummary</code> objects, each of which
/// contain the fields <code>WorkflowName</code>, <code>WorkflowArn</code>,
/// <code>CreatedAt</code>, and <code>UpdatedAt</code>.
///
/// @nodoc
class IdMappingWorkflowSummary {
  /// The timestamp of when the workflow was created.
  final DateTime createdAt;

  /// The timestamp of when the workflow was last updated.
  final DateTime updatedAt;

  /// The ARN (Amazon Resource Name) that Entity Resolution generated for the
  /// <code>IdMappingWorkflow</code>.
  final String workflowArn;

  /// The name of the workflow.
  final String workflowName;

  IdMappingWorkflowSummary({
    required this.createdAt,
    required this.updatedAt,
    required this.workflowArn,
    required this.workflowName,
  });

  factory IdMappingWorkflowSummary.fromJson(Map<String, dynamic> json) {
    return IdMappingWorkflowSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      workflowArn: (json['workflowArn'] as String?) ?? '',
      workflowName: (json['workflowName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final updatedAt = this.updatedAt;
    final workflowArn = this.workflowArn;
    final workflowName = this.workflowName;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'updatedAt': unixTimestampToJson(updatedAt),
      'workflowArn': workflowArn,
      'workflowName': workflowName,
    };
  }
}

/// The provider configuration required for different ID namespace types.
///
/// @nodoc
class ProviderIdNameSpaceConfiguration {
  /// The description of the ID namespace.
  final String? description;

  /// Configurations required for the source ID namespace.
  final Document? providerSourceConfigurationDefinition;

  /// Configurations required for the target ID namespace.
  final Document? providerTargetConfigurationDefinition;

  ProviderIdNameSpaceConfiguration({
    this.description,
    this.providerSourceConfigurationDefinition,
    this.providerTargetConfigurationDefinition,
  });

  factory ProviderIdNameSpaceConfiguration.fromJson(Map<String, dynamic> json) {
    return ProviderIdNameSpaceConfiguration(
      description: json['description'] as String?,
      providerSourceConfigurationDefinition:
          json['providerSourceConfigurationDefinition'] != null
              ? Document.fromJson(json['providerSourceConfigurationDefinition']
                  as Map<String, dynamic>)
              : null,
      providerTargetConfigurationDefinition:
          json['providerTargetConfigurationDefinition'] != null
              ? Document.fromJson(json['providerTargetConfigurationDefinition']
                  as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final providerSourceConfigurationDefinition =
        this.providerSourceConfigurationDefinition;
    final providerTargetConfigurationDefinition =
        this.providerTargetConfigurationDefinition;
    return {
      if (description != null) 'description': description,
      if (providerSourceConfigurationDefinition != null)
        'providerSourceConfigurationDefinition':
            providerSourceConfigurationDefinition,
      if (providerTargetConfigurationDefinition != null)
        'providerTargetConfigurationDefinition':
            providerTargetConfigurationDefinition,
    };
  }
}

/// The required configuration fields to use with the provider service.
///
/// @nodoc
class ProviderEndpointConfiguration {
  /// The identifiers of the provider service, from Data Exchange.
  final ProviderMarketplaceConfiguration? marketplaceConfiguration;

  ProviderEndpointConfiguration({
    this.marketplaceConfiguration,
  });

  factory ProviderEndpointConfiguration.fromJson(Map<String, dynamic> json) {
    return ProviderEndpointConfiguration(
      marketplaceConfiguration: json['marketplaceConfiguration'] != null
          ? ProviderMarketplaceConfiguration.fromJson(
              json['marketplaceConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final marketplaceConfiguration = this.marketplaceConfiguration;
    return {
      if (marketplaceConfiguration != null)
        'marketplaceConfiguration': marketplaceConfiguration,
    };
  }
}

/// The required configuration fields to give intermediate access to a provider
/// service.
///
/// @nodoc
class ProviderIntermediateDataAccessConfiguration {
  /// The Amazon Web Services account that provider can use to read or write data
  /// into the customer's intermediate S3 bucket.
  final List<String>? awsAccountIds;

  /// The S3 bucket actions that the provider requires permission for.
  final List<String>? requiredBucketActions;

  ProviderIntermediateDataAccessConfiguration({
    this.awsAccountIds,
    this.requiredBucketActions,
  });

  factory ProviderIntermediateDataAccessConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ProviderIntermediateDataAccessConfiguration(
      awsAccountIds: (json['awsAccountIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      requiredBucketActions: (json['requiredBucketActions'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final awsAccountIds = this.awsAccountIds;
    final requiredBucketActions = this.requiredBucketActions;
    return {
      if (awsAccountIds != null) 'awsAccountIds': awsAccountIds,
      if (requiredBucketActions != null)
        'requiredBucketActions': requiredBucketActions,
    };
  }
}

/// The input schema supported by provider service.
///
/// @nodoc
class ProviderComponentSchema {
  /// The provider schema attributes.
  final List<ProviderSchemaAttribute>? providerSchemaAttributes;

  /// Input schema for the provider service.
  final List<List<String>>? schemas;

  ProviderComponentSchema({
    this.providerSchemaAttributes,
    this.schemas,
  });

  factory ProviderComponentSchema.fromJson(Map<String, dynamic> json) {
    return ProviderComponentSchema(
      providerSchemaAttributes: (json['providerSchemaAttributes'] as List?)
          ?.nonNulls
          .map((e) =>
              ProviderSchemaAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      schemas: (json['schemas'] as List?)
          ?.nonNulls
          .map((e) => (e as List).nonNulls.map((e) => e as String).toList())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final providerSchemaAttributes = this.providerSchemaAttributes;
    final schemas = this.schemas;
    return {
      if (providerSchemaAttributes != null)
        'providerSchemaAttributes': providerSchemaAttributes,
      if (schemas != null) 'schemas': schemas,
    };
  }
}

/// The provider schema attribute.
///
/// @nodoc
class ProviderSchemaAttribute {
  /// The field name.
  final String fieldName;

  /// The type of the provider schema attribute.
  ///
  /// LiveRamp supports: <code>NAME</code> | <code>NAME_FIRST</code> |
  /// <code>NAME_MIDDLE</code> | <code>NAME_LAST</code> | <code>ADDRESS</code> |
  /// <code>ADDRESS_STREET1</code> | <code>ADDRESS_STREET2</code> |
  /// <code>ADDRESS_STREET3</code> | <code>ADDRESS_CITY</code> |
  /// <code>ADDRESS_STATE</code> | <code>ADDRESS_COUNTRY</code> |
  /// <code>ADDRESS_POSTALCODE</code> | <code>PHONE</code> |
  /// <code>PHONE_NUMBER</code> | <code>EMAIL_ADDRESS</code> |
  /// <code>UNIQUE_ID</code> | <code>PROVIDER_ID</code>
  ///
  /// TransUnion supports: <code>NAME</code> | <code>NAME_FIRST</code> |
  /// <code>NAME_LAST</code> | <code>ADDRESS</code> | <code>ADDRESS_CITY</code> |
  /// <code>ADDRESS_STATE</code> | <code>ADDRESS_COUNTRY</code> |
  /// <code>ADDRESS_POSTALCODE</code> | <code>PHONE_NUMBER</code> |
  /// <code>EMAIL_ADDRESS</code> | <code>UNIQUE_ID</code> | <code>DATE</code> |
  /// <code>IPV4</code> | <code>IPV6</code> | <code>MAID</code>
  ///
  /// Unified ID 2.0 supports: <code>PHONE_NUMBER</code> |
  /// <code>EMAIL_ADDRESS</code> | <code>UNIQUE_ID</code>
  final SchemaAttributeType type;

  /// The hashing attribute of the provider schema.
  final bool? hashing;

  /// The sub type of the provider schema attribute.
  final String? subType;

  ProviderSchemaAttribute({
    required this.fieldName,
    required this.type,
    this.hashing,
    this.subType,
  });

  factory ProviderSchemaAttribute.fromJson(Map<String, dynamic> json) {
    return ProviderSchemaAttribute(
      fieldName: (json['fieldName'] as String?) ?? '',
      type: SchemaAttributeType.fromString((json['type'] as String?) ?? ''),
      hashing: json['hashing'] as bool?,
      subType: json['subType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fieldName = this.fieldName;
    final type = this.type;
    final hashing = this.hashing;
    final subType = this.subType;
    return {
      'fieldName': fieldName,
      'type': type.value,
      if (hashing != null) 'hashing': hashing,
      if (subType != null) 'subType': subType,
    };
  }
}

/// The identifiers of the provider service, from Data Exchange.
///
/// @nodoc
class ProviderMarketplaceConfiguration {
  /// The asset ID on Data Exchange.
  final String assetId;

  /// The dataset ID on Data Exchange.
  final String dataSetId;

  /// The listing ID on Data Exchange.
  final String listingId;

  /// The revision ID on Data Exchange.
  final String revisionId;

  ProviderMarketplaceConfiguration({
    required this.assetId,
    required this.dataSetId,
    required this.listingId,
    required this.revisionId,
  });

  factory ProviderMarketplaceConfiguration.fromJson(Map<String, dynamic> json) {
    return ProviderMarketplaceConfiguration(
      assetId: (json['assetId'] as String?) ?? '',
      dataSetId: (json['dataSetId'] as String?) ?? '',
      listingId: (json['listingId'] as String?) ?? '',
      revisionId: (json['revisionId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final assetId = this.assetId;
    final dataSetId = this.dataSetId;
    final listingId = this.listingId;
    final revisionId = this.revisionId;
    return {
      'assetId': assetId,
      'dataSetId': dataSetId,
      'listingId': listingId,
      'revisionId': revisionId,
    };
  }
}

/// An object containing <code>inputRecords</code>,
/// <code>totalRecordsProcessed</code>, <code>matchIDs</code>, and
/// <code>recordsNotProcessed</code>.
///
/// @nodoc
class JobMetrics {
  /// The number of records processed that were marked for deletion
  /// (<code>DELETE</code> = True) in the input file. This metric tracks records
  /// flagged for removal during the job execution.
  final int? deleteRecordsProcessed;

  /// The total number of input records.
  final int? inputRecords;

  /// The total number of <code>matchID</code>s generated.
  final int? matchIDs;

  /// The total number of records that did not get processed.
  final int? recordsNotProcessed;

  /// The total number of records processed.
  final int? totalRecordsProcessed;

  JobMetrics({
    this.deleteRecordsProcessed,
    this.inputRecords,
    this.matchIDs,
    this.recordsNotProcessed,
    this.totalRecordsProcessed,
  });

  factory JobMetrics.fromJson(Map<String, dynamic> json) {
    return JobMetrics(
      deleteRecordsProcessed: json['deleteRecordsProcessed'] as int?,
      inputRecords: json['inputRecords'] as int?,
      matchIDs: json['matchIDs'] as int?,
      recordsNotProcessed: json['recordsNotProcessed'] as int?,
      totalRecordsProcessed: json['totalRecordsProcessed'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final deleteRecordsProcessed = this.deleteRecordsProcessed;
    final inputRecords = this.inputRecords;
    final matchIDs = this.matchIDs;
    final recordsNotProcessed = this.recordsNotProcessed;
    final totalRecordsProcessed = this.totalRecordsProcessed;
    return {
      if (deleteRecordsProcessed != null)
        'deleteRecordsProcessed': deleteRecordsProcessed,
      if (inputRecords != null) 'inputRecords': inputRecords,
      if (matchIDs != null) 'matchIDs': matchIDs,
      if (recordsNotProcessed != null)
        'recordsNotProcessed': recordsNotProcessed,
      if (totalRecordsProcessed != null)
        'totalRecordsProcessed': totalRecordsProcessed,
    };
  }
}

/// An object containing an error message, if there was an error.
///
/// @nodoc
class ErrorDetails {
  /// The error message from the job, if there is one.
  final String? errorMessage;

  ErrorDetails({
    this.errorMessage,
  });

  factory ErrorDetails.fromJson(Map<String, dynamic> json) {
    return ErrorDetails(
      errorMessage: json['errorMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorMessage = this.errorMessage;
    return {
      if (errorMessage != null) 'errorMessage': errorMessage,
    };
  }
}

/// An object containing <code>KMSArn</code>, <code>outputS3Path</code>, and
/// <code>roleArn</code>.
///
/// @nodoc
class JobOutputSource {
  /// The S3 path to which Entity Resolution will write the output table.
  final String outputS3Path;

  /// The Amazon Resource Name (ARN) of the IAM role. Entity Resolution assumes
  /// this role to access Amazon Web Services resources on your behalf as part of
  /// workflow execution.
  final String roleArn;

  /// Customer KMS ARN for encryption at rest. If not provided, system will use an
  /// Entity Resolution managed KMS key.
  final String? kMSArn;

  JobOutputSource({
    required this.outputS3Path,
    required this.roleArn,
    this.kMSArn,
  });

  factory JobOutputSource.fromJson(Map<String, dynamic> json) {
    return JobOutputSource(
      outputS3Path: (json['outputS3Path'] as String?) ?? '',
      roleArn: (json['roleArn'] as String?) ?? '',
      kMSArn: json['KMSArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final outputS3Path = this.outputS3Path;
    final roleArn = this.roleArn;
    final kMSArn = this.kMSArn;
    return {
      'outputS3Path': outputS3Path,
      'roleArn': roleArn,
      if (kMSArn != null) 'KMSArn': kMSArn,
    };
  }
}

/// An object that contains metrics about an ID mapping job, including counts of
/// input records, processed records, and mapped records between source and
/// target identifiers.
///
/// @nodoc
class IdMappingJobMetrics {
  /// The number of records processed that were marked for deletion in the input
  /// file using the DELETE schema mapping field. These are the records to be
  /// removed from the ID mapping table.
  final int? deleteRecordsProcessed;

  /// The total number of records that were input for processing.
  final int? inputRecords;

  /// The number of mapped records removed.
  final int? mappedRecordsRemoved;

  /// The number of source records removed due to ID mapping.
  final int? mappedSourceRecordsRemoved;

  /// The number of mapped target records removed.
  final int? mappedTargetRecordsRemoved;

  /// The number of new mapped records.
  final int? newMappedRecords;

  /// The number of new source records mapped.
  final int? newMappedSourceRecords;

  /// The number of new mapped target records.
  final int? newMappedTargetRecords;

  /// The number of new unique records processed in the current job run, after
  /// removing duplicates. This metric excludes deletion-related records.
  /// Duplicates are determined by the field marked as UNIQUE_ID in your schema
  /// mapping. Records sharing the same value in this field are considered
  /// duplicates. For example, if your current run processes five new records with
  /// the same UNIQUE_ID value, they would count as one new unique record in this
  /// metric.
  final int? newUniqueRecordsLoaded;

  /// The total number of records that did not get processed.
  final int? recordsNotProcessed;

  /// The total number of records that were mapped.
  final int? totalMappedRecords;

  /// The total number of mapped source records.
  final int? totalMappedSourceRecords;

  /// The total number of distinct mapped target records.
  final int? totalMappedTargetRecords;

  /// The total number of records that were processed.
  final int? totalRecordsProcessed;

  /// The number of de-duplicated processed records across all runs, excluding
  /// deletion-related records. Duplicates are determined by the field marked as
  /// UNIQUE_ID in your schema mapping. Records sharing the same value in this
  /// field are considered duplicates. For example, if you specified "customer_id"
  /// as a UNIQUE_ID field and had three records with the same customer_id value,
  /// they would count as one unique record in this metric.
  final int? uniqueRecordsLoaded;

  IdMappingJobMetrics({
    this.deleteRecordsProcessed,
    this.inputRecords,
    this.mappedRecordsRemoved,
    this.mappedSourceRecordsRemoved,
    this.mappedTargetRecordsRemoved,
    this.newMappedRecords,
    this.newMappedSourceRecords,
    this.newMappedTargetRecords,
    this.newUniqueRecordsLoaded,
    this.recordsNotProcessed,
    this.totalMappedRecords,
    this.totalMappedSourceRecords,
    this.totalMappedTargetRecords,
    this.totalRecordsProcessed,
    this.uniqueRecordsLoaded,
  });

  factory IdMappingJobMetrics.fromJson(Map<String, dynamic> json) {
    return IdMappingJobMetrics(
      deleteRecordsProcessed: json['deleteRecordsProcessed'] as int?,
      inputRecords: json['inputRecords'] as int?,
      mappedRecordsRemoved: json['mappedRecordsRemoved'] as int?,
      mappedSourceRecordsRemoved: json['mappedSourceRecordsRemoved'] as int?,
      mappedTargetRecordsRemoved: json['mappedTargetRecordsRemoved'] as int?,
      newMappedRecords: json['newMappedRecords'] as int?,
      newMappedSourceRecords: json['newMappedSourceRecords'] as int?,
      newMappedTargetRecords: json['newMappedTargetRecords'] as int?,
      newUniqueRecordsLoaded: json['newUniqueRecordsLoaded'] as int?,
      recordsNotProcessed: json['recordsNotProcessed'] as int?,
      totalMappedRecords: json['totalMappedRecords'] as int?,
      totalMappedSourceRecords: json['totalMappedSourceRecords'] as int?,
      totalMappedTargetRecords: json['totalMappedTargetRecords'] as int?,
      totalRecordsProcessed: json['totalRecordsProcessed'] as int?,
      uniqueRecordsLoaded: json['uniqueRecordsLoaded'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final deleteRecordsProcessed = this.deleteRecordsProcessed;
    final inputRecords = this.inputRecords;
    final mappedRecordsRemoved = this.mappedRecordsRemoved;
    final mappedSourceRecordsRemoved = this.mappedSourceRecordsRemoved;
    final mappedTargetRecordsRemoved = this.mappedTargetRecordsRemoved;
    final newMappedRecords = this.newMappedRecords;
    final newMappedSourceRecords = this.newMappedSourceRecords;
    final newMappedTargetRecords = this.newMappedTargetRecords;
    final newUniqueRecordsLoaded = this.newUniqueRecordsLoaded;
    final recordsNotProcessed = this.recordsNotProcessed;
    final totalMappedRecords = this.totalMappedRecords;
    final totalMappedSourceRecords = this.totalMappedSourceRecords;
    final totalMappedTargetRecords = this.totalMappedTargetRecords;
    final totalRecordsProcessed = this.totalRecordsProcessed;
    final uniqueRecordsLoaded = this.uniqueRecordsLoaded;
    return {
      if (deleteRecordsProcessed != null)
        'deleteRecordsProcessed': deleteRecordsProcessed,
      if (inputRecords != null) 'inputRecords': inputRecords,
      if (mappedRecordsRemoved != null)
        'mappedRecordsRemoved': mappedRecordsRemoved,
      if (mappedSourceRecordsRemoved != null)
        'mappedSourceRecordsRemoved': mappedSourceRecordsRemoved,
      if (mappedTargetRecordsRemoved != null)
        'mappedTargetRecordsRemoved': mappedTargetRecordsRemoved,
      if (newMappedRecords != null) 'newMappedRecords': newMappedRecords,
      if (newMappedSourceRecords != null)
        'newMappedSourceRecords': newMappedSourceRecords,
      if (newMappedTargetRecords != null)
        'newMappedTargetRecords': newMappedTargetRecords,
      if (newUniqueRecordsLoaded != null)
        'newUniqueRecordsLoaded': newUniqueRecordsLoaded,
      if (recordsNotProcessed != null)
        'recordsNotProcessed': recordsNotProcessed,
      if (totalMappedRecords != null) 'totalMappedRecords': totalMappedRecords,
      if (totalMappedSourceRecords != null)
        'totalMappedSourceRecords': totalMappedSourceRecords,
      if (totalMappedTargetRecords != null)
        'totalMappedTargetRecords': totalMappedTargetRecords,
      if (totalRecordsProcessed != null)
        'totalRecordsProcessed': totalRecordsProcessed,
      if (uniqueRecordsLoaded != null)
        'uniqueRecordsLoaded': uniqueRecordsLoaded,
    };
  }
}

/// The record that didn't generate a Match ID.
///
/// @nodoc
class FailedRecord {
  /// The error message for the record that didn't generate a Match ID.
  final String errorMessage;

  /// The input source ARN of the record that didn't generate a Match ID.
  final String inputSourceARN;

  /// The unique ID of the record that didn't generate a Match ID.
  final String uniqueId;

  FailedRecord({
    required this.errorMessage,
    required this.inputSourceARN,
    required this.uniqueId,
  });

  factory FailedRecord.fromJson(Map<String, dynamic> json) {
    return FailedRecord(
      errorMessage: (json['errorMessage'] as String?) ?? '',
      inputSourceARN: (json['inputSourceARN'] as String?) ?? '',
      uniqueId: (json['uniqueId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final errorMessage = this.errorMessage;
    final inputSourceARN = this.inputSourceARN;
    final uniqueId = this.uniqueId;
    return {
      'errorMessage': errorMessage,
      'inputSourceARN': inputSourceARN,
      'uniqueId': uniqueId,
    };
  }
}

/// The match group.
///
/// @nodoc
class MatchGroup {
  /// The match ID.
  final String matchId;

  /// The match rule of the match group.
  final String matchRule;

  /// The matched records.
  final List<MatchedRecord> records;

  MatchGroup({
    required this.matchId,
    required this.matchRule,
    required this.records,
  });

  factory MatchGroup.fromJson(Map<String, dynamic> json) {
    return MatchGroup(
      matchId: (json['matchId'] as String?) ?? '',
      matchRule: (json['matchRule'] as String?) ?? '',
      records: ((json['records'] as List?) ?? const [])
          .nonNulls
          .map((e) => MatchedRecord.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final matchId = this.matchId;
    final matchRule = this.matchRule;
    final records = this.records;
    return {
      'matchId': matchId,
      'matchRule': matchRule,
      'records': records,
    };
  }
}

/// The matched record.
///
/// @nodoc
class MatchedRecord {
  /// The input source ARN of the matched record.
  final String inputSourceARN;

  /// The record ID of the matched record.
  final String recordId;

  MatchedRecord({
    required this.inputSourceARN,
    required this.recordId,
  });

  factory MatchedRecord.fromJson(Map<String, dynamic> json) {
    return MatchedRecord(
      inputSourceARN: (json['inputSourceARN'] as String?) ?? '',
      recordId: (json['recordId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final inputSourceARN = this.inputSourceARN;
    final recordId = this.recordId;
    return {
      'inputSourceARN': inputSourceARN,
      'recordId': recordId,
    };
  }
}

/// @nodoc
class ProcessingType {
  static const consistent = ProcessingType._('CONSISTENT');
  static const eventual = ProcessingType._('EVENTUAL');
  static const eventualNoLookup = ProcessingType._('EVENTUAL_NO_LOOKUP');

  final String value;

  const ProcessingType._(this.value);

  static const values = [consistent, eventual, eventualNoLookup];

  static ProcessingType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ProcessingType._(value));

  @override
  bool operator ==(other) => other is ProcessingType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The record.
///
/// @nodoc
class Record {
  /// The input source ARN of the record.
  final String inputSourceARN;

  /// The record's attribute map.
  final Map<String, String> recordAttributeMap;

  /// The unique ID of the record.
  final String uniqueId;

  Record({
    required this.inputSourceARN,
    required this.recordAttributeMap,
    required this.uniqueId,
  });

  Map<String, dynamic> toJson() {
    final inputSourceARN = this.inputSourceARN;
    final recordAttributeMap = this.recordAttributeMap;
    final uniqueId = this.uniqueId;
    return {
      'inputSourceARN': inputSourceARN,
      'recordAttributeMap': recordAttributeMap,
      'uniqueId': uniqueId,
    };
  }
}

/// @nodoc
class DeleteUniqueIdStatus {
  static const completed = DeleteUniqueIdStatus._('COMPLETED');
  static const accepted = DeleteUniqueIdStatus._('ACCEPTED');

  final String value;

  const DeleteUniqueIdStatus._(this.value);

  static const values = [completed, accepted];

  static DeleteUniqueIdStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DeleteUniqueIdStatus._(value));

  @override
  bool operator ==(other) =>
      other is DeleteUniqueIdStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The deleted unique ID.
///
/// @nodoc
class DeletedUniqueId {
  /// The unique ID of the deleted item.
  final String uniqueId;

  DeletedUniqueId({
    required this.uniqueId,
  });

  factory DeletedUniqueId.fromJson(Map<String, dynamic> json) {
    return DeletedUniqueId(
      uniqueId: (json['uniqueId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final uniqueId = this.uniqueId;
    return {
      'uniqueId': uniqueId,
    };
  }
}

/// The error information provided when the delete unique ID operation doesn't
/// complete.
///
/// @nodoc
class DeleteUniqueIdError {
  /// The error type for the delete unique ID operation.
  ///
  /// The <code>SERVICE_ERROR</code> value indicates that an internal service-side
  /// problem occurred during the deletion operation.
  ///
  /// The <code>VALIDATION_ERROR</code> value indicates that the deletion
  /// operation couldn't complete because of invalid input parameters or data.
  final DeleteUniqueIdErrorType errorType;

  /// The unique ID that couldn't be deleted.
  final String uniqueId;

  DeleteUniqueIdError({
    required this.errorType,
    required this.uniqueId,
  });

  factory DeleteUniqueIdError.fromJson(Map<String, dynamic> json) {
    return DeleteUniqueIdError(
      errorType: DeleteUniqueIdErrorType.fromString(
          (json['errorType'] as String?) ?? ''),
      uniqueId: (json['uniqueId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final errorType = this.errorType;
    final uniqueId = this.uniqueId;
    return {
      'errorType': errorType.value,
      'uniqueId': uniqueId,
    };
  }
}

/// @nodoc
class DeleteUniqueIdErrorType {
  static const serviceError = DeleteUniqueIdErrorType._('SERVICE_ERROR');
  static const validationError = DeleteUniqueIdErrorType._('VALIDATION_ERROR');

  final String value;

  const DeleteUniqueIdErrorType._(this.value);

  static const values = [serviceError, validationError];

  static DeleteUniqueIdErrorType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DeleteUniqueIdErrorType._(value));

  @override
  bool operator ==(other) =>
      other is DeleteUniqueIdErrorType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class StatementEffect {
  static const allow = StatementEffect._('Allow');
  static const deny = StatementEffect._('Deny');

  final String value;

  const StatementEffect._(this.value);

  static const values = [allow, deny];

  static StatementEffect fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => StatementEffect._(value));

  @override
  bool operator ==(other) => other is StatementEffect && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
class ExceedsLimitException extends _s.GenericAwsException {
  ExceedsLimitException({String? type, String? message})
      : super(type: type, code: 'ExceedsLimitException', message: message);
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
  'ExceedsLimitException': (type, message) =>
      ExceedsLimitException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
