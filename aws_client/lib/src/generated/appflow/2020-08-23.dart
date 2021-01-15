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

part '2020-08-23.g.dart';

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
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
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
    @_s.required ConnectionMode connectionMode,
    @_s.required ConnectorProfileConfig connectorProfileConfig,
    @_s.required String connectorProfileName,
    @_s.required ConnectorType connectorType,
    String kmsArn,
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
    _s.validateStringPattern(
      'connectorProfileName',
      connectorProfileName,
      r'''[\w/!@#+=.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(connectorType, 'connectorType');
    _s.validateStringLength(
      'kmsArn',
      kmsArn,
      20,
      2048,
    );
    _s.validateStringPattern(
      'kmsArn',
      kmsArn,
      r'''arn:aws:kms:.*:[0-9]+:.*''',
    );
    final $payload = <String, dynamic>{
      'connectionMode': connectionMode?.toValue() ?? '',
      'connectorProfileConfig': connectorProfileConfig,
      'connectorProfileName': connectorProfileName,
      'connectorType': connectorType?.toValue() ?? '',
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
    @_s.required List<DestinationFlowConfig> destinationFlowConfigList,
    @_s.required String flowName,
    @_s.required SourceFlowConfig sourceFlowConfig,
    @_s.required List<Task> tasks,
    @_s.required TriggerConfig triggerConfig,
    String description,
    String kmsArn,
    Map<String, String> tags,
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
    _s.validateStringPattern(
      'flowName',
      flowName,
      r'''[a-zA-Z0-9][\w!@#.-]+''',
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
    _s.validateStringPattern(
      'description',
      description,
      r'''[\w!@#\-.?,\s]*''',
    );
    _s.validateStringLength(
      'kmsArn',
      kmsArn,
      20,
      2048,
    );
    _s.validateStringPattern(
      'kmsArn',
      kmsArn,
      r'''arn:aws:kms:.*:[0-9]+:.*''',
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
    @_s.required String connectorProfileName,
    bool forceDelete,
  }) async {
    ArgumentError.checkNotNull(connectorProfileName, 'connectorProfileName');
    _s.validateStringLength(
      'connectorProfileName',
      connectorProfileName,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'connectorProfileName',
      connectorProfileName,
      r'''[\w/!@#+=.-]+''',
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
    return DeleteConnectorProfileResponse.fromJson(response);
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
    @_s.required String flowName,
    bool forceDelete,
  }) async {
    ArgumentError.checkNotNull(flowName, 'flowName');
    _s.validateStringLength(
      'flowName',
      flowName,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'flowName',
      flowName,
      r'''[a-zA-Z0-9][\w!@#.-]+''',
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
    return DeleteFlowResponse.fromJson(response);
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
    @_s.required String connectorEntityName,
    String connectorProfileName,
    ConnectorType connectorType,
  }) async {
    ArgumentError.checkNotNull(connectorEntityName, 'connectorEntityName');
    _s.validateStringLength(
      'connectorEntityName',
      connectorEntityName,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'connectorEntityName',
      connectorEntityName,
      r'''\S+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'connectorProfileName',
      connectorProfileName,
      0,
      256,
    );
    _s.validateStringPattern(
      'connectorProfileName',
      connectorProfileName,
      r'''[\w/!@#+=.-]+''',
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
    List<String> connectorProfileNames,
    ConnectorType connectorType,
    int maxResults,
    String nextToken,
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''\S+''',
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
    List<ConnectorType> connectorTypes,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      2048,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''\S+''',
    );
    final $payload = <String, dynamic>{
      if (connectorTypes != null)
        'connectorTypes':
            connectorTypes.map((e) => e?.toValue() ?? '').toList(),
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
    @_s.required String flowName,
  }) async {
    ArgumentError.checkNotNull(flowName, 'flowName');
    _s.validateStringLength(
      'flowName',
      flowName,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'flowName',
      flowName,
      r'''[a-zA-Z0-9][\w!@#.-]+''',
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
    @_s.required String flowName,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(flowName, 'flowName');
    _s.validateStringLength(
      'flowName',
      flowName,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'flowName',
      flowName,
      r'''[a-zA-Z0-9][\w!@#.-]+''',
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''\S+''',
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
    String connectorProfileName,
    ConnectorType connectorType,
    String entitiesPath,
  }) async {
    _s.validateStringLength(
      'connectorProfileName',
      connectorProfileName,
      0,
      256,
    );
    _s.validateStringPattern(
      'connectorProfileName',
      connectorProfileName,
      r'''[\w/!@#+=.-]+''',
    );
    _s.validateStringLength(
      'entitiesPath',
      entitiesPath,
      0,
      256,
    );
    _s.validateStringPattern(
      'entitiesPath',
      entitiesPath,
      r'''[\s\w/!@#+=.-]*''',
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
    int maxResults,
    String nextToken,
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''\S+''',
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
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      0,
      512,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''arn:aws:.*:.*:[0-9]+:.*''',
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
    @_s.required String flowName,
  }) async {
    ArgumentError.checkNotNull(flowName, 'flowName');
    _s.validateStringLength(
      'flowName',
      flowName,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'flowName',
      flowName,
      r'''[a-zA-Z0-9][\w!@#.-]+''',
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
    @_s.required String flowName,
  }) async {
    ArgumentError.checkNotNull(flowName, 'flowName');
    _s.validateStringLength(
      'flowName',
      flowName,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'flowName',
      flowName,
      r'''[a-zA-Z0-9][\w!@#.-]+''',
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
    @_s.required String resourceArn,
    @_s.required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      0,
      512,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''arn:aws:.*:.*:[0-9]+:.*''',
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
    return TagResourceResponse.fromJson(response);
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
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      0,
      512,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''arn:aws:.*:.*:[0-9]+:.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      if (tagKeys != null) 'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UntagResourceResponse.fromJson(response);
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
    @_s.required ConnectionMode connectionMode,
    @_s.required ConnectorProfileConfig connectorProfileConfig,
    @_s.required String connectorProfileName,
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
    _s.validateStringPattern(
      'connectorProfileName',
      connectorProfileName,
      r'''[\w/!@#+=.-]+''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'connectionMode': connectionMode?.toValue() ?? '',
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
    @_s.required List<DestinationFlowConfig> destinationFlowConfigList,
    @_s.required String flowName,
    @_s.required List<Task> tasks,
    @_s.required TriggerConfig triggerConfig,
    String description,
    SourceFlowConfig sourceFlowConfig,
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
    _s.validateStringPattern(
      'flowName',
      flowName,
      r'''[a-zA-Z0-9][\w!@#.-]+''',
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
    _s.validateStringPattern(
      'description',
      description,
      r'''[\w!@#\-.?,\s]*''',
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AggregationConfig {
  /// Specifies whether Amazon AppFlow aggregates the flow records into a single
  /// file, or leave them unaggregated.
  @_s.JsonKey(name: 'aggregationType')
  final AggregationType aggregationType;

  AggregationConfig({
    this.aggregationType,
  });
  factory AggregationConfig.fromJson(Map<String, dynamic> json) =>
      _$AggregationConfigFromJson(json);

  Map<String, dynamic> toJson() => _$AggregationConfigToJson(this);
}

enum AggregationType {
  @_s.JsonValue('None')
  none,
  @_s.JsonValue('SingleFile')
  singleFile,
}

enum AmplitudeConnectorOperator {
  @_s.JsonValue('BETWEEN')
  between,
}

/// The connector-specific credentials required when using Amplitude.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class AmplitudeConnectorProfileCredentials {
  /// A unique alphanumeric identifier used to authenticate a user, developer, or
  /// calling program to your API.
  @_s.JsonKey(name: 'apiKey')
  final String apiKey;

  /// The Secret Access Key portion of the credentials.
  @_s.JsonKey(name: 'secretKey')
  final String secretKey;

  AmplitudeConnectorProfileCredentials({
    @_s.required this.apiKey,
    @_s.required this.secretKey,
  });
  Map<String, dynamic> toJson() =>
      _$AmplitudeConnectorProfileCredentialsToJson(this);
}

/// The connector-specific profile properties required when using Amplitude.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AmplitudeConnectorProfileProperties {
  AmplitudeConnectorProfileProperties();
  factory AmplitudeConnectorProfileProperties.fromJson(
          Map<String, dynamic> json) =>
      _$AmplitudeConnectorProfilePropertiesFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AmplitudeConnectorProfilePropertiesToJson(this);
}

/// The connector metadata specific to Amplitude.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AmplitudeMetadata {
  AmplitudeMetadata();
  factory AmplitudeMetadata.fromJson(Map<String, dynamic> json) =>
      _$AmplitudeMetadataFromJson(json);
}

/// The properties that are applied when Amplitude is being used as a source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AmplitudeSourceProperties {
  /// The object specified in the Amplitude flow source.
  @_s.JsonKey(name: 'object')
  final String object;

  AmplitudeSourceProperties({
    @_s.required this.object,
  });
  factory AmplitudeSourceProperties.fromJson(Map<String, dynamic> json) =>
      _$AmplitudeSourcePropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$AmplitudeSourcePropertiesToJson(this);
}

enum ConnectionMode {
  @_s.JsonValue('Public')
  public,
  @_s.JsonValue('Private')
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
    throw Exception('Unknown enum value: $this');
  }
}

/// The configuration settings related to a given connector.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConnectorConfiguration {
  /// Specifies whether the connector can be used as a destination.
  @_s.JsonKey(name: 'canUseAsDestination')
  final bool canUseAsDestination;

  /// Specifies whether the connector can be used as a source.
  @_s.JsonKey(name: 'canUseAsSource')
  final bool canUseAsSource;

  /// Specifies connector-specific metadata such as <code>oAuthScopes</code>,
  /// <code>supportedRegions</code>, <code>privateLinkServiceUrl</code>, and so
  /// on.
  @_s.JsonKey(name: 'connectorMetadata')
  final ConnectorMetadata connectorMetadata;

  /// Specifies if PrivateLink is enabled for that connector.
  @_s.JsonKey(name: 'isPrivateLinkEnabled')
  final bool isPrivateLinkEnabled;

  /// Specifies if a PrivateLink endpoint URL is required.
  @_s.JsonKey(name: 'isPrivateLinkEndpointUrlRequired')
  final bool isPrivateLinkEndpointUrlRequired;

  /// Lists the connectors that are available for use as destinations.
  @_s.JsonKey(name: 'supportedDestinationConnectors')
  final List<ConnectorType> supportedDestinationConnectors;

  /// Specifies the supported flow frequency for that connector.
  @_s.JsonKey(name: 'supportedSchedulingFrequencies')
  final List<ScheduleFrequencyType> supportedSchedulingFrequencies;

  /// Specifies the supported trigger types for the flow.
  @_s.JsonKey(name: 'supportedTriggerTypes')
  final List<TriggerType> supportedTriggerTypes;

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
  factory ConnectorConfiguration.fromJson(Map<String, dynamic> json) =>
      _$ConnectorConfigurationFromJson(json);
}

/// The high-level entity that can be queried in Amazon AppFlow. For example, a
/// Salesforce entity might be an <i>Account</i> or <i>Opportunity</i>, whereas
/// a ServiceNow entity might be an <i>Incident</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConnectorEntity {
  /// The name of the connector entity.
  @_s.JsonKey(name: 'name')
  final String name;

  /// Specifies whether the connector entity is a parent or a category and has
  /// more entities nested underneath it. If another call is made with
  /// <code>entitiesPath =
  /// "the_current_entity_name_with_hasNestedEntities_true"</code>, then it
  /// returns the nested entities underneath it. This provides a way to retrieve
  /// all supported entities in a recursive fashion.
  @_s.JsonKey(name: 'hasNestedEntities')
  final bool hasNestedEntities;

  /// The label applied to the connector entity.
  @_s.JsonKey(name: 'label')
  final String label;

  ConnectorEntity({
    @_s.required this.name,
    this.hasNestedEntities,
    this.label,
  });
  factory ConnectorEntity.fromJson(Map<String, dynamic> json) =>
      _$ConnectorEntityFromJson(json);
}

/// Describes the data model of a connector field. For example, for an
/// <i>account</i> entity, the fields would be <i>account name</i>, <i>account
/// ID</i>, and so on.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConnectorEntityField {
  /// The unique identifier of the connector field.
  @_s.JsonKey(name: 'identifier')
  final String identifier;

  /// A description of the connector entity field.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The properties applied to a field when the connector is being used as a
  /// destination.
  @_s.JsonKey(name: 'destinationProperties')
  final DestinationFieldProperties destinationProperties;

  /// The label applied to a connector entity field.
  @_s.JsonKey(name: 'label')
  final String label;

  /// The properties that can be applied to a field when the connector is being
  /// used as a source.
  @_s.JsonKey(name: 'sourceProperties')
  final SourceFieldProperties sourceProperties;

  /// Contains details regarding the supported <code>FieldType</code>, including
  /// the corresponding <code>filterOperators</code> and
  /// <code>supportedValues</code>.
  @_s.JsonKey(name: 'supportedFieldTypeDetails')
  final SupportedFieldTypeDetails supportedFieldTypeDetails;

  ConnectorEntityField({
    @_s.required this.identifier,
    this.description,
    this.destinationProperties,
    this.label,
    this.sourceProperties,
    this.supportedFieldTypeDetails,
  });
  factory ConnectorEntityField.fromJson(Map<String, dynamic> json) =>
      _$ConnectorEntityFieldFromJson(json);
}

/// A structure to specify connector-specific metadata such as
/// <code>oAuthScopes</code>, <code>supportedRegions</code>,
/// <code>privateLinkServiceUrl</code>, and so on.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConnectorMetadata {
  /// The connector metadata specific to Amplitude.
  @_s.JsonKey(name: 'Amplitude')
  final AmplitudeMetadata amplitude;

  /// The connector metadata specific to Datadog.
  @_s.JsonKey(name: 'Datadog')
  final DatadogMetadata datadog;

  /// The connector metadata specific to Dynatrace.
  @_s.JsonKey(name: 'Dynatrace')
  final DynatraceMetadata dynatrace;

  /// The connector metadata specific to Amazon EventBridge.
  @_s.JsonKey(name: 'EventBridge')
  final EventBridgeMetadata eventBridge;

  /// The connector metadata specific to Google Analytics.
  @_s.JsonKey(name: 'GoogleAnalytics')
  final GoogleAnalyticsMetadata googleAnalytics;

  /// The connector metadata specific to Infor Nexus.
  @_s.JsonKey(name: 'InforNexus')
  final InforNexusMetadata inforNexus;

  /// The connector metadata specific to Marketo.
  @_s.JsonKey(name: 'Marketo')
  final MarketoMetadata marketo;

  /// The connector metadata specific to Amazon Redshift.
  @_s.JsonKey(name: 'Redshift')
  final RedshiftMetadata redshift;

  /// The connector metadata specific to Amazon S3.
  @_s.JsonKey(name: 'S3')
  final S3Metadata s3;

  /// The connector metadata specific to Salesforce.
  @_s.JsonKey(name: 'Salesforce')
  final SalesforceMetadata salesforce;

  /// The connector metadata specific to ServiceNow.
  @_s.JsonKey(name: 'ServiceNow')
  final ServiceNowMetadata serviceNow;

  /// The connector metadata specific to Singular.
  @_s.JsonKey(name: 'Singular')
  final SingularMetadata singular;

  /// The connector metadata specific to Slack.
  @_s.JsonKey(name: 'Slack')
  final SlackMetadata slack;

  /// The connector metadata specific to Snowflake.
  @_s.JsonKey(name: 'Snowflake')
  final SnowflakeMetadata snowflake;

  /// The connector metadata specific to Trend Micro.
  @_s.JsonKey(name: 'Trendmicro')
  final TrendmicroMetadata trendmicro;

  /// The connector metadata specific to Upsolver.
  @_s.JsonKey(name: 'Upsolver')
  final UpsolverMetadata upsolver;

  /// The connector metadata specific to Veeva.
  @_s.JsonKey(name: 'Veeva')
  final VeevaMetadata veeva;

  /// The connector metadata specific to Zendesk.
  @_s.JsonKey(name: 'Zendesk')
  final ZendeskMetadata zendesk;

  ConnectorMetadata({
    this.amplitude,
    this.datadog,
    this.dynatrace,
    this.eventBridge,
    this.googleAnalytics,
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
  factory ConnectorMetadata.fromJson(Map<String, dynamic> json) =>
      _$ConnectorMetadataFromJson(json);
}

/// Used by select connectors for which the OAuth workflow is supported, such as
/// Salesforce, Google Analytics, Marketo, Zendesk, and Slack.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ConnectorOAuthRequest {
  /// The code provided by the connector when it has been authenticated via the
  /// connected app.
  @_s.JsonKey(name: 'authCode')
  final String authCode;

  /// The URL to which the authentication server redirects the browser after
  /// authorization has been granted.
  @_s.JsonKey(name: 'redirectUri')
  final String redirectUri;

  ConnectorOAuthRequest({
    this.authCode,
    this.redirectUri,
  });
  Map<String, dynamic> toJson() => _$ConnectorOAuthRequestToJson(this);
}

/// The operation to be performed on the provided source fields.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ConnectorOperator {
  /// The operation to be performed on the provided Amplitude source fields.
  @_s.JsonKey(name: 'Amplitude')
  final AmplitudeConnectorOperator amplitude;

  /// The operation to be performed on the provided Datadog source fields.
  @_s.JsonKey(name: 'Datadog')
  final DatadogConnectorOperator datadog;

  /// The operation to be performed on the provided Dynatrace source fields.
  @_s.JsonKey(name: 'Dynatrace')
  final DynatraceConnectorOperator dynatrace;

  /// The operation to be performed on the provided Google Analytics source
  /// fields.
  @_s.JsonKey(name: 'GoogleAnalytics')
  final GoogleAnalyticsConnectorOperator googleAnalytics;

  /// The operation to be performed on the provided Infor Nexus source fields.
  @_s.JsonKey(name: 'InforNexus')
  final InforNexusConnectorOperator inforNexus;

  /// The operation to be performed on the provided Marketo source fields.
  @_s.JsonKey(name: 'Marketo')
  final MarketoConnectorOperator marketo;

  /// The operation to be performed on the provided Amazon S3 source fields.
  @_s.JsonKey(name: 'S3')
  final S3ConnectorOperator s3;

  /// The operation to be performed on the provided Salesforce source fields.
  @_s.JsonKey(name: 'Salesforce')
  final SalesforceConnectorOperator salesforce;

  /// The operation to be performed on the provided ServiceNow source fields.
  @_s.JsonKey(name: 'ServiceNow')
  final ServiceNowConnectorOperator serviceNow;

  /// The operation to be performed on the provided Singular source fields.
  @_s.JsonKey(name: 'Singular')
  final SingularConnectorOperator singular;

  /// The operation to be performed on the provided Slack source fields.
  @_s.JsonKey(name: 'Slack')
  final SlackConnectorOperator slack;

  /// The operation to be performed on the provided Trend Micro source fields.
  @_s.JsonKey(name: 'Trendmicro')
  final TrendmicroConnectorOperator trendmicro;

  /// The operation to be performed on the provided Veeva source fields.
  @_s.JsonKey(name: 'Veeva')
  final VeevaConnectorOperator veeva;

  /// The operation to be performed on the provided Zendesk source fields.
  @_s.JsonKey(name: 'Zendesk')
  final ZendeskConnectorOperator zendesk;

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
  factory ConnectorOperator.fromJson(Map<String, dynamic> json) =>
      _$ConnectorOperatorFromJson(json);

  Map<String, dynamic> toJson() => _$ConnectorOperatorToJson(this);
}

