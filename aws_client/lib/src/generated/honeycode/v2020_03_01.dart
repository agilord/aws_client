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

/// Amazon Honeycode is a fully managed service that allows you to quickly build
/// mobile and web apps for teams—without programming. Build Honeycode apps for
/// managing almost anything, like projects, customers, operations, approvals,
/// resources, and even your team.
class Honeycode {
  final _s.RestJsonProtocol _protocol;
  Honeycode({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'honeycode',
            signingName: 'honeycode',
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

  /// The BatchCreateTableRows API allows you to create one or more rows at the
  /// end of a table in a workbook. The API allows you to specify the values to
  /// set in some or all of the columns in the new rows.
  ///
  /// If a column is not explicitly set in a specific row, then the column level
  /// formula specified in the table will be applied to the new row. If there is
  /// no column level formula but the last row of the table has a formula, then
  /// that formula will be copied down to the new row. If there is no column
  /// level formula and no formula in the last row of the table, then that
  /// column will be left blank for the new rows.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [rowsToCreate] :
  /// The list of rows to create at the end of the table. Each item in this list
  /// needs to have a batch item id to uniquely identify the element in the
  /// request and the cells to create for that row. You need to specify at least
  /// one item in this list.
  ///
  /// Note that if one of the column ids in any of the rows in the request does
  /// not exist in the table, then the request fails and no updates are made to
  /// the table.
  ///
  /// Parameter [tableId] :
  /// The ID of the table where the new rows are being added.
  ///
  /// If a table with the specified ID could not be found, this API throws
  /// ResourceNotFoundException.
  ///
  /// Parameter [workbookId] :
  /// The ID of the workbook where the new rows are being added.
  ///
  /// If a workbook with the specified ID could not be found, this API throws
  /// ResourceNotFoundException.
  ///
  /// Parameter [clientRequestToken] :
  /// The request token for performing the batch create operation. Request
  /// tokens help to identify duplicate requests. If a call times out or fails
  /// due to a transient error like a failed network connection, you can retry
  /// the call with the same request token. The service ensures that if the
  /// first call using that request token is successfully performed, the second
  /// call will not perform the operation again.
  ///
  /// Note that request tokens are valid only for a few minutes. You cannot use
  /// request tokens to dedupe requests spanning hours or days.
  Future<BatchCreateTableRowsResult> batchCreateTableRows({
    required List<CreateRowData> rowsToCreate,
    required String tableId,
    required String workbookId,
    String? clientRequestToken,
  }) async {
    final $payload = <String, dynamic>{
      'rowsToCreate': rowsToCreate,
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/workbooks/${Uri.encodeComponent(workbookId)}/tables/${Uri.encodeComponent(tableId)}/rows/batchcreate',
      exceptionFnMap: _exceptionFns,
    );
    return BatchCreateTableRowsResult.fromJson(response);
  }

  /// The BatchDeleteTableRows API allows you to delete one or more rows from a
  /// table in a workbook. You need to specify the ids of the rows that you want
  /// to delete from the table.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ValidationException].
  /// May throw [RequestTimeoutException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [rowIds] :
  /// The list of row ids to delete from the table. You need to specify at least
  /// one row id in this list.
  ///
  /// Note that if one of the row ids provided in the request does not exist in
  /// the table, then the request fails and no rows are deleted from the table.
  ///
  /// Parameter [tableId] :
  /// The ID of the table where the rows are being deleted.
  ///
  /// If a table with the specified id could not be found, this API throws
  /// ResourceNotFoundException.
  ///
  /// Parameter [workbookId] :
  /// The ID of the workbook where the rows are being deleted.
  ///
  /// If a workbook with the specified id could not be found, this API throws
  /// ResourceNotFoundException.
  ///
  /// Parameter [clientRequestToken] :
  /// The request token for performing the delete action. Request tokens help to
  /// identify duplicate requests. If a call times out or fails due to a
  /// transient error like a failed network connection, you can retry the call
  /// with the same request token. The service ensures that if the first call
  /// using that request token is successfully performed, the second call will
  /// not perform the action again.
  ///
  /// Note that request tokens are valid only for a few minutes. You cannot use
  /// request tokens to dedupe requests spanning hours or days.
  Future<BatchDeleteTableRowsResult> batchDeleteTableRows({
    required List<String> rowIds,
    required String tableId,
    required String workbookId,
    String? clientRequestToken,
  }) async {
    final $payload = <String, dynamic>{
      'rowIds': rowIds,
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/workbooks/${Uri.encodeComponent(workbookId)}/tables/${Uri.encodeComponent(tableId)}/rows/batchdelete',
      exceptionFnMap: _exceptionFns,
    );
    return BatchDeleteTableRowsResult.fromJson(response);
  }

  /// The BatchUpdateTableRows API allows you to update one or more rows in a
  /// table in a workbook.
  ///
  /// You can specify the values to set in some or all of the columns in the
  /// table for the specified rows. If a column is not explicitly specified in a
  /// particular row, then that column will not be updated for that row. To
  /// clear out the data in a specific cell, you need to set the value as an
  /// empty string ("").
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ValidationException].
  /// May throw [RequestTimeoutException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [rowsToUpdate] :
  /// The list of rows to update in the table. Each item in this list needs to
  /// contain the row id to update along with the map of column id to cell
  /// values for each column in that row that needs to be updated. You need to
  /// specify at least one row in this list, and for each row, you need to
  /// specify at least one column to update.
  ///
  /// Note that if one of the row or column ids in the request does not exist in
  /// the table, then the request fails and no updates are made to the table.
  ///
  /// Parameter [tableId] :
  /// The ID of the table where the rows are being updated.
  ///
  /// If a table with the specified id could not be found, this API throws
  /// ResourceNotFoundException.
  ///
  /// Parameter [workbookId] :
  /// The ID of the workbook where the rows are being updated.
  ///
  /// If a workbook with the specified id could not be found, this API throws
  /// ResourceNotFoundException.
  ///
  /// Parameter [clientRequestToken] :
  /// The request token for performing the update action. Request tokens help to
  /// identify duplicate requests. If a call times out or fails due to a
  /// transient error like a failed network connection, you can retry the call
  /// with the same request token. The service ensures that if the first call
  /// using that request token is successfully performed, the second call will
  /// not perform the action again.
  ///
  /// Note that request tokens are valid only for a few minutes. You cannot use
  /// request tokens to dedupe requests spanning hours or days.
  Future<BatchUpdateTableRowsResult> batchUpdateTableRows({
    required List<UpdateRowData> rowsToUpdate,
    required String tableId,
    required String workbookId,
    String? clientRequestToken,
  }) async {
    final $payload = <String, dynamic>{
      'rowsToUpdate': rowsToUpdate,
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/workbooks/${Uri.encodeComponent(workbookId)}/tables/${Uri.encodeComponent(tableId)}/rows/batchupdate',
      exceptionFnMap: _exceptionFns,
    );
    return BatchUpdateTableRowsResult.fromJson(response);
  }

  /// The BatchUpsertTableRows API allows you to upsert one or more rows in a
  /// table. The upsert operation takes a filter expression as input and
  /// evaluates it to find matching rows on the destination table. If matching
  /// rows are found, it will update the cells in the matching rows to new
  /// values specified in the request. If no matching rows are found, a new row
  /// is added at the end of the table and the cells in that row are set to the
  /// new values specified in the request.
  ///
  /// You can specify the values to set in some or all of the columns in the
  /// table for the matching or newly appended rows. If a column is not
  /// explicitly specified for a particular row, then that column will not be
  /// updated for that row. To clear out the data in a specific cell, you need
  /// to set the value as an empty string ("").
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [rowsToUpsert] :
  /// The list of rows to upsert in the table. Each item in this list needs to
  /// have a batch item id to uniquely identify the element in the request, a
  /// filter expression to find the rows to update for that element and the cell
  /// values to set for each column in the upserted rows. You need to specify at
  /// least one item in this list.
  ///
  /// Note that if one of the filter formulas in the request fails to evaluate
  /// because of an error or one of the column ids in any of the rows does not
  /// exist in the table, then the request fails and no updates are made to the
  /// table.
  ///
  /// Parameter [tableId] :
  /// The ID of the table where the rows are being upserted.
  ///
  /// If a table with the specified id could not be found, this API throws
  /// ResourceNotFoundException.
  ///
  /// Parameter [workbookId] :
  /// The ID of the workbook where the rows are being upserted.
  ///
  /// If a workbook with the specified id could not be found, this API throws
  /// ResourceNotFoundException.
  ///
  /// Parameter [clientRequestToken] :
  /// The request token for performing the update action. Request tokens help to
  /// identify duplicate requests. If a call times out or fails due to a
  /// transient error like a failed network connection, you can retry the call
  /// with the same request token. The service ensures that if the first call
  /// using that request token is successfully performed, the second call will
  /// not perform the action again.
  ///
  /// Note that request tokens are valid only for a few minutes. You cannot use
  /// request tokens to dedupe requests spanning hours or days.
  Future<BatchUpsertTableRowsResult> batchUpsertTableRows({
    required List<UpsertRowData> rowsToUpsert,
    required String tableId,
    required String workbookId,
    String? clientRequestToken,
  }) async {
    final $payload = <String, dynamic>{
      'rowsToUpsert': rowsToUpsert,
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/workbooks/${Uri.encodeComponent(workbookId)}/tables/${Uri.encodeComponent(tableId)}/rows/batchupsert',
      exceptionFnMap: _exceptionFns,
    );
    return BatchUpsertTableRowsResult.fromJson(response);
  }

  /// The DescribeTableDataImportJob API allows you to retrieve the status and
  /// details of a table data import job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [jobId] :
  /// The ID of the job that was returned by the StartTableDataImportJob
  /// request.
  ///
  /// If a job with the specified id could not be found, this API throws
  /// ResourceNotFoundException.
  ///
  /// Parameter [tableId] :
  /// The ID of the table into which data was imported.
  ///
  /// If a table with the specified id could not be found, this API throws
  /// ResourceNotFoundException.
  ///
  /// Parameter [workbookId] :
  /// The ID of the workbook into which data was imported.
  ///
  /// If a workbook with the specified id could not be found, this API throws
  /// ResourceNotFoundException.
  Future<DescribeTableDataImportJobResult> describeTableDataImportJob({
    required String jobId,
    required String tableId,
    required String workbookId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/workbooks/${Uri.encodeComponent(workbookId)}/tables/${Uri.encodeComponent(tableId)}/import/${Uri.encodeComponent(jobId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeTableDataImportJobResult.fromJson(response);
  }

  /// The GetScreenData API allows retrieval of data from a screen in a
  /// Honeycode app. The API allows setting local variables in the screen to
  /// filter, sort or otherwise affect what will be displayed on the screen.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [appId] :
  /// The ID of the app that contains the screen.
  ///
  /// Parameter [screenId] :
  /// The ID of the screen.
  ///
  /// Parameter [workbookId] :
  /// The ID of the workbook that contains the screen.
  ///
  /// Parameter [maxResults] :
  /// The number of results to be returned on a single page. Specify a number
  /// between 1 and 100. The maximum value is 100.
  ///
  /// This parameter is optional. If you don't specify this parameter, the
  /// default page size is 100.
  ///
  /// Parameter [nextToken] :
  /// This parameter is optional. If a nextToken is not specified, the API
  /// returns the first page of data.
  ///
  /// Pagination tokens expire after 1 hour. If you use a token that was
  /// returned more than an hour back, the API will throw ValidationException.
  ///
  /// Parameter [variables] :
  /// Variables are optional and are needed only if the screen requires them to
  /// render correctly. Variables are specified as a map where the key is the
  /// name of the variable as defined on the screen. The value is an object
  /// which currently has only one property, rawValue, which holds the value of
  /// the variable to be passed to the screen.
  Future<GetScreenDataResult> getScreenData({
    required String appId,
    required String screenId,
    required String workbookId,
    int? maxResults,
    String? nextToken,
    Map<String, VariableValue>? variables,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      'appId': appId,
      'screenId': screenId,
      'workbookId': workbookId,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (variables != null) 'variables': variables,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/screendata',
      exceptionFnMap: _exceptionFns,
    );
    return GetScreenDataResult.fromJson(response);
  }

  /// The InvokeScreenAutomation API allows invoking an action defined in a
  /// screen in a Honeycode app. The API allows setting local variables, which
  /// can then be used in the automation being invoked. This allows automating
  /// the Honeycode app interactions to write, update or delete data in the
  /// workbook.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceUnavailableException].
  /// May throw [AutomationExecutionException].
  /// May throw [AutomationExecutionTimeoutException].
  /// May throw [RequestTimeoutException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [appId] :
  /// The ID of the app that contains the screen automation.
  ///
  /// Parameter [screenAutomationId] :
  /// The ID of the automation action to be performed.
  ///
  /// Parameter [screenId] :
  /// The ID of the screen that contains the screen automation.
  ///
  /// Parameter [workbookId] :
  /// The ID of the workbook that contains the screen automation.
  ///
  /// Parameter [clientRequestToken] :
  /// The request token for performing the automation action. Request tokens
  /// help to identify duplicate requests. If a call times out or fails due to a
  /// transient error like a failed network connection, you can retry the call
  /// with the same request token. The service ensures that if the first call
  /// using that request token is successfully performed, the second call will
  /// return the response of the previous call rather than performing the action
  /// again.
  ///
  /// Note that request tokens are valid only for a few minutes. You cannot use
  /// request tokens to dedupe requests spanning hours or days.
  ///
  /// Parameter [rowId] :
  /// The row ID for the automation if the automation is defined inside a block
  /// with source or list.
  ///
  /// Parameter [variables] :
  /// Variables are specified as a map where the key is the name of the variable
  /// as defined on the screen. The value is an object which currently has only
  /// one property, rawValue, which holds the value of the variable to be passed
  /// to the screen. Any variables defined in a screen are required to be passed
  /// in the call.
  Future<InvokeScreenAutomationResult> invokeScreenAutomation({
    required String appId,
    required String screenAutomationId,
    required String screenId,
    required String workbookId,
    String? clientRequestToken,
    String? rowId,
    Map<String, VariableValue>? variables,
  }) async {
    final $payload = <String, dynamic>{
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
      if (rowId != null) 'rowId': rowId,
      if (variables != null) 'variables': variables,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/workbooks/${Uri.encodeComponent(workbookId)}/apps/${Uri.encodeComponent(appId)}/screens/${Uri.encodeComponent(screenId)}/automations/${Uri.encodeComponent(screenAutomationId)}',
      exceptionFnMap: _exceptionFns,
    );
    return InvokeScreenAutomationResult.fromJson(response);
  }

  /// The ListTableColumns API allows you to retrieve a list of all the columns
  /// in a table in a workbook.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [tableId] :
  /// The ID of the table whose columns are being retrieved.
  ///
  /// If a table with the specified id could not be found, this API throws
  /// ResourceNotFoundException.
  ///
  /// Parameter [workbookId] :
  /// The ID of the workbook that contains the table whose columns are being
  /// retrieved.
  ///
  /// If a workbook with the specified id could not be found, this API throws
  /// ResourceNotFoundException.
  ///
  /// Parameter [nextToken] :
  /// This parameter is optional. If a nextToken is not specified, the API
  /// returns the first page of data.
  ///
  /// Pagination tokens expire after 1 hour. If you use a token that was
  /// returned more than an hour back, the API will throw ValidationException.
  Future<ListTableColumnsResult> listTableColumns({
    required String tableId,
    required String workbookId,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/workbooks/${Uri.encodeComponent(workbookId)}/tables/${Uri.encodeComponent(tableId)}/columns',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTableColumnsResult.fromJson(response);
  }

  /// The ListTableRows API allows you to retrieve a list of all the rows in a
  /// table in a workbook.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ValidationException].
  /// May throw [RequestTimeoutException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [tableId] :
  /// The ID of the table whose rows are being retrieved.
  ///
  /// If a table with the specified id could not be found, this API throws
  /// ResourceNotFoundException.
  ///
  /// Parameter [workbookId] :
  /// The ID of the workbook that contains the table whose rows are being
  /// retrieved.
  ///
  /// If a workbook with the specified id could not be found, this API throws
  /// ResourceNotFoundException.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of rows to return in each page of the results.
  ///
  /// Parameter [nextToken] :
  /// This parameter is optional. If a nextToken is not specified, the API
  /// returns the first page of data.
  ///
  /// Pagination tokens expire after 1 hour. If you use a token that was
  /// returned more than an hour back, the API will throw ValidationException.
  ///
  /// Parameter [rowIds] :
  /// This parameter is optional. If one or more row ids are specified in this
  /// list, then only the specified row ids are returned in the result. If no
  /// row ids are specified here, then all the rows in the table are returned.
  Future<ListTableRowsResult> listTableRows({
    required String tableId,
    required String workbookId,
    int? maxResults,
    String? nextToken,
    List<String>? rowIds,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (rowIds != null) 'rowIds': rowIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/workbooks/${Uri.encodeComponent(workbookId)}/tables/${Uri.encodeComponent(tableId)}/rows/list',
      exceptionFnMap: _exceptionFns,
    );
    return ListTableRowsResult.fromJson(response);
  }

  /// The ListTables API allows you to retrieve a list of all the tables in a
  /// workbook.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [workbookId] :
  /// The ID of the workbook whose tables are being retrieved.
  ///
  /// If a workbook with the specified id could not be found, this API throws
  /// ResourceNotFoundException.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of tables to return in each page of the results.
  ///
  /// Parameter [nextToken] :
  /// This parameter is optional. If a nextToken is not specified, the API
  /// returns the first page of data.
  ///
  /// Pagination tokens expire after 1 hour. If you use a token that was
  /// returned more than an hour back, the API will throw ValidationException.
  Future<ListTablesResult> listTables({
    required String workbookId,
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
      requestUri: '/workbooks/${Uri.encodeComponent(workbookId)}/tables',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTablesResult.fromJson(response);
  }

  /// The ListTagsForResource API allows you to return a resource's tags.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The resource's Amazon Resource Name (ARN).
  Future<ListTagsForResourceResult> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResult.fromJson(response);
  }

  /// The QueryTableRows API allows you to use a filter formula to query for
  /// specific rows in a table.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filterFormula] :
  /// An object that represents a filter formula along with the id of the
  /// context row under which the filter function needs to evaluate.
  ///
  /// Parameter [tableId] :
  /// The ID of the table whose rows are being queried.
  ///
  /// If a table with the specified id could not be found, this API throws
  /// ResourceNotFoundException.
  ///
  /// Parameter [workbookId] :
  /// The ID of the workbook whose table rows are being queried.
  ///
  /// If a workbook with the specified id could not be found, this API throws
  /// ResourceNotFoundException.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of rows to return in each page of the results.
  ///
  /// Parameter [nextToken] :
  /// This parameter is optional. If a nextToken is not specified, the API
  /// returns the first page of data.
  ///
  /// Pagination tokens expire after 1 hour. If you use a token that was
  /// returned more than an hour back, the API will throw ValidationException.
  Future<QueryTableRowsResult> queryTableRows({
    required Filter filterFormula,
    required String tableId,
    required String workbookId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      'filterFormula': filterFormula,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/workbooks/${Uri.encodeComponent(workbookId)}/tables/${Uri.encodeComponent(tableId)}/rows/query',
      exceptionFnMap: _exceptionFns,
    );
    return QueryTableRowsResult.fromJson(response);
  }

  /// The StartTableDataImportJob API allows you to start an import job on a
  /// table. This API will only return the id of the job that was started. To
  /// find out the status of the import request, you need to call the
  /// DescribeTableDataImportJob API.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [RequestTimeoutException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [clientRequestToken] :
  /// The request token for performing the update action. Request tokens help to
  /// identify duplicate requests. If a call times out or fails due to a
  /// transient error like a failed network connection, you can retry the call
  /// with the same request token. The service ensures that if the first call
  /// using that request token is successfully performed, the second call will
  /// not perform the action again.
  ///
  /// Note that request tokens are valid only for a few minutes. You cannot use
  /// request tokens to dedupe requests spanning hours or days.
  ///
  /// Parameter [dataFormat] :
  /// The format of the data that is being imported. Currently the only option
  /// supported is "DELIMITED_TEXT".
  ///
  /// Parameter [dataSource] :
  /// The source of the data that is being imported. The size of source must be
  /// no larger than 100 MB. Source must have no more than 100,000 cells and no
  /// more than 1,000 rows.
  ///
  /// Parameter [destinationTableId] :
  /// The ID of the table where the rows are being imported.
  ///
  /// If a table with the specified id could not be found, this API throws
  /// ResourceNotFoundException.
  ///
  /// Parameter [importOptions] :
  /// The options for customizing this import request.
  ///
  /// Parameter [workbookId] :
  /// The ID of the workbook where the rows are being imported.
  ///
  /// If a workbook with the specified id could not be found, this API throws
  /// ResourceNotFoundException.
  Future<StartTableDataImportJobResult> startTableDataImportJob({
    required String clientRequestToken,
    required ImportSourceDataFormat dataFormat,
    required ImportDataSource dataSource,
    required String destinationTableId,
    required ImportOptions importOptions,
    required String workbookId,
  }) async {
    final $payload = <String, dynamic>{
      'clientRequestToken': clientRequestToken,
      'dataFormat': dataFormat.toValue(),
      'dataSource': dataSource,
      'importOptions': importOptions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/workbooks/${Uri.encodeComponent(workbookId)}/tables/${Uri.encodeComponent(destinationTableId)}/import',
      exceptionFnMap: _exceptionFns,
    );
    return StartTableDataImportJobResult.fromJson(response);
  }

  /// The TagResource API allows you to add tags to an ARN-able resource.
  /// Resource includes workbook, table, screen and screen-automation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The resource's Amazon Resource Name (ARN).
  ///
  /// Parameter [tags] :
  /// A list of tags to apply to the resource.
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

  /// The UntagResource API allows you to removes tags from an ARN-able
  /// resource. Resource includes workbook, table, screen and screen-automation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The resource's Amazon Resource Name (ARN).
  ///
  /// Parameter [tagKeys] :
  /// A list of tag keys to remove from the resource.
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
}

class BatchCreateTableRowsResult {
  /// The map of batch item id to the row id that was created for that item.
  final Map<String, String> createdRows;

  /// The updated workbook cursor after adding the new rows at the end of the
  /// table.
  final int workbookCursor;

  /// The list of batch items in the request that could not be added to the table.
  /// Each element in this list contains one item from the request that could not
  /// be added to the table along with the reason why that item could not be
  /// added.
  final List<FailedBatchItem>? failedBatchItems;

  BatchCreateTableRowsResult({
    required this.createdRows,
    required this.workbookCursor,
    this.failedBatchItems,
  });

  factory BatchCreateTableRowsResult.fromJson(Map<String, dynamic> json) {
    return BatchCreateTableRowsResult(
      createdRows: (json['createdRows'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
      workbookCursor: json['workbookCursor'] as int,
      failedBatchItems: (json['failedBatchItems'] as List?)
          ?.whereNotNull()
          .map((e) => FailedBatchItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdRows = this.createdRows;
    final workbookCursor = this.workbookCursor;
    final failedBatchItems = this.failedBatchItems;
    return {
      'createdRows': createdRows,
      'workbookCursor': workbookCursor,
      if (failedBatchItems != null) 'failedBatchItems': failedBatchItems,
    };
  }
}

class BatchDeleteTableRowsResult {
  /// The updated workbook cursor after deleting the rows from the table.
  final int workbookCursor;

  /// The list of row ids in the request that could not be deleted from the table.
  /// Each element in this list contains one row id from the request that could
  /// not be deleted along with the reason why that item could not be deleted.
  final List<FailedBatchItem>? failedBatchItems;

  BatchDeleteTableRowsResult({
    required this.workbookCursor,
    this.failedBatchItems,
  });

  factory BatchDeleteTableRowsResult.fromJson(Map<String, dynamic> json) {
    return BatchDeleteTableRowsResult(
      workbookCursor: json['workbookCursor'] as int,
      failedBatchItems: (json['failedBatchItems'] as List?)
          ?.whereNotNull()
          .map((e) => FailedBatchItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final workbookCursor = this.workbookCursor;
    final failedBatchItems = this.failedBatchItems;
    return {
      'workbookCursor': workbookCursor,
      if (failedBatchItems != null) 'failedBatchItems': failedBatchItems,
    };
  }
}

class BatchUpdateTableRowsResult {
  /// The updated workbook cursor after adding the new rows at the end of the
  /// table.
  final int workbookCursor;

  /// The list of batch items in the request that could not be updated in the
  /// table. Each element in this list contains one item from the request that
  /// could not be updated in the table along with the reason why that item could
  /// not be updated.
  final List<FailedBatchItem>? failedBatchItems;

  BatchUpdateTableRowsResult({
    required this.workbookCursor,
    this.failedBatchItems,
  });

  factory BatchUpdateTableRowsResult.fromJson(Map<String, dynamic> json) {
    return BatchUpdateTableRowsResult(
      workbookCursor: json['workbookCursor'] as int,
      failedBatchItems: (json['failedBatchItems'] as List?)
          ?.whereNotNull()
          .map((e) => FailedBatchItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final workbookCursor = this.workbookCursor;
    final failedBatchItems = this.failedBatchItems;
    return {
      'workbookCursor': workbookCursor,
      if (failedBatchItems != null) 'failedBatchItems': failedBatchItems,
    };
  }
}

class BatchUpsertTableRowsResult {
  /// A map with the batch item id as the key and the result of the upsert
  /// operation as the value. The result of the upsert operation specifies whether
  /// existing rows were updated or a new row was appended, along with the list of
  /// row ids that were affected.
  final Map<String, UpsertRowsResult> rows;

  /// The updated workbook cursor after updating or appending rows in the table.
  final int workbookCursor;

  /// The list of batch items in the request that could not be updated or appended
  /// in the table. Each element in this list contains one item from the request
  /// that could not be updated in the table along with the reason why that item
  /// could not be updated or appended.
  final List<FailedBatchItem>? failedBatchItems;

  BatchUpsertTableRowsResult({
    required this.rows,
    required this.workbookCursor,
    this.failedBatchItems,
  });

  factory BatchUpsertTableRowsResult.fromJson(Map<String, dynamic> json) {
    return BatchUpsertTableRowsResult(
      rows: (json['rows'] as Map<String, dynamic>).map((k, e) =>
          MapEntry(k, UpsertRowsResult.fromJson(e as Map<String, dynamic>))),
      workbookCursor: json['workbookCursor'] as int,
      failedBatchItems: (json['failedBatchItems'] as List?)
          ?.whereNotNull()
          .map((e) => FailedBatchItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final rows = this.rows;
    final workbookCursor = this.workbookCursor;
    final failedBatchItems = this.failedBatchItems;
    return {
      'rows': rows,
      'workbookCursor': workbookCursor,
      if (failedBatchItems != null) 'failedBatchItems': failedBatchItems,
    };
  }
}

/// An object that represents a single cell in a table.
class Cell {
  /// The format of the cell. If this field is empty, then the format is either
  /// not specified in the workbook or the format is set to AUTO.
  final Format? format;

  /// The formatted value of the cell. This is the value that you see displayed in
  /// the cell in the UI.
  ///
  /// Note that the formatted value of a cell is always represented as a string
  /// irrespective of the data that is stored in the cell. For example, if a cell
  /// contains a date, the formatted value of the cell is the string
  /// representation of the formatted date being shown in the cell in the UI. See
  /// details in the rawValue field below for how cells of different formats will
  /// have different raw and formatted values.
  final String? formattedValue;

  /// A list of formatted values of the cell. This field is only returned when the
  /// cell is ROWSET format (aka multi-select or multi-record picklist). Values in
  /// the list are always represented as strings. The formattedValue field will be
  /// empty if this field is returned.
  final List<String>? formattedValues;

  /// The formula contained in the cell. This field is empty if a cell does not
  /// have a formula.
  final String? formula;

  /// The raw value of the data contained in the cell. The raw value depends on
  /// the format of the data in the cell. However the attribute in the API return
  /// value is always a string containing the raw value.
  ///
  /// Cells with format DATE, DATE_TIME or TIME have the raw value as a floating
  /// point number where the whole number represents the number of days since
  /// 1/1/1900 and the fractional part represents the fraction of the day since
  /// midnight. For example, a cell with date 11/3/2020 has the raw value "44138".
  /// A cell with the time 9:00 AM has the raw value "0.375" and a cell with
  /// date/time value of 11/3/2020 9:00 AM has the raw value "44138.375". Notice
  /// that even though the raw value is a number in all three cases, it is still
  /// represented as a string.
  ///
  /// Cells with format NUMBER, CURRENCY, PERCENTAGE and ACCOUNTING have the raw
  /// value of the data as the number representing the data being displayed. For
  /// example, the number 1.325 with two decimal places in the format will have
  /// it's raw value as "1.325" and formatted value as "1.33". A currency value
  /// for $10 will have the raw value as "10" and formatted value as "$10.00". A
  /// value representing 20% with two decimal places in the format will have its
  /// raw value as "0.2" and the formatted value as "20.00%". An accounting value
  /// of -$25 will have "-25" as the raw value and "$ (25.00)" as the formatted
  /// value.
  ///
  /// Cells with format TEXT will have the raw text as the raw value. For example,
  /// a cell with text "John Smith" will have "John Smith" as both the raw value
  /// and the formatted value.
  ///
  /// Cells with format CONTACT will have the name of the contact as a formatted
  /// value and the email address of the contact as the raw value. For example, a
  /// contact for John Smith will have "John Smith" as the formatted value and
  /// "john.smith@example.com" as the raw value.
  ///
  /// Cells with format ROWLINK (aka picklist) will have the first column of the
  /// linked row as the formatted value and the row id of the linked row as the
  /// raw value. For example, a cell containing a picklist to a table that
  /// displays task status might have "Completed" as the formatted value and
  /// "row:dfcefaee-5b37-4355-8f28-40c3e4ff5dd4/ca432b2f-b8eb-431d-9fb5-cbe0342f9f03"
  /// as the raw value.
  ///
  /// Cells with format ROWSET (aka multi-select or multi-record picklist) will by
  /// default have the first column of each of the linked rows as the formatted
  /// value in the list, and the rowset id of the linked rows as the raw value.
  /// For example, a cell containing a multi-select picklist to a table that
  /// contains items might have "Item A", "Item B" in the formatted value list and
  /// "rows:b742c1f4-6cb0-4650-a845-35eb86fcc2bb/
  /// [fdea123b-8f68-474a-aa8a-5ff87aa333af,6daf41f0-a138-4eee-89da-123086d36ecf]"
  /// as the raw value.
  ///
  /// Cells with format ATTACHMENT will have the name of the attachment as the
  /// formatted value and the attachment id as the raw value. For example, a cell
  /// containing an attachment named "image.jpeg" will have "image.jpeg" as the
  /// formatted value and "attachment:ca432b2f-b8eb-431d-9fb5-cbe0342f9f03" as the
  /// raw value.
  ///
  /// Cells with format AUTO or cells without any format that are auto-detected as
  /// one of the formats above will contain the raw and formatted values as
  /// mentioned above, based on the auto-detected formats. If there is no
  /// auto-detected format, the raw and formatted values will be the same as the
  /// data in the cell.
  final String? rawValue;

  Cell({
    this.format,
    this.formattedValue,
    this.formattedValues,
    this.formula,
    this.rawValue,
  });

  factory Cell.fromJson(Map<String, dynamic> json) {
    return Cell(
      format: (json['format'] as String?)?.toFormat(),
      formattedValue: json['formattedValue'] as String?,
      formattedValues: (json['formattedValues'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      formula: json['formula'] as String?,
      rawValue: json['rawValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final format = this.format;
    final formattedValue = this.formattedValue;
    final formattedValues = this.formattedValues;
    final formula = this.formula;
    final rawValue = this.rawValue;
    return {
      if (format != null) 'format': format.toValue(),
      if (formattedValue != null) 'formattedValue': formattedValue,
      if (formattedValues != null) 'formattedValues': formattedValues,
      if (formula != null) 'formula': formula,
      if (rawValue != null) 'rawValue': rawValue,
    };
  }
}

/// CellInput object contains the data needed to create or update cells in a
/// table.
/// <note>
/// CellInput object has only a facts field or a fact field, but not both. A 400
/// bad request will be thrown if both fact and facts field are present.
/// </note>
class CellInput {
  /// Fact represents the data that is entered into a cell. This data can be free
  /// text or a formula. Formulas need to start with the equals (=) sign.
  final String? fact;

  /// A list representing the values that are entered into a ROWSET cell. Facts
  /// list can have either only values or rowIDs, and rowIDs should from the same
  /// table.
  final List<String>? facts;

  CellInput({
    this.fact,
    this.facts,
  });

  Map<String, dynamic> toJson() {
    final fact = this.fact;
    final facts = this.facts;
    return {
      if (fact != null) 'fact': fact,
      if (facts != null) 'facts': facts,
    };
  }
}

/// Metadata for column in the table.
class ColumnMetadata {
  /// The format of the column.
  final Format format;

  /// The name of the column.
  final String name;

  ColumnMetadata({
    required this.format,
    required this.name,
  });

  factory ColumnMetadata.fromJson(Map<String, dynamic> json) {
    return ColumnMetadata(
      format: (json['format'] as String).toFormat(),
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final format = this.format;
    final name = this.name;
    return {
      'format': format.toValue(),
      'name': name,
    };
  }
}

/// Data needed to create a single row in a table as part of the
/// BatchCreateTableRows request.
class CreateRowData {
  /// An external identifier that represents the single row that is being created
  /// as part of the BatchCreateTableRows request. This can be any string that you
  /// can use to identify the row in the request. The BatchCreateTableRows API
  /// puts the batch item id in the results to allow you to link data in the
  /// request to data in the results.
  final String batchItemId;

  /// A map representing the cells to create in the new row. The key is the column
  /// id of the cell and the value is the CellInput object that represents the
  /// data to set in that cell.
  final Map<String, CellInput> cellsToCreate;

  CreateRowData({
    required this.batchItemId,
    required this.cellsToCreate,
  });

  Map<String, dynamic> toJson() {
    final batchItemId = this.batchItemId;
    final cellsToCreate = this.cellsToCreate;
    return {
      'batchItemId': batchItemId,
      'cellsToCreate': cellsToCreate,
    };
  }
}

/// The data in a particular data cell defined on the screen.
class DataItem {
  /// The formatted value of the data. e.g. John Smith.
  final String? formattedValue;

  /// The overrideFormat is optional and is specified only if a particular row of
  /// data has a different format for the data than the default format defined on
  /// the screen or the table.
  final Format? overrideFormat;

  /// The raw value of the data. e.g. jsmith@example.com
  final String? rawValue;

  DataItem({
    this.formattedValue,
    this.overrideFormat,
    this.rawValue,
  });

  factory DataItem.fromJson(Map<String, dynamic> json) {
    return DataItem(
      formattedValue: json['formattedValue'] as String?,
      overrideFormat: (json['overrideFormat'] as String?)?.toFormat(),
      rawValue: json['rawValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final formattedValue = this.formattedValue;
    final overrideFormat = this.overrideFormat;
    final rawValue = this.rawValue;
    return {
      if (formattedValue != null) 'formattedValue': formattedValue,
      if (overrideFormat != null) 'overrideFormat': overrideFormat.toValue(),
      if (rawValue != null) 'rawValue': rawValue,
    };
  }
}

/// An object that contains the options relating to parsing delimited text as
/// part of an import request.
class DelimitedTextImportOptions {
  /// The delimiter to use for separating columns in a single row of the input.
  final String delimiter;

  /// The encoding of the data in the input file.
  final ImportDataCharacterEncoding? dataCharacterEncoding;

  /// Indicates whether the input file has a header row at the top containing the
  /// column names.
  final bool? hasHeaderRow;

  /// A parameter to indicate whether empty rows should be ignored or be included
  /// in the import.
  final bool? ignoreEmptyRows;

  DelimitedTextImportOptions({
    required this.delimiter,
    this.dataCharacterEncoding,
    this.hasHeaderRow,
    this.ignoreEmptyRows,
  });

  factory DelimitedTextImportOptions.fromJson(Map<String, dynamic> json) {
    return DelimitedTextImportOptions(
      delimiter: json['delimiter'] as String,
      dataCharacterEncoding: (json['dataCharacterEncoding'] as String?)
          ?.toImportDataCharacterEncoding(),
      hasHeaderRow: json['hasHeaderRow'] as bool?,
      ignoreEmptyRows: json['ignoreEmptyRows'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final delimiter = this.delimiter;
    final dataCharacterEncoding = this.dataCharacterEncoding;
    final hasHeaderRow = this.hasHeaderRow;
    final ignoreEmptyRows = this.ignoreEmptyRows;
    return {
      'delimiter': delimiter,
      if (dataCharacterEncoding != null)
        'dataCharacterEncoding': dataCharacterEncoding.toValue(),
      if (hasHeaderRow != null) 'hasHeaderRow': hasHeaderRow,
      if (ignoreEmptyRows != null) 'ignoreEmptyRows': ignoreEmptyRows,
    };
  }
}

class DescribeTableDataImportJobResult {
  /// The metadata about the job that was submitted for import.
  final TableDataImportJobMetadata jobMetadata;

  /// The current status of the import job.
  final TableDataImportJobStatus jobStatus;

  /// A message providing more details about the current status of the import job.
  final String message;

  /// If job status is failed, error code to understand reason for the failure.
  final ErrorCode? errorCode;

  DescribeTableDataImportJobResult({
    required this.jobMetadata,
    required this.jobStatus,
    required this.message,
    this.errorCode,
  });

  factory DescribeTableDataImportJobResult.fromJson(Map<String, dynamic> json) {
    return DescribeTableDataImportJobResult(
      jobMetadata: TableDataImportJobMetadata.fromJson(
          json['jobMetadata'] as Map<String, dynamic>),
      jobStatus: (json['jobStatus'] as String).toTableDataImportJobStatus(),
      message: json['message'] as String,
      errorCode: (json['errorCode'] as String?)?.toErrorCode(),
    );
  }

  Map<String, dynamic> toJson() {
    final jobMetadata = this.jobMetadata;
    final jobStatus = this.jobStatus;
    final message = this.message;
    final errorCode = this.errorCode;
    return {
      'jobMetadata': jobMetadata,
      'jobStatus': jobStatus.toValue(),
      'message': message,
      if (errorCode != null) 'errorCode': errorCode.toValue(),
    };
  }
}

/// An object that contains the options relating to the destination of the
/// import request.
class DestinationOptions {
  /// A map of the column id to the import properties for each column.
  final Map<String, SourceDataColumnProperties>? columnMap;

  DestinationOptions({
    this.columnMap,
  });

  factory DestinationOptions.fromJson(Map<String, dynamic> json) {
    return DestinationOptions(
      columnMap: (json['columnMap'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k,
              SourceDataColumnProperties.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final columnMap = this.columnMap;
    return {
      if (columnMap != null) 'columnMap': columnMap,
    };
  }
}

enum ErrorCode {
  accessDenied,
  invalidUrlError,
  invalidImportOptionsError,
  invalidTableIdError,
  invalidTableColumnIdError,
  tableNotFoundError,
  fileEmptyError,
  invalidFileTypeError,
  fileParsingError,
  fileSizeLimitError,
  fileNotFoundError,
  unknownError,
  resourceNotFoundError,
  systemLimitError,
}

extension ErrorCodeValueExtension on ErrorCode {
  String toValue() {
    switch (this) {
      case ErrorCode.accessDenied:
        return 'ACCESS_DENIED';
      case ErrorCode.invalidUrlError:
        return 'INVALID_URL_ERROR';
      case ErrorCode.invalidImportOptionsError:
        return 'INVALID_IMPORT_OPTIONS_ERROR';
      case ErrorCode.invalidTableIdError:
        return 'INVALID_TABLE_ID_ERROR';
      case ErrorCode.invalidTableColumnIdError:
        return 'INVALID_TABLE_COLUMN_ID_ERROR';
      case ErrorCode.tableNotFoundError:
        return 'TABLE_NOT_FOUND_ERROR';
      case ErrorCode.fileEmptyError:
        return 'FILE_EMPTY_ERROR';
      case ErrorCode.invalidFileTypeError:
        return 'INVALID_FILE_TYPE_ERROR';
      case ErrorCode.fileParsingError:
        return 'FILE_PARSING_ERROR';
      case ErrorCode.fileSizeLimitError:
        return 'FILE_SIZE_LIMIT_ERROR';
      case ErrorCode.fileNotFoundError:
        return 'FILE_NOT_FOUND_ERROR';
      case ErrorCode.unknownError:
        return 'UNKNOWN_ERROR';
      case ErrorCode.resourceNotFoundError:
        return 'RESOURCE_NOT_FOUND_ERROR';
      case ErrorCode.systemLimitError:
        return 'SYSTEM_LIMIT_ERROR';
    }
  }
}

extension ErrorCodeFromString on String {
  ErrorCode toErrorCode() {
    switch (this) {
      case 'ACCESS_DENIED':
        return ErrorCode.accessDenied;
      case 'INVALID_URL_ERROR':
        return ErrorCode.invalidUrlError;
      case 'INVALID_IMPORT_OPTIONS_ERROR':
        return ErrorCode.invalidImportOptionsError;
      case 'INVALID_TABLE_ID_ERROR':
        return ErrorCode.invalidTableIdError;
      case 'INVALID_TABLE_COLUMN_ID_ERROR':
        return ErrorCode.invalidTableColumnIdError;
      case 'TABLE_NOT_FOUND_ERROR':
        return ErrorCode.tableNotFoundError;
      case 'FILE_EMPTY_ERROR':
        return ErrorCode.fileEmptyError;
      case 'INVALID_FILE_TYPE_ERROR':
        return ErrorCode.invalidFileTypeError;
      case 'FILE_PARSING_ERROR':
        return ErrorCode.fileParsingError;
      case 'FILE_SIZE_LIMIT_ERROR':
        return ErrorCode.fileSizeLimitError;
      case 'FILE_NOT_FOUND_ERROR':
        return ErrorCode.fileNotFoundError;
      case 'UNKNOWN_ERROR':
        return ErrorCode.unknownError;
      case 'RESOURCE_NOT_FOUND_ERROR':
        return ErrorCode.resourceNotFoundError;
      case 'SYSTEM_LIMIT_ERROR':
        return ErrorCode.systemLimitError;
    }
    throw Exception('$this is not known in enum ErrorCode');
  }
}

/// A single item in a batch that failed to perform the intended action because
/// of an error preventing it from succeeding.
class FailedBatchItem {
  /// The error message that indicates why the batch item failed.
  final String errorMessage;

  /// The id of the batch item that failed. This is the batch item id for the
  /// BatchCreateTableRows and BatchUpsertTableRows operations and the row id for
  /// the BatchUpdateTableRows and BatchDeleteTableRows operations.
  final String id;

  FailedBatchItem({
    required this.errorMessage,
    required this.id,
  });

  factory FailedBatchItem.fromJson(Map<String, dynamic> json) {
    return FailedBatchItem(
      errorMessage: json['errorMessage'] as String,
      id: json['id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final errorMessage = this.errorMessage;
    final id = this.id;
    return {
      'errorMessage': errorMessage,
      'id': id,
    };
  }
}

/// An object that represents a filter formula along with the id of the context
/// row under which the filter function needs to evaluate.
class Filter {
  /// A formula representing a filter function that returns zero or more matching
  /// rows from a table. Valid formulas in this field return a list of rows from a
  /// table. The most common ways of writing a formula to return a list of rows
  /// are to use the FindRow() or Filter() functions. Any other formula that
  /// returns zero or more rows is also acceptable. For example, you can use a
  /// formula that points to a cell that contains a filter function.
  final String formula;

  /// The optional contextRowId attribute can be used to specify the row id of the
  /// context row if the filter formula contains unqualified references to table
  /// columns and needs a context row to evaluate them successfully.
  final String? contextRowId;

  Filter({
    required this.formula,
    this.contextRowId,
  });

  Map<String, dynamic> toJson() {
    final formula = this.formula;
    final contextRowId = this.contextRowId;
    return {
      'formula': formula,
      if (contextRowId != null) 'contextRowId': contextRowId,
    };
  }
}

enum Format {
  auto,
  number,
  currency,
  date,
  time,
  dateTime,
  percentage,
  text,
  accounting,
  contact,
  rowlink,
  rowset,
}

extension FormatValueExtension on Format {
  String toValue() {
    switch (this) {
      case Format.auto:
        return 'AUTO';
      case Format.number:
        return 'NUMBER';
      case Format.currency:
        return 'CURRENCY';
      case Format.date:
        return 'DATE';
      case Format.time:
        return 'TIME';
      case Format.dateTime:
        return 'DATE_TIME';
      case Format.percentage:
        return 'PERCENTAGE';
      case Format.text:
        return 'TEXT';
      case Format.accounting:
        return 'ACCOUNTING';
      case Format.contact:
        return 'CONTACT';
      case Format.rowlink:
        return 'ROWLINK';
      case Format.rowset:
        return 'ROWSET';
    }
  }
}

extension FormatFromString on String {
  Format toFormat() {
    switch (this) {
      case 'AUTO':
        return Format.auto;
      case 'NUMBER':
        return Format.number;
      case 'CURRENCY':
        return Format.currency;
      case 'DATE':
        return Format.date;
      case 'TIME':
        return Format.time;
      case 'DATE_TIME':
        return Format.dateTime;
      case 'PERCENTAGE':
        return Format.percentage;
      case 'TEXT':
        return Format.text;
      case 'ACCOUNTING':
        return Format.accounting;
      case 'CONTACT':
        return Format.contact;
      case 'ROWLINK':
        return Format.rowlink;
      case 'ROWSET':
        return Format.rowset;
    }
    throw Exception('$this is not known in enum Format');
  }
}

class GetScreenDataResult {
  /// A map of all the rows on the screen keyed by block name.
  final Map<String, ResultSet> results;

  /// Indicates the cursor of the workbook at which the data returned by this
  /// workbook is read. Workbook cursor keeps increasing with every update and the
  /// increments are not sequential.
  final int workbookCursor;

  /// Provides the pagination token to load the next page if there are more
  /// results matching the request. If a pagination token is not present in the
  /// response, it means that all data matching the query has been loaded.
  final String? nextToken;

  GetScreenDataResult({
    required this.results,
    required this.workbookCursor,
    this.nextToken,
  });

  factory GetScreenDataResult.fromJson(Map<String, dynamic> json) {
    return GetScreenDataResult(
      results: (json['results'] as Map<String, dynamic>).map(
          (k, e) => MapEntry(k, ResultSet.fromJson(e as Map<String, dynamic>))),
      workbookCursor: json['workbookCursor'] as int,
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final results = this.results;
    final workbookCursor = this.workbookCursor;
    final nextToken = this.nextToken;
    return {
      'results': results,
      'workbookCursor': workbookCursor,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

enum ImportDataCharacterEncoding {
  utf_8,
  usAscii,
  iso_8859_1,
  utf_16be,
  utf_16le,
  utf_16,
}

extension ImportDataCharacterEncodingValueExtension
    on ImportDataCharacterEncoding {
  String toValue() {
    switch (this) {
      case ImportDataCharacterEncoding.utf_8:
        return 'UTF-8';
      case ImportDataCharacterEncoding.usAscii:
        return 'US-ASCII';
      case ImportDataCharacterEncoding.iso_8859_1:
        return 'ISO-8859-1';
      case ImportDataCharacterEncoding.utf_16be:
        return 'UTF-16BE';
      case ImportDataCharacterEncoding.utf_16le:
        return 'UTF-16LE';
      case ImportDataCharacterEncoding.utf_16:
        return 'UTF-16';
    }
  }
}

extension ImportDataCharacterEncodingFromString on String {
  ImportDataCharacterEncoding toImportDataCharacterEncoding() {
    switch (this) {
      case 'UTF-8':
        return ImportDataCharacterEncoding.utf_8;
      case 'US-ASCII':
        return ImportDataCharacterEncoding.usAscii;
      case 'ISO-8859-1':
        return ImportDataCharacterEncoding.iso_8859_1;
      case 'UTF-16BE':
        return ImportDataCharacterEncoding.utf_16be;
      case 'UTF-16LE':
        return ImportDataCharacterEncoding.utf_16le;
      case 'UTF-16':
        return ImportDataCharacterEncoding.utf_16;
    }
    throw Exception('$this is not known in enum ImportDataCharacterEncoding');
  }
}

/// An object that has details about the source of the data that was submitted
/// for import.
class ImportDataSource {
  /// The configuration parameters for the data source of the import
  final ImportDataSourceConfig dataSourceConfig;

  ImportDataSource({
    required this.dataSourceConfig,
  });

  factory ImportDataSource.fromJson(Map<String, dynamic> json) {
    return ImportDataSource(
      dataSourceConfig: ImportDataSourceConfig.fromJson(
          json['dataSourceConfig'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final dataSourceConfig = this.dataSourceConfig;
    return {
      'dataSourceConfig': dataSourceConfig,
    };
  }
}

/// An object that contains the configuration parameters for the data source of
/// an import request.
class ImportDataSourceConfig {
  /// The URL from which source data will be downloaded for the import request.
  final String? dataSourceUrl;

  ImportDataSourceConfig({
    this.dataSourceUrl,
  });

  factory ImportDataSourceConfig.fromJson(Map<String, dynamic> json) {
    return ImportDataSourceConfig(
      dataSourceUrl: json['dataSourceUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSourceUrl = this.dataSourceUrl;
    return {
      if (dataSourceUrl != null) 'dataSourceUrl': dataSourceUrl,
    };
  }
}

/// An object that contains the attributes of the submitter of the import job.
class ImportJobSubmitter {
  /// The email id of the submitter of the import job, if available.
  final String? email;

  /// The AWS user ARN of the submitter of the import job, if available.
  final String? userArn;

  ImportJobSubmitter({
    this.email,
    this.userArn,
  });

  factory ImportJobSubmitter.fromJson(Map<String, dynamic> json) {
    return ImportJobSubmitter(
      email: json['email'] as String?,
      userArn: json['userArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final email = this.email;
    final userArn = this.userArn;
    return {
      if (email != null) 'email': email,
      if (userArn != null) 'userArn': userArn,
    };
  }
}

/// An object that contains the options specified by the sumitter of the import
/// request.
class ImportOptions {
  /// Options relating to parsing delimited text. Required if dataFormat is
  /// DELIMITED_TEXT.
  final DelimitedTextImportOptions? delimitedTextOptions;

  /// Options relating to the destination of the import request.
  final DestinationOptions? destinationOptions;

  ImportOptions({
    this.delimitedTextOptions,
    this.destinationOptions,
  });

  factory ImportOptions.fromJson(Map<String, dynamic> json) {
    return ImportOptions(
      delimitedTextOptions: json['delimitedTextOptions'] != null
          ? DelimitedTextImportOptions.fromJson(
              json['delimitedTextOptions'] as Map<String, dynamic>)
          : null,
      destinationOptions: json['destinationOptions'] != null
          ? DestinationOptions.fromJson(
              json['destinationOptions'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final delimitedTextOptions = this.delimitedTextOptions;
    final destinationOptions = this.destinationOptions;
    return {
      if (delimitedTextOptions != null)
        'delimitedTextOptions': delimitedTextOptions,
      if (destinationOptions != null) 'destinationOptions': destinationOptions,
    };
  }
}

enum ImportSourceDataFormat {
  delimitedText,
}

extension ImportSourceDataFormatValueExtension on ImportSourceDataFormat {
  String toValue() {
    switch (this) {
      case ImportSourceDataFormat.delimitedText:
        return 'DELIMITED_TEXT';
    }
  }
}

extension ImportSourceDataFormatFromString on String {
  ImportSourceDataFormat toImportSourceDataFormat() {
    switch (this) {
      case 'DELIMITED_TEXT':
        return ImportSourceDataFormat.delimitedText;
    }
    throw Exception('$this is not known in enum ImportSourceDataFormat');
  }
}

class InvokeScreenAutomationResult {
  /// The updated workbook cursor after performing the automation action.
  final int workbookCursor;

  InvokeScreenAutomationResult({
    required this.workbookCursor,
  });

  factory InvokeScreenAutomationResult.fromJson(Map<String, dynamic> json) {
    return InvokeScreenAutomationResult(
      workbookCursor: json['workbookCursor'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final workbookCursor = this.workbookCursor;
    return {
      'workbookCursor': workbookCursor,
    };
  }
}

class ListTableColumnsResult {
  /// The list of columns in the table.
  final List<TableColumn> tableColumns;

  /// Provides the pagination token to load the next page if there are more
  /// results matching the request. If a pagination token is not present in the
  /// response, it means that all data matching the request has been loaded.
  final String? nextToken;

  /// Indicates the cursor of the workbook at which the data returned by this
  /// request is read. Workbook cursor keeps increasing with every update and the
  /// increments are not sequential.
  final int? workbookCursor;

  ListTableColumnsResult({
    required this.tableColumns,
    this.nextToken,
    this.workbookCursor,
  });

  factory ListTableColumnsResult.fromJson(Map<String, dynamic> json) {
    return ListTableColumnsResult(
      tableColumns: (json['tableColumns'] as List)
          .whereNotNull()
          .map((e) => TableColumn.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
      workbookCursor: json['workbookCursor'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final tableColumns = this.tableColumns;
    final nextToken = this.nextToken;
    final workbookCursor = this.workbookCursor;
    return {
      'tableColumns': tableColumns,
      if (nextToken != null) 'nextToken': nextToken,
      if (workbookCursor != null) 'workbookCursor': workbookCursor,
    };
  }
}

class ListTableRowsResult {
  /// The list of columns in the table whose row data is returned in the result.
  final List<String> columnIds;

  /// The list of rows in the table. Note that this result is paginated, so this
  /// list contains a maximum of 100 rows.
  final List<TableRow> rows;

  /// Indicates the cursor of the workbook at which the data returned by this
  /// request is read. Workbook cursor keeps increasing with every update and the
  /// increments are not sequential.
  final int workbookCursor;

  /// Provides the pagination token to load the next page if there are more
  /// results matching the request. If a pagination token is not present in the
  /// response, it means that all data matching the request has been loaded.
  final String? nextToken;

  /// The list of row ids included in the request that were not found in the
  /// table.
  final List<String>? rowIdsNotFound;

  ListTableRowsResult({
    required this.columnIds,
    required this.rows,
    required this.workbookCursor,
    this.nextToken,
    this.rowIdsNotFound,
  });

  factory ListTableRowsResult.fromJson(Map<String, dynamic> json) {
    return ListTableRowsResult(
      columnIds: (json['columnIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      rows: (json['rows'] as List)
          .whereNotNull()
          .map((e) => TableRow.fromJson(e as Map<String, dynamic>))
          .toList(),
      workbookCursor: json['workbookCursor'] as int,
      nextToken: json['nextToken'] as String?,
      rowIdsNotFound: (json['rowIdsNotFound'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final columnIds = this.columnIds;
    final rows = this.rows;
    final workbookCursor = this.workbookCursor;
    final nextToken = this.nextToken;
    final rowIdsNotFound = this.rowIdsNotFound;
    return {
      'columnIds': columnIds,
      'rows': rows,
      'workbookCursor': workbookCursor,
      if (nextToken != null) 'nextToken': nextToken,
      if (rowIdsNotFound != null) 'rowIdsNotFound': rowIdsNotFound,
    };
  }
}

class ListTablesResult {
  /// The list of tables in the workbook.
  final List<Table> tables;

  /// Provides the pagination token to load the next page if there are more
  /// results matching the request. If a pagination token is not present in the
  /// response, it means that all data matching the request has been loaded.
  final String? nextToken;

  /// Indicates the cursor of the workbook at which the data returned by this
  /// request is read. Workbook cursor keeps increasing with every update and the
  /// increments are not sequential.
  final int? workbookCursor;

  ListTablesResult({
    required this.tables,
    this.nextToken,
    this.workbookCursor,
  });

  factory ListTablesResult.fromJson(Map<String, dynamic> json) {
    return ListTablesResult(
      tables: (json['tables'] as List)
          .whereNotNull()
          .map((e) => Table.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
      workbookCursor: json['workbookCursor'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final tables = this.tables;
    final nextToken = this.nextToken;
    final workbookCursor = this.workbookCursor;
    return {
      'tables': tables,
      if (nextToken != null) 'nextToken': nextToken,
      if (workbookCursor != null) 'workbookCursor': workbookCursor,
    };
  }
}

class ListTagsForResourceResult {
  /// The resource's tags.
  final Map<String, String>? tags;

  ListTagsForResourceResult({
    this.tags,
  });

  factory ListTagsForResourceResult.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResult(
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

class QueryTableRowsResult {
  /// The list of columns in the table whose row data is returned in the result.
  final List<String> columnIds;

  /// The list of rows in the table that match the query filter.
  final List<TableRow> rows;

  /// Indicates the cursor of the workbook at which the data returned by this
  /// request is read. Workbook cursor keeps increasing with every update and the
  /// increments are not sequential.
  final int workbookCursor;

  /// Provides the pagination token to load the next page if there are more
  /// results matching the request. If a pagination token is not present in the
  /// response, it means that all data matching the request has been loaded.
  final String? nextToken;

  QueryTableRowsResult({
    required this.columnIds,
    required this.rows,
    required this.workbookCursor,
    this.nextToken,
  });

  factory QueryTableRowsResult.fromJson(Map<String, dynamic> json) {
    return QueryTableRowsResult(
      columnIds: (json['columnIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      rows: (json['rows'] as List)
          .whereNotNull()
          .map((e) => TableRow.fromJson(e as Map<String, dynamic>))
          .toList(),
      workbookCursor: json['workbookCursor'] as int,
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final columnIds = this.columnIds;
    final rows = this.rows;
    final workbookCursor = this.workbookCursor;
    final nextToken = this.nextToken;
    return {
      'columnIds': columnIds,
      'rows': rows,
      'workbookCursor': workbookCursor,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// A single row in the ResultSet.
class ResultRow {
  /// List of all the data cells in a row.
  final List<DataItem> dataItems;

  /// The ID for a particular row.
  final String? rowId;

  ResultRow({
    required this.dataItems,
    this.rowId,
  });

  factory ResultRow.fromJson(Map<String, dynamic> json) {
    return ResultRow(
      dataItems: (json['dataItems'] as List)
          .whereNotNull()
          .map((e) => DataItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      rowId: json['rowId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataItems = this.dataItems;
    final rowId = this.rowId;
    return {
      'dataItems': dataItems,
      if (rowId != null) 'rowId': rowId,
    };
  }
}

/// ResultSet contains the results of the request for a single block or list
/// defined on the screen.
class ResultSet {
  /// List of headers for all the data cells in the block. The header identifies
  /// the name and default format of the data cell. Data cells appear in the same
  /// order in all rows as defined in the header. The names and formats are not
  /// repeated in the rows. If a particular row does not have a value for a data
  /// cell, a blank value is used.
  ///
  /// For example, a task list that displays the task name, due date and assigned
  /// person might have headers [ { "name": "Task Name"}, {"name": "Due Date",
  /// "format": "DATE"}, {"name": "Assigned", "format": "CONTACT"} ]. Every row in
  /// the result will have the task name as the first item, due date as the second
  /// item and assigned person as the third item. If a particular task does not
  /// have a due date, that row will still have a blank value in the second
  /// element and the assigned person will still be in the third element.
  final List<ColumnMetadata> headers;

  /// List of rows returned by the request. Each row has a row Id and a list of
  /// data cells in that row. The data cells will be present in the same order as
  /// they are defined in the header.
  final List<ResultRow> rows;

  ResultSet({
    required this.headers,
    required this.rows,
  });

  factory ResultSet.fromJson(Map<String, dynamic> json) {
    return ResultSet(
      headers: (json['headers'] as List)
          .whereNotNull()
          .map((e) => ColumnMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      rows: (json['rows'] as List)
          .whereNotNull()
          .map((e) => ResultRow.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final headers = this.headers;
    final rows = this.rows;
    return {
      'headers': headers,
      'rows': rows,
    };
  }
}

/// An object that contains the properties for importing data to a specific
/// column in a table.
class SourceDataColumnProperties {
  /// The index of the column in the input file.
  final int? columnIndex;

  SourceDataColumnProperties({
    this.columnIndex,
  });

  factory SourceDataColumnProperties.fromJson(Map<String, dynamic> json) {
    return SourceDataColumnProperties(
      columnIndex: json['columnIndex'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final columnIndex = this.columnIndex;
    return {
      if (columnIndex != null) 'columnIndex': columnIndex,
    };
  }
}

class StartTableDataImportJobResult {
  /// The id that is assigned to this import job. Future requests to find out the
  /// status of this import job need to send this id in the appropriate parameter
  /// in the request.
  final String jobId;

  /// The status of the import job immediately after submitting the request.
  final TableDataImportJobStatus jobStatus;

  StartTableDataImportJobResult({
    required this.jobId,
    required this.jobStatus,
  });

  factory StartTableDataImportJobResult.fromJson(Map<String, dynamic> json) {
    return StartTableDataImportJobResult(
      jobId: json['jobId'] as String,
      jobStatus: (json['jobStatus'] as String).toTableDataImportJobStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    final jobStatus = this.jobStatus;
    return {
      'jobId': jobId,
      'jobStatus': jobStatus.toValue(),
    };
  }
}

/// An object representing the properties of a table in a workbook.
class Table {
  /// The id of the table.
  final String? tableId;

  /// The name of the table.
  final String? tableName;

  Table({
    this.tableId,
    this.tableName,
  });

  factory Table.fromJson(Map<String, dynamic> json) {
    return Table(
      tableId: json['tableId'] as String?,
      tableName: json['tableName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final tableId = this.tableId;
    final tableName = this.tableName;
    return {
      if (tableId != null) 'tableId': tableId,
      if (tableName != null) 'tableName': tableName,
    };
  }
}

/// An object that contains attributes about a single column in a table
class TableColumn {
  /// The column level format that is applied in the table. An empty value in this
  /// field means that the column format is the default value 'AUTO'.
  final Format? format;

  /// The id of the column in the table.
  final String? tableColumnId;

  /// The name of the column in the table.
  final String? tableColumnName;

  TableColumn({
    this.format,
    this.tableColumnId,
    this.tableColumnName,
  });

  factory TableColumn.fromJson(Map<String, dynamic> json) {
    return TableColumn(
      format: (json['format'] as String?)?.toFormat(),
      tableColumnId: json['tableColumnId'] as String?,
      tableColumnName: json['tableColumnName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final format = this.format;
    final tableColumnId = this.tableColumnId;
    final tableColumnName = this.tableColumnName;
    return {
      if (format != null) 'format': format.toValue(),
      if (tableColumnId != null) 'tableColumnId': tableColumnId,
      if (tableColumnName != null) 'tableColumnName': tableColumnName,
    };
  }
}

/// The metadata associated with the table data import job that was submitted.
class TableDataImportJobMetadata {
  /// The source of the data that was submitted for import.
  final ImportDataSource dataSource;

  /// The options that was specified at the time of submitting the import request.
  final ImportOptions importOptions;

  /// The timestamp when the job was submitted for import.
  final DateTime submitTime;

  /// Details about the submitter of the import request.
  final ImportJobSubmitter submitter;

  TableDataImportJobMetadata({
    required this.dataSource,
    required this.importOptions,
    required this.submitTime,
    required this.submitter,
  });

  factory TableDataImportJobMetadata.fromJson(Map<String, dynamic> json) {
    return TableDataImportJobMetadata(
      dataSource:
          ImportDataSource.fromJson(json['dataSource'] as Map<String, dynamic>),
      importOptions:
          ImportOptions.fromJson(json['importOptions'] as Map<String, dynamic>),
      submitTime: nonNullableTimeStampFromJson(json['submitTime'] as Object),
      submitter: ImportJobSubmitter.fromJson(
          json['submitter'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final dataSource = this.dataSource;
    final importOptions = this.importOptions;
    final submitTime = this.submitTime;
    final submitter = this.submitter;
    return {
      'dataSource': dataSource,
      'importOptions': importOptions,
      'submitTime': unixTimestampToJson(submitTime),
      'submitter': submitter,
    };
  }
}

enum TableDataImportJobStatus {
  submitted,
  inProgress,
  completed,
  failed,
}

extension TableDataImportJobStatusValueExtension on TableDataImportJobStatus {
  String toValue() {
    switch (this) {
      case TableDataImportJobStatus.submitted:
        return 'SUBMITTED';
      case TableDataImportJobStatus.inProgress:
        return 'IN_PROGRESS';
      case TableDataImportJobStatus.completed:
        return 'COMPLETED';
      case TableDataImportJobStatus.failed:
        return 'FAILED';
    }
  }
}

extension TableDataImportJobStatusFromString on String {
  TableDataImportJobStatus toTableDataImportJobStatus() {
    switch (this) {
      case 'SUBMITTED':
        return TableDataImportJobStatus.submitted;
      case 'IN_PROGRESS':
        return TableDataImportJobStatus.inProgress;
      case 'COMPLETED':
        return TableDataImportJobStatus.completed;
      case 'FAILED':
        return TableDataImportJobStatus.failed;
    }
    throw Exception('$this is not known in enum TableDataImportJobStatus');
  }
}

/// An object that contains attributes about a single row in a table
class TableRow {
  /// A list of cells in the table row. The cells appear in the same order as the
  /// columns of the table.
  final List<Cell> cells;

  /// The id of the row in the table.
  final String rowId;

  TableRow({
    required this.cells,
    required this.rowId,
  });

  factory TableRow.fromJson(Map<String, dynamic> json) {
    return TableRow(
      cells: (json['cells'] as List)
          .whereNotNull()
          .map((e) => Cell.fromJson(e as Map<String, dynamic>))
          .toList(),
      rowId: json['rowId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final cells = this.cells;
    final rowId = this.rowId;
    return {
      'cells': cells,
      'rowId': rowId,
    };
  }
}

class TagResourceResult {
  TagResourceResult();

  factory TagResourceResult.fromJson(Map<String, dynamic> _) {
    return TagResourceResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UntagResourceResult {
  UntagResourceResult();

  factory UntagResourceResult.fromJson(Map<String, dynamic> _) {
    return UntagResourceResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Data needed to create a single row in a table as part of the
/// BatchCreateTableRows request.
class UpdateRowData {
  /// A map representing the cells to update in the given row. The key is the
  /// column id of the cell and the value is the CellInput object that represents
  /// the data to set in that cell.
  final Map<String, CellInput> cellsToUpdate;

  /// The id of the row that needs to be updated.
  final String rowId;

  UpdateRowData({
    required this.cellsToUpdate,
    required this.rowId,
  });

  Map<String, dynamic> toJson() {
    final cellsToUpdate = this.cellsToUpdate;
    final rowId = this.rowId;
    return {
      'cellsToUpdate': cellsToUpdate,
      'rowId': rowId,
    };
  }
}

enum UpsertAction {
  updated,
  appended,
}

extension UpsertActionValueExtension on UpsertAction {
  String toValue() {
    switch (this) {
      case UpsertAction.updated:
        return 'UPDATED';
      case UpsertAction.appended:
        return 'APPENDED';
    }
  }
}

extension UpsertActionFromString on String {
  UpsertAction toUpsertAction() {
    switch (this) {
      case 'UPDATED':
        return UpsertAction.updated;
      case 'APPENDED':
        return UpsertAction.appended;
    }
    throw Exception('$this is not known in enum UpsertAction');
  }
}

/// Data needed to upsert rows in a table as part of a single item in the
/// BatchUpsertTableRows request.
class UpsertRowData {
  /// An external identifier that represents a single item in the request that is
  /// being upserted as part of the BatchUpsertTableRows request. This can be any
  /// string that you can use to identify the item in the request. The
  /// BatchUpsertTableRows API puts the batch item id in the results to allow you
  /// to link data in the request to data in the results.
  final String batchItemId;

  /// A map representing the cells to update for the matching rows or an appended
  /// row. The key is the column id of the cell and the value is the CellInput
  /// object that represents the data to set in that cell.
  final Map<String, CellInput> cellsToUpdate;

  /// The filter formula to use to find existing matching rows to update. The
  /// formula needs to return zero or more rows. If the formula returns 0 rows,
  /// then a new row will be appended in the target table. If the formula returns
  /// one or more rows, then the returned rows will be updated.
  ///
  /// Note that the filter formula needs to return rows from the target table for
  /// the upsert operation to succeed. If the filter formula has a syntax error or
  /// it doesn't evaluate to zero or more rows in the target table for any one
  /// item in the input list, then the entire BatchUpsertTableRows request fails
  /// and no updates are made to the table.
  final Filter filter;

  UpsertRowData({
    required this.batchItemId,
    required this.cellsToUpdate,
    required this.filter,
  });

  Map<String, dynamic> toJson() {
    final batchItemId = this.batchItemId;
    final cellsToUpdate = this.cellsToUpdate;
    final filter = this.filter;
    return {
      'batchItemId': batchItemId,
      'cellsToUpdate': cellsToUpdate,
      'filter': filter,
    };
  }
}

/// An object that represents the result of a single upsert row request.
class UpsertRowsResult {
  /// The list of row ids that were changed as part of an upsert row operation. If
  /// the upsert resulted in an update, this list could potentially contain
  /// multiple rows that matched the filter and hence got updated. If the upsert
  /// resulted in an append, this list would only have the single row that was
  /// appended.
  final List<String> rowIds;

  /// The result of the upsert action.
  final UpsertAction upsertAction;

  UpsertRowsResult({
    required this.rowIds,
    required this.upsertAction,
  });

  factory UpsertRowsResult.fromJson(Map<String, dynamic> json) {
    return UpsertRowsResult(
      rowIds: (json['rowIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      upsertAction: (json['upsertAction'] as String).toUpsertAction(),
    );
  }

  Map<String, dynamic> toJson() {
    final rowIds = this.rowIds;
    final upsertAction = this.upsertAction;
    return {
      'rowIds': rowIds,
      'upsertAction': upsertAction.toValue(),
    };
  }
}

/// The input variables to the app to be used by the InvokeScreenAutomation
/// action request.
class VariableValue {
  /// Raw value of the variable.
  final String rawValue;

  VariableValue({
    required this.rawValue,
  });

  Map<String, dynamic> toJson() {
    final rawValue = this.rawValue;
    return {
      'rawValue': rawValue,
    };
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class AutomationExecutionException extends _s.GenericAwsException {
  AutomationExecutionException({String? type, String? message})
      : super(
            type: type, code: 'AutomationExecutionException', message: message);
}

class AutomationExecutionTimeoutException extends _s.GenericAwsException {
  AutomationExecutionTimeoutException({String? type, String? message})
      : super(
            type: type,
            code: 'AutomationExecutionTimeoutException',
            message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class RequestTimeoutException extends _s.GenericAwsException {
  RequestTimeoutException({String? type, String? message})
      : super(type: type, code: 'RequestTimeoutException', message: message);
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

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
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
  'AutomationExecutionException': (type, message) =>
      AutomationExecutionException(type: type, message: message),
  'AutomationExecutionTimeoutException': (type, message) =>
      AutomationExecutionTimeoutException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'RequestTimeoutException': (type, message) =>
      RequestTimeoutException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
