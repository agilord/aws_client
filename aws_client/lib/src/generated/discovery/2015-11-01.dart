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

/// AWS Application Discovery Service helps you plan application migration
/// projects. It automatically identifies servers, virtual machines (VMs), and
/// network dependencies in your on-premises data centers. For more information,
/// see the <a href="http://aws.amazon.com/application-discovery/faqs/">AWS
/// Application Discovery Service FAQ</a>. Application Discovery Service offers
/// three ways of performing discovery and collecting data about your
/// on-premises servers:
class ApplicationDiscovery {
  final _s.JsonProtocol _protocol;
  ApplicationDiscovery({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'discovery',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Associates one or more configuration items with an application.
  ///
  /// May throw [AuthorizationErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ServerInternalErrorException].
  /// May throw [HomeRegionNotSetException].
  ///
  /// Parameter [applicationConfigurationId] :
  /// The configuration ID of an application with which items are to be
  /// associated.
  ///
  /// Parameter [configurationIds] :
  /// The ID of each configuration item to be associated with an application.
  Future<void> associateConfigurationItemsToApplication({
    required String applicationConfigurationId,
    required List<String> configurationIds,
  }) async {
    ArgumentError.checkNotNull(
        applicationConfigurationId, 'applicationConfigurationId');
    ArgumentError.checkNotNull(configurationIds, 'configurationIds');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSPoseidonService_V2015_11_01.AssociateConfigurationItemsToApplication'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'applicationConfigurationId': applicationConfigurationId,
        'configurationIds': configurationIds,
      },
    );
  }