/// Describes an instance of a connector. This includes the provided name,
/// credentials ARN, connection-mode, and so on. To keep the API intuitive and
/// extensible, the fields that are common to all types of connector profiles
/// are explicitly specified at the top level. The rest of the
/// connector-specific properties are available via the
/// <code>connectorProfileProperties</code> field.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConnectorProfile {
  /// Indicates the connection mode and if it is public or private.
  @_s.JsonKey(name: 'connectionMode')
  final ConnectionMode connectionMode;

  /// The Amazon Resource Name (ARN) of the connector profile.
  @_s.JsonKey(name: 'connectorProfileArn')
  final String connectorProfileArn;

  /// The name of the connector profile. The name is unique for each
  /// <code>ConnectorProfile</code> in the AWS account.
  @_s.JsonKey(name: 'connectorProfileName')
  final String connectorProfileName;

  /// The connector-specific properties of the profile configuration.
  @_s.JsonKey(name: 'connectorProfileProperties')
  final ConnectorProfileProperties connectorProfileProperties;

  /// The type of connector, such as Salesforce, Amplitude, and so on.
  @_s.JsonKey(name: 'connectorType')
  final ConnectorType connectorType;

  /// Specifies when the connector profile was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The Amazon Resource Name (ARN) of the connector profile credentials.
  @_s.JsonKey(name: 'credentialsArn')
  final String credentialsArn;

  /// Specifies when the connector profile was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedAt')
  final DateTime lastUpdatedAt;

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
  factory ConnectorProfile.fromJson(Map<String, dynamic> json) =>
      _$ConnectorProfileFromJson(json);
}

/// Defines the connector-specific configuration and credentials for the
/// connector profile.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ConnectorProfileConfig {
  /// The connector-specific credentials required by each connector.
  @_s.JsonKey(name: 'connectorProfileCredentials')
  final ConnectorProfileCredentials connectorProfileCredentials;

  /// The connector-specific properties of the profile configuration.
  @_s.JsonKey(name: 'connectorProfileProperties')
  final ConnectorProfileProperties connectorProfileProperties;

  ConnectorProfileConfig({
    @_s.required this.connectorProfileCredentials,
    @_s.required this.connectorProfileProperties,
  });
  Map<String, dynamic> toJson() => _$ConnectorProfileConfigToJson(this);
}

