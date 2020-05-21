// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822fromJson,
        rfc822toJson,
        iso8601fromJson,
        iso8601toJson,
        unixFromJson,
        unixToJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'events-2015-10-07.g.dart';

/// Amazon EventBridge helps you to respond to state changes in your AWS
/// resources. When your resources change state, they automatically send events
/// into an event stream. You can create rules that match selected events in the
/// stream and route them to targets to take action. You can also use rules to
/// take action on a predetermined schedule. For example, you can configure
/// rules to:
///
/// <ul>
/// <li>
/// Automatically invoke an AWS Lambda function to update DNS entries when an
/// event notifies you that Amazon EC2 instance enters the running state.
/// </li>
/// <li>
/// Direct specific API records from AWS CloudTrail to an Amazon Kinesis data
/// stream for detailed analysis of potential security or availability risks.
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
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: 'events',
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Activates a partner event source that has been deactivated. Once
  /// activated, your matching event bus will start receiving events from the
  /// event source.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConcurrentModificationException].
  /// May throw [InvalidStateException].
  /// May throw [InternalException].
  ///
  /// Parameter [name] :
  /// The name of the partner event source to activate.
  Future<void> activateEventSource({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''aws\.partner(/[\.\-_A-Za-z0-9]+){2,}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.ActivateEventSource'
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
    @_s.required String name,
    String eventSourceName,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[/\.\-_A-Za-z0-9]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'eventSourceName',
      eventSourceName,
      1,
      256,
    );
    _s.validateStringPattern(
      'eventSourceName',
      eventSourceName,
      r'''aws\.partner(/[\.\-_A-Za-z0-9]+){2,}''',
    );
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
        'EventSourceName': eventSourceName,
        'Tags': tags,
      },
    );

    return CreateEventBusResponse.fromJson(jsonResponse.body);
  }

  /// Called by an SaaS partner to create a partner event source. This operation
  /// is not used by AWS customers.
  ///
  /// Each partner event source can be used by one AWS account to create a
  /// matching partner event bus in that AWS account. A SaaS partner must create
  /// one partner event source for each AWS account that wants to receive those
  /// event types.
  ///
  /// A partner event source creates events based on resources within the SaaS
  /// partner's service or application.
  ///
  /// An AWS account that creates a partner event bus that matches the partner
  /// event source can use that event bus to receive events from the partner,
  /// and then process them using AWS Events rules and targets.
  ///
  /// Partner event source names follow this format:
  ///
  /// <code> <i>partner_name</i>/<i>event_namespace</i>/<i>event_name</i>
  /// </code>
  ///
  /// <i>partner_name</i> is determined during partner registration and
  /// identifies the partner to AWS customers. <i>event_namespace</i> is
  /// determined by the partner and is a way for the partner to categorize their
  /// events. <i>event_name</i> is determined by the partner, and should
  /// uniquely identify an event-generating resource within the partner system.
  /// The combination of <i>event_namespace</i> and <i>event_name</i> should
  /// help AWS customers decide whether to create an event bus to receive these
  /// events.
  ///
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [InternalException].
  /// May throw [ConcurrentModificationException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [account] :
  /// The AWS account ID that is permitted to create a matching partner event
  /// bus for this partner event source.
  ///
  /// Parameter [name] :
  /// The name of the partner event source. This name must be unique and must be
  /// in the format <code>
  /// <i>partner_name</i>/<i>event_namespace</i>/<i>event_name</i> </code>. The
  /// AWS account that wants to use this partner event source must create a
  /// partner event bus with a name that matches the name of the partner event
  /// source.
  Future<CreatePartnerEventSourceResponse> createPartnerEventSource({
    @_s.required String account,
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(account, 'account');
    _s.validateStringLength(
      'account',
      account,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'account',
      account,
      r'''\d{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''aws\.partner(/[\.\-_A-Za-z0-9]+){2,}''',
      isRequired: true,
    );
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
  /// To activate a deactivated partner event source, use
  /// <a>ActivateEventSource</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConcurrentModificationException].
  /// May throw [InvalidStateException].
  /// May throw [InternalException].
  ///
  /// Parameter [name] :
  /// The name of the partner event source to deactivate.
  Future<void> deactivateEventSource({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''aws\.partner(/[\.\-_A-Za-z0-9]+){2,}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.DeactivateEventSource'
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
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[/\.\-_A-Za-z0-9]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.DeleteEventBus'
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
  }

  /// This operation is used by SaaS partners to delete a partner event source.
  /// This operation is not used by AWS customers.
  ///
  /// When you delete an event source, the status of the corresponding partner
  /// event bus in the AWS customer account becomes DELETED.
  /// <p/>
  ///
  /// May throw [InternalException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [account] :
  /// The AWS account ID of the AWS customer that the event source was created
  /// for.
  ///
  /// Parameter [name] :
  /// The name of the event source to delete.
  Future<void> deletePartnerEventSource({
    @_s.required String account,
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(account, 'account');
    _s.validateStringLength(
      'account',
      account,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'account',
      account,
      r'''\d{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''aws\.partner(/[\.\-_A-Za-z0-9]+){2,}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.DeletePartnerEventSource'
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
  }

  /// Deletes the specified rule.
  ///
  /// Before you can delete the rule, you must remove all targets, using
  /// <a>RemoveTargets</a>.
  ///
  /// When you delete a rule, incoming events might continue to match to the
  /// deleted rule. Allow a short period of time for changes to take effect.
  ///
  /// Managed rules are rules created and managed by another AWS service on your
  /// behalf. These rules are created by those other AWS services to support
  /// functionality in those services. You can delete these rules using the
  /// <code>Force</code> option, but you should do so only if you are sure the
  /// other service is not still using that rule.
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
  /// The event bus associated with the rule. If you omit this, the default
  /// event bus is used.
  ///
  /// Parameter [force] :
  /// If this is a managed rule, created by an AWS service on your behalf, you
  /// must specify <code>Force</code> as <code>True</code> to delete the rule.
  /// This parameter is ignored for rules that are not managed rules. You can
  /// check whether a rule is a managed rule by using <code>DescribeRule</code>
  /// or <code>ListRules</code> and checking the <code>ManagedBy</code> field of
  /// the response.
  Future<void> deleteRule({
    @_s.required String name,
    String eventBusName,
    bool force,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\.\-_A-Za-z0-9]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'eventBusName',
      eventBusName,
      1,
      256,
    );
    _s.validateStringPattern(
      'eventBusName',
      eventBusName,
      r'''[/\.\-_A-Za-z0-9]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.DeleteRule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'EventBusName': eventBusName,
        'Force': force,
      },
    );
  }

  /// Displays details about an event bus in your account. This can include the
  /// external AWS accounts that are permitted to write events to your default
  /// event bus, and the associated policy. For custom event buses and partner
  /// event buses, it displays the name, ARN, policy, state, and creation time.
  ///
  /// To enable your account to receive events from other accounts on its
  /// default event bus, use <a>PutPermission</a>.
  ///
  /// For more information about partner event buses, see <a>CreateEventBus</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalException].
  ///
  /// Parameter [name] :
  /// The name of the event bus to show details for. If you omit this, the
  /// default event bus is displayed.
  Future<DescribeEventBusResponse> describeEventBus({
    String name,
  }) async {
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[/\.\-_A-Za-z0-9]+''',
    );
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
        'Name': name,
      },
    );

    return DescribeEventBusResponse.fromJson(jsonResponse.body);
  }

  /// This operation lists details about a partner event source that is shared
  /// with your account.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalException].
  ///
  /// Parameter [name] :
  /// The name of the partner event source to display the details of.
  Future<DescribeEventSourceResponse> describeEventSource({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''aws\.partner(/[\.\-_A-Za-z0-9]+){2,}''',
      isRequired: true,
    );
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
  /// event source that they have created. AWS customers do not use this
  /// operation. Instead, AWS customers can use <a>DescribeEventSource</a> to
  /// see details about a partner event source that is shared with them.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalException].
  ///
  /// Parameter [name] :
  /// The name of the event source to display.
  Future<DescribePartnerEventSourceResponse> describePartnerEventSource({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''aws\.partner(/[\.\-_A-Za-z0-9]+){2,}''',
      isRequired: true,
    );
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

  /// Describes the specified rule.
  ///
  /// DescribeRule does not list the targets of a rule. To see the targets
  /// associated with a rule, use <a>ListTargetsByRule</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalException].
  ///
  /// Parameter [name] :
  /// The name of the rule.
  ///
  /// Parameter [eventBusName] :
  /// The event bus associated with the rule. If you omit this, the default
  /// event bus is used.
  Future<DescribeRuleResponse> describeRule({
    @_s.required String name,
    String eventBusName,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\.\-_A-Za-z0-9]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'eventBusName',
      eventBusName,
      1,
      256,
    );
    _s.validateStringPattern(
      'eventBusName',
      eventBusName,
      r'''[/\.\-_A-Za-z0-9]+''',
    );
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
        'EventBusName': eventBusName,
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
  /// The event bus associated with the rule. If you omit this, the default
  /// event bus is used.
  Future<void> disableRule({
    @_s.required String name,
    String eventBusName,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\.\-_A-Za-z0-9]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'eventBusName',
      eventBusName,
      1,
      256,
    );
    _s.validateStringPattern(
      'eventBusName',
      eventBusName,
      r'''[/\.\-_A-Za-z0-9]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.DisableRule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'EventBusName': eventBusName,
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
  /// The event bus associated with the rule. If you omit this, the default
  /// event bus is used.
  Future<void> enableRule({
    @_s.required String name,
    String eventBusName,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\.\-_A-Za-z0-9]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'eventBusName',
      eventBusName,
      1,
      256,
    );
    _s.validateStringPattern(
      'eventBusName',
      eventBusName,
      r'''[/\.\-_A-Za-z0-9]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.EnableRule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'EventBusName': eventBusName,
      },
    );
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
    int limit,
    String namePrefix,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    _s.validateStringLength(
      'namePrefix',
      namePrefix,
      1,
      256,
    );
    _s.validateStringPattern(
      'namePrefix',
      namePrefix,
      r'''[/\.\-_A-Za-z0-9]+''',
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
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
        'Limit': limit,
        'NamePrefix': namePrefix,
        'NextToken': nextToken,
      },
    );

    return ListEventBusesResponse.fromJson(jsonResponse.body);
  }

  /// You can use this to see all the partner event sources that have been
  /// shared with your AWS account. For more information about partner event
  /// sources, see <a>CreateEventBus</a>.
  ///
  /// May throw [InternalException].
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
    int limit,
    String namePrefix,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    _s.validateStringLength(
      'namePrefix',
      namePrefix,
      1,
      256,
    );
    _s.validateStringPattern(
      'namePrefix',
      namePrefix,
      r'''[/\.\-_A-Za-z0-9]+''',
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
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
        'Limit': limit,
        'NamePrefix': namePrefix,
        'NextToken': nextToken,
      },
    );

    return ListEventSourcesResponse.fromJson(jsonResponse.body);
  }

  /// An SaaS partner can use this operation to display the AWS account ID that
  /// a particular partner event source name is associated with. This operation
  /// is not used by AWS customers.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalException].
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
    @_s.required String eventSourceName,
    int limit,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(eventSourceName, 'eventSourceName');
    _s.validateStringLength(
      'eventSourceName',
      eventSourceName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'eventSourceName',
      eventSourceName,
      r'''aws\.partner(/[\.\-_A-Za-z0-9]+){2,}''',
      isRequired: true,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
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
        'Limit': limit,
        'NextToken': nextToken,
      },
    );

    return ListPartnerEventSourceAccountsResponse.fromJson(jsonResponse.body);
  }

  /// An SaaS partner can use this operation to list all the partner event
  /// source names that they have created. This operation is not used by AWS
  /// customers.
  ///
  /// May throw [InternalException].
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
    @_s.required String namePrefix,
    int limit,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(namePrefix, 'namePrefix');
    _s.validateStringLength(
      'namePrefix',
      namePrefix,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'namePrefix',
      namePrefix,
      r'''aws\.partner/[\.\-_A-Za-z0-9]+/[/\.\-_A-Za-z0-9]*''',
      isRequired: true,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
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
        'Limit': limit,
        'NextToken': nextToken,
      },
    );

    return ListPartnerEventSourcesResponse.fromJson(jsonResponse.body);
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
  /// Limits the results to show only the rules associated with the specified
  /// event bus.
  ///
  /// Parameter [limit] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// The token returned by a previous call to retrieve the next set of results.
  Future<ListRuleNamesByTargetResponse> listRuleNamesByTarget({
    @_s.required String targetArn,
    String eventBusName,
    int limit,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(targetArn, 'targetArn');
    _s.validateStringLength(
      'targetArn',
      targetArn,
      1,
      1600,
      isRequired: true,
    );
    _s.validateStringLength(
      'eventBusName',
      eventBusName,
      1,
      256,
    );
    _s.validateStringPattern(
      'eventBusName',
      eventBusName,
      r'''[/\.\-_A-Za-z0-9]+''',
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
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
        'EventBusName': eventBusName,
        'Limit': limit,
        'NextToken': nextToken,
      },
    );

    return ListRuleNamesByTargetResponse.fromJson(jsonResponse.body);
  }

  /// Lists your Amazon EventBridge rules. You can either list all the rules or
  /// you can provide a prefix to match to the rule names.
  ///
  /// ListRules does not list the targets of a rule. To see the targets
  /// associated with a rule, use <a>ListTargetsByRule</a>.
  ///
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [eventBusName] :
  /// Limits the results to show only the rules associated with the specified
  /// event bus.
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
    String eventBusName,
    int limit,
    String namePrefix,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'eventBusName',
      eventBusName,
      1,
      256,
    );
    _s.validateStringPattern(
      'eventBusName',
      eventBusName,
      r'''[/\.\-_A-Za-z0-9]+''',
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    _s.validateStringLength(
      'namePrefix',
      namePrefix,
      1,
      64,
    );
    _s.validateStringPattern(
      'namePrefix',
      namePrefix,
      r'''[\.\-_A-Za-z0-9]+''',
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
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
        'EventBusName': eventBusName,
        'Limit': limit,
        'NamePrefix': namePrefix,
        'NextToken': nextToken,
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
    @_s.required String resourceARN,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      1,
      1600,
      isRequired: true,
    );
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
  /// The event bus associated with the rule. If you omit this, the default
  /// event bus is used.
  ///
  /// Parameter [limit] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// The token returned by a previous call to retrieve the next set of results.
  Future<ListTargetsByRuleResponse> listTargetsByRule({
    @_s.required String rule,
    String eventBusName,
    int limit,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(rule, 'rule');
    _s.validateStringLength(
      'rule',
      rule,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'rule',
      rule,
      r'''[\.\-_A-Za-z0-9]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'eventBusName',
      eventBusName,
      1,
      256,
    );
    _s.validateStringPattern(
      'eventBusName',
      eventBusName,
      r'''[/\.\-_A-Za-z0-9]+''',
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
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
        'EventBusName': eventBusName,
        'Limit': limit,
        'NextToken': nextToken,
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
    @_s.required List<PutEventsRequestEntry> entries,
  }) async {
    ArgumentError.checkNotNull(entries, 'entries');
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
  /// event bus. AWS customers do not use this operation.
  ///
  /// May throw [InternalException].
  ///
  /// Parameter [entries] :
  /// The list of events to write to the event bus.
  Future<PutPartnerEventsResponse> putPartnerEvents({
    @_s.required List<PutPartnerEventsRequestEntry> entries,
  }) async {
    ArgumentError.checkNotNull(entries, 'entries');
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

  /// Running <code>PutPermission</code> permits the specified AWS account or
  /// AWS organization to put events to the specified <i>event bus</i>.
  /// CloudWatch Events rules in your account are triggered by these events
  /// arriving to an event bus in your account.
  ///
  /// For another account to send events to your account, that external account
  /// must have an EventBridge rule with your account's event bus as a target.
  ///
  /// To enable multiple AWS accounts to put events to your event bus, run
  /// <code>PutPermission</code> once for each of these accounts. Or, if all the
  /// accounts are members of the same AWS organization, you can run
  /// <code>PutPermission</code> once specifying <code>Principal</code> as "*"
  /// and specifying the AWS organization ID in <code>Condition</code>, to grant
  /// permissions to all accounts in that organization.
  ///
  /// If you grant permissions using an organization, then accounts in that
  /// organization must specify a <code>RoleArn</code> with proper permissions
  /// when they use <code>PutTarget</code> to add your account's event bus as a
  /// target. For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-cross-account-event-delivery.html">Sending
  /// and Receiving Events Between AWS Accounts</a> in the <i>Amazon EventBridge
  /// User Guide</i>.
  ///
  /// The permission policy on the default event bus cannot exceed 10 KB in
  /// size.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [PolicyLengthExceededException].
  /// May throw [InternalException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [action] :
  /// The action that you are enabling the other account to perform. Currently,
  /// this must be <code>events:PutEvents</code>.
  ///
  /// Parameter [principal] :
  /// The 12-digit AWS account ID that you are permitting to put events to your
  /// default event bus. Specify "*" to permit any account to put events to your
  /// default event bus.
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
  /// external account, specify this <code>StatementId</code> when you run
  /// <a>RemovePermission</a>.
  ///
  /// Parameter [condition] :
  /// This parameter enables you to limit the permission to accounts that
  /// fulfill a certain condition, such as being a member of a certain AWS
  /// organization. For more information about AWS Organizations, see <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_introduction.html">What
  /// Is AWS Organizations</a> in the <i>AWS Organizations User Guide</i>.
  ///
  /// If you specify <code>Condition</code> with an AWS organization ID, and
  /// specify "*" as the value for <code>Principal</code>, you grant permission
  /// to all the accounts in the named organization.
  ///
  /// The <code>Condition</code> is a JSON string which must contain
  /// <code>Type</code>, <code>Key</code>, and <code>Value</code> fields.
  ///
  /// Parameter [eventBusName] :
  /// The event bus associated with the rule. If you omit this, the default
  /// event bus is used.
  Future<void> putPermission({
    @_s.required String action,
    @_s.required String principal,
    @_s.required String statementId,
    Condition condition,
    String eventBusName,
  }) async {
    ArgumentError.checkNotNull(action, 'action');
    _s.validateStringLength(
      'action',
      action,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'action',
      action,
      r'''events:[a-zA-Z]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(principal, 'principal');
    _s.validateStringLength(
      'principal',
      principal,
      1,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'principal',
      principal,
      r'''(\d{12}|\*)''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(statementId, 'statementId');
    _s.validateStringLength(
      'statementId',
      statementId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'statementId',
      statementId,
      r'''[a-zA-Z0-9-_]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'eventBusName',
      eventBusName,
      1,
      256,
    );
    _s.validateStringPattern(
      'eventBusName',
      eventBusName,
      r'''[\.\-_A-Za-z0-9]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.PutPermission'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Action': action,
        'Principal': principal,
        'StatementId': statementId,
        'Condition': condition,
        'EventBusName': eventBusName,
      },
    );
  }

  /// Creates or updates the specified rule. Rules are enabled by default, or
  /// based on value of the state. You can disable a rule using
  /// <a>DisableRule</a>.
  ///
  /// A single rule watches for events from a single event bus. Events generated
  /// by AWS services go to your account's default event bus. Events generated
  /// by SaaS partner services or applications go to the matching partner event
  /// bus. If you have custom applications or services, you can specify whether
  /// their events go to your default event bus or a custom event bus that you
  /// have created. For more information, see <a>CreateEventBus</a>.
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
  /// existing rule, use <a>TagResource</a> and <a>UntagResource</a>.
  ///
  /// Most services in AWS treat : or / as the same character in Amazon Resource
  /// Names (ARNs). However, EventBridge uses an exact match in event patterns
  /// and rules. Be sure to use the correct ARN characters when creating event
  /// patterns so that they match the ARN syntax in the event you want to match.
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
  /// The event bus to associate with this rule. If you omit this, the default
  /// event bus is used.
  ///
  /// Parameter [eventPattern] :
  /// The event pattern. For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-and-event-patterns.html">Events
  /// and Event Patterns</a> in the <i>Amazon EventBridge User Guide</i>.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role associated with the rule.
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
    @_s.required String name,
    String description,
    String eventBusName,
    String eventPattern,
    String roleArn,
    String scheduleExpression,
    RuleState state,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\.\-_A-Za-z0-9]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      512,
    );
    _s.validateStringLength(
      'eventBusName',
      eventBusName,
      1,
      256,
    );
    _s.validateStringPattern(
      'eventBusName',
      eventBusName,
      r'''[/\.\-_A-Za-z0-9]+''',
    );
    _s.validateStringLength(
      'roleArn',
      roleArn,
      1,
      1600,
    );
    _s.validateStringLength(
      'scheduleExpression',
      scheduleExpression,
      0,
      256,
    );
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
        'Description': description,
        'EventBusName': eventBusName,
        'EventPattern': eventPattern,
        'RoleArn': roleArn,
        'ScheduleExpression': scheduleExpression,
        'State': state?.toValue(),
        'Tags': tags,
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
  /// EC2 instances
  /// </li>
  /// <li>
  /// SSM Run Command
  /// </li>
  /// <li>
  /// SSM Automation
  /// </li>
  /// <li>
  /// AWS Lambda functions
  /// </li>
  /// <li>
  /// Data streams in Amazon Kinesis Data Streams
  /// </li>
  /// <li>
  /// Data delivery streams in Amazon Kinesis Data Firehose
  /// </li>
  /// <li>
  /// Amazon ECS tasks
  /// </li>
  /// <li>
  /// AWS Step Functions state machines
  /// </li>
  /// <li>
  /// AWS Batch jobs
  /// </li>
  /// <li>
  /// AWS CodeBuild projects
  /// </li>
  /// <li>
  /// Pipelines in AWS CodePipeline
  /// </li>
  /// <li>
  /// Amazon Inspector assessment templates
  /// </li>
  /// <li>
  /// Amazon SNS topics
  /// </li>
  /// <li>
  /// Amazon SQS queues, including FIFO queues
  /// </li>
  /// <li>
  /// The default event bus of another AWS account
  /// </li>
  /// </ul>
  /// Creating rules with built-in targets is supported only in the AWS
  /// Management Console. The built-in targets are <code>EC2 CreateSnapshot API
  /// call</code>, <code>EC2 RebootInstances API call</code>, <code>EC2
  /// StopInstances API call</code>, and <code>EC2 TerminateInstances API
  /// call</code>.
  ///
  /// For some target types, <code>PutTargets</code> provides target-specific
  /// parameters. If the target is a Kinesis data stream, you can optionally
  /// specify which shard the event goes to by using the
  /// <code>KinesisParameters</code> argument. To invoke a command on multiple
  /// EC2 instances with one rule, you can use the
  /// <code>RunCommandParameters</code> field.
  ///
  /// To be able to make API calls against the resources that you own, Amazon
  /// CloudWatch Events needs the appropriate permissions. For AWS Lambda and
  /// Amazon SNS resources, EventBridge relies on resource-based policies. For
  /// EC2 instances, Kinesis data streams, and AWS Step Functions state
  /// machines, EventBridge relies on IAM roles that you specify in the
  /// <code>RoleARN</code> argument in <code>PutTargets</code>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/auth-and-access-control-eventbridge.html">Authentication
  /// and Access Control</a> in the <i>Amazon EventBridge User Guide</i>.
  ///
  /// If another AWS account is in the same region and has granted you
  /// permission (using <code>PutPermission</code>), you can send events to that
  /// account. Set that account's event bus as a target of the rules in your
  /// account. To send the matched events to the other account, specify that
  /// account's event bus as the <code>Arn</code> value when you run
  /// <code>PutTargets</code>. If your account sends events to another account,
  /// your account is charged for each sent event. Each event sent to another
  /// account is charged as a custom event. The account receiving the event is
  /// not charged. For more information, see <a
  /// href="https://aws.amazon.com/cloudwatch/pricing/">Amazon CloudWatch
  /// Pricing</a>.
  /// <note>
  /// <code>Input</code>, <code>InputPath</code>, and
  /// <code>InputTransformer</code> are not available with
  /// <code>PutTarget</code> if the target is an event bus of a different AWS
  /// account.
  /// </note>
  /// If you are setting the event bus of another account as the target, and
  /// that account granted permission to your account through an organization
  /// instead of directly by the account ID, then you must specify a
  /// <code>RoleArn</code> with proper permissions in the <code>Target</code>
  /// structure. For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-cross-account-event-delivery.html">Sending
  /// and Receiving Events Between AWS Accounts</a> in the <i>Amazon EventBridge
  /// User Guide</i>.
  ///
  /// For more information about enabling cross-account events, see
  /// <a>PutPermission</a>.
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
  /// The name of the event bus associated with the rule. If you omit this, the
  /// default event bus is used.
  Future<PutTargetsResponse> putTargets({
    @_s.required String rule,
    @_s.required List<Target> targets,
    String eventBusName,
  }) async {
    ArgumentError.checkNotNull(rule, 'rule');
    _s.validateStringLength(
      'rule',
      rule,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'rule',
      rule,
      r'''[\.\-_A-Za-z0-9]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(targets, 'targets');
    _s.validateStringLength(
      'eventBusName',
      eventBusName,
      1,
      256,
    );
    _s.validateStringPattern(
      'eventBusName',
      eventBusName,
      r'''[/\.\-_A-Za-z0-9]+''',
    );
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
        'EventBusName': eventBusName,
      },
    );

    return PutTargetsResponse.fromJson(jsonResponse.body);
  }

  /// Revokes the permission of another AWS account to be able to put events to
  /// the specified event bus. Specify the account to revoke by the
  /// <code>StatementId</code> value that you associated with the account when
  /// you granted it permission with <code>PutPermission</code>. You can find
  /// the <code>StatementId</code> by using <a>DescribeEventBus</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [statementId] :
  /// The statement ID corresponding to the account that is no longer allowed to
  /// put events to the default event bus.
  ///
  /// Parameter [eventBusName] :
  /// The name of the event bus to revoke permissions for. If you omit this, the
  /// default event bus is used.
  Future<void> removePermission({
    @_s.required String statementId,
    String eventBusName,
  }) async {
    ArgumentError.checkNotNull(statementId, 'statementId');
    _s.validateStringLength(
      'statementId',
      statementId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'statementId',
      statementId,
      r'''[a-zA-Z0-9-_]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'eventBusName',
      eventBusName,
      1,
      256,
    );
    _s.validateStringPattern(
      'eventBusName',
      eventBusName,
      r'''[\.\-_A-Za-z0-9]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.RemovePermission'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'StatementId': statementId,
        'EventBusName': eventBusName,
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
  /// The name of the event bus associated with the rule.
  ///
  /// Parameter [force] :
  /// If this is a managed rule, created by an AWS service on your behalf, you
  /// must specify <code>Force</code> as <code>True</code> to remove targets.
  /// This parameter is ignored for rules that are not managed rules. You can
  /// check whether a rule is a managed rule by using <code>DescribeRule</code>
  /// or <code>ListRules</code> and checking the <code>ManagedBy</code> field of
  /// the response.
  Future<RemoveTargetsResponse> removeTargets({
    @_s.required List<String> ids,
    @_s.required String rule,
    String eventBusName,
    bool force,
  }) async {
    ArgumentError.checkNotNull(ids, 'ids');
    ArgumentError.checkNotNull(rule, 'rule');
    _s.validateStringLength(
      'rule',
      rule,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'rule',
      rule,
      r'''[\.\-_A-Za-z0-9]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'eventBusName',
      eventBusName,
      1,
      256,
    );
    _s.validateStringPattern(
      'eventBusName',
      eventBusName,
      r'''[/\.\-_A-Za-z0-9]+''',
    );
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
        'EventBusName': eventBusName,
        'Force': force,
      },
    );

    return RemoveTargetsResponse.fromJson(jsonResponse.body);
  }

  /// Assigns one or more tags (key-value pairs) to the specified EventBridge
  /// resource. Tags can help you organize and categorize your resources. You
  /// can also use them to scope user permissions by granting a user permission
  /// to access or change only resources with certain tag values. In
  /// EventBridge, rules and event buses can be tagged.
  ///
  /// Tags don't have any semantic meaning to AWS and are interpreted strictly
  /// as strings of characters.
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
    @_s.required String resourceARN,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      1,
      1600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.TagResource'
    };
    final jsonResponse = await _protocol.send(
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

    return TagResourceResponse.fromJson(jsonResponse.body);
  }

  /// Tests whether the specified event pattern matches the provided event.
  ///
  /// Most services in AWS treat : or / as the same character in Amazon Resource
  /// Names (ARNs). However, EventBridge uses an exact match in event patterns
  /// and rules. Be sure to use the correct ARN characters when creating event
  /// patterns so that they match the ARN syntax in the event you want to match.
  ///
  /// May throw [InvalidEventPatternException].
  /// May throw [InternalException].
  ///
  /// Parameter [event] :
  /// The event, in JSON format, to test against the event pattern.
  ///
  /// Parameter [eventPattern] :
  /// The event pattern. For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-and-event-patterns.html">Events
  /// and Event Patterns</a> in the <i>Amazon EventBridge User Guide</i>.
  Future<TestEventPatternResponse> testEventPattern({
    @_s.required String event,
    @_s.required String eventPattern,
  }) async {
    ArgumentError.checkNotNull(event, 'event');
    ArgumentError.checkNotNull(eventPattern, 'eventPattern');
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
  /// CloudWatch Events, rules and event buses can be tagged.
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
    @_s.required String resourceARN,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      1,
      1600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSEvents.UntagResource'
    };
    final jsonResponse = await _protocol.send(
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

    return UntagResourceResponse.fromJson(jsonResponse.body);
  }
}

