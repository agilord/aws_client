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

part '2015-11-01.g.dart';

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
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
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
    @_s.required String applicationConfigurationId,
    @_s.required List<String> configurationIds,
  }) async {
    ArgumentError.checkNotNull(
        applicationConfigurationId, 'applicationConfigurationId');
    ArgumentError.checkNotNull(configurationIds, 'configurationIds');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSPoseidonService_V2015_11_01.AssociateConfigurationItemsToApplication'
    };
    final jsonResponse = await _protocol.send(
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

    return AssociateConfigurationItemsToApplicationResponse.fromJson(
        jsonResponse.body);
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
    @_s.required List<String> importTaskIds,
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
    @_s.required String name,
    String description,
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
    @_s.required List<String> configurationIds,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(configurationIds, 'configurationIds');
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSPoseidonService_V2015_11_01.CreateTags'
    };
    final jsonResponse = await _protocol.send(
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

    return CreateTagsResponse.fromJson(jsonResponse.body);
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
    @_s.required List<String> configurationIds,
  }) async {
    ArgumentError.checkNotNull(configurationIds, 'configurationIds');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSPoseidonService_V2015_11_01.DeleteApplications'
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

    return DeleteApplicationsResponse.fromJson(jsonResponse.body);
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
    @_s.required List<String> configurationIds,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(configurationIds, 'configurationIds');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSPoseidonService_V2015_11_01.DeleteTags'
    };
    final jsonResponse = await _protocol.send(
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

    return DeleteTagsResponse.fromJson(jsonResponse.body);
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
    List<String> agentIds,
    List<Filter> filters,
    int maxResults,
    String nextToken,
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
    @_s.required List<String> configurationIds,
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
    List<String> exportIds,
    int maxResults,
    String nextToken,
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
    List<String> exportIds,
    int maxResults,
    String nextToken,
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
    List<String> exportIds,
    List<ExportFilter> filters,
    int maxResults,
    String nextToken,
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
    List<ImportTaskFilter> filters,
    int maxResults,
    String nextToken,
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
    List<TagFilter> filters,
    int maxResults,
    String nextToken,
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
    @_s.required String applicationConfigurationId,
    @_s.required List<String> configurationIds,
  }) async {
    ArgumentError.checkNotNull(
        applicationConfigurationId, 'applicationConfigurationId');
    ArgumentError.checkNotNull(configurationIds, 'configurationIds');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSPoseidonService_V2015_11_01.DisassociateConfigurationItemsFromApplication'
    };
    final jsonResponse = await _protocol.send(
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

    return DisassociateConfigurationItemsFromApplicationResponse.fromJson(
        jsonResponse.body);
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
    @_s.required ConfigurationItemType configurationType,
    List<Filter> filters,
    int maxResults,
    String nextToken,
    List<OrderByElement> orderBy,
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
        'configurationType': configurationType?.toValue() ?? '',
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
    @_s.required String configurationId,
    int maxResults,
    List<String> neighborConfigurationIds,
    String nextToken,
    bool portInformationNeeded,
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
    @_s.required List<String> agentIds,
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
    DateTime endTime,
    List<ExportDataFormat> exportDataFormat,
    List<ExportFilter> filters,
    DateTime startTime,
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
          'exportDataFormat':
              exportDataFormat.map((e) => e?.toValue() ?? '').toList(),
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
    @_s.required String importUrl,
    @_s.required String name,
    String clientRequestToken,
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
    @_s.required String exportId,
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
    @_s.required List<String> agentIds,
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
    @_s.required String configurationId,
    String description,
    String name,
  }) async {
    ArgumentError.checkNotNull(configurationId, 'configurationId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSPoseidonService_V2015_11_01.UpdateApplication'
    };
    final jsonResponse = await _protocol.send(
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

    return UpdateApplicationResponse.fromJson(jsonResponse.body);
  }
}

/// Information about agents or connectors that were instructed to start
/// collecting data. Information includes the agent/connector ID, a description
/// of the operation, and whether the agent/connector configuration was updated.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AgentConfigurationStatus {
  /// The agent/connector ID.
  @_s.JsonKey(name: 'agentId')
  final String agentId;

  /// A description of the operation performed.
  @_s.JsonKey(name: 'description')
  final String description;

  /// Information about the status of the <code>StartDataCollection</code> and
  /// <code>StopDataCollection</code> operations. The system has recorded the data
  /// collection operation. The agent/connector receives this command the next
  /// time it polls for a new command.
  @_s.JsonKey(name: 'operationSucceeded')
  final bool operationSucceeded;

  AgentConfigurationStatus({
    this.agentId,
    this.description,
    this.operationSucceeded,
  });
  factory AgentConfigurationStatus.fromJson(Map<String, dynamic> json) =>
      _$AgentConfigurationStatusFromJson(json);
}