/// The connector-specific credentials required by a connector.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ConnectorProfileCredentials {
  /// The connector-specific credentials required when using Amplitude.
  @_s.JsonKey(name: 'Amplitude')
  final AmplitudeConnectorProfileCredentials amplitude;

  /// The connector-specific credentials required when using Datadog.
  @_s.JsonKey(name: 'Datadog')
  final DatadogConnectorProfileCredentials datadog;

  /// The connector-specific credentials required when using Dynatrace.
  @_s.JsonKey(name: 'Dynatrace')
  final DynatraceConnectorProfileCredentials dynatrace;

  /// The connector-specific credentials required when using Google Analytics.
  @_s.JsonKey(name: 'GoogleAnalytics')
  final GoogleAnalyticsConnectorProfileCredentials googleAnalytics;

  /// The connector-specific credentials required when using Infor Nexus.
  @_s.JsonKey(name: 'InforNexus')
  final InforNexusConnectorProfileCredentials inforNexus;

  /// The connector-specific credentials required when using Marketo.
  @_s.JsonKey(name: 'Marketo')
  final MarketoConnectorProfileCredentials marketo;

  /// The connector-specific credentials required when using Amazon Redshift.
  @_s.JsonKey(name: 'Redshift')
  final RedshiftConnectorProfileCredentials redshift;

  /// The connector-specific credentials required when using Salesforce.
  @_s.JsonKey(name: 'Salesforce')
  final SalesforceConnectorProfileCredentials salesforce;

  /// The connector-specific credentials required when using ServiceNow.
  @_s.JsonKey(name: 'ServiceNow')
  final ServiceNowConnectorProfileCredentials serviceNow;

  /// The connector-specific credentials required when using Singular.
  @_s.JsonKey(name: 'Singular')
  final SingularConnectorProfileCredentials singular;

  /// The connector-specific credentials required when using Slack.
  @_s.JsonKey(name: 'Slack')
  final SlackConnectorProfileCredentials slack;

  /// The connector-specific credentials required when using Snowflake.
  @_s.JsonKey(name: 'Snowflake')
  final SnowflakeConnectorProfileCredentials snowflake;

  /// The connector-specific credentials required when using Trend Micro.
  @_s.JsonKey(name: 'Trendmicro')
  final TrendmicroConnectorProfileCredentials trendmicro;

  /// The connector-specific credentials required when using Veeva.
  @_s.JsonKey(name: 'Veeva')
  final VeevaConnectorProfileCredentials veeva;

  /// The connector-specific credentials required when using Zendesk.
  @_s.JsonKey(name: 'Zendesk')
  final ZendeskConnectorProfileCredentials zendesk;

  ConnectorProfileCredentials({
    this.amplitude,
    this.datadog,
    this.dynatrace,
    this.googleAnalytics,
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
  Map<String, dynamic> toJson() => _$ConnectorProfileCredentialsToJson(this);
}

/// The connector-specific profile properties required by each connector.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ConnectorProfileProperties {
  /// The connector-specific properties required by Amplitude.
  @_s.JsonKey(name: 'Amplitude')
  final AmplitudeConnectorProfileProperties amplitude;

  /// The connector-specific properties required by Datadog.
  @_s.JsonKey(name: 'Datadog')
  final DatadogConnectorProfileProperties datadog;

  /// The connector-specific properties required by Dynatrace.
  @_s.JsonKey(name: 'Dynatrace')
  final DynatraceConnectorProfileProperties dynatrace;

  /// The connector-specific properties required Google Analytics.
  @_s.JsonKey(name: 'GoogleAnalytics')
  final GoogleAnalyticsConnectorProfileProperties googleAnalytics;

  /// The connector-specific properties required by Infor Nexus.
  @_s.JsonKey(name: 'InforNexus')
  final InforNexusConnectorProfileProperties inforNexus;

  /// The connector-specific properties required by Marketo.
  @_s.JsonKey(name: 'Marketo')
  final MarketoConnectorProfileProperties marketo;

  /// The connector-specific properties required by Amazon Redshift.
  @_s.JsonKey(name: 'Redshift')
  final RedshiftConnectorProfileProperties redshift;

  /// The connector-specific properties required by Salesforce.
  @_s.JsonKey(name: 'Salesforce')
  final SalesforceConnectorProfileProperties salesforce;

  /// The connector-specific properties required by serviceNow.
  @_s.JsonKey(name: 'ServiceNow')
  final ServiceNowConnectorProfileProperties serviceNow;

  /// The connector-specific properties required by Singular.
  @_s.JsonKey(name: 'Singular')
  final SingularConnectorProfileProperties singular;

  /// The connector-specific properties required by Slack.
  @_s.JsonKey(name: 'Slack')
  final SlackConnectorProfileProperties slack;

  /// The connector-specific properties required by Snowflake.
  @_s.JsonKey(name: 'Snowflake')
  final SnowflakeConnectorProfileProperties snowflake;

  /// The connector-specific properties required by Trend Micro.
  @_s.JsonKey(name: 'Trendmicro')
  final TrendmicroConnectorProfileProperties trendmicro;

  /// The connector-specific properties required by Veeva.
  @_s.JsonKey(name: 'Veeva')
  final VeevaConnectorProfileProperties veeva;

  /// The connector-specific properties required by Zendesk.
  @_s.JsonKey(name: 'Zendesk')
  final ZendeskConnectorProfileProperties zendesk;

  ConnectorProfileProperties({
    this.amplitude,
    this.datadog,
    this.dynatrace,
    this.googleAnalytics,
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
  factory ConnectorProfileProperties.fromJson(Map<String, dynamic> json) =>
      _$ConnectorProfilePropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$ConnectorProfilePropertiesToJson(this);
}

enum ConnectorType {
  @_s.JsonValue('Salesforce')
  salesforce,
  @_s.JsonValue('Singular')
  singular,
  @_s.JsonValue('Slack')
  slack,
  @_s.JsonValue('Redshift')
  redshift,
  @_s.JsonValue('S3')
  s3,
  @_s.JsonValue('Marketo')
  marketo,
  @_s.JsonValue('Googleanalytics')
  googleanalytics,
  @_s.JsonValue('Zendesk')
  zendesk,
  @_s.JsonValue('Servicenow')
  servicenow,
  @_s.JsonValue('Datadog')
  datadog,
  @_s.JsonValue('Trendmicro')
  trendmicro,
  @_s.JsonValue('Snowflake')
  snowflake,
  @_s.JsonValue('Dynatrace')
  dynatrace,
  @_s.JsonValue('Infornexus')
  infornexus,
  @_s.JsonValue('Amplitude')
  amplitude,
  @_s.JsonValue('Veeva')
  veeva,
  @_s.JsonValue('EventBridge')
  eventBridge,
  @_s.JsonValue('Upsolver')
  upsolver,
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
      case ConnectorType.upsolver:
        return 'Upsolver';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateConnectorProfileResponse {
  /// The Amazon Resource Name (ARN) of the connector profile.
  @_s.JsonKey(name: 'connectorProfileArn')
  final String connectorProfileArn;

  CreateConnectorProfileResponse({
    this.connectorProfileArn,
  });
  factory CreateConnectorProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateConnectorProfileResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateFlowResponse {
  /// The flow's Amazon Resource Name (ARN).
  @_s.JsonKey(name: 'flowArn')
  final String flowArn;

  /// Indicates the current status of the flow.
  @_s.JsonKey(name: 'flowStatus')
  final FlowStatus flowStatus;

  CreateFlowResponse({
    this.flowArn,
    this.flowStatus,
  });
  factory CreateFlowResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateFlowResponseFromJson(json);
}

enum DataPullMode {
  @_s.JsonValue('Incremental')
  incremental,
  @_s.JsonValue('Complete')
  complete,
}

enum DatadogConnectorOperator {
  @_s.JsonValue('PROJECTION')
  projection,
  @_s.JsonValue('BETWEEN')
  between,
  @_s.JsonValue('EQUAL_TO')
  equalTo,
  @_s.JsonValue('ADDITION')
  addition,
  @_s.JsonValue('MULTIPLICATION')
  multiplication,
  @_s.JsonValue('DIVISION')
  division,
  @_s.JsonValue('SUBTRACTION')
  subtraction,
  @_s.JsonValue('MASK_ALL')
  maskAll,
  @_s.JsonValue('MASK_FIRST_N')
  maskFirstN,
  @_s.JsonValue('MASK_LAST_N')
  maskLastN,
  @_s.JsonValue('VALIDATE_NON_NULL')
  validateNonNull,
  @_s.JsonValue('VALIDATE_NON_ZERO')
  validateNonZero,
  @_s.JsonValue('VALIDATE_NON_NEGATIVE')
  validateNonNegative,
  @_s.JsonValue('VALIDATE_NUMERIC')
  validateNumeric,
  @_s.JsonValue('NO_OP')
  noOp,
}

/// The connector-specific credentials required by Datadog.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DatadogConnectorProfileCredentials {
  /// A unique alphanumeric identifier used to authenticate a user, developer, or
  /// calling program to your API.
  @_s.JsonKey(name: 'apiKey')
  final String apiKey;

  /// Application keys, in conjunction with your API key, give you full access to
  /// Datadog’s programmatic API. Application keys are associated with the user
  /// account that created them. The application key is used to log all requests
  /// made to the API.
  @_s.JsonKey(name: 'applicationKey')
  final String applicationKey;

  DatadogConnectorProfileCredentials({
    @_s.required this.apiKey,
    @_s.required this.applicationKey,
  });
  Map<String, dynamic> toJson() =>
      _$DatadogConnectorProfileCredentialsToJson(this);
}

/// The connector-specific profile properties required by Datadog.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DatadogConnectorProfileProperties {
  /// The location of the Datadog resource.
  @_s.JsonKey(name: 'instanceUrl')
  final String instanceUrl;

  DatadogConnectorProfileProperties({
    @_s.required this.instanceUrl,
  });
  factory DatadogConnectorProfileProperties.fromJson(
          Map<String, dynamic> json) =>
      _$DatadogConnectorProfilePropertiesFromJson(json);

  Map<String, dynamic> toJson() =>
      _$DatadogConnectorProfilePropertiesToJson(this);
}

/// The connector metadata specific to Datadog.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DatadogMetadata {
  DatadogMetadata();
  factory DatadogMetadata.fromJson(Map<String, dynamic> json) =>
      _$DatadogMetadataFromJson(json);
}

/// The properties that are applied when Datadog is being used as a source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DatadogSourceProperties {
  /// The object specified in the Datadog flow source.
  @_s.JsonKey(name: 'object')
  final String object;

  DatadogSourceProperties({
    @_s.required this.object,
  });
  factory DatadogSourceProperties.fromJson(Map<String, dynamic> json) =>
      _$DatadogSourcePropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$DatadogSourcePropertiesToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteConnectorProfileResponse {
  DeleteConnectorProfileResponse();
  factory DeleteConnectorProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteConnectorProfileResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteFlowResponse {
  DeleteFlowResponse();
  factory DeleteFlowResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteFlowResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeConnectorEntityResponse {
  /// Describes the fields for that connector entity. For example, for an
  /// <i>account</i> entity, the fields would be <i>account name</i>, <i>account
  /// ID</i>, and so on.
  @_s.JsonKey(name: 'connectorEntityFields')
  final List<ConnectorEntityField> connectorEntityFields;

  DescribeConnectorEntityResponse({
    @_s.required this.connectorEntityFields,
  });
  factory DescribeConnectorEntityResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeConnectorEntityResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeConnectorProfilesResponse {
  /// Returns information about the connector profiles associated with the flow.
  @_s.JsonKey(name: 'connectorProfileDetails')
  final List<ConnectorProfile> connectorProfileDetails;

  /// The pagination token for the next page of data. If
  /// <code>nextToken=null</code>, this means that all records have been fetched.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  DescribeConnectorProfilesResponse({
    this.connectorProfileDetails,
    this.nextToken,
  });
  factory DescribeConnectorProfilesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeConnectorProfilesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeConnectorsResponse {
  /// The configuration that is applied to the connectors used in the flow.
  @_s.JsonKey(name: 'connectorConfigurations')
  final Map<ConnectorType, ConnectorConfiguration> connectorConfigurations;

  /// The pagination token for the next page of data.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  DescribeConnectorsResponse({
    this.connectorConfigurations,
    this.nextToken,
  });
  factory DescribeConnectorsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeConnectorsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeFlowExecutionRecordsResponse {
  /// Returns a list of all instances when this flow was run.
  @_s.JsonKey(name: 'flowExecutions')
  final List<ExecutionRecord> flowExecutions;

  /// The pagination token for the next page of data.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  DescribeFlowExecutionRecordsResponse({
    this.flowExecutions,
    this.nextToken,
  });
  factory DescribeFlowExecutionRecordsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeFlowExecutionRecordsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeFlowResponse {
  /// Specifies when the flow was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The ARN of the user who created the flow.
  @_s.JsonKey(name: 'createdBy')
  final String createdBy;

  /// A description of the flow.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The configuration that controls how Amazon AppFlow transfers data to the
  /// destination connector.
  @_s.JsonKey(name: 'destinationFlowConfigList')
  final List<DestinationFlowConfig> destinationFlowConfigList;

  /// The flow's Amazon Resource Name (ARN).
  @_s.JsonKey(name: 'flowArn')
  final String flowArn;

  /// The specified name of the flow. Spaces are not allowed. Use underscores (_)
  /// or hyphens (-) only.
  @_s.JsonKey(name: 'flowName')
  final String flowName;

  /// Indicates the current status of the flow.
  @_s.JsonKey(name: 'flowStatus')
  final FlowStatus flowStatus;

  /// Contains an error message if the flow status is in a suspended or error
  /// state. This applies only to scheduled or event-triggered flows.
  @_s.JsonKey(name: 'flowStatusMessage')
  final String flowStatusMessage;

  /// The ARN (Amazon Resource Name) of the Key Management Service (KMS) key you
  /// provide for encryption. This is required if you do not want to use the
  /// Amazon AppFlow-managed KMS key. If you don't provide anything here, Amazon
  /// AppFlow uses the Amazon AppFlow-managed KMS key.
  @_s.JsonKey(name: 'kmsArn')
  final String kmsArn;

  /// Describes the details of the most recent flow run.
  @_s.JsonKey(name: 'lastRunExecutionDetails')
  final ExecutionDetails lastRunExecutionDetails;

  /// Specifies when the flow was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// Specifies the user name of the account that performed the most recent
  /// update.
  @_s.JsonKey(name: 'lastUpdatedBy')
  final String lastUpdatedBy;

  /// The configuration that controls how Amazon AppFlow retrieves data from the
  /// source connector.
  @_s.JsonKey(name: 'sourceFlowConfig')
  final SourceFlowConfig sourceFlowConfig;

  /// The tags used to organize, track, or control access for your flow.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// A list of tasks that Amazon AppFlow performs while transferring the data in
  /// the flow run.
  @_s.JsonKey(name: 'tasks')
  final List<Task> tasks;

  /// The trigger settings that determine how and when the flow runs.
  @_s.JsonKey(name: 'triggerConfig')
  final TriggerConfig triggerConfig;

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
  factory DescribeFlowResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeFlowResponseFromJson(json);
}

/// This stores the information that is required to query a particular
/// connector.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DestinationConnectorProperties {
  /// The properties required to query Amazon EventBridge.
  @_s.JsonKey(name: 'EventBridge')
  final EventBridgeDestinationProperties eventBridge;

  /// The properties required to query Amazon Redshift.
  @_s.JsonKey(name: 'Redshift')
  final RedshiftDestinationProperties redshift;

  /// The properties required to query Amazon S3.
  @_s.JsonKey(name: 'S3')
  final S3DestinationProperties s3;

  /// The properties required to query Salesforce.
  @_s.JsonKey(name: 'Salesforce')
  final SalesforceDestinationProperties salesforce;

  /// The properties required to query Snowflake.
  @_s.JsonKey(name: 'Snowflake')
  final SnowflakeDestinationProperties snowflake;

  /// The properties required to query Upsolver.
  @_s.JsonKey(name: 'Upsolver')
  final UpsolverDestinationProperties upsolver;

  DestinationConnectorProperties({
    this.eventBridge,
    this.redshift,
    this.s3,
    this.salesforce,
    this.snowflake,
    this.upsolver,
  });
  factory DestinationConnectorProperties.fromJson(Map<String, dynamic> json) =>
      _$DestinationConnectorPropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$DestinationConnectorPropertiesToJson(this);
}

/// The properties that can be applied to a field when connector is being used
/// as a destination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DestinationFieldProperties {
  /// Specifies if the destination field can be created by the current user.
  @_s.JsonKey(name: 'isCreatable')
  final bool isCreatable;

  /// Specifies if the destination field can have a null value.
  @_s.JsonKey(name: 'isNullable')
  final bool isNullable;

  /// Specifies whether the field can be updated during an <code>UPDATE</code> or
  /// <code>UPSERT</code> write operation.
  @_s.JsonKey(name: 'isUpdatable')
  final bool isUpdatable;

  /// Specifies if the flow run can either insert new rows in the destination
  /// field if they do not already exist, or update them if they do.
  @_s.JsonKey(name: 'isUpsertable')
  final bool isUpsertable;

  /// A list of supported write operations. For each write operation listed, this
  /// field can be used in <code>idFieldNames</code> when that write operation is
  /// present as a destination option.
  @_s.JsonKey(name: 'supportedWriteOperations')
  final List<WriteOperationType> supportedWriteOperations;

  DestinationFieldProperties({
    this.isCreatable,
    this.isNullable,
    this.isUpdatable,
    this.isUpsertable,
    this.supportedWriteOperations,
  });
  factory DestinationFieldProperties.fromJson(Map<String, dynamic> json) =>
      _$DestinationFieldPropertiesFromJson(json);
}

/// Contains information about the configuration of destination connectors
/// present in the flow.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DestinationFlowConfig {
  /// The type of connector, such as Salesforce, Amplitude, and so on.
  @_s.JsonKey(name: 'connectorType')
  final ConnectorType connectorType;

  /// This stores the information that is required to query a particular
  /// connector.
  @_s.JsonKey(name: 'destinationConnectorProperties')
  final DestinationConnectorProperties destinationConnectorProperties;

  /// The name of the connector profile. This name must be unique for each
  /// connector profile in the AWS account.
  @_s.JsonKey(name: 'connectorProfileName')
  final String connectorProfileName;

  DestinationFlowConfig({
    @_s.required this.connectorType,
    @_s.required this.destinationConnectorProperties,
    this.connectorProfileName,
  });
  factory DestinationFlowConfig.fromJson(Map<String, dynamic> json) =>
      _$DestinationFlowConfigFromJson(json);

  Map<String, dynamic> toJson() => _$DestinationFlowConfigToJson(this);
}

enum DynatraceConnectorOperator {
  @_s.JsonValue('PROJECTION')
  projection,
  @_s.JsonValue('BETWEEN')
  between,
  @_s.JsonValue('EQUAL_TO')
  equalTo,
  @_s.JsonValue('ADDITION')
  addition,
  @_s.JsonValue('MULTIPLICATION')
  multiplication,
  @_s.JsonValue('DIVISION')
  division,
  @_s.JsonValue('SUBTRACTION')
  subtraction,
  @_s.JsonValue('MASK_ALL')
  maskAll,
  @_s.JsonValue('MASK_FIRST_N')
  maskFirstN,
  @_s.JsonValue('MASK_LAST_N')
  maskLastN,
  @_s.JsonValue('VALIDATE_NON_NULL')
  validateNonNull,
  @_s.JsonValue('VALIDATE_NON_ZERO')
  validateNonZero,
  @_s.JsonValue('VALIDATE_NON_NEGATIVE')
  validateNonNegative,
  @_s.JsonValue('VALIDATE_NUMERIC')
  validateNumeric,
  @_s.JsonValue('NO_OP')
  noOp,
}

/// The connector-specific profile credentials required by Dynatrace.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DynatraceConnectorProfileCredentials {
  /// The API tokens used by Dynatrace API to authenticate various API calls.
  @_s.JsonKey(name: 'apiToken')
  final String apiToken;

  DynatraceConnectorProfileCredentials({
    @_s.required this.apiToken,
  });
  Map<String, dynamic> toJson() =>
      _$DynatraceConnectorProfileCredentialsToJson(this);
}

/// The connector-specific profile properties required by Dynatrace.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DynatraceConnectorProfileProperties {
  /// The location of the Dynatrace resource.
  @_s.JsonKey(name: 'instanceUrl')
  final String instanceUrl;

  DynatraceConnectorProfileProperties({
    @_s.required this.instanceUrl,
  });
  factory DynatraceConnectorProfileProperties.fromJson(
          Map<String, dynamic> json) =>
      _$DynatraceConnectorProfilePropertiesFromJson(json);

  Map<String, dynamic> toJson() =>
      _$DynatraceConnectorProfilePropertiesToJson(this);
}

/// The connector metadata specific to Dynatrace.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DynatraceMetadata {
  DynatraceMetadata();
  factory DynatraceMetadata.fromJson(Map<String, dynamic> json) =>
      _$DynatraceMetadataFromJson(json);
}

/// The properties that are applied when Dynatrace is being used as a source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DynatraceSourceProperties {
  /// The object specified in the Dynatrace flow source.
  @_s.JsonKey(name: 'object')
  final String object;

  DynatraceSourceProperties({
    @_s.required this.object,
  });
  factory DynatraceSourceProperties.fromJson(Map<String, dynamic> json) =>
      _$DynatraceSourcePropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$DynatraceSourcePropertiesToJson(this);
}

/// The settings that determine how Amazon AppFlow handles an error when placing
/// data in the destination. For example, this setting would determine if the
/// flow should fail after one insertion error, or continue and attempt to
/// insert every record regardless of the initial failure.
/// <code>ErrorHandlingConfig</code> is a part of the destination connector
/// details.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ErrorHandlingConfig {
  /// Specifies the name of the Amazon S3 bucket.
  @_s.JsonKey(name: 'bucketName')
  final String bucketName;

  /// Specifies the Amazon S3 bucket prefix.
  @_s.JsonKey(name: 'bucketPrefix')
  final String bucketPrefix;

  /// Specifies if the flow should fail after the first instance of a failure when
  /// attempting to place data in the destination.
  @_s.JsonKey(name: 'failOnFirstDestinationError')
  final bool failOnFirstDestinationError;

  ErrorHandlingConfig({
    this.bucketName,
    this.bucketPrefix,
    this.failOnFirstDestinationError,
  });
  factory ErrorHandlingConfig.fromJson(Map<String, dynamic> json) =>
      _$ErrorHandlingConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorHandlingConfigToJson(this);
}