enum AssignPublicIp {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLED')
  disabled,
}

/// This structure specifies the VPC subnets and security groups for the task,
/// and whether a public IP address is to be used. This structure is relevant
/// only for ECS tasks that use the <code>awsvpc</code> network mode.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsVpcConfiguration {
  /// Specifies the subnets associated with the task. These subnets must all be in
  /// the same VPC. You can specify as many as 16 subnets.
  @_s.JsonKey(name: 'Subnets')
  final List<String> subnets;

  /// Specifies whether the task's elastic network interface receives a public IP
  /// address. You can specify <code>ENABLED</code> only when
  /// <code>LaunchType</code> in <code>EcsParameters</code> is set to
  /// <code>FARGATE</code>.
  @_s.JsonKey(name: 'AssignPublicIp')
  final AssignPublicIp assignPublicIp;

  /// Specifies the security groups associated with the task. These security
  /// groups must all be in the same VPC. You can specify as many as five security
  /// groups. If you do not specify a security group, the default security group
  /// for the VPC is used.
  @_s.JsonKey(name: 'SecurityGroups')
  final List<String> securityGroups;

  AwsVpcConfiguration({
    @_s.required this.subnets,
    this.assignPublicIp,
    this.securityGroups,
  });
  factory AwsVpcConfiguration.fromJson(Map<String, dynamic> json) =>
      _$AwsVpcConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$AwsVpcConfigurationToJson(this);
}

