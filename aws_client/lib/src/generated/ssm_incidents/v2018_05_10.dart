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

/// Systems Manager Incident Manager is an incident management console designed
/// to help users mitigate and recover from incidents affecting their Amazon Web
/// Services-hosted applications. An incident is any unplanned interruption or
/// reduction in quality of services.
///
/// Incident Manager increases incident resolution by notifying responders of
/// impact, highlighting relevant troubleshooting data, and providing
/// collaboration tools to get services back up and running. To achieve the
/// primary goal of reducing the time-to-resolution of critical incidents,
/// Incident Manager automates response plans and enables responder team
/// escalation.
class SsmIncidents {
  final _s.RestJsonProtocol _protocol;
  SsmIncidents({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'ssm-incidents',
            signingName: 'ssm-incidents',
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

  /// Retrieves details about all specified findings for an incident, including
  /// descriptive details about each finding. A finding represents a recent
  /// application environment change made by an CodeDeploy deployment or an
  /// CloudFormation stack creation or update that can be investigated as a
  /// potential cause of the incident.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [findingIds] :
  /// A list of IDs of findings for which you want to view details.
  ///
  /// Parameter [incidentRecordArn] :
  /// The Amazon Resource Name (ARN) of the incident for which you want to view
  /// finding details.
  Future<BatchGetIncidentFindingsOutput> batchGetIncidentFindings({
    required List<String> findingIds,
    required String incidentRecordArn,
  }) async {
    final $payload = <String, dynamic>{
      'findingIds': findingIds,
      'incidentRecordArn': incidentRecordArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/batchGetIncidentFindings',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetIncidentFindingsOutput.fromJson(response);
  }

  /// A replication set replicates and encrypts your data to the provided
  /// Regions with the provided KMS key.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [regions] :
  /// The Regions that Incident Manager replicates your data to. You can have up
  /// to three Regions in your replication set.
  ///
  /// Parameter [clientToken] :
  /// A token that ensures that the operation is called only once with the
  /// specified details.
  ///
  /// Parameter [tags] :
  /// A list of tags to add to the replication set.
  Future<CreateReplicationSetOutput> createReplicationSet({
    required Map<String, RegionMapInputValue> regions,
    String? clientToken,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'regions': regions,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/createReplicationSet',
      exceptionFnMap: _exceptionFns,
    );
    return CreateReplicationSetOutput.fromJson(response);
  }

  /// Creates a response plan that automates the initial response to incidents.
  /// A response plan engages contacts, starts chat channel collaboration, and
  /// initiates runbooks at the beginning of an incident.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [incidentTemplate] :
  /// Details used to create an incident when using this response plan.
  ///
  /// Parameter [name] :
  /// The short format name of the response plan. Can't include spaces.
  ///
  /// Parameter [actions] :
  /// The actions that the response plan starts at the beginning of an incident.
  ///
  /// Parameter [chatChannel] :
  /// The Chatbot chat channel used for collaboration during an incident.
  ///
  /// Parameter [clientToken] :
  /// A token ensuring that the operation is called only once with the specified
  /// details.
  ///
  /// Parameter [displayName] :
  /// The long format of the response plan name. This field can contain spaces.
  ///
  /// Parameter [engagements] :
  /// The Amazon Resource Name (ARN) for the contacts and escalation plans that
  /// the response plan engages during an incident.
  ///
  /// Parameter [integrations] :
  /// Information about third-party services integrated into the response plan.
  ///
  /// Parameter [tags] :
  /// A list of tags that you are adding to the response plan.
  Future<CreateResponsePlanOutput> createResponsePlan({
    required IncidentTemplate incidentTemplate,
    required String name,
    List<Action>? actions,
    ChatChannel? chatChannel,
    String? clientToken,
    String? displayName,
    List<String>? engagements,
    List<Integration>? integrations,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'incidentTemplate': incidentTemplate,
      'name': name,
      if (actions != null) 'actions': actions,
      if (chatChannel != null) 'chatChannel': chatChannel,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (displayName != null) 'displayName': displayName,
      if (engagements != null) 'engagements': engagements,
      if (integrations != null) 'integrations': integrations,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/createResponsePlan',
      exceptionFnMap: _exceptionFns,
    );
    return CreateResponsePlanOutput.fromJson(response);
  }

  /// Creates a custom timeline event on the incident details page of an
  /// incident record. Incident Manager automatically creates timeline events
  /// that mark key moments during an incident. You can create custom timeline
  /// events to mark important events that Incident Manager can detect
  /// automatically.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [eventData] :
  /// A short description of the event.
  ///
  /// Parameter [eventTime] :
  /// The timestamp for when the event occurred.
  ///
  /// Parameter [eventType] :
  /// The type of event. You can create timeline events of type <code>Custom
  /// Event</code> and <code>Note</code>.
  ///
  /// To make a Note-type event appear on the <i>Incident notes</i> panel in the
  /// console, specify <code>eventType</code> as <code>Note</code>and enter the
  /// Amazon Resource Name (ARN) of the incident as the value for
  /// <code>eventReference</code>.
  ///
  /// Parameter [incidentRecordArn] :
  /// The Amazon Resource Name (ARN) of the incident record that the action adds
  /// the incident to.
  ///
  /// Parameter [clientToken] :
  /// A token that ensures that a client calls the action only once with the
  /// specified details.
  ///
  /// Parameter [eventReferences] :
  /// Adds one or more references to the <code>TimelineEvent</code>. A reference
  /// is an Amazon Web Services resource involved or associated with the
  /// incident. To specify a reference, enter its Amazon Resource Name (ARN).
  /// You can also specify a related item associated with a resource. For
  /// example, to specify an Amazon DynamoDB (DynamoDB) table as a resource, use
  /// the table's ARN. You can also specify an Amazon CloudWatch metric
  /// associated with the DynamoDB table as a related item.
  Future<CreateTimelineEventOutput> createTimelineEvent({
    required String eventData,
    required DateTime eventTime,
    required String eventType,
    required String incidentRecordArn,
    String? clientToken,
    List<EventReference>? eventReferences,
  }) async {
    final $payload = <String, dynamic>{
      'eventData': eventData,
      'eventTime': unixTimestampToJson(eventTime),
      'eventType': eventType,
      'incidentRecordArn': incidentRecordArn,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (eventReferences != null) 'eventReferences': eventReferences,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/createTimelineEvent',
      exceptionFnMap: _exceptionFns,
    );
    return CreateTimelineEventOutput.fromJson(response);
  }

  /// Delete an incident record from Incident Manager.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the incident record you are deleting.
  Future<void> deleteIncidentRecord({
    required String arn,
  }) async {
    final $payload = <String, dynamic>{
      'arn': arn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/deleteIncidentRecord',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes all Regions in your replication set. Deleting the replication set
  /// deletes all Incident Manager data.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the replication set you're deleting.
  Future<void> deleteReplicationSet({
    required String arn,
  }) async {
    final $query = <String, List<String>>{
      'arn': [arn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/deleteReplicationSet',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the resource policy that Resource Access Manager uses to share
  /// your Incident Manager resource.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [policyId] :
  /// The ID of the resource policy you're deleting.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource you're deleting the policy
  /// from.
  Future<void> deleteResourcePolicy({
    required String policyId,
    required String resourceArn,
  }) async {
    final $payload = <String, dynamic>{
      'policyId': policyId,
      'resourceArn': resourceArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/deleteResourcePolicy',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified response plan. Deleting a response plan stops all
  /// linked CloudWatch alarms and EventBridge events from creating an incident
  /// with this response plan.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the response plan.
  Future<void> deleteResponsePlan({
    required String arn,
  }) async {
    final $payload = <String, dynamic>{
      'arn': arn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/deleteResponsePlan',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a timeline event from an incident.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [eventId] :
  /// The ID of the event to update. You can use <code>ListTimelineEvents</code>
  /// to find an event's ID.
  ///
  /// Parameter [incidentRecordArn] :
  /// The Amazon Resource Name (ARN) of the incident that includes the timeline
  /// event.
  Future<void> deleteTimelineEvent({
    required String eventId,
    required String incidentRecordArn,
  }) async {
    final $payload = <String, dynamic>{
      'eventId': eventId,
      'incidentRecordArn': incidentRecordArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/deleteTimelineEvent',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns the details for the specified incident record.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the incident record.
  Future<GetIncidentRecordOutput> getIncidentRecord({
    required String arn,
  }) async {
    final $query = <String, List<String>>{
      'arn': [arn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/getIncidentRecord',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetIncidentRecordOutput.fromJson(response);
  }

  /// Retrieve your Incident Manager replication set.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the replication set you want to
  /// retrieve.
  Future<GetReplicationSetOutput> getReplicationSet({
    required String arn,
  }) async {
    final $query = <String, List<String>>{
      'arn': [arn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/getReplicationSet',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetReplicationSetOutput.fromJson(response);
  }

  /// Retrieves the resource policies attached to the specified response plan.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the response plan with the attached
  /// resource policy.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of resource policies to display for each page of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// The pagination token for the next set of items to return. (You received
  /// this token from a previous call.)
  Future<GetResourcePoliciesOutput> getResourcePolicies({
    required String resourceArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      'resourceArn': [resourceArn],
    };
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/getResourcePolicies',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetResourcePoliciesOutput.fromJson(response);
  }

  /// Retrieves the details of the specified response plan.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the response plan.
  Future<GetResponsePlanOutput> getResponsePlan({
    required String arn,
  }) async {
    final $query = <String, List<String>>{
      'arn': [arn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/getResponsePlan',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetResponsePlanOutput.fromJson(response);
  }

  /// Retrieves a timeline event based on its ID and incident record.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [eventId] :
  /// The ID of the event. You can get an event's ID when you create it, or by
  /// using <code>ListTimelineEvents</code>.
  ///
  /// Parameter [incidentRecordArn] :
  /// The Amazon Resource Name (ARN) of the incident that includes the timeline
  /// event.
  Future<GetTimelineEventOutput> getTimelineEvent({
    required String eventId,
    required String incidentRecordArn,
  }) async {
    final $query = <String, List<String>>{
      'eventId': [eventId],
      'incidentRecordArn': [incidentRecordArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/getTimelineEvent',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetTimelineEventOutput.fromJson(response);
  }

  /// Retrieves a list of the IDs of findings, plus their last modified times,
  /// that have been identified for a specified incident. A finding represents a
  /// recent application environment change made by an CloudFormation stack
  /// creation or update or an CodeDeploy deployment that can be investigated as
  /// a potential cause of the incident.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [incidentRecordArn] :
  /// The Amazon Resource Name (ARN) of the incident for which you want to view
  /// associated findings.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of findings to retrieve per call.
  ///
  /// Parameter [nextToken] :
  /// The pagination token for the next set of items to return. (You received
  /// this token from a previous call.)
  Future<ListIncidentFindingsOutput> listIncidentFindings({
    required String incidentRecordArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20,
    );
    final $payload = <String, dynamic>{
      'incidentRecordArn': incidentRecordArn,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listIncidentFindings',
      exceptionFnMap: _exceptionFns,
    );
    return ListIncidentFindingsOutput.fromJson(response);
  }

  /// Lists all incident records in your account. Use this command to retrieve
  /// the Amazon Resource Name (ARN) of the incident record you want to update.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [filters] :
  /// Filters the list of incident records you want to search through. You can
  /// filter on the following keys:
  ///
  /// <ul>
  /// <li>
  /// <code>creationTime</code>
  /// </li>
  /// <li>
  /// <code>impact</code>
  /// </li>
  /// <li>
  /// <code>status</code>
  /// </li>
  /// <li>
  /// <code>createdBy</code>
  /// </li>
  /// </ul>
  /// Note the following when when you use Filters:
  ///
  /// <ul>
  /// <li>
  /// If you don't specify a Filter, the response includes all incident records.
  /// </li>
  /// <li>
  /// If you specify more than one filter in a single request, the response
  /// returns incident records that match all filters.
  /// </li>
  /// <li>
  /// If you specify a filter with more than one value, the response returns
  /// incident records that match any of the values provided.
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results per page.
  ///
  /// Parameter [nextToken] :
  /// The pagination token for the next set of items to return. (You received
  /// this token from a previous call.)
  Future<ListIncidentRecordsOutput> listIncidentRecords({
    List<Filter>? filters,
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
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listIncidentRecords',
      exceptionFnMap: _exceptionFns,
    );
    return ListIncidentRecordsOutput.fromJson(response);
  }

  /// List all related items for an incident record.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [incidentRecordArn] :
  /// The Amazon Resource Name (ARN) of the incident record containing the
  /// listed related items.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of related items per page.
  ///
  /// Parameter [nextToken] :
  /// The pagination token for the next set of items to return. (You received
  /// this token from a previous call.)
  Future<ListRelatedItemsOutput> listRelatedItems({
    required String incidentRecordArn,
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
      'incidentRecordArn': incidentRecordArn,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listRelatedItems',
      exceptionFnMap: _exceptionFns,
    );
    return ListRelatedItemsOutput.fromJson(response);
  }

  /// Lists details about the replication set configured in your account.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results per page.
  ///
  /// Parameter [nextToken] :
  /// The pagination token for the next set of items to return. (You received
  /// this token from a previous call.)
  Future<ListReplicationSetsOutput> listReplicationSets({
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
      requestUri: '/listReplicationSets',
      exceptionFnMap: _exceptionFns,
    );
    return ListReplicationSetsOutput.fromJson(response);
  }

  /// Lists all response plans in your account.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of response plans per page.
  ///
  /// Parameter [nextToken] :
  /// The pagination token for the next set of items to return. (You received
  /// this token from a previous call.)
  Future<ListResponsePlansOutput> listResponsePlans({
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
      requestUri: '/listResponsePlans',
      exceptionFnMap: _exceptionFns,
    );
    return ListResponsePlansOutput.fromJson(response);
  }

  /// Lists the tags that are attached to the specified response plan or
  /// incident.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the response plan or incident.
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

  /// Lists timeline events for the specified incident record.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [incidentRecordArn] :
  /// The Amazon Resource Name (ARN) of the incident that includes the timeline
  /// event.
  ///
  /// Parameter [filters] :
  /// Filters the timeline events based on the provided conditional values. You
  /// can filter timeline events with the following keys:
  ///
  /// <ul>
  /// <li>
  /// <code>eventReference</code>
  /// </li>
  /// <li>
  /// <code>eventTime</code>
  /// </li>
  /// <li>
  /// <code>eventType</code>
  /// </li>
  /// </ul>
  /// Note the following when deciding how to use Filters:
  ///
  /// <ul>
  /// <li>
  /// If you don't specify a Filter, the response includes all timeline events.
  /// </li>
  /// <li>
  /// If you specify more than one filter in a single request, the response
  /// returns timeline events that match all filters.
  /// </li>
  /// <li>
  /// If you specify a filter with more than one value, the response returns
  /// timeline events that match any of the values provided.
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results per page.
  ///
  /// Parameter [nextToken] :
  /// The pagination token for the next set of items to return. (You received
  /// this token from a previous call.)
  ///
  /// Parameter [sortBy] :
  /// Sort timeline events by the specified key value pair.
  ///
  /// Parameter [sortOrder] :
  /// Sorts the order of timeline events by the value specified in the
  /// <code>sortBy</code> field.
  Future<ListTimelineEventsOutput> listTimelineEvents({
    required String incidentRecordArn,
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
    TimelineEventSort? sortBy,
    SortOrder? sortOrder,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      'incidentRecordArn': incidentRecordArn,
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (sortBy != null) 'sortBy': sortBy.toValue(),
      if (sortOrder != null) 'sortOrder': sortOrder.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listTimelineEvents',
      exceptionFnMap: _exceptionFns,
    );
    return ListTimelineEventsOutput.fromJson(response);
  }

  /// Adds a resource policy to the specified response plan. The resource policy
  /// is used to share the response plan using Resource Access Manager (RAM).
  /// For more information about cross-account sharing, see <a
  /// href="https://docs.aws.amazon.com/incident-manager/latest/userguide/incident-manager-cross-account-cross-region.html">Cross-Region
  /// and cross-account incident management</a>.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [policy] :
  /// Details of the resource policy.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the response plan to add the resource
  /// policy to.
  Future<PutResourcePolicyOutput> putResourcePolicy({
    required String policy,
    required String resourceArn,
  }) async {
    final $payload = <String, dynamic>{
      'policy': policy,
      'resourceArn': resourceArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/putResourcePolicy',
      exceptionFnMap: _exceptionFns,
    );
    return PutResourcePolicyOutput.fromJson(response);
  }

  /// Used to start an incident from CloudWatch alarms, EventBridge events, or
  /// manually.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [responsePlanArn] :
  /// The Amazon Resource Name (ARN) of the response plan that pre-defines
  /// summary, chat channels, Amazon SNS topics, runbooks, title, and impact of
  /// the incident.
  ///
  /// Parameter [clientToken] :
  /// A token ensuring that the operation is called only once with the specified
  /// details.
  ///
  /// Parameter [impact] :
  /// Defines the impact to the customers. Providing an impact overwrites the
  /// impact provided by a response plan.
  /// <p class="title"> <b>Supported impact codes</b>
  ///
  /// <ul>
  /// <li>
  /// <code>1</code> - Critical
  /// </li>
  /// <li>
  /// <code>2</code> - High
  /// </li>
  /// <li>
  /// <code>3</code> - Medium
  /// </li>
  /// <li>
  /// <code>4</code> - Low
  /// </li>
  /// <li>
  /// <code>5</code> - No Impact
  /// </li>
  /// </ul>
  ///
  /// Parameter [relatedItems] :
  /// Add related items to the incident for other responders to use. Related
  /// items are Amazon Web Services resources, external links, or files uploaded
  /// to an Amazon S3 bucket.
  ///
  /// Parameter [title] :
  /// Provide a title for the incident. Providing a title overwrites the title
  /// provided by the response plan.
  ///
  /// Parameter [triggerDetails] :
  /// Details of what created the incident record in Incident Manager.
  Future<StartIncidentOutput> startIncident({
    required String responsePlanArn,
    String? clientToken,
    int? impact,
    List<RelatedItem>? relatedItems,
    String? title,
    TriggerDetails? triggerDetails,
  }) async {
    _s.validateNumRange(
      'impact',
      impact,
      1,
      5,
    );
    final $payload = <String, dynamic>{
      'responsePlanArn': responsePlanArn,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (impact != null) 'impact': impact,
      if (relatedItems != null) 'relatedItems': relatedItems,
      if (title != null) 'title': title,
      if (triggerDetails != null) 'triggerDetails': triggerDetails,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/startIncident',
      exceptionFnMap: _exceptionFns,
    );
    return StartIncidentOutput.fromJson(response);
  }

  /// Adds a tag to a response plan.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the response plan you're adding the tags
  /// to.
  ///
  /// Parameter [tags] :
  /// A list of tags to add to the response plan.
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

  /// Removes a tag from a resource.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the response plan you're removing a tag
  /// from.
  ///
  /// Parameter [tagKeys] :
  /// The name of the tag to remove from the response plan.
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

  /// Update deletion protection to either allow or deny deletion of the final
  /// Region in a replication set.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the replication set to update.
  ///
  /// Parameter [deletionProtected] :
  /// Specifies if deletion protection is turned on or off in your account.
  ///
  /// Parameter [clientToken] :
  /// A token that ensures that the operation is called only once with the
  /// specified details.
  Future<void> updateDeletionProtection({
    required String arn,
    required bool deletionProtected,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'arn': arn,
      'deletionProtected': deletionProtected,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/updateDeletionProtection',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Update the details of an incident record. You can use this operation to
  /// update an incident record from the defined chat channel. For more
  /// information about using actions in chat channels, see <a
  /// href="https://docs.aws.amazon.com/incident-manager/latest/userguide/chat.html#chat-interact">Interacting
  /// through chat</a>.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the incident record you are updating.
  ///
  /// Parameter [chatChannel] :
  /// The Chatbot chat channel where responders can collaborate.
  ///
  /// Parameter [clientToken] :
  /// A token that ensures that a client calls the operation only once with the
  /// specified details.
  ///
  /// Parameter [impact] :
  /// Defines the impact of the incident to customers and applications. If you
  /// provide an impact for an incident, it overwrites the impact provided by
  /// the response plan.
  /// <p class="title"> <b>Supported impact codes</b>
  ///
  /// <ul>
  /// <li>
  /// <code>1</code> - Critical
  /// </li>
  /// <li>
  /// <code>2</code> - High
  /// </li>
  /// <li>
  /// <code>3</code> - Medium
  /// </li>
  /// <li>
  /// <code>4</code> - Low
  /// </li>
  /// <li>
  /// <code>5</code> - No Impact
  /// </li>
  /// </ul>
  ///
  /// Parameter [notificationTargets] :
  /// The Amazon SNS targets that Incident Manager notifies when a client
  /// updates an incident.
  ///
  /// Using multiple SNS topics creates redundancy in the event that a Region is
  /// down during the incident.
  ///
  /// Parameter [status] :
  /// The status of the incident. Possible statuses are <code>Open</code> or
  /// <code>Resolved</code>.
  ///
  /// Parameter [summary] :
  /// A longer description of what occurred during the incident.
  ///
  /// Parameter [title] :
  /// A brief description of the incident.
  Future<void> updateIncidentRecord({
    required String arn,
    ChatChannel? chatChannel,
    String? clientToken,
    int? impact,
    List<NotificationTargetItem>? notificationTargets,
    IncidentRecordStatus? status,
    String? summary,
    String? title,
  }) async {
    _s.validateNumRange(
      'impact',
      impact,
      1,
      5,
    );
    final $payload = <String, dynamic>{
      'arn': arn,
      if (chatChannel != null) 'chatChannel': chatChannel,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (impact != null) 'impact': impact,
      if (notificationTargets != null)
        'notificationTargets': notificationTargets,
      if (status != null) 'status': status.toValue(),
      if (summary != null) 'summary': summary,
      if (title != null) 'title': title,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/updateIncidentRecord',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Add or remove related items from the related items tab of an incident
  /// record.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [incidentRecordArn] :
  /// The Amazon Resource Name (ARN) of the incident record that contains the
  /// related items that you update.
  ///
  /// Parameter [relatedItemsUpdate] :
  /// Details about the item that you are add to, or delete from, an incident.
  ///
  /// Parameter [clientToken] :
  /// A token that ensures that a client calls the operation only once with the
  /// specified details.
  Future<void> updateRelatedItems({
    required String incidentRecordArn,
    required RelatedItemsUpdate relatedItemsUpdate,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'incidentRecordArn': incidentRecordArn,
      'relatedItemsUpdate': relatedItemsUpdate,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/updateRelatedItems',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Add or delete Regions from your replication set.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [actions] :
  /// An action to add or delete a Region.
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the replication set you're updating.
  ///
  /// Parameter [clientToken] :
  /// A token that ensures that the operation is called only once with the
  /// specified details.
  Future<void> updateReplicationSet({
    required List<UpdateReplicationSetAction> actions,
    required String arn,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'actions': actions,
      'arn': arn,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/updateReplicationSet',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the specified response plan.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the response plan.
  ///
  /// Parameter [actions] :
  /// The actions that this response plan takes at the beginning of an incident.
  ///
  /// Parameter [chatChannel] :
  /// The Chatbot chat channel used for collaboration during an incident.
  ///
  /// Use the empty structure to remove the chat channel from the response plan.
  ///
  /// Parameter [clientToken] :
  /// A token ensuring that the operation is called only once with the specified
  /// details.
  ///
  /// Parameter [displayName] :
  /// The long format name of the response plan. The display name can't contain
  /// spaces.
  ///
  /// Parameter [engagements] :
  /// The Amazon Resource Name (ARN) for the contacts and escalation plans that
  /// the response plan engages during an incident.
  ///
  /// Parameter [incidentTemplateDedupeString] :
  /// The string Incident Manager uses to prevent duplicate incidents from being
  /// created by the same incident in the same account.
  ///
  /// Parameter [incidentTemplateImpact] :
  /// Defines the impact to the customers. Providing an impact overwrites the
  /// impact provided by a response plan.
  /// <p class="title"> <b>Supported impact codes</b>
  ///
  /// <ul>
  /// <li>
  /// <code>1</code> - Critical
  /// </li>
  /// <li>
  /// <code>2</code> - High
  /// </li>
  /// <li>
  /// <code>3</code> - Medium
  /// </li>
  /// <li>
  /// <code>4</code> - Low
  /// </li>
  /// <li>
  /// <code>5</code> - No Impact
  /// </li>
  /// </ul>
  ///
  /// Parameter [incidentTemplateNotificationTargets] :
  /// The Amazon SNS targets that are notified when updates are made to an
  /// incident.
  ///
  /// Parameter [incidentTemplateSummary] :
  /// A brief summary of the incident. This typically contains what has
  /// happened, what's currently happening, and next steps.
  ///
  /// Parameter [incidentTemplateTags] :
  /// Tags to assign to the template. When the <code>StartIncident</code> API
  /// action is called, Incident Manager assigns the tags specified in the
  /// template to the incident. To call this action, you must also have
  /// permission to call the <code>TagResource</code> API action for the
  /// incident record resource.
  ///
  /// Parameter [incidentTemplateTitle] :
  /// The short format name of the incident. The title can't contain spaces.
  ///
  /// Parameter [integrations] :
  /// Information about third-party services integrated into the response plan.
  Future<void> updateResponsePlan({
    required String arn,
    List<Action>? actions,
    ChatChannel? chatChannel,
    String? clientToken,
    String? displayName,
    List<String>? engagements,
    String? incidentTemplateDedupeString,
    int? incidentTemplateImpact,
    List<NotificationTargetItem>? incidentTemplateNotificationTargets,
    String? incidentTemplateSummary,
    Map<String, String>? incidentTemplateTags,
    String? incidentTemplateTitle,
    List<Integration>? integrations,
  }) async {
    _s.validateNumRange(
      'incidentTemplateImpact',
      incidentTemplateImpact,
      1,
      5,
    );
    final $payload = <String, dynamic>{
      'arn': arn,
      if (actions != null) 'actions': actions,
      if (chatChannel != null) 'chatChannel': chatChannel,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (displayName != null) 'displayName': displayName,
      if (engagements != null) 'engagements': engagements,
      if (incidentTemplateDedupeString != null)
        'incidentTemplateDedupeString': incidentTemplateDedupeString,
      if (incidentTemplateImpact != null)
        'incidentTemplateImpact': incidentTemplateImpact,
      if (incidentTemplateNotificationTargets != null)
        'incidentTemplateNotificationTargets':
            incidentTemplateNotificationTargets,
      if (incidentTemplateSummary != null)
        'incidentTemplateSummary': incidentTemplateSummary,
      if (incidentTemplateTags != null)
        'incidentTemplateTags': incidentTemplateTags,
      if (incidentTemplateTitle != null)
        'incidentTemplateTitle': incidentTemplateTitle,
      if (integrations != null) 'integrations': integrations,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/updateResponsePlan',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a timeline event. You can update events of type <code>Custom
  /// Event</code>.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [eventId] :
  /// The ID of the event to update. You can use <code>ListTimelineEvents</code>
  /// to find an event's ID.
  ///
  /// Parameter [incidentRecordArn] :
  /// The Amazon Resource Name (ARN) of the incident that includes the timeline
  /// event.
  ///
  /// Parameter [clientToken] :
  /// A token that ensures that a client calls the operation only once with the
  /// specified details.
  ///
  /// Parameter [eventData] :
  /// A short description of the event.
  ///
  /// Parameter [eventReferences] :
  /// Updates all existing references in a <code>TimelineEvent</code>. A
  /// reference is an Amazon Web Services resource involved or associated with
  /// the incident. To specify a reference, enter its Amazon Resource Name
  /// (ARN). You can also specify a related item associated with that resource.
  /// For example, to specify an Amazon DynamoDB (DynamoDB) table as a resource,
  /// use its ARN. You can also specify an Amazon CloudWatch metric associated
  /// with the DynamoDB table as a related item.
  /// <important>
  /// This update action overrides all existing references. If you want to keep
  /// existing references, you must specify them in the call. If you don't, this
  /// action removes any existing references and enters only new references.
  /// </important>
  ///
  /// Parameter [eventTime] :
  /// The timestamp for when the event occurred.
  ///
  /// Parameter [eventType] :
  /// The type of event. You can update events of type <code>Custom Event</code>
  /// and <code>Note</code>.
  Future<void> updateTimelineEvent({
    required String eventId,
    required String incidentRecordArn,
    String? clientToken,
    String? eventData,
    List<EventReference>? eventReferences,
    DateTime? eventTime,
    String? eventType,
  }) async {
    final $payload = <String, dynamic>{
      'eventId': eventId,
      'incidentRecordArn': incidentRecordArn,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (eventData != null) 'eventData': eventData,
      if (eventReferences != null) 'eventReferences': eventReferences,
      if (eventTime != null) 'eventTime': unixTimestampToJson(eventTime),
      if (eventType != null) 'eventType': eventType,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/updateTimelineEvent',
      exceptionFnMap: _exceptionFns,
    );
  }
}

/// The action that starts at the beginning of an incident. The response plan
/// defines the action.
class Action {
  /// The Systems Manager automation document to start as the runbook at the
  /// beginning of the incident.
  final SsmAutomation? ssmAutomation;

  Action({
    this.ssmAutomation,
  });

  factory Action.fromJson(Map<String, dynamic> json) {
    return Action(
      ssmAutomation: json['ssmAutomation'] != null
          ? SsmAutomation.fromJson(
              json['ssmAutomation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final ssmAutomation = this.ssmAutomation;
    return {
      if (ssmAutomation != null) 'ssmAutomation': ssmAutomation,
    };
  }
}

/// Defines the Amazon Web Services Region and KMS key to add to the replication
/// set.
class AddRegionAction {
  /// The Amazon Web Services Region name to add to the replication set.
  final String regionName;

  /// The KMS key ID to use to encrypt your replication set.
  final String? sseKmsKeyId;

  AddRegionAction({
    required this.regionName,
    this.sseKmsKeyId,
  });

  Map<String, dynamic> toJson() {
    final regionName = this.regionName;
    final sseKmsKeyId = this.sseKmsKeyId;
    return {
      'regionName': regionName,
      if (sseKmsKeyId != null) 'sseKmsKeyId': sseKmsKeyId,
    };
  }
}

/// Use the AttributeValueList to filter by string or integer values.
class AttributeValueList {
  /// The list of integer values that the filter matches.
  final List<int>? integerValues;

  /// The list of string values that the filter matches.
  final List<String>? stringValues;

  AttributeValueList({
    this.integerValues,
    this.stringValues,
  });

  Map<String, dynamic> toJson() {
    final integerValues = this.integerValues;
    final stringValues = this.stringValues;
    return {
      if (integerValues != null) 'integerValues': integerValues,
      if (stringValues != null) 'stringValues': stringValues,
    };
  }
}

/// The Systems Manager automation document process to start as the runbook at
/// the beginning of the incident.
class AutomationExecution {
  /// The Amazon Resource Name (ARN) of the automation process.
  final String? ssmExecutionArn;

  AutomationExecution({
    this.ssmExecutionArn,
  });

  factory AutomationExecution.fromJson(Map<String, dynamic> json) {
    return AutomationExecution(
      ssmExecutionArn: json['ssmExecutionArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ssmExecutionArn = this.ssmExecutionArn;
    return {
      if (ssmExecutionArn != null) 'ssmExecutionArn': ssmExecutionArn,
    };
  }
}

/// Details about an error returned for a <a>BatchGetIncidentFindings</a>
/// operation.
class BatchGetIncidentFindingsError {
  /// The code associated with an error that was returned for a
  /// <code>BatchGetIncidentFindings</code> operation.
  final String code;

  /// The ID of a specified finding for which an error was returned for a
  /// <code>BatchGetIncidentFindings</code> operation.
  final String findingId;

  /// The description for an error that was returned for a
  /// <code>BatchGetIncidentFindings</code> operation.
  final String message;

  BatchGetIncidentFindingsError({
    required this.code,
    required this.findingId,
    required this.message,
  });

  factory BatchGetIncidentFindingsError.fromJson(Map<String, dynamic> json) {
    return BatchGetIncidentFindingsError(
      code: json['code'] as String,
      findingId: json['findingId'] as String,
      message: json['message'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final findingId = this.findingId;
    final message = this.message;
    return {
      'code': code,
      'findingId': findingId,
      'message': message,
    };
  }
}

class BatchGetIncidentFindingsOutput {
  /// A list of errors encountered during the operation.
  final List<BatchGetIncidentFindingsError> errors;

  /// Information about the requested findings.
  final List<Finding> findings;

  BatchGetIncidentFindingsOutput({
    required this.errors,
    required this.findings,
  });

  factory BatchGetIncidentFindingsOutput.fromJson(Map<String, dynamic> json) {
    return BatchGetIncidentFindingsOutput(
      errors: (json['errors'] as List)
          .whereNotNull()
          .map((e) =>
              BatchGetIncidentFindingsError.fromJson(e as Map<String, dynamic>))
          .toList(),
      findings: (json['findings'] as List)
          .whereNotNull()
          .map((e) => Finding.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final findings = this.findings;
    return {
      'errors': errors,
      'findings': findings,
    };
  }
}

/// The Chatbot chat channel used for collaboration during an incident.
class ChatChannel {
  /// The Amazon SNS targets that Chatbot uses to notify the chat channel of
  /// updates to an incident. You can also make updates to the incident through
  /// the chat channel by using the Amazon SNS topics.
  final List<String>? chatbotSns;

  /// Used to remove the chat channel from an incident record or response plan.
  final EmptyChatChannel? empty;

  ChatChannel({
    this.chatbotSns,
    this.empty,
  });

  factory ChatChannel.fromJson(Map<String, dynamic> json) {
    return ChatChannel(
      chatbotSns: (json['chatbotSns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      empty: json['empty'] != null
          ? EmptyChatChannel.fromJson(json['empty'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final chatbotSns = this.chatbotSns;
    final empty = this.empty;
    return {
      if (chatbotSns != null) 'chatbotSns': chatbotSns,
      if (empty != null) 'empty': empty,
    };
  }
}

/// Information about an CloudFormation stack creation or update that occurred
/// around the time of an incident and could be a potential cause of the
/// incident.
class CloudFormationStackUpdate {
  /// The Amazon Resource Name (ARN) of the CloudFormation stack involved in the
  /// update.
  final String stackArn;

  /// The timestamp for when the CloudFormation stack creation or update began.
  final DateTime startTime;

  /// The timestamp for when the CloudFormation stack creation or update ended.
  /// Not reported for deployments that are still in progress.
  final DateTime? endTime;

  CloudFormationStackUpdate({
    required this.stackArn,
    required this.startTime,
    this.endTime,
  });

  factory CloudFormationStackUpdate.fromJson(Map<String, dynamic> json) {
    return CloudFormationStackUpdate(
      stackArn: json['stackArn'] as String,
      startTime: nonNullableTimeStampFromJson(json['startTime'] as Object),
      endTime: timeStampFromJson(json['endTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final stackArn = this.stackArn;
    final startTime = this.startTime;
    final endTime = this.endTime;
    return {
      'stackArn': stackArn,
      'startTime': unixTimestampToJson(startTime),
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
    };
  }
}

/// Information about a CodeDeploy deployment that occurred around the time of
/// an incident and could be a possible cause of the incident.
class CodeDeployDeployment {
  /// The Amazon Resource Name (ARN) of the CodeDeploy deployment group associated
  /// with the deployment.
  final String deploymentGroupArn;

  /// The ID of the CodeDeploy deployment.
  final String deploymentId;

  /// The timestamp for when the CodeDeploy deployment began.
  final DateTime startTime;

  /// The timestamp for when the CodeDeploy deployment ended. Not reported for
  /// deployments that are still in progress.
  final DateTime? endTime;

  CodeDeployDeployment({
    required this.deploymentGroupArn,
    required this.deploymentId,
    required this.startTime,
    this.endTime,
  });

  factory CodeDeployDeployment.fromJson(Map<String, dynamic> json) {
    return CodeDeployDeployment(
      deploymentGroupArn: json['deploymentGroupArn'] as String,
      deploymentId: json['deploymentId'] as String,
      startTime: nonNullableTimeStampFromJson(json['startTime'] as Object),
      endTime: timeStampFromJson(json['endTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final deploymentGroupArn = this.deploymentGroupArn;
    final deploymentId = this.deploymentId;
    final startTime = this.startTime;
    final endTime = this.endTime;
    return {
      'deploymentGroupArn': deploymentGroupArn,
      'deploymentId': deploymentId,
      'startTime': unixTimestampToJson(startTime),
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
    };
  }
}

/// A conditional statement with which to compare a value, after a timestamp,
/// before a timestamp, or equal to a string or integer. If multiple conditions
/// are specified, the conditionals become an <code>AND</code>ed statement. If
/// multiple values are specified for a conditional, the values are
/// <code>OR</code>d.
class Condition {
  /// After the specified timestamp.
  final DateTime? after;

  /// Before the specified timestamp
  final DateTime? before;

  /// The value is equal to the provided string or integer.
  final AttributeValueList? equals;

  Condition({
    this.after,
    this.before,
    this.equals,
  });

  Map<String, dynamic> toJson() {
    final after = this.after;
    final before = this.before;
    final equals = this.equals;
    return {
      if (after != null) 'after': unixTimestampToJson(after),
      if (before != null) 'before': unixTimestampToJson(before),
      if (equals != null) 'equals': equals,
    };
  }
}

class CreateReplicationSetOutput {
  /// The Amazon Resource Name (ARN) of the replication set.
  final String arn;

  CreateReplicationSetOutput({
    required this.arn,
  });

  factory CreateReplicationSetOutput.fromJson(Map<String, dynamic> json) {
    return CreateReplicationSetOutput(
      arn: json['arn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      'arn': arn,
    };
  }
}

class CreateResponsePlanOutput {
  /// The Amazon Resource Name (ARN) of the response plan.
  final String arn;

  CreateResponsePlanOutput({
    required this.arn,
  });

  factory CreateResponsePlanOutput.fromJson(Map<String, dynamic> json) {
    return CreateResponsePlanOutput(
      arn: json['arn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      'arn': arn,
    };
  }
}

class CreateTimelineEventOutput {
  /// The ID of the event for easy reference later.
  final String eventId;

  /// The ARN of the incident record that you added the event to.
  final String incidentRecordArn;

  CreateTimelineEventOutput({
    required this.eventId,
    required this.incidentRecordArn,
  });

  factory CreateTimelineEventOutput.fromJson(Map<String, dynamic> json) {
    return CreateTimelineEventOutput(
      eventId: json['eventId'] as String,
      incidentRecordArn: json['incidentRecordArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final eventId = this.eventId;
    final incidentRecordArn = this.incidentRecordArn;
    return {
      'eventId': eventId,
      'incidentRecordArn': incidentRecordArn,
    };
  }
}

class DeleteIncidentRecordOutput {
  DeleteIncidentRecordOutput();

  factory DeleteIncidentRecordOutput.fromJson(Map<String, dynamic> _) {
    return DeleteIncidentRecordOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Defines the information about the Amazon Web Services Region you're deleting
/// from your replication set.
class DeleteRegionAction {
  /// The name of the Amazon Web Services Region you're deleting from the
  /// replication set.
  final String regionName;

  DeleteRegionAction({
    required this.regionName,
  });

  Map<String, dynamic> toJson() {
    final regionName = this.regionName;
    return {
      'regionName': regionName,
    };
  }
}

class DeleteReplicationSetOutput {
  DeleteReplicationSetOutput();

  factory DeleteReplicationSetOutput.fromJson(Map<String, dynamic> _) {
    return DeleteReplicationSetOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteResourcePolicyOutput {
  DeleteResourcePolicyOutput();

  factory DeleteResourcePolicyOutput.fromJson(Map<String, dynamic> _) {
    return DeleteResourcePolicyOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteResponsePlanOutput {
  DeleteResponsePlanOutput();

  factory DeleteResponsePlanOutput.fromJson(Map<String, dynamic> _) {
    return DeleteResponsePlanOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteTimelineEventOutput {
  DeleteTimelineEventOutput();

  factory DeleteTimelineEventOutput.fromJson(Map<String, dynamic> _) {
    return DeleteTimelineEventOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The dynamic SSM parameter value.
class DynamicSsmParameterValue {
  /// Variable dynamic parameters. A parameter value is determined when an
  /// incident is created.
  final VariableType? variable;

  DynamicSsmParameterValue({
    this.variable,
  });

  factory DynamicSsmParameterValue.fromJson(Map<String, dynamic> json) {
    return DynamicSsmParameterValue(
      variable: (json['variable'] as String?)?.toVariableType(),
    );
  }

  Map<String, dynamic> toJson() {
    final variable = this.variable;
    return {
      if (variable != null) 'variable': variable.toValue(),
    };
  }
}

/// Used to remove the chat channel from an incident record or response plan.
class EmptyChatChannel {
  EmptyChatChannel();

  factory EmptyChatChannel.fromJson(Map<String, dynamic> _) {
    return EmptyChatChannel();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An item referenced in a <code>TimelineEvent</code> that is involved in or
/// somehow associated with an incident. You can specify an Amazon Resource Name
/// (ARN) for an Amazon Web Services resource or a <code>RelatedItem</code> ID.
class EventReference {
  /// The ID of a <code>RelatedItem</code> referenced in a
  /// <code>TimelineEvent</code>.
  final String? relatedItemId;

  /// The Amazon Resource Name (ARN) of an Amazon Web Services resource referenced
  /// in a <code>TimelineEvent</code>.
  final String? resource;

  EventReference({
    this.relatedItemId,
    this.resource,
  });

  factory EventReference.fromJson(Map<String, dynamic> json) {
    return EventReference(
      relatedItemId: json['relatedItemId'] as String?,
      resource: json['resource'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final relatedItemId = this.relatedItemId;
    final resource = this.resource;
    return {
      if (relatedItemId != null) 'relatedItemId': relatedItemId,
      if (resource != null) 'resource': resource,
    };
  }
}

/// Details about a timeline event during an incident.
class EventSummary {
  /// The timeline event ID.
  final String eventId;

  /// The timestamp for when the event occurred.
  final DateTime eventTime;

  /// The type of event. The timeline event must be <code>Custom Event</code> or
  /// <code>Note</code>.
  final String eventType;

  /// The timestamp for when the timeline event was last updated.
  final DateTime eventUpdatedTime;

  /// The Amazon Resource Name (ARN) of the incident that the event happened
  /// during.
  final String incidentRecordArn;

  /// A list of references in a <code>TimelineEvent</code>.
  final List<EventReference>? eventReferences;

  EventSummary({
    required this.eventId,
    required this.eventTime,
    required this.eventType,
    required this.eventUpdatedTime,
    required this.incidentRecordArn,
    this.eventReferences,
  });

  factory EventSummary.fromJson(Map<String, dynamic> json) {
    return EventSummary(
      eventId: json['eventId'] as String,
      eventTime: nonNullableTimeStampFromJson(json['eventTime'] as Object),
      eventType: json['eventType'] as String,
      eventUpdatedTime:
          nonNullableTimeStampFromJson(json['eventUpdatedTime'] as Object),
      incidentRecordArn: json['incidentRecordArn'] as String,
      eventReferences: (json['eventReferences'] as List?)
          ?.whereNotNull()
          .map((e) => EventReference.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final eventId = this.eventId;
    final eventTime = this.eventTime;
    final eventType = this.eventType;
    final eventUpdatedTime = this.eventUpdatedTime;
    final incidentRecordArn = this.incidentRecordArn;
    final eventReferences = this.eventReferences;
    return {
      'eventId': eventId,
      'eventTime': unixTimestampToJson(eventTime),
      'eventType': eventType,
      'eventUpdatedTime': unixTimestampToJson(eventUpdatedTime),
      'incidentRecordArn': incidentRecordArn,
      if (eventReferences != null) 'eventReferences': eventReferences,
    };
  }
}

/// Filter the selection by using a condition.
class Filter {
  /// The condition accepts before or after a specified time, equal to a string,
  /// or equal to an integer.
  final Condition condition;

  /// The key that you're filtering on.
  final String key;

  Filter({
    required this.condition,
    required this.key,
  });

  Map<String, dynamic> toJson() {
    final condition = this.condition;
    final key = this.key;
    return {
      'condition': condition,
      'key': key,
    };
  }
}

/// Information about a specific CodeDeploy deployment or CloudFormation stack
/// creation or update that occurred around the time of a reported incident.
/// These activities can be investigated as a potential cause of the incident.
class Finding {
  /// The timestamp for when a finding was created.
  final DateTime creationTime;

  /// The ID assigned to the finding.
  final String id;

  /// The timestamp for when the finding was most recently updated with additional
  /// information.
  final DateTime lastModifiedTime;

  /// Details about the finding.
  final FindingDetails? details;

  Finding({
    required this.creationTime,
    required this.id,
    required this.lastModifiedTime,
    this.details,
  });

  factory Finding.fromJson(Map<String, dynamic> json) {
    return Finding(
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      id: json['id'] as String,
      lastModifiedTime:
          nonNullableTimeStampFromJson(json['lastModifiedTime'] as Object),
      details: json['details'] != null
          ? FindingDetails.fromJson(json['details'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final id = this.id;
    final lastModifiedTime = this.lastModifiedTime;
    final details = this.details;
    return {
      'creationTime': unixTimestampToJson(creationTime),
      'id': id,
      'lastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (details != null) 'details': details,
    };
  }
}

/// Extended textual information about the finding.
class FindingDetails {
  /// Information about the CloudFormation stack creation or update associated
  /// with the finding.
  final CloudFormationStackUpdate? cloudFormationStackUpdate;

  /// Information about the CodeDeploy deployment associated with the finding.
  final CodeDeployDeployment? codeDeployDeployment;

  FindingDetails({
    this.cloudFormationStackUpdate,
    this.codeDeployDeployment,
  });

  factory FindingDetails.fromJson(Map<String, dynamic> json) {
    return FindingDetails(
      cloudFormationStackUpdate: json['cloudFormationStackUpdate'] != null
          ? CloudFormationStackUpdate.fromJson(
              json['cloudFormationStackUpdate'] as Map<String, dynamic>)
          : null,
      codeDeployDeployment: json['codeDeployDeployment'] != null
          ? CodeDeployDeployment.fromJson(
              json['codeDeployDeployment'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudFormationStackUpdate = this.cloudFormationStackUpdate;
    final codeDeployDeployment = this.codeDeployDeployment;
    return {
      if (cloudFormationStackUpdate != null)
        'cloudFormationStackUpdate': cloudFormationStackUpdate,
      if (codeDeployDeployment != null)
        'codeDeployDeployment': codeDeployDeployment,
    };
  }
}

/// Identifying information about the finding.
class FindingSummary {
  /// The ID of the finding.
  final String id;

  /// The timestamp for when the finding was last updated.
  final DateTime lastModifiedTime;

  FindingSummary({
    required this.id,
    required this.lastModifiedTime,
  });

  factory FindingSummary.fromJson(Map<String, dynamic> json) {
    return FindingSummary(
      id: json['id'] as String,
      lastModifiedTime:
          nonNullableTimeStampFromJson(json['lastModifiedTime'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final lastModifiedTime = this.lastModifiedTime;
    return {
      'id': id,
      'lastModifiedTime': unixTimestampToJson(lastModifiedTime),
    };
  }
}

class GetIncidentRecordOutput {
  /// Details the structure of the incident record.
  final IncidentRecord incidentRecord;

  GetIncidentRecordOutput({
    required this.incidentRecord,
  });

  factory GetIncidentRecordOutput.fromJson(Map<String, dynamic> json) {
    return GetIncidentRecordOutput(
      incidentRecord: IncidentRecord.fromJson(
          json['incidentRecord'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final incidentRecord = this.incidentRecord;
    return {
      'incidentRecord': incidentRecord,
    };
  }
}

class GetReplicationSetOutput {
  /// Details of the replication set.
  final ReplicationSet replicationSet;

  GetReplicationSetOutput({
    required this.replicationSet,
  });

  factory GetReplicationSetOutput.fromJson(Map<String, dynamic> json) {
    return GetReplicationSetOutput(
      replicationSet: ReplicationSet.fromJson(
          json['replicationSet'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final replicationSet = this.replicationSet;
    return {
      'replicationSet': replicationSet,
    };
  }
}

class GetResourcePoliciesOutput {
  /// Details about the resource policy attached to the response plan.
  final List<ResourcePolicy> resourcePolicies;

  /// The pagination token to use when requesting the next set of items. If there
  /// are no additional items to return, the string is null.
  final String? nextToken;

  GetResourcePoliciesOutput({
    required this.resourcePolicies,
    this.nextToken,
  });

  factory GetResourcePoliciesOutput.fromJson(Map<String, dynamic> json) {
    return GetResourcePoliciesOutput(
      resourcePolicies: (json['resourcePolicies'] as List)
          .whereNotNull()
          .map((e) => ResourcePolicy.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourcePolicies = this.resourcePolicies;
    final nextToken = this.nextToken;
    return {
      'resourcePolicies': resourcePolicies,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class GetResponsePlanOutput {
  /// The ARN of the response plan.
  final String arn;

  /// Details used to create the incident when using this response plan.
  final IncidentTemplate incidentTemplate;

  /// The short format name of the response plan. The name can't contain spaces.
  final String name;

  /// The actions that this response plan takes at the beginning of the incident.
  final List<Action>? actions;

  /// The Chatbot chat channel used for collaboration during an incident.
  final ChatChannel? chatChannel;

  /// The long format name of the response plan. Can contain spaces.
  final String? displayName;

  /// The Amazon Resource Name (ARN) for the contacts and escalation plans that
  /// the response plan engages during an incident.
  final List<String>? engagements;

  /// Information about third-party services integrated into the Incident Manager
  /// response plan.
  final List<Integration>? integrations;

  GetResponsePlanOutput({
    required this.arn,
    required this.incidentTemplate,
    required this.name,
    this.actions,
    this.chatChannel,
    this.displayName,
    this.engagements,
    this.integrations,
  });

  factory GetResponsePlanOutput.fromJson(Map<String, dynamic> json) {
    return GetResponsePlanOutput(
      arn: json['arn'] as String,
      incidentTemplate: IncidentTemplate.fromJson(
          json['incidentTemplate'] as Map<String, dynamic>),
      name: json['name'] as String,
      actions: (json['actions'] as List?)
          ?.whereNotNull()
          .map((e) => Action.fromJson(e as Map<String, dynamic>))
          .toList(),
      chatChannel: json['chatChannel'] != null
          ? ChatChannel.fromJson(json['chatChannel'] as Map<String, dynamic>)
          : null,
      displayName: json['displayName'] as String?,
      engagements: (json['engagements'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      integrations: (json['integrations'] as List?)
          ?.whereNotNull()
          .map((e) => Integration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final incidentTemplate = this.incidentTemplate;
    final name = this.name;
    final actions = this.actions;
    final chatChannel = this.chatChannel;
    final displayName = this.displayName;
    final engagements = this.engagements;
    final integrations = this.integrations;
    return {
      'arn': arn,
      'incidentTemplate': incidentTemplate,
      'name': name,
      if (actions != null) 'actions': actions,
      if (chatChannel != null) 'chatChannel': chatChannel,
      if (displayName != null) 'displayName': displayName,
      if (engagements != null) 'engagements': engagements,
      if (integrations != null) 'integrations': integrations,
    };
  }
}

class GetTimelineEventOutput {
  /// Details about the timeline event.
  final TimelineEvent event;

  GetTimelineEventOutput({
    required this.event,
  });

  factory GetTimelineEventOutput.fromJson(Map<String, dynamic> json) {
    return GetTimelineEventOutput(
      event: TimelineEvent.fromJson(json['event'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final event = this.event;
    return {
      'event': event,
    };
  }
}

/// The record of the incident that's created when an incident occurs.
class IncidentRecord {
  /// The Amazon Resource Name (ARN) of the incident record.
  final String arn;

  /// The timestamp for when Incident Manager created the incident record.
  final DateTime creationTime;

  /// The string Incident Manager uses to prevent duplicate incidents from being
  /// created by the same incident in the same account.
  final String dedupeString;

  /// The impact of the incident on customers and applications.
  /// <p class="title"> <b>Supported impact codes</b>
  ///
  /// <ul>
  /// <li>
  /// <code>1</code> - Critical
  /// </li>
  /// <li>
  /// <code>2</code> - High
  /// </li>
  /// <li>
  /// <code>3</code> - Medium
  /// </li>
  /// <li>
  /// <code>4</code> - Low
  /// </li>
  /// <li>
  /// <code>5</code> - No Impact
  /// </li>
  /// </ul>
  final int impact;

  /// Details about the action that started the incident.
  final IncidentRecordSource incidentRecordSource;

  /// Who modified the incident most recently.
  final String lastModifiedBy;

  /// The timestamp for when the incident was most recently modified.
  final DateTime lastModifiedTime;

  /// The current status of the incident.
  final IncidentRecordStatus status;

  /// The title of the incident.
  final String title;

  /// The runbook, or automation document, that's run at the beginning of the
  /// incident.
  final List<AutomationExecution>? automationExecutions;

  /// The chat channel used for collaboration during an incident.
  final ChatChannel? chatChannel;

  /// The Amazon SNS targets that are notified when updates are made to an
  /// incident.
  final List<NotificationTargetItem>? notificationTargets;

  /// The timestamp for when the incident was resolved. This appears as a timeline
  /// event.
  final DateTime? resolvedTime;

  /// The summary of the incident. The summary is a brief synopsis of what
  /// occurred, what's currently happening, and context of the incident.
  final String? summary;

  IncidentRecord({
    required this.arn,
    required this.creationTime,
    required this.dedupeString,
    required this.impact,
    required this.incidentRecordSource,
    required this.lastModifiedBy,
    required this.lastModifiedTime,
    required this.status,
    required this.title,
    this.automationExecutions,
    this.chatChannel,
    this.notificationTargets,
    this.resolvedTime,
    this.summary,
  });

  factory IncidentRecord.fromJson(Map<String, dynamic> json) {
    return IncidentRecord(
      arn: json['arn'] as String,
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      dedupeString: json['dedupeString'] as String,
      impact: json['impact'] as int,
      incidentRecordSource: IncidentRecordSource.fromJson(
          json['incidentRecordSource'] as Map<String, dynamic>),
      lastModifiedBy: json['lastModifiedBy'] as String,
      lastModifiedTime:
          nonNullableTimeStampFromJson(json['lastModifiedTime'] as Object),
      status: (json['status'] as String).toIncidentRecordStatus(),
      title: json['title'] as String,
      automationExecutions: (json['automationExecutions'] as List?)
          ?.whereNotNull()
          .map((e) => AutomationExecution.fromJson(e as Map<String, dynamic>))
          .toList(),
      chatChannel: json['chatChannel'] != null
          ? ChatChannel.fromJson(json['chatChannel'] as Map<String, dynamic>)
          : null,
      notificationTargets: (json['notificationTargets'] as List?)
          ?.whereNotNull()
          .map(
              (e) => NotificationTargetItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      resolvedTime: timeStampFromJson(json['resolvedTime']),
      summary: json['summary'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final dedupeString = this.dedupeString;
    final impact = this.impact;
    final incidentRecordSource = this.incidentRecordSource;
    final lastModifiedBy = this.lastModifiedBy;
    final lastModifiedTime = this.lastModifiedTime;
    final status = this.status;
    final title = this.title;
    final automationExecutions = this.automationExecutions;
    final chatChannel = this.chatChannel;
    final notificationTargets = this.notificationTargets;
    final resolvedTime = this.resolvedTime;
    final summary = this.summary;
    return {
      'arn': arn,
      'creationTime': unixTimestampToJson(creationTime),
      'dedupeString': dedupeString,
      'impact': impact,
      'incidentRecordSource': incidentRecordSource,
      'lastModifiedBy': lastModifiedBy,
      'lastModifiedTime': unixTimestampToJson(lastModifiedTime),
      'status': status.toValue(),
      'title': title,
      if (automationExecutions != null)
        'automationExecutions': automationExecutions,
      if (chatChannel != null) 'chatChannel': chatChannel,
      if (notificationTargets != null)
        'notificationTargets': notificationTargets,
      if (resolvedTime != null)
        'resolvedTime': unixTimestampToJson(resolvedTime),
      if (summary != null) 'summary': summary,
    };
  }
}

/// Details about what created the incident record and when it was created.
class IncidentRecordSource {
  /// The principal that started the incident.
  final String createdBy;

  /// The service that started the incident. This can be manually created from
  /// Incident Manager, automatically created using an Amazon CloudWatch alarm, or
  /// Amazon EventBridge event.
  final String source;

  /// The service principal that assumed the role specified in
  /// <code>createdBy</code>. If no service principal assumed the role this will
  /// be left blank.
  final String? invokedBy;

  /// The resource that caused the incident to be created.
  final String? resourceArn;

  IncidentRecordSource({
    required this.createdBy,
    required this.source,
    this.invokedBy,
    this.resourceArn,
  });

  factory IncidentRecordSource.fromJson(Map<String, dynamic> json) {
    return IncidentRecordSource(
      createdBy: json['createdBy'] as String,
      source: json['source'] as String,
      invokedBy: json['invokedBy'] as String?,
      resourceArn: json['resourceArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdBy = this.createdBy;
    final source = this.source;
    final invokedBy = this.invokedBy;
    final resourceArn = this.resourceArn;
    return {
      'createdBy': createdBy,
      'source': source,
      if (invokedBy != null) 'invokedBy': invokedBy,
      if (resourceArn != null) 'resourceArn': resourceArn,
    };
  }
}

enum IncidentRecordStatus {
  open,
  resolved,
}

extension IncidentRecordStatusValueExtension on IncidentRecordStatus {
  String toValue() {
    switch (this) {
      case IncidentRecordStatus.open:
        return 'OPEN';
      case IncidentRecordStatus.resolved:
        return 'RESOLVED';
    }
  }
}

extension IncidentRecordStatusFromString on String {
  IncidentRecordStatus toIncidentRecordStatus() {
    switch (this) {
      case 'OPEN':
        return IncidentRecordStatus.open;
      case 'RESOLVED':
        return IncidentRecordStatus.resolved;
    }
    throw Exception('$this is not known in enum IncidentRecordStatus');
  }
}

/// Details describing an incident record.
class IncidentRecordSummary {
  /// The Amazon Resource Name (ARN) of the incident.
  final String arn;

  /// The timestamp for when the incident was created.
  final DateTime creationTime;

  /// Defines the impact to customers and applications.
  final int impact;

  /// What caused Incident Manager to create the incident.
  final IncidentRecordSource incidentRecordSource;

  /// The current status of the incident.
  final IncidentRecordStatus status;

  /// The title of the incident. This value is either provided by the response
  /// plan or overwritten on creation.
  final String title;

  /// The timestamp for when the incident was resolved.
  final DateTime? resolvedTime;

  IncidentRecordSummary({
    required this.arn,
    required this.creationTime,
    required this.impact,
    required this.incidentRecordSource,
    required this.status,
    required this.title,
    this.resolvedTime,
  });

  factory IncidentRecordSummary.fromJson(Map<String, dynamic> json) {
    return IncidentRecordSummary(
      arn: json['arn'] as String,
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      impact: json['impact'] as int,
      incidentRecordSource: IncidentRecordSource.fromJson(
          json['incidentRecordSource'] as Map<String, dynamic>),
      status: (json['status'] as String).toIncidentRecordStatus(),
      title: json['title'] as String,
      resolvedTime: timeStampFromJson(json['resolvedTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final impact = this.impact;
    final incidentRecordSource = this.incidentRecordSource;
    final status = this.status;
    final title = this.title;
    final resolvedTime = this.resolvedTime;
    return {
      'arn': arn,
      'creationTime': unixTimestampToJson(creationTime),
      'impact': impact,
      'incidentRecordSource': incidentRecordSource,
      'status': status.toValue(),
      'title': title,
      if (resolvedTime != null)
        'resolvedTime': unixTimestampToJson(resolvedTime),
    };
  }
}

/// Basic details used in creating a response plan. The response plan is then
/// used to create an incident record.
class IncidentTemplate {
  /// The impact of the incident on your customers and applications.
  /// <p class="title"> <b>Supported impact codes</b>
  ///
  /// <ul>
  /// <li>
  /// <code>1</code> - Critical
  /// </li>
  /// <li>
  /// <code>2</code> - High
  /// </li>
  /// <li>
  /// <code>3</code> - Medium
  /// </li>
  /// <li>
  /// <code>4</code> - Low
  /// </li>
  /// <li>
  /// <code>5</code> - No Impact
  /// </li>
  /// </ul>
  final int impact;

  /// The title of the incident.
  final String title;

  /// The string Incident Manager uses to prevent the same root cause from
  /// creating multiple incidents in the same account.
  ///
  /// A deduplication string is a term or phrase the system uses to check for
  /// duplicate incidents. If you specify a deduplication string, Incident Manager
  /// searches for open incidents that contain the same string in the
  /// <code>dedupeString</code> field when it creates the incident. If a duplicate
  /// is detected, Incident Manager deduplicates the newer incident into the
  /// existing incident.
  /// <note>
  /// By default, Incident Manager automatically deduplicates multiple incidents
  /// created by the same Amazon CloudWatch alarm or Amazon EventBridge event. You
  /// don't have to enter your own deduplication string to prevent duplication for
  /// these resource types.
  /// </note>
  final String? dedupeString;

  /// Tags to assign to the template. When the <code>StartIncident</code> API
  /// action is called, Incident Manager assigns the tags specified in the
  /// template to the incident.
  final Map<String, String>? incidentTags;

  /// The Amazon SNS targets that are notified when updates are made to an
  /// incident.
  final List<NotificationTargetItem>? notificationTargets;

  /// The summary of the incident. The summary is a brief synopsis of what
  /// occurred, what's currently happening, and context.
  final String? summary;

  IncidentTemplate({
    required this.impact,
    required this.title,
    this.dedupeString,
    this.incidentTags,
    this.notificationTargets,
    this.summary,
  });

  factory IncidentTemplate.fromJson(Map<String, dynamic> json) {
    return IncidentTemplate(
      impact: json['impact'] as int,
      title: json['title'] as String,
      dedupeString: json['dedupeString'] as String?,
      incidentTags: (json['incidentTags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      notificationTargets: (json['notificationTargets'] as List?)
          ?.whereNotNull()
          .map(
              (e) => NotificationTargetItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      summary: json['summary'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final impact = this.impact;
    final title = this.title;
    final dedupeString = this.dedupeString;
    final incidentTags = this.incidentTags;
    final notificationTargets = this.notificationTargets;
    final summary = this.summary;
    return {
      'impact': impact,
      'title': title,
      if (dedupeString != null) 'dedupeString': dedupeString,
      if (incidentTags != null) 'incidentTags': incidentTags,
      if (notificationTargets != null)
        'notificationTargets': notificationTargets,
      if (summary != null) 'summary': summary,
    };
  }
}

/// Information about third-party services integrated into a response plan.
class Integration {
  /// Information about the PagerDuty service where the response plan creates an
  /// incident.
  final PagerDutyConfiguration? pagerDutyConfiguration;

  Integration({
    this.pagerDutyConfiguration,
  });

  factory Integration.fromJson(Map<String, dynamic> json) {
    return Integration(
      pagerDutyConfiguration: json['pagerDutyConfiguration'] != null
          ? PagerDutyConfiguration.fromJson(
              json['pagerDutyConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final pagerDutyConfiguration = this.pagerDutyConfiguration;
    return {
      if (pagerDutyConfiguration != null)
        'pagerDutyConfiguration': pagerDutyConfiguration,
    };
  }
}

/// Details and type of a related item.
class ItemIdentifier {
  /// The type of related item.
  final ItemType type;

  /// Details about the related item.
  final ItemValue value;

  ItemIdentifier({
    required this.type,
    required this.value,
  });

  factory ItemIdentifier.fromJson(Map<String, dynamic> json) {
    return ItemIdentifier(
      type: (json['type'] as String).toItemType(),
      value: ItemValue.fromJson(json['value'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final value = this.value;
    return {
      'type': type.toValue(),
      'value': value,
    };
  }
}

enum ItemType {
  analysis,
  incident,
  metric,
  parent,
  attachment,
  other,
  automation,
  involvedResource,
  task,
}

extension ItemTypeValueExtension on ItemType {
  String toValue() {
    switch (this) {
      case ItemType.analysis:
        return 'ANALYSIS';
      case ItemType.incident:
        return 'INCIDENT';
      case ItemType.metric:
        return 'METRIC';
      case ItemType.parent:
        return 'PARENT';
      case ItemType.attachment:
        return 'ATTACHMENT';
      case ItemType.other:
        return 'OTHER';
      case ItemType.automation:
        return 'AUTOMATION';
      case ItemType.involvedResource:
        return 'INVOLVED_RESOURCE';
      case ItemType.task:
        return 'TASK';
    }
  }
}

extension ItemTypeFromString on String {
  ItemType toItemType() {
    switch (this) {
      case 'ANALYSIS':
        return ItemType.analysis;
      case 'INCIDENT':
        return ItemType.incident;
      case 'METRIC':
        return ItemType.metric;
      case 'PARENT':
        return ItemType.parent;
      case 'ATTACHMENT':
        return ItemType.attachment;
      case 'OTHER':
        return ItemType.other;
      case 'AUTOMATION':
        return ItemType.automation;
      case 'INVOLVED_RESOURCE':
        return ItemType.involvedResource;
      case 'TASK':
        return ItemType.task;
    }
    throw Exception('$this is not known in enum ItemType');
  }
}

/// Describes a related item.
class ItemValue {
  /// The Amazon Resource Name (ARN) of the related item, if the related item is
  /// an Amazon resource.
  final String? arn;

  /// The metric definition, if the related item is a metric in Amazon CloudWatch.
  final String? metricDefinition;

  /// Details about an incident that is associated with a PagerDuty incident.
  final PagerDutyIncidentDetail? pagerDutyIncidentDetail;

  /// The URL, if the related item is a non-Amazon Web Services resource.
  final String? url;

  ItemValue({
    this.arn,
    this.metricDefinition,
    this.pagerDutyIncidentDetail,
    this.url,
  });

  factory ItemValue.fromJson(Map<String, dynamic> json) {
    return ItemValue(
      arn: json['arn'] as String?,
      metricDefinition: json['metricDefinition'] as String?,
      pagerDutyIncidentDetail: json['pagerDutyIncidentDetail'] != null
          ? PagerDutyIncidentDetail.fromJson(
              json['pagerDutyIncidentDetail'] as Map<String, dynamic>)
          : null,
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final metricDefinition = this.metricDefinition;
    final pagerDutyIncidentDetail = this.pagerDutyIncidentDetail;
    final url = this.url;
    return {
      if (arn != null) 'arn': arn,
      if (metricDefinition != null) 'metricDefinition': metricDefinition,
      if (pagerDutyIncidentDetail != null)
        'pagerDutyIncidentDetail': pagerDutyIncidentDetail,
      if (url != null) 'url': url,
    };
  }
}

class ListIncidentFindingsOutput {
  /// A list of findings that represent deployments that might be the potential
  /// cause of the incident.
  final List<FindingSummary> findings;

  /// The pagination token to use when requesting the next set of items. If there
  /// are no additional items to return, the string is null.
  final String? nextToken;

  ListIncidentFindingsOutput({
    required this.findings,
    this.nextToken,
  });

  factory ListIncidentFindingsOutput.fromJson(Map<String, dynamic> json) {
    return ListIncidentFindingsOutput(
      findings: (json['findings'] as List)
          .whereNotNull()
          .map((e) => FindingSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final findings = this.findings;
    final nextToken = this.nextToken;
    return {
      'findings': findings,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListIncidentRecordsOutput {
  /// The details of each listed incident record.
  final List<IncidentRecordSummary> incidentRecordSummaries;

  /// The pagination token to use when requesting the next set of items. If there
  /// are no additional items to return, the string is null.
  final String? nextToken;

  ListIncidentRecordsOutput({
    required this.incidentRecordSummaries,
    this.nextToken,
  });

  factory ListIncidentRecordsOutput.fromJson(Map<String, dynamic> json) {
    return ListIncidentRecordsOutput(
      incidentRecordSummaries: (json['incidentRecordSummaries'] as List)
          .whereNotNull()
          .map((e) => IncidentRecordSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final incidentRecordSummaries = this.incidentRecordSummaries;
    final nextToken = this.nextToken;
    return {
      'incidentRecordSummaries': incidentRecordSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListRelatedItemsOutput {
  /// Details about each related item.
  final List<RelatedItem> relatedItems;

  /// The pagination token to use when requesting the next set of items. If there
  /// are no additional items to return, the string is null.
  final String? nextToken;

  ListRelatedItemsOutput({
    required this.relatedItems,
    this.nextToken,
  });

  factory ListRelatedItemsOutput.fromJson(Map<String, dynamic> json) {
    return ListRelatedItemsOutput(
      relatedItems: (json['relatedItems'] as List)
          .whereNotNull()
          .map((e) => RelatedItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final relatedItems = this.relatedItems;
    final nextToken = this.nextToken;
    return {
      'relatedItems': relatedItems,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListReplicationSetsOutput {
  /// The Amazon Resource Name (ARN) of the list replication set.
  final List<String> replicationSetArns;

  /// The pagination token to use when requesting the next set of items. If there
  /// are no additional items to return, the string is null.
  final String? nextToken;

  ListReplicationSetsOutput({
    required this.replicationSetArns,
    this.nextToken,
  });

  factory ListReplicationSetsOutput.fromJson(Map<String, dynamic> json) {
    return ListReplicationSetsOutput(
      replicationSetArns: (json['replicationSetArns'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final replicationSetArns = this.replicationSetArns;
    final nextToken = this.nextToken;
    return {
      'replicationSetArns': replicationSetArns,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListResponsePlansOutput {
  /// Details of each response plan.
  final List<ResponsePlanSummary> responsePlanSummaries;

  /// The pagination token to use when requesting the next set of items. If there
  /// are no additional items to return, the string is null.
  final String? nextToken;

  ListResponsePlansOutput({
    required this.responsePlanSummaries,
    this.nextToken,
  });

  factory ListResponsePlansOutput.fromJson(Map<String, dynamic> json) {
    return ListResponsePlansOutput(
      responsePlanSummaries: (json['responsePlanSummaries'] as List)
          .whereNotNull()
          .map((e) => ResponsePlanSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final responsePlanSummaries = this.responsePlanSummaries;
    final nextToken = this.nextToken;
    return {
      'responsePlanSummaries': responsePlanSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// A list of tags for the response plan or incident.
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    required this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      'tags': tags,
    };
  }
}

class ListTimelineEventsOutput {
  /// Details about each event that occurred during the incident.
  final List<EventSummary> eventSummaries;

  /// The pagination token to use when requesting the next set of items. If there
  /// are no additional items to return, the string is null.
  final String? nextToken;

  ListTimelineEventsOutput({
    required this.eventSummaries,
    this.nextToken,
  });

  factory ListTimelineEventsOutput.fromJson(Map<String, dynamic> json) {
    return ListTimelineEventsOutput(
      eventSummaries: (json['eventSummaries'] as List)
          .whereNotNull()
          .map((e) => EventSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventSummaries = this.eventSummaries;
    final nextToken = this.nextToken;
    return {
      'eventSummaries': eventSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// The SNS targets that are notified when updates are made to an incident.
class NotificationTargetItem {
  /// The Amazon Resource Name (ARN) of the SNS topic.
  final String? snsTopicArn;

  NotificationTargetItem({
    this.snsTopicArn,
  });

  factory NotificationTargetItem.fromJson(Map<String, dynamic> json) {
    return NotificationTargetItem(
      snsTopicArn: json['snsTopicArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final snsTopicArn = this.snsTopicArn;
    return {
      if (snsTopicArn != null) 'snsTopicArn': snsTopicArn,
    };
  }
}

/// Details about the PagerDuty configuration for a response plan.
class PagerDutyConfiguration {
  /// The name of the PagerDuty configuration.
  final String name;

  /// Details about the PagerDuty service associated with the configuration.
  final PagerDutyIncidentConfiguration pagerDutyIncidentConfiguration;

  /// The ID of the Amazon Web Services Secrets Manager secret that stores your
  /// PagerDuty key, either a General Access REST API Key or User Token REST API
  /// Key, and other user credentials.
  final String secretId;

  PagerDutyConfiguration({
    required this.name,
    required this.pagerDutyIncidentConfiguration,
    required this.secretId,
  });

  factory PagerDutyConfiguration.fromJson(Map<String, dynamic> json) {
    return PagerDutyConfiguration(
      name: json['name'] as String,
      pagerDutyIncidentConfiguration: PagerDutyIncidentConfiguration.fromJson(
          json['pagerDutyIncidentConfiguration'] as Map<String, dynamic>),
      secretId: json['secretId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final pagerDutyIncidentConfiguration = this.pagerDutyIncidentConfiguration;
    final secretId = this.secretId;
    return {
      'name': name,
      'pagerDutyIncidentConfiguration': pagerDutyIncidentConfiguration,
      'secretId': secretId,
    };
  }
}

/// Details about the PagerDuty service where the response plan creates an
/// incident.
class PagerDutyIncidentConfiguration {
  /// The ID of the PagerDuty service that the response plan associates with an
  /// incident when it launches.
  final String serviceId;

  PagerDutyIncidentConfiguration({
    required this.serviceId,
  });

  factory PagerDutyIncidentConfiguration.fromJson(Map<String, dynamic> json) {
    return PagerDutyIncidentConfiguration(
      serviceId: json['serviceId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceId = this.serviceId;
    return {
      'serviceId': serviceId,
    };
  }
}

/// Details about the PagerDuty incident associated with an incident created by
/// an Incident Manager response plan.
class PagerDutyIncidentDetail {
  /// The ID of the incident associated with the PagerDuty service for the
  /// response plan.
  final String id;

  /// Indicates whether to resolve the PagerDuty incident when you resolve the
  /// associated Incident Manager incident.
  final bool? autoResolve;

  /// The ID of the Amazon Web Services Secrets Manager secret that stores your
  /// PagerDuty key, either a General Access REST API Key or User Token REST API
  /// Key, and other user credentials.
  final String? secretId;

  PagerDutyIncidentDetail({
    required this.id,
    this.autoResolve,
    this.secretId,
  });

  factory PagerDutyIncidentDetail.fromJson(Map<String, dynamic> json) {
    return PagerDutyIncidentDetail(
      id: json['id'] as String,
      autoResolve: json['autoResolve'] as bool?,
      secretId: json['secretId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final autoResolve = this.autoResolve;
    final secretId = this.secretId;
    return {
      'id': id,
      if (autoResolve != null) 'autoResolve': autoResolve,
      if (secretId != null) 'secretId': secretId,
    };
  }
}

class PutResourcePolicyOutput {
  /// The ID of the resource policy.
  final String policyId;

  PutResourcePolicyOutput({
    required this.policyId,
  });

  factory PutResourcePolicyOutput.fromJson(Map<String, dynamic> json) {
    return PutResourcePolicyOutput(
      policyId: json['policyId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final policyId = this.policyId;
    return {
      'policyId': policyId,
    };
  }
}

/// Information about a Amazon Web Services Region in your replication set.
class RegionInfo {
  /// The status of the Amazon Web Services Region in the replication set.
  final RegionStatus status;

  /// The timestamp for when Incident Manager updated the status of the Amazon Web
  /// Services Region.
  final DateTime statusUpdateDateTime;

  /// The ID of the KMS key used to encrypt the data in this Amazon Web Services
  /// Region.
  final String? sseKmsKeyId;

  /// Information displayed about the status of the Amazon Web Services Region.
  final String? statusMessage;

  RegionInfo({
    required this.status,
    required this.statusUpdateDateTime,
    this.sseKmsKeyId,
    this.statusMessage,
  });

  factory RegionInfo.fromJson(Map<String, dynamic> json) {
    return RegionInfo(
      status: (json['status'] as String).toRegionStatus(),
      statusUpdateDateTime:
          nonNullableTimeStampFromJson(json['statusUpdateDateTime'] as Object),
      sseKmsKeyId: json['sseKmsKeyId'] as String?,
      statusMessage: json['statusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final statusUpdateDateTime = this.statusUpdateDateTime;
    final sseKmsKeyId = this.sseKmsKeyId;
    final statusMessage = this.statusMessage;
    return {
      'status': status.toValue(),
      'statusUpdateDateTime': unixTimestampToJson(statusUpdateDateTime),
      if (sseKmsKeyId != null) 'sseKmsKeyId': sseKmsKeyId,
      if (statusMessage != null) 'statusMessage': statusMessage,
    };
  }
}

/// The mapping between a Amazon Web Services Region and the key that's used to
/// encrypt the data.
class RegionMapInputValue {
  /// The KMS key used to encrypt the data in your replication set.
  final String? sseKmsKeyId;

  RegionMapInputValue({
    this.sseKmsKeyId,
  });

  Map<String, dynamic> toJson() {
    final sseKmsKeyId = this.sseKmsKeyId;
    return {
      if (sseKmsKeyId != null) 'sseKmsKeyId': sseKmsKeyId,
    };
  }
}

enum RegionStatus {
  active,
  creating,
  deleting,
  failed,
}

extension RegionStatusValueExtension on RegionStatus {
  String toValue() {
    switch (this) {
      case RegionStatus.active:
        return 'ACTIVE';
      case RegionStatus.creating:
        return 'CREATING';
      case RegionStatus.deleting:
        return 'DELETING';
      case RegionStatus.failed:
        return 'FAILED';
    }
  }
}

extension RegionStatusFromString on String {
  RegionStatus toRegionStatus() {
    switch (this) {
      case 'ACTIVE':
        return RegionStatus.active;
      case 'CREATING':
        return RegionStatus.creating;
      case 'DELETING':
        return RegionStatus.deleting;
      case 'FAILED':
        return RegionStatus.failed;
    }
    throw Exception('$this is not known in enum RegionStatus');
  }
}

/// Resources that responders use to triage and mitigate the incident.
class RelatedItem {
  /// Details about the related item.
  final ItemIdentifier identifier;

  /// A unique ID for a <code>RelatedItem</code>.
  /// <important>
  /// Don't specify this parameter when you add a <code>RelatedItem</code> by
  /// using the <a>UpdateRelatedItems</a> API action.
  /// </important>
  final String? generatedId;

  /// The title of the related item.
  final String? title;

  RelatedItem({
    required this.identifier,
    this.generatedId,
    this.title,
  });

  factory RelatedItem.fromJson(Map<String, dynamic> json) {
    return RelatedItem(
      identifier:
          ItemIdentifier.fromJson(json['identifier'] as Map<String, dynamic>),
      generatedId: json['generatedId'] as String?,
      title: json['title'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final identifier = this.identifier;
    final generatedId = this.generatedId;
    final title = this.title;
    return {
      'identifier': identifier,
      if (generatedId != null) 'generatedId': generatedId,
      if (title != null) 'title': title,
    };
  }
}

/// Details about the related item you're adding.
class RelatedItemsUpdate {
  /// Details about the related item you're adding.
  final RelatedItem? itemToAdd;

  /// Details about the related item you're deleting.
  final ItemIdentifier? itemToRemove;

  RelatedItemsUpdate({
    this.itemToAdd,
    this.itemToRemove,
  });

  Map<String, dynamic> toJson() {
    final itemToAdd = this.itemToAdd;
    final itemToRemove = this.itemToRemove;
    return {
      if (itemToAdd != null) 'itemToAdd': itemToAdd,
      if (itemToRemove != null) 'itemToRemove': itemToRemove,
    };
  }
}

/// The set of Amazon Web Services Region that your Incident Manager data will
/// be replicated to and the KMS key used to encrypt the data.
class ReplicationSet {
  /// Details about who created the replication set.
  final String createdBy;

  /// When the replication set was created.
  final DateTime createdTime;

  /// Determines if the replication set deletion protection is enabled or not. If
  /// deletion protection is enabled, you can't delete the last Amazon Web
  /// Services Region in the replication set.
  final bool deletionProtected;

  /// Who last modified the replication set.
  final String lastModifiedBy;

  /// When the replication set was last updated.
  final DateTime lastModifiedTime;

  /// The map between each Amazon Web Services Region in your replication set and
  /// the KMS key that's used to encrypt the data in that Region.
  final Map<String, RegionInfo> regionMap;

  /// The status of the replication set. If the replication set is still pending,
  /// you can't use Incident Manager functionality.
  final ReplicationSetStatus status;

  /// The Amazon Resource Name (ARN) of the replication set.
  final String? arn;

  ReplicationSet({
    required this.createdBy,
    required this.createdTime,
    required this.deletionProtected,
    required this.lastModifiedBy,
    required this.lastModifiedTime,
    required this.regionMap,
    required this.status,
    this.arn,
  });

  factory ReplicationSet.fromJson(Map<String, dynamic> json) {
    return ReplicationSet(
      createdBy: json['createdBy'] as String,
      createdTime: nonNullableTimeStampFromJson(json['createdTime'] as Object),
      deletionProtected: json['deletionProtected'] as bool,
      lastModifiedBy: json['lastModifiedBy'] as String,
      lastModifiedTime:
          nonNullableTimeStampFromJson(json['lastModifiedTime'] as Object),
      regionMap: (json['regionMap'] as Map<String, dynamic>).map((k, e) =>
          MapEntry(k, RegionInfo.fromJson(e as Map<String, dynamic>))),
      status: (json['status'] as String).toReplicationSetStatus(),
      arn: json['arn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdBy = this.createdBy;
    final createdTime = this.createdTime;
    final deletionProtected = this.deletionProtected;
    final lastModifiedBy = this.lastModifiedBy;
    final lastModifiedTime = this.lastModifiedTime;
    final regionMap = this.regionMap;
    final status = this.status;
    final arn = this.arn;
    return {
      'createdBy': createdBy,
      'createdTime': unixTimestampToJson(createdTime),
      'deletionProtected': deletionProtected,
      'lastModifiedBy': lastModifiedBy,
      'lastModifiedTime': unixTimestampToJson(lastModifiedTime),
      'regionMap': regionMap,
      'status': status.toValue(),
      if (arn != null) 'arn': arn,
    };
  }
}

enum ReplicationSetStatus {
  active,
  creating,
  updating,
  deleting,
  failed,
}

extension ReplicationSetStatusValueExtension on ReplicationSetStatus {
  String toValue() {
    switch (this) {
      case ReplicationSetStatus.active:
        return 'ACTIVE';
      case ReplicationSetStatus.creating:
        return 'CREATING';
      case ReplicationSetStatus.updating:
        return 'UPDATING';
      case ReplicationSetStatus.deleting:
        return 'DELETING';
      case ReplicationSetStatus.failed:
        return 'FAILED';
    }
  }
}

extension ReplicationSetStatusFromString on String {
  ReplicationSetStatus toReplicationSetStatus() {
    switch (this) {
      case 'ACTIVE':
        return ReplicationSetStatus.active;
      case 'CREATING':
        return ReplicationSetStatus.creating;
      case 'UPDATING':
        return ReplicationSetStatus.updating;
      case 'DELETING':
        return ReplicationSetStatus.deleting;
      case 'FAILED':
        return ReplicationSetStatus.failed;
    }
    throw Exception('$this is not known in enum ReplicationSetStatus');
  }
}

/// The resource policy that allows Incident Manager to perform actions on
/// resources on your behalf.
class ResourcePolicy {
  /// The JSON blob that describes the policy.
  final String policyDocument;

  /// The ID of the resource policy.
  final String policyId;

  /// The Amazon Web Services Region that policy allows resources to be used in.
  final String ramResourceShareRegion;

  ResourcePolicy({
    required this.policyDocument,
    required this.policyId,
    required this.ramResourceShareRegion,
  });

  factory ResourcePolicy.fromJson(Map<String, dynamic> json) {
    return ResourcePolicy(
      policyDocument: json['policyDocument'] as String,
      policyId: json['policyId'] as String,
      ramResourceShareRegion: json['ramResourceShareRegion'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final policyDocument = this.policyDocument;
    final policyId = this.policyId;
    final ramResourceShareRegion = this.ramResourceShareRegion;
    return {
      'policyDocument': policyDocument,
      'policyId': policyId,
      'ramResourceShareRegion': ramResourceShareRegion,
    };
  }
}

/// Details of the response plan that are used when creating an incident.
class ResponsePlanSummary {
  /// The Amazon Resource Name (ARN) of the response plan.
  final String arn;

  /// The name of the response plan. This can't include spaces.
  final String name;

  /// The human readable name of the response plan. This can include spaces.
  final String? displayName;

  ResponsePlanSummary({
    required this.arn,
    required this.name,
    this.displayName,
  });

  factory ResponsePlanSummary.fromJson(Map<String, dynamic> json) {
    return ResponsePlanSummary(
      arn: json['arn'] as String,
      name: json['name'] as String,
      displayName: json['displayName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    final displayName = this.displayName;
    return {
      'arn': arn,
      'name': name,
      if (displayName != null) 'displayName': displayName,
    };
  }
}

enum SortOrder {
  ascending,
  descending,
}

extension SortOrderValueExtension on SortOrder {
  String toValue() {
    switch (this) {
      case SortOrder.ascending:
        return 'ASCENDING';
      case SortOrder.descending:
        return 'DESCENDING';
    }
  }
}

extension SortOrderFromString on String {
  SortOrder toSortOrder() {
    switch (this) {
      case 'ASCENDING':
        return SortOrder.ascending;
      case 'DESCENDING':
        return SortOrder.descending;
    }
    throw Exception('$this is not known in enum SortOrder');
  }
}

/// Details about the Systems Manager automation document that will be used as a
/// runbook during an incident.
class SsmAutomation {
  /// The automation document's name.
  final String documentName;

  /// The Amazon Resource Name (ARN) of the role that the automation document will
  /// assume when running commands.
  final String roleArn;

  /// The automation document's version to use when running.
  final String? documentVersion;

  /// The key-value pair to resolve dynamic parameter values when processing a
  /// Systems Manager Automation runbook.
  final Map<String, DynamicSsmParameterValue>? dynamicParameters;

  /// The key-value pair parameters to use when running the automation document.
  final Map<String, List<String>>? parameters;

  /// The account that the automation document will be run in. This can be in
  /// either the management account or an application account.
  final SsmTargetAccount? targetAccount;

  SsmAutomation({
    required this.documentName,
    required this.roleArn,
    this.documentVersion,
    this.dynamicParameters,
    this.parameters,
    this.targetAccount,
  });

  factory SsmAutomation.fromJson(Map<String, dynamic> json) {
    return SsmAutomation(
      documentName: json['documentName'] as String,
      roleArn: json['roleArn'] as String,
      documentVersion: json['documentVersion'] as String?,
      dynamicParameters: (json['dynamicParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k, DynamicSsmParameterValue.fromJson(e as Map<String, dynamic>))),
      parameters: (json['parameters'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(
              k, (e as List).whereNotNull().map((e) => e as String).toList())),
      targetAccount: (json['targetAccount'] as String?)?.toSsmTargetAccount(),
    );
  }

  Map<String, dynamic> toJson() {
    final documentName = this.documentName;
    final roleArn = this.roleArn;
    final documentVersion = this.documentVersion;
    final dynamicParameters = this.dynamicParameters;
    final parameters = this.parameters;
    final targetAccount = this.targetAccount;
    return {
      'documentName': documentName,
      'roleArn': roleArn,
      if (documentVersion != null) 'documentVersion': documentVersion,
      if (dynamicParameters != null) 'dynamicParameters': dynamicParameters,
      if (parameters != null) 'parameters': parameters,
      if (targetAccount != null) 'targetAccount': targetAccount.toValue(),
    };
  }
}

enum SsmTargetAccount {
  responsePlanOwnerAccount,
  impactedAccount,
}

extension SsmTargetAccountValueExtension on SsmTargetAccount {
  String toValue() {
    switch (this) {
      case SsmTargetAccount.responsePlanOwnerAccount:
        return 'RESPONSE_PLAN_OWNER_ACCOUNT';
      case SsmTargetAccount.impactedAccount:
        return 'IMPACTED_ACCOUNT';
    }
  }
}

extension SsmTargetAccountFromString on String {
  SsmTargetAccount toSsmTargetAccount() {
    switch (this) {
      case 'RESPONSE_PLAN_OWNER_ACCOUNT':
        return SsmTargetAccount.responsePlanOwnerAccount;
      case 'IMPACTED_ACCOUNT':
        return SsmTargetAccount.impactedAccount;
    }
    throw Exception('$this is not known in enum SsmTargetAccount');
  }
}

class StartIncidentOutput {
  /// The ARN of the newly created incident record.
  final String incidentRecordArn;

  StartIncidentOutput({
    required this.incidentRecordArn,
  });

  factory StartIncidentOutput.fromJson(Map<String, dynamic> json) {
    return StartIncidentOutput(
      incidentRecordArn: json['incidentRecordArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final incidentRecordArn = this.incidentRecordArn;
    return {
      'incidentRecordArn': incidentRecordArn,
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

/// A significant event that happened during the incident.
class TimelineEvent {
  /// A short description of the event.
  final String eventData;

  /// The ID of the timeline event.
  final String eventId;

  /// The timestamp for when the event occurred.
  final DateTime eventTime;

  /// The type of event that occurred. Currently Incident Manager supports only
  /// the <code>Custom Event</code> and <code>Note</code> types.
  final String eventType;

  /// The timestamp for when the timeline event was last updated.
  final DateTime eventUpdatedTime;

  /// The Amazon Resource Name (ARN) of the incident that the event occurred
  /// during.
  final String incidentRecordArn;

  /// A list of references in a <code>TimelineEvent</code>.
  final List<EventReference>? eventReferences;

  TimelineEvent({
    required this.eventData,
    required this.eventId,
    required this.eventTime,
    required this.eventType,
    required this.eventUpdatedTime,
    required this.incidentRecordArn,
    this.eventReferences,
  });

  factory TimelineEvent.fromJson(Map<String, dynamic> json) {
    return TimelineEvent(
      eventData: json['eventData'] as String,
      eventId: json['eventId'] as String,
      eventTime: nonNullableTimeStampFromJson(json['eventTime'] as Object),
      eventType: json['eventType'] as String,
      eventUpdatedTime:
          nonNullableTimeStampFromJson(json['eventUpdatedTime'] as Object),
      incidentRecordArn: json['incidentRecordArn'] as String,
      eventReferences: (json['eventReferences'] as List?)
          ?.whereNotNull()
          .map((e) => EventReference.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final eventData = this.eventData;
    final eventId = this.eventId;
    final eventTime = this.eventTime;
    final eventType = this.eventType;
    final eventUpdatedTime = this.eventUpdatedTime;
    final incidentRecordArn = this.incidentRecordArn;
    final eventReferences = this.eventReferences;
    return {
      'eventData': eventData,
      'eventId': eventId,
      'eventTime': unixTimestampToJson(eventTime),
      'eventType': eventType,
      'eventUpdatedTime': unixTimestampToJson(eventUpdatedTime),
      'incidentRecordArn': incidentRecordArn,
      if (eventReferences != null) 'eventReferences': eventReferences,
    };
  }
}

enum TimelineEventSort {
  eventTime,
}

extension TimelineEventSortValueExtension on TimelineEventSort {
  String toValue() {
    switch (this) {
      case TimelineEventSort.eventTime:
        return 'EVENT_TIME';
    }
  }
}

extension TimelineEventSortFromString on String {
  TimelineEventSort toTimelineEventSort() {
    switch (this) {
      case 'EVENT_TIME':
        return TimelineEventSort.eventTime;
    }
    throw Exception('$this is not known in enum TimelineEventSort');
  }
}

/// Details about what caused the incident to be created in Incident Manager.
class TriggerDetails {
  /// Identifies the service that sourced the event. All events sourced from
  /// within Amazon Web Services begin with "<code>aws.</code>" Customer-generated
  /// events can have any value here, as long as it doesn't begin with
  /// "<code>aws.</code>" We recommend the use of Java package-name style reverse
  /// domain-name strings.
  final String source;

  /// The timestamp for when the incident was detected.
  final DateTime timestamp;

  /// Raw data passed from either Amazon EventBridge, Amazon CloudWatch, or
  /// Incident Manager when an incident is created.
  final String? rawData;

  /// The Amazon Resource Name (ARN) of the source that detected the incident.
  final String? triggerArn;

  TriggerDetails({
    required this.source,
    required this.timestamp,
    this.rawData,
    this.triggerArn,
  });

  Map<String, dynamic> toJson() {
    final source = this.source;
    final timestamp = this.timestamp;
    final rawData = this.rawData;
    final triggerArn = this.triggerArn;
    return {
      'source': source,
      'timestamp': unixTimestampToJson(timestamp),
      if (rawData != null) 'rawData': rawData,
      if (triggerArn != null) 'triggerArn': triggerArn,
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

class UpdateDeletionProtectionOutput {
  UpdateDeletionProtectionOutput();

  factory UpdateDeletionProtectionOutput.fromJson(Map<String, dynamic> _) {
    return UpdateDeletionProtectionOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateIncidentRecordOutput {
  UpdateIncidentRecordOutput();

  factory UpdateIncidentRecordOutput.fromJson(Map<String, dynamic> _) {
    return UpdateIncidentRecordOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateRelatedItemsOutput {
  UpdateRelatedItemsOutput();

  factory UpdateRelatedItemsOutput.fromJson(Map<String, dynamic> _) {
    return UpdateRelatedItemsOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Details used when updating the replication set.
class UpdateReplicationSetAction {
  /// Details about the Amazon Web Services Region that you're adding to the
  /// replication set.
  final AddRegionAction? addRegionAction;

  /// Details about the Amazon Web Services Region that you're deleting to the
  /// replication set.
  final DeleteRegionAction? deleteRegionAction;

  UpdateReplicationSetAction({
    this.addRegionAction,
    this.deleteRegionAction,
  });

  Map<String, dynamic> toJson() {
    final addRegionAction = this.addRegionAction;
    final deleteRegionAction = this.deleteRegionAction;
    return {
      if (addRegionAction != null) 'addRegionAction': addRegionAction,
      if (deleteRegionAction != null) 'deleteRegionAction': deleteRegionAction,
    };
  }
}

class UpdateReplicationSetOutput {
  UpdateReplicationSetOutput();

  factory UpdateReplicationSetOutput.fromJson(Map<String, dynamic> _) {
    return UpdateReplicationSetOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateResponsePlanOutput {
  UpdateResponsePlanOutput();

  factory UpdateResponsePlanOutput.fromJson(Map<String, dynamic> _) {
    return UpdateResponsePlanOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateTimelineEventOutput {
  UpdateTimelineEventOutput();

  factory UpdateTimelineEventOutput.fromJson(Map<String, dynamic> _) {
    return UpdateTimelineEventOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum VariableType {
  incidentRecordArn,
  involvedResources,
}

extension VariableTypeValueExtension on VariableType {
  String toValue() {
    switch (this) {
      case VariableType.incidentRecordArn:
        return 'INCIDENT_RECORD_ARN';
      case VariableType.involvedResources:
        return 'INVOLVED_RESOURCES';
    }
  }
}

extension VariableTypeFromString on String {
  VariableType toVariableType() {
    switch (this) {
      case 'INCIDENT_RECORD_ARN':
        return VariableType.incidentRecordArn;
      case 'INVOLVED_RESOURCES':
        return VariableType.involvedResources;
    }
    throw Exception('$this is not known in enum VariableType');
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

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
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