/// Provides details in the event of a failed flow, including the failure count
/// and the related error messages.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ErrorInfo {
  /// Specifies the error message that appears if a flow fails.
  @_s.JsonKey(name: 'executionMessage')
  final String executionMessage;

  /// Specifies the failure count for the attempted flow.
  @_s.JsonKey(name: 'putFailuresCount')
  final int putFailuresCount;

  ErrorInfo({
    this.executionMessage,
    this.putFailuresCount,
  });
  factory ErrorInfo.fromJson(Map<String, dynamic> json) =>
      _$ErrorInfoFromJson(json);
}

/// The properties that are applied when Amazon EventBridge is being used as a
/// destination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EventBridgeDestinationProperties {
  /// The object specified in the Amazon EventBridge flow destination.
  @_s.JsonKey(name: 'object')
  final String object;
  @_s.JsonKey(name: 'errorHandlingConfig')
  final ErrorHandlingConfig errorHandlingConfig;

  EventBridgeDestinationProperties({
    @_s.required this.object,
    this.errorHandlingConfig,
  });
  factory EventBridgeDestinationProperties.fromJson(
          Map<String, dynamic> json) =>
      _$EventBridgeDestinationPropertiesFromJson(json);

  Map<String, dynamic> toJson() =>
      _$EventBridgeDestinationPropertiesToJson(this);
}

/// The connector metadata specific to Amazon EventBridge.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EventBridgeMetadata {
  EventBridgeMetadata();
  factory EventBridgeMetadata.fromJson(Map<String, dynamic> json) =>
      _$EventBridgeMetadataFromJson(json);
}

/// Describes the details of the flow run, including the timestamp, status, and
/// message.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ExecutionDetails {
  /// Describes the details of the most recent flow run.
  @_s.JsonKey(name: 'mostRecentExecutionMessage')
  final String mostRecentExecutionMessage;

  /// Specifies the status of the most recent flow run.
  @_s.JsonKey(name: 'mostRecentExecutionStatus')
  final ExecutionStatus mostRecentExecutionStatus;

  /// Specifies the time of the most recent flow run.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'mostRecentExecutionTime')
  final DateTime mostRecentExecutionTime;

  ExecutionDetails({
    this.mostRecentExecutionMessage,
    this.mostRecentExecutionStatus,
    this.mostRecentExecutionTime,
  });
  factory ExecutionDetails.fromJson(Map<String, dynamic> json) =>
      _$ExecutionDetailsFromJson(json);
}

/// Specifies information about the past flow run instances for a given flow.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ExecutionRecord {
  /// Specifies the identifier of the given flow run.
  @_s.JsonKey(name: 'executionId')
  final String executionId;

  /// Describes the result of the given flow run.
  @_s.JsonKey(name: 'executionResult')
  final ExecutionResult executionResult;

  /// Specifies the flow run status and whether it is in progress, has completed
  /// successfully, or has failed.
  @_s.JsonKey(name: 'executionStatus')
  final ExecutionStatus executionStatus;

  /// Specifies the time of the most recent update.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// Specifies the start time of the flow run.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'startedAt')
  final DateTime startedAt;

  ExecutionRecord({
    this.executionId,
    this.executionResult,
    this.executionStatus,
    this.lastUpdatedAt,
    this.startedAt,
  });
  factory ExecutionRecord.fromJson(Map<String, dynamic> json) =>
      _$ExecutionRecordFromJson(json);
}

/// Specifies the end result of the flow run.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ExecutionResult {
  /// The total number of bytes processed by the flow run.
  @_s.JsonKey(name: 'bytesProcessed')
  final int bytesProcessed;

  /// The total number of bytes written as a result of the flow run.
  @_s.JsonKey(name: 'bytesWritten')
  final int bytesWritten;

  /// Provides any error message information related to the flow run.
  @_s.JsonKey(name: 'errorInfo')
  final ErrorInfo errorInfo;

  /// The number of records processed in the flow run.
  @_s.JsonKey(name: 'recordsProcessed')
  final int recordsProcessed;

  ExecutionResult({
    this.bytesProcessed,
    this.bytesWritten,
    this.errorInfo,
    this.recordsProcessed,
  });
  factory ExecutionResult.fromJson(Map<String, dynamic> json) =>
      _$ExecutionResultFromJson(json);
}

enum ExecutionStatus {
  @_s.JsonValue('InProgress')
  inProgress,
  @_s.JsonValue('Successful')
  successful,
  @_s.JsonValue('Error')
  error,
}

/// Contains details regarding the supported field type and the operators that
/// can be applied for filtering.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FieldTypeDetails {
  /// The type of field, such as string, integer, date, and so on.
  @_s.JsonKey(name: 'fieldType')
  final String fieldType;

  /// The list of operators supported by a field.
  @_s.JsonKey(name: 'filterOperators')
  final List<Operator> filterOperators;

  /// The list of values that a field can contain. For example, a Boolean
  /// <code>fieldType</code> can have two values: "true" and "false".
  @_s.JsonKey(name: 'supportedValues')
  final List<String> supportedValues;

  FieldTypeDetails({
    @_s.required this.fieldType,
    @_s.required this.filterOperators,
    this.supportedValues,
  });
  factory FieldTypeDetails.fromJson(Map<String, dynamic> json) =>
      _$FieldTypeDetailsFromJson(json);
}

enum FileType {
  @_s.JsonValue('CSV')
  csv,
  @_s.JsonValue('JSON')
  json,
  @_s.JsonValue('PARQUET')
  parquet,
}

/// The properties of the flow, such as its source, destination, trigger type,
/// and so on.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FlowDefinition {
  /// Specifies when the flow was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The ARN of the user who created the flow.
  @_s.JsonKey(name: 'createdBy')
  final String createdBy;

  /// A user-entered description of the flow.
  @_s.JsonKey(name: 'description')
  final String description;

  /// Specifies the destination connector type, such as Salesforce, Amazon S3,
  /// Amplitude, and so on.
  @_s.JsonKey(name: 'destinationConnectorType')
  final ConnectorType destinationConnectorType;

  /// The flow's Amazon Resource Name (ARN).
  @_s.JsonKey(name: 'flowArn')
  final String flowArn;

  /// The specified name of the flow. Spaces are not allowed. Use underscores (_)
  /// or hyphens (-) only.
  @_s.JsonKey(name: 'flowName')
  final String flowName;

  /// Indicates the current status of the flow.
  @_s.JsonKey(name: 'flowStatus')
  final FlowStatus flowStatus;

  /// Describes the details of the most recent flow run.
  @_s.JsonKey(name: 'lastRunExecutionDetails')
  final ExecutionDetails lastRunExecutionDetails;

  /// Specifies when the flow was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// Specifies the account user name that most recently updated the flow.
  @_s.JsonKey(name: 'lastUpdatedBy')
  final String lastUpdatedBy;

  /// Specifies the source connector type, such as Salesforce, Amazon S3,
  /// Amplitude, and so on.
  @_s.JsonKey(name: 'sourceConnectorType')
  final ConnectorType sourceConnectorType;

  /// The tags used to organize, track, or control access for your flow.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// Specifies the type of flow trigger. This can be <code>OnDemand</code>,
  /// <code>Scheduled</code>, or <code>Event</code>.
  @_s.JsonKey(name: 'triggerType')
  final TriggerType triggerType;

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
  factory FlowDefinition.fromJson(Map<String, dynamic> json) =>
      _$FlowDefinitionFromJson(json);
}

enum FlowStatus {
  @_s.JsonValue('Active')
  active,
  @_s.JsonValue('Deprecated')
  deprecated,
  @_s.JsonValue('Deleted')
  deleted,
  @_s.JsonValue('Draft')
  draft,
  @_s.JsonValue('Errored')
  errored,
  @_s.JsonValue('Suspended')
  suspended,
}

enum GoogleAnalyticsConnectorOperator {
  @_s.JsonValue('PROJECTION')
  projection,
  @_s.JsonValue('BETWEEN')
  between,
}

/// The connector-specific profile credentials required by Google Analytics.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GoogleAnalyticsConnectorProfileCredentials {
  /// The identifier for the desired client.
  @_s.JsonKey(name: 'clientId')
  final String clientId;

  /// The client secret used by the OAuth client to authenticate to the
  /// authorization server.
  @_s.JsonKey(name: 'clientSecret')
  final String clientSecret;

  /// The credentials used to access protected Google Analytics resources.
  @_s.JsonKey(name: 'accessToken')
  final String accessToken;

  /// The OAuth requirement needed to request security tokens from the connector
  /// endpoint.
  @_s.JsonKey(name: 'oAuthRequest')
  final ConnectorOAuthRequest oAuthRequest;

  /// The credentials used to acquire new access tokens. This is required only for
  /// OAuth2 access tokens, and is not required for OAuth1 access tokens.
  @_s.JsonKey(name: 'refreshToken')
  final String refreshToken;

  GoogleAnalyticsConnectorProfileCredentials({
    @_s.required this.clientId,
    @_s.required this.clientSecret,
    this.accessToken,
    this.oAuthRequest,
    this.refreshToken,
  });
  Map<String, dynamic> toJson() =>
      _$GoogleAnalyticsConnectorProfileCredentialsToJson(this);
}

/// The connector-specific profile properties required by Google Analytics.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class GoogleAnalyticsConnectorProfileProperties {
  GoogleAnalyticsConnectorProfileProperties();
  factory GoogleAnalyticsConnectorProfileProperties.fromJson(
          Map<String, dynamic> json) =>
      _$GoogleAnalyticsConnectorProfilePropertiesFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GoogleAnalyticsConnectorProfilePropertiesToJson(this);
}

/// The connector metadata specific to Google Analytics.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GoogleAnalyticsMetadata {
  /// The desired authorization scope for the Google Analytics account.
  @_s.JsonKey(name: 'oAuthScopes')
  final List<String> oAuthScopes;

  GoogleAnalyticsMetadata({
    this.oAuthScopes,
  });
  factory GoogleAnalyticsMetadata.fromJson(Map<String, dynamic> json) =>
      _$GoogleAnalyticsMetadataFromJson(json);
}

/// The properties that are applied when Google Analytics is being used as a
/// source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class GoogleAnalyticsSourceProperties {
  /// The object specified in the Google Analytics flow source.
  @_s.JsonKey(name: 'object')
  final String object;

  GoogleAnalyticsSourceProperties({
    @_s.required this.object,
  });
  factory GoogleAnalyticsSourceProperties.fromJson(Map<String, dynamic> json) =>
      _$GoogleAnalyticsSourcePropertiesFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GoogleAnalyticsSourcePropertiesToJson(this);
}

/// Specifies the configuration used when importing incremental records from the
/// source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class IncrementalPullConfig {
  /// A field that specifies the date time or timestamp field as the criteria to
  /// use when importing incremental records from the source.
  @_s.JsonKey(name: 'datetimeTypeFieldName')
  final String datetimeTypeFieldName;

  IncrementalPullConfig({
    this.datetimeTypeFieldName,
  });
  factory IncrementalPullConfig.fromJson(Map<String, dynamic> json) =>
      _$IncrementalPullConfigFromJson(json);

  Map<String, dynamic> toJson() => _$IncrementalPullConfigToJson(this);
}

enum InforNexusConnectorOperator {
  @_s.JsonValue('PROJECTION')
  projection,
  @_s.JsonValue('BETWEEN')
  between,
  @_s.JsonValue('EQUAL_TO')
  equalTo,
  @_s.JsonValue('ADDITION')
  addition,
  @_s.JsonValue('MULTIPLICATION')
  multiplication,
  @_s.JsonValue('DIVISION')
  division,
  @_s.JsonValue('SUBTRACTION')
  subtraction,
  @_s.JsonValue('MASK_ALL')
  maskAll,
  @_s.JsonValue('MASK_FIRST_N')
  maskFirstN,
  @_s.JsonValue('MASK_LAST_N')
  maskLastN,
  @_s.JsonValue('VALIDATE_NON_NULL')
  validateNonNull,
  @_s.JsonValue('VALIDATE_NON_ZERO')
  validateNonZero,
  @_s.JsonValue('VALIDATE_NON_NEGATIVE')
  validateNonNegative,
  @_s.JsonValue('VALIDATE_NUMERIC')
  validateNumeric,
  @_s.JsonValue('NO_OP')
  noOp,
}

/// The connector-specific profile credentials required by Infor Nexus.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class InforNexusConnectorProfileCredentials {
  /// The Access Key portion of the credentials.
  @_s.JsonKey(name: 'accessKeyId')
  final String accessKeyId;

  /// The encryption keys used to encrypt data.
  @_s.JsonKey(name: 'datakey')
  final String datakey;

  /// The secret key used to sign requests.
  @_s.JsonKey(name: 'secretAccessKey')
  final String secretAccessKey;

  /// The identifier for the user.
  @_s.JsonKey(name: 'userId')
  final String userId;

  InforNexusConnectorProfileCredentials({
    @_s.required this.accessKeyId,
    @_s.required this.datakey,
    @_s.required this.secretAccessKey,
    @_s.required this.userId,
  });
  Map<String, dynamic> toJson() =>
      _$InforNexusConnectorProfileCredentialsToJson(this);
}

/// The connector-specific profile properties required by Infor Nexus.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class InforNexusConnectorProfileProperties {
  /// The location of the Infor Nexus resource.
  @_s.JsonKey(name: 'instanceUrl')
  final String instanceUrl;

  InforNexusConnectorProfileProperties({
    @_s.required this.instanceUrl,
  });
  factory InforNexusConnectorProfileProperties.fromJson(
          Map<String, dynamic> json) =>
      _$InforNexusConnectorProfilePropertiesFromJson(json);

  Map<String, dynamic> toJson() =>
      _$InforNexusConnectorProfilePropertiesToJson(this);
}

/// The connector metadata specific to Infor Nexus.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InforNexusMetadata {
  InforNexusMetadata();
  factory InforNexusMetadata.fromJson(Map<String, dynamic> json) =>
      _$InforNexusMetadataFromJson(json);
}