/// Information about agents or connectors associated with the user’s AWS
/// account. Information includes agent or connector IDs, IP addresses, media
/// access control (MAC) addresses, agent or connector health, hostname where
/// the agent or connector resides, and agent version for each agent.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AgentInfo {
  /// The agent or connector ID.
  @_s.JsonKey(name: 'agentId')
  final String agentId;

  /// Network details about the host where the agent or connector resides.
  @_s.JsonKey(name: 'agentNetworkInfoList')
  final List<AgentNetworkInfo> agentNetworkInfoList;

  /// Type of agent.
  @_s.JsonKey(name: 'agentType')
  final String agentType;

  /// Status of the collection process for an agent or connector.
  @_s.JsonKey(name: 'collectionStatus')
  final String collectionStatus;

  /// The ID of the connector.
  @_s.JsonKey(name: 'connectorId')
  final String connectorId;

  /// The health of the agent or connector.
  @_s.JsonKey(name: 'health')
  final AgentStatus health;

  /// The name of the host where the agent or connector resides. The host can be a
  /// server or virtual machine.
  @_s.JsonKey(name: 'hostName')
  final String hostName;

  /// Time since agent or connector health was reported.
  @_s.JsonKey(name: 'lastHealthPingTime')
  final String lastHealthPingTime;

  /// Agent's first registration timestamp in UTC.
  @_s.JsonKey(name: 'registeredTime')
  final String registeredTime;

  /// The agent or connector version.
  @_s.JsonKey(name: 'version')
  final String version;

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
  factory AgentInfo.fromJson(Map<String, dynamic> json) =>
      _$AgentInfoFromJson(json);
}

/// Network details about the host where the agent/connector resides.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AgentNetworkInfo {
  /// The IP address for the host where the agent/connector resides.
  @_s.JsonKey(name: 'ipAddress')
  final String ipAddress;

  /// The MAC address for the host where the agent/connector resides.
  @_s.JsonKey(name: 'macAddress')
  final String macAddress;

  AgentNetworkInfo({
    this.ipAddress,
    this.macAddress,
  });
  factory AgentNetworkInfo.fromJson(Map<String, dynamic> json) =>
      _$AgentNetworkInfoFromJson(json);
}

enum AgentStatus {
  @_s.JsonValue('HEALTHY')
  healthy,
  @_s.JsonValue('UNHEALTHY')
  unhealthy,
  @_s.JsonValue('RUNNING')
  running,
  @_s.JsonValue('UNKNOWN')
  unknown,
  @_s.JsonValue('BLACKLISTED')
  blacklisted,
  @_s.JsonValue('SHUTDOWN')
  shutdown,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateConfigurationItemsToApplicationResponse {
  AssociateConfigurationItemsToApplicationResponse();
  factory AssociateConfigurationItemsToApplicationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AssociateConfigurationItemsToApplicationResponseFromJson(json);
}

/// Error messages returned for each import task that you deleted as a response
/// for this command.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchDeleteImportDataError {
  /// The type of error that occurred for a specific import task.
  @_s.JsonKey(name: 'errorCode')
  final BatchDeleteImportDataErrorCode errorCode;

  /// The description of the error that occurred for a specific import task.
  @_s.JsonKey(name: 'errorDescription')
  final String errorDescription;

  /// The unique import ID associated with the error that occurred.
  @_s.JsonKey(name: 'importTaskId')
  final String importTaskId;

  BatchDeleteImportDataError({
    this.errorCode,
    this.errorDescription,
    this.importTaskId,
  });
  factory BatchDeleteImportDataError.fromJson(Map<String, dynamic> json) =>
      _$BatchDeleteImportDataErrorFromJson(json);
}

enum BatchDeleteImportDataErrorCode {
  @_s.JsonValue('NOT_FOUND')
  notFound,
  @_s.JsonValue('INTERNAL_SERVER_ERROR')
  internalServerError,
  @_s.JsonValue('OVER_LIMIT')
  overLimit,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchDeleteImportDataResponse {
  /// Error messages returned for each import task that you deleted as a response
  /// for this command.
  @_s.JsonKey(name: 'errors')
  final List<BatchDeleteImportDataError> errors;

  BatchDeleteImportDataResponse({
    this.errors,
  });
  factory BatchDeleteImportDataResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchDeleteImportDataResponseFromJson(json);
}

enum ConfigurationItemType {
  @_s.JsonValue('SERVER')
  server,
  @_s.JsonValue('PROCESS')
  process,
  @_s.JsonValue('CONNECTION')
  connection,
  @_s.JsonValue('APPLICATION')
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
    throw Exception('Unknown enum value: $this');
  }
}

