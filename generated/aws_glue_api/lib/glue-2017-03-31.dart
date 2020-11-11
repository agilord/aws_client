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
        rfc822FromJson,
        rfc822ToJson,
        iso8601FromJson,
        iso8601ToJson,
        unixTimestampFromJson,
        unixTimestampToJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'glue-2017-03-31.g.dart';

/// Defines the public endpoint for the AWS Glue service.
class Glue {
  final _s.JsonProtocol _protocol;
  Glue({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: 'glue',
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Creates one or more partitions in a batch operation.
  ///
  /// May throw [InvalidInputException].
  /// May throw [AlreadyExistsException].
  /// May throw [ResourceNumberLimitExceededException].
  /// May throw [InternalServiceException].
  /// May throw [EntityNotFoundException].
  /// May throw [OperationTimeoutException].
  /// May throw [GlueEncryptionException].
  ///
  /// Parameter [databaseName] :
  /// The name of the metadata database in which the partition is to be created.
  ///
  /// Parameter [partitionInputList] :
  /// A list of <code>PartitionInput</code> structures that define the
  /// partitions to be created.
  ///
  /// Parameter [tableName] :
  /// The name of the metadata table in which the partition is to be created.
  ///
  /// Parameter [catalogId] :
  /// The ID of the catalog in which the partition is to be created. Currently,
  /// this should be the AWS account ID.
  Future<BatchCreatePartitionResponse> batchCreatePartition({
    @_s.required String databaseName,
    @_s.required List<PartitionInput> partitionInputList,
    @_s.required String tableName,
    String catalogId,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'databaseName',
      databaseName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(partitionInputList, 'partitionInputList');
    ArgumentError.checkNotNull(tableName, 'tableName');
    _s.validateStringLength(
      'tableName',
      tableName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tableName',
      tableName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateStringPattern(
      'catalogId',
      catalogId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.BatchCreatePartition'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: BatchCreatePartitionRequest(
        databaseName: databaseName,
        partitionInputList: partitionInputList,
        tableName: tableName,
        catalogId: catalogId,
      ),
    );

    return BatchCreatePartitionResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a list of connection definitions from the Data Catalog.
  ///
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [connectionNameList] :
  /// A list of names of the connections to delete.
  ///
  /// Parameter [catalogId] :
  /// The ID of the Data Catalog in which the connections reside. If none is
  /// provided, the AWS account ID is used by default.
  Future<BatchDeleteConnectionResponse> batchDeleteConnection({
    @_s.required List<String> connectionNameList,
    String catalogId,
  }) async {
    ArgumentError.checkNotNull(connectionNameList, 'connectionNameList');
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateStringPattern(
      'catalogId',
      catalogId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.BatchDeleteConnection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: BatchDeleteConnectionRequest(
        connectionNameList: connectionNameList,
        catalogId: catalogId,
      ),
    );

    return BatchDeleteConnectionResponse.fromJson(jsonResponse.body);
  }

  /// Deletes one or more partitions in a batch operation.
  ///
  /// May throw [InvalidInputException].
  /// May throw [EntityNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [databaseName] :
  /// The name of the catalog database in which the table in question resides.
  ///
  /// Parameter [partitionsToDelete] :
  /// A list of <code>PartitionInput</code> structures that define the
  /// partitions to be deleted.
  ///
  /// Parameter [tableName] :
  /// The name of the table that contains the partitions to be deleted.
  ///
  /// Parameter [catalogId] :
  /// The ID of the Data Catalog where the partition to be deleted resides. If
  /// none is provided, the AWS account ID is used by default.
  Future<BatchDeletePartitionResponse> batchDeletePartition({
    @_s.required String databaseName,
    @_s.required List<PartitionValueList> partitionsToDelete,
    @_s.required String tableName,
    String catalogId,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'databaseName',
      databaseName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(partitionsToDelete, 'partitionsToDelete');
    ArgumentError.checkNotNull(tableName, 'tableName');
    _s.validateStringLength(
      'tableName',
      tableName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tableName',
      tableName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateStringPattern(
      'catalogId',
      catalogId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.BatchDeletePartition'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: BatchDeletePartitionRequest(
        databaseName: databaseName,
        partitionsToDelete: partitionsToDelete,
        tableName: tableName,
        catalogId: catalogId,
      ),
    );

    return BatchDeletePartitionResponse.fromJson(jsonResponse.body);
  }

  /// Deletes multiple tables at once.
  /// <note>
  /// After completing this operation, you no longer have access to the table
  /// versions and partitions that belong to the deleted table. AWS Glue deletes
  /// these "orphaned" resources asynchronously in a timely manner, at the
  /// discretion of the service.
  ///
  /// To ensure the immediate deletion of all related resources, before calling
  /// <code>BatchDeleteTable</code>, use <code>DeleteTableVersion</code> or
  /// <code>BatchDeleteTableVersion</code>, and <code>DeletePartition</code> or
  /// <code>BatchDeletePartition</code>, to delete any resources that belong to
  /// the table.
  /// </note>
  ///
  /// May throw [InvalidInputException].
  /// May throw [EntityNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [databaseName] :
  /// The name of the catalog database in which the tables to delete reside. For
  /// Hive compatibility, this name is entirely lowercase.
  ///
  /// Parameter [tablesToDelete] :
  /// A list of the table to delete.
  ///
  /// Parameter [catalogId] :
  /// The ID of the Data Catalog where the table resides. If none is provided,
  /// the AWS account ID is used by default.
  Future<BatchDeleteTableResponse> batchDeleteTable({
    @_s.required String databaseName,
    @_s.required List<String> tablesToDelete,
    String catalogId,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'databaseName',
      databaseName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tablesToDelete, 'tablesToDelete');
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateStringPattern(
      'catalogId',
      catalogId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.BatchDeleteTable'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: BatchDeleteTableRequest(
        databaseName: databaseName,
        tablesToDelete: tablesToDelete,
        catalogId: catalogId,
      ),
    );

    return BatchDeleteTableResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a specified batch of versions of a table.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [databaseName] :
  /// The database in the catalog in which the table resides. For Hive
  /// compatibility, this name is entirely lowercase.
  ///
  /// Parameter [tableName] :
  /// The name of the table. For Hive compatibility, this name is entirely
  /// lowercase.
  ///
  /// Parameter [versionIds] :
  /// A list of the IDs of versions to be deleted. A <code>VersionId</code> is a
  /// string representation of an integer. Each version is incremented by 1.
  ///
  /// Parameter [catalogId] :
  /// The ID of the Data Catalog where the tables reside. If none is provided,
  /// the AWS account ID is used by default.
  Future<BatchDeleteTableVersionResponse> batchDeleteTableVersion({
    @_s.required String databaseName,
    @_s.required String tableName,
    @_s.required List<String> versionIds,
    String catalogId,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'databaseName',
      databaseName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tableName, 'tableName');
    _s.validateStringLength(
      'tableName',
      tableName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tableName',
      tableName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(versionIds, 'versionIds');
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateStringPattern(
      'catalogId',
      catalogId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.BatchDeleteTableVersion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: BatchDeleteTableVersionRequest(
        databaseName: databaseName,
        tableName: tableName,
        versionIds: versionIds,
        catalogId: catalogId,
      ),
    );

    return BatchDeleteTableVersionResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of resource metadata for a given list of crawler names.
  /// After calling the <code>ListCrawlers</code> operation, you can call this
  /// operation to access the data to which you have been granted permissions.
  /// This operation supports all IAM permissions, including permission
  /// conditions that uses tags.
  ///
  /// May throw [InvalidInputException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [crawlerNames] :
  /// A list of crawler names, which might be the names returned from the
  /// <code>ListCrawlers</code> operation.
  Future<BatchGetCrawlersResponse> batchGetCrawlers({
    @_s.required List<String> crawlerNames,
  }) async {
    ArgumentError.checkNotNull(crawlerNames, 'crawlerNames');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.BatchGetCrawlers'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: BatchGetCrawlersRequest(
        crawlerNames: crawlerNames,
      ),
    );

    return BatchGetCrawlersResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of resource metadata for a given list of development
  /// endpoint names. After calling the <code>ListDevEndpoints</code> operation,
  /// you can call this operation to access the data to which you have been
  /// granted permissions. This operation supports all IAM permissions,
  /// including permission conditions that uses tags.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [devEndpointNames] :
  /// The list of <code>DevEndpoint</code> names, which might be the names
  /// returned from the <code>ListDevEndpoint</code> operation.
  Future<BatchGetDevEndpointsResponse> batchGetDevEndpoints({
    @_s.required List<String> devEndpointNames,
  }) async {
    ArgumentError.checkNotNull(devEndpointNames, 'devEndpointNames');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.BatchGetDevEndpoints'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: BatchGetDevEndpointsRequest(
        devEndpointNames: devEndpointNames,
      ),
    );

    return BatchGetDevEndpointsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of resource metadata for a given list of job names. After
  /// calling the <code>ListJobs</code> operation, you can call this operation
  /// to access the data to which you have been granted permissions. This
  /// operation supports all IAM permissions, including permission conditions
  /// that uses tags.
  ///
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [jobNames] :
  /// A list of job names, which might be the names returned from the
  /// <code>ListJobs</code> operation.
  Future<BatchGetJobsResponse> batchGetJobs({
    @_s.required List<String> jobNames,
  }) async {
    ArgumentError.checkNotNull(jobNames, 'jobNames');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.BatchGetJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: BatchGetJobsRequest(
        jobNames: jobNames,
      ),
    );

    return BatchGetJobsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves partitions in a batch request.
  ///
  /// May throw [InvalidInputException].
  /// May throw [EntityNotFoundException].
  /// May throw [OperationTimeoutException].
  /// May throw [InternalServiceException].
  /// May throw [GlueEncryptionException].
  ///
  /// Parameter [databaseName] :
  /// The name of the catalog database where the partitions reside.
  ///
  /// Parameter [partitionsToGet] :
  /// A list of partition values identifying the partitions to retrieve.
  ///
  /// Parameter [tableName] :
  /// The name of the partitions' table.
  ///
  /// Parameter [catalogId] :
  /// The ID of the Data Catalog where the partitions in question reside. If
  /// none is supplied, the AWS account ID is used by default.
  Future<BatchGetPartitionResponse> batchGetPartition({
    @_s.required String databaseName,
    @_s.required List<PartitionValueList> partitionsToGet,
    @_s.required String tableName,
    String catalogId,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'databaseName',
      databaseName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(partitionsToGet, 'partitionsToGet');
    ArgumentError.checkNotNull(tableName, 'tableName');
    _s.validateStringLength(
      'tableName',
      tableName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tableName',
      tableName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateStringPattern(
      'catalogId',
      catalogId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.BatchGetPartition'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: BatchGetPartitionRequest(
        databaseName: databaseName,
        partitionsToGet: partitionsToGet,
        tableName: tableName,
        catalogId: catalogId,
      ),
    );

    return BatchGetPartitionResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of resource metadata for a given list of trigger names.
  /// After calling the <code>ListTriggers</code> operation, you can call this
  /// operation to access the data to which you have been granted permissions.
  /// This operation supports all IAM permissions, including permission
  /// conditions that uses tags.
  ///
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [triggerNames] :
  /// A list of trigger names, which may be the names returned from the
  /// <code>ListTriggers</code> operation.
  Future<BatchGetTriggersResponse> batchGetTriggers({
    @_s.required List<String> triggerNames,
  }) async {
    ArgumentError.checkNotNull(triggerNames, 'triggerNames');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.BatchGetTriggers'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: BatchGetTriggersRequest(
        triggerNames: triggerNames,
      ),
    );

    return BatchGetTriggersResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of resource metadata for a given list of workflow names.
  /// After calling the <code>ListWorkflows</code> operation, you can call this
  /// operation to access the data to which you have been granted permissions.
  /// This operation supports all IAM permissions, including permission
  /// conditions that uses tags.
  ///
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [names] :
  /// A list of workflow names, which may be the names returned from the
  /// <code>ListWorkflows</code> operation.
  ///
  /// Parameter [includeGraph] :
  /// Specifies whether to include a graph when returning the workflow resource
  /// metadata.
  Future<BatchGetWorkflowsResponse> batchGetWorkflows({
    @_s.required List<String> names,
    bool includeGraph,
  }) async {
    ArgumentError.checkNotNull(names, 'names');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.BatchGetWorkflows'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: BatchGetWorkflowsRequest(
        names: names,
        includeGraph: includeGraph,
      ),
    );

    return BatchGetWorkflowsResponse.fromJson(jsonResponse.body);
  }

  /// Stops one or more job runs for a specified job definition.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [jobName] :
  /// The name of the job definition for which to stop job runs.
  ///
  /// Parameter [jobRunIds] :
  /// A list of the <code>JobRunIds</code> that should be stopped for that job
  /// definition.
  Future<BatchStopJobRunResponse> batchStopJobRun({
    @_s.required String jobName,
    @_s.required List<String> jobRunIds,
  }) async {
    ArgumentError.checkNotNull(jobName, 'jobName');
    _s.validateStringLength(
      'jobName',
      jobName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'jobName',
      jobName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(jobRunIds, 'jobRunIds');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.BatchStopJobRun'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: BatchStopJobRunRequest(
        jobName: jobName,
        jobRunIds: jobRunIds,
      ),
    );

    return BatchStopJobRunResponse.fromJson(jsonResponse.body);
  }

  /// Cancels (stops) a task run. Machine learning task runs are asynchronous
  /// tasks that AWS Glue runs on your behalf as part of various machine
  /// learning workflows. You can cancel a machine learning task run at any time
  /// by calling <code>CancelMLTaskRun</code> with a task run's parent
  /// transform's <code>TransformID</code> and the task run's
  /// <code>TaskRunId</code>.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [OperationTimeoutException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [taskRunId] :
  /// A unique identifier for the task run.
  ///
  /// Parameter [transformId] :
  /// The unique identifier of the machine learning transform.
  Future<CancelMLTaskRunResponse> cancelMLTaskRun({
    @_s.required String taskRunId,
    @_s.required String transformId,
  }) async {
    ArgumentError.checkNotNull(taskRunId, 'taskRunId');
    _s.validateStringLength(
      'taskRunId',
      taskRunId,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'taskRunId',
      taskRunId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(transformId, 'transformId');
    _s.validateStringLength(
      'transformId',
      transformId,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'transformId',
      transformId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.CancelMLTaskRun'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: CancelMLTaskRunRequest(
        taskRunId: taskRunId,
        transformId: transformId,
      ),
    );

    return CancelMLTaskRunResponse.fromJson(jsonResponse.body);
  }

  /// Creates a classifier in the user's account. This can be a
  /// <code>GrokClassifier</code>, an <code>XMLClassifier</code>, a
  /// <code>JsonClassifier</code>, or a <code>CsvClassifier</code>, depending on
  /// which field of the request is present.
  ///
  /// May throw [AlreadyExistsException].
  /// May throw [InvalidInputException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [csvClassifier] :
  /// A <code>CsvClassifier</code> object specifying the classifier to create.
  ///
  /// Parameter [grokClassifier] :
  /// A <code>GrokClassifier</code> object specifying the classifier to create.
  ///
  /// Parameter [jsonClassifier] :
  /// A <code>JsonClassifier</code> object specifying the classifier to create.
  ///
  /// Parameter [xMLClassifier] :
  /// An <code>XMLClassifier</code> object specifying the classifier to create.
  Future<void> createClassifier({
    CreateCsvClassifierRequest csvClassifier,
    CreateGrokClassifierRequest grokClassifier,
    CreateJsonClassifierRequest jsonClassifier,
    CreateXMLClassifierRequest xMLClassifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.CreateClassifier'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: CreateClassifierRequest(
        csvClassifier: csvClassifier,
        grokClassifier: grokClassifier,
        jsonClassifier: jsonClassifier,
        xMLClassifier: xMLClassifier,
      ),
    );

    return CreateClassifierResponse.fromJson(jsonResponse.body);
  }

  /// Creates a connection definition in the Data Catalog.
  ///
  /// May throw [AlreadyExistsException].
  /// May throw [InvalidInputException].
  /// May throw [OperationTimeoutException].
  /// May throw [ResourceNumberLimitExceededException].
  /// May throw [GlueEncryptionException].
  ///
  /// Parameter [connectionInput] :
  /// A <code>ConnectionInput</code> object defining the connection to create.
  ///
  /// Parameter [catalogId] :
  /// The ID of the Data Catalog in which to create the connection. If none is
  /// provided, the AWS account ID is used by default.
  Future<void> createConnection({
    @_s.required ConnectionInput connectionInput,
    String catalogId,
  }) async {
    ArgumentError.checkNotNull(connectionInput, 'connectionInput');
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateStringPattern(
      'catalogId',
      catalogId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.CreateConnection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: CreateConnectionRequest(
        connectionInput: connectionInput,
        catalogId: catalogId,
      ),
    );

    return CreateConnectionResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new crawler with specified targets, role, configuration, and
  /// optional schedule. At least one crawl target must be specified, in the
  /// <code>s3Targets</code> field, the <code>jdbcTargets</code> field, or the
  /// <code>DynamoDBTargets</code> field.
  ///
  /// May throw [InvalidInputException].
  /// May throw [AlreadyExistsException].
  /// May throw [OperationTimeoutException].
  /// May throw [ResourceNumberLimitExceededException].
  ///
  /// Parameter [name] :
  /// Name of the new crawler.
  ///
  /// Parameter [role] :
  /// The IAM role or Amazon Resource Name (ARN) of an IAM role used by the new
  /// crawler to access customer resources.
  ///
  /// Parameter [targets] :
  /// A list of collection of targets to crawl.
  ///
  /// Parameter [classifiers] :
  /// A list of custom classifiers that the user has registered. By default, all
  /// built-in classifiers are included in a crawl, but these custom classifiers
  /// always override the default classifiers for a given classification.
  ///
  /// Parameter [configuration] :
  /// The crawler configuration information. This versioned JSON string allows
  /// users to specify aspects of a crawler's behavior. For more information,
  /// see <a
  /// href="http://docs.aws.amazon.com/glue/latest/dg/crawler-configuration.html">Configuring
  /// a Crawler</a>.
  ///
  /// Parameter [crawlerSecurityConfiguration] :
  /// The name of the <code>SecurityConfiguration</code> structure to be used by
  /// this crawler.
  ///
  /// Parameter [databaseName] :
  /// The AWS Glue database where results are written, such as:
  /// <code>arn:aws:daylight:us-east-1::database/sometable/*</code>.
  ///
  /// Parameter [description] :
  /// A description of the new crawler.
  ///
  /// Parameter [schedule] :
  /// A <code>cron</code> expression used to specify the schedule. For more
  /// information, see <a
  /// href="http://docs.aws.amazon.com/glue/latest/dg/monitor-data-warehouse-schedule.html">Time-Based
  /// Schedules for Jobs and Crawlers</a>. For example, to run something every
  /// day at 12:15 UTC, specify <code>cron(15 12 * * ? *)</code>.
  ///
  /// Parameter [schemaChangePolicy] :
  /// The policy for the crawler's update and deletion behavior.
  ///
  /// Parameter [tablePrefix] :
  /// The table prefix used for catalog tables that are created.
  ///
  /// Parameter [tags] :
  /// The tags to use with this crawler request. You can use tags to limit
  /// access to the crawler. For more information, see <a
  /// href="http://docs.aws.amazon.com/glue/latest/dg/monitor-tags.html">AWS
  /// Tags in AWS Glue</a>.
  Future<void> createCrawler({
    @_s.required String name,
    @_s.required String role,
    @_s.required CrawlerTargets targets,
    List<String> classifiers,
    String configuration,
    String crawlerSecurityConfiguration,
    String databaseName,
    String description,
    String schedule,
    SchemaChangePolicy schemaChangePolicy,
    String tablePrefix,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(role, 'role');
    ArgumentError.checkNotNull(targets, 'targets');
    _s.validateStringLength(
      'crawlerSecurityConfiguration',
      crawlerSecurityConfiguration,
      0,
      128,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      2048,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringLength(
      'tablePrefix',
      tablePrefix,
      0,
      128,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.CreateCrawler'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: CreateCrawlerRequest(
        name: name,
        role: role,
        targets: targets,
        classifiers: classifiers,
        configuration: configuration,
        crawlerSecurityConfiguration: crawlerSecurityConfiguration,
        databaseName: databaseName,
        description: description,
        schedule: schedule,
        schemaChangePolicy: schemaChangePolicy,
        tablePrefix: tablePrefix,
        tags: tags,
      ),
    );

    return CreateCrawlerResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new database in a Data Catalog.
  ///
  /// May throw [InvalidInputException].
  /// May throw [AlreadyExistsException].
  /// May throw [ResourceNumberLimitExceededException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [GlueEncryptionException].
  ///
  /// Parameter [databaseInput] :
  /// The metadata for the database.
  ///
  /// Parameter [catalogId] :
  /// The ID of the Data Catalog in which to create the database. If none is
  /// provided, the AWS account ID is used by default.
  Future<void> createDatabase({
    @_s.required DatabaseInput databaseInput,
    String catalogId,
  }) async {
    ArgumentError.checkNotNull(databaseInput, 'databaseInput');
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateStringPattern(
      'catalogId',
      catalogId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.CreateDatabase'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: CreateDatabaseRequest(
        databaseInput: databaseInput,
        catalogId: catalogId,
      ),
    );

    return CreateDatabaseResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new development endpoint.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AlreadyExistsException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [InvalidInputException].
  /// May throw [ValidationException].
  /// May throw [ResourceNumberLimitExceededException].
  ///
  /// Parameter [endpointName] :
  /// The name to be assigned to the new <code>DevEndpoint</code>.
  ///
  /// Parameter [roleArn] :
  /// The IAM role for the <code>DevEndpoint</code>.
  ///
  /// Parameter [arguments] :
  /// A map of arguments used to configure the <code>DevEndpoint</code>.
  ///
  /// Parameter [extraJarsS3Path] :
  /// The path to one or more Java <code>.jar</code> files in an S3 bucket that
  /// should be loaded in your <code>DevEndpoint</code>.
  ///
  /// Parameter [extraPythonLibsS3Path] :
  /// The paths to one or more Python libraries in an Amazon S3 bucket that
  /// should be loaded in your <code>DevEndpoint</code>. Multiple values must be
  /// complete paths separated by a comma.
  /// <note>
  /// You can only use pure Python libraries with a <code>DevEndpoint</code>.
  /// Libraries that rely on C extensions, such as the <a
  /// href="http://pandas.pydata.org/">pandas</a> Python data analysis library,
  /// are not yet supported.
  /// </note>
  ///
  /// Parameter [glueVersion] :
  /// Glue version determines the versions of Apache Spark and Python that AWS
  /// Glue supports. The Python version indicates the version supported for
  /// running your ETL scripts on development endpoints.
  ///
  /// For more information about the available AWS Glue versions and
  /// corresponding Spark and Python versions, see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/add-job.html">Glue
  /// version</a> in the developer guide.
  ///
  /// Development endpoints that are created without specifying a Glue version
  /// default to Glue 0.9.
  ///
  /// You can specify a version of Python support for development endpoints by
  /// using the <code>Arguments</code> parameter in the
  /// <code>CreateDevEndpoint</code> or <code>UpdateDevEndpoint</code> APIs. If
  /// no arguments are provided, the version defaults to Python 2.
  ///
  /// Parameter [numberOfNodes] :
  /// The number of AWS Glue Data Processing Units (DPUs) to allocate to this
  /// <code>DevEndpoint</code>.
  ///
  /// Parameter [numberOfWorkers] :
  /// The number of workers of a defined <code>workerType</code> that are
  /// allocated to the development endpoint.
  ///
  /// The maximum number of workers you can define are 299 for
  /// <code>G.1X</code>, and 149 for <code>G.2X</code>.
  ///
  /// Parameter [publicKey] :
  /// The public key to be used by this <code>DevEndpoint</code> for
  /// authentication. This attribute is provided for backward compatibility
  /// because the recommended attribute to use is public keys.
  ///
  /// Parameter [publicKeys] :
  /// A list of public keys to be used by the development endpoints for
  /// authentication. The use of this attribute is preferred over a single
  /// public key because the public keys allow you to have a different private
  /// key per client.
  /// <note>
  /// If you previously created an endpoint with a public key, you must remove
  /// that key to be able to set a list of public keys. Call the
  /// <code>UpdateDevEndpoint</code> API with the public key content in the
  /// <code>deletePublicKeys</code> attribute, and the list of new keys in the
  /// <code>addPublicKeys</code> attribute.
  /// </note>
  ///
  /// Parameter [securityConfiguration] :
  /// The name of the <code>SecurityConfiguration</code> structure to be used
  /// with this <code>DevEndpoint</code>.
  ///
  /// Parameter [securityGroupIds] :
  /// Security group IDs for the security groups to be used by the new
  /// <code>DevEndpoint</code>.
  ///
  /// Parameter [subnetId] :
  /// The subnet ID for the new <code>DevEndpoint</code> to use.
  ///
  /// Parameter [tags] :
  /// The tags to use with this DevEndpoint. You may use tags to limit access to
  /// the DevEndpoint. For more information about tags in AWS Glue, see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/monitor-tags.html">AWS
  /// Tags in AWS Glue</a> in the developer guide.
  ///
  /// Parameter [workerType] :
  /// The type of predefined worker that is allocated to the development
  /// endpoint. Accepts a value of Standard, G.1X, or G.2X.
  ///
  /// <ul>
  /// <li>
  /// For the <code>Standard</code> worker type, each worker provides 4 vCPU, 16
  /// GB of memory and a 50GB disk, and 2 executors per worker.
  /// </li>
  /// <li>
  /// For the <code>G.1X</code> worker type, each worker maps to 1 DPU (4 vCPU,
  /// 16 GB of memory, 64 GB disk), and provides 1 executor per worker. We
  /// recommend this worker type for memory-intensive jobs.
  /// </li>
  /// <li>
  /// For the <code>G.2X</code> worker type, each worker maps to 2 DPU (8 vCPU,
  /// 32 GB of memory, 128 GB disk), and provides 1 executor per worker. We
  /// recommend this worker type for memory-intensive jobs.
  /// </li>
  /// </ul>
  /// Known issue: when a development endpoint is created with the
  /// <code>G.2X</code> <code>WorkerType</code> configuration, the Spark drivers
  /// for the development endpoint will run on 4 vCPU, 16 GB of memory, and a 64
  /// GB disk.
  Future<CreateDevEndpointResponse> createDevEndpoint({
    @_s.required String endpointName,
    @_s.required String roleArn,
    Map<String, String> arguments,
    String extraJarsS3Path,
    String extraPythonLibsS3Path,
    String glueVersion,
    int numberOfNodes,
    int numberOfWorkers,
    String publicKey,
    List<String> publicKeys,
    String securityConfiguration,
    List<String> securityGroupIds,
    String subnetId,
    Map<String, String> tags,
    WorkerType workerType,
  }) async {
    ArgumentError.checkNotNull(endpointName, 'endpointName');
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringPattern(
      'roleArn',
      roleArn,
      r'''arn:aws:iam::\d{12}:role/.*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'glueVersion',
      glueVersion,
      1,
      255,
    );
    _s.validateStringPattern(
      'glueVersion',
      glueVersion,
      r'''^\w+\.\w+$''',
    );
    _s.validateStringLength(
      'securityConfiguration',
      securityConfiguration,
      1,
      255,
    );
    _s.validateStringPattern(
      'securityConfiguration',
      securityConfiguration,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.CreateDevEndpoint'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: CreateDevEndpointRequest(
        endpointName: endpointName,
        roleArn: roleArn,
        arguments: arguments,
        extraJarsS3Path: extraJarsS3Path,
        extraPythonLibsS3Path: extraPythonLibsS3Path,
        glueVersion: glueVersion,
        numberOfNodes: numberOfNodes,
        numberOfWorkers: numberOfWorkers,
        publicKey: publicKey,
        publicKeys: publicKeys,
        securityConfiguration: securityConfiguration,
        securityGroupIds: securityGroupIds,
        subnetId: subnetId,
        tags: tags,
        workerType: workerType,
      ),
    );

    return CreateDevEndpointResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new job definition.
  ///
  /// May throw [InvalidInputException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [AlreadyExistsException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [ResourceNumberLimitExceededException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [command] :
  /// The <code>JobCommand</code> that executes this job.
  ///
  /// Parameter [name] :
  /// The name you assign to this job definition. It must be unique in your
  /// account.
  ///
  /// Parameter [role] :
  /// The name or Amazon Resource Name (ARN) of the IAM role associated with
  /// this job.
  ///
  /// Parameter [allocatedCapacity] :
  /// This parameter is deprecated. Use <code>MaxCapacity</code> instead.
  ///
  /// The number of AWS Glue data processing units (DPUs) to allocate to this
  /// Job. You can allocate from 2 to 100 DPUs; the default is 10. A DPU is a
  /// relative measure of processing power that consists of 4 vCPUs of compute
  /// capacity and 16 GB of memory. For more information, see the <a
  /// href="https://aws.amazon.com/glue/pricing/">AWS Glue pricing page</a>.
  ///
  /// Parameter [connections] :
  /// The connections used for this job.
  ///
  /// Parameter [defaultArguments] :
  /// The default arguments for this job.
  ///
  /// You can specify arguments here that your own job-execution script
  /// consumes, as well as arguments that AWS Glue itself consumes.
  ///
  /// For information about how to specify and consume your own Job arguments,
  /// see the <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-python-calling.html">Calling
  /// AWS Glue APIs in Python</a> topic in the developer guide.
  ///
  /// For information about the key-value pairs that AWS Glue consumes to set up
  /// your job, see the <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-etl-glue-arguments.html">Special
  /// Parameters Used by AWS Glue</a> topic in the developer guide.
  ///
  /// Parameter [description] :
  /// Description of the job being defined.
  ///
  /// Parameter [executionProperty] :
  /// An <code>ExecutionProperty</code> specifying the maximum number of
  /// concurrent runs allowed for this job.
  ///
  /// Parameter [glueVersion] :
  /// Glue version determines the versions of Apache Spark and Python that AWS
  /// Glue supports. The Python version indicates the version supported for jobs
  /// of type Spark.
  ///
  /// For more information about the available AWS Glue versions and
  /// corresponding Spark and Python versions, see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/add-job.html">Glue
  /// version</a> in the developer guide.
  ///
  /// Jobs that are created without specifying a Glue version default to Glue
  /// 0.9.
  ///
  /// Parameter [logUri] :
  /// This field is reserved for future use.
  ///
  /// Parameter [maxCapacity] :
  /// The number of AWS Glue data processing units (DPUs) that can be allocated
  /// when this job runs. A DPU is a relative measure of processing power that
  /// consists of 4 vCPUs of compute capacity and 16 GB of memory. For more
  /// information, see the <a href="https://aws.amazon.com/glue/pricing/">AWS
  /// Glue pricing page</a>.
  ///
  /// Do not set <code>Max Capacity</code> if using <code>WorkerType</code> and
  /// <code>NumberOfWorkers</code>.
  ///
  /// The value that can be allocated for <code>MaxCapacity</code> depends on
  /// whether you are running a Python shell job or an Apache Spark ETL job:
  ///
  /// <ul>
  /// <li>
  /// When you specify a Python shell job
  /// (<code>JobCommand.Name</code>="pythonshell"), you can allocate either
  /// 0.0625 or 1 DPU. The default is 0.0625 DPU.
  /// </li>
  /// <li>
  /// When you specify an Apache Spark ETL job
  /// (<code>JobCommand.Name</code>="glueetl"), you can allocate from 2 to 100
  /// DPUs. The default is 10 DPUs. This job type cannot have a fractional DPU
  /// allocation.
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxRetries] :
  /// The maximum number of times to retry this job if it fails.
  ///
  /// Parameter [nonOverridableArguments] :
  /// Non-overridable arguments for this job, specified as name-value pairs.
  ///
  /// Parameter [notificationProperty] :
  /// Specifies configuration properties of a job notification.
  ///
  /// Parameter [numberOfWorkers] :
  /// The number of workers of a defined <code>workerType</code> that are
  /// allocated when a job runs.
  ///
  /// The maximum number of workers you can define are 299 for
  /// <code>G.1X</code>, and 149 for <code>G.2X</code>.
  ///
  /// Parameter [securityConfiguration] :
  /// The name of the <code>SecurityConfiguration</code> structure to be used
  /// with this job.
  ///
  /// Parameter [tags] :
  /// The tags to use with this job. You may use tags to limit access to the
  /// job. For more information about tags in AWS Glue, see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/monitor-tags.html">AWS
  /// Tags in AWS Glue</a> in the developer guide.
  ///
  /// Parameter [timeout] :
  /// The job timeout in minutes. This is the maximum time that a job run can
  /// consume resources before it is terminated and enters <code>TIMEOUT</code>
  /// status. The default is 2,880 minutes (48 hours).
  ///
  /// Parameter [workerType] :
  /// The type of predefined worker that is allocated when a job runs. Accepts a
  /// value of Standard, G.1X, or G.2X.
  ///
  /// <ul>
  /// <li>
  /// For the <code>Standard</code> worker type, each worker provides 4 vCPU, 16
  /// GB of memory and a 50GB disk, and 2 executors per worker.
  /// </li>
  /// <li>
  /// For the <code>G.1X</code> worker type, each worker maps to 1 DPU (4 vCPU,
  /// 16 GB of memory, 64 GB disk), and provides 1 executor per worker. We
  /// recommend this worker type for memory-intensive jobs.
  /// </li>
  /// <li>
  /// For the <code>G.2X</code> worker type, each worker maps to 2 DPU (8 vCPU,
  /// 32 GB of memory, 128 GB disk), and provides 1 executor per worker. We
  /// recommend this worker type for memory-intensive jobs.
  /// </li>
  /// </ul>
  Future<CreateJobResponse> createJob({
    @_s.required JobCommand command,
    @_s.required String name,
    @_s.required String role,
    int allocatedCapacity,
    ConnectionsList connections,
    Map<String, String> defaultArguments,
    String description,
    ExecutionProperty executionProperty,
    String glueVersion,
    String logUri,
    double maxCapacity,
    int maxRetries,
    Map<String, String> nonOverridableArguments,
    NotificationProperty notificationProperty,
    int numberOfWorkers,
    String securityConfiguration,
    Map<String, String> tags,
    int timeout,
    WorkerType workerType,
  }) async {
    ArgumentError.checkNotNull(command, 'command');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(role, 'role');
    _s.validateStringLength(
      'description',
      description,
      0,
      2048,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringLength(
      'glueVersion',
      glueVersion,
      1,
      255,
    );
    _s.validateStringPattern(
      'glueVersion',
      glueVersion,
      r'''^\w+\.\w+$''',
    );
    _s.validateStringLength(
      'securityConfiguration',
      securityConfiguration,
      1,
      255,
    );
    _s.validateStringPattern(
      'securityConfiguration',
      securityConfiguration,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    _s.validateNumRange(
      'timeout',
      timeout,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.CreateJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: CreateJobRequest(
        command: command,
        name: name,
        role: role,
        allocatedCapacity: allocatedCapacity,
        connections: connections,
        defaultArguments: defaultArguments,
        description: description,
        executionProperty: executionProperty,
        glueVersion: glueVersion,
        logUri: logUri,
        maxCapacity: maxCapacity,
        maxRetries: maxRetries,
        nonOverridableArguments: nonOverridableArguments,
        notificationProperty: notificationProperty,
        numberOfWorkers: numberOfWorkers,
        securityConfiguration: securityConfiguration,
        tags: tags,
        timeout: timeout,
        workerType: workerType,
      ),
    );

    return CreateJobResponse.fromJson(jsonResponse.body);
  }

  /// Creates an AWS Glue machine learning transform. This operation creates the
  /// transform and all the necessary parameters to train it.
  ///
  /// Call this operation as the first step in the process of using a machine
  /// learning transform (such as the <code>FindMatches</code> transform) for
  /// deduplicating data. You can provide an optional <code>Description</code>,
  /// in addition to the parameters that you want to use for your algorithm.
  ///
  /// You must also specify certain parameters for the tasks that AWS Glue runs
  /// on your behalf as part of learning from your data and creating a
  /// high-quality machine learning transform. These parameters include
  /// <code>Role</code>, and optionally, <code>AllocatedCapacity</code>,
  /// <code>Timeout</code>, and <code>MaxRetries</code>. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-api-jobs-job.html">Jobs</a>.
  ///
  /// May throw [AlreadyExistsException].
  /// May throw [InvalidInputException].
  /// May throw [OperationTimeoutException].
  /// May throw [InternalServiceException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNumberLimitExceededException].
  /// May throw [IdempotentParameterMismatchException].
  ///
  /// Parameter [inputRecordTables] :
  /// A list of AWS Glue table definitions used by the transform.
  ///
  /// Parameter [name] :
  /// The unique name that you give the transform when you create it.
  ///
  /// Parameter [parameters] :
  /// The algorithmic parameters that are specific to the transform type used.
  /// Conditionally dependent on the transform type.
  ///
  /// Parameter [role] :
  /// The name or Amazon Resource Name (ARN) of the IAM role with the required
  /// permissions. The required permissions include both AWS Glue service role
  /// permissions to AWS Glue resources, and Amazon S3 permissions required by
  /// the transform.
  ///
  /// <ul>
  /// <li>
  /// This role needs AWS Glue service role permissions to allow access to
  /// resources in AWS Glue. See <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/attach-policy-iam-user.html">Attach
  /// a Policy to IAM Users That Access AWS Glue</a>.
  /// </li>
  /// <li>
  /// This role needs permission to your Amazon Simple Storage Service (Amazon
  /// S3) sources, targets, temporary directory, scripts, and any libraries used
  /// by the task run for this transform.
  /// </li>
  /// </ul>
  ///
  /// Parameter [description] :
  /// A description of the machine learning transform that is being defined. The
  /// default is an empty string.
  ///
  /// Parameter [glueVersion] :
  /// This value determines which version of AWS Glue this machine learning
  /// transform is compatible with. Glue 1.0 is recommended for most customers.
  /// If the value is not set, the Glue compatibility defaults to Glue 0.9. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/release-notes.html#release-notes-versions">AWS
  /// Glue Versions</a> in the developer guide.
  ///
  /// Parameter [maxCapacity] :
  /// The number of AWS Glue data processing units (DPUs) that are allocated to
  /// task runs for this transform. You can allocate from 2 to 100 DPUs; the
  /// default is 10. A DPU is a relative measure of processing power that
  /// consists of 4 vCPUs of compute capacity and 16 GB of memory. For more
  /// information, see the <a href="https://aws.amazon.com/glue/pricing/">AWS
  /// Glue pricing page</a>.
  ///
  /// <code>MaxCapacity</code> is a mutually exclusive option with
  /// <code>NumberOfWorkers</code> and <code>WorkerType</code>.
  ///
  /// <ul>
  /// <li>
  /// If either <code>NumberOfWorkers</code> or <code>WorkerType</code> is set,
  /// then <code>MaxCapacity</code> cannot be set.
  /// </li>
  /// <li>
  /// If <code>MaxCapacity</code> is set then neither
  /// <code>NumberOfWorkers</code> or <code>WorkerType</code> can be set.
  /// </li>
  /// <li>
  /// If <code>WorkerType</code> is set, then <code>NumberOfWorkers</code> is
  /// required (and vice versa).
  /// </li>
  /// <li>
  /// <code>MaxCapacity</code> and <code>NumberOfWorkers</code> must both be at
  /// least 1.
  /// </li>
  /// </ul>
  /// When the <code>WorkerType</code> field is set to a value other than
  /// <code>Standard</code>, the <code>MaxCapacity</code> field is set
  /// automatically and becomes read-only.
  ///
  /// When the <code>WorkerType</code> field is set to a value other than
  /// <code>Standard</code>, the <code>MaxCapacity</code> field is set
  /// automatically and becomes read-only.
  ///
  /// Parameter [maxRetries] :
  /// The maximum number of times to retry a task for this transform after a
  /// task run fails.
  ///
  /// Parameter [numberOfWorkers] :
  /// The number of workers of a defined <code>workerType</code> that are
  /// allocated when this task runs.
  ///
  /// If <code>WorkerType</code> is set, then <code>NumberOfWorkers</code> is
  /// required (and vice versa).
  ///
  /// Parameter [tags] :
  /// The tags to use with this machine learning transform. You may use tags to
  /// limit access to the machine learning transform. For more information about
  /// tags in AWS Glue, see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/monitor-tags.html">AWS
  /// Tags in AWS Glue</a> in the developer guide.
  ///
  /// Parameter [timeout] :
  /// The timeout of the task run for this transform in minutes. This is the
  /// maximum time that a task run for this transform can consume resources
  /// before it is terminated and enters <code>TIMEOUT</code> status. The
  /// default is 2,880 minutes (48 hours).
  ///
  /// Parameter [workerType] :
  /// The type of predefined worker that is allocated when this task runs.
  /// Accepts a value of Standard, G.1X, or G.2X.
  ///
  /// <ul>
  /// <li>
  /// For the <code>Standard</code> worker type, each worker provides 4 vCPU, 16
  /// GB of memory and a 50GB disk, and 2 executors per worker.
  /// </li>
  /// <li>
  /// For the <code>G.1X</code> worker type, each worker provides 4 vCPU, 16 GB
  /// of memory and a 64GB disk, and 1 executor per worker.
  /// </li>
  /// <li>
  /// For the <code>G.2X</code> worker type, each worker provides 8 vCPU, 32 GB
  /// of memory and a 128GB disk, and 1 executor per worker.
  /// </li>
  /// </ul>
  /// <code>MaxCapacity</code> is a mutually exclusive option with
  /// <code>NumberOfWorkers</code> and <code>WorkerType</code>.
  ///
  /// <ul>
  /// <li>
  /// If either <code>NumberOfWorkers</code> or <code>WorkerType</code> is set,
  /// then <code>MaxCapacity</code> cannot be set.
  /// </li>
  /// <li>
  /// If <code>MaxCapacity</code> is set then neither
  /// <code>NumberOfWorkers</code> or <code>WorkerType</code> can be set.
  /// </li>
  /// <li>
  /// If <code>WorkerType</code> is set, then <code>NumberOfWorkers</code> is
  /// required (and vice versa).
  /// </li>
  /// <li>
  /// <code>MaxCapacity</code> and <code>NumberOfWorkers</code> must both be at
  /// least 1.
  /// </li>
  /// </ul>
  Future<CreateMLTransformResponse> createMLTransform({
    @_s.required List<GlueTable> inputRecordTables,
    @_s.required String name,
    @_s.required TransformParameters parameters,
    @_s.required String role,
    String description,
    String glueVersion,
    double maxCapacity,
    int maxRetries,
    int numberOfWorkers,
    Map<String, String> tags,
    int timeout,
    WorkerType workerType,
  }) async {
    ArgumentError.checkNotNull(inputRecordTables, 'inputRecordTables');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(parameters, 'parameters');
    ArgumentError.checkNotNull(role, 'role');
    _s.validateStringLength(
      'description',
      description,
      0,
      2048,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringLength(
      'glueVersion',
      glueVersion,
      1,
      255,
    );
    _s.validateStringPattern(
      'glueVersion',
      glueVersion,
      r'''^\w+\.\w+$''',
    );
    _s.validateNumRange(
      'timeout',
      timeout,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.CreateMLTransform'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: CreateMLTransformRequest(
        inputRecordTables: inputRecordTables,
        name: name,
        parameters: parameters,
        role: role,
        description: description,
        glueVersion: glueVersion,
        maxCapacity: maxCapacity,
        maxRetries: maxRetries,
        numberOfWorkers: numberOfWorkers,
        tags: tags,
        timeout: timeout,
        workerType: workerType,
      ),
    );

    return CreateMLTransformResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new partition.
  ///
  /// May throw [InvalidInputException].
  /// May throw [AlreadyExistsException].
  /// May throw [ResourceNumberLimitExceededException].
  /// May throw [InternalServiceException].
  /// May throw [EntityNotFoundException].
  /// May throw [OperationTimeoutException].
  /// May throw [GlueEncryptionException].
  ///
  /// Parameter [databaseName] :
  /// The name of the metadata database in which the partition is to be created.
  ///
  /// Parameter [partitionInput] :
  /// A <code>PartitionInput</code> structure defining the partition to be
  /// created.
  ///
  /// Parameter [tableName] :
  /// The name of the metadata table in which the partition is to be created.
  ///
  /// Parameter [catalogId] :
  /// The AWS account ID of the catalog in which the partition is to be created.
  Future<void> createPartition({
    @_s.required String databaseName,
    @_s.required PartitionInput partitionInput,
    @_s.required String tableName,
    String catalogId,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'databaseName',
      databaseName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(partitionInput, 'partitionInput');
    ArgumentError.checkNotNull(tableName, 'tableName');
    _s.validateStringLength(
      'tableName',
      tableName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tableName',
      tableName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateStringPattern(
      'catalogId',
      catalogId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.CreatePartition'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: CreatePartitionRequest(
        databaseName: databaseName,
        partitionInput: partitionInput,
        tableName: tableName,
        catalogId: catalogId,
      ),
    );

    return CreatePartitionResponse.fromJson(jsonResponse.body);
  }

  /// Transforms a directed acyclic graph (DAG) into code.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [dagEdges] :
  /// A list of the edges in the DAG.
  ///
  /// Parameter [dagNodes] :
  /// A list of the nodes in the DAG.
  ///
  /// Parameter [language] :
  /// The programming language of the resulting code from the DAG.
  Future<CreateScriptResponse> createScript({
    List<CodeGenEdge> dagEdges,
    List<CodeGenNode> dagNodes,
    Language language,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.CreateScript'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: CreateScriptRequest(
        dagEdges: dagEdges,
        dagNodes: dagNodes,
        language: language,
      ),
    );

    return CreateScriptResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new security configuration. A security configuration is a set of
  /// security properties that can be used by AWS Glue. You can use a security
  /// configuration to encrypt data at rest. For information about using
  /// security configurations in AWS Glue, see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/encryption-security-configuration.html">Encrypting
  /// Data Written by Crawlers, Jobs, and Development Endpoints</a>.
  ///
  /// May throw [AlreadyExistsException].
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [ResourceNumberLimitExceededException].
  ///
  /// Parameter [encryptionConfiguration] :
  /// The encryption configuration for the new security configuration.
  ///
  /// Parameter [name] :
  /// The name for the new security configuration.
  Future<CreateSecurityConfigurationResponse> createSecurityConfiguration({
    @_s.required EncryptionConfiguration encryptionConfiguration,
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(
        encryptionConfiguration, 'encryptionConfiguration');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.CreateSecurityConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: CreateSecurityConfigurationRequest(
        encryptionConfiguration: encryptionConfiguration,
        name: name,
      ),
    );

    return CreateSecurityConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new table definition in the Data Catalog.
  ///
  /// May throw [AlreadyExistsException].
  /// May throw [InvalidInputException].
  /// May throw [EntityNotFoundException].
  /// May throw [ResourceNumberLimitExceededException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [GlueEncryptionException].
  ///
  /// Parameter [databaseName] :
  /// The catalog database in which to create the new table. For Hive
  /// compatibility, this name is entirely lowercase.
  ///
  /// Parameter [tableInput] :
  /// The <code>TableInput</code> object that defines the metadata table to
  /// create in the catalog.
  ///
  /// Parameter [catalogId] :
  /// The ID of the Data Catalog in which to create the <code>Table</code>. If
  /// none is supplied, the AWS account ID is used by default.
  Future<void> createTable({
    @_s.required String databaseName,
    @_s.required TableInput tableInput,
    String catalogId,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'databaseName',
      databaseName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tableInput, 'tableInput');
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateStringPattern(
      'catalogId',
      catalogId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.CreateTable'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: CreateTableRequest(
        databaseName: databaseName,
        tableInput: tableInput,
        catalogId: catalogId,
      ),
    );

    return CreateTableResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new trigger.
  ///
  /// May throw [AlreadyExistsException].
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [ResourceNumberLimitExceededException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [actions] :
  /// The actions initiated by this trigger when it fires.
  ///
  /// Parameter [name] :
  /// The name of the trigger.
  ///
  /// Parameter [type] :
  /// The type of the new trigger.
  ///
  /// Parameter [description] :
  /// A description of the new trigger.
  ///
  /// Parameter [predicate] :
  /// A predicate to specify when the new trigger should fire.
  ///
  /// This field is required when the trigger type is <code>CONDITIONAL</code>.
  ///
  /// Parameter [schedule] :
  /// A <code>cron</code> expression used to specify the schedule (see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/monitor-data-warehouse-schedule.html">Time-Based
  /// Schedules for Jobs and Crawlers</a>. For example, to run something every
  /// day at 12:15 UTC, you would specify: <code>cron(15 12 * * ? *)</code>.
  ///
  /// This field is required when the trigger type is SCHEDULED.
  ///
  /// Parameter [startOnCreation] :
  /// Set to <code>true</code> to start <code>SCHEDULED</code> and
  /// <code>CONDITIONAL</code> triggers when created. True is not supported for
  /// <code>ON_DEMAND</code> triggers.
  ///
  /// Parameter [tags] :
  /// The tags to use with this trigger. You may use tags to limit access to the
  /// trigger. For more information about tags in AWS Glue, see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/monitor-tags.html">AWS
  /// Tags in AWS Glue</a> in the developer guide.
  ///
  /// Parameter [workflowName] :
  /// The name of the workflow associated with the trigger.
  Future<CreateTriggerResponse> createTrigger({
    @_s.required List<Action> actions,
    @_s.required String name,
    @_s.required TriggerType type,
    String description,
    Predicate predicate,
    String schedule,
    bool startOnCreation,
    Map<String, String> tags,
    String workflowName,
  }) async {
    ArgumentError.checkNotNull(actions, 'actions');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(type, 'type');
    _s.validateStringLength(
      'description',
      description,
      0,
      2048,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringLength(
      'workflowName',
      workflowName,
      1,
      255,
    );
    _s.validateStringPattern(
      'workflowName',
      workflowName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.CreateTrigger'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: CreateTriggerRequest(
        actions: actions,
        name: name,
        type: type,
        description: description,
        predicate: predicate,
        schedule: schedule,
        startOnCreation: startOnCreation,
        tags: tags,
        workflowName: workflowName,
      ),
    );

    return CreateTriggerResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new function definition in the Data Catalog.
  ///
  /// May throw [AlreadyExistsException].
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [EntityNotFoundException].
  /// May throw [OperationTimeoutException].
  /// May throw [ResourceNumberLimitExceededException].
  /// May throw [GlueEncryptionException].
  ///
  /// Parameter [databaseName] :
  /// The name of the catalog database in which to create the function.
  ///
  /// Parameter [functionInput] :
  /// A <code>FunctionInput</code> object that defines the function to create in
  /// the Data Catalog.
  ///
  /// Parameter [catalogId] :
  /// The ID of the Data Catalog in which to create the function. If none is
  /// provided, the AWS account ID is used by default.
  Future<void> createUserDefinedFunction({
    @_s.required String databaseName,
    @_s.required UserDefinedFunctionInput functionInput,
    String catalogId,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'databaseName',
      databaseName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(functionInput, 'functionInput');
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateStringPattern(
      'catalogId',
      catalogId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.CreateUserDefinedFunction'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: CreateUserDefinedFunctionRequest(
        databaseName: databaseName,
        functionInput: functionInput,
        catalogId: catalogId,
      ),
    );

    return CreateUserDefinedFunctionResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new workflow.
  ///
  /// May throw [AlreadyExistsException].
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [ResourceNumberLimitExceededException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [name] :
  /// The name to be assigned to the workflow. It should be unique within your
  /// account.
  ///
  /// Parameter [defaultRunProperties] :
  /// A collection of properties to be used as part of each execution of the
  /// workflow.
  ///
  /// Parameter [description] :
  /// A description of the workflow.
  ///
  /// Parameter [tags] :
  /// The tags to be used with this workflow.
  Future<CreateWorkflowResponse> createWorkflow({
    @_s.required String name,
    Map<String, String> defaultRunProperties,
    String description,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.CreateWorkflow'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: CreateWorkflowRequest(
        name: name,
        defaultRunProperties: defaultRunProperties,
        description: description,
        tags: tags,
      ),
    );

    return CreateWorkflowResponse.fromJson(jsonResponse.body);
  }

  /// Removes a classifier from the Data Catalog.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [name] :
  /// Name of the classifier to remove.
  Future<void> deleteClassifier({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.DeleteClassifier'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: DeleteClassifierRequest(
        name: name,
      ),
    );

    return DeleteClassifierResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a connection from the Data Catalog.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [connectionName] :
  /// The name of the connection to delete.
  ///
  /// Parameter [catalogId] :
  /// The ID of the Data Catalog in which the connection resides. If none is
  /// provided, the AWS account ID is used by default.
  Future<void> deleteConnection({
    @_s.required String connectionName,
    String catalogId,
  }) async {
    ArgumentError.checkNotNull(connectionName, 'connectionName');
    _s.validateStringLength(
      'connectionName',
      connectionName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'connectionName',
      connectionName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateStringPattern(
      'catalogId',
      catalogId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.DeleteConnection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: DeleteConnectionRequest(
        connectionName: connectionName,
        catalogId: catalogId,
      ),
    );

    return DeleteConnectionResponse.fromJson(jsonResponse.body);
  }

  /// Removes a specified crawler from the AWS Glue Data Catalog, unless the
  /// crawler state is <code>RUNNING</code>.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [CrawlerRunningException].
  /// May throw [SchedulerTransitioningException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [name] :
  /// The name of the crawler to remove.
  Future<void> deleteCrawler({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.DeleteCrawler'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: DeleteCrawlerRequest(
        name: name,
      ),
    );

    return DeleteCrawlerResponse.fromJson(jsonResponse.body);
  }

  /// Removes a specified database from a Data Catalog.
  /// <note>
  /// After completing this operation, you no longer have access to the tables
  /// (and all table versions and partitions that might belong to the tables)
  /// and the user-defined functions in the deleted database. AWS Glue deletes
  /// these "orphaned" resources asynchronously in a timely manner, at the
  /// discretion of the service.
  ///
  /// To ensure the immediate deletion of all related resources, before calling
  /// <code>DeleteDatabase</code>, use <code>DeleteTableVersion</code> or
  /// <code>BatchDeleteTableVersion</code>, <code>DeletePartition</code> or
  /// <code>BatchDeletePartition</code>, <code>DeleteUserDefinedFunction</code>,
  /// and <code>DeleteTable</code> or <code>BatchDeleteTable</code>, to delete
  /// any resources that belong to the database.
  /// </note>
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [name] :
  /// The name of the database to delete. For Hive compatibility, this must be
  /// all lowercase.
  ///
  /// Parameter [catalogId] :
  /// The ID of the Data Catalog in which the database resides. If none is
  /// provided, the AWS account ID is used by default.
  Future<void> deleteDatabase({
    @_s.required String name,
    String catalogId,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateStringPattern(
      'catalogId',
      catalogId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.DeleteDatabase'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: DeleteDatabaseRequest(
        name: name,
        catalogId: catalogId,
      ),
    );

    return DeleteDatabaseResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a specified development endpoint.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [endpointName] :
  /// The name of the <code>DevEndpoint</code>.
  Future<void> deleteDevEndpoint({
    @_s.required String endpointName,
  }) async {
    ArgumentError.checkNotNull(endpointName, 'endpointName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.DeleteDevEndpoint'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: DeleteDevEndpointRequest(
        endpointName: endpointName,
      ),
    );

    return DeleteDevEndpointResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a specified job definition. If the job definition is not found, no
  /// exception is thrown.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [jobName] :
  /// The name of the job definition to delete.
  Future<DeleteJobResponse> deleteJob({
    @_s.required String jobName,
  }) async {
    ArgumentError.checkNotNull(jobName, 'jobName');
    _s.validateStringLength(
      'jobName',
      jobName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'jobName',
      jobName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.DeleteJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: DeleteJobRequest(
        jobName: jobName,
      ),
    );

    return DeleteJobResponse.fromJson(jsonResponse.body);
  }

  /// Deletes an AWS Glue machine learning transform. Machine learning
  /// transforms are a special type of transform that use machine learning to
  /// learn the details of the transformation to be performed by learning from
  /// examples provided by humans. These transformations are then saved by AWS
  /// Glue. If you no longer need a transform, you can delete it by calling
  /// <code>DeleteMLTransforms</code>. However, any AWS Glue jobs that still
  /// reference the deleted transform will no longer succeed.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [OperationTimeoutException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [transformId] :
  /// The unique identifier of the transform to delete.
  Future<DeleteMLTransformResponse> deleteMLTransform({
    @_s.required String transformId,
  }) async {
    ArgumentError.checkNotNull(transformId, 'transformId');
    _s.validateStringLength(
      'transformId',
      transformId,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'transformId',
      transformId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.DeleteMLTransform'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: DeleteMLTransformRequest(
        transformId: transformId,
      ),
    );

    return DeleteMLTransformResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a specified partition.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [databaseName] :
  /// The name of the catalog database in which the table in question resides.
  ///
  /// Parameter [partitionValues] :
  /// The values that define the partition.
  ///
  /// Parameter [tableName] :
  /// The name of the table that contains the partition to be deleted.
  ///
  /// Parameter [catalogId] :
  /// The ID of the Data Catalog where the partition to be deleted resides. If
  /// none is provided, the AWS account ID is used by default.
  Future<void> deletePartition({
    @_s.required String databaseName,
    @_s.required List<String> partitionValues,
    @_s.required String tableName,
    String catalogId,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'databaseName',
      databaseName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(partitionValues, 'partitionValues');
    ArgumentError.checkNotNull(tableName, 'tableName');
    _s.validateStringLength(
      'tableName',
      tableName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tableName',
      tableName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateStringPattern(
      'catalogId',
      catalogId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.DeletePartition'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: DeletePartitionRequest(
        databaseName: databaseName,
        partitionValues: partitionValues,
        tableName: tableName,
        catalogId: catalogId,
      ),
    );

    return DeletePartitionResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a specified policy.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [InvalidInputException].
  /// May throw [ConditionCheckFailureException].
  ///
  /// Parameter [policyHashCondition] :
  /// The hash value returned when this policy was set.
  Future<void> deleteResourcePolicy({
    String policyHashCondition,
  }) async {
    _s.validateStringLength(
      'policyHashCondition',
      policyHashCondition,
      1,
      255,
    );
    _s.validateStringPattern(
      'policyHashCondition',
      policyHashCondition,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.DeleteResourcePolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: DeleteResourcePolicyRequest(
        policyHashCondition: policyHashCondition,
      ),
    );

    return DeleteResourcePolicyResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a specified security configuration.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [name] :
  /// The name of the security configuration to delete.
  Future<void> deleteSecurityConfiguration({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.DeleteSecurityConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: DeleteSecurityConfigurationRequest(
        name: name,
      ),
    );

    return DeleteSecurityConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Removes a table definition from the Data Catalog.
  /// <note>
  /// After completing this operation, you no longer have access to the table
  /// versions and partitions that belong to the deleted table. AWS Glue deletes
  /// these "orphaned" resources asynchronously in a timely manner, at the
  /// discretion of the service.
  ///
  /// To ensure the immediate deletion of all related resources, before calling
  /// <code>DeleteTable</code>, use <code>DeleteTableVersion</code> or
  /// <code>BatchDeleteTableVersion</code>, and <code>DeletePartition</code> or
  /// <code>BatchDeletePartition</code>, to delete any resources that belong to
  /// the table.
  /// </note>
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [databaseName] :
  /// The name of the catalog database in which the table resides. For Hive
  /// compatibility, this name is entirely lowercase.
  ///
  /// Parameter [name] :
  /// The name of the table to be deleted. For Hive compatibility, this name is
  /// entirely lowercase.
  ///
  /// Parameter [catalogId] :
  /// The ID of the Data Catalog where the table resides. If none is provided,
  /// the AWS account ID is used by default.
  Future<void> deleteTable({
    @_s.required String databaseName,
    @_s.required String name,
    String catalogId,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'databaseName',
      databaseName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateStringPattern(
      'catalogId',
      catalogId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.DeleteTable'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: DeleteTableRequest(
        databaseName: databaseName,
        name: name,
        catalogId: catalogId,
      ),
    );

    return DeleteTableResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a specified version of a table.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [databaseName] :
  /// The database in the catalog in which the table resides. For Hive
  /// compatibility, this name is entirely lowercase.
  ///
  /// Parameter [tableName] :
  /// The name of the table. For Hive compatibility, this name is entirely
  /// lowercase.
  ///
  /// Parameter [versionId] :
  /// The ID of the table version to be deleted. A <code>VersionID</code> is a
  /// string representation of an integer. Each version is incremented by 1.
  ///
  /// Parameter [catalogId] :
  /// The ID of the Data Catalog where the tables reside. If none is provided,
  /// the AWS account ID is used by default.
  Future<void> deleteTableVersion({
    @_s.required String databaseName,
    @_s.required String tableName,
    @_s.required String versionId,
    String catalogId,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'databaseName',
      databaseName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tableName, 'tableName');
    _s.validateStringLength(
      'tableName',
      tableName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tableName',
      tableName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(versionId, 'versionId');
    _s.validateStringLength(
      'versionId',
      versionId,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'versionId',
      versionId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateStringPattern(
      'catalogId',
      catalogId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.DeleteTableVersion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: DeleteTableVersionRequest(
        databaseName: databaseName,
        tableName: tableName,
        versionId: versionId,
        catalogId: catalogId,
      ),
    );

    return DeleteTableVersionResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a specified trigger. If the trigger is not found, no exception is
  /// thrown.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [name] :
  /// The name of the trigger to delete.
  Future<DeleteTriggerResponse> deleteTrigger({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.DeleteTrigger'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: DeleteTriggerRequest(
        name: name,
      ),
    );

    return DeleteTriggerResponse.fromJson(jsonResponse.body);
  }

  /// Deletes an existing function definition from the Data Catalog.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [databaseName] :
  /// The name of the catalog database where the function is located.
  ///
  /// Parameter [functionName] :
  /// The name of the function definition to be deleted.
  ///
  /// Parameter [catalogId] :
  /// The ID of the Data Catalog where the function to be deleted is located. If
  /// none is supplied, the AWS account ID is used by default.
  Future<void> deleteUserDefinedFunction({
    @_s.required String databaseName,
    @_s.required String functionName,
    String catalogId,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'databaseName',
      databaseName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'functionName',
      functionName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateStringPattern(
      'catalogId',
      catalogId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.DeleteUserDefinedFunction'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: DeleteUserDefinedFunctionRequest(
        databaseName: databaseName,
        functionName: functionName,
        catalogId: catalogId,
      ),
    );

    return DeleteUserDefinedFunctionResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a workflow.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [name] :
  /// Name of the workflow to be deleted.
  Future<DeleteWorkflowResponse> deleteWorkflow({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.DeleteWorkflow'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: DeleteWorkflowRequest(
        name: name,
      ),
    );

    return DeleteWorkflowResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the status of a migration operation.
  ///
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [catalogId] :
  /// The ID of the catalog to migrate. Currently, this should be the AWS
  /// account ID.
  Future<GetCatalogImportStatusResponse> getCatalogImportStatus({
    String catalogId,
  }) async {
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateStringPattern(
      'catalogId',
      catalogId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetCatalogImportStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: GetCatalogImportStatusRequest(
        catalogId: catalogId,
      ),
    );

    return GetCatalogImportStatusResponse.fromJson(jsonResponse.body);
  }

  /// Retrieve a classifier by name.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [name] :
  /// Name of the classifier to retrieve.
  Future<GetClassifierResponse> getClassifier({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetClassifier'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: GetClassifierRequest(
        name: name,
      ),
    );

    return GetClassifierResponse.fromJson(jsonResponse.body);
  }

  /// Lists all classifier objects in the Data Catalog.
  ///
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [maxResults] :
  /// The size of the list to return (optional).
  ///
  /// Parameter [nextToken] :
  /// An optional continuation token.
  Future<GetClassifiersResponse> getClassifiers({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetClassifiers'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: GetClassifiersRequest(
        maxResults: maxResults,
        nextToken: nextToken,
      ),
    );

    return GetClassifiersResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves a connection definition from the Data Catalog.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [OperationTimeoutException].
  /// May throw [InvalidInputException].
  /// May throw [GlueEncryptionException].
  ///
  /// Parameter [name] :
  /// The name of the connection definition to retrieve.
  ///
  /// Parameter [catalogId] :
  /// The ID of the Data Catalog in which the connection resides. If none is
  /// provided, the AWS account ID is used by default.
  ///
  /// Parameter [hidePassword] :
  /// Allows you to retrieve the connection metadata without returning the
  /// password. For instance, the AWS Glue console uses this flag to retrieve
  /// the connection, and does not display the password. Set this parameter when
  /// the caller might not have permission to use the AWS KMS key to decrypt the
  /// password, but it does have permission to access the rest of the connection
  /// properties.
  Future<GetConnectionResponse> getConnection({
    @_s.required String name,
    String catalogId,
    bool hidePassword,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateStringPattern(
      'catalogId',
      catalogId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetConnection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: GetConnectionRequest(
        name: name,
        catalogId: catalogId,
        hidePassword: hidePassword,
      ),
    );

    return GetConnectionResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves a list of connection definitions from the Data Catalog.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [OperationTimeoutException].
  /// May throw [InvalidInputException].
  /// May throw [GlueEncryptionException].
  ///
  /// Parameter [catalogId] :
  /// The ID of the Data Catalog in which the connections reside. If none is
  /// provided, the AWS account ID is used by default.
  ///
  /// Parameter [filter] :
  /// A filter that controls which connections are returned.
  ///
  /// Parameter [hidePassword] :
  /// Allows you to retrieve the connection metadata without returning the
  /// password. For instance, the AWS Glue console uses this flag to retrieve
  /// the connection, and does not display the password. Set this parameter when
  /// the caller might not have permission to use the AWS KMS key to decrypt the
  /// password, but it does have permission to access the rest of the connection
  /// properties.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of connections to return in one response.
  ///
  /// Parameter [nextToken] :
  /// A continuation token, if this is a continuation call.
  Future<GetConnectionsResponse> getConnections({
    String catalogId,
    GetConnectionsFilter filter,
    bool hidePassword,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateStringPattern(
      'catalogId',
      catalogId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetConnections'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: GetConnectionsRequest(
        catalogId: catalogId,
        filter: filter,
        hidePassword: hidePassword,
        maxResults: maxResults,
        nextToken: nextToken,
      ),
    );

    return GetConnectionsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves metadata for a specified crawler.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [name] :
  /// The name of the crawler to retrieve metadata for.
  Future<GetCrawlerResponse> getCrawler({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetCrawler'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: GetCrawlerRequest(
        name: name,
      ),
    );

    return GetCrawlerResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves metrics about specified crawlers.
  ///
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [crawlerNameList] :
  /// A list of the names of crawlers about which to retrieve metrics.
  ///
  /// Parameter [maxResults] :
  /// The maximum size of a list to return.
  ///
  /// Parameter [nextToken] :
  /// A continuation token, if this is a continuation call.
  Future<GetCrawlerMetricsResponse> getCrawlerMetrics({
    List<String> crawlerNameList,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetCrawlerMetrics'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: GetCrawlerMetricsRequest(
        crawlerNameList: crawlerNameList,
        maxResults: maxResults,
        nextToken: nextToken,
      ),
    );

    return GetCrawlerMetricsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves metadata for all crawlers defined in the customer account.
  ///
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [maxResults] :
  /// The number of crawlers to return on each call.
  ///
  /// Parameter [nextToken] :
  /// A continuation token, if this is a continuation request.
  Future<GetCrawlersResponse> getCrawlers({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetCrawlers'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: GetCrawlersRequest(
        maxResults: maxResults,
        nextToken: nextToken,
      ),
    );

    return GetCrawlersResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the security configuration for a specified catalog.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidInputException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [catalogId] :
  /// The ID of the Data Catalog to retrieve the security configuration for. If
  /// none is provided, the AWS account ID is used by default.
  Future<GetDataCatalogEncryptionSettingsResponse>
      getDataCatalogEncryptionSettings({
    String catalogId,
  }) async {
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateStringPattern(
      'catalogId',
      catalogId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetDataCatalogEncryptionSettings'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: GetDataCatalogEncryptionSettingsRequest(
        catalogId: catalogId,
      ),
    );

    return GetDataCatalogEncryptionSettingsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the definition of a specified database.
  ///
  /// May throw [InvalidInputException].
  /// May throw [EntityNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [GlueEncryptionException].
  ///
  /// Parameter [name] :
  /// The name of the database to retrieve. For Hive compatibility, this should
  /// be all lowercase.
  ///
  /// Parameter [catalogId] :
  /// The ID of the Data Catalog in which the database resides. If none is
  /// provided, the AWS account ID is used by default.
  Future<GetDatabaseResponse> getDatabase({
    @_s.required String name,
    String catalogId,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateStringPattern(
      'catalogId',
      catalogId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetDatabase'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: GetDatabaseRequest(
        name: name,
        catalogId: catalogId,
      ),
    );

    return GetDatabaseResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves all databases defined in a given Data Catalog.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [GlueEncryptionException].
  ///
  /// Parameter [catalogId] :
  /// The ID of the Data Catalog from which to retrieve <code>Databases</code>.
  /// If none is provided, the AWS account ID is used by default.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of databases to return in one response.
  ///
  /// Parameter [nextToken] :
  /// A continuation token, if this is a continuation call.
  Future<GetDatabasesResponse> getDatabases({
    String catalogId,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateStringPattern(
      'catalogId',
      catalogId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetDatabases'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: GetDatabasesRequest(
        catalogId: catalogId,
        maxResults: maxResults,
        nextToken: nextToken,
      ),
    );

    return GetDatabasesResponse.fromJson(jsonResponse.body);
  }

  /// Transforms a Python script into a directed acyclic graph (DAG).
  ///
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [pythonScript] :
  /// The Python script to transform.
  Future<GetDataflowGraphResponse> getDataflowGraph({
    String pythonScript,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetDataflowGraph'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: GetDataflowGraphRequest(
        pythonScript: pythonScript,
      ),
    );

    return GetDataflowGraphResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves information about a specified development endpoint.
  /// <note>
  /// When you create a development endpoint in a virtual private cloud (VPC),
  /// AWS Glue returns only a private IP address, and the public IP address
  /// field is not populated. When you create a non-VPC development endpoint,
  /// AWS Glue returns only a public IP address.
  /// </note>
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [endpointName] :
  /// Name of the <code>DevEndpoint</code> to retrieve information for.
  Future<GetDevEndpointResponse> getDevEndpoint({
    @_s.required String endpointName,
  }) async {
    ArgumentError.checkNotNull(endpointName, 'endpointName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetDevEndpoint'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: GetDevEndpointRequest(
        endpointName: endpointName,
      ),
    );

    return GetDevEndpointResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves all the development endpoints in this AWS account.
  /// <note>
  /// When you create a development endpoint in a virtual private cloud (VPC),
  /// AWS Glue returns only a private IP address and the public IP address field
  /// is not populated. When you create a non-VPC development endpoint, AWS Glue
  /// returns only a public IP address.
  /// </note>
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [maxResults] :
  /// The maximum size of information to return.
  ///
  /// Parameter [nextToken] :
  /// A continuation token, if this is a continuation call.
  Future<GetDevEndpointsResponse> getDevEndpoints({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetDevEndpoints'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: GetDevEndpointsRequest(
        maxResults: maxResults,
        nextToken: nextToken,
      ),
    );

    return GetDevEndpointsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves an existing job definition.
  ///
  /// May throw [InvalidInputException].
  /// May throw [EntityNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [jobName] :
  /// The name of the job definition to retrieve.
  Future<GetJobResponse> getJob({
    @_s.required String jobName,
  }) async {
    ArgumentError.checkNotNull(jobName, 'jobName');
    _s.validateStringLength(
      'jobName',
      jobName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'jobName',
      jobName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: GetJobRequest(
        jobName: jobName,
      ),
    );

    return GetJobResponse.fromJson(jsonResponse.body);
  }

  /// Returns information on a job bookmark entry.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [ValidationException].
  ///
  /// Parameter [jobName] :
  /// The name of the job in question.
  ///
  /// Parameter [runId] :
  /// The unique run identifier associated with this job run.
  Future<GetJobBookmarkResponse> getJobBookmark({
    @_s.required String jobName,
    String runId,
  }) async {
    ArgumentError.checkNotNull(jobName, 'jobName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetJobBookmark'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: GetJobBookmarkRequest(
        jobName: jobName,
        runId: runId,
      ),
    );

    return GetJobBookmarkResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the metadata for a given job run.
  ///
  /// May throw [InvalidInputException].
  /// May throw [EntityNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [jobName] :
  /// Name of the job definition being run.
  ///
  /// Parameter [runId] :
  /// The ID of the job run.
  ///
  /// Parameter [predecessorsIncluded] :
  /// True if a list of predecessor runs should be returned.
  Future<GetJobRunResponse> getJobRun({
    @_s.required String jobName,
    @_s.required String runId,
    bool predecessorsIncluded,
  }) async {
    ArgumentError.checkNotNull(jobName, 'jobName');
    _s.validateStringLength(
      'jobName',
      jobName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'jobName',
      jobName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(runId, 'runId');
    _s.validateStringLength(
      'runId',
      runId,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'runId',
      runId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetJobRun'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: GetJobRunRequest(
        jobName: jobName,
        runId: runId,
        predecessorsIncluded: predecessorsIncluded,
      ),
    );

    return GetJobRunResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves metadata for all runs of a given job definition.
  ///
  /// May throw [InvalidInputException].
  /// May throw [EntityNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [jobName] :
  /// The name of the job definition for which to retrieve all job runs.
  ///
  /// Parameter [maxResults] :
  /// The maximum size of the response.
  ///
  /// Parameter [nextToken] :
  /// A continuation token, if this is a continuation call.
  Future<GetJobRunsResponse> getJobRuns({
    @_s.required String jobName,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(jobName, 'jobName');
    _s.validateStringLength(
      'jobName',
      jobName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'jobName',
      jobName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetJobRuns'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: GetJobRunsRequest(
        jobName: jobName,
        maxResults: maxResults,
        nextToken: nextToken,
      ),
    );

    return GetJobRunsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves all current job definitions.
  ///
  /// May throw [InvalidInputException].
  /// May throw [EntityNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [maxResults] :
  /// The maximum size of the response.
  ///
  /// Parameter [nextToken] :
  /// A continuation token, if this is a continuation call.
  Future<GetJobsResponse> getJobs({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: GetJobsRequest(
        maxResults: maxResults,
        nextToken: nextToken,
      ),
    );

    return GetJobsResponse.fromJson(jsonResponse.body);
  }

  /// Gets details for a specific task run on a machine learning transform.
  /// Machine learning task runs are asynchronous tasks that AWS Glue runs on
  /// your behalf as part of various machine learning workflows. You can check
  /// the stats of any task run by calling <code>GetMLTaskRun</code> with the
  /// <code>TaskRunID</code> and its parent transform's
  /// <code>TransformID</code>.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [OperationTimeoutException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [taskRunId] :
  /// The unique identifier of the task run.
  ///
  /// Parameter [transformId] :
  /// The unique identifier of the machine learning transform.
  Future<GetMLTaskRunResponse> getMLTaskRun({
    @_s.required String taskRunId,
    @_s.required String transformId,
  }) async {
    ArgumentError.checkNotNull(taskRunId, 'taskRunId');
    _s.validateStringLength(
      'taskRunId',
      taskRunId,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'taskRunId',
      taskRunId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(transformId, 'transformId');
    _s.validateStringLength(
      'transformId',
      transformId,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'transformId',
      transformId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetMLTaskRun'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: GetMLTaskRunRequest(
        taskRunId: taskRunId,
        transformId: transformId,
      ),
    );

    return GetMLTaskRunResponse.fromJson(jsonResponse.body);
  }

  /// Gets a list of runs for a machine learning transform. Machine learning
  /// task runs are asynchronous tasks that AWS Glue runs on your behalf as part
  /// of various machine learning workflows. You can get a sortable, filterable
  /// list of machine learning task runs by calling <code>GetMLTaskRuns</code>
  /// with their parent transform's <code>TransformID</code> and other optional
  /// parameters as documented in this section.
  ///
  /// This operation returns a list of historic runs and must be paginated.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [OperationTimeoutException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [transformId] :
  /// The unique identifier of the machine learning transform.
  ///
  /// Parameter [filter] :
  /// The filter criteria, in the <code>TaskRunFilterCriteria</code> structure,
  /// for the task run.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// A token for pagination of the results. The default is empty.
  ///
  /// Parameter [sort] :
  /// The sorting criteria, in the <code>TaskRunSortCriteria</code> structure,
  /// for the task run.
  Future<GetMLTaskRunsResponse> getMLTaskRuns({
    @_s.required String transformId,
    TaskRunFilterCriteria filter,
    int maxResults,
    String nextToken,
    TaskRunSortCriteria sort,
  }) async {
    ArgumentError.checkNotNull(transformId, 'transformId');
    _s.validateStringLength(
      'transformId',
      transformId,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'transformId',
      transformId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetMLTaskRuns'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: GetMLTaskRunsRequest(
        transformId: transformId,
        filter: filter,
        maxResults: maxResults,
        nextToken: nextToken,
        sort: sort,
      ),
    );

    return GetMLTaskRunsResponse.fromJson(jsonResponse.body);
  }

  /// Gets an AWS Glue machine learning transform artifact and all its
  /// corresponding metadata. Machine learning transforms are a special type of
  /// transform that use machine learning to learn the details of the
  /// transformation to be performed by learning from examples provided by
  /// humans. These transformations are then saved by AWS Glue. You can retrieve
  /// their metadata by calling <code>GetMLTransform</code>.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [OperationTimeoutException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [transformId] :
  /// The unique identifier of the transform, generated at the time that the
  /// transform was created.
  Future<GetMLTransformResponse> getMLTransform({
    @_s.required String transformId,
  }) async {
    ArgumentError.checkNotNull(transformId, 'transformId');
    _s.validateStringLength(
      'transformId',
      transformId,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'transformId',
      transformId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetMLTransform'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: GetMLTransformRequest(
        transformId: transformId,
      ),
    );

    return GetMLTransformResponse.fromJson(jsonResponse.body);
  }

  /// Gets a sortable, filterable list of existing AWS Glue machine learning
  /// transforms. Machine learning transforms are a special type of transform
  /// that use machine learning to learn the details of the transformation to be
  /// performed by learning from examples provided by humans. These
  /// transformations are then saved by AWS Glue, and you can retrieve their
  /// metadata by calling <code>GetMLTransforms</code>.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [OperationTimeoutException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [filter] :
  /// The filter transformation criteria.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// A paginated token to offset the results.
  ///
  /// Parameter [sort] :
  /// The sorting criteria.
  Future<GetMLTransformsResponse> getMLTransforms({
    TransformFilterCriteria filter,
    int maxResults,
    String nextToken,
    TransformSortCriteria sort,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetMLTransforms'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: GetMLTransformsRequest(
        filter: filter,
        maxResults: maxResults,
        nextToken: nextToken,
        sort: sort,
      ),
    );

    return GetMLTransformsResponse.fromJson(jsonResponse.body);
  }

  /// Creates mappings.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [EntityNotFoundException].
  ///
  /// Parameter [source] :
  /// Specifies the source table.
  ///
  /// Parameter [location] :
  /// Parameters for the mapping.
  ///
  /// Parameter [sinks] :
  /// A list of target tables.
  Future<GetMappingResponse> getMapping({
    @_s.required CatalogEntry source,
    Location location,
    List<CatalogEntry> sinks,
  }) async {
    ArgumentError.checkNotNull(source, 'source');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetMapping'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: GetMappingRequest(
        source: source,
        location: location,
        sinks: sinks,
      ),
    );

    return GetMappingResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves information about a specified partition.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [GlueEncryptionException].
  ///
  /// Parameter [databaseName] :
  /// The name of the catalog database where the partition resides.
  ///
  /// Parameter [partitionValues] :
  /// The values that define the partition.
  ///
  /// Parameter [tableName] :
  /// The name of the partition's table.
  ///
  /// Parameter [catalogId] :
  /// The ID of the Data Catalog where the partition in question resides. If
  /// none is provided, the AWS account ID is used by default.
  Future<GetPartitionResponse> getPartition({
    @_s.required String databaseName,
    @_s.required List<String> partitionValues,
    @_s.required String tableName,
    String catalogId,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'databaseName',
      databaseName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(partitionValues, 'partitionValues');
    ArgumentError.checkNotNull(tableName, 'tableName');
    _s.validateStringLength(
      'tableName',
      tableName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tableName',
      tableName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateStringPattern(
      'catalogId',
      catalogId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetPartition'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: GetPartitionRequest(
        databaseName: databaseName,
        partitionValues: partitionValues,
        tableName: tableName,
        catalogId: catalogId,
      ),
    );

    return GetPartitionResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves information about the partitions in a table.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [OperationTimeoutException].
  /// May throw [InternalServiceException].
  /// May throw [GlueEncryptionException].
  ///
  /// Parameter [databaseName] :
  /// The name of the catalog database where the partitions reside.
  ///
  /// Parameter [tableName] :
  /// The name of the partitions' table.
  ///
  /// Parameter [catalogId] :
  /// The ID of the Data Catalog where the partitions in question reside. If
  /// none is provided, the AWS account ID is used by default.
  ///
  /// Parameter [expression] :
  /// An expression that filters the partitions to be returned.
  ///
  /// The expression uses SQL syntax similar to the SQL <code>WHERE</code>
  /// filter clause. The SQL statement parser <a
  /// href="http://jsqlparser.sourceforge.net/home.php">JSQLParser</a> parses
  /// the expression.
  ///
  /// <i>Operators</i>: The following are the operators that you can use in the
  /// <code>Expression</code> API call:
  /// <dl> <dt>=</dt> <dd>
  /// Checks whether the values of the two operands are equal; if yes, then the
  /// condition becomes true.
  ///
  /// Example: Assume 'variable a' holds 10 and 'variable b' holds 20.
  ///
  /// (a = b) is not true.
  /// </dd> <dt>&lt; &gt;</dt> <dd>
  /// Checks whether the values of two operands are equal; if the values are not
  /// equal, then the condition becomes true.
  ///
  /// Example: (a &lt; &gt; b) is true.
  /// </dd> <dt>&gt;</dt> <dd>
  /// Checks whether the value of the left operand is greater than the value of
  /// the right operand; if yes, then the condition becomes true.
  ///
  /// Example: (a &gt; b) is not true.
  /// </dd> <dt>&lt;</dt> <dd>
  /// Checks whether the value of the left operand is less than the value of the
  /// right operand; if yes, then the condition becomes true.
  ///
  /// Example: (a &lt; b) is true.
  /// </dd> <dt>&gt;=</dt> <dd>
  /// Checks whether the value of the left operand is greater than or equal to
  /// the value of the right operand; if yes, then the condition becomes true.
  ///
  /// Example: (a &gt;= b) is not true.
  /// </dd> <dt>&lt;=</dt> <dd>
  /// Checks whether the value of the left operand is less than or equal to the
  /// value of the right operand; if yes, then the condition becomes true.
  ///
  /// Example: (a &lt;= b) is true.
  /// </dd> <dt>AND, OR, IN, BETWEEN, LIKE, NOT, IS NULL</dt> <dd>
  /// Logical operators.
  /// </dd> </dl>
  /// <i>Supported Partition Key Types</i>: The following are the supported
  /// partition keys.
  ///
  /// <ul>
  /// <li>
  /// <code>string</code>
  /// </li>
  /// <li>
  /// <code>date</code>
  /// </li>
  /// <li>
  /// <code>timestamp</code>
  /// </li>
  /// <li>
  /// <code>int</code>
  /// </li>
  /// <li>
  /// <code>bigint</code>
  /// </li>
  /// <li>
  /// <code>long</code>
  /// </li>
  /// <li>
  /// <code>tinyint</code>
  /// </li>
  /// <li>
  /// <code>smallint</code>
  /// </li>
  /// <li>
  /// <code>decimal</code>
  /// </li>
  /// </ul>
  /// If an invalid type is encountered, an exception is thrown.
  ///
  /// The following list shows the valid operators on each type. When you define
  /// a crawler, the <code>partitionKey</code> type is created as a
  /// <code>STRING</code>, to be compatible with the catalog partitions.
  ///
  /// <i>Sample API Call</i>:
  ///
  /// Parameter [maxResults] :
  /// The maximum number of partitions to return in a single response.
  ///
  /// Parameter [nextToken] :
  /// A continuation token, if this is not the first call to retrieve these
  /// partitions.
  ///
  /// Parameter [segment] :
  /// The segment of the table's partitions to scan in this request.
  Future<GetPartitionsResponse> getPartitions({
    @_s.required String databaseName,
    @_s.required String tableName,
    String catalogId,
    String expression,
    int maxResults,
    String nextToken,
    Segment segment,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'databaseName',
      databaseName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tableName, 'tableName');
    _s.validateStringLength(
      'tableName',
      tableName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tableName',
      tableName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateStringPattern(
      'catalogId',
      catalogId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    _s.validateStringLength(
      'expression',
      expression,
      0,
      2048,
    );
    _s.validateStringPattern(
      'expression',
      expression,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetPartitions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: GetPartitionsRequest(
        databaseName: databaseName,
        tableName: tableName,
        catalogId: catalogId,
        expression: expression,
        maxResults: maxResults,
        nextToken: nextToken,
        segment: segment,
      ),
    );

    return GetPartitionsResponse.fromJson(jsonResponse.body);
  }

  /// Gets code to perform a specified mapping.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [mapping] :
  /// The list of mappings from a source table to target tables.
  ///
  /// Parameter [source] :
  /// The source table.
  ///
  /// Parameter [language] :
  /// The programming language of the code to perform the mapping.
  ///
  /// Parameter [location] :
  /// The parameters for the mapping.
  ///
  /// Parameter [sinks] :
  /// The target tables.
  Future<GetPlanResponse> getPlan({
    @_s.required List<MappingEntry> mapping,
    @_s.required CatalogEntry source,
    Language language,
    Location location,
    List<CatalogEntry> sinks,
  }) async {
    ArgumentError.checkNotNull(mapping, 'mapping');
    ArgumentError.checkNotNull(source, 'source');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetPlan'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: GetPlanRequest(
        mapping: mapping,
        source: source,
        language: language,
        location: location,
        sinks: sinks,
      ),
    );

    return GetPlanResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves a specified resource policy.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [InvalidInputException].
  Future<GetResourcePolicyResponse> getResourcePolicy() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetResourcePolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return GetResourcePolicyResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves a specified security configuration.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [name] :
  /// The name of the security configuration to retrieve.
  Future<GetSecurityConfigurationResponse> getSecurityConfiguration({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetSecurityConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: GetSecurityConfigurationRequest(
        name: name,
      ),
    );

    return GetSecurityConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves a list of all security configurations.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// A continuation token, if this is a continuation call.
  Future<GetSecurityConfigurationsResponse> getSecurityConfigurations({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetSecurityConfigurations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: GetSecurityConfigurationsRequest(
        maxResults: maxResults,
        nextToken: nextToken,
      ),
    );

    return GetSecurityConfigurationsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the <code>Table</code> definition in a Data Catalog for a
  /// specified table.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [GlueEncryptionException].
  ///
  /// Parameter [databaseName] :
  /// The name of the database in the catalog in which the table resides. For
  /// Hive compatibility, this name is entirely lowercase.
  ///
  /// Parameter [name] :
  /// The name of the table for which to retrieve the definition. For Hive
  /// compatibility, this name is entirely lowercase.
  ///
  /// Parameter [catalogId] :
  /// The ID of the Data Catalog where the table resides. If none is provided,
  /// the AWS account ID is used by default.
  Future<GetTableResponse> getTable({
    @_s.required String databaseName,
    @_s.required String name,
    String catalogId,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'databaseName',
      databaseName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateStringPattern(
      'catalogId',
      catalogId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetTable'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: GetTableRequest(
        databaseName: databaseName,
        name: name,
        catalogId: catalogId,
      ),
    );

    return GetTableResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves a specified version of a table.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [GlueEncryptionException].
  ///
  /// Parameter [databaseName] :
  /// The database in the catalog in which the table resides. For Hive
  /// compatibility, this name is entirely lowercase.
  ///
  /// Parameter [tableName] :
  /// The name of the table. For Hive compatibility, this name is entirely
  /// lowercase.
  ///
  /// Parameter [catalogId] :
  /// The ID of the Data Catalog where the tables reside. If none is provided,
  /// the AWS account ID is used by default.
  ///
  /// Parameter [versionId] :
  /// The ID value of the table version to be retrieved. A
  /// <code>VersionID</code> is a string representation of an integer. Each
  /// version is incremented by 1.
  Future<GetTableVersionResponse> getTableVersion({
    @_s.required String databaseName,
    @_s.required String tableName,
    String catalogId,
    String versionId,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'databaseName',
      databaseName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tableName, 'tableName');
    _s.validateStringLength(
      'tableName',
      tableName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tableName',
      tableName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateStringPattern(
      'catalogId',
      catalogId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    _s.validateStringLength(
      'versionId',
      versionId,
      1,
      255,
    );
    _s.validateStringPattern(
      'versionId',
      versionId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetTableVersion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: GetTableVersionRequest(
        databaseName: databaseName,
        tableName: tableName,
        catalogId: catalogId,
        versionId: versionId,
      ),
    );

    return GetTableVersionResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves a list of strings that identify available versions of a
  /// specified table.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [GlueEncryptionException].
  ///
  /// Parameter [databaseName] :
  /// The database in the catalog in which the table resides. For Hive
  /// compatibility, this name is entirely lowercase.
  ///
  /// Parameter [tableName] :
  /// The name of the table. For Hive compatibility, this name is entirely
  /// lowercase.
  ///
  /// Parameter [catalogId] :
  /// The ID of the Data Catalog where the tables reside. If none is provided,
  /// the AWS account ID is used by default.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of table versions to return in one response.
  ///
  /// Parameter [nextToken] :
  /// A continuation token, if this is not the first call.
  Future<GetTableVersionsResponse> getTableVersions({
    @_s.required String databaseName,
    @_s.required String tableName,
    String catalogId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'databaseName',
      databaseName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tableName, 'tableName');
    _s.validateStringLength(
      'tableName',
      tableName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tableName',
      tableName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateStringPattern(
      'catalogId',
      catalogId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetTableVersions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: GetTableVersionsRequest(
        databaseName: databaseName,
        tableName: tableName,
        catalogId: catalogId,
        maxResults: maxResults,
        nextToken: nextToken,
      ),
    );

    return GetTableVersionsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the definitions of some or all of the tables in a given
  /// <code>Database</code>.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [OperationTimeoutException].
  /// May throw [InternalServiceException].
  /// May throw [GlueEncryptionException].
  ///
  /// Parameter [databaseName] :
  /// The database in the catalog whose tables to list. For Hive compatibility,
  /// this name is entirely lowercase.
  ///
  /// Parameter [catalogId] :
  /// The ID of the Data Catalog where the tables reside. If none is provided,
  /// the AWS account ID is used by default.
  ///
  /// Parameter [expression] :
  /// A regular expression pattern. If present, only those tables whose names
  /// match the pattern are returned.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of tables to return in a single response.
  ///
  /// Parameter [nextToken] :
  /// A continuation token, included if this is a continuation call.
  Future<GetTablesResponse> getTables({
    @_s.required String databaseName,
    String catalogId,
    String expression,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'databaseName',
      databaseName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateStringPattern(
      'catalogId',
      catalogId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    _s.validateStringLength(
      'expression',
      expression,
      0,
      2048,
    );
    _s.validateStringPattern(
      'expression',
      expression,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetTables'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: GetTablesRequest(
        databaseName: databaseName,
        catalogId: catalogId,
        expression: expression,
        maxResults: maxResults,
        nextToken: nextToken,
      ),
    );

    return GetTablesResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves a list of tags associated with a resource.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [EntityNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource for which to retrieve tags.
  Future<GetTagsResponse> getTags({
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      10240,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''arn:aws:glue:.*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetTags'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: GetTagsRequest(
        resourceArn: resourceArn,
      ),
    );

    return GetTagsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the definition of a trigger.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [name] :
  /// The name of the trigger to retrieve.
  Future<GetTriggerResponse> getTrigger({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetTrigger'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: GetTriggerRequest(
        name: name,
      ),
    );

    return GetTriggerResponse.fromJson(jsonResponse.body);
  }

  /// Gets all the triggers associated with a job.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [dependentJobName] :
  /// The name of the job to retrieve triggers for. The trigger that can start
  /// this job is returned, and if there is no such trigger, all triggers are
  /// returned.
  ///
  /// Parameter [maxResults] :
  /// The maximum size of the response.
  ///
  /// Parameter [nextToken] :
  /// A continuation token, if this is a continuation call.
  Future<GetTriggersResponse> getTriggers({
    String dependentJobName,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'dependentJobName',
      dependentJobName,
      1,
      255,
    );
    _s.validateStringPattern(
      'dependentJobName',
      dependentJobName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetTriggers'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: GetTriggersRequest(
        dependentJobName: dependentJobName,
        maxResults: maxResults,
        nextToken: nextToken,
      ),
    );

    return GetTriggersResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves a specified function definition from the Data Catalog.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [GlueEncryptionException].
  ///
  /// Parameter [databaseName] :
  /// The name of the catalog database where the function is located.
  ///
  /// Parameter [functionName] :
  /// The name of the function.
  ///
  /// Parameter [catalogId] :
  /// The ID of the Data Catalog where the function to be retrieved is located.
  /// If none is provided, the AWS account ID is used by default.
  Future<GetUserDefinedFunctionResponse> getUserDefinedFunction({
    @_s.required String databaseName,
    @_s.required String functionName,
    String catalogId,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'databaseName',
      databaseName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'functionName',
      functionName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateStringPattern(
      'catalogId',
      catalogId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetUserDefinedFunction'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: GetUserDefinedFunctionRequest(
        databaseName: databaseName,
        functionName: functionName,
        catalogId: catalogId,
      ),
    );

    return GetUserDefinedFunctionResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves multiple function definitions from the Data Catalog.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [OperationTimeoutException].
  /// May throw [InternalServiceException].
  /// May throw [GlueEncryptionException].
  ///
  /// Parameter [pattern] :
  /// An optional function-name pattern string that filters the function
  /// definitions returned.
  ///
  /// Parameter [catalogId] :
  /// The ID of the Data Catalog where the functions to be retrieved are
  /// located. If none is provided, the AWS account ID is used by default.
  ///
  /// Parameter [databaseName] :
  /// The name of the catalog database where the functions are located.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of functions to return in one response.
  ///
  /// Parameter [nextToken] :
  /// A continuation token, if this is a continuation call.
  Future<GetUserDefinedFunctionsResponse> getUserDefinedFunctions({
    @_s.required String pattern,
    String catalogId,
    String databaseName,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(pattern, 'pattern');
    _s.validateStringLength(
      'pattern',
      pattern,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'pattern',
      pattern,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateStringPattern(
      'catalogId',
      catalogId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
    );
    _s.validateStringPattern(
      'databaseName',
      databaseName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetUserDefinedFunctions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: GetUserDefinedFunctionsRequest(
        pattern: pattern,
        catalogId: catalogId,
        databaseName: databaseName,
        maxResults: maxResults,
        nextToken: nextToken,
      ),
    );

    return GetUserDefinedFunctionsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves resource metadata for a workflow.
  ///
  /// May throw [InvalidInputException].
  /// May throw [EntityNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [name] :
  /// The name of the workflow to retrieve.
  ///
  /// Parameter [includeGraph] :
  /// Specifies whether to include a graph when returning the workflow resource
  /// metadata.
  Future<GetWorkflowResponse> getWorkflow({
    @_s.required String name,
    bool includeGraph,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetWorkflow'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: GetWorkflowRequest(
        name: name,
        includeGraph: includeGraph,
      ),
    );

    return GetWorkflowResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the metadata for a given workflow run.
  ///
  /// May throw [InvalidInputException].
  /// May throw [EntityNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [name] :
  /// Name of the workflow being run.
  ///
  /// Parameter [runId] :
  /// The ID of the workflow run.
  ///
  /// Parameter [includeGraph] :
  /// Specifies whether to include the workflow graph in response or not.
  Future<GetWorkflowRunResponse> getWorkflowRun({
    @_s.required String name,
    @_s.required String runId,
    bool includeGraph,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(runId, 'runId');
    _s.validateStringLength(
      'runId',
      runId,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'runId',
      runId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetWorkflowRun'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: GetWorkflowRunRequest(
        name: name,
        runId: runId,
        includeGraph: includeGraph,
      ),
    );

    return GetWorkflowRunResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the workflow run properties which were set during the run.
  ///
  /// May throw [InvalidInputException].
  /// May throw [EntityNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [name] :
  /// Name of the workflow which was run.
  ///
  /// Parameter [runId] :
  /// The ID of the workflow run whose run properties should be returned.
  Future<GetWorkflowRunPropertiesResponse> getWorkflowRunProperties({
    @_s.required String name,
    @_s.required String runId,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(runId, 'runId');
    _s.validateStringLength(
      'runId',
      runId,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'runId',
      runId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetWorkflowRunProperties'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: GetWorkflowRunPropertiesRequest(
        name: name,
        runId: runId,
      ),
    );

    return GetWorkflowRunPropertiesResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves metadata for all runs of a given workflow.
  ///
  /// May throw [InvalidInputException].
  /// May throw [EntityNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [name] :
  /// Name of the workflow whose metadata of runs should be returned.
  ///
  /// Parameter [includeGraph] :
  /// Specifies whether to include the workflow graph in response or not.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of workflow runs to be included in the response.
  ///
  /// Parameter [nextToken] :
  /// The maximum size of the response.
  Future<GetWorkflowRunsResponse> getWorkflowRuns({
    @_s.required String name,
    bool includeGraph,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetWorkflowRuns'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: GetWorkflowRunsRequest(
        name: name,
        includeGraph: includeGraph,
        maxResults: maxResults,
        nextToken: nextToken,
      ),
    );

    return GetWorkflowRunsResponse.fromJson(jsonResponse.body);
  }

  /// Imports an existing Amazon Athena Data Catalog to AWS Glue
  ///
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [catalogId] :
  /// The ID of the catalog to import. Currently, this should be the AWS account
  /// ID.
  Future<void> importCatalogToGlue({
    String catalogId,
  }) async {
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateStringPattern(
      'catalogId',
      catalogId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.ImportCatalogToGlue'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: ImportCatalogToGlueRequest(
        catalogId: catalogId,
      ),
    );

    return ImportCatalogToGlueResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the names of all crawler resources in this AWS account, or the
  /// resources with the specified tag. This operation allows you to see which
  /// resources are available in your account, and their names.
  ///
  /// This operation takes the optional <code>Tags</code> field, which you can
  /// use as a filter on the response so that tagged resources can be retrieved
  /// as a group. If you choose to use tags filtering, only resources with the
  /// tag are retrieved.
  ///
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [maxResults] :
  /// The maximum size of a list to return.
  ///
  /// Parameter [nextToken] :
  /// A continuation token, if this is a continuation request.
  ///
  /// Parameter [tags] :
  /// Specifies to return only these tagged resources.
  Future<ListCrawlersResponse> listCrawlers({
    int maxResults,
    String nextToken,
    Map<String, String> tags,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.ListCrawlers'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: ListCrawlersRequest(
        maxResults: maxResults,
        nextToken: nextToken,
        tags: tags,
      ),
    );

    return ListCrawlersResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the names of all <code>DevEndpoint</code> resources in this AWS
  /// account, or the resources with the specified tag. This operation allows
  /// you to see which resources are available in your account, and their names.
  ///
  /// This operation takes the optional <code>Tags</code> field, which you can
  /// use as a filter on the response so that tagged resources can be retrieved
  /// as a group. If you choose to use tags filtering, only resources with the
  /// tag are retrieved.
  ///
  /// May throw [InvalidInputException].
  /// May throw [EntityNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [maxResults] :
  /// The maximum size of a list to return.
  ///
  /// Parameter [nextToken] :
  /// A continuation token, if this is a continuation request.
  ///
  /// Parameter [tags] :
  /// Specifies to return only these tagged resources.
  Future<ListDevEndpointsResponse> listDevEndpoints({
    int maxResults,
    String nextToken,
    Map<String, String> tags,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.ListDevEndpoints'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: ListDevEndpointsRequest(
        maxResults: maxResults,
        nextToken: nextToken,
        tags: tags,
      ),
    );

    return ListDevEndpointsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the names of all job resources in this AWS account, or the
  /// resources with the specified tag. This operation allows you to see which
  /// resources are available in your account, and their names.
  ///
  /// This operation takes the optional <code>Tags</code> field, which you can
  /// use as a filter on the response so that tagged resources can be retrieved
  /// as a group. If you choose to use tags filtering, only resources with the
  /// tag are retrieved.
  ///
  /// May throw [InvalidInputException].
  /// May throw [EntityNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [maxResults] :
  /// The maximum size of a list to return.
  ///
  /// Parameter [nextToken] :
  /// A continuation token, if this is a continuation request.
  ///
  /// Parameter [tags] :
  /// Specifies to return only these tagged resources.
  Future<ListJobsResponse> listJobs({
    int maxResults,
    String nextToken,
    Map<String, String> tags,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.ListJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: ListJobsRequest(
        maxResults: maxResults,
        nextToken: nextToken,
        tags: tags,
      ),
    );

    return ListJobsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves a sortable, filterable list of existing AWS Glue machine
  /// learning transforms in this AWS account, or the resources with the
  /// specified tag. This operation takes the optional <code>Tags</code> field,
  /// which you can use as a filter of the responses so that tagged resources
  /// can be retrieved as a group. If you choose to use tag filtering, only
  /// resources with the tags are retrieved.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [OperationTimeoutException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [filter] :
  /// A <code>TransformFilterCriteria</code> used to filter the machine learning
  /// transforms.
  ///
  /// Parameter [maxResults] :
  /// The maximum size of a list to return.
  ///
  /// Parameter [nextToken] :
  /// A continuation token, if this is a continuation request.
  ///
  /// Parameter [sort] :
  /// A <code>TransformSortCriteria</code> used to sort the machine learning
  /// transforms.
  ///
  /// Parameter [tags] :
  /// Specifies to return only these tagged resources.
  Future<ListMLTransformsResponse> listMLTransforms({
    TransformFilterCriteria filter,
    int maxResults,
    String nextToken,
    TransformSortCriteria sort,
    Map<String, String> tags,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.ListMLTransforms'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: ListMLTransformsRequest(
        filter: filter,
        maxResults: maxResults,
        nextToken: nextToken,
        sort: sort,
        tags: tags,
      ),
    );

    return ListMLTransformsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the names of all trigger resources in this AWS account, or the
  /// resources with the specified tag. This operation allows you to see which
  /// resources are available in your account, and their names.
  ///
  /// This operation takes the optional <code>Tags</code> field, which you can
  /// use as a filter on the response so that tagged resources can be retrieved
  /// as a group. If you choose to use tags filtering, only resources with the
  /// tag are retrieved.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [dependentJobName] :
  /// The name of the job for which to retrieve triggers. The trigger that can
  /// start this job is returned. If there is no such trigger, all triggers are
  /// returned.
  ///
  /// Parameter [maxResults] :
  /// The maximum size of a list to return.
  ///
  /// Parameter [nextToken] :
  /// A continuation token, if this is a continuation request.
  ///
  /// Parameter [tags] :
  /// Specifies to return only these tagged resources.
  Future<ListTriggersResponse> listTriggers({
    String dependentJobName,
    int maxResults,
    String nextToken,
    Map<String, String> tags,
  }) async {
    _s.validateStringLength(
      'dependentJobName',
      dependentJobName,
      1,
      255,
    );
    _s.validateStringPattern(
      'dependentJobName',
      dependentJobName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.ListTriggers'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: ListTriggersRequest(
        dependentJobName: dependentJobName,
        maxResults: maxResults,
        nextToken: nextToken,
        tags: tags,
      ),
    );

    return ListTriggersResponse.fromJson(jsonResponse.body);
  }

  /// Lists names of workflows created in the account.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [maxResults] :
  /// The maximum size of a list to return.
  ///
  /// Parameter [nextToken] :
  /// A continuation token, if this is a continuation request.
  Future<ListWorkflowsResponse> listWorkflows({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.ListWorkflows'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: ListWorkflowsRequest(
        maxResults: maxResults,
        nextToken: nextToken,
      ),
    );

    return ListWorkflowsResponse.fromJson(jsonResponse.body);
  }

  /// Sets the security configuration for a specified catalog. After the
  /// configuration has been set, the specified encryption is applied to every
  /// catalog write thereafter.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidInputException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [dataCatalogEncryptionSettings] :
  /// The security configuration to set.
  ///
  /// Parameter [catalogId] :
  /// The ID of the Data Catalog to set the security configuration for. If none
  /// is provided, the AWS account ID is used by default.
  Future<void> putDataCatalogEncryptionSettings({
    @_s.required DataCatalogEncryptionSettings dataCatalogEncryptionSettings,
    String catalogId,
  }) async {
    ArgumentError.checkNotNull(
        dataCatalogEncryptionSettings, 'dataCatalogEncryptionSettings');
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateStringPattern(
      'catalogId',
      catalogId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.PutDataCatalogEncryptionSettings'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: PutDataCatalogEncryptionSettingsRequest(
        dataCatalogEncryptionSettings: dataCatalogEncryptionSettings,
        catalogId: catalogId,
      ),
    );

    return PutDataCatalogEncryptionSettingsResponse.fromJson(jsonResponse.body);
  }

  /// Sets the Data Catalog resource policy for access control.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [InvalidInputException].
  /// May throw [ConditionCheckFailureException].
  ///
  /// Parameter [policyInJson] :
  /// Contains the policy document to set, in JSON format.
  ///
  /// Parameter [policyExistsCondition] :
  /// A value of <code>MUST_EXIST</code> is used to update a policy. A value of
  /// <code>NOT_EXIST</code> is used to create a new policy. If a value of
  /// <code>NONE</code> or a null value is used, the call will not depend on the
  /// existence of a policy.
  ///
  /// Parameter [policyHashCondition] :
  /// The hash value returned when the previous policy was set using
  /// <code>PutResourcePolicy</code>. Its purpose is to prevent concurrent
  /// modifications of a policy. Do not use this parameter if no previous policy
  /// has been set.
  Future<PutResourcePolicyResponse> putResourcePolicy({
    @_s.required String policyInJson,
    ExistCondition policyExistsCondition,
    String policyHashCondition,
  }) async {
    ArgumentError.checkNotNull(policyInJson, 'policyInJson');
    _s.validateStringLength(
      'policyInJson',
      policyInJson,
      2,
      10240,
      isRequired: true,
    );
    _s.validateStringLength(
      'policyHashCondition',
      policyHashCondition,
      1,
      255,
    );
    _s.validateStringPattern(
      'policyHashCondition',
      policyHashCondition,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.PutResourcePolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: PutResourcePolicyRequest(
        policyInJson: policyInJson,
        policyExistsCondition: policyExistsCondition,
        policyHashCondition: policyHashCondition,
      ),
    );

    return PutResourcePolicyResponse.fromJson(jsonResponse.body);
  }

  /// Puts the specified workflow run properties for the given workflow run. If
  /// a property already exists for the specified run, then it overrides the
  /// value otherwise adds the property to existing properties.
  ///
  /// May throw [AlreadyExistsException].
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [ResourceNumberLimitExceededException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [name] :
  /// Name of the workflow which was run.
  ///
  /// Parameter [runId] :
  /// The ID of the workflow run for which the run properties should be updated.
  ///
  /// Parameter [runProperties] :
  /// The properties to put for the specified run.
  Future<void> putWorkflowRunProperties({
    @_s.required String name,
    @_s.required String runId,
    @_s.required Map<String, String> runProperties,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(runId, 'runId');
    _s.validateStringLength(
      'runId',
      runId,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'runId',
      runId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(runProperties, 'runProperties');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.PutWorkflowRunProperties'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: PutWorkflowRunPropertiesRequest(
        name: name,
        runId: runId,
        runProperties: runProperties,
      ),
    );

    return PutWorkflowRunPropertiesResponse.fromJson(jsonResponse.body);
  }

  /// Resets a bookmark entry.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [jobName] :
  /// The name of the job in question.
  ///
  /// Parameter [runId] :
  /// The unique run identifier associated with this job run.
  Future<ResetJobBookmarkResponse> resetJobBookmark({
    @_s.required String jobName,
    String runId,
  }) async {
    ArgumentError.checkNotNull(jobName, 'jobName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.ResetJobBookmark'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: ResetJobBookmarkRequest(
        jobName: jobName,
        runId: runId,
      ),
    );

    return ResetJobBookmarkResponse.fromJson(jsonResponse.body);
  }

  /// Searches a set of tables based on properties in the table metadata as well
  /// as on the parent database. You can search against text or filter
  /// conditions.
  ///
  /// You can only get tables that you have access to based on the security
  /// policies defined in Lake Formation. You need at least a read-only access
  /// to the table for it to be returned. If you do not have access to all the
  /// columns in the table, these columns will not be searched against when
  /// returning the list of tables back to you. If you have access to the
  /// columns but not the data in the columns, those columns and the associated
  /// metadata for those columns will be included in the search.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidInputException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [catalogId] :
  /// A unique identifier, consisting of <code>
  /// <i>account_id</i>/datalake</code>.
  ///
  /// Parameter [filters] :
  /// A list of key-value pairs, and a comparator used to filter the search
  /// results. Returns all entities matching the predicate.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of tables to return in a single response.
  ///
  /// Parameter [nextToken] :
  /// A continuation token, included if this is a continuation call.
  ///
  /// Parameter [searchText] :
  /// A string used for a text search.
  ///
  /// Specifying a value in quotes filters based on an exact match to the value.
  ///
  /// Parameter [sortCriteria] :
  /// A list of criteria for sorting the results by a field name, in an
  /// ascending or descending order.
  Future<SearchTablesResponse> searchTables({
    String catalogId,
    List<PropertyPredicate> filters,
    int maxResults,
    String nextToken,
    String searchText,
    List<SortCriterion> sortCriteria,
  }) async {
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateStringPattern(
      'catalogId',
      catalogId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    _s.validateStringLength(
      'searchText',
      searchText,
      0,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.SearchTables'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: SearchTablesRequest(
        catalogId: catalogId,
        filters: filters,
        maxResults: maxResults,
        nextToken: nextToken,
        searchText: searchText,
        sortCriteria: sortCriteria,
      ),
    );

    return SearchTablesResponse.fromJson(jsonResponse.body);
  }

  /// Starts a crawl using the specified crawler, regardless of what is
  /// scheduled. If the crawler is already running, returns a <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-api-exceptions.html#aws-glue-api-exceptions-CrawlerRunningException">CrawlerRunningException</a>.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [CrawlerRunningException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [name] :
  /// Name of the crawler to start.
  Future<void> startCrawler({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.StartCrawler'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: StartCrawlerRequest(
        name: name,
      ),
    );

    return StartCrawlerResponse.fromJson(jsonResponse.body);
  }

  /// Changes the schedule state of the specified crawler to
  /// <code>SCHEDULED</code>, unless the crawler is already running or the
  /// schedule state is already <code>SCHEDULED</code>.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [SchedulerRunningException].
  /// May throw [SchedulerTransitioningException].
  /// May throw [NoScheduleException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [crawlerName] :
  /// Name of the crawler to schedule.
  Future<void> startCrawlerSchedule({
    @_s.required String crawlerName,
  }) async {
    ArgumentError.checkNotNull(crawlerName, 'crawlerName');
    _s.validateStringLength(
      'crawlerName',
      crawlerName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'crawlerName',
      crawlerName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.StartCrawlerSchedule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: StartCrawlerScheduleRequest(
        crawlerName: crawlerName,
      ),
    );

    return StartCrawlerScheduleResponse.fromJson(jsonResponse.body);
  }

  /// Begins an asynchronous task to export all labeled data for a particular
  /// transform. This task is the only label-related API call that is not part
  /// of the typical active learning workflow. You typically use
  /// <code>StartExportLabelsTaskRun</code> when you want to work with all of
  /// your existing labels at the same time, such as when you want to remove or
  /// change labels that were previously submitted as truth. This API operation
  /// accepts the <code>TransformId</code> whose labels you want to export and
  /// an Amazon Simple Storage Service (Amazon S3) path to export the labels to.
  /// The operation returns a <code>TaskRunId</code>. You can check on the
  /// status of your task run by calling the <code>GetMLTaskRun</code> API.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [OperationTimeoutException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [outputS3Path] :
  /// The Amazon S3 path where you export the labels.
  ///
  /// Parameter [transformId] :
  /// The unique identifier of the machine learning transform.
  Future<StartExportLabelsTaskRunResponse> startExportLabelsTaskRun({
    @_s.required String outputS3Path,
    @_s.required String transformId,
  }) async {
    ArgumentError.checkNotNull(outputS3Path, 'outputS3Path');
    ArgumentError.checkNotNull(transformId, 'transformId');
    _s.validateStringLength(
      'transformId',
      transformId,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'transformId',
      transformId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.StartExportLabelsTaskRun'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: StartExportLabelsTaskRunRequest(
        outputS3Path: outputS3Path,
        transformId: transformId,
      ),
    );

    return StartExportLabelsTaskRunResponse.fromJson(jsonResponse.body);
  }

  /// Enables you to provide additional labels (examples of truth) to be used to
  /// teach the machine learning transform and improve its quality. This API
  /// operation is generally used as part of the active learning workflow that
  /// starts with the <code>StartMLLabelingSetGenerationTaskRun</code> call and
  /// that ultimately results in improving the quality of your machine learning
  /// transform.
  ///
  /// After the <code>StartMLLabelingSetGenerationTaskRun</code> finishes, AWS
  /// Glue machine learning will have generated a series of questions for humans
  /// to answer. (Answering these questions is often called 'labeling' in the
  /// machine learning workflows). In the case of the <code>FindMatches</code>
  /// transform, these questions are of the form, “What is the correct way to
  /// group these rows together into groups composed entirely of matching
  /// records?” After the labeling process is finished, users upload their
  /// answers/labels with a call to <code>StartImportLabelsTaskRun</code>. After
  /// <code>StartImportLabelsTaskRun</code> finishes, all future runs of the
  /// machine learning transform use the new and improved labels and perform a
  /// higher-quality transformation.
  ///
  /// By default, <code>StartMLLabelingSetGenerationTaskRun</code> continually
  /// learns from and combines all labels that you upload unless you set
  /// <code>Replace</code> to true. If you set <code>Replace</code> to true,
  /// <code>StartImportLabelsTaskRun</code> deletes and forgets all previously
  /// uploaded labels and learns only from the exact set that you upload.
  /// Replacing labels can be helpful if you realize that you previously
  /// uploaded incorrect labels, and you believe that they are having a negative
  /// effect on your transform quality.
  ///
  /// You can check on the status of your task run by calling the
  /// <code>GetMLTaskRun</code> operation.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [OperationTimeoutException].
  /// May throw [ResourceNumberLimitExceededException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [inputS3Path] :
  /// The Amazon Simple Storage Service (Amazon S3) path from where you import
  /// the labels.
  ///
  /// Parameter [transformId] :
  /// The unique identifier of the machine learning transform.
  ///
  /// Parameter [replaceAllLabels] :
  /// Indicates whether to overwrite your existing labels.
  Future<StartImportLabelsTaskRunResponse> startImportLabelsTaskRun({
    @_s.required String inputS3Path,
    @_s.required String transformId,
    bool replaceAllLabels,
  }) async {
    ArgumentError.checkNotNull(inputS3Path, 'inputS3Path');
    ArgumentError.checkNotNull(transformId, 'transformId');
    _s.validateStringLength(
      'transformId',
      transformId,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'transformId',
      transformId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.StartImportLabelsTaskRun'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: StartImportLabelsTaskRunRequest(
        inputS3Path: inputS3Path,
        transformId: transformId,
        replaceAllLabels: replaceAllLabels,
      ),
    );

    return StartImportLabelsTaskRunResponse.fromJson(jsonResponse.body);
  }

  /// Starts a job run using a job definition.
  ///
  /// May throw [InvalidInputException].
  /// May throw [EntityNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [ResourceNumberLimitExceededException].
  /// May throw [ConcurrentRunsExceededException].
  ///
  /// Parameter [jobName] :
  /// The name of the job definition to use.
  ///
  /// Parameter [allocatedCapacity] :
  /// This field is deprecated. Use <code>MaxCapacity</code> instead.
  ///
  /// The number of AWS Glue data processing units (DPUs) to allocate to this
  /// JobRun. From 2 to 100 DPUs can be allocated; the default is 10. A DPU is a
  /// relative measure of processing power that consists of 4 vCPUs of compute
  /// capacity and 16 GB of memory. For more information, see the <a
  /// href="https://docs.aws.amazon.com/https:/aws.amazon.com/glue/pricing/">AWS
  /// Glue pricing page</a>.
  ///
  /// Parameter [arguments] :
  /// The job arguments specifically for this run. For this job run, they
  /// replace the default arguments set in the job definition itself.
  ///
  /// You can specify arguments here that your own job-execution script
  /// consumes, as well as arguments that AWS Glue itself consumes.
  ///
  /// For information about how to specify and consume your own Job arguments,
  /// see the <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-python-calling.html">Calling
  /// AWS Glue APIs in Python</a> topic in the developer guide.
  ///
  /// For information about the key-value pairs that AWS Glue consumes to set up
  /// your job, see the <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-etl-glue-arguments.html">Special
  /// Parameters Used by AWS Glue</a> topic in the developer guide.
  ///
  /// Parameter [jobRunId] :
  /// The ID of a previous <code>JobRun</code> to retry.
  ///
  /// Parameter [maxCapacity] :
  /// The number of AWS Glue data processing units (DPUs) that can be allocated
  /// when this job runs. A DPU is a relative measure of processing power that
  /// consists of 4 vCPUs of compute capacity and 16 GB of memory. For more
  /// information, see the <a
  /// href="https://docs.aws.amazon.com/https:/aws.amazon.com/glue/pricing/">AWS
  /// Glue pricing page</a>.
  ///
  /// Do not set <code>Max Capacity</code> if using <code>WorkerType</code> and
  /// <code>NumberOfWorkers</code>.
  ///
  /// The value that can be allocated for <code>MaxCapacity</code> depends on
  /// whether you are running a Python shell job, or an Apache Spark ETL job:
  ///
  /// <ul>
  /// <li>
  /// When you specify a Python shell job
  /// (<code>JobCommand.Name</code>="pythonshell"), you can allocate either
  /// 0.0625 or 1 DPU. The default is 0.0625 DPU.
  /// </li>
  /// <li>
  /// When you specify an Apache Spark ETL job
  /// (<code>JobCommand.Name</code>="glueetl"), you can allocate from 2 to 100
  /// DPUs. The default is 10 DPUs. This job type cannot have a fractional DPU
  /// allocation.
  /// </li>
  /// </ul>
  ///
  /// Parameter [notificationProperty] :
  /// Specifies configuration properties of a job run notification.
  ///
  /// Parameter [numberOfWorkers] :
  /// The number of workers of a defined <code>workerType</code> that are
  /// allocated when a job runs.
  ///
  /// The maximum number of workers you can define are 299 for
  /// <code>G.1X</code>, and 149 for <code>G.2X</code>.
  ///
  /// Parameter [securityConfiguration] :
  /// The name of the <code>SecurityConfiguration</code> structure to be used
  /// with this job run.
  ///
  /// Parameter [timeout] :
  /// The <code>JobRun</code> timeout in minutes. This is the maximum time that
  /// a job run can consume resources before it is terminated and enters
  /// <code>TIMEOUT</code> status. The default is 2,880 minutes (48 hours). This
  /// overrides the timeout value set in the parent job.
  ///
  /// Parameter [workerType] :
  /// The type of predefined worker that is allocated when a job runs. Accepts a
  /// value of Standard, G.1X, or G.2X.
  ///
  /// <ul>
  /// <li>
  /// For the <code>Standard</code> worker type, each worker provides 4 vCPU, 16
  /// GB of memory and a 50GB disk, and 2 executors per worker.
  /// </li>
  /// <li>
  /// For the <code>G.1X</code> worker type, each worker provides 4 vCPU, 16 GB
  /// of memory and a 64GB disk, and 1 executor per worker.
  /// </li>
  /// <li>
  /// For the <code>G.2X</code> worker type, each worker provides 8 vCPU, 32 GB
  /// of memory and a 128GB disk, and 1 executor per worker.
  /// </li>
  /// </ul>
  Future<StartJobRunResponse> startJobRun({
    @_s.required String jobName,
    int allocatedCapacity,
    Map<String, String> arguments,
    String jobRunId,
    double maxCapacity,
    NotificationProperty notificationProperty,
    int numberOfWorkers,
    String securityConfiguration,
    int timeout,
    WorkerType workerType,
  }) async {
    ArgumentError.checkNotNull(jobName, 'jobName');
    _s.validateStringLength(
      'jobName',
      jobName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'jobName',
      jobName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'jobRunId',
      jobRunId,
      1,
      255,
    );
    _s.validateStringPattern(
      'jobRunId',
      jobRunId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    _s.validateStringLength(
      'securityConfiguration',
      securityConfiguration,
      1,
      255,
    );
    _s.validateStringPattern(
      'securityConfiguration',
      securityConfiguration,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    _s.validateNumRange(
      'timeout',
      timeout,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.StartJobRun'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: StartJobRunRequest(
        jobName: jobName,
        allocatedCapacity: allocatedCapacity,
        arguments: arguments,
        jobRunId: jobRunId,
        maxCapacity: maxCapacity,
        notificationProperty: notificationProperty,
        numberOfWorkers: numberOfWorkers,
        securityConfiguration: securityConfiguration,
        timeout: timeout,
        workerType: workerType,
      ),
    );

    return StartJobRunResponse.fromJson(jsonResponse.body);
  }

  /// Starts a task to estimate the quality of the transform.
  ///
  /// When you provide label sets as examples of truth, AWS Glue machine
  /// learning uses some of those examples to learn from them. The rest of the
  /// labels are used as a test to estimate quality.
  ///
  /// Returns a unique identifier for the run. You can call
  /// <code>GetMLTaskRun</code> to get more information about the stats of the
  /// <code>EvaluationTaskRun</code>.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [OperationTimeoutException].
  /// May throw [InternalServiceException].
  /// May throw [ConcurrentRunsExceededException].
  /// May throw [MLTransformNotReadyException].
  ///
  /// Parameter [transformId] :
  /// The unique identifier of the machine learning transform.
  Future<StartMLEvaluationTaskRunResponse> startMLEvaluationTaskRun({
    @_s.required String transformId,
  }) async {
    ArgumentError.checkNotNull(transformId, 'transformId');
    _s.validateStringLength(
      'transformId',
      transformId,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'transformId',
      transformId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.StartMLEvaluationTaskRun'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: StartMLEvaluationTaskRunRequest(
        transformId: transformId,
      ),
    );

    return StartMLEvaluationTaskRunResponse.fromJson(jsonResponse.body);
  }

  /// Starts the active learning workflow for your machine learning transform to
  /// improve the transform's quality by generating label sets and adding
  /// labels.
  ///
  /// When the <code>StartMLLabelingSetGenerationTaskRun</code> finishes, AWS
  /// Glue will have generated a "labeling set" or a set of questions for humans
  /// to answer.
  ///
  /// In the case of the <code>FindMatches</code> transform, these questions are
  /// of the form, “What is the correct way to group these rows together into
  /// groups composed entirely of matching records?”
  ///
  /// After the labeling process is finished, you can upload your labels with a
  /// call to <code>StartImportLabelsTaskRun</code>. After
  /// <code>StartImportLabelsTaskRun</code> finishes, all future runs of the
  /// machine learning transform will use the new and improved labels and
  /// perform a higher-quality transformation.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [OperationTimeoutException].
  /// May throw [InternalServiceException].
  /// May throw [ConcurrentRunsExceededException].
  ///
  /// Parameter [outputS3Path] :
  /// The Amazon Simple Storage Service (Amazon S3) path where you generate the
  /// labeling set.
  ///
  /// Parameter [transformId] :
  /// The unique identifier of the machine learning transform.
  Future<StartMLLabelingSetGenerationTaskRunResponse>
      startMLLabelingSetGenerationTaskRun({
    @_s.required String outputS3Path,
    @_s.required String transformId,
  }) async {
    ArgumentError.checkNotNull(outputS3Path, 'outputS3Path');
    ArgumentError.checkNotNull(transformId, 'transformId');
    _s.validateStringLength(
      'transformId',
      transformId,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'transformId',
      transformId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.StartMLLabelingSetGenerationTaskRun'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: StartMLLabelingSetGenerationTaskRunRequest(
        outputS3Path: outputS3Path,
        transformId: transformId,
      ),
    );

    return StartMLLabelingSetGenerationTaskRunResponse.fromJson(
        jsonResponse.body);
  }

  /// Starts an existing trigger. See <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/trigger-job.html">Triggering
  /// Jobs</a> for information about how different types of trigger are started.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [EntityNotFoundException].
  /// May throw [OperationTimeoutException].
  /// May throw [ResourceNumberLimitExceededException].
  /// May throw [ConcurrentRunsExceededException].
  ///
  /// Parameter [name] :
  /// The name of the trigger to start.
  Future<StartTriggerResponse> startTrigger({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.StartTrigger'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: StartTriggerRequest(
        name: name,
      ),
    );

    return StartTriggerResponse.fromJson(jsonResponse.body);
  }

  /// Starts a new run of the specified workflow.
  ///
  /// May throw [InvalidInputException].
  /// May throw [EntityNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [ResourceNumberLimitExceededException].
  /// May throw [ConcurrentRunsExceededException].
  ///
  /// Parameter [name] :
  /// The name of the workflow to start.
  Future<StartWorkflowRunResponse> startWorkflowRun({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.StartWorkflowRun'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: StartWorkflowRunRequest(
        name: name,
      ),
    );

    return StartWorkflowRunResponse.fromJson(jsonResponse.body);
  }

  /// If the specified crawler is running, stops the crawl.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [CrawlerNotRunningException].
  /// May throw [CrawlerStoppingException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [name] :
  /// Name of the crawler to stop.
  Future<void> stopCrawler({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.StopCrawler'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: StopCrawlerRequest(
        name: name,
      ),
    );

    return StopCrawlerResponse.fromJson(jsonResponse.body);
  }

  /// Sets the schedule state of the specified crawler to
  /// <code>NOT_SCHEDULED</code>, but does not stop the crawler if it is already
  /// running.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [SchedulerNotRunningException].
  /// May throw [SchedulerTransitioningException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [crawlerName] :
  /// Name of the crawler whose schedule state to set.
  Future<void> stopCrawlerSchedule({
    @_s.required String crawlerName,
  }) async {
    ArgumentError.checkNotNull(crawlerName, 'crawlerName');
    _s.validateStringLength(
      'crawlerName',
      crawlerName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'crawlerName',
      crawlerName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.StopCrawlerSchedule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: StopCrawlerScheduleRequest(
        crawlerName: crawlerName,
      ),
    );

    return StopCrawlerScheduleResponse.fromJson(jsonResponse.body);
  }

  /// Stops a specified trigger.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [EntityNotFoundException].
  /// May throw [OperationTimeoutException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [name] :
  /// The name of the trigger to stop.
  Future<StopTriggerResponse> stopTrigger({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.StopTrigger'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: StopTriggerRequest(
        name: name,
      ),
    );

    return StopTriggerResponse.fromJson(jsonResponse.body);
  }

  /// Adds tags to a resource. A tag is a label you can assign to an AWS
  /// resource. In AWS Glue, you can tag only certain resources. For information
  /// about what resources you can tag, see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/monitor-tags.html">AWS
  /// Tags in AWS Glue</a>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [EntityNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the AWS Glue resource to which to add the tags. For more
  /// information about AWS Glue resource ARNs, see the <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-api-common.html#aws-glue-api-regex-aws-glue-arn-id">AWS
  /// Glue ARN string pattern</a>.
  ///
  /// Parameter [tagsToAdd] :
  /// Tags to add to this resource.
  Future<void> tagResource({
    @_s.required String resourceArn,
    @_s.required Map<String, String> tagsToAdd,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      10240,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''arn:aws:glue:.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagsToAdd, 'tagsToAdd');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.TagResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: TagResourceRequest(
        resourceArn: resourceArn,
        tagsToAdd: tagsToAdd,
      ),
    );

    return TagResourceResponse.fromJson(jsonResponse.body);
  }

  /// Removes tags from a resource.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [EntityNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource from which to remove the
  /// tags.
  ///
  /// Parameter [tagsToRemove] :
  /// Tags to remove from this resource.
  Future<void> untagResource({
    @_s.required String resourceArn,
    @_s.required List<String> tagsToRemove,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      10240,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''arn:aws:glue:.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagsToRemove, 'tagsToRemove');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.UntagResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: UntagResourceRequest(
        resourceArn: resourceArn,
        tagsToRemove: tagsToRemove,
      ),
    );

    return UntagResourceResponse.fromJson(jsonResponse.body);
  }

  /// Modifies an existing classifier (a <code>GrokClassifier</code>, an
  /// <code>XMLClassifier</code>, a <code>JsonClassifier</code>, or a
  /// <code>CsvClassifier</code>, depending on which field is present).
  ///
  /// May throw [InvalidInputException].
  /// May throw [VersionMismatchException].
  /// May throw [EntityNotFoundException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [csvClassifier] :
  /// A <code>CsvClassifier</code> object with updated fields.
  ///
  /// Parameter [grokClassifier] :
  /// A <code>GrokClassifier</code> object with updated fields.
  ///
  /// Parameter [jsonClassifier] :
  /// A <code>JsonClassifier</code> object with updated fields.
  ///
  /// Parameter [xMLClassifier] :
  /// An <code>XMLClassifier</code> object with updated fields.
  Future<void> updateClassifier({
    UpdateCsvClassifierRequest csvClassifier,
    UpdateGrokClassifierRequest grokClassifier,
    UpdateJsonClassifierRequest jsonClassifier,
    UpdateXMLClassifierRequest xMLClassifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.UpdateClassifier'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: UpdateClassifierRequest(
        csvClassifier: csvClassifier,
        grokClassifier: grokClassifier,
        jsonClassifier: jsonClassifier,
        xMLClassifier: xMLClassifier,
      ),
    );

    return UpdateClassifierResponse.fromJson(jsonResponse.body);
  }

  /// Updates a connection definition in the Data Catalog.
  ///
  /// May throw [InvalidInputException].
  /// May throw [EntityNotFoundException].
  /// May throw [OperationTimeoutException].
  /// May throw [InvalidInputException].
  /// May throw [GlueEncryptionException].
  ///
  /// Parameter [connectionInput] :
  /// A <code>ConnectionInput</code> object that redefines the connection in
  /// question.
  ///
  /// Parameter [name] :
  /// The name of the connection definition to update.
  ///
  /// Parameter [catalogId] :
  /// The ID of the Data Catalog in which the connection resides. If none is
  /// provided, the AWS account ID is used by default.
  Future<void> updateConnection({
    @_s.required ConnectionInput connectionInput,
    @_s.required String name,
    String catalogId,
  }) async {
    ArgumentError.checkNotNull(connectionInput, 'connectionInput');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateStringPattern(
      'catalogId',
      catalogId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.UpdateConnection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: UpdateConnectionRequest(
        connectionInput: connectionInput,
        name: name,
        catalogId: catalogId,
      ),
    );

    return UpdateConnectionResponse.fromJson(jsonResponse.body);
  }

  /// Updates a crawler. If a crawler is running, you must stop it using
  /// <code>StopCrawler</code> before updating it.
  ///
  /// May throw [InvalidInputException].
  /// May throw [VersionMismatchException].
  /// May throw [EntityNotFoundException].
  /// May throw [CrawlerRunningException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [name] :
  /// Name of the new crawler.
  ///
  /// Parameter [classifiers] :
  /// A list of custom classifiers that the user has registered. By default, all
  /// built-in classifiers are included in a crawl, but these custom classifiers
  /// always override the default classifiers for a given classification.
  ///
  /// Parameter [configuration] :
  /// The crawler configuration information. This versioned JSON string allows
  /// users to specify aspects of a crawler's behavior. For more information,
  /// see <a
  /// href="http://docs.aws.amazon.com/glue/latest/dg/crawler-configuration.html">Configuring
  /// a Crawler</a>.
  ///
  /// Parameter [crawlerSecurityConfiguration] :
  /// The name of the <code>SecurityConfiguration</code> structure to be used by
  /// this crawler.
  ///
  /// Parameter [databaseName] :
  /// The AWS Glue database where results are stored, such as:
  /// <code>arn:aws:daylight:us-east-1::database/sometable/*</code>.
  ///
  /// Parameter [description] :
  /// A description of the new crawler.
  ///
  /// Parameter [role] :
  /// The IAM role or Amazon Resource Name (ARN) of an IAM role that is used by
  /// the new crawler to access customer resources.
  ///
  /// Parameter [schedule] :
  /// A <code>cron</code> expression used to specify the schedule. For more
  /// information, see <a
  /// href="http://docs.aws.amazon.com/glue/latest/dg/monitor-data-warehouse-schedule.html">Time-Based
  /// Schedules for Jobs and Crawlers</a>. For example, to run something every
  /// day at 12:15 UTC, specify <code>cron(15 12 * * ? *)</code>.
  ///
  /// Parameter [schemaChangePolicy] :
  /// The policy for the crawler's update and deletion behavior.
  ///
  /// Parameter [tablePrefix] :
  /// The table prefix used for catalog tables that are created.
  ///
  /// Parameter [targets] :
  /// A list of targets to crawl.
  Future<void> updateCrawler({
    @_s.required String name,
    List<String> classifiers,
    String configuration,
    String crawlerSecurityConfiguration,
    String databaseName,
    String description,
    String role,
    String schedule,
    SchemaChangePolicy schemaChangePolicy,
    String tablePrefix,
    CrawlerTargets targets,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'crawlerSecurityConfiguration',
      crawlerSecurityConfiguration,
      0,
      128,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      2048,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringLength(
      'tablePrefix',
      tablePrefix,
      0,
      128,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.UpdateCrawler'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: UpdateCrawlerRequest(
        name: name,
        classifiers: classifiers,
        configuration: configuration,
        crawlerSecurityConfiguration: crawlerSecurityConfiguration,
        databaseName: databaseName,
        description: description,
        role: role,
        schedule: schedule,
        schemaChangePolicy: schemaChangePolicy,
        tablePrefix: tablePrefix,
        targets: targets,
      ),
    );

    return UpdateCrawlerResponse.fromJson(jsonResponse.body);
  }

  /// Updates the schedule of a crawler using a <code>cron</code> expression.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [VersionMismatchException].
  /// May throw [SchedulerTransitioningException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [crawlerName] :
  /// The name of the crawler whose schedule to update.
  ///
  /// Parameter [schedule] :
  /// The updated <code>cron</code> expression used to specify the schedule. For
  /// more information, see <a
  /// href="http://docs.aws.amazon.com/glue/latest/dg/monitor-data-warehouse-schedule.html">Time-Based
  /// Schedules for Jobs and Crawlers</a>. For example, to run something every
  /// day at 12:15 UTC, specify <code>cron(15 12 * * ? *)</code>.
  Future<void> updateCrawlerSchedule({
    @_s.required String crawlerName,
    String schedule,
  }) async {
    ArgumentError.checkNotNull(crawlerName, 'crawlerName');
    _s.validateStringLength(
      'crawlerName',
      crawlerName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'crawlerName',
      crawlerName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.UpdateCrawlerSchedule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: UpdateCrawlerScheduleRequest(
        crawlerName: crawlerName,
        schedule: schedule,
      ),
    );

    return UpdateCrawlerScheduleResponse.fromJson(jsonResponse.body);
  }

  /// Updates an existing database definition in a Data Catalog.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [GlueEncryptionException].
  ///
  /// Parameter [databaseInput] :
  /// A <code>DatabaseInput</code> object specifying the new definition of the
  /// metadata database in the catalog.
  ///
  /// Parameter [name] :
  /// The name of the database to update in the catalog. For Hive compatibility,
  /// this is folded to lowercase.
  ///
  /// Parameter [catalogId] :
  /// The ID of the Data Catalog in which the metadata database resides. If none
  /// is provided, the AWS account ID is used by default.
  Future<void> updateDatabase({
    @_s.required DatabaseInput databaseInput,
    @_s.required String name,
    String catalogId,
  }) async {
    ArgumentError.checkNotNull(databaseInput, 'databaseInput');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateStringPattern(
      'catalogId',
      catalogId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.UpdateDatabase'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: UpdateDatabaseRequest(
        databaseInput: databaseInput,
        name: name,
        catalogId: catalogId,
      ),
    );

    return UpdateDatabaseResponse.fromJson(jsonResponse.body);
  }

  /// Updates a specified development endpoint.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [InvalidInputException].
  /// May throw [ValidationException].
  ///
  /// Parameter [endpointName] :
  /// The name of the <code>DevEndpoint</code> to be updated.
  ///
  /// Parameter [addArguments] :
  /// The map of arguments to add the map of arguments used to configure the
  /// <code>DevEndpoint</code>.
  ///
  /// Valid arguments are:
  ///
  /// <ul>
  /// <li>
  /// <code>"--enable-glue-datacatalog": ""</code>
  /// </li>
  /// <li>
  /// <code>"GLUE_PYTHON_VERSION": "3"</code>
  /// </li>
  /// <li>
  /// <code>"GLUE_PYTHON_VERSION": "2"</code>
  /// </li>
  /// </ul>
  /// You can specify a version of Python support for development endpoints by
  /// using the <code>Arguments</code> parameter in the
  /// <code>CreateDevEndpoint</code> or <code>UpdateDevEndpoint</code> APIs. If
  /// no arguments are provided, the version defaults to Python 2.
  ///
  /// Parameter [addPublicKeys] :
  /// The list of public keys for the <code>DevEndpoint</code> to use.
  ///
  /// Parameter [customLibraries] :
  /// Custom Python or Java libraries to be loaded in the
  /// <code>DevEndpoint</code>.
  ///
  /// Parameter [deleteArguments] :
  /// The list of argument keys to be deleted from the map of arguments used to
  /// configure the <code>DevEndpoint</code>.
  ///
  /// Parameter [deletePublicKeys] :
  /// The list of public keys to be deleted from the <code>DevEndpoint</code>.
  ///
  /// Parameter [publicKey] :
  /// The public key for the <code>DevEndpoint</code> to use.
  ///
  /// Parameter [updateEtlLibraries] :
  /// <code>True</code> if the list of custom libraries to be loaded in the
  /// development endpoint needs to be updated, or <code>False</code> if
  /// otherwise.
  Future<void> updateDevEndpoint({
    @_s.required String endpointName,
    Map<String, String> addArguments,
    List<String> addPublicKeys,
    DevEndpointCustomLibraries customLibraries,
    List<String> deleteArguments,
    List<String> deletePublicKeys,
    String publicKey,
    bool updateEtlLibraries,
  }) async {
    ArgumentError.checkNotNull(endpointName, 'endpointName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.UpdateDevEndpoint'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: UpdateDevEndpointRequest(
        endpointName: endpointName,
        addArguments: addArguments,
        addPublicKeys: addPublicKeys,
        customLibraries: customLibraries,
        deleteArguments: deleteArguments,
        deletePublicKeys: deletePublicKeys,
        publicKey: publicKey,
        updateEtlLibraries: updateEtlLibraries,
      ),
    );

    return UpdateDevEndpointResponse.fromJson(jsonResponse.body);
  }

  /// Updates an existing job definition.
  ///
  /// May throw [InvalidInputException].
  /// May throw [EntityNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [jobName] :
  /// The name of the job definition to update.
  ///
  /// Parameter [jobUpdate] :
  /// Specifies the values with which to update the job definition.
  Future<UpdateJobResponse> updateJob({
    @_s.required String jobName,
    @_s.required JobUpdate jobUpdate,
  }) async {
    ArgumentError.checkNotNull(jobName, 'jobName');
    _s.validateStringLength(
      'jobName',
      jobName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'jobName',
      jobName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(jobUpdate, 'jobUpdate');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.UpdateJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: UpdateJobRequest(
        jobName: jobName,
        jobUpdate: jobUpdate,
      ),
    );

    return UpdateJobResponse.fromJson(jsonResponse.body);
  }

  /// Updates an existing machine learning transform. Call this operation to
  /// tune the algorithm parameters to achieve better results.
  ///
  /// After calling this operation, you can call the
  /// <code>StartMLEvaluationTaskRun</code> operation to assess how well your
  /// new parameters achieved your goals (such as improving the quality of your
  /// machine learning transform, or making it more cost-effective).
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [OperationTimeoutException].
  /// May throw [InternalServiceException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [transformId] :
  /// A unique identifier that was generated when the transform was created.
  ///
  /// Parameter [description] :
  /// A description of the transform. The default is an empty string.
  ///
  /// Parameter [glueVersion] :
  /// This value determines which version of AWS Glue this machine learning
  /// transform is compatible with. Glue 1.0 is recommended for most customers.
  /// If the value is not set, the Glue compatibility defaults to Glue 0.9. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/release-notes.html#release-notes-versions">AWS
  /// Glue Versions</a> in the developer guide.
  ///
  /// Parameter [maxCapacity] :
  /// The number of AWS Glue data processing units (DPUs) that are allocated to
  /// task runs for this transform. You can allocate from 2 to 100 DPUs; the
  /// default is 10. A DPU is a relative measure of processing power that
  /// consists of 4 vCPUs of compute capacity and 16 GB of memory. For more
  /// information, see the <a href="https://aws.amazon.com/glue/pricing/">AWS
  /// Glue pricing page</a>.
  ///
  /// When the <code>WorkerType</code> field is set to a value other than
  /// <code>Standard</code>, the <code>MaxCapacity</code> field is set
  /// automatically and becomes read-only.
  ///
  /// Parameter [maxRetries] :
  /// The maximum number of times to retry a task for this transform after a
  /// task run fails.
  ///
  /// Parameter [name] :
  /// The unique name that you gave the transform when you created it.
  ///
  /// Parameter [numberOfWorkers] :
  /// The number of workers of a defined <code>workerType</code> that are
  /// allocated when this task runs.
  ///
  /// Parameter [parameters] :
  /// The configuration parameters that are specific to the transform type
  /// (algorithm) used. Conditionally dependent on the transform type.
  ///
  /// Parameter [role] :
  /// The name or Amazon Resource Name (ARN) of the IAM role with the required
  /// permissions.
  ///
  /// Parameter [timeout] :
  /// The timeout for a task run for this transform in minutes. This is the
  /// maximum time that a task run for this transform can consume resources
  /// before it is terminated and enters <code>TIMEOUT</code> status. The
  /// default is 2,880 minutes (48 hours).
  ///
  /// Parameter [workerType] :
  /// The type of predefined worker that is allocated when this task runs.
  /// Accepts a value of Standard, G.1X, or G.2X.
  ///
  /// <ul>
  /// <li>
  /// For the <code>Standard</code> worker type, each worker provides 4 vCPU, 16
  /// GB of memory and a 50GB disk, and 2 executors per worker.
  /// </li>
  /// <li>
  /// For the <code>G.1X</code> worker type, each worker provides 4 vCPU, 16 GB
  /// of memory and a 64GB disk, and 1 executor per worker.
  /// </li>
  /// <li>
  /// For the <code>G.2X</code> worker type, each worker provides 8 vCPU, 32 GB
  /// of memory and a 128GB disk, and 1 executor per worker.
  /// </li>
  /// </ul>
  Future<UpdateMLTransformResponse> updateMLTransform({
    @_s.required String transformId,
    String description,
    String glueVersion,
    double maxCapacity,
    int maxRetries,
    String name,
    int numberOfWorkers,
    TransformParameters parameters,
    String role,
    int timeout,
    WorkerType workerType,
  }) async {
    ArgumentError.checkNotNull(transformId, 'transformId');
    _s.validateStringLength(
      'transformId',
      transformId,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'transformId',
      transformId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      2048,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringLength(
      'glueVersion',
      glueVersion,
      1,
      255,
    );
    _s.validateStringPattern(
      'glueVersion',
      glueVersion,
      r'''^\w+\.\w+$''',
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    _s.validateNumRange(
      'timeout',
      timeout,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.UpdateMLTransform'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: UpdateMLTransformRequest(
        transformId: transformId,
        description: description,
        glueVersion: glueVersion,
        maxCapacity: maxCapacity,
        maxRetries: maxRetries,
        name: name,
        numberOfWorkers: numberOfWorkers,
        parameters: parameters,
        role: role,
        timeout: timeout,
        workerType: workerType,
      ),
    );

    return UpdateMLTransformResponse.fromJson(jsonResponse.body);
  }

  /// Updates a partition.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [GlueEncryptionException].
  ///
  /// Parameter [databaseName] :
  /// The name of the catalog database in which the table in question resides.
  ///
  /// Parameter [partitionInput] :
  /// The new partition object to update the partition to.
  ///
  /// Parameter [partitionValueList] :
  /// A list of the values defining the partition.
  ///
  /// Parameter [tableName] :
  /// The name of the table in which the partition to be updated is located.
  ///
  /// Parameter [catalogId] :
  /// The ID of the Data Catalog where the partition to be updated resides. If
  /// none is provided, the AWS account ID is used by default.
  Future<void> updatePartition({
    @_s.required String databaseName,
    @_s.required PartitionInput partitionInput,
    @_s.required List<String> partitionValueList,
    @_s.required String tableName,
    String catalogId,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'databaseName',
      databaseName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(partitionInput, 'partitionInput');
    ArgumentError.checkNotNull(partitionValueList, 'partitionValueList');
    ArgumentError.checkNotNull(tableName, 'tableName');
    _s.validateStringLength(
      'tableName',
      tableName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tableName',
      tableName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateStringPattern(
      'catalogId',
      catalogId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.UpdatePartition'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: UpdatePartitionRequest(
        databaseName: databaseName,
        partitionInput: partitionInput,
        partitionValueList: partitionValueList,
        tableName: tableName,
        catalogId: catalogId,
      ),
    );

    return UpdatePartitionResponse.fromJson(jsonResponse.body);
  }

  /// Updates a metadata table in the Data Catalog.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ResourceNumberLimitExceededException].
  /// May throw [GlueEncryptionException].
  ///
  /// Parameter [databaseName] :
  /// The name of the catalog database in which the table resides. For Hive
  /// compatibility, this name is entirely lowercase.
  ///
  /// Parameter [tableInput] :
  /// An updated <code>TableInput</code> object to define the metadata table in
  /// the catalog.
  ///
  /// Parameter [catalogId] :
  /// The ID of the Data Catalog where the table resides. If none is provided,
  /// the AWS account ID is used by default.
  ///
  /// Parameter [skipArchive] :
  /// By default, <code>UpdateTable</code> always creates an archived version of
  /// the table before updating it. However, if <code>skipArchive</code> is set
  /// to true, <code>UpdateTable</code> does not create the archived version.
  Future<void> updateTable({
    @_s.required String databaseName,
    @_s.required TableInput tableInput,
    String catalogId,
    bool skipArchive,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'databaseName',
      databaseName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tableInput, 'tableInput');
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateStringPattern(
      'catalogId',
      catalogId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.UpdateTable'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: UpdateTableRequest(
        databaseName: databaseName,
        tableInput: tableInput,
        catalogId: catalogId,
        skipArchive: skipArchive,
      ),
    );

    return UpdateTableResponse.fromJson(jsonResponse.body);
  }

  /// Updates a trigger definition.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [EntityNotFoundException].
  /// May throw [OperationTimeoutException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [name] :
  /// The name of the trigger to update.
  ///
  /// Parameter [triggerUpdate] :
  /// The new values with which to update the trigger.
  Future<UpdateTriggerResponse> updateTrigger({
    @_s.required String name,
    @_s.required TriggerUpdate triggerUpdate,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(triggerUpdate, 'triggerUpdate');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.UpdateTrigger'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: UpdateTriggerRequest(
        name: name,
        triggerUpdate: triggerUpdate,
      ),
    );

    return UpdateTriggerResponse.fromJson(jsonResponse.body);
  }

  /// Updates an existing function definition in the Data Catalog.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [GlueEncryptionException].
  ///
  /// Parameter [databaseName] :
  /// The name of the catalog database where the function to be updated is
  /// located.
  ///
  /// Parameter [functionInput] :
  /// A <code>FunctionInput</code> object that redefines the function in the
  /// Data Catalog.
  ///
  /// Parameter [functionName] :
  /// The name of the function.
  ///
  /// Parameter [catalogId] :
  /// The ID of the Data Catalog where the function to be updated is located. If
  /// none is provided, the AWS account ID is used by default.
  Future<void> updateUserDefinedFunction({
    @_s.required String databaseName,
    @_s.required UserDefinedFunctionInput functionInput,
    @_s.required String functionName,
    String catalogId,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'databaseName',
      databaseName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(functionInput, 'functionInput');
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'functionName',
      functionName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateStringPattern(
      'catalogId',
      catalogId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.UpdateUserDefinedFunction'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: UpdateUserDefinedFunctionRequest(
        databaseName: databaseName,
        functionInput: functionInput,
        functionName: functionName,
        catalogId: catalogId,
      ),
    );

    return UpdateUserDefinedFunctionResponse.fromJson(jsonResponse.body);
  }

  /// Updates an existing workflow.
  ///
  /// May throw [InvalidInputException].
  /// May throw [EntityNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [name] :
  /// Name of the workflow to be updated.
  ///
  /// Parameter [defaultRunProperties] :
  /// A collection of properties to be used as part of each execution of the
  /// workflow.
  ///
  /// Parameter [description] :
  /// The description of the workflow.
  Future<UpdateWorkflowResponse> updateWorkflow({
    @_s.required String name,
    Map<String, String> defaultRunProperties,
    String description,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.UpdateWorkflow'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: UpdateWorkflowRequest(
        name: name,
        defaultRunProperties: defaultRunProperties,
        description: description,
      ),
    );

    return UpdateWorkflowResponse.fromJson(jsonResponse.body);
  }
}

/// Defines an action to be initiated by a trigger.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Action {
  /// The job arguments used when this trigger fires. For this job run, they
  /// replace the default arguments set in the job definition itself.
  ///
  /// You can specify arguments here that your own job-execution script consumes,
  /// as well as arguments that AWS Glue itself consumes.
  ///
  /// For information about how to specify and consume your own Job arguments, see
  /// the <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-python-calling.html">Calling
  /// AWS Glue APIs in Python</a> topic in the developer guide.
  ///
  /// For information about the key-value pairs that AWS Glue consumes to set up
  /// your job, see the <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-etl-glue-arguments.html">Special
  /// Parameters Used by AWS Glue</a> topic in the developer guide.
  @_s.JsonKey(name: 'Arguments')
  final Map<String, String> arguments;

  /// The name of the crawler to be used with this action.
  @_s.JsonKey(name: 'CrawlerName')
  final String crawlerName;

  /// The name of a job to be executed.
  @_s.JsonKey(name: 'JobName')
  final String jobName;

  /// Specifies configuration properties of a job run notification.
  @_s.JsonKey(name: 'NotificationProperty')
  final NotificationProperty notificationProperty;

  /// The name of the <code>SecurityConfiguration</code> structure to be used with
  /// this action.
  @_s.JsonKey(name: 'SecurityConfiguration')
  final String securityConfiguration;

  /// The <code>JobRun</code> timeout in minutes. This is the maximum time that a
  /// job run can consume resources before it is terminated and enters
  /// <code>TIMEOUT</code> status. The default is 2,880 minutes (48 hours). This
  /// overrides the timeout value set in the parent job.
  @_s.JsonKey(name: 'Timeout')
  final int timeout;

  Action({
    this.arguments,
    this.crawlerName,
    this.jobName,
    this.notificationProperty,
    this.securityConfiguration,
    this.timeout,
  });
  factory Action.fromJson(Map<String, dynamic> json) => _$ActionFromJson(json);

  Map<String, dynamic> toJson() => _$ActionToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BatchCreatePartitionRequest {
  /// The name of the metadata database in which the partition is to be created.
  @_s.JsonKey(name: 'DatabaseName')
  final String databaseName;

  /// A list of <code>PartitionInput</code> structures that define the partitions
  /// to be created.
  @_s.JsonKey(name: 'PartitionInputList')
  final List<PartitionInput> partitionInputList;

  /// The name of the metadata table in which the partition is to be created.
  @_s.JsonKey(name: 'TableName')
  final String tableName;

  /// The ID of the catalog in which the partition is to be created. Currently,
  /// this should be the AWS account ID.
  @_s.JsonKey(name: 'CatalogId')
  final String catalogId;

  BatchCreatePartitionRequest({
    @_s.required this.databaseName,
    @_s.required this.partitionInputList,
    @_s.required this.tableName,
    this.catalogId,
  });
  Map<String, dynamic> toJson() => _$BatchCreatePartitionRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchCreatePartitionResponse {
  /// The errors encountered when trying to create the requested partitions.
  @_s.JsonKey(name: 'Errors')
  final List<PartitionError> errors;

  BatchCreatePartitionResponse({
    this.errors,
  });
  factory BatchCreatePartitionResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchCreatePartitionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BatchDeleteConnectionRequest {
  /// A list of names of the connections to delete.
  @_s.JsonKey(name: 'ConnectionNameList')
  final List<String> connectionNameList;

  /// The ID of the Data Catalog in which the connections reside. If none is
  /// provided, the AWS account ID is used by default.
  @_s.JsonKey(name: 'CatalogId')
  final String catalogId;

  BatchDeleteConnectionRequest({
    @_s.required this.connectionNameList,
    this.catalogId,
  });
  Map<String, dynamic> toJson() => _$BatchDeleteConnectionRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchDeleteConnectionResponse {
  /// A map of the names of connections that were not successfully deleted to
  /// error details.
  @_s.JsonKey(name: 'Errors')
  final Map<String, ErrorDetail> errors;

  /// A list of names of the connection definitions that were successfully
  /// deleted.
  @_s.JsonKey(name: 'Succeeded')
  final List<String> succeeded;

  BatchDeleteConnectionResponse({
    this.errors,
    this.succeeded,
  });
  factory BatchDeleteConnectionResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchDeleteConnectionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BatchDeletePartitionRequest {
  /// The name of the catalog database in which the table in question resides.
  @_s.JsonKey(name: 'DatabaseName')
  final String databaseName;

  /// A list of <code>PartitionInput</code> structures that define the partitions
  /// to be deleted.
  @_s.JsonKey(name: 'PartitionsToDelete')
  final List<PartitionValueList> partitionsToDelete;

  /// The name of the table that contains the partitions to be deleted.
  @_s.JsonKey(name: 'TableName')
  final String tableName;

  /// The ID of the Data Catalog where the partition to be deleted resides. If
  /// none is provided, the AWS account ID is used by default.
  @_s.JsonKey(name: 'CatalogId')
  final String catalogId;

  BatchDeletePartitionRequest({
    @_s.required this.databaseName,
    @_s.required this.partitionsToDelete,
    @_s.required this.tableName,
    this.catalogId,
  });
  Map<String, dynamic> toJson() => _$BatchDeletePartitionRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchDeletePartitionResponse {
  /// The errors encountered when trying to delete the requested partitions.
  @_s.JsonKey(name: 'Errors')
  final List<PartitionError> errors;

  BatchDeletePartitionResponse({
    this.errors,
  });
  factory BatchDeletePartitionResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchDeletePartitionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BatchDeleteTableRequest {
  /// The name of the catalog database in which the tables to delete reside. For
  /// Hive compatibility, this name is entirely lowercase.
  @_s.JsonKey(name: 'DatabaseName')
  final String databaseName;

  /// A list of the table to delete.
  @_s.JsonKey(name: 'TablesToDelete')
  final List<String> tablesToDelete;

  /// The ID of the Data Catalog where the table resides. If none is provided, the
  /// AWS account ID is used by default.
  @_s.JsonKey(name: 'CatalogId')
  final String catalogId;

  BatchDeleteTableRequest({
    @_s.required this.databaseName,
    @_s.required this.tablesToDelete,
    this.catalogId,
  });
  Map<String, dynamic> toJson() => _$BatchDeleteTableRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchDeleteTableResponse {
  /// A list of errors encountered in attempting to delete the specified tables.
  @_s.JsonKey(name: 'Errors')
  final List<TableError> errors;

  BatchDeleteTableResponse({
    this.errors,
  });
  factory BatchDeleteTableResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchDeleteTableResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BatchDeleteTableVersionRequest {
  /// The database in the catalog in which the table resides. For Hive
  /// compatibility, this name is entirely lowercase.
  @_s.JsonKey(name: 'DatabaseName')
  final String databaseName;

  /// The name of the table. For Hive compatibility, this name is entirely
  /// lowercase.
  @_s.JsonKey(name: 'TableName')
  final String tableName;

  /// A list of the IDs of versions to be deleted. A <code>VersionId</code> is a
  /// string representation of an integer. Each version is incremented by 1.
  @_s.JsonKey(name: 'VersionIds')
  final List<String> versionIds;

  /// The ID of the Data Catalog where the tables reside. If none is provided, the
  /// AWS account ID is used by default.
  @_s.JsonKey(name: 'CatalogId')
  final String catalogId;

  BatchDeleteTableVersionRequest({
    @_s.required this.databaseName,
    @_s.required this.tableName,
    @_s.required this.versionIds,
    this.catalogId,
  });
  Map<String, dynamic> toJson() => _$BatchDeleteTableVersionRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchDeleteTableVersionResponse {
  /// A list of errors encountered while trying to delete the specified table
  /// versions.
  @_s.JsonKey(name: 'Errors')
  final List<TableVersionError> errors;

  BatchDeleteTableVersionResponse({
    this.errors,
  });
  factory BatchDeleteTableVersionResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchDeleteTableVersionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BatchGetCrawlersRequest {
  /// A list of crawler names, which might be the names returned from the
  /// <code>ListCrawlers</code> operation.
  @_s.JsonKey(name: 'CrawlerNames')
  final List<String> crawlerNames;

  BatchGetCrawlersRequest({
    @_s.required this.crawlerNames,
  });
  Map<String, dynamic> toJson() => _$BatchGetCrawlersRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchGetCrawlersResponse {
  /// A list of crawler definitions.
  @_s.JsonKey(name: 'Crawlers')
  final List<Crawler> crawlers;

  /// A list of names of crawlers that were not found.
  @_s.JsonKey(name: 'CrawlersNotFound')
  final List<String> crawlersNotFound;

  BatchGetCrawlersResponse({
    this.crawlers,
    this.crawlersNotFound,
  });
  factory BatchGetCrawlersResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchGetCrawlersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BatchGetDevEndpointsRequest {
  /// The list of <code>DevEndpoint</code> names, which might be the names
  /// returned from the <code>ListDevEndpoint</code> operation.
  @_s.JsonKey(name: 'DevEndpointNames')
  final List<String> devEndpointNames;

  BatchGetDevEndpointsRequest({
    @_s.required this.devEndpointNames,
  });
  Map<String, dynamic> toJson() => _$BatchGetDevEndpointsRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchGetDevEndpointsResponse {
  /// A list of <code>DevEndpoint</code> definitions.
  @_s.JsonKey(name: 'DevEndpoints')
  final List<DevEndpoint> devEndpoints;

  /// A list of <code>DevEndpoints</code> not found.
  @_s.JsonKey(name: 'DevEndpointsNotFound')
  final List<String> devEndpointsNotFound;

  BatchGetDevEndpointsResponse({
    this.devEndpoints,
    this.devEndpointsNotFound,
  });
  factory BatchGetDevEndpointsResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchGetDevEndpointsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BatchGetJobsRequest {
  /// A list of job names, which might be the names returned from the
  /// <code>ListJobs</code> operation.
  @_s.JsonKey(name: 'JobNames')
  final List<String> jobNames;

  BatchGetJobsRequest({
    @_s.required this.jobNames,
  });
  Map<String, dynamic> toJson() => _$BatchGetJobsRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchGetJobsResponse {
  /// A list of job definitions.
  @_s.JsonKey(name: 'Jobs')
  final List<Job> jobs;

  /// A list of names of jobs not found.
  @_s.JsonKey(name: 'JobsNotFound')
  final List<String> jobsNotFound;

  BatchGetJobsResponse({
    this.jobs,
    this.jobsNotFound,
  });
  factory BatchGetJobsResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchGetJobsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BatchGetPartitionRequest {
  /// The name of the catalog database where the partitions reside.
  @_s.JsonKey(name: 'DatabaseName')
  final String databaseName;

  /// A list of partition values identifying the partitions to retrieve.
  @_s.JsonKey(name: 'PartitionsToGet')
  final List<PartitionValueList> partitionsToGet;

  /// The name of the partitions' table.
  @_s.JsonKey(name: 'TableName')
  final String tableName;

  /// The ID of the Data Catalog where the partitions in question reside. If none
  /// is supplied, the AWS account ID is used by default.
  @_s.JsonKey(name: 'CatalogId')
  final String catalogId;

  BatchGetPartitionRequest({
    @_s.required this.databaseName,
    @_s.required this.partitionsToGet,
    @_s.required this.tableName,
    this.catalogId,
  });
  Map<String, dynamic> toJson() => _$BatchGetPartitionRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchGetPartitionResponse {
  /// A list of the requested partitions.
  @_s.JsonKey(name: 'Partitions')
  final List<Partition> partitions;

  /// A list of the partition values in the request for which partitions were not
  /// returned.
  @_s.JsonKey(name: 'UnprocessedKeys')
  final List<PartitionValueList> unprocessedKeys;

  BatchGetPartitionResponse({
    this.partitions,
    this.unprocessedKeys,
  });
  factory BatchGetPartitionResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchGetPartitionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BatchGetTriggersRequest {
  /// A list of trigger names, which may be the names returned from the
  /// <code>ListTriggers</code> operation.
  @_s.JsonKey(name: 'TriggerNames')
  final List<String> triggerNames;

  BatchGetTriggersRequest({
    @_s.required this.triggerNames,
  });
  Map<String, dynamic> toJson() => _$BatchGetTriggersRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchGetTriggersResponse {
  /// A list of trigger definitions.
  @_s.JsonKey(name: 'Triggers')
  final List<Trigger> triggers;

  /// A list of names of triggers not found.
  @_s.JsonKey(name: 'TriggersNotFound')
  final List<String> triggersNotFound;

  BatchGetTriggersResponse({
    this.triggers,
    this.triggersNotFound,
  });
  factory BatchGetTriggersResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchGetTriggersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BatchGetWorkflowsRequest {
  /// A list of workflow names, which may be the names returned from the
  /// <code>ListWorkflows</code> operation.
  @_s.JsonKey(name: 'Names')
  final List<String> names;

  /// Specifies whether to include a graph when returning the workflow resource
  /// metadata.
  @_s.JsonKey(name: 'IncludeGraph')
  final bool includeGraph;

  BatchGetWorkflowsRequest({
    @_s.required this.names,
    this.includeGraph,
  });
  Map<String, dynamic> toJson() => _$BatchGetWorkflowsRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchGetWorkflowsResponse {
  /// A list of names of workflows not found.
  @_s.JsonKey(name: 'MissingWorkflows')
  final List<String> missingWorkflows;

  /// A list of workflow resource metadata.
  @_s.JsonKey(name: 'Workflows')
  final List<Workflow> workflows;

  BatchGetWorkflowsResponse({
    this.missingWorkflows,
    this.workflows,
  });
  factory BatchGetWorkflowsResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchGetWorkflowsResponseFromJson(json);
}

/// Records an error that occurred when attempting to stop a specified job run.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchStopJobRunError {
  /// Specifies details about the error that was encountered.
  @_s.JsonKey(name: 'ErrorDetail')
  final ErrorDetail errorDetail;

  /// The name of the job definition that is used in the job run in question.
  @_s.JsonKey(name: 'JobName')
  final String jobName;

  /// The <code>JobRunId</code> of the job run in question.
  @_s.JsonKey(name: 'JobRunId')
  final String jobRunId;

  BatchStopJobRunError({
    this.errorDetail,
    this.jobName,
    this.jobRunId,
  });
  factory BatchStopJobRunError.fromJson(Map<String, dynamic> json) =>
      _$BatchStopJobRunErrorFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BatchStopJobRunRequest {
  /// The name of the job definition for which to stop job runs.
  @_s.JsonKey(name: 'JobName')
  final String jobName;

  /// A list of the <code>JobRunIds</code> that should be stopped for that job
  /// definition.
  @_s.JsonKey(name: 'JobRunIds')
  final List<String> jobRunIds;

  BatchStopJobRunRequest({
    @_s.required this.jobName,
    @_s.required this.jobRunIds,
  });
  Map<String, dynamic> toJson() => _$BatchStopJobRunRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchStopJobRunResponse {
  /// A list of the errors that were encountered in trying to stop
  /// <code>JobRuns</code>, including the <code>JobRunId</code> for which each
  /// error was encountered and details about the error.
  @_s.JsonKey(name: 'Errors')
  final List<BatchStopJobRunError> errors;

  /// A list of the JobRuns that were successfully submitted for stopping.
  @_s.JsonKey(name: 'SuccessfulSubmissions')
  final List<BatchStopJobRunSuccessfulSubmission> successfulSubmissions;

  BatchStopJobRunResponse({
    this.errors,
    this.successfulSubmissions,
  });
  factory BatchStopJobRunResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchStopJobRunResponseFromJson(json);
}

/// Records a successful request to stop a specified <code>JobRun</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchStopJobRunSuccessfulSubmission {
  /// The name of the job definition used in the job run that was stopped.
  @_s.JsonKey(name: 'JobName')
  final String jobName;

  /// The <code>JobRunId</code> of the job run that was stopped.
  @_s.JsonKey(name: 'JobRunId')
  final String jobRunId;

  BatchStopJobRunSuccessfulSubmission({
    this.jobName,
    this.jobRunId,
  });
  factory BatchStopJobRunSuccessfulSubmission.fromJson(
          Map<String, dynamic> json) =>
      _$BatchStopJobRunSuccessfulSubmissionFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CancelMLTaskRunRequest {
  /// A unique identifier for the task run.
  @_s.JsonKey(name: 'TaskRunId')
  final String taskRunId;

  /// The unique identifier of the machine learning transform.
  @_s.JsonKey(name: 'TransformId')
  final String transformId;

  CancelMLTaskRunRequest({
    @_s.required this.taskRunId,
    @_s.required this.transformId,
  });
  Map<String, dynamic> toJson() => _$CancelMLTaskRunRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CancelMLTaskRunResponse {
  /// The status for this run.
  @_s.JsonKey(name: 'Status')
  final TaskStatusType status;

  /// The unique identifier for the task run.
  @_s.JsonKey(name: 'TaskRunId')
  final String taskRunId;

  /// The unique identifier of the machine learning transform.
  @_s.JsonKey(name: 'TransformId')
  final String transformId;

  CancelMLTaskRunResponse({
    this.status,
    this.taskRunId,
    this.transformId,
  });
  factory CancelMLTaskRunResponse.fromJson(Map<String, dynamic> json) =>
      _$CancelMLTaskRunResponseFromJson(json);
}

enum CatalogEncryptionMode {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('SSE-KMS')
  sseKms,
}

/// Specifies a table definition in the AWS Glue Data Catalog.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CatalogEntry {
  /// The database in which the table metadata resides.
  @_s.JsonKey(name: 'DatabaseName')
  final String databaseName;

  /// The name of the table in question.
  @_s.JsonKey(name: 'TableName')
  final String tableName;

  CatalogEntry({
    @_s.required this.databaseName,
    @_s.required this.tableName,
  });
  Map<String, dynamic> toJson() => _$CatalogEntryToJson(this);
}

/// A structure containing migration status information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CatalogImportStatus {
  /// <code>True</code> if the migration has completed, or <code>False</code>
  /// otherwise.
  @_s.JsonKey(name: 'ImportCompleted')
  final bool importCompleted;

  /// The time that the migration was started.
  @_s.JsonKey(
      name: 'ImportTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime importTime;

  /// The name of the person who initiated the migration.
  @_s.JsonKey(name: 'ImportedBy')
  final String importedBy;

  CatalogImportStatus({
    this.importCompleted,
    this.importTime,
    this.importedBy,
  });
  factory CatalogImportStatus.fromJson(Map<String, dynamic> json) =>
      _$CatalogImportStatusFromJson(json);
}

/// Specifies an AWS Glue Data Catalog target.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CatalogTarget {
  /// The name of the database to be synchronized.
  @_s.JsonKey(name: 'DatabaseName')
  final String databaseName;

  /// A list of the tables to be synchronized.
  @_s.JsonKey(name: 'Tables')
  final List<String> tables;

  CatalogTarget({
    @_s.required this.databaseName,
    @_s.required this.tables,
  });
  factory CatalogTarget.fromJson(Map<String, dynamic> json) =>
      _$CatalogTargetFromJson(json);

  Map<String, dynamic> toJson() => _$CatalogTargetToJson(this);
}

/// Classifiers are triggered during a crawl task. A classifier checks whether a
/// given file is in a format it can handle. If it is, the classifier creates a
/// schema in the form of a <code>StructType</code> object that matches that
/// data format.
///
/// You can use the standard classifiers that AWS Glue provides, or you can
/// write your own classifiers to best categorize your data sources and specify
/// the appropriate schemas to use for them. A classifier can be a
/// <code>grok</code> classifier, an <code>XML</code> classifier, a
/// <code>JSON</code> classifier, or a custom <code>CSV</code> classifier, as
/// specified in one of the fields in the <code>Classifier</code> object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Classifier {
  /// A classifier for comma-separated values (CSV).
  @_s.JsonKey(name: 'CsvClassifier')
  final CsvClassifier csvClassifier;

  /// A classifier that uses <code>grok</code>.
  @_s.JsonKey(name: 'GrokClassifier')
  final GrokClassifier grokClassifier;

  /// A classifier for JSON content.
  @_s.JsonKey(name: 'JsonClassifier')
  final JsonClassifier jsonClassifier;

  /// A classifier for XML content.
  @_s.JsonKey(name: 'XMLClassifier')
  final XMLClassifier xMLClassifier;

  Classifier({
    this.csvClassifier,
    this.grokClassifier,
    this.jsonClassifier,
    this.xMLClassifier,
  });
  factory Classifier.fromJson(Map<String, dynamic> json) =>
      _$ClassifierFromJson(json);
}

/// Specifies how Amazon CloudWatch data should be encrypted.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CloudWatchEncryption {
  /// The encryption mode to use for CloudWatch data.
  @_s.JsonKey(name: 'CloudWatchEncryptionMode')
  final CloudWatchEncryptionMode cloudWatchEncryptionMode;

  /// The Amazon Resource Name (ARN) of the KMS key to be used to encrypt the
  /// data.
  @_s.JsonKey(name: 'KmsKeyArn')
  final String kmsKeyArn;

  CloudWatchEncryption({
    this.cloudWatchEncryptionMode,
    this.kmsKeyArn,
  });
  factory CloudWatchEncryption.fromJson(Map<String, dynamic> json) =>
      _$CloudWatchEncryptionFromJson(json);

  Map<String, dynamic> toJson() => _$CloudWatchEncryptionToJson(this);
}

enum CloudWatchEncryptionMode {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('SSE-KMS')
  sseKms,
}

/// Represents a directional edge in a directed acyclic graph (DAG).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CodeGenEdge {
  /// The ID of the node at which the edge starts.
  @_s.JsonKey(name: 'Source')
  final String source;

  /// The ID of the node at which the edge ends.
  @_s.JsonKey(name: 'Target')
  final String target;

  /// The target of the edge.
  @_s.JsonKey(name: 'TargetParameter')
  final String targetParameter;

  CodeGenEdge({
    @_s.required this.source,
    @_s.required this.target,
    this.targetParameter,
  });
  factory CodeGenEdge.fromJson(Map<String, dynamic> json) =>
      _$CodeGenEdgeFromJson(json);

  Map<String, dynamic> toJson() => _$CodeGenEdgeToJson(this);
}

/// Represents a node in a directed acyclic graph (DAG)
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CodeGenNode {
  /// Properties of the node, in the form of name-value pairs.
  @_s.JsonKey(name: 'Args')
  final List<CodeGenNodeArg> args;

  /// A node identifier that is unique within the node's graph.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The type of node that this is.
  @_s.JsonKey(name: 'NodeType')
  final String nodeType;

  /// The line number of the node.
  @_s.JsonKey(name: 'LineNumber')
  final int lineNumber;

  CodeGenNode({
    @_s.required this.args,
    @_s.required this.id,
    @_s.required this.nodeType,
    this.lineNumber,
  });
  factory CodeGenNode.fromJson(Map<String, dynamic> json) =>
      _$CodeGenNodeFromJson(json);

  Map<String, dynamic> toJson() => _$CodeGenNodeToJson(this);
}

/// An argument or property of a node.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CodeGenNodeArg {
  /// The name of the argument or property.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The value of the argument or property.
  @_s.JsonKey(name: 'Value')
  final String value;

  /// True if the value is used as a parameter.
  @_s.JsonKey(name: 'Param')
  final bool param;

  CodeGenNodeArg({
    @_s.required this.name,
    @_s.required this.value,
    this.param,
  });
  factory CodeGenNodeArg.fromJson(Map<String, dynamic> json) =>
      _$CodeGenNodeArgFromJson(json);

  Map<String, dynamic> toJson() => _$CodeGenNodeArgToJson(this);
}

/// A column in a <code>Table</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Column {
  /// The name of the <code>Column</code>.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// A free-form text comment.
  @_s.JsonKey(name: 'Comment')
  final String comment;

  /// These key-value pairs define properties associated with the column.
  @_s.JsonKey(name: 'Parameters')
  final Map<String, String> parameters;

  /// The data type of the <code>Column</code>.
  @_s.JsonKey(name: 'Type')
  final String type;

  Column({
    @_s.required this.name,
    this.comment,
    this.parameters,
    this.type,
  });
  factory Column.fromJson(Map<String, dynamic> json) => _$ColumnFromJson(json);

  Map<String, dynamic> toJson() => _$ColumnToJson(this);
}

enum Comparator {
  @_s.JsonValue('EQUALS')
  equals,
  @_s.JsonValue('GREATER_THAN')
  greaterThan,
  @_s.JsonValue('LESS_THAN')
  lessThan,
  @_s.JsonValue('GREATER_THAN_EQUALS')
  greaterThanEquals,
  @_s.JsonValue('LESS_THAN_EQUALS')
  lessThanEquals,
}

/// Defines a condition under which a trigger fires.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Condition {
  /// The state of the crawler to which this condition applies.
  @_s.JsonKey(name: 'CrawlState')
  final CrawlState crawlState;

  /// The name of the crawler to which this condition applies.
  @_s.JsonKey(name: 'CrawlerName')
  final String crawlerName;

  /// The name of the job whose <code>JobRuns</code> this condition applies to,
  /// and on which this trigger waits.
  @_s.JsonKey(name: 'JobName')
  final String jobName;

  /// A logical operator.
  @_s.JsonKey(name: 'LogicalOperator')
  final LogicalOperator logicalOperator;

  /// The condition state. Currently, the values supported are
  /// <code>SUCCEEDED</code>, <code>STOPPED</code>, <code>TIMEOUT</code>, and
  /// <code>FAILED</code>.
  @_s.JsonKey(name: 'State')
  final JobRunState state;

  Condition({
    this.crawlState,
    this.crawlerName,
    this.jobName,
    this.logicalOperator,
    this.state,
  });
  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionToJson(this);
}

/// The confusion matrix shows you what your transform is predicting accurately
/// and what types of errors it is making.
///
/// For more information, see <a
/// href="https://en.wikipedia.org/wiki/Confusion_matrix">Confusion matrix</a>
/// in Wikipedia.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConfusionMatrix {
  /// The number of matches in the data that the transform didn't find, in the
  /// confusion matrix for your transform.
  @_s.JsonKey(name: 'NumFalseNegatives')
  final int numFalseNegatives;

  /// The number of nonmatches in the data that the transform incorrectly
  /// classified as a match, in the confusion matrix for your transform.
  @_s.JsonKey(name: 'NumFalsePositives')
  final int numFalsePositives;

  /// The number of nonmatches in the data that the transform correctly rejected,
  /// in the confusion matrix for your transform.
  @_s.JsonKey(name: 'NumTrueNegatives')
  final int numTrueNegatives;

  /// The number of matches in the data that the transform correctly found, in the
  /// confusion matrix for your transform.
  @_s.JsonKey(name: 'NumTruePositives')
  final int numTruePositives;

  ConfusionMatrix({
    this.numFalseNegatives,
    this.numFalsePositives,
    this.numTrueNegatives,
    this.numTruePositives,
  });
  factory ConfusionMatrix.fromJson(Map<String, dynamic> json) =>
      _$ConfusionMatrixFromJson(json);
}

/// Defines a connection to a data source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Connection {
  /// These key-value pairs define parameters for the connection:
  ///
  /// <ul>
  /// <li>
  /// <code>HOST</code> - The host URI: either the fully qualified domain name
  /// (FQDN) or the IPv4 address of the database host.
  /// </li>
  /// <li>
  /// <code>PORT</code> - The port number, between 1024 and 65535, of the port on
  /// which the database host is listening for database connections.
  /// </li>
  /// <li>
  /// <code>USER_NAME</code> - The name under which to log in to the database. The
  /// value string for <code>USER_NAME</code> is "<code>USERNAME</code>".
  /// </li>
  /// <li>
  /// <code>PASSWORD</code> - A password, if one is used, for the user name.
  /// </li>
  /// <li>
  /// <code>ENCRYPTED_PASSWORD</code> - When you enable connection password
  /// protection by setting <code>ConnectionPasswordEncryption</code> in the Data
  /// Catalog encryption settings, this field stores the encrypted password.
  /// </li>
  /// <li>
  /// <code>JDBC_DRIVER_JAR_URI</code> - The Amazon Simple Storage Service (Amazon
  /// S3) path of the JAR file that contains the JDBC driver to use.
  /// </li>
  /// <li>
  /// <code>JDBC_DRIVER_CLASS_NAME</code> - The class name of the JDBC driver to
  /// use.
  /// </li>
  /// <li>
  /// <code>JDBC_ENGINE</code> - The name of the JDBC engine to use.
  /// </li>
  /// <li>
  /// <code>JDBC_ENGINE_VERSION</code> - The version of the JDBC engine to use.
  /// </li>
  /// <li>
  /// <code>CONFIG_FILES</code> - (Reserved for future use.)
  /// </li>
  /// <li>
  /// <code>INSTANCE_ID</code> - The instance ID to use.
  /// </li>
  /// <li>
  /// <code>JDBC_CONNECTION_URL</code> - The URL for connecting to a JDBC data
  /// source.
  /// </li>
  /// <li>
  /// <code>JDBC_ENFORCE_SSL</code> - A Boolean string (true, false) specifying
  /// whether Secure Sockets Layer (SSL) with hostname matching is enforced for
  /// the JDBC connection on the client. The default is false.
  /// </li>
  /// <li>
  /// <code>CUSTOM_JDBC_CERT</code> - An Amazon S3 location specifying the
  /// customer's root certificate. AWS Glue uses this root certificate to validate
  /// the customer’s certificate when connecting to the customer database. AWS
  /// Glue only handles X.509 certificates. The certificate provided must be
  /// DER-encoded and supplied in Base64 encoding PEM format.
  /// </li>
  /// <li>
  /// <code>SKIP_CUSTOM_JDBC_CERT_VALIDATION</code> - By default, this is
  /// <code>false</code>. AWS Glue validates the Signature algorithm and Subject
  /// Public Key Algorithm for the customer certificate. The only permitted
  /// algorithms for the Signature algorithm are SHA256withRSA, SHA384withRSA or
  /// SHA512withRSA. For the Subject Public Key Algorithm, the key length must be
  /// at least 2048. You can set the value of this property to <code>true</code>
  /// to skip AWS Glue’s validation of the customer certificate.
  /// </li>
  /// <li>
  /// <code>CUSTOM_JDBC_CERT_STRING</code> - A custom JDBC certificate string
  /// which is used for domain match or distinguished name match to prevent a
  /// man-in-the-middle attack. In Oracle database, this is used as the
  /// <code>SSL_SERVER_CERT_DN</code>; in Microsoft SQL Server, this is used as
  /// the <code>hostNameInCertificate</code>.
  /// </li>
  /// <li>
  /// <code>CONNECTION_URL</code> - The URL for connecting to a general (non-JDBC)
  /// data source.
  /// </li>
  /// <li>
  /// <code>KAFKA_BOOTSTRAP_SERVERS</code> - A comma-separated list of host and
  /// port pairs that are the addresses of the Apache Kafka brokers in a Kafka
  /// cluster to which a Kafka client will connect to and bootstrap itself.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ConnectionProperties')
  final Map<String, String> connectionProperties;

  /// The type of the connection. Currently, only JDBC is supported; SFTP is not
  /// supported.
  @_s.JsonKey(name: 'ConnectionType')
  final ConnectionType connectionType;

  /// The time that this connection definition was created.
  @_s.JsonKey(
      name: 'CreationTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime creationTime;

  /// The description of the connection.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The user, group, or role that last updated this connection definition.
  @_s.JsonKey(name: 'LastUpdatedBy')
  final String lastUpdatedBy;

  /// The last time that this connection definition was updated.
  @_s.JsonKey(
      name: 'LastUpdatedTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastUpdatedTime;

  /// A list of criteria that can be used in selecting this connection.
  @_s.JsonKey(name: 'MatchCriteria')
  final List<String> matchCriteria;

  /// The name of the connection definition.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// A map of physical connection requirements, such as virtual private cloud
  /// (VPC) and <code>SecurityGroup</code>, that are needed to make this
  /// connection successfully.
  @_s.JsonKey(name: 'PhysicalConnectionRequirements')
  final PhysicalConnectionRequirements physicalConnectionRequirements;

  Connection({
    this.connectionProperties,
    this.connectionType,
    this.creationTime,
    this.description,
    this.lastUpdatedBy,
    this.lastUpdatedTime,
    this.matchCriteria,
    this.name,
    this.physicalConnectionRequirements,
  });
  factory Connection.fromJson(Map<String, dynamic> json) =>
      _$ConnectionFromJson(json);
}

/// A structure that is used to specify a connection to create or update.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ConnectionInput {
  /// These key-value pairs define parameters for the connection.
  @_s.JsonKey(name: 'ConnectionProperties')
  final Map<String, String> connectionProperties;

  /// The type of the connection. Currently, these types are supported:
  ///
  /// <ul>
  /// <li>
  /// <code>JDBC</code> - Designates a connection to a database through Java
  /// Database Connectivity (JDBC).
  /// </li>
  /// <li>
  /// <code>KAFKA</code> - Designates a connection to an Apache Kafka streaming
  /// platform.
  /// </li>
  /// <li>
  /// <code>MONGODB</code> - Designates a connection to a MongoDB document
  /// database.
  /// </li>
  /// </ul>
  /// SFTP is not supported.
  @_s.JsonKey(name: 'ConnectionType')
  final ConnectionType connectionType;

  /// The name of the connection.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The description of the connection.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// A list of criteria that can be used in selecting this connection.
  @_s.JsonKey(name: 'MatchCriteria')
  final List<String> matchCriteria;

  /// A map of physical connection requirements, such as virtual private cloud
  /// (VPC) and <code>SecurityGroup</code>, that are needed to successfully make
  /// this connection.
  @_s.JsonKey(name: 'PhysicalConnectionRequirements')
  final PhysicalConnectionRequirements physicalConnectionRequirements;

  ConnectionInput({
    @_s.required this.connectionProperties,
    @_s.required this.connectionType,
    @_s.required this.name,
    this.description,
    this.matchCriteria,
    this.physicalConnectionRequirements,
  });
  Map<String, dynamic> toJson() => _$ConnectionInputToJson(this);
}

/// The data structure used by the Data Catalog to encrypt the password as part
/// of <code>CreateConnection</code> or <code>UpdateConnection</code> and store
/// it in the <code>ENCRYPTED_PASSWORD</code> field in the connection
/// properties. You can enable catalog encryption or only password encryption.
///
/// When a <code>CreationConnection</code> request arrives containing a
/// password, the Data Catalog first encrypts the password using your AWS KMS
/// key. It then encrypts the whole connection object again if catalog
/// encryption is also enabled.
///
/// This encryption requires that you set AWS KMS key permissions to enable or
/// restrict access on the password key according to your security requirements.
/// For example, you might want only administrators to have decrypt permission
/// on the password key.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ConnectionPasswordEncryption {
  /// When the <code>ReturnConnectionPasswordEncrypted</code> flag is set to
  /// "true", passwords remain encrypted in the responses of
  /// <code>GetConnection</code> and <code>GetConnections</code>. This encryption
  /// takes effect independently from catalog encryption.
  @_s.JsonKey(name: 'ReturnConnectionPasswordEncrypted')
  final bool returnConnectionPasswordEncrypted;

  /// An AWS KMS key that is used to encrypt the connection password.
  ///
  /// If connection password protection is enabled, the caller of
  /// <code>CreateConnection</code> and <code>UpdateConnection</code> needs at
  /// least <code>kms:Encrypt</code> permission on the specified AWS KMS key, to
  /// encrypt passwords before storing them in the Data Catalog.
  ///
  /// You can set the decrypt permission to enable or restrict access on the
  /// password key according to your security requirements.
  @_s.JsonKey(name: 'AwsKmsKeyId')
  final String awsKmsKeyId;

  ConnectionPasswordEncryption({
    @_s.required this.returnConnectionPasswordEncrypted,
    this.awsKmsKeyId,
  });
  factory ConnectionPasswordEncryption.fromJson(Map<String, dynamic> json) =>
      _$ConnectionPasswordEncryptionFromJson(json);

  Map<String, dynamic> toJson() => _$ConnectionPasswordEncryptionToJson(this);
}

enum ConnectionPropertyKey {
  @_s.JsonValue('HOST')
  host,
  @_s.JsonValue('PORT')
  port,
  @_s.JsonValue('USERNAME')
  username,
  @_s.JsonValue('PASSWORD')
  password,
  @_s.JsonValue('ENCRYPTED_PASSWORD')
  encryptedPassword,
  @_s.JsonValue('JDBC_DRIVER_JAR_URI')
  jdbcDriverJarUri,
  @_s.JsonValue('JDBC_DRIVER_CLASS_NAME')
  jdbcDriverClassName,
  @_s.JsonValue('JDBC_ENGINE')
  jdbcEngine,
  @_s.JsonValue('JDBC_ENGINE_VERSION')
  jdbcEngineVersion,
  @_s.JsonValue('CONFIG_FILES')
  configFiles,
  @_s.JsonValue('INSTANCE_ID')
  instanceId,
  @_s.JsonValue('JDBC_CONNECTION_URL')
  jdbcConnectionUrl,
  @_s.JsonValue('JDBC_ENFORCE_SSL')
  jdbcEnforceSsl,
  @_s.JsonValue('CUSTOM_JDBC_CERT')
  customJdbcCert,
  @_s.JsonValue('SKIP_CUSTOM_JDBC_CERT_VALIDATION')
  skipCustomJdbcCertValidation,
  @_s.JsonValue('CUSTOM_JDBC_CERT_STRING')
  customJdbcCertString,
  @_s.JsonValue('CONNECTION_URL')
  connectionUrl,
  @_s.JsonValue('KAFKA_BOOTSTRAP_SERVERS')
  kafkaBootstrapServers,
}

enum ConnectionType {
  @_s.JsonValue('JDBC')
  jdbc,
  @_s.JsonValue('SFTP')
  sftp,
  @_s.JsonValue('MONGODB')
  mongodb,
  @_s.JsonValue('KAFKA')
  kafka,
}

/// Specifies the connections used by a job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ConnectionsList {
  /// A list of connections used by the job.
  @_s.JsonKey(name: 'Connections')
  final List<String> connections;

  ConnectionsList({
    this.connections,
  });
  factory ConnectionsList.fromJson(Map<String, dynamic> json) =>
      _$ConnectionsListFromJson(json);

  Map<String, dynamic> toJson() => _$ConnectionsListToJson(this);
}

/// The details of a crawl in the workflow.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Crawl {
  /// The date and time on which the crawl completed.
  @_s.JsonKey(
      name: 'CompletedOn',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime completedOn;

  /// The error message associated with the crawl.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  /// The log group associated with the crawl.
  @_s.JsonKey(name: 'LogGroup')
  final String logGroup;

  /// The log stream associated with the crawl.
  @_s.JsonKey(name: 'LogStream')
  final String logStream;

  /// The date and time on which the crawl started.
  @_s.JsonKey(
      name: 'StartedOn',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime startedOn;

  /// The state of the crawler.
  @_s.JsonKey(name: 'State')
  final CrawlState state;

  Crawl({
    this.completedOn,
    this.errorMessage,
    this.logGroup,
    this.logStream,
    this.startedOn,
    this.state,
  });
  factory Crawl.fromJson(Map<String, dynamic> json) => _$CrawlFromJson(json);
}

enum CrawlState {
  @_s.JsonValue('RUNNING')
  running,
  @_s.JsonValue('SUCCEEDED')
  succeeded,
  @_s.JsonValue('CANCELLED')
  cancelled,
  @_s.JsonValue('FAILED')
  failed,
}

/// Specifies a crawler program that examines a data source and uses classifiers
/// to try to determine its schema. If successful, the crawler records metadata
/// concerning the data source in the AWS Glue Data Catalog.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Crawler {
  /// A list of UTF-8 strings that specify the custom classifiers that are
  /// associated with the crawler.
  @_s.JsonKey(name: 'Classifiers')
  final List<String> classifiers;

  /// Crawler configuration information. This versioned JSON string allows users
  /// to specify aspects of a crawler's behavior. For more information, see <a
  /// href="http://docs.aws.amazon.com/glue/latest/dg/crawler-configuration.html">Configuring
  /// a Crawler</a>.
  @_s.JsonKey(name: 'Configuration')
  final String configuration;

  /// If the crawler is running, contains the total time elapsed since the last
  /// crawl began.
  @_s.JsonKey(name: 'CrawlElapsedTime')
  final int crawlElapsedTime;

  /// The name of the <code>SecurityConfiguration</code> structure to be used by
  /// this crawler.
  @_s.JsonKey(name: 'CrawlerSecurityConfiguration')
  final String crawlerSecurityConfiguration;

  /// The time that the crawler was created.
  @_s.JsonKey(
      name: 'CreationTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime creationTime;

  /// The name of the database in which the crawler's output is stored.
  @_s.JsonKey(name: 'DatabaseName')
  final String databaseName;

  /// A description of the crawler.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The status of the last crawl, and potentially error information if an error
  /// occurred.
  @_s.JsonKey(name: 'LastCrawl')
  final LastCrawlInfo lastCrawl;

  /// The time that the crawler was last updated.
  @_s.JsonKey(
      name: 'LastUpdated',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastUpdated;

  /// The name of the crawler.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The Amazon Resource Name (ARN) of an IAM role that's used to access customer
  /// resources, such as Amazon Simple Storage Service (Amazon S3) data.
  @_s.JsonKey(name: 'Role')
  final String role;

  /// For scheduled crawlers, the schedule when the crawler runs.
  @_s.JsonKey(name: 'Schedule')
  final Schedule schedule;

  /// The policy that specifies update and delete behaviors for the crawler.
  @_s.JsonKey(name: 'SchemaChangePolicy')
  final SchemaChangePolicy schemaChangePolicy;

  /// Indicates whether the crawler is running, or whether a run is pending.
  @_s.JsonKey(name: 'State')
  final CrawlerState state;

  /// The prefix added to the names of tables that are created.
  @_s.JsonKey(name: 'TablePrefix')
  final String tablePrefix;

  /// A collection of targets to crawl.
  @_s.JsonKey(name: 'Targets')
  final CrawlerTargets targets;

  /// The version of the crawler.
  @_s.JsonKey(name: 'Version')
  final int version;

  Crawler({
    this.classifiers,
    this.configuration,
    this.crawlElapsedTime,
    this.crawlerSecurityConfiguration,
    this.creationTime,
    this.databaseName,
    this.description,
    this.lastCrawl,
    this.lastUpdated,
    this.name,
    this.role,
    this.schedule,
    this.schemaChangePolicy,
    this.state,
    this.tablePrefix,
    this.targets,
    this.version,
  });
  factory Crawler.fromJson(Map<String, dynamic> json) =>
      _$CrawlerFromJson(json);
}

/// Metrics for a specified crawler.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CrawlerMetrics {
  /// The name of the crawler.
  @_s.JsonKey(name: 'CrawlerName')
  final String crawlerName;

  /// The duration of the crawler's most recent run, in seconds.
  @_s.JsonKey(name: 'LastRuntimeSeconds')
  final double lastRuntimeSeconds;

  /// The median duration of this crawler's runs, in seconds.
  @_s.JsonKey(name: 'MedianRuntimeSeconds')
  final double medianRuntimeSeconds;

  /// True if the crawler is still estimating how long it will take to complete
  /// this run.
  @_s.JsonKey(name: 'StillEstimating')
  final bool stillEstimating;

  /// The number of tables created by this crawler.
  @_s.JsonKey(name: 'TablesCreated')
  final int tablesCreated;

  /// The number of tables deleted by this crawler.
  @_s.JsonKey(name: 'TablesDeleted')
  final int tablesDeleted;

  /// The number of tables updated by this crawler.
  @_s.JsonKey(name: 'TablesUpdated')
  final int tablesUpdated;

  /// The estimated time left to complete a running crawl.
  @_s.JsonKey(name: 'TimeLeftSeconds')
  final double timeLeftSeconds;

  CrawlerMetrics({
    this.crawlerName,
    this.lastRuntimeSeconds,
    this.medianRuntimeSeconds,
    this.stillEstimating,
    this.tablesCreated,
    this.tablesDeleted,
    this.tablesUpdated,
    this.timeLeftSeconds,
  });
  factory CrawlerMetrics.fromJson(Map<String, dynamic> json) =>
      _$CrawlerMetricsFromJson(json);
}

/// The details of a Crawler node present in the workflow.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CrawlerNodeDetails {
  /// A list of crawls represented by the crawl node.
  @_s.JsonKey(name: 'Crawls')
  final List<Crawl> crawls;

  CrawlerNodeDetails({
    this.crawls,
  });
  factory CrawlerNodeDetails.fromJson(Map<String, dynamic> json) =>
      _$CrawlerNodeDetailsFromJson(json);
}

enum CrawlerState {
  @_s.JsonValue('READY')
  ready,
  @_s.JsonValue('RUNNING')
  running,
  @_s.JsonValue('STOPPING')
  stopping,
}

/// Specifies data stores to crawl.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CrawlerTargets {
  /// Specifies AWS Glue Data Catalog targets.
  @_s.JsonKey(name: 'CatalogTargets')
  final List<CatalogTarget> catalogTargets;

  /// Specifies Amazon DynamoDB targets.
  @_s.JsonKey(name: 'DynamoDBTargets')
  final List<DynamoDBTarget> dynamoDBTargets;

  /// Specifies JDBC targets.
  @_s.JsonKey(name: 'JdbcTargets')
  final List<JdbcTarget> jdbcTargets;

  /// Specifies Amazon Simple Storage Service (Amazon S3) targets.
  @_s.JsonKey(name: 'S3Targets')
  final List<S3Target> s3Targets;

  CrawlerTargets({
    this.catalogTargets,
    this.dynamoDBTargets,
    this.jdbcTargets,
    this.s3Targets,
  });
  factory CrawlerTargets.fromJson(Map<String, dynamic> json) =>
      _$CrawlerTargetsFromJson(json);

  Map<String, dynamic> toJson() => _$CrawlerTargetsToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateClassifierRequest {
  /// A <code>CsvClassifier</code> object specifying the classifier to create.
  @_s.JsonKey(name: 'CsvClassifier')
  final CreateCsvClassifierRequest csvClassifier;

  /// A <code>GrokClassifier</code> object specifying the classifier to create.
  @_s.JsonKey(name: 'GrokClassifier')
  final CreateGrokClassifierRequest grokClassifier;

  /// A <code>JsonClassifier</code> object specifying the classifier to create.
  @_s.JsonKey(name: 'JsonClassifier')
  final CreateJsonClassifierRequest jsonClassifier;

  /// An <code>XMLClassifier</code> object specifying the classifier to create.
  @_s.JsonKey(name: 'XMLClassifier')
  final CreateXMLClassifierRequest xMLClassifier;

  CreateClassifierRequest({
    this.csvClassifier,
    this.grokClassifier,
    this.jsonClassifier,
    this.xMLClassifier,
  });
  Map<String, dynamic> toJson() => _$CreateClassifierRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateClassifierResponse {
  CreateClassifierResponse();
  factory CreateClassifierResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateClassifierResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateConnectionRequest {
  /// A <code>ConnectionInput</code> object defining the connection to create.
  @_s.JsonKey(name: 'ConnectionInput')
  final ConnectionInput connectionInput;

  /// The ID of the Data Catalog in which to create the connection. If none is
  /// provided, the AWS account ID is used by default.
  @_s.JsonKey(name: 'CatalogId')
  final String catalogId;

  CreateConnectionRequest({
    @_s.required this.connectionInput,
    this.catalogId,
  });
  Map<String, dynamic> toJson() => _$CreateConnectionRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateConnectionResponse {
  CreateConnectionResponse();
  factory CreateConnectionResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateConnectionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateCrawlerRequest {
  /// Name of the new crawler.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The IAM role or Amazon Resource Name (ARN) of an IAM role used by the new
  /// crawler to access customer resources.
  @_s.JsonKey(name: 'Role')
  final String role;

  /// A list of collection of targets to crawl.
  @_s.JsonKey(name: 'Targets')
  final CrawlerTargets targets;

  /// A list of custom classifiers that the user has registered. By default, all
  /// built-in classifiers are included in a crawl, but these custom classifiers
  /// always override the default classifiers for a given classification.
  @_s.JsonKey(name: 'Classifiers')
  final List<String> classifiers;

  /// The crawler configuration information. This versioned JSON string allows
  /// users to specify aspects of a crawler's behavior. For more information, see
  /// <a
  /// href="http://docs.aws.amazon.com/glue/latest/dg/crawler-configuration.html">Configuring
  /// a Crawler</a>.
  @_s.JsonKey(name: 'Configuration')
  final String configuration;

  /// The name of the <code>SecurityConfiguration</code> structure to be used by
  /// this crawler.
  @_s.JsonKey(name: 'CrawlerSecurityConfiguration')
  final String crawlerSecurityConfiguration;

  /// The AWS Glue database where results are written, such as:
  /// <code>arn:aws:daylight:us-east-1::database/sometable/*</code>.
  @_s.JsonKey(name: 'DatabaseName')
  final String databaseName;

  /// A description of the new crawler.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// A <code>cron</code> expression used to specify the schedule. For more
  /// information, see <a
  /// href="http://docs.aws.amazon.com/glue/latest/dg/monitor-data-warehouse-schedule.html">Time-Based
  /// Schedules for Jobs and Crawlers</a>. For example, to run something every day
  /// at 12:15 UTC, specify <code>cron(15 12 * * ? *)</code>.
  @_s.JsonKey(name: 'Schedule')
  final String schedule;

  /// The policy for the crawler's update and deletion behavior.
  @_s.JsonKey(name: 'SchemaChangePolicy')
  final SchemaChangePolicy schemaChangePolicy;

  /// The table prefix used for catalog tables that are created.
  @_s.JsonKey(name: 'TablePrefix')
  final String tablePrefix;

  /// The tags to use with this crawler request. You can use tags to limit access
  /// to the crawler. For more information, see <a
  /// href="http://docs.aws.amazon.com/glue/latest/dg/monitor-tags.html">AWS Tags
  /// in AWS Glue</a>.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  CreateCrawlerRequest({
    @_s.required this.name,
    @_s.required this.role,
    @_s.required this.targets,
    this.classifiers,
    this.configuration,
    this.crawlerSecurityConfiguration,
    this.databaseName,
    this.description,
    this.schedule,
    this.schemaChangePolicy,
    this.tablePrefix,
    this.tags,
  });
  Map<String, dynamic> toJson() => _$CreateCrawlerRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateCrawlerResponse {
  CreateCrawlerResponse();
  factory CreateCrawlerResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateCrawlerResponseFromJson(json);
}

/// Specifies a custom CSV classifier for <code>CreateClassifier</code> to
/// create.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateCsvClassifierRequest {
  /// The name of the classifier.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Enables the processing of files that contain only one column.
  @_s.JsonKey(name: 'AllowSingleColumn')
  final bool allowSingleColumn;

  /// Indicates whether the CSV file contains a header.
  @_s.JsonKey(name: 'ContainsHeader')
  final CsvHeaderOption containsHeader;

  /// A custom symbol to denote what separates each column entry in the row.
  @_s.JsonKey(name: 'Delimiter')
  final String delimiter;

  /// Specifies not to trim values before identifying the type of column values.
  /// The default value is true.
  @_s.JsonKey(name: 'DisableValueTrimming')
  final bool disableValueTrimming;

  /// A list of strings representing column names.
  @_s.JsonKey(name: 'Header')
  final List<String> header;

  /// A custom symbol to denote what combines content into a single column value.
  /// Must be different from the column delimiter.
  @_s.JsonKey(name: 'QuoteSymbol')
  final String quoteSymbol;

  CreateCsvClassifierRequest({
    @_s.required this.name,
    this.allowSingleColumn,
    this.containsHeader,
    this.delimiter,
    this.disableValueTrimming,
    this.header,
    this.quoteSymbol,
  });
  Map<String, dynamic> toJson() => _$CreateCsvClassifierRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateDatabaseRequest {
  /// The metadata for the database.
  @_s.JsonKey(name: 'DatabaseInput')
  final DatabaseInput databaseInput;

  /// The ID of the Data Catalog in which to create the database. If none is
  /// provided, the AWS account ID is used by default.
  @_s.JsonKey(name: 'CatalogId')
  final String catalogId;

  CreateDatabaseRequest({
    @_s.required this.databaseInput,
    this.catalogId,
  });
  Map<String, dynamic> toJson() => _$CreateDatabaseRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDatabaseResponse {
  CreateDatabaseResponse();
  factory CreateDatabaseResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateDatabaseResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateDevEndpointRequest {
  /// The name to be assigned to the new <code>DevEndpoint</code>.
  @_s.JsonKey(name: 'EndpointName')
  final String endpointName;

  /// The IAM role for the <code>DevEndpoint</code>.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;

  /// A map of arguments used to configure the <code>DevEndpoint</code>.
  @_s.JsonKey(name: 'Arguments')
  final Map<String, String> arguments;

  /// The path to one or more Java <code>.jar</code> files in an S3 bucket that
  /// should be loaded in your <code>DevEndpoint</code>.
  @_s.JsonKey(name: 'ExtraJarsS3Path')
  final String extraJarsS3Path;

  /// The paths to one or more Python libraries in an Amazon S3 bucket that should
  /// be loaded in your <code>DevEndpoint</code>. Multiple values must be complete
  /// paths separated by a comma.
  /// <note>
  /// You can only use pure Python libraries with a <code>DevEndpoint</code>.
  /// Libraries that rely on C extensions, such as the <a
  /// href="http://pandas.pydata.org/">pandas</a> Python data analysis library,
  /// are not yet supported.
  /// </note>
  @_s.JsonKey(name: 'ExtraPythonLibsS3Path')
  final String extraPythonLibsS3Path;

  /// Glue version determines the versions of Apache Spark and Python that AWS
  /// Glue supports. The Python version indicates the version supported for
  /// running your ETL scripts on development endpoints.
  ///
  /// For more information about the available AWS Glue versions and corresponding
  /// Spark and Python versions, see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/add-job.html">Glue
  /// version</a> in the developer guide.
  ///
  /// Development endpoints that are created without specifying a Glue version
  /// default to Glue 0.9.
  ///
  /// You can specify a version of Python support for development endpoints by
  /// using the <code>Arguments</code> parameter in the
  /// <code>CreateDevEndpoint</code> or <code>UpdateDevEndpoint</code> APIs. If no
  /// arguments are provided, the version defaults to Python 2.
  @_s.JsonKey(name: 'GlueVersion')
  final String glueVersion;

  /// The number of AWS Glue Data Processing Units (DPUs) to allocate to this
  /// <code>DevEndpoint</code>.
  @_s.JsonKey(name: 'NumberOfNodes')
  final int numberOfNodes;

  /// The number of workers of a defined <code>workerType</code> that are
  /// allocated to the development endpoint.
  ///
  /// The maximum number of workers you can define are 299 for <code>G.1X</code>,
  /// and 149 for <code>G.2X</code>.
  @_s.JsonKey(name: 'NumberOfWorkers')
  final int numberOfWorkers;

  /// The public key to be used by this <code>DevEndpoint</code> for
  /// authentication. This attribute is provided for backward compatibility
  /// because the recommended attribute to use is public keys.
  @_s.JsonKey(name: 'PublicKey')
  final String publicKey;

  /// A list of public keys to be used by the development endpoints for
  /// authentication. The use of this attribute is preferred over a single public
  /// key because the public keys allow you to have a different private key per
  /// client.
  /// <note>
  /// If you previously created an endpoint with a public key, you must remove
  /// that key to be able to set a list of public keys. Call the
  /// <code>UpdateDevEndpoint</code> API with the public key content in the
  /// <code>deletePublicKeys</code> attribute, and the list of new keys in the
  /// <code>addPublicKeys</code> attribute.
  /// </note>
  @_s.JsonKey(name: 'PublicKeys')
  final List<String> publicKeys;

  /// The name of the <code>SecurityConfiguration</code> structure to be used with
  /// this <code>DevEndpoint</code>.
  @_s.JsonKey(name: 'SecurityConfiguration')
  final String securityConfiguration;

  /// Security group IDs for the security groups to be used by the new
  /// <code>DevEndpoint</code>.
  @_s.JsonKey(name: 'SecurityGroupIds')
  final List<String> securityGroupIds;

  /// The subnet ID for the new <code>DevEndpoint</code> to use.
  @_s.JsonKey(name: 'SubnetId')
  final String subnetId;

  /// The tags to use with this DevEndpoint. You may use tags to limit access to
  /// the DevEndpoint. For more information about tags in AWS Glue, see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/monitor-tags.html">AWS Tags
  /// in AWS Glue</a> in the developer guide.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  /// The type of predefined worker that is allocated to the development endpoint.
  /// Accepts a value of Standard, G.1X, or G.2X.
  ///
  /// <ul>
  /// <li>
  /// For the <code>Standard</code> worker type, each worker provides 4 vCPU, 16
  /// GB of memory and a 50GB disk, and 2 executors per worker.
  /// </li>
  /// <li>
  /// For the <code>G.1X</code> worker type, each worker maps to 1 DPU (4 vCPU, 16
  /// GB of memory, 64 GB disk), and provides 1 executor per worker. We recommend
  /// this worker type for memory-intensive jobs.
  /// </li>
  /// <li>
  /// For the <code>G.2X</code> worker type, each worker maps to 2 DPU (8 vCPU, 32
  /// GB of memory, 128 GB disk), and provides 1 executor per worker. We recommend
  /// this worker type for memory-intensive jobs.
  /// </li>
  /// </ul>
  /// Known issue: when a development endpoint is created with the
  /// <code>G.2X</code> <code>WorkerType</code> configuration, the Spark drivers
  /// for the development endpoint will run on 4 vCPU, 16 GB of memory, and a 64
  /// GB disk.
  @_s.JsonKey(name: 'WorkerType')
  final WorkerType workerType;

  CreateDevEndpointRequest({
    @_s.required this.endpointName,
    @_s.required this.roleArn,
    this.arguments,
    this.extraJarsS3Path,
    this.extraPythonLibsS3Path,
    this.glueVersion,
    this.numberOfNodes,
    this.numberOfWorkers,
    this.publicKey,
    this.publicKeys,
    this.securityConfiguration,
    this.securityGroupIds,
    this.subnetId,
    this.tags,
    this.workerType,
  });
  Map<String, dynamic> toJson() => _$CreateDevEndpointRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDevEndpointResponse {
  /// The map of arguments used to configure this <code>DevEndpoint</code>.
  ///
  /// Valid arguments are:
  ///
  /// <ul>
  /// <li>
  /// <code>"--enable-glue-datacatalog": ""</code>
  /// </li>
  /// <li>
  /// <code>"GLUE_PYTHON_VERSION": "3"</code>
  /// </li>
  /// <li>
  /// <code>"GLUE_PYTHON_VERSION": "2"</code>
  /// </li>
  /// </ul>
  /// You can specify a version of Python support for development endpoints by
  /// using the <code>Arguments</code> parameter in the
  /// <code>CreateDevEndpoint</code> or <code>UpdateDevEndpoint</code> APIs. If no
  /// arguments are provided, the version defaults to Python 2.
  @_s.JsonKey(name: 'Arguments')
  final Map<String, String> arguments;

  /// The AWS Availability Zone where this <code>DevEndpoint</code> is located.
  @_s.JsonKey(name: 'AvailabilityZone')
  final String availabilityZone;

  /// The point in time at which this <code>DevEndpoint</code> was created.
  @_s.JsonKey(
      name: 'CreatedTimestamp',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime createdTimestamp;

  /// The name assigned to the new <code>DevEndpoint</code>.
  @_s.JsonKey(name: 'EndpointName')
  final String endpointName;

  /// Path to one or more Java <code>.jar</code> files in an S3 bucket that will
  /// be loaded in your <code>DevEndpoint</code>.
  @_s.JsonKey(name: 'ExtraJarsS3Path')
  final String extraJarsS3Path;

  /// The paths to one or more Python libraries in an S3 bucket that will be
  /// loaded in your <code>DevEndpoint</code>.
  @_s.JsonKey(name: 'ExtraPythonLibsS3Path')
  final String extraPythonLibsS3Path;

  /// The reason for a current failure in this <code>DevEndpoint</code>.
  @_s.JsonKey(name: 'FailureReason')
  final String failureReason;

  /// Glue version determines the versions of Apache Spark and Python that AWS
  /// Glue supports. The Python version indicates the version supported for
  /// running your ETL scripts on development endpoints.
  @_s.JsonKey(name: 'GlueVersion')
  final String glueVersion;

  /// The number of AWS Glue Data Processing Units (DPUs) allocated to this
  /// DevEndpoint.
  @_s.JsonKey(name: 'NumberOfNodes')
  final int numberOfNodes;

  /// The number of workers of a defined <code>workerType</code> that are
  /// allocated to the development endpoint.
  @_s.JsonKey(name: 'NumberOfWorkers')
  final int numberOfWorkers;

  /// The Amazon Resource Name (ARN) of the role assigned to the new
  /// <code>DevEndpoint</code>.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;

  /// The name of the <code>SecurityConfiguration</code> structure being used with
  /// this <code>DevEndpoint</code>.
  @_s.JsonKey(name: 'SecurityConfiguration')
  final String securityConfiguration;

  /// The security groups assigned to the new <code>DevEndpoint</code>.
  @_s.JsonKey(name: 'SecurityGroupIds')
  final List<String> securityGroupIds;

  /// The current status of the new <code>DevEndpoint</code>.
  @_s.JsonKey(name: 'Status')
  final String status;

  /// The subnet ID assigned to the new <code>DevEndpoint</code>.
  @_s.JsonKey(name: 'SubnetId')
  final String subnetId;

  /// The ID of the virtual private cloud (VPC) used by this
  /// <code>DevEndpoint</code>.
  @_s.JsonKey(name: 'VpcId')
  final String vpcId;

  /// The type of predefined worker that is allocated to the development endpoint.
  /// May be a value of Standard, G.1X, or G.2X.
  @_s.JsonKey(name: 'WorkerType')
  final WorkerType workerType;

  /// The address of the YARN endpoint used by this <code>DevEndpoint</code>.
  @_s.JsonKey(name: 'YarnEndpointAddress')
  final String yarnEndpointAddress;

  /// The Apache Zeppelin port for the remote Apache Spark interpreter.
  @_s.JsonKey(name: 'ZeppelinRemoteSparkInterpreterPort')
  final int zeppelinRemoteSparkInterpreterPort;

  CreateDevEndpointResponse({
    this.arguments,
    this.availabilityZone,
    this.createdTimestamp,
    this.endpointName,
    this.extraJarsS3Path,
    this.extraPythonLibsS3Path,
    this.failureReason,
    this.glueVersion,
    this.numberOfNodes,
    this.numberOfWorkers,
    this.roleArn,
    this.securityConfiguration,
    this.securityGroupIds,
    this.status,
    this.subnetId,
    this.vpcId,
    this.workerType,
    this.yarnEndpointAddress,
    this.zeppelinRemoteSparkInterpreterPort,
  });
  factory CreateDevEndpointResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateDevEndpointResponseFromJson(json);
}

/// Specifies a <code>grok</code> classifier for <code>CreateClassifier</code>
/// to create.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateGrokClassifierRequest {
  /// An identifier of the data format that the classifier matches, such as
  /// Twitter, JSON, Omniture logs, Amazon CloudWatch Logs, and so on.
  @_s.JsonKey(name: 'Classification')
  final String classification;

  /// The grok pattern used by this classifier.
  @_s.JsonKey(name: 'GrokPattern')
  final String grokPattern;

  /// The name of the new classifier.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Optional custom grok patterns used by this classifier.
  @_s.JsonKey(name: 'CustomPatterns')
  final String customPatterns;

  CreateGrokClassifierRequest({
    @_s.required this.classification,
    @_s.required this.grokPattern,
    @_s.required this.name,
    this.customPatterns,
  });
  Map<String, dynamic> toJson() => _$CreateGrokClassifierRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateJobRequest {
  /// The <code>JobCommand</code> that executes this job.
  @_s.JsonKey(name: 'Command')
  final JobCommand command;

  /// The name you assign to this job definition. It must be unique in your
  /// account.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The name or Amazon Resource Name (ARN) of the IAM role associated with this
  /// job.
  @_s.JsonKey(name: 'Role')
  final String role;

  /// This parameter is deprecated. Use <code>MaxCapacity</code> instead.
  ///
  /// The number of AWS Glue data processing units (DPUs) to allocate to this Job.
  /// You can allocate from 2 to 100 DPUs; the default is 10. A DPU is a relative
  /// measure of processing power that consists of 4 vCPUs of compute capacity and
  /// 16 GB of memory. For more information, see the <a
  /// href="https://aws.amazon.com/glue/pricing/">AWS Glue pricing page</a>.
  @_s.JsonKey(name: 'AllocatedCapacity')
  final int allocatedCapacity;

  /// The connections used for this job.
  @_s.JsonKey(name: 'Connections')
  final ConnectionsList connections;

  /// The default arguments for this job.
  ///
  /// You can specify arguments here that your own job-execution script consumes,
  /// as well as arguments that AWS Glue itself consumes.
  ///
  /// For information about how to specify and consume your own Job arguments, see
  /// the <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-python-calling.html">Calling
  /// AWS Glue APIs in Python</a> topic in the developer guide.
  ///
  /// For information about the key-value pairs that AWS Glue consumes to set up
  /// your job, see the <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-etl-glue-arguments.html">Special
  /// Parameters Used by AWS Glue</a> topic in the developer guide.
  @_s.JsonKey(name: 'DefaultArguments')
  final Map<String, String> defaultArguments;

  /// Description of the job being defined.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// An <code>ExecutionProperty</code> specifying the maximum number of
  /// concurrent runs allowed for this job.
  @_s.JsonKey(name: 'ExecutionProperty')
  final ExecutionProperty executionProperty;

  /// Glue version determines the versions of Apache Spark and Python that AWS
  /// Glue supports. The Python version indicates the version supported for jobs
  /// of type Spark.
  ///
  /// For more information about the available AWS Glue versions and corresponding
  /// Spark and Python versions, see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/add-job.html">Glue
  /// version</a> in the developer guide.
  ///
  /// Jobs that are created without specifying a Glue version default to Glue 0.9.
  @_s.JsonKey(name: 'GlueVersion')
  final String glueVersion;

  /// This field is reserved for future use.
  @_s.JsonKey(name: 'LogUri')
  final String logUri;

  /// The number of AWS Glue data processing units (DPUs) that can be allocated
  /// when this job runs. A DPU is a relative measure of processing power that
  /// consists of 4 vCPUs of compute capacity and 16 GB of memory. For more
  /// information, see the <a href="https://aws.amazon.com/glue/pricing/">AWS Glue
  /// pricing page</a>.
  ///
  /// Do not set <code>Max Capacity</code> if using <code>WorkerType</code> and
  /// <code>NumberOfWorkers</code>.
  ///
  /// The value that can be allocated for <code>MaxCapacity</code> depends on
  /// whether you are running a Python shell job or an Apache Spark ETL job:
  ///
  /// <ul>
  /// <li>
  /// When you specify a Python shell job
  /// (<code>JobCommand.Name</code>="pythonshell"), you can allocate either 0.0625
  /// or 1 DPU. The default is 0.0625 DPU.
  /// </li>
  /// <li>
  /// When you specify an Apache Spark ETL job
  /// (<code>JobCommand.Name</code>="glueetl"), you can allocate from 2 to 100
  /// DPUs. The default is 10 DPUs. This job type cannot have a fractional DPU
  /// allocation.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'MaxCapacity')
  final double maxCapacity;

  /// The maximum number of times to retry this job if it fails.
  @_s.JsonKey(name: 'MaxRetries')
  final int maxRetries;

  /// Non-overridable arguments for this job, specified as name-value pairs.
  @_s.JsonKey(name: 'NonOverridableArguments')
  final Map<String, String> nonOverridableArguments;

  /// Specifies configuration properties of a job notification.
  @_s.JsonKey(name: 'NotificationProperty')
  final NotificationProperty notificationProperty;

  /// The number of workers of a defined <code>workerType</code> that are
  /// allocated when a job runs.
  ///
  /// The maximum number of workers you can define are 299 for <code>G.1X</code>,
  /// and 149 for <code>G.2X</code>.
  @_s.JsonKey(name: 'NumberOfWorkers')
  final int numberOfWorkers;

  /// The name of the <code>SecurityConfiguration</code> structure to be used with
  /// this job.
  @_s.JsonKey(name: 'SecurityConfiguration')
  final String securityConfiguration;

  /// The tags to use with this job. You may use tags to limit access to the job.
  /// For more information about tags in AWS Glue, see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/monitor-tags.html">AWS Tags
  /// in AWS Glue</a> in the developer guide.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  /// The job timeout in minutes. This is the maximum time that a job run can
  /// consume resources before it is terminated and enters <code>TIMEOUT</code>
  /// status. The default is 2,880 minutes (48 hours).
  @_s.JsonKey(name: 'Timeout')
  final int timeout;

  /// The type of predefined worker that is allocated when a job runs. Accepts a
  /// value of Standard, G.1X, or G.2X.
  ///
  /// <ul>
  /// <li>
  /// For the <code>Standard</code> worker type, each worker provides 4 vCPU, 16
  /// GB of memory and a 50GB disk, and 2 executors per worker.
  /// </li>
  /// <li>
  /// For the <code>G.1X</code> worker type, each worker maps to 1 DPU (4 vCPU, 16
  /// GB of memory, 64 GB disk), and provides 1 executor per worker. We recommend
  /// this worker type for memory-intensive jobs.
  /// </li>
  /// <li>
  /// For the <code>G.2X</code> worker type, each worker maps to 2 DPU (8 vCPU, 32
  /// GB of memory, 128 GB disk), and provides 1 executor per worker. We recommend
  /// this worker type for memory-intensive jobs.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'WorkerType')
  final WorkerType workerType;

  CreateJobRequest({
    @_s.required this.command,
    @_s.required this.name,
    @_s.required this.role,
    this.allocatedCapacity,
    this.connections,
    this.defaultArguments,
    this.description,
    this.executionProperty,
    this.glueVersion,
    this.logUri,
    this.maxCapacity,
    this.maxRetries,
    this.nonOverridableArguments,
    this.notificationProperty,
    this.numberOfWorkers,
    this.securityConfiguration,
    this.tags,
    this.timeout,
    this.workerType,
  });
  Map<String, dynamic> toJson() => _$CreateJobRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateJobResponse {
  /// The unique name that was provided for this job definition.
  @_s.JsonKey(name: 'Name')
  final String name;

  CreateJobResponse({
    this.name,
  });
  factory CreateJobResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateJobResponseFromJson(json);
}

/// Specifies a JSON classifier for <code>CreateClassifier</code> to create.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateJsonClassifierRequest {
  /// A <code>JsonPath</code> string defining the JSON data for the classifier to
  /// classify. AWS Glue supports a subset of <code>JsonPath</code>, as described
  /// in <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/custom-classifier.html#custom-classifier-json">Writing
  /// JsonPath Custom Classifiers</a>.
  @_s.JsonKey(name: 'JsonPath')
  final String jsonPath;

  /// The name of the classifier.
  @_s.JsonKey(name: 'Name')
  final String name;

  CreateJsonClassifierRequest({
    @_s.required this.jsonPath,
    @_s.required this.name,
  });
  Map<String, dynamic> toJson() => _$CreateJsonClassifierRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateMLTransformRequest {
  /// A list of AWS Glue table definitions used by the transform.
  @_s.JsonKey(name: 'InputRecordTables')
  final List<GlueTable> inputRecordTables;

  /// The unique name that you give the transform when you create it.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The algorithmic parameters that are specific to the transform type used.
  /// Conditionally dependent on the transform type.
  @_s.JsonKey(name: 'Parameters')
  final TransformParameters parameters;

  /// The name or Amazon Resource Name (ARN) of the IAM role with the required
  /// permissions. The required permissions include both AWS Glue service role
  /// permissions to AWS Glue resources, and Amazon S3 permissions required by the
  /// transform.
  ///
  /// <ul>
  /// <li>
  /// This role needs AWS Glue service role permissions to allow access to
  /// resources in AWS Glue. See <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/attach-policy-iam-user.html">Attach
  /// a Policy to IAM Users That Access AWS Glue</a>.
  /// </li>
  /// <li>
  /// This role needs permission to your Amazon Simple Storage Service (Amazon S3)
  /// sources, targets, temporary directory, scripts, and any libraries used by
  /// the task run for this transform.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Role')
  final String role;

  /// A description of the machine learning transform that is being defined. The
  /// default is an empty string.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// This value determines which version of AWS Glue this machine learning
  /// transform is compatible with. Glue 1.0 is recommended for most customers. If
  /// the value is not set, the Glue compatibility defaults to Glue 0.9. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/release-notes.html#release-notes-versions">AWS
  /// Glue Versions</a> in the developer guide.
  @_s.JsonKey(name: 'GlueVersion')
  final String glueVersion;

  /// The number of AWS Glue data processing units (DPUs) that are allocated to
  /// task runs for this transform. You can allocate from 2 to 100 DPUs; the
  /// default is 10. A DPU is a relative measure of processing power that consists
  /// of 4 vCPUs of compute capacity and 16 GB of memory. For more information,
  /// see the <a href="https://aws.amazon.com/glue/pricing/">AWS Glue pricing
  /// page</a>.
  ///
  /// <code>MaxCapacity</code> is a mutually exclusive option with
  /// <code>NumberOfWorkers</code> and <code>WorkerType</code>.
  ///
  /// <ul>
  /// <li>
  /// If either <code>NumberOfWorkers</code> or <code>WorkerType</code> is set,
  /// then <code>MaxCapacity</code> cannot be set.
  /// </li>
  /// <li>
  /// If <code>MaxCapacity</code> is set then neither <code>NumberOfWorkers</code>
  /// or <code>WorkerType</code> can be set.
  /// </li>
  /// <li>
  /// If <code>WorkerType</code> is set, then <code>NumberOfWorkers</code> is
  /// required (and vice versa).
  /// </li>
  /// <li>
  /// <code>MaxCapacity</code> and <code>NumberOfWorkers</code> must both be at
  /// least 1.
  /// </li>
  /// </ul>
  /// When the <code>WorkerType</code> field is set to a value other than
  /// <code>Standard</code>, the <code>MaxCapacity</code> field is set
  /// automatically and becomes read-only.
  ///
  /// When the <code>WorkerType</code> field is set to a value other than
  /// <code>Standard</code>, the <code>MaxCapacity</code> field is set
  /// automatically and becomes read-only.
  @_s.JsonKey(name: 'MaxCapacity')
  final double maxCapacity;

  /// The maximum number of times to retry a task for this transform after a task
  /// run fails.
  @_s.JsonKey(name: 'MaxRetries')
  final int maxRetries;

  /// The number of workers of a defined <code>workerType</code> that are
  /// allocated when this task runs.
  ///
  /// If <code>WorkerType</code> is set, then <code>NumberOfWorkers</code> is
  /// required (and vice versa).
  @_s.JsonKey(name: 'NumberOfWorkers')
  final int numberOfWorkers;

  /// The tags to use with this machine learning transform. You may use tags to
  /// limit access to the machine learning transform. For more information about
  /// tags in AWS Glue, see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/monitor-tags.html">AWS Tags
  /// in AWS Glue</a> in the developer guide.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  /// The timeout of the task run for this transform in minutes. This is the
  /// maximum time that a task run for this transform can consume resources before
  /// it is terminated and enters <code>TIMEOUT</code> status. The default is
  /// 2,880 minutes (48 hours).
  @_s.JsonKey(name: 'Timeout')
  final int timeout;

  /// The type of predefined worker that is allocated when this task runs. Accepts
  /// a value of Standard, G.1X, or G.2X.
  ///
  /// <ul>
  /// <li>
  /// For the <code>Standard</code> worker type, each worker provides 4 vCPU, 16
  /// GB of memory and a 50GB disk, and 2 executors per worker.
  /// </li>
  /// <li>
  /// For the <code>G.1X</code> worker type, each worker provides 4 vCPU, 16 GB of
  /// memory and a 64GB disk, and 1 executor per worker.
  /// </li>
  /// <li>
  /// For the <code>G.2X</code> worker type, each worker provides 8 vCPU, 32 GB of
  /// memory and a 128GB disk, and 1 executor per worker.
  /// </li>
  /// </ul>
  /// <code>MaxCapacity</code> is a mutually exclusive option with
  /// <code>NumberOfWorkers</code> and <code>WorkerType</code>.
  ///
  /// <ul>
  /// <li>
  /// If either <code>NumberOfWorkers</code> or <code>WorkerType</code> is set,
  /// then <code>MaxCapacity</code> cannot be set.
  /// </li>
  /// <li>
  /// If <code>MaxCapacity</code> is set then neither <code>NumberOfWorkers</code>
  /// or <code>WorkerType</code> can be set.
  /// </li>
  /// <li>
  /// If <code>WorkerType</code> is set, then <code>NumberOfWorkers</code> is
  /// required (and vice versa).
  /// </li>
  /// <li>
  /// <code>MaxCapacity</code> and <code>NumberOfWorkers</code> must both be at
  /// least 1.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'WorkerType')
  final WorkerType workerType;

  CreateMLTransformRequest({
    @_s.required this.inputRecordTables,
    @_s.required this.name,
    @_s.required this.parameters,
    @_s.required this.role,
    this.description,
    this.glueVersion,
    this.maxCapacity,
    this.maxRetries,
    this.numberOfWorkers,
    this.tags,
    this.timeout,
    this.workerType,
  });
  Map<String, dynamic> toJson() => _$CreateMLTransformRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateMLTransformResponse {
  /// A unique identifier that is generated for the transform.
  @_s.JsonKey(name: 'TransformId')
  final String transformId;

  CreateMLTransformResponse({
    this.transformId,
  });
  factory CreateMLTransformResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateMLTransformResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreatePartitionRequest {
  /// The name of the metadata database in which the partition is to be created.
  @_s.JsonKey(name: 'DatabaseName')
  final String databaseName;

  /// A <code>PartitionInput</code> structure defining the partition to be
  /// created.
  @_s.JsonKey(name: 'PartitionInput')
  final PartitionInput partitionInput;

  /// The name of the metadata table in which the partition is to be created.
  @_s.JsonKey(name: 'TableName')
  final String tableName;

  /// The AWS account ID of the catalog in which the partition is to be created.
  @_s.JsonKey(name: 'CatalogId')
  final String catalogId;

  CreatePartitionRequest({
    @_s.required this.databaseName,
    @_s.required this.partitionInput,
    @_s.required this.tableName,
    this.catalogId,
  });
  Map<String, dynamic> toJson() => _$CreatePartitionRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreatePartitionResponse {
  CreatePartitionResponse();
  factory CreatePartitionResponse.fromJson(Map<String, dynamic> json) =>
      _$CreatePartitionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateScriptRequest {
  /// A list of the edges in the DAG.
  @_s.JsonKey(name: 'DagEdges')
  final List<CodeGenEdge> dagEdges;

  /// A list of the nodes in the DAG.
  @_s.JsonKey(name: 'DagNodes')
  final List<CodeGenNode> dagNodes;

  /// The programming language of the resulting code from the DAG.
  @_s.JsonKey(name: 'Language')
  final Language language;

  CreateScriptRequest({
    this.dagEdges,
    this.dagNodes,
    this.language,
  });
  Map<String, dynamic> toJson() => _$CreateScriptRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateScriptResponse {
  /// The Python script generated from the DAG.
  @_s.JsonKey(name: 'PythonScript')
  final String pythonScript;

  /// The Scala code generated from the DAG.
  @_s.JsonKey(name: 'ScalaCode')
  final String scalaCode;

  CreateScriptResponse({
    this.pythonScript,
    this.scalaCode,
  });
  factory CreateScriptResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateScriptResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateSecurityConfigurationRequest {
  /// The encryption configuration for the new security configuration.
  @_s.JsonKey(name: 'EncryptionConfiguration')
  final EncryptionConfiguration encryptionConfiguration;

  /// The name for the new security configuration.
  @_s.JsonKey(name: 'Name')
  final String name;

  CreateSecurityConfigurationRequest({
    @_s.required this.encryptionConfiguration,
    @_s.required this.name,
  });
  Map<String, dynamic> toJson() =>
      _$CreateSecurityConfigurationRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateSecurityConfigurationResponse {
  /// The time at which the new security configuration was created.
  @_s.JsonKey(
      name: 'CreatedTimestamp',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime createdTimestamp;

  /// The name assigned to the new security configuration.
  @_s.JsonKey(name: 'Name')
  final String name;

  CreateSecurityConfigurationResponse({
    this.createdTimestamp,
    this.name,
  });
  factory CreateSecurityConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateSecurityConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateTableRequest {
  /// The catalog database in which to create the new table. For Hive
  /// compatibility, this name is entirely lowercase.
  @_s.JsonKey(name: 'DatabaseName')
  final String databaseName;

  /// The <code>TableInput</code> object that defines the metadata table to create
  /// in the catalog.
  @_s.JsonKey(name: 'TableInput')
  final TableInput tableInput;

  /// The ID of the Data Catalog in which to create the <code>Table</code>. If
  /// none is supplied, the AWS account ID is used by default.
  @_s.JsonKey(name: 'CatalogId')
  final String catalogId;

  CreateTableRequest({
    @_s.required this.databaseName,
    @_s.required this.tableInput,
    this.catalogId,
  });
  Map<String, dynamic> toJson() => _$CreateTableRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateTableResponse {
  CreateTableResponse();
  factory CreateTableResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateTableResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateTriggerRequest {
  /// The actions initiated by this trigger when it fires.
  @_s.JsonKey(name: 'Actions')
  final List<Action> actions;

  /// The name of the trigger.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The type of the new trigger.
  @_s.JsonKey(name: 'Type')
  final TriggerType type;

  /// A description of the new trigger.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// A predicate to specify when the new trigger should fire.
  ///
  /// This field is required when the trigger type is <code>CONDITIONAL</code>.
  @_s.JsonKey(name: 'Predicate')
  final Predicate predicate;

  /// A <code>cron</code> expression used to specify the schedule (see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/monitor-data-warehouse-schedule.html">Time-Based
  /// Schedules for Jobs and Crawlers</a>. For example, to run something every day
  /// at 12:15 UTC, you would specify: <code>cron(15 12 * * ? *)</code>.
  ///
  /// This field is required when the trigger type is SCHEDULED.
  @_s.JsonKey(name: 'Schedule')
  final String schedule;

  /// Set to <code>true</code> to start <code>SCHEDULED</code> and
  /// <code>CONDITIONAL</code> triggers when created. True is not supported for
  /// <code>ON_DEMAND</code> triggers.
  @_s.JsonKey(name: 'StartOnCreation')
  final bool startOnCreation;

  /// The tags to use with this trigger. You may use tags to limit access to the
  /// trigger. For more information about tags in AWS Glue, see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/monitor-tags.html">AWS Tags
  /// in AWS Glue</a> in the developer guide.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  /// The name of the workflow associated with the trigger.
  @_s.JsonKey(name: 'WorkflowName')
  final String workflowName;

  CreateTriggerRequest({
    @_s.required this.actions,
    @_s.required this.name,
    @_s.required this.type,
    this.description,
    this.predicate,
    this.schedule,
    this.startOnCreation,
    this.tags,
    this.workflowName,
  });
  Map<String, dynamic> toJson() => _$CreateTriggerRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateTriggerResponse {
  /// The name of the trigger.
  @_s.JsonKey(name: 'Name')
  final String name;

  CreateTriggerResponse({
    this.name,
  });
  factory CreateTriggerResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateTriggerResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateUserDefinedFunctionRequest {
  /// The name of the catalog database in which to create the function.
  @_s.JsonKey(name: 'DatabaseName')
  final String databaseName;

  /// A <code>FunctionInput</code> object that defines the function to create in
  /// the Data Catalog.
  @_s.JsonKey(name: 'FunctionInput')
  final UserDefinedFunctionInput functionInput;

  /// The ID of the Data Catalog in which to create the function. If none is
  /// provided, the AWS account ID is used by default.
  @_s.JsonKey(name: 'CatalogId')
  final String catalogId;

  CreateUserDefinedFunctionRequest({
    @_s.required this.databaseName,
    @_s.required this.functionInput,
    this.catalogId,
  });
  Map<String, dynamic> toJson() =>
      _$CreateUserDefinedFunctionRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateUserDefinedFunctionResponse {
  CreateUserDefinedFunctionResponse();
  factory CreateUserDefinedFunctionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateUserDefinedFunctionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateWorkflowRequest {
  /// The name to be assigned to the workflow. It should be unique within your
  /// account.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// A collection of properties to be used as part of each execution of the
  /// workflow.
  @_s.JsonKey(name: 'DefaultRunProperties')
  final Map<String, String> defaultRunProperties;

  /// A description of the workflow.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The tags to be used with this workflow.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  CreateWorkflowRequest({
    @_s.required this.name,
    this.defaultRunProperties,
    this.description,
    this.tags,
  });
  Map<String, dynamic> toJson() => _$CreateWorkflowRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateWorkflowResponse {
  /// The name of the workflow which was provided as part of the request.
  @_s.JsonKey(name: 'Name')
  final String name;

  CreateWorkflowResponse({
    this.name,
  });
  factory CreateWorkflowResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateWorkflowResponseFromJson(json);
}

/// Specifies an XML classifier for <code>CreateClassifier</code> to create.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateXMLClassifierRequest {
  /// An identifier of the data format that the classifier matches.
  @_s.JsonKey(name: 'Classification')
  final String classification;

  /// The name of the classifier.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The XML tag designating the element that contains each record in an XML
  /// document being parsed. This can't identify a self-closing element (closed by
  /// <code>/&gt;</code>). An empty row element that contains only attributes can
  /// be parsed as long as it ends with a closing tag (for example, <code>&lt;row
  /// item_a="A" item_b="B"&gt;&lt;/row&gt;</code> is okay, but <code>&lt;row
  /// item_a="A" item_b="B" /&gt;</code> is not).
  @_s.JsonKey(name: 'RowTag')
  final String rowTag;

  CreateXMLClassifierRequest({
    @_s.required this.classification,
    @_s.required this.name,
    this.rowTag,
  });
  Map<String, dynamic> toJson() => _$CreateXMLClassifierRequestToJson(this);
}

/// A classifier for custom <code>CSV</code> content.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CsvClassifier {
  /// The name of the classifier.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Enables the processing of files that contain only one column.
  @_s.JsonKey(name: 'AllowSingleColumn')
  final bool allowSingleColumn;

  /// Indicates whether the CSV file contains a header.
  @_s.JsonKey(name: 'ContainsHeader')
  final CsvHeaderOption containsHeader;

  /// The time that this classifier was registered.
  @_s.JsonKey(
      name: 'CreationTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime creationTime;

  /// A custom symbol to denote what separates each column entry in the row.
  @_s.JsonKey(name: 'Delimiter')
  final String delimiter;

  /// Specifies not to trim values before identifying the type of column values.
  /// The default value is <code>true</code>.
  @_s.JsonKey(name: 'DisableValueTrimming')
  final bool disableValueTrimming;

  /// A list of strings representing column names.
  @_s.JsonKey(name: 'Header')
  final List<String> header;

  /// The time that this classifier was last updated.
  @_s.JsonKey(
      name: 'LastUpdated',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastUpdated;

  /// A custom symbol to denote what combines content into a single column value.
  /// It must be different from the column delimiter.
  @_s.JsonKey(name: 'QuoteSymbol')
  final String quoteSymbol;

  /// The version of this classifier.
  @_s.JsonKey(name: 'Version')
  final int version;

  CsvClassifier({
    @_s.required this.name,
    this.allowSingleColumn,
    this.containsHeader,
    this.creationTime,
    this.delimiter,
    this.disableValueTrimming,
    this.header,
    this.lastUpdated,
    this.quoteSymbol,
    this.version,
  });
  factory CsvClassifier.fromJson(Map<String, dynamic> json) =>
      _$CsvClassifierFromJson(json);
}

enum CsvHeaderOption {
  @_s.JsonValue('UNKNOWN')
  unknown,
  @_s.JsonValue('PRESENT')
  present,
  @_s.JsonValue('ABSENT')
  absent,
}

/// Contains configuration information for maintaining Data Catalog security.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DataCatalogEncryptionSettings {
  /// When connection password protection is enabled, the Data Catalog uses a
  /// customer-provided key to encrypt the password as part of
  /// <code>CreateConnection</code> or <code>UpdateConnection</code> and store it
  /// in the <code>ENCRYPTED_PASSWORD</code> field in the connection properties.
  /// You can enable catalog encryption or only password encryption.
  @_s.JsonKey(name: 'ConnectionPasswordEncryption')
  final ConnectionPasswordEncryption connectionPasswordEncryption;

  /// Specifies the encryption-at-rest configuration for the Data Catalog.
  @_s.JsonKey(name: 'EncryptionAtRest')
  final EncryptionAtRest encryptionAtRest;

  DataCatalogEncryptionSettings({
    this.connectionPasswordEncryption,
    this.encryptionAtRest,
  });
  factory DataCatalogEncryptionSettings.fromJson(Map<String, dynamic> json) =>
      _$DataCatalogEncryptionSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$DataCatalogEncryptionSettingsToJson(this);
}

/// The AWS Lake Formation principal.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DataLakePrincipal {
  /// An identifier for the AWS Lake Formation principal.
  @_s.JsonKey(name: 'DataLakePrincipalIdentifier')
  final String dataLakePrincipalIdentifier;

  DataLakePrincipal({
    this.dataLakePrincipalIdentifier,
  });
  factory DataLakePrincipal.fromJson(Map<String, dynamic> json) =>
      _$DataLakePrincipalFromJson(json);

  Map<String, dynamic> toJson() => _$DataLakePrincipalToJson(this);
}

/// The <code>Database</code> object represents a logical grouping of tables
/// that might reside in a Hive metastore or an RDBMS.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Database {
  /// The name of the database. For Hive compatibility, this is folded to
  /// lowercase when it is stored.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Creates a set of default permissions on the table for principals.
  @_s.JsonKey(name: 'CreateTableDefaultPermissions')
  final List<PrincipalPermissions> createTableDefaultPermissions;

  /// The time at which the metadata database was created in the catalog.
  @_s.JsonKey(
      name: 'CreateTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime createTime;

  /// A description of the database.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The location of the database (for example, an HDFS path).
  @_s.JsonKey(name: 'LocationUri')
  final String locationUri;

  /// These key-value pairs define parameters and properties of the database.
  @_s.JsonKey(name: 'Parameters')
  final Map<String, String> parameters;

  Database({
    @_s.required this.name,
    this.createTableDefaultPermissions,
    this.createTime,
    this.description,
    this.locationUri,
    this.parameters,
  });
  factory Database.fromJson(Map<String, dynamic> json) =>
      _$DatabaseFromJson(json);
}

/// The structure used to create or update a database.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DatabaseInput {
  /// The name of the database. For Hive compatibility, this is folded to
  /// lowercase when it is stored.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Creates a set of default permissions on the table for principals.
  @_s.JsonKey(name: 'CreateTableDefaultPermissions')
  final List<PrincipalPermissions> createTableDefaultPermissions;

  /// A description of the database.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The location of the database (for example, an HDFS path).
  @_s.JsonKey(name: 'LocationUri')
  final String locationUri;

  /// These key-value pairs define parameters and properties of the database.
  ///
  /// These key-value pairs define parameters and properties of the database.
  @_s.JsonKey(name: 'Parameters')
  final Map<String, String> parameters;

  DatabaseInput({
    @_s.required this.name,
    this.createTableDefaultPermissions,
    this.description,
    this.locationUri,
    this.parameters,
  });
  Map<String, dynamic> toJson() => _$DatabaseInputToJson(this);
}

enum DeleteBehavior {
  @_s.JsonValue('LOG')
  log,
  @_s.JsonValue('DELETE_FROM_DATABASE')
  deleteFromDatabase,
  @_s.JsonValue('DEPRECATE_IN_DATABASE')
  deprecateInDatabase,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteClassifierRequest {
  /// Name of the classifier to remove.
  @_s.JsonKey(name: 'Name')
  final String name;

  DeleteClassifierRequest({
    @_s.required this.name,
  });
  Map<String, dynamic> toJson() => _$DeleteClassifierRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteClassifierResponse {
  DeleteClassifierResponse();
  factory DeleteClassifierResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteClassifierResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteConnectionRequest {
  /// The name of the connection to delete.
  @_s.JsonKey(name: 'ConnectionName')
  final String connectionName;

  /// The ID of the Data Catalog in which the connection resides. If none is
  /// provided, the AWS account ID is used by default.
  @_s.JsonKey(name: 'CatalogId')
  final String catalogId;

  DeleteConnectionRequest({
    @_s.required this.connectionName,
    this.catalogId,
  });
  Map<String, dynamic> toJson() => _$DeleteConnectionRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteConnectionResponse {
  DeleteConnectionResponse();
  factory DeleteConnectionResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteConnectionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteCrawlerRequest {
  /// The name of the crawler to remove.
  @_s.JsonKey(name: 'Name')
  final String name;

  DeleteCrawlerRequest({
    @_s.required this.name,
  });
  Map<String, dynamic> toJson() => _$DeleteCrawlerRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteCrawlerResponse {
  DeleteCrawlerResponse();
  factory DeleteCrawlerResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteCrawlerResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteDatabaseRequest {
  /// The name of the database to delete. For Hive compatibility, this must be all
  /// lowercase.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The ID of the Data Catalog in which the database resides. If none is
  /// provided, the AWS account ID is used by default.
  @_s.JsonKey(name: 'CatalogId')
  final String catalogId;

  DeleteDatabaseRequest({
    @_s.required this.name,
    this.catalogId,
  });
  Map<String, dynamic> toJson() => _$DeleteDatabaseRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteDatabaseResponse {
  DeleteDatabaseResponse();
  factory DeleteDatabaseResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteDatabaseResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteDevEndpointRequest {
  /// The name of the <code>DevEndpoint</code>.
  @_s.JsonKey(name: 'EndpointName')
  final String endpointName;

  DeleteDevEndpointRequest({
    @_s.required this.endpointName,
  });
  Map<String, dynamic> toJson() => _$DeleteDevEndpointRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteDevEndpointResponse {
  DeleteDevEndpointResponse();
  factory DeleteDevEndpointResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteDevEndpointResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteJobRequest {
  /// The name of the job definition to delete.
  @_s.JsonKey(name: 'JobName')
  final String jobName;

  DeleteJobRequest({
    @_s.required this.jobName,
  });
  Map<String, dynamic> toJson() => _$DeleteJobRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteJobResponse {
  /// The name of the job definition that was deleted.
  @_s.JsonKey(name: 'JobName')
  final String jobName;

  DeleteJobResponse({
    this.jobName,
  });
  factory DeleteJobResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteMLTransformRequest {
  /// The unique identifier of the transform to delete.
  @_s.JsonKey(name: 'TransformId')
  final String transformId;

  DeleteMLTransformRequest({
    @_s.required this.transformId,
  });
  Map<String, dynamic> toJson() => _$DeleteMLTransformRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteMLTransformResponse {
  /// The unique identifier of the transform that was deleted.
  @_s.JsonKey(name: 'TransformId')
  final String transformId;

  DeleteMLTransformResponse({
    this.transformId,
  });
  factory DeleteMLTransformResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteMLTransformResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeletePartitionRequest {
  /// The name of the catalog database in which the table in question resides.
  @_s.JsonKey(name: 'DatabaseName')
  final String databaseName;

  /// The values that define the partition.
  @_s.JsonKey(name: 'PartitionValues')
  final List<String> partitionValues;

  /// The name of the table that contains the partition to be deleted.
  @_s.JsonKey(name: 'TableName')
  final String tableName;

  /// The ID of the Data Catalog where the partition to be deleted resides. If
  /// none is provided, the AWS account ID is used by default.
  @_s.JsonKey(name: 'CatalogId')
  final String catalogId;

  DeletePartitionRequest({
    @_s.required this.databaseName,
    @_s.required this.partitionValues,
    @_s.required this.tableName,
    this.catalogId,
  });
  Map<String, dynamic> toJson() => _$DeletePartitionRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeletePartitionResponse {
  DeletePartitionResponse();
  factory DeletePartitionResponse.fromJson(Map<String, dynamic> json) =>
      _$DeletePartitionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteResourcePolicyRequest {
  /// The hash value returned when this policy was set.
  @_s.JsonKey(name: 'PolicyHashCondition')
  final String policyHashCondition;

  DeleteResourcePolicyRequest({
    this.policyHashCondition,
  });
  Map<String, dynamic> toJson() => _$DeleteResourcePolicyRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteResourcePolicyResponse {
  DeleteResourcePolicyResponse();
  factory DeleteResourcePolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteResourcePolicyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteSecurityConfigurationRequest {
  /// The name of the security configuration to delete.
  @_s.JsonKey(name: 'Name')
  final String name;

  DeleteSecurityConfigurationRequest({
    @_s.required this.name,
  });
  Map<String, dynamic> toJson() =>
      _$DeleteSecurityConfigurationRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteSecurityConfigurationResponse {
  DeleteSecurityConfigurationResponse();
  factory DeleteSecurityConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteSecurityConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteTableRequest {
  /// The name of the catalog database in which the table resides. For Hive
  /// compatibility, this name is entirely lowercase.
  @_s.JsonKey(name: 'DatabaseName')
  final String databaseName;

  /// The name of the table to be deleted. For Hive compatibility, this name is
  /// entirely lowercase.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The ID of the Data Catalog where the table resides. If none is provided, the
  /// AWS account ID is used by default.
  @_s.JsonKey(name: 'CatalogId')
  final String catalogId;

  DeleteTableRequest({
    @_s.required this.databaseName,
    @_s.required this.name,
    this.catalogId,
  });
  Map<String, dynamic> toJson() => _$DeleteTableRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteTableResponse {
  DeleteTableResponse();
  factory DeleteTableResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteTableResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteTableVersionRequest {
  /// The database in the catalog in which the table resides. For Hive
  /// compatibility, this name is entirely lowercase.
  @_s.JsonKey(name: 'DatabaseName')
  final String databaseName;

  /// The name of the table. For Hive compatibility, this name is entirely
  /// lowercase.
  @_s.JsonKey(name: 'TableName')
  final String tableName;

  /// The ID of the table version to be deleted. A <code>VersionID</code> is a
  /// string representation of an integer. Each version is incremented by 1.
  @_s.JsonKey(name: 'VersionId')
  final String versionId;

  /// The ID of the Data Catalog where the tables reside. If none is provided, the
  /// AWS account ID is used by default.
  @_s.JsonKey(name: 'CatalogId')
  final String catalogId;

  DeleteTableVersionRequest({
    @_s.required this.databaseName,
    @_s.required this.tableName,
    @_s.required this.versionId,
    this.catalogId,
  });
  Map<String, dynamic> toJson() => _$DeleteTableVersionRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteTableVersionResponse {
  DeleteTableVersionResponse();
  factory DeleteTableVersionResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteTableVersionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteTriggerRequest {
  /// The name of the trigger to delete.
  @_s.JsonKey(name: 'Name')
  final String name;

  DeleteTriggerRequest({
    @_s.required this.name,
  });
  Map<String, dynamic> toJson() => _$DeleteTriggerRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteTriggerResponse {
  /// The name of the trigger that was deleted.
  @_s.JsonKey(name: 'Name')
  final String name;

  DeleteTriggerResponse({
    this.name,
  });
  factory DeleteTriggerResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteTriggerResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteUserDefinedFunctionRequest {
  /// The name of the catalog database where the function is located.
  @_s.JsonKey(name: 'DatabaseName')
  final String databaseName;

  /// The name of the function definition to be deleted.
  @_s.JsonKey(name: 'FunctionName')
  final String functionName;

  /// The ID of the Data Catalog where the function to be deleted is located. If
  /// none is supplied, the AWS account ID is used by default.
  @_s.JsonKey(name: 'CatalogId')
  final String catalogId;

  DeleteUserDefinedFunctionRequest({
    @_s.required this.databaseName,
    @_s.required this.functionName,
    this.catalogId,
  });
  Map<String, dynamic> toJson() =>
      _$DeleteUserDefinedFunctionRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteUserDefinedFunctionResponse {
  DeleteUserDefinedFunctionResponse();
  factory DeleteUserDefinedFunctionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteUserDefinedFunctionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteWorkflowRequest {
  /// Name of the workflow to be deleted.
  @_s.JsonKey(name: 'Name')
  final String name;

  DeleteWorkflowRequest({
    @_s.required this.name,
  });
  Map<String, dynamic> toJson() => _$DeleteWorkflowRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteWorkflowResponse {
  /// Name of the workflow specified in input.
  @_s.JsonKey(name: 'Name')
  final String name;

  DeleteWorkflowResponse({
    this.name,
  });
  factory DeleteWorkflowResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteWorkflowResponseFromJson(json);
}

/// A development endpoint where a developer can remotely debug extract,
/// transform, and load (ETL) scripts.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DevEndpoint {
  /// A map of arguments used to configure the <code>DevEndpoint</code>.
  ///
  /// Valid arguments are:
  ///
  /// <ul>
  /// <li>
  /// <code>"--enable-glue-datacatalog": ""</code>
  /// </li>
  /// <li>
  /// <code>"GLUE_PYTHON_VERSION": "3"</code>
  /// </li>
  /// <li>
  /// <code>"GLUE_PYTHON_VERSION": "2"</code>
  /// </li>
  /// </ul>
  /// You can specify a version of Python support for development endpoints by
  /// using the <code>Arguments</code> parameter in the
  /// <code>CreateDevEndpoint</code> or <code>UpdateDevEndpoint</code> APIs. If no
  /// arguments are provided, the version defaults to Python 2.
  @_s.JsonKey(name: 'Arguments')
  final Map<String, String> arguments;

  /// The AWS Availability Zone where this <code>DevEndpoint</code> is located.
  @_s.JsonKey(name: 'AvailabilityZone')
  final String availabilityZone;

  /// The point in time at which this DevEndpoint was created.
  @_s.JsonKey(
      name: 'CreatedTimestamp',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime createdTimestamp;

  /// The name of the <code>DevEndpoint</code>.
  @_s.JsonKey(name: 'EndpointName')
  final String endpointName;

  /// The path to one or more Java <code>.jar</code> files in an S3 bucket that
  /// should be loaded in your <code>DevEndpoint</code>.
  /// <note>
  /// You can only use pure Java/Scala libraries with a <code>DevEndpoint</code>.
  /// </note>
  @_s.JsonKey(name: 'ExtraJarsS3Path')
  final String extraJarsS3Path;

  /// The paths to one or more Python libraries in an Amazon S3 bucket that should
  /// be loaded in your <code>DevEndpoint</code>. Multiple values must be complete
  /// paths separated by a comma.
  /// <note>
  /// You can only use pure Python libraries with a <code>DevEndpoint</code>.
  /// Libraries that rely on C extensions, such as the <a
  /// href="http://pandas.pydata.org/">pandas</a> Python data analysis library,
  /// are not currently supported.
  /// </note>
  @_s.JsonKey(name: 'ExtraPythonLibsS3Path')
  final String extraPythonLibsS3Path;

  /// The reason for a current failure in this <code>DevEndpoint</code>.
  @_s.JsonKey(name: 'FailureReason')
  final String failureReason;

  /// Glue version determines the versions of Apache Spark and Python that AWS
  /// Glue supports. The Python version indicates the version supported for
  /// running your ETL scripts on development endpoints.
  ///
  /// For more information about the available AWS Glue versions and corresponding
  /// Spark and Python versions, see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/add-job.html">Glue
  /// version</a> in the developer guide.
  ///
  /// Development endpoints that are created without specifying a Glue version
  /// default to Glue 0.9.
  ///
  /// You can specify a version of Python support for development endpoints by
  /// using the <code>Arguments</code> parameter in the
  /// <code>CreateDevEndpoint</code> or <code>UpdateDevEndpoint</code> APIs. If no
  /// arguments are provided, the version defaults to Python 2.
  @_s.JsonKey(name: 'GlueVersion')
  final String glueVersion;

  /// The point in time at which this <code>DevEndpoint</code> was last modified.
  @_s.JsonKey(
      name: 'LastModifiedTimestamp',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastModifiedTimestamp;

  /// The status of the last update.
  @_s.JsonKey(name: 'LastUpdateStatus')
  final String lastUpdateStatus;

  /// The number of AWS Glue Data Processing Units (DPUs) allocated to this
  /// <code>DevEndpoint</code>.
  @_s.JsonKey(name: 'NumberOfNodes')
  final int numberOfNodes;

  /// The number of workers of a defined <code>workerType</code> that are
  /// allocated to the development endpoint.
  ///
  /// The maximum number of workers you can define are 299 for <code>G.1X</code>,
  /// and 149 for <code>G.2X</code>.
  @_s.JsonKey(name: 'NumberOfWorkers')
  final int numberOfWorkers;

  /// A private IP address to access the <code>DevEndpoint</code> within a VPC if
  /// the <code>DevEndpoint</code> is created within one. The
  /// <code>PrivateAddress</code> field is present only when you create the
  /// <code>DevEndpoint</code> within your VPC.
  @_s.JsonKey(name: 'PrivateAddress')
  final String privateAddress;

  /// The public IP address used by this <code>DevEndpoint</code>. The
  /// <code>PublicAddress</code> field is present only when you create a
  /// non-virtual private cloud (VPC) <code>DevEndpoint</code>.
  @_s.JsonKey(name: 'PublicAddress')
  final String publicAddress;

  /// The public key to be used by this <code>DevEndpoint</code> for
  /// authentication. This attribute is provided for backward compatibility
  /// because the recommended attribute to use is public keys.
  @_s.JsonKey(name: 'PublicKey')
  final String publicKey;

  /// A list of public keys to be used by the <code>DevEndpoints</code> for
  /// authentication. Using this attribute is preferred over a single public key
  /// because the public keys allow you to have a different private key per
  /// client.
  /// <note>
  /// If you previously created an endpoint with a public key, you must remove
  /// that key to be able to set a list of public keys. Call the
  /// <code>UpdateDevEndpoint</code> API operation with the public key content in
  /// the <code>deletePublicKeys</code> attribute, and the list of new keys in the
  /// <code>addPublicKeys</code> attribute.
  /// </note>
  @_s.JsonKey(name: 'PublicKeys')
  final List<String> publicKeys;

  /// The Amazon Resource Name (ARN) of the IAM role used in this
  /// <code>DevEndpoint</code>.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;

  /// The name of the <code>SecurityConfiguration</code> structure to be used with
  /// this <code>DevEndpoint</code>.
  @_s.JsonKey(name: 'SecurityConfiguration')
  final String securityConfiguration;

  /// A list of security group identifiers used in this <code>DevEndpoint</code>.
  @_s.JsonKey(name: 'SecurityGroupIds')
  final List<String> securityGroupIds;

  /// The current status of this <code>DevEndpoint</code>.
  @_s.JsonKey(name: 'Status')
  final String status;

  /// The subnet ID for this <code>DevEndpoint</code>.
  @_s.JsonKey(name: 'SubnetId')
  final String subnetId;

  /// The ID of the virtual private cloud (VPC) used by this
  /// <code>DevEndpoint</code>.
  @_s.JsonKey(name: 'VpcId')
  final String vpcId;

  /// The type of predefined worker that is allocated to the development endpoint.
  /// Accepts a value of Standard, G.1X, or G.2X.
  ///
  /// <ul>
  /// <li>
  /// For the <code>Standard</code> worker type, each worker provides 4 vCPU, 16
  /// GB of memory and a 50GB disk, and 2 executors per worker.
  /// </li>
  /// <li>
  /// For the <code>G.1X</code> worker type, each worker maps to 1 DPU (4 vCPU, 16
  /// GB of memory, 64 GB disk), and provides 1 executor per worker. We recommend
  /// this worker type for memory-intensive jobs.
  /// </li>
  /// <li>
  /// For the <code>G.2X</code> worker type, each worker maps to 2 DPU (8 vCPU, 32
  /// GB of memory, 128 GB disk), and provides 1 executor per worker. We recommend
  /// this worker type for memory-intensive jobs.
  /// </li>
  /// </ul>
  /// Known issue: when a development endpoint is created with the
  /// <code>G.2X</code> <code>WorkerType</code> configuration, the Spark drivers
  /// for the development endpoint will run on 4 vCPU, 16 GB of memory, and a 64
  /// GB disk.
  @_s.JsonKey(name: 'WorkerType')
  final WorkerType workerType;

  /// The YARN endpoint address used by this <code>DevEndpoint</code>.
  @_s.JsonKey(name: 'YarnEndpointAddress')
  final String yarnEndpointAddress;

  /// The Apache Zeppelin port for the remote Apache Spark interpreter.
  @_s.JsonKey(name: 'ZeppelinRemoteSparkInterpreterPort')
  final int zeppelinRemoteSparkInterpreterPort;

  DevEndpoint({
    this.arguments,
    this.availabilityZone,
    this.createdTimestamp,
    this.endpointName,
    this.extraJarsS3Path,
    this.extraPythonLibsS3Path,
    this.failureReason,
    this.glueVersion,
    this.lastModifiedTimestamp,
    this.lastUpdateStatus,
    this.numberOfNodes,
    this.numberOfWorkers,
    this.privateAddress,
    this.publicAddress,
    this.publicKey,
    this.publicKeys,
    this.roleArn,
    this.securityConfiguration,
    this.securityGroupIds,
    this.status,
    this.subnetId,
    this.vpcId,
    this.workerType,
    this.yarnEndpointAddress,
    this.zeppelinRemoteSparkInterpreterPort,
  });
  factory DevEndpoint.fromJson(Map<String, dynamic> json) =>
      _$DevEndpointFromJson(json);
}

/// Custom libraries to be loaded into a development endpoint.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DevEndpointCustomLibraries {
  /// The path to one or more Java <code>.jar</code> files in an S3 bucket that
  /// should be loaded in your <code>DevEndpoint</code>.
  /// <note>
  /// You can only use pure Java/Scala libraries with a <code>DevEndpoint</code>.
  /// </note>
  @_s.JsonKey(name: 'ExtraJarsS3Path')
  final String extraJarsS3Path;

  /// The paths to one or more Python libraries in an Amazon Simple Storage
  /// Service (Amazon S3) bucket that should be loaded in your
  /// <code>DevEndpoint</code>. Multiple values must be complete paths separated
  /// by a comma.
  /// <note>
  /// You can only use pure Python libraries with a <code>DevEndpoint</code>.
  /// Libraries that rely on C extensions, such as the <a
  /// href="http://pandas.pydata.org/">pandas</a> Python data analysis library,
  /// are not currently supported.
  /// </note>
  @_s.JsonKey(name: 'ExtraPythonLibsS3Path')
  final String extraPythonLibsS3Path;

  DevEndpointCustomLibraries({
    this.extraJarsS3Path,
    this.extraPythonLibsS3Path,
  });
  Map<String, dynamic> toJson() => _$DevEndpointCustomLibrariesToJson(this);
}

/// Specifies an Amazon DynamoDB table to crawl.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DynamoDBTarget {
  /// The name of the DynamoDB table to crawl.
  @_s.JsonKey(name: 'Path')
  final String path;

  DynamoDBTarget({
    this.path,
  });
  factory DynamoDBTarget.fromJson(Map<String, dynamic> json) =>
      _$DynamoDBTargetFromJson(json);

  Map<String, dynamic> toJson() => _$DynamoDBTargetToJson(this);
}

/// An edge represents a directed connection between two AWS Glue components
/// which are part of the workflow the edge belongs to.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Edge {
  /// The unique of the node within the workflow where the edge ends.
  @_s.JsonKey(name: 'DestinationId')
  final String destinationId;

  /// The unique of the node within the workflow where the edge starts.
  @_s.JsonKey(name: 'SourceId')
  final String sourceId;

  Edge({
    this.destinationId,
    this.sourceId,
  });
  factory Edge.fromJson(Map<String, dynamic> json) => _$EdgeFromJson(json);
}

/// Specifies the encryption-at-rest configuration for the Data Catalog.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EncryptionAtRest {
  /// The encryption-at-rest mode for encrypting Data Catalog data.
  @_s.JsonKey(name: 'CatalogEncryptionMode')
  final CatalogEncryptionMode catalogEncryptionMode;

  /// The ID of the AWS KMS key to use for encryption at rest.
  @_s.JsonKey(name: 'SseAwsKmsKeyId')
  final String sseAwsKmsKeyId;

  EncryptionAtRest({
    @_s.required this.catalogEncryptionMode,
    this.sseAwsKmsKeyId,
  });
  factory EncryptionAtRest.fromJson(Map<String, dynamic> json) =>
      _$EncryptionAtRestFromJson(json);

  Map<String, dynamic> toJson() => _$EncryptionAtRestToJson(this);
}

/// Specifies an encryption configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EncryptionConfiguration {
  /// The encryption configuration for Amazon CloudWatch.
  @_s.JsonKey(name: 'CloudWatchEncryption')
  final CloudWatchEncryption cloudWatchEncryption;

  /// The encryption configuration for job bookmarks.
  @_s.JsonKey(name: 'JobBookmarksEncryption')
  final JobBookmarksEncryption jobBookmarksEncryption;

  /// The encryption configuration for Amazon Simple Storage Service (Amazon S3)
  /// data.
  @_s.JsonKey(name: 'S3Encryption')
  final List<S3Encryption> s3Encryption;

  EncryptionConfiguration({
    this.cloudWatchEncryption,
    this.jobBookmarksEncryption,
    this.s3Encryption,
  });
  factory EncryptionConfiguration.fromJson(Map<String, dynamic> json) =>
      _$EncryptionConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$EncryptionConfigurationToJson(this);
}

/// Contains details about an error.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ErrorDetail {
  /// The code associated with this error.
  @_s.JsonKey(name: 'ErrorCode')
  final String errorCode;

  /// A message describing the error.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  ErrorDetail({
    this.errorCode,
    this.errorMessage,
  });
  factory ErrorDetail.fromJson(Map<String, dynamic> json) =>
      _$ErrorDetailFromJson(json);
}

/// Evaluation metrics provide an estimate of the quality of your machine
/// learning transform.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EvaluationMetrics {
  /// The type of machine learning transform.
  @_s.JsonKey(name: 'TransformType')
  final TransformType transformType;

  /// The evaluation metrics for the find matches algorithm.
  @_s.JsonKey(name: 'FindMatchesMetrics')
  final FindMatchesMetrics findMatchesMetrics;

  EvaluationMetrics({
    @_s.required this.transformType,
    this.findMatchesMetrics,
  });
  factory EvaluationMetrics.fromJson(Map<String, dynamic> json) =>
      _$EvaluationMetricsFromJson(json);
}

/// An execution property of a job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ExecutionProperty {
  /// The maximum number of concurrent runs allowed for the job. The default is 1.
  /// An error is returned when this threshold is reached. The maximum value you
  /// can specify is controlled by a service limit.
  @_s.JsonKey(name: 'MaxConcurrentRuns')
  final int maxConcurrentRuns;

  ExecutionProperty({
    this.maxConcurrentRuns,
  });
  factory ExecutionProperty.fromJson(Map<String, dynamic> json) =>
      _$ExecutionPropertyFromJson(json);

  Map<String, dynamic> toJson() => _$ExecutionPropertyToJson(this);
}

enum ExistCondition {
  @_s.JsonValue('MUST_EXIST')
  mustExist,
  @_s.JsonValue('NOT_EXIST')
  notExist,
  @_s.JsonValue('NONE')
  none,
}

/// Specifies configuration properties for an exporting labels task run.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ExportLabelsTaskRunProperties {
  /// The Amazon Simple Storage Service (Amazon S3) path where you will export the
  /// labels.
  @_s.JsonKey(name: 'OutputS3Path')
  final String outputS3Path;

  ExportLabelsTaskRunProperties({
    this.outputS3Path,
  });
  factory ExportLabelsTaskRunProperties.fromJson(Map<String, dynamic> json) =>
      _$ExportLabelsTaskRunPropertiesFromJson(json);
}

/// The evaluation metrics for the find matches algorithm. The quality of your
/// machine learning transform is measured by getting your transform to predict
/// some matches and comparing the results to known matches from the same
/// dataset. The quality metrics are based on a subset of your data, so they are
/// not precise.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FindMatchesMetrics {
  /// The area under the precision/recall curve (AUPRC) is a single number
  /// measuring the overall quality of the transform, that is independent of the
  /// choice made for precision vs. recall. Higher values indicate that you have a
  /// more attractive precision vs. recall tradeoff.
  ///
  /// For more information, see <a
  /// href="https://en.wikipedia.org/wiki/Precision_and_recall">Precision and
  /// recall</a> in Wikipedia.
  @_s.JsonKey(name: 'AreaUnderPRCurve')
  final double areaUnderPRCurve;

  /// The confusion matrix shows you what your transform is predicting accurately
  /// and what types of errors it is making.
  ///
  /// For more information, see <a
  /// href="https://en.wikipedia.org/wiki/Confusion_matrix">Confusion matrix</a>
  /// in Wikipedia.
  @_s.JsonKey(name: 'ConfusionMatrix')
  final ConfusionMatrix confusionMatrix;

  /// The maximum F1 metric indicates the transform's accuracy between 0 and 1,
  /// where 1 is the best accuracy.
  ///
  /// For more information, see <a
  /// href="https://en.wikipedia.org/wiki/F1_score">F1 score</a> in Wikipedia.
  @_s.JsonKey(name: 'F1')
  final double f1;

  /// The precision metric indicates when often your transform is correct when it
  /// predicts a match. Specifically, it measures how well the transform finds
  /// true positives from the total true positives possible.
  ///
  /// For more information, see <a
  /// href="https://en.wikipedia.org/wiki/Precision_and_recall">Precision and
  /// recall</a> in Wikipedia.
  @_s.JsonKey(name: 'Precision')
  final double precision;

  /// The recall metric indicates that for an actual match, how often your
  /// transform predicts the match. Specifically, it measures how well the
  /// transform finds true positives from the total records in the source data.
  ///
  /// For more information, see <a
  /// href="https://en.wikipedia.org/wiki/Precision_and_recall">Precision and
  /// recall</a> in Wikipedia.
  @_s.JsonKey(name: 'Recall')
  final double recall;

  FindMatchesMetrics({
    this.areaUnderPRCurve,
    this.confusionMatrix,
    this.f1,
    this.precision,
    this.recall,
  });
  factory FindMatchesMetrics.fromJson(Map<String, dynamic> json) =>
      _$FindMatchesMetricsFromJson(json);
}

/// The parameters to configure the find matches transform.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class FindMatchesParameters {
  /// The value that is selected when tuning your transform for a balance between
  /// accuracy and cost. A value of 0.5 means that the system balances accuracy
  /// and cost concerns. A value of 1.0 means a bias purely for accuracy, which
  /// typically results in a higher cost, sometimes substantially higher. A value
  /// of 0.0 means a bias purely for cost, which results in a less accurate
  /// <code>FindMatches</code> transform, sometimes with unacceptable accuracy.
  ///
  /// Accuracy measures how well the transform finds true positives and true
  /// negatives. Increasing accuracy requires more machine resources and cost. But
  /// it also results in increased recall.
  ///
  /// Cost measures how many compute resources, and thus money, are consumed to
  /// run the transform.
  @_s.JsonKey(name: 'AccuracyCostTradeoff')
  final double accuracyCostTradeoff;

  /// The value to switch on or off to force the output to match the provided
  /// labels from users. If the value is <code>True</code>, the <code>find
  /// matches</code> transform forces the output to match the provided labels. The
  /// results override the normal conflation results. If the value is
  /// <code>False</code>, the <code>find matches</code> transform does not ensure
  /// all the labels provided are respected, and the results rely on the trained
  /// model.
  ///
  /// Note that setting this value to true may increase the conflation execution
  /// time.
  @_s.JsonKey(name: 'EnforceProvidedLabels')
  final bool enforceProvidedLabels;

  /// The value selected when tuning your transform for a balance between
  /// precision and recall. A value of 0.5 means no preference; a value of 1.0
  /// means a bias purely for precision, and a value of 0.0 means a bias for
  /// recall. Because this is a tradeoff, choosing values close to 1.0 means very
  /// low recall, and choosing values close to 0.0 results in very low precision.
  ///
  /// The precision metric indicates how often your model is correct when it
  /// predicts a match.
  ///
  /// The recall metric indicates that for an actual match, how often your model
  /// predicts the match.
  @_s.JsonKey(name: 'PrecisionRecallTradeoff')
  final double precisionRecallTradeoff;

  /// The name of a column that uniquely identifies rows in the source table. Used
  /// to help identify matching records.
  @_s.JsonKey(name: 'PrimaryKeyColumnName')
  final String primaryKeyColumnName;

  FindMatchesParameters({
    this.accuracyCostTradeoff,
    this.enforceProvidedLabels,
    this.precisionRecallTradeoff,
    this.primaryKeyColumnName,
  });
  factory FindMatchesParameters.fromJson(Map<String, dynamic> json) =>
      _$FindMatchesParametersFromJson(json);

  Map<String, dynamic> toJson() => _$FindMatchesParametersToJson(this);
}

/// Specifies configuration properties for a Find Matches task run.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FindMatchesTaskRunProperties {
  /// The job ID for the Find Matches task run.
  @_s.JsonKey(name: 'JobId')
  final String jobId;

  /// The name assigned to the job for the Find Matches task run.
  @_s.JsonKey(name: 'JobName')
  final String jobName;

  /// The job run ID for the Find Matches task run.
  @_s.JsonKey(name: 'JobRunId')
  final String jobRunId;

  FindMatchesTaskRunProperties({
    this.jobId,
    this.jobName,
    this.jobRunId,
  });
  factory FindMatchesTaskRunProperties.fromJson(Map<String, dynamic> json) =>
      _$FindMatchesTaskRunPropertiesFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GetCatalogImportStatusRequest {
  /// The ID of the catalog to migrate. Currently, this should be the AWS account
  /// ID.
  @_s.JsonKey(name: 'CatalogId')
  final String catalogId;

  GetCatalogImportStatusRequest({
    this.catalogId,
  });
  Map<String, dynamic> toJson() => _$GetCatalogImportStatusRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetCatalogImportStatusResponse {
  /// The status of the specified catalog migration.
  @_s.JsonKey(name: 'ImportStatus')
  final CatalogImportStatus importStatus;

  GetCatalogImportStatusResponse({
    this.importStatus,
  });
  factory GetCatalogImportStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCatalogImportStatusResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GetClassifierRequest {
  /// Name of the classifier to retrieve.
  @_s.JsonKey(name: 'Name')
  final String name;

  GetClassifierRequest({
    @_s.required this.name,
  });
  Map<String, dynamic> toJson() => _$GetClassifierRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetClassifierResponse {
  /// The requested classifier.
  @_s.JsonKey(name: 'Classifier')
  final Classifier classifier;

  GetClassifierResponse({
    this.classifier,
  });
  factory GetClassifierResponse.fromJson(Map<String, dynamic> json) =>
      _$GetClassifierResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GetClassifiersRequest {
  /// The size of the list to return (optional).
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  /// An optional continuation token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetClassifiersRequest({
    this.maxResults,
    this.nextToken,
  });
  Map<String, dynamic> toJson() => _$GetClassifiersRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetClassifiersResponse {
  /// The requested list of classifier objects.
  @_s.JsonKey(name: 'Classifiers')
  final List<Classifier> classifiers;

  /// A continuation token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetClassifiersResponse({
    this.classifiers,
    this.nextToken,
  });
  factory GetClassifiersResponse.fromJson(Map<String, dynamic> json) =>
      _$GetClassifiersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GetConnectionRequest {
  /// The name of the connection definition to retrieve.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The ID of the Data Catalog in which the connection resides. If none is
  /// provided, the AWS account ID is used by default.
  @_s.JsonKey(name: 'CatalogId')
  final String catalogId;

  /// Allows you to retrieve the connection metadata without returning the
  /// password. For instance, the AWS Glue console uses this flag to retrieve the
  /// connection, and does not display the password. Set this parameter when the
  /// caller might not have permission to use the AWS KMS key to decrypt the
  /// password, but it does have permission to access the rest of the connection
  /// properties.
  @_s.JsonKey(name: 'HidePassword')
  final bool hidePassword;

  GetConnectionRequest({
    @_s.required this.name,
    this.catalogId,
    this.hidePassword,
  });
  Map<String, dynamic> toJson() => _$GetConnectionRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetConnectionResponse {
  /// The requested connection definition.
  @_s.JsonKey(name: 'Connection')
  final Connection connection;

  GetConnectionResponse({
    this.connection,
  });
  factory GetConnectionResponse.fromJson(Map<String, dynamic> json) =>
      _$GetConnectionResponseFromJson(json);
}

/// Filters the connection definitions that are returned by the
/// <code>GetConnections</code> API operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GetConnectionsFilter {
  /// The type of connections to return. Currently, only JDBC is supported; SFTP
  /// is not supported.
  @_s.JsonKey(name: 'ConnectionType')
  final ConnectionType connectionType;

  /// A criteria string that must match the criteria recorded in the connection
  /// definition for that connection definition to be returned.
  @_s.JsonKey(name: 'MatchCriteria')
  final List<String> matchCriteria;

  GetConnectionsFilter({
    this.connectionType,
    this.matchCriteria,
  });
  Map<String, dynamic> toJson() => _$GetConnectionsFilterToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GetConnectionsRequest {
  /// The ID of the Data Catalog in which the connections reside. If none is
  /// provided, the AWS account ID is used by default.
  @_s.JsonKey(name: 'CatalogId')
  final String catalogId;

  /// A filter that controls which connections are returned.
  @_s.JsonKey(name: 'Filter')
  final GetConnectionsFilter filter;

  /// Allows you to retrieve the connection metadata without returning the
  /// password. For instance, the AWS Glue console uses this flag to retrieve the
  /// connection, and does not display the password. Set this parameter when the
  /// caller might not have permission to use the AWS KMS key to decrypt the
  /// password, but it does have permission to access the rest of the connection
  /// properties.
  @_s.JsonKey(name: 'HidePassword')
  final bool hidePassword;

  /// The maximum number of connections to return in one response.
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  /// A continuation token, if this is a continuation call.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetConnectionsRequest({
    this.catalogId,
    this.filter,
    this.hidePassword,
    this.maxResults,
    this.nextToken,
  });
  Map<String, dynamic> toJson() => _$GetConnectionsRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetConnectionsResponse {
  /// A list of requested connection definitions.
  @_s.JsonKey(name: 'ConnectionList')
  final List<Connection> connectionList;

  /// A continuation token, if the list of connections returned does not include
  /// the last of the filtered connections.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetConnectionsResponse({
    this.connectionList,
    this.nextToken,
  });
  factory GetConnectionsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetConnectionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GetCrawlerMetricsRequest {
  /// A list of the names of crawlers about which to retrieve metrics.
  @_s.JsonKey(name: 'CrawlerNameList')
  final List<String> crawlerNameList;

  /// The maximum size of a list to return.
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  /// A continuation token, if this is a continuation call.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetCrawlerMetricsRequest({
    this.crawlerNameList,
    this.maxResults,
    this.nextToken,
  });
  Map<String, dynamic> toJson() => _$GetCrawlerMetricsRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetCrawlerMetricsResponse {
  /// A list of metrics for the specified crawler.
  @_s.JsonKey(name: 'CrawlerMetricsList')
  final List<CrawlerMetrics> crawlerMetricsList;

  /// A continuation token, if the returned list does not contain the last metric
  /// available.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetCrawlerMetricsResponse({
    this.crawlerMetricsList,
    this.nextToken,
  });
  factory GetCrawlerMetricsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCrawlerMetricsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GetCrawlerRequest {
  /// The name of the crawler to retrieve metadata for.
  @_s.JsonKey(name: 'Name')
  final String name;

  GetCrawlerRequest({
    @_s.required this.name,
  });
  Map<String, dynamic> toJson() => _$GetCrawlerRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetCrawlerResponse {
  /// The metadata for the specified crawler.
  @_s.JsonKey(name: 'Crawler')
  final Crawler crawler;

  GetCrawlerResponse({
    this.crawler,
  });
  factory GetCrawlerResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCrawlerResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GetCrawlersRequest {
  /// The number of crawlers to return on each call.
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  /// A continuation token, if this is a continuation request.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetCrawlersRequest({
    this.maxResults,
    this.nextToken,
  });
  Map<String, dynamic> toJson() => _$GetCrawlersRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetCrawlersResponse {
  /// A list of crawler metadata.
  @_s.JsonKey(name: 'Crawlers')
  final List<Crawler> crawlers;

  /// A continuation token, if the returned list has not reached the end of those
  /// defined in this customer account.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetCrawlersResponse({
    this.crawlers,
    this.nextToken,
  });
  factory GetCrawlersResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCrawlersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GetDataCatalogEncryptionSettingsRequest {
  /// The ID of the Data Catalog to retrieve the security configuration for. If
  /// none is provided, the AWS account ID is used by default.
  @_s.JsonKey(name: 'CatalogId')
  final String catalogId;

  GetDataCatalogEncryptionSettingsRequest({
    this.catalogId,
  });
  Map<String, dynamic> toJson() =>
      _$GetDataCatalogEncryptionSettingsRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDataCatalogEncryptionSettingsResponse {
  /// The requested security configuration.
  @_s.JsonKey(name: 'DataCatalogEncryptionSettings')
  final DataCatalogEncryptionSettings dataCatalogEncryptionSettings;

  GetDataCatalogEncryptionSettingsResponse({
    this.dataCatalogEncryptionSettings,
  });
  factory GetDataCatalogEncryptionSettingsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetDataCatalogEncryptionSettingsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GetDatabaseRequest {
  /// The name of the database to retrieve. For Hive compatibility, this should be
  /// all lowercase.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The ID of the Data Catalog in which the database resides. If none is
  /// provided, the AWS account ID is used by default.
  @_s.JsonKey(name: 'CatalogId')
  final String catalogId;

  GetDatabaseRequest({
    @_s.required this.name,
    this.catalogId,
  });
  Map<String, dynamic> toJson() => _$GetDatabaseRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDatabaseResponse {
  /// The definition of the specified database in the Data Catalog.
  @_s.JsonKey(name: 'Database')
  final Database database;

  GetDatabaseResponse({
    this.database,
  });
  factory GetDatabaseResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDatabaseResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GetDatabasesRequest {
  /// The ID of the Data Catalog from which to retrieve <code>Databases</code>. If
  /// none is provided, the AWS account ID is used by default.
  @_s.JsonKey(name: 'CatalogId')
  final String catalogId;

  /// The maximum number of databases to return in one response.
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  /// A continuation token, if this is a continuation call.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetDatabasesRequest({
    this.catalogId,
    this.maxResults,
    this.nextToken,
  });
  Map<String, dynamic> toJson() => _$GetDatabasesRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDatabasesResponse {
  /// A list of <code>Database</code> objects from the specified catalog.
  @_s.JsonKey(name: 'DatabaseList')
  final List<Database> databaseList;

  /// A continuation token for paginating the returned list of tokens, returned if
  /// the current segment of the list is not the last.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetDatabasesResponse({
    @_s.required this.databaseList,
    this.nextToken,
  });
  factory GetDatabasesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDatabasesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GetDataflowGraphRequest {
  /// The Python script to transform.
  @_s.JsonKey(name: 'PythonScript')
  final String pythonScript;

  GetDataflowGraphRequest({
    this.pythonScript,
  });
  Map<String, dynamic> toJson() => _$GetDataflowGraphRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDataflowGraphResponse {
  /// A list of the edges in the resulting DAG.
  @_s.JsonKey(name: 'DagEdges')
  final List<CodeGenEdge> dagEdges;

  /// A list of the nodes in the resulting DAG.
  @_s.JsonKey(name: 'DagNodes')
  final List<CodeGenNode> dagNodes;

  GetDataflowGraphResponse({
    this.dagEdges,
    this.dagNodes,
  });
  factory GetDataflowGraphResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDataflowGraphResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GetDevEndpointRequest {
  /// Name of the <code>DevEndpoint</code> to retrieve information for.
  @_s.JsonKey(name: 'EndpointName')
  final String endpointName;

  GetDevEndpointRequest({
    @_s.required this.endpointName,
  });
  Map<String, dynamic> toJson() => _$GetDevEndpointRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDevEndpointResponse {
  /// A <code>DevEndpoint</code> definition.
  @_s.JsonKey(name: 'DevEndpoint')
  final DevEndpoint devEndpoint;

  GetDevEndpointResponse({
    this.devEndpoint,
  });
  factory GetDevEndpointResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDevEndpointResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GetDevEndpointsRequest {
  /// The maximum size of information to return.
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  /// A continuation token, if this is a continuation call.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetDevEndpointsRequest({
    this.maxResults,
    this.nextToken,
  });
  Map<String, dynamic> toJson() => _$GetDevEndpointsRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDevEndpointsResponse {
  /// A list of <code>DevEndpoint</code> definitions.
  @_s.JsonKey(name: 'DevEndpoints')
  final List<DevEndpoint> devEndpoints;

  /// A continuation token, if not all <code>DevEndpoint</code> definitions have
  /// yet been returned.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetDevEndpointsResponse({
    this.devEndpoints,
    this.nextToken,
  });
  factory GetDevEndpointsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDevEndpointsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GetJobBookmarkRequest {
  /// The name of the job in question.
  @_s.JsonKey(name: 'JobName')
  final String jobName;

  /// The unique run identifier associated with this job run.
  @_s.JsonKey(name: 'RunId')
  final String runId;

  GetJobBookmarkRequest({
    @_s.required this.jobName,
    this.runId,
  });
  Map<String, dynamic> toJson() => _$GetJobBookmarkRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetJobBookmarkResponse {
  /// A structure that defines a point that a job can resume processing.
  @_s.JsonKey(name: 'JobBookmarkEntry')
  final JobBookmarkEntry jobBookmarkEntry;

  GetJobBookmarkResponse({
    this.jobBookmarkEntry,
  });
  factory GetJobBookmarkResponse.fromJson(Map<String, dynamic> json) =>
      _$GetJobBookmarkResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GetJobRequest {
  /// The name of the job definition to retrieve.
  @_s.JsonKey(name: 'JobName')
  final String jobName;

  GetJobRequest({
    @_s.required this.jobName,
  });
  Map<String, dynamic> toJson() => _$GetJobRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetJobResponse {
  /// The requested job definition.
  @_s.JsonKey(name: 'Job')
  final Job job;

  GetJobResponse({
    this.job,
  });
  factory GetJobResponse.fromJson(Map<String, dynamic> json) =>
      _$GetJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GetJobRunRequest {
  /// Name of the job definition being run.
  @_s.JsonKey(name: 'JobName')
  final String jobName;

  /// The ID of the job run.
  @_s.JsonKey(name: 'RunId')
  final String runId;

  /// True if a list of predecessor runs should be returned.
  @_s.JsonKey(name: 'PredecessorsIncluded')
  final bool predecessorsIncluded;

  GetJobRunRequest({
    @_s.required this.jobName,
    @_s.required this.runId,
    this.predecessorsIncluded,
  });
  Map<String, dynamic> toJson() => _$GetJobRunRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetJobRunResponse {
  /// The requested job-run metadata.
  @_s.JsonKey(name: 'JobRun')
  final JobRun jobRun;

  GetJobRunResponse({
    this.jobRun,
  });
  factory GetJobRunResponse.fromJson(Map<String, dynamic> json) =>
      _$GetJobRunResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GetJobRunsRequest {
  /// The name of the job definition for which to retrieve all job runs.
  @_s.JsonKey(name: 'JobName')
  final String jobName;

  /// The maximum size of the response.
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  /// A continuation token, if this is a continuation call.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetJobRunsRequest({
    @_s.required this.jobName,
    this.maxResults,
    this.nextToken,
  });
  Map<String, dynamic> toJson() => _$GetJobRunsRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetJobRunsResponse {
  /// A list of job-run metadata objects.
  @_s.JsonKey(name: 'JobRuns')
  final List<JobRun> jobRuns;

  /// A continuation token, if not all requested job runs have been returned.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetJobRunsResponse({
    this.jobRuns,
    this.nextToken,
  });
  factory GetJobRunsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetJobRunsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GetJobsRequest {
  /// The maximum size of the response.
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  /// A continuation token, if this is a continuation call.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetJobsRequest({
    this.maxResults,
    this.nextToken,
  });
  Map<String, dynamic> toJson() => _$GetJobsRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetJobsResponse {
  /// A list of job definitions.
  @_s.JsonKey(name: 'Jobs')
  final List<Job> jobs;

  /// A continuation token, if not all job definitions have yet been returned.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetJobsResponse({
    this.jobs,
    this.nextToken,
  });
  factory GetJobsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetJobsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GetMLTaskRunRequest {
  /// The unique identifier of the task run.
  @_s.JsonKey(name: 'TaskRunId')
  final String taskRunId;

  /// The unique identifier of the machine learning transform.
  @_s.JsonKey(name: 'TransformId')
  final String transformId;

  GetMLTaskRunRequest({
    @_s.required this.taskRunId,
    @_s.required this.transformId,
  });
  Map<String, dynamic> toJson() => _$GetMLTaskRunRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetMLTaskRunResponse {
  /// The date and time when this task run was completed.
  @_s.JsonKey(
      name: 'CompletedOn',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime completedOn;

  /// The error strings that are associated with the task run.
  @_s.JsonKey(name: 'ErrorString')
  final String errorString;

  /// The amount of time (in seconds) that the task run consumed resources.
  @_s.JsonKey(name: 'ExecutionTime')
  final int executionTime;

  /// The date and time when this task run was last modified.
  @_s.JsonKey(
      name: 'LastModifiedOn',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastModifiedOn;

  /// The names of the log groups that are associated with the task run.
  @_s.JsonKey(name: 'LogGroupName')
  final String logGroupName;

  /// The list of properties that are associated with the task run.
  @_s.JsonKey(name: 'Properties')
  final TaskRunProperties properties;

  /// The date and time when this task run started.
  @_s.JsonKey(
      name: 'StartedOn',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime startedOn;

  /// The status for this task run.
  @_s.JsonKey(name: 'Status')
  final TaskStatusType status;

  /// The unique run identifier associated with this run.
  @_s.JsonKey(name: 'TaskRunId')
  final String taskRunId;

  /// The unique identifier of the task run.
  @_s.JsonKey(name: 'TransformId')
  final String transformId;

  GetMLTaskRunResponse({
    this.completedOn,
    this.errorString,
    this.executionTime,
    this.lastModifiedOn,
    this.logGroupName,
    this.properties,
    this.startedOn,
    this.status,
    this.taskRunId,
    this.transformId,
  });
  factory GetMLTaskRunResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMLTaskRunResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GetMLTaskRunsRequest {
  /// The unique identifier of the machine learning transform.
  @_s.JsonKey(name: 'TransformId')
  final String transformId;

  /// The filter criteria, in the <code>TaskRunFilterCriteria</code> structure,
  /// for the task run.
  @_s.JsonKey(name: 'Filter')
  final TaskRunFilterCriteria filter;

  /// The maximum number of results to return.
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  /// A token for pagination of the results. The default is empty.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The sorting criteria, in the <code>TaskRunSortCriteria</code> structure, for
  /// the task run.
  @_s.JsonKey(name: 'Sort')
  final TaskRunSortCriteria sort;

  GetMLTaskRunsRequest({
    @_s.required this.transformId,
    this.filter,
    this.maxResults,
    this.nextToken,
    this.sort,
  });
  Map<String, dynamic> toJson() => _$GetMLTaskRunsRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetMLTaskRunsResponse {
  /// A pagination token, if more results are available.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of task runs that are associated with the transform.
  @_s.JsonKey(name: 'TaskRuns')
  final List<TaskRun> taskRuns;

  GetMLTaskRunsResponse({
    this.nextToken,
    this.taskRuns,
  });
  factory GetMLTaskRunsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMLTaskRunsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GetMLTransformRequest {
  /// The unique identifier of the transform, generated at the time that the
  /// transform was created.
  @_s.JsonKey(name: 'TransformId')
  final String transformId;

  GetMLTransformRequest({
    @_s.required this.transformId,
  });
  Map<String, dynamic> toJson() => _$GetMLTransformRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetMLTransformResponse {
  /// The date and time when the transform was created.
  @_s.JsonKey(
      name: 'CreatedOn',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime createdOn;

  /// A description of the transform.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The latest evaluation metrics.
  @_s.JsonKey(name: 'EvaluationMetrics')
  final EvaluationMetrics evaluationMetrics;

  /// This value determines which version of AWS Glue this machine learning
  /// transform is compatible with. Glue 1.0 is recommended for most customers. If
  /// the value is not set, the Glue compatibility defaults to Glue 0.9. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/release-notes.html#release-notes-versions">AWS
  /// Glue Versions</a> in the developer guide.
  @_s.JsonKey(name: 'GlueVersion')
  final String glueVersion;

  /// A list of AWS Glue table definitions used by the transform.
  @_s.JsonKey(name: 'InputRecordTables')
  final List<GlueTable> inputRecordTables;

  /// The number of labels available for this transform.
  @_s.JsonKey(name: 'LabelCount')
  final int labelCount;

  /// The date and time when the transform was last modified.
  @_s.JsonKey(
      name: 'LastModifiedOn',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastModifiedOn;

  /// The number of AWS Glue data processing units (DPUs) that are allocated to
  /// task runs for this transform. You can allocate from 2 to 100 DPUs; the
  /// default is 10. A DPU is a relative measure of processing power that consists
  /// of 4 vCPUs of compute capacity and 16 GB of memory. For more information,
  /// see the <a href="https://aws.amazon.com/glue/pricing/">AWS Glue pricing
  /// page</a>.
  ///
  /// When the <code>WorkerType</code> field is set to a value other than
  /// <code>Standard</code>, the <code>MaxCapacity</code> field is set
  /// automatically and becomes read-only.
  @_s.JsonKey(name: 'MaxCapacity')
  final double maxCapacity;

  /// The maximum number of times to retry a task for this transform after a task
  /// run fails.
  @_s.JsonKey(name: 'MaxRetries')
  final int maxRetries;

  /// The unique name given to the transform when it was created.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The number of workers of a defined <code>workerType</code> that are
  /// allocated when this task runs.
  @_s.JsonKey(name: 'NumberOfWorkers')
  final int numberOfWorkers;

  /// The configuration parameters that are specific to the algorithm used.
  @_s.JsonKey(name: 'Parameters')
  final TransformParameters parameters;

  /// The name or Amazon Resource Name (ARN) of the IAM role with the required
  /// permissions.
  @_s.JsonKey(name: 'Role')
  final String role;

  /// The <code>Map&lt;Column, Type&gt;</code> object that represents the schema
  /// that this transform accepts. Has an upper bound of 100 columns.
  @_s.JsonKey(name: 'Schema')
  final List<SchemaColumn> schema;

  /// The last known status of the transform (to indicate whether it can be used
  /// or not). One of "NOT_READY", "READY", or "DELETING".
  @_s.JsonKey(name: 'Status')
  final TransformStatusType status;

  /// The timeout for a task run for this transform in minutes. This is the
  /// maximum time that a task run for this transform can consume resources before
  /// it is terminated and enters <code>TIMEOUT</code> status. The default is
  /// 2,880 minutes (48 hours).
  @_s.JsonKey(name: 'Timeout')
  final int timeout;

  /// The unique identifier of the transform, generated at the time that the
  /// transform was created.
  @_s.JsonKey(name: 'TransformId')
  final String transformId;

  /// The type of predefined worker that is allocated when this task runs. Accepts
  /// a value of Standard, G.1X, or G.2X.
  ///
  /// <ul>
  /// <li>
  /// For the <code>Standard</code> worker type, each worker provides 4 vCPU, 16
  /// GB of memory and a 50GB disk, and 2 executors per worker.
  /// </li>
  /// <li>
  /// For the <code>G.1X</code> worker type, each worker provides 4 vCPU, 16 GB of
  /// memory and a 64GB disk, and 1 executor per worker.
  /// </li>
  /// <li>
  /// For the <code>G.2X</code> worker type, each worker provides 8 vCPU, 32 GB of
  /// memory and a 128GB disk, and 1 executor per worker.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'WorkerType')
  final WorkerType workerType;

  GetMLTransformResponse({
    this.createdOn,
    this.description,
    this.evaluationMetrics,
    this.glueVersion,
    this.inputRecordTables,
    this.labelCount,
    this.lastModifiedOn,
    this.maxCapacity,
    this.maxRetries,
    this.name,
    this.numberOfWorkers,
    this.parameters,
    this.role,
    this.schema,
    this.status,
    this.timeout,
    this.transformId,
    this.workerType,
  });
  factory GetMLTransformResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMLTransformResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GetMLTransformsRequest {
  /// The filter transformation criteria.
  @_s.JsonKey(name: 'Filter')
  final TransformFilterCriteria filter;

  /// The maximum number of results to return.
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  /// A paginated token to offset the results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The sorting criteria.
  @_s.JsonKey(name: 'Sort')
  final TransformSortCriteria sort;

  GetMLTransformsRequest({
    this.filter,
    this.maxResults,
    this.nextToken,
    this.sort,
  });
  Map<String, dynamic> toJson() => _$GetMLTransformsRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetMLTransformsResponse {
  /// A list of machine learning transforms.
  @_s.JsonKey(name: 'Transforms')
  final List<MLTransform> transforms;

  /// A pagination token, if more results are available.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetMLTransformsResponse({
    @_s.required this.transforms,
    this.nextToken,
  });
  factory GetMLTransformsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMLTransformsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GetMappingRequest {
  /// Specifies the source table.
  @_s.JsonKey(name: 'Source')
  final CatalogEntry source;

  /// Parameters for the mapping.
  @_s.JsonKey(name: 'Location')
  final Location location;

  /// A list of target tables.
  @_s.JsonKey(name: 'Sinks')
  final List<CatalogEntry> sinks;

  GetMappingRequest({
    @_s.required this.source,
    this.location,
    this.sinks,
  });
  Map<String, dynamic> toJson() => _$GetMappingRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetMappingResponse {
  /// A list of mappings to the specified targets.
  @_s.JsonKey(name: 'Mapping')
  final List<MappingEntry> mapping;

  GetMappingResponse({
    @_s.required this.mapping,
  });
  factory GetMappingResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMappingResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GetPartitionRequest {
  /// The name of the catalog database where the partition resides.
  @_s.JsonKey(name: 'DatabaseName')
  final String databaseName;

  /// The values that define the partition.
  @_s.JsonKey(name: 'PartitionValues')
  final List<String> partitionValues;

  /// The name of the partition's table.
  @_s.JsonKey(name: 'TableName')
  final String tableName;

  /// The ID of the Data Catalog where the partition in question resides. If none
  /// is provided, the AWS account ID is used by default.
  @_s.JsonKey(name: 'CatalogId')
  final String catalogId;

  GetPartitionRequest({
    @_s.required this.databaseName,
    @_s.required this.partitionValues,
    @_s.required this.tableName,
    this.catalogId,
  });
  Map<String, dynamic> toJson() => _$GetPartitionRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetPartitionResponse {
  /// The requested information, in the form of a <code>Partition</code> object.
  @_s.JsonKey(name: 'Partition')
  final Partition partition;

  GetPartitionResponse({
    this.partition,
  });
  factory GetPartitionResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPartitionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GetPartitionsRequest {
  /// The name of the catalog database where the partitions reside.
  @_s.JsonKey(name: 'DatabaseName')
  final String databaseName;

  /// The name of the partitions' table.
  @_s.JsonKey(name: 'TableName')
  final String tableName;

  /// The ID of the Data Catalog where the partitions in question reside. If none
  /// is provided, the AWS account ID is used by default.
  @_s.JsonKey(name: 'CatalogId')
  final String catalogId;

  /// An expression that filters the partitions to be returned.
  ///
  /// The expression uses SQL syntax similar to the SQL <code>WHERE</code> filter
  /// clause. The SQL statement parser <a
  /// href="http://jsqlparser.sourceforge.net/home.php">JSQLParser</a> parses the
  /// expression.
  ///
  /// <i>Operators</i>: The following are the operators that you can use in the
  /// <code>Expression</code> API call:
  /// <dl> <dt>=</dt> <dd>
  /// Checks whether the values of the two operands are equal; if yes, then the
  /// condition becomes true.
  ///
  /// Example: Assume 'variable a' holds 10 and 'variable b' holds 20.
  ///
  /// (a = b) is not true.
  /// </dd> <dt>&lt; &gt;</dt> <dd>
  /// Checks whether the values of two operands are equal; if the values are not
  /// equal, then the condition becomes true.
  ///
  /// Example: (a &lt; &gt; b) is true.
  /// </dd> <dt>&gt;</dt> <dd>
  /// Checks whether the value of the left operand is greater than the value of
  /// the right operand; if yes, then the condition becomes true.
  ///
  /// Example: (a &gt; b) is not true.
  /// </dd> <dt>&lt;</dt> <dd>
  /// Checks whether the value of the left operand is less than the value of the
  /// right operand; if yes, then the condition becomes true.
  ///
  /// Example: (a &lt; b) is true.
  /// </dd> <dt>&gt;=</dt> <dd>
  /// Checks whether the value of the left operand is greater than or equal to the
  /// value of the right operand; if yes, then the condition becomes true.
  ///
  /// Example: (a &gt;= b) is not true.
  /// </dd> <dt>&lt;=</dt> <dd>
  /// Checks whether the value of the left operand is less than or equal to the
  /// value of the right operand; if yes, then the condition becomes true.
  ///
  /// Example: (a &lt;= b) is true.
  /// </dd> <dt>AND, OR, IN, BETWEEN, LIKE, NOT, IS NULL</dt> <dd>
  /// Logical operators.
  /// </dd> </dl>
  /// <i>Supported Partition Key Types</i>: The following are the supported
  /// partition keys.
  ///
  /// <ul>
  /// <li>
  /// <code>string</code>
  /// </li>
  /// <li>
  /// <code>date</code>
  /// </li>
  /// <li>
  /// <code>timestamp</code>
  /// </li>
  /// <li>
  /// <code>int</code>
  /// </li>
  /// <li>
  /// <code>bigint</code>
  /// </li>
  /// <li>
  /// <code>long</code>
  /// </li>
  /// <li>
  /// <code>tinyint</code>
  /// </li>
  /// <li>
  /// <code>smallint</code>
  /// </li>
  /// <li>
  /// <code>decimal</code>
  /// </li>
  /// </ul>
  /// If an invalid type is encountered, an exception is thrown.
  ///
  /// The following list shows the valid operators on each type. When you define a
  /// crawler, the <code>partitionKey</code> type is created as a
  /// <code>STRING</code>, to be compatible with the catalog partitions.
  ///
  /// <i>Sample API Call</i>:
  @_s.JsonKey(name: 'Expression')
  final String expression;

  /// The maximum number of partitions to return in a single response.
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  /// A continuation token, if this is not the first call to retrieve these
  /// partitions.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The segment of the table's partitions to scan in this request.
  @_s.JsonKey(name: 'Segment')
  final Segment segment;

  GetPartitionsRequest({
    @_s.required this.databaseName,
    @_s.required this.tableName,
    this.catalogId,
    this.expression,
    this.maxResults,
    this.nextToken,
    this.segment,
  });
  Map<String, dynamic> toJson() => _$GetPartitionsRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetPartitionsResponse {
  /// A continuation token, if the returned list of partitions does not include
  /// the last one.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of requested partitions.
  @_s.JsonKey(name: 'Partitions')
  final List<Partition> partitions;

  GetPartitionsResponse({
    this.nextToken,
    this.partitions,
  });
  factory GetPartitionsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPartitionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GetPlanRequest {
  /// The list of mappings from a source table to target tables.
  @_s.JsonKey(name: 'Mapping')
  final List<MappingEntry> mapping;

  /// The source table.
  @_s.JsonKey(name: 'Source')
  final CatalogEntry source;

  /// The programming language of the code to perform the mapping.
  @_s.JsonKey(name: 'Language')
  final Language language;

  /// The parameters for the mapping.
  @_s.JsonKey(name: 'Location')
  final Location location;

  /// The target tables.
  @_s.JsonKey(name: 'Sinks')
  final List<CatalogEntry> sinks;

  GetPlanRequest({
    @_s.required this.mapping,
    @_s.required this.source,
    this.language,
    this.location,
    this.sinks,
  });
  Map<String, dynamic> toJson() => _$GetPlanRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetPlanResponse {
  /// A Python script to perform the mapping.
  @_s.JsonKey(name: 'PythonScript')
  final String pythonScript;

  /// The Scala code to perform the mapping.
  @_s.JsonKey(name: 'ScalaCode')
  final String scalaCode;

  GetPlanResponse({
    this.pythonScript,
    this.scalaCode,
  });
  factory GetPlanResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPlanResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetResourcePolicyResponse {
  /// The date and time at which the policy was created.
  @_s.JsonKey(
      name: 'CreateTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime createTime;

  /// Contains the hash value associated with this policy.
  @_s.JsonKey(name: 'PolicyHash')
  final String policyHash;

  /// Contains the requested policy document, in JSON format.
  @_s.JsonKey(name: 'PolicyInJson')
  final String policyInJson;

  /// The date and time at which the policy was last updated.
  @_s.JsonKey(
      name: 'UpdateTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime updateTime;

  GetResourcePolicyResponse({
    this.createTime,
    this.policyHash,
    this.policyInJson,
    this.updateTime,
  });
  factory GetResourcePolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$GetResourcePolicyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GetSecurityConfigurationRequest {
  /// The name of the security configuration to retrieve.
  @_s.JsonKey(name: 'Name')
  final String name;

  GetSecurityConfigurationRequest({
    @_s.required this.name,
  });
  Map<String, dynamic> toJson() =>
      _$GetSecurityConfigurationRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSecurityConfigurationResponse {
  /// The requested security configuration.
  @_s.JsonKey(name: 'SecurityConfiguration')
  final SecurityConfiguration securityConfiguration;

  GetSecurityConfigurationResponse({
    this.securityConfiguration,
  });
  factory GetSecurityConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetSecurityConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GetSecurityConfigurationsRequest {
  /// The maximum number of results to return.
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  /// A continuation token, if this is a continuation call.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetSecurityConfigurationsRequest({
    this.maxResults,
    this.nextToken,
  });
  Map<String, dynamic> toJson() =>
      _$GetSecurityConfigurationsRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSecurityConfigurationsResponse {
  /// A continuation token, if there are more security configurations to return.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of security configurations.
  @_s.JsonKey(name: 'SecurityConfigurations')
  final List<SecurityConfiguration> securityConfigurations;

  GetSecurityConfigurationsResponse({
    this.nextToken,
    this.securityConfigurations,
  });
  factory GetSecurityConfigurationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetSecurityConfigurationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GetTableRequest {
  /// The name of the database in the catalog in which the table resides. For Hive
  /// compatibility, this name is entirely lowercase.
  @_s.JsonKey(name: 'DatabaseName')
  final String databaseName;

  /// The name of the table for which to retrieve the definition. For Hive
  /// compatibility, this name is entirely lowercase.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The ID of the Data Catalog where the table resides. If none is provided, the
  /// AWS account ID is used by default.
  @_s.JsonKey(name: 'CatalogId')
  final String catalogId;

  GetTableRequest({
    @_s.required this.databaseName,
    @_s.required this.name,
    this.catalogId,
  });
  Map<String, dynamic> toJson() => _$GetTableRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetTableResponse {
  /// The <code>Table</code> object that defines the specified table.
  @_s.JsonKey(name: 'Table')
  final Table table;

  GetTableResponse({
    this.table,
  });
  factory GetTableResponse.fromJson(Map<String, dynamic> json) =>
      _$GetTableResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GetTableVersionRequest {
  /// The database in the catalog in which the table resides. For Hive
  /// compatibility, this name is entirely lowercase.
  @_s.JsonKey(name: 'DatabaseName')
  final String databaseName;

  /// The name of the table. For Hive compatibility, this name is entirely
  /// lowercase.
  @_s.JsonKey(name: 'TableName')
  final String tableName;

  /// The ID of the Data Catalog where the tables reside. If none is provided, the
  /// AWS account ID is used by default.
  @_s.JsonKey(name: 'CatalogId')
  final String catalogId;

  /// The ID value of the table version to be retrieved. A <code>VersionID</code>
  /// is a string representation of an integer. Each version is incremented by 1.
  @_s.JsonKey(name: 'VersionId')
  final String versionId;

  GetTableVersionRequest({
    @_s.required this.databaseName,
    @_s.required this.tableName,
    this.catalogId,
    this.versionId,
  });
  Map<String, dynamic> toJson() => _$GetTableVersionRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetTableVersionResponse {
  /// The requested table version.
  @_s.JsonKey(name: 'TableVersion')
  final TableVersion tableVersion;

  GetTableVersionResponse({
    this.tableVersion,
  });
  factory GetTableVersionResponse.fromJson(Map<String, dynamic> json) =>
      _$GetTableVersionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GetTableVersionsRequest {
  /// The database in the catalog in which the table resides. For Hive
  /// compatibility, this name is entirely lowercase.
  @_s.JsonKey(name: 'DatabaseName')
  final String databaseName;

  /// The name of the table. For Hive compatibility, this name is entirely
  /// lowercase.
  @_s.JsonKey(name: 'TableName')
  final String tableName;

  /// The ID of the Data Catalog where the tables reside. If none is provided, the
  /// AWS account ID is used by default.
  @_s.JsonKey(name: 'CatalogId')
  final String catalogId;

  /// The maximum number of table versions to return in one response.
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  /// A continuation token, if this is not the first call.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetTableVersionsRequest({
    @_s.required this.databaseName,
    @_s.required this.tableName,
    this.catalogId,
    this.maxResults,
    this.nextToken,
  });
  Map<String, dynamic> toJson() => _$GetTableVersionsRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetTableVersionsResponse {
  /// A continuation token, if the list of available versions does not include the
  /// last one.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of strings identifying available versions of the specified table.
  @_s.JsonKey(name: 'TableVersions')
  final List<TableVersion> tableVersions;

  GetTableVersionsResponse({
    this.nextToken,
    this.tableVersions,
  });
  factory GetTableVersionsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetTableVersionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GetTablesRequest {
  /// The database in the catalog whose tables to list. For Hive compatibility,
  /// this name is entirely lowercase.
  @_s.JsonKey(name: 'DatabaseName')
  final String databaseName;

  /// The ID of the Data Catalog where the tables reside. If none is provided, the
  /// AWS account ID is used by default.
  @_s.JsonKey(name: 'CatalogId')
  final String catalogId;

  /// A regular expression pattern. If present, only those tables whose names
  /// match the pattern are returned.
  @_s.JsonKey(name: 'Expression')
  final String expression;

  /// The maximum number of tables to return in a single response.
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  /// A continuation token, included if this is a continuation call.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetTablesRequest({
    @_s.required this.databaseName,
    this.catalogId,
    this.expression,
    this.maxResults,
    this.nextToken,
  });
  Map<String, dynamic> toJson() => _$GetTablesRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetTablesResponse {
  /// A continuation token, present if the current list segment is not the last.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of the requested <code>Table</code> objects.
  @_s.JsonKey(name: 'TableList')
  final List<Table> tableList;

  GetTablesResponse({
    this.nextToken,
    this.tableList,
  });
  factory GetTablesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetTablesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GetTagsRequest {
  /// The Amazon Resource Name (ARN) of the resource for which to retrieve tags.
  @_s.JsonKey(name: 'ResourceArn')
  final String resourceArn;

  GetTagsRequest({
    @_s.required this.resourceArn,
  });
  Map<String, dynamic> toJson() => _$GetTagsRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetTagsResponse {
  /// The requested tags.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  GetTagsResponse({
    this.tags,
  });
  factory GetTagsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetTagsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GetTriggerRequest {
  /// The name of the trigger to retrieve.
  @_s.JsonKey(name: 'Name')
  final String name;

  GetTriggerRequest({
    @_s.required this.name,
  });
  Map<String, dynamic> toJson() => _$GetTriggerRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetTriggerResponse {
  /// The requested trigger definition.
  @_s.JsonKey(name: 'Trigger')
  final Trigger trigger;

  GetTriggerResponse({
    this.trigger,
  });
  factory GetTriggerResponse.fromJson(Map<String, dynamic> json) =>
      _$GetTriggerResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GetTriggersRequest {
  /// The name of the job to retrieve triggers for. The trigger that can start
  /// this job is returned, and if there is no such trigger, all triggers are
  /// returned.
  @_s.JsonKey(name: 'DependentJobName')
  final String dependentJobName;

  /// The maximum size of the response.
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  /// A continuation token, if this is a continuation call.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetTriggersRequest({
    this.dependentJobName,
    this.maxResults,
    this.nextToken,
  });
  Map<String, dynamic> toJson() => _$GetTriggersRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetTriggersResponse {
  /// A continuation token, if not all the requested triggers have yet been
  /// returned.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of triggers for the specified job.
  @_s.JsonKey(name: 'Triggers')
  final List<Trigger> triggers;

  GetTriggersResponse({
    this.nextToken,
    this.triggers,
  });
  factory GetTriggersResponse.fromJson(Map<String, dynamic> json) =>
      _$GetTriggersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GetUserDefinedFunctionRequest {
  /// The name of the catalog database where the function is located.
  @_s.JsonKey(name: 'DatabaseName')
  final String databaseName;

  /// The name of the function.
  @_s.JsonKey(name: 'FunctionName')
  final String functionName;

  /// The ID of the Data Catalog where the function to be retrieved is located. If
  /// none is provided, the AWS account ID is used by default.
  @_s.JsonKey(name: 'CatalogId')
  final String catalogId;

  GetUserDefinedFunctionRequest({
    @_s.required this.databaseName,
    @_s.required this.functionName,
    this.catalogId,
  });
  Map<String, dynamic> toJson() => _$GetUserDefinedFunctionRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetUserDefinedFunctionResponse {
  /// The requested function definition.
  @_s.JsonKey(name: 'UserDefinedFunction')
  final UserDefinedFunction userDefinedFunction;

  GetUserDefinedFunctionResponse({
    this.userDefinedFunction,
  });
  factory GetUserDefinedFunctionResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUserDefinedFunctionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GetUserDefinedFunctionsRequest {
  /// An optional function-name pattern string that filters the function
  /// definitions returned.
  @_s.JsonKey(name: 'Pattern')
  final String pattern;

  /// The ID of the Data Catalog where the functions to be retrieved are located.
  /// If none is provided, the AWS account ID is used by default.
  @_s.JsonKey(name: 'CatalogId')
  final String catalogId;

  /// The name of the catalog database where the functions are located.
  @_s.JsonKey(name: 'DatabaseName')
  final String databaseName;

  /// The maximum number of functions to return in one response.
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  /// A continuation token, if this is a continuation call.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetUserDefinedFunctionsRequest({
    @_s.required this.pattern,
    this.catalogId,
    this.databaseName,
    this.maxResults,
    this.nextToken,
  });
  Map<String, dynamic> toJson() => _$GetUserDefinedFunctionsRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetUserDefinedFunctionsResponse {
  /// A continuation token, if the list of functions returned does not include the
  /// last requested function.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of requested function definitions.
  @_s.JsonKey(name: 'UserDefinedFunctions')
  final List<UserDefinedFunction> userDefinedFunctions;

  GetUserDefinedFunctionsResponse({
    this.nextToken,
    this.userDefinedFunctions,
  });
  factory GetUserDefinedFunctionsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUserDefinedFunctionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GetWorkflowRequest {
  /// The name of the workflow to retrieve.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Specifies whether to include a graph when returning the workflow resource
  /// metadata.
  @_s.JsonKey(name: 'IncludeGraph')
  final bool includeGraph;

  GetWorkflowRequest({
    @_s.required this.name,
    this.includeGraph,
  });
  Map<String, dynamic> toJson() => _$GetWorkflowRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetWorkflowResponse {
  /// The resource metadata for the workflow.
  @_s.JsonKey(name: 'Workflow')
  final Workflow workflow;

  GetWorkflowResponse({
    this.workflow,
  });
  factory GetWorkflowResponse.fromJson(Map<String, dynamic> json) =>
      _$GetWorkflowResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GetWorkflowRunPropertiesRequest {
  /// Name of the workflow which was run.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The ID of the workflow run whose run properties should be returned.
  @_s.JsonKey(name: 'RunId')
  final String runId;

  GetWorkflowRunPropertiesRequest({
    @_s.required this.name,
    @_s.required this.runId,
  });
  Map<String, dynamic> toJson() =>
      _$GetWorkflowRunPropertiesRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetWorkflowRunPropertiesResponse {
  /// The workflow run properties which were set during the specified run.
  @_s.JsonKey(name: 'RunProperties')
  final Map<String, String> runProperties;

  GetWorkflowRunPropertiesResponse({
    this.runProperties,
  });
  factory GetWorkflowRunPropertiesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetWorkflowRunPropertiesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GetWorkflowRunRequest {
  /// Name of the workflow being run.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The ID of the workflow run.
  @_s.JsonKey(name: 'RunId')
  final String runId;

  /// Specifies whether to include the workflow graph in response or not.
  @_s.JsonKey(name: 'IncludeGraph')
  final bool includeGraph;

  GetWorkflowRunRequest({
    @_s.required this.name,
    @_s.required this.runId,
    this.includeGraph,
  });
  Map<String, dynamic> toJson() => _$GetWorkflowRunRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetWorkflowRunResponse {
  /// The requested workflow run metadata.
  @_s.JsonKey(name: 'Run')
  final WorkflowRun run;

  GetWorkflowRunResponse({
    this.run,
  });
  factory GetWorkflowRunResponse.fromJson(Map<String, dynamic> json) =>
      _$GetWorkflowRunResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GetWorkflowRunsRequest {
  /// Name of the workflow whose metadata of runs should be returned.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Specifies whether to include the workflow graph in response or not.
  @_s.JsonKey(name: 'IncludeGraph')
  final bool includeGraph;

  /// The maximum number of workflow runs to be included in the response.
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  /// The maximum size of the response.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetWorkflowRunsRequest({
    @_s.required this.name,
    this.includeGraph,
    this.maxResults,
    this.nextToken,
  });
  Map<String, dynamic> toJson() => _$GetWorkflowRunsRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetWorkflowRunsResponse {
  /// A continuation token, if not all requested workflow runs have been returned.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of workflow run metadata objects.
  @_s.JsonKey(name: 'Runs')
  final List<WorkflowRun> runs;

  GetWorkflowRunsResponse({
    this.nextToken,
    this.runs,
  });
  factory GetWorkflowRunsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetWorkflowRunsResponseFromJson(json);
}

/// The database and table in the AWS Glue Data Catalog that is used for input
/// or output data.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class GlueTable {
  /// A database name in the AWS Glue Data Catalog.
  @_s.JsonKey(name: 'DatabaseName')
  final String databaseName;

  /// A table name in the AWS Glue Data Catalog.
  @_s.JsonKey(name: 'TableName')
  final String tableName;

  /// A unique identifier for the AWS Glue Data Catalog.
  @_s.JsonKey(name: 'CatalogId')
  final String catalogId;

  /// The name of the connection to the AWS Glue Data Catalog.
  @_s.JsonKey(name: 'ConnectionName')
  final String connectionName;

  GlueTable({
    @_s.required this.databaseName,
    @_s.required this.tableName,
    this.catalogId,
    this.connectionName,
  });
  factory GlueTable.fromJson(Map<String, dynamic> json) =>
      _$GlueTableFromJson(json);

  Map<String, dynamic> toJson() => _$GlueTableToJson(this);
}

/// A classifier that uses <code>grok</code> patterns.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GrokClassifier {
  /// An identifier of the data format that the classifier matches, such as
  /// Twitter, JSON, Omniture logs, and so on.
  @_s.JsonKey(name: 'Classification')
  final String classification;

  /// The grok pattern applied to a data store by this classifier. For more
  /// information, see built-in patterns in <a
  /// href="http://docs.aws.amazon.com/glue/latest/dg/custom-classifier.html">Writing
  /// Custom Classifiers</a>.
  @_s.JsonKey(name: 'GrokPattern')
  final String grokPattern;

  /// The name of the classifier.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The time that this classifier was registered.
  @_s.JsonKey(
      name: 'CreationTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime creationTime;

  /// Optional custom grok patterns defined by this classifier. For more
  /// information, see custom patterns in <a
  /// href="http://docs.aws.amazon.com/glue/latest/dg/custom-classifier.html">Writing
  /// Custom Classifiers</a>.
  @_s.JsonKey(name: 'CustomPatterns')
  final String customPatterns;

  /// The time that this classifier was last updated.
  @_s.JsonKey(
      name: 'LastUpdated',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastUpdated;

  /// The version of this classifier.
  @_s.JsonKey(name: 'Version')
  final int version;

  GrokClassifier({
    @_s.required this.classification,
    @_s.required this.grokPattern,
    @_s.required this.name,
    this.creationTime,
    this.customPatterns,
    this.lastUpdated,
    this.version,
  });
  factory GrokClassifier.fromJson(Map<String, dynamic> json) =>
      _$GrokClassifierFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ImportCatalogToGlueRequest {
  /// The ID of the catalog to import. Currently, this should be the AWS account
  /// ID.
  @_s.JsonKey(name: 'CatalogId')
  final String catalogId;

  ImportCatalogToGlueRequest({
    this.catalogId,
  });
  Map<String, dynamic> toJson() => _$ImportCatalogToGlueRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ImportCatalogToGlueResponse {
  ImportCatalogToGlueResponse();
  factory ImportCatalogToGlueResponse.fromJson(Map<String, dynamic> json) =>
      _$ImportCatalogToGlueResponseFromJson(json);
}

/// Specifies configuration properties for an importing labels task run.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ImportLabelsTaskRunProperties {
  /// The Amazon Simple Storage Service (Amazon S3) path from where you will
  /// import the labels.
  @_s.JsonKey(name: 'InputS3Path')
  final String inputS3Path;

  /// Indicates whether to overwrite your existing labels.
  @_s.JsonKey(name: 'Replace')
  final bool replace;

  ImportLabelsTaskRunProperties({
    this.inputS3Path,
    this.replace,
  });
  factory ImportLabelsTaskRunProperties.fromJson(Map<String, dynamic> json) =>
      _$ImportLabelsTaskRunPropertiesFromJson(json);
}

/// Specifies a JDBC data store to crawl.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class JdbcTarget {
  /// The name of the connection to use to connect to the JDBC target.
  @_s.JsonKey(name: 'ConnectionName')
  final String connectionName;

  /// A list of glob patterns used to exclude from the crawl. For more
  /// information, see <a
  /// href="http://docs.aws.amazon.com/glue/latest/dg/add-crawler.html">Catalog
  /// Tables with a Crawler</a>.
  @_s.JsonKey(name: 'Exclusions')
  final List<String> exclusions;

  /// The path of the JDBC target.
  @_s.JsonKey(name: 'Path')
  final String path;

  JdbcTarget({
    this.connectionName,
    this.exclusions,
    this.path,
  });
  factory JdbcTarget.fromJson(Map<String, dynamic> json) =>
      _$JdbcTargetFromJson(json);

  Map<String, dynamic> toJson() => _$JdbcTargetToJson(this);
}

/// Specifies a job definition.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Job {
  /// This field is deprecated. Use <code>MaxCapacity</code> instead.
  ///
  /// The number of AWS Glue data processing units (DPUs) allocated to runs of
  /// this job. You can allocate from 2 to 100 DPUs; the default is 10. A DPU is a
  /// relative measure of processing power that consists of 4 vCPUs of compute
  /// capacity and 16 GB of memory. For more information, see the <a
  /// href="https://aws.amazon.com/glue/pricing/">AWS Glue pricing page</a>.
  /// <p/>
  @_s.JsonKey(name: 'AllocatedCapacity')
  final int allocatedCapacity;

  /// The <code>JobCommand</code> that executes this job.
  @_s.JsonKey(name: 'Command')
  final JobCommand command;

  /// The connections used for this job.
  @_s.JsonKey(name: 'Connections')
  final ConnectionsList connections;

  /// The time and date that this job definition was created.
  @_s.JsonKey(
      name: 'CreatedOn',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime createdOn;

  /// The default arguments for this job, specified as name-value pairs.
  ///
  /// You can specify arguments here that your own job-execution script consumes,
  /// as well as arguments that AWS Glue itself consumes.
  ///
  /// For information about how to specify and consume your own Job arguments, see
  /// the <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-python-calling.html">Calling
  /// AWS Glue APIs in Python</a> topic in the developer guide.
  ///
  /// For information about the key-value pairs that AWS Glue consumes to set up
  /// your job, see the <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-etl-glue-arguments.html">Special
  /// Parameters Used by AWS Glue</a> topic in the developer guide.
  @_s.JsonKey(name: 'DefaultArguments')
  final Map<String, String> defaultArguments;

  /// A description of the job.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// An <code>ExecutionProperty</code> specifying the maximum number of
  /// concurrent runs allowed for this job.
  @_s.JsonKey(name: 'ExecutionProperty')
  final ExecutionProperty executionProperty;

  /// Glue version determines the versions of Apache Spark and Python that AWS
  /// Glue supports. The Python version indicates the version supported for jobs
  /// of type Spark.
  ///
  /// For more information about the available AWS Glue versions and corresponding
  /// Spark and Python versions, see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/add-job.html">Glue
  /// version</a> in the developer guide.
  ///
  /// Jobs that are created without specifying a Glue version default to Glue 0.9.
  @_s.JsonKey(name: 'GlueVersion')
  final String glueVersion;

  /// The last point in time when this job definition was modified.
  @_s.JsonKey(
      name: 'LastModifiedOn',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastModifiedOn;

  /// This field is reserved for future use.
  @_s.JsonKey(name: 'LogUri')
  final String logUri;

  /// The number of AWS Glue data processing units (DPUs) that can be allocated
  /// when this job runs. A DPU is a relative measure of processing power that
  /// consists of 4 vCPUs of compute capacity and 16 GB of memory. For more
  /// information, see the <a href="https://aws.amazon.com/glue/pricing/">AWS Glue
  /// pricing page</a>.
  ///
  /// Do not set <code>Max Capacity</code> if using <code>WorkerType</code> and
  /// <code>NumberOfWorkers</code>.
  ///
  /// The value that can be allocated for <code>MaxCapacity</code> depends on
  /// whether you are running a Python shell job or an Apache Spark ETL job:
  ///
  /// <ul>
  /// <li>
  /// When you specify a Python shell job
  /// (<code>JobCommand.Name</code>="pythonshell"), you can allocate either 0.0625
  /// or 1 DPU. The default is 0.0625 DPU.
  /// </li>
  /// <li>
  /// When you specify an Apache Spark ETL job
  /// (<code>JobCommand.Name</code>="glueetl"), you can allocate from 2 to 100
  /// DPUs. The default is 10 DPUs. This job type cannot have a fractional DPU
  /// allocation.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'MaxCapacity')
  final double maxCapacity;

  /// The maximum number of times to retry this job after a JobRun fails.
  @_s.JsonKey(name: 'MaxRetries')
  final int maxRetries;

  /// The name you assign to this job definition.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Non-overridable arguments for this job, specified as name-value pairs.
  @_s.JsonKey(name: 'NonOverridableArguments')
  final Map<String, String> nonOverridableArguments;

  /// Specifies configuration properties of a job notification.
  @_s.JsonKey(name: 'NotificationProperty')
  final NotificationProperty notificationProperty;

  /// The number of workers of a defined <code>workerType</code> that are
  /// allocated when a job runs.
  ///
  /// The maximum number of workers you can define are 299 for <code>G.1X</code>,
  /// and 149 for <code>G.2X</code>.
  @_s.JsonKey(name: 'NumberOfWorkers')
  final int numberOfWorkers;

  /// The name or Amazon Resource Name (ARN) of the IAM role associated with this
  /// job.
  @_s.JsonKey(name: 'Role')
  final String role;

  /// The name of the <code>SecurityConfiguration</code> structure to be used with
  /// this job.
  @_s.JsonKey(name: 'SecurityConfiguration')
  final String securityConfiguration;

  /// The job timeout in minutes. This is the maximum time that a job run can
  /// consume resources before it is terminated and enters <code>TIMEOUT</code>
  /// status. The default is 2,880 minutes (48 hours).
  @_s.JsonKey(name: 'Timeout')
  final int timeout;

  /// The type of predefined worker that is allocated when a job runs. Accepts a
  /// value of Standard, G.1X, or G.2X.
  ///
  /// <ul>
  /// <li>
  /// For the <code>Standard</code> worker type, each worker provides 4 vCPU, 16
  /// GB of memory and a 50GB disk, and 2 executors per worker.
  /// </li>
  /// <li>
  /// For the <code>G.1X</code> worker type, each worker maps to 1 DPU (4 vCPU, 16
  /// GB of memory, 64 GB disk), and provides 1 executor per worker. We recommend
  /// this worker type for memory-intensive jobs.
  /// </li>
  /// <li>
  /// For the <code>G.2X</code> worker type, each worker maps to 2 DPU (8 vCPU, 32
  /// GB of memory, 128 GB disk), and provides 1 executor per worker. We recommend
  /// this worker type for memory-intensive jobs.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'WorkerType')
  final WorkerType workerType;

  Job({
    this.allocatedCapacity,
    this.command,
    this.connections,
    this.createdOn,
    this.defaultArguments,
    this.description,
    this.executionProperty,
    this.glueVersion,
    this.lastModifiedOn,
    this.logUri,
    this.maxCapacity,
    this.maxRetries,
    this.name,
    this.nonOverridableArguments,
    this.notificationProperty,
    this.numberOfWorkers,
    this.role,
    this.securityConfiguration,
    this.timeout,
    this.workerType,
  });
  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);
}

/// Defines a point that a job can resume processing.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class JobBookmarkEntry {
  /// The attempt ID number.
  @_s.JsonKey(name: 'Attempt')
  final int attempt;

  /// The bookmark itself.
  @_s.JsonKey(name: 'JobBookmark')
  final String jobBookmark;

  /// The name of the job in question.
  @_s.JsonKey(name: 'JobName')
  final String jobName;

  /// The unique run identifier associated with the previous job run.
  @_s.JsonKey(name: 'PreviousRunId')
  final String previousRunId;

  /// The run ID number.
  @_s.JsonKey(name: 'Run')
  final int run;

  /// The run ID number.
  @_s.JsonKey(name: 'RunId')
  final String runId;

  /// The version of the job.
  @_s.JsonKey(name: 'Version')
  final int version;

  JobBookmarkEntry({
    this.attempt,
    this.jobBookmark,
    this.jobName,
    this.previousRunId,
    this.run,
    this.runId,
    this.version,
  });
  factory JobBookmarkEntry.fromJson(Map<String, dynamic> json) =>
      _$JobBookmarkEntryFromJson(json);
}

/// Specifies how job bookmark data should be encrypted.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class JobBookmarksEncryption {
  /// The encryption mode to use for job bookmarks data.
  @_s.JsonKey(name: 'JobBookmarksEncryptionMode')
  final JobBookmarksEncryptionMode jobBookmarksEncryptionMode;

  /// The Amazon Resource Name (ARN) of the KMS key to be used to encrypt the
  /// data.
  @_s.JsonKey(name: 'KmsKeyArn')
  final String kmsKeyArn;

  JobBookmarksEncryption({
    this.jobBookmarksEncryptionMode,
    this.kmsKeyArn,
  });
  factory JobBookmarksEncryption.fromJson(Map<String, dynamic> json) =>
      _$JobBookmarksEncryptionFromJson(json);

  Map<String, dynamic> toJson() => _$JobBookmarksEncryptionToJson(this);
}

enum JobBookmarksEncryptionMode {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('CSE-KMS')
  cseKms,
}

/// Specifies code executed when a job is run.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class JobCommand {
  /// The name of the job command. For an Apache Spark ETL job, this must be
  /// <code>glueetl</code>. For a Python shell job, it must be
  /// <code>pythonshell</code>.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The Python version being used to execute a Python shell job. Allowed values
  /// are 2 or 3.
  @_s.JsonKey(name: 'PythonVersion')
  final String pythonVersion;

  /// Specifies the Amazon Simple Storage Service (Amazon S3) path to a script
  /// that executes a job.
  @_s.JsonKey(name: 'ScriptLocation')
  final String scriptLocation;

  JobCommand({
    this.name,
    this.pythonVersion,
    this.scriptLocation,
  });
  factory JobCommand.fromJson(Map<String, dynamic> json) =>
      _$JobCommandFromJson(json);

  Map<String, dynamic> toJson() => _$JobCommandToJson(this);
}

/// The details of a Job node present in the workflow.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class JobNodeDetails {
  /// The information for the job runs represented by the job node.
  @_s.JsonKey(name: 'JobRuns')
  final List<JobRun> jobRuns;

  JobNodeDetails({
    this.jobRuns,
  });
  factory JobNodeDetails.fromJson(Map<String, dynamic> json) =>
      _$JobNodeDetailsFromJson(json);
}

/// Contains information about a job run.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class JobRun {
  /// This field is deprecated. Use <code>MaxCapacity</code> instead.
  ///
  /// The number of AWS Glue data processing units (DPUs) allocated to this
  /// JobRun. From 2 to 100 DPUs can be allocated; the default is 10. A DPU is a
  /// relative measure of processing power that consists of 4 vCPUs of compute
  /// capacity and 16 GB of memory. For more information, see the <a
  /// href="https://aws.amazon.com/glue/pricing/">AWS Glue pricing page</a>.
  @_s.JsonKey(name: 'AllocatedCapacity')
  final int allocatedCapacity;

  /// The job arguments associated with this run. For this job run, they replace
  /// the default arguments set in the job definition itself.
  ///
  /// You can specify arguments here that your own job-execution script consumes,
  /// as well as arguments that AWS Glue itself consumes.
  ///
  /// For information about how to specify and consume your own job arguments, see
  /// the <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-python-calling.html">Calling
  /// AWS Glue APIs in Python</a> topic in the developer guide.
  ///
  /// For information about the key-value pairs that AWS Glue consumes to set up
  /// your job, see the <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-etl-glue-arguments.html">Special
  /// Parameters Used by AWS Glue</a> topic in the developer guide.
  @_s.JsonKey(name: 'Arguments')
  final Map<String, String> arguments;

  /// The number of the attempt to run this job.
  @_s.JsonKey(name: 'Attempt')
  final int attempt;

  /// The date and time that this job run completed.
  @_s.JsonKey(
      name: 'CompletedOn',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime completedOn;

  /// An error message associated with this job run.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  /// The amount of time (in seconds) that the job run consumed resources.
  @_s.JsonKey(name: 'ExecutionTime')
  final int executionTime;

  /// Glue version determines the versions of Apache Spark and Python that AWS
  /// Glue supports. The Python version indicates the version supported for jobs
  /// of type Spark.
  ///
  /// For more information about the available AWS Glue versions and corresponding
  /// Spark and Python versions, see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/add-job.html">Glue
  /// version</a> in the developer guide.
  ///
  /// Jobs that are created without specifying a Glue version default to Glue 0.9.
  @_s.JsonKey(name: 'GlueVersion')
  final String glueVersion;

  /// The ID of this job run.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the job definition being used in this run.
  @_s.JsonKey(name: 'JobName')
  final String jobName;

  /// The current state of the job run.
  @_s.JsonKey(name: 'JobRunState')
  final JobRunState jobRunState;

  /// The last time that this job run was modified.
  @_s.JsonKey(
      name: 'LastModifiedOn',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastModifiedOn;

  /// The name of the log group for secure logging that can be server-side
  /// encrypted in Amazon CloudWatch using AWS KMS. This name can be
  /// <code>/aws-glue/jobs/</code>, in which case the default encryption is
  /// <code>NONE</code>. If you add a role name and
  /// <code>SecurityConfiguration</code> name (in other words,
  /// <code>/aws-glue/jobs-yourRoleName-yourSecurityConfigurationName/</code>),
  /// then that security configuration is used to encrypt the log group.
  @_s.JsonKey(name: 'LogGroupName')
  final String logGroupName;

  /// The number of AWS Glue data processing units (DPUs) that can be allocated
  /// when this job runs. A DPU is a relative measure of processing power that
  /// consists of 4 vCPUs of compute capacity and 16 GB of memory. For more
  /// information, see the <a
  /// href="https://docs.aws.amazon.com/https:/aws.amazon.com/glue/pricing/">AWS
  /// Glue pricing page</a>.
  ///
  /// Do not set <code>Max Capacity</code> if using <code>WorkerType</code> and
  /// <code>NumberOfWorkers</code>.
  ///
  /// The value that can be allocated for <code>MaxCapacity</code> depends on
  /// whether you are running a Python shell job or an Apache Spark ETL job:
  ///
  /// <ul>
  /// <li>
  /// When you specify a Python shell job
  /// (<code>JobCommand.Name</code>="pythonshell"), you can allocate either 0.0625
  /// or 1 DPU. The default is 0.0625 DPU.
  /// </li>
  /// <li>
  /// When you specify an Apache Spark ETL job
  /// (<code>JobCommand.Name</code>="glueetl"), you can allocate from 2 to 100
  /// DPUs. The default is 10 DPUs. This job type cannot have a fractional DPU
  /// allocation.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'MaxCapacity')
  final double maxCapacity;

  /// Specifies configuration properties of a job run notification.
  @_s.JsonKey(name: 'NotificationProperty')
  final NotificationProperty notificationProperty;

  /// The number of workers of a defined <code>workerType</code> that are
  /// allocated when a job runs.
  ///
  /// The maximum number of workers you can define are 299 for <code>G.1X</code>,
  /// and 149 for <code>G.2X</code>.
  @_s.JsonKey(name: 'NumberOfWorkers')
  final int numberOfWorkers;

  /// A list of predecessors to this job run.
  @_s.JsonKey(name: 'PredecessorRuns')
  final List<Predecessor> predecessorRuns;

  /// The ID of the previous run of this job. For example, the
  /// <code>JobRunId</code> specified in the <code>StartJobRun</code> action.
  @_s.JsonKey(name: 'PreviousRunId')
  final String previousRunId;

  /// The name of the <code>SecurityConfiguration</code> structure to be used with
  /// this job run.
  @_s.JsonKey(name: 'SecurityConfiguration')
  final String securityConfiguration;

  /// The date and time at which this job run was started.
  @_s.JsonKey(
      name: 'StartedOn',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime startedOn;

  /// The <code>JobRun</code> timeout in minutes. This is the maximum time that a
  /// job run can consume resources before it is terminated and enters
  /// <code>TIMEOUT</code> status. The default is 2,880 minutes (48 hours). This
  /// overrides the timeout value set in the parent job.
  @_s.JsonKey(name: 'Timeout')
  final int timeout;

  /// The name of the trigger that started this job run.
  @_s.JsonKey(name: 'TriggerName')
  final String triggerName;

  /// The type of predefined worker that is allocated when a job runs. Accepts a
  /// value of Standard, G.1X, or G.2X.
  ///
  /// <ul>
  /// <li>
  /// For the <code>Standard</code> worker type, each worker provides 4 vCPU, 16
  /// GB of memory and a 50GB disk, and 2 executors per worker.
  /// </li>
  /// <li>
  /// For the <code>G.1X</code> worker type, each worker provides 4 vCPU, 16 GB of
  /// memory and a 64GB disk, and 1 executor per worker.
  /// </li>
  /// <li>
  /// For the <code>G.2X</code> worker type, each worker provides 8 vCPU, 32 GB of
  /// memory and a 128GB disk, and 1 executor per worker.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'WorkerType')
  final WorkerType workerType;

  JobRun({
    this.allocatedCapacity,
    this.arguments,
    this.attempt,
    this.completedOn,
    this.errorMessage,
    this.executionTime,
    this.glueVersion,
    this.id,
    this.jobName,
    this.jobRunState,
    this.lastModifiedOn,
    this.logGroupName,
    this.maxCapacity,
    this.notificationProperty,
    this.numberOfWorkers,
    this.predecessorRuns,
    this.previousRunId,
    this.securityConfiguration,
    this.startedOn,
    this.timeout,
    this.triggerName,
    this.workerType,
  });
  factory JobRun.fromJson(Map<String, dynamic> json) => _$JobRunFromJson(json);
}

enum JobRunState {
  @_s.JsonValue('STARTING')
  starting,
  @_s.JsonValue('RUNNING')
  running,
  @_s.JsonValue('STOPPING')
  stopping,
  @_s.JsonValue('STOPPED')
  stopped,
  @_s.JsonValue('SUCCEEDED')
  succeeded,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('TIMEOUT')
  timeout,
}

/// Specifies information used to update an existing job definition. The
/// previous job definition is completely overwritten by this information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class JobUpdate {
  /// This field is deprecated. Use <code>MaxCapacity</code> instead.
  ///
  /// The number of AWS Glue data processing units (DPUs) to allocate to this job.
  /// You can allocate from 2 to 100 DPUs; the default is 10. A DPU is a relative
  /// measure of processing power that consists of 4 vCPUs of compute capacity and
  /// 16 GB of memory. For more information, see the <a
  /// href="https://aws.amazon.com/glue/pricing/">AWS Glue pricing page</a>.
  @_s.JsonKey(name: 'AllocatedCapacity')
  final int allocatedCapacity;

  /// The <code>JobCommand</code> that executes this job (required).
  @_s.JsonKey(name: 'Command')
  final JobCommand command;

  /// The connections used for this job.
  @_s.JsonKey(name: 'Connections')
  final ConnectionsList connections;

  /// The default arguments for this job.
  ///
  /// You can specify arguments here that your own job-execution script consumes,
  /// as well as arguments that AWS Glue itself consumes.
  ///
  /// For information about how to specify and consume your own Job arguments, see
  /// the <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-python-calling.html">Calling
  /// AWS Glue APIs in Python</a> topic in the developer guide.
  ///
  /// For information about the key-value pairs that AWS Glue consumes to set up
  /// your job, see the <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-etl-glue-arguments.html">Special
  /// Parameters Used by AWS Glue</a> topic in the developer guide.
  @_s.JsonKey(name: 'DefaultArguments')
  final Map<String, String> defaultArguments;

  /// Description of the job being defined.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// An <code>ExecutionProperty</code> specifying the maximum number of
  /// concurrent runs allowed for this job.
  @_s.JsonKey(name: 'ExecutionProperty')
  final ExecutionProperty executionProperty;

  /// Glue version determines the versions of Apache Spark and Python that AWS
  /// Glue supports. The Python version indicates the version supported for jobs
  /// of type Spark.
  ///
  /// For more information about the available AWS Glue versions and corresponding
  /// Spark and Python versions, see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/add-job.html">Glue
  /// version</a> in the developer guide.
  @_s.JsonKey(name: 'GlueVersion')
  final String glueVersion;

  /// This field is reserved for future use.
  @_s.JsonKey(name: 'LogUri')
  final String logUri;

  /// The number of AWS Glue data processing units (DPUs) that can be allocated
  /// when this job runs. A DPU is a relative measure of processing power that
  /// consists of 4 vCPUs of compute capacity and 16 GB of memory. For more
  /// information, see the <a href="https://aws.amazon.com/glue/pricing/">AWS Glue
  /// pricing page</a>.
  ///
  /// Do not set <code>Max Capacity</code> if using <code>WorkerType</code> and
  /// <code>NumberOfWorkers</code>.
  ///
  /// The value that can be allocated for <code>MaxCapacity</code> depends on
  /// whether you are running a Python shell job or an Apache Spark ETL job:
  ///
  /// <ul>
  /// <li>
  /// When you specify a Python shell job
  /// (<code>JobCommand.Name</code>="pythonshell"), you can allocate either 0.0625
  /// or 1 DPU. The default is 0.0625 DPU.
  /// </li>
  /// <li>
  /// When you specify an Apache Spark ETL job
  /// (<code>JobCommand.Name</code>="glueetl"), you can allocate from 2 to 100
  /// DPUs. The default is 10 DPUs. This job type cannot have a fractional DPU
  /// allocation.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'MaxCapacity')
  final double maxCapacity;

  /// The maximum number of times to retry this job if it fails.
  @_s.JsonKey(name: 'MaxRetries')
  final int maxRetries;

  /// Non-overridable arguments for this job, specified as name-value pairs.
  @_s.JsonKey(name: 'NonOverridableArguments')
  final Map<String, String> nonOverridableArguments;

  /// Specifies the configuration properties of a job notification.
  @_s.JsonKey(name: 'NotificationProperty')
  final NotificationProperty notificationProperty;

  /// The number of workers of a defined <code>workerType</code> that are
  /// allocated when a job runs.
  ///
  /// The maximum number of workers you can define are 299 for <code>G.1X</code>,
  /// and 149 for <code>G.2X</code>.
  @_s.JsonKey(name: 'NumberOfWorkers')
  final int numberOfWorkers;

  /// The name or Amazon Resource Name (ARN) of the IAM role associated with this
  /// job (required).
  @_s.JsonKey(name: 'Role')
  final String role;

  /// The name of the <code>SecurityConfiguration</code> structure to be used with
  /// this job.
  @_s.JsonKey(name: 'SecurityConfiguration')
  final String securityConfiguration;

  /// The job timeout in minutes. This is the maximum time that a job run can
  /// consume resources before it is terminated and enters <code>TIMEOUT</code>
  /// status. The default is 2,880 minutes (48 hours).
  @_s.JsonKey(name: 'Timeout')
  final int timeout;

  /// The type of predefined worker that is allocated when a job runs. Accepts a
  /// value of Standard, G.1X, or G.2X.
  ///
  /// <ul>
  /// <li>
  /// For the <code>Standard</code> worker type, each worker provides 4 vCPU, 16
  /// GB of memory and a 50GB disk, and 2 executors per worker.
  /// </li>
  /// <li>
  /// For the <code>G.1X</code> worker type, each worker maps to 1 DPU (4 vCPU, 16
  /// GB of memory, 64 GB disk), and provides 1 executor per worker. We recommend
  /// this worker type for memory-intensive jobs.
  /// </li>
  /// <li>
  /// For the <code>G.2X</code> worker type, each worker maps to 2 DPU (8 vCPU, 32
  /// GB of memory, 128 GB disk), and provides 1 executor per worker. We recommend
  /// this worker type for memory-intensive jobs.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'WorkerType')
  final WorkerType workerType;

  JobUpdate({
    this.allocatedCapacity,
    this.command,
    this.connections,
    this.defaultArguments,
    this.description,
    this.executionProperty,
    this.glueVersion,
    this.logUri,
    this.maxCapacity,
    this.maxRetries,
    this.nonOverridableArguments,
    this.notificationProperty,
    this.numberOfWorkers,
    this.role,
    this.securityConfiguration,
    this.timeout,
    this.workerType,
  });
  Map<String, dynamic> toJson() => _$JobUpdateToJson(this);
}

/// A classifier for <code>JSON</code> content.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class JsonClassifier {
  /// A <code>JsonPath</code> string defining the JSON data for the classifier to
  /// classify. AWS Glue supports a subset of <code>JsonPath</code>, as described
  /// in <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/custom-classifier.html#custom-classifier-json">Writing
  /// JsonPath Custom Classifiers</a>.
  @_s.JsonKey(name: 'JsonPath')
  final String jsonPath;

  /// The name of the classifier.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The time that this classifier was registered.
  @_s.JsonKey(
      name: 'CreationTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime creationTime;

  /// The time that this classifier was last updated.
  @_s.JsonKey(
      name: 'LastUpdated',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastUpdated;

  /// The version of this classifier.
  @_s.JsonKey(name: 'Version')
  final int version;

  JsonClassifier({
    @_s.required this.jsonPath,
    @_s.required this.name,
    this.creationTime,
    this.lastUpdated,
    this.version,
  });
  factory JsonClassifier.fromJson(Map<String, dynamic> json) =>
      _$JsonClassifierFromJson(json);
}

/// Specifies configuration properties for a labeling set generation task run.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LabelingSetGenerationTaskRunProperties {
  /// The Amazon Simple Storage Service (Amazon S3) path where you will generate
  /// the labeling set.
  @_s.JsonKey(name: 'OutputS3Path')
  final String outputS3Path;

  LabelingSetGenerationTaskRunProperties({
    this.outputS3Path,
  });
  factory LabelingSetGenerationTaskRunProperties.fromJson(
          Map<String, dynamic> json) =>
      _$LabelingSetGenerationTaskRunPropertiesFromJson(json);
}

enum Language {
  @_s.JsonValue('PYTHON')
  python,
  @_s.JsonValue('SCALA')
  scala,
}

/// Status and error information about the most recent crawl.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LastCrawlInfo {
  /// If an error occurred, the error information about the last crawl.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  /// The log group for the last crawl.
  @_s.JsonKey(name: 'LogGroup')
  final String logGroup;

  /// The log stream for the last crawl.
  @_s.JsonKey(name: 'LogStream')
  final String logStream;

  /// The prefix for a message about this crawl.
  @_s.JsonKey(name: 'MessagePrefix')
  final String messagePrefix;

  /// The time at which the crawl started.
  @_s.JsonKey(
      name: 'StartTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime startTime;

  /// Status of the last crawl.
  @_s.JsonKey(name: 'Status')
  final LastCrawlStatus status;

  LastCrawlInfo({
    this.errorMessage,
    this.logGroup,
    this.logStream,
    this.messagePrefix,
    this.startTime,
    this.status,
  });
  factory LastCrawlInfo.fromJson(Map<String, dynamic> json) =>
      _$LastCrawlInfoFromJson(json);
}

enum LastCrawlStatus {
  @_s.JsonValue('SUCCEEDED')
  succeeded,
  @_s.JsonValue('CANCELLED')
  cancelled,
  @_s.JsonValue('FAILED')
  failed,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ListCrawlersRequest {
  /// The maximum size of a list to return.
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  /// A continuation token, if this is a continuation request.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Specifies to return only these tagged resources.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  ListCrawlersRequest({
    this.maxResults,
    this.nextToken,
    this.tags,
  });
  Map<String, dynamic> toJson() => _$ListCrawlersRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListCrawlersResponse {
  /// The names of all crawlers in the account, or the crawlers with the specified
  /// tags.
  @_s.JsonKey(name: 'CrawlerNames')
  final List<String> crawlerNames;

  /// A continuation token, if the returned list does not contain the last metric
  /// available.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListCrawlersResponse({
    this.crawlerNames,
    this.nextToken,
  });
  factory ListCrawlersResponse.fromJson(Map<String, dynamic> json) =>
      _$ListCrawlersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ListDevEndpointsRequest {
  /// The maximum size of a list to return.
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  /// A continuation token, if this is a continuation request.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Specifies to return only these tagged resources.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  ListDevEndpointsRequest({
    this.maxResults,
    this.nextToken,
    this.tags,
  });
  Map<String, dynamic> toJson() => _$ListDevEndpointsRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDevEndpointsResponse {
  /// The names of all the <code>DevEndpoint</code>s in the account, or the
  /// <code>DevEndpoint</code>s with the specified tags.
  @_s.JsonKey(name: 'DevEndpointNames')
  final List<String> devEndpointNames;

  /// A continuation token, if the returned list does not contain the last metric
  /// available.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListDevEndpointsResponse({
    this.devEndpointNames,
    this.nextToken,
  });
  factory ListDevEndpointsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListDevEndpointsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ListJobsRequest {
  /// The maximum size of a list to return.
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  /// A continuation token, if this is a continuation request.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Specifies to return only these tagged resources.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  ListJobsRequest({
    this.maxResults,
    this.nextToken,
    this.tags,
  });
  Map<String, dynamic> toJson() => _$ListJobsRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListJobsResponse {
  /// The names of all jobs in the account, or the jobs with the specified tags.
  @_s.JsonKey(name: 'JobNames')
  final List<String> jobNames;

  /// A continuation token, if the returned list does not contain the last metric
  /// available.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListJobsResponse({
    this.jobNames,
    this.nextToken,
  });
  factory ListJobsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListJobsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ListMLTransformsRequest {
  /// A <code>TransformFilterCriteria</code> used to filter the machine learning
  /// transforms.
  @_s.JsonKey(name: 'Filter')
  final TransformFilterCriteria filter;

  /// The maximum size of a list to return.
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  /// A continuation token, if this is a continuation request.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A <code>TransformSortCriteria</code> used to sort the machine learning
  /// transforms.
  @_s.JsonKey(name: 'Sort')
  final TransformSortCriteria sort;

  /// Specifies to return only these tagged resources.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  ListMLTransformsRequest({
    this.filter,
    this.maxResults,
    this.nextToken,
    this.sort,
    this.tags,
  });
  Map<String, dynamic> toJson() => _$ListMLTransformsRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListMLTransformsResponse {
  /// The identifiers of all the machine learning transforms in the account, or
  /// the machine learning transforms with the specified tags.
  @_s.JsonKey(name: 'TransformIds')
  final List<String> transformIds;

  /// A continuation token, if the returned list does not contain the last metric
  /// available.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListMLTransformsResponse({
    @_s.required this.transformIds,
    this.nextToken,
  });
  factory ListMLTransformsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListMLTransformsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ListTriggersRequest {
  /// The name of the job for which to retrieve triggers. The trigger that can
  /// start this job is returned. If there is no such trigger, all triggers are
  /// returned.
  @_s.JsonKey(name: 'DependentJobName')
  final String dependentJobName;

  /// The maximum size of a list to return.
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  /// A continuation token, if this is a continuation request.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Specifies to return only these tagged resources.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  ListTriggersRequest({
    this.dependentJobName,
    this.maxResults,
    this.nextToken,
    this.tags,
  });
  Map<String, dynamic> toJson() => _$ListTriggersRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTriggersResponse {
  /// A continuation token, if the returned list does not contain the last metric
  /// available.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The names of all triggers in the account, or the triggers with the specified
  /// tags.
  @_s.JsonKey(name: 'TriggerNames')
  final List<String> triggerNames;

  ListTriggersResponse({
    this.nextToken,
    this.triggerNames,
  });
  factory ListTriggersResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTriggersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ListWorkflowsRequest {
  /// The maximum size of a list to return.
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  /// A continuation token, if this is a continuation request.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListWorkflowsRequest({
    this.maxResults,
    this.nextToken,
  });
  Map<String, dynamic> toJson() => _$ListWorkflowsRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListWorkflowsResponse {
  /// A continuation token, if not all workflow names have been returned.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// List of names of workflows in the account.
  @_s.JsonKey(name: 'Workflows')
  final List<String> workflows;

  ListWorkflowsResponse({
    this.nextToken,
    this.workflows,
  });
  factory ListWorkflowsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListWorkflowsResponseFromJson(json);
}

/// The location of resources.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Location {
  /// An Amazon DynamoDB table location.
  @_s.JsonKey(name: 'DynamoDB')
  final List<CodeGenNodeArg> dynamoDB;

  /// A JDBC location.
  @_s.JsonKey(name: 'Jdbc')
  final List<CodeGenNodeArg> jdbc;

  /// An Amazon Simple Storage Service (Amazon S3) location.
  @_s.JsonKey(name: 'S3')
  final List<CodeGenNodeArg> s3;

  Location({
    this.dynamoDB,
    this.jdbc,
    this.s3,
  });
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

enum Logical {
  @_s.JsonValue('AND')
  and,
  @_s.JsonValue('ANY')
  any,
}

enum LogicalOperator {
  @_s.JsonValue('EQUALS')
  equals,
}

/// A structure for a machine learning transform.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MLTransform {
  /// A timestamp. The time and date that this machine learning transform was
  /// created.
  @_s.JsonKey(
      name: 'CreatedOn',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime createdOn;

  /// A user-defined, long-form description text for the machine learning
  /// transform. Descriptions are not guaranteed to be unique and can be changed
  /// at any time.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// An <code>EvaluationMetrics</code> object. Evaluation metrics provide an
  /// estimate of the quality of your machine learning transform.
  @_s.JsonKey(name: 'EvaluationMetrics')
  final EvaluationMetrics evaluationMetrics;

  /// This value determines which version of AWS Glue this machine learning
  /// transform is compatible with. Glue 1.0 is recommended for most customers. If
  /// the value is not set, the Glue compatibility defaults to Glue 0.9. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/release-notes.html#release-notes-versions">AWS
  /// Glue Versions</a> in the developer guide.
  @_s.JsonKey(name: 'GlueVersion')
  final String glueVersion;

  /// A list of AWS Glue table definitions used by the transform.
  @_s.JsonKey(name: 'InputRecordTables')
  final List<GlueTable> inputRecordTables;

  /// A count identifier for the labeling files generated by AWS Glue for this
  /// transform. As you create a better transform, you can iteratively download,
  /// label, and upload the labeling file.
  @_s.JsonKey(name: 'LabelCount')
  final int labelCount;

  /// A timestamp. The last point in time when this machine learning transform was
  /// modified.
  @_s.JsonKey(
      name: 'LastModifiedOn',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastModifiedOn;

  /// The number of AWS Glue data processing units (DPUs) that are allocated to
  /// task runs for this transform. You can allocate from 2 to 100 DPUs; the
  /// default is 10. A DPU is a relative measure of processing power that consists
  /// of 4 vCPUs of compute capacity and 16 GB of memory. For more information,
  /// see the <a href="http://aws.amazon.com/glue/pricing/">AWS Glue pricing
  /// page</a>.
  ///
  /// <code>MaxCapacity</code> is a mutually exclusive option with
  /// <code>NumberOfWorkers</code> and <code>WorkerType</code>.
  ///
  /// <ul>
  /// <li>
  /// If either <code>NumberOfWorkers</code> or <code>WorkerType</code> is set,
  /// then <code>MaxCapacity</code> cannot be set.
  /// </li>
  /// <li>
  /// If <code>MaxCapacity</code> is set then neither <code>NumberOfWorkers</code>
  /// or <code>WorkerType</code> can be set.
  /// </li>
  /// <li>
  /// If <code>WorkerType</code> is set, then <code>NumberOfWorkers</code> is
  /// required (and vice versa).
  /// </li>
  /// <li>
  /// <code>MaxCapacity</code> and <code>NumberOfWorkers</code> must both be at
  /// least 1.
  /// </li>
  /// </ul>
  /// When the <code>WorkerType</code> field is set to a value other than
  /// <code>Standard</code>, the <code>MaxCapacity</code> field is set
  /// automatically and becomes read-only.
  @_s.JsonKey(name: 'MaxCapacity')
  final double maxCapacity;

  /// The maximum number of times to retry after an <code>MLTaskRun</code> of the
  /// machine learning transform fails.
  @_s.JsonKey(name: 'MaxRetries')
  final int maxRetries;

  /// A user-defined name for the machine learning transform. Names are not
  /// guaranteed unique and can be changed at any time.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The number of workers of a defined <code>workerType</code> that are
  /// allocated when a task of the transform runs.
  ///
  /// If <code>WorkerType</code> is set, then <code>NumberOfWorkers</code> is
  /// required (and vice versa).
  @_s.JsonKey(name: 'NumberOfWorkers')
  final int numberOfWorkers;

  /// A <code>TransformParameters</code> object. You can use parameters to tune
  /// (customize) the behavior of the machine learning transform by specifying
  /// what data it learns from and your preference on various tradeoffs (such as
  /// precious vs. recall, or accuracy vs. cost).
  @_s.JsonKey(name: 'Parameters')
  final TransformParameters parameters;

  /// The name or Amazon Resource Name (ARN) of the IAM role with the required
  /// permissions. The required permissions include both AWS Glue service role
  /// permissions to AWS Glue resources, and Amazon S3 permissions required by the
  /// transform.
  ///
  /// <ul>
  /// <li>
  /// This role needs AWS Glue service role permissions to allow access to
  /// resources in AWS Glue. See <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/attach-policy-iam-user.html">Attach
  /// a Policy to IAM Users That Access AWS Glue</a>.
  /// </li>
  /// <li>
  /// This role needs permission to your Amazon Simple Storage Service (Amazon S3)
  /// sources, targets, temporary directory, scripts, and any libraries used by
  /// the task run for this transform.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Role')
  final String role;

  /// A map of key-value pairs representing the columns and data types that this
  /// transform can run against. Has an upper bound of 100 columns.
  @_s.JsonKey(name: 'Schema')
  final List<SchemaColumn> schema;

  /// The current status of the machine learning transform.
  @_s.JsonKey(name: 'Status')
  final TransformStatusType status;

  /// The timeout in minutes of the machine learning transform.
  @_s.JsonKey(name: 'Timeout')
  final int timeout;

  /// The unique transform ID that is generated for the machine learning
  /// transform. The ID is guaranteed to be unique and does not change.
  @_s.JsonKey(name: 'TransformId')
  final String transformId;

  /// The type of predefined worker that is allocated when a task of this
  /// transform runs. Accepts a value of Standard, G.1X, or G.2X.
  ///
  /// <ul>
  /// <li>
  /// For the <code>Standard</code> worker type, each worker provides 4 vCPU, 16
  /// GB of memory and a 50GB disk, and 2 executors per worker.
  /// </li>
  /// <li>
  /// For the <code>G.1X</code> worker type, each worker provides 4 vCPU, 16 GB of
  /// memory and a 64GB disk, and 1 executor per worker.
  /// </li>
  /// <li>
  /// For the <code>G.2X</code> worker type, each worker provides 8 vCPU, 32 GB of
  /// memory and a 128GB disk, and 1 executor per worker.
  /// </li>
  /// </ul>
  /// <code>MaxCapacity</code> is a mutually exclusive option with
  /// <code>NumberOfWorkers</code> and <code>WorkerType</code>.
  ///
  /// <ul>
  /// <li>
  /// If either <code>NumberOfWorkers</code> or <code>WorkerType</code> is set,
  /// then <code>MaxCapacity</code> cannot be set.
  /// </li>
  /// <li>
  /// If <code>MaxCapacity</code> is set then neither <code>NumberOfWorkers</code>
  /// or <code>WorkerType</code> can be set.
  /// </li>
  /// <li>
  /// If <code>WorkerType</code> is set, then <code>NumberOfWorkers</code> is
  /// required (and vice versa).
  /// </li>
  /// <li>
  /// <code>MaxCapacity</code> and <code>NumberOfWorkers</code> must both be at
  /// least 1.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'WorkerType')
  final WorkerType workerType;

  MLTransform({
    this.createdOn,
    this.description,
    this.evaluationMetrics,
    this.glueVersion,
    this.inputRecordTables,
    this.labelCount,
    this.lastModifiedOn,
    this.maxCapacity,
    this.maxRetries,
    this.name,
    this.numberOfWorkers,
    this.parameters,
    this.role,
    this.schema,
    this.status,
    this.timeout,
    this.transformId,
    this.workerType,
  });
  factory MLTransform.fromJson(Map<String, dynamic> json) =>
      _$MLTransformFromJson(json);
}

/// Defines a mapping.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MappingEntry {
  /// The source path.
  @_s.JsonKey(name: 'SourcePath')
  final String sourcePath;

  /// The name of the source table.
  @_s.JsonKey(name: 'SourceTable')
  final String sourceTable;

  /// The source type.
  @_s.JsonKey(name: 'SourceType')
  final String sourceType;

  /// The target path.
  @_s.JsonKey(name: 'TargetPath')
  final String targetPath;

  /// The target table.
  @_s.JsonKey(name: 'TargetTable')
  final String targetTable;

  /// The target type.
  @_s.JsonKey(name: 'TargetType')
  final String targetType;

  MappingEntry({
    this.sourcePath,
    this.sourceTable,
    this.sourceType,
    this.targetPath,
    this.targetTable,
    this.targetType,
  });
  factory MappingEntry.fromJson(Map<String, dynamic> json) =>
      _$MappingEntryFromJson(json);

  Map<String, dynamic> toJson() => _$MappingEntryToJson(this);
}

/// A node represents an AWS Glue component like Trigger, Job etc. which is part
/// of a workflow.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Node {
  /// Details of the crawler when the node represents a crawler.
  @_s.JsonKey(name: 'CrawlerDetails')
  final CrawlerNodeDetails crawlerDetails;

  /// Details of the Job when the node represents a Job.
  @_s.JsonKey(name: 'JobDetails')
  final JobNodeDetails jobDetails;

  /// The name of the AWS Glue component represented by the node.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Details of the Trigger when the node represents a Trigger.
  @_s.JsonKey(name: 'TriggerDetails')
  final TriggerNodeDetails triggerDetails;

  /// The type of AWS Glue component represented by the node.
  @_s.JsonKey(name: 'Type')
  final NodeType type;

  /// The unique Id assigned to the node within the workflow.
  @_s.JsonKey(name: 'UniqueId')
  final String uniqueId;

  Node({
    this.crawlerDetails,
    this.jobDetails,
    this.name,
    this.triggerDetails,
    this.type,
    this.uniqueId,
  });
  factory Node.fromJson(Map<String, dynamic> json) => _$NodeFromJson(json);
}

enum NodeType {
  @_s.JsonValue('CRAWLER')
  crawler,
  @_s.JsonValue('JOB')
  job,
  @_s.JsonValue('TRIGGER')
  trigger,
}

/// Specifies configuration properties of a notification.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class NotificationProperty {
  /// After a job run starts, the number of minutes to wait before sending a job
  /// run delay notification.
  @_s.JsonKey(name: 'NotifyDelayAfter')
  final int notifyDelayAfter;

  NotificationProperty({
    this.notifyDelayAfter,
  });
  factory NotificationProperty.fromJson(Map<String, dynamic> json) =>
      _$NotificationPropertyFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationPropertyToJson(this);
}

/// Specifies the sort order of a sorted column.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Order {
  /// The name of the column.
  @_s.JsonKey(name: 'Column')
  final String column;

  /// Indicates that the column is sorted in ascending order (<code>== 1</code>),
  /// or in descending order (<code>==0</code>).
  @_s.JsonKey(name: 'SortOrder')
  final int sortOrder;

  Order({
    @_s.required this.column,
    @_s.required this.sortOrder,
  });
  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}

/// Represents a slice of table data.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Partition {
  /// The time at which the partition was created.
  @_s.JsonKey(
      name: 'CreationTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime creationTime;

  /// The name of the catalog database in which to create the partition.
  @_s.JsonKey(name: 'DatabaseName')
  final String databaseName;

  /// The last time at which the partition was accessed.
  @_s.JsonKey(
      name: 'LastAccessTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastAccessTime;

  /// The last time at which column statistics were computed for this partition.
  @_s.JsonKey(
      name: 'LastAnalyzedTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastAnalyzedTime;

  /// These key-value pairs define partition parameters.
  @_s.JsonKey(name: 'Parameters')
  final Map<String, String> parameters;

  /// Provides information about the physical location where the partition is
  /// stored.
  @_s.JsonKey(name: 'StorageDescriptor')
  final StorageDescriptor storageDescriptor;

  /// The name of the database table in which to create the partition.
  @_s.JsonKey(name: 'TableName')
  final String tableName;

  /// The values of the partition.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  Partition({
    this.creationTime,
    this.databaseName,
    this.lastAccessTime,
    this.lastAnalyzedTime,
    this.parameters,
    this.storageDescriptor,
    this.tableName,
    this.values,
  });
  factory Partition.fromJson(Map<String, dynamic> json) =>
      _$PartitionFromJson(json);
}

/// Contains information about a partition error.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PartitionError {
  /// The details about the partition error.
  @_s.JsonKey(name: 'ErrorDetail')
  final ErrorDetail errorDetail;

  /// The values that define the partition.
  @_s.JsonKey(name: 'PartitionValues')
  final List<String> partitionValues;

  PartitionError({
    this.errorDetail,
    this.partitionValues,
  });
  factory PartitionError.fromJson(Map<String, dynamic> json) =>
      _$PartitionErrorFromJson(json);
}

/// The structure used to create and update a partition.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class PartitionInput {
  /// The last time at which the partition was accessed.
  @_s.JsonKey(
      name: 'LastAccessTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastAccessTime;

  /// The last time at which column statistics were computed for this partition.
  @_s.JsonKey(
      name: 'LastAnalyzedTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastAnalyzedTime;

  /// These key-value pairs define partition parameters.
  @_s.JsonKey(name: 'Parameters')
  final Map<String, String> parameters;

  /// Provides information about the physical location where the partition is
  /// stored.
  @_s.JsonKey(name: 'StorageDescriptor')
  final StorageDescriptor storageDescriptor;

  /// The values of the partition. Although this parameter is not required by the
  /// SDK, you must specify this parameter for a valid input.
  ///
  /// The values for the keys for the new partition must be passed as an array of
  /// String objects that must be ordered in the same order as the partition keys
  /// appearing in the Amazon S3 prefix. Otherwise AWS Glue will add the values to
  /// the wrong keys.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  PartitionInput({
    this.lastAccessTime,
    this.lastAnalyzedTime,
    this.parameters,
    this.storageDescriptor,
    this.values,
  });
  Map<String, dynamic> toJson() => _$PartitionInputToJson(this);
}

/// Contains a list of values defining partitions.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PartitionValueList {
  /// The list of values.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  PartitionValueList({
    @_s.required this.values,
  });
  factory PartitionValueList.fromJson(Map<String, dynamic> json) =>
      _$PartitionValueListFromJson(json);

  Map<String, dynamic> toJson() => _$PartitionValueListToJson(this);
}

enum Permission {
  @_s.JsonValue('ALL')
  all,
  @_s.JsonValue('SELECT')
  select,
  @_s.JsonValue('ALTER')
  alter,
  @_s.JsonValue('DROP')
  drop,
  @_s.JsonValue('DELETE')
  delete,
  @_s.JsonValue('INSERT')
  insert,
  @_s.JsonValue('CREATE_DATABASE')
  createDatabase,
  @_s.JsonValue('CREATE_TABLE')
  createTable,
  @_s.JsonValue('DATA_LOCATION_ACCESS')
  dataLocationAccess,
}

/// Specifies the physical requirements for a connection.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PhysicalConnectionRequirements {
  /// The connection's Availability Zone. This field is redundant because the
  /// specified subnet implies the Availability Zone to be used. Currently the
  /// field must be populated, but it will be deprecated in the future.
  @_s.JsonKey(name: 'AvailabilityZone')
  final String availabilityZone;

  /// The security group ID list used by the connection.
  @_s.JsonKey(name: 'SecurityGroupIdList')
  final List<String> securityGroupIdList;

  /// The subnet ID used by the connection.
  @_s.JsonKey(name: 'SubnetId')
  final String subnetId;

  PhysicalConnectionRequirements({
    this.availabilityZone,
    this.securityGroupIdList,
    this.subnetId,
  });
  factory PhysicalConnectionRequirements.fromJson(Map<String, dynamic> json) =>
      _$PhysicalConnectionRequirementsFromJson(json);

  Map<String, dynamic> toJson() => _$PhysicalConnectionRequirementsToJson(this);
}

/// A job run that was used in the predicate of a conditional trigger that
/// triggered this job run.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Predecessor {
  /// The name of the job definition used by the predecessor job run.
  @_s.JsonKey(name: 'JobName')
  final String jobName;

  /// The job-run ID of the predecessor job run.
  @_s.JsonKey(name: 'RunId')
  final String runId;

  Predecessor({
    this.jobName,
    this.runId,
  });
  factory Predecessor.fromJson(Map<String, dynamic> json) =>
      _$PredecessorFromJson(json);
}

/// Defines the predicate of the trigger, which determines when it fires.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Predicate {
  /// A list of the conditions that determine when the trigger will fire.
  @_s.JsonKey(name: 'Conditions')
  final List<Condition> conditions;

  /// An optional field if only one condition is listed. If multiple conditions
  /// are listed, then this field is required.
  @_s.JsonKey(name: 'Logical')
  final Logical logical;

  Predicate({
    this.conditions,
    this.logical,
  });
  factory Predicate.fromJson(Map<String, dynamic> json) =>
      _$PredicateFromJson(json);

  Map<String, dynamic> toJson() => _$PredicateToJson(this);
}

/// Permissions granted to a principal.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PrincipalPermissions {
  /// The permissions that are granted to the principal.
  @_s.JsonKey(name: 'Permissions')
  final List<String> permissions;

  /// The principal who is granted permissions.
  @_s.JsonKey(name: 'Principal')
  final DataLakePrincipal principal;

  PrincipalPermissions({
    this.permissions,
    this.principal,
  });
  factory PrincipalPermissions.fromJson(Map<String, dynamic> json) =>
      _$PrincipalPermissionsFromJson(json);

  Map<String, dynamic> toJson() => _$PrincipalPermissionsToJson(this);
}

enum PrincipalType {
  @_s.JsonValue('USER')
  user,
  @_s.JsonValue('ROLE')
  role,
  @_s.JsonValue('GROUP')
  group,
}

/// Defines a property predicate.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class PropertyPredicate {
  /// The comparator used to compare this property to others.
  @_s.JsonKey(name: 'Comparator')
  final Comparator comparator;

  /// The key of the property.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The value of the property.
  @_s.JsonKey(name: 'Value')
  final String value;

  PropertyPredicate({
    this.comparator,
    this.key,
    this.value,
  });
  Map<String, dynamic> toJson() => _$PropertyPredicateToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class PutDataCatalogEncryptionSettingsRequest {
  /// The security configuration to set.
  @_s.JsonKey(name: 'DataCatalogEncryptionSettings')
  final DataCatalogEncryptionSettings dataCatalogEncryptionSettings;

  /// The ID of the Data Catalog to set the security configuration for. If none is
  /// provided, the AWS account ID is used by default.
  @_s.JsonKey(name: 'CatalogId')
  final String catalogId;

  PutDataCatalogEncryptionSettingsRequest({
    @_s.required this.dataCatalogEncryptionSettings,
    this.catalogId,
  });
  Map<String, dynamic> toJson() =>
      _$PutDataCatalogEncryptionSettingsRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutDataCatalogEncryptionSettingsResponse {
  PutDataCatalogEncryptionSettingsResponse();
  factory PutDataCatalogEncryptionSettingsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PutDataCatalogEncryptionSettingsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class PutResourcePolicyRequest {
  /// Contains the policy document to set, in JSON format.
  @_s.JsonKey(name: 'PolicyInJson')
  final String policyInJson;

  /// A value of <code>MUST_EXIST</code> is used to update a policy. A value of
  /// <code>NOT_EXIST</code> is used to create a new policy. If a value of
  /// <code>NONE</code> or a null value is used, the call will not depend on the
  /// existence of a policy.
  @_s.JsonKey(name: 'PolicyExistsCondition')
  final ExistCondition policyExistsCondition;

  /// The hash value returned when the previous policy was set using
  /// <code>PutResourcePolicy</code>. Its purpose is to prevent concurrent
  /// modifications of a policy. Do not use this parameter if no previous policy
  /// has been set.
  @_s.JsonKey(name: 'PolicyHashCondition')
  final String policyHashCondition;

  PutResourcePolicyRequest({
    @_s.required this.policyInJson,
    this.policyExistsCondition,
    this.policyHashCondition,
  });
  Map<String, dynamic> toJson() => _$PutResourcePolicyRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutResourcePolicyResponse {
  /// A hash of the policy that has just been set. This must be included in a
  /// subsequent call that overwrites or updates this policy.
  @_s.JsonKey(name: 'PolicyHash')
  final String policyHash;

  PutResourcePolicyResponse({
    this.policyHash,
  });
  factory PutResourcePolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$PutResourcePolicyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class PutWorkflowRunPropertiesRequest {
  /// Name of the workflow which was run.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The ID of the workflow run for which the run properties should be updated.
  @_s.JsonKey(name: 'RunId')
  final String runId;

  /// The properties to put for the specified run.
  @_s.JsonKey(name: 'RunProperties')
  final Map<String, String> runProperties;

  PutWorkflowRunPropertiesRequest({
    @_s.required this.name,
    @_s.required this.runId,
    @_s.required this.runProperties,
  });
  Map<String, dynamic> toJson() =>
      _$PutWorkflowRunPropertiesRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutWorkflowRunPropertiesResponse {
  PutWorkflowRunPropertiesResponse();
  factory PutWorkflowRunPropertiesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PutWorkflowRunPropertiesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ResetJobBookmarkRequest {
  /// The name of the job in question.
  @_s.JsonKey(name: 'JobName')
  final String jobName;

  /// The unique run identifier associated with this job run.
  @_s.JsonKey(name: 'RunId')
  final String runId;

  ResetJobBookmarkRequest({
    @_s.required this.jobName,
    this.runId,
  });
  Map<String, dynamic> toJson() => _$ResetJobBookmarkRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResetJobBookmarkResponse {
  /// The reset bookmark entry.
  @_s.JsonKey(name: 'JobBookmarkEntry')
  final JobBookmarkEntry jobBookmarkEntry;

  ResetJobBookmarkResponse({
    this.jobBookmarkEntry,
  });
  factory ResetJobBookmarkResponse.fromJson(Map<String, dynamic> json) =>
      _$ResetJobBookmarkResponseFromJson(json);
}

enum ResourceType {
  @_s.JsonValue('JAR')
  jar,
  @_s.JsonValue('FILE')
  file,
  @_s.JsonValue('ARCHIVE')
  archive,
}

/// The URIs for function resources.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ResourceUri {
  /// The type of the resource.
  @_s.JsonKey(name: 'ResourceType')
  final ResourceType resourceType;

  /// The URI for accessing the resource.
  @_s.JsonKey(name: 'Uri')
  final String uri;

  ResourceUri({
    this.resourceType,
    this.uri,
  });
  factory ResourceUri.fromJson(Map<String, dynamic> json) =>
      _$ResourceUriFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceUriToJson(this);
}

/// Specifies how Amazon Simple Storage Service (Amazon S3) data should be
/// encrypted.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class S3Encryption {
  /// The Amazon Resource Name (ARN) of the KMS key to be used to encrypt the
  /// data.
  @_s.JsonKey(name: 'KmsKeyArn')
  final String kmsKeyArn;

  /// The encryption mode to use for Amazon S3 data.
  @_s.JsonKey(name: 'S3EncryptionMode')
  final S3EncryptionMode s3EncryptionMode;

  S3Encryption({
    this.kmsKeyArn,
    this.s3EncryptionMode,
  });
  factory S3Encryption.fromJson(Map<String, dynamic> json) =>
      _$S3EncryptionFromJson(json);

  Map<String, dynamic> toJson() => _$S3EncryptionToJson(this);
}

enum S3EncryptionMode {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('SSE-KMS')
  sseKms,
  @_s.JsonValue('SSE-S3')
  sseS3,
}

/// Specifies a data store in Amazon Simple Storage Service (Amazon S3).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class S3Target {
  /// A list of glob patterns used to exclude from the crawl. For more
  /// information, see <a
  /// href="http://docs.aws.amazon.com/glue/latest/dg/add-crawler.html">Catalog
  /// Tables with a Crawler</a>.
  @_s.JsonKey(name: 'Exclusions')
  final List<String> exclusions;

  /// The path to the Amazon S3 target.
  @_s.JsonKey(name: 'Path')
  final String path;

  S3Target({
    this.exclusions,
    this.path,
  });
  factory S3Target.fromJson(Map<String, dynamic> json) =>
      _$S3TargetFromJson(json);

  Map<String, dynamic> toJson() => _$S3TargetToJson(this);
}

/// A scheduling object using a <code>cron</code> statement to schedule an
/// event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Schedule {
  /// A <code>cron</code> expression used to specify the schedule. For more
  /// information, see <a
  /// href="http://docs.aws.amazon.com/glue/latest/dg/monitor-data-warehouse-schedule.html">Time-Based
  /// Schedules for Jobs and Crawlers</a>. For example, to run something every day
  /// at 12:15 UTC, specify <code>cron(15 12 * * ? *)</code>.
  @_s.JsonKey(name: 'ScheduleExpression')
  final String scheduleExpression;

  /// The state of the schedule.
  @_s.JsonKey(name: 'State')
  final ScheduleState state;

  Schedule({
    this.scheduleExpression,
    this.state,
  });
  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);
}

enum ScheduleState {
  @_s.JsonValue('SCHEDULED')
  scheduled,
  @_s.JsonValue('NOT_SCHEDULED')
  notScheduled,
  @_s.JsonValue('TRANSITIONING')
  transitioning,
}

/// A policy that specifies update and deletion behaviors for the crawler.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SchemaChangePolicy {
  /// The deletion behavior when the crawler finds a deleted object.
  @_s.JsonKey(name: 'DeleteBehavior')
  final DeleteBehavior deleteBehavior;

  /// The update behavior when the crawler finds a changed schema.
  @_s.JsonKey(name: 'UpdateBehavior')
  final UpdateBehavior updateBehavior;

  SchemaChangePolicy({
    this.deleteBehavior,
    this.updateBehavior,
  });
  factory SchemaChangePolicy.fromJson(Map<String, dynamic> json) =>
      _$SchemaChangePolicyFromJson(json);

  Map<String, dynamic> toJson() => _$SchemaChangePolicyToJson(this);
}

/// A key-value pair representing a column and data type that this transform can
/// run against. The <code>Schema</code> parameter of the
/// <code>MLTransform</code> may contain up to 100 of these structures.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SchemaColumn {
  /// The type of data in the column.
  @_s.JsonKey(name: 'DataType')
  final String dataType;

  /// The name of the column.
  @_s.JsonKey(name: 'Name')
  final String name;

  SchemaColumn({
    this.dataType,
    this.name,
  });
  factory SchemaColumn.fromJson(Map<String, dynamic> json) =>
      _$SchemaColumnFromJson(json);

  Map<String, dynamic> toJson() => _$SchemaColumnToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SearchTablesRequest {
  /// A unique identifier, consisting of <code> <i>account_id</i>/datalake</code>.
  @_s.JsonKey(name: 'CatalogId')
  final String catalogId;

  /// A list of key-value pairs, and a comparator used to filter the search
  /// results. Returns all entities matching the predicate.
  @_s.JsonKey(name: 'Filters')
  final List<PropertyPredicate> filters;

  /// The maximum number of tables to return in a single response.
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  /// A continuation token, included if this is a continuation call.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A string used for a text search.
  ///
  /// Specifying a value in quotes filters based on an exact match to the value.
  @_s.JsonKey(name: 'SearchText')
  final String searchText;

  /// A list of criteria for sorting the results by a field name, in an ascending
  /// or descending order.
  @_s.JsonKey(name: 'SortCriteria')
  final List<SortCriterion> sortCriteria;

  SearchTablesRequest({
    this.catalogId,
    this.filters,
    this.maxResults,
    this.nextToken,
    this.searchText,
    this.sortCriteria,
  });
  Map<String, dynamic> toJson() => _$SearchTablesRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SearchTablesResponse {
  /// A continuation token, present if the current list segment is not the last.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of the requested <code>Table</code> objects. The
  /// <code>SearchTables</code> response returns only the tables that you have
  /// access to.
  @_s.JsonKey(name: 'TableList')
  final List<Table> tableList;

  SearchTablesResponse({
    this.nextToken,
    this.tableList,
  });
  factory SearchTablesResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchTablesResponseFromJson(json);
}

/// Specifies a security configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SecurityConfiguration {
  /// The time at which this security configuration was created.
  @_s.JsonKey(
      name: 'CreatedTimeStamp',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime createdTimeStamp;

  /// The encryption configuration associated with this security configuration.
  @_s.JsonKey(name: 'EncryptionConfiguration')
  final EncryptionConfiguration encryptionConfiguration;

  /// The name of the security configuration.
  @_s.JsonKey(name: 'Name')
  final String name;

  SecurityConfiguration({
    this.createdTimeStamp,
    this.encryptionConfiguration,
    this.name,
  });
  factory SecurityConfiguration.fromJson(Map<String, dynamic> json) =>
      _$SecurityConfigurationFromJson(json);
}

/// Defines a non-overlapping region of a table's partitions, allowing multiple
/// requests to be executed in parallel.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Segment {
  /// The zero-based index number of the segment. For example, if the total number
  /// of segments is 4, <code>SegmentNumber</code> values range from 0 through 3.
  @_s.JsonKey(name: 'SegmentNumber')
  final int segmentNumber;

  /// The total number of segments.
  @_s.JsonKey(name: 'TotalSegments')
  final int totalSegments;

  Segment({
    @_s.required this.segmentNumber,
    @_s.required this.totalSegments,
  });
  Map<String, dynamic> toJson() => _$SegmentToJson(this);
}

/// Information about a serialization/deserialization program (SerDe) that
/// serves as an extractor and loader.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SerDeInfo {
  /// Name of the SerDe.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// These key-value pairs define initialization parameters for the SerDe.
  @_s.JsonKey(name: 'Parameters')
  final Map<String, String> parameters;

  /// Usually the class that implements the SerDe. An example is
  /// <code>org.apache.hadoop.hive.serde2.columnar.ColumnarSerDe</code>.
  @_s.JsonKey(name: 'SerializationLibrary')
  final String serializationLibrary;

  SerDeInfo({
    this.name,
    this.parameters,
    this.serializationLibrary,
  });
  factory SerDeInfo.fromJson(Map<String, dynamic> json) =>
      _$SerDeInfoFromJson(json);

  Map<String, dynamic> toJson() => _$SerDeInfoToJson(this);
}

/// Specifies skewed values in a table. Skewed values are those that occur with
/// very high frequency.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SkewedInfo {
  /// A list of names of columns that contain skewed values.
  @_s.JsonKey(name: 'SkewedColumnNames')
  final List<String> skewedColumnNames;

  /// A mapping of skewed values to the columns that contain them.
  @_s.JsonKey(name: 'SkewedColumnValueLocationMaps')
  final Map<String, String> skewedColumnValueLocationMaps;

  /// A list of values that appear so frequently as to be considered skewed.
  @_s.JsonKey(name: 'SkewedColumnValues')
  final List<String> skewedColumnValues;

  SkewedInfo({
    this.skewedColumnNames,
    this.skewedColumnValueLocationMaps,
    this.skewedColumnValues,
  });
  factory SkewedInfo.fromJson(Map<String, dynamic> json) =>
      _$SkewedInfoFromJson(json);

  Map<String, dynamic> toJson() => _$SkewedInfoToJson(this);
}

enum Sort {
  @_s.JsonValue('ASC')
  asc,
  @_s.JsonValue('DESC')
  desc,
}

/// Specifies a field to sort by and a sort order.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SortCriterion {
  /// The name of the field on which to sort.
  @_s.JsonKey(name: 'FieldName')
  final String fieldName;

  /// An ascending or descending sort.
  @_s.JsonKey(name: 'Sort')
  final Sort sort;

  SortCriterion({
    this.fieldName,
    this.sort,
  });
  Map<String, dynamic> toJson() => _$SortCriterionToJson(this);
}

enum SortDirectionType {
  @_s.JsonValue('DESCENDING')
  descending,
  @_s.JsonValue('ASCENDING')
  ascending,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class StartCrawlerRequest {
  /// Name of the crawler to start.
  @_s.JsonKey(name: 'Name')
  final String name;

  StartCrawlerRequest({
    @_s.required this.name,
  });
  Map<String, dynamic> toJson() => _$StartCrawlerRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartCrawlerResponse {
  StartCrawlerResponse();
  factory StartCrawlerResponse.fromJson(Map<String, dynamic> json) =>
      _$StartCrawlerResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class StartCrawlerScheduleRequest {
  /// Name of the crawler to schedule.
  @_s.JsonKey(name: 'CrawlerName')
  final String crawlerName;

  StartCrawlerScheduleRequest({
    @_s.required this.crawlerName,
  });
  Map<String, dynamic> toJson() => _$StartCrawlerScheduleRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartCrawlerScheduleResponse {
  StartCrawlerScheduleResponse();
  factory StartCrawlerScheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$StartCrawlerScheduleResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class StartExportLabelsTaskRunRequest {
  /// The Amazon S3 path where you export the labels.
  @_s.JsonKey(name: 'OutputS3Path')
  final String outputS3Path;

  /// The unique identifier of the machine learning transform.
  @_s.JsonKey(name: 'TransformId')
  final String transformId;

  StartExportLabelsTaskRunRequest({
    @_s.required this.outputS3Path,
    @_s.required this.transformId,
  });
  Map<String, dynamic> toJson() =>
      _$StartExportLabelsTaskRunRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartExportLabelsTaskRunResponse {
  /// The unique identifier for the task run.
  @_s.JsonKey(name: 'TaskRunId')
  final String taskRunId;

  StartExportLabelsTaskRunResponse({
    this.taskRunId,
  });
  factory StartExportLabelsTaskRunResponse.fromJson(
          Map<String, dynamic> json) =>
      _$StartExportLabelsTaskRunResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class StartImportLabelsTaskRunRequest {
  /// The Amazon Simple Storage Service (Amazon S3) path from where you import the
  /// labels.
  @_s.JsonKey(name: 'InputS3Path')
  final String inputS3Path;

  /// The unique identifier of the machine learning transform.
  @_s.JsonKey(name: 'TransformId')
  final String transformId;

  /// Indicates whether to overwrite your existing labels.
  @_s.JsonKey(name: 'ReplaceAllLabels')
  final bool replaceAllLabels;

  StartImportLabelsTaskRunRequest({
    @_s.required this.inputS3Path,
    @_s.required this.transformId,
    this.replaceAllLabels,
  });
  Map<String, dynamic> toJson() =>
      _$StartImportLabelsTaskRunRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartImportLabelsTaskRunResponse {
  /// The unique identifier for the task run.
  @_s.JsonKey(name: 'TaskRunId')
  final String taskRunId;

  StartImportLabelsTaskRunResponse({
    this.taskRunId,
  });
  factory StartImportLabelsTaskRunResponse.fromJson(
          Map<String, dynamic> json) =>
      _$StartImportLabelsTaskRunResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class StartJobRunRequest {
  /// The name of the job definition to use.
  @_s.JsonKey(name: 'JobName')
  final String jobName;

  /// This field is deprecated. Use <code>MaxCapacity</code> instead.
  ///
  /// The number of AWS Glue data processing units (DPUs) to allocate to this
  /// JobRun. From 2 to 100 DPUs can be allocated; the default is 10. A DPU is a
  /// relative measure of processing power that consists of 4 vCPUs of compute
  /// capacity and 16 GB of memory. For more information, see the <a
  /// href="https://docs.aws.amazon.com/https:/aws.amazon.com/glue/pricing/">AWS
  /// Glue pricing page</a>.
  @_s.JsonKey(name: 'AllocatedCapacity')
  final int allocatedCapacity;

  /// The job arguments specifically for this run. For this job run, they replace
  /// the default arguments set in the job definition itself.
  ///
  /// You can specify arguments here that your own job-execution script consumes,
  /// as well as arguments that AWS Glue itself consumes.
  ///
  /// For information about how to specify and consume your own Job arguments, see
  /// the <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-python-calling.html">Calling
  /// AWS Glue APIs in Python</a> topic in the developer guide.
  ///
  /// For information about the key-value pairs that AWS Glue consumes to set up
  /// your job, see the <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-etl-glue-arguments.html">Special
  /// Parameters Used by AWS Glue</a> topic in the developer guide.
  @_s.JsonKey(name: 'Arguments')
  final Map<String, String> arguments;

  /// The ID of a previous <code>JobRun</code> to retry.
  @_s.JsonKey(name: 'JobRunId')
  final String jobRunId;

  /// The number of AWS Glue data processing units (DPUs) that can be allocated
  /// when this job runs. A DPU is a relative measure of processing power that
  /// consists of 4 vCPUs of compute capacity and 16 GB of memory. For more
  /// information, see the <a
  /// href="https://docs.aws.amazon.com/https:/aws.amazon.com/glue/pricing/">AWS
  /// Glue pricing page</a>.
  ///
  /// Do not set <code>Max Capacity</code> if using <code>WorkerType</code> and
  /// <code>NumberOfWorkers</code>.
  ///
  /// The value that can be allocated for <code>MaxCapacity</code> depends on
  /// whether you are running a Python shell job, or an Apache Spark ETL job:
  ///
  /// <ul>
  /// <li>
  /// When you specify a Python shell job
  /// (<code>JobCommand.Name</code>="pythonshell"), you can allocate either 0.0625
  /// or 1 DPU. The default is 0.0625 DPU.
  /// </li>
  /// <li>
  /// When you specify an Apache Spark ETL job
  /// (<code>JobCommand.Name</code>="glueetl"), you can allocate from 2 to 100
  /// DPUs. The default is 10 DPUs. This job type cannot have a fractional DPU
  /// allocation.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'MaxCapacity')
  final double maxCapacity;

  /// Specifies configuration properties of a job run notification.
  @_s.JsonKey(name: 'NotificationProperty')
  final NotificationProperty notificationProperty;

  /// The number of workers of a defined <code>workerType</code> that are
  /// allocated when a job runs.
  ///
  /// The maximum number of workers you can define are 299 for <code>G.1X</code>,
  /// and 149 for <code>G.2X</code>.
  @_s.JsonKey(name: 'NumberOfWorkers')
  final int numberOfWorkers;

  /// The name of the <code>SecurityConfiguration</code> structure to be used with
  /// this job run.
  @_s.JsonKey(name: 'SecurityConfiguration')
  final String securityConfiguration;

  /// The <code>JobRun</code> timeout in minutes. This is the maximum time that a
  /// job run can consume resources before it is terminated and enters
  /// <code>TIMEOUT</code> status. The default is 2,880 minutes (48 hours). This
  /// overrides the timeout value set in the parent job.
  @_s.JsonKey(name: 'Timeout')
  final int timeout;

  /// The type of predefined worker that is allocated when a job runs. Accepts a
  /// value of Standard, G.1X, or G.2X.
  ///
  /// <ul>
  /// <li>
  /// For the <code>Standard</code> worker type, each worker provides 4 vCPU, 16
  /// GB of memory and a 50GB disk, and 2 executors per worker.
  /// </li>
  /// <li>
  /// For the <code>G.1X</code> worker type, each worker provides 4 vCPU, 16 GB of
  /// memory and a 64GB disk, and 1 executor per worker.
  /// </li>
  /// <li>
  /// For the <code>G.2X</code> worker type, each worker provides 8 vCPU, 32 GB of
  /// memory and a 128GB disk, and 1 executor per worker.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'WorkerType')
  final WorkerType workerType;

  StartJobRunRequest({
    @_s.required this.jobName,
    this.allocatedCapacity,
    this.arguments,
    this.jobRunId,
    this.maxCapacity,
    this.notificationProperty,
    this.numberOfWorkers,
    this.securityConfiguration,
    this.timeout,
    this.workerType,
  });
  Map<String, dynamic> toJson() => _$StartJobRunRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartJobRunResponse {
  /// The ID assigned to this job run.
  @_s.JsonKey(name: 'JobRunId')
  final String jobRunId;

  StartJobRunResponse({
    this.jobRunId,
  });
  factory StartJobRunResponse.fromJson(Map<String, dynamic> json) =>
      _$StartJobRunResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class StartMLEvaluationTaskRunRequest {
  /// The unique identifier of the machine learning transform.
  @_s.JsonKey(name: 'TransformId')
  final String transformId;

  StartMLEvaluationTaskRunRequest({
    @_s.required this.transformId,
  });
  Map<String, dynamic> toJson() =>
      _$StartMLEvaluationTaskRunRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartMLEvaluationTaskRunResponse {
  /// The unique identifier associated with this run.
  @_s.JsonKey(name: 'TaskRunId')
  final String taskRunId;

  StartMLEvaluationTaskRunResponse({
    this.taskRunId,
  });
  factory StartMLEvaluationTaskRunResponse.fromJson(
          Map<String, dynamic> json) =>
      _$StartMLEvaluationTaskRunResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class StartMLLabelingSetGenerationTaskRunRequest {
  /// The Amazon Simple Storage Service (Amazon S3) path where you generate the
  /// labeling set.
  @_s.JsonKey(name: 'OutputS3Path')
  final String outputS3Path;

  /// The unique identifier of the machine learning transform.
  @_s.JsonKey(name: 'TransformId')
  final String transformId;

  StartMLLabelingSetGenerationTaskRunRequest({
    @_s.required this.outputS3Path,
    @_s.required this.transformId,
  });
  Map<String, dynamic> toJson() =>
      _$StartMLLabelingSetGenerationTaskRunRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartMLLabelingSetGenerationTaskRunResponse {
  /// The unique run identifier that is associated with this task run.
  @_s.JsonKey(name: 'TaskRunId')
  final String taskRunId;

  StartMLLabelingSetGenerationTaskRunResponse({
    this.taskRunId,
  });
  factory StartMLLabelingSetGenerationTaskRunResponse.fromJson(
          Map<String, dynamic> json) =>
      _$StartMLLabelingSetGenerationTaskRunResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class StartTriggerRequest {
  /// The name of the trigger to start.
  @_s.JsonKey(name: 'Name')
  final String name;

  StartTriggerRequest({
    @_s.required this.name,
  });
  Map<String, dynamic> toJson() => _$StartTriggerRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartTriggerResponse {
  /// The name of the trigger that was started.
  @_s.JsonKey(name: 'Name')
  final String name;

  StartTriggerResponse({
    this.name,
  });
  factory StartTriggerResponse.fromJson(Map<String, dynamic> json) =>
      _$StartTriggerResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class StartWorkflowRunRequest {
  /// The name of the workflow to start.
  @_s.JsonKey(name: 'Name')
  final String name;

  StartWorkflowRunRequest({
    @_s.required this.name,
  });
  Map<String, dynamic> toJson() => _$StartWorkflowRunRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartWorkflowRunResponse {
  /// An Id for the new run.
  @_s.JsonKey(name: 'RunId')
  final String runId;

  StartWorkflowRunResponse({
    this.runId,
  });
  factory StartWorkflowRunResponse.fromJson(Map<String, dynamic> json) =>
      _$StartWorkflowRunResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class StopCrawlerRequest {
  /// Name of the crawler to stop.
  @_s.JsonKey(name: 'Name')
  final String name;

  StopCrawlerRequest({
    @_s.required this.name,
  });
  Map<String, dynamic> toJson() => _$StopCrawlerRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopCrawlerResponse {
  StopCrawlerResponse();
  factory StopCrawlerResponse.fromJson(Map<String, dynamic> json) =>
      _$StopCrawlerResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class StopCrawlerScheduleRequest {
  /// Name of the crawler whose schedule state to set.
  @_s.JsonKey(name: 'CrawlerName')
  final String crawlerName;

  StopCrawlerScheduleRequest({
    @_s.required this.crawlerName,
  });
  Map<String, dynamic> toJson() => _$StopCrawlerScheduleRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopCrawlerScheduleResponse {
  StopCrawlerScheduleResponse();
  factory StopCrawlerScheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$StopCrawlerScheduleResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class StopTriggerRequest {
  /// The name of the trigger to stop.
  @_s.JsonKey(name: 'Name')
  final String name;

  StopTriggerRequest({
    @_s.required this.name,
  });
  Map<String, dynamic> toJson() => _$StopTriggerRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopTriggerResponse {
  /// The name of the trigger that was stopped.
  @_s.JsonKey(name: 'Name')
  final String name;

  StopTriggerResponse({
    this.name,
  });
  factory StopTriggerResponse.fromJson(Map<String, dynamic> json) =>
      _$StopTriggerResponseFromJson(json);
}

/// Describes the physical storage of table data.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class StorageDescriptor {
  /// A list of reducer grouping columns, clustering columns, and bucketing
  /// columns in the table.
  @_s.JsonKey(name: 'BucketColumns')
  final List<String> bucketColumns;

  /// A list of the <code>Columns</code> in the table.
  @_s.JsonKey(name: 'Columns')
  final List<Column> columns;

  /// <code>True</code> if the data in the table is compressed, or
  /// <code>False</code> if not.
  @_s.JsonKey(name: 'Compressed')
  final bool compressed;

  /// The input format: <code>SequenceFileInputFormat</code> (binary), or
  /// <code>TextInputFormat</code>, or a custom format.
  @_s.JsonKey(name: 'InputFormat')
  final String inputFormat;

  /// The physical location of the table. By default, this takes the form of the
  /// warehouse location, followed by the database location in the warehouse,
  /// followed by the table name.
  @_s.JsonKey(name: 'Location')
  final String location;

  /// Must be specified if the table contains any dimension columns.
  @_s.JsonKey(name: 'NumberOfBuckets')
  final int numberOfBuckets;

  /// The output format: <code>SequenceFileOutputFormat</code> (binary), or
  /// <code>IgnoreKeyTextOutputFormat</code>, or a custom format.
  @_s.JsonKey(name: 'OutputFormat')
  final String outputFormat;

  /// The user-supplied properties in key-value form.
  @_s.JsonKey(name: 'Parameters')
  final Map<String, String> parameters;

  /// The serialization/deserialization (SerDe) information.
  @_s.JsonKey(name: 'SerdeInfo')
  final SerDeInfo serdeInfo;

  /// The information about values that appear frequently in a column (skewed
  /// values).
  @_s.JsonKey(name: 'SkewedInfo')
  final SkewedInfo skewedInfo;

  /// A list specifying the sort order of each bucket in the table.
  @_s.JsonKey(name: 'SortColumns')
  final List<Order> sortColumns;

  /// <code>True</code> if the table data is stored in subdirectories, or
  /// <code>False</code> if not.
  @_s.JsonKey(name: 'StoredAsSubDirectories')
  final bool storedAsSubDirectories;

  StorageDescriptor({
    this.bucketColumns,
    this.columns,
    this.compressed,
    this.inputFormat,
    this.location,
    this.numberOfBuckets,
    this.outputFormat,
    this.parameters,
    this.serdeInfo,
    this.skewedInfo,
    this.sortColumns,
    this.storedAsSubDirectories,
  });
  factory StorageDescriptor.fromJson(Map<String, dynamic> json) =>
      _$StorageDescriptorFromJson(json);

  Map<String, dynamic> toJson() => _$StorageDescriptorToJson(this);
}

/// Represents a collection of related data organized in columns and rows.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Table {
  /// The table name. For Hive compatibility, this must be entirely lowercase.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The time when the table definition was created in the Data Catalog.
  @_s.JsonKey(
      name: 'CreateTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime createTime;

  /// The person or entity who created the table.
  @_s.JsonKey(name: 'CreatedBy')
  final String createdBy;

  /// The name of the database where the table metadata resides. For Hive
  /// compatibility, this must be all lowercase.
  @_s.JsonKey(name: 'DatabaseName')
  final String databaseName;

  /// A description of the table.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// Indicates whether the table has been registered with AWS Lake Formation.
  @_s.JsonKey(name: 'IsRegisteredWithLakeFormation')
  final bool isRegisteredWithLakeFormation;

  /// The last time that the table was accessed. This is usually taken from HDFS,
  /// and might not be reliable.
  @_s.JsonKey(
      name: 'LastAccessTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastAccessTime;

  /// The last time that column statistics were computed for this table.
  @_s.JsonKey(
      name: 'LastAnalyzedTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastAnalyzedTime;

  /// The owner of the table.
  @_s.JsonKey(name: 'Owner')
  final String owner;

  /// These key-value pairs define properties associated with the table.
  @_s.JsonKey(name: 'Parameters')
  final Map<String, String> parameters;

  /// A list of columns by which the table is partitioned. Only primitive types
  /// are supported as partition keys.
  ///
  /// When you create a table used by Amazon Athena, and you do not specify any
  /// <code>partitionKeys</code>, you must at least set the value of
  /// <code>partitionKeys</code> to an empty list. For example:
  ///
  /// <code>"PartitionKeys": []</code>
  @_s.JsonKey(name: 'PartitionKeys')
  final List<Column> partitionKeys;

  /// The retention time for this table.
  @_s.JsonKey(name: 'Retention')
  final int retention;

  /// A storage descriptor containing information about the physical storage of
  /// this table.
  @_s.JsonKey(name: 'StorageDescriptor')
  final StorageDescriptor storageDescriptor;

  /// The type of this table (<code>EXTERNAL_TABLE</code>,
  /// <code>VIRTUAL_VIEW</code>, etc.).
  @_s.JsonKey(name: 'TableType')
  final String tableType;

  /// The last time that the table was updated.
  @_s.JsonKey(
      name: 'UpdateTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime updateTime;

  /// If the table is a view, the expanded text of the view; otherwise
  /// <code>null</code>.
  @_s.JsonKey(name: 'ViewExpandedText')
  final String viewExpandedText;

  /// If the table is a view, the original text of the view; otherwise
  /// <code>null</code>.
  @_s.JsonKey(name: 'ViewOriginalText')
  final String viewOriginalText;

  Table({
    @_s.required this.name,
    this.createTime,
    this.createdBy,
    this.databaseName,
    this.description,
    this.isRegisteredWithLakeFormation,
    this.lastAccessTime,
    this.lastAnalyzedTime,
    this.owner,
    this.parameters,
    this.partitionKeys,
    this.retention,
    this.storageDescriptor,
    this.tableType,
    this.updateTime,
    this.viewExpandedText,
    this.viewOriginalText,
  });
  factory Table.fromJson(Map<String, dynamic> json) => _$TableFromJson(json);
}

/// An error record for table operations.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TableError {
  /// The details about the error.
  @_s.JsonKey(name: 'ErrorDetail')
  final ErrorDetail errorDetail;

  /// The name of the table. For Hive compatibility, this must be entirely
  /// lowercase.
  @_s.JsonKey(name: 'TableName')
  final String tableName;

  TableError({
    this.errorDetail,
    this.tableName,
  });
  factory TableError.fromJson(Map<String, dynamic> json) =>
      _$TableErrorFromJson(json);
}

/// A structure used to define a table.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TableInput {
  /// The table name. For Hive compatibility, this is folded to lowercase when it
  /// is stored.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// A description of the table.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The last time that the table was accessed.
  @_s.JsonKey(
      name: 'LastAccessTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastAccessTime;

  /// The last time that column statistics were computed for this table.
  @_s.JsonKey(
      name: 'LastAnalyzedTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastAnalyzedTime;

  /// The table owner.
  @_s.JsonKey(name: 'Owner')
  final String owner;

  /// These key-value pairs define properties associated with the table.
  @_s.JsonKey(name: 'Parameters')
  final Map<String, String> parameters;

  /// A list of columns by which the table is partitioned. Only primitive types
  /// are supported as partition keys.
  ///
  /// When you create a table used by Amazon Athena, and you do not specify any
  /// <code>partitionKeys</code>, you must at least set the value of
  /// <code>partitionKeys</code> to an empty list. For example:
  ///
  /// <code>"PartitionKeys": []</code>
  @_s.JsonKey(name: 'PartitionKeys')
  final List<Column> partitionKeys;

  /// The retention time for this table.
  @_s.JsonKey(name: 'Retention')
  final int retention;

  /// A storage descriptor containing information about the physical storage of
  /// this table.
  @_s.JsonKey(name: 'StorageDescriptor')
  final StorageDescriptor storageDescriptor;

  /// The type of this table (<code>EXTERNAL_TABLE</code>,
  /// <code>VIRTUAL_VIEW</code>, etc.).
  @_s.JsonKey(name: 'TableType')
  final String tableType;

  /// If the table is a view, the expanded text of the view; otherwise
  /// <code>null</code>.
  @_s.JsonKey(name: 'ViewExpandedText')
  final String viewExpandedText;

  /// If the table is a view, the original text of the view; otherwise
  /// <code>null</code>.
  @_s.JsonKey(name: 'ViewOriginalText')
  final String viewOriginalText;

  TableInput({
    @_s.required this.name,
    this.description,
    this.lastAccessTime,
    this.lastAnalyzedTime,
    this.owner,
    this.parameters,
    this.partitionKeys,
    this.retention,
    this.storageDescriptor,
    this.tableType,
    this.viewExpandedText,
    this.viewOriginalText,
  });
  Map<String, dynamic> toJson() => _$TableInputToJson(this);
}

/// Specifies a version of a table.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TableVersion {
  /// The table in question.
  @_s.JsonKey(name: 'Table')
  final Table table;

  /// The ID value that identifies this table version. A <code>VersionId</code> is
  /// a string representation of an integer. Each version is incremented by 1.
  @_s.JsonKey(name: 'VersionId')
  final String versionId;

  TableVersion({
    this.table,
    this.versionId,
  });
  factory TableVersion.fromJson(Map<String, dynamic> json) =>
      _$TableVersionFromJson(json);
}

/// An error record for table-version operations.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TableVersionError {
  /// The details about the error.
  @_s.JsonKey(name: 'ErrorDetail')
  final ErrorDetail errorDetail;

  /// The name of the table in question.
  @_s.JsonKey(name: 'TableName')
  final String tableName;

  /// The ID value of the version in question. A <code>VersionID</code> is a
  /// string representation of an integer. Each version is incremented by 1.
  @_s.JsonKey(name: 'VersionId')
  final String versionId;

  TableVersionError({
    this.errorDetail,
    this.tableName,
    this.versionId,
  });
  factory TableVersionError.fromJson(Map<String, dynamic> json) =>
      _$TableVersionErrorFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TagResourceRequest {
  /// The ARN of the AWS Glue resource to which to add the tags. For more
  /// information about AWS Glue resource ARNs, see the <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-api-common.html#aws-glue-api-regex-aws-glue-arn-id">AWS
  /// Glue ARN string pattern</a>.
  @_s.JsonKey(name: 'ResourceArn')
  final String resourceArn;

  /// Tags to add to this resource.
  @_s.JsonKey(name: 'TagsToAdd')
  final Map<String, String> tagsToAdd;

  TagResourceRequest({
    @_s.required this.resourceArn,
    @_s.required this.tagsToAdd,
  });
  Map<String, dynamic> toJson() => _$TagResourceRequestToJson(this);
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

/// The sampling parameters that are associated with the machine learning
/// transform.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TaskRun {
  /// The last point in time that the requested task run was completed.
  @_s.JsonKey(
      name: 'CompletedOn',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime completedOn;

  /// The list of error strings associated with this task run.
  @_s.JsonKey(name: 'ErrorString')
  final String errorString;

  /// The amount of time (in seconds) that the task run consumed resources.
  @_s.JsonKey(name: 'ExecutionTime')
  final int executionTime;

  /// The last point in time that the requested task run was updated.
  @_s.JsonKey(
      name: 'LastModifiedOn',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastModifiedOn;

  /// The names of the log group for secure logging, associated with this task
  /// run.
  @_s.JsonKey(name: 'LogGroupName')
  final String logGroupName;

  /// Specifies configuration properties associated with this task run.
  @_s.JsonKey(name: 'Properties')
  final TaskRunProperties properties;

  /// The date and time that this task run started.
  @_s.JsonKey(
      name: 'StartedOn',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime startedOn;

  /// The current status of the requested task run.
  @_s.JsonKey(name: 'Status')
  final TaskStatusType status;

  /// The unique identifier for this task run.
  @_s.JsonKey(name: 'TaskRunId')
  final String taskRunId;

  /// The unique identifier for the transform.
  @_s.JsonKey(name: 'TransformId')
  final String transformId;

  TaskRun({
    this.completedOn,
    this.errorString,
    this.executionTime,
    this.lastModifiedOn,
    this.logGroupName,
    this.properties,
    this.startedOn,
    this.status,
    this.taskRunId,
    this.transformId,
  });
  factory TaskRun.fromJson(Map<String, dynamic> json) =>
      _$TaskRunFromJson(json);
}

/// The criteria that are used to filter the task runs for the machine learning
/// transform.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TaskRunFilterCriteria {
  /// Filter on task runs started after this date.
  @_s.JsonKey(
      name: 'StartedAfter',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime startedAfter;

  /// Filter on task runs started before this date.
  @_s.JsonKey(
      name: 'StartedBefore',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime startedBefore;

  /// The current status of the task run.
  @_s.JsonKey(name: 'Status')
  final TaskStatusType status;

  /// The type of task run.
  @_s.JsonKey(name: 'TaskRunType')
  final TaskType taskRunType;

  TaskRunFilterCriteria({
    this.startedAfter,
    this.startedBefore,
    this.status,
    this.taskRunType,
  });
  Map<String, dynamic> toJson() => _$TaskRunFilterCriteriaToJson(this);
}

/// The configuration properties for the task run.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TaskRunProperties {
  /// The configuration properties for an exporting labels task run.
  @_s.JsonKey(name: 'ExportLabelsTaskRunProperties')
  final ExportLabelsTaskRunProperties exportLabelsTaskRunProperties;

  /// The configuration properties for a find matches task run.
  @_s.JsonKey(name: 'FindMatchesTaskRunProperties')
  final FindMatchesTaskRunProperties findMatchesTaskRunProperties;

  /// The configuration properties for an importing labels task run.
  @_s.JsonKey(name: 'ImportLabelsTaskRunProperties')
  final ImportLabelsTaskRunProperties importLabelsTaskRunProperties;

  /// The configuration properties for a labeling set generation task run.
  @_s.JsonKey(name: 'LabelingSetGenerationTaskRunProperties')
  final LabelingSetGenerationTaskRunProperties
      labelingSetGenerationTaskRunProperties;

  /// The type of task run.
  @_s.JsonKey(name: 'TaskType')
  final TaskType taskType;

  TaskRunProperties({
    this.exportLabelsTaskRunProperties,
    this.findMatchesTaskRunProperties,
    this.importLabelsTaskRunProperties,
    this.labelingSetGenerationTaskRunProperties,
    this.taskType,
  });
  factory TaskRunProperties.fromJson(Map<String, dynamic> json) =>
      _$TaskRunPropertiesFromJson(json);
}

enum TaskRunSortColumnType {
  @_s.JsonValue('TASK_RUN_TYPE')
  taskRunType,
  @_s.JsonValue('STATUS')
  status,
  @_s.JsonValue('STARTED')
  started,
}

/// The sorting criteria that are used to sort the list of task runs for the
/// machine learning transform.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TaskRunSortCriteria {
  /// The column to be used to sort the list of task runs for the machine learning
  /// transform.
  @_s.JsonKey(name: 'Column')
  final TaskRunSortColumnType column;

  /// The sort direction to be used to sort the list of task runs for the machine
  /// learning transform.
  @_s.JsonKey(name: 'SortDirection')
  final SortDirectionType sortDirection;

  TaskRunSortCriteria({
    @_s.required this.column,
    @_s.required this.sortDirection,
  });
  Map<String, dynamic> toJson() => _$TaskRunSortCriteriaToJson(this);
}

enum TaskStatusType {
  @_s.JsonValue('STARTING')
  starting,
  @_s.JsonValue('RUNNING')
  running,
  @_s.JsonValue('STOPPING')
  stopping,
  @_s.JsonValue('STOPPED')
  stopped,
  @_s.JsonValue('SUCCEEDED')
  succeeded,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('TIMEOUT')
  timeout,
}

enum TaskType {
  @_s.JsonValue('EVALUATION')
  evaluation,
  @_s.JsonValue('LABELING_SET_GENERATION')
  labelingSetGeneration,
  @_s.JsonValue('IMPORT_LABELS')
  importLabels,
  @_s.JsonValue('EXPORT_LABELS')
  exportLabels,
  @_s.JsonValue('FIND_MATCHES')
  findMatches,
}

/// The criteria used to filter the machine learning transforms.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TransformFilterCriteria {
  /// The time and date after which the transforms were created.
  @_s.JsonKey(
      name: 'CreatedAfter',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime createdAfter;

  /// The time and date before which the transforms were created.
  @_s.JsonKey(
      name: 'CreatedBefore',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime createdBefore;

  /// This value determines which version of AWS Glue this machine learning
  /// transform is compatible with. Glue 1.0 is recommended for most customers. If
  /// the value is not set, the Glue compatibility defaults to Glue 0.9. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/release-notes.html#release-notes-versions">AWS
  /// Glue Versions</a> in the developer guide.
  @_s.JsonKey(name: 'GlueVersion')
  final String glueVersion;

  /// Filter on transforms last modified after this date.
  @_s.JsonKey(
      name: 'LastModifiedAfter',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastModifiedAfter;

  /// Filter on transforms last modified before this date.
  @_s.JsonKey(
      name: 'LastModifiedBefore',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastModifiedBefore;

  /// A unique transform name that is used to filter the machine learning
  /// transforms.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Filters on datasets with a specific schema. The <code>Map&lt;Column,
  /// Type&gt;</code> object is an array of key-value pairs representing the
  /// schema this transform accepts, where <code>Column</code> is the name of a
  /// column, and <code>Type</code> is the type of the data such as an integer or
  /// string. Has an upper bound of 100 columns.
  @_s.JsonKey(name: 'Schema')
  final List<SchemaColumn> schema;

  /// Filters the list of machine learning transforms by the last known status of
  /// the transforms (to indicate whether a transform can be used or not). One of
  /// "NOT_READY", "READY", or "DELETING".
  @_s.JsonKey(name: 'Status')
  final TransformStatusType status;

  /// The type of machine learning transform that is used to filter the machine
  /// learning transforms.
  @_s.JsonKey(name: 'TransformType')
  final TransformType transformType;

  TransformFilterCriteria({
    this.createdAfter,
    this.createdBefore,
    this.glueVersion,
    this.lastModifiedAfter,
    this.lastModifiedBefore,
    this.name,
    this.schema,
    this.status,
    this.transformType,
  });
  Map<String, dynamic> toJson() => _$TransformFilterCriteriaToJson(this);
}

/// The algorithm-specific parameters that are associated with the machine
/// learning transform.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TransformParameters {
  /// The type of machine learning transform.
  ///
  /// For information about the types of machine learning transforms, see <a
  /// href="http://docs.aws.amazon.com/glue/latest/dg/add-job-machine-learning-transform.html">Creating
  /// Machine Learning Transforms</a>.
  @_s.JsonKey(name: 'TransformType')
  final TransformType transformType;

  /// The parameters for the find matches algorithm.
  @_s.JsonKey(name: 'FindMatchesParameters')
  final FindMatchesParameters findMatchesParameters;

  TransformParameters({
    @_s.required this.transformType,
    this.findMatchesParameters,
  });
  factory TransformParameters.fromJson(Map<String, dynamic> json) =>
      _$TransformParametersFromJson(json);

  Map<String, dynamic> toJson() => _$TransformParametersToJson(this);
}

enum TransformSortColumnType {
  @_s.JsonValue('NAME')
  name,
  @_s.JsonValue('TRANSFORM_TYPE')
  transformType,
  @_s.JsonValue('STATUS')
  status,
  @_s.JsonValue('CREATED')
  created,
  @_s.JsonValue('LAST_MODIFIED')
  lastModified,
}

/// The sorting criteria that are associated with the machine learning
/// transform.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TransformSortCriteria {
  /// The column to be used in the sorting criteria that are associated with the
  /// machine learning transform.
  @_s.JsonKey(name: 'Column')
  final TransformSortColumnType column;

  /// The sort direction to be used in the sorting criteria that are associated
  /// with the machine learning transform.
  @_s.JsonKey(name: 'SortDirection')
  final SortDirectionType sortDirection;

  TransformSortCriteria({
    @_s.required this.column,
    @_s.required this.sortDirection,
  });
  Map<String, dynamic> toJson() => _$TransformSortCriteriaToJson(this);
}

enum TransformStatusType {
  @_s.JsonValue('NOT_READY')
  notReady,
  @_s.JsonValue('READY')
  ready,
  @_s.JsonValue('DELETING')
  deleting,
}

enum TransformType {
  @_s.JsonValue('FIND_MATCHES')
  findMatches,
}

/// Information about a specific trigger.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Trigger {
  /// The actions initiated by this trigger.
  @_s.JsonKey(name: 'Actions')
  final List<Action> actions;

  /// A description of this trigger.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// Reserved for future use.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the trigger.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The predicate of this trigger, which defines when it will fire.
  @_s.JsonKey(name: 'Predicate')
  final Predicate predicate;

  /// A <code>cron</code> expression used to specify the schedule (see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/monitor-data-warehouse-schedule.html">Time-Based
  /// Schedules for Jobs and Crawlers</a>. For example, to run something every day
  /// at 12:15 UTC, you would specify: <code>cron(15 12 * * ? *)</code>.
  @_s.JsonKey(name: 'Schedule')
  final String schedule;

  /// The current state of the trigger.
  @_s.JsonKey(name: 'State')
  final TriggerState state;

  /// The type of trigger that this is.
  @_s.JsonKey(name: 'Type')
  final TriggerType type;

  /// The name of the workflow associated with the trigger.
  @_s.JsonKey(name: 'WorkflowName')
  final String workflowName;

  Trigger({
    this.actions,
    this.description,
    this.id,
    this.name,
    this.predicate,
    this.schedule,
    this.state,
    this.type,
    this.workflowName,
  });
  factory Trigger.fromJson(Map<String, dynamic> json) =>
      _$TriggerFromJson(json);
}

/// The details of a Trigger node present in the workflow.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TriggerNodeDetails {
  /// The information of the trigger represented by the trigger node.
  @_s.JsonKey(name: 'Trigger')
  final Trigger trigger;

  TriggerNodeDetails({
    this.trigger,
  });
  factory TriggerNodeDetails.fromJson(Map<String, dynamic> json) =>
      _$TriggerNodeDetailsFromJson(json);
}

enum TriggerState {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('CREATED')
  created,
  @_s.JsonValue('ACTIVATING')
  activating,
  @_s.JsonValue('ACTIVATED')
  activated,
  @_s.JsonValue('DEACTIVATING')
  deactivating,
  @_s.JsonValue('DEACTIVATED')
  deactivated,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('UPDATING')
  updating,
}

enum TriggerType {
  @_s.JsonValue('SCHEDULED')
  scheduled,
  @_s.JsonValue('CONDITIONAL')
  conditional,
  @_s.JsonValue('ON_DEMAND')
  onDemand,
}

/// A structure used to provide information used to update a trigger. This
/// object updates the previous trigger definition by overwriting it completely.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TriggerUpdate {
  /// The actions initiated by this trigger.
  @_s.JsonKey(name: 'Actions')
  final List<Action> actions;

  /// A description of this trigger.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// Reserved for future use.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The predicate of this trigger, which defines when it will fire.
  @_s.JsonKey(name: 'Predicate')
  final Predicate predicate;

  /// A <code>cron</code> expression used to specify the schedule (see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/monitor-data-warehouse-schedule.html">Time-Based
  /// Schedules for Jobs and Crawlers</a>. For example, to run something every day
  /// at 12:15 UTC, you would specify: <code>cron(15 12 * * ? *)</code>.
  @_s.JsonKey(name: 'Schedule')
  final String schedule;

  TriggerUpdate({
    this.actions,
    this.description,
    this.name,
    this.predicate,
    this.schedule,
  });
  Map<String, dynamic> toJson() => _$TriggerUpdateToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UntagResourceRequest {
  /// The Amazon Resource Name (ARN) of the resource from which to remove the
  /// tags.
  @_s.JsonKey(name: 'ResourceArn')
  final String resourceArn;

  /// Tags to remove from this resource.
  @_s.JsonKey(name: 'TagsToRemove')
  final List<String> tagsToRemove;

  UntagResourceRequest({
    @_s.required this.resourceArn,
    @_s.required this.tagsToRemove,
  });
  Map<String, dynamic> toJson() => _$UntagResourceRequestToJson(this);
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

enum UpdateBehavior {
  @_s.JsonValue('LOG')
  log,
  @_s.JsonValue('UPDATE_IN_DATABASE')
  updateInDatabase,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateClassifierRequest {
  /// A <code>CsvClassifier</code> object with updated fields.
  @_s.JsonKey(name: 'CsvClassifier')
  final UpdateCsvClassifierRequest csvClassifier;

  /// A <code>GrokClassifier</code> object with updated fields.
  @_s.JsonKey(name: 'GrokClassifier')
  final UpdateGrokClassifierRequest grokClassifier;

  /// A <code>JsonClassifier</code> object with updated fields.
  @_s.JsonKey(name: 'JsonClassifier')
  final UpdateJsonClassifierRequest jsonClassifier;

  /// An <code>XMLClassifier</code> object with updated fields.
  @_s.JsonKey(name: 'XMLClassifier')
  final UpdateXMLClassifierRequest xMLClassifier;

  UpdateClassifierRequest({
    this.csvClassifier,
    this.grokClassifier,
    this.jsonClassifier,
    this.xMLClassifier,
  });
  Map<String, dynamic> toJson() => _$UpdateClassifierRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateClassifierResponse {
  UpdateClassifierResponse();
  factory UpdateClassifierResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateClassifierResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateConnectionRequest {
  /// A <code>ConnectionInput</code> object that redefines the connection in
  /// question.
  @_s.JsonKey(name: 'ConnectionInput')
  final ConnectionInput connectionInput;

  /// The name of the connection definition to update.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The ID of the Data Catalog in which the connection resides. If none is
  /// provided, the AWS account ID is used by default.
  @_s.JsonKey(name: 'CatalogId')
  final String catalogId;

  UpdateConnectionRequest({
    @_s.required this.connectionInput,
    @_s.required this.name,
    this.catalogId,
  });
  Map<String, dynamic> toJson() => _$UpdateConnectionRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateConnectionResponse {
  UpdateConnectionResponse();
  factory UpdateConnectionResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateConnectionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateCrawlerRequest {
  /// Name of the new crawler.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// A list of custom classifiers that the user has registered. By default, all
  /// built-in classifiers are included in a crawl, but these custom classifiers
  /// always override the default classifiers for a given classification.
  @_s.JsonKey(name: 'Classifiers')
  final List<String> classifiers;

  /// The crawler configuration information. This versioned JSON string allows
  /// users to specify aspects of a crawler's behavior. For more information, see
  /// <a
  /// href="http://docs.aws.amazon.com/glue/latest/dg/crawler-configuration.html">Configuring
  /// a Crawler</a>.
  @_s.JsonKey(name: 'Configuration')
  final String configuration;

  /// The name of the <code>SecurityConfiguration</code> structure to be used by
  /// this crawler.
  @_s.JsonKey(name: 'CrawlerSecurityConfiguration')
  final String crawlerSecurityConfiguration;

  /// The AWS Glue database where results are stored, such as:
  /// <code>arn:aws:daylight:us-east-1::database/sometable/*</code>.
  @_s.JsonKey(name: 'DatabaseName')
  final String databaseName;

  /// A description of the new crawler.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The IAM role or Amazon Resource Name (ARN) of an IAM role that is used by
  /// the new crawler to access customer resources.
  @_s.JsonKey(name: 'Role')
  final String role;

  /// A <code>cron</code> expression used to specify the schedule. For more
  /// information, see <a
  /// href="http://docs.aws.amazon.com/glue/latest/dg/monitor-data-warehouse-schedule.html">Time-Based
  /// Schedules for Jobs and Crawlers</a>. For example, to run something every day
  /// at 12:15 UTC, specify <code>cron(15 12 * * ? *)</code>.
  @_s.JsonKey(name: 'Schedule')
  final String schedule;

  /// The policy for the crawler's update and deletion behavior.
  @_s.JsonKey(name: 'SchemaChangePolicy')
  final SchemaChangePolicy schemaChangePolicy;

  /// The table prefix used for catalog tables that are created.
  @_s.JsonKey(name: 'TablePrefix')
  final String tablePrefix;

  /// A list of targets to crawl.
  @_s.JsonKey(name: 'Targets')
  final CrawlerTargets targets;

  UpdateCrawlerRequest({
    @_s.required this.name,
    this.classifiers,
    this.configuration,
    this.crawlerSecurityConfiguration,
    this.databaseName,
    this.description,
    this.role,
    this.schedule,
    this.schemaChangePolicy,
    this.tablePrefix,
    this.targets,
  });
  Map<String, dynamic> toJson() => _$UpdateCrawlerRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateCrawlerResponse {
  UpdateCrawlerResponse();
  factory UpdateCrawlerResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateCrawlerResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateCrawlerScheduleRequest {
  /// The name of the crawler whose schedule to update.
  @_s.JsonKey(name: 'CrawlerName')
  final String crawlerName;

  /// The updated <code>cron</code> expression used to specify the schedule. For
  /// more information, see <a
  /// href="http://docs.aws.amazon.com/glue/latest/dg/monitor-data-warehouse-schedule.html">Time-Based
  /// Schedules for Jobs and Crawlers</a>. For example, to run something every day
  /// at 12:15 UTC, specify <code>cron(15 12 * * ? *)</code>.
  @_s.JsonKey(name: 'Schedule')
  final String schedule;

  UpdateCrawlerScheduleRequest({
    @_s.required this.crawlerName,
    this.schedule,
  });
  Map<String, dynamic> toJson() => _$UpdateCrawlerScheduleRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateCrawlerScheduleResponse {
  UpdateCrawlerScheduleResponse();
  factory UpdateCrawlerScheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateCrawlerScheduleResponseFromJson(json);
}

/// Specifies a custom CSV classifier to be updated.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateCsvClassifierRequest {
  /// The name of the classifier.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Enables the processing of files that contain only one column.
  @_s.JsonKey(name: 'AllowSingleColumn')
  final bool allowSingleColumn;

  /// Indicates whether the CSV file contains a header.
  @_s.JsonKey(name: 'ContainsHeader')
  final CsvHeaderOption containsHeader;

  /// A custom symbol to denote what separates each column entry in the row.
  @_s.JsonKey(name: 'Delimiter')
  final String delimiter;

  /// Specifies not to trim values before identifying the type of column values.
  /// The default value is true.
  @_s.JsonKey(name: 'DisableValueTrimming')
  final bool disableValueTrimming;

  /// A list of strings representing column names.
  @_s.JsonKey(name: 'Header')
  final List<String> header;

  /// A custom symbol to denote what combines content into a single column value.
  /// It must be different from the column delimiter.
  @_s.JsonKey(name: 'QuoteSymbol')
  final String quoteSymbol;

  UpdateCsvClassifierRequest({
    @_s.required this.name,
    this.allowSingleColumn,
    this.containsHeader,
    this.delimiter,
    this.disableValueTrimming,
    this.header,
    this.quoteSymbol,
  });
  Map<String, dynamic> toJson() => _$UpdateCsvClassifierRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateDatabaseRequest {
  /// A <code>DatabaseInput</code> object specifying the new definition of the
  /// metadata database in the catalog.
  @_s.JsonKey(name: 'DatabaseInput')
  final DatabaseInput databaseInput;

  /// The name of the database to update in the catalog. For Hive compatibility,
  /// this is folded to lowercase.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The ID of the Data Catalog in which the metadata database resides. If none
  /// is provided, the AWS account ID is used by default.
  @_s.JsonKey(name: 'CatalogId')
  final String catalogId;

  UpdateDatabaseRequest({
    @_s.required this.databaseInput,
    @_s.required this.name,
    this.catalogId,
  });
  Map<String, dynamic> toJson() => _$UpdateDatabaseRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDatabaseResponse {
  UpdateDatabaseResponse();
  factory UpdateDatabaseResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateDatabaseResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateDevEndpointRequest {
  /// The name of the <code>DevEndpoint</code> to be updated.
  @_s.JsonKey(name: 'EndpointName')
  final String endpointName;

  /// The map of arguments to add the map of arguments used to configure the
  /// <code>DevEndpoint</code>.
  ///
  /// Valid arguments are:
  ///
  /// <ul>
  /// <li>
  /// <code>"--enable-glue-datacatalog": ""</code>
  /// </li>
  /// <li>
  /// <code>"GLUE_PYTHON_VERSION": "3"</code>
  /// </li>
  /// <li>
  /// <code>"GLUE_PYTHON_VERSION": "2"</code>
  /// </li>
  /// </ul>
  /// You can specify a version of Python support for development endpoints by
  /// using the <code>Arguments</code> parameter in the
  /// <code>CreateDevEndpoint</code> or <code>UpdateDevEndpoint</code> APIs. If no
  /// arguments are provided, the version defaults to Python 2.
  @_s.JsonKey(name: 'AddArguments')
  final Map<String, String> addArguments;

  /// The list of public keys for the <code>DevEndpoint</code> to use.
  @_s.JsonKey(name: 'AddPublicKeys')
  final List<String> addPublicKeys;

  /// Custom Python or Java libraries to be loaded in the
  /// <code>DevEndpoint</code>.
  @_s.JsonKey(name: 'CustomLibraries')
  final DevEndpointCustomLibraries customLibraries;

  /// The list of argument keys to be deleted from the map of arguments used to
  /// configure the <code>DevEndpoint</code>.
  @_s.JsonKey(name: 'DeleteArguments')
  final List<String> deleteArguments;

  /// The list of public keys to be deleted from the <code>DevEndpoint</code>.
  @_s.JsonKey(name: 'DeletePublicKeys')
  final List<String> deletePublicKeys;

  /// The public key for the <code>DevEndpoint</code> to use.
  @_s.JsonKey(name: 'PublicKey')
  final String publicKey;

  /// <code>True</code> if the list of custom libraries to be loaded in the
  /// development endpoint needs to be updated, or <code>False</code> if
  /// otherwise.
  @_s.JsonKey(name: 'UpdateEtlLibraries')
  final bool updateEtlLibraries;

  UpdateDevEndpointRequest({
    @_s.required this.endpointName,
    this.addArguments,
    this.addPublicKeys,
    this.customLibraries,
    this.deleteArguments,
    this.deletePublicKeys,
    this.publicKey,
    this.updateEtlLibraries,
  });
  Map<String, dynamic> toJson() => _$UpdateDevEndpointRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDevEndpointResponse {
  UpdateDevEndpointResponse();
  factory UpdateDevEndpointResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateDevEndpointResponseFromJson(json);
}

/// Specifies a grok classifier to update when passed to
/// <code>UpdateClassifier</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateGrokClassifierRequest {
  /// The name of the <code>GrokClassifier</code>.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// An identifier of the data format that the classifier matches, such as
  /// Twitter, JSON, Omniture logs, Amazon CloudWatch Logs, and so on.
  @_s.JsonKey(name: 'Classification')
  final String classification;

  /// Optional custom grok patterns used by this classifier.
  @_s.JsonKey(name: 'CustomPatterns')
  final String customPatterns;

  /// The grok pattern used by this classifier.
  @_s.JsonKey(name: 'GrokPattern')
  final String grokPattern;

  UpdateGrokClassifierRequest({
    @_s.required this.name,
    this.classification,
    this.customPatterns,
    this.grokPattern,
  });
  Map<String, dynamic> toJson() => _$UpdateGrokClassifierRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateJobRequest {
  /// The name of the job definition to update.
  @_s.JsonKey(name: 'JobName')
  final String jobName;

  /// Specifies the values with which to update the job definition.
  @_s.JsonKey(name: 'JobUpdate')
  final JobUpdate jobUpdate;

  UpdateJobRequest({
    @_s.required this.jobName,
    @_s.required this.jobUpdate,
  });
  Map<String, dynamic> toJson() => _$UpdateJobRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateJobResponse {
  /// Returns the name of the updated job definition.
  @_s.JsonKey(name: 'JobName')
  final String jobName;

  UpdateJobResponse({
    this.jobName,
  });
  factory UpdateJobResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateJobResponseFromJson(json);
}

/// Specifies a JSON classifier to be updated.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateJsonClassifierRequest {
  /// The name of the classifier.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// A <code>JsonPath</code> string defining the JSON data for the classifier to
  /// classify. AWS Glue supports a subset of <code>JsonPath</code>, as described
  /// in <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/custom-classifier.html#custom-classifier-json">Writing
  /// JsonPath Custom Classifiers</a>.
  @_s.JsonKey(name: 'JsonPath')
  final String jsonPath;

  UpdateJsonClassifierRequest({
    @_s.required this.name,
    this.jsonPath,
  });
  Map<String, dynamic> toJson() => _$UpdateJsonClassifierRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateMLTransformRequest {
  /// A unique identifier that was generated when the transform was created.
  @_s.JsonKey(name: 'TransformId')
  final String transformId;

  /// A description of the transform. The default is an empty string.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// This value determines which version of AWS Glue this machine learning
  /// transform is compatible with. Glue 1.0 is recommended for most customers. If
  /// the value is not set, the Glue compatibility defaults to Glue 0.9. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/release-notes.html#release-notes-versions">AWS
  /// Glue Versions</a> in the developer guide.
  @_s.JsonKey(name: 'GlueVersion')
  final String glueVersion;

  /// The number of AWS Glue data processing units (DPUs) that are allocated to
  /// task runs for this transform. You can allocate from 2 to 100 DPUs; the
  /// default is 10. A DPU is a relative measure of processing power that consists
  /// of 4 vCPUs of compute capacity and 16 GB of memory. For more information,
  /// see the <a href="https://aws.amazon.com/glue/pricing/">AWS Glue pricing
  /// page</a>.
  ///
  /// When the <code>WorkerType</code> field is set to a value other than
  /// <code>Standard</code>, the <code>MaxCapacity</code> field is set
  /// automatically and becomes read-only.
  @_s.JsonKey(name: 'MaxCapacity')
  final double maxCapacity;

  /// The maximum number of times to retry a task for this transform after a task
  /// run fails.
  @_s.JsonKey(name: 'MaxRetries')
  final int maxRetries;

  /// The unique name that you gave the transform when you created it.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The number of workers of a defined <code>workerType</code> that are
  /// allocated when this task runs.
  @_s.JsonKey(name: 'NumberOfWorkers')
  final int numberOfWorkers;

  /// The configuration parameters that are specific to the transform type
  /// (algorithm) used. Conditionally dependent on the transform type.
  @_s.JsonKey(name: 'Parameters')
  final TransformParameters parameters;

  /// The name or Amazon Resource Name (ARN) of the IAM role with the required
  /// permissions.
  @_s.JsonKey(name: 'Role')
  final String role;

  /// The timeout for a task run for this transform in minutes. This is the
  /// maximum time that a task run for this transform can consume resources before
  /// it is terminated and enters <code>TIMEOUT</code> status. The default is
  /// 2,880 minutes (48 hours).
  @_s.JsonKey(name: 'Timeout')
  final int timeout;

  /// The type of predefined worker that is allocated when this task runs. Accepts
  /// a value of Standard, G.1X, or G.2X.
  ///
  /// <ul>
  /// <li>
  /// For the <code>Standard</code> worker type, each worker provides 4 vCPU, 16
  /// GB of memory and a 50GB disk, and 2 executors per worker.
  /// </li>
  /// <li>
  /// For the <code>G.1X</code> worker type, each worker provides 4 vCPU, 16 GB of
  /// memory and a 64GB disk, and 1 executor per worker.
  /// </li>
  /// <li>
  /// For the <code>G.2X</code> worker type, each worker provides 8 vCPU, 32 GB of
  /// memory and a 128GB disk, and 1 executor per worker.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'WorkerType')
  final WorkerType workerType;

  UpdateMLTransformRequest({
    @_s.required this.transformId,
    this.description,
    this.glueVersion,
    this.maxCapacity,
    this.maxRetries,
    this.name,
    this.numberOfWorkers,
    this.parameters,
    this.role,
    this.timeout,
    this.workerType,
  });
  Map<String, dynamic> toJson() => _$UpdateMLTransformRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateMLTransformResponse {
  /// The unique identifier for the transform that was updated.
  @_s.JsonKey(name: 'TransformId')
  final String transformId;

  UpdateMLTransformResponse({
    this.transformId,
  });
  factory UpdateMLTransformResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateMLTransformResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdatePartitionRequest {
  /// The name of the catalog database in which the table in question resides.
  @_s.JsonKey(name: 'DatabaseName')
  final String databaseName;

  /// The new partition object to update the partition to.
  @_s.JsonKey(name: 'PartitionInput')
  final PartitionInput partitionInput;

  /// A list of the values defining the partition.
  @_s.JsonKey(name: 'PartitionValueList')
  final List<String> partitionValueList;

  /// The name of the table in which the partition to be updated is located.
  @_s.JsonKey(name: 'TableName')
  final String tableName;

  /// The ID of the Data Catalog where the partition to be updated resides. If
  /// none is provided, the AWS account ID is used by default.
  @_s.JsonKey(name: 'CatalogId')
  final String catalogId;

  UpdatePartitionRequest({
    @_s.required this.databaseName,
    @_s.required this.partitionInput,
    @_s.required this.partitionValueList,
    @_s.required this.tableName,
    this.catalogId,
  });
  Map<String, dynamic> toJson() => _$UpdatePartitionRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdatePartitionResponse {
  UpdatePartitionResponse();
  factory UpdatePartitionResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdatePartitionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateTableRequest {
  /// The name of the catalog database in which the table resides. For Hive
  /// compatibility, this name is entirely lowercase.
  @_s.JsonKey(name: 'DatabaseName')
  final String databaseName;

  /// An updated <code>TableInput</code> object to define the metadata table in
  /// the catalog.
  @_s.JsonKey(name: 'TableInput')
  final TableInput tableInput;

  /// The ID of the Data Catalog where the table resides. If none is provided, the
  /// AWS account ID is used by default.
  @_s.JsonKey(name: 'CatalogId')
  final String catalogId;

  /// By default, <code>UpdateTable</code> always creates an archived version of
  /// the table before updating it. However, if <code>skipArchive</code> is set to
  /// true, <code>UpdateTable</code> does not create the archived version.
  @_s.JsonKey(name: 'SkipArchive')
  final bool skipArchive;

  UpdateTableRequest({
    @_s.required this.databaseName,
    @_s.required this.tableInput,
    this.catalogId,
    this.skipArchive,
  });
  Map<String, dynamic> toJson() => _$UpdateTableRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateTableResponse {
  UpdateTableResponse();
  factory UpdateTableResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateTableResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateTriggerRequest {
  /// The name of the trigger to update.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The new values with which to update the trigger.
  @_s.JsonKey(name: 'TriggerUpdate')
  final TriggerUpdate triggerUpdate;

  UpdateTriggerRequest({
    @_s.required this.name,
    @_s.required this.triggerUpdate,
  });
  Map<String, dynamic> toJson() => _$UpdateTriggerRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateTriggerResponse {
  /// The resulting trigger definition.
  @_s.JsonKey(name: 'Trigger')
  final Trigger trigger;

  UpdateTriggerResponse({
    this.trigger,
  });
  factory UpdateTriggerResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateTriggerResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateUserDefinedFunctionRequest {
  /// The name of the catalog database where the function to be updated is
  /// located.
  @_s.JsonKey(name: 'DatabaseName')
  final String databaseName;

  /// A <code>FunctionInput</code> object that redefines the function in the Data
  /// Catalog.
  @_s.JsonKey(name: 'FunctionInput')
  final UserDefinedFunctionInput functionInput;

  /// The name of the function.
  @_s.JsonKey(name: 'FunctionName')
  final String functionName;

  /// The ID of the Data Catalog where the function to be updated is located. If
  /// none is provided, the AWS account ID is used by default.
  @_s.JsonKey(name: 'CatalogId')
  final String catalogId;

  UpdateUserDefinedFunctionRequest({
    @_s.required this.databaseName,
    @_s.required this.functionInput,
    @_s.required this.functionName,
    this.catalogId,
  });
  Map<String, dynamic> toJson() =>
      _$UpdateUserDefinedFunctionRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateUserDefinedFunctionResponse {
  UpdateUserDefinedFunctionResponse();
  factory UpdateUserDefinedFunctionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateUserDefinedFunctionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateWorkflowRequest {
  /// Name of the workflow to be updated.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// A collection of properties to be used as part of each execution of the
  /// workflow.
  @_s.JsonKey(name: 'DefaultRunProperties')
  final Map<String, String> defaultRunProperties;

  /// The description of the workflow.
  @_s.JsonKey(name: 'Description')
  final String description;

  UpdateWorkflowRequest({
    @_s.required this.name,
    this.defaultRunProperties,
    this.description,
  });
  Map<String, dynamic> toJson() => _$UpdateWorkflowRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateWorkflowResponse {
  /// The name of the workflow which was specified in input.
  @_s.JsonKey(name: 'Name')
  final String name;

  UpdateWorkflowResponse({
    this.name,
  });
  factory UpdateWorkflowResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateWorkflowResponseFromJson(json);
}

/// Specifies an XML classifier to be updated.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateXMLClassifierRequest {
  /// The name of the classifier.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// An identifier of the data format that the classifier matches.
  @_s.JsonKey(name: 'Classification')
  final String classification;

  /// The XML tag designating the element that contains each record in an XML
  /// document being parsed. This cannot identify a self-closing element (closed
  /// by <code>/&gt;</code>). An empty row element that contains only attributes
  /// can be parsed as long as it ends with a closing tag (for example,
  /// <code>&lt;row item_a="A" item_b="B"&gt;&lt;/row&gt;</code> is okay, but
  /// <code>&lt;row item_a="A" item_b="B" /&gt;</code> is not).
  @_s.JsonKey(name: 'RowTag')
  final String rowTag;

  UpdateXMLClassifierRequest({
    @_s.required this.name,
    this.classification,
    this.rowTag,
  });
  Map<String, dynamic> toJson() => _$UpdateXMLClassifierRequestToJson(this);
}

/// Represents the equivalent of a Hive user-defined function (<code>UDF</code>)
/// definition.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UserDefinedFunction {
  /// The Java class that contains the function code.
  @_s.JsonKey(name: 'ClassName')
  final String className;

  /// The time at which the function was created.
  @_s.JsonKey(
      name: 'CreateTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime createTime;

  /// The name of the function.
  @_s.JsonKey(name: 'FunctionName')
  final String functionName;

  /// The owner of the function.
  @_s.JsonKey(name: 'OwnerName')
  final String ownerName;

  /// The owner type.
  @_s.JsonKey(name: 'OwnerType')
  final PrincipalType ownerType;

  /// The resource URIs for the function.
  @_s.JsonKey(name: 'ResourceUris')
  final List<ResourceUri> resourceUris;

  UserDefinedFunction({
    this.className,
    this.createTime,
    this.functionName,
    this.ownerName,
    this.ownerType,
    this.resourceUris,
  });
  factory UserDefinedFunction.fromJson(Map<String, dynamic> json) =>
      _$UserDefinedFunctionFromJson(json);
}

/// A structure used to create or update a user-defined function.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UserDefinedFunctionInput {
  /// The Java class that contains the function code.
  @_s.JsonKey(name: 'ClassName')
  final String className;

  /// The name of the function.
  @_s.JsonKey(name: 'FunctionName')
  final String functionName;

  /// The owner of the function.
  @_s.JsonKey(name: 'OwnerName')
  final String ownerName;

  /// The owner type.
  @_s.JsonKey(name: 'OwnerType')
  final PrincipalType ownerType;

  /// The resource URIs for the function.
  @_s.JsonKey(name: 'ResourceUris')
  final List<ResourceUri> resourceUris;

  UserDefinedFunctionInput({
    this.className,
    this.functionName,
    this.ownerName,
    this.ownerType,
    this.resourceUris,
  });
  Map<String, dynamic> toJson() => _$UserDefinedFunctionInputToJson(this);
}

enum WorkerType {
  @_s.JsonValue('Standard')
  standard,
  @_s.JsonValue('G.1X')
  g_1x,
  @_s.JsonValue('G.2X')
  g_2x,
}

/// A workflow represents a flow in which AWS Glue components should be executed
/// to complete a logical task.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Workflow {
  /// The date and time when the workflow was created.
  @_s.JsonKey(
      name: 'CreatedOn',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime createdOn;

  /// A collection of properties to be used as part of each execution of the
  /// workflow.
  @_s.JsonKey(name: 'DefaultRunProperties')
  final Map<String, String> defaultRunProperties;

  /// A description of the workflow.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The graph representing all the AWS Glue components that belong to the
  /// workflow as nodes and directed connections between them as edges.
  @_s.JsonKey(name: 'Graph')
  final WorkflowGraph graph;

  /// The date and time when the workflow was last modified.
  @_s.JsonKey(
      name: 'LastModifiedOn',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastModifiedOn;

  /// The information about the last execution of the workflow.
  @_s.JsonKey(name: 'LastRun')
  final WorkflowRun lastRun;

  /// The name of the workflow representing the flow.
  @_s.JsonKey(name: 'Name')
  final String name;

  Workflow({
    this.createdOn,
    this.defaultRunProperties,
    this.description,
    this.graph,
    this.lastModifiedOn,
    this.lastRun,
    this.name,
  });
  factory Workflow.fromJson(Map<String, dynamic> json) =>
      _$WorkflowFromJson(json);
}

/// A workflow graph represents the complete workflow containing all the AWS
/// Glue components present in the workflow and all the directed connections
/// between them.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class WorkflowGraph {
  /// A list of all the directed connections between the nodes belonging to the
  /// workflow.
  @_s.JsonKey(name: 'Edges')
  final List<Edge> edges;

  /// A list of the the AWS Glue components belong to the workflow represented as
  /// nodes.
  @_s.JsonKey(name: 'Nodes')
  final List<Node> nodes;

  WorkflowGraph({
    this.edges,
    this.nodes,
  });
  factory WorkflowGraph.fromJson(Map<String, dynamic> json) =>
      _$WorkflowGraphFromJson(json);
}

/// A workflow run is an execution of a workflow providing all the runtime
/// information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class WorkflowRun {
  /// The date and time when the workflow run completed.
  @_s.JsonKey(
      name: 'CompletedOn',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime completedOn;

  /// The graph representing all the AWS Glue components that belong to the
  /// workflow as nodes and directed connections between them as edges.
  @_s.JsonKey(name: 'Graph')
  final WorkflowGraph graph;

  /// Name of the workflow which was executed.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The date and time when the workflow run was started.
  @_s.JsonKey(
      name: 'StartedOn',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime startedOn;

  /// The statistics of the run.
  @_s.JsonKey(name: 'Statistics')
  final WorkflowRunStatistics statistics;

  /// The status of the workflow run.
  @_s.JsonKey(name: 'Status')
  final WorkflowRunStatus status;

  /// The ID of this workflow run.
  @_s.JsonKey(name: 'WorkflowRunId')
  final String workflowRunId;

  /// The workflow run properties which were set during the run.
  @_s.JsonKey(name: 'WorkflowRunProperties')
  final Map<String, String> workflowRunProperties;

  WorkflowRun({
    this.completedOn,
    this.graph,
    this.name,
    this.startedOn,
    this.statistics,
    this.status,
    this.workflowRunId,
    this.workflowRunProperties,
  });
  factory WorkflowRun.fromJson(Map<String, dynamic> json) =>
      _$WorkflowRunFromJson(json);
}

/// Workflow run statistics provides statistics about the workflow run.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class WorkflowRunStatistics {
  /// Total number of Actions which have failed.
  @_s.JsonKey(name: 'FailedActions')
  final int failedActions;

  /// Total number Actions in running state.
  @_s.JsonKey(name: 'RunningActions')
  final int runningActions;

  /// Total number of Actions which have stopped.
  @_s.JsonKey(name: 'StoppedActions')
  final int stoppedActions;

  /// Total number of Actions which have succeeded.
  @_s.JsonKey(name: 'SucceededActions')
  final int succeededActions;

  /// Total number of Actions which timed out.
  @_s.JsonKey(name: 'TimeoutActions')
  final int timeoutActions;

  /// Total number of Actions in the workflow run.
  @_s.JsonKey(name: 'TotalActions')
  final int totalActions;

  WorkflowRunStatistics({
    this.failedActions,
    this.runningActions,
    this.stoppedActions,
    this.succeededActions,
    this.timeoutActions,
    this.totalActions,
  });
  factory WorkflowRunStatistics.fromJson(Map<String, dynamic> json) =>
      _$WorkflowRunStatisticsFromJson(json);
}

enum WorkflowRunStatus {
  @_s.JsonValue('RUNNING')
  running,
  @_s.JsonValue('COMPLETED')
  completed,
}

/// A classifier for <code>XML</code> content.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class XMLClassifier {
  /// An identifier of the data format that the classifier matches.
  @_s.JsonKey(name: 'Classification')
  final String classification;

  /// The name of the classifier.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The time that this classifier was registered.
  @_s.JsonKey(
      name: 'CreationTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime creationTime;

  /// The time that this classifier was last updated.
  @_s.JsonKey(
      name: 'LastUpdated',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastUpdated;

  /// The XML tag designating the element that contains each record in an XML
  /// document being parsed. This can't identify a self-closing element (closed by
  /// <code>/&gt;</code>). An empty row element that contains only attributes can
  /// be parsed as long as it ends with a closing tag (for example, <code>&lt;row
  /// item_a="A" item_b="B"&gt;&lt;/row&gt;</code> is okay, but <code>&lt;row
  /// item_a="A" item_b="B" /&gt;</code> is not).
  @_s.JsonKey(name: 'RowTag')
  final String rowTag;

  /// The version of this classifier.
  @_s.JsonKey(name: 'Version')
  final int version;

  XMLClassifier({
    @_s.required this.classification,
    @_s.required this.name,
    this.creationTime,
    this.lastUpdated,
    this.rowTag,
    this.version,
  });
  factory XMLClassifier.fromJson(Map<String, dynamic> json) =>
      _$XMLClassifierFromJson(json);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class AlreadyExistsException extends _s.GenericAwsException {
  AlreadyExistsException({String type, String message})
      : super(type: type, code: 'AlreadyExistsException', message: message);
}

class ConcurrentModificationException extends _s.GenericAwsException {
  ConcurrentModificationException({String type, String message})
      : super(
            type: type,
            code: 'ConcurrentModificationException',
            message: message);
}

class ConcurrentRunsExceededException extends _s.GenericAwsException {
  ConcurrentRunsExceededException({String type, String message})
      : super(
            type: type,
            code: 'ConcurrentRunsExceededException',
            message: message);
}

class ConditionCheckFailureException extends _s.GenericAwsException {
  ConditionCheckFailureException({String type, String message})
      : super(
            type: type,
            code: 'ConditionCheckFailureException',
            message: message);
}

class CrawlerNotRunningException extends _s.GenericAwsException {
  CrawlerNotRunningException({String type, String message})
      : super(type: type, code: 'CrawlerNotRunningException', message: message);
}

class CrawlerRunningException extends _s.GenericAwsException {
  CrawlerRunningException({String type, String message})
      : super(type: type, code: 'CrawlerRunningException', message: message);
}

class CrawlerStoppingException extends _s.GenericAwsException {
  CrawlerStoppingException({String type, String message})
      : super(type: type, code: 'CrawlerStoppingException', message: message);
}

class EntityNotFoundException extends _s.GenericAwsException {
  EntityNotFoundException({String type, String message})
      : super(type: type, code: 'EntityNotFoundException', message: message);
}

class GlueEncryptionException extends _s.GenericAwsException {
  GlueEncryptionException({String type, String message})
      : super(type: type, code: 'GlueEncryptionException', message: message);
}

class IdempotentParameterMismatchException extends _s.GenericAwsException {
  IdempotentParameterMismatchException({String type, String message})
      : super(
            type: type,
            code: 'IdempotentParameterMismatchException',
            message: message);
}

class InternalServiceException extends _s.GenericAwsException {
  InternalServiceException({String type, String message})
      : super(type: type, code: 'InternalServiceException', message: message);
}

class InvalidInputException extends _s.GenericAwsException {
  InvalidInputException({String type, String message})
      : super(type: type, code: 'InvalidInputException', message: message);
}

class MLTransformNotReadyException extends _s.GenericAwsException {
  MLTransformNotReadyException({String type, String message})
      : super(
            type: type, code: 'MLTransformNotReadyException', message: message);
}

class NoScheduleException extends _s.GenericAwsException {
  NoScheduleException({String type, String message})
      : super(type: type, code: 'NoScheduleException', message: message);
}

class OperationTimeoutException extends _s.GenericAwsException {
  OperationTimeoutException({String type, String message})
      : super(type: type, code: 'OperationTimeoutException', message: message);
}

class ResourceNumberLimitExceededException extends _s.GenericAwsException {
  ResourceNumberLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'ResourceNumberLimitExceededException',
            message: message);
}

class SchedulerNotRunningException extends _s.GenericAwsException {
  SchedulerNotRunningException({String type, String message})
      : super(
            type: type, code: 'SchedulerNotRunningException', message: message);
}

class SchedulerRunningException extends _s.GenericAwsException {
  SchedulerRunningException({String type, String message})
      : super(type: type, code: 'SchedulerRunningException', message: message);
}

class SchedulerTransitioningException extends _s.GenericAwsException {
  SchedulerTransitioningException({String type, String message})
      : super(
            type: type,
            code: 'SchedulerTransitioningException',
            message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String type, String message})
      : super(type: type, code: 'ValidationException', message: message);
}

class VersionMismatchException extends _s.GenericAwsException {
  VersionMismatchException({String type, String message})
      : super(type: type, code: 'VersionMismatchException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'AlreadyExistsException': (type, message) =>
      AlreadyExistsException(type: type, message: message),
  'ConcurrentModificationException': (type, message) =>
      ConcurrentModificationException(type: type, message: message),
  'ConcurrentRunsExceededException': (type, message) =>
      ConcurrentRunsExceededException(type: type, message: message),
  'ConditionCheckFailureException': (type, message) =>
      ConditionCheckFailureException(type: type, message: message),
  'CrawlerNotRunningException': (type, message) =>
      CrawlerNotRunningException(type: type, message: message),
  'CrawlerRunningException': (type, message) =>
      CrawlerRunningException(type: type, message: message),
  'CrawlerStoppingException': (type, message) =>
      CrawlerStoppingException(type: type, message: message),
  'EntityNotFoundException': (type, message) =>
      EntityNotFoundException(type: type, message: message),
  'GlueEncryptionException': (type, message) =>
      GlueEncryptionException(type: type, message: message),
  'IdempotentParameterMismatchException': (type, message) =>
      IdempotentParameterMismatchException(type: type, message: message),
  'InternalServiceException': (type, message) =>
      InternalServiceException(type: type, message: message),
  'InvalidInputException': (type, message) =>
      InvalidInputException(type: type, message: message),
  'MLTransformNotReadyException': (type, message) =>
      MLTransformNotReadyException(type: type, message: message),
  'NoScheduleException': (type, message) =>
      NoScheduleException(type: type, message: message),
  'OperationTimeoutException': (type, message) =>
      OperationTimeoutException(type: type, message: message),
  'ResourceNumberLimitExceededException': (type, message) =>
      ResourceNumberLimitExceededException(type: type, message: message),
  'SchedulerNotRunningException': (type, message) =>
      SchedulerNotRunningException(type: type, message: message),
  'SchedulerRunningException': (type, message) =>
      SchedulerRunningException(type: type, message: message),
  'SchedulerTransitioningException': (type, message) =>
      SchedulerTransitioningException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
  'VersionMismatchException': (type, message) =>
      VersionMismatchException(type: type, message: message),
};