/// The properties that are applied when Infor Nexus is being used as a source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class InforNexusSourceProperties {
  /// The object specified in the Infor Nexus flow source.
  @_s.JsonKey(name: 'object')
  final String object;

  InforNexusSourceProperties({
    @_s.required this.object,
  });
  factory InforNexusSourceProperties.fromJson(Map<String, dynamic> json) =>
      _$InforNexusSourcePropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$InforNexusSourcePropertiesToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListConnectorEntitiesResponse {
  /// The response of <code>ListConnectorEntities</code> lists entities grouped by
  /// category. This map's key represents the group name, and its value contains
  /// the list of entities belonging to that group.
  @_s.JsonKey(name: 'connectorEntityMap')
  final Map<String, List<ConnectorEntity>> connectorEntityMap;

  ListConnectorEntitiesResponse({
    @_s.required this.connectorEntityMap,
  });
  factory ListConnectorEntitiesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListConnectorEntitiesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListFlowsResponse {
  /// The list of flows associated with your account.
  @_s.JsonKey(name: 'flows')
  final List<FlowDefinition> flows;

  /// The pagination token for next page of data.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListFlowsResponse({
    this.flows,
    this.nextToken,
  });
  factory ListFlowsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListFlowsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// The tags used to organize, track, or control access for your flow.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

enum MarketoConnectorOperator {
  @_s.JsonValue('PROJECTION')
  projection,
  @_s.JsonValue('LESS_THAN')
  lessThan,
  @_s.JsonValue('GREATER_THAN')
  greaterThan,
  @_s.JsonValue('BETWEEN')
  between,
  @_s.JsonValue('ADDITION')
  addition,
  @_s.JsonValue('MULTIPLICATION')
  multiplication,
  @_s.JsonValue('DIVISION')
  division,
  @_s.JsonValue('SUBTRACTION')
  subtraction,
  @_s.JsonValue('MASK_ALL')
  maskAll,
  @_s.JsonValue('MASK_FIRST_N')
  maskFirstN,
  @_s.JsonValue('MASK_LAST_N')
  maskLastN,
  @_s.JsonValue('VALIDATE_NON_NULL')
  validateNonNull,
  @_s.JsonValue('VALIDATE_NON_ZERO')
  validateNonZero,
  @_s.JsonValue('VALIDATE_NON_NEGATIVE')
  validateNonNegative,
  @_s.JsonValue('VALIDATE_NUMERIC')
  validateNumeric,
  @_s.JsonValue('NO_OP')
  noOp,
}

/// The connector-specific profile credentials required by Marketo.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class MarketoConnectorProfileCredentials {
  /// The identifier for the desired client.
  @_s.JsonKey(name: 'clientId')
  final String clientId;

  /// The client secret used by the OAuth client to authenticate to the
  /// authorization server.
  @_s.JsonKey(name: 'clientSecret')
  final String clientSecret;

  /// The credentials used to access protected Marketo resources.
  @_s.JsonKey(name: 'accessToken')
  final String accessToken;

  /// The OAuth requirement needed to request security tokens from the connector
  /// endpoint.
  @_s.JsonKey(name: 'oAuthRequest')
  final ConnectorOAuthRequest oAuthRequest;

  MarketoConnectorProfileCredentials({
    @_s.required this.clientId,
    @_s.required this.clientSecret,
    this.accessToken,
    this.oAuthRequest,
  });
  Map<String, dynamic> toJson() =>
      _$MarketoConnectorProfileCredentialsToJson(this);
}

/// The connector-specific profile properties required when using Marketo.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MarketoConnectorProfileProperties {
  /// The location of the Marketo resource.
  @_s.JsonKey(name: 'instanceUrl')
  final String instanceUrl;

  MarketoConnectorProfileProperties({
    @_s.required this.instanceUrl,
  });
  factory MarketoConnectorProfileProperties.fromJson(
          Map<String, dynamic> json) =>
      _$MarketoConnectorProfilePropertiesFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MarketoConnectorProfilePropertiesToJson(this);
}

/// The connector metadata specific to Marketo.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MarketoMetadata {
  MarketoMetadata();
  factory MarketoMetadata.fromJson(Map<String, dynamic> json) =>
      _$MarketoMetadataFromJson(json);
}

/// The properties that are applied when Marketo is being used as a source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MarketoSourceProperties {
  /// The object specified in the Marketo flow source.
  @_s.JsonKey(name: 'object')
  final String object;

  MarketoSourceProperties({
    @_s.required this.object,
  });
  factory MarketoSourceProperties.fromJson(Map<String, dynamic> json) =>
      _$MarketoSourcePropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$MarketoSourcePropertiesToJson(this);
}

enum Operator {
  @_s.JsonValue('PROJECTION')
  projection,
  @_s.JsonValue('LESS_THAN')
  lessThan,
  @_s.JsonValue('GREATER_THAN')
  greaterThan,
  @_s.JsonValue('CONTAINS')
  contains,
  @_s.JsonValue('BETWEEN')
  between,
  @_s.JsonValue('LESS_THAN_OR_EQUAL_TO')
  lessThanOrEqualTo,
  @_s.JsonValue('GREATER_THAN_OR_EQUAL_TO')
  greaterThanOrEqualTo,
  @_s.JsonValue('EQUAL_TO')
  equalTo,
  @_s.JsonValue('NOT_EQUAL_TO')
  notEqualTo,
  @_s.JsonValue('ADDITION')
  addition,
  @_s.JsonValue('MULTIPLICATION')
  multiplication,
  @_s.JsonValue('DIVISION')
  division,
  @_s.JsonValue('SUBTRACTION')
  subtraction,
  @_s.JsonValue('MASK_ALL')
  maskAll,
  @_s.JsonValue('MASK_FIRST_N')
  maskFirstN,
  @_s.JsonValue('MASK_LAST_N')
  maskLastN,
  @_s.JsonValue('VALIDATE_NON_NULL')
  validateNonNull,
  @_s.JsonValue('VALIDATE_NON_ZERO')
  validateNonZero,
  @_s.JsonValue('VALIDATE_NON_NEGATIVE')
  validateNonNegative,
  @_s.JsonValue('VALIDATE_NUMERIC')
  validateNumeric,
  @_s.JsonValue('NO_OP')
  noOp,
}

enum OperatorPropertiesKeys {
  @_s.JsonValue('VALUE')
  value,
  @_s.JsonValue('VALUES')
  $values,
  @_s.JsonValue('DATA_TYPE')
  dataType,
  @_s.JsonValue('UPPER_BOUND')
  upperBound,
  @_s.JsonValue('LOWER_BOUND')
  lowerBound,
  @_s.JsonValue('SOURCE_DATA_TYPE')
  sourceDataType,
  @_s.JsonValue('DESTINATION_DATA_TYPE')
  destinationDataType,
  @_s.JsonValue('VALIDATION_ACTION')
  validationAction,
  @_s.JsonValue('MASK_VALUE')
  maskValue,
  @_s.JsonValue('MASK_LENGTH')
  maskLength,
  @_s.JsonValue('TRUNCATE_LENGTH')
  truncateLength,
  @_s.JsonValue('MATH_OPERATION_FIELDS_ORDER')
  mathOperationFieldsOrder,
  @_s.JsonValue('CONCAT_FORMAT')
  concatFormat,
  @_s.JsonValue('SUBFIELD_CATEGORY_MAP')
  subfieldCategoryMap,
}

/// Determines the prefix that Amazon AppFlow applies to the destination folder
/// name. You can name your destination folders according to the flow frequency
/// and date.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PrefixConfig {
  /// Determines the format of the prefix, and whether it applies to the file
  /// name, file path, or both.
  @_s.JsonKey(name: 'prefixFormat')
  final PrefixFormat prefixFormat;

  /// Determines the level of granularity that's included in the prefix.
  @_s.JsonKey(name: 'prefixType')
  final PrefixType prefixType;

  PrefixConfig({
    this.prefixFormat,
    this.prefixType,
  });
  factory PrefixConfig.fromJson(Map<String, dynamic> json) =>
      _$PrefixConfigFromJson(json);

  Map<String, dynamic> toJson() => _$PrefixConfigToJson(this);
}

enum PrefixFormat {
  @_s.JsonValue('YEAR')
  year,
  @_s.JsonValue('MONTH')
  month,
  @_s.JsonValue('DAY')
  day,
  @_s.JsonValue('HOUR')
  hour,
  @_s.JsonValue('MINUTE')
  minute,
}

enum PrefixType {
  @_s.JsonValue('FILENAME')
  filename,
  @_s.JsonValue('PATH')
  path,
  @_s.JsonValue('PATH_AND_FILENAME')
  pathAndFilename,
}

/// The connector-specific profile credentials required when using Amazon
/// Redshift.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class RedshiftConnectorProfileCredentials {
  /// The password that corresponds to the user name.
  @_s.JsonKey(name: 'password')
  final String password;

  /// The name of the user.
  @_s.JsonKey(name: 'username')
  final String username;

  RedshiftConnectorProfileCredentials({
    @_s.required this.password,
    @_s.required this.username,
  });
  Map<String, dynamic> toJson() =>
      _$RedshiftConnectorProfileCredentialsToJson(this);
}

/// The connector-specific profile properties when using Amazon Redshift.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RedshiftConnectorProfileProperties {
  /// A name for the associated Amazon S3 bucket.
  @_s.JsonKey(name: 'bucketName')
  final String bucketName;

  /// The JDBC URL of the Amazon Redshift cluster.
  @_s.JsonKey(name: 'databaseUrl')
  final String databaseUrl;

  /// The Amazon Resource Name (ARN) of the IAM role.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  /// The object key for the destination bucket in which Amazon AppFlow places the
  /// files.
  @_s.JsonKey(name: 'bucketPrefix')
  final String bucketPrefix;

  RedshiftConnectorProfileProperties({
    @_s.required this.bucketName,
    @_s.required this.databaseUrl,
    @_s.required this.roleArn,
    this.bucketPrefix,
  });
  factory RedshiftConnectorProfileProperties.fromJson(
          Map<String, dynamic> json) =>
      _$RedshiftConnectorProfilePropertiesFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RedshiftConnectorProfilePropertiesToJson(this);
}

/// The properties that are applied when Amazon Redshift is being used as a
/// destination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RedshiftDestinationProperties {
  /// The intermediate bucket that Amazon AppFlow uses when moving data into
  /// Amazon Redshift.
  @_s.JsonKey(name: 'intermediateBucketName')
  final String intermediateBucketName;

  /// The object specified in the Amazon Redshift flow destination.
  @_s.JsonKey(name: 'object')
  final String object;

  /// The object key for the bucket in which Amazon AppFlow places the destination
  /// files.
  @_s.JsonKey(name: 'bucketPrefix')
  final String bucketPrefix;

  /// The settings that determine how Amazon AppFlow handles an error when placing
  /// data in the Amazon Redshift destination. For example, this setting would
  /// determine if the flow should fail after one insertion error, or continue and
  /// attempt to insert every record regardless of the initial failure.
  /// <code>ErrorHandlingConfig</code> is a part of the destination connector
  /// details.
  @_s.JsonKey(name: 'errorHandlingConfig')
  final ErrorHandlingConfig errorHandlingConfig;

  RedshiftDestinationProperties({
    @_s.required this.intermediateBucketName,
    @_s.required this.object,
    this.bucketPrefix,
    this.errorHandlingConfig,
  });
  factory RedshiftDestinationProperties.fromJson(Map<String, dynamic> json) =>
      _$RedshiftDestinationPropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$RedshiftDestinationPropertiesToJson(this);
}

/// The connector metadata specific to Amazon Redshift.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RedshiftMetadata {
  RedshiftMetadata();
  factory RedshiftMetadata.fromJson(Map<String, dynamic> json) =>
      _$RedshiftMetadataFromJson(json);
}

enum S3ConnectorOperator {
  @_s.JsonValue('PROJECTION')
  projection,
  @_s.JsonValue('LESS_THAN')
  lessThan,
  @_s.JsonValue('GREATER_THAN')
  greaterThan,
  @_s.JsonValue('BETWEEN')
  between,
  @_s.JsonValue('LESS_THAN_OR_EQUAL_TO')
  lessThanOrEqualTo,
  @_s.JsonValue('GREATER_THAN_OR_EQUAL_TO')
  greaterThanOrEqualTo,
  @_s.JsonValue('EQUAL_TO')
  equalTo,
  @_s.JsonValue('NOT_EQUAL_TO')
  notEqualTo,
  @_s.JsonValue('ADDITION')
  addition,
  @_s.JsonValue('MULTIPLICATION')
  multiplication,
  @_s.JsonValue('DIVISION')
  division,
  @_s.JsonValue('SUBTRACTION')
  subtraction,
  @_s.JsonValue('MASK_ALL')
  maskAll,
  @_s.JsonValue('MASK_FIRST_N')
  maskFirstN,
  @_s.JsonValue('MASK_LAST_N')
  maskLastN,
  @_s.JsonValue('VALIDATE_NON_NULL')
  validateNonNull,
  @_s.JsonValue('VALIDATE_NON_ZERO')
  validateNonZero,
  @_s.JsonValue('VALIDATE_NON_NEGATIVE')
  validateNonNegative,
  @_s.JsonValue('VALIDATE_NUMERIC')
  validateNumeric,
  @_s.JsonValue('NO_OP')
  noOp,
}

/// The properties that are applied when Amazon S3 is used as a destination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class S3DestinationProperties {
  /// The Amazon S3 bucket name in which Amazon AppFlow places the transferred
  /// data.
  @_s.JsonKey(name: 'bucketName')
  final String bucketName;

  /// The object key for the destination bucket in which Amazon AppFlow places the
  /// files.
  @_s.JsonKey(name: 'bucketPrefix')
  final String bucketPrefix;
  @_s.JsonKey(name: 's3OutputFormatConfig')
  final S3OutputFormatConfig s3OutputFormatConfig;

  S3DestinationProperties({
    @_s.required this.bucketName,
    this.bucketPrefix,
    this.s3OutputFormatConfig,
  });
  factory S3DestinationProperties.fromJson(Map<String, dynamic> json) =>
      _$S3DestinationPropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$S3DestinationPropertiesToJson(this);
}

/// The connector metadata specific to Amazon S3.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class S3Metadata {
  S3Metadata();
  factory S3Metadata.fromJson(Map<String, dynamic> json) =>
      _$S3MetadataFromJson(json);
}

/// The configuration that determines how Amazon AppFlow should format the flow
/// output data when Amazon S3 is used as the destination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class S3OutputFormatConfig {
  @_s.JsonKey(name: 'aggregationConfig')
  final AggregationConfig aggregationConfig;

  /// Indicates the file type that Amazon AppFlow places in the Amazon S3 bucket.
  @_s.JsonKey(name: 'fileType')
  final FileType fileType;

  /// Determines the prefix that Amazon AppFlow applies to the folder name in the
  /// Amazon S3 bucket. You can name folders according to the flow frequency and
  /// date.
  @_s.JsonKey(name: 'prefixConfig')
  final PrefixConfig prefixConfig;

  S3OutputFormatConfig({
    this.aggregationConfig,
    this.fileType,
    this.prefixConfig,
  });
  factory S3OutputFormatConfig.fromJson(Map<String, dynamic> json) =>
      _$S3OutputFormatConfigFromJson(json);

  Map<String, dynamic> toJson() => _$S3OutputFormatConfigToJson(this);
}

