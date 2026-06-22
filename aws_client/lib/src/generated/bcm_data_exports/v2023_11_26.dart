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

import 'v2023_11_26.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// You can use the Data Exports API to create customized exports from multiple
/// Amazon Web Services cost management and billing datasets, such as cost and
/// usage data and cost optimization recommendations.
///
/// The Data Exports API provides the following endpoint:
///
/// <ul>
/// <li>
/// https://bcm-data-exports.us-east-1.api.aws
/// </li>
/// </ul>
class BcmDataExports {
  final _s.JsonProtocol _protocol;
  factory BcmDataExports({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'bcm-data-exports',
    );
    return BcmDataExports._(
      protocol: _s.JsonProtocol(
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
  BcmDataExports._({
    required _s.JsonProtocol protocol,
  }) : _protocol = protocol;

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Exports data based on the source data update.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [executionId] :
  /// The ID for this specific execution.
  ///
  /// Parameter [exportArn] :
  /// The Amazon Resource Name (ARN) of the Export object that generated this
  /// specific execution.
  Future<GetExecutionResponse> getExecution({
    required String executionId,
    required String exportArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSBillingAndCostManagementDataExports.GetExecution'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ExecutionId': executionId,
        'ExportArn': exportArn,
      },
    );

    return GetExecutionResponse.fromJson(jsonResponse.body);
  }

  /// Returns the metadata for the specified table and table properties. This
  /// includes the list of columns in the table schema, their data types, and
  /// column descriptions.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [tableName] :
  /// The name of the table.
  ///
  /// Parameter [tableProperties] :
  /// TableProperties are additional configurations you can provide to change
  /// the data and schema of a table. Each table can have different
  /// TableProperties. Tables are not required to have any TableProperties. Each
  /// table property has a default value that it assumes if not specified.
  Future<GetTableResponse> getTable({
    required String tableName,
    Map<String, String>? tableProperties,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSBillingAndCostManagementDataExports.GetTable'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TableName': tableName,
        if (tableProperties != null) 'TableProperties': tableProperties,
      },
    );

    return GetTableResponse.fromJson(jsonResponse.body);
  }

  /// Lists the historical executions for the export.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [exportArn] :
  /// The Amazon Resource Name (ARN) for this export.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects that are returned for the request.
  ///
  /// Parameter [nextToken] :
  /// The token to retrieve the next set of results.
  Future<ListExecutionsResponse> listExecutions({
    required String exportArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      300,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSBillingAndCostManagementDataExports.ListExecutions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ExportArn': exportArn,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListExecutionsResponse.fromJson(jsonResponse.body);
  }

  /// Lists all available tables in data exports.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects that are returned for the request.
  ///
  /// Parameter [nextToken] :
  /// The token to retrieve the next set of results.
  Future<ListTablesResponse> listTables({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      300,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSBillingAndCostManagementDataExports.ListTables'
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

    return ListTablesResponse.fromJson(jsonResponse.body);
  }

  /// List tags associated with an existing data export.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The unique identifier for the resource.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects that are returned for the request.
  ///
  /// Parameter [nextToken] :
  /// The token to retrieve the next set of results.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      300,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSBillingAndCostManagementDataExports.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Adds tags for an existing data export definition.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The unique identifier for the resource.
  ///
  /// Parameter [resourceTags] :
  /// The tags to associate with the resource. Each tag consists of a key and a
  /// value, and each key must be unique for the resource.
  Future<void> tagResource({
    required String resourceArn,
    required List<ResourceTag> resourceTags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSBillingAndCostManagementDataExports.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'ResourceTags': resourceTags,
      },
    );
  }

  /// Deletes tags associated with an existing data export definition.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The unique identifier for the resource.
  ///
  /// Parameter [resourceTagKeys] :
  /// The tag keys that are associated with the resource ARN.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> resourceTagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSBillingAndCostManagementDataExports.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'ResourceTagKeys': resourceTagKeys,
      },
    );
  }

  /// Creates a data export and specifies the data query, the delivery
  /// preference, and any optional resource tags.
  ///
  /// A <code>DataQuery</code> consists of both a <code>QueryStatement</code>
  /// and <code>TableConfigurations</code>.
  ///
  /// The <code>QueryStatement</code> is an SQL statement. Data Exports only
  /// supports a limited subset of the SQL syntax. For more information on the
  /// SQL syntax that is supported, see <a
  /// href="https://docs.aws.amazon.com/cur/latest/userguide/de-data-query.html">Data
  /// query</a>. To view the available tables and columns, see the <a
  /// href="https://docs.aws.amazon.com/cur/latest/userguide/de-table-dictionary.html">Data
  /// Exports table dictionary</a>.
  ///
  /// The <code>TableConfigurations</code> is a collection of specified
  /// <code>TableProperties</code> for the table being queried in the
  /// <code>QueryStatement</code>. TableProperties are additional configurations
  /// you can provide to change the data and schema of a table. Each table can
  /// have different TableProperties. However, tables are not required to have
  /// any TableProperties. Each table property has a default value that it
  /// assumes if not specified. For more information on table configurations,
  /// see <a
  /// href="https://docs.aws.amazon.com/cur/latest/userguide/de-data-query.html">Data
  /// query</a>. To view the table properties available for each table, see the
  /// <a
  /// href="https://docs.aws.amazon.com/cur/latest/userguide/de-table-dictionary.html">Data
  /// Exports table dictionary</a> or use the <code>ListTables</code> API to get
  /// a response of all tables and their available properties.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [export] :
  /// The details of the export, including data query, name, description, and
  /// destination configuration.
  ///
  /// Parameter [resourceTags] :
  /// An optional list of tags to associate with the specified export. Each tag
  /// consists of a key and a value, and each key must be unique for the
  /// resource.
  Future<CreateExportResponse> createExport({
    required Export export,
    List<ResourceTag>? resourceTags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSBillingAndCostManagementDataExports.CreateExport'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Export': export,
        if (resourceTags != null) 'ResourceTags': resourceTags,
      },
    );

    return CreateExportResponse.fromJson(jsonResponse.body);
  }

  /// Views the definition of an existing data export.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [exportArn] :
  /// The Amazon Resource Name (ARN) for this export.
  Future<GetExportResponse> getExport({
    required String exportArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSBillingAndCostManagementDataExports.GetExport'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ExportArn': exportArn,
      },
    );

    return GetExportResponse.fromJson(jsonResponse.body);
  }

  /// Updates an existing data export by overwriting all export parameters. All
  /// export parameters must be provided in the UpdateExport request.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [export] :
  /// The name and query details for the export.
  ///
  /// Parameter [exportArn] :
  /// The Amazon Resource Name (ARN) for this export.
  Future<UpdateExportResponse> updateExport({
    required Export export,
    required String exportArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSBillingAndCostManagementDataExports.UpdateExport'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Export': export,
        'ExportArn': exportArn,
      },
    );

    return UpdateExportResponse.fromJson(jsonResponse.body);
  }

  /// Deletes an existing data export.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [exportArn] :
  /// The Amazon Resource Name (ARN) for this export.
  Future<DeleteExportResponse> deleteExport({
    required String exportArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSBillingAndCostManagementDataExports.DeleteExport'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ExportArn': exportArn,
      },
    );

    return DeleteExportResponse.fromJson(jsonResponse.body);
  }

  /// Lists all data export definitions.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects that are returned for the request.
  ///
  /// Parameter [nextToken] :
  /// The token to retrieve the next set of results.
  Future<ListExportsResponse> listExports({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      300,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSBillingAndCostManagementDataExports.ListExports'
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

    return ListExportsResponse.fromJson(jsonResponse.body);
  }
}