  /// Deletes one or more import tasks, each identified by their import ID. Each
  /// import task has a number of records that can identify servers or
  /// applications.
  ///
  /// AWS Application Discovery Service has built-in matching logic that will
  /// identify when discovered servers match existing entries that you've
  /// previously discovered, the information for the already-existing discovered
  /// server is updated. When you delete an import task that contains records
  /// that were used to match, the information in those matched records that
  /// comes from the deleted records will also be deleted.
  ///
  /// May throw [AuthorizationErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ServerInternalErrorException].
  /// May throw [HomeRegionNotSetException].
  ///
  /// Parameter [importTaskIds] :
  /// The IDs for the import tasks that you want to delete.
  Future<BatchDeleteImportDataResponse> batchDeleteImportData({
    required List<String> importTaskIds,
  }) async {
    ArgumentError.checkNotNull(importTaskIds, 'importTaskIds');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSPoseidonService_V2015_11_01.BatchDeleteImportData'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'importTaskIds': importTaskIds,
      },
    );

    return BatchDeleteImportDataResponse.fromJson(jsonResponse.body);
  }

  /// Creates an application with the given name and description.
  ///
  /// May throw [AuthorizationErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ServerInternalErrorException].
  /// May throw [HomeRegionNotSetException].
  ///
  /// Parameter [name] :
  /// Name of the application to be created.
  ///
  /// Parameter [description] :
  /// Description of the application to be created.
  Future<CreateApplicationResponse> createApplication({
    required String name,
    String? description,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSPoseidonService_V2015_11_01.CreateApplication'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        if (description != null) 'description': description,
      },
    );

    return CreateApplicationResponse.fromJson(jsonResponse.body);
  }

  /// Creates one or more tags for configuration items. Tags are metadata that
  /// help you categorize IT assets. This API accepts a list of multiple
  /// configuration items.
  ///
  /// May throw [AuthorizationErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ServerInternalErrorException].
  /// May throw [HomeRegionNotSetException].
  ///
  /// Parameter [configurationIds] :
  /// A list of configuration items that you want to tag.
  ///
  /// Parameter [tags] :
  /// Tags that you want to associate with one or more configuration items.
  /// Specify the tags that you want to create in a <i>key</i>-<i>value</i>
  /// format. For example:
  ///
  /// <code>{"key": "serverType", "value": "webServer"}</code>
  Future<void> createTags({
    required List<String> configurationIds,
    required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(configurationIds, 'configurationIds');
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSPoseidonService_V2015_11_01.CreateTags'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'configurationIds': configurationIds,
        'tags': tags,
      },
    );
  }

  /// Deletes a list of applications and their associations with configuration
  /// items.
  ///
  /// May throw [AuthorizationErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ServerInternalErrorException].
  /// May throw [HomeRegionNotSetException].
  ///
  /// Parameter [configurationIds] :
  /// Configuration ID of an application to be deleted.
  Future<void> deleteApplications({
    required List<String> configurationIds,
  }) async {
    ArgumentError.checkNotNull(configurationIds, 'configurationIds');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSPoseidonService_V2015_11_01.DeleteApplications'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'configurationIds': configurationIds,
      },
    );
  }

  /// Deletes the association between configuration items and one or more tags.
  /// This API accepts a list of multiple configuration items.
  ///
  /// May throw [AuthorizationErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ServerInternalErrorException].
  /// May throw [HomeRegionNotSetException].
  ///
  /// Parameter [configurationIds] :
  /// A list of configuration items with tags that you want to delete.
  ///
  /// Parameter [tags] :
  /// Tags that you want to delete from one or more configuration items. Specify
  /// the tags that you want to delete in a <i>key</i>-<i>value</i> format. For
  /// example:
  ///
  /// <code>{"key": "serverType", "value": "webServer"}</code>
  Future<void> deleteTags({
    required List<String> configurationIds,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(configurationIds, 'configurationIds');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSPoseidonService_V2015_11_01.DeleteTags'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'configurationIds': configurationIds,
        if (tags != null) 'tags': tags,
      },
    );
  }

  /// Lists agents or connectors as specified by ID or other filters. All
  /// agents/connectors associated with your user account can be listed if you
  /// call <code>DescribeAgents</code> as is without passing any parameters.
  ///
  /// May throw [AuthorizationErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ServerInternalErrorException].
  /// May throw [HomeRegionNotSetException].
  ///
  /// Parameter [agentIds] :
  /// The agent or the Connector IDs for which you want information. If you
  /// specify no IDs, the system returns information about all agents/Connectors
  /// associated with your AWS user account.
  ///
  /// Parameter [filters] :
  /// You can filter the request using various logical operators and a
  /// <i>key</i>-<i>value</i> format. For example:
  ///
  /// <code>{"key": "collectionStatus", "value": "STARTED"}</code>
  ///
  /// Parameter [maxResults] :
  /// The total number of agents/Connectors to return in a single page of
  /// output. The maximum value is 100.
  ///
  /// Parameter [nextToken] :
  /// Token to retrieve the next set of results. For example, if you previously
  /// specified 100 IDs for <code>DescribeAgentsRequest$agentIds</code> but set
  /// <code>DescribeAgentsRequest$maxResults</code> to 10, you received a set of
  /// 10 results along with a token. Use that token in this query to get the
  /// next set of 10.
  Future<DescribeAgentsResponse> describeAgents({
    List<String>? agentIds,
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSPoseidonService_V2015_11_01.DescribeAgents'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (agentIds != null) 'agentIds': agentIds,
        if (filters != null) 'filters': filters,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return DescribeAgentsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves attributes for a list of configuration item IDs.
  /// <note>
  /// All of the supplied IDs must be for the same asset type from one of the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// server
  /// </li>
  /// <li>
  /// application
  /// </li>
  /// <li>
  /// process
  /// </li>
  /// <li>
  /// connection
  /// </li>
  /// </ul>
  /// Output fields are specific to the asset type specified. For example, the
  /// output for a <i>server</i> configuration item includes a list of
  /// attributes about the server, such as host name, operating system, number
  /// of network cards, etc.
  ///
  /// For a complete list of outputs for each asset type, see <a
  /// href="https://docs.aws.amazon.com/application-discovery/latest/userguide/discovery-api-queries.html#DescribeConfigurations">Using
  /// the DescribeConfigurations Action</a> in the <i>AWS Application Discovery
  /// Service User Guide</i>.
  /// </note>
  ///
  /// May throw [AuthorizationErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ServerInternalErrorException].
  /// May throw [HomeRegionNotSetException].
  ///
  /// Parameter [configurationIds] :
  /// One or more configuration IDs.
  Future<DescribeConfigurationsResponse> describeConfigurations({
    required List<String> configurationIds,
  }) async {
    ArgumentError.checkNotNull(configurationIds, 'configurationIds');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSPoseidonService_V2015_11_01.DescribeConfigurations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'configurationIds': configurationIds,
      },
    );

    return DescribeConfigurationsResponse.fromJson(jsonResponse.body);
  }

  /// Lists exports as specified by ID. All continuous exports associated with
  /// your user account can be listed if you call
  /// <code>DescribeContinuousExports</code> as is without passing any
  /// parameters.
  ///
  /// May throw [AuthorizationErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ServerInternalErrorException].
  /// May throw [OperationNotPermittedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [HomeRegionNotSetException].
  ///
  /// Parameter [exportIds] :
  /// The unique IDs assigned to the exports.
  ///
  /// Parameter [maxResults] :
  /// A number between 1 and 100 specifying the maximum number of continuous
  /// export descriptions returned.
  ///
  /// Parameter [nextToken] :
  /// The token from the previous call to <code>DescribeExportTasks</code>.
  Future<DescribeContinuousExportsResponse> describeContinuousExports({
    List<String>? exportIds,
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
      'X-Amz-Target': 'AWSPoseidonService_V2015_11_01.DescribeContinuousExports'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (exportIds != null) 'exportIds': exportIds,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return DescribeContinuousExportsResponse.fromJson(jsonResponse.body);
  }

  /// <code>DescribeExportConfigurations</code> is deprecated. Use <a
  /// href="https://docs.aws.amazon.com/application-discovery/latest/APIReference/API_DescribeExportTasks.html">DescribeImportTasks</a>,
  /// instead.
  ///
  /// May throw [AuthorizationErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ServerInternalErrorException].
  /// May throw [HomeRegionNotSetException].
  ///
  /// Parameter [exportIds] :
  /// A list of continuous export IDs to search for.
  ///
  /// Parameter [maxResults] :
  /// A number between 1 and 100 specifying the maximum number of continuous
  /// export descriptions returned.
  ///
  /// Parameter [nextToken] :
  /// The token from the previous call to describe-export-tasks.
  @Deprecated('Deprecated')
  Future<DescribeExportConfigurationsResponse> describeExportConfigurations({
    List<String>? exportIds,
    int? maxResults,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSPoseidonService_V2015_11_01.DescribeExportConfigurations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (exportIds != null) 'exportIds': exportIds,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return DescribeExportConfigurationsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieve status of one or more export tasks. You can retrieve the status
  /// of up to 100 export tasks.
  ///
  /// May throw [AuthorizationErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ServerInternalErrorException].
  /// May throw [HomeRegionNotSetException].
  ///
  /// Parameter [exportIds] :
  /// One or more unique identifiers used to query the status of an export
  /// request.
  ///
  /// Parameter [filters] :
  /// One or more filters.
  ///
  /// <ul>
  /// <li>
  /// <code>AgentId</code> - ID of the agent whose collected data will be
  /// exported
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of volume results returned by
  /// <code>DescribeExportTasks</code> in paginated output. When this parameter
  /// is used, <code>DescribeExportTasks</code> only returns
  /// <code>maxResults</code> results in a single page along with a
  /// <code>nextToken</code> response element.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// <code>DescribeExportTasks</code> request where <code>maxResults</code> was
  /// used and the results exceeded the value of that parameter. Pagination
  /// continues from the end of the previous results that returned the
  /// <code>nextToken</code> value. This value is null when there are no more
  /// results to return.
  Future<DescribeExportTasksResponse> describeExportTasks({
    List<String>? exportIds,
    List<ExportFilter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSPoseidonService_V2015_11_01.DescribeExportTasks'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (exportIds != null) 'exportIds': exportIds,
        if (filters != null) 'filters': filters,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return DescribeExportTasksResponse.fromJson(jsonResponse.body);
  }

  /// Returns an array of import tasks for your account, including status
  /// information, times, IDs, the Amazon S3 Object URL for the import file, and
  /// more.
  ///
  /// May throw [AuthorizationErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ServerInternalErrorException].
  /// May throw [HomeRegionNotSetException].
  ///
  /// Parameter [filters] :
  /// An array of name-value pairs that you provide to filter the results for
  /// the <code>DescribeImportTask</code> request to a specific subset of
  /// results. Currently, wildcard values aren't supported for filters.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that you want this request to return, up to
  /// 100.
  ///
  /// Parameter [nextToken] :
  /// The token to request a specific page of results.
  Future<DescribeImportTasksResponse> describeImportTasks({
    List<ImportTaskFilter>? filters,
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
      'X-Amz-Target': 'AWSPoseidonService_V2015_11_01.DescribeImportTasks'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'filters': filters,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return DescribeImportTasksResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves a list of configuration items that have tags as specified by the
  /// key-value pairs, name and value, passed to the optional parameter
  /// <code>filters</code>.
  ///
  /// There are three valid tag filter names:
  ///
  /// <ul>
  /// <li>
  /// tagKey
  /// </li>
  /// <li>
  /// tagValue
  /// </li>
  /// <li>
  /// configurationId
  /// </li>
  /// </ul>
  /// Also, all configuration items associated with your user account that have
  /// tags can be listed if you call <code>DescribeTags</code> as is without
  /// passing any parameters.
  ///
  /// May throw [AuthorizationErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ServerInternalErrorException].
  /// May throw [HomeRegionNotSetException].
  ///
  /// Parameter [filters] :
  /// You can filter the list using a <i>key</i>-<i>value</i> format. You can
  /// separate these items by using logical operators. Allowed filters include
  /// <code>tagKey</code>, <code>tagValue</code>, and
  /// <code>configurationId</code>.
  ///
  /// Parameter [maxResults] :
  /// The total number of items to return in a single page of output. The
  /// maximum value is 100.
  ///
  /// Parameter [nextToken] :
  /// A token to start the list. Use this token to get the next set of results.
  Future<DescribeTagsResponse> describeTags({
    List<TagFilter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSPoseidonService_V2015_11_01.DescribeTags'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'filters': filters,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return DescribeTagsResponse.fromJson(jsonResponse.body);
  }

  /// Disassociates one or more configuration items from an application.
  ///
  /// May throw [AuthorizationErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ServerInternalErrorException].
  /// May throw [HomeRegionNotSetException].
  ///
  /// Parameter [applicationConfigurationId] :
  /// Configuration ID of an application from which each item is disassociated.
  ///
  /// Parameter [configurationIds] :
  /// Configuration ID of each item to be disassociated from an application.
  Future<void> disassociateConfigurationItemsFromApplication({
    required String applicationConfigurationId,
    required List<String> configurationIds,
  }) async {
    ArgumentError.checkNotNull(
        applicationConfigurationId, 'applicationConfigurationId');
    ArgumentError.checkNotNull(configurationIds, 'configurationIds');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSPoseidonService_V2015_11_01.DisassociateConfigurationItemsFromApplication'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'applicationConfigurationId': applicationConfigurationId,
        'configurationIds': configurationIds,
      },
    );
  }

  /// Deprecated. Use <code>StartExportTask</code> instead.
  ///
  /// Exports all discovered configuration data to an Amazon S3 bucket or an
  /// application that enables you to view and evaluate the data. Data includes
  /// tags and tag associations, processes, connections, servers, and system
  /// performance. This API returns an export ID that you can query using the
  /// <i>DescribeExportConfigurations</i> API. The system imposes a limit of two
  /// configuration exports in six hours.
  ///
  /// May throw [AuthorizationErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ServerInternalErrorException].
  /// May throw [OperationNotPermittedException].
  /// May throw [HomeRegionNotSetException].
  @Deprecated('Deprecated')
  Future<ExportConfigurationsResponse> exportConfigurations() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSPoseidonService_V2015_11_01.ExportConfigurations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return ExportConfigurationsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves a short summary of discovered assets.
  ///
  /// This API operation takes no request parameters and is called as is at the
  /// command prompt as shown in the example.
  ///
  /// May throw [AuthorizationErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ServerInternalErrorException].
  /// May throw [HomeRegionNotSetException].
  Future<GetDiscoverySummaryResponse> getDiscoverySummary() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSPoseidonService_V2015_11_01.GetDiscoverySummary'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return GetDiscoverySummaryResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves a list of configuration items as specified by the value passed
  /// to the required parameter <code>configurationType</code>. Optional
  /// filtering may be applied to refine search results.
  ///
  /// May throw [AuthorizationErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ServerInternalErrorException].
  /// May throw [HomeRegionNotSetException].
  ///
  /// Parameter [configurationType] :
  /// A valid configuration identified by Application Discovery Service.
  ///
  /// Parameter [filters] :
  /// You can filter the request using various logical operators and a
  /// <i>key</i>-<i>value</i> format. For example:
  ///
  /// <code>{"key": "serverType", "value": "webServer"}</code>
  ///
  /// For a complete list of filter options and guidance about using them with
  /// this action, see <a
  /// href="https://docs.aws.amazon.com/application-discovery/latest/userguide/discovery-api-queries.html#ListConfigurations">Using
  /// the ListConfigurations Action</a> in the <i>AWS Application Discovery
  /// Service User Guide</i>.
  ///
  /// Parameter [maxResults] :
  /// The total number of items to return. The maximum value is 100.
  ///
  /// Parameter [nextToken] :
  /// Token to retrieve the next set of results. For example, if a previous call
  /// to ListConfigurations returned 100 items, but you set
  /// <code>ListConfigurationsRequest$maxResults</code> to 10, you received a
  /// set of 10 results along with a token. Use that token in this query to get
  /// the next set of 10.
  ///
  /// Parameter [orderBy] :
  /// Certain filter criteria return output that can be sorted in ascending or
  /// descending order. For a list of output characteristics for each filter,
  /// see <a
  /// href="https://docs.aws.amazon.com/application-discovery/latest/userguide/discovery-api-queries.html#ListConfigurations">Using
  /// the ListConfigurations Action</a> in the <i>AWS Application Discovery
  /// Service User Guide</i>.
  Future<ListConfigurationsResponse> listConfigurations({
    required ConfigurationItemType configurationType,
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
    List<OrderByElement>? orderBy,
  }) async {
    ArgumentError.checkNotNull(configurationType, 'configurationType');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSPoseidonService_V2015_11_01.ListConfigurations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'configurationType': configurationType.toValue(),
        if (filters != null) 'filters': filters,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (orderBy != null) 'orderBy': orderBy,
      },
    );

    return ListConfigurationsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves a list of servers that are one network hop away from a specified
  /// server.
  ///
  /// May throw [AuthorizationErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ServerInternalErrorException].
  /// May throw [HomeRegionNotSetException].
  ///
  /// Parameter [configurationId] :
  /// Configuration ID of the server for which neighbors are being listed.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return in a single page of output.
  ///
  /// Parameter [neighborConfigurationIds] :
  /// List of configuration IDs to test for one-hop-away.
  ///
  /// Parameter [nextToken] :
  /// Token to retrieve the next set of results. For example, if you previously
  /// specified 100 IDs for
  /// <code>ListServerNeighborsRequest$neighborConfigurationIds</code> but set
  /// <code>ListServerNeighborsRequest$maxResults</code> to 10, you received a
  /// set of 10 results along with a token. Use that token in this query to get
  /// the next set of 10.
  ///
  /// Parameter [portInformationNeeded] :
  /// Flag to indicate if port and protocol information is needed as part of the
  /// response.
  Future<ListServerNeighborsResponse> listServerNeighbors({
    required String configurationId,
    int? maxResults,
    List<String>? neighborConfigurationIds,
    String? nextToken,
    bool? portInformationNeeded,
  }) async {
    ArgumentError.checkNotNull(configurationId, 'configurationId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSPoseidonService_V2015_11_01.ListServerNeighbors'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'configurationId': configurationId,
        if (maxResults != null) 'maxResults': maxResults,
        if (neighborConfigurationIds != null)
          'neighborConfigurationIds': neighborConfigurationIds,
        if (nextToken != null) 'nextToken': nextToken,
        if (portInformationNeeded != null)
          'portInformationNeeded': portInformationNeeded,
      },
    );

    return ListServerNeighborsResponse.fromJson(jsonResponse.body);
  }

  /// Start the continuous flow of agent's discovered data into Amazon Athena.
  ///
  /// May throw [ConflictErrorException].
  /// May throw [AuthorizationErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ServerInternalErrorException].
  /// May throw [OperationNotPermittedException].
  /// May throw [ResourceInUseException].
  /// May throw [HomeRegionNotSetException].
  Future<StartContinuousExportResponse> startContinuousExport() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSPoseidonService_V2015_11_01.StartContinuousExport'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return StartContinuousExportResponse.fromJson(jsonResponse.body);
  }

  /// Instructs the specified agents or connectors to start collecting data.
  ///
  /// May throw [AuthorizationErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ServerInternalErrorException].
  /// May throw [HomeRegionNotSetException].
  ///
  /// Parameter [agentIds] :
  /// The IDs of the agents or connectors from which to start collecting data.
  /// If you send a request to an agent/connector ID that you do not have
  /// permission to contact, according to your AWS account, the service does not
  /// throw an exception. Instead, it returns the error in the
  /// <i>Description</i> field. If you send a request to multiple
  /// agents/connectors and you do not have permission to contact some of those
  /// agents/connectors, the system does not throw an exception. Instead, the
  /// system shows <code>Failed</code> in the <i>Description</i> field.
  Future<StartDataCollectionByAgentIdsResponse> startDataCollectionByAgentIds({
    required List<String> agentIds,
  }) async {
    ArgumentError.checkNotNull(agentIds, 'agentIds');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSPoseidonService_V2015_11_01.StartDataCollectionByAgentIds'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'agentIds': agentIds,
      },
    );

    return StartDataCollectionByAgentIdsResponse.fromJson(jsonResponse.body);
  }

  /// Begins the export of discovered data to an S3 bucket.
  ///
  /// If you specify <code>agentIds</code> in a filter, the task exports up to
  /// 72 hours of detailed data collected by the identified Application
  /// Discovery Agent, including network, process, and performance details. A
  /// time range for exported agent data may be set by using
  /// <code>startTime</code> and <code>endTime</code>. Export of detailed agent
  /// data is limited to five concurrently running exports.
  ///
  /// If you do not include an <code>agentIds</code> filter, summary data is
  /// exported that includes both AWS Agentless Discovery Connector data and
  /// summary data from AWS Discovery Agents. Export of summary data is limited
  /// to two exports per day.
  ///
  /// May throw [AuthorizationErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ServerInternalErrorException].
  /// May throw [OperationNotPermittedException].
  /// May throw [HomeRegionNotSetException].
  ///
  /// Parameter [endTime] :
  /// The end timestamp for exported data from the single Application Discovery
  /// Agent selected in the filters. If no value is specified, exported data
  /// includes the most recent data collected by the agent.
  ///
  /// Parameter [exportDataFormat] :
  /// The file format for the returned export data. Default value is
  /// <code>CSV</code>. <b>Note:</b> <i>The</i> <code>GRAPHML</code> <i>option
  /// has been deprecated.</i>
  ///
  /// Parameter [filters] :
  /// If a filter is present, it selects the single <code>agentId</code> of the
  /// Application Discovery Agent for which data is exported. The
  /// <code>agentId</code> can be found in the results of the
  /// <code>DescribeAgents</code> API or CLI. If no filter is present,
  /// <code>startTime</code> and <code>endTime</code> are ignored and exported
  /// data includes both Agentless Discovery Connector data and summary data
  /// from Application Discovery agents.
  ///
  /// Parameter [startTime] :
  /// The start timestamp for exported data from the single Application
  /// Discovery Agent selected in the filters. If no value is specified, data is
  /// exported starting from the first data collected by the agent.
  Future<StartExportTaskResponse> startExportTask({
    DateTime? endTime,
    List<ExportDataFormat>? exportDataFormat,
    List<ExportFilter>? filters,
    DateTime? startTime,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSPoseidonService_V2015_11_01.StartExportTask'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (endTime != null) 'endTime': unixTimestampToJson(endTime),
        if (exportDataFormat != null)
          'exportDataFormat': exportDataFormat.map((e) => e.toValue()).toList(),
        if (filters != null) 'filters': filters,
        if (startTime != null) 'startTime': unixTimestampToJson(startTime),
      },
    );

    return StartExportTaskResponse.fromJson(jsonResponse.body);
  }

  /// Starts an import task, which allows you to import details of your
  /// on-premises environment directly into AWS Migration Hub without having to
  /// use the Application Discovery Service (ADS) tools such as the Discovery
  /// Connector or Discovery Agent. This gives you the option to perform
  /// migration assessment and planning directly from your imported data,
  /// including the ability to group your devices as applications and track
  /// their migration status.
  ///
  /// To start an import request, do this:
  /// <ol>
  /// <li>
  /// Download the specially formatted comma separated value (CSV) import
  /// template, which you can find here: <a
  /// href="https://s3-us-west-2.amazonaws.com/templates-7cffcf56-bd96-4b1c-b45b-a5b42f282e46/import_template.csv">https://s3-us-west-2.amazonaws.com/templates-7cffcf56-bd96-4b1c-b45b-a5b42f282e46/import_template.csv</a>.
  /// </li>
  /// <li>
  /// Fill out the template with your server and application data.
  /// </li>
  /// <li>
  /// Upload your import file to an Amazon S3 bucket, and make a note of it's
  /// Object URL. Your import file must be in the CSV format.
  /// </li>
  /// <li>
  /// Use the console or the <code>StartImportTask</code> command with the AWS
  /// CLI or one of the AWS SDKs to import the records from your file.
  /// </li> </ol>
  /// For more information, including step-by-step procedures, see <a
  /// href="https://docs.aws.amazon.com/application-discovery/latest/userguide/discovery-import.html">Migration
  /// Hub Import</a> in the <i>AWS Application Discovery Service User Guide</i>.
  /// <note>
  /// There are limits to the number of import tasks you can create (and delete)
  /// in an AWS account. For more information, see <a
  /// href="https://docs.aws.amazon.com/application-discovery/latest/userguide/ads_service_limits.html">AWS
  /// Application Discovery Service Limits</a> in the <i>AWS Application
  /// Discovery Service User Guide</i>.
  /// </note>
  ///
  /// May throw [ResourceInUseException].
  /// May throw [AuthorizationErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ServerInternalErrorException].
  /// May throw [HomeRegionNotSetException].
  ///
  /// Parameter [importUrl] :
  /// The URL for your import file that you've uploaded to Amazon S3.
  /// <note>
  /// If you're using the AWS CLI, this URL is structured as follows:
  /// <code>s3://BucketName/ImportFileName.CSV</code>
  /// </note>
  ///
  /// Parameter [name] :
  /// A descriptive name for this request. You can use this name to filter
  /// future requests related to this import task, such as identifying
  /// applications and servers that were included in this import task. We
  /// recommend that you use a meaningful name for each import task.
  ///
  /// Parameter [clientRequestToken] :
  /// Optional. A unique token that you can provide to prevent the same import
  /// request from occurring more than once. If you don't provide a token, a
  /// token is automatically generated.
  ///
  /// Sending more than one <code>StartImportTask</code> request with the same
  /// client request token will return information about the original import
  /// task with that client request token.
  Future<StartImportTaskResponse> startImportTask({
    required String importUrl,
    required String name,
    String? clientRequestToken,
  }) async {
    ArgumentError.checkNotNull(importUrl, 'importUrl');
    _s.validateStringLength(
      'importUrl',
      importUrl,
      1,
      4000,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSPoseidonService_V2015_11_01.StartImportTask'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'importUrl': importUrl,
        'name': name,
        'clientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
      },
    );

    return StartImportTaskResponse.fromJson(jsonResponse.body);
  }

  /// Stop the continuous flow of agent's discovered data into Amazon Athena.
  ///
  /// May throw [AuthorizationErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ServerInternalErrorException].
  /// May throw [OperationNotPermittedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [HomeRegionNotSetException].
  ///
  /// Parameter [exportId] :
  /// The unique ID assigned to this export.
  Future<StopContinuousExportResponse> stopContinuousExport({
    required String exportId,
  }) async {
    ArgumentError.checkNotNull(exportId, 'exportId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSPoseidonService_V2015_11_01.StopContinuousExport'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'exportId': exportId,
      },
    );

    return StopContinuousExportResponse.fromJson(jsonResponse.body);
  }

  /// Instructs the specified agents or connectors to stop collecting data.
  ///
  /// May throw [AuthorizationErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ServerInternalErrorException].
  /// May throw [HomeRegionNotSetException].
  ///
  /// Parameter [agentIds] :
  /// The IDs of the agents or connectors from which to stop collecting data.
  Future<StopDataCollectionByAgentIdsResponse> stopDataCollectionByAgentIds({
    required List<String> agentIds,
  }) async {
    ArgumentError.checkNotNull(agentIds, 'agentIds');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSPoseidonService_V2015_11_01.StopDataCollectionByAgentIds'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'agentIds': agentIds,
      },
    );

    return StopDataCollectionByAgentIdsResponse.fromJson(jsonResponse.body);
  }

  /// Updates metadata about an application.
  ///
  /// May throw [AuthorizationErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ServerInternalErrorException].
  /// May throw [HomeRegionNotSetException].
  ///
  /// Parameter [configurationId] :
  /// Configuration ID of the application to be updated.
  ///
  /// Parameter [description] :
  /// New description of the application to be updated.
  ///
  /// Parameter [name] :
  /// New name of the application to be updated.
  Future<void> updateApplication({
    required String configurationId,
    String? description,
    String? name,
  }) async {
    ArgumentError.checkNotNull(configurationId, 'configurationId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSPoseidonService_V2015_11_01.UpdateApplication'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'configurationId': configurationId,
        if (description != null) 'description': description,
        if (name != null) 'name': name,
      },
    );
  }
}

