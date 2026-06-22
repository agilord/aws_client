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

import 'v2015_10_07.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// Amazon EventBridge helps you to respond to state changes in your Amazon Web
/// Services resources. When your resources change state, they automatically
/// send events to an event stream. You can create rules that match selected
/// events in the stream and route them to targets to take action. You can also
/// use rules to take action on a predetermined schedule. For example, you can
/// configure rules to:
///
/// <ul>
/// <li>
/// Automatically invoke an Lambda function to update DNS entries when an event
/// notifies you that Amazon EC2 instance enters the running state.
/// </li>
/// <li>
/// Direct specific API records from CloudTrail to an Amazon Kinesis data stream
/// for detailed analysis of potential security or availability risks.
/// </li>
/// <li>
/// Periodically invoke a built-in target to create a snapshot of an Amazon EBS
/// volume.
/// </li>
/// </ul>
/// For more information about the features of Amazon EventBridge, see the <a
/// href="https://docs.aws.amazon.com/eventbridge/latest/userguide">Amazon
/// EventBridge User Guide</a>.
class EventBridge {
  final _s.JsonProtocol _protocol;
  final _s.ServiceMetadata _service;
  final String? _region;
  final String? _endpointUrl;
  final bool _useFipsEndpoint;
  final bool _useDualStackEndpoint;
  factory EventBridge({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'events',
    );
    return EventBridge._(
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
      service: service,
      region: region,
      endpointUrl: endpointUrl,
      useFipsEndpoint: useFipsEndpoint,
      useDualStackEndpoint: useDualStackEndpoint,
    );
  }
  EventBridge._({
    required _s.JsonProtocol protocol,
    required _s.ServiceMetadata service,
    required String? region,
    required String? endpointUrl,
    required bool useFipsEndpoint,
    required bool useDualStackEndpoint,
  })  : _protocol = protocol,
        _service = service,
        _region = region,
        _endpointUrl = endpointUrl,
        _useFipsEndpoint = useFipsEndpoint,
        _useDualStackEndpoint = useDualStackEndpoint;
  _s.Endpoint _resolveEndpoint({
    String? endpointId,
  }) {
    return _s.Endpoint.fromResolved(
      _endpoints.resolveEndpoint(
        region: _region,
        endpoint: _endpointUrl,
        useFips: _useFipsEndpoint,
        useDualStack: _useDualStackEndpoint,
        endpointId: endpointId,
      ),
      service: _service,
      region: _region,
    );
  }

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Activates a partner event source that has been deactivated. Once
  /// activated, your matching event bus will start receiving events from the
  /// event source.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [InternalException].
  /// May throw [InvalidStateException].
  /// May throw [OperationDisabledException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [name] :
  /// The name of the partner event source to activate.
  Future<void> activateEventSource({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.ActivateEventSource'
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

  /// Cancels the specified replay.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [IllegalStatusException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [replayName] :
  /// The name of the replay to cancel.
  Future<CancelReplayResponse> cancelReplay({
    required String replayName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.CancelReplay'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ReplayName': replayName,
      },
    );

    return CancelReplayResponse.fromJson(jsonResponse.body);
  }

  /// Creates an API destination, which is an HTTP invocation endpoint
  /// configured as a target for events.
  ///
  /// API destinations do not support private destinations, such as interface
  /// VPC endpoints.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-api-destinations.html">API
  /// destinations</a> in the <i>EventBridge User Guide</i>.
  ///
  /// May throw [InternalException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [connectionArn] :
  /// The ARN of the connection to use for the API destination. The destination
  /// endpoint must support the authorization type specified for the connection.
  ///
  /// Parameter [httpMethod] :
  /// The method to use for the request to the HTTP invocation endpoint.
  ///
  /// Parameter [invocationEndpoint] :
  /// The URL to the HTTP invocation endpoint for the API destination.
  ///
  /// Parameter [name] :
  /// The name for the API destination to create.
  ///
  /// Parameter [description] :
  /// A description for the API destination to create.
  ///
  /// Parameter [invocationRateLimitPerSecond] :
  /// The maximum number of requests per second to send to the HTTP invocation
  /// endpoint.
  Future<CreateApiDestinationResponse> createApiDestination({
    required String connectionArn,
    required ApiDestinationHttpMethod httpMethod,
    required String invocationEndpoint,
    required String name,
    String? description,
    int? invocationRateLimitPerSecond,
  }) async {
    _s.validateNumRange(
      'invocationRateLimitPerSecond',
      invocationRateLimitPerSecond,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.CreateApiDestination'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConnectionArn': connectionArn,
        'HttpMethod': httpMethod.value,
        'InvocationEndpoint': invocationEndpoint,
        'Name': name,
        if (description != null) 'Description': description,
        if (invocationRateLimitPerSecond != null)
          'InvocationRateLimitPerSecond': invocationRateLimitPerSecond,
      },
    );

    return CreateApiDestinationResponse.fromJson(jsonResponse.body);
  }

  /// Creates an archive of events with the specified settings. When you create
  /// an archive, incoming events might not immediately start being sent to the
  /// archive. Allow a short period of time for changes to take effect. If you
  /// do not specify a pattern to filter events sent to the archive, all events
  /// are sent to the archive except replayed events. Replayed events are not
  /// sent to an archive.
  /// <important>
  /// If you have specified that EventBridge use a customer managed key for
  /// encrypting the source event bus, we strongly recommend you also specify a
  /// customer managed key for any archives for the event bus as well.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/encryption-archives.html">Encrypting
  /// archives</a> in the <i>Amazon EventBridge User Guide</i>.
  /// </important>
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [InternalException].
  /// May throw [InvalidEventPatternException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [archiveName] :
  /// The name for the archive to create.
  ///
  /// Parameter [eventSourceArn] :
  /// The ARN of the event bus that sends events to the archive.
  ///
  /// Parameter [description] :
  /// A description for the archive.
  ///
  /// Parameter [eventPattern] :
  /// An event pattern to use to filter events sent to the archive.
  ///
  /// Parameter [kmsKeyIdentifier] :
  /// The identifier of the KMS customer managed key for EventBridge to use, if
  /// you choose to use a customer managed key to encrypt this archive. The
  /// identifier can be the key Amazon Resource Name (ARN), KeyId, key alias, or
  /// key alias ARN.
  ///
  /// If you do not specify a customer managed key identifier, EventBridge uses
  /// an Amazon Web Services owned key to encrypt the archive.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/viewing-keys.html">Identify
  /// and view keys</a> in the <i>Key Management Service Developer Guide</i>.
  /// <important>
  /// If you have specified that EventBridge use a customer managed key for
  /// encrypting the source event bus, we strongly recommend you also specify a
  /// customer managed key for any archives for the event bus as well.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/encryption-archives.html">Encrypting
  /// archives</a> in the <i>Amazon EventBridge User Guide</i>.
  /// </important>
  ///
  /// Parameter [retentionDays] :
  /// The number of days to retain events for. Default value is 0. If set to 0,
  /// events are retained indefinitely
  Future<CreateArchiveResponse> createArchive({
    required String archiveName,
    required String eventSourceArn,
    String? description,
    String? eventPattern,
    String? kmsKeyIdentifier,
    int? retentionDays,
  }) async {
    _s.validateNumRange(
      'retentionDays',
      retentionDays,
      0,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.CreateArchive'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ArchiveName': archiveName,
        'EventSourceArn': eventSourceArn,
        if (description != null) 'Description': description,
        if (eventPattern != null) 'EventPattern': eventPattern,
        if (kmsKeyIdentifier != null) 'KmsKeyIdentifier': kmsKeyIdentifier,
        if (retentionDays != null) 'RetentionDays': retentionDays,
      },
    );

