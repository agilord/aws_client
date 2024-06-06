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
class CloudWatchEvents {
  final _s.JsonProtocol _protocol;
  CloudWatchEvents({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'events',
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

  /// Activates a partner event source that has been deactivated. Once
  /// activated, your matching event bus will start receiving events from the
  /// event source.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConcurrentModificationException].
  /// May throw [InvalidStateException].
  /// May throw [InternalException].
  /// May throw [OperationDisabledException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ConcurrentModificationException].
  /// May throw [IllegalStatusException].
  /// May throw [InternalException].
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
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InternalException].
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
        'HttpMethod': httpMethod.toValue(),
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
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidEventPatternException].
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
  /// Parameter [retentionDays] :
  /// The number of days to retain events for. Default value is 0. If set to 0,
  /// events are retained indefinitely
  Future<CreateArchiveResponse> createArchive({
    required String archiveName,
    required String eventSourceArn,
    String? description,
    String? eventPattern,
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
        if (retentionDays != null) 'RetentionDays': retentionDays,
      },
    );

    return CreateArchiveResponse.fromJson(jsonResponse.body);
  }

  /// Creates a connection. A connection defines the authorization type and
  /// credentials to use for authorization with an API destination HTTP
  /// endpoint.
  ///
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [InternalException].
  ///
  /// Parameter [authParameters] :
  /// A <code>CreateConnectionAuthRequestParameters</code> object that contains
  /// the authorization parameters to use to authorize with the endpoint.
  ///
  /// Parameter [authorizationType] :
  /// The type of authorization to use for the connection.
  ///
  /// Parameter [name] :
  /// The name for the connection to create.
  ///
  /// Parameter [description] :
  /// A description for the connection to create.
  Future<CreateConnectionResponse> createConnection({
    required CreateConnectionAuthRequestParameters authParameters,
    required ConnectionAuthorizationType authorizationType,
    required String name,
    String? description,
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
        'AuthorizationType': authorizationType.toValue(),
        'Name': name,
        if (description != null) 'Description': description,
      },
    );

    return CreateConnectionResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new event bus within your account. This can be a custom event
  /// bus which you can use to receive events from your custom applications and
  /// services, or it can be a partner event bus which can be matched to a
  /// partner event source.
  ///
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidStateException].
  /// May throw [InternalException].
  /// May throw [ConcurrentModificationException].
  /// May throw [LimitExceededException].
  /// May throw [OperationDisabledException].
  ///
  /// Parameter [name] :
  /// The name of the new event bus.
  ///
  /// Event bus names cannot contain the / character. You can't use the name
  /// <code>default</code> for a custom event bus, as this name is already used
  /// for your account's default event bus.
  ///
  /// If this is a partner event bus, the name must exactly match the name of
  /// the partner event source that this event bus is matched to.
  ///
  /// Parameter [eventSourceName] :
  /// If you are creating a partner event bus, this specifies the partner event
  /// source that the new event bus will be matched with.
  ///
  /// Parameter [tags] :
  /// Tags to associate with the event bus.
  Future<CreateEventBusResponse> createEventBus({
    required String name,
    String? eventSourceName,
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
        if (eventSourceName != null) 'EventSourceName': eventSourceName,
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
  /// <i>partner_name</i> is determined during partner registration and
  /// identifies the partner to Amazon Web Services customers.
  /// <i>event_namespace</i> is determined by the partner and is a way for the
  /// partner to categorize their events. <i>event_name</i> is determined by the
  /// partner, and should uniquely identify an event-generating resource within
  /// the partner system. The combination of <i>event_namespace</i> and
  /// <i>event_name</i> should help Amazon Web Services customers decide whether
  /// to create an event bus to receive these events.
  ///
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [InternalException].
  /// May throw [ConcurrentModificationException].
  /// May throw [LimitExceededException].
  /// May throw [OperationDisabledException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ConcurrentModificationException].
  /// May throw [InvalidStateException].
  /// May throw [InternalException].
  /// May throw [OperationDisabledException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalException].
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

  /// Deletes the specified custom event bus or partner event bus. All rules
  /// associated with this event bus need to be deleted. You can't delete your
  /// account's default event bus.
  ///
  /// May throw [InternalException].
  /// May throw [ConcurrentModificationException].
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
  /// <p/>
  ///
  /// May throw [InternalException].
  /// May throw [ConcurrentModificationException].
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
  /// May throw [ManagedRuleException].
  /// May throw [InternalException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalException].
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
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalException].
  /// May throw [OperationDisabledException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalException].
  /// May throw [OperationDisabledException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ManagedRuleException].
  /// May throw [InternalException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ManagedRuleException].
  /// May throw [InternalException].
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
  /// The token returned by a previous call to retrieve the next set of results.
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalException].
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
  /// The token returned by a previous call to retrieve the next set of results.
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
        if (state != null) 'State': state.toValue(),
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
  /// The token returned by a previous call to retrieve the next set of results.
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
        if (connectionState != null)
          'ConnectionState': connectionState.toValue(),
        if (limit != null) 'Limit': limit,
        if (namePrefix != null) 'NamePrefix': namePrefix,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListConnectionsResponse.fromJson(jsonResponse.body);
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
  /// The token returned by a previous call to retrieve the next set of results.
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
  /// The token returned by a previous call to retrieve the next set of results.
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalException].
  /// May throw [OperationDisabledException].
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
  /// The token returned by a previous call to this operation. Specifying this
  /// retrieves the next set of results.
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
  /// The token returned by a previous call to this operation. Specifying this
  /// retrieves the next set of results.
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
  /// The token returned by a previous call to retrieve the next set of results.
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
        if (state != null) 'State': state.toValue(),
      },
    );

    return ListReplaysResponse.fromJson(jsonResponse.body);
  }

  /// Lists the rules for the specified target. You can see which of the rules
  /// in Amazon EventBridge can invoke a specific target in your account.
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
  /// The token returned by a previous call to retrieve the next set of results.
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
  /// The token returned by a previous call to retrieve the next set of results.
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalException].
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
  /// The token returned by a previous call to retrieve the next set of results.
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
  /// May throw [InternalException].
  ///
  /// Parameter [entries] :
  /// The entry that defines an event in your system. You can specify several
  /// parameters for the entry such as the source and type of the event,
  /// resources associated with the event, and so on.
  Future<PutEventsResponse> putEvents({
    required List<PutEventsRequestEntry> entries,
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
      },
    );

    return PutEventsResponse.fromJson(jsonResponse.body);
  }

  /// This is used by SaaS partners to write events to a customer's partner
  /// event bus. Amazon Web Services customers do not use this operation.
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
  /// specified <i>event bus</i>. Amazon EventBridge (CloudWatch Events) rules
  /// in your account are triggered by these events arriving to an event bus in
  /// your account.
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
  /// May throw [ResourceNotFoundException].
  /// May throw [PolicyLengthExceededException].
  /// May throw [InternalException].
  /// May throw [ConcurrentModificationException].
  /// May throw [OperationDisabledException].
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
  /// May throw [InvalidEventPatternException].
  /// May throw [LimitExceededException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ManagedRuleException].
  /// May throw [InternalException].
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
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-and-event-patterns.html">Events
  /// and Event Patterns</a> in the <i>Amazon EventBridge User Guide</i>.
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
  /// Indicates whether the rule is enabled or disabled.
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
        if (state != null) 'State': state.toValue(),
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
  /// You can configure the following as targets for Events:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-api-destinations.html">API
  /// destination</a>
  /// </li>
  /// <li>
  /// Amazon API Gateway REST API endpoints
  /// </li>
  /// <li>
  /// API Gateway
  /// </li>
  /// <li>
  /// Batch job queue
  /// </li>
  /// <li>
  /// CloudWatch Logs group
  /// </li>
  /// <li>
  /// CodeBuild project
  /// </li>
  /// <li>
  /// CodePipeline
  /// </li>
  /// <li>
  /// Amazon EC2 <code>CreateSnapshot</code> API call
  /// </li>
  /// <li>
  /// Amazon EC2 <code>RebootInstances</code> API call
  /// </li>
  /// <li>
  /// Amazon EC2 <code>StopInstances</code> API call
  /// </li>
  /// <li>
  /// Amazon EC2 <code>TerminateInstances</code> API call
  /// </li>
  /// <li>
  /// Amazon ECS tasks
  /// </li>
  /// <li>
  /// Event bus in a different Amazon Web Services account or Region.
  ///
  /// You can use an event bus in the US East (N. Virginia) us-east-1, US West
  /// (Oregon) us-west-2, or Europe (Ireland) eu-west-1 Regions as a target for
  /// a rule.
  /// </li>
  /// <li>
  /// Firehose delivery stream (Kinesis Data Firehose)
  /// </li>
  /// <li>
  /// Inspector assessment template (Amazon Inspector)
  /// </li>
  /// <li>
  /// Kinesis stream (Kinesis Data Stream)
  /// </li>
  /// <li>
  /// Lambda function
  /// </li>
  /// <li>
  /// Redshift clusters (Data API statement execution)
  /// </li>
  /// <li>
  /// Amazon SNS topic
  /// </li>
  /// <li>
  /// Amazon SQS queues (includes FIFO queues
  /// </li>
  /// <li>
  /// SSM Automation
  /// </li>
  /// <li>
  /// SSM OpsItem
  /// </li>
  /// <li>
  /// SSM Run Command
  /// </li>
  /// <li>
  /// Step Functions state machines
  /// </li>
  /// </ul>
  /// Creating rules with built-in targets is supported only in the Amazon Web
  /// Services Management Console. The built-in targets are <code>EC2
  /// CreateSnapshot API call</code>, <code>EC2 RebootInstances API call</code>,
  /// <code>EC2 StopInstances API call</code>, and <code>EC2 TerminateInstances
  /// API call</code>.
  ///
  /// For some target types, <code>PutTargets</code> provides target-specific
  /// parameters. If the target is a Kinesis data stream, you can optionally
  /// specify which shard the event goes to by using the
  /// <code>KinesisParameters</code> argument. To invoke a command on multiple
  /// EC2 instances with one rule, you can use the
  /// <code>RunCommandParameters</code> field.
  ///
  /// To be able to make API calls against the resources that you own, Amazon
  /// EventBridge needs the appropriate permissions. For Lambda and Amazon SNS
  /// resources, EventBridge relies on resource-based policies. For EC2
  /// instances, Kinesis Data Streams, Step Functions state machines and API
  /// Gateway REST APIs, EventBridge relies on IAM roles that you specify in the
  /// <code>RoleARN</code> argument in <code>PutTargets</code>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/auth-and-access-control-eventbridge.html">Authentication
  /// and Access Control</a> in the <i>Amazon EventBridge User Guide</i>.
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
  ///
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ConcurrentModificationException].
  /// May throw [LimitExceededException].
  /// May throw [ManagedRuleException].
  /// May throw [InternalException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalException].
  /// May throw [ConcurrentModificationException].
  /// May throw [OperationDisabledException].
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
  ///
  /// When you remove a target, when the associated rule triggers, removed
  /// targets might continue to be invoked. Allow a short period of time for
  /// changes to take effect.
  ///
  /// This action can partially fail if too many requests are made at the same
  /// time. If that happens, <code>FailedEntryCount</code> is non-zero in the
  /// response and each entry in <code>FailedEntries</code> provides the ID of
  /// the failed target and the error code.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ManagedRuleException].
  /// May throw [InternalException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [InvalidEventPatternException].
  /// May throw [LimitExceededException].
  /// May throw [InternalException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ConcurrentModificationException].
  /// May throw [InternalException].
  /// May throw [ManagedRuleException].
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
  /// May throw [InvalidEventPatternException].
  /// May throw [InternalException].
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
  /// and Event Patterns</a> in the <i>Amazon EventBridge User Guide</i>.
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
  /// Amazon EventBridge (CloudWatch Events), rules and event buses can be
  /// tagged.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ManagedRuleException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalException].
  /// May throw [LimitExceededException].
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
        if (httpMethod != null) 'HttpMethod': httpMethod.toValue(),
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidEventPatternException].
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
  /// Parameter [retentionDays] :
  /// The number of days to retain events in the archive.
  Future<UpdateArchiveResponse> updateArchive({
    required String archiveName,
    String? description,
    String? eventPattern,
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
        if (retentionDays != null) 'RetentionDays': retentionDays,
      },
    );

    return UpdateArchiveResponse.fromJson(jsonResponse.body);
  }

  /// Updates settings for a connection.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalException].
  /// May throw [LimitExceededException].
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
  Future<UpdateConnectionResponse> updateConnection({
    required String name,
    UpdateConnectionAuthRequestParameters? authParameters,
    ConnectionAuthorizationType? authorizationType,
    String? description,
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
          'AuthorizationType': authorizationType.toValue(),
        if (description != null) 'Description': description,
      },
    );

    return UpdateConnectionResponse.fromJson(jsonResponse.body);
  }
}