/// The array properties for the submitted job, such as the size of the array.
/// The array size can be between 2 and 10,000. If you specify array properties
/// for a job, it becomes an array job. This parameter is used only if the
/// target is an AWS Batch job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class BatchArrayProperties {
  /// The size of the array, if this is an array batch job. Valid values are
  /// integers between 2 and 10,000.
  @_s.JsonKey(name: 'Size')
  final int size;

  BatchArrayProperties({
    this.size,
  });
  factory BatchArrayProperties.fromJson(Map<String, dynamic> json) =>
      _$BatchArrayPropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$BatchArrayPropertiesToJson(this);
}

/// The custom parameters to be used when the target is an AWS Batch job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class BatchParameters {
  /// The ARN or name of the job definition to use if the event target is an AWS
  /// Batch job. This job definition must already exist.
  @_s.JsonKey(name: 'JobDefinition')
  final String jobDefinition;

  /// The name to use for this execution of the job, if the target is an AWS Batch
  /// job.
  @_s.JsonKey(name: 'JobName')
  final String jobName;

  /// The array properties for the submitted job, such as the size of the array.
  /// The array size can be between 2 and 10,000. If you specify array properties
  /// for a job, it becomes an array job. This parameter is used only if the
  /// target is an AWS Batch job.
  @_s.JsonKey(name: 'ArrayProperties')
  final BatchArrayProperties arrayProperties;

  /// The retry strategy to use for failed jobs, if the target is an AWS Batch
  /// job. The retry strategy is the number of times to retry the failed job
  /// execution. Valid values are 1–10. When you specify a retry strategy here, it
  /// overrides the retry strategy defined in the job definition.
  @_s.JsonKey(name: 'RetryStrategy')
  final BatchRetryStrategy retryStrategy;

  BatchParameters({
    @_s.required this.jobDefinition,
    @_s.required this.jobName,
    this.arrayProperties,
    this.retryStrategy,
  });
  factory BatchParameters.fromJson(Map<String, dynamic> json) =>
      _$BatchParametersFromJson(json);

  Map<String, dynamic> toJson() => _$BatchParametersToJson(this);
}