/// The properties that are applied when Amazon S3 is being used as the flow
/// source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class S3SourceProperties {
  /// The Amazon S3 bucket name where the source files are stored.
  @_s.JsonKey(name: 'bucketName')
  final String bucketName;

  /// The object key for the Amazon S3 bucket in which the source files are
  /// stored.
  @_s.JsonKey(name: 'bucketPrefix')
  final String bucketPrefix;

  S3SourceProperties({
    @_s.required this.bucketName,
    this.bucketPrefix,
  });
  factory S3SourceProperties.fromJson(Map<String, dynamic> json) =>
      _$S3SourcePropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$S3SourcePropertiesToJson(this);
}

enum SalesforceConnectorOperator {
  @_s.JsonValue('PROJECTION')
  projection,
  @_s.JsonValue('LESS_THAN')
  lessThan,
  @_s.JsonValue('CONTAINS')
  contains,
  @_s.JsonValue('GREATER_THAN')
  greaterThan,
  @_s.JsonValue('BETWEEN')
  between,
  @_s.JsonValue('LESS_THAN_OR_EQUAL_TO')
  lessThanOrEqualTo,
  @_s.JsonValue('GREATER_THAN_OR_EQUAL_TO')
  greaterThanOrEqualTo,
  @_s.JsonValue('EQUAL_TO')
  equalTo,
  @_s.JsonValue('NOT_EQUAL_TO')
  notEqualTo,
  @_s.JsonValue('ADDITION')
  addition,
  @_s.JsonValue('MULTIPLICATION')
  multiplication,
  @_s.JsonValue('DIVISION')
  division,
  @_s.JsonValue('SUBTRACTION')
  subtraction,
  @_s.JsonValue('MASK_ALL')
  maskAll,
  @_s.JsonValue('MASK_FIRST_N')
  maskFirstN,
  @_s.JsonValue('MASK_LAST_N')
  maskLastN,
  @_s.JsonValue('VALIDATE_NON_NULL')
  validateNonNull,
  @_s.JsonValue('VALIDATE_NON_ZERO')
  validateNonZero,
  @_s.JsonValue('VALIDATE_NON_NEGATIVE')
  validateNonNegative,
  @_s.JsonValue('VALIDATE_NUMERIC')
  validateNumeric,
  @_s.JsonValue('NO_OP')
  noOp,
}

/// The connector-specific profile credentials required when using Salesforce.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SalesforceConnectorProfileCredentials {
  /// The credentials used to access protected Salesforce resources.
  @_s.JsonKey(name: 'accessToken')
  final String accessToken;

  /// The secret manager ARN, which contains the client ID and client secret of
  /// the connected app.
  @_s.JsonKey(name: 'clientCredentialsArn')
  final String clientCredentialsArn;

  /// The OAuth requirement needed to request security tokens from the connector
  /// endpoint.
  @_s.JsonKey(name: 'oAuthRequest')
  final ConnectorOAuthRequest oAuthRequest;

  /// The credentials used to acquire new access tokens.
  @_s.JsonKey(name: 'refreshToken')
  final String refreshToken;

  SalesforceConnectorProfileCredentials({
    this.accessToken,
    this.clientCredentialsArn,
    this.oAuthRequest,
    this.refreshToken,
  });
  Map<String, dynamic> toJson() =>
      _$SalesforceConnectorProfileCredentialsToJson(this);
}

/// The connector-specific profile properties required when using Salesforce.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SalesforceConnectorProfileProperties {
  /// The location of the Salesforce resource.
  @_s.JsonKey(name: 'instanceUrl')
  final String instanceUrl;

  /// Indicates whether the connector profile applies to a sandbox or production
  /// environment.
  @_s.JsonKey(name: 'isSandboxEnvironment')
  final bool isSandboxEnvironment;

  SalesforceConnectorProfileProperties({
    this.instanceUrl,
    this.isSandboxEnvironment,
  });
  factory SalesforceConnectorProfileProperties.fromJson(
          Map<String, dynamic> json) =>
      _$SalesforceConnectorProfilePropertiesFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SalesforceConnectorProfilePropertiesToJson(this);
}

/// The properties that are applied when Salesforce is being used as a
/// destination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SalesforceDestinationProperties {
  /// The object specified in the Salesforce flow destination.
  @_s.JsonKey(name: 'object')
  final String object;

  /// The settings that determine how Amazon AppFlow handles an error when placing
  /// data in the Salesforce destination. For example, this setting would
  /// determine if the flow should fail after one insertion error, or continue and
  /// attempt to insert every record regardless of the initial failure.
  /// <code>ErrorHandlingConfig</code> is a part of the destination connector
  /// details.
  @_s.JsonKey(name: 'errorHandlingConfig')
  final ErrorHandlingConfig errorHandlingConfig;

  /// The name of the field that Amazon AppFlow uses as an ID when performing a
  /// write operation such as update or delete.
  @_s.JsonKey(name: 'idFieldNames')
  final List<String> idFieldNames;

  /// This specifies the type of write operation to be performed in Salesforce.
  /// When the value is <code>UPSERT</code>, then <code>idFieldNames</code> is
  /// required.
  @_s.JsonKey(name: 'writeOperationType')
  final WriteOperationType writeOperationType;

  SalesforceDestinationProperties({
    @_s.required this.object,
    this.errorHandlingConfig,
    this.idFieldNames,
    this.writeOperationType,
  });
  factory SalesforceDestinationProperties.fromJson(Map<String, dynamic> json) =>
      _$SalesforceDestinationPropertiesFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SalesforceDestinationPropertiesToJson(this);
}

/// The connector metadata specific to Salesforce.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SalesforceMetadata {
  /// The desired authorization scope for the Salesforce account.
  @_s.JsonKey(name: 'oAuthScopes')
  final List<String> oAuthScopes;

  SalesforceMetadata({
    this.oAuthScopes,
  });
  factory SalesforceMetadata.fromJson(Map<String, dynamic> json) =>
      _$SalesforceMetadataFromJson(json);
}

/// The properties that are applied when Salesforce is being used as a source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SalesforceSourceProperties {
  /// The object specified in the Salesforce flow source.
  @_s.JsonKey(name: 'object')
  final String object;

  /// The flag that enables dynamic fetching of new (recently added) fields in the
  /// Salesforce objects while running a flow.
  @_s.JsonKey(name: 'enableDynamicFieldUpdate')
  final bool enableDynamicFieldUpdate;

  /// Indicates whether Amazon AppFlow includes deleted files in the flow run.
  @_s.JsonKey(name: 'includeDeletedRecords')
  final bool includeDeletedRecords;

  SalesforceSourceProperties({
    @_s.required this.object,
    this.enableDynamicFieldUpdate,
    this.includeDeletedRecords,
  });
  factory SalesforceSourceProperties.fromJson(Map<String, dynamic> json) =>
      _$SalesforceSourcePropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$SalesforceSourcePropertiesToJson(this);
}

enum ScheduleFrequencyType {
  @_s.JsonValue('BYMINUTE')
  byminute,
  @_s.JsonValue('HOURLY')
  hourly,
  @_s.JsonValue('DAILY')
  daily,
  @_s.JsonValue('WEEKLY')
  weekly,
  @_s.JsonValue('MONTHLY')
  monthly,
  @_s.JsonValue('ONCE')
  once,
}

/// Specifies the configuration details of a schedule-triggered flow as defined
/// by the user. Currently, these settings only apply to the
/// <code>Scheduled</code> trigger type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ScheduledTriggerProperties {
  /// The scheduling expression that determines the rate at which the schedule
  /// will run, for example <code>rate(5minutes)</code>.
  @_s.JsonKey(name: 'scheduleExpression')
  final String scheduleExpression;

  /// Specifies whether a scheduled flow has an incremental data transfer or a
  /// complete data transfer for each flow run.
  @_s.JsonKey(name: 'dataPullMode')
  final DataPullMode dataPullMode;

  /// Specifies the scheduled end time for a schedule-triggered flow.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'scheduleEndTime')
  final DateTime scheduleEndTime;

  /// Specifies the scheduled start time for a schedule-triggered flow.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'scheduleStartTime')
  final DateTime scheduleStartTime;

  /// Specifies the time zone used when referring to the date and time of a
  /// scheduled-triggered flow.
  @_s.JsonKey(name: 'timezone')
  final String timezone;

  ScheduledTriggerProperties({
    @_s.required this.scheduleExpression,
    this.dataPullMode,
    this.scheduleEndTime,
    this.scheduleStartTime,
    this.timezone,
  });
  factory ScheduledTriggerProperties.fromJson(Map<String, dynamic> json) =>
      _$ScheduledTriggerPropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduledTriggerPropertiesToJson(this);
}

enum ServiceNowConnectorOperator {
  @_s.JsonValue('PROJECTION')
  projection,
  @_s.JsonValue('CONTAINS')
  contains,
  @_s.JsonValue('LESS_THAN')
  lessThan,
  @_s.JsonValue('GREATER_THAN')
  greaterThan,
  @_s.JsonValue('BETWEEN')
  between,
  @_s.JsonValue('LESS_THAN_OR_EQUAL_TO')
  lessThanOrEqualTo,
  @_s.JsonValue('GREATER_THAN_OR_EQUAL_TO')
  greaterThanOrEqualTo,
  @_s.JsonValue('EQUAL_TO')
  equalTo,
  @_s.JsonValue('NOT_EQUAL_TO')
  notEqualTo,
  @_s.JsonValue('ADDITION')
  addition,
  @_s.JsonValue('MULTIPLICATION')
  multiplication,
  @_s.JsonValue('DIVISION')
  division,
  @_s.JsonValue('SUBTRACTION')
  subtraction,
  @_s.JsonValue('MASK_ALL')
  maskAll,
  @_s.JsonValue('MASK_FIRST_N')
  maskFirstN,
  @_s.JsonValue('MASK_LAST_N')
  maskLastN,
  @_s.JsonValue('VALIDATE_NON_NULL')
  validateNonNull,
  @_s.JsonValue('VALIDATE_NON_ZERO')
  validateNonZero,
  @_s.JsonValue('VALIDATE_NON_NEGATIVE')
  validateNonNegative,
  @_s.JsonValue('VALIDATE_NUMERIC')
  validateNumeric,
  @_s.JsonValue('NO_OP')
  noOp,
}

/// The connector-specific profile credentials required when using ServiceNow.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ServiceNowConnectorProfileCredentials {
  /// The password that corresponds to the user name.
  @_s.JsonKey(name: 'password')
  final String password;

  /// The name of the user.
  @_s.JsonKey(name: 'username')
  final String username;

  ServiceNowConnectorProfileCredentials({
    @_s.required this.password,
    @_s.required this.username,
  });
  Map<String, dynamic> toJson() =>
      _$ServiceNowConnectorProfileCredentialsToJson(this);
}

/// The connector-specific profile properties required when using ServiceNow.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ServiceNowConnectorProfileProperties {
  /// The location of the ServiceNow resource.
  @_s.JsonKey(name: 'instanceUrl')
  final String instanceUrl;

  ServiceNowConnectorProfileProperties({
    @_s.required this.instanceUrl,
  });
  factory ServiceNowConnectorProfileProperties.fromJson(
          Map<String, dynamic> json) =>
      _$ServiceNowConnectorProfilePropertiesFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ServiceNowConnectorProfilePropertiesToJson(this);
}

/// The connector metadata specific to ServiceNow.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ServiceNowMetadata {
  ServiceNowMetadata();
  factory ServiceNowMetadata.fromJson(Map<String, dynamic> json) =>
      _$ServiceNowMetadataFromJson(json);
}

/// The properties that are applied when ServiceNow is being used as a source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ServiceNowSourceProperties {
  /// The object specified in the ServiceNow flow source.
  @_s.JsonKey(name: 'object')
  final String object;

  ServiceNowSourceProperties({
    @_s.required this.object,
  });
  factory ServiceNowSourceProperties.fromJson(Map<String, dynamic> json) =>
      _$ServiceNowSourcePropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceNowSourcePropertiesToJson(this);
}

enum SingularConnectorOperator {
  @_s.JsonValue('PROJECTION')
  projection,
  @_s.JsonValue('EQUAL_TO')
  equalTo,
  @_s.JsonValue('ADDITION')
  addition,
  @_s.JsonValue('MULTIPLICATION')
  multiplication,
  @_s.JsonValue('DIVISION')
  division,
  @_s.JsonValue('SUBTRACTION')
  subtraction,
  @_s.JsonValue('MASK_ALL')
  maskAll,
  @_s.JsonValue('MASK_FIRST_N')
  maskFirstN,
  @_s.JsonValue('MASK_LAST_N')
  maskLastN,
  @_s.JsonValue('VALIDATE_NON_NULL')
  validateNonNull,
  @_s.JsonValue('VALIDATE_NON_ZERO')
  validateNonZero,
  @_s.JsonValue('VALIDATE_NON_NEGATIVE')
  validateNonNegative,
  @_s.JsonValue('VALIDATE_NUMERIC')
  validateNumeric,
  @_s.JsonValue('NO_OP')
  noOp,
}

/// The connector-specific profile credentials required when using Singular.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SingularConnectorProfileCredentials {
  /// A unique alphanumeric identifier used to authenticate a user, developer, or
  /// calling program to your API.
  @_s.JsonKey(name: 'apiKey')
  final String apiKey;

  SingularConnectorProfileCredentials({
    @_s.required this.apiKey,
  });
  Map<String, dynamic> toJson() =>
      _$SingularConnectorProfileCredentialsToJson(this);
}

/// The connector-specific profile properties required when using Singular.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SingularConnectorProfileProperties {
  SingularConnectorProfileProperties();
  factory SingularConnectorProfileProperties.fromJson(
          Map<String, dynamic> json) =>
      _$SingularConnectorProfilePropertiesFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SingularConnectorProfilePropertiesToJson(this);
}

/// The connector metadata specific to Singular.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SingularMetadata {
  SingularMetadata();
  factory SingularMetadata.fromJson(Map<String, dynamic> json) =>
      _$SingularMetadataFromJson(json);
}

/// The properties that are applied when Singular is being used as a source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SingularSourceProperties {
  /// The object specified in the Singular flow source.
  @_s.JsonKey(name: 'object')
  final String object;

  SingularSourceProperties({
    @_s.required this.object,
  });
  factory SingularSourceProperties.fromJson(Map<String, dynamic> json) =>
      _$SingularSourcePropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$SingularSourcePropertiesToJson(this);
}