/// Contains details about an API destination.
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
      apiDestinationState:
          (json['ApiDestinationState'] as String?)?.toApiDestinationState(),
      connectionArn: json['ConnectionArn'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      httpMethod: (json['HttpMethod'] as String?)?.toApiDestinationHttpMethod(),
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
        'ApiDestinationState': apiDestinationState.toValue(),
      if (connectionArn != null) 'ConnectionArn': connectionArn,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (httpMethod != null) 'HttpMethod': httpMethod.toValue(),
      if (invocationEndpoint != null) 'InvocationEndpoint': invocationEndpoint,
      if (invocationRateLimitPerSecond != null)
        'InvocationRateLimitPerSecond': invocationRateLimitPerSecond,
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (name != null) 'Name': name,
    };
  }
}

enum ApiDestinationHttpMethod {
  post,
  get,
  head,
  options,
  put,
  patch,
  delete,
}

extension ApiDestinationHttpMethodValueExtension on ApiDestinationHttpMethod {
  String toValue() {
    switch (this) {
      case ApiDestinationHttpMethod.post:
        return 'POST';
      case ApiDestinationHttpMethod.get:
        return 'GET';
      case ApiDestinationHttpMethod.head:
        return 'HEAD';
      case ApiDestinationHttpMethod.options:
        return 'OPTIONS';
      case ApiDestinationHttpMethod.put:
        return 'PUT';
      case ApiDestinationHttpMethod.patch:
        return 'PATCH';
      case ApiDestinationHttpMethod.delete:
        return 'DELETE';
    }
  }
}

extension ApiDestinationHttpMethodFromString on String {
  ApiDestinationHttpMethod toApiDestinationHttpMethod() {
    switch (this) {
      case 'POST':
        return ApiDestinationHttpMethod.post;
      case 'GET':
        return ApiDestinationHttpMethod.get;
      case 'HEAD':
        return ApiDestinationHttpMethod.head;
      case 'OPTIONS':
        return ApiDestinationHttpMethod.options;
      case 'PUT':
        return ApiDestinationHttpMethod.put;
      case 'PATCH':
        return ApiDestinationHttpMethod.patch;
      case 'DELETE':
        return ApiDestinationHttpMethod.delete;
    }
    throw Exception('$this is not known in enum ApiDestinationHttpMethod');
  }
}

enum ApiDestinationState {
  active,
  inactive,
}

extension ApiDestinationStateValueExtension on ApiDestinationState {
  String toValue() {
    switch (this) {
      case ApiDestinationState.active:
        return 'ACTIVE';
      case ApiDestinationState.inactive:
        return 'INACTIVE';
    }
  }
}

extension ApiDestinationStateFromString on String {
  ApiDestinationState toApiDestinationState() {
    switch (this) {
      case 'ACTIVE':
        return ApiDestinationState.active;
      case 'INACTIVE':
        return ApiDestinationState.inactive;
    }
    throw Exception('$this is not known in enum ApiDestinationState');
  }
}

/// An <code>Archive</code> object that contains details about an archive.
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
      state: (json['State'] as String?)?.toArchiveState(),
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
      if (state != null) 'State': state.toValue(),
      if (stateReason != null) 'StateReason': stateReason,
    };
  }
}

enum ArchiveState {
  enabled,
  disabled,
  creating,
  updating,
  createFailed,
  updateFailed,
}

