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

/// Welcome to the Amazon AppFlow API reference. This guide is for developers
/// who need detailed information about the Amazon AppFlow API operations, data
/// types, and errors.
///
/// Amazon AppFlow is a fully managed integration service that enables you to
/// securely transfer data between software as a service (SaaS) applications
/// like Salesforce, Marketo, Slack, and ServiceNow, and Amazon Web Services
/// like Amazon S3 and Amazon Redshift.
///
/// Use the following links to get started on the Amazon AppFlow API:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/appflow/1.0/APIReference/API_Operations.html">Actions</a>:
/// An alphabetical list of all Amazon AppFlow API operations.
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/appflow/1.0/APIReference/API_Types.html">Data
/// types</a>: An alphabetical list of all Amazon AppFlow data types.
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/appflow/1.0/APIReference/CommonParameters.html">Common
/// parameters</a>: Parameters that all Query operations can use.
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/appflow/1.0/APIReference/CommonErrors.html">Common
/// errors</a>: Client and server errors that all operations can return.
/// </li>
/// </ul>
/// If you're new to Amazon AppFlow, we recommend that you review the <a
/// href="https://docs.aws.amazon.com/appflow/latest/userguide/what-is-appflow.html">Amazon
/// AppFlow User Guide</a>.
///
/// Amazon AppFlow API users can use vendor-specific mechanisms for OAuth, and
/// include applicable OAuth attributes (such as <code>auth-code</code> and
/// <code>redirecturi</code>) with the connector-specific
/// <code>ConnectorProfileProperties</code> when creating a new connector
/// profile using Amazon AppFlow API operations. For example, Salesforce users
/// can refer to the <a
/// href="https://help.salesforce.com/articleView?id=remoteaccess_authenticate.htm">
/// <i>Authorize Apps with OAuth</i> </a> documentation.
class Appflow {
  final _s.RestJsonProtocol _protocol;
  Appflow({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'appflow',
            signingName: 'appflow',
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

  /// Cancels active runs for a flow.
  ///
  /// You can cancel all of the active runs for a flow, or you can cancel
  /// specific runs by providing their IDs.
  ///
  /// You can cancel a flow run only when the run is in progress. You can't
  /// cancel a run that has already completed or failed. You also can't cancel a
  /// run that's scheduled to occur but hasn't started yet. To prevent a
  /// scheduled run, you can deactivate the flow with the <code>StopFlow</code>
  /// action.
  ///
  /// You cannot resume a run after you cancel it.
  ///
  /// When you send your request, the status for each run becomes
  /// <code>CancelStarted</code>. When the cancellation completes, the status
  /// becomes <code>Canceled</code>.
  /// <note>
  /// When you cancel a run, you still incur charges for any data that the run
  /// already processed before the cancellation. If the run had already written
  /// some data to the flow destination, then that data remains in the
  /// destination. If you configured the flow to use a batch API (such as the
  /// Salesforce Bulk API 2.0), then the run will finish reading or writing its
  /// entire batch of data after the cancellation. For these operations, the
  /// data processing charges for Amazon AppFlow apply. For the pricing
  /// information, see <a href="http://aws.amazon.com/appflow/pricing/">Amazon
  /// AppFlow pricing</a>.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [flowName] :
  /// The name of a flow with active runs that you want to cancel.
  ///
  /// Parameter [executionIds] :
  /// The ID of each active run to cancel. These runs must belong to the flow
  /// you specify in your request.
  ///
  /// If you omit this parameter, your request ends all active runs that belong
  /// to the flow.
  Future<CancelFlowExecutionsResponse> cancelFlowExecutions({
    required String flowName,
    List<String>? executionIds,
  }) async {
    final $payload = <String, dynamic>{
      'flowName': flowName,
      if (executionIds != null) 'executionIds': executionIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/cancel-flow-executions',
      exceptionFnMap: _exceptionFns,
    );
    return CancelFlowExecutionsResponse.fromJson(response);
  }

  /// Creates a new connector profile associated with your Amazon Web Services
  /// account. There is a soft quota of 100 connector profiles per Amazon Web
  /// Services account. If you need more connector profiles than this quota
  /// allows, you can submit a request to the Amazon AppFlow team through the
  /// Amazon AppFlow support channel. In each connector profile that you create,
  /// you can provide the credentials and properties for only one connector.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConnectorAuthenticationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [connectionMode] :
  /// Indicates the connection mode and specifies whether it is public or
  /// private. Private flows use Amazon Web Services PrivateLink to route data
  /// over Amazon Web Services infrastructure without exposing it to the public
  /// internet.
  ///
  /// Parameter [connectorProfileConfig] :
  /// Defines the connector-specific configuration and credentials.
  ///
  /// Parameter [connectorProfileName] :
  /// The name of the connector profile. The name is unique for each
  /// <code>ConnectorProfile</code> in your Amazon Web Services account.
  ///
  /// Parameter [connectorType] :
  /// The type of connector, such as Salesforce, Amplitude, and so on.
  ///
  /// Parameter [clientToken] :
  /// The <code>clientToken</code> parameter is an idempotency token. It ensures
  /// that your <code>CreateConnectorProfile</code> request completes only once.
  /// You choose the value to pass. For example, if you don't receive a response
  /// from your request, you can safely retry the request with the same
  /// <code>clientToken</code> parameter value.
  ///
  /// If you omit a <code>clientToken</code> value, the Amazon Web Services SDK
  /// that you are using inserts a value for you. This way, the SDK can safely
  /// retry requests multiple times after a network error. You must provide your
  /// own value for other use cases.
  ///
  /// If you specify input parameters that differ from your first request, an
  /// error occurs. If you use a different value for <code>clientToken</code>,
  /// Amazon AppFlow considers it a new call to
  /// <code>CreateConnectorProfile</code>. The token is active for 8 hours.
  ///
  /// Parameter [connectorLabel] :
  /// The label of the connector. The label is unique for each
  /// <code>ConnectorRegistration</code> in your Amazon Web Services account.
  /// Only needed if calling for CUSTOMCONNECTOR connector type/.
  ///
  /// Parameter [kmsArn] :
  /// The ARN (Amazon Resource Name) of the Key Management Service (KMS) key you
  /// provide for encryption. This is required if you do not want to use the
  /// Amazon AppFlow-managed KMS key. If you don't provide anything here, Amazon
  /// AppFlow uses the Amazon AppFlow-managed KMS key.
  Future<CreateConnectorProfileResponse> createConnectorProfile({
    required ConnectionMode connectionMode,
    required ConnectorProfileConfig connectorProfileConfig,
    required String connectorProfileName,
    required ConnectorType connectorType,
    String? clientToken,
    String? connectorLabel,
    String? kmsArn,
  }) async {
    final $payload = <String, dynamic>{
      'connectionMode': connectionMode.value,
      'connectorProfileConfig': connectorProfileConfig,
      'connectorProfileName': connectorProfileName,
      'connectorType': connectorType.value,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (connectorLabel != null) 'connectorLabel': connectorLabel,
      if (kmsArn != null) 'kmsArn': kmsArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/create-connector-profile',
      exceptionFnMap: _exceptionFns,
    );
    return CreateConnectorProfileResponse.fromJson(response);
  }

  /// Enables your application to create a new flow using Amazon AppFlow. You
  /// must create a connector profile before calling this API. Please note that
  /// the Request Syntax below shows syntax for multiple destinations, however,
  /// you can only transfer data to one item in this list at a time. Amazon
  /// AppFlow does not currently support flows to multiple destinations at once.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [ConnectorAuthenticationException].
  /// May throw [ConnectorServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [destinationFlowConfigList] :
  /// The configuration that controls how Amazon AppFlow places data in the
  /// destination connector.
  ///
  /// Parameter [flowName] :
  /// The specified name of the flow. Spaces are not allowed. Use underscores
  /// (_) or hyphens (-) only.
  ///
  /// Parameter [sourceFlowConfig] :
  /// The configuration that controls how Amazon AppFlow retrieves data from the
  /// source connector.
  ///
  /// Parameter [tasks] :
  /// A list of tasks that Amazon AppFlow performs while transferring the data
  /// in the flow run.
  ///
  /// Parameter [triggerConfig] :
  /// The trigger settings that determine how and when the flow runs.
  ///
  /// Parameter [clientToken] :
  /// The <code>clientToken</code> parameter is an idempotency token. It ensures
  /// that your <code>CreateFlow</code> request completes only once. You choose
  /// the value to pass. For example, if you don't receive a response from your
  /// request, you can safely retry the request with the same
  /// <code>clientToken</code> parameter value.
  ///
  /// If you omit a <code>clientToken</code> value, the Amazon Web Services SDK
  /// that you are using inserts a value for you. This way, the SDK can safely
  /// retry requests multiple times after a network error. You must provide your
  /// own value for other use cases.
  ///
  /// If you specify input parameters that differ from your first request, an
  /// error occurs. If you use a different value for <code>clientToken</code>,
  /// Amazon AppFlow considers it a new call to <code>CreateFlow</code>. The
  /// token is active for 8 hours.
  ///
  /// Parameter [description] :
  /// A description of the flow you want to create.
  ///
  /// Parameter [kmsArn] :
  /// The ARN (Amazon Resource Name) of the Key Management Service (KMS) key you
  /// provide for encryption. This is required if you do not want to use the
  /// Amazon AppFlow-managed KMS key. If you don't provide anything here, Amazon
  /// AppFlow uses the Amazon AppFlow-managed KMS key.
  ///
  /// Parameter [metadataCatalogConfig] :
  /// Specifies the configuration that Amazon AppFlow uses when it catalogs the
  /// data that's transferred by the associated flow. When Amazon AppFlow
  /// catalogs the data from a flow, it stores metadata in a data catalog.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for your flow.
  Future<CreateFlowResponse> createFlow({
    required List<DestinationFlowConfig> destinationFlowConfigList,
    required String flowName,
    required SourceFlowConfig sourceFlowConfig,
    required List<Task> tasks,
    required TriggerConfig triggerConfig,
    String? clientToken,
    String? description,
    String? kmsArn,
    MetadataCatalogConfig? metadataCatalogConfig,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'destinationFlowConfigList': destinationFlowConfigList,
      'flowName': flowName,
      'sourceFlowConfig': sourceFlowConfig,
      'tasks': tasks,
      'triggerConfig': triggerConfig,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (kmsArn != null) 'kmsArn': kmsArn,
      if (metadataCatalogConfig != null)
        'metadataCatalogConfig': metadataCatalogConfig,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/create-flow',
      exceptionFnMap: _exceptionFns,
    );
    return CreateFlowResponse.fromJson(response);
  }

  /// Enables you to delete an existing connector profile.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [connectorProfileName] :
  /// The name of the connector profile. The name is unique for each
  /// <code>ConnectorProfile</code> in your account.
  ///
  /// Parameter [forceDelete] :
  /// Indicates whether Amazon AppFlow should delete the profile, even if it is
  /// currently in use in one or more flows.
  Future<void> deleteConnectorProfile({
    required String connectorProfileName,
    bool? forceDelete,
  }) async {
    final $payload = <String, dynamic>{
      'connectorProfileName': connectorProfileName,
      if (forceDelete != null) 'forceDelete': forceDelete,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/delete-connector-profile',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Enables your application to delete an existing flow. Before deleting the
  /// flow, Amazon AppFlow validates the request by checking the flow
  /// configuration and status. You can delete flows one at a time.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [flowName] :
  /// The specified name of the flow. Spaces are not allowed. Use underscores
  /// (_) or hyphens (-) only.
  ///
  /// Parameter [forceDelete] :
  /// Indicates whether Amazon AppFlow should delete the flow, even if it is
  /// currently in use.
  Future<void> deleteFlow({
    required String flowName,
    bool? forceDelete,
  }) async {
    final $payload = <String, dynamic>{
      'flowName': flowName,
      if (forceDelete != null) 'forceDelete': forceDelete,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/delete-flow',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Describes the given custom connector registered in your Amazon Web
  /// Services account. This API can be used for custom connectors that are
  /// registered in your account and also for Amazon authored connectors.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [connectorType] :
  /// The connector type, such as CUSTOMCONNECTOR, Saleforce, Marketo. Please
  /// choose CUSTOMCONNECTOR for Lambda based custom connectors.
  ///
  /// Parameter [connectorLabel] :
  /// The label of the connector. The label is unique for each
  /// <code>ConnectorRegistration</code> in your Amazon Web Services account.
  /// Only needed if calling for CUSTOMCONNECTOR connector type/.
  Future<DescribeConnectorResponse> describeConnector({
    required ConnectorType connectorType,
    String? connectorLabel,
  }) async {
    final $payload = <String, dynamic>{
      'connectorType': connectorType.value,
      if (connectorLabel != null) 'connectorLabel': connectorLabel,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/describe-connector',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeConnectorResponse.fromJson(response);
  }

  /// Provides details regarding the entity used with the connector, with a
  /// description of the data model for each field in that entity.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConnectorAuthenticationException].
  /// May throw [ConnectorServerException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [connectorEntityName] :
  /// The entity name for that connector.
  ///
  /// Parameter [apiVersion] :
  /// The version of the API that's used by the connector.
  ///
  /// Parameter [connectorProfileName] :
  /// The name of the connector profile. The name is unique for each
  /// <code>ConnectorProfile</code> in the Amazon Web Services account.
  ///
  /// Parameter [connectorType] :
  /// The type of connector application, such as Salesforce, Amplitude, and so
  /// on.
  Future<DescribeConnectorEntityResponse> describeConnectorEntity({
    required String connectorEntityName,
    String? apiVersion,
    String? connectorProfileName,
    ConnectorType? connectorType,
  }) async {
    final $payload = <String, dynamic>{
      'connectorEntityName': connectorEntityName,
      if (apiVersion != null) 'apiVersion': apiVersion,
      if (connectorProfileName != null)
        'connectorProfileName': connectorProfileName,
      if (connectorType != null) 'connectorType': connectorType.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/describe-connector-entity',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeConnectorEntityResponse.fromJson(response);
  }

  /// Returns a list of <code>connector-profile</code> details matching the
  /// provided <code>connector-profile</code> names and
  /// <code>connector-types</code>. Both input lists are optional, and you can
  /// use them to filter the result.
  ///
  /// If no names or <code>connector-types</code> are provided, returns all
  /// connector profiles in a paginated form. If there is no match, this
  /// operation returns an empty list.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [connectorLabel] :
  /// The name of the connector. The name is unique for each
  /// <code>ConnectorRegistration</code> in your Amazon Web Services account.
  /// Only needed if calling for CUSTOMCONNECTOR connector type/.
  ///
  /// Parameter [connectorProfileNames] :
  /// The name of the connector profile. The name is unique for each
  /// <code>ConnectorProfile</code> in the Amazon Web Services account.
  ///
  /// Parameter [connectorType] :
  /// The type of connector, such as Salesforce, Amplitude, and so on.
  ///
  /// Parameter [maxResults] :
  /// Specifies the maximum number of items that should be returned in the
  /// result set. The default for <code>maxResults</code> is 20 (for all
  /// paginated API operations).
  ///
  /// Parameter [nextToken] :
  /// The pagination token for the next page of data.
  Future<DescribeConnectorProfilesResponse> describeConnectorProfiles({
    String? connectorLabel,
    List<String>? connectorProfileNames,
    ConnectorType? connectorType,
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
      if (connectorLabel != null) 'connectorLabel': connectorLabel,
      if (connectorProfileNames != null)
        'connectorProfileNames': connectorProfileNames,
      if (connectorType != null) 'connectorType': connectorType.value,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/describe-connector-profiles',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeConnectorProfilesResponse.fromJson(response);
  }

  /// Describes the connectors vended by Amazon AppFlow for specified connector
  /// types. If you don't specify a connector type, this operation describes all
  /// connectors vended by Amazon AppFlow. If there are more connectors than can
  /// be returned in one page, the response contains a <code>nextToken</code>
  /// object, which can be be passed in to the next call to the
  /// <code>DescribeConnectors</code> API operation to retrieve the next page.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [connectorTypes] :
  /// The type of connector, such as Salesforce, Amplitude, and so on.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items that should be returned in the result set. The
  /// default is 20.
  ///
  /// Parameter [nextToken] :
  /// The pagination token for the next page of data.
  Future<DescribeConnectorsResponse> describeConnectors({
    List<ConnectorType>? connectorTypes,
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
      if (connectorTypes != null)
        'connectorTypes': connectorTypes.map((e) => e.value).toList(),
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/describe-connectors',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeConnectorsResponse.fromJson(response);
  }

  /// Provides a description of the specified flow.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [flowName] :
  /// The specified name of the flow. Spaces are not allowed. Use underscores
  /// (_) or hyphens (-) only.
  Future<DescribeFlowResponse> describeFlow({
    required String flowName,
  }) async {
    final $payload = <String, dynamic>{
      'flowName': flowName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/describe-flow',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeFlowResponse.fromJson(response);
  }

  /// Fetches the execution history of the flow.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [flowName] :
  /// The specified name of the flow. Spaces are not allowed. Use underscores
  /// (_) or hyphens (-) only.
  ///
  /// Parameter [maxResults] :
  /// Specifies the maximum number of items that should be returned in the
  /// result set. The default for <code>maxResults</code> is 20 (for all
  /// paginated API operations).
  ///
  /// Parameter [nextToken] :
  /// The pagination token for the next page of data.
  Future<DescribeFlowExecutionRecordsResponse> describeFlowExecutionRecords({
    required String flowName,
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
      'flowName': flowName,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/describe-flow-execution-records',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeFlowExecutionRecordsResponse.fromJson(response);
  }

  /// Returns the list of available connector entities supported by Amazon
  /// AppFlow. For example, you can query Salesforce for <i>Account</i> and
  /// <i>Opportunity</i> entities, or query ServiceNow for the <i>Incident</i>
  /// entity.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConnectorAuthenticationException].
  /// May throw [ConnectorServerException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [apiVersion] :
  /// The version of the API that's used by the connector.
  ///
  /// Parameter [connectorProfileName] :
  /// The name of the connector profile. The name is unique for each
  /// <code>ConnectorProfile</code> in the Amazon Web Services account, and is
  /// used to query the downstream connector.
  ///
  /// Parameter [connectorType] :
  /// The type of connector, such as Salesforce, Amplitude, and so on.
  ///
  /// Parameter [entitiesPath] :
  /// This optional parameter is specific to connector implementation. Some
  /// connectors support multiple levels or categories of entities. You can find
  /// out the list of roots for such providers by sending a request without the
  /// <code>entitiesPath</code> parameter. If the connector supports entities at
  /// different roots, this initial request returns the list of roots.
  /// Otherwise, this request returns all entities supported by the provider.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items that the operation returns in the response.
  ///
  /// Parameter [nextToken] :
  /// A token that was provided by your prior <code>ListConnectorEntities</code>
  /// operation if the response was too big for the page size. You specify this
  /// token to get the next page of results in paginated response.
  Future<ListConnectorEntitiesResponse> listConnectorEntities({
    String? apiVersion,
    String? connectorProfileName,
    ConnectorType? connectorType,
    String? entitiesPath,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      10000,
    );
    final $payload = <String, dynamic>{
      if (apiVersion != null) 'apiVersion': apiVersion,
      if (connectorProfileName != null)
        'connectorProfileName': connectorProfileName,
      if (connectorType != null) 'connectorType': connectorType.value,
      if (entitiesPath != null) 'entitiesPath': entitiesPath,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-connector-entities',
      exceptionFnMap: _exceptionFns,
    );
    return ListConnectorEntitiesResponse.fromJson(response);
  }

  /// Returns the list of all registered custom connectors in your Amazon Web
  /// Services account. This API lists only custom connectors registered in this
  /// account, not the Amazon Web Services authored connectors.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// Specifies the maximum number of items that should be returned in the
  /// result set. The default for <code>maxResults</code> is 20 (for all
  /// paginated API operations).
  ///
  /// Parameter [nextToken] :
  /// The pagination token for the next page of data.
  Future<ListConnectorsResponse> listConnectors({
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
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-connectors',
      exceptionFnMap: _exceptionFns,
    );
    return ListConnectorsResponse.fromJson(response);
  }

  /// Lists all of the flows associated with your account.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// Specifies the maximum number of items that should be returned in the
  /// result set.
  ///
  /// Parameter [nextToken] :
  /// The pagination token for next page of data.
  Future<ListFlowsResponse> listFlows({
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
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-flows',
      exceptionFnMap: _exceptionFns,
    );
    return ListFlowsResponse.fromJson(response);
  }

  /// Retrieves the tags that are associated with a specified flow.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the specified flow.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Registers a new custom connector with your Amazon Web Services account.
  /// Before you can register the connector, you must deploy the associated AWS
  /// lambda function in your account.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ConnectorServerException].
  /// May throw [ConnectorAuthenticationException].
  ///
  /// Parameter [clientToken] :
  /// The <code>clientToken</code> parameter is an idempotency token. It ensures
  /// that your <code>RegisterConnector</code> request completes only once. You
  /// choose the value to pass. For example, if you don't receive a response
  /// from your request, you can safely retry the request with the same
  /// <code>clientToken</code> parameter value.
  ///
  /// If you omit a <code>clientToken</code> value, the Amazon Web Services SDK
  /// that you are using inserts a value for you. This way, the SDK can safely
  /// retry requests multiple times after a network error. You must provide your
  /// own value for other use cases.
  ///
  /// If you specify input parameters that differ from your first request, an
  /// error occurs. If you use a different value for <code>clientToken</code>,
  /// Amazon AppFlow considers it a new call to <code>RegisterConnector</code>.
  /// The token is active for 8 hours.
  ///
  /// Parameter [connectorLabel] :
  /// The name of the connector. The name is unique for each
  /// <code>ConnectorRegistration</code> in your Amazon Web Services account.
  ///
  /// Parameter [connectorProvisioningConfig] :
  /// The provisioning type of the connector. Currently the only supported value
  /// is LAMBDA.
  ///
  /// Parameter [connectorProvisioningType] :
  /// The provisioning type of the connector. Currently the only supported value
  /// is LAMBDA.
  ///
  /// Parameter [description] :
  /// A description about the connector that's being registered.
  Future<RegisterConnectorResponse> registerConnector({
    String? clientToken,
    String? connectorLabel,
    ConnectorProvisioningConfig? connectorProvisioningConfig,
    ConnectorProvisioningType? connectorProvisioningType,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (connectorLabel != null) 'connectorLabel': connectorLabel,
      if (connectorProvisioningConfig != null)
        'connectorProvisioningConfig': connectorProvisioningConfig,
      if (connectorProvisioningType != null)
        'connectorProvisioningType': connectorProvisioningType.value,
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/register-connector',
      exceptionFnMap: _exceptionFns,
    );
    return RegisterConnectorResponse.fromJson(response);
  }

  /// Resets metadata about your connector entities that Amazon AppFlow stored
  /// in its cache. Use this action when you want Amazon AppFlow to return the
  /// latest information about the data that you have in a source application.
  ///
  /// Amazon AppFlow returns metadata about your entities when you use the
  /// ListConnectorEntities or DescribeConnectorEntities actions. Following
  /// these actions, Amazon AppFlow caches the metadata to reduce the number of
  /// API requests that it must send to the source application. Amazon AppFlow
  /// automatically resets the cache once every hour, but you can use this
  /// action when you want to get the latest metadata right away.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [apiVersion] :
  /// The API version that you specified in the connector profile that you’re
  /// resetting cached metadata for. You must use this parameter only if the
  /// connector supports multiple API versions or if the connector type is
  /// CustomConnector.
  ///
  /// To look up how many versions a connector supports, use the
  /// DescribeConnectors action. In the response, find the value that Amazon
  /// AppFlow returns for the connectorVersion parameter.
  ///
  /// To look up the connector type, use the DescribeConnectorProfiles action.
  /// In the response, find the value that Amazon AppFlow returns for the
  /// connectorType parameter.
  ///
  /// To look up the API version that you specified in a connector profile, use
  /// the DescribeConnectorProfiles action.
  ///
  /// Parameter [connectorEntityName] :
  /// Use this parameter if you want to reset cached metadata about the details
  /// for an individual entity.
  ///
  /// If you don't include this parameter in your request, Amazon AppFlow only
  /// resets cached metadata about entity names, not entity details.
  ///
  /// Parameter [connectorProfileName] :
  /// The name of the connector profile that you want to reset cached metadata
  /// for.
  ///
  /// You can omit this parameter if you're resetting the cache for any of the
  /// following connectors: Amazon Connect, Amazon EventBridge, Amazon Lookout
  /// for Metrics, Amazon S3, or Upsolver. If you're resetting the cache for any
  /// other connector, you must include this parameter in your request.
  ///
  /// Parameter [connectorType] :
  /// The type of connector to reset cached metadata for.
  ///
  /// You must include this parameter in your request if you're resetting the
  /// cache for any of the following connectors: Amazon Connect, Amazon
  /// EventBridge, Amazon Lookout for Metrics, Amazon S3, or Upsolver. If you're
  /// resetting the cache for any other connector, you can omit this parameter
  /// from your request.
  ///
  /// Parameter [entitiesPath] :
  /// Use this parameter only if you’re resetting the cached metadata about a
  /// nested entity. Only some connectors support nested entities. A nested
  /// entity is one that has another entity as a parent. To use this parameter,
  /// specify the name of the parent entity.
  ///
  /// To look up the parent-child relationship of entities, you can send a
  /// ListConnectorEntities request that omits the entitiesPath parameter.
  /// Amazon AppFlow will return a list of top-level entities. For each one, it
  /// indicates whether the entity has nested entities. Then, in a subsequent
  /// ListConnectorEntities request, you can specify a parent entity name for
  /// the entitiesPath parameter. Amazon AppFlow will return a list of the child
  /// entities for that parent.
  Future<void> resetConnectorMetadataCache({
    String? apiVersion,
    String? connectorEntityName,
    String? connectorProfileName,
    ConnectorType? connectorType,
    String? entitiesPath,
  }) async {
    final $payload = <String, dynamic>{
      if (apiVersion != null) 'apiVersion': apiVersion,
      if (connectorEntityName != null)
        'connectorEntityName': connectorEntityName,
      if (connectorProfileName != null)
        'connectorProfileName': connectorProfileName,
      if (connectorType != null) 'connectorType': connectorType.value,
      if (entitiesPath != null) 'entitiesPath': entitiesPath,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/reset-connector-metadata-cache',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Activates an existing flow. For on-demand flows, this operation runs the
  /// flow immediately. For schedule and event-triggered flows, this operation
  /// activates the flow.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  ///
  /// Parameter [flowName] :
  /// The specified name of the flow. Spaces are not allowed. Use underscores
  /// (_) or hyphens (-) only.
  ///
  /// Parameter [clientToken] :
  /// The <code>clientToken</code> parameter is an idempotency token. It ensures
  /// that your <code>StartFlow</code> request completes only once. You choose
  /// the value to pass. For example, if you don't receive a response from your
  /// request, you can safely retry the request with the same
  /// <code>clientToken</code> parameter value.
  ///
  /// If you omit a <code>clientToken</code> value, the Amazon Web Services SDK
  /// that you are using inserts a value for you. This way, the SDK can safely
  /// retry requests multiple times after a network error. You must provide your
  /// own value for other use cases.
  ///
  /// If you specify input parameters that differ from your first request, an
  /// error occurs for flows that run on a schedule or based on an event.
  /// However, the error doesn't occur for flows that run on demand. You set the
  /// conditions that initiate your flow for the <code>triggerConfig</code>
  /// parameter.
  ///
  /// If you use a different value for <code>clientToken</code>, Amazon AppFlow
  /// considers it a new call to <code>StartFlow</code>. The token is active for
  /// 8 hours.
  Future<StartFlowResponse> startFlow({
    required String flowName,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'flowName': flowName,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/start-flow',
      exceptionFnMap: _exceptionFns,
    );
    return StartFlowResponse.fromJson(response);
  }

  /// Deactivates the existing flow. For on-demand flows, this operation returns
  /// an <code>unsupportedOperationException</code> error message. For schedule
  /// and event-triggered flows, this operation deactivates the flow.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnsupportedOperationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [flowName] :
  /// The specified name of the flow. Spaces are not allowed. Use underscores
  /// (_) or hyphens (-) only.
  Future<StopFlowResponse> stopFlow({
    required String flowName,
  }) async {
    final $payload = <String, dynamic>{
      'flowName': flowName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/stop-flow',
      exceptionFnMap: _exceptionFns,
    );
    return StopFlowResponse.fromJson(response);
  }

  /// Applies a tag to the specified flow.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the flow that you want to tag.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for your flow.
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

  /// Unregisters the custom connector registered in your account that matches
  /// the connector label provided in the request.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [connectorLabel] :
  /// The label of the connector. The label is unique for each
  /// <code>ConnectorRegistration</code> in your Amazon Web Services account.
  ///
  /// Parameter [forceDelete] :
  /// Indicates whether Amazon AppFlow should unregister the connector, even if
  /// it is currently in use in one or more connector profiles. The default
  /// value is false.
  Future<void> unregisterConnector({
    required String connectorLabel,
    bool? forceDelete,
  }) async {
    final $payload = <String, dynamic>{
      'connectorLabel': connectorLabel,
      if (forceDelete != null) 'forceDelete': forceDelete,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/unregister-connector',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes a tag from the specified flow.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the flow that you want to untag.
  ///
  /// Parameter [tagKeys] :
  /// The tag keys associated with the tag that you want to remove from your
  /// flow.
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

  /// Updates a given connector profile associated with your account.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ConnectorAuthenticationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [connectionMode] :
  /// Indicates the connection mode and if it is public or private.
  ///
  /// Parameter [connectorProfileConfig] :
  /// Defines the connector-specific profile configuration and credentials.
  ///
  /// Parameter [connectorProfileName] :
  /// The name of the connector profile and is unique for each
  /// <code>ConnectorProfile</code> in the Amazon Web Services account.
  ///
  /// Parameter [clientToken] :
  /// The <code>clientToken</code> parameter is an idempotency token. It ensures
  /// that your <code>UpdateConnectorProfile</code> request completes only once.
  /// You choose the value to pass. For example, if you don't receive a response
  /// from your request, you can safely retry the request with the same
  /// <code>clientToken</code> parameter value.
  ///
  /// If you omit a <code>clientToken</code> value, the Amazon Web Services SDK
  /// that you are using inserts a value for you. This way, the SDK can safely
  /// retry requests multiple times after a network error. You must provide your
  /// own value for other use cases.
  ///
  /// If you specify input parameters that differ from your first request, an
  /// error occurs. If you use a different value for <code>clientToken</code>,
  /// Amazon AppFlow considers it a new call to
  /// <code>UpdateConnectorProfile</code>. The token is active for 8 hours.
  Future<UpdateConnectorProfileResponse> updateConnectorProfile({
    required ConnectionMode connectionMode,
    required ConnectorProfileConfig connectorProfileConfig,
    required String connectorProfileName,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'connectionMode': connectionMode.value,
      'connectorProfileConfig': connectorProfileConfig,
      'connectorProfileName': connectorProfileName,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/update-connector-profile',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateConnectorProfileResponse.fromJson(response);
  }

  /// Updates a custom connector that you've previously registered. This
  /// operation updates the connector with one of the following:
  ///
  /// <ul>
  /// <li>
  /// The latest version of the AWS Lambda function that's assigned to the
  /// connector
  /// </li>
  /// <li>
  /// A new AWS Lambda function that you specify
  /// </li>
  /// </ul>
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ConnectorServerException].
  /// May throw [ConnectorAuthenticationException].
  ///
  /// Parameter [connectorLabel] :
  /// The name of the connector. The name is unique for each connector
  /// registration in your AWS account.
  ///
  /// Parameter [clientToken] :
  /// The <code>clientToken</code> parameter is an idempotency token. It ensures
  /// that your <code>UpdateConnectorRegistration</code> request completes only
  /// once. You choose the value to pass. For example, if you don't receive a
  /// response from your request, you can safely retry the request with the same
  /// <code>clientToken</code> parameter value.
  ///
  /// If you omit a <code>clientToken</code> value, the Amazon Web Services SDK
  /// that you are using inserts a value for you. This way, the SDK can safely
  /// retry requests multiple times after a network error. You must provide your
  /// own value for other use cases.
  ///
  /// If you specify input parameters that differ from your first request, an
  /// error occurs. If you use a different value for <code>clientToken</code>,
  /// Amazon AppFlow considers it a new call to
  /// <code>UpdateConnectorRegistration</code>. The token is active for 8 hours.
  ///
  /// Parameter [description] :
  /// A description about the update that you're applying to the connector.
  Future<UpdateConnectorRegistrationResponse> updateConnectorRegistration({
    required String connectorLabel,
    String? clientToken,
    ConnectorProvisioningConfig? connectorProvisioningConfig,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      'connectorLabel': connectorLabel,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (connectorProvisioningConfig != null)
        'connectorProvisioningConfig': connectorProvisioningConfig,
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/update-connector-registration',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateConnectorRegistrationResponse.fromJson(response);
  }

  /// Updates an existing flow.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [ConnectorAuthenticationException].
  /// May throw [ConnectorServerException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [destinationFlowConfigList] :
  /// The configuration that controls how Amazon AppFlow transfers data to the
  /// destination connector.
  ///
  /// Parameter [flowName] :
  /// The specified name of the flow. Spaces are not allowed. Use underscores
  /// (_) or hyphens (-) only.
  ///
  /// Parameter [tasks] :
  /// A list of tasks that Amazon AppFlow performs while transferring the data
  /// in the flow run.
  ///
  /// Parameter [triggerConfig] :
  /// The trigger settings that determine how and when the flow runs.
  ///
  /// Parameter [clientToken] :
  /// The <code>clientToken</code> parameter is an idempotency token. It ensures
  /// that your <code>UpdateFlow</code> request completes only once. You choose
  /// the value to pass. For example, if you don't receive a response from your
  /// request, you can safely retry the request with the same
  /// <code>clientToken</code> parameter value.
  ///
  /// If you omit a <code>clientToken</code> value, the Amazon Web Services SDK
  /// that you are using inserts a value for you. This way, the SDK can safely
  /// retry requests multiple times after a network error. You must provide your
  /// own value for other use cases.
  ///
  /// If you specify input parameters that differ from your first request, an
  /// error occurs. If you use a different value for <code>clientToken</code>,
  /// Amazon AppFlow considers it a new call to <code>UpdateFlow</code>. The
  /// token is active for 8 hours.
  ///
  /// Parameter [description] :
  /// A description of the flow.
  ///
  /// Parameter [metadataCatalogConfig] :
  /// Specifies the configuration that Amazon AppFlow uses when it catalogs the
  /// data that's transferred by the associated flow. When Amazon AppFlow
  /// catalogs the data from a flow, it stores metadata in a data catalog.
  Future<UpdateFlowResponse> updateFlow({
    required List<DestinationFlowConfig> destinationFlowConfigList,
    required String flowName,
    required SourceFlowConfig sourceFlowConfig,
    required List<Task> tasks,
    required TriggerConfig triggerConfig,
    String? clientToken,
    String? description,
    MetadataCatalogConfig? metadataCatalogConfig,
  }) async {
    final $payload = <String, dynamic>{
      'destinationFlowConfigList': destinationFlowConfigList,
      'flowName': flowName,
      'sourceFlowConfig': sourceFlowConfig,
      'tasks': tasks,
      'triggerConfig': triggerConfig,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (metadataCatalogConfig != null)
        'metadataCatalogConfig': metadataCatalogConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/update-flow',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateFlowResponse.fromJson(response);
  }
}

/// The aggregation settings that you can use to customize the output format of
/// your flow data.
class AggregationConfig {
  /// Specifies whether Amazon AppFlow aggregates the flow records into a single
  /// file, or leave them unaggregated.
  final AggregationType? aggregationType;

  /// The desired file size, in MB, for each output file that Amazon AppFlow
  /// writes to the flow destination. For each file, Amazon AppFlow attempts to
  /// achieve the size that you specify. The actual file sizes might differ from
  /// this target based on the number and size of the records that each file
  /// contains.
  final int? targetFileSize;

  AggregationConfig({
    this.aggregationType,
    this.targetFileSize,
  });

  factory AggregationConfig.fromJson(Map<String, dynamic> json) {
    return AggregationConfig(
      aggregationType:
          (json['aggregationType'] as String?)?.let(AggregationType.fromString),
      targetFileSize: json['targetFileSize'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final aggregationType = this.aggregationType;
    final targetFileSize = this.targetFileSize;
    return {
      if (aggregationType != null) 'aggregationType': aggregationType.value,
      if (targetFileSize != null) 'targetFileSize': targetFileSize,
    };
  }
}

enum AggregationType {
  none('None'),
  singleFile('SingleFile'),
  ;

  final String value;

  const AggregationType(this.value);

  static AggregationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum AggregationType'));
}

enum AmplitudeConnectorOperator {
  between('BETWEEN'),
  ;

  final String value;

  const AmplitudeConnectorOperator(this.value);

  static AmplitudeConnectorOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum AmplitudeConnectorOperator'));
}

/// The connector-specific credentials required when using Amplitude.
class AmplitudeConnectorProfileCredentials {
  /// A unique alphanumeric identifier used to authenticate a user, developer, or
  /// calling program to your API.
  final String apiKey;

  /// The Secret Access Key portion of the credentials.
  final String secretKey;

  AmplitudeConnectorProfileCredentials({
    required this.apiKey,
    required this.secretKey,
  });

  Map<String, dynamic> toJson() {
    final apiKey = this.apiKey;
    final secretKey = this.secretKey;
    return {
      'apiKey': apiKey,
      'secretKey': secretKey,
    };
  }
}

/// The connector-specific profile properties required when using Amplitude.
class AmplitudeConnectorProfileProperties {
  AmplitudeConnectorProfileProperties();

  factory AmplitudeConnectorProfileProperties.fromJson(Map<String, dynamic> _) {
    return AmplitudeConnectorProfileProperties();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The connector metadata specific to Amplitude.
class AmplitudeMetadata {
  AmplitudeMetadata();

  factory AmplitudeMetadata.fromJson(Map<String, dynamic> _) {
    return AmplitudeMetadata();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The properties that are applied when Amplitude is being used as a source.
class AmplitudeSourceProperties {
  /// The object specified in the Amplitude flow source.
  final String object;

  AmplitudeSourceProperties({
    required this.object,
  });

  factory AmplitudeSourceProperties.fromJson(Map<String, dynamic> json) {
    return AmplitudeSourceProperties(
      object: json['object'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final object = this.object;
    return {
      'object': object,
    };
  }
}

/// The API key credentials required for API key authentication.
class ApiKeyCredentials {
  /// The API key required for API key authentication.
  final String apiKey;

  /// The API secret key required for API key authentication.
  final String? apiSecretKey;

  ApiKeyCredentials({
    required this.apiKey,
    this.apiSecretKey,
  });

  Map<String, dynamic> toJson() {
    final apiKey = this.apiKey;
    final apiSecretKey = this.apiSecretKey;
    return {
      'apiKey': apiKey,
      if (apiSecretKey != null) 'apiSecretKey': apiSecretKey,
    };
  }
}

/// Information about required authentication parameters.
class AuthParameter {
  /// Contains default values for this authentication parameter that are supplied
  /// by the connector.
  final List<String>? connectorSuppliedValues;

  /// A description about the authentication parameter.
  final String? description;

  /// Indicates whether this authentication parameter is required.
  final bool? isRequired;

  /// Indicates whether this authentication parameter is a sensitive field.
  final bool? isSensitiveField;

  /// The authentication key required to authenticate with the connector.
  final String? key;

  /// Label used for authentication parameter.
  final String? label;

  AuthParameter({
    this.connectorSuppliedValues,
    this.description,
    this.isRequired,
    this.isSensitiveField,
    this.key,
    this.label,
  });

  factory AuthParameter.fromJson(Map<String, dynamic> json) {
    return AuthParameter(
      connectorSuppliedValues: (json['connectorSuppliedValues'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      description: json['description'] as String?,
      isRequired: json['isRequired'] as bool?,
      isSensitiveField: json['isSensitiveField'] as bool?,
      key: json['key'] as String?,
      label: json['label'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectorSuppliedValues = this.connectorSuppliedValues;
    final description = this.description;
    final isRequired = this.isRequired;
    final isSensitiveField = this.isSensitiveField;
    final key = this.key;
    final label = this.label;
    return {
      if (connectorSuppliedValues != null)
        'connectorSuppliedValues': connectorSuppliedValues,
      if (description != null) 'description': description,
      if (isRequired != null) 'isRequired': isRequired,
      if (isSensitiveField != null) 'isSensitiveField': isSensitiveField,
      if (key != null) 'key': key,
      if (label != null) 'label': label,
    };
  }
}

/// Contains information about the authentication config that the connector
/// supports.
class AuthenticationConfig {
  /// Contains information required for custom authentication.
  final List<CustomAuthConfig>? customAuthConfigs;

  /// Indicates whether API key authentication is supported by the connector
  final bool? isApiKeyAuthSupported;

  /// Indicates whether basic authentication is supported by the connector.
  final bool? isBasicAuthSupported;

  /// Indicates whether custom authentication is supported by the connector
  final bool? isCustomAuthSupported;

  /// Indicates whether OAuth 2.0 authentication is supported by the connector.
  final bool? isOAuth2Supported;

  /// Contains the default values required for OAuth 2.0 authentication.
  final OAuth2Defaults? oAuth2Defaults;

  AuthenticationConfig({
    this.customAuthConfigs,
    this.isApiKeyAuthSupported,
    this.isBasicAuthSupported,
    this.isCustomAuthSupported,
    this.isOAuth2Supported,
    this.oAuth2Defaults,
  });

  factory AuthenticationConfig.fromJson(Map<String, dynamic> json) {
    return AuthenticationConfig(
      customAuthConfigs: (json['customAuthConfigs'] as List?)
          ?.nonNulls
          .map((e) => CustomAuthConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      isApiKeyAuthSupported: json['isApiKeyAuthSupported'] as bool?,
      isBasicAuthSupported: json['isBasicAuthSupported'] as bool?,
      isCustomAuthSupported: json['isCustomAuthSupported'] as bool?,
      isOAuth2Supported: json['isOAuth2Supported'] as bool?,
      oAuth2Defaults: json['oAuth2Defaults'] != null
          ? OAuth2Defaults.fromJson(
              json['oAuth2Defaults'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final customAuthConfigs = this.customAuthConfigs;
    final isApiKeyAuthSupported = this.isApiKeyAuthSupported;
    final isBasicAuthSupported = this.isBasicAuthSupported;
    final isCustomAuthSupported = this.isCustomAuthSupported;
    final isOAuth2Supported = this.isOAuth2Supported;
    final oAuth2Defaults = this.oAuth2Defaults;
    return {
      if (customAuthConfigs != null) 'customAuthConfigs': customAuthConfigs,
      if (isApiKeyAuthSupported != null)
        'isApiKeyAuthSupported': isApiKeyAuthSupported,
      if (isBasicAuthSupported != null)
        'isBasicAuthSupported': isBasicAuthSupported,
      if (isCustomAuthSupported != null)
        'isCustomAuthSupported': isCustomAuthSupported,
      if (isOAuth2Supported != null) 'isOAuth2Supported': isOAuth2Supported,
      if (oAuth2Defaults != null) 'oAuth2Defaults': oAuth2Defaults,
    };
  }
}

enum AuthenticationType {
  oauth2('OAUTH2'),
  apikey('APIKEY'),
  basic('BASIC'),
  custom('CUSTOM'),
  ;

  final String value;

  const AuthenticationType(this.value);

  static AuthenticationType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum AuthenticationType'));
}

/// The basic auth credentials required for basic authentication.
class BasicAuthCredentials {
  /// The password to use to connect to a resource.
  final String password;

  /// The username to use to connect to a resource.
  final String username;

  BasicAuthCredentials({
    required this.password,
    required this.username,
  });

  Map<String, dynamic> toJson() {
    final password = this.password;
    final username = this.username;
    return {
      'password': password,
      'username': username,
    };
  }
}

class CancelFlowExecutionsResponse {
  /// The IDs of runs that Amazon AppFlow couldn't cancel. These runs might be
  /// ineligible for canceling because they haven't started yet or have already
  /// completed.
  final List<String>? invalidExecutions;

  CancelFlowExecutionsResponse({
    this.invalidExecutions,
  });

  factory CancelFlowExecutionsResponse.fromJson(Map<String, dynamic> json) {
    return CancelFlowExecutionsResponse(
      invalidExecutions: (json['invalidExecutions'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final invalidExecutions = this.invalidExecutions;
    return {
      if (invalidExecutions != null) 'invalidExecutions': invalidExecutions,
    };
  }
}

enum CatalogType {
  glue('GLUE'),
  ;

  final String value;

  const CatalogType(this.value);

  static CatalogType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum CatalogType'));
}

enum ConnectionMode {
  public('Public'),
  private('Private'),
  ;

  final String value;

  const ConnectionMode(this.value);

  static ConnectionMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ConnectionMode'));
}

/// The configuration settings related to a given connector.
class ConnectorConfiguration {
  /// The authentication config required for the connector.
  final AuthenticationConfig? authenticationConfig;

  /// Specifies whether the connector can be used as a destination.
  final bool? canUseAsDestination;

  /// Specifies whether the connector can be used as a source.
  final bool? canUseAsSource;

  /// The Amazon Resource Name (ARN) for the registered connector.
  final String? connectorArn;

  /// A description about the connector.
  final String? connectorDescription;

  /// The label used for registering the connector.
  final String? connectorLabel;

  /// Specifies connector-specific metadata such as <code>oAuthScopes</code>,
  /// <code>supportedRegions</code>, <code>privateLinkServiceUrl</code>, and so
  /// on.
  final ConnectorMetadata? connectorMetadata;

  /// The connection modes that the connector supports.
  final List<String>? connectorModes;

  /// The connector name.
  final String? connectorName;

  /// The owner who developed the connector.
  final String? connectorOwner;

  /// The configuration required for registering the connector.
  final ConnectorProvisioningConfig? connectorProvisioningConfig;

  /// The provisioning type used to register the connector.
  final ConnectorProvisioningType? connectorProvisioningType;

  /// The required connector runtime settings.
  final List<ConnectorRuntimeSetting>? connectorRuntimeSettings;

  /// The connector type.
  final ConnectorType? connectorType;

  /// The connector version.
  final String? connectorVersion;

  /// Specifies if PrivateLink is enabled for that connector.
  final bool? isPrivateLinkEnabled;

  /// Specifies if a PrivateLink endpoint URL is required.
  final bool? isPrivateLinkEndpointUrlRequired;

  /// Logo URL of the connector.
  final String? logoURL;

  /// The date on which the connector was registered.
  final DateTime? registeredAt;

  /// Information about who registered the connector.
  final String? registeredBy;

  /// A list of API versions that are supported by the connector.
  final List<String>? supportedApiVersions;

  /// The APIs of the connector application that Amazon AppFlow can use to
  /// transfer your data.
  final List<DataTransferApi>? supportedDataTransferApis;

  /// The data transfer types that the connector supports.
  /// <dl> <dt>RECORD</dt> <dd>
  /// Structured records.
  /// </dd> <dt>FILE</dt> <dd>
  /// Files or binary data.
  /// </dd> </dl>
  final List<SupportedDataTransferType>? supportedDataTransferTypes;

  /// Lists the connectors that are available for use as destinations.
  final List<ConnectorType>? supportedDestinationConnectors;

  /// A list of operators supported by the connector.
  final List<Operators>? supportedOperators;

  /// Specifies the supported flow frequency for that connector.
  final List<ScheduleFrequencyType>? supportedSchedulingFrequencies;

  /// Specifies the supported trigger types for the flow.
  final List<TriggerType>? supportedTriggerTypes;

  /// A list of write operations supported by the connector.
  final List<WriteOperationType>? supportedWriteOperations;

  ConnectorConfiguration({
    this.authenticationConfig,
    this.canUseAsDestination,
    this.canUseAsSource,
    this.connectorArn,
    this.connectorDescription,
    this.connectorLabel,
    this.connectorMetadata,
    this.connectorModes,
    this.connectorName,
    this.connectorOwner,
    this.connectorProvisioningConfig,
    this.connectorProvisioningType,
    this.connectorRuntimeSettings,
    this.connectorType,
    this.connectorVersion,
    this.isPrivateLinkEnabled,
    this.isPrivateLinkEndpointUrlRequired,
    this.logoURL,
    this.registeredAt,
    this.registeredBy,
    this.supportedApiVersions,
    this.supportedDataTransferApis,
    this.supportedDataTransferTypes,
    this.supportedDestinationConnectors,
    this.supportedOperators,
    this.supportedSchedulingFrequencies,
    this.supportedTriggerTypes,
    this.supportedWriteOperations,
  });

  factory ConnectorConfiguration.fromJson(Map<String, dynamic> json) {
    return ConnectorConfiguration(
      authenticationConfig: json['authenticationConfig'] != null
          ? AuthenticationConfig.fromJson(
              json['authenticationConfig'] as Map<String, dynamic>)
          : null,
      canUseAsDestination: json['canUseAsDestination'] as bool?,
      canUseAsSource: json['canUseAsSource'] as bool?,
      connectorArn: json['connectorArn'] as String?,
      connectorDescription: json['connectorDescription'] as String?,
      connectorLabel: json['connectorLabel'] as String?,
      connectorMetadata: json['connectorMetadata'] != null
          ? ConnectorMetadata.fromJson(
              json['connectorMetadata'] as Map<String, dynamic>)
          : null,
      connectorModes: (json['connectorModes'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      connectorName: json['connectorName'] as String?,
      connectorOwner: json['connectorOwner'] as String?,
      connectorProvisioningConfig: json['connectorProvisioningConfig'] != null
          ? ConnectorProvisioningConfig.fromJson(
              json['connectorProvisioningConfig'] as Map<String, dynamic>)
          : null,
      connectorProvisioningType: (json['connectorProvisioningType'] as String?)
          ?.let(ConnectorProvisioningType.fromString),
      connectorRuntimeSettings: (json['connectorRuntimeSettings'] as List?)
          ?.nonNulls
          .map((e) =>
              ConnectorRuntimeSetting.fromJson(e as Map<String, dynamic>))
          .toList(),
      connectorType:
          (json['connectorType'] as String?)?.let(ConnectorType.fromString),
      connectorVersion: json['connectorVersion'] as String?,
      isPrivateLinkEnabled: json['isPrivateLinkEnabled'] as bool?,
      isPrivateLinkEndpointUrlRequired:
          json['isPrivateLinkEndpointUrlRequired'] as bool?,
      logoURL: json['logoURL'] as String?,
      registeredAt: timeStampFromJson(json['registeredAt']),
      registeredBy: json['registeredBy'] as String?,
      supportedApiVersions: (json['supportedApiVersions'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      supportedDataTransferApis: (json['supportedDataTransferApis'] as List?)
          ?.nonNulls
          .map((e) => DataTransferApi.fromJson(e as Map<String, dynamic>))
          .toList(),
      supportedDataTransferTypes: (json['supportedDataTransferTypes'] as List?)
          ?.nonNulls
          .map((e) => SupportedDataTransferType.fromString((e as String)))
          .toList(),
      supportedDestinationConnectors:
          (json['supportedDestinationConnectors'] as List?)
              ?.nonNulls
              .map((e) => ConnectorType.fromString((e as String)))
              .toList(),
      supportedOperators: (json['supportedOperators'] as List?)
          ?.nonNulls
          .map((e) => Operators.fromString((e as String)))
          .toList(),
      supportedSchedulingFrequencies:
          (json['supportedSchedulingFrequencies'] as List?)
              ?.nonNulls
              .map((e) => ScheduleFrequencyType.fromString((e as String)))
              .toList(),
      supportedTriggerTypes: (json['supportedTriggerTypes'] as List?)
          ?.nonNulls
          .map((e) => TriggerType.fromString((e as String)))
          .toList(),
      supportedWriteOperations: (json['supportedWriteOperations'] as List?)
          ?.nonNulls
          .map((e) => WriteOperationType.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final authenticationConfig = this.authenticationConfig;
    final canUseAsDestination = this.canUseAsDestination;
    final canUseAsSource = this.canUseAsSource;
    final connectorArn = this.connectorArn;
    final connectorDescription = this.connectorDescription;
    final connectorLabel = this.connectorLabel;
    final connectorMetadata = this.connectorMetadata;
    final connectorModes = this.connectorModes;
    final connectorName = this.connectorName;
    final connectorOwner = this.connectorOwner;
    final connectorProvisioningConfig = this.connectorProvisioningConfig;
    final connectorProvisioningType = this.connectorProvisioningType;
    final connectorRuntimeSettings = this.connectorRuntimeSettings;
    final connectorType = this.connectorType;
    final connectorVersion = this.connectorVersion;
    final isPrivateLinkEnabled = this.isPrivateLinkEnabled;
    final isPrivateLinkEndpointUrlRequired =
        this.isPrivateLinkEndpointUrlRequired;
    final logoURL = this.logoURL;
    final registeredAt = this.registeredAt;
    final registeredBy = this.registeredBy;
    final supportedApiVersions = this.supportedApiVersions;
    final supportedDataTransferApis = this.supportedDataTransferApis;
    final supportedDataTransferTypes = this.supportedDataTransferTypes;
    final supportedDestinationConnectors = this.supportedDestinationConnectors;
    final supportedOperators = this.supportedOperators;
    final supportedSchedulingFrequencies = this.supportedSchedulingFrequencies;
    final supportedTriggerTypes = this.supportedTriggerTypes;
    final supportedWriteOperations = this.supportedWriteOperations;
    return {
      if (authenticationConfig != null)
        'authenticationConfig': authenticationConfig,
      if (canUseAsDestination != null)
        'canUseAsDestination': canUseAsDestination,
      if (canUseAsSource != null) 'canUseAsSource': canUseAsSource,
      if (connectorArn != null) 'connectorArn': connectorArn,
      if (connectorDescription != null)
        'connectorDescription': connectorDescription,
      if (connectorLabel != null) 'connectorLabel': connectorLabel,
      if (connectorMetadata != null) 'connectorMetadata': connectorMetadata,
      if (connectorModes != null) 'connectorModes': connectorModes,
      if (connectorName != null) 'connectorName': connectorName,
      if (connectorOwner != null) 'connectorOwner': connectorOwner,
      if (connectorProvisioningConfig != null)
        'connectorProvisioningConfig': connectorProvisioningConfig,
      if (connectorProvisioningType != null)
        'connectorProvisioningType': connectorProvisioningType.value,
      if (connectorRuntimeSettings != null)
        'connectorRuntimeSettings': connectorRuntimeSettings,
      if (connectorType != null) 'connectorType': connectorType.value,
      if (connectorVersion != null) 'connectorVersion': connectorVersion,
      if (isPrivateLinkEnabled != null)
        'isPrivateLinkEnabled': isPrivateLinkEnabled,
      if (isPrivateLinkEndpointUrlRequired != null)
        'isPrivateLinkEndpointUrlRequired': isPrivateLinkEndpointUrlRequired,
      if (logoURL != null) 'logoURL': logoURL,
      if (registeredAt != null)
        'registeredAt': unixTimestampToJson(registeredAt),
      if (registeredBy != null) 'registeredBy': registeredBy,
      if (supportedApiVersions != null)
        'supportedApiVersions': supportedApiVersions,
      if (supportedDataTransferApis != null)
        'supportedDataTransferApis': supportedDataTransferApis,
      if (supportedDataTransferTypes != null)
        'supportedDataTransferTypes':
            supportedDataTransferTypes.map((e) => e.value).toList(),
      if (supportedDestinationConnectors != null)
        'supportedDestinationConnectors':
            supportedDestinationConnectors.map((e) => e.value).toList(),
      if (supportedOperators != null)
        'supportedOperators': supportedOperators.map((e) => e.value).toList(),
      if (supportedSchedulingFrequencies != null)
        'supportedSchedulingFrequencies':
            supportedSchedulingFrequencies.map((e) => e.value).toList(),
      if (supportedTriggerTypes != null)
        'supportedTriggerTypes':
            supportedTriggerTypes.map((e) => e.value).toList(),
      if (supportedWriteOperations != null)
        'supportedWriteOperations':
            supportedWriteOperations.map((e) => e.value).toList(),
    };
  }
}

/// Information about the registered connector.
class ConnectorDetail {
  /// The application type of the connector.
  final String? applicationType;

  /// A description about the registered connector.
  final String? connectorDescription;

  /// A label used for the connector.
  final String? connectorLabel;

  /// The connection mode that the connector supports.
  final List<String>? connectorModes;

  /// The name of the connector.
  final String? connectorName;

  /// The owner of the connector.
  final String? connectorOwner;

  /// The provisioning type that the connector uses.
  final ConnectorProvisioningType? connectorProvisioningType;

  /// The connector type.
  final ConnectorType? connectorType;

  /// The connector version.
  final String? connectorVersion;

  /// The time at which the connector was registered.
  final DateTime? registeredAt;

  /// The user who registered the connector.
  final String? registeredBy;

  /// The data transfer types that the connector supports.
  /// <dl> <dt>RECORD</dt> <dd>
  /// Structured records.
  /// </dd> <dt>FILE</dt> <dd>
  /// Files or binary data.
  /// </dd> </dl>
  final List<SupportedDataTransferType>? supportedDataTransferTypes;

  ConnectorDetail({
    this.applicationType,
    this.connectorDescription,
    this.connectorLabel,
    this.connectorModes,
    this.connectorName,
    this.connectorOwner,
    this.connectorProvisioningType,
    this.connectorType,
    this.connectorVersion,
    this.registeredAt,
    this.registeredBy,
    this.supportedDataTransferTypes,
  });

  factory ConnectorDetail.fromJson(Map<String, dynamic> json) {
    return ConnectorDetail(
      applicationType: json['applicationType'] as String?,
      connectorDescription: json['connectorDescription'] as String?,
      connectorLabel: json['connectorLabel'] as String?,
      connectorModes: (json['connectorModes'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      connectorName: json['connectorName'] as String?,
      connectorOwner: json['connectorOwner'] as String?,
      connectorProvisioningType: (json['connectorProvisioningType'] as String?)
          ?.let(ConnectorProvisioningType.fromString),
      connectorType:
          (json['connectorType'] as String?)?.let(ConnectorType.fromString),
      connectorVersion: json['connectorVersion'] as String?,
      registeredAt: timeStampFromJson(json['registeredAt']),
      registeredBy: json['registeredBy'] as String?,
      supportedDataTransferTypes: (json['supportedDataTransferTypes'] as List?)
          ?.nonNulls
          .map((e) => SupportedDataTransferType.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationType = this.applicationType;
    final connectorDescription = this.connectorDescription;
    final connectorLabel = this.connectorLabel;
    final connectorModes = this.connectorModes;
    final connectorName = this.connectorName;
    final connectorOwner = this.connectorOwner;
    final connectorProvisioningType = this.connectorProvisioningType;
    final connectorType = this.connectorType;
    final connectorVersion = this.connectorVersion;
    final registeredAt = this.registeredAt;
    final registeredBy = this.registeredBy;
    final supportedDataTransferTypes = this.supportedDataTransferTypes;
    return {
      if (applicationType != null) 'applicationType': applicationType,
      if (connectorDescription != null)
        'connectorDescription': connectorDescription,
      if (connectorLabel != null) 'connectorLabel': connectorLabel,
      if (connectorModes != null) 'connectorModes': connectorModes,
      if (connectorName != null) 'connectorName': connectorName,
      if (connectorOwner != null) 'connectorOwner': connectorOwner,
      if (connectorProvisioningType != null)
        'connectorProvisioningType': connectorProvisioningType.value,
      if (connectorType != null) 'connectorType': connectorType.value,
      if (connectorVersion != null) 'connectorVersion': connectorVersion,
      if (registeredAt != null)
        'registeredAt': unixTimestampToJson(registeredAt),
      if (registeredBy != null) 'registeredBy': registeredBy,
      if (supportedDataTransferTypes != null)
        'supportedDataTransferTypes':
            supportedDataTransferTypes.map((e) => e.value).toList(),
    };
  }
}

/// The high-level entity that can be queried in Amazon AppFlow. For example, a
/// Salesforce entity might be an <i>Account</i> or <i>Opportunity</i>, whereas
/// a ServiceNow entity might be an <i>Incident</i>.
class ConnectorEntity {
  /// The name of the connector entity.
  final String name;

  /// Specifies whether the connector entity is a parent or a category and has
  /// more entities nested underneath it. If another call is made with
  /// <code>entitiesPath =
  /// "the_current_entity_name_with_hasNestedEntities_true"</code>, then it
  /// returns the nested entities underneath it. This provides a way to retrieve
  /// all supported entities in a recursive fashion.
  final bool? hasNestedEntities;

  /// The label applied to the connector entity.
  final String? label;

  ConnectorEntity({
    required this.name,
    this.hasNestedEntities,
    this.label,
  });

  factory ConnectorEntity.fromJson(Map<String, dynamic> json) {
    return ConnectorEntity(
      name: json['name'] as String,
      hasNestedEntities: json['hasNestedEntities'] as bool?,
      label: json['label'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final hasNestedEntities = this.hasNestedEntities;
    final label = this.label;
    return {
      'name': name,
      if (hasNestedEntities != null) 'hasNestedEntities': hasNestedEntities,
      if (label != null) 'label': label,
    };
  }
}

/// Describes the data model of a connector field. For example, for an
/// <i>account</i> entity, the fields would be <i>account name</i>, <i>account
/// ID</i>, and so on.
class ConnectorEntityField {
  /// The unique identifier of the connector field.
  final String identifier;

  /// A map that has specific properties related to the ConnectorEntityField.
  final Map<String, String>? customProperties;

  /// Default value that can be assigned to this field.
  final String? defaultValue;

  /// A description of the connector entity field.
  final String? description;

  /// The properties applied to a field when the connector is being used as a
  /// destination.
  final DestinationFieldProperties? destinationProperties;

  /// Booelan value that indicates whether this field is deprecated or not.
  final bool? isDeprecated;

  /// Booelan value that indicates whether this field can be used as a primary
  /// key.
  final bool? isPrimaryKey;

  /// The label applied to a connector entity field.
  final String? label;

  /// The parent identifier of the connector field.
  final String? parentIdentifier;

  /// The properties that can be applied to a field when the connector is being
  /// used as a source.
  final SourceFieldProperties? sourceProperties;

  /// Contains details regarding the supported <code>FieldType</code>, including
  /// the corresponding <code>filterOperators</code> and
  /// <code>supportedValues</code>.
  final SupportedFieldTypeDetails? supportedFieldTypeDetails;

  ConnectorEntityField({
    required this.identifier,
    this.customProperties,
    this.defaultValue,
    this.description,
    this.destinationProperties,
    this.isDeprecated,
    this.isPrimaryKey,
    this.label,
    this.parentIdentifier,
    this.sourceProperties,
    this.supportedFieldTypeDetails,
  });

  factory ConnectorEntityField.fromJson(Map<String, dynamic> json) {
    return ConnectorEntityField(
      identifier: json['identifier'] as String,
      customProperties: (json['customProperties'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      defaultValue: json['defaultValue'] as String?,
      description: json['description'] as String?,
      destinationProperties: json['destinationProperties'] != null
          ? DestinationFieldProperties.fromJson(
              json['destinationProperties'] as Map<String, dynamic>)
          : null,
      isDeprecated: json['isDeprecated'] as bool?,
      isPrimaryKey: json['isPrimaryKey'] as bool?,
      label: json['label'] as String?,
      parentIdentifier: json['parentIdentifier'] as String?,
      sourceProperties: json['sourceProperties'] != null
          ? SourceFieldProperties.fromJson(
              json['sourceProperties'] as Map<String, dynamic>)
          : null,
      supportedFieldTypeDetails: json['supportedFieldTypeDetails'] != null
          ? SupportedFieldTypeDetails.fromJson(
              json['supportedFieldTypeDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final identifier = this.identifier;
    final customProperties = this.customProperties;
    final defaultValue = this.defaultValue;
    final description = this.description;
    final destinationProperties = this.destinationProperties;
    final isDeprecated = this.isDeprecated;
    final isPrimaryKey = this.isPrimaryKey;
    final label = this.label;
    final parentIdentifier = this.parentIdentifier;
    final sourceProperties = this.sourceProperties;
    final supportedFieldTypeDetails = this.supportedFieldTypeDetails;
    return {
      'identifier': identifier,
      if (customProperties != null) 'customProperties': customProperties,
      if (defaultValue != null) 'defaultValue': defaultValue,
      if (description != null) 'description': description,
      if (destinationProperties != null)
        'destinationProperties': destinationProperties,
      if (isDeprecated != null) 'isDeprecated': isDeprecated,
      if (isPrimaryKey != null) 'isPrimaryKey': isPrimaryKey,
      if (label != null) 'label': label,
      if (parentIdentifier != null) 'parentIdentifier': parentIdentifier,
      if (sourceProperties != null) 'sourceProperties': sourceProperties,
      if (supportedFieldTypeDetails != null)
        'supportedFieldTypeDetails': supportedFieldTypeDetails,
    };
  }
}

/// A structure to specify connector-specific metadata such as
/// <code>oAuthScopes</code>, <code>supportedRegions</code>,
/// <code>privateLinkServiceUrl</code>, and so on.
class ConnectorMetadata {
  /// The connector metadata specific to Amplitude.
  final AmplitudeMetadata? amplitude;

  /// The connector metadata specific to Amazon Connect Customer Profiles.
  final CustomerProfilesMetadata? customerProfiles;

  /// The connector metadata specific to Datadog.
  final DatadogMetadata? datadog;

  /// The connector metadata specific to Dynatrace.
  final DynatraceMetadata? dynatrace;

  /// The connector metadata specific to Amazon EventBridge.
  final EventBridgeMetadata? eventBridge;

  /// The connector metadata specific to Google Analytics.
  final GoogleAnalyticsMetadata? googleAnalytics;

  /// The connector metadata specific to Amazon Honeycode.
  final HoneycodeMetadata? honeycode;

  /// The connector metadata specific to Infor Nexus.
  final InforNexusMetadata? inforNexus;

  /// The connector metadata specific to Marketo.
  final MarketoMetadata? marketo;

  /// The connector metadata specific to Salesforce Pardot.
  final PardotMetadata? pardot;

  /// The connector metadata specific to Amazon Redshift.
  final RedshiftMetadata? redshift;

  /// The connector metadata specific to Amazon S3.
  final S3Metadata? s3;
  final SAPODataMetadata? sAPOData;

  /// The connector metadata specific to Salesforce.
  final SalesforceMetadata? salesforce;

  /// The connector metadata specific to ServiceNow.
  final ServiceNowMetadata? serviceNow;

  /// The connector metadata specific to Singular.
  final SingularMetadata? singular;

  /// The connector metadata specific to Slack.
  final SlackMetadata? slack;

  /// The connector metadata specific to Snowflake.
  final SnowflakeMetadata? snowflake;

  /// The connector metadata specific to Trend Micro.
  final TrendmicroMetadata? trendmicro;

  /// The connector metadata specific to Upsolver.
  final UpsolverMetadata? upsolver;

  /// The connector metadata specific to Veeva.
  final VeevaMetadata? veeva;

  /// The connector metadata specific to Zendesk.
  final ZendeskMetadata? zendesk;

  ConnectorMetadata({
    this.amplitude,
    this.customerProfiles,
    this.datadog,
    this.dynatrace,
    this.eventBridge,
    this.googleAnalytics,
    this.honeycode,
    this.inforNexus,
    this.marketo,
    this.pardot,
    this.redshift,
    this.s3,
    this.sAPOData,
    this.salesforce,
    this.serviceNow,
    this.singular,
    this.slack,
    this.snowflake,
    this.trendmicro,
    this.upsolver,
    this.veeva,
    this.zendesk,
  });

  factory ConnectorMetadata.fromJson(Map<String, dynamic> json) {
    return ConnectorMetadata(
      amplitude: json['Amplitude'] != null
          ? AmplitudeMetadata.fromJson(
              json['Amplitude'] as Map<String, dynamic>)
          : null,
      customerProfiles: json['CustomerProfiles'] != null
          ? CustomerProfilesMetadata.fromJson(
              json['CustomerProfiles'] as Map<String, dynamic>)
          : null,
      datadog: json['Datadog'] != null
          ? DatadogMetadata.fromJson(json['Datadog'] as Map<String, dynamic>)
          : null,
      dynatrace: json['Dynatrace'] != null
          ? DynatraceMetadata.fromJson(
              json['Dynatrace'] as Map<String, dynamic>)
          : null,
      eventBridge: json['EventBridge'] != null
          ? EventBridgeMetadata.fromJson(
              json['EventBridge'] as Map<String, dynamic>)
          : null,
      googleAnalytics: json['GoogleAnalytics'] != null
          ? GoogleAnalyticsMetadata.fromJson(
              json['GoogleAnalytics'] as Map<String, dynamic>)
          : null,
      honeycode: json['Honeycode'] != null
          ? HoneycodeMetadata.fromJson(
              json['Honeycode'] as Map<String, dynamic>)
          : null,
      inforNexus: json['InforNexus'] != null
          ? InforNexusMetadata.fromJson(
              json['InforNexus'] as Map<String, dynamic>)
          : null,
      marketo: json['Marketo'] != null
          ? MarketoMetadata.fromJson(json['Marketo'] as Map<String, dynamic>)
          : null,
      pardot: json['Pardot'] != null
          ? PardotMetadata.fromJson(json['Pardot'] as Map<String, dynamic>)
          : null,
      redshift: json['Redshift'] != null
          ? RedshiftMetadata.fromJson(json['Redshift'] as Map<String, dynamic>)
          : null,
      s3: json['S3'] != null
          ? S3Metadata.fromJson(json['S3'] as Map<String, dynamic>)
          : null,
      sAPOData: json['SAPOData'] != null
          ? SAPODataMetadata.fromJson(json['SAPOData'] as Map<String, dynamic>)
          : null,
      salesforce: json['Salesforce'] != null
          ? SalesforceMetadata.fromJson(
              json['Salesforce'] as Map<String, dynamic>)
          : null,
      serviceNow: json['ServiceNow'] != null
          ? ServiceNowMetadata.fromJson(
              json['ServiceNow'] as Map<String, dynamic>)
          : null,
      singular: json['Singular'] != null
          ? SingularMetadata.fromJson(json['Singular'] as Map<String, dynamic>)
          : null,
      slack: json['Slack'] != null
          ? SlackMetadata.fromJson(json['Slack'] as Map<String, dynamic>)
          : null,
      snowflake: json['Snowflake'] != null
          ? SnowflakeMetadata.fromJson(
              json['Snowflake'] as Map<String, dynamic>)
          : null,
      trendmicro: json['Trendmicro'] != null
          ? TrendmicroMetadata.fromJson(
              json['Trendmicro'] as Map<String, dynamic>)
          : null,
      upsolver: json['Upsolver'] != null
          ? UpsolverMetadata.fromJson(json['Upsolver'] as Map<String, dynamic>)
          : null,
      veeva: json['Veeva'] != null
          ? VeevaMetadata.fromJson(json['Veeva'] as Map<String, dynamic>)
          : null,
      zendesk: json['Zendesk'] != null
          ? ZendeskMetadata.fromJson(json['Zendesk'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final amplitude = this.amplitude;
    final customerProfiles = this.customerProfiles;
    final datadog = this.datadog;
    final dynatrace = this.dynatrace;
    final eventBridge = this.eventBridge;
    final googleAnalytics = this.googleAnalytics;
    final honeycode = this.honeycode;
    final inforNexus = this.inforNexus;
    final marketo = this.marketo;
    final pardot = this.pardot;
    final redshift = this.redshift;
    final s3 = this.s3;
    final sAPOData = this.sAPOData;
    final salesforce = this.salesforce;
    final serviceNow = this.serviceNow;
    final singular = this.singular;
    final slack = this.slack;
    final snowflake = this.snowflake;
    final trendmicro = this.trendmicro;
    final upsolver = this.upsolver;
    final veeva = this.veeva;
    final zendesk = this.zendesk;
    return {
      if (amplitude != null) 'Amplitude': amplitude,
      if (customerProfiles != null) 'CustomerProfiles': customerProfiles,
      if (datadog != null) 'Datadog': datadog,
      if (dynatrace != null) 'Dynatrace': dynatrace,
      if (eventBridge != null) 'EventBridge': eventBridge,
      if (googleAnalytics != null) 'GoogleAnalytics': googleAnalytics,
      if (honeycode != null) 'Honeycode': honeycode,
      if (inforNexus != null) 'InforNexus': inforNexus,
      if (marketo != null) 'Marketo': marketo,
      if (pardot != null) 'Pardot': pardot,
      if (redshift != null) 'Redshift': redshift,
      if (s3 != null) 'S3': s3,
      if (sAPOData != null) 'SAPOData': sAPOData,
      if (salesforce != null) 'Salesforce': salesforce,
      if (serviceNow != null) 'ServiceNow': serviceNow,
      if (singular != null) 'Singular': singular,
      if (slack != null) 'Slack': slack,
      if (snowflake != null) 'Snowflake': snowflake,
      if (trendmicro != null) 'Trendmicro': trendmicro,
      if (upsolver != null) 'Upsolver': upsolver,
      if (veeva != null) 'Veeva': veeva,
      if (zendesk != null) 'Zendesk': zendesk,
    };
  }
}

/// Used by select connectors for which the OAuth workflow is supported, such as
/// Salesforce, Google Analytics, Marketo, Zendesk, and Slack.
class ConnectorOAuthRequest {
  /// The code provided by the connector when it has been authenticated via the
  /// connected app.
  final String? authCode;

  /// The URL to which the authentication server redirects the browser after
  /// authorization has been granted.
  final String? redirectUri;

  ConnectorOAuthRequest({
    this.authCode,
    this.redirectUri,
  });

  Map<String, dynamic> toJson() {
    final authCode = this.authCode;
    final redirectUri = this.redirectUri;
    return {
      if (authCode != null) 'authCode': authCode,
      if (redirectUri != null) 'redirectUri': redirectUri,
    };
  }
}

/// The operation to be performed on the provided source fields.
class ConnectorOperator {
  /// The operation to be performed on the provided Amplitude source fields.
  final AmplitudeConnectorOperator? amplitude;

  /// Operators supported by the custom connector.
  final Operator? customConnector;

  /// The operation to be performed on the provided Datadog source fields.
  final DatadogConnectorOperator? datadog;

  /// The operation to be performed on the provided Dynatrace source fields.
  final DynatraceConnectorOperator? dynatrace;

  /// The operation to be performed on the provided Google Analytics source
  /// fields.
  final GoogleAnalyticsConnectorOperator? googleAnalytics;

  /// The operation to be performed on the provided Infor Nexus source fields.
  final InforNexusConnectorOperator? inforNexus;

  /// The operation to be performed on the provided Marketo source fields.
  final MarketoConnectorOperator? marketo;

  /// The operation to be performed on the provided Salesforce Pardot source
  /// fields.
  final PardotConnectorOperator? pardot;

  /// The operation to be performed on the provided Amazon S3 source fields.
  final S3ConnectorOperator? s3;

  /// The operation to be performed on the provided SAPOData source fields.
  final SAPODataConnectorOperator? sAPOData;

  /// The operation to be performed on the provided Salesforce source fields.
  final SalesforceConnectorOperator? salesforce;

  /// The operation to be performed on the provided ServiceNow source fields.
  final ServiceNowConnectorOperator? serviceNow;

  /// The operation to be performed on the provided Singular source fields.
  final SingularConnectorOperator? singular;

  /// The operation to be performed on the provided Slack source fields.
  final SlackConnectorOperator? slack;

  /// The operation to be performed on the provided Trend Micro source fields.
  final TrendmicroConnectorOperator? trendmicro;

  /// The operation to be performed on the provided Veeva source fields.
  final VeevaConnectorOperator? veeva;

  /// The operation to be performed on the provided Zendesk source fields.
  final ZendeskConnectorOperator? zendesk;

  ConnectorOperator({
    this.amplitude,
    this.customConnector,
    this.datadog,
    this.dynatrace,
    this.googleAnalytics,
    this.inforNexus,
    this.marketo,
    this.pardot,
    this.s3,
    this.sAPOData,
    this.salesforce,
    this.serviceNow,
    this.singular,
    this.slack,
    this.trendmicro,
    this.veeva,
    this.zendesk,
  });

  factory ConnectorOperator.fromJson(Map<String, dynamic> json) {
    return ConnectorOperator(
      amplitude: (json['Amplitude'] as String?)
          ?.let(AmplitudeConnectorOperator.fromString),
      customConnector:
          (json['CustomConnector'] as String?)?.let(Operator.fromString),
      datadog: (json['Datadog'] as String?)
          ?.let(DatadogConnectorOperator.fromString),
      dynatrace: (json['Dynatrace'] as String?)
          ?.let(DynatraceConnectorOperator.fromString),
      googleAnalytics: (json['GoogleAnalytics'] as String?)
          ?.let(GoogleAnalyticsConnectorOperator.fromString),
      inforNexus: (json['InforNexus'] as String?)
          ?.let(InforNexusConnectorOperator.fromString),
      marketo: (json['Marketo'] as String?)
          ?.let(MarketoConnectorOperator.fromString),
      pardot:
          (json['Pardot'] as String?)?.let(PardotConnectorOperator.fromString),
      s3: (json['S3'] as String?)?.let(S3ConnectorOperator.fromString),
      sAPOData: (json['SAPOData'] as String?)
          ?.let(SAPODataConnectorOperator.fromString),
      salesforce: (json['Salesforce'] as String?)
          ?.let(SalesforceConnectorOperator.fromString),
      serviceNow: (json['ServiceNow'] as String?)
          ?.let(ServiceNowConnectorOperator.fromString),
      singular: (json['Singular'] as String?)
          ?.let(SingularConnectorOperator.fromString),
      slack: (json['Slack'] as String?)?.let(SlackConnectorOperator.fromString),
      trendmicro: (json['Trendmicro'] as String?)
          ?.let(TrendmicroConnectorOperator.fromString),
      veeva: (json['Veeva'] as String?)?.let(VeevaConnectorOperator.fromString),
      zendesk: (json['Zendesk'] as String?)
          ?.let(ZendeskConnectorOperator.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final amplitude = this.amplitude;
    final customConnector = this.customConnector;
    final datadog = this.datadog;
    final dynatrace = this.dynatrace;
    final googleAnalytics = this.googleAnalytics;
    final inforNexus = this.inforNexus;
    final marketo = this.marketo;
    final pardot = this.pardot;
    final s3 = this.s3;
    final sAPOData = this.sAPOData;
    final salesforce = this.salesforce;
    final serviceNow = this.serviceNow;
    final singular = this.singular;
    final slack = this.slack;
    final trendmicro = this.trendmicro;
    final veeva = this.veeva;
    final zendesk = this.zendesk;
    return {
      if (amplitude != null) 'Amplitude': amplitude.value,
      if (customConnector != null) 'CustomConnector': customConnector.value,
      if (datadog != null) 'Datadog': datadog.value,
      if (dynatrace != null) 'Dynatrace': dynatrace.value,
      if (googleAnalytics != null) 'GoogleAnalytics': googleAnalytics.value,
      if (inforNexus != null) 'InforNexus': inforNexus.value,
      if (marketo != null) 'Marketo': marketo.value,
      if (pardot != null) 'Pardot': pardot.value,
      if (s3 != null) 'S3': s3.value,
      if (sAPOData != null) 'SAPOData': sAPOData.value,
      if (salesforce != null) 'Salesforce': salesforce.value,
      if (serviceNow != null) 'ServiceNow': serviceNow.value,
      if (singular != null) 'Singular': singular.value,
      if (slack != null) 'Slack': slack.value,
      if (trendmicro != null) 'Trendmicro': trendmicro.value,
      if (veeva != null) 'Veeva': veeva.value,
      if (zendesk != null) 'Zendesk': zendesk.value,
    };
  }
}

/// Describes an instance of a connector. This includes the provided name,
/// credentials ARN, connection-mode, and so on. To keep the API intuitive and
/// extensible, the fields that are common to all types of connector profiles
/// are explicitly specified at the top level. The rest of the
/// connector-specific properties are available via the
/// <code>connectorProfileProperties</code> field.
class ConnectorProfile {
  /// Indicates the connection mode and if it is public or private.
  final ConnectionMode? connectionMode;

  /// The label for the connector profile being created.
  final String? connectorLabel;

  /// The Amazon Resource Name (ARN) of the connector profile.
  final String? connectorProfileArn;

  /// The name of the connector profile. The name is unique for each
  /// <code>ConnectorProfile</code> in the Amazon Web Services account.
  final String? connectorProfileName;

  /// The connector-specific properties of the profile configuration.
  final ConnectorProfileProperties? connectorProfileProperties;

  /// The type of connector, such as Salesforce, Amplitude, and so on.
  final ConnectorType? connectorType;

  /// Specifies when the connector profile was created.
  final DateTime? createdAt;

  /// The Amazon Resource Name (ARN) of the connector profile credentials.
  final String? credentialsArn;

  /// Specifies when the connector profile was last updated.
  final DateTime? lastUpdatedAt;

  /// Specifies the private connection provisioning state.
  final PrivateConnectionProvisioningState? privateConnectionProvisioningState;

  ConnectorProfile({
    this.connectionMode,
    this.connectorLabel,
    this.connectorProfileArn,
    this.connectorProfileName,
    this.connectorProfileProperties,
    this.connectorType,
    this.createdAt,
    this.credentialsArn,
    this.lastUpdatedAt,
    this.privateConnectionProvisioningState,
  });

  factory ConnectorProfile.fromJson(Map<String, dynamic> json) {
    return ConnectorProfile(
      connectionMode:
          (json['connectionMode'] as String?)?.let(ConnectionMode.fromString),
      connectorLabel: json['connectorLabel'] as String?,
      connectorProfileArn: json['connectorProfileArn'] as String?,
      connectorProfileName: json['connectorProfileName'] as String?,
      connectorProfileProperties: json['connectorProfileProperties'] != null
          ? ConnectorProfileProperties.fromJson(
              json['connectorProfileProperties'] as Map<String, dynamic>)
          : null,
      connectorType:
          (json['connectorType'] as String?)?.let(ConnectorType.fromString),
      createdAt: timeStampFromJson(json['createdAt']),
      credentialsArn: json['credentialsArn'] as String?,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      privateConnectionProvisioningState:
          json['privateConnectionProvisioningState'] != null
              ? PrivateConnectionProvisioningState.fromJson(
                  json['privateConnectionProvisioningState']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final connectionMode = this.connectionMode;
    final connectorLabel = this.connectorLabel;
    final connectorProfileArn = this.connectorProfileArn;
    final connectorProfileName = this.connectorProfileName;
    final connectorProfileProperties = this.connectorProfileProperties;
    final connectorType = this.connectorType;
    final createdAt = this.createdAt;
    final credentialsArn = this.credentialsArn;
    final lastUpdatedAt = this.lastUpdatedAt;
    final privateConnectionProvisioningState =
        this.privateConnectionProvisioningState;
    return {
      if (connectionMode != null) 'connectionMode': connectionMode.value,
      if (connectorLabel != null) 'connectorLabel': connectorLabel,
      if (connectorProfileArn != null)
        'connectorProfileArn': connectorProfileArn,
      if (connectorProfileName != null)
        'connectorProfileName': connectorProfileName,
      if (connectorProfileProperties != null)
        'connectorProfileProperties': connectorProfileProperties,
      if (connectorType != null) 'connectorType': connectorType.value,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (credentialsArn != null) 'credentialsArn': credentialsArn,
      if (lastUpdatedAt != null)
        'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (privateConnectionProvisioningState != null)
        'privateConnectionProvisioningState':
            privateConnectionProvisioningState,
    };
  }
}

/// Defines the connector-specific configuration and credentials for the
/// connector profile.
class ConnectorProfileConfig {
  /// The connector-specific properties of the profile configuration.
  final ConnectorProfileProperties connectorProfileProperties;

  /// The connector-specific credentials required by each connector.
  final ConnectorProfileCredentials? connectorProfileCredentials;

  ConnectorProfileConfig({
    required this.connectorProfileProperties,
    this.connectorProfileCredentials,
  });

  Map<String, dynamic> toJson() {
    final connectorProfileProperties = this.connectorProfileProperties;
    final connectorProfileCredentials = this.connectorProfileCredentials;
    return {
      'connectorProfileProperties': connectorProfileProperties,
      if (connectorProfileCredentials != null)
        'connectorProfileCredentials': connectorProfileCredentials,
    };
  }
}

/// The connector-specific credentials required by a connector.
class ConnectorProfileCredentials {
  /// The connector-specific credentials required when using Amplitude.
  final AmplitudeConnectorProfileCredentials? amplitude;
  final CustomConnectorProfileCredentials? customConnector;

  /// The connector-specific credentials required when using Datadog.
  final DatadogConnectorProfileCredentials? datadog;

  /// The connector-specific credentials required when using Dynatrace.
  final DynatraceConnectorProfileCredentials? dynatrace;

  /// The connector-specific credentials required when using Google Analytics.
  final GoogleAnalyticsConnectorProfileCredentials? googleAnalytics;

  /// The connector-specific credentials required when using Amazon Honeycode.
  final HoneycodeConnectorProfileCredentials? honeycode;

  /// The connector-specific credentials required when using Infor Nexus.
  final InforNexusConnectorProfileCredentials? inforNexus;

  /// The connector-specific credentials required when using Marketo.
  final MarketoConnectorProfileCredentials? marketo;

  /// The connector-specific credentials required when using Salesforce Pardot.
  final PardotConnectorProfileCredentials? pardot;

  /// The connector-specific credentials required when using Amazon Redshift.
  final RedshiftConnectorProfileCredentials? redshift;
  final SAPODataConnectorProfileCredentials? sAPOData;

  /// The connector-specific credentials required when using Salesforce.
  final SalesforceConnectorProfileCredentials? salesforce;

  /// The connector-specific credentials required when using ServiceNow.
  final ServiceNowConnectorProfileCredentials? serviceNow;

  /// The connector-specific credentials required when using Singular.
  final SingularConnectorProfileCredentials? singular;

  /// The connector-specific credentials required when using Slack.
  final SlackConnectorProfileCredentials? slack;

  /// The connector-specific credentials required when using Snowflake.
  final SnowflakeConnectorProfileCredentials? snowflake;

  /// The connector-specific credentials required when using Trend Micro.
  final TrendmicroConnectorProfileCredentials? trendmicro;

  /// The connector-specific credentials required when using Veeva.
  final VeevaConnectorProfileCredentials? veeva;

  /// The connector-specific credentials required when using Zendesk.
  final ZendeskConnectorProfileCredentials? zendesk;

  ConnectorProfileCredentials({
    this.amplitude,
    this.customConnector,
    this.datadog,
    this.dynatrace,
    this.googleAnalytics,
    this.honeycode,
    this.inforNexus,
    this.marketo,
    this.pardot,
    this.redshift,
    this.sAPOData,
    this.salesforce,
    this.serviceNow,
    this.singular,
    this.slack,
    this.snowflake,
    this.trendmicro,
    this.veeva,
    this.zendesk,
  });

  Map<String, dynamic> toJson() {
    final amplitude = this.amplitude;
    final customConnector = this.customConnector;
    final datadog = this.datadog;
    final dynatrace = this.dynatrace;
    final googleAnalytics = this.googleAnalytics;
    final honeycode = this.honeycode;
    final inforNexus = this.inforNexus;
    final marketo = this.marketo;
    final pardot = this.pardot;
    final redshift = this.redshift;
    final sAPOData = this.sAPOData;
    final salesforce = this.salesforce;
    final serviceNow = this.serviceNow;
    final singular = this.singular;
    final slack = this.slack;
    final snowflake = this.snowflake;
    final trendmicro = this.trendmicro;
    final veeva = this.veeva;
    final zendesk = this.zendesk;
    return {
      if (amplitude != null) 'Amplitude': amplitude,
      if (customConnector != null) 'CustomConnector': customConnector,
      if (datadog != null) 'Datadog': datadog,
      if (dynatrace != null) 'Dynatrace': dynatrace,
      if (googleAnalytics != null) 'GoogleAnalytics': googleAnalytics,
      if (honeycode != null) 'Honeycode': honeycode,
      if (inforNexus != null) 'InforNexus': inforNexus,
      if (marketo != null) 'Marketo': marketo,
      if (pardot != null) 'Pardot': pardot,
      if (redshift != null) 'Redshift': redshift,
      if (sAPOData != null) 'SAPOData': sAPOData,
      if (salesforce != null) 'Salesforce': salesforce,
      if (serviceNow != null) 'ServiceNow': serviceNow,
      if (singular != null) 'Singular': singular,
      if (slack != null) 'Slack': slack,
      if (snowflake != null) 'Snowflake': snowflake,
      if (trendmicro != null) 'Trendmicro': trendmicro,
      if (veeva != null) 'Veeva': veeva,
      if (zendesk != null) 'Zendesk': zendesk,
    };
  }
}

/// The connector-specific profile properties required by each connector.
class ConnectorProfileProperties {
  /// The connector-specific properties required by Amplitude.
  final AmplitudeConnectorProfileProperties? amplitude;

  /// The properties required by the custom connector.
  final CustomConnectorProfileProperties? customConnector;

  /// The connector-specific properties required by Datadog.
  final DatadogConnectorProfileProperties? datadog;

  /// The connector-specific properties required by Dynatrace.
  final DynatraceConnectorProfileProperties? dynatrace;

  /// The connector-specific properties required Google Analytics.
  final GoogleAnalyticsConnectorProfileProperties? googleAnalytics;

  /// The connector-specific properties required by Amazon Honeycode.
  final HoneycodeConnectorProfileProperties? honeycode;

  /// The connector-specific properties required by Infor Nexus.
  final InforNexusConnectorProfileProperties? inforNexus;

  /// The connector-specific properties required by Marketo.
  final MarketoConnectorProfileProperties? marketo;

  /// The connector-specific properties required by Salesforce Pardot.
  final PardotConnectorProfileProperties? pardot;

  /// The connector-specific properties required by Amazon Redshift.
  final RedshiftConnectorProfileProperties? redshift;
  final SAPODataConnectorProfileProperties? sAPOData;

  /// The connector-specific properties required by Salesforce.
  final SalesforceConnectorProfileProperties? salesforce;

  /// The connector-specific properties required by serviceNow.
  final ServiceNowConnectorProfileProperties? serviceNow;

  /// The connector-specific properties required by Singular.
  final SingularConnectorProfileProperties? singular;

  /// The connector-specific properties required by Slack.
  final SlackConnectorProfileProperties? slack;

  /// The connector-specific properties required by Snowflake.
  final SnowflakeConnectorProfileProperties? snowflake;

  /// The connector-specific properties required by Trend Micro.
  final TrendmicroConnectorProfileProperties? trendmicro;

  /// The connector-specific properties required by Veeva.
  final VeevaConnectorProfileProperties? veeva;

  /// The connector-specific properties required by Zendesk.
  final ZendeskConnectorProfileProperties? zendesk;

  ConnectorProfileProperties({
    this.amplitude,
    this.customConnector,
    this.datadog,
    this.dynatrace,
    this.googleAnalytics,
    this.honeycode,
    this.inforNexus,
    this.marketo,
    this.pardot,
    this.redshift,
    this.sAPOData,
    this.salesforce,
    this.serviceNow,
    this.singular,
    this.slack,
    this.snowflake,
    this.trendmicro,
    this.veeva,
    this.zendesk,
  });

  factory ConnectorProfileProperties.fromJson(Map<String, dynamic> json) {
    return ConnectorProfileProperties(
      amplitude: json['Amplitude'] != null
          ? AmplitudeConnectorProfileProperties.fromJson(
              json['Amplitude'] as Map<String, dynamic>)
          : null,
      customConnector: json['CustomConnector'] != null
          ? CustomConnectorProfileProperties.fromJson(
              json['CustomConnector'] as Map<String, dynamic>)
          : null,
      datadog: json['Datadog'] != null
          ? DatadogConnectorProfileProperties.fromJson(
              json['Datadog'] as Map<String, dynamic>)
          : null,
      dynatrace: json['Dynatrace'] != null
          ? DynatraceConnectorProfileProperties.fromJson(
              json['Dynatrace'] as Map<String, dynamic>)
          : null,
      googleAnalytics: json['GoogleAnalytics'] != null
          ? GoogleAnalyticsConnectorProfileProperties.fromJson(
              json['GoogleAnalytics'] as Map<String, dynamic>)
          : null,
      honeycode: json['Honeycode'] != null
          ? HoneycodeConnectorProfileProperties.fromJson(
              json['Honeycode'] as Map<String, dynamic>)
          : null,
      inforNexus: json['InforNexus'] != null
          ? InforNexusConnectorProfileProperties.fromJson(
              json['InforNexus'] as Map<String, dynamic>)
          : null,
      marketo: json['Marketo'] != null
          ? MarketoConnectorProfileProperties.fromJson(
              json['Marketo'] as Map<String, dynamic>)
          : null,
      pardot: json['Pardot'] != null
          ? PardotConnectorProfileProperties.fromJson(
              json['Pardot'] as Map<String, dynamic>)
          : null,
      redshift: json['Redshift'] != null
          ? RedshiftConnectorProfileProperties.fromJson(
              json['Redshift'] as Map<String, dynamic>)
          : null,
      sAPOData: json['SAPOData'] != null
          ? SAPODataConnectorProfileProperties.fromJson(
              json['SAPOData'] as Map<String, dynamic>)
          : null,
      salesforce: json['Salesforce'] != null
          ? SalesforceConnectorProfileProperties.fromJson(
              json['Salesforce'] as Map<String, dynamic>)
          : null,
      serviceNow: json['ServiceNow'] != null
          ? ServiceNowConnectorProfileProperties.fromJson(
              json['ServiceNow'] as Map<String, dynamic>)
          : null,
      singular: json['Singular'] != null
          ? SingularConnectorProfileProperties.fromJson(
              json['Singular'] as Map<String, dynamic>)
          : null,
      slack: json['Slack'] != null
          ? SlackConnectorProfileProperties.fromJson(
              json['Slack'] as Map<String, dynamic>)
          : null,
      snowflake: json['Snowflake'] != null
          ? SnowflakeConnectorProfileProperties.fromJson(
              json['Snowflake'] as Map<String, dynamic>)
          : null,
      trendmicro: json['Trendmicro'] != null
          ? TrendmicroConnectorProfileProperties.fromJson(
              json['Trendmicro'] as Map<String, dynamic>)
          : null,
      veeva: json['Veeva'] != null
          ? VeevaConnectorProfileProperties.fromJson(
              json['Veeva'] as Map<String, dynamic>)
          : null,
      zendesk: json['Zendesk'] != null
          ? ZendeskConnectorProfileProperties.fromJson(
              json['Zendesk'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final amplitude = this.amplitude;
    final customConnector = this.customConnector;
    final datadog = this.datadog;
    final dynatrace = this.dynatrace;
    final googleAnalytics = this.googleAnalytics;
    final honeycode = this.honeycode;
    final inforNexus = this.inforNexus;
    final marketo = this.marketo;
    final pardot = this.pardot;
    final redshift = this.redshift;
    final sAPOData = this.sAPOData;
    final salesforce = this.salesforce;
    final serviceNow = this.serviceNow;
    final singular = this.singular;
    final slack = this.slack;
    final snowflake = this.snowflake;
    final trendmicro = this.trendmicro;
    final veeva = this.veeva;
    final zendesk = this.zendesk;
    return {
      if (amplitude != null) 'Amplitude': amplitude,
      if (customConnector != null) 'CustomConnector': customConnector,
      if (datadog != null) 'Datadog': datadog,
      if (dynatrace != null) 'Dynatrace': dynatrace,
      if (googleAnalytics != null) 'GoogleAnalytics': googleAnalytics,
      if (honeycode != null) 'Honeycode': honeycode,
      if (inforNexus != null) 'InforNexus': inforNexus,
      if (marketo != null) 'Marketo': marketo,
      if (pardot != null) 'Pardot': pardot,
      if (redshift != null) 'Redshift': redshift,
      if (sAPOData != null) 'SAPOData': sAPOData,
      if (salesforce != null) 'Salesforce': salesforce,
      if (serviceNow != null) 'ServiceNow': serviceNow,
      if (singular != null) 'Singular': singular,
      if (slack != null) 'Slack': slack,
      if (snowflake != null) 'Snowflake': snowflake,
      if (trendmicro != null) 'Trendmicro': trendmicro,
      if (veeva != null) 'Veeva': veeva,
      if (zendesk != null) 'Zendesk': zendesk,
    };
  }
}

/// Contains information about the configuration of the connector being
/// registered.
class ConnectorProvisioningConfig {
  /// Contains information about the configuration of the lambda which is being
  /// registered as the connector.
  final LambdaConnectorProvisioningConfig? lambda;

  ConnectorProvisioningConfig({
    this.lambda,
  });

  factory ConnectorProvisioningConfig.fromJson(Map<String, dynamic> json) {
    return ConnectorProvisioningConfig(
      lambda: json['lambda'] != null
          ? LambdaConnectorProvisioningConfig.fromJson(
              json['lambda'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final lambda = this.lambda;
    return {
      if (lambda != null) 'lambda': lambda,
    };
  }
}

/// The type of provisioning that the connector supports, such as Lambda.
enum ConnectorProvisioningType {
  lambda('LAMBDA'),
  ;

  final String value;

  const ConnectorProvisioningType(this.value);

  static ConnectorProvisioningType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum ConnectorProvisioningType'));
}

/// Contains information about the connector runtime settings that are required
/// for flow execution.
class ConnectorRuntimeSetting {
  /// Contains default values for the connector runtime setting that are supplied
  /// by the connector.
  final List<String>? connectorSuppliedValueOptions;

  /// Data type of the connector runtime setting.
  final String? dataType;

  /// A description about the connector runtime setting.
  final String? description;

  /// Indicates whether this connector runtime setting is required.
  final bool? isRequired;

  /// Contains value information about the connector runtime setting.
  final String? key;

  /// A label used for connector runtime setting.
  final String? label;

  /// Indicates the scope of the connector runtime setting.
  final String? scope;

  ConnectorRuntimeSetting({
    this.connectorSuppliedValueOptions,
    this.dataType,
    this.description,
    this.isRequired,
    this.key,
    this.label,
    this.scope,
  });

  factory ConnectorRuntimeSetting.fromJson(Map<String, dynamic> json) {
    return ConnectorRuntimeSetting(
      connectorSuppliedValueOptions:
          (json['connectorSuppliedValueOptions'] as List?)
              ?.nonNulls
              .map((e) => e as String)
              .toList(),
      dataType: json['dataType'] as String?,
      description: json['description'] as String?,
      isRequired: json['isRequired'] as bool?,
      key: json['key'] as String?,
      label: json['label'] as String?,
      scope: json['scope'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectorSuppliedValueOptions = this.connectorSuppliedValueOptions;
    final dataType = this.dataType;
    final description = this.description;
    final isRequired = this.isRequired;
    final key = this.key;
    final label = this.label;
    final scope = this.scope;
    return {
      if (connectorSuppliedValueOptions != null)
        'connectorSuppliedValueOptions': connectorSuppliedValueOptions,
      if (dataType != null) 'dataType': dataType,
      if (description != null) 'description': description,
      if (isRequired != null) 'isRequired': isRequired,
      if (key != null) 'key': key,
      if (label != null) 'label': label,
      if (scope != null) 'scope': scope,
    };
  }
}

enum ConnectorType {
  salesforce('Salesforce'),
  singular('Singular'),
  slack('Slack'),
  redshift('Redshift'),
  s3('S3'),
  marketo('Marketo'),
  googleanalytics('Googleanalytics'),
  zendesk('Zendesk'),
  servicenow('Servicenow'),
  datadog('Datadog'),
  trendmicro('Trendmicro'),
  snowflake('Snowflake'),
  dynatrace('Dynatrace'),
  infornexus('Infornexus'),
  amplitude('Amplitude'),
  veeva('Veeva'),
  eventBridge('EventBridge'),
  lookoutMetrics('LookoutMetrics'),
  upsolver('Upsolver'),
  honeycode('Honeycode'),
  customerProfiles('CustomerProfiles'),
  sAPOData('SAPOData'),
  customConnector('CustomConnector'),
  pardot('Pardot'),
  ;

  final String value;

  const ConnectorType(this.value);

  static ConnectorType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ConnectorType'));
}

class CreateConnectorProfileResponse {
  /// The Amazon Resource Name (ARN) of the connector profile.
  final String? connectorProfileArn;

  CreateConnectorProfileResponse({
    this.connectorProfileArn,
  });

  factory CreateConnectorProfileResponse.fromJson(Map<String, dynamic> json) {
    return CreateConnectorProfileResponse(
      connectorProfileArn: json['connectorProfileArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectorProfileArn = this.connectorProfileArn;
    return {
      if (connectorProfileArn != null)
        'connectorProfileArn': connectorProfileArn,
    };
  }
}

class CreateFlowResponse {
  /// The flow's Amazon Resource Name (ARN).
  final String? flowArn;

  /// Indicates the current status of the flow.
  final FlowStatus? flowStatus;

  CreateFlowResponse({
    this.flowArn,
    this.flowStatus,
  });

  factory CreateFlowResponse.fromJson(Map<String, dynamic> json) {
    return CreateFlowResponse(
      flowArn: json['flowArn'] as String?,
      flowStatus: (json['flowStatus'] as String?)?.let(FlowStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final flowArn = this.flowArn;
    final flowStatus = this.flowStatus;
    return {
      if (flowArn != null) 'flowArn': flowArn,
      if (flowStatus != null) 'flowStatus': flowStatus.value,
    };
  }
}

/// Configuration information required for custom authentication.
class CustomAuthConfig {
  /// Information about authentication parameters required for authentication.
  final List<AuthParameter>? authParameters;

  /// The authentication type that the custom connector uses.
  final String? customAuthenticationType;

  CustomAuthConfig({
    this.authParameters,
    this.customAuthenticationType,
  });

  factory CustomAuthConfig.fromJson(Map<String, dynamic> json) {
    return CustomAuthConfig(
      authParameters: (json['authParameters'] as List?)
          ?.nonNulls
          .map((e) => AuthParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
      customAuthenticationType: json['customAuthenticationType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final authParameters = this.authParameters;
    final customAuthenticationType = this.customAuthenticationType;
    return {
      if (authParameters != null) 'authParameters': authParameters,
      if (customAuthenticationType != null)
        'customAuthenticationType': customAuthenticationType,
    };
  }
}

/// The custom credentials required for custom authentication.
class CustomAuthCredentials {
  /// The custom authentication type that the connector uses.
  final String customAuthenticationType;

  /// A map that holds custom authentication credentials.
  final Map<String, String>? credentialsMap;

  CustomAuthCredentials({
    required this.customAuthenticationType,
    this.credentialsMap,
  });

  Map<String, dynamic> toJson() {
    final customAuthenticationType = this.customAuthenticationType;
    final credentialsMap = this.credentialsMap;
    return {
      'customAuthenticationType': customAuthenticationType,
      if (credentialsMap != null) 'credentialsMap': credentialsMap,
    };
  }
}

/// The properties that are applied when the custom connector is being used as a
/// destination.
class CustomConnectorDestinationProperties {
  /// The entity specified in the custom connector as a destination in the flow.
  final String entityName;

  /// The custom properties that are specific to the connector when it's used as a
  /// destination in the flow.
  final Map<String, String>? customProperties;

  /// The settings that determine how Amazon AppFlow handles an error when placing
  /// data in the custom connector as destination.
  final ErrorHandlingConfig? errorHandlingConfig;

  /// The name of the field that Amazon AppFlow uses as an ID when performing a
  /// write operation such as update, delete, or upsert.
  final List<String>? idFieldNames;

  /// Specifies the type of write operation to be performed in the custom
  /// connector when it's used as destination.
  final WriteOperationType? writeOperationType;

  CustomConnectorDestinationProperties({
    required this.entityName,
    this.customProperties,
    this.errorHandlingConfig,
    this.idFieldNames,
    this.writeOperationType,
  });

  factory CustomConnectorDestinationProperties.fromJson(
      Map<String, dynamic> json) {
    return CustomConnectorDestinationProperties(
      entityName: json['entityName'] as String,
      customProperties: (json['customProperties'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      errorHandlingConfig: json['errorHandlingConfig'] != null
          ? ErrorHandlingConfig.fromJson(
              json['errorHandlingConfig'] as Map<String, dynamic>)
          : null,
      idFieldNames: (json['idFieldNames'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      writeOperationType: (json['writeOperationType'] as String?)
          ?.let(WriteOperationType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final entityName = this.entityName;
    final customProperties = this.customProperties;
    final errorHandlingConfig = this.errorHandlingConfig;
    final idFieldNames = this.idFieldNames;
    final writeOperationType = this.writeOperationType;
    return {
      'entityName': entityName,
      if (customProperties != null) 'customProperties': customProperties,
      if (errorHandlingConfig != null)
        'errorHandlingConfig': errorHandlingConfig,
      if (idFieldNames != null) 'idFieldNames': idFieldNames,
      if (writeOperationType != null)
        'writeOperationType': writeOperationType.value,
    };
  }
}

/// The connector-specific profile credentials that are required when using the
/// custom connector.
class CustomConnectorProfileCredentials {
  /// The authentication type that the custom connector uses for authenticating
  /// while creating a connector profile.
  final AuthenticationType authenticationType;

  /// The API keys required for the authentication of the user.
  final ApiKeyCredentials? apiKey;

  /// The basic credentials that are required for the authentication of the user.
  final BasicAuthCredentials? basic;

  /// If the connector uses the custom authentication mechanism, this holds the
  /// required credentials.
  final CustomAuthCredentials? custom;

  /// The OAuth 2.0 credentials required for the authentication of the user.
  final OAuth2Credentials? oauth2;

  CustomConnectorProfileCredentials({
    required this.authenticationType,
    this.apiKey,
    this.basic,
    this.custom,
    this.oauth2,
  });

  Map<String, dynamic> toJson() {
    final authenticationType = this.authenticationType;
    final apiKey = this.apiKey;
    final basic = this.basic;
    final custom = this.custom;
    final oauth2 = this.oauth2;
    return {
      'authenticationType': authenticationType.value,
      if (apiKey != null) 'apiKey': apiKey,
      if (basic != null) 'basic': basic,
      if (custom != null) 'custom': custom,
      if (oauth2 != null) 'oauth2': oauth2,
    };
  }
}

/// The profile properties required by the custom connector.
class CustomConnectorProfileProperties {
  final OAuth2Properties? oAuth2Properties;

  /// A map of properties that are required to create a profile for the custom
  /// connector.
  final Map<String, String>? profileProperties;

  CustomConnectorProfileProperties({
    this.oAuth2Properties,
    this.profileProperties,
  });

  factory CustomConnectorProfileProperties.fromJson(Map<String, dynamic> json) {
    return CustomConnectorProfileProperties(
      oAuth2Properties: json['oAuth2Properties'] != null
          ? OAuth2Properties.fromJson(
              json['oAuth2Properties'] as Map<String, dynamic>)
          : null,
      profileProperties: (json['profileProperties'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final oAuth2Properties = this.oAuth2Properties;
    final profileProperties = this.profileProperties;
    return {
      if (oAuth2Properties != null) 'oAuth2Properties': oAuth2Properties,
      if (profileProperties != null) 'profileProperties': profileProperties,
    };
  }
}

/// The properties that are applied when the custom connector is being used as a
/// source.
class CustomConnectorSourceProperties {
  /// The entity specified in the custom connector as a source in the flow.
  final String entityName;

  /// Custom properties that are required to use the custom connector as a source.
  final Map<String, String>? customProperties;

  /// The API of the connector application that Amazon AppFlow uses to transfer
  /// your data.
  final DataTransferApi? dataTransferApi;

  CustomConnectorSourceProperties({
    required this.entityName,
    this.customProperties,
    this.dataTransferApi,
  });

  factory CustomConnectorSourceProperties.fromJson(Map<String, dynamic> json) {
    return CustomConnectorSourceProperties(
      entityName: json['entityName'] as String,
      customProperties: (json['customProperties'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      dataTransferApi: json['dataTransferApi'] != null
          ? DataTransferApi.fromJson(
              json['dataTransferApi'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final entityName = this.entityName;
    final customProperties = this.customProperties;
    final dataTransferApi = this.dataTransferApi;
    return {
      'entityName': entityName,
      if (customProperties != null) 'customProperties': customProperties,
      if (dataTransferApi != null) 'dataTransferApi': dataTransferApi,
    };
  }
}

/// The properties that are applied when Amazon Connect Customer Profiles is
/// used as a destination.
class CustomerProfilesDestinationProperties {
  /// The unique name of the Amazon Connect Customer Profiles domain.
  final String domainName;

  /// The object specified in the Amazon Connect Customer Profiles flow
  /// destination.
  final String? objectTypeName;

  CustomerProfilesDestinationProperties({
    required this.domainName,
    this.objectTypeName,
  });

  factory CustomerProfilesDestinationProperties.fromJson(
      Map<String, dynamic> json) {
    return CustomerProfilesDestinationProperties(
      domainName: json['domainName'] as String,
      objectTypeName: json['objectTypeName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final domainName = this.domainName;
    final objectTypeName = this.objectTypeName;
    return {
      'domainName': domainName,
      if (objectTypeName != null) 'objectTypeName': objectTypeName,
    };
  }
}

/// The connector metadata specific to Amazon Connect Customer Profiles.
class CustomerProfilesMetadata {
  CustomerProfilesMetadata();

  factory CustomerProfilesMetadata.fromJson(Map<String, dynamic> _) {
    return CustomerProfilesMetadata();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum DataPullMode {
  incremental('Incremental'),
  complete('Complete'),
  ;

  final String value;

  const DataPullMode(this.value);

  static DataPullMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum DataPullMode'));
}

/// The API of the connector application that Amazon AppFlow uses to transfer
/// your data.
class DataTransferApi {
  /// The name of the connector application API.
  final String? name;

  /// You can specify one of the following types:
  /// <dl> <dt>AUTOMATIC</dt> <dd>
  /// The default. Optimizes a flow for datasets that fluctuate in size from small
  /// to large. For each flow run, Amazon AppFlow chooses to use the SYNC or ASYNC
  /// API type based on the amount of data that the run transfers.
  /// </dd> <dt>SYNC</dt> <dd>
  /// A synchronous API. This type of API optimizes a flow for small to
  /// medium-sized datasets.
  /// </dd> <dt>ASYNC</dt> <dd>
  /// An asynchronous API. This type of API optimizes a flow for large datasets.
  /// </dd> </dl>
  final DataTransferApiType? type;

  DataTransferApi({
    this.name,
    this.type,
  });

  factory DataTransferApi.fromJson(Map<String, dynamic> json) {
    return DataTransferApi(
      name: json['Name'] as String?,
      type: (json['Type'] as String?)?.let(DataTransferApiType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    return {
      if (name != null) 'Name': name,
      if (type != null) 'Type': type.value,
    };
  }
}

enum DataTransferApiType {
  sync('SYNC'),
  async('ASYNC'),
  automatic('AUTOMATIC'),
  ;

  final String value;

  const DataTransferApiType(this.value);

  static DataTransferApiType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum DataTransferApiType'));
}

enum DatadogConnectorOperator {
  projection('PROJECTION'),
  between('BETWEEN'),
  equalTo('EQUAL_TO'),
  addition('ADDITION'),
  multiplication('MULTIPLICATION'),
  division('DIVISION'),
  subtraction('SUBTRACTION'),
  maskAll('MASK_ALL'),
  maskFirstN('MASK_FIRST_N'),
  maskLastN('MASK_LAST_N'),
  validateNonNull('VALIDATE_NON_NULL'),
  validateNonZero('VALIDATE_NON_ZERO'),
  validateNonNegative('VALIDATE_NON_NEGATIVE'),
  validateNumeric('VALIDATE_NUMERIC'),
  noOp('NO_OP'),
  ;

  final String value;

  const DatadogConnectorOperator(this.value);

  static DatadogConnectorOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum DatadogConnectorOperator'));
}

/// The connector-specific credentials required by Datadog.
class DatadogConnectorProfileCredentials {
  /// A unique alphanumeric identifier used to authenticate a user, developer, or
  /// calling program to your API.
  final String apiKey;

  /// Application keys, in conjunction with your API key, give you full access to
  /// Datadog’s programmatic API. Application keys are associated with the user
  /// account that created them. The application key is used to log all requests
  /// made to the API.
  final String applicationKey;

  DatadogConnectorProfileCredentials({
    required this.apiKey,
    required this.applicationKey,
  });

  Map<String, dynamic> toJson() {
    final apiKey = this.apiKey;
    final applicationKey = this.applicationKey;
    return {
      'apiKey': apiKey,
      'applicationKey': applicationKey,
    };
  }
}

/// The connector-specific profile properties required by Datadog.
class DatadogConnectorProfileProperties {
  /// The location of the Datadog resource.
  final String instanceUrl;

  DatadogConnectorProfileProperties({
    required this.instanceUrl,
  });

  factory DatadogConnectorProfileProperties.fromJson(
      Map<String, dynamic> json) {
    return DatadogConnectorProfileProperties(
      instanceUrl: json['instanceUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceUrl = this.instanceUrl;
    return {
      'instanceUrl': instanceUrl,
    };
  }
}

/// The connector metadata specific to Datadog.
class DatadogMetadata {
  DatadogMetadata();

  factory DatadogMetadata.fromJson(Map<String, dynamic> _) {
    return DatadogMetadata();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The properties that are applied when Datadog is being used as a source.
class DatadogSourceProperties {
  /// The object specified in the Datadog flow source.
  final String object;

  DatadogSourceProperties({
    required this.object,
  });

  factory DatadogSourceProperties.fromJson(Map<String, dynamic> json) {
    return DatadogSourceProperties(
      object: json['object'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final object = this.object;
    return {
      'object': object,
    };
  }
}

class DeleteConnectorProfileResponse {
  DeleteConnectorProfileResponse();

  factory DeleteConnectorProfileResponse.fromJson(Map<String, dynamic> _) {
    return DeleteConnectorProfileResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteFlowResponse {
  DeleteFlowResponse();

  factory DeleteFlowResponse.fromJson(Map<String, dynamic> _) {
    return DeleteFlowResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeConnectorEntityResponse {
  /// Describes the fields for that connector entity. For example, for an
  /// <i>account</i> entity, the fields would be <i>account name</i>, <i>account
  /// ID</i>, and so on.
  final List<ConnectorEntityField> connectorEntityFields;

  DescribeConnectorEntityResponse({
    required this.connectorEntityFields,
  });

  factory DescribeConnectorEntityResponse.fromJson(Map<String, dynamic> json) {
    return DescribeConnectorEntityResponse(
      connectorEntityFields: (json['connectorEntityFields'] as List)
          .nonNulls
          .map((e) => ConnectorEntityField.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final connectorEntityFields = this.connectorEntityFields;
    return {
      'connectorEntityFields': connectorEntityFields,
    };
  }
}

class DescribeConnectorProfilesResponse {
  /// Returns information about the connector profiles associated with the flow.
  final List<ConnectorProfile>? connectorProfileDetails;

  /// The pagination token for the next page of data. If
  /// <code>nextToken=null</code>, this means that all records have been fetched.
  final String? nextToken;

  DescribeConnectorProfilesResponse({
    this.connectorProfileDetails,
    this.nextToken,
  });

  factory DescribeConnectorProfilesResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeConnectorProfilesResponse(
      connectorProfileDetails: (json['connectorProfileDetails'] as List?)
          ?.nonNulls
          .map((e) => ConnectorProfile.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectorProfileDetails = this.connectorProfileDetails;
    final nextToken = this.nextToken;
    return {
      if (connectorProfileDetails != null)
        'connectorProfileDetails': connectorProfileDetails,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DescribeConnectorResponse {
  /// Configuration info of all the connectors that the user requested.
  final ConnectorConfiguration? connectorConfiguration;

  DescribeConnectorResponse({
    this.connectorConfiguration,
  });

  factory DescribeConnectorResponse.fromJson(Map<String, dynamic> json) {
    return DescribeConnectorResponse(
      connectorConfiguration: json['connectorConfiguration'] != null
          ? ConnectorConfiguration.fromJson(
              json['connectorConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final connectorConfiguration = this.connectorConfiguration;
    return {
      if (connectorConfiguration != null)
        'connectorConfiguration': connectorConfiguration,
    };
  }
}

class DescribeConnectorsResponse {
  /// The configuration that is applied to the connectors used in the flow.
  final Map<ConnectorType, ConnectorConfiguration>? connectorConfigurations;

  /// Information about the connectors supported in Amazon AppFlow.
  final List<ConnectorDetail>? connectors;

  /// The pagination token for the next page of data.
  final String? nextToken;

  DescribeConnectorsResponse({
    this.connectorConfigurations,
    this.connectors,
    this.nextToken,
  });

  factory DescribeConnectorsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeConnectorsResponse(
      connectorConfigurations:
          (json['connectorConfigurations'] as Map<String, dynamic>?)?.map(
              (k, e) => MapEntry(ConnectorType.fromString(k),
                  ConnectorConfiguration.fromJson(e as Map<String, dynamic>))),
      connectors: (json['connectors'] as List?)
          ?.nonNulls
          .map((e) => ConnectorDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectorConfigurations = this.connectorConfigurations;
    final connectors = this.connectors;
    final nextToken = this.nextToken;
    return {
      if (connectorConfigurations != null)
        'connectorConfigurations':
            connectorConfigurations.map((k, e) => MapEntry(k.value, e)),
      if (connectors != null) 'connectors': connectors,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DescribeFlowExecutionRecordsResponse {
  /// Returns a list of all instances when this flow was run.
  final List<ExecutionRecord>? flowExecutions;

  /// The pagination token for the next page of data.
  final String? nextToken;

  DescribeFlowExecutionRecordsResponse({
    this.flowExecutions,
    this.nextToken,
  });

  factory DescribeFlowExecutionRecordsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeFlowExecutionRecordsResponse(
      flowExecutions: (json['flowExecutions'] as List?)
          ?.nonNulls
          .map((e) => ExecutionRecord.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final flowExecutions = this.flowExecutions;
    final nextToken = this.nextToken;
    return {
      if (flowExecutions != null) 'flowExecutions': flowExecutions,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DescribeFlowResponse {
  /// Specifies when the flow was created.
  final DateTime? createdAt;

  /// The ARN of the user who created the flow.
  final String? createdBy;

  /// A description of the flow.
  final String? description;

  /// The configuration that controls how Amazon AppFlow transfers data to the
  /// destination connector.
  final List<DestinationFlowConfig>? destinationFlowConfigList;

  /// The flow's Amazon Resource Name (ARN).
  final String? flowArn;

  /// The specified name of the flow. Spaces are not allowed. Use underscores (_)
  /// or hyphens (-) only.
  final String? flowName;

  /// Indicates the current status of the flow.
  final FlowStatus? flowStatus;

  /// Contains an error message if the flow status is in a suspended or error
  /// state. This applies only to scheduled or event-triggered flows.
  final String? flowStatusMessage;

  /// The ARN (Amazon Resource Name) of the Key Management Service (KMS) key you
  /// provide for encryption. This is required if you do not want to use the
  /// Amazon AppFlow-managed KMS key. If you don't provide anything here, Amazon
  /// AppFlow uses the Amazon AppFlow-managed KMS key.
  final String? kmsArn;

  /// Describes the details of the most recent flow run.
  final ExecutionDetails? lastRunExecutionDetails;

  /// Describes the metadata catalog, metadata table, and data partitions that
  /// Amazon AppFlow used for the associated flow run.
  final List<MetadataCatalogDetail>? lastRunMetadataCatalogDetails;

  /// Specifies when the flow was last updated.
  final DateTime? lastUpdatedAt;

  /// Specifies the user name of the account that performed the most recent
  /// update.
  final String? lastUpdatedBy;

  /// Specifies the configuration that Amazon AppFlow uses when it catalogs the
  /// data that's transferred by the associated flow. When Amazon AppFlow catalogs
  /// the data from a flow, it stores metadata in a data catalog.
  final MetadataCatalogConfig? metadataCatalogConfig;

  /// The version number of your data schema. Amazon AppFlow assigns this version
  /// number. The version number increases by one when you change any of the
  /// following settings in your flow configuration:
  ///
  /// <ul>
  /// <li>
  /// Source-to-destination field mappings
  /// </li>
  /// <li>
  /// Field data types
  /// </li>
  /// <li>
  /// Partition keys
  /// </li>
  /// </ul>
  final int? schemaVersion;

  /// The configuration that controls how Amazon AppFlow retrieves data from the
  /// source connector.
  final SourceFlowConfig? sourceFlowConfig;

  /// The tags used to organize, track, or control access for your flow.
  final Map<String, String>? tags;

  /// A list of tasks that Amazon AppFlow performs while transferring the data in
  /// the flow run.
  final List<Task>? tasks;

  /// The trigger settings that determine how and when the flow runs.
  final TriggerConfig? triggerConfig;

  DescribeFlowResponse({
    this.createdAt,
    this.createdBy,
    this.description,
    this.destinationFlowConfigList,
    this.flowArn,
    this.flowName,
    this.flowStatus,
    this.flowStatusMessage,
    this.kmsArn,
    this.lastRunExecutionDetails,
    this.lastRunMetadataCatalogDetails,
    this.lastUpdatedAt,
    this.lastUpdatedBy,
    this.metadataCatalogConfig,
    this.schemaVersion,
    this.sourceFlowConfig,
    this.tags,
    this.tasks,
    this.triggerConfig,
  });

  factory DescribeFlowResponse.fromJson(Map<String, dynamic> json) {
    return DescribeFlowResponse(
      createdAt: timeStampFromJson(json['createdAt']),
      createdBy: json['createdBy'] as String?,
      description: json['description'] as String?,
      destinationFlowConfigList: (json['destinationFlowConfigList'] as List?)
          ?.nonNulls
          .map((e) => DestinationFlowConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      flowArn: json['flowArn'] as String?,
      flowName: json['flowName'] as String?,
      flowStatus: (json['flowStatus'] as String?)?.let(FlowStatus.fromString),
      flowStatusMessage: json['flowStatusMessage'] as String?,
      kmsArn: json['kmsArn'] as String?,
      lastRunExecutionDetails: json['lastRunExecutionDetails'] != null
          ? ExecutionDetails.fromJson(
              json['lastRunExecutionDetails'] as Map<String, dynamic>)
          : null,
      lastRunMetadataCatalogDetails: (json['lastRunMetadataCatalogDetails']
              as List?)
          ?.nonNulls
          .map((e) => MetadataCatalogDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      lastUpdatedBy: json['lastUpdatedBy'] as String?,
      metadataCatalogConfig: json['metadataCatalogConfig'] != null
          ? MetadataCatalogConfig.fromJson(
              json['metadataCatalogConfig'] as Map<String, dynamic>)
          : null,
      schemaVersion: json['schemaVersion'] as int?,
      sourceFlowConfig: json['sourceFlowConfig'] != null
          ? SourceFlowConfig.fromJson(
              json['sourceFlowConfig'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      tasks: (json['tasks'] as List?)
          ?.nonNulls
          .map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
      triggerConfig: json['triggerConfig'] != null
          ? TriggerConfig.fromJson(
              json['triggerConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final description = this.description;
    final destinationFlowConfigList = this.destinationFlowConfigList;
    final flowArn = this.flowArn;
    final flowName = this.flowName;
    final flowStatus = this.flowStatus;
    final flowStatusMessage = this.flowStatusMessage;
    final kmsArn = this.kmsArn;
    final lastRunExecutionDetails = this.lastRunExecutionDetails;
    final lastRunMetadataCatalogDetails = this.lastRunMetadataCatalogDetails;
    final lastUpdatedAt = this.lastUpdatedAt;
    final lastUpdatedBy = this.lastUpdatedBy;
    final metadataCatalogConfig = this.metadataCatalogConfig;
    final schemaVersion = this.schemaVersion;
    final sourceFlowConfig = this.sourceFlowConfig;
    final tags = this.tags;
    final tasks = this.tasks;
    final triggerConfig = this.triggerConfig;
    return {
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (createdBy != null) 'createdBy': createdBy,
      if (description != null) 'description': description,
      if (destinationFlowConfigList != null)
        'destinationFlowConfigList': destinationFlowConfigList,
      if (flowArn != null) 'flowArn': flowArn,
      if (flowName != null) 'flowName': flowName,
      if (flowStatus != null) 'flowStatus': flowStatus.value,
      if (flowStatusMessage != null) 'flowStatusMessage': flowStatusMessage,
      if (kmsArn != null) 'kmsArn': kmsArn,
      if (lastRunExecutionDetails != null)
        'lastRunExecutionDetails': lastRunExecutionDetails,
      if (lastRunMetadataCatalogDetails != null)
        'lastRunMetadataCatalogDetails': lastRunMetadataCatalogDetails,
      if (lastUpdatedAt != null)
        'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (lastUpdatedBy != null) 'lastUpdatedBy': lastUpdatedBy,
      if (metadataCatalogConfig != null)
        'metadataCatalogConfig': metadataCatalogConfig,
      if (schemaVersion != null) 'schemaVersion': schemaVersion,
      if (sourceFlowConfig != null) 'sourceFlowConfig': sourceFlowConfig,
      if (tags != null) 'tags': tags,
      if (tasks != null) 'tasks': tasks,
      if (triggerConfig != null) 'triggerConfig': triggerConfig,
    };
  }
}

/// This stores the information that is required to query a particular
/// connector.
class DestinationConnectorProperties {
  /// The properties that are required to query the custom Connector.
  final CustomConnectorDestinationProperties? customConnector;

  /// The properties required to query Amazon Connect Customer Profiles.
  final CustomerProfilesDestinationProperties? customerProfiles;

  /// The properties required to query Amazon EventBridge.
  final EventBridgeDestinationProperties? eventBridge;

  /// The properties required to query Amazon Honeycode.
  final HoneycodeDestinationProperties? honeycode;

  /// The properties required to query Amazon Lookout for Metrics.
  final LookoutMetricsDestinationProperties? lookoutMetrics;

  /// The properties required to query Marketo.
  final MarketoDestinationProperties? marketo;

  /// The properties required to query Amazon Redshift.
  final RedshiftDestinationProperties? redshift;

  /// The properties required to query Amazon S3.
  final S3DestinationProperties? s3;

  /// The properties required to query SAPOData.
  final SAPODataDestinationProperties? sAPOData;

  /// The properties required to query Salesforce.
  final SalesforceDestinationProperties? salesforce;

  /// The properties required to query Snowflake.
  final SnowflakeDestinationProperties? snowflake;

  /// The properties required to query Upsolver.
  final UpsolverDestinationProperties? upsolver;

  /// The properties required to query Zendesk.
  final ZendeskDestinationProperties? zendesk;

  DestinationConnectorProperties({
    this.customConnector,
    this.customerProfiles,
    this.eventBridge,
    this.honeycode,
    this.lookoutMetrics,
    this.marketo,
    this.redshift,
    this.s3,
    this.sAPOData,
    this.salesforce,
    this.snowflake,
    this.upsolver,
    this.zendesk,
  });

  factory DestinationConnectorProperties.fromJson(Map<String, dynamic> json) {
    return DestinationConnectorProperties(
      customConnector: json['CustomConnector'] != null
          ? CustomConnectorDestinationProperties.fromJson(
              json['CustomConnector'] as Map<String, dynamic>)
          : null,
      customerProfiles: json['CustomerProfiles'] != null
          ? CustomerProfilesDestinationProperties.fromJson(
              json['CustomerProfiles'] as Map<String, dynamic>)
          : null,
      eventBridge: json['EventBridge'] != null
          ? EventBridgeDestinationProperties.fromJson(
              json['EventBridge'] as Map<String, dynamic>)
          : null,
      honeycode: json['Honeycode'] != null
          ? HoneycodeDestinationProperties.fromJson(
              json['Honeycode'] as Map<String, dynamic>)
          : null,
      lookoutMetrics: json['LookoutMetrics'] != null
          ? LookoutMetricsDestinationProperties.fromJson(
              json['LookoutMetrics'] as Map<String, dynamic>)
          : null,
      marketo: json['Marketo'] != null
          ? MarketoDestinationProperties.fromJson(
              json['Marketo'] as Map<String, dynamic>)
          : null,
      redshift: json['Redshift'] != null
          ? RedshiftDestinationProperties.fromJson(
              json['Redshift'] as Map<String, dynamic>)
          : null,
      s3: json['S3'] != null
          ? S3DestinationProperties.fromJson(json['S3'] as Map<String, dynamic>)
          : null,
      sAPOData: json['SAPOData'] != null
          ? SAPODataDestinationProperties.fromJson(
              json['SAPOData'] as Map<String, dynamic>)
          : null,
      salesforce: json['Salesforce'] != null
          ? SalesforceDestinationProperties.fromJson(
              json['Salesforce'] as Map<String, dynamic>)
          : null,
      snowflake: json['Snowflake'] != null
          ? SnowflakeDestinationProperties.fromJson(
              json['Snowflake'] as Map<String, dynamic>)
          : null,
      upsolver: json['Upsolver'] != null
          ? UpsolverDestinationProperties.fromJson(
              json['Upsolver'] as Map<String, dynamic>)
          : null,
      zendesk: json['Zendesk'] != null
          ? ZendeskDestinationProperties.fromJson(
              json['Zendesk'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final customConnector = this.customConnector;
    final customerProfiles = this.customerProfiles;
    final eventBridge = this.eventBridge;
    final honeycode = this.honeycode;
    final lookoutMetrics = this.lookoutMetrics;
    final marketo = this.marketo;
    final redshift = this.redshift;
    final s3 = this.s3;
    final sAPOData = this.sAPOData;
    final salesforce = this.salesforce;
    final snowflake = this.snowflake;
    final upsolver = this.upsolver;
    final zendesk = this.zendesk;
    return {
      if (customConnector != null) 'CustomConnector': customConnector,
      if (customerProfiles != null) 'CustomerProfiles': customerProfiles,
      if (eventBridge != null) 'EventBridge': eventBridge,
      if (honeycode != null) 'Honeycode': honeycode,
      if (lookoutMetrics != null) 'LookoutMetrics': lookoutMetrics,
      if (marketo != null) 'Marketo': marketo,
      if (redshift != null) 'Redshift': redshift,
      if (s3 != null) 'S3': s3,
      if (sAPOData != null) 'SAPOData': sAPOData,
      if (salesforce != null) 'Salesforce': salesforce,
      if (snowflake != null) 'Snowflake': snowflake,
      if (upsolver != null) 'Upsolver': upsolver,
      if (zendesk != null) 'Zendesk': zendesk,
    };
  }
}

/// The properties that can be applied to a field when connector is being used
/// as a destination.
class DestinationFieldProperties {
  /// Specifies if the destination field can be created by the current user.
  final bool? isCreatable;

  /// Specifies whether the field can use the default value during a Create
  /// operation.
  final bool? isDefaultedOnCreate;

  /// Specifies if the destination field can have a null value.
  final bool? isNullable;

  /// Specifies whether the field can be updated during an <code>UPDATE</code> or
  /// <code>UPSERT</code> write operation.
  final bool? isUpdatable;

  /// Specifies if the flow run can either insert new rows in the destination
  /// field if they do not already exist, or update them if they do.
  final bool? isUpsertable;

  /// A list of supported write operations. For each write operation listed, this
  /// field can be used in <code>idFieldNames</code> when that write operation is
  /// present as a destination option.
  final List<WriteOperationType>? supportedWriteOperations;

  DestinationFieldProperties({
    this.isCreatable,
    this.isDefaultedOnCreate,
    this.isNullable,
    this.isUpdatable,
    this.isUpsertable,
    this.supportedWriteOperations,
  });

  factory DestinationFieldProperties.fromJson(Map<String, dynamic> json) {
    return DestinationFieldProperties(
      isCreatable: json['isCreatable'] as bool?,
      isDefaultedOnCreate: json['isDefaultedOnCreate'] as bool?,
      isNullable: json['isNullable'] as bool?,
      isUpdatable: json['isUpdatable'] as bool?,
      isUpsertable: json['isUpsertable'] as bool?,
      supportedWriteOperations: (json['supportedWriteOperations'] as List?)
          ?.nonNulls
          .map((e) => WriteOperationType.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final isCreatable = this.isCreatable;
    final isDefaultedOnCreate = this.isDefaultedOnCreate;
    final isNullable = this.isNullable;
    final isUpdatable = this.isUpdatable;
    final isUpsertable = this.isUpsertable;
    final supportedWriteOperations = this.supportedWriteOperations;
    return {
      if (isCreatable != null) 'isCreatable': isCreatable,
      if (isDefaultedOnCreate != null)
        'isDefaultedOnCreate': isDefaultedOnCreate,
      if (isNullable != null) 'isNullable': isNullable,
      if (isUpdatable != null) 'isUpdatable': isUpdatable,
      if (isUpsertable != null) 'isUpsertable': isUpsertable,
      if (supportedWriteOperations != null)
        'supportedWriteOperations':
            supportedWriteOperations.map((e) => e.value).toList(),
    };
  }
}

/// Contains information about the configuration of destination connectors
/// present in the flow.
class DestinationFlowConfig {
  /// The type of connector, such as Salesforce, Amplitude, and so on.
  final ConnectorType connectorType;

  /// This stores the information that is required to query a particular
  /// connector.
  final DestinationConnectorProperties destinationConnectorProperties;

  /// The API version that the destination connector uses.
  final String? apiVersion;

  /// The name of the connector profile. This name must be unique for each
  /// connector profile in the Amazon Web Services account.
  final String? connectorProfileName;

  DestinationFlowConfig({
    required this.connectorType,
    required this.destinationConnectorProperties,
    this.apiVersion,
    this.connectorProfileName,
  });

  factory DestinationFlowConfig.fromJson(Map<String, dynamic> json) {
    return DestinationFlowConfig(
      connectorType:
          ConnectorType.fromString((json['connectorType'] as String)),
      destinationConnectorProperties: DestinationConnectorProperties.fromJson(
          json['destinationConnectorProperties'] as Map<String, dynamic>),
      apiVersion: json['apiVersion'] as String?,
      connectorProfileName: json['connectorProfileName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectorType = this.connectorType;
    final destinationConnectorProperties = this.destinationConnectorProperties;
    final apiVersion = this.apiVersion;
    final connectorProfileName = this.connectorProfileName;
    return {
      'connectorType': connectorType.value,
      'destinationConnectorProperties': destinationConnectorProperties,
      if (apiVersion != null) 'apiVersion': apiVersion,
      if (connectorProfileName != null)
        'connectorProfileName': connectorProfileName,
    };
  }
}

enum DynatraceConnectorOperator {
  projection('PROJECTION'),
  between('BETWEEN'),
  equalTo('EQUAL_TO'),
  addition('ADDITION'),
  multiplication('MULTIPLICATION'),
  division('DIVISION'),
  subtraction('SUBTRACTION'),
  maskAll('MASK_ALL'),
  maskFirstN('MASK_FIRST_N'),
  maskLastN('MASK_LAST_N'),
  validateNonNull('VALIDATE_NON_NULL'),
  validateNonZero('VALIDATE_NON_ZERO'),
  validateNonNegative('VALIDATE_NON_NEGATIVE'),
  validateNumeric('VALIDATE_NUMERIC'),
  noOp('NO_OP'),
  ;

  final String value;

  const DynatraceConnectorOperator(this.value);

  static DynatraceConnectorOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum DynatraceConnectorOperator'));
}

/// The connector-specific profile credentials required by Dynatrace.
class DynatraceConnectorProfileCredentials {
  /// The API tokens used by Dynatrace API to authenticate various API calls.
  final String apiToken;

  DynatraceConnectorProfileCredentials({
    required this.apiToken,
  });

  Map<String, dynamic> toJson() {
    final apiToken = this.apiToken;
    return {
      'apiToken': apiToken,
    };
  }
}

/// The connector-specific profile properties required by Dynatrace.
class DynatraceConnectorProfileProperties {
  /// The location of the Dynatrace resource.
  final String instanceUrl;

  DynatraceConnectorProfileProperties({
    required this.instanceUrl,
  });

  factory DynatraceConnectorProfileProperties.fromJson(
      Map<String, dynamic> json) {
    return DynatraceConnectorProfileProperties(
      instanceUrl: json['instanceUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceUrl = this.instanceUrl;
    return {
      'instanceUrl': instanceUrl,
    };
  }
}

/// The connector metadata specific to Dynatrace.
class DynatraceMetadata {
  DynatraceMetadata();

  factory DynatraceMetadata.fromJson(Map<String, dynamic> _) {
    return DynatraceMetadata();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The properties that are applied when Dynatrace is being used as a source.
class DynatraceSourceProperties {
  /// The object specified in the Dynatrace flow source.
  final String object;

  DynatraceSourceProperties({
    required this.object,
  });

  factory DynatraceSourceProperties.fromJson(Map<String, dynamic> json) {
    return DynatraceSourceProperties(
      object: json['object'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final object = this.object;
    return {
      'object': object,
    };
  }
}

/// The settings that determine how Amazon AppFlow handles an error when placing
/// data in the destination. For example, this setting would determine if the
/// flow should fail after one insertion error, or continue and attempt to
/// insert every record regardless of the initial failure.
/// <code>ErrorHandlingConfig</code> is a part of the destination connector
/// details.
class ErrorHandlingConfig {
  /// Specifies the name of the Amazon S3 bucket.
  final String? bucketName;

  /// Specifies the Amazon S3 bucket prefix.
  final String? bucketPrefix;

  /// Specifies if the flow should fail after the first instance of a failure when
  /// attempting to place data in the destination.
  final bool? failOnFirstDestinationError;

  ErrorHandlingConfig({
    this.bucketName,
    this.bucketPrefix,
    this.failOnFirstDestinationError,
  });

  factory ErrorHandlingConfig.fromJson(Map<String, dynamic> json) {
    return ErrorHandlingConfig(
      bucketName: json['bucketName'] as String?,
      bucketPrefix: json['bucketPrefix'] as String?,
      failOnFirstDestinationError: json['failOnFirstDestinationError'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final bucketPrefix = this.bucketPrefix;
    final failOnFirstDestinationError = this.failOnFirstDestinationError;
    return {
      if (bucketName != null) 'bucketName': bucketName,
      if (bucketPrefix != null) 'bucketPrefix': bucketPrefix,
      if (failOnFirstDestinationError != null)
        'failOnFirstDestinationError': failOnFirstDestinationError,
    };
  }
}

/// Provides details in the event of a failed flow, including the failure count
/// and the related error messages.
class ErrorInfo {
  /// Specifies the error message that appears if a flow fails.
  final String? executionMessage;

  /// Specifies the failure count for the attempted flow.
  final int? putFailuresCount;

  ErrorInfo({
    this.executionMessage,
    this.putFailuresCount,
  });

  factory ErrorInfo.fromJson(Map<String, dynamic> json) {
    return ErrorInfo(
      executionMessage: json['executionMessage'] as String?,
      putFailuresCount: json['putFailuresCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final executionMessage = this.executionMessage;
    final putFailuresCount = this.putFailuresCount;
    return {
      if (executionMessage != null) 'executionMessage': executionMessage,
      if (putFailuresCount != null) 'putFailuresCount': putFailuresCount,
    };
  }
}

/// The properties that are applied when Amazon EventBridge is being used as a
/// destination.
class EventBridgeDestinationProperties {
  /// The object specified in the Amazon EventBridge flow destination.
  final String object;
  final ErrorHandlingConfig? errorHandlingConfig;

  EventBridgeDestinationProperties({
    required this.object,
    this.errorHandlingConfig,
  });

  factory EventBridgeDestinationProperties.fromJson(Map<String, dynamic> json) {
    return EventBridgeDestinationProperties(
      object: json['object'] as String,
      errorHandlingConfig: json['errorHandlingConfig'] != null
          ? ErrorHandlingConfig.fromJson(
              json['errorHandlingConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final object = this.object;
    final errorHandlingConfig = this.errorHandlingConfig;
    return {
      'object': object,
      if (errorHandlingConfig != null)
        'errorHandlingConfig': errorHandlingConfig,
    };
  }
}

/// The connector metadata specific to Amazon EventBridge.
class EventBridgeMetadata {
  EventBridgeMetadata();

  factory EventBridgeMetadata.fromJson(Map<String, dynamic> _) {
    return EventBridgeMetadata();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Describes the details of the flow run, including the timestamp, status, and
/// message.
class ExecutionDetails {
  /// Describes the details of the most recent flow run.
  final String? mostRecentExecutionMessage;

  /// Specifies the status of the most recent flow run.
  final ExecutionStatus? mostRecentExecutionStatus;

  /// Specifies the time of the most recent flow run.
  final DateTime? mostRecentExecutionTime;

  ExecutionDetails({
    this.mostRecentExecutionMessage,
    this.mostRecentExecutionStatus,
    this.mostRecentExecutionTime,
  });

  factory ExecutionDetails.fromJson(Map<String, dynamic> json) {
    return ExecutionDetails(
      mostRecentExecutionMessage: json['mostRecentExecutionMessage'] as String?,
      mostRecentExecutionStatus: (json['mostRecentExecutionStatus'] as String?)
          ?.let(ExecutionStatus.fromString),
      mostRecentExecutionTime:
          timeStampFromJson(json['mostRecentExecutionTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final mostRecentExecutionMessage = this.mostRecentExecutionMessage;
    final mostRecentExecutionStatus = this.mostRecentExecutionStatus;
    final mostRecentExecutionTime = this.mostRecentExecutionTime;
    return {
      if (mostRecentExecutionMessage != null)
        'mostRecentExecutionMessage': mostRecentExecutionMessage,
      if (mostRecentExecutionStatus != null)
        'mostRecentExecutionStatus': mostRecentExecutionStatus.value,
      if (mostRecentExecutionTime != null)
        'mostRecentExecutionTime': unixTimestampToJson(mostRecentExecutionTime),
    };
  }
}

/// Specifies information about the past flow run instances for a given flow.
class ExecutionRecord {
  /// The timestamp that indicates the last new or updated record to be
  /// transferred in the flow run.
  final DateTime? dataPullEndTime;

  /// The timestamp that determines the first new or updated record to be
  /// transferred in the flow run.
  final DateTime? dataPullStartTime;

  /// Specifies the identifier of the given flow run.
  final String? executionId;

  /// Describes the result of the given flow run.
  final ExecutionResult? executionResult;

  /// Specifies the flow run status and whether it is in progress, has completed
  /// successfully, or has failed.
  final ExecutionStatus? executionStatus;

  /// Specifies the time of the most recent update.
  final DateTime? lastUpdatedAt;

  /// Describes the metadata catalog, metadata table, and data partitions that
  /// Amazon AppFlow used for the associated flow run.
  final List<MetadataCatalogDetail>? metadataCatalogDetails;

  /// Specifies the start time of the flow run.
  final DateTime? startedAt;

  ExecutionRecord({
    this.dataPullEndTime,
    this.dataPullStartTime,
    this.executionId,
    this.executionResult,
    this.executionStatus,
    this.lastUpdatedAt,
    this.metadataCatalogDetails,
    this.startedAt,
  });

  factory ExecutionRecord.fromJson(Map<String, dynamic> json) {
    return ExecutionRecord(
      dataPullEndTime: timeStampFromJson(json['dataPullEndTime']),
      dataPullStartTime: timeStampFromJson(json['dataPullStartTime']),
      executionId: json['executionId'] as String?,
      executionResult: json['executionResult'] != null
          ? ExecutionResult.fromJson(
              json['executionResult'] as Map<String, dynamic>)
          : null,
      executionStatus:
          (json['executionStatus'] as String?)?.let(ExecutionStatus.fromString),
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      metadataCatalogDetails: (json['metadataCatalogDetails'] as List?)
          ?.nonNulls
          .map((e) => MetadataCatalogDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      startedAt: timeStampFromJson(json['startedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final dataPullEndTime = this.dataPullEndTime;
    final dataPullStartTime = this.dataPullStartTime;
    final executionId = this.executionId;
    final executionResult = this.executionResult;
    final executionStatus = this.executionStatus;
    final lastUpdatedAt = this.lastUpdatedAt;
    final metadataCatalogDetails = this.metadataCatalogDetails;
    final startedAt = this.startedAt;
    return {
      if (dataPullEndTime != null)
        'dataPullEndTime': unixTimestampToJson(dataPullEndTime),
      if (dataPullStartTime != null)
        'dataPullStartTime': unixTimestampToJson(dataPullStartTime),
      if (executionId != null) 'executionId': executionId,
      if (executionResult != null) 'executionResult': executionResult,
      if (executionStatus != null) 'executionStatus': executionStatus.value,
      if (lastUpdatedAt != null)
        'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (metadataCatalogDetails != null)
        'metadataCatalogDetails': metadataCatalogDetails,
      if (startedAt != null) 'startedAt': unixTimestampToJson(startedAt),
    };
  }
}

/// Specifies the end result of the flow run.
class ExecutionResult {
  /// The total number of bytes processed by the flow run.
  final int? bytesProcessed;

  /// The total number of bytes written as a result of the flow run.
  final int? bytesWritten;

  /// Provides any error message information related to the flow run.
  final ErrorInfo? errorInfo;

  /// The maximum number of records that Amazon AppFlow receives in each page of
  /// the response from your SAP application.
  final int? maxPageSize;

  /// The number of processes that Amazon AppFlow ran at the same time when it
  /// retrieved your data.
  final int? numParallelProcesses;

  /// The number of records processed in the flow run.
  final int? recordsProcessed;

  ExecutionResult({
    this.bytesProcessed,
    this.bytesWritten,
    this.errorInfo,
    this.maxPageSize,
    this.numParallelProcesses,
    this.recordsProcessed,
  });

  factory ExecutionResult.fromJson(Map<String, dynamic> json) {
    return ExecutionResult(
      bytesProcessed: json['bytesProcessed'] as int?,
      bytesWritten: json['bytesWritten'] as int?,
      errorInfo: json['errorInfo'] != null
          ? ErrorInfo.fromJson(json['errorInfo'] as Map<String, dynamic>)
          : null,
      maxPageSize: json['maxPageSize'] as int?,
      numParallelProcesses: json['numParallelProcesses'] as int?,
      recordsProcessed: json['recordsProcessed'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final bytesProcessed = this.bytesProcessed;
    final bytesWritten = this.bytesWritten;
    final errorInfo = this.errorInfo;
    final maxPageSize = this.maxPageSize;
    final numParallelProcesses = this.numParallelProcesses;
    final recordsProcessed = this.recordsProcessed;
    return {
      if (bytesProcessed != null) 'bytesProcessed': bytesProcessed,
      if (bytesWritten != null) 'bytesWritten': bytesWritten,
      if (errorInfo != null) 'errorInfo': errorInfo,
      if (maxPageSize != null) 'maxPageSize': maxPageSize,
      if (numParallelProcesses != null)
        'numParallelProcesses': numParallelProcesses,
      if (recordsProcessed != null) 'recordsProcessed': recordsProcessed,
    };
  }
}

enum ExecutionStatus {
  inProgress('InProgress'),
  successful('Successful'),
  error('Error'),
  cancelStarted('CancelStarted'),
  canceled('Canceled'),
  ;

  final String value;

  const ExecutionStatus(this.value);

  static ExecutionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ExecutionStatus'));
}

/// Contains details regarding the supported field type and the operators that
/// can be applied for filtering.
class FieldTypeDetails {
  /// The type of field, such as string, integer, date, and so on.
  final String fieldType;

  /// The list of operators supported by a field.
  final List<Operator> filterOperators;

  /// This is the allowable length range for this field's value.
  final Range? fieldLengthRange;

  /// The range of values this field can hold.
  final Range? fieldValueRange;

  /// The date format that the field supports.
  final String? supportedDateFormat;

  /// The list of values that a field can contain. For example, a Boolean
  /// <code>fieldType</code> can have two values: "true" and "false".
  final List<String>? supportedValues;

  /// The regular expression pattern for the field name.
  final String? valueRegexPattern;

  FieldTypeDetails({
    required this.fieldType,
    required this.filterOperators,
    this.fieldLengthRange,
    this.fieldValueRange,
    this.supportedDateFormat,
    this.supportedValues,
    this.valueRegexPattern,
  });

  factory FieldTypeDetails.fromJson(Map<String, dynamic> json) {
    return FieldTypeDetails(
      fieldType: json['fieldType'] as String,
      filterOperators: (json['filterOperators'] as List)
          .nonNulls
          .map((e) => Operator.fromString((e as String)))
          .toList(),
      fieldLengthRange: json['fieldLengthRange'] != null
          ? Range.fromJson(json['fieldLengthRange'] as Map<String, dynamic>)
          : null,
      fieldValueRange: json['fieldValueRange'] != null
          ? Range.fromJson(json['fieldValueRange'] as Map<String, dynamic>)
          : null,
      supportedDateFormat: json['supportedDateFormat'] as String?,
      supportedValues: (json['supportedValues'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      valueRegexPattern: json['valueRegexPattern'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fieldType = this.fieldType;
    final filterOperators = this.filterOperators;
    final fieldLengthRange = this.fieldLengthRange;
    final fieldValueRange = this.fieldValueRange;
    final supportedDateFormat = this.supportedDateFormat;
    final supportedValues = this.supportedValues;
    final valueRegexPattern = this.valueRegexPattern;
    return {
      'fieldType': fieldType,
      'filterOperators': filterOperators.map((e) => e.value).toList(),
      if (fieldLengthRange != null) 'fieldLengthRange': fieldLengthRange,
      if (fieldValueRange != null) 'fieldValueRange': fieldValueRange,
      if (supportedDateFormat != null)
        'supportedDateFormat': supportedDateFormat,
      if (supportedValues != null) 'supportedValues': supportedValues,
      if (valueRegexPattern != null) 'valueRegexPattern': valueRegexPattern,
    };
  }
}

enum FileType {
  csv('CSV'),
  json('JSON'),
  parquet('PARQUET'),
  ;

  final String value;

  const FileType(this.value);

  static FileType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum FileType'));
}

/// The properties of the flow, such as its source, destination, trigger type,
/// and so on.
class FlowDefinition {
  /// Specifies when the flow was created.
  final DateTime? createdAt;

  /// The ARN of the user who created the flow.
  final String? createdBy;

  /// A user-entered description of the flow.
  final String? description;

  /// The label of the destination connector in the flow.
  final String? destinationConnectorLabel;

  /// Specifies the destination connector type, such as Salesforce, Amazon S3,
  /// Amplitude, and so on.
  final ConnectorType? destinationConnectorType;

  /// The flow's Amazon Resource Name (ARN).
  final String? flowArn;

  /// The specified name of the flow. Spaces are not allowed. Use underscores (_)
  /// or hyphens (-) only.
  final String? flowName;

  /// Indicates the current status of the flow.
  final FlowStatus? flowStatus;

  /// Describes the details of the most recent flow run.
  final ExecutionDetails? lastRunExecutionDetails;

  /// Specifies when the flow was last updated.
  final DateTime? lastUpdatedAt;

  /// Specifies the account user name that most recently updated the flow.
  final String? lastUpdatedBy;

  /// The label of the source connector in the flow.
  final String? sourceConnectorLabel;

  /// Specifies the source connector type, such as Salesforce, Amazon S3,
  /// Amplitude, and so on.
  final ConnectorType? sourceConnectorType;

  /// The tags used to organize, track, or control access for your flow.
  final Map<String, String>? tags;

  /// Specifies the type of flow trigger. This can be <code>OnDemand</code>,
  /// <code>Scheduled</code>, or <code>Event</code>.
  final TriggerType? triggerType;

  FlowDefinition({
    this.createdAt,
    this.createdBy,
    this.description,
    this.destinationConnectorLabel,
    this.destinationConnectorType,
    this.flowArn,
    this.flowName,
    this.flowStatus,
    this.lastRunExecutionDetails,
    this.lastUpdatedAt,
    this.lastUpdatedBy,
    this.sourceConnectorLabel,
    this.sourceConnectorType,
    this.tags,
    this.triggerType,
  });

  factory FlowDefinition.fromJson(Map<String, dynamic> json) {
    return FlowDefinition(
      createdAt: timeStampFromJson(json['createdAt']),
      createdBy: json['createdBy'] as String?,
      description: json['description'] as String?,
      destinationConnectorLabel: json['destinationConnectorLabel'] as String?,
      destinationConnectorType: (json['destinationConnectorType'] as String?)
          ?.let(ConnectorType.fromString),
      flowArn: json['flowArn'] as String?,
      flowName: json['flowName'] as String?,
      flowStatus: (json['flowStatus'] as String?)?.let(FlowStatus.fromString),
      lastRunExecutionDetails: json['lastRunExecutionDetails'] != null
          ? ExecutionDetails.fromJson(
              json['lastRunExecutionDetails'] as Map<String, dynamic>)
          : null,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      lastUpdatedBy: json['lastUpdatedBy'] as String?,
      sourceConnectorLabel: json['sourceConnectorLabel'] as String?,
      sourceConnectorType: (json['sourceConnectorType'] as String?)
          ?.let(ConnectorType.fromString),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      triggerType:
          (json['triggerType'] as String?)?.let(TriggerType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final description = this.description;
    final destinationConnectorLabel = this.destinationConnectorLabel;
    final destinationConnectorType = this.destinationConnectorType;
    final flowArn = this.flowArn;
    final flowName = this.flowName;
    final flowStatus = this.flowStatus;
    final lastRunExecutionDetails = this.lastRunExecutionDetails;
    final lastUpdatedAt = this.lastUpdatedAt;
    final lastUpdatedBy = this.lastUpdatedBy;
    final sourceConnectorLabel = this.sourceConnectorLabel;
    final sourceConnectorType = this.sourceConnectorType;
    final tags = this.tags;
    final triggerType = this.triggerType;
    return {
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (createdBy != null) 'createdBy': createdBy,
      if (description != null) 'description': description,
      if (destinationConnectorLabel != null)
        'destinationConnectorLabel': destinationConnectorLabel,
      if (destinationConnectorType != null)
        'destinationConnectorType': destinationConnectorType.value,
      if (flowArn != null) 'flowArn': flowArn,
      if (flowName != null) 'flowName': flowName,
      if (flowStatus != null) 'flowStatus': flowStatus.value,
      if (lastRunExecutionDetails != null)
        'lastRunExecutionDetails': lastRunExecutionDetails,
      if (lastUpdatedAt != null)
        'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (lastUpdatedBy != null) 'lastUpdatedBy': lastUpdatedBy,
      if (sourceConnectorLabel != null)
        'sourceConnectorLabel': sourceConnectorLabel,
      if (sourceConnectorType != null)
        'sourceConnectorType': sourceConnectorType.value,
      if (tags != null) 'tags': tags,
      if (triggerType != null) 'triggerType': triggerType.value,
    };
  }
}

enum FlowStatus {
  active('Active'),
  deprecated('Deprecated'),
  deleted('Deleted'),
  draft('Draft'),
  errored('Errored'),
  suspended('Suspended'),
  ;

  final String value;

  const FlowStatus(this.value);

  static FlowStatus fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum FlowStatus'));
}

/// Specifies the configuration that Amazon AppFlow uses when it catalogs your
/// data with the Glue Data Catalog. When Amazon AppFlow catalogs your data, it
/// stores metadata in Data Catalog tables. This metadata represents the data
/// that's transferred by the flow that you configure with these settings.
/// <note>
/// You can configure a flow with these settings only when the flow destination
/// is Amazon S3.
/// </note>
class GlueDataCatalogConfig {
  /// The name of the Data Catalog database that stores the metadata tables that
  /// Amazon AppFlow creates in your Amazon Web Services account. These tables
  /// contain metadata for the data that's transferred by the flow that you
  /// configure with this parameter.
  /// <note>
  /// When you configure a new flow with this parameter, you must specify an
  /// existing database.
  /// </note>
  final String databaseName;

  /// The Amazon Resource Name (ARN) of an IAM role that grants Amazon AppFlow the
  /// permissions it needs to create Data Catalog tables, databases, and
  /// partitions.
  ///
  /// For an example IAM policy that has the required permissions, see <a
  /// href="https://docs.aws.amazon.com/appflow/latest/userguide/security_iam_id-based-policy-examples.html">Identity-based
  /// policy examples for Amazon AppFlow</a>.
  final String roleArn;

  /// A naming prefix for each Data Catalog table that Amazon AppFlow creates for
  /// the flow that you configure with this setting. Amazon AppFlow adds the
  /// prefix to the beginning of the each table name.
  final String tablePrefix;

  GlueDataCatalogConfig({
    required this.databaseName,
    required this.roleArn,
    required this.tablePrefix,
  });

  factory GlueDataCatalogConfig.fromJson(Map<String, dynamic> json) {
    return GlueDataCatalogConfig(
      databaseName: json['databaseName'] as String,
      roleArn: json['roleArn'] as String,
      tablePrefix: json['tablePrefix'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final databaseName = this.databaseName;
    final roleArn = this.roleArn;
    final tablePrefix = this.tablePrefix;
    return {
      'databaseName': databaseName,
      'roleArn': roleArn,
      'tablePrefix': tablePrefix,
    };
  }
}

enum GoogleAnalyticsConnectorOperator {
  projection('PROJECTION'),
  between('BETWEEN'),
  ;

  final String value;

  const GoogleAnalyticsConnectorOperator(this.value);

  static GoogleAnalyticsConnectorOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum GoogleAnalyticsConnectorOperator'));
}

/// The connector-specific profile credentials required by Google Analytics.
class GoogleAnalyticsConnectorProfileCredentials {
  /// The identifier for the desired client.
  final String clientId;

  /// The client secret used by the OAuth client to authenticate to the
  /// authorization server.
  final String clientSecret;

  /// The credentials used to access protected Google Analytics resources.
  final String? accessToken;

  /// The OAuth requirement needed to request security tokens from the connector
  /// endpoint.
  final ConnectorOAuthRequest? oAuthRequest;

  /// The credentials used to acquire new access tokens. This is required only for
  /// OAuth2 access tokens, and is not required for OAuth1 access tokens.
  final String? refreshToken;

  GoogleAnalyticsConnectorProfileCredentials({
    required this.clientId,
    required this.clientSecret,
    this.accessToken,
    this.oAuthRequest,
    this.refreshToken,
  });

  Map<String, dynamic> toJson() {
    final clientId = this.clientId;
    final clientSecret = this.clientSecret;
    final accessToken = this.accessToken;
    final oAuthRequest = this.oAuthRequest;
    final refreshToken = this.refreshToken;
    return {
      'clientId': clientId,
      'clientSecret': clientSecret,
      if (accessToken != null) 'accessToken': accessToken,
      if (oAuthRequest != null) 'oAuthRequest': oAuthRequest,
      if (refreshToken != null) 'refreshToken': refreshToken,
    };
  }
}

/// The connector-specific profile properties required by Google Analytics.
class GoogleAnalyticsConnectorProfileProperties {
  GoogleAnalyticsConnectorProfileProperties();

  factory GoogleAnalyticsConnectorProfileProperties.fromJson(
      Map<String, dynamic> _) {
    return GoogleAnalyticsConnectorProfileProperties();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The connector metadata specific to Google Analytics.
class GoogleAnalyticsMetadata {
  /// The desired authorization scope for the Google Analytics account.
  final List<String>? oAuthScopes;

  GoogleAnalyticsMetadata({
    this.oAuthScopes,
  });

  factory GoogleAnalyticsMetadata.fromJson(Map<String, dynamic> json) {
    return GoogleAnalyticsMetadata(
      oAuthScopes: (json['oAuthScopes'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final oAuthScopes = this.oAuthScopes;
    return {
      if (oAuthScopes != null) 'oAuthScopes': oAuthScopes,
    };
  }
}

/// The properties that are applied when Google Analytics is being used as a
/// source.
class GoogleAnalyticsSourceProperties {
  /// The object specified in the Google Analytics flow source.
  final String object;

  GoogleAnalyticsSourceProperties({
    required this.object,
  });

  factory GoogleAnalyticsSourceProperties.fromJson(Map<String, dynamic> json) {
    return GoogleAnalyticsSourceProperties(
      object: json['object'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final object = this.object;
    return {
      'object': object,
    };
  }
}

/// The connector-specific credentials required when using Amazon Honeycode.
class HoneycodeConnectorProfileCredentials {
  /// The credentials used to access protected Amazon Honeycode resources.
  final String? accessToken;
  final ConnectorOAuthRequest? oAuthRequest;

  /// The credentials used to acquire new access tokens.
  final String? refreshToken;

  HoneycodeConnectorProfileCredentials({
    this.accessToken,
    this.oAuthRequest,
    this.refreshToken,
  });

  Map<String, dynamic> toJson() {
    final accessToken = this.accessToken;
    final oAuthRequest = this.oAuthRequest;
    final refreshToken = this.refreshToken;
    return {
      if (accessToken != null) 'accessToken': accessToken,
      if (oAuthRequest != null) 'oAuthRequest': oAuthRequest,
      if (refreshToken != null) 'refreshToken': refreshToken,
    };
  }
}

/// The connector-specific properties required when using Amazon Honeycode.
class HoneycodeConnectorProfileProperties {
  HoneycodeConnectorProfileProperties();

  factory HoneycodeConnectorProfileProperties.fromJson(Map<String, dynamic> _) {
    return HoneycodeConnectorProfileProperties();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The properties that are applied when Amazon Honeycode is used as a
/// destination.
class HoneycodeDestinationProperties {
  /// The object specified in the Amazon Honeycode flow destination.
  final String object;
  final ErrorHandlingConfig? errorHandlingConfig;

  HoneycodeDestinationProperties({
    required this.object,
    this.errorHandlingConfig,
  });

  factory HoneycodeDestinationProperties.fromJson(Map<String, dynamic> json) {
    return HoneycodeDestinationProperties(
      object: json['object'] as String,
      errorHandlingConfig: json['errorHandlingConfig'] != null
          ? ErrorHandlingConfig.fromJson(
              json['errorHandlingConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final object = this.object;
    final errorHandlingConfig = this.errorHandlingConfig;
    return {
      'object': object,
      if (errorHandlingConfig != null)
        'errorHandlingConfig': errorHandlingConfig,
    };
  }
}

/// The connector metadata specific to Amazon Honeycode.
class HoneycodeMetadata {
  /// The desired authorization scope for the Amazon Honeycode account.
  final List<String>? oAuthScopes;

  HoneycodeMetadata({
    this.oAuthScopes,
  });

  factory HoneycodeMetadata.fromJson(Map<String, dynamic> json) {
    return HoneycodeMetadata(
      oAuthScopes: (json['oAuthScopes'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final oAuthScopes = this.oAuthScopes;
    return {
      if (oAuthScopes != null) 'oAuthScopes': oAuthScopes,
    };
  }
}

/// Specifies the configuration used when importing incremental records from the
/// source.
class IncrementalPullConfig {
  /// A field that specifies the date time or timestamp field as the criteria to
  /// use when importing incremental records from the source.
  final String? datetimeTypeFieldName;

  IncrementalPullConfig({
    this.datetimeTypeFieldName,
  });

  factory IncrementalPullConfig.fromJson(Map<String, dynamic> json) {
    return IncrementalPullConfig(
      datetimeTypeFieldName: json['datetimeTypeFieldName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final datetimeTypeFieldName = this.datetimeTypeFieldName;
    return {
      if (datetimeTypeFieldName != null)
        'datetimeTypeFieldName': datetimeTypeFieldName,
    };
  }
}

enum InforNexusConnectorOperator {
  projection('PROJECTION'),
  between('BETWEEN'),
  equalTo('EQUAL_TO'),
  addition('ADDITION'),
  multiplication('MULTIPLICATION'),
  division('DIVISION'),
  subtraction('SUBTRACTION'),
  maskAll('MASK_ALL'),
  maskFirstN('MASK_FIRST_N'),
  maskLastN('MASK_LAST_N'),
  validateNonNull('VALIDATE_NON_NULL'),
  validateNonZero('VALIDATE_NON_ZERO'),
  validateNonNegative('VALIDATE_NON_NEGATIVE'),
  validateNumeric('VALIDATE_NUMERIC'),
  noOp('NO_OP'),
  ;

  final String value;

  const InforNexusConnectorOperator(this.value);

  static InforNexusConnectorOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum InforNexusConnectorOperator'));
}

/// The connector-specific profile credentials required by Infor Nexus.
class InforNexusConnectorProfileCredentials {
  /// The Access Key portion of the credentials.
  final String accessKeyId;

  /// The encryption keys used to encrypt data.
  final String datakey;

  /// The secret key used to sign requests.
  final String secretAccessKey;

  /// The identifier for the user.
  final String userId;

  InforNexusConnectorProfileCredentials({
    required this.accessKeyId,
    required this.datakey,
    required this.secretAccessKey,
    required this.userId,
  });

  Map<String, dynamic> toJson() {
    final accessKeyId = this.accessKeyId;
    final datakey = this.datakey;
    final secretAccessKey = this.secretAccessKey;
    final userId = this.userId;
    return {
      'accessKeyId': accessKeyId,
      'datakey': datakey,
      'secretAccessKey': secretAccessKey,
      'userId': userId,
    };
  }
}

/// The connector-specific profile properties required by Infor Nexus.
class InforNexusConnectorProfileProperties {
  /// The location of the Infor Nexus resource.
  final String instanceUrl;

  InforNexusConnectorProfileProperties({
    required this.instanceUrl,
  });

  factory InforNexusConnectorProfileProperties.fromJson(
      Map<String, dynamic> json) {
    return InforNexusConnectorProfileProperties(
      instanceUrl: json['instanceUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceUrl = this.instanceUrl;
    return {
      'instanceUrl': instanceUrl,
    };
  }
}

/// The connector metadata specific to Infor Nexus.
class InforNexusMetadata {
  InforNexusMetadata();

  factory InforNexusMetadata.fromJson(Map<String, dynamic> _) {
    return InforNexusMetadata();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The properties that are applied when Infor Nexus is being used as a source.
class InforNexusSourceProperties {
  /// The object specified in the Infor Nexus flow source.
  final String object;

  InforNexusSourceProperties({
    required this.object,
  });

  factory InforNexusSourceProperties.fromJson(Map<String, dynamic> json) {
    return InforNexusSourceProperties(
      object: json['object'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final object = this.object;
    return {
      'object': object,
    };
  }
}

/// Contains information about the configuration of the lambda which is being
/// registered as the connector.
class LambdaConnectorProvisioningConfig {
  /// Lambda ARN of the connector being registered.
  final String lambdaArn;

  LambdaConnectorProvisioningConfig({
    required this.lambdaArn,
  });

  factory LambdaConnectorProvisioningConfig.fromJson(
      Map<String, dynamic> json) {
    return LambdaConnectorProvisioningConfig(
      lambdaArn: json['lambdaArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final lambdaArn = this.lambdaArn;
    return {
      'lambdaArn': lambdaArn,
    };
  }
}

class ListConnectorEntitiesResponse {
  /// The response of <code>ListConnectorEntities</code> lists entities grouped by
  /// category. This map's key represents the group name, and its value contains
  /// the list of entities belonging to that group.
  final Map<String, List<ConnectorEntity>> connectorEntityMap;

  /// A token that you specify in your next <code>ListConnectorEntities</code>
  /// operation to get the next page of results in paginated response. The
  /// <code>ListConnectorEntities</code> operation provides this token if the
  /// response is too big for the page size.
  final String? nextToken;

  ListConnectorEntitiesResponse({
    required this.connectorEntityMap,
    this.nextToken,
  });

  factory ListConnectorEntitiesResponse.fromJson(Map<String, dynamic> json) {
    return ListConnectorEntitiesResponse(
      connectorEntityMap: (json['connectorEntityMap'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(
              k,
              (e as List)
                  .nonNulls
                  .map((e) =>
                      ConnectorEntity.fromJson(e as Map<String, dynamic>))
                  .toList())),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectorEntityMap = this.connectorEntityMap;
    final nextToken = this.nextToken;
    return {
      'connectorEntityMap': connectorEntityMap,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListConnectorsResponse {
  /// Contains information about the connectors supported by Amazon AppFlow.
  final List<ConnectorDetail>? connectors;

  /// The pagination token for the next page of data. If nextToken=null, this
  /// means that all records have been fetched.
  final String? nextToken;

  ListConnectorsResponse({
    this.connectors,
    this.nextToken,
  });

  factory ListConnectorsResponse.fromJson(Map<String, dynamic> json) {
    return ListConnectorsResponse(
      connectors: (json['connectors'] as List?)
          ?.nonNulls
          .map((e) => ConnectorDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectors = this.connectors;
    final nextToken = this.nextToken;
    return {
      if (connectors != null) 'connectors': connectors,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListFlowsResponse {
  /// The list of flows associated with your account.
  final List<FlowDefinition>? flows;

  /// The pagination token for next page of data.
  final String? nextToken;

  ListFlowsResponse({
    this.flows,
    this.nextToken,
  });

  factory ListFlowsResponse.fromJson(Map<String, dynamic> json) {
    return ListFlowsResponse(
      flows: (json['flows'] as List?)
          ?.nonNulls
          .map((e) => FlowDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final flows = this.flows;
    final nextToken = this.nextToken;
    return {
      if (flows != null) 'flows': flows,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// The tags used to organize, track, or control access for your flow.
  final Map<String, String>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
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

/// The properties that are applied when Amazon Lookout for Metrics is used as a
/// destination.
class LookoutMetricsDestinationProperties {
  LookoutMetricsDestinationProperties();

  factory LookoutMetricsDestinationProperties.fromJson(Map<String, dynamic> _) {
    return LookoutMetricsDestinationProperties();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum MarketoConnectorOperator {
  projection('PROJECTION'),
  lessThan('LESS_THAN'),
  greaterThan('GREATER_THAN'),
  between('BETWEEN'),
  addition('ADDITION'),
  multiplication('MULTIPLICATION'),
  division('DIVISION'),
  subtraction('SUBTRACTION'),
  maskAll('MASK_ALL'),
  maskFirstN('MASK_FIRST_N'),
  maskLastN('MASK_LAST_N'),
  validateNonNull('VALIDATE_NON_NULL'),
  validateNonZero('VALIDATE_NON_ZERO'),
  validateNonNegative('VALIDATE_NON_NEGATIVE'),
  validateNumeric('VALIDATE_NUMERIC'),
  noOp('NO_OP'),
  ;

  final String value;

  const MarketoConnectorOperator(this.value);

  static MarketoConnectorOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum MarketoConnectorOperator'));
}

/// The connector-specific profile credentials required by Marketo.
class MarketoConnectorProfileCredentials {
  /// The identifier for the desired client.
  final String clientId;

  /// The client secret used by the OAuth client to authenticate to the
  /// authorization server.
  final String clientSecret;

  /// The credentials used to access protected Marketo resources.
  final String? accessToken;

  /// The OAuth requirement needed to request security tokens from the connector
  /// endpoint.
  final ConnectorOAuthRequest? oAuthRequest;

  MarketoConnectorProfileCredentials({
    required this.clientId,
    required this.clientSecret,
    this.accessToken,
    this.oAuthRequest,
  });

  Map<String, dynamic> toJson() {
    final clientId = this.clientId;
    final clientSecret = this.clientSecret;
    final accessToken = this.accessToken;
    final oAuthRequest = this.oAuthRequest;
    return {
      'clientId': clientId,
      'clientSecret': clientSecret,
      if (accessToken != null) 'accessToken': accessToken,
      if (oAuthRequest != null) 'oAuthRequest': oAuthRequest,
    };
  }
}

/// The connector-specific profile properties required when using Marketo.
class MarketoConnectorProfileProperties {
  /// The location of the Marketo resource.
  final String instanceUrl;

  MarketoConnectorProfileProperties({
    required this.instanceUrl,
  });

  factory MarketoConnectorProfileProperties.fromJson(
      Map<String, dynamic> json) {
    return MarketoConnectorProfileProperties(
      instanceUrl: json['instanceUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceUrl = this.instanceUrl;
    return {
      'instanceUrl': instanceUrl,
    };
  }
}

/// The properties that Amazon AppFlow applies when you use Marketo as a flow
/// destination.
class MarketoDestinationProperties {
  /// The object specified in the Marketo flow destination.
  final String object;
  final ErrorHandlingConfig? errorHandlingConfig;

  MarketoDestinationProperties({
    required this.object,
    this.errorHandlingConfig,
  });

  factory MarketoDestinationProperties.fromJson(Map<String, dynamic> json) {
    return MarketoDestinationProperties(
      object: json['object'] as String,
      errorHandlingConfig: json['errorHandlingConfig'] != null
          ? ErrorHandlingConfig.fromJson(
              json['errorHandlingConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final object = this.object;
    final errorHandlingConfig = this.errorHandlingConfig;
    return {
      'object': object,
      if (errorHandlingConfig != null)
        'errorHandlingConfig': errorHandlingConfig,
    };
  }
}

/// The connector metadata specific to Marketo.
class MarketoMetadata {
  MarketoMetadata();

  factory MarketoMetadata.fromJson(Map<String, dynamic> _) {
    return MarketoMetadata();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The properties that are applied when Marketo is being used as a source.
class MarketoSourceProperties {
  /// The object specified in the Marketo flow source.
  final String object;

  MarketoSourceProperties({
    required this.object,
  });

  factory MarketoSourceProperties.fromJson(Map<String, dynamic> json) {
    return MarketoSourceProperties(
      object: json['object'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final object = this.object;
    return {
      'object': object,
    };
  }
}

/// Specifies the configuration that Amazon AppFlow uses when it catalogs your
/// data. When Amazon AppFlow catalogs your data, it stores metadata in a data
/// catalog.
class MetadataCatalogConfig {
  /// Specifies the configuration that Amazon AppFlow uses when it catalogs your
  /// data with the Glue Data Catalog.
  final GlueDataCatalogConfig? glueDataCatalog;

  MetadataCatalogConfig({
    this.glueDataCatalog,
  });

  factory MetadataCatalogConfig.fromJson(Map<String, dynamic> json) {
    return MetadataCatalogConfig(
      glueDataCatalog: json['glueDataCatalog'] != null
          ? GlueDataCatalogConfig.fromJson(
              json['glueDataCatalog'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final glueDataCatalog = this.glueDataCatalog;
    return {
      if (glueDataCatalog != null) 'glueDataCatalog': glueDataCatalog,
    };
  }
}

/// Describes the metadata catalog, metadata table, and data partitions that
/// Amazon AppFlow used for the associated flow run.
class MetadataCatalogDetail {
  /// The type of metadata catalog that Amazon AppFlow used for the associated
  /// flow run. This parameter returns the following value:
  /// <dl> <dt>GLUE</dt> <dd>
  /// The metadata catalog is provided by the Glue Data Catalog. Glue includes the
  /// Glue Data Catalog as a component.
  /// </dd> </dl>
  final CatalogType? catalogType;

  /// Describes the status of the attempt from Amazon AppFlow to register the data
  /// partitions with the metadata catalog. The data partitions organize the flow
  /// output into a hierarchical path, such as a folder path in an S3 bucket.
  /// Amazon AppFlow creates the partitions (if they don't already exist) based on
  /// your flow configuration.
  final RegistrationOutput? partitionRegistrationOutput;

  /// The name of the table that stores the metadata for the associated flow run.
  /// The table stores metadata that represents the data that the flow
  /// transferred. Amazon AppFlow stores the table in the metadata catalog.
  final String? tableName;

  /// Describes the status of the attempt from Amazon AppFlow to register the
  /// metadata table with the metadata catalog. Amazon AppFlow creates or updates
  /// this table for the associated flow run.
  final RegistrationOutput? tableRegistrationOutput;

  MetadataCatalogDetail({
    this.catalogType,
    this.partitionRegistrationOutput,
    this.tableName,
    this.tableRegistrationOutput,
  });

  factory MetadataCatalogDetail.fromJson(Map<String, dynamic> json) {
    return MetadataCatalogDetail(
      catalogType:
          (json['catalogType'] as String?)?.let(CatalogType.fromString),
      partitionRegistrationOutput: json['partitionRegistrationOutput'] != null
          ? RegistrationOutput.fromJson(
              json['partitionRegistrationOutput'] as Map<String, dynamic>)
          : null,
      tableName: json['tableName'] as String?,
      tableRegistrationOutput: json['tableRegistrationOutput'] != null
          ? RegistrationOutput.fromJson(
              json['tableRegistrationOutput'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final catalogType = this.catalogType;
    final partitionRegistrationOutput = this.partitionRegistrationOutput;
    final tableName = this.tableName;
    final tableRegistrationOutput = this.tableRegistrationOutput;
    return {
      if (catalogType != null) 'catalogType': catalogType.value,
      if (partitionRegistrationOutput != null)
        'partitionRegistrationOutput': partitionRegistrationOutput,
      if (tableName != null) 'tableName': tableName,
      if (tableRegistrationOutput != null)
        'tableRegistrationOutput': tableRegistrationOutput,
    };
  }
}

/// The OAuth 2.0 credentials required for OAuth 2.0 authentication.
class OAuth2Credentials {
  /// The access token used to access the connector on your behalf.
  final String? accessToken;

  /// The identifier for the desired client.
  final String? clientId;

  /// The client secret used by the OAuth client to authenticate to the
  /// authorization server.
  final String? clientSecret;
  final ConnectorOAuthRequest? oAuthRequest;

  /// The refresh token used to refresh an expired access token.
  final String? refreshToken;

  OAuth2Credentials({
    this.accessToken,
    this.clientId,
    this.clientSecret,
    this.oAuthRequest,
    this.refreshToken,
  });

  Map<String, dynamic> toJson() {
    final accessToken = this.accessToken;
    final clientId = this.clientId;
    final clientSecret = this.clientSecret;
    final oAuthRequest = this.oAuthRequest;
    final refreshToken = this.refreshToken;
    return {
      if (accessToken != null) 'accessToken': accessToken,
      if (clientId != null) 'clientId': clientId,
      if (clientSecret != null) 'clientSecret': clientSecret,
      if (oAuthRequest != null) 'oAuthRequest': oAuthRequest,
      if (refreshToken != null) 'refreshToken': refreshToken,
    };
  }
}

/// Custom parameter required for OAuth 2.0 authentication.
class OAuth2CustomParameter {
  /// Contains default values for this authentication parameter that are supplied
  /// by the connector.
  final List<String>? connectorSuppliedValues;

  /// A description about the custom parameter used for OAuth 2.0 authentication.
  final String? description;

  /// Indicates whether the custom parameter for OAuth 2.0 authentication is
  /// required.
  final bool? isRequired;

  /// Indicates whether this authentication custom parameter is a sensitive field.
  final bool? isSensitiveField;

  /// The key of the custom parameter required for OAuth 2.0 authentication.
  final String? key;

  /// The label of the custom parameter used for OAuth 2.0 authentication.
  final String? label;

  /// Indicates whether custom parameter is used with TokenUrl or AuthUrl.
  final OAuth2CustomPropType? type;

  OAuth2CustomParameter({
    this.connectorSuppliedValues,
    this.description,
    this.isRequired,
    this.isSensitiveField,
    this.key,
    this.label,
    this.type,
  });

  factory OAuth2CustomParameter.fromJson(Map<String, dynamic> json) {
    return OAuth2CustomParameter(
      connectorSuppliedValues: (json['connectorSuppliedValues'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      description: json['description'] as String?,
      isRequired: json['isRequired'] as bool?,
      isSensitiveField: json['isSensitiveField'] as bool?,
      key: json['key'] as String?,
      label: json['label'] as String?,
      type: (json['type'] as String?)?.let(OAuth2CustomPropType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final connectorSuppliedValues = this.connectorSuppliedValues;
    final description = this.description;
    final isRequired = this.isRequired;
    final isSensitiveField = this.isSensitiveField;
    final key = this.key;
    final label = this.label;
    final type = this.type;
    return {
      if (connectorSuppliedValues != null)
        'connectorSuppliedValues': connectorSuppliedValues,
      if (description != null) 'description': description,
      if (isRequired != null) 'isRequired': isRequired,
      if (isSensitiveField != null) 'isSensitiveField': isSensitiveField,
      if (key != null) 'key': key,
      if (label != null) 'label': label,
      if (type != null) 'type': type.value,
    };
  }
}

enum OAuth2CustomPropType {
  tokenUrl('TOKEN_URL'),
  authUrl('AUTH_URL'),
  ;

  final String value;

  const OAuth2CustomPropType(this.value);

  static OAuth2CustomPropType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum OAuth2CustomPropType'));
}

/// Contains the default values required for OAuth 2.0 authentication.
class OAuth2Defaults {
  /// Auth code URLs that can be used for OAuth 2.0 authentication.
  final List<String>? authCodeUrls;

  /// List of custom parameters required for OAuth 2.0 authentication.
  final List<OAuth2CustomParameter>? oauth2CustomProperties;

  /// OAuth 2.0 grant types supported by the connector.
  final List<OAuth2GrantType>? oauth2GrantTypesSupported;

  /// OAuth 2.0 scopes that the connector supports.
  final List<String>? oauthScopes;

  /// Token URLs that can be used for OAuth 2.0 authentication.
  final List<String>? tokenUrls;

  OAuth2Defaults({
    this.authCodeUrls,
    this.oauth2CustomProperties,
    this.oauth2GrantTypesSupported,
    this.oauthScopes,
    this.tokenUrls,
  });

  factory OAuth2Defaults.fromJson(Map<String, dynamic> json) {
    return OAuth2Defaults(
      authCodeUrls: (json['authCodeUrls'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      oauth2CustomProperties: (json['oauth2CustomProperties'] as List?)
          ?.nonNulls
          .map((e) => OAuth2CustomParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
      oauth2GrantTypesSupported: (json['oauth2GrantTypesSupported'] as List?)
          ?.nonNulls
          .map((e) => OAuth2GrantType.fromString((e as String)))
          .toList(),
      oauthScopes: (json['oauthScopes'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      tokenUrls: (json['tokenUrls'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final authCodeUrls = this.authCodeUrls;
    final oauth2CustomProperties = this.oauth2CustomProperties;
    final oauth2GrantTypesSupported = this.oauth2GrantTypesSupported;
    final oauthScopes = this.oauthScopes;
    final tokenUrls = this.tokenUrls;
    return {
      if (authCodeUrls != null) 'authCodeUrls': authCodeUrls,
      if (oauth2CustomProperties != null)
        'oauth2CustomProperties': oauth2CustomProperties,
      if (oauth2GrantTypesSupported != null)
        'oauth2GrantTypesSupported':
            oauth2GrantTypesSupported.map((e) => e.value).toList(),
      if (oauthScopes != null) 'oauthScopes': oauthScopes,
      if (tokenUrls != null) 'tokenUrls': tokenUrls,
    };
  }
}

enum OAuth2GrantType {
  clientCredentials('CLIENT_CREDENTIALS'),
  authorizationCode('AUTHORIZATION_CODE'),
  jwtBearer('JWT_BEARER'),
  ;

  final String value;

  const OAuth2GrantType(this.value);

  static OAuth2GrantType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum OAuth2GrantType'));
}

/// The OAuth 2.0 properties required for OAuth 2.0 authentication.
class OAuth2Properties {
  /// The OAuth 2.0 grant type used by connector for OAuth 2.0 authentication.
  final OAuth2GrantType oAuth2GrantType;

  /// The token URL required for OAuth 2.0 authentication.
  final String tokenUrl;

  /// Associates your token URL with a map of properties that you define. Use this
  /// parameter to provide any additional details that the connector requires to
  /// authenticate your request.
  final Map<String, String>? tokenUrlCustomProperties;

  OAuth2Properties({
    required this.oAuth2GrantType,
    required this.tokenUrl,
    this.tokenUrlCustomProperties,
  });

  factory OAuth2Properties.fromJson(Map<String, dynamic> json) {
    return OAuth2Properties(
      oAuth2GrantType:
          OAuth2GrantType.fromString((json['oAuth2GrantType'] as String)),
      tokenUrl: json['tokenUrl'] as String,
      tokenUrlCustomProperties:
          (json['tokenUrlCustomProperties'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final oAuth2GrantType = this.oAuth2GrantType;
    final tokenUrl = this.tokenUrl;
    final tokenUrlCustomProperties = this.tokenUrlCustomProperties;
    return {
      'oAuth2GrantType': oAuth2GrantType.value,
      'tokenUrl': tokenUrl,
      if (tokenUrlCustomProperties != null)
        'tokenUrlCustomProperties': tokenUrlCustomProperties,
    };
  }
}

/// The OAuth credentials required for OAuth type authentication.
class OAuthCredentials {
  /// The identifier for the desired client.
  final String clientId;

  /// The client secret used by the OAuth client to authenticate to the
  /// authorization server.
  final String clientSecret;

  /// The access token used to access protected SAPOData resources.
  final String? accessToken;

  /// The OAuth requirement needed to request security tokens from the connector
  /// endpoint.
  final ConnectorOAuthRequest? oAuthRequest;

  /// The refresh token used to refresh expired access token.
  final String? refreshToken;

  OAuthCredentials({
    required this.clientId,
    required this.clientSecret,
    this.accessToken,
    this.oAuthRequest,
    this.refreshToken,
  });

  Map<String, dynamic> toJson() {
    final clientId = this.clientId;
    final clientSecret = this.clientSecret;
    final accessToken = this.accessToken;
    final oAuthRequest = this.oAuthRequest;
    final refreshToken = this.refreshToken;
    return {
      'clientId': clientId,
      'clientSecret': clientSecret,
      if (accessToken != null) 'accessToken': accessToken,
      if (oAuthRequest != null) 'oAuthRequest': oAuthRequest,
      if (refreshToken != null) 'refreshToken': refreshToken,
    };
  }
}

/// The OAuth properties required for OAuth type authentication.
class OAuthProperties {
  /// The authorization code url required to redirect to SAP Login Page to fetch
  /// authorization code for OAuth type authentication.
  final String authCodeUrl;

  /// The OAuth scopes required for OAuth type authentication.
  final List<String> oAuthScopes;

  /// The token url required to fetch access/refresh tokens using authorization
  /// code and also to refresh expired access token using refresh token.
  final String tokenUrl;

  OAuthProperties({
    required this.authCodeUrl,
    required this.oAuthScopes,
    required this.tokenUrl,
  });

  factory OAuthProperties.fromJson(Map<String, dynamic> json) {
    return OAuthProperties(
      authCodeUrl: json['authCodeUrl'] as String,
      oAuthScopes: (json['oAuthScopes'] as List)
          .nonNulls
          .map((e) => e as String)
          .toList(),
      tokenUrl: json['tokenUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final authCodeUrl = this.authCodeUrl;
    final oAuthScopes = this.oAuthScopes;
    final tokenUrl = this.tokenUrl;
    return {
      'authCodeUrl': authCodeUrl,
      'oAuthScopes': oAuthScopes,
      'tokenUrl': tokenUrl,
    };
  }
}

enum Operator {
  projection('PROJECTION'),
  lessThan('LESS_THAN'),
  greaterThan('GREATER_THAN'),
  contains('CONTAINS'),
  between('BETWEEN'),
  lessThanOrEqualTo('LESS_THAN_OR_EQUAL_TO'),
  greaterThanOrEqualTo('GREATER_THAN_OR_EQUAL_TO'),
  equalTo('EQUAL_TO'),
  notEqualTo('NOT_EQUAL_TO'),
  addition('ADDITION'),
  multiplication('MULTIPLICATION'),
  division('DIVISION'),
  subtraction('SUBTRACTION'),
  maskAll('MASK_ALL'),
  maskFirstN('MASK_FIRST_N'),
  maskLastN('MASK_LAST_N'),
  validateNonNull('VALIDATE_NON_NULL'),
  validateNonZero('VALIDATE_NON_ZERO'),
  validateNonNegative('VALIDATE_NON_NEGATIVE'),
  validateNumeric('VALIDATE_NUMERIC'),
  noOp('NO_OP'),
  ;

  final String value;

  const Operator(this.value);

  static Operator fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum Operator'));
}

enum OperatorPropertiesKeys {
  $value('VALUE'),
  $values('VALUES'),
  dataType('DATA_TYPE'),
  upperBound('UPPER_BOUND'),
  lowerBound('LOWER_BOUND'),
  sourceDataType('SOURCE_DATA_TYPE'),
  destinationDataType('DESTINATION_DATA_TYPE'),
  validationAction('VALIDATION_ACTION'),
  maskValue('MASK_VALUE'),
  maskLength('MASK_LENGTH'),
  truncateLength('TRUNCATE_LENGTH'),
  mathOperationFieldsOrder('MATH_OPERATION_FIELDS_ORDER'),
  concatFormat('CONCAT_FORMAT'),
  subfieldCategoryMap('SUBFIELD_CATEGORY_MAP'),
  excludeSourceFieldsList('EXCLUDE_SOURCE_FIELDS_LIST'),
  includeNewFields('INCLUDE_NEW_FIELDS'),
  orderedPartitionKeysList('ORDERED_PARTITION_KEYS_LIST'),
  ;

  final String value;

  const OperatorPropertiesKeys(this.value);

  static OperatorPropertiesKeys fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum OperatorPropertiesKeys'));
}

enum Operators {
  projection('PROJECTION'),
  lessThan('LESS_THAN'),
  greaterThan('GREATER_THAN'),
  contains('CONTAINS'),
  between('BETWEEN'),
  lessThanOrEqualTo('LESS_THAN_OR_EQUAL_TO'),
  greaterThanOrEqualTo('GREATER_THAN_OR_EQUAL_TO'),
  equalTo('EQUAL_TO'),
  notEqualTo('NOT_EQUAL_TO'),
  addition('ADDITION'),
  multiplication('MULTIPLICATION'),
  division('DIVISION'),
  subtraction('SUBTRACTION'),
  maskAll('MASK_ALL'),
  maskFirstN('MASK_FIRST_N'),
  maskLastN('MASK_LAST_N'),
  validateNonNull('VALIDATE_NON_NULL'),
  validateNonZero('VALIDATE_NON_ZERO'),
  validateNonNegative('VALIDATE_NON_NEGATIVE'),
  validateNumeric('VALIDATE_NUMERIC'),
  noOp('NO_OP'),
  ;

  final String value;

  const Operators(this.value);

  static Operators fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum Operators'));
}

enum PardotConnectorOperator {
  projection('PROJECTION'),
  equalTo('EQUAL_TO'),
  noOp('NO_OP'),
  addition('ADDITION'),
  multiplication('MULTIPLICATION'),
  division('DIVISION'),
  subtraction('SUBTRACTION'),
  maskAll('MASK_ALL'),
  maskFirstN('MASK_FIRST_N'),
  maskLastN('MASK_LAST_N'),
  validateNonNull('VALIDATE_NON_NULL'),
  validateNonZero('VALIDATE_NON_ZERO'),
  validateNonNegative('VALIDATE_NON_NEGATIVE'),
  validateNumeric('VALIDATE_NUMERIC'),
  ;

  final String value;

  const PardotConnectorOperator(this.value);

  static PardotConnectorOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum PardotConnectorOperator'));
}

/// The connector-specific profile credentials required when using Salesforce
/// Pardot.
class PardotConnectorProfileCredentials {
  /// The credentials used to access protected Salesforce Pardot resources.
  final String? accessToken;

  /// The secret manager ARN, which contains the client ID and client secret of
  /// the connected app.
  final String? clientCredentialsArn;
  final ConnectorOAuthRequest? oAuthRequest;

  /// The credentials used to acquire new access tokens.
  final String? refreshToken;

  PardotConnectorProfileCredentials({
    this.accessToken,
    this.clientCredentialsArn,
    this.oAuthRequest,
    this.refreshToken,
  });

  Map<String, dynamic> toJson() {
    final accessToken = this.accessToken;
    final clientCredentialsArn = this.clientCredentialsArn;
    final oAuthRequest = this.oAuthRequest;
    final refreshToken = this.refreshToken;
    return {
      if (accessToken != null) 'accessToken': accessToken,
      if (clientCredentialsArn != null)
        'clientCredentialsArn': clientCredentialsArn,
      if (oAuthRequest != null) 'oAuthRequest': oAuthRequest,
      if (refreshToken != null) 'refreshToken': refreshToken,
    };
  }
}

/// The connector-specific profile properties required when using Salesforce
/// Pardot.
class PardotConnectorProfileProperties {
  /// The business unit id of Salesforce Pardot instance.
  final String? businessUnitId;

  /// The location of the Salesforce Pardot resource.
  final String? instanceUrl;

  /// Indicates whether the connector profile applies to a sandbox or production
  /// environment.
  final bool? isSandboxEnvironment;

  PardotConnectorProfileProperties({
    this.businessUnitId,
    this.instanceUrl,
    this.isSandboxEnvironment,
  });

  factory PardotConnectorProfileProperties.fromJson(Map<String, dynamic> json) {
    return PardotConnectorProfileProperties(
      businessUnitId: json['businessUnitId'] as String?,
      instanceUrl: json['instanceUrl'] as String?,
      isSandboxEnvironment: json['isSandboxEnvironment'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final businessUnitId = this.businessUnitId;
    final instanceUrl = this.instanceUrl;
    final isSandboxEnvironment = this.isSandboxEnvironment;
    return {
      if (businessUnitId != null) 'businessUnitId': businessUnitId,
      if (instanceUrl != null) 'instanceUrl': instanceUrl,
      if (isSandboxEnvironment != null)
        'isSandboxEnvironment': isSandboxEnvironment,
    };
  }
}

/// The connector metadata specific to Salesforce Pardot.
class PardotMetadata {
  PardotMetadata();

  factory PardotMetadata.fromJson(Map<String, dynamic> _) {
    return PardotMetadata();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The properties that are applied when Salesforce Pardot is being used as a
/// source.
class PardotSourceProperties {
  /// The object specified in the Salesforce Pardot flow source.
  final String object;

  PardotSourceProperties({
    required this.object,
  });

  factory PardotSourceProperties.fromJson(Map<String, dynamic> json) {
    return PardotSourceProperties(
      object: json['object'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final object = this.object;
    return {
      'object': object,
    };
  }
}

enum PathPrefix {
  executionId('EXECUTION_ID'),
  schemaVersion('SCHEMA_VERSION'),
  ;

  final String value;

  const PathPrefix(this.value);

  static PathPrefix fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum PathPrefix'));
}

/// Specifies elements that Amazon AppFlow includes in the file and folder names
/// in the flow destination.
class PrefixConfig {
  /// Specifies whether the destination file path includes either or both of the
  /// following elements:
  /// <dl> <dt>EXECUTION_ID</dt> <dd>
  /// The ID that Amazon AppFlow assigns to the flow run.
  /// </dd> <dt>SCHEMA_VERSION</dt> <dd>
  /// The version number of your data schema. Amazon AppFlow assigns this version
  /// number. The version number increases by one when you change any of the
  /// following settings in your flow configuration:
  ///
  /// <ul>
  /// <li>
  /// Source-to-destination field mappings
  /// </li>
  /// <li>
  /// Field data types
  /// </li>
  /// <li>
  /// Partition keys
  /// </li>
  /// </ul> </dd> </dl>
  final List<PathPrefix>? pathPrefixHierarchy;

  /// Determines the level of granularity for the date and time that's included in
  /// the prefix.
  final PrefixFormat? prefixFormat;

  /// Determines the format of the prefix, and whether it applies to the file
  /// name, file path, or both.
  final PrefixType? prefixType;

  PrefixConfig({
    this.pathPrefixHierarchy,
    this.prefixFormat,
    this.prefixType,
  });

  factory PrefixConfig.fromJson(Map<String, dynamic> json) {
    return PrefixConfig(
      pathPrefixHierarchy: (json['pathPrefixHierarchy'] as List?)
          ?.nonNulls
          .map((e) => PathPrefix.fromString((e as String)))
          .toList(),
      prefixFormat:
          (json['prefixFormat'] as String?)?.let(PrefixFormat.fromString),
      prefixType: (json['prefixType'] as String?)?.let(PrefixType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final pathPrefixHierarchy = this.pathPrefixHierarchy;
    final prefixFormat = this.prefixFormat;
    final prefixType = this.prefixType;
    return {
      if (pathPrefixHierarchy != null)
        'pathPrefixHierarchy': pathPrefixHierarchy.map((e) => e.value).toList(),
      if (prefixFormat != null) 'prefixFormat': prefixFormat.value,
      if (prefixType != null) 'prefixType': prefixType.value,
    };
  }
}

enum PrefixFormat {
  year('YEAR'),
  month('MONTH'),
  day('DAY'),
  hour('HOUR'),
  minute('MINUTE'),
  ;

  final String value;

  const PrefixFormat(this.value);

  static PrefixFormat fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum PrefixFormat'));
}

enum PrefixType {
  filename('FILENAME'),
  path('PATH'),
  pathAndFilename('PATH_AND_FILENAME'),
  ;

  final String value;

  const PrefixType(this.value);

  static PrefixType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum PrefixType'));
}

enum PrivateConnectionProvisioningFailureCause {
  connectorAuthentication('CONNECTOR_AUTHENTICATION'),
  connectorServer('CONNECTOR_SERVER'),
  internalServer('INTERNAL_SERVER'),
  accessDenied('ACCESS_DENIED'),
  validation('VALIDATION'),
  ;

  final String value;

  const PrivateConnectionProvisioningFailureCause(this.value);

  static PrivateConnectionProvisioningFailureCause fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum PrivateConnectionProvisioningFailureCause'));
}

/// Specifies the private connection provisioning state.
class PrivateConnectionProvisioningState {
  /// Specifies the private connection provisioning failure cause.
  final PrivateConnectionProvisioningFailureCause? failureCause;

  /// Specifies the private connection provisioning failure reason.
  final String? failureMessage;

  /// Specifies the private connection provisioning status.
  final PrivateConnectionProvisioningStatus? status;

  PrivateConnectionProvisioningState({
    this.failureCause,
    this.failureMessage,
    this.status,
  });

  factory PrivateConnectionProvisioningState.fromJson(
      Map<String, dynamic> json) {
    return PrivateConnectionProvisioningState(
      failureCause: (json['failureCause'] as String?)
          ?.let(PrivateConnectionProvisioningFailureCause.fromString),
      failureMessage: json['failureMessage'] as String?,
      status: (json['status'] as String?)
          ?.let(PrivateConnectionProvisioningStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final failureCause = this.failureCause;
    final failureMessage = this.failureMessage;
    final status = this.status;
    return {
      if (failureCause != null) 'failureCause': failureCause.value,
      if (failureMessage != null) 'failureMessage': failureMessage,
      if (status != null) 'status': status.value,
    };
  }
}

enum PrivateConnectionProvisioningStatus {
  failed('FAILED'),
  pending('PENDING'),
  created('CREATED'),
  ;

  final String value;

  const PrivateConnectionProvisioningStatus(this.value);

  static PrivateConnectionProvisioningStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum PrivateConnectionProvisioningStatus'));
}

/// The range of values that the property supports.
class Range {
  /// Maximum value supported by the field.
  final double? maximum;

  /// Minimum value supported by the field.
  final double? minimum;

  Range({
    this.maximum,
    this.minimum,
  });

  factory Range.fromJson(Map<String, dynamic> json) {
    return Range(
      maximum: json['maximum'] as double?,
      minimum: json['minimum'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final maximum = this.maximum;
    final minimum = this.minimum;
    return {
      if (maximum != null) 'maximum': maximum,
      if (minimum != null) 'minimum': minimum,
    };
  }
}

/// The connector-specific profile credentials required when using Amazon
/// Redshift.
class RedshiftConnectorProfileCredentials {
  /// The password that corresponds to the user name.
  final String? password;

  /// The name of the user.
  final String? username;

  RedshiftConnectorProfileCredentials({
    this.password,
    this.username,
  });

  Map<String, dynamic> toJson() {
    final password = this.password;
    final username = this.username;
    return {
      if (password != null) 'password': password,
      if (username != null) 'username': username,
    };
  }
}

/// The connector-specific profile properties when using Amazon Redshift.
class RedshiftConnectorProfileProperties {
  /// A name for the associated Amazon S3 bucket.
  final String bucketName;

  /// The Amazon Resource Name (ARN) of IAM role that grants Amazon Redshift
  /// read-only access to Amazon S3. For more information, and for the polices
  /// that you attach to this role, see <a
  /// href="https://docs.aws.amazon.com/appflow/latest/userguide/security_iam_service-role-policies.html#redshift-access-s3">Allow
  /// Amazon Redshift to access your Amazon AppFlow data in Amazon S3</a>.
  final String roleArn;

  /// The object key for the destination bucket in which Amazon AppFlow places the
  /// files.
  final String? bucketPrefix;

  /// The unique ID that's assigned to an Amazon Redshift cluster.
  final String? clusterIdentifier;

  /// The Amazon Resource Name (ARN) of an IAM role that permits Amazon AppFlow to
  /// access your Amazon Redshift database through the Data API. For more
  /// information, and for the polices that you attach to this role, see <a
  /// href="https://docs.aws.amazon.com/appflow/latest/userguide/security_iam_service-role-policies.html#access-redshift">Allow
  /// Amazon AppFlow to access Amazon Redshift databases with the Data API</a>.
  final String? dataApiRoleArn;

  /// The name of an Amazon Redshift database.
  final String? databaseName;

  /// The JDBC URL of the Amazon Redshift cluster.
  final String? databaseUrl;

  /// Indicates whether the connector profile defines a connection to an Amazon
  /// Redshift Serverless data warehouse.
  final bool? isRedshiftServerless;

  /// The name of an Amazon Redshift workgroup.
  final String? workgroupName;

  RedshiftConnectorProfileProperties({
    required this.bucketName,
    required this.roleArn,
    this.bucketPrefix,
    this.clusterIdentifier,
    this.dataApiRoleArn,
    this.databaseName,
    this.databaseUrl,
    this.isRedshiftServerless,
    this.workgroupName,
  });

  factory RedshiftConnectorProfileProperties.fromJson(
      Map<String, dynamic> json) {
    return RedshiftConnectorProfileProperties(
      bucketName: json['bucketName'] as String,
      roleArn: json['roleArn'] as String,
      bucketPrefix: json['bucketPrefix'] as String?,
      clusterIdentifier: json['clusterIdentifier'] as String?,
      dataApiRoleArn: json['dataApiRoleArn'] as String?,
      databaseName: json['databaseName'] as String?,
      databaseUrl: json['databaseUrl'] as String?,
      isRedshiftServerless: json['isRedshiftServerless'] as bool?,
      workgroupName: json['workgroupName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final roleArn = this.roleArn;
    final bucketPrefix = this.bucketPrefix;
    final clusterIdentifier = this.clusterIdentifier;
    final dataApiRoleArn = this.dataApiRoleArn;
    final databaseName = this.databaseName;
    final databaseUrl = this.databaseUrl;
    final isRedshiftServerless = this.isRedshiftServerless;
    final workgroupName = this.workgroupName;
    return {
      'bucketName': bucketName,
      'roleArn': roleArn,
      if (bucketPrefix != null) 'bucketPrefix': bucketPrefix,
      if (clusterIdentifier != null) 'clusterIdentifier': clusterIdentifier,
      if (dataApiRoleArn != null) 'dataApiRoleArn': dataApiRoleArn,
      if (databaseName != null) 'databaseName': databaseName,
      if (databaseUrl != null) 'databaseUrl': databaseUrl,
      if (isRedshiftServerless != null)
        'isRedshiftServerless': isRedshiftServerless,
      if (workgroupName != null) 'workgroupName': workgroupName,
    };
  }
}

/// The properties that are applied when Amazon Redshift is being used as a
/// destination.
class RedshiftDestinationProperties {
  /// The intermediate bucket that Amazon AppFlow uses when moving data into
  /// Amazon Redshift.
  final String intermediateBucketName;

  /// The object specified in the Amazon Redshift flow destination.
  final String object;

  /// The object key for the bucket in which Amazon AppFlow places the destination
  /// files.
  final String? bucketPrefix;

  /// The settings that determine how Amazon AppFlow handles an error when placing
  /// data in the Amazon Redshift destination. For example, this setting would
  /// determine if the flow should fail after one insertion error, or continue and
  /// attempt to insert every record regardless of the initial failure.
  /// <code>ErrorHandlingConfig</code> is a part of the destination connector
  /// details.
  final ErrorHandlingConfig? errorHandlingConfig;

  RedshiftDestinationProperties({
    required this.intermediateBucketName,
    required this.object,
    this.bucketPrefix,
    this.errorHandlingConfig,
  });

  factory RedshiftDestinationProperties.fromJson(Map<String, dynamic> json) {
    return RedshiftDestinationProperties(
      intermediateBucketName: json['intermediateBucketName'] as String,
      object: json['object'] as String,
      bucketPrefix: json['bucketPrefix'] as String?,
      errorHandlingConfig: json['errorHandlingConfig'] != null
          ? ErrorHandlingConfig.fromJson(
              json['errorHandlingConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final intermediateBucketName = this.intermediateBucketName;
    final object = this.object;
    final bucketPrefix = this.bucketPrefix;
    final errorHandlingConfig = this.errorHandlingConfig;
    return {
      'intermediateBucketName': intermediateBucketName,
      'object': object,
      if (bucketPrefix != null) 'bucketPrefix': bucketPrefix,
      if (errorHandlingConfig != null)
        'errorHandlingConfig': errorHandlingConfig,
    };
  }
}

/// The connector metadata specific to Amazon Redshift.
class RedshiftMetadata {
  RedshiftMetadata();

  factory RedshiftMetadata.fromJson(Map<String, dynamic> _) {
    return RedshiftMetadata();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class RegisterConnectorResponse {
  /// The ARN of the connector being registered.
  final String? connectorArn;

  RegisterConnectorResponse({
    this.connectorArn,
  });

  factory RegisterConnectorResponse.fromJson(Map<String, dynamic> json) {
    return RegisterConnectorResponse(
      connectorArn: json['connectorArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectorArn = this.connectorArn;
    return {
      if (connectorArn != null) 'connectorArn': connectorArn,
    };
  }
}

/// Describes the status of an attempt from Amazon AppFlow to register a
/// resource.
///
/// When you run a flow that you've configured to use a metadata catalog, Amazon
/// AppFlow registers a metadata table and data partitions with that catalog.
/// This operation provides the status of that registration attempt. The
/// operation also indicates how many related resources Amazon AppFlow created
/// or updated.
class RegistrationOutput {
  /// Explains the status of the registration attempt from Amazon AppFlow. If the
  /// attempt fails, the message explains why.
  final String? message;

  /// Indicates the number of resources that Amazon AppFlow created or updated.
  /// Possible resources include metadata tables and data partitions.
  final String? result;

  /// Indicates the status of the registration attempt from Amazon AppFlow.
  final ExecutionStatus? status;

  RegistrationOutput({
    this.message,
    this.result,
    this.status,
  });

  factory RegistrationOutput.fromJson(Map<String, dynamic> json) {
    return RegistrationOutput(
      message: json['message'] as String?,
      result: json['result'] as String?,
      status: (json['status'] as String?)?.let(ExecutionStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final result = this.result;
    final status = this.status;
    return {
      if (message != null) 'message': message,
      if (result != null) 'result': result,
      if (status != null) 'status': status.value,
    };
  }
}

class ResetConnectorMetadataCacheResponse {
  ResetConnectorMetadataCacheResponse();

  factory ResetConnectorMetadataCacheResponse.fromJson(Map<String, dynamic> _) {
    return ResetConnectorMetadataCacheResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum S3ConnectorOperator {
  projection('PROJECTION'),
  lessThan('LESS_THAN'),
  greaterThan('GREATER_THAN'),
  between('BETWEEN'),
  lessThanOrEqualTo('LESS_THAN_OR_EQUAL_TO'),
  greaterThanOrEqualTo('GREATER_THAN_OR_EQUAL_TO'),
  equalTo('EQUAL_TO'),
  notEqualTo('NOT_EQUAL_TO'),
  addition('ADDITION'),
  multiplication('MULTIPLICATION'),
  division('DIVISION'),
  subtraction('SUBTRACTION'),
  maskAll('MASK_ALL'),
  maskFirstN('MASK_FIRST_N'),
  maskLastN('MASK_LAST_N'),
  validateNonNull('VALIDATE_NON_NULL'),
  validateNonZero('VALIDATE_NON_ZERO'),
  validateNonNegative('VALIDATE_NON_NEGATIVE'),
  validateNumeric('VALIDATE_NUMERIC'),
  noOp('NO_OP'),
  ;

  final String value;

  const S3ConnectorOperator(this.value);

  static S3ConnectorOperator fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum S3ConnectorOperator'));
}

/// The properties that are applied when Amazon S3 is used as a destination.
class S3DestinationProperties {
  /// The Amazon S3 bucket name in which Amazon AppFlow places the transferred
  /// data.
  final String bucketName;

  /// The object key for the destination bucket in which Amazon AppFlow places the
  /// files.
  final String? bucketPrefix;
  final S3OutputFormatConfig? s3OutputFormatConfig;

  S3DestinationProperties({
    required this.bucketName,
    this.bucketPrefix,
    this.s3OutputFormatConfig,
  });

  factory S3DestinationProperties.fromJson(Map<String, dynamic> json) {
    return S3DestinationProperties(
      bucketName: json['bucketName'] as String,
      bucketPrefix: json['bucketPrefix'] as String?,
      s3OutputFormatConfig: json['s3OutputFormatConfig'] != null
          ? S3OutputFormatConfig.fromJson(
              json['s3OutputFormatConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final bucketPrefix = this.bucketPrefix;
    final s3OutputFormatConfig = this.s3OutputFormatConfig;
    return {
      'bucketName': bucketName,
      if (bucketPrefix != null) 'bucketPrefix': bucketPrefix,
      if (s3OutputFormatConfig != null)
        's3OutputFormatConfig': s3OutputFormatConfig,
    };
  }
}

enum S3InputFileType {
  csv('CSV'),
  json('JSON'),
  ;

  final String value;

  const S3InputFileType(this.value);

  static S3InputFileType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum S3InputFileType'));
}

/// When you use Amazon S3 as the source, the configuration format that you
/// provide the flow input data.
class S3InputFormatConfig {
  /// The file type that Amazon AppFlow gets from your Amazon S3 bucket.
  final S3InputFileType? s3InputFileType;

  S3InputFormatConfig({
    this.s3InputFileType,
  });

  factory S3InputFormatConfig.fromJson(Map<String, dynamic> json) {
    return S3InputFormatConfig(
      s3InputFileType:
          (json['s3InputFileType'] as String?)?.let(S3InputFileType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final s3InputFileType = this.s3InputFileType;
    return {
      if (s3InputFileType != null) 's3InputFileType': s3InputFileType.value,
    };
  }
}

/// The connector metadata specific to Amazon S3.
class S3Metadata {
  S3Metadata();

  factory S3Metadata.fromJson(Map<String, dynamic> _) {
    return S3Metadata();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The configuration that determines how Amazon AppFlow should format the flow
/// output data when Amazon S3 is used as the destination.
class S3OutputFormatConfig {
  final AggregationConfig? aggregationConfig;

  /// Indicates the file type that Amazon AppFlow places in the Amazon S3 bucket.
  final FileType? fileType;

  /// Determines the prefix that Amazon AppFlow applies to the folder name in the
  /// Amazon S3 bucket. You can name folders according to the flow frequency and
  /// date.
  final PrefixConfig? prefixConfig;

  /// If your file output format is Parquet, use this parameter to set whether
  /// Amazon AppFlow preserves the data types in your source data when it writes
  /// the output to Amazon S3.
  ///
  /// <ul>
  /// <li>
  /// <code>true</code>: Amazon AppFlow preserves the data types when it writes to
  /// Amazon S3. For example, an integer or <code>1</code> in your source data is
  /// still an integer in your output.
  /// </li>
  /// <li>
  /// <code>false</code>: Amazon AppFlow converts all of the source data into
  /// strings when it writes to Amazon S3. For example, an integer of
  /// <code>1</code> in your source data becomes the string <code>"1"</code> in
  /// the output.
  /// </li>
  /// </ul>
  final bool? preserveSourceDataTyping;

  S3OutputFormatConfig({
    this.aggregationConfig,
    this.fileType,
    this.prefixConfig,
    this.preserveSourceDataTyping,
  });

  factory S3OutputFormatConfig.fromJson(Map<String, dynamic> json) {
    return S3OutputFormatConfig(
      aggregationConfig: json['aggregationConfig'] != null
          ? AggregationConfig.fromJson(
              json['aggregationConfig'] as Map<String, dynamic>)
          : null,
      fileType: (json['fileType'] as String?)?.let(FileType.fromString),
      prefixConfig: json['prefixConfig'] != null
          ? PrefixConfig.fromJson(json['prefixConfig'] as Map<String, dynamic>)
          : null,
      preserveSourceDataTyping: json['preserveSourceDataTyping'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final aggregationConfig = this.aggregationConfig;
    final fileType = this.fileType;
    final prefixConfig = this.prefixConfig;
    final preserveSourceDataTyping = this.preserveSourceDataTyping;
    return {
      if (aggregationConfig != null) 'aggregationConfig': aggregationConfig,
      if (fileType != null) 'fileType': fileType.value,
      if (prefixConfig != null) 'prefixConfig': prefixConfig,
      if (preserveSourceDataTyping != null)
        'preserveSourceDataTyping': preserveSourceDataTyping,
    };
  }
}

/// The properties that are applied when Amazon S3 is being used as the flow
/// source.
class S3SourceProperties {
  /// The Amazon S3 bucket name where the source files are stored.
  final String bucketName;

  /// The object key for the Amazon S3 bucket in which the source files are
  /// stored.
  final String? bucketPrefix;
  final S3InputFormatConfig? s3InputFormatConfig;

  S3SourceProperties({
    required this.bucketName,
    this.bucketPrefix,
    this.s3InputFormatConfig,
  });

  factory S3SourceProperties.fromJson(Map<String, dynamic> json) {
    return S3SourceProperties(
      bucketName: json['bucketName'] as String,
      bucketPrefix: json['bucketPrefix'] as String?,
      s3InputFormatConfig: json['s3InputFormatConfig'] != null
          ? S3InputFormatConfig.fromJson(
              json['s3InputFormatConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final bucketPrefix = this.bucketPrefix;
    final s3InputFormatConfig = this.s3InputFormatConfig;
    return {
      'bucketName': bucketName,
      if (bucketPrefix != null) 'bucketPrefix': bucketPrefix,
      if (s3InputFormatConfig != null)
        's3InputFormatConfig': s3InputFormatConfig,
    };
  }
}

enum SAPODataConnectorOperator {
  projection('PROJECTION'),
  lessThan('LESS_THAN'),
  contains('CONTAINS'),
  greaterThan('GREATER_THAN'),
  between('BETWEEN'),
  lessThanOrEqualTo('LESS_THAN_OR_EQUAL_TO'),
  greaterThanOrEqualTo('GREATER_THAN_OR_EQUAL_TO'),
  equalTo('EQUAL_TO'),
  notEqualTo('NOT_EQUAL_TO'),
  addition('ADDITION'),
  multiplication('MULTIPLICATION'),
  division('DIVISION'),
  subtraction('SUBTRACTION'),
  maskAll('MASK_ALL'),
  maskFirstN('MASK_FIRST_N'),
  maskLastN('MASK_LAST_N'),
  validateNonNull('VALIDATE_NON_NULL'),
  validateNonZero('VALIDATE_NON_ZERO'),
  validateNonNegative('VALIDATE_NON_NEGATIVE'),
  validateNumeric('VALIDATE_NUMERIC'),
  noOp('NO_OP'),
  ;

  final String value;

  const SAPODataConnectorOperator(this.value);

  static SAPODataConnectorOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum SAPODataConnectorOperator'));
}

/// The connector-specific profile credentials required when using SAPOData.
class SAPODataConnectorProfileCredentials {
  /// The SAPOData basic authentication credentials.
  final BasicAuthCredentials? basicAuthCredentials;

  /// The SAPOData OAuth type authentication credentials.
  final OAuthCredentials? oAuthCredentials;

  SAPODataConnectorProfileCredentials({
    this.basicAuthCredentials,
    this.oAuthCredentials,
  });

  Map<String, dynamic> toJson() {
    final basicAuthCredentials = this.basicAuthCredentials;
    final oAuthCredentials = this.oAuthCredentials;
    return {
      if (basicAuthCredentials != null)
        'basicAuthCredentials': basicAuthCredentials,
      if (oAuthCredentials != null) 'oAuthCredentials': oAuthCredentials,
    };
  }
}

/// The connector-specific profile properties required when using SAPOData.
class SAPODataConnectorProfileProperties {
  /// The location of the SAPOData resource.
  final String applicationHostUrl;

  /// The application path to catalog service.
  final String applicationServicePath;

  /// The client number for the client creating the connection.
  final String clientNumber;

  /// The port number of the SAPOData instance.
  final int portNumber;

  /// If you set this parameter to <code>true</code>, Amazon AppFlow bypasses the
  /// single sign-on (SSO) settings in your SAP account when it accesses your SAP
  /// OData instance.
  ///
  /// Whether you need this option depends on the types of credentials that you
  /// applied to your SAP OData connection profile. If your profile uses basic
  /// authentication credentials, SAP SSO can prevent Amazon AppFlow from
  /// connecting to your account with your username and password. In this case,
  /// bypassing SSO makes it possible for Amazon AppFlow to connect successfully.
  /// However, if your profile uses OAuth credentials, this parameter has no
  /// affect.
  final bool? disableSSO;

  /// The logon language of SAPOData instance.
  final String? logonLanguage;

  /// The SAPOData OAuth properties required for OAuth type authentication.
  final OAuthProperties? oAuthProperties;

  /// The SAPOData Private Link service name to be used for private data
  /// transfers.
  final String? privateLinkServiceName;

  SAPODataConnectorProfileProperties({
    required this.applicationHostUrl,
    required this.applicationServicePath,
    required this.clientNumber,
    required this.portNumber,
    this.disableSSO,
    this.logonLanguage,
    this.oAuthProperties,
    this.privateLinkServiceName,
  });

  factory SAPODataConnectorProfileProperties.fromJson(
      Map<String, dynamic> json) {
    return SAPODataConnectorProfileProperties(
      applicationHostUrl: json['applicationHostUrl'] as String,
      applicationServicePath: json['applicationServicePath'] as String,
      clientNumber: json['clientNumber'] as String,
      portNumber: json['portNumber'] as int,
      disableSSO: json['disableSSO'] as bool?,
      logonLanguage: json['logonLanguage'] as String?,
      oAuthProperties: json['oAuthProperties'] != null
          ? OAuthProperties.fromJson(
              json['oAuthProperties'] as Map<String, dynamic>)
          : null,
      privateLinkServiceName: json['privateLinkServiceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationHostUrl = this.applicationHostUrl;
    final applicationServicePath = this.applicationServicePath;
    final clientNumber = this.clientNumber;
    final portNumber = this.portNumber;
    final disableSSO = this.disableSSO;
    final logonLanguage = this.logonLanguage;
    final oAuthProperties = this.oAuthProperties;
    final privateLinkServiceName = this.privateLinkServiceName;
    return {
      'applicationHostUrl': applicationHostUrl,
      'applicationServicePath': applicationServicePath,
      'clientNumber': clientNumber,
      'portNumber': portNumber,
      if (disableSSO != null) 'disableSSO': disableSSO,
      if (logonLanguage != null) 'logonLanguage': logonLanguage,
      if (oAuthProperties != null) 'oAuthProperties': oAuthProperties,
      if (privateLinkServiceName != null)
        'privateLinkServiceName': privateLinkServiceName,
    };
  }
}

/// The properties that are applied when using SAPOData as a flow destination
class SAPODataDestinationProperties {
  /// The object path specified in the SAPOData flow destination.
  final String objectPath;
  final ErrorHandlingConfig? errorHandlingConfig;
  final List<String>? idFieldNames;

  /// Determines how Amazon AppFlow handles the success response that it gets from
  /// the connector after placing data.
  ///
  /// For example, this setting would determine where to write the response from a
  /// destination connector upon a successful insert operation.
  final SuccessResponseHandlingConfig? successResponseHandlingConfig;
  final WriteOperationType? writeOperationType;

  SAPODataDestinationProperties({
    required this.objectPath,
    this.errorHandlingConfig,
    this.idFieldNames,
    this.successResponseHandlingConfig,
    this.writeOperationType,
  });

  factory SAPODataDestinationProperties.fromJson(Map<String, dynamic> json) {
    return SAPODataDestinationProperties(
      objectPath: json['objectPath'] as String,
      errorHandlingConfig: json['errorHandlingConfig'] != null
          ? ErrorHandlingConfig.fromJson(
              json['errorHandlingConfig'] as Map<String, dynamic>)
          : null,
      idFieldNames: (json['idFieldNames'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      successResponseHandlingConfig:
          json['successResponseHandlingConfig'] != null
              ? SuccessResponseHandlingConfig.fromJson(
                  json['successResponseHandlingConfig'] as Map<String, dynamic>)
              : null,
      writeOperationType: (json['writeOperationType'] as String?)
          ?.let(WriteOperationType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final objectPath = this.objectPath;
    final errorHandlingConfig = this.errorHandlingConfig;
    final idFieldNames = this.idFieldNames;
    final successResponseHandlingConfig = this.successResponseHandlingConfig;
    final writeOperationType = this.writeOperationType;
    return {
      'objectPath': objectPath,
      if (errorHandlingConfig != null)
        'errorHandlingConfig': errorHandlingConfig,
      if (idFieldNames != null) 'idFieldNames': idFieldNames,
      if (successResponseHandlingConfig != null)
        'successResponseHandlingConfig': successResponseHandlingConfig,
      if (writeOperationType != null)
        'writeOperationType': writeOperationType.value,
    };
  }
}

/// The connector metadata specific to SAPOData.
class SAPODataMetadata {
  SAPODataMetadata();

  factory SAPODataMetadata.fromJson(Map<String, dynamic> _) {
    return SAPODataMetadata();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Sets the page size for each <i>concurrent process</i> that transfers OData
/// records from your SAP instance. A concurrent process is query that retrieves
/// a batch of records as part of a flow run. Amazon AppFlow can run multiple
/// concurrent processes in parallel to transfer data faster.
class SAPODataPaginationConfig {
  /// The maximum number of records that Amazon AppFlow receives in each page of
  /// the response from your SAP application. For transfers of OData records, the
  /// maximum page size is 3,000. For transfers of data that comes from an ODP
  /// provider, the maximum page size is 10,000.
  final int maxPageSize;

  SAPODataPaginationConfig({
    required this.maxPageSize,
  });

  factory SAPODataPaginationConfig.fromJson(Map<String, dynamic> json) {
    return SAPODataPaginationConfig(
      maxPageSize: json['maxPageSize'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final maxPageSize = this.maxPageSize;
    return {
      'maxPageSize': maxPageSize,
    };
  }
}

/// Sets the number of <i>concurrent processes</i> that transfer OData records
/// from your SAP instance. A concurrent process is query that retrieves a batch
/// of records as part of a flow run. Amazon AppFlow can run multiple concurrent
/// processes in parallel to transfer data faster.
class SAPODataParallelismConfig {
  /// The maximum number of processes that Amazon AppFlow runs at the same time
  /// when it retrieves your data from your SAP application.
  final int maxParallelism;

  SAPODataParallelismConfig({
    required this.maxParallelism,
  });

  factory SAPODataParallelismConfig.fromJson(Map<String, dynamic> json) {
    return SAPODataParallelismConfig(
      maxParallelism: json['maxParallelism'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final maxParallelism = this.maxParallelism;
    return {
      'maxParallelism': maxParallelism,
    };
  }
}

/// The properties that are applied when using SAPOData as a flow source.
class SAPODataSourceProperties {
  /// The object path specified in the SAPOData flow source.
  final String? objectPath;

  /// Sets the page size for each concurrent process that transfers OData records
  /// from your SAP instance.
  final SAPODataPaginationConfig? paginationConfig;

  /// Sets the number of concurrent processes that transfers OData records from
  /// your SAP instance.
  final SAPODataParallelismConfig? parallelismConfig;

  SAPODataSourceProperties({
    this.objectPath,
    this.paginationConfig,
    this.parallelismConfig,
  });

  factory SAPODataSourceProperties.fromJson(Map<String, dynamic> json) {
    return SAPODataSourceProperties(
      objectPath: json['objectPath'] as String?,
      paginationConfig: json['paginationConfig'] != null
          ? SAPODataPaginationConfig.fromJson(
              json['paginationConfig'] as Map<String, dynamic>)
          : null,
      parallelismConfig: json['parallelismConfig'] != null
          ? SAPODataParallelismConfig.fromJson(
              json['parallelismConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final objectPath = this.objectPath;
    final paginationConfig = this.paginationConfig;
    final parallelismConfig = this.parallelismConfig;
    return {
      if (objectPath != null) 'objectPath': objectPath,
      if (paginationConfig != null) 'paginationConfig': paginationConfig,
      if (parallelismConfig != null) 'parallelismConfig': parallelismConfig,
    };
  }
}

enum SalesforceConnectorOperator {
  projection('PROJECTION'),
  lessThan('LESS_THAN'),
  contains('CONTAINS'),
  greaterThan('GREATER_THAN'),
  between('BETWEEN'),
  lessThanOrEqualTo('LESS_THAN_OR_EQUAL_TO'),
  greaterThanOrEqualTo('GREATER_THAN_OR_EQUAL_TO'),
  equalTo('EQUAL_TO'),
  notEqualTo('NOT_EQUAL_TO'),
  addition('ADDITION'),
  multiplication('MULTIPLICATION'),
  division('DIVISION'),
  subtraction('SUBTRACTION'),
  maskAll('MASK_ALL'),
  maskFirstN('MASK_FIRST_N'),
  maskLastN('MASK_LAST_N'),
  validateNonNull('VALIDATE_NON_NULL'),
  validateNonZero('VALIDATE_NON_ZERO'),
  validateNonNegative('VALIDATE_NON_NEGATIVE'),
  validateNumeric('VALIDATE_NUMERIC'),
  noOp('NO_OP'),
  ;

  final String value;

  const SalesforceConnectorOperator(this.value);

  static SalesforceConnectorOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum SalesforceConnectorOperator'));
}

/// The connector-specific profile credentials required when using Salesforce.
class SalesforceConnectorProfileCredentials {
  /// The credentials used to access protected Salesforce resources.
  final String? accessToken;

  /// The secret manager ARN, which contains the client ID and client secret of
  /// the connected app.
  final String? clientCredentialsArn;

  /// A JSON web token (JWT) that authorizes Amazon AppFlow to access your
  /// Salesforce records.
  final String? jwtToken;

  /// Specifies the OAuth 2.0 grant type that Amazon AppFlow uses when it requests
  /// an access token from Salesforce. Amazon AppFlow requires an access token
  /// each time it attempts to access your Salesforce records.
  ///
  /// You can specify one of the following values:
  /// <dl> <dt>AUTHORIZATION_CODE</dt> <dd>
  /// Amazon AppFlow passes an authorization code when it requests the access
  /// token from Salesforce. Amazon AppFlow receives the authorization code from
  /// Salesforce after you log in to your Salesforce account and authorize Amazon
  /// AppFlow to access your records.
  /// </dd> <dt>CLIENT_CREDENTIALS</dt> <dd>
  /// Amazon AppFlow passes client credentials (a client ID and client secret)
  /// when it requests the access token from Salesforce. You provide these
  /// credentials to Amazon AppFlow when you define the connection to your
  /// Salesforce account.
  /// </dd> <dt>JWT_BEARER</dt> <dd>
  /// Amazon AppFlow passes a JSON web token (JWT) when it requests the access
  /// token from Salesforce. You provide the JWT to Amazon AppFlow when you define
  /// the connection to your Salesforce account. When you use this grant type, you
  /// don't need to log in to your Salesforce account to authorize Amazon AppFlow
  /// to access your records.
  /// </dd> </dl>
  final OAuth2GrantType? oAuth2GrantType;

  /// The OAuth requirement needed to request security tokens from the connector
  /// endpoint.
  final ConnectorOAuthRequest? oAuthRequest;

  /// The credentials used to acquire new access tokens.
  final String? refreshToken;

  SalesforceConnectorProfileCredentials({
    this.accessToken,
    this.clientCredentialsArn,
    this.jwtToken,
    this.oAuth2GrantType,
    this.oAuthRequest,
    this.refreshToken,
  });

  Map<String, dynamic> toJson() {
    final accessToken = this.accessToken;
    final clientCredentialsArn = this.clientCredentialsArn;
    final jwtToken = this.jwtToken;
    final oAuth2GrantType = this.oAuth2GrantType;
    final oAuthRequest = this.oAuthRequest;
    final refreshToken = this.refreshToken;
    return {
      if (accessToken != null) 'accessToken': accessToken,
      if (clientCredentialsArn != null)
        'clientCredentialsArn': clientCredentialsArn,
      if (jwtToken != null) 'jwtToken': jwtToken,
      if (oAuth2GrantType != null) 'oAuth2GrantType': oAuth2GrantType.value,
      if (oAuthRequest != null) 'oAuthRequest': oAuthRequest,
      if (refreshToken != null) 'refreshToken': refreshToken,
    };
  }
}

/// The connector-specific profile properties required when using Salesforce.
class SalesforceConnectorProfileProperties {
  /// The location of the Salesforce resource.
  final String? instanceUrl;

  /// Indicates whether the connector profile applies to a sandbox or production
  /// environment.
  final bool? isSandboxEnvironment;

  /// If the connection mode for the connector profile is private, this parameter
  /// sets whether Amazon AppFlow uses the private network to send metadata and
  /// authorization calls to Salesforce. Amazon AppFlow sends private calls
  /// through Amazon Web Services PrivateLink. These calls travel through Amazon
  /// Web Services infrastructure without being exposed to the public internet.
  ///
  /// Set either of the following values:
  /// <dl> <dt>true</dt> <dd>
  /// Amazon AppFlow sends all calls to Salesforce over the private network.
  ///
  /// These private calls are:
  ///
  /// <ul>
  /// <li>
  /// Calls to get metadata about your Salesforce records. This metadata describes
  /// your Salesforce objects and their fields.
  /// </li>
  /// <li>
  /// Calls to get or refresh access tokens that allow Amazon AppFlow to access
  /// your Salesforce records.
  /// </li>
  /// <li>
  /// Calls to transfer your Salesforce records as part of a flow run.
  /// </li>
  /// </ul> </dd> <dt>false</dt> <dd>
  /// The default value. Amazon AppFlow sends some calls to Salesforce privately
  /// and other calls over the public internet.
  ///
  /// The public calls are:
  ///
  /// <ul>
  /// <li>
  /// Calls to get metadata about your Salesforce records.
  /// </li>
  /// <li>
  /// Calls to get or refresh access tokens.
  /// </li>
  /// </ul>
  /// The private calls are:
  ///
  /// <ul>
  /// <li>
  /// Calls to transfer your Salesforce records as part of a flow run.
  /// </li>
  /// </ul> </dd> </dl>
  final bool? usePrivateLinkForMetadataAndAuthorization;

  SalesforceConnectorProfileProperties({
    this.instanceUrl,
    this.isSandboxEnvironment,
    this.usePrivateLinkForMetadataAndAuthorization,
  });

  factory SalesforceConnectorProfileProperties.fromJson(
      Map<String, dynamic> json) {
    return SalesforceConnectorProfileProperties(
      instanceUrl: json['instanceUrl'] as String?,
      isSandboxEnvironment: json['isSandboxEnvironment'] as bool?,
      usePrivateLinkForMetadataAndAuthorization:
          json['usePrivateLinkForMetadataAndAuthorization'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceUrl = this.instanceUrl;
    final isSandboxEnvironment = this.isSandboxEnvironment;
    final usePrivateLinkForMetadataAndAuthorization =
        this.usePrivateLinkForMetadataAndAuthorization;
    return {
      if (instanceUrl != null) 'instanceUrl': instanceUrl,
      if (isSandboxEnvironment != null)
        'isSandboxEnvironment': isSandboxEnvironment,
      if (usePrivateLinkForMetadataAndAuthorization != null)
        'usePrivateLinkForMetadataAndAuthorization':
            usePrivateLinkForMetadataAndAuthorization,
    };
  }
}

enum SalesforceDataTransferApi {
  automatic('AUTOMATIC'),
  bulkv2('BULKV2'),
  restSync('REST_SYNC'),
  ;

  final String value;

  const SalesforceDataTransferApi(this.value);

  static SalesforceDataTransferApi fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum SalesforceDataTransferApi'));
}

/// The properties that are applied when Salesforce is being used as a
/// destination.
class SalesforceDestinationProperties {
  /// The object specified in the Salesforce flow destination.
  final String object;

  /// Specifies which Salesforce API is used by Amazon AppFlow when your flow
  /// transfers data to Salesforce.
  /// <dl> <dt>AUTOMATIC</dt> <dd>
  /// The default. Amazon AppFlow selects which API to use based on the number of
  /// records that your flow transfers to Salesforce. If your flow transfers fewer
  /// than 1,000 records, Amazon AppFlow uses Salesforce REST API. If your flow
  /// transfers 1,000 records or more, Amazon AppFlow uses Salesforce Bulk API
  /// 2.0.
  ///
  /// Each of these Salesforce APIs structures data differently. If Amazon AppFlow
  /// selects the API automatically, be aware that, for recurring flows, the data
  /// output might vary from one flow run to the next. For example, if a flow runs
  /// daily, it might use REST API on one day to transfer 900 records, and it
  /// might use Bulk API 2.0 on the next day to transfer 1,100 records. For each
  /// of these flow runs, the respective Salesforce API formats the data
  /// differently. Some of the differences include how dates are formatted and
  /// null values are represented. Also, Bulk API 2.0 doesn't transfer Salesforce
  /// compound fields.
  ///
  /// By choosing this option, you optimize flow performance for both small and
  /// large data transfers, but the tradeoff is inconsistent formatting in the
  /// output.
  /// </dd> <dt>BULKV2</dt> <dd>
  /// Amazon AppFlow uses only Salesforce Bulk API 2.0. This API runs asynchronous
  /// data transfers, and it's optimal for large sets of data. By choosing this
  /// option, you ensure that your flow writes consistent output, but you optimize
  /// performance only for large data transfers.
  ///
  /// Note that Bulk API 2.0 does not transfer Salesforce compound fields.
  /// </dd> <dt>REST_SYNC</dt> <dd>
  /// Amazon AppFlow uses only Salesforce REST API. By choosing this option, you
  /// ensure that your flow writes consistent output, but you decrease performance
  /// for large data transfers that are better suited for Bulk API 2.0. In some
  /// cases, if your flow attempts to transfer a vary large set of data, it might
  /// fail with a timed out error.
  /// </dd> </dl>
  final SalesforceDataTransferApi? dataTransferApi;

  /// The settings that determine how Amazon AppFlow handles an error when placing
  /// data in the Salesforce destination. For example, this setting would
  /// determine if the flow should fail after one insertion error, or continue and
  /// attempt to insert every record regardless of the initial failure.
  /// <code>ErrorHandlingConfig</code> is a part of the destination connector
  /// details.
  final ErrorHandlingConfig? errorHandlingConfig;

  /// The name of the field that Amazon AppFlow uses as an ID when performing a
  /// write operation such as update or delete.
  final List<String>? idFieldNames;

  /// This specifies the type of write operation to be performed in Salesforce.
  /// When the value is <code>UPSERT</code>, then <code>idFieldNames</code> is
  /// required.
  final WriteOperationType? writeOperationType;

  SalesforceDestinationProperties({
    required this.object,
    this.dataTransferApi,
    this.errorHandlingConfig,
    this.idFieldNames,
    this.writeOperationType,
  });

  factory SalesforceDestinationProperties.fromJson(Map<String, dynamic> json) {
    return SalesforceDestinationProperties(
      object: json['object'] as String,
      dataTransferApi: (json['dataTransferApi'] as String?)
          ?.let(SalesforceDataTransferApi.fromString),
      errorHandlingConfig: json['errorHandlingConfig'] != null
          ? ErrorHandlingConfig.fromJson(
              json['errorHandlingConfig'] as Map<String, dynamic>)
          : null,
      idFieldNames: (json['idFieldNames'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      writeOperationType: (json['writeOperationType'] as String?)
          ?.let(WriteOperationType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final object = this.object;
    final dataTransferApi = this.dataTransferApi;
    final errorHandlingConfig = this.errorHandlingConfig;
    final idFieldNames = this.idFieldNames;
    final writeOperationType = this.writeOperationType;
    return {
      'object': object,
      if (dataTransferApi != null) 'dataTransferApi': dataTransferApi.value,
      if (errorHandlingConfig != null)
        'errorHandlingConfig': errorHandlingConfig,
      if (idFieldNames != null) 'idFieldNames': idFieldNames,
      if (writeOperationType != null)
        'writeOperationType': writeOperationType.value,
    };
  }
}

/// The connector metadata specific to Salesforce.
class SalesforceMetadata {
  /// The Salesforce APIs that you can have Amazon AppFlow use when your flows
  /// transfers data to or from Salesforce.
  final List<SalesforceDataTransferApi>? dataTransferApis;

  /// The desired authorization scope for the Salesforce account.
  final List<String>? oAuthScopes;

  /// The OAuth 2.0 grant types that Amazon AppFlow can use when it requests an
  /// access token from Salesforce. Amazon AppFlow requires an access token each
  /// time it attempts to access your Salesforce records.
  /// <dl> <dt>AUTHORIZATION_CODE</dt> <dd>
  /// Amazon AppFlow passes an authorization code when it requests the access
  /// token from Salesforce. Amazon AppFlow receives the authorization code from
  /// Salesforce after you log in to your Salesforce account and authorize Amazon
  /// AppFlow to access your records.
  /// </dd> <dt>CLIENT_CREDENTIALS</dt> <dd>
  /// Amazon AppFlow passes client credentials (a client ID and client secret)
  /// when it requests the access token from Salesforce. You provide these
  /// credentials to Amazon AppFlow when you define the connection to your
  /// Salesforce account.
  /// </dd> <dt>JWT_BEARER</dt> <dd>
  /// Amazon AppFlow passes a JSON web token (JWT) when it requests the access
  /// token from Salesforce. You provide the JWT to Amazon AppFlow when you define
  /// the connection to your Salesforce account. When you use this grant type, you
  /// don't need to log in to your Salesforce account to authorize Amazon AppFlow
  /// to access your records.
  /// </dd> </dl>
  final List<OAuth2GrantType>? oauth2GrantTypesSupported;

  SalesforceMetadata({
    this.dataTransferApis,
    this.oAuthScopes,
    this.oauth2GrantTypesSupported,
  });

  factory SalesforceMetadata.fromJson(Map<String, dynamic> json) {
    return SalesforceMetadata(
      dataTransferApis: (json['dataTransferApis'] as List?)
          ?.nonNulls
          .map((e) => SalesforceDataTransferApi.fromString((e as String)))
          .toList(),
      oAuthScopes: (json['oAuthScopes'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      oauth2GrantTypesSupported: (json['oauth2GrantTypesSupported'] as List?)
          ?.nonNulls
          .map((e) => OAuth2GrantType.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dataTransferApis = this.dataTransferApis;
    final oAuthScopes = this.oAuthScopes;
    final oauth2GrantTypesSupported = this.oauth2GrantTypesSupported;
    return {
      if (dataTransferApis != null)
        'dataTransferApis': dataTransferApis.map((e) => e.value).toList(),
      if (oAuthScopes != null) 'oAuthScopes': oAuthScopes,
      if (oauth2GrantTypesSupported != null)
        'oauth2GrantTypesSupported':
            oauth2GrantTypesSupported.map((e) => e.value).toList(),
    };
  }
}

/// The properties that are applied when Salesforce is being used as a source.
class SalesforceSourceProperties {
  /// The object specified in the Salesforce flow source.
  final String object;

  /// Specifies which Salesforce API is used by Amazon AppFlow when your flow
  /// transfers data from Salesforce.
  /// <dl> <dt>AUTOMATIC</dt> <dd>
  /// The default. Amazon AppFlow selects which API to use based on the number of
  /// records that your flow transfers from Salesforce. If your flow transfers
  /// fewer than 1,000,000 records, Amazon AppFlow uses Salesforce REST API. If
  /// your flow transfers 1,000,000 records or more, Amazon AppFlow uses
  /// Salesforce Bulk API 2.0.
  ///
  /// Each of these Salesforce APIs structures data differently. If Amazon AppFlow
  /// selects the API automatically, be aware that, for recurring flows, the data
  /// output might vary from one flow run to the next. For example, if a flow runs
  /// daily, it might use REST API on one day to transfer 900,000 records, and it
  /// might use Bulk API 2.0 on the next day to transfer 1,100,000 records. For
  /// each of these flow runs, the respective Salesforce API formats the data
  /// differently. Some of the differences include how dates are formatted and
  /// null values are represented. Also, Bulk API 2.0 doesn't transfer Salesforce
  /// compound fields.
  ///
  /// By choosing this option, you optimize flow performance for both small and
  /// large data transfers, but the tradeoff is inconsistent formatting in the
  /// output.
  /// </dd> <dt>BULKV2</dt> <dd>
  /// Amazon AppFlow uses only Salesforce Bulk API 2.0. This API runs asynchronous
  /// data transfers, and it's optimal for large sets of data. By choosing this
  /// option, you ensure that your flow writes consistent output, but you optimize
  /// performance only for large data transfers.
  ///
  /// Note that Bulk API 2.0 does not transfer Salesforce compound fields.
  /// </dd> <dt>REST_SYNC</dt> <dd>
  /// Amazon AppFlow uses only Salesforce REST API. By choosing this option, you
  /// ensure that your flow writes consistent output, but you decrease performance
  /// for large data transfers that are better suited for Bulk API 2.0. In some
  /// cases, if your flow attempts to transfer a vary large set of data, it might
  /// fail wituh a timed out error.
  /// </dd> </dl>
  final SalesforceDataTransferApi? dataTransferApi;

  /// The flag that enables dynamic fetching of new (recently added) fields in the
  /// Salesforce objects while running a flow.
  final bool? enableDynamicFieldUpdate;

  /// Indicates whether Amazon AppFlow includes deleted files in the flow run.
  final bool? includeDeletedRecords;

  SalesforceSourceProperties({
    required this.object,
    this.dataTransferApi,
    this.enableDynamicFieldUpdate,
    this.includeDeletedRecords,
  });

  factory SalesforceSourceProperties.fromJson(Map<String, dynamic> json) {
    return SalesforceSourceProperties(
      object: json['object'] as String,
      dataTransferApi: (json['dataTransferApi'] as String?)
          ?.let(SalesforceDataTransferApi.fromString),
      enableDynamicFieldUpdate: json['enableDynamicFieldUpdate'] as bool?,
      includeDeletedRecords: json['includeDeletedRecords'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final object = this.object;
    final dataTransferApi = this.dataTransferApi;
    final enableDynamicFieldUpdate = this.enableDynamicFieldUpdate;
    final includeDeletedRecords = this.includeDeletedRecords;
    return {
      'object': object,
      if (dataTransferApi != null) 'dataTransferApi': dataTransferApi.value,
      if (enableDynamicFieldUpdate != null)
        'enableDynamicFieldUpdate': enableDynamicFieldUpdate,
      if (includeDeletedRecords != null)
        'includeDeletedRecords': includeDeletedRecords,
    };
  }
}

enum ScheduleFrequencyType {
  byminute('BYMINUTE'),
  hourly('HOURLY'),
  daily('DAILY'),
  weekly('WEEKLY'),
  monthly('MONTHLY'),
  once('ONCE'),
  ;

  final String value;

  const ScheduleFrequencyType(this.value);

  static ScheduleFrequencyType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum ScheduleFrequencyType'));
}

/// Specifies the configuration details of a schedule-triggered flow as defined
/// by the user. Currently, these settings only apply to the
/// <code>Scheduled</code> trigger type.
class ScheduledTriggerProperties {
  /// The scheduling expression that determines the rate at which the schedule
  /// will run, for example <code>rate(5minutes)</code>.
  final String scheduleExpression;

  /// Specifies whether a scheduled flow has an incremental data transfer or a
  /// complete data transfer for each flow run.
  final DataPullMode? dataPullMode;

  /// Specifies the date range for the records to import from the connector in the
  /// first flow run.
  final DateTime? firstExecutionFrom;

  /// Defines how many times a scheduled flow fails consecutively before Amazon
  /// AppFlow deactivates it.
  final int? flowErrorDeactivationThreshold;

  /// The time at which the scheduled flow ends. The time is formatted as a
  /// timestamp that follows the ISO 8601 standard, such as
  /// <code>2022-04-27T13:00:00-07:00</code>.
  final DateTime? scheduleEndTime;

  /// Specifies the optional offset that is added to the time interval for a
  /// schedule-triggered flow.
  final int? scheduleOffset;

  /// The time at which the scheduled flow starts. The time is formatted as a
  /// timestamp that follows the ISO 8601 standard, such as
  /// <code>2022-04-26T13:00:00-07:00</code>.
  final DateTime? scheduleStartTime;

  /// Specifies the time zone used when referring to the dates and times of a
  /// scheduled flow, such as <code>America/New_York</code>. This time zone is
  /// only a descriptive label. It doesn't affect how Amazon AppFlow interprets
  /// the timestamps that you specify to schedule the flow.
  ///
  /// If you want to schedule a flow by using times in a particular time zone,
  /// indicate the time zone as a UTC offset in your timestamps. For example, the
  /// UTC offsets for the <code>America/New_York</code> timezone are
  /// <code>-04:00</code> EDT and <code>-05:00 EST</code>.
  final String? timezone;

  ScheduledTriggerProperties({
    required this.scheduleExpression,
    this.dataPullMode,
    this.firstExecutionFrom,
    this.flowErrorDeactivationThreshold,
    this.scheduleEndTime,
    this.scheduleOffset,
    this.scheduleStartTime,
    this.timezone,
  });

  factory ScheduledTriggerProperties.fromJson(Map<String, dynamic> json) {
    return ScheduledTriggerProperties(
      scheduleExpression: json['scheduleExpression'] as String,
      dataPullMode:
          (json['dataPullMode'] as String?)?.let(DataPullMode.fromString),
      firstExecutionFrom: timeStampFromJson(json['firstExecutionFrom']),
      flowErrorDeactivationThreshold:
          json['flowErrorDeactivationThreshold'] as int?,
      scheduleEndTime: timeStampFromJson(json['scheduleEndTime']),
      scheduleOffset: json['scheduleOffset'] as int?,
      scheduleStartTime: timeStampFromJson(json['scheduleStartTime']),
      timezone: json['timezone'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final scheduleExpression = this.scheduleExpression;
    final dataPullMode = this.dataPullMode;
    final firstExecutionFrom = this.firstExecutionFrom;
    final flowErrorDeactivationThreshold = this.flowErrorDeactivationThreshold;
    final scheduleEndTime = this.scheduleEndTime;
    final scheduleOffset = this.scheduleOffset;
    final scheduleStartTime = this.scheduleStartTime;
    final timezone = this.timezone;
    return {
      'scheduleExpression': scheduleExpression,
      if (dataPullMode != null) 'dataPullMode': dataPullMode.value,
      if (firstExecutionFrom != null)
        'firstExecutionFrom': unixTimestampToJson(firstExecutionFrom),
      if (flowErrorDeactivationThreshold != null)
        'flowErrorDeactivationThreshold': flowErrorDeactivationThreshold,
      if (scheduleEndTime != null)
        'scheduleEndTime': unixTimestampToJson(scheduleEndTime),
      if (scheduleOffset != null) 'scheduleOffset': scheduleOffset,
      if (scheduleStartTime != null)
        'scheduleStartTime': unixTimestampToJson(scheduleStartTime),
      if (timezone != null) 'timezone': timezone,
    };
  }
}

enum ServiceNowConnectorOperator {
  projection('PROJECTION'),
  contains('CONTAINS'),
  lessThan('LESS_THAN'),
  greaterThan('GREATER_THAN'),
  between('BETWEEN'),
  lessThanOrEqualTo('LESS_THAN_OR_EQUAL_TO'),
  greaterThanOrEqualTo('GREATER_THAN_OR_EQUAL_TO'),
  equalTo('EQUAL_TO'),
  notEqualTo('NOT_EQUAL_TO'),
  addition('ADDITION'),
  multiplication('MULTIPLICATION'),
  division('DIVISION'),
  subtraction('SUBTRACTION'),
  maskAll('MASK_ALL'),
  maskFirstN('MASK_FIRST_N'),
  maskLastN('MASK_LAST_N'),
  validateNonNull('VALIDATE_NON_NULL'),
  validateNonZero('VALIDATE_NON_ZERO'),
  validateNonNegative('VALIDATE_NON_NEGATIVE'),
  validateNumeric('VALIDATE_NUMERIC'),
  noOp('NO_OP'),
  ;

  final String value;

  const ServiceNowConnectorOperator(this.value);

  static ServiceNowConnectorOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum ServiceNowConnectorOperator'));
}

/// The connector-specific profile credentials required when using ServiceNow.
class ServiceNowConnectorProfileCredentials {
  /// The OAuth 2.0 credentials required to authenticate the user.
  final OAuth2Credentials? oAuth2Credentials;

  /// The password that corresponds to the user name.
  final String? password;

  /// The name of the user.
  final String? username;

  ServiceNowConnectorProfileCredentials({
    this.oAuth2Credentials,
    this.password,
    this.username,
  });

  Map<String, dynamic> toJson() {
    final oAuth2Credentials = this.oAuth2Credentials;
    final password = this.password;
    final username = this.username;
    return {
      if (oAuth2Credentials != null) 'oAuth2Credentials': oAuth2Credentials,
      if (password != null) 'password': password,
      if (username != null) 'username': username,
    };
  }
}

/// The connector-specific profile properties required when using ServiceNow.
class ServiceNowConnectorProfileProperties {
  /// The location of the ServiceNow resource.
  final String instanceUrl;

  ServiceNowConnectorProfileProperties({
    required this.instanceUrl,
  });

  factory ServiceNowConnectorProfileProperties.fromJson(
      Map<String, dynamic> json) {
    return ServiceNowConnectorProfileProperties(
      instanceUrl: json['instanceUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceUrl = this.instanceUrl;
    return {
      'instanceUrl': instanceUrl,
    };
  }
}

/// The connector metadata specific to ServiceNow.
class ServiceNowMetadata {
  ServiceNowMetadata();

  factory ServiceNowMetadata.fromJson(Map<String, dynamic> _) {
    return ServiceNowMetadata();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The properties that are applied when ServiceNow is being used as a source.
class ServiceNowSourceProperties {
  /// The object specified in the ServiceNow flow source.
  final String object;

  ServiceNowSourceProperties({
    required this.object,
  });

  factory ServiceNowSourceProperties.fromJson(Map<String, dynamic> json) {
    return ServiceNowSourceProperties(
      object: json['object'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final object = this.object;
    return {
      'object': object,
    };
  }
}

enum SingularConnectorOperator {
  projection('PROJECTION'),
  equalTo('EQUAL_TO'),
  addition('ADDITION'),
  multiplication('MULTIPLICATION'),
  division('DIVISION'),
  subtraction('SUBTRACTION'),
  maskAll('MASK_ALL'),
  maskFirstN('MASK_FIRST_N'),
  maskLastN('MASK_LAST_N'),
  validateNonNull('VALIDATE_NON_NULL'),
  validateNonZero('VALIDATE_NON_ZERO'),
  validateNonNegative('VALIDATE_NON_NEGATIVE'),
  validateNumeric('VALIDATE_NUMERIC'),
  noOp('NO_OP'),
  ;

  final String value;

  const SingularConnectorOperator(this.value);

  static SingularConnectorOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum SingularConnectorOperator'));
}

/// The connector-specific profile credentials required when using Singular.
class SingularConnectorProfileCredentials {
  /// A unique alphanumeric identifier used to authenticate a user, developer, or
  /// calling program to your API.
  final String apiKey;

  SingularConnectorProfileCredentials({
    required this.apiKey,
  });

  Map<String, dynamic> toJson() {
    final apiKey = this.apiKey;
    return {
      'apiKey': apiKey,
    };
  }
}

/// The connector-specific profile properties required when using Singular.
class SingularConnectorProfileProperties {
  SingularConnectorProfileProperties();

  factory SingularConnectorProfileProperties.fromJson(Map<String, dynamic> _) {
    return SingularConnectorProfileProperties();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The connector metadata specific to Singular.
class SingularMetadata {
  SingularMetadata();

  factory SingularMetadata.fromJson(Map<String, dynamic> _) {
    return SingularMetadata();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The properties that are applied when Singular is being used as a source.
class SingularSourceProperties {
  /// The object specified in the Singular flow source.
  final String object;

  SingularSourceProperties({
    required this.object,
  });

  factory SingularSourceProperties.fromJson(Map<String, dynamic> json) {
    return SingularSourceProperties(
      object: json['object'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final object = this.object;
    return {
      'object': object,
    };
  }
}

enum SlackConnectorOperator {
  projection('PROJECTION'),
  lessThan('LESS_THAN'),
  greaterThan('GREATER_THAN'),
  between('BETWEEN'),
  lessThanOrEqualTo('LESS_THAN_OR_EQUAL_TO'),
  greaterThanOrEqualTo('GREATER_THAN_OR_EQUAL_TO'),
  equalTo('EQUAL_TO'),
  addition('ADDITION'),
  multiplication('MULTIPLICATION'),
  division('DIVISION'),
  subtraction('SUBTRACTION'),
  maskAll('MASK_ALL'),
  maskFirstN('MASK_FIRST_N'),
  maskLastN('MASK_LAST_N'),
  validateNonNull('VALIDATE_NON_NULL'),
  validateNonZero('VALIDATE_NON_ZERO'),
  validateNonNegative('VALIDATE_NON_NEGATIVE'),
  validateNumeric('VALIDATE_NUMERIC'),
  noOp('NO_OP'),
  ;

  final String value;

  const SlackConnectorOperator(this.value);

  static SlackConnectorOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum SlackConnectorOperator'));
}

/// The connector-specific profile credentials required when using Slack.
class SlackConnectorProfileCredentials {
  /// The identifier for the client.
  final String clientId;

  /// The client secret used by the OAuth client to authenticate to the
  /// authorization server.
  final String clientSecret;

  /// The credentials used to access protected Slack resources.
  final String? accessToken;

  /// The OAuth requirement needed to request security tokens from the connector
  /// endpoint.
  final ConnectorOAuthRequest? oAuthRequest;

  SlackConnectorProfileCredentials({
    required this.clientId,
    required this.clientSecret,
    this.accessToken,
    this.oAuthRequest,
  });

  Map<String, dynamic> toJson() {
    final clientId = this.clientId;
    final clientSecret = this.clientSecret;
    final accessToken = this.accessToken;
    final oAuthRequest = this.oAuthRequest;
    return {
      'clientId': clientId,
      'clientSecret': clientSecret,
      if (accessToken != null) 'accessToken': accessToken,
      if (oAuthRequest != null) 'oAuthRequest': oAuthRequest,
    };
  }
}

/// The connector-specific profile properties required when using Slack.
class SlackConnectorProfileProperties {
  /// The location of the Slack resource.
  final String instanceUrl;

  SlackConnectorProfileProperties({
    required this.instanceUrl,
  });

  factory SlackConnectorProfileProperties.fromJson(Map<String, dynamic> json) {
    return SlackConnectorProfileProperties(
      instanceUrl: json['instanceUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceUrl = this.instanceUrl;
    return {
      'instanceUrl': instanceUrl,
    };
  }
}

/// The connector metadata specific to Slack.
class SlackMetadata {
  /// The desired authorization scope for the Slack account.
  final List<String>? oAuthScopes;

  SlackMetadata({
    this.oAuthScopes,
  });

  factory SlackMetadata.fromJson(Map<String, dynamic> json) {
    return SlackMetadata(
      oAuthScopes: (json['oAuthScopes'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final oAuthScopes = this.oAuthScopes;
    return {
      if (oAuthScopes != null) 'oAuthScopes': oAuthScopes,
    };
  }
}

/// The properties that are applied when Slack is being used as a source.
class SlackSourceProperties {
  /// The object specified in the Slack flow source.
  final String object;

  SlackSourceProperties({
    required this.object,
  });

  factory SlackSourceProperties.fromJson(Map<String, dynamic> json) {
    return SlackSourceProperties(
      object: json['object'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final object = this.object;
    return {
      'object': object,
    };
  }
}

/// The connector-specific profile credentials required when using Snowflake.
class SnowflakeConnectorProfileCredentials {
  /// The password that corresponds to the user name.
  final String password;

  /// The name of the user.
  final String username;

  SnowflakeConnectorProfileCredentials({
    required this.password,
    required this.username,
  });

  Map<String, dynamic> toJson() {
    final password = this.password;
    final username = this.username;
    return {
      'password': password,
      'username': username,
    };
  }
}

/// The connector-specific profile properties required when using Snowflake.
class SnowflakeConnectorProfileProperties {
  /// The name of the Amazon S3 bucket associated with Snowflake.
  final String bucketName;

  /// The name of the Amazon S3 stage that was created while setting up an Amazon
  /// S3 stage in the Snowflake account. This is written in the following format:
  /// &lt; Database&gt;&lt; Schema&gt;&lt;Stage Name&gt;.
  final String stage;

  /// The name of the Snowflake warehouse.
  final String warehouse;

  /// The name of the account.
  final String? accountName;

  /// The bucket path that refers to the Amazon S3 bucket associated with
  /// Snowflake.
  final String? bucketPrefix;

  /// The Snowflake Private Link service name to be used for private data
  /// transfers.
  final String? privateLinkServiceName;

  /// The Amazon Web Services Region of the Snowflake account.
  final String? region;

  SnowflakeConnectorProfileProperties({
    required this.bucketName,
    required this.stage,
    required this.warehouse,
    this.accountName,
    this.bucketPrefix,
    this.privateLinkServiceName,
    this.region,
  });

  factory SnowflakeConnectorProfileProperties.fromJson(
      Map<String, dynamic> json) {
    return SnowflakeConnectorProfileProperties(
      bucketName: json['bucketName'] as String,
      stage: json['stage'] as String,
      warehouse: json['warehouse'] as String,
      accountName: json['accountName'] as String?,
      bucketPrefix: json['bucketPrefix'] as String?,
      privateLinkServiceName: json['privateLinkServiceName'] as String?,
      region: json['region'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final stage = this.stage;
    final warehouse = this.warehouse;
    final accountName = this.accountName;
    final bucketPrefix = this.bucketPrefix;
    final privateLinkServiceName = this.privateLinkServiceName;
    final region = this.region;
    return {
      'bucketName': bucketName,
      'stage': stage,
      'warehouse': warehouse,
      if (accountName != null) 'accountName': accountName,
      if (bucketPrefix != null) 'bucketPrefix': bucketPrefix,
      if (privateLinkServiceName != null)
        'privateLinkServiceName': privateLinkServiceName,
      if (region != null) 'region': region,
    };
  }
}

/// The properties that are applied when Snowflake is being used as a
/// destination.
class SnowflakeDestinationProperties {
  /// The intermediate bucket that Amazon AppFlow uses when moving data into
  /// Snowflake.
  final String intermediateBucketName;

  /// The object specified in the Snowflake flow destination.
  final String object;

  /// The object key for the destination bucket in which Amazon AppFlow places the
  /// files.
  final String? bucketPrefix;

  /// The settings that determine how Amazon AppFlow handles an error when placing
  /// data in the Snowflake destination. For example, this setting would determine
  /// if the flow should fail after one insertion error, or continue and attempt
  /// to insert every record regardless of the initial failure.
  /// <code>ErrorHandlingConfig</code> is a part of the destination connector
  /// details.
  final ErrorHandlingConfig? errorHandlingConfig;

  SnowflakeDestinationProperties({
    required this.intermediateBucketName,
    required this.object,
    this.bucketPrefix,
    this.errorHandlingConfig,
  });

  factory SnowflakeDestinationProperties.fromJson(Map<String, dynamic> json) {
    return SnowflakeDestinationProperties(
      intermediateBucketName: json['intermediateBucketName'] as String,
      object: json['object'] as String,
      bucketPrefix: json['bucketPrefix'] as String?,
      errorHandlingConfig: json['errorHandlingConfig'] != null
          ? ErrorHandlingConfig.fromJson(
              json['errorHandlingConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final intermediateBucketName = this.intermediateBucketName;
    final object = this.object;
    final bucketPrefix = this.bucketPrefix;
    final errorHandlingConfig = this.errorHandlingConfig;
    return {
      'intermediateBucketName': intermediateBucketName,
      'object': object,
      if (bucketPrefix != null) 'bucketPrefix': bucketPrefix,
      if (errorHandlingConfig != null)
        'errorHandlingConfig': errorHandlingConfig,
    };
  }
}

/// The connector metadata specific to Snowflake.
class SnowflakeMetadata {
  /// Specifies the supported Amazon Web Services Regions when using Snowflake.
  final List<String>? supportedRegions;

  SnowflakeMetadata({
    this.supportedRegions,
  });

  factory SnowflakeMetadata.fromJson(Map<String, dynamic> json) {
    return SnowflakeMetadata(
      supportedRegions: (json['supportedRegions'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final supportedRegions = this.supportedRegions;
    return {
      if (supportedRegions != null) 'supportedRegions': supportedRegions,
    };
  }
}

/// Specifies the information that is required to query a particular connector.
class SourceConnectorProperties {
  /// Specifies the information that is required for querying Amplitude.
  final AmplitudeSourceProperties? amplitude;
  final CustomConnectorSourceProperties? customConnector;

  /// Specifies the information that is required for querying Datadog.
  final DatadogSourceProperties? datadog;

  /// Specifies the information that is required for querying Dynatrace.
  final DynatraceSourceProperties? dynatrace;

  /// Specifies the information that is required for querying Google Analytics.
  final GoogleAnalyticsSourceProperties? googleAnalytics;

  /// Specifies the information that is required for querying Infor Nexus.
  final InforNexusSourceProperties? inforNexus;

  /// Specifies the information that is required for querying Marketo.
  final MarketoSourceProperties? marketo;

  /// Specifies the information that is required for querying Salesforce Pardot.
  final PardotSourceProperties? pardot;

  /// Specifies the information that is required for querying Amazon S3.
  final S3SourceProperties? s3;
  final SAPODataSourceProperties? sAPOData;

  /// Specifies the information that is required for querying Salesforce.
  final SalesforceSourceProperties? salesforce;

  /// Specifies the information that is required for querying ServiceNow.
  final ServiceNowSourceProperties? serviceNow;

  /// Specifies the information that is required for querying Singular.
  final SingularSourceProperties? singular;

  /// Specifies the information that is required for querying Slack.
  final SlackSourceProperties? slack;

  /// Specifies the information that is required for querying Trend Micro.
  final TrendmicroSourceProperties? trendmicro;

  /// Specifies the information that is required for querying Veeva.
  final VeevaSourceProperties? veeva;

  /// Specifies the information that is required for querying Zendesk.
  final ZendeskSourceProperties? zendesk;

  SourceConnectorProperties({
    this.amplitude,
    this.customConnector,
    this.datadog,
    this.dynatrace,
    this.googleAnalytics,
    this.inforNexus,
    this.marketo,
    this.pardot,
    this.s3,
    this.sAPOData,
    this.salesforce,
    this.serviceNow,
    this.singular,
    this.slack,
    this.trendmicro,
    this.veeva,
    this.zendesk,
  });

  factory SourceConnectorProperties.fromJson(Map<String, dynamic> json) {
    return SourceConnectorProperties(
      amplitude: json['Amplitude'] != null
          ? AmplitudeSourceProperties.fromJson(
              json['Amplitude'] as Map<String, dynamic>)
          : null,
      customConnector: json['CustomConnector'] != null
          ? CustomConnectorSourceProperties.fromJson(
              json['CustomConnector'] as Map<String, dynamic>)
          : null,
      datadog: json['Datadog'] != null
          ? DatadogSourceProperties.fromJson(
              json['Datadog'] as Map<String, dynamic>)
          : null,
      dynatrace: json['Dynatrace'] != null
          ? DynatraceSourceProperties.fromJson(
              json['Dynatrace'] as Map<String, dynamic>)
          : null,
      googleAnalytics: json['GoogleAnalytics'] != null
          ? GoogleAnalyticsSourceProperties.fromJson(
              json['GoogleAnalytics'] as Map<String, dynamic>)
          : null,
      inforNexus: json['InforNexus'] != null
          ? InforNexusSourceProperties.fromJson(
              json['InforNexus'] as Map<String, dynamic>)
          : null,
      marketo: json['Marketo'] != null
          ? MarketoSourceProperties.fromJson(
              json['Marketo'] as Map<String, dynamic>)
          : null,
      pardot: json['Pardot'] != null
          ? PardotSourceProperties.fromJson(
              json['Pardot'] as Map<String, dynamic>)
          : null,
      s3: json['S3'] != null
          ? S3SourceProperties.fromJson(json['S3'] as Map<String, dynamic>)
          : null,
      sAPOData: json['SAPOData'] != null
          ? SAPODataSourceProperties.fromJson(
              json['SAPOData'] as Map<String, dynamic>)
          : null,
      salesforce: json['Salesforce'] != null
          ? SalesforceSourceProperties.fromJson(
              json['Salesforce'] as Map<String, dynamic>)
          : null,
      serviceNow: json['ServiceNow'] != null
          ? ServiceNowSourceProperties.fromJson(
              json['ServiceNow'] as Map<String, dynamic>)
          : null,
      singular: json['Singular'] != null
          ? SingularSourceProperties.fromJson(
              json['Singular'] as Map<String, dynamic>)
          : null,
      slack: json['Slack'] != null
          ? SlackSourceProperties.fromJson(
              json['Slack'] as Map<String, dynamic>)
          : null,
      trendmicro: json['Trendmicro'] != null
          ? TrendmicroSourceProperties.fromJson(
              json['Trendmicro'] as Map<String, dynamic>)
          : null,
      veeva: json['Veeva'] != null
          ? VeevaSourceProperties.fromJson(
              json['Veeva'] as Map<String, dynamic>)
          : null,
      zendesk: json['Zendesk'] != null
          ? ZendeskSourceProperties.fromJson(
              json['Zendesk'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final amplitude = this.amplitude;
    final customConnector = this.customConnector;
    final datadog = this.datadog;
    final dynatrace = this.dynatrace;
    final googleAnalytics = this.googleAnalytics;
    final inforNexus = this.inforNexus;
    final marketo = this.marketo;
    final pardot = this.pardot;
    final s3 = this.s3;
    final sAPOData = this.sAPOData;
    final salesforce = this.salesforce;
    final serviceNow = this.serviceNow;
    final singular = this.singular;
    final slack = this.slack;
    final trendmicro = this.trendmicro;
    final veeva = this.veeva;
    final zendesk = this.zendesk;
    return {
      if (amplitude != null) 'Amplitude': amplitude,
      if (customConnector != null) 'CustomConnector': customConnector,
      if (datadog != null) 'Datadog': datadog,
      if (dynatrace != null) 'Dynatrace': dynatrace,
      if (googleAnalytics != null) 'GoogleAnalytics': googleAnalytics,
      if (inforNexus != null) 'InforNexus': inforNexus,
      if (marketo != null) 'Marketo': marketo,
      if (pardot != null) 'Pardot': pardot,
      if (s3 != null) 'S3': s3,
      if (sAPOData != null) 'SAPOData': sAPOData,
      if (salesforce != null) 'Salesforce': salesforce,
      if (serviceNow != null) 'ServiceNow': serviceNow,
      if (singular != null) 'Singular': singular,
      if (slack != null) 'Slack': slack,
      if (trendmicro != null) 'Trendmicro': trendmicro,
      if (veeva != null) 'Veeva': veeva,
      if (zendesk != null) 'Zendesk': zendesk,
    };
  }
}

/// The properties that can be applied to a field when the connector is being
/// used as a source.
class SourceFieldProperties {
  /// Indicates if the field can be queried.
  final bool? isQueryable;

  /// Indicates whether the field can be returned in a search result.
  final bool? isRetrievable;

  /// Indicates if this timestamp field can be used for incremental queries.
  final bool? isTimestampFieldForIncrementalQueries;

  SourceFieldProperties({
    this.isQueryable,
    this.isRetrievable,
    this.isTimestampFieldForIncrementalQueries,
  });

  factory SourceFieldProperties.fromJson(Map<String, dynamic> json) {
    return SourceFieldProperties(
      isQueryable: json['isQueryable'] as bool?,
      isRetrievable: json['isRetrievable'] as bool?,
      isTimestampFieldForIncrementalQueries:
          json['isTimestampFieldForIncrementalQueries'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final isQueryable = this.isQueryable;
    final isRetrievable = this.isRetrievable;
    final isTimestampFieldForIncrementalQueries =
        this.isTimestampFieldForIncrementalQueries;
    return {
      if (isQueryable != null) 'isQueryable': isQueryable,
      if (isRetrievable != null) 'isRetrievable': isRetrievable,
      if (isTimestampFieldForIncrementalQueries != null)
        'isTimestampFieldForIncrementalQueries':
            isTimestampFieldForIncrementalQueries,
    };
  }
}

/// Contains information about the configuration of the source connector used in
/// the flow.
class SourceFlowConfig {
  /// The type of connector, such as Salesforce, Amplitude, and so on.
  final ConnectorType connectorType;

  /// Specifies the information that is required to query a particular source
  /// connector.
  final SourceConnectorProperties sourceConnectorProperties;

  /// The API version of the connector when it's used as a source in the flow.
  final String? apiVersion;

  /// The name of the connector profile. This name must be unique for each
  /// connector profile in the Amazon Web Services account.
  final String? connectorProfileName;

  /// Defines the configuration for a scheduled incremental data pull. If a valid
  /// configuration is provided, the fields specified in the configuration are
  /// used when querying for the incremental data pull.
  final IncrementalPullConfig? incrementalPullConfig;

  SourceFlowConfig({
    required this.connectorType,
    required this.sourceConnectorProperties,
    this.apiVersion,
    this.connectorProfileName,
    this.incrementalPullConfig,
  });

  factory SourceFlowConfig.fromJson(Map<String, dynamic> json) {
    return SourceFlowConfig(
      connectorType:
          ConnectorType.fromString((json['connectorType'] as String)),
      sourceConnectorProperties: SourceConnectorProperties.fromJson(
          json['sourceConnectorProperties'] as Map<String, dynamic>),
      apiVersion: json['apiVersion'] as String?,
      connectorProfileName: json['connectorProfileName'] as String?,
      incrementalPullConfig: json['incrementalPullConfig'] != null
          ? IncrementalPullConfig.fromJson(
              json['incrementalPullConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final connectorType = this.connectorType;
    final sourceConnectorProperties = this.sourceConnectorProperties;
    final apiVersion = this.apiVersion;
    final connectorProfileName = this.connectorProfileName;
    final incrementalPullConfig = this.incrementalPullConfig;
    return {
      'connectorType': connectorType.value,
      'sourceConnectorProperties': sourceConnectorProperties,
      if (apiVersion != null) 'apiVersion': apiVersion,
      if (connectorProfileName != null)
        'connectorProfileName': connectorProfileName,
      if (incrementalPullConfig != null)
        'incrementalPullConfig': incrementalPullConfig,
    };
  }
}

class StartFlowResponse {
  /// Returns the internal execution ID of an on-demand flow when the flow is
  /// started. For scheduled or event-triggered flows, this value is null.
  final String? executionId;

  /// The flow's Amazon Resource Name (ARN).
  final String? flowArn;

  /// Indicates the current status of the flow.
  final FlowStatus? flowStatus;

  StartFlowResponse({
    this.executionId,
    this.flowArn,
    this.flowStatus,
  });

  factory StartFlowResponse.fromJson(Map<String, dynamic> json) {
    return StartFlowResponse(
      executionId: json['executionId'] as String?,
      flowArn: json['flowArn'] as String?,
      flowStatus: (json['flowStatus'] as String?)?.let(FlowStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final executionId = this.executionId;
    final flowArn = this.flowArn;
    final flowStatus = this.flowStatus;
    return {
      if (executionId != null) 'executionId': executionId,
      if (flowArn != null) 'flowArn': flowArn,
      if (flowStatus != null) 'flowStatus': flowStatus.value,
    };
  }
}

class StopFlowResponse {
  /// The flow's Amazon Resource Name (ARN).
  final String? flowArn;

  /// Indicates the current status of the flow.
  final FlowStatus? flowStatus;

  StopFlowResponse({
    this.flowArn,
    this.flowStatus,
  });

  factory StopFlowResponse.fromJson(Map<String, dynamic> json) {
    return StopFlowResponse(
      flowArn: json['flowArn'] as String?,
      flowStatus: (json['flowStatus'] as String?)?.let(FlowStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final flowArn = this.flowArn;
    final flowStatus = this.flowStatus;
    return {
      if (flowArn != null) 'flowArn': flowArn,
      if (flowStatus != null) 'flowStatus': flowStatus.value,
    };
  }
}

/// Determines how Amazon AppFlow handles the success response that it gets from
/// the connector after placing data.
///
/// For example, this setting would determine where to write the response from
/// the destination connector upon a successful insert operation.
class SuccessResponseHandlingConfig {
  /// The name of the Amazon S3 bucket.
  final String? bucketName;

  /// The Amazon S3 bucket prefix.
  final String? bucketPrefix;

  SuccessResponseHandlingConfig({
    this.bucketName,
    this.bucketPrefix,
  });

  factory SuccessResponseHandlingConfig.fromJson(Map<String, dynamic> json) {
    return SuccessResponseHandlingConfig(
      bucketName: json['bucketName'] as String?,
      bucketPrefix: json['bucketPrefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final bucketPrefix = this.bucketPrefix;
    return {
      if (bucketName != null) 'bucketName': bucketName,
      if (bucketPrefix != null) 'bucketPrefix': bucketPrefix,
    };
  }
}

enum SupportedDataTransferType {
  record('RECORD'),
  file('FILE'),
  ;

  final String value;

  const SupportedDataTransferType(this.value);

  static SupportedDataTransferType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum SupportedDataTransferType'));
}

/// Contains details regarding all the supported <code>FieldTypes</code> and
/// their corresponding <code>filterOperators</code> and
/// <code>supportedValues</code>.
class SupportedFieldTypeDetails {
  /// The initial supported version for <code>fieldType</code>. If this is later
  /// changed to a different version, v2 will be introduced.
  final FieldTypeDetails v1;

  SupportedFieldTypeDetails({
    required this.v1,
  });

  factory SupportedFieldTypeDetails.fromJson(Map<String, dynamic> json) {
    return SupportedFieldTypeDetails(
      v1: FieldTypeDetails.fromJson(json['v1'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final v1 = this.v1;
    return {
      'v1': v1,
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

/// A class for modeling different type of tasks. Task implementation varies
/// based on the <code>TaskType</code>.
class Task {
  /// The source fields to which a particular task is applied.
  final List<String> sourceFields;

  /// Specifies the particular task implementation that Amazon AppFlow performs.
  final TaskType taskType;

  /// The operation to be performed on the provided source fields.
  final ConnectorOperator? connectorOperator;

  /// A field in a destination connector, or a field value against which Amazon
  /// AppFlow validates a source field.
  final String? destinationField;

  /// A map used to store task-related information. The execution service looks
  /// for particular information based on the <code>TaskType</code>.
  final Map<OperatorPropertiesKeys, String>? taskProperties;

  Task({
    required this.sourceFields,
    required this.taskType,
    this.connectorOperator,
    this.destinationField,
    this.taskProperties,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      sourceFields: (json['sourceFields'] as List)
          .nonNulls
          .map((e) => e as String)
          .toList(),
      taskType: TaskType.fromString((json['taskType'] as String)),
      connectorOperator: json['connectorOperator'] != null
          ? ConnectorOperator.fromJson(
              json['connectorOperator'] as Map<String, dynamic>)
          : null,
      destinationField: json['destinationField'] as String?,
      taskProperties: (json['taskProperties'] as Map<String, dynamic>?)?.map(
          (k, e) =>
              MapEntry(OperatorPropertiesKeys.fromString(k), e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final sourceFields = this.sourceFields;
    final taskType = this.taskType;
    final connectorOperator = this.connectorOperator;
    final destinationField = this.destinationField;
    final taskProperties = this.taskProperties;
    return {
      'sourceFields': sourceFields,
      'taskType': taskType.value,
      if (connectorOperator != null) 'connectorOperator': connectorOperator,
      if (destinationField != null) 'destinationField': destinationField,
      if (taskProperties != null)
        'taskProperties': taskProperties.map((k, e) => MapEntry(k.value, e)),
    };
  }
}

enum TaskType {
  arithmetic('Arithmetic'),
  filter('Filter'),
  map('Map'),
  mapAll('Map_all'),
  mask('Mask'),
  merge('Merge'),
  passthrough('Passthrough'),
  truncate('Truncate'),
  validate('Validate'),
  partition('Partition'),
  ;

  final String value;

  const TaskType(this.value);

  static TaskType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum TaskType'));
}

enum TrendmicroConnectorOperator {
  projection('PROJECTION'),
  equalTo('EQUAL_TO'),
  addition('ADDITION'),
  multiplication('MULTIPLICATION'),
  division('DIVISION'),
  subtraction('SUBTRACTION'),
  maskAll('MASK_ALL'),
  maskFirstN('MASK_FIRST_N'),
  maskLastN('MASK_LAST_N'),
  validateNonNull('VALIDATE_NON_NULL'),
  validateNonZero('VALIDATE_NON_ZERO'),
  validateNonNegative('VALIDATE_NON_NEGATIVE'),
  validateNumeric('VALIDATE_NUMERIC'),
  noOp('NO_OP'),
  ;

  final String value;

  const TrendmicroConnectorOperator(this.value);

  static TrendmicroConnectorOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum TrendmicroConnectorOperator'));
}

/// The connector-specific profile credentials required when using Trend Micro.
class TrendmicroConnectorProfileCredentials {
  /// The Secret Access Key portion of the credentials.
  final String apiSecretKey;

  TrendmicroConnectorProfileCredentials({
    required this.apiSecretKey,
  });

  Map<String, dynamic> toJson() {
    final apiSecretKey = this.apiSecretKey;
    return {
      'apiSecretKey': apiSecretKey,
    };
  }
}

/// The connector-specific profile properties required when using Trend Micro.
class TrendmicroConnectorProfileProperties {
  TrendmicroConnectorProfileProperties();

  factory TrendmicroConnectorProfileProperties.fromJson(
      Map<String, dynamic> _) {
    return TrendmicroConnectorProfileProperties();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The connector metadata specific to Trend Micro.
class TrendmicroMetadata {
  TrendmicroMetadata();

  factory TrendmicroMetadata.fromJson(Map<String, dynamic> _) {
    return TrendmicroMetadata();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The properties that are applied when using Trend Micro as a flow source.
class TrendmicroSourceProperties {
  /// The object specified in the Trend Micro flow source.
  final String object;

  TrendmicroSourceProperties({
    required this.object,
  });

  factory TrendmicroSourceProperties.fromJson(Map<String, dynamic> json) {
    return TrendmicroSourceProperties(
      object: json['object'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final object = this.object;
    return {
      'object': object,
    };
  }
}

/// The trigger settings that determine how and when Amazon AppFlow runs the
/// specified flow.
class TriggerConfig {
  /// Specifies the type of flow trigger. This can be <code>OnDemand</code>,
  /// <code>Scheduled</code>, or <code>Event</code>.
  final TriggerType triggerType;

  /// Specifies the configuration details of a schedule-triggered flow as defined
  /// by the user. Currently, these settings only apply to the
  /// <code>Scheduled</code> trigger type.
  final TriggerProperties? triggerProperties;

  TriggerConfig({
    required this.triggerType,
    this.triggerProperties,
  });

  factory TriggerConfig.fromJson(Map<String, dynamic> json) {
    return TriggerConfig(
      triggerType: TriggerType.fromString((json['triggerType'] as String)),
      triggerProperties: json['triggerProperties'] != null
          ? TriggerProperties.fromJson(
              json['triggerProperties'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final triggerType = this.triggerType;
    final triggerProperties = this.triggerProperties;
    return {
      'triggerType': triggerType.value,
      if (triggerProperties != null) 'triggerProperties': triggerProperties,
    };
  }
}

/// Specifies the configuration details that control the trigger for a flow.
/// Currently, these settings only apply to the <code>Scheduled</code> trigger
/// type.
class TriggerProperties {
  /// Specifies the configuration details of a schedule-triggered flow as defined
  /// by the user.
  final ScheduledTriggerProperties? scheduled;

  TriggerProperties({
    this.scheduled,
  });

  factory TriggerProperties.fromJson(Map<String, dynamic> json) {
    return TriggerProperties(
      scheduled: json['Scheduled'] != null
          ? ScheduledTriggerProperties.fromJson(
              json['Scheduled'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final scheduled = this.scheduled;
    return {
      if (scheduled != null) 'Scheduled': scheduled,
    };
  }
}

enum TriggerType {
  scheduled('Scheduled'),
  event('Event'),
  onDemand('OnDemand'),
  ;

  final String value;

  const TriggerType(this.value);

  static TriggerType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum TriggerType'));
}

class UnregisterConnectorResponse {
  UnregisterConnectorResponse();

  factory UnregisterConnectorResponse.fromJson(Map<String, dynamic> _) {
    return UnregisterConnectorResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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

class UpdateConnectorProfileResponse {
  /// The Amazon Resource Name (ARN) of the connector profile.
  final String? connectorProfileArn;

  UpdateConnectorProfileResponse({
    this.connectorProfileArn,
  });

  factory UpdateConnectorProfileResponse.fromJson(Map<String, dynamic> json) {
    return UpdateConnectorProfileResponse(
      connectorProfileArn: json['connectorProfileArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectorProfileArn = this.connectorProfileArn;
    return {
      if (connectorProfileArn != null)
        'connectorProfileArn': connectorProfileArn,
    };
  }
}

class UpdateConnectorRegistrationResponse {
  /// The ARN of the connector being updated.
  final String? connectorArn;

  UpdateConnectorRegistrationResponse({
    this.connectorArn,
  });

  factory UpdateConnectorRegistrationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateConnectorRegistrationResponse(
      connectorArn: json['connectorArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectorArn = this.connectorArn;
    return {
      if (connectorArn != null) 'connectorArn': connectorArn,
    };
  }
}

class UpdateFlowResponse {
  /// Indicates the current status of the flow.
  final FlowStatus? flowStatus;

  UpdateFlowResponse({
    this.flowStatus,
  });

  factory UpdateFlowResponse.fromJson(Map<String, dynamic> json) {
    return UpdateFlowResponse(
      flowStatus: (json['flowStatus'] as String?)?.let(FlowStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final flowStatus = this.flowStatus;
    return {
      if (flowStatus != null) 'flowStatus': flowStatus.value,
    };
  }
}

/// The properties that are applied when Upsolver is used as a destination.
class UpsolverDestinationProperties {
  /// The Upsolver Amazon S3 bucket name in which Amazon AppFlow places the
  /// transferred data.
  final String bucketName;

  /// The configuration that determines how data is formatted when Upsolver is
  /// used as the flow destination.
  final UpsolverS3OutputFormatConfig s3OutputFormatConfig;

  /// The object key for the destination Upsolver Amazon S3 bucket in which Amazon
  /// AppFlow places the files.
  final String? bucketPrefix;

  UpsolverDestinationProperties({
    required this.bucketName,
    required this.s3OutputFormatConfig,
    this.bucketPrefix,
  });

  factory UpsolverDestinationProperties.fromJson(Map<String, dynamic> json) {
    return UpsolverDestinationProperties(
      bucketName: json['bucketName'] as String,
      s3OutputFormatConfig: UpsolverS3OutputFormatConfig.fromJson(
          json['s3OutputFormatConfig'] as Map<String, dynamic>),
      bucketPrefix: json['bucketPrefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final s3OutputFormatConfig = this.s3OutputFormatConfig;
    final bucketPrefix = this.bucketPrefix;
    return {
      'bucketName': bucketName,
      's3OutputFormatConfig': s3OutputFormatConfig,
      if (bucketPrefix != null) 'bucketPrefix': bucketPrefix,
    };
  }
}

/// The connector metadata specific to Upsolver.
class UpsolverMetadata {
  UpsolverMetadata();

  factory UpsolverMetadata.fromJson(Map<String, dynamic> _) {
    return UpsolverMetadata();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The configuration that determines how Amazon AppFlow formats the flow output
/// data when Upsolver is used as the destination.
class UpsolverS3OutputFormatConfig {
  final PrefixConfig prefixConfig;
  final AggregationConfig? aggregationConfig;

  /// Indicates the file type that Amazon AppFlow places in the Upsolver Amazon S3
  /// bucket.
  final FileType? fileType;

  UpsolverS3OutputFormatConfig({
    required this.prefixConfig,
    this.aggregationConfig,
    this.fileType,
  });

  factory UpsolverS3OutputFormatConfig.fromJson(Map<String, dynamic> json) {
    return UpsolverS3OutputFormatConfig(
      prefixConfig:
          PrefixConfig.fromJson(json['prefixConfig'] as Map<String, dynamic>),
      aggregationConfig: json['aggregationConfig'] != null
          ? AggregationConfig.fromJson(
              json['aggregationConfig'] as Map<String, dynamic>)
          : null,
      fileType: (json['fileType'] as String?)?.let(FileType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final prefixConfig = this.prefixConfig;
    final aggregationConfig = this.aggregationConfig;
    final fileType = this.fileType;
    return {
      'prefixConfig': prefixConfig,
      if (aggregationConfig != null) 'aggregationConfig': aggregationConfig,
      if (fileType != null) 'fileType': fileType.value,
    };
  }
}

enum VeevaConnectorOperator {
  projection('PROJECTION'),
  lessThan('LESS_THAN'),
  greaterThan('GREATER_THAN'),
  contains('CONTAINS'),
  between('BETWEEN'),
  lessThanOrEqualTo('LESS_THAN_OR_EQUAL_TO'),
  greaterThanOrEqualTo('GREATER_THAN_OR_EQUAL_TO'),
  equalTo('EQUAL_TO'),
  notEqualTo('NOT_EQUAL_TO'),
  addition('ADDITION'),
  multiplication('MULTIPLICATION'),
  division('DIVISION'),
  subtraction('SUBTRACTION'),
  maskAll('MASK_ALL'),
  maskFirstN('MASK_FIRST_N'),
  maskLastN('MASK_LAST_N'),
  validateNonNull('VALIDATE_NON_NULL'),
  validateNonZero('VALIDATE_NON_ZERO'),
  validateNonNegative('VALIDATE_NON_NEGATIVE'),
  validateNumeric('VALIDATE_NUMERIC'),
  noOp('NO_OP'),
  ;

  final String value;

  const VeevaConnectorOperator(this.value);

  static VeevaConnectorOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum VeevaConnectorOperator'));
}

/// The connector-specific profile credentials required when using Veeva.
class VeevaConnectorProfileCredentials {
  /// The password that corresponds to the user name.
  final String password;

  /// The name of the user.
  final String username;

  VeevaConnectorProfileCredentials({
    required this.password,
    required this.username,
  });

  Map<String, dynamic> toJson() {
    final password = this.password;
    final username = this.username;
    return {
      'password': password,
      'username': username,
    };
  }
}

/// The connector-specific profile properties required when using Veeva.
class VeevaConnectorProfileProperties {
  /// The location of the Veeva resource.
  final String instanceUrl;

  VeevaConnectorProfileProperties({
    required this.instanceUrl,
  });

  factory VeevaConnectorProfileProperties.fromJson(Map<String, dynamic> json) {
    return VeevaConnectorProfileProperties(
      instanceUrl: json['instanceUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceUrl = this.instanceUrl;
    return {
      'instanceUrl': instanceUrl,
    };
  }
}

/// The connector metadata specific to Veeva.
class VeevaMetadata {
  VeevaMetadata();

  factory VeevaMetadata.fromJson(Map<String, dynamic> _) {
    return VeevaMetadata();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The properties that are applied when using Veeva as a flow source.
class VeevaSourceProperties {
  /// The object specified in the Veeva flow source.
  final String object;

  /// The document type specified in the Veeva document extract flow.
  final String? documentType;

  /// Boolean value to include All Versions of files in Veeva document extract
  /// flow.
  final bool? includeAllVersions;

  /// Boolean value to include file renditions in Veeva document extract flow.
  final bool? includeRenditions;

  /// Boolean value to include source files in Veeva document extract flow.
  final bool? includeSourceFiles;

  VeevaSourceProperties({
    required this.object,
    this.documentType,
    this.includeAllVersions,
    this.includeRenditions,
    this.includeSourceFiles,
  });

  factory VeevaSourceProperties.fromJson(Map<String, dynamic> json) {
    return VeevaSourceProperties(
      object: json['object'] as String,
      documentType: json['documentType'] as String?,
      includeAllVersions: json['includeAllVersions'] as bool?,
      includeRenditions: json['includeRenditions'] as bool?,
      includeSourceFiles: json['includeSourceFiles'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final object = this.object;
    final documentType = this.documentType;
    final includeAllVersions = this.includeAllVersions;
    final includeRenditions = this.includeRenditions;
    final includeSourceFiles = this.includeSourceFiles;
    return {
      'object': object,
      if (documentType != null) 'documentType': documentType,
      if (includeAllVersions != null) 'includeAllVersions': includeAllVersions,
      if (includeRenditions != null) 'includeRenditions': includeRenditions,
      if (includeSourceFiles != null) 'includeSourceFiles': includeSourceFiles,
    };
  }
}

/// The possible write operations in the destination connector. When this value
/// is not provided, this defaults to the <code>INSERT</code> operation.
enum WriteOperationType {
  insert('INSERT'),
  upsert('UPSERT'),
  update('UPDATE'),
  delete('DELETE'),
  ;

  final String value;

  const WriteOperationType(this.value);

  static WriteOperationType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum WriteOperationType'));
}

enum ZendeskConnectorOperator {
  projection('PROJECTION'),
  greaterThan('GREATER_THAN'),
  addition('ADDITION'),
  multiplication('MULTIPLICATION'),
  division('DIVISION'),
  subtraction('SUBTRACTION'),
  maskAll('MASK_ALL'),
  maskFirstN('MASK_FIRST_N'),
  maskLastN('MASK_LAST_N'),
  validateNonNull('VALIDATE_NON_NULL'),
  validateNonZero('VALIDATE_NON_ZERO'),
  validateNonNegative('VALIDATE_NON_NEGATIVE'),
  validateNumeric('VALIDATE_NUMERIC'),
  noOp('NO_OP'),
  ;

  final String value;

  const ZendeskConnectorOperator(this.value);

  static ZendeskConnectorOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum ZendeskConnectorOperator'));
}

/// The connector-specific profile credentials required when using Zendesk.
class ZendeskConnectorProfileCredentials {
  /// The identifier for the desired client.
  final String clientId;

  /// The client secret used by the OAuth client to authenticate to the
  /// authorization server.
  final String clientSecret;

  /// The credentials used to access protected Zendesk resources.
  final String? accessToken;

  /// The OAuth requirement needed to request security tokens from the connector
  /// endpoint.
  final ConnectorOAuthRequest? oAuthRequest;

  ZendeskConnectorProfileCredentials({
    required this.clientId,
    required this.clientSecret,
    this.accessToken,
    this.oAuthRequest,
  });

  Map<String, dynamic> toJson() {
    final clientId = this.clientId;
    final clientSecret = this.clientSecret;
    final accessToken = this.accessToken;
    final oAuthRequest = this.oAuthRequest;
    return {
      'clientId': clientId,
      'clientSecret': clientSecret,
      if (accessToken != null) 'accessToken': accessToken,
      if (oAuthRequest != null) 'oAuthRequest': oAuthRequest,
    };
  }
}

/// The connector-specific profile properties required when using Zendesk.
class ZendeskConnectorProfileProperties {
  /// The location of the Zendesk resource.
  final String instanceUrl;

  ZendeskConnectorProfileProperties({
    required this.instanceUrl,
  });

  factory ZendeskConnectorProfileProperties.fromJson(
      Map<String, dynamic> json) {
    return ZendeskConnectorProfileProperties(
      instanceUrl: json['instanceUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceUrl = this.instanceUrl;
    return {
      'instanceUrl': instanceUrl,
    };
  }
}

/// The properties that are applied when Zendesk is used as a destination.
class ZendeskDestinationProperties {
  /// The object specified in the Zendesk flow destination.
  final String object;
  final ErrorHandlingConfig? errorHandlingConfig;
  final List<String>? idFieldNames;
  final WriteOperationType? writeOperationType;

  ZendeskDestinationProperties({
    required this.object,
    this.errorHandlingConfig,
    this.idFieldNames,
    this.writeOperationType,
  });

  factory ZendeskDestinationProperties.fromJson(Map<String, dynamic> json) {
    return ZendeskDestinationProperties(
      object: json['object'] as String,
      errorHandlingConfig: json['errorHandlingConfig'] != null
          ? ErrorHandlingConfig.fromJson(
              json['errorHandlingConfig'] as Map<String, dynamic>)
          : null,
      idFieldNames: (json['idFieldNames'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      writeOperationType: (json['writeOperationType'] as String?)
          ?.let(WriteOperationType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final object = this.object;
    final errorHandlingConfig = this.errorHandlingConfig;
    final idFieldNames = this.idFieldNames;
    final writeOperationType = this.writeOperationType;
    return {
      'object': object,
      if (errorHandlingConfig != null)
        'errorHandlingConfig': errorHandlingConfig,
      if (idFieldNames != null) 'idFieldNames': idFieldNames,
      if (writeOperationType != null)
        'writeOperationType': writeOperationType.value,
    };
  }
}

/// The connector metadata specific to Zendesk.
class ZendeskMetadata {
  /// The desired authorization scope for the Zendesk account.
  final List<String>? oAuthScopes;

  ZendeskMetadata({
    this.oAuthScopes,
  });

  factory ZendeskMetadata.fromJson(Map<String, dynamic> json) {
    return ZendeskMetadata(
      oAuthScopes: (json['oAuthScopes'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final oAuthScopes = this.oAuthScopes;
    return {
      if (oAuthScopes != null) 'oAuthScopes': oAuthScopes,
    };
  }
}

/// The properties that are applied when using Zendesk as a flow source.
class ZendeskSourceProperties {
  /// The object specified in the Zendesk flow source.
  final String object;

  ZendeskSourceProperties({
    required this.object,
  });

  factory ZendeskSourceProperties.fromJson(Map<String, dynamic> json) {
    return ZendeskSourceProperties(
      object: json['object'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final object = this.object;
    return {
      'object': object,
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

class ConnectorAuthenticationException extends _s.GenericAwsException {
  ConnectorAuthenticationException({String? type, String? message})
      : super(
            type: type,
            code: 'ConnectorAuthenticationException',
            message: message);
}

class ConnectorServerException extends _s.GenericAwsException {
  ConnectorServerException({String? type, String? message})
      : super(type: type, code: 'ConnectorServerException', message: message);
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

class UnsupportedOperationException extends _s.GenericAwsException {
  UnsupportedOperationException({String? type, String? message})
      : super(
            type: type,
            code: 'UnsupportedOperationException',
            message: message);
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
  'ConnectorAuthenticationException': (type, message) =>
      ConnectorAuthenticationException(type: type, message: message),
  'ConnectorServerException': (type, message) =>
      ConnectorServerException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'UnsupportedOperationException': (type, message) =>
      UnsupportedOperationException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
