// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
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

/// Managed integrations is a feature of AWS IoT Device Management that enables
/// developers to quickly build innovative IoT solutions. Customers can use
/// managed integrations to automate device setup workflows and support
/// interoperability across many devices, regardless of device vendor or
/// connectivity protocol. This allows developers to use a single user-interface
/// to control, manage, and operate a range of devices.
class IoTManagedIntegrations {
  final _s.RestJsonProtocol _protocol;
  IoTManagedIntegrations({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'api.iotmanagedintegrations',
            signingName: 'iotmanagedintegrations',
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

  /// Returns the IoT managed integrations custom endpoint.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  Future<GetCustomEndpointResponse> getCustomEndpoint() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/custom-endpoint',
      exceptionFnMap: _exceptionFns,
    );
    return GetCustomEndpointResponse.fromJson(response);
  }

  /// Lists the tags for a specified resource.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource for which to list tags.
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

  /// Customers can request IoT managed integrations to manage the server trust
  /// for them or bring their own external server trusts for the custom domain.
  /// Returns an IoT managed integrations endpoint.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  Future<RegisterCustomEndpointResponse> registerCustomEndpoint() async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/custom-endpoint',
      exceptionFnMap: _exceptionFns,
    );
    return RegisterCustomEndpointResponse.fromJson(response);
  }

  /// Relays third-party device events for a connector such as a new device or a
  /// device state change event.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [connectorId] :
  /// The id of the connector between the third-party cloud provider and IoT
  /// managed integrations.
  ///
  /// Parameter [operation] :
  /// The Open Connectivity Foundation (OCF) operation requested to be performed
  /// on the managed thing.
  /// <note>
  /// The field op can have a value of "I" or "U". The field "cn" will contain
  /// the capability types.
  /// </note>
  ///
  /// Parameter [connectorDeviceId] :
  /// The third-party device id as defined by the connector. This device id must
  /// not contain personal identifiable information (PII).
  /// <note>
  /// This parameter is used for cloud-to-cloud devices only.
  /// </note>
  ///
  /// Parameter [deviceDiscoveryId] :
  /// The id for the device discovery job.
  ///
  /// Parameter [devices] :
  /// The list of devices.
  ///
  /// Parameter [matterEndpoint] :
  /// The device endpoint.
  ///
  /// Parameter [message] :
  /// The device state change event payload.
  ///
  /// This parameter will include the following three fields:
  ///
  /// <ul>
  /// <li>
  /// <code>uri</code>: <code>schema
  /// auc://&lt;PARTNER-DEVICE-ID&gt;/ResourcePath</code> (The
  /// <code>Resourcepath</code> corresponds to an OCF resource.)
  /// </li>
  /// <li>
  /// <code>op</code>: For device state changes, this field must populate as
  /// <code>n+d</code>.
  /// </li>
  /// <li>
  /// <code>cn</code>: The content depends on the OCF resource referenced in
  /// <code>ResourcePath</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [operationVersion] :
  /// The Open Connectivity Foundation (OCF) security specification version for
  /// the operation being requested on the managed thing. For more information,
  /// see <a
  /// href="https://openconnectivity.org/specs/OCF_Security_Specification_v1.0.0.pdf">OCF
  /// Security Specification</a>.
  ///
  /// Parameter [statusCode] :
  /// The status code of the Open Connectivity Foundation (OCF) operation being
  /// performed on the managed thing.
  ///
  /// Parameter [traceId] :
  /// The trace request identifier. This is generated by IoT managed
  /// integrations and can be used to trace this command and its related
  /// operations in CloudWatch.
  ///
  /// Parameter [userId] :
  /// The id of the third-party cloud provider.
  Future<SendConnectorEventResponse> sendConnectorEvent({
    required String connectorId,
    required ConnectorEventOperation operation,
    String? connectorDeviceId,
    String? deviceDiscoveryId,
    List<Device>? devices,
    MatterEndpoint? matterEndpoint,
    String? message,
    String? operationVersion,
    int? statusCode,
    String? traceId,
    String? userId,
  }) async {
    _s.validateNumRange(
      'statusCode',
      statusCode,
      100,
      550,
    );
    final $payload = <String, dynamic>{
      'Operation': operation.value,
      if (connectorDeviceId != null) 'ConnectorDeviceId': connectorDeviceId,
      if (deviceDiscoveryId != null) 'DeviceDiscoveryId': deviceDiscoveryId,
      if (devices != null) 'Devices': devices,
      if (matterEndpoint != null) 'MatterEndpoint': matterEndpoint,
      if (message != null) 'Message': message,
      if (operationVersion != null) 'OperationVersion': operationVersion,
      if (statusCode != null) 'StatusCode': statusCode,
      if (traceId != null) 'TraceId': traceId,
      if (userId != null) 'UserId': userId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/connector-event/${Uri.encodeComponent(connectorId)}',
      exceptionFnMap: _exceptionFns,
    );
    return SendConnectorEventResponse.fromJson(response);
  }

  /// Adds tags to a specified resource.
  ///
  /// May throw [ConflictException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to which to add tags.
  ///
  /// Parameter [tags] :
  /// A set of key/value pairs that are used to manage the resource.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes tags from a specified resource.
  ///
  /// May throw [ConflictException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource from which to remove tags.
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

  /// Creates a new account association via the destination id.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [connectorDestinationId] :
  /// The identifier of the connector destination.
  ///
  /// Parameter [clientToken] :
  /// An idempotency token. If you retry a request that completed successfully
  /// initially using the same client token and parameters, then the retry
  /// attempt will succeed without performing any further actions.
  ///
  /// Parameter [description] :
  /// A description of the account association request.
  ///
  /// Parameter [generalAuthorization] :
  /// The General Authorization reference by authorization material name.
  ///
  /// Parameter [name] :
  /// The name of the destination for the new account association.
  ///
  /// Parameter [tags] :
  /// A set of key/value pairs that are used to manage the account association.
  Future<CreateAccountAssociationResponse> createAccountAssociation({
    required String connectorDestinationId,
    String? clientToken,
    String? description,
    GeneralAuthorizationName? generalAuthorization,
    String? name,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'ConnectorDestinationId': connectorDestinationId,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'Description': description,
      if (generalAuthorization != null)
        'GeneralAuthorization': generalAuthorization,
      if (name != null) 'Name': name,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/account-associations',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAccountAssociationResponse.fromJson(response);
  }

  /// Get an account association for an Amazon Web Services account linked to a
  /// customer-managed destination.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accountAssociationId] :
  /// The unique identifier of the account association to retrieve.
  Future<GetAccountAssociationResponse> getAccountAssociation({
    required String accountAssociationId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/account-associations/${Uri.encodeComponent(accountAssociationId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetAccountAssociationResponse.fromJson(response);
  }

  /// Updates the properties of an existing account association.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accountAssociationId] :
  /// The unique identifier of the account association to update.
  ///
  /// Parameter [description] :
  /// The new description to assign to the account association.
  ///
  /// Parameter [name] :
  /// The new name to assign to the account association.
  Future<void> updateAccountAssociation({
    required String accountAssociationId,
    String? description,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/account-associations/${Uri.encodeComponent(accountAssociationId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Remove a third-party account association for an end user.
  /// <note>
  /// You must first call the <code>DeregisterAccountAssociation</code> to
  /// remove the connection between the managed thing and the third-party
  /// account before calling the <code>DeleteAccountAssociation</code> API.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accountAssociationId] :
  /// The unique identifier of the account association to be deleted.
  Future<void> deleteAccountAssociation({
    required String accountAssociationId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/account-associations/${Uri.encodeComponent(accountAssociationId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists all account associations, with optional filtering by connector
  /// destination ID.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [connectorDestinationId] :
  /// The identifier of the connector destination to filter account associations
  /// by.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of account associations to return in a single response.
  ///
  /// Parameter [nextToken] :
  /// A token used for pagination of results.
  Future<ListAccountAssociationsResponse> listAccountAssociations({
    String? connectorDestinationId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (connectorDestinationId != null)
        'ConnectorDestinationId': [connectorDestinationId],
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/account-associations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAccountAssociationsResponse.fromJson(response);
  }

  /// Initiates a refresh of an existing account association to update its
  /// authorization and connection status.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accountAssociationId] :
  /// The unique identifier of the account association to refresh.
  Future<StartAccountAssociationRefreshResponse>
      startAccountAssociationRefresh({
    required String accountAssociationId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/account-associations/${Uri.encodeComponent(accountAssociationId)}/refresh',
      exceptionFnMap: _exceptionFns,
    );
    return StartAccountAssociationRefreshResponse.fromJson(response);
  }

  /// Creates a C2C (cloud-to-cloud) connector.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [endpointConfig] :
  /// The configuration details for the cloud connector endpoint, including
  /// connection parameters and authentication requirements.
  ///
  /// Parameter [name] :
  /// The display name of the C2C connector.
  ///
  /// Parameter [clientToken] :
  /// An idempotency token. If you retry a request that completed successfully
  /// initially using the same client token and parameters, then the retry
  /// attempt will succeed without performing any further actions.
  ///
  /// Parameter [description] :
  /// A description of the C2C connector.
  ///
  /// Parameter [endpointType] :
  /// The type of endpoint used for the cloud connector, which defines how the
  /// connector communicates with external services.
  Future<CreateCloudConnectorResponse> createCloudConnector({
    required EndpointConfig endpointConfig,
    required String name,
    String? clientToken,
    String? description,
    EndpointType? endpointType,
  }) async {
    final $payload = <String, dynamic>{
      'EndpointConfig': endpointConfig,
      'Name': name,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'Description': description,
      if (endpointType != null) 'EndpointType': endpointType.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/cloud-connectors',
      exceptionFnMap: _exceptionFns,
    );
    return CreateCloudConnectorResponse.fromJson(response);
  }

  /// Get configuration details for a cloud connector.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// The identifier of the C2C connector.
  Future<GetCloudConnectorResponse> getCloudConnector({
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/cloud-connectors/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetCloudConnectorResponse.fromJson(response);
  }

  /// Update an existing cloud connector.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the cloud connector to update.
  ///
  /// Parameter [description] :
  /// The new description to assign to the cloud connector.
  ///
  /// Parameter [name] :
  /// The new display name to assign to the cloud connector.
  Future<void> updateCloudConnector({
    required String identifier,
    String? description,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/cloud-connectors/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Delete a cloud connector.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// The identifier of the cloud connector.
  Future<void> deleteCloudConnector({
    required String identifier,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/cloud-connectors/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns a list of connectors filtered by its Lambda Amazon Resource Name
  /// (ARN) and <code>type</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [lambdaArn] :
  /// The Amazon Resource Name (ARN) of the Lambda function to filter cloud
  /// connectors by.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [nextToken] :
  /// A token that can be used to retrieve the next set of results.
  ///
  /// Parameter [type] :
  /// The type of cloud connectors to filter by when listing available
  /// connectors.
  Future<ListCloudConnectorsResponse> listCloudConnectors({
    String? lambdaArn,
    int? maxResults,
    String? nextToken,
    CloudConnectorType? type,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (lambdaArn != null) 'LambdaArn': [lambdaArn],
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
      if (type != null) 'Type': [type.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/cloud-connectors',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCloudConnectorsResponse.fromJson(response);
  }

  /// Create a connector destination for connecting a cloud-to-cloud (C2C)
  /// connector to the customer's Amazon Web Services account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [authConfig] :
  /// The authentication configuration details for the connector destination,
  /// including OAuth settings and other authentication parameters.
  ///
  /// Parameter [cloudConnectorId] :
  /// The identifier of the C2C connector.
  ///
  /// Parameter [authType] :
  /// The authentication type used for the connector destination, which
  /// determines how credentials and access are managed.
  ///
  /// Parameter [clientToken] :
  /// An idempotency token. If you retry a request that completed successfully
  /// initially using the same client token and parameters, then the retry
  /// attempt will succeed without performing any further actions.
  ///
  /// Parameter [description] :
  /// A description of the connector destination.
  ///
  /// Parameter [name] :
  /// The display name of the connector destination.
  ///
  /// Parameter [secretsManager] :
  /// The AWS Secrets Manager configuration used to securely store and manage
  /// sensitive information for the connector destination.
  Future<CreateConnectorDestinationResponse> createConnectorDestination({
    required AuthConfig authConfig,
    required String cloudConnectorId,
    AuthType? authType,
    String? clientToken,
    String? description,
    String? name,
    SecretsManager? secretsManager,
  }) async {
    final $payload = <String, dynamic>{
      'AuthConfig': authConfig,
      'CloudConnectorId': cloudConnectorId,
      if (authType != null) 'AuthType': authType.value,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
      if (secretsManager != null) 'SecretsManager': secretsManager,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/connector-destinations',
      exceptionFnMap: _exceptionFns,
    );
    return CreateConnectorDestinationResponse.fromJson(response);
  }

  /// Get connector destination details linked to a cloud-to-cloud (C2C)
  /// connector.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// The identifier of the C2C connector destination.
  Future<GetConnectorDestinationResponse> getConnectorDestination({
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/connector-destinations/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetConnectorDestinationResponse.fromJson(response);
  }

  /// Updates the properties of an existing connector destination.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the connector destination to update.
  ///
  /// Parameter [authConfig] :
  /// The updated authentication configuration details for the connector
  /// destination.
  ///
  /// Parameter [authType] :
  /// The new authentication type to use for the connector destination.
  ///
  /// Parameter [description] :
  /// The new description to assign to the connector destination.
  ///
  /// Parameter [name] :
  /// The new display name to assign to the connector destination.
  ///
  /// Parameter [secretsManager] :
  /// The updated AWS Secrets Manager configuration for the connector
  /// destination.
  Future<void> updateConnectorDestination({
    required String identifier,
    AuthConfigUpdate? authConfig,
    AuthType? authType,
    String? description,
    String? name,
    SecretsManager? secretsManager,
  }) async {
    final $payload = <String, dynamic>{
      if (authConfig != null) 'AuthConfig': authConfig,
      if (authType != null) 'AuthType': authType.value,
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
      if (secretsManager != null) 'SecretsManager': secretsManager,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/connector-destinations/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Delete a connector destination linked to a cloud-to-cloud (C2C) connector.
  /// <note>
  /// Deletion can't be done if the account association has used this connector
  /// destination.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// The identifier of the connector destination.
  Future<void> deleteConnectorDestination({
    required String identifier,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/connector-destinations/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists all connector destinations, with optional filtering by cloud
  /// connector ID.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [cloudConnectorId] :
  /// The identifier of the cloud connector to filter connector destinations by.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of connector destinations to return in a single
  /// response.
  ///
  /// Parameter [nextToken] :
  /// A token used for pagination of results.
  Future<ListConnectorDestinationsResponse> listConnectorDestinations({
    String? cloudConnectorId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (cloudConnectorId != null) 'CloudConnectorId': [cloudConnectorId],
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/connector-destinations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListConnectorDestinationsResponse.fromJson(response);
  }

  /// Create a credential locker.
  /// <note>
  /// This operation will not trigger the creation of all the manufacturing
  /// resources.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [clientToken] :
  /// An idempotency token. If you retry a request that completed successfully
  /// initially using the same client token and parameters, then the retry
  /// attempt will succeed without performing any further actions.
  ///
  /// Parameter [name] :
  /// The name of the credential locker.
  ///
  /// Parameter [tags] :
  /// A set of key/value pairs that are used to manage the credential locker.
  Future<CreateCredentialLockerResponse> createCredentialLocker({
    String? clientToken,
    String? name,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (name != null) 'Name': name,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/credential-lockers',
      exceptionFnMap: _exceptionFns,
    );
    return CreateCredentialLockerResponse.fromJson(response);
  }

  /// Get information on an existing credential locker
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// The identifier of the credential locker.
  Future<GetCredentialLockerResponse> getCredentialLocker({
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/credential-lockers/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetCredentialLockerResponse.fromJson(response);
  }

  /// Delete a credential locker.
  /// <note>
  /// This operation can't be undone and any existing device won't be able to
  /// use IoT managed integrations.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// The identifier of the credential locker.
  Future<void> deleteCredentialLocker({
    required String identifier,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/credential-lockers/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// List information on an existing credential locker.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [nextToken] :
  /// A token that can be used to retrieve the next set of results.
  Future<ListCredentialLockersResponse> listCredentialLockers({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/credential-lockers',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCredentialLockersResponse.fromJson(response);
  }

  /// Create a notification destination such as Kinesis Data Streams that
  /// receive events and notifications from Managed integrations. Managed
  /// integrations uses the destination to determine where to deliver
  /// notifications.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [deliveryDestinationArn] :
  /// The Amazon Resource Name (ARN) of the customer-managed destination.
  ///
  /// Parameter [deliveryDestinationType] :
  /// The destination type for the customer-managed destination.
  ///
  /// Parameter [name] :
  /// The name of the customer-managed destination.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the delivery destination role.
  ///
  /// Parameter [clientToken] :
  /// An idempotency token. If you retry a request that completed successfully
  /// initially using the same client token and parameters, then the retry
  /// attempt will succeed without performing any further actions.
  ///
  /// Parameter [description] :
  /// The description of the customer-managed destination.
  ///
  /// Parameter [tags] :
  /// A set of key/value pairs that are used to manage the destination.
  Future<CreateDestinationResponse> createDestination({
    required String deliveryDestinationArn,
    required DeliveryDestinationType deliveryDestinationType,
    required String name,
    required String roleArn,
    String? clientToken,
    String? description,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'DeliveryDestinationArn': deliveryDestinationArn,
      'DeliveryDestinationType': deliveryDestinationType.value,
      'Name': name,
      'RoleArn': roleArn,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'Description': description,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/destinations',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDestinationResponse.fromJson(response);
  }

  /// Deletes a notification destination specified by name.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The id of the customer-managed destination.
  Future<void> deleteDestination({
    required String name,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/destinations/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets a destination by name.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the customer-managed destination.
  Future<GetDestinationResponse> getDestination({
    required String name,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/destinations/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDestinationResponse.fromJson(response);
  }

  /// List all notification destinations.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [nextToken] :
  /// A token that can be used to retrieve the next set of results.
  Future<ListDestinationsResponse> listDestinations({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/destinations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDestinationsResponse.fromJson(response);
  }

  /// Update a destination specified by name.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the customer-managed destination.
  ///
  /// Parameter [deliveryDestinationArn] :
  /// The Amazon Resource Name (ARN) of the customer-managed destination.
  ///
  /// Parameter [deliveryDestinationType] :
  /// The destination type for the customer-managed destination.
  ///
  /// Parameter [description] :
  /// The description of the customer-managed destination.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the delivery destination role.
  Future<void> updateDestination({
    required String name,
    String? deliveryDestinationArn,
    DeliveryDestinationType? deliveryDestinationType,
    String? description,
    String? roleArn,
  }) async {
    final $payload = <String, dynamic>{
      if (deliveryDestinationArn != null)
        'DeliveryDestinationArn': deliveryDestinationArn,
      if (deliveryDestinationType != null)
        'DeliveryDestinationType': deliveryDestinationType.value,
      if (description != null) 'Description': description,
      if (roleArn != null) 'RoleArn': roleArn,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/destinations/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This API is used to start device discovery for hub-connected and
  /// third-party-connected devices. The authentication material (install code)
  /// is delivered as a message to the controller instructing it to start the
  /// discovery.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [discoveryType] :
  /// The discovery type supporting the type of device to be discovered in the
  /// device discovery task request.
  ///
  /// Parameter [accountAssociationId] :
  /// The identifier of the cloud-to-cloud account association to use for
  /// discovery of third-party devices.
  ///
  /// Parameter [authenticationMaterial] :
  /// The authentication material required to start the local device discovery
  /// job request.
  ///
  /// Parameter [authenticationMaterialType] :
  /// The type of authentication material used for device discovery jobs.
  ///
  /// Parameter [clientToken] :
  /// An idempotency token. If you retry a request that completed successfully
  /// initially using the same client token and parameters, then the retry
  /// attempt will succeed without performing any further actions.
  ///
  /// Parameter [connectorAssociationIdentifier] :
  /// The id of the connector association.
  ///
  /// Parameter [connectorDeviceIdList] :
  /// Used as a filter for PLA discoveries.
  ///
  /// Parameter [controllerIdentifier] :
  /// The id of the end-user's IoT hub.
  ///
  /// Parameter [customProtocolDetail] :
  /// Additional protocol-specific details required for device discovery, which
  /// vary based on the discovery type.
  /// <note>
  /// For a <code>DiscoveryType</code> of <code>CUSTOM</code>, the
  /// string-to-string map must have a key value of <code>Name</code> set to a
  /// non-empty-string.
  /// </note>
  ///
  /// Parameter [endDeviceIdentifier] :
  /// The unique id of the end device for capability rediscovery.
  /// <note>
  /// This parameter is only available when the discovery type is
  /// CONTROLLER_CAPABILITY_REDISCOVERY.
  /// </note>
  ///
  /// Parameter [protocol] :
  /// The protocol type for capability rediscovery (ZWAVE, ZIGBEE, or CUSTOM).
  /// <note>
  /// This parameter is only available when the discovery type is
  /// CONTROLLER_CAPABILITY_REDISCOVERY.
  /// </note>
  ///
  /// Parameter [tags] :
  /// A set of key/value pairs that are used to manage the device discovery
  /// request.
  Future<StartDeviceDiscoveryResponse> startDeviceDiscovery({
    required DiscoveryType discoveryType,
    String? accountAssociationId,
    String? authenticationMaterial,
    DiscoveryAuthMaterialType? authenticationMaterialType,
    String? clientToken,
    String? connectorAssociationIdentifier,
    List<String>? connectorDeviceIdList,
    String? controllerIdentifier,
    Map<String, String>? customProtocolDetail,
    String? endDeviceIdentifier,
    ProtocolType? protocol,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'DiscoveryType': discoveryType.value,
      if (accountAssociationId != null)
        'AccountAssociationId': accountAssociationId,
      if (authenticationMaterial != null)
        'AuthenticationMaterial': authenticationMaterial,
      if (authenticationMaterialType != null)
        'AuthenticationMaterialType': authenticationMaterialType.value,
      if (clientToken != null) 'ClientToken': clientToken,
      if (connectorAssociationIdentifier != null)
        'ConnectorAssociationIdentifier': connectorAssociationIdentifier,
      if (connectorDeviceIdList != null)
        'ConnectorDeviceIdList': connectorDeviceIdList,
      if (controllerIdentifier != null)
        'ControllerIdentifier': controllerIdentifier,
      if (customProtocolDetail != null)
        'CustomProtocolDetail': customProtocolDetail,
      if (endDeviceIdentifier != null)
        'EndDeviceIdentifier': endDeviceIdentifier,
      if (protocol != null) 'Protocol': protocol.value,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/device-discoveries',
      exceptionFnMap: _exceptionFns,
    );
    return StartDeviceDiscoveryResponse.fromJson(response);
  }

  /// Get the current state of a device discovery.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// The id of the device discovery job request.
  Future<GetDeviceDiscoveryResponse> getDeviceDiscovery({
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/device-discoveries/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDeviceDiscoveryResponse.fromJson(response);
  }

  /// Lists all device discovery tasks, with optional filtering by type and
  /// status.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of device discovery jobs to return in a single
  /// response.
  ///
  /// Parameter [nextToken] :
  /// A token used for pagination of results.
  ///
  /// Parameter [statusFilter] :
  /// The status to filter device discovery jobs by.
  ///
  /// Parameter [typeFilter] :
  /// The discovery type to filter device discovery jobs by.
  Future<ListDeviceDiscoveriesResponse> listDeviceDiscoveries({
    int? maxResults,
    String? nextToken,
    DeviceDiscoveryStatus? statusFilter,
    DiscoveryType? typeFilter,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
      if (statusFilter != null) 'StatusFilter': [statusFilter.value],
      if (typeFilter != null) 'TypeFilter': [typeFilter.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/device-discoveries',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDeviceDiscoveriesResponse.fromJson(response);
  }

  /// Lists all devices discovered during a specific device discovery task.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// The identifier of the device discovery job to list discovered devices for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of discovered devices to return in a single response.
  ///
  /// Parameter [nextToken] :
  /// A token used for pagination of results.
  Future<ListDiscoveredDevicesResponse> listDiscoveredDevices({
    required String identifier,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/device-discoveries/${Uri.encodeComponent(identifier)}/devices',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDiscoveredDevicesResponse.fromJson(response);
  }

  /// Set the event log configuration for the account, resource type, or
  /// specific resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [eventLogLevel] :
  /// The logging level for the event log configuration.
  ///
  /// Parameter [resourceType] :
  /// The type of resource for the event log configuration.
  ///
  /// Parameter [clientToken] :
  /// An idempotency token. If you retry a request that completed successfully
  /// initially using the same client token and parameters, then the retry
  /// attempt will succeed without performing any further actions.
  ///
  /// Parameter [resourceId] :
  /// The identifier of the resource for the event log configuration.
  Future<CreateEventLogConfigurationResponse> createEventLogConfiguration({
    required LogLevel eventLogLevel,
    required String resourceType,
    String? clientToken,
    String? resourceId,
  }) async {
    final $payload = <String, dynamic>{
      'EventLogLevel': eventLogLevel.value,
      'ResourceType': resourceType,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (resourceId != null) 'ResourceId': resourceId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/event-log-configurations',
      exceptionFnMap: _exceptionFns,
    );
    return CreateEventLogConfigurationResponse.fromJson(response);
  }

  /// Delete an event log configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The identifier of the event log configuration.
  Future<void> deleteEventLogConfiguration({
    required String id,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/event-log-configurations/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Get an event log configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The identifier of the event log configuration.
  Future<GetEventLogConfigurationResponse> getEventLogConfiguration({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/event-log-configurations/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetEventLogConfigurationResponse.fromJson(response);
  }

  /// List all event log configurations for an account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [nextToken] :
  /// A token that can be used to retrieve the next set of results.
  Future<ListEventLogConfigurationsResponse> listEventLogConfigurations({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/event-log-configurations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListEventLogConfigurationsResponse.fromJson(response);
  }

  /// Update an event log configuration by log configuration ID.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [eventLogLevel] :
  /// The log level for the event in terms of severity.
  ///
  /// Parameter [id] :
  /// The log configuration id.
  Future<void> updateEventLogConfiguration({
    required LogLevel eventLogLevel,
    required String id,
  }) async {
    final $payload = <String, dynamic>{
      'EventLogLevel': eventLogLevel.value,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/event-log-configurations/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Get a hub configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<GetHubConfigurationResponse> getHubConfiguration() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/hub-configuration',
      exceptionFnMap: _exceptionFns,
    );
    return GetHubConfigurationResponse.fromJson(response);
  }

  /// Update a hub configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [hubTokenTimerExpirySettingInSeconds] :
  /// A user-defined integer value that represents the hub token timer expiry
  /// setting in seconds.
  Future<PutHubConfigurationResponse> putHubConfiguration({
    required int hubTokenTimerExpirySettingInSeconds,
  }) async {
    _s.validateNumRange(
      'hubTokenTimerExpirySettingInSeconds',
      hubTokenTimerExpirySettingInSeconds,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'HubTokenTimerExpirySettingInSeconds':
          hubTokenTimerExpirySettingInSeconds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/hub-configuration',
      exceptionFnMap: _exceptionFns,
    );
    return PutHubConfigurationResponse.fromJson(response);
  }

  /// Retrieves information about the default encryption configuration for the
  /// Amazon Web Services account in the default or specified region. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/key-management.html">Key
  /// management</a> in the <i>AWS IoT SiteWise User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  Future<GetDefaultEncryptionConfigurationResponse>
      getDefaultEncryptionConfiguration() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/configuration/account/encryption',
      exceptionFnMap: _exceptionFns,
    );
    return GetDefaultEncryptionConfigurationResponse.fromJson(response);
  }

  /// Sets the default encryption configuration for the Amazon Web Services
  /// account. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/key-management.html">Key
  /// management</a> in the AWS IoT SiteWise User Guide.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [encryptionType] :
  /// The type of encryption used for the encryption configuration.
  ///
  /// Parameter [kmsKeyArn] :
  /// The Key Amazon Resource Name (ARN) of the AWS KMS key used for KMS
  /// encryption if you use <code>KMS_BASED_ENCRYPTION</code>.
  Future<PutDefaultEncryptionConfigurationResponse>
      putDefaultEncryptionConfiguration({
    required EncryptionType encryptionType,
    String? kmsKeyArn,
  }) async {
    final $payload = <String, dynamic>{
      'encryptionType': encryptionType.value,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/configuration/account/encryption',
      exceptionFnMap: _exceptionFns,
    );
    return PutDefaultEncryptionConfigurationResponse.fromJson(response);
  }

  /// Deregister an account association from a managed thing.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accountAssociationId] :
  /// The unique identifier of the account association to be deregistered.
  ///
  /// Parameter [managedThingId] :
  /// The identifier of the managed thing to be deregistered from the account
  /// association.
  Future<void> deregisterAccountAssociation({
    required String accountAssociationId,
    required String managedThingId,
  }) async {
    final $payload = <String, dynamic>{
      'AccountAssociationId': accountAssociationId,
      'ManagedThingId': managedThingId,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/managed-thing-associations/deregister',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists all account associations for a specific managed thing.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accountAssociationId] :
  /// The identifier of the account association to filter results by. When
  /// specified, only associations with this account association ID will be
  /// returned.
  ///
  /// Parameter [managedThingId] :
  /// The identifier of the managed thing to list account associations for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of account associations to return in a single response.
  ///
  /// Parameter [nextToken] :
  /// A token used for pagination of results.
  Future<ListManagedThingAccountAssociationsResponse>
      listManagedThingAccountAssociations({
    String? accountAssociationId,
    String? managedThingId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (accountAssociationId != null)
        'AccountAssociationId': [accountAssociationId],
      if (managedThingId != null) 'ManagedThingId': [managedThingId],
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/managed-thing-associations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListManagedThingAccountAssociationsResponse.fromJson(response);
  }

  /// Registers an account association with a managed thing, establishing a
  /// connection between a device and a third-party account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accountAssociationId] :
  /// The identifier of the account association to register with the managed
  /// thing.
  ///
  /// Parameter [deviceDiscoveryId] :
  /// The identifier of the device discovery job associated with this
  /// registration.
  ///
  /// Parameter [managedThingId] :
  /// The identifier of the managed thing to register with the account
  /// association.
  Future<RegisterAccountAssociationResponse> registerAccountAssociation({
    required String accountAssociationId,
    required String deviceDiscoveryId,
    required String managedThingId,
  }) async {
    final $payload = <String, dynamic>{
      'AccountAssociationId': accountAssociationId,
      'DeviceDiscoveryId': deviceDiscoveryId,
      'ManagedThingId': managedThingId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/managed-thing-associations/register',
      exceptionFnMap: _exceptionFns,
    );
    return RegisterAccountAssociationResponse.fromJson(response);
  }

  /// Send the command to the device represented by the managed thing.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [endpoints] :
  /// The device endpoint.
  ///
  /// Parameter [managedThingId] :
  /// The id of the device.
  ///
  /// Parameter [accountAssociationId] :
  /// The identifier of the account association to use when sending a command to
  /// a managed thing.
  ///
  /// Parameter [connectorAssociationId] :
  /// The ID tracking the current discovery process for one connector
  /// association.
  Future<SendManagedThingCommandResponse> sendManagedThingCommand({
    required List<CommandEndpoint> endpoints,
    required String managedThingId,
    String? accountAssociationId,
    String? connectorAssociationId,
  }) async {
    final $payload = <String, dynamic>{
      'Endpoints': endpoints,
      if (accountAssociationId != null)
        'AccountAssociationId': accountAssociationId,
      if (connectorAssociationId != null)
        'ConnectorAssociationId': connectorAssociationId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/managed-things-command/${Uri.encodeComponent(managedThingId)}',
      exceptionFnMap: _exceptionFns,
    );
    return SendManagedThingCommandResponse.fromJson(response);
  }

  /// Creates a managed thing. A managed thing contains the device identifier,
  /// protocol supported, and capabilities of the device in a data model format
  /// defined by Managed integrations.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [authenticationMaterial] :
  /// The authentication material defining the device connectivity setup
  /// requests. The authorization materials used are the device bar code.
  ///
  /// Parameter [authenticationMaterialType] :
  /// The type of authentication material used for device connectivity setup
  /// requests.
  ///
  /// Parameter [role] :
  /// The type of device used. This will be the hub controller, cloud device, or
  /// AWS IoT device.
  ///
  /// Parameter [brand] :
  /// The brand of the device.
  ///
  /// Parameter [capabilities] :
  /// The capabilities of the device such as light bulb.
  ///
  /// Parameter [capabilityReport] :
  /// A report of the capabilities for the managed thing.
  ///
  /// Parameter [capabilitySchemas] :
  /// The capability schemas that define the functionality and features
  /// supported by the managed thing, including device capabilities and their
  /// associated properties.
  ///
  /// Parameter [classification] :
  /// The classification of the managed thing such as light bulb or thermostat.
  ///
  /// Parameter [clientToken] :
  /// An idempotency token. If you retry a request that completed successfully
  /// initially using the same client token and parameters, then the retry
  /// attempt will succeed without performing any further actions.
  ///
  /// Parameter [credentialLockerId] :
  /// The identifier of the credential for the managed thing.
  ///
  /// Parameter [metaData] :
  /// The metadata for the managed thing.
  /// <note>
  /// The <code>managedThing</code> <code>metadata</code> parameter is used for
  /// associating attributes with a <code>managedThing</code> that can be used
  /// for grouping over-the-air (OTA) tasks. Name value pairs in
  /// <code>metadata</code> can be used in the <code>OtaTargetQueryString</code>
  /// parameter for the <code>CreateOtaTask</code> API operation.
  /// </note>
  ///
  /// Parameter [model] :
  /// The model of the device.
  ///
  /// Parameter [name] :
  /// The name of the managed thing representing the physical device.
  ///
  /// Parameter [owner] :
  /// Owner of the device, usually an indication of whom the device belongs to.
  /// This value should not contain personal identifiable information.
  ///
  /// Parameter [serialNumber] :
  /// The serial number of the device.
  ///
  /// Parameter [tags] :
  /// A set of key/value pairs that are used to manage the managed thing.
  ///
  /// Parameter [wiFiSimpleSetupConfiguration] :
  /// The Wi-Fi Simple Setup configuration for the managed thing, which defines
  /// provisioning capabilities and timeout settings.
  Future<CreateManagedThingResponse> createManagedThing({
    required String authenticationMaterial,
    required AuthMaterialType authenticationMaterialType,
    required Role role,
    String? brand,
    String? capabilities,
    CapabilityReport? capabilityReport,
    List<CapabilitySchemaItem>? capabilitySchemas,
    String? classification,
    String? clientToken,
    String? credentialLockerId,
    Map<String, String>? metaData,
    String? model,
    String? name,
    String? owner,
    String? serialNumber,
    Map<String, String>? tags,
    WiFiSimpleSetupConfiguration? wiFiSimpleSetupConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      'AuthenticationMaterial': authenticationMaterial,
      'AuthenticationMaterialType': authenticationMaterialType.value,
      'Role': role.value,
      if (brand != null) 'Brand': brand,
      if (capabilities != null) 'Capabilities': capabilities,
      if (capabilityReport != null) 'CapabilityReport': capabilityReport,
      if (capabilitySchemas != null) 'CapabilitySchemas': capabilitySchemas,
      if (classification != null) 'Classification': classification,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (credentialLockerId != null) 'CredentialLockerId': credentialLockerId,
      if (metaData != null) 'MetaData': metaData,
      if (model != null) 'Model': model,
      if (name != null) 'Name': name,
      if (owner != null) 'Owner': owner,
      if (serialNumber != null) 'SerialNumber': serialNumber,
      if (tags != null) 'Tags': tags,
      if (wiFiSimpleSetupConfiguration != null)
        'WiFiSimpleSetupConfiguration': wiFiSimpleSetupConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/managed-things',
      exceptionFnMap: _exceptionFns,
    );
    return CreateManagedThingResponse.fromJson(response);
  }

  /// Get details of a managed thing including its attributes and capabilities.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// The id of the managed thing.
  Future<GetManagedThingResponse> getManagedThing({
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/managed-things/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetManagedThingResponse.fromJson(response);
  }

  /// Update the attributes and capabilities associated with a managed thing.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// The id of the managed thing.
  ///
  /// Parameter [brand] :
  /// The brand of the device.
  ///
  /// Parameter [capabilities] :
  /// The capabilities of the device such as light bulb.
  ///
  /// Parameter [capabilityReport] :
  /// A report of the capabilities for the managed thing.
  ///
  /// Parameter [capabilitySchemas] :
  /// The updated capability schemas that define the functionality and features
  /// supported by the managed thing.
  ///
  /// Parameter [classification] :
  /// The classification of the managed thing such as light bulb or thermostat.
  ///
  /// Parameter [credentialLockerId] :
  /// The identifier of the credential for the managed thing.
  ///
  /// Parameter [hubNetworkMode] :
  /// The network mode for the hub-connected device.
  ///
  /// Parameter [metaData] :
  /// The metadata for the managed thing.
  ///
  /// Parameter [model] :
  /// The model of the device.
  ///
  /// Parameter [name] :
  /// The name of the managed thing representing the physical device.
  ///
  /// Parameter [owner] :
  /// Owner of the device, usually an indication of whom the device belongs to.
  /// This value should not contain personal identifiable information.
  ///
  /// Parameter [serialNumber] :
  /// The serial number of the device.
  ///
  /// Parameter [wiFiSimpleSetupConfiguration] :
  /// The Wi-Fi Simple Setup configuration for the managed thing, which defines
  /// provisioning capabilities and timeout settings.
  Future<void> updateManagedThing({
    required String identifier,
    String? brand,
    String? capabilities,
    CapabilityReport? capabilityReport,
    List<CapabilitySchemaItem>? capabilitySchemas,
    String? classification,
    String? credentialLockerId,
    HubNetworkMode? hubNetworkMode,
    Map<String, String>? metaData,
    String? model,
    String? name,
    String? owner,
    String? serialNumber,
    WiFiSimpleSetupConfiguration? wiFiSimpleSetupConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      if (brand != null) 'Brand': brand,
      if (capabilities != null) 'Capabilities': capabilities,
      if (capabilityReport != null) 'CapabilityReport': capabilityReport,
      if (capabilitySchemas != null) 'CapabilitySchemas': capabilitySchemas,
      if (classification != null) 'Classification': classification,
      if (credentialLockerId != null) 'CredentialLockerId': credentialLockerId,
      if (hubNetworkMode != null) 'HubNetworkMode': hubNetworkMode.value,
      if (metaData != null) 'MetaData': metaData,
      if (model != null) 'Model': model,
      if (name != null) 'Name': name,
      if (owner != null) 'Owner': owner,
      if (serialNumber != null) 'SerialNumber': serialNumber,
      if (wiFiSimpleSetupConfiguration != null)
        'WiFiSimpleSetupConfiguration': wiFiSimpleSetupConfiguration,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/managed-things/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Delete a managed thing. For direct-connected and hub-connected devices
  /// connecting with Managed integrations via a controller, all of the devices
  /// connected to it will have their status changed to <code>PENDING</code>. It
  /// is not possible to remove a cloud-to-cloud device.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// The id of the managed thing.
  ///
  /// Parameter [force] :
  /// When set to <code>TRUE</code>, a forceful deteletion of the managed thing
  /// will occur. When set to <code>FALSE</code>, a non-forceful deletion of the
  /// managed thing will occur.
  Future<void> deleteManagedThing({
    required String identifier,
    bool? force,
  }) async {
    final $query = <String, List<String>>{
      if (force != null) 'Force': [force.toString()],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/managed-things/${Uri.encodeComponent(identifier)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Listing all managed things with provision for filters.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [connectorDestinationIdFilter] :
  /// Filter managed things by the connector destination ID they are associated
  /// with.
  ///
  /// Parameter [connectorDeviceIdFilter] :
  /// Filter managed things by the connector device ID they are associated with.
  /// When specified, only managed things with this connector device ID will be
  /// returned.
  ///
  /// Parameter [connectorPolicyIdFilter] :
  /// Filter on a connector policy id for a managed thing.
  ///
  /// Parameter [credentialLockerFilter] :
  /// Filter on a credential locker for a managed thing.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [nextToken] :
  /// A token that can be used to retrieve the next set of results.
  ///
  /// Parameter [ownerFilter] :
  /// Filter on device owners when listing managed things.
  ///
  /// Parameter [parentControllerIdentifierFilter] :
  /// Filter on a parent controller id for a managed thing.
  ///
  /// Parameter [provisioningStatusFilter] :
  /// Filter on the status of the device. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-mi/latest/devguide/device-provisioning.html">Device
  /// Provisioning</a>.
  ///
  /// Parameter [roleFilter] :
  /// Filter on the type of device used. This will be the Amazon Web Services
  /// hub controller, cloud device, or IoT device.
  ///
  /// Parameter [serialNumberFilter] :
  /// Filter on the serial number of the device.
  Future<ListManagedThingsResponse> listManagedThings({
    String? connectorDestinationIdFilter,
    String? connectorDeviceIdFilter,
    String? connectorPolicyIdFilter,
    String? credentialLockerFilter,
    int? maxResults,
    String? nextToken,
    String? ownerFilter,
    String? parentControllerIdentifierFilter,
    ProvisioningStatus? provisioningStatusFilter,
    Role? roleFilter,
    String? serialNumberFilter,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (connectorDestinationIdFilter != null)
        'ConnectorDestinationIdFilter': [connectorDestinationIdFilter],
      if (connectorDeviceIdFilter != null)
        'ConnectorDeviceIdFilter': [connectorDeviceIdFilter],
      if (connectorPolicyIdFilter != null)
        'ConnectorPolicyIdFilter': [connectorPolicyIdFilter],
      if (credentialLockerFilter != null)
        'CredentialLockerFilter': [credentialLockerFilter],
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
      if (ownerFilter != null) 'OwnerFilter': [ownerFilter],
      if (parentControllerIdentifierFilter != null)
        'ParentControllerIdentifierFilter': [parentControllerIdentifierFilter],
      if (provisioningStatusFilter != null)
        'ProvisioningStatusFilter': [provisioningStatusFilter.value],
      if (roleFilter != null) 'RoleFilter': [roleFilter.value],
      if (serialNumberFilter != null)
        'SerialNumberFilter': [serialNumberFilter],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/managed-things',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListManagedThingsResponse.fromJson(response);
  }

  /// Get the capabilities for a managed thing using the device ID.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// The id of the device.
  Future<GetManagedThingCapabilitiesResponse> getManagedThingCapabilities({
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/managed-things-capabilities/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetManagedThingCapabilitiesResponse.fromJson(response);
  }

  /// Retrieves the certificate PEM for a managed IoT thing.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// The identifier of the managed thing.
  Future<GetManagedThingCertificateResponse> getManagedThingCertificate({
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/managed-things-certificate/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetManagedThingCertificateResponse.fromJson(response);
  }

  /// Get the connectivity status of a managed thing.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// The identifier of a managed thing.
  Future<GetManagedThingConnectivityDataResponse>
      getManagedThingConnectivityData({
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/managed-things-connectivity-data/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetManagedThingConnectivityDataResponse.fromJson(response);
  }

  /// Get the metadata information for a managed thing.
  /// <note>
  /// The <code>managedThing</code> <code>metadata</code> parameter is used for
  /// associating attributes with a <code>managedThing</code> that can be used
  /// for grouping over-the-air (OTA) tasks. Name value pairs in
  /// <code>metadata</code> can be used in the <code>OtaTargetQueryString</code>
  /// parameter for the <code>CreateOtaTask</code> API operation.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// The managed thing id.
  Future<GetManagedThingMetaDataResponse> getManagedThingMetaData({
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/managed-things-metadata/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetManagedThingMetaDataResponse.fromJson(response);
  }

  /// List schemas associated with a managed thing.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// The managed thing id.
  ///
  /// Parameter [capabilityIdFilter] :
  /// Filter on a capability id.
  ///
  /// Parameter [endpointIdFilter] :
  /// Filter on an endpoint id.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [nextToken] :
  /// A token that can be used to retrieve the next set of results.
  Future<ListManagedThingSchemasResponse> listManagedThingSchemas({
    required String identifier,
    String? capabilityIdFilter,
    String? endpointIdFilter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (capabilityIdFilter != null)
        'CapabilityIdFilter': [capabilityIdFilter],
      if (endpointIdFilter != null) 'EndpointIdFilter': [endpointIdFilter],
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/managed-thing-schemas/${Uri.encodeComponent(identifier)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListManagedThingSchemasResponse.fromJson(response);
  }

  /// Returns the managed thing state for the given device Id.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [managedThingId] :
  /// The id of the device.
  Future<GetManagedThingStateResponse> getManagedThingState({
    required String managedThingId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/managed-thing-states/${Uri.encodeComponent(managedThingId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetManagedThingStateResponse.fromJson(response);
  }

  /// Creates a notification configuration. A configuration is a connection
  /// between an event type and a destination that you have already created.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [destinationName] :
  /// The name of the destination for the notification configuration.
  ///
  /// Parameter [eventType] :
  /// The type of event triggering a device notification to the customer-managed
  /// destination.
  ///
  /// Parameter [clientToken] :
  /// An idempotency token. If you retry a request that completed successfully
  /// initially using the same client token and parameters, then the retry
  /// attempt will succeed without performing any further actions.
  ///
  /// Parameter [tags] :
  /// A set of key/value pairs that are used to manage the notification
  /// configuration.
  Future<CreateNotificationConfigurationResponse>
      createNotificationConfiguration({
    required String destinationName,
    required EventType eventType,
    String? clientToken,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'DestinationName': destinationName,
      'EventType': eventType.value,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/notification-configurations',
      exceptionFnMap: _exceptionFns,
    );
    return CreateNotificationConfigurationResponse.fromJson(response);
  }

  /// Deletes a notification configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [eventType] :
  /// The type of event triggering a device notification to the customer-managed
  /// destination.
  Future<void> deleteNotificationConfiguration({
    required EventType eventType,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/notification-configurations/${Uri.encodeComponent(eventType.value)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Get a notification configuration for a specified event type.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [eventType] :
  /// The type of event triggering a device notification to the customer-managed
  /// destination.
  Future<GetNotificationConfigurationResponse> getNotificationConfiguration({
    required EventType eventType,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/notification-configurations/${Uri.encodeComponent(eventType.value)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetNotificationConfigurationResponse.fromJson(response);
  }

  /// List all notification configurations.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [nextToken] :
  /// A token that can be used to retrieve the next set of results.
  Future<ListNotificationConfigurationsResponse>
      listNotificationConfigurations({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/notification-configurations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListNotificationConfigurationsResponse.fromJson(response);
  }

  /// Update a notification configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [destinationName] :
  /// The name of the destination for the notification configuration.
  ///
  /// Parameter [eventType] :
  /// The type of event triggering a device notification to the customer-managed
  /// destination.
  Future<void> updateNotificationConfiguration({
    required String destinationName,
    required EventType eventType,
  }) async {
    final $payload = <String, dynamic>{
      'DestinationName': destinationName,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/notification-configurations/${Uri.encodeComponent(eventType.value)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Create a configuraiton for the over-the-air (OTA) task.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [clientToken] :
  /// An idempotency token. If you retry a request that completed successfully
  /// initially using the same client token and parameters, then the retry
  /// attempt will succeed without performing any further actions.
  ///
  /// Parameter [description] :
  /// A description of the over-the-air (OTA) task configuration.
  ///
  /// Parameter [name] :
  /// The name of the over-the-air (OTA) task.
  ///
  /// Parameter [pushConfig] :
  /// Describes the type of configuration used for the over-the-air (OTA) task.
  Future<CreateOtaTaskConfigurationResponse> createOtaTaskConfiguration({
    String? clientToken,
    String? description,
    String? name,
    PushConfig? pushConfig,
  }) async {
    final $payload = <String, dynamic>{
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
      if (pushConfig != null) 'PushConfig': pushConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ota-task-configurations',
      exceptionFnMap: _exceptionFns,
    );
    return CreateOtaTaskConfigurationResponse.fromJson(response);
  }

  /// Delete the over-the-air (OTA) task configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// The identifier of the over-the-air (OTA) task configuration.
  Future<void> deleteOtaTaskConfiguration({
    required String identifier,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/ota-task-configurations/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Get a configuraiton for the over-the-air (OTA) task.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// The over-the-air (OTA) task configuration id.
  Future<GetOtaTaskConfigurationResponse> getOtaTaskConfiguration({
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/ota-task-configurations/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetOtaTaskConfigurationResponse.fromJson(response);
  }

  /// List all of the over-the-air (OTA) task configurations.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [nextToken] :
  /// A token that can be used to retrieve the next set of results.
  Future<ListOtaTaskConfigurationsResponse> listOtaTaskConfigurations({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/ota-task-configurations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListOtaTaskConfigurationsResponse.fromJson(response);
  }

  /// Create an over-the-air (OTA) task to target a device.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [otaType] :
  /// The frequency type for the over-the-air (OTA) task.
  ///
  /// Parameter [s3Url] :
  /// The URL to the Amazon S3 bucket where the over-the-air (OTA) task is
  /// stored.
  ///
  /// Parameter [clientToken] :
  /// An idempotency token. If you retry a request that completed successfully
  /// initially using the same client token and parameters, then the retry
  /// attempt will succeed without performing any further actions.
  ///
  /// Parameter [description] :
  /// The description of the over-the-air (OTA) task.
  ///
  /// Parameter [otaMechanism] :
  /// The deployment mechanism for the over-the-air (OTA) task.
  ///
  /// Parameter [otaTargetQueryString] :
  /// The query string to add things to the thing group.
  ///
  /// Parameter [protocol] :
  /// The connection protocol the over-the-air (OTA) task uses to update the
  /// device.
  ///
  /// Parameter [tags] :
  /// A set of key/value pairs that are used to manage the over-the-air (OTA)
  /// task.
  ///
  /// Parameter [target] :
  /// The device targeted for the over-the-air (OTA) task.
  ///
  /// Parameter [taskConfigurationId] :
  /// The identifier for the over-the-air (OTA) task configuration.
  Future<CreateOtaTaskResponse> createOtaTask({
    required OtaType otaType,
    required String s3Url,
    String? clientToken,
    String? description,
    OtaMechanism? otaMechanism,
    OtaTaskSchedulingConfig? otaSchedulingConfig,
    String? otaTargetQueryString,
    OtaTaskExecutionRetryConfig? otaTaskExecutionRetryConfig,
    OtaProtocol? protocol,
    Map<String, String>? tags,
    List<String>? target,
    String? taskConfigurationId,
  }) async {
    final $payload = <String, dynamic>{
      'OtaType': otaType.value,
      'S3Url': s3Url,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'Description': description,
      if (otaMechanism != null) 'OtaMechanism': otaMechanism.value,
      if (otaSchedulingConfig != null)
        'OtaSchedulingConfig': otaSchedulingConfig,
      if (otaTargetQueryString != null)
        'OtaTargetQueryString': otaTargetQueryString,
      if (otaTaskExecutionRetryConfig != null)
        'OtaTaskExecutionRetryConfig': otaTaskExecutionRetryConfig,
      if (protocol != null) 'Protocol': protocol.value,
      if (tags != null) 'Tags': tags,
      if (target != null) 'Target': target,
      if (taskConfigurationId != null)
        'TaskConfigurationId': taskConfigurationId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ota-tasks',
      exceptionFnMap: _exceptionFns,
    );
    return CreateOtaTaskResponse.fromJson(response);
  }

  /// Get details of the over-the-air (OTA) task by its task id.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// The over-the-air (OTA) task id.
  Future<GetOtaTaskResponse> getOtaTask({
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/ota-tasks/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetOtaTaskResponse.fromJson(response);
  }

  /// Update an over-the-air (OTA) task.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// The over-the-air (OTA) task id.
  ///
  /// Parameter [description] :
  /// The description of the over-the-air (OTA) task.
  ///
  /// Parameter [taskConfigurationId] :
  /// The identifier for the over-the-air (OTA) task configuration.
  Future<void> updateOtaTask({
    required String identifier,
    String? description,
    String? taskConfigurationId,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (taskConfigurationId != null)
        'TaskConfigurationId': taskConfigurationId,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/ota-tasks/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Delete the over-the-air (OTA) task.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// The identifier of the over-the-air (OTA) task.
  Future<void> deleteOtaTask({
    required String identifier,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/ota-tasks/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// List all of the over-the-air (OTA) tasks.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [nextToken] :
  /// A token that can be used to retrieve the next set of results.
  Future<ListOtaTasksResponse> listOtaTasks({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/ota-tasks',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListOtaTasksResponse.fromJson(response);
  }

  /// List all of the over-the-air (OTA) task executions.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// The over-the-air (OTA) task id.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [nextToken] :
  /// A token that can be used to retrieve the next set of results.
  Future<ListOtaTaskExecutionsResponse> listOtaTaskExecutions({
    required String identifier,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/ota-tasks/${Uri.encodeComponent(identifier)}/devices',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListOtaTaskExecutionsResponse.fromJson(response);
  }

  /// Create a provisioning profile for executing device provisioning flows. The
  /// provisioning profile is a document that defines the set of resources and
  /// policies applied to a device during the provisioning process.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [provisioningType] :
  /// The type of provisioning workflow the device uses for onboarding to IoT
  /// managed integrations.
  ///
  /// Parameter [caCertificate] :
  /// The body of the PEM-encoded certificate authority (CA) certificate.
  ///
  /// Parameter [claimCertificate] :
  /// The body of the PEM-encoded claim certificate. If a claim certificate is
  /// provided, it will be used for the provisioning profile. Otherwise, a claim
  /// certificate will be generated.
  ///
  /// Parameter [clientToken] :
  /// An idempotency token. If you retry a request that completed successfully
  /// initially using the same client token and parameters, then the retry
  /// attempt will succeed without performing any further actions.
  ///
  /// Parameter [name] :
  /// The name of the provisioning profile.
  ///
  /// Parameter [tags] :
  /// A set of key/value pairs that are used to manage the provisioning profile.
  Future<CreateProvisioningProfileResponse> createProvisioningProfile({
    required ProvisioningType provisioningType,
    String? caCertificate,
    String? claimCertificate,
    String? clientToken,
    String? name,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'ProvisioningType': provisioningType.value,
      if (caCertificate != null) 'CaCertificate': caCertificate,
      if (claimCertificate != null) 'ClaimCertificate': claimCertificate,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (name != null) 'Name': name,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/provisioning-profiles',
      exceptionFnMap: _exceptionFns,
    );
    return CreateProvisioningProfileResponse.fromJson(response);
  }

  /// Get details of a provisioning profile.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// The id of a provisioning profile.
  Future<GetProvisioningProfileResponse> getProvisioningProfile({
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/provisioning-profiles/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetProvisioningProfileResponse.fromJson(response);
  }

  /// Delete a provisioning profile.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// The id of the provisioning profile.
  Future<void> deleteProvisioningProfile({
    required String identifier,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/provisioning-profiles/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// List the provisioning profiles within the Amazon Web Services account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [nextToken] :
  /// A token that can be used to retrieve the next set of results.
  Future<ListProvisioningProfilesResponse> listProvisioningProfiles({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/provisioning-profiles',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListProvisioningProfilesResponse.fromJson(response);
  }

  /// Get the runtime log configuration for a specific managed thing.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [managedThingId] :
  /// The id for a managed thing.
  Future<GetRuntimeLogConfigurationResponse> getRuntimeLogConfiguration({
    required String managedThingId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/runtime-log-configurations/${Uri.encodeComponent(managedThingId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetRuntimeLogConfigurationResponse.fromJson(response);
  }

  /// Set the runtime log configuration for a specific managed thing.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [managedThingId] :
  /// The id for a managed thing.
  ///
  /// Parameter [runtimeLogConfigurations] :
  /// The runtime log configuration for a managed thing.
  Future<void> putRuntimeLogConfiguration({
    required String managedThingId,
    required RuntimeLogConfigurations runtimeLogConfigurations,
  }) async {
    final $payload = <String, dynamic>{
      'RuntimeLogConfigurations': runtimeLogConfigurations,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/runtime-log-configurations/${Uri.encodeComponent(managedThingId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Reset a runtime log configuration for a specific managed thing.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [managedThingId] :
  /// The id of a managed thing.
  Future<void> resetRuntimeLogConfiguration({
    required String managedThingId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/runtime-log-configurations/${Uri.encodeComponent(managedThingId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets a schema version with the provided information.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [schemaVersionedId] :
  /// Schema id with a version specified. If the version is missing, it defaults
  /// to latest version.
  ///
  /// Parameter [type] :
  /// The type of schema version.
  ///
  /// Parameter [format] :
  /// The format of the schema version.
  Future<GetSchemaVersionResponse> getSchemaVersion({
    required String schemaVersionedId,
    required SchemaVersionType type,
    SchemaVersionFormat? format,
  }) async {
    final $query = <String, List<String>>{
      if (format != null) 'Format': [format.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/schema-versions/${Uri.encodeComponent(type.value)}/${Uri.encodeComponent(schemaVersionedId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetSchemaVersionResponse.fromJson(response);
  }

  /// Lists schema versions with the provided information.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [type] :
  /// Filter on the type of schema version.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [namespace] :
  /// Filter on the name of the schema version.
  ///
  /// Parameter [nextToken] :
  /// A token that can be used to retrieve the next set of results.
  ///
  /// Parameter [schemaId] :
  /// Filter on the id of the schema version.
  ///
  /// Parameter [semanticVersion] :
  /// The schema version. If this is left blank, it defaults to the latest
  /// version.
  ///
  /// Parameter [visibility] :
  /// The visibility of the schema version.
  Future<ListSchemaVersionsResponse> listSchemaVersions({
    required SchemaVersionType type,
    int? maxResults,
    String? namespace,
    String? nextToken,
    String? schemaId,
    String? semanticVersion,
    SchemaVersionVisibility? visibility,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (namespace != null) 'NamespaceFilter': [namespace],
      if (nextToken != null) 'NextToken': [nextToken],
      if (schemaId != null) 'SchemaIdFilter': [schemaId],
      if (semanticVersion != null) 'SemanticVersionFilter': [semanticVersion],
      if (visibility != null) 'VisibilityFilter': [visibility.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/schema-versions/${Uri.encodeComponent(type.value)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSchemaVersionsResponse.fromJson(response);
  }
}

class GetCustomEndpointResponse {
  /// The IoT managed integrations dedicated, custom endpoint for the device to
  /// route traffic through.
  final String endpointAddress;

  GetCustomEndpointResponse({
    required this.endpointAddress,
  });

  factory GetCustomEndpointResponse.fromJson(Map<String, dynamic> json) {
    return GetCustomEndpointResponse(
      endpointAddress: (json['EndpointAddress'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final endpointAddress = this.endpointAddress;
    return {
      'EndpointAddress': endpointAddress,
    };
  }
}

class ListTagsForResourceResponse {
  /// A set of key/value pairs that are used to manage the resource.
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

class RegisterCustomEndpointResponse {
  /// The IoT managed integrations dedicated, custom endpoint for the device to
  /// route traffic through.
  final String endpointAddress;

  RegisterCustomEndpointResponse({
    required this.endpointAddress,
  });

  factory RegisterCustomEndpointResponse.fromJson(Map<String, dynamic> json) {
    return RegisterCustomEndpointResponse(
      endpointAddress: (json['EndpointAddress'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final endpointAddress = this.endpointAddress;
    return {
      'EndpointAddress': endpointAddress,
    };
  }
}

class SendConnectorEventResponse {
  /// The id of the connector between the third-party cloud provider and IoT
  /// managed integrations.
  final String connectorId;

  SendConnectorEventResponse({
    required this.connectorId,
  });

  factory SendConnectorEventResponse.fromJson(Map<String, dynamic> json) {
    return SendConnectorEventResponse(
      connectorId: (json['ConnectorId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final connectorId = this.connectorId;
    return {
      'ConnectorId': connectorId,
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

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CreateAccountAssociationResponse {
  /// The identifier for the account association request.
  final String accountAssociationId;

  /// The current state of the account association request.
  final AssociationState associationState;

  /// Third-party IoT platform OAuth authorization server URL backed with all the
  /// required parameters to perform end-user authentication. This field will be
  /// empty when using General Authorization flows that do not require OAuth.
  final String oAuthAuthorizationUrl;

  /// The Amazon Resource Name (ARN) of the account association.
  final String? arn;

  CreateAccountAssociationResponse({
    required this.accountAssociationId,
    required this.associationState,
    required this.oAuthAuthorizationUrl,
    this.arn,
  });

  factory CreateAccountAssociationResponse.fromJson(Map<String, dynamic> json) {
    return CreateAccountAssociationResponse(
      accountAssociationId: (json['AccountAssociationId'] as String?) ?? '',
      associationState: AssociationState.fromString(
          (json['AssociationState'] as String?) ?? ''),
      oAuthAuthorizationUrl: (json['OAuthAuthorizationUrl'] as String?) ?? '',
      arn: json['Arn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountAssociationId = this.accountAssociationId;
    final associationState = this.associationState;
    final oAuthAuthorizationUrl = this.oAuthAuthorizationUrl;
    final arn = this.arn;
    return {
      'AccountAssociationId': accountAssociationId,
      'AssociationState': associationState.value,
      'OAuthAuthorizationUrl': oAuthAuthorizationUrl,
      if (arn != null) 'Arn': arn,
    };
  }
}

class GetAccountAssociationResponse {
  /// The unique identifier of the retrieved account association.
  final String accountAssociationId;

  /// The current status state for the account association.
  final AssociationState associationState;

  /// Third party IoT platform OAuth authorization server URL backed with all the
  /// required parameters to perform end-user authentication. This field will be
  /// empty when using General Authorization flows that do not require OAuth.
  final String oAuthAuthorizationUrl;

  /// The Amazon Resource Name (ARN) of the account association.
  final String? arn;

  /// The identifier of the connector destination associated with this account
  /// association.
  final String? connectorDestinationId;

  /// The description of the account association.
  final String? description;

  /// The error message explaining the current account association error.
  final String? errorMessage;

  /// The General Authorization reference by authorization material name.
  final GeneralAuthorizationName? generalAuthorization;

  /// The name of the account association.
  final String? name;

  /// A set of key/value pairs that are used to manage the account association.
  final Map<String, String>? tags;

  GetAccountAssociationResponse({
    required this.accountAssociationId,
    required this.associationState,
    required this.oAuthAuthorizationUrl,
    this.arn,
    this.connectorDestinationId,
    this.description,
    this.errorMessage,
    this.generalAuthorization,
    this.name,
    this.tags,
  });

  factory GetAccountAssociationResponse.fromJson(Map<String, dynamic> json) {
    return GetAccountAssociationResponse(
      accountAssociationId: (json['AccountAssociationId'] as String?) ?? '',
      associationState: AssociationState.fromString(
          (json['AssociationState'] as String?) ?? ''),
      oAuthAuthorizationUrl: (json['OAuthAuthorizationUrl'] as String?) ?? '',
      arn: json['Arn'] as String?,
      connectorDestinationId: json['ConnectorDestinationId'] as String?,
      description: json['Description'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
      generalAuthorization: json['GeneralAuthorization'] != null
          ? GeneralAuthorizationName.fromJson(
              json['GeneralAuthorization'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final accountAssociationId = this.accountAssociationId;
    final associationState = this.associationState;
    final oAuthAuthorizationUrl = this.oAuthAuthorizationUrl;
    final arn = this.arn;
    final connectorDestinationId = this.connectorDestinationId;
    final description = this.description;
    final errorMessage = this.errorMessage;
    final generalAuthorization = this.generalAuthorization;
    final name = this.name;
    final tags = this.tags;
    return {
      'AccountAssociationId': accountAssociationId,
      'AssociationState': associationState.value,
      'OAuthAuthorizationUrl': oAuthAuthorizationUrl,
      if (arn != null) 'Arn': arn,
      if (connectorDestinationId != null)
        'ConnectorDestinationId': connectorDestinationId,
      if (description != null) 'Description': description,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (generalAuthorization != null)
        'GeneralAuthorization': generalAuthorization,
      if (name != null) 'Name': name,
      if (tags != null) 'Tags': tags,
    };
  }
}

class ListAccountAssociationsResponse {
  /// The list of account associations that match the specified criteria.
  final List<AccountAssociationItem>? items;

  /// A token used for pagination of results when there are more account
  /// associations than can be returned in a single response.
  final String? nextToken;

  ListAccountAssociationsResponse({
    this.items,
    this.nextToken,
  });

  factory ListAccountAssociationsResponse.fromJson(Map<String, dynamic> json) {
    return ListAccountAssociationsResponse(
      items: (json['Items'] as List?)
          ?.nonNulls
          .map(
              (e) => AccountAssociationItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class StartAccountAssociationRefreshResponse {
  /// Third-party IoT platform OAuth authorization server URL with all required
  /// parameters to perform end-user authentication during the refresh process.
  /// This field will be empty when using General Authorization flows that do not
  /// require OAuth.
  final String oAuthAuthorizationUrl;

  StartAccountAssociationRefreshResponse({
    required this.oAuthAuthorizationUrl,
  });

  factory StartAccountAssociationRefreshResponse.fromJson(
      Map<String, dynamic> json) {
    return StartAccountAssociationRefreshResponse(
      oAuthAuthorizationUrl: (json['OAuthAuthorizationUrl'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final oAuthAuthorizationUrl = this.oAuthAuthorizationUrl;
    return {
      'OAuthAuthorizationUrl': oAuthAuthorizationUrl,
    };
  }
}

class CreateCloudConnectorResponse {
  /// The unique identifier assigned to the newly created cloud connector.
  final String? id;

  CreateCloudConnectorResponse({
    this.id,
  });

  factory CreateCloudConnectorResponse.fromJson(Map<String, dynamic> json) {
    return CreateCloudConnectorResponse(
      id: json['Id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    return {
      if (id != null) 'Id': id,
    };
  }
}

class GetCloudConnectorResponse {
  /// The configuration details for the cloud connector endpoint, including
  /// connection parameters and authentication requirements.
  final EndpointConfig endpointConfig;

  /// The display name of the C2C connector.
  final String name;

  /// A description of the C2C connector.
  final String? description;

  /// The type of endpoint used for the cloud connector, which defines how the
  /// connector communicates with external services.
  final EndpointType? endpointType;

  /// The unique identifier of the cloud connector.
  final String? id;

  /// The type of cloud connector created.
  final CloudConnectorType? type;

  GetCloudConnectorResponse({
    required this.endpointConfig,
    required this.name,
    this.description,
    this.endpointType,
    this.id,
    this.type,
  });

  factory GetCloudConnectorResponse.fromJson(Map<String, dynamic> json) {
    return GetCloudConnectorResponse(
      endpointConfig: EndpointConfig.fromJson(
          (json['EndpointConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      name: (json['Name'] as String?) ?? '',
      description: json['Description'] as String?,
      endpointType:
          (json['EndpointType'] as String?)?.let(EndpointType.fromString),
      id: json['Id'] as String?,
      type: (json['Type'] as String?)?.let(CloudConnectorType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final endpointConfig = this.endpointConfig;
    final name = this.name;
    final description = this.description;
    final endpointType = this.endpointType;
    final id = this.id;
    final type = this.type;
    return {
      'EndpointConfig': endpointConfig,
      'Name': name,
      if (description != null) 'Description': description,
      if (endpointType != null) 'EndpointType': endpointType.value,
      if (id != null) 'Id': id,
      if (type != null) 'Type': type.value,
    };
  }
}

class ListCloudConnectorsResponse {
  /// The list of connectors.
  final List<ConnectorItem>? items;

  /// A token that can be used to retrieve the next set of results.
  final String? nextToken;

  ListCloudConnectorsResponse({
    this.items,
    this.nextToken,
  });

  factory ListCloudConnectorsResponse.fromJson(Map<String, dynamic> json) {
    return ListCloudConnectorsResponse(
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) => ConnectorItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class CreateConnectorDestinationResponse {
  /// The identifier of the C2C connector destination creation request.
  final String? id;

  CreateConnectorDestinationResponse({
    this.id,
  });

  factory CreateConnectorDestinationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateConnectorDestinationResponse(
      id: json['Id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    return {
      if (id != null) 'Id': id,
    };
  }
}

class GetConnectorDestinationResponse {
  /// The authentication configuration details for the connector destination,
  /// including OAuth settings and other authentication parameters.
  final AuthConfig? authConfig;

  /// The authentication type used for the connector destination, which determines
  /// how credentials and access are managed.
  final AuthType? authType;

  /// The identifier of the C2C connector.
  final String? cloudConnectorId;

  /// A description of the connector destination.
  final String? description;

  /// The unique identifier of the connector destination.
  final String? id;

  /// The display name of the connector destination.
  final String? name;

  /// The URL where users are redirected after completing the OAuth authorization
  /// process for the connector destination.
  final String? oAuthCompleteRedirectUrl;

  /// The AWS Secrets Manager configuration used to securely store and manage
  /// sensitive information for the connector destination.
  final SecretsManager? secretsManager;

  GetConnectorDestinationResponse({
    this.authConfig,
    this.authType,
    this.cloudConnectorId,
    this.description,
    this.id,
    this.name,
    this.oAuthCompleteRedirectUrl,
    this.secretsManager,
  });

  factory GetConnectorDestinationResponse.fromJson(Map<String, dynamic> json) {
    return GetConnectorDestinationResponse(
      authConfig: json['AuthConfig'] != null
          ? AuthConfig.fromJson(json['AuthConfig'] as Map<String, dynamic>)
          : null,
      authType: (json['AuthType'] as String?)?.let(AuthType.fromString),
      cloudConnectorId: json['CloudConnectorId'] as String?,
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      oAuthCompleteRedirectUrl: json['OAuthCompleteRedirectUrl'] as String?,
      secretsManager: json['SecretsManager'] != null
          ? SecretsManager.fromJson(
              json['SecretsManager'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final authConfig = this.authConfig;
    final authType = this.authType;
    final cloudConnectorId = this.cloudConnectorId;
    final description = this.description;
    final id = this.id;
    final name = this.name;
    final oAuthCompleteRedirectUrl = this.oAuthCompleteRedirectUrl;
    final secretsManager = this.secretsManager;
    return {
      if (authConfig != null) 'AuthConfig': authConfig,
      if (authType != null) 'AuthType': authType.value,
      if (cloudConnectorId != null) 'CloudConnectorId': cloudConnectorId,
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (oAuthCompleteRedirectUrl != null)
        'OAuthCompleteRedirectUrl': oAuthCompleteRedirectUrl,
      if (secretsManager != null) 'SecretsManager': secretsManager,
    };
  }
}

class ListConnectorDestinationsResponse {
  /// The list of connector destinations that match the specified criteria.
  final List<ConnectorDestinationSummary>? connectorDestinationList;

  /// A token used for pagination of results when there are more connector
  /// destinations than can be returned in a single response.
  final String? nextToken;

  ListConnectorDestinationsResponse({
    this.connectorDestinationList,
    this.nextToken,
  });

  factory ListConnectorDestinationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListConnectorDestinationsResponse(
      connectorDestinationList: (json['ConnectorDestinationList'] as List?)
          ?.nonNulls
          .map((e) =>
              ConnectorDestinationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectorDestinationList = this.connectorDestinationList;
    final nextToken = this.nextToken;
    return {
      if (connectorDestinationList != null)
        'ConnectorDestinationList': connectorDestinationList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class CreateCredentialLockerResponse {
  /// The Amazon Resource Name (ARN) of the credential locker.
  final String? arn;

  /// The timestamp value of when the credential locker request occurred.
  final DateTime? createdAt;

  /// The identifier of the credential locker creation request.
  final String? id;

  CreateCredentialLockerResponse({
    this.arn,
    this.createdAt,
    this.id,
  });

  factory CreateCredentialLockerResponse.fromJson(Map<String, dynamic> json) {
    return CreateCredentialLockerResponse(
      arn: json['Arn'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      id: json['Id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final id = this.id;
    return {
      if (arn != null) 'Arn': arn,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (id != null) 'Id': id,
    };
  }
}

class GetCredentialLockerResponse {
  /// The Amazon Resource Name (ARN) of the credential locker.
  final String? arn;

  /// The timestamp value of when the credential locker requset occurred.
  final DateTime? createdAt;

  /// The identifier of the credential locker.
  final String? id;

  /// The name of the credential locker.
  final String? name;

  /// A set of key/value pairs that are used to manage the credential locker.
  final Map<String, String>? tags;

  GetCredentialLockerResponse({
    this.arn,
    this.createdAt,
    this.id,
    this.name,
    this.tags,
  });

  factory GetCredentialLockerResponse.fromJson(Map<String, dynamic> json) {
    return GetCredentialLockerResponse(
      arn: json['Arn'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final id = this.id;
    final name = this.name;
    final tags = this.tags;
    return {
      if (arn != null) 'Arn': arn,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (tags != null) 'Tags': tags,
    };
  }
}

class ListCredentialLockersResponse {
  /// The list of credential lockers.
  final List<CredentialLockerSummary>? items;

  /// A token that can be used to retrieve the next set of results.
  final String? nextToken;

  ListCredentialLockersResponse({
    this.items,
    this.nextToken,
  });

  factory ListCredentialLockersResponse.fromJson(Map<String, dynamic> json) {
    return ListCredentialLockersResponse(
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) =>
              CredentialLockerSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class CreateDestinationResponse {
  /// The name of the customer-managed destination.
  final String? name;

  CreateDestinationResponse({
    this.name,
  });

  factory CreateDestinationResponse.fromJson(Map<String, dynamic> json) {
    return CreateDestinationResponse(
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

class GetDestinationResponse {
  /// The timestamp value of when the destination creation requset occurred.
  final DateTime? createdAt;

  /// The Amazon Resource Name (ARN) of the customer-managed destination.
  final String? deliveryDestinationArn;

  /// The destination type for the customer-managed destination.
  final DeliveryDestinationType? deliveryDestinationType;

  /// The description of the customer-managed destination.
  final String? description;

  /// The name of the customer-managed destination.
  final String? name;

  /// The Amazon Resource Name (ARN) of the delivery destination role.
  final String? roleArn;

  /// A set of key/value pairs that are used to manage the customer-managed
  /// destination.
  final Map<String, String>? tags;

  /// The timestamp value of when the destination update requset occurred.
  final DateTime? updatedAt;

  GetDestinationResponse({
    this.createdAt,
    this.deliveryDestinationArn,
    this.deliveryDestinationType,
    this.description,
    this.name,
    this.roleArn,
    this.tags,
    this.updatedAt,
  });

  factory GetDestinationResponse.fromJson(Map<String, dynamic> json) {
    return GetDestinationResponse(
      createdAt: timeStampFromJson(json['CreatedAt']),
      deliveryDestinationArn: json['DeliveryDestinationArn'] as String?,
      deliveryDestinationType: (json['DeliveryDestinationType'] as String?)
          ?.let(DeliveryDestinationType.fromString),
      description: json['Description'] as String?,
      name: json['Name'] as String?,
      roleArn: json['RoleArn'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final deliveryDestinationArn = this.deliveryDestinationArn;
    final deliveryDestinationType = this.deliveryDestinationType;
    final description = this.description;
    final name = this.name;
    final roleArn = this.roleArn;
    final tags = this.tags;
    final updatedAt = this.updatedAt;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (deliveryDestinationArn != null)
        'DeliveryDestinationArn': deliveryDestinationArn,
      if (deliveryDestinationType != null)
        'DeliveryDestinationType': deliveryDestinationType.value,
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
      if (roleArn != null) 'RoleArn': roleArn,
      if (tags != null) 'Tags': tags,
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

class ListDestinationsResponse {
  /// The list of destinations.
  final List<DestinationSummary>? destinationList;

  /// A token that can be used to retrieve the next set of results.
  final String? nextToken;

  ListDestinationsResponse({
    this.destinationList,
    this.nextToken,
  });

  factory ListDestinationsResponse.fromJson(Map<String, dynamic> json) {
    return ListDestinationsResponse(
      destinationList: (json['DestinationList'] as List?)
          ?.nonNulls
          .map((e) => DestinationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destinationList = this.destinationList;
    final nextToken = this.nextToken;
    return {
      if (destinationList != null) 'DestinationList': destinationList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class StartDeviceDiscoveryResponse {
  /// The id of the device discovery job request.
  final String? id;

  /// The timestamp value for the start time of the device discovery.
  final DateTime? startedAt;

  StartDeviceDiscoveryResponse({
    this.id,
    this.startedAt,
  });

  factory StartDeviceDiscoveryResponse.fromJson(Map<String, dynamic> json) {
    return StartDeviceDiscoveryResponse(
      id: json['Id'] as String?,
      startedAt: timeStampFromJson(json['StartedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final startedAt = this.startedAt;
    return {
      if (id != null) 'Id': id,
      if (startedAt != null) 'StartedAt': unixTimestampToJson(startedAt),
    };
  }
}

class GetDeviceDiscoveryResponse {
  /// The Amazon Resource Name (ARN) of the device discovery job request.
  final String arn;

  /// The discovery type supporting the type of device to be discovered in the
  /// device discovery job request.
  final DiscoveryType discoveryType;

  /// The id of the device discovery job request.
  final String id;

  /// The timestamp value for the start time of the device discovery.
  final DateTime startedAt;

  /// The status of the device discovery job request.
  final DeviceDiscoveryStatus status;

  /// The identifier of the account association used for the device discovery.
  final String? accountAssociationId;

  /// The ID tracking the current discovery process for one connector association.
  final String? connectorAssociationId;

  /// The id of the end-user's IoT hub.
  final String? controllerId;

  /// The timestamp value for the completion time of the device discovery.
  final DateTime? finishedAt;

  /// A set of key/value pairs that are used to manage the device discovery
  /// request.
  final Map<String, String>? tags;

  GetDeviceDiscoveryResponse({
    required this.arn,
    required this.discoveryType,
    required this.id,
    required this.startedAt,
    required this.status,
    this.accountAssociationId,
    this.connectorAssociationId,
    this.controllerId,
    this.finishedAt,
    this.tags,
  });

  factory GetDeviceDiscoveryResponse.fromJson(Map<String, dynamic> json) {
    return GetDeviceDiscoveryResponse(
      arn: (json['Arn'] as String?) ?? '',
      discoveryType:
          DiscoveryType.fromString((json['DiscoveryType'] as String?) ?? ''),
      id: (json['Id'] as String?) ?? '',
      startedAt: nonNullableTimeStampFromJson(json['StartedAt'] ?? 0),
      status:
          DeviceDiscoveryStatus.fromString((json['Status'] as String?) ?? ''),
      accountAssociationId: json['AccountAssociationId'] as String?,
      connectorAssociationId: json['ConnectorAssociationId'] as String?,
      controllerId: json['ControllerId'] as String?,
      finishedAt: timeStampFromJson(json['FinishedAt']),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final discoveryType = this.discoveryType;
    final id = this.id;
    final startedAt = this.startedAt;
    final status = this.status;
    final accountAssociationId = this.accountAssociationId;
    final connectorAssociationId = this.connectorAssociationId;
    final controllerId = this.controllerId;
    final finishedAt = this.finishedAt;
    final tags = this.tags;
    return {
      'Arn': arn,
      'DiscoveryType': discoveryType.value,
      'Id': id,
      'StartedAt': unixTimestampToJson(startedAt),
      'Status': status.value,
      if (accountAssociationId != null)
        'AccountAssociationId': accountAssociationId,
      if (connectorAssociationId != null)
        'ConnectorAssociationId': connectorAssociationId,
      if (controllerId != null) 'ControllerId': controllerId,
      if (finishedAt != null) 'FinishedAt': unixTimestampToJson(finishedAt),
      if (tags != null) 'Tags': tags,
    };
  }
}

class ListDeviceDiscoveriesResponse {
  /// The list of device discovery jobs that match the specified criteria.
  final List<DeviceDiscoverySummary>? items;

  /// A token used for pagination of results when there are more device discovery
  /// jobs than can be returned in a single response.
  final String? nextToken;

  ListDeviceDiscoveriesResponse({
    this.items,
    this.nextToken,
  });

  factory ListDeviceDiscoveriesResponse.fromJson(Map<String, dynamic> json) {
    return ListDeviceDiscoveriesResponse(
      items: (json['Items'] as List?)
          ?.nonNulls
          .map(
              (e) => DeviceDiscoverySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListDiscoveredDevicesResponse {
  /// The list of discovered devices that match the specified criteria.
  final List<DiscoveredDeviceSummary>? items;

  /// A token used for pagination of results when there are more discovered
  /// devices than can be returned in a single response.
  final String? nextToken;

  ListDiscoveredDevicesResponse({
    this.items,
    this.nextToken,
  });

  factory ListDiscoveredDevicesResponse.fromJson(Map<String, dynamic> json) {
    return ListDiscoveredDevicesResponse(
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) =>
              DiscoveredDeviceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class CreateEventLogConfigurationResponse {
  /// The identifier of the event log configuration request.
  final String? id;

  CreateEventLogConfigurationResponse({
    this.id,
  });

  factory CreateEventLogConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateEventLogConfigurationResponse(
      id: json['Id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    return {
      if (id != null) 'Id': id,
    };
  }
}

class GetEventLogConfigurationResponse {
  /// The logging level for the event log configuration.
  final LogLevel? eventLogLevel;

  /// The identifier of the event log configuration.
  final String? id;

  /// The identifier of the resource for the event log configuration.
  final String? resourceId;

  /// The type of resource for the event log configuration.
  final String? resourceType;

  GetEventLogConfigurationResponse({
    this.eventLogLevel,
    this.id,
    this.resourceId,
    this.resourceType,
  });

  factory GetEventLogConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return GetEventLogConfigurationResponse(
      eventLogLevel:
          (json['EventLogLevel'] as String?)?.let(LogLevel.fromString),
      id: json['Id'] as String?,
      resourceId: json['ResourceId'] as String?,
      resourceType: json['ResourceType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventLogLevel = this.eventLogLevel;
    final id = this.id;
    final resourceId = this.resourceId;
    final resourceType = this.resourceType;
    return {
      if (eventLogLevel != null) 'EventLogLevel': eventLogLevel.value,
      if (id != null) 'Id': id,
      if (resourceId != null) 'ResourceId': resourceId,
      if (resourceType != null) 'ResourceType': resourceType,
    };
  }
}

class ListEventLogConfigurationsResponse {
  /// A list of each event log configuration and pertinent information.
  final List<EventLogConfigurationSummary>? eventLogConfigurationList;

  /// A token that can be used to retrieve the next set of results.
  final String? nextToken;

  ListEventLogConfigurationsResponse({
    this.eventLogConfigurationList,
    this.nextToken,
  });

  factory ListEventLogConfigurationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListEventLogConfigurationsResponse(
      eventLogConfigurationList: (json['EventLogConfigurationList'] as List?)
          ?.nonNulls
          .map((e) =>
              EventLogConfigurationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventLogConfigurationList = this.eventLogConfigurationList;
    final nextToken = this.nextToken;
    return {
      if (eventLogConfigurationList != null)
        'EventLogConfigurationList': eventLogConfigurationList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class GetHubConfigurationResponse {
  /// A user-defined integer value that represents the hub token timer expiry
  /// setting in seconds.
  final int? hubTokenTimerExpirySettingInSeconds;

  /// The timestamp value of when the hub configuration was updated.
  final DateTime? updatedAt;

  GetHubConfigurationResponse({
    this.hubTokenTimerExpirySettingInSeconds,
    this.updatedAt,
  });

  factory GetHubConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return GetHubConfigurationResponse(
      hubTokenTimerExpirySettingInSeconds:
          json['HubTokenTimerExpirySettingInSeconds'] as int?,
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final hubTokenTimerExpirySettingInSeconds =
        this.hubTokenTimerExpirySettingInSeconds;
    final updatedAt = this.updatedAt;
    return {
      if (hubTokenTimerExpirySettingInSeconds != null)
        'HubTokenTimerExpirySettingInSeconds':
            hubTokenTimerExpirySettingInSeconds,
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

class PutHubConfigurationResponse {
  /// A user-defined integer value that represents the hub token timer expiry
  /// setting in seconds.
  final int? hubTokenTimerExpirySettingInSeconds;

  PutHubConfigurationResponse({
    this.hubTokenTimerExpirySettingInSeconds,
  });

  factory PutHubConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return PutHubConfigurationResponse(
      hubTokenTimerExpirySettingInSeconds:
          json['HubTokenTimerExpirySettingInSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final hubTokenTimerExpirySettingInSeconds =
        this.hubTokenTimerExpirySettingInSeconds;
    return {
      if (hubTokenTimerExpirySettingInSeconds != null)
        'HubTokenTimerExpirySettingInSeconds':
            hubTokenTimerExpirySettingInSeconds,
    };
  }
}

class GetDefaultEncryptionConfigurationResponse {
  /// Provides the status of the default encryption configuration for an Amazon
  /// Web Services account.
  final ConfigurationStatus configurationStatus;

  /// The type of encryption used for the encryption configuration.
  final EncryptionType encryptionType;

  /// The Key Amazon Resource Name (ARN) of the AWS KMS key used for KMS
  /// encryption if you use <code>KMS_BASED_ENCRYPTION</code>.
  final String? kmsKeyArn;

  GetDefaultEncryptionConfigurationResponse({
    required this.configurationStatus,
    required this.encryptionType,
    this.kmsKeyArn,
  });

  factory GetDefaultEncryptionConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetDefaultEncryptionConfigurationResponse(
      configurationStatus: ConfigurationStatus.fromJson(
          (json['configurationStatus'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      encryptionType:
          EncryptionType.fromString((json['encryptionType'] as String?) ?? ''),
      kmsKeyArn: json['kmsKeyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configurationStatus = this.configurationStatus;
    final encryptionType = this.encryptionType;
    final kmsKeyArn = this.kmsKeyArn;
    return {
      'configurationStatus': configurationStatus,
      'encryptionType': encryptionType.value,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
    };
  }
}

class PutDefaultEncryptionConfigurationResponse {
  /// Provides the status of the default encryption configuration for an Amazon
  /// Web Services account.
  final ConfigurationStatus configurationStatus;

  /// The type of encryption used for the encryption configuration.
  final EncryptionType encryptionType;

  /// The Key Amazon Resource Name (ARN) of the AWS KMS key used for KMS
  /// encryption if you use <code>KMS_BASED_ENCRYPTION</code>.
  final String? kmsKeyArn;

  PutDefaultEncryptionConfigurationResponse({
    required this.configurationStatus,
    required this.encryptionType,
    this.kmsKeyArn,
  });

  factory PutDefaultEncryptionConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return PutDefaultEncryptionConfigurationResponse(
      configurationStatus: ConfigurationStatus.fromJson(
          (json['configurationStatus'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      encryptionType:
          EncryptionType.fromString((json['encryptionType'] as String?) ?? ''),
      kmsKeyArn: json['kmsKeyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configurationStatus = this.configurationStatus;
    final encryptionType = this.encryptionType;
    final kmsKeyArn = this.kmsKeyArn;
    return {
      'configurationStatus': configurationStatus,
      'encryptionType': encryptionType.value,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
    };
  }
}

class ListManagedThingAccountAssociationsResponse {
  /// The list of managed thing associations that match the specified criteria,
  /// including the managed thing ID and account association ID for each
  /// association.
  final List<ManagedThingAssociation>? items;

  /// A token used for pagination of results when there are more account
  /// associations than can be returned in a single response.
  final String? nextToken;

  ListManagedThingAccountAssociationsResponse({
    this.items,
    this.nextToken,
  });

  factory ListManagedThingAccountAssociationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListManagedThingAccountAssociationsResponse(
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) =>
              ManagedThingAssociation.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class RegisterAccountAssociationResponse {
  /// The identifier of the account association that was registered.
  final String? accountAssociationId;

  /// The identifier of the device discovery job associated with this
  /// registration.
  final String? deviceDiscoveryId;

  /// The identifier of the managed thing that was registered with the account
  /// association.
  final String? managedThingId;

  RegisterAccountAssociationResponse({
    this.accountAssociationId,
    this.deviceDiscoveryId,
    this.managedThingId,
  });

  factory RegisterAccountAssociationResponse.fromJson(
      Map<String, dynamic> json) {
    return RegisterAccountAssociationResponse(
      accountAssociationId: json['AccountAssociationId'] as String?,
      deviceDiscoveryId: json['DeviceDiscoveryId'] as String?,
      managedThingId: json['ManagedThingId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountAssociationId = this.accountAssociationId;
    final deviceDiscoveryId = this.deviceDiscoveryId;
    final managedThingId = this.managedThingId;
    return {
      if (accountAssociationId != null)
        'AccountAssociationId': accountAssociationId,
      if (deviceDiscoveryId != null) 'DeviceDiscoveryId': deviceDiscoveryId,
      if (managedThingId != null) 'ManagedThingId': managedThingId,
    };
  }
}

class SendManagedThingCommandResponse {
  /// The trace request identifier. This is generated by IoT managed integrations
  /// and can be used to trace this command and its related operations in
  /// CloudWatch.
  final String? traceId;

  SendManagedThingCommandResponse({
    this.traceId,
  });

  factory SendManagedThingCommandResponse.fromJson(Map<String, dynamic> json) {
    return SendManagedThingCommandResponse(
      traceId: json['TraceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final traceId = this.traceId;
    return {
      if (traceId != null) 'TraceId': traceId,
    };
  }
}

class CreateManagedThingResponse {
  /// The Amazon Resource Name (ARN) of the managed thing.
  final String? arn;

  /// The timestamp value of when the device creation request occurred.
  final DateTime? createdAt;

  /// The id of the managed thing.
  final String? id;

  CreateManagedThingResponse({
    this.arn,
    this.createdAt,
    this.id,
  });

  factory CreateManagedThingResponse.fromJson(Map<String, dynamic> json) {
    return CreateManagedThingResponse(
      arn: json['Arn'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      id: json['Id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final id = this.id;
    return {
      if (arn != null) 'Arn': arn,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (id != null) 'Id': id,
    };
  }
}

class GetManagedThingResponse {
  /// The timestampe value of when the device was activated.
  final DateTime? activatedAt;

  /// The id of the advertised product.
  final String? advertisedProductId;

  /// The Amazon Resource Name (ARN) of the managed thing.
  final String? arn;

  /// The brand of the device.
  final String? brand;

  /// The classification of the managed thing such as light bulb or thermostat.
  final String? classification;

  /// The identifier of the connector destination associated with this managed
  /// thing.
  final String? connectorDestinationId;

  /// The third-party device id as defined by the connector. This device id must
  /// not contain personal identifiable information (PII).
  /// <note>
  /// This parameter is used for cloud-to-cloud devices only.
  /// </note>
  final String? connectorDeviceId;

  /// The id of the connector policy.
  /// <note>
  /// This parameter is used for cloud-to-cloud devices only.
  /// </note>
  final String? connectorPolicyId;

  /// The timestamp value of when the device creation request occurred.
  final DateTime? createdAt;

  /// The identifier of the credential locker for the managed thing.
  final String? credentialLockerId;

  /// A Zwave device-specific key used during device activation.
  /// <note>
  /// This parameter is used for Zwave devices only.
  /// </note>
  final String? deviceSpecificKey;

  /// The network mode for the hub-connected device.
  final HubNetworkMode? hubNetworkMode;

  /// The id of the managed thing.
  final String? id;

  /// The unique 13 digit number that identifies the managed thing.
  final String? internationalArticleNumber;

  /// The media access control (MAC) address for the device represented by the
  /// managed thing.
  /// <note>
  /// This parameter is used for Zigbee devices only.
  /// </note>
  final String? macAddress;

  /// The metadata for the managed thing.
  final Map<String, String>? metaData;

  /// The model of the device.
  final String? model;

  /// The name of the managed thing representing the physical device.
  final String? name;

  /// Owner of the device, usually an indication of whom the device belongs to.
  /// This value should not contain personal identifiable information.
  final String? owner;

  /// Id of the controller device used for the discovery job.
  final String? parentControllerId;

  /// The provisioning status of the device in the provisioning workflow for
  /// onboarding to IoT managed integrations. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-mi/latest/devguide/device-provisioning.html">Device
  /// Provisioning</a>.
  final ProvisioningStatus? provisioningStatus;

  /// The type of device used. This will be the Amazon Web Services hub
  /// controller, cloud device, or IoT device.
  final Role? role;

  /// The serial number of the device.
  final String? serialNumber;

  /// A set of key/value pairs that are used to manage the managed thing.
  final Map<String, String>? tags;

  /// The universal product code (UPC) of the device model. The UPC is typically
  /// used in the United States of America and Canada.
  final String? universalProductCode;

  /// The timestamp value of when the managed thing was last updated at.
  final DateTime? updatedAt;

  /// The Wi-Fi Simple Setup configuration for the managed thing, which defines
  /// provisioning capabilities and timeout settings.
  final WiFiSimpleSetupConfiguration? wiFiSimpleSetupConfiguration;

  GetManagedThingResponse({
    this.activatedAt,
    this.advertisedProductId,
    this.arn,
    this.brand,
    this.classification,
    this.connectorDestinationId,
    this.connectorDeviceId,
    this.connectorPolicyId,
    this.createdAt,
    this.credentialLockerId,
    this.deviceSpecificKey,
    this.hubNetworkMode,
    this.id,
    this.internationalArticleNumber,
    this.macAddress,
    this.metaData,
    this.model,
    this.name,
    this.owner,
    this.parentControllerId,
    this.provisioningStatus,
    this.role,
    this.serialNumber,
    this.tags,
    this.universalProductCode,
    this.updatedAt,
    this.wiFiSimpleSetupConfiguration,
  });

  factory GetManagedThingResponse.fromJson(Map<String, dynamic> json) {
    return GetManagedThingResponse(
      activatedAt: timeStampFromJson(json['ActivatedAt']),
      advertisedProductId: json['AdvertisedProductId'] as String?,
      arn: json['Arn'] as String?,
      brand: json['Brand'] as String?,
      classification: json['Classification'] as String?,
      connectorDestinationId: json['ConnectorDestinationId'] as String?,
      connectorDeviceId: json['ConnectorDeviceId'] as String?,
      connectorPolicyId: json['ConnectorPolicyId'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      credentialLockerId: json['CredentialLockerId'] as String?,
      deviceSpecificKey: json['DeviceSpecificKey'] as String?,
      hubNetworkMode:
          (json['HubNetworkMode'] as String?)?.let(HubNetworkMode.fromString),
      id: json['Id'] as String?,
      internationalArticleNumber: json['InternationalArticleNumber'] as String?,
      macAddress: json['MacAddress'] as String?,
      metaData: (json['MetaData'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      model: json['Model'] as String?,
      name: json['Name'] as String?,
      owner: json['Owner'] as String?,
      parentControllerId: json['ParentControllerId'] as String?,
      provisioningStatus: (json['ProvisioningStatus'] as String?)
          ?.let(ProvisioningStatus.fromString),
      role: (json['Role'] as String?)?.let(Role.fromString),
      serialNumber: json['SerialNumber'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      universalProductCode: json['UniversalProductCode'] as String?,
      updatedAt: timeStampFromJson(json['UpdatedAt']),
      wiFiSimpleSetupConfiguration: json['WiFiSimpleSetupConfiguration'] != null
          ? WiFiSimpleSetupConfiguration.fromJson(
              json['WiFiSimpleSetupConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final activatedAt = this.activatedAt;
    final advertisedProductId = this.advertisedProductId;
    final arn = this.arn;
    final brand = this.brand;
    final classification = this.classification;
    final connectorDestinationId = this.connectorDestinationId;
    final connectorDeviceId = this.connectorDeviceId;
    final connectorPolicyId = this.connectorPolicyId;
    final createdAt = this.createdAt;
    final credentialLockerId = this.credentialLockerId;
    final deviceSpecificKey = this.deviceSpecificKey;
    final hubNetworkMode = this.hubNetworkMode;
    final id = this.id;
    final internationalArticleNumber = this.internationalArticleNumber;
    final macAddress = this.macAddress;
    final metaData = this.metaData;
    final model = this.model;
    final name = this.name;
    final owner = this.owner;
    final parentControllerId = this.parentControllerId;
    final provisioningStatus = this.provisioningStatus;
    final role = this.role;
    final serialNumber = this.serialNumber;
    final tags = this.tags;
    final universalProductCode = this.universalProductCode;
    final updatedAt = this.updatedAt;
    final wiFiSimpleSetupConfiguration = this.wiFiSimpleSetupConfiguration;
    return {
      if (activatedAt != null) 'ActivatedAt': unixTimestampToJson(activatedAt),
      if (advertisedProductId != null)
        'AdvertisedProductId': advertisedProductId,
      if (arn != null) 'Arn': arn,
      if (brand != null) 'Brand': brand,
      if (classification != null) 'Classification': classification,
      if (connectorDestinationId != null)
        'ConnectorDestinationId': connectorDestinationId,
      if (connectorDeviceId != null) 'ConnectorDeviceId': connectorDeviceId,
      if (connectorPolicyId != null) 'ConnectorPolicyId': connectorPolicyId,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (credentialLockerId != null) 'CredentialLockerId': credentialLockerId,
      if (deviceSpecificKey != null) 'DeviceSpecificKey': deviceSpecificKey,
      if (hubNetworkMode != null) 'HubNetworkMode': hubNetworkMode.value,
      if (id != null) 'Id': id,
      if (internationalArticleNumber != null)
        'InternationalArticleNumber': internationalArticleNumber,
      if (macAddress != null) 'MacAddress': macAddress,
      if (metaData != null) 'MetaData': metaData,
      if (model != null) 'Model': model,
      if (name != null) 'Name': name,
      if (owner != null) 'Owner': owner,
      if (parentControllerId != null) 'ParentControllerId': parentControllerId,
      if (provisioningStatus != null)
        'ProvisioningStatus': provisioningStatus.value,
      if (role != null) 'Role': role.value,
      if (serialNumber != null) 'SerialNumber': serialNumber,
      if (tags != null) 'Tags': tags,
      if (universalProductCode != null)
        'UniversalProductCode': universalProductCode,
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
      if (wiFiSimpleSetupConfiguration != null)
        'WiFiSimpleSetupConfiguration': wiFiSimpleSetupConfiguration,
    };
  }
}

class ListManagedThingsResponse {
  /// The list of managed things.
  final List<ManagedThingSummary>? items;

  /// A token that can be used to retrieve the next set of results.
  final String? nextToken;

  ListManagedThingsResponse({
    this.items,
    this.nextToken,
  });

  factory ListManagedThingsResponse.fromJson(Map<String, dynamic> json) {
    return ListManagedThingsResponse(
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) => ManagedThingSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class GetManagedThingCapabilitiesResponse {
  /// The capabilities of the device such as light bulb.
  final String? capabilities;

  /// A report of the capabilities for the managed thing.
  final CapabilityReport? capabilityReport;

  /// The id of the device.
  final String? managedThingId;

  GetManagedThingCapabilitiesResponse({
    this.capabilities,
    this.capabilityReport,
    this.managedThingId,
  });

  factory GetManagedThingCapabilitiesResponse.fromJson(
      Map<String, dynamic> json) {
    return GetManagedThingCapabilitiesResponse(
      capabilities: json['Capabilities'] as String?,
      capabilityReport: json['CapabilityReport'] != null
          ? CapabilityReport.fromJson(
              json['CapabilityReport'] as Map<String, dynamic>)
          : null,
      managedThingId: json['ManagedThingId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final capabilities = this.capabilities;
    final capabilityReport = this.capabilityReport;
    final managedThingId = this.managedThingId;
    return {
      if (capabilities != null) 'Capabilities': capabilities,
      if (capabilityReport != null) 'CapabilityReport': capabilityReport,
      if (managedThingId != null) 'ManagedThingId': managedThingId,
    };
  }
}

class GetManagedThingCertificateResponse {
  /// The PEM-encoded certificate for the managed thing.
  final String? certificatePem;

  /// The identifier of the managed thing.
  final String? managedThingId;

  GetManagedThingCertificateResponse({
    this.certificatePem,
    this.managedThingId,
  });

  factory GetManagedThingCertificateResponse.fromJson(
      Map<String, dynamic> json) {
    return GetManagedThingCertificateResponse(
      certificatePem: json['CertificatePem'] as String?,
      managedThingId: json['ManagedThingId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final certificatePem = this.certificatePem;
    final managedThingId = this.managedThingId;
    return {
      if (certificatePem != null) 'CertificatePem': certificatePem,
      if (managedThingId != null) 'ManagedThingId': managedThingId,
    };
  }
}

class GetManagedThingConnectivityDataResponse {
  /// The connectivity status for a managed thing.
  final bool? connected;

  /// The reason for the connectivity disconnect with the managed thing.
  final DisconnectReasonValue? disconnectReason;

  /// The id of a managed thing.
  final String? managedThingId;

  /// The timestamp value of when the connectivity status for a managed thing was
  /// last taken.
  final DateTime? timestamp;

  GetManagedThingConnectivityDataResponse({
    this.connected,
    this.disconnectReason,
    this.managedThingId,
    this.timestamp,
  });

  factory GetManagedThingConnectivityDataResponse.fromJson(
      Map<String, dynamic> json) {
    return GetManagedThingConnectivityDataResponse(
      connected: json['Connected'] as bool?,
      disconnectReason: (json['DisconnectReason'] as String?)
          ?.let(DisconnectReasonValue.fromString),
      managedThingId: json['ManagedThingId'] as String?,
      timestamp: timeStampFromJson(json['Timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final connected = this.connected;
    final disconnectReason = this.disconnectReason;
    final managedThingId = this.managedThingId;
    final timestamp = this.timestamp;
    return {
      if (connected != null) 'Connected': connected,
      if (disconnectReason != null) 'DisconnectReason': disconnectReason.value,
      if (managedThingId != null) 'ManagedThingId': managedThingId,
      if (timestamp != null) 'Timestamp': unixTimestampToJson(timestamp),
    };
  }
}

class GetManagedThingMetaDataResponse {
  /// The managed thing id.
  final String? managedThingId;

  /// The metadata for the managed thing.
  final Map<String, String>? metaData;

  GetManagedThingMetaDataResponse({
    this.managedThingId,
    this.metaData,
  });

  factory GetManagedThingMetaDataResponse.fromJson(Map<String, dynamic> json) {
    return GetManagedThingMetaDataResponse(
      managedThingId: json['ManagedThingId'] as String?,
      metaData: (json['MetaData'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final managedThingId = this.managedThingId;
    final metaData = this.metaData;
    return {
      if (managedThingId != null) 'ManagedThingId': managedThingId,
      if (metaData != null) 'MetaData': metaData,
    };
  }
}

class ListManagedThingSchemasResponse {
  /// The list of managed thing schemas.
  final List<ManagedThingSchemaListItem>? items;

  /// A token that can be used to retrieve the next set of results.
  final String? nextToken;

  ListManagedThingSchemasResponse({
    this.items,
    this.nextToken,
  });

  factory ListManagedThingSchemasResponse.fromJson(Map<String, dynamic> json) {
    return ListManagedThingSchemasResponse(
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) =>
              ManagedThingSchemaListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class GetManagedThingStateResponse {
  /// The device endpoint.
  final List<StateEndpoint> endpoints;

  GetManagedThingStateResponse({
    required this.endpoints,
  });

  factory GetManagedThingStateResponse.fromJson(Map<String, dynamic> json) {
    return GetManagedThingStateResponse(
      endpoints: ((json['Endpoints'] as List?) ?? const [])
          .nonNulls
          .map((e) => StateEndpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final endpoints = this.endpoints;
    return {
      'Endpoints': endpoints,
    };
  }
}

class CreateNotificationConfigurationResponse {
  /// The type of event triggering a device notification to the customer-managed
  /// destination.
  final EventType? eventType;

  CreateNotificationConfigurationResponse({
    this.eventType,
  });

  factory CreateNotificationConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateNotificationConfigurationResponse(
      eventType: (json['EventType'] as String?)?.let(EventType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final eventType = this.eventType;
    return {
      if (eventType != null) 'EventType': eventType.value,
    };
  }
}

class GetNotificationConfigurationResponse {
  /// The timestamp value of when the notification configuration was created.
  final DateTime? createdAt;

  /// The name of the destination for the notification configuration.
  final String? destinationName;

  /// The type of event triggering a device notification to the customer-managed
  /// destination.
  final EventType? eventType;

  /// A set of key/value pairs that are used to manage the notification
  /// configuration.
  final Map<String, String>? tags;

  /// The timestamp value of when the notification configuration was last updated.
  final DateTime? updatedAt;

  GetNotificationConfigurationResponse({
    this.createdAt,
    this.destinationName,
    this.eventType,
    this.tags,
    this.updatedAt,
  });

  factory GetNotificationConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetNotificationConfigurationResponse(
      createdAt: timeStampFromJson(json['CreatedAt']),
      destinationName: json['DestinationName'] as String?,
      eventType: (json['EventType'] as String?)?.let(EventType.fromString),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final destinationName = this.destinationName;
    final eventType = this.eventType;
    final tags = this.tags;
    final updatedAt = this.updatedAt;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (destinationName != null) 'DestinationName': destinationName,
      if (eventType != null) 'EventType': eventType.value,
      if (tags != null) 'Tags': tags,
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

class ListNotificationConfigurationsResponse {
  /// A token that can be used to retrieve the next set of results.
  final String? nextToken;

  /// The list of notification configurations.
  final List<NotificationConfigurationSummary>? notificationConfigurationList;

  ListNotificationConfigurationsResponse({
    this.nextToken,
    this.notificationConfigurationList,
  });

  factory ListNotificationConfigurationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListNotificationConfigurationsResponse(
      nextToken: json['NextToken'] as String?,
      notificationConfigurationList:
          (json['NotificationConfigurationList'] as List?)
              ?.nonNulls
              .map((e) => NotificationConfigurationSummary.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final notificationConfigurationList = this.notificationConfigurationList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (notificationConfigurationList != null)
        'NotificationConfigurationList': notificationConfigurationList,
    };
  }
}

class CreateOtaTaskConfigurationResponse {
  /// The identifier of the over-the-air (OTA) task configuration.
  final String? taskConfigurationId;

  CreateOtaTaskConfigurationResponse({
    this.taskConfigurationId,
  });

  factory CreateOtaTaskConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateOtaTaskConfigurationResponse(
      taskConfigurationId: json['TaskConfigurationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final taskConfigurationId = this.taskConfigurationId;
    return {
      if (taskConfigurationId != null)
        'TaskConfigurationId': taskConfigurationId,
    };
  }
}

class GetOtaTaskConfigurationResponse {
  /// The timestamp value of when the over-the-air (OTA) task configuration was
  /// created at.
  final DateTime? createdAt;

  /// A description of the over-the-air (OTA) task configuration.
  final String? description;

  /// The name of the over-the-air (OTA) task configuration.
  final String? name;

  /// Describes the type of configuration used for the over-the-air (OTA) task.
  final PushConfig? pushConfig;

  /// The over-the-air (OTA) task configuration id.
  final String? taskConfigurationId;

  GetOtaTaskConfigurationResponse({
    this.createdAt,
    this.description,
    this.name,
    this.pushConfig,
    this.taskConfigurationId,
  });

  factory GetOtaTaskConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return GetOtaTaskConfigurationResponse(
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      name: json['Name'] as String?,
      pushConfig: json['PushConfig'] != null
          ? PushConfig.fromJson(json['PushConfig'] as Map<String, dynamic>)
          : null,
      taskConfigurationId: json['TaskConfigurationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final description = this.description;
    final name = this.name;
    final pushConfig = this.pushConfig;
    final taskConfigurationId = this.taskConfigurationId;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
      if (pushConfig != null) 'PushConfig': pushConfig,
      if (taskConfigurationId != null)
        'TaskConfigurationId': taskConfigurationId,
    };
  }
}

class ListOtaTaskConfigurationsResponse {
  /// The list of the over-the-air (OTA) task configurations.
  final List<OtaTaskConfigurationSummary>? items;

  /// A token that can be used to retrieve the next set of results.
  final String? nextToken;

  ListOtaTaskConfigurationsResponse({
    this.items,
    this.nextToken,
  });

  factory ListOtaTaskConfigurationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListOtaTaskConfigurationsResponse(
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) =>
              OtaTaskConfigurationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class CreateOtaTaskResponse {
  /// A description of the over-the-air (OTA) task.
  final String? description;

  /// The Amazon Resource Name (ARN) of the over-the-air (OTA) task.
  final String? taskArn;

  /// The identifier of the over-the-air (OTA) task.
  final String? taskId;

  CreateOtaTaskResponse({
    this.description,
    this.taskArn,
    this.taskId,
  });

  factory CreateOtaTaskResponse.fromJson(Map<String, dynamic> json) {
    return CreateOtaTaskResponse(
      description: json['Description'] as String?,
      taskArn: json['TaskArn'] as String?,
      taskId: json['TaskId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final taskArn = this.taskArn;
    final taskId = this.taskId;
    return {
      if (description != null) 'Description': description,
      if (taskArn != null) 'TaskArn': taskArn,
      if (taskId != null) 'TaskId': taskId,
    };
  }
}

class GetOtaTaskResponse {
  /// The timestamp value of when the over-the-air (OTA) task was created.
  final DateTime? createdAt;

  /// The description of the over-the-air (OTA) task.
  final String? description;

  /// The timestamp value of when the over-the-air (OTA) task was last updated at.
  final DateTime? lastUpdatedAt;

  /// The deployment mechanism for the over-the-air (OTA) task.
  final OtaMechanism? otaMechanism;
  final OtaTaskSchedulingConfig? otaSchedulingConfig;

  /// The query string to add things to the thing group.
  final String? otaTargetQueryString;
  final OtaTaskExecutionRetryConfig? otaTaskExecutionRetryConfig;

  /// The frequency type for the over-the-air (OTA) task.
  final OtaType? otaType;

  /// The connection protocol the over-the-air (OTA) task uses to update the
  /// device.
  final OtaProtocol? protocol;

  /// The URL to the Amazon S3 bucket where the over-the-air (OTA) task is stored.
  final String? s3Url;

  /// The status of the over-the-air (OTA) task.
  final OtaStatus? status;

  /// A set of key/value pairs that are used to manage the over-the-air (OTA)
  /// task.
  final Map<String, String>? tags;

  /// The device targeted for the over-the-air (OTA) task.
  final List<String>? target;

  /// The Amazon Resource Name (ARN) of the over-the-air (OTA) task
  final String? taskArn;

  /// The identifier for the over-the-air (OTA) task configuration.
  final String? taskConfigurationId;

  /// The id of the over-the-air (OTA) task.
  final String? taskId;

  /// The processing details of all over-the-air (OTA) tasks.
  final TaskProcessingDetails? taskProcessingDetails;

  GetOtaTaskResponse({
    this.createdAt,
    this.description,
    this.lastUpdatedAt,
    this.otaMechanism,
    this.otaSchedulingConfig,
    this.otaTargetQueryString,
    this.otaTaskExecutionRetryConfig,
    this.otaType,
    this.protocol,
    this.s3Url,
    this.status,
    this.tags,
    this.target,
    this.taskArn,
    this.taskConfigurationId,
    this.taskId,
    this.taskProcessingDetails,
  });

  factory GetOtaTaskResponse.fromJson(Map<String, dynamic> json) {
    return GetOtaTaskResponse(
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      otaMechanism:
          (json['OtaMechanism'] as String?)?.let(OtaMechanism.fromString),
      otaSchedulingConfig: json['OtaSchedulingConfig'] != null
          ? OtaTaskSchedulingConfig.fromJson(
              json['OtaSchedulingConfig'] as Map<String, dynamic>)
          : null,
      otaTargetQueryString: json['OtaTargetQueryString'] as String?,
      otaTaskExecutionRetryConfig: json['OtaTaskExecutionRetryConfig'] != null
          ? OtaTaskExecutionRetryConfig.fromJson(
              json['OtaTaskExecutionRetryConfig'] as Map<String, dynamic>)
          : null,
      otaType: (json['OtaType'] as String?)?.let(OtaType.fromString),
      protocol: (json['Protocol'] as String?)?.let(OtaProtocol.fromString),
      s3Url: json['S3Url'] as String?,
      status: (json['Status'] as String?)?.let(OtaStatus.fromString),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      target:
          (json['Target'] as List?)?.nonNulls.map((e) => e as String).toList(),
      taskArn: json['TaskArn'] as String?,
      taskConfigurationId: json['TaskConfigurationId'] as String?,
      taskId: json['TaskId'] as String?,
      taskProcessingDetails: json['TaskProcessingDetails'] != null
          ? TaskProcessingDetails.fromJson(
              json['TaskProcessingDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final description = this.description;
    final lastUpdatedAt = this.lastUpdatedAt;
    final otaMechanism = this.otaMechanism;
    final otaSchedulingConfig = this.otaSchedulingConfig;
    final otaTargetQueryString = this.otaTargetQueryString;
    final otaTaskExecutionRetryConfig = this.otaTaskExecutionRetryConfig;
    final otaType = this.otaType;
    final protocol = this.protocol;
    final s3Url = this.s3Url;
    final status = this.status;
    final tags = this.tags;
    final target = this.target;
    final taskArn = this.taskArn;
    final taskConfigurationId = this.taskConfigurationId;
    final taskId = this.taskId;
    final taskProcessingDetails = this.taskProcessingDetails;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (description != null) 'Description': description,
      if (lastUpdatedAt != null)
        'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (otaMechanism != null) 'OtaMechanism': otaMechanism.value,
      if (otaSchedulingConfig != null)
        'OtaSchedulingConfig': otaSchedulingConfig,
      if (otaTargetQueryString != null)
        'OtaTargetQueryString': otaTargetQueryString,
      if (otaTaskExecutionRetryConfig != null)
        'OtaTaskExecutionRetryConfig': otaTaskExecutionRetryConfig,
      if (otaType != null) 'OtaType': otaType.value,
      if (protocol != null) 'Protocol': protocol.value,
      if (s3Url != null) 'S3Url': s3Url,
      if (status != null) 'Status': status.value,
      if (tags != null) 'Tags': tags,
      if (target != null) 'Target': target,
      if (taskArn != null) 'TaskArn': taskArn,
      if (taskConfigurationId != null)
        'TaskConfigurationId': taskConfigurationId,
      if (taskId != null) 'TaskId': taskId,
      if (taskProcessingDetails != null)
        'TaskProcessingDetails': taskProcessingDetails,
    };
  }
}

class ListOtaTasksResponse {
  /// A token that can be used to retrieve the next set of results.
  final String? nextToken;

  /// A list of all of the over-the-air (OTA) tasks.
  final List<OtaTaskSummary>? tasks;

  ListOtaTasksResponse({
    this.nextToken,
    this.tasks,
  });

  factory ListOtaTasksResponse.fromJson(Map<String, dynamic> json) {
    return ListOtaTasksResponse(
      nextToken: json['NextToken'] as String?,
      tasks: (json['Tasks'] as List?)
          ?.nonNulls
          .map((e) => OtaTaskSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final tasks = this.tasks;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (tasks != null) 'Tasks': tasks,
    };
  }
}

class ListOtaTaskExecutionsResponse {
  /// A list of all of the over-the-air (OTA) task executions.
  final List<OtaTaskExecutionSummaries>? executionSummaries;

  /// A token that can be used to retrieve the next set of results.
  final String? nextToken;

  ListOtaTaskExecutionsResponse({
    this.executionSummaries,
    this.nextToken,
  });

  factory ListOtaTaskExecutionsResponse.fromJson(Map<String, dynamic> json) {
    return ListOtaTaskExecutionsResponse(
      executionSummaries: (json['ExecutionSummaries'] as List?)
          ?.nonNulls
          .map((e) =>
              OtaTaskExecutionSummaries.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final executionSummaries = this.executionSummaries;
    final nextToken = this.nextToken;
    return {
      if (executionSummaries != null) 'ExecutionSummaries': executionSummaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class CreateProvisioningProfileResponse {
  /// The Amazon Resource Name (ARN) of the provisioning profile.
  final String? arn;

  /// The body of the PEM-encoded claim certificate.
  final String? claimCertificate;

  /// The private key of the claim certificate. This may be stored securely on the
  /// device for validating the connection endpoint with IoT managed integrations
  /// using the public key.
  final String? claimCertificatePrivateKey;

  /// The identifier of the provisioning profile.
  final String? id;

  /// The name of the provisioning profile.
  final String? name;

  /// The type of provisioning workflow the device uses for onboarding to IoT
  /// managed integrations.
  final ProvisioningType? provisioningType;

  /// The status of a provisioning profile.
  final ProvisioningProfileStatus? status;

  CreateProvisioningProfileResponse({
    this.arn,
    this.claimCertificate,
    this.claimCertificatePrivateKey,
    this.id,
    this.name,
    this.provisioningType,
    this.status,
  });

  factory CreateProvisioningProfileResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateProvisioningProfileResponse(
      arn: json['Arn'] as String?,
      claimCertificate: json['ClaimCertificate'] as String?,
      claimCertificatePrivateKey: json['ClaimCertificatePrivateKey'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      provisioningType: (json['ProvisioningType'] as String?)
          ?.let(ProvisioningType.fromString),
      status: (json['Status'] as String?)
          ?.let(ProvisioningProfileStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final claimCertificate = this.claimCertificate;
    final claimCertificatePrivateKey = this.claimCertificatePrivateKey;
    final id = this.id;
    final name = this.name;
    final provisioningType = this.provisioningType;
    final status = this.status;
    return {
      if (arn != null) 'Arn': arn,
      if (claimCertificate != null) 'ClaimCertificate': claimCertificate,
      if (claimCertificatePrivateKey != null)
        'ClaimCertificatePrivateKey': claimCertificatePrivateKey,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (provisioningType != null) 'ProvisioningType': provisioningType.value,
      if (status != null) 'Status': status.value,
    };
  }
}

class GetProvisioningProfileResponse {
  /// The Amazon Resource Name (ARN) of the provisioning profile.
  final String? arn;

  /// The body of the PEM-encoded claim certificate.
  final String? claimCertificate;

  /// The provisioning profile id.
  final String? id;

  /// The name of the provisioning profile.
  final String? name;

  /// The type of provisioning workflow the device uses for onboarding to IoT
  /// managed integrations.
  final ProvisioningType? provisioningType;

  /// The status of a provisioning profile.
  final ProvisioningProfileStatus? status;

  /// A set of key/value pairs that are used to manage the provisioning profile.
  final Map<String, String>? tags;

  GetProvisioningProfileResponse({
    this.arn,
    this.claimCertificate,
    this.id,
    this.name,
    this.provisioningType,
    this.status,
    this.tags,
  });

  factory GetProvisioningProfileResponse.fromJson(Map<String, dynamic> json) {
    return GetProvisioningProfileResponse(
      arn: json['Arn'] as String?,
      claimCertificate: json['ClaimCertificate'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      provisioningType: (json['ProvisioningType'] as String?)
          ?.let(ProvisioningType.fromString),
      status: (json['Status'] as String?)
          ?.let(ProvisioningProfileStatus.fromString),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final claimCertificate = this.claimCertificate;
    final id = this.id;
    final name = this.name;
    final provisioningType = this.provisioningType;
    final status = this.status;
    final tags = this.tags;
    return {
      if (arn != null) 'Arn': arn,
      if (claimCertificate != null) 'ClaimCertificate': claimCertificate,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (provisioningType != null) 'ProvisioningType': provisioningType.value,
      if (status != null) 'Status': status.value,
      if (tags != null) 'Tags': tags,
    };
  }
}

class ListProvisioningProfilesResponse {
  /// The list of provisioning profiles.
  final List<ProvisioningProfileSummary>? items;

  /// A token that can be used to retrieve the next set of results.
  final String? nextToken;

  ListProvisioningProfilesResponse({
    this.items,
    this.nextToken,
  });

  factory ListProvisioningProfilesResponse.fromJson(Map<String, dynamic> json) {
    return ListProvisioningProfilesResponse(
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) =>
              ProvisioningProfileSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class GetRuntimeLogConfigurationResponse {
  /// The id for a managed thing.
  final String? managedThingId;

  /// The runtime log configuration for a managed thing.
  final RuntimeLogConfigurations? runtimeLogConfigurations;

  GetRuntimeLogConfigurationResponse({
    this.managedThingId,
    this.runtimeLogConfigurations,
  });

  factory GetRuntimeLogConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetRuntimeLogConfigurationResponse(
      managedThingId: json['ManagedThingId'] as String?,
      runtimeLogConfigurations: json['RuntimeLogConfigurations'] != null
          ? RuntimeLogConfigurations.fromJson(
              json['RuntimeLogConfigurations'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final managedThingId = this.managedThingId;
    final runtimeLogConfigurations = this.runtimeLogConfigurations;
    return {
      if (managedThingId != null) 'ManagedThingId': managedThingId,
      if (runtimeLogConfigurations != null)
        'RuntimeLogConfigurations': runtimeLogConfigurations,
    };
  }
}

class GetSchemaVersionResponse {
  /// The description of the schema version.
  final String? description;

  /// The name of the schema version.
  final String? namespace;

  /// The schema of the schema version.
  final Object? schema;

  /// The id of the schema version.
  final String? schemaId;

  /// The schema version. If this is left blank, it defaults to the latest
  /// version.
  final String? semanticVersion;

  /// The type of schema version.
  final SchemaVersionType? type;

  /// The visibility of the schema version.
  final SchemaVersionVisibility? visibility;

  GetSchemaVersionResponse({
    this.description,
    this.namespace,
    this.schema,
    this.schemaId,
    this.semanticVersion,
    this.type,
    this.visibility,
  });

  factory GetSchemaVersionResponse.fromJson(Map<String, dynamic> json) {
    return GetSchemaVersionResponse(
      description: json['Description'] as String?,
      namespace: json['Namespace'] as String?,
      schema: json['Schema'],
      schemaId: json['SchemaId'] as String?,
      semanticVersion: json['SemanticVersion'] as String?,
      type: (json['Type'] as String?)?.let(SchemaVersionType.fromString),
      visibility: (json['Visibility'] as String?)
          ?.let(SchemaVersionVisibility.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final namespace = this.namespace;
    final schema = this.schema;
    final schemaId = this.schemaId;
    final semanticVersion = this.semanticVersion;
    final type = this.type;
    final visibility = this.visibility;
    return {
      if (description != null) 'Description': description,
      if (namespace != null) 'Namespace': namespace,
      if (schema != null) 'Schema': schema,
      if (schemaId != null) 'SchemaId': schemaId,
      if (semanticVersion != null) 'SemanticVersion': semanticVersion,
      if (type != null) 'Type': type.value,
      if (visibility != null) 'Visibility': visibility.value,
    };
  }
}

class ListSchemaVersionsResponse {
  /// The list of schema versions.
  final List<SchemaVersionListItem>? items;

  /// A token that can be used to retrieve the next set of results.
  final String? nextToken;

  ListSchemaVersionsResponse({
    this.items,
    this.nextToken,
  });

  factory ListSchemaVersionsResponse.fromJson(Map<String, dynamic> json) {
    return ListSchemaVersionsResponse(
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) => SchemaVersionListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// List item describing a schema version.
class SchemaVersionListItem {
  /// A description of the schema version.
  final String? description;

  /// The name of the schema version.
  final String? namespace;

  /// The identifier of the schema version.
  final String? schemaId;

  /// The schema version. If this is left blank, it defaults to the latest
  /// version.
  final String? semanticVersion;

  /// The type of schema version.
  final SchemaVersionType? type;

  /// The visibility of the schema version.
  final SchemaVersionVisibility? visibility;

  SchemaVersionListItem({
    this.description,
    this.namespace,
    this.schemaId,
    this.semanticVersion,
    this.type,
    this.visibility,
  });

  factory SchemaVersionListItem.fromJson(Map<String, dynamic> json) {
    return SchemaVersionListItem(
      description: json['Description'] as String?,
      namespace: json['Namespace'] as String?,
      schemaId: json['SchemaId'] as String?,
      semanticVersion: json['SemanticVersion'] as String?,
      type: (json['Type'] as String?)?.let(SchemaVersionType.fromString),
      visibility: (json['Visibility'] as String?)
          ?.let(SchemaVersionVisibility.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final namespace = this.namespace;
    final schemaId = this.schemaId;
    final semanticVersion = this.semanticVersion;
    final type = this.type;
    final visibility = this.visibility;
    return {
      if (description != null) 'Description': description,
      if (namespace != null) 'Namespace': namespace,
      if (schemaId != null) 'SchemaId': schemaId,
      if (semanticVersion != null) 'SemanticVersion': semanticVersion,
      if (type != null) 'Type': type.value,
      if (visibility != null) 'Visibility': visibility.value,
    };
  }
}

class SchemaVersionType {
  static const capability = SchemaVersionType._('capability');
  static const definition = SchemaVersionType._('definition');

  final String value;

  const SchemaVersionType._(this.value);

  static const values = [capability, definition];

  static SchemaVersionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SchemaVersionType._(value));

  @override
  bool operator ==(other) => other is SchemaVersionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class SchemaVersionVisibility {
  static const public = SchemaVersionVisibility._('PUBLIC');
  static const private = SchemaVersionVisibility._('PRIVATE');

  final String value;

  const SchemaVersionVisibility._(this.value);

  static const values = [public, private];

  static SchemaVersionVisibility fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SchemaVersionVisibility._(value));

  @override
  bool operator ==(other) =>
      other is SchemaVersionVisibility && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class SchemaVersionFormat {
  static const aws = SchemaVersionFormat._('AWS');
  static const zcl = SchemaVersionFormat._('ZCL');
  static const connector = SchemaVersionFormat._('CONNECTOR');

  final String value;

  const SchemaVersionFormat._(this.value);

  static const values = [aws, zcl, connector];

  static SchemaVersionFormat fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SchemaVersionFormat._(value));

  @override
  bool operator ==(other) =>
      other is SchemaVersionFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The different configurations for runtime logs.
class RuntimeLogConfigurations {
  /// Configuration to enable or disable deleting of runtime logs in the device
  /// once uploaded to the cloud.
  final bool? deleteLocalStoreAfterUpload;

  /// Configuration to set the maximum bytes of runtime logs that can be stored on
  /// the device before the oldest logs are deleted or overwritten.
  final int? localStoreFileRotationMaxBytes;

  /// Configuration to set the maximum number of runtime log files that can be
  /// stored on the device before the oldest files are deleted or overwritten.
  final int? localStoreFileRotationMaxFiles;

  /// Configuration of where to store runtime logs in the device.
  final String? localStoreLocation;

  /// The different log levels available for configuration.
  final LogLevel? logFlushLevel;

  /// The different log levels available for configuration.
  final LogLevel? logLevel;

  /// Configuration to enable or disable uploading of runtime logs to the cloud.
  final bool? uploadLog;

  /// Configuration to set the time interval in minutes between each batch of
  /// runtime logs that the device uploads to the cloud.
  final int? uploadPeriodMinutes;

  RuntimeLogConfigurations({
    this.deleteLocalStoreAfterUpload,
    this.localStoreFileRotationMaxBytes,
    this.localStoreFileRotationMaxFiles,
    this.localStoreLocation,
    this.logFlushLevel,
    this.logLevel,
    this.uploadLog,
    this.uploadPeriodMinutes,
  });

  factory RuntimeLogConfigurations.fromJson(Map<String, dynamic> json) {
    return RuntimeLogConfigurations(
      deleteLocalStoreAfterUpload: json['DeleteLocalStoreAfterUpload'] as bool?,
      localStoreFileRotationMaxBytes:
          json['LocalStoreFileRotationMaxBytes'] as int?,
      localStoreFileRotationMaxFiles:
          json['LocalStoreFileRotationMaxFiles'] as int?,
      localStoreLocation: json['LocalStoreLocation'] as String?,
      logFlushLevel:
          (json['LogFlushLevel'] as String?)?.let(LogLevel.fromString),
      logLevel: (json['LogLevel'] as String?)?.let(LogLevel.fromString),
      uploadLog: json['UploadLog'] as bool?,
      uploadPeriodMinutes: json['UploadPeriodMinutes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final deleteLocalStoreAfterUpload = this.deleteLocalStoreAfterUpload;
    final localStoreFileRotationMaxBytes = this.localStoreFileRotationMaxBytes;
    final localStoreFileRotationMaxFiles = this.localStoreFileRotationMaxFiles;
    final localStoreLocation = this.localStoreLocation;
    final logFlushLevel = this.logFlushLevel;
    final logLevel = this.logLevel;
    final uploadLog = this.uploadLog;
    final uploadPeriodMinutes = this.uploadPeriodMinutes;
    return {
      if (deleteLocalStoreAfterUpload != null)
        'DeleteLocalStoreAfterUpload': deleteLocalStoreAfterUpload,
      if (localStoreFileRotationMaxBytes != null)
        'LocalStoreFileRotationMaxBytes': localStoreFileRotationMaxBytes,
      if (localStoreFileRotationMaxFiles != null)
        'LocalStoreFileRotationMaxFiles': localStoreFileRotationMaxFiles,
      if (localStoreLocation != null) 'LocalStoreLocation': localStoreLocation,
      if (logFlushLevel != null) 'LogFlushLevel': logFlushLevel.value,
      if (logLevel != null) 'LogLevel': logLevel.value,
      if (uploadLog != null) 'UploadLog': uploadLog,
      if (uploadPeriodMinutes != null)
        'UploadPeriodMinutes': uploadPeriodMinutes,
    };
  }
}

class LogLevel {
  static const debug = LogLevel._('DEBUG');
  static const error = LogLevel._('ERROR');
  static const info = LogLevel._('INFO');
  static const warn = LogLevel._('WARN');

  final String value;

  const LogLevel._(this.value);

  static const values = [debug, error, info, warn];

  static LogLevel fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => LogLevel._(value));

  @override
  bool operator ==(other) => other is LogLevel && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Structure describing a provisioning profile.
class ProvisioningProfileSummary {
  /// The Amazon Resource Name (ARN) of the provisioning profile.
  final String? arn;

  /// The identifier of the provisioning profile.
  final String? id;

  /// The name of the provisioning profile.
  final String? name;

  /// The type of provisioning workflow the device uses for onboarding to IoT
  /// managed integrations.
  final ProvisioningType? provisioningType;

  /// The status of a provisioning profile.
  final ProvisioningProfileStatus? status;

  ProvisioningProfileSummary({
    this.arn,
    this.id,
    this.name,
    this.provisioningType,
    this.status,
  });

  factory ProvisioningProfileSummary.fromJson(Map<String, dynamic> json) {
    return ProvisioningProfileSummary(
      arn: json['Arn'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      provisioningType: (json['ProvisioningType'] as String?)
          ?.let(ProvisioningType.fromString),
      status: (json['Status'] as String?)
          ?.let(ProvisioningProfileStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final provisioningType = this.provisioningType;
    final status = this.status;
    return {
      if (arn != null) 'Arn': arn,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (provisioningType != null) 'ProvisioningType': provisioningType.value,
      if (status != null) 'Status': status.value,
    };
  }
}

class ProvisioningType {
  static const fleetProvisioning = ProvisioningType._('FLEET_PROVISIONING');
  static const jitr = ProvisioningType._('JITR');

  final String value;

  const ProvisioningType._(this.value);

  static const values = [fleetProvisioning, jitr];

  static ProvisioningType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ProvisioningType._(value));

  @override
  bool operator ==(other) => other is ProvisioningType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ProvisioningProfileStatus {
  static const createInProgress =
      ProvisioningProfileStatus._('CREATE_IN_PROGRESS');
  static const createFailed = ProvisioningProfileStatus._('CREATE_FAILED');
  static const created = ProvisioningProfileStatus._('CREATED');
  static const deleteInProgress =
      ProvisioningProfileStatus._('DELETE_IN_PROGRESS');
  static const deleteFailed = ProvisioningProfileStatus._('DELETE_FAILED');

  final String value;

  const ProvisioningProfileStatus._(this.value);

  static const values = [
    createInProgress,
    createFailed,
    created,
    deleteInProgress,
    deleteFailed
  ];

  static ProvisioningProfileStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ProvisioningProfileStatus._(value));

  @override
  bool operator ==(other) =>
      other is ProvisioningProfileStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Structure representing one execution summary.
class OtaTaskExecutionSummaries {
  /// The id of a managed thing.
  final String? managedThingId;

  /// Structure representing one over-the-air (OTA) task execution summary
  final OtaTaskExecutionSummary? taskExecutionSummary;

  OtaTaskExecutionSummaries({
    this.managedThingId,
    this.taskExecutionSummary,
  });

  factory OtaTaskExecutionSummaries.fromJson(Map<String, dynamic> json) {
    return OtaTaskExecutionSummaries(
      managedThingId: json['ManagedThingId'] as String?,
      taskExecutionSummary: json['TaskExecutionSummary'] != null
          ? OtaTaskExecutionSummary.fromJson(
              json['TaskExecutionSummary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final managedThingId = this.managedThingId;
    final taskExecutionSummary = this.taskExecutionSummary;
    return {
      if (managedThingId != null) 'ManagedThingId': managedThingId,
      if (taskExecutionSummary != null)
        'TaskExecutionSummary': taskExecutionSummary,
    };
  }
}

/// Structure representing one over-the-air (OTA) task execution summary.
class OtaTaskExecutionSummary {
  /// The execution number of the over-the-air (OTA) task execution summary.
  final int? executionNumber;

  /// The timestamp value of when the over-the-air (OTA) task execution summary
  /// was last updated.
  final DateTime? lastUpdatedAt;

  /// The timestamp value of when the over-the-air (OTA) task execution summary is
  /// targeted to start.
  final DateTime? queuedAt;

  /// The number of retry attempts for starting the over-the-air (OTA) task
  /// execution summary after a failed attempt.
  final int? retryAttempt;

  /// The timestamp value of when the over-the-air (OTA) task execution summary
  /// started.
  final DateTime? startedAt;

  /// The status of the over-the-air (OTA) task execution summary.
  final OtaTaskExecutionStatus? status;

  OtaTaskExecutionSummary({
    this.executionNumber,
    this.lastUpdatedAt,
    this.queuedAt,
    this.retryAttempt,
    this.startedAt,
    this.status,
  });

  factory OtaTaskExecutionSummary.fromJson(Map<String, dynamic> json) {
    return OtaTaskExecutionSummary(
      executionNumber: json['ExecutionNumber'] as int?,
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      queuedAt: timeStampFromJson(json['QueuedAt']),
      retryAttempt: json['RetryAttempt'] as int?,
      startedAt: timeStampFromJson(json['StartedAt']),
      status:
          (json['Status'] as String?)?.let(OtaTaskExecutionStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final executionNumber = this.executionNumber;
    final lastUpdatedAt = this.lastUpdatedAt;
    final queuedAt = this.queuedAt;
    final retryAttempt = this.retryAttempt;
    final startedAt = this.startedAt;
    final status = this.status;
    return {
      if (executionNumber != null) 'ExecutionNumber': executionNumber,
      if (lastUpdatedAt != null)
        'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (queuedAt != null) 'QueuedAt': unixTimestampToJson(queuedAt),
      if (retryAttempt != null) 'RetryAttempt': retryAttempt,
      if (startedAt != null) 'StartedAt': unixTimestampToJson(startedAt),
      if (status != null) 'Status': status.value,
    };
  }
}

class OtaTaskExecutionStatus {
  static const queued = OtaTaskExecutionStatus._('QUEUED');
  static const inProgress = OtaTaskExecutionStatus._('IN_PROGRESS');
  static const succeeded = OtaTaskExecutionStatus._('SUCCEEDED');
  static const failed = OtaTaskExecutionStatus._('FAILED');
  static const timedOut = OtaTaskExecutionStatus._('TIMED_OUT');
  static const rejected = OtaTaskExecutionStatus._('REJECTED');
  static const removed = OtaTaskExecutionStatus._('REMOVED');
  static const canceled = OtaTaskExecutionStatus._('CANCELED');

  final String value;

  const OtaTaskExecutionStatus._(this.value);

  static const values = [
    queued,
    inProgress,
    succeeded,
    failed,
    timedOut,
    rejected,
    removed,
    canceled
  ];

  static OtaTaskExecutionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => OtaTaskExecutionStatus._(value));

  @override
  bool operator ==(other) =>
      other is OtaTaskExecutionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Structure representing one over-the-air (OTA) task.
class OtaTaskSummary {
  /// The timestamp value of when the over-the-air (OTA) task was created at.
  final DateTime? createdAt;

  /// The timestamp value of when the over-the-air (OTA) task was last updated at.
  final DateTime? lastUpdatedAt;

  /// The status of the over-the-air (OTA) task summary.
  final OtaStatus? status;

  /// The Amazon Resource Name (ARN) of the over-the-air (OTA) task.
  final String? taskArn;

  /// The identifier for the over-the-air (OTA) task configuration.
  final String? taskConfigurationId;

  /// The id of the over-the-air (OTA) task.
  final String? taskId;

  OtaTaskSummary({
    this.createdAt,
    this.lastUpdatedAt,
    this.status,
    this.taskArn,
    this.taskConfigurationId,
    this.taskId,
  });

  factory OtaTaskSummary.fromJson(Map<String, dynamic> json) {
    return OtaTaskSummary(
      createdAt: timeStampFromJson(json['CreatedAt']),
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      status: (json['Status'] as String?)?.let(OtaStatus.fromString),
      taskArn: json['TaskArn'] as String?,
      taskConfigurationId: json['TaskConfigurationId'] as String?,
      taskId: json['TaskId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final lastUpdatedAt = this.lastUpdatedAt;
    final status = this.status;
    final taskArn = this.taskArn;
    final taskConfigurationId = this.taskConfigurationId;
    final taskId = this.taskId;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (lastUpdatedAt != null)
        'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (status != null) 'Status': status.value,
      if (taskArn != null) 'TaskArn': taskArn,
      if (taskConfigurationId != null)
        'TaskConfigurationId': taskConfigurationId,
      if (taskId != null) 'TaskId': taskId,
    };
  }
}

class OtaStatus {
  static const inProgress = OtaStatus._('IN_PROGRESS');
  static const canceled = OtaStatus._('CANCELED');
  static const completed = OtaStatus._('COMPLETED');
  static const deletionInProgress = OtaStatus._('DELETION_IN_PROGRESS');
  static const scheduled = OtaStatus._('SCHEDULED');

  final String value;

  const OtaStatus._(this.value);

  static const values = [
    inProgress,
    canceled,
    completed,
    deletionInProgress,
    scheduled
  ];

  static OtaStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => OtaStatus._(value));

  @override
  bool operator ==(other) => other is OtaStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class OtaProtocol {
  static const http = OtaProtocol._('HTTP');

  final String value;

  const OtaProtocol._(this.value);

  static const values = [http];

  static OtaProtocol fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => OtaProtocol._(value));

  @override
  bool operator ==(other) => other is OtaProtocol && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class OtaType {
  static const oneTime = OtaType._('ONE_TIME');
  static const continuous = OtaType._('CONTINUOUS');

  final String value;

  const OtaType._(this.value);

  static const values = [oneTime, continuous];

  static OtaType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => OtaType._(value));

  @override
  bool operator ==(other) => other is OtaType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class OtaMechanism {
  static const push = OtaMechanism._('PUSH');

  final String value;

  const OtaMechanism._(this.value);

  static const values = [push];

  static OtaMechanism fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => OtaMechanism._(value));

  @override
  bool operator ==(other) => other is OtaMechanism && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about the over-the-air (OTA) task process.
class TaskProcessingDetails {
  /// The number of canceled things in an over-the-air (OTA) task.
  final int? numberOfCanceledThings;

  /// The number of failed things in an over-the-air (OTA) task.
  final int? numberOfFailedThings;

  /// The number of in progress things in an over-the-air (OTA) task.
  final int? numberOfInProgressThings;

  /// The number of queued things in an over-the-air (OTA) task.
  final int? numberOfQueuedThings;

  /// The number of rejected things in an over-the-air (OTA) task.
  final int? numberOfRejectedThings;

  /// The number of removed things in an over-the-air (OTA) task.
  final int? numberOfRemovedThings;

  /// The number of succeeded things in an over-the-air (OTA) task.
  final int? numberOfSucceededThings;

  /// The number of timed out things in an over-the-air (OTA) task.
  final int? numberOfTimedOutThings;

  /// The targets of the over-the-air (OTA) task.
  final List<String>? processingTargets;

  TaskProcessingDetails({
    this.numberOfCanceledThings,
    this.numberOfFailedThings,
    this.numberOfInProgressThings,
    this.numberOfQueuedThings,
    this.numberOfRejectedThings,
    this.numberOfRemovedThings,
    this.numberOfSucceededThings,
    this.numberOfTimedOutThings,
    this.processingTargets,
  });

  factory TaskProcessingDetails.fromJson(Map<String, dynamic> json) {
    return TaskProcessingDetails(
      numberOfCanceledThings: json['NumberOfCanceledThings'] as int?,
      numberOfFailedThings: json['NumberOfFailedThings'] as int?,
      numberOfInProgressThings: json['NumberOfInProgressThings'] as int?,
      numberOfQueuedThings: json['numberOfQueuedThings'] as int?,
      numberOfRejectedThings: json['numberOfRejectedThings'] as int?,
      numberOfRemovedThings: json['numberOfRemovedThings'] as int?,
      numberOfSucceededThings: json['numberOfSucceededThings'] as int?,
      numberOfTimedOutThings: json['numberOfTimedOutThings'] as int?,
      processingTargets: (json['processingTargets'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final numberOfCanceledThings = this.numberOfCanceledThings;
    final numberOfFailedThings = this.numberOfFailedThings;
    final numberOfInProgressThings = this.numberOfInProgressThings;
    final numberOfQueuedThings = this.numberOfQueuedThings;
    final numberOfRejectedThings = this.numberOfRejectedThings;
    final numberOfRemovedThings = this.numberOfRemovedThings;
    final numberOfSucceededThings = this.numberOfSucceededThings;
    final numberOfTimedOutThings = this.numberOfTimedOutThings;
    final processingTargets = this.processingTargets;
    return {
      if (numberOfCanceledThings != null)
        'NumberOfCanceledThings': numberOfCanceledThings,
      if (numberOfFailedThings != null)
        'NumberOfFailedThings': numberOfFailedThings,
      if (numberOfInProgressThings != null)
        'NumberOfInProgressThings': numberOfInProgressThings,
      if (numberOfQueuedThings != null)
        'numberOfQueuedThings': numberOfQueuedThings,
      if (numberOfRejectedThings != null)
        'numberOfRejectedThings': numberOfRejectedThings,
      if (numberOfRemovedThings != null)
        'numberOfRemovedThings': numberOfRemovedThings,
      if (numberOfSucceededThings != null)
        'numberOfSucceededThings': numberOfSucceededThings,
      if (numberOfTimedOutThings != null)
        'numberOfTimedOutThings': numberOfTimedOutThings,
      if (processingTargets != null) 'processingTargets': processingTargets,
    };
  }
}

/// Over-the-air (OTA) task scheduling config.
class OtaTaskSchedulingConfig {
  /// Specifies the end behavior for all task executions after a task reaches the
  /// selected <code>endTime</code>. If <code>endTime</code> is not selected when
  /// creating the task, then <code>endBehavior</code> does not apply.
  final SchedulingConfigEndBehavior? endBehavior;

  /// The time an over-the-air (OTA) task will stop.
  final String? endTime;

  /// Maintenance window list for over-the-air (OTA) task scheduling config.
  final List<ScheduleMaintenanceWindow>? maintenanceWindows;

  /// The time an over-the-air (OTA) task will start.
  final String? startTime;

  OtaTaskSchedulingConfig({
    this.endBehavior,
    this.endTime,
    this.maintenanceWindows,
    this.startTime,
  });

  factory OtaTaskSchedulingConfig.fromJson(Map<String, dynamic> json) {
    return OtaTaskSchedulingConfig(
      endBehavior: (json['EndBehavior'] as String?)
          ?.let(SchedulingConfigEndBehavior.fromString),
      endTime: json['EndTime'] as String?,
      maintenanceWindows: (json['MaintenanceWindows'] as List?)
          ?.nonNulls
          .map((e) =>
              ScheduleMaintenanceWindow.fromJson(e as Map<String, dynamic>))
          .toList(),
      startTime: json['StartTime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endBehavior = this.endBehavior;
    final endTime = this.endTime;
    final maintenanceWindows = this.maintenanceWindows;
    final startTime = this.startTime;
    return {
      if (endBehavior != null) 'EndBehavior': endBehavior.value,
      if (endTime != null) 'EndTime': endTime,
      if (maintenanceWindows != null) 'MaintenanceWindows': maintenanceWindows,
      if (startTime != null) 'StartTime': startTime,
    };
  }
}

/// Over-the-air (OTA) task retry config.
class OtaTaskExecutionRetryConfig {
  /// The list of retry config criteria.
  final List<RetryConfigCriteria>? retryConfigCriteria;

  OtaTaskExecutionRetryConfig({
    this.retryConfigCriteria,
  });

  factory OtaTaskExecutionRetryConfig.fromJson(Map<String, dynamic> json) {
    return OtaTaskExecutionRetryConfig(
      retryConfigCriteria: (json['RetryConfigCriteria'] as List?)
          ?.nonNulls
          .map((e) => RetryConfigCriteria.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final retryConfigCriteria = this.retryConfigCriteria;
    return {
      if (retryConfigCriteria != null)
        'RetryConfigCriteria': retryConfigCriteria,
    };
  }
}

/// Structure representing one retry config criteria.
class RetryConfigCriteria {
  /// Over-the-air (OTA) retry criteria failure type.
  final RetryCriteriaFailureType? failureType;

  /// The number of retries allowed for a failure type for the over-the-air (OTA)
  /// task.
  final int? minNumberOfRetries;

  RetryConfigCriteria({
    this.failureType,
    this.minNumberOfRetries,
  });

  factory RetryConfigCriteria.fromJson(Map<String, dynamic> json) {
    return RetryConfigCriteria(
      failureType: (json['FailureType'] as String?)
          ?.let(RetryCriteriaFailureType.fromString),
      minNumberOfRetries: json['MinNumberOfRetries'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final failureType = this.failureType;
    final minNumberOfRetries = this.minNumberOfRetries;
    return {
      if (failureType != null) 'FailureType': failureType.value,
      if (minNumberOfRetries != null) 'MinNumberOfRetries': minNumberOfRetries,
    };
  }
}

class RetryCriteriaFailureType {
  static const failed = RetryCriteriaFailureType._('FAILED');
  static const timedOut = RetryCriteriaFailureType._('TIMED_OUT');
  static const all = RetryCriteriaFailureType._('ALL');

  final String value;

  const RetryCriteriaFailureType._(this.value);

  static const values = [failed, timedOut, all];

  static RetryCriteriaFailureType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RetryCriteriaFailureType._(value));

  @override
  bool operator ==(other) =>
      other is RetryCriteriaFailureType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class SchedulingConfigEndBehavior {
  static const stopRollout = SchedulingConfigEndBehavior._('STOP_ROLLOUT');
  static const cancel = SchedulingConfigEndBehavior._('CANCEL');
  static const forceCancel = SchedulingConfigEndBehavior._('FORCE_CANCEL');

  final String value;

  const SchedulingConfigEndBehavior._(this.value);

  static const values = [stopRollout, cancel, forceCancel];

  static SchedulingConfigEndBehavior fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SchedulingConfigEndBehavior._(value));

  @override
  bool operator ==(other) =>
      other is SchedulingConfigEndBehavior && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Structure representing scheduling maintenance window.
class ScheduleMaintenanceWindow {
  /// Displays the duration of the next maintenance window.
  final int? durationInMinutes;

  /// Displays the start time of the next maintenance window.
  final String? startTime;

  ScheduleMaintenanceWindow({
    this.durationInMinutes,
    this.startTime,
  });

  factory ScheduleMaintenanceWindow.fromJson(Map<String, dynamic> json) {
    return ScheduleMaintenanceWindow(
      durationInMinutes: json['DurationInMinutes'] as int?,
      startTime: json['StartTime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final durationInMinutes = this.durationInMinutes;
    final startTime = this.startTime;
    return {
      if (durationInMinutes != null) 'DurationInMinutes': durationInMinutes,
      if (startTime != null) 'StartTime': startTime,
    };
  }
}

/// Structure representing one over-the-air (OTA) task configuration.
class OtaTaskConfigurationSummary {
  /// The timestamp value of when the over-the-air (OTA) task configuration was
  /// created at.
  final DateTime? createdAt;

  /// The name of the over-the-air (OTA) task configuration.
  final String? name;

  /// The id of the over-the-air (OTA) task configuration
  final String? taskConfigurationId;

  OtaTaskConfigurationSummary({
    this.createdAt,
    this.name,
    this.taskConfigurationId,
  });

  factory OtaTaskConfigurationSummary.fromJson(Map<String, dynamic> json) {
    return OtaTaskConfigurationSummary(
      createdAt: timeStampFromJson(json['CreatedAt']),
      name: json['Name'] as String?,
      taskConfigurationId: json['TaskConfigurationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final name = this.name;
    final taskConfigurationId = this.taskConfigurationId;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (name != null) 'Name': name,
      if (taskConfigurationId != null)
        'TaskConfigurationId': taskConfigurationId,
    };
  }
}

/// Structure representing a push config.
class PushConfig {
  /// Structure representing one abort config.
  final OtaTaskAbortConfig? abortConfig;

  /// Structure representing one rollout config.
  final OtaTaskExecutionRolloutConfig? rolloutConfig;

  /// Structure representing one timeout config.
  final OtaTaskTimeoutConfig? timeoutConfig;

  PushConfig({
    this.abortConfig,
    this.rolloutConfig,
    this.timeoutConfig,
  });

  factory PushConfig.fromJson(Map<String, dynamic> json) {
    return PushConfig(
      abortConfig: json['AbortConfig'] != null
          ? OtaTaskAbortConfig.fromJson(
              json['AbortConfig'] as Map<String, dynamic>)
          : null,
      rolloutConfig: json['RolloutConfig'] != null
          ? OtaTaskExecutionRolloutConfig.fromJson(
              json['RolloutConfig'] as Map<String, dynamic>)
          : null,
      timeoutConfig: json['TimeoutConfig'] != null
          ? OtaTaskTimeoutConfig.fromJson(
              json['TimeoutConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final abortConfig = this.abortConfig;
    final rolloutConfig = this.rolloutConfig;
    final timeoutConfig = this.timeoutConfig;
    return {
      if (abortConfig != null) 'AbortConfig': abortConfig,
      if (rolloutConfig != null) 'RolloutConfig': rolloutConfig,
      if (timeoutConfig != null) 'TimeoutConfig': timeoutConfig,
    };
  }
}

/// Over-the-air (OTA) task abort config.
class OtaTaskAbortConfig {
  /// The list of criteria for the abort config.
  final List<AbortConfigCriteria>? abortConfigCriteriaList;

  OtaTaskAbortConfig({
    this.abortConfigCriteriaList,
  });

  factory OtaTaskAbortConfig.fromJson(Map<String, dynamic> json) {
    return OtaTaskAbortConfig(
      abortConfigCriteriaList: (json['AbortConfigCriteriaList'] as List?)
          ?.nonNulls
          .map((e) => AbortConfigCriteria.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final abortConfigCriteriaList = this.abortConfigCriteriaList;
    return {
      if (abortConfigCriteriaList != null)
        'AbortConfigCriteriaList': abortConfigCriteriaList,
    };
  }
}

/// Over-the-air (OTA) task rollout config.
class OtaTaskExecutionRolloutConfig {
  /// Structure representing exponential rate of rollout for an over-the-air (OTA)
  /// task.
  final ExponentialRolloutRate? exponentialRolloutRate;

  /// The maximum number of things that will be notified of a pending task, per
  /// minute.
  final int? maximumPerMinute;

  OtaTaskExecutionRolloutConfig({
    this.exponentialRolloutRate,
    this.maximumPerMinute,
  });

  factory OtaTaskExecutionRolloutConfig.fromJson(Map<String, dynamic> json) {
    return OtaTaskExecutionRolloutConfig(
      exponentialRolloutRate: json['ExponentialRolloutRate'] != null
          ? ExponentialRolloutRate.fromJson(
              json['ExponentialRolloutRate'] as Map<String, dynamic>)
          : null,
      maximumPerMinute: json['MaximumPerMinute'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final exponentialRolloutRate = this.exponentialRolloutRate;
    final maximumPerMinute = this.maximumPerMinute;
    return {
      if (exponentialRolloutRate != null)
        'ExponentialRolloutRate': exponentialRolloutRate,
      if (maximumPerMinute != null) 'MaximumPerMinute': maximumPerMinute,
    };
  }
}

/// Over-the-air (OTA) task timeout config.
class OtaTaskTimeoutConfig {
  /// Specifies the amount of time the device has to finish execution of this
  /// task. The timeout interval can be anywhere between 1 minute and 7 days.
  final int? inProgressTimeoutInMinutes;

  OtaTaskTimeoutConfig({
    this.inProgressTimeoutInMinutes,
  });

  factory OtaTaskTimeoutConfig.fromJson(Map<String, dynamic> json) {
    return OtaTaskTimeoutConfig(
      inProgressTimeoutInMinutes: json['InProgressTimeoutInMinutes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final inProgressTimeoutInMinutes = this.inProgressTimeoutInMinutes;
    return {
      if (inProgressTimeoutInMinutes != null)
        'InProgressTimeoutInMinutes': inProgressTimeoutInMinutes,
    };
  }
}

/// Structure representing exponential rate of rollout for an over-the-air (OTA)
/// task.
class ExponentialRolloutRate {
  /// The base rate per minute for the rollout of an over-the-air (OTA) task.
  final int? baseRatePerMinute;

  /// The incremental factor for increasing the rollout rate of an over-the-air
  /// (OTA) task.
  final double? incrementFactor;

  /// The criteria for increasing the rollout rate of an over-the-air (OTA) task.
  final RolloutRateIncreaseCriteria? rateIncreaseCriteria;

  ExponentialRolloutRate({
    this.baseRatePerMinute,
    this.incrementFactor,
    this.rateIncreaseCriteria,
  });

  factory ExponentialRolloutRate.fromJson(Map<String, dynamic> json) {
    return ExponentialRolloutRate(
      baseRatePerMinute: json['BaseRatePerMinute'] as int?,
      incrementFactor: json['IncrementFactor'] as double?,
      rateIncreaseCriteria: json['RateIncreaseCriteria'] != null
          ? RolloutRateIncreaseCriteria.fromJson(
              json['RateIncreaseCriteria'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final baseRatePerMinute = this.baseRatePerMinute;
    final incrementFactor = this.incrementFactor;
    final rateIncreaseCriteria = this.rateIncreaseCriteria;
    return {
      if (baseRatePerMinute != null) 'BaseRatePerMinute': baseRatePerMinute,
      if (incrementFactor != null) 'IncrementFactor': incrementFactor,
      if (rateIncreaseCriteria != null)
        'RateIncreaseCriteria': rateIncreaseCriteria,
    };
  }
}

/// Structure representing rollout config criteria.
class RolloutRateIncreaseCriteria {
  /// The threshold for number of notified things that will initiate the increase
  /// in rate of rollout.
  final int? numberOfNotifiedThings;

  /// The threshold for number of succeeded things that will initiate the increase
  /// in rate of rollout.
  final int? numberOfSucceededThings;

  RolloutRateIncreaseCriteria({
    this.numberOfNotifiedThings,
    this.numberOfSucceededThings,
  });

  factory RolloutRateIncreaseCriteria.fromJson(Map<String, dynamic> json) {
    return RolloutRateIncreaseCriteria(
      numberOfNotifiedThings: json['numberOfNotifiedThings'] as int?,
      numberOfSucceededThings: json['numberOfSucceededThings'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final numberOfNotifiedThings = this.numberOfNotifiedThings;
    final numberOfSucceededThings = this.numberOfSucceededThings;
    return {
      if (numberOfNotifiedThings != null)
        'numberOfNotifiedThings': numberOfNotifiedThings,
      if (numberOfSucceededThings != null)
        'numberOfSucceededThings': numberOfSucceededThings,
    };
  }
}

/// Structure representing one abort config criteria.
class AbortConfigCriteria {
  /// The action taken by the abort configuration.
  final AbortCriteriaAction? action;

  /// Over-the-air (OTA) task abort criteria failure type.
  final AbortCriteriaFailureType? failureType;

  /// The minimum number of things that must receive task execution notifications
  /// before the task can be aborted.
  final int? minNumberOfExecutedThings;

  /// The minimum percentage of over-the-air (OTA) task execution failures that
  /// must occur to initiate the last abort.
  final double? thresholdPercentage;

  AbortConfigCriteria({
    this.action,
    this.failureType,
    this.minNumberOfExecutedThings,
    this.thresholdPercentage,
  });

  factory AbortConfigCriteria.fromJson(Map<String, dynamic> json) {
    return AbortConfigCriteria(
      action: (json['Action'] as String?)?.let(AbortCriteriaAction.fromString),
      failureType: (json['FailureType'] as String?)
          ?.let(AbortCriteriaFailureType.fromString),
      minNumberOfExecutedThings: json['MinNumberOfExecutedThings'] as int?,
      thresholdPercentage: json['ThresholdPercentage'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final failureType = this.failureType;
    final minNumberOfExecutedThings = this.minNumberOfExecutedThings;
    final thresholdPercentage = this.thresholdPercentage;
    return {
      if (action != null) 'Action': action.value,
      if (failureType != null) 'FailureType': failureType.value,
      if (minNumberOfExecutedThings != null)
        'MinNumberOfExecutedThings': minNumberOfExecutedThings,
      if (thresholdPercentage != null)
        'ThresholdPercentage': thresholdPercentage,
    };
  }
}

class AbortCriteriaAction {
  static const cancel = AbortCriteriaAction._('CANCEL');

  final String value;

  const AbortCriteriaAction._(this.value);

  static const values = [cancel];

  static AbortCriteriaAction fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AbortCriteriaAction._(value));

  @override
  bool operator ==(other) =>
      other is AbortCriteriaAction && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class AbortCriteriaFailureType {
  static const failed = AbortCriteriaFailureType._('FAILED');
  static const rejected = AbortCriteriaFailureType._('REJECTED');
  static const timedOut = AbortCriteriaFailureType._('TIMED_OUT');
  static const all = AbortCriteriaFailureType._('ALL');

  final String value;

  const AbortCriteriaFailureType._(this.value);

  static const values = [failed, rejected, timedOut, all];

  static AbortCriteriaFailureType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AbortCriteriaFailureType._(value));

  @override
  bool operator ==(other) =>
      other is AbortCriteriaFailureType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class EventType {
  static const deviceCommand = EventType._('DEVICE_COMMAND');
  static const deviceCommandRequest = EventType._('DEVICE_COMMAND_REQUEST');
  static const deviceDiscoveryStatus = EventType._('DEVICE_DISCOVERY_STATUS');
  static const deviceEvent = EventType._('DEVICE_EVENT');
  static const deviceLifeCycle = EventType._('DEVICE_LIFE_CYCLE');
  static const deviceState = EventType._('DEVICE_STATE');
  static const deviceOta = EventType._('DEVICE_OTA');
  static const deviceWss = EventType._('DEVICE_WSS');
  static const connectorAssociation = EventType._('CONNECTOR_ASSOCIATION');
  static const accountAssociation = EventType._('ACCOUNT_ASSOCIATION');
  static const connectorErrorReport = EventType._('CONNECTOR_ERROR_REPORT');

  final String value;

  const EventType._(this.value);

  static const values = [
    deviceCommand,
    deviceCommandRequest,
    deviceDiscoveryStatus,
    deviceEvent,
    deviceLifeCycle,
    deviceState,
    deviceOta,
    deviceWss,
    connectorAssociation,
    accountAssociation,
    connectorErrorReport
  ];

  static EventType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => EventType._(value));

  @override
  bool operator ==(other) => other is EventType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Structure describing a notification configuration.
class NotificationConfigurationSummary {
  /// The name of the destination for the notification configuration.
  final String? destinationName;

  /// The type of event triggering a device notification to the customer-managed
  /// destination.
  final EventType? eventType;

  NotificationConfigurationSummary({
    this.destinationName,
    this.eventType,
  });

  factory NotificationConfigurationSummary.fromJson(Map<String, dynamic> json) {
    return NotificationConfigurationSummary(
      destinationName: json['DestinationName'] as String?,
      eventType: (json['EventType'] as String?)?.let(EventType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final destinationName = this.destinationName;
    final eventType = this.eventType;
    return {
      if (destinationName != null) 'DestinationName': destinationName,
      if (eventType != null) 'EventType': eventType.value,
    };
  }
}

/// Describe the endpoint with an Id, a name, and the relevant capabilities for
/// reporting state
class StateEndpoint {
  /// Describe the endpoint with an id, a name, and the relevant capabilities for
  /// the reporting state.
  final List<StateCapability> capabilities;

  /// Numeric identifier of the endpoint
  final String endpointId;

  StateEndpoint({
    required this.capabilities,
    required this.endpointId,
  });

  factory StateEndpoint.fromJson(Map<String, dynamic> json) {
    return StateEndpoint(
      capabilities: ((json['capabilities'] as List?) ?? const [])
          .nonNulls
          .map((e) => StateCapability.fromJson(e as Map<String, dynamic>))
          .toList(),
      endpointId: (json['endpointId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final capabilities = this.capabilities;
    final endpointId = this.endpointId;
    return {
      'capabilities': capabilities,
      'endpointId': endpointId,
    };
  }
}

/// State capabilities added for the managed thing.
class StateCapability {
  /// The id of the managed thing in the capability report.
  final String id;

  /// Name for the Amazon Web Services capability.
  final String name;

  /// Version for the Amazon Web Services capability.
  final String version;

  /// Describe the command capability with the properties it supports.
  final Object? properties;

  StateCapability({
    required this.id,
    required this.name,
    required this.version,
    this.properties,
  });

  factory StateCapability.fromJson(Map<String, dynamic> json) {
    return StateCapability(
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      version: (json['version'] as String?) ?? '',
      properties: json['properties'],
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final name = this.name;
    final version = this.version;
    final properties = this.properties;
    return {
      'id': id,
      'name': name,
      'version': version,
      if (properties != null) 'properties': properties,
    };
  }
}

/// Structure representing one schema item associated with a managed thing.
class ManagedThingSchemaListItem {
  /// The id of the capability for a managed thing.
  final String? capabilityId;

  /// The id of the endpoint for a managed thing.
  final String? endpointId;

  /// The validation schema for one schema item associated with a managed thing.
  final Object? schema;

  ManagedThingSchemaListItem({
    this.capabilityId,
    this.endpointId,
    this.schema,
  });

  factory ManagedThingSchemaListItem.fromJson(Map<String, dynamic> json) {
    return ManagedThingSchemaListItem(
      capabilityId: json['CapabilityId'] as String?,
      endpointId: json['EndpointId'] as String?,
      schema: json['Schema'],
    );
  }

  Map<String, dynamic> toJson() {
    final capabilityId = this.capabilityId;
    final endpointId = this.endpointId;
    final schema = this.schema;
    return {
      if (capabilityId != null) 'CapabilityId': capabilityId,
      if (endpointId != null) 'EndpointId': endpointId,
      if (schema != null) 'Schema': schema,
    };
  }
}

class DisconnectReasonValue {
  static const authError = DisconnectReasonValue._('AUTH_ERROR');
  static const clientInitiatedDisconnect =
      DisconnectReasonValue._('CLIENT_INITIATED_DISCONNECT');
  static const clientError = DisconnectReasonValue._('CLIENT_ERROR');
  static const connectionLost = DisconnectReasonValue._('CONNECTION_LOST');
  static const duplicateClientid =
      DisconnectReasonValue._('DUPLICATE_CLIENTID');
  static const forbiddenAccess = DisconnectReasonValue._('FORBIDDEN_ACCESS');
  static const mqttKeepAliveTimeout =
      DisconnectReasonValue._('MQTT_KEEP_ALIVE_TIMEOUT');
  static const serverError = DisconnectReasonValue._('SERVER_ERROR');
  static const serverInitiatedDisconnect =
      DisconnectReasonValue._('SERVER_INITIATED_DISCONNECT');
  static const throttled = DisconnectReasonValue._('THROTTLED');
  static const websocketTtlExpiration =
      DisconnectReasonValue._('WEBSOCKET_TTL_EXPIRATION');
  static const customauthTtlExpiration =
      DisconnectReasonValue._('CUSTOMAUTH_TTL_EXPIRATION');
  static const unknown = DisconnectReasonValue._('UNKNOWN');
  static const none = DisconnectReasonValue._('NONE');

  final String value;

  const DisconnectReasonValue._(this.value);

  static const values = [
    authError,
    clientInitiatedDisconnect,
    clientError,
    connectionLost,
    duplicateClientid,
    forbiddenAccess,
    mqttKeepAliveTimeout,
    serverError,
    serverInitiatedDisconnect,
    throttled,
    websocketTtlExpiration,
    customauthTtlExpiration,
    unknown,
    none
  ];

  static DisconnectReasonValue fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DisconnectReasonValue._(value));

  @override
  bool operator ==(other) =>
      other is DisconnectReasonValue && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Report of all capabilities supported by the device.
class CapabilityReport {
  /// The endpoints used in the capability report.
  final List<CapabilityReportEndpoint> endpoints;

  /// The version of the capability report.
  final String version;

  /// The numeric identifier of the node.
  final String? nodeId;

  CapabilityReport({
    required this.endpoints,
    required this.version,
    this.nodeId,
  });

  factory CapabilityReport.fromJson(Map<String, dynamic> json) {
    return CapabilityReport(
      endpoints: ((json['endpoints'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              CapabilityReportEndpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      version: (json['version'] as String?) ?? '',
      nodeId: json['nodeId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endpoints = this.endpoints;
    final version = this.version;
    final nodeId = this.nodeId;
    return {
      'endpoints': endpoints,
      'version': version,
      if (nodeId != null) 'nodeId': nodeId,
    };
  }
}

/// The endpoint used in the capability report.
class CapabilityReportEndpoint {
  /// The capabilities used in the capability report.
  final List<CapabilityReportCapability> capabilities;

  /// The type of device.
  final List<String> deviceTypes;

  /// The id of the endpoint used in the capability report.
  final String id;

  CapabilityReportEndpoint({
    required this.capabilities,
    required this.deviceTypes,
    required this.id,
  });

  factory CapabilityReportEndpoint.fromJson(Map<String, dynamic> json) {
    return CapabilityReportEndpoint(
      capabilities: ((json['capabilities'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              CapabilityReportCapability.fromJson(e as Map<String, dynamic>))
          .toList(),
      deviceTypes: ((json['deviceTypes'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      id: (json['id'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final capabilities = this.capabilities;
    final deviceTypes = this.deviceTypes;
    final id = this.id;
    return {
      'capabilities': capabilities,
      'deviceTypes': deviceTypes,
      'id': id,
    };
  }
}

/// The capability used in capability report.
class CapabilityReportCapability {
  /// The capability actions used in the capability report.
  final List<String> actions;

  /// The capability events used in the capability report.
  final List<String> events;

  /// The id of the schema version.
  final String id;

  /// The name of the capability.
  final String name;

  /// The capability properties used in the capability report.
  final List<String> properties;

  /// The version of the capability.
  final String version;

  CapabilityReportCapability({
    required this.actions,
    required this.events,
    required this.id,
    required this.name,
    required this.properties,
    required this.version,
  });

  factory CapabilityReportCapability.fromJson(Map<String, dynamic> json) {
    return CapabilityReportCapability(
      actions: ((json['actions'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      events: ((json['events'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      properties: ((json['properties'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      version: (json['version'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final actions = this.actions;
    final events = this.events;
    final id = this.id;
    final name = this.name;
    final properties = this.properties;
    final version = this.version;
    return {
      'actions': actions,
      'events': events,
      'id': id,
      'name': name,
      'properties': properties,
      'version': version,
    };
  }
}

/// Structure representing one managed thing.
class ManagedThingSummary {
  /// The timestampe value of when the managed thing was activated at.
  final DateTime? activatedAt;

  /// The id of the advertised product.
  final String? advertisedProductId;

  /// The Amazon Resource Name (ARN) of the managed thing.
  final String? arn;

  /// The brand of the device.
  final String? brand;

  /// The classification of the managed thing such as light bulb or thermostat.
  final String? classification;

  /// The identifier of the connector destination associated with this managed
  /// thing, if applicable.
  final String? connectorDestinationId;

  /// The third-party device id as defined by the connector. This device id must
  /// not contain personal identifiable information (PII).
  /// <note>
  /// This parameter is used for cloud-to-cloud devices only.
  /// </note>
  final String? connectorDeviceId;

  /// The id of the connector policy.
  /// <note>
  /// This parameter is used for cloud-to-cloud devices only.
  /// </note>
  final String? connectorPolicyId;

  /// The timestamp value of when the device creation request occurred.
  final DateTime? createdAt;

  /// The identifier of the credential locker for the managed thing.
  final String? credentialLockerId;

  /// The id of the device.
  final String? id;

  /// The model of the device.
  final String? model;

  /// The name of the managed thing representing the physical device.
  final String? name;

  /// Owner of the device, usually an indication of whom the device belongs to.
  /// This value should not contain personal identifiable information.
  final String? owner;

  /// Id of the controller device used for the discovery job.
  final String? parentControllerId;

  /// The provisioning status of the device in the provisioning workflow for
  /// onboarding to IoT managed integrations. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-mi/latest/devguide/device-provisioning.html">Device
  /// Provisioning</a>.
  final ProvisioningStatus? provisioningStatus;

  /// The type of device used. This will be the Amazon Web Services hub
  /// controller, cloud device, or IoT device.
  final Role? role;

  /// The serial number of the device.
  final String? serialNumber;

  /// The timestamp value of when the managed thing was last updated at.
  final DateTime? updatedAt;

  ManagedThingSummary({
    this.activatedAt,
    this.advertisedProductId,
    this.arn,
    this.brand,
    this.classification,
    this.connectorDestinationId,
    this.connectorDeviceId,
    this.connectorPolicyId,
    this.createdAt,
    this.credentialLockerId,
    this.id,
    this.model,
    this.name,
    this.owner,
    this.parentControllerId,
    this.provisioningStatus,
    this.role,
    this.serialNumber,
    this.updatedAt,
  });

  factory ManagedThingSummary.fromJson(Map<String, dynamic> json) {
    return ManagedThingSummary(
      activatedAt: timeStampFromJson(json['ActivatedAt']),
      advertisedProductId: json['AdvertisedProductId'] as String?,
      arn: json['Arn'] as String?,
      brand: json['Brand'] as String?,
      classification: json['Classification'] as String?,
      connectorDestinationId: json['ConnectorDestinationId'] as String?,
      connectorDeviceId: json['ConnectorDeviceId'] as String?,
      connectorPolicyId: json['ConnectorPolicyId'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      credentialLockerId: json['CredentialLockerId'] as String?,
      id: json['Id'] as String?,
      model: json['Model'] as String?,
      name: json['Name'] as String?,
      owner: json['Owner'] as String?,
      parentControllerId: json['ParentControllerId'] as String?,
      provisioningStatus: (json['ProvisioningStatus'] as String?)
          ?.let(ProvisioningStatus.fromString),
      role: (json['Role'] as String?)?.let(Role.fromString),
      serialNumber: json['SerialNumber'] as String?,
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final activatedAt = this.activatedAt;
    final advertisedProductId = this.advertisedProductId;
    final arn = this.arn;
    final brand = this.brand;
    final classification = this.classification;
    final connectorDestinationId = this.connectorDestinationId;
    final connectorDeviceId = this.connectorDeviceId;
    final connectorPolicyId = this.connectorPolicyId;
    final createdAt = this.createdAt;
    final credentialLockerId = this.credentialLockerId;
    final id = this.id;
    final model = this.model;
    final name = this.name;
    final owner = this.owner;
    final parentControllerId = this.parentControllerId;
    final provisioningStatus = this.provisioningStatus;
    final role = this.role;
    final serialNumber = this.serialNumber;
    final updatedAt = this.updatedAt;
    return {
      if (activatedAt != null) 'ActivatedAt': unixTimestampToJson(activatedAt),
      if (advertisedProductId != null)
        'AdvertisedProductId': advertisedProductId,
      if (arn != null) 'Arn': arn,
      if (brand != null) 'Brand': brand,
      if (classification != null) 'Classification': classification,
      if (connectorDestinationId != null)
        'ConnectorDestinationId': connectorDestinationId,
      if (connectorDeviceId != null) 'ConnectorDeviceId': connectorDeviceId,
      if (connectorPolicyId != null) 'ConnectorPolicyId': connectorPolicyId,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (credentialLockerId != null) 'CredentialLockerId': credentialLockerId,
      if (id != null) 'Id': id,
      if (model != null) 'Model': model,
      if (name != null) 'Name': name,
      if (owner != null) 'Owner': owner,
      if (parentControllerId != null) 'ParentControllerId': parentControllerId,
      if (provisioningStatus != null)
        'ProvisioningStatus': provisioningStatus.value,
      if (role != null) 'Role': role.value,
      if (serialNumber != null) 'SerialNumber': serialNumber,
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

class ProvisioningStatus {
  static const unassociated = ProvisioningStatus._('UNASSOCIATED');
  static const preAssociated = ProvisioningStatus._('PRE_ASSOCIATED');
  static const discovered = ProvisioningStatus._('DISCOVERED');
  static const activated = ProvisioningStatus._('ACTIVATED');
  static const deletionFailed = ProvisioningStatus._('DELETION_FAILED');
  static const deleteInProgress = ProvisioningStatus._('DELETE_IN_PROGRESS');
  static const isolated = ProvisioningStatus._('ISOLATED');
  static const deleted = ProvisioningStatus._('DELETED');

  final String value;

  const ProvisioningStatus._(this.value);

  static const values = [
    unassociated,
    preAssociated,
    discovered,
    activated,
    deletionFailed,
    deleteInProgress,
    isolated,
    deleted
  ];

  static ProvisioningStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ProvisioningStatus._(value));

  @override
  bool operator ==(other) =>
      other is ProvisioningStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class Role {
  static const controller = Role._('CONTROLLER');
  static const device = Role._('DEVICE');

  final String value;

  const Role._(this.value);

  static const values = [controller, device];

  static Role fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Role._(value));

  @override
  bool operator ==(other) => other is Role && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The Wi-Fi Simple Setup configuration for the managed thing, which defines
/// provisioning capabilities and timeout settings.
class WiFiSimpleSetupConfiguration {
  /// Indicates whether the device can act as a provisionee in Wi-Fi Simple Setup,
  /// allowing it to be configured by other devices.
  final bool? enableAsProvisionee;

  /// Indicates whether the device can act as a provisioner in Wi-Fi Simple Setup,
  /// allowing it to configure other devices.
  final bool? enableAsProvisioner;

  /// The timeout duration in minutes for Wi-Fi Simple Setup. Valid range is 5 to
  /// 15 minutes.
  final int? timeoutInMinutes;

  WiFiSimpleSetupConfiguration({
    this.enableAsProvisionee,
    this.enableAsProvisioner,
    this.timeoutInMinutes,
  });

  factory WiFiSimpleSetupConfiguration.fromJson(Map<String, dynamic> json) {
    return WiFiSimpleSetupConfiguration(
      enableAsProvisionee: json['EnableAsProvisionee'] as bool?,
      enableAsProvisioner: json['EnableAsProvisioner'] as bool?,
      timeoutInMinutes: json['TimeoutInMinutes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final enableAsProvisionee = this.enableAsProvisionee;
    final enableAsProvisioner = this.enableAsProvisioner;
    final timeoutInMinutes = this.timeoutInMinutes;
    return {
      if (enableAsProvisionee != null)
        'EnableAsProvisionee': enableAsProvisionee,
      if (enableAsProvisioner != null)
        'EnableAsProvisioner': enableAsProvisioner,
      if (timeoutInMinutes != null) 'TimeoutInMinutes': timeoutInMinutes,
    };
  }
}

class HubNetworkMode {
  static const standard = HubNetworkMode._('STANDARD');
  static const networkWideExclusion =
      HubNetworkMode._('NETWORK_WIDE_EXCLUSION');

  final String value;

  const HubNetworkMode._(this.value);

  static const values = [standard, networkWideExclusion];

  static HubNetworkMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => HubNetworkMode._(value));

  @override
  bool operator ==(other) => other is HubNetworkMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Structure representing a capability schema item that defines the
/// functionality and features supported by a managed thing.
class CapabilitySchemaItem {
  /// The unique identifier of the capability defined in the schema.
  final String capabilityId;

  /// The external identifier for the capability, used when referencing the
  /// capability outside of the AWS ecosystem.
  final String extrinsicId;

  /// The version of the external capability definition, used to track
  /// compatibility with external systems.
  final int extrinsicVersion;

  /// The format of the capability schema, which defines how the schema is
  /// structured and interpreted.
  final SchemaVersionFormat format;

  /// The actual schema definition that describes the capability's properties,
  /// actions, and events.
  final Object schema;

  CapabilitySchemaItem({
    required this.capabilityId,
    required this.extrinsicId,
    required this.extrinsicVersion,
    required this.format,
    required this.schema,
  });

  Map<String, dynamic> toJson() {
    final capabilityId = this.capabilityId;
    final extrinsicId = this.extrinsicId;
    final extrinsicVersion = this.extrinsicVersion;
    final format = this.format;
    final schema = this.schema;
    return {
      'CapabilityId': capabilityId,
      'ExtrinsicId': extrinsicId,
      'ExtrinsicVersion': extrinsicVersion,
      'Format': format.value,
      'Schema': schema,
    };
  }
}

class AuthMaterialType {
  static const customProtocolQrBarCode =
      AuthMaterialType._('CUSTOM_PROTOCOL_QR_BAR_CODE');
  static const wifiSetupQrBarCode =
      AuthMaterialType._('WIFI_SETUP_QR_BAR_CODE');
  static const zwaveQrBarCode = AuthMaterialType._('ZWAVE_QR_BAR_CODE');
  static const zigbeeQrBarCode = AuthMaterialType._('ZIGBEE_QR_BAR_CODE');
  static const discoveredDevice = AuthMaterialType._('DISCOVERED_DEVICE');
  static const preOnboardedCloud = AuthMaterialType._('PRE_ONBOARDED_CLOUD');

  final String value;

  const AuthMaterialType._(this.value);

  static const values = [
    customProtocolQrBarCode,
    wifiSetupQrBarCode,
    zwaveQrBarCode,
    zigbeeQrBarCode,
    discoveredDevice,
    preOnboardedCloud
  ];

  static AuthMaterialType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AuthMaterialType._(value));

  @override
  bool operator ==(other) => other is AuthMaterialType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The endpoint for a managed thing when sending a command.
class CommandEndpoint {
  /// Describe the endpoint with an id, a name, and the relevant capabilities for
  /// sending commands.
  final List<CommandCapability> capabilities;

  /// The id of the endpoint for a managed thing.
  final String endpointId;

  CommandEndpoint({
    required this.capabilities,
    required this.endpointId,
  });

  Map<String, dynamic> toJson() {
    final capabilities = this.capabilities;
    final endpointId = this.endpointId;
    return {
      'capabilities': capabilities,
      'endpointId': endpointId,
    };
  }
}

/// The command capabilities added for the managed thing
class CommandCapability {
  /// Describe the command capability with the actions it supports.
  final List<CapabilityAction> actions;

  /// Describe the capability with an id.
  final String id;

  /// Describe the capability with an name.
  final String name;

  /// Describe the capability with a version.
  final String version;

  CommandCapability({
    required this.actions,
    required this.id,
    required this.name,
    required this.version,
  });

  Map<String, dynamic> toJson() {
    final actions = this.actions;
    final id = this.id;
    final name = this.name;
    final version = this.version;
    return {
      'actions': actions,
      'id': id,
      'name': name,
      'version': version,
    };
  }
}

/// Action for an Amazon Web Services capability, containing the action
/// parameters for control.
class CapabilityAction {
  /// Describe a capability action with a name.
  final String name;

  /// Describe a capability action with an <code>actionTraceId</code> for a
  /// response command.
  final String? actionTraceId;

  /// Describe a capability action with a capability property.
  final Object? parameters;

  /// Describe a capability action with an reference.
  final String? ref;

  CapabilityAction({
    required this.name,
    this.actionTraceId,
    this.parameters,
    this.ref,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final actionTraceId = this.actionTraceId;
    final parameters = this.parameters;
    final ref = this.ref;
    return {
      'name': name,
      if (actionTraceId != null) 'actionTraceId': actionTraceId,
      if (parameters != null) 'parameters': parameters,
      if (ref != null) 'ref': ref,
    };
  }
}

/// Structure representing an association between a managed thing and an account
/// association, which connects a device to a third-party account.
class ManagedThingAssociation {
  /// The identifier of the account association in the association.
  final String? accountAssociationId;

  /// The status of the registration between the managed thing and the account
  /// association. Indicates whether the device is pre-associated or fully
  /// associated with the account association.
  final ManagedThingAssociationStatus? managedThingAssociationStatus;

  /// The identifier of the managed thing in the association.
  final String? managedThingId;

  ManagedThingAssociation({
    this.accountAssociationId,
    this.managedThingAssociationStatus,
    this.managedThingId,
  });

  factory ManagedThingAssociation.fromJson(Map<String, dynamic> json) {
    return ManagedThingAssociation(
      accountAssociationId: json['AccountAssociationId'] as String?,
      managedThingAssociationStatus:
          (json['ManagedThingAssociationStatus'] as String?)
              ?.let(ManagedThingAssociationStatus.fromString),
      managedThingId: json['ManagedThingId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountAssociationId = this.accountAssociationId;
    final managedThingAssociationStatus = this.managedThingAssociationStatus;
    final managedThingId = this.managedThingId;
    return {
      if (accountAssociationId != null)
        'AccountAssociationId': accountAssociationId,
      if (managedThingAssociationStatus != null)
        'ManagedThingAssociationStatus': managedThingAssociationStatus.value,
      if (managedThingId != null) 'ManagedThingId': managedThingId,
    };
  }
}

class ManagedThingAssociationStatus {
  static const preAssociated =
      ManagedThingAssociationStatus._('PRE_ASSOCIATED');
  static const associated = ManagedThingAssociationStatus._('ASSOCIATED');

  final String value;

  const ManagedThingAssociationStatus._(this.value);

  static const values = [preAssociated, associated];

  static ManagedThingAssociationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ManagedThingAssociationStatus._(value));

  @override
  bool operator ==(other) =>
      other is ManagedThingAssociationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Provides the status of the default encryption configuration for an Amazon
/// Web Services account.
class ConfigurationStatus {
  /// The status state describing the default encryption configuration update.
  final ConfigurationState state;

  /// The error details describing a failed default encryption configuration
  /// update.
  final ConfigurationError? error;

  ConfigurationStatus({
    required this.state,
    this.error,
  });

  factory ConfigurationStatus.fromJson(Map<String, dynamic> json) {
    return ConfigurationStatus(
      state: ConfigurationState.fromString((json['state'] as String?) ?? ''),
      error: json['error'] != null
          ? ConfigurationError.fromJson(json['error'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    final error = this.error;
    return {
      'state': state.value,
      if (error != null) 'error': error,
    };
  }
}

class EncryptionType {
  static const managedIntegrationsDefaultEncryption =
      EncryptionType._('MANAGED_INTEGRATIONS_DEFAULT_ENCRYPTION');
  static const customerKeyEncryption =
      EncryptionType._('CUSTOMER_KEY_ENCRYPTION');

  final String value;

  const EncryptionType._(this.value);

  static const values = [
    managedIntegrationsDefaultEncryption,
    customerKeyEncryption
  ];

  static EncryptionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EncryptionType._(value));

  @override
  bool operator ==(other) => other is EncryptionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Provides the default encryption configuration error update details.
class ConfigurationError {
  /// The error code returned when the default encryption configuration update
  /// fails.
  final String? code;

  /// The error message returned when the default encryption configuration update
  /// fails.
  final String? message;

  ConfigurationError({
    this.code,
    this.message,
  });

  factory ConfigurationError.fromJson(Map<String, dynamic> json) {
    return ConfigurationError(
      code: json['code'] as String?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      if (code != null) 'code': code,
      if (message != null) 'message': message,
    };
  }
}

class ConfigurationState {
  static const enabled = ConfigurationState._('ENABLED');
  static const updateInProgress = ConfigurationState._('UPDATE_IN_PROGRESS');
  static const updateFailed = ConfigurationState._('UPDATE_FAILED');

  final String value;

  const ConfigurationState._(this.value);

  static const values = [enabled, updateInProgress, updateFailed];

  static ConfigurationState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ConfigurationState._(value));

  @override
  bool operator ==(other) =>
      other is ConfigurationState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// List of event log configurations.
class EventLogConfigurationSummary {
  /// The logging level for the event log configuration.
  final LogLevel? eventLogLevel;

  /// The identifier of the event log configuration.
  final String? id;

  /// The identifier of the resource for the event log configuration.
  final String? resourceId;

  /// The type of resource for the event log configuration.
  final String? resourceType;

  EventLogConfigurationSummary({
    this.eventLogLevel,
    this.id,
    this.resourceId,
    this.resourceType,
  });

  factory EventLogConfigurationSummary.fromJson(Map<String, dynamic> json) {
    return EventLogConfigurationSummary(
      eventLogLevel:
          (json['EventLogLevel'] as String?)?.let(LogLevel.fromString),
      id: json['Id'] as String?,
      resourceId: json['ResourceId'] as String?,
      resourceType: json['ResourceType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventLogLevel = this.eventLogLevel;
    final id = this.id;
    final resourceId = this.resourceId;
    final resourceType = this.resourceType;
    return {
      if (eventLogLevel != null) 'EventLogLevel': eventLogLevel.value,
      if (id != null) 'Id': id,
      if (resourceId != null) 'ResourceId': resourceId,
      if (resourceType != null) 'ResourceType': resourceType,
    };
  }
}

/// Structure containing summary information about a device discovered during a
/// device discovery job.
class DiscoveredDeviceSummary {
  /// The authentication material required for connecting to the discovered
  /// device, such as credentials or tokens.
  final String? authenticationMaterial;

  /// The brand of the discovered device.
  final String? brand;

  /// The third-party device identifier as defined by the connector. This
  /// identifier must not contain personal identifiable information (PII).
  final String? connectorDeviceId;

  /// The name of the device as defined by the connector or third-party system.
  final String? connectorDeviceName;

  /// The list of device types or categories that the discovered device belongs
  /// to.
  final List<String>? deviceTypes;

  /// The timestamp indicating when the device was discovered.
  final DateTime? discoveredAt;

  /// The identifier of the managed thing created for this discovered device, if
  /// one exists.
  final String? managedThingId;

  /// The model of the discovered device.
  final String? model;

  /// The status of the discovered device, indicating whether it has been added,
  /// removed, or modified since the last discovery.
  final DiscoveryModification? modification;

  DiscoveredDeviceSummary({
    this.authenticationMaterial,
    this.brand,
    this.connectorDeviceId,
    this.connectorDeviceName,
    this.deviceTypes,
    this.discoveredAt,
    this.managedThingId,
    this.model,
    this.modification,
  });

  factory DiscoveredDeviceSummary.fromJson(Map<String, dynamic> json) {
    return DiscoveredDeviceSummary(
      authenticationMaterial: json['AuthenticationMaterial'] as String?,
      brand: json['Brand'] as String?,
      connectorDeviceId: json['ConnectorDeviceId'] as String?,
      connectorDeviceName: json['ConnectorDeviceName'] as String?,
      deviceTypes: (json['DeviceTypes'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      discoveredAt: timeStampFromJson(json['DiscoveredAt']),
      managedThingId: json['ManagedThingId'] as String?,
      model: json['Model'] as String?,
      modification: (json['Modification'] as String?)
          ?.let(DiscoveryModification.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final authenticationMaterial = this.authenticationMaterial;
    final brand = this.brand;
    final connectorDeviceId = this.connectorDeviceId;
    final connectorDeviceName = this.connectorDeviceName;
    final deviceTypes = this.deviceTypes;
    final discoveredAt = this.discoveredAt;
    final managedThingId = this.managedThingId;
    final model = this.model;
    final modification = this.modification;
    return {
      if (authenticationMaterial != null)
        'AuthenticationMaterial': authenticationMaterial,
      if (brand != null) 'Brand': brand,
      if (connectorDeviceId != null) 'ConnectorDeviceId': connectorDeviceId,
      if (connectorDeviceName != null)
        'ConnectorDeviceName': connectorDeviceName,
      if (deviceTypes != null) 'DeviceTypes': deviceTypes,
      if (discoveredAt != null)
        'DiscoveredAt': unixTimestampToJson(discoveredAt),
      if (managedThingId != null) 'ManagedThingId': managedThingId,
      if (model != null) 'Model': model,
      if (modification != null) 'Modification': modification.value,
    };
  }
}

class DiscoveryModification {
  static const discovered = DiscoveryModification._('DISCOVERED');
  static const updated = DiscoveryModification._('UPDATED');
  static const noChange = DiscoveryModification._('NO_CHANGE');

  final String value;

  const DiscoveryModification._(this.value);

  static const values = [discovered, updated, noChange];

  static DiscoveryModification fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DiscoveryModification._(value));

  @override
  bool operator ==(other) =>
      other is DiscoveryModification && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Structure containing summary information about a device discovery job,
/// including its identifier, type, and status.
class DeviceDiscoverySummary {
  /// The type of discovery process used to find devices.
  final DiscoveryType? discoveryType;

  /// The unique identifier of the device discovery job.
  final String? id;

  /// The current status of the device discovery job.
  final DeviceDiscoveryStatus? status;

  DeviceDiscoverySummary({
    this.discoveryType,
    this.id,
    this.status,
  });

  factory DeviceDiscoverySummary.fromJson(Map<String, dynamic> json) {
    return DeviceDiscoverySummary(
      discoveryType:
          (json['DiscoveryType'] as String?)?.let(DiscoveryType.fromString),
      id: json['Id'] as String?,
      status:
          (json['Status'] as String?)?.let(DeviceDiscoveryStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final discoveryType = this.discoveryType;
    final id = this.id;
    final status = this.status;
    return {
      if (discoveryType != null) 'DiscoveryType': discoveryType.value,
      if (id != null) 'Id': id,
      if (status != null) 'Status': status.value,
    };
  }
}

class DiscoveryType {
  static const zwave = DiscoveryType._('ZWAVE');
  static const zigbee = DiscoveryType._('ZIGBEE');
  static const cloud = DiscoveryType._('CLOUD');
  static const custom = DiscoveryType._('CUSTOM');
  static const controllerCapabilityRediscovery =
      DiscoveryType._('CONTROLLER_CAPABILITY_REDISCOVERY');

  final String value;

  const DiscoveryType._(this.value);

  static const values = [
    zwave,
    zigbee,
    cloud,
    custom,
    controllerCapabilityRediscovery
  ];

  static DiscoveryType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DiscoveryType._(value));

  @override
  bool operator ==(other) => other is DiscoveryType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class DeviceDiscoveryStatus {
  static const running = DeviceDiscoveryStatus._('RUNNING');
  static const succeeded = DeviceDiscoveryStatus._('SUCCEEDED');
  static const failed = DeviceDiscoveryStatus._('FAILED');
  static const timedOut = DeviceDiscoveryStatus._('TIMED_OUT');

  final String value;

  const DeviceDiscoveryStatus._(this.value);

  static const values = [running, succeeded, failed, timedOut];

  static DeviceDiscoveryStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DeviceDiscoveryStatus._(value));

  @override
  bool operator ==(other) =>
      other is DeviceDiscoveryStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class DiscoveryAuthMaterialType {
  static const zwaveInstallCode =
      DiscoveryAuthMaterialType._('ZWAVE_INSTALL_CODE');

  final String value;

  const DiscoveryAuthMaterialType._(this.value);

  static const values = [zwaveInstallCode];

  static DiscoveryAuthMaterialType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DiscoveryAuthMaterialType._(value));

  @override
  bool operator ==(other) =>
      other is DiscoveryAuthMaterialType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ProtocolType {
  static const zwave = ProtocolType._('ZWAVE');
  static const zigbee = ProtocolType._('ZIGBEE');
  static const custom = ProtocolType._('CUSTOM');

  final String value;

  const ProtocolType._(this.value);

  static const values = [zwave, zigbee, custom];

  static ProtocolType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ProtocolType._(value));

  @override
  bool operator ==(other) => other is ProtocolType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class DeliveryDestinationType {
  static const kinesis = DeliveryDestinationType._('KINESIS');

  final String value;

  const DeliveryDestinationType._(this.value);

  static const values = [kinesis];

  static DeliveryDestinationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DeliveryDestinationType._(value));

  @override
  bool operator ==(other) =>
      other is DeliveryDestinationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Structure describing a destination for IoT managed integrations to deliver
/// notifications for a device.
class DestinationSummary {
  /// The Amazon Resource Name (ARN) of the customer-managed destination.
  final String? deliveryDestinationArn;

  /// The destination type for the customer-managed destination.
  final DeliveryDestinationType? deliveryDestinationType;

  /// The description of the customer-managed destination.
  final String? description;

  /// The name of the customer-managed destination.
  final String? name;

  /// The Amazon Resource Name (ARN) of the delivery destination.
  final String? roleArn;

  DestinationSummary({
    this.deliveryDestinationArn,
    this.deliveryDestinationType,
    this.description,
    this.name,
    this.roleArn,
  });

  factory DestinationSummary.fromJson(Map<String, dynamic> json) {
    return DestinationSummary(
      deliveryDestinationArn: json['DeliveryDestinationArn'] as String?,
      deliveryDestinationType: (json['DeliveryDestinationType'] as String?)
          ?.let(DeliveryDestinationType.fromString),
      description: json['Description'] as String?,
      name: json['Name'] as String?,
      roleArn: json['RoleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deliveryDestinationArn = this.deliveryDestinationArn;
    final deliveryDestinationType = this.deliveryDestinationType;
    final description = this.description;
    final name = this.name;
    final roleArn = this.roleArn;
    return {
      if (deliveryDestinationArn != null)
        'DeliveryDestinationArn': deliveryDestinationArn,
      if (deliveryDestinationType != null)
        'DeliveryDestinationType': deliveryDestinationType.value,
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
      if (roleArn != null) 'RoleArn': roleArn,
    };
  }
}

/// Structure describing one Credential Locker.
class CredentialLockerSummary {
  /// The Amazon Resource Name (ARN) of the credential locker.
  final String? arn;

  /// The timestampe value of when the credential locker was created at.
  final DateTime? createdAt;

  /// The id of the credential locker.
  final String? id;

  /// The name of the credential locker.
  final String? name;

  CredentialLockerSummary({
    this.arn,
    this.createdAt,
    this.id,
    this.name,
  });

  factory CredentialLockerSummary.fromJson(Map<String, dynamic> json) {
    return CredentialLockerSummary(
      arn: json['Arn'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      id: json['Id'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final id = this.id;
    final name = this.name;
    return {
      if (arn != null) 'Arn': arn,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
    };
  }
}

/// Structure containing summary information about a connector destination,
/// which defines how a cloud-to-cloud connector connects to a customer's AWS
/// account.
class ConnectorDestinationSummary {
  /// The identifier of the cloud connector associated with this connector
  /// destination.
  final String? cloudConnectorId;

  /// A description of the connector destination.
  final String? description;

  /// The unique identifier of the connector destination.
  final String? id;

  /// The display name of the connector destination.
  final String? name;

  ConnectorDestinationSummary({
    this.cloudConnectorId,
    this.description,
    this.id,
    this.name,
  });

  factory ConnectorDestinationSummary.fromJson(Map<String, dynamic> json) {
    return ConnectorDestinationSummary(
      cloudConnectorId: json['CloudConnectorId'] as String?,
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudConnectorId = this.cloudConnectorId;
    final description = this.description;
    final id = this.id;
    final name = this.name;
    return {
      if (cloudConnectorId != null) 'CloudConnectorId': cloudConnectorId,
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
    };
  }
}

class AuthType {
  static const oauth = AuthType._('OAUTH');

  final String value;

  const AuthType._(this.value);

  static const values = [oauth];

  static AuthType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => AuthType._(value));

  @override
  bool operator ==(other) => other is AuthType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The updated authentication configuration details for a connector
/// destination.
class AuthConfigUpdate {
  /// The General Authorization update information containing authorization
  /// materials to add or update.
  final GeneralAuthorizationUpdate? generalAuthorizationUpdate;

  /// The updated OAuth configuration settings for the authentication
  /// configuration.
  final OAuthUpdate? oAuthUpdate;

  AuthConfigUpdate({
    this.generalAuthorizationUpdate,
    this.oAuthUpdate,
  });

  Map<String, dynamic> toJson() {
    final generalAuthorizationUpdate = this.generalAuthorizationUpdate;
    final oAuthUpdate = this.oAuthUpdate;
    return {
      if (generalAuthorizationUpdate != null)
        'GeneralAuthorizationUpdate': generalAuthorizationUpdate,
      if (oAuthUpdate != null) 'oAuthUpdate': oAuthUpdate,
    };
  }
}

/// Configuration for AWS Secrets Manager, used to securely store and manage
/// sensitive information for connector destinations.
class SecretsManager {
  /// The Amazon Resource Name (ARN) of the AWS Secrets Manager secret.
  final String arn;

  /// The version ID of the AWS Secrets Manager secret.
  final String versionId;

  SecretsManager({
    required this.arn,
    required this.versionId,
  });

  factory SecretsManager.fromJson(Map<String, dynamic> json) {
    return SecretsManager(
      arn: (json['arn'] as String?) ?? '',
      versionId: (json['versionId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final versionId = this.versionId;
    return {
      'arn': arn,
      'versionId': versionId,
    };
  }
}

/// Structure containing updated OAuth configuration settings.
class OAuthUpdate {
  /// The updated URL where users are redirected after completing the OAuth
  /// authorization process.
  final String? oAuthCompleteRedirectUrl;

  /// Updated configuration for proactively refreshing OAuth tokens before they
  /// expire.
  final ProactiveRefreshTokenRenewal? proactiveRefreshTokenRenewal;

  OAuthUpdate({
    this.oAuthCompleteRedirectUrl,
    this.proactiveRefreshTokenRenewal,
  });

  Map<String, dynamic> toJson() {
    final oAuthCompleteRedirectUrl = this.oAuthCompleteRedirectUrl;
    final proactiveRefreshTokenRenewal = this.proactiveRefreshTokenRenewal;
    return {
      if (oAuthCompleteRedirectUrl != null)
        'oAuthCompleteRedirectUrl': oAuthCompleteRedirectUrl,
      if (proactiveRefreshTokenRenewal != null)
        'proactiveRefreshTokenRenewal': proactiveRefreshTokenRenewal,
    };
  }
}

/// The General Authorization update information containing authorization
/// materials to add or update.
class GeneralAuthorizationUpdate {
  /// The authorization materials to add.
  final List<AuthMaterial>? authMaterialsToAdd;

  /// The authorization materials to update.
  final List<AuthMaterial>? authMaterialsToUpdate;

  GeneralAuthorizationUpdate({
    this.authMaterialsToAdd,
    this.authMaterialsToUpdate,
  });

  Map<String, dynamic> toJson() {
    final authMaterialsToAdd = this.authMaterialsToAdd;
    final authMaterialsToUpdate = this.authMaterialsToUpdate;
    return {
      if (authMaterialsToAdd != null) 'AuthMaterialsToAdd': authMaterialsToAdd,
      if (authMaterialsToUpdate != null)
        'AuthMaterialsToUpdate': authMaterialsToUpdate,
    };
  }
}

/// The authorization material containing the Secrets Manager arn and version.
class AuthMaterial {
  /// The name of the authorization material.
  final String authMaterialName;
  final SecretsManager secretsManager;

  AuthMaterial({
    required this.authMaterialName,
    required this.secretsManager,
  });

  factory AuthMaterial.fromJson(Map<String, dynamic> json) {
    return AuthMaterial(
      authMaterialName: (json['AuthMaterialName'] as String?) ?? '',
      secretsManager: SecretsManager.fromJson(
          (json['SecretsManager'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final authMaterialName = this.authMaterialName;
    final secretsManager = this.secretsManager;
    return {
      'AuthMaterialName': authMaterialName,
      'SecretsManager': secretsManager,
    };
  }
}

/// Configuration settings for proactively refreshing OAuth tokens before they
/// expire.
class ProactiveRefreshTokenRenewal {
  /// The days before token expiration when the system should attempt to renew the
  /// token, specified in days.
  final int? daysBeforeRenewal;

  /// Indicates whether proactive refresh token renewal is enabled.
  final bool? enabled;

  ProactiveRefreshTokenRenewal({
    this.daysBeforeRenewal,
    this.enabled,
  });

  factory ProactiveRefreshTokenRenewal.fromJson(Map<String, dynamic> json) {
    return ProactiveRefreshTokenRenewal(
      daysBeforeRenewal: json['DaysBeforeRenewal'] as int?,
      enabled: json['enabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final daysBeforeRenewal = this.daysBeforeRenewal;
    final enabled = this.enabled;
    return {
      if (daysBeforeRenewal != null) 'DaysBeforeRenewal': daysBeforeRenewal,
      if (enabled != null) 'enabled': enabled,
    };
  }
}

/// The authentication configuration details for a connector destination,
/// including OAuth settings and other authentication parameters.
class AuthConfig {
  /// The authorization materials for General Authorization.
  final List<AuthMaterial>? generalAuthorization;

  /// The OAuth configuration settings used for authentication with the
  /// third-party service.
  final OAuthConfig? oAuth;

  AuthConfig({
    this.generalAuthorization,
    this.oAuth,
  });

  factory AuthConfig.fromJson(Map<String, dynamic> json) {
    return AuthConfig(
      generalAuthorization: (json['GeneralAuthorization'] as List?)
          ?.nonNulls
          .map((e) => AuthMaterial.fromJson(e as Map<String, dynamic>))
          .toList(),
      oAuth: json['oAuth'] != null
          ? OAuthConfig.fromJson(json['oAuth'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final generalAuthorization = this.generalAuthorization;
    final oAuth = this.oAuth;
    return {
      if (generalAuthorization != null)
        'GeneralAuthorization': generalAuthorization,
      if (oAuth != null) 'oAuth': oAuth,
    };
  }
}

/// Configuration details for OAuth authentication with a third-party service.
class OAuthConfig {
  /// The authorization URL for the OAuth service, where users are directed to
  /// authenticate and authorize access.
  final String authUrl;

  /// The authentication scheme used when requesting tokens from the token
  /// endpoint.
  final TokenEndpointAuthenticationScheme tokenEndpointAuthenticationScheme;

  /// The token URL for the OAuth service, where authorization codes are exchanged
  /// for access tokens.
  final String tokenUrl;

  /// The URL where users are redirected after completing the OAuth authorization
  /// process.
  final String? oAuthCompleteRedirectUrl;

  /// Configuration for proactively refreshing OAuth tokens before they expire.
  final ProactiveRefreshTokenRenewal? proactiveRefreshTokenRenewal;

  /// The OAuth scopes requested during authorization, which define the
  /// permissions granted to the application.
  final String? scope;

  OAuthConfig({
    required this.authUrl,
    required this.tokenEndpointAuthenticationScheme,
    required this.tokenUrl,
    this.oAuthCompleteRedirectUrl,
    this.proactiveRefreshTokenRenewal,
    this.scope,
  });

  factory OAuthConfig.fromJson(Map<String, dynamic> json) {
    return OAuthConfig(
      authUrl: (json['authUrl'] as String?) ?? '',
      tokenEndpointAuthenticationScheme:
          TokenEndpointAuthenticationScheme.fromString(
              (json['tokenEndpointAuthenticationScheme'] as String?) ?? ''),
      tokenUrl: (json['tokenUrl'] as String?) ?? '',
      oAuthCompleteRedirectUrl: json['oAuthCompleteRedirectUrl'] as String?,
      proactiveRefreshTokenRenewal: json['proactiveRefreshTokenRenewal'] != null
          ? ProactiveRefreshTokenRenewal.fromJson(
              json['proactiveRefreshTokenRenewal'] as Map<String, dynamic>)
          : null,
      scope: json['scope'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final authUrl = this.authUrl;
    final tokenEndpointAuthenticationScheme =
        this.tokenEndpointAuthenticationScheme;
    final tokenUrl = this.tokenUrl;
    final oAuthCompleteRedirectUrl = this.oAuthCompleteRedirectUrl;
    final proactiveRefreshTokenRenewal = this.proactiveRefreshTokenRenewal;
    final scope = this.scope;
    return {
      'authUrl': authUrl,
      'tokenEndpointAuthenticationScheme':
          tokenEndpointAuthenticationScheme.value,
      'tokenUrl': tokenUrl,
      if (oAuthCompleteRedirectUrl != null)
        'oAuthCompleteRedirectUrl': oAuthCompleteRedirectUrl,
      if (proactiveRefreshTokenRenewal != null)
        'proactiveRefreshTokenRenewal': proactiveRefreshTokenRenewal,
      if (scope != null) 'scope': scope,
    };
  }
}

class TokenEndpointAuthenticationScheme {
  static const httpBasic = TokenEndpointAuthenticationScheme._('HTTP_BASIC');
  static const requestBodyCredentials =
      TokenEndpointAuthenticationScheme._('REQUEST_BODY_CREDENTIALS');

  final String value;

  const TokenEndpointAuthenticationScheme._(this.value);

  static const values = [httpBasic, requestBodyCredentials];

  static TokenEndpointAuthenticationScheme fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TokenEndpointAuthenticationScheme._(value));

  @override
  bool operator ==(other) =>
      other is TokenEndpointAuthenticationScheme && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Structure describing a connector.
class ConnectorItem {
  /// The configuration details for the cloud connector endpoint, including
  /// connection parameters and authentication requirements.
  final EndpointConfig endpointConfig;

  /// The display name of the C2C connector.
  final String name;

  /// A description of the C2C connector.
  final String? description;

  /// The type of endpoint used for the C2C connector.
  final EndpointType? endpointType;

  /// The identifier of the C2C connector.
  final String? id;

  /// The type of cloud connector created.
  final CloudConnectorType? type;

  ConnectorItem({
    required this.endpointConfig,
    required this.name,
    this.description,
    this.endpointType,
    this.id,
    this.type,
  });

  factory ConnectorItem.fromJson(Map<String, dynamic> json) {
    return ConnectorItem(
      endpointConfig: EndpointConfig.fromJson(
          (json['EndpointConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      name: (json['Name'] as String?) ?? '',
      description: json['Description'] as String?,
      endpointType:
          (json['EndpointType'] as String?)?.let(EndpointType.fromString),
      id: json['Id'] as String?,
      type: (json['Type'] as String?)?.let(CloudConnectorType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final endpointConfig = this.endpointConfig;
    final name = this.name;
    final description = this.description;
    final endpointType = this.endpointType;
    final id = this.id;
    final type = this.type;
    return {
      'EndpointConfig': endpointConfig,
      'Name': name,
      if (description != null) 'Description': description,
      if (endpointType != null) 'EndpointType': endpointType.value,
      if (id != null) 'Id': id,
      if (type != null) 'Type': type.value,
    };
  }
}

/// The configuration details for an endpoint, which defines how to connect to
/// and communicate with external services.
class EndpointConfig {
  /// The Lambda function configuration for the endpoint, used when the endpoint
  /// communicates through an AWS Lambda function.
  final LambdaConfig? lambda;

  EndpointConfig({
    this.lambda,
  });

  factory EndpointConfig.fromJson(Map<String, dynamic> json) {
    return EndpointConfig(
      lambda: json['lambda'] != null
          ? LambdaConfig.fromJson(json['lambda'] as Map<String, dynamic>)
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

class EndpointType {
  static const lambda = EndpointType._('LAMBDA');

  final String value;

  const EndpointType._(this.value);

  static const values = [lambda];

  static EndpointType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => EndpointType._(value));

  @override
  bool operator ==(other) => other is EndpointType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class CloudConnectorType {
  static const listed = CloudConnectorType._('LISTED');
  static const unlisted = CloudConnectorType._('UNLISTED');

  final String value;

  const CloudConnectorType._(this.value);

  static const values = [listed, unlisted];

  static CloudConnectorType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CloudConnectorType._(value));

  @override
  bool operator ==(other) =>
      other is CloudConnectorType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration details for an AWS Lambda function used as an endpoint for a
/// cloud connector.
class LambdaConfig {
  /// The Amazon Resource Name (ARN) of the Lambda function used as an endpoint.
  final String arn;

  LambdaConfig({
    required this.arn,
  });

  factory LambdaConfig.fromJson(Map<String, dynamic> json) {
    return LambdaConfig(
      arn: (json['arn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      'arn': arn,
    };
  }
}

/// Structure containing information about an account association, including its
/// identifier, state, and related metadata.
class AccountAssociationItem {
  /// The unique identifier of the account association.
  final String accountAssociationId;

  /// The current state of the account association, indicating its status in the
  /// association lifecycle.
  final AssociationState associationState;

  /// The Amazon Resource Name (ARN) of the account association.
  final String? arn;

  /// The identifier of the connector destination associated with this account
  /// association.
  final String? connectorDestinationId;

  /// A description of the account association.
  final String? description;

  /// The error message explaining any issues with the account association, if
  /// applicable.
  final String? errorMessage;

  /// The name of the account association.
  final String? name;

  AccountAssociationItem({
    required this.accountAssociationId,
    required this.associationState,
    this.arn,
    this.connectorDestinationId,
    this.description,
    this.errorMessage,
    this.name,
  });

  factory AccountAssociationItem.fromJson(Map<String, dynamic> json) {
    return AccountAssociationItem(
      accountAssociationId: (json['AccountAssociationId'] as String?) ?? '',
      associationState: AssociationState.fromString(
          (json['AssociationState'] as String?) ?? ''),
      arn: json['Arn'] as String?,
      connectorDestinationId: json['ConnectorDestinationId'] as String?,
      description: json['Description'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountAssociationId = this.accountAssociationId;
    final associationState = this.associationState;
    final arn = this.arn;
    final connectorDestinationId = this.connectorDestinationId;
    final description = this.description;
    final errorMessage = this.errorMessage;
    final name = this.name;
    return {
      'AccountAssociationId': accountAssociationId,
      'AssociationState': associationState.value,
      if (arn != null) 'Arn': arn,
      if (connectorDestinationId != null)
        'ConnectorDestinationId': connectorDestinationId,
      if (description != null) 'Description': description,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (name != null) 'Name': name,
    };
  }
}

class AssociationState {
  static const associationInProgress =
      AssociationState._('ASSOCIATION_IN_PROGRESS');
  static const associationFailed = AssociationState._('ASSOCIATION_FAILED');
  static const associationSucceeded =
      AssociationState._('ASSOCIATION_SUCCEEDED');
  static const associationDeleting = AssociationState._('ASSOCIATION_DELETING');
  static const refreshTokenExpired =
      AssociationState._('REFRESH_TOKEN_EXPIRED');

  final String value;

  const AssociationState._(this.value);

  static const values = [
    associationInProgress,
    associationFailed,
    associationSucceeded,
    associationDeleting,
    refreshTokenExpired
  ];

  static AssociationState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AssociationState._(value));

  @override
  bool operator ==(other) => other is AssociationState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The General Authorization reference by authorization material name.
class GeneralAuthorizationName {
  /// The name of the authorization material.
  final String? authMaterialName;

  GeneralAuthorizationName({
    this.authMaterialName,
  });

  factory GeneralAuthorizationName.fromJson(Map<String, dynamic> json) {
    return GeneralAuthorizationName(
      authMaterialName: json['AuthMaterialName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final authMaterialName = this.authMaterialName;
    return {
      if (authMaterialName != null) 'AuthMaterialName': authMaterialName,
    };
  }
}

class ConnectorEventOperation {
  static const deviceCommandResponse =
      ConnectorEventOperation._('DEVICE_COMMAND_RESPONSE');
  static const deviceDiscovery = ConnectorEventOperation._('DEVICE_DISCOVERY');
  static const deviceEvent = ConnectorEventOperation._('DEVICE_EVENT');
  static const deviceCommandRequest =
      ConnectorEventOperation._('DEVICE_COMMAND_REQUEST');

  final String value;

  const ConnectorEventOperation._(this.value);

  static const values = [
    deviceCommandResponse,
    deviceDiscovery,
    deviceEvent,
    deviceCommandRequest
  ];

  static ConnectorEventOperation fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ConnectorEventOperation._(value));

  @override
  bool operator ==(other) =>
      other is ConnectorEventOperation && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Structure describing a managed thing.
class MatterEndpoint {
  /// A list of Matter clusters for a managed thing.
  final List<MatterCluster>? clusters;

  /// The Matter endpoint id.
  final String? id;

  MatterEndpoint({
    this.clusters,
    this.id,
  });

  Map<String, dynamic> toJson() {
    final clusters = this.clusters;
    final id = this.id;
    return {
      if (clusters != null) 'clusters': clusters,
      if (id != null) 'id': id,
    };
  }
}

/// Describe a Matter cluster with an id, and the relevant attributes, commands,
/// and events.
class MatterCluster {
  /// The Matter attributes.
  final Object? attributes;

  /// Describe the Matter commands with the Matter command identifier mapped to
  /// the command fields.
  final Map<String, Object>? commands;

  /// Describe the Matter events with the Matter event identifier mapped to the
  /// event fields.
  final Map<String, Object>? events;

  /// The cluster id.
  final String? id;

  MatterCluster({
    this.attributes,
    this.commands,
    this.events,
    this.id,
  });

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final commands = this.commands;
    final events = this.events;
    final id = this.id;
    return {
      if (attributes != null) 'attributes': attributes,
      if (commands != null) 'commands': commands,
      if (events != null) 'events': events,
      if (id != null) 'id': id,
    };
  }
}

/// Describe the device using the relevant metadata and supported clusters for
/// device discovery.
class Device {
  /// The capability report for the device.
  final MatterCapabilityReport capabilityReport;

  /// The device id as defined by the connector.
  /// <note>
  /// This parameter is used for cloud-to-cloud devices only.
  /// </note>
  final String connectorDeviceId;

  /// Report of all capabilities supported by the device.
  final List<CapabilitySchemaItem>? capabilitySchemas;

  /// The name of the device as defined by the connector.
  final String? connectorDeviceName;

  /// The metadata attributes for a device.
  final Object? deviceMetadata;

  Device({
    required this.capabilityReport,
    required this.connectorDeviceId,
    this.capabilitySchemas,
    this.connectorDeviceName,
    this.deviceMetadata,
  });

  Map<String, dynamic> toJson() {
    final capabilityReport = this.capabilityReport;
    final connectorDeviceId = this.connectorDeviceId;
    final capabilitySchemas = this.capabilitySchemas;
    final connectorDeviceName = this.connectorDeviceName;
    final deviceMetadata = this.deviceMetadata;
    return {
      'CapabilityReport': capabilityReport,
      'ConnectorDeviceId': connectorDeviceId,
      if (capabilitySchemas != null) 'CapabilitySchemas': capabilitySchemas,
      if (connectorDeviceName != null)
        'ConnectorDeviceName': connectorDeviceName,
      if (deviceMetadata != null) 'DeviceMetadata': deviceMetadata,
    };
  }
}

/// Matter based capability report.
class MatterCapabilityReport {
  /// The endpoints used in the capability report.
  final List<MatterCapabilityReportEndpoint> endpoints;

  /// The version of the capability report.
  final String version;

  /// The numeric identifier of the node.
  final String? nodeId;

  MatterCapabilityReport({
    required this.endpoints,
    required this.version,
    this.nodeId,
  });

  Map<String, dynamic> toJson() {
    final endpoints = this.endpoints;
    final version = this.version;
    final nodeId = this.nodeId;
    return {
      'endpoints': endpoints,
      'version': version,
      if (nodeId != null) 'nodeId': nodeId,
    };
  }
}

/// Matter endpoint used in capability report.
class MatterCapabilityReportEndpoint {
  /// Matter clusters used in capability report.
  final List<MatterCapabilityReportCluster> clusters;

  /// The type of device.
  final List<String> deviceTypes;

  /// The id of the Amazon Web Services Matter capability report endpoint.
  final String id;

  /// Semantic information related to endpoint.
  final List<String>? clientClusters;

  /// Heirachy of child endpoints contained in the given endpoint.
  final List<String>? parts;

  /// Semantic information related to endpoint.
  final List<String>? semanticTags;

  MatterCapabilityReportEndpoint({
    required this.clusters,
    required this.deviceTypes,
    required this.id,
    this.clientClusters,
    this.parts,
    this.semanticTags,
  });

  Map<String, dynamic> toJson() {
    final clusters = this.clusters;
    final deviceTypes = this.deviceTypes;
    final id = this.id;
    final clientClusters = this.clientClusters;
    final parts = this.parts;
    final semanticTags = this.semanticTags;
    return {
      'clusters': clusters,
      'deviceTypes': deviceTypes,
      'id': id,
      if (clientClusters != null) 'clientClusters': clientClusters,
      if (parts != null) 'parts': parts,
      if (semanticTags != null) 'semanticTags': semanticTags,
    };
  }
}

/// Capability used in Matter capability report.
class MatterCapabilityReportCluster {
  /// The id of the Amazon Web Services Matter capability report cluster.
  final String id;

  /// The id of the revision for the Amazon Web Services Matter capability report.
  final int revision;

  /// The attributes of the Amazon Web Services Matter capability report.
  final List<MatterCapabilityReportAttribute>? attributes;

  /// The commands used with the Amazon Web Services Matter capability report.
  final List<String>? commands;

  /// The events used with the Amazon Web Services Matter capability report.
  final List<String>? events;

  /// The fabric index for the Amazon Web Services Matter capability report.
  final int? fabricIndex;

  /// 32 bit-map used to indicate which features a cluster supports.
  final int? featureMap;

  /// Matter clusters used in capability report.
  final List<String>? generatedCommands;

  /// The capability name used in the Amazon Web Services Matter capability
  /// report.
  final String? name;

  /// The id of the schema version.
  final String? publicId;

  /// The spec version used in the Amazon Web Services Matter capability report.
  final String? specVersion;

  MatterCapabilityReportCluster({
    required this.id,
    required this.revision,
    this.attributes,
    this.commands,
    this.events,
    this.fabricIndex,
    this.featureMap,
    this.generatedCommands,
    this.name,
    this.publicId,
    this.specVersion,
  });

  Map<String, dynamic> toJson() {
    final id = this.id;
    final revision = this.revision;
    final attributes = this.attributes;
    final commands = this.commands;
    final events = this.events;
    final fabricIndex = this.fabricIndex;
    final featureMap = this.featureMap;
    final generatedCommands = this.generatedCommands;
    final name = this.name;
    final publicId = this.publicId;
    final specVersion = this.specVersion;
    return {
      'id': id,
      'revision': revision,
      if (attributes != null) 'attributes': attributes,
      if (commands != null) 'commands': commands,
      if (events != null) 'events': events,
      if (fabricIndex != null) 'fabricIndex': fabricIndex,
      if (featureMap != null) 'featureMap': featureMap,
      if (generatedCommands != null) 'generatedCommands': generatedCommands,
      if (name != null) 'name': name,
      if (publicId != null) 'publicId': publicId,
      if (specVersion != null) 'specVersion': specVersion,
    };
  }
}

/// Matter attribute used in capability report.
class MatterCapabilityReportAttribute {
  /// The id of the Matter attribute.
  final String? id;

  /// Name for the Amazon Web Services Matter capability report attribute.
  final String? name;

  /// Value for the Amazon Web Services Matter capability report attribute.
  final Object? value;

  MatterCapabilityReportAttribute({
    this.id,
    this.name,
    this.value,
  });

  Map<String, dynamic> toJson() {
    final id = this.id;
    final name = this.name;
    final value = this.value;
    return {
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (value != null) 'value': value,
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

class InternalFailureException extends _s.GenericAwsException {
  InternalFailureException({String? type, String? message})
      : super(type: type, code: 'InternalFailureException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
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

class UnauthorizedException extends _s.GenericAwsException {
  UnauthorizedException({String? type, String? message})
      : super(type: type, code: 'UnauthorizedException', message: message);
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
  'InternalFailureException': (type, message) =>
      InternalFailureException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'UnauthorizedException': (type, message) =>
      UnauthorizedException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