/// Tags for a configuration item. Tags are metadata that help you categorize IT
/// assets.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConfigurationTag {
  /// The configuration ID for the item to tag. You can specify a list of keys and
  /// values.
  @_s.JsonKey(name: 'configurationId')
  final String configurationId;

  /// A type of IT asset to tag.
  @_s.JsonKey(name: 'configurationType')
  final ConfigurationItemType configurationType;

  /// A type of tag on which to filter. For example, <i>serverType</i>.
  @_s.JsonKey(name: 'key')
  final String key;

  /// The time the configuration tag was created in Coordinated Universal Time
  /// (UTC).
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'timeOfCreation')
  final DateTime timeOfCreation;

  /// A value on which to filter. For example <i>key = serverType</i> and <i>value
  /// = web server</i>.
  @_s.JsonKey(name: 'value')
  final String value;

  ConfigurationTag({
    this.configurationId,
    this.configurationType,
    this.key,
    this.timeOfCreation,
    this.value,
  });
  factory ConfigurationTag.fromJson(Map<String, dynamic> json) =>
      _$ConfigurationTagFromJson(json);
}

/// A list of continuous export descriptions.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ContinuousExportDescription {
  /// The type of data collector used to gather this data (currently only offered
  /// for AGENT).
  @_s.JsonKey(name: 'dataSource')
  final DataSource dataSource;

  /// The unique ID assigned to this export.
  @_s.JsonKey(name: 'exportId')
  final String exportId;

  /// The name of the s3 bucket where the export data parquet files are stored.
  @_s.JsonKey(name: 's3Bucket')
  final String s3Bucket;

  /// An object which describes how the data is stored.
  ///
  /// <ul>
  /// <li>
  /// <code>databaseName</code> - the name of the Glue database used to store the
  /// schema.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'schemaStorageConfig')
  final Map<String, String> schemaStorageConfig;

  /// The timestamp representing when the continuous export was started.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'startTime')
  final DateTime startTime;

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
  @_s.JsonKey(name: 'status')
  final ContinuousExportStatus status;

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
  @_s.JsonKey(name: 'statusDetail')
  final String statusDetail;

  /// The timestamp that represents when this continuous export was stopped.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'stopTime')
  final DateTime stopTime;

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
  factory ContinuousExportDescription.fromJson(Map<String, dynamic> json) =>
      _$ContinuousExportDescriptionFromJson(json);
}

enum ContinuousExportStatus {
  @_s.JsonValue('START_IN_PROGRESS')
  startInProgress,
  @_s.JsonValue('START_FAILED')
  startFailed,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('ERROR')
  error,
  @_s.JsonValue('STOP_IN_PROGRESS')
  stopInProgress,
  @_s.JsonValue('STOP_FAILED')
  stopFailed,
  @_s.JsonValue('INACTIVE')
  inactive,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateApplicationResponse {
  /// Configuration ID of an application to be created.
  @_s.JsonKey(name: 'configurationId')
  final String configurationId;

  CreateApplicationResponse({
    this.configurationId,
  });
  factory CreateApplicationResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateApplicationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateTagsResponse {
  CreateTagsResponse();
  factory CreateTagsResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateTagsResponseFromJson(json);
}

/// Inventory data for installed discovery agents.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CustomerAgentInfo {
  /// Number of active discovery agents.
  @_s.JsonKey(name: 'activeAgents')
  final int activeAgents;

  /// Number of blacklisted discovery agents.
  @_s.JsonKey(name: 'blackListedAgents')
  final int blackListedAgents;

  /// Number of healthy discovery agents
  @_s.JsonKey(name: 'healthyAgents')
  final int healthyAgents;

  /// Number of discovery agents with status SHUTDOWN.
  @_s.JsonKey(name: 'shutdownAgents')
  final int shutdownAgents;

  /// Total number of discovery agents.
  @_s.JsonKey(name: 'totalAgents')
  final int totalAgents;

  /// Number of unhealthy discovery agents.
  @_s.JsonKey(name: 'unhealthyAgents')
  final int unhealthyAgents;

  /// Number of unknown discovery agents.
  @_s.JsonKey(name: 'unknownAgents')
  final int unknownAgents;

  CustomerAgentInfo({
    @_s.required this.activeAgents,
    @_s.required this.blackListedAgents,
    @_s.required this.healthyAgents,
    @_s.required this.shutdownAgents,
    @_s.required this.totalAgents,
    @_s.required this.unhealthyAgents,
    @_s.required this.unknownAgents,
  });
  factory CustomerAgentInfo.fromJson(Map<String, dynamic> json) =>
      _$CustomerAgentInfoFromJson(json);
}

/// Inventory data for installed discovery connectors.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CustomerConnectorInfo {
  /// Number of active discovery connectors.
  @_s.JsonKey(name: 'activeConnectors')
  final int activeConnectors;

  /// Number of blacklisted discovery connectors.
  @_s.JsonKey(name: 'blackListedConnectors')
  final int blackListedConnectors;

  /// Number of healthy discovery connectors.
  @_s.JsonKey(name: 'healthyConnectors')
  final int healthyConnectors;

  /// Number of discovery connectors with status SHUTDOWN,
  @_s.JsonKey(name: 'shutdownConnectors')
  final int shutdownConnectors;