    return CreateArchiveResponse.fromJson(jsonResponse.body);
  }

  /// Creates a connection. A connection defines the authorization type and
  /// credentials to use for authorization with an API destination HTTP
  /// endpoint.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-target-connection.html">Connections
  /// for endpoint targets</a> in the <i>Amazon EventBridge User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [authParameters] :
  /// The authorization parameters to use to authorize with the endpoint.
  ///
  /// You must include only authorization parameters for the
  /// <code>AuthorizationType</code> you specify.
  ///
  /// Parameter [authorizationType] :
  /// The type of authorization to use for the connection.
  /// <note>
  /// OAUTH tokens are refreshed when a 401 or 407 response is returned.
  /// </note>
  ///
  /// Parameter [name] :
  /// The name for the connection to create.
  ///
  /// Parameter [description] :
  /// A description for the connection to create.
  ///
  /// Parameter [invocationConnectivityParameters] :
  /// For connections to private APIs, the parameters to use for invoking the
  /// API.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/connection-private.html">Connecting
  /// to private APIs</a> in the <i> <i>Amazon EventBridge User Guide</i> </i>.
  ///
  /// Parameter [kmsKeyIdentifier] :
  /// The identifier of the KMS customer managed key for EventBridge to use, if
  /// you choose to use a customer managed key to encrypt this connection. The
  /// identifier can be the key Amazon Resource Name (ARN), KeyId, key alias, or
  /// key alias ARN.
  ///
  /// If you do not specify a customer managed key identifier, EventBridge uses
  /// an Amazon Web Services owned key to encrypt the connection.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/viewing-keys.html">Identify
  /// and view keys</a> in the <i>Key Management Service Developer Guide</i>.
  Future<CreateConnectionResponse> createConnection({
    required CreateConnectionAuthRequestParameters authParameters,
    required ConnectionAuthorizationType authorizationType,
    required String name,
    String? description,
    ConnectivityResourceParameters? invocationConnectivityParameters,
    String? kmsKeyIdentifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.CreateConnection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AuthParameters': authParameters,
        'AuthorizationType': authorizationType.value,
        'Name': name,
        if (description != null) 'Description': description,
        if (invocationConnectivityParameters != null)
          'InvocationConnectivityParameters': invocationConnectivityParameters,
        if (kmsKeyIdentifier != null) 'KmsKeyIdentifier': kmsKeyIdentifier,
      },
    );

    return CreateConnectionResponse.fromJson(jsonResponse.body);
  }

  /// Creates a global endpoint. Global endpoints improve your application's
  /// availability by making it regional-fault tolerant. To do this, you define
  /// a primary and secondary Region with event buses in each Region. You also
  /// create a Amazon Route 53 health check that will tell EventBridge to route
  /// events to the secondary Region when an "unhealthy" state is encountered
  /// and events will be routed back to the primary Region when the health check
  /// reports a "healthy" state.
  ///
  /// May throw [InternalException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceAlreadyExistsException].
  ///
  /// Parameter [eventBuses] :
  /// Define the event buses used.
  /// <important>
  /// The names of the event buses must be identical in each Region.
  /// </important>
  ///
  /// Parameter [name] :
  /// The name of the global endpoint. For example,
  /// <code>"Name":"us-east-2-custom_bus_A-endpoint"</code>.
  ///
  /// Parameter [routingConfig] :
  /// Configure the routing policy, including the health check and secondary
  /// Region..
  ///
  /// Parameter [description] :
  /// A description of the global endpoint.
  ///
  /// Parameter [replicationConfig] :
  /// Enable or disable event replication. The default state is
  /// <code>ENABLED</code> which means you must supply a <code>RoleArn</code>.
  /// If you don't have a <code>RoleArn</code> or you don't want event
  /// replication enabled, set the state to <code>DISABLED</code>.
  ///
  /// Parameter [roleArn] :
  /// The ARN of the role used for replication.
  Future<CreateEndpointResponse> createEndpoint({
    required List<EndpointEventBus> eventBuses,
    required String name,
    required RoutingConfig routingConfig,
    String? description,
    ReplicationConfig? replicationConfig,
    String? roleArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.CreateEndpoint'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EventBuses': eventBuses,
        'Name': name,
        'RoutingConfig': routingConfig,
        if (description != null) 'Description': description,
        if (replicationConfig != null) 'ReplicationConfig': replicationConfig,
        if (roleArn != null) 'RoleArn': roleArn,
      },
    );

    return CreateEndpointResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new event bus within your account. This can be a custom event
  /// bus which you can use to receive events from your custom applications and
  /// services, or it can be a partner event bus which can be matched to a
  /// partner event source.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [InternalException].
  /// May throw [InvalidStateException].
  /// May throw [LimitExceededException].
  /// May throw [OperationDisabledException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [name] :
  /// The name of the new event bus.
  ///
  /// Custom event bus names can't contain the <code>/</code> character, but you
  /// can use the <code>/</code> character in partner event bus names. In
  /// addition, for partner event buses, the name must exactly match the name of
  /// the partner event source that this event bus is matched to.
  ///
  /// You can't use the name <code>default</code> for a custom event bus, as
  /// this name is already used for your account's default event bus.
  ///
  /// Parameter [description] :
  /// The event bus description.
  ///
  /// Parameter [eventSourceName] :
  /// If you are creating a partner event bus, this specifies the partner event
  /// source that the new event bus will be matched with.
  ///
  /// Parameter [kmsKeyIdentifier] :
  /// The identifier of the KMS customer managed key for EventBridge to use, if
  /// you choose to use a customer managed key to encrypt events on this event
  /// bus. The identifier can be the key Amazon Resource Name (ARN), KeyId, key
  /// alias, or key alias ARN.
  ///
  /// If you do not specify a customer managed key identifier, EventBridge uses
  /// an Amazon Web Services owned key to encrypt events on the event bus.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/viewing-keys.html">Identify
  /// and view keys</a> in the <i>Key Management Service Developer Guide</i>.
  /// <note>
  /// Schema discovery is not supported for event buses encrypted using a
  /// customer managed key. EventBridge returns an error if:
  ///
  /// <ul>
  /// <li>
  /// You call <code> <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/schema-reference/v1-discoverers.html#CreateDiscoverer">CreateDiscoverer</a>
  /// </code> on an event bus set to use a customer managed key for encryption.
  /// </li>
  /// <li>
  /// You call <code> <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_UpdatedEventBus.html">UpdatedEventBus</a>
  /// </code> to set a customer managed key on an event bus with schema
  /// discovery enabled.
  /// </li>
  /// </ul>
  /// To enable schema discovery on an event bus, choose to use an Amazon Web
  /// Services owned key. For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-encryption-event-bus-cmkey.html">Encrypting
  /// events</a> in the <i>Amazon EventBridge User Guide</i>.
  /// </note> <important>
  /// If you have specified that EventBridge use a customer managed key for
  /// encrypting the source event bus, we strongly recommend you also specify a
  /// customer managed key for any archives for the event bus as well.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/encryption-archives.html">Encrypting
  /// archives</a> in the <i>Amazon EventBridge User Guide</i>.
  /// </important>
  ///
  /// Parameter [logConfig] :
  /// The logging configuration settings for the event bus.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eb-event-bus-logs.html">Configuring logs
  /// for event buses</a> in the <i>EventBridge User Guide</i>.
  ///
  /// Parameter [tags] :
  /// Tags to associate with the event bus.
  Future<CreateEventBusResponse> createEventBus({
    required String name,
    DeadLetterConfig? deadLetterConfig,
    String? description,
    String? eventSourceName,
    String? kmsKeyIdentifier,
    LogConfig? logConfig,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.CreateEventBus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        if (deadLetterConfig != null) 'DeadLetterConfig': deadLetterConfig,
        if (description != null) 'Description': description,
        if (eventSourceName != null) 'EventSourceName': eventSourceName,
        if (kmsKeyIdentifier != null) 'KmsKeyIdentifier': kmsKeyIdentifier,
        if (logConfig != null) 'LogConfig': logConfig,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateEventBusResponse.fromJson(jsonResponse.body);
  }

  /// Called by an SaaS partner to create a partner event source. This operation
  /// is not used by Amazon Web Services customers.
  ///
  /// Each partner event source can be used by one Amazon Web Services account
  /// to create a matching partner event bus in that Amazon Web Services
  /// account. A SaaS partner must create one partner event source for each
  /// Amazon Web Services account that wants to receive those event types.
  ///
  /// A partner event source creates events based on resources within the SaaS
  /// partner's service or application.
  ///
  /// An Amazon Web Services account that creates a partner event bus that
  /// matches the partner event source can use that event bus to receive events
  /// from the partner, and then process them using Amazon Web Services Events
  /// rules and targets.
  ///
  /// Partner event source names follow this format:
  ///
  /// <code> <i>partner_name</i>/<i>event_namespace</i>/<i>event_name</i>
  /// </code>
  ///
  /// <ul>
  /// <li>
  /// <i>partner_name</i> is determined during partner registration, and
  /// identifies the partner to Amazon Web Services customers.
  /// </li>
  /// <li>
  /// <i>event_namespace</i> is determined by the partner, and is a way for the
  /// partner to categorize their events.
  /// </li>
  /// <li>
  /// <i>event_name</i> is determined by the partner, and should uniquely
  /// identify an event-generating resource within the partner system.
  ///
  /// The <i>event_name</i> must be unique across all Amazon Web Services
  /// customers. This is because the event source is a shared resource between
  /// the partner and customer accounts, and each partner event source unique in
  /// the partner account.
  /// </li>
  /// </ul>
  /// The combination of <i>event_namespace</i> and <i>event_name</i> should
  /// help Amazon Web Services customers decide whether to create an event bus
  /// to receive these events.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [InternalException].
  /// May throw [LimitExceededException].
  /// May throw [OperationDisabledException].
  /// May throw [ResourceAlreadyExistsException].
  ///
  /// Parameter [account] :
  /// The Amazon Web Services account ID that is permitted to create a matching
  /// partner event bus for this partner event source.
  ///
  /// Parameter [name] :
  /// The name of the partner event source. This name must be unique and must be
  /// in the format <code>
  /// <i>partner_name</i>/<i>event_namespace</i>/<i>event_name</i> </code>. The
  /// Amazon Web Services account that wants to use this partner event source
  /// must create a partner event bus with a name that matches the name of the
  /// partner event source.
  Future<CreatePartnerEventSourceResponse> createPartnerEventSource({
    required String account,
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.CreatePartnerEventSource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Account': account,
        'Name': name,
      },
    );

    return CreatePartnerEventSourceResponse.fromJson(jsonResponse.body);
  }

  /// You can use this operation to temporarily stop receiving events from the
  /// specified partner event source. The matching event bus is not deleted.
  ///
  /// When you deactivate a partner event source, the source goes into PENDING
  /// state. If it remains in PENDING state for more than two weeks, it is
  /// deleted.
  ///
  /// To activate a deactivated partner event source, use <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_ActivateEventSource.html">ActivateEventSource</a>.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [InternalException].
  /// May throw [InvalidStateException].
  /// May throw [OperationDisabledException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [name] :
  /// The name of the partner event source to deactivate.
  Future<void> deactivateEventSource({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.DeactivateEventSource'
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

  /// Removes all authorization parameters from the connection. This lets you
  /// remove the secret from the connection so you can reuse it without having
  /// to create a new connection.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [name] :
  /// The name of the connection to remove authorization from.
  Future<DeauthorizeConnectionResponse> deauthorizeConnection({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.DeauthorizeConnection'
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

    return DeauthorizeConnectionResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the specified API destination.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [name] :
  /// The name of the destination to delete.
  Future<void> deleteApiDestination({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.DeleteApiDestination'
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

  /// Deletes the specified archive.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [archiveName] :
  /// The name of the archive to delete.
  Future<void> deleteArchive({
    required String archiveName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.DeleteArchive'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ArchiveName': archiveName,
      },
    );
  }

  /// Deletes a connection.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [name] :
  /// The name of the connection to delete.
  Future<DeleteConnectionResponse> deleteConnection({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.DeleteConnection'
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

    return DeleteConnectionResponse.fromJson(jsonResponse.body);
  }

  /// Delete an existing global endpoint. For more information about global
  /// endpoints, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-global-endpoints.html">Making
  /// applications Regional-fault tolerant with global endpoints and event
  /// replication</a> in the <i> <i>Amazon EventBridge User Guide</i> </i>.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [name] :
  /// The name of the endpoint you want to delete. For example,
  /// <code>"Name":"us-east-2-custom_bus_A-endpoint"</code>..
  Future<void> deleteEndpoint({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.DeleteEndpoint'
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

  /// Deletes the specified custom event bus or partner event bus. All rules
  /// associated with this event bus need to be deleted. You can't delete your
  /// account's default event bus.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [InternalException].
  ///
  /// Parameter [name] :
  /// The name of the event bus to delete.
  Future<void> deleteEventBus({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.DeleteEventBus'
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

  /// This operation is used by SaaS partners to delete a partner event source.
  /// This operation is not used by Amazon Web Services customers.
  ///
  /// When you delete an event source, the status of the corresponding partner
  /// event bus in the Amazon Web Services customer account becomes DELETED.
  ///
  ///
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [InternalException].
  /// May throw [OperationDisabledException].
  ///
  /// Parameter [account] :
  /// The Amazon Web Services account ID of the Amazon Web Services customer
  /// that the event source was created for.
  ///
  /// Parameter [name] :
  /// The name of the event source to delete.
  Future<void> deletePartnerEventSource({
    required String account,
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.DeletePartnerEventSource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Account': account,
        'Name': name,
      },
    );
  }

  /// Deletes the specified rule.
  ///
  /// Before you can delete the rule, you must remove all targets, using <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_RemoveTargets.html">RemoveTargets</a>.
  ///
  /// When you delete a rule, incoming events might continue to match to the
  /// deleted rule. Allow a short period of time for changes to take effect.
  ///
  /// If you call delete rule multiple times for the same rule, all calls will
  /// succeed. When you call delete rule for a non-existent custom eventbus,
  /// <code>ResourceNotFoundException</code> is returned.
  ///
  /// Managed rules are rules created and managed by another Amazon Web Services
  /// service on your behalf. These rules are created by those other Amazon Web
  /// Services services to support functionality in those services. You can
  /// delete these rules using the <code>Force</code> option, but you should do
  /// so only if you are sure the other service is not still using that rule.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [InternalException].
  /// May throw [ManagedRuleException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [name] :
  /// The name of the rule.
  ///
  /// Parameter [eventBusName] :
  /// The name or ARN of the event bus associated with the rule. If you omit
  /// this, the default event bus is used.
  ///
  /// Parameter [force] :
  /// If this is a managed rule, created by an Amazon Web Services service on
  /// your behalf, you must specify <code>Force</code> as <code>True</code> to
  /// delete the rule. This parameter is ignored for rules that are not managed
  /// rules. You can check whether a rule is a managed rule by using
  /// <code>DescribeRule</code> or <code>ListRules</code> and checking the
  /// <code>ManagedBy</code> field of the response.
  Future<void> deleteRule({
    required String name,
    String? eventBusName,
    bool? force,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.DeleteRule'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        if (eventBusName != null) 'EventBusName': eventBusName,
        if (force != null) 'Force': force,
      },
    );
  }

  /// Retrieves details about an API destination.
  ///
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [name] :
  /// The name of the API destination to retrieve.
  Future<DescribeApiDestinationResponse> describeApiDestination({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.DescribeApiDestination'
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

    return DescribeApiDestinationResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves details about an archive.
  ///
  /// May throw [InternalException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [archiveName] :
  /// The name of the archive to retrieve.
  Future<DescribeArchiveResponse> describeArchive({
    required String archiveName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.DescribeArchive'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ArchiveName': archiveName,
      },
    );

    return DescribeArchiveResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves details about a connection.
  ///
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [name] :
  /// The name of the connection to retrieve.
  Future<DescribeConnectionResponse> describeConnection({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.DescribeConnection'
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

    return DescribeConnectionResponse.fromJson(jsonResponse.body);
  }

  /// Get the information about an existing global endpoint. For more
  /// information about global endpoints, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-global-endpoints.html">Making
  /// applications Regional-fault tolerant with global endpoints and event
  /// replication</a> in the <i> <i>Amazon EventBridge User Guide</i> </i>.
  ///
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [name] :
  /// The name of the endpoint you want to get information about. For example,
  /// <code>"Name":"us-east-2-custom_bus_A-endpoint"</code>.
  ///
  /// Parameter [homeRegion] :
  /// The primary Region of the endpoint you want to get information about. For
  /// example <code>"HomeRegion": "us-east-1"</code>.
  Future<DescribeEndpointResponse> describeEndpoint({
    required String name,
    String? homeRegion,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.DescribeEndpoint'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        if (homeRegion != null) 'HomeRegion': homeRegion,
      },
    );

    return DescribeEndpointResponse.fromJson(jsonResponse.body);
  }

  /// Displays details about an event bus in your account. This can include the
  /// external Amazon Web Services accounts that are permitted to write events
  /// to your default event bus, and the associated policy. For custom event
  /// buses and partner event buses, it displays the name, ARN, policy, state,
  /// and creation time.
  ///
  /// To enable your account to receive events from other accounts on its
  /// default event bus, use <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_PutPermission.html">PutPermission</a>.
  ///
  /// For more information about partner event buses, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_CreateEventBus.html">CreateEventBus</a>.
  ///
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [name] :
  /// The name or ARN of the event bus to show details for. If you omit this,
  /// the default event bus is displayed.
  Future<DescribeEventBusResponse> describeEventBus({
    String? name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.DescribeEventBus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (name != null) 'Name': name,
      },
    );

    return DescribeEventBusResponse.fromJson(jsonResponse.body);
  }

  /// This operation lists details about a partner event source that is shared
  /// with your account.
  ///
  /// May throw [InternalException].
  /// May throw [OperationDisabledException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [name] :
  /// The name of the partner event source to display the details of.
  Future<DescribeEventSourceResponse> describeEventSource({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.DescribeEventSource'
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

    return DescribeEventSourceResponse.fromJson(jsonResponse.body);
  }

  /// An SaaS partner can use this operation to list details about a partner
  /// event source that they have created. Amazon Web Services customers do not
  /// use this operation. Instead, Amazon Web Services customers can use <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_DescribeEventSource.html">DescribeEventSource</a>
  /// to see details about a partner event source that is shared with them.
  ///
  /// May throw [InternalException].
  /// May throw [OperationDisabledException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [name] :
  /// The name of the event source to display.
  Future<DescribePartnerEventSourceResponse> describePartnerEventSource({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.DescribePartnerEventSource'
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

    return DescribePartnerEventSourceResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves details about a replay. Use <code>DescribeReplay</code> to
  /// determine the progress of a running replay. A replay processes events to
  /// replay based on the time in the event, and replays them using 1 minute
  /// intervals. If you use <code>StartReplay</code> and specify an
  /// <code>EventStartTime</code> and an <code>EventEndTime</code> that covers a
  /// 20 minute time range, the events are replayed from the first minute of
  /// that 20 minute range first. Then the events from the second minute are
  /// replayed. You can use <code>DescribeReplay</code> to determine the
  /// progress of a replay. The value returned for
  /// <code>EventLastReplayedTime</code> indicates the time within the specified
  /// time range associated with the last event replayed.
  ///
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [replayName] :
  /// The name of the replay to retrieve.
  Future<DescribeReplayResponse> describeReplay({
    required String replayName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.DescribeReplay'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ReplayName': replayName,
      },
    );

    return DescribeReplayResponse.fromJson(jsonResponse.body);
  }

  /// Describes the specified rule.
  ///
  /// DescribeRule does not list the targets of a rule. To see the targets
  /// associated with a rule, use <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_ListTargetsByRule.html">ListTargetsByRule</a>.
  ///
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [name] :
  /// The name of the rule.
  ///
  /// Parameter [eventBusName] :
  /// The name or ARN of the event bus associated with the rule. If you omit
  /// this, the default event bus is used.
  Future<DescribeRuleResponse> describeRule({
    required String name,
    String? eventBusName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.DescribeRule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        if (eventBusName != null) 'EventBusName': eventBusName,
      },
    );

    return DescribeRuleResponse.fromJson(jsonResponse.body);
  }

  /// Disables the specified rule. A disabled rule won't match any events, and
  /// won't self-trigger if it has a schedule expression.
  ///
  /// When you disable a rule, incoming events might continue to match to the
  /// disabled rule. Allow a short period of time for changes to take effect.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [InternalException].
  /// May throw [ManagedRuleException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [name] :
  /// The name of the rule.
  ///
  /// Parameter [eventBusName] :
  /// The name or ARN of the event bus associated with the rule. If you omit
  /// this, the default event bus is used.
  Future<void> disableRule({
    required String name,
    String? eventBusName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.DisableRule'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        if (eventBusName != null) 'EventBusName': eventBusName,
      },
    );
  }

  /// Enables the specified rule. If the rule does not exist, the operation
  /// fails.
  ///
  /// When you enable a rule, incoming events might not immediately start
  /// matching to a newly enabled rule. Allow a short period of time for changes
  /// to take effect.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [InternalException].
  /// May throw [ManagedRuleException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [name] :
  /// The name of the rule.
  ///
  /// Parameter [eventBusName] :
  /// The name or ARN of the event bus associated with the rule. If you omit
  /// this, the default event bus is used.
  Future<void> enableRule({
    required String name,
    String? eventBusName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.EnableRule'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        if (eventBusName != null) 'EventBusName': eventBusName,
      },
    );
  }

  /// Retrieves a list of API destination in the account in the current Region.
  ///
  /// May throw [InternalException].
  ///
  /// Parameter [connectionArn] :
  /// The ARN of the connection specified for the API destination.
  ///
  /// Parameter [limit] :
  /// The maximum number of API destinations to include in the response.
  ///
  /// Parameter [namePrefix] :
  /// A name prefix to filter results returned. Only API destinations with a
  /// name that starts with the prefix are returned.
  ///
  /// Parameter [nextToken] :
  /// The token returned by a previous call, which you can use to retrieve the
  /// next set of results.
  ///
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. To retrieve the next page of results, make the call again using the
  /// returned token. Keep all other arguments unchanged.
  ///
  /// Using an expired pagination token results in an <code>HTTP 400
  /// InvalidToken</code> error.
  Future<ListApiDestinationsResponse> listApiDestinations({
    String? connectionArn,
    int? limit,
    String? namePrefix,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.ListApiDestinations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (connectionArn != null) 'ConnectionArn': connectionArn,
        if (limit != null) 'Limit': limit,
        if (namePrefix != null) 'NamePrefix': namePrefix,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListApiDestinationsResponse.fromJson(jsonResponse.body);
  }

  /// Lists your archives. You can either list all the archives or you can
  /// provide a prefix to match to the archive names. Filter parameters are
  /// exclusive.
  ///
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [eventSourceArn] :
  /// The ARN of the event source associated with the archive.
  ///
  /// Parameter [limit] :
  /// The maximum number of results to return.
  ///
  /// Parameter [namePrefix] :
  /// A name prefix to filter the archives returned. Only archives with name
  /// that match the prefix are returned.
  ///
  /// Parameter [nextToken] :
  /// The token returned by a previous call, which you can use to retrieve the
  /// next set of results.
  ///
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. To retrieve the next page of results, make the call again using the
  /// returned token. Keep all other arguments unchanged.
  ///
  /// Using an expired pagination token results in an <code>HTTP 400
  /// InvalidToken</code> error.
  ///
  /// Parameter [state] :
  /// The state of the archive.
  Future<ListArchivesResponse> listArchives({
    String? eventSourceArn,
    int? limit,
    String? namePrefix,
    String? nextToken,
    ArchiveState? state,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.ListArchives'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (eventSourceArn != null) 'EventSourceArn': eventSourceArn,
        if (limit != null) 'Limit': limit,
        if (namePrefix != null) 'NamePrefix': namePrefix,
        if (nextToken != null) 'NextToken': nextToken,
        if (state != null) 'State': state.value,
      },
    );

    return ListArchivesResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves a list of connections from the account.
  ///
  /// May throw [InternalException].
  ///
  /// Parameter [connectionState] :
  /// The state of the connection.
  ///
  /// Parameter [limit] :
  /// The maximum number of connections to return.
  ///
  /// Parameter [namePrefix] :
  /// A name prefix to filter results returned. Only connections with a name
  /// that starts with the prefix are returned.
  ///
  /// Parameter [nextToken] :
  /// The token returned by a previous call, which you can use to retrieve the
  /// next set of results.
  ///
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. To retrieve the next page of results, make the call again using the
  /// returned token. Keep all other arguments unchanged.
  ///
  /// Using an expired pagination token results in an <code>HTTP 400
  /// InvalidToken</code> error.
  Future<ListConnectionsResponse> listConnections({
    ConnectionState? connectionState,
    int? limit,
    String? namePrefix,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.ListConnections'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (connectionState != null) 'ConnectionState': connectionState.value,
        if (limit != null) 'Limit': limit,
        if (namePrefix != null) 'NamePrefix': namePrefix,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListConnectionsResponse.fromJson(jsonResponse.body);
  }

  /// List the global endpoints associated with this account. For more
  /// information about global endpoints, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-global-endpoints.html">Making
  /// applications Regional-fault tolerant with global endpoints and event
  /// replication</a> in the <i> <i>Amazon EventBridge User Guide</i> </i>.
  ///
  /// May throw [InternalException].
  ///
  /// Parameter [homeRegion] :
  /// The primary Region of the endpoints associated with this account. For
  /// example <code>"HomeRegion": "us-east-1"</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results returned by the call.
  ///
  /// Parameter [namePrefix] :
  /// A value that will return a subset of the endpoints associated with this
  /// account. For example, <code>"NamePrefix": "ABC"</code> will return all
  /// endpoints with "ABC" in the name.
  ///
  /// Parameter [nextToken] :
  /// The token returned by a previous call, which you can use to retrieve the
  /// next set of results.
  ///
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. To retrieve the next page of results, make the call again using the
  /// returned token. Keep all other arguments unchanged.
  ///
  /// Using an expired pagination token results in an <code>HTTP 400
  /// InvalidToken</code> error.
  Future<ListEndpointsResponse> listEndpoints({
    String? homeRegion,
    int? maxResults,
    String? namePrefix,
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
      'X-Amz-Target': 'AWSEvents.ListEndpoints'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (homeRegion != null) 'HomeRegion': homeRegion,
        if (maxResults != null) 'MaxResults': maxResults,
        if (namePrefix != null) 'NamePrefix': namePrefix,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListEndpointsResponse.fromJson(jsonResponse.body);
  }

  /// Lists all the event buses in your account, including the default event
  /// bus, custom event buses, and partner event buses.
  ///
  /// May throw [InternalException].
  ///
  /// Parameter [limit] :
  /// Specifying this limits the number of results returned by this operation.
  /// The operation also returns a NextToken which you can use in a subsequent
  /// operation to retrieve the next set of results.
  ///
  /// Parameter [namePrefix] :
  /// Specifying this limits the results to only those event buses with names
  /// that start with the specified prefix.
  ///
  /// Parameter [nextToken] :
  /// The token returned by a previous call, which you can use to retrieve the
  /// next set of results.
  ///
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. To retrieve the next page of results, make the call again using the
  /// returned token. Keep all other arguments unchanged.
  ///
  /// Using an expired pagination token results in an <code>HTTP 400
  /// InvalidToken</code> error.
  Future<ListEventBusesResponse> listEventBuses({
    int? limit,
    String? namePrefix,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.ListEventBuses'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (limit != null) 'Limit': limit,
        if (namePrefix != null) 'NamePrefix': namePrefix,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListEventBusesResponse.fromJson(jsonResponse.body);
  }

  /// You can use this to see all the partner event sources that have been
  /// shared with your Amazon Web Services account. For more information about
  /// partner event sources, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_CreateEventBus.html">CreateEventBus</a>.
  ///
  /// May throw [InternalException].
  /// May throw [OperationDisabledException].
  ///
  /// Parameter [limit] :
  /// Specifying this limits the number of results returned by this operation.
  /// The operation also returns a NextToken which you can use in a subsequent
  /// operation to retrieve the next set of results.
  ///
  /// Parameter [namePrefix] :
  /// Specifying this limits the results to only those partner event sources
  /// with names that start with the specified prefix.
  ///
  /// Parameter [nextToken] :
  /// The token returned by a previous call, which you can use to retrieve the
  /// next set of results.
  ///
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. To retrieve the next page of results, make the call again using the
  /// returned token. Keep all other arguments unchanged.
  ///
  /// Using an expired pagination token results in an <code>HTTP 400
  /// InvalidToken</code> error.
  Future<ListEventSourcesResponse> listEventSources({
    int? limit,
    String? namePrefix,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.ListEventSources'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (limit != null) 'Limit': limit,
        if (namePrefix != null) 'NamePrefix': namePrefix,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListEventSourcesResponse.fromJson(jsonResponse.body);
  }

  /// An SaaS partner can use this operation to display the Amazon Web Services
  /// account ID that a particular partner event source name is associated with.
  /// This operation is not used by Amazon Web Services customers.
  ///
  /// May throw [InternalException].
  /// May throw [OperationDisabledException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [eventSourceName] :
  /// The name of the partner event source to display account information about.
  ///
  /// Parameter [limit] :
  /// Specifying this limits the number of results returned by this operation.
  /// The operation also returns a NextToken which you can use in a subsequent
  /// operation to retrieve the next set of results.
  ///
  /// Parameter [nextToken] :
  /// The token returned by a previous call, which you can use to retrieve the
  /// next set of results.
  ///
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. To retrieve the next page of results, make the call again using the
  /// returned token. Keep all other arguments unchanged.
  ///
  /// Using an expired pagination token results in an <code>HTTP 400
  /// InvalidToken</code> error.
  Future<ListPartnerEventSourceAccountsResponse>
      listPartnerEventSourceAccounts({
    required String eventSourceName,
    int? limit,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.ListPartnerEventSourceAccounts'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EventSourceName': eventSourceName,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListPartnerEventSourceAccountsResponse.fromJson(jsonResponse.body);
  }

  /// An SaaS partner can use this operation to list all the partner event
  /// source names that they have created. This operation is not used by Amazon
  /// Web Services customers.
  ///
  /// May throw [InternalException].
  /// May throw [OperationDisabledException].
  ///
  /// Parameter [namePrefix] :
  /// If you specify this, the results are limited to only those partner event
  /// sources that start with the string you specify.
  ///
  /// Parameter [limit] :
  /// pecifying this limits the number of results returned by this operation.
  /// The operation also returns a NextToken which you can use in a subsequent
  /// operation to retrieve the next set of results.
  ///
  /// Parameter [nextToken] :
  /// The token returned by a previous call, which you can use to retrieve the
  /// next set of results.
  ///
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. To retrieve the next page of results, make the call again using the
  /// returned token. Keep all other arguments unchanged.
  ///
  /// Using an expired pagination token results in an <code>HTTP 400
  /// InvalidToken</code> error.
  Future<ListPartnerEventSourcesResponse> listPartnerEventSources({
    required String namePrefix,
    int? limit,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.ListPartnerEventSources'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'NamePrefix': namePrefix,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListPartnerEventSourcesResponse.fromJson(jsonResponse.body);
  }

  /// Lists your replays. You can either list all the replays or you can provide
  /// a prefix to match to the replay names. Filter parameters are exclusive.
  ///
  /// May throw [InternalException].
  ///
  /// Parameter [eventSourceArn] :
  /// The ARN of the archive from which the events are replayed.
  ///
  /// Parameter [limit] :
  /// The maximum number of replays to retrieve.
  ///
  /// Parameter [namePrefix] :
  /// A name prefix to filter the replays returned. Only replays with name that
  /// match the prefix are returned.
  ///
  /// Parameter [nextToken] :
  /// The token returned by a previous call, which you can use to retrieve the
  /// next set of results.
  ///
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. To retrieve the next page of results, make the call again using the
  /// returned token. Keep all other arguments unchanged.
  ///
  /// Using an expired pagination token results in an <code>HTTP 400
  /// InvalidToken</code> error.
  ///
  /// Parameter [state] :
  /// The state of the replay.
  Future<ListReplaysResponse> listReplays({
    String? eventSourceArn,
    int? limit,
    String? namePrefix,
    String? nextToken,
    ReplayState? state,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.ListReplays'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (eventSourceArn != null) 'EventSourceArn': eventSourceArn,
        if (limit != null) 'Limit': limit,
        if (namePrefix != null) 'NamePrefix': namePrefix,
        if (nextToken != null) 'NextToken': nextToken,
        if (state != null) 'State': state.value,
      },
    );

    return ListReplaysResponse.fromJson(jsonResponse.body);
  }

  /// Lists the rules for the specified target. You can see which of the rules
  /// in Amazon EventBridge can invoke a specific target in your account.
  ///
  /// The maximum number of results per page for requests is 100.
  ///
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [targetArn] :
  /// The Amazon Resource Name (ARN) of the target resource.
  ///
  /// Parameter [eventBusName] :
  /// The name or ARN of the event bus to list rules for. If you omit this, the
  /// default event bus is used.
  ///
  /// Parameter [limit] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// The token returned by a previous call, which you can use to retrieve the
  /// next set of results.
  ///
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. To retrieve the next page of results, make the call again using the
  /// returned token. Keep all other arguments unchanged.
  ///
  /// Using an expired pagination token results in an <code>HTTP 400
  /// InvalidToken</code> error.
  Future<ListRuleNamesByTargetResponse> listRuleNamesByTarget({
    required String targetArn,
    String? eventBusName,
    int? limit,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.ListRuleNamesByTarget'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TargetArn': targetArn,
        if (eventBusName != null) 'EventBusName': eventBusName,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListRuleNamesByTargetResponse.fromJson(jsonResponse.body);
  }

  /// Lists your Amazon EventBridge rules. You can either list all the rules or
  /// you can provide a prefix to match to the rule names.
  ///
  /// The maximum number of results per page for requests is 100.
  ///
  /// ListRules does not list the targets of a rule. To see the targets
  /// associated with a rule, use <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_ListTargetsByRule.html">ListTargetsByRule</a>.
  ///
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [eventBusName] :
  /// The name or ARN of the event bus to list the rules for. If you omit this,
  /// the default event bus is used.
  ///
  /// Parameter [limit] :
  /// The maximum number of results to return.
  ///
  /// Parameter [namePrefix] :
  /// The prefix matching the rule name.
  ///
  /// Parameter [nextToken] :
  /// The token returned by a previous call, which you can use to retrieve the
  /// next set of results.
  ///
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. To retrieve the next page of results, make the call again using the
  /// returned token. Keep all other arguments unchanged.
  ///
  /// Using an expired pagination token results in an <code>HTTP 400
  /// InvalidToken</code> error.
  Future<ListRulesResponse> listRules({
    String? eventBusName,
    int? limit,
    String? namePrefix,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.ListRules'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (eventBusName != null) 'EventBusName': eventBusName,
        if (limit != null) 'Limit': limit,
        if (namePrefix != null) 'NamePrefix': namePrefix,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListRulesResponse.fromJson(jsonResponse.body);
  }

  /// Displays the tags associated with an EventBridge resource. In EventBridge,
  /// rules and event buses can be tagged.
  ///
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceARN] :
  /// The ARN of the EventBridge resource for which you want to view tags.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceARN,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Lists the targets assigned to the specified rule.
  ///
  /// The maximum number of results per page for requests is 100.
  ///
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [rule] :
  /// The name of the rule.
  ///
  /// Parameter [eventBusName] :
  /// The name or ARN of the event bus associated with the rule. If you omit
  /// this, the default event bus is used.
  ///
  /// Parameter [limit] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// The token returned by a previous call, which you can use to retrieve the
  /// next set of results.
  ///
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. To retrieve the next page of results, make the call again using the
  /// returned token. Keep all other arguments unchanged.
  ///
  /// Using an expired pagination token results in an <code>HTTP 400
  /// InvalidToken</code> error.
  Future<ListTargetsByRuleResponse> listTargetsByRule({
    required String rule,
    String? eventBusName,
    int? limit,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.ListTargetsByRule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Rule': rule,
        if (eventBusName != null) 'EventBusName': eventBusName,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListTargetsByRuleResponse.fromJson(jsonResponse.body);
  }

  /// Sends custom events to Amazon EventBridge so that they can be matched to
  /// rules.
  ///
  /// You can batch multiple event entries into one request for efficiency.
  /// However, the total entry size must be less than 256KB. You can calculate
  /// the entry size before you send the events. For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-putevents.html#eb-putevent-size">Calculating
  /// PutEvents event entry size</a> in the <i> <i>Amazon EventBridge User
  /// Guide</i> </i>.
  ///
  /// PutEvents accepts the data in JSON format. For the JSON number (integer)
  /// data type, the constraints are: a minimum value of
  /// -9,223,372,036,854,775,808 and a maximum value of
  /// 9,223,372,036,854,775,807.
  /// <note>
  /// PutEvents will only process nested JSON up to 1000 levels deep.
  /// </note>
  ///
  /// May throw [InternalException].
  ///
  /// Parameter [entries] :
  /// The entry that defines an event in your system. You can specify several
  /// parameters for the entry such as the source and type of the event,
  /// resources associated with the event, and so on.
  ///
  /// Parameter [endpointId] :
  /// The URL subdomain of the endpoint. For example, if the URL for Endpoint is
  /// https://abcde.veo.endpoints.event.amazonaws.com, then the EndpointId is
  /// <code>abcde.veo</code>.
  /// <important>
  /// When using Java, you must include <code>auth-crt</code> on the class path.
  /// </important>
  Future<PutEventsResponse> putEvents({
    required List<PutEventsRequestEntry> entries,
    String? endpointId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.PutEvents'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Entries': entries,
        if (endpointId != null) 'EndpointId': endpointId,
      },
      endpoint: _resolveEndpoint(
        endpointId: endpointId,
      ),
    );

    return PutEventsResponse.fromJson(jsonResponse.body);
  }

  /// This is used by SaaS partners to write events to a customer's partner
  /// event bus. Amazon Web Services customers do not use this operation.
  ///
  /// For information on calculating event batch size, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-putevent-size.html">Calculating
  /// EventBridge PutEvents event entry size</a> in the <i>EventBridge User
  /// Guide</i>.
  ///
  /// May throw [InternalException].
  /// May throw [OperationDisabledException].
  ///
  /// Parameter [entries] :
  /// The list of events to write to the event bus.
  Future<PutPartnerEventsResponse> putPartnerEvents({
    required List<PutPartnerEventsRequestEntry> entries,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.PutPartnerEvents'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Entries': entries,
      },
    );

    return PutPartnerEventsResponse.fromJson(jsonResponse.body);
  }

  /// Running <code>PutPermission</code> permits the specified Amazon Web
  /// Services account or Amazon Web Services organization to put events to the
  /// specified <i>event bus</i>. Amazon EventBridge rules in your account are
  /// triggered by these events arriving to an event bus in your account.
  ///
  /// For another account to send events to your account, that external account
  /// must have an EventBridge rule with your account's event bus as a target.
  ///
  /// To enable multiple Amazon Web Services accounts to put events to your
  /// event bus, run <code>PutPermission</code> once for each of these accounts.
  /// Or, if all the accounts are members of the same Amazon Web Services
  /// organization, you can run <code>PutPermission</code> once specifying
  /// <code>Principal</code> as "*" and specifying the Amazon Web Services
  /// organization ID in <code>Condition</code>, to grant permissions to all
  /// accounts in that organization.
  ///
  /// If you grant permissions using an organization, then accounts in that
  /// organization must specify a <code>RoleArn</code> with proper permissions
  /// when they use <code>PutTarget</code> to add your account's event bus as a
  /// target. For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-cross-account-event-delivery.html">Sending
  /// and Receiving Events Between Amazon Web Services Accounts</a> in the
  /// <i>Amazon EventBridge User Guide</i>.
  ///
  /// The permission policy on the event bus cannot exceed 10 KB in size.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [InternalException].
  /// May throw [OperationDisabledException].
  /// May throw [PolicyLengthExceededException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [action] :
  /// The action that you are enabling the other account to perform.
  ///
  /// Parameter [condition] :
  /// This parameter enables you to limit the permission to accounts that
  /// fulfill a certain condition, such as being a member of a certain Amazon
  /// Web Services organization. For more information about Amazon Web Services
  /// Organizations, see <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_introduction.html">What
  /// Is Amazon Web Services Organizations</a> in the <i>Amazon Web Services
  /// Organizations User Guide</i>.
  ///
  /// If you specify <code>Condition</code> with an Amazon Web Services
  /// organization ID, and specify "*" as the value for <code>Principal</code>,
  /// you grant permission to all the accounts in the named organization.
  ///
  /// The <code>Condition</code> is a JSON string which must contain
  /// <code>Type</code>, <code>Key</code>, and <code>Value</code> fields.
  ///
  /// Parameter [eventBusName] :
  /// The name of the event bus associated with the rule. If you omit this, the
  /// default event bus is used.
  ///
  /// Parameter [policy] :
  /// A JSON string that describes the permission policy statement. You can
  /// include a <code>Policy</code> parameter in the request instead of using
  /// the <code>StatementId</code>, <code>Action</code>, <code>Principal</code>,
  /// or <code>Condition</code> parameters.
  ///
  /// Parameter [principal] :
  /// The 12-digit Amazon Web Services account ID that you are permitting to put
  /// events to your default event bus. Specify "*" to permit any account to put
  /// events to your default event bus.
  ///
  /// If you specify "*" without specifying <code>Condition</code>, avoid
  /// creating rules that may match undesirable events. To create more secure
  /// rules, make sure that the event pattern for each rule contains an
  /// <code>account</code> field with a specific account ID from which to
  /// receive events. Rules with an account field do not match any events sent
  /// from other accounts.
  ///
  /// Parameter [statementId] :
  /// An identifier string for the external account that you are granting
  /// permissions to. If you later want to revoke the permission for this
  /// external account, specify this <code>StatementId</code> when you run <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_RemovePermission.html">RemovePermission</a>.
  /// <note>
  /// Each <code>StatementId</code> must be unique.
  /// </note>
  Future<void> putPermission({
    String? action,
    Condition? condition,
    String? eventBusName,
    String? policy,
    String? principal,
    String? statementId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.PutPermission'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (action != null) 'Action': action,
        if (condition != null) 'Condition': condition,
        if (eventBusName != null) 'EventBusName': eventBusName,
        if (policy != null) 'Policy': policy,
        if (principal != null) 'Principal': principal,
        if (statementId != null) 'StatementId': statementId,
      },
    );
  }

  /// Creates or updates the specified rule. Rules are enabled by default, or
  /// based on value of the state. You can disable a rule using <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_DisableRule.html">DisableRule</a>.
  ///
  /// A single rule watches for events from a single event bus. Events generated
  /// by Amazon Web Services services go to your account's default event bus.
  /// Events generated by SaaS partner services or applications go to the
  /// matching partner event bus. If you have custom applications or services,
  /// you can specify whether their events go to your default event bus or a
  /// custom event bus that you have created. For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_CreateEventBus.html">CreateEventBus</a>.
  ///
  /// If you are updating an existing rule, the rule is replaced with what you
  /// specify in this <code>PutRule</code> command. If you omit arguments in
  /// <code>PutRule</code>, the old values for those arguments are not kept.
  /// Instead, they are replaced with null values.
  ///
  /// When you create or update a rule, incoming events might not immediately
  /// start matching to new or updated rules. Allow a short period of time for
  /// changes to take effect.
  ///
  /// A rule must contain at least an EventPattern or ScheduleExpression. Rules
  /// with EventPatterns are triggered when a matching event is observed. Rules
  /// with ScheduleExpressions self-trigger based on the given schedule. A rule
  /// can have both an EventPattern and a ScheduleExpression, in which case the
  /// rule triggers on matching events as well as on a schedule.
  ///
  /// When you initially create a rule, you can optionally assign one or more
  /// tags to the rule. Tags can help you organize and categorize your
  /// resources. You can also use them to scope user permissions, by granting a
  /// user permission to access or change only rules with certain tag values. To
  /// use the <code>PutRule</code> operation and assign tags, you must have both
  /// the <code>events:PutRule</code> and <code>events:TagResource</code>
  /// permissions.
  ///
  /// If you are updating an existing rule, any tags you specify in the
  /// <code>PutRule</code> operation are ignored. To update the tags of an
  /// existing rule, use <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_TagResource.html">TagResource</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_UntagResource.html">UntagResource</a>.
  ///
  /// Most services in Amazon Web Services treat : or / as the same character in
  /// Amazon Resource Names (ARNs). However, EventBridge uses an exact match in
  /// event patterns and rules. Be sure to use the correct ARN characters when
  /// creating event patterns so that they match the ARN syntax in the event you
  /// want to match.
  ///
  /// In EventBridge, it is possible to create rules that lead to infinite
  /// loops, where a rule is fired repeatedly. For example, a rule might detect
  /// that ACLs have changed on an S3 bucket, and trigger software to change
  /// them to the desired state. If the rule is not written carefully, the
  /// subsequent change to the ACLs fires the rule again, creating an infinite
  /// loop.
  ///
  /// To prevent this, write the rules so that the triggered actions do not
  /// re-fire the same rule. For example, your rule could fire only if ACLs are
  /// found to be in a bad state, instead of after any change.
  ///
  /// An infinite loop can quickly cause higher than expected charges. We
  /// recommend that you use budgeting, which alerts you when charges exceed
  /// your specified limit. For more information, see <a
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/budgets-managing-costs.html">Managing
  /// Your Costs with Budgets</a>.
  ///
  /// To create a rule that filters for management events from Amazon Web
  /// Services services, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-service-event-cloudtrail.html#eb-service-event-cloudtrail-management">Receiving
  /// read-only management events from Amazon Web Services services</a> in the
  /// <i>EventBridge User Guide</i>.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [InternalException].
  /// May throw [InvalidEventPatternException].
  /// May throw [LimitExceededException].
  /// May throw [ManagedRuleException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [name] :
  /// The name of the rule that you are creating or updating.
  ///
  /// Parameter [description] :
  /// A description of the rule.
  ///
  /// Parameter [eventBusName] :
  /// The name or ARN of the event bus to associate with this rule. If you omit
  /// this, the default event bus is used.
  ///
  /// Parameter [eventPattern] :
  /// The event pattern. For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-event-patterns.html">Amazon
  /// EventBridge event patterns</a> in the <i> <i>Amazon EventBridge User
  /// Guide</i> </i>.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role associated with the rule.
  ///
  /// If you're setting an event bus in another account as the target and that
  /// account granted permission to your account through an organization instead
  /// of directly by the account ID, you must specify a <code>RoleArn</code>
  /// with proper permissions in the <code>Target</code> structure, instead of
  /// here in this parameter.
  ///
  /// Parameter [scheduleExpression] :
  /// The scheduling expression. For example, "cron(0 20 * * ? *)" or "rate(5
  /// minutes)".
  ///
  /// Parameter [state] :
  /// The state of the rule.
  ///
  /// Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>DISABLED</code>: The rule is disabled. EventBridge does not match
  /// any events against the rule.
  /// </li>
  /// <li>
  /// <code>ENABLED</code>: The rule is enabled. EventBridge matches events
  /// against the rule, <i>except</i> for Amazon Web Services management events
  /// delivered through CloudTrail.
  /// </li>
  /// <li>
  /// <code>ENABLED_WITH_ALL_CLOUDTRAIL_MANAGEMENT_EVENTS</code>: The rule is
  /// enabled for all events, including Amazon Web Services management events
  /// delivered through CloudTrail.
  ///
  /// Management events provide visibility into management operations that are
  /// performed on resources in your Amazon Web Services account. These are also
  /// known as control plane operations. For more information, see <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-management-events-with-cloudtrail.html#logging-management-events">Logging
  /// management events</a> in the <i>CloudTrail User Guide</i>, and <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-service-event.html#eb-service-event-cloudtrail">Filtering
  /// management events from Amazon Web Services services</a> in the <i>
  /// <i>Amazon EventBridge User Guide</i> </i>.
  ///
  /// This value is only valid for rules on the <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-what-is-how-it-works-concepts.html#eb-bus-concepts-buses">default</a>
  /// event bus or <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-create-event-bus.html">custom
  /// event buses</a>. It does not apply to <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-saas.html">partner
  /// event buses</a>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [tags] :
  /// The list of key-value pairs to associate with the rule.
  Future<PutRuleResponse> putRule({
    required String name,
    String? description,
    String? eventBusName,
    String? eventPattern,
    String? roleArn,
    String? scheduleExpression,
    RuleState? state,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.PutRule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        if (description != null) 'Description': description,
        if (eventBusName != null) 'EventBusName': eventBusName,
        if (eventPattern != null) 'EventPattern': eventPattern,
        if (roleArn != null) 'RoleArn': roleArn,
        if (scheduleExpression != null)
          'ScheduleExpression': scheduleExpression,
        if (state != null) 'State': state.value,
        if (tags != null) 'Tags': tags,
      },
    );

    return PutRuleResponse.fromJson(jsonResponse.body);
  }

  /// Adds the specified targets to the specified rule, or updates the targets
  /// if they are already associated with the rule.
  ///
  /// Targets are the resources that are invoked when a rule is triggered.
  ///
  /// The maximum number of entries per request is 10.
  /// <note>
  /// Each rule can have up to five (5) targets associated with it at one time.
  /// </note>
  /// For a list of services you can configure as targets for events, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-targets.html">EventBridge
  /// targets</a> in the <i> <i>Amazon EventBridge User Guide</i> </i>.
  ///
  /// Creating rules with built-in targets is supported only in the Amazon Web
  /// Services Management Console. The built-in targets are:
  ///
  /// <ul>
  /// <li>
  /// <code>Amazon EBS CreateSnapshot API call</code>
  /// </li>
  /// <li>
  /// <code>Amazon EC2 RebootInstances API call</code>
  /// </li>
  /// <li>
  /// <code>Amazon EC2 StopInstances API call</code>
  /// </li>
  /// <li>
  /// <code>Amazon EC2 TerminateInstances API call</code>
  /// </li>
  /// </ul>
  /// For some target types, <code>PutTargets</code> provides target-specific
  /// parameters. If the target is a Kinesis data stream, you can optionally
  /// specify which shard the event goes to by using the
  /// <code>KinesisParameters</code> argument. To invoke a command on multiple
  /// EC2 instances with one rule, you can use the
  /// <code>RunCommandParameters</code> field.
  ///
  /// To be able to make API calls against the resources that you own, Amazon
  /// EventBridge needs the appropriate permissions:
  ///
  /// <ul>
  /// <li>
  /// For Lambda and Amazon SNS resources, EventBridge relies on resource-based
  /// policies.
  /// </li>
  /// <li>
  /// For EC2 instances, Kinesis Data Streams, Step Functions state machines and
  /// API Gateway APIs, EventBridge relies on IAM roles that you specify in the
  /// <code>RoleARN</code> argument in <code>PutTargets</code>.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/auth-and-access-control-eventbridge.html">Authentication
  /// and Access Control</a> in the <i> <i>Amazon EventBridge User Guide</i>
  /// </i>.
  ///
  /// If another Amazon Web Services account is in the same region and has
  /// granted you permission (using <code>PutPermission</code>), you can send
  /// events to that account. Set that account's event bus as a target of the
  /// rules in your account. To send the matched events to the other account,
  /// specify that account's event bus as the <code>Arn</code> value when you
  /// run <code>PutTargets</code>. If your account sends events to another
  /// account, your account is charged for each sent event. Each event sent to
  /// another account is charged as a custom event. The account receiving the
  /// event is not charged. For more information, see <a
  /// href="http://aws.amazon.com/eventbridge/pricing/">Amazon EventBridge
  /// Pricing</a>.
  /// <note>
  /// <code>Input</code>, <code>InputPath</code>, and
  /// <code>InputTransformer</code> are not available with
  /// <code>PutTarget</code> if the target is an event bus of a different Amazon
  /// Web Services account.
  /// </note>
  /// If you are setting the event bus of another account as the target, and
  /// that account granted permission to your account through an organization
  /// instead of directly by the account ID, then you must specify a
  /// <code>RoleArn</code> with proper permissions in the <code>Target</code>
  /// structure. For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-cross-account-event-delivery.html">Sending
  /// and Receiving Events Between Amazon Web Services Accounts</a> in the
  /// <i>Amazon EventBridge User Guide</i>.
  /// <note>
  /// If you have an IAM role on a cross-account event bus target, a
  /// <code>PutTargets</code> call without a role on the same target (same
  /// <code>Id</code> and <code>Arn</code>) will not remove the role.
  /// </note>
  /// For more information about enabling cross-account events, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_PutPermission.html">PutPermission</a>.
  ///
  /// <b>Input</b>, <b>InputPath</b>, and <b>InputTransformer</b> are mutually
  /// exclusive and optional parameters of a target. When a rule is triggered
  /// due to a matched event:
  ///
  /// <ul>
  /// <li>
  /// If none of the following arguments are specified for a target, then the
  /// entire event is passed to the target in JSON format (unless the target is
  /// Amazon EC2 Run Command or Amazon ECS task, in which case nothing from the
  /// event is passed to the target).
  /// </li>
  /// <li>
  /// If <b>Input</b> is specified in the form of valid JSON, then the matched
  /// event is overridden with this constant.
  /// </li>
  /// <li>
  /// If <b>InputPath</b> is specified in the form of JSONPath (for example,
  /// <code>$.detail</code>), then only the part of the event specified in the
  /// path is passed to the target (for example, only the detail part of the
  /// event is passed).
  /// </li>
  /// <li>
  /// If <b>InputTransformer</b> is specified, then one or more specified
  /// JSONPaths are extracted from the event and used as values in a template
  /// that you specify as the input to the target.
  /// </li>
  /// </ul>
  /// When you specify <code>InputPath</code> or <code>InputTransformer</code>,
  /// you must use JSON dot notation, not bracket notation.
  ///
  /// When you add targets to a rule and the associated rule triggers soon
  /// after, new or updated targets might not be immediately invoked. Allow a
  /// short period of time for changes to take effect.
  ///
  /// This action can partially fail if too many requests are made at the same
  /// time. If that happens, <code>FailedEntryCount</code> is non-zero in the
  /// response and each entry in <code>FailedEntries</code> provides the ID of
  /// the failed target and the error code.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [InternalException].
  /// May throw [LimitExceededException].
  /// May throw [ManagedRuleException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [rule] :
  /// The name of the rule.
  ///
  /// Parameter [targets] :
  /// The targets to update or add to the rule.
  ///
  /// Parameter [eventBusName] :
  /// The name or ARN of the event bus associated with the rule. If you omit
  /// this, the default event bus is used.
  Future<PutTargetsResponse> putTargets({
    required String rule,
    required List<Target> targets,
    String? eventBusName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.PutTargets'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Rule': rule,
        'Targets': targets,
        if (eventBusName != null) 'EventBusName': eventBusName,
      },
    );

    return PutTargetsResponse.fromJson(jsonResponse.body);
  }

  /// Revokes the permission of another Amazon Web Services account to be able
  /// to put events to the specified event bus. Specify the account to revoke by
  /// the <code>StatementId</code> value that you associated with the account
  /// when you granted it permission with <code>PutPermission</code>. You can
  /// find the <code>StatementId</code> by using <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_DescribeEventBus.html">DescribeEventBus</a>.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [InternalException].
  /// May throw [OperationDisabledException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [eventBusName] :
  /// The name of the event bus to revoke permissions for. If you omit this, the
  /// default event bus is used.
  ///
  /// Parameter [removeAllPermissions] :
  /// Specifies whether to remove all permissions.
  ///
  /// Parameter [statementId] :
  /// The statement ID corresponding to the account that is no longer allowed to
  /// put events to the default event bus.
  Future<void> removePermission({
    String? eventBusName,
    bool? removeAllPermissions,
    String? statementId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.RemovePermission'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (eventBusName != null) 'EventBusName': eventBusName,
        if (removeAllPermissions != null)
          'RemoveAllPermissions': removeAllPermissions,
        if (statementId != null) 'StatementId': statementId,
      },
    );
  }

  /// Removes the specified targets from the specified rule. When the rule is
  /// triggered, those targets are no longer be invoked.
  /// <note>
  /// A successful execution of <code>RemoveTargets</code> doesn't guarantee all
  /// targets are removed from the rule, it means that the target(s) listed in
  /// the request are removed.
  /// </note>
  /// When you remove a target, when the associated rule triggers, removed
  /// targets might continue to be invoked. Allow a short period of time for
  /// changes to take effect.
  ///
  /// This action can partially fail if too many requests are made at the same
  /// time. If that happens, <code>FailedEntryCount</code> is non-zero in the
  /// response and each entry in <code>FailedEntries</code> provides the ID of
  /// the failed target and the error code.
  ///
  /// The maximum number of entries per request is 10.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [InternalException].
  /// May throw [ManagedRuleException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [ids] :
  /// The IDs of the targets to remove from the rule.
  ///
  /// Parameter [rule] :
  /// The name of the rule.
  ///
  /// Parameter [eventBusName] :
  /// The name or ARN of the event bus associated with the rule. If you omit
  /// this, the default event bus is used.
  ///
  /// Parameter [force] :
  /// If this is a managed rule, created by an Amazon Web Services service on
  /// your behalf, you must specify <code>Force</code> as <code>True</code> to
  /// remove targets. This parameter is ignored for rules that are not managed
  /// rules. You can check whether a rule is a managed rule by using
  /// <code>DescribeRule</code> or <code>ListRules</code> and checking the
  /// <code>ManagedBy</code> field of the response.
  Future<RemoveTargetsResponse> removeTargets({
    required List<String> ids,
    required String rule,
    String? eventBusName,
    bool? force,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.RemoveTargets'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Ids': ids,
        'Rule': rule,
        if (eventBusName != null) 'EventBusName': eventBusName,
        if (force != null) 'Force': force,
      },
    );

    return RemoveTargetsResponse.fromJson(jsonResponse.body);
  }

  /// Starts the specified replay. Events are not necessarily replayed in the
  /// exact same order that they were added to the archive. A replay processes
  /// events to replay based on the time in the event, and replays them using 1
  /// minute intervals. If you specify an <code>EventStartTime</code> and an
  /// <code>EventEndTime</code> that covers a 20 minute time range, the events
  /// are replayed from the first minute of that 20 minute range first. Then the
  /// events from the second minute are replayed. You can use
  /// <code>DescribeReplay</code> to determine the progress of a replay. The
  /// value returned for <code>EventLastReplayedTime</code> indicates the time
  /// within the specified time range associated with the last event replayed.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidEventPatternException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [destination] :
  /// A <code>ReplayDestination</code> object that includes details about the
  /// destination for the replay.
  ///
  /// Parameter [eventEndTime] :
  /// A time stamp for the time to stop replaying events. Only events that
  /// occurred between the <code>EventStartTime</code> and
  /// <code>EventEndTime</code> are replayed.
  ///
  /// Parameter [eventSourceArn] :
  /// The ARN of the archive to replay events from.
  ///
  /// Parameter [eventStartTime] :
  /// A time stamp for the time to start replaying events. Only events that
  /// occurred between the <code>EventStartTime</code> and
  /// <code>EventEndTime</code> are replayed.
  ///
  /// Parameter [replayName] :
  /// The name of the replay to start.
  ///
  /// Parameter [description] :
  /// A description for the replay to start.
  Future<StartReplayResponse> startReplay({
    required ReplayDestination destination,
    required DateTime eventEndTime,
    required String eventSourceArn,
    required DateTime eventStartTime,
    required String replayName,
    String? description,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.StartReplay'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Destination': destination,
        'EventEndTime': unixTimestampToJson(eventEndTime),
        'EventSourceArn': eventSourceArn,
        'EventStartTime': unixTimestampToJson(eventStartTime),
        'ReplayName': replayName,
        if (description != null) 'Description': description,
      },
    );

    return StartReplayResponse.fromJson(jsonResponse.body);
  }

  /// Assigns one or more tags (key-value pairs) to the specified EventBridge
  /// resource. Tags can help you organize and categorize your resources. You
  /// can also use them to scope user permissions by granting a user permission
  /// to access or change only resources with certain tag values. In
  /// EventBridge, rules and event buses can be tagged.
  ///
  /// Tags don't have any semantic meaning to Amazon Web Services and are
  /// interpreted strictly as strings of characters.
  ///
  /// You can use the <code>TagResource</code> action with a resource that
  /// already has tags. If you specify a new tag key, this tag is appended to
  /// the list of tags associated with the resource. If you specify a tag key
  /// that is already associated with the resource, the new tag value that you
  /// specify replaces the previous value for that tag.
  ///
  /// You can associate as many as 50 tags with a resource.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [InternalException].
  /// May throw [ManagedRuleException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceARN] :
  /// The ARN of the EventBridge resource that you're adding tags to.
  ///
  /// Parameter [tags] :
  /// The list of key-value pairs to associate with the resource.
  Future<void> tagResource({
    required String resourceARN,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        'Tags': tags,
      },
    );
  }

  /// Tests whether the specified event pattern matches the provided event.
  ///
  /// Most services in Amazon Web Services treat : or / as the same character in
  /// Amazon Resource Names (ARNs). However, EventBridge uses an exact match in
  /// event patterns and rules. Be sure to use the correct ARN characters when
  /// creating event patterns so that they match the ARN syntax in the event you
  /// want to match.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidEventPatternException].
  ///
  /// Parameter [event] :
  /// The event, in JSON format, to test against the event pattern. The JSON
  /// must follow the format specified in <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/aws-events.html">Amazon
  /// Web Services Events</a>, and the following fields are mandatory:
  ///
  /// <ul>
  /// <li>
  /// <code>id</code>
  /// </li>
  /// <li>
  /// <code>account</code>
  /// </li>
  /// <li>
  /// <code>source</code>
  /// </li>
  /// <li>
  /// <code>time</code>
  /// </li>
  /// <li>
  /// <code>region</code>
  /// </li>
  /// <li>
  /// <code>resources</code>
  /// </li>
  /// <li>
  /// <code>detail-type</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [eventPattern] :
  /// The event pattern. For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-and-event-patterns.html">Events
  /// and Event Patterns</a> in the <i> <i>Amazon EventBridge User Guide</i>
  /// </i>.
  Future<TestEventPatternResponse> testEventPattern({
    required String event,
    required String eventPattern,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.TestEventPattern'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Event': event,
        'EventPattern': eventPattern,
      },
    );

    return TestEventPatternResponse.fromJson(jsonResponse.body);
  }

  /// Removes one or more tags from the specified EventBridge resource. In
  /// Amazon EventBridge, rules and event buses can be tagged.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [InternalException].
  /// May throw [ManagedRuleException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceARN] :
  /// The ARN of the EventBridge resource from which you are removing tags.
  ///
  /// Parameter [tagKeys] :
  /// The list of tag keys to remove from the resource.
  Future<void> untagResource({
    required String resourceARN,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        'TagKeys': tagKeys,
      },
    );
  }

  /// Updates an API destination.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [InternalException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [name] :
  /// The name of the API destination to update.
  ///
  /// Parameter [connectionArn] :
  /// The ARN of the connection to use for the API destination.
  ///
  /// Parameter [description] :
  /// The name of the API destination to update.
  ///
  /// Parameter [httpMethod] :
  /// The method to use for the API destination.
  ///
  /// Parameter [invocationEndpoint] :
  /// The URL to the endpoint to use for the API destination.
  ///
  /// Parameter [invocationRateLimitPerSecond] :
  /// The maximum number of invocations per second to send to the API
  /// destination.
  Future<UpdateApiDestinationResponse> updateApiDestination({
    required String name,
    String? connectionArn,
    String? description,
    ApiDestinationHttpMethod? httpMethod,
    String? invocationEndpoint,
    int? invocationRateLimitPerSecond,
  }) async {
    _s.validateNumRange(
      'invocationRateLimitPerSecond',
      invocationRateLimitPerSecond,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.UpdateApiDestination'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        if (connectionArn != null) 'ConnectionArn': connectionArn,
        if (description != null) 'Description': description,
        if (httpMethod != null) 'HttpMethod': httpMethod.value,
        if (invocationEndpoint != null)
          'InvocationEndpoint': invocationEndpoint,
        if (invocationRateLimitPerSecond != null)
          'InvocationRateLimitPerSecond': invocationRateLimitPerSecond,
      },
    );

    return UpdateApiDestinationResponse.fromJson(jsonResponse.body);
  }

  /// Updates the specified archive.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [InternalException].
  /// May throw [InvalidEventPatternException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [archiveName] :
  /// The name of the archive to update.
  ///
  /// Parameter [description] :
  /// The description for the archive.
  ///
  /// Parameter [eventPattern] :
  /// The event pattern to use to filter events sent to the archive.
  ///
  /// Parameter [kmsKeyIdentifier] :
  /// The identifier of the KMS customer managed key for EventBridge to use, if
  /// you choose to use a customer managed key to encrypt this archive. The
  /// identifier can be the key Amazon Resource Name (ARN), KeyId, key alias, or
  /// key alias ARN.
  ///
  /// If you do not specify a customer managed key identifier, EventBridge uses
  /// an Amazon Web Services owned key to encrypt the archive.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/viewing-keys.html">Identify
  /// and view keys</a> in the <i>Key Management Service Developer Guide</i>.
  /// <important>
  /// If you have specified that EventBridge use a customer managed key for
  /// encrypting the source event bus, we strongly recommend you also specify a
  /// customer managed key for any archives for the event bus as well.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/encryption-archives.html">Encrypting
  /// archives</a> in the <i>Amazon EventBridge User Guide</i>.
  /// </important>
  ///
  /// Parameter [retentionDays] :
  /// The number of days to retain events in the archive.
  Future<UpdateArchiveResponse> updateArchive({
    required String archiveName,
    String? description,
    String? eventPattern,
    String? kmsKeyIdentifier,
    int? retentionDays,
  }) async {
    _s.validateNumRange(
      'retentionDays',
      retentionDays,
      0,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.UpdateArchive'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ArchiveName': archiveName,
        if (description != null) 'Description': description,
        if (eventPattern != null) 'EventPattern': eventPattern,
        if (kmsKeyIdentifier != null) 'KmsKeyIdentifier': kmsKeyIdentifier,
        if (retentionDays != null) 'RetentionDays': retentionDays,
      },
    );

    return UpdateArchiveResponse.fromJson(jsonResponse.body);
  }

  /// Updates settings for a connection.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConcurrentModificationException].
  /// May throw [InternalException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [name] :
  /// The name of the connection to update.
  ///
  /// Parameter [authParameters] :
  /// The authorization parameters to use for the connection.
  ///
  /// Parameter [authorizationType] :
  /// The type of authorization to use for the connection.
  ///
  /// Parameter [description] :
  /// A description for the connection.
  ///
  /// Parameter [invocationConnectivityParameters] :
  /// For connections to private APIs, the parameters to use for invoking the
  /// API.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/connection-private.html">Connecting
  /// to private APIs</a> in the <i> <i>Amazon EventBridge User Guide</i> </i>.
  ///
  /// Parameter [kmsKeyIdentifier] :
  /// The identifier of the KMS customer managed key for EventBridge to use, if
  /// you choose to use a customer managed key to encrypt this connection. The
  /// identifier can be the key Amazon Resource Name (ARN), KeyId, key alias, or
  /// key alias ARN.
  ///
  /// If you do not specify a customer managed key identifier, EventBridge uses
  /// an Amazon Web Services owned key to encrypt the connection.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/viewing-keys.html">Identify
  /// and view keys</a> in the <i>Key Management Service Developer Guide</i>.
  Future<UpdateConnectionResponse> updateConnection({
    required String name,
    UpdateConnectionAuthRequestParameters? authParameters,
    ConnectionAuthorizationType? authorizationType,
    String? description,
    ConnectivityResourceParameters? invocationConnectivityParameters,
    String? kmsKeyIdentifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.UpdateConnection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        if (authParameters != null) 'AuthParameters': authParameters,
        if (authorizationType != null)
          'AuthorizationType': authorizationType.value,
        if (description != null) 'Description': description,
        if (invocationConnectivityParameters != null)
          'InvocationConnectivityParameters': invocationConnectivityParameters,
        if (kmsKeyIdentifier != null) 'KmsKeyIdentifier': kmsKeyIdentifier,
      },
    );

    return UpdateConnectionResponse.fromJson(jsonResponse.body);
  }

  /// Update an existing endpoint. For more information about global endpoints,
  /// see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-global-endpoints.html">Making
  /// applications Regional-fault tolerant with global endpoints and event
  /// replication</a> in the <i> <i>Amazon EventBridge User Guide</i> </i>.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [name] :
  /// The name of the endpoint you want to update.
  ///
  /// Parameter [description] :
  /// A description for the endpoint.
  ///
  /// Parameter [eventBuses] :
  /// Define event buses used for replication.
  ///
  /// Parameter [replicationConfig] :
  /// Whether event replication was enabled or disabled by this request.
  ///
  /// Parameter [roleArn] :
  /// The ARN of the role used by event replication for this request.
  ///
  /// Parameter [routingConfig] :
  /// Configure the routing policy, including the health check and secondary
  /// Region.
  Future<UpdateEndpointResponse> updateEndpoint({
    required String name,
    String? description,
    List<EndpointEventBus>? eventBuses,
    ReplicationConfig? replicationConfig,
    String? roleArn,
    RoutingConfig? routingConfig,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.UpdateEndpoint'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        if (description != null) 'Description': description,
        if (eventBuses != null) 'EventBuses': eventBuses,
        if (replicationConfig != null) 'ReplicationConfig': replicationConfig,
        if (roleArn != null) 'RoleArn': roleArn,
        if (routingConfig != null) 'RoutingConfig': routingConfig,
      },
    );

    return UpdateEndpointResponse.fromJson(jsonResponse.body);
  }

  /// Updates the specified event bus.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [InternalException].
  /// May throw [OperationDisabledException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [description] :
  /// The event bus description.
  ///
  /// Parameter [kmsKeyIdentifier] :
  /// The identifier of the KMS customer managed key for EventBridge to use, if
  /// you choose to use a customer managed key to encrypt events on this event
  /// bus. The identifier can be the key Amazon Resource Name (ARN), KeyId, key
  /// alias, or key alias ARN.
  ///
  /// If you do not specify a customer managed key identifier, EventBridge uses
  /// an Amazon Web Services owned key to encrypt events on the event bus.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/viewing-keys.html">Identify
  /// and view keys</a> in the <i>Key Management Service Developer Guide</i>.
  /// <note>
  /// Schema discovery is not supported for event buses encrypted using a
  /// customer managed key. EventBridge returns an error if:
  ///
  /// <ul>
  /// <li>
  /// You call <code> <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/schema-reference/v1-discoverers.html#CreateDiscoverer">CreateDiscoverer</a>
  /// </code> on an event bus set to use a customer managed key for encryption.
  /// </li>
  /// <li>
  /// You call <code> <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_UpdatedEventBus.html">UpdatedEventBus</a>
  /// </code> to set a customer managed key on an event bus with schema
  /// discovery enabled.
  /// </li>
  /// </ul>
  /// To enable schema discovery on an event bus, choose to use an Amazon Web
  /// Services owned key. For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-encryption-event-bus-cmkey.html">Encrypting
  /// events</a> in the <i>Amazon EventBridge User Guide</i>.
  /// </note> <important>
  /// If you have specified that EventBridge use a customer managed key for
  /// encrypting the source event bus, we strongly recommend you also specify a
  /// customer managed key for any archives for the event bus as well.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/encryption-archives.html">Encrypting
  /// archives</a> in the <i>Amazon EventBridge User Guide</i>.
  /// </important>
  ///
  /// Parameter [logConfig] :
  /// The logging configuration settings for the event bus.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eb-event-bus-logs.html">Configuring logs
  /// for event buses</a> in the <i>EventBridge User Guide</i>.
  ///
  /// Parameter [name] :
  /// The name of the event bus.
  Future<UpdateEventBusResponse> updateEventBus({
    DeadLetterConfig? deadLetterConfig,
    String? description,
    String? kmsKeyIdentifier,
    LogConfig? logConfig,
    String? name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.UpdateEventBus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (deadLetterConfig != null) 'DeadLetterConfig': deadLetterConfig,
        if (description != null) 'Description': description,
        if (kmsKeyIdentifier != null) 'KmsKeyIdentifier': kmsKeyIdentifier,
        if (logConfig != null) 'LogConfig': logConfig,
        if (name != null) 'Name': name,
      },
    );

    return UpdateEventBusResponse.fromJson(jsonResponse.body);
  }
}