extension ArchiveStateValueExtension on ArchiveState {
  String toValue() {
    switch (this) {
      case ArchiveState.enabled:
        return 'ENABLED';
      case ArchiveState.disabled:
        return 'DISABLED';
      case ArchiveState.creating:
        return 'CREATING';
      case ArchiveState.updating:
        return 'UPDATING';
      case ArchiveState.createFailed:
        return 'CREATE_FAILED';
      case ArchiveState.updateFailed:
        return 'UPDATE_FAILED';
    }
  }
}

extension ArchiveStateFromString on String {
  ArchiveState toArchiveState() {
    switch (this) {
      case 'ENABLED':
        return ArchiveState.enabled;
      case 'DISABLED':
        return ArchiveState.disabled;
      case 'CREATING':
        return ArchiveState.creating;
      case 'UPDATING':
        return ArchiveState.updating;
      case 'CREATE_FAILED':
        return ArchiveState.createFailed;
      case 'UPDATE_FAILED':
        return ArchiveState.updateFailed;
    }
    throw Exception('$this is not known in enum ArchiveState');
  }
}

enum AssignPublicIp {
  enabled,
  disabled,
}

extension AssignPublicIpValueExtension on AssignPublicIp {
  String toValue() {
    switch (this) {
      case AssignPublicIp.enabled:
        return 'ENABLED';
      case AssignPublicIp.disabled:
        return 'DISABLED';
    }
  }
}

extension AssignPublicIpFromString on String {
  AssignPublicIp toAssignPublicIp() {
    switch (this) {
      case 'ENABLED':
        return AssignPublicIp.enabled;
      case 'DISABLED':
        return AssignPublicIp.disabled;
    }
    throw Exception('$this is not known in enum AssignPublicIp');
  }
}

/// This structure specifies the VPC subnets and security groups for the task,
/// and whether a public IP address is to be used. This structure is relevant
/// only for ECS tasks that use the <code>awsvpc</code> network mode.
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
      subnets: (json['Subnets'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      assignPublicIp: (json['AssignPublicIp'] as String?)?.toAssignPublicIp(),
      securityGroups: (json['SecurityGroups'] as List?)
          ?.whereNotNull()
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
      if (assignPublicIp != null) 'AssignPublicIp': assignPublicIp.toValue(),
      if (securityGroups != null) 'SecurityGroups': securityGroups,
    };
  }
}

/// The array properties for the submitted job, such as the size of the array.
/// The array size can be between 2 and 10,000. If you specify array properties
/// for a job, it becomes an array job. This parameter is used only if the
/// target is an Batch job.
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

/// The custom parameters to be used when the target is an Batch job.
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
      jobDefinition: json['JobDefinition'] as String,
      jobName: json['JobName'] as String,
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

/// The retry strategy to use for failed jobs, if the target is an Batch job. If
/// you specify a retry strategy here, it overrides the retry strategy defined
/// in the job definition.
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
      state: (json['State'] as String?)?.toReplayState(),
      stateReason: json['StateReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final replayArn = this.replayArn;
    final state = this.state;
    final stateReason = this.stateReason;
    return {
      if (replayArn != null) 'ReplayArn': replayArn,
      if (state != null) 'State': state.toValue(),
      if (stateReason != null) 'StateReason': stateReason,
    };
  }
}

/// The details of a capacity provider strategy. To learn more, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_CapacityProviderStrategyItem.html">CapacityProviderStrategyItem</a>
/// in the Amazon ECS API Reference.
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
      capacityProvider: json['capacityProvider'] as String,
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

/// Contains information about a connection.
class Connection {
  /// The authorization type specified for the connection.
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
          ?.toConnectionAuthorizationType(),
      connectionArn: json['ConnectionArn'] as String?,
      connectionState:
          (json['ConnectionState'] as String?)?.toConnectionState(),
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
        'AuthorizationType': authorizationType.toValue(),
      if (connectionArn != null) 'ConnectionArn': connectionArn,
      if (connectionState != null) 'ConnectionState': connectionState.toValue(),
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

/// Contains the authorization parameters for the connection if API Key is
/// specified as the authorization type.
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

/// Contains the authorization parameters to use for the connection.
class ConnectionAuthResponseParameters {
  /// The API Key parameters to use for authorization.
  final ConnectionApiKeyAuthResponseParameters? apiKeyAuthParameters;

  /// The authorization parameters for Basic authorization.
  final ConnectionBasicAuthResponseParameters? basicAuthParameters;

  /// Additional parameters for the connection that are passed through with every
  /// invocation to the HTTP endpoint.
  final ConnectionHttpParameters? invocationHttpParameters;

  /// The OAuth parameters to use for authorization.
  final ConnectionOAuthResponseParameters? oAuthParameters;

  ConnectionAuthResponseParameters({
    this.apiKeyAuthParameters,
    this.basicAuthParameters,
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
    final invocationHttpParameters = this.invocationHttpParameters;
    final oAuthParameters = this.oAuthParameters;
    return {
      if (apiKeyAuthParameters != null)
        'ApiKeyAuthParameters': apiKeyAuthParameters,
      if (basicAuthParameters != null)
        'BasicAuthParameters': basicAuthParameters,
      if (invocationHttpParameters != null)
        'InvocationHttpParameters': invocationHttpParameters,
      if (oAuthParameters != null) 'OAuthParameters': oAuthParameters,
    };
  }
}

enum ConnectionAuthorizationType {
  basic,
  oauthClientCredentials,
  apiKey,
}

extension ConnectionAuthorizationTypeValueExtension
    on ConnectionAuthorizationType {
  String toValue() {
    switch (this) {
      case ConnectionAuthorizationType.basic:
        return 'BASIC';
      case ConnectionAuthorizationType.oauthClientCredentials:
        return 'OAUTH_CLIENT_CREDENTIALS';
      case ConnectionAuthorizationType.apiKey:
        return 'API_KEY';
    }
  }
}

extension ConnectionAuthorizationTypeFromString on String {
  ConnectionAuthorizationType toConnectionAuthorizationType() {
    switch (this) {
      case 'BASIC':
        return ConnectionAuthorizationType.basic;
      case 'OAUTH_CLIENT_CREDENTIALS':
        return ConnectionAuthorizationType.oauthClientCredentials;
      case 'API_KEY':
        return ConnectionAuthorizationType.apiKey;
    }
    throw Exception('$this is not known in enum ConnectionAuthorizationType');
  }
}

/// Contains the authorization parameters for the connection if Basic is
/// specified as the authorization type.
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

/// Additional parameter included in the body. You can include up to 100
/// additional body parameters per request. An event payload cannot exceed 64
/// KB.
class ConnectionBodyParameter {
  /// Specified whether the value is secret.
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

/// Additional parameter included in the header. You can include up to 100
/// additional header parameters per request. An event payload cannot exceed 64
/// KB.
class ConnectionHeaderParameter {
  /// Specified whether the value is a secret.
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

/// Contains additional parameters for the connection.
class ConnectionHttpParameters {
  /// Contains additional body string parameters for the connection.
  final List<ConnectionBodyParameter>? bodyParameters;

  /// Contains additional header parameters for the connection.
  final List<ConnectionHeaderParameter>? headerParameters;

  /// Contains additional query string parameters for the connection.
  final List<ConnectionQueryStringParameter>? queryStringParameters;

  ConnectionHttpParameters({
    this.bodyParameters,
    this.headerParameters,
    this.queryStringParameters,
  });