/// @nodoc
class GetExecutionResponse {
  /// The ID for this specific execution.
  final String? executionId;

  /// The status of this specific execution.
  final ExecutionStatus? executionStatus;

  /// The export data for this specific execution. This export data is a snapshot
  /// from when the execution was generated. The data could be different from the
  /// current export data if the export was updated since the execution was
  /// generated.
  final Export? export;

  GetExecutionResponse({
    this.executionId,
    this.executionStatus,
    this.export,
  });

  factory GetExecutionResponse.fromJson(Map<String, dynamic> json) {
    return GetExecutionResponse(
      executionId: json['ExecutionId'] as String?,
      executionStatus: json['ExecutionStatus'] != null
          ? ExecutionStatus.fromJson(
              json['ExecutionStatus'] as Map<String, dynamic>)
          : null,
      export: json['Export'] != null
          ? Export.fromJson(json['Export'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final executionId = this.executionId;
    final executionStatus = this.executionStatus;
    final export = this.export;
    return {
      if (executionId != null) 'ExecutionId': executionId,
      if (executionStatus != null) 'ExecutionStatus': executionStatus,
      if (export != null) 'Export': export,
    };
  }
}

/// @nodoc
class GetTableResponse {
  /// The table description.
  final String? description;

  /// The schema of the table.
  final List<Column>? schema;

  /// The name of the table.
  final String? tableName;

  /// TableProperties are additional configurations you can provide to change the
  /// data and schema of a table. Each table can have different TableProperties.
  /// Tables are not required to have any TableProperties. Each table property has
  /// a default value that it assumes if not specified.
  final Map<String, String>? tableProperties;

  GetTableResponse({
    this.description,
    this.schema,
    this.tableName,
    this.tableProperties,
  });

  factory GetTableResponse.fromJson(Map<String, dynamic> json) {
    return GetTableResponse(
      description: json['Description'] as String?,
      schema: (json['Schema'] as List?)
          ?.nonNulls
          .map((e) => Column.fromJson(e as Map<String, dynamic>))
          .toList(),
      tableName: json['TableName'] as String?,
      tableProperties: (json['TableProperties'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final schema = this.schema;
    final tableName = this.tableName;
    final tableProperties = this.tableProperties;
    return {
      if (description != null) 'Description': description,
      if (schema != null) 'Schema': schema,
      if (tableName != null) 'TableName': tableName,
      if (tableProperties != null) 'TableProperties': tableProperties,
    };
  }
}

/// @nodoc
class ListExecutionsResponse {
  /// The list of executions.
  final List<ExecutionReference>? executions;

  /// The token to retrieve the next set of results.
  final String? nextToken;

  ListExecutionsResponse({
    this.executions,
    this.nextToken,
  });

  factory ListExecutionsResponse.fromJson(Map<String, dynamic> json) {
    return ListExecutionsResponse(
      executions: (json['Executions'] as List?)
          ?.nonNulls
          .map((e) => ExecutionReference.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final executions = this.executions;
    final nextToken = this.nextToken;
    return {
      if (executions != null) 'Executions': executions,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class ListTablesResponse {
  /// The token to retrieve the next set of results.
  final String? nextToken;

  /// The list of tables.
  final List<Table>? tables;

  ListTablesResponse({
    this.nextToken,
    this.tables,
  });

  factory ListTablesResponse.fromJson(Map<String, dynamic> json) {
    return ListTablesResponse(
      nextToken: json['NextToken'] as String?,
      tables: (json['Tables'] as List?)
          ?.nonNulls
          .map((e) => Table.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final tables = this.tables;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (tables != null) 'Tables': tables,
    };
  }
}

/// @nodoc
class ListTagsForResourceResponse {
  /// The token to retrieve the next set of results.
  final String? nextToken;

  /// An optional list of tags to associate with the specified export. Each tag
  /// consists of a key and a value, and each key must be unique for the resource.
  final List<ResourceTag>? resourceTags;

  ListTagsForResourceResponse({
    this.nextToken,
    this.resourceTags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      nextToken: json['NextToken'] as String?,
      resourceTags: (json['ResourceTags'] as List?)
          ?.nonNulls
          .map((e) => ResourceTag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final resourceTags = this.resourceTags;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (resourceTags != null) 'ResourceTags': resourceTags,
    };
  }
}

/// @nodoc
class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class CreateExportResponse {
  /// The Amazon Resource Name (ARN) for this export.
  final String? exportArn;

  CreateExportResponse({
    this.exportArn,
  });

  factory CreateExportResponse.fromJson(Map<String, dynamic> json) {
    return CreateExportResponse(
      exportArn: json['ExportArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final exportArn = this.exportArn;
    return {
      if (exportArn != null) 'ExportArn': exportArn,
    };
  }
}

/// @nodoc
class GetExportResponse {
  /// The data for this specific export.
  final Export? export;

  /// The status of this specific export.
  final ExportStatus? exportStatus;

  GetExportResponse({
    this.export,
    this.exportStatus,
  });

  factory GetExportResponse.fromJson(Map<String, dynamic> json) {
    return GetExportResponse(
      export: json['Export'] != null
          ? Export.fromJson(json['Export'] as Map<String, dynamic>)
          : null,
      exportStatus: json['ExportStatus'] != null
          ? ExportStatus.fromJson(json['ExportStatus'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final export = this.export;
    final exportStatus = this.exportStatus;
    return {
      if (export != null) 'Export': export,
      if (exportStatus != null) 'ExportStatus': exportStatus,
    };
  }
}

/// @nodoc
class UpdateExportResponse {
  /// The Amazon Resource Name (ARN) for this export.
  final String? exportArn;

  UpdateExportResponse({
    this.exportArn,
  });

  factory UpdateExportResponse.fromJson(Map<String, dynamic> json) {
    return UpdateExportResponse(
      exportArn: json['ExportArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final exportArn = this.exportArn;
    return {
      if (exportArn != null) 'ExportArn': exportArn,
    };
  }
}

/// @nodoc
class DeleteExportResponse {
  /// The Amazon Resource Name (ARN) for this export.
  final String? exportArn;

  DeleteExportResponse({
    this.exportArn,
  });

  factory DeleteExportResponse.fromJson(Map<String, dynamic> json) {
    return DeleteExportResponse(
      exportArn: json['ExportArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final exportArn = this.exportArn;
    return {
      if (exportArn != null) 'ExportArn': exportArn,
    };
  }
}

/// @nodoc
class ListExportsResponse {
  /// The details of the exports, including name and export status.
  final List<ExportReference>? exports;

  /// The token to retrieve the next set of results.
  final String? nextToken;

  ListExportsResponse({
    this.exports,
    this.nextToken,
  });

  factory ListExportsResponse.fromJson(Map<String, dynamic> json) {
    return ListExportsResponse(
      exports: (json['Exports'] as List?)
          ?.nonNulls
          .map((e) => ExportReference.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final exports = this.exports;
    final nextToken = this.nextToken;
    return {
      if (exports != null) 'Exports': exports,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// The reference details for a given export.
///
/// @nodoc
class ExportReference {
  /// The Amazon Resource Name (ARN) for this export.
  final String exportArn;

  /// The name of this specific data export.
  final String exportName;

  /// The status of this specific data export.
  final ExportStatus exportStatus;

  ExportReference({
    required this.exportArn,
    required this.exportName,
    required this.exportStatus,
  });

  factory ExportReference.fromJson(Map<String, dynamic> json) {
    return ExportReference(
      exportArn: (json['ExportArn'] as String?) ?? '',
      exportName: (json['ExportName'] as String?) ?? '',
      exportStatus: ExportStatus.fromJson(
          (json['ExportStatus'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final exportArn = this.exportArn;
    final exportName = this.exportName;
    final exportStatus = this.exportStatus;
    return {
      'ExportArn': exportArn,
      'ExportName': exportName,
      'ExportStatus': exportStatus,
    };
  }
}

/// The status of the data export.
///
/// @nodoc
class ExportStatus {
  /// The timestamp of when the export was created.
  final DateTime? createdAt;

  /// The timestamp of when the export was last generated.
  final DateTime? lastRefreshedAt;

  /// The timestamp of when the export was updated.
  final DateTime? lastUpdatedAt;

  /// The status code for the request.
  final ExportStatusCode? statusCode;

  /// The description for the status code.
  final ExecutionStatusReason? statusReason;

  ExportStatus({
    this.createdAt,
    this.lastRefreshedAt,
    this.lastUpdatedAt,
    this.statusCode,
    this.statusReason,
  });

  factory ExportStatus.fromJson(Map<String, dynamic> json) {
    return ExportStatus(
      createdAt: timeStampFromJson(json['CreatedAt']),
      lastRefreshedAt: timeStampFromJson(json['LastRefreshedAt']),
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      statusCode:
          (json['StatusCode'] as String?)?.let(ExportStatusCode.fromString),
      statusReason: (json['StatusReason'] as String?)
          ?.let(ExecutionStatusReason.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final lastRefreshedAt = this.lastRefreshedAt;
    final lastUpdatedAt = this.lastUpdatedAt;
    final statusCode = this.statusCode;
    final statusReason = this.statusReason;
    return {
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (lastRefreshedAt != null)
        'LastRefreshedAt': iso8601ToJson(lastRefreshedAt),
      if (lastUpdatedAt != null) 'LastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      if (statusCode != null) 'StatusCode': statusCode.value,
      if (statusReason != null) 'StatusReason': statusReason.value,
    };
  }
}

/// @nodoc
class ExportStatusCode {
  static const healthy = ExportStatusCode._('HEALTHY');
  static const unhealthy = ExportStatusCode._('UNHEALTHY');

  final String value;

  const ExportStatusCode._(this.value);

  static const values = [healthy, unhealthy];

  static ExportStatusCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ExportStatusCode._(value));

  @override
  bool operator ==(other) => other is ExportStatusCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ExecutionStatusReason {
  static const insufficientPermission =
      ExecutionStatusReason._('INSUFFICIENT_PERMISSION');
  static const billOwnerChanged = ExecutionStatusReason._('BILL_OWNER_CHANGED');
  static const internalFailure = ExecutionStatusReason._('INTERNAL_FAILURE');

  final String value;

  const ExecutionStatusReason._(this.value);

  static const values = [
    insufficientPermission,
    billOwnerChanged,
    internalFailure
  ];

  static ExecutionStatusReason fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ExecutionStatusReason._(value));

  @override
  bool operator ==(other) =>
      other is ExecutionStatusReason && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The details that are available for an export.
///
/// @nodoc
class Export {
  /// The data query for this specific data export.
  final DataQuery dataQuery;

  /// The destination configuration for this specific data export.
  final DestinationConfigurations destinationConfigurations;

  /// The name of this specific data export.
  final String name;

  /// The cadence for Amazon Web Services to update the export in your S3 bucket.
  final RefreshCadence refreshCadence;

  /// The description for this specific data export.
  final String? description;

  /// The Amazon Resource Name (ARN) for this export.
  final String? exportArn;

  Export({
    required this.dataQuery,
    required this.destinationConfigurations,
    required this.name,
    required this.refreshCadence,
    this.description,
    this.exportArn,
  });

  factory Export.fromJson(Map<String, dynamic> json) {
    return Export(
      dataQuery: DataQuery.fromJson(
          (json['DataQuery'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      destinationConfigurations: DestinationConfigurations.fromJson(
          (json['DestinationConfigurations'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      name: (json['Name'] as String?) ?? '',
      refreshCadence: RefreshCadence.fromJson(
          (json['RefreshCadence'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      description: json['Description'] as String?,
      exportArn: json['ExportArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataQuery = this.dataQuery;
    final destinationConfigurations = this.destinationConfigurations;
    final name = this.name;
    final refreshCadence = this.refreshCadence;
    final description = this.description;
    final exportArn = this.exportArn;
    return {
      'DataQuery': dataQuery,
      'DestinationConfigurations': destinationConfigurations,
      'Name': name,
      'RefreshCadence': refreshCadence,
      if (description != null) 'Description': description,
      if (exportArn != null) 'ExportArn': exportArn,
    };
  }
}

/// The SQL query of column selections and row filters from the data table you
/// want.
///
/// @nodoc
class DataQuery {
  /// The query statement.
  final String queryStatement;

  /// The table configuration.
  final Map<String, Map<String, String>>? tableConfigurations;

  DataQuery({
    required this.queryStatement,
    this.tableConfigurations,
  });

  factory DataQuery.fromJson(Map<String, dynamic> json) {
    return DataQuery(
      queryStatement: (json['QueryStatement'] as String?) ?? '',
      tableConfigurations:
          (json['TableConfigurations'] as Map<String, dynamic>?)?.map((k, e) =>
              MapEntry(
                  k,
                  (e as Map<String, dynamic>)
                      .map((k, e) => MapEntry(k, e as String)))),
    );
  }

  Map<String, dynamic> toJson() {
    final queryStatement = this.queryStatement;
    final tableConfigurations = this.tableConfigurations;
    return {
      'QueryStatement': queryStatement,
      if (tableConfigurations != null)
        'TableConfigurations': tableConfigurations,
    };
  }
}

/// The destinations used for data exports.
///
/// @nodoc
class DestinationConfigurations {
  /// An object that describes the destination of the data exports file.
  final S3Destination s3Destination;

  DestinationConfigurations({
    required this.s3Destination,
  });

  factory DestinationConfigurations.fromJson(Map<String, dynamic> json) {
    return DestinationConfigurations(
      s3Destination: S3Destination.fromJson(
          (json['S3Destination'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final s3Destination = this.s3Destination;
    return {
      'S3Destination': s3Destination,
    };
  }
}

/// The cadence for Amazon Web Services to update the data export in your S3
/// bucket.
///
/// @nodoc
class RefreshCadence {
  /// The frequency that data exports are updated. The export refreshes each time
  /// the source data updates, up to three times daily.
  final FrequencyOption frequency;

  RefreshCadence({
    required this.frequency,
  });

  factory RefreshCadence.fromJson(Map<String, dynamic> json) {
    return RefreshCadence(
      frequency:
          FrequencyOption.fromString((json['Frequency'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final frequency = this.frequency;
    return {
      'Frequency': frequency.value,
    };
  }
}

/// @nodoc
class FrequencyOption {
  static const synchronous = FrequencyOption._('SYNCHRONOUS');

  final String value;

  const FrequencyOption._(this.value);

  static const values = [synchronous];

  static FrequencyOption fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FrequencyOption._(value));

  @override
  bool operator ==(other) => other is FrequencyOption && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes the destination Amazon Simple Storage Service (Amazon S3) bucket
/// name and object keys of a data exports file.
///
/// @nodoc
class S3Destination {
  /// The name of the Amazon S3 bucket used as the destination of a data export
  /// file.
  final String s3Bucket;

  /// The output configuration for the data export.
  final S3OutputConfigurations s3OutputConfigurations;

  /// The S3 path prefix you want prepended to the name of your data export.
  final String s3Prefix;

  /// The S3 bucket Region.
  final String s3Region;

  /// The AWS Account ID that owns the S3 bucket used as the destination for the
  /// data export.
  final String? s3BucketOwner;

  S3Destination({
    required this.s3Bucket,
    required this.s3OutputConfigurations,
    required this.s3Prefix,
    required this.s3Region,
    this.s3BucketOwner,
  });

  factory S3Destination.fromJson(Map<String, dynamic> json) {
    return S3Destination(
      s3Bucket: (json['S3Bucket'] as String?) ?? '',
      s3OutputConfigurations: S3OutputConfigurations.fromJson(
          (json['S3OutputConfigurations'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      s3Prefix: (json['S3Prefix'] as String?) ?? '',
      s3Region: (json['S3Region'] as String?) ?? '',
      s3BucketOwner: json['S3BucketOwner'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Bucket = this.s3Bucket;
    final s3OutputConfigurations = this.s3OutputConfigurations;
    final s3Prefix = this.s3Prefix;
    final s3Region = this.s3Region;
    final s3BucketOwner = this.s3BucketOwner;
    return {
      'S3Bucket': s3Bucket,
      'S3OutputConfigurations': s3OutputConfigurations,
      'S3Prefix': s3Prefix,
      'S3Region': s3Region,
      if (s3BucketOwner != null) 'S3BucketOwner': s3BucketOwner,
    };
  }
}

/// The compression type, file format, and overwrite preference for the data
/// export.
///
/// @nodoc
class S3OutputConfigurations {
  /// The compression type for the data export.
  final CompressionOption compression;

  /// The file format for the data export.
  final FormatOption format;

  /// The output type for the data export.
  final S3OutputType outputType;

  /// The rule to follow when generating a version of the data export file. You
  /// have the choice to overwrite the previous version or to be delivered in
  /// addition to the previous versions. Overwriting exports can save on Amazon S3
  /// storage costs. Creating new export versions allows you to track the changes
  /// in cost and usage data over time.
  final OverwriteOption overwrite;

  S3OutputConfigurations({
    required this.compression,
    required this.format,
    required this.outputType,
    required this.overwrite,
  });

  factory S3OutputConfigurations.fromJson(Map<String, dynamic> json) {
    return S3OutputConfigurations(
      compression:
          CompressionOption.fromString((json['Compression'] as String?) ?? ''),
      format: FormatOption.fromString((json['Format'] as String?) ?? ''),
      outputType:
          S3OutputType.fromString((json['OutputType'] as String?) ?? ''),
      overwrite:
          OverwriteOption.fromString((json['Overwrite'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final compression = this.compression;
    final format = this.format;
    final outputType = this.outputType;
    final overwrite = this.overwrite;
    return {
      'Compression': compression.value,
      'Format': format.value,
      'OutputType': outputType.value,
      'Overwrite': overwrite.value,
    };
  }
}

/// @nodoc
class S3OutputType {
  static const custom = S3OutputType._('CUSTOM');
  static const athena = S3OutputType._('ATHENA');
  static const redshift = S3OutputType._('REDSHIFT');

  final String value;

  const S3OutputType._(this.value);

  static const values = [custom, athena, redshift];

  static S3OutputType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => S3OutputType._(value));

  @override
  bool operator ==(other) => other is S3OutputType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class FormatOption {
  static const textOrCsv = FormatOption._('TEXT_OR_CSV');
  static const parquet = FormatOption._('PARQUET');

  final String value;

  const FormatOption._(this.value);

  static const values = [textOrCsv, parquet];

  static FormatOption fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => FormatOption._(value));

  @override
  bool operator ==(other) => other is FormatOption && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class CompressionOption {
  static const gzip = CompressionOption._('GZIP');
  static const parquet = CompressionOption._('PARQUET');

  final String value;

  const CompressionOption._(this.value);

  static const values = [gzip, parquet];

  static CompressionOption fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CompressionOption._(value));

  @override
  bool operator ==(other) => other is CompressionOption && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class OverwriteOption {
  static const createNewReport = OverwriteOption._('CREATE_NEW_REPORT');
  static const overwriteReport = OverwriteOption._('OVERWRITE_REPORT');

  final String value;

  const OverwriteOption._(this.value);

  static const values = [createNewReport, overwriteReport];

  static OverwriteOption fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => OverwriteOption._(value));

  @override
  bool operator ==(other) => other is OverwriteOption && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The tag structure that contains a tag key and value.
///
/// @nodoc
class ResourceTag {
  /// The key that's associated with the tag.
  final String key;

  /// The value that's associated with the tag.
  final String value;

  ResourceTag({
    required this.key,
    required this.value,
  });

  factory ResourceTag.fromJson(Map<String, dynamic> json) {
    return ResourceTag(
      key: (json['Key'] as String?) ?? '',
      value: (json['Value'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'Key': key,
      'Value': value,
    };
  }
}

/// The details for the data export table.
///
/// @nodoc
class Table {
  /// The description for the table.
  final String? description;

  /// The name of the table.
  final String? tableName;

  /// The properties for the table.
  final List<TablePropertyDescription>? tableProperties;

  Table({
    this.description,
    this.tableName,
    this.tableProperties,
  });

  factory Table.fromJson(Map<String, dynamic> json) {
    return Table(
      description: json['Description'] as String?,
      tableName: json['TableName'] as String?,
      tableProperties: (json['TableProperties'] as List?)
          ?.nonNulls
          .map((e) =>
              TablePropertyDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final tableName = this.tableName;
    final tableProperties = this.tableProperties;
    return {
      if (description != null) 'Description': description,
      if (tableName != null) 'TableName': tableName,
      if (tableProperties != null) 'TableProperties': tableProperties,
    };
  }
}

/// The properties for the data export table.
///
/// @nodoc
class TablePropertyDescription {
  /// The default value for the table.
  final String? defaultValue;

  /// The description for the table.
  final String? description;

  /// The name of the table.
  final String? name;

  /// The valid values for the table.
  final List<String>? validValues;

  TablePropertyDescription({
    this.defaultValue,
    this.description,
    this.name,
    this.validValues,
  });

  factory TablePropertyDescription.fromJson(Map<String, dynamic> json) {
    return TablePropertyDescription(
      defaultValue: json['DefaultValue'] as String?,
      description: json['Description'] as String?,
      name: json['Name'] as String?,
      validValues: (json['ValidValues'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final defaultValue = this.defaultValue;
    final description = this.description;
    final name = this.name;
    final validValues = this.validValues;
    return {
      if (defaultValue != null) 'DefaultValue': defaultValue,
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
      if (validValues != null) 'ValidValues': validValues,
    };
  }
}

/// The reference for the data export update.
///
/// @nodoc
class ExecutionReference {
  /// The ID for this specific execution.
  final String executionId;

  /// The status of this specific execution.
  final ExecutionStatus executionStatus;

  ExecutionReference({
    required this.executionId,
    required this.executionStatus,
  });

  factory ExecutionReference.fromJson(Map<String, dynamic> json) {
    return ExecutionReference(
      executionId: (json['ExecutionId'] as String?) ?? '',
      executionStatus: ExecutionStatus.fromJson(
          (json['ExecutionStatus'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final executionId = this.executionId;
    final executionStatus = this.executionStatus;
    return {
      'ExecutionId': executionId,
      'ExecutionStatus': executionStatus,
    };
  }
}

/// The status of the execution.
///
/// @nodoc
class ExecutionStatus {
  /// The time when the execution was completed.
  final DateTime? completedAt;

  /// The time when the execution was created.
  final DateTime? createdAt;

  /// The time when the execution was last updated.
  final DateTime? lastUpdatedAt;

  /// The code for the status of the execution.
  final ExecutionStatusCode? statusCode;

  /// The reason for the failed status.
  final ExecutionStatusReason? statusReason;

  ExecutionStatus({
    this.completedAt,
    this.createdAt,
    this.lastUpdatedAt,
    this.statusCode,
    this.statusReason,
  });

  factory ExecutionStatus.fromJson(Map<String, dynamic> json) {
    return ExecutionStatus(
      completedAt: timeStampFromJson(json['CompletedAt']),
      createdAt: timeStampFromJson(json['CreatedAt']),
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      statusCode:
          (json['StatusCode'] as String?)?.let(ExecutionStatusCode.fromString),
      statusReason: (json['StatusReason'] as String?)
          ?.let(ExecutionStatusReason.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final completedAt = this.completedAt;
    final createdAt = this.createdAt;
    final lastUpdatedAt = this.lastUpdatedAt;
    final statusCode = this.statusCode;
    final statusReason = this.statusReason;
    return {
      if (completedAt != null) 'CompletedAt': iso8601ToJson(completedAt),
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (lastUpdatedAt != null) 'LastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      if (statusCode != null) 'StatusCode': statusCode.value,
      if (statusReason != null) 'StatusReason': statusReason.value,
    };
  }
}

/// @nodoc
class ExecutionStatusCode {
  static const initiationInProcess =
      ExecutionStatusCode._('INITIATION_IN_PROCESS');
  static const queryQueued = ExecutionStatusCode._('QUERY_QUEUED');
  static const queryInProcess = ExecutionStatusCode._('QUERY_IN_PROCESS');
  static const queryFailure = ExecutionStatusCode._('QUERY_FAILURE');
  static const deliveryInProcess = ExecutionStatusCode._('DELIVERY_IN_PROCESS');
  static const deliverySuccess = ExecutionStatusCode._('DELIVERY_SUCCESS');
  static const deliveryFailure = ExecutionStatusCode._('DELIVERY_FAILURE');

  final String value;

  const ExecutionStatusCode._(this.value);

  static const values = [
    initiationInProcess,
    queryQueued,
    queryInProcess,
    queryFailure,
    deliveryInProcess,
    deliverySuccess,
    deliveryFailure
  ];

  static ExecutionStatusCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ExecutionStatusCode._(value));

  @override
  bool operator ==(other) =>
      other is ExecutionStatusCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Includes basic information for a data column such as its description, name,
/// and type.
///
/// @nodoc
class Column {
  /// The description for a column.
  final String? description;

  /// The column name.
  final String? name;

  /// The kind of data a column stores.
  final String? type;

  Column({
    this.description,
    this.name,
    this.type,
  });

  factory Column.fromJson(Map<String, dynamic> json) {
    return Column(
      description: json['Description'] as String?,
      name: json['Name'] as String?,
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final name = this.name;
    final type = this.type;
    return {
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
      if (type != null) 'Type': type,
    };
  }
}

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
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