  /// Total number of discovery connectors.
  @_s.JsonKey(name: 'totalConnectors')
  final int totalConnectors;

  /// Number of unhealthy discovery connectors.
  @_s.JsonKey(name: 'unhealthyConnectors')
  final int unhealthyConnectors;

  /// Number of unknown discovery connectors.
  @_s.JsonKey(name: 'unknownConnectors')
  final int unknownConnectors;

  CustomerConnectorInfo({
    @_s.required this.activeConnectors,
    @_s.required this.blackListedConnectors,
    @_s.required this.healthyConnectors,
    @_s.required this.shutdownConnectors,
    @_s.required this.totalConnectors,
    @_s.required this.unhealthyConnectors,
    @_s.required this.unknownConnectors,
  });
  factory CustomerConnectorInfo.fromJson(Map<String, dynamic> json) =>
      _$CustomerConnectorInfoFromJson(json);
}

enum DataSource {
  @_s.JsonValue('AGENT')
  agent,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteApplicationsResponse {
  DeleteApplicationsResponse();
  factory DeleteApplicationsResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteApplicationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteTagsResponse {
  DeleteTagsResponse();
  factory DeleteTagsResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteTagsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAgentsResponse {
  /// Lists agents or the Connector by ID or lists all agents/Connectors
  /// associated with your user account if you did not specify an agent/Connector
  /// ID. The output includes agent/Connector IDs, IP addresses, media access
  /// control (MAC) addresses, agent/Connector health, host name where the
  /// agent/Connector resides, and the version number of each agent/Connector.
  @_s.JsonKey(name: 'agentsInfo')
  final List<AgentInfo> agentsInfo;

  /// Token to retrieve the next set of results. For example, if you specified 100
  /// IDs for <code>DescribeAgentsRequest$agentIds</code> but set
  /// <code>DescribeAgentsRequest$maxResults</code> to 10, you received a set of
  /// 10 results along with this token. Use this token in the next query to
  /// retrieve the next set of 10.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  DescribeAgentsResponse({
    this.agentsInfo,
    this.nextToken,
  });
  factory DescribeAgentsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeAgentsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeConfigurationsResponse {
  /// A key in the response map. The value is an array of data.
  @_s.JsonKey(name: 'configurations')
  final List<Map<String, String>> configurations;

  DescribeConfigurationsResponse({
    this.configurations,
  });
  factory DescribeConfigurationsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeConfigurationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeContinuousExportsResponse {
  /// A list of continuous export descriptions.
  @_s.JsonKey(name: 'descriptions')
  final List<ContinuousExportDescription> descriptions;

  /// The token from the previous call to <code>DescribeExportTasks</code>.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  DescribeContinuousExportsResponse({
    this.descriptions,
    this.nextToken,
  });
  factory DescribeContinuousExportsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeContinuousExportsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeExportConfigurationsResponse {
  /// <p/>
  @_s.JsonKey(name: 'exportsInfo')
  final List<ExportInfo> exportsInfo;

  /// The token from the previous call to describe-export-tasks.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  DescribeExportConfigurationsResponse({
    this.exportsInfo,
    this.nextToken,
  });
  factory DescribeExportConfigurationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeExportConfigurationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeExportTasksResponse {
  /// Contains one or more sets of export request details. When the status of a
  /// request is <code>SUCCEEDED</code>, the response includes a URL for an Amazon
  /// S3 bucket where you can view the data in a CSV file.
  @_s.JsonKey(name: 'exportsInfo')
  final List<ExportInfo> exportsInfo;

  /// The <code>nextToken</code> value to include in a future
  /// <code>DescribeExportTasks</code> request. When the results of a
  /// <code>DescribeExportTasks</code> request exceed <code>maxResults</code>,
  /// this value can be used to retrieve the next page of results. This value is
  /// null when there are no more results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  DescribeExportTasksResponse({
    this.exportsInfo,
    this.nextToken,
  });
  factory DescribeExportTasksResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeExportTasksResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeImportTasksResponse {
  /// The token to request the next page of results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// A returned array of import tasks that match any applied filters, up to the
  /// specified number of maximum results.
  @_s.JsonKey(name: 'tasks')
  final List<ImportTask> tasks;

  DescribeImportTasksResponse({
    this.nextToken,
    this.tasks,
  });
  factory DescribeImportTasksResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeImportTasksResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeTagsResponse {
  /// The call returns a token. Use this token to get the next set of results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// Depending on the input, this is a list of configuration items tagged with a
  /// specific tag, or a list of tags for a specific configuration item.
  @_s.JsonKey(name: 'tags')
  final List<ConfigurationTag> tags;

  DescribeTagsResponse({
    this.nextToken,
    this.tags,
  });
  factory DescribeTagsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeTagsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateConfigurationItemsFromApplicationResponse {
  DisassociateConfigurationItemsFromApplicationResponse();
  factory DisassociateConfigurationItemsFromApplicationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DisassociateConfigurationItemsFromApplicationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ExportConfigurationsResponse {
  /// A unique identifier that you can use to query the export status.
  @_s.JsonKey(name: 'exportId')
  final String exportId;

  ExportConfigurationsResponse({
    this.exportId,
  });
  factory ExportConfigurationsResponse.fromJson(Map<String, dynamic> json) =>
      _$ExportConfigurationsResponseFromJson(json);
}

enum ExportDataFormat {
  @_s.JsonValue('CSV')
  csv,
  @_s.JsonValue('GRAPHML')
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
    throw Exception('Unknown enum value: $this');
  }
}

/// Used to select which agent's data is to be exported. A single agent ID may
/// be selected for export using the <a
/// href="http://docs.aws.amazon.com/application-discovery/latest/APIReference/API_StartExportTask.html">StartExportTask</a>
/// action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ExportFilter {
  /// Supported condition: <code>EQUALS</code>
  @_s.JsonKey(name: 'condition')
  final String condition;

  /// A single <code>ExportFilter</code> name. Supported filters:
  /// <code>agentId</code>.
  @_s.JsonKey(name: 'name')
  final String name;

  /// A single <code>agentId</code> for a Discovery Agent. An <code>agentId</code>
  /// can be found using the <a
  /// href="http://docs.aws.amazon.com/application-discovery/latest/APIReference/API_DescribeExportTasks.html">DescribeAgents</a>
  /// action. Typically an ADS <code>agentId</code> is in the form
  /// <code>o-0123456789abcdef0</code>.
  @_s.JsonKey(name: 'values')
  final List<String> values;

  ExportFilter({
    @_s.required this.condition,
    @_s.required this.name,
    @_s.required this.values,
  });
  Map<String, dynamic> toJson() => _$ExportFilterToJson(this);
}

/// Information regarding the export status of discovered data. The value is an
/// array of objects.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ExportInfo {
  /// A unique identifier used to query an export.
  @_s.JsonKey(name: 'exportId')
  final String exportId;

  /// The time that the data export was initiated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'exportRequestTime')
  final DateTime exportRequestTime;

  /// The status of the data export job.
  @_s.JsonKey(name: 'exportStatus')
  final ExportStatus exportStatus;

  /// A status message provided for API callers.
  @_s.JsonKey(name: 'statusMessage')
  final String statusMessage;

  /// A URL for an Amazon S3 bucket where you can review the exported data. The
  /// URL is displayed only if the export succeeded.
  @_s.JsonKey(name: 'configurationsDownloadUrl')
  final String configurationsDownloadUrl;

  /// If true, the export of agent information exceeded the size limit for a
  /// single export and the exported data is incomplete for the requested time
  /// range. To address this, select a smaller time range for the export by using
  /// <code>startDate</code> and <code>endDate</code>.
  @_s.JsonKey(name: 'isTruncated')
  final bool isTruncated;

  /// The <code>endTime</code> used in the <code>StartExportTask</code> request.
  /// If no <code>endTime</code> was requested, this result does not appear in
  /// <code>ExportInfo</code>.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'requestedEndTime')
  final DateTime requestedEndTime;

  /// The value of <code>startTime</code> parameter in the
  /// <code>StartExportTask</code> request. If no <code>startTime</code> was
  /// requested, this result does not appear in <code>ExportInfo</code>.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'requestedStartTime')
  final DateTime requestedStartTime;

  ExportInfo({
    @_s.required this.exportId,
    @_s.required this.exportRequestTime,
    @_s.required this.exportStatus,
    @_s.required this.statusMessage,
    this.configurationsDownloadUrl,
    this.isTruncated,
    this.requestedEndTime,
    this.requestedStartTime,
  });
  factory ExportInfo.fromJson(Map<String, dynamic> json) =>
      _$ExportInfoFromJson(json);
}