/// The retry strategy to use for failed jobs, if the target is an AWS Batch
/// job. If you specify a retry strategy here, it overrides the retry strategy
/// defined in the job definition.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class BatchRetryStrategy {
  /// The number of times to attempt to retry, if the job fails. Valid values are
  /// 1–10.
  @_s.JsonKey(name: 'Attempts')
  final int attempts;

  BatchRetryStrategy({
    this.attempts,
  });
  factory BatchRetryStrategy.fromJson(Map<String, dynamic> json) =>
      _$BatchRetryStrategyFromJson(json);

  Map<String, dynamic> toJson() => _$BatchRetryStrategyToJson(this);
}

/// A JSON string which you can use to limit the event bus permissions you are
/// granting to only accounts that fulfill the condition. Currently, the only
/// supported condition is membership in a certain AWS organization. The string
/// must contain <code>Type</code>, <code>Key</code>, and <code>Value</code>
/// fields. The <code>Value</code> field specifies the ID of the AWS
/// organization. Following is an example value for <code>Condition</code>:
///
/// <code>'{"Type" : "StringEquals", "Key": "aws:PrincipalOrgID", "Value":
/// "o-1234567890"}'</code>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Condition {
  /// Specifies the key for the condition. Currently the only supported key is
  /// <code>aws:PrincipalOrgID</code>.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// Specifies the type of condition. Currently the only supported value is
  /// <code>StringEquals</code>.
  @_s.JsonKey(name: 'Type')
  final String type;

  /// Specifies the value for the key. Currently, this must be the ID of the
  /// organization.
  @_s.JsonKey(name: 'Value')
  final String value;

  Condition({
    @_s.required this.key,
    @_s.required this.type,
    @_s.required this.value,
  });
  Map<String, dynamic> toJson() => _$ConditionToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateEventBusResponse {
  /// The ARN of the new event bus.
  @_s.JsonKey(name: 'EventBusArn')
  final String eventBusArn;

  CreateEventBusResponse({
    this.eventBusArn,
  });
  factory CreateEventBusResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateEventBusResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreatePartnerEventSourceResponse {
  /// The ARN of the partner event source.
  @_s.JsonKey(name: 'EventSourceArn')
  final String eventSourceArn;

  CreatePartnerEventSourceResponse({
    this.eventSourceArn,
  });
  factory CreatePartnerEventSourceResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreatePartnerEventSourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeEventBusResponse {
  /// The Amazon Resource Name (ARN) of the account permitted to write events to
  /// the current account.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The name of the event bus. Currently, this is always <code>default</code>.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The policy that enables the external account to send events to your account.
  @_s.JsonKey(name: 'Policy')
  final String policy;

  DescribeEventBusResponse({
    this.arn,
    this.name,
    this.policy,
  });
  factory DescribeEventBusResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeEventBusResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeEventSourceResponse {
  /// The ARN of the partner event source.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The name of the SaaS partner that created the event source.
  @_s.JsonKey(name: 'CreatedBy')
  final String createdBy;

  /// The date and time that the event source was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The date and time that the event source will expire if you do not create a
  /// matching event bus.
  @_s.JsonKey(
      name: 'ExpirationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime expirationTime;

  /// The name of the partner event source.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The state of the event source. If it is ACTIVE, you have already created a
  /// matching event bus for this event source, and that event bus is active. If
  /// it is PENDING, either you haven't yet created a matching event bus, or that
  /// event bus is deactivated. If it is DELETED, you have created a matching
  /// event bus, but the event source has since been deleted.
  @_s.JsonKey(name: 'State')
  final EventSourceState state;

  DescribeEventSourceResponse({
    this.arn,
    this.createdBy,
    this.creationTime,
    this.expirationTime,
    this.name,
    this.state,
  });
  factory DescribeEventSourceResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeEventSourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribePartnerEventSourceResponse {
  /// The ARN of the event source.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The name of the event source.
  @_s.JsonKey(name: 'Name')
  final String name;

  DescribePartnerEventSourceResponse({
    this.arn,
    this.name,
  });
  factory DescribePartnerEventSourceResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribePartnerEventSourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeRuleResponse {
  /// The Amazon Resource Name (ARN) of the rule.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The description of the rule.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The event bus associated with the rule.
  @_s.JsonKey(name: 'EventBusName')
  final String eventBusName;

  /// The event pattern. For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-and-event-patterns.html">Events
  /// and Event Patterns</a> in the <i>Amazon EventBridge User Guide</i>.
  @_s.JsonKey(name: 'EventPattern')
  final String eventPattern;

  /// If this is a managed rule, created by an AWS service on your behalf, this
  /// field displays the principal name of the AWS service that created the rule.
  @_s.JsonKey(name: 'ManagedBy')
  final String managedBy;

  /// The name of the rule.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The Amazon Resource Name (ARN) of the IAM role associated with the rule.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;

  /// The scheduling expression. For example, "cron(0 20 * * ? *)", "rate(5
  /// minutes)".
  @_s.JsonKey(name: 'ScheduleExpression')
  final String scheduleExpression;

  /// Specifies whether the rule is enabled or disabled.
  @_s.JsonKey(name: 'State')
  final RuleState state;

  DescribeRuleResponse({
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
  factory DescribeRuleResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeRuleResponseFromJson(json);
}

/// The custom parameters to be used when the target is an Amazon ECS task.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EcsParameters {
  /// The ARN of the task definition to use if the event target is an Amazon ECS
  /// task.
  @_s.JsonKey(name: 'TaskDefinitionArn')
  final String taskDefinitionArn;

  /// Specifies an ECS task group for the task. The maximum length is 255
  /// characters.
  @_s.JsonKey(name: 'Group')
  final String group;

  /// Specifies the launch type on which your task is running. The launch type
  /// that you specify here must match one of the launch type (compatibilities) of
  /// the target task. The <code>FARGATE</code> value is supported only in the
  /// Regions where AWS Fargate with Amazon ECS is supported. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/AWS-Fargate.html">AWS
  /// Fargate on Amazon ECS</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  @_s.JsonKey(name: 'LaunchType')
  final LaunchType launchType;

  /// Use this structure if the ECS task uses the <code>awsvpc</code> network
  /// mode. This structure specifies the VPC subnets and security groups
  /// associated with the task, and whether a public IP address is to be used.
  /// This structure is required if <code>LaunchType</code> is
  /// <code>FARGATE</code> because the <code>awsvpc</code> mode is required for
  /// Fargate tasks.
  ///
  /// If you specify <code>NetworkConfiguration</code> when the target ECS task
  /// does not use the <code>awsvpc</code> network mode, the task fails.
  @_s.JsonKey(name: 'NetworkConfiguration')
  final NetworkConfiguration networkConfiguration;

  /// Specifies the platform version for the task. Specify only the numeric
  /// portion of the platform version, such as <code>1.1.0</code>.
  ///
  /// This structure is used only if <code>LaunchType</code> is
  /// <code>FARGATE</code>. For more information about valid platform versions,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/platform_versions.html">AWS
  /// Fargate Platform Versions</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  @_s.JsonKey(name: 'PlatformVersion')
  final String platformVersion;

  /// The number of tasks to create based on <code>TaskDefinition</code>. The
  /// default is 1.
  @_s.JsonKey(name: 'TaskCount')
  final int taskCount;

  EcsParameters({
    @_s.required this.taskDefinitionArn,
    this.group,
    this.launchType,
    this.networkConfiguration,
    this.platformVersion,
    this.taskCount,
  });
  factory EcsParameters.fromJson(Map<String, dynamic> json) =>
      _$EcsParametersFromJson(json);

  Map<String, dynamic> toJson() => _$EcsParametersToJson(this);
}

/// An event bus receives events from a source and routes them to rules
/// associated with that event bus. Your account's default event bus receives
/// rules from AWS services. A custom event bus can receive rules from AWS
/// services as well as your custom applications and services. A partner event
/// bus receives events from an event source created by an SaaS partner. These
/// events come from the partners services or applications.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EventBus {
  /// The ARN of the event bus.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The name of the event bus.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The permissions policy of the event bus, describing which other AWS accounts
  /// can write events to this event bus.
  @_s.JsonKey(name: 'Policy')
  final String policy;

  EventBus({
    this.arn,
    this.name,
    this.policy,
  });
  factory EventBus.fromJson(Map<String, dynamic> json) =>
      _$EventBusFromJson(json);
}

/// A partner event source is created by an SaaS partner. If a customer creates
/// a partner event bus that matches this event source, that AWS account can
/// receive events from the partner's applications or services.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EventSource {
  /// The ARN of the event source.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The name of the partner that created the event source.
  @_s.JsonKey(name: 'CreatedBy')
  final String createdBy;

  /// The date and time the event source was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The date and time that the event source will expire, if the AWS account
  /// doesn't create a matching event bus for it.
  @_s.JsonKey(
      name: 'ExpirationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime expirationTime;

  /// The name of the event source.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The state of the event source. If it is ACTIVE, you have already created a
  /// matching event bus for this event source, and that event bus is active. If
  /// it is PENDING, either you haven't yet created a matching event bus, or that
  /// event bus is deactivated. If it is DELETED, you have created a matching
  /// event bus, but the event source has since been deleted.
  @_s.JsonKey(name: 'State')
  final EventSourceState state;

  EventSource({
    this.arn,
    this.createdBy,
    this.creationTime,
    this.expirationTime,
    this.name,
    this.state,
  });
  factory EventSource.fromJson(Map<String, dynamic> json) =>
      _$EventSourceFromJson(json);
}

enum EventSourceState {
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('DELETED')
  deleted,
}

/// Contains the parameters needed for you to provide custom input to a target
/// based on one or more pieces of data extracted from the event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
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
  /// <li>
  /// Object values cannot include quote marks.
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
  @_s.JsonKey(name: 'InputTemplate')
  final String inputTemplate;

  /// Map of JSON paths to be extracted from the event. You can then insert these
  /// in the template in <code>InputTemplate</code> to produce the output you want
  /// to be sent to the target.
  ///
  /// <code>InputPathsMap</code> is an array key-value pairs, where each value is
  /// a valid JSON path. You can have as many as 10 key-value pairs. You must use
  /// JSON dot notation, not bracket notation.
  ///
  /// The keys cannot start with "AWS."
  @_s.JsonKey(name: 'InputPathsMap')
  final Map<String, String> inputPathsMap;

  InputTransformer({
    @_s.required this.inputTemplate,
    this.inputPathsMap,
  });
  factory InputTransformer.fromJson(Map<String, dynamic> json) =>
      _$InputTransformerFromJson(json);

  Map<String, dynamic> toJson() => _$InputTransformerToJson(this);
}

/// This object enables you to specify a JSON path to extract from the event and
/// use as the partition key for the Amazon Kinesis data stream, so that you can
/// control the shard to which the event goes. If you do not include this
/// parameter, the default is to use the <code>eventId</code> as the partition
/// key.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class KinesisParameters {
  /// The JSON path to be extracted from the event and used as the partition key.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/streams/latest/dev/key-concepts.html#partition-key">Amazon
  /// Kinesis Streams Key Concepts</a> in the <i>Amazon Kinesis Streams Developer
  /// Guide</i>.
  @_s.JsonKey(name: 'PartitionKeyPath')
  final String partitionKeyPath;

  KinesisParameters({
    @_s.required this.partitionKeyPath,
  });
  factory KinesisParameters.fromJson(Map<String, dynamic> json) =>
      _$KinesisParametersFromJson(json);

  Map<String, dynamic> toJson() => _$KinesisParametersToJson(this);
}

enum LaunchType {
  @_s.JsonValue('EC2')
  ec2,
  @_s.JsonValue('FARGATE')
  fargate,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListEventBusesResponse {
  /// This list of event buses.
  @_s.JsonKey(name: 'EventBuses')
  final List<EventBus> eventBuses;

  /// A token you can use in a subsequent operation to retrieve the next set of
  /// results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListEventBusesResponse({
    this.eventBuses,
    this.nextToken,
  });
  factory ListEventBusesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListEventBusesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListEventSourcesResponse {
  /// The list of event sources.
  @_s.JsonKey(name: 'EventSources')
  final List<EventSource> eventSources;

  /// A token you can use in a subsequent operation to retrieve the next set of
  /// results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListEventSourcesResponse({
    this.eventSources,
    this.nextToken,
  });
  factory ListEventSourcesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListEventSourcesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListPartnerEventSourceAccountsResponse {
  /// A token you can use in a subsequent operation to retrieve the next set of
  /// results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The list of partner event sources returned by the operation.
  @_s.JsonKey(name: 'PartnerEventSourceAccounts')
  final List<PartnerEventSourceAccount> partnerEventSourceAccounts;

  ListPartnerEventSourceAccountsResponse({
    this.nextToken,
    this.partnerEventSourceAccounts,
  });
  factory ListPartnerEventSourceAccountsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListPartnerEventSourceAccountsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListPartnerEventSourcesResponse {
  /// A token you can use in a subsequent operation to retrieve the next set of
  /// results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The list of partner event sources returned by the operation.
  @_s.JsonKey(name: 'PartnerEventSources')
  final List<PartnerEventSource> partnerEventSources;

  ListPartnerEventSourcesResponse({
    this.nextToken,
    this.partnerEventSources,
  });
  factory ListPartnerEventSourcesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListPartnerEventSourcesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListRuleNamesByTargetResponse {
  /// Indicates whether there are additional results to retrieve. If there are no
  /// more results, the value is null.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The names of the rules that can invoke the given target.
  @_s.JsonKey(name: 'RuleNames')
  final List<String> ruleNames;

  ListRuleNamesByTargetResponse({
    this.nextToken,
    this.ruleNames,
  });
  factory ListRuleNamesByTargetResponse.fromJson(Map<String, dynamic> json) =>
      _$ListRuleNamesByTargetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListRulesResponse {
  /// Indicates whether there are additional results to retrieve. If there are no
  /// more results, the value is null.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The rules that match the specified criteria.
  @_s.JsonKey(name: 'Rules')
  final List<Rule> rules;

  ListRulesResponse({
    this.nextToken,
    this.rules,
  });
  factory ListRulesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListRulesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// The list of tag keys and values associated with the resource you specified
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTargetsByRuleResponse {
  /// Indicates whether there are additional results to retrieve. If there are no
  /// more results, the value is null.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The targets assigned to the rule.
  @_s.JsonKey(name: 'Targets')
  final List<Target> targets;

  ListTargetsByRuleResponse({
    this.nextToken,
    this.targets,
  });
  factory ListTargetsByRuleResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTargetsByRuleResponseFromJson(json);
}

/// This structure specifies the network configuration for an ECS task.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class NetworkConfiguration {
  /// Use this structure to specify the VPC subnets and security groups for the
  /// task, and whether a public IP address is to be used. This structure is
  /// relevant only for ECS tasks that use the <code>awsvpc</code> network mode.
  @_s.JsonKey(name: 'awsvpcConfiguration')
  final AwsVpcConfiguration awsvpcConfiguration;

  NetworkConfiguration({
    this.awsvpcConfiguration,
  });
  factory NetworkConfiguration.fromJson(Map<String, dynamic> json) =>
      _$NetworkConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkConfigurationToJson(this);
}

/// A partner event source is created by an SaaS partner. If a customer creates
/// a partner event bus that matches this event source, that AWS account can
/// receive events from the partner's applications or services.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PartnerEventSource {
  /// The ARN of the partner event source.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The name of the partner event source.
  @_s.JsonKey(name: 'Name')
  final String name;

  PartnerEventSource({
    this.arn,
    this.name,
  });
  factory PartnerEventSource.fromJson(Map<String, dynamic> json) =>
      _$PartnerEventSourceFromJson(json);
}

/// The AWS account that a partner event source has been offered to.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PartnerEventSourceAccount {
  /// The AWS account ID that the partner event source was offered to.
  @_s.JsonKey(name: 'Account')
  final String account;

  /// The date and time the event source was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The date and time that the event source will expire, if the AWS account
  /// doesn't create a matching event bus for it.
  @_s.JsonKey(
      name: 'ExpirationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime expirationTime;

  /// The state of the event source. If it is ACTIVE, you have already created a
  /// matching event bus for this event source, and that event bus is active. If
  /// it is PENDING, either you haven't yet created a matching event bus, or that
  /// event bus is deactivated. If it is DELETED, you have created a matching
  /// event bus, but the event source has since been deleted.
  @_s.JsonKey(name: 'State')
  final EventSourceState state;

  PartnerEventSourceAccount({
    this.account,
    this.creationTime,
    this.expirationTime,
    this.state,
  });
  factory PartnerEventSourceAccount.fromJson(Map<String, dynamic> json) =>
      _$PartnerEventSourceAccountFromJson(json);
}

/// Represents an event to be submitted.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class PutEventsRequestEntry {
  /// A valid JSON string. There is no other schema imposed. The JSON string may
  /// contain fields and nested subobjects.
  @_s.JsonKey(name: 'Detail')
  final String detail;

  /// Free-form string used to decide what fields to expect in the event detail.
  @_s.JsonKey(name: 'DetailType')
  final String detailType;

  /// The event bus that will receive the event. Only the rules that are
  /// associated with this event bus will be able to match the event.
  @_s.JsonKey(name: 'EventBusName')
  final String eventBusName;

  /// AWS resources, identified by Amazon Resource Name (ARN), which the event
  /// primarily concerns. Any number, including zero, may be present.
  @_s.JsonKey(name: 'Resources')
  final List<String> resources;

  /// The source of the event.
  @_s.JsonKey(name: 'Source')
  final String source;

  /// The time stamp of the event, per <a
  /// href="https://www.rfc-editor.org/rfc/rfc3339.txt">RFC3339</a>. If no time
  /// stamp is provided, the time stamp of the <a>PutEvents</a> call is used.
  @_s.JsonKey(name: 'Time', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime time;

  PutEventsRequestEntry({
    this.detail,
    this.detailType,
    this.eventBusName,
    this.resources,
    this.source,
    this.time,
  });
  Map<String, dynamic> toJson() => _$PutEventsRequestEntryToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutEventsResponse {
  /// The successfully and unsuccessfully ingested events results. If the
  /// ingestion was successful, the entry has the event ID in it. Otherwise, you
  /// can use the error code and error message to identify the problem with the
  /// entry.
  @_s.JsonKey(name: 'Entries')
  final List<PutEventsResultEntry> entries;

  /// The number of failed entries.
  @_s.JsonKey(name: 'FailedEntryCount')
  final int failedEntryCount;

  PutEventsResponse({
    this.entries,
    this.failedEntryCount,
  });
  factory PutEventsResponse.fromJson(Map<String, dynamic> json) =>
      _$PutEventsResponseFromJson(json);
}

/// Represents an event that failed to be submitted.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutEventsResultEntry {
  /// The error code that indicates why the event submission failed.
  @_s.JsonKey(name: 'ErrorCode')
  final String errorCode;

  /// The error message that explains why the event submission failed.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  /// The ID of the event.
  @_s.JsonKey(name: 'EventId')
  final String eventId;

  PutEventsResultEntry({
    this.errorCode,
    this.errorMessage,
    this.eventId,
  });
  factory PutEventsResultEntry.fromJson(Map<String, dynamic> json) =>
      _$PutEventsResultEntryFromJson(json);
}

/// The details about an event generated by an SaaS partner.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class PutPartnerEventsRequestEntry {
  /// A valid JSON string. There is no other schema imposed. The JSON string may
  /// contain fields and nested subobjects.
  @_s.JsonKey(name: 'Detail')
  final String detail;

  /// A free-form string used to decide what fields to expect in the event detail.
  @_s.JsonKey(name: 'DetailType')
  final String detailType;

  /// AWS resources, identified by Amazon Resource Name (ARN), which the event
  /// primarily concerns. Any number, including zero, may be present.
  @_s.JsonKey(name: 'Resources')
  final List<String> resources;

  /// The event source that is generating the evntry.
  @_s.JsonKey(name: 'Source')
  final String source;

  /// The date and time of the event.
  @_s.JsonKey(name: 'Time', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime time;

  PutPartnerEventsRequestEntry({
    this.detail,
    this.detailType,
    this.resources,
    this.source,
    this.time,
  });
  Map<String, dynamic> toJson() => _$PutPartnerEventsRequestEntryToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutPartnerEventsResponse {
  /// The list of events from this operation that were successfully written to the
  /// partner event bus.
  @_s.JsonKey(name: 'Entries')
  final List<PutPartnerEventsResultEntry> entries;

  /// The number of events from this operation that could not be written to the
  /// partner event bus.
  @_s.JsonKey(name: 'FailedEntryCount')
  final int failedEntryCount;

  PutPartnerEventsResponse({
    this.entries,
    this.failedEntryCount,
  });
  factory PutPartnerEventsResponse.fromJson(Map<String, dynamic> json) =>
      _$PutPartnerEventsResponseFromJson(json);
}

/// Represents an event that a partner tried to generate, but failed.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutPartnerEventsResultEntry {
  /// The error code that indicates why the event submission failed.
  @_s.JsonKey(name: 'ErrorCode')
  final String errorCode;

  /// The error message that explains why the event submission failed.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  /// The ID of the event.
  @_s.JsonKey(name: 'EventId')
  final String eventId;

  PutPartnerEventsResultEntry({
    this.errorCode,
    this.errorMessage,
    this.eventId,
  });
  factory PutPartnerEventsResultEntry.fromJson(Map<String, dynamic> json) =>
      _$PutPartnerEventsResultEntryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutRuleResponse {
  /// The Amazon Resource Name (ARN) of the rule.
  @_s.JsonKey(name: 'RuleArn')
  final String ruleArn;

  PutRuleResponse({
    this.ruleArn,
  });
  factory PutRuleResponse.fromJson(Map<String, dynamic> json) =>
      _$PutRuleResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutTargetsResponse {
  /// The failed target entries.
  @_s.JsonKey(name: 'FailedEntries')
  final List<PutTargetsResultEntry> failedEntries;

  /// The number of failed entries.
  @_s.JsonKey(name: 'FailedEntryCount')
  final int failedEntryCount;

  PutTargetsResponse({
    this.failedEntries,
    this.failedEntryCount,
  });
  factory PutTargetsResponse.fromJson(Map<String, dynamic> json) =>
      _$PutTargetsResponseFromJson(json);
}

/// Represents a target that failed to be added to a rule.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutTargetsResultEntry {
  /// The error code that indicates why the target addition failed. If the value
  /// is <code>ConcurrentModificationException</code>, too many requests were made
  /// at the same time.
  @_s.JsonKey(name: 'ErrorCode')
  final String errorCode;

  /// The error message that explains why the target addition failed.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  /// The ID of the target.
  @_s.JsonKey(name: 'TargetId')
  final String targetId;

  PutTargetsResultEntry({
    this.errorCode,
    this.errorMessage,
    this.targetId,
  });
  factory PutTargetsResultEntry.fromJson(Map<String, dynamic> json) =>
      _$PutTargetsResultEntryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RemoveTargetsResponse {
  /// The failed target entries.
  @_s.JsonKey(name: 'FailedEntries')
  final List<RemoveTargetsResultEntry> failedEntries;

  /// The number of failed entries.
  @_s.JsonKey(name: 'FailedEntryCount')
  final int failedEntryCount;

  RemoveTargetsResponse({
    this.failedEntries,
    this.failedEntryCount,
  });
  factory RemoveTargetsResponse.fromJson(Map<String, dynamic> json) =>
      _$RemoveTargetsResponseFromJson(json);
}

/// Represents a target that failed to be removed from a rule.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RemoveTargetsResultEntry {
  /// The error code that indicates why the target removal failed. If the value is
  /// <code>ConcurrentModificationException</code>, too many requests were made at
  /// the same time.
  @_s.JsonKey(name: 'ErrorCode')
  final String errorCode;

  /// The error message that explains why the target removal failed.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  /// The ID of the target.
  @_s.JsonKey(name: 'TargetId')
  final String targetId;

  RemoveTargetsResultEntry({
    this.errorCode,
    this.errorMessage,
    this.targetId,
  });
  factory RemoveTargetsResultEntry.fromJson(Map<String, dynamic> json) =>
      _$RemoveTargetsResultEntryFromJson(json);
}

/// Contains information about a rule in Amazon EventBridge.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Rule {
  /// The Amazon Resource Name (ARN) of the rule.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The description of the rule.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The event bus associated with the rule.
  @_s.JsonKey(name: 'EventBusName')
  final String eventBusName;

  /// The event pattern of the rule. For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-and-event-patterns.html">Events
  /// and Event Patterns</a> in the <i>Amazon EventBridge User Guide</i>.
  @_s.JsonKey(name: 'EventPattern')
  final String eventPattern;

  /// If the rule was created on behalf of your account by an AWS service, this
  /// field displays the principal name of the service that created the rule.
  @_s.JsonKey(name: 'ManagedBy')
  final String managedBy;

  /// The name of the rule.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The Amazon Resource Name (ARN) of the role that is used for target
  /// invocation.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;

  /// The scheduling expression. For example, "cron(0 20 * * ? *)", "rate(5
  /// minutes)".
  @_s.JsonKey(name: 'ScheduleExpression')
  final String scheduleExpression;

  /// The state of the rule.
  @_s.JsonKey(name: 'State')
  final RuleState state;

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
  factory Rule.fromJson(Map<String, dynamic> json) => _$RuleFromJson(json);
}

enum RuleState {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLED')
  disabled,
}

extension on RuleState {
  String toValue() {
    switch (this) {
      case RuleState.enabled:
        return 'ENABLED';
      case RuleState.disabled:
        return 'DISABLED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// This parameter contains the criteria (either InstanceIds or a tag) used to
/// specify which EC2 instances are to be sent the command.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RunCommandParameters {
  /// Currently, we support including only one RunCommandTarget block, which
  /// specifies either an array of InstanceIds or a tag.
  @_s.JsonKey(name: 'RunCommandTargets')
  final List<RunCommandTarget> runCommandTargets;

  RunCommandParameters({
    @_s.required this.runCommandTargets,
  });
  factory RunCommandParameters.fromJson(Map<String, dynamic> json) =>
      _$RunCommandParametersFromJson(json);

  Map<String, dynamic> toJson() => _$RunCommandParametersToJson(this);
}

/// Information about the EC2 instances that are to be sent the command,
/// specified as key-value pairs. Each <code>RunCommandTarget</code> block can
/// include only one key, but this key may specify multiple values.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RunCommandTarget {
  /// Can be either <code>tag:</code> <i>tag-key</i> or <code>InstanceIds</code>.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// If <code>Key</code> is <code>tag:</code> <i>tag-key</i>, <code>Values</code>
  /// is a list of tag values. If <code>Key</code> is <code>InstanceIds</code>,
  /// <code>Values</code> is a list of Amazon EC2 instance IDs.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  RunCommandTarget({
    @_s.required this.key,
    @_s.required this.values,
  });
  factory RunCommandTarget.fromJson(Map<String, dynamic> json) =>
      _$RunCommandTargetFromJson(json);

  Map<String, dynamic> toJson() => _$RunCommandTargetToJson(this);
}

/// This structure includes the custom parameter to be used when the target is
/// an SQS FIFO queue.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SqsParameters {
  /// The FIFO message group ID to use as the target.
  @_s.JsonKey(name: 'MessageGroupId')
  final String messageGroupId;

  SqsParameters({
    this.messageGroupId,
  });
  factory SqsParameters.fromJson(Map<String, dynamic> json) =>
      _$SqsParametersFromJson(json);

  Map<String, dynamic> toJson() => _$SqsParametersToJson(this);
}

/// A key-value pair associated with an AWS resource. In EventBridge, rules and
/// event buses support tagging.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// A string you can use to assign a value. The combination of tag keys and
  /// values can help you organize and categorize your resources.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The value for the specified tag key.
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    @_s.required this.key,
    @_s.required this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
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

/// Targets are the resources to be invoked when a rule is triggered. For a
/// complete list of services and resources that can be set as a target, see
/// <a>PutTargets</a>.
///
/// If you are setting the event bus of another account as the target, and that
/// account granted permission to your account through an organization instead
/// of directly by the account ID, then you must specify a <code>RoleArn</code>
/// with proper permissions in the <code>Target</code> structure. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-cross-account-event-delivery.html">Sending
/// and Receiving Events Between AWS Accounts</a> in the <i>Amazon EventBridge
/// User Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Target {
  /// The Amazon Resource Name (ARN) of the target.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The ID of the target.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// If the event target is an AWS Batch job, this contains the job definition,
  /// job name, and other parameters. For more information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/jobs.html">Jobs</a>
  /// in the <i>AWS Batch User Guide</i>.
  @_s.JsonKey(name: 'BatchParameters')
  final BatchParameters batchParameters;

  /// Contains the Amazon ECS task definition and task count to be used, if the
  /// event target is an Amazon ECS task. For more information about Amazon ECS
  /// tasks, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_defintions.html">Task
  /// Definitions </a> in the <i>Amazon EC2 Container Service Developer Guide</i>.
  @_s.JsonKey(name: 'EcsParameters')
  final EcsParameters ecsParameters;

  /// Valid JSON text passed to the target. In this case, nothing from the event
  /// itself is passed to the target. For more information, see <a
  /// href="http://www.rfc-editor.org/rfc/rfc7159.txt">The JavaScript Object
  /// Notation (JSON) Data Interchange Format</a>.
  @_s.JsonKey(name: 'Input')
  final String input;

  /// The value of the JSONPath that is used for extracting part of the matched
  /// event when passing it to the target. You must use JSON dot notation, not
  /// bracket notation. For more information about JSON paths, see <a
  /// href="http://goessner.net/articles/JsonPath/">JSONPath</a>.
  @_s.JsonKey(name: 'InputPath')
  final String inputPath;

  /// Settings to enable you to provide custom input to a target based on certain
  /// event data. You can extract one or more key-value pairs from the event and
  /// then use that data to send customized input to the target.
  @_s.JsonKey(name: 'InputTransformer')
  final InputTransformer inputTransformer;

  /// The custom parameter you can use to control the shard assignment, when the
  /// target is a Kinesis data stream. If you do not include this parameter, the
  /// default is to use the <code>eventId</code> as the partition key.
  @_s.JsonKey(name: 'KinesisParameters')
  final KinesisParameters kinesisParameters;

  /// The Amazon Resource Name (ARN) of the IAM role to be used for this target
  /// when the rule is triggered. If one rule triggers multiple targets, you can
  /// use a different IAM role for each target.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;

  /// Parameters used when you are using the rule to invoke Amazon EC2 Run
  /// Command.
  @_s.JsonKey(name: 'RunCommandParameters')
  final RunCommandParameters runCommandParameters;

  /// Contains the message group ID to use when the target is a FIFO queue.
  ///
  /// If you specify an SQS FIFO queue as a target, the queue must have
  /// content-based deduplication enabled.
  @_s.JsonKey(name: 'SqsParameters')
  final SqsParameters sqsParameters;

  Target({
    @_s.required this.arn,
    @_s.required this.id,
    this.batchParameters,
    this.ecsParameters,
    this.input,
    this.inputPath,
    this.inputTransformer,
    this.kinesisParameters,
    this.roleArn,
    this.runCommandParameters,
    this.sqsParameters,
  });
  factory Target.fromJson(Map<String, dynamic> json) => _$TargetFromJson(json);

  Map<String, dynamic> toJson() => _$TargetToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TestEventPatternResponse {
  /// Indicates whether the event matches the event pattern.
  @_s.JsonKey(name: 'Result')
  final bool result;

  TestEventPatternResponse({
    this.result,
  });
  factory TestEventPatternResponse.fromJson(Map<String, dynamic> json) =>
      _$TestEventPatternResponseFromJson(json);
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

class ConcurrentModificationException extends _s.GenericAwsException {
  ConcurrentModificationException({String type, String message})
      : super(
            type: type,
            code: 'ConcurrentModificationException',
            message: message);
}

class InternalException extends _s.GenericAwsException {
  InternalException({String type, String message})
      : super(type: type, code: 'InternalException', message: message);
}

class InvalidEventPatternException extends _s.GenericAwsException {
  InvalidEventPatternException({String type, String message})
      : super(
            type: type, code: 'InvalidEventPatternException', message: message);
}

class InvalidStateException extends _s.GenericAwsException {
  InvalidStateException({String type, String message})
      : super(type: type, code: 'InvalidStateException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ManagedRuleException extends _s.GenericAwsException {
  ManagedRuleException({String type, String message})
      : super(type: type, code: 'ManagedRuleException', message: message);
}

class PolicyLengthExceededException extends _s.GenericAwsException {
  PolicyLengthExceededException({String type, String message})
      : super(
            type: type,
            code: 'PolicyLengthExceededException',
            message: message);
}

class ResourceAlreadyExistsException extends _s.GenericAwsException {
  ResourceAlreadyExistsException({String type, String message})
      : super(
            type: type,
            code: 'ResourceAlreadyExistsException',
            message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ConcurrentModificationException': (type, message) =>
      ConcurrentModificationException(type: type, message: message),
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
  'PolicyLengthExceededException': (type, message) =>
      PolicyLengthExceededException(type: type, message: message),
  'ResourceAlreadyExistsException': (type, message) =>
      ResourceAlreadyExistsException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
};