/// Information about agents or connectors that were instructed to start
/// collecting data. Information includes the agent/connector ID, a description
/// of the operation, and whether the agent/connector configuration was updated.
class AgentConfigurationStatus {
  /// The agent/connector ID.
  final String? agentId;

  /// A description of the operation performed.
  final String? description;

  /// Information about the status of the <code>StartDataCollection</code> and
  /// <code>StopDataCollection</code> operations. The system has recorded the data
  /// collection operation. The agent/connector receives this command the next
  /// time it polls for a new command.
  final bool? operationSucceeded;

  AgentConfigurationStatus({
    this.agentId,
    this.description,
    this.operationSucceeded,
  });

  factory AgentConfigurationStatus.fromJson(Map<String, dynamic> json) {
    return AgentConfigurationStatus(
      agentId: json['agentId'] as String?,
      description: json['description'] as String?,
      operationSucceeded: json['operationSucceeded'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final agentId = this.agentId;
    final description = this.description;
    final operationSucceeded = this.operationSucceeded;
    return {
      if (agentId != null) 'agentId': agentId,
      if (description != null) 'description': description,
      if (operationSucceeded != null) 'operationSucceeded': operationSucceeded,
    };
  }
}

/// Information about agents or connectors associated with the user’s AWS
/// account. Information includes agent or connector IDs, IP addresses, media
/// access control (MAC) addresses, agent or connector health, hostname where
/// the agent or connector resides, and agent version for each agent.
class AgentInfo {
  /// The agent or connector ID.
  final String? agentId;

  /// Network details about the host where the agent or connector resides.
  final List<AgentNetworkInfo>? agentNetworkInfoList;

  /// Type of agent.
  final String? agentType;

  /// Status of the collection process for an agent or connector.
  final String? collectionStatus;

  /// The ID of the connector.
  final String? connectorId;

  /// The health of the agent or connector.
  final AgentStatus? health;

  /// The name of the host where the agent or connector resides. The host can be a
  /// server or virtual machine.
  final String? hostName;

  /// Time since agent or connector health was reported.
  final String? lastHealthPingTime;

  /// Agent's first registration timestamp in UTC.
  final String? registeredTime;

  /// The agent or connector version.
  final String? version;

  AgentInfo({
    this.agentId,
    this.agentNetworkInfoList,
    this.agentType,
    this.collectionStatus,
    this.connectorId,
    this.health,
    this.hostName,
    this.lastHealthPingTime,
    this.registeredTime,
    this.version,
  });

  factory AgentInfo.fromJson(Map<String, dynamic> json) {
    return AgentInfo(
      agentId: json['agentId'] as String?,
      agentNetworkInfoList: (json['agentNetworkInfoList'] as List?)
          ?.whereNotNull()
          .map((e) => AgentNetworkInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      agentType: json['agentType'] as String?,
      collectionStatus: json['collectionStatus'] as String?,
      connectorId: json['connectorId'] as String?,
      health: (json['health'] as String?)?.toAgentStatus(),
      hostName: json['hostName'] as String?,
      lastHealthPingTime: json['lastHealthPingTime'] as String?,
      registeredTime: json['registeredTime'] as String?,
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final agentId = this.agentId;
    final agentNetworkInfoList = this.agentNetworkInfoList;
    final agentType = this.agentType;
    final collectionStatus = this.collectionStatus;
    final connectorId = this.connectorId;
    final health = this.health;
    final hostName = this.hostName;
    final lastHealthPingTime = this.lastHealthPingTime;
    final registeredTime = this.registeredTime;
    final version = this.version;
    return {
      if (agentId != null) 'agentId': agentId,
      if (agentNetworkInfoList != null)
        'agentNetworkInfoList': agentNetworkInfoList,
      if (agentType != null) 'agentType': agentType,
      if (collectionStatus != null) 'collectionStatus': collectionStatus,
      if (connectorId != null) 'connectorId': connectorId,
      if (health != null) 'health': health.toValue(),
      if (hostName != null) 'hostName': hostName,
      if (lastHealthPingTime != null) 'lastHealthPingTime': lastHealthPingTime,
      if (registeredTime != null) 'registeredTime': registeredTime,
      if (version != null) 'version': version,
    };
  }
}

/// Network details about the host where the agent/connector resides.
class AgentNetworkInfo {
  /// The IP address for the host where the agent/connector resides.
  final String? ipAddress;

  /// The MAC address for the host where the agent/connector resides.
  final String? macAddress;

  AgentNetworkInfo({
    this.ipAddress,
    this.macAddress,
  });

  factory AgentNetworkInfo.fromJson(Map<String, dynamic> json) {
    return AgentNetworkInfo(
      ipAddress: json['ipAddress'] as String?,
      macAddress: json['macAddress'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ipAddress = this.ipAddress;
    final macAddress = this.macAddress;
    return {
      if (ipAddress != null) 'ipAddress': ipAddress,
      if (macAddress != null) 'macAddress': macAddress,
    };
  }
}

enum AgentStatus {
  healthy,
  unhealthy,
  running,
  unknown,
  blacklisted,
  shutdown,
}

extension on AgentStatus {
  String toValue() {
    switch (this) {
      case AgentStatus.healthy:
        return 'HEALTHY';
      case AgentStatus.unhealthy:
        return 'UNHEALTHY';
      case AgentStatus.running:
        return 'RUNNING';
      case AgentStatus.unknown:
        return 'UNKNOWN';
      case AgentStatus.blacklisted:
        return 'BLACKLISTED';
      case AgentStatus.shutdown:
        return 'SHUTDOWN';
    }
  }
}

extension on String {
  AgentStatus toAgentStatus() {
    switch (this) {
      case 'HEALTHY':
        return AgentStatus.healthy;
      case 'UNHEALTHY':
        return AgentStatus.unhealthy;
      case 'RUNNING':
        return AgentStatus.running;
      case 'UNKNOWN':
        return AgentStatus.unknown;
      case 'BLACKLISTED':
        return AgentStatus.blacklisted;
      case 'SHUTDOWN':
        return AgentStatus.shutdown;
    }
    throw Exception('$this is not known in enum AgentStatus');
  }
}

class AssociateConfigurationItemsToApplicationResponse {
  AssociateConfigurationItemsToApplicationResponse();

  factory AssociateConfigurationItemsToApplicationResponse.fromJson(
      Map<String, dynamic> _) {
    return AssociateConfigurationItemsToApplicationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Error messages returned for each import task that you deleted as a response
/// for this command.
class BatchDeleteImportDataError {
  /// The type of error that occurred for a specific import task.
  final BatchDeleteImportDataErrorCode? errorCode;

  /// The description of the error that occurred for a specific import task.
  final String? errorDescription;

  /// The unique import ID associated with the error that occurred.
  final String? importTaskId;

  BatchDeleteImportDataError({
    this.errorCode,
    this.errorDescription,
    this.importTaskId,
  });

  factory BatchDeleteImportDataError.fromJson(Map<String, dynamic> json) {
    return BatchDeleteImportDataError(
      errorCode:
          (json['errorCode'] as String?)?.toBatchDeleteImportDataErrorCode(),
      errorDescription: json['errorDescription'] as String?,
      importTaskId: json['importTaskId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorDescription = this.errorDescription;
    final importTaskId = this.importTaskId;
    return {
      if (errorCode != null) 'errorCode': errorCode.toValue(),
      if (errorDescription != null) 'errorDescription': errorDescription,
      if (importTaskId != null) 'importTaskId': importTaskId,
    };
  }
}

enum BatchDeleteImportDataErrorCode {
  notFound,
  internalServerError,
  overLimit,
}

extension on BatchDeleteImportDataErrorCode {
  String toValue() {
    switch (this) {
      case BatchDeleteImportDataErrorCode.notFound:
        return 'NOT_FOUND';
      case BatchDeleteImportDataErrorCode.internalServerError:
        return 'INTERNAL_SERVER_ERROR';
      case BatchDeleteImportDataErrorCode.overLimit:
        return 'OVER_LIMIT';
    }
  }
}

extension on String {
  BatchDeleteImportDataErrorCode toBatchDeleteImportDataErrorCode() {
    switch (this) {
      case 'NOT_FOUND':
        return BatchDeleteImportDataErrorCode.notFound;
      case 'INTERNAL_SERVER_ERROR':
        return BatchDeleteImportDataErrorCode.internalServerError;
      case 'OVER_LIMIT':
        return BatchDeleteImportDataErrorCode.overLimit;
    }
    throw Exception(
        '$this is not known in enum BatchDeleteImportDataErrorCode');
  }
}

class BatchDeleteImportDataResponse {
  /// Error messages returned for each import task that you deleted as a response
  /// for this command.
  final List<BatchDeleteImportDataError>? errors;

  BatchDeleteImportDataResponse({
    this.errors,
  });

  factory BatchDeleteImportDataResponse.fromJson(Map<String, dynamic> json) {
    return BatchDeleteImportDataResponse(
      errors: (json['errors'] as List?)
          ?.whereNotNull()
          .map((e) =>
              BatchDeleteImportDataError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    return {
      if (errors != null) 'errors': errors,
    };
  }
}

enum ConfigurationItemType {
  server,
  process,
  connection,
  application,
}

extension on ConfigurationItemType {
  String toValue() {
    switch (this) {
      case ConfigurationItemType.server:
        return 'SERVER';
      case ConfigurationItemType.process:
        return 'PROCESS';
      case ConfigurationItemType.connection:
        return 'CONNECTION';
      case ConfigurationItemType.application:
        return 'APPLICATION';
    }
  }
}

extension on String {
  ConfigurationItemType toConfigurationItemType() {
    switch (this) {
      case 'SERVER':
        return ConfigurationItemType.server;
      case 'PROCESS':
        return ConfigurationItemType.process;
      case 'CONNECTION':
        return ConfigurationItemType.connection;
      case 'APPLICATION':
        return ConfigurationItemType.application;
    }
    throw Exception('$this is not known in enum ConfigurationItemType');
  }
}

/// Tags for a configuration item. Tags are metadata that help you categorize IT
/// assets.
class ConfigurationTag {
  /// The configuration ID for the item to tag. You can specify a list of keys and
  /// values.
  final String? configurationId;

  /// A type of IT asset to tag.
  final ConfigurationItemType? configurationType;

  /// A type of tag on which to filter. For example, <i>serverType</i>.
  final String? key;

  /// The time the configuration tag was created in Coordinated Universal Time
  /// (UTC).
  final DateTime? timeOfCreation;

  /// A value on which to filter. For example <i>key = serverType</i> and <i>value
  /// = web server</i>.
  final String? value;

  ConfigurationTag({
    this.configurationId,
    this.configurationType,
    this.key,
    this.timeOfCreation,
    this.value,
  });

  factory ConfigurationTag.fromJson(Map<String, dynamic> json) {
    return ConfigurationTag(
      configurationId: json['configurationId'] as String?,
      configurationType:
          (json['configurationType'] as String?)?.toConfigurationItemType(),
      key: json['key'] as String?,
      timeOfCreation: timeStampFromJson(json['timeOfCreation']),
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configurationId = this.configurationId;
    final configurationType = this.configurationType;
    final key = this.key;
    final timeOfCreation = this.timeOfCreation;
    final value = this.value;
    return {
      if (configurationId != null) 'configurationId': configurationId,
      if (configurationType != null)
        'configurationType': configurationType.toValue(),
      if (key != null) 'key': key,
      if (timeOfCreation != null)
        'timeOfCreation': unixTimestampToJson(timeOfCreation),
      if (value != null) 'value': value,
    };
  }
}

/// A list of continuous export descriptions.
class ContinuousExportDescription {
  /// The type of data collector used to gather this data (currently only offered
  /// for AGENT).
  final DataSource? dataSource;

  /// The unique ID assigned to this export.
  final String? exportId;

  /// The name of the s3 bucket where the export data parquet files are stored.
  final String? s3Bucket;

  /// An object which describes how the data is stored.
  ///
  /// <ul>
  /// <li>
  /// <code>databaseName</code> - the name of the Glue database used to store the
  /// schema.
  /// </li>
  /// </ul>
  final Map<String, String>? schemaStorageConfig;

  /// The timestamp representing when the continuous export was started.
  final DateTime? startTime;

  /// Describes the status of the export. Can be one of the following values:
  ///
  /// <ul>
  /// <li>
  /// START_IN_PROGRESS - setting up resources to start continuous export.
  /// </li>
  /// <li>
  /// START_FAILED - an error occurred setting up continuous export. To recover,
  /// call start-continuous-export again.
  /// </li>
  /// <li>
  /// ACTIVE - data is being exported to the customer bucket.
  /// </li>
  /// <li>
  /// ERROR - an error occurred during export. To fix the issue, call
  /// stop-continuous-export and start-continuous-export.
  /// </li>
  /// <li>
  /// STOP_IN_PROGRESS - stopping the export.
  /// </li>
  /// <li>
  /// STOP_FAILED - an error occurred stopping the export. To recover, call
  /// stop-continuous-export again.
  /// </li>
  /// <li>
  /// INACTIVE - the continuous export has been stopped. Data is no longer being
  /// exported to the customer bucket.
  /// </li>
  /// </ul>
  final ContinuousExportStatus? status;

  /// Contains information about any errors that have occurred. This data type can
  /// have the following values:
  ///
  /// <ul>
  /// <li>
  /// ACCESS_DENIED - You don’t have permission to start Data Exploration in
  /// Amazon Athena. Contact your AWS administrator for help. For more
  /// information, see <a
  /// href="http://docs.aws.amazon.com/application-discovery/latest/userguide/setting-up.html">Setting
  /// Up AWS Application Discovery Service</a> in the Application Discovery
  /// Service User Guide.
  /// </li>
  /// <li>
  /// DELIVERY_STREAM_LIMIT_FAILURE - You reached the limit for Amazon Kinesis
  /// Data Firehose delivery streams. Reduce the number of streams or request a
  /// limit increase and try again. For more information, see <a
  /// href="http://docs.aws.amazon.com/streams/latest/dev/service-sizes-and-limits.html">Kinesis
  /// Data Streams Limits</a> in the Amazon Kinesis Data Streams Developer Guide.
  /// </li>
  /// <li>
  /// FIREHOSE_ROLE_MISSING - The Data Exploration feature is in an error state
  /// because your IAM User is missing the AWSApplicationDiscoveryServiceFirehose
  /// role. Turn on Data Exploration in Amazon Athena and try again. For more
  /// information, see <a
  /// href="http://docs.aws.amazon.com/application-discovery/latest/userguide/setting-up.html#setting-up-user-policy">Step
  /// 3: Provide Application Discovery Service Access to Non-Administrator Users
  /// by Attaching Policies</a> in the Application Discovery Service User Guide.
  /// </li>
  /// <li>
  /// FIREHOSE_STREAM_DOES_NOT_EXIST - The Data Exploration feature is in an error
  /// state because your IAM User is missing one or more of the Kinesis data
  /// delivery streams.
  /// </li>
  /// <li>
  /// INTERNAL_FAILURE - The Data Exploration feature is in an error state because
  /// of an internal failure. Try again later. If this problem persists, contact
  /// AWS Support.
  /// </li>
  /// <li>
  /// S3_BUCKET_LIMIT_FAILURE - You reached the limit for Amazon S3 buckets.
  /// Reduce the number of Amazon S3 buckets or request a limit increase and try
  /// again. For more information, see <a
  /// href="http://docs.aws.amazon.com/AmazonS3/latest/dev/BucketRestrictions.html">Bucket
  /// Restrictions and Limitations</a> in the Amazon Simple Storage Service
  /// Developer Guide.
  /// </li>
  /// <li>
  /// S3_NOT_SIGNED_UP - Your account is not signed up for the Amazon S3 service.
  /// You must sign up before you can use Amazon S3. You can sign up at the
  /// following URL: <a
  /// href="https://aws.amazon.com/s3">https://aws.amazon.com/s3</a>.
  /// </li>
  /// </ul>
  final String? statusDetail;

  /// The timestamp that represents when this continuous export was stopped.
  final DateTime? stopTime;

  ContinuousExportDescription({
    this.dataSource,
    this.exportId,
    this.s3Bucket,
    this.schemaStorageConfig,
    this.startTime,
    this.status,
    this.statusDetail,
    this.stopTime,
  });

  factory ContinuousExportDescription.fromJson(Map<String, dynamic> json) {
    return ContinuousExportDescription(
      dataSource: (json['dataSource'] as String?)?.toDataSource(),
      exportId: json['exportId'] as String?,
      s3Bucket: json['s3Bucket'] as String?,
      schemaStorageConfig:
          (json['schemaStorageConfig'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      startTime: timeStampFromJson(json['startTime']),
      status: (json['status'] as String?)?.toContinuousExportStatus(),
      statusDetail: json['statusDetail'] as String?,
      stopTime: timeStampFromJson(json['stopTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final dataSource = this.dataSource;
    final exportId = this.exportId;
    final s3Bucket = this.s3Bucket;
    final schemaStorageConfig = this.schemaStorageConfig;
    final startTime = this.startTime;
    final status = this.status;
    final statusDetail = this.statusDetail;
    final stopTime = this.stopTime;
    return {
      if (dataSource != null) 'dataSource': dataSource.toValue(),
      if (exportId != null) 'exportId': exportId,
      if (s3Bucket != null) 's3Bucket': s3Bucket,
      if (schemaStorageConfig != null)
        'schemaStorageConfig': schemaStorageConfig,
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
      if (status != null) 'status': status.toValue(),
      if (statusDetail != null) 'statusDetail': statusDetail,
      if (stopTime != null) 'stopTime': unixTimestampToJson(stopTime),
    };
  }
}

enum ContinuousExportStatus {
  startInProgress,
  startFailed,
  active,
  error,
  stopInProgress,
  stopFailed,
  inactive,
}

extension on ContinuousExportStatus {
  String toValue() {
    switch (this) {
      case ContinuousExportStatus.startInProgress:
        return 'START_IN_PROGRESS';
      case ContinuousExportStatus.startFailed:
        return 'START_FAILED';
      case ContinuousExportStatus.active:
        return 'ACTIVE';
      case ContinuousExportStatus.error:
        return 'ERROR';
      case ContinuousExportStatus.stopInProgress:
        return 'STOP_IN_PROGRESS';
      case ContinuousExportStatus.stopFailed:
        return 'STOP_FAILED';
      case ContinuousExportStatus.inactive:
        return 'INACTIVE';
    }
  }
}

extension on String {
  ContinuousExportStatus toContinuousExportStatus() {
    switch (this) {
      case 'START_IN_PROGRESS':
        return ContinuousExportStatus.startInProgress;
      case 'START_FAILED':
        return ContinuousExportStatus.startFailed;
      case 'ACTIVE':
        return ContinuousExportStatus.active;
      case 'ERROR':
        return ContinuousExportStatus.error;
      case 'STOP_IN_PROGRESS':
        return ContinuousExportStatus.stopInProgress;
      case 'STOP_FAILED':
        return ContinuousExportStatus.stopFailed;
      case 'INACTIVE':
        return ContinuousExportStatus.inactive;
    }
    throw Exception('$this is not known in enum ContinuousExportStatus');
  }
}

class CreateApplicationResponse {
  /// Configuration ID of an application to be created.
  final String? configurationId;

  CreateApplicationResponse({
    this.configurationId,
  });

  factory CreateApplicationResponse.fromJson(Map<String, dynamic> json) {
    return CreateApplicationResponse(
      configurationId: json['configurationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configurationId = this.configurationId;
    return {
      if (configurationId != null) 'configurationId': configurationId,
    };
  }
}

class CreateTagsResponse {
  CreateTagsResponse();

  factory CreateTagsResponse.fromJson(Map<String, dynamic> _) {
    return CreateTagsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Inventory data for installed discovery agents.
class CustomerAgentInfo {
  /// Number of active discovery agents.
  final int activeAgents;

  /// Number of blacklisted discovery agents.
  final int blackListedAgents;

  /// Number of healthy discovery agents
  final int healthyAgents;

  /// Number of discovery agents with status SHUTDOWN.
  final int shutdownAgents;

  /// Total number of discovery agents.
  final int totalAgents;

  /// Number of unhealthy discovery agents.
  final int unhealthyAgents;

  /// Number of unknown discovery agents.
  final int unknownAgents;

  CustomerAgentInfo({
    required this.activeAgents,
    required this.blackListedAgents,
    required this.healthyAgents,
    required this.shutdownAgents,
    required this.totalAgents,
    required this.unhealthyAgents,
    required this.unknownAgents,
  });

  factory CustomerAgentInfo.fromJson(Map<String, dynamic> json) {
    return CustomerAgentInfo(
      activeAgents: json['activeAgents'] as int,
      blackListedAgents: json['blackListedAgents'] as int,
      healthyAgents: json['healthyAgents'] as int,
      shutdownAgents: json['shutdownAgents'] as int,
      totalAgents: json['totalAgents'] as int,
      unhealthyAgents: json['unhealthyAgents'] as int,
      unknownAgents: json['unknownAgents'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final activeAgents = this.activeAgents;
    final blackListedAgents = this.blackListedAgents;
    final healthyAgents = this.healthyAgents;
    final shutdownAgents = this.shutdownAgents;
    final totalAgents = this.totalAgents;
    final unhealthyAgents = this.unhealthyAgents;
    final unknownAgents = this.unknownAgents;
    return {
      'activeAgents': activeAgents,
      'blackListedAgents': blackListedAgents,
      'healthyAgents': healthyAgents,
      'shutdownAgents': shutdownAgents,
      'totalAgents': totalAgents,
      'unhealthyAgents': unhealthyAgents,
      'unknownAgents': unknownAgents,
    };
  }
}

/// Inventory data for installed discovery connectors.
class CustomerConnectorInfo {
  /// Number of active discovery connectors.
  final int activeConnectors;

  /// Number of blacklisted discovery connectors.
  final int blackListedConnectors;

  /// Number of healthy discovery connectors.
  final int healthyConnectors;

  /// Number of discovery connectors with status SHUTDOWN,
  final int shutdownConnectors;

  /// Total number of discovery connectors.
  final int totalConnectors;

  /// Number of unhealthy discovery connectors.
  final int unhealthyConnectors;

  /// Number of unknown discovery connectors.
  final int unknownConnectors;

  CustomerConnectorInfo({
    required this.activeConnectors,
    required this.blackListedConnectors,
    required this.healthyConnectors,
    required this.shutdownConnectors,
    required this.totalConnectors,
    required this.unhealthyConnectors,
    required this.unknownConnectors,
  });

  factory CustomerConnectorInfo.fromJson(Map<String, dynamic> json) {
    return CustomerConnectorInfo(
      activeConnectors: json['activeConnectors'] as int,
      blackListedConnectors: json['blackListedConnectors'] as int,
      healthyConnectors: json['healthyConnectors'] as int,
      shutdownConnectors: json['shutdownConnectors'] as int,
      totalConnectors: json['totalConnectors'] as int,
      unhealthyConnectors: json['unhealthyConnectors'] as int,
      unknownConnectors: json['unknownConnectors'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final activeConnectors = this.activeConnectors;
    final blackListedConnectors = this.blackListedConnectors;
    final healthyConnectors = this.healthyConnectors;
    final shutdownConnectors = this.shutdownConnectors;
    final totalConnectors = this.totalConnectors;
    final unhealthyConnectors = this.unhealthyConnectors;
    final unknownConnectors = this.unknownConnectors;
    return {
      'activeConnectors': activeConnectors,
      'blackListedConnectors': blackListedConnectors,
      'healthyConnectors': healthyConnectors,
      'shutdownConnectors': shutdownConnectors,
      'totalConnectors': totalConnectors,
      'unhealthyConnectors': unhealthyConnectors,
      'unknownConnectors': unknownConnectors,
    };
  }
}

enum DataSource {
  agent,
}

extension on DataSource {
  String toValue() {
    switch (this) {
      case DataSource.agent:
        return 'AGENT';
    }
  }
}

extension on String {
  DataSource toDataSource() {
    switch (this) {
      case 'AGENT':
        return DataSource.agent;
    }
    throw Exception('$this is not known in enum DataSource');
  }
}

class DeleteApplicationsResponse {
  DeleteApplicationsResponse();

  factory DeleteApplicationsResponse.fromJson(Map<String, dynamic> _) {
    return DeleteApplicationsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteTagsResponse {
  DeleteTagsResponse();

  factory DeleteTagsResponse.fromJson(Map<String, dynamic> _) {
    return DeleteTagsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeAgentsResponse {
  /// Lists agents or the Connector by ID or lists all agents/Connectors
  /// associated with your user account if you did not specify an agent/Connector
  /// ID. The output includes agent/Connector IDs, IP addresses, media access
  /// control (MAC) addresses, agent/Connector health, host name where the
  /// agent/Connector resides, and the version number of each agent/Connector.
  final List<AgentInfo>? agentsInfo;

  /// Token to retrieve the next set of results. For example, if you specified 100
  /// IDs for <code>DescribeAgentsRequest$agentIds</code> but set
  /// <code>DescribeAgentsRequest$maxResults</code> to 10, you received a set of
  /// 10 results along with this token. Use this token in the next query to
  /// retrieve the next set of 10.
  final String? nextToken;

  DescribeAgentsResponse({
    this.agentsInfo,
    this.nextToken,
  });

  factory DescribeAgentsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAgentsResponse(
      agentsInfo: (json['agentsInfo'] as List?)
          ?.whereNotNull()
          .map((e) => AgentInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final agentsInfo = this.agentsInfo;
    final nextToken = this.nextToken;
    return {
      if (agentsInfo != null) 'agentsInfo': agentsInfo,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DescribeConfigurationsResponse {
  /// A key in the response map. The value is an array of data.
  final List<Map<String, String>>? configurations;

  DescribeConfigurationsResponse({
    this.configurations,
  });

  factory DescribeConfigurationsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeConfigurationsResponse(
      configurations: (json['configurations'] as List?)
          ?.whereNotNull()
          .map((e) => (e as Map<String, dynamic>)
              .map((k, e) => MapEntry(k, e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final configurations = this.configurations;
    return {
      if (configurations != null) 'configurations': configurations,
    };
  }
}

class DescribeContinuousExportsResponse {
  /// A list of continuous export descriptions.
  final List<ContinuousExportDescription>? descriptions;

  /// The token from the previous call to <code>DescribeExportTasks</code>.
  final String? nextToken;

  DescribeContinuousExportsResponse({
    this.descriptions,
    this.nextToken,
  });

  factory DescribeContinuousExportsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeContinuousExportsResponse(
      descriptions: (json['descriptions'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ContinuousExportDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final descriptions = this.descriptions;
    final nextToken = this.nextToken;
    return {
      if (descriptions != null) 'descriptions': descriptions,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DescribeExportConfigurationsResponse {
  /// <p/>
  final List<ExportInfo>? exportsInfo;

  /// The token from the previous call to describe-export-tasks.
  final String? nextToken;

  DescribeExportConfigurationsResponse({
    this.exportsInfo,
    this.nextToken,
  });

  factory DescribeExportConfigurationsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeExportConfigurationsResponse(
      exportsInfo: (json['exportsInfo'] as List?)
          ?.whereNotNull()
          .map((e) => ExportInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final exportsInfo = this.exportsInfo;
    final nextToken = this.nextToken;
    return {
      if (exportsInfo != null) 'exportsInfo': exportsInfo,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DescribeExportTasksResponse {
  /// Contains one or more sets of export request details. When the status of a
  /// request is <code>SUCCEEDED</code>, the response includes a URL for an Amazon
  /// S3 bucket where you can view the data in a CSV file.
  final List<ExportInfo>? exportsInfo;

  /// The <code>nextToken</code> value to include in a future
  /// <code>DescribeExportTasks</code> request. When the results of a
  /// <code>DescribeExportTasks</code> request exceed <code>maxResults</code>,
  /// this value can be used to retrieve the next page of results. This value is
  /// null when there are no more results to return.
  final String? nextToken;

  DescribeExportTasksResponse({
    this.exportsInfo,
    this.nextToken,
  });

  factory DescribeExportTasksResponse.fromJson(Map<String, dynamic> json) {
    return DescribeExportTasksResponse(
      exportsInfo: (json['exportsInfo'] as List?)
          ?.whereNotNull()
          .map((e) => ExportInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final exportsInfo = this.exportsInfo;
    final nextToken = this.nextToken;
    return {
      if (exportsInfo != null) 'exportsInfo': exportsInfo,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DescribeImportTasksResponse {
  /// The token to request the next page of results.
  final String? nextToken;

  /// A returned array of import tasks that match any applied filters, up to the
  /// specified number of maximum results.
  final List<ImportTask>? tasks;

  DescribeImportTasksResponse({
    this.nextToken,
    this.tasks,
  });

  factory DescribeImportTasksResponse.fromJson(Map<String, dynamic> json) {
    return DescribeImportTasksResponse(
      nextToken: json['nextToken'] as String?,
      tasks: (json['tasks'] as List?)
          ?.whereNotNull()
          .map((e) => ImportTask.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final tasks = this.tasks;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (tasks != null) 'tasks': tasks,
    };
  }
}

class DescribeTagsResponse {
  /// The call returns a token. Use this token to get the next set of results.
  final String? nextToken;

  /// Depending on the input, this is a list of configuration items tagged with a
  /// specific tag, or a list of tags for a specific configuration item.
  final List<ConfigurationTag>? tags;

  DescribeTagsResponse({
    this.nextToken,
    this.tags,
  });

  factory DescribeTagsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeTagsResponse(
      nextToken: json['nextToken'] as String?,
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => ConfigurationTag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final tags = this.tags;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (tags != null) 'tags': tags,
    };
  }
}

class DisassociateConfigurationItemsFromApplicationResponse {
  DisassociateConfigurationItemsFromApplicationResponse();

  factory DisassociateConfigurationItemsFromApplicationResponse.fromJson(
      Map<String, dynamic> _) {
    return DisassociateConfigurationItemsFromApplicationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ExportConfigurationsResponse {
  /// A unique identifier that you can use to query the export status.
  final String? exportId;

  ExportConfigurationsResponse({
    this.exportId,
  });

  factory ExportConfigurationsResponse.fromJson(Map<String, dynamic> json) {
    return ExportConfigurationsResponse(
      exportId: json['exportId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final exportId = this.exportId;
    return {
      if (exportId != null) 'exportId': exportId,
    };
  }
}

enum ExportDataFormat {
  csv,
  graphml,
}

extension on ExportDataFormat {
  String toValue() {
    switch (this) {
      case ExportDataFormat.csv:
        return 'CSV';
      case ExportDataFormat.graphml:
        return 'GRAPHML';
    }
  }
}

extension on String {
  ExportDataFormat toExportDataFormat() {
    switch (this) {
      case 'CSV':
        return ExportDataFormat.csv;
      case 'GRAPHML':
        return ExportDataFormat.graphml;
    }
    throw Exception('$this is not known in enum ExportDataFormat');
  }
}

/// Used to select which agent's data is to be exported. A single agent ID may
/// be selected for export using the <a
/// href="http://docs.aws.amazon.com/application-discovery/latest/APIReference/API_StartExportTask.html">StartExportTask</a>
/// action.
class ExportFilter {
  /// Supported condition: <code>EQUALS</code>
  final String condition;

  /// A single <code>ExportFilter</code> name. Supported filters:
  /// <code>agentId</code>.
  final String name;

  /// A single <code>agentId</code> for a Discovery Agent. An <code>agentId</code>
  /// can be found using the <a
  /// href="http://docs.aws.amazon.com/application-discovery/latest/APIReference/API_DescribeExportTasks.html">DescribeAgents</a>
  /// action. Typically an ADS <code>agentId</code> is in the form
  /// <code>o-0123456789abcdef0</code>.
  final List<String> values;

  ExportFilter({
    required this.condition,
    required this.name,
    required this.values,
  });

  factory ExportFilter.fromJson(Map<String, dynamic> json) {
    return ExportFilter(
      condition: json['condition'] as String,
      name: json['name'] as String,
      values: (json['values'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final condition = this.condition;
    final name = this.name;
    final values = this.values;
    return {
      'condition': condition,
      'name': name,
      'values': values,
    };
  }
}

/// Information regarding the export status of discovered data. The value is an
/// array of objects.
class ExportInfo {
  /// A unique identifier used to query an export.
  final String exportId;

  /// The time that the data export was initiated.
  final DateTime exportRequestTime;

  /// The status of the data export job.
  final ExportStatus exportStatus;

  /// A status message provided for API callers.
  final String statusMessage;

  /// A URL for an Amazon S3 bucket where you can review the exported data. The
  /// URL is displayed only if the export succeeded.
  final String? configurationsDownloadUrl;

  /// If true, the export of agent information exceeded the size limit for a
  /// single export and the exported data is incomplete for the requested time
  /// range. To address this, select a smaller time range for the export by using
  /// <code>startDate</code> and <code>endDate</code>.
  final bool? isTruncated;

  /// The <code>endTime</code> used in the <code>StartExportTask</code> request.
  /// If no <code>endTime</code> was requested, this result does not appear in
  /// <code>ExportInfo</code>.
  final DateTime? requestedEndTime;

  /// The value of <code>startTime</code> parameter in the
  /// <code>StartExportTask</code> request. If no <code>startTime</code> was
  /// requested, this result does not appear in <code>ExportInfo</code>.
  final DateTime? requestedStartTime;

  ExportInfo({
    required this.exportId,
    required this.exportRequestTime,
    required this.exportStatus,
    required this.statusMessage,
    this.configurationsDownloadUrl,
    this.isTruncated,
    this.requestedEndTime,
    this.requestedStartTime,
  });

  factory ExportInfo.fromJson(Map<String, dynamic> json) {
    return ExportInfo(
      exportId: json['exportId'] as String,
      exportRequestTime:
          nonNullableTimeStampFromJson(json['exportRequestTime'] as Object),
      exportStatus: (json['exportStatus'] as String).toExportStatus(),
      statusMessage: json['statusMessage'] as String,
      configurationsDownloadUrl: json['configurationsDownloadUrl'] as String?,
      isTruncated: json['isTruncated'] as bool?,
      requestedEndTime: timeStampFromJson(json['requestedEndTime']),
      requestedStartTime: timeStampFromJson(json['requestedStartTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final exportId = this.exportId;
    final exportRequestTime = this.exportRequestTime;
    final exportStatus = this.exportStatus;
    final statusMessage = this.statusMessage;
    final configurationsDownloadUrl = this.configurationsDownloadUrl;
    final isTruncated = this.isTruncated;
    final requestedEndTime = this.requestedEndTime;
    final requestedStartTime = this.requestedStartTime;
    return {
      'exportId': exportId,
      'exportRequestTime': unixTimestampToJson(exportRequestTime),
      'exportStatus': exportStatus.toValue(),
      'statusMessage': statusMessage,
      if (configurationsDownloadUrl != null)
        'configurationsDownloadUrl': configurationsDownloadUrl,
      if (isTruncated != null) 'isTruncated': isTruncated,
      if (requestedEndTime != null)
        'requestedEndTime': unixTimestampToJson(requestedEndTime),
      if (requestedStartTime != null)
        'requestedStartTime': unixTimestampToJson(requestedStartTime),
    };
  }
}

enum ExportStatus {
  failed,
  succeeded,
  inProgress,
}

extension on ExportStatus {
  String toValue() {
    switch (this) {
      case ExportStatus.failed:
        return 'FAILED';
      case ExportStatus.succeeded:
        return 'SUCCEEDED';
      case ExportStatus.inProgress:
        return 'IN_PROGRESS';
    }
  }
}

extension on String {
  ExportStatus toExportStatus() {
    switch (this) {
      case 'FAILED':
        return ExportStatus.failed;
      case 'SUCCEEDED':
        return ExportStatus.succeeded;
      case 'IN_PROGRESS':
        return ExportStatus.inProgress;
    }
    throw Exception('$this is not known in enum ExportStatus');
  }
}

/// A filter that can use conditional operators.
///
/// For more information about filters, see <a
/// href="https://docs.aws.amazon.com/application-discovery/latest/userguide/discovery-api-queries.html">Querying
/// Discovered Configuration Items</a> in the <i>AWS Application Discovery
/// Service User Guide</i>.
class Filter {
  /// A conditional operator. The following operators are valid: EQUALS,
  /// NOT_EQUALS, CONTAINS, NOT_CONTAINS. If you specify multiple filters, the
  /// system utilizes all filters as though concatenated by <i>AND</i>. If you
  /// specify multiple values for a particular filter, the system differentiates
  /// the values using <i>OR</i>. Calling either <i>DescribeConfigurations</i> or
  /// <i>ListConfigurations</i> returns attributes of matching configuration
  /// items.
  final String condition;

  /// The name of the filter.
  final String name;

  /// A string value on which to filter. For example, if you choose the
  /// <code>destinationServer.osVersion</code> filter name, you could specify
  /// <code>Ubuntu</code> for the value.
  final List<String> values;

  Filter({
    required this.condition,
    required this.name,
    required this.values,
  });

  factory Filter.fromJson(Map<String, dynamic> json) {
    return Filter(
      condition: json['condition'] as String,
      name: json['name'] as String,
      values: (json['values'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final condition = this.condition;
    final name = this.name;
    final values = this.values;
    return {
      'condition': condition,
      'name': name,
      'values': values,
    };
  }
}

class GetDiscoverySummaryResponse {
  /// Details about discovered agents, including agent status and health.
  final CustomerAgentInfo? agentSummary;

  /// The number of applications discovered.
  final int? applications;

  /// Details about discovered connectors, including connector status and health.
  final CustomerConnectorInfo? connectorSummary;

  /// The number of servers discovered.
  final int? servers;

  /// The number of servers mapped to applications.
  final int? serversMappedToApplications;

  /// The number of servers mapped to tags.
  final int? serversMappedtoTags;

  GetDiscoverySummaryResponse({
    this.agentSummary,
    this.applications,
    this.connectorSummary,
    this.servers,
    this.serversMappedToApplications,
    this.serversMappedtoTags,
  });

  factory GetDiscoverySummaryResponse.fromJson(Map<String, dynamic> json) {
    return GetDiscoverySummaryResponse(
      agentSummary: json['agentSummary'] != null
          ? CustomerAgentInfo.fromJson(
              json['agentSummary'] as Map<String, dynamic>)
          : null,
      applications: json['applications'] as int?,
      connectorSummary: json['connectorSummary'] != null
          ? CustomerConnectorInfo.fromJson(
              json['connectorSummary'] as Map<String, dynamic>)
          : null,
      servers: json['servers'] as int?,
      serversMappedToApplications: json['serversMappedToApplications'] as int?,
      serversMappedtoTags: json['serversMappedtoTags'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final agentSummary = this.agentSummary;
    final applications = this.applications;
    final connectorSummary = this.connectorSummary;
    final servers = this.servers;
    final serversMappedToApplications = this.serversMappedToApplications;
    final serversMappedtoTags = this.serversMappedtoTags;
    return {
      if (agentSummary != null) 'agentSummary': agentSummary,
      if (applications != null) 'applications': applications,
      if (connectorSummary != null) 'connectorSummary': connectorSummary,
      if (servers != null) 'servers': servers,
      if (serversMappedToApplications != null)
        'serversMappedToApplications': serversMappedToApplications,
      if (serversMappedtoTags != null)
        'serversMappedtoTags': serversMappedtoTags,
    };
  }
}

enum ImportStatus {
  importInProgress,
  importComplete,
  importCompleteWithErrors,
  importFailed,
  importFailedServerLimitExceeded,
  importFailedRecordLimitExceeded,
  deleteInProgress,
  deleteComplete,
  deleteFailed,
  deleteFailedLimitExceeded,
  internalError,
}

extension on ImportStatus {
  String toValue() {
    switch (this) {
      case ImportStatus.importInProgress:
        return 'IMPORT_IN_PROGRESS';
      case ImportStatus.importComplete:
        return 'IMPORT_COMPLETE';
      case ImportStatus.importCompleteWithErrors:
        return 'IMPORT_COMPLETE_WITH_ERRORS';
      case ImportStatus.importFailed:
        return 'IMPORT_FAILED';
      case ImportStatus.importFailedServerLimitExceeded:
        return 'IMPORT_FAILED_SERVER_LIMIT_EXCEEDED';
      case ImportStatus.importFailedRecordLimitExceeded:
        return 'IMPORT_FAILED_RECORD_LIMIT_EXCEEDED';
      case ImportStatus.deleteInProgress:
        return 'DELETE_IN_PROGRESS';
      case ImportStatus.deleteComplete:
        return 'DELETE_COMPLETE';
      case ImportStatus.deleteFailed:
        return 'DELETE_FAILED';
      case ImportStatus.deleteFailedLimitExceeded:
        return 'DELETE_FAILED_LIMIT_EXCEEDED';
      case ImportStatus.internalError:
        return 'INTERNAL_ERROR';
    }
  }
}

extension on String {
  ImportStatus toImportStatus() {
    switch (this) {
      case 'IMPORT_IN_PROGRESS':
        return ImportStatus.importInProgress;
      case 'IMPORT_COMPLETE':
        return ImportStatus.importComplete;
      case 'IMPORT_COMPLETE_WITH_ERRORS':
        return ImportStatus.importCompleteWithErrors;
      case 'IMPORT_FAILED':
        return ImportStatus.importFailed;
      case 'IMPORT_FAILED_SERVER_LIMIT_EXCEEDED':
        return ImportStatus.importFailedServerLimitExceeded;
      case 'IMPORT_FAILED_RECORD_LIMIT_EXCEEDED':
        return ImportStatus.importFailedRecordLimitExceeded;
      case 'DELETE_IN_PROGRESS':
        return ImportStatus.deleteInProgress;
      case 'DELETE_COMPLETE':
        return ImportStatus.deleteComplete;
      case 'DELETE_FAILED':
        return ImportStatus.deleteFailed;
      case 'DELETE_FAILED_LIMIT_EXCEEDED':
        return ImportStatus.deleteFailedLimitExceeded;
      case 'INTERNAL_ERROR':
        return ImportStatus.internalError;
    }
    throw Exception('$this is not known in enum ImportStatus');
  }
}

/// An array of information related to the import task request that includes
/// status information, times, IDs, the Amazon S3 Object URL for the import
/// file, and more.
class ImportTask {
  /// The total number of application records in the import file that failed to be
  /// imported.
  final int? applicationImportFailure;

  /// The total number of application records in the import file that were
  /// successfully imported.
  final int? applicationImportSuccess;

  /// A unique token used to prevent the same import request from occurring more
  /// than once. If you didn't provide a token, a token was automatically
  /// generated when the import task request was sent.
  final String? clientRequestToken;

  /// A link to a compressed archive folder (in the ZIP format) that contains an
  /// error log and a file of failed records. You can use these two files to
  /// quickly identify records that failed, why they failed, and correct those
  /// records. Afterward, you can upload the corrected file to your Amazon S3
  /// bucket and create another import task request.
  ///
  /// This field also includes authorization information so you can confirm the
  /// authenticity of the compressed archive before you download it.
  ///
  /// If some records failed to be imported we recommend that you correct the
  /// records in the failed entries file and then imports that failed entries
  /// file. This prevents you from having to correct and update the larger
  /// original file and attempt importing it again.
  final String? errorsAndFailedEntriesZip;

  /// The time that the import task request finished, presented in the Unix time
  /// stamp format.
  final DateTime? importCompletionTime;

  /// The time that the import task request was deleted, presented in the Unix
  /// time stamp format.
  final DateTime? importDeletedTime;

  /// The time that the import task request was made, presented in the Unix time
  /// stamp format.
  final DateTime? importRequestTime;

  /// The unique ID for a specific import task. These IDs aren't globally unique,
  /// but they are unique within an AWS account.
  final String? importTaskId;

  /// The URL for your import file that you've uploaded to Amazon S3.
  final String? importUrl;

  /// A descriptive name for an import task. You can use this name to filter
  /// future requests related to this import task, such as identifying
  /// applications and servers that were included in this import task. We
  /// recommend that you use a meaningful name for each import task.
  final String? name;

  /// The total number of server records in the import file that failed to be
  /// imported.
  final int? serverImportFailure;

  /// The total number of server records in the import file that were successfully
  /// imported.
  final int? serverImportSuccess;

  /// The status of the import task. An import can have the status of
  /// <code>IMPORT_COMPLETE</code> and still have some records fail to import from
  /// the overall request. More information can be found in the downloadable
  /// archive defined in the <code>errorsAndFailedEntriesZip</code> field, or in
  /// the Migration Hub management console.
  final ImportStatus? status;

  ImportTask({
    this.applicationImportFailure,
    this.applicationImportSuccess,
    this.clientRequestToken,
    this.errorsAndFailedEntriesZip,
    this.importCompletionTime,
    this.importDeletedTime,
    this.importRequestTime,
    this.importTaskId,
    this.importUrl,
    this.name,
    this.serverImportFailure,
    this.serverImportSuccess,
    this.status,
  });

  factory ImportTask.fromJson(Map<String, dynamic> json) {
    return ImportTask(
      applicationImportFailure: json['applicationImportFailure'] as int?,
      applicationImportSuccess: json['applicationImportSuccess'] as int?,
      clientRequestToken: json['clientRequestToken'] as String?,
      errorsAndFailedEntriesZip: json['errorsAndFailedEntriesZip'] as String?,
      importCompletionTime: timeStampFromJson(json['importCompletionTime']),
      importDeletedTime: timeStampFromJson(json['importDeletedTime']),
      importRequestTime: timeStampFromJson(json['importRequestTime']),
      importTaskId: json['importTaskId'] as String?,
      importUrl: json['importUrl'] as String?,
      name: json['name'] as String?,
      serverImportFailure: json['serverImportFailure'] as int?,
      serverImportSuccess: json['serverImportSuccess'] as int?,
      status: (json['status'] as String?)?.toImportStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationImportFailure = this.applicationImportFailure;
    final applicationImportSuccess = this.applicationImportSuccess;
    final clientRequestToken = this.clientRequestToken;
    final errorsAndFailedEntriesZip = this.errorsAndFailedEntriesZip;
    final importCompletionTime = this.importCompletionTime;
    final importDeletedTime = this.importDeletedTime;
    final importRequestTime = this.importRequestTime;
    final importTaskId = this.importTaskId;
    final importUrl = this.importUrl;
    final name = this.name;
    final serverImportFailure = this.serverImportFailure;
    final serverImportSuccess = this.serverImportSuccess;
    final status = this.status;
    return {
      if (applicationImportFailure != null)
        'applicationImportFailure': applicationImportFailure,
      if (applicationImportSuccess != null)
        'applicationImportSuccess': applicationImportSuccess,
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
      if (errorsAndFailedEntriesZip != null)
        'errorsAndFailedEntriesZip': errorsAndFailedEntriesZip,
      if (importCompletionTime != null)
        'importCompletionTime': unixTimestampToJson(importCompletionTime),
      if (importDeletedTime != null)
        'importDeletedTime': unixTimestampToJson(importDeletedTime),
      if (importRequestTime != null)
        'importRequestTime': unixTimestampToJson(importRequestTime),
      if (importTaskId != null) 'importTaskId': importTaskId,
      if (importUrl != null) 'importUrl': importUrl,
      if (name != null) 'name': name,
      if (serverImportFailure != null)
        'serverImportFailure': serverImportFailure,
      if (serverImportSuccess != null)
        'serverImportSuccess': serverImportSuccess,
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// A name-values pair of elements you can use to filter the results when
/// querying your import tasks. Currently, wildcards are not supported for
/// filters.
/// <note>
/// When filtering by import status, all other filter values are ignored.
/// </note>
class ImportTaskFilter {
  /// The name, status, or import task ID for a specific import task.
  final ImportTaskFilterName? name;

  /// An array of strings that you can provide to match against a specific name,
  /// status, or import task ID to filter the results for your import task
  /// queries.
  final List<String>? values;

  ImportTaskFilter({
    this.name,
    this.values,
  });

  factory ImportTaskFilter.fromJson(Map<String, dynamic> json) {
    return ImportTaskFilter(
      name: (json['name'] as String?)?.toImportTaskFilterName(),
      values: (json['values'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      if (name != null) 'name': name.toValue(),
      if (values != null) 'values': values,
    };
  }
}

enum ImportTaskFilterName {
  importTaskId,
  status,
  name,
}

extension on ImportTaskFilterName {
  String toValue() {
    switch (this) {
      case ImportTaskFilterName.importTaskId:
        return 'IMPORT_TASK_ID';
      case ImportTaskFilterName.status:
        return 'STATUS';
      case ImportTaskFilterName.name:
        return 'NAME';
    }
  }
}

extension on String {
  ImportTaskFilterName toImportTaskFilterName() {
    switch (this) {
      case 'IMPORT_TASK_ID':
        return ImportTaskFilterName.importTaskId;
      case 'STATUS':
        return ImportTaskFilterName.status;
      case 'NAME':
        return ImportTaskFilterName.name;
    }
    throw Exception('$this is not known in enum ImportTaskFilterName');
  }
}

class ListConfigurationsResponse {
  /// Returns configuration details, including the configuration ID, attribute
  /// names, and attribute values.
  final List<Map<String, String>>? configurations;

  /// Token to retrieve the next set of results. For example, if your call to
  /// ListConfigurations returned 100 items, but you set
  /// <code>ListConfigurationsRequest$maxResults</code> to 10, you received a set
  /// of 10 results along with this token. Use this token in the next query to
  /// retrieve the next set of 10.
  final String? nextToken;

  ListConfigurationsResponse({
    this.configurations,
    this.nextToken,
  });

  factory ListConfigurationsResponse.fromJson(Map<String, dynamic> json) {
    return ListConfigurationsResponse(
      configurations: (json['configurations'] as List?)
          ?.whereNotNull()
          .map((e) => (e as Map<String, dynamic>)
              .map((k, e) => MapEntry(k, e as String)))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configurations = this.configurations;
    final nextToken = this.nextToken;
    return {
      if (configurations != null) 'configurations': configurations,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListServerNeighborsResponse {
  /// List of distinct servers that are one hop away from the given server.
  final List<NeighborConnectionDetail> neighbors;

  /// Count of distinct servers that are one hop away from the given server.
  final int? knownDependencyCount;

  /// Token to retrieve the next set of results. For example, if you specified 100
  /// IDs for <code>ListServerNeighborsRequest$neighborConfigurationIds</code> but
  /// set <code>ListServerNeighborsRequest$maxResults</code> to 10, you received a
  /// set of 10 results along with this token. Use this token in the next query to
  /// retrieve the next set of 10.
  final String? nextToken;

  ListServerNeighborsResponse({
    required this.neighbors,
    this.knownDependencyCount,
    this.nextToken,
  });

  factory ListServerNeighborsResponse.fromJson(Map<String, dynamic> json) {
    return ListServerNeighborsResponse(
      neighbors: (json['neighbors'] as List)
          .whereNotNull()
          .map((e) =>
              NeighborConnectionDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      knownDependencyCount: json['knownDependencyCount'] as int?,
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final neighbors = this.neighbors;
    final knownDependencyCount = this.knownDependencyCount;
    final nextToken = this.nextToken;
    return {
      'neighbors': neighbors,
      if (knownDependencyCount != null)
        'knownDependencyCount': knownDependencyCount,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Details about neighboring servers.
class NeighborConnectionDetail {
  /// The number of open network connections with the neighboring server.
  final int connectionsCount;

  /// The ID of the server that accepted the network connection.
  final String destinationServerId;

  /// The ID of the server that opened the network connection.
  final String sourceServerId;

  /// The destination network port for the connection.
  final int? destinationPort;

  /// The network protocol used for the connection.
  final String? transportProtocol;

  NeighborConnectionDetail({
    required this.connectionsCount,
    required this.destinationServerId,
    required this.sourceServerId,
    this.destinationPort,
    this.transportProtocol,
  });

  factory NeighborConnectionDetail.fromJson(Map<String, dynamic> json) {
    return NeighborConnectionDetail(
      connectionsCount: json['connectionsCount'] as int,
      destinationServerId: json['destinationServerId'] as String,
      sourceServerId: json['sourceServerId'] as String,
      destinationPort: json['destinationPort'] as int?,
      transportProtocol: json['transportProtocol'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectionsCount = this.connectionsCount;
    final destinationServerId = this.destinationServerId;
    final sourceServerId = this.sourceServerId;
    final destinationPort = this.destinationPort;
    final transportProtocol = this.transportProtocol;
    return {
      'connectionsCount': connectionsCount,
      'destinationServerId': destinationServerId,
      'sourceServerId': sourceServerId,
      if (destinationPort != null) 'destinationPort': destinationPort,
      if (transportProtocol != null) 'transportProtocol': transportProtocol,
    };
  }
}

/// A field and direction for ordered output.
class OrderByElement {
  /// The field on which to order.
  final String fieldName;

  /// Ordering direction.
  final OrderString? sortOrder;

  OrderByElement({
    required this.fieldName,
    this.sortOrder,
  });

  factory OrderByElement.fromJson(Map<String, dynamic> json) {
    return OrderByElement(
      fieldName: json['fieldName'] as String,
      sortOrder: (json['sortOrder'] as String?)?.toOrderString(),
    );
  }

  Map<String, dynamic> toJson() {
    final fieldName = this.fieldName;
    final sortOrder = this.sortOrder;
    return {
      'fieldName': fieldName,
      if (sortOrder != null) 'sortOrder': sortOrder.toValue(),
    };
  }
}

class StartContinuousExportResponse {
  /// The type of data collector used to gather this data (currently only offered
  /// for AGENT).
  final DataSource? dataSource;

  /// The unique ID assigned to this export.
  final String? exportId;

  /// The name of the s3 bucket where the export data parquet files are stored.
  final String? s3Bucket;

  /// A dictionary which describes how the data is stored.
  ///
  /// <ul>
  /// <li>
  /// <code>databaseName</code> - the name of the Glue database used to store the
  /// schema.
  /// </li>
  /// </ul>
  final Map<String, String>? schemaStorageConfig;

  /// The timestamp representing when the continuous export was started.
  final DateTime? startTime;

  StartContinuousExportResponse({
    this.dataSource,
    this.exportId,
    this.s3Bucket,
    this.schemaStorageConfig,
    this.startTime,
  });

  factory StartContinuousExportResponse.fromJson(Map<String, dynamic> json) {
    return StartContinuousExportResponse(
      dataSource: (json['dataSource'] as String?)?.toDataSource(),
      exportId: json['exportId'] as String?,
      s3Bucket: json['s3Bucket'] as String?,
      schemaStorageConfig:
          (json['schemaStorageConfig'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      startTime: timeStampFromJson(json['startTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final dataSource = this.dataSource;
    final exportId = this.exportId;
    final s3Bucket = this.s3Bucket;
    final schemaStorageConfig = this.schemaStorageConfig;
    final startTime = this.startTime;
    return {
      if (dataSource != null) 'dataSource': dataSource.toValue(),
      if (exportId != null) 'exportId': exportId,
      if (s3Bucket != null) 's3Bucket': s3Bucket,
      if (schemaStorageConfig != null)
        'schemaStorageConfig': schemaStorageConfig,
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
    };
  }
}

class StartDataCollectionByAgentIdsResponse {
  /// Information about agents or the connector that were instructed to start
  /// collecting data. Information includes the agent/connector ID, a description
  /// of the operation performed, and whether the agent/connector configuration
  /// was updated.
  final List<AgentConfigurationStatus>? agentsConfigurationStatus;

  StartDataCollectionByAgentIdsResponse({
    this.agentsConfigurationStatus,
  });

  factory StartDataCollectionByAgentIdsResponse.fromJson(
      Map<String, dynamic> json) {
    return StartDataCollectionByAgentIdsResponse(
      agentsConfigurationStatus: (json['agentsConfigurationStatus'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AgentConfigurationStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final agentsConfigurationStatus = this.agentsConfigurationStatus;
    return {
      if (agentsConfigurationStatus != null)
        'agentsConfigurationStatus': agentsConfigurationStatus,
    };
  }
}

class StartExportTaskResponse {
  /// A unique identifier used to query the status of an export request.
  final String? exportId;

  StartExportTaskResponse({
    this.exportId,
  });

  factory StartExportTaskResponse.fromJson(Map<String, dynamic> json) {
    return StartExportTaskResponse(
      exportId: json['exportId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final exportId = this.exportId;
    return {
      if (exportId != null) 'exportId': exportId,
    };
  }
}

class StartImportTaskResponse {
  /// An array of information related to the import task request including status
  /// information, times, IDs, the Amazon S3 Object URL for the import file, and
  /// more.
  final ImportTask? task;

  StartImportTaskResponse({
    this.task,
  });

  factory StartImportTaskResponse.fromJson(Map<String, dynamic> json) {
    return StartImportTaskResponse(
      task: json['task'] != null
          ? ImportTask.fromJson(json['task'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final task = this.task;
    return {
      if (task != null) 'task': task,
    };
  }
}

class StopContinuousExportResponse {
  /// Timestamp that represents when this continuous export started collecting
  /// data.
  final DateTime? startTime;

  /// Timestamp that represents when this continuous export was stopped.
  final DateTime? stopTime;

  StopContinuousExportResponse({
    this.startTime,
    this.stopTime,
  });

  factory StopContinuousExportResponse.fromJson(Map<String, dynamic> json) {
    return StopContinuousExportResponse(
      startTime: timeStampFromJson(json['startTime']),
      stopTime: timeStampFromJson(json['stopTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final startTime = this.startTime;
    final stopTime = this.stopTime;
    return {
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
      if (stopTime != null) 'stopTime': unixTimestampToJson(stopTime),
    };
  }
}

class StopDataCollectionByAgentIdsResponse {
  /// Information about the agents or connector that were instructed to stop
  /// collecting data. Information includes the agent/connector ID, a description
  /// of the operation performed, and whether the agent/connector configuration
  /// was updated.
  final List<AgentConfigurationStatus>? agentsConfigurationStatus;

  StopDataCollectionByAgentIdsResponse({
    this.agentsConfigurationStatus,
  });

  factory StopDataCollectionByAgentIdsResponse.fromJson(
      Map<String, dynamic> json) {
    return StopDataCollectionByAgentIdsResponse(
      agentsConfigurationStatus: (json['agentsConfigurationStatus'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AgentConfigurationStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final agentsConfigurationStatus = this.agentsConfigurationStatus;
    return {
      if (agentsConfigurationStatus != null)
        'agentsConfigurationStatus': agentsConfigurationStatus,
    };
  }
}

/// Metadata that help you categorize IT assets.
class Tag {
  /// The type of tag on which to filter.
  final String key;

  /// A value for a tag key on which to filter.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['key'] as String,
      value: json['value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'key': key,
      'value': value,
    };
  }
}

/// The tag filter. Valid names are: <code>tagKey</code>, <code>tagValue</code>,
/// <code>configurationId</code>.
class TagFilter {
  /// A name of the tag filter.
  final String name;

  /// Values for the tag filter.
  final List<String> values;

  TagFilter({
    required this.name,
    required this.values,
  });

  factory TagFilter.fromJson(Map<String, dynamic> json) {
    return TagFilter(
      name: json['name'] as String,
      values: (json['values'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'name': name,
      'values': values,
    };
  }
}

class UpdateApplicationResponse {
  UpdateApplicationResponse();

  factory UpdateApplicationResponse.fromJson(Map<String, dynamic> _) {
    return UpdateApplicationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum OrderString {
  asc,
  desc,
}

extension on OrderString {
  String toValue() {
    switch (this) {
      case OrderString.asc:
        return 'ASC';
      case OrderString.desc:
        return 'DESC';
    }
  }
}

extension on String {
  OrderString toOrderString() {
    switch (this) {
      case 'ASC':
        return OrderString.asc;
      case 'DESC':
        return OrderString.desc;
    }
    throw Exception('$this is not known in enum OrderString');
  }
}

class AuthorizationErrorException extends _s.GenericAwsException {
  AuthorizationErrorException({String? type, String? message})
      : super(
            type: type, code: 'AuthorizationErrorException', message: message);
}

class ConflictErrorException extends _s.GenericAwsException {
  ConflictErrorException({String? type, String? message})
      : super(type: type, code: 'ConflictErrorException', message: message);
}

class HomeRegionNotSetException extends _s.GenericAwsException {
  HomeRegionNotSetException({String? type, String? message})
      : super(type: type, code: 'HomeRegionNotSetException', message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String? type, String? message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class InvalidParameterValueException extends _s.GenericAwsException {
  InvalidParameterValueException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidParameterValueException',
            message: message);
}

class OperationNotPermittedException extends _s.GenericAwsException {
  OperationNotPermittedException({String? type, String? message})
      : super(
            type: type,
            code: 'OperationNotPermittedException',
            message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String? type, String? message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServerInternalErrorException extends _s.GenericAwsException {
  ServerInternalErrorException({String? type, String? message})
      : super(
            type: type, code: 'ServerInternalErrorException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AuthorizationErrorException': (type, message) =>
      AuthorizationErrorException(type: type, message: message),
  'ConflictErrorException': (type, message) =>
      ConflictErrorException(type: type, message: message),
  'HomeRegionNotSetException': (type, message) =>
      HomeRegionNotSetException(type: type, message: message),
  'InvalidParameterException': (type, message) =>
      InvalidParameterException(type: type, message: message),
  'InvalidParameterValueException': (type, message) =>
      InvalidParameterValueException(type: type, message: message),
  'OperationNotPermittedException': (type, message) =>
      OperationNotPermittedException(type: type, message: message),
  'ResourceInUseException': (type, message) =>
      ResourceInUseException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServerInternalErrorException': (type, message) =>
      ServerInternalErrorException(type: type, message: message),
};