enum ExportStatus {
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('SUCCEEDED')
  succeeded,
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
}

/// A filter that can use conditional operators.
///
/// For more information about filters, see <a
/// href="https://docs.aws.amazon.com/application-discovery/latest/userguide/discovery-api-queries.html">Querying
/// Discovered Configuration Items</a> in the <i>AWS Application Discovery
/// Service User Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Filter {
  /// A conditional operator. The following operators are valid: EQUALS,
  /// NOT_EQUALS, CONTAINS, NOT_CONTAINS. If you specify multiple filters, the
  /// system utilizes all filters as though concatenated by <i>AND</i>. If you
  /// specify multiple values for a particular filter, the system differentiates
  /// the values using <i>OR</i>. Calling either <i>DescribeConfigurations</i> or
  /// <i>ListConfigurations</i> returns attributes of matching configuration
  /// items.
  @_s.JsonKey(name: 'condition')
  final String condition;

  /// The name of the filter.
  @_s.JsonKey(name: 'name')
  final String name;

  /// A string value on which to filter. For example, if you choose the
  /// <code>destinationServer.osVersion</code> filter name, you could specify
  /// <code>Ubuntu</code> for the value.
  @_s.JsonKey(name: 'values')
  final List<String> values;

  Filter({
    @_s.required this.condition,
    @_s.required this.name,
    @_s.required this.values,
  });
  Map<String, dynamic> toJson() => _$FilterToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDiscoverySummaryResponse {
  /// Details about discovered agents, including agent status and health.
  @_s.JsonKey(name: 'agentSummary')
  final CustomerAgentInfo agentSummary;

  /// The number of applications discovered.
  @_s.JsonKey(name: 'applications')
  final int applications;

  /// Details about discovered connectors, including connector status and health.
  @_s.JsonKey(name: 'connectorSummary')
  final CustomerConnectorInfo connectorSummary;

  /// The number of servers discovered.
  @_s.JsonKey(name: 'servers')
  final int servers;

  /// The number of servers mapped to applications.
  @_s.JsonKey(name: 'serversMappedToApplications')
  final int serversMappedToApplications;

  /// The number of servers mapped to tags.
  @_s.JsonKey(name: 'serversMappedtoTags')
  final int serversMappedtoTags;

  GetDiscoverySummaryResponse({
    this.agentSummary,
    this.applications,
    this.connectorSummary,
    this.servers,
    this.serversMappedToApplications,
    this.serversMappedtoTags,
  });
  factory GetDiscoverySummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDiscoverySummaryResponseFromJson(json);
}