/// @nodoc
class CancelReplayResponse {
  /// The ARN of the replay to cancel.
  final String? replayArn;

  /// The current state of the replay.
  final ReplayState? state;

  /// The reason that the replay is in the current state.
  final String? stateReason;

  CancelReplayResponse({
    this.replayArn,
    this.state,
    this.stateReason,
  });

  factory CancelReplayResponse.fromJson(Map<String, dynamic> json) {
    return CancelReplayResponse(
      replayArn: json['ReplayArn'] as String?,
      state: (json['State'] as String?)?.let(ReplayState.fromString),
      stateReason: json['StateReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final replayArn = this.replayArn;
    final state = this.state;
    final stateReason = this.stateReason;
    return {
      if (replayArn != null) 'ReplayArn': replayArn,
      if (state != null) 'State': state.value,
      if (stateReason != null) 'StateReason': stateReason,
    };
  }
}

/// @nodoc
class CreateApiDestinationResponse {
  /// The ARN of the API destination that was created by the request.
  final String? apiDestinationArn;

  /// The state of the API destination that was created by the request.
  final ApiDestinationState? apiDestinationState;

  /// A time stamp indicating the time that the API destination was created.
  final DateTime? creationTime;

  /// A time stamp indicating the time that the API destination was last modified.
  final DateTime? lastModifiedTime;

  CreateApiDestinationResponse({
    this.apiDestinationArn,
    this.apiDestinationState,
    this.creationTime,
    this.lastModifiedTime,
  });

  factory CreateApiDestinationResponse.fromJson(Map<String, dynamic> json) {
    return CreateApiDestinationResponse(
      apiDestinationArn: json['ApiDestinationArn'] as String?,
      apiDestinationState: (json['ApiDestinationState'] as String?)
          ?.let(ApiDestinationState.fromString),
      creationTime: timeStampFromJson(json['CreationTime']),
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final apiDestinationArn = this.apiDestinationArn;
    final apiDestinationState = this.apiDestinationState;
    final creationTime = this.creationTime;
    final lastModifiedTime = this.lastModifiedTime;
    return {
      if (apiDestinationArn != null) 'ApiDestinationArn': apiDestinationArn,
      if (apiDestinationState != null)
        'ApiDestinationState': apiDestinationState.value,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
    };
  }
}

/// @nodoc
class CreateArchiveResponse {
  /// The ARN of the archive that was created.
  final String? archiveArn;

  /// The time at which the archive was created.
  final DateTime? creationTime;

  /// The state of the archive that was created.
  final ArchiveState? state;

  /// The reason that the archive is in the state.
  final String? stateReason;

  CreateArchiveResponse({
    this.archiveArn,
    this.creationTime,
    this.state,
    this.stateReason,
  });

  factory CreateArchiveResponse.fromJson(Map<String, dynamic> json) {
    return CreateArchiveResponse(
      archiveArn: json['ArchiveArn'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      state: (json['State'] as String?)?.let(ArchiveState.fromString),
      stateReason: json['StateReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final archiveArn = this.archiveArn;
    final creationTime = this.creationTime;
    final state = this.state;
    final stateReason = this.stateReason;
    return {
      if (archiveArn != null) 'ArchiveArn': archiveArn,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (state != null) 'State': state.value,
      if (stateReason != null) 'StateReason': stateReason,
    };
  }
}

/// @nodoc
class CreateConnectionResponse {
  /// The ARN of the connection that was created by the request.
  final String? connectionArn;

  /// The state of the connection that was created by the request.
  final ConnectionState? connectionState;

  /// A time stamp for the time that the connection was created.
  final DateTime? creationTime;

  /// A time stamp for the time that the connection was last updated.
  final DateTime? lastModifiedTime;

  CreateConnectionResponse({
    this.connectionArn,
    this.connectionState,
    this.creationTime,
    this.lastModifiedTime,
  });

  factory CreateConnectionResponse.fromJson(Map<String, dynamic> json) {
    return CreateConnectionResponse(
      connectionArn: json['ConnectionArn'] as String?,
      connectionState:
          (json['ConnectionState'] as String?)?.let(ConnectionState.fromString),
      creationTime: timeStampFromJson(json['CreationTime']),
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final connectionArn = this.connectionArn;
    final connectionState = this.connectionState;
    final creationTime = this.creationTime;
    final lastModifiedTime = this.lastModifiedTime;
    return {
      if (connectionArn != null) 'ConnectionArn': connectionArn,
      if (connectionState != null) 'ConnectionState': connectionState.value,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
    };
  }
}

/// @nodoc
class CreateEndpointResponse {
  /// The ARN of the endpoint that was created by this request.
  final String? arn;

  /// The event buses used by this request.
  final List<EndpointEventBus>? eventBuses;

  /// The name of the endpoint that was created by this request.
  final String? name;

  /// Whether event replication was enabled or disabled by this request.
  final ReplicationConfig? replicationConfig;

  /// The ARN of the role used by event replication for this request.
  final String? roleArn;

  /// The routing configuration defined by this request.
  final RoutingConfig? routingConfig;

  /// The state of the endpoint that was created by this request.
  final EndpointState? state;

  CreateEndpointResponse({
    this.arn,
    this.eventBuses,
    this.name,
    this.replicationConfig,
    this.roleArn,
    this.routingConfig,
    this.state,
  });

  factory CreateEndpointResponse.fromJson(Map<String, dynamic> json) {
    return CreateEndpointResponse(
      arn: json['Arn'] as String?,
      eventBuses: (json['EventBuses'] as List?)
          ?.nonNulls
          .map((e) => EndpointEventBus.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['Name'] as String?,
      replicationConfig: json['ReplicationConfig'] != null
          ? ReplicationConfig.fromJson(
              json['ReplicationConfig'] as Map<String, dynamic>)
          : null,
      roleArn: json['RoleArn'] as String?,
      routingConfig: json['RoutingConfig'] != null
          ? RoutingConfig.fromJson(
              json['RoutingConfig'] as Map<String, dynamic>)
          : null,
      state: (json['State'] as String?)?.let(EndpointState.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final eventBuses = this.eventBuses;
    final name = this.name;
    final replicationConfig = this.replicationConfig;
    final roleArn = this.roleArn;
    final routingConfig = this.routingConfig;
    final state = this.state;
    return {
      if (arn != null) 'Arn': arn,
      if (eventBuses != null) 'EventBuses': eventBuses,
      if (name != null) 'Name': name,
      if (replicationConfig != null) 'ReplicationConfig': replicationConfig,
      if (roleArn != null) 'RoleArn': roleArn,
      if (routingConfig != null) 'RoutingConfig': routingConfig,
      if (state != null) 'State': state.value,
    };
  }
}

/// @nodoc
class CreateEventBusResponse {
  final DeadLetterConfig? deadLetterConfig;

  /// The event bus description.
  final String? description;

  /// The ARN of the new event bus.
  final String? eventBusArn;

  /// The identifier of the KMS customer managed key for EventBridge to use to
  /// encrypt events on this event bus, if one has been specified.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-encryption.html">Data
  /// encryption in EventBridge</a> in the <i>Amazon EventBridge User Guide</i>.
  final String? kmsKeyIdentifier;

  /// The logging configuration settings for the event bus.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eb-event-bus-logs.html">Configuring logs
  /// for event buses</a> in the <i>EventBridge User Guide</i>.
  final LogConfig? logConfig;

  CreateEventBusResponse({
    this.deadLetterConfig,
    this.description,
    this.eventBusArn,
    this.kmsKeyIdentifier,
    this.logConfig,
  });

  factory CreateEventBusResponse.fromJson(Map<String, dynamic> json) {
    return CreateEventBusResponse(
      deadLetterConfig: json['DeadLetterConfig'] != null
          ? DeadLetterConfig.fromJson(
              json['DeadLetterConfig'] as Map<String, dynamic>)
          : null,
      description: json['Description'] as String?,
      eventBusArn: json['EventBusArn'] as String?,
      kmsKeyIdentifier: json['KmsKeyIdentifier'] as String?,
      logConfig: json['LogConfig'] != null
          ? LogConfig.fromJson(json['LogConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final deadLetterConfig = this.deadLetterConfig;
    final description = this.description;
    final eventBusArn = this.eventBusArn;
    final kmsKeyIdentifier = this.kmsKeyIdentifier;
    final logConfig = this.logConfig;
    return {
      if (deadLetterConfig != null) 'DeadLetterConfig': deadLetterConfig,
      if (description != null) 'Description': description,
      if (eventBusArn != null) 'EventBusArn': eventBusArn,
      if (kmsKeyIdentifier != null) 'KmsKeyIdentifier': kmsKeyIdentifier,
      if (logConfig != null) 'LogConfig': logConfig,
    };
  }
}

/// @nodoc
class CreatePartnerEventSourceResponse {
  /// The ARN of the partner event source.
  final String? eventSourceArn;

  CreatePartnerEventSourceResponse({
    this.eventSourceArn,
  });

  factory CreatePartnerEventSourceResponse.fromJson(Map<String, dynamic> json) {
    return CreatePartnerEventSourceResponse(
      eventSourceArn: json['EventSourceArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventSourceArn = this.eventSourceArn;
    return {
      if (eventSourceArn != null) 'EventSourceArn': eventSourceArn,
    };
  }
}

/// @nodoc
class DeauthorizeConnectionResponse {
  /// The ARN of the connection that authorization was removed from.
  final String? connectionArn;

  /// The state of the connection.
  final ConnectionState? connectionState;

  /// A time stamp for the time that the connection was created.
  final DateTime? creationTime;

  /// A time stamp for the time that the connection was last authorized.
  final DateTime? lastAuthorizedTime;

  /// A time stamp for the time that the connection was last updated.
  final DateTime? lastModifiedTime;

  DeauthorizeConnectionResponse({
    this.connectionArn,
    this.connectionState,
    this.creationTime,
    this.lastAuthorizedTime,
    this.lastModifiedTime,
  });

  factory DeauthorizeConnectionResponse.fromJson(Map<String, dynamic> json) {
    return DeauthorizeConnectionResponse(
      connectionArn: json['ConnectionArn'] as String?,
      connectionState:
          (json['ConnectionState'] as String?)?.let(ConnectionState.fromString),
      creationTime: timeStampFromJson(json['CreationTime']),
      lastAuthorizedTime: timeStampFromJson(json['LastAuthorizedTime']),
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final connectionArn = this.connectionArn;
    final connectionState = this.connectionState;
    final creationTime = this.creationTime;
    final lastAuthorizedTime = this.lastAuthorizedTime;
    final lastModifiedTime = this.lastModifiedTime;
    return {
      if (connectionArn != null) 'ConnectionArn': connectionArn,
      if (connectionState != null) 'ConnectionState': connectionState.value,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (lastAuthorizedTime != null)
        'LastAuthorizedTime': unixTimestampToJson(lastAuthorizedTime),
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
    };
  }
}

/// @nodoc
class DeleteApiDestinationResponse {
  DeleteApiDestinationResponse();

  factory DeleteApiDestinationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteApiDestinationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class DeleteArchiveResponse {
  DeleteArchiveResponse();

  factory DeleteArchiveResponse.fromJson(Map<String, dynamic> _) {
    return DeleteArchiveResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class DeleteConnectionResponse {
  /// The ARN of the connection that was deleted.
  final String? connectionArn;

  /// The state of the connection before it was deleted.
  final ConnectionState? connectionState;

  /// A time stamp for the time that the connection was created.
  final DateTime? creationTime;

  /// A time stamp for the time that the connection was last authorized before it
  /// wa deleted.
  final DateTime? lastAuthorizedTime;

  /// A time stamp for the time that the connection was last modified before it
  /// was deleted.
  final DateTime? lastModifiedTime;

  DeleteConnectionResponse({
    this.connectionArn,
    this.connectionState,
    this.creationTime,
    this.lastAuthorizedTime,
    this.lastModifiedTime,
  });

  factory DeleteConnectionResponse.fromJson(Map<String, dynamic> json) {
    return DeleteConnectionResponse(
      connectionArn: json['ConnectionArn'] as String?,
      connectionState:
          (json['ConnectionState'] as String?)?.let(ConnectionState.fromString),
      creationTime: timeStampFromJson(json['CreationTime']),
      lastAuthorizedTime: timeStampFromJson(json['LastAuthorizedTime']),
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final connectionArn = this.connectionArn;
    final connectionState = this.connectionState;
    final creationTime = this.creationTime;
    final lastAuthorizedTime = this.lastAuthorizedTime;
    final lastModifiedTime = this.lastModifiedTime;
    return {
      if (connectionArn != null) 'ConnectionArn': connectionArn,
      if (connectionState != null) 'ConnectionState': connectionState.value,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (lastAuthorizedTime != null)
        'LastAuthorizedTime': unixTimestampToJson(lastAuthorizedTime),
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
    };
  }
}

/// @nodoc
class DeleteEndpointResponse {
  DeleteEndpointResponse();

  factory DeleteEndpointResponse.fromJson(Map<String, dynamic> _) {
    return DeleteEndpointResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class DescribeApiDestinationResponse {
  /// The ARN of the API destination retrieved.
  final String? apiDestinationArn;

  /// The state of the API destination retrieved.
  final ApiDestinationState? apiDestinationState;

  /// The ARN of the connection specified for the API destination retrieved.
  final String? connectionArn;

  /// A time stamp for the time that the API destination was created.
  final DateTime? creationTime;

  /// The description for the API destination retrieved.
  final String? description;

  /// The method to use to connect to the HTTP endpoint.
  final ApiDestinationHttpMethod? httpMethod;

  /// The URL to use to connect to the HTTP endpoint.
  final String? invocationEndpoint;

  /// The maximum number of invocations per second to specified for the API
  /// destination. Note that if you set the invocation rate maximum to a value
  /// lower the rate necessary to send all events received on to the destination
  /// HTTP endpoint, some events may not be delivered within the 24-hour retry
  /// window. If you plan to set the rate lower than the rate necessary to deliver
  /// all events, consider using a dead-letter queue to catch events that are not
  /// delivered within 24 hours.
  final int? invocationRateLimitPerSecond;

  /// A time stamp for the time that the API destination was last modified.
  final DateTime? lastModifiedTime;

  /// The name of the API destination retrieved.
  final String? name;

  DescribeApiDestinationResponse({
    this.apiDestinationArn,
    this.apiDestinationState,
    this.connectionArn,
    this.creationTime,
    this.description,
    this.httpMethod,
    this.invocationEndpoint,
    this.invocationRateLimitPerSecond,
    this.lastModifiedTime,
    this.name,
  });

  factory DescribeApiDestinationResponse.fromJson(Map<String, dynamic> json) {
    return DescribeApiDestinationResponse(
      apiDestinationArn: json['ApiDestinationArn'] as String?,
      apiDestinationState: (json['ApiDestinationState'] as String?)
          ?.let(ApiDestinationState.fromString),
      connectionArn: json['ConnectionArn'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      description: json['Description'] as String?,
      httpMethod: (json['HttpMethod'] as String?)
          ?.let(ApiDestinationHttpMethod.fromString),
      invocationEndpoint: json['InvocationEndpoint'] as String?,
      invocationRateLimitPerSecond:
          json['InvocationRateLimitPerSecond'] as int?,
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final apiDestinationArn = this.apiDestinationArn;
    final apiDestinationState = this.apiDestinationState;
    final connectionArn = this.connectionArn;
    final creationTime = this.creationTime;
    final description = this.description;
    final httpMethod = this.httpMethod;
    final invocationEndpoint = this.invocationEndpoint;
    final invocationRateLimitPerSecond = this.invocationRateLimitPerSecond;
    final lastModifiedTime = this.lastModifiedTime;
    final name = this.name;
    return {
      if (apiDestinationArn != null) 'ApiDestinationArn': apiDestinationArn,
      if (apiDestinationState != null)
        'ApiDestinationState': apiDestinationState.value,
      if (connectionArn != null) 'ConnectionArn': connectionArn,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (description != null) 'Description': description,
      if (httpMethod != null) 'HttpMethod': httpMethod.value,
      if (invocationEndpoint != null) 'InvocationEndpoint': invocationEndpoint,
      if (invocationRateLimitPerSecond != null)
        'InvocationRateLimitPerSecond': invocationRateLimitPerSecond,
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (name != null) 'Name': name,
    };
  }
}

/// @nodoc
class DescribeArchiveResponse {
  /// The ARN of the archive.
  final String? archiveArn;

  /// The name of the archive.
  final String? archiveName;

  /// The time at which the archive was created.
  final DateTime? creationTime;

  /// The description of the archive.
  final String? description;

  /// The number of events in the archive.
  final int? eventCount;

  /// The event pattern used to filter events sent to the archive.
  final String? eventPattern;

  /// The ARN of the event source associated with the archive.
  final String? eventSourceArn;

  /// The identifier of the KMS customer managed key for EventBridge to use to
  /// encrypt this archive, if one has been specified.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/encryption-archives.html">Encrypting
  /// archives</a> in the <i>Amazon EventBridge User Guide</i>.
  final String? kmsKeyIdentifier;

  /// The number of days to retain events for in the archive.
  final int? retentionDays;

  /// The size of the archive in bytes.
  final int? sizeBytes;

  /// The state of the archive.
  final ArchiveState? state;

  /// The reason that the archive is in the state.
  final String? stateReason;

  DescribeArchiveResponse({
    this.archiveArn,
    this.archiveName,
    this.creationTime,
    this.description,
    this.eventCount,
    this.eventPattern,
    this.eventSourceArn,
    this.kmsKeyIdentifier,
    this.retentionDays,
    this.sizeBytes,
    this.state,
    this.stateReason,
  });

  factory DescribeArchiveResponse.fromJson(Map<String, dynamic> json) {
    return DescribeArchiveResponse(
      archiveArn: json['ArchiveArn'] as String?,
      archiveName: json['ArchiveName'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      description: json['Description'] as String?,
      eventCount: json['EventCount'] as int?,
      eventPattern: json['EventPattern'] as String?,
      eventSourceArn: json['EventSourceArn'] as String?,
      kmsKeyIdentifier: json['KmsKeyIdentifier'] as String?,
      retentionDays: json['RetentionDays'] as int?,
      sizeBytes: json['SizeBytes'] as int?,
      state: (json['State'] as String?)?.let(ArchiveState.fromString),
      stateReason: json['StateReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final archiveArn = this.archiveArn;
    final archiveName = this.archiveName;
    final creationTime = this.creationTime;
    final description = this.description;
    final eventCount = this.eventCount;
    final eventPattern = this.eventPattern;
    final eventSourceArn = this.eventSourceArn;
    final kmsKeyIdentifier = this.kmsKeyIdentifier;
    final retentionDays = this.retentionDays;
    final sizeBytes = this.sizeBytes;
    final state = this.state;
    final stateReason = this.stateReason;
    return {
      if (archiveArn != null) 'ArchiveArn': archiveArn,
      if (archiveName != null) 'ArchiveName': archiveName,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (description != null) 'Description': description,
      if (eventCount != null) 'EventCount': eventCount,
      if (eventPattern != null) 'EventPattern': eventPattern,
      if (eventSourceArn != null) 'EventSourceArn': eventSourceArn,
      if (kmsKeyIdentifier != null) 'KmsKeyIdentifier': kmsKeyIdentifier,
      if (retentionDays != null) 'RetentionDays': retentionDays,
      if (sizeBytes != null) 'SizeBytes': sizeBytes,
      if (state != null) 'State': state.value,
      if (stateReason != null) 'StateReason': stateReason,
    };
  }
}

/// @nodoc
class DescribeConnectionResponse {
  /// The parameters to use for authorization for the connection.
  final ConnectionAuthResponseParameters? authParameters;

  /// The type of authorization specified for the connection.
  final ConnectionAuthorizationType? authorizationType;

  /// The ARN of the connection retrieved.
  final String? connectionArn;

  /// The state of the connection retrieved.
  final ConnectionState? connectionState;

  /// A time stamp for the time that the connection was created.
  final DateTime? creationTime;

  /// The description for the connection retrieved.
  final String? description;

  /// For connections to private APIs The parameters EventBridge uses to invoke
  /// the resource endpoint.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/connection-private.html">Connecting
  /// to private APIs</a> in the <i> <i>Amazon EventBridge User Guide</i> </i>.
  final DescribeConnectionConnectivityParameters?
      invocationConnectivityParameters;

  /// The identifier of the KMS customer managed key for EventBridge to use to
  /// encrypt the connection, if one has been specified.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/encryption-connections.html">Encrypting
  /// connections</a> in the <i>Amazon EventBridge User Guide</i>.
  final String? kmsKeyIdentifier;

  /// A time stamp for the time that the connection was last authorized.
  final DateTime? lastAuthorizedTime;

  /// A time stamp for the time that the connection was last modified.
  final DateTime? lastModifiedTime;

  /// The name of the connection retrieved.
  final String? name;

  /// The ARN of the secret created from the authorization parameters specified
  /// for the connection.
  final String? secretArn;

  /// The reason that the connection is in the current connection state.
  final String? stateReason;

  DescribeConnectionResponse({
    this.authParameters,
    this.authorizationType,
    this.connectionArn,
    this.connectionState,
    this.creationTime,
    this.description,
    this.invocationConnectivityParameters,
    this.kmsKeyIdentifier,
    this.lastAuthorizedTime,
    this.lastModifiedTime,
    this.name,
    this.secretArn,
    this.stateReason,
  });

  factory DescribeConnectionResponse.fromJson(Map<String, dynamic> json) {
    return DescribeConnectionResponse(
      authParameters: json['AuthParameters'] != null
          ? ConnectionAuthResponseParameters.fromJson(
              json['AuthParameters'] as Map<String, dynamic>)
          : null,
      authorizationType: (json['AuthorizationType'] as String?)
          ?.let(ConnectionAuthorizationType.fromString),
      connectionArn: json['ConnectionArn'] as String?,
      connectionState:
          (json['ConnectionState'] as String?)?.let(ConnectionState.fromString),
      creationTime: timeStampFromJson(json['CreationTime']),
      description: json['Description'] as String?,
      invocationConnectivityParameters:
          json['InvocationConnectivityParameters'] != null
              ? DescribeConnectionConnectivityParameters.fromJson(
                  json['InvocationConnectivityParameters']
                      as Map<String, dynamic>)
              : null,
      kmsKeyIdentifier: json['KmsKeyIdentifier'] as String?,
      lastAuthorizedTime: timeStampFromJson(json['LastAuthorizedTime']),
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      name: json['Name'] as String?,
      secretArn: json['SecretArn'] as String?,
      stateReason: json['StateReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final authParameters = this.authParameters;
    final authorizationType = this.authorizationType;
    final connectionArn = this.connectionArn;
    final connectionState = this.connectionState;
    final creationTime = this.creationTime;
    final description = this.description;
    final invocationConnectivityParameters =
        this.invocationConnectivityParameters;
    final kmsKeyIdentifier = this.kmsKeyIdentifier;
    final lastAuthorizedTime = this.lastAuthorizedTime;
    final lastModifiedTime = this.lastModifiedTime;
    final name = this.name;
    final secretArn = this.secretArn;
    final stateReason = this.stateReason;
    return {
      if (authParameters != null) 'AuthParameters': authParameters,
      if (authorizationType != null)
        'AuthorizationType': authorizationType.value,
      if (connectionArn != null) 'ConnectionArn': connectionArn,
      if (connectionState != null) 'ConnectionState': connectionState.value,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (description != null) 'Description': description,
      if (invocationConnectivityParameters != null)
        'InvocationConnectivityParameters': invocationConnectivityParameters,
      if (kmsKeyIdentifier != null) 'KmsKeyIdentifier': kmsKeyIdentifier,
      if (lastAuthorizedTime != null)
        'LastAuthorizedTime': unixTimestampToJson(lastAuthorizedTime),
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (name != null) 'Name': name,
      if (secretArn != null) 'SecretArn': secretArn,
      if (stateReason != null) 'StateReason': stateReason,
    };
  }
}

/// @nodoc
class DescribeEndpointResponse {
  /// The ARN of the endpoint you asked for information about.
  final String? arn;

  /// The time the endpoint you asked for information about was created.
  final DateTime? creationTime;

  /// The description of the endpoint you asked for information about.
  final String? description;

  /// The ID of the endpoint you asked for information about.
  final String? endpointId;

  /// The URL of the endpoint you asked for information about.
  final String? endpointUrl;

  /// The event buses being used by the endpoint you asked for information about.
  final List<EndpointEventBus>? eventBuses;

  /// The last time the endpoint you asked for information about was modified.
  final DateTime? lastModifiedTime;

  /// The name of the endpoint you asked for information about.
  final String? name;

  /// Whether replication is enabled or disabled for the endpoint you asked for
  /// information about.
  final ReplicationConfig? replicationConfig;

  /// The ARN of the role used by the endpoint you asked for information about.
  final String? roleArn;

  /// The routing configuration of the endpoint you asked for information about.
  final RoutingConfig? routingConfig;

  /// The current state of the endpoint you asked for information about.
  final EndpointState? state;

  /// The reason the endpoint you asked for information about is in its current
  /// state.
  final String? stateReason;

  DescribeEndpointResponse({
    this.arn,
    this.creationTime,
    this.description,
    this.endpointId,
    this.endpointUrl,
    this.eventBuses,
    this.lastModifiedTime,
    this.name,
    this.replicationConfig,
    this.roleArn,
    this.routingConfig,
    this.state,
    this.stateReason,
  });

  factory DescribeEndpointResponse.fromJson(Map<String, dynamic> json) {
    return DescribeEndpointResponse(
      arn: json['Arn'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      description: json['Description'] as String?,
      endpointId: json['EndpointId'] as String?,
      endpointUrl: json['EndpointUrl'] as String?,
      eventBuses: (json['EventBuses'] as List?)
          ?.nonNulls
          .map((e) => EndpointEventBus.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      name: json['Name'] as String?,
      replicationConfig: json['ReplicationConfig'] != null
          ? ReplicationConfig.fromJson(
              json['ReplicationConfig'] as Map<String, dynamic>)
          : null,
      roleArn: json['RoleArn'] as String?,
      routingConfig: json['RoutingConfig'] != null
          ? RoutingConfig.fromJson(
              json['RoutingConfig'] as Map<String, dynamic>)
          : null,
      state: (json['State'] as String?)?.let(EndpointState.fromString),
      stateReason: json['StateReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final description = this.description;
    final endpointId = this.endpointId;
    final endpointUrl = this.endpointUrl;
    final eventBuses = this.eventBuses;
    final lastModifiedTime = this.lastModifiedTime;
    final name = this.name;
    final replicationConfig = this.replicationConfig;
    final roleArn = this.roleArn;
    final routingConfig = this.routingConfig;
    final state = this.state;
    final stateReason = this.stateReason;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (description != null) 'Description': description,
      if (endpointId != null) 'EndpointId': endpointId,
      if (endpointUrl != null) 'EndpointUrl': endpointUrl,
      if (eventBuses != null) 'EventBuses': eventBuses,
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (name != null) 'Name': name,
      if (replicationConfig != null) 'ReplicationConfig': replicationConfig,
      if (roleArn != null) 'RoleArn': roleArn,
      if (routingConfig != null) 'RoutingConfig': routingConfig,
      if (state != null) 'State': state.value,
      if (stateReason != null) 'StateReason': stateReason,
    };
  }
}

/// @nodoc
class DescribeEventBusResponse {
  /// The Amazon Resource Name (ARN) of the account permitted to write events to
  /// the current account.
  final String? arn;

  /// The time the event bus was created.
  final DateTime? creationTime;
  final DeadLetterConfig? deadLetterConfig;

  /// The event bus description.
  final String? description;

  /// The identifier of the KMS customer managed key for EventBridge to use to
  /// encrypt events on this event bus, if one has been specified.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-encryption.html">Data
  /// encryption in EventBridge</a> in the <i>Amazon EventBridge User Guide</i>.
  final String? kmsKeyIdentifier;

  /// The time the event bus was last modified.
  final DateTime? lastModifiedTime;

  /// The logging configuration settings for the event bus.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eb-event-bus-logs.html">Configuring logs
  /// for event buses</a> in the <i>EventBridge User Guide</i>.
  final LogConfig? logConfig;

  /// The name of the event bus. Currently, this is always <code>default</code>.
  final String? name;

  /// The policy that enables the external account to send events to your account.
  final String? policy;

  DescribeEventBusResponse({
    this.arn,
    this.creationTime,
    this.deadLetterConfig,
    this.description,
    this.kmsKeyIdentifier,
    this.lastModifiedTime,
    this.logConfig,
    this.name,
    this.policy,
  });

  factory DescribeEventBusResponse.fromJson(Map<String, dynamic> json) {
    return DescribeEventBusResponse(
      arn: json['Arn'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      deadLetterConfig: json['DeadLetterConfig'] != null
          ? DeadLetterConfig.fromJson(
              json['DeadLetterConfig'] as Map<String, dynamic>)
          : null,
      description: json['Description'] as String?,
      kmsKeyIdentifier: json['KmsKeyIdentifier'] as String?,
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      logConfig: json['LogConfig'] != null
          ? LogConfig.fromJson(json['LogConfig'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      policy: json['Policy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final deadLetterConfig = this.deadLetterConfig;
    final description = this.description;
    final kmsKeyIdentifier = this.kmsKeyIdentifier;
    final lastModifiedTime = this.lastModifiedTime;
    final logConfig = this.logConfig;
    final name = this.name;
    final policy = this.policy;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (deadLetterConfig != null) 'DeadLetterConfig': deadLetterConfig,
      if (description != null) 'Description': description,
      if (kmsKeyIdentifier != null) 'KmsKeyIdentifier': kmsKeyIdentifier,
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (logConfig != null) 'LogConfig': logConfig,
      if (name != null) 'Name': name,
      if (policy != null) 'Policy': policy,
    };
  }
}

/// @nodoc
class DescribeEventSourceResponse {
  /// The ARN of the partner event source.
  final String? arn;

  /// The name of the SaaS partner that created the event source.
  final String? createdBy;

  /// The date and time that the event source was created.
  final DateTime? creationTime;

  /// The date and time that the event source will expire if you do not create a
  /// matching event bus.
  final DateTime? expirationTime;

  /// The name of the partner event source.
  final String? name;

  /// The state of the event source. If it is ACTIVE, you have already created a
  /// matching event bus for this event source, and that event bus is active. If
  /// it is PENDING, either you haven't yet created a matching event bus, or that
  /// event bus is deactivated. If it is DELETED, you have created a matching
  /// event bus, but the event source has since been deleted.
  final EventSourceState? state;

  DescribeEventSourceResponse({
    this.arn,
    this.createdBy,
    this.creationTime,
    this.expirationTime,
    this.name,
    this.state,
  });

  factory DescribeEventSourceResponse.fromJson(Map<String, dynamic> json) {
    return DescribeEventSourceResponse(
      arn: json['Arn'] as String?,
      createdBy: json['CreatedBy'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      expirationTime: timeStampFromJson(json['ExpirationTime']),
      name: json['Name'] as String?,
      state: (json['State'] as String?)?.let(EventSourceState.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdBy = this.createdBy;
    final creationTime = this.creationTime;
    final expirationTime = this.expirationTime;
    final name = this.name;
    final state = this.state;
    return {
      if (arn != null) 'Arn': arn,
      if (createdBy != null) 'CreatedBy': createdBy,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (expirationTime != null)
        'ExpirationTime': unixTimestampToJson(expirationTime),
      if (name != null) 'Name': name,
      if (state != null) 'State': state.value,
    };
  }
}

/// @nodoc
class DescribePartnerEventSourceResponse {
  /// The ARN of the event source.
  final String? arn;

  /// The name of the event source.
  final String? name;

  DescribePartnerEventSourceResponse({
    this.arn,
    this.name,
  });

  factory DescribePartnerEventSourceResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribePartnerEventSourceResponse(
      arn: json['Arn'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    return {
      if (arn != null) 'Arn': arn,
      if (name != null) 'Name': name,
    };
  }
}

/// @nodoc
class DescribeReplayResponse {
  /// The description of the replay.
  final String? description;

  /// A <code>ReplayDestination</code> object that contains details about the
  /// replay.
  final ReplayDestination? destination;

  /// The time stamp for the last event that was replayed from the archive.
  final DateTime? eventEndTime;

  /// The time that the event was last replayed.
  final DateTime? eventLastReplayedTime;

  /// The ARN of the archive events were replayed from.
  final String? eventSourceArn;

  /// The time stamp of the first event that was last replayed from the archive.
  final DateTime? eventStartTime;

  /// The ARN of the replay.
  final String? replayArn;

  /// A time stamp for the time that the replay stopped.
  final DateTime? replayEndTime;

  /// The name of the replay.
  final String? replayName;

  /// A time stamp for the time that the replay started.
  final DateTime? replayStartTime;

  /// The current state of the replay.
  final ReplayState? state;

  /// The reason that the replay is in the current state.
  final String? stateReason;

  DescribeReplayResponse({
    this.description,
    this.destination,
    this.eventEndTime,
    this.eventLastReplayedTime,
    this.eventSourceArn,
    this.eventStartTime,
    this.replayArn,
    this.replayEndTime,
    this.replayName,
    this.replayStartTime,
    this.state,
    this.stateReason,
  });

  factory DescribeReplayResponse.fromJson(Map<String, dynamic> json) {
    return DescribeReplayResponse(
      description: json['Description'] as String?,
      destination: json['Destination'] != null
          ? ReplayDestination.fromJson(
              json['Destination'] as Map<String, dynamic>)
          : null,
      eventEndTime: timeStampFromJson(json['EventEndTime']),
      eventLastReplayedTime: timeStampFromJson(json['EventLastReplayedTime']),
      eventSourceArn: json['EventSourceArn'] as String?,
      eventStartTime: timeStampFromJson(json['EventStartTime']),
      replayArn: json['ReplayArn'] as String?,
      replayEndTime: timeStampFromJson(json['ReplayEndTime']),
      replayName: json['ReplayName'] as String?,
      replayStartTime: timeStampFromJson(json['ReplayStartTime']),
      state: (json['State'] as String?)?.let(ReplayState.fromString),
      stateReason: json['StateReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final destination = this.destination;
    final eventEndTime = this.eventEndTime;
    final eventLastReplayedTime = this.eventLastReplayedTime;
    final eventSourceArn = this.eventSourceArn;
    final eventStartTime = this.eventStartTime;
    final replayArn = this.replayArn;
    final replayEndTime = this.replayEndTime;
    final replayName = this.replayName;
    final replayStartTime = this.replayStartTime;
    final state = this.state;
    final stateReason = this.stateReason;
    return {
      if (description != null) 'Description': description,
      if (destination != null) 'Destination': destination,
      if (eventEndTime != null)
        'EventEndTime': unixTimestampToJson(eventEndTime),
      if (eventLastReplayedTime != null)
        'EventLastReplayedTime': unixTimestampToJson(eventLastReplayedTime),
      if (eventSourceArn != null) 'EventSourceArn': eventSourceArn,
      if (eventStartTime != null)
        'EventStartTime': unixTimestampToJson(eventStartTime),
      if (replayArn != null) 'ReplayArn': replayArn,
      if (replayEndTime != null)
        'ReplayEndTime': unixTimestampToJson(replayEndTime),
      if (replayName != null) 'ReplayName': replayName,
      if (replayStartTime != null)
        'ReplayStartTime': unixTimestampToJson(replayStartTime),
      if (state != null) 'State': state.value,
      if (stateReason != null) 'StateReason': stateReason,
    };
  }
}

/// @nodoc
class DescribeRuleResponse {
  /// The Amazon Resource Name (ARN) of the rule.
  final String? arn;

  /// The account ID of the user that created the rule. If you use
  /// <code>PutRule</code> to put a rule on an event bus in another account, the
  /// other account is the owner of the rule, and the rule ARN includes the
  /// account ID for that account. However, the value for <code>CreatedBy</code>
  /// is the account ID as the account that created the rule in the other account.
  final String? createdBy;

  /// The description of the rule.
  final String? description;

  /// The name of the event bus associated with the rule.
  final String? eventBusName;

  /// The event pattern. For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-and-event-patterns.html">Events
  /// and Event Patterns</a> in the <i> <i>Amazon EventBridge User Guide</i> </i>.
  final String? eventPattern;

  /// If this is a managed rule, created by an Amazon Web Services service on your
  /// behalf, this field displays the principal name of the Amazon Web Services
  /// service that created the rule.
  final String? managedBy;

  /// The name of the rule.
  final String? name;

  /// The Amazon Resource Name (ARN) of the IAM role associated with the rule.
  final String? roleArn;

  /// The scheduling expression. For example, "cron(0 20 * * ? *)", "rate(5
  /// minutes)".
  final String? scheduleExpression;

  /// Specifies whether the rule is enabled or disabled.
  final RuleState? state;

  DescribeRuleResponse({
    this.arn,
    this.createdBy,
    this.description,
    this.eventBusName,
    this.eventPattern,
    this.managedBy,
    this.name,
    this.roleArn,
    this.scheduleExpression,
    this.state,
  });

  factory DescribeRuleResponse.fromJson(Map<String, dynamic> json) {
    return DescribeRuleResponse(
      arn: json['Arn'] as String?,
      createdBy: json['CreatedBy'] as String?,
      description: json['Description'] as String?,
      eventBusName: json['EventBusName'] as String?,
      eventPattern: json['EventPattern'] as String?,
      managedBy: json['ManagedBy'] as String?,
      name: json['Name'] as String?,
      roleArn: json['RoleArn'] as String?,
      scheduleExpression: json['ScheduleExpression'] as String?,
      state: (json['State'] as String?)?.let(RuleState.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdBy = this.createdBy;
    final description = this.description;
    final eventBusName = this.eventBusName;
    final eventPattern = this.eventPattern;
    final managedBy = this.managedBy;
    final name = this.name;
    final roleArn = this.roleArn;
    final scheduleExpression = this.scheduleExpression;
    final state = this.state;
    return {
      if (arn != null) 'Arn': arn,
      if (createdBy != null) 'CreatedBy': createdBy,
      if (description != null) 'Description': description,
      if (eventBusName != null) 'EventBusName': eventBusName,
      if (eventPattern != null) 'EventPattern': eventPattern,
      if (managedBy != null) 'ManagedBy': managedBy,
      if (name != null) 'Name': name,
      if (roleArn != null) 'RoleArn': roleArn,
      if (scheduleExpression != null) 'ScheduleExpression': scheduleExpression,
      if (state != null) 'State': state.value,
    };
  }
}

/// @nodoc
class ListApiDestinationsResponse {
  /// An array that includes information about each API destination.
  final List<ApiDestination>? apiDestinations;

  /// A token indicating there are more results available. If there are no more
  /// results, no token is included in the response.
  ///
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. To retrieve the next page of results, make the call again using the
  /// returned token. Keep all other arguments unchanged.
  ///
  /// Using an expired pagination token results in an <code>HTTP 400
  /// InvalidToken</code> error.
  final String? nextToken;

  ListApiDestinationsResponse({
    this.apiDestinations,
    this.nextToken,
  });

  factory ListApiDestinationsResponse.fromJson(Map<String, dynamic> json) {
    return ListApiDestinationsResponse(
      apiDestinations: (json['ApiDestinations'] as List?)
          ?.nonNulls
          .map((e) => ApiDestination.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final apiDestinations = this.apiDestinations;
    final nextToken = this.nextToken;
    return {
      if (apiDestinations != null) 'ApiDestinations': apiDestinations,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class ListArchivesResponse {
  /// An array of <code>Archive</code> objects that include details about an
  /// archive.
  final List<Archive>? archives;

  /// A token indicating there are more results available. If there are no more
  /// results, no token is included in the response.
  ///
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. To retrieve the next page of results, make the call again using the
  /// returned token. Keep all other arguments unchanged.
  ///
  /// Using an expired pagination token results in an <code>HTTP 400
  /// InvalidToken</code> error.
  final String? nextToken;

  ListArchivesResponse({
    this.archives,
    this.nextToken,
  });

  factory ListArchivesResponse.fromJson(Map<String, dynamic> json) {
    return ListArchivesResponse(
      archives: (json['Archives'] as List?)
          ?.nonNulls
          .map((e) => Archive.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final archives = this.archives;
    final nextToken = this.nextToken;
    return {
      if (archives != null) 'Archives': archives,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class ListConnectionsResponse {
  /// An array of connections objects that include details about the connections.
  final List<Connection>? connections;

  /// A token indicating there are more results available. If there are no more
  /// results, no token is included in the response.
  ///
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. To retrieve the next page of results, make the call again using the
  /// returned token. Keep all other arguments unchanged.
  ///
  /// Using an expired pagination token results in an <code>HTTP 400
  /// InvalidToken</code> error.
  final String? nextToken;

  ListConnectionsResponse({
    this.connections,
    this.nextToken,
  });

  factory ListConnectionsResponse.fromJson(Map<String, dynamic> json) {
    return ListConnectionsResponse(
      connections: (json['Connections'] as List?)
          ?.nonNulls
          .map((e) => Connection.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connections = this.connections;
    final nextToken = this.nextToken;
    return {
      if (connections != null) 'Connections': connections,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class ListEndpointsResponse {
  /// The endpoints returned by the call.
  final List<Endpoint>? endpoints;

  /// A token indicating there are more results available. If there are no more
  /// results, no token is included in the response.
  ///
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. To retrieve the next page of results, make the call again using the
  /// returned token. Keep all other arguments unchanged.
  ///
  /// Using an expired pagination token results in an <code>HTTP 400
  /// InvalidToken</code> error.
  final String? nextToken;

  ListEndpointsResponse({
    this.endpoints,
    this.nextToken,
  });

  factory ListEndpointsResponse.fromJson(Map<String, dynamic> json) {
    return ListEndpointsResponse(
      endpoints: (json['Endpoints'] as List?)
          ?.nonNulls
          .map((e) => Endpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endpoints = this.endpoints;
    final nextToken = this.nextToken;
    return {
      if (endpoints != null) 'Endpoints': endpoints,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class ListEventBusesResponse {
  /// This list of event buses.
  final List<EventBus>? eventBuses;

  /// A token indicating there are more results available. If there are no more
  /// results, no token is included in the response.
  ///
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. To retrieve the next page of results, make the call again using the
  /// returned token. Keep all other arguments unchanged.
  ///
  /// Using an expired pagination token results in an <code>HTTP 400
  /// InvalidToken</code> error.
  final String? nextToken;

  ListEventBusesResponse({
    this.eventBuses,
    this.nextToken,
  });

  factory ListEventBusesResponse.fromJson(Map<String, dynamic> json) {
    return ListEventBusesResponse(
      eventBuses: (json['EventBuses'] as List?)
          ?.nonNulls
          .map((e) => EventBus.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventBuses = this.eventBuses;
    final nextToken = this.nextToken;
    return {
      if (eventBuses != null) 'EventBuses': eventBuses,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class ListEventSourcesResponse {
  /// The list of event sources.
  final List<EventSource>? eventSources;

  /// A token indicating there are more results available. If there are no more
  /// results, no token is included in the response.
  ///
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. To retrieve the next page of results, make the call again using the
  /// returned token. Keep all other arguments unchanged.
  ///
  /// Using an expired pagination token results in an <code>HTTP 400
  /// InvalidToken</code> error.
  final String? nextToken;

  ListEventSourcesResponse({
    this.eventSources,
    this.nextToken,
  });

  factory ListEventSourcesResponse.fromJson(Map<String, dynamic> json) {
    return ListEventSourcesResponse(
      eventSources: (json['EventSources'] as List?)
          ?.nonNulls
          .map((e) => EventSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventSources = this.eventSources;
    final nextToken = this.nextToken;
    return {
      if (eventSources != null) 'EventSources': eventSources,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class ListPartnerEventSourceAccountsResponse {
  /// A token indicating there are more results available. If there are no more
  /// results, no token is included in the response.
  ///
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. To retrieve the next page of results, make the call again using the
  /// returned token. Keep all other arguments unchanged.
  ///
  /// Using an expired pagination token results in an <code>HTTP 400
  /// InvalidToken</code> error.
  final String? nextToken;

  /// The list of partner event sources returned by the operation.
  final List<PartnerEventSourceAccount>? partnerEventSourceAccounts;

  ListPartnerEventSourceAccountsResponse({
    this.nextToken,
    this.partnerEventSourceAccounts,
  });

  factory ListPartnerEventSourceAccountsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListPartnerEventSourceAccountsResponse(
      nextToken: json['NextToken'] as String?,
      partnerEventSourceAccounts: (json['PartnerEventSourceAccounts'] as List?)
          ?.nonNulls
          .map((e) =>
              PartnerEventSourceAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final partnerEventSourceAccounts = this.partnerEventSourceAccounts;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (partnerEventSourceAccounts != null)
        'PartnerEventSourceAccounts': partnerEventSourceAccounts,
    };
  }
}

/// @nodoc
class ListPartnerEventSourcesResponse {
  /// A token indicating there are more results available. If there are no more
  /// results, no token is included in the response.
  ///
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. To retrieve the next page of results, make the call again using the
  /// returned token. Keep all other arguments unchanged.
  ///
  /// Using an expired pagination token results in an <code>HTTP 400
  /// InvalidToken</code> error.
  final String? nextToken;

  /// The list of partner event sources returned by the operation.
  final List<PartnerEventSource>? partnerEventSources;

  ListPartnerEventSourcesResponse({
    this.nextToken,
    this.partnerEventSources,
  });

  factory ListPartnerEventSourcesResponse.fromJson(Map<String, dynamic> json) {
    return ListPartnerEventSourcesResponse(
      nextToken: json['NextToken'] as String?,
      partnerEventSources: (json['PartnerEventSources'] as List?)
          ?.nonNulls
          .map((e) => PartnerEventSource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final partnerEventSources = this.partnerEventSources;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (partnerEventSources != null)
        'PartnerEventSources': partnerEventSources,
    };
  }
}

/// @nodoc
class ListReplaysResponse {
  /// A token indicating there are more results available. If there are no more
  /// results, no token is included in the response.
  ///
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. To retrieve the next page of results, make the call again using the
  /// returned token. Keep all other arguments unchanged.
  ///
  /// Using an expired pagination token results in an <code>HTTP 400
  /// InvalidToken</code> error.
  final String? nextToken;

  /// An array of <code>Replay</code> objects that contain information about the
  /// replay.
  final List<Replay>? replays;

  ListReplaysResponse({
    this.nextToken,
    this.replays,
  });

  factory ListReplaysResponse.fromJson(Map<String, dynamic> json) {
    return ListReplaysResponse(
      nextToken: json['NextToken'] as String?,
      replays: (json['Replays'] as List?)
          ?.nonNulls
          .map((e) => Replay.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final replays = this.replays;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (replays != null) 'Replays': replays,
    };
  }
}

/// @nodoc
class ListRuleNamesByTargetResponse {
  /// A token indicating there are more results available. If there are no more
  /// results, no token is included in the response.
  ///
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. To retrieve the next page of results, make the call again using the
  /// returned token. Keep all other arguments unchanged.
  ///
  /// Using an expired pagination token results in an <code>HTTP 400
  /// InvalidToken</code> error.
  final String? nextToken;

  /// The names of the rules that can invoke the given target.
  final List<String>? ruleNames;

  ListRuleNamesByTargetResponse({
    this.nextToken,
    this.ruleNames,
  });

  factory ListRuleNamesByTargetResponse.fromJson(Map<String, dynamic> json) {
    return ListRuleNamesByTargetResponse(
      nextToken: json['NextToken'] as String?,
      ruleNames: (json['RuleNames'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final ruleNames = this.ruleNames;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (ruleNames != null) 'RuleNames': ruleNames,
    };
  }
}

/// @nodoc
class ListRulesResponse {
  /// A token indicating there are more results available. If there are no more
  /// results, no token is included in the response.
  ///
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. To retrieve the next page of results, make the call again using the
  /// returned token. Keep all other arguments unchanged.
  ///
  /// Using an expired pagination token results in an <code>HTTP 400
  /// InvalidToken</code> error.
  final String? nextToken;

  /// The rules that match the specified criteria.
  final List<Rule>? rules;

  ListRulesResponse({
    this.nextToken,
    this.rules,
  });

  factory ListRulesResponse.fromJson(Map<String, dynamic> json) {
    return ListRulesResponse(
      nextToken: json['NextToken'] as String?,
      rules: (json['Rules'] as List?)
          ?.nonNulls
          .map((e) => Rule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final rules = this.rules;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (rules != null) 'Rules': rules,
    };
  }
}

/// @nodoc
class ListTagsForResourceResponse {
  /// The list of tag keys and values associated with the resource you specified
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['Tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

/// @nodoc
class ListTargetsByRuleResponse {
  /// A token indicating there are more results available. If there are no more
  /// results, no token is included in the response.
  ///
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. To retrieve the next page of results, make the call again using the
  /// returned token. Keep all other arguments unchanged.
  ///
  /// Using an expired pagination token results in an <code>HTTP 400
  /// InvalidToken</code> error.
  final String? nextToken;

  /// The targets assigned to the rule.
  final List<Target>? targets;

  ListTargetsByRuleResponse({
    this.nextToken,
    this.targets,
  });

  factory ListTargetsByRuleResponse.fromJson(Map<String, dynamic> json) {
    return ListTargetsByRuleResponse(
      nextToken: json['NextToken'] as String?,
      targets: (json['Targets'] as List?)
          ?.nonNulls
          .map((e) => Target.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final targets = this.targets;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (targets != null) 'Targets': targets,
    };
  }
}

/// @nodoc
class PutEventsResponse {
  /// The successfully and unsuccessfully ingested events results. If the
  /// ingestion was successful, the entry has the event ID in it. Otherwise, you
  /// can use the error code and error message to identify the problem with the
  /// entry.
  ///
  /// For each record, the index of the response element is the same as the index
  /// in the request array.
  final List<PutEventsResultEntry>? entries;

  /// The number of failed entries.
  final int? failedEntryCount;

  PutEventsResponse({
    this.entries,
    this.failedEntryCount,
  });

  factory PutEventsResponse.fromJson(Map<String, dynamic> json) {
    return PutEventsResponse(
      entries: (json['Entries'] as List?)
          ?.nonNulls
          .map((e) => PutEventsResultEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      failedEntryCount: json['FailedEntryCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final entries = this.entries;
    final failedEntryCount = this.failedEntryCount;
    return {
      if (entries != null) 'Entries': entries,
      if (failedEntryCount != null) 'FailedEntryCount': failedEntryCount,
    };
  }
}

/// @nodoc
class PutPartnerEventsResponse {
  /// The results for each event entry the partner submitted in this request. If
  /// the event was successfully submitted, the entry has the event ID in it.
  /// Otherwise, you can use the error code and error message to identify the
  /// problem with the entry.
  ///
  /// For each record, the index of the response element is the same as the index
  /// in the request array.
  final List<PutPartnerEventsResultEntry>? entries;

  /// The number of events from this operation that could not be written to the
  /// partner event bus.
  final int? failedEntryCount;

  PutPartnerEventsResponse({
    this.entries,
    this.failedEntryCount,
  });

  factory PutPartnerEventsResponse.fromJson(Map<String, dynamic> json) {
    return PutPartnerEventsResponse(
      entries: (json['Entries'] as List?)
          ?.nonNulls
          .map((e) =>
              PutPartnerEventsResultEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      failedEntryCount: json['FailedEntryCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final entries = this.entries;
    final failedEntryCount = this.failedEntryCount;
    return {
      if (entries != null) 'Entries': entries,
      if (failedEntryCount != null) 'FailedEntryCount': failedEntryCount,
    };
  }
}

/// @nodoc
class PutRuleResponse {
  /// The Amazon Resource Name (ARN) of the rule.
  final String? ruleArn;

  PutRuleResponse({
    this.ruleArn,
  });

  factory PutRuleResponse.fromJson(Map<String, dynamic> json) {
    return PutRuleResponse(
      ruleArn: json['RuleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ruleArn = this.ruleArn;
    return {
      if (ruleArn != null) 'RuleArn': ruleArn,
    };
  }
}

/// @nodoc
class PutTargetsResponse {
  /// The failed target entries.
  final List<PutTargetsResultEntry>? failedEntries;

  /// The number of failed entries.
  final int? failedEntryCount;

  PutTargetsResponse({
    this.failedEntries,
    this.failedEntryCount,
  });

  factory PutTargetsResponse.fromJson(Map<String, dynamic> json) {
    return PutTargetsResponse(
      failedEntries: (json['FailedEntries'] as List?)
          ?.nonNulls
          .map((e) => PutTargetsResultEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      failedEntryCount: json['FailedEntryCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final failedEntries = this.failedEntries;
    final failedEntryCount = this.failedEntryCount;
    return {
      if (failedEntries != null) 'FailedEntries': failedEntries,
      if (failedEntryCount != null) 'FailedEntryCount': failedEntryCount,
    };
  }
}

/// @nodoc
class RemoveTargetsResponse {
  /// The failed target entries.
  final List<RemoveTargetsResultEntry>? failedEntries;

  /// The number of failed entries.
  final int? failedEntryCount;

  RemoveTargetsResponse({
    this.failedEntries,
    this.failedEntryCount,
  });

  factory RemoveTargetsResponse.fromJson(Map<String, dynamic> json) {
    return RemoveTargetsResponse(
      failedEntries: (json['FailedEntries'] as List?)
          ?.nonNulls
          .map((e) =>
              RemoveTargetsResultEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      failedEntryCount: json['FailedEntryCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final failedEntries = this.failedEntries;
    final failedEntryCount = this.failedEntryCount;
    return {
      if (failedEntries != null) 'FailedEntries': failedEntries,
      if (failedEntryCount != null) 'FailedEntryCount': failedEntryCount,
    };
  }
}

/// @nodoc
class StartReplayResponse {
  /// The ARN of the replay.
  final String? replayArn;

  /// The time at which the replay started.
  final DateTime? replayStartTime;

  /// The state of the replay.
  final ReplayState? state;

  /// The reason that the replay is in the state.
  final String? stateReason;

  StartReplayResponse({
    this.replayArn,
    this.replayStartTime,
    this.state,
    this.stateReason,
  });

  factory StartReplayResponse.fromJson(Map<String, dynamic> json) {
    return StartReplayResponse(
      replayArn: json['ReplayArn'] as String?,
      replayStartTime: timeStampFromJson(json['ReplayStartTime']),
      state: (json['State'] as String?)?.let(ReplayState.fromString),
      stateReason: json['StateReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final replayArn = this.replayArn;
    final replayStartTime = this.replayStartTime;
    final state = this.state;
    final stateReason = this.stateReason;
    return {
      if (replayArn != null) 'ReplayArn': replayArn,
      if (replayStartTime != null)
        'ReplayStartTime': unixTimestampToJson(replayStartTime),
      if (state != null) 'State': state.value,
      if (stateReason != null) 'StateReason': stateReason,
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
class TestEventPatternResponse {
  /// Indicates whether the event matches the event pattern.
  final bool? result;

  TestEventPatternResponse({
    this.result,
  });

  factory TestEventPatternResponse.fromJson(Map<String, dynamic> json) {
    return TestEventPatternResponse(
      result: json['Result'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final result = this.result;
    return {
      if (result != null) 'Result': result,
    };
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
class UpdateApiDestinationResponse {
  /// The ARN of the API destination that was updated.
  final String? apiDestinationArn;

  /// The state of the API destination that was updated.
  final ApiDestinationState? apiDestinationState;

  /// A time stamp for the time that the API destination was created.
  final DateTime? creationTime;

  /// A time stamp for the time that the API destination was last modified.
  final DateTime? lastModifiedTime;

  UpdateApiDestinationResponse({
    this.apiDestinationArn,
    this.apiDestinationState,
    this.creationTime,
    this.lastModifiedTime,
  });

  factory UpdateApiDestinationResponse.fromJson(Map<String, dynamic> json) {
    return UpdateApiDestinationResponse(
      apiDestinationArn: json['ApiDestinationArn'] as String?,
      apiDestinationState: (json['ApiDestinationState'] as String?)
          ?.let(ApiDestinationState.fromString),
      creationTime: timeStampFromJson(json['CreationTime']),
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final apiDestinationArn = this.apiDestinationArn;
    final apiDestinationState = this.apiDestinationState;
    final creationTime = this.creationTime;
    final lastModifiedTime = this.lastModifiedTime;
    return {
      if (apiDestinationArn != null) 'ApiDestinationArn': apiDestinationArn,
      if (apiDestinationState != null)
        'ApiDestinationState': apiDestinationState.value,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
    };
  }
}

/// @nodoc
class UpdateArchiveResponse {
  /// The ARN of the archive.
  final String? archiveArn;

  /// The time at which the archive was updated.
  final DateTime? creationTime;

  /// The state of the archive.
  final ArchiveState? state;

  /// The reason that the archive is in the current state.
  final String? stateReason;

  UpdateArchiveResponse({
    this.archiveArn,
    this.creationTime,
    this.state,
    this.stateReason,
  });

  factory UpdateArchiveResponse.fromJson(Map<String, dynamic> json) {
    return UpdateArchiveResponse(
      archiveArn: json['ArchiveArn'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      state: (json['State'] as String?)?.let(ArchiveState.fromString),
      stateReason: json['StateReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final archiveArn = this.archiveArn;
    final creationTime = this.creationTime;
    final state = this.state;
    final stateReason = this.stateReason;
    return {
      if (archiveArn != null) 'ArchiveArn': archiveArn,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (state != null) 'State': state.value,
      if (stateReason != null) 'StateReason': stateReason,
    };
  }
}

/// @nodoc
class UpdateConnectionResponse {
  /// The ARN of the connection that was updated.
  final String? connectionArn;

  /// The state of the connection that was updated.
  final ConnectionState? connectionState;

  /// A time stamp for the time that the connection was created.
  final DateTime? creationTime;

  /// A time stamp for the time that the connection was last authorized.
  final DateTime? lastAuthorizedTime;

  /// A time stamp for the time that the connection was last modified.
  final DateTime? lastModifiedTime;

  UpdateConnectionResponse({
    this.connectionArn,
    this.connectionState,
    this.creationTime,
    this.lastAuthorizedTime,
    this.lastModifiedTime,
  });

  factory UpdateConnectionResponse.fromJson(Map<String, dynamic> json) {
    return UpdateConnectionResponse(
      connectionArn: json['ConnectionArn'] as String?,
      connectionState:
          (json['ConnectionState'] as String?)?.let(ConnectionState.fromString),
      creationTime: timeStampFromJson(json['CreationTime']),
      lastAuthorizedTime: timeStampFromJson(json['LastAuthorizedTime']),
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final connectionArn = this.connectionArn;
    final connectionState = this.connectionState;
    final creationTime = this.creationTime;
    final lastAuthorizedTime = this.lastAuthorizedTime;
    final lastModifiedTime = this.lastModifiedTime;
    return {
      if (connectionArn != null) 'ConnectionArn': connectionArn,
      if (connectionState != null) 'ConnectionState': connectionState.value,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (lastAuthorizedTime != null)
        'LastAuthorizedTime': unixTimestampToJson(lastAuthorizedTime),
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
    };
  }
}

/// @nodoc
class UpdateEndpointResponse {
  /// The ARN of the endpoint you updated in this request.
  final String? arn;

  /// The ID of the endpoint you updated in this request.
  final String? endpointId;

  /// The URL of the endpoint you updated in this request.
  final String? endpointUrl;

  /// The event buses used for replication for the endpoint you updated in this
  /// request.
  final List<EndpointEventBus>? eventBuses;

  /// The name of the endpoint you updated in this request.
  final String? name;

  /// Whether event replication was enabled or disabled for the endpoint you
  /// updated in this request.
  final ReplicationConfig? replicationConfig;

  /// The ARN of the role used by event replication for the endpoint you updated
  /// in this request.
  final String? roleArn;

  /// The routing configuration you updated in this request.
  final RoutingConfig? routingConfig;

  /// The state of the endpoint you updated in this request.
  final EndpointState? state;

  UpdateEndpointResponse({
    this.arn,
    this.endpointId,
    this.endpointUrl,
    this.eventBuses,
    this.name,
    this.replicationConfig,
    this.roleArn,
    this.routingConfig,
    this.state,
  });

  factory UpdateEndpointResponse.fromJson(Map<String, dynamic> json) {
    return UpdateEndpointResponse(
      arn: json['Arn'] as String?,
      endpointId: json['EndpointId'] as String?,
      endpointUrl: json['EndpointUrl'] as String?,
      eventBuses: (json['EventBuses'] as List?)
          ?.nonNulls
          .map((e) => EndpointEventBus.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['Name'] as String?,
      replicationConfig: json['ReplicationConfig'] != null
          ? ReplicationConfig.fromJson(
              json['ReplicationConfig'] as Map<String, dynamic>)
          : null,
      roleArn: json['RoleArn'] as String?,
      routingConfig: json['RoutingConfig'] != null
          ? RoutingConfig.fromJson(
              json['RoutingConfig'] as Map<String, dynamic>)
          : null,
      state: (json['State'] as String?)?.let(EndpointState.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final endpointId = this.endpointId;
    final endpointUrl = this.endpointUrl;
    final eventBuses = this.eventBuses;
    final name = this.name;
    final replicationConfig = this.replicationConfig;
    final roleArn = this.roleArn;
    final routingConfig = this.routingConfig;
    final state = this.state;
    return {
      if (arn != null) 'Arn': arn,
      if (endpointId != null) 'EndpointId': endpointId,
      if (endpointUrl != null) 'EndpointUrl': endpointUrl,
      if (eventBuses != null) 'EventBuses': eventBuses,
      if (name != null) 'Name': name,
      if (replicationConfig != null) 'ReplicationConfig': replicationConfig,
      if (roleArn != null) 'RoleArn': roleArn,
      if (routingConfig != null) 'RoutingConfig': routingConfig,
      if (state != null) 'State': state.value,
    };
  }
}

/// @nodoc
class UpdateEventBusResponse {
  /// The event bus Amazon Resource Name (ARN).
  final String? arn;
  final DeadLetterConfig? deadLetterConfig;

  /// The event bus description.
  final String? description;

  /// The identifier of the KMS customer managed key for EventBridge to use to
  /// encrypt events on this event bus, if one has been specified.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-encryption.html">Data
  /// encryption in EventBridge</a> in the <i>Amazon EventBridge User Guide</i>.
  final String? kmsKeyIdentifier;

  /// The logging configuration settings for the event bus.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eb-event-bus-logs.html">Configuring logs
  /// for event buses</a> in the <i>EventBridge User Guide</i>.
  final LogConfig? logConfig;

  /// The event bus name.
  final String? name;

  UpdateEventBusResponse({
    this.arn,
    this.deadLetterConfig,
    this.description,
    this.kmsKeyIdentifier,
    this.logConfig,
    this.name,
  });

  factory UpdateEventBusResponse.fromJson(Map<String, dynamic> json) {
    return UpdateEventBusResponse(
      arn: json['Arn'] as String?,
      deadLetterConfig: json['DeadLetterConfig'] != null
          ? DeadLetterConfig.fromJson(
              json['DeadLetterConfig'] as Map<String, dynamic>)
          : null,
      description: json['Description'] as String?,
      kmsKeyIdentifier: json['KmsKeyIdentifier'] as String?,
      logConfig: json['LogConfig'] != null
          ? LogConfig.fromJson(json['LogConfig'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final deadLetterConfig = this.deadLetterConfig;
    final description = this.description;
    final kmsKeyIdentifier = this.kmsKeyIdentifier;
    final logConfig = this.logConfig;
    final name = this.name;
    return {
      if (arn != null) 'Arn': arn,
      if (deadLetterConfig != null) 'DeadLetterConfig': deadLetterConfig,
      if (description != null) 'Description': description,
      if (kmsKeyIdentifier != null) 'KmsKeyIdentifier': kmsKeyIdentifier,
      if (logConfig != null) 'LogConfig': logConfig,
      if (name != null) 'Name': name,
    };
  }
}

/// Configuration details of the Amazon SQS queue for EventBridge to use as a
/// dead-letter queue (DLQ).
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-rule-event-delivery.html#eb-rule-dlq">Using
/// dead-letter queues to process undelivered events</a> in the <i>EventBridge
/// User Guide</i>.
///
/// @nodoc
class DeadLetterConfig {
  /// The ARN of the SQS queue specified as the target for the dead-letter queue.
  final String? arn;

  DeadLetterConfig({
    this.arn,
  });

  factory DeadLetterConfig.fromJson(Map<String, dynamic> json) {
    return DeadLetterConfig(
      arn: json['Arn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      if (arn != null) 'Arn': arn,
    };
  }
}

/// The logging configuration settings for the event bus.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/eb-event-bus-logs.html">Configuring logs
/// for event buses</a> in the <i>EventBridge User Guide</i>.
///
/// @nodoc
class LogConfig {
  /// Whether EventBridge include detailed event information in the records it
  /// generates. Detailed data can be useful for troubleshooting and debugging.
  /// This information includes details of the event itself, as well as target
  /// details.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-event-bus-logs.html#eb-event-logs-data">Including
  /// detail data in event bus logs</a> in the <i>EventBridge User Guide</i>.
  final IncludeDetail? includeDetail;

  /// The level of logging detail to include. This applies to all log destinations
  /// for the event bus.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-event-bus-logs.html#eb-event-bus-logs-level">Specifying
  /// event bus log level</a> in the <i>EventBridge User Guide</i>.
  final Level? level;

  LogConfig({
    this.includeDetail,
    this.level,
  });

  factory LogConfig.fromJson(Map<String, dynamic> json) {
    return LogConfig(
      includeDetail:
          (json['IncludeDetail'] as String?)?.let(IncludeDetail.fromString),
      level: (json['Level'] as String?)?.let(Level.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final includeDetail = this.includeDetail;
    final level = this.level;
    return {
      if (includeDetail != null) 'IncludeDetail': includeDetail.value,
      if (level != null) 'Level': level.value,
    };
  }
}

/// @nodoc
class IncludeDetail {
  static const none = IncludeDetail._('NONE');
  static const full = IncludeDetail._('FULL');

  final String value;

  const IncludeDetail._(this.value);

  static const values = [none, full];

  static IncludeDetail fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IncludeDetail._(value));

  @override
  bool operator ==(other) => other is IncludeDetail && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Level {
  static const off = Level._('OFF');
  static const error = Level._('ERROR');
  static const info = Level._('INFO');
  static const trace = Level._('TRACE');

  final String value;

  const Level._(this.value);

  static const values = [off, error, info, trace];

  static Level fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Level._(value));

  @override
  bool operator ==(other) => other is Level && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The routing configuration of the endpoint.
///
/// @nodoc
class RoutingConfig {
  /// The failover configuration for an endpoint. This includes what triggers
  /// failover and what happens when it's triggered.
  final FailoverConfig failoverConfig;

  RoutingConfig({
    required this.failoverConfig,
  });

  factory RoutingConfig.fromJson(Map<String, dynamic> json) {
    return RoutingConfig(
      failoverConfig: FailoverConfig.fromJson(
          (json['FailoverConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final failoverConfig = this.failoverConfig;
    return {
      'FailoverConfig': failoverConfig,
    };
  }
}

/// Endpoints can replicate all events to the secondary Region.
///
/// @nodoc
class ReplicationConfig {
  /// The state of event replication.
  final ReplicationState? state;

  ReplicationConfig({
    this.state,
  });

  factory ReplicationConfig.fromJson(Map<String, dynamic> json) {
    return ReplicationConfig(
      state: (json['State'] as String?)?.let(ReplicationState.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    return {
      if (state != null) 'State': state.value,
    };
  }
}

/// @nodoc
class EndpointState {
  static const active = EndpointState._('ACTIVE');
  static const creating = EndpointState._('CREATING');
  static const updating = EndpointState._('UPDATING');
  static const deleting = EndpointState._('DELETING');
  static const createFailed = EndpointState._('CREATE_FAILED');
  static const updateFailed = EndpointState._('UPDATE_FAILED');
  static const deleteFailed = EndpointState._('DELETE_FAILED');

  final String value;

  const EndpointState._(this.value);

  static const values = [
    active,
    creating,
    updating,
    deleting,
    createFailed,
    updateFailed,
    deleteFailed
  ];

  static EndpointState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EndpointState._(value));

  @override
  bool operator ==(other) => other is EndpointState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The event buses the endpoint is associated with.
///
/// @nodoc
class EndpointEventBus {
  /// The ARN of the event bus the endpoint is associated with.
  final String eventBusArn;

  EndpointEventBus({
    required this.eventBusArn,
  });

  factory EndpointEventBus.fromJson(Map<String, dynamic> json) {
    return EndpointEventBus(
      eventBusArn: (json['EventBusArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final eventBusArn = this.eventBusArn;
    return {
      'EventBusArn': eventBusArn,
    };
  }
}

/// @nodoc
class ReplicationState {
  static const enabled = ReplicationState._('ENABLED');
  static const disabled = ReplicationState._('DISABLED');

  final String value;

  const ReplicationState._(this.value);

  static const values = [enabled, disabled];

  static ReplicationState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ReplicationState._(value));

  @override
  bool operator ==(other) => other is ReplicationState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The failover configuration for an endpoint. This includes what triggers
/// failover and what happens when it's triggered.
///
/// @nodoc
class FailoverConfig {
  /// The main Region of the endpoint.
  final Primary primary;

  /// The Region that events are routed to when failover is triggered or event
  /// replication is enabled.
  final Secondary secondary;

  FailoverConfig({
    required this.primary,
    required this.secondary,
  });

  factory FailoverConfig.fromJson(Map<String, dynamic> json) {
    return FailoverConfig(
      primary: Primary.fromJson((json['Primary'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      secondary: Secondary.fromJson(
          (json['Secondary'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final primary = this.primary;
    final secondary = this.secondary;
    return {
      'Primary': primary,
      'Secondary': secondary,
    };
  }
}

/// The primary Region of the endpoint.
///
/// @nodoc
class Primary {
  /// The ARN of the health check used by the endpoint to determine whether
  /// failover is triggered.
  final String healthCheck;

  Primary({
    required this.healthCheck,
  });

  factory Primary.fromJson(Map<String, dynamic> json) {
    return Primary(
      healthCheck: (json['HealthCheck'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final healthCheck = this.healthCheck;
    return {
      'HealthCheck': healthCheck,
    };
  }
}

/// The secondary Region that processes events when failover is triggered or
/// replication is enabled.
///
/// @nodoc
class Secondary {
  /// Defines the secondary Region.
  final String route;

  Secondary({
    required this.route,
  });

  factory Secondary.fromJson(Map<String, dynamic> json) {
    return Secondary(
      route: (json['Route'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final route = this.route;
    return {
      'Route': route,
    };
  }
}

/// @nodoc
class ConnectionState {
  static const creating = ConnectionState._('CREATING');
  static const updating = ConnectionState._('UPDATING');
  static const deleting = ConnectionState._('DELETING');
  static const authorized = ConnectionState._('AUTHORIZED');
  static const deauthorized = ConnectionState._('DEAUTHORIZED');
  static const authorizing = ConnectionState._('AUTHORIZING');
  static const deauthorizing = ConnectionState._('DEAUTHORIZING');
  static const active = ConnectionState._('ACTIVE');
  static const failedConnectivity = ConnectionState._('FAILED_CONNECTIVITY');

  final String value;

  const ConnectionState._(this.value);

  static const values = [
    creating,
    updating,
    deleting,
    authorized,
    deauthorized,
    authorizing,
    deauthorizing,
    active,
    failedConnectivity
  ];

  static ConnectionState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ConnectionState._(value));

  @override
  bool operator ==(other) => other is ConnectionState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ConnectionAuthorizationType {
  static const basic = ConnectionAuthorizationType._('BASIC');
  static const oauthClientCredentials =
      ConnectionAuthorizationType._('OAUTH_CLIENT_CREDENTIALS');
  static const apiKey = ConnectionAuthorizationType._('API_KEY');

  final String value;

  const ConnectionAuthorizationType._(this.value);

  static const values = [basic, oauthClientCredentials, apiKey];

  static ConnectionAuthorizationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ConnectionAuthorizationType._(value));

  @override
  bool operator ==(other) =>
      other is ConnectionAuthorizationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains the additional parameters to use for the connection.
///
/// @nodoc
class UpdateConnectionAuthRequestParameters {
  /// The authorization parameters for API key authorization.
  final UpdateConnectionApiKeyAuthRequestParameters? apiKeyAuthParameters;

  /// The authorization parameters for Basic authorization.
  final UpdateConnectionBasicAuthRequestParameters? basicAuthParameters;

  /// If you specify a private OAuth endpoint, the parameters for EventBridge to
  /// use when authenticating against the endpoint.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-target-connection-auth.html">Authorization
  /// methods for connections</a> in the <i> <i>Amazon EventBridge User Guide</i>
  /// </i>.
  final ConnectivityResourceParameters? connectivityParameters;

  /// The additional parameters to use for the connection.
  final ConnectionHttpParameters? invocationHttpParameters;

  /// The authorization parameters for OAuth authorization.
  final UpdateConnectionOAuthRequestParameters? oAuthParameters;

  UpdateConnectionAuthRequestParameters({
    this.apiKeyAuthParameters,
    this.basicAuthParameters,
    this.connectivityParameters,
    this.invocationHttpParameters,
    this.oAuthParameters,
  });

  Map<String, dynamic> toJson() {
    final apiKeyAuthParameters = this.apiKeyAuthParameters;
    final basicAuthParameters = this.basicAuthParameters;
    final connectivityParameters = this.connectivityParameters;
    final invocationHttpParameters = this.invocationHttpParameters;
    final oAuthParameters = this.oAuthParameters;
    return {
      if (apiKeyAuthParameters != null)
        'ApiKeyAuthParameters': apiKeyAuthParameters,
      if (basicAuthParameters != null)
        'BasicAuthParameters': basicAuthParameters,
      if (connectivityParameters != null)
        'ConnectivityParameters': connectivityParameters,
      if (invocationHttpParameters != null)
        'InvocationHttpParameters': invocationHttpParameters,
      if (oAuthParameters != null) 'OAuthParameters': oAuthParameters,
    };
  }
}

/// The parameters for EventBridge to use when invoking the resource endpoint.
///
/// @nodoc
class ConnectivityResourceParameters {
  /// The parameters for EventBridge to use when invoking the resource endpoint.
  final ConnectivityResourceConfigurationArn resourceParameters;

  ConnectivityResourceParameters({
    required this.resourceParameters,
  });

  Map<String, dynamic> toJson() {
    final resourceParameters = this.resourceParameters;
    return {
      'ResourceParameters': resourceParameters,
    };
  }
}

/// The Amazon Resource Name (ARN) of the Amazon VPC Lattice resource
/// configuration for the resource endpoint.
///
/// @nodoc
class ConnectivityResourceConfigurationArn {
  /// The Amazon Resource Name (ARN) of the Amazon VPC Lattice resource
  /// configuration for the resource endpoint.
  final String resourceConfigurationArn;

  ConnectivityResourceConfigurationArn({
    required this.resourceConfigurationArn,
  });

  Map<String, dynamic> toJson() {
    final resourceConfigurationArn = this.resourceConfigurationArn;
    return {
      'ResourceConfigurationArn': resourceConfigurationArn,
    };
  }
}

/// The Basic authorization parameters for the connection.
///
/// @nodoc
class UpdateConnectionBasicAuthRequestParameters {
  /// The password associated with the user name to use for Basic authorization.
  final String? password;

  /// The user name to use for Basic authorization.
  final String? username;

  UpdateConnectionBasicAuthRequestParameters({
    this.password,
    this.username,
  });

  Map<String, dynamic> toJson() {
    final password = this.password;
    final username = this.username;
    return {
      if (password != null) 'Password': password,
      if (username != null) 'Username': username,
    };
  }
}

/// The OAuth request parameters to use for the connection.
///
/// @nodoc
class UpdateConnectionOAuthRequestParameters {
  /// The URL to the authorization endpoint when OAuth is specified as the
  /// authorization type.
  final String? authorizationEndpoint;

  /// The client parameters to use for the connection when OAuth is specified as
  /// the authorization type.
  final UpdateConnectionOAuthClientRequestParameters? clientParameters;

  /// The method used to connect to the HTTP endpoint.
  final ConnectionOAuthHttpMethod? httpMethod;

  /// The additional HTTP parameters used for the OAuth authorization request.
  final ConnectionHttpParameters? oAuthHttpParameters;

  UpdateConnectionOAuthRequestParameters({
    this.authorizationEndpoint,
    this.clientParameters,
    this.httpMethod,
    this.oAuthHttpParameters,
  });

  Map<String, dynamic> toJson() {
    final authorizationEndpoint = this.authorizationEndpoint;
    final clientParameters = this.clientParameters;
    final httpMethod = this.httpMethod;
    final oAuthHttpParameters = this.oAuthHttpParameters;
    return {
      if (authorizationEndpoint != null)
        'AuthorizationEndpoint': authorizationEndpoint,
      if (clientParameters != null) 'ClientParameters': clientParameters,
      if (httpMethod != null) 'HttpMethod': httpMethod.value,
      if (oAuthHttpParameters != null)
        'OAuthHttpParameters': oAuthHttpParameters,
    };
  }
}

/// Contains the API key authorization parameters to use to update the
/// connection.
///
/// @nodoc
class UpdateConnectionApiKeyAuthRequestParameters {
  /// The name of the API key to use for authorization.
  final String? apiKeyName;

  /// The value associated with the API key to use for authorization.
  final String? apiKeyValue;

  UpdateConnectionApiKeyAuthRequestParameters({
    this.apiKeyName,
    this.apiKeyValue,
  });

  Map<String, dynamic> toJson() {
    final apiKeyName = this.apiKeyName;
    final apiKeyValue = this.apiKeyValue;
    return {
      if (apiKeyName != null) 'ApiKeyName': apiKeyName,
      if (apiKeyValue != null) 'ApiKeyValue': apiKeyValue,
    };
  }
}

/// Any additional parameters for the connection.
///
/// @nodoc
class ConnectionHttpParameters {
  /// Any additional body string parameters for the connection.
  final List<ConnectionBodyParameter>? bodyParameters;

  /// Any additional header parameters for the connection.
  final List<ConnectionHeaderParameter>? headerParameters;

  /// Any additional query string parameters for the connection.
  final List<ConnectionQueryStringParameter>? queryStringParameters;

  ConnectionHttpParameters({
    this.bodyParameters,
    this.headerParameters,
    this.queryStringParameters,
  });

  factory ConnectionHttpParameters.fromJson(Map<String, dynamic> json) {
    return ConnectionHttpParameters(
      bodyParameters: (json['BodyParameters'] as List?)
          ?.nonNulls
          .map((e) =>
              ConnectionBodyParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
      headerParameters: (json['HeaderParameters'] as List?)
          ?.nonNulls
          .map((e) =>
              ConnectionHeaderParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
      queryStringParameters: (json['QueryStringParameters'] as List?)
          ?.nonNulls
          .map((e) => ConnectionQueryStringParameter.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final bodyParameters = this.bodyParameters;
    final headerParameters = this.headerParameters;
    final queryStringParameters = this.queryStringParameters;
    return {
      if (bodyParameters != null) 'BodyParameters': bodyParameters,
      if (headerParameters != null) 'HeaderParameters': headerParameters,
      if (queryStringParameters != null)
        'QueryStringParameters': queryStringParameters,
    };
  }
}

/// Additional parameter included in the body. You can include up to 100
/// additional body parameters per request. An event payload cannot exceed 64
/// KB.
///
/// @nodoc
class ConnectionBodyParameter {
  /// Specifies whether the value is secret.
  final bool? isValueSecret;

  /// The key for the parameter.
  final String? key;

  /// The value associated with the key.
  final String? value;

  ConnectionBodyParameter({
    this.isValueSecret,
    this.key,
    this.value,
  });

  factory ConnectionBodyParameter.fromJson(Map<String, dynamic> json) {
    return ConnectionBodyParameter(
      isValueSecret: json['IsValueSecret'] as bool?,
      key: json['Key'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final isValueSecret = this.isValueSecret;
    final key = this.key;
    final value = this.value;
    return {
      if (isValueSecret != null) 'IsValueSecret': isValueSecret,
      if (key != null) 'Key': key,
      if (value != null) 'Value': value,
    };
  }
}

/// Any additional query string parameter for the connection. You can include up
/// to 100 additional query string parameters per request. Each additional
/// parameter counts towards the event payload size, which cannot exceed 64 KB.
///
/// @nodoc
class ConnectionQueryStringParameter {
  /// Specifies whether the value is secret.
  final bool? isValueSecret;

  /// The key for a query string parameter.
  final String? key;

  /// The value associated with the key for the query string parameter.
  final String? value;

  ConnectionQueryStringParameter({
    this.isValueSecret,
    this.key,
    this.value,
  });

  factory ConnectionQueryStringParameter.fromJson(Map<String, dynamic> json) {
    return ConnectionQueryStringParameter(
      isValueSecret: json['IsValueSecret'] as bool?,
      key: json['Key'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final isValueSecret = this.isValueSecret;
    final key = this.key;
    final value = this.value;
    return {
      if (isValueSecret != null) 'IsValueSecret': isValueSecret,
      if (key != null) 'Key': key,
      if (value != null) 'Value': value,
    };
  }
}

/// Additional parameter included in the header. You can include up to 100
/// additional header parameters per request. An event payload cannot exceed 64
/// KB.
///
/// @nodoc
class ConnectionHeaderParameter {
  /// Specifies whether the value is a secret.
  final bool? isValueSecret;

  /// The key for the parameter.
  final String? key;

  /// The value associated with the key.
  final String? value;

  ConnectionHeaderParameter({
    this.isValueSecret,
    this.key,
    this.value,
  });

  factory ConnectionHeaderParameter.fromJson(Map<String, dynamic> json) {
    return ConnectionHeaderParameter(
      isValueSecret: json['IsValueSecret'] as bool?,
      key: json['Key'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final isValueSecret = this.isValueSecret;
    final key = this.key;
    final value = this.value;
    return {
      if (isValueSecret != null) 'IsValueSecret': isValueSecret,
      if (key != null) 'Key': key,
      if (value != null) 'Value': value,
    };
  }
}

/// The OAuth authorization parameters to use for the connection.
///
/// @nodoc
class UpdateConnectionOAuthClientRequestParameters {
  /// The client ID to use for OAuth authorization.
  final String? clientID;

  /// The client secret assciated with the client ID to use for OAuth
  /// authorization.
  final String? clientSecret;

  UpdateConnectionOAuthClientRequestParameters({
    this.clientID,
    this.clientSecret,
  });

  Map<String, dynamic> toJson() {
    final clientID = this.clientID;
    final clientSecret = this.clientSecret;
    return {
      if (clientID != null) 'ClientID': clientID,
      if (clientSecret != null) 'ClientSecret': clientSecret,
    };
  }
}

/// @nodoc
class ConnectionOAuthHttpMethod {
  static const get = ConnectionOAuthHttpMethod._('GET');
  static const post = ConnectionOAuthHttpMethod._('POST');
  static const put = ConnectionOAuthHttpMethod._('PUT');

  final String value;

  const ConnectionOAuthHttpMethod._(this.value);

  static const values = [get, post, put];

  static ConnectionOAuthHttpMethod fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ConnectionOAuthHttpMethod._(value));

  @override
  bool operator ==(other) =>
      other is ConnectionOAuthHttpMethod && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ArchiveState {
  static const enabled = ArchiveState._('ENABLED');
  static const disabled = ArchiveState._('DISABLED');
  static const creating = ArchiveState._('CREATING');
  static const updating = ArchiveState._('UPDATING');
  static const createFailed = ArchiveState._('CREATE_FAILED');
  static const updateFailed = ArchiveState._('UPDATE_FAILED');

  final String value;

  const ArchiveState._(this.value);

  static const values = [
    enabled,
    disabled,
    creating,
    updating,
    createFailed,
    updateFailed
  ];

  static ArchiveState fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ArchiveState._(value));

  @override
  bool operator ==(other) => other is ArchiveState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ApiDestinationState {
  static const active = ApiDestinationState._('ACTIVE');
  static const inactive = ApiDestinationState._('INACTIVE');

  final String value;

  const ApiDestinationState._(this.value);

  static const values = [active, inactive];

  static ApiDestinationState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ApiDestinationState._(value));

  @override
  bool operator ==(other) =>
      other is ApiDestinationState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ApiDestinationHttpMethod {
  static const post = ApiDestinationHttpMethod._('POST');
  static const get = ApiDestinationHttpMethod._('GET');
  static const head = ApiDestinationHttpMethod._('HEAD');
  static const options = ApiDestinationHttpMethod._('OPTIONS');
  static const put = ApiDestinationHttpMethod._('PUT');
  static const patch = ApiDestinationHttpMethod._('PATCH');
  static const delete = ApiDestinationHttpMethod._('DELETE');

  final String value;

  const ApiDestinationHttpMethod._(this.value);

  static const values = [post, get, head, options, put, patch, delete];

  static ApiDestinationHttpMethod fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ApiDestinationHttpMethod._(value));

  @override
  bool operator ==(other) =>
      other is ApiDestinationHttpMethod && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A key-value pair associated with an Amazon Web Services resource. In
/// EventBridge, rules and event buses support tagging.
///
/// @nodoc
class Tag {
  /// A string you can use to assign a value. The combination of tag keys and
  /// values can help you organize and categorize your resources.
  final String key;

  /// The value for the specified tag key.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
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

/// @nodoc
class ReplayState {
  static const starting = ReplayState._('STARTING');
  static const running = ReplayState._('RUNNING');
  static const cancelling = ReplayState._('CANCELLING');
  static const completed = ReplayState._('COMPLETED');
  static const cancelled = ReplayState._('CANCELLED');
  static const failed = ReplayState._('FAILED');

  final String value;

  const ReplayState._(this.value);

  static const values = [
    starting,
    running,
    cancelling,
    completed,
    cancelled,
    failed
  ];

  static ReplayState fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ReplayState._(value));

  @override
  bool operator ==(other) => other is ReplayState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A <code>ReplayDestination</code> object that contains details about a
/// replay.
///
/// @nodoc
class ReplayDestination {
  /// The ARN of the event bus to replay event to. You can replay events only to
  /// the event bus specified to create the archive.
  final String arn;

  /// A list of ARNs for rules to replay events to.
  final List<String>? filterArns;

  ReplayDestination({
    required this.arn,
    this.filterArns,
  });

  factory ReplayDestination.fromJson(Map<String, dynamic> json) {
    return ReplayDestination(
      arn: (json['Arn'] as String?) ?? '',
      filterArns: (json['FilterArns'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final filterArns = this.filterArns;
    return {
      'Arn': arn,
      if (filterArns != null) 'FilterArns': filterArns,
    };
  }
}

/// Represents a target that failed to be removed from a rule.
///
/// @nodoc
class RemoveTargetsResultEntry {
  /// The error code that indicates why the target removal failed. If the value is
  /// <code>ConcurrentModificationException</code>, too many requests were made at
  /// the same time.
  final String? errorCode;

  /// The error message that explains why the target removal failed.
  final String? errorMessage;

  /// The ID of the target.
  final String? targetId;

  RemoveTargetsResultEntry({
    this.errorCode,
    this.errorMessage,
    this.targetId,
  });

  factory RemoveTargetsResultEntry.fromJson(Map<String, dynamic> json) {
    return RemoveTargetsResultEntry(
      errorCode: json['ErrorCode'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
      targetId: json['TargetId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final targetId = this.targetId;
    return {
      if (errorCode != null) 'ErrorCode': errorCode,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (targetId != null) 'TargetId': targetId,
    };
  }
}

/// Represents a target that failed to be added to a rule.
///
/// @nodoc
class PutTargetsResultEntry {
  /// The error code that indicates why the target addition failed. If the value
  /// is <code>ConcurrentModificationException</code>, too many requests were made
  /// at the same time.
  final String? errorCode;

  /// The error message that explains why the target addition failed.
  final String? errorMessage;

  /// The ID of the target.
  final String? targetId;

  PutTargetsResultEntry({
    this.errorCode,
    this.errorMessage,
    this.targetId,
  });

  factory PutTargetsResultEntry.fromJson(Map<String, dynamic> json) {
    return PutTargetsResultEntry(
      errorCode: json['ErrorCode'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
      targetId: json['TargetId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final targetId = this.targetId;
    return {
      if (errorCode != null) 'ErrorCode': errorCode,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (targetId != null) 'TargetId': targetId,
    };
  }
}

/// Targets are the resources to be invoked when a rule is triggered. For a
/// complete list of services and resources that can be set as a target, see <a
/// href="https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_PutTargets.html">PutTargets</a>.
///
/// If you are setting the event bus of another account as the target, and that
/// account granted permission to your account through an organization instead
/// of directly by the account ID, then you must specify a <code>RoleArn</code>
/// with proper permissions in the <code>Target</code> structure. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-cross-account-event-delivery.html">Sending
/// and Receiving Events Between Amazon Web Services Accounts</a> in the
/// <i>Amazon EventBridge User Guide</i>.
///
/// @nodoc
class Target {
  /// The Amazon Resource Name (ARN) of the target.
  final String arn;

  /// The ID of the target within the specified rule. Use this ID to reference the
  /// target when updating the rule. We recommend using a memorable and unique
  /// string.
  final String id;

  /// Contains the GraphQL operation to be parsed and executed, if the event
  /// target is an AppSync API.
  final AppSyncParameters? appSyncParameters;

  /// If the event target is an Batch job, this contains the job definition, job
  /// name, and other parameters. For more information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/jobs.html">Jobs</a>
  /// in the <i>Batch User Guide</i>.
  final BatchParameters? batchParameters;

  /// The <code>DeadLetterConfig</code> that defines the target queue to send
  /// dead-letter queue events to.
  final DeadLetterConfig? deadLetterConfig;

  /// Contains the Amazon ECS task definition and task count to be used, if the
  /// event target is an Amazon ECS task. For more information about Amazon ECS
  /// tasks, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_defintions.html">Task
  /// Definitions </a> in the <i>Amazon EC2 Container Service Developer Guide</i>.
  final EcsParameters? ecsParameters;

  /// Contains the HTTP parameters to use when the target is a API Gateway
  /// endpoint or EventBridge ApiDestination.
  ///
  /// If you specify an API Gateway API or EventBridge ApiDestination as a target,
  /// you can use this parameter to specify headers, path parameters, and query
  /// string keys/values as part of your target invoking request. If you're using
  /// ApiDestinations, the corresponding Connection can also have these values
  /// configured. In case of any conflicting keys, values from the Connection take
  /// precedence.
  final HttpParameters? httpParameters;

  /// Valid JSON text passed to the target. In this case, nothing from the event
  /// itself is passed to the target. For more information, see <a
  /// href="http://www.rfc-editor.org/rfc/rfc7159.txt">The JavaScript Object
  /// Notation (JSON) Data Interchange Format</a>.
  final String? input;

  /// The value of the JSONPath that is used for extracting part of the matched
  /// event when passing it to the target. You may use JSON dot notation or
  /// bracket notation. For more information about JSON paths, see <a
  /// href="http://goessner.net/articles/JsonPath/">JSONPath</a>.
  final String? inputPath;

  /// Settings to enable you to provide custom input to a target based on certain
  /// event data. You can extract one or more key-value pairs from the event and
  /// then use that data to send customized input to the target.
  final InputTransformer? inputTransformer;

  /// The custom parameter you can use to control the shard assignment, when the
  /// target is a Kinesis data stream. If you do not include this parameter, the
  /// default is to use the <code>eventId</code> as the partition key.
  final KinesisParameters? kinesisParameters;

  /// Contains the Amazon Redshift Data API parameters to use when the target is a
  /// Amazon Redshift cluster.
  ///
  /// If you specify a Amazon Redshift Cluster as a Target, you can use this to
  /// specify parameters to invoke the Amazon Redshift Data API ExecuteStatement
  /// based on EventBridge events.
  final RedshiftDataParameters? redshiftDataParameters;

  /// The retry policy configuration to use for the dead-letter queue.
  final RetryPolicy? retryPolicy;

  /// The Amazon Resource Name (ARN) of the IAM role to be used for this target
  /// when the rule is triggered. If one rule triggers multiple targets, you can
  /// use a different IAM role for each target.
  final String? roleArn;

  /// Parameters used when you are using the rule to invoke Amazon EC2 Run
  /// Command.
  final RunCommandParameters? runCommandParameters;

  /// Contains the SageMaker AI Model Building Pipeline parameters to start
  /// execution of a SageMaker AI Model Building Pipeline.
  ///
  /// If you specify a SageMaker AI Model Building Pipeline as a target, you can
  /// use this to specify parameters to start a pipeline execution based on
  /// EventBridge events.
  final SageMakerPipelineParameters? sageMakerPipelineParameters;

  /// Contains the message group ID to use when the target is a FIFO queue.
  ///
  /// If you specify an SQS FIFO queue as a target, the queue must have
  /// content-based deduplication enabled.
  final SqsParameters? sqsParameters;

  Target({
    required this.arn,
    required this.id,
    this.appSyncParameters,
    this.batchParameters,
    this.deadLetterConfig,
    this.ecsParameters,
    this.httpParameters,
    this.input,
    this.inputPath,
    this.inputTransformer,
    this.kinesisParameters,
    this.redshiftDataParameters,
    this.retryPolicy,
    this.roleArn,
    this.runCommandParameters,
    this.sageMakerPipelineParameters,
    this.sqsParameters,
  });

  factory Target.fromJson(Map<String, dynamic> json) {
    return Target(
      arn: (json['Arn'] as String?) ?? '',
      id: (json['Id'] as String?) ?? '',
      appSyncParameters: json['AppSyncParameters'] != null
          ? AppSyncParameters.fromJson(
              json['AppSyncParameters'] as Map<String, dynamic>)
          : null,
      batchParameters: json['BatchParameters'] != null
          ? BatchParameters.fromJson(
              json['BatchParameters'] as Map<String, dynamic>)
          : null,
      deadLetterConfig: json['DeadLetterConfig'] != null
          ? DeadLetterConfig.fromJson(
              json['DeadLetterConfig'] as Map<String, dynamic>)
          : null,
      ecsParameters: json['EcsParameters'] != null
          ? EcsParameters.fromJson(
              json['EcsParameters'] as Map<String, dynamic>)
          : null,
      httpParameters: json['HttpParameters'] != null
          ? HttpParameters.fromJson(
              json['HttpParameters'] as Map<String, dynamic>)
          : null,
      input: json['Input'] as String?,
      inputPath: json['InputPath'] as String?,
      inputTransformer: json['InputTransformer'] != null
          ? InputTransformer.fromJson(
              json['InputTransformer'] as Map<String, dynamic>)
          : null,
      kinesisParameters: json['KinesisParameters'] != null
          ? KinesisParameters.fromJson(
              json['KinesisParameters'] as Map<String, dynamic>)
          : null,
      redshiftDataParameters: json['RedshiftDataParameters'] != null
          ? RedshiftDataParameters.fromJson(
              json['RedshiftDataParameters'] as Map<String, dynamic>)
          : null,
      retryPolicy: json['RetryPolicy'] != null
          ? RetryPolicy.fromJson(json['RetryPolicy'] as Map<String, dynamic>)
          : null,
      roleArn: json['RoleArn'] as String?,
      runCommandParameters: json['RunCommandParameters'] != null
          ? RunCommandParameters.fromJson(
              json['RunCommandParameters'] as Map<String, dynamic>)
          : null,
      sageMakerPipelineParameters: json['SageMakerPipelineParameters'] != null
          ? SageMakerPipelineParameters.fromJson(
              json['SageMakerPipelineParameters'] as Map<String, dynamic>)
          : null,
      sqsParameters: json['SqsParameters'] != null
          ? SqsParameters.fromJson(
              json['SqsParameters'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final appSyncParameters = this.appSyncParameters;
    final batchParameters = this.batchParameters;
    final deadLetterConfig = this.deadLetterConfig;
    final ecsParameters = this.ecsParameters;
    final httpParameters = this.httpParameters;
    final input = this.input;
    final inputPath = this.inputPath;
    final inputTransformer = this.inputTransformer;
    final kinesisParameters = this.kinesisParameters;
    final redshiftDataParameters = this.redshiftDataParameters;
    final retryPolicy = this.retryPolicy;
    final roleArn = this.roleArn;
    final runCommandParameters = this.runCommandParameters;
    final sageMakerPipelineParameters = this.sageMakerPipelineParameters;
    final sqsParameters = this.sqsParameters;
    return {
      'Arn': arn,
      'Id': id,
      if (appSyncParameters != null) 'AppSyncParameters': appSyncParameters,
      if (batchParameters != null) 'BatchParameters': batchParameters,
      if (deadLetterConfig != null) 'DeadLetterConfig': deadLetterConfig,
      if (ecsParameters != null) 'EcsParameters': ecsParameters,
      if (httpParameters != null) 'HttpParameters': httpParameters,
      if (input != null) 'Input': input,
      if (inputPath != null) 'InputPath': inputPath,
      if (inputTransformer != null) 'InputTransformer': inputTransformer,
      if (kinesisParameters != null) 'KinesisParameters': kinesisParameters,
      if (redshiftDataParameters != null)
        'RedshiftDataParameters': redshiftDataParameters,
      if (retryPolicy != null) 'RetryPolicy': retryPolicy,
      if (roleArn != null) 'RoleArn': roleArn,
      if (runCommandParameters != null)
        'RunCommandParameters': runCommandParameters,
      if (sageMakerPipelineParameters != null)
        'SageMakerPipelineParameters': sageMakerPipelineParameters,
      if (sqsParameters != null) 'SqsParameters': sqsParameters,
    };
  }
}

/// Contains the parameters needed for you to provide custom input to a target
/// based on one or more pieces of data extracted from the event.
///
/// @nodoc
class InputTransformer {
  /// Input template where you specify placeholders that will be filled with the
  /// values of the keys from <code>InputPathsMap</code> to customize the data
  /// sent to the target. Enclose each <code>InputPathsMaps</code> value in
  /// brackets: <<i>value</i>>
  ///
  /// If <code>InputTemplate</code> is a JSON object (surrounded by curly braces),
  /// the following restrictions apply:
  ///
  /// <ul>
  /// <li>
  /// The placeholder cannot be used as an object key.
  /// </li>
  /// </ul>
  /// The following example shows the syntax for using <code>InputPathsMap</code>
  /// and <code>InputTemplate</code>.
  ///
  /// <code> "InputTransformer":</code>
  ///
  /// <code>{</code>
  ///
  /// <code>"InputPathsMap": {"instance": "$.detail.instance","status":
  /// "$.detail.status"},</code>
  ///
  /// <code>"InputTemplate": "<instance> is in state <status>"</code>
  ///
  /// <code>}</code>
  ///
  /// To have the <code>InputTemplate</code> include quote marks within a JSON
  /// string, escape each quote marks with a slash, as in the following example:
  ///
  /// <code> "InputTransformer":</code>
  ///
  /// <code>{</code>
  ///
  /// <code>"InputPathsMap": {"instance": "$.detail.instance","status":
  /// "$.detail.status"},</code>
  ///
  /// <code>"InputTemplate": "<instance> is in state \"<status>\""</code>
  ///
  /// <code>}</code>
  ///
  /// The <code>InputTemplate</code> can also be valid JSON with varibles in
  /// quotes or out, as in the following example:
  ///
  /// <code> "InputTransformer":</code>
  ///
  /// <code>{</code>
  ///
  /// <code>"InputPathsMap": {"instance": "$.detail.instance","status":
  /// "$.detail.status"},</code>
  ///
  /// <code>"InputTemplate": '{"myInstance": <instance>,"myStatus": "<instance> is
  /// in state \"<status>\""}'</code>
  ///
  /// <code>}</code>
  final String inputTemplate;

  /// Map of JSON paths to be extracted from the event. You can then insert these
  /// in the template in <code>InputTemplate</code> to produce the output you want
  /// to be sent to the target.
  ///
  /// <code>InputPathsMap</code> is an array key-value pairs, where each value is
  /// a valid JSON path. You can have as many as 100 key-value pairs. You must use
  /// JSON dot notation, not bracket notation.
  ///
  /// The keys cannot start with "Amazon Web Services."
  final Map<String, String>? inputPathsMap;

  InputTransformer({
    required this.inputTemplate,
    this.inputPathsMap,
  });

  factory InputTransformer.fromJson(Map<String, dynamic> json) {
    return InputTransformer(
      inputTemplate: (json['InputTemplate'] as String?) ?? '',
      inputPathsMap: (json['InputPathsMap'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final inputTemplate = this.inputTemplate;
    final inputPathsMap = this.inputPathsMap;
    return {
      'InputTemplate': inputTemplate,
      if (inputPathsMap != null) 'InputPathsMap': inputPathsMap,
    };
  }
}

/// This object enables you to specify a JSON path to extract from the event and
/// use as the partition key for the Amazon Kinesis data stream, so that you can
/// control the shard to which the event goes. If you do not include this
/// parameter, the default is to use the <code>eventId</code> as the partition
/// key.
///
/// @nodoc
class KinesisParameters {
  /// The JSON path to be extracted from the event and used as the partition key.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/streams/latest/dev/key-concepts.html#partition-key">Amazon
  /// Kinesis Streams Key Concepts</a> in the <i>Amazon Kinesis Streams Developer
  /// Guide</i>.
  final String partitionKeyPath;

  KinesisParameters({
    required this.partitionKeyPath,
  });

  factory KinesisParameters.fromJson(Map<String, dynamic> json) {
    return KinesisParameters(
      partitionKeyPath: (json['PartitionKeyPath'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final partitionKeyPath = this.partitionKeyPath;
    return {
      'PartitionKeyPath': partitionKeyPath,
    };
  }
}

/// This parameter contains the criteria (either InstanceIds or a tag) used to
/// specify which EC2 instances are to be sent the command.
///
/// @nodoc
class RunCommandParameters {
  /// Currently, we support including only one RunCommandTarget block, which
  /// specifies either an array of InstanceIds or a tag.
  final List<RunCommandTarget> runCommandTargets;

  RunCommandParameters({
    required this.runCommandTargets,
  });

  factory RunCommandParameters.fromJson(Map<String, dynamic> json) {
    return RunCommandParameters(
      runCommandTargets: ((json['RunCommandTargets'] as List?) ?? const [])
          .nonNulls
          .map((e) => RunCommandTarget.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final runCommandTargets = this.runCommandTargets;
    return {
      'RunCommandTargets': runCommandTargets,
    };
  }
}

/// The custom parameters to be used when the target is an Amazon ECS task.
///
/// @nodoc
class EcsParameters {
  /// The ARN of the task definition to use if the event target is an Amazon ECS
  /// task.
  final String taskDefinitionArn;

  /// The capacity provider strategy to use for the task.
  ///
  /// If a <code>capacityProviderStrategy</code> is specified, the
  /// <code>launchType</code> parameter must be omitted. If no
  /// <code>capacityProviderStrategy</code> or launchType is specified, the
  /// <code>defaultCapacityProviderStrategy</code> for the cluster is used.
  final List<CapacityProviderStrategyItem>? capacityProviderStrategy;

  /// Specifies whether to enable Amazon ECS managed tags for the task. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-using-tags.html">Tagging
  /// Your Amazon ECS Resources</a> in the Amazon Elastic Container Service
  /// Developer Guide.
  final bool? enableECSManagedTags;

  /// Whether or not to enable the execute command functionality for the
  /// containers in this task. If true, this enables execute command functionality
  /// on all containers in the task.
  final bool? enableExecuteCommand;

  /// Specifies an ECS task group for the task. The maximum length is 255
  /// characters.
  final String? group;

  /// Specifies the launch type on which your task is running. The launch type
  /// that you specify here must match one of the launch type (compatibilities) of
  /// the target task. The <code>FARGATE</code> value is supported only in the
  /// Regions where Fargate with Amazon ECS is supported. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/AWS-Fargate.html">Fargate
  /// on Amazon ECS</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  final LaunchType? launchType;

  /// Use this structure if the Amazon ECS task uses the <code>awsvpc</code>
  /// network mode. This structure specifies the VPC subnets and security groups
  /// associated with the task, and whether a public IP address is to be used.
  /// This structure is required if <code>LaunchType</code> is
  /// <code>FARGATE</code> because the <code>awsvpc</code> mode is required for
  /// Fargate tasks.
  ///
  /// If you specify <code>NetworkConfiguration</code> when the target ECS task
  /// does not use the <code>awsvpc</code> network mode, the task fails.
  final NetworkConfiguration? networkConfiguration;

  /// An array of placement constraint objects to use for the task. You can
  /// specify up to 10 constraints per task (including constraints in the task
  /// definition and those specified at runtime).
  final List<PlacementConstraint>? placementConstraints;

  /// The placement strategy objects to use for the task. You can specify a
  /// maximum of five strategy rules per task.
  final List<PlacementStrategy>? placementStrategy;

  /// Specifies the platform version for the task. Specify only the numeric
  /// portion of the platform version, such as <code>1.1.0</code>.
  ///
  /// This structure is used only if <code>LaunchType</code> is
  /// <code>FARGATE</code>. For more information about valid platform versions,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/platform_versions.html">Fargate
  /// Platform Versions</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  final String? platformVersion;

  /// Specifies whether to propagate the tags from the task definition to the
  /// task. If no value is specified, the tags are not propagated. Tags can only
  /// be propagated to the task during task creation. To add tags to a task after
  /// task creation, use the TagResource API action.
  final PropagateTags? propagateTags;

  /// The reference ID to use for the task.
  final String? referenceId;

  /// The metadata that you apply to the task to help you categorize and organize
  /// them. Each tag consists of a key and an optional value, both of which you
  /// define. To learn more, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_RunTask.html#ECS-RunTask-request-tags">RunTask</a>
  /// in the Amazon ECS API Reference.
  final List<Tag>? tags;

  /// The number of tasks to create based on <code>TaskDefinition</code>. The
  /// default is 1.
  final int? taskCount;

  EcsParameters({
    required this.taskDefinitionArn,
    this.capacityProviderStrategy,
    this.enableECSManagedTags,
    this.enableExecuteCommand,
    this.group,
    this.launchType,
    this.networkConfiguration,
    this.placementConstraints,
    this.placementStrategy,
    this.platformVersion,
    this.propagateTags,
    this.referenceId,
    this.tags,
    this.taskCount,
  });

  factory EcsParameters.fromJson(Map<String, dynamic> json) {
    return EcsParameters(
      taskDefinitionArn: (json['TaskDefinitionArn'] as String?) ?? '',
      capacityProviderStrategy: (json['CapacityProviderStrategy'] as List?)
          ?.nonNulls
          .map((e) =>
              CapacityProviderStrategyItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      enableECSManagedTags: json['EnableECSManagedTags'] as bool?,
      enableExecuteCommand: json['EnableExecuteCommand'] as bool?,
      group: json['Group'] as String?,
      launchType: (json['LaunchType'] as String?)?.let(LaunchType.fromString),
      networkConfiguration: json['NetworkConfiguration'] != null
          ? NetworkConfiguration.fromJson(
              json['NetworkConfiguration'] as Map<String, dynamic>)
          : null,
      placementConstraints: (json['PlacementConstraints'] as List?)
          ?.nonNulls
          .map((e) => PlacementConstraint.fromJson(e as Map<String, dynamic>))
          .toList(),
      placementStrategy: (json['PlacementStrategy'] as List?)
          ?.nonNulls
          .map((e) => PlacementStrategy.fromJson(e as Map<String, dynamic>))
          .toList(),
      platformVersion: json['PlatformVersion'] as String?,
      propagateTags:
          (json['PropagateTags'] as String?)?.let(PropagateTags.fromString),
      referenceId: json['ReferenceId'] as String?,
      tags: (json['Tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      taskCount: json['TaskCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final taskDefinitionArn = this.taskDefinitionArn;
    final capacityProviderStrategy = this.capacityProviderStrategy;
    final enableECSManagedTags = this.enableECSManagedTags;
    final enableExecuteCommand = this.enableExecuteCommand;
    final group = this.group;
    final launchType = this.launchType;
    final networkConfiguration = this.networkConfiguration;
    final placementConstraints = this.placementConstraints;
    final placementStrategy = this.placementStrategy;
    final platformVersion = this.platformVersion;
    final propagateTags = this.propagateTags;
    final referenceId = this.referenceId;
    final tags = this.tags;
    final taskCount = this.taskCount;
    return {
      'TaskDefinitionArn': taskDefinitionArn,
      if (capacityProviderStrategy != null)
        'CapacityProviderStrategy': capacityProviderStrategy,
      if (enableECSManagedTags != null)
        'EnableECSManagedTags': enableECSManagedTags,
      if (enableExecuteCommand != null)
        'EnableExecuteCommand': enableExecuteCommand,
      if (group != null) 'Group': group,
      if (launchType != null) 'LaunchType': launchType.value,
      if (networkConfiguration != null)
        'NetworkConfiguration': networkConfiguration,
      if (placementConstraints != null)
        'PlacementConstraints': placementConstraints,
      if (placementStrategy != null) 'PlacementStrategy': placementStrategy,
      if (platformVersion != null) 'PlatformVersion': platformVersion,
      if (propagateTags != null) 'PropagateTags': propagateTags.value,
      if (referenceId != null) 'ReferenceId': referenceId,
      if (tags != null) 'Tags': tags,
      if (taskCount != null) 'TaskCount': taskCount,
    };
  }
}

/// The custom parameters to be used when the target is an Batch job.
///
/// @nodoc
class BatchParameters {
  /// The ARN or name of the job definition to use if the event target is an Batch
  /// job. This job definition must already exist.
  final String jobDefinition;

  /// The name to use for this execution of the job, if the target is an Batch
  /// job.
  final String jobName;

  /// The array properties for the submitted job, such as the size of the array.
  /// The array size can be between 2 and 10,000. If you specify array properties
  /// for a job, it becomes an array job. This parameter is used only if the
  /// target is an Batch job.
  final BatchArrayProperties? arrayProperties;

  /// The retry strategy to use for failed jobs, if the target is an Batch job.
  /// The retry strategy is the number of times to retry the failed job execution.
  /// Valid values are 1–10. When you specify a retry strategy here, it overrides
  /// the retry strategy defined in the job definition.
  final BatchRetryStrategy? retryStrategy;

  BatchParameters({
    required this.jobDefinition,
    required this.jobName,
    this.arrayProperties,
    this.retryStrategy,
  });

  factory BatchParameters.fromJson(Map<String, dynamic> json) {
    return BatchParameters(
      jobDefinition: (json['JobDefinition'] as String?) ?? '',
      jobName: (json['JobName'] as String?) ?? '',
      arrayProperties: json['ArrayProperties'] != null
          ? BatchArrayProperties.fromJson(
              json['ArrayProperties'] as Map<String, dynamic>)
          : null,
      retryStrategy: json['RetryStrategy'] != null
          ? BatchRetryStrategy.fromJson(
              json['RetryStrategy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final jobDefinition = this.jobDefinition;
    final jobName = this.jobName;
    final arrayProperties = this.arrayProperties;
    final retryStrategy = this.retryStrategy;
    return {
      'JobDefinition': jobDefinition,
      'JobName': jobName,
      if (arrayProperties != null) 'ArrayProperties': arrayProperties,
      if (retryStrategy != null) 'RetryStrategy': retryStrategy,
    };
  }
}

/// This structure includes the custom parameter to be used when the target is
/// an SQS FIFO queue.
///
/// @nodoc
class SqsParameters {
  /// The FIFO message group ID to use as the target.
  final String? messageGroupId;

  SqsParameters({
    this.messageGroupId,
  });

  factory SqsParameters.fromJson(Map<String, dynamic> json) {
    return SqsParameters(
      messageGroupId: json['MessageGroupId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final messageGroupId = this.messageGroupId;
    return {
      if (messageGroupId != null) 'MessageGroupId': messageGroupId,
    };
  }
}

/// These are custom parameter to be used when the target is an API Gateway APIs
/// or EventBridge ApiDestinations. In the latter case, these are merged with
/// any InvocationParameters specified on the Connection, with any values from
/// the Connection taking precedence.
///
/// @nodoc
class HttpParameters {
  /// The headers that need to be sent as part of request invoking the API Gateway
  /// API or EventBridge ApiDestination.
  final Map<String, String>? headerParameters;

  /// The path parameter values to be used to populate API Gateway API or
  /// EventBridge ApiDestination path wildcards ("*").
  final List<String>? pathParameterValues;

  /// The query string keys/values that need to be sent as part of request
  /// invoking the API Gateway API or EventBridge ApiDestination.
  final Map<String, String>? queryStringParameters;

  HttpParameters({
    this.headerParameters,
    this.pathParameterValues,
    this.queryStringParameters,
  });

  factory HttpParameters.fromJson(Map<String, dynamic> json) {
    return HttpParameters(
      headerParameters: (json['HeaderParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      pathParameterValues: (json['PathParameterValues'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      queryStringParameters:
          (json['QueryStringParameters'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final headerParameters = this.headerParameters;
    final pathParameterValues = this.pathParameterValues;
    final queryStringParameters = this.queryStringParameters;
    return {
      if (headerParameters != null) 'HeaderParameters': headerParameters,
      if (pathParameterValues != null)
        'PathParameterValues': pathParameterValues,
      if (queryStringParameters != null)
        'QueryStringParameters': queryStringParameters,
    };
  }
}

/// These are custom parameters to be used when the target is a Amazon Redshift
/// cluster to invoke the Amazon Redshift Data API ExecuteStatement based on
/// EventBridge events.
///
/// @nodoc
class RedshiftDataParameters {
  /// The name of the database. Required when authenticating using temporary
  /// credentials.
  final String database;

  /// The database user name. Required when authenticating using temporary
  /// credentials.
  final String? dbUser;

  /// The name or ARN of the secret that enables access to the database. Required
  /// when authenticating using Amazon Web Services Secrets Manager.
  final String? secretManagerArn;

  /// The SQL statement text to run.
  final String? sql;

  /// One or more SQL statements to run. The SQL statements are run as a single
  /// transaction. They run serially in the order of the array. Subsequent SQL
  /// statements don't start until the previous statement in the array completes.
  /// If any SQL statement fails, then because they are run as one transaction,
  /// all work is rolled back.
  final List<String>? sqls;

  /// The name of the SQL statement. You can name the SQL statement when you
  /// create it to identify the query.
  final String? statementName;

  /// Indicates whether to send an event back to EventBridge after the SQL
  /// statement runs.
  final bool? withEvent;

  RedshiftDataParameters({
    required this.database,
    this.dbUser,
    this.secretManagerArn,
    this.sql,
    this.sqls,
    this.statementName,
    this.withEvent,
  });

  factory RedshiftDataParameters.fromJson(Map<String, dynamic> json) {
    return RedshiftDataParameters(
      database: (json['Database'] as String?) ?? '',
      dbUser: json['DbUser'] as String?,
      secretManagerArn: json['SecretManagerArn'] as String?,
      sql: json['Sql'] as String?,
      sqls: (json['Sqls'] as List?)?.nonNulls.map((e) => e as String).toList(),
      statementName: json['StatementName'] as String?,
      withEvent: json['WithEvent'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final database = this.database;
    final dbUser = this.dbUser;
    final secretManagerArn = this.secretManagerArn;
    final sql = this.sql;
    final sqls = this.sqls;
    final statementName = this.statementName;
    final withEvent = this.withEvent;
    return {
      'Database': database,
      if (dbUser != null) 'DbUser': dbUser,
      if (secretManagerArn != null) 'SecretManagerArn': secretManagerArn,
      if (sql != null) 'Sql': sql,
      if (sqls != null) 'Sqls': sqls,
      if (statementName != null) 'StatementName': statementName,
      if (withEvent != null) 'WithEvent': withEvent,
    };
  }
}

/// These are custom parameters to use when the target is a SageMaker AI Model
/// Building Pipeline that starts based on EventBridge events.
///
/// @nodoc
class SageMakerPipelineParameters {
  /// List of Parameter names and values for SageMaker AI Model Building Pipeline
  /// execution.
  final List<SageMakerPipelineParameter>? pipelineParameterList;

  SageMakerPipelineParameters({
    this.pipelineParameterList,
  });

  factory SageMakerPipelineParameters.fromJson(Map<String, dynamic> json) {
    return SageMakerPipelineParameters(
      pipelineParameterList: (json['PipelineParameterList'] as List?)
          ?.nonNulls
          .map((e) =>
              SageMakerPipelineParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final pipelineParameterList = this.pipelineParameterList;
    return {
      if (pipelineParameterList != null)
        'PipelineParameterList': pipelineParameterList,
    };
  }
}

/// A <code>RetryPolicy</code> object that includes information about the retry
/// policy settings.
///
/// @nodoc
class RetryPolicy {
  /// The maximum amount of time, in seconds, to continue to make retry attempts.
  final int? maximumEventAgeInSeconds;

  /// The maximum number of retry attempts to make before the request fails. Retry
  /// attempts continue until either the maximum number of attempts is made or
  /// until the duration of the <code>MaximumEventAgeInSeconds</code> is met.
  final int? maximumRetryAttempts;

  RetryPolicy({
    this.maximumEventAgeInSeconds,
    this.maximumRetryAttempts,
  });

  factory RetryPolicy.fromJson(Map<String, dynamic> json) {
    return RetryPolicy(
      maximumEventAgeInSeconds: json['MaximumEventAgeInSeconds'] as int?,
      maximumRetryAttempts: json['MaximumRetryAttempts'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final maximumEventAgeInSeconds = this.maximumEventAgeInSeconds;
    final maximumRetryAttempts = this.maximumRetryAttempts;
    return {
      if (maximumEventAgeInSeconds != null)
        'MaximumEventAgeInSeconds': maximumEventAgeInSeconds,
      if (maximumRetryAttempts != null)
        'MaximumRetryAttempts': maximumRetryAttempts,
    };
  }
}

/// Contains the GraphQL operation to be parsed and executed, if the event
/// target is an AppSync API.
///
/// @nodoc
class AppSyncParameters {
  /// The GraphQL operation; that is, the query, mutation, or subscription to be
  /// parsed and executed by the GraphQL service.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/appsync/latest/devguide/graphql-architecture.html#graphql-operations">Operations</a>
  /// in the <i>AppSync User Guide</i>.
  final String? graphQLOperation;

  AppSyncParameters({
    this.graphQLOperation,
  });

  factory AppSyncParameters.fromJson(Map<String, dynamic> json) {
    return AppSyncParameters(
      graphQLOperation: json['GraphQLOperation'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final graphQLOperation = this.graphQLOperation;
    return {
      if (graphQLOperation != null) 'GraphQLOperation': graphQLOperation,
    };
  }
}

/// Name/Value pair of a parameter to start execution of a SageMaker AI Model
/// Building Pipeline.
///
/// @nodoc
class SageMakerPipelineParameter {
  /// Name of parameter to start execution of a SageMaker AI Model Building
  /// Pipeline.
  final String name;

  /// Value of parameter to start execution of a SageMaker AI Model Building
  /// Pipeline.
  final String value;

  SageMakerPipelineParameter({
    required this.name,
    required this.value,
  });

  factory SageMakerPipelineParameter.fromJson(Map<String, dynamic> json) {
    return SageMakerPipelineParameter(
      name: (json['Name'] as String?) ?? '',
      value: (json['Value'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      'Name': name,
      'Value': value,
    };
  }
}

/// The array properties for the submitted job, such as the size of the array.
/// The array size can be between 2 and 10,000. If you specify array properties
/// for a job, it becomes an array job. This parameter is used only if the
/// target is an Batch job.
///
/// @nodoc
class BatchArrayProperties {
  /// The size of the array, if this is an array batch job. Valid values are
  /// integers between 2 and 10,000.
  final int? size;

  BatchArrayProperties({
    this.size,
  });

  factory BatchArrayProperties.fromJson(Map<String, dynamic> json) {
    return BatchArrayProperties(
      size: json['Size'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final size = this.size;
    return {
      if (size != null) 'Size': size,
    };
  }
}

/// The retry strategy to use for failed jobs, if the target is an Batch job. If
/// you specify a retry strategy here, it overrides the retry strategy defined
/// in the job definition.
///
/// @nodoc
class BatchRetryStrategy {
  /// The number of times to attempt to retry, if the job fails. Valid values are
  /// 1–10.
  final int? attempts;

  BatchRetryStrategy({
    this.attempts,
  });

  factory BatchRetryStrategy.fromJson(Map<String, dynamic> json) {
    return BatchRetryStrategy(
      attempts: json['Attempts'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final attempts = this.attempts;
    return {
      if (attempts != null) 'Attempts': attempts,
    };
  }
}

/// @nodoc
class LaunchType {
  static const ec2 = LaunchType._('EC2');
  static const fargate = LaunchType._('FARGATE');
  static const external = LaunchType._('EXTERNAL');

  final String value;

  const LaunchType._(this.value);

  static const values = [ec2, fargate, external];

  static LaunchType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => LaunchType._(value));

  @override
  bool operator ==(other) => other is LaunchType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// This structure specifies the network configuration for an ECS task.
///
/// @nodoc
class NetworkConfiguration {
  /// Use this structure to specify the VPC subnets and security groups for the
  /// task, and whether a public IP address is to be used. This structure is
  /// relevant only for ECS tasks that use the <code>awsvpc</code> network mode.
  final AwsVpcConfiguration? awsvpcConfiguration;

  NetworkConfiguration({
    this.awsvpcConfiguration,
  });

  factory NetworkConfiguration.fromJson(Map<String, dynamic> json) {
    return NetworkConfiguration(
      awsvpcConfiguration: json['awsvpcConfiguration'] != null
          ? AwsVpcConfiguration.fromJson(
              json['awsvpcConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final awsvpcConfiguration = this.awsvpcConfiguration;
    return {
      if (awsvpcConfiguration != null)
        'awsvpcConfiguration': awsvpcConfiguration,
    };
  }
}

/// @nodoc
class PropagateTags {
  static const taskDefinition = PropagateTags._('TASK_DEFINITION');

  final String value;

  const PropagateTags._(this.value);

  static const values = [taskDefinition];

  static PropagateTags fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PropagateTags._(value));

  @override
  bool operator ==(other) => other is PropagateTags && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The task placement strategy for a task or service. To learn more, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-placement-strategies.html">Task
/// Placement Strategies</a> in the Amazon Elastic Container Service Service
/// Developer Guide.
///
/// @nodoc
class PlacementStrategy {
  /// The field to apply the placement strategy against. For the spread placement
  /// strategy, valid values are instanceId (or host, which has the same effect),
  /// or any platform or custom attribute that is applied to a container instance,
  /// such as attribute:ecs.availability-zone. For the binpack placement strategy,
  /// valid values are cpu and memory. For the random placement strategy, this
  /// field is not used.
  final String? field;

  /// The type of placement strategy. The random placement strategy randomly
  /// places tasks on available candidates. The spread placement strategy spreads
  /// placement across available candidates evenly based on the field parameter.
  /// The binpack strategy places tasks on available candidates that have the
  /// least available amount of the resource that is specified with the field
  /// parameter. For example, if you binpack on memory, a task is placed on the
  /// instance with the least amount of remaining memory (but still enough to run
  /// the task).
  final PlacementStrategyType? type;

  PlacementStrategy({
    this.field,
    this.type,
  });

  factory PlacementStrategy.fromJson(Map<String, dynamic> json) {
    return PlacementStrategy(
      field: json['field'] as String?,
      type: (json['type'] as String?)?.let(PlacementStrategyType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final field = this.field;
    final type = this.type;
    return {
      if (field != null) 'field': field,
      if (type != null) 'type': type.value,
    };
  }
}

/// @nodoc
class PlacementStrategyType {
  static const random = PlacementStrategyType._('random');
  static const spread = PlacementStrategyType._('spread');
  static const binpack = PlacementStrategyType._('binpack');

  final String value;

  const PlacementStrategyType._(this.value);

  static const values = [random, spread, binpack];

  static PlacementStrategyType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PlacementStrategyType._(value));

  @override
  bool operator ==(other) =>
      other is PlacementStrategyType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An object representing a constraint on task placement. To learn more, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-placement-constraints.html">Task
/// Placement Constraints</a> in the Amazon Elastic Container Service Developer
/// Guide.
///
/// @nodoc
class PlacementConstraint {
  /// A cluster query language expression to apply to the constraint. You cannot
  /// specify an expression if the constraint type is
  /// <code>distinctInstance</code>. To learn more, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/cluster-query-language.html">Cluster
  /// Query Language</a> in the Amazon Elastic Container Service Developer Guide.
  final String? expression;

  /// The type of constraint. Use distinctInstance to ensure that each task in a
  /// particular group is running on a different container instance. Use memberOf
  /// to restrict the selection to a group of valid candidates.
  final PlacementConstraintType? type;

  PlacementConstraint({
    this.expression,
    this.type,
  });

  factory PlacementConstraint.fromJson(Map<String, dynamic> json) {
    return PlacementConstraint(
      expression: json['expression'] as String?,
      type: (json['type'] as String?)?.let(PlacementConstraintType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final expression = this.expression;
    final type = this.type;
    return {
      if (expression != null) 'expression': expression,
      if (type != null) 'type': type.value,
    };
  }
}

/// @nodoc
class PlacementConstraintType {
  static const distinctInstance = PlacementConstraintType._('distinctInstance');
  static const memberOf = PlacementConstraintType._('memberOf');

  final String value;

  const PlacementConstraintType._(this.value);

  static const values = [distinctInstance, memberOf];

  static PlacementConstraintType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PlacementConstraintType._(value));

  @override
  bool operator ==(other) =>
      other is PlacementConstraintType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The details of a capacity provider strategy. To learn more, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_CapacityProviderStrategyItem.html">CapacityProviderStrategyItem</a>
/// in the Amazon ECS API Reference.
///
/// @nodoc
class CapacityProviderStrategyItem {
  /// The short name of the capacity provider.
  final String capacityProvider;

  /// The base value designates how many tasks, at a minimum, to run on the
  /// specified capacity provider. Only one capacity provider in a capacity
  /// provider strategy can have a base defined. If no value is specified, the
  /// default value of 0 is used.
  final int? base;

  /// The weight value designates the relative percentage of the total number of
  /// tasks launched that should use the specified capacity provider. The weight
  /// value is taken into consideration after the base value, if defined, is
  /// satisfied.
  final int? weight;

  CapacityProviderStrategyItem({
    required this.capacityProvider,
    this.base,
    this.weight,
  });

  factory CapacityProviderStrategyItem.fromJson(Map<String, dynamic> json) {
    return CapacityProviderStrategyItem(
      capacityProvider: (json['capacityProvider'] as String?) ?? '',
      base: json['base'] as int?,
      weight: json['weight'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final capacityProvider = this.capacityProvider;
    final base = this.base;
    final weight = this.weight;
    return {
      'capacityProvider': capacityProvider,
      if (base != null) 'base': base,
      if (weight != null) 'weight': weight,
    };
  }
}

/// This structure specifies the VPC subnets and security groups for the task,
/// and whether a public IP address is to be used. This structure is relevant
/// only for ECS tasks that use the <code>awsvpc</code> network mode.
///
/// @nodoc
class AwsVpcConfiguration {
  /// Specifies the subnets associated with the task. These subnets must all be in
  /// the same VPC. You can specify as many as 16 subnets.
  final List<String> subnets;

  /// Specifies whether the task's elastic network interface receives a public IP
  /// address. You can specify <code>ENABLED</code> only when
  /// <code>LaunchType</code> in <code>EcsParameters</code> is set to
  /// <code>FARGATE</code>.
  final AssignPublicIp? assignPublicIp;

  /// Specifies the security groups associated with the task. These security
  /// groups must all be in the same VPC. You can specify as many as five security
  /// groups. If you do not specify a security group, the default security group
  /// for the VPC is used.
  final List<String>? securityGroups;

  AwsVpcConfiguration({
    required this.subnets,
    this.assignPublicIp,
    this.securityGroups,
  });

  factory AwsVpcConfiguration.fromJson(Map<String, dynamic> json) {
    return AwsVpcConfiguration(
      subnets: ((json['Subnets'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      assignPublicIp:
          (json['AssignPublicIp'] as String?)?.let(AssignPublicIp.fromString),
      securityGroups: (json['SecurityGroups'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final subnets = this.subnets;
    final assignPublicIp = this.assignPublicIp;
    final securityGroups = this.securityGroups;
    return {
      'Subnets': subnets,
      if (assignPublicIp != null) 'AssignPublicIp': assignPublicIp.value,
      if (securityGroups != null) 'SecurityGroups': securityGroups,
    };
  }
}

/// @nodoc
class AssignPublicIp {
  static const enabled = AssignPublicIp._('ENABLED');
  static const disabled = AssignPublicIp._('DISABLED');

  final String value;

  const AssignPublicIp._(this.value);

  static const values = [enabled, disabled];

  static AssignPublicIp fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AssignPublicIp._(value));

  @override
  bool operator ==(other) => other is AssignPublicIp && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information about the EC2 instances that are to be sent the command,
/// specified as key-value pairs. Each <code>RunCommandTarget</code> block can
/// include only one key, but this key may specify multiple values.
///
/// @nodoc
class RunCommandTarget {
  /// Can be either <code>tag:</code> <i>tag-key</i> or <code>InstanceIds</code>.
  final String key;

  /// If <code>Key</code> is <code>tag:</code> <i>tag-key</i>, <code>Values</code>
  /// is a list of tag values. If <code>Key</code> is <code>InstanceIds</code>,
  /// <code>Values</code> is a list of Amazon EC2 instance IDs.
  final List<String> values;

  RunCommandTarget({
    required this.key,
    required this.values,
  });

  factory RunCommandTarget.fromJson(Map<String, dynamic> json) {
    return RunCommandTarget(
      key: (json['Key'] as String?) ?? '',
      values: ((json['Values'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final values = this.values;
    return {
      'Key': key,
      'Values': values,
    };
  }
}

/// @nodoc
class RuleState {
  static const enabled = RuleState._('ENABLED');
  static const disabled = RuleState._('DISABLED');
  static const enabledWithAllCloudtrailManagementEvents =
      RuleState._('ENABLED_WITH_ALL_CLOUDTRAIL_MANAGEMENT_EVENTS');

  final String value;

  const RuleState._(this.value);

  static const values = [
    enabled,
    disabled,
    enabledWithAllCloudtrailManagementEvents
  ];

  static RuleState fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => RuleState._(value));

  @override
  bool operator ==(other) => other is RuleState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A JSON string which you can use to limit the event bus permissions you are
/// granting to only accounts that fulfill the condition. Currently, the only
/// supported condition is membership in a certain Amazon Web Services
/// organization. The string must contain <code>Type</code>, <code>Key</code>,
/// and <code>Value</code> fields. The <code>Value</code> field specifies the ID
/// of the Amazon Web Services organization. Following is an example value for
/// <code>Condition</code>:
///
/// <code>'{"Type" : "StringEquals", "Key": "aws:PrincipalOrgID", "Value":
/// "o-1234567890"}'</code>
///
/// @nodoc
class Condition {
  /// Specifies the key for the condition. Currently the only supported key is
  /// <code>aws:PrincipalOrgID</code>.
  final String key;

  /// Specifies the type of condition. Currently the only supported value is
  /// <code>StringEquals</code>.
  final String type;

  /// Specifies the value for the key. Currently, this must be the ID of the
  /// organization.
  final String value;

  Condition({
    required this.key,
    required this.type,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final key = this.key;
    final type = this.type;
    final value = this.value;
    return {
      'Key': key,
      'Type': type,
      'Value': value,
    };
  }
}

/// The result of an event entry the partner submitted in this request. If the
/// event was successfully submitted, the entry has the event ID in it.
/// Otherwise, you can use the error code and error message to identify the
/// problem with the entry.
///
/// @nodoc
class PutPartnerEventsResultEntry {
  /// The error code that indicates why the event submission failed.
  final String? errorCode;

  /// The error message that explains why the event submission failed.
  final String? errorMessage;

  /// The ID of the event.
  final String? eventId;

  PutPartnerEventsResultEntry({
    this.errorCode,
    this.errorMessage,
    this.eventId,
  });

  factory PutPartnerEventsResultEntry.fromJson(Map<String, dynamic> json) {
    return PutPartnerEventsResultEntry(
      errorCode: json['ErrorCode'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
      eventId: json['EventId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final eventId = this.eventId;
    return {
      if (errorCode != null) 'ErrorCode': errorCode,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (eventId != null) 'EventId': eventId,
    };
  }
}

/// The details about an event generated by an SaaS partner.
///
/// @nodoc
class PutPartnerEventsRequestEntry {
  /// A valid JSON string. There is no other schema imposed. The JSON string may
  /// contain fields and nested sub-objects.
  /// <note>
  /// <code>Detail</code>, <code>DetailType</code>, and <code>Source</code> are
  /// required for EventBridge to successfully send an event to an event bus. If
  /// you include event entries in a request that do not include each of those
  /// properties, EventBridge fails that entry. If you submit a request in which
  /// <i>none</i> of the entries have each of these properties, EventBridge fails
  /// the entire request.
  /// </note>
  final String? detail;

  /// A free-form string, with a maximum of 128 characters, used to decide what
  /// fields to expect in the event detail.
  /// <note>
  /// <code>Detail</code>, <code>DetailType</code>, and <code>Source</code> are
  /// required for EventBridge to successfully send an event to an event bus. If
  /// you include event entries in a request that do not include each of those
  /// properties, EventBridge fails that entry. If you submit a request in which
  /// <i>none</i> of the entries have each of these properties, EventBridge fails
  /// the entire request.
  /// </note>
  final String? detailType;

  /// Amazon Web Services resources, identified by Amazon Resource Name (ARN),
  /// which the event primarily concerns. Any number, including zero, may be
  /// present.
  final List<String>? resources;

  /// The event source that is generating the entry.
  /// <note>
  /// <code>Detail</code>, <code>DetailType</code>, and <code>Source</code> are
  /// required for EventBridge to successfully send an event to an event bus. If
  /// you include event entries in a request that do not include each of those
  /// properties, EventBridge fails that entry. If you submit a request in which
  /// <i>none</i> of the entries have each of these properties, EventBridge fails
  /// the entire request.
  /// </note>
  final String? source;

  /// The date and time of the event.
  final DateTime? time;

  PutPartnerEventsRequestEntry({
    this.detail,
    this.detailType,
    this.resources,
    this.source,
    this.time,
  });

  Map<String, dynamic> toJson() {
    final detail = this.detail;
    final detailType = this.detailType;
    final resources = this.resources;
    final source = this.source;
    final time = this.time;
    return {
      if (detail != null) 'Detail': detail,
      if (detailType != null) 'DetailType': detailType,
      if (resources != null) 'Resources': resources,
      if (source != null) 'Source': source,
      if (time != null) 'Time': unixTimestampToJson(time),
    };
  }
}

/// Represents the results of an event submitted to an event bus.
///
/// If the submission was successful, the entry has the event ID in it.
/// Otherwise, you can use the error code and error message to identify the
/// problem with the entry.
///
/// For information about the errors that are common to all actions, see <a
/// href="https://docs.aws.amazon.com/eventbridge/latest/APIReference/CommonErrors.html">Common
/// Errors</a>.
///
/// @nodoc
class PutEventsResultEntry {
  /// The error code that indicates why the event submission failed.
  ///
  /// Retryable errors include:
  ///
  /// <ul>
  /// <li>
  /// <code> <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/APIReference/CommonErrors.html">InternalFailure</a>
  /// </code>
  ///
  /// The request processing has failed because of an unknown error, exception or
  /// failure.
  /// </li>
  /// <li>
  /// <code> <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/APIReference/CommonErrors.html">ThrottlingException</a>
  /// </code>
  ///
  /// The request was denied due to request throttling.
  /// </li>
  /// </ul>
  /// Non-retryable errors include:
  ///
  /// <ul>
  /// <li>
  /// <code> <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/APIReference/CommonErrors.html">AccessDeniedException</a>
  /// </code>
  ///
  /// You do not have sufficient access to perform this action.
  /// </li>
  /// <li>
  /// <code>InvalidAccountIdException</code>
  ///
  /// The account ID provided is not valid.
  /// </li>
  /// <li>
  /// <code>InvalidArgument</code>
  ///
  /// A specified parameter is not valid.
  /// </li>
  /// <li>
  /// <code>MalformedDetail</code>
  ///
  /// The JSON provided is not valid.
  /// </li>
  /// <li>
  /// <code>RedactionFailure</code>
  ///
  /// Redacting the CloudTrail event failed.
  /// </li>
  /// <li>
  /// <code>NotAuthorizedForSourceException</code>
  ///
  /// You do not have permissions to publish events with this source onto this
  /// event bus.
  /// </li>
  /// <li>
  /// <code>NotAuthorizedForDetailTypeException</code>
  ///
  /// You do not have permissions to publish events with this detail type onto
  /// this event bus.
  /// </li>
  /// </ul>
  final String? errorCode;

  /// The error message that explains why the event submission failed.
  final String? errorMessage;

  /// The ID of the event.
  final String? eventId;

  PutEventsResultEntry({
    this.errorCode,
    this.errorMessage,
    this.eventId,
  });

  factory PutEventsResultEntry.fromJson(Map<String, dynamic> json) {
    return PutEventsResultEntry(
      errorCode: json['ErrorCode'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
      eventId: json['EventId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final eventId = this.eventId;
    return {
      if (errorCode != null) 'ErrorCode': errorCode,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (eventId != null) 'EventId': eventId,
    };
  }
}

/// Represents an event to be submitted.
///
/// @nodoc
class PutEventsRequestEntry {
  /// A valid JSON object. There is no other schema imposed. The JSON object may
  /// contain fields and nested sub-objects.
  /// <note>
  /// <code>Detail</code>, <code>DetailType</code>, and <code>Source</code> are
  /// required for EventBridge to successfully send an event to an event bus. If
  /// you include event entries in a request that do not include each of those
  /// properties, EventBridge fails that entry. If you submit a request in which
  /// <i>none</i> of the entries have each of these properties, EventBridge fails
  /// the entire request.
  /// </note>
  final String? detail;

  /// Free-form string, with a maximum of 128 characters, used to decide what
  /// fields to expect in the event detail.
  /// <note>
  /// <code>Detail</code>, <code>DetailType</code>, and <code>Source</code> are
  /// required for EventBridge to successfully send an event to an event bus. If
  /// you include event entries in a request that do not include each of those
  /// properties, EventBridge fails that entry. If you submit a request in which
  /// <i>none</i> of the entries have each of these properties, EventBridge fails
  /// the entire request.
  /// </note>
  final String? detailType;

  /// The name or ARN of the event bus to receive the event. Only the rules that
  /// are associated with this event bus are used to match the event. If you omit
  /// this, the default event bus is used.
  /// <note>
  /// If you're using a global endpoint with a custom bus, you can enter either
  /// the name or Amazon Resource Name (ARN) of the event bus in either the
  /// primary or secondary Region here. EventBridge then determines the
  /// corresponding event bus in the other Region based on the endpoint referenced
  /// by the <code>EndpointId</code>. Specifying the event bus ARN is preferred.
  /// </note>
  final String? eventBusName;

  /// Amazon Web Services resources, identified by Amazon Resource Name (ARN),
  /// which the event primarily concerns. Any number, including zero, may be
  /// present.
  final List<String>? resources;

  /// The source of the event.
  /// <note>
  /// <code>Detail</code>, <code>DetailType</code>, and <code>Source</code> are
  /// required for EventBridge to successfully send an event to an event bus. If
  /// you include event entries in a request that do not include each of those
  /// properties, EventBridge fails that entry. If you submit a request in which
  /// <i>none</i> of the entries have each of these properties, EventBridge fails
  /// the entire request.
  /// </note>
  final String? source;

  /// The time stamp of the event, per <a
  /// href="https://www.rfc-editor.org/rfc/rfc3339.txt">RFC3339</a>. If no time
  /// stamp is provided, the time stamp of the <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_PutEvents.html">PutEvents</a>
  /// call is used.
  final DateTime? time;

  /// An X-Ray trace header, which is an http header (X-Amzn-Trace-Id) that
  /// contains the trace-id associated with the event.
  ///
  /// To learn more about X-Ray trace headers, see <a
  /// href="https://docs.aws.amazon.com/xray/latest/devguide/xray-concepts.html#xray-concepts-tracingheader">Tracing
  /// header</a> in the X-Ray Developer Guide.
  final String? traceHeader;

  PutEventsRequestEntry({
    this.detail,
    this.detailType,
    this.eventBusName,
    this.resources,
    this.source,
    this.time,
    this.traceHeader,
  });

  Map<String, dynamic> toJson() {
    final detail = this.detail;
    final detailType = this.detailType;
    final eventBusName = this.eventBusName;
    final resources = this.resources;
    final source = this.source;
    final time = this.time;
    final traceHeader = this.traceHeader;
    return {
      if (detail != null) 'Detail': detail,
      if (detailType != null) 'DetailType': detailType,
      if (eventBusName != null) 'EventBusName': eventBusName,
      if (resources != null) 'Resources': resources,
      if (source != null) 'Source': source,
      if (time != null) 'Time': unixTimestampToJson(time),
      if (traceHeader != null) 'TraceHeader': traceHeader,
    };
  }
}

/// Contains information about a rule in Amazon EventBridge.
///
/// @nodoc
class Rule {
  /// The Amazon Resource Name (ARN) of the rule.
  final String? arn;

  /// The description of the rule.
  final String? description;

  /// The name or ARN of the event bus associated with the rule. If you omit this,
  /// the default event bus is used.
  final String? eventBusName;

  /// The event pattern of the rule. For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-and-event-patterns.html">Events
  /// and Event Patterns</a> in the <i> <i>Amazon EventBridge User Guide</i> </i>.
  final String? eventPattern;

  /// If the rule was created on behalf of your account by an Amazon Web Services
  /// service, this field displays the principal name of the service that created
  /// the rule.
  final String? managedBy;

  /// The name of the rule.
  final String? name;

  /// The Amazon Resource Name (ARN) of the role that is used for target
  /// invocation.
  ///
  /// If you're setting an event bus in another account as the target and that
  /// account granted permission to your account through an organization instead
  /// of directly by the account ID, you must specify a <code>RoleArn</code> with
  /// proper permissions in the <code>Target</code> structure, instead of here in
  /// this parameter.
  final String? roleArn;

  /// The scheduling expression. For example, "cron(0 20 * * ? *)", "rate(5
  /// minutes)". For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-create-rule-schedule.html">Creating
  /// an Amazon EventBridge rule that runs on a schedule</a>.
  final String? scheduleExpression;

  /// The state of the rule.
  ///
  /// Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>DISABLED</code>: The rule is disabled. EventBridge does not match any
  /// events against the rule.
  /// </li>
  /// <li>
  /// <code>ENABLED</code>: The rule is enabled. EventBridge matches events
  /// against the rule, <i>except</i> for Amazon Web Services management events
  /// delivered through CloudTrail.
  /// </li>
  /// <li>
  /// <code>ENABLED_WITH_ALL_CLOUDTRAIL_MANAGEMENT_EVENTS</code>: The rule is
  /// enabled for all events, including Amazon Web Services management events
  /// delivered through CloudTrail.
  ///
  /// Management events provide visibility into management operations that are
  /// performed on resources in your Amazon Web Services account. These are also
  /// known as control plane operations. For more information, see <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-management-events-with-cloudtrail.html#logging-management-events">Logging
  /// management events</a> in the <i>CloudTrail User Guide</i>, and <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-service-event.html#eb-service-event-cloudtrail">Filtering
  /// management events from Amazon Web Services services</a> in the <i> <i>Amazon
  /// EventBridge User Guide</i> </i>.
  ///
  /// This value is only valid for rules on the <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-what-is-how-it-works-concepts.html#eb-bus-concepts-buses">default</a>
  /// event bus or <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-create-event-bus.html">custom
  /// event buses</a>. It does not apply to <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-saas.html">partner
  /// event buses</a>.
  /// </li>
  /// </ul>
  final RuleState? state;

  Rule({
    this.arn,
    this.description,
    this.eventBusName,
    this.eventPattern,
    this.managedBy,
    this.name,
    this.roleArn,
    this.scheduleExpression,
    this.state,
  });

  factory Rule.fromJson(Map<String, dynamic> json) {
    return Rule(
      arn: json['Arn'] as String?,
      description: json['Description'] as String?,
      eventBusName: json['EventBusName'] as String?,
      eventPattern: json['EventPattern'] as String?,
      managedBy: json['ManagedBy'] as String?,
      name: json['Name'] as String?,
      roleArn: json['RoleArn'] as String?,
      scheduleExpression: json['ScheduleExpression'] as String?,
      state: (json['State'] as String?)?.let(RuleState.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final description = this.description;
    final eventBusName = this.eventBusName;
    final eventPattern = this.eventPattern;
    final managedBy = this.managedBy;
    final name = this.name;
    final roleArn = this.roleArn;
    final scheduleExpression = this.scheduleExpression;
    final state = this.state;
    return {
      if (arn != null) 'Arn': arn,
      if (description != null) 'Description': description,
      if (eventBusName != null) 'EventBusName': eventBusName,
      if (eventPattern != null) 'EventPattern': eventPattern,
      if (managedBy != null) 'ManagedBy': managedBy,
      if (name != null) 'Name': name,
      if (roleArn != null) 'RoleArn': roleArn,
      if (scheduleExpression != null) 'ScheduleExpression': scheduleExpression,
      if (state != null) 'State': state.value,
    };
  }
}

/// A <code>Replay</code> object that contains details about a replay.
///
/// @nodoc
class Replay {
  /// A time stamp for the time to start replaying events. Any event with a
  /// creation time prior to the <code>EventEndTime</code> specified is replayed.
  final DateTime? eventEndTime;

  /// A time stamp for the time that the last event was replayed.
  final DateTime? eventLastReplayedTime;

  /// The ARN of the archive to replay event from.
  final String? eventSourceArn;

  /// A time stamp for the time to start replaying events. This is determined by
  /// the time in the event as described in <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_PutEventsRequestEntry.html#eventbridge-Type-PutEventsRequestEntry-Time">Time</a>.
  final DateTime? eventStartTime;

  /// A time stamp for the time that the replay completed.
  final DateTime? replayEndTime;

  /// The name of the replay.
  final String? replayName;

  /// A time stamp for the time that the replay started.
  final DateTime? replayStartTime;

  /// The current state of the replay.
  final ReplayState? state;

  /// A description of why the replay is in the current state.
  final String? stateReason;

  Replay({
    this.eventEndTime,
    this.eventLastReplayedTime,
    this.eventSourceArn,
    this.eventStartTime,
    this.replayEndTime,
    this.replayName,
    this.replayStartTime,
    this.state,
    this.stateReason,
  });

  factory Replay.fromJson(Map<String, dynamic> json) {
    return Replay(
      eventEndTime: timeStampFromJson(json['EventEndTime']),
      eventLastReplayedTime: timeStampFromJson(json['EventLastReplayedTime']),
      eventSourceArn: json['EventSourceArn'] as String?,
      eventStartTime: timeStampFromJson(json['EventStartTime']),
      replayEndTime: timeStampFromJson(json['ReplayEndTime']),
      replayName: json['ReplayName'] as String?,
      replayStartTime: timeStampFromJson(json['ReplayStartTime']),
      state: (json['State'] as String?)?.let(ReplayState.fromString),
      stateReason: json['StateReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventEndTime = this.eventEndTime;
    final eventLastReplayedTime = this.eventLastReplayedTime;
    final eventSourceArn = this.eventSourceArn;
    final eventStartTime = this.eventStartTime;
    final replayEndTime = this.replayEndTime;
    final replayName = this.replayName;
    final replayStartTime = this.replayStartTime;
    final state = this.state;
    final stateReason = this.stateReason;
    return {
      if (eventEndTime != null)
        'EventEndTime': unixTimestampToJson(eventEndTime),
      if (eventLastReplayedTime != null)
        'EventLastReplayedTime': unixTimestampToJson(eventLastReplayedTime),
      if (eventSourceArn != null) 'EventSourceArn': eventSourceArn,
      if (eventStartTime != null)
        'EventStartTime': unixTimestampToJson(eventStartTime),
      if (replayEndTime != null)
        'ReplayEndTime': unixTimestampToJson(replayEndTime),
      if (replayName != null) 'ReplayName': replayName,
      if (replayStartTime != null)
        'ReplayStartTime': unixTimestampToJson(replayStartTime),
      if (state != null) 'State': state.value,
      if (stateReason != null) 'StateReason': stateReason,
    };
  }
}

/// A partner event source is created by an SaaS partner. If a customer creates
/// a partner event bus that matches this event source, that Amazon Web Services
/// account can receive events from the partner's applications or services.
///
/// @nodoc
class PartnerEventSource {
  /// The ARN of the partner event source.
  final String? arn;

  /// The name of the partner event source.
  final String? name;

  PartnerEventSource({
    this.arn,
    this.name,
  });

  factory PartnerEventSource.fromJson(Map<String, dynamic> json) {
    return PartnerEventSource(
      arn: json['Arn'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    return {
      if (arn != null) 'Arn': arn,
      if (name != null) 'Name': name,
    };
  }
}

/// The Amazon Web Services account that a partner event source has been offered
/// to.
///
/// @nodoc
class PartnerEventSourceAccount {
  /// The Amazon Web Services account ID that the partner event source was offered
  /// to.
  final String? account;

  /// The date and time the event source was created.
  final DateTime? creationTime;

  /// The date and time that the event source will expire, if the Amazon Web
  /// Services account doesn't create a matching event bus for it.
  final DateTime? expirationTime;

  /// The state of the event source. If it is ACTIVE, you have already created a
  /// matching event bus for this event source, and that event bus is active. If
  /// it is PENDING, either you haven't yet created a matching event bus, or that
  /// event bus is deactivated. If it is DELETED, you have created a matching
  /// event bus, but the event source has since been deleted.
  final EventSourceState? state;

  PartnerEventSourceAccount({
    this.account,
    this.creationTime,
    this.expirationTime,
    this.state,
  });

  factory PartnerEventSourceAccount.fromJson(Map<String, dynamic> json) {
    return PartnerEventSourceAccount(
      account: json['Account'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      expirationTime: timeStampFromJson(json['ExpirationTime']),
      state: (json['State'] as String?)?.let(EventSourceState.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final account = this.account;
    final creationTime = this.creationTime;
    final expirationTime = this.expirationTime;
    final state = this.state;
    return {
      if (account != null) 'Account': account,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (expirationTime != null)
        'ExpirationTime': unixTimestampToJson(expirationTime),
      if (state != null) 'State': state.value,
    };
  }
}

/// @nodoc
class EventSourceState {
  static const pending = EventSourceState._('PENDING');
  static const active = EventSourceState._('ACTIVE');
  static const deleted = EventSourceState._('DELETED');

  final String value;

  const EventSourceState._(this.value);

  static const values = [pending, active, deleted];

  static EventSourceState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EventSourceState._(value));

  @override
  bool operator ==(other) => other is EventSourceState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A partner event source is created by an SaaS partner. If a customer creates
/// a partner event bus that matches this event source, that Amazon Web Services
/// account can receive events from the partner's applications or services.
///
/// @nodoc
class EventSource {
  /// The ARN of the event source.
  final String? arn;

  /// The name of the partner that created the event source.
  final String? createdBy;

  /// The date and time the event source was created.
  final DateTime? creationTime;

  /// The date and time that the event source will expire, if the Amazon Web
  /// Services account doesn't create a matching event bus for it.
  final DateTime? expirationTime;

  /// The name of the event source.
  final String? name;

  /// The state of the event source. If it is ACTIVE, you have already created a
  /// matching event bus for this event source, and that event bus is active. If
  /// it is PENDING, either you haven't yet created a matching event bus, or that
  /// event bus is deactivated. If it is DELETED, you have created a matching
  /// event bus, but the event source has since been deleted.
  final EventSourceState? state;

  EventSource({
    this.arn,
    this.createdBy,
    this.creationTime,
    this.expirationTime,
    this.name,
    this.state,
  });

  factory EventSource.fromJson(Map<String, dynamic> json) {
    return EventSource(
      arn: json['Arn'] as String?,
      createdBy: json['CreatedBy'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      expirationTime: timeStampFromJson(json['ExpirationTime']),
      name: json['Name'] as String?,
      state: (json['State'] as String?)?.let(EventSourceState.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdBy = this.createdBy;
    final creationTime = this.creationTime;
    final expirationTime = this.expirationTime;
    final name = this.name;
    final state = this.state;
    return {
      if (arn != null) 'Arn': arn,
      if (createdBy != null) 'CreatedBy': createdBy,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (expirationTime != null)
        'ExpirationTime': unixTimestampToJson(expirationTime),
      if (name != null) 'Name': name,
      if (state != null) 'State': state.value,
    };
  }
}

/// An event bus receives events from a source, uses rules to evaluate them,
/// applies any configured input transformation, and routes them to the
/// appropriate target(s). Your account's default event bus receives events from
/// Amazon Web Services services. A custom event bus can receive events from
/// your custom applications and services. A partner event bus receives events
/// from an event source created by an SaaS partner. These events come from the
/// partners services or applications.
///
/// @nodoc
class EventBus {
  /// The ARN of the event bus.
  final String? arn;

  /// The time the event bus was created.
  final DateTime? creationTime;

  /// The event bus description.
  final String? description;

  /// The time the event bus was last modified.
  final DateTime? lastModifiedTime;

  /// The name of the event bus.
  final String? name;

  /// The permissions policy of the event bus, describing which other Amazon Web
  /// Services accounts can write events to this event bus.
  final String? policy;

  EventBus({
    this.arn,
    this.creationTime,
    this.description,
    this.lastModifiedTime,
    this.name,
    this.policy,
  });

  factory EventBus.fromJson(Map<String, dynamic> json) {
    return EventBus(
      arn: json['Arn'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      description: json['Description'] as String?,
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      name: json['Name'] as String?,
      policy: json['Policy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final description = this.description;
    final lastModifiedTime = this.lastModifiedTime;
    final name = this.name;
    final policy = this.policy;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (description != null) 'Description': description,
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (name != null) 'Name': name,
      if (policy != null) 'Policy': policy,
    };
  }
}

/// A global endpoint used to improve your application's availability by making
/// it regional-fault tolerant. For more information about global endpoints, see
/// <a
/// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-global-endpoints.html">Making
/// applications Regional-fault tolerant with global endpoints and event
/// replication</a> in the <i> <i>Amazon EventBridge User Guide</i> </i>.
///
/// @nodoc
class Endpoint {
  /// The ARN of the endpoint.
  final String? arn;

  /// The time the endpoint was created.
  final DateTime? creationTime;

  /// A description for the endpoint.
  final String? description;

  /// The URL subdomain of the endpoint. For example, if the URL for Endpoint is
  /// https://abcde.veo.endpoints.event.amazonaws.com, then the EndpointId is
  /// <code>abcde.veo</code>.
  final String? endpointId;

  /// The URL of the endpoint.
  final String? endpointUrl;

  /// The event buses being used by the endpoint.
  final List<EndpointEventBus>? eventBuses;

  /// The last time the endpoint was modified.
  final DateTime? lastModifiedTime;

  /// The name of the endpoint.
  final String? name;

  /// Whether event replication was enabled or disabled for this endpoint. The
  /// default state is <code>ENABLED</code> which means you must supply a
  /// <code>RoleArn</code>. If you don't have a <code>RoleArn</code> or you don't
  /// want event replication enabled, set the state to <code>DISABLED</code>.
  final ReplicationConfig? replicationConfig;

  /// The ARN of the role used by event replication for the endpoint.
  final String? roleArn;

  /// The routing configuration of the endpoint.
  final RoutingConfig? routingConfig;

  /// The current state of the endpoint.
  final EndpointState? state;

  /// The reason the endpoint is in its current state.
  final String? stateReason;

  Endpoint({
    this.arn,
    this.creationTime,
    this.description,
    this.endpointId,
    this.endpointUrl,
    this.eventBuses,
    this.lastModifiedTime,
    this.name,
    this.replicationConfig,
    this.roleArn,
    this.routingConfig,
    this.state,
    this.stateReason,
  });

  factory Endpoint.fromJson(Map<String, dynamic> json) {
    return Endpoint(
      arn: json['Arn'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      description: json['Description'] as String?,
      endpointId: json['EndpointId'] as String?,
      endpointUrl: json['EndpointUrl'] as String?,
      eventBuses: (json['EventBuses'] as List?)
          ?.nonNulls
          .map((e) => EndpointEventBus.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      name: json['Name'] as String?,
      replicationConfig: json['ReplicationConfig'] != null
          ? ReplicationConfig.fromJson(
              json['ReplicationConfig'] as Map<String, dynamic>)
          : null,
      roleArn: json['RoleArn'] as String?,
      routingConfig: json['RoutingConfig'] != null
          ? RoutingConfig.fromJson(
              json['RoutingConfig'] as Map<String, dynamic>)
          : null,
      state: (json['State'] as String?)?.let(EndpointState.fromString),
      stateReason: json['StateReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final description = this.description;
    final endpointId = this.endpointId;
    final endpointUrl = this.endpointUrl;
    final eventBuses = this.eventBuses;
    final lastModifiedTime = this.lastModifiedTime;
    final name = this.name;
    final replicationConfig = this.replicationConfig;
    final roleArn = this.roleArn;
    final routingConfig = this.routingConfig;
    final state = this.state;
    final stateReason = this.stateReason;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (description != null) 'Description': description,
      if (endpointId != null) 'EndpointId': endpointId,
      if (endpointUrl != null) 'EndpointUrl': endpointUrl,
      if (eventBuses != null) 'EventBuses': eventBuses,
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (name != null) 'Name': name,
      if (replicationConfig != null) 'ReplicationConfig': replicationConfig,
      if (roleArn != null) 'RoleArn': roleArn,
      if (routingConfig != null) 'RoutingConfig': routingConfig,
      if (state != null) 'State': state.value,
      if (stateReason != null) 'StateReason': stateReason,
    };
  }
}

/// Contains information about a connection.
///
/// @nodoc
class Connection {
  /// The authorization type specified for the connection.
  /// <note>
  /// OAUTH tokens are refreshed when a 401 or 407 response is returned.
  /// </note>
  final ConnectionAuthorizationType? authorizationType;

  /// The ARN of the connection.
  final String? connectionArn;

  /// The state of the connection.
  final ConnectionState? connectionState;

  /// A time stamp for the time that the connection was created.
  final DateTime? creationTime;

  /// A time stamp for the time that the connection was last authorized.
  final DateTime? lastAuthorizedTime;

  /// A time stamp for the time that the connection was last modified.
  final DateTime? lastModifiedTime;

  /// The name of the connection.
  final String? name;

  /// The reason that the connection is in the connection state.
  final String? stateReason;

  Connection({
    this.authorizationType,
    this.connectionArn,
    this.connectionState,
    this.creationTime,
    this.lastAuthorizedTime,
    this.lastModifiedTime,
    this.name,
    this.stateReason,
  });

  factory Connection.fromJson(Map<String, dynamic> json) {
    return Connection(
      authorizationType: (json['AuthorizationType'] as String?)
          ?.let(ConnectionAuthorizationType.fromString),
      connectionArn: json['ConnectionArn'] as String?,
      connectionState:
          (json['ConnectionState'] as String?)?.let(ConnectionState.fromString),
      creationTime: timeStampFromJson(json['CreationTime']),
      lastAuthorizedTime: timeStampFromJson(json['LastAuthorizedTime']),
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      name: json['Name'] as String?,
      stateReason: json['StateReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final authorizationType = this.authorizationType;
    final connectionArn = this.connectionArn;
    final connectionState = this.connectionState;
    final creationTime = this.creationTime;
    final lastAuthorizedTime = this.lastAuthorizedTime;
    final lastModifiedTime = this.lastModifiedTime;
    final name = this.name;
    final stateReason = this.stateReason;
    return {
      if (authorizationType != null)
        'AuthorizationType': authorizationType.value,
      if (connectionArn != null) 'ConnectionArn': connectionArn,
      if (connectionState != null) 'ConnectionState': connectionState.value,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (lastAuthorizedTime != null)
        'LastAuthorizedTime': unixTimestampToJson(lastAuthorizedTime),
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (name != null) 'Name': name,
      if (stateReason != null) 'StateReason': stateReason,
    };
  }
}

/// An <code>Archive</code> object that contains details about an archive.
///
/// @nodoc
class Archive {
  /// The name of the archive.
  final String? archiveName;

  /// The time stamp for the time that the archive was created.
  final DateTime? creationTime;

  /// The number of events in the archive.
  final int? eventCount;

  /// The ARN of the event bus associated with the archive. Only events from this
  /// event bus are sent to the archive.
  final String? eventSourceArn;

  /// The number of days to retain events in the archive before they are deleted.
  final int? retentionDays;

  /// The size of the archive, in bytes.
  final int? sizeBytes;

  /// The current state of the archive.
  final ArchiveState? state;

  /// A description for the reason that the archive is in the current state.
  final String? stateReason;

  Archive({
    this.archiveName,
    this.creationTime,
    this.eventCount,
    this.eventSourceArn,
    this.retentionDays,
    this.sizeBytes,
    this.state,
    this.stateReason,
  });

  factory Archive.fromJson(Map<String, dynamic> json) {
    return Archive(
      archiveName: json['ArchiveName'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      eventCount: json['EventCount'] as int?,
      eventSourceArn: json['EventSourceArn'] as String?,
      retentionDays: json['RetentionDays'] as int?,
      sizeBytes: json['SizeBytes'] as int?,
      state: (json['State'] as String?)?.let(ArchiveState.fromString),
      stateReason: json['StateReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final archiveName = this.archiveName;
    final creationTime = this.creationTime;
    final eventCount = this.eventCount;
    final eventSourceArn = this.eventSourceArn;
    final retentionDays = this.retentionDays;
    final sizeBytes = this.sizeBytes;
    final state = this.state;
    final stateReason = this.stateReason;
    return {
      if (archiveName != null) 'ArchiveName': archiveName,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (eventCount != null) 'EventCount': eventCount,
      if (eventSourceArn != null) 'EventSourceArn': eventSourceArn,
      if (retentionDays != null) 'RetentionDays': retentionDays,
      if (sizeBytes != null) 'SizeBytes': sizeBytes,
      if (state != null) 'State': state.value,
      if (stateReason != null) 'StateReason': stateReason,
    };
  }
}

/// Contains details about an API destination.
///
/// @nodoc
class ApiDestination {
  /// The ARN of the API destination.
  final String? apiDestinationArn;

  /// The state of the API destination.
  final ApiDestinationState? apiDestinationState;

  /// The ARN of the connection specified for the API destination.
  final String? connectionArn;

  /// A time stamp for the time that the API destination was created.
  final DateTime? creationTime;

  /// The method to use to connect to the HTTP endpoint.
  final ApiDestinationHttpMethod? httpMethod;

  /// The URL to the endpoint for the API destination.
  final String? invocationEndpoint;

  /// The maximum number of invocations per second to send to the HTTP endpoint.
  final int? invocationRateLimitPerSecond;

  /// A time stamp for the time that the API destination was last modified.
  final DateTime? lastModifiedTime;

  /// The name of the API destination.
  final String? name;

  ApiDestination({
    this.apiDestinationArn,
    this.apiDestinationState,
    this.connectionArn,
    this.creationTime,
    this.httpMethod,
    this.invocationEndpoint,
    this.invocationRateLimitPerSecond,
    this.lastModifiedTime,
    this.name,
  });

  factory ApiDestination.fromJson(Map<String, dynamic> json) {
    return ApiDestination(
      apiDestinationArn: json['ApiDestinationArn'] as String?,
      apiDestinationState: (json['ApiDestinationState'] as String?)
          ?.let(ApiDestinationState.fromString),
      connectionArn: json['ConnectionArn'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      httpMethod: (json['HttpMethod'] as String?)
          ?.let(ApiDestinationHttpMethod.fromString),
      invocationEndpoint: json['InvocationEndpoint'] as String?,
      invocationRateLimitPerSecond:
          json['InvocationRateLimitPerSecond'] as int?,
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final apiDestinationArn = this.apiDestinationArn;
    final apiDestinationState = this.apiDestinationState;
    final connectionArn = this.connectionArn;
    final creationTime = this.creationTime;
    final httpMethod = this.httpMethod;
    final invocationEndpoint = this.invocationEndpoint;
    final invocationRateLimitPerSecond = this.invocationRateLimitPerSecond;
    final lastModifiedTime = this.lastModifiedTime;
    final name = this.name;
    return {
      if (apiDestinationArn != null) 'ApiDestinationArn': apiDestinationArn,
      if (apiDestinationState != null)
        'ApiDestinationState': apiDestinationState.value,
      if (connectionArn != null) 'ConnectionArn': connectionArn,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (httpMethod != null) 'HttpMethod': httpMethod.value,
      if (invocationEndpoint != null) 'InvocationEndpoint': invocationEndpoint,
      if (invocationRateLimitPerSecond != null)
        'InvocationRateLimitPerSecond': invocationRateLimitPerSecond,
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (name != null) 'Name': name,
    };
  }
}

/// If the connection uses a private OAuth endpoint, the parameters for
/// EventBridge to use when authenticating against the endpoint.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-target-connection-auth.html">Authorization
/// methods for connections</a> in the <i> <i>Amazon EventBridge User Guide</i>
/// </i>.
///
/// @nodoc
class DescribeConnectionConnectivityParameters {
  /// The parameters for EventBridge to use when invoking the resource endpoint.
  final DescribeConnectionResourceParameters resourceParameters;

  DescribeConnectionConnectivityParameters({
    required this.resourceParameters,
  });

  factory DescribeConnectionConnectivityParameters.fromJson(
      Map<String, dynamic> json) {
    return DescribeConnectionConnectivityParameters(
      resourceParameters: DescribeConnectionResourceParameters.fromJson(
          (json['ResourceParameters'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceParameters = this.resourceParameters;
    return {
      'ResourceParameters': resourceParameters,
    };
  }
}

/// Tthe authorization parameters to use for the connection.
///
/// @nodoc
class ConnectionAuthResponseParameters {
  /// The API Key parameters to use for authorization.
  final ConnectionApiKeyAuthResponseParameters? apiKeyAuthParameters;

  /// The authorization parameters for Basic authorization.
  final ConnectionBasicAuthResponseParameters? basicAuthParameters;

  /// For private OAuth authentication endpoints. The parameters EventBridge uses
  /// to authenticate against the endpoint.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-target-connection-auth.html">Authorization
  /// methods for connections</a> in the <i> <i>Amazon EventBridge User Guide</i>
  /// </i>.
  final DescribeConnectionConnectivityParameters? connectivityParameters;

  /// Additional parameters for the connection that are passed through with every
  /// invocation to the HTTP endpoint.
  final ConnectionHttpParameters? invocationHttpParameters;

  /// The OAuth parameters to use for authorization.
  final ConnectionOAuthResponseParameters? oAuthParameters;

  ConnectionAuthResponseParameters({
    this.apiKeyAuthParameters,
    this.basicAuthParameters,
    this.connectivityParameters,
    this.invocationHttpParameters,
    this.oAuthParameters,
  });

  factory ConnectionAuthResponseParameters.fromJson(Map<String, dynamic> json) {
    return ConnectionAuthResponseParameters(
      apiKeyAuthParameters: json['ApiKeyAuthParameters'] != null
          ? ConnectionApiKeyAuthResponseParameters.fromJson(
              json['ApiKeyAuthParameters'] as Map<String, dynamic>)
          : null,
      basicAuthParameters: json['BasicAuthParameters'] != null
          ? ConnectionBasicAuthResponseParameters.fromJson(
              json['BasicAuthParameters'] as Map<String, dynamic>)
          : null,
      connectivityParameters: json['ConnectivityParameters'] != null
          ? DescribeConnectionConnectivityParameters.fromJson(
              json['ConnectivityParameters'] as Map<String, dynamic>)
          : null,
      invocationHttpParameters: json['InvocationHttpParameters'] != null
          ? ConnectionHttpParameters.fromJson(
              json['InvocationHttpParameters'] as Map<String, dynamic>)
          : null,
      oAuthParameters: json['OAuthParameters'] != null
          ? ConnectionOAuthResponseParameters.fromJson(
              json['OAuthParameters'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final apiKeyAuthParameters = this.apiKeyAuthParameters;
    final basicAuthParameters = this.basicAuthParameters;
    final connectivityParameters = this.connectivityParameters;
    final invocationHttpParameters = this.invocationHttpParameters;
    final oAuthParameters = this.oAuthParameters;
    return {
      if (apiKeyAuthParameters != null)
        'ApiKeyAuthParameters': apiKeyAuthParameters,
      if (basicAuthParameters != null)
        'BasicAuthParameters': basicAuthParameters,
      if (connectivityParameters != null)
        'ConnectivityParameters': connectivityParameters,
      if (invocationHttpParameters != null)
        'InvocationHttpParameters': invocationHttpParameters,
      if (oAuthParameters != null) 'OAuthParameters': oAuthParameters,
    };
  }
}

/// The authorization parameters for the connection if Basic is specified as the
/// authorization type.
///
/// @nodoc
class ConnectionBasicAuthResponseParameters {
  /// The user name to use for Basic authorization.
  final String? username;

  ConnectionBasicAuthResponseParameters({
    this.username,
  });

  factory ConnectionBasicAuthResponseParameters.fromJson(
      Map<String, dynamic> json) {
    return ConnectionBasicAuthResponseParameters(
      username: json['Username'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final username = this.username;
    return {
      if (username != null) 'Username': username,
    };
  }
}

/// The response parameters when OAuth is specified as the authorization type.
///
/// @nodoc
class ConnectionOAuthResponseParameters {
  /// The URL to the HTTP endpoint that authorized the request.
  final String? authorizationEndpoint;

  /// Details about the client parameters returned when OAuth is specified as the
  /// authorization type.
  final ConnectionOAuthClientResponseParameters? clientParameters;

  /// The method used to connect to the HTTP endpoint.
  final ConnectionOAuthHttpMethod? httpMethod;

  /// The additional HTTP parameters used for the OAuth authorization request.
  final ConnectionHttpParameters? oAuthHttpParameters;

  ConnectionOAuthResponseParameters({
    this.authorizationEndpoint,
    this.clientParameters,
    this.httpMethod,
    this.oAuthHttpParameters,
  });

  factory ConnectionOAuthResponseParameters.fromJson(
      Map<String, dynamic> json) {
    return ConnectionOAuthResponseParameters(
      authorizationEndpoint: json['AuthorizationEndpoint'] as String?,
      clientParameters: json['ClientParameters'] != null
          ? ConnectionOAuthClientResponseParameters.fromJson(
              json['ClientParameters'] as Map<String, dynamic>)
          : null,
      httpMethod: (json['HttpMethod'] as String?)
          ?.let(ConnectionOAuthHttpMethod.fromString),
      oAuthHttpParameters: json['OAuthHttpParameters'] != null
          ? ConnectionHttpParameters.fromJson(
              json['OAuthHttpParameters'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final authorizationEndpoint = this.authorizationEndpoint;
    final clientParameters = this.clientParameters;
    final httpMethod = this.httpMethod;
    final oAuthHttpParameters = this.oAuthHttpParameters;
    return {
      if (authorizationEndpoint != null)
        'AuthorizationEndpoint': authorizationEndpoint,
      if (clientParameters != null) 'ClientParameters': clientParameters,
      if (httpMethod != null) 'HttpMethod': httpMethod.value,
      if (oAuthHttpParameters != null)
        'OAuthHttpParameters': oAuthHttpParameters,
    };
  }
}

/// Contains the authorization parameters for the connection if API Key is
/// specified as the authorization type.
///
/// @nodoc
class ConnectionApiKeyAuthResponseParameters {
  /// The name of the header to use for the <code>APIKeyValue</code> used for
  /// authorization.
  final String? apiKeyName;

  ConnectionApiKeyAuthResponseParameters({
    this.apiKeyName,
  });

  factory ConnectionApiKeyAuthResponseParameters.fromJson(
      Map<String, dynamic> json) {
    return ConnectionApiKeyAuthResponseParameters(
      apiKeyName: json['ApiKeyName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final apiKeyName = this.apiKeyName;
    return {
      if (apiKeyName != null) 'ApiKeyName': apiKeyName,
    };
  }
}

/// The client response parameters for the connection when OAuth is specified as
/// the authorization type.
///
/// @nodoc
class ConnectionOAuthClientResponseParameters {
  /// The client ID associated with the response to the connection request.
  final String? clientID;

  ConnectionOAuthClientResponseParameters({
    this.clientID,
  });

  factory ConnectionOAuthClientResponseParameters.fromJson(
      Map<String, dynamic> json) {
    return ConnectionOAuthClientResponseParameters(
      clientID: json['ClientID'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientID = this.clientID;
    return {
      if (clientID != null) 'ClientID': clientID,
    };
  }
}

/// The parameters for EventBridge to use when invoking the resource endpoint.
///
/// @nodoc
class DescribeConnectionResourceParameters {
  /// For connections to private APIs, the Amazon Resource Name (ARN) of the
  /// resource association EventBridge created between the connection and the
  /// private API's resource configuration.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/connection-private.html#connection-private-snra">
  /// Managing service network resource associations for connections</a> in the
  /// <i> <i>Amazon EventBridge User Guide</i> </i>.
  final String resourceAssociationArn;

  /// The Amazon Resource Name (ARN) of the resource configuration for the private
  /// API.
  final String resourceConfigurationArn;

  DescribeConnectionResourceParameters({
    required this.resourceAssociationArn,
    required this.resourceConfigurationArn,
  });

  factory DescribeConnectionResourceParameters.fromJson(
      Map<String, dynamic> json) {
    return DescribeConnectionResourceParameters(
      resourceAssociationArn: (json['ResourceAssociationArn'] as String?) ?? '',
      resourceConfigurationArn:
          (json['ResourceConfigurationArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final resourceAssociationArn = this.resourceAssociationArn;
    final resourceConfigurationArn = this.resourceConfigurationArn;
    return {
      'ResourceAssociationArn': resourceAssociationArn,
      'ResourceConfigurationArn': resourceConfigurationArn,
    };
  }
}

/// The authorization parameters for the connection.
///
/// You must include only authorization parameters for the
/// <code>AuthorizationType</code> you specify.
///
/// @nodoc
class CreateConnectionAuthRequestParameters {
  /// The API key authorization parameters to use for the connection.
  final CreateConnectionApiKeyAuthRequestParameters? apiKeyAuthParameters;

  /// The Basic authorization parameters to use for the connection.
  final CreateConnectionBasicAuthRequestParameters? basicAuthParameters;

  /// If you specify a private OAuth endpoint, the parameters for EventBridge to
  /// use when authenticating against the endpoint.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-target-connection-auth.html">Authorization
  /// methods for connections</a> in the <i> <i>Amazon EventBridge User Guide</i>
  /// </i>.
  final ConnectivityResourceParameters? connectivityParameters;

  /// The API key authorization parameters to use for the connection. Note that if
  /// you include additional parameters for the target of a rule via
  /// <code>HttpParameters</code>, including query strings, the parameters added
  /// for the connection take precedence.
  final ConnectionHttpParameters? invocationHttpParameters;

  /// The OAuth authorization parameters to use for the connection.
  final CreateConnectionOAuthRequestParameters? oAuthParameters;

  CreateConnectionAuthRequestParameters({
    this.apiKeyAuthParameters,
    this.basicAuthParameters,
    this.connectivityParameters,
    this.invocationHttpParameters,
    this.oAuthParameters,
  });

  Map<String, dynamic> toJson() {
    final apiKeyAuthParameters = this.apiKeyAuthParameters;
    final basicAuthParameters = this.basicAuthParameters;
    final connectivityParameters = this.connectivityParameters;
    final invocationHttpParameters = this.invocationHttpParameters;
    final oAuthParameters = this.oAuthParameters;
    return {
      if (apiKeyAuthParameters != null)
        'ApiKeyAuthParameters': apiKeyAuthParameters,
      if (basicAuthParameters != null)
        'BasicAuthParameters': basicAuthParameters,
      if (connectivityParameters != null)
        'ConnectivityParameters': connectivityParameters,
      if (invocationHttpParameters != null)
        'InvocationHttpParameters': invocationHttpParameters,
      if (oAuthParameters != null) 'OAuthParameters': oAuthParameters,
    };
  }
}

/// Contains the Basic authorization parameters to use for the connection.
///
/// @nodoc
class CreateConnectionBasicAuthRequestParameters {
  /// The password associated with the user name to use for Basic authorization.
  final String password;

  /// The user name to use for Basic authorization.
  final String username;

  CreateConnectionBasicAuthRequestParameters({
    required this.password,
    required this.username,
  });

  Map<String, dynamic> toJson() {
    final password = this.password;
    final username = this.username;
    return {
      'Password': password,
      'Username': username,
    };
  }
}

/// Contains the OAuth authorization parameters to use for the connection.
///
/// @nodoc
class CreateConnectionOAuthRequestParameters {
  /// The URL to the authorization endpoint when OAuth is specified as the
  /// authorization type.
  final String authorizationEndpoint;

  /// The client parameters for OAuth authorization.
  final CreateConnectionOAuthClientRequestParameters clientParameters;

  /// The method to use for the authorization request.
  final ConnectionOAuthHttpMethod httpMethod;

  /// Details about the additional parameters to use for the connection.
  final ConnectionHttpParameters? oAuthHttpParameters;

  CreateConnectionOAuthRequestParameters({
    required this.authorizationEndpoint,
    required this.clientParameters,
    required this.httpMethod,
    this.oAuthHttpParameters,
  });

  Map<String, dynamic> toJson() {
    final authorizationEndpoint = this.authorizationEndpoint;
    final clientParameters = this.clientParameters;
    final httpMethod = this.httpMethod;
    final oAuthHttpParameters = this.oAuthHttpParameters;
    return {
      'AuthorizationEndpoint': authorizationEndpoint,
      'ClientParameters': clientParameters,
      'HttpMethod': httpMethod.value,
      if (oAuthHttpParameters != null)
        'OAuthHttpParameters': oAuthHttpParameters,
    };
  }
}

/// The API key authorization parameters for the connection.
///
/// @nodoc
class CreateConnectionApiKeyAuthRequestParameters {
  /// The name of the API key to use for authorization.
  final String apiKeyName;

  /// The value for the API key to use for authorization.
  final String apiKeyValue;

  CreateConnectionApiKeyAuthRequestParameters({
    required this.apiKeyName,
    required this.apiKeyValue,
  });

  Map<String, dynamic> toJson() {
    final apiKeyName = this.apiKeyName;
    final apiKeyValue = this.apiKeyValue;
    return {
      'ApiKeyName': apiKeyName,
      'ApiKeyValue': apiKeyValue,
    };
  }
}

/// The Basic authorization parameters to use for the connection.
///
/// @nodoc
class CreateConnectionOAuthClientRequestParameters {
  /// The client ID to use for OAuth authorization for the connection.
  final String clientID;

  /// The client secret associated with the client ID to use for OAuth
  /// authorization for the connection.
  final String clientSecret;

  CreateConnectionOAuthClientRequestParameters({
    required this.clientID,
    required this.clientSecret,
  });

  Map<String, dynamic> toJson() {
    final clientID = this.clientID;
    final clientSecret = this.clientSecret;
    return {
      'ClientID': clientID,
      'ClientSecret': clientSecret,
    };
  }
}

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

/// @nodoc
class ConcurrentModificationException extends _s.GenericAwsException {
  ConcurrentModificationException({String? type, String? message})
      : super(
            type: type,
            code: 'ConcurrentModificationException',
            message: message);
}

/// @nodoc
class IllegalStatusException extends _s.GenericAwsException {
  IllegalStatusException({String? type, String? message})
      : super(type: type, code: 'IllegalStatusException', message: message);
}

/// @nodoc
class InternalException extends _s.GenericAwsException {
  InternalException({String? type, String? message})
      : super(type: type, code: 'InternalException', message: message);
}

/// @nodoc
class InvalidEventPatternException extends _s.GenericAwsException {
  InvalidEventPatternException({String? type, String? message})
      : super(
            type: type, code: 'InvalidEventPatternException', message: message);
}

/// @nodoc
class InvalidStateException extends _s.GenericAwsException {
  InvalidStateException({String? type, String? message})
      : super(type: type, code: 'InvalidStateException', message: message);
}

/// @nodoc
class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

/// @nodoc
class ManagedRuleException extends _s.GenericAwsException {
  ManagedRuleException({String? type, String? message})
      : super(type: type, code: 'ManagedRuleException', message: message);
}

/// @nodoc
class OperationDisabledException extends _s.GenericAwsException {
  OperationDisabledException({String? type, String? message})
      : super(type: type, code: 'OperationDisabledException', message: message);
}

/// @nodoc
class PolicyLengthExceededException extends _s.GenericAwsException {
  PolicyLengthExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'PolicyLengthExceededException',
            message: message);
}

/// @nodoc
class ResourceAlreadyExistsException extends _s.GenericAwsException {
  ResourceAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceAlreadyExistsException',
            message: message);
}

/// @nodoc
class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

/// @nodoc
class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ConcurrentModificationException': (type, message) =>
      ConcurrentModificationException(type: type, message: message),
  'IllegalStatusException': (type, message) =>
      IllegalStatusException(type: type, message: message),
  'InternalException': (type, message) =>
      InternalException(type: type, message: message),
  'InvalidEventPatternException': (type, message) =>
      InvalidEventPatternException(type: type, message: message),
  'InvalidStateException': (type, message) =>
      InvalidStateException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'ManagedRuleException': (type, message) =>
      ManagedRuleException(type: type, message: message),
  'OperationDisabledException': (type, message) =>
      OperationDisabledException(type: type, message: message),
  'PolicyLengthExceededException': (type, message) =>
      PolicyLengthExceededException(type: type, message: message),
  'ResourceAlreadyExistsException': (type, message) =>
      ResourceAlreadyExistsException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
};