enum SlackConnectorOperator {
  @_s.JsonValue('PROJECTION')
  projection,
  @_s.JsonValue('LESS_THAN')
  lessThan,
  @_s.JsonValue('GREATER_THAN')
  greaterThan,
  @_s.JsonValue('BETWEEN')
  between,
  @_s.JsonValue('LESS_THAN_OR_EQUAL_TO')
  lessThanOrEqualTo,
  @_s.JsonValue('GREATER_THAN_OR_EQUAL_TO')
  greaterThanOrEqualTo,
  @_s.JsonValue('EQUAL_TO')
  equalTo,
  @_s.JsonValue('ADDITION')
  addition,
  @_s.JsonValue('MULTIPLICATION')
  multiplication,
  @_s.JsonValue('DIVISION')
  division,
  @_s.JsonValue('SUBTRACTION')
  subtraction,
  @_s.JsonValue('MASK_ALL')
  maskAll,
  @_s.JsonValue('MASK_FIRST_N')
  maskFirstN,
  @_s.JsonValue('MASK_LAST_N')
  maskLastN,
  @_s.JsonValue('VALIDATE_NON_NULL')
  validateNonNull,
  @_s.JsonValue('VALIDATE_NON_ZERO')
  validateNonZero,
  @_s.JsonValue('VALIDATE_NON_NEGATIVE')
  validateNonNegative,
  @_s.JsonValue('VALIDATE_NUMERIC')
  validateNumeric,
  @_s.JsonValue('NO_OP')
  noOp,
}

/// The connector-specific profile credentials required when using Slack.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SlackConnectorProfileCredentials {
  /// The identifier for the client.
  @_s.JsonKey(name: 'clientId')
  final String clientId;

  /// The client secret used by the OAuth client to authenticate to the
  /// authorization server.
  @_s.JsonKey(name: 'clientSecret')
  final String clientSecret;

  /// The credentials used to access protected Slack resources.
  @_s.JsonKey(name: 'accessToken')
  final String accessToken;

  /// The OAuth requirement needed to request security tokens from the connector
  /// endpoint.
  @_s.JsonKey(name: 'oAuthRequest')
  final ConnectorOAuthRequest oAuthRequest;

  SlackConnectorProfileCredentials({
    @_s.required this.clientId,
    @_s.required this.clientSecret,
    this.accessToken,
    this.oAuthRequest,
  });
  Map<String, dynamic> toJson() =>
      _$SlackConnectorProfileCredentialsToJson(this);
}

/// The connector-specific profile properties required when using Slack.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SlackConnectorProfileProperties {
  /// The location of the Slack resource.
  @_s.JsonKey(name: 'instanceUrl')
  final String instanceUrl;

  SlackConnectorProfileProperties({
    @_s.required this.instanceUrl,
  });
  factory SlackConnectorProfileProperties.fromJson(Map<String, dynamic> json) =>
      _$SlackConnectorProfilePropertiesFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SlackConnectorProfilePropertiesToJson(this);
}

/// The connector metadata specific to Slack.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SlackMetadata {
  /// The desired authorization scope for the Slack account.
  @_s.JsonKey(name: 'oAuthScopes')
  final List<String> oAuthScopes;

  SlackMetadata({
    this.oAuthScopes,
  });
  factory SlackMetadata.fromJson(Map<String, dynamic> json) =>
      _$SlackMetadataFromJson(json);
}

/// The properties that are applied when Slack is being used as a source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SlackSourceProperties {
  /// The object specified in the Slack flow source.
  @_s.JsonKey(name: 'object')
  final String object;

  SlackSourceProperties({
    @_s.required this.object,
  });
  factory SlackSourceProperties.fromJson(Map<String, dynamic> json) =>
      _$SlackSourcePropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$SlackSourcePropertiesToJson(this);
}

/// The connector-specific profile credentials required when using Snowflake.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SnowflakeConnectorProfileCredentials {
  /// The password that corresponds to the user name.
  @_s.JsonKey(name: 'password')
  final String password;

  /// The name of the user.
  @_s.JsonKey(name: 'username')
  final String username;

  SnowflakeConnectorProfileCredentials({
    @_s.required this.password,
    @_s.required this.username,
  });
  Map<String, dynamic> toJson() =>
      _$SnowflakeConnectorProfileCredentialsToJson(this);
}

/// The connector-specific profile properties required when using Snowflake.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SnowflakeConnectorProfileProperties {
  /// The name of the Amazon S3 bucket associated with Snowflake.
  @_s.JsonKey(name: 'bucketName')
  final String bucketName;

  /// The name of the Amazon S3 stage that was created while setting up an Amazon
  /// S3 stage in the Snowflake account. This is written in the following format:
  /// &lt; Database&gt;&lt; Schema&gt;&lt;Stage Name&gt;.
  @_s.JsonKey(name: 'stage')
  final String stage;

  /// The name of the Snowflake warehouse.
  @_s.JsonKey(name: 'warehouse')
  final String warehouse;

  /// The name of the account.
  @_s.JsonKey(name: 'accountName')
  final String accountName;

  /// The bucket path that refers to the Amazon S3 bucket associated with
  /// Snowflake.
  @_s.JsonKey(name: 'bucketPrefix')
  final String bucketPrefix;

  /// The Snowflake Private Link service name to be used for private data
  /// transfers.
  @_s.JsonKey(name: 'privateLinkServiceName')
  final String privateLinkServiceName;

  /// The AWS Region of the Snowflake account.
  @_s.JsonKey(name: 'region')
  final String region;

  SnowflakeConnectorProfileProperties({
    @_s.required this.bucketName,
    @_s.required this.stage,
    @_s.required this.warehouse,
    this.accountName,
    this.bucketPrefix,
    this.privateLinkServiceName,
    this.region,
  });
  factory SnowflakeConnectorProfileProperties.fromJson(
          Map<String, dynamic> json) =>
      _$SnowflakeConnectorProfilePropertiesFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SnowflakeConnectorProfilePropertiesToJson(this);
}

/// The properties that are applied when Snowflake is being used as a
/// destination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SnowflakeDestinationProperties {
  /// The intermediate bucket that Amazon AppFlow uses when moving data into
  /// Snowflake.
  @_s.JsonKey(name: 'intermediateBucketName')
  final String intermediateBucketName;

  /// The object specified in the Snowflake flow destination.
  @_s.JsonKey(name: 'object')
  final String object;

  /// The object key for the destination bucket in which Amazon AppFlow places the
  /// files.
  @_s.JsonKey(name: 'bucketPrefix')
  final String bucketPrefix;

  /// The settings that determine how Amazon AppFlow handles an error when placing
  /// data in the Snowflake destination. For example, this setting would determine
  /// if the flow should fail after one insertion error, or continue and attempt
  /// to insert every record regardless of the initial failure.
  /// <code>ErrorHandlingConfig</code> is a part of the destination connector
  /// details.
  @_s.JsonKey(name: 'errorHandlingConfig')
  final ErrorHandlingConfig errorHandlingConfig;

  SnowflakeDestinationProperties({
    @_s.required this.intermediateBucketName,
    @_s.required this.object,
    this.bucketPrefix,
    this.errorHandlingConfig,
  });
  factory SnowflakeDestinationProperties.fromJson(Map<String, dynamic> json) =>
      _$SnowflakeDestinationPropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$SnowflakeDestinationPropertiesToJson(this);
}

/// The connector metadata specific to Snowflake.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SnowflakeMetadata {
  /// Specifies the supported AWS Regions when using Snowflake.
  @_s.JsonKey(name: 'supportedRegions')
  final List<String> supportedRegions;

  SnowflakeMetadata({
    this.supportedRegions,
  });
  factory SnowflakeMetadata.fromJson(Map<String, dynamic> json) =>
      _$SnowflakeMetadataFromJson(json);
}

/// Specifies the information that is required to query a particular connector.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SourceConnectorProperties {
  /// Specifies the information that is required for querying Amplitude.
  @_s.JsonKey(name: 'Amplitude')
  final AmplitudeSourceProperties amplitude;

  /// Specifies the information that is required for querying Datadog.
  @_s.JsonKey(name: 'Datadog')
  final DatadogSourceProperties datadog;

  /// Specifies the information that is required for querying Dynatrace.
  @_s.JsonKey(name: 'Dynatrace')
  final DynatraceSourceProperties dynatrace;

  /// Specifies the information that is required for querying Google Analytics.
  @_s.JsonKey(name: 'GoogleAnalytics')
  final GoogleAnalyticsSourceProperties googleAnalytics;

  /// Specifies the information that is required for querying Infor Nexus.
  @_s.JsonKey(name: 'InforNexus')
  final InforNexusSourceProperties inforNexus;

  /// Specifies the information that is required for querying Marketo.
  @_s.JsonKey(name: 'Marketo')
  final MarketoSourceProperties marketo;

  /// Specifies the information that is required for querying Amazon S3.
  @_s.JsonKey(name: 'S3')
  final S3SourceProperties s3;

  /// Specifies the information that is required for querying Salesforce.
  @_s.JsonKey(name: 'Salesforce')
  final SalesforceSourceProperties salesforce;

  /// Specifies the information that is required for querying ServiceNow.
  @_s.JsonKey(name: 'ServiceNow')
  final ServiceNowSourceProperties serviceNow;

  /// Specifies the information that is required for querying Singular.
  @_s.JsonKey(name: 'Singular')
  final SingularSourceProperties singular;

  /// Specifies the information that is required for querying Slack.
  @_s.JsonKey(name: 'Slack')
  final SlackSourceProperties slack;

  /// Specifies the information that is required for querying Trend Micro.
  @_s.JsonKey(name: 'Trendmicro')
  final TrendmicroSourceProperties trendmicro;

  /// Specifies the information that is required for querying Veeva.
  @_s.JsonKey(name: 'Veeva')
  final VeevaSourceProperties veeva;

  /// Specifies the information that is required for querying Zendesk.
  @_s.JsonKey(name: 'Zendesk')
  final ZendeskSourceProperties zendesk;

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
  factory SourceConnectorProperties.fromJson(Map<String, dynamic> json) =>
      _$SourceConnectorPropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$SourceConnectorPropertiesToJson(this);
}

/// The properties that can be applied to a field when the connector is being
/// used as a source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SourceFieldProperties {
  /// Indicates if the field can be queried.
  @_s.JsonKey(name: 'isQueryable')
  final bool isQueryable;

  /// Indicates whether the field can be returned in a search result.
  @_s.JsonKey(name: 'isRetrievable')
  final bool isRetrievable;

  SourceFieldProperties({
    this.isQueryable,
    this.isRetrievable,
  });
  factory SourceFieldProperties.fromJson(Map<String, dynamic> json) =>
      _$SourceFieldPropertiesFromJson(json);
}

/// Contains information about the configuration of the source connector used in
/// the flow.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SourceFlowConfig {
  /// The type of connector, such as Salesforce, Amplitude, and so on.
  @_s.JsonKey(name: 'connectorType')
  final ConnectorType connectorType;

  /// Specifies the information that is required to query a particular source
  /// connector.
  @_s.JsonKey(name: 'sourceConnectorProperties')
  final SourceConnectorProperties sourceConnectorProperties;

  /// The name of the connector profile. This name must be unique for each
  /// connector profile in the AWS account.
  @_s.JsonKey(name: 'connectorProfileName')
  final String connectorProfileName;

  /// Defines the configuration for a scheduled incremental data pull. If a valid
  /// configuration is provided, the fields specified in the configuration are
  /// used when querying for the incremental data pull.
  @_s.JsonKey(name: 'incrementalPullConfig')
  final IncrementalPullConfig incrementalPullConfig;

  SourceFlowConfig({
    @_s.required this.connectorType,
    @_s.required this.sourceConnectorProperties,
    this.connectorProfileName,
    this.incrementalPullConfig,
  });
  factory SourceFlowConfig.fromJson(Map<String, dynamic> json) =>
      _$SourceFlowConfigFromJson(json);

  Map<String, dynamic> toJson() => _$SourceFlowConfigToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartFlowResponse {
  /// Returns the internal execution ID of an on-demand flow when the flow is
  /// started. For scheduled or event-triggered flows, this value is null.
  @_s.JsonKey(name: 'executionId')
  final String executionId;

  /// The flow's Amazon Resource Name (ARN).
  @_s.JsonKey(name: 'flowArn')
  final String flowArn;

  /// Indicates the current status of the flow.
  @_s.JsonKey(name: 'flowStatus')
  final FlowStatus flowStatus;

  StartFlowResponse({
    this.executionId,
    this.flowArn,
    this.flowStatus,
  });
  factory StartFlowResponse.fromJson(Map<String, dynamic> json) =>
      _$StartFlowResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopFlowResponse {
  /// The flow's Amazon Resource Name (ARN).
  @_s.JsonKey(name: 'flowArn')
  final String flowArn;

  /// Indicates the current status of the flow.
  @_s.JsonKey(name: 'flowStatus')
  final FlowStatus flowStatus;

  StopFlowResponse({
    this.flowArn,
    this.flowStatus,
  });
  factory StopFlowResponse.fromJson(Map<String, dynamic> json) =>
      _$StopFlowResponseFromJson(json);
}

/// Contains details regarding all the supported <code>FieldTypes</code> and
/// their corresponding <code>filterOperators</code> and
/// <code>supportedValues</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SupportedFieldTypeDetails {
  /// The initial supported version for <code>fieldType</code>. If this is later
  /// changed to a different version, v2 will be introduced.
  @_s.JsonKey(name: 'v1')
  final FieldTypeDetails v1;

  SupportedFieldTypeDetails({
    @_s.required this.v1,
  });
  factory SupportedFieldTypeDetails.fromJson(Map<String, dynamic> json) =>
      _$SupportedFieldTypeDetailsFromJson(json);
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

/// A class for modeling different type of tasks. Task implementation varies
/// based on the <code>TaskType</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Task {
  /// The source fields to which a particular task is applied.
  @_s.JsonKey(name: 'sourceFields')
  final List<String> sourceFields;

  /// Specifies the particular task implementation that Amazon AppFlow performs.
  @_s.JsonKey(name: 'taskType')
  final TaskType taskType;

  /// The operation to be performed on the provided source fields.
  @_s.JsonKey(name: 'connectorOperator')
  final ConnectorOperator connectorOperator;

  /// A field in a destination connector, or a field value against which Amazon
  /// AppFlow validates a source field.
  @_s.JsonKey(name: 'destinationField')
  final String destinationField;

  /// A map used to store task-related information. The execution service looks
  /// for particular information based on the <code>TaskType</code>.
  @_s.JsonKey(name: 'taskProperties')
  final Map<OperatorPropertiesKeys, String> taskProperties;

  Task({
    @_s.required this.sourceFields,
    @_s.required this.taskType,
    this.connectorOperator,
    this.destinationField,
    this.taskProperties,
  });
  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}

enum TaskType {
  @_s.JsonValue('Arithmetic')
  arithmetic,
  @_s.JsonValue('Filter')
  filter,
  @_s.JsonValue('Map')
  map,
  @_s.JsonValue('Mask')
  mask,
  @_s.JsonValue('Merge')
  merge,
  @_s.JsonValue('Truncate')
  truncate,
  @_s.JsonValue('Validate')
  validate,
}

