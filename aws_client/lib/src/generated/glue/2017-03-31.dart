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

/// Defines the public endpoint for the Glue service.
class Glue {
  final _s.JsonProtocol _protocol;
  Glue({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'glue',
          ),
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
  /// this should be the Amazon Web Services account ID.
  Future<BatchCreatePartitionResponse> batchCreatePartition({
    required String databaseName,
    required List<PartitionInput> partitionInputList,
    required String tableName,
    String? catalogId,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
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
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
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
      payload: {
        'DatabaseName': databaseName,
        'PartitionInputList': partitionInputList,
        'TableName': tableName,
        if (catalogId != null) 'CatalogId': catalogId,
      },
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
  /// provided, the Amazon Web Services account ID is used by default.
  Future<BatchDeleteConnectionResponse> batchDeleteConnection({
    required List<String> connectionNameList,
    String? catalogId,
  }) async {
    ArgumentError.checkNotNull(connectionNameList, 'connectionNameList');
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
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
      payload: {
        'ConnectionNameList': connectionNameList,
        if (catalogId != null) 'CatalogId': catalogId,
      },
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
  /// none is provided, the Amazon Web Services account ID is used by default.
  Future<BatchDeletePartitionResponse> batchDeletePartition({
    required String databaseName,
    required List<PartitionValueList> partitionsToDelete,
    required String tableName,
    String? catalogId,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
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
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
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
      payload: {
        'DatabaseName': databaseName,
        'PartitionsToDelete': partitionsToDelete,
        'TableName': tableName,
        if (catalogId != null) 'CatalogId': catalogId,
      },
    );

    return BatchDeletePartitionResponse.fromJson(jsonResponse.body);
  }

  /// Deletes multiple tables at once.
  /// <note>
  /// After completing this operation, you no longer have access to the table
  /// versions and partitions that belong to the deleted table. Glue deletes
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
  /// the Amazon Web Services account ID is used by default.
  Future<BatchDeleteTableResponse> batchDeleteTable({
    required String databaseName,
    required List<String> tablesToDelete,
    String? catalogId,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tablesToDelete, 'tablesToDelete');
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
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
      payload: {
        'DatabaseName': databaseName,
        'TablesToDelete': tablesToDelete,
        if (catalogId != null) 'CatalogId': catalogId,
      },
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
  /// the Amazon Web Services account ID is used by default.
  Future<BatchDeleteTableVersionResponse> batchDeleteTableVersion({
    required String databaseName,
    required String tableName,
    required List<String> versionIds,
    String? catalogId,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
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
    ArgumentError.checkNotNull(versionIds, 'versionIds');
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
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
      payload: {
        'DatabaseName': databaseName,
        'TableName': tableName,
        'VersionIds': versionIds,
        if (catalogId != null) 'CatalogId': catalogId,
      },
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
    required List<String> crawlerNames,
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
      payload: {
        'CrawlerNames': crawlerNames,
      },
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
    required List<String> devEndpointNames,
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
      payload: {
        'DevEndpointNames': devEndpointNames,
      },
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
    required List<String> jobNames,
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
      payload: {
        'JobNames': jobNames,
      },
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
  /// none is supplied, the Amazon Web Services account ID is used by default.
  Future<BatchGetPartitionResponse> batchGetPartition({
    required String databaseName,
    required List<PartitionValueList> partitionsToGet,
    required String tableName,
    String? catalogId,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
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
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
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
      payload: {
        'DatabaseName': databaseName,
        'PartitionsToGet': partitionsToGet,
        'TableName': tableName,
        if (catalogId != null) 'CatalogId': catalogId,
      },
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
    required List<String> triggerNames,
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
      payload: {
        'TriggerNames': triggerNames,
      },
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
    required List<String> names,
    bool? includeGraph,
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
      payload: {
        'Names': names,
        if (includeGraph != null) 'IncludeGraph': includeGraph,
      },
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
    required String jobName,
    required List<String> jobRunIds,
  }) async {
    ArgumentError.checkNotNull(jobName, 'jobName');
    _s.validateStringLength(
      'jobName',
      jobName,
      1,
      255,
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
      payload: {
        'JobName': jobName,
        'JobRunIds': jobRunIds,
      },
    );

    return BatchStopJobRunResponse.fromJson(jsonResponse.body);
  }

  /// Updates one or more partitions in a batch operation.
  ///
  /// May throw [InvalidInputException].
  /// May throw [EntityNotFoundException].
  /// May throw [OperationTimeoutException].
  /// May throw [InternalServiceException].
  /// May throw [GlueEncryptionException].
  ///
  /// Parameter [databaseName] :
  /// The name of the metadata database in which the partition is to be updated.
  ///
  /// Parameter [entries] :
  /// A list of up to 100 <code>BatchUpdatePartitionRequestEntry</code> objects
  /// to update.
  ///
  /// Parameter [tableName] :
  /// The name of the metadata table in which the partition is to be updated.
  ///
  /// Parameter [catalogId] :
  /// The ID of the catalog in which the partition is to be updated. Currently,
  /// this should be the Amazon Web Services account ID.
  Future<BatchUpdatePartitionResponse> batchUpdatePartition({
    required String databaseName,
    required List<BatchUpdatePartitionRequestEntry> entries,
    required String tableName,
    String? catalogId,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(entries, 'entries');
    ArgumentError.checkNotNull(tableName, 'tableName');
    _s.validateStringLength(
      'tableName',
      tableName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.BatchUpdatePartition'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatabaseName': databaseName,
        'Entries': entries,
        'TableName': tableName,
        if (catalogId != null) 'CatalogId': catalogId,
      },
    );

    return BatchUpdatePartitionResponse.fromJson(jsonResponse.body);
  }

  /// Cancels (stops) a task run. Machine learning task runs are asynchronous
  /// tasks that Glue runs on your behalf as part of various machine learning
  /// workflows. You can cancel a machine learning task run at any time by
  /// calling <code>CancelMLTaskRun</code> with a task run's parent transform's
  /// <code>TransformID</code> and the task run's <code>TaskRunId</code>.
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
    required String taskRunId,
    required String transformId,
  }) async {
    ArgumentError.checkNotNull(taskRunId, 'taskRunId');
    _s.validateStringLength(
      'taskRunId',
      taskRunId,
      1,
      255,
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
      payload: {
        'TaskRunId': taskRunId,
        'TransformId': transformId,
      },
    );

    return CancelMLTaskRunResponse.fromJson(jsonResponse.body);
  }

  /// Validates the supplied schema. This call has no side effects, it simply
  /// validates using the supplied schema using <code>DataFormat</code> as the
  /// format. Since it does not take a schema set name, no compatibility checks
  /// are performed.
  ///
  /// May throw [InvalidInputException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [dataFormat] :
  /// The data format of the schema definition. Currently <code>AVRO</code> and
  /// <code>JSON</code> are supported.
  ///
  /// Parameter [schemaDefinition] :
  /// The definition of the schema that has to be validated.
  Future<CheckSchemaVersionValidityResponse> checkSchemaVersionValidity({
    required DataFormat dataFormat,
    required String schemaDefinition,
  }) async {
    ArgumentError.checkNotNull(dataFormat, 'dataFormat');
    ArgumentError.checkNotNull(schemaDefinition, 'schemaDefinition');
    _s.validateStringLength(
      'schemaDefinition',
      schemaDefinition,
      1,
      170000,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.CheckSchemaVersionValidity'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DataFormat': dataFormat.toValue(),
        'SchemaDefinition': schemaDefinition,
      },
    );

    return CheckSchemaVersionValidityResponse.fromJson(jsonResponse.body);
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
    CreateCsvClassifierRequest? csvClassifier,
    CreateGrokClassifierRequest? grokClassifier,
    CreateJsonClassifierRequest? jsonClassifier,
    CreateXMLClassifierRequest? xMLClassifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.CreateClassifier'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (csvClassifier != null) 'CsvClassifier': csvClassifier,
        if (grokClassifier != null) 'GrokClassifier': grokClassifier,
        if (jsonClassifier != null) 'JsonClassifier': jsonClassifier,
        if (xMLClassifier != null) 'XMLClassifier': xMLClassifier,
      },
    );
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
  /// provided, the Amazon Web Services account ID is used by default.
  Future<void> createConnection({
    required ConnectionInput connectionInput,
    String? catalogId,
  }) async {
    ArgumentError.checkNotNull(connectionInput, 'connectionInput');
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.CreateConnection'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConnectionInput': connectionInput,
        if (catalogId != null) 'CatalogId': catalogId,
      },
    );
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
  /// Crawler configuration information. This versioned JSON string allows users
  /// to specify aspects of a crawler's behavior. For more information, see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/crawler-configuration.html">Configuring
  /// a Crawler</a>.
  ///
  /// Parameter [crawlerSecurityConfiguration] :
  /// The name of the <code>SecurityConfiguration</code> structure to be used by
  /// this crawler.
  ///
  /// Parameter [databaseName] :
  /// The Glue database where results are written, such as:
  /// <code>arn:aws:daylight:us-east-1::database/sometable/*</code>.
  ///
  /// Parameter [description] :
  /// A description of the new crawler.
  ///
  /// Parameter [lineageConfiguration] :
  /// Specifies data lineage configuration settings for the crawler.
  ///
  /// Parameter [recrawlPolicy] :
  /// A policy that specifies whether to crawl the entire dataset again, or to
  /// crawl only folders that were added since the last crawler run.
  ///
  /// Parameter [schedule] :
  /// A <code>cron</code> expression used to specify the schedule (see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/monitor-data-warehouse-schedule.html">Time-Based
  /// Schedules for Jobs and Crawlers</a>. For example, to run something every
  /// day at 12:15 UTC, you would specify: <code>cron(15 12 * * ? *)</code>.
  ///
  /// Parameter [schemaChangePolicy] :
  /// The policy for the crawler's update and deletion behavior.
  ///
  /// Parameter [tablePrefix] :
  /// The table prefix used for catalog tables that are created.
  ///
  /// Parameter [tags] :
  /// The tags to use with this crawler request. You may use tags to limit
  /// access to the crawler. For more information about tags in Glue, see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/monitor-tags.html">Amazon
  /// Web Services Tags in Glue</a> in the developer guide.
  Future<void> createCrawler({
    required String name,
    required String role,
    required CrawlerTargets targets,
    List<String>? classifiers,
    String? configuration,
    String? crawlerSecurityConfiguration,
    String? databaseName,
    String? description,
    LineageConfiguration? lineageConfiguration,
    RecrawlPolicy? recrawlPolicy,
    String? schedule,
    SchemaChangePolicy? schemaChangePolicy,
    String? tablePrefix,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
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
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'Role': role,
        'Targets': targets,
        if (classifiers != null) 'Classifiers': classifiers,
        if (configuration != null) 'Configuration': configuration,
        if (crawlerSecurityConfiguration != null)
          'CrawlerSecurityConfiguration': crawlerSecurityConfiguration,
        if (databaseName != null) 'DatabaseName': databaseName,
        if (description != null) 'Description': description,
        if (lineageConfiguration != null)
          'LineageConfiguration': lineageConfiguration,
        if (recrawlPolicy != null) 'RecrawlPolicy': recrawlPolicy,
        if (schedule != null) 'Schedule': schedule,
        if (schemaChangePolicy != null)
          'SchemaChangePolicy': schemaChangePolicy,
        if (tablePrefix != null) 'TablePrefix': tablePrefix,
        if (tags != null) 'Tags': tags,
      },
    );
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
  /// provided, the Amazon Web Services account ID is used by default.
  Future<void> createDatabase({
    required DatabaseInput databaseInput,
    String? catalogId,
  }) async {
    ArgumentError.checkNotNull(databaseInput, 'databaseInput');
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.CreateDatabase'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatabaseInput': databaseInput,
        if (catalogId != null) 'CatalogId': catalogId,
      },
    );
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
  /// Glue version determines the versions of Apache Spark and Python that Glue
  /// supports. The Python version indicates the version supported for running
  /// your ETL scripts on development endpoints.
  ///
  /// For more information about the available Glue versions and corresponding
  /// Spark and Python versions, see <a
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
  /// The number of Glue Data Processing Units (DPUs) to allocate to this
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
  /// the DevEndpoint. For more information about tags in Glue, see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/monitor-tags.html">Amazon
  /// Web Services Tags in Glue</a> in the developer guide.
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
    required String endpointName,
    required String roleArn,
    Map<String, String>? arguments,
    String? extraJarsS3Path,
    String? extraPythonLibsS3Path,
    String? glueVersion,
    int? numberOfNodes,
    int? numberOfWorkers,
    String? publicKey,
    List<String>? publicKeys,
    String? securityConfiguration,
    List<String>? securityGroupIds,
    String? subnetId,
    Map<String, String>? tags,
    WorkerType? workerType,
  }) async {
    ArgumentError.checkNotNull(endpointName, 'endpointName');
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringLength(
      'glueVersion',
      glueVersion,
      1,
      255,
    );
    _s.validateStringLength(
      'securityConfiguration',
      securityConfiguration,
      1,
      255,
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
      payload: {
        'EndpointName': endpointName,
        'RoleArn': roleArn,
        if (arguments != null) 'Arguments': arguments,
        if (extraJarsS3Path != null) 'ExtraJarsS3Path': extraJarsS3Path,
        if (extraPythonLibsS3Path != null)
          'ExtraPythonLibsS3Path': extraPythonLibsS3Path,
        if (glueVersion != null) 'GlueVersion': glueVersion,
        if (numberOfNodes != null) 'NumberOfNodes': numberOfNodes,
        if (numberOfWorkers != null) 'NumberOfWorkers': numberOfWorkers,
        if (publicKey != null) 'PublicKey': publicKey,
        if (publicKeys != null) 'PublicKeys': publicKeys,
        if (securityConfiguration != null)
          'SecurityConfiguration': securityConfiguration,
        if (securityGroupIds != null) 'SecurityGroupIds': securityGroupIds,
        if (subnetId != null) 'SubnetId': subnetId,
        if (tags != null) 'Tags': tags,
        if (workerType != null) 'WorkerType': workerType.toValue(),
      },
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
  /// The <code>JobCommand</code> that runs this job.
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
  /// The number of Glue data processing units (DPUs) to allocate to this Job.
  /// You can allocate from 2 to 100 DPUs; the default is 10. A DPU is a
  /// relative measure of processing power that consists of 4 vCPUs of compute
  /// capacity and 16 GB of memory. For more information, see the <a
  /// href="https://aws.amazon.com/glue/pricing/">Glue pricing page</a>.
  ///
  /// Parameter [connections] :
  /// The connections used for this job.
  ///
  /// Parameter [defaultArguments] :
  /// The default arguments for this job.
  ///
  /// You can specify arguments here that your own job-execution script
  /// consumes, as well as arguments that Glue itself consumes.
  ///
  /// For information about how to specify and consume your own Job arguments,
  /// see the <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-python-calling.html">Calling
  /// Glue APIs in Python</a> topic in the developer guide.
  ///
  /// For information about the key-value pairs that Glue consumes to set up
  /// your job, see the <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-etl-glue-arguments.html">Special
  /// Parameters Used by Glue</a> topic in the developer guide.
  ///
  /// Parameter [description] :
  /// Description of the job being defined.
  ///
  /// Parameter [executionProperty] :
  /// An <code>ExecutionProperty</code> specifying the maximum number of
  /// concurrent runs allowed for this job.
  ///
  /// Parameter [glueVersion] :
  /// Glue version determines the versions of Apache Spark and Python that Glue
  /// supports. The Python version indicates the version supported for jobs of
  /// type Spark.
  ///
  /// For more information about the available Glue versions and corresponding
  /// Spark and Python versions, see <a
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
  /// For Glue version 1.0 or earlier jobs, using the standard worker type, the
  /// number of Glue data processing units (DPUs) that can be allocated when
  /// this job runs. A DPU is a relative measure of processing power that
  /// consists of 4 vCPUs of compute capacity and 16 GB of memory. For more
  /// information, see the <a href="https://aws.amazon.com/glue/pricing/">Glue
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
  /// (<code>JobCommand.Name</code>="pythonshell"), you can allocate either
  /// 0.0625 or 1 DPU. The default is 0.0625 DPU.
  /// </li>
  /// <li>
  /// When you specify an Apache Spark ETL job
  /// (<code>JobCommand.Name</code>="glueetl") or Apache Spark streaming ETL job
  /// (<code>JobCommand.Name</code>="gluestreaming"), you can allocate from 2 to
  /// 100 DPUs. The default is 10 DPUs. This job type cannot have a fractional
  /// DPU allocation.
  /// </li>
  /// </ul>
  /// For Glue version 2.0 jobs, you cannot instead specify a <code>Maximum
  /// capacity</code>. Instead, you should specify a <code>Worker type</code>
  /// and the <code>Number of workers</code>.
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
  /// job. For more information about tags in Glue, see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/monitor-tags.html">Amazon
  /// Web Services Tags in Glue</a> in the developer guide.
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
    required JobCommand command,
    required String name,
    required String role,
    int? allocatedCapacity,
    ConnectionsList? connections,
    Map<String, String>? defaultArguments,
    String? description,
    ExecutionProperty? executionProperty,
    String? glueVersion,
    String? logUri,
    double? maxCapacity,
    int? maxRetries,
    Map<String, String>? nonOverridableArguments,
    NotificationProperty? notificationProperty,
    int? numberOfWorkers,
    String? securityConfiguration,
    Map<String, String>? tags,
    int? timeout,
    WorkerType? workerType,
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
    ArgumentError.checkNotNull(role, 'role');
    _s.validateStringLength(
      'description',
      description,
      0,
      2048,
    );
    _s.validateStringLength(
      'glueVersion',
      glueVersion,
      1,
      255,
    );
    _s.validateStringLength(
      'securityConfiguration',
      securityConfiguration,
      1,
      255,
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
      payload: {
        'Command': command,
        'Name': name,
        'Role': role,
        if (allocatedCapacity != null) 'AllocatedCapacity': allocatedCapacity,
        if (connections != null) 'Connections': connections,
        if (defaultArguments != null) 'DefaultArguments': defaultArguments,
        if (description != null) 'Description': description,
        if (executionProperty != null) 'ExecutionProperty': executionProperty,
        if (glueVersion != null) 'GlueVersion': glueVersion,
        if (logUri != null) 'LogUri': logUri,
        if (maxCapacity != null) 'MaxCapacity': maxCapacity,
        if (maxRetries != null) 'MaxRetries': maxRetries,
        if (nonOverridableArguments != null)
          'NonOverridableArguments': nonOverridableArguments,
        if (notificationProperty != null)
          'NotificationProperty': notificationProperty,
        if (numberOfWorkers != null) 'NumberOfWorkers': numberOfWorkers,
        if (securityConfiguration != null)
          'SecurityConfiguration': securityConfiguration,
        if (tags != null) 'Tags': tags,
        if (timeout != null) 'Timeout': timeout,
        if (workerType != null) 'WorkerType': workerType.toValue(),
      },
    );

    return CreateJobResponse.fromJson(jsonResponse.body);
  }

  /// Creates an Glue machine learning transform. This operation creates the
  /// transform and all the necessary parameters to train it.
  ///
  /// Call this operation as the first step in the process of using a machine
  /// learning transform (such as the <code>FindMatches</code> transform) for
  /// deduplicating data. You can provide an optional <code>Description</code>,
  /// in addition to the parameters that you want to use for your algorithm.
  ///
  /// You must also specify certain parameters for the tasks that Glue runs on
  /// your behalf as part of learning from your data and creating a high-quality
  /// machine learning transform. These parameters include <code>Role</code>,
  /// and optionally, <code>AllocatedCapacity</code>, <code>Timeout</code>, and
  /// <code>MaxRetries</code>. For more information, see <a
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
  /// A list of Glue table definitions used by the transform.
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
  /// permissions. The required permissions include both Glue service role
  /// permissions to Glue resources, and Amazon S3 permissions required by the
  /// transform.
  ///
  /// <ul>
  /// <li>
  /// This role needs Glue service role permissions to allow access to resources
  /// in Glue. See <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/attach-policy-iam-user.html">Attach
  /// a Policy to IAM Users That Access Glue</a>.
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
  /// This value determines which version of Glue this machine learning
  /// transform is compatible with. Glue 1.0 is recommended for most customers.
  /// If the value is not set, the Glue compatibility defaults to Glue 0.9. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/release-notes.html#release-notes-versions">Glue
  /// Versions</a> in the developer guide.
  ///
  /// Parameter [maxCapacity] :
  /// The number of Glue data processing units (DPUs) that are allocated to task
  /// runs for this transform. You can allocate from 2 to 100 DPUs; the default
  /// is 10. A DPU is a relative measure of processing power that consists of 4
  /// vCPUs of compute capacity and 16 GB of memory. For more information, see
  /// the <a href="https://aws.amazon.com/glue/pricing/">Glue pricing page</a>.
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
  /// tags in Glue, see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/monitor-tags.html">Amazon
  /// Web Services Tags in Glue</a> in the developer guide.
  ///
  /// Parameter [timeout] :
  /// The timeout of the task run for this transform in minutes. This is the
  /// maximum time that a task run for this transform can consume resources
  /// before it is terminated and enters <code>TIMEOUT</code> status. The
  /// default is 2,880 minutes (48 hours).
  ///
  /// Parameter [transformEncryption] :
  /// The encryption-at-rest settings of the transform that apply to accessing
  /// user data. Machine learning transforms can access user data encrypted in
  /// Amazon S3 using KMS.
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
    required List<GlueTable> inputRecordTables,
    required String name,
    required TransformParameters parameters,
    required String role,
    String? description,
    String? glueVersion,
    double? maxCapacity,
    int? maxRetries,
    int? numberOfWorkers,
    Map<String, String>? tags,
    int? timeout,
    TransformEncryption? transformEncryption,
    WorkerType? workerType,
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
    ArgumentError.checkNotNull(parameters, 'parameters');
    ArgumentError.checkNotNull(role, 'role');
    _s.validateStringLength(
      'description',
      description,
      0,
      2048,
    );
    _s.validateStringLength(
      'glueVersion',
      glueVersion,
      1,
      255,
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
      payload: {
        'InputRecordTables': inputRecordTables,
        'Name': name,
        'Parameters': parameters,
        'Role': role,
        if (description != null) 'Description': description,
        if (glueVersion != null) 'GlueVersion': glueVersion,
        if (maxCapacity != null) 'MaxCapacity': maxCapacity,
        if (maxRetries != null) 'MaxRetries': maxRetries,
        if (numberOfWorkers != null) 'NumberOfWorkers': numberOfWorkers,
        if (tags != null) 'Tags': tags,
        if (timeout != null) 'Timeout': timeout,
        if (transformEncryption != null)
          'TransformEncryption': transformEncryption,
        if (workerType != null) 'WorkerType': workerType.toValue(),
      },
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
  /// The Amazon Web Services account ID of the catalog in which the partition
  /// is to be created.
  Future<void> createPartition({
    required String databaseName,
    required PartitionInput partitionInput,
    required String tableName,
    String? catalogId,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
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
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.CreatePartition'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatabaseName': databaseName,
        'PartitionInput': partitionInput,
        'TableName': tableName,
        if (catalogId != null) 'CatalogId': catalogId,
      },
    );
  }

  /// Creates a specified partition index in an existing table.
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
  /// Specifies the name of a database in which you want to create a partition
  /// index.
  ///
  /// Parameter [partitionIndex] :
  /// Specifies a <code>PartitionIndex</code> structure to create a partition
  /// index in an existing table.
  ///
  /// Parameter [tableName] :
  /// Specifies the name of a table in which you want to create a partition
  /// index.
  ///
  /// Parameter [catalogId] :
  /// The catalog ID where the table resides.
  Future<void> createPartitionIndex({
    required String databaseName,
    required PartitionIndex partitionIndex,
    required String tableName,
    String? catalogId,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(partitionIndex, 'partitionIndex');
    ArgumentError.checkNotNull(tableName, 'tableName');
    _s.validateStringLength(
      'tableName',
      tableName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.CreatePartitionIndex'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatabaseName': databaseName,
        'PartitionIndex': partitionIndex,
        'TableName': tableName,
        if (catalogId != null) 'CatalogId': catalogId,
      },
    );
  }

  /// Creates a new registry which may be used to hold a collection of schemas.
  ///
  /// May throw [InvalidInputException].
  /// May throw [AccessDeniedException].
  /// May throw [AlreadyExistsException].
  /// May throw [ResourceNumberLimitExceededException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [registryName] :
  /// Name of the registry to be created of max length of 255, and may only
  /// contain letters, numbers, hyphen, underscore, dollar sign, or hash mark.
  /// No whitespace.
  ///
  /// Parameter [description] :
  /// A description of the registry. If description is not provided, there will
  /// not be any default value for this.
  ///
  /// Parameter [tags] :
  /// Amazon Web Services tags that contain a key value pair and may be searched
  /// by console, command line, or API.
  Future<CreateRegistryResponse> createRegistry({
    required String registryName,
    String? description,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(registryName, 'registryName');
    _s.validateStringLength(
      'registryName',
      registryName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      2048,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.CreateRegistry'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RegistryName': registryName,
        if (description != null) 'Description': description,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateRegistryResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new schema set and registers the schema definition. Returns an
  /// error if the schema set already exists without actually registering the
  /// version.
  ///
  /// When the schema set is created, a version checkpoint will be set to the
  /// first version. Compatibility mode "DISABLED" restricts any additional
  /// schema versions from being added after the first schema version. For all
  /// other compatibility modes, validation of compatibility settings will be
  /// applied only from the second version onwards when the
  /// <code>RegisterSchemaVersion</code> API is used.
  ///
  /// When this API is called without a <code>RegistryId</code>, this will
  /// create an entry for a "default-registry" in the registry database tables,
  /// if it is not already present.
  ///
  /// May throw [InvalidInputException].
  /// May throw [AccessDeniedException].
  /// May throw [EntityNotFoundException].
  /// May throw [AlreadyExistsException].
  /// May throw [ResourceNumberLimitExceededException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [dataFormat] :
  /// The data format of the schema definition. Currently <code>AVRO</code> and
  /// <code>JSON</code> are supported.
  ///
  /// Parameter [schemaName] :
  /// Name of the schema to be created of max length of 255, and may only
  /// contain letters, numbers, hyphen, underscore, dollar sign, or hash mark.
  /// No whitespace.
  ///
  /// Parameter [compatibility] :
  /// The compatibility mode of the schema. The possible values are:
  ///
  /// <ul>
  /// <li>
  /// <i>NONE</i>: No compatibility mode applies. You can use this choice in
  /// development scenarios or if you do not know the compatibility mode that
  /// you want to apply to schemas. Any new version added will be accepted
  /// without undergoing a compatibility check.
  /// </li>
  /// <li>
  /// <i>DISABLED</i>: This compatibility choice prevents versioning for a
  /// particular schema. You can use this choice to prevent future versioning of
  /// a schema.
  /// </li>
  /// <li>
  /// <i>BACKWARD</i>: This compatibility choice is recommended as it allows
  /// data receivers to read both the current and one previous schema version.
  /// This means that for instance, a new schema version cannot drop data fields
  /// or change the type of these fields, so they can't be read by readers using
  /// the previous version.
  /// </li>
  /// <li>
  /// <i>BACKWARD_ALL</i>: This compatibility choice allows data receivers to
  /// read both the current and all previous schema versions. You can use this
  /// choice when you need to delete fields or add optional fields, and check
  /// compatibility against all previous schema versions.
  /// </li>
  /// <li>
  /// <i>FORWARD</i>: This compatibility choice allows data receivers to read
  /// both the current and one next schema version, but not necessarily later
  /// versions. You can use this choice when you need to add fields or delete
  /// optional fields, but only check compatibility against the last schema
  /// version.
  /// </li>
  /// <li>
  /// <i>FORWARD_ALL</i>: This compatibility choice allows data receivers to
  /// read written by producers of any new registered schema. You can use this
  /// choice when you need to add fields or delete optional fields, and check
  /// compatibility against all previous schema versions.
  /// </li>
  /// <li>
  /// <i>FULL</i>: This compatibility choice allows data receivers to read data
  /// written by producers using the previous or next version of the schema, but
  /// not necessarily earlier or later versions. You can use this choice when
  /// you need to add or remove optional fields, but only check compatibility
  /// against the last schema version.
  /// </li>
  /// <li>
  /// <i>FULL_ALL</i>: This compatibility choice allows data receivers to read
  /// data written by producers using all previous schema versions. You can use
  /// this choice when you need to add or remove optional fields, and check
  /// compatibility against all previous schema versions.
  /// </li>
  /// </ul>
  ///
  /// Parameter [description] :
  /// An optional description of the schema. If description is not provided,
  /// there will not be any automatic default value for this.
  ///
  /// Parameter [registryId] :
  /// This is a wrapper shape to contain the registry identity fields. If this
  /// is not provided, the default registry will be used. The ARN format for the
  /// same will be: <code>arn:aws:glue:us-east-2:&lt;customer
  /// id&gt;:registry/default-registry:random-5-letter-id</code>.
  ///
  /// Parameter [schemaDefinition] :
  /// The schema definition using the <code>DataFormat</code> setting for
  /// <code>SchemaName</code>.
  ///
  /// Parameter [tags] :
  /// Amazon Web Services tags that contain a key value pair and may be searched
  /// by console, command line, or API. If specified, follows the Amazon Web
  /// Services tags-on-create pattern.
  Future<CreateSchemaResponse> createSchema({
    required DataFormat dataFormat,
    required String schemaName,
    Compatibility? compatibility,
    String? description,
    RegistryId? registryId,
    String? schemaDefinition,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(dataFormat, 'dataFormat');
    ArgumentError.checkNotNull(schemaName, 'schemaName');
    _s.validateStringLength(
      'schemaName',
      schemaName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      2048,
    );
    _s.validateStringLength(
      'schemaDefinition',
      schemaDefinition,
      1,
      170000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.CreateSchema'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DataFormat': dataFormat.toValue(),
        'SchemaName': schemaName,
        if (compatibility != null) 'Compatibility': compatibility.toValue(),
        if (description != null) 'Description': description,
        if (registryId != null) 'RegistryId': registryId,
        if (schemaDefinition != null) 'SchemaDefinition': schemaDefinition,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateSchemaResponse.fromJson(jsonResponse.body);
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
    List<CodeGenEdge>? dagEdges,
    List<CodeGenNode>? dagNodes,
    Language? language,
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
      payload: {
        if (dagEdges != null) 'DagEdges': dagEdges,
        if (dagNodes != null) 'DagNodes': dagNodes,
        if (language != null) 'Language': language.toValue(),
      },
    );

    return CreateScriptResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new security configuration. A security configuration is a set of
  /// security properties that can be used by Glue. You can use a security
  /// configuration to encrypt data at rest. For information about using
  /// security configurations in Glue, see <a
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
    required EncryptionConfiguration encryptionConfiguration,
    required String name,
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
      payload: {
        'EncryptionConfiguration': encryptionConfiguration,
        'Name': name,
      },
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
  /// none is supplied, the Amazon Web Services account ID is used by default.
  ///
  /// Parameter [partitionIndexes] :
  /// A list of partition indexes, <code>PartitionIndex</code> structures, to
  /// create in the table.
  Future<void> createTable({
    required String databaseName,
    required TableInput tableInput,
    String? catalogId,
    List<PartitionIndex>? partitionIndexes,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tableInput, 'tableInput');
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.CreateTable'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatabaseName': databaseName,
        'TableInput': tableInput,
        if (catalogId != null) 'CatalogId': catalogId,
        if (partitionIndexes != null) 'PartitionIndexes': partitionIndexes,
      },
    );
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
  /// trigger. For more information about tags in Glue, see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/monitor-tags.html">Amazon
  /// Web Services Tags in Glue</a> in the developer guide.
  ///
  /// Parameter [workflowName] :
  /// The name of the workflow associated with the trigger.
  Future<CreateTriggerResponse> createTrigger({
    required List<Action> actions,
    required String name,
    required TriggerType type,
    String? description,
    Predicate? predicate,
    String? schedule,
    bool? startOnCreation,
    Map<String, String>? tags,
    String? workflowName,
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
    ArgumentError.checkNotNull(type, 'type');
    _s.validateStringLength(
      'description',
      description,
      0,
      2048,
    );
    _s.validateStringLength(
      'workflowName',
      workflowName,
      1,
      255,
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
      payload: {
        'Actions': actions,
        'Name': name,
        'Type': type.toValue(),
        if (description != null) 'Description': description,
        if (predicate != null) 'Predicate': predicate,
        if (schedule != null) 'Schedule': schedule,
        if (startOnCreation != null) 'StartOnCreation': startOnCreation,
        if (tags != null) 'Tags': tags,
        if (workflowName != null) 'WorkflowName': workflowName,
      },
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
  /// provided, the Amazon Web Services account ID is used by default.
  Future<void> createUserDefinedFunction({
    required String databaseName,
    required UserDefinedFunctionInput functionInput,
    String? catalogId,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(functionInput, 'functionInput');
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.CreateUserDefinedFunction'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatabaseName': databaseName,
        'FunctionInput': functionInput,
        if (catalogId != null) 'CatalogId': catalogId,
      },
    );
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
  /// Parameter [maxConcurrentRuns] :
  /// You can use this parameter to prevent unwanted multiple updates to data,
  /// to control costs, or in some cases, to prevent exceeding the maximum
  /// number of concurrent runs of any of the component jobs. If you leave this
  /// parameter blank, there is no limit to the number of concurrent workflow
  /// runs.
  ///
  /// Parameter [tags] :
  /// The tags to be used with this workflow.
  Future<CreateWorkflowResponse> createWorkflow({
    required String name,
    Map<String, String>? defaultRunProperties,
    String? description,
    int? maxConcurrentRuns,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
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
      payload: {
        'Name': name,
        if (defaultRunProperties != null)
          'DefaultRunProperties': defaultRunProperties,
        if (description != null) 'Description': description,
        if (maxConcurrentRuns != null) 'MaxConcurrentRuns': maxConcurrentRuns,
        if (tags != null) 'Tags': tags,
      },
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
    required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.DeleteClassifier'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
      },
    );
  }

  /// Delete the partition column statistics of a column.
  ///
  /// The Identity and Access Management (IAM) permission required for this
  /// operation is <code>DeletePartition</code>.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [GlueEncryptionException].
  ///
  /// Parameter [columnName] :
  /// Name of the column.
  ///
  /// Parameter [databaseName] :
  /// The name of the catalog database where the partitions reside.
  ///
  /// Parameter [partitionValues] :
  /// A list of partition values identifying the partition.
  ///
  /// Parameter [tableName] :
  /// The name of the partitions' table.
  ///
  /// Parameter [catalogId] :
  /// The ID of the Data Catalog where the partitions in question reside. If
  /// none is supplied, the Amazon Web Services account ID is used by default.
  Future<void> deleteColumnStatisticsForPartition({
    required String columnName,
    required String databaseName,
    required List<String> partitionValues,
    required String tableName,
    String? catalogId,
  }) async {
    ArgumentError.checkNotNull(columnName, 'columnName');
    _s.validateStringLength(
      'columnName',
      columnName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
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
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.DeleteColumnStatisticsForPartition'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ColumnName': columnName,
        'DatabaseName': databaseName,
        'PartitionValues': partitionValues,
        'TableName': tableName,
        if (catalogId != null) 'CatalogId': catalogId,
      },
    );
  }

  /// Retrieves table statistics of columns.
  ///
  /// The Identity and Access Management (IAM) permission required for this
  /// operation is <code>DeleteTable</code>.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [GlueEncryptionException].
  ///
  /// Parameter [columnName] :
  /// The name of the column.
  ///
  /// Parameter [databaseName] :
  /// The name of the catalog database where the partitions reside.
  ///
  /// Parameter [tableName] :
  /// The name of the partitions' table.
  ///
  /// Parameter [catalogId] :
  /// The ID of the Data Catalog where the partitions in question reside. If
  /// none is supplied, the Amazon Web Services account ID is used by default.
  Future<void> deleteColumnStatisticsForTable({
    required String columnName,
    required String databaseName,
    required String tableName,
    String? catalogId,
  }) async {
    ArgumentError.checkNotNull(columnName, 'columnName');
    _s.validateStringLength(
      'columnName',
      columnName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
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
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.DeleteColumnStatisticsForTable'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ColumnName': columnName,
        'DatabaseName': databaseName,
        'TableName': tableName,
        if (catalogId != null) 'CatalogId': catalogId,
      },
    );
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
  /// provided, the Amazon Web Services account ID is used by default.
  Future<void> deleteConnection({
    required String connectionName,
    String? catalogId,
  }) async {
    ArgumentError.checkNotNull(connectionName, 'connectionName');
    _s.validateStringLength(
      'connectionName',
      connectionName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.DeleteConnection'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConnectionName': connectionName,
        if (catalogId != null) 'CatalogId': catalogId,
      },
    );
  }

  /// Removes a specified crawler from the Glue Data Catalog, unless the crawler
  /// state is <code>RUNNING</code>.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [CrawlerRunningException].
  /// May throw [SchedulerTransitioningException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [name] :
  /// The name of the crawler to remove.
  Future<void> deleteCrawler({
    required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.DeleteCrawler'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
      },
    );
  }

  /// Removes a specified database from a Data Catalog.
  /// <note>
  /// After completing this operation, you no longer have access to the tables
  /// (and all table versions and partitions that might belong to the tables)
  /// and the user-defined functions in the deleted database. Glue deletes these
  /// "orphaned" resources asynchronously in a timely manner, at the discretion
  /// of the service.
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
  /// provided, the Amazon Web Services account ID is used by default.
  Future<void> deleteDatabase({
    required String name,
    String? catalogId,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.DeleteDatabase'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        if (catalogId != null) 'CatalogId': catalogId,
      },
    );
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
    required String endpointName,
  }) async {
    ArgumentError.checkNotNull(endpointName, 'endpointName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.DeleteDevEndpoint'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EndpointName': endpointName,
      },
    );
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
    required String jobName,
  }) async {
    ArgumentError.checkNotNull(jobName, 'jobName');
    _s.validateStringLength(
      'jobName',
      jobName,
      1,
      255,
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
      payload: {
        'JobName': jobName,
      },
    );

    return DeleteJobResponse.fromJson(jsonResponse.body);
  }

  /// Deletes an Glue machine learning transform. Machine learning transforms
  /// are a special type of transform that use machine learning to learn the
  /// details of the transformation to be performed by learning from examples
  /// provided by humans. These transformations are then saved by Glue. If you
  /// no longer need a transform, you can delete it by calling
  /// <code>DeleteMLTransforms</code>. However, any Glue jobs that still
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
    required String transformId,
  }) async {
    ArgumentError.checkNotNull(transformId, 'transformId');
    _s.validateStringLength(
      'transformId',
      transformId,
      1,
      255,
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
      payload: {
        'TransformId': transformId,
      },
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
  /// none is provided, the Amazon Web Services account ID is used by default.
  Future<void> deletePartition({
    required String databaseName,
    required List<String> partitionValues,
    required String tableName,
    String? catalogId,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
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
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.DeletePartition'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatabaseName': databaseName,
        'PartitionValues': partitionValues,
        'TableName': tableName,
        if (catalogId != null) 'CatalogId': catalogId,
      },
    );
  }

  /// Deletes a specified partition index from an existing table.
  ///
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [InvalidInputException].
  /// May throw [EntityNotFoundException].
  /// May throw [ConflictException].
  /// May throw [GlueEncryptionException].
  ///
  /// Parameter [databaseName] :
  /// Specifies the name of a database from which you want to delete a partition
  /// index.
  ///
  /// Parameter [indexName] :
  /// The name of the partition index to be deleted.
  ///
  /// Parameter [tableName] :
  /// Specifies the name of a table from which you want to delete a partition
  /// index.
  ///
  /// Parameter [catalogId] :
  /// The catalog ID where the table resides.
  Future<void> deletePartitionIndex({
    required String databaseName,
    required String indexName,
    required String tableName,
    String? catalogId,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(indexName, 'indexName');
    _s.validateStringLength(
      'indexName',
      indexName,
      1,
      255,
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
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.DeletePartitionIndex'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatabaseName': databaseName,
        'IndexName': indexName,
        'TableName': tableName,
        if (catalogId != null) 'CatalogId': catalogId,
      },
    );
  }

  /// Delete the entire registry including schema and all of its versions. To
  /// get the status of the delete operation, you can call the
  /// <code>GetRegistry</code> API after the asynchronous call. Deleting a
  /// registry will deactivate all online operations for the registry such as
  /// the <code>UpdateRegistry</code>, <code>CreateSchema</code>,
  /// <code>UpdateSchema</code>, and <code>RegisterSchemaVersion</code> APIs.
  ///
  /// May throw [InvalidInputException].
  /// May throw [EntityNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [registryId] :
  /// This is a wrapper structure that may contain the registry name and Amazon
  /// Resource Name (ARN).
  Future<DeleteRegistryResponse> deleteRegistry({
    required RegistryId registryId,
  }) async {
    ArgumentError.checkNotNull(registryId, 'registryId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.DeleteRegistry'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RegistryId': registryId,
      },
    );

    return DeleteRegistryResponse.fromJson(jsonResponse.body);
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
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the Glue resource for the resource policy to be deleted.
  Future<void> deleteResourcePolicy({
    String? policyHashCondition,
    String? resourceArn,
  }) async {
    _s.validateStringLength(
      'policyHashCondition',
      policyHashCondition,
      1,
      255,
    );
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      10240,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.DeleteResourcePolicy'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (policyHashCondition != null)
          'PolicyHashCondition': policyHashCondition,
        if (resourceArn != null) 'ResourceArn': resourceArn,
      },
    );
  }

  /// Deletes the entire schema set, including the schema set and all of its
  /// versions. To get the status of the delete operation, you can call
  /// <code>GetSchema</code> API after the asynchronous call. Deleting a
  /// registry will deactivate all online operations for the schema, such as the
  /// <code>GetSchemaByDefinition</code>, and <code>RegisterSchemaVersion</code>
  /// APIs.
  ///
  /// May throw [InvalidInputException].
  /// May throw [EntityNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [schemaId] :
  /// This is a wrapper structure that may contain the schema name and Amazon
  /// Resource Name (ARN).
  Future<DeleteSchemaResponse> deleteSchema({
    required SchemaId schemaId,
  }) async {
    ArgumentError.checkNotNull(schemaId, 'schemaId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.DeleteSchema'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SchemaId': schemaId,
      },
    );

    return DeleteSchemaResponse.fromJson(jsonResponse.body);
  }

  /// Remove versions from the specified schema. A version number or range may
  /// be supplied. If the compatibility mode forbids deleting of a version that
  /// is necessary, such as BACKWARDS_FULL, an error is returned. Calling the
  /// <code>GetSchemaVersions</code> API after this call will list the status of
  /// the deleted versions.
  ///
  /// When the range of version numbers contain check pointed version, the API
  /// will return a 409 conflict and will not proceed with the deletion. You
  /// have to remove the checkpoint first using the
  /// <code>DeleteSchemaCheckpoint</code> API before using this API.
  ///
  /// You cannot use the <code>DeleteSchemaVersions</code> API to delete the
  /// first schema version in the schema set. The first schema version can only
  /// be deleted by the <code>DeleteSchema</code> API. This operation will also
  /// delete the attached <code>SchemaVersionMetadata</code> under the schema
  /// versions. Hard deletes will be enforced on the database.
  ///
  /// If the compatibility mode forbids deleting of a version that is necessary,
  /// such as BACKWARDS_FULL, an error is returned.
  ///
  /// May throw [InvalidInputException].
  /// May throw [EntityNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [schemaId] :
  /// This is a wrapper structure that may contain the schema name and Amazon
  /// Resource Name (ARN).
  ///
  /// Parameter [versions] :
  /// A version range may be supplied which may be of the format:
  ///
  /// <ul>
  /// <li>
  /// a single version number, 5
  /// </li>
  /// <li>
  /// a range, 5-8 : deletes versions 5, 6, 7, 8
  /// </li>
  /// </ul>
  Future<DeleteSchemaVersionsResponse> deleteSchemaVersions({
    required SchemaId schemaId,
    required String versions,
  }) async {
    ArgumentError.checkNotNull(schemaId, 'schemaId');
    ArgumentError.checkNotNull(versions, 'versions');
    _s.validateStringLength(
      'versions',
      versions,
      1,
      100000,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.DeleteSchemaVersions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SchemaId': schemaId,
        'Versions': versions,
      },
    );

    return DeleteSchemaVersionsResponse.fromJson(jsonResponse.body);
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
    required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.DeleteSecurityConfiguration'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
      },
    );
  }

  /// Removes a table definition from the Data Catalog.
  /// <note>
  /// After completing this operation, you no longer have access to the table
  /// versions and partitions that belong to the deleted table. Glue deletes
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
  /// the Amazon Web Services account ID is used by default.
  Future<void> deleteTable({
    required String databaseName,
    required String name,
    String? catalogId,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
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
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.DeleteTable'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatabaseName': databaseName,
        'Name': name,
        if (catalogId != null) 'CatalogId': catalogId,
      },
    );
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
  /// the Amazon Web Services account ID is used by default.
  Future<void> deleteTableVersion({
    required String databaseName,
    required String tableName,
    required String versionId,
    String? catalogId,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
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
    ArgumentError.checkNotNull(versionId, 'versionId');
    _s.validateStringLength(
      'versionId',
      versionId,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.DeleteTableVersion'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatabaseName': databaseName,
        'TableName': tableName,
        'VersionId': versionId,
        if (catalogId != null) 'CatalogId': catalogId,
      },
    );
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
    required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
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
      payload: {
        'Name': name,
      },
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
  /// none is supplied, the Amazon Web Services account ID is used by default.
  Future<void> deleteUserDefinedFunction({
    required String databaseName,
    required String functionName,
    String? catalogId,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
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
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.DeleteUserDefinedFunction'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatabaseName': databaseName,
        'FunctionName': functionName,
        if (catalogId != null) 'CatalogId': catalogId,
      },
    );
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
    required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
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
      payload: {
        'Name': name,
      },
    );

    return DeleteWorkflowResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the status of a migration operation.
  ///
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [catalogId] :
  /// The ID of the catalog to migrate. Currently, this should be the Amazon Web
  /// Services account ID.
  Future<GetCatalogImportStatusResponse> getCatalogImportStatus({
    String? catalogId,
  }) async {
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
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
      payload: {
        if (catalogId != null) 'CatalogId': catalogId,
      },
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
    required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
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
      payload: {
        'Name': name,
      },
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
    int? maxResults,
    String? nextToken,
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
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return GetClassifiersResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves partition statistics of columns.
  ///
  /// The Identity and Access Management (IAM) permission required for this
  /// operation is <code>GetPartition</code>.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [GlueEncryptionException].
  ///
  /// Parameter [columnNames] :
  /// A list of the column names.
  ///
  /// Parameter [databaseName] :
  /// The name of the catalog database where the partitions reside.
  ///
  /// Parameter [partitionValues] :
  /// A list of partition values identifying the partition.
  ///
  /// Parameter [tableName] :
  /// The name of the partitions' table.
  ///
  /// Parameter [catalogId] :
  /// The ID of the Data Catalog where the partitions in question reside. If
  /// none is supplied, the Amazon Web Services account ID is used by default.
  Future<GetColumnStatisticsForPartitionResponse>
      getColumnStatisticsForPartition({
    required List<String> columnNames,
    required String databaseName,
    required List<String> partitionValues,
    required String tableName,
    String? catalogId,
  }) async {
    ArgumentError.checkNotNull(columnNames, 'columnNames');
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
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
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetColumnStatisticsForPartition'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ColumnNames': columnNames,
        'DatabaseName': databaseName,
        'PartitionValues': partitionValues,
        'TableName': tableName,
        if (catalogId != null) 'CatalogId': catalogId,
      },
    );

    return GetColumnStatisticsForPartitionResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves table statistics of columns.
  ///
  /// The Identity and Access Management (IAM) permission required for this
  /// operation is <code>GetTable</code>.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [GlueEncryptionException].
  ///
  /// Parameter [columnNames] :
  /// A list of the column names.
  ///
  /// Parameter [databaseName] :
  /// The name of the catalog database where the partitions reside.
  ///
  /// Parameter [tableName] :
  /// The name of the partitions' table.
  ///
  /// Parameter [catalogId] :
  /// The ID of the Data Catalog where the partitions in question reside. If
  /// none is supplied, the Amazon Web Services account ID is used by default.
  Future<GetColumnStatisticsForTableResponse> getColumnStatisticsForTable({
    required List<String> columnNames,
    required String databaseName,
    required String tableName,
    String? catalogId,
  }) async {
    ArgumentError.checkNotNull(columnNames, 'columnNames');
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
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
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetColumnStatisticsForTable'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ColumnNames': columnNames,
        'DatabaseName': databaseName,
        'TableName': tableName,
        if (catalogId != null) 'CatalogId': catalogId,
      },
    );

    return GetColumnStatisticsForTableResponse.fromJson(jsonResponse.body);
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
  /// provided, the Amazon Web Services account ID is used by default.
  ///
  /// Parameter [hidePassword] :
  /// Allows you to retrieve the connection metadata without returning the
  /// password. For instance, the AWS Glue console uses this flag to retrieve
  /// the connection, and does not display the password. Set this parameter when
  /// the caller might not have permission to use the KMS key to decrypt the
  /// password, but it does have permission to access the rest of the connection
  /// properties.
  Future<GetConnectionResponse> getConnection({
    required String name,
    String? catalogId,
    bool? hidePassword,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
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
      payload: {
        'Name': name,
        if (catalogId != null) 'CatalogId': catalogId,
        if (hidePassword != null) 'HidePassword': hidePassword,
      },
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
  /// provided, the Amazon Web Services account ID is used by default.
  ///
  /// Parameter [filter] :
  /// A filter that controls which connections are returned.
  ///
  /// Parameter [hidePassword] :
  /// Allows you to retrieve the connection metadata without returning the
  /// password. For instance, the AWS Glue console uses this flag to retrieve
  /// the connection, and does not display the password. Set this parameter when
  /// the caller might not have permission to use the KMS key to decrypt the
  /// password, but it does have permission to access the rest of the connection
  /// properties.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of connections to return in one response.
  ///
  /// Parameter [nextToken] :
  /// A continuation token, if this is a continuation call.
  Future<GetConnectionsResponse> getConnections({
    String? catalogId,
    GetConnectionsFilter? filter,
    bool? hidePassword,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
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
      payload: {
        if (catalogId != null) 'CatalogId': catalogId,
        if (filter != null) 'Filter': filter,
        if (hidePassword != null) 'HidePassword': hidePassword,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
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
    required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
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
      payload: {
        'Name': name,
      },
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
    List<String>? crawlerNameList,
    int? maxResults,
    String? nextToken,
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
      payload: {
        if (crawlerNameList != null) 'CrawlerNameList': crawlerNameList,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
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
    int? maxResults,
    String? nextToken,
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
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
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
  /// none is provided, the Amazon Web Services account ID is used by default.
  Future<GetDataCatalogEncryptionSettingsResponse>
      getDataCatalogEncryptionSettings({
    String? catalogId,
  }) async {
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
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
      payload: {
        if (catalogId != null) 'CatalogId': catalogId,
      },
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
  /// provided, the Amazon Web Services account ID is used by default.
  Future<GetDatabaseResponse> getDatabase({
    required String name,
    String? catalogId,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
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
      payload: {
        'Name': name,
        if (catalogId != null) 'CatalogId': catalogId,
      },
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
  /// If none is provided, the Amazon Web Services account ID is used by
  /// default.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of databases to return in one response.
  ///
  /// Parameter [nextToken] :
  /// A continuation token, if this is a continuation call.
  ///
  /// Parameter [resourceShareType] :
  /// Allows you to specify that you want to list the databases shared with your
  /// account. The allowable values are <code>FOREIGN</code> or
  /// <code>ALL</code>.
  ///
  /// <ul>
  /// <li>
  /// If set to <code>FOREIGN</code>, will list the databases shared with your
  /// account.
  /// </li>
  /// <li>
  /// If set to <code>ALL</code>, will list the databases shared with your
  /// account, as well as the databases in yor local account.
  /// </li>
  /// </ul>
  Future<GetDatabasesResponse> getDatabases({
    String? catalogId,
    int? maxResults,
    String? nextToken,
    ResourceShareType? resourceShareType,
  }) async {
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
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
      payload: {
        if (catalogId != null) 'CatalogId': catalogId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (resourceShareType != null)
          'ResourceShareType': resourceShareType.toValue(),
      },
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
    String? pythonScript,
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
      payload: {
        if (pythonScript != null) 'PythonScript': pythonScript,
      },
    );

    return GetDataflowGraphResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves information about a specified development endpoint.
  /// <note>
  /// When you create a development endpoint in a virtual private cloud (VPC),
  /// Glue returns only a private IP address, and the public IP address field is
  /// not populated. When you create a non-VPC development endpoint, Glue
  /// returns only a public IP address.
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
    required String endpointName,
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
      payload: {
        'EndpointName': endpointName,
      },
    );

    return GetDevEndpointResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves all the development endpoints in this AWS account.
  /// <note>
  /// When you create a development endpoint in a virtual private cloud (VPC),
  /// Glue returns only a private IP address and the public IP address field is
  /// not populated. When you create a non-VPC development endpoint, Glue
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
    int? maxResults,
    String? nextToken,
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
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
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
    required String jobName,
  }) async {
    ArgumentError.checkNotNull(jobName, 'jobName');
    _s.validateStringLength(
      'jobName',
      jobName,
      1,
      255,
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
      payload: {
        'JobName': jobName,
      },
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
    required String jobName,
    String? runId,
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
      payload: {
        'JobName': jobName,
        if (runId != null) 'RunId': runId,
      },
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
    required String jobName,
    required String runId,
    bool? predecessorsIncluded,
  }) async {
    ArgumentError.checkNotNull(jobName, 'jobName');
    _s.validateStringLength(
      'jobName',
      jobName,
      1,
      255,
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
      payload: {
        'JobName': jobName,
        'RunId': runId,
        if (predecessorsIncluded != null)
          'PredecessorsIncluded': predecessorsIncluded,
      },
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
    required String jobName,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(jobName, 'jobName');
    _s.validateStringLength(
      'jobName',
      jobName,
      1,
      255,
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
      payload: {
        'JobName': jobName,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
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
    int? maxResults,
    String? nextToken,
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
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return GetJobsResponse.fromJson(jsonResponse.body);
  }

  /// Gets details for a specific task run on a machine learning transform.
  /// Machine learning task runs are asynchronous tasks that Glue runs on your
  /// behalf as part of various machine learning workflows. You can check the
  /// stats of any task run by calling <code>GetMLTaskRun</code> with the
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
    required String taskRunId,
    required String transformId,
  }) async {
    ArgumentError.checkNotNull(taskRunId, 'taskRunId');
    _s.validateStringLength(
      'taskRunId',
      taskRunId,
      1,
      255,
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
      payload: {
        'TaskRunId': taskRunId,
        'TransformId': transformId,
      },
    );

    return GetMLTaskRunResponse.fromJson(jsonResponse.body);
  }

  /// Gets a list of runs for a machine learning transform. Machine learning
  /// task runs are asynchronous tasks that Glue runs on your behalf as part of
  /// various machine learning workflows. You can get a sortable, filterable
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
    required String transformId,
    TaskRunFilterCriteria? filter,
    int? maxResults,
    String? nextToken,
    TaskRunSortCriteria? sort,
  }) async {
    ArgumentError.checkNotNull(transformId, 'transformId');
    _s.validateStringLength(
      'transformId',
      transformId,
      1,
      255,
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
      payload: {
        'TransformId': transformId,
        if (filter != null) 'Filter': filter,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (sort != null) 'Sort': sort,
      },
    );

    return GetMLTaskRunsResponse.fromJson(jsonResponse.body);
  }

  /// Gets an Glue machine learning transform artifact and all its corresponding
  /// metadata. Machine learning transforms are a special type of transform that
  /// use machine learning to learn the details of the transformation to be
  /// performed by learning from examples provided by humans. These
  /// transformations are then saved by Glue. You can retrieve their metadata by
  /// calling <code>GetMLTransform</code>.
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
    required String transformId,
  }) async {
    ArgumentError.checkNotNull(transformId, 'transformId');
    _s.validateStringLength(
      'transformId',
      transformId,
      1,
      255,
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
      payload: {
        'TransformId': transformId,
      },
    );

    return GetMLTransformResponse.fromJson(jsonResponse.body);
  }

  /// Gets a sortable, filterable list of existing Glue machine learning
  /// transforms. Machine learning transforms are a special type of transform
  /// that use machine learning to learn the details of the transformation to be
  /// performed by learning from examples provided by humans. These
  /// transformations are then saved by Glue, and you can retrieve their
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
    TransformFilterCriteria? filter,
    int? maxResults,
    String? nextToken,
    TransformSortCriteria? sort,
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
      payload: {
        if (filter != null) 'Filter': filter,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (sort != null) 'Sort': sort,
      },
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
    required CatalogEntry source,
    Location? location,
    List<CatalogEntry>? sinks,
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
      payload: {
        'Source': source,
        if (location != null) 'Location': location,
        if (sinks != null) 'Sinks': sinks,
      },
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
  /// none is provided, the Amazon Web Services account ID is used by default.
  Future<GetPartitionResponse> getPartition({
    required String databaseName,
    required List<String> partitionValues,
    required String tableName,
    String? catalogId,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
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
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
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
      payload: {
        'DatabaseName': databaseName,
        'PartitionValues': partitionValues,
        'TableName': tableName,
        if (catalogId != null) 'CatalogId': catalogId,
      },
    );

    return GetPartitionResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the partition indexes associated with a table.
  ///
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [InvalidInputException].
  /// May throw [EntityNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [databaseName] :
  /// Specifies the name of a database from which you want to retrieve partition
  /// indexes.
  ///
  /// Parameter [tableName] :
  /// Specifies the name of a table for which you want to retrieve the partition
  /// indexes.
  ///
  /// Parameter [catalogId] :
  /// The catalog ID where the table resides.
  ///
  /// Parameter [nextToken] :
  /// A continuation token, included if this is a continuation call.
  Future<GetPartitionIndexesResponse> getPartitionIndexes({
    required String databaseName,
    required String tableName,
    String? catalogId,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
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
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetPartitionIndexes'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatabaseName': databaseName,
        'TableName': tableName,
        if (catalogId != null) 'CatalogId': catalogId,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return GetPartitionIndexesResponse.fromJson(jsonResponse.body);
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
  /// none is provided, the Amazon Web Services account ID is used by default.
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
  /// If an type is encountered that is not valid, an exception is thrown.
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
    required String databaseName,
    required String tableName,
    String? catalogId,
    bool? excludeColumnSchema,
    String? expression,
    int? maxResults,
    String? nextToken,
    Segment? segment,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
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
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateStringLength(
      'expression',
      expression,
      0,
      2048,
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
      payload: {
        'DatabaseName': databaseName,
        'TableName': tableName,
        if (catalogId != null) 'CatalogId': catalogId,
        if (excludeColumnSchema != null)
          'ExcludeColumnSchema': excludeColumnSchema,
        if (expression != null) 'Expression': expression,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (segment != null) 'Segment': segment,
      },
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
  /// Parameter [additionalPlanOptionsMap] :
  /// A map to hold additional optional key-value parameters.
  ///
  /// Currently, these key-value pairs are supported:
  ///
  /// <ul>
  /// <li>
  /// <code>inferSchema</code>  —  Specifies whether to set
  /// <code>inferSchema</code> to true or false for the default script generated
  /// by an Glue job. For example, to set <code>inferSchema</code> to true, pass
  /// the following key value pair:
  ///
  /// <code>--additional-plan-options-map '{"inferSchema":"true"}'</code>
  /// </li>
  /// </ul>
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
    required List<MappingEntry> mapping,
    required CatalogEntry source,
    Map<String, String>? additionalPlanOptionsMap,
    Language? language,
    Location? location,
    List<CatalogEntry>? sinks,
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
      payload: {
        'Mapping': mapping,
        'Source': source,
        if (additionalPlanOptionsMap != null)
          'AdditionalPlanOptionsMap': additionalPlanOptionsMap,
        if (language != null) 'Language': language.toValue(),
        if (location != null) 'Location': location,
        if (sinks != null) 'Sinks': sinks,
      },
    );

    return GetPlanResponse.fromJson(jsonResponse.body);
  }

  /// Describes the specified registry in detail.
  ///
  /// May throw [InvalidInputException].
  /// May throw [AccessDeniedException].
  /// May throw [EntityNotFoundException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [registryId] :
  /// This is a wrapper structure that may contain the registry name and Amazon
  /// Resource Name (ARN).
  Future<GetRegistryResponse> getRegistry({
    required RegistryId registryId,
  }) async {
    ArgumentError.checkNotNull(registryId, 'registryId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetRegistry'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RegistryId': registryId,
      },
    );

    return GetRegistryResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the resource policies set on individual resources by Resource
  /// Access Manager during cross-account permission grants. Also retrieves the
  /// Data Catalog resource policy.
  ///
  /// If you enabled metadata encryption in Data Catalog settings, and you do
  /// not have permission on the KMS key, the operation can't return the Data
  /// Catalog resource policy.
  ///
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [InvalidInputException].
  /// May throw [GlueEncryptionException].
  ///
  /// Parameter [maxResults] :
  /// The maximum size of a list to return.
  ///
  /// Parameter [nextToken] :
  /// A continuation token, if this is a continuation request.
  Future<GetResourcePoliciesResponse> getResourcePolicies({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetResourcePolicies'
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

    return GetResourcePoliciesResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves a specified resource policy.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the Glue resource for which to retrieve the resource policy. If
  /// not supplied, the Data Catalog resource policy is returned. Use
  /// <code>GetResourcePolicies</code> to view all existing resource policies.
  /// For more information see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/glue-specifying-resource-arns.html">Specifying
  /// Glue Resource ARNs</a>.
  Future<GetResourcePolicyResponse> getResourcePolicy({
    String? resourceArn,
  }) async {
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      10240,
    );
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
      payload: {
        if (resourceArn != null) 'ResourceArn': resourceArn,
      },
    );

    return GetResourcePolicyResponse.fromJson(jsonResponse.body);
  }

  /// Describes the specified schema in detail.
  ///
  /// May throw [InvalidInputException].
  /// May throw [AccessDeniedException].
  /// May throw [EntityNotFoundException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [schemaId] :
  /// This is a wrapper structure to contain schema identity fields. The
  /// structure contains:
  ///
  /// <ul>
  /// <li>
  /// SchemaId$SchemaArn: The Amazon Resource Name (ARN) of the schema. Either
  /// <code>SchemaArn</code> or <code>SchemaName</code> and
  /// <code>RegistryName</code> has to be provided.
  /// </li>
  /// <li>
  /// SchemaId$SchemaName: The name of the schema. Either <code>SchemaArn</code>
  /// or <code>SchemaName</code> and <code>RegistryName</code> has to be
  /// provided.
  /// </li>
  /// </ul>
  Future<GetSchemaResponse> getSchema({
    required SchemaId schemaId,
  }) async {
    ArgumentError.checkNotNull(schemaId, 'schemaId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetSchema'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SchemaId': schemaId,
      },
    );

    return GetSchemaResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves a schema by the <code>SchemaDefinition</code>. The schema
  /// definition is sent to the Schema Registry, canonicalized, and hashed. If
  /// the hash is matched within the scope of the <code>SchemaName</code> or ARN
  /// (or the default registry, if none is supplied), that schema’s metadata is
  /// returned. Otherwise, a 404 or NotFound error is returned. Schema versions
  /// in <code>Deleted</code> statuses will not be included in the results.
  ///
  /// May throw [InvalidInputException].
  /// May throw [AccessDeniedException].
  /// May throw [EntityNotFoundException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [schemaDefinition] :
  /// The definition of the schema for which schema details are required.
  ///
  /// Parameter [schemaId] :
  /// This is a wrapper structure to contain schema identity fields. The
  /// structure contains:
  ///
  /// <ul>
  /// <li>
  /// SchemaId$SchemaArn: The Amazon Resource Name (ARN) of the schema. One of
  /// <code>SchemaArn</code> or <code>SchemaName</code> has to be provided.
  /// </li>
  /// <li>
  /// SchemaId$SchemaName: The name of the schema. One of <code>SchemaArn</code>
  /// or <code>SchemaName</code> has to be provided.
  /// </li>
  /// </ul>
  Future<GetSchemaByDefinitionResponse> getSchemaByDefinition({
    required String schemaDefinition,
    required SchemaId schemaId,
  }) async {
    ArgumentError.checkNotNull(schemaDefinition, 'schemaDefinition');
    _s.validateStringLength(
      'schemaDefinition',
      schemaDefinition,
      1,
      170000,
      isRequired: true,
    );
    ArgumentError.checkNotNull(schemaId, 'schemaId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetSchemaByDefinition'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SchemaDefinition': schemaDefinition,
        'SchemaId': schemaId,
      },
    );

    return GetSchemaByDefinitionResponse.fromJson(jsonResponse.body);
  }

  /// Get the specified schema by its unique ID assigned when a version of the
  /// schema is created or registered. Schema versions in Deleted status will
  /// not be included in the results.
  ///
  /// May throw [InvalidInputException].
  /// May throw [AccessDeniedException].
  /// May throw [EntityNotFoundException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [schemaId] :
  /// This is a wrapper structure to contain schema identity fields. The
  /// structure contains:
  ///
  /// <ul>
  /// <li>
  /// SchemaId$SchemaArn: The Amazon Resource Name (ARN) of the schema. Either
  /// <code>SchemaArn</code> or <code>SchemaName</code> and
  /// <code>RegistryName</code> has to be provided.
  /// </li>
  /// <li>
  /// SchemaId$SchemaName: The name of the schema. Either <code>SchemaArn</code>
  /// or <code>SchemaName</code> and <code>RegistryName</code> has to be
  /// provided.
  /// </li>
  /// </ul>
  ///
  /// Parameter [schemaVersionId] :
  /// The <code>SchemaVersionId</code> of the schema version. This field is
  /// required for fetching by schema ID. Either this or the
  /// <code>SchemaId</code> wrapper has to be provided.
  ///
  /// Parameter [schemaVersionNumber] :
  /// The version number of the schema.
  Future<GetSchemaVersionResponse> getSchemaVersion({
    SchemaId? schemaId,
    String? schemaVersionId,
    SchemaVersionNumber? schemaVersionNumber,
  }) async {
    _s.validateStringLength(
      'schemaVersionId',
      schemaVersionId,
      36,
      36,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetSchemaVersion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (schemaId != null) 'SchemaId': schemaId,
        if (schemaVersionId != null) 'SchemaVersionId': schemaVersionId,
        if (schemaVersionNumber != null)
          'SchemaVersionNumber': schemaVersionNumber,
      },
    );

    return GetSchemaVersionResponse.fromJson(jsonResponse.body);
  }

  /// Fetches the schema version difference in the specified difference type
  /// between two stored schema versions in the Schema Registry.
  ///
  /// This API allows you to compare two schema versions between two schema
  /// definitions under the same schema.
  ///
  /// May throw [InvalidInputException].
  /// May throw [EntityNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [firstSchemaVersionNumber] :
  /// The first of the two schema versions to be compared.
  ///
  /// Parameter [schemaDiffType] :
  /// Refers to <code>SYNTAX_DIFF</code>, which is the currently supported diff
  /// type.
  ///
  /// Parameter [schemaId] :
  /// This is a wrapper structure to contain schema identity fields. The
  /// structure contains:
  ///
  /// <ul>
  /// <li>
  /// SchemaId$SchemaArn: The Amazon Resource Name (ARN) of the schema. One of
  /// <code>SchemaArn</code> or <code>SchemaName</code> has to be provided.
  /// </li>
  /// <li>
  /// SchemaId$SchemaName: The name of the schema. One of <code>SchemaArn</code>
  /// or <code>SchemaName</code> has to be provided.
  /// </li>
  /// </ul>
  ///
  /// Parameter [secondSchemaVersionNumber] :
  /// The second of the two schema versions to be compared.
  Future<GetSchemaVersionsDiffResponse> getSchemaVersionsDiff({
    required SchemaVersionNumber firstSchemaVersionNumber,
    required SchemaDiffType schemaDiffType,
    required SchemaId schemaId,
    required SchemaVersionNumber secondSchemaVersionNumber,
  }) async {
    ArgumentError.checkNotNull(
        firstSchemaVersionNumber, 'firstSchemaVersionNumber');
    ArgumentError.checkNotNull(schemaDiffType, 'schemaDiffType');
    ArgumentError.checkNotNull(schemaId, 'schemaId');
    ArgumentError.checkNotNull(
        secondSchemaVersionNumber, 'secondSchemaVersionNumber');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.GetSchemaVersionsDiff'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FirstSchemaVersionNumber': firstSchemaVersionNumber,
        'SchemaDiffType': schemaDiffType.toValue(),
        'SchemaId': schemaId,
        'SecondSchemaVersionNumber': secondSchemaVersionNumber,
      },
    );

    return GetSchemaVersionsDiffResponse.fromJson(jsonResponse.body);
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
    required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
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
      payload: {
        'Name': name,
      },
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
    int? maxResults,
    String? nextToken,
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
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
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
  /// the Amazon Web Services account ID is used by default.
  Future<GetTableResponse> getTable({
    required String databaseName,
    required String name,
    String? catalogId,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
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
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
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
      payload: {
        'DatabaseName': databaseName,
        'Name': name,
        if (catalogId != null) 'CatalogId': catalogId,
      },
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
  /// the Amazon Web Services account ID is used by default.
  ///
  /// Parameter [versionId] :
  /// The ID value of the table version to be retrieved. A
  /// <code>VersionID</code> is a string representation of an integer. Each
  /// version is incremented by 1.
  Future<GetTableVersionResponse> getTableVersion({
    required String databaseName,
    required String tableName,
    String? catalogId,
    String? versionId,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
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
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateStringLength(
      'versionId',
      versionId,
      1,
      255,
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
      payload: {
        'DatabaseName': databaseName,
        'TableName': tableName,
        if (catalogId != null) 'CatalogId': catalogId,
        if (versionId != null) 'VersionId': versionId,
      },
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
  /// the Amazon Web Services account ID is used by default.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of table versions to return in one response.
  ///
  /// Parameter [nextToken] :
  /// A continuation token, if this is not the first call.
  Future<GetTableVersionsResponse> getTableVersions({
    required String databaseName,
    required String tableName,
    String? catalogId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
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
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
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
      payload: {
        'DatabaseName': databaseName,
        'TableName': tableName,
        if (catalogId != null) 'CatalogId': catalogId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
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
  /// the Amazon Web Services account ID is used by default.
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
    required String databaseName,
    String? catalogId,
    String? expression,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateStringLength(
      'expression',
      expression,
      0,
      2048,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
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
      payload: {
        'DatabaseName': databaseName,
        if (catalogId != null) 'CatalogId': catalogId,
        if (expression != null) 'Expression': expression,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
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
    required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      10240,
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
      payload: {
        'ResourceArn': resourceArn,
      },
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
    required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
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
      payload: {
        'Name': name,
      },
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
    String? dependentJobName,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateStringLength(
      'dependentJobName',
      dependentJobName,
      1,
      255,
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
      payload: {
        if (dependentJobName != null) 'DependentJobName': dependentJobName,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
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
  /// If none is provided, the Amazon Web Services account ID is used by
  /// default.
  Future<GetUserDefinedFunctionResponse> getUserDefinedFunction({
    required String databaseName,
    required String functionName,
    String? catalogId,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
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
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
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
      payload: {
        'DatabaseName': databaseName,
        'FunctionName': functionName,
        if (catalogId != null) 'CatalogId': catalogId,
      },
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
  /// located. If none is provided, the Amazon Web Services account ID is used
  /// by default.
  ///
  /// Parameter [databaseName] :
  /// The name of the catalog database where the functions are located. If none
  /// is provided, functions from all the databases across the catalog will be
  /// returned.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of functions to return in one response.
  ///
  /// Parameter [nextToken] :
  /// A continuation token, if this is a continuation call.
  Future<GetUserDefinedFunctionsResponse> getUserDefinedFunctions({
    required String pattern,
    String? catalogId,
    String? databaseName,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(pattern, 'pattern');
    _s.validateStringLength(
      'pattern',
      pattern,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
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
      payload: {
        'Pattern': pattern,
        if (catalogId != null) 'CatalogId': catalogId,
        if (databaseName != null) 'DatabaseName': databaseName,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
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
    required String name,
    bool? includeGraph,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
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
      payload: {
        'Name': name,
        if (includeGraph != null) 'IncludeGraph': includeGraph,
      },
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
    required String name,
    required String runId,
    bool? includeGraph,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
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
      payload: {
        'Name': name,
        'RunId': runId,
        if (includeGraph != null) 'IncludeGraph': includeGraph,
      },
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
    required String name,
    required String runId,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
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
      payload: {
        'Name': name,
        'RunId': runId,
      },
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
    required String name,
    bool? includeGraph,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
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
      payload: {
        'Name': name,
        if (includeGraph != null) 'IncludeGraph': includeGraph,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return GetWorkflowRunsResponse.fromJson(jsonResponse.body);
  }

  /// Imports an existing Amazon Athena Data Catalog to Glue.
  ///
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [catalogId] :
  /// The ID of the catalog to import. Currently, this should be the Amazon Web
  /// Services account ID.
  Future<void> importCatalogToGlue({
    String? catalogId,
  }) async {
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.ImportCatalogToGlue'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (catalogId != null) 'CatalogId': catalogId,
      },
    );
  }

  /// Retrieves the names of all crawler resources in this Amazon Web Services
  /// account, or the resources with the specified tag. This operation allows
  /// you to see which resources are available in your account, and their names.
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
    int? maxResults,
    String? nextToken,
    Map<String, String>? tags,
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
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (tags != null) 'Tags': tags,
      },
    );

    return ListCrawlersResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the names of all <code>DevEndpoint</code> resources in this
  /// Amazon Web Services account, or the resources with the specified tag. This
  /// operation allows you to see which resources are available in your account,
  /// and their names.
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
    int? maxResults,
    String? nextToken,
    Map<String, String>? tags,
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
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (tags != null) 'Tags': tags,
      },
    );

    return ListDevEndpointsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the names of all job resources in this Amazon Web Services
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
  Future<ListJobsResponse> listJobs({
    int? maxResults,
    String? nextToken,
    Map<String, String>? tags,
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
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (tags != null) 'Tags': tags,
      },
    );

    return ListJobsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves a sortable, filterable list of existing Glue machine learning
  /// transforms in this Amazon Web Services account, or the resources with the
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
    TransformFilterCriteria? filter,
    int? maxResults,
    String? nextToken,
    TransformSortCriteria? sort,
    Map<String, String>? tags,
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
      payload: {
        if (filter != null) 'Filter': filter,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (sort != null) 'Sort': sort,
        if (tags != null) 'Tags': tags,
      },
    );

    return ListMLTransformsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of registries that you have created, with minimal registry
  /// information. Registries in the <code>Deleting</code> status will not be
  /// included in the results. Empty results will be returned if there are no
  /// registries available.
  ///
  /// May throw [InvalidInputException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results required per page. If the value is not supplied,
  /// this will be defaulted to 25 per page.
  ///
  /// Parameter [nextToken] :
  /// A continuation token, if this is a continuation call.
  Future<ListRegistriesResponse> listRegistries({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.ListRegistries'
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

    return ListRegistriesResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of schema versions that you have created, with minimal
  /// information. Schema versions in Deleted status will not be included in the
  /// results. Empty results will be returned if there are no schema versions
  /// available.
  ///
  /// May throw [InvalidInputException].
  /// May throw [AccessDeniedException].
  /// May throw [EntityNotFoundException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [schemaId] :
  /// This is a wrapper structure to contain schema identity fields. The
  /// structure contains:
  ///
  /// <ul>
  /// <li>
  /// SchemaId$SchemaArn: The Amazon Resource Name (ARN) of the schema. Either
  /// <code>SchemaArn</code> or <code>SchemaName</code> and
  /// <code>RegistryName</code> has to be provided.
  /// </li>
  /// <li>
  /// SchemaId$SchemaName: The name of the schema. Either <code>SchemaArn</code>
  /// or <code>SchemaName</code> and <code>RegistryName</code> has to be
  /// provided.
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results required per page. If the value is not supplied,
  /// this will be defaulted to 25 per page.
  ///
  /// Parameter [nextToken] :
  /// A continuation token, if this is a continuation call.
  Future<ListSchemaVersionsResponse> listSchemaVersions({
    required SchemaId schemaId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(schemaId, 'schemaId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.ListSchemaVersions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SchemaId': schemaId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListSchemaVersionsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of schemas with minimal details. Schemas in Deleting status
  /// will not be included in the results. Empty results will be returned if
  /// there are no schemas available.
  ///
  /// When the <code>RegistryId</code> is not provided, all the schemas across
  /// registries will be part of the API response.
  ///
  /// May throw [InvalidInputException].
  /// May throw [AccessDeniedException].
  /// May throw [EntityNotFoundException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results required per page. If the value is not supplied,
  /// this will be defaulted to 25 per page.
  ///
  /// Parameter [nextToken] :
  /// A continuation token, if this is a continuation call.
  ///
  /// Parameter [registryId] :
  /// A wrapper structure that may contain the registry name and Amazon Resource
  /// Name (ARN).
  Future<ListSchemasResponse> listSchemas({
    int? maxResults,
    String? nextToken,
    RegistryId? registryId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.ListSchemas'
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
        if (registryId != null) 'RegistryId': registryId,
      },
    );

    return ListSchemasResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the names of all trigger resources in this Amazon Web Services
  /// account, or the resources with the specified tag. This operation allows
  /// you to see which resources are available in your account, and their names.
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
    String? dependentJobName,
    int? maxResults,
    String? nextToken,
    Map<String, String>? tags,
  }) async {
    _s.validateStringLength(
      'dependentJobName',
      dependentJobName,
      1,
      255,
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
      payload: {
        if (dependentJobName != null) 'DependentJobName': dependentJobName,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (tags != null) 'Tags': tags,
      },
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
    int? maxResults,
    String? nextToken,
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
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
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
  /// is provided, the Amazon Web Services account ID is used by default.
  Future<void> putDataCatalogEncryptionSettings({
    required DataCatalogEncryptionSettings dataCatalogEncryptionSettings,
    String? catalogId,
  }) async {
    ArgumentError.checkNotNull(
        dataCatalogEncryptionSettings, 'dataCatalogEncryptionSettings');
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.PutDataCatalogEncryptionSettings'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DataCatalogEncryptionSettings': dataCatalogEncryptionSettings,
        if (catalogId != null) 'CatalogId': catalogId,
      },
    );
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
  /// Parameter [enableHybrid] :
  /// If <code>'TRUE'</code>, indicates that you are using both methods to grant
  /// cross-account access to Data Catalog resources:
  ///
  /// <ul>
  /// <li>
  /// By directly updating the resource policy with
  /// <code>PutResourePolicy</code>
  /// </li>
  /// <li>
  /// By using the <b>Grant permissions</b> command on the Management Console.
  /// </li>
  /// </ul>
  /// Must be set to <code>'TRUE'</code> if you have already used the Management
  /// Console to grant cross-account access, otherwise the call fails. Default
  /// is 'FALSE'.
  ///
  /// Parameter [policyExistsCondition] :
  /// A value of <code>MUST_EXIST</code> is used to update a policy. A value of
  /// <code>NOT_EXIST</code> is used to create a new policy. If a value of
  /// <code>NONE</code> or a null value is used, the call does not depend on the
  /// existence of a policy.
  ///
  /// Parameter [policyHashCondition] :
  /// The hash value returned when the previous policy was set using
  /// <code>PutResourcePolicy</code>. Its purpose is to prevent concurrent
  /// modifications of a policy. Do not use this parameter if no previous policy
  /// has been set.
  ///
  /// Parameter [resourceArn] :
  /// Do not use. For internal use only.
  Future<PutResourcePolicyResponse> putResourcePolicy({
    required String policyInJson,
    EnableHybridValues? enableHybrid,
    ExistCondition? policyExistsCondition,
    String? policyHashCondition,
    String? resourceArn,
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
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      10240,
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
      payload: {
        'PolicyInJson': policyInJson,
        if (enableHybrid != null) 'EnableHybrid': enableHybrid.toValue(),
        if (policyExistsCondition != null)
          'PolicyExistsCondition': policyExistsCondition.toValue(),
        if (policyHashCondition != null)
          'PolicyHashCondition': policyHashCondition,
        if (resourceArn != null) 'ResourceArn': resourceArn,
      },
    );

    return PutResourcePolicyResponse.fromJson(jsonResponse.body);
  }

  /// Puts the metadata key value pair for a specified schema version ID. A
  /// maximum of 10 key value pairs will be allowed per schema version. They can
  /// be added over one or more calls.
  ///
  /// May throw [InvalidInputException].
  /// May throw [AccessDeniedException].
  /// May throw [AlreadyExistsException].
  /// May throw [EntityNotFoundException].
  /// May throw [ResourceNumberLimitExceededException].
  ///
  /// Parameter [metadataKeyValue] :
  /// The metadata key's corresponding value.
  ///
  /// Parameter [schemaId] :
  /// The unique ID for the schema.
  ///
  /// Parameter [schemaVersionId] :
  /// The unique version ID of the schema version.
  ///
  /// Parameter [schemaVersionNumber] :
  /// The version number of the schema.
  Future<PutSchemaVersionMetadataResponse> putSchemaVersionMetadata({
    required MetadataKeyValuePair metadataKeyValue,
    SchemaId? schemaId,
    String? schemaVersionId,
    SchemaVersionNumber? schemaVersionNumber,
  }) async {
    ArgumentError.checkNotNull(metadataKeyValue, 'metadataKeyValue');
    _s.validateStringLength(
      'schemaVersionId',
      schemaVersionId,
      36,
      36,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.PutSchemaVersionMetadata'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MetadataKeyValue': metadataKeyValue,
        if (schemaId != null) 'SchemaId': schemaId,
        if (schemaVersionId != null) 'SchemaVersionId': schemaVersionId,
        if (schemaVersionNumber != null)
          'SchemaVersionNumber': schemaVersionNumber,
      },
    );

    return PutSchemaVersionMetadataResponse.fromJson(jsonResponse.body);
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
    required String name,
    required String runId,
    required Map<String, String> runProperties,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
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
    ArgumentError.checkNotNull(runProperties, 'runProperties');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.PutWorkflowRunProperties'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'RunId': runId,
        'RunProperties': runProperties,
      },
    );
  }

  /// Queries for the schema version metadata information.
  ///
  /// May throw [InvalidInputException].
  /// May throw [AccessDeniedException].
  /// May throw [EntityNotFoundException].
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results required per page. If the value is not supplied,
  /// this will be defaulted to 25 per page.
  ///
  /// Parameter [metadataList] :
  /// Search key-value pairs for metadata, if they are not provided all the
  /// metadata information will be fetched.
  ///
  /// Parameter [nextToken] :
  /// A continuation token, if this is a continuation call.
  ///
  /// Parameter [schemaId] :
  /// A wrapper structure that may contain the schema name and Amazon Resource
  /// Name (ARN).
  ///
  /// Parameter [schemaVersionId] :
  /// The unique version ID of the schema version.
  ///
  /// Parameter [schemaVersionNumber] :
  /// The version number of the schema.
  Future<QuerySchemaVersionMetadataResponse> querySchemaVersionMetadata({
    int? maxResults,
    List<MetadataKeyValuePair>? metadataList,
    String? nextToken,
    SchemaId? schemaId,
    String? schemaVersionId,
    SchemaVersionNumber? schemaVersionNumber,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateStringLength(
      'schemaVersionId',
      schemaVersionId,
      36,
      36,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.QuerySchemaVersionMetadata'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (metadataList != null) 'MetadataList': metadataList,
        if (nextToken != null) 'NextToken': nextToken,
        if (schemaId != null) 'SchemaId': schemaId,
        if (schemaVersionId != null) 'SchemaVersionId': schemaVersionId,
        if (schemaVersionNumber != null)
          'SchemaVersionNumber': schemaVersionNumber,
      },
    );

    return QuerySchemaVersionMetadataResponse.fromJson(jsonResponse.body);
  }

  /// Adds a new version to the existing schema. Returns an error if new version
  /// of schema does not meet the compatibility requirements of the schema set.
  /// This API will not create a new schema set and will return a 404 error if
  /// the schema set is not already present in the Schema Registry.
  ///
  /// If this is the first schema definition to be registered in the Schema
  /// Registry, this API will store the schema version and return immediately.
  /// Otherwise, this call has the potential to run longer than other operations
  /// due to compatibility modes. You can call the <code>GetSchemaVersion</code>
  /// API with the <code>SchemaVersionId</code> to check compatibility modes.
  ///
  /// If the same schema definition is already stored in Schema Registry as a
  /// version, the schema ID of the existing schema is returned to the caller.
  ///
  /// May throw [InvalidInputException].
  /// May throw [AccessDeniedException].
  /// May throw [EntityNotFoundException].
  /// May throw [ResourceNumberLimitExceededException].
  /// May throw [ConcurrentModificationException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [schemaDefinition] :
  /// The schema definition using the <code>DataFormat</code> setting for the
  /// <code>SchemaName</code>.
  ///
  /// Parameter [schemaId] :
  /// This is a wrapper structure to contain schema identity fields. The
  /// structure contains:
  ///
  /// <ul>
  /// <li>
  /// SchemaId$SchemaArn: The Amazon Resource Name (ARN) of the schema. Either
  /// <code>SchemaArn</code> or <code>SchemaName</code> and
  /// <code>RegistryName</code> has to be provided.
  /// </li>
  /// <li>
  /// SchemaId$SchemaName: The name of the schema. Either <code>SchemaArn</code>
  /// or <code>SchemaName</code> and <code>RegistryName</code> has to be
  /// provided.
  /// </li>
  /// </ul>
  Future<RegisterSchemaVersionResponse> registerSchemaVersion({
    required String schemaDefinition,
    required SchemaId schemaId,
  }) async {
    ArgumentError.checkNotNull(schemaDefinition, 'schemaDefinition');
    _s.validateStringLength(
      'schemaDefinition',
      schemaDefinition,
      1,
      170000,
      isRequired: true,
    );
    ArgumentError.checkNotNull(schemaId, 'schemaId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.RegisterSchemaVersion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SchemaDefinition': schemaDefinition,
        'SchemaId': schemaId,
      },
    );

    return RegisterSchemaVersionResponse.fromJson(jsonResponse.body);
  }

  /// Removes a key value pair from the schema version metadata for the
  /// specified schema version ID.
  ///
  /// May throw [InvalidInputException].
  /// May throw [AccessDeniedException].
  /// May throw [EntityNotFoundException].
  ///
  /// Parameter [metadataKeyValue] :
  /// The value of the metadata key.
  ///
  /// Parameter [schemaId] :
  /// A wrapper structure that may contain the schema name and Amazon Resource
  /// Name (ARN).
  ///
  /// Parameter [schemaVersionId] :
  /// The unique version ID of the schema version.
  ///
  /// Parameter [schemaVersionNumber] :
  /// The version number of the schema.
  Future<RemoveSchemaVersionMetadataResponse> removeSchemaVersionMetadata({
    required MetadataKeyValuePair metadataKeyValue,
    SchemaId? schemaId,
    String? schemaVersionId,
    SchemaVersionNumber? schemaVersionNumber,
  }) async {
    ArgumentError.checkNotNull(metadataKeyValue, 'metadataKeyValue');
    _s.validateStringLength(
      'schemaVersionId',
      schemaVersionId,
      36,
      36,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.RemoveSchemaVersionMetadata'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MetadataKeyValue': metadataKeyValue,
        if (schemaId != null) 'SchemaId': schemaId,
        if (schemaVersionId != null) 'SchemaVersionId': schemaVersionId,
        if (schemaVersionNumber != null)
          'SchemaVersionNumber': schemaVersionNumber,
      },
    );

    return RemoveSchemaVersionMetadataResponse.fromJson(jsonResponse.body);
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
    required String jobName,
    String? runId,
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
      payload: {
        'JobName': jobName,
        if (runId != null) 'RunId': runId,
      },
    );

    return ResetJobBookmarkResponse.fromJson(jsonResponse.body);
  }

  /// Restarts selected nodes of a previous partially completed workflow run and
  /// resumes the workflow run. The selected nodes and all nodes that are
  /// downstream from the selected nodes are run.
  ///
  /// May throw [InvalidInputException].
  /// May throw [EntityNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [ConcurrentRunsExceededException].
  /// May throw [IllegalWorkflowStateException].
  ///
  /// Parameter [name] :
  /// The name of the workflow to resume.
  ///
  /// Parameter [nodeIds] :
  /// A list of the node IDs for the nodes you want to restart. The nodes that
  /// are to be restarted must have a run attempt in the original run.
  ///
  /// Parameter [runId] :
  /// The ID of the workflow run to resume.
  Future<ResumeWorkflowRunResponse> resumeWorkflowRun({
    required String name,
    required List<String> nodeIds,
    required String runId,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(nodeIds, 'nodeIds');
    ArgumentError.checkNotNull(runId, 'runId');
    _s.validateStringLength(
      'runId',
      runId,
      1,
      255,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.ResumeWorkflowRun'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'NodeIds': nodeIds,
        'RunId': runId,
      },
    );

    return ResumeWorkflowRunResponse.fromJson(jsonResponse.body);
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
  /// A unique identifier, consisting of <code> <i>account_id</i> </code>.
  ///
  /// Parameter [filters] :
  /// A list of key-value pairs, and a comparator used to filter the search
  /// results. Returns all entities matching the predicate.
  ///
  /// The <code>Comparator</code> member of the <code>PropertyPredicate</code>
  /// struct is used only for time fields, and can be omitted for other field
  /// types. Also, when comparing string values, such as when
  /// <code>Key=Name</code>, a fuzzy match algorithm is used. The
  /// <code>Key</code> field (for example, the value of the <code>Name</code>
  /// field) is split on certain punctuation characters, for example, -, :, #,
  /// etc. into tokens. Then each token is exact-match compared with the
  /// <code>Value</code> member of <code>PropertyPredicate</code>. For example,
  /// if <code>Key=Name</code> and <code>Value=link</code>, tables named
  /// <code>customer-link</code> and <code>xx-link-yy</code> are returned, but
  /// <code>xxlinkyy</code> is not returned.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of tables to return in a single response.
  ///
  /// Parameter [nextToken] :
  /// A continuation token, included if this is a continuation call.
  ///
  /// Parameter [resourceShareType] :
  /// Allows you to specify that you want to search the tables shared with your
  /// account. The allowable values are <code>FOREIGN</code> or
  /// <code>ALL</code>.
  ///
  /// <ul>
  /// <li>
  /// If set to <code>FOREIGN</code>, will search the tables shared with your
  /// account.
  /// </li>
  /// <li>
  /// If set to <code>ALL</code>, will search the tables shared with your
  /// account, as well as the tables in yor local account.
  /// </li>
  /// </ul>
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
    String? catalogId,
    List<PropertyPredicate>? filters,
    int? maxResults,
    String? nextToken,
    ResourceShareType? resourceShareType,
    String? searchText,
    List<SortCriterion>? sortCriteria,
  }) async {
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
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
      payload: {
        if (catalogId != null) 'CatalogId': catalogId,
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (resourceShareType != null)
          'ResourceShareType': resourceShareType.toValue(),
        if (searchText != null) 'SearchText': searchText,
        if (sortCriteria != null) 'SortCriteria': sortCriteria,
      },
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
    required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.StartCrawler'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
      },
    );
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
    required String crawlerName,
  }) async {
    ArgumentError.checkNotNull(crawlerName, 'crawlerName');
    _s.validateStringLength(
      'crawlerName',
      crawlerName,
      1,
      255,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.StartCrawlerSchedule'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CrawlerName': crawlerName,
      },
    );
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
    required String outputS3Path,
    required String transformId,
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
      payload: {
        'OutputS3Path': outputS3Path,
        'TransformId': transformId,
      },
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
  /// After the <code>StartMLLabelingSetGenerationTaskRun</code> finishes, Glue
  /// machine learning will have generated a series of questions for humans to
  /// answer. (Answering these questions is often called 'labeling' in the
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
    required String inputS3Path,
    required String transformId,
    bool? replaceAllLabels,
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
      payload: {
        'InputS3Path': inputS3Path,
        'TransformId': transformId,
        if (replaceAllLabels != null) 'ReplaceAllLabels': replaceAllLabels,
      },
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
  /// The number of Glue data processing units (DPUs) to allocate to this
  /// JobRun. From 2 to 100 DPUs can be allocated; the default is 10. A DPU is a
  /// relative measure of processing power that consists of 4 vCPUs of compute
  /// capacity and 16 GB of memory. For more information, see the <a
  /// href="https://aws.amazon.com/glue/pricing/">Glue pricing page</a>.
  ///
  /// Parameter [arguments] :
  /// The job arguments specifically for this run. For this job run, they
  /// replace the default arguments set in the job definition itself.
  ///
  /// You can specify arguments here that your own job-execution script
  /// consumes, as well as arguments that Glue itself consumes.
  ///
  /// For information about how to specify and consume your own Job arguments,
  /// see the <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-python-calling.html">Calling
  /// Glue APIs in Python</a> topic in the developer guide.
  ///
  /// For information about the key-value pairs that Glue consumes to set up
  /// your job, see the <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-etl-glue-arguments.html">Special
  /// Parameters Used by Glue</a> topic in the developer guide.
  ///
  /// Parameter [jobRunId] :
  /// The ID of a previous <code>JobRun</code> to retry.
  ///
  /// Parameter [maxCapacity] :
  /// The number of Glue data processing units (DPUs) that can be allocated when
  /// this job runs. A DPU is a relative measure of processing power that
  /// consists of 4 vCPUs of compute capacity and 16 GB of memory. For more
  /// information, see the <a href="https://aws.amazon.com/glue/pricing/">Glue
  /// pricing page</a>.
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
    required String jobName,
    int? allocatedCapacity,
    Map<String, String>? arguments,
    String? jobRunId,
    double? maxCapacity,
    NotificationProperty? notificationProperty,
    int? numberOfWorkers,
    String? securityConfiguration,
    int? timeout,
    WorkerType? workerType,
  }) async {
    ArgumentError.checkNotNull(jobName, 'jobName');
    _s.validateStringLength(
      'jobName',
      jobName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'jobRunId',
      jobRunId,
      1,
      255,
    );
    _s.validateStringLength(
      'securityConfiguration',
      securityConfiguration,
      1,
      255,
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
      payload: {
        'JobName': jobName,
        if (allocatedCapacity != null) 'AllocatedCapacity': allocatedCapacity,
        if (arguments != null) 'Arguments': arguments,
        if (jobRunId != null) 'JobRunId': jobRunId,
        if (maxCapacity != null) 'MaxCapacity': maxCapacity,
        if (notificationProperty != null)
          'NotificationProperty': notificationProperty,
        if (numberOfWorkers != null) 'NumberOfWorkers': numberOfWorkers,
        if (securityConfiguration != null)
          'SecurityConfiguration': securityConfiguration,
        if (timeout != null) 'Timeout': timeout,
        if (workerType != null) 'WorkerType': workerType.toValue(),
      },
    );

    return StartJobRunResponse.fromJson(jsonResponse.body);
  }

  /// Starts a task to estimate the quality of the transform.
  ///
  /// When you provide label sets as examples of truth, Glue machine learning
  /// uses some of those examples to learn from them. The rest of the labels are
  /// used as a test to estimate quality.
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
    required String transformId,
  }) async {
    ArgumentError.checkNotNull(transformId, 'transformId');
    _s.validateStringLength(
      'transformId',
      transformId,
      1,
      255,
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
      payload: {
        'TransformId': transformId,
      },
    );

    return StartMLEvaluationTaskRunResponse.fromJson(jsonResponse.body);
  }

  /// Starts the active learning workflow for your machine learning transform to
  /// improve the transform's quality by generating label sets and adding
  /// labels.
  ///
  /// When the <code>StartMLLabelingSetGenerationTaskRun</code> finishes, Glue
  /// will have generated a "labeling set" or a set of questions for humans to
  /// answer.
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
    required String outputS3Path,
    required String transformId,
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
      payload: {
        'OutputS3Path': outputS3Path,
        'TransformId': transformId,
      },
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
    required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
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
      payload: {
        'Name': name,
      },
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
    required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
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
      payload: {
        'Name': name,
      },
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
    required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.StopCrawler'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
      },
    );
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
    required String crawlerName,
  }) async {
    ArgumentError.checkNotNull(crawlerName, 'crawlerName');
    _s.validateStringLength(
      'crawlerName',
      crawlerName,
      1,
      255,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.StopCrawlerSchedule'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CrawlerName': crawlerName,
      },
    );
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
    required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
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
      payload: {
        'Name': name,
      },
    );

    return StopTriggerResponse.fromJson(jsonResponse.body);
  }

  /// Stops the execution of the specified workflow run.
  ///
  /// May throw [InvalidInputException].
  /// May throw [EntityNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [IllegalWorkflowStateException].
  ///
  /// Parameter [name] :
  /// The name of the workflow to stop.
  ///
  /// Parameter [runId] :
  /// The ID of the workflow run to stop.
  Future<void> stopWorkflowRun({
    required String name,
    required String runId,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
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
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.StopWorkflowRun'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'RunId': runId,
      },
    );
  }

  /// Adds tags to a resource. A tag is a label you can assign to an Amazon Web
  /// Services resource. In Glue, you can tag only certain resources. For
  /// information about what resources you can tag, see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/monitor-tags.html">Amazon
  /// Web Services Tags in Glue</a>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [EntityNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the Glue resource to which to add the tags. For more
  /// information about Glue resource ARNs, see the <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-api-common.html#aws-glue-api-regex-aws-glue-arn-id">Glue
  /// ARN string pattern</a>.
  ///
  /// Parameter [tagsToAdd] :
  /// Tags to add to this resource.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tagsToAdd,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      10240,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagsToAdd, 'tagsToAdd');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'TagsToAdd': tagsToAdd,
      },
    );
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
    required String resourceArn,
    required List<String> tagsToRemove,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      10240,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagsToRemove, 'tagsToRemove');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'TagsToRemove': tagsToRemove,
      },
    );
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
    UpdateCsvClassifierRequest? csvClassifier,
    UpdateGrokClassifierRequest? grokClassifier,
    UpdateJsonClassifierRequest? jsonClassifier,
    UpdateXMLClassifierRequest? xMLClassifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.UpdateClassifier'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (csvClassifier != null) 'CsvClassifier': csvClassifier,
        if (grokClassifier != null) 'GrokClassifier': grokClassifier,
        if (jsonClassifier != null) 'JsonClassifier': jsonClassifier,
        if (xMLClassifier != null) 'XMLClassifier': xMLClassifier,
      },
    );
  }

  /// Creates or updates partition statistics of columns.
  ///
  /// The Identity and Access Management (IAM) permission required for this
  /// operation is <code>UpdatePartition</code>.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [GlueEncryptionException].
  ///
  /// Parameter [columnStatisticsList] :
  /// A list of the column statistics.
  ///
  /// Parameter [databaseName] :
  /// The name of the catalog database where the partitions reside.
  ///
  /// Parameter [partitionValues] :
  /// A list of partition values identifying the partition.
  ///
  /// Parameter [tableName] :
  /// The name of the partitions' table.
  ///
  /// Parameter [catalogId] :
  /// The ID of the Data Catalog where the partitions in question reside. If
  /// none is supplied, the Amazon Web Services account ID is used by default.
  Future<UpdateColumnStatisticsForPartitionResponse>
      updateColumnStatisticsForPartition({
    required List<ColumnStatistics> columnStatisticsList,
    required String databaseName,
    required List<String> partitionValues,
    required String tableName,
    String? catalogId,
  }) async {
    ArgumentError.checkNotNull(columnStatisticsList, 'columnStatisticsList');
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
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
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.UpdateColumnStatisticsForPartition'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ColumnStatisticsList': columnStatisticsList,
        'DatabaseName': databaseName,
        'PartitionValues': partitionValues,
        'TableName': tableName,
        if (catalogId != null) 'CatalogId': catalogId,
      },
    );

    return UpdateColumnStatisticsForPartitionResponse.fromJson(
        jsonResponse.body);
  }

  /// Creates or updates table statistics of columns.
  ///
  /// The Identity and Access Management (IAM) permission required for this
  /// operation is <code>UpdateTable</code>.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [GlueEncryptionException].
  ///
  /// Parameter [columnStatisticsList] :
  /// A list of the column statistics.
  ///
  /// Parameter [databaseName] :
  /// The name of the catalog database where the partitions reside.
  ///
  /// Parameter [tableName] :
  /// The name of the partitions' table.
  ///
  /// Parameter [catalogId] :
  /// The ID of the Data Catalog where the partitions in question reside. If
  /// none is supplied, the Amazon Web Services account ID is used by default.
  Future<UpdateColumnStatisticsForTableResponse>
      updateColumnStatisticsForTable({
    required List<ColumnStatistics> columnStatisticsList,
    required String databaseName,
    required String tableName,
    String? catalogId,
  }) async {
    ArgumentError.checkNotNull(columnStatisticsList, 'columnStatisticsList');
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
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
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.UpdateColumnStatisticsForTable'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ColumnStatisticsList': columnStatisticsList,
        'DatabaseName': databaseName,
        'TableName': tableName,
        if (catalogId != null) 'CatalogId': catalogId,
      },
    );

    return UpdateColumnStatisticsForTableResponse.fromJson(jsonResponse.body);
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
  /// provided, the Amazon Web Services account ID is used by default.
  Future<void> updateConnection({
    required ConnectionInput connectionInput,
    required String name,
    String? catalogId,
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
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.UpdateConnection'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConnectionInput': connectionInput,
        'Name': name,
        if (catalogId != null) 'CatalogId': catalogId,
      },
    );
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
  /// Crawler configuration information. This versioned JSON string allows users
  /// to specify aspects of a crawler's behavior. For more information, see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/crawler-configuration.html">Configuring
  /// a Crawler</a>.
  ///
  /// Parameter [crawlerSecurityConfiguration] :
  /// The name of the <code>SecurityConfiguration</code> structure to be used by
  /// this crawler.
  ///
  /// Parameter [databaseName] :
  /// The Glue database where results are stored, such as:
  /// <code>arn:aws:daylight:us-east-1::database/sometable/*</code>.
  ///
  /// Parameter [description] :
  /// A description of the new crawler.
  ///
  /// Parameter [lineageConfiguration] :
  /// Specifies data lineage configuration settings for the crawler.
  ///
  /// Parameter [recrawlPolicy] :
  /// A policy that specifies whether to crawl the entire dataset again, or to
  /// crawl only folders that were added since the last crawler run.
  ///
  /// Parameter [role] :
  /// The IAM role or Amazon Resource Name (ARN) of an IAM role that is used by
  /// the new crawler to access customer resources.
  ///
  /// Parameter [schedule] :
  /// A <code>cron</code> expression used to specify the schedule (see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/monitor-data-warehouse-schedule.html">Time-Based
  /// Schedules for Jobs and Crawlers</a>. For example, to run something every
  /// day at 12:15 UTC, you would specify: <code>cron(15 12 * * ? *)</code>.
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
    required String name,
    List<String>? classifiers,
    String? configuration,
    String? crawlerSecurityConfiguration,
    String? databaseName,
    String? description,
    LineageConfiguration? lineageConfiguration,
    RecrawlPolicy? recrawlPolicy,
    String? role,
    String? schedule,
    SchemaChangePolicy? schemaChangePolicy,
    String? tablePrefix,
    CrawlerTargets? targets,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
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
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        if (classifiers != null) 'Classifiers': classifiers,
        if (configuration != null) 'Configuration': configuration,
        if (crawlerSecurityConfiguration != null)
          'CrawlerSecurityConfiguration': crawlerSecurityConfiguration,
        if (databaseName != null) 'DatabaseName': databaseName,
        if (description != null) 'Description': description,
        if (lineageConfiguration != null)
          'LineageConfiguration': lineageConfiguration,
        if (recrawlPolicy != null) 'RecrawlPolicy': recrawlPolicy,
        if (role != null) 'Role': role,
        if (schedule != null) 'Schedule': schedule,
        if (schemaChangePolicy != null)
          'SchemaChangePolicy': schemaChangePolicy,
        if (tablePrefix != null) 'TablePrefix': tablePrefix,
        if (targets != null) 'Targets': targets,
      },
    );
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
  /// The updated <code>cron</code> expression used to specify the schedule (see
  /// <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/monitor-data-warehouse-schedule.html">Time-Based
  /// Schedules for Jobs and Crawlers</a>. For example, to run something every
  /// day at 12:15 UTC, you would specify: <code>cron(15 12 * * ? *)</code>.
  Future<void> updateCrawlerSchedule({
    required String crawlerName,
    String? schedule,
  }) async {
    ArgumentError.checkNotNull(crawlerName, 'crawlerName');
    _s.validateStringLength(
      'crawlerName',
      crawlerName,
      1,
      255,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.UpdateCrawlerSchedule'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CrawlerName': crawlerName,
        if (schedule != null) 'Schedule': schedule,
      },
    );
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
  /// is provided, the Amazon Web Services account ID is used by default.
  Future<void> updateDatabase({
    required DatabaseInput databaseInput,
    required String name,
    String? catalogId,
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
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.UpdateDatabase'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatabaseInput': databaseInput,
        'Name': name,
        if (catalogId != null) 'CatalogId': catalogId,
      },
    );
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
    required String endpointName,
    Map<String, String>? addArguments,
    List<String>? addPublicKeys,
    DevEndpointCustomLibraries? customLibraries,
    List<String>? deleteArguments,
    List<String>? deletePublicKeys,
    String? publicKey,
    bool? updateEtlLibraries,
  }) async {
    ArgumentError.checkNotNull(endpointName, 'endpointName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.UpdateDevEndpoint'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EndpointName': endpointName,
        if (addArguments != null) 'AddArguments': addArguments,
        if (addPublicKeys != null) 'AddPublicKeys': addPublicKeys,
        if (customLibraries != null) 'CustomLibraries': customLibraries,
        if (deleteArguments != null) 'DeleteArguments': deleteArguments,
        if (deletePublicKeys != null) 'DeletePublicKeys': deletePublicKeys,
        if (publicKey != null) 'PublicKey': publicKey,
        if (updateEtlLibraries != null)
          'UpdateEtlLibraries': updateEtlLibraries,
      },
    );
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
    required String jobName,
    required JobUpdate jobUpdate,
  }) async {
    ArgumentError.checkNotNull(jobName, 'jobName');
    _s.validateStringLength(
      'jobName',
      jobName,
      1,
      255,
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
      payload: {
        'JobName': jobName,
        'JobUpdate': jobUpdate,
      },
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
  /// This value determines which version of Glue this machine learning
  /// transform is compatible with. Glue 1.0 is recommended for most customers.
  /// If the value is not set, the Glue compatibility defaults to Glue 0.9. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/release-notes.html#release-notes-versions">Glue
  /// Versions</a> in the developer guide.
  ///
  /// Parameter [maxCapacity] :
  /// The number of Glue data processing units (DPUs) that are allocated to task
  /// runs for this transform. You can allocate from 2 to 100 DPUs; the default
  /// is 10. A DPU is a relative measure of processing power that consists of 4
  /// vCPUs of compute capacity and 16 GB of memory. For more information, see
  /// the <a href="https://aws.amazon.com/glue/pricing/">Glue pricing page</a>.
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
    required String transformId,
    String? description,
    String? glueVersion,
    double? maxCapacity,
    int? maxRetries,
    String? name,
    int? numberOfWorkers,
    TransformParameters? parameters,
    String? role,
    int? timeout,
    WorkerType? workerType,
  }) async {
    ArgumentError.checkNotNull(transformId, 'transformId');
    _s.validateStringLength(
      'transformId',
      transformId,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      2048,
    );
    _s.validateStringLength(
      'glueVersion',
      glueVersion,
      1,
      255,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
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
      payload: {
        'TransformId': transformId,
        if (description != null) 'Description': description,
        if (glueVersion != null) 'GlueVersion': glueVersion,
        if (maxCapacity != null) 'MaxCapacity': maxCapacity,
        if (maxRetries != null) 'MaxRetries': maxRetries,
        if (name != null) 'Name': name,
        if (numberOfWorkers != null) 'NumberOfWorkers': numberOfWorkers,
        if (parameters != null) 'Parameters': parameters,
        if (role != null) 'Role': role,
        if (timeout != null) 'Timeout': timeout,
        if (workerType != null) 'WorkerType': workerType.toValue(),
      },
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
  /// The <code>Values</code> property can't be changed. If you want to change
  /// the partition key values for a partition, delete and recreate the
  /// partition.
  ///
  /// Parameter [partitionValueList] :
  /// List of partition key values that define the partition to update.
  ///
  /// Parameter [tableName] :
  /// The name of the table in which the partition to be updated is located.
  ///
  /// Parameter [catalogId] :
  /// The ID of the Data Catalog where the partition to be updated resides. If
  /// none is provided, the Amazon Web Services account ID is used by default.
  Future<void> updatePartition({
    required String databaseName,
    required PartitionInput partitionInput,
    required List<String> partitionValueList,
    required String tableName,
    String? catalogId,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
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
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.UpdatePartition'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatabaseName': databaseName,
        'PartitionInput': partitionInput,
        'PartitionValueList': partitionValueList,
        'TableName': tableName,
        if (catalogId != null) 'CatalogId': catalogId,
      },
    );
  }

  /// Updates an existing registry which is used to hold a collection of
  /// schemas. The updated properties relate to the registry, and do not modify
  /// any of the schemas within the registry.
  ///
  /// May throw [InvalidInputException].
  /// May throw [AccessDeniedException].
  /// May throw [EntityNotFoundException].
  /// May throw [ConcurrentModificationException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [description] :
  /// A description of the registry. If description is not provided, this field
  /// will not be updated.
  ///
  /// Parameter [registryId] :
  /// This is a wrapper structure that may contain the registry name and Amazon
  /// Resource Name (ARN).
  Future<UpdateRegistryResponse> updateRegistry({
    required String description,
    required RegistryId registryId,
  }) async {
    ArgumentError.checkNotNull(description, 'description');
    _s.validateStringLength(
      'description',
      description,
      0,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(registryId, 'registryId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.UpdateRegistry'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Description': description,
        'RegistryId': registryId,
      },
    );

    return UpdateRegistryResponse.fromJson(jsonResponse.body);
  }

  /// Updates the description, compatibility setting, or version checkpoint for
  /// a schema set.
  ///
  /// For updating the compatibility setting, the call will not validate
  /// compatibility for the entire set of schema versions with the new
  /// compatibility setting. If the value for <code>Compatibility</code> is
  /// provided, the <code>VersionNumber</code> (a checkpoint) is also required.
  /// The API will validate the checkpoint version number for consistency.
  ///
  /// If the value for the <code>VersionNumber</code> (checkpoint) is provided,
  /// <code>Compatibility</code> is optional and this can be used to set/reset a
  /// checkpoint for the schema.
  ///
  /// This update will happen only if the schema is in the AVAILABLE state.
  ///
  /// May throw [InvalidInputException].
  /// May throw [AccessDeniedException].
  /// May throw [EntityNotFoundException].
  /// May throw [ConcurrentModificationException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [schemaId] :
  /// This is a wrapper structure to contain schema identity fields. The
  /// structure contains:
  ///
  /// <ul>
  /// <li>
  /// SchemaId$SchemaArn: The Amazon Resource Name (ARN) of the schema. One of
  /// <code>SchemaArn</code> or <code>SchemaName</code> has to be provided.
  /// </li>
  /// <li>
  /// SchemaId$SchemaName: The name of the schema. One of <code>SchemaArn</code>
  /// or <code>SchemaName</code> has to be provided.
  /// </li>
  /// </ul>
  ///
  /// Parameter [compatibility] :
  /// The new compatibility setting for the schema.
  ///
  /// Parameter [description] :
  /// The new description for the schema.
  ///
  /// Parameter [schemaVersionNumber] :
  /// Version number required for check pointing. One of
  /// <code>VersionNumber</code> or <code>Compatibility</code> has to be
  /// provided.
  Future<UpdateSchemaResponse> updateSchema({
    required SchemaId schemaId,
    Compatibility? compatibility,
    String? description,
    SchemaVersionNumber? schemaVersionNumber,
  }) async {
    ArgumentError.checkNotNull(schemaId, 'schemaId');
    _s.validateStringLength(
      'description',
      description,
      0,
      2048,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.UpdateSchema'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SchemaId': schemaId,
        if (compatibility != null) 'Compatibility': compatibility.toValue(),
        if (description != null) 'Description': description,
        if (schemaVersionNumber != null)
          'SchemaVersionNumber': schemaVersionNumber,
      },
    );

    return UpdateSchemaResponse.fromJson(jsonResponse.body);
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
  /// the Amazon Web Services account ID is used by default.
  ///
  /// Parameter [skipArchive] :
  /// By default, <code>UpdateTable</code> always creates an archived version of
  /// the table before updating it. However, if <code>skipArchive</code> is set
  /// to true, <code>UpdateTable</code> does not create the archived version.
  Future<void> updateTable({
    required String databaseName,
    required TableInput tableInput,
    String? catalogId,
    bool? skipArchive,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tableInput, 'tableInput');
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.UpdateTable'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatabaseName': databaseName,
        'TableInput': tableInput,
        if (catalogId != null) 'CatalogId': catalogId,
        if (skipArchive != null) 'SkipArchive': skipArchive,
      },
    );
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
    required String name,
    required TriggerUpdate triggerUpdate,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
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
      payload: {
        'Name': name,
        'TriggerUpdate': triggerUpdate,
      },
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
  /// none is provided, the Amazon Web Services account ID is used by default.
  Future<void> updateUserDefinedFunction({
    required String databaseName,
    required UserDefinedFunctionInput functionInput,
    required String functionName,
    String? catalogId,
  }) async {
    ArgumentError.checkNotNull(databaseName, 'databaseName');
    _s.validateStringLength(
      'databaseName',
      databaseName,
      1,
      255,
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
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSGlue.UpdateUserDefinedFunction'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatabaseName': databaseName,
        'FunctionInput': functionInput,
        'FunctionName': functionName,
        if (catalogId != null) 'CatalogId': catalogId,
      },
    );
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
  ///
  /// Parameter [maxConcurrentRuns] :
  /// You can use this parameter to prevent unwanted multiple updates to data,
  /// to control costs, or in some cases, to prevent exceeding the maximum
  /// number of concurrent runs of any of the component jobs. If you leave this
  /// parameter blank, there is no limit to the number of concurrent workflow
  /// runs.
  Future<UpdateWorkflowResponse> updateWorkflow({
    required String name,
    Map<String, String>? defaultRunProperties,
    String? description,
    int? maxConcurrentRuns,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
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
      payload: {
        'Name': name,
        if (defaultRunProperties != null)
          'DefaultRunProperties': defaultRunProperties,
        if (description != null) 'Description': description,
        if (maxConcurrentRuns != null) 'MaxConcurrentRuns': maxConcurrentRuns,
      },
    );

    return UpdateWorkflowResponse.fromJson(jsonResponse.body);
  }
}

/// Defines an action to be initiated by a trigger.
class Action {
  /// The job arguments used when this trigger fires. For this job run, they
  /// replace the default arguments set in the job definition itself.
  ///
  /// You can specify arguments here that your own job-execution script consumes,
  /// as well as arguments that Glue itself consumes.
  ///
  /// For information about how to specify and consume your own Job arguments, see
  /// the <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-python-calling.html">Calling
  /// Glue APIs in Python</a> topic in the developer guide.
  ///
  /// For information about the key-value pairs that Glue consumes to set up your
  /// job, see the <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-etl-glue-arguments.html">Special
  /// Parameters Used by Glue</a> topic in the developer guide.
  final Map<String, String>? arguments;

  /// The name of the crawler to be used with this action.
  final String? crawlerName;

  /// The name of a job to be run.
  final String? jobName;

  /// Specifies configuration properties of a job run notification.
  final NotificationProperty? notificationProperty;

  /// The name of the <code>SecurityConfiguration</code> structure to be used with
  /// this action.
  final String? securityConfiguration;

  /// The <code>JobRun</code> timeout in minutes. This is the maximum time that a
  /// job run can consume resources before it is terminated and enters
  /// <code>TIMEOUT</code> status. The default is 2,880 minutes (48 hours). This
  /// overrides the timeout value set in the parent job.
  final int? timeout;

  Action({
    this.arguments,
    this.crawlerName,
    this.jobName,
    this.notificationProperty,
    this.securityConfiguration,
    this.timeout,
  });

  factory Action.fromJson(Map<String, dynamic> json) {
    return Action(
      arguments: (json['Arguments'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      crawlerName: json['CrawlerName'] as String?,
      jobName: json['JobName'] as String?,
      notificationProperty: json['NotificationProperty'] != null
          ? NotificationProperty.fromJson(
              json['NotificationProperty'] as Map<String, dynamic>)
          : null,
      securityConfiguration: json['SecurityConfiguration'] as String?,
      timeout: json['Timeout'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final arguments = this.arguments;
    final crawlerName = this.crawlerName;
    final jobName = this.jobName;
    final notificationProperty = this.notificationProperty;
    final securityConfiguration = this.securityConfiguration;
    final timeout = this.timeout;
    return {
      if (arguments != null) 'Arguments': arguments,
      if (crawlerName != null) 'CrawlerName': crawlerName,
      if (jobName != null) 'JobName': jobName,
      if (notificationProperty != null)
        'NotificationProperty': notificationProperty,
      if (securityConfiguration != null)
        'SecurityConfiguration': securityConfiguration,
      if (timeout != null) 'Timeout': timeout,
    };
  }
}

/// A list of errors that can occur when registering partition indexes for an
/// existing table.
///
/// These errors give the details about why an index registration failed and
/// provide a limited number of partitions in the response, so that you can fix
/// the partitions at fault and try registering the index again. The most common
/// set of errors that can occur are categorized as follows:
///
/// <ul>
/// <li>
/// EncryptedPartitionError: The partitions are encrypted.
/// </li>
/// <li>
/// InvalidPartitionTypeDataError: The partition value doesn't match the data
/// type for that partition column.
/// </li>
/// <li>
/// MissingPartitionValueError: The partitions are encrypted.
/// </li>
/// <li>
/// UnsupportedPartitionCharacterError: Characters inside the partition value
/// are not supported. For example: U+0000 , U+0001, U+0002.
/// </li>
/// <li>
/// InternalError: Any error which does not belong to other error codes.
/// </li>
/// </ul>
class BackfillError {
  /// The error code for an error that occurred when registering partition indexes
  /// for an existing table.
  final BackfillErrorCode? code;

  /// A list of a limited number of partitions in the response.
  final List<PartitionValueList>? partitions;

  BackfillError({
    this.code,
    this.partitions,
  });

  factory BackfillError.fromJson(Map<String, dynamic> json) {
    return BackfillError(
      code: (json['Code'] as String?)?.toBackfillErrorCode(),
      partitions: (json['Partitions'] as List?)
          ?.whereNotNull()
          .map((e) => PartitionValueList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final partitions = this.partitions;
    return {
      if (code != null) 'Code': code.toValue(),
      if (partitions != null) 'Partitions': partitions,
    };
  }
}

enum BackfillErrorCode {
  encryptedPartitionError,
  internalError,
  invalidPartitionTypeDataError,
  missingPartitionValueError,
  unsupportedPartitionCharacterError,
}

extension on BackfillErrorCode {
  String toValue() {
    switch (this) {
      case BackfillErrorCode.encryptedPartitionError:
        return 'ENCRYPTED_PARTITION_ERROR';
      case BackfillErrorCode.internalError:
        return 'INTERNAL_ERROR';
      case BackfillErrorCode.invalidPartitionTypeDataError:
        return 'INVALID_PARTITION_TYPE_DATA_ERROR';
      case BackfillErrorCode.missingPartitionValueError:
        return 'MISSING_PARTITION_VALUE_ERROR';
      case BackfillErrorCode.unsupportedPartitionCharacterError:
        return 'UNSUPPORTED_PARTITION_CHARACTER_ERROR';
    }
  }
}

extension on String {
  BackfillErrorCode toBackfillErrorCode() {
    switch (this) {
      case 'ENCRYPTED_PARTITION_ERROR':
        return BackfillErrorCode.encryptedPartitionError;
      case 'INTERNAL_ERROR':
        return BackfillErrorCode.internalError;
      case 'INVALID_PARTITION_TYPE_DATA_ERROR':
        return BackfillErrorCode.invalidPartitionTypeDataError;
      case 'MISSING_PARTITION_VALUE_ERROR':
        return BackfillErrorCode.missingPartitionValueError;
      case 'UNSUPPORTED_PARTITION_CHARACTER_ERROR':
        return BackfillErrorCode.unsupportedPartitionCharacterError;
    }
    throw Exception('$this is not known in enum BackfillErrorCode');
  }
}

class BatchCreatePartitionResponse {
  /// The errors encountered when trying to create the requested partitions.
  final List<PartitionError>? errors;

  BatchCreatePartitionResponse({
    this.errors,
  });

  factory BatchCreatePartitionResponse.fromJson(Map<String, dynamic> json) {
    return BatchCreatePartitionResponse(
      errors: (json['Errors'] as List?)
          ?.whereNotNull()
          .map((e) => PartitionError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    return {
      if (errors != null) 'Errors': errors,
    };
  }
}

class BatchDeleteConnectionResponse {
  /// A map of the names of connections that were not successfully deleted to
  /// error details.
  final Map<String, ErrorDetail>? errors;

  /// A list of names of the connection definitions that were successfully
  /// deleted.
  final List<String>? succeeded;

  BatchDeleteConnectionResponse({
    this.errors,
    this.succeeded,
  });

  factory BatchDeleteConnectionResponse.fromJson(Map<String, dynamic> json) {
    return BatchDeleteConnectionResponse(
      errors: (json['Errors'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, ErrorDetail.fromJson(e as Map<String, dynamic>))),
      succeeded: (json['Succeeded'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final succeeded = this.succeeded;
    return {
      if (errors != null) 'Errors': errors,
      if (succeeded != null) 'Succeeded': succeeded,
    };
  }
}

class BatchDeletePartitionResponse {
  /// The errors encountered when trying to delete the requested partitions.
  final List<PartitionError>? errors;

  BatchDeletePartitionResponse({
    this.errors,
  });

  factory BatchDeletePartitionResponse.fromJson(Map<String, dynamic> json) {
    return BatchDeletePartitionResponse(
      errors: (json['Errors'] as List?)
          ?.whereNotNull()
          .map((e) => PartitionError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    return {
      if (errors != null) 'Errors': errors,
    };
  }
}

class BatchDeleteTableResponse {
  /// A list of errors encountered in attempting to delete the specified tables.
  final List<TableError>? errors;

  BatchDeleteTableResponse({
    this.errors,
  });

  factory BatchDeleteTableResponse.fromJson(Map<String, dynamic> json) {
    return BatchDeleteTableResponse(
      errors: (json['Errors'] as List?)
          ?.whereNotNull()
          .map((e) => TableError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    return {
      if (errors != null) 'Errors': errors,
    };
  }
}

class BatchDeleteTableVersionResponse {
  /// A list of errors encountered while trying to delete the specified table
  /// versions.
  final List<TableVersionError>? errors;

  BatchDeleteTableVersionResponse({
    this.errors,
  });

  factory BatchDeleteTableVersionResponse.fromJson(Map<String, dynamic> json) {
    return BatchDeleteTableVersionResponse(
      errors: (json['Errors'] as List?)
          ?.whereNotNull()
          .map((e) => TableVersionError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    return {
      if (errors != null) 'Errors': errors,
    };
  }
}

class BatchGetCrawlersResponse {
  /// A list of crawler definitions.
  final List<Crawler>? crawlers;

  /// A list of names of crawlers that were not found.
  final List<String>? crawlersNotFound;

  BatchGetCrawlersResponse({
    this.crawlers,
    this.crawlersNotFound,
  });

  factory BatchGetCrawlersResponse.fromJson(Map<String, dynamic> json) {
    return BatchGetCrawlersResponse(
      crawlers: (json['Crawlers'] as List?)
          ?.whereNotNull()
          .map((e) => Crawler.fromJson(e as Map<String, dynamic>))
          .toList(),
      crawlersNotFound: (json['CrawlersNotFound'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final crawlers = this.crawlers;
    final crawlersNotFound = this.crawlersNotFound;
    return {
      if (crawlers != null) 'Crawlers': crawlers,
      if (crawlersNotFound != null) 'CrawlersNotFound': crawlersNotFound,
    };
  }
}

class BatchGetDevEndpointsResponse {
  /// A list of <code>DevEndpoint</code> definitions.
  final List<DevEndpoint>? devEndpoints;

  /// A list of <code>DevEndpoints</code> not found.
  final List<String>? devEndpointsNotFound;

  BatchGetDevEndpointsResponse({
    this.devEndpoints,
    this.devEndpointsNotFound,
  });

  factory BatchGetDevEndpointsResponse.fromJson(Map<String, dynamic> json) {
    return BatchGetDevEndpointsResponse(
      devEndpoints: (json['DevEndpoints'] as List?)
          ?.whereNotNull()
          .map((e) => DevEndpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      devEndpointsNotFound: (json['DevEndpointsNotFound'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final devEndpoints = this.devEndpoints;
    final devEndpointsNotFound = this.devEndpointsNotFound;
    return {
      if (devEndpoints != null) 'DevEndpoints': devEndpoints,
      if (devEndpointsNotFound != null)
        'DevEndpointsNotFound': devEndpointsNotFound,
    };
  }
}

class BatchGetJobsResponse {
  /// A list of job definitions.
  final List<Job>? jobs;

  /// A list of names of jobs not found.
  final List<String>? jobsNotFound;

  BatchGetJobsResponse({
    this.jobs,
    this.jobsNotFound,
  });

  factory BatchGetJobsResponse.fromJson(Map<String, dynamic> json) {
    return BatchGetJobsResponse(
      jobs: (json['Jobs'] as List?)
          ?.whereNotNull()
          .map((e) => Job.fromJson(e as Map<String, dynamic>))
          .toList(),
      jobsNotFound: (json['JobsNotFound'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final jobs = this.jobs;
    final jobsNotFound = this.jobsNotFound;
    return {
      if (jobs != null) 'Jobs': jobs,
      if (jobsNotFound != null) 'JobsNotFound': jobsNotFound,
    };
  }
}

class BatchGetPartitionResponse {
  /// A list of the requested partitions.
  final List<Partition>? partitions;

  /// A list of the partition values in the request for which partitions were not
  /// returned.
  final List<PartitionValueList>? unprocessedKeys;

  BatchGetPartitionResponse({
    this.partitions,
    this.unprocessedKeys,
  });

  factory BatchGetPartitionResponse.fromJson(Map<String, dynamic> json) {
    return BatchGetPartitionResponse(
      partitions: (json['Partitions'] as List?)
          ?.whereNotNull()
          .map((e) => Partition.fromJson(e as Map<String, dynamic>))
          .toList(),
      unprocessedKeys: (json['UnprocessedKeys'] as List?)
          ?.whereNotNull()
          .map((e) => PartitionValueList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final partitions = this.partitions;
    final unprocessedKeys = this.unprocessedKeys;
    return {
      if (partitions != null) 'Partitions': partitions,
      if (unprocessedKeys != null) 'UnprocessedKeys': unprocessedKeys,
    };
  }
}

class BatchGetTriggersResponse {
  /// A list of trigger definitions.
  final List<Trigger>? triggers;

  /// A list of names of triggers not found.
  final List<String>? triggersNotFound;

  BatchGetTriggersResponse({
    this.triggers,
    this.triggersNotFound,
  });

  factory BatchGetTriggersResponse.fromJson(Map<String, dynamic> json) {
    return BatchGetTriggersResponse(
      triggers: (json['Triggers'] as List?)
          ?.whereNotNull()
          .map((e) => Trigger.fromJson(e as Map<String, dynamic>))
          .toList(),
      triggersNotFound: (json['TriggersNotFound'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final triggers = this.triggers;
    final triggersNotFound = this.triggersNotFound;
    return {
      if (triggers != null) 'Triggers': triggers,
      if (triggersNotFound != null) 'TriggersNotFound': triggersNotFound,
    };
  }
}

class BatchGetWorkflowsResponse {
  /// A list of names of workflows not found.
  final List<String>? missingWorkflows;

  /// A list of workflow resource metadata.
  final List<Workflow>? workflows;

  BatchGetWorkflowsResponse({
    this.missingWorkflows,
    this.workflows,
  });

  factory BatchGetWorkflowsResponse.fromJson(Map<String, dynamic> json) {
    return BatchGetWorkflowsResponse(
      missingWorkflows: (json['MissingWorkflows'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      workflows: (json['Workflows'] as List?)
          ?.whereNotNull()
          .map((e) => Workflow.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final missingWorkflows = this.missingWorkflows;
    final workflows = this.workflows;
    return {
      if (missingWorkflows != null) 'MissingWorkflows': missingWorkflows,
      if (workflows != null) 'Workflows': workflows,
    };
  }
}

/// Records an error that occurred when attempting to stop a specified job run.
class BatchStopJobRunError {
  /// Specifies details about the error that was encountered.
  final ErrorDetail? errorDetail;

  /// The name of the job definition that is used in the job run in question.
  final String? jobName;

  /// The <code>JobRunId</code> of the job run in question.
  final String? jobRunId;

  BatchStopJobRunError({
    this.errorDetail,
    this.jobName,
    this.jobRunId,
  });

  factory BatchStopJobRunError.fromJson(Map<String, dynamic> json) {
    return BatchStopJobRunError(
      errorDetail: json['ErrorDetail'] != null
          ? ErrorDetail.fromJson(json['ErrorDetail'] as Map<String, dynamic>)
          : null,
      jobName: json['JobName'] as String?,
      jobRunId: json['JobRunId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorDetail = this.errorDetail;
    final jobName = this.jobName;
    final jobRunId = this.jobRunId;
    return {
      if (errorDetail != null) 'ErrorDetail': errorDetail,
      if (jobName != null) 'JobName': jobName,
      if (jobRunId != null) 'JobRunId': jobRunId,
    };
  }
}

class BatchStopJobRunResponse {
  /// A list of the errors that were encountered in trying to stop
  /// <code>JobRuns</code>, including the <code>JobRunId</code> for which each
  /// error was encountered and details about the error.
  final List<BatchStopJobRunError>? errors;

  /// A list of the JobRuns that were successfully submitted for stopping.
  final List<BatchStopJobRunSuccessfulSubmission>? successfulSubmissions;

  BatchStopJobRunResponse({
    this.errors,
    this.successfulSubmissions,
  });

  factory BatchStopJobRunResponse.fromJson(Map<String, dynamic> json) {
    return BatchStopJobRunResponse(
      errors: (json['Errors'] as List?)
          ?.whereNotNull()
          .map((e) => BatchStopJobRunError.fromJson(e as Map<String, dynamic>))
          .toList(),
      successfulSubmissions: (json['SuccessfulSubmissions'] as List?)
          ?.whereNotNull()
          .map((e) => BatchStopJobRunSuccessfulSubmission.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final successfulSubmissions = this.successfulSubmissions;
    return {
      if (errors != null) 'Errors': errors,
      if (successfulSubmissions != null)
        'SuccessfulSubmissions': successfulSubmissions,
    };
  }
}

/// Records a successful request to stop a specified <code>JobRun</code>.
class BatchStopJobRunSuccessfulSubmission {
  /// The name of the job definition used in the job run that was stopped.
  final String? jobName;

  /// The <code>JobRunId</code> of the job run that was stopped.
  final String? jobRunId;

  BatchStopJobRunSuccessfulSubmission({
    this.jobName,
    this.jobRunId,
  });

  factory BatchStopJobRunSuccessfulSubmission.fromJson(
      Map<String, dynamic> json) {
    return BatchStopJobRunSuccessfulSubmission(
      jobName: json['JobName'] as String?,
      jobRunId: json['JobRunId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobName = this.jobName;
    final jobRunId = this.jobRunId;
    return {
      if (jobName != null) 'JobName': jobName,
      if (jobRunId != null) 'JobRunId': jobRunId,
    };
  }
}

/// Contains information about a batch update partition error.
class BatchUpdatePartitionFailureEntry {
  /// The details about the batch update partition error.
  final ErrorDetail? errorDetail;

  /// A list of values defining the partitions.
  final List<String>? partitionValueList;

  BatchUpdatePartitionFailureEntry({
    this.errorDetail,
    this.partitionValueList,
  });

  factory BatchUpdatePartitionFailureEntry.fromJson(Map<String, dynamic> json) {
    return BatchUpdatePartitionFailureEntry(
      errorDetail: json['ErrorDetail'] != null
          ? ErrorDetail.fromJson(json['ErrorDetail'] as Map<String, dynamic>)
          : null,
      partitionValueList: (json['PartitionValueList'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errorDetail = this.errorDetail;
    final partitionValueList = this.partitionValueList;
    return {
      if (errorDetail != null) 'ErrorDetail': errorDetail,
      if (partitionValueList != null) 'PartitionValueList': partitionValueList,
    };
  }
}

/// A structure that contains the values and structure used to update a
/// partition.
class BatchUpdatePartitionRequestEntry {
  /// The structure used to update a partition.
  final PartitionInput partitionInput;

  /// A list of values defining the partitions.
  final List<String> partitionValueList;

  BatchUpdatePartitionRequestEntry({
    required this.partitionInput,
    required this.partitionValueList,
  });

  factory BatchUpdatePartitionRequestEntry.fromJson(Map<String, dynamic> json) {
    return BatchUpdatePartitionRequestEntry(
      partitionInput: PartitionInput.fromJson(
          json['PartitionInput'] as Map<String, dynamic>),
      partitionValueList: (json['PartitionValueList'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final partitionInput = this.partitionInput;
    final partitionValueList = this.partitionValueList;
    return {
      'PartitionInput': partitionInput,
      'PartitionValueList': partitionValueList,
    };
  }
}

class BatchUpdatePartitionResponse {
  /// The errors encountered when trying to update the requested partitions. A
  /// list of <code>BatchUpdatePartitionFailureEntry</code> objects.
  final List<BatchUpdatePartitionFailureEntry>? errors;

  BatchUpdatePartitionResponse({
    this.errors,
  });

  factory BatchUpdatePartitionResponse.fromJson(Map<String, dynamic> json) {
    return BatchUpdatePartitionResponse(
      errors: (json['Errors'] as List?)
          ?.whereNotNull()
          .map((e) => BatchUpdatePartitionFailureEntry.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    return {
      if (errors != null) 'Errors': errors,
    };
  }
}

/// Defines column statistics supported for bit sequence data values.
class BinaryColumnStatisticsData {
  /// The average bit sequence length in the column.
  final double averageLength;

  /// The size of the longest bit sequence in the column.
  final int maximumLength;

  /// The number of null values in the column.
  final int numberOfNulls;

  BinaryColumnStatisticsData({
    required this.averageLength,
    required this.maximumLength,
    required this.numberOfNulls,
  });

  factory BinaryColumnStatisticsData.fromJson(Map<String, dynamic> json) {
    return BinaryColumnStatisticsData(
      averageLength: json['AverageLength'] as double,
      maximumLength: json['MaximumLength'] as int,
      numberOfNulls: json['NumberOfNulls'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final averageLength = this.averageLength;
    final maximumLength = this.maximumLength;
    final numberOfNulls = this.numberOfNulls;
    return {
      'AverageLength': averageLength,
      'MaximumLength': maximumLength,
      'NumberOfNulls': numberOfNulls,
    };
  }
}

/// Defines column statistics supported for Boolean data columns.
class BooleanColumnStatisticsData {
  /// The number of false values in the column.
  final int numberOfFalses;

  /// The number of null values in the column.
  final int numberOfNulls;

  /// The number of true values in the column.
  final int numberOfTrues;

  BooleanColumnStatisticsData({
    required this.numberOfFalses,
    required this.numberOfNulls,
    required this.numberOfTrues,
  });

  factory BooleanColumnStatisticsData.fromJson(Map<String, dynamic> json) {
    return BooleanColumnStatisticsData(
      numberOfFalses: json['NumberOfFalses'] as int,
      numberOfNulls: json['NumberOfNulls'] as int,
      numberOfTrues: json['NumberOfTrues'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final numberOfFalses = this.numberOfFalses;
    final numberOfNulls = this.numberOfNulls;
    final numberOfTrues = this.numberOfTrues;
    return {
      'NumberOfFalses': numberOfFalses,
      'NumberOfNulls': numberOfNulls,
      'NumberOfTrues': numberOfTrues,
    };
  }
}

class CancelMLTaskRunResponse {
  /// The status for this run.
  final TaskStatusType? status;

  /// The unique identifier for the task run.
  final String? taskRunId;

  /// The unique identifier of the machine learning transform.
  final String? transformId;

  CancelMLTaskRunResponse({
    this.status,
    this.taskRunId,
    this.transformId,
  });

  factory CancelMLTaskRunResponse.fromJson(Map<String, dynamic> json) {
    return CancelMLTaskRunResponse(
      status: (json['Status'] as String?)?.toTaskStatusType(),
      taskRunId: json['TaskRunId'] as String?,
      transformId: json['TransformId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final taskRunId = this.taskRunId;
    final transformId = this.transformId;
    return {
      if (status != null) 'Status': status.toValue(),
      if (taskRunId != null) 'TaskRunId': taskRunId,
      if (transformId != null) 'TransformId': transformId,
    };
  }
}

enum CatalogEncryptionMode {
  disabled,
  sseKms,
}

extension on CatalogEncryptionMode {
  String toValue() {
    switch (this) {
      case CatalogEncryptionMode.disabled:
        return 'DISABLED';
      case CatalogEncryptionMode.sseKms:
        return 'SSE-KMS';
    }
  }
}

extension on String {
  CatalogEncryptionMode toCatalogEncryptionMode() {
    switch (this) {
      case 'DISABLED':
        return CatalogEncryptionMode.disabled;
      case 'SSE-KMS':
        return CatalogEncryptionMode.sseKms;
    }
    throw Exception('$this is not known in enum CatalogEncryptionMode');
  }
}

/// Specifies a table definition in the Glue Data Catalog.
class CatalogEntry {
  /// The database in which the table metadata resides.
  final String databaseName;

  /// The name of the table in question.
  final String tableName;

  CatalogEntry({
    required this.databaseName,
    required this.tableName,
  });

  factory CatalogEntry.fromJson(Map<String, dynamic> json) {
    return CatalogEntry(
      databaseName: json['DatabaseName'] as String,
      tableName: json['TableName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final databaseName = this.databaseName;
    final tableName = this.tableName;
    return {
      'DatabaseName': databaseName,
      'TableName': tableName,
    };
  }
}

/// A structure containing migration status information.
class CatalogImportStatus {
  /// <code>True</code> if the migration has completed, or <code>False</code>
  /// otherwise.
  final bool? importCompleted;

  /// The time that the migration was started.
  final DateTime? importTime;

  /// The name of the person who initiated the migration.
  final String? importedBy;

  CatalogImportStatus({
    this.importCompleted,
    this.importTime,
    this.importedBy,
  });

  factory CatalogImportStatus.fromJson(Map<String, dynamic> json) {
    return CatalogImportStatus(
      importCompleted: json['ImportCompleted'] as bool?,
      importTime: timeStampFromJson(json['ImportTime']),
      importedBy: json['ImportedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final importCompleted = this.importCompleted;
    final importTime = this.importTime;
    final importedBy = this.importedBy;
    return {
      if (importCompleted != null) 'ImportCompleted': importCompleted,
      if (importTime != null) 'ImportTime': unixTimestampToJson(importTime),
      if (importedBy != null) 'ImportedBy': importedBy,
    };
  }
}

/// Specifies an Glue Data Catalog target.
class CatalogTarget {
  /// The name of the database to be synchronized.
  final String databaseName;

  /// A list of the tables to be synchronized.
  final List<String> tables;

  CatalogTarget({
    required this.databaseName,
    required this.tables,
  });

  factory CatalogTarget.fromJson(Map<String, dynamic> json) {
    return CatalogTarget(
      databaseName: json['DatabaseName'] as String,
      tables: (json['Tables'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final databaseName = this.databaseName;
    final tables = this.tables;
    return {
      'DatabaseName': databaseName,
      'Tables': tables,
    };
  }
}

class CheckSchemaVersionValidityResponse {
  /// A validation failure error message.
  final String? error;

  /// Return true, if the schema is valid and false otherwise.
  final bool? valid;

  CheckSchemaVersionValidityResponse({
    this.error,
    this.valid,
  });

  factory CheckSchemaVersionValidityResponse.fromJson(
      Map<String, dynamic> json) {
    return CheckSchemaVersionValidityResponse(
      error: json['Error'] as String?,
      valid: json['Valid'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final error = this.error;
    final valid = this.valid;
    return {
      if (error != null) 'Error': error,
      if (valid != null) 'Valid': valid,
    };
  }
}

/// Classifiers are triggered during a crawl task. A classifier checks whether a
/// given file is in a format it can handle. If it is, the classifier creates a
/// schema in the form of a <code>StructType</code> object that matches that
/// data format.
///
/// You can use the standard classifiers that Glue provides, or you can write
/// your own classifiers to best categorize your data sources and specify the
/// appropriate schemas to use for them. A classifier can be a <code>grok</code>
/// classifier, an <code>XML</code> classifier, a <code>JSON</code> classifier,
/// or a custom <code>CSV</code> classifier, as specified in one of the fields
/// in the <code>Classifier</code> object.
class Classifier {
  /// A classifier for comma-separated values (CSV).
  final CsvClassifier? csvClassifier;

  /// A classifier that uses <code>grok</code>.
  final GrokClassifier? grokClassifier;

  /// A classifier for JSON content.
  final JsonClassifier? jsonClassifier;

  /// A classifier for XML content.
  final XMLClassifier? xMLClassifier;

  Classifier({
    this.csvClassifier,
    this.grokClassifier,
    this.jsonClassifier,
    this.xMLClassifier,
  });

  factory Classifier.fromJson(Map<String, dynamic> json) {
    return Classifier(
      csvClassifier: json['CsvClassifier'] != null
          ? CsvClassifier.fromJson(
              json['CsvClassifier'] as Map<String, dynamic>)
          : null,
      grokClassifier: json['GrokClassifier'] != null
          ? GrokClassifier.fromJson(
              json['GrokClassifier'] as Map<String, dynamic>)
          : null,
      jsonClassifier: json['JsonClassifier'] != null
          ? JsonClassifier.fromJson(
              json['JsonClassifier'] as Map<String, dynamic>)
          : null,
      xMLClassifier: json['XMLClassifier'] != null
          ? XMLClassifier.fromJson(
              json['XMLClassifier'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final csvClassifier = this.csvClassifier;
    final grokClassifier = this.grokClassifier;
    final jsonClassifier = this.jsonClassifier;
    final xMLClassifier = this.xMLClassifier;
    return {
      if (csvClassifier != null) 'CsvClassifier': csvClassifier,
      if (grokClassifier != null) 'GrokClassifier': grokClassifier,
      if (jsonClassifier != null) 'JsonClassifier': jsonClassifier,
      if (xMLClassifier != null) 'XMLClassifier': xMLClassifier,
    };
  }
}

/// Specifies how Amazon CloudWatch data should be encrypted.
class CloudWatchEncryption {
  /// The encryption mode to use for CloudWatch data.
  final CloudWatchEncryptionMode? cloudWatchEncryptionMode;

  /// The Amazon Resource Name (ARN) of the KMS key to be used to encrypt the
  /// data.
  final String? kmsKeyArn;

  CloudWatchEncryption({
    this.cloudWatchEncryptionMode,
    this.kmsKeyArn,
  });

  factory CloudWatchEncryption.fromJson(Map<String, dynamic> json) {
    return CloudWatchEncryption(
      cloudWatchEncryptionMode: (json['CloudWatchEncryptionMode'] as String?)
          ?.toCloudWatchEncryptionMode(),
      kmsKeyArn: json['KmsKeyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchEncryptionMode = this.cloudWatchEncryptionMode;
    final kmsKeyArn = this.kmsKeyArn;
    return {
      if (cloudWatchEncryptionMode != null)
        'CloudWatchEncryptionMode': cloudWatchEncryptionMode.toValue(),
      if (kmsKeyArn != null) 'KmsKeyArn': kmsKeyArn,
    };
  }
}

enum CloudWatchEncryptionMode {
  disabled,
  sseKms,
}

extension on CloudWatchEncryptionMode {
  String toValue() {
    switch (this) {
      case CloudWatchEncryptionMode.disabled:
        return 'DISABLED';
      case CloudWatchEncryptionMode.sseKms:
        return 'SSE-KMS';
    }
  }
}

extension on String {
  CloudWatchEncryptionMode toCloudWatchEncryptionMode() {
    switch (this) {
      case 'DISABLED':
        return CloudWatchEncryptionMode.disabled;
      case 'SSE-KMS':
        return CloudWatchEncryptionMode.sseKms;
    }
    throw Exception('$this is not known in enum CloudWatchEncryptionMode');
  }
}

/// Represents a directional edge in a directed acyclic graph (DAG).
class CodeGenEdge {
  /// The ID of the node at which the edge starts.
  final String source;

  /// The ID of the node at which the edge ends.
  final String target;

  /// The target of the edge.
  final String? targetParameter;

  CodeGenEdge({
    required this.source,
    required this.target,
    this.targetParameter,
  });

  factory CodeGenEdge.fromJson(Map<String, dynamic> json) {
    return CodeGenEdge(
      source: json['Source'] as String,
      target: json['Target'] as String,
      targetParameter: json['TargetParameter'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final source = this.source;
    final target = this.target;
    final targetParameter = this.targetParameter;
    return {
      'Source': source,
      'Target': target,
      if (targetParameter != null) 'TargetParameter': targetParameter,
    };
  }
}

/// Represents a node in a directed acyclic graph (DAG)
class CodeGenNode {
  /// Properties of the node, in the form of name-value pairs.
  final List<CodeGenNodeArg> args;

  /// A node identifier that is unique within the node's graph.
  final String id;

  /// The type of node that this is.
  final String nodeType;

  /// The line number of the node.
  final int? lineNumber;

  CodeGenNode({
    required this.args,
    required this.id,
    required this.nodeType,
    this.lineNumber,
  });

  factory CodeGenNode.fromJson(Map<String, dynamic> json) {
    return CodeGenNode(
      args: (json['Args'] as List)
          .whereNotNull()
          .map((e) => CodeGenNodeArg.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['Id'] as String,
      nodeType: json['NodeType'] as String,
      lineNumber: json['LineNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final args = this.args;
    final id = this.id;
    final nodeType = this.nodeType;
    final lineNumber = this.lineNumber;
    return {
      'Args': args,
      'Id': id,
      'NodeType': nodeType,
      if (lineNumber != null) 'LineNumber': lineNumber,
    };
  }
}

/// An argument or property of a node.
class CodeGenNodeArg {
  /// The name of the argument or property.
  final String name;

  /// The value of the argument or property.
  final String value;

  /// True if the value is used as a parameter.
  final bool? param;

  CodeGenNodeArg({
    required this.name,
    required this.value,
    this.param,
  });

  factory CodeGenNodeArg.fromJson(Map<String, dynamic> json) {
    return CodeGenNodeArg(
      name: json['Name'] as String,
      value: json['Value'] as String,
      param: json['Param'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    final param = this.param;
    return {
      'Name': name,
      'Value': value,
      if (param != null) 'Param': param,
    };
  }
}

/// A column in a <code>Table</code>.
class Column {
  /// The name of the <code>Column</code>.
  final String name;

  /// A free-form text comment.
  final String? comment;

  /// These key-value pairs define properties associated with the column.
  final Map<String, String>? parameters;

  /// The data type of the <code>Column</code>.
  final String? type;

  Column({
    required this.name,
    this.comment,
    this.parameters,
    this.type,
  });

  factory Column.fromJson(Map<String, dynamic> json) {
    return Column(
      name: json['Name'] as String,
      comment: json['Comment'] as String?,
      parameters: (json['Parameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final comment = this.comment;
    final parameters = this.parameters;
    final type = this.type;
    return {
      'Name': name,
      if (comment != null) 'Comment': comment,
      if (parameters != null) 'Parameters': parameters,
      if (type != null) 'Type': type,
    };
  }
}

/// Encapsulates a column name that failed and the reason for failure.
class ColumnError {
  /// The name of the column that failed.
  final String? columnName;

  /// An error message with the reason for the failure of an operation.
  final ErrorDetail? error;

  ColumnError({
    this.columnName,
    this.error,
  });

  factory ColumnError.fromJson(Map<String, dynamic> json) {
    return ColumnError(
      columnName: json['ColumnName'] as String?,
      error: json['Error'] != null
          ? ErrorDetail.fromJson(json['Error'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final columnName = this.columnName;
    final error = this.error;
    return {
      if (columnName != null) 'ColumnName': columnName,
      if (error != null) 'Error': error,
    };
  }
}

/// A structure containing the column name and column importance score for a
/// column.
///
/// Column importance helps you understand how columns contribute to your model,
/// by identifying which columns in your records are more important than others.
class ColumnImportance {
  /// The name of a column.
  final String? columnName;

  /// The column importance score for the column, as a decimal.
  final double? importance;

  ColumnImportance({
    this.columnName,
    this.importance,
  });

  factory ColumnImportance.fromJson(Map<String, dynamic> json) {
    return ColumnImportance(
      columnName: json['ColumnName'] as String?,
      importance: json['Importance'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final columnName = this.columnName;
    final importance = this.importance;
    return {
      if (columnName != null) 'ColumnName': columnName,
      if (importance != null) 'Importance': importance,
    };
  }
}

/// Represents the generated column-level statistics for a table or partition.
class ColumnStatistics {
  /// The timestamp of when column statistics were generated.
  final DateTime analyzedTime;

  /// Name of column which statistics belong to.
  final String columnName;

  /// The data type of the column.
  final String columnType;

  /// A <code>ColumnStatisticData</code> object that contains the statistics data
  /// values.
  final ColumnStatisticsData statisticsData;

  ColumnStatistics({
    required this.analyzedTime,
    required this.columnName,
    required this.columnType,
    required this.statisticsData,
  });

  factory ColumnStatistics.fromJson(Map<String, dynamic> json) {
    return ColumnStatistics(
      analyzedTime:
          nonNullableTimeStampFromJson(json['AnalyzedTime'] as Object),
      columnName: json['ColumnName'] as String,
      columnType: json['ColumnType'] as String,
      statisticsData: ColumnStatisticsData.fromJson(
          json['StatisticsData'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final analyzedTime = this.analyzedTime;
    final columnName = this.columnName;
    final columnType = this.columnType;
    final statisticsData = this.statisticsData;
    return {
      'AnalyzedTime': unixTimestampToJson(analyzedTime),
      'ColumnName': columnName,
      'ColumnType': columnType,
      'StatisticsData': statisticsData,
    };
  }
}

/// Contains the individual types of column statistics data. Only one data
/// object should be set and indicated by the <code>Type</code> attribute.
class ColumnStatisticsData {
  /// The type of column statistics data.
  final ColumnStatisticsType type;

  /// Binary column statistics data.
  final BinaryColumnStatisticsData? binaryColumnStatisticsData;

  /// Boolean column statistics data.
  final BooleanColumnStatisticsData? booleanColumnStatisticsData;

  /// Date column statistics data.
  final DateColumnStatisticsData? dateColumnStatisticsData;

  /// Decimal column statistics data.
  final DecimalColumnStatisticsData? decimalColumnStatisticsData;

  /// Double column statistics data.
  final DoubleColumnStatisticsData? doubleColumnStatisticsData;

  /// Long column statistics data.
  final LongColumnStatisticsData? longColumnStatisticsData;

  /// String column statistics data.
  final StringColumnStatisticsData? stringColumnStatisticsData;

  ColumnStatisticsData({
    required this.type,
    this.binaryColumnStatisticsData,
    this.booleanColumnStatisticsData,
    this.dateColumnStatisticsData,
    this.decimalColumnStatisticsData,
    this.doubleColumnStatisticsData,
    this.longColumnStatisticsData,
    this.stringColumnStatisticsData,
  });

  factory ColumnStatisticsData.fromJson(Map<String, dynamic> json) {
    return ColumnStatisticsData(
      type: (json['Type'] as String).toColumnStatisticsType(),
      binaryColumnStatisticsData: json['BinaryColumnStatisticsData'] != null
          ? BinaryColumnStatisticsData.fromJson(
              json['BinaryColumnStatisticsData'] as Map<String, dynamic>)
          : null,
      booleanColumnStatisticsData: json['BooleanColumnStatisticsData'] != null
          ? BooleanColumnStatisticsData.fromJson(
              json['BooleanColumnStatisticsData'] as Map<String, dynamic>)
          : null,
      dateColumnStatisticsData: json['DateColumnStatisticsData'] != null
          ? DateColumnStatisticsData.fromJson(
              json['DateColumnStatisticsData'] as Map<String, dynamic>)
          : null,
      decimalColumnStatisticsData: json['DecimalColumnStatisticsData'] != null
          ? DecimalColumnStatisticsData.fromJson(
              json['DecimalColumnStatisticsData'] as Map<String, dynamic>)
          : null,
      doubleColumnStatisticsData: json['DoubleColumnStatisticsData'] != null
          ? DoubleColumnStatisticsData.fromJson(
              json['DoubleColumnStatisticsData'] as Map<String, dynamic>)
          : null,
      longColumnStatisticsData: json['LongColumnStatisticsData'] != null
          ? LongColumnStatisticsData.fromJson(
              json['LongColumnStatisticsData'] as Map<String, dynamic>)
          : null,
      stringColumnStatisticsData: json['StringColumnStatisticsData'] != null
          ? StringColumnStatisticsData.fromJson(
              json['StringColumnStatisticsData'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final binaryColumnStatisticsData = this.binaryColumnStatisticsData;
    final booleanColumnStatisticsData = this.booleanColumnStatisticsData;
    final dateColumnStatisticsData = this.dateColumnStatisticsData;
    final decimalColumnStatisticsData = this.decimalColumnStatisticsData;
    final doubleColumnStatisticsData = this.doubleColumnStatisticsData;
    final longColumnStatisticsData = this.longColumnStatisticsData;
    final stringColumnStatisticsData = this.stringColumnStatisticsData;
    return {
      'Type': type.toValue(),
      if (binaryColumnStatisticsData != null)
        'BinaryColumnStatisticsData': binaryColumnStatisticsData,
      if (booleanColumnStatisticsData != null)
        'BooleanColumnStatisticsData': booleanColumnStatisticsData,
      if (dateColumnStatisticsData != null)
        'DateColumnStatisticsData': dateColumnStatisticsData,
      if (decimalColumnStatisticsData != null)
        'DecimalColumnStatisticsData': decimalColumnStatisticsData,
      if (doubleColumnStatisticsData != null)
        'DoubleColumnStatisticsData': doubleColumnStatisticsData,
      if (longColumnStatisticsData != null)
        'LongColumnStatisticsData': longColumnStatisticsData,
      if (stringColumnStatisticsData != null)
        'StringColumnStatisticsData': stringColumnStatisticsData,
    };
  }
}

/// Encapsulates a <code>ColumnStatistics</code> object that failed and the
/// reason for failure.
class ColumnStatisticsError {
  /// The <code>ColumnStatistics</code> of the column.
  final ColumnStatistics? columnStatistics;

  /// An error message with the reason for the failure of an operation.
  final ErrorDetail? error;

  ColumnStatisticsError({
    this.columnStatistics,
    this.error,
  });

  factory ColumnStatisticsError.fromJson(Map<String, dynamic> json) {
    return ColumnStatisticsError(
      columnStatistics: json['ColumnStatistics'] != null
          ? ColumnStatistics.fromJson(
              json['ColumnStatistics'] as Map<String, dynamic>)
          : null,
      error: json['Error'] != null
          ? ErrorDetail.fromJson(json['Error'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final columnStatistics = this.columnStatistics;
    final error = this.error;
    return {
      if (columnStatistics != null) 'ColumnStatistics': columnStatistics,
      if (error != null) 'Error': error,
    };
  }
}

enum ColumnStatisticsType {
  boolean,
  date,
  decimal,
  double,
  long,
  string,
  binary,
}

extension on ColumnStatisticsType {
  String toValue() {
    switch (this) {
      case ColumnStatisticsType.boolean:
        return 'BOOLEAN';
      case ColumnStatisticsType.date:
        return 'DATE';
      case ColumnStatisticsType.decimal:
        return 'DECIMAL';
      case ColumnStatisticsType.double:
        return 'DOUBLE';
      case ColumnStatisticsType.long:
        return 'LONG';
      case ColumnStatisticsType.string:
        return 'STRING';
      case ColumnStatisticsType.binary:
        return 'BINARY';
    }
  }
}

extension on String {
  ColumnStatisticsType toColumnStatisticsType() {
    switch (this) {
      case 'BOOLEAN':
        return ColumnStatisticsType.boolean;
      case 'DATE':
        return ColumnStatisticsType.date;
      case 'DECIMAL':
        return ColumnStatisticsType.decimal;
      case 'DOUBLE':
        return ColumnStatisticsType.double;
      case 'LONG':
        return ColumnStatisticsType.long;
      case 'STRING':
        return ColumnStatisticsType.string;
      case 'BINARY':
        return ColumnStatisticsType.binary;
    }
    throw Exception('$this is not known in enum ColumnStatisticsType');
  }
}

enum Comparator {
  equals,
  greaterThan,
  lessThan,
  greaterThanEquals,
  lessThanEquals,
}

extension on Comparator {
  String toValue() {
    switch (this) {
      case Comparator.equals:
        return 'EQUALS';
      case Comparator.greaterThan:
        return 'GREATER_THAN';
      case Comparator.lessThan:
        return 'LESS_THAN';
      case Comparator.greaterThanEquals:
        return 'GREATER_THAN_EQUALS';
      case Comparator.lessThanEquals:
        return 'LESS_THAN_EQUALS';
    }
  }
}

extension on String {
  Comparator toComparator() {
    switch (this) {
      case 'EQUALS':
        return Comparator.equals;
      case 'GREATER_THAN':
        return Comparator.greaterThan;
      case 'LESS_THAN':
        return Comparator.lessThan;
      case 'GREATER_THAN_EQUALS':
        return Comparator.greaterThanEquals;
      case 'LESS_THAN_EQUALS':
        return Comparator.lessThanEquals;
    }
    throw Exception('$this is not known in enum Comparator');
  }
}

enum Compatibility {
  none,
  disabled,
  backward,
  backwardAll,
  forward,
  forwardAll,
  full,
  fullAll,
}

extension on Compatibility {
  String toValue() {
    switch (this) {
      case Compatibility.none:
        return 'NONE';
      case Compatibility.disabled:
        return 'DISABLED';
      case Compatibility.backward:
        return 'BACKWARD';
      case Compatibility.backwardAll:
        return 'BACKWARD_ALL';
      case Compatibility.forward:
        return 'FORWARD';
      case Compatibility.forwardAll:
        return 'FORWARD_ALL';
      case Compatibility.full:
        return 'FULL';
      case Compatibility.fullAll:
        return 'FULL_ALL';
    }
  }
}

extension on String {
  Compatibility toCompatibility() {
    switch (this) {
      case 'NONE':
        return Compatibility.none;
      case 'DISABLED':
        return Compatibility.disabled;
      case 'BACKWARD':
        return Compatibility.backward;
      case 'BACKWARD_ALL':
        return Compatibility.backwardAll;
      case 'FORWARD':
        return Compatibility.forward;
      case 'FORWARD_ALL':
        return Compatibility.forwardAll;
      case 'FULL':
        return Compatibility.full;
      case 'FULL_ALL':
        return Compatibility.fullAll;
    }
    throw Exception('$this is not known in enum Compatibility');
  }
}

/// Defines a condition under which a trigger fires.
class Condition {
  /// The state of the crawler to which this condition applies.
  final CrawlState? crawlState;

  /// The name of the crawler to which this condition applies.
  final String? crawlerName;

  /// The name of the job whose <code>JobRuns</code> this condition applies to,
  /// and on which this trigger waits.
  final String? jobName;

  /// A logical operator.
  final LogicalOperator? logicalOperator;

  /// The condition state. Currently, the only job states that a trigger can
  /// listen for are <code>SUCCEEDED</code>, <code>STOPPED</code>,
  /// <code>FAILED</code>, and <code>TIMEOUT</code>. The only crawler states that
  /// a trigger can listen for are <code>SUCCEEDED</code>, <code>FAILED</code>,
  /// and <code>CANCELLED</code>.
  final JobRunState? state;

  Condition({
    this.crawlState,
    this.crawlerName,
    this.jobName,
    this.logicalOperator,
    this.state,
  });

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      crawlState: (json['CrawlState'] as String?)?.toCrawlState(),
      crawlerName: json['CrawlerName'] as String?,
      jobName: json['JobName'] as String?,
      logicalOperator:
          (json['LogicalOperator'] as String?)?.toLogicalOperator(),
      state: (json['State'] as String?)?.toJobRunState(),
    );
  }

  Map<String, dynamic> toJson() {
    final crawlState = this.crawlState;
    final crawlerName = this.crawlerName;
    final jobName = this.jobName;
    final logicalOperator = this.logicalOperator;
    final state = this.state;
    return {
      if (crawlState != null) 'CrawlState': crawlState.toValue(),
      if (crawlerName != null) 'CrawlerName': crawlerName,
      if (jobName != null) 'JobName': jobName,
      if (logicalOperator != null) 'LogicalOperator': logicalOperator.toValue(),
      if (state != null) 'State': state.toValue(),
    };
  }
}

/// The confusion matrix shows you what your transform is predicting accurately
/// and what types of errors it is making.
///
/// For more information, see <a
/// href="https://en.wikipedia.org/wiki/Confusion_matrix">Confusion matrix</a>
/// in Wikipedia.
class ConfusionMatrix {
  /// The number of matches in the data that the transform didn't find, in the
  /// confusion matrix for your transform.
  final int? numFalseNegatives;

  /// The number of nonmatches in the data that the transform incorrectly
  /// classified as a match, in the confusion matrix for your transform.
  final int? numFalsePositives;

  /// The number of nonmatches in the data that the transform correctly rejected,
  /// in the confusion matrix for your transform.
  final int? numTrueNegatives;

  /// The number of matches in the data that the transform correctly found, in the
  /// confusion matrix for your transform.
  final int? numTruePositives;

  ConfusionMatrix({
    this.numFalseNegatives,
    this.numFalsePositives,
    this.numTrueNegatives,
    this.numTruePositives,
  });

  factory ConfusionMatrix.fromJson(Map<String, dynamic> json) {
    return ConfusionMatrix(
      numFalseNegatives: json['NumFalseNegatives'] as int?,
      numFalsePositives: json['NumFalsePositives'] as int?,
      numTrueNegatives: json['NumTrueNegatives'] as int?,
      numTruePositives: json['NumTruePositives'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final numFalseNegatives = this.numFalseNegatives;
    final numFalsePositives = this.numFalsePositives;
    final numTrueNegatives = this.numTrueNegatives;
    final numTruePositives = this.numTruePositives;
    return {
      if (numFalseNegatives != null) 'NumFalseNegatives': numFalseNegatives,
      if (numFalsePositives != null) 'NumFalsePositives': numFalsePositives,
      if (numTrueNegatives != null) 'NumTrueNegatives': numTrueNegatives,
      if (numTruePositives != null) 'NumTruePositives': numTruePositives,
    };
  }
}

/// Defines a connection to a data source.
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
  /// customer's root certificate. Glue uses this root certificate to validate the
  /// customer’s certificate when connecting to the customer database. Glue only
  /// handles X.509 certificates. The certificate provided must be DER-encoded and
  /// supplied in Base64 encoding PEM format.
  /// </li>
  /// <li>
  /// <code>SKIP_CUSTOM_JDBC_CERT_VALIDATION</code> - By default, this is
  /// <code>false</code>. Glue validates the Signature algorithm and Subject
  /// Public Key Algorithm for the customer certificate. The only permitted
  /// algorithms for the Signature algorithm are SHA256withRSA, SHA384withRSA or
  /// SHA512withRSA. For the Subject Public Key Algorithm, the key length must be
  /// at least 2048. You can set the value of this property to <code>true</code>
  /// to skip Glue’s validation of the customer certificate.
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
  /// <li>
  /// <code>KAFKA_SSL_ENABLED</code> - Whether to enable or disable SSL on an
  /// Apache Kafka connection. Default value is "true".
  /// </li>
  /// <li>
  /// <code>KAFKA_CUSTOM_CERT</code> - The Amazon S3 URL for the private CA cert
  /// file (.pem format). The default is an empty string.
  /// </li>
  /// <li>
  /// <code>KAFKA_SKIP_CUSTOM_CERT_VALIDATION</code> - Whether to skip the
  /// validation of the CA cert file or not. Glue validates for three algorithms:
  /// SHA256withRSA, SHA384withRSA and SHA512withRSA. Default value is "false".
  /// </li>
  /// <li>
  /// <code>SECRET_ID</code> - The secret ID used for the secret manager of
  /// credentials.
  /// </li>
  /// <li>
  /// <code>CONNECTOR_URL</code> - The connector URL for a MARKETPLACE or CUSTOM
  /// connection.
  /// </li>
  /// <li>
  /// <code>CONNECTOR_TYPE</code> - The connector type for a MARKETPLACE or CUSTOM
  /// connection.
  /// </li>
  /// <li>
  /// <code>CONNECTOR_CLASS_NAME</code> - The connector class name for a
  /// MARKETPLACE or CUSTOM connection.
  /// </li>
  /// <li>
  /// <code>KAFKA_CLIENT_KEYSTORE</code> - The Amazon S3 location of the client
  /// keystore file for Kafka client side authentication (Optional).
  /// </li>
  /// <li>
  /// <code>KAFKA_CLIENT_KEYSTORE_PASSWORD</code> - The password to access the
  /// provided keystore (Optional).
  /// </li>
  /// <li>
  /// <code>KAFKA_CLIENT_KEY_PASSWORD</code> - A keystore can consist of multiple
  /// keys, so this is the password to access the client key to be used with the
  /// Kafka server side key (Optional).
  /// </li>
  /// <li>
  /// <code>ENCRYPTED_KAFKA_CLIENT_KEYSTORE_PASSWORD</code> - The encrypted
  /// version of the Kafka client keystore password (if the user has the Glue
  /// encrypt passwords setting selected).
  /// </li>
  /// <li>
  /// <code>ENCRYPTED_KAFKA_CLIENT_KEY_PASSWORD</code> - The encrypted version of
  /// the Kafka client key password (if the user has the Glue encrypt passwords
  /// setting selected).
  /// </li>
  /// </ul>
  final Map<ConnectionPropertyKey, String>? connectionProperties;

  /// The type of the connection. Currently, SFTP is not supported.
  final ConnectionType? connectionType;

  /// The time that this connection definition was created.
  final DateTime? creationTime;

  /// The description of the connection.
  final String? description;

  /// The user, group, or role that last updated this connection definition.
  final String? lastUpdatedBy;

  /// The last time that this connection definition was updated.
  final DateTime? lastUpdatedTime;

  /// A list of criteria that can be used in selecting this connection.
  final List<String>? matchCriteria;

  /// The name of the connection definition.
  final String? name;

  /// A map of physical connection requirements, such as virtual private cloud
  /// (VPC) and <code>SecurityGroup</code>, that are needed to make this
  /// connection successfully.
  final PhysicalConnectionRequirements? physicalConnectionRequirements;

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

  factory Connection.fromJson(Map<String, dynamic> json) {
    return Connection(
      connectionProperties: (json['ConnectionProperties']
              as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k.toConnectionPropertyKey(), e as String)),
      connectionType: (json['ConnectionType'] as String?)?.toConnectionType(),
      creationTime: timeStampFromJson(json['CreationTime']),
      description: json['Description'] as String?,
      lastUpdatedBy: json['LastUpdatedBy'] as String?,
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      matchCriteria: (json['MatchCriteria'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      name: json['Name'] as String?,
      physicalConnectionRequirements: json['PhysicalConnectionRequirements'] !=
              null
          ? PhysicalConnectionRequirements.fromJson(
              json['PhysicalConnectionRequirements'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final connectionProperties = this.connectionProperties;
    final connectionType = this.connectionType;
    final creationTime = this.creationTime;
    final description = this.description;
    final lastUpdatedBy = this.lastUpdatedBy;
    final lastUpdatedTime = this.lastUpdatedTime;
    final matchCriteria = this.matchCriteria;
    final name = this.name;
    final physicalConnectionRequirements = this.physicalConnectionRequirements;
    return {
      if (connectionProperties != null)
        'ConnectionProperties':
            connectionProperties.map((k, e) => MapEntry(k.toValue(), e)),
      if (connectionType != null) 'ConnectionType': connectionType.toValue(),
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (description != null) 'Description': description,
      if (lastUpdatedBy != null) 'LastUpdatedBy': lastUpdatedBy,
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (matchCriteria != null) 'MatchCriteria': matchCriteria,
      if (name != null) 'Name': name,
      if (physicalConnectionRequirements != null)
        'PhysicalConnectionRequirements': physicalConnectionRequirements,
    };
  }
}

/// A structure that is used to specify a connection to create or update.
class ConnectionInput {
  /// These key-value pairs define parameters for the connection.
  final Map<ConnectionPropertyKey, String> connectionProperties;

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
  /// <li>
  /// <code>NETWORK</code> - Designates a network connection to a data source
  /// within an Amazon Virtual Private Cloud environment (Amazon VPC).
  /// </li>
  /// <li>
  /// <code>MARKETPLACE</code> - Uses configuration settings contained in a
  /// connector purchased from Marketplace to read from and write to data stores
  /// that are not natively supported by Glue.
  /// </li>
  /// <li>
  /// <code>CUSTOM</code> - Uses configuration settings contained in a custom
  /// connector to read from and write to data stores that are not natively
  /// supported by Glue.
  /// </li>
  /// </ul>
  /// SFTP is not supported.
  final ConnectionType connectionType;

  /// The name of the connection.
  final String name;

  /// The description of the connection.
  final String? description;

  /// A list of criteria that can be used in selecting this connection.
  final List<String>? matchCriteria;

  /// A map of physical connection requirements, such as virtual private cloud
  /// (VPC) and <code>SecurityGroup</code>, that are needed to successfully make
  /// this connection.
  final PhysicalConnectionRequirements? physicalConnectionRequirements;

  ConnectionInput({
    required this.connectionProperties,
    required this.connectionType,
    required this.name,
    this.description,
    this.matchCriteria,
    this.physicalConnectionRequirements,
  });

  factory ConnectionInput.fromJson(Map<String, dynamic> json) {
    return ConnectionInput(
      connectionProperties: (json['ConnectionProperties']
              as Map<String, dynamic>)
          .map((k, e) => MapEntry(k.toConnectionPropertyKey(), e as String)),
      connectionType: (json['ConnectionType'] as String).toConnectionType(),
      name: json['Name'] as String,
      description: json['Description'] as String?,
      matchCriteria: (json['MatchCriteria'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      physicalConnectionRequirements: json['PhysicalConnectionRequirements'] !=
              null
          ? PhysicalConnectionRequirements.fromJson(
              json['PhysicalConnectionRequirements'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final connectionProperties = this.connectionProperties;
    final connectionType = this.connectionType;
    final name = this.name;
    final description = this.description;
    final matchCriteria = this.matchCriteria;
    final physicalConnectionRequirements = this.physicalConnectionRequirements;
    return {
      'ConnectionProperties':
          connectionProperties.map((k, e) => MapEntry(k.toValue(), e)),
      'ConnectionType': connectionType.toValue(),
      'Name': name,
      if (description != null) 'Description': description,
      if (matchCriteria != null) 'MatchCriteria': matchCriteria,
      if (physicalConnectionRequirements != null)
        'PhysicalConnectionRequirements': physicalConnectionRequirements,
    };
  }
}

/// The data structure used by the Data Catalog to encrypt the password as part
/// of <code>CreateConnection</code> or <code>UpdateConnection</code> and store
/// it in the <code>ENCRYPTED_PASSWORD</code> field in the connection
/// properties. You can enable catalog encryption or only password encryption.
///
/// When a <code>CreationConnection</code> request arrives containing a
/// password, the Data Catalog first encrypts the password using your KMS key.
/// It then encrypts the whole connection object again if catalog encryption is
/// also enabled.
///
/// This encryption requires that you set KMS key permissions to enable or
/// restrict access on the password key according to your security requirements.
/// For example, you might want only administrators to have decrypt permission
/// on the password key.
class ConnectionPasswordEncryption {
  /// When the <code>ReturnConnectionPasswordEncrypted</code> flag is set to
  /// "true", passwords remain encrypted in the responses of
  /// <code>GetConnection</code> and <code>GetConnections</code>. This encryption
  /// takes effect independently from catalog encryption.
  final bool returnConnectionPasswordEncrypted;

  /// An KMS key that is used to encrypt the connection password.
  ///
  /// If connection password protection is enabled, the caller of
  /// <code>CreateConnection</code> and <code>UpdateConnection</code> needs at
  /// least <code>kms:Encrypt</code> permission on the specified KMS key, to
  /// encrypt passwords before storing them in the Data Catalog.
  ///
  /// You can set the decrypt permission to enable or restrict access on the
  /// password key according to your security requirements.
  final String? awsKmsKeyId;

  ConnectionPasswordEncryption({
    required this.returnConnectionPasswordEncrypted,
    this.awsKmsKeyId,
  });

  factory ConnectionPasswordEncryption.fromJson(Map<String, dynamic> json) {
    return ConnectionPasswordEncryption(
      returnConnectionPasswordEncrypted:
          json['ReturnConnectionPasswordEncrypted'] as bool,
      awsKmsKeyId: json['AwsKmsKeyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final returnConnectionPasswordEncrypted =
        this.returnConnectionPasswordEncrypted;
    final awsKmsKeyId = this.awsKmsKeyId;
    return {
      'ReturnConnectionPasswordEncrypted': returnConnectionPasswordEncrypted,
      if (awsKmsKeyId != null) 'AwsKmsKeyId': awsKmsKeyId,
    };
  }
}

enum ConnectionPropertyKey {
  host,
  port,
  username,
  password,
  encryptedPassword,
  jdbcDriverJarUri,
  jdbcDriverClassName,
  jdbcEngine,
  jdbcEngineVersion,
  configFiles,
  instanceId,
  jdbcConnectionUrl,
  jdbcEnforceSsl,
  customJdbcCert,
  skipCustomJdbcCertValidation,
  customJdbcCertString,
  connectionUrl,
  kafkaBootstrapServers,
  kafkaSslEnabled,
  kafkaCustomCert,
  kafkaSkipCustomCertValidation,
  kafkaClientKeystore,
  kafkaClientKeystorePassword,
  kafkaClientKeyPassword,
  encryptedKafkaClientKeystorePassword,
  encryptedKafkaClientKeyPassword,
  secretId,
  connectorUrl,
  connectorType,
  connectorClassName,
}

extension on ConnectionPropertyKey {
  String toValue() {
    switch (this) {
      case ConnectionPropertyKey.host:
        return 'HOST';
      case ConnectionPropertyKey.port:
        return 'PORT';
      case ConnectionPropertyKey.username:
        return 'USERNAME';
      case ConnectionPropertyKey.password:
        return 'PASSWORD';
      case ConnectionPropertyKey.encryptedPassword:
        return 'ENCRYPTED_PASSWORD';
      case ConnectionPropertyKey.jdbcDriverJarUri:
        return 'JDBC_DRIVER_JAR_URI';
      case ConnectionPropertyKey.jdbcDriverClassName:
        return 'JDBC_DRIVER_CLASS_NAME';
      case ConnectionPropertyKey.jdbcEngine:
        return 'JDBC_ENGINE';
      case ConnectionPropertyKey.jdbcEngineVersion:
        return 'JDBC_ENGINE_VERSION';
      case ConnectionPropertyKey.configFiles:
        return 'CONFIG_FILES';
      case ConnectionPropertyKey.instanceId:
        return 'INSTANCE_ID';
      case ConnectionPropertyKey.jdbcConnectionUrl:
        return 'JDBC_CONNECTION_URL';
      case ConnectionPropertyKey.jdbcEnforceSsl:
        return 'JDBC_ENFORCE_SSL';
      case ConnectionPropertyKey.customJdbcCert:
        return 'CUSTOM_JDBC_CERT';
      case ConnectionPropertyKey.skipCustomJdbcCertValidation:
        return 'SKIP_CUSTOM_JDBC_CERT_VALIDATION';
      case ConnectionPropertyKey.customJdbcCertString:
        return 'CUSTOM_JDBC_CERT_STRING';
      case ConnectionPropertyKey.connectionUrl:
        return 'CONNECTION_URL';
      case ConnectionPropertyKey.kafkaBootstrapServers:
        return 'KAFKA_BOOTSTRAP_SERVERS';
      case ConnectionPropertyKey.kafkaSslEnabled:
        return 'KAFKA_SSL_ENABLED';
      case ConnectionPropertyKey.kafkaCustomCert:
        return 'KAFKA_CUSTOM_CERT';
      case ConnectionPropertyKey.kafkaSkipCustomCertValidation:
        return 'KAFKA_SKIP_CUSTOM_CERT_VALIDATION';
      case ConnectionPropertyKey.kafkaClientKeystore:
        return 'KAFKA_CLIENT_KEYSTORE';
      case ConnectionPropertyKey.kafkaClientKeystorePassword:
        return 'KAFKA_CLIENT_KEYSTORE_PASSWORD';
      case ConnectionPropertyKey.kafkaClientKeyPassword:
        return 'KAFKA_CLIENT_KEY_PASSWORD';
      case ConnectionPropertyKey.encryptedKafkaClientKeystorePassword:
        return 'ENCRYPTED_KAFKA_CLIENT_KEYSTORE_PASSWORD';
      case ConnectionPropertyKey.encryptedKafkaClientKeyPassword:
        return 'ENCRYPTED_KAFKA_CLIENT_KEY_PASSWORD';
      case ConnectionPropertyKey.secretId:
        return 'SECRET_ID';
      case ConnectionPropertyKey.connectorUrl:
        return 'CONNECTOR_URL';
      case ConnectionPropertyKey.connectorType:
        return 'CONNECTOR_TYPE';
      case ConnectionPropertyKey.connectorClassName:
        return 'CONNECTOR_CLASS_NAME';
    }
  }
}

extension on String {
  ConnectionPropertyKey toConnectionPropertyKey() {
    switch (this) {
      case 'HOST':
        return ConnectionPropertyKey.host;
      case 'PORT':
        return ConnectionPropertyKey.port;
      case 'USERNAME':
        return ConnectionPropertyKey.username;
      case 'PASSWORD':
        return ConnectionPropertyKey.password;
      case 'ENCRYPTED_PASSWORD':
        return ConnectionPropertyKey.encryptedPassword;
      case 'JDBC_DRIVER_JAR_URI':
        return ConnectionPropertyKey.jdbcDriverJarUri;
      case 'JDBC_DRIVER_CLASS_NAME':
        return ConnectionPropertyKey.jdbcDriverClassName;
      case 'JDBC_ENGINE':
        return ConnectionPropertyKey.jdbcEngine;
      case 'JDBC_ENGINE_VERSION':
        return ConnectionPropertyKey.jdbcEngineVersion;
      case 'CONFIG_FILES':
        return ConnectionPropertyKey.configFiles;
      case 'INSTANCE_ID':
        return ConnectionPropertyKey.instanceId;
      case 'JDBC_CONNECTION_URL':
        return ConnectionPropertyKey.jdbcConnectionUrl;
      case 'JDBC_ENFORCE_SSL':
        return ConnectionPropertyKey.jdbcEnforceSsl;
      case 'CUSTOM_JDBC_CERT':
        return ConnectionPropertyKey.customJdbcCert;
      case 'SKIP_CUSTOM_JDBC_CERT_VALIDATION':
        return ConnectionPropertyKey.skipCustomJdbcCertValidation;
      case 'CUSTOM_JDBC_CERT_STRING':
        return ConnectionPropertyKey.customJdbcCertString;
      case 'CONNECTION_URL':
        return ConnectionPropertyKey.connectionUrl;
      case 'KAFKA_BOOTSTRAP_SERVERS':
        return ConnectionPropertyKey.kafkaBootstrapServers;
      case 'KAFKA_SSL_ENABLED':
        return ConnectionPropertyKey.kafkaSslEnabled;
      case 'KAFKA_CUSTOM_CERT':
        return ConnectionPropertyKey.kafkaCustomCert;
      case 'KAFKA_SKIP_CUSTOM_CERT_VALIDATION':
        return ConnectionPropertyKey.kafkaSkipCustomCertValidation;
      case 'KAFKA_CLIENT_KEYSTORE':
        return ConnectionPropertyKey.kafkaClientKeystore;
      case 'KAFKA_CLIENT_KEYSTORE_PASSWORD':
        return ConnectionPropertyKey.kafkaClientKeystorePassword;
      case 'KAFKA_CLIENT_KEY_PASSWORD':
        return ConnectionPropertyKey.kafkaClientKeyPassword;
      case 'ENCRYPTED_KAFKA_CLIENT_KEYSTORE_PASSWORD':
        return ConnectionPropertyKey.encryptedKafkaClientKeystorePassword;
      case 'ENCRYPTED_KAFKA_CLIENT_KEY_PASSWORD':
        return ConnectionPropertyKey.encryptedKafkaClientKeyPassword;
      case 'SECRET_ID':
        return ConnectionPropertyKey.secretId;
      case 'CONNECTOR_URL':
        return ConnectionPropertyKey.connectorUrl;
      case 'CONNECTOR_TYPE':
        return ConnectionPropertyKey.connectorType;
      case 'CONNECTOR_CLASS_NAME':
        return ConnectionPropertyKey.connectorClassName;
    }
    throw Exception('$this is not known in enum ConnectionPropertyKey');
  }
}

enum ConnectionType {
  jdbc,
  sftp,
  mongodb,
  kafka,
  network,
  marketplace,
  custom,
}

extension on ConnectionType {
  String toValue() {
    switch (this) {
      case ConnectionType.jdbc:
        return 'JDBC';
      case ConnectionType.sftp:
        return 'SFTP';
      case ConnectionType.mongodb:
        return 'MONGODB';
      case ConnectionType.kafka:
        return 'KAFKA';
      case ConnectionType.network:
        return 'NETWORK';
      case ConnectionType.marketplace:
        return 'MARKETPLACE';
      case ConnectionType.custom:
        return 'CUSTOM';
    }
  }
}

extension on String {
  ConnectionType toConnectionType() {
    switch (this) {
      case 'JDBC':
        return ConnectionType.jdbc;
      case 'SFTP':
        return ConnectionType.sftp;
      case 'MONGODB':
        return ConnectionType.mongodb;
      case 'KAFKA':
        return ConnectionType.kafka;
      case 'NETWORK':
        return ConnectionType.network;
      case 'MARKETPLACE':
        return ConnectionType.marketplace;
      case 'CUSTOM':
        return ConnectionType.custom;
    }
    throw Exception('$this is not known in enum ConnectionType');
  }
}

/// Specifies the connections used by a job.
class ConnectionsList {
  /// A list of connections used by the job.
  final List<String>? connections;

  ConnectionsList({
    this.connections,
  });

  factory ConnectionsList.fromJson(Map<String, dynamic> json) {
    return ConnectionsList(
      connections: (json['Connections'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final connections = this.connections;
    return {
      if (connections != null) 'Connections': connections,
    };
  }
}

/// The details of a crawl in the workflow.
class Crawl {
  /// The date and time on which the crawl completed.
  final DateTime? completedOn;

  /// The error message associated with the crawl.
  final String? errorMessage;

  /// The log group associated with the crawl.
  final String? logGroup;

  /// The log stream associated with the crawl.
  final String? logStream;

  /// The date and time on which the crawl started.
  final DateTime? startedOn;

  /// The state of the crawler.
  final CrawlState? state;

  Crawl({
    this.completedOn,
    this.errorMessage,
    this.logGroup,
    this.logStream,
    this.startedOn,
    this.state,
  });

  factory Crawl.fromJson(Map<String, dynamic> json) {
    return Crawl(
      completedOn: timeStampFromJson(json['CompletedOn']),
      errorMessage: json['ErrorMessage'] as String?,
      logGroup: json['LogGroup'] as String?,
      logStream: json['LogStream'] as String?,
      startedOn: timeStampFromJson(json['StartedOn']),
      state: (json['State'] as String?)?.toCrawlState(),
    );
  }

  Map<String, dynamic> toJson() {
    final completedOn = this.completedOn;
    final errorMessage = this.errorMessage;
    final logGroup = this.logGroup;
    final logStream = this.logStream;
    final startedOn = this.startedOn;
    final state = this.state;
    return {
      if (completedOn != null) 'CompletedOn': unixTimestampToJson(completedOn),
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (logGroup != null) 'LogGroup': logGroup,
      if (logStream != null) 'LogStream': logStream,
      if (startedOn != null) 'StartedOn': unixTimestampToJson(startedOn),
      if (state != null) 'State': state.toValue(),
    };
  }
}

enum CrawlState {
  running,
  cancelling,
  cancelled,
  succeeded,
  failed,
}

extension on CrawlState {
  String toValue() {
    switch (this) {
      case CrawlState.running:
        return 'RUNNING';
      case CrawlState.cancelling:
        return 'CANCELLING';
      case CrawlState.cancelled:
        return 'CANCELLED';
      case CrawlState.succeeded:
        return 'SUCCEEDED';
      case CrawlState.failed:
        return 'FAILED';
    }
  }
}

extension on String {
  CrawlState toCrawlState() {
    switch (this) {
      case 'RUNNING':
        return CrawlState.running;
      case 'CANCELLING':
        return CrawlState.cancelling;
      case 'CANCELLED':
        return CrawlState.cancelled;
      case 'SUCCEEDED':
        return CrawlState.succeeded;
      case 'FAILED':
        return CrawlState.failed;
    }
    throw Exception('$this is not known in enum CrawlState');
  }
}

/// Specifies a crawler program that examines a data source and uses classifiers
/// to try to determine its schema. If successful, the crawler records metadata
/// concerning the data source in the Glue Data Catalog.
class Crawler {
  /// A list of UTF-8 strings that specify the custom classifiers that are
  /// associated with the crawler.
  final List<String>? classifiers;

  /// Crawler configuration information. This versioned JSON string allows users
  /// to specify aspects of a crawler's behavior. For more information, see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/define-crawler.html#crawler-data-stores-exclude">Include
  /// and Exclude Patterns</a>.
  final String? configuration;

  /// If the crawler is running, contains the total time elapsed since the last
  /// crawl began.
  final int? crawlElapsedTime;

  /// The name of the <code>SecurityConfiguration</code> structure to be used by
  /// this crawler.
  final String? crawlerSecurityConfiguration;

  /// The time that the crawler was created.
  final DateTime? creationTime;

  /// The name of the database in which the crawler's output is stored.
  final String? databaseName;

  /// A description of the crawler.
  final String? description;

  /// The status of the last crawl, and potentially error information if an error
  /// occurred.
  final LastCrawlInfo? lastCrawl;

  /// The time that the crawler was last updated.
  final DateTime? lastUpdated;

  /// A configuration that specifies whether data lineage is enabled for the
  /// crawler.
  final LineageConfiguration? lineageConfiguration;

  /// The name of the crawler.
  final String? name;

  /// A policy that specifies whether to crawl the entire dataset again, or to
  /// crawl only folders that were added since the last crawler run.
  final RecrawlPolicy? recrawlPolicy;

  /// The Amazon Resource Name (ARN) of an IAM role that's used to access customer
  /// resources, such as Amazon Simple Storage Service (Amazon S3) data.
  final String? role;

  /// For scheduled crawlers, the schedule when the crawler runs.
  final Schedule? schedule;

  /// The policy that specifies update and delete behaviors for the crawler.
  final SchemaChangePolicy? schemaChangePolicy;

  /// Indicates whether the crawler is running, or whether a run is pending.
  final CrawlerState? state;

  /// The prefix added to the names of tables that are created.
  final String? tablePrefix;

  /// A collection of targets to crawl.
  final CrawlerTargets? targets;

  /// The version of the crawler.
  final int? version;

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
    this.lineageConfiguration,
    this.name,
    this.recrawlPolicy,
    this.role,
    this.schedule,
    this.schemaChangePolicy,
    this.state,
    this.tablePrefix,
    this.targets,
    this.version,
  });

  factory Crawler.fromJson(Map<String, dynamic> json) {
    return Crawler(
      classifiers: (json['Classifiers'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      configuration: json['Configuration'] as String?,
      crawlElapsedTime: json['CrawlElapsedTime'] as int?,
      crawlerSecurityConfiguration:
          json['CrawlerSecurityConfiguration'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      databaseName: json['DatabaseName'] as String?,
      description: json['Description'] as String?,
      lastCrawl: json['LastCrawl'] != null
          ? LastCrawlInfo.fromJson(json['LastCrawl'] as Map<String, dynamic>)
          : null,
      lastUpdated: timeStampFromJson(json['LastUpdated']),
      lineageConfiguration: json['LineageConfiguration'] != null
          ? LineageConfiguration.fromJson(
              json['LineageConfiguration'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      recrawlPolicy: json['RecrawlPolicy'] != null
          ? RecrawlPolicy.fromJson(
              json['RecrawlPolicy'] as Map<String, dynamic>)
          : null,
      role: json['Role'] as String?,
      schedule: json['Schedule'] != null
          ? Schedule.fromJson(json['Schedule'] as Map<String, dynamic>)
          : null,
      schemaChangePolicy: json['SchemaChangePolicy'] != null
          ? SchemaChangePolicy.fromJson(
              json['SchemaChangePolicy'] as Map<String, dynamic>)
          : null,
      state: (json['State'] as String?)?.toCrawlerState(),
      tablePrefix: json['TablePrefix'] as String?,
      targets: json['Targets'] != null
          ? CrawlerTargets.fromJson(json['Targets'] as Map<String, dynamic>)
          : null,
      version: json['Version'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final classifiers = this.classifiers;
    final configuration = this.configuration;
    final crawlElapsedTime = this.crawlElapsedTime;
    final crawlerSecurityConfiguration = this.crawlerSecurityConfiguration;
    final creationTime = this.creationTime;
    final databaseName = this.databaseName;
    final description = this.description;
    final lastCrawl = this.lastCrawl;
    final lastUpdated = this.lastUpdated;
    final lineageConfiguration = this.lineageConfiguration;
    final name = this.name;
    final recrawlPolicy = this.recrawlPolicy;
    final role = this.role;
    final schedule = this.schedule;
    final schemaChangePolicy = this.schemaChangePolicy;
    final state = this.state;
    final tablePrefix = this.tablePrefix;
    final targets = this.targets;
    final version = this.version;
    return {
      if (classifiers != null) 'Classifiers': classifiers,
      if (configuration != null) 'Configuration': configuration,
      if (crawlElapsedTime != null) 'CrawlElapsedTime': crawlElapsedTime,
      if (crawlerSecurityConfiguration != null)
        'CrawlerSecurityConfiguration': crawlerSecurityConfiguration,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (databaseName != null) 'DatabaseName': databaseName,
      if (description != null) 'Description': description,
      if (lastCrawl != null) 'LastCrawl': lastCrawl,
      if (lastUpdated != null) 'LastUpdated': unixTimestampToJson(lastUpdated),
      if (lineageConfiguration != null)
        'LineageConfiguration': lineageConfiguration,
      if (name != null) 'Name': name,
      if (recrawlPolicy != null) 'RecrawlPolicy': recrawlPolicy,
      if (role != null) 'Role': role,
      if (schedule != null) 'Schedule': schedule,
      if (schemaChangePolicy != null) 'SchemaChangePolicy': schemaChangePolicy,
      if (state != null) 'State': state.toValue(),
      if (tablePrefix != null) 'TablePrefix': tablePrefix,
      if (targets != null) 'Targets': targets,
      if (version != null) 'Version': version,
    };
  }
}

enum CrawlerLineageSettings {
  enable,
  disable,
}

extension on CrawlerLineageSettings {
  String toValue() {
    switch (this) {
      case CrawlerLineageSettings.enable:
        return 'ENABLE';
      case CrawlerLineageSettings.disable:
        return 'DISABLE';
    }
  }
}

extension on String {
  CrawlerLineageSettings toCrawlerLineageSettings() {
    switch (this) {
      case 'ENABLE':
        return CrawlerLineageSettings.enable;
      case 'DISABLE':
        return CrawlerLineageSettings.disable;
    }
    throw Exception('$this is not known in enum CrawlerLineageSettings');
  }
}

/// Metrics for a specified crawler.
class CrawlerMetrics {
  /// The name of the crawler.
  final String? crawlerName;

  /// The duration of the crawler's most recent run, in seconds.
  final double? lastRuntimeSeconds;

  /// The median duration of this crawler's runs, in seconds.
  final double? medianRuntimeSeconds;

  /// True if the crawler is still estimating how long it will take to complete
  /// this run.
  final bool? stillEstimating;

  /// The number of tables created by this crawler.
  final int? tablesCreated;

  /// The number of tables deleted by this crawler.
  final int? tablesDeleted;

  /// The number of tables updated by this crawler.
  final int? tablesUpdated;

  /// The estimated time left to complete a running crawl.
  final double? timeLeftSeconds;

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

  factory CrawlerMetrics.fromJson(Map<String, dynamic> json) {
    return CrawlerMetrics(
      crawlerName: json['CrawlerName'] as String?,
      lastRuntimeSeconds: json['LastRuntimeSeconds'] as double?,
      medianRuntimeSeconds: json['MedianRuntimeSeconds'] as double?,
      stillEstimating: json['StillEstimating'] as bool?,
      tablesCreated: json['TablesCreated'] as int?,
      tablesDeleted: json['TablesDeleted'] as int?,
      tablesUpdated: json['TablesUpdated'] as int?,
      timeLeftSeconds: json['TimeLeftSeconds'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final crawlerName = this.crawlerName;
    final lastRuntimeSeconds = this.lastRuntimeSeconds;
    final medianRuntimeSeconds = this.medianRuntimeSeconds;
    final stillEstimating = this.stillEstimating;
    final tablesCreated = this.tablesCreated;
    final tablesDeleted = this.tablesDeleted;
    final tablesUpdated = this.tablesUpdated;
    final timeLeftSeconds = this.timeLeftSeconds;
    return {
      if (crawlerName != null) 'CrawlerName': crawlerName,
      if (lastRuntimeSeconds != null) 'LastRuntimeSeconds': lastRuntimeSeconds,
      if (medianRuntimeSeconds != null)
        'MedianRuntimeSeconds': medianRuntimeSeconds,
      if (stillEstimating != null) 'StillEstimating': stillEstimating,
      if (tablesCreated != null) 'TablesCreated': tablesCreated,
      if (tablesDeleted != null) 'TablesDeleted': tablesDeleted,
      if (tablesUpdated != null) 'TablesUpdated': tablesUpdated,
      if (timeLeftSeconds != null) 'TimeLeftSeconds': timeLeftSeconds,
    };
  }
}

/// The details of a Crawler node present in the workflow.
class CrawlerNodeDetails {
  /// A list of crawls represented by the crawl node.
  final List<Crawl>? crawls;

  CrawlerNodeDetails({
    this.crawls,
  });

  factory CrawlerNodeDetails.fromJson(Map<String, dynamic> json) {
    return CrawlerNodeDetails(
      crawls: (json['Crawls'] as List?)
          ?.whereNotNull()
          .map((e) => Crawl.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final crawls = this.crawls;
    return {
      if (crawls != null) 'Crawls': crawls,
    };
  }
}

enum CrawlerState {
  ready,
  running,
  stopping,
}

extension on CrawlerState {
  String toValue() {
    switch (this) {
      case CrawlerState.ready:
        return 'READY';
      case CrawlerState.running:
        return 'RUNNING';
      case CrawlerState.stopping:
        return 'STOPPING';
    }
  }
}

extension on String {
  CrawlerState toCrawlerState() {
    switch (this) {
      case 'READY':
        return CrawlerState.ready;
      case 'RUNNING':
        return CrawlerState.running;
      case 'STOPPING':
        return CrawlerState.stopping;
    }
    throw Exception('$this is not known in enum CrawlerState');
  }
}

/// Specifies data stores to crawl.
class CrawlerTargets {
  /// Specifies Glue Data Catalog targets.
  final List<CatalogTarget>? catalogTargets;

  /// Specifies Amazon DynamoDB targets.
  final List<DynamoDBTarget>? dynamoDBTargets;

  /// Specifies JDBC targets.
  final List<JdbcTarget>? jdbcTargets;

  /// Specifies Amazon DocumentDB or MongoDB targets.
  final List<MongoDBTarget>? mongoDBTargets;

  /// Specifies Amazon Simple Storage Service (Amazon S3) targets.
  final List<S3Target>? s3Targets;

  CrawlerTargets({
    this.catalogTargets,
    this.dynamoDBTargets,
    this.jdbcTargets,
    this.mongoDBTargets,
    this.s3Targets,
  });

  factory CrawlerTargets.fromJson(Map<String, dynamic> json) {
    return CrawlerTargets(
      catalogTargets: (json['CatalogTargets'] as List?)
          ?.whereNotNull()
          .map((e) => CatalogTarget.fromJson(e as Map<String, dynamic>))
          .toList(),
      dynamoDBTargets: (json['DynamoDBTargets'] as List?)
          ?.whereNotNull()
          .map((e) => DynamoDBTarget.fromJson(e as Map<String, dynamic>))
          .toList(),
      jdbcTargets: (json['JdbcTargets'] as List?)
          ?.whereNotNull()
          .map((e) => JdbcTarget.fromJson(e as Map<String, dynamic>))
          .toList(),
      mongoDBTargets: (json['MongoDBTargets'] as List?)
          ?.whereNotNull()
          .map((e) => MongoDBTarget.fromJson(e as Map<String, dynamic>))
          .toList(),
      s3Targets: (json['S3Targets'] as List?)
          ?.whereNotNull()
          .map((e) => S3Target.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final catalogTargets = this.catalogTargets;
    final dynamoDBTargets = this.dynamoDBTargets;
    final jdbcTargets = this.jdbcTargets;
    final mongoDBTargets = this.mongoDBTargets;
    final s3Targets = this.s3Targets;
    return {
      if (catalogTargets != null) 'CatalogTargets': catalogTargets,
      if (dynamoDBTargets != null) 'DynamoDBTargets': dynamoDBTargets,
      if (jdbcTargets != null) 'JdbcTargets': jdbcTargets,
      if (mongoDBTargets != null) 'MongoDBTargets': mongoDBTargets,
      if (s3Targets != null) 'S3Targets': s3Targets,
    };
  }
}

class CreateClassifierResponse {
  CreateClassifierResponse();

  factory CreateClassifierResponse.fromJson(Map<String, dynamic> _) {
    return CreateClassifierResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CreateConnectionResponse {
  CreateConnectionResponse();

  factory CreateConnectionResponse.fromJson(Map<String, dynamic> _) {
    return CreateConnectionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CreateCrawlerResponse {
  CreateCrawlerResponse();

  factory CreateCrawlerResponse.fromJson(Map<String, dynamic> _) {
    return CreateCrawlerResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Specifies a custom CSV classifier for <code>CreateClassifier</code> to
/// create.
class CreateCsvClassifierRequest {
  /// The name of the classifier.
  final String name;

  /// Enables the processing of files that contain only one column.
  final bool? allowSingleColumn;

  /// Indicates whether the CSV file contains a header.
  final CsvHeaderOption? containsHeader;

  /// A custom symbol to denote what separates each column entry in the row.
  final String? delimiter;

  /// Specifies not to trim values before identifying the type of column values.
  /// The default value is true.
  final bool? disableValueTrimming;

  /// A list of strings representing column names.
  final List<String>? header;

  /// A custom symbol to denote what combines content into a single column value.
  /// Must be different from the column delimiter.
  final String? quoteSymbol;

  CreateCsvClassifierRequest({
    required this.name,
    this.allowSingleColumn,
    this.containsHeader,
    this.delimiter,
    this.disableValueTrimming,
    this.header,
    this.quoteSymbol,
  });

  factory CreateCsvClassifierRequest.fromJson(Map<String, dynamic> json) {
    return CreateCsvClassifierRequest(
      name: json['Name'] as String,
      allowSingleColumn: json['AllowSingleColumn'] as bool?,
      containsHeader: (json['ContainsHeader'] as String?)?.toCsvHeaderOption(),
      delimiter: json['Delimiter'] as String?,
      disableValueTrimming: json['DisableValueTrimming'] as bool?,
      header: (json['Header'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      quoteSymbol: json['QuoteSymbol'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final allowSingleColumn = this.allowSingleColumn;
    final containsHeader = this.containsHeader;
    final delimiter = this.delimiter;
    final disableValueTrimming = this.disableValueTrimming;
    final header = this.header;
    final quoteSymbol = this.quoteSymbol;
    return {
      'Name': name,
      if (allowSingleColumn != null) 'AllowSingleColumn': allowSingleColumn,
      if (containsHeader != null) 'ContainsHeader': containsHeader.toValue(),
      if (delimiter != null) 'Delimiter': delimiter,
      if (disableValueTrimming != null)
        'DisableValueTrimming': disableValueTrimming,
      if (header != null) 'Header': header,
      if (quoteSymbol != null) 'QuoteSymbol': quoteSymbol,
    };
  }
}

class CreateDatabaseResponse {
  CreateDatabaseResponse();

  factory CreateDatabaseResponse.fromJson(Map<String, dynamic> _) {
    return CreateDatabaseResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CreateDevEndpointResponse {
  /// The map of arguments used to configure this <code>DevEndpoint</code>.
  ///
  /// Valid arguments are:
  ///
  /// <ul>
  /// <li>
  /// <code>"--enable-glue-datacatalog": ""</code>
  /// </li>
  /// </ul>
  /// You can specify a version of Python support for development endpoints by
  /// using the <code>Arguments</code> parameter in the
  /// <code>CreateDevEndpoint</code> or <code>UpdateDevEndpoint</code> APIs. If no
  /// arguments are provided, the version defaults to Python 2.
  final Map<String, String>? arguments;

  /// The AWS Availability Zone where this <code>DevEndpoint</code> is located.
  final String? availabilityZone;

  /// The point in time at which this <code>DevEndpoint</code> was created.
  final DateTime? createdTimestamp;

  /// The name assigned to the new <code>DevEndpoint</code>.
  final String? endpointName;

  /// Path to one or more Java <code>.jar</code> files in an S3 bucket that will
  /// be loaded in your <code>DevEndpoint</code>.
  final String? extraJarsS3Path;

  /// The paths to one or more Python libraries in an S3 bucket that will be
  /// loaded in your <code>DevEndpoint</code>.
  final String? extraPythonLibsS3Path;

  /// The reason for a current failure in this <code>DevEndpoint</code>.
  final String? failureReason;

  /// Glue version determines the versions of Apache Spark and Python that Glue
  /// supports. The Python version indicates the version supported for running
  /// your ETL scripts on development endpoints.
  ///
  /// For more information about the available Glue versions and corresponding
  /// Spark and Python versions, see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/add-job.html">Glue
  /// version</a> in the developer guide.
  final String? glueVersion;

  /// The number of Glue Data Processing Units (DPUs) allocated to this
  /// DevEndpoint.
  final int? numberOfNodes;

  /// The number of workers of a defined <code>workerType</code> that are
  /// allocated to the development endpoint.
  final int? numberOfWorkers;

  /// The Amazon Resource Name (ARN) of the role assigned to the new
  /// <code>DevEndpoint</code>.
  final String? roleArn;

  /// The name of the <code>SecurityConfiguration</code> structure being used with
  /// this <code>DevEndpoint</code>.
  final String? securityConfiguration;

  /// The security groups assigned to the new <code>DevEndpoint</code>.
  final List<String>? securityGroupIds;

  /// The current status of the new <code>DevEndpoint</code>.
  final String? status;

  /// The subnet ID assigned to the new <code>DevEndpoint</code>.
  final String? subnetId;

  /// The ID of the virtual private cloud (VPC) used by this
  /// <code>DevEndpoint</code>.
  final String? vpcId;

  /// The type of predefined worker that is allocated to the development endpoint.
  /// May be a value of Standard, G.1X, or G.2X.
  final WorkerType? workerType;

  /// The address of the YARN endpoint used by this <code>DevEndpoint</code>.
  final String? yarnEndpointAddress;

  /// The Apache Zeppelin port for the remote Apache Spark interpreter.
  final int? zeppelinRemoteSparkInterpreterPort;

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

  factory CreateDevEndpointResponse.fromJson(Map<String, dynamic> json) {
    return CreateDevEndpointResponse(
      arguments: (json['Arguments'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      availabilityZone: json['AvailabilityZone'] as String?,
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      endpointName: json['EndpointName'] as String?,
      extraJarsS3Path: json['ExtraJarsS3Path'] as String?,
      extraPythonLibsS3Path: json['ExtraPythonLibsS3Path'] as String?,
      failureReason: json['FailureReason'] as String?,
      glueVersion: json['GlueVersion'] as String?,
      numberOfNodes: json['NumberOfNodes'] as int?,
      numberOfWorkers: json['NumberOfWorkers'] as int?,
      roleArn: json['RoleArn'] as String?,
      securityConfiguration: json['SecurityConfiguration'] as String?,
      securityGroupIds: (json['SecurityGroupIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      status: json['Status'] as String?,
      subnetId: json['SubnetId'] as String?,
      vpcId: json['VpcId'] as String?,
      workerType: (json['WorkerType'] as String?)?.toWorkerType(),
      yarnEndpointAddress: json['YarnEndpointAddress'] as String?,
      zeppelinRemoteSparkInterpreterPort:
          json['ZeppelinRemoteSparkInterpreterPort'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final arguments = this.arguments;
    final availabilityZone = this.availabilityZone;
    final createdTimestamp = this.createdTimestamp;
    final endpointName = this.endpointName;
    final extraJarsS3Path = this.extraJarsS3Path;
    final extraPythonLibsS3Path = this.extraPythonLibsS3Path;
    final failureReason = this.failureReason;
    final glueVersion = this.glueVersion;
    final numberOfNodes = this.numberOfNodes;
    final numberOfWorkers = this.numberOfWorkers;
    final roleArn = this.roleArn;
    final securityConfiguration = this.securityConfiguration;
    final securityGroupIds = this.securityGroupIds;
    final status = this.status;
    final subnetId = this.subnetId;
    final vpcId = this.vpcId;
    final workerType = this.workerType;
    final yarnEndpointAddress = this.yarnEndpointAddress;
    final zeppelinRemoteSparkInterpreterPort =
        this.zeppelinRemoteSparkInterpreterPort;
    return {
      if (arguments != null) 'Arguments': arguments,
      if (availabilityZone != null) 'AvailabilityZone': availabilityZone,
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (endpointName != null) 'EndpointName': endpointName,
      if (extraJarsS3Path != null) 'ExtraJarsS3Path': extraJarsS3Path,
      if (extraPythonLibsS3Path != null)
        'ExtraPythonLibsS3Path': extraPythonLibsS3Path,
      if (failureReason != null) 'FailureReason': failureReason,
      if (glueVersion != null) 'GlueVersion': glueVersion,
      if (numberOfNodes != null) 'NumberOfNodes': numberOfNodes,
      if (numberOfWorkers != null) 'NumberOfWorkers': numberOfWorkers,
      if (roleArn != null) 'RoleArn': roleArn,
      if (securityConfiguration != null)
        'SecurityConfiguration': securityConfiguration,
      if (securityGroupIds != null) 'SecurityGroupIds': securityGroupIds,
      if (status != null) 'Status': status,
      if (subnetId != null) 'SubnetId': subnetId,
      if (vpcId != null) 'VpcId': vpcId,
      if (workerType != null) 'WorkerType': workerType.toValue(),
      if (yarnEndpointAddress != null)
        'YarnEndpointAddress': yarnEndpointAddress,
      if (zeppelinRemoteSparkInterpreterPort != null)
        'ZeppelinRemoteSparkInterpreterPort':
            zeppelinRemoteSparkInterpreterPort,
    };
  }
}

/// Specifies a <code>grok</code> classifier for <code>CreateClassifier</code>
/// to create.
class CreateGrokClassifierRequest {
  /// An identifier of the data format that the classifier matches, such as
  /// Twitter, JSON, Omniture logs, Amazon CloudWatch Logs, and so on.
  final String classification;

  /// The grok pattern used by this classifier.
  final String grokPattern;

  /// The name of the new classifier.
  final String name;

  /// Optional custom grok patterns used by this classifier.
  final String? customPatterns;

  CreateGrokClassifierRequest({
    required this.classification,
    required this.grokPattern,
    required this.name,
    this.customPatterns,
  });

  factory CreateGrokClassifierRequest.fromJson(Map<String, dynamic> json) {
    return CreateGrokClassifierRequest(
      classification: json['Classification'] as String,
      grokPattern: json['GrokPattern'] as String,
      name: json['Name'] as String,
      customPatterns: json['CustomPatterns'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final classification = this.classification;
    final grokPattern = this.grokPattern;
    final name = this.name;
    final customPatterns = this.customPatterns;
    return {
      'Classification': classification,
      'GrokPattern': grokPattern,
      'Name': name,
      if (customPatterns != null) 'CustomPatterns': customPatterns,
    };
  }
}

class CreateJobResponse {
  /// The unique name that was provided for this job definition.
  final String? name;

  CreateJobResponse({
    this.name,
  });

  factory CreateJobResponse.fromJson(Map<String, dynamic> json) {
    return CreateJobResponse(
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      if (name != null) 'Name': name,
    };
  }
}

/// Specifies a JSON classifier for <code>CreateClassifier</code> to create.
class CreateJsonClassifierRequest {
  /// A <code>JsonPath</code> string defining the JSON data for the classifier to
  /// classify. Glue supports a subset of JsonPath, as described in <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/custom-classifier.html#custom-classifier-json">Writing
  /// JsonPath Custom Classifiers</a>.
  final String jsonPath;

  /// The name of the classifier.
  final String name;

  CreateJsonClassifierRequest({
    required this.jsonPath,
    required this.name,
  });

  factory CreateJsonClassifierRequest.fromJson(Map<String, dynamic> json) {
    return CreateJsonClassifierRequest(
      jsonPath: json['JsonPath'] as String,
      name: json['Name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final jsonPath = this.jsonPath;
    final name = this.name;
    return {
      'JsonPath': jsonPath,
      'Name': name,
    };
  }
}

class CreateMLTransformResponse {
  /// A unique identifier that is generated for the transform.
  final String? transformId;

  CreateMLTransformResponse({
    this.transformId,
  });

  factory CreateMLTransformResponse.fromJson(Map<String, dynamic> json) {
    return CreateMLTransformResponse(
      transformId: json['TransformId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final transformId = this.transformId;
    return {
      if (transformId != null) 'TransformId': transformId,
    };
  }
}

class CreatePartitionIndexResponse {
  CreatePartitionIndexResponse();

  factory CreatePartitionIndexResponse.fromJson(Map<String, dynamic> _) {
    return CreatePartitionIndexResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CreatePartitionResponse {
  CreatePartitionResponse();

  factory CreatePartitionResponse.fromJson(Map<String, dynamic> _) {
    return CreatePartitionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CreateRegistryResponse {
  /// A description of the registry.
  final String? description;

  /// The Amazon Resource Name (ARN) of the newly created registry.
  final String? registryArn;

  /// The name of the registry.
  final String? registryName;

  /// The tags for the registry.
  final Map<String, String>? tags;

  CreateRegistryResponse({
    this.description,
    this.registryArn,
    this.registryName,
    this.tags,
  });

  factory CreateRegistryResponse.fromJson(Map<String, dynamic> json) {
    return CreateRegistryResponse(
      description: json['Description'] as String?,
      registryArn: json['RegistryArn'] as String?,
      registryName: json['RegistryName'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final registryArn = this.registryArn;
    final registryName = this.registryName;
    final tags = this.tags;
    return {
      if (description != null) 'Description': description,
      if (registryArn != null) 'RegistryArn': registryArn,
      if (registryName != null) 'RegistryName': registryName,
      if (tags != null) 'Tags': tags,
    };
  }
}

class CreateSchemaResponse {
  /// The schema compatibility mode.
  final Compatibility? compatibility;

  /// The data format of the schema definition. Currently <code>AVRO</code> and
  /// <code>JSON</code> are supported.
  final DataFormat? dataFormat;

  /// A description of the schema if specified when created.
  final String? description;

  /// The latest version of the schema associated with the returned schema
  /// definition.
  final int? latestSchemaVersion;

  /// The next version of the schema associated with the returned schema
  /// definition.
  final int? nextSchemaVersion;

  /// The Amazon Resource Name (ARN) of the registry.
  final String? registryArn;

  /// The name of the registry.
  final String? registryName;

  /// The Amazon Resource Name (ARN) of the schema.
  final String? schemaArn;

  /// The version number of the checkpoint (the last time the compatibility mode
  /// was changed).
  final int? schemaCheckpoint;

  /// The name of the schema.
  final String? schemaName;

  /// The status of the schema.
  final SchemaStatus? schemaStatus;

  /// The unique identifier of the first schema version.
  final String? schemaVersionId;

  /// The status of the first schema version created.
  final SchemaVersionStatus? schemaVersionStatus;

  /// The tags for the schema.
  final Map<String, String>? tags;

  CreateSchemaResponse({
    this.compatibility,
    this.dataFormat,
    this.description,
    this.latestSchemaVersion,
    this.nextSchemaVersion,
    this.registryArn,
    this.registryName,
    this.schemaArn,
    this.schemaCheckpoint,
    this.schemaName,
    this.schemaStatus,
    this.schemaVersionId,
    this.schemaVersionStatus,
    this.tags,
  });

  factory CreateSchemaResponse.fromJson(Map<String, dynamic> json) {
    return CreateSchemaResponse(
      compatibility: (json['Compatibility'] as String?)?.toCompatibility(),
      dataFormat: (json['DataFormat'] as String?)?.toDataFormat(),
      description: json['Description'] as String?,
      latestSchemaVersion: json['LatestSchemaVersion'] as int?,
      nextSchemaVersion: json['NextSchemaVersion'] as int?,
      registryArn: json['RegistryArn'] as String?,
      registryName: json['RegistryName'] as String?,
      schemaArn: json['SchemaArn'] as String?,
      schemaCheckpoint: json['SchemaCheckpoint'] as int?,
      schemaName: json['SchemaName'] as String?,
      schemaStatus: (json['SchemaStatus'] as String?)?.toSchemaStatus(),
      schemaVersionId: json['SchemaVersionId'] as String?,
      schemaVersionStatus:
          (json['SchemaVersionStatus'] as String?)?.toSchemaVersionStatus(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final compatibility = this.compatibility;
    final dataFormat = this.dataFormat;
    final description = this.description;
    final latestSchemaVersion = this.latestSchemaVersion;
    final nextSchemaVersion = this.nextSchemaVersion;
    final registryArn = this.registryArn;
    final registryName = this.registryName;
    final schemaArn = this.schemaArn;
    final schemaCheckpoint = this.schemaCheckpoint;
    final schemaName = this.schemaName;
    final schemaStatus = this.schemaStatus;
    final schemaVersionId = this.schemaVersionId;
    final schemaVersionStatus = this.schemaVersionStatus;
    final tags = this.tags;
    return {
      if (compatibility != null) 'Compatibility': compatibility.toValue(),
      if (dataFormat != null) 'DataFormat': dataFormat.toValue(),
      if (description != null) 'Description': description,
      if (latestSchemaVersion != null)
        'LatestSchemaVersion': latestSchemaVersion,
      if (nextSchemaVersion != null) 'NextSchemaVersion': nextSchemaVersion,
      if (registryArn != null) 'RegistryArn': registryArn,
      if (registryName != null) 'RegistryName': registryName,
      if (schemaArn != null) 'SchemaArn': schemaArn,
      if (schemaCheckpoint != null) 'SchemaCheckpoint': schemaCheckpoint,
      if (schemaName != null) 'SchemaName': schemaName,
      if (schemaStatus != null) 'SchemaStatus': schemaStatus.toValue(),
      if (schemaVersionId != null) 'SchemaVersionId': schemaVersionId,
      if (schemaVersionStatus != null)
        'SchemaVersionStatus': schemaVersionStatus.toValue(),
      if (tags != null) 'Tags': tags,
    };
  }
}

class CreateScriptResponse {
  /// The Python script generated from the DAG.
  final String? pythonScript;

  /// The Scala code generated from the DAG.
  final String? scalaCode;

  CreateScriptResponse({
    this.pythonScript,
    this.scalaCode,
  });

  factory CreateScriptResponse.fromJson(Map<String, dynamic> json) {
    return CreateScriptResponse(
      pythonScript: json['PythonScript'] as String?,
      scalaCode: json['ScalaCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final pythonScript = this.pythonScript;
    final scalaCode = this.scalaCode;
    return {
      if (pythonScript != null) 'PythonScript': pythonScript,
      if (scalaCode != null) 'ScalaCode': scalaCode,
    };
  }
}

class CreateSecurityConfigurationResponse {
  /// The time at which the new security configuration was created.
  final DateTime? createdTimestamp;

  /// The name assigned to the new security configuration.
  final String? name;

  CreateSecurityConfigurationResponse({
    this.createdTimestamp,
    this.name,
  });

  factory CreateSecurityConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateSecurityConfigurationResponse(
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final name = this.name;
    return {
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (name != null) 'Name': name,
    };
  }
}

class CreateTableResponse {
  CreateTableResponse();

  factory CreateTableResponse.fromJson(Map<String, dynamic> _) {
    return CreateTableResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CreateTriggerResponse {
  /// The name of the trigger.
  final String? name;

  CreateTriggerResponse({
    this.name,
  });

  factory CreateTriggerResponse.fromJson(Map<String, dynamic> json) {
    return CreateTriggerResponse(
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      if (name != null) 'Name': name,
    };
  }
}

class CreateUserDefinedFunctionResponse {
  CreateUserDefinedFunctionResponse();

  factory CreateUserDefinedFunctionResponse.fromJson(Map<String, dynamic> _) {
    return CreateUserDefinedFunctionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CreateWorkflowResponse {
  /// The name of the workflow which was provided as part of the request.
  final String? name;

  CreateWorkflowResponse({
    this.name,
  });

  factory CreateWorkflowResponse.fromJson(Map<String, dynamic> json) {
    return CreateWorkflowResponse(
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      if (name != null) 'Name': name,
    };
  }
}

/// Specifies an XML classifier for <code>CreateClassifier</code> to create.
class CreateXMLClassifierRequest {
  /// An identifier of the data format that the classifier matches.
  final String classification;

  /// The name of the classifier.
  final String name;

  /// The XML tag designating the element that contains each record in an XML
  /// document being parsed. This can't identify a self-closing element (closed by
  /// <code>/&gt;</code>). An empty row element that contains only attributes can
  /// be parsed as long as it ends with a closing tag (for example, <code>&lt;row
  /// item_a="A" item_b="B"&gt;&lt;/row&gt;</code> is okay, but <code>&lt;row
  /// item_a="A" item_b="B" /&gt;</code> is not).
  final String? rowTag;

  CreateXMLClassifierRequest({
    required this.classification,
    required this.name,
    this.rowTag,
  });

  factory CreateXMLClassifierRequest.fromJson(Map<String, dynamic> json) {
    return CreateXMLClassifierRequest(
      classification: json['Classification'] as String,
      name: json['Name'] as String,
      rowTag: json['RowTag'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final classification = this.classification;
    final name = this.name;
    final rowTag = this.rowTag;
    return {
      'Classification': classification,
      'Name': name,
      if (rowTag != null) 'RowTag': rowTag,
    };
  }
}

/// A classifier for custom <code>CSV</code> content.
class CsvClassifier {
  /// The name of the classifier.
  final String name;

  /// Enables the processing of files that contain only one column.
  final bool? allowSingleColumn;

  /// Indicates whether the CSV file contains a header.
  final CsvHeaderOption? containsHeader;

  /// The time that this classifier was registered.
  final DateTime? creationTime;

  /// A custom symbol to denote what separates each column entry in the row.
  final String? delimiter;

  /// Specifies not to trim values before identifying the type of column values.
  /// The default value is <code>true</code>.
  final bool? disableValueTrimming;

  /// A list of strings representing column names.
  final List<String>? header;

  /// The time that this classifier was last updated.
  final DateTime? lastUpdated;

  /// A custom symbol to denote what combines content into a single column value.
  /// It must be different from the column delimiter.
  final String? quoteSymbol;

  /// The version of this classifier.
  final int? version;

  CsvClassifier({
    required this.name,
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

  factory CsvClassifier.fromJson(Map<String, dynamic> json) {
    return CsvClassifier(
      name: json['Name'] as String,
      allowSingleColumn: json['AllowSingleColumn'] as bool?,
      containsHeader: (json['ContainsHeader'] as String?)?.toCsvHeaderOption(),
      creationTime: timeStampFromJson(json['CreationTime']),
      delimiter: json['Delimiter'] as String?,
      disableValueTrimming: json['DisableValueTrimming'] as bool?,
      header: (json['Header'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      lastUpdated: timeStampFromJson(json['LastUpdated']),
      quoteSymbol: json['QuoteSymbol'] as String?,
      version: json['Version'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final allowSingleColumn = this.allowSingleColumn;
    final containsHeader = this.containsHeader;
    final creationTime = this.creationTime;
    final delimiter = this.delimiter;
    final disableValueTrimming = this.disableValueTrimming;
    final header = this.header;
    final lastUpdated = this.lastUpdated;
    final quoteSymbol = this.quoteSymbol;
    final version = this.version;
    return {
      'Name': name,
      if (allowSingleColumn != null) 'AllowSingleColumn': allowSingleColumn,
      if (containsHeader != null) 'ContainsHeader': containsHeader.toValue(),
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (delimiter != null) 'Delimiter': delimiter,
      if (disableValueTrimming != null)
        'DisableValueTrimming': disableValueTrimming,
      if (header != null) 'Header': header,
      if (lastUpdated != null) 'LastUpdated': unixTimestampToJson(lastUpdated),
      if (quoteSymbol != null) 'QuoteSymbol': quoteSymbol,
      if (version != null) 'Version': version,
    };
  }
}

enum CsvHeaderOption {
  unknown,
  present,
  absent,
}

extension on CsvHeaderOption {
  String toValue() {
    switch (this) {
      case CsvHeaderOption.unknown:
        return 'UNKNOWN';
      case CsvHeaderOption.present:
        return 'PRESENT';
      case CsvHeaderOption.absent:
        return 'ABSENT';
    }
  }
}

extension on String {
  CsvHeaderOption toCsvHeaderOption() {
    switch (this) {
      case 'UNKNOWN':
        return CsvHeaderOption.unknown;
      case 'PRESENT':
        return CsvHeaderOption.present;
      case 'ABSENT':
        return CsvHeaderOption.absent;
    }
    throw Exception('$this is not known in enum CsvHeaderOption');
  }
}

/// Contains configuration information for maintaining Data Catalog security.
class DataCatalogEncryptionSettings {
  /// When connection password protection is enabled, the Data Catalog uses a
  /// customer-provided key to encrypt the password as part of
  /// <code>CreateConnection</code> or <code>UpdateConnection</code> and store it
  /// in the <code>ENCRYPTED_PASSWORD</code> field in the connection properties.
  /// You can enable catalog encryption or only password encryption.
  final ConnectionPasswordEncryption? connectionPasswordEncryption;

  /// Specifies the encryption-at-rest configuration for the Data Catalog.
  final EncryptionAtRest? encryptionAtRest;

  DataCatalogEncryptionSettings({
    this.connectionPasswordEncryption,
    this.encryptionAtRest,
  });

  factory DataCatalogEncryptionSettings.fromJson(Map<String, dynamic> json) {
    return DataCatalogEncryptionSettings(
      connectionPasswordEncryption: json['ConnectionPasswordEncryption'] != null
          ? ConnectionPasswordEncryption.fromJson(
              json['ConnectionPasswordEncryption'] as Map<String, dynamic>)
          : null,
      encryptionAtRest: json['EncryptionAtRest'] != null
          ? EncryptionAtRest.fromJson(
              json['EncryptionAtRest'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final connectionPasswordEncryption = this.connectionPasswordEncryption;
    final encryptionAtRest = this.encryptionAtRest;
    return {
      if (connectionPasswordEncryption != null)
        'ConnectionPasswordEncryption': connectionPasswordEncryption,
      if (encryptionAtRest != null) 'EncryptionAtRest': encryptionAtRest,
    };
  }
}

enum DataFormat {
  avro,
  json,
}

extension on DataFormat {
  String toValue() {
    switch (this) {
      case DataFormat.avro:
        return 'AVRO';
      case DataFormat.json:
        return 'JSON';
    }
  }
}

extension on String {
  DataFormat toDataFormat() {
    switch (this) {
      case 'AVRO':
        return DataFormat.avro;
      case 'JSON':
        return DataFormat.json;
    }
    throw Exception('$this is not known in enum DataFormat');
  }
}

/// The Lake Formation principal.
class DataLakePrincipal {
  /// An identifier for the Lake Formation principal.
  final String? dataLakePrincipalIdentifier;

  DataLakePrincipal({
    this.dataLakePrincipalIdentifier,
  });

  factory DataLakePrincipal.fromJson(Map<String, dynamic> json) {
    return DataLakePrincipal(
      dataLakePrincipalIdentifier:
          json['DataLakePrincipalIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataLakePrincipalIdentifier = this.dataLakePrincipalIdentifier;
    return {
      if (dataLakePrincipalIdentifier != null)
        'DataLakePrincipalIdentifier': dataLakePrincipalIdentifier,
    };
  }
}

/// The <code>Database</code> object represents a logical grouping of tables
/// that might reside in a Hive metastore or an RDBMS.
class Database {
  /// The name of the database. For Hive compatibility, this is folded to
  /// lowercase when it is stored.
  final String name;

  /// The ID of the Data Catalog in which the database resides.
  final String? catalogId;

  /// Creates a set of default permissions on the table for principals.
  final List<PrincipalPermissions>? createTableDefaultPermissions;

  /// The time at which the metadata database was created in the catalog.
  final DateTime? createTime;

  /// A description of the database.
  final String? description;

  /// The location of the database (for example, an HDFS path).
  final String? locationUri;

  /// These key-value pairs define parameters and properties of the database.
  final Map<String, String>? parameters;

  /// A <code>DatabaseIdentifier</code> structure that describes a target database
  /// for resource linking.
  final DatabaseIdentifier? targetDatabase;

  Database({
    required this.name,
    this.catalogId,
    this.createTableDefaultPermissions,
    this.createTime,
    this.description,
    this.locationUri,
    this.parameters,
    this.targetDatabase,
  });

  factory Database.fromJson(Map<String, dynamic> json) {
    return Database(
      name: json['Name'] as String,
      catalogId: json['CatalogId'] as String?,
      createTableDefaultPermissions: (json['CreateTableDefaultPermissions']
              as List?)
          ?.whereNotNull()
          .map((e) => PrincipalPermissions.fromJson(e as Map<String, dynamic>))
          .toList(),
      createTime: timeStampFromJson(json['CreateTime']),
      description: json['Description'] as String?,
      locationUri: json['LocationUri'] as String?,
      parameters: (json['Parameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      targetDatabase: json['TargetDatabase'] != null
          ? DatabaseIdentifier.fromJson(
              json['TargetDatabase'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final catalogId = this.catalogId;
    final createTableDefaultPermissions = this.createTableDefaultPermissions;
    final createTime = this.createTime;
    final description = this.description;
    final locationUri = this.locationUri;
    final parameters = this.parameters;
    final targetDatabase = this.targetDatabase;
    return {
      'Name': name,
      if (catalogId != null) 'CatalogId': catalogId,
      if (createTableDefaultPermissions != null)
        'CreateTableDefaultPermissions': createTableDefaultPermissions,
      if (createTime != null) 'CreateTime': unixTimestampToJson(createTime),
      if (description != null) 'Description': description,
      if (locationUri != null) 'LocationUri': locationUri,
      if (parameters != null) 'Parameters': parameters,
      if (targetDatabase != null) 'TargetDatabase': targetDatabase,
    };
  }
}

/// A structure that describes a target database for resource linking.
class DatabaseIdentifier {
  /// The ID of the Data Catalog in which the database resides.
  final String? catalogId;

  /// The name of the catalog database.
  final String? databaseName;

  DatabaseIdentifier({
    this.catalogId,
    this.databaseName,
  });

  factory DatabaseIdentifier.fromJson(Map<String, dynamic> json) {
    return DatabaseIdentifier(
      catalogId: json['CatalogId'] as String?,
      databaseName: json['DatabaseName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final catalogId = this.catalogId;
    final databaseName = this.databaseName;
    return {
      if (catalogId != null) 'CatalogId': catalogId,
      if (databaseName != null) 'DatabaseName': databaseName,
    };
  }
}

/// The structure used to create or update a database.
class DatabaseInput {
  /// The name of the database. For Hive compatibility, this is folded to
  /// lowercase when it is stored.
  final String name;

  /// Creates a set of default permissions on the table for principals.
  final List<PrincipalPermissions>? createTableDefaultPermissions;

  /// A description of the database.
  final String? description;

  /// The location of the database (for example, an HDFS path).
  final String? locationUri;

  /// These key-value pairs define parameters and properties of the database.
  ///
  /// These key-value pairs define parameters and properties of the database.
  final Map<String, String>? parameters;

  /// A <code>DatabaseIdentifier</code> structure that describes a target database
  /// for resource linking.
  final DatabaseIdentifier? targetDatabase;

  DatabaseInput({
    required this.name,
    this.createTableDefaultPermissions,
    this.description,
    this.locationUri,
    this.parameters,
    this.targetDatabase,
  });

  factory DatabaseInput.fromJson(Map<String, dynamic> json) {
    return DatabaseInput(
      name: json['Name'] as String,
      createTableDefaultPermissions: (json['CreateTableDefaultPermissions']
              as List?)
          ?.whereNotNull()
          .map((e) => PrincipalPermissions.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['Description'] as String?,
      locationUri: json['LocationUri'] as String?,
      parameters: (json['Parameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      targetDatabase: json['TargetDatabase'] != null
          ? DatabaseIdentifier.fromJson(
              json['TargetDatabase'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final createTableDefaultPermissions = this.createTableDefaultPermissions;
    final description = this.description;
    final locationUri = this.locationUri;
    final parameters = this.parameters;
    final targetDatabase = this.targetDatabase;
    return {
      'Name': name,
      if (createTableDefaultPermissions != null)
        'CreateTableDefaultPermissions': createTableDefaultPermissions,
      if (description != null) 'Description': description,
      if (locationUri != null) 'LocationUri': locationUri,
      if (parameters != null) 'Parameters': parameters,
      if (targetDatabase != null) 'TargetDatabase': targetDatabase,
    };
  }
}

/// Defines column statistics supported for timestamp data columns.
class DateColumnStatisticsData {
  /// The number of distinct values in a column.
  final int numberOfDistinctValues;

  /// The number of null values in the column.
  final int numberOfNulls;

  /// The highest value in the column.
  final DateTime? maximumValue;

  /// The lowest value in the column.
  final DateTime? minimumValue;

  DateColumnStatisticsData({
    required this.numberOfDistinctValues,
    required this.numberOfNulls,
    this.maximumValue,
    this.minimumValue,
  });

  factory DateColumnStatisticsData.fromJson(Map<String, dynamic> json) {
    return DateColumnStatisticsData(
      numberOfDistinctValues: json['NumberOfDistinctValues'] as int,
      numberOfNulls: json['NumberOfNulls'] as int,
      maximumValue: timeStampFromJson(json['MaximumValue']),
      minimumValue: timeStampFromJson(json['MinimumValue']),
    );
  }

  Map<String, dynamic> toJson() {
    final numberOfDistinctValues = this.numberOfDistinctValues;
    final numberOfNulls = this.numberOfNulls;
    final maximumValue = this.maximumValue;
    final minimumValue = this.minimumValue;
    return {
      'NumberOfDistinctValues': numberOfDistinctValues,
      'NumberOfNulls': numberOfNulls,
      if (maximumValue != null)
        'MaximumValue': unixTimestampToJson(maximumValue),
      if (minimumValue != null)
        'MinimumValue': unixTimestampToJson(minimumValue),
    };
  }
}

/// Defines column statistics supported for fixed-point number data columns.
class DecimalColumnStatisticsData {
  /// The number of distinct values in a column.
  final int numberOfDistinctValues;

  /// The number of null values in the column.
  final int numberOfNulls;

  /// The highest value in the column.
  final DecimalNumber? maximumValue;

  /// The lowest value in the column.
  final DecimalNumber? minimumValue;

  DecimalColumnStatisticsData({
    required this.numberOfDistinctValues,
    required this.numberOfNulls,
    this.maximumValue,
    this.minimumValue,
  });

  factory DecimalColumnStatisticsData.fromJson(Map<String, dynamic> json) {
    return DecimalColumnStatisticsData(
      numberOfDistinctValues: json['NumberOfDistinctValues'] as int,
      numberOfNulls: json['NumberOfNulls'] as int,
      maximumValue: json['MaximumValue'] != null
          ? DecimalNumber.fromJson(json['MaximumValue'] as Map<String, dynamic>)
          : null,
      minimumValue: json['MinimumValue'] != null
          ? DecimalNumber.fromJson(json['MinimumValue'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final numberOfDistinctValues = this.numberOfDistinctValues;
    final numberOfNulls = this.numberOfNulls;
    final maximumValue = this.maximumValue;
    final minimumValue = this.minimumValue;
    return {
      'NumberOfDistinctValues': numberOfDistinctValues,
      'NumberOfNulls': numberOfNulls,
      if (maximumValue != null) 'MaximumValue': maximumValue,
      if (minimumValue != null) 'MinimumValue': minimumValue,
    };
  }
}

/// Contains a numeric value in decimal format.
class DecimalNumber {
  /// The scale that determines where the decimal point falls in the unscaled
  /// value.
  final int scale;

  /// The unscaled numeric value.
  final Uint8List unscaledValue;

  DecimalNumber({
    required this.scale,
    required this.unscaledValue,
  });

  factory DecimalNumber.fromJson(Map<String, dynamic> json) {
    return DecimalNumber(
      scale: json['Scale'] as int,
      unscaledValue: _s.decodeUint8List(json['UnscaledValue']! as String),
    );
  }

  Map<String, dynamic> toJson() {
    final scale = this.scale;
    final unscaledValue = this.unscaledValue;
    return {
      'Scale': scale,
      'UnscaledValue': base64Encode(unscaledValue),
    };
  }
}

enum DeleteBehavior {
  log,
  deleteFromDatabase,
  deprecateInDatabase,
}

extension on DeleteBehavior {
  String toValue() {
    switch (this) {
      case DeleteBehavior.log:
        return 'LOG';
      case DeleteBehavior.deleteFromDatabase:
        return 'DELETE_FROM_DATABASE';
      case DeleteBehavior.deprecateInDatabase:
        return 'DEPRECATE_IN_DATABASE';
    }
  }
}

extension on String {
  DeleteBehavior toDeleteBehavior() {
    switch (this) {
      case 'LOG':
        return DeleteBehavior.log;
      case 'DELETE_FROM_DATABASE':
        return DeleteBehavior.deleteFromDatabase;
      case 'DEPRECATE_IN_DATABASE':
        return DeleteBehavior.deprecateInDatabase;
    }
    throw Exception('$this is not known in enum DeleteBehavior');
  }
}

class DeleteClassifierResponse {
  DeleteClassifierResponse();

  factory DeleteClassifierResponse.fromJson(Map<String, dynamic> _) {
    return DeleteClassifierResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteColumnStatisticsForPartitionResponse {
  DeleteColumnStatisticsForPartitionResponse();

  factory DeleteColumnStatisticsForPartitionResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteColumnStatisticsForPartitionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteColumnStatisticsForTableResponse {
  DeleteColumnStatisticsForTableResponse();

  factory DeleteColumnStatisticsForTableResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteColumnStatisticsForTableResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteConnectionResponse {
  DeleteConnectionResponse();

  factory DeleteConnectionResponse.fromJson(Map<String, dynamic> _) {
    return DeleteConnectionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteCrawlerResponse {
  DeleteCrawlerResponse();

  factory DeleteCrawlerResponse.fromJson(Map<String, dynamic> _) {
    return DeleteCrawlerResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteDatabaseResponse {
  DeleteDatabaseResponse();

  factory DeleteDatabaseResponse.fromJson(Map<String, dynamic> _) {
    return DeleteDatabaseResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteDevEndpointResponse {
  DeleteDevEndpointResponse();

  factory DeleteDevEndpointResponse.fromJson(Map<String, dynamic> _) {
    return DeleteDevEndpointResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteJobResponse {
  /// The name of the job definition that was deleted.
  final String? jobName;

  DeleteJobResponse({
    this.jobName,
  });

  factory DeleteJobResponse.fromJson(Map<String, dynamic> json) {
    return DeleteJobResponse(
      jobName: json['JobName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobName = this.jobName;
    return {
      if (jobName != null) 'JobName': jobName,
    };
  }
}

class DeleteMLTransformResponse {
  /// The unique identifier of the transform that was deleted.
  final String? transformId;

  DeleteMLTransformResponse({
    this.transformId,
  });

  factory DeleteMLTransformResponse.fromJson(Map<String, dynamic> json) {
    return DeleteMLTransformResponse(
      transformId: json['TransformId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final transformId = this.transformId;
    return {
      if (transformId != null) 'TransformId': transformId,
    };
  }
}

class DeletePartitionIndexResponse {
  DeletePartitionIndexResponse();

  factory DeletePartitionIndexResponse.fromJson(Map<String, dynamic> _) {
    return DeletePartitionIndexResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeletePartitionResponse {
  DeletePartitionResponse();

  factory DeletePartitionResponse.fromJson(Map<String, dynamic> _) {
    return DeletePartitionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteRegistryResponse {
  /// The Amazon Resource Name (ARN) of the registry being deleted.
  final String? registryArn;

  /// The name of the registry being deleted.
  final String? registryName;

  /// The status of the registry. A successful operation will return the
  /// <code>Deleting</code> status.
  final RegistryStatus? status;

  DeleteRegistryResponse({
    this.registryArn,
    this.registryName,
    this.status,
  });

  factory DeleteRegistryResponse.fromJson(Map<String, dynamic> json) {
    return DeleteRegistryResponse(
      registryArn: json['RegistryArn'] as String?,
      registryName: json['RegistryName'] as String?,
      status: (json['Status'] as String?)?.toRegistryStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final registryArn = this.registryArn;
    final registryName = this.registryName;
    final status = this.status;
    return {
      if (registryArn != null) 'RegistryArn': registryArn,
      if (registryName != null) 'RegistryName': registryName,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

class DeleteResourcePolicyResponse {
  DeleteResourcePolicyResponse();

  factory DeleteResourcePolicyResponse.fromJson(Map<String, dynamic> _) {
    return DeleteResourcePolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteSchemaResponse {
  /// The Amazon Resource Name (ARN) of the schema being deleted.
  final String? schemaArn;

  /// The name of the schema being deleted.
  final String? schemaName;

  /// The status of the schema.
  final SchemaStatus? status;

  DeleteSchemaResponse({
    this.schemaArn,
    this.schemaName,
    this.status,
  });

  factory DeleteSchemaResponse.fromJson(Map<String, dynamic> json) {
    return DeleteSchemaResponse(
      schemaArn: json['SchemaArn'] as String?,
      schemaName: json['SchemaName'] as String?,
      status: (json['Status'] as String?)?.toSchemaStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final schemaArn = this.schemaArn;
    final schemaName = this.schemaName;
    final status = this.status;
    return {
      if (schemaArn != null) 'SchemaArn': schemaArn,
      if (schemaName != null) 'SchemaName': schemaName,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

class DeleteSchemaVersionsResponse {
  /// A list of <code>SchemaVersionErrorItem</code> objects, each containing an
  /// error and schema version.
  final List<SchemaVersionErrorItem>? schemaVersionErrors;

  DeleteSchemaVersionsResponse({
    this.schemaVersionErrors,
  });

  factory DeleteSchemaVersionsResponse.fromJson(Map<String, dynamic> json) {
    return DeleteSchemaVersionsResponse(
      schemaVersionErrors: (json['SchemaVersionErrors'] as List?)
          ?.whereNotNull()
          .map(
              (e) => SchemaVersionErrorItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final schemaVersionErrors = this.schemaVersionErrors;
    return {
      if (schemaVersionErrors != null)
        'SchemaVersionErrors': schemaVersionErrors,
    };
  }
}

class DeleteSecurityConfigurationResponse {
  DeleteSecurityConfigurationResponse();

  factory DeleteSecurityConfigurationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteSecurityConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteTableResponse {
  DeleteTableResponse();

  factory DeleteTableResponse.fromJson(Map<String, dynamic> _) {
    return DeleteTableResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteTableVersionResponse {
  DeleteTableVersionResponse();

  factory DeleteTableVersionResponse.fromJson(Map<String, dynamic> _) {
    return DeleteTableVersionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteTriggerResponse {
  /// The name of the trigger that was deleted.
  final String? name;

  DeleteTriggerResponse({
    this.name,
  });

  factory DeleteTriggerResponse.fromJson(Map<String, dynamic> json) {
    return DeleteTriggerResponse(
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      if (name != null) 'Name': name,
    };
  }
}

class DeleteUserDefinedFunctionResponse {
  DeleteUserDefinedFunctionResponse();

  factory DeleteUserDefinedFunctionResponse.fromJson(Map<String, dynamic> _) {
    return DeleteUserDefinedFunctionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteWorkflowResponse {
  /// Name of the workflow specified in input.
  final String? name;

  DeleteWorkflowResponse({
    this.name,
  });

  factory DeleteWorkflowResponse.fromJson(Map<String, dynamic> json) {
    return DeleteWorkflowResponse(
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      if (name != null) 'Name': name,
    };
  }
}

/// A development endpoint where a developer can remotely debug extract,
/// transform, and load (ETL) scripts.
class DevEndpoint {
  /// A map of arguments used to configure the <code>DevEndpoint</code>.
  ///
  /// Valid arguments are:
  ///
  /// <ul>
  /// <li>
  /// <code>"--enable-glue-datacatalog": ""</code>
  /// </li>
  /// </ul>
  /// You can specify a version of Python support for development endpoints by
  /// using the <code>Arguments</code> parameter in the
  /// <code>CreateDevEndpoint</code> or <code>UpdateDevEndpoint</code> APIs. If no
  /// arguments are provided, the version defaults to Python 2.
  final Map<String, String>? arguments;

  /// The AWS Availability Zone where this <code>DevEndpoint</code> is located.
  final String? availabilityZone;

  /// The point in time at which this DevEndpoint was created.
  final DateTime? createdTimestamp;

  /// The name of the <code>DevEndpoint</code>.
  final String? endpointName;

  /// The path to one or more Java <code>.jar</code> files in an S3 bucket that
  /// should be loaded in your <code>DevEndpoint</code>.
  /// <note>
  /// You can only use pure Java/Scala libraries with a <code>DevEndpoint</code>.
  /// </note>
  final String? extraJarsS3Path;

  /// The paths to one or more Python libraries in an Amazon S3 bucket that should
  /// be loaded in your <code>DevEndpoint</code>. Multiple values must be complete
  /// paths separated by a comma.
  /// <note>
  /// You can only use pure Python libraries with a <code>DevEndpoint</code>.
  /// Libraries that rely on C extensions, such as the <a
  /// href="http://pandas.pydata.org/">pandas</a> Python data analysis library,
  /// are not currently supported.
  /// </note>
  final String? extraPythonLibsS3Path;

  /// The reason for a current failure in this <code>DevEndpoint</code>.
  final String? failureReason;

  /// Glue version determines the versions of Apache Spark and Python that Glue
  /// supports. The Python version indicates the version supported for running
  /// your ETL scripts on development endpoints.
  ///
  /// For more information about the available Glue versions and corresponding
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
  final String? glueVersion;

  /// The point in time at which this <code>DevEndpoint</code> was last modified.
  final DateTime? lastModifiedTimestamp;

  /// The status of the last update.
  final String? lastUpdateStatus;

  /// The number of Glue Data Processing Units (DPUs) allocated to this
  /// <code>DevEndpoint</code>.
  final int? numberOfNodes;

  /// The number of workers of a defined <code>workerType</code> that are
  /// allocated to the development endpoint.
  ///
  /// The maximum number of workers you can define are 299 for <code>G.1X</code>,
  /// and 149 for <code>G.2X</code>.
  final int? numberOfWorkers;

  /// A private IP address to access the <code>DevEndpoint</code> within a VPC if
  /// the <code>DevEndpoint</code> is created within one. The
  /// <code>PrivateAddress</code> field is present only when you create the
  /// <code>DevEndpoint</code> within your VPC.
  final String? privateAddress;

  /// The public IP address used by this <code>DevEndpoint</code>. The
  /// <code>PublicAddress</code> field is present only when you create a
  /// non-virtual private cloud (VPC) <code>DevEndpoint</code>.
  final String? publicAddress;

  /// The public key to be used by this <code>DevEndpoint</code> for
  /// authentication. This attribute is provided for backward compatibility
  /// because the recommended attribute to use is public keys.
  final String? publicKey;

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
  final List<String>? publicKeys;

  /// The Amazon Resource Name (ARN) of the IAM role used in this
  /// <code>DevEndpoint</code>.
  final String? roleArn;

  /// The name of the <code>SecurityConfiguration</code> structure to be used with
  /// this <code>DevEndpoint</code>.
  final String? securityConfiguration;

  /// A list of security group identifiers used in this <code>DevEndpoint</code>.
  final List<String>? securityGroupIds;

  /// The current status of this <code>DevEndpoint</code>.
  final String? status;

  /// The subnet ID for this <code>DevEndpoint</code>.
  final String? subnetId;

  /// The ID of the virtual private cloud (VPC) used by this
  /// <code>DevEndpoint</code>.
  final String? vpcId;

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
  final WorkerType? workerType;

  /// The YARN endpoint address used by this <code>DevEndpoint</code>.
  final String? yarnEndpointAddress;

  /// The Apache Zeppelin port for the remote Apache Spark interpreter.
  final int? zeppelinRemoteSparkInterpreterPort;

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

  factory DevEndpoint.fromJson(Map<String, dynamic> json) {
    return DevEndpoint(
      arguments: (json['Arguments'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      availabilityZone: json['AvailabilityZone'] as String?,
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      endpointName: json['EndpointName'] as String?,
      extraJarsS3Path: json['ExtraJarsS3Path'] as String?,
      extraPythonLibsS3Path: json['ExtraPythonLibsS3Path'] as String?,
      failureReason: json['FailureReason'] as String?,
      glueVersion: json['GlueVersion'] as String?,
      lastModifiedTimestamp: timeStampFromJson(json['LastModifiedTimestamp']),
      lastUpdateStatus: json['LastUpdateStatus'] as String?,
      numberOfNodes: json['NumberOfNodes'] as int?,
      numberOfWorkers: json['NumberOfWorkers'] as int?,
      privateAddress: json['PrivateAddress'] as String?,
      publicAddress: json['PublicAddress'] as String?,
      publicKey: json['PublicKey'] as String?,
      publicKeys: (json['PublicKeys'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      roleArn: json['RoleArn'] as String?,
      securityConfiguration: json['SecurityConfiguration'] as String?,
      securityGroupIds: (json['SecurityGroupIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      status: json['Status'] as String?,
      subnetId: json['SubnetId'] as String?,
      vpcId: json['VpcId'] as String?,
      workerType: (json['WorkerType'] as String?)?.toWorkerType(),
      yarnEndpointAddress: json['YarnEndpointAddress'] as String?,
      zeppelinRemoteSparkInterpreterPort:
          json['ZeppelinRemoteSparkInterpreterPort'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final arguments = this.arguments;
    final availabilityZone = this.availabilityZone;
    final createdTimestamp = this.createdTimestamp;
    final endpointName = this.endpointName;
    final extraJarsS3Path = this.extraJarsS3Path;
    final extraPythonLibsS3Path = this.extraPythonLibsS3Path;
    final failureReason = this.failureReason;
    final glueVersion = this.glueVersion;
    final lastModifiedTimestamp = this.lastModifiedTimestamp;
    final lastUpdateStatus = this.lastUpdateStatus;
    final numberOfNodes = this.numberOfNodes;
    final numberOfWorkers = this.numberOfWorkers;
    final privateAddress = this.privateAddress;
    final publicAddress = this.publicAddress;
    final publicKey = this.publicKey;
    final publicKeys = this.publicKeys;
    final roleArn = this.roleArn;
    final securityConfiguration = this.securityConfiguration;
    final securityGroupIds = this.securityGroupIds;
    final status = this.status;
    final subnetId = this.subnetId;
    final vpcId = this.vpcId;
    final workerType = this.workerType;
    final yarnEndpointAddress = this.yarnEndpointAddress;
    final zeppelinRemoteSparkInterpreterPort =
        this.zeppelinRemoteSparkInterpreterPort;
    return {
      if (arguments != null) 'Arguments': arguments,
      if (availabilityZone != null) 'AvailabilityZone': availabilityZone,
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (endpointName != null) 'EndpointName': endpointName,
      if (extraJarsS3Path != null) 'ExtraJarsS3Path': extraJarsS3Path,
      if (extraPythonLibsS3Path != null)
        'ExtraPythonLibsS3Path': extraPythonLibsS3Path,
      if (failureReason != null) 'FailureReason': failureReason,
      if (glueVersion != null) 'GlueVersion': glueVersion,
      if (lastModifiedTimestamp != null)
        'LastModifiedTimestamp': unixTimestampToJson(lastModifiedTimestamp),
      if (lastUpdateStatus != null) 'LastUpdateStatus': lastUpdateStatus,
      if (numberOfNodes != null) 'NumberOfNodes': numberOfNodes,
      if (numberOfWorkers != null) 'NumberOfWorkers': numberOfWorkers,
      if (privateAddress != null) 'PrivateAddress': privateAddress,
      if (publicAddress != null) 'PublicAddress': publicAddress,
      if (publicKey != null) 'PublicKey': publicKey,
      if (publicKeys != null) 'PublicKeys': publicKeys,
      if (roleArn != null) 'RoleArn': roleArn,
      if (securityConfiguration != null)
        'SecurityConfiguration': securityConfiguration,
      if (securityGroupIds != null) 'SecurityGroupIds': securityGroupIds,
      if (status != null) 'Status': status,
      if (subnetId != null) 'SubnetId': subnetId,
      if (vpcId != null) 'VpcId': vpcId,
      if (workerType != null) 'WorkerType': workerType.toValue(),
      if (yarnEndpointAddress != null)
        'YarnEndpointAddress': yarnEndpointAddress,
      if (zeppelinRemoteSparkInterpreterPort != null)
        'ZeppelinRemoteSparkInterpreterPort':
            zeppelinRemoteSparkInterpreterPort,
    };
  }
}

/// Custom libraries to be loaded into a development endpoint.
class DevEndpointCustomLibraries {
  /// The path to one or more Java <code>.jar</code> files in an S3 bucket that
  /// should be loaded in your <code>DevEndpoint</code>.
  /// <note>
  /// You can only use pure Java/Scala libraries with a <code>DevEndpoint</code>.
  /// </note>
  final String? extraJarsS3Path;

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
  final String? extraPythonLibsS3Path;

  DevEndpointCustomLibraries({
    this.extraJarsS3Path,
    this.extraPythonLibsS3Path,
  });

  factory DevEndpointCustomLibraries.fromJson(Map<String, dynamic> json) {
    return DevEndpointCustomLibraries(
      extraJarsS3Path: json['ExtraJarsS3Path'] as String?,
      extraPythonLibsS3Path: json['ExtraPythonLibsS3Path'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final extraJarsS3Path = this.extraJarsS3Path;
    final extraPythonLibsS3Path = this.extraPythonLibsS3Path;
    return {
      if (extraJarsS3Path != null) 'ExtraJarsS3Path': extraJarsS3Path,
      if (extraPythonLibsS3Path != null)
        'ExtraPythonLibsS3Path': extraPythonLibsS3Path,
    };
  }
}

/// Defines column statistics supported for floating-point number data columns.
class DoubleColumnStatisticsData {
  /// The number of distinct values in a column.
  final int numberOfDistinctValues;

  /// The number of null values in the column.
  final int numberOfNulls;

  /// The highest value in the column.
  final double? maximumValue;

  /// The lowest value in the column.
  final double? minimumValue;

  DoubleColumnStatisticsData({
    required this.numberOfDistinctValues,
    required this.numberOfNulls,
    this.maximumValue,
    this.minimumValue,
  });

  factory DoubleColumnStatisticsData.fromJson(Map<String, dynamic> json) {
    return DoubleColumnStatisticsData(
      numberOfDistinctValues: json['NumberOfDistinctValues'] as int,
      numberOfNulls: json['NumberOfNulls'] as int,
      maximumValue: json['MaximumValue'] as double?,
      minimumValue: json['MinimumValue'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final numberOfDistinctValues = this.numberOfDistinctValues;
    final numberOfNulls = this.numberOfNulls;
    final maximumValue = this.maximumValue;
    final minimumValue = this.minimumValue;
    return {
      'NumberOfDistinctValues': numberOfDistinctValues,
      'NumberOfNulls': numberOfNulls,
      if (maximumValue != null) 'MaximumValue': maximumValue,
      if (minimumValue != null) 'MinimumValue': minimumValue,
    };
  }
}

/// Specifies an Amazon DynamoDB table to crawl.
class DynamoDBTarget {
  /// The name of the DynamoDB table to crawl.
  final String? path;

  /// Indicates whether to scan all the records, or to sample rows from the table.
  /// Scanning all the records can take a long time when the table is not a high
  /// throughput table.
  ///
  /// A value of <code>true</code> means to scan all records, while a value of
  /// <code>false</code> means to sample the records. If no value is specified,
  /// the value defaults to <code>true</code>.
  final bool? scanAll;

  /// The percentage of the configured read capacity units to use by the Glue
  /// crawler. Read capacity units is a term defined by DynamoDB, and is a numeric
  /// value that acts as rate limiter for the number of reads that can be
  /// performed on that table per second.
  ///
  /// The valid values are null or a value between 0.1 to 1.5. A null value is
  /// used when user does not provide a value, and defaults to 0.5 of the
  /// configured Read Capacity Unit (for provisioned tables), or 0.25 of the max
  /// configured Read Capacity Unit (for tables using on-demand mode).
  final double? scanRate;

  DynamoDBTarget({
    this.path,
    this.scanAll,
    this.scanRate,
  });

  factory DynamoDBTarget.fromJson(Map<String, dynamic> json) {
    return DynamoDBTarget(
      path: json['Path'] as String?,
      scanAll: json['scanAll'] as bool?,
      scanRate: json['scanRate'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final path = this.path;
    final scanAll = this.scanAll;
    final scanRate = this.scanRate;
    return {
      if (path != null) 'Path': path,
      if (scanAll != null) 'scanAll': scanAll,
      if (scanRate != null) 'scanRate': scanRate,
    };
  }
}

/// An edge represents a directed connection between two Glue components that
/// are part of the workflow the edge belongs to.
class Edge {
  /// The unique of the node within the workflow where the edge ends.
  final String? destinationId;

  /// The unique of the node within the workflow where the edge starts.
  final String? sourceId;

  Edge({
    this.destinationId,
    this.sourceId,
  });

  factory Edge.fromJson(Map<String, dynamic> json) {
    return Edge(
      destinationId: json['DestinationId'] as String?,
      sourceId: json['SourceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destinationId = this.destinationId;
    final sourceId = this.sourceId;
    return {
      if (destinationId != null) 'DestinationId': destinationId,
      if (sourceId != null) 'SourceId': sourceId,
    };
  }
}

enum EnableHybridValues {
  $true,
  $false,
}

extension on EnableHybridValues {
  String toValue() {
    switch (this) {
      case EnableHybridValues.$true:
        return 'TRUE';
      case EnableHybridValues.$false:
        return 'FALSE';
    }
  }
}

extension on String {
  EnableHybridValues toEnableHybridValues() {
    switch (this) {
      case 'TRUE':
        return EnableHybridValues.$true;
      case 'FALSE':
        return EnableHybridValues.$false;
    }
    throw Exception('$this is not known in enum EnableHybridValues');
  }
}

/// Specifies the encryption-at-rest configuration for the Data Catalog.
class EncryptionAtRest {
  /// The encryption-at-rest mode for encrypting Data Catalog data.
  final CatalogEncryptionMode catalogEncryptionMode;

  /// The ID of the KMS key to use for encryption at rest.
  final String? sseAwsKmsKeyId;

  EncryptionAtRest({
    required this.catalogEncryptionMode,
    this.sseAwsKmsKeyId,
  });

  factory EncryptionAtRest.fromJson(Map<String, dynamic> json) {
    return EncryptionAtRest(
      catalogEncryptionMode:
          (json['CatalogEncryptionMode'] as String).toCatalogEncryptionMode(),
      sseAwsKmsKeyId: json['SseAwsKmsKeyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final catalogEncryptionMode = this.catalogEncryptionMode;
    final sseAwsKmsKeyId = this.sseAwsKmsKeyId;
    return {
      'CatalogEncryptionMode': catalogEncryptionMode.toValue(),
      if (sseAwsKmsKeyId != null) 'SseAwsKmsKeyId': sseAwsKmsKeyId,
    };
  }
}

/// Specifies an encryption configuration.
class EncryptionConfiguration {
  /// The encryption configuration for Amazon CloudWatch.
  final CloudWatchEncryption? cloudWatchEncryption;

  /// The encryption configuration for job bookmarks.
  final JobBookmarksEncryption? jobBookmarksEncryption;

  /// The encryption configuration for Amazon Simple Storage Service (Amazon S3)
  /// data.
  final List<S3Encryption>? s3Encryption;

  EncryptionConfiguration({
    this.cloudWatchEncryption,
    this.jobBookmarksEncryption,
    this.s3Encryption,
  });

  factory EncryptionConfiguration.fromJson(Map<String, dynamic> json) {
    return EncryptionConfiguration(
      cloudWatchEncryption: json['CloudWatchEncryption'] != null
          ? CloudWatchEncryption.fromJson(
              json['CloudWatchEncryption'] as Map<String, dynamic>)
          : null,
      jobBookmarksEncryption: json['JobBookmarksEncryption'] != null
          ? JobBookmarksEncryption.fromJson(
              json['JobBookmarksEncryption'] as Map<String, dynamic>)
          : null,
      s3Encryption: (json['S3Encryption'] as List?)
          ?.whereNotNull()
          .map((e) => S3Encryption.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchEncryption = this.cloudWatchEncryption;
    final jobBookmarksEncryption = this.jobBookmarksEncryption;
    final s3Encryption = this.s3Encryption;
    return {
      if (cloudWatchEncryption != null)
        'CloudWatchEncryption': cloudWatchEncryption,
      if (jobBookmarksEncryption != null)
        'JobBookmarksEncryption': jobBookmarksEncryption,
      if (s3Encryption != null) 'S3Encryption': s3Encryption,
    };
  }
}

/// Contains details about an error.
class ErrorDetail {
  /// The code associated with this error.
  final String? errorCode;

  /// A message describing the error.
  final String? errorMessage;

  ErrorDetail({
    this.errorCode,
    this.errorMessage,
  });

  factory ErrorDetail.fromJson(Map<String, dynamic> json) {
    return ErrorDetail(
      errorCode: json['ErrorCode'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    return {
      if (errorCode != null) 'ErrorCode': errorCode,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
    };
  }
}

/// An object containing error details.
class ErrorDetails {
  /// The error code for an error.
  final String? errorCode;

  /// The error message for an error.
  final String? errorMessage;

  ErrorDetails({
    this.errorCode,
    this.errorMessage,
  });

  factory ErrorDetails.fromJson(Map<String, dynamic> json) {
    return ErrorDetails(
      errorCode: json['ErrorCode'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    return {
      if (errorCode != null) 'ErrorCode': errorCode,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
    };
  }
}

/// Evaluation metrics provide an estimate of the quality of your machine
/// learning transform.
class EvaluationMetrics {
  /// The type of machine learning transform.
  final TransformType transformType;

  /// The evaluation metrics for the find matches algorithm.
  final FindMatchesMetrics? findMatchesMetrics;

  EvaluationMetrics({
    required this.transformType,
    this.findMatchesMetrics,
  });

  factory EvaluationMetrics.fromJson(Map<String, dynamic> json) {
    return EvaluationMetrics(
      transformType: (json['TransformType'] as String).toTransformType(),
      findMatchesMetrics: json['FindMatchesMetrics'] != null
          ? FindMatchesMetrics.fromJson(
              json['FindMatchesMetrics'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final transformType = this.transformType;
    final findMatchesMetrics = this.findMatchesMetrics;
    return {
      'TransformType': transformType.toValue(),
      if (findMatchesMetrics != null) 'FindMatchesMetrics': findMatchesMetrics,
    };
  }
}

/// An execution property of a job.
class ExecutionProperty {
  /// The maximum number of concurrent runs allowed for the job. The default is 1.
  /// An error is returned when this threshold is reached. The maximum value you
  /// can specify is controlled by a service limit.
  final int? maxConcurrentRuns;

  ExecutionProperty({
    this.maxConcurrentRuns,
  });

  factory ExecutionProperty.fromJson(Map<String, dynamic> json) {
    return ExecutionProperty(
      maxConcurrentRuns: json['MaxConcurrentRuns'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final maxConcurrentRuns = this.maxConcurrentRuns;
    return {
      if (maxConcurrentRuns != null) 'MaxConcurrentRuns': maxConcurrentRuns,
    };
  }
}

enum ExistCondition {
  mustExist,
  notExist,
  none,
}

extension on ExistCondition {
  String toValue() {
    switch (this) {
      case ExistCondition.mustExist:
        return 'MUST_EXIST';
      case ExistCondition.notExist:
        return 'NOT_EXIST';
      case ExistCondition.none:
        return 'NONE';
    }
  }
}

extension on String {
  ExistCondition toExistCondition() {
    switch (this) {
      case 'MUST_EXIST':
        return ExistCondition.mustExist;
      case 'NOT_EXIST':
        return ExistCondition.notExist;
      case 'NONE':
        return ExistCondition.none;
    }
    throw Exception('$this is not known in enum ExistCondition');
  }
}

/// Specifies configuration properties for an exporting labels task run.
class ExportLabelsTaskRunProperties {
  /// The Amazon Simple Storage Service (Amazon S3) path where you will export the
  /// labels.
  final String? outputS3Path;

  ExportLabelsTaskRunProperties({
    this.outputS3Path,
  });

  factory ExportLabelsTaskRunProperties.fromJson(Map<String, dynamic> json) {
    return ExportLabelsTaskRunProperties(
      outputS3Path: json['OutputS3Path'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final outputS3Path = this.outputS3Path;
    return {
      if (outputS3Path != null) 'OutputS3Path': outputS3Path,
    };
  }
}

/// The evaluation metrics for the find matches algorithm. The quality of your
/// machine learning transform is measured by getting your transform to predict
/// some matches and comparing the results to known matches from the same
/// dataset. The quality metrics are based on a subset of your data, so they are
/// not precise.
class FindMatchesMetrics {
  /// The area under the precision/recall curve (AUPRC) is a single number
  /// measuring the overall quality of the transform, that is independent of the
  /// choice made for precision vs. recall. Higher values indicate that you have a
  /// more attractive precision vs. recall tradeoff.
  ///
  /// For more information, see <a
  /// href="https://en.wikipedia.org/wiki/Precision_and_recall">Precision and
  /// recall</a> in Wikipedia.
  final double? areaUnderPRCurve;

  /// A list of <code>ColumnImportance</code> structures containing column
  /// importance metrics, sorted in order of descending importance.
  final List<ColumnImportance>? columnImportances;

  /// The confusion matrix shows you what your transform is predicting accurately
  /// and what types of errors it is making.
  ///
  /// For more information, see <a
  /// href="https://en.wikipedia.org/wiki/Confusion_matrix">Confusion matrix</a>
  /// in Wikipedia.
  final ConfusionMatrix? confusionMatrix;

  /// The maximum F1 metric indicates the transform's accuracy between 0 and 1,
  /// where 1 is the best accuracy.
  ///
  /// For more information, see <a
  /// href="https://en.wikipedia.org/wiki/F1_score">F1 score</a> in Wikipedia.
  final double? f1;

  /// The precision metric indicates when often your transform is correct when it
  /// predicts a match. Specifically, it measures how well the transform finds
  /// true positives from the total true positives possible.
  ///
  /// For more information, see <a
  /// href="https://en.wikipedia.org/wiki/Precision_and_recall">Precision and
  /// recall</a> in Wikipedia.
  final double? precision;

  /// The recall metric indicates that for an actual match, how often your
  /// transform predicts the match. Specifically, it measures how well the
  /// transform finds true positives from the total records in the source data.
  ///
  /// For more information, see <a
  /// href="https://en.wikipedia.org/wiki/Precision_and_recall">Precision and
  /// recall</a> in Wikipedia.
  final double? recall;

  FindMatchesMetrics({
    this.areaUnderPRCurve,
    this.columnImportances,
    this.confusionMatrix,
    this.f1,
    this.precision,
    this.recall,
  });

  factory FindMatchesMetrics.fromJson(Map<String, dynamic> json) {
    return FindMatchesMetrics(
      areaUnderPRCurve: json['AreaUnderPRCurve'] as double?,
      columnImportances: (json['ColumnImportances'] as List?)
          ?.whereNotNull()
          .map((e) => ColumnImportance.fromJson(e as Map<String, dynamic>))
          .toList(),
      confusionMatrix: json['ConfusionMatrix'] != null
          ? ConfusionMatrix.fromJson(
              json['ConfusionMatrix'] as Map<String, dynamic>)
          : null,
      f1: json['F1'] as double?,
      precision: json['Precision'] as double?,
      recall: json['Recall'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final areaUnderPRCurve = this.areaUnderPRCurve;
    final columnImportances = this.columnImportances;
    final confusionMatrix = this.confusionMatrix;
    final f1 = this.f1;
    final precision = this.precision;
    final recall = this.recall;
    return {
      if (areaUnderPRCurve != null) 'AreaUnderPRCurve': areaUnderPRCurve,
      if (columnImportances != null) 'ColumnImportances': columnImportances,
      if (confusionMatrix != null) 'ConfusionMatrix': confusionMatrix,
      if (f1 != null) 'F1': f1,
      if (precision != null) 'Precision': precision,
      if (recall != null) 'Recall': recall,
    };
  }
}

/// The parameters to configure the find matches transform.
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
  final double? accuracyCostTradeoff;

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
  final bool? enforceProvidedLabels;

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
  final double? precisionRecallTradeoff;

  /// The name of a column that uniquely identifies rows in the source table. Used
  /// to help identify matching records.
  final String? primaryKeyColumnName;

  FindMatchesParameters({
    this.accuracyCostTradeoff,
    this.enforceProvidedLabels,
    this.precisionRecallTradeoff,
    this.primaryKeyColumnName,
  });

  factory FindMatchesParameters.fromJson(Map<String, dynamic> json) {
    return FindMatchesParameters(
      accuracyCostTradeoff: json['AccuracyCostTradeoff'] as double?,
      enforceProvidedLabels: json['EnforceProvidedLabels'] as bool?,
      precisionRecallTradeoff: json['PrecisionRecallTradeoff'] as double?,
      primaryKeyColumnName: json['PrimaryKeyColumnName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accuracyCostTradeoff = this.accuracyCostTradeoff;
    final enforceProvidedLabels = this.enforceProvidedLabels;
    final precisionRecallTradeoff = this.precisionRecallTradeoff;
    final primaryKeyColumnName = this.primaryKeyColumnName;
    return {
      if (accuracyCostTradeoff != null)
        'AccuracyCostTradeoff': accuracyCostTradeoff,
      if (enforceProvidedLabels != null)
        'EnforceProvidedLabels': enforceProvidedLabels,
      if (precisionRecallTradeoff != null)
        'PrecisionRecallTradeoff': precisionRecallTradeoff,
      if (primaryKeyColumnName != null)
        'PrimaryKeyColumnName': primaryKeyColumnName,
    };
  }
}

/// Specifies configuration properties for a Find Matches task run.
class FindMatchesTaskRunProperties {
  /// The job ID for the Find Matches task run.
  final String? jobId;

  /// The name assigned to the job for the Find Matches task run.
  final String? jobName;

  /// The job run ID for the Find Matches task run.
  final String? jobRunId;

  FindMatchesTaskRunProperties({
    this.jobId,
    this.jobName,
    this.jobRunId,
  });

  factory FindMatchesTaskRunProperties.fromJson(Map<String, dynamic> json) {
    return FindMatchesTaskRunProperties(
      jobId: json['JobId'] as String?,
      jobName: json['JobName'] as String?,
      jobRunId: json['JobRunId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    final jobName = this.jobName;
    final jobRunId = this.jobRunId;
    return {
      if (jobId != null) 'JobId': jobId,
      if (jobName != null) 'JobName': jobName,
      if (jobRunId != null) 'JobRunId': jobRunId,
    };
  }
}

class GetCatalogImportStatusResponse {
  /// The status of the specified catalog migration.
  final CatalogImportStatus? importStatus;

  GetCatalogImportStatusResponse({
    this.importStatus,
  });

  factory GetCatalogImportStatusResponse.fromJson(Map<String, dynamic> json) {
    return GetCatalogImportStatusResponse(
      importStatus: json['ImportStatus'] != null
          ? CatalogImportStatus.fromJson(
              json['ImportStatus'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final importStatus = this.importStatus;
    return {
      if (importStatus != null) 'ImportStatus': importStatus,
    };
  }
}

class GetClassifierResponse {
  /// The requested classifier.
  final Classifier? classifier;

  GetClassifierResponse({
    this.classifier,
  });

  factory GetClassifierResponse.fromJson(Map<String, dynamic> json) {
    return GetClassifierResponse(
      classifier: json['Classifier'] != null
          ? Classifier.fromJson(json['Classifier'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final classifier = this.classifier;
    return {
      if (classifier != null) 'Classifier': classifier,
    };
  }
}

class GetClassifiersResponse {
  /// The requested list of classifier objects.
  final List<Classifier>? classifiers;

  /// A continuation token.
  final String? nextToken;

  GetClassifiersResponse({
    this.classifiers,
    this.nextToken,
  });

  factory GetClassifiersResponse.fromJson(Map<String, dynamic> json) {
    return GetClassifiersResponse(
      classifiers: (json['Classifiers'] as List?)
          ?.whereNotNull()
          .map((e) => Classifier.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final classifiers = this.classifiers;
    final nextToken = this.nextToken;
    return {
      if (classifiers != null) 'Classifiers': classifiers,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class GetColumnStatisticsForPartitionResponse {
  /// List of ColumnStatistics that failed to be retrieved.
  final List<ColumnStatistics>? columnStatisticsList;

  /// Error occurred during retrieving column statistics data.
  final List<ColumnError>? errors;

  GetColumnStatisticsForPartitionResponse({
    this.columnStatisticsList,
    this.errors,
  });

  factory GetColumnStatisticsForPartitionResponse.fromJson(
      Map<String, dynamic> json) {
    return GetColumnStatisticsForPartitionResponse(
      columnStatisticsList: (json['ColumnStatisticsList'] as List?)
          ?.whereNotNull()
          .map((e) => ColumnStatistics.fromJson(e as Map<String, dynamic>))
          .toList(),
      errors: (json['Errors'] as List?)
          ?.whereNotNull()
          .map((e) => ColumnError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final columnStatisticsList = this.columnStatisticsList;
    final errors = this.errors;
    return {
      if (columnStatisticsList != null)
        'ColumnStatisticsList': columnStatisticsList,
      if (errors != null) 'Errors': errors,
    };
  }
}

class GetColumnStatisticsForTableResponse {
  /// List of ColumnStatistics that failed to be retrieved.
  final List<ColumnStatistics>? columnStatisticsList;

  /// List of ColumnStatistics that failed to be retrieved.
  final List<ColumnError>? errors;

  GetColumnStatisticsForTableResponse({
    this.columnStatisticsList,
    this.errors,
  });

  factory GetColumnStatisticsForTableResponse.fromJson(
      Map<String, dynamic> json) {
    return GetColumnStatisticsForTableResponse(
      columnStatisticsList: (json['ColumnStatisticsList'] as List?)
          ?.whereNotNull()
          .map((e) => ColumnStatistics.fromJson(e as Map<String, dynamic>))
          .toList(),
      errors: (json['Errors'] as List?)
          ?.whereNotNull()
          .map((e) => ColumnError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final columnStatisticsList = this.columnStatisticsList;
    final errors = this.errors;
    return {
      if (columnStatisticsList != null)
        'ColumnStatisticsList': columnStatisticsList,
      if (errors != null) 'Errors': errors,
    };
  }
}

class GetConnectionResponse {
  /// The requested connection definition.
  final Connection? connection;

  GetConnectionResponse({
    this.connection,
  });

  factory GetConnectionResponse.fromJson(Map<String, dynamic> json) {
    return GetConnectionResponse(
      connection: json['Connection'] != null
          ? Connection.fromJson(json['Connection'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final connection = this.connection;
    return {
      if (connection != null) 'Connection': connection,
    };
  }
}

/// Filters the connection definitions that are returned by the
/// <code>GetConnections</code> API operation.
class GetConnectionsFilter {
  /// The type of connections to return. Currently, SFTP is not supported.
  final ConnectionType? connectionType;

  /// A criteria string that must match the criteria recorded in the connection
  /// definition for that connection definition to be returned.
  final List<String>? matchCriteria;

  GetConnectionsFilter({
    this.connectionType,
    this.matchCriteria,
  });

  factory GetConnectionsFilter.fromJson(Map<String, dynamic> json) {
    return GetConnectionsFilter(
      connectionType: (json['ConnectionType'] as String?)?.toConnectionType(),
      matchCriteria: (json['MatchCriteria'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final connectionType = this.connectionType;
    final matchCriteria = this.matchCriteria;
    return {
      if (connectionType != null) 'ConnectionType': connectionType.toValue(),
      if (matchCriteria != null) 'MatchCriteria': matchCriteria,
    };
  }
}

class GetConnectionsResponse {
  /// A list of requested connection definitions.
  final List<Connection>? connectionList;

  /// A continuation token, if the list of connections returned does not include
  /// the last of the filtered connections.
  final String? nextToken;

  GetConnectionsResponse({
    this.connectionList,
    this.nextToken,
  });

  factory GetConnectionsResponse.fromJson(Map<String, dynamic> json) {
    return GetConnectionsResponse(
      connectionList: (json['ConnectionList'] as List?)
          ?.whereNotNull()
          .map((e) => Connection.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectionList = this.connectionList;
    final nextToken = this.nextToken;
    return {
      if (connectionList != null) 'ConnectionList': connectionList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class GetCrawlerMetricsResponse {
  /// A list of metrics for the specified crawler.
  final List<CrawlerMetrics>? crawlerMetricsList;

  /// A continuation token, if the returned list does not contain the last metric
  /// available.
  final String? nextToken;

  GetCrawlerMetricsResponse({
    this.crawlerMetricsList,
    this.nextToken,
  });

  factory GetCrawlerMetricsResponse.fromJson(Map<String, dynamic> json) {
    return GetCrawlerMetricsResponse(
      crawlerMetricsList: (json['CrawlerMetricsList'] as List?)
          ?.whereNotNull()
          .map((e) => CrawlerMetrics.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final crawlerMetricsList = this.crawlerMetricsList;
    final nextToken = this.nextToken;
    return {
      if (crawlerMetricsList != null) 'CrawlerMetricsList': crawlerMetricsList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class GetCrawlerResponse {
  /// The metadata for the specified crawler.
  final Crawler? crawler;

  GetCrawlerResponse({
    this.crawler,
  });

  factory GetCrawlerResponse.fromJson(Map<String, dynamic> json) {
    return GetCrawlerResponse(
      crawler: json['Crawler'] != null
          ? Crawler.fromJson(json['Crawler'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final crawler = this.crawler;
    return {
      if (crawler != null) 'Crawler': crawler,
    };
  }
}

class GetCrawlersResponse {
  /// A list of crawler metadata.
  final List<Crawler>? crawlers;

  /// A continuation token, if the returned list has not reached the end of those
  /// defined in this customer account.
  final String? nextToken;

  GetCrawlersResponse({
    this.crawlers,
    this.nextToken,
  });

  factory GetCrawlersResponse.fromJson(Map<String, dynamic> json) {
    return GetCrawlersResponse(
      crawlers: (json['Crawlers'] as List?)
          ?.whereNotNull()
          .map((e) => Crawler.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final crawlers = this.crawlers;
    final nextToken = this.nextToken;
    return {
      if (crawlers != null) 'Crawlers': crawlers,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class GetDataCatalogEncryptionSettingsResponse {
  /// The requested security configuration.
  final DataCatalogEncryptionSettings? dataCatalogEncryptionSettings;

  GetDataCatalogEncryptionSettingsResponse({
    this.dataCatalogEncryptionSettings,
  });

  factory GetDataCatalogEncryptionSettingsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetDataCatalogEncryptionSettingsResponse(
      dataCatalogEncryptionSettings:
          json['DataCatalogEncryptionSettings'] != null
              ? DataCatalogEncryptionSettings.fromJson(
                  json['DataCatalogEncryptionSettings'] as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dataCatalogEncryptionSettings = this.dataCatalogEncryptionSettings;
    return {
      if (dataCatalogEncryptionSettings != null)
        'DataCatalogEncryptionSettings': dataCatalogEncryptionSettings,
    };
  }
}

class GetDatabaseResponse {
  /// The definition of the specified database in the Data Catalog.
  final Database? database;

  GetDatabaseResponse({
    this.database,
  });

  factory GetDatabaseResponse.fromJson(Map<String, dynamic> json) {
    return GetDatabaseResponse(
      database: json['Database'] != null
          ? Database.fromJson(json['Database'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final database = this.database;
    return {
      if (database != null) 'Database': database,
    };
  }
}

class GetDatabasesResponse {
  /// A list of <code>Database</code> objects from the specified catalog.
  final List<Database> databaseList;

  /// A continuation token for paginating the returned list of tokens, returned if
  /// the current segment of the list is not the last.
  final String? nextToken;

  GetDatabasesResponse({
    required this.databaseList,
    this.nextToken,
  });

  factory GetDatabasesResponse.fromJson(Map<String, dynamic> json) {
    return GetDatabasesResponse(
      databaseList: (json['DatabaseList'] as List)
          .whereNotNull()
          .map((e) => Database.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final databaseList = this.databaseList;
    final nextToken = this.nextToken;
    return {
      'DatabaseList': databaseList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class GetDataflowGraphResponse {
  /// A list of the edges in the resulting DAG.
  final List<CodeGenEdge>? dagEdges;

  /// A list of the nodes in the resulting DAG.
  final List<CodeGenNode>? dagNodes;

  GetDataflowGraphResponse({
    this.dagEdges,
    this.dagNodes,
  });

  factory GetDataflowGraphResponse.fromJson(Map<String, dynamic> json) {
    return GetDataflowGraphResponse(
      dagEdges: (json['DagEdges'] as List?)
          ?.whereNotNull()
          .map((e) => CodeGenEdge.fromJson(e as Map<String, dynamic>))
          .toList(),
      dagNodes: (json['DagNodes'] as List?)
          ?.whereNotNull()
          .map((e) => CodeGenNode.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dagEdges = this.dagEdges;
    final dagNodes = this.dagNodes;
    return {
      if (dagEdges != null) 'DagEdges': dagEdges,
      if (dagNodes != null) 'DagNodes': dagNodes,
    };
  }
}

class GetDevEndpointResponse {
  /// A <code>DevEndpoint</code> definition.
  final DevEndpoint? devEndpoint;

  GetDevEndpointResponse({
    this.devEndpoint,
  });

  factory GetDevEndpointResponse.fromJson(Map<String, dynamic> json) {
    return GetDevEndpointResponse(
      devEndpoint: json['DevEndpoint'] != null
          ? DevEndpoint.fromJson(json['DevEndpoint'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final devEndpoint = this.devEndpoint;
    return {
      if (devEndpoint != null) 'DevEndpoint': devEndpoint,
    };
  }
}

class GetDevEndpointsResponse {
  /// A list of <code>DevEndpoint</code> definitions.
  final List<DevEndpoint>? devEndpoints;

  /// A continuation token, if not all <code>DevEndpoint</code> definitions have
  /// yet been returned.
  final String? nextToken;

  GetDevEndpointsResponse({
    this.devEndpoints,
    this.nextToken,
  });

  factory GetDevEndpointsResponse.fromJson(Map<String, dynamic> json) {
    return GetDevEndpointsResponse(
      devEndpoints: (json['DevEndpoints'] as List?)
          ?.whereNotNull()
          .map((e) => DevEndpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final devEndpoints = this.devEndpoints;
    final nextToken = this.nextToken;
    return {
      if (devEndpoints != null) 'DevEndpoints': devEndpoints,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class GetJobBookmarkResponse {
  /// A structure that defines a point that a job can resume processing.
  final JobBookmarkEntry? jobBookmarkEntry;

  GetJobBookmarkResponse({
    this.jobBookmarkEntry,
  });

  factory GetJobBookmarkResponse.fromJson(Map<String, dynamic> json) {
    return GetJobBookmarkResponse(
      jobBookmarkEntry: json['JobBookmarkEntry'] != null
          ? JobBookmarkEntry.fromJson(
              json['JobBookmarkEntry'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final jobBookmarkEntry = this.jobBookmarkEntry;
    return {
      if (jobBookmarkEntry != null) 'JobBookmarkEntry': jobBookmarkEntry,
    };
  }
}

class GetJobResponse {
  /// The requested job definition.
  final Job? job;

  GetJobResponse({
    this.job,
  });

  factory GetJobResponse.fromJson(Map<String, dynamic> json) {
    return GetJobResponse(
      job: json['Job'] != null
          ? Job.fromJson(json['Job'] as Map<String, dynamic>)
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

class GetJobRunResponse {
  /// The requested job-run metadata.
  final JobRun? jobRun;

  GetJobRunResponse({
    this.jobRun,
  });

  factory GetJobRunResponse.fromJson(Map<String, dynamic> json) {
    return GetJobRunResponse(
      jobRun: json['JobRun'] != null
          ? JobRun.fromJson(json['JobRun'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final jobRun = this.jobRun;
    return {
      if (jobRun != null) 'JobRun': jobRun,
    };
  }
}

class GetJobRunsResponse {
  /// A list of job-run metadata objects.
  final List<JobRun>? jobRuns;

  /// A continuation token, if not all requested job runs have been returned.
  final String? nextToken;

  GetJobRunsResponse({
    this.jobRuns,
    this.nextToken,
  });

  factory GetJobRunsResponse.fromJson(Map<String, dynamic> json) {
    return GetJobRunsResponse(
      jobRuns: (json['JobRuns'] as List?)
          ?.whereNotNull()
          .map((e) => JobRun.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobRuns = this.jobRuns;
    final nextToken = this.nextToken;
    return {
      if (jobRuns != null) 'JobRuns': jobRuns,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class GetJobsResponse {
  /// A list of job definitions.
  final List<Job>? jobs;

  /// A continuation token, if not all job definitions have yet been returned.
  final String? nextToken;

  GetJobsResponse({
    this.jobs,
    this.nextToken,
  });

  factory GetJobsResponse.fromJson(Map<String, dynamic> json) {
    return GetJobsResponse(
      jobs: (json['Jobs'] as List?)
          ?.whereNotNull()
          .map((e) => Job.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobs = this.jobs;
    final nextToken = this.nextToken;
    return {
      if (jobs != null) 'Jobs': jobs,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class GetMLTaskRunResponse {
  /// The date and time when this task run was completed.
  final DateTime? completedOn;

  /// The error strings that are associated with the task run.
  final String? errorString;

  /// The amount of time (in seconds) that the task run consumed resources.
  final int? executionTime;

  /// The date and time when this task run was last modified.
  final DateTime? lastModifiedOn;

  /// The names of the log groups that are associated with the task run.
  final String? logGroupName;

  /// The list of properties that are associated with the task run.
  final TaskRunProperties? properties;

  /// The date and time when this task run started.
  final DateTime? startedOn;

  /// The status for this task run.
  final TaskStatusType? status;

  /// The unique run identifier associated with this run.
  final String? taskRunId;

  /// The unique identifier of the task run.
  final String? transformId;

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

  factory GetMLTaskRunResponse.fromJson(Map<String, dynamic> json) {
    return GetMLTaskRunResponse(
      completedOn: timeStampFromJson(json['CompletedOn']),
      errorString: json['ErrorString'] as String?,
      executionTime: json['ExecutionTime'] as int?,
      lastModifiedOn: timeStampFromJson(json['LastModifiedOn']),
      logGroupName: json['LogGroupName'] as String?,
      properties: json['Properties'] != null
          ? TaskRunProperties.fromJson(
              json['Properties'] as Map<String, dynamic>)
          : null,
      startedOn: timeStampFromJson(json['StartedOn']),
      status: (json['Status'] as String?)?.toTaskStatusType(),
      taskRunId: json['TaskRunId'] as String?,
      transformId: json['TransformId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final completedOn = this.completedOn;
    final errorString = this.errorString;
    final executionTime = this.executionTime;
    final lastModifiedOn = this.lastModifiedOn;
    final logGroupName = this.logGroupName;
    final properties = this.properties;
    final startedOn = this.startedOn;
    final status = this.status;
    final taskRunId = this.taskRunId;
    final transformId = this.transformId;
    return {
      if (completedOn != null) 'CompletedOn': unixTimestampToJson(completedOn),
      if (errorString != null) 'ErrorString': errorString,
      if (executionTime != null) 'ExecutionTime': executionTime,
      if (lastModifiedOn != null)
        'LastModifiedOn': unixTimestampToJson(lastModifiedOn),
      if (logGroupName != null) 'LogGroupName': logGroupName,
      if (properties != null) 'Properties': properties,
      if (startedOn != null) 'StartedOn': unixTimestampToJson(startedOn),
      if (status != null) 'Status': status.toValue(),
      if (taskRunId != null) 'TaskRunId': taskRunId,
      if (transformId != null) 'TransformId': transformId,
    };
  }
}

class GetMLTaskRunsResponse {
  /// A pagination token, if more results are available.
  final String? nextToken;

  /// A list of task runs that are associated with the transform.
  final List<TaskRun>? taskRuns;

  GetMLTaskRunsResponse({
    this.nextToken,
    this.taskRuns,
  });

  factory GetMLTaskRunsResponse.fromJson(Map<String, dynamic> json) {
    return GetMLTaskRunsResponse(
      nextToken: json['NextToken'] as String?,
      taskRuns: (json['TaskRuns'] as List?)
          ?.whereNotNull()
          .map((e) => TaskRun.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final taskRuns = this.taskRuns;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (taskRuns != null) 'TaskRuns': taskRuns,
    };
  }
}

class GetMLTransformResponse {
  /// The date and time when the transform was created.
  final DateTime? createdOn;

  /// A description of the transform.
  final String? description;

  /// The latest evaluation metrics.
  final EvaluationMetrics? evaluationMetrics;

  /// This value determines which version of Glue this machine learning transform
  /// is compatible with. Glue 1.0 is recommended for most customers. If the value
  /// is not set, the Glue compatibility defaults to Glue 0.9. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/release-notes.html#release-notes-versions">Glue
  /// Versions</a> in the developer guide.
  final String? glueVersion;

  /// A list of Glue table definitions used by the transform.
  final List<GlueTable>? inputRecordTables;

  /// The number of labels available for this transform.
  final int? labelCount;

  /// The date and time when the transform was last modified.
  final DateTime? lastModifiedOn;

  /// The number of Glue data processing units (DPUs) that are allocated to task
  /// runs for this transform. You can allocate from 2 to 100 DPUs; the default is
  /// 10. A DPU is a relative measure of processing power that consists of 4 vCPUs
  /// of compute capacity and 16 GB of memory. For more information, see the <a
  /// href="https://aws.amazon.com/glue/pricing/">Glue pricing page</a>.
  ///
  /// When the <code>WorkerType</code> field is set to a value other than
  /// <code>Standard</code>, the <code>MaxCapacity</code> field is set
  /// automatically and becomes read-only.
  final double? maxCapacity;

  /// The maximum number of times to retry a task for this transform after a task
  /// run fails.
  final int? maxRetries;

  /// The unique name given to the transform when it was created.
  final String? name;

  /// The number of workers of a defined <code>workerType</code> that are
  /// allocated when this task runs.
  final int? numberOfWorkers;

  /// The configuration parameters that are specific to the algorithm used.
  final TransformParameters? parameters;

  /// The name or Amazon Resource Name (ARN) of the IAM role with the required
  /// permissions.
  final String? role;

  /// The <code>Map&lt;Column, Type&gt;</code> object that represents the schema
  /// that this transform accepts. Has an upper bound of 100 columns.
  final List<SchemaColumn>? schema;

  /// The last known status of the transform (to indicate whether it can be used
  /// or not). One of "NOT_READY", "READY", or "DELETING".
  final TransformStatusType? status;

  /// The timeout for a task run for this transform in minutes. This is the
  /// maximum time that a task run for this transform can consume resources before
  /// it is terminated and enters <code>TIMEOUT</code> status. The default is
  /// 2,880 minutes (48 hours).
  final int? timeout;

  /// The encryption-at-rest settings of the transform that apply to accessing
  /// user data. Machine learning transforms can access user data encrypted in
  /// Amazon S3 using KMS.
  final TransformEncryption? transformEncryption;

  /// The unique identifier of the transform, generated at the time that the
  /// transform was created.
  final String? transformId;

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
  final WorkerType? workerType;

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
    this.transformEncryption,
    this.transformId,
    this.workerType,
  });

  factory GetMLTransformResponse.fromJson(Map<String, dynamic> json) {
    return GetMLTransformResponse(
      createdOn: timeStampFromJson(json['CreatedOn']),
      description: json['Description'] as String?,
      evaluationMetrics: json['EvaluationMetrics'] != null
          ? EvaluationMetrics.fromJson(
              json['EvaluationMetrics'] as Map<String, dynamic>)
          : null,
      glueVersion: json['GlueVersion'] as String?,
      inputRecordTables: (json['InputRecordTables'] as List?)
          ?.whereNotNull()
          .map((e) => GlueTable.fromJson(e as Map<String, dynamic>))
          .toList(),
      labelCount: json['LabelCount'] as int?,
      lastModifiedOn: timeStampFromJson(json['LastModifiedOn']),
      maxCapacity: json['MaxCapacity'] as double?,
      maxRetries: json['MaxRetries'] as int?,
      name: json['Name'] as String?,
      numberOfWorkers: json['NumberOfWorkers'] as int?,
      parameters: json['Parameters'] != null
          ? TransformParameters.fromJson(
              json['Parameters'] as Map<String, dynamic>)
          : null,
      role: json['Role'] as String?,
      schema: (json['Schema'] as List?)
          ?.whereNotNull()
          .map((e) => SchemaColumn.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['Status'] as String?)?.toTransformStatusType(),
      timeout: json['Timeout'] as int?,
      transformEncryption: json['TransformEncryption'] != null
          ? TransformEncryption.fromJson(
              json['TransformEncryption'] as Map<String, dynamic>)
          : null,
      transformId: json['TransformId'] as String?,
      workerType: (json['WorkerType'] as String?)?.toWorkerType(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdOn = this.createdOn;
    final description = this.description;
    final evaluationMetrics = this.evaluationMetrics;
    final glueVersion = this.glueVersion;
    final inputRecordTables = this.inputRecordTables;
    final labelCount = this.labelCount;
    final lastModifiedOn = this.lastModifiedOn;
    final maxCapacity = this.maxCapacity;
    final maxRetries = this.maxRetries;
    final name = this.name;
    final numberOfWorkers = this.numberOfWorkers;
    final parameters = this.parameters;
    final role = this.role;
    final schema = this.schema;
    final status = this.status;
    final timeout = this.timeout;
    final transformEncryption = this.transformEncryption;
    final transformId = this.transformId;
    final workerType = this.workerType;
    return {
      if (createdOn != null) 'CreatedOn': unixTimestampToJson(createdOn),
      if (description != null) 'Description': description,
      if (evaluationMetrics != null) 'EvaluationMetrics': evaluationMetrics,
      if (glueVersion != null) 'GlueVersion': glueVersion,
      if (inputRecordTables != null) 'InputRecordTables': inputRecordTables,
      if (labelCount != null) 'LabelCount': labelCount,
      if (lastModifiedOn != null)
        'LastModifiedOn': unixTimestampToJson(lastModifiedOn),
      if (maxCapacity != null) 'MaxCapacity': maxCapacity,
      if (maxRetries != null) 'MaxRetries': maxRetries,
      if (name != null) 'Name': name,
      if (numberOfWorkers != null) 'NumberOfWorkers': numberOfWorkers,
      if (parameters != null) 'Parameters': parameters,
      if (role != null) 'Role': role,
      if (schema != null) 'Schema': schema,
      if (status != null) 'Status': status.toValue(),
      if (timeout != null) 'Timeout': timeout,
      if (transformEncryption != null)
        'TransformEncryption': transformEncryption,
      if (transformId != null) 'TransformId': transformId,
      if (workerType != null) 'WorkerType': workerType.toValue(),
    };
  }
}

class GetMLTransformsResponse {
  /// A list of machine learning transforms.
  final List<MLTransform> transforms;

  /// A pagination token, if more results are available.
  final String? nextToken;

  GetMLTransformsResponse({
    required this.transforms,
    this.nextToken,
  });

  factory GetMLTransformsResponse.fromJson(Map<String, dynamic> json) {
    return GetMLTransformsResponse(
      transforms: (json['Transforms'] as List)
          .whereNotNull()
          .map((e) => MLTransform.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final transforms = this.transforms;
    final nextToken = this.nextToken;
    return {
      'Transforms': transforms,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class GetMappingResponse {
  /// A list of mappings to the specified targets.
  final List<MappingEntry> mapping;

  GetMappingResponse({
    required this.mapping,
  });

  factory GetMappingResponse.fromJson(Map<String, dynamic> json) {
    return GetMappingResponse(
      mapping: (json['Mapping'] as List)
          .whereNotNull()
          .map((e) => MappingEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final mapping = this.mapping;
    return {
      'Mapping': mapping,
    };
  }
}

class GetPartitionIndexesResponse {
  /// A continuation token, present if the current list segment is not the last.
  final String? nextToken;

  /// A list of index descriptors.
  final List<PartitionIndexDescriptor>? partitionIndexDescriptorList;

  GetPartitionIndexesResponse({
    this.nextToken,
    this.partitionIndexDescriptorList,
  });

  factory GetPartitionIndexesResponse.fromJson(Map<String, dynamic> json) {
    return GetPartitionIndexesResponse(
      nextToken: json['NextToken'] as String?,
      partitionIndexDescriptorList:
          (json['PartitionIndexDescriptorList'] as List?)
              ?.whereNotNull()
              .map((e) =>
                  PartitionIndexDescriptor.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final partitionIndexDescriptorList = this.partitionIndexDescriptorList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (partitionIndexDescriptorList != null)
        'PartitionIndexDescriptorList': partitionIndexDescriptorList,
    };
  }
}

class GetPartitionResponse {
  /// The requested information, in the form of a <code>Partition</code> object.
  final Partition? partition;

  GetPartitionResponse({
    this.partition,
  });

  factory GetPartitionResponse.fromJson(Map<String, dynamic> json) {
    return GetPartitionResponse(
      partition: json['Partition'] != null
          ? Partition.fromJson(json['Partition'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final partition = this.partition;
    return {
      if (partition != null) 'Partition': partition,
    };
  }
}

class GetPartitionsResponse {
  /// A continuation token, if the returned list of partitions does not include
  /// the last one.
  final String? nextToken;

  /// A list of requested partitions.
  final List<Partition>? partitions;

  GetPartitionsResponse({
    this.nextToken,
    this.partitions,
  });

  factory GetPartitionsResponse.fromJson(Map<String, dynamic> json) {
    return GetPartitionsResponse(
      nextToken: json['NextToken'] as String?,
      partitions: (json['Partitions'] as List?)
          ?.whereNotNull()
          .map((e) => Partition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final partitions = this.partitions;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (partitions != null) 'Partitions': partitions,
    };
  }
}

class GetPlanResponse {
  /// A Python script to perform the mapping.
  final String? pythonScript;

  /// The Scala code to perform the mapping.
  final String? scalaCode;

  GetPlanResponse({
    this.pythonScript,
    this.scalaCode,
  });

  factory GetPlanResponse.fromJson(Map<String, dynamic> json) {
    return GetPlanResponse(
      pythonScript: json['PythonScript'] as String?,
      scalaCode: json['ScalaCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final pythonScript = this.pythonScript;
    final scalaCode = this.scalaCode;
    return {
      if (pythonScript != null) 'PythonScript': pythonScript,
      if (scalaCode != null) 'ScalaCode': scalaCode,
    };
  }
}

class GetRegistryResponse {
  /// The date and time the registry was created.
  final String? createdTime;

  /// A description of the registry.
  final String? description;

  /// The Amazon Resource Name (ARN) of the registry.
  final String? registryArn;

  /// The name of the registry.
  final String? registryName;

  /// The status of the registry.
  final RegistryStatus? status;

  /// The date and time the registry was updated.
  final String? updatedTime;

  GetRegistryResponse({
    this.createdTime,
    this.description,
    this.registryArn,
    this.registryName,
    this.status,
    this.updatedTime,
  });

  factory GetRegistryResponse.fromJson(Map<String, dynamic> json) {
    return GetRegistryResponse(
      createdTime: json['CreatedTime'] as String?,
      description: json['Description'] as String?,
      registryArn: json['RegistryArn'] as String?,
      registryName: json['RegistryName'] as String?,
      status: (json['Status'] as String?)?.toRegistryStatus(),
      updatedTime: json['UpdatedTime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTime = this.createdTime;
    final description = this.description;
    final registryArn = this.registryArn;
    final registryName = this.registryName;
    final status = this.status;
    final updatedTime = this.updatedTime;
    return {
      if (createdTime != null) 'CreatedTime': createdTime,
      if (description != null) 'Description': description,
      if (registryArn != null) 'RegistryArn': registryArn,
      if (registryName != null) 'RegistryName': registryName,
      if (status != null) 'Status': status.toValue(),
      if (updatedTime != null) 'UpdatedTime': updatedTime,
    };
  }
}

class GetResourcePoliciesResponse {
  /// A list of the individual resource policies and the account-level resource
  /// policy.
  final List<GluePolicy>? getResourcePoliciesResponseList;

  /// A continuation token, if the returned list does not contain the last
  /// resource policy available.
  final String? nextToken;

  GetResourcePoliciesResponse({
    this.getResourcePoliciesResponseList,
    this.nextToken,
  });

  factory GetResourcePoliciesResponse.fromJson(Map<String, dynamic> json) {
    return GetResourcePoliciesResponse(
      getResourcePoliciesResponseList:
          (json['GetResourcePoliciesResponseList'] as List?)
              ?.whereNotNull()
              .map((e) => GluePolicy.fromJson(e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final getResourcePoliciesResponseList =
        this.getResourcePoliciesResponseList;
    final nextToken = this.nextToken;
    return {
      if (getResourcePoliciesResponseList != null)
        'GetResourcePoliciesResponseList': getResourcePoliciesResponseList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class GetResourcePolicyResponse {
  /// The date and time at which the policy was created.
  final DateTime? createTime;

  /// Contains the hash value associated with this policy.
  final String? policyHash;

  /// Contains the requested policy document, in JSON format.
  final String? policyInJson;

  /// The date and time at which the policy was last updated.
  final DateTime? updateTime;

  GetResourcePolicyResponse({
    this.createTime,
    this.policyHash,
    this.policyInJson,
    this.updateTime,
  });

  factory GetResourcePolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetResourcePolicyResponse(
      createTime: timeStampFromJson(json['CreateTime']),
      policyHash: json['PolicyHash'] as String?,
      policyInJson: json['PolicyInJson'] as String?,
      updateTime: timeStampFromJson(json['UpdateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final policyHash = this.policyHash;
    final policyInJson = this.policyInJson;
    final updateTime = this.updateTime;
    return {
      if (createTime != null) 'CreateTime': unixTimestampToJson(createTime),
      if (policyHash != null) 'PolicyHash': policyHash,
      if (policyInJson != null) 'PolicyInJson': policyInJson,
      if (updateTime != null) 'UpdateTime': unixTimestampToJson(updateTime),
    };
  }
}

class GetSchemaByDefinitionResponse {
  /// The date and time the schema was created.
  final String? createdTime;

  /// The data format of the schema definition. Currently only <code>AVRO</code>
  /// and <code>JSON</code> are supported.
  final DataFormat? dataFormat;

  /// The Amazon Resource Name (ARN) of the schema.
  final String? schemaArn;

  /// The schema ID of the schema version.
  final String? schemaVersionId;

  /// The status of the schema version.
  final SchemaVersionStatus? status;

  GetSchemaByDefinitionResponse({
    this.createdTime,
    this.dataFormat,
    this.schemaArn,
    this.schemaVersionId,
    this.status,
  });

  factory GetSchemaByDefinitionResponse.fromJson(Map<String, dynamic> json) {
    return GetSchemaByDefinitionResponse(
      createdTime: json['CreatedTime'] as String?,
      dataFormat: (json['DataFormat'] as String?)?.toDataFormat(),
      schemaArn: json['SchemaArn'] as String?,
      schemaVersionId: json['SchemaVersionId'] as String?,
      status: (json['Status'] as String?)?.toSchemaVersionStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdTime = this.createdTime;
    final dataFormat = this.dataFormat;
    final schemaArn = this.schemaArn;
    final schemaVersionId = this.schemaVersionId;
    final status = this.status;
    return {
      if (createdTime != null) 'CreatedTime': createdTime,
      if (dataFormat != null) 'DataFormat': dataFormat.toValue(),
      if (schemaArn != null) 'SchemaArn': schemaArn,
      if (schemaVersionId != null) 'SchemaVersionId': schemaVersionId,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

class GetSchemaResponse {
  /// The compatibility mode of the schema.
  final Compatibility? compatibility;

  /// The date and time the schema was created.
  final String? createdTime;

  /// The data format of the schema definition. Currently <code>AVRO</code> and
  /// <code>JSON</code> are supported.
  final DataFormat? dataFormat;

  /// A description of schema if specified when created
  final String? description;

  /// The latest version of the schema associated with the returned schema
  /// definition.
  final int? latestSchemaVersion;

  /// The next version of the schema associated with the returned schema
  /// definition.
  final int? nextSchemaVersion;

  /// The Amazon Resource Name (ARN) of the registry.
  final String? registryArn;

  /// The name of the registry.
  final String? registryName;

  /// The Amazon Resource Name (ARN) of the schema.
  final String? schemaArn;

  /// The version number of the checkpoint (the last time the compatibility mode
  /// was changed).
  final int? schemaCheckpoint;

  /// The name of the schema.
  final String? schemaName;

  /// The status of the schema.
  final SchemaStatus? schemaStatus;

  /// The date and time the schema was updated.
  final String? updatedTime;

  GetSchemaResponse({
    this.compatibility,
    this.createdTime,
    this.dataFormat,
    this.description,
    this.latestSchemaVersion,
    this.nextSchemaVersion,
    this.registryArn,
    this.registryName,
    this.schemaArn,
    this.schemaCheckpoint,
    this.schemaName,
    this.schemaStatus,
    this.updatedTime,
  });

  factory GetSchemaResponse.fromJson(Map<String, dynamic> json) {
    return GetSchemaResponse(
      compatibility: (json['Compatibility'] as String?)?.toCompatibility(),
      createdTime: json['CreatedTime'] as String?,
      dataFormat: (json['DataFormat'] as String?)?.toDataFormat(),
      description: json['Description'] as String?,
      latestSchemaVersion: json['LatestSchemaVersion'] as int?,
      nextSchemaVersion: json['NextSchemaVersion'] as int?,
      registryArn: json['RegistryArn'] as String?,
      registryName: json['RegistryName'] as String?,
      schemaArn: json['SchemaArn'] as String?,
      schemaCheckpoint: json['SchemaCheckpoint'] as int?,
      schemaName: json['SchemaName'] as String?,
      schemaStatus: (json['SchemaStatus'] as String?)?.toSchemaStatus(),
      updatedTime: json['UpdatedTime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final compatibility = this.compatibility;
    final createdTime = this.createdTime;
    final dataFormat = this.dataFormat;
    final description = this.description;
    final latestSchemaVersion = this.latestSchemaVersion;
    final nextSchemaVersion = this.nextSchemaVersion;
    final registryArn = this.registryArn;
    final registryName = this.registryName;
    final schemaArn = this.schemaArn;
    final schemaCheckpoint = this.schemaCheckpoint;
    final schemaName = this.schemaName;
    final schemaStatus = this.schemaStatus;
    final updatedTime = this.updatedTime;
    return {
      if (compatibility != null) 'Compatibility': compatibility.toValue(),
      if (createdTime != null) 'CreatedTime': createdTime,
      if (dataFormat != null) 'DataFormat': dataFormat.toValue(),
      if (description != null) 'Description': description,
      if (latestSchemaVersion != null)
        'LatestSchemaVersion': latestSchemaVersion,
      if (nextSchemaVersion != null) 'NextSchemaVersion': nextSchemaVersion,
      if (registryArn != null) 'RegistryArn': registryArn,
      if (registryName != null) 'RegistryName': registryName,
      if (schemaArn != null) 'SchemaArn': schemaArn,
      if (schemaCheckpoint != null) 'SchemaCheckpoint': schemaCheckpoint,
      if (schemaName != null) 'SchemaName': schemaName,
      if (schemaStatus != null) 'SchemaStatus': schemaStatus.toValue(),
      if (updatedTime != null) 'UpdatedTime': updatedTime,
    };
  }
}

class GetSchemaVersionResponse {
  /// The date and time the schema version was created.
  final String? createdTime;

  /// The data format of the schema definition. Currently <code>AVRO</code> and
  /// <code>JSON</code> are supported.
  final DataFormat? dataFormat;

  /// The Amazon Resource Name (ARN) of the schema.
  final String? schemaArn;

  /// The schema definition for the schema ID.
  final String? schemaDefinition;

  /// The <code>SchemaVersionId</code> of the schema version.
  final String? schemaVersionId;

  /// The status of the schema version.
  final SchemaVersionStatus? status;

  /// The version number of the schema.
  final int? versionNumber;

  GetSchemaVersionResponse({
    this.createdTime,
    this.dataFormat,
    this.schemaArn,
    this.schemaDefinition,
    this.schemaVersionId,
    this.status,
    this.versionNumber,
  });

  factory GetSchemaVersionResponse.fromJson(Map<String, dynamic> json) {
    return GetSchemaVersionResponse(
      createdTime: json['CreatedTime'] as String?,
      dataFormat: (json['DataFormat'] as String?)?.toDataFormat(),
      schemaArn: json['SchemaArn'] as String?,
      schemaDefinition: json['SchemaDefinition'] as String?,
      schemaVersionId: json['SchemaVersionId'] as String?,
      status: (json['Status'] as String?)?.toSchemaVersionStatus(),
      versionNumber: json['VersionNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTime = this.createdTime;
    final dataFormat = this.dataFormat;
    final schemaArn = this.schemaArn;
    final schemaDefinition = this.schemaDefinition;
    final schemaVersionId = this.schemaVersionId;
    final status = this.status;
    final versionNumber = this.versionNumber;
    return {
      if (createdTime != null) 'CreatedTime': createdTime,
      if (dataFormat != null) 'DataFormat': dataFormat.toValue(),
      if (schemaArn != null) 'SchemaArn': schemaArn,
      if (schemaDefinition != null) 'SchemaDefinition': schemaDefinition,
      if (schemaVersionId != null) 'SchemaVersionId': schemaVersionId,
      if (status != null) 'Status': status.toValue(),
      if (versionNumber != null) 'VersionNumber': versionNumber,
    };
  }
}

class GetSchemaVersionsDiffResponse {
  /// The difference between schemas as a string in JsonPatch format.
  final String? diff;

  GetSchemaVersionsDiffResponse({
    this.diff,
  });

  factory GetSchemaVersionsDiffResponse.fromJson(Map<String, dynamic> json) {
    return GetSchemaVersionsDiffResponse(
      diff: json['Diff'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final diff = this.diff;
    return {
      if (diff != null) 'Diff': diff,
    };
  }
}

class GetSecurityConfigurationResponse {
  /// The requested security configuration.
  final SecurityConfiguration? securityConfiguration;

  GetSecurityConfigurationResponse({
    this.securityConfiguration,
  });

  factory GetSecurityConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return GetSecurityConfigurationResponse(
      securityConfiguration: json['SecurityConfiguration'] != null
          ? SecurityConfiguration.fromJson(
              json['SecurityConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final securityConfiguration = this.securityConfiguration;
    return {
      if (securityConfiguration != null)
        'SecurityConfiguration': securityConfiguration,
    };
  }
}

class GetSecurityConfigurationsResponse {
  /// A continuation token, if there are more security configurations to return.
  final String? nextToken;

  /// A list of security configurations.
  final List<SecurityConfiguration>? securityConfigurations;

  GetSecurityConfigurationsResponse({
    this.nextToken,
    this.securityConfigurations,
  });

  factory GetSecurityConfigurationsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetSecurityConfigurationsResponse(
      nextToken: json['NextToken'] as String?,
      securityConfigurations: (json['SecurityConfigurations'] as List?)
          ?.whereNotNull()
          .map((e) => SecurityConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final securityConfigurations = this.securityConfigurations;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (securityConfigurations != null)
        'SecurityConfigurations': securityConfigurations,
    };
  }
}

class GetTableResponse {
  /// The <code>Table</code> object that defines the specified table.
  final Table? table;

  GetTableResponse({
    this.table,
  });

  factory GetTableResponse.fromJson(Map<String, dynamic> json) {
    return GetTableResponse(
      table: json['Table'] != null
          ? Table.fromJson(json['Table'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final table = this.table;
    return {
      if (table != null) 'Table': table,
    };
  }
}

class GetTableVersionResponse {
  /// The requested table version.
  final TableVersion? tableVersion;

  GetTableVersionResponse({
    this.tableVersion,
  });

  factory GetTableVersionResponse.fromJson(Map<String, dynamic> json) {
    return GetTableVersionResponse(
      tableVersion: json['TableVersion'] != null
          ? TableVersion.fromJson(json['TableVersion'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final tableVersion = this.tableVersion;
    return {
      if (tableVersion != null) 'TableVersion': tableVersion,
    };
  }
}

class GetTableVersionsResponse {
  /// A continuation token, if the list of available versions does not include the
  /// last one.
  final String? nextToken;

  /// A list of strings identifying available versions of the specified table.
  final List<TableVersion>? tableVersions;

  GetTableVersionsResponse({
    this.nextToken,
    this.tableVersions,
  });

  factory GetTableVersionsResponse.fromJson(Map<String, dynamic> json) {
    return GetTableVersionsResponse(
      nextToken: json['NextToken'] as String?,
      tableVersions: (json['TableVersions'] as List?)
          ?.whereNotNull()
          .map((e) => TableVersion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final tableVersions = this.tableVersions;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (tableVersions != null) 'TableVersions': tableVersions,
    };
  }
}

class GetTablesResponse {
  /// A continuation token, present if the current list segment is not the last.
  final String? nextToken;

  /// A list of the requested <code>Table</code> objects.
  final List<Table>? tableList;

  GetTablesResponse({
    this.nextToken,
    this.tableList,
  });

  factory GetTablesResponse.fromJson(Map<String, dynamic> json) {
    return GetTablesResponse(
      nextToken: json['NextToken'] as String?,
      tableList: (json['TableList'] as List?)
          ?.whereNotNull()
          .map((e) => Table.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final tableList = this.tableList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (tableList != null) 'TableList': tableList,
    };
  }
}

class GetTagsResponse {
  /// The requested tags.
  final Map<String, String>? tags;

  GetTagsResponse({
    this.tags,
  });

  factory GetTagsResponse.fromJson(Map<String, dynamic> json) {
    return GetTagsResponse(
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

class GetTriggerResponse {
  /// The requested trigger definition.
  final Trigger? trigger;

  GetTriggerResponse({
    this.trigger,
  });

  factory GetTriggerResponse.fromJson(Map<String, dynamic> json) {
    return GetTriggerResponse(
      trigger: json['Trigger'] != null
          ? Trigger.fromJson(json['Trigger'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final trigger = this.trigger;
    return {
      if (trigger != null) 'Trigger': trigger,
    };
  }
}

class GetTriggersResponse {
  /// A continuation token, if not all the requested triggers have yet been
  /// returned.
  final String? nextToken;

  /// A list of triggers for the specified job.
  final List<Trigger>? triggers;

  GetTriggersResponse({
    this.nextToken,
    this.triggers,
  });

  factory GetTriggersResponse.fromJson(Map<String, dynamic> json) {
    return GetTriggersResponse(
      nextToken: json['NextToken'] as String?,
      triggers: (json['Triggers'] as List?)
          ?.whereNotNull()
          .map((e) => Trigger.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final triggers = this.triggers;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (triggers != null) 'Triggers': triggers,
    };
  }
}

class GetUserDefinedFunctionResponse {
  /// The requested function definition.
  final UserDefinedFunction? userDefinedFunction;

  GetUserDefinedFunctionResponse({
    this.userDefinedFunction,
  });

  factory GetUserDefinedFunctionResponse.fromJson(Map<String, dynamic> json) {
    return GetUserDefinedFunctionResponse(
      userDefinedFunction: json['UserDefinedFunction'] != null
          ? UserDefinedFunction.fromJson(
              json['UserDefinedFunction'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final userDefinedFunction = this.userDefinedFunction;
    return {
      if (userDefinedFunction != null)
        'UserDefinedFunction': userDefinedFunction,
    };
  }
}

class GetUserDefinedFunctionsResponse {
  /// A continuation token, if the list of functions returned does not include the
  /// last requested function.
  final String? nextToken;

  /// A list of requested function definitions.
  final List<UserDefinedFunction>? userDefinedFunctions;

  GetUserDefinedFunctionsResponse({
    this.nextToken,
    this.userDefinedFunctions,
  });

  factory GetUserDefinedFunctionsResponse.fromJson(Map<String, dynamic> json) {
    return GetUserDefinedFunctionsResponse(
      nextToken: json['NextToken'] as String?,
      userDefinedFunctions: (json['UserDefinedFunctions'] as List?)
          ?.whereNotNull()
          .map((e) => UserDefinedFunction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final userDefinedFunctions = this.userDefinedFunctions;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (userDefinedFunctions != null)
        'UserDefinedFunctions': userDefinedFunctions,
    };
  }
}

class GetWorkflowResponse {
  /// The resource metadata for the workflow.
  final Workflow? workflow;

  GetWorkflowResponse({
    this.workflow,
  });

  factory GetWorkflowResponse.fromJson(Map<String, dynamic> json) {
    return GetWorkflowResponse(
      workflow: json['Workflow'] != null
          ? Workflow.fromJson(json['Workflow'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final workflow = this.workflow;
    return {
      if (workflow != null) 'Workflow': workflow,
    };
  }
}

class GetWorkflowRunPropertiesResponse {
  /// The workflow run properties which were set during the specified run.
  final Map<String, String>? runProperties;

  GetWorkflowRunPropertiesResponse({
    this.runProperties,
  });

  factory GetWorkflowRunPropertiesResponse.fromJson(Map<String, dynamic> json) {
    return GetWorkflowRunPropertiesResponse(
      runProperties: (json['RunProperties'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final runProperties = this.runProperties;
    return {
      if (runProperties != null) 'RunProperties': runProperties,
    };
  }
}

class GetWorkflowRunResponse {
  /// The requested workflow run metadata.
  final WorkflowRun? run;

  GetWorkflowRunResponse({
    this.run,
  });

  factory GetWorkflowRunResponse.fromJson(Map<String, dynamic> json) {
    return GetWorkflowRunResponse(
      run: json['Run'] != null
          ? WorkflowRun.fromJson(json['Run'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final run = this.run;
    return {
      if (run != null) 'Run': run,
    };
  }
}

class GetWorkflowRunsResponse {
  /// A continuation token, if not all requested workflow runs have been returned.
  final String? nextToken;

  /// A list of workflow run metadata objects.
  final List<WorkflowRun>? runs;

  GetWorkflowRunsResponse({
    this.nextToken,
    this.runs,
  });

  factory GetWorkflowRunsResponse.fromJson(Map<String, dynamic> json) {
    return GetWorkflowRunsResponse(
      nextToken: json['NextToken'] as String?,
      runs: (json['Runs'] as List?)
          ?.whereNotNull()
          .map((e) => WorkflowRun.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final runs = this.runs;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (runs != null) 'Runs': runs,
    };
  }
}

/// A structure for returning a resource policy.
class GluePolicy {
  /// The date and time at which the policy was created.
  final DateTime? createTime;

  /// Contains the hash value associated with this policy.
  final String? policyHash;

  /// Contains the requested policy document, in JSON format.
  final String? policyInJson;

  /// The date and time at which the policy was last updated.
  final DateTime? updateTime;

  GluePolicy({
    this.createTime,
    this.policyHash,
    this.policyInJson,
    this.updateTime,
  });

  factory GluePolicy.fromJson(Map<String, dynamic> json) {
    return GluePolicy(
      createTime: timeStampFromJson(json['CreateTime']),
      policyHash: json['PolicyHash'] as String?,
      policyInJson: json['PolicyInJson'] as String?,
      updateTime: timeStampFromJson(json['UpdateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final policyHash = this.policyHash;
    final policyInJson = this.policyInJson;
    final updateTime = this.updateTime;
    return {
      if (createTime != null) 'CreateTime': unixTimestampToJson(createTime),
      if (policyHash != null) 'PolicyHash': policyHash,
      if (policyInJson != null) 'PolicyInJson': policyInJson,
      if (updateTime != null) 'UpdateTime': unixTimestampToJson(updateTime),
    };
  }
}

/// The database and table in the Glue Data Catalog that is used for input or
/// output data.
class GlueTable {
  /// A database name in the Glue Data Catalog.
  final String databaseName;

  /// A table name in the Glue Data Catalog.
  final String tableName;

  /// A unique identifier for the Glue Data Catalog.
  final String? catalogId;

  /// The name of the connection to the Glue Data Catalog.
  final String? connectionName;

  GlueTable({
    required this.databaseName,
    required this.tableName,
    this.catalogId,
    this.connectionName,
  });

  factory GlueTable.fromJson(Map<String, dynamic> json) {
    return GlueTable(
      databaseName: json['DatabaseName'] as String,
      tableName: json['TableName'] as String,
      catalogId: json['CatalogId'] as String?,
      connectionName: json['ConnectionName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final databaseName = this.databaseName;
    final tableName = this.tableName;
    final catalogId = this.catalogId;
    final connectionName = this.connectionName;
    return {
      'DatabaseName': databaseName,
      'TableName': tableName,
      if (catalogId != null) 'CatalogId': catalogId,
      if (connectionName != null) 'ConnectionName': connectionName,
    };
  }
}

/// A classifier that uses <code>grok</code> patterns.
class GrokClassifier {
  /// An identifier of the data format that the classifier matches, such as
  /// Twitter, JSON, Omniture logs, and so on.
  final String classification;

  /// The grok pattern applied to a data store by this classifier. For more
  /// information, see built-in patterns in <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/custom-classifier.html">Writing
  /// Custom Classifiers</a>.
  final String grokPattern;

  /// The name of the classifier.
  final String name;

  /// The time that this classifier was registered.
  final DateTime? creationTime;

  /// Optional custom grok patterns defined by this classifier. For more
  /// information, see custom patterns in <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/custom-classifier.html">Writing
  /// Custom Classifiers</a>.
  final String? customPatterns;

  /// The time that this classifier was last updated.
  final DateTime? lastUpdated;

  /// The version of this classifier.
  final int? version;

  GrokClassifier({
    required this.classification,
    required this.grokPattern,
    required this.name,
    this.creationTime,
    this.customPatterns,
    this.lastUpdated,
    this.version,
  });

  factory GrokClassifier.fromJson(Map<String, dynamic> json) {
    return GrokClassifier(
      classification: json['Classification'] as String,
      grokPattern: json['GrokPattern'] as String,
      name: json['Name'] as String,
      creationTime: timeStampFromJson(json['CreationTime']),
      customPatterns: json['CustomPatterns'] as String?,
      lastUpdated: timeStampFromJson(json['LastUpdated']),
      version: json['Version'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final classification = this.classification;
    final grokPattern = this.grokPattern;
    final name = this.name;
    final creationTime = this.creationTime;
    final customPatterns = this.customPatterns;
    final lastUpdated = this.lastUpdated;
    final version = this.version;
    return {
      'Classification': classification,
      'GrokPattern': grokPattern,
      'Name': name,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (customPatterns != null) 'CustomPatterns': customPatterns,
      if (lastUpdated != null) 'LastUpdated': unixTimestampToJson(lastUpdated),
      if (version != null) 'Version': version,
    };
  }
}

class ImportCatalogToGlueResponse {
  ImportCatalogToGlueResponse();

  factory ImportCatalogToGlueResponse.fromJson(Map<String, dynamic> _) {
    return ImportCatalogToGlueResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Specifies configuration properties for an importing labels task run.
class ImportLabelsTaskRunProperties {
  /// The Amazon Simple Storage Service (Amazon S3) path from where you will
  /// import the labels.
  final String? inputS3Path;

  /// Indicates whether to overwrite your existing labels.
  final bool? replace;

  ImportLabelsTaskRunProperties({
    this.inputS3Path,
    this.replace,
  });

  factory ImportLabelsTaskRunProperties.fromJson(Map<String, dynamic> json) {
    return ImportLabelsTaskRunProperties(
      inputS3Path: json['InputS3Path'] as String?,
      replace: json['Replace'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final inputS3Path = this.inputS3Path;
    final replace = this.replace;
    return {
      if (inputS3Path != null) 'InputS3Path': inputS3Path,
      if (replace != null) 'Replace': replace,
    };
  }
}

/// Specifies a JDBC data store to crawl.
class JdbcTarget {
  /// The name of the connection to use to connect to the JDBC target.
  final String? connectionName;

  /// A list of glob patterns used to exclude from the crawl. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/add-crawler.html">Catalog
  /// Tables with a Crawler</a>.
  final List<String>? exclusions;

  /// The path of the JDBC target.
  final String? path;

  JdbcTarget({
    this.connectionName,
    this.exclusions,
    this.path,
  });

  factory JdbcTarget.fromJson(Map<String, dynamic> json) {
    return JdbcTarget(
      connectionName: json['ConnectionName'] as String?,
      exclusions: (json['Exclusions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      path: json['Path'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectionName = this.connectionName;
    final exclusions = this.exclusions;
    final path = this.path;
    return {
      if (connectionName != null) 'ConnectionName': connectionName,
      if (exclusions != null) 'Exclusions': exclusions,
      if (path != null) 'Path': path,
    };
  }
}

/// Specifies a job definition.
class Job {
  /// This field is deprecated. Use <code>MaxCapacity</code> instead.
  ///
  /// The number of Glue data processing units (DPUs) allocated to runs of this
  /// job. You can allocate from 2 to 100 DPUs; the default is 10. A DPU is a
  /// relative measure of processing power that consists of 4 vCPUs of compute
  /// capacity and 16 GB of memory. For more information, see the <a
  /// href="https://aws.amazon.com/glue/pricing/">Glue pricing page</a>.
  /// <p/>
  final int? allocatedCapacity;

  /// The <code>JobCommand</code> that runs this job.
  final JobCommand? command;

  /// The connections used for this job.
  final ConnectionsList? connections;

  /// The time and date that this job definition was created.
  final DateTime? createdOn;

  /// The default arguments for this job, specified as name-value pairs.
  ///
  /// You can specify arguments here that your own job-execution script consumes,
  /// as well as arguments that Glue itself consumes.
  ///
  /// For information about how to specify and consume your own Job arguments, see
  /// the <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-python-calling.html">Calling
  /// Glue APIs in Python</a> topic in the developer guide.
  ///
  /// For information about the key-value pairs that Glue consumes to set up your
  /// job, see the <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-etl-glue-arguments.html">Special
  /// Parameters Used by Glue</a> topic in the developer guide.
  final Map<String, String>? defaultArguments;

  /// A description of the job.
  final String? description;

  /// An <code>ExecutionProperty</code> specifying the maximum number of
  /// concurrent runs allowed for this job.
  final ExecutionProperty? executionProperty;

  /// Glue version determines the versions of Apache Spark and Python that Glue
  /// supports. The Python version indicates the version supported for jobs of
  /// type Spark.
  ///
  /// For more information about the available Glue versions and corresponding
  /// Spark and Python versions, see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/add-job.html">Glue
  /// version</a> in the developer guide.
  ///
  /// Jobs that are created without specifying a Glue version default to Glue 0.9.
  final String? glueVersion;

  /// The last point in time when this job definition was modified.
  final DateTime? lastModifiedOn;

  /// This field is reserved for future use.
  final String? logUri;

  /// For Glue version 1.0 or earlier jobs, using the standard worker type, the
  /// number of Glue data processing units (DPUs) that can be allocated when this
  /// job runs. A DPU is a relative measure of processing power that consists of 4
  /// vCPUs of compute capacity and 16 GB of memory. For more information, see the
  /// <a href="https://aws.amazon.com/glue/pricing/">Glue pricing page</a>.
  ///
  /// Do not set <code>Max Capacity</code> if using <code>WorkerType</code> and
  /// <code>NumberOfWorkers</code>.
  ///
  /// The value that can be allocated for <code>MaxCapacity</code> depends on
  /// whether you are running a Python shell job, an Apache Spark ETL job, or an
  /// Apache Spark streaming ETL job:
  ///
  /// <ul>
  /// <li>
  /// When you specify a Python shell job
  /// (<code>JobCommand.Name</code>="pythonshell"), you can allocate either 0.0625
  /// or 1 DPU. The default is 0.0625 DPU.
  /// </li>
  /// <li>
  /// When you specify an Apache Spark ETL job
  /// (<code>JobCommand.Name</code>="glueetl") or Apache Spark streaming ETL job
  /// (<code>JobCommand.Name</code>="gluestreaming"), you can allocate from 2 to
  /// 100 DPUs. The default is 10 DPUs. This job type cannot have a fractional DPU
  /// allocation.
  /// </li>
  /// </ul>
  /// For Glue version 2.0 jobs, you cannot instead specify a <code>Maximum
  /// capacity</code>. Instead, you should specify a <code>Worker type</code> and
  /// the <code>Number of workers</code>.
  final double? maxCapacity;

  /// The maximum number of times to retry this job after a JobRun fails.
  final int? maxRetries;

  /// The name you assign to this job definition.
  final String? name;

  /// Non-overridable arguments for this job, specified as name-value pairs.
  final Map<String, String>? nonOverridableArguments;

  /// Specifies configuration properties of a job notification.
  final NotificationProperty? notificationProperty;

  /// The number of workers of a defined <code>workerType</code> that are
  /// allocated when a job runs.
  ///
  /// The maximum number of workers you can define are 299 for <code>G.1X</code>,
  /// and 149 for <code>G.2X</code>.
  final int? numberOfWorkers;

  /// The name or Amazon Resource Name (ARN) of the IAM role associated with this
  /// job.
  final String? role;

  /// The name of the <code>SecurityConfiguration</code> structure to be used with
  /// this job.
  final String? securityConfiguration;

  /// The job timeout in minutes. This is the maximum time that a job run can
  /// consume resources before it is terminated and enters <code>TIMEOUT</code>
  /// status. The default is 2,880 minutes (48 hours).
  final int? timeout;

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
  final WorkerType? workerType;

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

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      allocatedCapacity: json['AllocatedCapacity'] as int?,
      command: json['Command'] != null
          ? JobCommand.fromJson(json['Command'] as Map<String, dynamic>)
          : null,
      connections: json['Connections'] != null
          ? ConnectionsList.fromJson(
              json['Connections'] as Map<String, dynamic>)
          : null,
      createdOn: timeStampFromJson(json['CreatedOn']),
      defaultArguments: (json['DefaultArguments'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      description: json['Description'] as String?,
      executionProperty: json['ExecutionProperty'] != null
          ? ExecutionProperty.fromJson(
              json['ExecutionProperty'] as Map<String, dynamic>)
          : null,
      glueVersion: json['GlueVersion'] as String?,
      lastModifiedOn: timeStampFromJson(json['LastModifiedOn']),
      logUri: json['LogUri'] as String?,
      maxCapacity: json['MaxCapacity'] as double?,
      maxRetries: json['MaxRetries'] as int?,
      name: json['Name'] as String?,
      nonOverridableArguments:
          (json['NonOverridableArguments'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      notificationProperty: json['NotificationProperty'] != null
          ? NotificationProperty.fromJson(
              json['NotificationProperty'] as Map<String, dynamic>)
          : null,
      numberOfWorkers: json['NumberOfWorkers'] as int?,
      role: json['Role'] as String?,
      securityConfiguration: json['SecurityConfiguration'] as String?,
      timeout: json['Timeout'] as int?,
      workerType: (json['WorkerType'] as String?)?.toWorkerType(),
    );
  }

  Map<String, dynamic> toJson() {
    final allocatedCapacity = this.allocatedCapacity;
    final command = this.command;
    final connections = this.connections;
    final createdOn = this.createdOn;
    final defaultArguments = this.defaultArguments;
    final description = this.description;
    final executionProperty = this.executionProperty;
    final glueVersion = this.glueVersion;
    final lastModifiedOn = this.lastModifiedOn;
    final logUri = this.logUri;
    final maxCapacity = this.maxCapacity;
    final maxRetries = this.maxRetries;
    final name = this.name;
    final nonOverridableArguments = this.nonOverridableArguments;
    final notificationProperty = this.notificationProperty;
    final numberOfWorkers = this.numberOfWorkers;
    final role = this.role;
    final securityConfiguration = this.securityConfiguration;
    final timeout = this.timeout;
    final workerType = this.workerType;
    return {
      if (allocatedCapacity != null) 'AllocatedCapacity': allocatedCapacity,
      if (command != null) 'Command': command,
      if (connections != null) 'Connections': connections,
      if (createdOn != null) 'CreatedOn': unixTimestampToJson(createdOn),
      if (defaultArguments != null) 'DefaultArguments': defaultArguments,
      if (description != null) 'Description': description,
      if (executionProperty != null) 'ExecutionProperty': executionProperty,
      if (glueVersion != null) 'GlueVersion': glueVersion,
      if (lastModifiedOn != null)
        'LastModifiedOn': unixTimestampToJson(lastModifiedOn),
      if (logUri != null) 'LogUri': logUri,
      if (maxCapacity != null) 'MaxCapacity': maxCapacity,
      if (maxRetries != null) 'MaxRetries': maxRetries,
      if (name != null) 'Name': name,
      if (nonOverridableArguments != null)
        'NonOverridableArguments': nonOverridableArguments,
      if (notificationProperty != null)
        'NotificationProperty': notificationProperty,
      if (numberOfWorkers != null) 'NumberOfWorkers': numberOfWorkers,
      if (role != null) 'Role': role,
      if (securityConfiguration != null)
        'SecurityConfiguration': securityConfiguration,
      if (timeout != null) 'Timeout': timeout,
      if (workerType != null) 'WorkerType': workerType.toValue(),
    };
  }
}

/// Defines a point that a job can resume processing.
class JobBookmarkEntry {
  /// The attempt ID number.
  final int? attempt;

  /// The bookmark itself.
  final String? jobBookmark;

  /// The name of the job in question.
  final String? jobName;

  /// The unique run identifier associated with the previous job run.
  final String? previousRunId;

  /// The run ID number.
  final int? run;

  /// The run ID number.
  final String? runId;

  /// The version of the job.
  final int? version;

  JobBookmarkEntry({
    this.attempt,
    this.jobBookmark,
    this.jobName,
    this.previousRunId,
    this.run,
    this.runId,
    this.version,
  });

  factory JobBookmarkEntry.fromJson(Map<String, dynamic> json) {
    return JobBookmarkEntry(
      attempt: json['Attempt'] as int?,
      jobBookmark: json['JobBookmark'] as String?,
      jobName: json['JobName'] as String?,
      previousRunId: json['PreviousRunId'] as String?,
      run: json['Run'] as int?,
      runId: json['RunId'] as String?,
      version: json['Version'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final attempt = this.attempt;
    final jobBookmark = this.jobBookmark;
    final jobName = this.jobName;
    final previousRunId = this.previousRunId;
    final run = this.run;
    final runId = this.runId;
    final version = this.version;
    return {
      if (attempt != null) 'Attempt': attempt,
      if (jobBookmark != null) 'JobBookmark': jobBookmark,
      if (jobName != null) 'JobName': jobName,
      if (previousRunId != null) 'PreviousRunId': previousRunId,
      if (run != null) 'Run': run,
      if (runId != null) 'RunId': runId,
      if (version != null) 'Version': version,
    };
  }
}

/// Specifies how job bookmark data should be encrypted.
class JobBookmarksEncryption {
  /// The encryption mode to use for job bookmarks data.
  final JobBookmarksEncryptionMode? jobBookmarksEncryptionMode;

  /// The Amazon Resource Name (ARN) of the KMS key to be used to encrypt the
  /// data.
  final String? kmsKeyArn;

  JobBookmarksEncryption({
    this.jobBookmarksEncryptionMode,
    this.kmsKeyArn,
  });

  factory JobBookmarksEncryption.fromJson(Map<String, dynamic> json) {
    return JobBookmarksEncryption(
      jobBookmarksEncryptionMode:
          (json['JobBookmarksEncryptionMode'] as String?)
              ?.toJobBookmarksEncryptionMode(),
      kmsKeyArn: json['KmsKeyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobBookmarksEncryptionMode = this.jobBookmarksEncryptionMode;
    final kmsKeyArn = this.kmsKeyArn;
    return {
      if (jobBookmarksEncryptionMode != null)
        'JobBookmarksEncryptionMode': jobBookmarksEncryptionMode.toValue(),
      if (kmsKeyArn != null) 'KmsKeyArn': kmsKeyArn,
    };
  }
}

enum JobBookmarksEncryptionMode {
  disabled,
  cseKms,
}

extension on JobBookmarksEncryptionMode {
  String toValue() {
    switch (this) {
      case JobBookmarksEncryptionMode.disabled:
        return 'DISABLED';
      case JobBookmarksEncryptionMode.cseKms:
        return 'CSE-KMS';
    }
  }
}

extension on String {
  JobBookmarksEncryptionMode toJobBookmarksEncryptionMode() {
    switch (this) {
      case 'DISABLED':
        return JobBookmarksEncryptionMode.disabled;
      case 'CSE-KMS':
        return JobBookmarksEncryptionMode.cseKms;
    }
    throw Exception('$this is not known in enum JobBookmarksEncryptionMode');
  }
}

/// Specifies code that runs when a job is run.
class JobCommand {
  /// The name of the job command. For an Apache Spark ETL job, this must be
  /// <code>glueetl</code>. For a Python shell job, it must be
  /// <code>pythonshell</code>. For an Apache Spark streaming ETL job, this must
  /// be <code>gluestreaming</code>.
  final String? name;

  /// The Python version being used to run a Python shell job. Allowed values are
  /// 2 or 3.
  final String? pythonVersion;

  /// Specifies the Amazon Simple Storage Service (Amazon S3) path to a script
  /// that runs a job.
  final String? scriptLocation;

  JobCommand({
    this.name,
    this.pythonVersion,
    this.scriptLocation,
  });

  factory JobCommand.fromJson(Map<String, dynamic> json) {
    return JobCommand(
      name: json['Name'] as String?,
      pythonVersion: json['PythonVersion'] as String?,
      scriptLocation: json['ScriptLocation'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final pythonVersion = this.pythonVersion;
    final scriptLocation = this.scriptLocation;
    return {
      if (name != null) 'Name': name,
      if (pythonVersion != null) 'PythonVersion': pythonVersion,
      if (scriptLocation != null) 'ScriptLocation': scriptLocation,
    };
  }
}

/// The details of a Job node present in the workflow.
class JobNodeDetails {
  /// The information for the job runs represented by the job node.
  final List<JobRun>? jobRuns;

  JobNodeDetails({
    this.jobRuns,
  });

  factory JobNodeDetails.fromJson(Map<String, dynamic> json) {
    return JobNodeDetails(
      jobRuns: (json['JobRuns'] as List?)
          ?.whereNotNull()
          .map((e) => JobRun.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final jobRuns = this.jobRuns;
    return {
      if (jobRuns != null) 'JobRuns': jobRuns,
    };
  }
}

/// Contains information about a job run.
class JobRun {
  /// This field is deprecated. Use <code>MaxCapacity</code> instead.
  ///
  /// The number of Glue data processing units (DPUs) allocated to this JobRun.
  /// From 2 to 100 DPUs can be allocated; the default is 10. A DPU is a relative
  /// measure of processing power that consists of 4 vCPUs of compute capacity and
  /// 16 GB of memory. For more information, see the <a
  /// href="https://aws.amazon.com/glue/pricing/">Glue pricing page</a>.
  final int? allocatedCapacity;

  /// The job arguments associated with this run. For this job run, they replace
  /// the default arguments set in the job definition itself.
  ///
  /// You can specify arguments here that your own job-execution script consumes,
  /// as well as arguments that Glue itself consumes.
  ///
  /// For information about how to specify and consume your own job arguments, see
  /// the <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-python-calling.html">Calling
  /// Glue APIs in Python</a> topic in the developer guide.
  ///
  /// For information about the key-value pairs that Glue consumes to set up your
  /// job, see the <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-etl-glue-arguments.html">Special
  /// Parameters Used by Glue</a> topic in the developer guide.
  final Map<String, String>? arguments;

  /// The number of the attempt to run this job.
  final int? attempt;

  /// The date and time that this job run completed.
  final DateTime? completedOn;

  /// An error message associated with this job run.
  final String? errorMessage;

  /// The amount of time (in seconds) that the job run consumed resources.
  final int? executionTime;

  /// Glue version determines the versions of Apache Spark and Python that Glue
  /// supports. The Python version indicates the version supported for jobs of
  /// type Spark.
  ///
  /// For more information about the available Glue versions and corresponding
  /// Spark and Python versions, see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/add-job.html">Glue
  /// version</a> in the developer guide.
  ///
  /// Jobs that are created without specifying a Glue version default to Glue 0.9.
  final String? glueVersion;

  /// The ID of this job run.
  final String? id;

  /// The name of the job definition being used in this run.
  final String? jobName;

  /// The current state of the job run. For more information about the statuses of
  /// jobs that have terminated abnormally, see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/job-run-statuses.html">Glue
  /// Job Run Statuses</a>.
  final JobRunState? jobRunState;

  /// The last time that this job run was modified.
  final DateTime? lastModifiedOn;

  /// The name of the log group for secure logging that can be server-side
  /// encrypted in Amazon CloudWatch using KMS. This name can be
  /// <code>/aws-glue/jobs/</code>, in which case the default encryption is
  /// <code>NONE</code>. If you add a role name and
  /// <code>SecurityConfiguration</code> name (in other words,
  /// <code>/aws-glue/jobs-yourRoleName-yourSecurityConfigurationName/</code>),
  /// then that security configuration is used to encrypt the log group.
  final String? logGroupName;

  /// The number of Glue data processing units (DPUs) that can be allocated when
  /// this job runs. A DPU is a relative measure of processing power that consists
  /// of 4 vCPUs of compute capacity and 16 GB of memory. For more information,
  /// see the <a href="https://aws.amazon.com/glue/pricing/">Glue pricing
  /// page</a>.
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
  final double? maxCapacity;

  /// Specifies configuration properties of a job run notification.
  final NotificationProperty? notificationProperty;

  /// The number of workers of a defined <code>workerType</code> that are
  /// allocated when a job runs.
  ///
  /// The maximum number of workers you can define are 299 for <code>G.1X</code>,
  /// and 149 for <code>G.2X</code>.
  final int? numberOfWorkers;

  /// A list of predecessors to this job run.
  final List<Predecessor>? predecessorRuns;

  /// The ID of the previous run of this job. For example, the
  /// <code>JobRunId</code> specified in the <code>StartJobRun</code> action.
  final String? previousRunId;

  /// The name of the <code>SecurityConfiguration</code> structure to be used with
  /// this job run.
  final String? securityConfiguration;

  /// The date and time at which this job run was started.
  final DateTime? startedOn;

  /// The <code>JobRun</code> timeout in minutes. This is the maximum time that a
  /// job run can consume resources before it is terminated and enters
  /// <code>TIMEOUT</code> status. The default is 2,880 minutes (48 hours). This
  /// overrides the timeout value set in the parent job.
  final int? timeout;

  /// The name of the trigger that started this job run.
  final String? triggerName;

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
  final WorkerType? workerType;

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

  factory JobRun.fromJson(Map<String, dynamic> json) {
    return JobRun(
      allocatedCapacity: json['AllocatedCapacity'] as int?,
      arguments: (json['Arguments'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      attempt: json['Attempt'] as int?,
      completedOn: timeStampFromJson(json['CompletedOn']),
      errorMessage: json['ErrorMessage'] as String?,
      executionTime: json['ExecutionTime'] as int?,
      glueVersion: json['GlueVersion'] as String?,
      id: json['Id'] as String?,
      jobName: json['JobName'] as String?,
      jobRunState: (json['JobRunState'] as String?)?.toJobRunState(),
      lastModifiedOn: timeStampFromJson(json['LastModifiedOn']),
      logGroupName: json['LogGroupName'] as String?,
      maxCapacity: json['MaxCapacity'] as double?,
      notificationProperty: json['NotificationProperty'] != null
          ? NotificationProperty.fromJson(
              json['NotificationProperty'] as Map<String, dynamic>)
          : null,
      numberOfWorkers: json['NumberOfWorkers'] as int?,
      predecessorRuns: (json['PredecessorRuns'] as List?)
          ?.whereNotNull()
          .map((e) => Predecessor.fromJson(e as Map<String, dynamic>))
          .toList(),
      previousRunId: json['PreviousRunId'] as String?,
      securityConfiguration: json['SecurityConfiguration'] as String?,
      startedOn: timeStampFromJson(json['StartedOn']),
      timeout: json['Timeout'] as int?,
      triggerName: json['TriggerName'] as String?,
      workerType: (json['WorkerType'] as String?)?.toWorkerType(),
    );
  }

  Map<String, dynamic> toJson() {
    final allocatedCapacity = this.allocatedCapacity;
    final arguments = this.arguments;
    final attempt = this.attempt;
    final completedOn = this.completedOn;
    final errorMessage = this.errorMessage;
    final executionTime = this.executionTime;
    final glueVersion = this.glueVersion;
    final id = this.id;
    final jobName = this.jobName;
    final jobRunState = this.jobRunState;
    final lastModifiedOn = this.lastModifiedOn;
    final logGroupName = this.logGroupName;
    final maxCapacity = this.maxCapacity;
    final notificationProperty = this.notificationProperty;
    final numberOfWorkers = this.numberOfWorkers;
    final predecessorRuns = this.predecessorRuns;
    final previousRunId = this.previousRunId;
    final securityConfiguration = this.securityConfiguration;
    final startedOn = this.startedOn;
    final timeout = this.timeout;
    final triggerName = this.triggerName;
    final workerType = this.workerType;
    return {
      if (allocatedCapacity != null) 'AllocatedCapacity': allocatedCapacity,
      if (arguments != null) 'Arguments': arguments,
      if (attempt != null) 'Attempt': attempt,
      if (completedOn != null) 'CompletedOn': unixTimestampToJson(completedOn),
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (executionTime != null) 'ExecutionTime': executionTime,
      if (glueVersion != null) 'GlueVersion': glueVersion,
      if (id != null) 'Id': id,
      if (jobName != null) 'JobName': jobName,
      if (jobRunState != null) 'JobRunState': jobRunState.toValue(),
      if (lastModifiedOn != null)
        'LastModifiedOn': unixTimestampToJson(lastModifiedOn),
      if (logGroupName != null) 'LogGroupName': logGroupName,
      if (maxCapacity != null) 'MaxCapacity': maxCapacity,
      if (notificationProperty != null)
        'NotificationProperty': notificationProperty,
      if (numberOfWorkers != null) 'NumberOfWorkers': numberOfWorkers,
      if (predecessorRuns != null) 'PredecessorRuns': predecessorRuns,
      if (previousRunId != null) 'PreviousRunId': previousRunId,
      if (securityConfiguration != null)
        'SecurityConfiguration': securityConfiguration,
      if (startedOn != null) 'StartedOn': unixTimestampToJson(startedOn),
      if (timeout != null) 'Timeout': timeout,
      if (triggerName != null) 'TriggerName': triggerName,
      if (workerType != null) 'WorkerType': workerType.toValue(),
    };
  }
}

enum JobRunState {
  starting,
  running,
  stopping,
  stopped,
  succeeded,
  failed,
  timeout,
}

extension on JobRunState {
  String toValue() {
    switch (this) {
      case JobRunState.starting:
        return 'STARTING';
      case JobRunState.running:
        return 'RUNNING';
      case JobRunState.stopping:
        return 'STOPPING';
      case JobRunState.stopped:
        return 'STOPPED';
      case JobRunState.succeeded:
        return 'SUCCEEDED';
      case JobRunState.failed:
        return 'FAILED';
      case JobRunState.timeout:
        return 'TIMEOUT';
    }
  }
}

extension on String {
  JobRunState toJobRunState() {
    switch (this) {
      case 'STARTING':
        return JobRunState.starting;
      case 'RUNNING':
        return JobRunState.running;
      case 'STOPPING':
        return JobRunState.stopping;
      case 'STOPPED':
        return JobRunState.stopped;
      case 'SUCCEEDED':
        return JobRunState.succeeded;
      case 'FAILED':
        return JobRunState.failed;
      case 'TIMEOUT':
        return JobRunState.timeout;
    }
    throw Exception('$this is not known in enum JobRunState');
  }
}

/// Specifies information used to update an existing job definition. The
/// previous job definition is completely overwritten by this information.
class JobUpdate {
  /// This field is deprecated. Use <code>MaxCapacity</code> instead.
  ///
  /// The number of Glue data processing units (DPUs) to allocate to this job. You
  /// can allocate from 2 to 100 DPUs; the default is 10. A DPU is a relative
  /// measure of processing power that consists of 4 vCPUs of compute capacity and
  /// 16 GB of memory. For more information, see the <a
  /// href="https://aws.amazon.com/glue/pricing/">Glue pricing page</a>.
  final int? allocatedCapacity;

  /// The <code>JobCommand</code> that runs this job (required).
  final JobCommand? command;

  /// The connections used for this job.
  final ConnectionsList? connections;

  /// The default arguments for this job.
  ///
  /// You can specify arguments here that your own job-execution script consumes,
  /// as well as arguments that Glue itself consumes.
  ///
  /// For information about how to specify and consume your own Job arguments, see
  /// the <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-python-calling.html">Calling
  /// Glue APIs in Python</a> topic in the developer guide.
  ///
  /// For information about the key-value pairs that Glue consumes to set up your
  /// job, see the <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-etl-glue-arguments.html">Special
  /// Parameters Used by Glue</a> topic in the developer guide.
  final Map<String, String>? defaultArguments;

  /// Description of the job being defined.
  final String? description;

  /// An <code>ExecutionProperty</code> specifying the maximum number of
  /// concurrent runs allowed for this job.
  final ExecutionProperty? executionProperty;

  /// Glue version determines the versions of Apache Spark and Python that Glue
  /// supports. The Python version indicates the version supported for jobs of
  /// type Spark.
  ///
  /// For more information about the available Glue versions and corresponding
  /// Spark and Python versions, see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/add-job.html">Glue
  /// version</a> in the developer guide.
  final String? glueVersion;

  /// This field is reserved for future use.
  final String? logUri;

  /// For Glue version 1.0 or earlier jobs, using the standard worker type, the
  /// number of Glue data processing units (DPUs) that can be allocated when this
  /// job runs. A DPU is a relative measure of processing power that consists of 4
  /// vCPUs of compute capacity and 16 GB of memory. For more information, see the
  /// <a href="https://aws.amazon.com/glue/pricing/">Glue pricing page</a>.
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
  /// (<code>JobCommand.Name</code>="glueetl") or Apache Spark streaming ETL job
  /// (<code>JobCommand.Name</code>="gluestreaming"), you can allocate from 2 to
  /// 100 DPUs. The default is 10 DPUs. This job type cannot have a fractional DPU
  /// allocation.
  /// </li>
  /// </ul>
  /// For Glue version 2.0 jobs, you cannot instead specify a <code>Maximum
  /// capacity</code>. Instead, you should specify a <code>Worker type</code> and
  /// the <code>Number of workers</code>.
  final double? maxCapacity;

  /// The maximum number of times to retry this job if it fails.
  final int? maxRetries;

  /// Non-overridable arguments for this job, specified as name-value pairs.
  final Map<String, String>? nonOverridableArguments;

  /// Specifies the configuration properties of a job notification.
  final NotificationProperty? notificationProperty;

  /// The number of workers of a defined <code>workerType</code> that are
  /// allocated when a job runs.
  ///
  /// The maximum number of workers you can define are 299 for <code>G.1X</code>,
  /// and 149 for <code>G.2X</code>.
  final int? numberOfWorkers;

  /// The name or Amazon Resource Name (ARN) of the IAM role associated with this
  /// job (required).
  final String? role;

  /// The name of the <code>SecurityConfiguration</code> structure to be used with
  /// this job.
  final String? securityConfiguration;

  /// The job timeout in minutes. This is the maximum time that a job run can
  /// consume resources before it is terminated and enters <code>TIMEOUT</code>
  /// status. The default is 2,880 minutes (48 hours).
  final int? timeout;

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
  final WorkerType? workerType;

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

  factory JobUpdate.fromJson(Map<String, dynamic> json) {
    return JobUpdate(
      allocatedCapacity: json['AllocatedCapacity'] as int?,
      command: json['Command'] != null
          ? JobCommand.fromJson(json['Command'] as Map<String, dynamic>)
          : null,
      connections: json['Connections'] != null
          ? ConnectionsList.fromJson(
              json['Connections'] as Map<String, dynamic>)
          : null,
      defaultArguments: (json['DefaultArguments'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      description: json['Description'] as String?,
      executionProperty: json['ExecutionProperty'] != null
          ? ExecutionProperty.fromJson(
              json['ExecutionProperty'] as Map<String, dynamic>)
          : null,
      glueVersion: json['GlueVersion'] as String?,
      logUri: json['LogUri'] as String?,
      maxCapacity: json['MaxCapacity'] as double?,
      maxRetries: json['MaxRetries'] as int?,
      nonOverridableArguments:
          (json['NonOverridableArguments'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      notificationProperty: json['NotificationProperty'] != null
          ? NotificationProperty.fromJson(
              json['NotificationProperty'] as Map<String, dynamic>)
          : null,
      numberOfWorkers: json['NumberOfWorkers'] as int?,
      role: json['Role'] as String?,
      securityConfiguration: json['SecurityConfiguration'] as String?,
      timeout: json['Timeout'] as int?,
      workerType: (json['WorkerType'] as String?)?.toWorkerType(),
    );
  }

  Map<String, dynamic> toJson() {
    final allocatedCapacity = this.allocatedCapacity;
    final command = this.command;
    final connections = this.connections;
    final defaultArguments = this.defaultArguments;
    final description = this.description;
    final executionProperty = this.executionProperty;
    final glueVersion = this.glueVersion;
    final logUri = this.logUri;
    final maxCapacity = this.maxCapacity;
    final maxRetries = this.maxRetries;
    final nonOverridableArguments = this.nonOverridableArguments;
    final notificationProperty = this.notificationProperty;
    final numberOfWorkers = this.numberOfWorkers;
    final role = this.role;
    final securityConfiguration = this.securityConfiguration;
    final timeout = this.timeout;
    final workerType = this.workerType;
    return {
      if (allocatedCapacity != null) 'AllocatedCapacity': allocatedCapacity,
      if (command != null) 'Command': command,
      if (connections != null) 'Connections': connections,
      if (defaultArguments != null) 'DefaultArguments': defaultArguments,
      if (description != null) 'Description': description,
      if (executionProperty != null) 'ExecutionProperty': executionProperty,
      if (glueVersion != null) 'GlueVersion': glueVersion,
      if (logUri != null) 'LogUri': logUri,
      if (maxCapacity != null) 'MaxCapacity': maxCapacity,
      if (maxRetries != null) 'MaxRetries': maxRetries,
      if (nonOverridableArguments != null)
        'NonOverridableArguments': nonOverridableArguments,
      if (notificationProperty != null)
        'NotificationProperty': notificationProperty,
      if (numberOfWorkers != null) 'NumberOfWorkers': numberOfWorkers,
      if (role != null) 'Role': role,
      if (securityConfiguration != null)
        'SecurityConfiguration': securityConfiguration,
      if (timeout != null) 'Timeout': timeout,
      if (workerType != null) 'WorkerType': workerType.toValue(),
    };
  }
}

/// A classifier for <code>JSON</code> content.
class JsonClassifier {
  /// A <code>JsonPath</code> string defining the JSON data for the classifier to
  /// classify. Glue supports a subset of JsonPath, as described in <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/custom-classifier.html#custom-classifier-json">Writing
  /// JsonPath Custom Classifiers</a>.
  final String jsonPath;

  /// The name of the classifier.
  final String name;

  /// The time that this classifier was registered.
  final DateTime? creationTime;

  /// The time that this classifier was last updated.
  final DateTime? lastUpdated;

  /// The version of this classifier.
  final int? version;

  JsonClassifier({
    required this.jsonPath,
    required this.name,
    this.creationTime,
    this.lastUpdated,
    this.version,
  });

  factory JsonClassifier.fromJson(Map<String, dynamic> json) {
    return JsonClassifier(
      jsonPath: json['JsonPath'] as String,
      name: json['Name'] as String,
      creationTime: timeStampFromJson(json['CreationTime']),
      lastUpdated: timeStampFromJson(json['LastUpdated']),
      version: json['Version'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final jsonPath = this.jsonPath;
    final name = this.name;
    final creationTime = this.creationTime;
    final lastUpdated = this.lastUpdated;
    final version = this.version;
    return {
      'JsonPath': jsonPath,
      'Name': name,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (lastUpdated != null) 'LastUpdated': unixTimestampToJson(lastUpdated),
      if (version != null) 'Version': version,
    };
  }
}

/// A partition key pair consisting of a name and a type.
class KeySchemaElement {
  /// The name of a partition key.
  final String name;

  /// The type of a partition key.
  final String type;

  KeySchemaElement({
    required this.name,
    required this.type,
  });

  factory KeySchemaElement.fromJson(Map<String, dynamic> json) {
    return KeySchemaElement(
      name: json['Name'] as String,
      type: json['Type'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    return {
      'Name': name,
      'Type': type,
    };
  }
}

/// Specifies configuration properties for a labeling set generation task run.
class LabelingSetGenerationTaskRunProperties {
  /// The Amazon Simple Storage Service (Amazon S3) path where you will generate
  /// the labeling set.
  final String? outputS3Path;

  LabelingSetGenerationTaskRunProperties({
    this.outputS3Path,
  });

  factory LabelingSetGenerationTaskRunProperties.fromJson(
      Map<String, dynamic> json) {
    return LabelingSetGenerationTaskRunProperties(
      outputS3Path: json['OutputS3Path'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final outputS3Path = this.outputS3Path;
    return {
      if (outputS3Path != null) 'OutputS3Path': outputS3Path,
    };
  }
}

enum Language {
  python,
  scala,
}

extension on Language {
  String toValue() {
    switch (this) {
      case Language.python:
        return 'PYTHON';
      case Language.scala:
        return 'SCALA';
    }
  }
}

extension on String {
  Language toLanguage() {
    switch (this) {
      case 'PYTHON':
        return Language.python;
      case 'SCALA':
        return Language.scala;
    }
    throw Exception('$this is not known in enum Language');
  }
}

/// Status and error information about the most recent crawl.
class LastCrawlInfo {
  /// If an error occurred, the error information about the last crawl.
  final String? errorMessage;

  /// The log group for the last crawl.
  final String? logGroup;

  /// The log stream for the last crawl.
  final String? logStream;

  /// The prefix for a message about this crawl.
  final String? messagePrefix;

  /// The time at which the crawl started.
  final DateTime? startTime;

  /// Status of the last crawl.
  final LastCrawlStatus? status;

  LastCrawlInfo({
    this.errorMessage,
    this.logGroup,
    this.logStream,
    this.messagePrefix,
    this.startTime,
    this.status,
  });

  factory LastCrawlInfo.fromJson(Map<String, dynamic> json) {
    return LastCrawlInfo(
      errorMessage: json['ErrorMessage'] as String?,
      logGroup: json['LogGroup'] as String?,
      logStream: json['LogStream'] as String?,
      messagePrefix: json['MessagePrefix'] as String?,
      startTime: timeStampFromJson(json['StartTime']),
      status: (json['Status'] as String?)?.toLastCrawlStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final errorMessage = this.errorMessage;
    final logGroup = this.logGroup;
    final logStream = this.logStream;
    final messagePrefix = this.messagePrefix;
    final startTime = this.startTime;
    final status = this.status;
    return {
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (logGroup != null) 'LogGroup': logGroup,
      if (logStream != null) 'LogStream': logStream,
      if (messagePrefix != null) 'MessagePrefix': messagePrefix,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum LastCrawlStatus {
  succeeded,
  cancelled,
  failed,
}

extension on LastCrawlStatus {
  String toValue() {
    switch (this) {
      case LastCrawlStatus.succeeded:
        return 'SUCCEEDED';
      case LastCrawlStatus.cancelled:
        return 'CANCELLED';
      case LastCrawlStatus.failed:
        return 'FAILED';
    }
  }
}

extension on String {
  LastCrawlStatus toLastCrawlStatus() {
    switch (this) {
      case 'SUCCEEDED':
        return LastCrawlStatus.succeeded;
      case 'CANCELLED':
        return LastCrawlStatus.cancelled;
      case 'FAILED':
        return LastCrawlStatus.failed;
    }
    throw Exception('$this is not known in enum LastCrawlStatus');
  }
}

/// Specifies data lineage configuration settings for the crawler.
class LineageConfiguration {
  /// Specifies whether data lineage is enabled for the crawler. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// ENABLE: enables data lineage for the crawler
  /// </li>
  /// <li>
  /// DISABLE: disables data lineage for the crawler
  /// </li>
  /// </ul>
  final CrawlerLineageSettings? crawlerLineageSettings;

  LineageConfiguration({
    this.crawlerLineageSettings,
  });

  factory LineageConfiguration.fromJson(Map<String, dynamic> json) {
    return LineageConfiguration(
      crawlerLineageSettings: (json['CrawlerLineageSettings'] as String?)
          ?.toCrawlerLineageSettings(),
    );
  }

  Map<String, dynamic> toJson() {
    final crawlerLineageSettings = this.crawlerLineageSettings;
    return {
      if (crawlerLineageSettings != null)
        'CrawlerLineageSettings': crawlerLineageSettings.toValue(),
    };
  }
}

class ListCrawlersResponse {
  /// The names of all crawlers in the account, or the crawlers with the specified
  /// tags.
  final List<String>? crawlerNames;

  /// A continuation token, if the returned list does not contain the last metric
  /// available.
  final String? nextToken;

  ListCrawlersResponse({
    this.crawlerNames,
    this.nextToken,
  });

  factory ListCrawlersResponse.fromJson(Map<String, dynamic> json) {
    return ListCrawlersResponse(
      crawlerNames: (json['CrawlerNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final crawlerNames = this.crawlerNames;
    final nextToken = this.nextToken;
    return {
      if (crawlerNames != null) 'CrawlerNames': crawlerNames,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListDevEndpointsResponse {
  /// The names of all the <code>DevEndpoint</code>s in the account, or the
  /// <code>DevEndpoint</code>s with the specified tags.
  final List<String>? devEndpointNames;

  /// A continuation token, if the returned list does not contain the last metric
  /// available.
  final String? nextToken;

  ListDevEndpointsResponse({
    this.devEndpointNames,
    this.nextToken,
  });

  factory ListDevEndpointsResponse.fromJson(Map<String, dynamic> json) {
    return ListDevEndpointsResponse(
      devEndpointNames: (json['DevEndpointNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final devEndpointNames = this.devEndpointNames;
    final nextToken = this.nextToken;
    return {
      if (devEndpointNames != null) 'DevEndpointNames': devEndpointNames,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListJobsResponse {
  /// The names of all jobs in the account, or the jobs with the specified tags.
  final List<String>? jobNames;

  /// A continuation token, if the returned list does not contain the last metric
  /// available.
  final String? nextToken;

  ListJobsResponse({
    this.jobNames,
    this.nextToken,
  });

  factory ListJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListJobsResponse(
      jobNames: (json['JobNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobNames = this.jobNames;
    final nextToken = this.nextToken;
    return {
      if (jobNames != null) 'JobNames': jobNames,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListMLTransformsResponse {
  /// The identifiers of all the machine learning transforms in the account, or
  /// the machine learning transforms with the specified tags.
  final List<String> transformIds;

  /// A continuation token, if the returned list does not contain the last metric
  /// available.
  final String? nextToken;

  ListMLTransformsResponse({
    required this.transformIds,
    this.nextToken,
  });

  factory ListMLTransformsResponse.fromJson(Map<String, dynamic> json) {
    return ListMLTransformsResponse(
      transformIds: (json['TransformIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final transformIds = this.transformIds;
    final nextToken = this.nextToken;
    return {
      'TransformIds': transformIds,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListRegistriesResponse {
  /// A continuation token for paginating the returned list of tokens, returned if
  /// the current segment of the list is not the last.
  final String? nextToken;

  /// An array of <code>RegistryDetailedListItem</code> objects containing minimal
  /// details of each registry.
  final List<RegistryListItem>? registries;

  ListRegistriesResponse({
    this.nextToken,
    this.registries,
  });

  factory ListRegistriesResponse.fromJson(Map<String, dynamic> json) {
    return ListRegistriesResponse(
      nextToken: json['NextToken'] as String?,
      registries: (json['Registries'] as List?)
          ?.whereNotNull()
          .map((e) => RegistryListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final registries = this.registries;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (registries != null) 'Registries': registries,
    };
  }
}

class ListSchemaVersionsResponse {
  /// A continuation token for paginating the returned list of tokens, returned if
  /// the current segment of the list is not the last.
  final String? nextToken;

  /// An array of <code>SchemaVersionList</code> objects containing details of
  /// each schema version.
  final List<SchemaVersionListItem>? schemas;

  ListSchemaVersionsResponse({
    this.nextToken,
    this.schemas,
  });

  factory ListSchemaVersionsResponse.fromJson(Map<String, dynamic> json) {
    return ListSchemaVersionsResponse(
      nextToken: json['NextToken'] as String?,
      schemas: (json['Schemas'] as List?)
          ?.whereNotNull()
          .map((e) => SchemaVersionListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final schemas = this.schemas;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (schemas != null) 'Schemas': schemas,
    };
  }
}

class ListSchemasResponse {
  /// A continuation token for paginating the returned list of tokens, returned if
  /// the current segment of the list is not the last.
  final String? nextToken;

  /// An array of <code>SchemaListItem</code> objects containing details of each
  /// schema.
  final List<SchemaListItem>? schemas;

  ListSchemasResponse({
    this.nextToken,
    this.schemas,
  });

  factory ListSchemasResponse.fromJson(Map<String, dynamic> json) {
    return ListSchemasResponse(
      nextToken: json['NextToken'] as String?,
      schemas: (json['Schemas'] as List?)
          ?.whereNotNull()
          .map((e) => SchemaListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final schemas = this.schemas;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (schemas != null) 'Schemas': schemas,
    };
  }
}

class ListTriggersResponse {
  /// A continuation token, if the returned list does not contain the last metric
  /// available.
  final String? nextToken;

  /// The names of all triggers in the account, or the triggers with the specified
  /// tags.
  final List<String>? triggerNames;

  ListTriggersResponse({
    this.nextToken,
    this.triggerNames,
  });

  factory ListTriggersResponse.fromJson(Map<String, dynamic> json) {
    return ListTriggersResponse(
      nextToken: json['NextToken'] as String?,
      triggerNames: (json['TriggerNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final triggerNames = this.triggerNames;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (triggerNames != null) 'TriggerNames': triggerNames,
    };
  }
}

class ListWorkflowsResponse {
  /// A continuation token, if not all workflow names have been returned.
  final String? nextToken;

  /// List of names of workflows in the account.
  final List<String>? workflows;

  ListWorkflowsResponse({
    this.nextToken,
    this.workflows,
  });

  factory ListWorkflowsResponse.fromJson(Map<String, dynamic> json) {
    return ListWorkflowsResponse(
      nextToken: json['NextToken'] as String?,
      workflows: (json['Workflows'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final workflows = this.workflows;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (workflows != null) 'Workflows': workflows,
    };
  }
}

/// The location of resources.
class Location {
  /// An Amazon DynamoDB table location.
  final List<CodeGenNodeArg>? dynamoDB;

  /// A JDBC location.
  final List<CodeGenNodeArg>? jdbc;

  /// An Amazon Simple Storage Service (Amazon S3) location.
  final List<CodeGenNodeArg>? s3;

  Location({
    this.dynamoDB,
    this.jdbc,
    this.s3,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      dynamoDB: (json['DynamoDB'] as List?)
          ?.whereNotNull()
          .map((e) => CodeGenNodeArg.fromJson(e as Map<String, dynamic>))
          .toList(),
      jdbc: (json['Jdbc'] as List?)
          ?.whereNotNull()
          .map((e) => CodeGenNodeArg.fromJson(e as Map<String, dynamic>))
          .toList(),
      s3: (json['S3'] as List?)
          ?.whereNotNull()
          .map((e) => CodeGenNodeArg.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dynamoDB = this.dynamoDB;
    final jdbc = this.jdbc;
    final s3 = this.s3;
    return {
      if (dynamoDB != null) 'DynamoDB': dynamoDB,
      if (jdbc != null) 'Jdbc': jdbc,
      if (s3 != null) 'S3': s3,
    };
  }
}

enum Logical {
  and,
  any,
}

extension on Logical {
  String toValue() {
    switch (this) {
      case Logical.and:
        return 'AND';
      case Logical.any:
        return 'ANY';
    }
  }
}

extension on String {
  Logical toLogical() {
    switch (this) {
      case 'AND':
        return Logical.and;
      case 'ANY':
        return Logical.any;
    }
    throw Exception('$this is not known in enum Logical');
  }
}

enum LogicalOperator {
  equals,
}

extension on LogicalOperator {
  String toValue() {
    switch (this) {
      case LogicalOperator.equals:
        return 'EQUALS';
    }
  }
}

extension on String {
  LogicalOperator toLogicalOperator() {
    switch (this) {
      case 'EQUALS':
        return LogicalOperator.equals;
    }
    throw Exception('$this is not known in enum LogicalOperator');
  }
}

/// Defines column statistics supported for integer data columns.
class LongColumnStatisticsData {
  /// The number of distinct values in a column.
  final int numberOfDistinctValues;

  /// The number of null values in the column.
  final int numberOfNulls;

  /// The highest value in the column.
  final int? maximumValue;

  /// The lowest value in the column.
  final int? minimumValue;

  LongColumnStatisticsData({
    required this.numberOfDistinctValues,
    required this.numberOfNulls,
    this.maximumValue,
    this.minimumValue,
  });

  factory LongColumnStatisticsData.fromJson(Map<String, dynamic> json) {
    return LongColumnStatisticsData(
      numberOfDistinctValues: json['NumberOfDistinctValues'] as int,
      numberOfNulls: json['NumberOfNulls'] as int,
      maximumValue: json['MaximumValue'] as int?,
      minimumValue: json['MinimumValue'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final numberOfDistinctValues = this.numberOfDistinctValues;
    final numberOfNulls = this.numberOfNulls;
    final maximumValue = this.maximumValue;
    final minimumValue = this.minimumValue;
    return {
      'NumberOfDistinctValues': numberOfDistinctValues,
      'NumberOfNulls': numberOfNulls,
      if (maximumValue != null) 'MaximumValue': maximumValue,
      if (minimumValue != null) 'MinimumValue': minimumValue,
    };
  }
}

/// A structure for a machine learning transform.
class MLTransform {
  /// A timestamp. The time and date that this machine learning transform was
  /// created.
  final DateTime? createdOn;

  /// A user-defined, long-form description text for the machine learning
  /// transform. Descriptions are not guaranteed to be unique and can be changed
  /// at any time.
  final String? description;

  /// An <code>EvaluationMetrics</code> object. Evaluation metrics provide an
  /// estimate of the quality of your machine learning transform.
  final EvaluationMetrics? evaluationMetrics;

  /// This value determines which version of Glue this machine learning transform
  /// is compatible with. Glue 1.0 is recommended for most customers. If the value
  /// is not set, the Glue compatibility defaults to Glue 0.9. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/release-notes.html#release-notes-versions">Glue
  /// Versions</a> in the developer guide.
  final String? glueVersion;

  /// A list of Glue table definitions used by the transform.
  final List<GlueTable>? inputRecordTables;

  /// A count identifier for the labeling files generated by Glue for this
  /// transform. As you create a better transform, you can iteratively download,
  /// label, and upload the labeling file.
  final int? labelCount;

  /// A timestamp. The last point in time when this machine learning transform was
  /// modified.
  final DateTime? lastModifiedOn;

  /// The number of Glue data processing units (DPUs) that are allocated to task
  /// runs for this transform. You can allocate from 2 to 100 DPUs; the default is
  /// 10. A DPU is a relative measure of processing power that consists of 4 vCPUs
  /// of compute capacity and 16 GB of memory. For more information, see the <a
  /// href="http://aws.amazon.com/glue/pricing/">Glue pricing page</a>.
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
  final double? maxCapacity;

  /// The maximum number of times to retry after an <code>MLTaskRun</code> of the
  /// machine learning transform fails.
  final int? maxRetries;

  /// A user-defined name for the machine learning transform. Names are not
  /// guaranteed unique and can be changed at any time.
  final String? name;

  /// The number of workers of a defined <code>workerType</code> that are
  /// allocated when a task of the transform runs.
  ///
  /// If <code>WorkerType</code> is set, then <code>NumberOfWorkers</code> is
  /// required (and vice versa).
  final int? numberOfWorkers;

  /// A <code>TransformParameters</code> object. You can use parameters to tune
  /// (customize) the behavior of the machine learning transform by specifying
  /// what data it learns from and your preference on various tradeoffs (such as
  /// precious vs. recall, or accuracy vs. cost).
  final TransformParameters? parameters;

  /// The name or Amazon Resource Name (ARN) of the IAM role with the required
  /// permissions. The required permissions include both Glue service role
  /// permissions to Glue resources, and Amazon S3 permissions required by the
  /// transform.
  ///
  /// <ul>
  /// <li>
  /// This role needs Glue service role permissions to allow access to resources
  /// in Glue. See <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/attach-policy-iam-user.html">Attach
  /// a Policy to IAM Users That Access Glue</a>.
  /// </li>
  /// <li>
  /// This role needs permission to your Amazon Simple Storage Service (Amazon S3)
  /// sources, targets, temporary directory, scripts, and any libraries used by
  /// the task run for this transform.
  /// </li>
  /// </ul>
  final String? role;

  /// A map of key-value pairs representing the columns and data types that this
  /// transform can run against. Has an upper bound of 100 columns.
  final List<SchemaColumn>? schema;

  /// The current status of the machine learning transform.
  final TransformStatusType? status;

  /// The timeout in minutes of the machine learning transform.
  final int? timeout;

  /// The encryption-at-rest settings of the transform that apply to accessing
  /// user data. Machine learning transforms can access user data encrypted in
  /// Amazon S3 using KMS.
  final TransformEncryption? transformEncryption;

  /// The unique transform ID that is generated for the machine learning
  /// transform. The ID is guaranteed to be unique and does not change.
  final String? transformId;

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
  final WorkerType? workerType;

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
    this.transformEncryption,
    this.transformId,
    this.workerType,
  });

  factory MLTransform.fromJson(Map<String, dynamic> json) {
    return MLTransform(
      createdOn: timeStampFromJson(json['CreatedOn']),
      description: json['Description'] as String?,
      evaluationMetrics: json['EvaluationMetrics'] != null
          ? EvaluationMetrics.fromJson(
              json['EvaluationMetrics'] as Map<String, dynamic>)
          : null,
      glueVersion: json['GlueVersion'] as String?,
      inputRecordTables: (json['InputRecordTables'] as List?)
          ?.whereNotNull()
          .map((e) => GlueTable.fromJson(e as Map<String, dynamic>))
          .toList(),
      labelCount: json['LabelCount'] as int?,
      lastModifiedOn: timeStampFromJson(json['LastModifiedOn']),
      maxCapacity: json['MaxCapacity'] as double?,
      maxRetries: json['MaxRetries'] as int?,
      name: json['Name'] as String?,
      numberOfWorkers: json['NumberOfWorkers'] as int?,
      parameters: json['Parameters'] != null
          ? TransformParameters.fromJson(
              json['Parameters'] as Map<String, dynamic>)
          : null,
      role: json['Role'] as String?,
      schema: (json['Schema'] as List?)
          ?.whereNotNull()
          .map((e) => SchemaColumn.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['Status'] as String?)?.toTransformStatusType(),
      timeout: json['Timeout'] as int?,
      transformEncryption: json['TransformEncryption'] != null
          ? TransformEncryption.fromJson(
              json['TransformEncryption'] as Map<String, dynamic>)
          : null,
      transformId: json['TransformId'] as String?,
      workerType: (json['WorkerType'] as String?)?.toWorkerType(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdOn = this.createdOn;
    final description = this.description;
    final evaluationMetrics = this.evaluationMetrics;
    final glueVersion = this.glueVersion;
    final inputRecordTables = this.inputRecordTables;
    final labelCount = this.labelCount;
    final lastModifiedOn = this.lastModifiedOn;
    final maxCapacity = this.maxCapacity;
    final maxRetries = this.maxRetries;
    final name = this.name;
    final numberOfWorkers = this.numberOfWorkers;
    final parameters = this.parameters;
    final role = this.role;
    final schema = this.schema;
    final status = this.status;
    final timeout = this.timeout;
    final transformEncryption = this.transformEncryption;
    final transformId = this.transformId;
    final workerType = this.workerType;
    return {
      if (createdOn != null) 'CreatedOn': unixTimestampToJson(createdOn),
      if (description != null) 'Description': description,
      if (evaluationMetrics != null) 'EvaluationMetrics': evaluationMetrics,
      if (glueVersion != null) 'GlueVersion': glueVersion,
      if (inputRecordTables != null) 'InputRecordTables': inputRecordTables,
      if (labelCount != null) 'LabelCount': labelCount,
      if (lastModifiedOn != null)
        'LastModifiedOn': unixTimestampToJson(lastModifiedOn),
      if (maxCapacity != null) 'MaxCapacity': maxCapacity,
      if (maxRetries != null) 'MaxRetries': maxRetries,
      if (name != null) 'Name': name,
      if (numberOfWorkers != null) 'NumberOfWorkers': numberOfWorkers,
      if (parameters != null) 'Parameters': parameters,
      if (role != null) 'Role': role,
      if (schema != null) 'Schema': schema,
      if (status != null) 'Status': status.toValue(),
      if (timeout != null) 'Timeout': timeout,
      if (transformEncryption != null)
        'TransformEncryption': transformEncryption,
      if (transformId != null) 'TransformId': transformId,
      if (workerType != null) 'WorkerType': workerType.toValue(),
    };
  }
}

/// The encryption-at-rest settings of the transform that apply to accessing
/// user data.
class MLUserDataEncryption {
  /// The encryption mode applied to user data. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// DISABLED: encryption is disabled
  /// </li>
  /// <li>
  /// SSEKMS: use of server-side encryption with Key Management Service (SSE-KMS)
  /// for user data stored in Amazon S3.
  /// </li>
  /// </ul>
  final MLUserDataEncryptionModeString mlUserDataEncryptionMode;

  /// The ID for the customer-provided KMS key.
  final String? kmsKeyId;

  MLUserDataEncryption({
    required this.mlUserDataEncryptionMode,
    this.kmsKeyId,
  });

  factory MLUserDataEncryption.fromJson(Map<String, dynamic> json) {
    return MLUserDataEncryption(
      mlUserDataEncryptionMode: (json['MlUserDataEncryptionMode'] as String)
          .toMLUserDataEncryptionModeString(),
      kmsKeyId: json['KmsKeyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final mlUserDataEncryptionMode = this.mlUserDataEncryptionMode;
    final kmsKeyId = this.kmsKeyId;
    return {
      'MlUserDataEncryptionMode': mlUserDataEncryptionMode.toValue(),
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
    };
  }
}

enum MLUserDataEncryptionModeString {
  disabled,
  sseKms,
}

extension on MLUserDataEncryptionModeString {
  String toValue() {
    switch (this) {
      case MLUserDataEncryptionModeString.disabled:
        return 'DISABLED';
      case MLUserDataEncryptionModeString.sseKms:
        return 'SSE-KMS';
    }
  }
}

extension on String {
  MLUserDataEncryptionModeString toMLUserDataEncryptionModeString() {
    switch (this) {
      case 'DISABLED':
        return MLUserDataEncryptionModeString.disabled;
      case 'SSE-KMS':
        return MLUserDataEncryptionModeString.sseKms;
    }
    throw Exception(
        '$this is not known in enum MLUserDataEncryptionModeString');
  }
}

/// Defines a mapping.
class MappingEntry {
  /// The source path.
  final String? sourcePath;

  /// The name of the source table.
  final String? sourceTable;

  /// The source type.
  final String? sourceType;

  /// The target path.
  final String? targetPath;

  /// The target table.
  final String? targetTable;

  /// The target type.
  final String? targetType;

  MappingEntry({
    this.sourcePath,
    this.sourceTable,
    this.sourceType,
    this.targetPath,
    this.targetTable,
    this.targetType,
  });

  factory MappingEntry.fromJson(Map<String, dynamic> json) {
    return MappingEntry(
      sourcePath: json['SourcePath'] as String?,
      sourceTable: json['SourceTable'] as String?,
      sourceType: json['SourceType'] as String?,
      targetPath: json['TargetPath'] as String?,
      targetTable: json['TargetTable'] as String?,
      targetType: json['TargetType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sourcePath = this.sourcePath;
    final sourceTable = this.sourceTable;
    final sourceType = this.sourceType;
    final targetPath = this.targetPath;
    final targetTable = this.targetTable;
    final targetType = this.targetType;
    return {
      if (sourcePath != null) 'SourcePath': sourcePath,
      if (sourceTable != null) 'SourceTable': sourceTable,
      if (sourceType != null) 'SourceType': sourceType,
      if (targetPath != null) 'TargetPath': targetPath,
      if (targetTable != null) 'TargetTable': targetTable,
      if (targetType != null) 'TargetType': targetType,
    };
  }
}

/// A structure containing metadata information for a schema version.
class MetadataInfo {
  /// The time at which the entry was created.
  final String? createdTime;

  /// The metadata key’s corresponding value.
  final String? metadataValue;

  /// Other metadata belonging to the same metadata key.
  final List<OtherMetadataValueListItem>? otherMetadataValueList;

  MetadataInfo({
    this.createdTime,
    this.metadataValue,
    this.otherMetadataValueList,
  });

  factory MetadataInfo.fromJson(Map<String, dynamic> json) {
    return MetadataInfo(
      createdTime: json['CreatedTime'] as String?,
      metadataValue: json['MetadataValue'] as String?,
      otherMetadataValueList: (json['OtherMetadataValueList'] as List?)
          ?.whereNotNull()
          .map((e) =>
              OtherMetadataValueListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdTime = this.createdTime;
    final metadataValue = this.metadataValue;
    final otherMetadataValueList = this.otherMetadataValueList;
    return {
      if (createdTime != null) 'CreatedTime': createdTime,
      if (metadataValue != null) 'MetadataValue': metadataValue,
      if (otherMetadataValueList != null)
        'OtherMetadataValueList': otherMetadataValueList,
    };
  }
}

/// A structure containing a key value pair for metadata.
class MetadataKeyValuePair {
  /// A metadata key.
  final String? metadataKey;

  /// A metadata key’s corresponding value.
  final String? metadataValue;

  MetadataKeyValuePair({
    this.metadataKey,
    this.metadataValue,
  });

  factory MetadataKeyValuePair.fromJson(Map<String, dynamic> json) {
    return MetadataKeyValuePair(
      metadataKey: json['MetadataKey'] as String?,
      metadataValue: json['MetadataValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final metadataKey = this.metadataKey;
    final metadataValue = this.metadataValue;
    return {
      if (metadataKey != null) 'MetadataKey': metadataKey,
      if (metadataValue != null) 'MetadataValue': metadataValue,
    };
  }
}

/// Specifies an Amazon DocumentDB or MongoDB data store to crawl.
class MongoDBTarget {
  /// The name of the connection to use to connect to the Amazon DocumentDB or
  /// MongoDB target.
  final String? connectionName;

  /// The path of the Amazon DocumentDB or MongoDB target (database/collection).
  final String? path;

  /// Indicates whether to scan all the records, or to sample rows from the table.
  /// Scanning all the records can take a long time when the table is not a high
  /// throughput table.
  ///
  /// A value of <code>true</code> means to scan all records, while a value of
  /// <code>false</code> means to sample the records. If no value is specified,
  /// the value defaults to <code>true</code>.
  final bool? scanAll;

  MongoDBTarget({
    this.connectionName,
    this.path,
    this.scanAll,
  });

  factory MongoDBTarget.fromJson(Map<String, dynamic> json) {
    return MongoDBTarget(
      connectionName: json['ConnectionName'] as String?,
      path: json['Path'] as String?,
      scanAll: json['ScanAll'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectionName = this.connectionName;
    final path = this.path;
    final scanAll = this.scanAll;
    return {
      if (connectionName != null) 'ConnectionName': connectionName,
      if (path != null) 'Path': path,
      if (scanAll != null) 'ScanAll': scanAll,
    };
  }
}

/// A node represents an Glue component such as a trigger, or job, etc., that is
/// part of a workflow.
class Node {
  /// Details of the crawler when the node represents a crawler.
  final CrawlerNodeDetails? crawlerDetails;

  /// Details of the Job when the node represents a Job.
  final JobNodeDetails? jobDetails;

  /// The name of the Glue component represented by the node.
  final String? name;

  /// Details of the Trigger when the node represents a Trigger.
  final TriggerNodeDetails? triggerDetails;

  /// The type of Glue component represented by the node.
  final NodeType? type;

  /// The unique Id assigned to the node within the workflow.
  final String? uniqueId;

  Node({
    this.crawlerDetails,
    this.jobDetails,
    this.name,
    this.triggerDetails,
    this.type,
    this.uniqueId,
  });

  factory Node.fromJson(Map<String, dynamic> json) {
    return Node(
      crawlerDetails: json['CrawlerDetails'] != null
          ? CrawlerNodeDetails.fromJson(
              json['CrawlerDetails'] as Map<String, dynamic>)
          : null,
      jobDetails: json['JobDetails'] != null
          ? JobNodeDetails.fromJson(json['JobDetails'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      triggerDetails: json['TriggerDetails'] != null
          ? TriggerNodeDetails.fromJson(
              json['TriggerDetails'] as Map<String, dynamic>)
          : null,
      type: (json['Type'] as String?)?.toNodeType(),
      uniqueId: json['UniqueId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final crawlerDetails = this.crawlerDetails;
    final jobDetails = this.jobDetails;
    final name = this.name;
    final triggerDetails = this.triggerDetails;
    final type = this.type;
    final uniqueId = this.uniqueId;
    return {
      if (crawlerDetails != null) 'CrawlerDetails': crawlerDetails,
      if (jobDetails != null) 'JobDetails': jobDetails,
      if (name != null) 'Name': name,
      if (triggerDetails != null) 'TriggerDetails': triggerDetails,
      if (type != null) 'Type': type.toValue(),
      if (uniqueId != null) 'UniqueId': uniqueId,
    };
  }
}

enum NodeType {
  crawler,
  job,
  trigger,
}

extension on NodeType {
  String toValue() {
    switch (this) {
      case NodeType.crawler:
        return 'CRAWLER';
      case NodeType.job:
        return 'JOB';
      case NodeType.trigger:
        return 'TRIGGER';
    }
  }
}

extension on String {
  NodeType toNodeType() {
    switch (this) {
      case 'CRAWLER':
        return NodeType.crawler;
      case 'JOB':
        return NodeType.job;
      case 'TRIGGER':
        return NodeType.trigger;
    }
    throw Exception('$this is not known in enum NodeType');
  }
}

/// Specifies configuration properties of a notification.
class NotificationProperty {
  /// After a job run starts, the number of minutes to wait before sending a job
  /// run delay notification.
  final int? notifyDelayAfter;

  NotificationProperty({
    this.notifyDelayAfter,
  });

  factory NotificationProperty.fromJson(Map<String, dynamic> json) {
    return NotificationProperty(
      notifyDelayAfter: json['NotifyDelayAfter'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final notifyDelayAfter = this.notifyDelayAfter;
    return {
      if (notifyDelayAfter != null) 'NotifyDelayAfter': notifyDelayAfter,
    };
  }
}

/// Specifies the sort order of a sorted column.
class Order {
  /// The name of the column.
  final String column;

  /// Indicates that the column is sorted in ascending order (<code>== 1</code>),
  /// or in descending order (<code>==0</code>).
  final int sortOrder;

  Order({
    required this.column,
    required this.sortOrder,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      column: json['Column'] as String,
      sortOrder: json['SortOrder'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final column = this.column;
    final sortOrder = this.sortOrder;
    return {
      'Column': column,
      'SortOrder': sortOrder,
    };
  }
}

/// A structure containing other metadata for a schema version belonging to the
/// same metadata key.
class OtherMetadataValueListItem {
  /// The time at which the entry was created.
  final String? createdTime;

  /// The metadata key’s corresponding value for the other metadata belonging to
  /// the same metadata key.
  final String? metadataValue;

  OtherMetadataValueListItem({
    this.createdTime,
    this.metadataValue,
  });

  factory OtherMetadataValueListItem.fromJson(Map<String, dynamic> json) {
    return OtherMetadataValueListItem(
      createdTime: json['CreatedTime'] as String?,
      metadataValue: json['MetadataValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTime = this.createdTime;
    final metadataValue = this.metadataValue;
    return {
      if (createdTime != null) 'CreatedTime': createdTime,
      if (metadataValue != null) 'MetadataValue': metadataValue,
    };
  }
}

/// Represents a slice of table data.
class Partition {
  /// The ID of the Data Catalog in which the partition resides.
  final String? catalogId;

  /// The time at which the partition was created.
  final DateTime? creationTime;

  /// The name of the catalog database in which to create the partition.
  final String? databaseName;

  /// The last time at which the partition was accessed.
  final DateTime? lastAccessTime;

  /// The last time at which column statistics were computed for this partition.
  final DateTime? lastAnalyzedTime;

  /// These key-value pairs define partition parameters.
  final Map<String, String>? parameters;

  /// Provides information about the physical location where the partition is
  /// stored.
  final StorageDescriptor? storageDescriptor;

  /// The name of the database table in which to create the partition.
  final String? tableName;

  /// The values of the partition.
  final List<String>? values;

  Partition({
    this.catalogId,
    this.creationTime,
    this.databaseName,
    this.lastAccessTime,
    this.lastAnalyzedTime,
    this.parameters,
    this.storageDescriptor,
    this.tableName,
    this.values,
  });

  factory Partition.fromJson(Map<String, dynamic> json) {
    return Partition(
      catalogId: json['CatalogId'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      databaseName: json['DatabaseName'] as String?,
      lastAccessTime: timeStampFromJson(json['LastAccessTime']),
      lastAnalyzedTime: timeStampFromJson(json['LastAnalyzedTime']),
      parameters: (json['Parameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      storageDescriptor: json['StorageDescriptor'] != null
          ? StorageDescriptor.fromJson(
              json['StorageDescriptor'] as Map<String, dynamic>)
          : null,
      tableName: json['TableName'] as String?,
      values: (json['Values'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final catalogId = this.catalogId;
    final creationTime = this.creationTime;
    final databaseName = this.databaseName;
    final lastAccessTime = this.lastAccessTime;
    final lastAnalyzedTime = this.lastAnalyzedTime;
    final parameters = this.parameters;
    final storageDescriptor = this.storageDescriptor;
    final tableName = this.tableName;
    final values = this.values;
    return {
      if (catalogId != null) 'CatalogId': catalogId,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (databaseName != null) 'DatabaseName': databaseName,
      if (lastAccessTime != null)
        'LastAccessTime': unixTimestampToJson(lastAccessTime),
      if (lastAnalyzedTime != null)
        'LastAnalyzedTime': unixTimestampToJson(lastAnalyzedTime),
      if (parameters != null) 'Parameters': parameters,
      if (storageDescriptor != null) 'StorageDescriptor': storageDescriptor,
      if (tableName != null) 'TableName': tableName,
      if (values != null) 'Values': values,
    };
  }
}

/// Contains information about a partition error.
class PartitionError {
  /// The details about the partition error.
  final ErrorDetail? errorDetail;

  /// The values that define the partition.
  final List<String>? partitionValues;

  PartitionError({
    this.errorDetail,
    this.partitionValues,
  });

  factory PartitionError.fromJson(Map<String, dynamic> json) {
    return PartitionError(
      errorDetail: json['ErrorDetail'] != null
          ? ErrorDetail.fromJson(json['ErrorDetail'] as Map<String, dynamic>)
          : null,
      partitionValues: (json['PartitionValues'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errorDetail = this.errorDetail;
    final partitionValues = this.partitionValues;
    return {
      if (errorDetail != null) 'ErrorDetail': errorDetail,
      if (partitionValues != null) 'PartitionValues': partitionValues,
    };
  }
}

/// A structure for a partition index.
class PartitionIndex {
  /// The name of the partition index.
  final String indexName;

  /// The keys for the partition index.
  final List<String> keys;

  PartitionIndex({
    required this.indexName,
    required this.keys,
  });

  factory PartitionIndex.fromJson(Map<String, dynamic> json) {
    return PartitionIndex(
      indexName: json['IndexName'] as String,
      keys: (json['Keys'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final indexName = this.indexName;
    final keys = this.keys;
    return {
      'IndexName': indexName,
      'Keys': keys,
    };
  }
}

/// A descriptor for a partition index in a table.
class PartitionIndexDescriptor {
  /// The name of the partition index.
  final String indexName;

  /// The status of the partition index.
  ///
  /// The possible statuses are:
  ///
  /// <ul>
  /// <li>
  /// CREATING: The index is being created. When an index is in a CREATING state,
  /// the index or its table cannot be deleted.
  /// </li>
  /// <li>
  /// ACTIVE: The index creation succeeds.
  /// </li>
  /// <li>
  /// FAILED: The index creation fails.
  /// </li>
  /// <li>
  /// DELETING: The index is deleted from the list of indexes.
  /// </li>
  /// </ul>
  final PartitionIndexStatus indexStatus;

  /// A list of one or more keys, as <code>KeySchemaElement</code> structures, for
  /// the partition index.
  final List<KeySchemaElement> keys;

  /// A list of errors that can occur when registering partition indexes for an
  /// existing table.
  final List<BackfillError>? backfillErrors;

  PartitionIndexDescriptor({
    required this.indexName,
    required this.indexStatus,
    required this.keys,
    this.backfillErrors,
  });

  factory PartitionIndexDescriptor.fromJson(Map<String, dynamic> json) {
    return PartitionIndexDescriptor(
      indexName: json['IndexName'] as String,
      indexStatus: (json['IndexStatus'] as String).toPartitionIndexStatus(),
      keys: (json['Keys'] as List)
          .whereNotNull()
          .map((e) => KeySchemaElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      backfillErrors: (json['BackfillErrors'] as List?)
          ?.whereNotNull()
          .map((e) => BackfillError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final indexName = this.indexName;
    final indexStatus = this.indexStatus;
    final keys = this.keys;
    final backfillErrors = this.backfillErrors;
    return {
      'IndexName': indexName,
      'IndexStatus': indexStatus.toValue(),
      'Keys': keys,
      if (backfillErrors != null) 'BackfillErrors': backfillErrors,
    };
  }
}

enum PartitionIndexStatus {
  creating,
  active,
  deleting,
  failed,
}

extension on PartitionIndexStatus {
  String toValue() {
    switch (this) {
      case PartitionIndexStatus.creating:
        return 'CREATING';
      case PartitionIndexStatus.active:
        return 'ACTIVE';
      case PartitionIndexStatus.deleting:
        return 'DELETING';
      case PartitionIndexStatus.failed:
        return 'FAILED';
    }
  }
}

extension on String {
  PartitionIndexStatus toPartitionIndexStatus() {
    switch (this) {
      case 'CREATING':
        return PartitionIndexStatus.creating;
      case 'ACTIVE':
        return PartitionIndexStatus.active;
      case 'DELETING':
        return PartitionIndexStatus.deleting;
      case 'FAILED':
        return PartitionIndexStatus.failed;
    }
    throw Exception('$this is not known in enum PartitionIndexStatus');
  }
}

/// The structure used to create and update a partition.
class PartitionInput {
  /// The last time at which the partition was accessed.
  final DateTime? lastAccessTime;

  /// The last time at which column statistics were computed for this partition.
  final DateTime? lastAnalyzedTime;

  /// These key-value pairs define partition parameters.
  final Map<String, String>? parameters;

  /// Provides information about the physical location where the partition is
  /// stored.
  final StorageDescriptor? storageDescriptor;

  /// The values of the partition. Although this parameter is not required by the
  /// SDK, you must specify this parameter for a valid input.
  ///
  /// The values for the keys for the new partition must be passed as an array of
  /// String objects that must be ordered in the same order as the partition keys
  /// appearing in the Amazon S3 prefix. Otherwise Glue will add the values to the
  /// wrong keys.
  final List<String>? values;

  PartitionInput({
    this.lastAccessTime,
    this.lastAnalyzedTime,
    this.parameters,
    this.storageDescriptor,
    this.values,
  });

  factory PartitionInput.fromJson(Map<String, dynamic> json) {
    return PartitionInput(
      lastAccessTime: timeStampFromJson(json['LastAccessTime']),
      lastAnalyzedTime: timeStampFromJson(json['LastAnalyzedTime']),
      parameters: (json['Parameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      storageDescriptor: json['StorageDescriptor'] != null
          ? StorageDescriptor.fromJson(
              json['StorageDescriptor'] as Map<String, dynamic>)
          : null,
      values: (json['Values'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final lastAccessTime = this.lastAccessTime;
    final lastAnalyzedTime = this.lastAnalyzedTime;
    final parameters = this.parameters;
    final storageDescriptor = this.storageDescriptor;
    final values = this.values;
    return {
      if (lastAccessTime != null)
        'LastAccessTime': unixTimestampToJson(lastAccessTime),
      if (lastAnalyzedTime != null)
        'LastAnalyzedTime': unixTimestampToJson(lastAnalyzedTime),
      if (parameters != null) 'Parameters': parameters,
      if (storageDescriptor != null) 'StorageDescriptor': storageDescriptor,
      if (values != null) 'Values': values,
    };
  }
}

/// Contains a list of values defining partitions.
class PartitionValueList {
  /// The list of values.
  final List<String> values;

  PartitionValueList({
    required this.values,
  });

  factory PartitionValueList.fromJson(Map<String, dynamic> json) {
    return PartitionValueList(
      values: (json['Values'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final values = this.values;
    return {
      'Values': values,
    };
  }
}

enum Permission {
  all,
  select,
  alter,
  drop,
  delete,
  insert,
  createDatabase,
  createTable,
  dataLocationAccess,
}

extension on Permission {
  String toValue() {
    switch (this) {
      case Permission.all:
        return 'ALL';
      case Permission.select:
        return 'SELECT';
      case Permission.alter:
        return 'ALTER';
      case Permission.drop:
        return 'DROP';
      case Permission.delete:
        return 'DELETE';
      case Permission.insert:
        return 'INSERT';
      case Permission.createDatabase:
        return 'CREATE_DATABASE';
      case Permission.createTable:
        return 'CREATE_TABLE';
      case Permission.dataLocationAccess:
        return 'DATA_LOCATION_ACCESS';
    }
  }
}

extension on String {
  Permission toPermission() {
    switch (this) {
      case 'ALL':
        return Permission.all;
      case 'SELECT':
        return Permission.select;
      case 'ALTER':
        return Permission.alter;
      case 'DROP':
        return Permission.drop;
      case 'DELETE':
        return Permission.delete;
      case 'INSERT':
        return Permission.insert;
      case 'CREATE_DATABASE':
        return Permission.createDatabase;
      case 'CREATE_TABLE':
        return Permission.createTable;
      case 'DATA_LOCATION_ACCESS':
        return Permission.dataLocationAccess;
    }
    throw Exception('$this is not known in enum Permission');
  }
}

/// Specifies the physical requirements for a connection.
class PhysicalConnectionRequirements {
  /// The connection's Availability Zone. This field is redundant because the
  /// specified subnet implies the Availability Zone to be used. Currently the
  /// field must be populated, but it will be deprecated in the future.
  final String? availabilityZone;

  /// The security group ID list used by the connection.
  final List<String>? securityGroupIdList;

  /// The subnet ID used by the connection.
  final String? subnetId;

  PhysicalConnectionRequirements({
    this.availabilityZone,
    this.securityGroupIdList,
    this.subnetId,
  });

  factory PhysicalConnectionRequirements.fromJson(Map<String, dynamic> json) {
    return PhysicalConnectionRequirements(
      availabilityZone: json['AvailabilityZone'] as String?,
      securityGroupIdList: (json['SecurityGroupIdList'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      subnetId: json['SubnetId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZone = this.availabilityZone;
    final securityGroupIdList = this.securityGroupIdList;
    final subnetId = this.subnetId;
    return {
      if (availabilityZone != null) 'AvailabilityZone': availabilityZone,
      if (securityGroupIdList != null)
        'SecurityGroupIdList': securityGroupIdList,
      if (subnetId != null) 'SubnetId': subnetId,
    };
  }
}

/// A job run that was used in the predicate of a conditional trigger that
/// triggered this job run.
class Predecessor {
  /// The name of the job definition used by the predecessor job run.
  final String? jobName;

  /// The job-run ID of the predecessor job run.
  final String? runId;

  Predecessor({
    this.jobName,
    this.runId,
  });

  factory Predecessor.fromJson(Map<String, dynamic> json) {
    return Predecessor(
      jobName: json['JobName'] as String?,
      runId: json['RunId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobName = this.jobName;
    final runId = this.runId;
    return {
      if (jobName != null) 'JobName': jobName,
      if (runId != null) 'RunId': runId,
    };
  }
}

/// Defines the predicate of the trigger, which determines when it fires.
class Predicate {
  /// A list of the conditions that determine when the trigger will fire.
  final List<Condition>? conditions;

  /// An optional field if only one condition is listed. If multiple conditions
  /// are listed, then this field is required.
  final Logical? logical;

  Predicate({
    this.conditions,
    this.logical,
  });

  factory Predicate.fromJson(Map<String, dynamic> json) {
    return Predicate(
      conditions: (json['Conditions'] as List?)
          ?.whereNotNull()
          .map((e) => Condition.fromJson(e as Map<String, dynamic>))
          .toList(),
      logical: (json['Logical'] as String?)?.toLogical(),
    );
  }

  Map<String, dynamic> toJson() {
    final conditions = this.conditions;
    final logical = this.logical;
    return {
      if (conditions != null) 'Conditions': conditions,
      if (logical != null) 'Logical': logical.toValue(),
    };
  }
}

/// Permissions granted to a principal.
class PrincipalPermissions {
  /// The permissions that are granted to the principal.
  final List<Permission>? permissions;

  /// The principal who is granted permissions.
  final DataLakePrincipal? principal;

  PrincipalPermissions({
    this.permissions,
    this.principal,
  });

  factory PrincipalPermissions.fromJson(Map<String, dynamic> json) {
    return PrincipalPermissions(
      permissions: (json['Permissions'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toPermission())
          .toList(),
      principal: json['Principal'] != null
          ? DataLakePrincipal.fromJson(
              json['Principal'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final permissions = this.permissions;
    final principal = this.principal;
    return {
      if (permissions != null)
        'Permissions': permissions.map((e) => e.toValue()).toList(),
      if (principal != null) 'Principal': principal,
    };
  }
}

enum PrincipalType {
  user,
  role,
  group,
}

extension on PrincipalType {
  String toValue() {
    switch (this) {
      case PrincipalType.user:
        return 'USER';
      case PrincipalType.role:
        return 'ROLE';
      case PrincipalType.group:
        return 'GROUP';
    }
  }
}

extension on String {
  PrincipalType toPrincipalType() {
    switch (this) {
      case 'USER':
        return PrincipalType.user;
      case 'ROLE':
        return PrincipalType.role;
      case 'GROUP':
        return PrincipalType.group;
    }
    throw Exception('$this is not known in enum PrincipalType');
  }
}

/// Defines a property predicate.
class PropertyPredicate {
  /// The comparator used to compare this property to others.
  final Comparator? comparator;

  /// The key of the property.
  final String? key;

  /// The value of the property.
  final String? value;

  PropertyPredicate({
    this.comparator,
    this.key,
    this.value,
  });

  factory PropertyPredicate.fromJson(Map<String, dynamic> json) {
    return PropertyPredicate(
      comparator: (json['Comparator'] as String?)?.toComparator(),
      key: json['Key'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final comparator = this.comparator;
    final key = this.key;
    final value = this.value;
    return {
      if (comparator != null) 'Comparator': comparator.toValue(),
      if (key != null) 'Key': key,
      if (value != null) 'Value': value,
    };
  }
}

class PutDataCatalogEncryptionSettingsResponse {
  PutDataCatalogEncryptionSettingsResponse();

  factory PutDataCatalogEncryptionSettingsResponse.fromJson(
      Map<String, dynamic> _) {
    return PutDataCatalogEncryptionSettingsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class PutResourcePolicyResponse {
  /// A hash of the policy that has just been set. This must be included in a
  /// subsequent call that overwrites or updates this policy.
  final String? policyHash;

  PutResourcePolicyResponse({
    this.policyHash,
  });

  factory PutResourcePolicyResponse.fromJson(Map<String, dynamic> json) {
    return PutResourcePolicyResponse(
      policyHash: json['PolicyHash'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policyHash = this.policyHash;
    return {
      if (policyHash != null) 'PolicyHash': policyHash,
    };
  }
}

class PutSchemaVersionMetadataResponse {
  /// The latest version of the schema.
  final bool? latestVersion;

  /// The metadata key.
  final String? metadataKey;

  /// The value of the metadata key.
  final String? metadataValue;

  /// The name for the registry.
  final String? registryName;

  /// The Amazon Resource Name (ARN) for the schema.
  final String? schemaArn;

  /// The name for the schema.
  final String? schemaName;

  /// The unique version ID of the schema version.
  final String? schemaVersionId;

  /// The version number of the schema.
  final int? versionNumber;

  PutSchemaVersionMetadataResponse({
    this.latestVersion,
    this.metadataKey,
    this.metadataValue,
    this.registryName,
    this.schemaArn,
    this.schemaName,
    this.schemaVersionId,
    this.versionNumber,
  });

  factory PutSchemaVersionMetadataResponse.fromJson(Map<String, dynamic> json) {
    return PutSchemaVersionMetadataResponse(
      latestVersion: json['LatestVersion'] as bool?,
      metadataKey: json['MetadataKey'] as String?,
      metadataValue: json['MetadataValue'] as String?,
      registryName: json['RegistryName'] as String?,
      schemaArn: json['SchemaArn'] as String?,
      schemaName: json['SchemaName'] as String?,
      schemaVersionId: json['SchemaVersionId'] as String?,
      versionNumber: json['VersionNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final latestVersion = this.latestVersion;
    final metadataKey = this.metadataKey;
    final metadataValue = this.metadataValue;
    final registryName = this.registryName;
    final schemaArn = this.schemaArn;
    final schemaName = this.schemaName;
    final schemaVersionId = this.schemaVersionId;
    final versionNumber = this.versionNumber;
    return {
      if (latestVersion != null) 'LatestVersion': latestVersion,
      if (metadataKey != null) 'MetadataKey': metadataKey,
      if (metadataValue != null) 'MetadataValue': metadataValue,
      if (registryName != null) 'RegistryName': registryName,
      if (schemaArn != null) 'SchemaArn': schemaArn,
      if (schemaName != null) 'SchemaName': schemaName,
      if (schemaVersionId != null) 'SchemaVersionId': schemaVersionId,
      if (versionNumber != null) 'VersionNumber': versionNumber,
    };
  }
}

class PutWorkflowRunPropertiesResponse {
  PutWorkflowRunPropertiesResponse();

  factory PutWorkflowRunPropertiesResponse.fromJson(Map<String, dynamic> _) {
    return PutWorkflowRunPropertiesResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class QuerySchemaVersionMetadataResponse {
  /// A map of a metadata key and associated values.
  final Map<String, MetadataInfo>? metadataInfoMap;

  /// A continuation token for paginating the returned list of tokens, returned if
  /// the current segment of the list is not the last.
  final String? nextToken;

  /// The unique version ID of the schema version.
  final String? schemaVersionId;

  QuerySchemaVersionMetadataResponse({
    this.metadataInfoMap,
    this.nextToken,
    this.schemaVersionId,
  });

  factory QuerySchemaVersionMetadataResponse.fromJson(
      Map<String, dynamic> json) {
    return QuerySchemaVersionMetadataResponse(
      metadataInfoMap: (json['MetadataInfoMap'] as Map<String, dynamic>?)?.map(
          (k, e) =>
              MapEntry(k, MetadataInfo.fromJson(e as Map<String, dynamic>))),
      nextToken: json['NextToken'] as String?,
      schemaVersionId: json['SchemaVersionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final metadataInfoMap = this.metadataInfoMap;
    final nextToken = this.nextToken;
    final schemaVersionId = this.schemaVersionId;
    return {
      if (metadataInfoMap != null) 'MetadataInfoMap': metadataInfoMap,
      if (nextToken != null) 'NextToken': nextToken,
      if (schemaVersionId != null) 'SchemaVersionId': schemaVersionId,
    };
  }
}

enum RecrawlBehavior {
  crawlEverything,
  crawlNewFoldersOnly,
}

extension on RecrawlBehavior {
  String toValue() {
    switch (this) {
      case RecrawlBehavior.crawlEverything:
        return 'CRAWL_EVERYTHING';
      case RecrawlBehavior.crawlNewFoldersOnly:
        return 'CRAWL_NEW_FOLDERS_ONLY';
    }
  }
}

extension on String {
  RecrawlBehavior toRecrawlBehavior() {
    switch (this) {
      case 'CRAWL_EVERYTHING':
        return RecrawlBehavior.crawlEverything;
      case 'CRAWL_NEW_FOLDERS_ONLY':
        return RecrawlBehavior.crawlNewFoldersOnly;
    }
    throw Exception('$this is not known in enum RecrawlBehavior');
  }
}

/// When crawling an Amazon S3 data source after the first crawl is complete,
/// specifies whether to crawl the entire dataset again or to crawl only folders
/// that were added since the last crawler run. For more information, see <a
/// href="https://docs.aws.amazon.com/glue/latest/dg/incremental-crawls.html">Incremental
/// Crawls in Glue</a> in the developer guide.
class RecrawlPolicy {
  /// Specifies whether to crawl the entire dataset again or to crawl only folders
  /// that were added since the last crawler run.
  ///
  /// A value of <code>CRAWL_EVERYTHING</code> specifies crawling the entire
  /// dataset again.
  ///
  /// A value of <code>CRAWL_NEW_FOLDERS_ONLY</code> specifies crawling only
  /// folders that were added since the last crawler run.
  final RecrawlBehavior? recrawlBehavior;

  RecrawlPolicy({
    this.recrawlBehavior,
  });

  factory RecrawlPolicy.fromJson(Map<String, dynamic> json) {
    return RecrawlPolicy(
      recrawlBehavior:
          (json['RecrawlBehavior'] as String?)?.toRecrawlBehavior(),
    );
  }

  Map<String, dynamic> toJson() {
    final recrawlBehavior = this.recrawlBehavior;
    return {
      if (recrawlBehavior != null) 'RecrawlBehavior': recrawlBehavior.toValue(),
    };
  }
}

class RegisterSchemaVersionResponse {
  /// The unique ID that represents the version of this schema.
  final String? schemaVersionId;

  /// The status of the schema version.
  final SchemaVersionStatus? status;

  /// The version of this schema (for sync flow only, in case this is the first
  /// version).
  final int? versionNumber;

  RegisterSchemaVersionResponse({
    this.schemaVersionId,
    this.status,
    this.versionNumber,
  });

  factory RegisterSchemaVersionResponse.fromJson(Map<String, dynamic> json) {
    return RegisterSchemaVersionResponse(
      schemaVersionId: json['SchemaVersionId'] as String?,
      status: (json['Status'] as String?)?.toSchemaVersionStatus(),
      versionNumber: json['VersionNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final schemaVersionId = this.schemaVersionId;
    final status = this.status;
    final versionNumber = this.versionNumber;
    return {
      if (schemaVersionId != null) 'SchemaVersionId': schemaVersionId,
      if (status != null) 'Status': status.toValue(),
      if (versionNumber != null) 'VersionNumber': versionNumber,
    };
  }
}

/// A wrapper structure that may contain the registry name and Amazon Resource
/// Name (ARN).
class RegistryId {
  /// Arn of the registry to be updated. One of <code>RegistryArn</code> or
  /// <code>RegistryName</code> has to be provided.
  final String? registryArn;

  /// Name of the registry. Used only for lookup. One of <code>RegistryArn</code>
  /// or <code>RegistryName</code> has to be provided.
  final String? registryName;

  RegistryId({
    this.registryArn,
    this.registryName,
  });

  factory RegistryId.fromJson(Map<String, dynamic> json) {
    return RegistryId(
      registryArn: json['RegistryArn'] as String?,
      registryName: json['RegistryName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final registryArn = this.registryArn;
    final registryName = this.registryName;
    return {
      if (registryArn != null) 'RegistryArn': registryArn,
      if (registryName != null) 'RegistryName': registryName,
    };
  }
}

/// A structure containing the details for a registry.
class RegistryListItem {
  /// The data the registry was created.
  final String? createdTime;

  /// A description of the registry.
  final String? description;

  /// The Amazon Resource Name (ARN) of the registry.
  final String? registryArn;

  /// The name of the registry.
  final String? registryName;

  /// The status of the registry.
  final RegistryStatus? status;

  /// The date the registry was updated.
  final String? updatedTime;

  RegistryListItem({
    this.createdTime,
    this.description,
    this.registryArn,
    this.registryName,
    this.status,
    this.updatedTime,
  });

  factory RegistryListItem.fromJson(Map<String, dynamic> json) {
    return RegistryListItem(
      createdTime: json['CreatedTime'] as String?,
      description: json['Description'] as String?,
      registryArn: json['RegistryArn'] as String?,
      registryName: json['RegistryName'] as String?,
      status: (json['Status'] as String?)?.toRegistryStatus(),
      updatedTime: json['UpdatedTime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTime = this.createdTime;
    final description = this.description;
    final registryArn = this.registryArn;
    final registryName = this.registryName;
    final status = this.status;
    final updatedTime = this.updatedTime;
    return {
      if (createdTime != null) 'CreatedTime': createdTime,
      if (description != null) 'Description': description,
      if (registryArn != null) 'RegistryArn': registryArn,
      if (registryName != null) 'RegistryName': registryName,
      if (status != null) 'Status': status.toValue(),
      if (updatedTime != null) 'UpdatedTime': updatedTime,
    };
  }
}

enum RegistryStatus {
  available,
  deleting,
}

extension on RegistryStatus {
  String toValue() {
    switch (this) {
      case RegistryStatus.available:
        return 'AVAILABLE';
      case RegistryStatus.deleting:
        return 'DELETING';
    }
  }
}

extension on String {
  RegistryStatus toRegistryStatus() {
    switch (this) {
      case 'AVAILABLE':
        return RegistryStatus.available;
      case 'DELETING':
        return RegistryStatus.deleting;
    }
    throw Exception('$this is not known in enum RegistryStatus');
  }
}

class RemoveSchemaVersionMetadataResponse {
  /// The latest version of the schema.
  final bool? latestVersion;

  /// The metadata key.
  final String? metadataKey;

  /// The value of the metadata key.
  final String? metadataValue;

  /// The name of the registry.
  final String? registryName;

  /// The Amazon Resource Name (ARN) of the schema.
  final String? schemaArn;

  /// The name of the schema.
  final String? schemaName;

  /// The version ID for the schema version.
  final String? schemaVersionId;

  /// The version number of the schema.
  final int? versionNumber;

  RemoveSchemaVersionMetadataResponse({
    this.latestVersion,
    this.metadataKey,
    this.metadataValue,
    this.registryName,
    this.schemaArn,
    this.schemaName,
    this.schemaVersionId,
    this.versionNumber,
  });

  factory RemoveSchemaVersionMetadataResponse.fromJson(
      Map<String, dynamic> json) {
    return RemoveSchemaVersionMetadataResponse(
      latestVersion: json['LatestVersion'] as bool?,
      metadataKey: json['MetadataKey'] as String?,
      metadataValue: json['MetadataValue'] as String?,
      registryName: json['RegistryName'] as String?,
      schemaArn: json['SchemaArn'] as String?,
      schemaName: json['SchemaName'] as String?,
      schemaVersionId: json['SchemaVersionId'] as String?,
      versionNumber: json['VersionNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final latestVersion = this.latestVersion;
    final metadataKey = this.metadataKey;
    final metadataValue = this.metadataValue;
    final registryName = this.registryName;
    final schemaArn = this.schemaArn;
    final schemaName = this.schemaName;
    final schemaVersionId = this.schemaVersionId;
    final versionNumber = this.versionNumber;
    return {
      if (latestVersion != null) 'LatestVersion': latestVersion,
      if (metadataKey != null) 'MetadataKey': metadataKey,
      if (metadataValue != null) 'MetadataValue': metadataValue,
      if (registryName != null) 'RegistryName': registryName,
      if (schemaArn != null) 'SchemaArn': schemaArn,
      if (schemaName != null) 'SchemaName': schemaName,
      if (schemaVersionId != null) 'SchemaVersionId': schemaVersionId,
      if (versionNumber != null) 'VersionNumber': versionNumber,
    };
  }
}

class ResetJobBookmarkResponse {
  /// The reset bookmark entry.
  final JobBookmarkEntry? jobBookmarkEntry;

  ResetJobBookmarkResponse({
    this.jobBookmarkEntry,
  });

  factory ResetJobBookmarkResponse.fromJson(Map<String, dynamic> json) {
    return ResetJobBookmarkResponse(
      jobBookmarkEntry: json['JobBookmarkEntry'] != null
          ? JobBookmarkEntry.fromJson(
              json['JobBookmarkEntry'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final jobBookmarkEntry = this.jobBookmarkEntry;
    return {
      if (jobBookmarkEntry != null) 'JobBookmarkEntry': jobBookmarkEntry,
    };
  }
}

enum ResourceShareType {
  foreign,
  all,
}

extension on ResourceShareType {
  String toValue() {
    switch (this) {
      case ResourceShareType.foreign:
        return 'FOREIGN';
      case ResourceShareType.all:
        return 'ALL';
    }
  }
}

extension on String {
  ResourceShareType toResourceShareType() {
    switch (this) {
      case 'FOREIGN':
        return ResourceShareType.foreign;
      case 'ALL':
        return ResourceShareType.all;
    }
    throw Exception('$this is not known in enum ResourceShareType');
  }
}

enum ResourceType {
  jar,
  file,
  archive,
}

extension on ResourceType {
  String toValue() {
    switch (this) {
      case ResourceType.jar:
        return 'JAR';
      case ResourceType.file:
        return 'FILE';
      case ResourceType.archive:
        return 'ARCHIVE';
    }
  }
}

extension on String {
  ResourceType toResourceType() {
    switch (this) {
      case 'JAR':
        return ResourceType.jar;
      case 'FILE':
        return ResourceType.file;
      case 'ARCHIVE':
        return ResourceType.archive;
    }
    throw Exception('$this is not known in enum ResourceType');
  }
}

/// The URIs for function resources.
class ResourceUri {
  /// The type of the resource.
  final ResourceType? resourceType;

  /// The URI for accessing the resource.
  final String? uri;

  ResourceUri({
    this.resourceType,
    this.uri,
  });

  factory ResourceUri.fromJson(Map<String, dynamic> json) {
    return ResourceUri(
      resourceType: (json['ResourceType'] as String?)?.toResourceType(),
      uri: json['Uri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceType = this.resourceType;
    final uri = this.uri;
    return {
      if (resourceType != null) 'ResourceType': resourceType.toValue(),
      if (uri != null) 'Uri': uri,
    };
  }
}

class ResumeWorkflowRunResponse {
  /// A list of the node IDs for the nodes that were actually restarted.
  final List<String>? nodeIds;

  /// The new ID assigned to the resumed workflow run. Each resume of a workflow
  /// run will have a new run ID.
  final String? runId;

  ResumeWorkflowRunResponse({
    this.nodeIds,
    this.runId,
  });

  factory ResumeWorkflowRunResponse.fromJson(Map<String, dynamic> json) {
    return ResumeWorkflowRunResponse(
      nodeIds: (json['NodeIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      runId: json['RunId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final nodeIds = this.nodeIds;
    final runId = this.runId;
    return {
      if (nodeIds != null) 'NodeIds': nodeIds,
      if (runId != null) 'RunId': runId,
    };
  }
}

/// Specifies how Amazon Simple Storage Service (Amazon S3) data should be
/// encrypted.
class S3Encryption {
  /// The Amazon Resource Name (ARN) of the KMS key to be used to encrypt the
  /// data.
  final String? kmsKeyArn;

  /// The encryption mode to use for Amazon S3 data.
  final S3EncryptionMode? s3EncryptionMode;

  S3Encryption({
    this.kmsKeyArn,
    this.s3EncryptionMode,
  });

  factory S3Encryption.fromJson(Map<String, dynamic> json) {
    return S3Encryption(
      kmsKeyArn: json['KmsKeyArn'] as String?,
      s3EncryptionMode:
          (json['S3EncryptionMode'] as String?)?.toS3EncryptionMode(),
    );
  }

  Map<String, dynamic> toJson() {
    final kmsKeyArn = this.kmsKeyArn;
    final s3EncryptionMode = this.s3EncryptionMode;
    return {
      if (kmsKeyArn != null) 'KmsKeyArn': kmsKeyArn,
      if (s3EncryptionMode != null)
        'S3EncryptionMode': s3EncryptionMode.toValue(),
    };
  }
}

enum S3EncryptionMode {
  disabled,
  sseKms,
  sseS3,
}

extension on S3EncryptionMode {
  String toValue() {
    switch (this) {
      case S3EncryptionMode.disabled:
        return 'DISABLED';
      case S3EncryptionMode.sseKms:
        return 'SSE-KMS';
      case S3EncryptionMode.sseS3:
        return 'SSE-S3';
    }
  }
}

extension on String {
  S3EncryptionMode toS3EncryptionMode() {
    switch (this) {
      case 'DISABLED':
        return S3EncryptionMode.disabled;
      case 'SSE-KMS':
        return S3EncryptionMode.sseKms;
      case 'SSE-S3':
        return S3EncryptionMode.sseS3;
    }
    throw Exception('$this is not known in enum S3EncryptionMode');
  }
}

/// Specifies a data store in Amazon Simple Storage Service (Amazon S3).
class S3Target {
  /// The name of a connection which allows a job or crawler to access data in
  /// Amazon S3 within an Amazon Virtual Private Cloud environment (Amazon VPC).
  final String? connectionName;

  /// A list of glob patterns used to exclude from the crawl. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/add-crawler.html">Catalog
  /// Tables with a Crawler</a>.
  final List<String>? exclusions;

  /// The path to the Amazon S3 target.
  final String? path;

  /// Sets the number of files in each leaf folder to be crawled when crawling
  /// sample files in a dataset. If not set, all the files are crawled. A valid
  /// value is an integer between 1 and 249.
  final int? sampleSize;

  S3Target({
    this.connectionName,
    this.exclusions,
    this.path,
    this.sampleSize,
  });

  factory S3Target.fromJson(Map<String, dynamic> json) {
    return S3Target(
      connectionName: json['ConnectionName'] as String?,
      exclusions: (json['Exclusions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      path: json['Path'] as String?,
      sampleSize: json['SampleSize'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectionName = this.connectionName;
    final exclusions = this.exclusions;
    final path = this.path;
    final sampleSize = this.sampleSize;
    return {
      if (connectionName != null) 'ConnectionName': connectionName,
      if (exclusions != null) 'Exclusions': exclusions,
      if (path != null) 'Path': path,
      if (sampleSize != null) 'SampleSize': sampleSize,
    };
  }
}

/// A scheduling object using a <code>cron</code> statement to schedule an
/// event.
class Schedule {
  /// A <code>cron</code> expression used to specify the schedule (see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/monitor-data-warehouse-schedule.html">Time-Based
  /// Schedules for Jobs and Crawlers</a>. For example, to run something every day
  /// at 12:15 UTC, you would specify: <code>cron(15 12 * * ? *)</code>.
  final String? scheduleExpression;

  /// The state of the schedule.
  final ScheduleState? state;

  Schedule({
    this.scheduleExpression,
    this.state,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      scheduleExpression: json['ScheduleExpression'] as String?,
      state: (json['State'] as String?)?.toScheduleState(),
    );
  }

  Map<String, dynamic> toJson() {
    final scheduleExpression = this.scheduleExpression;
    final state = this.state;
    return {
      if (scheduleExpression != null) 'ScheduleExpression': scheduleExpression,
      if (state != null) 'State': state.toValue(),
    };
  }
}

enum ScheduleState {
  scheduled,
  notScheduled,
  transitioning,
}

extension on ScheduleState {
  String toValue() {
    switch (this) {
      case ScheduleState.scheduled:
        return 'SCHEDULED';
      case ScheduleState.notScheduled:
        return 'NOT_SCHEDULED';
      case ScheduleState.transitioning:
        return 'TRANSITIONING';
    }
  }
}

extension on String {
  ScheduleState toScheduleState() {
    switch (this) {
      case 'SCHEDULED':
        return ScheduleState.scheduled;
      case 'NOT_SCHEDULED':
        return ScheduleState.notScheduled;
      case 'TRANSITIONING':
        return ScheduleState.transitioning;
    }
    throw Exception('$this is not known in enum ScheduleState');
  }
}

/// A policy that specifies update and deletion behaviors for the crawler.
class SchemaChangePolicy {
  /// The deletion behavior when the crawler finds a deleted object.
  final DeleteBehavior? deleteBehavior;

  /// The update behavior when the crawler finds a changed schema.
  final UpdateBehavior? updateBehavior;

  SchemaChangePolicy({
    this.deleteBehavior,
    this.updateBehavior,
  });

  factory SchemaChangePolicy.fromJson(Map<String, dynamic> json) {
    return SchemaChangePolicy(
      deleteBehavior: (json['DeleteBehavior'] as String?)?.toDeleteBehavior(),
      updateBehavior: (json['UpdateBehavior'] as String?)?.toUpdateBehavior(),
    );
  }

  Map<String, dynamic> toJson() {
    final deleteBehavior = this.deleteBehavior;
    final updateBehavior = this.updateBehavior;
    return {
      if (deleteBehavior != null) 'DeleteBehavior': deleteBehavior.toValue(),
      if (updateBehavior != null) 'UpdateBehavior': updateBehavior.toValue(),
    };
  }
}

/// A key-value pair representing a column and data type that this transform can
/// run against. The <code>Schema</code> parameter of the
/// <code>MLTransform</code> may contain up to 100 of these structures.
class SchemaColumn {
  /// The type of data in the column.
  final String? dataType;

  /// The name of the column.
  final String? name;

  SchemaColumn({
    this.dataType,
    this.name,
  });

  factory SchemaColumn.fromJson(Map<String, dynamic> json) {
    return SchemaColumn(
      dataType: json['DataType'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataType = this.dataType;
    final name = this.name;
    return {
      if (dataType != null) 'DataType': dataType,
      if (name != null) 'Name': name,
    };
  }
}

enum SchemaDiffType {
  syntaxDiff,
}

extension on SchemaDiffType {
  String toValue() {
    switch (this) {
      case SchemaDiffType.syntaxDiff:
        return 'SYNTAX_DIFF';
    }
  }
}

extension on String {
  SchemaDiffType toSchemaDiffType() {
    switch (this) {
      case 'SYNTAX_DIFF':
        return SchemaDiffType.syntaxDiff;
    }
    throw Exception('$this is not known in enum SchemaDiffType');
  }
}

/// The unique ID of the schema in the Glue schema registry.
class SchemaId {
  /// The name of the schema registry that contains the schema.
  final String? registryName;

  /// The Amazon Resource Name (ARN) of the schema. One of <code>SchemaArn</code>
  /// or <code>SchemaName</code> has to be provided.
  final String? schemaArn;

  /// The name of the schema. One of <code>SchemaArn</code> or
  /// <code>SchemaName</code> has to be provided.
  final String? schemaName;

  SchemaId({
    this.registryName,
    this.schemaArn,
    this.schemaName,
  });

  factory SchemaId.fromJson(Map<String, dynamic> json) {
    return SchemaId(
      registryName: json['RegistryName'] as String?,
      schemaArn: json['SchemaArn'] as String?,
      schemaName: json['SchemaName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final registryName = this.registryName;
    final schemaArn = this.schemaArn;
    final schemaName = this.schemaName;
    return {
      if (registryName != null) 'RegistryName': registryName,
      if (schemaArn != null) 'SchemaArn': schemaArn,
      if (schemaName != null) 'SchemaName': schemaName,
    };
  }
}

/// An object that contains minimal details for a schema.
class SchemaListItem {
  /// The date and time that a schema was created.
  final String? createdTime;

  /// A description for the schema.
  final String? description;

  /// the name of the registry where the schema resides.
  final String? registryName;

  /// The Amazon Resource Name (ARN) for the schema.
  final String? schemaArn;

  /// The name of the schema.
  final String? schemaName;

  /// The status of the schema.
  final SchemaStatus? schemaStatus;

  /// The date and time that a schema was updated.
  final String? updatedTime;

  SchemaListItem({
    this.createdTime,
    this.description,
    this.registryName,
    this.schemaArn,
    this.schemaName,
    this.schemaStatus,
    this.updatedTime,
  });

  factory SchemaListItem.fromJson(Map<String, dynamic> json) {
    return SchemaListItem(
      createdTime: json['CreatedTime'] as String?,
      description: json['Description'] as String?,
      registryName: json['RegistryName'] as String?,
      schemaArn: json['SchemaArn'] as String?,
      schemaName: json['SchemaName'] as String?,
      schemaStatus: (json['SchemaStatus'] as String?)?.toSchemaStatus(),
      updatedTime: json['UpdatedTime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTime = this.createdTime;
    final description = this.description;
    final registryName = this.registryName;
    final schemaArn = this.schemaArn;
    final schemaName = this.schemaName;
    final schemaStatus = this.schemaStatus;
    final updatedTime = this.updatedTime;
    return {
      if (createdTime != null) 'CreatedTime': createdTime,
      if (description != null) 'Description': description,
      if (registryName != null) 'RegistryName': registryName,
      if (schemaArn != null) 'SchemaArn': schemaArn,
      if (schemaName != null) 'SchemaName': schemaName,
      if (schemaStatus != null) 'SchemaStatus': schemaStatus.toValue(),
      if (updatedTime != null) 'UpdatedTime': updatedTime,
    };
  }
}

/// An object that references a schema stored in the Glue Schema Registry.
class SchemaReference {
  /// A structure that contains schema identity fields. Either this or the
  /// <code>SchemaVersionId</code> has to be provided.
  final SchemaId? schemaId;

  /// The unique ID assigned to a version of the schema. Either this or the
  /// <code>SchemaId</code> has to be provided.
  final String? schemaVersionId;

  /// The version number of the schema.
  final int? schemaVersionNumber;

  SchemaReference({
    this.schemaId,
    this.schemaVersionId,
    this.schemaVersionNumber,
  });

  factory SchemaReference.fromJson(Map<String, dynamic> json) {
    return SchemaReference(
      schemaId: json['SchemaId'] != null
          ? SchemaId.fromJson(json['SchemaId'] as Map<String, dynamic>)
          : null,
      schemaVersionId: json['SchemaVersionId'] as String?,
      schemaVersionNumber: json['SchemaVersionNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final schemaId = this.schemaId;
    final schemaVersionId = this.schemaVersionId;
    final schemaVersionNumber = this.schemaVersionNumber;
    return {
      if (schemaId != null) 'SchemaId': schemaId,
      if (schemaVersionId != null) 'SchemaVersionId': schemaVersionId,
      if (schemaVersionNumber != null)
        'SchemaVersionNumber': schemaVersionNumber,
    };
  }
}

enum SchemaStatus {
  available,
  pending,
  deleting,
}

extension on SchemaStatus {
  String toValue() {
    switch (this) {
      case SchemaStatus.available:
        return 'AVAILABLE';
      case SchemaStatus.pending:
        return 'PENDING';
      case SchemaStatus.deleting:
        return 'DELETING';
    }
  }
}

extension on String {
  SchemaStatus toSchemaStatus() {
    switch (this) {
      case 'AVAILABLE':
        return SchemaStatus.available;
      case 'PENDING':
        return SchemaStatus.pending;
      case 'DELETING':
        return SchemaStatus.deleting;
    }
    throw Exception('$this is not known in enum SchemaStatus');
  }
}

/// An object that contains the error details for an operation on a schema
/// version.
class SchemaVersionErrorItem {
  /// The details of the error for the schema version.
  final ErrorDetails? errorDetails;

  /// The version number of the schema.
  final int? versionNumber;

  SchemaVersionErrorItem({
    this.errorDetails,
    this.versionNumber,
  });

  factory SchemaVersionErrorItem.fromJson(Map<String, dynamic> json) {
    return SchemaVersionErrorItem(
      errorDetails: json['ErrorDetails'] != null
          ? ErrorDetails.fromJson(json['ErrorDetails'] as Map<String, dynamic>)
          : null,
      versionNumber: json['VersionNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorDetails = this.errorDetails;
    final versionNumber = this.versionNumber;
    return {
      if (errorDetails != null) 'ErrorDetails': errorDetails,
      if (versionNumber != null) 'VersionNumber': versionNumber,
    };
  }
}

/// An object containing the details about a schema version.
class SchemaVersionListItem {
  /// The date and time the schema version was created.
  final String? createdTime;

  /// The Amazon Resource Name (ARN) of the schema.
  final String? schemaArn;

  /// The unique identifier of the schema version.
  final String? schemaVersionId;

  /// The status of the schema version.
  final SchemaVersionStatus? status;

  /// The version number of the schema.
  final int? versionNumber;

  SchemaVersionListItem({
    this.createdTime,
    this.schemaArn,
    this.schemaVersionId,
    this.status,
    this.versionNumber,
  });

  factory SchemaVersionListItem.fromJson(Map<String, dynamic> json) {
    return SchemaVersionListItem(
      createdTime: json['CreatedTime'] as String?,
      schemaArn: json['SchemaArn'] as String?,
      schemaVersionId: json['SchemaVersionId'] as String?,
      status: (json['Status'] as String?)?.toSchemaVersionStatus(),
      versionNumber: json['VersionNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTime = this.createdTime;
    final schemaArn = this.schemaArn;
    final schemaVersionId = this.schemaVersionId;
    final status = this.status;
    final versionNumber = this.versionNumber;
    return {
      if (createdTime != null) 'CreatedTime': createdTime,
      if (schemaArn != null) 'SchemaArn': schemaArn,
      if (schemaVersionId != null) 'SchemaVersionId': schemaVersionId,
      if (status != null) 'Status': status.toValue(),
      if (versionNumber != null) 'VersionNumber': versionNumber,
    };
  }
}

/// A structure containing the schema version information.
class SchemaVersionNumber {
  /// The latest version available for the schema.
  final bool? latestVersion;

  /// The version number of the schema.
  final int? versionNumber;

  SchemaVersionNumber({
    this.latestVersion,
    this.versionNumber,
  });

  factory SchemaVersionNumber.fromJson(Map<String, dynamic> json) {
    return SchemaVersionNumber(
      latestVersion: json['LatestVersion'] as bool?,
      versionNumber: json['VersionNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final latestVersion = this.latestVersion;
    final versionNumber = this.versionNumber;
    return {
      if (latestVersion != null) 'LatestVersion': latestVersion,
      if (versionNumber != null) 'VersionNumber': versionNumber,
    };
  }
}

enum SchemaVersionStatus {
  available,
  pending,
  failure,
  deleting,
}

extension on SchemaVersionStatus {
  String toValue() {
    switch (this) {
      case SchemaVersionStatus.available:
        return 'AVAILABLE';
      case SchemaVersionStatus.pending:
        return 'PENDING';
      case SchemaVersionStatus.failure:
        return 'FAILURE';
      case SchemaVersionStatus.deleting:
        return 'DELETING';
    }
  }
}

extension on String {
  SchemaVersionStatus toSchemaVersionStatus() {
    switch (this) {
      case 'AVAILABLE':
        return SchemaVersionStatus.available;
      case 'PENDING':
        return SchemaVersionStatus.pending;
      case 'FAILURE':
        return SchemaVersionStatus.failure;
      case 'DELETING':
        return SchemaVersionStatus.deleting;
    }
    throw Exception('$this is not known in enum SchemaVersionStatus');
  }
}

class SearchTablesResponse {
  /// A continuation token, present if the current list segment is not the last.
  final String? nextToken;

  /// A list of the requested <code>Table</code> objects. The
  /// <code>SearchTables</code> response returns only the tables that you have
  /// access to.
  final List<Table>? tableList;

  SearchTablesResponse({
    this.nextToken,
    this.tableList,
  });

  factory SearchTablesResponse.fromJson(Map<String, dynamic> json) {
    return SearchTablesResponse(
      nextToken: json['NextToken'] as String?,
      tableList: (json['TableList'] as List?)
          ?.whereNotNull()
          .map((e) => Table.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final tableList = this.tableList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (tableList != null) 'TableList': tableList,
    };
  }
}

/// Specifies a security configuration.
class SecurityConfiguration {
  /// The time at which this security configuration was created.
  final DateTime? createdTimeStamp;

  /// The encryption configuration associated with this security configuration.
  final EncryptionConfiguration? encryptionConfiguration;

  /// The name of the security configuration.
  final String? name;

  SecurityConfiguration({
    this.createdTimeStamp,
    this.encryptionConfiguration,
    this.name,
  });

  factory SecurityConfiguration.fromJson(Map<String, dynamic> json) {
    return SecurityConfiguration(
      createdTimeStamp: timeStampFromJson(json['CreatedTimeStamp']),
      encryptionConfiguration: json['EncryptionConfiguration'] != null
          ? EncryptionConfiguration.fromJson(
              json['EncryptionConfiguration'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimeStamp = this.createdTimeStamp;
    final encryptionConfiguration = this.encryptionConfiguration;
    final name = this.name;
    return {
      if (createdTimeStamp != null)
        'CreatedTimeStamp': unixTimestampToJson(createdTimeStamp),
      if (encryptionConfiguration != null)
        'EncryptionConfiguration': encryptionConfiguration,
      if (name != null) 'Name': name,
    };
  }
}

/// Defines a non-overlapping region of a table's partitions, allowing multiple
/// requests to be run in parallel.
class Segment {
  /// The zero-based index number of the segment. For example, if the total number
  /// of segments is 4, <code>SegmentNumber</code> values range from 0 through 3.
  final int segmentNumber;

  /// The total number of segments.
  final int totalSegments;

  Segment({
    required this.segmentNumber,
    required this.totalSegments,
  });

  factory Segment.fromJson(Map<String, dynamic> json) {
    return Segment(
      segmentNumber: json['SegmentNumber'] as int,
      totalSegments: json['TotalSegments'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final segmentNumber = this.segmentNumber;
    final totalSegments = this.totalSegments;
    return {
      'SegmentNumber': segmentNumber,
      'TotalSegments': totalSegments,
    };
  }
}

/// Information about a serialization/deserialization program (SerDe) that
/// serves as an extractor and loader.
class SerDeInfo {
  /// Name of the SerDe.
  final String? name;

  /// These key-value pairs define initialization parameters for the SerDe.
  final Map<String, String>? parameters;

  /// Usually the class that implements the SerDe. An example is
  /// <code>org.apache.hadoop.hive.serde2.columnar.ColumnarSerDe</code>.
  final String? serializationLibrary;

  SerDeInfo({
    this.name,
    this.parameters,
    this.serializationLibrary,
  });

  factory SerDeInfo.fromJson(Map<String, dynamic> json) {
    return SerDeInfo(
      name: json['Name'] as String?,
      parameters: (json['Parameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      serializationLibrary: json['SerializationLibrary'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final parameters = this.parameters;
    final serializationLibrary = this.serializationLibrary;
    return {
      if (name != null) 'Name': name,
      if (parameters != null) 'Parameters': parameters,
      if (serializationLibrary != null)
        'SerializationLibrary': serializationLibrary,
    };
  }
}

/// Specifies skewed values in a table. Skewed values are those that occur with
/// very high frequency.
class SkewedInfo {
  /// A list of names of columns that contain skewed values.
  final List<String>? skewedColumnNames;

  /// A mapping of skewed values to the columns that contain them.
  final Map<String, String>? skewedColumnValueLocationMaps;

  /// A list of values that appear so frequently as to be considered skewed.
  final List<String>? skewedColumnValues;

  SkewedInfo({
    this.skewedColumnNames,
    this.skewedColumnValueLocationMaps,
    this.skewedColumnValues,
  });

  factory SkewedInfo.fromJson(Map<String, dynamic> json) {
    return SkewedInfo(
      skewedColumnNames: (json['SkewedColumnNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      skewedColumnValueLocationMaps:
          (json['SkewedColumnValueLocationMaps'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      skewedColumnValues: (json['SkewedColumnValues'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final skewedColumnNames = this.skewedColumnNames;
    final skewedColumnValueLocationMaps = this.skewedColumnValueLocationMaps;
    final skewedColumnValues = this.skewedColumnValues;
    return {
      if (skewedColumnNames != null) 'SkewedColumnNames': skewedColumnNames,
      if (skewedColumnValueLocationMaps != null)
        'SkewedColumnValueLocationMaps': skewedColumnValueLocationMaps,
      if (skewedColumnValues != null) 'SkewedColumnValues': skewedColumnValues,
    };
  }
}

enum Sort {
  asc,
  desc,
}

extension on Sort {
  String toValue() {
    switch (this) {
      case Sort.asc:
        return 'ASC';
      case Sort.desc:
        return 'DESC';
    }
  }
}

extension on String {
  Sort toSort() {
    switch (this) {
      case 'ASC':
        return Sort.asc;
      case 'DESC':
        return Sort.desc;
    }
    throw Exception('$this is not known in enum Sort');
  }
}

/// Specifies a field to sort by and a sort order.
class SortCriterion {
  /// The name of the field on which to sort.
  final String? fieldName;

  /// An ascending or descending sort.
  final Sort? sort;

  SortCriterion({
    this.fieldName,
    this.sort,
  });

  factory SortCriterion.fromJson(Map<String, dynamic> json) {
    return SortCriterion(
      fieldName: json['FieldName'] as String?,
      sort: (json['Sort'] as String?)?.toSort(),
    );
  }

  Map<String, dynamic> toJson() {
    final fieldName = this.fieldName;
    final sort = this.sort;
    return {
      if (fieldName != null) 'FieldName': fieldName,
      if (sort != null) 'Sort': sort.toValue(),
    };
  }
}

enum SortDirectionType {
  descending,
  ascending,
}

extension on SortDirectionType {
  String toValue() {
    switch (this) {
      case SortDirectionType.descending:
        return 'DESCENDING';
      case SortDirectionType.ascending:
        return 'ASCENDING';
    }
  }
}

extension on String {
  SortDirectionType toSortDirectionType() {
    switch (this) {
      case 'DESCENDING':
        return SortDirectionType.descending;
      case 'ASCENDING':
        return SortDirectionType.ascending;
    }
    throw Exception('$this is not known in enum SortDirectionType');
  }
}

class StartCrawlerResponse {
  StartCrawlerResponse();

  factory StartCrawlerResponse.fromJson(Map<String, dynamic> _) {
    return StartCrawlerResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class StartCrawlerScheduleResponse {
  StartCrawlerScheduleResponse();

  factory StartCrawlerScheduleResponse.fromJson(Map<String, dynamic> _) {
    return StartCrawlerScheduleResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class StartExportLabelsTaskRunResponse {
  /// The unique identifier for the task run.
  final String? taskRunId;

  StartExportLabelsTaskRunResponse({
    this.taskRunId,
  });

  factory StartExportLabelsTaskRunResponse.fromJson(Map<String, dynamic> json) {
    return StartExportLabelsTaskRunResponse(
      taskRunId: json['TaskRunId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final taskRunId = this.taskRunId;
    return {
      if (taskRunId != null) 'TaskRunId': taskRunId,
    };
  }
}

class StartImportLabelsTaskRunResponse {
  /// The unique identifier for the task run.
  final String? taskRunId;

  StartImportLabelsTaskRunResponse({
    this.taskRunId,
  });

  factory StartImportLabelsTaskRunResponse.fromJson(Map<String, dynamic> json) {
    return StartImportLabelsTaskRunResponse(
      taskRunId: json['TaskRunId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final taskRunId = this.taskRunId;
    return {
      if (taskRunId != null) 'TaskRunId': taskRunId,
    };
  }
}

class StartJobRunResponse {
  /// The ID assigned to this job run.
  final String? jobRunId;

  StartJobRunResponse({
    this.jobRunId,
  });

  factory StartJobRunResponse.fromJson(Map<String, dynamic> json) {
    return StartJobRunResponse(
      jobRunId: json['JobRunId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobRunId = this.jobRunId;
    return {
      if (jobRunId != null) 'JobRunId': jobRunId,
    };
  }
}

class StartMLEvaluationTaskRunResponse {
  /// The unique identifier associated with this run.
  final String? taskRunId;

  StartMLEvaluationTaskRunResponse({
    this.taskRunId,
  });

  factory StartMLEvaluationTaskRunResponse.fromJson(Map<String, dynamic> json) {
    return StartMLEvaluationTaskRunResponse(
      taskRunId: json['TaskRunId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final taskRunId = this.taskRunId;
    return {
      if (taskRunId != null) 'TaskRunId': taskRunId,
    };
  }
}

class StartMLLabelingSetGenerationTaskRunResponse {
  /// The unique run identifier that is associated with this task run.
  final String? taskRunId;

  StartMLLabelingSetGenerationTaskRunResponse({
    this.taskRunId,
  });

  factory StartMLLabelingSetGenerationTaskRunResponse.fromJson(
      Map<String, dynamic> json) {
    return StartMLLabelingSetGenerationTaskRunResponse(
      taskRunId: json['TaskRunId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final taskRunId = this.taskRunId;
    return {
      if (taskRunId != null) 'TaskRunId': taskRunId,
    };
  }
}

class StartTriggerResponse {
  /// The name of the trigger that was started.
  final String? name;

  StartTriggerResponse({
    this.name,
  });

  factory StartTriggerResponse.fromJson(Map<String, dynamic> json) {
    return StartTriggerResponse(
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      if (name != null) 'Name': name,
    };
  }
}

class StartWorkflowRunResponse {
  /// An Id for the new run.
  final String? runId;

  StartWorkflowRunResponse({
    this.runId,
  });

  factory StartWorkflowRunResponse.fromJson(Map<String, dynamic> json) {
    return StartWorkflowRunResponse(
      runId: json['RunId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final runId = this.runId;
    return {
      if (runId != null) 'RunId': runId,
    };
  }
}

class StopCrawlerResponse {
  StopCrawlerResponse();

  factory StopCrawlerResponse.fromJson(Map<String, dynamic> _) {
    return StopCrawlerResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class StopCrawlerScheduleResponse {
  StopCrawlerScheduleResponse();

  factory StopCrawlerScheduleResponse.fromJson(Map<String, dynamic> _) {
    return StopCrawlerScheduleResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class StopTriggerResponse {
  /// The name of the trigger that was stopped.
  final String? name;

  StopTriggerResponse({
    this.name,
  });

  factory StopTriggerResponse.fromJson(Map<String, dynamic> json) {
    return StopTriggerResponse(
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      if (name != null) 'Name': name,
    };
  }
}

class StopWorkflowRunResponse {
  StopWorkflowRunResponse();

  factory StopWorkflowRunResponse.fromJson(Map<String, dynamic> _) {
    return StopWorkflowRunResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Describes the physical storage of table data.
class StorageDescriptor {
  /// A list of reducer grouping columns, clustering columns, and bucketing
  /// columns in the table.
  final List<String>? bucketColumns;

  /// A list of the <code>Columns</code> in the table.
  final List<Column>? columns;

  /// <code>True</code> if the data in the table is compressed, or
  /// <code>False</code> if not.
  final bool? compressed;

  /// The input format: <code>SequenceFileInputFormat</code> (binary), or
  /// <code>TextInputFormat</code>, or a custom format.
  final String? inputFormat;

  /// The physical location of the table. By default, this takes the form of the
  /// warehouse location, followed by the database location in the warehouse,
  /// followed by the table name.
  final String? location;

  /// Must be specified if the table contains any dimension columns.
  final int? numberOfBuckets;

  /// The output format: <code>SequenceFileOutputFormat</code> (binary), or
  /// <code>IgnoreKeyTextOutputFormat</code>, or a custom format.
  final String? outputFormat;

  /// The user-supplied properties in key-value form.
  final Map<String, String>? parameters;

  /// An object that references a schema stored in the Glue Schema Registry.
  ///
  /// When creating a table, you can pass an empty list of columns for the schema,
  /// and instead use a schema reference.
  final SchemaReference? schemaReference;

  /// The serialization/deserialization (SerDe) information.
  final SerDeInfo? serdeInfo;

  /// The information about values that appear frequently in a column (skewed
  /// values).
  final SkewedInfo? skewedInfo;

  /// A list specifying the sort order of each bucket in the table.
  final List<Order>? sortColumns;

  /// <code>True</code> if the table data is stored in subdirectories, or
  /// <code>False</code> if not.
  final bool? storedAsSubDirectories;

  StorageDescriptor({
    this.bucketColumns,
    this.columns,
    this.compressed,
    this.inputFormat,
    this.location,
    this.numberOfBuckets,
    this.outputFormat,
    this.parameters,
    this.schemaReference,
    this.serdeInfo,
    this.skewedInfo,
    this.sortColumns,
    this.storedAsSubDirectories,
  });

  factory StorageDescriptor.fromJson(Map<String, dynamic> json) {
    return StorageDescriptor(
      bucketColumns: (json['BucketColumns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      columns: (json['Columns'] as List?)
          ?.whereNotNull()
          .map((e) => Column.fromJson(e as Map<String, dynamic>))
          .toList(),
      compressed: json['Compressed'] as bool?,
      inputFormat: json['InputFormat'] as String?,
      location: json['Location'] as String?,
      numberOfBuckets: json['NumberOfBuckets'] as int?,
      outputFormat: json['OutputFormat'] as String?,
      parameters: (json['Parameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      schemaReference: json['SchemaReference'] != null
          ? SchemaReference.fromJson(
              json['SchemaReference'] as Map<String, dynamic>)
          : null,
      serdeInfo: json['SerdeInfo'] != null
          ? SerDeInfo.fromJson(json['SerdeInfo'] as Map<String, dynamic>)
          : null,
      skewedInfo: json['SkewedInfo'] != null
          ? SkewedInfo.fromJson(json['SkewedInfo'] as Map<String, dynamic>)
          : null,
      sortColumns: (json['SortColumns'] as List?)
          ?.whereNotNull()
          .map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList(),
      storedAsSubDirectories: json['StoredAsSubDirectories'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketColumns = this.bucketColumns;
    final columns = this.columns;
    final compressed = this.compressed;
    final inputFormat = this.inputFormat;
    final location = this.location;
    final numberOfBuckets = this.numberOfBuckets;
    final outputFormat = this.outputFormat;
    final parameters = this.parameters;
    final schemaReference = this.schemaReference;
    final serdeInfo = this.serdeInfo;
    final skewedInfo = this.skewedInfo;
    final sortColumns = this.sortColumns;
    final storedAsSubDirectories = this.storedAsSubDirectories;
    return {
      if (bucketColumns != null) 'BucketColumns': bucketColumns,
      if (columns != null) 'Columns': columns,
      if (compressed != null) 'Compressed': compressed,
      if (inputFormat != null) 'InputFormat': inputFormat,
      if (location != null) 'Location': location,
      if (numberOfBuckets != null) 'NumberOfBuckets': numberOfBuckets,
      if (outputFormat != null) 'OutputFormat': outputFormat,
      if (parameters != null) 'Parameters': parameters,
      if (schemaReference != null) 'SchemaReference': schemaReference,
      if (serdeInfo != null) 'SerdeInfo': serdeInfo,
      if (skewedInfo != null) 'SkewedInfo': skewedInfo,
      if (sortColumns != null) 'SortColumns': sortColumns,
      if (storedAsSubDirectories != null)
        'StoredAsSubDirectories': storedAsSubDirectories,
    };
  }
}

/// Defines column statistics supported for character sequence data values.
class StringColumnStatisticsData {
  /// The average string length in the column.
  final double averageLength;

  /// The size of the longest string in the column.
  final int maximumLength;

  /// The number of distinct values in a column.
  final int numberOfDistinctValues;

  /// The number of null values in the column.
  final int numberOfNulls;

  StringColumnStatisticsData({
    required this.averageLength,
    required this.maximumLength,
    required this.numberOfDistinctValues,
    required this.numberOfNulls,
  });

  factory StringColumnStatisticsData.fromJson(Map<String, dynamic> json) {
    return StringColumnStatisticsData(
      averageLength: json['AverageLength'] as double,
      maximumLength: json['MaximumLength'] as int,
      numberOfDistinctValues: json['NumberOfDistinctValues'] as int,
      numberOfNulls: json['NumberOfNulls'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final averageLength = this.averageLength;
    final maximumLength = this.maximumLength;
    final numberOfDistinctValues = this.numberOfDistinctValues;
    final numberOfNulls = this.numberOfNulls;
    return {
      'AverageLength': averageLength,
      'MaximumLength': maximumLength,
      'NumberOfDistinctValues': numberOfDistinctValues,
      'NumberOfNulls': numberOfNulls,
    };
  }
}

/// Represents a collection of related data organized in columns and rows.
class Table {
  /// The table name. For Hive compatibility, this must be entirely lowercase.
  final String name;

  /// The ID of the Data Catalog in which the table resides.
  final String? catalogId;

  /// The time when the table definition was created in the Data Catalog.
  final DateTime? createTime;

  /// The person or entity who created the table.
  final String? createdBy;

  /// The name of the database where the table metadata resides. For Hive
  /// compatibility, this must be all lowercase.
  final String? databaseName;

  /// A description of the table.
  final String? description;

  /// Indicates whether the table has been registered with Lake Formation.
  final bool? isRegisteredWithLakeFormation;

  /// The last time that the table was accessed. This is usually taken from HDFS,
  /// and might not be reliable.
  final DateTime? lastAccessTime;

  /// The last time that column statistics were computed for this table.
  final DateTime? lastAnalyzedTime;

  /// The owner of the table.
  final String? owner;

  /// These key-value pairs define properties associated with the table.
  final Map<String, String>? parameters;

  /// A list of columns by which the table is partitioned. Only primitive types
  /// are supported as partition keys.
  ///
  /// When you create a table used by Amazon Athena, and you do not specify any
  /// <code>partitionKeys</code>, you must at least set the value of
  /// <code>partitionKeys</code> to an empty list. For example:
  ///
  /// <code>"PartitionKeys": []</code>
  final List<Column>? partitionKeys;

  /// The retention time for this table.
  final int? retention;

  /// A storage descriptor containing information about the physical storage of
  /// this table.
  final StorageDescriptor? storageDescriptor;

  /// The type of this table (<code>EXTERNAL_TABLE</code>,
  /// <code>VIRTUAL_VIEW</code>, etc.).
  final String? tableType;

  /// A <code>TableIdentifier</code> structure that describes a target table for
  /// resource linking.
  final TableIdentifier? targetTable;

  /// The last time that the table was updated.
  final DateTime? updateTime;

  /// If the table is a view, the expanded text of the view; otherwise
  /// <code>null</code>.
  final String? viewExpandedText;

  /// If the table is a view, the original text of the view; otherwise
  /// <code>null</code>.
  final String? viewOriginalText;

  Table({
    required this.name,
    this.catalogId,
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
    this.targetTable,
    this.updateTime,
    this.viewExpandedText,
    this.viewOriginalText,
  });

  factory Table.fromJson(Map<String, dynamic> json) {
    return Table(
      name: json['Name'] as String,
      catalogId: json['CatalogId'] as String?,
      createTime: timeStampFromJson(json['CreateTime']),
      createdBy: json['CreatedBy'] as String?,
      databaseName: json['DatabaseName'] as String?,
      description: json['Description'] as String?,
      isRegisteredWithLakeFormation:
          json['IsRegisteredWithLakeFormation'] as bool?,
      lastAccessTime: timeStampFromJson(json['LastAccessTime']),
      lastAnalyzedTime: timeStampFromJson(json['LastAnalyzedTime']),
      owner: json['Owner'] as String?,
      parameters: (json['Parameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      partitionKeys: (json['PartitionKeys'] as List?)
          ?.whereNotNull()
          .map((e) => Column.fromJson(e as Map<String, dynamic>))
          .toList(),
      retention: json['Retention'] as int?,
      storageDescriptor: json['StorageDescriptor'] != null
          ? StorageDescriptor.fromJson(
              json['StorageDescriptor'] as Map<String, dynamic>)
          : null,
      tableType: json['TableType'] as String?,
      targetTable: json['TargetTable'] != null
          ? TableIdentifier.fromJson(
              json['TargetTable'] as Map<String, dynamic>)
          : null,
      updateTime: timeStampFromJson(json['UpdateTime']),
      viewExpandedText: json['ViewExpandedText'] as String?,
      viewOriginalText: json['ViewOriginalText'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final catalogId = this.catalogId;
    final createTime = this.createTime;
    final createdBy = this.createdBy;
    final databaseName = this.databaseName;
    final description = this.description;
    final isRegisteredWithLakeFormation = this.isRegisteredWithLakeFormation;
    final lastAccessTime = this.lastAccessTime;
    final lastAnalyzedTime = this.lastAnalyzedTime;
    final owner = this.owner;
    final parameters = this.parameters;
    final partitionKeys = this.partitionKeys;
    final retention = this.retention;
    final storageDescriptor = this.storageDescriptor;
    final tableType = this.tableType;
    final targetTable = this.targetTable;
    final updateTime = this.updateTime;
    final viewExpandedText = this.viewExpandedText;
    final viewOriginalText = this.viewOriginalText;
    return {
      'Name': name,
      if (catalogId != null) 'CatalogId': catalogId,
      if (createTime != null) 'CreateTime': unixTimestampToJson(createTime),
      if (createdBy != null) 'CreatedBy': createdBy,
      if (databaseName != null) 'DatabaseName': databaseName,
      if (description != null) 'Description': description,
      if (isRegisteredWithLakeFormation != null)
        'IsRegisteredWithLakeFormation': isRegisteredWithLakeFormation,
      if (lastAccessTime != null)
        'LastAccessTime': unixTimestampToJson(lastAccessTime),
      if (lastAnalyzedTime != null)
        'LastAnalyzedTime': unixTimestampToJson(lastAnalyzedTime),
      if (owner != null) 'Owner': owner,
      if (parameters != null) 'Parameters': parameters,
      if (partitionKeys != null) 'PartitionKeys': partitionKeys,
      if (retention != null) 'Retention': retention,
      if (storageDescriptor != null) 'StorageDescriptor': storageDescriptor,
      if (tableType != null) 'TableType': tableType,
      if (targetTable != null) 'TargetTable': targetTable,
      if (updateTime != null) 'UpdateTime': unixTimestampToJson(updateTime),
      if (viewExpandedText != null) 'ViewExpandedText': viewExpandedText,
      if (viewOriginalText != null) 'ViewOriginalText': viewOriginalText,
    };
  }
}

/// An error record for table operations.
class TableError {
  /// The details about the error.
  final ErrorDetail? errorDetail;

  /// The name of the table. For Hive compatibility, this must be entirely
  /// lowercase.
  final String? tableName;

  TableError({
    this.errorDetail,
    this.tableName,
  });

  factory TableError.fromJson(Map<String, dynamic> json) {
    return TableError(
      errorDetail: json['ErrorDetail'] != null
          ? ErrorDetail.fromJson(json['ErrorDetail'] as Map<String, dynamic>)
          : null,
      tableName: json['TableName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorDetail = this.errorDetail;
    final tableName = this.tableName;
    return {
      if (errorDetail != null) 'ErrorDetail': errorDetail,
      if (tableName != null) 'TableName': tableName,
    };
  }
}

/// A structure that describes a target table for resource linking.
class TableIdentifier {
  /// The ID of the Data Catalog in which the table resides.
  final String? catalogId;

  /// The name of the catalog database that contains the target table.
  final String? databaseName;

  /// The name of the target table.
  final String? name;

  TableIdentifier({
    this.catalogId,
    this.databaseName,
    this.name,
  });

  factory TableIdentifier.fromJson(Map<String, dynamic> json) {
    return TableIdentifier(
      catalogId: json['CatalogId'] as String?,
      databaseName: json['DatabaseName'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final catalogId = this.catalogId;
    final databaseName = this.databaseName;
    final name = this.name;
    return {
      if (catalogId != null) 'CatalogId': catalogId,
      if (databaseName != null) 'DatabaseName': databaseName,
      if (name != null) 'Name': name,
    };
  }
}

/// A structure used to define a table.
class TableInput {
  /// The table name. For Hive compatibility, this is folded to lowercase when it
  /// is stored.
  final String name;

  /// A description of the table.
  final String? description;

  /// The last time that the table was accessed.
  final DateTime? lastAccessTime;

  /// The last time that column statistics were computed for this table.
  final DateTime? lastAnalyzedTime;

  /// The table owner.
  final String? owner;

  /// These key-value pairs define properties associated with the table.
  final Map<String, String>? parameters;

  /// A list of columns by which the table is partitioned. Only primitive types
  /// are supported as partition keys.
  ///
  /// When you create a table used by Amazon Athena, and you do not specify any
  /// <code>partitionKeys</code>, you must at least set the value of
  /// <code>partitionKeys</code> to an empty list. For example:
  ///
  /// <code>"PartitionKeys": []</code>
  final List<Column>? partitionKeys;

  /// The retention time for this table.
  final int? retention;

  /// A storage descriptor containing information about the physical storage of
  /// this table.
  final StorageDescriptor? storageDescriptor;

  /// The type of this table (<code>EXTERNAL_TABLE</code>,
  /// <code>VIRTUAL_VIEW</code>, etc.).
  final String? tableType;

  /// A <code>TableIdentifier</code> structure that describes a target table for
  /// resource linking.
  final TableIdentifier? targetTable;

  /// If the table is a view, the expanded text of the view; otherwise
  /// <code>null</code>.
  final String? viewExpandedText;

  /// If the table is a view, the original text of the view; otherwise
  /// <code>null</code>.
  final String? viewOriginalText;

  TableInput({
    required this.name,
    this.description,
    this.lastAccessTime,
    this.lastAnalyzedTime,
    this.owner,
    this.parameters,
    this.partitionKeys,
    this.retention,
    this.storageDescriptor,
    this.tableType,
    this.targetTable,
    this.viewExpandedText,
    this.viewOriginalText,
  });

  factory TableInput.fromJson(Map<String, dynamic> json) {
    return TableInput(
      name: json['Name'] as String,
      description: json['Description'] as String?,
      lastAccessTime: timeStampFromJson(json['LastAccessTime']),
      lastAnalyzedTime: timeStampFromJson(json['LastAnalyzedTime']),
      owner: json['Owner'] as String?,
      parameters: (json['Parameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      partitionKeys: (json['PartitionKeys'] as List?)
          ?.whereNotNull()
          .map((e) => Column.fromJson(e as Map<String, dynamic>))
          .toList(),
      retention: json['Retention'] as int?,
      storageDescriptor: json['StorageDescriptor'] != null
          ? StorageDescriptor.fromJson(
              json['StorageDescriptor'] as Map<String, dynamic>)
          : null,
      tableType: json['TableType'] as String?,
      targetTable: json['TargetTable'] != null
          ? TableIdentifier.fromJson(
              json['TargetTable'] as Map<String, dynamic>)
          : null,
      viewExpandedText: json['ViewExpandedText'] as String?,
      viewOriginalText: json['ViewOriginalText'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final description = this.description;
    final lastAccessTime = this.lastAccessTime;
    final lastAnalyzedTime = this.lastAnalyzedTime;
    final owner = this.owner;
    final parameters = this.parameters;
    final partitionKeys = this.partitionKeys;
    final retention = this.retention;
    final storageDescriptor = this.storageDescriptor;
    final tableType = this.tableType;
    final targetTable = this.targetTable;
    final viewExpandedText = this.viewExpandedText;
    final viewOriginalText = this.viewOriginalText;
    return {
      'Name': name,
      if (description != null) 'Description': description,
      if (lastAccessTime != null)
        'LastAccessTime': unixTimestampToJson(lastAccessTime),
      if (lastAnalyzedTime != null)
        'LastAnalyzedTime': unixTimestampToJson(lastAnalyzedTime),
      if (owner != null) 'Owner': owner,
      if (parameters != null) 'Parameters': parameters,
      if (partitionKeys != null) 'PartitionKeys': partitionKeys,
      if (retention != null) 'Retention': retention,
      if (storageDescriptor != null) 'StorageDescriptor': storageDescriptor,
      if (tableType != null) 'TableType': tableType,
      if (targetTable != null) 'TargetTable': targetTable,
      if (viewExpandedText != null) 'ViewExpandedText': viewExpandedText,
      if (viewOriginalText != null) 'ViewOriginalText': viewOriginalText,
    };
  }
}

/// Specifies a version of a table.
class TableVersion {
  /// The table in question.
  final Table? table;

  /// The ID value that identifies this table version. A <code>VersionId</code> is
  /// a string representation of an integer. Each version is incremented by 1.
  final String? versionId;

  TableVersion({
    this.table,
    this.versionId,
  });

  factory TableVersion.fromJson(Map<String, dynamic> json) {
    return TableVersion(
      table: json['Table'] != null
          ? Table.fromJson(json['Table'] as Map<String, dynamic>)
          : null,
      versionId: json['VersionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final table = this.table;
    final versionId = this.versionId;
    return {
      if (table != null) 'Table': table,
      if (versionId != null) 'VersionId': versionId,
    };
  }
}

/// An error record for table-version operations.
class TableVersionError {
  /// The details about the error.
  final ErrorDetail? errorDetail;

  /// The name of the table in question.
  final String? tableName;

  /// The ID value of the version in question. A <code>VersionID</code> is a
  /// string representation of an integer. Each version is incremented by 1.
  final String? versionId;

  TableVersionError({
    this.errorDetail,
    this.tableName,
    this.versionId,
  });

  factory TableVersionError.fromJson(Map<String, dynamic> json) {
    return TableVersionError(
      errorDetail: json['ErrorDetail'] != null
          ? ErrorDetail.fromJson(json['ErrorDetail'] as Map<String, dynamic>)
          : null,
      tableName: json['TableName'] as String?,
      versionId: json['VersionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorDetail = this.errorDetail;
    final tableName = this.tableName;
    final versionId = this.versionId;
    return {
      if (errorDetail != null) 'ErrorDetail': errorDetail,
      if (tableName != null) 'TableName': tableName,
      if (versionId != null) 'VersionId': versionId,
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

/// The sampling parameters that are associated with the machine learning
/// transform.
class TaskRun {
  /// The last point in time that the requested task run was completed.
  final DateTime? completedOn;

  /// The list of error strings associated with this task run.
  final String? errorString;

  /// The amount of time (in seconds) that the task run consumed resources.
  final int? executionTime;

  /// The last point in time that the requested task run was updated.
  final DateTime? lastModifiedOn;

  /// The names of the log group for secure logging, associated with this task
  /// run.
  final String? logGroupName;

  /// Specifies configuration properties associated with this task run.
  final TaskRunProperties? properties;

  /// The date and time that this task run started.
  final DateTime? startedOn;

  /// The current status of the requested task run.
  final TaskStatusType? status;

  /// The unique identifier for this task run.
  final String? taskRunId;

  /// The unique identifier for the transform.
  final String? transformId;

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

  factory TaskRun.fromJson(Map<String, dynamic> json) {
    return TaskRun(
      completedOn: timeStampFromJson(json['CompletedOn']),
      errorString: json['ErrorString'] as String?,
      executionTime: json['ExecutionTime'] as int?,
      lastModifiedOn: timeStampFromJson(json['LastModifiedOn']),
      logGroupName: json['LogGroupName'] as String?,
      properties: json['Properties'] != null
          ? TaskRunProperties.fromJson(
              json['Properties'] as Map<String, dynamic>)
          : null,
      startedOn: timeStampFromJson(json['StartedOn']),
      status: (json['Status'] as String?)?.toTaskStatusType(),
      taskRunId: json['TaskRunId'] as String?,
      transformId: json['TransformId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final completedOn = this.completedOn;
    final errorString = this.errorString;
    final executionTime = this.executionTime;
    final lastModifiedOn = this.lastModifiedOn;
    final logGroupName = this.logGroupName;
    final properties = this.properties;
    final startedOn = this.startedOn;
    final status = this.status;
    final taskRunId = this.taskRunId;
    final transformId = this.transformId;
    return {
      if (completedOn != null) 'CompletedOn': unixTimestampToJson(completedOn),
      if (errorString != null) 'ErrorString': errorString,
      if (executionTime != null) 'ExecutionTime': executionTime,
      if (lastModifiedOn != null)
        'LastModifiedOn': unixTimestampToJson(lastModifiedOn),
      if (logGroupName != null) 'LogGroupName': logGroupName,
      if (properties != null) 'Properties': properties,
      if (startedOn != null) 'StartedOn': unixTimestampToJson(startedOn),
      if (status != null) 'Status': status.toValue(),
      if (taskRunId != null) 'TaskRunId': taskRunId,
      if (transformId != null) 'TransformId': transformId,
    };
  }
}

/// The criteria that are used to filter the task runs for the machine learning
/// transform.
class TaskRunFilterCriteria {
  /// Filter on task runs started after this date.
  final DateTime? startedAfter;

  /// Filter on task runs started before this date.
  final DateTime? startedBefore;

  /// The current status of the task run.
  final TaskStatusType? status;

  /// The type of task run.
  final TaskType? taskRunType;

  TaskRunFilterCriteria({
    this.startedAfter,
    this.startedBefore,
    this.status,
    this.taskRunType,
  });

  factory TaskRunFilterCriteria.fromJson(Map<String, dynamic> json) {
    return TaskRunFilterCriteria(
      startedAfter: timeStampFromJson(json['StartedAfter']),
      startedBefore: timeStampFromJson(json['StartedBefore']),
      status: (json['Status'] as String?)?.toTaskStatusType(),
      taskRunType: (json['TaskRunType'] as String?)?.toTaskType(),
    );
  }

  Map<String, dynamic> toJson() {
    final startedAfter = this.startedAfter;
    final startedBefore = this.startedBefore;
    final status = this.status;
    final taskRunType = this.taskRunType;
    return {
      if (startedAfter != null)
        'StartedAfter': unixTimestampToJson(startedAfter),
      if (startedBefore != null)
        'StartedBefore': unixTimestampToJson(startedBefore),
      if (status != null) 'Status': status.toValue(),
      if (taskRunType != null) 'TaskRunType': taskRunType.toValue(),
    };
  }
}

/// The configuration properties for the task run.
class TaskRunProperties {
  /// The configuration properties for an exporting labels task run.
  final ExportLabelsTaskRunProperties? exportLabelsTaskRunProperties;

  /// The configuration properties for a find matches task run.
  final FindMatchesTaskRunProperties? findMatchesTaskRunProperties;

  /// The configuration properties for an importing labels task run.
  final ImportLabelsTaskRunProperties? importLabelsTaskRunProperties;

  /// The configuration properties for a labeling set generation task run.
  final LabelingSetGenerationTaskRunProperties?
      labelingSetGenerationTaskRunProperties;

  /// The type of task run.
  final TaskType? taskType;

  TaskRunProperties({
    this.exportLabelsTaskRunProperties,
    this.findMatchesTaskRunProperties,
    this.importLabelsTaskRunProperties,
    this.labelingSetGenerationTaskRunProperties,
    this.taskType,
  });

  factory TaskRunProperties.fromJson(Map<String, dynamic> json) {
    return TaskRunProperties(
      exportLabelsTaskRunProperties:
          json['ExportLabelsTaskRunProperties'] != null
              ? ExportLabelsTaskRunProperties.fromJson(
                  json['ExportLabelsTaskRunProperties'] as Map<String, dynamic>)
              : null,
      findMatchesTaskRunProperties: json['FindMatchesTaskRunProperties'] != null
          ? FindMatchesTaskRunProperties.fromJson(
              json['FindMatchesTaskRunProperties'] as Map<String, dynamic>)
          : null,
      importLabelsTaskRunProperties:
          json['ImportLabelsTaskRunProperties'] != null
              ? ImportLabelsTaskRunProperties.fromJson(
                  json['ImportLabelsTaskRunProperties'] as Map<String, dynamic>)
              : null,
      labelingSetGenerationTaskRunProperties:
          json['LabelingSetGenerationTaskRunProperties'] != null
              ? LabelingSetGenerationTaskRunProperties.fromJson(
                  json['LabelingSetGenerationTaskRunProperties']
                      as Map<String, dynamic>)
              : null,
      taskType: (json['TaskType'] as String?)?.toTaskType(),
    );
  }

  Map<String, dynamic> toJson() {
    final exportLabelsTaskRunProperties = this.exportLabelsTaskRunProperties;
    final findMatchesTaskRunProperties = this.findMatchesTaskRunProperties;
    final importLabelsTaskRunProperties = this.importLabelsTaskRunProperties;
    final labelingSetGenerationTaskRunProperties =
        this.labelingSetGenerationTaskRunProperties;
    final taskType = this.taskType;
    return {
      if (exportLabelsTaskRunProperties != null)
        'ExportLabelsTaskRunProperties': exportLabelsTaskRunProperties,
      if (findMatchesTaskRunProperties != null)
        'FindMatchesTaskRunProperties': findMatchesTaskRunProperties,
      if (importLabelsTaskRunProperties != null)
        'ImportLabelsTaskRunProperties': importLabelsTaskRunProperties,
      if (labelingSetGenerationTaskRunProperties != null)
        'LabelingSetGenerationTaskRunProperties':
            labelingSetGenerationTaskRunProperties,
      if (taskType != null) 'TaskType': taskType.toValue(),
    };
  }
}

enum TaskRunSortColumnType {
  taskRunType,
  status,
  started,
}

extension on TaskRunSortColumnType {
  String toValue() {
    switch (this) {
      case TaskRunSortColumnType.taskRunType:
        return 'TASK_RUN_TYPE';
      case TaskRunSortColumnType.status:
        return 'STATUS';
      case TaskRunSortColumnType.started:
        return 'STARTED';
    }
  }
}

extension on String {
  TaskRunSortColumnType toTaskRunSortColumnType() {
    switch (this) {
      case 'TASK_RUN_TYPE':
        return TaskRunSortColumnType.taskRunType;
      case 'STATUS':
        return TaskRunSortColumnType.status;
      case 'STARTED':
        return TaskRunSortColumnType.started;
    }
    throw Exception('$this is not known in enum TaskRunSortColumnType');
  }
}

/// The sorting criteria that are used to sort the list of task runs for the
/// machine learning transform.
class TaskRunSortCriteria {
  /// The column to be used to sort the list of task runs for the machine learning
  /// transform.
  final TaskRunSortColumnType column;

  /// The sort direction to be used to sort the list of task runs for the machine
  /// learning transform.
  final SortDirectionType sortDirection;

  TaskRunSortCriteria({
    required this.column,
    required this.sortDirection,
  });

  factory TaskRunSortCriteria.fromJson(Map<String, dynamic> json) {
    return TaskRunSortCriteria(
      column: (json['Column'] as String).toTaskRunSortColumnType(),
      sortDirection: (json['SortDirection'] as String).toSortDirectionType(),
    );
  }

  Map<String, dynamic> toJson() {
    final column = this.column;
    final sortDirection = this.sortDirection;
    return {
      'Column': column.toValue(),
      'SortDirection': sortDirection.toValue(),
    };
  }
}

enum TaskStatusType {
  starting,
  running,
  stopping,
  stopped,
  succeeded,
  failed,
  timeout,
}

extension on TaskStatusType {
  String toValue() {
    switch (this) {
      case TaskStatusType.starting:
        return 'STARTING';
      case TaskStatusType.running:
        return 'RUNNING';
      case TaskStatusType.stopping:
        return 'STOPPING';
      case TaskStatusType.stopped:
        return 'STOPPED';
      case TaskStatusType.succeeded:
        return 'SUCCEEDED';
      case TaskStatusType.failed:
        return 'FAILED';
      case TaskStatusType.timeout:
        return 'TIMEOUT';
    }
  }
}

extension on String {
  TaskStatusType toTaskStatusType() {
    switch (this) {
      case 'STARTING':
        return TaskStatusType.starting;
      case 'RUNNING':
        return TaskStatusType.running;
      case 'STOPPING':
        return TaskStatusType.stopping;
      case 'STOPPED':
        return TaskStatusType.stopped;
      case 'SUCCEEDED':
        return TaskStatusType.succeeded;
      case 'FAILED':
        return TaskStatusType.failed;
      case 'TIMEOUT':
        return TaskStatusType.timeout;
    }
    throw Exception('$this is not known in enum TaskStatusType');
  }
}

enum TaskType {
  evaluation,
  labelingSetGeneration,
  importLabels,
  exportLabels,
  findMatches,
}

extension on TaskType {
  String toValue() {
    switch (this) {
      case TaskType.evaluation:
        return 'EVALUATION';
      case TaskType.labelingSetGeneration:
        return 'LABELING_SET_GENERATION';
      case TaskType.importLabels:
        return 'IMPORT_LABELS';
      case TaskType.exportLabels:
        return 'EXPORT_LABELS';
      case TaskType.findMatches:
        return 'FIND_MATCHES';
    }
  }
}

extension on String {
  TaskType toTaskType() {
    switch (this) {
      case 'EVALUATION':
        return TaskType.evaluation;
      case 'LABELING_SET_GENERATION':
        return TaskType.labelingSetGeneration;
      case 'IMPORT_LABELS':
        return TaskType.importLabels;
      case 'EXPORT_LABELS':
        return TaskType.exportLabels;
      case 'FIND_MATCHES':
        return TaskType.findMatches;
    }
    throw Exception('$this is not known in enum TaskType');
  }
}

/// The encryption-at-rest settings of the transform that apply to accessing
/// user data. Machine learning transforms can access user data encrypted in
/// Amazon S3 using KMS.
///
/// Additionally, imported labels and trained transforms can now be encrypted
/// using a customer provided KMS key.
class TransformEncryption {
  /// An <code>MLUserDataEncryption</code> object containing the encryption mode
  /// and customer-provided KMS key ID.
  final MLUserDataEncryption? mlUserDataEncryption;

  /// The name of the security configuration.
  final String? taskRunSecurityConfigurationName;

  TransformEncryption({
    this.mlUserDataEncryption,
    this.taskRunSecurityConfigurationName,
  });

  factory TransformEncryption.fromJson(Map<String, dynamic> json) {
    return TransformEncryption(
      mlUserDataEncryption: json['MlUserDataEncryption'] != null
          ? MLUserDataEncryption.fromJson(
              json['MlUserDataEncryption'] as Map<String, dynamic>)
          : null,
      taskRunSecurityConfigurationName:
          json['TaskRunSecurityConfigurationName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final mlUserDataEncryption = this.mlUserDataEncryption;
    final taskRunSecurityConfigurationName =
        this.taskRunSecurityConfigurationName;
    return {
      if (mlUserDataEncryption != null)
        'MlUserDataEncryption': mlUserDataEncryption,
      if (taskRunSecurityConfigurationName != null)
        'TaskRunSecurityConfigurationName': taskRunSecurityConfigurationName,
    };
  }
}

/// The criteria used to filter the machine learning transforms.
class TransformFilterCriteria {
  /// The time and date after which the transforms were created.
  final DateTime? createdAfter;

  /// The time and date before which the transforms were created.
  final DateTime? createdBefore;

  /// This value determines which version of Glue this machine learning transform
  /// is compatible with. Glue 1.0 is recommended for most customers. If the value
  /// is not set, the Glue compatibility defaults to Glue 0.9. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/release-notes.html#release-notes-versions">Glue
  /// Versions</a> in the developer guide.
  final String? glueVersion;

  /// Filter on transforms last modified after this date.
  final DateTime? lastModifiedAfter;

  /// Filter on transforms last modified before this date.
  final DateTime? lastModifiedBefore;

  /// A unique transform name that is used to filter the machine learning
  /// transforms.
  final String? name;

  /// Filters on datasets with a specific schema. The <code>Map&lt;Column,
  /// Type&gt;</code> object is an array of key-value pairs representing the
  /// schema this transform accepts, where <code>Column</code> is the name of a
  /// column, and <code>Type</code> is the type of the data such as an integer or
  /// string. Has an upper bound of 100 columns.
  final List<SchemaColumn>? schema;

  /// Filters the list of machine learning transforms by the last known status of
  /// the transforms (to indicate whether a transform can be used or not). One of
  /// "NOT_READY", "READY", or "DELETING".
  final TransformStatusType? status;

  /// The type of machine learning transform that is used to filter the machine
  /// learning transforms.
  final TransformType? transformType;

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

  factory TransformFilterCriteria.fromJson(Map<String, dynamic> json) {
    return TransformFilterCriteria(
      createdAfter: timeStampFromJson(json['CreatedAfter']),
      createdBefore: timeStampFromJson(json['CreatedBefore']),
      glueVersion: json['GlueVersion'] as String?,
      lastModifiedAfter: timeStampFromJson(json['LastModifiedAfter']),
      lastModifiedBefore: timeStampFromJson(json['LastModifiedBefore']),
      name: json['Name'] as String?,
      schema: (json['Schema'] as List?)
          ?.whereNotNull()
          .map((e) => SchemaColumn.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['Status'] as String?)?.toTransformStatusType(),
      transformType: (json['TransformType'] as String?)?.toTransformType(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAfter = this.createdAfter;
    final createdBefore = this.createdBefore;
    final glueVersion = this.glueVersion;
    final lastModifiedAfter = this.lastModifiedAfter;
    final lastModifiedBefore = this.lastModifiedBefore;
    final name = this.name;
    final schema = this.schema;
    final status = this.status;
    final transformType = this.transformType;
    return {
      if (createdAfter != null)
        'CreatedAfter': unixTimestampToJson(createdAfter),
      if (createdBefore != null)
        'CreatedBefore': unixTimestampToJson(createdBefore),
      if (glueVersion != null) 'GlueVersion': glueVersion,
      if (lastModifiedAfter != null)
        'LastModifiedAfter': unixTimestampToJson(lastModifiedAfter),
      if (lastModifiedBefore != null)
        'LastModifiedBefore': unixTimestampToJson(lastModifiedBefore),
      if (name != null) 'Name': name,
      if (schema != null) 'Schema': schema,
      if (status != null) 'Status': status.toValue(),
      if (transformType != null) 'TransformType': transformType.toValue(),
    };
  }
}

/// The algorithm-specific parameters that are associated with the machine
/// learning transform.
class TransformParameters {
  /// The type of machine learning transform.
  ///
  /// For information about the types of machine learning transforms, see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/add-job-machine-learning-transform.html">Creating
  /// Machine Learning Transforms</a>.
  final TransformType transformType;

  /// The parameters for the find matches algorithm.
  final FindMatchesParameters? findMatchesParameters;

  TransformParameters({
    required this.transformType,
    this.findMatchesParameters,
  });

  factory TransformParameters.fromJson(Map<String, dynamic> json) {
    return TransformParameters(
      transformType: (json['TransformType'] as String).toTransformType(),
      findMatchesParameters: json['FindMatchesParameters'] != null
          ? FindMatchesParameters.fromJson(
              json['FindMatchesParameters'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final transformType = this.transformType;
    final findMatchesParameters = this.findMatchesParameters;
    return {
      'TransformType': transformType.toValue(),
      if (findMatchesParameters != null)
        'FindMatchesParameters': findMatchesParameters,
    };
  }
}

enum TransformSortColumnType {
  name,
  transformType,
  status,
  created,
  lastModified,
}

extension on TransformSortColumnType {
  String toValue() {
    switch (this) {
      case TransformSortColumnType.name:
        return 'NAME';
      case TransformSortColumnType.transformType:
        return 'TRANSFORM_TYPE';
      case TransformSortColumnType.status:
        return 'STATUS';
      case TransformSortColumnType.created:
        return 'CREATED';
      case TransformSortColumnType.lastModified:
        return 'LAST_MODIFIED';
    }
  }
}

extension on String {
  TransformSortColumnType toTransformSortColumnType() {
    switch (this) {
      case 'NAME':
        return TransformSortColumnType.name;
      case 'TRANSFORM_TYPE':
        return TransformSortColumnType.transformType;
      case 'STATUS':
        return TransformSortColumnType.status;
      case 'CREATED':
        return TransformSortColumnType.created;
      case 'LAST_MODIFIED':
        return TransformSortColumnType.lastModified;
    }
    throw Exception('$this is not known in enum TransformSortColumnType');
  }
}

/// The sorting criteria that are associated with the machine learning
/// transform.
class TransformSortCriteria {
  /// The column to be used in the sorting criteria that are associated with the
  /// machine learning transform.
  final TransformSortColumnType column;

  /// The sort direction to be used in the sorting criteria that are associated
  /// with the machine learning transform.
  final SortDirectionType sortDirection;

  TransformSortCriteria({
    required this.column,
    required this.sortDirection,
  });

  factory TransformSortCriteria.fromJson(Map<String, dynamic> json) {
    return TransformSortCriteria(
      column: (json['Column'] as String).toTransformSortColumnType(),
      sortDirection: (json['SortDirection'] as String).toSortDirectionType(),
    );
  }

  Map<String, dynamic> toJson() {
    final column = this.column;
    final sortDirection = this.sortDirection;
    return {
      'Column': column.toValue(),
      'SortDirection': sortDirection.toValue(),
    };
  }
}

enum TransformStatusType {
  notReady,
  ready,
  deleting,
}

extension on TransformStatusType {
  String toValue() {
    switch (this) {
      case TransformStatusType.notReady:
        return 'NOT_READY';
      case TransformStatusType.ready:
        return 'READY';
      case TransformStatusType.deleting:
        return 'DELETING';
    }
  }
}

extension on String {
  TransformStatusType toTransformStatusType() {
    switch (this) {
      case 'NOT_READY':
        return TransformStatusType.notReady;
      case 'READY':
        return TransformStatusType.ready;
      case 'DELETING':
        return TransformStatusType.deleting;
    }
    throw Exception('$this is not known in enum TransformStatusType');
  }
}

enum TransformType {
  findMatches,
}

extension on TransformType {
  String toValue() {
    switch (this) {
      case TransformType.findMatches:
        return 'FIND_MATCHES';
    }
  }
}

extension on String {
  TransformType toTransformType() {
    switch (this) {
      case 'FIND_MATCHES':
        return TransformType.findMatches;
    }
    throw Exception('$this is not known in enum TransformType');
  }
}

/// Information about a specific trigger.
class Trigger {
  /// The actions initiated by this trigger.
  final List<Action>? actions;

  /// A description of this trigger.
  final String? description;

  /// Reserved for future use.
  final String? id;

  /// The name of the trigger.
  final String? name;

  /// The predicate of this trigger, which defines when it will fire.
  final Predicate? predicate;

  /// A <code>cron</code> expression used to specify the schedule (see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/monitor-data-warehouse-schedule.html">Time-Based
  /// Schedules for Jobs and Crawlers</a>. For example, to run something every day
  /// at 12:15 UTC, you would specify: <code>cron(15 12 * * ? *)</code>.
  final String? schedule;

  /// The current state of the trigger.
  final TriggerState? state;

  /// The type of trigger that this is.
  final TriggerType? type;

  /// The name of the workflow associated with the trigger.
  final String? workflowName;

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

  factory Trigger.fromJson(Map<String, dynamic> json) {
    return Trigger(
      actions: (json['Actions'] as List?)
          ?.whereNotNull()
          .map((e) => Action.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      predicate: json['Predicate'] != null
          ? Predicate.fromJson(json['Predicate'] as Map<String, dynamic>)
          : null,
      schedule: json['Schedule'] as String?,
      state: (json['State'] as String?)?.toTriggerState(),
      type: (json['Type'] as String?)?.toTriggerType(),
      workflowName: json['WorkflowName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actions = this.actions;
    final description = this.description;
    final id = this.id;
    final name = this.name;
    final predicate = this.predicate;
    final schedule = this.schedule;
    final state = this.state;
    final type = this.type;
    final workflowName = this.workflowName;
    return {
      if (actions != null) 'Actions': actions,
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (predicate != null) 'Predicate': predicate,
      if (schedule != null) 'Schedule': schedule,
      if (state != null) 'State': state.toValue(),
      if (type != null) 'Type': type.toValue(),
      if (workflowName != null) 'WorkflowName': workflowName,
    };
  }
}

/// The details of a Trigger node present in the workflow.
class TriggerNodeDetails {
  /// The information of the trigger represented by the trigger node.
  final Trigger? trigger;

  TriggerNodeDetails({
    this.trigger,
  });

  factory TriggerNodeDetails.fromJson(Map<String, dynamic> json) {
    return TriggerNodeDetails(
      trigger: json['Trigger'] != null
          ? Trigger.fromJson(json['Trigger'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final trigger = this.trigger;
    return {
      if (trigger != null) 'Trigger': trigger,
    };
  }
}

enum TriggerState {
  creating,
  created,
  activating,
  activated,
  deactivating,
  deactivated,
  deleting,
  updating,
}

extension on TriggerState {
  String toValue() {
    switch (this) {
      case TriggerState.creating:
        return 'CREATING';
      case TriggerState.created:
        return 'CREATED';
      case TriggerState.activating:
        return 'ACTIVATING';
      case TriggerState.activated:
        return 'ACTIVATED';
      case TriggerState.deactivating:
        return 'DEACTIVATING';
      case TriggerState.deactivated:
        return 'DEACTIVATED';
      case TriggerState.deleting:
        return 'DELETING';
      case TriggerState.updating:
        return 'UPDATING';
    }
  }
}

extension on String {
  TriggerState toTriggerState() {
    switch (this) {
      case 'CREATING':
        return TriggerState.creating;
      case 'CREATED':
        return TriggerState.created;
      case 'ACTIVATING':
        return TriggerState.activating;
      case 'ACTIVATED':
        return TriggerState.activated;
      case 'DEACTIVATING':
        return TriggerState.deactivating;
      case 'DEACTIVATED':
        return TriggerState.deactivated;
      case 'DELETING':
        return TriggerState.deleting;
      case 'UPDATING':
        return TriggerState.updating;
    }
    throw Exception('$this is not known in enum TriggerState');
  }
}

enum TriggerType {
  scheduled,
  conditional,
  onDemand,
}

extension on TriggerType {
  String toValue() {
    switch (this) {
      case TriggerType.scheduled:
        return 'SCHEDULED';
      case TriggerType.conditional:
        return 'CONDITIONAL';
      case TriggerType.onDemand:
        return 'ON_DEMAND';
    }
  }
}

extension on String {
  TriggerType toTriggerType() {
    switch (this) {
      case 'SCHEDULED':
        return TriggerType.scheduled;
      case 'CONDITIONAL':
        return TriggerType.conditional;
      case 'ON_DEMAND':
        return TriggerType.onDemand;
    }
    throw Exception('$this is not known in enum TriggerType');
  }
}

/// A structure used to provide information used to update a trigger. This
/// object updates the previous trigger definition by overwriting it completely.
class TriggerUpdate {
  /// The actions initiated by this trigger.
  final List<Action>? actions;

  /// A description of this trigger.
  final String? description;

  /// Reserved for future use.
  final String? name;

  /// The predicate of this trigger, which defines when it will fire.
  final Predicate? predicate;

  /// A <code>cron</code> expression used to specify the schedule (see <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/monitor-data-warehouse-schedule.html">Time-Based
  /// Schedules for Jobs and Crawlers</a>. For example, to run something every day
  /// at 12:15 UTC, you would specify: <code>cron(15 12 * * ? *)</code>.
  final String? schedule;

  TriggerUpdate({
    this.actions,
    this.description,
    this.name,
    this.predicate,
    this.schedule,
  });

  factory TriggerUpdate.fromJson(Map<String, dynamic> json) {
    return TriggerUpdate(
      actions: (json['Actions'] as List?)
          ?.whereNotNull()
          .map((e) => Action.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['Description'] as String?,
      name: json['Name'] as String?,
      predicate: json['Predicate'] != null
          ? Predicate.fromJson(json['Predicate'] as Map<String, dynamic>)
          : null,
      schedule: json['Schedule'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actions = this.actions;
    final description = this.description;
    final name = this.name;
    final predicate = this.predicate;
    final schedule = this.schedule;
    return {
      if (actions != null) 'Actions': actions,
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
      if (predicate != null) 'Predicate': predicate,
      if (schedule != null) 'Schedule': schedule,
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

enum UpdateBehavior {
  log,
  updateInDatabase,
}

extension on UpdateBehavior {
  String toValue() {
    switch (this) {
      case UpdateBehavior.log:
        return 'LOG';
      case UpdateBehavior.updateInDatabase:
        return 'UPDATE_IN_DATABASE';
    }
  }
}

extension on String {
  UpdateBehavior toUpdateBehavior() {
    switch (this) {
      case 'LOG':
        return UpdateBehavior.log;
      case 'UPDATE_IN_DATABASE':
        return UpdateBehavior.updateInDatabase;
    }
    throw Exception('$this is not known in enum UpdateBehavior');
  }
}

class UpdateClassifierResponse {
  UpdateClassifierResponse();

  factory UpdateClassifierResponse.fromJson(Map<String, dynamic> _) {
    return UpdateClassifierResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateColumnStatisticsForPartitionResponse {
  /// Error occurred during updating column statistics data.
  final List<ColumnStatisticsError>? errors;

  UpdateColumnStatisticsForPartitionResponse({
    this.errors,
  });

  factory UpdateColumnStatisticsForPartitionResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateColumnStatisticsForPartitionResponse(
      errors: (json['Errors'] as List?)
          ?.whereNotNull()
          .map((e) => ColumnStatisticsError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    return {
      if (errors != null) 'Errors': errors,
    };
  }
}

class UpdateColumnStatisticsForTableResponse {
  /// List of ColumnStatisticsErrors.
  final List<ColumnStatisticsError>? errors;

  UpdateColumnStatisticsForTableResponse({
    this.errors,
  });

  factory UpdateColumnStatisticsForTableResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateColumnStatisticsForTableResponse(
      errors: (json['Errors'] as List?)
          ?.whereNotNull()
          .map((e) => ColumnStatisticsError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    return {
      if (errors != null) 'Errors': errors,
    };
  }
}

class UpdateConnectionResponse {
  UpdateConnectionResponse();

  factory UpdateConnectionResponse.fromJson(Map<String, dynamic> _) {
    return UpdateConnectionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateCrawlerResponse {
  UpdateCrawlerResponse();

  factory UpdateCrawlerResponse.fromJson(Map<String, dynamic> _) {
    return UpdateCrawlerResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateCrawlerScheduleResponse {
  UpdateCrawlerScheduleResponse();

  factory UpdateCrawlerScheduleResponse.fromJson(Map<String, dynamic> _) {
    return UpdateCrawlerScheduleResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Specifies a custom CSV classifier to be updated.
class UpdateCsvClassifierRequest {
  /// The name of the classifier.
  final String name;

  /// Enables the processing of files that contain only one column.
  final bool? allowSingleColumn;

  /// Indicates whether the CSV file contains a header.
  final CsvHeaderOption? containsHeader;

  /// A custom symbol to denote what separates each column entry in the row.
  final String? delimiter;

  /// Specifies not to trim values before identifying the type of column values.
  /// The default value is true.
  final bool? disableValueTrimming;

  /// A list of strings representing column names.
  final List<String>? header;

  /// A custom symbol to denote what combines content into a single column value.
  /// It must be different from the column delimiter.
  final String? quoteSymbol;

  UpdateCsvClassifierRequest({
    required this.name,
    this.allowSingleColumn,
    this.containsHeader,
    this.delimiter,
    this.disableValueTrimming,
    this.header,
    this.quoteSymbol,
  });

  factory UpdateCsvClassifierRequest.fromJson(Map<String, dynamic> json) {
    return UpdateCsvClassifierRequest(
      name: json['Name'] as String,
      allowSingleColumn: json['AllowSingleColumn'] as bool?,
      containsHeader: (json['ContainsHeader'] as String?)?.toCsvHeaderOption(),
      delimiter: json['Delimiter'] as String?,
      disableValueTrimming: json['DisableValueTrimming'] as bool?,
      header: (json['Header'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      quoteSymbol: json['QuoteSymbol'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final allowSingleColumn = this.allowSingleColumn;
    final containsHeader = this.containsHeader;
    final delimiter = this.delimiter;
    final disableValueTrimming = this.disableValueTrimming;
    final header = this.header;
    final quoteSymbol = this.quoteSymbol;
    return {
      'Name': name,
      if (allowSingleColumn != null) 'AllowSingleColumn': allowSingleColumn,
      if (containsHeader != null) 'ContainsHeader': containsHeader.toValue(),
      if (delimiter != null) 'Delimiter': delimiter,
      if (disableValueTrimming != null)
        'DisableValueTrimming': disableValueTrimming,
      if (header != null) 'Header': header,
      if (quoteSymbol != null) 'QuoteSymbol': quoteSymbol,
    };
  }
}

class UpdateDatabaseResponse {
  UpdateDatabaseResponse();

  factory UpdateDatabaseResponse.fromJson(Map<String, dynamic> _) {
    return UpdateDatabaseResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateDevEndpointResponse {
  UpdateDevEndpointResponse();

  factory UpdateDevEndpointResponse.fromJson(Map<String, dynamic> _) {
    return UpdateDevEndpointResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Specifies a grok classifier to update when passed to
/// <code>UpdateClassifier</code>.
class UpdateGrokClassifierRequest {
  /// The name of the <code>GrokClassifier</code>.
  final String name;

  /// An identifier of the data format that the classifier matches, such as
  /// Twitter, JSON, Omniture logs, Amazon CloudWatch Logs, and so on.
  final String? classification;

  /// Optional custom grok patterns used by this classifier.
  final String? customPatterns;

  /// The grok pattern used by this classifier.
  final String? grokPattern;

  UpdateGrokClassifierRequest({
    required this.name,
    this.classification,
    this.customPatterns,
    this.grokPattern,
  });

  factory UpdateGrokClassifierRequest.fromJson(Map<String, dynamic> json) {
    return UpdateGrokClassifierRequest(
      name: json['Name'] as String,
      classification: json['Classification'] as String?,
      customPatterns: json['CustomPatterns'] as String?,
      grokPattern: json['GrokPattern'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final classification = this.classification;
    final customPatterns = this.customPatterns;
    final grokPattern = this.grokPattern;
    return {
      'Name': name,
      if (classification != null) 'Classification': classification,
      if (customPatterns != null) 'CustomPatterns': customPatterns,
      if (grokPattern != null) 'GrokPattern': grokPattern,
    };
  }
}

class UpdateJobResponse {
  /// Returns the name of the updated job definition.
  final String? jobName;

  UpdateJobResponse({
    this.jobName,
  });

  factory UpdateJobResponse.fromJson(Map<String, dynamic> json) {
    return UpdateJobResponse(
      jobName: json['JobName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobName = this.jobName;
    return {
      if (jobName != null) 'JobName': jobName,
    };
  }
}

/// Specifies a JSON classifier to be updated.
class UpdateJsonClassifierRequest {
  /// The name of the classifier.
  final String name;

  /// A <code>JsonPath</code> string defining the JSON data for the classifier to
  /// classify. Glue supports a subset of JsonPath, as described in <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/custom-classifier.html#custom-classifier-json">Writing
  /// JsonPath Custom Classifiers</a>.
  final String? jsonPath;

  UpdateJsonClassifierRequest({
    required this.name,
    this.jsonPath,
  });

  factory UpdateJsonClassifierRequest.fromJson(Map<String, dynamic> json) {
    return UpdateJsonClassifierRequest(
      name: json['Name'] as String,
      jsonPath: json['JsonPath'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final jsonPath = this.jsonPath;
    return {
      'Name': name,
      if (jsonPath != null) 'JsonPath': jsonPath,
    };
  }
}

class UpdateMLTransformResponse {
  /// The unique identifier for the transform that was updated.
  final String? transformId;

  UpdateMLTransformResponse({
    this.transformId,
  });

  factory UpdateMLTransformResponse.fromJson(Map<String, dynamic> json) {
    return UpdateMLTransformResponse(
      transformId: json['TransformId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final transformId = this.transformId;
    return {
      if (transformId != null) 'TransformId': transformId,
    };
  }
}

class UpdatePartitionResponse {
  UpdatePartitionResponse();

  factory UpdatePartitionResponse.fromJson(Map<String, dynamic> _) {
    return UpdatePartitionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateRegistryResponse {
  /// The Amazon Resource name (ARN) of the updated registry.
  final String? registryArn;

  /// The name of the updated registry.
  final String? registryName;

  UpdateRegistryResponse({
    this.registryArn,
    this.registryName,
  });

  factory UpdateRegistryResponse.fromJson(Map<String, dynamic> json) {
    return UpdateRegistryResponse(
      registryArn: json['RegistryArn'] as String?,
      registryName: json['RegistryName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final registryArn = this.registryArn;
    final registryName = this.registryName;
    return {
      if (registryArn != null) 'RegistryArn': registryArn,
      if (registryName != null) 'RegistryName': registryName,
    };
  }
}

class UpdateSchemaResponse {
  /// The name of the registry that contains the schema.
  final String? registryName;

  /// The Amazon Resource Name (ARN) of the schema.
  final String? schemaArn;

  /// The name of the schema.
  final String? schemaName;

  UpdateSchemaResponse({
    this.registryName,
    this.schemaArn,
    this.schemaName,
  });

  factory UpdateSchemaResponse.fromJson(Map<String, dynamic> json) {
    return UpdateSchemaResponse(
      registryName: json['RegistryName'] as String?,
      schemaArn: json['SchemaArn'] as String?,
      schemaName: json['SchemaName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final registryName = this.registryName;
    final schemaArn = this.schemaArn;
    final schemaName = this.schemaName;
    return {
      if (registryName != null) 'RegistryName': registryName,
      if (schemaArn != null) 'SchemaArn': schemaArn,
      if (schemaName != null) 'SchemaName': schemaName,
    };
  }
}

class UpdateTableResponse {
  UpdateTableResponse();

  factory UpdateTableResponse.fromJson(Map<String, dynamic> _) {
    return UpdateTableResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateTriggerResponse {
  /// The resulting trigger definition.
  final Trigger? trigger;

  UpdateTriggerResponse({
    this.trigger,
  });

  factory UpdateTriggerResponse.fromJson(Map<String, dynamic> json) {
    return UpdateTriggerResponse(
      trigger: json['Trigger'] != null
          ? Trigger.fromJson(json['Trigger'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final trigger = this.trigger;
    return {
      if (trigger != null) 'Trigger': trigger,
    };
  }
}

class UpdateUserDefinedFunctionResponse {
  UpdateUserDefinedFunctionResponse();

  factory UpdateUserDefinedFunctionResponse.fromJson(Map<String, dynamic> _) {
    return UpdateUserDefinedFunctionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateWorkflowResponse {
  /// The name of the workflow which was specified in input.
  final String? name;

  UpdateWorkflowResponse({
    this.name,
  });

  factory UpdateWorkflowResponse.fromJson(Map<String, dynamic> json) {
    return UpdateWorkflowResponse(
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      if (name != null) 'Name': name,
    };
  }
}

/// Specifies an XML classifier to be updated.
class UpdateXMLClassifierRequest {
  /// The name of the classifier.
  final String name;

  /// An identifier of the data format that the classifier matches.
  final String? classification;

  /// The XML tag designating the element that contains each record in an XML
  /// document being parsed. This cannot identify a self-closing element (closed
  /// by <code>/&gt;</code>). An empty row element that contains only attributes
  /// can be parsed as long as it ends with a closing tag (for example,
  /// <code>&lt;row item_a="A" item_b="B"&gt;&lt;/row&gt;</code> is okay, but
  /// <code>&lt;row item_a="A" item_b="B" /&gt;</code> is not).
  final String? rowTag;

  UpdateXMLClassifierRequest({
    required this.name,
    this.classification,
    this.rowTag,
  });

  factory UpdateXMLClassifierRequest.fromJson(Map<String, dynamic> json) {
    return UpdateXMLClassifierRequest(
      name: json['Name'] as String,
      classification: json['Classification'] as String?,
      rowTag: json['RowTag'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final classification = this.classification;
    final rowTag = this.rowTag;
    return {
      'Name': name,
      if (classification != null) 'Classification': classification,
      if (rowTag != null) 'RowTag': rowTag,
    };
  }
}

/// Represents the equivalent of a Hive user-defined function (<code>UDF</code>)
/// definition.
class UserDefinedFunction {
  /// The ID of the Data Catalog in which the function resides.
  final String? catalogId;

  /// The Java class that contains the function code.
  final String? className;

  /// The time at which the function was created.
  final DateTime? createTime;

  /// The name of the catalog database that contains the function.
  final String? databaseName;

  /// The name of the function.
  final String? functionName;

  /// The owner of the function.
  final String? ownerName;

  /// The owner type.
  final PrincipalType? ownerType;

  /// The resource URIs for the function.
  final List<ResourceUri>? resourceUris;

  UserDefinedFunction({
    this.catalogId,
    this.className,
    this.createTime,
    this.databaseName,
    this.functionName,
    this.ownerName,
    this.ownerType,
    this.resourceUris,
  });

  factory UserDefinedFunction.fromJson(Map<String, dynamic> json) {
    return UserDefinedFunction(
      catalogId: json['CatalogId'] as String?,
      className: json['ClassName'] as String?,
      createTime: timeStampFromJson(json['CreateTime']),
      databaseName: json['DatabaseName'] as String?,
      functionName: json['FunctionName'] as String?,
      ownerName: json['OwnerName'] as String?,
      ownerType: (json['OwnerType'] as String?)?.toPrincipalType(),
      resourceUris: (json['ResourceUris'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceUri.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final catalogId = this.catalogId;
    final className = this.className;
    final createTime = this.createTime;
    final databaseName = this.databaseName;
    final functionName = this.functionName;
    final ownerName = this.ownerName;
    final ownerType = this.ownerType;
    final resourceUris = this.resourceUris;
    return {
      if (catalogId != null) 'CatalogId': catalogId,
      if (className != null) 'ClassName': className,
      if (createTime != null) 'CreateTime': unixTimestampToJson(createTime),
      if (databaseName != null) 'DatabaseName': databaseName,
      if (functionName != null) 'FunctionName': functionName,
      if (ownerName != null) 'OwnerName': ownerName,
      if (ownerType != null) 'OwnerType': ownerType.toValue(),
      if (resourceUris != null) 'ResourceUris': resourceUris,
    };
  }
}

/// A structure used to create or update a user-defined function.
class UserDefinedFunctionInput {
  /// The Java class that contains the function code.
  final String? className;

  /// The name of the function.
  final String? functionName;

  /// The owner of the function.
  final String? ownerName;

  /// The owner type.
  final PrincipalType? ownerType;

  /// The resource URIs for the function.
  final List<ResourceUri>? resourceUris;

  UserDefinedFunctionInput({
    this.className,
    this.functionName,
    this.ownerName,
    this.ownerType,
    this.resourceUris,
  });

  factory UserDefinedFunctionInput.fromJson(Map<String, dynamic> json) {
    return UserDefinedFunctionInput(
      className: json['ClassName'] as String?,
      functionName: json['FunctionName'] as String?,
      ownerName: json['OwnerName'] as String?,
      ownerType: (json['OwnerType'] as String?)?.toPrincipalType(),
      resourceUris: (json['ResourceUris'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceUri.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final className = this.className;
    final functionName = this.functionName;
    final ownerName = this.ownerName;
    final ownerType = this.ownerType;
    final resourceUris = this.resourceUris;
    return {
      if (className != null) 'ClassName': className,
      if (functionName != null) 'FunctionName': functionName,
      if (ownerName != null) 'OwnerName': ownerName,
      if (ownerType != null) 'OwnerType': ownerType.toValue(),
      if (resourceUris != null) 'ResourceUris': resourceUris,
    };
  }
}

enum WorkerType {
  standard,
  g_1x,
  g_2x,
}

extension on WorkerType {
  String toValue() {
    switch (this) {
      case WorkerType.standard:
        return 'Standard';
      case WorkerType.g_1x:
        return 'G.1X';
      case WorkerType.g_2x:
        return 'G.2X';
    }
  }
}

extension on String {
  WorkerType toWorkerType() {
    switch (this) {
      case 'Standard':
        return WorkerType.standard;
      case 'G.1X':
        return WorkerType.g_1x;
      case 'G.2X':
        return WorkerType.g_2x;
    }
    throw Exception('$this is not known in enum WorkerType');
  }
}

/// A workflow represents a flow in which Glue components should be run to
/// complete a logical task.
class Workflow {
  /// The date and time when the workflow was created.
  final DateTime? createdOn;

  /// A collection of properties to be used as part of each execution of the
  /// workflow.
  final Map<String, String>? defaultRunProperties;

  /// A description of the workflow.
  final String? description;

  /// The graph representing all the Glue components that belong to the workflow
  /// as nodes and directed connections between them as edges.
  final WorkflowGraph? graph;

  /// The date and time when the workflow was last modified.
  final DateTime? lastModifiedOn;

  /// The information about the last execution of the workflow.
  final WorkflowRun? lastRun;

  /// You can use this parameter to prevent unwanted multiple updates to data, to
  /// control costs, or in some cases, to prevent exceeding the maximum number of
  /// concurrent runs of any of the component jobs. If you leave this parameter
  /// blank, there is no limit to the number of concurrent workflow runs.
  final int? maxConcurrentRuns;

  /// The name of the workflow representing the flow.
  final String? name;

  Workflow({
    this.createdOn,
    this.defaultRunProperties,
    this.description,
    this.graph,
    this.lastModifiedOn,
    this.lastRun,
    this.maxConcurrentRuns,
    this.name,
  });

  factory Workflow.fromJson(Map<String, dynamic> json) {
    return Workflow(
      createdOn: timeStampFromJson(json['CreatedOn']),
      defaultRunProperties:
          (json['DefaultRunProperties'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      description: json['Description'] as String?,
      graph: json['Graph'] != null
          ? WorkflowGraph.fromJson(json['Graph'] as Map<String, dynamic>)
          : null,
      lastModifiedOn: timeStampFromJson(json['LastModifiedOn']),
      lastRun: json['LastRun'] != null
          ? WorkflowRun.fromJson(json['LastRun'] as Map<String, dynamic>)
          : null,
      maxConcurrentRuns: json['MaxConcurrentRuns'] as int?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdOn = this.createdOn;
    final defaultRunProperties = this.defaultRunProperties;
    final description = this.description;
    final graph = this.graph;
    final lastModifiedOn = this.lastModifiedOn;
    final lastRun = this.lastRun;
    final maxConcurrentRuns = this.maxConcurrentRuns;
    final name = this.name;
    return {
      if (createdOn != null) 'CreatedOn': unixTimestampToJson(createdOn),
      if (defaultRunProperties != null)
        'DefaultRunProperties': defaultRunProperties,
      if (description != null) 'Description': description,
      if (graph != null) 'Graph': graph,
      if (lastModifiedOn != null)
        'LastModifiedOn': unixTimestampToJson(lastModifiedOn),
      if (lastRun != null) 'LastRun': lastRun,
      if (maxConcurrentRuns != null) 'MaxConcurrentRuns': maxConcurrentRuns,
      if (name != null) 'Name': name,
    };
  }
}

/// A workflow graph represents the complete workflow containing all the Glue
/// components present in the workflow and all the directed connections between
/// them.
class WorkflowGraph {
  /// A list of all the directed connections between the nodes belonging to the
  /// workflow.
  final List<Edge>? edges;

  /// A list of the the Glue components belong to the workflow represented as
  /// nodes.
  final List<Node>? nodes;

  WorkflowGraph({
    this.edges,
    this.nodes,
  });

  factory WorkflowGraph.fromJson(Map<String, dynamic> json) {
    return WorkflowGraph(
      edges: (json['Edges'] as List?)
          ?.whereNotNull()
          .map((e) => Edge.fromJson(e as Map<String, dynamic>))
          .toList(),
      nodes: (json['Nodes'] as List?)
          ?.whereNotNull()
          .map((e) => Node.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final edges = this.edges;
    final nodes = this.nodes;
    return {
      if (edges != null) 'Edges': edges,
      if (nodes != null) 'Nodes': nodes,
    };
  }
}

/// A workflow run is an execution of a workflow providing all the runtime
/// information.
class WorkflowRun {
  /// The date and time when the workflow run completed.
  final DateTime? completedOn;

  /// This error message describes any error that may have occurred in starting
  /// the workflow run. Currently the only error message is "Concurrent runs
  /// exceeded for workflow: <code>foo</code>."
  final String? errorMessage;

  /// The graph representing all the Glue components that belong to the workflow
  /// as nodes and directed connections between them as edges.
  final WorkflowGraph? graph;

  /// Name of the workflow that was run.
  final String? name;

  /// The ID of the previous workflow run.
  final String? previousRunId;

  /// The date and time when the workflow run was started.
  final DateTime? startedOn;

  /// The statistics of the run.
  final WorkflowRunStatistics? statistics;

  /// The status of the workflow run.
  final WorkflowRunStatus? status;

  /// The ID of this workflow run.
  final String? workflowRunId;

  /// The workflow run properties which were set during the run.
  final Map<String, String>? workflowRunProperties;

  WorkflowRun({
    this.completedOn,
    this.errorMessage,
    this.graph,
    this.name,
    this.previousRunId,
    this.startedOn,
    this.statistics,
    this.status,
    this.workflowRunId,
    this.workflowRunProperties,
  });

  factory WorkflowRun.fromJson(Map<String, dynamic> json) {
    return WorkflowRun(
      completedOn: timeStampFromJson(json['CompletedOn']),
      errorMessage: json['ErrorMessage'] as String?,
      graph: json['Graph'] != null
          ? WorkflowGraph.fromJson(json['Graph'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      previousRunId: json['PreviousRunId'] as String?,
      startedOn: timeStampFromJson(json['StartedOn']),
      statistics: json['Statistics'] != null
          ? WorkflowRunStatistics.fromJson(
              json['Statistics'] as Map<String, dynamic>)
          : null,
      status: (json['Status'] as String?)?.toWorkflowRunStatus(),
      workflowRunId: json['WorkflowRunId'] as String?,
      workflowRunProperties:
          (json['WorkflowRunProperties'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final completedOn = this.completedOn;
    final errorMessage = this.errorMessage;
    final graph = this.graph;
    final name = this.name;
    final previousRunId = this.previousRunId;
    final startedOn = this.startedOn;
    final statistics = this.statistics;
    final status = this.status;
    final workflowRunId = this.workflowRunId;
    final workflowRunProperties = this.workflowRunProperties;
    return {
      if (completedOn != null) 'CompletedOn': unixTimestampToJson(completedOn),
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (graph != null) 'Graph': graph,
      if (name != null) 'Name': name,
      if (previousRunId != null) 'PreviousRunId': previousRunId,
      if (startedOn != null) 'StartedOn': unixTimestampToJson(startedOn),
      if (statistics != null) 'Statistics': statistics,
      if (status != null) 'Status': status.toValue(),
      if (workflowRunId != null) 'WorkflowRunId': workflowRunId,
      if (workflowRunProperties != null)
        'WorkflowRunProperties': workflowRunProperties,
    };
  }
}

/// Workflow run statistics provides statistics about the workflow run.
class WorkflowRunStatistics {
  /// Total number of Actions that have failed.
  final int? failedActions;

  /// Total number Actions in running state.
  final int? runningActions;

  /// Total number of Actions that have stopped.
  final int? stoppedActions;

  /// Total number of Actions that have succeeded.
  final int? succeededActions;

  /// Total number of Actions that timed out.
  final int? timeoutActions;

  /// Total number of Actions in the workflow run.
  final int? totalActions;

  WorkflowRunStatistics({
    this.failedActions,
    this.runningActions,
    this.stoppedActions,
    this.succeededActions,
    this.timeoutActions,
    this.totalActions,
  });

  factory WorkflowRunStatistics.fromJson(Map<String, dynamic> json) {
    return WorkflowRunStatistics(
      failedActions: json['FailedActions'] as int?,
      runningActions: json['RunningActions'] as int?,
      stoppedActions: json['StoppedActions'] as int?,
      succeededActions: json['SucceededActions'] as int?,
      timeoutActions: json['TimeoutActions'] as int?,
      totalActions: json['TotalActions'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final failedActions = this.failedActions;
    final runningActions = this.runningActions;
    final stoppedActions = this.stoppedActions;
    final succeededActions = this.succeededActions;
    final timeoutActions = this.timeoutActions;
    final totalActions = this.totalActions;
    return {
      if (failedActions != null) 'FailedActions': failedActions,
      if (runningActions != null) 'RunningActions': runningActions,
      if (stoppedActions != null) 'StoppedActions': stoppedActions,
      if (succeededActions != null) 'SucceededActions': succeededActions,
      if (timeoutActions != null) 'TimeoutActions': timeoutActions,
      if (totalActions != null) 'TotalActions': totalActions,
    };
  }
}

enum WorkflowRunStatus {
  running,
  completed,
  stopping,
  stopped,
  error,
}

extension on WorkflowRunStatus {
  String toValue() {
    switch (this) {
      case WorkflowRunStatus.running:
        return 'RUNNING';
      case WorkflowRunStatus.completed:
        return 'COMPLETED';
      case WorkflowRunStatus.stopping:
        return 'STOPPING';
      case WorkflowRunStatus.stopped:
        return 'STOPPED';
      case WorkflowRunStatus.error:
        return 'ERROR';
    }
  }
}

extension on String {
  WorkflowRunStatus toWorkflowRunStatus() {
    switch (this) {
      case 'RUNNING':
        return WorkflowRunStatus.running;
      case 'COMPLETED':
        return WorkflowRunStatus.completed;
      case 'STOPPING':
        return WorkflowRunStatus.stopping;
      case 'STOPPED':
        return WorkflowRunStatus.stopped;
      case 'ERROR':
        return WorkflowRunStatus.error;
    }
    throw Exception('$this is not known in enum WorkflowRunStatus');
  }
}

/// A classifier for <code>XML</code> content.
class XMLClassifier {
  /// An identifier of the data format that the classifier matches.
  final String classification;

  /// The name of the classifier.
  final String name;

  /// The time that this classifier was registered.
  final DateTime? creationTime;

  /// The time that this classifier was last updated.
  final DateTime? lastUpdated;

  /// The XML tag designating the element that contains each record in an XML
  /// document being parsed. This can't identify a self-closing element (closed by
  /// <code>/&gt;</code>). An empty row element that contains only attributes can
  /// be parsed as long as it ends with a closing tag (for example, <code>&lt;row
  /// item_a="A" item_b="B"&gt;&lt;/row&gt;</code> is okay, but <code>&lt;row
  /// item_a="A" item_b="B" /&gt;</code> is not).
  final String? rowTag;

  /// The version of this classifier.
  final int? version;

  XMLClassifier({
    required this.classification,
    required this.name,
    this.creationTime,
    this.lastUpdated,
    this.rowTag,
    this.version,
  });

  factory XMLClassifier.fromJson(Map<String, dynamic> json) {
    return XMLClassifier(
      classification: json['Classification'] as String,
      name: json['Name'] as String,
      creationTime: timeStampFromJson(json['CreationTime']),
      lastUpdated: timeStampFromJson(json['LastUpdated']),
      rowTag: json['RowTag'] as String?,
      version: json['Version'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final classification = this.classification;
    final name = this.name;
    final creationTime = this.creationTime;
    final lastUpdated = this.lastUpdated;
    final rowTag = this.rowTag;
    final version = this.version;
    return {
      'Classification': classification,
      'Name': name,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (lastUpdated != null) 'LastUpdated': unixTimestampToJson(lastUpdated),
      if (rowTag != null) 'RowTag': rowTag,
      if (version != null) 'Version': version,
    };
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class AlreadyExistsException extends _s.GenericAwsException {
  AlreadyExistsException({String? type, String? message})
      : super(type: type, code: 'AlreadyExistsException', message: message);
}

class ConcurrentModificationException extends _s.GenericAwsException {
  ConcurrentModificationException({String? type, String? message})
      : super(
            type: type,
            code: 'ConcurrentModificationException',
            message: message);
}

class ConcurrentRunsExceededException extends _s.GenericAwsException {
  ConcurrentRunsExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ConcurrentRunsExceededException',
            message: message);
}

class ConditionCheckFailureException extends _s.GenericAwsException {
  ConditionCheckFailureException({String? type, String? message})
      : super(
            type: type,
            code: 'ConditionCheckFailureException',
            message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class CrawlerNotRunningException extends _s.GenericAwsException {
  CrawlerNotRunningException({String? type, String? message})
      : super(type: type, code: 'CrawlerNotRunningException', message: message);
}

class CrawlerRunningException extends _s.GenericAwsException {
  CrawlerRunningException({String? type, String? message})
      : super(type: type, code: 'CrawlerRunningException', message: message);
}

class CrawlerStoppingException extends _s.GenericAwsException {
  CrawlerStoppingException({String? type, String? message})
      : super(type: type, code: 'CrawlerStoppingException', message: message);
}

class EntityNotFoundException extends _s.GenericAwsException {
  EntityNotFoundException({String? type, String? message})
      : super(type: type, code: 'EntityNotFoundException', message: message);
}

class GlueEncryptionException extends _s.GenericAwsException {
  GlueEncryptionException({String? type, String? message})
      : super(type: type, code: 'GlueEncryptionException', message: message);
}

class IdempotentParameterMismatchException extends _s.GenericAwsException {
  IdempotentParameterMismatchException({String? type, String? message})
      : super(
            type: type,
            code: 'IdempotentParameterMismatchException',
            message: message);
}

class IllegalWorkflowStateException extends _s.GenericAwsException {
  IllegalWorkflowStateException({String? type, String? message})
      : super(
            type: type,
            code: 'IllegalWorkflowStateException',
            message: message);
}

class InternalServiceException extends _s.GenericAwsException {
  InternalServiceException({String? type, String? message})
      : super(type: type, code: 'InternalServiceException', message: message);
}

class InvalidInputException extends _s.GenericAwsException {
  InvalidInputException({String? type, String? message})
      : super(type: type, code: 'InvalidInputException', message: message);
}

class MLTransformNotReadyException extends _s.GenericAwsException {
  MLTransformNotReadyException({String? type, String? message})
      : super(
            type: type, code: 'MLTransformNotReadyException', message: message);
}

class NoScheduleException extends _s.GenericAwsException {
  NoScheduleException({String? type, String? message})
      : super(type: type, code: 'NoScheduleException', message: message);
}

class OperationTimeoutException extends _s.GenericAwsException {
  OperationTimeoutException({String? type, String? message})
      : super(type: type, code: 'OperationTimeoutException', message: message);
}

class ResourceNumberLimitExceededException extends _s.GenericAwsException {
  ResourceNumberLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceNumberLimitExceededException',
            message: message);
}

class SchedulerNotRunningException extends _s.GenericAwsException {
  SchedulerNotRunningException({String? type, String? message})
      : super(
            type: type, code: 'SchedulerNotRunningException', message: message);
}

class SchedulerRunningException extends _s.GenericAwsException {
  SchedulerRunningException({String? type, String? message})
      : super(type: type, code: 'SchedulerRunningException', message: message);
}

class SchedulerTransitioningException extends _s.GenericAwsException {
  SchedulerTransitioningException({String? type, String? message})
      : super(
            type: type,
            code: 'SchedulerTransitioningException',
            message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

class VersionMismatchException extends _s.GenericAwsException {
  VersionMismatchException({String? type, String? message})
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
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
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
  'IllegalWorkflowStateException': (type, message) =>
      IllegalWorkflowStateException(type: type, message: message),
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
