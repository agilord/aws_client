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

/// The <i>User Notifications API Reference</i> provides descriptions, API
/// request parameters, and the JSON response for each of the User Notifications
/// API actions.
///
/// User Notification control plane APIs are currently available in US East
/// (Virginia) - <code>us-east-1</code>.
///
/// <a
/// href="https://docs.aws.amazon.com/notifications/latest/APIReference/API_GetNotificationEvent.html">GetNotificationEvent</a>
/// and <a
/// href="https://docs.aws.amazon.com/notifications/latest/APIReference/API_ListNotificationEvents.html">ListNotificationEvents</a>
/// APIs are currently available in <a
/// href="https://docs.aws.amazon.com/notifications/latest/userguide/supported-regions.html">commercial
/// partition Regions</a> and only return notifications stored in the same
/// Region in which they're called.
///
/// The User Notifications console can only be used in US East (Virginia). Your
/// data however, is stored in each Region chosen as a <a
/// href="https://docs.aws.amazon.com/notifications/latest/userguide/notification-hubs.html">notification
/// hub</a> in addition to US East (Virginia).
/// <note>
/// For information about descriptions, API request parameters, and the JSON
/// response for email contact related API actions, see the <a
/// href="https://docs.aws.amazon.com/notificationscontacts/latest/APIReference/Welcome.html">User
/// Notifications Contacts API Reference Guide</a>.
/// </note>
class Notifications {
  final _s.RestJsonProtocol _protocol;
  Notifications({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'notifications',
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

  /// Returns a list of Account contacts and Channels associated with a
  /// <code>ManagedNotificationConfiguration</code>, in paginated format.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [managedNotificationConfigurationArn] :
  /// The Amazon Resource Name (ARN) of the
  /// <code>ManagedNotificationConfiguration</code> to match.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned in this call. Defaults to 20.
  ///
  /// Parameter [nextToken] :
  /// The start token for paginated calls. Retrieved from the response of a
  /// previous <code>ListManagedNotificationChannelAssociations</code> call.
  Future<ListManagedNotificationChannelAssociationsResponse>
      listManagedNotificationChannelAssociations({
    required String managedNotificationConfigurationArn,
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      'managedNotificationConfigurationArn': [
        managedNotificationConfigurationArn
      ],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/channels/list-managed-notification-channel-associations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListManagedNotificationChannelAssociationsResponse.fromJson(
        response);
  }

  /// Returns a list of member accounts associated with a notification
  /// configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [notificationConfigurationArn] :
  /// The Amazon Resource Name (ARN) of the notification configuration used to
  /// filter the member accounts.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. Valid values are
  /// 1-100.
  ///
  /// Parameter [memberAccount] :
  /// The member account identifier used to filter the results.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results. Use the value returned in the
  /// previous response.
  ///
  /// Parameter [organizationalUnitId] :
  /// The organizational unit ID used to filter the member accounts.
  ///
  /// Parameter [status] :
  /// The status used to filter the member accounts.
  Future<ListMemberAccountsResponse> listMemberAccounts({
    required String notificationConfigurationArn,
    int? maxResults,
    String? memberAccount,
    String? nextToken,
    String? organizationalUnitId,
    MemberAccountNotificationConfigurationStatus? status,
  }) async {
    final $query = <String, List<String>>{
      'notificationConfigurationArn': [notificationConfigurationArn],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (memberAccount != null) 'memberAccount': [memberAccount],
      if (nextToken != null) 'nextToken': [nextToken],
      if (organizationalUnitId != null)
        'organizationalUnitId': [organizationalUnitId],
      if (status != null) 'status': [status.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/list-member-accounts',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMemberAccountsResponse.fromJson(response);
  }

  /// Returns a list of tags for a specified Amazon Resource Name (ARN).
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/tag-editor/latest/userguide/tagging.html">Tagging
  /// your Amazon Web Services resources</a> in the <i>Tagging Amazon Web
  /// Services Resources User Guide</i>.
  /// <note>
  /// This is only supported for <code>NotificationConfigurations</code>.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) to use to list tags.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String arn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Tags the resource with a tag key and value.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/tag-editor/latest/userguide/tagging.html">Tagging
  /// your Amazon Web Services resources</a> in the <i>Tagging Amazon Web
  /// Services Resources User Guide</i>.
  /// <note>
  /// This is only supported for <code>NotificationConfigurations</code>.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) to use to tag a resource.
  ///
  /// Parameter [tags] :
  /// A map of tags assigned to a resource. A tag is a string-to-string map of
  /// key-value pairs.
  Future<void> tagResource({
    required String arn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Untags a resource with a specified Amazon Resource Name (ARN).
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/tag-editor/latest/userguide/tagging.html">Tagging
  /// your Amazon Web Services resources</a> in the <i>Tagging Amazon Web
  /// Services Resources User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) to use to untag a resource.
  ///
  /// Parameter [tagKeys] :
  /// The tag keys to use to untag a resource.
  Future<void> untagResource({
    required String arn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(arn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Associates a delivery <a
  /// href="https://docs.aws.amazon.com/notifications/latest/userguide/managing-delivery-channels.html">Channel</a>
  /// with a particular <code>NotificationConfiguration</code>. Supported
  /// Channels include Amazon Q Developer in chat applications, the Console
  /// Mobile Application, and emails (notifications-contacts).
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the Channel to associate with the
  /// <code>NotificationConfiguration</code>.
  ///
  /// Supported ARNs include Amazon Q Developer in chat applications, the
  /// Console Mobile Application, and notifications-contacts.
  ///
  /// Parameter [notificationConfigurationArn] :
  /// The ARN of the <code>NotificationConfiguration</code> to associate with
  /// the Channel.
  Future<void> associateChannel({
    required String arn,
    required String notificationConfigurationArn,
  }) async {
    final $payload = <String, dynamic>{
      'notificationConfigurationArn': notificationConfigurationArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/channels/associate/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disassociates a Channel from a specified
  /// <code>NotificationConfiguration</code>. Supported Channels include Amazon
  /// Q Developer in chat applications, the Console Mobile Application, and
  /// emails (notifications-contacts).
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the Channel to disassociate.
  ///
  /// Parameter [notificationConfigurationArn] :
  /// The ARN of the <code>NotificationConfiguration</code> to disassociate.
  Future<void> disassociateChannel({
    required String arn,
    required String notificationConfigurationArn,
  }) async {
    final $payload = <String, dynamic>{
      'notificationConfigurationArn': notificationConfigurationArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/channels/disassociate/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns a list of Channels for a <code>NotificationConfiguration</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [notificationConfigurationArn] :
  /// The Amazon Resource Name (ARN) of the
  /// <code>NotificationConfiguration</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned in this call. The default
  /// value is 20.
  ///
  /// Parameter [nextToken] :
  /// The start token for paginated calls. Retrieved from the response of a
  /// previous ListNotificationEvents call. <code>NextToken</code> uses Base64
  /// encoding.
  Future<ListChannelsResponse> listChannels({
    required String notificationConfigurationArn,
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      'notificationConfigurationArn': [notificationConfigurationArn],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/channels',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListChannelsResponse.fromJson(response);
  }

  /// Creates an <a
  /// href="https://docs.aws.amazon.com/notifications/latest/userguide/glossary.html">
  /// <code>EventRule</code> </a> that is associated with a specified
  /// <code>NotificationConfiguration</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [eventType] :
  /// The event type to match.
  ///
  /// Must match one of the valid Amazon EventBridge event types. For example,
  /// EC2 Instance State-change Notification and Amazon CloudWatch Alarm State
  /// Change. For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-service-event.html#eb-service-event-delivery-level">Event
  /// delivery from Amazon Web Services services</a> in the <i>Amazon
  /// EventBridge User Guide</i>.
  ///
  /// Parameter [notificationConfigurationArn] :
  /// The Amazon Resource Name (ARN) of the
  /// <code>NotificationConfiguration</code> associated with this
  /// <code>EventRule</code>.
  ///
  /// Parameter [regions] :
  /// A list of Amazon Web Services Regions that send events to this
  /// <code>EventRule</code>.
  ///
  /// Parameter [source] :
  /// The matched event source.
  ///
  /// Must match one of the valid EventBridge sources. Only Amazon Web Services
  /// service sourced events are supported. For example, <code>aws.ec2</code>
  /// and <code>aws.cloudwatch</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-service-event.html#eb-service-event-delivery-level">Event
  /// delivery from Amazon Web Services services</a> in the <i>Amazon
  /// EventBridge User Guide</i>.
  ///
  /// Parameter [eventPattern] :
  /// An additional event pattern used to further filter the events this
  /// <code>EventRule</code> receives.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-event-patterns.html">Amazon
  /// EventBridge event patterns</a> in the <i>Amazon EventBridge User
  /// Guide.</i>
  Future<CreateEventRuleResponse> createEventRule({
    required String eventType,
    required String notificationConfigurationArn,
    required List<String> regions,
    required String source,
    String? eventPattern,
  }) async {
    final $payload = <String, dynamic>{
      'eventType': eventType,
      'notificationConfigurationArn': notificationConfigurationArn,
      'regions': regions,
      'source': source,
      if (eventPattern != null) 'eventPattern': eventPattern,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/event-rules',
      exceptionFnMap: _exceptionFns,
    );
    return CreateEventRuleResponse.fromJson(response);
  }

  /// Updates an existing <code>EventRule</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) to use to update the
  /// <code>EventRule</code>.
  ///
  /// Parameter [eventPattern] :
  /// An additional event pattern used to further filter the events this
  /// <code>EventRule</code> receives.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-event-patterns.html">Amazon
  /// EventBridge event patterns</a> in the <i>Amazon EventBridge User
  /// Guide.</i>
  ///
  /// Parameter [regions] :
  /// A list of Amazon Web Services Regions that sends events to this
  /// <code>EventRule</code>.
  Future<UpdateEventRuleResponse> updateEventRule({
    required String arn,
    String? eventPattern,
    List<String>? regions,
  }) async {
    final $payload = <String, dynamic>{
      if (eventPattern != null) 'eventPattern': eventPattern,
      if (regions != null) 'regions': regions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/event-rules/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateEventRuleResponse.fromJson(response);
  }

  /// Returns a specified <code>EventRule</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the <code>EventRule</code> to return.
  Future<GetEventRuleResponse> getEventRule({
    required String arn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/event-rules/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetEventRuleResponse.fromJson(response);
  }

  /// Deletes an <code>EventRule</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the <code>EventRule</code> to delete.
  Future<void> deleteEventRule({
    required String arn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/event-rules/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns a list of <code>EventRules</code> according to specified filters,
  /// in reverse chronological order (newest first).
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [notificationConfigurationArn] :
  /// The Amazon Resource Name (ARN) of the
  /// <code>NotificationConfiguration</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned in this call. The default
  /// value is 20.
  ///
  /// Parameter [nextToken] :
  /// The start token for paginated calls. Retrieved from the response of a
  /// previous <code>ListEventRules</code> call. Next token uses Base64
  /// encoding.
  Future<ListEventRulesResponse> listEventRules({
    required String notificationConfigurationArn,
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      'notificationConfigurationArn': [notificationConfigurationArn],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/event-rules',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListEventRulesResponse.fromJson(response);
  }

  /// Associates an Account Contact with a particular
  /// <code>ManagedNotificationConfiguration</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [contactIdentifier] :
  /// A unique value of an Account Contact Type to associate with the
  /// <code>ManagedNotificationConfiguration</code>.
  ///
  /// Parameter [managedNotificationConfigurationArn] :
  /// The Amazon Resource Name (ARN) of the
  /// <code>ManagedNotificationConfiguration</code> to associate with the
  /// Account Contact.
  Future<void> associateManagedNotificationAccountContact({
    required AccountContactType contactIdentifier,
    required String managedNotificationConfigurationArn,
  }) async {
    final $payload = <String, dynamic>{
      'managedNotificationConfigurationArn':
          managedNotificationConfigurationArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/contacts/associate-managed-notification/${Uri.encodeComponent(contactIdentifier.value)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disassociates an Account Contact with a particular
  /// <code>ManagedNotificationConfiguration</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [contactIdentifier] :
  /// The unique value of an Account Contact Type to associate with the
  /// <code>ManagedNotificationConfiguration</code>.
  ///
  /// Parameter [managedNotificationConfigurationArn] :
  /// The Amazon Resource Name (ARN) of the
  /// <code>ManagedNotificationConfiguration</code> to associate with the
  /// Account Contact.
  Future<void> disassociateManagedNotificationAccountContact({
    required AccountContactType contactIdentifier,
    required String managedNotificationConfigurationArn,
  }) async {
    final $payload = <String, dynamic>{
      'managedNotificationConfigurationArn':
          managedNotificationConfigurationArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/contacts/disassociate-managed-notification/${Uri.encodeComponent(contactIdentifier.value)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Associates an additional Channel with a particular
  /// <code>ManagedNotificationConfiguration</code>.
  ///
  /// Supported Channels include Amazon Q Developer in chat applications, the
  /// Console Mobile Application, and emails (notifications-contacts).
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelArn] :
  /// The Amazon Resource Name (ARN) of the Channel to associate with the
  /// <code>ManagedNotificationConfiguration</code>.
  ///
  /// Supported ARNs include Amazon Q Developer in chat applications, the
  /// Console Mobile Application, and email (notifications-contacts).
  ///
  /// Parameter [managedNotificationConfigurationArn] :
  /// The Amazon Resource Name (ARN) of the
  /// <code>ManagedNotificationConfiguration</code> to associate with the
  /// additional Channel.
  Future<void> associateManagedNotificationAdditionalChannel({
    required String channelArn,
    required String managedNotificationConfigurationArn,
  }) async {
    final $payload = <String, dynamic>{
      'managedNotificationConfigurationArn':
          managedNotificationConfigurationArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/channels/associate-managed-notification/${Uri.encodeComponent(channelArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disassociates an additional Channel from a particular
  /// <code>ManagedNotificationConfiguration</code>.
  ///
  /// Supported Channels include Amazon Q Developer in chat applications, the
  /// Console Mobile Application, and emails (notifications-contacts).
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelArn] :
  /// The Amazon Resource Name (ARN) of the Channel to associate with the
  /// <code>ManagedNotificationConfiguration</code>.
  ///
  /// Parameter [managedNotificationConfigurationArn] :
  /// The Amazon Resource Name (ARN) of the Managed Notification Configuration
  /// to associate with the additional Channel.
  Future<void> disassociateManagedNotificationAdditionalChannel({
    required String channelArn,
    required String managedNotificationConfigurationArn,
  }) async {
    final $payload = <String, dynamic>{
      'managedNotificationConfigurationArn':
          managedNotificationConfigurationArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/channels/disassociate-managed-notification/${Uri.encodeComponent(channelArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns the child event of a specific given
  /// <code>ManagedNotificationEvent</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the
  /// <code>ManagedNotificationChildEvent</code> to return.
  ///
  /// Parameter [locale] :
  /// The locale code of the language used for the retrieved
  /// <code>ManagedNotificationChildEvent</code>. The default locale is English
  /// <code>en_US</code>.
  Future<GetManagedNotificationChildEventResponse>
      getManagedNotificationChildEvent({
    required String arn,
    LocaleCode? locale,
  }) async {
    final $query = <String, List<String>>{
      if (locale != null) 'locale': [locale.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/managed-notification-child-events/${Uri.encodeComponent(arn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetManagedNotificationChildEventResponse.fromJson(response);
  }

  /// Returns a list of <code>ManagedNotificationChildEvents</code> for a
  /// specified aggregate <code>ManagedNotificationEvent</code>, ordered by
  /// creation time in reverse chronological order (newest first).
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [aggregateManagedNotificationEventArn] :
  /// The Amazon Resource Name (ARN) of the
  /// <code>ManagedNotificationEvent</code>.
  ///
  /// Parameter [endTime] :
  /// Latest time of events to return from this call.
  ///
  /// Parameter [locale] :
  /// The locale code of the language used for the retrieved
  /// <code>NotificationEvent</code>. The default locale is
  /// English.<code>en_US</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned in this call. Defaults to 20.
  ///
  /// Parameter [nextToken] :
  /// The start token for paginated calls. Retrieved from the response of a
  /// previous ListManagedNotificationChannelAssociations call. Next token uses
  /// Base64 encoding.
  ///
  /// Parameter [organizationalUnitId] :
  /// The identifier of the Amazon Web Services Organizations organizational
  /// unit (OU) associated with the Managed Notification Child Events.
  ///
  /// Parameter [relatedAccount] :
  /// The Amazon Web Services account ID associated with the Managed
  /// Notification Child Events.
  ///
  /// Parameter [startTime] :
  /// The earliest time of events to return from this call.
  Future<ListManagedNotificationChildEventsResponse>
      listManagedNotificationChildEvents({
    required String aggregateManagedNotificationEventArn,
    DateTime? endTime,
    LocaleCode? locale,
    int? maxResults,
    String? nextToken,
    String? organizationalUnitId,
    String? relatedAccount,
    DateTime? startTime,
  }) async {
    final $query = <String, List<String>>{
      if (endTime != null) 'endTime': [_s.iso8601ToJson(endTime).toString()],
      if (locale != null) 'locale': [locale.value],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (organizationalUnitId != null)
        'organizationalUnitId': [organizationalUnitId],
      if (relatedAccount != null) 'relatedAccount': [relatedAccount],
      if (startTime != null)
        'startTime': [_s.iso8601ToJson(startTime).toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/list-managed-notification-child-events/${Uri.encodeComponent(aggregateManagedNotificationEventArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListManagedNotificationChildEventsResponse.fromJson(response);
  }

  /// Returns a specified <code>ManagedNotificationConfiguration</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the
  /// <code>ManagedNotificationConfiguration</code> to return.
  Future<GetManagedNotificationConfigurationResponse>
      getManagedNotificationConfiguration({
    required String arn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/managed-notification-configurations/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetManagedNotificationConfigurationResponse.fromJson(response);
  }

  /// Returns a list of Managed Notification Configurations according to
  /// specified filters, ordered by creation time in reverse chronological order
  /// (newest first).
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelIdentifier] :
  /// The identifier or ARN of the notification channel to filter configurations
  /// by.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned in this call. Defaults to 20.
  ///
  /// Parameter [nextToken] :
  /// The start token for paginated calls. Retrieved from the response of a
  /// previous ListManagedNotificationChannelAssociations call. Next token uses
  /// Base64 encoding.
  Future<ListManagedNotificationConfigurationsResponse>
      listManagedNotificationConfigurations({
    String? channelIdentifier,
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (channelIdentifier != null) 'channelIdentifier': [channelIdentifier],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/managed-notification-configurations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListManagedNotificationConfigurationsResponse.fromJson(response);
  }

  /// Returns a specified <code>ManagedNotificationEvent</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the
  /// <code>ManagedNotificationEvent</code> to return.
  ///
  /// Parameter [locale] :
  /// The locale code of the language used for the retrieved
  /// <code>ManagedNotificationEvent</code>. The default locale is English
  /// <code>(en_US)</code>.
  Future<GetManagedNotificationEventResponse> getManagedNotificationEvent({
    required String arn,
    LocaleCode? locale,
  }) async {
    final $query = <String, List<String>>{
      if (locale != null) 'locale': [locale.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/managed-notification-events/${Uri.encodeComponent(arn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetManagedNotificationEventResponse.fromJson(response);
  }

  /// Returns a list of Managed Notification Events according to specified
  /// filters, ordered by creation time in reverse chronological order (newest
  /// first).
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [endTime] :
  /// Latest time of events to return from this call.
  ///
  /// Parameter [locale] :
  /// The locale code of the language used for the retrieved NotificationEvent.
  /// The default locale is English (en_US).
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned in this call. Defaults to 20.
  ///
  /// Parameter [nextToken] :
  /// The start token for paginated calls. Retrieved from the response of a
  /// previous <code>ListManagedNotificationChannelAssociations</code> call.
  /// Next token uses Base64 encoding.
  ///
  /// Parameter [organizationalUnitId] :
  /// The Organizational Unit Id that an Amazon Web Services account belongs to.
  ///
  /// Parameter [relatedAccount] :
  /// The Amazon Web Services account ID associated with the Managed
  /// Notification Events.
  ///
  /// Parameter [source] :
  /// The Amazon Web Services service the event originates from. For example
  /// aws.cloudwatch.
  ///
  /// Parameter [startTime] :
  /// The earliest time of events to return from this call.
  Future<ListManagedNotificationEventsResponse> listManagedNotificationEvents({
    DateTime? endTime,
    LocaleCode? locale,
    int? maxResults,
    String? nextToken,
    String? organizationalUnitId,
    String? relatedAccount,
    String? source,
    DateTime? startTime,
  }) async {
    final $query = <String, List<String>>{
      if (endTime != null) 'endTime': [_s.iso8601ToJson(endTime).toString()],
      if (locale != null) 'locale': [locale.value],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (organizationalUnitId != null)
        'organizationalUnitId': [organizationalUnitId],
      if (relatedAccount != null) 'relatedAccount': [relatedAccount],
      if (source != null) 'source': [source],
      if (startTime != null)
        'startTime': [_s.iso8601ToJson(startTime).toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/managed-notification-events',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListManagedNotificationEventsResponse.fromJson(response);
  }

  /// Creates a new <code>NotificationConfiguration</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [description] :
  /// The description of the <code>NotificationConfiguration</code>.
  ///
  /// Parameter [name] :
  /// The name of the <code>NotificationConfiguration</code>. Supports RFC
  /// 3986's unreserved characters.
  ///
  /// Parameter [aggregationDuration] :
  /// The aggregation preference of the <code>NotificationConfiguration</code>.
  ///
  /// <ul>
  /// <li>
  /// Values:
  ///
  /// <ul>
  /// <li>
  /// <code>LONG</code>
  ///
  /// <ul>
  /// <li>
  /// Aggregate notifications for long periods of time (12 hours).
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>SHORT</code>
  ///
  /// <ul>
  /// <li>
  /// Aggregate notifications for short periods of time (5 minutes).
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>NONE</code>
  ///
  /// <ul>
  /// <li>
  /// Don't aggregate notifications.
  /// </li>
  /// </ul> </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// Parameter [tags] :
  /// A map of tags assigned to a resource. A tag is a string-to-string map of
  /// key-value pairs.
  Future<CreateNotificationConfigurationResponse>
      createNotificationConfiguration({
    required String description,
    required String name,
    AggregationDuration? aggregationDuration,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'description': description,
      'name': name,
      if (aggregationDuration != null)
        'aggregationDuration': aggregationDuration.value,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/notification-configurations',
      exceptionFnMap: _exceptionFns,
    );
    return CreateNotificationConfigurationResponse.fromJson(response);
  }

  /// Updates a <code>NotificationConfiguration</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) used to update the
  /// <code>NotificationConfiguration</code>.
  ///
  /// Parameter [aggregationDuration] :
  /// The aggregation preference of the <code>NotificationConfiguration</code>.
  ///
  /// <ul>
  /// <li>
  /// Values:
  ///
  /// <ul>
  /// <li>
  /// <code>LONG</code>
  ///
  /// <ul>
  /// <li>
  /// Aggregate notifications for long periods of time (12 hours).
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>SHORT</code>
  ///
  /// <ul>
  /// <li>
  /// Aggregate notifications for short periods of time (5 minutes).
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>NONE</code>
  ///
  /// <ul>
  /// <li>
  /// Don't aggregate notifications.
  /// </li>
  /// </ul> </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// Parameter [description] :
  /// The description of the <code>NotificationConfiguration</code>.
  ///
  /// Parameter [name] :
  /// The name of the <code>NotificationConfiguration</code>.
  Future<UpdateNotificationConfigurationResponse>
      updateNotificationConfiguration({
    required String arn,
    AggregationDuration? aggregationDuration,
    String? description,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      if (aggregationDuration != null)
        'aggregationDuration': aggregationDuration.value,
      if (description != null) 'description': description,
      if (name != null) 'name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/notification-configurations/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateNotificationConfigurationResponse.fromJson(response);
  }

  /// Returns a specified <code>NotificationConfiguration</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the
  /// <code>NotificationConfiguration</code> to return.
  Future<GetNotificationConfigurationResponse> getNotificationConfiguration({
    required String arn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/notification-configurations/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetNotificationConfigurationResponse.fromJson(response);
  }

  /// Deletes a <code>NotificationConfiguration</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the
  /// <code>NotificationConfiguration</code> to delete.
  Future<void> deleteNotificationConfiguration({
    required String arn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/notification-configurations/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns a list of abbreviated <code>NotificationConfigurations</code>
  /// according to specified filters, in reverse chronological order (newest
  /// first).
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelArn] :
  /// The Amazon Resource Name (ARN) of the Channel to match.
  ///
  /// Parameter [eventRuleSource] :
  /// The matched event source.
  ///
  /// Must match one of the valid EventBridge sources. Only Amazon Web Services
  /// service sourced events are supported. For example, <code>aws.ec2</code>
  /// and <code>aws.cloudwatch</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-service-event.html#eb-service-event-delivery-level">Event
  /// delivery from Amazon Web Services services</a> in the <i>Amazon
  /// EventBridge User Guide</i>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned in this call. Defaults to 20.
  ///
  /// Parameter [nextToken] :
  /// The start token for paginated calls. Retrieved from the response of a
  /// previous <code>ListEventRules</code> call. Next token uses Base64
  /// encoding.
  ///
  /// Parameter [status] :
  /// The <code>NotificationConfiguration</code> status to match.
  ///
  /// <ul>
  /// <li>
  /// Values:
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code>
  ///
  /// <ul>
  /// <li>
  /// All <code>EventRules</code> are <code>ACTIVE</code> and any call can be
  /// run.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>PARTIALLY_ACTIVE</code>
  ///
  /// <ul>
  /// <li>
  /// Some <code>EventRules</code> are <code>ACTIVE</code> and some are
  /// <code>INACTIVE</code>. Any call can be run.
  /// </li>
  /// <li>
  /// Any call can be run.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>INACTIVE</code>
  ///
  /// <ul>
  /// <li>
  /// All <code>EventRules</code> are <code>INACTIVE</code> and any call can be
  /// run.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>DELETING</code>
  ///
  /// <ul>
  /// <li>
  /// This <code>NotificationConfiguration</code> is being deleted.
  /// </li>
  /// <li>
  /// Only <code>GET</code> and <code>LIST</code> calls can be run.
  /// </li>
  /// </ul> </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// Parameter [subtype] :
  /// The subtype used to filter the notification configurations in the request.
  Future<ListNotificationConfigurationsResponse>
      listNotificationConfigurations({
    String? channelArn,
    String? eventRuleSource,
    int? maxResults,
    String? nextToken,
    NotificationConfigurationStatus? status,
    NotificationConfigurationSubtype? subtype,
  }) async {
    final $query = <String, List<String>>{
      if (channelArn != null) 'channelArn': [channelArn],
      if (eventRuleSource != null) 'eventRuleSource': [eventRuleSource],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (status != null) 'status': [status.value],
      if (subtype != null) 'subtype': [subtype.value],
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

  /// Returns a specified <code>NotificationEvent</code>.
  /// <important>
  /// User Notifications stores notifications in the individual Regions you
  /// register as notification hubs and the Region of the source event rule.
  /// <code>GetNotificationEvent</code> only returns notifications stored in the
  /// same Region in which the action is called. User Notifications doesn't
  /// backfill notifications to new Regions selected as notification hubs. For
  /// this reason, we recommend that you make calls in your oldest registered
  /// notification hub. For more information, see <a
  /// href="https://docs.aws.amazon.com/notifications/latest/userguide/notification-hubs.html">Notification
  /// hubs</a> in the <i>Amazon Web Services User Notifications User Guide</i>.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the <code>NotificationEvent</code> to
  /// return.
  ///
  /// Parameter [locale] :
  /// The locale code of the language used for the retrieved
  /// <code>NotificationEvent</code>. The default locale is English
  /// <code>en_US</code>.
  Future<GetNotificationEventResponse> getNotificationEvent({
    required String arn,
    LocaleCode? locale,
  }) async {
    final $query = <String, List<String>>{
      if (locale != null) 'locale': [locale.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/notification-events/${Uri.encodeComponent(arn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetNotificationEventResponse.fromJson(response);
  }

  /// Returns a list of <code>NotificationEvents</code> according to specified
  /// filters, in reverse chronological order (newest first).
  /// <important>
  /// User Notifications stores notifications in the individual Regions you
  /// register as notification hubs and the Region of the source event rule.
  /// ListNotificationEvents only returns notifications stored in the same
  /// Region in which the action is called. User Notifications doesn't backfill
  /// notifications to new Regions selected as notification hubs. For this
  /// reason, we recommend that you make calls in your oldest registered
  /// notification hub. For more information, see <a
  /// href="https://docs.aws.amazon.com/notifications/latest/userguide/notification-hubs.html">Notification
  /// hubs</a> in the <i>Amazon Web Services User Notifications User Guide</i>.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [aggregateNotificationEventArn] :
  /// The Amazon Resource Name (ARN) of the
  /// <code>aggregatedNotificationEventArn</code> to match.
  ///
  /// Parameter [endTime] :
  /// Latest time of events to return from this call.
  ///
  /// Parameter [includeChildEvents] :
  /// Include aggregated child events in the result.
  ///
  /// Parameter [locale] :
  /// The locale code of the language used for the retrieved
  /// <code>NotificationEvent</code>. The default locale is English
  /// <code>(en_US)</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned in this call. Defaults to 20.
  ///
  /// Parameter [nextToken] :
  /// The start token for paginated calls. Retrieved from the response of a
  /// previous <code>ListEventRules</code> call. Next token uses Base64
  /// encoding.
  ///
  /// Parameter [organizationalUnitId] :
  /// The unique identifier of the organizational unit used to filter
  /// notification events.
  ///
  /// Parameter [source] :
  /// The matched event source.
  ///
  /// Must match one of the valid EventBridge sources. Only Amazon Web Services
  /// service sourced events are supported. For example, <code>aws.ec2</code>
  /// and <code>aws.cloudwatch</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-service-event.html#eb-service-event-delivery-level">Event
  /// delivery from Amazon Web Services services</a> in the <i>Amazon
  /// EventBridge User Guide</i>.
  ///
  /// Parameter [startTime] :
  /// The earliest time of events to return from this call.
  Future<ListNotificationEventsResponse> listNotificationEvents({
    String? aggregateNotificationEventArn,
    DateTime? endTime,
    bool? includeChildEvents,
    LocaleCode? locale,
    int? maxResults,
    String? nextToken,
    String? organizationalUnitId,
    String? source,
    DateTime? startTime,
  }) async {
    final $query = <String, List<String>>{
      if (aggregateNotificationEventArn != null)
        'aggregateNotificationEventArn': [aggregateNotificationEventArn],
      if (endTime != null) 'endTime': [_s.iso8601ToJson(endTime).toString()],
      if (includeChildEvents != null)
        'includeChildEvents': [includeChildEvents.toString()],
      if (locale != null) 'locale': [locale.value],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (organizationalUnitId != null)
        'organizationalUnitId': [organizationalUnitId],
      if (source != null) 'source': [source],
      if (startTime != null)
        'startTime': [_s.iso8601ToJson(startTime).toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/notification-events',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListNotificationEventsResponse.fromJson(response);
  }

  /// Registers a <code>NotificationConfiguration</code> in the specified
  /// Region.
  ///
  /// There is a maximum of one <code>NotificationConfiguration</code> per
  /// Region. You can have a maximum of 3 <code>NotificationHub</code> resources
  /// at a time.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [notificationHubRegion] :
  /// The Region of the <code>NotificationHub</code>.
  Future<RegisterNotificationHubResponse> registerNotificationHub({
    required String notificationHubRegion,
  }) async {
    final $payload = <String, dynamic>{
      'notificationHubRegion': notificationHubRegion,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/notification-hubs',
      exceptionFnMap: _exceptionFns,
    );
    return RegisterNotificationHubResponse.fromJson(response);
  }

  /// Deregisters a <code>NotificationConfiguration</code> in the specified
  /// Region.
  /// <note>
  /// You can't deregister the last <code>NotificationHub</code> in the account.
  /// <code>NotificationEvents</code> stored in the deregistered
  /// <code>NotificationConfiguration</code> are no longer be visible.
  /// Recreating a new <code>NotificationConfiguration</code> in the same Region
  /// restores access to those <code>NotificationEvents</code>.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [notificationHubRegion] :
  /// The <code>NotificationConfiguration</code> Region.
  Future<DeregisterNotificationHubResponse> deregisterNotificationHub({
    required String notificationHubRegion,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/notification-hubs/${Uri.encodeComponent(notificationHubRegion)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeregisterNotificationHubResponse.fromJson(response);
  }

  /// Returns a list of <code>NotificationHubs</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of records to list in a single response.
  ///
  /// Parameter [nextToken] :
  /// A pagination token. Set to null to start listing notification hubs from
  /// the start.
  Future<ListNotificationHubsResponse> listNotificationHubs({
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/notification-hubs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListNotificationHubsResponse.fromJson(response);
  }

  /// Enables service trust between User Notifications and Amazon Web Services
  /// Organizations.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<void> enableNotificationsAccessForOrganization() async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/organization/access',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns the AccessStatus of Service Trust Enablement for User
  /// Notifications and Amazon Web Services Organizations.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<GetNotificationsAccessForOrganizationResponse>
      getNotificationsAccessForOrganization() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/organization/access',
      exceptionFnMap: _exceptionFns,
    );
    return GetNotificationsAccessForOrganizationResponse.fromJson(response);
  }

  /// Disables service trust between User Notifications and Amazon Web Services
  /// Organizations.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<void> disableNotificationsAccessForOrganization() async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/organization/access',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Associates an organizational unit with a notification configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [notificationConfigurationArn] :
  /// The Amazon Resource Name (ARN) of the notification configuration to
  /// associate with the organizational unit.
  ///
  /// Parameter [organizationalUnitId] :
  /// The unique identifier of the organizational unit to associate.
  Future<void> associateOrganizationalUnit({
    required String notificationConfigurationArn,
    required String organizationalUnitId,
  }) async {
    final $payload = <String, dynamic>{
      'notificationConfigurationArn': notificationConfigurationArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/organizational-units/associate/${Uri.encodeComponent(organizationalUnitId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes the association between an organizational unit and a notification
  /// configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [notificationConfigurationArn] :
  /// The Amazon Resource Name (ARN) of the notification configuration to
  /// disassociate from the organizational unit.
  ///
  /// Parameter [organizationalUnitId] :
  /// The unique identifier of the organizational unit to disassociate.
  Future<void> disassociateOrganizationalUnit({
    required String notificationConfigurationArn,
    required String organizationalUnitId,
  }) async {
    final $payload = <String, dynamic>{
      'notificationConfigurationArn': notificationConfigurationArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/organizational-units/disassociate/${Uri.encodeComponent(organizationalUnitId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns a list of organizational units associated with a notification
  /// configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [notificationConfigurationArn] :
  /// The Amazon Resource Name (ARN) of the notification configuration used to
  /// filter the organizational units.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of organizational units to return in a single call.
  /// Valid values are 1-100.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results. Use the value returned in the
  /// previous response.
  Future<ListOrganizationalUnitsResponse> listOrganizationalUnits({
    required String notificationConfigurationArn,
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      'notificationConfigurationArn': [notificationConfigurationArn],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/organizational-units',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListOrganizationalUnitsResponse.fromJson(response);
  }
}

class ListManagedNotificationChannelAssociationsResponse {
  /// A list that contains the following information about a channel association.
  final List<ManagedNotificationChannelAssociationSummary> channelAssociations;

  /// A pagination token. If a non-null pagination token is returned in a result,
  /// pass its value in another request to retrieve more entries.
  final String? nextToken;

  ListManagedNotificationChannelAssociationsResponse({
    required this.channelAssociations,
    this.nextToken,
  });

  factory ListManagedNotificationChannelAssociationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListManagedNotificationChannelAssociationsResponse(
      channelAssociations: ((json['channelAssociations'] as List?) ?? const [])
          .nonNulls
          .map((e) => ManagedNotificationChannelAssociationSummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelAssociations = this.channelAssociations;
    final nextToken = this.nextToken;
    return {
      'channelAssociations': channelAssociations,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListMemberAccountsResponse {
  /// The list of member accounts that match the specified criteria.
  final List<MemberAccount> memberAccounts;

  /// The token to use for the next page of results.
  final String? nextToken;

  ListMemberAccountsResponse({
    required this.memberAccounts,
    this.nextToken,
  });

  factory ListMemberAccountsResponse.fromJson(Map<String, dynamic> json) {
    return ListMemberAccountsResponse(
      memberAccounts: ((json['memberAccounts'] as List?) ?? const [])
          .nonNulls
          .map((e) => MemberAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final memberAccounts = this.memberAccounts;
    final nextToken = this.nextToken;
    return {
      'memberAccounts': memberAccounts,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// A list of tags for the specified ARN.
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

class AssociateChannelResponse {
  AssociateChannelResponse();

  factory AssociateChannelResponse.fromJson(Map<String, dynamic> _) {
    return AssociateChannelResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociateChannelResponse {
  DisassociateChannelResponse();

  factory DisassociateChannelResponse.fromJson(Map<String, dynamic> _) {
    return DisassociateChannelResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ListChannelsResponse {
  /// A list of Channels.
  final List<String> channels;

  /// A pagination token. If a non-null pagination token is returned in a result,
  /// pass its value in another request to retrieve more entries.
  final String? nextToken;

  ListChannelsResponse({
    required this.channels,
    this.nextToken,
  });

  factory ListChannelsResponse.fromJson(Map<String, dynamic> json) {
    return ListChannelsResponse(
      channels: ((json['channels'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channels = this.channels;
    final nextToken = this.nextToken;
    return {
      'channels': channels,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class CreateEventRuleResponse {
  /// The ARN of the resource.
  final String arn;

  /// The ARN of a <code>NotificationConfiguration</code>.
  final String notificationConfigurationArn;

  /// A list of an <code>EventRule</code>'s status by Region. Regions are mapped
  /// to <code>EventRuleStatusSummary</code>.
  final Map<String, EventRuleStatusSummary> statusSummaryByRegion;

  CreateEventRuleResponse({
    required this.arn,
    required this.notificationConfigurationArn,
    required this.statusSummaryByRegion,
  });

  factory CreateEventRuleResponse.fromJson(Map<String, dynamic> json) {
    return CreateEventRuleResponse(
      arn: (json['arn'] as String?) ?? '',
      notificationConfigurationArn:
          (json['notificationConfigurationArn'] as String?) ?? '',
      statusSummaryByRegion: ((json['statusSummaryByRegion']
                  as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(
              k, EventRuleStatusSummary.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final notificationConfigurationArn = this.notificationConfigurationArn;
    final statusSummaryByRegion = this.statusSummaryByRegion;
    return {
      'arn': arn,
      'notificationConfigurationArn': notificationConfigurationArn,
      'statusSummaryByRegion': statusSummaryByRegion,
    };
  }
}

class UpdateEventRuleResponse {
  /// The Amazon Resource Name (ARN) to use to update the <code>EventRule</code>.
  final String arn;

  /// The ARN of the <code>NotificationConfiguration</code>.
  final String notificationConfigurationArn;

  /// The status of the action by Region.
  final Map<String, EventRuleStatusSummary> statusSummaryByRegion;

  UpdateEventRuleResponse({
    required this.arn,
    required this.notificationConfigurationArn,
    required this.statusSummaryByRegion,
  });

  factory UpdateEventRuleResponse.fromJson(Map<String, dynamic> json) {
    return UpdateEventRuleResponse(
      arn: (json['arn'] as String?) ?? '',
      notificationConfigurationArn:
          (json['notificationConfigurationArn'] as String?) ?? '',
      statusSummaryByRegion: ((json['statusSummaryByRegion']
                  as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(
              k, EventRuleStatusSummary.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final notificationConfigurationArn = this.notificationConfigurationArn;
    final statusSummaryByRegion = this.statusSummaryByRegion;
    return {
      'arn': arn,
      'notificationConfigurationArn': notificationConfigurationArn,
      'statusSummaryByRegion': statusSummaryByRegion,
    };
  }
}

class GetEventRuleResponse {
  /// The ARN of the resource.
  final String arn;

  /// The date when the <code>EventRule</code> was created.
  final DateTime creationTime;

  /// An additional event pattern used to further filter the events this
  /// <code>EventRule</code> receives.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-event-patterns.html">Amazon
  /// EventBridge event patterns</a> in the <i>Amazon EventBridge User Guide.</i>
  final String eventPattern;

  /// The event type to match.
  ///
  /// Must match one of the valid Amazon EventBridge event types. For example, EC2
  /// Instance State-change Notification and Amazon CloudWatch Alarm State Change.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-service-event.html#eb-service-event-delivery-level">Event
  /// delivery from Amazon Web Services services</a> in the <i>Amazon EventBridge
  /// User Guide</i>.
  final String eventType;

  /// A list of managed rules from EventBridge that are associated with this
  /// <code>EventRule</code>.
  /// <note>
  /// These are created by User Notifications within your account so this
  /// <code>EventRule</code> functions.
  /// </note>
  final List<String> managedRules;

  /// The ARN of a <code>NotificationConfiguration</code>.
  final String notificationConfigurationArn;

  /// A list of Amazon Web Services Regions that send events to this
  /// <code>EventRule</code>.
  final List<String> regions;

  /// The matched event source.
  ///
  /// Must match one of the valid EventBridge sources. Only Amazon Web Services
  /// service sourced events are supported. For example, <code>aws.ec2</code> and
  /// <code>aws.cloudwatch</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-service-event.html#eb-service-event-delivery-level">Event
  /// delivery from Amazon Web Services services</a> in the <i>Amazon EventBridge
  /// User Guide</i>.
  final String source;

  /// A list of an <code>EventRule</code>'s status by Region. Regions are mapped
  /// to <code>EventRuleStatusSummary</code>.
  final Map<String, EventRuleStatusSummary> statusSummaryByRegion;

  GetEventRuleResponse({
    required this.arn,
    required this.creationTime,
    required this.eventPattern,
    required this.eventType,
    required this.managedRules,
    required this.notificationConfigurationArn,
    required this.regions,
    required this.source,
    required this.statusSummaryByRegion,
  });

  factory GetEventRuleResponse.fromJson(Map<String, dynamic> json) {
    return GetEventRuleResponse(
      arn: (json['arn'] as String?) ?? '',
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      eventPattern: (json['eventPattern'] as String?) ?? '',
      eventType: (json['eventType'] as String?) ?? '',
      managedRules: ((json['managedRules'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      notificationConfigurationArn:
          (json['notificationConfigurationArn'] as String?) ?? '',
      regions: ((json['regions'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      source: (json['source'] as String?) ?? '',
      statusSummaryByRegion: ((json['statusSummaryByRegion']
                  as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(
              k, EventRuleStatusSummary.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final eventPattern = this.eventPattern;
    final eventType = this.eventType;
    final managedRules = this.managedRules;
    final notificationConfigurationArn = this.notificationConfigurationArn;
    final regions = this.regions;
    final source = this.source;
    final statusSummaryByRegion = this.statusSummaryByRegion;
    return {
      'arn': arn,
      'creationTime': iso8601ToJson(creationTime),
      'eventPattern': eventPattern,
      'eventType': eventType,
      'managedRules': managedRules,
      'notificationConfigurationArn': notificationConfigurationArn,
      'regions': regions,
      'source': source,
      'statusSummaryByRegion': statusSummaryByRegion,
    };
  }
}

class DeleteEventRuleResponse {
  DeleteEventRuleResponse();

  factory DeleteEventRuleResponse.fromJson(Map<String, dynamic> _) {
    return DeleteEventRuleResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ListEventRulesResponse {
  /// A list of <code>EventRules</code>.
  final List<EventRuleStructure> eventRules;

  /// A pagination token. If a non-null pagination token is returned in a result,
  /// pass its value in another request to retrieve more entries.
  final String? nextToken;

  ListEventRulesResponse({
    required this.eventRules,
    this.nextToken,
  });

  factory ListEventRulesResponse.fromJson(Map<String, dynamic> json) {
    return ListEventRulesResponse(
      eventRules: ((json['eventRules'] as List?) ?? const [])
          .nonNulls
          .map((e) => EventRuleStructure.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventRules = this.eventRules;
    final nextToken = this.nextToken;
    return {
      'eventRules': eventRules,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class AssociateManagedNotificationAccountContactResponse {
  AssociateManagedNotificationAccountContactResponse();

  factory AssociateManagedNotificationAccountContactResponse.fromJson(
      Map<String, dynamic> _) {
    return AssociateManagedNotificationAccountContactResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociateManagedNotificationAccountContactResponse {
  DisassociateManagedNotificationAccountContactResponse();

  factory DisassociateManagedNotificationAccountContactResponse.fromJson(
      Map<String, dynamic> _) {
    return DisassociateManagedNotificationAccountContactResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class AssociateManagedNotificationAdditionalChannelResponse {
  AssociateManagedNotificationAdditionalChannelResponse();

  factory AssociateManagedNotificationAdditionalChannelResponse.fromJson(
      Map<String, dynamic> _) {
    return AssociateManagedNotificationAdditionalChannelResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociateManagedNotificationAdditionalChannelResponse {
  DisassociateManagedNotificationAdditionalChannelResponse();

  factory DisassociateManagedNotificationAdditionalChannelResponse.fromJson(
      Map<String, dynamic> _) {
    return DisassociateManagedNotificationAdditionalChannelResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class GetManagedNotificationChildEventResponse {
  /// The ARN of the resource.
  final String arn;

  /// The content of the <code>ManagedNotificationChildEvent</code>.
  final ManagedNotificationChildEvent content;

  /// The creation time of the <code>ManagedNotificationChildEvent</code>.
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the
  /// <code>ManagedNotificationConfiguration</code> associated with the
  /// <code>ManagedNotificationChildEvent</code>.
  final String managedNotificationConfigurationArn;

  GetManagedNotificationChildEventResponse({
    required this.arn,
    required this.content,
    required this.creationTime,
    required this.managedNotificationConfigurationArn,
  });

  factory GetManagedNotificationChildEventResponse.fromJson(
      Map<String, dynamic> json) {
    return GetManagedNotificationChildEventResponse(
      arn: (json['arn'] as String?) ?? '',
      content: ManagedNotificationChildEvent.fromJson(
          (json['content'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      managedNotificationConfigurationArn:
          (json['managedNotificationConfigurationArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final content = this.content;
    final creationTime = this.creationTime;
    final managedNotificationConfigurationArn =
        this.managedNotificationConfigurationArn;
    return {
      'arn': arn,
      'content': content,
      'creationTime': iso8601ToJson(creationTime),
      'managedNotificationConfigurationArn':
          managedNotificationConfigurationArn,
    };
  }
}

class ListManagedNotificationChildEventsResponse {
  /// A pagination token. If a non-null pagination token is returned in a result,
  /// pass its value in another request to retrieve more entries.
  final List<ManagedNotificationChildEventOverview>
      managedNotificationChildEvents;

  /// A pagination token. If a non-null pagination token is returned in a result,
  /// pass its value in another request to retrieve more entries.
  final String? nextToken;

  ListManagedNotificationChildEventsResponse({
    required this.managedNotificationChildEvents,
    this.nextToken,
  });

  factory ListManagedNotificationChildEventsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListManagedNotificationChildEventsResponse(
      managedNotificationChildEvents:
          ((json['managedNotificationChildEvents'] as List?) ?? const [])
              .nonNulls
              .map((e) => ManagedNotificationChildEventOverview.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final managedNotificationChildEvents = this.managedNotificationChildEvents;
    final nextToken = this.nextToken;
    return {
      'managedNotificationChildEvents': managedNotificationChildEvents,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class GetManagedNotificationConfigurationResponse {
  /// The ARN of the <code>ManagedNotificationConfiguration</code> resource.
  final String arn;

  /// The category of the <code>ManagedNotificationConfiguration</code>.
  final String category;

  /// The description of the <code>ManagedNotificationConfiguration</code>.
  final String description;

  /// The name of the <code>ManagedNotificationConfiguration</code>.
  final String name;

  /// The subCategory of the <code>ManagedNotificationConfiguration</code>.
  final String subCategory;

  GetManagedNotificationConfigurationResponse({
    required this.arn,
    required this.category,
    required this.description,
    required this.name,
    required this.subCategory,
  });

  factory GetManagedNotificationConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetManagedNotificationConfigurationResponse(
      arn: (json['arn'] as String?) ?? '',
      category: (json['category'] as String?) ?? '',
      description: (json['description'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      subCategory: (json['subCategory'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final category = this.category;
    final description = this.description;
    final name = this.name;
    final subCategory = this.subCategory;
    return {
      'arn': arn,
      'category': category,
      'description': description,
      'name': name,
      'subCategory': subCategory,
    };
  }
}

class ListManagedNotificationConfigurationsResponse {
  /// A list of Managed Notification Configurations matching the request criteria.
  final List<ManagedNotificationConfigurationStructure>
      managedNotificationConfigurations;

  /// A pagination token. If a non-null pagination token is returned in a result,
  /// pass its value in another request to retrieve more entries.
  final String? nextToken;

  ListManagedNotificationConfigurationsResponse({
    required this.managedNotificationConfigurations,
    this.nextToken,
  });

  factory ListManagedNotificationConfigurationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListManagedNotificationConfigurationsResponse(
      managedNotificationConfigurations:
          ((json['managedNotificationConfigurations'] as List?) ?? const [])
              .nonNulls
              .map((e) => ManagedNotificationConfigurationStructure.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final managedNotificationConfigurations =
        this.managedNotificationConfigurations;
    final nextToken = this.nextToken;
    return {
      'managedNotificationConfigurations': managedNotificationConfigurations,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class GetManagedNotificationEventResponse {
  /// The ARN of the resource.
  final String arn;

  /// The content of the <code>ManagedNotificationEvent</code>.
  final ManagedNotificationEvent content;

  /// The creation time of the <code>ManagedNotificationEvent</code>.
  final DateTime creationTime;

  /// The ARN of the <code>ManagedNotificationConfiguration</code>.
  final String managedNotificationConfigurationArn;

  GetManagedNotificationEventResponse({
    required this.arn,
    required this.content,
    required this.creationTime,
    required this.managedNotificationConfigurationArn,
  });

  factory GetManagedNotificationEventResponse.fromJson(
      Map<String, dynamic> json) {
    return GetManagedNotificationEventResponse(
      arn: (json['arn'] as String?) ?? '',
      content: ManagedNotificationEvent.fromJson(
          (json['content'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      managedNotificationConfigurationArn:
          (json['managedNotificationConfigurationArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final content = this.content;
    final creationTime = this.creationTime;
    final managedNotificationConfigurationArn =
        this.managedNotificationConfigurationArn;
    return {
      'arn': arn,
      'content': content,
      'creationTime': iso8601ToJson(creationTime),
      'managedNotificationConfigurationArn':
          managedNotificationConfigurationArn,
    };
  }
}

class ListManagedNotificationEventsResponse {
  /// A list of Managed Notification Events matching the request criteria.
  final List<ManagedNotificationEventOverview> managedNotificationEvents;

  /// A pagination token. If a non-null pagination token is returned in a result,
  /// pass its value in another request to retrieve more entries.
  final String? nextToken;

  ListManagedNotificationEventsResponse({
    required this.managedNotificationEvents,
    this.nextToken,
  });

  factory ListManagedNotificationEventsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListManagedNotificationEventsResponse(
      managedNotificationEvents:
          ((json['managedNotificationEvents'] as List?) ?? const [])
              .nonNulls
              .map((e) => ManagedNotificationEventOverview.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final managedNotificationEvents = this.managedNotificationEvents;
    final nextToken = this.nextToken;
    return {
      'managedNotificationEvents': managedNotificationEvents,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class CreateNotificationConfigurationResponse {
  /// The Amazon Resource Name (ARN) of the
  /// <code>NotificationConfiguration</code>.
  final String arn;

  /// The current status of this <code>NotificationConfiguration</code>.
  final NotificationConfigurationStatus status;

  CreateNotificationConfigurationResponse({
    required this.arn,
    required this.status,
  });

  factory CreateNotificationConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateNotificationConfigurationResponse(
      arn: (json['arn'] as String?) ?? '',
      status: NotificationConfigurationStatus.fromString(
          (json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final status = this.status;
    return {
      'arn': arn,
      'status': status.value,
    };
  }
}

class UpdateNotificationConfigurationResponse {
  /// The ARN used to update the <code>NotificationConfiguration</code>.
  final String arn;

  UpdateNotificationConfigurationResponse({
    required this.arn,
  });

  factory UpdateNotificationConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateNotificationConfigurationResponse(
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

class GetNotificationConfigurationResponse {
  /// The ARN of the resource.
  final String arn;

  /// The creation time of the <code>NotificationConfiguration</code>.
  final DateTime creationTime;

  /// The description of the <code>NotificationConfiguration</code>.
  final String description;

  /// The name of the <code>NotificationConfiguration</code>.
  final String name;

  /// The status of this <code>NotificationConfiguration</code>.
  final NotificationConfigurationStatus status;

  /// The aggregation preference of the <code>NotificationConfiguration</code>.
  ///
  /// <ul>
  /// <li>
  /// Values:
  ///
  /// <ul>
  /// <li>
  /// <code>LONG</code>
  ///
  /// <ul>
  /// <li>
  /// Aggregate notifications for long periods of time (12 hours).
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>SHORT</code>
  ///
  /// <ul>
  /// <li>
  /// Aggregate notifications for short periods of time (5 minutes).
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>NONE</code>
  ///
  /// <ul>
  /// <li>
  /// Don't aggregate notifications.
  /// </li>
  /// </ul> </li>
  /// </ul> </li>
  /// </ul>
  final AggregationDuration? aggregationDuration;

  /// The subtype of the notification configuration returned in the response.
  final NotificationConfigurationSubtype? subtype;

  GetNotificationConfigurationResponse({
    required this.arn,
    required this.creationTime,
    required this.description,
    required this.name,
    required this.status,
    this.aggregationDuration,
    this.subtype,
  });

  factory GetNotificationConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetNotificationConfigurationResponse(
      arn: (json['arn'] as String?) ?? '',
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      description: (json['description'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      status: NotificationConfigurationStatus.fromString(
          (json['status'] as String?) ?? ''),
      aggregationDuration: (json['aggregationDuration'] as String?)
          ?.let(AggregationDuration.fromString),
      subtype: (json['subtype'] as String?)
          ?.let(NotificationConfigurationSubtype.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final description = this.description;
    final name = this.name;
    final status = this.status;
    final aggregationDuration = this.aggregationDuration;
    final subtype = this.subtype;
    return {
      'arn': arn,
      'creationTime': iso8601ToJson(creationTime),
      'description': description,
      'name': name,
      'status': status.value,
      if (aggregationDuration != null)
        'aggregationDuration': aggregationDuration.value,
      if (subtype != null) 'subtype': subtype.value,
    };
  }
}

class DeleteNotificationConfigurationResponse {
  DeleteNotificationConfigurationResponse();

  factory DeleteNotificationConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteNotificationConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ListNotificationConfigurationsResponse {
  /// The <code>NotificationConfigurations</code> in the account.
  final List<NotificationConfigurationStructure> notificationConfigurations;

  /// A pagination token. If a non-null pagination token is returned in a result,
  /// pass its value in another request to retrieve more entries.
  final String? nextToken;

  ListNotificationConfigurationsResponse({
    required this.notificationConfigurations,
    this.nextToken,
  });

  factory ListNotificationConfigurationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListNotificationConfigurationsResponse(
      notificationConfigurations:
          ((json['notificationConfigurations'] as List?) ?? const [])
              .nonNulls
              .map((e) => NotificationConfigurationStructure.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final notificationConfigurations = this.notificationConfigurations;
    final nextToken = this.nextToken;
    return {
      'notificationConfigurations': notificationConfigurations,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class GetNotificationEventResponse {
  /// The ARN of the resource.
  final String arn;

  /// The content of the <code>NotificationEvent</code>.
  final NotificationEventSchema content;

  /// The creation time of the <code>NotificationEvent</code>.
  final DateTime creationTime;

  /// The ARN of the <code>NotificationConfiguration</code>.
  final String notificationConfigurationArn;

  GetNotificationEventResponse({
    required this.arn,
    required this.content,
    required this.creationTime,
    required this.notificationConfigurationArn,
  });

  factory GetNotificationEventResponse.fromJson(Map<String, dynamic> json) {
    return GetNotificationEventResponse(
      arn: (json['arn'] as String?) ?? '',
      content: NotificationEventSchema.fromJson(
          (json['content'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      notificationConfigurationArn:
          (json['notificationConfigurationArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final content = this.content;
    final creationTime = this.creationTime;
    final notificationConfigurationArn = this.notificationConfigurationArn;
    return {
      'arn': arn,
      'content': content,
      'creationTime': iso8601ToJson(creationTime),
      'notificationConfigurationArn': notificationConfigurationArn,
    };
  }
}

class ListNotificationEventsResponse {
  /// The list of notification events.
  final List<NotificationEventOverview> notificationEvents;

  /// A pagination token. If a non-null pagination token is returned in a result,
  /// pass its value in another request to retrieve more entries.
  final String? nextToken;

  ListNotificationEventsResponse({
    required this.notificationEvents,
    this.nextToken,
  });

  factory ListNotificationEventsResponse.fromJson(Map<String, dynamic> json) {
    return ListNotificationEventsResponse(
      notificationEvents: ((json['notificationEvents'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              NotificationEventOverview.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final notificationEvents = this.notificationEvents;
    final nextToken = this.nextToken;
    return {
      'notificationEvents': notificationEvents,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class RegisterNotificationHubResponse {
  /// The date the resource was created.
  final DateTime creationTime;

  /// The Region of the <code>NotificationHub</code>.
  final String notificationHubRegion;

  /// Provides additional information about the current
  /// <code>NotificationConfiguration</code> status information.
  final NotificationHubStatusSummary statusSummary;

  /// The date the resource was last activated.
  final DateTime? lastActivationTime;

  RegisterNotificationHubResponse({
    required this.creationTime,
    required this.notificationHubRegion,
    required this.statusSummary,
    this.lastActivationTime,
  });

  factory RegisterNotificationHubResponse.fromJson(Map<String, dynamic> json) {
    return RegisterNotificationHubResponse(
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      notificationHubRegion: (json['notificationHubRegion'] as String?) ?? '',
      statusSummary: NotificationHubStatusSummary.fromJson(
          (json['statusSummary'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      lastActivationTime: timeStampFromJson(json['lastActivationTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final notificationHubRegion = this.notificationHubRegion;
    final statusSummary = this.statusSummary;
    final lastActivationTime = this.lastActivationTime;
    return {
      'creationTime': iso8601ToJson(creationTime),
      'notificationHubRegion': notificationHubRegion,
      'statusSummary': statusSummary,
      if (lastActivationTime != null)
        'lastActivationTime': iso8601ToJson(lastActivationTime),
    };
  }
}

class DeregisterNotificationHubResponse {
  /// The <code>NotificationConfiguration</code> Region.
  final String notificationHubRegion;

  /// <code>NotificationConfiguration</code> status information.
  final NotificationHubStatusSummary statusSummary;

  DeregisterNotificationHubResponse({
    required this.notificationHubRegion,
    required this.statusSummary,
  });

  factory DeregisterNotificationHubResponse.fromJson(
      Map<String, dynamic> json) {
    return DeregisterNotificationHubResponse(
      notificationHubRegion: (json['notificationHubRegion'] as String?) ?? '',
      statusSummary: NotificationHubStatusSummary.fromJson(
          (json['statusSummary'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final notificationHubRegion = this.notificationHubRegion;
    final statusSummary = this.statusSummary;
    return {
      'notificationHubRegion': notificationHubRegion,
      'statusSummary': statusSummary,
    };
  }
}

class ListNotificationHubsResponse {
  /// The <code>NotificationHubs</code> in the account.
  final List<NotificationHubOverview> notificationHubs;

  /// A pagination token. If a non-null pagination token is returned in a result,
  /// pass its value in another request to retrieve more entries.
  final String? nextToken;

  ListNotificationHubsResponse({
    required this.notificationHubs,
    this.nextToken,
  });

  factory ListNotificationHubsResponse.fromJson(Map<String, dynamic> json) {
    return ListNotificationHubsResponse(
      notificationHubs: ((json['notificationHubs'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              NotificationHubOverview.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final notificationHubs = this.notificationHubs;
    final nextToken = this.nextToken;
    return {
      'notificationHubs': notificationHubs,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class EnableNotificationsAccessForOrganizationResponse {
  EnableNotificationsAccessForOrganizationResponse();

  factory EnableNotificationsAccessForOrganizationResponse.fromJson(
      Map<String, dynamic> _) {
    return EnableNotificationsAccessForOrganizationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class GetNotificationsAccessForOrganizationResponse {
  /// The <code>AccessStatus</code> of Service Trust Enablement for User
  /// Notifications to Amazon Web Services Organizations.
  final NotificationsAccessForOrganization notificationsAccessForOrganization;

  GetNotificationsAccessForOrganizationResponse({
    required this.notificationsAccessForOrganization,
  });

  factory GetNotificationsAccessForOrganizationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetNotificationsAccessForOrganizationResponse(
      notificationsAccessForOrganization:
          NotificationsAccessForOrganization.fromJson(
              (json['notificationsAccessForOrganization']
                      as Map<String, dynamic>?) ??
                  const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final notificationsAccessForOrganization =
        this.notificationsAccessForOrganization;
    return {
      'notificationsAccessForOrganization': notificationsAccessForOrganization,
    };
  }
}

class DisableNotificationsAccessForOrganizationResponse {
  DisableNotificationsAccessForOrganizationResponse();

  factory DisableNotificationsAccessForOrganizationResponse.fromJson(
      Map<String, dynamic> _) {
    return DisableNotificationsAccessForOrganizationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class AssociateOrganizationalUnitResponse {
  AssociateOrganizationalUnitResponse();

  factory AssociateOrganizationalUnitResponse.fromJson(Map<String, dynamic> _) {
    return AssociateOrganizationalUnitResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociateOrganizationalUnitResponse {
  DisassociateOrganizationalUnitResponse();

  factory DisassociateOrganizationalUnitResponse.fromJson(
      Map<String, dynamic> _) {
    return DisassociateOrganizationalUnitResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ListOrganizationalUnitsResponse {
  /// The list of organizational units that match the specified criteria.
  final List<String> organizationalUnits;

  /// The token to use for the next page of results. If there are no additional
  /// results, this value is null.
  final String? nextToken;

  ListOrganizationalUnitsResponse({
    required this.organizationalUnits,
    this.nextToken,
  });

  factory ListOrganizationalUnitsResponse.fromJson(Map<String, dynamic> json) {
    return ListOrganizationalUnitsResponse(
      organizationalUnits: ((json['organizationalUnits'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final organizationalUnits = this.organizationalUnits;
    final nextToken = this.nextToken;
    return {
      'organizationalUnits': organizationalUnits,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Orgs Service trust for User Notifications.
class NotificationsAccessForOrganization {
  /// Access Status for the Orgs Service.
  final AccessStatus accessStatus;

  NotificationsAccessForOrganization({
    required this.accessStatus,
  });

  factory NotificationsAccessForOrganization.fromJson(
      Map<String, dynamic> json) {
    return NotificationsAccessForOrganization(
      accessStatus:
          AccessStatus.fromString((json['accessStatus'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final accessStatus = this.accessStatus;
    return {
      'accessStatus': accessStatus.value,
    };
  }
}

class AccessStatus {
  static const enabled = AccessStatus._('ENABLED');
  static const disabled = AccessStatus._('DISABLED');
  static const pending = AccessStatus._('PENDING');
  static const failed = AccessStatus._('FAILED');

  final String value;

  const AccessStatus._(this.value);

  static const values = [enabled, disabled, pending, failed];

  static AccessStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => AccessStatus._(value));

  @override
  bool operator ==(other) => other is AccessStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes an overview of a <code>NotificationHub</code>.
///
/// A <code>NotificationConfiguration</code> is an account-level setting used to
/// select the Regions where you want to store, process and replicate your
/// notifications.
class NotificationHubOverview {
  /// The date and time the <code>NotificationHubOverview</code> was created.
  final DateTime creationTime;

  /// The Region of the resource.
  final String notificationHubRegion;

  /// The status summary of the resource.
  final NotificationHubStatusSummary statusSummary;

  /// The most recent time this <code>NotificationHub</code> had an
  /// <code>ACTIVE</code> status.
  final DateTime? lastActivationTime;

  NotificationHubOverview({
    required this.creationTime,
    required this.notificationHubRegion,
    required this.statusSummary,
    this.lastActivationTime,
  });

  factory NotificationHubOverview.fromJson(Map<String, dynamic> json) {
    return NotificationHubOverview(
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      notificationHubRegion: (json['notificationHubRegion'] as String?) ?? '',
      statusSummary: NotificationHubStatusSummary.fromJson(
          (json['statusSummary'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      lastActivationTime: timeStampFromJson(json['lastActivationTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final notificationHubRegion = this.notificationHubRegion;
    final statusSummary = this.statusSummary;
    final lastActivationTime = this.lastActivationTime;
    return {
      'creationTime': iso8601ToJson(creationTime),
      'notificationHubRegion': notificationHubRegion,
      'statusSummary': statusSummary,
      if (lastActivationTime != null)
        'lastActivationTime': iso8601ToJson(lastActivationTime),
    };
  }
}

/// Provides additional information about the current
/// <code>NotificationHub</code> status.
class NotificationHubStatusSummary {
  /// An explanation for the current status.
  final String reason;

  /// Status information about the <code>NotificationHub</code>.
  ///
  /// <ul>
  /// <li>
  /// Values:
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code>
  ///
  /// <ul>
  /// <li>
  /// Incoming <code>NotificationEvents</code> are replicated to this
  /// <code>NotificationHub</code>.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>REGISTERING</code>
  ///
  /// <ul>
  /// <li>
  /// The <code>NotificationConfiguration</code> is initializing. A
  /// <code>NotificationConfiguration</code> with this status can't be
  /// deregistered.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>DEREGISTERING</code>
  ///
  /// <ul>
  /// <li>
  /// The <code>NotificationConfiguration</code> is being deleted. You can't
  /// register additional <code>NotificationHubs</code> in the same Region as a
  /// <code>NotificationConfiguration</code> with this status.
  /// </li>
  /// </ul> </li>
  /// </ul> </li>
  /// </ul>
  final NotificationHubStatus status;

  NotificationHubStatusSummary({
    required this.reason,
    required this.status,
  });

  factory NotificationHubStatusSummary.fromJson(Map<String, dynamic> json) {
    return NotificationHubStatusSummary(
      reason: (json['reason'] as String?) ?? '',
      status:
          NotificationHubStatus.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final reason = this.reason;
    final status = this.status;
    return {
      'reason': reason,
      'status': status.value,
    };
  }
}

class NotificationHubStatus {
  static const active = NotificationHubStatus._('ACTIVE');
  static const registering = NotificationHubStatus._('REGISTERING');
  static const deregistering = NotificationHubStatus._('DEREGISTERING');
  static const inactive = NotificationHubStatus._('INACTIVE');

  final String value;

  const NotificationHubStatus._(this.value);

  static const values = [active, registering, deregistering, inactive];

  static NotificationHubStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => NotificationHubStatus._(value));

  @override
  bool operator ==(other) =>
      other is NotificationHubStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes a short summary of a <code>NotificationEvent</code>. This is only
/// used when listing notification events.
class NotificationEventOverview {
  /// The Amazon Resource Name (ARN) of the resource.
  final String arn;

  /// The creation time of the <code>NotificationEvent</code>.
  final DateTime creationTime;

  /// The ARN of the <code>NotificationConfiguration</code>.
  final String notificationConfigurationArn;

  /// Refers to a <code>NotificationEventSummary</code> object.
  ///
  /// Similar in structure to <code>content</code> in the
  /// <code>GetNotificationEvent</code> response.
  final NotificationEventSummary notificationEvent;

  /// The account name containing the <code>NotificationHub</code>.
  final String relatedAccount;

  /// The ARN of the <code>aggregatedNotificationEventArn</code> to match.
  final String? aggregateNotificationEventArn;

  /// The <code>NotificationConfiguration</code>'s aggregation type.
  ///
  /// <ul>
  /// <li>
  /// Values:
  ///
  /// <ul>
  /// <li>
  /// <code>AGGREGATE</code>
  ///
  /// <ul>
  /// <li>
  /// The notification event is an aggregate notification. Aggregate notifications
  /// summarize grouped events over a specified time period.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>CHILD</code>
  ///
  /// <ul>
  /// <li>
  /// Some <code>EventRules</code> are <code>ACTIVE</code> and some are
  /// <code>INACTIVE</code>. Any call can be run.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>NONE</code>
  ///
  /// <ul>
  /// <li>
  /// The notification isn't aggregated.
  /// </li>
  /// </ul> </li>
  /// </ul> </li>
  /// </ul>
  final AggregationEventType? aggregationEventType;

  /// Provides an aggregated summary data for notification events.
  final AggregationSummary? aggregationSummary;

  /// The unique identifier of the organizational unit in the notification event
  /// overview.
  final String? organizationalUnitId;

  NotificationEventOverview({
    required this.arn,
    required this.creationTime,
    required this.notificationConfigurationArn,
    required this.notificationEvent,
    required this.relatedAccount,
    this.aggregateNotificationEventArn,
    this.aggregationEventType,
    this.aggregationSummary,
    this.organizationalUnitId,
  });

  factory NotificationEventOverview.fromJson(Map<String, dynamic> json) {
    return NotificationEventOverview(
      arn: (json['arn'] as String?) ?? '',
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      notificationConfigurationArn:
          (json['notificationConfigurationArn'] as String?) ?? '',
      notificationEvent: NotificationEventSummary.fromJson(
          (json['notificationEvent'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      relatedAccount: (json['relatedAccount'] as String?) ?? '',
      aggregateNotificationEventArn:
          json['aggregateNotificationEventArn'] as String?,
      aggregationEventType: (json['aggregationEventType'] as String?)
          ?.let(AggregationEventType.fromString),
      aggregationSummary: json['aggregationSummary'] != null
          ? AggregationSummary.fromJson(
              json['aggregationSummary'] as Map<String, dynamic>)
          : null,
      organizationalUnitId: json['organizationalUnitId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final notificationConfigurationArn = this.notificationConfigurationArn;
    final notificationEvent = this.notificationEvent;
    final relatedAccount = this.relatedAccount;
    final aggregateNotificationEventArn = this.aggregateNotificationEventArn;
    final aggregationEventType = this.aggregationEventType;
    final aggregationSummary = this.aggregationSummary;
    final organizationalUnitId = this.organizationalUnitId;
    return {
      'arn': arn,
      'creationTime': iso8601ToJson(creationTime),
      'notificationConfigurationArn': notificationConfigurationArn,
      'notificationEvent': notificationEvent,
      'relatedAccount': relatedAccount,
      if (aggregateNotificationEventArn != null)
        'aggregateNotificationEventArn': aggregateNotificationEventArn,
      if (aggregationEventType != null)
        'aggregationEventType': aggregationEventType.value,
      if (aggregationSummary != null) 'aggregationSummary': aggregationSummary,
      if (organizationalUnitId != null)
        'organizationalUnitId': organizationalUnitId,
    };
  }
}

/// Describes a short summary and metadata for a <code>NotificationEvent</code>.
class NotificationEventSummary {
  /// Provides additional information about the current status of the
  /// <code>NotificationEvent</code>.
  ///
  /// <ul>
  /// <li>
  /// Values:
  ///
  /// <ul>
  /// <li>
  /// <code>HEALTHY</code>
  ///
  /// <ul>
  /// <li>
  /// All <code>EventRules</code> are <code>ACTIVE</code>.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>UNHEALTHY</code>
  ///
  /// <ul>
  /// <li>
  /// Some <code>EventRules</code> are <code>ACTIVE</code> and some are
  /// <code>INACTIVE</code>.
  /// </li>
  /// </ul> </li>
  /// </ul> </li>
  /// </ul>
  final EventStatus eventStatus;

  /// The message components of a notification event.
  final MessageComponentsSummary messageComponents;

  /// The type of event causing the notification.
  ///
  /// <ul>
  /// <li>
  /// Values:
  ///
  /// <ul>
  /// <li>
  /// <code>ALERT</code>
  ///
  /// <ul>
  /// <li>
  /// A notification about an event where something was triggered, initiated,
  /// reopened, deployed, or a threshold was breached.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>WARNING</code>
  ///
  /// <ul>
  /// <li>
  /// A notification about an event where an issue is about to arise. For example,
  /// something is approaching a threshold.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>ANNOUNCEMENT</code>
  ///
  /// <ul>
  /// <li>
  /// A notification about an important event. For example, a step in a workflow
  /// or escalation path or that a workflow was updated.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>INFORMATIONAL</code>
  ///
  /// <ul>
  /// <li>
  /// A notification about informational messages. For example, recommendations,
  /// service announcements, or reminders.
  /// </li>
  /// </ul> </li>
  /// </ul> </li>
  /// </ul>
  final NotificationType notificationType;

  /// The schema version of the Notification Event.
  final SchemaVersion schemaVersion;

  /// The source event metadata.
  final SourceEventMetadataSummary sourceEventMetadata;

  NotificationEventSummary({
    required this.eventStatus,
    required this.messageComponents,
    required this.notificationType,
    required this.schemaVersion,
    required this.sourceEventMetadata,
  });

  factory NotificationEventSummary.fromJson(Map<String, dynamic> json) {
    return NotificationEventSummary(
      eventStatus:
          EventStatus.fromString((json['eventStatus'] as String?) ?? ''),
      messageComponents: MessageComponentsSummary.fromJson(
          (json['messageComponents'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      notificationType: NotificationType.fromString(
          (json['notificationType'] as String?) ?? ''),
      schemaVersion:
          SchemaVersion.fromString((json['schemaVersion'] as String?) ?? ''),
      sourceEventMetadata: SourceEventMetadataSummary.fromJson(
          (json['sourceEventMetadata'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final eventStatus = this.eventStatus;
    final messageComponents = this.messageComponents;
    final notificationType = this.notificationType;
    final schemaVersion = this.schemaVersion;
    final sourceEventMetadata = this.sourceEventMetadata;
    return {
      'eventStatus': eventStatus.value,
      'messageComponents': messageComponents,
      'notificationType': notificationType.value,
      'schemaVersion': schemaVersion.value,
      'sourceEventMetadata': sourceEventMetadata,
    };
  }
}

class AggregationEventType {
  static const aggregate = AggregationEventType._('AGGREGATE');
  static const child = AggregationEventType._('CHILD');
  static const none = AggregationEventType._('NONE');

  final String value;

  const AggregationEventType._(this.value);

  static const values = [aggregate, child, none];

  static AggregationEventType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AggregationEventType._(value));

  @override
  bool operator ==(other) =>
      other is AggregationEventType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Provides additional information about the aggregation key.
class AggregationSummary {
  /// Indicates the Amazon Web Services accounts in the aggregation key.
  final SummarizationDimensionOverview aggregatedAccounts;

  /// Indicates the criteria or rules by which notifications have been grouped
  /// together.
  final List<AggregationKey> aggregatedBy;

  /// Indicates the Amazon Web Services Regions in the aggregation key.
  final SummarizationDimensionOverview aggregatedRegions;

  /// Indicates the number of events associated with the aggregation key.
  final int eventCount;

  /// List of additional dimensions used to group and summarize data.
  final List<SummarizationDimensionOverview>? additionalSummarizationDimensions;

  /// Indicates the collection of organizational units that are involved in the
  /// aggregation key.
  final SummarizationDimensionOverview? aggregatedOrganizationalUnits;

  AggregationSummary({
    required this.aggregatedAccounts,
    required this.aggregatedBy,
    required this.aggregatedRegions,
    required this.eventCount,
    this.additionalSummarizationDimensions,
    this.aggregatedOrganizationalUnits,
  });

  factory AggregationSummary.fromJson(Map<String, dynamic> json) {
    return AggregationSummary(
      aggregatedAccounts: SummarizationDimensionOverview.fromJson(
          (json['aggregatedAccounts'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      aggregatedBy: ((json['aggregatedBy'] as List?) ?? const [])
          .nonNulls
          .map((e) => AggregationKey.fromJson(e as Map<String, dynamic>))
          .toList(),
      aggregatedRegions: SummarizationDimensionOverview.fromJson(
          (json['aggregatedRegions'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      eventCount: (json['eventCount'] as int?) ?? 0,
      additionalSummarizationDimensions:
          (json['additionalSummarizationDimensions'] as List?)
              ?.nonNulls
              .map((e) => SummarizationDimensionOverview.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      aggregatedOrganizationalUnits:
          json['aggregatedOrganizationalUnits'] != null
              ? SummarizationDimensionOverview.fromJson(
                  json['aggregatedOrganizationalUnits'] as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final aggregatedAccounts = this.aggregatedAccounts;
    final aggregatedBy = this.aggregatedBy;
    final aggregatedRegions = this.aggregatedRegions;
    final eventCount = this.eventCount;
    final additionalSummarizationDimensions =
        this.additionalSummarizationDimensions;
    final aggregatedOrganizationalUnits = this.aggregatedOrganizationalUnits;
    return {
      'aggregatedAccounts': aggregatedAccounts,
      'aggregatedBy': aggregatedBy,
      'aggregatedRegions': aggregatedRegions,
      'eventCount': eventCount,
      if (additionalSummarizationDimensions != null)
        'additionalSummarizationDimensions': additionalSummarizationDimensions,
      if (aggregatedOrganizationalUnits != null)
        'aggregatedOrganizationalUnits': aggregatedOrganizationalUnits,
    };
  }
}

/// Provides an overview of how data is summarized across different dimensions.
class SummarizationDimensionOverview {
  /// Total number of occurrences for this dimension.
  final int count;

  /// Name of the summarization dimension.
  final String name;

  /// Indicates the sample values found within the dimension.
  final List<String>? sampleValues;

  SummarizationDimensionOverview({
    required this.count,
    required this.name,
    this.sampleValues,
  });

  factory SummarizationDimensionOverview.fromJson(Map<String, dynamic> json) {
    return SummarizationDimensionOverview(
      count: (json['count'] as int?) ?? 0,
      name: (json['name'] as String?) ?? '',
      sampleValues: (json['sampleValues'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final count = this.count;
    final name = this.name;
    final sampleValues = this.sampleValues;
    return {
      'count': count,
      'name': name,
      if (sampleValues != null) 'sampleValues': sampleValues,
    };
  }
}

/// Key-value collection that indicate how notifications are grouped.
class AggregationKey {
  /// Indicates the type of aggregation key.
  final String name;

  /// Indicates the value associated with the aggregation key name.
  final String value;

  AggregationKey({
    required this.name,
    required this.value,
  });

  factory AggregationKey.fromJson(Map<String, dynamic> json) {
    return AggregationKey(
      name: (json['name'] as String?) ?? '',
      value: (json['value'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      'name': name,
      'value': value,
    };
  }
}

class SchemaVersion {
  static const v1_0 = SchemaVersion._('v1.0');

  final String value;

  const SchemaVersion._(this.value);

  static const values = [v1_0];

  static SchemaVersion fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SchemaVersion._(value));

  @override
  bool operator ==(other) => other is SchemaVersion && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains metadata about the event that caused the
/// <code>NotificationEvent</code>. For other specific values, see
/// <code>sourceEventMetadata</code>.
class SourceEventMetadataSummary {
  /// The event type to match.
  ///
  /// Must match one of the valid Amazon EventBridge event types. For example, EC2
  /// Instance State-change Notification and Amazon CloudWatch Alarm State Change.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-service-event.html#eb-service-event-delivery-level">Event
  /// delivery from Amazon Web Services services</a> in the <i>Amazon EventBridge
  /// User Guide</i>.
  final String eventType;

  /// The matched event source.
  ///
  /// Must match one of the valid EventBridge sources. Only Amazon Web Services
  /// service sourced events are supported. For example, <code>aws.ec2</code> and
  /// <code>aws.cloudwatch</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-service-event.html#eb-service-event-delivery-level">Event
  /// delivery from Amazon Web Services services</a> in the <i>Amazon EventBridge
  /// User Guide</i>.
  final String source;

  /// The Region where the notification originated.
  ///
  /// Unavailable for aggregated notifications.
  final String? eventOriginRegion;

  SourceEventMetadataSummary({
    required this.eventType,
    required this.source,
    this.eventOriginRegion,
  });

  factory SourceEventMetadataSummary.fromJson(Map<String, dynamic> json) {
    return SourceEventMetadataSummary(
      eventType: (json['eventType'] as String?) ?? '',
      source: (json['source'] as String?) ?? '',
      eventOriginRegion: json['eventOriginRegion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventType = this.eventType;
    final source = this.source;
    final eventOriginRegion = this.eventOriginRegion;
    return {
      'eventType': eventType,
      'source': source,
      if (eventOriginRegion != null) 'eventOriginRegion': eventOriginRegion,
    };
  }
}

/// Contains the headline message component.
class MessageComponentsSummary {
  /// A sentence long summary. For example, titles or an email subject line.
  final String headline;

  MessageComponentsSummary({
    required this.headline,
  });

  factory MessageComponentsSummary.fromJson(Map<String, dynamic> json) {
    return MessageComponentsSummary(
      headline: (json['headline'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final headline = this.headline;
    return {
      'headline': headline,
    };
  }
}

class EventStatus {
  static const healthy = EventStatus._('HEALTHY');
  static const unhealthy = EventStatus._('UNHEALTHY');

  final String value;

  const EventStatus._(this.value);

  static const values = [healthy, unhealthy];

  static EventStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => EventStatus._(value));

  @override
  bool operator ==(other) => other is EventStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class NotificationType {
  static const alert = NotificationType._('ALERT');
  static const warning = NotificationType._('WARNING');
  static const announcement = NotificationType._('ANNOUNCEMENT');
  static const informational = NotificationType._('INFORMATIONAL');

  final String value;

  const NotificationType._(this.value);

  static const values = [alert, warning, announcement, informational];

  static NotificationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => NotificationType._(value));

  @override
  bool operator ==(other) => other is NotificationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class LocaleCode {
  static const deDe = LocaleCode._('de_DE');
  static const enCa = LocaleCode._('en_CA');
  static const enUs = LocaleCode._('en_US');
  static const enUk = LocaleCode._('en_UK');
  static const esEs = LocaleCode._('es_ES');
  static const frCa = LocaleCode._('fr_CA');
  static const frFr = LocaleCode._('fr_FR');
  static const idId = LocaleCode._('id_ID');
  static const itIt = LocaleCode._('it_IT');
  static const jaJp = LocaleCode._('ja_JP');
  static const koKr = LocaleCode._('ko_KR');
  static const ptBr = LocaleCode._('pt_BR');
  static const trTr = LocaleCode._('tr_TR');
  static const zhCn = LocaleCode._('zh_CN');
  static const zhTw = LocaleCode._('zh_TW');

  final String value;

  const LocaleCode._(this.value);

  static const values = [
    deDe,
    enCa,
    enUs,
    enUk,
    esEs,
    frCa,
    frFr,
    idId,
    itIt,
    jaJp,
    koKr,
    ptBr,
    trTr,
    zhCn,
    zhTw
  ];

  static LocaleCode fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => LocaleCode._(value));

  @override
  bool operator ==(other) => other is LocaleCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A <code>NotificationEvent</code> is a notification-focused representation of
/// an event. They contain semantic information used by Channels to create
/// end-user notifications.
class NotificationEventSchema {
  /// The unique identifier for a <code>NotificationEvent</code>.
  final String id;

  /// A list of media elements.
  final List<MediaElement> media;
  final MessageComponents messageComponents;

  /// The type of event causing the notification.
  ///
  /// <ul>
  /// <li>
  /// Values:
  ///
  /// <ul>
  /// <li>
  /// <code>ALERT</code>
  ///
  /// <ul>
  /// <li>
  /// A notification about an event where something was triggered, initiated,
  /// reopened, deployed, or a threshold was breached.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>WARNING</code>
  ///
  /// <ul>
  /// <li>
  /// A notification about an event where an issue is about to arise. For example,
  /// something is approaching a threshold.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>ANNOUNCEMENT</code>
  ///
  /// <ul>
  /// <li>
  /// A notification about an important event. For example, a step in a workflow
  /// or escalation path or that a workflow was updated.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>INFORMATIONAL</code>
  ///
  /// <ul>
  /// <li>
  /// A notification about informational messages. For example, recommendations,
  /// service announcements, or reminders.
  /// </li>
  /// </ul> </li>
  /// </ul> </li>
  /// </ul>
  final NotificationType notificationType;

  /// The schema version of the Notification Event.
  final SchemaVersion schemaVersion;

  /// The source event metadata.
  final SourceEventMetadata sourceEventMetadata;

  /// A list of text values.
  final Map<String, TextPartValue> textParts;

  /// If the value of <code>aggregationEventType</code> is not <code>NONE</code>,
  /// this is the Amazon Resource Event (ARN) of the parent aggregate
  /// notification.
  ///
  /// This is omitted if notification isn't aggregated.
  final String? aggregateNotificationEventArn;

  /// The aggregation type of the <code>NotificationConfiguration</code>.
  ///
  /// <ul>
  /// <li>
  /// Values:
  ///
  /// <ul>
  /// <li>
  /// <code>AGGREGATE</code>
  ///
  /// <ul>
  /// <li>
  /// The notification event is an aggregate notification. Aggregate notifications
  /// summarize grouped events over a specified time period.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>CHILD</code>
  ///
  /// <ul>
  /// <li>
  /// Some <code>EventRules</code> are <code>ACTIVE</code> and some are
  /// <code>INACTIVE</code>. Any call can be run.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>NONE</code>
  ///
  /// <ul>
  /// <li>
  /// The notification isn't aggregated.
  /// </li>
  /// </ul> </li>
  /// </ul> </li>
  /// </ul>
  final AggregationEventType? aggregationEventType;

  /// Provides additional information about how multiple notifications are
  /// grouped.
  final AggregationSummary? aggregationSummary;

  /// The end time of the event.
  final DateTime? endTime;

  /// The assessed nature of the event.
  ///
  /// <ul>
  /// <li>
  /// Values:
  ///
  /// <ul>
  /// <li>
  /// <code>HEALTHY</code>
  ///
  /// <ul>
  /// <li>
  /// All <code>EventRules</code> are <code>ACTIVE</code> and any call can be run.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>UNHEALTHY</code>
  ///
  /// <ul>
  /// <li>
  /// Some <code>EventRules</code> are <code>ACTIVE</code> and some are
  /// <code>INACTIVE</code>. Any call can be run.
  /// </li>
  /// </ul> </li>
  /// </ul> </li>
  /// </ul>
  final EventStatus? eventStatus;

  /// The unique identifier of the organizational unit associated with the
  /// notification event.
  final String? organizationalUnitId;

  /// The source event URL.
  final String? sourceEventDetailUrl;

  /// The detailed URL for the source event.
  final String? sourceEventDetailUrlDisplayText;

  /// The notification event start time.
  final DateTime? startTime;

  NotificationEventSchema({
    required this.id,
    required this.media,
    required this.messageComponents,
    required this.notificationType,
    required this.schemaVersion,
    required this.sourceEventMetadata,
    required this.textParts,
    this.aggregateNotificationEventArn,
    this.aggregationEventType,
    this.aggregationSummary,
    this.endTime,
    this.eventStatus,
    this.organizationalUnitId,
    this.sourceEventDetailUrl,
    this.sourceEventDetailUrlDisplayText,
    this.startTime,
  });

  factory NotificationEventSchema.fromJson(Map<String, dynamic> json) {
    return NotificationEventSchema(
      id: (json['id'] as String?) ?? '',
      media: ((json['media'] as List?) ?? const [])
          .nonNulls
          .map((e) => MediaElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      messageComponents: MessageComponents.fromJson(
          (json['messageComponents'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      notificationType: NotificationType.fromString(
          (json['notificationType'] as String?) ?? ''),
      schemaVersion:
          SchemaVersion.fromString((json['schemaVersion'] as String?) ?? ''),
      sourceEventMetadata: SourceEventMetadata.fromJson(
          (json['sourceEventMetadata'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      textParts: ((json['textParts'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) =>
              MapEntry(k, TextPartValue.fromJson(e as Map<String, dynamic>))),
      aggregateNotificationEventArn:
          json['aggregateNotificationEventArn'] as String?,
      aggregationEventType: (json['aggregationEventType'] as String?)
          ?.let(AggregationEventType.fromString),
      aggregationSummary: json['aggregationSummary'] != null
          ? AggregationSummary.fromJson(
              json['aggregationSummary'] as Map<String, dynamic>)
          : null,
      endTime: timeStampFromJson(json['endTime']),
      eventStatus:
          (json['eventStatus'] as String?)?.let(EventStatus.fromString),
      organizationalUnitId: json['organizationalUnitId'] as String?,
      sourceEventDetailUrl: json['sourceEventDetailUrl'] as String?,
      sourceEventDetailUrlDisplayText:
          json['sourceEventDetailUrlDisplayText'] as String?,
      startTime: timeStampFromJson(json['startTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final media = this.media;
    final messageComponents = this.messageComponents;
    final notificationType = this.notificationType;
    final schemaVersion = this.schemaVersion;
    final sourceEventMetadata = this.sourceEventMetadata;
    final textParts = this.textParts;
    final aggregateNotificationEventArn = this.aggregateNotificationEventArn;
    final aggregationEventType = this.aggregationEventType;
    final aggregationSummary = this.aggregationSummary;
    final endTime = this.endTime;
    final eventStatus = this.eventStatus;
    final organizationalUnitId = this.organizationalUnitId;
    final sourceEventDetailUrl = this.sourceEventDetailUrl;
    final sourceEventDetailUrlDisplayText =
        this.sourceEventDetailUrlDisplayText;
    final startTime = this.startTime;
    return {
      'id': id,
      'media': media,
      'messageComponents': messageComponents,
      'notificationType': notificationType.value,
      'schemaVersion': schemaVersion.value,
      'sourceEventMetadata': sourceEventMetadata,
      'textParts': textParts,
      if (aggregateNotificationEventArn != null)
        'aggregateNotificationEventArn': aggregateNotificationEventArn,
      if (aggregationEventType != null)
        'aggregationEventType': aggregationEventType.value,
      if (aggregationSummary != null) 'aggregationSummary': aggregationSummary,
      if (endTime != null) 'endTime': iso8601ToJson(endTime),
      if (eventStatus != null) 'eventStatus': eventStatus.value,
      if (organizationalUnitId != null)
        'organizationalUnitId': organizationalUnitId,
      if (sourceEventDetailUrl != null)
        'sourceEventDetailUrl': sourceEventDetailUrl,
      if (sourceEventDetailUrlDisplayText != null)
        'sourceEventDetailUrlDisplayText': sourceEventDetailUrlDisplayText,
      if (startTime != null) 'startTime': iso8601ToJson(startTime),
    };
  }
}

/// Describes the metadata for a source event.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-events-structure.html">Event
/// structure reference</a> in the <i>Amazon EventBridge User Guide</i>.
class SourceEventMetadata {
  /// The date and time the source event occurred. This is based on the Source
  /// Event.
  final DateTime eventOccurrenceTime;

  /// The type of event. For example, an Amazon CloudWatch state change.
  final String eventType;

  /// The version of the type of event.
  final String eventTypeVersion;

  /// The primary Amazon Web Services account of <code>SourceEvent</code>.
  final String relatedAccount;

  /// A list of resources related to this <code>NotificationEvent</code>.
  final List<Resource> relatedResources;

  /// The Amazon Web Services service the event originates from. For example
  /// <code>aws.cloudwatch</code>.
  final String source;

  /// The source event id.
  final String sourceEventId;

  /// The Region the event originated from.
  final String? eventOriginRegion;

  SourceEventMetadata({
    required this.eventOccurrenceTime,
    required this.eventType,
    required this.eventTypeVersion,
    required this.relatedAccount,
    required this.relatedResources,
    required this.source,
    required this.sourceEventId,
    this.eventOriginRegion,
  });

  factory SourceEventMetadata.fromJson(Map<String, dynamic> json) {
    return SourceEventMetadata(
      eventOccurrenceTime:
          nonNullableTimeStampFromJson(json['eventOccurrenceTime'] ?? 0),
      eventType: (json['eventType'] as String?) ?? '',
      eventTypeVersion: (json['eventTypeVersion'] as String?) ?? '',
      relatedAccount: (json['relatedAccount'] as String?) ?? '',
      relatedResources: ((json['relatedResources'] as List?) ?? const [])
          .nonNulls
          .map((e) => Resource.fromJson(e as Map<String, dynamic>))
          .toList(),
      source: (json['source'] as String?) ?? '',
      sourceEventId: (json['sourceEventId'] as String?) ?? '',
      eventOriginRegion: json['eventOriginRegion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventOccurrenceTime = this.eventOccurrenceTime;
    final eventType = this.eventType;
    final eventTypeVersion = this.eventTypeVersion;
    final relatedAccount = this.relatedAccount;
    final relatedResources = this.relatedResources;
    final source = this.source;
    final sourceEventId = this.sourceEventId;
    final eventOriginRegion = this.eventOriginRegion;
    return {
      'eventOccurrenceTime': iso8601ToJson(eventOccurrenceTime),
      'eventType': eventType,
      'eventTypeVersion': eventTypeVersion,
      'relatedAccount': relatedAccount,
      'relatedResources': relatedResources,
      'source': source,
      'sourceEventId': sourceEventId,
      if (eventOriginRegion != null) 'eventOriginRegion': eventOriginRegion,
    };
  }
}

/// Describes the components of a notification message.
class MessageComponents {
  /// A complete summary with all possible relevant information.
  final String? completeDescription;

  /// A list of properties in key-value pairs. Pairs are shown in order of
  /// importance from most important to least important. Channels may limit the
  /// number of dimensions shown to the notification viewer.
  /// <note>
  /// Included dimensions, keys, and values are subject to change.
  /// </note>
  final List<Dimension>? dimensions;

  /// A sentence long summary. For example, titles or an email subject line.
  final String? headline;

  /// A paragraph long or multiple sentence summary. For example, Amazon Q
  /// Developer in chat applications notifications.
  final String? paragraphSummary;

  MessageComponents({
    this.completeDescription,
    this.dimensions,
    this.headline,
    this.paragraphSummary,
  });

  factory MessageComponents.fromJson(Map<String, dynamic> json) {
    return MessageComponents(
      completeDescription: json['completeDescription'] as String?,
      dimensions: (json['dimensions'] as List?)
          ?.nonNulls
          .map((e) => Dimension.fromJson(e as Map<String, dynamic>))
          .toList(),
      headline: json['headline'] as String?,
      paragraphSummary: json['paragraphSummary'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final completeDescription = this.completeDescription;
    final dimensions = this.dimensions;
    final headline = this.headline;
    final paragraphSummary = this.paragraphSummary;
    return {
      if (completeDescription != null)
        'completeDescription': completeDescription,
      if (dimensions != null) 'dimensions': dimensions,
      if (headline != null) 'headline': headline,
      if (paragraphSummary != null) 'paragraphSummary': paragraphSummary,
    };
  }
}

/// Describes a media element.
class MediaElement {
  /// The caption of the media.
  final String caption;

  /// The unique ID for the media.
  final String mediaId;

  /// The type of media.
  final MediaElementType type;

  /// The URL of the media.
  final String url;

  MediaElement({
    required this.caption,
    required this.mediaId,
    required this.type,
    required this.url,
  });

  factory MediaElement.fromJson(Map<String, dynamic> json) {
    return MediaElement(
      caption: (json['caption'] as String?) ?? '',
      mediaId: (json['mediaId'] as String?) ?? '',
      type: MediaElementType.fromString((json['type'] as String?) ?? ''),
      url: (json['url'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final caption = this.caption;
    final mediaId = this.mediaId;
    final type = this.type;
    final url = this.url;
    return {
      'caption': caption,
      'mediaId': mediaId,
      'type': type.value,
      'url': url,
    };
  }
}

class MediaElementType {
  static const image = MediaElementType._('IMAGE');

  final String value;

  const MediaElementType._(this.value);

  static const values = [image];

  static MediaElementType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MediaElementType._(value));

  @override
  bool operator ==(other) => other is MediaElementType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes text information objects containing fields that determine how text
/// part objects are composed.
class TextPartValue {
  /// The type of text part. Determines the usage of all other fields and whether
  /// or not they're required.
  final TextPartType type;

  /// A short single line description of the link. Must be hyper-linked with the
  /// URL itself.
  ///
  /// Used for text parts with the type <code>URL</code>.
  final String? displayText;

  /// A map of locales to the text in that locale.
  final Map<LocaleCode, String>? textByLocale;

  /// The URL itself.
  final String? url;

  TextPartValue({
    required this.type,
    this.displayText,
    this.textByLocale,
    this.url,
  });

  factory TextPartValue.fromJson(Map<String, dynamic> json) {
    return TextPartValue(
      type: TextPartType.fromString((json['type'] as String?) ?? ''),
      displayText: json['displayText'] as String?,
      textByLocale: (json['textByLocale'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(LocaleCode.fromString(k), e as String)),
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final displayText = this.displayText;
    final textByLocale = this.textByLocale;
    final url = this.url;
    return {
      'type': type.value,
      if (displayText != null) 'displayText': displayText,
      if (textByLocale != null)
        'textByLocale': textByLocale.map((k, e) => MapEntry(k.value, e)),
      if (url != null) 'url': url,
    };
  }
}

class TextPartType {
  static const localizedText = TextPartType._('LOCALIZED_TEXT');
  static const plainText = TextPartType._('PLAIN_TEXT');
  static const url = TextPartType._('URL');

  final String value;

  const TextPartType._(this.value);

  static const values = [localizedText, plainText, url];

  static TextPartType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => TextPartType._(value));

  @override
  bool operator ==(other) => other is TextPartType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The key-value pair of properties for an event.
class Dimension {
  /// The name of the dimension
  final String name;

  /// The value of the dimension.
  final String value;

  Dimension({
    required this.name,
    required this.value,
  });

  factory Dimension.fromJson(Map<String, dynamic> json) {
    return Dimension(
      name: (json['name'] as String?) ?? '',
      value: (json['value'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      'name': name,
      'value': value,
    };
  }
}

/// A resource affected by or closely linked to an event.
class Resource {
  /// The Amazon Resource Name (ARN) of the resource. At least one id or ARN is
  /// required.
  final String? arn;

  /// The URL to the resource's detail page. If a detail page URL is unavailable,
  /// it is the URL to an informational page that describes the resource's type.
  final String? detailUrl;

  /// The unique identifier for the resource.
  ///
  /// At least one id or ARN is required.
  final String? id;

  /// A map of tags assigned to a resource. A tag is a string-to-string map of
  /// key-value pairs.
  final List<String>? tags;

  Resource({
    this.arn,
    this.detailUrl,
    this.id,
    this.tags,
  });

  factory Resource.fromJson(Map<String, dynamic> json) {
    return Resource(
      arn: json['arn'] as String?,
      detailUrl: json['detailUrl'] as String?,
      id: json['id'] as String?,
      tags: (json['tags'] as List?)?.nonNulls.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final detailUrl = this.detailUrl;
    final id = this.id;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (detailUrl != null) 'detailUrl': detailUrl,
      if (id != null) 'id': id,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Contains the complete list of fields for a NotificationConfiguration.
class NotificationConfigurationStructure {
  /// The Amazon Resource Name (ARN) of the <code>NotificationConfiguration</code>
  /// resource.
  final String arn;

  /// The creation time of the <code>NotificationConfiguration</code>.
  final DateTime creationTime;

  /// The description of the <code>NotificationConfiguration</code>.
  final String description;

  /// The name of the <code>NotificationConfiguration</code>. Supports RFC 3986's
  /// unreserved characters.
  final String name;

  /// The current status of the <code>NotificationConfiguration</code>.
  final NotificationConfigurationStatus status;

  /// The aggregation preference of the <code>NotificationConfiguration</code>.
  ///
  /// <ul>
  /// <li>
  /// Values:
  ///
  /// <ul>
  /// <li>
  /// <code>LONG</code>
  ///
  /// <ul>
  /// <li>
  /// Aggregate notifications for long periods of time (12 hours).
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>SHORT</code>
  ///
  /// <ul>
  /// <li>
  /// Aggregate notifications for short periods of time (5 minutes).
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>NONE</code>
  ///
  /// <ul>
  /// <li>
  /// Don't aggregate notifications.
  /// </li>
  /// </ul> </li>
  /// </ul> </li>
  /// </ul>
  final AggregationDuration? aggregationDuration;

  /// The subtype of the notification configuration.
  final NotificationConfigurationSubtype? subtype;

  NotificationConfigurationStructure({
    required this.arn,
    required this.creationTime,
    required this.description,
    required this.name,
    required this.status,
    this.aggregationDuration,
    this.subtype,
  });

  factory NotificationConfigurationStructure.fromJson(
      Map<String, dynamic> json) {
    return NotificationConfigurationStructure(
      arn: (json['arn'] as String?) ?? '',
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      description: (json['description'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      status: NotificationConfigurationStatus.fromString(
          (json['status'] as String?) ?? ''),
      aggregationDuration: (json['aggregationDuration'] as String?)
          ?.let(AggregationDuration.fromString),
      subtype: (json['subtype'] as String?)
          ?.let(NotificationConfigurationSubtype.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final description = this.description;
    final name = this.name;
    final status = this.status;
    final aggregationDuration = this.aggregationDuration;
    final subtype = this.subtype;
    return {
      'arn': arn,
      'creationTime': iso8601ToJson(creationTime),
      'description': description,
      'name': name,
      'status': status.value,
      if (aggregationDuration != null)
        'aggregationDuration': aggregationDuration.value,
      if (subtype != null) 'subtype': subtype.value,
    };
  }
}

class NotificationConfigurationStatus {
  static const active = NotificationConfigurationStatus._('ACTIVE');
  static const partiallyActive =
      NotificationConfigurationStatus._('PARTIALLY_ACTIVE');
  static const inactive = NotificationConfigurationStatus._('INACTIVE');
  static const deleting = NotificationConfigurationStatus._('DELETING');

  final String value;

  const NotificationConfigurationStatus._(this.value);

  static const values = [active, partiallyActive, inactive, deleting];

  static NotificationConfigurationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => NotificationConfigurationStatus._(value));

  @override
  bool operator ==(other) =>
      other is NotificationConfigurationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class AggregationDuration {
  static const long = AggregationDuration._('LONG');
  static const short = AggregationDuration._('SHORT');
  static const none = AggregationDuration._('NONE');

  final String value;

  const AggregationDuration._(this.value);

  static const values = [long, short, none];

  static AggregationDuration fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AggregationDuration._(value));

  @override
  bool operator ==(other) =>
      other is AggregationDuration && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class NotificationConfigurationSubtype {
  static const account = NotificationConfigurationSubtype._('ACCOUNT');
  static const adminManaged =
      NotificationConfigurationSubtype._('ADMIN_MANAGED');

  final String value;

  const NotificationConfigurationSubtype._(this.value);

  static const values = [account, adminManaged];

  static NotificationConfigurationSubtype fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => NotificationConfigurationSubtype._(value));

  @override
  bool operator ==(other) =>
      other is NotificationConfigurationSubtype && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes an overview and metadata for a ManagedNotificationEvent.
class ManagedNotificationEventOverview {
  /// The Amazon Resource Name (ARN) of the ManagedNotificationEvent.
  final String arn;

  /// The creation time of the <code>ManagedNotificationEvent</code>.
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the
  /// <code>ManagedNotificationConfiguration</code>.
  final String managedNotificationConfigurationArn;

  /// <p/>
  final ManagedNotificationEventSummary notificationEvent;

  /// The account that related to the <code>ManagedNotificationEvent</code>.
  final String relatedAccount;

  /// The list of the regions where the aggregated notifications in this
  /// <code>NotificationEvent</code> originated.
  final List<String>? aggregatedNotificationRegions;

  /// The notifications aggregation type.
  ///
  /// <ul>
  /// <li>
  /// Values:
  ///
  /// <ul>
  /// <li>
  /// <code>AGGREGATE</code>
  ///
  /// <ul>
  /// <li>
  /// The notification event is an aggregate notification. Aggregate notifications
  /// summarize grouped events over a specified time period.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>CHILD</code>
  ///
  /// <ul>
  /// <li>
  /// Some <code>EventRules</code> are <code>ACTIVE</code> and some are
  /// <code>INACTIVE</code>. Any call can be run.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>NONE</code>
  ///
  /// <ul>
  /// <li>
  /// The notification isn't aggregated.
  /// </li>
  /// </ul> </li>
  /// </ul> </li>
  /// </ul>
  final AggregationEventType? aggregationEventType;
  final AggregationSummary? aggregationSummary;

  /// The Organizational Unit Id that an Amazon Web Services account belongs to.
  final String? organizationalUnitId;

  ManagedNotificationEventOverview({
    required this.arn,
    required this.creationTime,
    required this.managedNotificationConfigurationArn,
    required this.notificationEvent,
    required this.relatedAccount,
    this.aggregatedNotificationRegions,
    this.aggregationEventType,
    this.aggregationSummary,
    this.organizationalUnitId,
  });

  factory ManagedNotificationEventOverview.fromJson(Map<String, dynamic> json) {
    return ManagedNotificationEventOverview(
      arn: (json['arn'] as String?) ?? '',
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      managedNotificationConfigurationArn:
          (json['managedNotificationConfigurationArn'] as String?) ?? '',
      notificationEvent: ManagedNotificationEventSummary.fromJson(
          (json['notificationEvent'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      relatedAccount: (json['relatedAccount'] as String?) ?? '',
      aggregatedNotificationRegions:
          (json['aggregatedNotificationRegions'] as List?)
              ?.nonNulls
              .map((e) => e as String)
              .toList(),
      aggregationEventType: (json['aggregationEventType'] as String?)
          ?.let(AggregationEventType.fromString),
      aggregationSummary: json['aggregationSummary'] != null
          ? AggregationSummary.fromJson(
              json['aggregationSummary'] as Map<String, dynamic>)
          : null,
      organizationalUnitId: json['organizationalUnitId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final managedNotificationConfigurationArn =
        this.managedNotificationConfigurationArn;
    final notificationEvent = this.notificationEvent;
    final relatedAccount = this.relatedAccount;
    final aggregatedNotificationRegions = this.aggregatedNotificationRegions;
    final aggregationEventType = this.aggregationEventType;
    final aggregationSummary = this.aggregationSummary;
    final organizationalUnitId = this.organizationalUnitId;
    return {
      'arn': arn,
      'creationTime': iso8601ToJson(creationTime),
      'managedNotificationConfigurationArn':
          managedNotificationConfigurationArn,
      'notificationEvent': notificationEvent,
      'relatedAccount': relatedAccount,
      if (aggregatedNotificationRegions != null)
        'aggregatedNotificationRegions': aggregatedNotificationRegions,
      if (aggregationEventType != null)
        'aggregationEventType': aggregationEventType.value,
      if (aggregationSummary != null) 'aggregationSummary': aggregationSummary,
      if (organizationalUnitId != null)
        'organizationalUnitId': organizationalUnitId,
    };
  }
}

/// A short summary of a <code>ManagedNotificationEvent</code>. This is only
/// used when listing managed notification events.
class ManagedNotificationEventSummary {
  /// The managed notification event status.
  ///
  /// <ul>
  /// <li>
  /// Values:
  ///
  /// <ul>
  /// <li>
  /// <code>HEALTHY</code>
  ///
  /// <ul>
  /// <li>
  /// All <code>EventRules</code> are <code>ACTIVE</code>.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>UNHEALTHY</code>
  ///
  /// <ul>
  /// <li>
  /// Some <code>EventRules</code> are <code>ACTIVE</code> and some are
  /// <code>INACTIVE</code>.
  /// </li>
  /// </ul> </li>
  /// </ul> </li>
  /// </ul>
  final EventStatus eventStatus;
  final MessageComponentsSummary messageComponents;

  /// The Type of event causing the notification.
  ///
  /// <ul>
  /// <li>
  /// Values:
  ///
  /// <ul>
  /// <li>
  /// <code>ALERT</code>
  ///
  /// <ul>
  /// <li>
  /// A notification about an event where something was triggered, initiated,
  /// reopened, deployed, or a threshold was breached.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>WARNING</code>
  ///
  /// <ul>
  /// <li>
  /// A notification about an event where an issue is about to arise. For example,
  /// something is approaching a threshold.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>ANNOUNCEMENT</code>
  ///
  /// <ul>
  /// <li>
  /// A notification about an important event. For example, a step in a workflow
  /// or escalation path or that a workflow was updated.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>INFORMATIONAL</code>
  ///
  /// <ul>
  /// <li>
  /// A notification about informational messages. For example, recommendations,
  /// service announcements, or reminders.
  /// </li>
  /// </ul> </li>
  /// </ul> </li>
  /// </ul>
  final NotificationType notificationType;

  /// The schema version of the <code>ManagedNotificationEvent</code>.
  final SchemaVersion schemaVersion;

  /// Contains metadata about the event that caused the
  /// <code>ManagedNotificationEvent</code>.
  final ManagedSourceEventMetadataSummary sourceEventMetadata;

  ManagedNotificationEventSummary({
    required this.eventStatus,
    required this.messageComponents,
    required this.notificationType,
    required this.schemaVersion,
    required this.sourceEventMetadata,
  });

  factory ManagedNotificationEventSummary.fromJson(Map<String, dynamic> json) {
    return ManagedNotificationEventSummary(
      eventStatus:
          EventStatus.fromString((json['eventStatus'] as String?) ?? ''),
      messageComponents: MessageComponentsSummary.fromJson(
          (json['messageComponents'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      notificationType: NotificationType.fromString(
          (json['notificationType'] as String?) ?? ''),
      schemaVersion:
          SchemaVersion.fromString((json['schemaVersion'] as String?) ?? ''),
      sourceEventMetadata: ManagedSourceEventMetadataSummary.fromJson(
          (json['sourceEventMetadata'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final eventStatus = this.eventStatus;
    final messageComponents = this.messageComponents;
    final notificationType = this.notificationType;
    final schemaVersion = this.schemaVersion;
    final sourceEventMetadata = this.sourceEventMetadata;
    return {
      'eventStatus': eventStatus.value,
      'messageComponents': messageComponents,
      'notificationType': notificationType.value,
      'schemaVersion': schemaVersion.value,
      'sourceEventMetadata': sourceEventMetadata,
    };
  }
}

/// A short summary and metadata for a managed notification event.
class ManagedSourceEventMetadataSummary {
  /// The event Type of the notification.
  final String eventType;

  /// The source service of the notification.
  ///
  /// Must match one of the valid EventBridge sources. Only Amazon Web Services
  /// service sourced events are supported. For example, <code>aws.ec2</code> and
  /// <code>aws.cloudwatch</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-service-event.html#eb-service-event-delivery-level">Event
  /// delivery from Amazon Web Services services</a> in the <i>Amazon EventBridge
  /// User Guide</i>.
  final String source;

  /// The Region where the notification originated.
  final String? eventOriginRegion;

  ManagedSourceEventMetadataSummary({
    required this.eventType,
    required this.source,
    this.eventOriginRegion,
  });

  factory ManagedSourceEventMetadataSummary.fromJson(
      Map<String, dynamic> json) {
    return ManagedSourceEventMetadataSummary(
      eventType: (json['eventType'] as String?) ?? '',
      source: (json['source'] as String?) ?? '',
      eventOriginRegion: json['eventOriginRegion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventType = this.eventType;
    final source = this.source;
    final eventOriginRegion = this.eventOriginRegion;
    return {
      'eventType': eventType,
      'source': source,
      if (eventOriginRegion != null) 'eventOriginRegion': eventOriginRegion,
    };
  }
}

/// A notification-focused representation of an event. They contain semantic
/// information used by AccountContacts or Additional Channels to create
/// end-user notifications.
class ManagedNotificationEvent {
  /// Unique identifier for a <code>ManagedNotificationEvent</code>.
  final String id;
  final MessageComponents messageComponents;

  /// The nature of the event causing this notification.
  ///
  /// <ul>
  /// <li>
  /// Values:
  ///
  /// <ul>
  /// <li>
  /// <code>ALERT</code>
  ///
  /// <ul>
  /// <li>
  /// A notification about an event where something was triggered, initiated,
  /// reopened, deployed, or a threshold was breached.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>WARNING</code>
  ///
  /// <ul>
  /// <li>
  /// A notification about an event where an issue is about to arise. For example,
  /// something is approaching a threshold.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>ANNOUNCEMENT</code>
  ///
  /// <ul>
  /// <li>
  /// A notification about an important event. For example, a step in a workflow
  /// or escalation path or that a workflow was updated.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>INFORMATIONAL</code>
  ///
  /// <ul>
  /// <li>
  /// A notification about informational messages. For example, recommendations,
  /// service announcements, or reminders.
  /// </li>
  /// </ul> </li>
  /// </ul> </li>
  /// </ul>
  final NotificationType notificationType;

  /// Version of the <code>ManagedNotificationEvent</code> schema.
  final SchemaVersion schemaVersion;

  /// A list of text values.
  final Map<String, TextPartValue> textParts;

  /// The notifications aggregation type.
  final AggregationEventType? aggregationEventType;
  final AggregationSummary? aggregationSummary;

  /// The end time of the notification event.
  final DateTime? endTime;

  /// The status of an event.
  ///
  /// <ul>
  /// <li>
  /// Values:
  ///
  /// <ul>
  /// <li>
  /// <code>HEALTHY</code>
  ///
  /// <ul>
  /// <li>
  /// All EventRules are <code>ACTIVE</code> and any call can be run.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>UNHEALTHY</code>
  ///
  /// <ul>
  /// <li>
  /// Some EventRules are <code>ACTIVE</code> and some are <code>INACTIVE</code>.
  /// Any call can be run.
  /// </li>
  /// </ul> </li>
  /// </ul> </li>
  /// </ul>
  final EventStatus? eventStatus;

  /// The Organizational Unit Id that an Amazon Web Services account belongs to.
  final String? organizationalUnitId;

  /// URL defined by Source Service to be used by notification consumers to get
  /// additional information about event.
  final String? sourceEventDetailUrl;

  /// Text that needs to be hyperlinked with the sourceEventDetailUrl. For
  /// example, the description of the sourceEventDetailUrl.
  final String? sourceEventDetailUrlDisplayText;

  /// The earliest time of events to return from this call.
  final DateTime? startTime;

  ManagedNotificationEvent({
    required this.id,
    required this.messageComponents,
    required this.notificationType,
    required this.schemaVersion,
    required this.textParts,
    this.aggregationEventType,
    this.aggregationSummary,
    this.endTime,
    this.eventStatus,
    this.organizationalUnitId,
    this.sourceEventDetailUrl,
    this.sourceEventDetailUrlDisplayText,
    this.startTime,
  });

  factory ManagedNotificationEvent.fromJson(Map<String, dynamic> json) {
    return ManagedNotificationEvent(
      id: (json['id'] as String?) ?? '',
      messageComponents: MessageComponents.fromJson(
          (json['messageComponents'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      notificationType: NotificationType.fromString(
          (json['notificationType'] as String?) ?? ''),
      schemaVersion:
          SchemaVersion.fromString((json['schemaVersion'] as String?) ?? ''),
      textParts: ((json['textParts'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) =>
              MapEntry(k, TextPartValue.fromJson(e as Map<String, dynamic>))),
      aggregationEventType: (json['aggregationEventType'] as String?)
          ?.let(AggregationEventType.fromString),
      aggregationSummary: json['aggregationSummary'] != null
          ? AggregationSummary.fromJson(
              json['aggregationSummary'] as Map<String, dynamic>)
          : null,
      endTime: timeStampFromJson(json['endTime']),
      eventStatus:
          (json['eventStatus'] as String?)?.let(EventStatus.fromString),
      organizationalUnitId: json['organizationalUnitId'] as String?,
      sourceEventDetailUrl: json['sourceEventDetailUrl'] as String?,
      sourceEventDetailUrlDisplayText:
          json['sourceEventDetailUrlDisplayText'] as String?,
      startTime: timeStampFromJson(json['startTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final messageComponents = this.messageComponents;
    final notificationType = this.notificationType;
    final schemaVersion = this.schemaVersion;
    final textParts = this.textParts;
    final aggregationEventType = this.aggregationEventType;
    final aggregationSummary = this.aggregationSummary;
    final endTime = this.endTime;
    final eventStatus = this.eventStatus;
    final organizationalUnitId = this.organizationalUnitId;
    final sourceEventDetailUrl = this.sourceEventDetailUrl;
    final sourceEventDetailUrlDisplayText =
        this.sourceEventDetailUrlDisplayText;
    final startTime = this.startTime;
    return {
      'id': id,
      'messageComponents': messageComponents,
      'notificationType': notificationType.value,
      'schemaVersion': schemaVersion.value,
      'textParts': textParts,
      if (aggregationEventType != null)
        'aggregationEventType': aggregationEventType.value,
      if (aggregationSummary != null) 'aggregationSummary': aggregationSummary,
      if (endTime != null) 'endTime': iso8601ToJson(endTime),
      if (eventStatus != null) 'eventStatus': eventStatus.value,
      if (organizationalUnitId != null)
        'organizationalUnitId': organizationalUnitId,
      if (sourceEventDetailUrl != null)
        'sourceEventDetailUrl': sourceEventDetailUrl,
      if (sourceEventDetailUrlDisplayText != null)
        'sourceEventDetailUrlDisplayText': sourceEventDetailUrlDisplayText,
      if (startTime != null) 'startTime': iso8601ToJson(startTime),
    };
  }
}

/// Describes the basic structure and properties of a
/// <code>ManagedNotificationConfiguration</code>.
class ManagedNotificationConfigurationStructure {
  /// The Amazon Resource Name (ARN) of the
  /// <code>ManagedNotificationConfiguration</code>.
  final String arn;

  /// The description of the <code>ManagedNotificationConfiguration</code>.
  final String description;

  /// The name of the <code>ManagedNotificationConfiguration</code>.
  final String name;

  ManagedNotificationConfigurationStructure({
    required this.arn,
    required this.description,
    required this.name,
  });

  factory ManagedNotificationConfigurationStructure.fromJson(
      Map<String, dynamic> json) {
    return ManagedNotificationConfigurationStructure(
      arn: (json['arn'] as String?) ?? '',
      description: (json['description'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final description = this.description;
    final name = this.name;
    return {
      'arn': arn,
      'description': description,
      'name': name,
    };
  }
}

/// Describes an overview and metadata for a
/// <code>ManagedNotificationChildEvent</code>.
class ManagedNotificationChildEventOverview {
  /// The Amazon Resource Name (ARN) of the ManagedNotificationEvent that is
  /// associated with this <code>ManagedNotificationChildEvent</code>.
  final String aggregateManagedNotificationEventArn;

  /// The Amazon Resource Name (ARN) of the
  /// <code>ManagedNotificationChildEvent</code>.
  final String arn;

  /// The content of the <code>ManagedNotificationChildEvent</code>.
  final ManagedNotificationChildEventSummary childEvent;

  /// The creation time of the <code>ManagedNotificationChildEvent</code>.
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the
  /// <code>ManagedNotificationConfiguration</code>.
  final String managedNotificationConfigurationArn;

  /// The account that related to the <code>ManagedNotificationChildEvent</code>.
  final String relatedAccount;

  /// The Organizational Unit Id that an AWS account belongs to.
  final String? organizationalUnitId;

  ManagedNotificationChildEventOverview({
    required this.aggregateManagedNotificationEventArn,
    required this.arn,
    required this.childEvent,
    required this.creationTime,
    required this.managedNotificationConfigurationArn,
    required this.relatedAccount,
    this.organizationalUnitId,
  });

  factory ManagedNotificationChildEventOverview.fromJson(
      Map<String, dynamic> json) {
    return ManagedNotificationChildEventOverview(
      aggregateManagedNotificationEventArn:
          (json['aggregateManagedNotificationEventArn'] as String?) ?? '',
      arn: (json['arn'] as String?) ?? '',
      childEvent: ManagedNotificationChildEventSummary.fromJson(
          (json['childEvent'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      managedNotificationConfigurationArn:
          (json['managedNotificationConfigurationArn'] as String?) ?? '',
      relatedAccount: (json['relatedAccount'] as String?) ?? '',
      organizationalUnitId: json['organizationalUnitId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final aggregateManagedNotificationEventArn =
        this.aggregateManagedNotificationEventArn;
    final arn = this.arn;
    final childEvent = this.childEvent;
    final creationTime = this.creationTime;
    final managedNotificationConfigurationArn =
        this.managedNotificationConfigurationArn;
    final relatedAccount = this.relatedAccount;
    final organizationalUnitId = this.organizationalUnitId;
    return {
      'aggregateManagedNotificationEventArn':
          aggregateManagedNotificationEventArn,
      'arn': arn,
      'childEvent': childEvent,
      'creationTime': iso8601ToJson(creationTime),
      'managedNotificationConfigurationArn':
          managedNotificationConfigurationArn,
      'relatedAccount': relatedAccount,
      if (organizationalUnitId != null)
        'organizationalUnitId': organizationalUnitId,
    };
  }
}

/// Describes a short summary and metadata for a
/// <code>ManagedNotificationChildEvent</code>.
class ManagedNotificationChildEventSummary {
  /// Provides detailed information about the dimensions used for event
  /// summarization and aggregation.
  final AggregationDetail aggregationDetail;

  /// The perceived nature of the event.
  ///
  /// <ul>
  /// <li>
  /// Values:
  ///
  /// <ul>
  /// <li>
  /// <code>HEALTHY</code>
  ///
  /// <ul>
  /// <li>
  /// All EventRules are <code>ACTIVE</code> and any call can be run.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>UNHEALTHY</code>
  ///
  /// <ul>
  /// <li>
  /// Some EventRules are <code>ACTIVE</code> and some are <code>INACTIVE</code>.
  /// Any call can be run.
  /// </li>
  /// </ul> </li>
  /// </ul> </li>
  /// </ul>
  final EventStatus eventStatus;
  final MessageComponentsSummary messageComponents;

  /// The Type of the event causing this notification.
  ///
  /// <ul>
  /// <li>
  /// Values:
  ///
  /// <ul>
  /// <li>
  /// <code>ALERT</code>
  ///
  /// <ul>
  /// <li>
  /// A notification about an event where something was triggered, initiated,
  /// reopened, deployed, or a threshold was breached.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>WARNING</code>
  ///
  /// <ul>
  /// <li>
  /// A notification about an event where an issue is about to arise. For example,
  /// something is approaching a threshold.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>ANNOUNCEMENT</code>
  ///
  /// <ul>
  /// <li>
  /// A notification about an important event. For example, a step in a workflow
  /// or escalation path or that a workflow was updated.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>INFORMATIONAL</code>
  ///
  /// <ul>
  /// <li>
  /// A notification about informational messages. For example, recommendations,
  /// service announcements, or reminders.
  /// </li>
  /// </ul> </li>
  /// </ul> </li>
  /// </ul>
  final NotificationType notificationType;

  /// The schema version of the <code>ManagedNotificationChildEvent</code>.
  final SchemaVersion schemaVersion;

  /// Contains all event metadata present identically across all
  /// <code>NotificationEvents</code>. All fields are present in Source Events via
  /// Eventbridge.
  final ManagedSourceEventMetadataSummary sourceEventMetadata;

  ManagedNotificationChildEventSummary({
    required this.aggregationDetail,
    required this.eventStatus,
    required this.messageComponents,
    required this.notificationType,
    required this.schemaVersion,
    required this.sourceEventMetadata,
  });

  factory ManagedNotificationChildEventSummary.fromJson(
      Map<String, dynamic> json) {
    return ManagedNotificationChildEventSummary(
      aggregationDetail: AggregationDetail.fromJson(
          (json['aggregationDetail'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      eventStatus:
          EventStatus.fromString((json['eventStatus'] as String?) ?? ''),
      messageComponents: MessageComponentsSummary.fromJson(
          (json['messageComponents'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      notificationType: NotificationType.fromString(
          (json['notificationType'] as String?) ?? ''),
      schemaVersion:
          SchemaVersion.fromString((json['schemaVersion'] as String?) ?? ''),
      sourceEventMetadata: ManagedSourceEventMetadataSummary.fromJson(
          (json['sourceEventMetadata'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final aggregationDetail = this.aggregationDetail;
    final eventStatus = this.eventStatus;
    final messageComponents = this.messageComponents;
    final notificationType = this.notificationType;
    final schemaVersion = this.schemaVersion;
    final sourceEventMetadata = this.sourceEventMetadata;
    return {
      'aggregationDetail': aggregationDetail,
      'eventStatus': eventStatus.value,
      'messageComponents': messageComponents,
      'notificationType': notificationType.value,
      'schemaVersion': schemaVersion.value,
      'sourceEventMetadata': sourceEventMetadata,
    };
  }
}

/// Provides detailed information about the dimensions used for aggregation.
class AggregationDetail {
  /// Properties used to summarize aggregated events.
  final List<SummarizationDimensionDetail>? summarizationDimensions;

  AggregationDetail({
    this.summarizationDimensions,
  });

  factory AggregationDetail.fromJson(Map<String, dynamic> json) {
    return AggregationDetail(
      summarizationDimensions: (json['summarizationDimensions'] as List?)
          ?.nonNulls
          .map((e) =>
              SummarizationDimensionDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final summarizationDimensions = this.summarizationDimensions;
    return {
      if (summarizationDimensions != null)
        'summarizationDimensions': summarizationDimensions,
    };
  }
}

/// Provides detailed information about the dimensions used for event
/// summarization and aggregation.
class SummarizationDimensionDetail {
  /// The name of the SummarizationDimensionDetail.
  final String name;

  /// Value of the property used to summarize aggregated events.
  final String value;

  SummarizationDimensionDetail({
    required this.name,
    required this.value,
  });

  factory SummarizationDimensionDetail.fromJson(Map<String, dynamic> json) {
    return SummarizationDimensionDetail(
      name: (json['name'] as String?) ?? '',
      value: (json['value'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      'name': name,
      'value': value,
    };
  }
}

/// A ManagedNotificationChildEvent is a notification-focused representation of
/// an event. They contain semantic information used to create aggregated or
/// non-aggregated end-user notifications.
class ManagedNotificationChildEvent {
  /// The Amazon Resource Name (ARN) of the ManagedNotificationEvent that is
  /// associated with this Managed Notification Child Event.
  final String aggregateManagedNotificationEventArn;

  /// The unique identifier for a Managed Notification Child Event.
  final String id;
  final MessageComponents messageComponents;

  /// The type of event causing the notification.
  ///
  /// <ul>
  /// <li>
  /// Values:
  ///
  /// <ul>
  /// <li>
  /// <code>ALERT</code>
  ///
  /// <ul>
  /// <li>
  /// A notification about an event where something was triggered, initiated,
  /// reopened, deployed, or a threshold was breached.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>WARNING</code>
  ///
  /// <ul>
  /// <li>
  /// A notification about an event where an issue is about to arise. For example,
  /// something is approaching a threshold.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>ANNOUNCEMENT</code>
  ///
  /// <ul>
  /// <li>
  /// A notification about an important event. For example, a step in a workflow
  /// or escalation path or that a workflow was updated.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>INFORMATIONAL</code>
  ///
  /// <ul>
  /// <li>
  /// A notification about informational messages. For example, recommendations,
  /// service announcements, or reminders.
  /// </li>
  /// </ul> </li>
  /// </ul> </li>
  /// </ul>
  final NotificationType notificationType;

  /// The schema version of the Managed Notification Child Event.
  final SchemaVersion schemaVersion;

  /// A list of text values.
  final Map<String, TextPartValue> textParts;

  /// Provides detailed information about the dimensions used for event
  /// summarization and aggregation.
  final AggregationDetail? aggregationDetail;

  /// The end time of the event.
  final DateTime? endTime;

  /// The assesed nature of the event.
  ///
  /// <ul>
  /// <li>
  /// Values:
  ///
  /// <ul>
  /// <li>
  /// <code>HEALTHY</code>
  ///
  /// <ul>
  /// <li>
  /// All <code>EventRules</code> are <code>ACTIVE</code>.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>UNHEALTHY</code>
  ///
  /// <ul>
  /// <li>
  /// Some <code>EventRules</code> are <code>ACTIVE</code> and some are
  /// <code>INACTIVE</code>.
  /// </li>
  /// </ul> </li>
  /// </ul> </li>
  /// </ul>
  final EventStatus? eventStatus;

  /// The Organizational Unit Id that an Amazon Web Services account belongs to.
  final String? organizationalUnitId;

  /// The source event URL.
  final String? sourceEventDetailUrl;

  /// The detailed URL for the source event.
  final String? sourceEventDetailUrlDisplayText;

  /// The notification event start time.
  final DateTime? startTime;

  ManagedNotificationChildEvent({
    required this.aggregateManagedNotificationEventArn,
    required this.id,
    required this.messageComponents,
    required this.notificationType,
    required this.schemaVersion,
    required this.textParts,
    this.aggregationDetail,
    this.endTime,
    this.eventStatus,
    this.organizationalUnitId,
    this.sourceEventDetailUrl,
    this.sourceEventDetailUrlDisplayText,
    this.startTime,
  });

  factory ManagedNotificationChildEvent.fromJson(Map<String, dynamic> json) {
    return ManagedNotificationChildEvent(
      aggregateManagedNotificationEventArn:
          (json['aggregateManagedNotificationEventArn'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      messageComponents: MessageComponents.fromJson(
          (json['messageComponents'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      notificationType: NotificationType.fromString(
          (json['notificationType'] as String?) ?? ''),
      schemaVersion:
          SchemaVersion.fromString((json['schemaVersion'] as String?) ?? ''),
      textParts: ((json['textParts'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) =>
              MapEntry(k, TextPartValue.fromJson(e as Map<String, dynamic>))),
      aggregationDetail: json['aggregationDetail'] != null
          ? AggregationDetail.fromJson(
              json['aggregationDetail'] as Map<String, dynamic>)
          : null,
      endTime: timeStampFromJson(json['endTime']),
      eventStatus:
          (json['eventStatus'] as String?)?.let(EventStatus.fromString),
      organizationalUnitId: json['organizationalUnitId'] as String?,
      sourceEventDetailUrl: json['sourceEventDetailUrl'] as String?,
      sourceEventDetailUrlDisplayText:
          json['sourceEventDetailUrlDisplayText'] as String?,
      startTime: timeStampFromJson(json['startTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final aggregateManagedNotificationEventArn =
        this.aggregateManagedNotificationEventArn;
    final id = this.id;
    final messageComponents = this.messageComponents;
    final notificationType = this.notificationType;
    final schemaVersion = this.schemaVersion;
    final textParts = this.textParts;
    final aggregationDetail = this.aggregationDetail;
    final endTime = this.endTime;
    final eventStatus = this.eventStatus;
    final organizationalUnitId = this.organizationalUnitId;
    final sourceEventDetailUrl = this.sourceEventDetailUrl;
    final sourceEventDetailUrlDisplayText =
        this.sourceEventDetailUrlDisplayText;
    final startTime = this.startTime;
    return {
      'aggregateManagedNotificationEventArn':
          aggregateManagedNotificationEventArn,
      'id': id,
      'messageComponents': messageComponents,
      'notificationType': notificationType.value,
      'schemaVersion': schemaVersion.value,
      'textParts': textParts,
      if (aggregationDetail != null) 'aggregationDetail': aggregationDetail,
      if (endTime != null) 'endTime': iso8601ToJson(endTime),
      if (eventStatus != null) 'eventStatus': eventStatus.value,
      if (organizationalUnitId != null)
        'organizationalUnitId': organizationalUnitId,
      if (sourceEventDetailUrl != null)
        'sourceEventDetailUrl': sourceEventDetailUrl,
      if (sourceEventDetailUrlDisplayText != null)
        'sourceEventDetailUrlDisplayText': sourceEventDetailUrlDisplayText,
      if (startTime != null) 'startTime': iso8601ToJson(startTime),
    };
  }
}

class AccountContactType {
  static const accountPrimary = AccountContactType._('ACCOUNT_PRIMARY');
  static const accountAlternateBilling =
      AccountContactType._('ACCOUNT_ALTERNATE_BILLING');
  static const accountAlternateOperations =
      AccountContactType._('ACCOUNT_ALTERNATE_OPERATIONS');
  static const accountAlternateSecurity =
      AccountContactType._('ACCOUNT_ALTERNATE_SECURITY');

  final String value;

  const AccountContactType._(this.value);

  static const values = [
    accountPrimary,
    accountAlternateBilling,
    accountAlternateOperations,
    accountAlternateSecurity
  ];

  static AccountContactType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AccountContactType._(value));

  @override
  bool operator ==(other) =>
      other is AccountContactType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains a complete list of fields related to an <code>EventRule</code>.
class EventRuleStructure {
  /// The Amazon Resource Name (ARN) of the <code>EventRule</code>. CloudFormation
  /// stack generates this ARN and then uses this ARN to associate with the
  /// <code>NotificationConfiguration</code>.
  final String arn;

  /// The creation time of the <code>EventRule</code>.
  final DateTime creationTime;

  /// An additional event pattern used to further filter the events this
  /// <code>EventRule</code> receives.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-event-patterns.html">Amazon
  /// EventBridge event patterns</a> in the <i>Amazon EventBridge User Guide.</i>
  final String eventPattern;

  /// The event type this rule should match with the EventBridge events. It must
  /// match with atleast one of the valid EventBridge event types. For example,
  /// Amazon EC2 Instance State change Notification and Amazon CloudWatch State
  /// Change. For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-service-event.html#eb-service-event-delivery-level">Event
  /// delivery from Amazon Web Services services</a> in the <i> Amazon EventBridge
  /// User Guide</i>.
  final String eventType;

  /// A list of Amazon EventBridge Managed Rule ARNs associated with this
  /// <code>EventRule</code>.
  /// <note>
  /// These are created by User Notifications within your account so your
  /// <code>EventRules</code> can function.
  /// </note>
  final List<String> managedRules;

  /// The ARN for the <code>NotificationConfiguration</code> associated with this
  /// <code>EventRule</code>.
  final String notificationConfigurationArn;

  /// A list of Amazon Web Services Regions that send events to this
  /// <code>EventRule</code>.
  final List<String> regions;

  /// The event source this rule should match with the EventBridge event sources.
  /// It must match with atleast one of the valid EventBridge event sources. Only
  /// Amazon Web Services service sourced events are supported. For example,
  /// <code>aws.ec2</code> and <code>aws.cloudwatch</code>. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-service-event.html#eb-service-event-delivery-level">Event
  /// delivery from Amazon Web Services services</a> in the <i> Amazon EventBridge
  /// User Guide</i>.
  final String source;

  /// A list of an <code>EventRule</code>'s status by Region. Regions are mapped
  /// to <code>EventRuleStatusSummary</code>.
  final Map<String, EventRuleStatusSummary> statusSummaryByRegion;

  EventRuleStructure({
    required this.arn,
    required this.creationTime,
    required this.eventPattern,
    required this.eventType,
    required this.managedRules,
    required this.notificationConfigurationArn,
    required this.regions,
    required this.source,
    required this.statusSummaryByRegion,
  });

  factory EventRuleStructure.fromJson(Map<String, dynamic> json) {
    return EventRuleStructure(
      arn: (json['arn'] as String?) ?? '',
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      eventPattern: (json['eventPattern'] as String?) ?? '',
      eventType: (json['eventType'] as String?) ?? '',
      managedRules: ((json['managedRules'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      notificationConfigurationArn:
          (json['notificationConfigurationArn'] as String?) ?? '',
      regions: ((json['regions'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      source: (json['source'] as String?) ?? '',
      statusSummaryByRegion: ((json['statusSummaryByRegion']
                  as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(
              k, EventRuleStatusSummary.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final eventPattern = this.eventPattern;
    final eventType = this.eventType;
    final managedRules = this.managedRules;
    final notificationConfigurationArn = this.notificationConfigurationArn;
    final regions = this.regions;
    final source = this.source;
    final statusSummaryByRegion = this.statusSummaryByRegion;
    return {
      'arn': arn,
      'creationTime': iso8601ToJson(creationTime),
      'eventPattern': eventPattern,
      'eventType': eventType,
      'managedRules': managedRules,
      'notificationConfigurationArn': notificationConfigurationArn,
      'regions': regions,
      'source': source,
      'statusSummaryByRegion': statusSummaryByRegion,
    };
  }
}

/// Provides additional information about the current <code>EventRule</code>
/// status.
class EventRuleStatusSummary {
  /// A human-readable reason for <code>EventRuleStatus</code>.
  final String reason;

  /// The status of the <code>EventRule</code>.
  ///
  /// <ul>
  /// <li>
  /// Values:
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code>
  ///
  /// <ul>
  /// <li>
  /// The <code>EventRule</code> can process events.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>INACTIVE</code>
  ///
  /// <ul>
  /// <li>
  /// The <code>EventRule</code> may be unable to process events.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>CREATING</code>
  ///
  /// <ul>
  /// <li>
  /// The <code>EventRule</code> is being created.
  ///
  /// Only <code>GET</code> and <code>LIST</code> calls can be run.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>UPDATING</code>
  ///
  /// <ul>
  /// <li>
  /// The <code>EventRule</code> is being updated.
  ///
  /// Only <code>GET</code> and <code>LIST</code> calls can be run.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>DELETING</code>
  ///
  /// <ul>
  /// <li>
  /// The <code>EventRule</code> is being deleted.
  ///
  /// Only <code>GET</code> and <code>LIST</code> calls can be run.
  /// </li>
  /// </ul> </li>
  /// </ul> </li>
  /// </ul>
  final EventRuleStatus status;

  EventRuleStatusSummary({
    required this.reason,
    required this.status,
  });

  factory EventRuleStatusSummary.fromJson(Map<String, dynamic> json) {
    return EventRuleStatusSummary(
      reason: (json['reason'] as String?) ?? '',
      status: EventRuleStatus.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final reason = this.reason;
    final status = this.status;
    return {
      'reason': reason,
      'status': status.value,
    };
  }
}

class EventRuleStatus {
  static const active = EventRuleStatus._('ACTIVE');
  static const inactive = EventRuleStatus._('INACTIVE');
  static const creating = EventRuleStatus._('CREATING');
  static const updating = EventRuleStatus._('UPDATING');
  static const deleting = EventRuleStatus._('DELETING');

  final String value;

  const EventRuleStatus._(this.value);

  static const values = [active, inactive, creating, updating, deleting];

  static EventRuleStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EventRuleStatus._(value));

  @override
  bool operator ==(other) => other is EventRuleStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information about a member account.
class MemberAccount {
  /// The AWS account ID of the member account.
  final String accountId;

  /// The unique identifier of the organizational unit containing the member
  /// account.
  final String organizationalUnitId;

  /// The current status of the member account.
  final MemberAccountNotificationConfigurationStatus status;

  /// The reason for the current status of the member account.
  final String statusReason;

  /// The Amazon Resource Name (ARN) of the notification configuration associated
  /// with the member account.
  final String? notificationConfigurationArn;

  MemberAccount({
    required this.accountId,
    required this.organizationalUnitId,
    required this.status,
    required this.statusReason,
    this.notificationConfigurationArn,
  });

  factory MemberAccount.fromJson(Map<String, dynamic> json) {
    return MemberAccount(
      accountId: (json['accountId'] as String?) ?? '',
      organizationalUnitId: (json['organizationalUnitId'] as String?) ?? '',
      status: MemberAccountNotificationConfigurationStatus.fromString(
          (json['status'] as String?) ?? ''),
      statusReason: (json['statusReason'] as String?) ?? '',
      notificationConfigurationArn:
          json['notificationConfigurationArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final organizationalUnitId = this.organizationalUnitId;
    final status = this.status;
    final statusReason = this.statusReason;
    final notificationConfigurationArn = this.notificationConfigurationArn;
    return {
      'accountId': accountId,
      'organizationalUnitId': organizationalUnitId,
      'status': status.value,
      'statusReason': statusReason,
      if (notificationConfigurationArn != null)
        'notificationConfigurationArn': notificationConfigurationArn,
    };
  }
}

class MemberAccountNotificationConfigurationStatus {
  static const active =
      MemberAccountNotificationConfigurationStatus._('ACTIVE');
  static const pending =
      MemberAccountNotificationConfigurationStatus._('PENDING');
  static const inactive =
      MemberAccountNotificationConfigurationStatus._('INACTIVE');
  static const creating =
      MemberAccountNotificationConfigurationStatus._('CREATING');
  static const deleting =
      MemberAccountNotificationConfigurationStatus._('DELETING');

  final String value;

  const MemberAccountNotificationConfigurationStatus._(this.value);

  static const values = [active, pending, inactive, creating, deleting];

  static MemberAccountNotificationConfigurationStatus fromString(
          String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MemberAccountNotificationConfigurationStatus._(value));

  @override
  bool operator ==(other) =>
      other is MemberAccountNotificationConfigurationStatus &&
      other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Provides a summary of channel associations for a managed notification
/// configuration.
class ManagedNotificationChannelAssociationSummary {
  /// The unique identifier for the notification channel.
  final String channelIdentifier;

  /// The type of notification channel used for message delivery.
  ///
  /// <ul>
  /// <li>
  /// Values:
  ///
  /// <ul>
  /// <li>
  /// <code>ACCOUNT_CONTACT</code>
  ///
  /// <ul>
  /// <li>
  /// Delivers notifications to Account Managed contacts through the User
  /// Notification Service.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>MOBILE</code>
  ///
  /// <ul>
  /// <li>
  /// Delivers notifications through the Amazon Web Services Console Mobile
  /// Application to mobile devices.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>CHATBOT</code>
  ///
  /// <ul>
  /// <li>
  /// Delivers notifications through Amazon Q Developer in chat applications to
  /// collaboration platforms (Slack, Chime).
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>EMAIL</code>
  ///
  /// <ul>
  /// <li>
  /// Delivers notifications to email addresses.
  /// </li>
  /// </ul> </li>
  /// </ul> </li>
  /// </ul>
  final ChannelType channelType;

  /// Controls whether users can modify channel associations for a notification
  /// configuration.
  ///
  /// <ul>
  /// <li>
  /// Values:
  ///
  /// <ul>
  /// <li>
  /// <code>ENABLED</code>
  ///
  /// <ul>
  /// <li>
  /// Users can associate or disassociate channels with the notification
  /// configuration.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>DISABLED</code>
  ///
  /// <ul>
  /// <li>
  /// Users cannot associate or disassociate channels with the notification
  /// configuration.
  /// </li>
  /// </ul> </li>
  /// </ul> </li>
  /// </ul>
  final ChannelAssociationOverrideOption? overrideOption;

  ManagedNotificationChannelAssociationSummary({
    required this.channelIdentifier,
    required this.channelType,
    this.overrideOption,
  });

  factory ManagedNotificationChannelAssociationSummary.fromJson(
      Map<String, dynamic> json) {
    return ManagedNotificationChannelAssociationSummary(
      channelIdentifier: (json['channelIdentifier'] as String?) ?? '',
      channelType:
          ChannelType.fromString((json['channelType'] as String?) ?? ''),
      overrideOption: (json['overrideOption'] as String?)
          ?.let(ChannelAssociationOverrideOption.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final channelIdentifier = this.channelIdentifier;
    final channelType = this.channelType;
    final overrideOption = this.overrideOption;
    return {
      'channelIdentifier': channelIdentifier,
      'channelType': channelType.value,
      if (overrideOption != null) 'overrideOption': overrideOption.value,
    };
  }
}

class ChannelType {
  static const mobile = ChannelType._('MOBILE');
  static const chatbot = ChannelType._('CHATBOT');
  static const email = ChannelType._('EMAIL');
  static const accountContact = ChannelType._('ACCOUNT_CONTACT');

  final String value;

  const ChannelType._(this.value);

  static const values = [mobile, chatbot, email, accountContact];

  static ChannelType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ChannelType._(value));

  @override
  bool operator ==(other) => other is ChannelType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ChannelAssociationOverrideOption {
  static const enabled = ChannelAssociationOverrideOption._('ENABLED');
  static const disabled = ChannelAssociationOverrideOption._('DISABLED');

  final String value;

  const ChannelAssociationOverrideOption._(this.value);

  static const values = [enabled, disabled];

  static ChannelAssociationOverrideOption fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ChannelAssociationOverrideOption._(value));

  @override
  bool operator ==(other) =>
      other is ChannelAssociationOverrideOption && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