enum ImportStatus {
  @_s.JsonValue('IMPORT_IN_PROGRESS')
  importInProgress,
  @_s.JsonValue('IMPORT_COMPLETE')
  importComplete,
  @_s.JsonValue('IMPORT_COMPLETE_WITH_ERRORS')
  importCompleteWithErrors,
  @_s.JsonValue('IMPORT_FAILED')
  importFailed,
  @_s.JsonValue('IMPORT_FAILED_SERVER_LIMIT_EXCEEDED')
  importFailedServerLimitExceeded,
  @_s.JsonValue('IMPORT_FAILED_RECORD_LIMIT_EXCEEDED')
  importFailedRecordLimitExceeded,
  @_s.JsonValue('DELETE_IN_PROGRESS')
  deleteInProgress,
  @_s.JsonValue('DELETE_COMPLETE')
  deleteComplete,
  @_s.JsonValue('DELETE_FAILED')
  deleteFailed,
  @_s.JsonValue('DELETE_FAILED_LIMIT_EXCEEDED')
  deleteFailedLimitExceeded,
  @_s.JsonValue('INTERNAL_ERROR')
  internalError,
}

/// An array of information related to the import task request that includes
/// status information, times, IDs, the Amazon S3 Object URL for the import
/// file, and more.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ImportTask {
  /// The total number of application records in the import file that failed to be
  /// imported.
  @_s.JsonKey(name: 'applicationImportFailure')
  final int applicationImportFailure;

  /// The total number of application records in the import file that were
  /// successfully imported.
  @_s.JsonKey(name: 'applicationImportSuccess')
  final int applicationImportSuccess;

  /// A unique token used to prevent the same import request from occurring more
  /// than once. If you didn't provide a token, a token was automatically
  /// generated when the import task request was sent.
  @_s.JsonKey(name: 'clientRequestToken')
  final String clientRequestToken;

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
  @_s.JsonKey(name: 'errorsAndFailedEntriesZip')
  final String errorsAndFailedEntriesZip;

  /// The time that the import task request finished, presented in the Unix time
  /// stamp format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'importCompletionTime')
  final DateTime importCompletionTime;

  /// The time that the import task request was deleted, presented in the Unix
  /// time stamp format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'importDeletedTime')
  final DateTime importDeletedTime;

  /// The time that the import task request was made, presented in the Unix time
  /// stamp format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'importRequestTime')
  final DateTime importRequestTime;

  /// The unique ID for a specific import task. These IDs aren't globally unique,
  /// but they are unique within an AWS account.
  @_s.JsonKey(name: 'importTaskId')
  final String importTaskId;

  /// The URL for your import file that you've uploaded to Amazon S3.
  @_s.JsonKey(name: 'importUrl')
  final String importUrl;

  /// A descriptive name for an import task. You can use this name to filter
  /// future requests related to this import task, such as identifying
  /// applications and servers that were included in this import task. We
  /// recommend that you use a meaningful name for each import task.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The total number of server records in the import file that failed to be
  /// imported.
  @_s.JsonKey(name: 'serverImportFailure')
  final int serverImportFailure;

  /// The total number of server records in the import file that were successfully
  /// imported.
  @_s.JsonKey(name: 'serverImportSuccess')
  final int serverImportSuccess;

  /// The status of the import task. An import can have the status of
  /// <code>IMPORT_COMPLETE</code> and still have some records fail to import from
  /// the overall request. More information can be found in the downloadable
  /// archive defined in the <code>errorsAndFailedEntriesZip</code> field, or in
  /// the Migration Hub management console.
  @_s.JsonKey(name: 'status')
  final ImportStatus status;

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
  factory ImportTask.fromJson(Map<String, dynamic> json) =>
      _$ImportTaskFromJson(json);
}