  factory ConnectionHttpParameters.fromJson(Map<String, dynamic> json) {
    return ConnectionHttpParameters(
      bodyParameters: (json['BodyParameters'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ConnectionBodyParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
      headerParameters: (json['HeaderParameters'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ConnectionHeaderParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
      queryStringParameters: (json['QueryStringParameters'] as List?)
          ?.whereNotNull()
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

/// Contains the client response parameters for the connection when OAuth is
/// specified as the authorization type.
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

enum ConnectionOAuthHttpMethod {
  get,
  post,
  put,
}

extension ConnectionOAuthHttpMethodValueExtension on ConnectionOAuthHttpMethod {
  String toValue() {
    switch (this) {
      case ConnectionOAuthHttpMethod.get:
        return 'GET';
      case ConnectionOAuthHttpMethod.post:
        return 'POST';
      case ConnectionOAuthHttpMethod.put:
        return 'PUT';
    }
  }
}

extension ConnectionOAuthHttpMethodFromString on String {
  ConnectionOAuthHttpMethod toConnectionOAuthHttpMethod() {
    switch (this) {
      case 'GET':
        return ConnectionOAuthHttpMethod.get;
      case 'POST':
        return ConnectionOAuthHttpMethod.post;
      case 'PUT':
        return ConnectionOAuthHttpMethod.put;
    }
    throw Exception('$this is not known in enum ConnectionOAuthHttpMethod');
  }
}

/// Contains the response parameters when OAuth is specified as the
/// authorization type.
class ConnectionOAuthResponseParameters {
  /// The URL to the HTTP endpoint that authorized the request.
  final String? authorizationEndpoint;

  /// A <code>ConnectionOAuthClientResponseParameters</code> object that contains
  /// details about the client parameters returned when OAuth is specified as the
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
      httpMethod:
          (json['HttpMethod'] as String?)?.toConnectionOAuthHttpMethod(),
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
      if (httpMethod != null) 'HttpMethod': httpMethod.toValue(),
      if (oAuthHttpParameters != null)
        'OAuthHttpParameters': oAuthHttpParameters,
    };
  }
}

/// Additional query string parameter for the connection. You can include up to
/// 100 additional query string parameters per request. Each additional
/// parameter counts towards the event payload size, which cannot exceed 64 KB.
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

enum ConnectionState {
  creating,
  updating,
  deleting,
  authorized,
  deauthorized,
  authorizing,
  deauthorizing,
}

extension ConnectionStateValueExtension on ConnectionState {
  String toValue() {
    switch (this) {
      case ConnectionState.creating:
        return 'CREATING';
      case ConnectionState.updating:
        return 'UPDATING';
      case ConnectionState.deleting:
        return 'DELETING';
      case ConnectionState.authorized:
        return 'AUTHORIZED';
      case ConnectionState.deauthorized:
        return 'DEAUTHORIZED';
      case ConnectionState.authorizing:
        return 'AUTHORIZING';
      case ConnectionState.deauthorizing:
        return 'DEAUTHORIZING';
    }
  }
}

extension ConnectionStateFromString on String {
  ConnectionState toConnectionState() {
    switch (this) {
      case 'CREATING':
        return ConnectionState.creating;
      case 'UPDATING':
        return ConnectionState.updating;
      case 'DELETING':
        return ConnectionState.deleting;
      case 'AUTHORIZED':
        return ConnectionState.authorized;
      case 'DEAUTHORIZED':
        return ConnectionState.deauthorized;
      case 'AUTHORIZING':
        return ConnectionState.authorizing;
      case 'DEAUTHORIZING':
        return ConnectionState.deauthorizing;
    }
    throw Exception('$this is not known in enum ConnectionState');
  }
}

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
      apiDestinationState:
          (json['ApiDestinationState'] as String?)?.toApiDestinationState(),
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
        'ApiDestinationState': apiDestinationState.toValue(),
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
    };
  }
}

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
      state: (json['State'] as String?)?.toArchiveState(),
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
      if (state != null) 'State': state.toValue(),
      if (stateReason != null) 'StateReason': stateReason,
    };
  }
}

/// Contains the API key authorization parameters for the connection.
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

/// Contains the authorization parameters for the connection.
class CreateConnectionAuthRequestParameters {
  /// A <code>CreateConnectionApiKeyAuthRequestParameters</code> object that
  /// contains the API key authorization parameters to use for the connection.
  final CreateConnectionApiKeyAuthRequestParameters? apiKeyAuthParameters;

  /// A <code>CreateConnectionBasicAuthRequestParameters</code> object that
  /// contains the Basic authorization parameters to use for the connection.
  final CreateConnectionBasicAuthRequestParameters? basicAuthParameters;

  /// A <code>ConnectionHttpParameters</code> object that contains the API key
  /// authorization parameters to use for the connection. Note that if you include
  /// additional parameters for the target of a rule via
  /// <code>HttpParameters</code>, including query strings, the parameters added
  /// for the connection take precedence.
  final ConnectionHttpParameters? invocationHttpParameters;

  /// A <code>CreateConnectionOAuthRequestParameters</code> object that contains
  /// the OAuth authorization parameters to use for the connection.
  final CreateConnectionOAuthRequestParameters? oAuthParameters;

  CreateConnectionAuthRequestParameters({
    this.apiKeyAuthParameters,
    this.basicAuthParameters,
    this.invocationHttpParameters,
    this.oAuthParameters,
  });

  Map<String, dynamic> toJson() {
    final apiKeyAuthParameters = this.apiKeyAuthParameters;
    final basicAuthParameters = this.basicAuthParameters;
    final invocationHttpParameters = this.invocationHttpParameters;
    final oAuthParameters = this.oAuthParameters;
    return {
      if (apiKeyAuthParameters != null)
        'ApiKeyAuthParameters': apiKeyAuthParameters,
      if (basicAuthParameters != null)
        'BasicAuthParameters': basicAuthParameters,
      if (invocationHttpParameters != null)
        'InvocationHttpParameters': invocationHttpParameters,
      if (oAuthParameters != null) 'OAuthParameters': oAuthParameters,
    };
  }
}

/// Contains the Basic authorization parameters to use for the connection.
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

/// Contains the Basic authorization parameters to use for the connection.
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

/// Contains the OAuth authorization parameters to use for the connection.
class CreateConnectionOAuthRequestParameters {
  /// The URL to the authorization endpoint when OAuth is specified as the
  /// authorization type.
  final String authorizationEndpoint;

  /// A <code>CreateConnectionOAuthClientRequestParameters</code> object that
  /// contains the client parameters for OAuth authorization.
  final CreateConnectionOAuthClientRequestParameters clientParameters;

  /// The method to use for the authorization request.
  final ConnectionOAuthHttpMethod httpMethod;

  /// A <code>ConnectionHttpParameters</code> object that contains details about
  /// the additional parameters to use for the connection.
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
      'HttpMethod': httpMethod.toValue(),
      if (oAuthHttpParameters != null)
        'OAuthHttpParameters': oAuthHttpParameters,
    };
  }
}

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
          (json['ConnectionState'] as String?)?.toConnectionState(),
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
      if (connectionState != null) 'ConnectionState': connectionState.toValue(),
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
    };
  }
}

class CreateEventBusResponse {
  /// The ARN of the new event bus.
  final String? eventBusArn;

  CreateEventBusResponse({
    this.eventBusArn,
  });

  factory CreateEventBusResponse.fromJson(Map<String, dynamic> json) {
    return CreateEventBusResponse(
      eventBusArn: json['EventBusArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventBusArn = this.eventBusArn;
    return {
      if (eventBusArn != null) 'EventBusArn': eventBusArn,
    };
  }
}

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

/// A <code>DeadLetterConfig</code> object that contains information about a
/// dead-letter queue configuration.
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
          (json['ConnectionState'] as String?)?.toConnectionState(),
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
      if (connectionState != null) 'ConnectionState': connectionState.toValue(),
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (lastAuthorizedTime != null)
        'LastAuthorizedTime': unixTimestampToJson(lastAuthorizedTime),
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
    };
  }
}

class DeleteApiDestinationResponse {
  DeleteApiDestinationResponse();

