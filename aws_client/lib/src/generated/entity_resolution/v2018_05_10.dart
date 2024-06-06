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
            signingName: 'entityresolution',
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
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
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
      'effect': effect.toValue(),
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
      'uniqueIds': uniqueIds.toString(),
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
  /// an existing workflow, use the <code>UpdateIdMappingWorkflow</code> API.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ExceedsLimitException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  ///
  /// Parameter [idMappingTechniques] :
  /// An object which defines the <code>idMappingType</code> and the
  /// <code>providerProperties</code>.
  ///
  /// Parameter [inputSourceConfig] :
  /// A list of <code>InputSource</code> objects, which have the fields
  /// <code>InputSourceARN</code> and <code>SchemaName</code>.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role. Entity Resolution assumes
  /// this role to create resources on your behalf as part of workflow
  /// execution.
  ///
  /// Parameter [workflowName] :
  /// The name of the workflow. There can't be multiple
  /// <code>IdMappingWorkflows</code> with the same name.
  ///
  /// Parameter [description] :
  /// A description of the workflow.
  ///
  /// Parameter [outputSourceConfig] :
  /// A list of <code>IdMappingWorkflowOutputSource</code> objects, each of
  /// which contains fields <code>OutputS3Path</code> and <code>Output</code>.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  Future<CreateIdMappingWorkflowOutput> createIdMappingWorkflow({
    required IdMappingTechniques idMappingTechniques,
    required List<IdMappingWorkflowInputSource> inputSourceConfig,
    required String roleArn,
    required String workflowName,
    String? description,
    List<IdMappingWorkflowOutputSource>? outputSourceConfig,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'idMappingTechniques': idMappingTechniques,
      'inputSourceConfig': inputSourceConfig,
      'roleArn': roleArn,
      'workflowName': workflowName,
      if (description != null) 'description': description,
      if (outputSourceConfig != null) 'outputSourceConfig': outputSourceConfig,
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
  /// unique name. To modify an existing ID namespace, use the
  /// <code>UpdateIdNamespace</code> API.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ExceedsLimitException].
  /// May throw [ConflictException].
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
      'type': type.toValue(),
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

  /// Creates a <code>MatchingWorkflow</code> object which stores the
  /// configuration of the data processing job to be run. It is important to
  /// note that there should not be a pre-existing <code>MatchingWorkflow</code>
  /// with the same name. To modify an existing workflow, utilize the
  /// <code>UpdateMatchingWorkflow</code> API.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ExceedsLimitException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  ///
  /// Parameter [inputSourceConfig] :
  /// A list of <code>InputSource</code> objects, which have the fields
  /// <code>InputSourceARN</code> and <code>SchemaName</code>.
  ///
  /// Parameter [outputSourceConfig] :
  /// A list of <code>OutputSource</code> objects, each of which contains fields
  /// <code>OutputS3Path</code>, <code>ApplyNormalization</code>, and
  /// <code>Output</code>.
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
  /// An object which defines an incremental run type and has only
  /// <code>incrementalRunType</code> as a field.
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
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ExceedsLimitException].
  /// May throw [ConflictException].
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
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
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
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
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
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
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
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
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
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
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

  /// Gets the status, metrics, and errors (if there are any) that are
  /// associated with a job.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
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
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
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
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
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
  /// been processed.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
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

  /// Gets the status, metrics, and errors (if there are any) that are
  /// associated with a job.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
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
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
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
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
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
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
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
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
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
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
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
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      25,
    );
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
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      25,
    );
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
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
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
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      25,
    );
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
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      15,
      25,
    );
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
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      25,
    );
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
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the resource for which the policy needs
  /// to be updated.
  ///
  /// Parameter [policy] :
  /// The resource-based policy.
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
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ExceedsLimitException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  ///
  /// Parameter [workflowName] :
  /// The name of the ID mapping job to be retrieved.
  ///
  /// Parameter [outputSourceConfig] :
  /// A list of <code>OutputSource</code> objects.
  Future<StartIdMappingJobOutput> startIdMappingJob({
    required String workflowName,
    List<IdMappingJobOutputSource>? outputSourceConfig,
  }) async {
    final $payload = <String, dynamic>{
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
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ExceedsLimitException].
  /// May throw [ConflictException].
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
  /// identical to <code>CreateIdMappingWorkflow</code>, except it uses an HTTP
  /// <code>PUT</code> request instead of a <code>POST</code> request, and the
  /// <code>IdMappingWorkflow</code> must already exist for the method to
  /// succeed.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [idMappingTechniques] :
  /// An object which defines the <code>idMappingType</code> and the
  /// <code>providerProperties</code>.
  ///
  /// Parameter [inputSourceConfig] :
  /// A list of <code>InputSource</code> objects, which have the fields
  /// <code>InputSourceARN</code> and <code>SchemaName</code>.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role. Entity Resolution assumes
  /// this role to access Amazon Web Services resources on your behalf.
  ///
  /// Parameter [workflowName] :
  /// The name of the workflow.
  ///
  /// Parameter [description] :
  /// A description of the workflow.
  ///
  /// Parameter [outputSourceConfig] :
  /// A list of <code>OutputSource</code> objects, each of which contains fields
  /// <code>OutputS3Path</code> and <code>KMSArn</code>.
  Future<UpdateIdMappingWorkflowOutput> updateIdMappingWorkflow({
    required IdMappingTechniques idMappingTechniques,
    required List<IdMappingWorkflowInputSource> inputSourceConfig,
    required String roleArn,
    required String workflowName,
    String? description,
    List<IdMappingWorkflowOutputSource>? outputSourceConfig,
  }) async {
    final $payload = <String, dynamic>{
      'idMappingTechniques': idMappingTechniques,
      'inputSourceConfig': inputSourceConfig,
      'roleArn': roleArn,
      if (description != null) 'description': description,
      if (outputSourceConfig != null) 'outputSourceConfig': outputSourceConfig,
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
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
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

  /// Updates an existing <code>MatchingWorkflow</code>. This method is
  /// identical to <code>CreateMatchingWorkflow</code>, except it uses an HTTP
  /// <code>PUT</code> request instead of a <code>POST</code> request, and the
  /// <code>MatchingWorkflow</code> must already exist for the method to
  /// succeed.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [inputSourceConfig] :
  /// A list of <code>InputSource</code> objects, which have the fields
  /// <code>InputSourceARN</code> and <code>SchemaName</code>.
  ///
  /// Parameter [outputSourceConfig] :
  /// A list of <code>OutputSource</code> objects, each of which contains fields
  /// <code>OutputS3Path</code>, <code>ApplyNormalization</code>, and
  /// <code>Output</code>.
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
  /// An object which defines an incremental run type and has only
  /// <code>incrementalRunType</code> as a field.
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
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
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
      arn: json['arn'] as String,
      token: json['token'] as String,
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

enum AttributeMatchingModel {
  oneToOne,
  manyToMany,
}

extension AttributeMatchingModelValueExtension on AttributeMatchingModel {
  String toValue() {
    switch (this) {
      case AttributeMatchingModel.oneToOne:
        return 'ONE_TO_ONE';
      case AttributeMatchingModel.manyToMany:
        return 'MANY_TO_MANY';
    }
  }
}

extension AttributeMatchingModelFromString on String {
  AttributeMatchingModel toAttributeMatchingModel() {
    switch (this) {
      case 'ONE_TO_ONE':
        return AttributeMatchingModel.oneToOne;
      case 'MANY_TO_MANY':
        return AttributeMatchingModel.manyToMany;
    }
    throw Exception('$this is not known in enum AttributeMatchingModel');
  }
}

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
      deleted: (json['deleted'] as List)
          .whereNotNull()
          .map((e) => DeletedUniqueId.fromJson(e as Map<String, dynamic>))
          .toList(),
      disconnectedUniqueIds: (json['disconnectedUniqueIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      errors: (json['errors'] as List)
          .whereNotNull()
          .map((e) => DeleteUniqueIdError.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['status'] as String).toDeleteUniqueIdStatus(),
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
      'status': status.toValue(),
    };
  }
}

class CreateIdMappingWorkflowOutput {
  /// An object which defines the <code>idMappingType</code> and the
  /// <code>providerProperties</code>.
  final IdMappingTechniques idMappingTechniques;

  /// A list of <code>InputSource</code> objects, which have the fields
  /// <code>InputSourceARN</code> and <code>SchemaName</code>.
  final List<IdMappingWorkflowInputSource> inputSourceConfig;

  /// The Amazon Resource Name (ARN) of the IAM role. Entity Resolution assumes
  /// this role to create resources on your behalf as part of workflow execution.
  final String roleArn;

  /// The ARN (Amazon Resource Name) that Entity Resolution generated for the
  /// <code>IDMappingWorkflow</code>.
  final String workflowArn;

  /// The name of the workflow.
  final String workflowName;

  /// A description of the workflow.
  final String? description;

  /// A list of <code>IdMappingWorkflowOutputSource</code> objects, each of which
  /// contains fields <code>OutputS3Path</code> and <code>Output</code>.
  final List<IdMappingWorkflowOutputSource>? outputSourceConfig;

  CreateIdMappingWorkflowOutput({
    required this.idMappingTechniques,
    required this.inputSourceConfig,
    required this.roleArn,
    required this.workflowArn,
    required this.workflowName,
    this.description,
    this.outputSourceConfig,
  });

  factory CreateIdMappingWorkflowOutput.fromJson(Map<String, dynamic> json) {
    return CreateIdMappingWorkflowOutput(
      idMappingTechniques: IdMappingTechniques.fromJson(
          json['idMappingTechniques'] as Map<String, dynamic>),
      inputSourceConfig: (json['inputSourceConfig'] as List)
          .whereNotNull()
          .map((e) =>
              IdMappingWorkflowInputSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      roleArn: json['roleArn'] as String,
      workflowArn: json['workflowArn'] as String,
      workflowName: json['workflowName'] as String,
      description: json['description'] as String?,
      outputSourceConfig: (json['outputSourceConfig'] as List?)
          ?.whereNotNull()
          .map((e) =>
              IdMappingWorkflowOutputSource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final idMappingTechniques = this.idMappingTechniques;
    final inputSourceConfig = this.inputSourceConfig;
    final roleArn = this.roleArn;
    final workflowArn = this.workflowArn;
    final workflowName = this.workflowName;
    final description = this.description;
    final outputSourceConfig = this.outputSourceConfig;
    return {
      'idMappingTechniques': idMappingTechniques,
      'inputSourceConfig': inputSourceConfig,
      'roleArn': roleArn,
      'workflowArn': workflowArn,
      'workflowName': workflowName,
      if (description != null) 'description': description,
      if (outputSourceConfig != null) 'outputSourceConfig': outputSourceConfig,
    };
  }
}

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
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      idNamespaceArn: json['idNamespaceArn'] as String,
      idNamespaceName: json['idNamespaceName'] as String,
      type: (json['type'] as String).toIdNamespaceType(),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      description: json['description'] as String?,
      idMappingWorkflowProperties:
          (json['idMappingWorkflowProperties'] as List?)
              ?.whereNotNull()
              .map((e) => IdNamespaceIdMappingWorkflowProperties.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      inputSourceConfig: (json['inputSourceConfig'] as List?)
          ?.whereNotNull()
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
      'type': type.toValue(),
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

class CreateMatchingWorkflowOutput {
  /// A list of <code>InputSource</code> objects, which have the fields
  /// <code>InputSourceARN</code> and <code>SchemaName</code>.
  final List<InputSource> inputSourceConfig;

  /// A list of <code>OutputSource</code> objects, each of which contains fields
  /// <code>OutputS3Path</code>, <code>ApplyNormalization</code>, and
  /// <code>Output</code>.
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
      inputSourceConfig: (json['inputSourceConfig'] as List)
          .whereNotNull()
          .map((e) => InputSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      outputSourceConfig: (json['outputSourceConfig'] as List)
          .whereNotNull()
          .map((e) => OutputSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      resolutionTechniques: ResolutionTechniques.fromJson(
          json['resolutionTechniques'] as Map<String, dynamic>),
      roleArn: json['roleArn'] as String,
      workflowArn: json['workflowArn'] as String,
      workflowName: json['workflowName'] as String,
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
      description: json['description'] as String,
      mappedInputFields: (json['mappedInputFields'] as List)
          .whereNotNull()
          .map((e) => SchemaInputAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      schemaArn: json['schemaArn'] as String,
      schemaName: json['schemaName'] as String,
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

class DeleteIdMappingWorkflowOutput {
  /// A successful operation message.
  final String message;

  DeleteIdMappingWorkflowOutput({
    required this.message,
  });

  factory DeleteIdMappingWorkflowOutput.fromJson(Map<String, dynamic> json) {
    return DeleteIdMappingWorkflowOutput(
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

class DeleteIdNamespaceOutput {
  /// A successful operation message.
  final String message;

  DeleteIdNamespaceOutput({
    required this.message,
  });

  factory DeleteIdNamespaceOutput.fromJson(Map<String, dynamic> json) {
    return DeleteIdNamespaceOutput(
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

class DeleteMatchingWorkflowOutput {
  /// A successful operation message.
  final String message;

  DeleteMatchingWorkflowOutput({
    required this.message,
  });

  factory DeleteMatchingWorkflowOutput.fromJson(Map<String, dynamic> json) {
    return DeleteMatchingWorkflowOutput(
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
      arn: json['arn'] as String,
      token: json['token'] as String,
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

class DeleteSchemaMappingOutput {
  /// A successful operation message.
  final String message;

  DeleteSchemaMappingOutput({
    required this.message,
  });

  factory DeleteSchemaMappingOutput.fromJson(Map<String, dynamic> json) {
    return DeleteSchemaMappingOutput(
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

/// The Delete Unique Id error.
class DeleteUniqueIdError {
  /// The error type for the batch delete unique ID operation.
  final DeleteUniqueIdErrorType errorType;

  /// The unique ID that could not be deleted.
  final String uniqueId;

  DeleteUniqueIdError({
    required this.errorType,
    required this.uniqueId,
  });

  factory DeleteUniqueIdError.fromJson(Map<String, dynamic> json) {
    return DeleteUniqueIdError(
      errorType: (json['errorType'] as String).toDeleteUniqueIdErrorType(),
      uniqueId: json['uniqueId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final errorType = this.errorType;
    final uniqueId = this.uniqueId;
    return {
      'errorType': errorType.toValue(),
      'uniqueId': uniqueId,
    };
  }
}

enum DeleteUniqueIdErrorType {
  serviceError,
  validationError,
}

extension DeleteUniqueIdErrorTypeValueExtension on DeleteUniqueIdErrorType {
  String toValue() {
    switch (this) {
      case DeleteUniqueIdErrorType.serviceError:
        return 'SERVICE_ERROR';
      case DeleteUniqueIdErrorType.validationError:
        return 'VALIDATION_ERROR';
    }
  }
}

extension DeleteUniqueIdErrorTypeFromString on String {
  DeleteUniqueIdErrorType toDeleteUniqueIdErrorType() {
    switch (this) {
      case 'SERVICE_ERROR':
        return DeleteUniqueIdErrorType.serviceError;
      case 'VALIDATION_ERROR':
        return DeleteUniqueIdErrorType.validationError;
    }
    throw Exception('$this is not known in enum DeleteUniqueIdErrorType');
  }
}

enum DeleteUniqueIdStatus {
  completed,
  accepted,
}

extension DeleteUniqueIdStatusValueExtension on DeleteUniqueIdStatus {
  String toValue() {
    switch (this) {
      case DeleteUniqueIdStatus.completed:
        return 'COMPLETED';
      case DeleteUniqueIdStatus.accepted:
        return 'ACCEPTED';
    }
  }
}

extension DeleteUniqueIdStatusFromString on String {
  DeleteUniqueIdStatus toDeleteUniqueIdStatus() {
    switch (this) {
      case 'COMPLETED':
        return DeleteUniqueIdStatus.completed;
      case 'ACCEPTED':
        return DeleteUniqueIdStatus.accepted;
    }
    throw Exception('$this is not known in enum DeleteUniqueIdStatus');
  }
}

/// The deleted unique ID.
class DeletedUniqueId {
  /// The unique ID of the deleted item.
  final String uniqueId;

  DeletedUniqueId({
    required this.uniqueId,
  });

  factory DeletedUniqueId.fromJson(Map<String, dynamic> json) {
    return DeletedUniqueId(
      uniqueId: json['uniqueId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final uniqueId = this.uniqueId;
    return {
      'uniqueId': uniqueId,
    };
  }
}

class Document {
  Document();

  factory Document.fromJson(Map<String, dynamic> _) {
    return Document();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An object containing an error message, if there was an error.
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
    this.metrics,
    this.outputSourceConfig,
  });

  factory GetIdMappingJobOutput.fromJson(Map<String, dynamic> json) {
    return GetIdMappingJobOutput(
      jobId: json['jobId'] as String,
      startTime: nonNullableTimeStampFromJson(json['startTime'] as Object),
      status: (json['status'] as String).toJobStatus(),
      endTime: timeStampFromJson(json['endTime']),
      errorDetails: json['errorDetails'] != null
          ? ErrorDetails.fromJson(json['errorDetails'] as Map<String, dynamic>)
          : null,
      metrics: json['metrics'] != null
          ? IdMappingJobMetrics.fromJson(
              json['metrics'] as Map<String, dynamic>)
          : null,
      outputSourceConfig: (json['outputSourceConfig'] as List?)
          ?.whereNotNull()
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
    final metrics = this.metrics;
    final outputSourceConfig = this.outputSourceConfig;
    return {
      'jobId': jobId,
      'startTime': unixTimestampToJson(startTime),
      'status': status.toValue(),
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (errorDetails != null) 'errorDetails': errorDetails,
      if (metrics != null) 'metrics': metrics,
      if (outputSourceConfig != null) 'outputSourceConfig': outputSourceConfig,
    };
  }
}

class GetIdMappingWorkflowOutput {
  /// The timestamp of when the workflow was created.
  final DateTime createdAt;

  /// An object which defines the <code>idMappingType</code> and the
  /// <code>providerProperties</code>.
  final IdMappingTechniques idMappingTechniques;

  /// A list of <code>InputSource</code> objects, which have the fields
  /// <code>InputSourceARN</code> and <code>SchemaName</code>.
  final List<IdMappingWorkflowInputSource> inputSourceConfig;

  /// The Amazon Resource Name (ARN) of the IAM role. Entity Resolution assumes
  /// this role to access Amazon Web Services resources on your behalf.
  final String roleArn;

  /// The timestamp of when the workflow was last updated.
  final DateTime updatedAt;

  /// The ARN (Amazon Resource Name) that Entity Resolution generated for the
  /// <code>IdMappingWorkflow</code> .
  final String workflowArn;

  /// The name of the workflow.
  final String workflowName;

  /// A description of the workflow.
  final String? description;

  /// A list of <code>OutputSource</code> objects, each of which contains fields
  /// <code>OutputS3Path</code> and <code>KMSArn</code>.
  final List<IdMappingWorkflowOutputSource>? outputSourceConfig;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  GetIdMappingWorkflowOutput({
    required this.createdAt,
    required this.idMappingTechniques,
    required this.inputSourceConfig,
    required this.roleArn,
    required this.updatedAt,
    required this.workflowArn,
    required this.workflowName,
    this.description,
    this.outputSourceConfig,
    this.tags,
  });

  factory GetIdMappingWorkflowOutput.fromJson(Map<String, dynamic> json) {
    return GetIdMappingWorkflowOutput(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      idMappingTechniques: IdMappingTechniques.fromJson(
          json['idMappingTechniques'] as Map<String, dynamic>),
      inputSourceConfig: (json['inputSourceConfig'] as List)
          .whereNotNull()
          .map((e) =>
              IdMappingWorkflowInputSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      roleArn: json['roleArn'] as String,
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      workflowArn: json['workflowArn'] as String,
      workflowName: json['workflowName'] as String,
      description: json['description'] as String?,
      outputSourceConfig: (json['outputSourceConfig'] as List?)
          ?.whereNotNull()
          .map((e) =>
              IdMappingWorkflowOutputSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final idMappingTechniques = this.idMappingTechniques;
    final inputSourceConfig = this.inputSourceConfig;
    final roleArn = this.roleArn;
    final updatedAt = this.updatedAt;
    final workflowArn = this.workflowArn;
    final workflowName = this.workflowName;
    final description = this.description;
    final outputSourceConfig = this.outputSourceConfig;
    final tags = this.tags;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'idMappingTechniques': idMappingTechniques,
      'inputSourceConfig': inputSourceConfig,
      'roleArn': roleArn,
      'updatedAt': unixTimestampToJson(updatedAt),
      'workflowArn': workflowArn,
      'workflowName': workflowName,
      if (description != null) 'description': description,
      if (outputSourceConfig != null) 'outputSourceConfig': outputSourceConfig,
      if (tags != null) 'tags': tags,
    };
  }
}

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
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      idNamespaceArn: json['idNamespaceArn'] as String,
      idNamespaceName: json['idNamespaceName'] as String,
      type: (json['type'] as String).toIdNamespaceType(),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      description: json['description'] as String?,
      idMappingWorkflowProperties:
          (json['idMappingWorkflowProperties'] as List?)
              ?.whereNotNull()
              .map((e) => IdNamespaceIdMappingWorkflowProperties.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      inputSourceConfig: (json['inputSourceConfig'] as List?)
          ?.whereNotNull()
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
      'type': type.toValue(),
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

class GetMatchingJobOutput {
  /// The ID of the job.
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
      jobId: json['jobId'] as String,
      startTime: nonNullableTimeStampFromJson(json['startTime'] as Object),
      status: (json['status'] as String).toJobStatus(),
      endTime: timeStampFromJson(json['endTime']),
      errorDetails: json['errorDetails'] != null
          ? ErrorDetails.fromJson(json['errorDetails'] as Map<String, dynamic>)
          : null,
      metrics: json['metrics'] != null
          ? JobMetrics.fromJson(json['metrics'] as Map<String, dynamic>)
          : null,
      outputSourceConfig: (json['outputSourceConfig'] as List?)
          ?.whereNotNull()
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
      'status': status.toValue(),
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (errorDetails != null) 'errorDetails': errorDetails,
      if (metrics != null) 'metrics': metrics,
      if (outputSourceConfig != null) 'outputSourceConfig': outputSourceConfig,
    };
  }
}

class GetMatchingWorkflowOutput {
  /// The timestamp of when the workflow was created.
  final DateTime createdAt;

  /// A list of <code>InputSource</code> objects, which have the fields
  /// <code>InputSourceARN</code> and <code>SchemaName</code>.
  final List<InputSource> inputSourceConfig;

  /// A list of <code>OutputSource</code> objects, each of which contains fields
  /// <code>OutputS3Path</code>, <code>ApplyNormalization</code>, and
  /// <code>Output</code>.
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
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      inputSourceConfig: (json['inputSourceConfig'] as List)
          .whereNotNull()
          .map((e) => InputSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      outputSourceConfig: (json['outputSourceConfig'] as List)
          .whereNotNull()
          .map((e) => OutputSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      resolutionTechniques: ResolutionTechniques.fromJson(
          json['resolutionTechniques'] as Map<String, dynamic>),
      roleArn: json['roleArn'] as String,
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      workflowArn: json['workflowArn'] as String,
      workflowName: json['workflowName'] as String,
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
      arn: json['arn'] as String,
      token: json['token'] as String,
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
      anonymizedOutput: json['anonymizedOutput'] as bool,
      providerEndpointConfiguration: ProviderEndpointConfiguration.fromJson(
          json['providerEndpointConfiguration'] as Map<String, dynamic>),
      providerEntityOutputDefinition: Document.fromJson(
          json['providerEntityOutputDefinition'] as Map<String, dynamic>),
      providerName: json['providerName'] as String,
      providerServiceArn: json['providerServiceArn'] as String,
      providerServiceDisplayName: json['providerServiceDisplayName'] as String,
      providerServiceName: json['providerServiceName'] as String,
      providerServiceType:
          (json['providerServiceType'] as String).toServiceType(),
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
      'providerServiceType': providerServiceType.toValue(),
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

class GetSchemaMappingOutput {
  /// The timestamp of when the <code>SchemaMapping</code> was created.
  final DateTime createdAt;

  /// Specifies whether the schema mapping has been applied to a workflow.
  final bool hasWorkflows;

  /// A list of <code>MappedInputFields</code>. Each <code>MappedInputField</code>
  /// corresponds to a column the source data table, and contains column name plus
  /// additional information Venice uses for matching.
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
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      hasWorkflows: json['hasWorkflows'] as bool,
      mappedInputFields: (json['mappedInputFields'] as List)
          .whereNotNull()
          .map((e) => SchemaInputAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      schemaArn: json['schemaArn'] as String,
      schemaName: json['schemaName'] as String,
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
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

/// An object containing <code>InputRecords</code>,
/// <code>TotalRecordsProcessed</code>, <code>MatchIDs</code>, and
/// <code>RecordsNotProcessed</code>.
class IdMappingJobMetrics {
  /// The total number of input records.
  final int? inputRecords;

  /// The total number of records that did not get processed.
  final int? recordsNotProcessed;

  /// The total number of records processed.
  final int? totalRecordsProcessed;

  IdMappingJobMetrics({
    this.inputRecords,
    this.recordsNotProcessed,
    this.totalRecordsProcessed,
  });

  factory IdMappingJobMetrics.fromJson(Map<String, dynamic> json) {
    return IdMappingJobMetrics(
      inputRecords: json['inputRecords'] as int?,
      recordsNotProcessed: json['recordsNotProcessed'] as int?,
      totalRecordsProcessed: json['totalRecordsProcessed'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final inputRecords = this.inputRecords;
    final recordsNotProcessed = this.recordsNotProcessed;
    final totalRecordsProcessed = this.totalRecordsProcessed;
    return {
      if (inputRecords != null) 'inputRecords': inputRecords,
      if (recordsNotProcessed != null)
        'recordsNotProcessed': recordsNotProcessed,
      if (totalRecordsProcessed != null)
        'totalRecordsProcessed': totalRecordsProcessed,
    };
  }
}

/// An object containing <code>KMSArn</code>, <code>OutputS3Path</code>, and
/// <code>RoleARN</code>.
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
      outputS3Path: json['outputS3Path'] as String,
      roleArn: json['roleArn'] as String,
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

/// An object which defines the ID mapping techniques and provider
/// configurations.
class IdMappingTechniques {
  /// The type of ID mapping.
  final IdMappingType idMappingType;

  /// An object which defines any additional configurations required by the
  /// provider service.
  final ProviderProperties? providerProperties;

  IdMappingTechniques({
    required this.idMappingType,
    this.providerProperties,
  });

  factory IdMappingTechniques.fromJson(Map<String, dynamic> json) {
    return IdMappingTechniques(
      idMappingType: (json['idMappingType'] as String).toIdMappingType(),
      providerProperties: json['providerProperties'] != null
          ? ProviderProperties.fromJson(
              json['providerProperties'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final idMappingType = this.idMappingType;
    final providerProperties = this.providerProperties;
    return {
      'idMappingType': idMappingType.toValue(),
      if (providerProperties != null) 'providerProperties': providerProperties,
    };
  }
}

enum IdMappingType {
  provider,
}

extension IdMappingTypeValueExtension on IdMappingType {
  String toValue() {
    switch (this) {
      case IdMappingType.provider:
        return 'PROVIDER';
    }
  }
}

extension IdMappingTypeFromString on String {
  IdMappingType toIdMappingType() {
    switch (this) {
      case 'PROVIDER':
        return IdMappingType.provider;
    }
    throw Exception('$this is not known in enum IdMappingType');
  }
}

/// An object containing <code>InputSourceARN</code>, <code>SchemaName</code>,
/// and <code>Type</code>.
class IdMappingWorkflowInputSource {
  /// An Glue table ARN for the input source table.
  final String inputSourceARN;

  /// The name of the schema to be retrieved.
  final String? schemaName;

  /// The type of ID namespace. There are two types: <code>SOURCE</code> and
  /// <code>TARGET</code>.
  ///
  /// The <code>SOURCE</code> contains configurations for <code>sourceId</code>
  /// data that will be processed in an ID mapping workflow.
  ///
  /// The <code>TARGET</code> contains a configuration of <code>targetId</code> to
  /// which all <code>sourceIds</code> will resolve to.
  final IdNamespaceType? type;

  IdMappingWorkflowInputSource({
    required this.inputSourceARN,
    this.schemaName,
    this.type,
  });

  factory IdMappingWorkflowInputSource.fromJson(Map<String, dynamic> json) {
    return IdMappingWorkflowInputSource(
      inputSourceARN: json['inputSourceARN'] as String,
      schemaName: json['schemaName'] as String?,
      type: (json['type'] as String?)?.toIdNamespaceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final inputSourceARN = this.inputSourceARN;
    final schemaName = this.schemaName;
    final type = this.type;
    return {
      'inputSourceARN': inputSourceARN,
      if (schemaName != null) 'schemaName': schemaName,
      if (type != null) 'type': type.toValue(),
    };
  }
}

/// The output source for the ID mapping workflow.
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
      outputS3Path: json['outputS3Path'] as String,
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

/// A list of <code>IdMappingWorkflowSummary</code> objects, each of which
/// contain the fields <code>WorkflowName</code>, <code>WorkflowArn</code>,
/// <code>CreatedAt</code>, and <code>UpdatedAt</code>.
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
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      workflowArn: json['workflowArn'] as String,
      workflowName: json['workflowName'] as String,
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

/// An object containing <code>IdMappingType</code> and
/// <code>ProviderProperties</code>.
class IdNamespaceIdMappingWorkflowProperties {
  /// The type of ID mapping.
  final IdMappingType idMappingType;

  /// An object which defines any additional configurations required by the
  /// provider service.
  final NamespaceProviderProperties? providerProperties;

  IdNamespaceIdMappingWorkflowProperties({
    required this.idMappingType,
    this.providerProperties,
  });

  factory IdNamespaceIdMappingWorkflowProperties.fromJson(
      Map<String, dynamic> json) {
    return IdNamespaceIdMappingWorkflowProperties(
      idMappingType: (json['idMappingType'] as String).toIdMappingType(),
      providerProperties: json['providerProperties'] != null
          ? NamespaceProviderProperties.fromJson(
              json['providerProperties'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final idMappingType = this.idMappingType;
    final providerProperties = this.providerProperties;
    return {
      'idMappingType': idMappingType.toValue(),
      if (providerProperties != null) 'providerProperties': providerProperties,
    };
  }
}

/// An object containing <code>InputSourceARN</code> and
/// <code>SchemaName</code>.
class IdNamespaceInputSource {
  /// An Glue table ARN for the input source table.
  final String inputSourceARN;

  /// The name of the schema.
  final String? schemaName;

  IdNamespaceInputSource({
    required this.inputSourceARN,
    this.schemaName,
  });

  factory IdNamespaceInputSource.fromJson(Map<String, dynamic> json) {
    return IdNamespaceInputSource(
      inputSourceARN: json['inputSourceARN'] as String,
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

/// A summary of ID namespaces.
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
  /// The <code>TARGET</code> contains a configuration of <code>targetId</code> to
  /// which all <code>sourceIds</code> will resolve to.
  final IdNamespaceType type;

  /// The timestamp of when the ID namespace was last updated.
  final DateTime updatedAt;

  /// The description of the ID namespace.
  final String? description;

  IdNamespaceSummary({
    required this.createdAt,
    required this.idNamespaceArn,
    required this.idNamespaceName,
    required this.type,
    required this.updatedAt,
    this.description,
  });

  factory IdNamespaceSummary.fromJson(Map<String, dynamic> json) {
    return IdNamespaceSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      idNamespaceArn: json['idNamespaceArn'] as String,
      idNamespaceName: json['idNamespaceName'] as String,
      type: (json['type'] as String).toIdNamespaceType(),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final idNamespaceArn = this.idNamespaceArn;
    final idNamespaceName = this.idNamespaceName;
    final type = this.type;
    final updatedAt = this.updatedAt;
    final description = this.description;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'idNamespaceArn': idNamespaceArn,
      'idNamespaceName': idNamespaceName,
      'type': type.toValue(),
      'updatedAt': unixTimestampToJson(updatedAt),
      if (description != null) 'description': description,
    };
  }
}

enum IdNamespaceType {
  source,
  target,
}

extension IdNamespaceTypeValueExtension on IdNamespaceType {
  String toValue() {
    switch (this) {
      case IdNamespaceType.source:
        return 'SOURCE';
      case IdNamespaceType.target:
        return 'TARGET';
    }
  }
}

extension IdNamespaceTypeFromString on String {
  IdNamespaceType toIdNamespaceType() {
    switch (this) {
      case 'SOURCE':
        return IdNamespaceType.source;
      case 'TARGET':
        return IdNamespaceType.target;
    }
    throw Exception('$this is not known in enum IdNamespaceType');
  }
}

/// An object which defines an incremental run type and has only
/// <code>incrementalRunType</code> as a field.
class IncrementalRunConfig {
  /// The type of incremental run. It takes only one value:
  /// <code>IMMEDIATE</code>.
  final IncrementalRunType? incrementalRunType;

  IncrementalRunConfig({
    this.incrementalRunType,
  });

  factory IncrementalRunConfig.fromJson(Map<String, dynamic> json) {
    return IncrementalRunConfig(
      incrementalRunType:
          (json['incrementalRunType'] as String?)?.toIncrementalRunType(),
    );
  }

  Map<String, dynamic> toJson() {
    final incrementalRunType = this.incrementalRunType;
    return {
      if (incrementalRunType != null)
        'incrementalRunType': incrementalRunType.toValue(),
    };
  }
}

enum IncrementalRunType {
  immediate,
}

extension IncrementalRunTypeValueExtension on IncrementalRunType {
  String toValue() {
    switch (this) {
      case IncrementalRunType.immediate:
        return 'IMMEDIATE';
    }
  }
}

extension IncrementalRunTypeFromString on String {
  IncrementalRunType toIncrementalRunType() {
    switch (this) {
      case 'IMMEDIATE':
        return IncrementalRunType.immediate;
    }
    throw Exception('$this is not known in enum IncrementalRunType');
  }
}

/// An object containing <code>InputSourceARN</code>, <code>SchemaName</code>,
/// and <code>ApplyNormalization</code>.
class InputSource {
  /// An Glue table ARN for the input source table.
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
      inputSourceARN: json['inputSourceARN'] as String,
      schemaName: json['schemaName'] as String,
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

/// The Amazon S3 location that temporarily stores your data while it processes.
/// Your information won't be saved permanently.
class IntermediateSourceConfiguration {
  /// The Amazon S3 location (bucket and prefix). For example:
  /// <code>s3://provider_bucket/DOC-EXAMPLE-BUCKET</code>
  final String intermediateS3Path;

  IntermediateSourceConfiguration({
    required this.intermediateS3Path,
  });

  factory IntermediateSourceConfiguration.fromJson(Map<String, dynamic> json) {
    return IntermediateSourceConfiguration(
      intermediateS3Path: json['intermediateS3Path'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final intermediateS3Path = this.intermediateS3Path;
    return {
      'intermediateS3Path': intermediateS3Path,
    };
  }
}

/// An object containing <code>InputRecords</code>,
/// <code>TotalRecordsProcessed</code>, <code>MatchIDs</code>, and
/// <code>RecordsNotProcessed</code>.
class JobMetrics {
  /// The total number of input records.
  final int? inputRecords;

  /// The total number of <code>matchID</code>s generated.
  final int? matchIDs;

  /// The total number of records that did not get processed.
  final int? recordsNotProcessed;

  /// The total number of records processed.
  final int? totalRecordsProcessed;

  JobMetrics({
    this.inputRecords,
    this.matchIDs,
    this.recordsNotProcessed,
    this.totalRecordsProcessed,
  });

  factory JobMetrics.fromJson(Map<String, dynamic> json) {
    return JobMetrics(
      inputRecords: json['inputRecords'] as int?,
      matchIDs: json['matchIDs'] as int?,
      recordsNotProcessed: json['recordsNotProcessed'] as int?,
      totalRecordsProcessed: json['totalRecordsProcessed'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final inputRecords = this.inputRecords;
    final matchIDs = this.matchIDs;
    final recordsNotProcessed = this.recordsNotProcessed;
    final totalRecordsProcessed = this.totalRecordsProcessed;
    return {
      if (inputRecords != null) 'inputRecords': inputRecords,
      if (matchIDs != null) 'matchIDs': matchIDs,
      if (recordsNotProcessed != null)
        'recordsNotProcessed': recordsNotProcessed,
      if (totalRecordsProcessed != null)
        'totalRecordsProcessed': totalRecordsProcessed,
    };
  }
}

/// An object containing <code>KMSArn</code>, <code>OutputS3Path</code>, and
/// <code>RoleArn</code>.
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
      outputS3Path: json['outputS3Path'] as String,
      roleArn: json['roleArn'] as String,
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

enum JobStatus {
  running,
  succeeded,
  failed,
  queued,
}

extension JobStatusValueExtension on JobStatus {
  String toValue() {
    switch (this) {
      case JobStatus.running:
        return 'RUNNING';
      case JobStatus.succeeded:
        return 'SUCCEEDED';
      case JobStatus.failed:
        return 'FAILED';
      case JobStatus.queued:
        return 'QUEUED';
    }
  }
}

extension JobStatusFromString on String {
  JobStatus toJobStatus() {
    switch (this) {
      case 'RUNNING':
        return JobStatus.running;
      case 'SUCCEEDED':
        return JobStatus.succeeded;
      case 'FAILED':
        return JobStatus.failed;
      case 'QUEUED':
        return JobStatus.queued;
    }
    throw Exception('$this is not known in enum JobStatus');
  }
}

/// An object containing the <code>JobId</code>, <code>Status</code>,
/// <code>StartTime</code>, and <code>EndTime</code> of a job.
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
      jobId: json['jobId'] as String,
      startTime: nonNullableTimeStampFromJson(json['startTime'] as Object),
      status: (json['status'] as String).toJobStatus(),
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
      'status': status.toValue(),
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
    };
  }
}

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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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

class ListMatchingWorkflowsOutput {
  /// The pagination token from the previous API call.
  final String? nextToken;

  /// A list of <code>MatchingWorkflowSummary</code> objects, each of which
  /// contain the fields <code>WorkflowName</code>, <code>WorkflowArn</code>,
  /// <code>CreatedAt</code>, and <code>UpdatedAt</code>.
  final List<MatchingWorkflowSummary>? workflowSummaries;

  ListMatchingWorkflowsOutput({
    this.nextToken,
    this.workflowSummaries,
  });

  factory ListMatchingWorkflowsOutput.fromJson(Map<String, dynamic> json) {
    return ListMatchingWorkflowsOutput(
      nextToken: json['nextToken'] as String?,
      workflowSummaries: (json['workflowSummaries'] as List?)
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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

class ListTagsForResourceOutput {
  /// The tags used to organize, track, or control access for this resource.
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

/// A list of <code>MatchingWorkflowSummary</code> objects, each of which
/// contain the fields <code>WorkflowName</code>, <code>WorkflowArn</code>,
/// <code>CreatedAt</code>, <code>UpdatedAt</code>.
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
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      resolutionType: (json['resolutionType'] as String).toResolutionType(),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      workflowArn: json['workflowArn'] as String,
      workflowName: json['workflowName'] as String,
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
      'resolutionType': resolutionType.toValue(),
      'updatedAt': unixTimestampToJson(updatedAt),
      'workflowArn': workflowArn,
      'workflowName': workflowName,
    };
  }
}

/// An object containing <code>ProviderConfiguration</code> and
/// <code>ProviderServiceArn</code>.
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
      providerServiceArn: json['providerServiceArn'] as String,
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

/// A list of <code>OutputAttribute</code> objects, each of which have the
/// fields <code>Name</code> and <code>Hashed</code>. Each of these objects
/// selects a column to be included in the output table, and whether the values
/// of the column should be hashed.
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
      name: json['name'] as String,
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

/// A list of <code>OutputAttribute</code> objects, each of which have the
/// fields <code>Name</code> and <code>Hashed</code>. Each of these objects
/// selects a column to be included in the output table, and whether the values
/// of the column should be hashed.
class OutputSource {
  /// A list of <code>OutputAttribute</code> objects, each of which have the
  /// fields <code>Name</code> and <code>Hashed</code>. Each of these objects
  /// selects a column to be included in the output table, and whether the values
  /// of the column should be hashed.
  final List<OutputAttribute> output;

  /// The S3 path to which Entity Resolution will write the output table.
  final String outputS3Path;

  /// Customer KMS ARN for encryption at rest. If not provided, system will use an
  /// Entity Resolution managed KMS key.
  final String? kMSArn;

  /// Normalizes the attributes defined in the schema in the input data. For
  /// example, if an attribute has an <code>AttributeType</code> of
  /// <code>PHONE_NUMBER</code>, and the data in the input table is in a format of
  /// 1234567890, Entity Resolution will normalize this field in the output to
  /// (123)-456-7890.
  final bool? applyNormalization;

  OutputSource({
    required this.output,
    required this.outputS3Path,
    this.kMSArn,
    this.applyNormalization,
  });

  factory OutputSource.fromJson(Map<String, dynamic> json) {
    return OutputSource(
      output: (json['output'] as List)
          .whereNotNull()
          .map((e) => OutputAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      outputS3Path: json['outputS3Path'] as String,
      kMSArn: json['KMSArn'] as String?,
      applyNormalization: json['applyNormalization'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final output = this.output;
    final outputS3Path = this.outputS3Path;
    final kMSArn = this.kMSArn;
    final applyNormalization = this.applyNormalization;
    return {
      'output': output,
      'outputS3Path': outputS3Path,
      if (kMSArn != null) 'KMSArn': kMSArn,
      if (applyNormalization != null) 'applyNormalization': applyNormalization,
    };
  }
}

/// The input schema supported by provider service.
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
          ?.whereNotNull()
          .map((e) =>
              ProviderSchemaAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      schemas: (json['schemas'] as List?)
          ?.whereNotNull()
          .map((e) =>
              (e as List).whereNotNull().map((e) => e as String).toList())
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

/// The required configuration fields to use with the provider service.
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

/// The provider configuration required for different ID namespace types.
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

/// The required configuration fields to give intermediate access to a provider
/// service.
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
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      requiredBucketActions: (json['requiredBucketActions'] as List?)
          ?.whereNotNull()
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

/// The identifiers of the provider service, from Data Exchange.
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
      assetId: json['assetId'] as String,
      dataSetId: json['dataSetId'] as String,
      listingId: json['listingId'] as String,
      revisionId: json['revisionId'] as String,
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

/// An object containing the <code>providerServiceARN</code>,
/// <code>intermediateSourceConfiguration</code>, and
/// <code>providerConfiguration</code>.
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
      providerServiceArn: json['providerServiceArn'] as String,
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

/// The provider schema attribute.
class ProviderSchemaAttribute {
  /// The field name.
  final String fieldName;

  /// The type of the provider schema attribute.
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
      fieldName: json['fieldName'] as String,
      type: (json['type'] as String).toSchemaAttributeType(),
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
      'type': type.toValue(),
      if (hashing != null) 'hashing': hashing,
      if (subType != null) 'subType': subType,
    };
  }
}

/// A list of <code>ProviderService</code> objects, each of which contain the
/// fields <code>providerName</code>, <code>providerServiceArn</code>,
/// <code>providerServiceName</code>, and <code>providerServiceType</code>.
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
      providerName: json['providerName'] as String,
      providerServiceArn: json['providerServiceArn'] as String,
      providerServiceDisplayName: json['providerServiceDisplayName'] as String,
      providerServiceName: json['providerServiceName'] as String,
      providerServiceType:
          (json['providerServiceType'] as String).toServiceType(),
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
      'providerServiceType': providerServiceType.toValue(),
    };
  }
}

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
      arn: json['arn'] as String,
      token: json['token'] as String,
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

/// An object which defines the <code>resolutionType</code> and the
/// <code>ruleBasedProperties</code>.
class ResolutionTechniques {
  /// The type of matching. There are three types of matching:
  /// <code>RULE_MATCHING</code>, <code>ML_MATCHING</code>, and
  /// <code>PROVIDER</code>.
  final ResolutionType resolutionType;

  /// The properties of the provider service.
  final ProviderProperties? providerProperties;

  /// An object which defines the list of matching rules to run and has a field
  /// <code>Rules</code>, which is a list of rule objects.
  final RuleBasedProperties? ruleBasedProperties;

  ResolutionTechniques({
    required this.resolutionType,
    this.providerProperties,
    this.ruleBasedProperties,
  });

  factory ResolutionTechniques.fromJson(Map<String, dynamic> json) {
    return ResolutionTechniques(
      resolutionType: (json['resolutionType'] as String).toResolutionType(),
      providerProperties: json['providerProperties'] != null
          ? ProviderProperties.fromJson(
              json['providerProperties'] as Map<String, dynamic>)
          : null,
      ruleBasedProperties: json['ruleBasedProperties'] != null
          ? RuleBasedProperties.fromJson(
              json['ruleBasedProperties'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final resolutionType = this.resolutionType;
    final providerProperties = this.providerProperties;
    final ruleBasedProperties = this.ruleBasedProperties;
    return {
      'resolutionType': resolutionType.toValue(),
      if (providerProperties != null) 'providerProperties': providerProperties,
      if (ruleBasedProperties != null)
        'ruleBasedProperties': ruleBasedProperties,
    };
  }
}

enum ResolutionType {
  ruleMatching,
  mlMatching,
  provider,
}

extension ResolutionTypeValueExtension on ResolutionType {
  String toValue() {
    switch (this) {
      case ResolutionType.ruleMatching:
        return 'RULE_MATCHING';
      case ResolutionType.mlMatching:
        return 'ML_MATCHING';
      case ResolutionType.provider:
        return 'PROVIDER';
    }
  }
}

extension ResolutionTypeFromString on String {
  ResolutionType toResolutionType() {
    switch (this) {
      case 'RULE_MATCHING':
        return ResolutionType.ruleMatching;
      case 'ML_MATCHING':
        return ResolutionType.mlMatching;
      case 'PROVIDER':
        return ResolutionType.provider;
    }
    throw Exception('$this is not known in enum ResolutionType');
  }
}

/// An object containing <code>RuleName</code>, and <code>MatchingKeys</code>.
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
      matchingKeys: (json['matchingKeys'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      ruleName: json['ruleName'] as String,
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

/// An object which defines the list of matching rules to run and has a field
/// <code>Rules</code>, which is a list of rule objects.
class RuleBasedProperties {
  /// The comparison type. You can either choose <code>ONE_TO_ONE</code> or
  /// <code>MANY_TO_MANY</code> as the AttributeMatchingModel. When choosing
  /// <code>MANY_TO_MANY</code>, the system can match attributes across the
  /// sub-types of an attribute type. For example, if the value of the
  /// <code>Email</code> field of Profile A and the value of
  /// <code>BusinessEmail</code> field of Profile B matches, the two profiles are
  /// matched on the <code>Email</code> type. When choosing
  /// <code>ONE_TO_ONE</code> ,the system can only match if the sub-types are
  /// exact matches. For example, only when the value of the <code>Email</code>
  /// field of Profile A and the value of the <code>Email</code> field of Profile
  /// B matches, the two profiles are matched on the <code>Email</code> type.
  final AttributeMatchingModel attributeMatchingModel;

  /// A list of <code>Rule</code> objects, each of which have fields
  /// <code>RuleName</code> and <code>MatchingKeys</code>.
  final List<Rule> rules;

  RuleBasedProperties({
    required this.attributeMatchingModel,
    required this.rules,
  });

  factory RuleBasedProperties.fromJson(Map<String, dynamic> json) {
    return RuleBasedProperties(
      attributeMatchingModel:
          (json['attributeMatchingModel'] as String).toAttributeMatchingModel(),
      rules: (json['rules'] as List)
          .whereNotNull()
          .map((e) => Rule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final attributeMatchingModel = this.attributeMatchingModel;
    final rules = this.rules;
    return {
      'attributeMatchingModel': attributeMatchingModel.toValue(),
      'rules': rules,
    };
  }
}

enum SchemaAttributeType {
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
}

extension SchemaAttributeTypeValueExtension on SchemaAttributeType {
  String toValue() {
    switch (this) {
      case SchemaAttributeType.name:
        return 'NAME';
      case SchemaAttributeType.nameFirst:
        return 'NAME_FIRST';
      case SchemaAttributeType.nameMiddle:
        return 'NAME_MIDDLE';
      case SchemaAttributeType.nameLast:
        return 'NAME_LAST';
      case SchemaAttributeType.address:
        return 'ADDRESS';
      case SchemaAttributeType.addressStreet1:
        return 'ADDRESS_STREET1';
      case SchemaAttributeType.addressStreet2:
        return 'ADDRESS_STREET2';
      case SchemaAttributeType.addressStreet3:
        return 'ADDRESS_STREET3';
      case SchemaAttributeType.addressCity:
        return 'ADDRESS_CITY';
      case SchemaAttributeType.addressState:
        return 'ADDRESS_STATE';
      case SchemaAttributeType.addressCountry:
        return 'ADDRESS_COUNTRY';
      case SchemaAttributeType.addressPostalcode:
        return 'ADDRESS_POSTALCODE';
      case SchemaAttributeType.phone:
        return 'PHONE';
      case SchemaAttributeType.phoneNumber:
        return 'PHONE_NUMBER';
      case SchemaAttributeType.phoneCountrycode:
        return 'PHONE_COUNTRYCODE';
      case SchemaAttributeType.emailAddress:
        return 'EMAIL_ADDRESS';
      case SchemaAttributeType.uniqueId:
        return 'UNIQUE_ID';
      case SchemaAttributeType.date:
        return 'DATE';
      case SchemaAttributeType.string:
        return 'STRING';
      case SchemaAttributeType.providerId:
        return 'PROVIDER_ID';
    }
  }
}

extension SchemaAttributeTypeFromString on String {
  SchemaAttributeType toSchemaAttributeType() {
    switch (this) {
      case 'NAME':
        return SchemaAttributeType.name;
      case 'NAME_FIRST':
        return SchemaAttributeType.nameFirst;
      case 'NAME_MIDDLE':
        return SchemaAttributeType.nameMiddle;
      case 'NAME_LAST':
        return SchemaAttributeType.nameLast;
      case 'ADDRESS':
        return SchemaAttributeType.address;
      case 'ADDRESS_STREET1':
        return SchemaAttributeType.addressStreet1;
      case 'ADDRESS_STREET2':
        return SchemaAttributeType.addressStreet2;
      case 'ADDRESS_STREET3':
        return SchemaAttributeType.addressStreet3;
      case 'ADDRESS_CITY':
        return SchemaAttributeType.addressCity;
      case 'ADDRESS_STATE':
        return SchemaAttributeType.addressState;
      case 'ADDRESS_COUNTRY':
        return SchemaAttributeType.addressCountry;
      case 'ADDRESS_POSTALCODE':
        return SchemaAttributeType.addressPostalcode;
      case 'PHONE':
        return SchemaAttributeType.phone;
      case 'PHONE_NUMBER':
        return SchemaAttributeType.phoneNumber;
      case 'PHONE_COUNTRYCODE':
        return SchemaAttributeType.phoneCountrycode;
      case 'EMAIL_ADDRESS':
        return SchemaAttributeType.emailAddress;
      case 'UNIQUE_ID':
        return SchemaAttributeType.uniqueId;
      case 'DATE':
        return SchemaAttributeType.date;
      case 'STRING':
        return SchemaAttributeType.string;
      case 'PROVIDER_ID':
        return SchemaAttributeType.providerId;
    }
    throw Exception('$this is not known in enum SchemaAttributeType');
  }
}

/// An object containing <code>FieldName</code>, <code>Type</code>,
/// <code>GroupName</code>, <code>MatchKey</code>, and <code>SubType</code>.
class SchemaInputAttribute {
  /// A string containing the field name.
  final String fieldName;

  /// The type of the attribute, selected from a list of values.
  final SchemaAttributeType type;

  /// A string that instructs Entity Resolution to combine several columns into a
  /// unified column with the identical attribute type.
  ///
  /// For example, when working with columns such as <code>first_name</code>,
  /// <code>middle_name</code>, and <code>last_name</code>, assigning them a
  /// common <code>groupName</code> will prompt Entity Resolution to concatenate
  /// them into a single value.
  final String? groupName;

  /// A key that allows grouping of multiple input attributes into a unified
  /// matching group. For example, consider a scenario where the source table
  /// contains various addresses, such as <code>business_address</code> and
  /// <code>shipping_address</code>. By assigning a <code>matchKey</code> called
  /// <code>address</code> to both attributes, Entity Resolution will match
  /// records across these fields to create a consolidated matching group. If no
  /// <code>matchKey</code> is specified for a column, it won't be utilized for
  /// matching purposes but will still be included in the output table.
  final String? matchKey;

  /// The subtype of the attribute, selected from a list of values.
  final String? subType;

  SchemaInputAttribute({
    required this.fieldName,
    required this.type,
    this.groupName,
    this.matchKey,
    this.subType,
  });

  factory SchemaInputAttribute.fromJson(Map<String, dynamic> json) {
    return SchemaInputAttribute(
      fieldName: json['fieldName'] as String,
      type: (json['type'] as String).toSchemaAttributeType(),
      groupName: json['groupName'] as String?,
      matchKey: json['matchKey'] as String?,
      subType: json['subType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fieldName = this.fieldName;
    final type = this.type;
    final groupName = this.groupName;
    final matchKey = this.matchKey;
    final subType = this.subType;
    return {
      'fieldName': fieldName,
      'type': type.toValue(),
      if (groupName != null) 'groupName': groupName,
      if (matchKey != null) 'matchKey': matchKey,
      if (subType != null) 'subType': subType,
    };
  }
}

/// An object containing <code>SchemaName</code>, <code>SchemaArn</code>,
/// <code>CreatedAt</code>, and<code>UpdatedAt</code>.
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
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      hasWorkflows: json['hasWorkflows'] as bool,
      schemaArn: json['schemaArn'] as String,
      schemaName: json['schemaName'] as String,
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
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

enum ServiceType {
  assignment,
  idMapping,
}

extension ServiceTypeValueExtension on ServiceType {
  String toValue() {
    switch (this) {
      case ServiceType.assignment:
        return 'ASSIGNMENT';
      case ServiceType.idMapping:
        return 'ID_MAPPING';
    }
  }
}

extension ServiceTypeFromString on String {
  ServiceType toServiceType() {
    switch (this) {
      case 'ASSIGNMENT':
        return ServiceType.assignment;
      case 'ID_MAPPING':
        return ServiceType.idMapping;
    }
    throw Exception('$this is not known in enum ServiceType');
  }
}

class StartIdMappingJobOutput {
  /// The ID of the job.
  final String jobId;

  /// A list of <code>OutputSource</code> objects.
  final List<IdMappingJobOutputSource>? outputSourceConfig;

  StartIdMappingJobOutput({
    required this.jobId,
    this.outputSourceConfig,
  });

  factory StartIdMappingJobOutput.fromJson(Map<String, dynamic> json) {
    return StartIdMappingJobOutput(
      jobId: json['jobId'] as String,
      outputSourceConfig: (json['outputSourceConfig'] as List?)
          ?.whereNotNull()
          .map((e) =>
              IdMappingJobOutputSource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    final outputSourceConfig = this.outputSourceConfig;
    return {
      'jobId': jobId,
      if (outputSourceConfig != null) 'outputSourceConfig': outputSourceConfig,
    };
  }
}

class StartMatchingJobOutput {
  /// The ID of the job.
  final String jobId;

  StartMatchingJobOutput({
    required this.jobId,
  });

  factory StartMatchingJobOutput.fromJson(Map<String, dynamic> json) {
    return StartMatchingJobOutput(
      jobId: json['jobId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    return {
      'jobId': jobId,
    };
  }
}

enum StatementEffect {
  allow,
  deny,
}

extension StatementEffectValueExtension on StatementEffect {
  String toValue() {
    switch (this) {
      case StatementEffect.allow:
        return 'Allow';
      case StatementEffect.deny:
        return 'Deny';
    }
  }
}

extension StatementEffectFromString on String {
  StatementEffect toStatementEffect() {
    switch (this) {
      case 'Allow':
        return StatementEffect.allow;
      case 'Deny':
        return StatementEffect.deny;
    }
    throw Exception('$this is not known in enum StatementEffect');
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

class UntagResourceOutput {
  UntagResourceOutput();

  factory UntagResourceOutput.fromJson(Map<String, dynamic> _) {
    return UntagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateIdMappingWorkflowOutput {
  /// An object which defines the <code>idMappingType</code> and the
  /// <code>providerProperties</code>.
  final IdMappingTechniques idMappingTechniques;

  /// A list of <code>InputSource</code> objects, which have the fields
  /// <code>InputSourceARN</code> and <code>SchemaName</code>.
  final List<IdMappingWorkflowInputSource> inputSourceConfig;

  /// The Amazon Resource Name (ARN) of the IAM role. Entity Resolution assumes
  /// this role to access Amazon Web Services resources on your behalf.
  final String roleArn;

  /// The Amazon Resource Name (ARN) of the workflow role. Entity Resolution
  /// assumes this role to access Amazon Web Services resources on your behalf.
  final String workflowArn;

  /// The name of the workflow.
  final String workflowName;

  /// A description of the workflow.
  final String? description;

  /// A list of <code>OutputSource</code> objects, each of which contains fields
  /// <code>OutputS3Path</code> and <code>KMSArn</code>.
  final List<IdMappingWorkflowOutputSource>? outputSourceConfig;

  UpdateIdMappingWorkflowOutput({
    required this.idMappingTechniques,
    required this.inputSourceConfig,
    required this.roleArn,
    required this.workflowArn,
    required this.workflowName,
    this.description,
    this.outputSourceConfig,
  });

  factory UpdateIdMappingWorkflowOutput.fromJson(Map<String, dynamic> json) {
    return UpdateIdMappingWorkflowOutput(
      idMappingTechniques: IdMappingTechniques.fromJson(
          json['idMappingTechniques'] as Map<String, dynamic>),
      inputSourceConfig: (json['inputSourceConfig'] as List)
          .whereNotNull()
          .map((e) =>
              IdMappingWorkflowInputSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      roleArn: json['roleArn'] as String,
      workflowArn: json['workflowArn'] as String,
      workflowName: json['workflowName'] as String,
      description: json['description'] as String?,
      outputSourceConfig: (json['outputSourceConfig'] as List?)
          ?.whereNotNull()
          .map((e) =>
              IdMappingWorkflowOutputSource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final idMappingTechniques = this.idMappingTechniques;
    final inputSourceConfig = this.inputSourceConfig;
    final roleArn = this.roleArn;
    final workflowArn = this.workflowArn;
    final workflowName = this.workflowName;
    final description = this.description;
    final outputSourceConfig = this.outputSourceConfig;
    return {
      'idMappingTechniques': idMappingTechniques,
      'inputSourceConfig': inputSourceConfig,
      'roleArn': roleArn,
      'workflowArn': workflowArn,
      'workflowName': workflowName,
      if (description != null) 'description': description,
      if (outputSourceConfig != null) 'outputSourceConfig': outputSourceConfig,
    };
  }
}

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
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      idNamespaceArn: json['idNamespaceArn'] as String,
      idNamespaceName: json['idNamespaceName'] as String,
      type: (json['type'] as String).toIdNamespaceType(),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      description: json['description'] as String?,
      idMappingWorkflowProperties:
          (json['idMappingWorkflowProperties'] as List?)
              ?.whereNotNull()
              .map((e) => IdNamespaceIdMappingWorkflowProperties.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      inputSourceConfig: (json['inputSourceConfig'] as List?)
          ?.whereNotNull()
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
      'type': type.toValue(),
      'updatedAt': unixTimestampToJson(updatedAt),
      if (description != null) 'description': description,
      if (idMappingWorkflowProperties != null)
        'idMappingWorkflowProperties': idMappingWorkflowProperties,
      if (inputSourceConfig != null) 'inputSourceConfig': inputSourceConfig,
      if (roleArn != null) 'roleArn': roleArn,
    };
  }
}

class UpdateMatchingWorkflowOutput {
  /// A list of <code>InputSource</code> objects, which have the fields
  /// <code>InputSourceARN</code> and <code>SchemaName</code>.
  final List<InputSource> inputSourceConfig;

  /// A list of <code>OutputSource</code> objects, each of which contains fields
  /// <code>OutputS3Path</code>, <code>ApplyNormalization</code>, and
  /// <code>Output</code>.
  final List<OutputSource> outputSourceConfig;

  /// An object which defines the <code>resolutionType</code> and the
  /// <code>ruleBasedProperties</code>
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
      inputSourceConfig: (json['inputSourceConfig'] as List)
          .whereNotNull()
          .map((e) => InputSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      outputSourceConfig: (json['outputSourceConfig'] as List)
          .whereNotNull()
          .map((e) => OutputSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      resolutionTechniques: ResolutionTechniques.fromJson(
          json['resolutionTechniques'] as Map<String, dynamic>),
      roleArn: json['roleArn'] as String,
      workflowName: json['workflowName'] as String,
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
      mappedInputFields: (json['mappedInputFields'] as List)
          .whereNotNull()
          .map((e) => SchemaInputAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      schemaArn: json['schemaArn'] as String,
      schemaName: json['schemaName'] as String,
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

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class ExceedsLimitException extends _s.GenericAwsException {
  ExceedsLimitException({String? type, String? message})
      : super(type: type, code: 'ExceedsLimitException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
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