/// A name-values pair of elements you can use to filter the results when
/// querying your import tasks. Currently, wildcards are not supported for
/// filters.
/// <note>
/// When filtering by import status, all other filter values are ignored.
/// </note>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ImportTaskFilter {
  /// The name, status, or import task ID for a specific import task.
  @_s.JsonKey(name: 'name')
  final ImportTaskFilterName name;

  /// An array of strings that you can provide to match against a specific name,
  /// status, or import task ID to filter the results for your import task
  /// queries.
  @_s.JsonKey(name: 'values')
  final List<String> values;

  ImportTaskFilter({
    this.name,
    this.values,
  });
  Map<String, dynamic> toJson() => _$ImportTaskFilterToJson(this);
}

enum ImportTaskFilterName {
  @_s.JsonValue('IMPORT_TASK_ID')
  importTaskId,
  @_s.JsonValue('STATUS')
  status,
  @_s.JsonValue('NAME')
  name,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListConfigurationsResponse {
  /// Returns configuration details, including the configuration ID, attribute
  /// names, and attribute values.
  @_s.JsonKey(name: 'configurations')
  final List<Map<String, String>> configurations;

  /// Token to retrieve the next set of results. For example, if your call to
  /// ListConfigurations returned 100 items, but you set
  /// <code>ListConfigurationsRequest$maxResults</code> to 10, you received a set
  /// of 10 results along with this token. Use this token in the next query to
  /// retrieve the next set of 10.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListConfigurationsResponse({
    this.configurations,
    this.nextToken,
  });
  factory ListConfigurationsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListConfigurationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListServerNeighborsResponse {
  /// List of distinct servers that are one hop away from the given server.
  @_s.JsonKey(name: 'neighbors')
  final List<NeighborConnectionDetail> neighbors;

  /// Count of distinct servers that are one hop away from the given server.
  @_s.JsonKey(name: 'knownDependencyCount')
  final int knownDependencyCount;

  /// Token to retrieve the next set of results. For example, if you specified 100
  /// IDs for <code>ListServerNeighborsRequest$neighborConfigurationIds</code> but
  /// set <code>ListServerNeighborsRequest$maxResults</code> to 10, you received a
  /// set of 10 results along with this token. Use this token in the next query to
  /// retrieve the next set of 10.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListServerNeighborsResponse({
    @_s.required this.neighbors,
    this.knownDependencyCount,
    this.nextToken,
  });
  factory ListServerNeighborsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListServerNeighborsResponseFromJson(json);
}

/// Details about neighboring servers.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NeighborConnectionDetail {
  /// The number of open network connections with the neighboring server.
  @_s.JsonKey(name: 'connectionsCount')
  final int connectionsCount;

  /// The ID of the server that accepted the network connection.
  @_s.JsonKey(name: 'destinationServerId')
  final String destinationServerId;

  /// The ID of the server that opened the network connection.
  @_s.JsonKey(name: 'sourceServerId')
  final String sourceServerId;

  /// The destination network port for the connection.
  @_s.JsonKey(name: 'destinationPort')
  final int destinationPort;

  /// The network protocol used for the connection.
  @_s.JsonKey(name: 'transportProtocol')
  final String transportProtocol;

  NeighborConnectionDetail({
    @_s.required this.connectionsCount,
    @_s.required this.destinationServerId,
    @_s.required this.sourceServerId,
    this.destinationPort,
    this.transportProtocol,
  });
  factory NeighborConnectionDetail.fromJson(Map<String, dynamic> json) =>
      _$NeighborConnectionDetailFromJson(json);
}