  factory DeleteApiDestinationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteApiDestinationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteArchiveResponse {
  DeleteArchiveResponse();

  factory DeleteArchiveResponse.fromJson(Map<String, dynamic> _) {
    return DeleteArchiveResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

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
          (json['ConnectionState'] as String?)?.toConnectionState(),
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
      if (connectionState != null) 'ConnectionState': connectionState.toValue(),
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (lastAuthorizedTime != null)
        'LastAuthorizedTime': unixTimestampToJson(lastAuthorizedTime),
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
    };
  }
}

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
      apiDestinationState:
          (json['ApiDestinationState'] as String?)?.toApiDestinationState(),
      connectionArn: json['ConnectionArn'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      description: json['Description'] as String?,
      httpMethod: (json['HttpMethod'] as String?)?.toApiDestinationHttpMethod(),
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
        'ApiDestinationState': apiDestinationState.toValue(),
      if (connectionArn != null) 'ConnectionArn': connectionArn,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (description != null) 'Description': description,
      if (httpMethod != null) 'HttpMethod': httpMethod.toValue(),
      if (invocationEndpoint != null) 'InvocationEndpoint': invocationEndpoint,
      if (invocationRateLimitPerSecond != null)
        'InvocationRateLimitPerSecond': invocationRateLimitPerSecond,
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (name != null) 'Name': name,
    };
  }
}

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
      retentionDays: json['RetentionDays'] as int?,
      sizeBytes: json['SizeBytes'] as int?,
      state: (json['State'] as String?)?.toArchiveState(),
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
      if (retentionDays != null) 'RetentionDays': retentionDays,
      if (sizeBytes != null) 'SizeBytes': sizeBytes,
      if (state != null) 'State': state.toValue(),
      if (stateReason != null) 'StateReason': stateReason,
    };
  }
}

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
          ?.toConnectionAuthorizationType(),
      connectionArn: json['ConnectionArn'] as String?,
      connectionState:
          (json['ConnectionState'] as String?)?.toConnectionState(),
      creationTime: timeStampFromJson(json['CreationTime']),
      description: json['Description'] as String?,
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
    final lastAuthorizedTime = this.lastAuthorizedTime;
    final lastModifiedTime = this.lastModifiedTime;
    final name = this.name;
    final secretArn = this.secretArn;
    final stateReason = this.stateReason;
    return {
      if (authParameters != null) 'AuthParameters': authParameters,
      if (authorizationType != null)
        'AuthorizationType': authorizationType.toValue(),
      if (connectionArn != null) 'ConnectionArn': connectionArn,
      if (connectionState != null) 'ConnectionState': connectionState.toValue(),
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (description != null) 'Description': description,
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

class DescribeEventBusResponse {
  /// The Amazon Resource Name (ARN) of the account permitted to write events to
  /// the current account.
  final String? arn;

  /// The name of the event bus. Currently, this is always <code>default</code>.
  final String? name;

  /// The policy that enables the external account to send events to your account.
  final String? policy;

  DescribeEventBusResponse({
    this.arn,
    this.name,
    this.policy,
  });

  factory DescribeEventBusResponse.fromJson(Map<String, dynamic> json) {
    return DescribeEventBusResponse(
      arn: json['Arn'] as String?,
      name: json['Name'] as String?,
      policy: json['Policy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    final policy = this.policy;
    return {
      if (arn != null) 'Arn': arn,
      if (name != null) 'Name': name,
      if (policy != null) 'Policy': policy,
    };
  }
}

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
      state: (json['State'] as String?)?.toEventSourceState(),
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
      if (state != null) 'State': state.toValue(),
    };
  }
}

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
      state: (json['State'] as String?)?.toReplayState(),
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
      if (state != null) 'State': state.toValue(),
      if (stateReason != null) 'StateReason': stateReason,
    };
  }
}

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
  /// and Event Patterns</a> in the <i>Amazon EventBridge User Guide</i>.
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
      state: (json['State'] as String?)?.toRuleState(),
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
      if (state != null) 'State': state.toValue(),
    };
  }
}

/// The custom parameters to be used when the target is an Amazon ECS task.
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
  /// Regions where Fargate witt Amazon ECS is supported. For more information,
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
      taskDefinitionArn: json['TaskDefinitionArn'] as String,
      capacityProviderStrategy: (json['CapacityProviderStrategy'] as List?)
          ?.whereNotNull()
          .map((e) =>
              CapacityProviderStrategyItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      enableECSManagedTags: json['EnableECSManagedTags'] as bool?,
      enableExecuteCommand: json['EnableExecuteCommand'] as bool?,
      group: json['Group'] as String?,
      launchType: (json['LaunchType'] as String?)?.toLaunchType(),
      networkConfiguration: json['NetworkConfiguration'] != null
          ? NetworkConfiguration.fromJson(
              json['NetworkConfiguration'] as Map<String, dynamic>)
          : null,
      placementConstraints: (json['PlacementConstraints'] as List?)
          ?.whereNotNull()
          .map((e) => PlacementConstraint.fromJson(e as Map<String, dynamic>))
          .toList(),
      placementStrategy: (json['PlacementStrategy'] as List?)
          ?.whereNotNull()
          .map((e) => PlacementStrategy.fromJson(e as Map<String, dynamic>))
          .toList(),
      platformVersion: json['PlatformVersion'] as String?,
      propagateTags: (json['PropagateTags'] as String?)?.toPropagateTags(),
      referenceId: json['ReferenceId'] as String?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
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
      if (launchType != null) 'LaunchType': launchType.toValue(),
      if (networkConfiguration != null)
        'NetworkConfiguration': networkConfiguration,
      if (placementConstraints != null)
        'PlacementConstraints': placementConstraints,
      if (placementStrategy != null) 'PlacementStrategy': placementStrategy,
      if (platformVersion != null) 'PlatformVersion': platformVersion,
      if (propagateTags != null) 'PropagateTags': propagateTags.toValue(),
      if (referenceId != null) 'ReferenceId': referenceId,
      if (tags != null) 'Tags': tags,
      if (taskCount != null) 'TaskCount': taskCount,
    };
  }
}

/// An event bus receives events from a source and routes them to rules
/// associated with that event bus. Your account's default event bus receives
/// events from Amazon Web Services services. A custom event bus can receive
/// events from your custom applications and services. A partner event bus
/// receives events from an event source created by an SaaS partner. These
/// events come from the partners services or applications.
class EventBus {
  /// The ARN of the event bus.
  final String? arn;

  /// The name of the event bus.
  final String? name;

  /// The permissions policy of the event bus, describing which other Amazon Web
  /// Services accounts can write events to this event bus.
  final String? policy;

  EventBus({
    this.arn,
    this.name,
    this.policy,
  });

  factory EventBus.fromJson(Map<String, dynamic> json) {
    return EventBus(
      arn: json['Arn'] as String?,
      name: json['Name'] as String?,
      policy: json['Policy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    final policy = this.policy;
    return {
      if (arn != null) 'Arn': arn,
      if (name != null) 'Name': name,
      if (policy != null) 'Policy': policy,
    };
  }
}

/// A partner event source is created by an SaaS partner. If a customer creates
/// a partner event bus that matches this event source, that Amazon Web Services
/// account can receive events from the partner's applications or services.
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
      state: (json['State'] as String?)?.toEventSourceState(),
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
      if (state != null) 'State': state.toValue(),
    };
  }
}

enum EventSourceState {
  pending,
  active,
  deleted,
}

extension EventSourceStateValueExtension on EventSourceState {
  String toValue() {
    switch (this) {
      case EventSourceState.pending:
        return 'PENDING';
      case EventSourceState.active:
        return 'ACTIVE';
      case EventSourceState.deleted:
        return 'DELETED';
    }
  }
}

extension EventSourceStateFromString on String {
  EventSourceState toEventSourceState() {
    switch (this) {
      case 'PENDING':
        return EventSourceState.pending;
      case 'ACTIVE':
        return EventSourceState.active;
      case 'DELETED':
        return EventSourceState.deleted;
    }
    throw Exception('$this is not known in enum EventSourceState');
  }
}

/// These are custom parameter to be used when the target is an API Gateway REST
/// APIs or EventBridge ApiDestinations. In the latter case, these are merged
/// with any InvocationParameters specified on the Connection, with any values
/// from the Connection taking precedence.
class HttpParameters {
  /// The headers that need to be sent as part of request invoking the API Gateway
  /// REST API or EventBridge ApiDestination.
  final Map<String, String>? headerParameters;

  /// The path parameter values to be used to populate API Gateway REST API or
  /// EventBridge ApiDestination path wildcards ("*").
  final List<String>? pathParameterValues;

