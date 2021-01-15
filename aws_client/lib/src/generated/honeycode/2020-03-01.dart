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
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        timeStampFromJson,
        RfcDateTimeConverter,
        IsoDateTimeConverter,
        UnixDateTimeConverter,
        StringJsonConverter,
        Base64JsonConverter;

export '../../shared/shared.dart' show AwsClientCredentials;

part '2020-03-01.g.dart';

/// Amazon Honeycode is a fully managed service that allows you to quickly build
/// mobile and web apps for teams—without programming. Build Honeycode apps for
/// managing almost anything, like projects, customers, operations, approvals,
/// resources, and even your team.
class Honeycode {
  final _s.RestJsonProtocol _protocol;
  Honeycode({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'honeycode',
            signingName: 'honeycode',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

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
    @_s.required List<CreateRowData> rowsToCreate,
    @_s.required String tableId,
    @_s.required String workbookId,
    String clientRequestToken,
  }) async {
    ArgumentError.checkNotNull(rowsToCreate, 'rowsToCreate');
    ArgumentError.checkNotNull(tableId, 'tableId');
    _s.validateStringLength(
      'tableId',
      tableId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tableId',
      tableId,
      r'''[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(workbookId, 'workbookId');
    _s.validateStringLength(
      'workbookId',
      workbookId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'workbookId',
      workbookId,
      r'''[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      32,
      64,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''^(?!\s*$).+''',
    );
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
    @_s.required List<String> rowIds,
    @_s.required String tableId,
    @_s.required String workbookId,
    String clientRequestToken,
  }) async {
    ArgumentError.checkNotNull(rowIds, 'rowIds');
    ArgumentError.checkNotNull(tableId, 'tableId');
    _s.validateStringLength(
      'tableId',
      tableId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tableId',
      tableId,
      r'''[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(workbookId, 'workbookId');
    _s.validateStringLength(
      'workbookId',
      workbookId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'workbookId',
      workbookId,
      r'''[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      32,
      64,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''^(?!\s*$).+''',
    );
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
    @_s.required List<UpdateRowData> rowsToUpdate,
    @_s.required String tableId,
    @_s.required String workbookId,
    String clientRequestToken,
  }) async {
    ArgumentError.checkNotNull(rowsToUpdate, 'rowsToUpdate');
    ArgumentError.checkNotNull(tableId, 'tableId');
    _s.validateStringLength(
      'tableId',
      tableId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tableId',
      tableId,
      r'''[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(workbookId, 'workbookId');
    _s.validateStringLength(
      'workbookId',
      workbookId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'workbookId',
      workbookId,
      r'''[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      32,
      64,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''^(?!\s*$).+''',
    );
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
    @_s.required List<UpsertRowData> rowsToUpsert,
    @_s.required String tableId,
    @_s.required String workbookId,
    String clientRequestToken,
  }) async {
    ArgumentError.checkNotNull(rowsToUpsert, 'rowsToUpsert');
    ArgumentError.checkNotNull(tableId, 'tableId');
    _s.validateStringLength(
      'tableId',
      tableId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tableId',
      tableId,
      r'''[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(workbookId, 'workbookId');
    _s.validateStringLength(
      'workbookId',
      workbookId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'workbookId',
      workbookId,
      r'''[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      32,
      64,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''^(?!\s*$).+''',
    );
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
    @_s.required String jobId,
    @_s.required String tableId,
    @_s.required String workbookId,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'jobId',
      jobId,
      r'''^[^\n\r\x00\x08\x0B\x0C\x0E\x1F]*$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tableId, 'tableId');
    _s.validateStringLength(
      'tableId',
      tableId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tableId',
      tableId,
      r'''[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(workbookId, 'workbookId');
    _s.validateStringLength(
      'workbookId',
      workbookId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'workbookId',
      workbookId,
      r'''[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}''',
      isRequired: true,
    );
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
  /// The ID of the app that contains the screem.
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
    @_s.required String appId,
    @_s.required String screenId,
    @_s.required String workbookId,
    int maxResults,
    String nextToken,
    Map<String, VariableValue> variables,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    _s.validateStringLength(
      'appId',
      appId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'appId',
      appId,
      r'''[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(screenId, 'screenId');
    _s.validateStringLength(
      'screenId',
      screenId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'screenId',
      screenId,
      r'''[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(workbookId, 'workbookId');
    _s.validateStringLength(
      'workbookId',
      workbookId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'workbookId',
      workbookId,
      r'''[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^(?!\s*$).+''',
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
    @_s.required String appId,
    @_s.required String screenAutomationId,
    @_s.required String screenId,
    @_s.required String workbookId,
    String clientRequestToken,
    String rowId,
    Map<String, VariableValue> variables,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    _s.validateStringLength(
      'appId',
      appId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'appId',
      appId,
      r'''[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(screenAutomationId, 'screenAutomationId');
    _s.validateStringLength(
      'screenAutomationId',
      screenAutomationId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'screenAutomationId',
      screenAutomationId,
      r'''[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(screenId, 'screenId');
    _s.validateStringLength(
      'screenId',
      screenId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'screenId',
      screenId,
      r'''[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(workbookId, 'workbookId');
    _s.validateStringLength(
      'workbookId',
      workbookId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'workbookId',
      workbookId,
      r'''[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      32,
      64,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''^(?!\s*$).+''',
    );
    _s.validateStringLength(
      'rowId',
      rowId,
      77,
      77,
    );
    _s.validateStringPattern(
      'rowId',
      rowId,
      r'''row:[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}\/[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}''',
    );
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
    @_s.required String tableId,
    @_s.required String workbookId,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(tableId, 'tableId');
    _s.validateStringLength(
      'tableId',
      tableId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tableId',
      tableId,
      r'''[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(workbookId, 'workbookId');
    _s.validateStringLength(
      'workbookId',
      workbookId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'workbookId',
      workbookId,
      r'''[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}''',
      isRequired: true,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^(?!\s*$).+''',
    );
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
    @_s.required String tableId,
    @_s.required String workbookId,
    int maxResults,
    String nextToken,
    List<String> rowIds,
  }) async {
    ArgumentError.checkNotNull(tableId, 'tableId');
    _s.validateStringLength(
      'tableId',
      tableId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tableId',
      tableId,
      r'''[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(workbookId, 'workbookId');
    _s.validateStringLength(
      'workbookId',
      workbookId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'workbookId',
      workbookId,
      r'''[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^(?!\s*$).+''',
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
    @_s.required String workbookId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(workbookId, 'workbookId');
    _s.validateStringLength(
      'workbookId',
      workbookId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'workbookId',
      workbookId,
      r'''[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^(?!\s*$).+''',
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
    @_s.required Filter filterFormula,
    @_s.required String tableId,
    @_s.required String workbookId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(filterFormula, 'filterFormula');
    ArgumentError.checkNotNull(tableId, 'tableId');
    _s.validateStringLength(
      'tableId',
      tableId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tableId',
      tableId,
      r'''[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(workbookId, 'workbookId');
    _s.validateStringLength(
      'workbookId',
      workbookId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'workbookId',
      workbookId,
      r'''[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^(?!\s*$).+''',
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
    @_s.required String clientRequestToken,
    @_s.required ImportSourceDataFormat dataFormat,
    @_s.required ImportDataSource dataSource,
    @_s.required String destinationTableId,
    @_s.required ImportOptions importOptions,
    @_s.required String workbookId,
  }) async {
    ArgumentError.checkNotNull(clientRequestToken, 'clientRequestToken');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      32,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''^(?!\s*$).+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(dataFormat, 'dataFormat');
    ArgumentError.checkNotNull(dataSource, 'dataSource');
    ArgumentError.checkNotNull(destinationTableId, 'destinationTableId');
    _s.validateStringLength(
      'destinationTableId',
      destinationTableId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'destinationTableId',
      destinationTableId,
      r'''[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(importOptions, 'importOptions');
    ArgumentError.checkNotNull(workbookId, 'workbookId');
    _s.validateStringLength(
      'workbookId',
      workbookId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'workbookId',
      workbookId,
      r'''[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'clientRequestToken': clientRequestToken,
      'dataFormat': dataFormat?.toValue() ?? '',
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
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchCreateTableRowsResult {
  /// The map of batch item id to the row id that was created for that item.
  @_s.JsonKey(name: 'createdRows')
  final Map<String, String> createdRows;

  /// The updated workbook cursor after adding the new rows at the end of the
  /// table.
  @_s.JsonKey(name: 'workbookCursor')
  final int workbookCursor;

  /// The list of batch items in the request that could not be added to the table.
  /// Each element in this list contains one item from the request that could not
  /// be added to the table along with the reason why that item could not be
  /// added.
  @_s.JsonKey(name: 'failedBatchItems')
  final List<FailedBatchItem> failedBatchItems;

  BatchCreateTableRowsResult({
    @_s.required this.createdRows,
    @_s.required this.workbookCursor,
    this.failedBatchItems,
  });
  factory BatchCreateTableRowsResult.fromJson(Map<String, dynamic> json) =>
      _$BatchCreateTableRowsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchDeleteTableRowsResult {
  /// The updated workbook cursor after deleting the rows from the table.
  @_s.JsonKey(name: 'workbookCursor')
  final int workbookCursor;

  /// The list of row ids in the request that could not be deleted from the table.
  /// Each element in this list contains one row id from the request that could
  /// not be deleted along with the reason why that item could not be deleted.
  @_s.JsonKey(name: 'failedBatchItems')
  final List<FailedBatchItem> failedBatchItems;

  BatchDeleteTableRowsResult({
    @_s.required this.workbookCursor,
    this.failedBatchItems,
  });
  factory BatchDeleteTableRowsResult.fromJson(Map<String, dynamic> json) =>
      _$BatchDeleteTableRowsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchUpdateTableRowsResult {
  /// The updated workbook cursor after adding the new rows at the end of the
  /// table.
  @_s.JsonKey(name: 'workbookCursor')
  final int workbookCursor;

  /// The list of batch items in the request that could not be updated in the
  /// table. Each element in this list contains one item from the request that
  /// could not be updated in the table along with the reason why that item could
  /// not be updated.
  @_s.JsonKey(name: 'failedBatchItems')
  final List<FailedBatchItem> failedBatchItems;

  BatchUpdateTableRowsResult({
    @_s.required this.workbookCursor,
    this.failedBatchItems,
  });
  factory BatchUpdateTableRowsResult.fromJson(Map<String, dynamic> json) =>
      _$BatchUpdateTableRowsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchUpsertTableRowsResult {
  /// A map with the batch item id as the key and the result of the upsert
  /// operation as the value. The result of the upsert operation specifies whether
  /// existing rows were updated or a new row was appended, along with the list of
  /// row ids that were affected.
  @_s.JsonKey(name: 'rows')
  final Map<String, UpsertRowsResult> rows;

  /// The updated workbook cursor after updating or appending rows in the table.
  @_s.JsonKey(name: 'workbookCursor')
  final int workbookCursor;

  /// The list of batch items in the request that could not be updated or appended
  /// in the table. Each element in this list contains one item from the request
  /// that could not be updated in the table along with the reason why that item
  /// could not be updated or appended.
  @_s.JsonKey(name: 'failedBatchItems')
  final List<FailedBatchItem> failedBatchItems;

  BatchUpsertTableRowsResult({
    @_s.required this.rows,
    @_s.required this.workbookCursor,
    this.failedBatchItems,
  });
  factory BatchUpsertTableRowsResult.fromJson(Map<String, dynamic> json) =>
      _$BatchUpsertTableRowsResultFromJson(json);
}

/// An object that represents a single cell in a table.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Cell {
  /// The format of the cell. If this field is empty, then the format is either
  /// not specified in the workbook or the format is set to AUTO.
  @_s.JsonKey(name: 'format')
  final Format format;

  /// The formatted value of the cell. This is the value that you see displayed in
  /// the cell in the UI.
  ///
  /// Note that the formatted value of a cell is always represented as a string
  /// irrespective of the data that is stored in the cell. For example, if a cell
  /// contains a date, the formatted value of the cell is the string
  /// representation of the formatted date being shown in the cell in the UI. See
  /// details in the rawValue field below for how cells of different formats will
  /// have different raw and formatted values.
  @_s.JsonKey(name: 'formattedValue')
  final String formattedValue;

  /// The formula contained in the cell. This field is empty if a cell does not
  /// have a formula.
  @_s.JsonKey(name: 'formula')
  final String formula;

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
  /// Cells with format AUTO or cells without any format that are auto-detected as
  /// one of the formats above will contain the raw and formatted values as
  /// mentioned above, based on the auto-detected formats. If there is no
  /// auto-detected format, the raw and formatted values will be the same as the
  /// data in the cell.
  @_s.JsonKey(name: 'rawValue')
  final String rawValue;

  Cell({
    this.format,
    this.formattedValue,
    this.formula,
    this.rawValue,
  });
  factory Cell.fromJson(Map<String, dynamic> json) => _$CellFromJson(json);
}

/// CellInput object contains the data needed to create or update cells in a
/// table.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CellInput {
  /// Fact represents the data that is entered into a cell. This data can be free
  /// text or a formula. Formulas need to start with the equals (=) sign.
  @_s.JsonKey(name: 'fact')
  final String fact;

  CellInput({
    this.fact,
  });
  Map<String, dynamic> toJson() => _$CellInputToJson(this);
}

/// Metadata for column in the table.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ColumnMetadata {
  /// The format of the column.
  @_s.JsonKey(name: 'format')
  final Format format;

  /// The name of the column.
  @_s.JsonKey(name: 'name')
  final String name;

  ColumnMetadata({
    @_s.required this.format,
    @_s.required this.name,
  });
  factory ColumnMetadata.fromJson(Map<String, dynamic> json) =>
      _$ColumnMetadataFromJson(json);
}

/// Data needed to create a single row in a table as part of the
/// BatchCreateTableRows request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateRowData {
  /// An external identifier that represents the single row that is being created
  /// as part of the BatchCreateTableRows request. This can be any string that you
  /// can use to identify the row in the request. The BatchCreateTableRows API
  /// puts the batch item id in the results to allow you to link data in the
  /// request to data in the results.
  @_s.JsonKey(name: 'batchItemId')
  final String batchItemId;

  /// A map representing the cells to create in the new row. The key is the column
  /// id of the cell and the value is the CellInput object that represents the
  /// data to set in that cell.
  @_s.JsonKey(name: 'cellsToCreate')
  final Map<String, CellInput> cellsToCreate;

  CreateRowData({
    @_s.required this.batchItemId,
    @_s.required this.cellsToCreate,
  });
  Map<String, dynamic> toJson() => _$CreateRowDataToJson(this);
}

/// The data in a particular data cell defined on the screen.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DataItem {
  /// The formatted value of the data. e.g. John Smith.
  @_s.JsonKey(name: 'formattedValue')
  final String formattedValue;

  /// The overrideFormat is optional and is specified only if a particular row of
  /// data has a different format for the data than the default format defined on
  /// the screen or the table.
  @_s.JsonKey(name: 'overrideFormat')
  final Format overrideFormat;

  /// The raw value of the data. e.g. jsmith@example.com
  @_s.JsonKey(name: 'rawValue')
  final String rawValue;

  DataItem({
    this.formattedValue,
    this.overrideFormat,
    this.rawValue,
  });
  factory DataItem.fromJson(Map<String, dynamic> json) =>
      _$DataItemFromJson(json);
}

/// An object that contains the options relating to parsing delimited text as
/// part of an import request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DelimitedTextImportOptions {
  /// The delimiter to use for separating columns in a single row of the input.
  @_s.JsonKey(name: 'delimiter')
  final String delimiter;

  /// The encoding of the data in the input file.
  @_s.JsonKey(name: 'dataCharacterEncoding')
  final ImportDataCharacterEncoding dataCharacterEncoding;

  /// Indicates whether the input file has a header row at the top containing the
  /// column names.
  @_s.JsonKey(name: 'hasHeaderRow')
  final bool hasHeaderRow;

  /// A parameter to indicate whether empty rows should be ignored or be included
  /// in the import.
  @_s.JsonKey(name: 'ignoreEmptyRows')
  final bool ignoreEmptyRows;

  DelimitedTextImportOptions({
    @_s.required this.delimiter,
    this.dataCharacterEncoding,
    this.hasHeaderRow,
    this.ignoreEmptyRows,
  });
  factory DelimitedTextImportOptions.fromJson(Map<String, dynamic> json) =>
      _$DelimitedTextImportOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$DelimitedTextImportOptionsToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeTableDataImportJobResult {
  /// The metadata about the job that was submitted for import.
  @_s.JsonKey(name: 'jobMetadata')
  final TableDataImportJobMetadata jobMetadata;

  /// The current status of the import job.
  @_s.JsonKey(name: 'jobStatus')
  final TableDataImportJobStatus jobStatus;

  /// A message providing more details about the current status of the import job.
  @_s.JsonKey(name: 'message')
  final String message;

  DescribeTableDataImportJobResult({
    @_s.required this.jobMetadata,
    @_s.required this.jobStatus,
    @_s.required this.message,
  });
  factory DescribeTableDataImportJobResult.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeTableDataImportJobResultFromJson(json);
}

/// An object that contains the options relating to the destination of the
/// import request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DestinationOptions {
  /// A map of the column id to the import properties for each column.
  @_s.JsonKey(name: 'columnMap')
  final Map<String, SourceDataColumnProperties> columnMap;

  DestinationOptions({
    this.columnMap,
  });
  factory DestinationOptions.fromJson(Map<String, dynamic> json) =>
      _$DestinationOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$DestinationOptionsToJson(this);
}

/// A single item in a batch that failed to perform the intended action because
/// of an error preventing it from succeeding.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FailedBatchItem {
  /// The error message that indicates why the batch item failed.
  @_s.JsonKey(name: 'errorMessage')
  final String errorMessage;

  /// The id of the batch item that failed. This is the batch item id for the
  /// BatchCreateTableRows and BatchUpsertTableRows operations and the row id for
  /// the BatchUpdateTableRows and BatchDeleteTableRows operations.
  @_s.JsonKey(name: 'id')
  final String id;

  FailedBatchItem({
    @_s.required this.errorMessage,
    @_s.required this.id,
  });
  factory FailedBatchItem.fromJson(Map<String, dynamic> json) =>
      _$FailedBatchItemFromJson(json);
}

/// An object that represents a filter formula along with the id of the context
/// row under which the filter function needs to evaluate.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Filter {
  /// A formula representing a filter function that returns zero or more matching
  /// rows from a table. Valid formulas in this field return a list of rows from a
  /// table. The most common ways of writing a formula to return a list of rows
  /// are to use the FindRow() or Filter() functions. Any other formula that
  /// returns zero or more rows is also acceptable. For example, you can use a
  /// formula that points to a cell that contains a filter function.
  @_s.JsonKey(name: 'formula')
  final String formula;

  /// The optional contextRowId attribute can be used to specify the row id of the
  /// context row if the filter formula contains unqualified references to table
  /// columns and needs a context row to evaluate them successfully.
  @_s.JsonKey(name: 'contextRowId')
  final String contextRowId;

  Filter({
    @_s.required this.formula,
    this.contextRowId,
  });
  Map<String, dynamic> toJson() => _$FilterToJson(this);
}

enum Format {
  @_s.JsonValue('AUTO')
  auto,
  @_s.JsonValue('NUMBER')
  number,
  @_s.JsonValue('CURRENCY')
  currency,
  @_s.JsonValue('DATE')
  date,
  @_s.JsonValue('TIME')
  time,
  @_s.JsonValue('DATE_TIME')
  dateTime,
  @_s.JsonValue('PERCENTAGE')
  percentage,
  @_s.JsonValue('TEXT')
  text,
  @_s.JsonValue('ACCOUNTING')
  accounting,
  @_s.JsonValue('CONTACT')
  contact,
  @_s.JsonValue('ROWLINK')
  rowlink,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetScreenDataResult {
  /// A map of all the rows on the screen keyed by block name.
  @_s.JsonKey(name: 'results')
  final Map<String, ResultSet> results;

  /// Indicates the cursor of the workbook at which the data returned by this
  /// workbook is read. Workbook cursor keeps increasing with every update and the
  /// increments are not sequential.
  @_s.JsonKey(name: 'workbookCursor')
  final int workbookCursor;

  /// Provides the pagination token to load the next page if there are more
  /// results matching the request. If a pagination token is not present in the
  /// response, it means that all data matching the query has been loaded.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  GetScreenDataResult({
    @_s.required this.results,
    @_s.required this.workbookCursor,
    this.nextToken,
  });
  factory GetScreenDataResult.fromJson(Map<String, dynamic> json) =>
      _$GetScreenDataResultFromJson(json);
}

enum ImportDataCharacterEncoding {
  @_s.JsonValue('UTF-8')
  utf_8,
  @_s.JsonValue('US-ASCII')
  usAscii,
  @_s.JsonValue('ISO-8859-1')
  iso_8859_1,
  @_s.JsonValue('UTF-16BE')
  utf_16be,
  @_s.JsonValue('UTF-16LE')
  utf_16le,
  @_s.JsonValue('UTF-16')
  utf_16,
}

/// An object that has details about the source of the data that was submitted
/// for import.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ImportDataSource {
  /// The configuration parameters for the data source of the import
  @_s.JsonKey(name: 'dataSourceConfig')
  final ImportDataSourceConfig dataSourceConfig;

  ImportDataSource({
    @_s.required this.dataSourceConfig,
  });
  factory ImportDataSource.fromJson(Map<String, dynamic> json) =>
      _$ImportDataSourceFromJson(json);

  Map<String, dynamic> toJson() => _$ImportDataSourceToJson(this);
}

/// An object that contains the configuration parameters for the data source of
/// an import request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ImportDataSourceConfig {
  /// The URL from which source data will be downloaded for the import request.
  @_s.JsonKey(name: 'dataSourceUrl')
  final String dataSourceUrl;

  ImportDataSourceConfig({
    this.dataSourceUrl,
  });
  factory ImportDataSourceConfig.fromJson(Map<String, dynamic> json) =>
      _$ImportDataSourceConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ImportDataSourceConfigToJson(this);
}

/// An object that contains the attributes of the submitter of the import job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ImportJobSubmitter {
  /// The email id of the submitter of the import job, if available.
  @_s.JsonKey(name: 'email')
  final String email;

  /// The AWS user ARN of the submitter of the import job, if available.
  @_s.JsonKey(name: 'userArn')
  final String userArn;

  ImportJobSubmitter({
    this.email,
    this.userArn,
  });
  factory ImportJobSubmitter.fromJson(Map<String, dynamic> json) =>
      _$ImportJobSubmitterFromJson(json);
}

/// An object that contains the options specified by the sumitter of the import
/// request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ImportOptions {
  /// Options relating to parsing delimited text. Required if dataFormat is
  /// DELIMITED_TEXT.
  @_s.JsonKey(name: 'delimitedTextOptions')
  final DelimitedTextImportOptions delimitedTextOptions;

  /// Options relating to the destination of the import request.
  @_s.JsonKey(name: 'destinationOptions')
  final DestinationOptions destinationOptions;

  ImportOptions({
    this.delimitedTextOptions,
    this.destinationOptions,
  });
  factory ImportOptions.fromJson(Map<String, dynamic> json) =>
      _$ImportOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$ImportOptionsToJson(this);
}

enum ImportSourceDataFormat {
  @_s.JsonValue('DELIMITED_TEXT')
  delimitedText,
}

extension on ImportSourceDataFormat {
  String toValue() {
    switch (this) {
      case ImportSourceDataFormat.delimitedText:
        return 'DELIMITED_TEXT';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InvokeScreenAutomationResult {
  /// The updated workbook cursor after performing the automation action.
  @_s.JsonKey(name: 'workbookCursor')
  final int workbookCursor;

  InvokeScreenAutomationResult({
    @_s.required this.workbookCursor,
  });
  factory InvokeScreenAutomationResult.fromJson(Map<String, dynamic> json) =>
      _$InvokeScreenAutomationResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTableColumnsResult {
  /// The list of columns in the table.
  @_s.JsonKey(name: 'tableColumns')
  final List<TableColumn> tableColumns;

  /// Provides the pagination token to load the next page if there are more
  /// results matching the request. If a pagination token is not present in the
  /// response, it means that all data matching the request has been loaded.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// Indicates the cursor of the workbook at which the data returned by this
  /// request is read. Workbook cursor keeps increasing with every update and the
  /// increments are not sequential.
  @_s.JsonKey(name: 'workbookCursor')
  final int workbookCursor;

  ListTableColumnsResult({
    @_s.required this.tableColumns,
    this.nextToken,
    this.workbookCursor,
  });
  factory ListTableColumnsResult.fromJson(Map<String, dynamic> json) =>
      _$ListTableColumnsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTableRowsResult {
  /// The list of columns in the table whose row data is returned in the result.
  @_s.JsonKey(name: 'columnIds')
  final List<String> columnIds;

  /// The list of rows in the table. Note that this result is paginated, so this
  /// list contains a maximum of 100 rows.
  @_s.JsonKey(name: 'rows')
  final List<TableRow> rows;

  /// Indicates the cursor of the workbook at which the data returned by this
  /// request is read. Workbook cursor keeps increasing with every update and the
  /// increments are not sequential.
  @_s.JsonKey(name: 'workbookCursor')
  final int workbookCursor;

  /// Provides the pagination token to load the next page if there are more
  /// results matching the request. If a pagination token is not present in the
  /// response, it means that all data matching the request has been loaded.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The list of row ids included in the request that were not found in the
  /// table.
  @_s.JsonKey(name: 'rowIdsNotFound')
  final List<String> rowIdsNotFound;

  ListTableRowsResult({
    @_s.required this.columnIds,
    @_s.required this.rows,
    @_s.required this.workbookCursor,
    this.nextToken,
    this.rowIdsNotFound,
  });
  factory ListTableRowsResult.fromJson(Map<String, dynamic> json) =>
      _$ListTableRowsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTablesResult {
  /// The list of tables in the workbook.
  @_s.JsonKey(name: 'tables')
  final List<Table> tables;

  /// Provides the pagination token to load the next page if there are more
  /// results matching the request. If a pagination token is not present in the
  /// response, it means that all data matching the request has been loaded.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// Indicates the cursor of the workbook at which the data returned by this
  /// request is read. Workbook cursor keeps increasing with every update and the
  /// increments are not sequential.
  @_s.JsonKey(name: 'workbookCursor')
  final int workbookCursor;

  ListTablesResult({
    @_s.required this.tables,
    this.nextToken,
    this.workbookCursor,
  });
  factory ListTablesResult.fromJson(Map<String, dynamic> json) =>
      _$ListTablesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class QueryTableRowsResult {
  /// The list of columns in the table whose row data is returned in the result.
  @_s.JsonKey(name: 'columnIds')
  final List<String> columnIds;

  /// The list of rows in the table that match the query filter.
  @_s.JsonKey(name: 'rows')
  final List<TableRow> rows;

  /// Indicates the cursor of the workbook at which the data returned by this
  /// request is read. Workbook cursor keeps increasing with every update and the
  /// increments are not sequential.
  @_s.JsonKey(name: 'workbookCursor')
  final int workbookCursor;

  /// Provides the pagination token to load the next page if there are more
  /// results matching the request. If a pagination token is not present in the
  /// response, it means that all data matching the request has been loaded.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  QueryTableRowsResult({
    @_s.required this.columnIds,
    @_s.required this.rows,
    @_s.required this.workbookCursor,
    this.nextToken,
  });
  factory QueryTableRowsResult.fromJson(Map<String, dynamic> json) =>
      _$QueryTableRowsResultFromJson(json);
}

/// A single row in the ResultSet.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResultRow {
  /// List of all the data cells in a row.
  @_s.JsonKey(name: 'dataItems')
  final List<DataItem> dataItems;

  /// The ID for a particular row.
  @_s.JsonKey(name: 'rowId')
  final String rowId;

  ResultRow({
    @_s.required this.dataItems,
    this.rowId,
  });
  factory ResultRow.fromJson(Map<String, dynamic> json) =>
      _$ResultRowFromJson(json);
}

/// ResultSet contains the results of the request for a single block or list
/// defined on the screen.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
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
  @_s.JsonKey(name: 'headers')
  final List<ColumnMetadata> headers;

  /// List of rows returned by the request. Each row has a row Id and a list of
  /// data cells in that row. The data cells will be present in the same order as
  /// they are defined in the header.
  @_s.JsonKey(name: 'rows')
  final List<ResultRow> rows;

  ResultSet({
    @_s.required this.headers,
    @_s.required this.rows,
  });
  factory ResultSet.fromJson(Map<String, dynamic> json) =>
      _$ResultSetFromJson(json);
}

/// An object that contains the properties for importing data to a specific
/// column in a table.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SourceDataColumnProperties {
  /// The index of the column in the input file.
  @_s.JsonKey(name: 'columnIndex')
  final int columnIndex;

  SourceDataColumnProperties({
    this.columnIndex,
  });
  factory SourceDataColumnProperties.fromJson(Map<String, dynamic> json) =>
      _$SourceDataColumnPropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$SourceDataColumnPropertiesToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartTableDataImportJobResult {
  /// The id that is assigned to this import job. Future requests to find out the
  /// status of this import job need to send this id in the appropriate parameter
  /// in the request.
  @_s.JsonKey(name: 'jobId')
  final String jobId;

  /// The status of the import job immediately after submitting the request.
  @_s.JsonKey(name: 'jobStatus')
  final TableDataImportJobStatus jobStatus;

  StartTableDataImportJobResult({
    @_s.required this.jobId,
    @_s.required this.jobStatus,
  });
  factory StartTableDataImportJobResult.fromJson(Map<String, dynamic> json) =>
      _$StartTableDataImportJobResultFromJson(json);
}

/// An object representing the properties of a table in a workbook.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Table {
  /// The id of the table.
  @_s.JsonKey(name: 'tableId')
  final String tableId;

  /// The name of the table.
  @_s.JsonKey(name: 'tableName')
  final String tableName;

  Table({
    this.tableId,
    this.tableName,
  });
  factory Table.fromJson(Map<String, dynamic> json) => _$TableFromJson(json);
}

/// An object that contains attributes about a single column in a table
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TableColumn {
  /// The column level format that is applied in the table. An empty value in this
  /// field means that the column format is the default value 'AUTO'.
  @_s.JsonKey(name: 'format')
  final Format format;

  /// The id of the column in the table.
  @_s.JsonKey(name: 'tableColumnId')
  final String tableColumnId;

  /// The name of the column in the table.
  @_s.JsonKey(name: 'tableColumnName')
  final String tableColumnName;

  TableColumn({
    this.format,
    this.tableColumnId,
    this.tableColumnName,
  });
  factory TableColumn.fromJson(Map<String, dynamic> json) =>
      _$TableColumnFromJson(json);
}

/// The metadata associated with the table data import job that was submitted.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TableDataImportJobMetadata {
  /// The source of the data that was submitted for import.
  @_s.JsonKey(name: 'dataSource')
  final ImportDataSource dataSource;

  /// The options that was specified at the time of submitting the import request.
  @_s.JsonKey(name: 'importOptions')
  final ImportOptions importOptions;

  /// The timestamp when the job was submitted for import.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'submitTime')
  final DateTime submitTime;

  /// Details about the submitter of the import request.
  @_s.JsonKey(name: 'submitter')
  final ImportJobSubmitter submitter;

  TableDataImportJobMetadata({
    @_s.required this.dataSource,
    @_s.required this.importOptions,
    @_s.required this.submitTime,
    @_s.required this.submitter,
  });
  factory TableDataImportJobMetadata.fromJson(Map<String, dynamic> json) =>
      _$TableDataImportJobMetadataFromJson(json);
}

enum TableDataImportJobStatus {
  @_s.JsonValue('SUBMITTED')
  submitted,
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('COMPLETED')
  completed,
  @_s.JsonValue('FAILED')
  failed,
}

/// An object that contains attributes about a single row in a table
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TableRow {
  /// A list of cells in the table row. The cells appear in the same order as the
  /// columns of the table.
  @_s.JsonKey(name: 'cells')
  final List<Cell> cells;

  /// The id of the row in the table.
  @_s.JsonKey(name: 'rowId')
  final String rowId;

  TableRow({
    @_s.required this.cells,
    @_s.required this.rowId,
  });
  factory TableRow.fromJson(Map<String, dynamic> json) =>
      _$TableRowFromJson(json);
}

/// Data needed to create a single row in a table as part of the
/// BatchCreateTableRows request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateRowData {
  /// A map representing the cells to update in the given row. The key is the
  /// column id of the cell and the value is the CellInput object that represents
  /// the data to set in that cell.
  @_s.JsonKey(name: 'cellsToUpdate')
  final Map<String, CellInput> cellsToUpdate;

  /// The id of the row that needs to be updated.
  @_s.JsonKey(name: 'rowId')
  final String rowId;

  UpdateRowData({
    @_s.required this.cellsToUpdate,
    @_s.required this.rowId,
  });
  Map<String, dynamic> toJson() => _$UpdateRowDataToJson(this);
}

enum UpsertAction {
  @_s.JsonValue('UPDATED')
  updated,
  @_s.JsonValue('APPENDED')
  appended,
}

/// Data needed to upsert rows in a table as part of a single item in the
/// BatchUpsertTableRows request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpsertRowData {
  /// An external identifier that represents a single item in the request that is
  /// being upserted as part of the BatchUpsertTableRows request. This can be any
  /// string that you can use to identify the item in the request. The
  /// BatchUpsertTableRows API puts the batch item id in the results to allow you
  /// to link data in the request to data in the results.
  @_s.JsonKey(name: 'batchItemId')
  final String batchItemId;

  /// A map representing the cells to update for the matching rows or an appended
  /// row. The key is the column id of the cell and the value is the CellInput
  /// object that represents the data to set in that cell.
  @_s.JsonKey(name: 'cellsToUpdate')
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
  @_s.JsonKey(name: 'filter')
  final Filter filter;

  UpsertRowData({
    @_s.required this.batchItemId,
    @_s.required this.cellsToUpdate,
    @_s.required this.filter,
  });
  Map<String, dynamic> toJson() => _$UpsertRowDataToJson(this);
}

/// An object that represents the result of a single upsert row request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpsertRowsResult {
  /// The list of row ids that were changed as part of an upsert row operation. If
  /// the upsert resulted in an update, this list could potentially contain
  /// multiple rows that matched the filter and hence got updated. If the upsert
  /// resulted in an append, this list would only have the single row that was
  /// appended.
  @_s.JsonKey(name: 'rowIds')
  final List<String> rowIds;

  /// The result of the upsert action.
  @_s.JsonKey(name: 'upsertAction')
  final UpsertAction upsertAction;

  UpsertRowsResult({
    @_s.required this.rowIds,
    @_s.required this.upsertAction,
  });
  factory UpsertRowsResult.fromJson(Map<String, dynamic> json) =>
      _$UpsertRowsResultFromJson(json);
}

/// The input variables to the app to be used by the InvokeScreenAutomation
/// action request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class VariableValue {
  /// Raw value of the variable.
  @_s.JsonKey(name: 'rawValue')
  final String rawValue;

  VariableValue({
    @_s.required this.rawValue,
  });
  Map<String, dynamic> toJson() => _$VariableValueToJson(this);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class AutomationExecutionException extends _s.GenericAwsException {
  AutomationExecutionException({String type, String message})
      : super(
            type: type, code: 'AutomationExecutionException', message: message);
}

class AutomationExecutionTimeoutException extends _s.GenericAwsException {
  AutomationExecutionTimeoutException({String type, String message})
      : super(
            type: type,
            code: 'AutomationExecutionTimeoutException',
            message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String type, String message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class RequestTimeoutException extends _s.GenericAwsException {
  RequestTimeoutException({String type, String message})
      : super(type: type, code: 'RequestTimeoutException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String type, String message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String type, String message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String type, String message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String type, String message})
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