/// A field and direction for ordered output.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class OrderByElement {
  /// The field on which to order.
  @_s.JsonKey(name: 'fieldName')
  final String fieldName;

  /// Ordering direction.
  @_s.JsonKey(name: 'sortOrder')
  final OrderString sortOrder;

  OrderByElement({
    @_s.required this.fieldName,
    this.sortOrder,
  });
  Map<String, dynamic> toJson() => _$OrderByElementToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartContinuousExportResponse {
  /// The type of data collector used to gather this data (currently only offered
  /// for AGENT).
  @_s.JsonKey(name: 'dataSource')
  final DataSource dataSource;

  /// The unique ID assigned to this export.
  @_s.JsonKey(name: 'exportId')
  final String exportId;

  /// The name of the s3 bucket where the export data parquet files are stored.
  @_s.JsonKey(name: 's3Bucket')
  final String s3Bucket;

  /// A dictionary which describes how the data is stored.
  ///
  /// <ul>
  /// <li>
  /// <code>databaseName</code> - the name of the Glue database used to store the
  /// schema.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'schemaStorageConfig')
  final Map<String, String> schemaStorageConfig;

  /// The timestamp representing when the continuous export was started.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'startTime')
  final DateTime startTime;

  StartContinuousExportResponse({
    this.dataSource,
    this.exportId,
    this.s3Bucket,
    this.schemaStorageConfig,
    this.startTime,
  });
  factory StartContinuousExportResponse.fromJson(Map<String, dynamic> json) =>
      _$StartContinuousExportResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartDataCollectionByAgentIdsResponse {
  /// Information about agents or the connector that were instructed to start
  /// collecting data. Information includes the agent/connector ID, a description
  /// of the operation performed, and whether the agent/connector configuration
  /// was updated.
  @_s.JsonKey(name: 'agentsConfigurationStatus')
  final List<AgentConfigurationStatus> agentsConfigurationStatus;

  StartDataCollectionByAgentIdsResponse({
    this.agentsConfigurationStatus,
  });
  factory StartDataCollectionByAgentIdsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$StartDataCollectionByAgentIdsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartExportTaskResponse {
  /// A unique identifier used to query the status of an export request.
  @_s.JsonKey(name: 'exportId')
  final String exportId;

  StartExportTaskResponse({
    this.exportId,
  });
  factory StartExportTaskResponse.fromJson(Map<String, dynamic> json) =>
      _$StartExportTaskResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartImportTaskResponse {
  /// An array of information related to the import task request including status
  /// information, times, IDs, the Amazon S3 Object URL for the import file, and
  /// more.
  @_s.JsonKey(name: 'task')
  final ImportTask task;

  StartImportTaskResponse({
    this.task,
  });
  factory StartImportTaskResponse.fromJson(Map<String, dynamic> json) =>
      _$StartImportTaskResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopContinuousExportResponse {
  /// Timestamp that represents when this continuous export started collecting
  /// data.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'startTime')
  final DateTime startTime;

  /// Timestamp that represents when this continuous export was stopped.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'stopTime')
  final DateTime stopTime;

  StopContinuousExportResponse({
    this.startTime,
    this.stopTime,
  });
  factory StopContinuousExportResponse.fromJson(Map<String, dynamic> json) =>
      _$StopContinuousExportResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopDataCollectionByAgentIdsResponse {
  /// Information about the agents or connector that were instructed to stop
  /// collecting data. Information includes the agent/connector ID, a description
  /// of the operation performed, and whether the agent/connector configuration
  /// was updated.
  @_s.JsonKey(name: 'agentsConfigurationStatus')
  final List<AgentConfigurationStatus> agentsConfigurationStatus;

  StopDataCollectionByAgentIdsResponse({
    this.agentsConfigurationStatus,
  });
  factory StopDataCollectionByAgentIdsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$StopDataCollectionByAgentIdsResponseFromJson(json);
}

/// Metadata that help you categorize IT assets.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Tag {
  /// The type of tag on which to filter.
  @_s.JsonKey(name: 'key')
  final String key;

  /// A value for a tag key on which to filter.
  @_s.JsonKey(name: 'value')
  final String value;

  Tag({
    @_s.required this.key,
    @_s.required this.value,
  });
  Map<String, dynamic> toJson() => _$TagToJson(this);
}

/// The tag filter. Valid names are: <code>tagKey</code>, <code>tagValue</code>,
/// <code>configurationId</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TagFilter {
  /// A name of the tag filter.
  @_s.JsonKey(name: 'name')
  final String name;

  /// Values for the tag filter.
  @_s.JsonKey(name: 'values')
  final List<String> values;

  TagFilter({
    @_s.required this.name,
    @_s.required this.values,
  });
  Map<String, dynamic> toJson() => _$TagFilterToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateApplicationResponse {
  UpdateApplicationResponse();
  factory UpdateApplicationResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateApplicationResponseFromJson(json);
}

enum OrderString {
  @_s.JsonValue('ASC')
  asc,
  @_s.JsonValue('DESC')
  desc,
}

class AuthorizationErrorException extends _s.GenericAwsException {
  AuthorizationErrorException({String type, String message})
      : super(
            type: type, code: 'AuthorizationErrorException', message: message);
}

class ConflictErrorException extends _s.GenericAwsException {
  ConflictErrorException({String type, String message})
      : super(type: type, code: 'ConflictErrorException', message: message);
}

class HomeRegionNotSetException extends _s.GenericAwsException {
  HomeRegionNotSetException({String type, String message})
      : super(type: type, code: 'HomeRegionNotSetException', message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String type, String message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class InvalidParameterValueException extends _s.GenericAwsException {
  InvalidParameterValueException({String type, String message})
      : super(
            type: type,
            code: 'InvalidParameterValueException',
            message: message);
}

class OperationNotPermittedException extends _s.GenericAwsException {
  OperationNotPermittedException({String type, String message})
      : super(
            type: type,
            code: 'OperationNotPermittedException',
            message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String type, String message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServerInternalErrorException extends _s.GenericAwsException {
  ServerInternalErrorException({String type, String message})
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
