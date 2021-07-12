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

/// Welcome to the Amazon AppFlow API reference. This guide is for developers
/// who need detailed information about the Amazon AppFlow API operations, data
/// types, and errors.
///
/// Amazon AppFlow is a fully managed integration service that enables you to
/// securely transfer data between software as a service (SaaS) applications
/// like Salesforce, Marketo, Slack, and ServiceNow, and AWS services like
/// Amazon S3 and Amazon Redshift.
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
          endpointUrl: endpointUrl,
        );

  /// Creates a new connector profile associated with your AWS account. There is
  /// a soft quota of 100 connector profiles per AWS account. If you need more
  /// connector profiles than this quota allows, you can submit a request to the
  /// Amazon AppFlow team through the Amazon AppFlow support channel.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConnectorAuthenticationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [connectionMode] :
  /// Indicates the connection mode and specifies whether it is public or
  /// private. Private flows use AWS PrivateLink to route data over AWS
  /// infrastructure without exposing it to the public internet.
  ///
  /// Parameter [connectorProfileConfig] :
  /// Defines the connector-specific configuration and credentials.
  ///
  /// Parameter [connectorProfileName] :
  /// The name of the connector profile. The name is unique for each
  /// <code>ConnectorProfile</code> in your AWS account.
  ///
  /// Parameter [connectorType] :
  /// The type of connector, such as Salesforce, Amplitude, and so on.
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
    String? kmsArn,
  }) async {
    ArgumentError.checkNotNull(connectionMode, 'connectionMode');
    ArgumentError.checkNotNull(
        connectorProfileConfig, 'connectorProfileConfig');
    ArgumentError.checkNotNull(connectorProfileName, 'connectorProfileName');
    _s.validateStringLength(
      'connectorProfileName',
      connectorProfileName,
      0,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(connectorType, 'connectorType');
    _s.validateStringLength(
      'kmsArn',
      kmsArn,
      20,
      2048,
    );
    final $payload = <String, dynamic>{
      'connectionMode': connectionMode.toValue(),
      'connectorProfileConfig': connectorProfileConfig,
      'connectorProfileName': connectorProfileName,
      'connectorType': connectorType.toValue(),
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
  /// Parameter [description] :
  /// A description of the flow you want to create.
  ///
  /// Parameter [kmsArn] :
  /// The ARN (Amazon Resource Name) of the Key Management Service (KMS) key you
  /// provide for encryption. This is required if you do not want to use the
  /// Amazon AppFlow-managed KMS key. If you don't provide anything here, Amazon
  /// AppFlow uses the Amazon AppFlow-managed KMS key.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for your flow.
  Future<CreateFlowResponse> createFlow({
    required List<DestinationFlowConfig> destinationFlowConfigList,
    required String flowName,
    required SourceFlowConfig sourceFlowConfig,
    required List<Task> tasks,
    required TriggerConfig triggerConfig,
    String? description,
    String? kmsArn,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(
        destinationFlowConfigList, 'destinationFlowConfigList');
    ArgumentError.checkNotNull(flowName, 'flowName');
    _s.validateStringLength(
      'flowName',
      flowName,
      0,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(sourceFlowConfig, 'sourceFlowConfig');
    ArgumentError.checkNotNull(tasks, 'tasks');
    ArgumentError.checkNotNull(triggerConfig, 'triggerConfig');
    _s.validateStringLength(
      'description',
      description,
      0,
      2048,
    );
    _s.validateStringLength(
      'kmsArn',
      kmsArn,
      20,
      2048,
    );
    final $payload = <String, dynamic>{
      'destinationFlowConfigList': destinationFlowConfigList,
      'flowName': flowName,
      'sourceFlowConfig': sourceFlowConfig,
      'tasks': tasks,
      'triggerConfig': triggerConfig,
      if (description != null) 'description': description,
      if (kmsArn != null) 'kmsArn': kmsArn,
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
    ArgumentError.checkNotNull(connectorProfileName, 'connectorProfileName');
    _s.validateStringLength(
      'connectorProfileName',
      connectorProfileName,
      0,
      256,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(flowName, 'flowName');
    _s.validateStringLength(
      'flowName',
      flowName,
      0,
      256,
      isRequired: true,
    );
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

  /// Provides details regarding the entity used with the connector, with a
  /// description of the data model for each entity.
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
  /// Parameter [connectorProfileName] :
  /// The name of the connector profile. The name is unique for each
  /// <code>ConnectorProfile</code> in the AWS account.
  ///
  /// Parameter [connectorType] :
  /// The type of connector application, such as Salesforce, Amplitude, and so
  /// on.
  Future<DescribeConnectorEntityResponse> describeConnectorEntity({
    required String connectorEntityName,
    String? connectorProfileName,
    ConnectorType? connectorType,
  }) async {
    ArgumentError.checkNotNull(connectorEntityName, 'connectorEntityName');
    _s.validateStringLength(
      'connectorEntityName',
      connectorEntityName,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'connectorProfileName',
      connectorProfileName,
      0,
      256,
    );
    final $payload = <String, dynamic>{
      'connectorEntityName': connectorEntityName,
      if (connectorProfileName != null)
        'connectorProfileName': connectorProfileName,
      if (connectorType != null) 'connectorType': connectorType.toValue(),
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
  /// Parameter [connectorProfileNames] :
  /// The name of the connector profile. The name is unique for each
  /// <code>ConnectorProfile</code> in the AWS account.
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
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      2048,
    );
    final $payload = <String, dynamic>{
      if (connectorProfileNames != null)
        'connectorProfileNames': connectorProfileNames,
      if (connectorType != null) 'connectorType': connectorType.toValue(),
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
  /// Parameter [nextToken] :
  /// The pagination token for the next page of data.
  Future<DescribeConnectorsResponse> describeConnectors({
    List<ConnectorType>? connectorTypes,
    String? nextToken,
  }) async {
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      2048,
    );
    final $payload = <String, dynamic>{
      if (connectorTypes != null)
        'connectorTypes': connectorTypes.map((e) => e.toValue()).toList(),
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
    ArgumentError.checkNotNull(flowName, 'flowName');
    _s.validateStringLength(
      'flowName',
      flowName,
      0,
      256,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(flowName, 'flowName');
    _s.validateStringLength(
      'flowName',
      flowName,
      0,
      256,
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
      0,
      2048,
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
  /// Parameter [connectorProfileName] :
  /// The name of the connector profile. The name is unique for each
  /// <code>ConnectorProfile</code> in the AWS account, and is used to query the
  /// downstream connector.
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
  Future<ListConnectorEntitiesResponse> listConnectorEntities({
    String? connectorProfileName,
    ConnectorType? connectorType,
    String? entitiesPath,
  }) async {
    _s.validateStringLength(
      'connectorProfileName',
      connectorProfileName,
      0,
      256,
    );
    _s.validateStringLength(
      'entitiesPath',
      entitiesPath,
      0,
      256,
    );
    final $payload = <String, dynamic>{
      if (connectorProfileName != null)
        'connectorProfileName': connectorProfileName,
      if (connectorType != null) 'connectorType': connectorType.toValue(),
      if (entitiesPath != null) 'entitiesPath': entitiesPath,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-connector-entities',
      exceptionFnMap: _exceptionFns,
    );
    return ListConnectorEntitiesResponse.fromJson(response);
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
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      2048,
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
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      0,
      512,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
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
  Future<StartFlowResponse> startFlow({
    required String flowName,
  }) async {
    ArgumentError.checkNotNull(flowName, 'flowName');
    _s.validateStringLength(
      'flowName',
      flowName,
      0,
      256,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'flowName': flowName,
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
    ArgumentError.checkNotNull(flowName, 'flowName');
    _s.validateStringLength(
      'flowName',
      flowName,
      0,
      256,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      0,
      512,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
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
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      0,
      512,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
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
  /// <code>ConnectorProfile</code> in the AWS Account.
  Future<UpdateConnectorProfileResponse> updateConnectorProfile({
    required ConnectionMode connectionMode,
    required ConnectorProfileConfig connectorProfileConfig,
    required String connectorProfileName,
  }) async {
    ArgumentError.checkNotNull(connectionMode, 'connectionMode');
    ArgumentError.checkNotNull(
        connectorProfileConfig, 'connectorProfileConfig');
    ArgumentError.checkNotNull(connectorProfileName, 'connectorProfileName');
    _s.validateStringLength(
      'connectorProfileName',
      connectorProfileName,
      0,
      256,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'connectionMode': connectionMode.toValue(),
      'connectorProfileConfig': connectorProfileConfig,
      'connectorProfileName': connectorProfileName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/update-connector-profile',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateConnectorProfileResponse.fromJson(response);
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
  /// Parameter [description] :
  /// A description of the flow.
  Future<UpdateFlowResponse> updateFlow({
    required List<DestinationFlowConfig> destinationFlowConfigList,
    required String flowName,
    required List<Task> tasks,
    required TriggerConfig triggerConfig,
    String? description,
    SourceFlowConfig? sourceFlowConfig,
  }) async {
    ArgumentError.checkNotNull(
        destinationFlowConfigList, 'destinationFlowConfigList');
    ArgumentError.checkNotNull(flowName, 'flowName');
    _s.validateStringLength(
      'flowName',
      flowName,
      0,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tasks, 'tasks');
    ArgumentError.checkNotNull(triggerConfig, 'triggerConfig');
    _s.validateStringLength(
      'description',
      description,
      0,
      2048,
    );
    final $payload = <String, dynamic>{
      'destinationFlowConfigList': destinationFlowConfigList,
      'flowName': flowName,
      'tasks': tasks,
      'triggerConfig': triggerConfig,
      if (description != null) 'description': description,
      if (sourceFlowConfig != null) 'sourceFlowConfig': sourceFlowConfig,
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

  AggregationConfig({
    this.aggregationType,
  });

  factory AggregationConfig.fromJson(Map<String, dynamic> json) {
    return AggregationConfig(
      aggregationType:
          (json['aggregationType'] as String?)?.toAggregationType(),
    );
  }

  Map<String, dynamic> toJson() {
    final aggregationType = this.aggregationType;
    return {
      if (aggregationType != null) 'aggregationType': aggregationType.toValue(),
    };
  }
}

enum AggregationType {
  none,
  singleFile,
}

extension on AggregationType {
  String toValue() {
    switch (this) {
      case AggregationType.none:
        return 'None';
      case AggregationType.singleFile:
        return 'SingleFile';
    }
  }
}

extension on String {
  AggregationType toAggregationType() {
    switch (this) {
      case 'None':
        return AggregationType.none;
      case 'SingleFile':
        return AggregationType.singleFile;
    }
    throw Exception('$this is not known in enum AggregationType');
  }
}

enum AmplitudeConnectorOperator {
  between,
}

extension on AmplitudeConnectorOperator {
  String toValue() {
    switch (this) {
      case AmplitudeConnectorOperator.between:
        return 'BETWEEN';
    }
  }
}

extension on String {
  AmplitudeConnectorOperator toAmplitudeConnectorOperator() {
    switch (this) {
      case 'BETWEEN':
        return AmplitudeConnectorOperator.between;
    }
    throw Exception('$this is not known in enum AmplitudeConnectorOperator');
  }
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

  factory AmplitudeConnectorProfileCredentials.fromJson(
      Map<String, dynamic> json) {
    return AmplitudeConnectorProfileCredentials(
      apiKey: json['apiKey'] as String,
      secretKey: json['secretKey'] as String,
    );
  }

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

enum ConnectionMode {
  public,
  private,
}

extension on ConnectionMode {
  String toValue() {
    switch (this) {
      case ConnectionMode.public:
        return 'Public';
      case ConnectionMode.private:
        return 'Private';
    }
  }
}

extension on String {
  ConnectionMode toConnectionMode() {
    switch (this) {
      case 'Public':
        return ConnectionMode.public;
      case 'Private':
        return ConnectionMode.private;
    }
    throw Exception('$this is not known in enum ConnectionMode');
  }
}

/// The configuration settings related to a given connector.
class ConnectorConfiguration {
  /// Specifies whether the connector can be used as a destination.
  final bool? canUseAsDestination;

  /// Specifies whether the connector can be used as a source.
  final bool? canUseAsSource;

  /// Specifies connector-specific metadata such as <code>oAuthScopes</code>,
  /// <code>supportedRegions</code>, <code>privateLinkServiceUrl</code>, and so
  /// on.
  final ConnectorMetadata? connectorMetadata;

  /// Specifies if PrivateLink is enabled for that connector.
  final bool? isPrivateLinkEnabled;

  /// Specifies if a PrivateLink endpoint URL is required.
  final bool? isPrivateLinkEndpointUrlRequired;

  /// Lists the connectors that are available for use as destinations.
  final List<ConnectorType>? supportedDestinationConnectors;

  /// Specifies the supported flow frequency for that connector.
  final List<ScheduleFrequencyType>? supportedSchedulingFrequencies;

  /// Specifies the supported trigger types for the flow.
  final List<TriggerType>? supportedTriggerTypes;

  ConnectorConfiguration({
    this.canUseAsDestination,
    this.canUseAsSource,
    this.connectorMetadata,
    this.isPrivateLinkEnabled,
    this.isPrivateLinkEndpointUrlRequired,
    this.supportedDestinationConnectors,
    this.supportedSchedulingFrequencies,
    this.supportedTriggerTypes,
  });

  factory ConnectorConfiguration.fromJson(Map<String, dynamic> json) {
    return ConnectorConfiguration(
      canUseAsDestination: json['canUseAsDestination'] as bool?,
      canUseAsSource: json['canUseAsSource'] as bool?,
      connectorMetadata: json['connectorMetadata'] != null
          ? ConnectorMetadata.fromJson(
              json['connectorMetadata'] as Map<String, dynamic>)
          : null,
      isPrivateLinkEnabled: json['isPrivateLinkEnabled'] as bool?,
      isPrivateLinkEndpointUrlRequired:
          json['isPrivateLinkEndpointUrlRequired'] as bool?,
      supportedDestinationConnectors:
          (json['supportedDestinationConnectors'] as List?)
              ?.whereNotNull()
              .map((e) => (e as String).toConnectorType())
              .toList(),
      supportedSchedulingFrequencies:
          (json['supportedSchedulingFrequencies'] as List?)
              ?.whereNotNull()
              .map((e) => (e as String).toScheduleFrequencyType())
              .toList(),
      supportedTriggerTypes: (json['supportedTriggerTypes'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toTriggerType())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final canUseAsDestination = this.canUseAsDestination;
    final canUseAsSource = this.canUseAsSource;
    final connectorMetadata = this.connectorMetadata;
    final isPrivateLinkEnabled = this.isPrivateLinkEnabled;
    final isPrivateLinkEndpointUrlRequired =
        this.isPrivateLinkEndpointUrlRequired;
    final supportedDestinationConnectors = this.supportedDestinationConnectors;
    final supportedSchedulingFrequencies = this.supportedSchedulingFrequencies;
    final supportedTriggerTypes = this.supportedTriggerTypes;
    return {
      if (canUseAsDestination != null)
        'canUseAsDestination': canUseAsDestination,
      if (canUseAsSource != null) 'canUseAsSource': canUseAsSource,
      if (connectorMetadata != null) 'connectorMetadata': connectorMetadata,
      if (isPrivateLinkEnabled != null)
        'isPrivateLinkEnabled': isPrivateLinkEnabled,
      if (isPrivateLinkEndpointUrlRequired != null)
        'isPrivateLinkEndpointUrlRequired': isPrivateLinkEndpointUrlRequired,
      if (supportedDestinationConnectors != null)
        'supportedDestinationConnectors':
            supportedDestinationConnectors.map((e) => e.toValue()).toList(),
      if (supportedSchedulingFrequencies != null)
        'supportedSchedulingFrequencies':
            supportedSchedulingFrequencies.map((e) => e.toValue()).toList(),
      if (supportedTriggerTypes != null)
        'supportedTriggerTypes':
            supportedTriggerTypes.map((e) => e.toValue()).toList(),
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

  /// A description of the connector entity field.
  final String? description;

  /// The properties applied to a field when the connector is being used as a
  /// destination.
  final DestinationFieldProperties? destinationProperties;

  /// The label applied to a connector entity field.
  final String? label;

  /// The properties that can be applied to a field when the connector is being
  /// used as a source.
  final SourceFieldProperties? sourceProperties;

  /// Contains details regarding the supported <code>FieldType</code>, including
  /// the corresponding <code>filterOperators</code> and
  /// <code>supportedValues</code>.
  final SupportedFieldTypeDetails? supportedFieldTypeDetails;

  ConnectorEntityField({
    required this.identifier,
    this.description,
    this.destinationProperties,
    this.label,
    this.sourceProperties,
    this.supportedFieldTypeDetails,
  });

  factory ConnectorEntityField.fromJson(Map<String, dynamic> json) {
    return ConnectorEntityField(
      identifier: json['identifier'] as String,
      description: json['description'] as String?,
      destinationProperties: json['destinationProperties'] != null
          ? DestinationFieldProperties.fromJson(
              json['destinationProperties'] as Map<String, dynamic>)
          : null,
      label: json['label'] as String?,
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
    final description = this.description;
    final destinationProperties = this.destinationProperties;
    final label = this.label;
    final sourceProperties = this.sourceProperties;
    final supportedFieldTypeDetails = this.supportedFieldTypeDetails;
    return {
      'identifier': identifier,
      if (description != null) 'description': description,
      if (destinationProperties != null)
        'destinationProperties': destinationProperties,
      if (label != null) 'label': label,
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

  /// The connector metadata specific to Amazon Redshift.
  final RedshiftMetadata? redshift;

  /// The connector metadata specific to Amazon S3.
  final S3Metadata? s3;

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
    this.redshift,
    this.s3,
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
      redshift: json['Redshift'] != null
          ? RedshiftMetadata.fromJson(json['Redshift'] as Map<String, dynamic>)
          : null,
      s3: json['S3'] != null
          ? S3Metadata.fromJson(json['S3'] as Map<String, dynamic>)
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
    final redshift = this.redshift;
    final s3 = this.s3;
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
      if (redshift != null) 'Redshift': redshift,
      if (s3 != null) 'S3': s3,
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

  factory ConnectorOAuthRequest.fromJson(Map<String, dynamic> json) {
    return ConnectorOAuthRequest(
      authCode: json['authCode'] as String?,
      redirectUri: json['redirectUri'] as String?,
    );
  }

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

  /// The operation to be performed on the provided Amazon S3 source fields.
  final S3ConnectorOperator? s3;

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
    this.datadog,
    this.dynatrace,
    this.googleAnalytics,
    this.inforNexus,
    this.marketo,
    this.s3,
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
      amplitude: (json['Amplitude'] as String?)?.toAmplitudeConnectorOperator(),
      datadog: (json['Datadog'] as String?)?.toDatadogConnectorOperator(),
      dynatrace: (json['Dynatrace'] as String?)?.toDynatraceConnectorOperator(),
      googleAnalytics: (json['GoogleAnalytics'] as String?)
          ?.toGoogleAnalyticsConnectorOperator(),
      inforNexus:
          (json['InforNexus'] as String?)?.toInforNexusConnectorOperator(),
      marketo: (json['Marketo'] as String?)?.toMarketoConnectorOperator(),
      s3: (json['S3'] as String?)?.toS3ConnectorOperator(),
      salesforce:
          (json['Salesforce'] as String?)?.toSalesforceConnectorOperator(),
      serviceNow:
          (json['ServiceNow'] as String?)?.toServiceNowConnectorOperator(),
      singular: (json['Singular'] as String?)?.toSingularConnectorOperator(),
      slack: (json['Slack'] as String?)?.toSlackConnectorOperator(),
      trendmicro:
          (json['Trendmicro'] as String?)?.toTrendmicroConnectorOperator(),
      veeva: (json['Veeva'] as String?)?.toVeevaConnectorOperator(),
      zendesk: (json['Zendesk'] as String?)?.toZendeskConnectorOperator(),
    );
  }

  Map<String, dynamic> toJson() {
    final amplitude = this.amplitude;
    final datadog = this.datadog;
    final dynatrace = this.dynatrace;
    final googleAnalytics = this.googleAnalytics;
    final inforNexus = this.inforNexus;
    final marketo = this.marketo;
    final s3 = this.s3;
    final salesforce = this.salesforce;
    final serviceNow = this.serviceNow;
    final singular = this.singular;
    final slack = this.slack;
    final trendmicro = this.trendmicro;
    final veeva = this.veeva;
    final zendesk = this.zendesk;
    return {
      if (amplitude != null) 'Amplitude': amplitude.toValue(),
      if (datadog != null) 'Datadog': datadog.toValue(),
      if (dynatrace != null) 'Dynatrace': dynatrace.toValue(),
      if (googleAnalytics != null) 'GoogleAnalytics': googleAnalytics.toValue(),
      if (inforNexus != null) 'InforNexus': inforNexus.toValue(),
      if (marketo != null) 'Marketo': marketo.toValue(),
      if (s3 != null) 'S3': s3.toValue(),
      if (salesforce != null) 'Salesforce': salesforce.toValue(),
      if (serviceNow != null) 'ServiceNow': serviceNow.toValue(),
      if (singular != null) 'Singular': singular.toValue(),
      if (slack != null) 'Slack': slack.toValue(),
      if (trendmicro != null) 'Trendmicro': trendmicro.toValue(),
      if (veeva != null) 'Veeva': veeva.toValue(),
      if (zendesk != null) 'Zendesk': zendesk.toValue(),
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

  /// The Amazon Resource Name (ARN) of the connector profile.
  final String? connectorProfileArn;

  /// The name of the connector profile. The name is unique for each
  /// <code>ConnectorProfile</code> in the AWS account.
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

  ConnectorProfile({
    this.connectionMode,
    this.connectorProfileArn,
    this.connectorProfileName,
    this.connectorProfileProperties,
    this.connectorType,
    this.createdAt,
    this.credentialsArn,
    this.lastUpdatedAt,
  });

  factory ConnectorProfile.fromJson(Map<String, dynamic> json) {
    return ConnectorProfile(
      connectionMode: (json['connectionMode'] as String?)?.toConnectionMode(),
      connectorProfileArn: json['connectorProfileArn'] as String?,
      connectorProfileName: json['connectorProfileName'] as String?,
      connectorProfileProperties: json['connectorProfileProperties'] != null
          ? ConnectorProfileProperties.fromJson(
              json['connectorProfileProperties'] as Map<String, dynamic>)
          : null,
      connectorType: (json['connectorType'] as String?)?.toConnectorType(),
      createdAt: timeStampFromJson(json['createdAt']),
      credentialsArn: json['credentialsArn'] as String?,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final connectionMode = this.connectionMode;
    final connectorProfileArn = this.connectorProfileArn;
    final connectorProfileName = this.connectorProfileName;
    final connectorProfileProperties = this.connectorProfileProperties;
    final connectorType = this.connectorType;
    final createdAt = this.createdAt;
    final credentialsArn = this.credentialsArn;
    final lastUpdatedAt = this.lastUpdatedAt;
    return {
      if (connectionMode != null) 'connectionMode': connectionMode.toValue(),
      if (connectorProfileArn != null)
        'connectorProfileArn': connectorProfileArn,
      if (connectorProfileName != null)
        'connectorProfileName': connectorProfileName,
      if (connectorProfileProperties != null)
        'connectorProfileProperties': connectorProfileProperties,
      if (connectorType != null) 'connectorType': connectorType.toValue(),
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (credentialsArn != null) 'credentialsArn': credentialsArn,
      if (lastUpdatedAt != null)
        'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
    };
  }
}

/// Defines the connector-specific configuration and credentials for the
/// connector profile.
class ConnectorProfileConfig {
  /// The connector-specific credentials required by each connector.
  final ConnectorProfileCredentials connectorProfileCredentials;

  /// The connector-specific properties of the profile configuration.
  final ConnectorProfileProperties connectorProfileProperties;

  ConnectorProfileConfig({
    required this.connectorProfileCredentials,
    required this.connectorProfileProperties,
  });

  factory ConnectorProfileConfig.fromJson(Map<String, dynamic> json) {
    return ConnectorProfileConfig(
      connectorProfileCredentials: ConnectorProfileCredentials.fromJson(
          json['connectorProfileCredentials'] as Map<String, dynamic>),
      connectorProfileProperties: ConnectorProfileProperties.fromJson(
          json['connectorProfileProperties'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final connectorProfileCredentials = this.connectorProfileCredentials;
    final connectorProfileProperties = this.connectorProfileProperties;
    return {
      'connectorProfileCredentials': connectorProfileCredentials,
      'connectorProfileProperties': connectorProfileProperties,
    };
  }
}

/// The connector-specific credentials required by a connector.
class ConnectorProfileCredentials {
  /// The connector-specific credentials required when using Amplitude.
  final AmplitudeConnectorProfileCredentials? amplitude;

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

  /// The connector-specific credentials required when using Amazon Redshift.
  final RedshiftConnectorProfileCredentials? redshift;

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
    this.datadog,
    this.dynatrace,
    this.googleAnalytics,
    this.honeycode,
    this.inforNexus,
    this.marketo,
    this.redshift,
    this.salesforce,
    this.serviceNow,
    this.singular,
    this.slack,
    this.snowflake,
    this.trendmicro,
    this.veeva,
    this.zendesk,
  });

  factory ConnectorProfileCredentials.fromJson(Map<String, dynamic> json) {
    return ConnectorProfileCredentials(
      amplitude: json['Amplitude'] != null
          ? AmplitudeConnectorProfileCredentials.fromJson(
              json['Amplitude'] as Map<String, dynamic>)
          : null,
      datadog: json['Datadog'] != null
          ? DatadogConnectorProfileCredentials.fromJson(
              json['Datadog'] as Map<String, dynamic>)
          : null,
      dynatrace: json['Dynatrace'] != null
          ? DynatraceConnectorProfileCredentials.fromJson(
              json['Dynatrace'] as Map<String, dynamic>)
          : null,
      googleAnalytics: json['GoogleAnalytics'] != null
          ? GoogleAnalyticsConnectorProfileCredentials.fromJson(
              json['GoogleAnalytics'] as Map<String, dynamic>)
          : null,
      honeycode: json['Honeycode'] != null
          ? HoneycodeConnectorProfileCredentials.fromJson(
              json['Honeycode'] as Map<String, dynamic>)
          : null,
      inforNexus: json['InforNexus'] != null
          ? InforNexusConnectorProfileCredentials.fromJson(
              json['InforNexus'] as Map<String, dynamic>)
          : null,
      marketo: json['Marketo'] != null
          ? MarketoConnectorProfileCredentials.fromJson(
              json['Marketo'] as Map<String, dynamic>)
          : null,
      redshift: json['Redshift'] != null
          ? RedshiftConnectorProfileCredentials.fromJson(
              json['Redshift'] as Map<String, dynamic>)
          : null,
      salesforce: json['Salesforce'] != null
          ? SalesforceConnectorProfileCredentials.fromJson(
              json['Salesforce'] as Map<String, dynamic>)
          : null,
      serviceNow: json['ServiceNow'] != null
          ? ServiceNowConnectorProfileCredentials.fromJson(
              json['ServiceNow'] as Map<String, dynamic>)
          : null,
      singular: json['Singular'] != null
          ? SingularConnectorProfileCredentials.fromJson(
              json['Singular'] as Map<String, dynamic>)
          : null,
      slack: json['Slack'] != null
          ? SlackConnectorProfileCredentials.fromJson(
              json['Slack'] as Map<String, dynamic>)
          : null,
      snowflake: json['Snowflake'] != null
          ? SnowflakeConnectorProfileCredentials.fromJson(
              json['Snowflake'] as Map<String, dynamic>)
          : null,
      trendmicro: json['Trendmicro'] != null
          ? TrendmicroConnectorProfileCredentials.fromJson(
              json['Trendmicro'] as Map<String, dynamic>)
          : null,
      veeva: json['Veeva'] != null
          ? VeevaConnectorProfileCredentials.fromJson(
              json['Veeva'] as Map<String, dynamic>)
          : null,
      zendesk: json['Zendesk'] != null
          ? ZendeskConnectorProfileCredentials.fromJson(
              json['Zendesk'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final amplitude = this.amplitude;
    final datadog = this.datadog;
    final dynatrace = this.dynatrace;
    final googleAnalytics = this.googleAnalytics;
    final honeycode = this.honeycode;
    final inforNexus = this.inforNexus;
    final marketo = this.marketo;
    final redshift = this.redshift;
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
      if (datadog != null) 'Datadog': datadog,
      if (dynatrace != null) 'Dynatrace': dynatrace,
      if (googleAnalytics != null) 'GoogleAnalytics': googleAnalytics,
      if (honeycode != null) 'Honeycode': honeycode,
      if (inforNexus != null) 'InforNexus': inforNexus,
      if (marketo != null) 'Marketo': marketo,
      if (redshift != null) 'Redshift': redshift,
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

  /// The connector-specific properties required by Amazon Redshift.
  final RedshiftConnectorProfileProperties? redshift;

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
    this.datadog,
    this.dynatrace,
    this.googleAnalytics,
    this.honeycode,
    this.inforNexus,
    this.marketo,
    this.redshift,
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
      redshift: json['Redshift'] != null
          ? RedshiftConnectorProfileProperties.fromJson(
              json['Redshift'] as Map<String, dynamic>)
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
    final datadog = this.datadog;
    final dynatrace = this.dynatrace;
    final googleAnalytics = this.googleAnalytics;
    final honeycode = this.honeycode;
    final inforNexus = this.inforNexus;
    final marketo = this.marketo;
    final redshift = this.redshift;
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
      if (datadog != null) 'Datadog': datadog,
      if (dynatrace != null) 'Dynatrace': dynatrace,
      if (googleAnalytics != null) 'GoogleAnalytics': googleAnalytics,
      if (honeycode != null) 'Honeycode': honeycode,
      if (inforNexus != null) 'InforNexus': inforNexus,
      if (marketo != null) 'Marketo': marketo,
      if (redshift != null) 'Redshift': redshift,
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

enum ConnectorType {
  salesforce,
  singular,
  slack,
  redshift,
  s3,
  marketo,
  googleanalytics,
  zendesk,
  servicenow,
  datadog,
  trendmicro,
  snowflake,
  dynatrace,
  infornexus,
  amplitude,
  veeva,
  eventBridge,
  lookoutMetrics,
  upsolver,
  honeycode,
  customerProfiles,
}

extension on ConnectorType {
  String toValue() {
    switch (this) {
      case ConnectorType.salesforce:
        return 'Salesforce';
      case ConnectorType.singular:
        return 'Singular';
      case ConnectorType.slack:
        return 'Slack';
      case ConnectorType.redshift:
        return 'Redshift';
      case ConnectorType.s3:
        return 'S3';
      case ConnectorType.marketo:
        return 'Marketo';
      case ConnectorType.googleanalytics:
        return 'Googleanalytics';
      case ConnectorType.zendesk:
        return 'Zendesk';
      case ConnectorType.servicenow:
        return 'Servicenow';
      case ConnectorType.datadog:
        return 'Datadog';
      case ConnectorType.trendmicro:
        return 'Trendmicro';
      case ConnectorType.snowflake:
        return 'Snowflake';
      case ConnectorType.dynatrace:
        return 'Dynatrace';
      case ConnectorType.infornexus:
        return 'Infornexus';
      case ConnectorType.amplitude:
        return 'Amplitude';
      case ConnectorType.veeva:
        return 'Veeva';
      case ConnectorType.eventBridge:
        return 'EventBridge';
      case ConnectorType.lookoutMetrics:
        return 'LookoutMetrics';
      case ConnectorType.upsolver:
        return 'Upsolver';
      case ConnectorType.honeycode:
        return 'Honeycode';
      case ConnectorType.customerProfiles:
        return 'CustomerProfiles';
    }
  }
}

extension on String {
  ConnectorType toConnectorType() {
    switch (this) {
      case 'Salesforce':
        return ConnectorType.salesforce;
      case 'Singular':
        return ConnectorType.singular;
      case 'Slack':
        return ConnectorType.slack;
      case 'Redshift':
        return ConnectorType.redshift;
      case 'S3':
        return ConnectorType.s3;
      case 'Marketo':
        return ConnectorType.marketo;
      case 'Googleanalytics':
        return ConnectorType.googleanalytics;
      case 'Zendesk':
        return ConnectorType.zendesk;
      case 'Servicenow':
        return ConnectorType.servicenow;
      case 'Datadog':
        return ConnectorType.datadog;
      case 'Trendmicro':
        return ConnectorType.trendmicro;
      case 'Snowflake':
        return ConnectorType.snowflake;
      case 'Dynatrace':
        return ConnectorType.dynatrace;
      case 'Infornexus':
        return ConnectorType.infornexus;
      case 'Amplitude':
        return ConnectorType.amplitude;
      case 'Veeva':
        return ConnectorType.veeva;
      case 'EventBridge':
        return ConnectorType.eventBridge;
      case 'LookoutMetrics':
        return ConnectorType.lookoutMetrics;
      case 'Upsolver':
        return ConnectorType.upsolver;
      case 'Honeycode':
        return ConnectorType.honeycode;
      case 'CustomerProfiles':
        return ConnectorType.customerProfiles;
    }
    throw Exception('$this is not known in enum ConnectorType');
  }
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
      flowStatus: (json['flowStatus'] as String?)?.toFlowStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final flowArn = this.flowArn;
    final flowStatus = this.flowStatus;
    return {
      if (flowArn != null) 'flowArn': flowArn,
      if (flowStatus != null) 'flowStatus': flowStatus.toValue(),
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
  incremental,
  complete,
}

extension on DataPullMode {
  String toValue() {
    switch (this) {
      case DataPullMode.incremental:
        return 'Incremental';
      case DataPullMode.complete:
        return 'Complete';
    }
  }
}

extension on String {
  DataPullMode toDataPullMode() {
    switch (this) {
      case 'Incremental':
        return DataPullMode.incremental;
      case 'Complete':
        return DataPullMode.complete;
    }
    throw Exception('$this is not known in enum DataPullMode');
  }
}

enum DatadogConnectorOperator {
  projection,
  between,
  equalTo,
  addition,
  multiplication,
  division,
  subtraction,
  maskAll,
  maskFirstN,
  maskLastN,
  validateNonNull,
  validateNonZero,
  validateNonNegative,
  validateNumeric,
  noOp,
}

extension on DatadogConnectorOperator {
  String toValue() {
    switch (this) {
      case DatadogConnectorOperator.projection:
        return 'PROJECTION';
      case DatadogConnectorOperator.between:
        return 'BETWEEN';
      case DatadogConnectorOperator.equalTo:
        return 'EQUAL_TO';
      case DatadogConnectorOperator.addition:
        return 'ADDITION';
      case DatadogConnectorOperator.multiplication:
        return 'MULTIPLICATION';
      case DatadogConnectorOperator.division:
        return 'DIVISION';
      case DatadogConnectorOperator.subtraction:
        return 'SUBTRACTION';
      case DatadogConnectorOperator.maskAll:
        return 'MASK_ALL';
      case DatadogConnectorOperator.maskFirstN:
        return 'MASK_FIRST_N';
      case DatadogConnectorOperator.maskLastN:
        return 'MASK_LAST_N';
      case DatadogConnectorOperator.validateNonNull:
        return 'VALIDATE_NON_NULL';
      case DatadogConnectorOperator.validateNonZero:
        return 'VALIDATE_NON_ZERO';
      case DatadogConnectorOperator.validateNonNegative:
        return 'VALIDATE_NON_NEGATIVE';
      case DatadogConnectorOperator.validateNumeric:
        return 'VALIDATE_NUMERIC';
      case DatadogConnectorOperator.noOp:
        return 'NO_OP';
    }
  }
}

extension on String {
  DatadogConnectorOperator toDatadogConnectorOperator() {
    switch (this) {
      case 'PROJECTION':
        return DatadogConnectorOperator.projection;
      case 'BETWEEN':
        return DatadogConnectorOperator.between;
      case 'EQUAL_TO':
        return DatadogConnectorOperator.equalTo;
      case 'ADDITION':
        return DatadogConnectorOperator.addition;
      case 'MULTIPLICATION':
        return DatadogConnectorOperator.multiplication;
      case 'DIVISION':
        return DatadogConnectorOperator.division;
      case 'SUBTRACTION':
        return DatadogConnectorOperator.subtraction;
      case 'MASK_ALL':
        return DatadogConnectorOperator.maskAll;
      case 'MASK_FIRST_N':
        return DatadogConnectorOperator.maskFirstN;
      case 'MASK_LAST_N':
        return DatadogConnectorOperator.maskLastN;
      case 'VALIDATE_NON_NULL':
        return DatadogConnectorOperator.validateNonNull;
      case 'VALIDATE_NON_ZERO':
        return DatadogConnectorOperator.validateNonZero;
      case 'VALIDATE_NON_NEGATIVE':
        return DatadogConnectorOperator.validateNonNegative;
      case 'VALIDATE_NUMERIC':
        return DatadogConnectorOperator.validateNumeric;
      case 'NO_OP':
        return DatadogConnectorOperator.noOp;
    }
    throw Exception('$this is not known in enum DatadogConnectorOperator');
  }
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

  factory DatadogConnectorProfileCredentials.fromJson(
      Map<String, dynamic> json) {
    return DatadogConnectorProfileCredentials(
      apiKey: json['apiKey'] as String,
      applicationKey: json['applicationKey'] as String,
    );
  }

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
          .whereNotNull()
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
          ?.whereNotNull()
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

class DescribeConnectorsResponse {
  /// The configuration that is applied to the connectors used in the flow.
  final Map<ConnectorType, ConnectorConfiguration>? connectorConfigurations;

  /// The pagination token for the next page of data.
  final String? nextToken;

  DescribeConnectorsResponse({
    this.connectorConfigurations,
    this.nextToken,
  });

  factory DescribeConnectorsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeConnectorsResponse(
      connectorConfigurations:
          (json['connectorConfigurations'] as Map<String, dynamic>?)?.map(
              (k, e) => MapEntry(k.toConnectorType(),
                  ConnectorConfiguration.fromJson(e as Map<String, dynamic>))),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectorConfigurations = this.connectorConfigurations;
    final nextToken = this.nextToken;
    return {
      if (connectorConfigurations != null)
        'connectorConfigurations':
            connectorConfigurations.map((k, e) => MapEntry(k.toValue(), e)),
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
          ?.whereNotNull()
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

  /// Specifies when the flow was last updated.
  final DateTime? lastUpdatedAt;

  /// Specifies the user name of the account that performed the most recent
  /// update.
  final String? lastUpdatedBy;

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
    this.lastUpdatedAt,
    this.lastUpdatedBy,
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
          ?.whereNotNull()
          .map((e) => DestinationFlowConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      flowArn: json['flowArn'] as String?,
      flowName: json['flowName'] as String?,
      flowStatus: (json['flowStatus'] as String?)?.toFlowStatus(),
      flowStatusMessage: json['flowStatusMessage'] as String?,
      kmsArn: json['kmsArn'] as String?,
      lastRunExecutionDetails: json['lastRunExecutionDetails'] != null
          ? ExecutionDetails.fromJson(
              json['lastRunExecutionDetails'] as Map<String, dynamic>)
          : null,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      lastUpdatedBy: json['lastUpdatedBy'] as String?,
      sourceFlowConfig: json['sourceFlowConfig'] != null
          ? SourceFlowConfig.fromJson(
              json['sourceFlowConfig'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      tasks: (json['tasks'] as List?)
          ?.whereNotNull()
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
    final lastUpdatedAt = this.lastUpdatedAt;
    final lastUpdatedBy = this.lastUpdatedBy;
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
      if (flowStatus != null) 'flowStatus': flowStatus.toValue(),
      if (flowStatusMessage != null) 'flowStatusMessage': flowStatusMessage,
      if (kmsArn != null) 'kmsArn': kmsArn,
      if (lastRunExecutionDetails != null)
        'lastRunExecutionDetails': lastRunExecutionDetails,
      if (lastUpdatedAt != null)
        'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (lastUpdatedBy != null) 'lastUpdatedBy': lastUpdatedBy,
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
  /// The properties required to query Amazon Connect Customer Profiles.
  final CustomerProfilesDestinationProperties? customerProfiles;

  /// The properties required to query Amazon EventBridge.
  final EventBridgeDestinationProperties? eventBridge;

  /// The properties required to query Amazon Honeycode.
  final HoneycodeDestinationProperties? honeycode;

  /// The properties required to query Amazon Lookout for Metrics.
  final LookoutMetricsDestinationProperties? lookoutMetrics;

  /// The properties required to query Amazon Redshift.
  final RedshiftDestinationProperties? redshift;

  /// The properties required to query Amazon S3.
  final S3DestinationProperties? s3;

  /// The properties required to query Salesforce.
  final SalesforceDestinationProperties? salesforce;

  /// The properties required to query Snowflake.
  final SnowflakeDestinationProperties? snowflake;

  /// The properties required to query Upsolver.
  final UpsolverDestinationProperties? upsolver;

  /// The properties required to query Zendesk.
  final ZendeskDestinationProperties? zendesk;

  DestinationConnectorProperties({
    this.customerProfiles,
    this.eventBridge,
    this.honeycode,
    this.lookoutMetrics,
    this.redshift,
    this.s3,
    this.salesforce,
    this.snowflake,
    this.upsolver,
    this.zendesk,
  });

  factory DestinationConnectorProperties.fromJson(Map<String, dynamic> json) {
    return DestinationConnectorProperties(
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
      redshift: json['Redshift'] != null
          ? RedshiftDestinationProperties.fromJson(
              json['Redshift'] as Map<String, dynamic>)
          : null,
      s3: json['S3'] != null
          ? S3DestinationProperties.fromJson(json['S3'] as Map<String, dynamic>)
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
    final customerProfiles = this.customerProfiles;
    final eventBridge = this.eventBridge;
    final honeycode = this.honeycode;
    final lookoutMetrics = this.lookoutMetrics;
    final redshift = this.redshift;
    final s3 = this.s3;
    final salesforce = this.salesforce;
    final snowflake = this.snowflake;
    final upsolver = this.upsolver;
    final zendesk = this.zendesk;
    return {
      if (customerProfiles != null) 'CustomerProfiles': customerProfiles,
      if (eventBridge != null) 'EventBridge': eventBridge,
      if (honeycode != null) 'Honeycode': honeycode,
      if (lookoutMetrics != null) 'LookoutMetrics': lookoutMetrics,
      if (redshift != null) 'Redshift': redshift,
      if (s3 != null) 'S3': s3,
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
    this.isNullable,
    this.isUpdatable,
    this.isUpsertable,
    this.supportedWriteOperations,
  });

  factory DestinationFieldProperties.fromJson(Map<String, dynamic> json) {
    return DestinationFieldProperties(
      isCreatable: json['isCreatable'] as bool?,
      isNullable: json['isNullable'] as bool?,
      isUpdatable: json['isUpdatable'] as bool?,
      isUpsertable: json['isUpsertable'] as bool?,
      supportedWriteOperations: (json['supportedWriteOperations'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toWriteOperationType())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final isCreatable = this.isCreatable;
    final isNullable = this.isNullable;
    final isUpdatable = this.isUpdatable;
    final isUpsertable = this.isUpsertable;
    final supportedWriteOperations = this.supportedWriteOperations;
    return {
      if (isCreatable != null) 'isCreatable': isCreatable,
      if (isNullable != null) 'isNullable': isNullable,
      if (isUpdatable != null) 'isUpdatable': isUpdatable,
      if (isUpsertable != null) 'isUpsertable': isUpsertable,
      if (supportedWriteOperations != null)
        'supportedWriteOperations':
            supportedWriteOperations.map((e) => e.toValue()).toList(),
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

  /// The name of the connector profile. This name must be unique for each
  /// connector profile in the AWS account.
  final String? connectorProfileName;

  DestinationFlowConfig({
    required this.connectorType,
    required this.destinationConnectorProperties,
    this.connectorProfileName,
  });

  factory DestinationFlowConfig.fromJson(Map<String, dynamic> json) {
    return DestinationFlowConfig(
      connectorType: (json['connectorType'] as String).toConnectorType(),
      destinationConnectorProperties: DestinationConnectorProperties.fromJson(
          json['destinationConnectorProperties'] as Map<String, dynamic>),
      connectorProfileName: json['connectorProfileName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectorType = this.connectorType;
    final destinationConnectorProperties = this.destinationConnectorProperties;
    final connectorProfileName = this.connectorProfileName;
    return {
      'connectorType': connectorType.toValue(),
      'destinationConnectorProperties': destinationConnectorProperties,
      if (connectorProfileName != null)
        'connectorProfileName': connectorProfileName,
    };
  }
}

enum DynatraceConnectorOperator {
  projection,
  between,
  equalTo,
  addition,
  multiplication,
  division,
  subtraction,
  maskAll,
  maskFirstN,
  maskLastN,
  validateNonNull,
  validateNonZero,
  validateNonNegative,
  validateNumeric,
  noOp,
}

extension on DynatraceConnectorOperator {
  String toValue() {
    switch (this) {
      case DynatraceConnectorOperator.projection:
        return 'PROJECTION';
      case DynatraceConnectorOperator.between:
        return 'BETWEEN';
      case DynatraceConnectorOperator.equalTo:
        return 'EQUAL_TO';
      case DynatraceConnectorOperator.addition:
        return 'ADDITION';
      case DynatraceConnectorOperator.multiplication:
        return 'MULTIPLICATION';
      case DynatraceConnectorOperator.division:
        return 'DIVISION';
      case DynatraceConnectorOperator.subtraction:
        return 'SUBTRACTION';
      case DynatraceConnectorOperator.maskAll:
        return 'MASK_ALL';
      case DynatraceConnectorOperator.maskFirstN:
        return 'MASK_FIRST_N';
      case DynatraceConnectorOperator.maskLastN:
        return 'MASK_LAST_N';
      case DynatraceConnectorOperator.validateNonNull:
        return 'VALIDATE_NON_NULL';
      case DynatraceConnectorOperator.validateNonZero:
        return 'VALIDATE_NON_ZERO';
      case DynatraceConnectorOperator.validateNonNegative:
        return 'VALIDATE_NON_NEGATIVE';
      case DynatraceConnectorOperator.validateNumeric:
        return 'VALIDATE_NUMERIC';
      case DynatraceConnectorOperator.noOp:
        return 'NO_OP';
    }
  }
}

extension on String {
  DynatraceConnectorOperator toDynatraceConnectorOperator() {
    switch (this) {
      case 'PROJECTION':
        return DynatraceConnectorOperator.projection;
      case 'BETWEEN':
        return DynatraceConnectorOperator.between;
      case 'EQUAL_TO':
        return DynatraceConnectorOperator.equalTo;
      case 'ADDITION':
        return DynatraceConnectorOperator.addition;
      case 'MULTIPLICATION':
        return DynatraceConnectorOperator.multiplication;
      case 'DIVISION':
        return DynatraceConnectorOperator.division;
      case 'SUBTRACTION':
        return DynatraceConnectorOperator.subtraction;
      case 'MASK_ALL':
        return DynatraceConnectorOperator.maskAll;
      case 'MASK_FIRST_N':
        return DynatraceConnectorOperator.maskFirstN;
      case 'MASK_LAST_N':
        return DynatraceConnectorOperator.maskLastN;
      case 'VALIDATE_NON_NULL':
        return DynatraceConnectorOperator.validateNonNull;
      case 'VALIDATE_NON_ZERO':
        return DynatraceConnectorOperator.validateNonZero;
      case 'VALIDATE_NON_NEGATIVE':
        return DynatraceConnectorOperator.validateNonNegative;
      case 'VALIDATE_NUMERIC':
        return DynatraceConnectorOperator.validateNumeric;
      case 'NO_OP':
        return DynatraceConnectorOperator.noOp;
    }
    throw Exception('$this is not known in enum DynatraceConnectorOperator');
  }
}

/// The connector-specific profile credentials required by Dynatrace.
class DynatraceConnectorProfileCredentials {
  /// The API tokens used by Dynatrace API to authenticate various API calls.
  final String apiToken;

  DynatraceConnectorProfileCredentials({
    required this.apiToken,
  });

  factory DynatraceConnectorProfileCredentials.fromJson(
      Map<String, dynamic> json) {
    return DynatraceConnectorProfileCredentials(
      apiToken: json['apiToken'] as String,
    );
  }

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
      mostRecentExecutionStatus:
          (json['mostRecentExecutionStatus'] as String?)?.toExecutionStatus(),
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
        'mostRecentExecutionStatus': mostRecentExecutionStatus.toValue(),
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

  /// Specifies the start time of the flow run.
  final DateTime? startedAt;

  ExecutionRecord({
    this.dataPullEndTime,
    this.dataPullStartTime,
    this.executionId,
    this.executionResult,
    this.executionStatus,
    this.lastUpdatedAt,
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
          (json['executionStatus'] as String?)?.toExecutionStatus(),
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
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
    final startedAt = this.startedAt;
    return {
      if (dataPullEndTime != null)
        'dataPullEndTime': unixTimestampToJson(dataPullEndTime),
      if (dataPullStartTime != null)
        'dataPullStartTime': unixTimestampToJson(dataPullStartTime),
      if (executionId != null) 'executionId': executionId,
      if (executionResult != null) 'executionResult': executionResult,
      if (executionStatus != null) 'executionStatus': executionStatus.toValue(),
      if (lastUpdatedAt != null)
        'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
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

  /// The number of records processed in the flow run.
  final int? recordsProcessed;

  ExecutionResult({
    this.bytesProcessed,
    this.bytesWritten,
    this.errorInfo,
    this.recordsProcessed,
  });

  factory ExecutionResult.fromJson(Map<String, dynamic> json) {
    return ExecutionResult(
      bytesProcessed: json['bytesProcessed'] as int?,
      bytesWritten: json['bytesWritten'] as int?,
      errorInfo: json['errorInfo'] != null
          ? ErrorInfo.fromJson(json['errorInfo'] as Map<String, dynamic>)
          : null,
      recordsProcessed: json['recordsProcessed'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final bytesProcessed = this.bytesProcessed;
    final bytesWritten = this.bytesWritten;
    final errorInfo = this.errorInfo;
    final recordsProcessed = this.recordsProcessed;
    return {
      if (bytesProcessed != null) 'bytesProcessed': bytesProcessed,
      if (bytesWritten != null) 'bytesWritten': bytesWritten,
      if (errorInfo != null) 'errorInfo': errorInfo,
      if (recordsProcessed != null) 'recordsProcessed': recordsProcessed,
    };
  }
}

enum ExecutionStatus {
  inProgress,
  successful,
  error,
}

extension on ExecutionStatus {
  String toValue() {
    switch (this) {
      case ExecutionStatus.inProgress:
        return 'InProgress';
      case ExecutionStatus.successful:
        return 'Successful';
      case ExecutionStatus.error:
        return 'Error';
    }
  }
}

extension on String {
  ExecutionStatus toExecutionStatus() {
    switch (this) {
      case 'InProgress':
        return ExecutionStatus.inProgress;
      case 'Successful':
        return ExecutionStatus.successful;
      case 'Error':
        return ExecutionStatus.error;
    }
    throw Exception('$this is not known in enum ExecutionStatus');
  }
}

/// Contains details regarding the supported field type and the operators that
/// can be applied for filtering.
class FieldTypeDetails {
  /// The type of field, such as string, integer, date, and so on.
  final String fieldType;

  /// The list of operators supported by a field.
  final List<Operator> filterOperators;

  /// The list of values that a field can contain. For example, a Boolean
  /// <code>fieldType</code> can have two values: "true" and "false".
  final List<String>? supportedValues;

  FieldTypeDetails({
    required this.fieldType,
    required this.filterOperators,
    this.supportedValues,
  });

  factory FieldTypeDetails.fromJson(Map<String, dynamic> json) {
    return FieldTypeDetails(
      fieldType: json['fieldType'] as String,
      filterOperators: (json['filterOperators'] as List)
          .whereNotNull()
          .map((e) => (e as String).toOperator())
          .toList(),
      supportedValues: (json['supportedValues'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final fieldType = this.fieldType;
    final filterOperators = this.filterOperators;
    final supportedValues = this.supportedValues;
    return {
      'fieldType': fieldType,
      'filterOperators': filterOperators.map((e) => e.toValue()).toList(),
      if (supportedValues != null) 'supportedValues': supportedValues,
    };
  }
}

enum FileType {
  csv,
  json,
  parquet,
}

extension on FileType {
  String toValue() {
    switch (this) {
      case FileType.csv:
        return 'CSV';
      case FileType.json:
        return 'JSON';
      case FileType.parquet:
        return 'PARQUET';
    }
  }
}

extension on String {
  FileType toFileType() {
    switch (this) {
      case 'CSV':
        return FileType.csv;
      case 'JSON':
        return FileType.json;
      case 'PARQUET':
        return FileType.parquet;
    }
    throw Exception('$this is not known in enum FileType');
  }
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
    this.destinationConnectorType,
    this.flowArn,
    this.flowName,
    this.flowStatus,
    this.lastRunExecutionDetails,
    this.lastUpdatedAt,
    this.lastUpdatedBy,
    this.sourceConnectorType,
    this.tags,
    this.triggerType,
  });

  factory FlowDefinition.fromJson(Map<String, dynamic> json) {
    return FlowDefinition(
      createdAt: timeStampFromJson(json['createdAt']),
      createdBy: json['createdBy'] as String?,
      description: json['description'] as String?,
      destinationConnectorType:
          (json['destinationConnectorType'] as String?)?.toConnectorType(),
      flowArn: json['flowArn'] as String?,
      flowName: json['flowName'] as String?,
      flowStatus: (json['flowStatus'] as String?)?.toFlowStatus(),
      lastRunExecutionDetails: json['lastRunExecutionDetails'] != null
          ? ExecutionDetails.fromJson(
              json['lastRunExecutionDetails'] as Map<String, dynamic>)
          : null,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      lastUpdatedBy: json['lastUpdatedBy'] as String?,
      sourceConnectorType:
          (json['sourceConnectorType'] as String?)?.toConnectorType(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      triggerType: (json['triggerType'] as String?)?.toTriggerType(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final description = this.description;
    final destinationConnectorType = this.destinationConnectorType;
    final flowArn = this.flowArn;
    final flowName = this.flowName;
    final flowStatus = this.flowStatus;
    final lastRunExecutionDetails = this.lastRunExecutionDetails;
    final lastUpdatedAt = this.lastUpdatedAt;
    final lastUpdatedBy = this.lastUpdatedBy;
    final sourceConnectorType = this.sourceConnectorType;
    final tags = this.tags;
    final triggerType = this.triggerType;
    return {
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (createdBy != null) 'createdBy': createdBy,
      if (description != null) 'description': description,
      if (destinationConnectorType != null)
        'destinationConnectorType': destinationConnectorType.toValue(),
      if (flowArn != null) 'flowArn': flowArn,
      if (flowName != null) 'flowName': flowName,
      if (flowStatus != null) 'flowStatus': flowStatus.toValue(),
      if (lastRunExecutionDetails != null)
        'lastRunExecutionDetails': lastRunExecutionDetails,
      if (lastUpdatedAt != null)
        'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (lastUpdatedBy != null) 'lastUpdatedBy': lastUpdatedBy,
      if (sourceConnectorType != null)
        'sourceConnectorType': sourceConnectorType.toValue(),
      if (tags != null) 'tags': tags,
      if (triggerType != null) 'triggerType': triggerType.toValue(),
    };
  }
}

enum FlowStatus {
  active,
  deprecated,
  deleted,
  draft,
  errored,
  suspended,
}

extension on FlowStatus {
  String toValue() {
    switch (this) {
      case FlowStatus.active:
        return 'Active';
      case FlowStatus.deprecated:
        return 'Deprecated';
      case FlowStatus.deleted:
        return 'Deleted';
      case FlowStatus.draft:
        return 'Draft';
      case FlowStatus.errored:
        return 'Errored';
      case FlowStatus.suspended:
        return 'Suspended';
    }
  }
}

extension on String {
  FlowStatus toFlowStatus() {
    switch (this) {
      case 'Active':
        return FlowStatus.active;
      case 'Deprecated':
        return FlowStatus.deprecated;
      case 'Deleted':
        return FlowStatus.deleted;
      case 'Draft':
        return FlowStatus.draft;
      case 'Errored':
        return FlowStatus.errored;
      case 'Suspended':
        return FlowStatus.suspended;
    }
    throw Exception('$this is not known in enum FlowStatus');
  }
}

enum GoogleAnalyticsConnectorOperator {
  projection,
  between,
}

extension on GoogleAnalyticsConnectorOperator {
  String toValue() {
    switch (this) {
      case GoogleAnalyticsConnectorOperator.projection:
        return 'PROJECTION';
      case GoogleAnalyticsConnectorOperator.between:
        return 'BETWEEN';
    }
  }
}

extension on String {
  GoogleAnalyticsConnectorOperator toGoogleAnalyticsConnectorOperator() {
    switch (this) {
      case 'PROJECTION':
        return GoogleAnalyticsConnectorOperator.projection;
      case 'BETWEEN':
        return GoogleAnalyticsConnectorOperator.between;
    }
    throw Exception(
        '$this is not known in enum GoogleAnalyticsConnectorOperator');
  }
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

  factory GoogleAnalyticsConnectorProfileCredentials.fromJson(
      Map<String, dynamic> json) {
    return GoogleAnalyticsConnectorProfileCredentials(
      clientId: json['clientId'] as String,
      clientSecret: json['clientSecret'] as String,
      accessToken: json['accessToken'] as String?,
      oAuthRequest: json['oAuthRequest'] != null
          ? ConnectorOAuthRequest.fromJson(
              json['oAuthRequest'] as Map<String, dynamic>)
          : null,
      refreshToken: json['refreshToken'] as String?,
    );
  }

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
          ?.whereNotNull()
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

  factory HoneycodeConnectorProfileCredentials.fromJson(
      Map<String, dynamic> json) {
    return HoneycodeConnectorProfileCredentials(
      accessToken: json['accessToken'] as String?,
      oAuthRequest: json['oAuthRequest'] != null
          ? ConnectorOAuthRequest.fromJson(
              json['oAuthRequest'] as Map<String, dynamic>)
          : null,
      refreshToken: json['refreshToken'] as String?,
    );
  }

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
          ?.whereNotNull()
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
  projection,
  between,
  equalTo,
  addition,
  multiplication,
  division,
  subtraction,
  maskAll,
  maskFirstN,
  maskLastN,
  validateNonNull,
  validateNonZero,
  validateNonNegative,
  validateNumeric,
  noOp,
}

extension on InforNexusConnectorOperator {
  String toValue() {
    switch (this) {
      case InforNexusConnectorOperator.projection:
        return 'PROJECTION';
      case InforNexusConnectorOperator.between:
        return 'BETWEEN';
      case InforNexusConnectorOperator.equalTo:
        return 'EQUAL_TO';
      case InforNexusConnectorOperator.addition:
        return 'ADDITION';
      case InforNexusConnectorOperator.multiplication:
        return 'MULTIPLICATION';
      case InforNexusConnectorOperator.division:
        return 'DIVISION';
      case InforNexusConnectorOperator.subtraction:
        return 'SUBTRACTION';
      case InforNexusConnectorOperator.maskAll:
        return 'MASK_ALL';
      case InforNexusConnectorOperator.maskFirstN:
        return 'MASK_FIRST_N';
      case InforNexusConnectorOperator.maskLastN:
        return 'MASK_LAST_N';
      case InforNexusConnectorOperator.validateNonNull:
        return 'VALIDATE_NON_NULL';
      case InforNexusConnectorOperator.validateNonZero:
        return 'VALIDATE_NON_ZERO';
      case InforNexusConnectorOperator.validateNonNegative:
        return 'VALIDATE_NON_NEGATIVE';
      case InforNexusConnectorOperator.validateNumeric:
        return 'VALIDATE_NUMERIC';
      case InforNexusConnectorOperator.noOp:
        return 'NO_OP';
    }
  }
}

extension on String {
  InforNexusConnectorOperator toInforNexusConnectorOperator() {
    switch (this) {
      case 'PROJECTION':
        return InforNexusConnectorOperator.projection;
      case 'BETWEEN':
        return InforNexusConnectorOperator.between;
      case 'EQUAL_TO':
        return InforNexusConnectorOperator.equalTo;
      case 'ADDITION':
        return InforNexusConnectorOperator.addition;
      case 'MULTIPLICATION':
        return InforNexusConnectorOperator.multiplication;
      case 'DIVISION':
        return InforNexusConnectorOperator.division;
      case 'SUBTRACTION':
        return InforNexusConnectorOperator.subtraction;
      case 'MASK_ALL':
        return InforNexusConnectorOperator.maskAll;
      case 'MASK_FIRST_N':
        return InforNexusConnectorOperator.maskFirstN;
      case 'MASK_LAST_N':
        return InforNexusConnectorOperator.maskLastN;
      case 'VALIDATE_NON_NULL':
        return InforNexusConnectorOperator.validateNonNull;
      case 'VALIDATE_NON_ZERO':
        return InforNexusConnectorOperator.validateNonZero;
      case 'VALIDATE_NON_NEGATIVE':
        return InforNexusConnectorOperator.validateNonNegative;
      case 'VALIDATE_NUMERIC':
        return InforNexusConnectorOperator.validateNumeric;
      case 'NO_OP':
        return InforNexusConnectorOperator.noOp;
    }
    throw Exception('$this is not known in enum InforNexusConnectorOperator');
  }
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

  factory InforNexusConnectorProfileCredentials.fromJson(
      Map<String, dynamic> json) {
    return InforNexusConnectorProfileCredentials(
      accessKeyId: json['accessKeyId'] as String,
      datakey: json['datakey'] as String,
      secretAccessKey: json['secretAccessKey'] as String,
      userId: json['userId'] as String,
    );
  }

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

class ListConnectorEntitiesResponse {
  /// The response of <code>ListConnectorEntities</code> lists entities grouped by
  /// category. This map's key represents the group name, and its value contains
  /// the list of entities belonging to that group.
  final Map<String, List<ConnectorEntity>> connectorEntityMap;

  ListConnectorEntitiesResponse({
    required this.connectorEntityMap,
  });

  factory ListConnectorEntitiesResponse.fromJson(Map<String, dynamic> json) {
    return ListConnectorEntitiesResponse(
      connectorEntityMap: (json['connectorEntityMap'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(
              k,
              (e as List)
                  .whereNotNull()
                  .map((e) =>
                      ConnectorEntity.fromJson(e as Map<String, dynamic>))
                  .toList())),
    );
  }

  Map<String, dynamic> toJson() {
    final connectorEntityMap = this.connectorEntityMap;
    return {
      'connectorEntityMap': connectorEntityMap,
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
          ?.whereNotNull()
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
  projection,
  lessThan,
  greaterThan,
  between,
  addition,
  multiplication,
  division,
  subtraction,
  maskAll,
  maskFirstN,
  maskLastN,
  validateNonNull,
  validateNonZero,
  validateNonNegative,
  validateNumeric,
  noOp,
}

extension on MarketoConnectorOperator {
  String toValue() {
    switch (this) {
      case MarketoConnectorOperator.projection:
        return 'PROJECTION';
      case MarketoConnectorOperator.lessThan:
        return 'LESS_THAN';
      case MarketoConnectorOperator.greaterThan:
        return 'GREATER_THAN';
      case MarketoConnectorOperator.between:
        return 'BETWEEN';
      case MarketoConnectorOperator.addition:
        return 'ADDITION';
      case MarketoConnectorOperator.multiplication:
        return 'MULTIPLICATION';
      case MarketoConnectorOperator.division:
        return 'DIVISION';
      case MarketoConnectorOperator.subtraction:
        return 'SUBTRACTION';
      case MarketoConnectorOperator.maskAll:
        return 'MASK_ALL';
      case MarketoConnectorOperator.maskFirstN:
        return 'MASK_FIRST_N';
      case MarketoConnectorOperator.maskLastN:
        return 'MASK_LAST_N';
      case MarketoConnectorOperator.validateNonNull:
        return 'VALIDATE_NON_NULL';
      case MarketoConnectorOperator.validateNonZero:
        return 'VALIDATE_NON_ZERO';
      case MarketoConnectorOperator.validateNonNegative:
        return 'VALIDATE_NON_NEGATIVE';
      case MarketoConnectorOperator.validateNumeric:
        return 'VALIDATE_NUMERIC';
      case MarketoConnectorOperator.noOp:
        return 'NO_OP';
    }
  }
}

extension on String {
  MarketoConnectorOperator toMarketoConnectorOperator() {
    switch (this) {
      case 'PROJECTION':
        return MarketoConnectorOperator.projection;
      case 'LESS_THAN':
        return MarketoConnectorOperator.lessThan;
      case 'GREATER_THAN':
        return MarketoConnectorOperator.greaterThan;
      case 'BETWEEN':
        return MarketoConnectorOperator.between;
      case 'ADDITION':
        return MarketoConnectorOperator.addition;
      case 'MULTIPLICATION':
        return MarketoConnectorOperator.multiplication;
      case 'DIVISION':
        return MarketoConnectorOperator.division;
      case 'SUBTRACTION':
        return MarketoConnectorOperator.subtraction;
      case 'MASK_ALL':
        return MarketoConnectorOperator.maskAll;
      case 'MASK_FIRST_N':
        return MarketoConnectorOperator.maskFirstN;
      case 'MASK_LAST_N':
        return MarketoConnectorOperator.maskLastN;
      case 'VALIDATE_NON_NULL':
        return MarketoConnectorOperator.validateNonNull;
      case 'VALIDATE_NON_ZERO':
        return MarketoConnectorOperator.validateNonZero;
      case 'VALIDATE_NON_NEGATIVE':
        return MarketoConnectorOperator.validateNonNegative;
      case 'VALIDATE_NUMERIC':
        return MarketoConnectorOperator.validateNumeric;
      case 'NO_OP':
        return MarketoConnectorOperator.noOp;
    }
    throw Exception('$this is not known in enum MarketoConnectorOperator');
  }
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

  factory MarketoConnectorProfileCredentials.fromJson(
      Map<String, dynamic> json) {
    return MarketoConnectorProfileCredentials(
      clientId: json['clientId'] as String,
      clientSecret: json['clientSecret'] as String,
      accessToken: json['accessToken'] as String?,
      oAuthRequest: json['oAuthRequest'] != null
          ? ConnectorOAuthRequest.fromJson(
              json['oAuthRequest'] as Map<String, dynamic>)
          : null,
    );
  }

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

enum Operator {
  projection,
  lessThan,
  greaterThan,
  contains,
  between,
  lessThanOrEqualTo,
  greaterThanOrEqualTo,
  equalTo,
  notEqualTo,
  addition,
  multiplication,
  division,
  subtraction,
  maskAll,
  maskFirstN,
  maskLastN,
  validateNonNull,
  validateNonZero,
  validateNonNegative,
  validateNumeric,
  noOp,
}

extension on Operator {
  String toValue() {
    switch (this) {
      case Operator.projection:
        return 'PROJECTION';
      case Operator.lessThan:
        return 'LESS_THAN';
      case Operator.greaterThan:
        return 'GREATER_THAN';
      case Operator.contains:
        return 'CONTAINS';
      case Operator.between:
        return 'BETWEEN';
      case Operator.lessThanOrEqualTo:
        return 'LESS_THAN_OR_EQUAL_TO';
      case Operator.greaterThanOrEqualTo:
        return 'GREATER_THAN_OR_EQUAL_TO';
      case Operator.equalTo:
        return 'EQUAL_TO';
      case Operator.notEqualTo:
        return 'NOT_EQUAL_TO';
      case Operator.addition:
        return 'ADDITION';
      case Operator.multiplication:
        return 'MULTIPLICATION';
      case Operator.division:
        return 'DIVISION';
      case Operator.subtraction:
        return 'SUBTRACTION';
      case Operator.maskAll:
        return 'MASK_ALL';
      case Operator.maskFirstN:
        return 'MASK_FIRST_N';
      case Operator.maskLastN:
        return 'MASK_LAST_N';
      case Operator.validateNonNull:
        return 'VALIDATE_NON_NULL';
      case Operator.validateNonZero:
        return 'VALIDATE_NON_ZERO';
      case Operator.validateNonNegative:
        return 'VALIDATE_NON_NEGATIVE';
      case Operator.validateNumeric:
        return 'VALIDATE_NUMERIC';
      case Operator.noOp:
        return 'NO_OP';
    }
  }
}

extension on String {
  Operator toOperator() {
    switch (this) {
      case 'PROJECTION':
        return Operator.projection;
      case 'LESS_THAN':
        return Operator.lessThan;
      case 'GREATER_THAN':
        return Operator.greaterThan;
      case 'CONTAINS':
        return Operator.contains;
      case 'BETWEEN':
        return Operator.between;
      case 'LESS_THAN_OR_EQUAL_TO':
        return Operator.lessThanOrEqualTo;
      case 'GREATER_THAN_OR_EQUAL_TO':
        return Operator.greaterThanOrEqualTo;
      case 'EQUAL_TO':
        return Operator.equalTo;
      case 'NOT_EQUAL_TO':
        return Operator.notEqualTo;
      case 'ADDITION':
        return Operator.addition;
      case 'MULTIPLICATION':
        return Operator.multiplication;
      case 'DIVISION':
        return Operator.division;
      case 'SUBTRACTION':
        return Operator.subtraction;
      case 'MASK_ALL':
        return Operator.maskAll;
      case 'MASK_FIRST_N':
        return Operator.maskFirstN;
      case 'MASK_LAST_N':
        return Operator.maskLastN;
      case 'VALIDATE_NON_NULL':
        return Operator.validateNonNull;
      case 'VALIDATE_NON_ZERO':
        return Operator.validateNonZero;
      case 'VALIDATE_NON_NEGATIVE':
        return Operator.validateNonNegative;
      case 'VALIDATE_NUMERIC':
        return Operator.validateNumeric;
      case 'NO_OP':
        return Operator.noOp;
    }
    throw Exception('$this is not known in enum Operator');
  }
}

enum OperatorPropertiesKeys {
  value,
  $values,
  dataType,
  upperBound,
  lowerBound,
  sourceDataType,
  destinationDataType,
  validationAction,
  maskValue,
  maskLength,
  truncateLength,
  mathOperationFieldsOrder,
  concatFormat,
  subfieldCategoryMap,
  excludeSourceFieldsList,
}

extension on OperatorPropertiesKeys {
  String toValue() {
    switch (this) {
      case OperatorPropertiesKeys.value:
        return 'VALUE';
      case OperatorPropertiesKeys.$values:
        return 'VALUES';
      case OperatorPropertiesKeys.dataType:
        return 'DATA_TYPE';
      case OperatorPropertiesKeys.upperBound:
        return 'UPPER_BOUND';
      case OperatorPropertiesKeys.lowerBound:
        return 'LOWER_BOUND';
      case OperatorPropertiesKeys.sourceDataType:
        return 'SOURCE_DATA_TYPE';
      case OperatorPropertiesKeys.destinationDataType:
        return 'DESTINATION_DATA_TYPE';
      case OperatorPropertiesKeys.validationAction:
        return 'VALIDATION_ACTION';
      case OperatorPropertiesKeys.maskValue:
        return 'MASK_VALUE';
      case OperatorPropertiesKeys.maskLength:
        return 'MASK_LENGTH';
      case OperatorPropertiesKeys.truncateLength:
        return 'TRUNCATE_LENGTH';
      case OperatorPropertiesKeys.mathOperationFieldsOrder:
        return 'MATH_OPERATION_FIELDS_ORDER';
      case OperatorPropertiesKeys.concatFormat:
        return 'CONCAT_FORMAT';
      case OperatorPropertiesKeys.subfieldCategoryMap:
        return 'SUBFIELD_CATEGORY_MAP';
      case OperatorPropertiesKeys.excludeSourceFieldsList:
        return 'EXCLUDE_SOURCE_FIELDS_LIST';
    }
  }
}

extension on String {
  OperatorPropertiesKeys toOperatorPropertiesKeys() {
    switch (this) {
      case 'VALUE':
        return OperatorPropertiesKeys.value;
      case 'VALUES':
        return OperatorPropertiesKeys.$values;
      case 'DATA_TYPE':
        return OperatorPropertiesKeys.dataType;
      case 'UPPER_BOUND':
        return OperatorPropertiesKeys.upperBound;
      case 'LOWER_BOUND':
        return OperatorPropertiesKeys.lowerBound;
      case 'SOURCE_DATA_TYPE':
        return OperatorPropertiesKeys.sourceDataType;
      case 'DESTINATION_DATA_TYPE':
        return OperatorPropertiesKeys.destinationDataType;
      case 'VALIDATION_ACTION':
        return OperatorPropertiesKeys.validationAction;
      case 'MASK_VALUE':
        return OperatorPropertiesKeys.maskValue;
      case 'MASK_LENGTH':
        return OperatorPropertiesKeys.maskLength;
      case 'TRUNCATE_LENGTH':
        return OperatorPropertiesKeys.truncateLength;
      case 'MATH_OPERATION_FIELDS_ORDER':
        return OperatorPropertiesKeys.mathOperationFieldsOrder;
      case 'CONCAT_FORMAT':
        return OperatorPropertiesKeys.concatFormat;
      case 'SUBFIELD_CATEGORY_MAP':
        return OperatorPropertiesKeys.subfieldCategoryMap;
      case 'EXCLUDE_SOURCE_FIELDS_LIST':
        return OperatorPropertiesKeys.excludeSourceFieldsList;
    }
    throw Exception('$this is not known in enum OperatorPropertiesKeys');
  }
}

/// Determines the prefix that Amazon AppFlow applies to the destination folder
/// name. You can name your destination folders according to the flow frequency
/// and date.
class PrefixConfig {
  /// Determines the level of granularity that's included in the prefix.
  final PrefixFormat? prefixFormat;

  /// Determines the format of the prefix, and whether it applies to the file
  /// name, file path, or both.
  final PrefixType? prefixType;

  PrefixConfig({
    this.prefixFormat,
    this.prefixType,
  });

  factory PrefixConfig.fromJson(Map<String, dynamic> json) {
    return PrefixConfig(
      prefixFormat: (json['prefixFormat'] as String?)?.toPrefixFormat(),
      prefixType: (json['prefixType'] as String?)?.toPrefixType(),
    );
  }

  Map<String, dynamic> toJson() {
    final prefixFormat = this.prefixFormat;
    final prefixType = this.prefixType;
    return {
      if (prefixFormat != null) 'prefixFormat': prefixFormat.toValue(),
      if (prefixType != null) 'prefixType': prefixType.toValue(),
    };
  }
}

enum PrefixFormat {
  year,
  month,
  day,
  hour,
  minute,
}

extension on PrefixFormat {
  String toValue() {
    switch (this) {
      case PrefixFormat.year:
        return 'YEAR';
      case PrefixFormat.month:
        return 'MONTH';
      case PrefixFormat.day:
        return 'DAY';
      case PrefixFormat.hour:
        return 'HOUR';
      case PrefixFormat.minute:
        return 'MINUTE';
    }
  }
}

extension on String {
  PrefixFormat toPrefixFormat() {
    switch (this) {
      case 'YEAR':
        return PrefixFormat.year;
      case 'MONTH':
        return PrefixFormat.month;
      case 'DAY':
        return PrefixFormat.day;
      case 'HOUR':
        return PrefixFormat.hour;
      case 'MINUTE':
        return PrefixFormat.minute;
    }
    throw Exception('$this is not known in enum PrefixFormat');
  }
}

enum PrefixType {
  filename,
  path,
  pathAndFilename,
}

extension on PrefixType {
  String toValue() {
    switch (this) {
      case PrefixType.filename:
        return 'FILENAME';
      case PrefixType.path:
        return 'PATH';
      case PrefixType.pathAndFilename:
        return 'PATH_AND_FILENAME';
    }
  }
}

extension on String {
  PrefixType toPrefixType() {
    switch (this) {
      case 'FILENAME':
        return PrefixType.filename;
      case 'PATH':
        return PrefixType.path;
      case 'PATH_AND_FILENAME':
        return PrefixType.pathAndFilename;
    }
    throw Exception('$this is not known in enum PrefixType');
  }
}

/// The connector-specific profile credentials required when using Amazon
/// Redshift.
class RedshiftConnectorProfileCredentials {
  /// The password that corresponds to the user name.
  final String password;

  /// The name of the user.
  final String username;

  RedshiftConnectorProfileCredentials({
    required this.password,
    required this.username,
  });

  factory RedshiftConnectorProfileCredentials.fromJson(
      Map<String, dynamic> json) {
    return RedshiftConnectorProfileCredentials(
      password: json['password'] as String,
      username: json['username'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final password = this.password;
    final username = this.username;
    return {
      'password': password,
      'username': username,
    };
  }
}

/// The connector-specific profile properties when using Amazon Redshift.
class RedshiftConnectorProfileProperties {
  /// A name for the associated Amazon S3 bucket.
  final String bucketName;

  /// The JDBC URL of the Amazon Redshift cluster.
  final String databaseUrl;

  /// The Amazon Resource Name (ARN) of the IAM role.
  final String roleArn;

  /// The object key for the destination bucket in which Amazon AppFlow places the
  /// files.
  final String? bucketPrefix;

  RedshiftConnectorProfileProperties({
    required this.bucketName,
    required this.databaseUrl,
    required this.roleArn,
    this.bucketPrefix,
  });

  factory RedshiftConnectorProfileProperties.fromJson(
      Map<String, dynamic> json) {
    return RedshiftConnectorProfileProperties(
      bucketName: json['bucketName'] as String,
      databaseUrl: json['databaseUrl'] as String,
      roleArn: json['roleArn'] as String,
      bucketPrefix: json['bucketPrefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final databaseUrl = this.databaseUrl;
    final roleArn = this.roleArn;
    final bucketPrefix = this.bucketPrefix;
    return {
      'bucketName': bucketName,
      'databaseUrl': databaseUrl,
      'roleArn': roleArn,
      if (bucketPrefix != null) 'bucketPrefix': bucketPrefix,
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

enum S3ConnectorOperator {
  projection,
  lessThan,
  greaterThan,
  between,
  lessThanOrEqualTo,
  greaterThanOrEqualTo,
  equalTo,
  notEqualTo,
  addition,
  multiplication,
  division,
  subtraction,
  maskAll,
  maskFirstN,
  maskLastN,
  validateNonNull,
  validateNonZero,
  validateNonNegative,
  validateNumeric,
  noOp,
}

extension on S3ConnectorOperator {
  String toValue() {
    switch (this) {
      case S3ConnectorOperator.projection:
        return 'PROJECTION';
      case S3ConnectorOperator.lessThan:
        return 'LESS_THAN';
      case S3ConnectorOperator.greaterThan:
        return 'GREATER_THAN';
      case S3ConnectorOperator.between:
        return 'BETWEEN';
      case S3ConnectorOperator.lessThanOrEqualTo:
        return 'LESS_THAN_OR_EQUAL_TO';
      case S3ConnectorOperator.greaterThanOrEqualTo:
        return 'GREATER_THAN_OR_EQUAL_TO';
      case S3ConnectorOperator.equalTo:
        return 'EQUAL_TO';
      case S3ConnectorOperator.notEqualTo:
        return 'NOT_EQUAL_TO';
      case S3ConnectorOperator.addition:
        return 'ADDITION';
      case S3ConnectorOperator.multiplication:
        return 'MULTIPLICATION';
      case S3ConnectorOperator.division:
        return 'DIVISION';
      case S3ConnectorOperator.subtraction:
        return 'SUBTRACTION';
      case S3ConnectorOperator.maskAll:
        return 'MASK_ALL';
      case S3ConnectorOperator.maskFirstN:
        return 'MASK_FIRST_N';
      case S3ConnectorOperator.maskLastN:
        return 'MASK_LAST_N';
      case S3ConnectorOperator.validateNonNull:
        return 'VALIDATE_NON_NULL';
      case S3ConnectorOperator.validateNonZero:
        return 'VALIDATE_NON_ZERO';
      case S3ConnectorOperator.validateNonNegative:
        return 'VALIDATE_NON_NEGATIVE';
      case S3ConnectorOperator.validateNumeric:
        return 'VALIDATE_NUMERIC';
      case S3ConnectorOperator.noOp:
        return 'NO_OP';
    }
  }
}

extension on String {
  S3ConnectorOperator toS3ConnectorOperator() {
    switch (this) {
      case 'PROJECTION':
        return S3ConnectorOperator.projection;
      case 'LESS_THAN':
        return S3ConnectorOperator.lessThan;
      case 'GREATER_THAN':
        return S3ConnectorOperator.greaterThan;
      case 'BETWEEN':
        return S3ConnectorOperator.between;
      case 'LESS_THAN_OR_EQUAL_TO':
        return S3ConnectorOperator.lessThanOrEqualTo;
      case 'GREATER_THAN_OR_EQUAL_TO':
        return S3ConnectorOperator.greaterThanOrEqualTo;
      case 'EQUAL_TO':
        return S3ConnectorOperator.equalTo;
      case 'NOT_EQUAL_TO':
        return S3ConnectorOperator.notEqualTo;
      case 'ADDITION':
        return S3ConnectorOperator.addition;
      case 'MULTIPLICATION':
        return S3ConnectorOperator.multiplication;
      case 'DIVISION':
        return S3ConnectorOperator.division;
      case 'SUBTRACTION':
        return S3ConnectorOperator.subtraction;
      case 'MASK_ALL':
        return S3ConnectorOperator.maskAll;
      case 'MASK_FIRST_N':
        return S3ConnectorOperator.maskFirstN;
      case 'MASK_LAST_N':
        return S3ConnectorOperator.maskLastN;
      case 'VALIDATE_NON_NULL':
        return S3ConnectorOperator.validateNonNull;
      case 'VALIDATE_NON_ZERO':
        return S3ConnectorOperator.validateNonZero;
      case 'VALIDATE_NON_NEGATIVE':
        return S3ConnectorOperator.validateNonNegative;
      case 'VALIDATE_NUMERIC':
        return S3ConnectorOperator.validateNumeric;
      case 'NO_OP':
        return S3ConnectorOperator.noOp;
    }
    throw Exception('$this is not known in enum S3ConnectorOperator');
  }
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

  S3OutputFormatConfig({
    this.aggregationConfig,
    this.fileType,
    this.prefixConfig,
  });

  factory S3OutputFormatConfig.fromJson(Map<String, dynamic> json) {
    return S3OutputFormatConfig(
      aggregationConfig: json['aggregationConfig'] != null
          ? AggregationConfig.fromJson(
              json['aggregationConfig'] as Map<String, dynamic>)
          : null,
      fileType: (json['fileType'] as String?)?.toFileType(),
      prefixConfig: json['prefixConfig'] != null
          ? PrefixConfig.fromJson(json['prefixConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final aggregationConfig = this.aggregationConfig;
    final fileType = this.fileType;
    final prefixConfig = this.prefixConfig;
    return {
      if (aggregationConfig != null) 'aggregationConfig': aggregationConfig,
      if (fileType != null) 'fileType': fileType.toValue(),
      if (prefixConfig != null) 'prefixConfig': prefixConfig,
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

  S3SourceProperties({
    required this.bucketName,
    this.bucketPrefix,
  });

  factory S3SourceProperties.fromJson(Map<String, dynamic> json) {
    return S3SourceProperties(
      bucketName: json['bucketName'] as String,
      bucketPrefix: json['bucketPrefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final bucketPrefix = this.bucketPrefix;
    return {
      'bucketName': bucketName,
      if (bucketPrefix != null) 'bucketPrefix': bucketPrefix,
    };
  }
}

enum SalesforceConnectorOperator {
  projection,
  lessThan,
  contains,
  greaterThan,
  between,
  lessThanOrEqualTo,
  greaterThanOrEqualTo,
  equalTo,
  notEqualTo,
  addition,
  multiplication,
  division,
  subtraction,
  maskAll,
  maskFirstN,
  maskLastN,
  validateNonNull,
  validateNonZero,
  validateNonNegative,
  validateNumeric,
  noOp,
}

extension on SalesforceConnectorOperator {
  String toValue() {
    switch (this) {
      case SalesforceConnectorOperator.projection:
        return 'PROJECTION';
      case SalesforceConnectorOperator.lessThan:
        return 'LESS_THAN';
      case SalesforceConnectorOperator.contains:
        return 'CONTAINS';
      case SalesforceConnectorOperator.greaterThan:
        return 'GREATER_THAN';
      case SalesforceConnectorOperator.between:
        return 'BETWEEN';
      case SalesforceConnectorOperator.lessThanOrEqualTo:
        return 'LESS_THAN_OR_EQUAL_TO';
      case SalesforceConnectorOperator.greaterThanOrEqualTo:
        return 'GREATER_THAN_OR_EQUAL_TO';
      case SalesforceConnectorOperator.equalTo:
        return 'EQUAL_TO';
      case SalesforceConnectorOperator.notEqualTo:
        return 'NOT_EQUAL_TO';
      case SalesforceConnectorOperator.addition:
        return 'ADDITION';
      case SalesforceConnectorOperator.multiplication:
        return 'MULTIPLICATION';
      case SalesforceConnectorOperator.division:
        return 'DIVISION';
      case SalesforceConnectorOperator.subtraction:
        return 'SUBTRACTION';
      case SalesforceConnectorOperator.maskAll:
        return 'MASK_ALL';
      case SalesforceConnectorOperator.maskFirstN:
        return 'MASK_FIRST_N';
      case SalesforceConnectorOperator.maskLastN:
        return 'MASK_LAST_N';
      case SalesforceConnectorOperator.validateNonNull:
        return 'VALIDATE_NON_NULL';
      case SalesforceConnectorOperator.validateNonZero:
        return 'VALIDATE_NON_ZERO';
      case SalesforceConnectorOperator.validateNonNegative:
        return 'VALIDATE_NON_NEGATIVE';
      case SalesforceConnectorOperator.validateNumeric:
        return 'VALIDATE_NUMERIC';
      case SalesforceConnectorOperator.noOp:
        return 'NO_OP';
    }
  }
}

extension on String {
  SalesforceConnectorOperator toSalesforceConnectorOperator() {
    switch (this) {
      case 'PROJECTION':
        return SalesforceConnectorOperator.projection;
      case 'LESS_THAN':
        return SalesforceConnectorOperator.lessThan;
      case 'CONTAINS':
        return SalesforceConnectorOperator.contains;
      case 'GREATER_THAN':
        return SalesforceConnectorOperator.greaterThan;
      case 'BETWEEN':
        return SalesforceConnectorOperator.between;
      case 'LESS_THAN_OR_EQUAL_TO':
        return SalesforceConnectorOperator.lessThanOrEqualTo;
      case 'GREATER_THAN_OR_EQUAL_TO':
        return SalesforceConnectorOperator.greaterThanOrEqualTo;
      case 'EQUAL_TO':
        return SalesforceConnectorOperator.equalTo;
      case 'NOT_EQUAL_TO':
        return SalesforceConnectorOperator.notEqualTo;
      case 'ADDITION':
        return SalesforceConnectorOperator.addition;
      case 'MULTIPLICATION':
        return SalesforceConnectorOperator.multiplication;
      case 'DIVISION':
        return SalesforceConnectorOperator.division;
      case 'SUBTRACTION':
        return SalesforceConnectorOperator.subtraction;
      case 'MASK_ALL':
        return SalesforceConnectorOperator.maskAll;
      case 'MASK_FIRST_N':
        return SalesforceConnectorOperator.maskFirstN;
      case 'MASK_LAST_N':
        return SalesforceConnectorOperator.maskLastN;
      case 'VALIDATE_NON_NULL':
        return SalesforceConnectorOperator.validateNonNull;
      case 'VALIDATE_NON_ZERO':
        return SalesforceConnectorOperator.validateNonZero;
      case 'VALIDATE_NON_NEGATIVE':
        return SalesforceConnectorOperator.validateNonNegative;
      case 'VALIDATE_NUMERIC':
        return SalesforceConnectorOperator.validateNumeric;
      case 'NO_OP':
        return SalesforceConnectorOperator.noOp;
    }
    throw Exception('$this is not known in enum SalesforceConnectorOperator');
  }
}

/// The connector-specific profile credentials required when using Salesforce.
class SalesforceConnectorProfileCredentials {
  /// The credentials used to access protected Salesforce resources.
  final String? accessToken;

  /// The secret manager ARN, which contains the client ID and client secret of
  /// the connected app.
  final String? clientCredentialsArn;

  /// The OAuth requirement needed to request security tokens from the connector
  /// endpoint.
  final ConnectorOAuthRequest? oAuthRequest;

  /// The credentials used to acquire new access tokens.
  final String? refreshToken;

  SalesforceConnectorProfileCredentials({
    this.accessToken,
    this.clientCredentialsArn,
    this.oAuthRequest,
    this.refreshToken,
  });

  factory SalesforceConnectorProfileCredentials.fromJson(
      Map<String, dynamic> json) {
    return SalesforceConnectorProfileCredentials(
      accessToken: json['accessToken'] as String?,
      clientCredentialsArn: json['clientCredentialsArn'] as String?,
      oAuthRequest: json['oAuthRequest'] != null
          ? ConnectorOAuthRequest.fromJson(
              json['oAuthRequest'] as Map<String, dynamic>)
          : null,
      refreshToken: json['refreshToken'] as String?,
    );
  }

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

/// The connector-specific profile properties required when using Salesforce.
class SalesforceConnectorProfileProperties {
  /// The location of the Salesforce resource.
  final String? instanceUrl;

  /// Indicates whether the connector profile applies to a sandbox or production
  /// environment.
  final bool? isSandboxEnvironment;

  SalesforceConnectorProfileProperties({
    this.instanceUrl,
    this.isSandboxEnvironment,
  });

  factory SalesforceConnectorProfileProperties.fromJson(
      Map<String, dynamic> json) {
    return SalesforceConnectorProfileProperties(
      instanceUrl: json['instanceUrl'] as String?,
      isSandboxEnvironment: json['isSandboxEnvironment'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceUrl = this.instanceUrl;
    final isSandboxEnvironment = this.isSandboxEnvironment;
    return {
      if (instanceUrl != null) 'instanceUrl': instanceUrl,
      if (isSandboxEnvironment != null)
        'isSandboxEnvironment': isSandboxEnvironment,
    };
  }
}

/// The properties that are applied when Salesforce is being used as a
/// destination.
class SalesforceDestinationProperties {
  /// The object specified in the Salesforce flow destination.
  final String object;

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
    this.errorHandlingConfig,
    this.idFieldNames,
    this.writeOperationType,
  });

  factory SalesforceDestinationProperties.fromJson(Map<String, dynamic> json) {
    return SalesforceDestinationProperties(
      object: json['object'] as String,
      errorHandlingConfig: json['errorHandlingConfig'] != null
          ? ErrorHandlingConfig.fromJson(
              json['errorHandlingConfig'] as Map<String, dynamic>)
          : null,
      idFieldNames: (json['idFieldNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      writeOperationType:
          (json['writeOperationType'] as String?)?.toWriteOperationType(),
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
        'writeOperationType': writeOperationType.toValue(),
    };
  }
}

/// The connector metadata specific to Salesforce.
class SalesforceMetadata {
  /// The desired authorization scope for the Salesforce account.
  final List<String>? oAuthScopes;

  SalesforceMetadata({
    this.oAuthScopes,
  });

  factory SalesforceMetadata.fromJson(Map<String, dynamic> json) {
    return SalesforceMetadata(
      oAuthScopes: (json['oAuthScopes'] as List?)
          ?.whereNotNull()
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

/// The properties that are applied when Salesforce is being used as a source.
class SalesforceSourceProperties {
  /// The object specified in the Salesforce flow source.
  final String object;

  /// The flag that enables dynamic fetching of new (recently added) fields in the
  /// Salesforce objects while running a flow.
  final bool? enableDynamicFieldUpdate;

  /// Indicates whether Amazon AppFlow includes deleted files in the flow run.
  final bool? includeDeletedRecords;

  SalesforceSourceProperties({
    required this.object,
    this.enableDynamicFieldUpdate,
    this.includeDeletedRecords,
  });

  factory SalesforceSourceProperties.fromJson(Map<String, dynamic> json) {
    return SalesforceSourceProperties(
      object: json['object'] as String,
      enableDynamicFieldUpdate: json['enableDynamicFieldUpdate'] as bool?,
      includeDeletedRecords: json['includeDeletedRecords'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final object = this.object;
    final enableDynamicFieldUpdate = this.enableDynamicFieldUpdate;
    final includeDeletedRecords = this.includeDeletedRecords;
    return {
      'object': object,
      if (enableDynamicFieldUpdate != null)
        'enableDynamicFieldUpdate': enableDynamicFieldUpdate,
      if (includeDeletedRecords != null)
        'includeDeletedRecords': includeDeletedRecords,
    };
  }
}

enum ScheduleFrequencyType {
  byminute,
  hourly,
  daily,
  weekly,
  monthly,
  once,
}

extension on ScheduleFrequencyType {
  String toValue() {
    switch (this) {
      case ScheduleFrequencyType.byminute:
        return 'BYMINUTE';
      case ScheduleFrequencyType.hourly:
        return 'HOURLY';
      case ScheduleFrequencyType.daily:
        return 'DAILY';
      case ScheduleFrequencyType.weekly:
        return 'WEEKLY';
      case ScheduleFrequencyType.monthly:
        return 'MONTHLY';
      case ScheduleFrequencyType.once:
        return 'ONCE';
    }
  }
}

extension on String {
  ScheduleFrequencyType toScheduleFrequencyType() {
    switch (this) {
      case 'BYMINUTE':
        return ScheduleFrequencyType.byminute;
      case 'HOURLY':
        return ScheduleFrequencyType.hourly;
      case 'DAILY':
        return ScheduleFrequencyType.daily;
      case 'WEEKLY':
        return ScheduleFrequencyType.weekly;
      case 'MONTHLY':
        return ScheduleFrequencyType.monthly;
      case 'ONCE':
        return ScheduleFrequencyType.once;
    }
    throw Exception('$this is not known in enum ScheduleFrequencyType');
  }
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

  /// Specifies the scheduled end time for a schedule-triggered flow.
  final DateTime? scheduleEndTime;

  /// Specifies the optional offset that is added to the time interval for a
  /// schedule-triggered flow.
  final int? scheduleOffset;

  /// Specifies the scheduled start time for a schedule-triggered flow.
  final DateTime? scheduleStartTime;

  /// Specifies the time zone used when referring to the date and time of a
  /// scheduled-triggered flow, such as <code>America/New_York</code>.
  final String? timezone;

  ScheduledTriggerProperties({
    required this.scheduleExpression,
    this.dataPullMode,
    this.firstExecutionFrom,
    this.scheduleEndTime,
    this.scheduleOffset,
    this.scheduleStartTime,
    this.timezone,
  });

  factory ScheduledTriggerProperties.fromJson(Map<String, dynamic> json) {
    return ScheduledTriggerProperties(
      scheduleExpression: json['scheduleExpression'] as String,
      dataPullMode: (json['dataPullMode'] as String?)?.toDataPullMode(),
      firstExecutionFrom: timeStampFromJson(json['firstExecutionFrom']),
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
    final scheduleEndTime = this.scheduleEndTime;
    final scheduleOffset = this.scheduleOffset;
    final scheduleStartTime = this.scheduleStartTime;
    final timezone = this.timezone;
    return {
      'scheduleExpression': scheduleExpression,
      if (dataPullMode != null) 'dataPullMode': dataPullMode.toValue(),
      if (firstExecutionFrom != null)
        'firstExecutionFrom': unixTimestampToJson(firstExecutionFrom),
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
  projection,
  contains,
  lessThan,
  greaterThan,
  between,
  lessThanOrEqualTo,
  greaterThanOrEqualTo,
  equalTo,
  notEqualTo,
  addition,
  multiplication,
  division,
  subtraction,
  maskAll,
  maskFirstN,
  maskLastN,
  validateNonNull,
  validateNonZero,
  validateNonNegative,
  validateNumeric,
  noOp,
}

extension on ServiceNowConnectorOperator {
  String toValue() {
    switch (this) {
      case ServiceNowConnectorOperator.projection:
        return 'PROJECTION';
      case ServiceNowConnectorOperator.contains:
        return 'CONTAINS';
      case ServiceNowConnectorOperator.lessThan:
        return 'LESS_THAN';
      case ServiceNowConnectorOperator.greaterThan:
        return 'GREATER_THAN';
      case ServiceNowConnectorOperator.between:
        return 'BETWEEN';
      case ServiceNowConnectorOperator.lessThanOrEqualTo:
        return 'LESS_THAN_OR_EQUAL_TO';
      case ServiceNowConnectorOperator.greaterThanOrEqualTo:
        return 'GREATER_THAN_OR_EQUAL_TO';
      case ServiceNowConnectorOperator.equalTo:
        return 'EQUAL_TO';
      case ServiceNowConnectorOperator.notEqualTo:
        return 'NOT_EQUAL_TO';
      case ServiceNowConnectorOperator.addition:
        return 'ADDITION';
      case ServiceNowConnectorOperator.multiplication:
        return 'MULTIPLICATION';
      case ServiceNowConnectorOperator.division:
        return 'DIVISION';
      case ServiceNowConnectorOperator.subtraction:
        return 'SUBTRACTION';
      case ServiceNowConnectorOperator.maskAll:
        return 'MASK_ALL';
      case ServiceNowConnectorOperator.maskFirstN:
        return 'MASK_FIRST_N';
      case ServiceNowConnectorOperator.maskLastN:
        return 'MASK_LAST_N';
      case ServiceNowConnectorOperator.validateNonNull:
        return 'VALIDATE_NON_NULL';
      case ServiceNowConnectorOperator.validateNonZero:
        return 'VALIDATE_NON_ZERO';
      case ServiceNowConnectorOperator.validateNonNegative:
        return 'VALIDATE_NON_NEGATIVE';
      case ServiceNowConnectorOperator.validateNumeric:
        return 'VALIDATE_NUMERIC';
      case ServiceNowConnectorOperator.noOp:
        return 'NO_OP';
    }
  }
}

extension on String {
  ServiceNowConnectorOperator toServiceNowConnectorOperator() {
    switch (this) {
      case 'PROJECTION':
        return ServiceNowConnectorOperator.projection;
      case 'CONTAINS':
        return ServiceNowConnectorOperator.contains;
      case 'LESS_THAN':
        return ServiceNowConnectorOperator.lessThan;
      case 'GREATER_THAN':
        return ServiceNowConnectorOperator.greaterThan;
      case 'BETWEEN':
        return ServiceNowConnectorOperator.between;
      case 'LESS_THAN_OR_EQUAL_TO':
        return ServiceNowConnectorOperator.lessThanOrEqualTo;
      case 'GREATER_THAN_OR_EQUAL_TO':
        return ServiceNowConnectorOperator.greaterThanOrEqualTo;
      case 'EQUAL_TO':
        return ServiceNowConnectorOperator.equalTo;
      case 'NOT_EQUAL_TO':
        return ServiceNowConnectorOperator.notEqualTo;
      case 'ADDITION':
        return ServiceNowConnectorOperator.addition;
      case 'MULTIPLICATION':
        return ServiceNowConnectorOperator.multiplication;
      case 'DIVISION':
        return ServiceNowConnectorOperator.division;
      case 'SUBTRACTION':
        return ServiceNowConnectorOperator.subtraction;
      case 'MASK_ALL':
        return ServiceNowConnectorOperator.maskAll;
      case 'MASK_FIRST_N':
        return ServiceNowConnectorOperator.maskFirstN;
      case 'MASK_LAST_N':
        return ServiceNowConnectorOperator.maskLastN;
      case 'VALIDATE_NON_NULL':
        return ServiceNowConnectorOperator.validateNonNull;
      case 'VALIDATE_NON_ZERO':
        return ServiceNowConnectorOperator.validateNonZero;
      case 'VALIDATE_NON_NEGATIVE':
        return ServiceNowConnectorOperator.validateNonNegative;
      case 'VALIDATE_NUMERIC':
        return ServiceNowConnectorOperator.validateNumeric;
      case 'NO_OP':
        return ServiceNowConnectorOperator.noOp;
    }
    throw Exception('$this is not known in enum ServiceNowConnectorOperator');
  }
}

/// The connector-specific profile credentials required when using ServiceNow.
class ServiceNowConnectorProfileCredentials {
  /// The password that corresponds to the user name.
  final String password;

  /// The name of the user.
  final String username;

  ServiceNowConnectorProfileCredentials({
    required this.password,
    required this.username,
  });

  factory ServiceNowConnectorProfileCredentials.fromJson(
      Map<String, dynamic> json) {
    return ServiceNowConnectorProfileCredentials(
      password: json['password'] as String,
      username: json['username'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final password = this.password;
    final username = this.username;
    return {
      'password': password,
      'username': username,
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
  projection,
  equalTo,
  addition,
  multiplication,
  division,
  subtraction,
  maskAll,
  maskFirstN,
  maskLastN,
  validateNonNull,
  validateNonZero,
  validateNonNegative,
  validateNumeric,
  noOp,
}

extension on SingularConnectorOperator {
  String toValue() {
    switch (this) {
      case SingularConnectorOperator.projection:
        return 'PROJECTION';
      case SingularConnectorOperator.equalTo:
        return 'EQUAL_TO';
      case SingularConnectorOperator.addition:
        return 'ADDITION';
      case SingularConnectorOperator.multiplication:
        return 'MULTIPLICATION';
      case SingularConnectorOperator.division:
        return 'DIVISION';
      case SingularConnectorOperator.subtraction:
        return 'SUBTRACTION';
      case SingularConnectorOperator.maskAll:
        return 'MASK_ALL';
      case SingularConnectorOperator.maskFirstN:
        return 'MASK_FIRST_N';
      case SingularConnectorOperator.maskLastN:
        return 'MASK_LAST_N';
      case SingularConnectorOperator.validateNonNull:
        return 'VALIDATE_NON_NULL';
      case SingularConnectorOperator.validateNonZero:
        return 'VALIDATE_NON_ZERO';
      case SingularConnectorOperator.validateNonNegative:
        return 'VALIDATE_NON_NEGATIVE';
      case SingularConnectorOperator.validateNumeric:
        return 'VALIDATE_NUMERIC';
      case SingularConnectorOperator.noOp:
        return 'NO_OP';
    }
  }
}

extension on String {
  SingularConnectorOperator toSingularConnectorOperator() {
    switch (this) {
      case 'PROJECTION':
        return SingularConnectorOperator.projection;
      case 'EQUAL_TO':
        return SingularConnectorOperator.equalTo;
      case 'ADDITION':
        return SingularConnectorOperator.addition;
      case 'MULTIPLICATION':
        return SingularConnectorOperator.multiplication;
      case 'DIVISION':
        return SingularConnectorOperator.division;
      case 'SUBTRACTION':
        return SingularConnectorOperator.subtraction;
      case 'MASK_ALL':
        return SingularConnectorOperator.maskAll;
      case 'MASK_FIRST_N':
        return SingularConnectorOperator.maskFirstN;
      case 'MASK_LAST_N':
        return SingularConnectorOperator.maskLastN;
      case 'VALIDATE_NON_NULL':
        return SingularConnectorOperator.validateNonNull;
      case 'VALIDATE_NON_ZERO':
        return SingularConnectorOperator.validateNonZero;
      case 'VALIDATE_NON_NEGATIVE':
        return SingularConnectorOperator.validateNonNegative;
      case 'VALIDATE_NUMERIC':
        return SingularConnectorOperator.validateNumeric;
      case 'NO_OP':
        return SingularConnectorOperator.noOp;
    }
    throw Exception('$this is not known in enum SingularConnectorOperator');
  }
}

/// The connector-specific profile credentials required when using Singular.
class SingularConnectorProfileCredentials {
  /// A unique alphanumeric identifier used to authenticate a user, developer, or
  /// calling program to your API.
  final String apiKey;

  SingularConnectorProfileCredentials({
    required this.apiKey,
  });

  factory SingularConnectorProfileCredentials.fromJson(
      Map<String, dynamic> json) {
    return SingularConnectorProfileCredentials(
      apiKey: json['apiKey'] as String,
    );
  }

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
  projection,
  lessThan,
  greaterThan,
  between,
  lessThanOrEqualTo,
  greaterThanOrEqualTo,
  equalTo,
  addition,
  multiplication,
  division,
  subtraction,
  maskAll,
  maskFirstN,
  maskLastN,
  validateNonNull,
  validateNonZero,
  validateNonNegative,
  validateNumeric,
  noOp,
}

extension on SlackConnectorOperator {
  String toValue() {
    switch (this) {
      case SlackConnectorOperator.projection:
        return 'PROJECTION';
      case SlackConnectorOperator.lessThan:
        return 'LESS_THAN';
      case SlackConnectorOperator.greaterThan:
        return 'GREATER_THAN';
      case SlackConnectorOperator.between:
        return 'BETWEEN';
      case SlackConnectorOperator.lessThanOrEqualTo:
        return 'LESS_THAN_OR_EQUAL_TO';
      case SlackConnectorOperator.greaterThanOrEqualTo:
        return 'GREATER_THAN_OR_EQUAL_TO';
      case SlackConnectorOperator.equalTo:
        return 'EQUAL_TO';
      case SlackConnectorOperator.addition:
        return 'ADDITION';
      case SlackConnectorOperator.multiplication:
        return 'MULTIPLICATION';
      case SlackConnectorOperator.division:
        return 'DIVISION';
      case SlackConnectorOperator.subtraction:
        return 'SUBTRACTION';
      case SlackConnectorOperator.maskAll:
        return 'MASK_ALL';
      case SlackConnectorOperator.maskFirstN:
        return 'MASK_FIRST_N';
      case SlackConnectorOperator.maskLastN:
        return 'MASK_LAST_N';
      case SlackConnectorOperator.validateNonNull:
        return 'VALIDATE_NON_NULL';
      case SlackConnectorOperator.validateNonZero:
        return 'VALIDATE_NON_ZERO';
      case SlackConnectorOperator.validateNonNegative:
        return 'VALIDATE_NON_NEGATIVE';
      case SlackConnectorOperator.validateNumeric:
        return 'VALIDATE_NUMERIC';
      case SlackConnectorOperator.noOp:
        return 'NO_OP';
    }
  }
}

extension on String {
  SlackConnectorOperator toSlackConnectorOperator() {
    switch (this) {
      case 'PROJECTION':
        return SlackConnectorOperator.projection;
      case 'LESS_THAN':
        return SlackConnectorOperator.lessThan;
      case 'GREATER_THAN':
        return SlackConnectorOperator.greaterThan;
      case 'BETWEEN':
        return SlackConnectorOperator.between;
      case 'LESS_THAN_OR_EQUAL_TO':
        return SlackConnectorOperator.lessThanOrEqualTo;
      case 'GREATER_THAN_OR_EQUAL_TO':
        return SlackConnectorOperator.greaterThanOrEqualTo;
      case 'EQUAL_TO':
        return SlackConnectorOperator.equalTo;
      case 'ADDITION':
        return SlackConnectorOperator.addition;
      case 'MULTIPLICATION':
        return SlackConnectorOperator.multiplication;
      case 'DIVISION':
        return SlackConnectorOperator.division;
      case 'SUBTRACTION':
        return SlackConnectorOperator.subtraction;
      case 'MASK_ALL':
        return SlackConnectorOperator.maskAll;
      case 'MASK_FIRST_N':
        return SlackConnectorOperator.maskFirstN;
      case 'MASK_LAST_N':
        return SlackConnectorOperator.maskLastN;
      case 'VALIDATE_NON_NULL':
        return SlackConnectorOperator.validateNonNull;
      case 'VALIDATE_NON_ZERO':
        return SlackConnectorOperator.validateNonZero;
      case 'VALIDATE_NON_NEGATIVE':
        return SlackConnectorOperator.validateNonNegative;
      case 'VALIDATE_NUMERIC':
        return SlackConnectorOperator.validateNumeric;
      case 'NO_OP':
        return SlackConnectorOperator.noOp;
    }
    throw Exception('$this is not known in enum SlackConnectorOperator');
  }
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

  factory SlackConnectorProfileCredentials.fromJson(Map<String, dynamic> json) {
    return SlackConnectorProfileCredentials(
      clientId: json['clientId'] as String,
      clientSecret: json['clientSecret'] as String,
      accessToken: json['accessToken'] as String?,
      oAuthRequest: json['oAuthRequest'] != null
          ? ConnectorOAuthRequest.fromJson(
              json['oAuthRequest'] as Map<String, dynamic>)
          : null,
    );
  }

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
          ?.whereNotNull()
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

  factory SnowflakeConnectorProfileCredentials.fromJson(
      Map<String, dynamic> json) {
    return SnowflakeConnectorProfileCredentials(
      password: json['password'] as String,
      username: json['username'] as String,
    );
  }

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

  /// The AWS Region of the Snowflake account.
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
  /// Specifies the supported AWS Regions when using Snowflake.
  final List<String>? supportedRegions;

  SnowflakeMetadata({
    this.supportedRegions,
  });

  factory SnowflakeMetadata.fromJson(Map<String, dynamic> json) {
    return SnowflakeMetadata(
      supportedRegions: (json['supportedRegions'] as List?)
          ?.whereNotNull()
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

  /// Specifies the information that is required for querying Amazon S3.
  final S3SourceProperties? s3;

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
    this.datadog,
    this.dynatrace,
    this.googleAnalytics,
    this.inforNexus,
    this.marketo,
    this.s3,
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
      s3: json['S3'] != null
          ? S3SourceProperties.fromJson(json['S3'] as Map<String, dynamic>)
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
    final datadog = this.datadog;
    final dynatrace = this.dynatrace;
    final googleAnalytics = this.googleAnalytics;
    final inforNexus = this.inforNexus;
    final marketo = this.marketo;
    final s3 = this.s3;
    final salesforce = this.salesforce;
    final serviceNow = this.serviceNow;
    final singular = this.singular;
    final slack = this.slack;
    final trendmicro = this.trendmicro;
    final veeva = this.veeva;
    final zendesk = this.zendesk;
    return {
      if (amplitude != null) 'Amplitude': amplitude,
      if (datadog != null) 'Datadog': datadog,
      if (dynatrace != null) 'Dynatrace': dynatrace,
      if (googleAnalytics != null) 'GoogleAnalytics': googleAnalytics,
      if (inforNexus != null) 'InforNexus': inforNexus,
      if (marketo != null) 'Marketo': marketo,
      if (s3 != null) 'S3': s3,
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

  SourceFieldProperties({
    this.isQueryable,
    this.isRetrievable,
  });

  factory SourceFieldProperties.fromJson(Map<String, dynamic> json) {
    return SourceFieldProperties(
      isQueryable: json['isQueryable'] as bool?,
      isRetrievable: json['isRetrievable'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final isQueryable = this.isQueryable;
    final isRetrievable = this.isRetrievable;
    return {
      if (isQueryable != null) 'isQueryable': isQueryable,
      if (isRetrievable != null) 'isRetrievable': isRetrievable,
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

  /// The name of the connector profile. This name must be unique for each
  /// connector profile in the AWS account.
  final String? connectorProfileName;

  /// Defines the configuration for a scheduled incremental data pull. If a valid
  /// configuration is provided, the fields specified in the configuration are
  /// used when querying for the incremental data pull.
  final IncrementalPullConfig? incrementalPullConfig;

  SourceFlowConfig({
    required this.connectorType,
    required this.sourceConnectorProperties,
    this.connectorProfileName,
    this.incrementalPullConfig,
  });

  factory SourceFlowConfig.fromJson(Map<String, dynamic> json) {
    return SourceFlowConfig(
      connectorType: (json['connectorType'] as String).toConnectorType(),
      sourceConnectorProperties: SourceConnectorProperties.fromJson(
          json['sourceConnectorProperties'] as Map<String, dynamic>),
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
    final connectorProfileName = this.connectorProfileName;
    final incrementalPullConfig = this.incrementalPullConfig;
    return {
      'connectorType': connectorType.toValue(),
      'sourceConnectorProperties': sourceConnectorProperties,
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
      flowStatus: (json['flowStatus'] as String?)?.toFlowStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final executionId = this.executionId;
    final flowArn = this.flowArn;
    final flowStatus = this.flowStatus;
    return {
      if (executionId != null) 'executionId': executionId,
      if (flowArn != null) 'flowArn': flowArn,
      if (flowStatus != null) 'flowStatus': flowStatus.toValue(),
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
      flowStatus: (json['flowStatus'] as String?)?.toFlowStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final flowArn = this.flowArn;
    final flowStatus = this.flowStatus;
    return {
      if (flowArn != null) 'flowArn': flowArn,
      if (flowStatus != null) 'flowStatus': flowStatus.toValue(),
    };
  }
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
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      taskType: (json['taskType'] as String).toTaskType(),
      connectorOperator: json['connectorOperator'] != null
          ? ConnectorOperator.fromJson(
              json['connectorOperator'] as Map<String, dynamic>)
          : null,
      destinationField: json['destinationField'] as String?,
      taskProperties: (json['taskProperties'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k.toOperatorPropertiesKeys(), e as String)),
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
      'taskType': taskType.toValue(),
      if (connectorOperator != null) 'connectorOperator': connectorOperator,
      if (destinationField != null) 'destinationField': destinationField,
      if (taskProperties != null)
        'taskProperties':
            taskProperties.map((k, e) => MapEntry(k.toValue(), e)),
    };
  }
}

enum TaskType {
  arithmetic,
  filter,
  map,
  mapAll,
  mask,
  merge,
  truncate,
  validate,
}

extension on TaskType {
  String toValue() {
    switch (this) {
      case TaskType.arithmetic:
        return 'Arithmetic';
      case TaskType.filter:
        return 'Filter';
      case TaskType.map:
        return 'Map';
      case TaskType.mapAll:
        return 'Map_all';
      case TaskType.mask:
        return 'Mask';
      case TaskType.merge:
        return 'Merge';
      case TaskType.truncate:
        return 'Truncate';
      case TaskType.validate:
        return 'Validate';
    }
  }
}

extension on String {
  TaskType toTaskType() {
    switch (this) {
      case 'Arithmetic':
        return TaskType.arithmetic;
      case 'Filter':
        return TaskType.filter;
      case 'Map':
        return TaskType.map;
      case 'Map_all':
        return TaskType.mapAll;
      case 'Mask':
        return TaskType.mask;
      case 'Merge':
        return TaskType.merge;
      case 'Truncate':
        return TaskType.truncate;
      case 'Validate':
        return TaskType.validate;
    }
    throw Exception('$this is not known in enum TaskType');
  }
}

enum TrendmicroConnectorOperator {
  projection,
  equalTo,
  addition,
  multiplication,
  division,
  subtraction,
  maskAll,
  maskFirstN,
  maskLastN,
  validateNonNull,
  validateNonZero,
  validateNonNegative,
  validateNumeric,
  noOp,
}

extension on TrendmicroConnectorOperator {
  String toValue() {
    switch (this) {
      case TrendmicroConnectorOperator.projection:
        return 'PROJECTION';
      case TrendmicroConnectorOperator.equalTo:
        return 'EQUAL_TO';
      case TrendmicroConnectorOperator.addition:
        return 'ADDITION';
      case TrendmicroConnectorOperator.multiplication:
        return 'MULTIPLICATION';
      case TrendmicroConnectorOperator.division:
        return 'DIVISION';
      case TrendmicroConnectorOperator.subtraction:
        return 'SUBTRACTION';
      case TrendmicroConnectorOperator.maskAll:
        return 'MASK_ALL';
      case TrendmicroConnectorOperator.maskFirstN:
        return 'MASK_FIRST_N';
      case TrendmicroConnectorOperator.maskLastN:
        return 'MASK_LAST_N';
      case TrendmicroConnectorOperator.validateNonNull:
        return 'VALIDATE_NON_NULL';
      case TrendmicroConnectorOperator.validateNonZero:
        return 'VALIDATE_NON_ZERO';
      case TrendmicroConnectorOperator.validateNonNegative:
        return 'VALIDATE_NON_NEGATIVE';
      case TrendmicroConnectorOperator.validateNumeric:
        return 'VALIDATE_NUMERIC';
      case TrendmicroConnectorOperator.noOp:
        return 'NO_OP';
    }
  }
}

extension on String {
  TrendmicroConnectorOperator toTrendmicroConnectorOperator() {
    switch (this) {
      case 'PROJECTION':
        return TrendmicroConnectorOperator.projection;
      case 'EQUAL_TO':
        return TrendmicroConnectorOperator.equalTo;
      case 'ADDITION':
        return TrendmicroConnectorOperator.addition;
      case 'MULTIPLICATION':
        return TrendmicroConnectorOperator.multiplication;
      case 'DIVISION':
        return TrendmicroConnectorOperator.division;
      case 'SUBTRACTION':
        return TrendmicroConnectorOperator.subtraction;
      case 'MASK_ALL':
        return TrendmicroConnectorOperator.maskAll;
      case 'MASK_FIRST_N':
        return TrendmicroConnectorOperator.maskFirstN;
      case 'MASK_LAST_N':
        return TrendmicroConnectorOperator.maskLastN;
      case 'VALIDATE_NON_NULL':
        return TrendmicroConnectorOperator.validateNonNull;
      case 'VALIDATE_NON_ZERO':
        return TrendmicroConnectorOperator.validateNonZero;
      case 'VALIDATE_NON_NEGATIVE':
        return TrendmicroConnectorOperator.validateNonNegative;
      case 'VALIDATE_NUMERIC':
        return TrendmicroConnectorOperator.validateNumeric;
      case 'NO_OP':
        return TrendmicroConnectorOperator.noOp;
    }
    throw Exception('$this is not known in enum TrendmicroConnectorOperator');
  }
}

/// The connector-specific profile credentials required when using Trend Micro.
class TrendmicroConnectorProfileCredentials {
  /// The Secret Access Key portion of the credentials.
  final String apiSecretKey;

  TrendmicroConnectorProfileCredentials({
    required this.apiSecretKey,
  });

  factory TrendmicroConnectorProfileCredentials.fromJson(
      Map<String, dynamic> json) {
    return TrendmicroConnectorProfileCredentials(
      apiSecretKey: json['apiSecretKey'] as String,
    );
  }

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
      triggerType: (json['triggerType'] as String).toTriggerType(),
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
      'triggerType': triggerType.toValue(),
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
  scheduled,
  event,
  onDemand,
}

extension on TriggerType {
  String toValue() {
    switch (this) {
      case TriggerType.scheduled:
        return 'Scheduled';
      case TriggerType.event:
        return 'Event';
      case TriggerType.onDemand:
        return 'OnDemand';
    }
  }
}

extension on String {
  TriggerType toTriggerType() {
    switch (this) {
      case 'Scheduled':
        return TriggerType.scheduled;
      case 'Event':
        return TriggerType.event;
      case 'OnDemand':
        return TriggerType.onDemand;
    }
    throw Exception('$this is not known in enum TriggerType');
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

class UpdateFlowResponse {
  /// Indicates the current status of the flow.
  final FlowStatus? flowStatus;

  UpdateFlowResponse({
    this.flowStatus,
  });

  factory UpdateFlowResponse.fromJson(Map<String, dynamic> json) {
    return UpdateFlowResponse(
      flowStatus: (json['flowStatus'] as String?)?.toFlowStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final flowStatus = this.flowStatus;
    return {
      if (flowStatus != null) 'flowStatus': flowStatus.toValue(),
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
      fileType: (json['fileType'] as String?)?.toFileType(),
    );
  }

  Map<String, dynamic> toJson() {
    final prefixConfig = this.prefixConfig;
    final aggregationConfig = this.aggregationConfig;
    final fileType = this.fileType;
    return {
      'prefixConfig': prefixConfig,
      if (aggregationConfig != null) 'aggregationConfig': aggregationConfig,
      if (fileType != null) 'fileType': fileType.toValue(),
    };
  }
}

enum VeevaConnectorOperator {
  projection,
  lessThan,
  greaterThan,
  contains,
  between,
  lessThanOrEqualTo,
  greaterThanOrEqualTo,
  equalTo,
  notEqualTo,
  addition,
  multiplication,
  division,
  subtraction,
  maskAll,
  maskFirstN,
  maskLastN,
  validateNonNull,
  validateNonZero,
  validateNonNegative,
  validateNumeric,
  noOp,
}

extension on VeevaConnectorOperator {
  String toValue() {
    switch (this) {
      case VeevaConnectorOperator.projection:
        return 'PROJECTION';
      case VeevaConnectorOperator.lessThan:
        return 'LESS_THAN';
      case VeevaConnectorOperator.greaterThan:
        return 'GREATER_THAN';
      case VeevaConnectorOperator.contains:
        return 'CONTAINS';
      case VeevaConnectorOperator.between:
        return 'BETWEEN';
      case VeevaConnectorOperator.lessThanOrEqualTo:
        return 'LESS_THAN_OR_EQUAL_TO';
      case VeevaConnectorOperator.greaterThanOrEqualTo:
        return 'GREATER_THAN_OR_EQUAL_TO';
      case VeevaConnectorOperator.equalTo:
        return 'EQUAL_TO';
      case VeevaConnectorOperator.notEqualTo:
        return 'NOT_EQUAL_TO';
      case VeevaConnectorOperator.addition:
        return 'ADDITION';
      case VeevaConnectorOperator.multiplication:
        return 'MULTIPLICATION';
      case VeevaConnectorOperator.division:
        return 'DIVISION';
      case VeevaConnectorOperator.subtraction:
        return 'SUBTRACTION';
      case VeevaConnectorOperator.maskAll:
        return 'MASK_ALL';
      case VeevaConnectorOperator.maskFirstN:
        return 'MASK_FIRST_N';
      case VeevaConnectorOperator.maskLastN:
        return 'MASK_LAST_N';
      case VeevaConnectorOperator.validateNonNull:
        return 'VALIDATE_NON_NULL';
      case VeevaConnectorOperator.validateNonZero:
        return 'VALIDATE_NON_ZERO';
      case VeevaConnectorOperator.validateNonNegative:
        return 'VALIDATE_NON_NEGATIVE';
      case VeevaConnectorOperator.validateNumeric:
        return 'VALIDATE_NUMERIC';
      case VeevaConnectorOperator.noOp:
        return 'NO_OP';
    }
  }
}

extension on String {
  VeevaConnectorOperator toVeevaConnectorOperator() {
    switch (this) {
      case 'PROJECTION':
        return VeevaConnectorOperator.projection;
      case 'LESS_THAN':
        return VeevaConnectorOperator.lessThan;
      case 'GREATER_THAN':
        return VeevaConnectorOperator.greaterThan;
      case 'CONTAINS':
        return VeevaConnectorOperator.contains;
      case 'BETWEEN':
        return VeevaConnectorOperator.between;
      case 'LESS_THAN_OR_EQUAL_TO':
        return VeevaConnectorOperator.lessThanOrEqualTo;
      case 'GREATER_THAN_OR_EQUAL_TO':
        return VeevaConnectorOperator.greaterThanOrEqualTo;
      case 'EQUAL_TO':
        return VeevaConnectorOperator.equalTo;
      case 'NOT_EQUAL_TO':
        return VeevaConnectorOperator.notEqualTo;
      case 'ADDITION':
        return VeevaConnectorOperator.addition;
      case 'MULTIPLICATION':
        return VeevaConnectorOperator.multiplication;
      case 'DIVISION':
        return VeevaConnectorOperator.division;
      case 'SUBTRACTION':
        return VeevaConnectorOperator.subtraction;
      case 'MASK_ALL':
        return VeevaConnectorOperator.maskAll;
      case 'MASK_FIRST_N':
        return VeevaConnectorOperator.maskFirstN;
      case 'MASK_LAST_N':
        return VeevaConnectorOperator.maskLastN;
      case 'VALIDATE_NON_NULL':
        return VeevaConnectorOperator.validateNonNull;
      case 'VALIDATE_NON_ZERO':
        return VeevaConnectorOperator.validateNonZero;
      case 'VALIDATE_NON_NEGATIVE':
        return VeevaConnectorOperator.validateNonNegative;
      case 'VALIDATE_NUMERIC':
        return VeevaConnectorOperator.validateNumeric;
      case 'NO_OP':
        return VeevaConnectorOperator.noOp;
    }
    throw Exception('$this is not known in enum VeevaConnectorOperator');
  }
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

  factory VeevaConnectorProfileCredentials.fromJson(Map<String, dynamic> json) {
    return VeevaConnectorProfileCredentials(
      password: json['password'] as String,
      username: json['username'] as String,
    );
  }

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

  VeevaSourceProperties({
    required this.object,
  });

  factory VeevaSourceProperties.fromJson(Map<String, dynamic> json) {
    return VeevaSourceProperties(
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

/// The possible write operations in the destination connector. When this value
/// is not provided, this defaults to the <code>INSERT</code> operation.
enum WriteOperationType {
  insert,
  upsert,
  update,
}

extension on WriteOperationType {
  String toValue() {
    switch (this) {
      case WriteOperationType.insert:
        return 'INSERT';
      case WriteOperationType.upsert:
        return 'UPSERT';
      case WriteOperationType.update:
        return 'UPDATE';
    }
  }
}

extension on String {
  WriteOperationType toWriteOperationType() {
    switch (this) {
      case 'INSERT':
        return WriteOperationType.insert;
      case 'UPSERT':
        return WriteOperationType.upsert;
      case 'UPDATE':
        return WriteOperationType.update;
    }
    throw Exception('$this is not known in enum WriteOperationType');
  }
}

enum ZendeskConnectorOperator {
  projection,
  greaterThan,
  addition,
  multiplication,
  division,
  subtraction,
  maskAll,
  maskFirstN,
  maskLastN,
  validateNonNull,
  validateNonZero,
  validateNonNegative,
  validateNumeric,
  noOp,
}

extension on ZendeskConnectorOperator {
  String toValue() {
    switch (this) {
      case ZendeskConnectorOperator.projection:
        return 'PROJECTION';
      case ZendeskConnectorOperator.greaterThan:
        return 'GREATER_THAN';
      case ZendeskConnectorOperator.addition:
        return 'ADDITION';
      case ZendeskConnectorOperator.multiplication:
        return 'MULTIPLICATION';
      case ZendeskConnectorOperator.division:
        return 'DIVISION';
      case ZendeskConnectorOperator.subtraction:
        return 'SUBTRACTION';
      case ZendeskConnectorOperator.maskAll:
        return 'MASK_ALL';
      case ZendeskConnectorOperator.maskFirstN:
        return 'MASK_FIRST_N';
      case ZendeskConnectorOperator.maskLastN:
        return 'MASK_LAST_N';
      case ZendeskConnectorOperator.validateNonNull:
        return 'VALIDATE_NON_NULL';
      case ZendeskConnectorOperator.validateNonZero:
        return 'VALIDATE_NON_ZERO';
      case ZendeskConnectorOperator.validateNonNegative:
        return 'VALIDATE_NON_NEGATIVE';
      case ZendeskConnectorOperator.validateNumeric:
        return 'VALIDATE_NUMERIC';
      case ZendeskConnectorOperator.noOp:
        return 'NO_OP';
    }
  }
}

extension on String {
  ZendeskConnectorOperator toZendeskConnectorOperator() {
    switch (this) {
      case 'PROJECTION':
        return ZendeskConnectorOperator.projection;
      case 'GREATER_THAN':
        return ZendeskConnectorOperator.greaterThan;
      case 'ADDITION':
        return ZendeskConnectorOperator.addition;
      case 'MULTIPLICATION':
        return ZendeskConnectorOperator.multiplication;
      case 'DIVISION':
        return ZendeskConnectorOperator.division;
      case 'SUBTRACTION':
        return ZendeskConnectorOperator.subtraction;
      case 'MASK_ALL':
        return ZendeskConnectorOperator.maskAll;
      case 'MASK_FIRST_N':
        return ZendeskConnectorOperator.maskFirstN;
      case 'MASK_LAST_N':
        return ZendeskConnectorOperator.maskLastN;
      case 'VALIDATE_NON_NULL':
        return ZendeskConnectorOperator.validateNonNull;
      case 'VALIDATE_NON_ZERO':
        return ZendeskConnectorOperator.validateNonZero;
      case 'VALIDATE_NON_NEGATIVE':
        return ZendeskConnectorOperator.validateNonNegative;
      case 'VALIDATE_NUMERIC':
        return ZendeskConnectorOperator.validateNumeric;
      case 'NO_OP':
        return ZendeskConnectorOperator.noOp;
    }
    throw Exception('$this is not known in enum ZendeskConnectorOperator');
  }
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

  factory ZendeskConnectorProfileCredentials.fromJson(
      Map<String, dynamic> json) {
    return ZendeskConnectorProfileCredentials(
      clientId: json['clientId'] as String,
      clientSecret: json['clientSecret'] as String,
      accessToken: json['accessToken'] as String?,
      oAuthRequest: json['oAuthRequest'] != null
          ? ConnectorOAuthRequest.fromJson(
              json['oAuthRequest'] as Map<String, dynamic>)
          : null,
    );
  }

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
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      writeOperationType:
          (json['writeOperationType'] as String?)?.toWriteOperationType(),
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
        'writeOperationType': writeOperationType.toValue(),
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
          ?.whereNotNull()
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
  'UnsupportedOperationException': (type, message) =>
      UnsupportedOperationException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