  /// The query string keys/values that need to be sent as part of request
  /// invoking the API Gateway REST API or EventBridge ApiDestination.
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
          ?.whereNotNull()
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

/// Contains the parameters needed for you to provide custom input to a target
/// based on one or more pieces of data extracted from the event.
class InputTransformer {
  /// Input template where you specify placeholders that will be filled with the
  /// values of the keys from <code>InputPathsMap</code> to customize the data
  /// sent to the target. Enclose each <code>InputPathsMaps</code> value in
  /// brackets: &lt;<i>value</i>&gt; The InputTemplate must be valid JSON.
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
  /// <code>"InputTemplate": "&lt;instance&gt; is in state &lt;status&gt;"</code>
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
  /// <code>"InputTemplate": "&lt;instance&gt; is in state
  /// \"&lt;status&gt;\""</code>
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
  /// <code>"InputTemplate": '{"myInstance": &lt;instance&gt;,"myStatus":
  /// "&lt;instance&gt; is in state \"&lt;status&gt;\""}'</code>
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
      inputTemplate: json['InputTemplate'] as String,
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
      partitionKeyPath: json['PartitionKeyPath'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final partitionKeyPath = this.partitionKeyPath;
    return {
      'PartitionKeyPath': partitionKeyPath,
    };
  }
}

enum LaunchType {
  ec2,
  fargate,
  external,
}

extension LaunchTypeValueExtension on LaunchType {
  String toValue() {
    switch (this) {
      case LaunchType.ec2:
        return 'EC2';
      case LaunchType.fargate:
        return 'FARGATE';
      case LaunchType.external:
        return 'EXTERNAL';
    }
  }
}

extension LaunchTypeFromString on String {
  LaunchType toLaunchType() {
    switch (this) {
      case 'EC2':
        return LaunchType.ec2;
      case 'FARGATE':
        return LaunchType.fargate;
      case 'EXTERNAL':
        return LaunchType.external;
    }
    throw Exception('$this is not known in enum LaunchType');
  }
}

class ListApiDestinationsResponse {
  /// An array of <code>ApiDestination</code> objects that include information
  /// about an API destination.
  final List<ApiDestination>? apiDestinations;

  /// A token you can use in a subsequent request to retrieve the next set of
  /// results.
  final String? nextToken;

  ListApiDestinationsResponse({
    this.apiDestinations,
    this.nextToken,
  });