enum TrendmicroConnectorOperator {
  @_s.JsonValue('PROJECTION')
  projection,
  @_s.JsonValue('EQUAL_TO')
  equalTo,
  @_s.JsonValue('ADDITION')
  addition,
  @_s.JsonValue('MULTIPLICATION')
  multiplication,
  @_s.JsonValue('DIVISION')
  division,
  @_s.JsonValue('SUBTRACTION')
  subtraction,
  @_s.JsonValue('MASK_ALL')
  maskAll,
  @_s.JsonValue('MASK_FIRST_N')
  maskFirstN,
  @_s.JsonValue('MASK_LAST_N')
  maskLastN,
  @_s.JsonValue('VALIDATE_NON_NULL')
  validateNonNull,
  @_s.JsonValue('VALIDATE_NON_ZERO')
  validateNonZero,
  @_s.JsonValue('VALIDATE_NON_NEGATIVE')
  validateNonNegative,
  @_s.JsonValue('VALIDATE_NUMERIC')
  validateNumeric,
  @_s.JsonValue('NO_OP')
  noOp,
}

/// The connector-specific profile credentials required when using Trend Micro.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TrendmicroConnectorProfileCredentials {
  /// The Secret Access Key portion of the credentials.
  @_s.JsonKey(name: 'apiSecretKey')
  final String apiSecretKey;

  TrendmicroConnectorProfileCredentials({
    @_s.required this.apiSecretKey,
  });
  Map<String, dynamic> toJson() =>
      _$TrendmicroConnectorProfileCredentialsToJson(this);
}

/// The connector-specific profile properties required when using Trend Micro.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TrendmicroConnectorProfileProperties {
  TrendmicroConnectorProfileProperties();
  factory TrendmicroConnectorProfileProperties.fromJson(
          Map<String, dynamic> json) =>
      _$TrendmicroConnectorProfilePropertiesFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TrendmicroConnectorProfilePropertiesToJson(this);
}

/// The connector metadata specific to Trend Micro.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TrendmicroMetadata {
  TrendmicroMetadata();
  factory TrendmicroMetadata.fromJson(Map<String, dynamic> json) =>
      _$TrendmicroMetadataFromJson(json);
}

/// The properties that are applied when using Trend Micro as a flow source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TrendmicroSourceProperties {
  /// The object specified in the Trend Micro flow source.
  @_s.JsonKey(name: 'object')
  final String object;

  TrendmicroSourceProperties({
    @_s.required this.object,
  });
  factory TrendmicroSourceProperties.fromJson(Map<String, dynamic> json) =>
      _$TrendmicroSourcePropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$TrendmicroSourcePropertiesToJson(this);
}

/// The trigger settings that determine how and when Amazon AppFlow runs the
/// specified flow.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TriggerConfig {
  /// Specifies the type of flow trigger. This can be <code>OnDemand</code>,
  /// <code>Scheduled</code>, or <code>Event</code>.
  @_s.JsonKey(name: 'triggerType')
  final TriggerType triggerType;

  /// Specifies the configuration details of a schedule-triggered flow as defined
  /// by the user. Currently, these settings only apply to the
  /// <code>Scheduled</code> trigger type.
  @_s.JsonKey(name: 'triggerProperties')
  final TriggerProperties triggerProperties;

  TriggerConfig({
    @_s.required this.triggerType,
    this.triggerProperties,
  });
  factory TriggerConfig.fromJson(Map<String, dynamic> json) =>
      _$TriggerConfigFromJson(json);

  Map<String, dynamic> toJson() => _$TriggerConfigToJson(this);
}

/// Specifies the configuration details that control the trigger for a flow.
/// Currently, these settings only apply to the <code>Scheduled</code> trigger
/// type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TriggerProperties {
  /// Specifies the configuration details of a schedule-triggered flow as defined
  /// by the user.
  @_s.JsonKey(name: 'Scheduled')
  final ScheduledTriggerProperties scheduled;

  TriggerProperties({
    this.scheduled,
  });
  factory TriggerProperties.fromJson(Map<String, dynamic> json) =>
      _$TriggerPropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$TriggerPropertiesToJson(this);
}

enum TriggerType {
  @_s.JsonValue('Scheduled')
  scheduled,
  @_s.JsonValue('Event')
  event,
  @_s.JsonValue('OnDemand')
  onDemand,
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateConnectorProfileResponse {
  /// The Amazon Resource Name (ARN) of the connector profile.
  @_s.JsonKey(name: 'connectorProfileArn')
  final String connectorProfileArn;

  UpdateConnectorProfileResponse({
    this.connectorProfileArn,
  });
  factory UpdateConnectorProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateConnectorProfileResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateFlowResponse {
  /// Indicates the current status of the flow.
  @_s.JsonKey(name: 'flowStatus')
  final FlowStatus flowStatus;

  UpdateFlowResponse({
    this.flowStatus,
  });
  factory UpdateFlowResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateFlowResponseFromJson(json);
}

/// The properties that are applied when Upsolver is used as a destination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class UpsolverDestinationProperties {
  /// The Upsolver Amazon S3 bucket name in which Amazon AppFlow places the
  /// transferred data.
  @_s.JsonKey(name: 'bucketName')
  final String bucketName;

  /// The configuration that determines how data is formatted when Upsolver is
  /// used as the flow destination.
  @_s.JsonKey(name: 's3OutputFormatConfig')
  final UpsolverS3OutputFormatConfig s3OutputFormatConfig;

  /// The object key for the destination Upsolver Amazon S3 bucket in which Amazon
  /// AppFlow places the files.
  @_s.JsonKey(name: 'bucketPrefix')
  final String bucketPrefix;

  UpsolverDestinationProperties({
    @_s.required this.bucketName,
    @_s.required this.s3OutputFormatConfig,
    this.bucketPrefix,
  });
  factory UpsolverDestinationProperties.fromJson(Map<String, dynamic> json) =>
      _$UpsolverDestinationPropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$UpsolverDestinationPropertiesToJson(this);
}

/// The connector metadata specific to Upsolver.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpsolverMetadata {
  UpsolverMetadata();
  factory UpsolverMetadata.fromJson(Map<String, dynamic> json) =>
      _$UpsolverMetadataFromJson(json);
}

/// The configuration that determines how Amazon AppFlow formats the flow output
/// data when Upsolver is used as the destination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class UpsolverS3OutputFormatConfig {
  @_s.JsonKey(name: 'prefixConfig')
  final PrefixConfig prefixConfig;
  @_s.JsonKey(name: 'aggregationConfig')
  final AggregationConfig aggregationConfig;

  /// Indicates the file type that Amazon AppFlow places in the Upsolver Amazon S3
  /// bucket.
  @_s.JsonKey(name: 'fileType')
  final FileType fileType;

  UpsolverS3OutputFormatConfig({
    @_s.required this.prefixConfig,
    this.aggregationConfig,
    this.fileType,
  });
  factory UpsolverS3OutputFormatConfig.fromJson(Map<String, dynamic> json) =>
      _$UpsolverS3OutputFormatConfigFromJson(json);

  Map<String, dynamic> toJson() => _$UpsolverS3OutputFormatConfigToJson(this);
}

enum VeevaConnectorOperator {
  @_s.JsonValue('PROJECTION')
  projection,
  @_s.JsonValue('LESS_THAN')
  lessThan,
  @_s.JsonValue('GREATER_THAN')
  greaterThan,
  @_s.JsonValue('CONTAINS')
  contains,
  @_s.JsonValue('BETWEEN')
  between,
  @_s.JsonValue('LESS_THAN_OR_EQUAL_TO')
  lessThanOrEqualTo,
  @_s.JsonValue('GREATER_THAN_OR_EQUAL_TO')
  greaterThanOrEqualTo,
  @_s.JsonValue('EQUAL_TO')
  equalTo,
  @_s.JsonValue('NOT_EQUAL_TO')
  notEqualTo,
  @_s.JsonValue('ADDITION')
  addition,
  @_s.JsonValue('MULTIPLICATION')
  multiplication,
  @_s.JsonValue('DIVISION')
  division,
  @_s.JsonValue('SUBTRACTION')
  subtraction,
  @_s.JsonValue('MASK_ALL')
  maskAll,
  @_s.JsonValue('MASK_FIRST_N')
  maskFirstN,
  @_s.JsonValue('MASK_LAST_N')
  maskLastN,
  @_s.JsonValue('VALIDATE_NON_NULL')
  validateNonNull,
  @_s.JsonValue('VALIDATE_NON_ZERO')
  validateNonZero,
  @_s.JsonValue('VALIDATE_NON_NEGATIVE')
  validateNonNegative,
  @_s.JsonValue('VALIDATE_NUMERIC')
  validateNumeric,
  @_s.JsonValue('NO_OP')
  noOp,
}

/// The connector-specific profile credentials required when using Veeva.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class VeevaConnectorProfileCredentials {
  /// The password that corresponds to the user name.
  @_s.JsonKey(name: 'password')
  final String password;

  /// The name of the user.
  @_s.JsonKey(name: 'username')
  final String username;

  VeevaConnectorProfileCredentials({
    @_s.required this.password,
    @_s.required this.username,
  });
  Map<String, dynamic> toJson() =>
      _$VeevaConnectorProfileCredentialsToJson(this);
}

/// The connector-specific profile properties required when using Veeva.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VeevaConnectorProfileProperties {
  /// The location of the Veeva resource.
  @_s.JsonKey(name: 'instanceUrl')
  final String instanceUrl;

  VeevaConnectorProfileProperties({
    @_s.required this.instanceUrl,
  });
  factory VeevaConnectorProfileProperties.fromJson(Map<String, dynamic> json) =>
      _$VeevaConnectorProfilePropertiesFromJson(json);

  Map<String, dynamic> toJson() =>
      _$VeevaConnectorProfilePropertiesToJson(this);
}

/// The connector metadata specific to Veeva.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VeevaMetadata {
  VeevaMetadata();
  factory VeevaMetadata.fromJson(Map<String, dynamic> json) =>
      _$VeevaMetadataFromJson(json);
}

/// The properties that are applied when using Veeva as a flow source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VeevaSourceProperties {
  /// The object specified in the Veeva flow source.
  @_s.JsonKey(name: 'object')
  final String object;

  VeevaSourceProperties({
    @_s.required this.object,
  });
  factory VeevaSourceProperties.fromJson(Map<String, dynamic> json) =>
      _$VeevaSourcePropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$VeevaSourcePropertiesToJson(this);
}

/// The possible write operations in the destination connector. When this value
/// is not provided, this defaults to the <code>INSERT</code> operation.
enum WriteOperationType {
  @_s.JsonValue('INSERT')
  insert,
  @_s.JsonValue('UPSERT')
  upsert,
  @_s.JsonValue('UPDATE')
  update,
}

enum ZendeskConnectorOperator {
  @_s.JsonValue('PROJECTION')
  projection,
  @_s.JsonValue('GREATER_THAN')
  greaterThan,
  @_s.JsonValue('ADDITION')
  addition,
  @_s.JsonValue('MULTIPLICATION')
  multiplication,
  @_s.JsonValue('DIVISION')
  division,
  @_s.JsonValue('SUBTRACTION')
  subtraction,
  @_s.JsonValue('MASK_ALL')
  maskAll,
  @_s.JsonValue('MASK_FIRST_N')
  maskFirstN,
  @_s.JsonValue('MASK_LAST_N')
  maskLastN,
  @_s.JsonValue('VALIDATE_NON_NULL')
  validateNonNull,
  @_s.JsonValue('VALIDATE_NON_ZERO')
  validateNonZero,
  @_s.JsonValue('VALIDATE_NON_NEGATIVE')
  validateNonNegative,
  @_s.JsonValue('VALIDATE_NUMERIC')
  validateNumeric,
  @_s.JsonValue('NO_OP')
  noOp,
}

/// The connector-specific profile credentials required when using Zendesk.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ZendeskConnectorProfileCredentials {
  /// The identifier for the desired client.
  @_s.JsonKey(name: 'clientId')
  final String clientId;

  /// The client secret used by the OAuth client to authenticate to the
  /// authorization server.
  @_s.JsonKey(name: 'clientSecret')
  final String clientSecret;

  /// The credentials used to access protected Zendesk resources.
  @_s.JsonKey(name: 'accessToken')
  final String accessToken;

  /// The OAuth requirement needed to request security tokens from the connector
  /// endpoint.
  @_s.JsonKey(name: 'oAuthRequest')
  final ConnectorOAuthRequest oAuthRequest;

  ZendeskConnectorProfileCredentials({
    @_s.required this.clientId,
    @_s.required this.clientSecret,
    this.accessToken,
    this.oAuthRequest,
  });
  Map<String, dynamic> toJson() =>
      _$ZendeskConnectorProfileCredentialsToJson(this);
}

/// The connector-specific profile properties required when using Zendesk.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ZendeskConnectorProfileProperties {
  /// The location of the Zendesk resource.
  @_s.JsonKey(name: 'instanceUrl')
  final String instanceUrl;

  ZendeskConnectorProfileProperties({
    @_s.required this.instanceUrl,
  });
  factory ZendeskConnectorProfileProperties.fromJson(
          Map<String, dynamic> json) =>
      _$ZendeskConnectorProfilePropertiesFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ZendeskConnectorProfilePropertiesToJson(this);
}

/// The connector metadata specific to Zendesk.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ZendeskMetadata {
  /// The desired authorization scope for the Zendesk account.
  @_s.JsonKey(name: 'oAuthScopes')
  final List<String> oAuthScopes;

  ZendeskMetadata({
    this.oAuthScopes,
  });
  factory ZendeskMetadata.fromJson(Map<String, dynamic> json) =>
      _$ZendeskMetadataFromJson(json);
}

/// The properties that are applied when using Zendesk as a flow source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ZendeskSourceProperties {
  /// The object specified in the Zendesk flow source.
  @_s.JsonKey(name: 'object')
  final String object;

  ZendeskSourceProperties({
    @_s.required this.object,
  });
  factory ZendeskSourceProperties.fromJson(Map<String, dynamic> json) =>
      _$ZendeskSourcePropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$ZendeskSourcePropertiesToJson(this);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String type, String message})
      : super(type: type, code: 'ConflictException', message: message);
}

class ConnectorAuthenticationException extends _s.GenericAwsException {
  ConnectorAuthenticationException({String type, String message})
      : super(
            type: type,
            code: 'ConnectorAuthenticationException',
            message: message);
}

class ConnectorServerException extends _s.GenericAwsException {
  ConnectorServerException({String type, String message})
      : super(type: type, code: 'ConnectorServerException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String type, String message})
      : super(type: type, code: 'InternalServerException', message: message);
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

class UnsupportedOperationException extends _s.GenericAwsException {
  UnsupportedOperationException({String type, String message})
      : super(
            type: type,
            code: 'UnsupportedOperationException',
            message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String type, String message})
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