  factory ListApiDestinationsResponse.fromJson(Map<String, dynamic> json) {
    return ListApiDestinationsResponse(
      apiDestinations: (json['ApiDestinations'] as List?)
          ?.whereNotNull()
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

class ListArchivesResponse {
  /// An array of <code>Archive</code> objects that include details about an
  /// archive.
  final List<Archive>? archives;

  /// The token returned by a previous call to retrieve the next set of results.
  final String? nextToken;

  ListArchivesResponse({
    this.archives,
    this.nextToken,
  });

  factory ListArchivesResponse.fromJson(Map<String, dynamic> json) {
    return ListArchivesResponse(
      archives: (json['Archives'] as List?)
          ?.whereNotNull()
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

class ListConnectionsResponse {
  /// An array of connections objects that include details about the connections.
  final List<Connection>? connections;

  /// A token you can use in a subsequent request to retrieve the next set of
  /// results.
  final String? nextToken;

  ListConnectionsResponse({
    this.connections,
    this.nextToken,
  });

  factory ListConnectionsResponse.fromJson(Map<String, dynamic> json) {
    return ListConnectionsResponse(
      connections: (json['Connections'] as List?)
          ?.whereNotNull()
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

class ListEventBusesResponse {
  /// This list of event buses.
  final List<EventBus>? eventBuses;

  /// A token you can use in a subsequent operation to retrieve the next set of
  /// results.
  final String? nextToken;

  ListEventBusesResponse({
    this.eventBuses,
    this.nextToken,
  });

  factory ListEventBusesResponse.fromJson(Map<String, dynamic> json) {
    return ListEventBusesResponse(
      eventBuses: (json['EventBuses'] as List?)
          ?.whereNotNull()
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

class ListEventSourcesResponse {
  /// The list of event sources.
  final List<EventSource>? eventSources;

  /// A token you can use in a subsequent operation to retrieve the next set of
  /// results.
  final String? nextToken;

  ListEventSourcesResponse({
    this.eventSources,
    this.nextToken,
  });

  factory ListEventSourcesResponse.fromJson(Map<String, dynamic> json) {
    return ListEventSourcesResponse(
      eventSources: (json['EventSources'] as List?)
          ?.whereNotNull()
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

class ListPartnerEventSourceAccountsResponse {
  /// A token you can use in a subsequent operation to retrieve the next set of
  /// results.
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
          ?.whereNotNull()
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

class ListPartnerEventSourcesResponse {
  /// A token you can use in a subsequent operation to retrieve the next set of
  /// results.
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
          ?.whereNotNull()
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

class ListReplaysResponse {
  /// The token returned by a previous call to retrieve the next set of results.
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
          ?.whereNotNull()
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

class ListRuleNamesByTargetResponse {
  /// Indicates whether there are additional results to retrieve. If there are no
  /// more results, the value is null.
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
          ?.whereNotNull()
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

class ListRulesResponse {
  /// Indicates whether there are additional results to retrieve. If there are no
  /// more results, the value is null.
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
          ?.whereNotNull()
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

class ListTagsForResourceResponse {
  /// The list of tag keys and values associated with the resource you specified
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
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

class ListTargetsByRuleResponse {
  /// Indicates whether there are additional results to retrieve. If there are no
  /// more results, the value is null.
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
          ?.whereNotNull()
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

/// This structure specifies the network configuration for an ECS task.
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

/// A partner event source is created by an SaaS partner. If a customer creates
/// a partner event bus that matches this event source, that Amazon Web Services
/// account can receive events from the partner's applications or services.
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
      state: (json['State'] as String?)?.toEventSourceState(),
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
      if (state != null) 'State': state.toValue(),
    };
  }
}

/// An object representing a constraint on task placement. To learn more, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-placement-constraints.html">Task
/// Placement Constraints</a> in the Amazon Elastic Container Service Developer
/// Guide.
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
      type: (json['type'] as String?)?.toPlacementConstraintType(),
    );
  }

  Map<String, dynamic> toJson() {
    final expression = this.expression;
    final type = this.type;
    return {
      if (expression != null) 'expression': expression,
      if (type != null) 'type': type.toValue(),
    };
  }
}

enum PlacementConstraintType {
  distinctInstance,
  memberOf,
}

extension PlacementConstraintTypeValueExtension on PlacementConstraintType {
  String toValue() {
    switch (this) {
      case PlacementConstraintType.distinctInstance:
        return 'distinctInstance';
      case PlacementConstraintType.memberOf:
        return 'memberOf';
    }
  }
}

extension PlacementConstraintTypeFromString on String {
  PlacementConstraintType toPlacementConstraintType() {
    switch (this) {
      case 'distinctInstance':
        return PlacementConstraintType.distinctInstance;
      case 'memberOf':
        return PlacementConstraintType.memberOf;
    }
    throw Exception('$this is not known in enum PlacementConstraintType');
  }
}

/// The task placement strategy for a task or service. To learn more, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-placement-strategies.html">Task
/// Placement Strategies</a> in the Amazon Elastic Container Service Service
/// Developer Guide.
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
      type: (json['type'] as String?)?.toPlacementStrategyType(),
    );
  }

  Map<String, dynamic> toJson() {
    final field = this.field;
    final type = this.type;
    return {
      if (field != null) 'field': field,
      if (type != null) 'type': type.toValue(),
    };
  }
}

enum PlacementStrategyType {
  random,
  spread,
  binpack,
}

extension PlacementStrategyTypeValueExtension on PlacementStrategyType {
  String toValue() {
    switch (this) {
      case PlacementStrategyType.random:
        return 'random';
      case PlacementStrategyType.spread:
        return 'spread';
      case PlacementStrategyType.binpack:
        return 'binpack';
    }
  }
}

extension PlacementStrategyTypeFromString on String {
  PlacementStrategyType toPlacementStrategyType() {
    switch (this) {
      case 'random':
        return PlacementStrategyType.random;
      case 'spread':
        return PlacementStrategyType.spread;
      case 'binpack':
        return PlacementStrategyType.binpack;
    }
    throw Exception('$this is not known in enum PlacementStrategyType');
  }
}

enum PropagateTags {
  taskDefinition,
}

extension PropagateTagsValueExtension on PropagateTags {
  String toValue() {
    switch (this) {
      case PropagateTags.taskDefinition:
        return 'TASK_DEFINITION';
    }
  }
}

extension PropagateTagsFromString on String {
  PropagateTags toPropagateTags() {
    switch (this) {
      case 'TASK_DEFINITION':
        return PropagateTags.taskDefinition;
    }
    throw Exception('$this is not known in enum PropagateTags');
  }
}

/// Represents an event to be submitted.
class PutEventsRequestEntry {
  /// A valid JSON string. There is no other schema imposed. The JSON string may
  /// contain fields and nested subobjects.
  final String? detail;

  /// Free-form string used to decide what fields to expect in the event detail.
  final String? detailType;

  /// The name or ARN of the event bus to receive the event. Only the rules that
  /// are associated with this event bus are used to match the event. If you omit
  /// this, the default event bus is used.
  final String? eventBusName;

  /// Amazon Web Services resources, identified by Amazon Resource Name (ARN),
  /// which the event primarily concerns. Any number, including zero, may be
  /// present.
  final List<String>? resources;

  /// The source of the event.
  final String? source;

  /// The time stamp of the event, per <a
  /// href="https://www.rfc-editor.org/rfc/rfc3339.txt">RFC3339</a>. If no time
  /// stamp is provided, the time stamp of the <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_PutEvents.html">PutEvents</a>
  /// call is used.
  final DateTime? time;

  /// An X-Ray trade header, which is an http header (X-Amzn-Trace-Id) that
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

class PutEventsResponse {
  /// The successfully and unsuccessfully ingested events results. If the
  /// ingestion was successful, the entry has the event ID in it. Otherwise, you
  /// can use the error code and error message to identify the problem with the
  /// entry.
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
          ?.whereNotNull()
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

/// Represents an event that failed to be submitted.
class PutEventsResultEntry {
  /// The error code that indicates why the event submission failed.
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

/// The details about an event generated by an SaaS partner.
class PutPartnerEventsRequestEntry {
  /// A valid JSON string. There is no other schema imposed. The JSON string may
  /// contain fields and nested subobjects.
  final String? detail;

  /// A free-form string used to decide what fields to expect in the event detail.
  final String? detailType;

  /// Amazon Web Services resources, identified by Amazon Resource Name (ARN),
  /// which the event primarily concerns. Any number, including zero, may be
  /// present.
  final List<String>? resources;

  /// The event source that is generating the entry.
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

class PutPartnerEventsResponse {
  /// The list of events from this operation that were successfully written to the
  /// partner event bus.
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
          ?.whereNotNull()
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

/// Represents an event that a partner tried to generate, but failed.
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
          ?.whereNotNull()
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

/// Represents a target that failed to be added to a rule.
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

/// These are custom parameters to be used when the target is a Amazon Redshift
/// cluster to invoke the Amazon Redshift Data API ExecuteStatement based on
/// EventBridge events.
class RedshiftDataParameters {
  /// The name of the database. Required when authenticating using temporary
  /// credentials.
  final String database;

  /// The SQL statement text to run.
  final String sql;

  /// The database user name. Required when authenticating using temporary
  /// credentials.
  final String? dbUser;

  /// The name or ARN of the secret that enables access to the database. Required
  /// when authenticating using Amazon Web Services Secrets Manager.
  final String? secretManagerArn;

  /// The name of the SQL statement. You can name the SQL statement when you
  /// create it to identify the query.
  final String? statementName;

  /// Indicates whether to send an event back to EventBridge after the SQL
  /// statement runs.
  final bool? withEvent;

  RedshiftDataParameters({
    required this.database,
    required this.sql,
    this.dbUser,
    this.secretManagerArn,
    this.statementName,
    this.withEvent,
  });

  factory RedshiftDataParameters.fromJson(Map<String, dynamic> json) {
    return RedshiftDataParameters(
      database: json['Database'] as String,
      sql: json['Sql'] as String,
      dbUser: json['DbUser'] as String?,
      secretManagerArn: json['SecretManagerArn'] as String?,
      statementName: json['StatementName'] as String?,
      withEvent: json['WithEvent'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final database = this.database;
    final sql = this.sql;
    final dbUser = this.dbUser;
    final secretManagerArn = this.secretManagerArn;
    final statementName = this.statementName;
    final withEvent = this.withEvent;
    return {
      'Database': database,
      'Sql': sql,
      if (dbUser != null) 'DbUser': dbUser,
      if (secretManagerArn != null) 'SecretManagerArn': secretManagerArn,
      if (statementName != null) 'StatementName': statementName,
      if (withEvent != null) 'WithEvent': withEvent,
    };
  }
}

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
          ?.whereNotNull()
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

/// Represents a target that failed to be removed from a rule.
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

/// A <code>Replay</code> object that contains details about a replay.
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
      state: (json['State'] as String?)?.toReplayState(),
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
      if (state != null) 'State': state.toValue(),
      if (stateReason != null) 'StateReason': stateReason,
    };
  }
}

/// A <code>ReplayDestination</code> object that contains details about a
/// replay.
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
      arn: json['Arn'] as String,
      filterArns: (json['FilterArns'] as List?)
          ?.whereNotNull()
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

enum ReplayState {
  starting,
  running,
  cancelling,
  completed,
  cancelled,
  failed,
}

extension ReplayStateValueExtension on ReplayState {
  String toValue() {
    switch (this) {
      case ReplayState.starting:
        return 'STARTING';
      case ReplayState.running:
        return 'RUNNING';
      case ReplayState.cancelling:
        return 'CANCELLING';
      case ReplayState.completed:
        return 'COMPLETED';
      case ReplayState.cancelled:
        return 'CANCELLED';
      case ReplayState.failed:
        return 'FAILED';
    }
  }
}

extension ReplayStateFromString on String {
  ReplayState toReplayState() {
    switch (this) {
      case 'STARTING':
        return ReplayState.starting;
      case 'RUNNING':
        return ReplayState.running;
      case 'CANCELLING':
        return ReplayState.cancelling;
      case 'COMPLETED':
        return ReplayState.completed;
      case 'CANCELLED':
        return ReplayState.cancelled;
      case 'FAILED':
        return ReplayState.failed;
    }
    throw Exception('$this is not known in enum ReplayState');
  }
}

/// A <code>RetryPolicy</code> object that includes information about the retry
/// policy settings.
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

/// Contains information about a rule in Amazon EventBridge.
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
  /// and Event Patterns</a> in the <i>Amazon EventBridge User Guide</i>.
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
      state: (json['State'] as String?)?.toRuleState(),
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
      if (state != null) 'State': state.toValue(),
    };
  }
}

enum RuleState {
  enabled,
  disabled,
}

extension RuleStateValueExtension on RuleState {
  String toValue() {
    switch (this) {
      case RuleState.enabled:
        return 'ENABLED';
      case RuleState.disabled:
        return 'DISABLED';
    }
  }
}

extension RuleStateFromString on String {
  RuleState toRuleState() {
    switch (this) {
      case 'ENABLED':
        return RuleState.enabled;
      case 'DISABLED':
        return RuleState.disabled;
    }
    throw Exception('$this is not known in enum RuleState');
  }
}

/// This parameter contains the criteria (either InstanceIds or a tag) used to
/// specify which EC2 instances are to be sent the command.
class RunCommandParameters {
  /// Currently, we support including only one RunCommandTarget block, which
  /// specifies either an array of InstanceIds or a tag.
  final List<RunCommandTarget> runCommandTargets;

  RunCommandParameters({
    required this.runCommandTargets,
  });

  factory RunCommandParameters.fromJson(Map<String, dynamic> json) {
    return RunCommandParameters(
      runCommandTargets: (json['RunCommandTargets'] as List)
          .whereNotNull()
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

/// Information about the EC2 instances that are to be sent the command,
/// specified as key-value pairs. Each <code>RunCommandTarget</code> block can
/// include only one key, but this key may specify multiple values.
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
      key: json['Key'] as String,
      values: (json['Values'] as List)
          .whereNotNull()
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

/// Name/Value pair of a parameter to start execution of a SageMaker Model
/// Building Pipeline.
class SageMakerPipelineParameter {
  /// Name of parameter to start execution of a SageMaker Model Building Pipeline.
  final String name;

  /// Value of parameter to start execution of a SageMaker Model Building
  /// Pipeline.
  final String value;

  SageMakerPipelineParameter({
    required this.name,
    required this.value,
  });

  factory SageMakerPipelineParameter.fromJson(Map<String, dynamic> json) {
    return SageMakerPipelineParameter(
      name: json['Name'] as String,
      value: json['Value'] as String,
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

/// These are custom parameters to use when the target is a SageMaker Model
/// Building Pipeline that starts based on EventBridge events.
class SageMakerPipelineParameters {
  /// List of Parameter names and values for SageMaker Model Building Pipeline
  /// execution.
  final List<SageMakerPipelineParameter>? pipelineParameterList;

  SageMakerPipelineParameters({
    this.pipelineParameterList,
  });

  factory SageMakerPipelineParameters.fromJson(Map<String, dynamic> json) {
    return SageMakerPipelineParameters(
      pipelineParameterList: (json['PipelineParameterList'] as List?)
          ?.whereNotNull()
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

/// This structure includes the custom parameter to be used when the target is
/// an SQS FIFO queue.
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
      state: (json['State'] as String?)?.toReplayState(),
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
      if (state != null) 'State': state.toValue(),
      if (stateReason != null) 'StateReason': stateReason,
    };
  }
}

/// A key-value pair associated with an Amazon Web Services resource. In
/// EventBridge, rules and event buses support tagging.
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
      key: json['Key'] as String,
      value: json['Value'] as String,
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

class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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
class Target {
  /// The Amazon Resource Name (ARN) of the target.
  final String arn;

  /// The ID of the target. We recommend using a memorable and unique string.
  final String id;

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

  /// Contains the HTTP parameters to use when the target is a API Gateway REST
  /// endpoint or EventBridge ApiDestination.
  ///
  /// If you specify an API Gateway REST API or EventBridge ApiDestination as a
  /// target, you can use this parameter to specify headers, path parameters, and
  /// query string keys/values as part of your target invoking request. If you're
  /// using ApiDestinations, the corresponding Connection can also have these
  /// values configured. In case of any conflicting keys, values from the
  /// Connection take precedence.
  final HttpParameters? httpParameters;

  /// Valid JSON text passed to the target. In this case, nothing from the event
  /// itself is passed to the target. For more information, see <a
  /// href="http://www.rfc-editor.org/rfc/rfc7159.txt">The JavaScript Object
  /// Notation (JSON) Data Interchange Format</a>.
  final String? input;

  /// The value of the JSONPath that is used for extracting part of the matched
  /// event when passing it to the target. You must use JSON dot notation, not
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

  /// The <code>RetryPolicy</code> object that contains the retry policy
  /// configuration to use for the dead-letter queue.
  final RetryPolicy? retryPolicy;

  /// The Amazon Resource Name (ARN) of the IAM role to be used for this target
  /// when the rule is triggered. If one rule triggers multiple targets, you can
  /// use a different IAM role for each target.
  final String? roleArn;

  /// Parameters used when you are using the rule to invoke Amazon EC2 Run
  /// Command.
  final RunCommandParameters? runCommandParameters;

  /// Contains the SageMaker Model Building Pipeline parameters to start execution
  /// of a SageMaker Model Building Pipeline.
  ///
  /// If you specify a SageMaker Model Building Pipeline as a target, you can use
  /// this to specify parameters to start a pipeline execution based on
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
      arn: json['Arn'] as String,
      id: json['Id'] as String,
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

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

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
      apiDestinationState:
          (json['ApiDestinationState'] as String?)?.toApiDestinationState(),
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
        'ApiDestinationState': apiDestinationState.toValue(),
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
    };
  }
}

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
      state: (json['State'] as String?)?.toArchiveState(),
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
      if (state != null) 'State': state.toValue(),
      if (stateReason != null) 'StateReason': stateReason,
    };
  }
}

/// Contains the API key authorization parameters to use to update the
/// connection.
class UpdateConnectionApiKeyAuthRequestParameters {
  /// The name of the API key to use for authorization.
  final String? apiKeyName;

  /// The value associated with teh API key to use for authorization.
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

/// Contains the additional parameters to use for the connection.
class UpdateConnectionAuthRequestParameters {
  /// A <code>UpdateConnectionApiKeyAuthRequestParameters</code> object that
  /// contains the authorization parameters for API key authorization.
  final UpdateConnectionApiKeyAuthRequestParameters? apiKeyAuthParameters;

  /// A <code>UpdateConnectionBasicAuthRequestParameters</code> object that
  /// contains the authorization parameters for Basic authorization.
  final UpdateConnectionBasicAuthRequestParameters? basicAuthParameters;

  /// A <code>ConnectionHttpParameters</code> object that contains the additional
  /// parameters to use for the connection.
  final ConnectionHttpParameters? invocationHttpParameters;

  /// A <code>UpdateConnectionOAuthRequestParameters</code> object that contains
  /// the authorization parameters for OAuth authorization.
  final UpdateConnectionOAuthRequestParameters? oAuthParameters;

  UpdateConnectionAuthRequestParameters({
    this.apiKeyAuthParameters,
    this.basicAuthParameters,
    this.invocationHttpParameters,
    this.oAuthParameters,
  });

  Map<String, dynamic> toJson() {
    final apiKeyAuthParameters = this.apiKeyAuthParameters;
    final basicAuthParameters = this.basicAuthParameters;
    final invocationHttpParameters = this.invocationHttpParameters;
    final oAuthParameters = this.oAuthParameters;
    return {
      if (apiKeyAuthParameters != null)
        'ApiKeyAuthParameters': apiKeyAuthParameters,
      if (basicAuthParameters != null)
        'BasicAuthParameters': basicAuthParameters,
      if (invocationHttpParameters != null)
        'InvocationHttpParameters': invocationHttpParameters,
      if (oAuthParameters != null) 'OAuthParameters': oAuthParameters,
    };
  }
}

/// Contains the Basic authorization parameters for the connection.
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

/// Contains the OAuth authorization parameters to use for the connection.
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

/// Contains the OAuth request parameters to use for the connection.
class UpdateConnectionOAuthRequestParameters {
  /// The URL to the authorization endpoint when OAuth is specified as the
  /// authorization type.
  final String? authorizationEndpoint;

  /// A <code>UpdateConnectionOAuthClientRequestParameters</code> object that
  /// contains the client parameters to use for the connection when OAuth is
  /// specified as the authorization type.
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
      if (httpMethod != null) 'HttpMethod': httpMethod.toValue(),
      if (oAuthHttpParameters != null)
        'OAuthHttpParameters': oAuthHttpParameters,
    };
  }
}

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
          (json['ConnectionState'] as String?)?.toConnectionState(),
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
      if (connectionState != null) 'ConnectionState': connectionState.toValue(),
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (lastAuthorizedTime != null)
        'LastAuthorizedTime': unixTimestampToJson(lastAuthorizedTime),
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
    };
  }
}

class ConcurrentModificationException extends _s.GenericAwsException {
  ConcurrentModificationException({String? type, String? message})
      : super(
            type: type,
            code: 'ConcurrentModificationException',
            message: message);
}

class IllegalStatusException extends _s.GenericAwsException {
  IllegalStatusException({String? type, String? message})
      : super(type: type, code: 'IllegalStatusException', message: message);
}

class InternalException extends _s.GenericAwsException {
  InternalException({String? type, String? message})
      : super(type: type, code: 'InternalException', message: message);
}

class InvalidEventPatternException extends _s.GenericAwsException {
  InvalidEventPatternException({String? type, String? message})
      : super(
            type: type, code: 'InvalidEventPatternException', message: message);
}

class InvalidStateException extends _s.GenericAwsException {
  InvalidStateException({String? type, String? message})
      : super(type: type, code: 'InvalidStateException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ManagedRuleException extends _s.GenericAwsException {
  ManagedRuleException({String? type, String? message})
      : super(type: type, code: 'ManagedRuleException', message: message);
}

class OperationDisabledException extends _s.GenericAwsException {
  OperationDisabledException({String? type, String? message})
      : super(type: type, code: 'OperationDisabledException', message: message);
}

class PolicyLengthExceededException extends _s.GenericAwsException {
  PolicyLengthExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'PolicyLengthExceededException',
            message: message);
}

class ResourceAlreadyExistsException extends _s.GenericAwsException {
  ResourceAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceAlreadyExistsException',
            message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
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
};
