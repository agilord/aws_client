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

/// Amazon Security Lake is a fully managed security data lake service. You can
/// use Security Lake to automatically centralize security data from cloud,
/// on-premises, and custom sources into a data lake that's stored in your
/// Amazon Web Services account. Amazon Web Services Organizations is an account
/// management service that lets you consolidate multiple Amazon Web Services
/// accounts into an organization that you create and centrally manage. With
/// Organizations, you can create member accounts and invite existing accounts
/// to join your organization. Security Lake helps you analyze security data for
/// a more complete understanding of your security posture across the entire
/// organization. It can also help you improve the protection of your workloads,
/// applications, and data.
///
/// The data lake is backed by Amazon Simple Storage Service (Amazon S3)
/// buckets, and you retain ownership over your data.
///
/// Amazon Security Lake integrates with CloudTrail, a service that provides a
/// record of actions taken by a user, role, or an Amazon Web Services service.
/// In Security Lake, CloudTrail captures API calls for Security Lake as events.
/// The calls captured include calls from the Security Lake console and code
/// calls to the Security Lake API operations. If you create a trail, you can
/// enable continuous delivery of CloudTrail events to an Amazon S3 bucket,
/// including events for Security Lake. If you don't configure a trail, you can
/// still view the most recent events in the CloudTrail console in Event
/// history. Using the information collected by CloudTrail you can determine the
/// request that was made to Security Lake, the IP address from which the
/// request was made, who made the request, when it was made, and additional
/// details. To learn more about Security Lake information in CloudTrail, see
/// the <a
/// href="https://docs.aws.amazon.com/security-lake/latest/userguide/securitylake-cloudtrail.html">Amazon
/// Security Lake User Guide</a>.
///
/// Security Lake automates the collection of security-related log and event
/// data from integrated Amazon Web Services and third-party services. It also
/// helps you manage the lifecycle of data with customizable retention and
/// replication settings. Security Lake converts ingested data into Apache
/// Parquet format and a standard open-source schema called the Open
/// Cybersecurity Schema Framework (OCSF).
///
/// Other Amazon Web Services and third-party services can subscribe to the data
/// that's stored in Security Lake for incident response and security data
/// analytics.
class SecurityLake {
  final _s.RestJsonProtocol _protocol;
  SecurityLake({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'securitylake',
            signingName: 'securitylake',
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

  /// Adds a natively supported Amazon Web Service as an Amazon Security Lake
  /// source. Enables source types for member accounts in required Amazon Web
  /// Services Regions, based on the parameters you specify. You can choose any
  /// source type in any Region for either accounts that are part of a trusted
  /// organization or standalone accounts. Once you add an Amazon Web Service as
  /// a source, Security Lake starts collecting logs and events from it.
  ///
  /// You can use this API only to enable natively supported Amazon Web Services
  /// as a source. Use <code>CreateCustomLogSource</code> to enable data
  /// collection from a custom source.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [sources] :
  /// Specify the natively-supported Amazon Web Services service to add as a
  /// source in Security Lake.
  Future<CreateAwsLogSourceResponse> createAwsLogSource({
    required List<AwsLogSourceConfiguration> sources,
  }) async {
    final $payload = <String, dynamic>{
      'sources': sources,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/datalake/logsources/aws',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAwsLogSourceResponse.fromJson(response);
  }

  /// Adds a third-party custom source in Amazon Security Lake, from the Amazon
  /// Web Services Region where you want to create a custom source. Security
  /// Lake can collect logs and events from third-party custom sources. After
  /// creating the appropriate IAM role to invoke Glue crawler, use this API to
  /// add a custom source name in Security Lake. This operation creates a
  /// partition in the Amazon S3 bucket for Security Lake as the target location
  /// for log files from the custom source. In addition, this operation also
  /// creates an associated Glue table and an Glue crawler.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [configuration] :
  /// The configuration for the third-party custom source.
  ///
  /// Parameter [sourceName] :
  /// Specify the name for a third-party custom source. This must be a
  /// Regionally unique value.
  ///
  /// Parameter [eventClasses] :
  /// The Open Cybersecurity Schema Framework (OCSF) event classes which
  /// describes the type of data that the custom source will send to Security
  /// Lake. The supported event classes are:
  ///
  /// <ul>
  /// <li>
  /// <code>ACCESS_ACTIVITY</code>
  /// </li>
  /// <li>
  /// <code>FILE_ACTIVITY</code>
  /// </li>
  /// <li>
  /// <code>KERNEL_ACTIVITY</code>
  /// </li>
  /// <li>
  /// <code>KERNEL_EXTENSION</code>
  /// </li>
  /// <li>
  /// <code>MEMORY_ACTIVITY</code>
  /// </li>
  /// <li>
  /// <code>MODULE_ACTIVITY</code>
  /// </li>
  /// <li>
  /// <code>PROCESS_ACTIVITY</code>
  /// </li>
  /// <li>
  /// <code>REGISTRY_KEY_ACTIVITY</code>
  /// </li>
  /// <li>
  /// <code>REGISTRY_VALUE_ACTIVITY</code>
  /// </li>
  /// <li>
  /// <code>RESOURCE_ACTIVITY</code>
  /// </li>
  /// <li>
  /// <code>SCHEDULED_JOB_ACTIVITY</code>
  /// </li>
  /// <li>
  /// <code>SECURITY_FINDING</code>
  /// </li>
  /// <li>
  /// <code>ACCOUNT_CHANGE</code>
  /// </li>
  /// <li>
  /// <code>AUTHENTICATION</code>
  /// </li>
  /// <li>
  /// <code>AUTHORIZATION</code>
  /// </li>
  /// <li>
  /// <code>ENTITY_MANAGEMENT_AUDIT</code>
  /// </li>
  /// <li>
  /// <code>DHCP_ACTIVITY</code>
  /// </li>
  /// <li>
  /// <code>NETWORK_ACTIVITY</code>
  /// </li>
  /// <li>
  /// <code>DNS_ACTIVITY</code>
  /// </li>
  /// <li>
  /// <code>FTP_ACTIVITY</code>
  /// </li>
  /// <li>
  /// <code>HTTP_ACTIVITY</code>
  /// </li>
  /// <li>
  /// <code>RDP_ACTIVITY</code>
  /// </li>
  /// <li>
  /// <code>SMB_ACTIVITY</code>
  /// </li>
  /// <li>
  /// <code>SSH_ACTIVITY</code>
  /// </li>
  /// <li>
  /// <code>CONFIG_STATE</code>
  /// </li>
  /// <li>
  /// <code>INVENTORY_INFO</code>
  /// </li>
  /// <li>
  /// <code>EMAIL_ACTIVITY</code>
  /// </li>
  /// <li>
  /// <code>API_ACTIVITY</code>
  /// </li>
  /// <li>
  /// <code>CLOUD_API</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [sourceVersion] :
  /// Specify the source version for the third-party custom source, to limit log
  /// collection to a specific version of custom data source.
  Future<CreateCustomLogSourceResponse> createCustomLogSource({
    required CustomLogSourceConfiguration configuration,
    required String sourceName,
    List<String>? eventClasses,
    String? sourceVersion,
  }) async {
    final $payload = <String, dynamic>{
      'configuration': configuration,
      'sourceName': sourceName,
      if (eventClasses != null) 'eventClasses': eventClasses,
      if (sourceVersion != null) 'sourceVersion': sourceVersion,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/datalake/logsources/custom',
      exceptionFnMap: _exceptionFns,
    );
    return CreateCustomLogSourceResponse.fromJson(response);
  }

  /// Initializes an Amazon Security Lake instance with the provided (or
  /// default) configuration. You can enable Security Lake in Amazon Web
  /// Services Regions with customized settings before enabling log collection
  /// in Regions. To specify particular Regions, configure these Regions using
  /// the <code>configurations</code> parameter. If you have already enabled
  /// Security Lake in a Region when you call this command, the command will
  /// update the Region if you provide new configuration parameters. If you have
  /// not already enabled Security Lake in the Region when you call this API, it
  /// will set up the data lake in the Region with the specified configurations.
  ///
  /// When you enable Security Lake, it starts ingesting security data after the
  /// <code>CreateAwsLogSource</code> call. This includes ingesting security
  /// data from sources, storing data, and making data accessible to
  /// subscribers. Security Lake also enables all the existing settings and
  /// resources that it stores or maintains for your Amazon Web Services account
  /// in the current Region, including security log and event data. For more
  /// information, see the <a
  /// href="https://docs.aws.amazon.com/security-lake/latest/userguide/what-is-security-lake.html">Amazon
  /// Security Lake User Guide</a>.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [configurations] :
  /// Specify the Region or Regions that will contribute data to the rollup
  /// region.
  ///
  /// Parameter [metaStoreManagerRoleArn] :
  /// The Amazon Resource Name (ARN) used to create and update the Glue table.
  /// This table contains partitions generated by the ingestion and
  /// normalization of Amazon Web Services log sources and custom sources.
  ///
  /// Parameter [tags] :
  /// An array of objects, one for each tag to associate with the data lake
  /// configuration. For each tag, you must specify both a tag key and a tag
  /// value. A tag value cannot be null, but it can be an empty string.
  Future<CreateDataLakeResponse> createDataLake({
    required List<DataLakeConfiguration> configurations,
    required String metaStoreManagerRoleArn,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'configurations': configurations,
      'metaStoreManagerRoleArn': metaStoreManagerRoleArn,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/datalake',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDataLakeResponse.fromJson(response);
  }

  /// Creates the specified notification subscription in Amazon Security Lake
  /// for the organization you specify.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [notificationEndpoint] :
  /// The Amazon Web Services account where you want to receive exception
  /// notifications.
  ///
  /// Parameter [subscriptionProtocol] :
  /// The subscription protocol to which exception notifications are posted.
  ///
  /// Parameter [exceptionTimeToLive] :
  /// The expiration period and time-to-live (TTL).
  Future<void> createDataLakeExceptionSubscription({
    required String notificationEndpoint,
    required String subscriptionProtocol,
    int? exceptionTimeToLive,
  }) async {
    _s.validateNumRange(
      'exceptionTimeToLive',
      exceptionTimeToLive,
      1,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      'notificationEndpoint': notificationEndpoint,
      'subscriptionProtocol': subscriptionProtocol,
      if (exceptionTimeToLive != null)
        'exceptionTimeToLive': exceptionTimeToLive,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/datalake/exceptions/subscription',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Automatically enables Amazon Security Lake for new member accounts in your
  /// organization. Security Lake is not automatically enabled for any existing
  /// member accounts in your organization.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [autoEnableNewAccount] :
  /// Enable Security Lake with the specified configuration settings, to begin
  /// collecting security data for new accounts in your organization.
  Future<void> createDataLakeOrganizationConfiguration({
    List<DataLakeAutoEnableNewAccountConfiguration>? autoEnableNewAccount,
  }) async {
    final $payload = <String, dynamic>{
      if (autoEnableNewAccount != null)
        'autoEnableNewAccount': autoEnableNewAccount,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/datalake/organization/configuration',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates a subscription permission for accounts that are already enabled in
  /// Amazon Security Lake. You can create a subscriber with access to data in
  /// the current Amazon Web Services Region.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [sources] :
  /// The supported Amazon Web Services from which logs and events are
  /// collected. Security Lake supports log and event collection for natively
  /// supported Amazon Web Services.
  ///
  /// Parameter [subscriberIdentity] :
  /// The AWS identity used to access your data.
  ///
  /// Parameter [subscriberName] :
  /// The name of your Security Lake subscriber account.
  ///
  /// Parameter [accessTypes] :
  /// The Amazon S3 or Lake Formation access type.
  ///
  /// Parameter [subscriberDescription] :
  /// The description for your subscriber account in Security Lake.
  ///
  /// Parameter [tags] :
  /// An array of objects, one for each tag to associate with the subscriber.
  /// For each tag, you must specify both a tag key and a tag value. A tag value
  /// cannot be null, but it can be an empty string.
  Future<CreateSubscriberResponse> createSubscriber({
    required List<LogSourceResource> sources,
    required AwsIdentity subscriberIdentity,
    required String subscriberName,
    List<AccessType>? accessTypes,
    String? subscriberDescription,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'sources': sources,
      'subscriberIdentity': subscriberIdentity,
      'subscriberName': subscriberName,
      if (accessTypes != null)
        'accessTypes': accessTypes.map((e) => e.toValue()).toList(),
      if (subscriberDescription != null)
        'subscriberDescription': subscriberDescription,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/subscribers',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSubscriberResponse.fromJson(response);
  }

  /// Notifies the subscriber when new data is written to the data lake for the
  /// sources that the subscriber consumes in Security Lake. You can create only
  /// one subscriber notification per subscriber.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [configuration] :
  /// Specify the configuration using which you want to create the subscriber
  /// notification.
  ///
  /// Parameter [subscriberId] :
  /// The subscriber ID for the notification subscription.
  Future<CreateSubscriberNotificationResponse> createSubscriberNotification({
    required NotificationConfiguration configuration,
    required String subscriberId,
  }) async {
    final $payload = <String, dynamic>{
      'configuration': configuration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v1/subscribers/${Uri.encodeComponent(subscriberId)}/notification',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSubscriberNotificationResponse.fromJson(response);
  }

  /// Removes a natively supported Amazon Web Service as an Amazon Security Lake
  /// source. You can remove a source for one or more Regions. When you remove
  /// the source, Security Lake stops collecting data from that source in the
  /// specified Regions and accounts, and subscribers can no longer consume new
  /// data from the source. However, subscribers can still consume data that
  /// Security Lake collected from the source before removal.
  ///
  /// You can choose any source type in any Amazon Web Services Region for
  /// either accounts that are part of a trusted organization or standalone
  /// accounts.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [sources] :
  /// Specify the natively-supported Amazon Web Services service to remove as a
  /// source in Security Lake.
  Future<DeleteAwsLogSourceResponse> deleteAwsLogSource({
    required List<AwsLogSourceConfiguration> sources,
  }) async {
    final $payload = <String, dynamic>{
      'sources': sources,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/datalake/logsources/aws/delete',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteAwsLogSourceResponse.fromJson(response);
  }

  /// Removes a custom log source from Amazon Security Lake, to stop sending
  /// data from the custom source to Security Lake.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [sourceName] :
  /// The source name of custom log source that you want to delete.
  ///
  /// Parameter [sourceVersion] :
  /// The source version for the third-party custom source. You can limit the
  /// custom source removal to the specified source version.
  Future<void> deleteCustomLogSource({
    required String sourceName,
    String? sourceVersion,
  }) async {
    final $query = <String, List<String>>{
      if (sourceVersion != null) 'sourceVersion': [sourceVersion],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v1/datalake/logsources/custom/${Uri.encodeComponent(sourceName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// When you disable Amazon Security Lake from your account, Security Lake is
  /// disabled in all Amazon Web Services Regions and it stops collecting data
  /// from your sources. Also, this API automatically takes steps to remove the
  /// account from Security Lake. However, Security Lake retains all of your
  /// existing settings and the resources that it created in your Amazon Web
  /// Services account in the current Amazon Web Services Region.
  ///
  /// The <code>DeleteDataLake</code> operation does not delete the data that is
  /// stored in your Amazon S3 bucket, which is owned by your Amazon Web
  /// Services account. For more information, see the <a
  /// href="https://docs.aws.amazon.com/security-lake/latest/userguide/disable-security-lake.html">Amazon
  /// Security Lake User Guide</a>.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [regions] :
  /// The list of Regions where Security Lake is enabled.
  Future<void> deleteDataLake({
    required List<String> regions,
  }) async {
    final $payload = <String, dynamic>{
      'regions': regions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/datalake/delete',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified notification subscription in Amazon Security Lake
  /// for the organization you specify.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  Future<void> deleteDataLakeExceptionSubscription() async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/datalake/exceptions/subscription',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Turns off automatic enablement of Amazon Security Lake for member accounts
  /// that are added to an organization in Organizations. Only the delegated
  /// Security Lake administrator for an organization can perform this
  /// operation. If the delegated Security Lake administrator performs this
  /// operation, new member accounts won't automatically contribute data to the
  /// data lake.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [autoEnableNewAccount] :
  /// Turns off automatic enablement of Security Lake for member accounts that
  /// are added to an organization.
  Future<void> deleteDataLakeOrganizationConfiguration({
    List<DataLakeAutoEnableNewAccountConfiguration>? autoEnableNewAccount,
  }) async {
    final $payload = <String, dynamic>{
      if (autoEnableNewAccount != null)
        'autoEnableNewAccount': autoEnableNewAccount,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/datalake/organization/configuration/delete',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the subscription permission and all notification settings for
  /// accounts that are already enabled in Amazon Security Lake. When you run
  /// <code>DeleteSubscriber</code>, the subscriber will no longer consume data
  /// from Security Lake and the subscriber is removed. This operation deletes
  /// the subscriber and removes access to data in the current Amazon Web
  /// Services Region.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [subscriberId] :
  /// A value created by Security Lake that uniquely identifies your
  /// <code>DeleteSubscriber</code> API request.
  Future<void> deleteSubscriber({
    required String subscriberId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/subscribers/${Uri.encodeComponent(subscriberId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified notification subscription in Amazon Security Lake
  /// for the organization you specify.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [subscriberId] :
  /// The ID of the Security Lake subscriber account.
  Future<void> deleteSubscriberNotification({
    required String subscriberId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v1/subscribers/${Uri.encodeComponent(subscriberId)}/notification',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the Amazon Security Lake delegated administrator account for the
  /// organization. This API can only be called by the organization management
  /// account. The organization management account cannot be the delegated
  /// administrator account.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  Future<void> deregisterDataLakeDelegatedAdministrator() async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/datalake/delegate',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves the details of exception notifications for the account in Amazon
  /// Security Lake.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  Future<GetDataLakeExceptionSubscriptionResponse>
      getDataLakeExceptionSubscription() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/datalake/exceptions/subscription',
      exceptionFnMap: _exceptionFns,
    );
    return GetDataLakeExceptionSubscriptionResponse.fromJson(response);
  }

  /// Retrieves the configuration that will be automatically set up for accounts
  /// added to the organization after the organization has onboarded to Amazon
  /// Security Lake. This API does not take input parameters.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  Future<GetDataLakeOrganizationConfigurationResponse>
      getDataLakeOrganizationConfiguration() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/datalake/organization/configuration',
      exceptionFnMap: _exceptionFns,
    );
    return GetDataLakeOrganizationConfigurationResponse.fromJson(response);
  }

  /// Retrieves a snapshot of the current Region, including whether Amazon
  /// Security Lake is enabled for those accounts and which sources Security
  /// Lake is collecting data from.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [accounts] :
  /// The Amazon Web Services account ID for which a static snapshot of the
  /// current Amazon Web Services Region, including enabled accounts and log
  /// sources, is retrieved.
  ///
  /// Parameter [maxResults] :
  /// The maximum limit of accounts for which the static snapshot of the current
  /// Region, including enabled accounts and log sources, is retrieved.
  ///
  /// Parameter [nextToken] :
  /// Lists if there are more results available. The value of nextToken is a
  /// unique pagination token for each page. Repeat the call using the returned
  /// token to retrieve the next page. Keep all other arguments unchanged.
  ///
  /// Each pagination token expires after 24 hours. Using an expired pagination
  /// token will return an HTTP 400 InvalidToken error.
  Future<GetDataLakeSourcesResponse> getDataLakeSources({
    List<String>? accounts,
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
      if (accounts != null) 'accounts': accounts,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/datalake/sources',
      exceptionFnMap: _exceptionFns,
    );
    return GetDataLakeSourcesResponse.fromJson(response);
  }

  /// Retrieves the subscription information for the specified subscription ID.
  /// You can get information about a specific subscriber.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [subscriberId] :
  /// A value created by Amazon Security Lake that uniquely identifies your
  /// <code>GetSubscriber</code> API request.
  Future<GetSubscriberResponse> getSubscriber({
    required String subscriberId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/subscribers/${Uri.encodeComponent(subscriberId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSubscriberResponse.fromJson(response);
  }

  /// Lists the Amazon Security Lake exceptions that you can use to find the
  /// source of problems and fix them.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// List the maximum number of failures in Security Lake.
  ///
  /// Parameter [nextToken] :
  /// List if there are more results available. The value of nextToken is a
  /// unique pagination token for each page. Repeat the call using the returned
  /// token to retrieve the next page. Keep all other arguments unchanged.
  ///
  /// Each pagination token expires after 24 hours. Using an expired pagination
  /// token will return an HTTP 400 InvalidToken error.
  ///
  /// Parameter [regions] :
  /// The Amazon Web Services Regions from which exceptions are retrieved.
  Future<ListDataLakeExceptionsResponse> listDataLakeExceptions({
    int? maxResults,
    String? nextToken,
    List<String>? regions,
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
      if (regions != null) 'regions': regions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/datalake/exceptions',
      exceptionFnMap: _exceptionFns,
    );
    return ListDataLakeExceptionsResponse.fromJson(response);
  }

  /// Retrieves the Amazon Security Lake configuration object for the specified
  /// Amazon Web Services Regions. You can use this operation to determine
  /// whether Security Lake is enabled for a Region.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [regions] :
  /// The list of Regions where Security Lake is enabled.
  Future<ListDataLakesResponse> listDataLakes({
    List<String>? regions,
  }) async {
    final $query = <String, List<String>>{
      if (regions != null) 'regions': regions,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/datalakes',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDataLakesResponse.fromJson(response);
  }

  /// Retrieves the log sources in the current Amazon Web Services Region.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [accounts] :
  /// The list of Amazon Web Services accounts for which log sources are
  /// displayed.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of accounts for which the log sources are displayed.
  ///
  /// Parameter [nextToken] :
  /// If nextToken is returned, there are more results available. You can repeat
  /// the call using the returned token to retrieve the next page.
  ///
  /// Parameter [regions] :
  /// The list of Regions for which log sources are displayed.
  ///
  /// Parameter [sources] :
  /// The list of sources for which log sources are displayed.
  Future<ListLogSourcesResponse> listLogSources({
    List<String>? accounts,
    int? maxResults,
    String? nextToken,
    List<String>? regions,
    List<LogSourceResource>? sources,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (accounts != null) 'accounts': accounts,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (regions != null) 'regions': regions,
      if (sources != null) 'sources': sources,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/datalake/logsources/list',
      exceptionFnMap: _exceptionFns,
    );
    return ListLogSourcesResponse.fromJson(response);
  }

  /// List all subscribers for the specific Amazon Security Lake account ID. You
  /// can retrieve a list of subscriptions associated with a specific
  /// organization or Amazon Web Services account.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of accounts for which the configuration is displayed.
  ///
  /// Parameter [nextToken] :
  /// If nextToken is returned, there are more results available. You can repeat
  /// the call using the returned token to retrieve the next page.
  Future<ListSubscribersResponse> listSubscribers({
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
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/subscribers',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSubscribersResponse.fromJson(response);
  }

  /// Retrieves the tags (keys and values) that are associated with an Amazon
  /// Security Lake resource: a subscriber, or the data lake configuration for
  /// your Amazon Web Services account in a particular Amazon Web Services
  /// Region.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the Amazon Security Lake resource for
  /// which you want to retrieve the tags.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Designates the Amazon Security Lake delegated administrator account for
  /// the organization. This API can only be called by the organization
  /// management account. The organization management account cannot be the
  /// delegated administrator account.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID of the Security Lake delegated
  /// administrator.
  Future<void> registerDataLakeDelegatedAdministrator({
    required String accountId,
  }) async {
    final $payload = <String, dynamic>{
      'accountId': accountId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/datalake/delegate',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Adds or updates one or more tags that are associated with an Amazon
  /// Security Lake resource: a subscriber, or the data lake configuration for
  /// your Amazon Web Services account in a particular Amazon Web Services
  /// Region. A <i>tag</i> is a label that you can define and associate with
  /// Amazon Web Services resources. Each tag consists of a required <i>tag
  /// key</i> and an associated <i>tag value</i>. A <i>tag key</i> is a general
  /// label that acts as a category for a more specific tag value. A <i>tag
  /// value</i> acts as a descriptor for a tag key. Tags can help you identify,
  /// categorize, and manage resources in different ways, such as by owner,
  /// environment, or other criteria. For more information, see <a
  /// href="https://docs.aws.amazon.com/security-lake/latest/userguide/tagging-resources.html">Tagging
  /// Amazon Security Lake resources</a> in the <i>Amazon Security Lake User
  /// Guide</i>.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the Amazon Security Lake resource to add
  /// or update the tags for.
  ///
  /// Parameter [tags] :
  /// An array of objects, one for each tag (key and value) to associate with
  /// the Amazon Security Lake resource. For each tag, you must specify both a
  /// tag key and a tag value. A tag value cannot be null, but it can be an
  /// empty string.
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes one or more tags (keys and values) from an Amazon Security Lake
  /// resource: a subscriber, or the data lake configuration for your Amazon Web
  /// Services account in a particular Amazon Web Services Region.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the Amazon Security Lake resource to
  /// remove one or more tags from.
  ///
  /// Parameter [tagKeys] :
  /// A list of one or more tag keys. For each value in the list, specify the
  /// tag key for a tag to remove from the Amazon Security Lake resource.
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
      requestUri: '/v1/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Specifies where to store your security data and for how long. You can add
  /// a rollup Region to consolidate data from multiple Amazon Web Services
  /// Regions.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [configurations] :
  /// Specify the Region or Regions that will contribute data to the rollup
  /// region.
  ///
  /// Parameter [metaStoreManagerRoleArn] :
  /// The Amazon Resource Name (ARN) used to create and update the Glue table.
  /// This table contains partitions generated by the ingestion and
  /// normalization of Amazon Web Services log sources and custom sources.
  Future<UpdateDataLakeResponse> updateDataLake({
    required List<DataLakeConfiguration> configurations,
    String? metaStoreManagerRoleArn,
  }) async {
    final $payload = <String, dynamic>{
      'configurations': configurations,
      if (metaStoreManagerRoleArn != null)
        'metaStoreManagerRoleArn': metaStoreManagerRoleArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v1/datalake',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateDataLakeResponse.fromJson(response);
  }

  /// Updates the specified notification subscription in Amazon Security Lake
  /// for the organization you specify.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [notificationEndpoint] :
  /// The account that is subscribed to receive exception notifications.
  ///
  /// Parameter [subscriptionProtocol] :
  /// The subscription protocol to which exception messages are posted.
  ///
  /// Parameter [exceptionTimeToLive] :
  /// The time-to-live (TTL) for the exception message to remain.
  Future<void> updateDataLakeExceptionSubscription({
    required String notificationEndpoint,
    required String subscriptionProtocol,
    int? exceptionTimeToLive,
  }) async {
    _s.validateNumRange(
      'exceptionTimeToLive',
      exceptionTimeToLive,
      1,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      'notificationEndpoint': notificationEndpoint,
      'subscriptionProtocol': subscriptionProtocol,
      if (exceptionTimeToLive != null)
        'exceptionTimeToLive': exceptionTimeToLive,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v1/datalake/exceptions/subscription',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates an existing subscription for the given Amazon Security Lake
  /// account ID. You can update a subscriber by changing the sources that the
  /// subscriber consumes data from.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [subscriberId] :
  /// A value created by Security Lake that uniquely identifies your
  /// subscription.
  ///
  /// Parameter [sources] :
  /// The supported Amazon Web Services from which logs and events are
  /// collected. For the list of supported Amazon Web Services, see the <a
  /// href="https://docs.aws.amazon.com/security-lake/latest/userguide/internal-sources.html">Amazon
  /// Security Lake User Guide</a>.
  ///
  /// Parameter [subscriberDescription] :
  /// The description of the Security Lake account subscriber.
  ///
  /// Parameter [subscriberIdentity] :
  /// The AWS identity used to access your data.
  ///
  /// Parameter [subscriberName] :
  /// The name of the Security Lake account subscriber.
  Future<UpdateSubscriberResponse> updateSubscriber({
    required String subscriberId,
    List<LogSourceResource>? sources,
    String? subscriberDescription,
    AwsIdentity? subscriberIdentity,
    String? subscriberName,
  }) async {
    final $payload = <String, dynamic>{
      if (sources != null) 'sources': sources,
      if (subscriberDescription != null)
        'subscriberDescription': subscriberDescription,
      if (subscriberIdentity != null) 'subscriberIdentity': subscriberIdentity,
      if (subscriberName != null) 'subscriberName': subscriberName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v1/subscribers/${Uri.encodeComponent(subscriberId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateSubscriberResponse.fromJson(response);
  }

  /// Updates an existing notification method for the subscription (SQS or HTTPs
  /// endpoint) or switches the notification subscription endpoint for a
  /// subscriber.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [configuration] :
  /// The configuration for subscriber notification.
  ///
  /// Parameter [subscriberId] :
  /// The subscription ID for which the subscription notification is specified.
  Future<UpdateSubscriberNotificationResponse> updateSubscriberNotification({
    required NotificationConfiguration configuration,
    required String subscriberId,
  }) async {
    final $payload = <String, dynamic>{
      'configuration': configuration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v1/subscribers/${Uri.encodeComponent(subscriberId)}/notification',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateSubscriberNotificationResponse.fromJson(response);
  }
}

enum AccessType {
  lakeformation,
  s3,
}

extension AccessTypeValueExtension on AccessType {
  String toValue() {
    switch (this) {
      case AccessType.lakeformation:
        return 'LAKEFORMATION';
      case AccessType.s3:
        return 'S3';
    }
  }
}

extension AccessTypeFromString on String {
  AccessType toAccessType() {
    switch (this) {
      case 'LAKEFORMATION':
        return AccessType.lakeformation;
      case 'S3':
        return AccessType.s3;
    }
    throw Exception('$this is not known in enum AccessType');
  }
}

/// The AWS identity.
class AwsIdentity {
  /// The external ID used to estalish trust relationship with the AWS identity.
  final String externalId;

  /// The AWS identity principal.
  final String principal;

  AwsIdentity({
    required this.externalId,
    required this.principal,
  });

  factory AwsIdentity.fromJson(Map<String, dynamic> json) {
    return AwsIdentity(
      externalId: json['externalId'] as String,
      principal: json['principal'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final externalId = this.externalId;
    final principal = this.principal;
    return {
      'externalId': externalId,
      'principal': principal,
    };
  }
}

/// The Security Lake logs source configuration file describes the information
/// needed to generate Security Lake logs.
class AwsLogSourceConfiguration {
  /// Specify the Regions where you want to enable Security Lake.
  final List<String> regions;

  /// The name for a Amazon Web Services source. This must be a Regionally unique
  /// value.
  final AwsLogSourceName sourceName;

  /// Specify the Amazon Web Services account information where you want to enable
  /// Security Lake.
  final List<String>? accounts;

  /// The version for a Amazon Web Services source. This must be a Regionally
  /// unique value.
  final String? sourceVersion;

  AwsLogSourceConfiguration({
    required this.regions,
    required this.sourceName,
    this.accounts,
    this.sourceVersion,
  });

  Map<String, dynamic> toJson() {
    final regions = this.regions;
    final sourceName = this.sourceName;
    final accounts = this.accounts;
    final sourceVersion = this.sourceVersion;
    return {
      'regions': regions,
      'sourceName': sourceName.toValue(),
      if (accounts != null) 'accounts': accounts,
      if (sourceVersion != null) 'sourceVersion': sourceVersion,
    };
  }
}

enum AwsLogSourceName {
  route53,
  vpcFlow,
  shFindings,
  cloudTrailMgmt,
  lambdaExecution,
  s3Data,
  eksAudit,
  waf,
}

extension AwsLogSourceNameValueExtension on AwsLogSourceName {
  String toValue() {
    switch (this) {
      case AwsLogSourceName.route53:
        return 'ROUTE53';
      case AwsLogSourceName.vpcFlow:
        return 'VPC_FLOW';
      case AwsLogSourceName.shFindings:
        return 'SH_FINDINGS';
      case AwsLogSourceName.cloudTrailMgmt:
        return 'CLOUD_TRAIL_MGMT';
      case AwsLogSourceName.lambdaExecution:
        return 'LAMBDA_EXECUTION';
      case AwsLogSourceName.s3Data:
        return 'S3_DATA';
      case AwsLogSourceName.eksAudit:
        return 'EKS_AUDIT';
      case AwsLogSourceName.waf:
        return 'WAF';
    }
  }
}

extension AwsLogSourceNameFromString on String {
  AwsLogSourceName toAwsLogSourceName() {
    switch (this) {
      case 'ROUTE53':
        return AwsLogSourceName.route53;
      case 'VPC_FLOW':
        return AwsLogSourceName.vpcFlow;
      case 'SH_FINDINGS':
        return AwsLogSourceName.shFindings;
      case 'CLOUD_TRAIL_MGMT':
        return AwsLogSourceName.cloudTrailMgmt;
      case 'LAMBDA_EXECUTION':
        return AwsLogSourceName.lambdaExecution;
      case 'S3_DATA':
        return AwsLogSourceName.s3Data;
      case 'EKS_AUDIT':
        return AwsLogSourceName.eksAudit;
      case 'WAF':
        return AwsLogSourceName.waf;
    }
    throw Exception('$this is not known in enum AwsLogSourceName');
  }
}

/// Amazon Security Lake can collect logs and events from natively-supported
/// Amazon Web Services services.
class AwsLogSourceResource {
  /// The name for a Amazon Web Services source. This must be a Regionally unique
  /// value.
  final AwsLogSourceName? sourceName;

  /// The version for a Amazon Web Services source. This must be a Regionally
  /// unique value.
  final String? sourceVersion;

  AwsLogSourceResource({
    this.sourceName,
    this.sourceVersion,
  });

  factory AwsLogSourceResource.fromJson(Map<String, dynamic> json) {
    return AwsLogSourceResource(
      sourceName: (json['sourceName'] as String?)?.toAwsLogSourceName(),
      sourceVersion: json['sourceVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sourceName = this.sourceName;
    final sourceVersion = this.sourceVersion;
    return {
      if (sourceName != null) 'sourceName': sourceName.toValue(),
      if (sourceVersion != null) 'sourceVersion': sourceVersion,
    };
  }
}

class CreateAwsLogSourceResponse {
  /// Lists all accounts in which enabling a natively supported Amazon Web Service
  /// as a Security Lake source failed. The failure occurred as these accounts are
  /// not part of an organization.
  final List<String>? failed;

  CreateAwsLogSourceResponse({
    this.failed,
  });

  factory CreateAwsLogSourceResponse.fromJson(Map<String, dynamic> json) {
    return CreateAwsLogSourceResponse(
      failed: (json['failed'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failed = this.failed;
    return {
      if (failed != null) 'failed': failed,
    };
  }
}

class CreateCustomLogSourceResponse {
  /// The created third-party custom source.
  final CustomLogSourceResource? source;

  CreateCustomLogSourceResponse({
    this.source,
  });

  factory CreateCustomLogSourceResponse.fromJson(Map<String, dynamic> json) {
    return CreateCustomLogSourceResponse(
      source: json['source'] != null
          ? CustomLogSourceResource.fromJson(
              json['source'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final source = this.source;
    return {
      if (source != null) 'source': source,
    };
  }
}

class CreateDataLakeExceptionSubscriptionResponse {
  CreateDataLakeExceptionSubscriptionResponse();

  factory CreateDataLakeExceptionSubscriptionResponse.fromJson(
      Map<String, dynamic> _) {
    return CreateDataLakeExceptionSubscriptionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CreateDataLakeOrganizationConfigurationResponse {
  CreateDataLakeOrganizationConfigurationResponse();

  factory CreateDataLakeOrganizationConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return CreateDataLakeOrganizationConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CreateDataLakeResponse {
  /// The created Security Lake configuration object.
  final List<DataLakeResource>? dataLakes;

  CreateDataLakeResponse({
    this.dataLakes,
  });

  factory CreateDataLakeResponse.fromJson(Map<String, dynamic> json) {
    return CreateDataLakeResponse(
      dataLakes: (json['dataLakes'] as List?)
          ?.whereNotNull()
          .map((e) => DataLakeResource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dataLakes = this.dataLakes;
    return {
      if (dataLakes != null) 'dataLakes': dataLakes,
    };
  }
}

class CreateSubscriberNotificationResponse {
  /// The subscriber endpoint to which exception messages are posted.
  final String? subscriberEndpoint;

  CreateSubscriberNotificationResponse({
    this.subscriberEndpoint,
  });

  factory CreateSubscriberNotificationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateSubscriberNotificationResponse(
      subscriberEndpoint: json['subscriberEndpoint'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final subscriberEndpoint = this.subscriberEndpoint;
    return {
      if (subscriberEndpoint != null) 'subscriberEndpoint': subscriberEndpoint,
    };
  }
}

class CreateSubscriberResponse {
  /// Retrieve information about the subscriber created using the
  /// <code>CreateSubscriber</code> API.
  final SubscriberResource? subscriber;

  CreateSubscriberResponse({
    this.subscriber,
  });

  factory CreateSubscriberResponse.fromJson(Map<String, dynamic> json) {
    return CreateSubscriberResponse(
      subscriber: json['subscriber'] != null
          ? SubscriberResource.fromJson(
              json['subscriber'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final subscriber = this.subscriber;
    return {
      if (subscriber != null) 'subscriber': subscriber,
    };
  }
}

/// The attributes of a third-party custom source.
class CustomLogSourceAttributes {
  /// The ARN of the Glue crawler.
  final String? crawlerArn;

  /// The ARN of the Glue database where results are written, such as:
  /// <code>arn:aws:daylight:us-east-1::database/sometable/*</code>.
  final String? databaseArn;

  /// The ARN of the Glue table.
  final String? tableArn;

  CustomLogSourceAttributes({
    this.crawlerArn,
    this.databaseArn,
    this.tableArn,
  });

  factory CustomLogSourceAttributes.fromJson(Map<String, dynamic> json) {
    return CustomLogSourceAttributes(
      crawlerArn: json['crawlerArn'] as String?,
      databaseArn: json['databaseArn'] as String?,
      tableArn: json['tableArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final crawlerArn = this.crawlerArn;
    final databaseArn = this.databaseArn;
    final tableArn = this.tableArn;
    return {
      if (crawlerArn != null) 'crawlerArn': crawlerArn,
      if (databaseArn != null) 'databaseArn': databaseArn,
      if (tableArn != null) 'tableArn': tableArn,
    };
  }
}

/// The configuration for the third-party custom source.
class CustomLogSourceConfiguration {
  /// The configuration for the Glue Crawler for the third-party custom source.
  final CustomLogSourceCrawlerConfiguration crawlerConfiguration;

  /// The identity of the log provider for the third-party custom source.
  final AwsIdentity providerIdentity;

  CustomLogSourceConfiguration({
    required this.crawlerConfiguration,
    required this.providerIdentity,
  });

  Map<String, dynamic> toJson() {
    final crawlerConfiguration = this.crawlerConfiguration;
    final providerIdentity = this.providerIdentity;
    return {
      'crawlerConfiguration': crawlerConfiguration,
      'providerIdentity': providerIdentity,
    };
  }
}

/// The configuration for the Glue Crawler for the third-party custom source.
class CustomLogSourceCrawlerConfiguration {
  /// The Amazon Resource Name (ARN) of the Identity and Access Management (IAM)
  /// role to be used by the Glue crawler. The recommended IAM policies are:
  ///
  /// <ul>
  /// <li>
  /// The managed policy <code>AWSGlueServiceRole</code>
  /// </li>
  /// <li>
  /// A custom policy granting access to your Amazon S3 Data Lake
  /// </li>
  /// </ul>
  final String roleArn;

  CustomLogSourceCrawlerConfiguration({
    required this.roleArn,
  });

  Map<String, dynamic> toJson() {
    final roleArn = this.roleArn;
    return {
      'roleArn': roleArn,
    };
  }
}

/// The details of the log provider for a third-party custom source.
class CustomLogSourceProvider {
  /// The location of the partition in the Amazon S3 bucket for Security Lake.
  final String? location;

  /// The ARN of the IAM role to be used by the entity putting logs into your
  /// custom source partition. Security Lake will apply the correct access
  /// policies to this role, but you must first manually create the trust policy
  /// for this role. The IAM role name must start with the text 'Security Lake'.
  /// The IAM role must trust the <code>logProviderAccountId</code> to assume the
  /// role.
  final String? roleArn;

  CustomLogSourceProvider({
    this.location,
    this.roleArn,
  });

  factory CustomLogSourceProvider.fromJson(Map<String, dynamic> json) {
    return CustomLogSourceProvider(
      location: json['location'] as String?,
      roleArn: json['roleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final location = this.location;
    final roleArn = this.roleArn;
    return {
      if (location != null) 'location': location,
      if (roleArn != null) 'roleArn': roleArn,
    };
  }
}

/// Amazon Security Lake can collect logs and events from third-party custom
/// sources.
class CustomLogSourceResource {
  /// The attributes of a third-party custom source.
  final CustomLogSourceAttributes? attributes;

  /// The details of the log provider for a third-party custom source.
  final CustomLogSourceProvider? provider;

  /// The name for a third-party custom source. This must be a Regionally unique
  /// value.
  final String? sourceName;

  /// The version for a third-party custom source. This must be a Regionally
  /// unique value.
  final String? sourceVersion;

  CustomLogSourceResource({
    this.attributes,
    this.provider,
    this.sourceName,
    this.sourceVersion,
  });

  factory CustomLogSourceResource.fromJson(Map<String, dynamic> json) {
    return CustomLogSourceResource(
      attributes: json['attributes'] != null
          ? CustomLogSourceAttributes.fromJson(
              json['attributes'] as Map<String, dynamic>)
          : null,
      provider: json['provider'] != null
          ? CustomLogSourceProvider.fromJson(
              json['provider'] as Map<String, dynamic>)
          : null,
      sourceName: json['sourceName'] as String?,
      sourceVersion: json['sourceVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final provider = this.provider;
    final sourceName = this.sourceName;
    final sourceVersion = this.sourceVersion;
    return {
      if (attributes != null) 'attributes': attributes,
      if (provider != null) 'provider': provider,
      if (sourceName != null) 'sourceName': sourceName,
      if (sourceVersion != null) 'sourceVersion': sourceVersion,
    };
  }
}

/// Automatically enable new organization accounts as member accounts from an
/// Amazon Security Lake administrator account.
class DataLakeAutoEnableNewAccountConfiguration {
  /// The Amazon Web Services Regions where Security Lake is automatically
  /// enabled.
  final String region;

  /// The Amazon Web Services sources that are automatically enabled in Security
  /// Lake.
  final List<AwsLogSourceResource> sources;

  DataLakeAutoEnableNewAccountConfiguration({
    required this.region,
    required this.sources,
  });

  factory DataLakeAutoEnableNewAccountConfiguration.fromJson(
      Map<String, dynamic> json) {
    return DataLakeAutoEnableNewAccountConfiguration(
      region: json['region'] as String,
      sources: (json['sources'] as List)
          .whereNotNull()
          .map((e) => AwsLogSourceResource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final region = this.region;
    final sources = this.sources;
    return {
      'region': region,
      'sources': sources,
    };
  }
}

/// Provides details of Amazon Security Lake object.
class DataLakeConfiguration {
  /// The Amazon Web Services Regions where Security Lake is automatically
  /// enabled.
  final String region;

  /// Provides encryption details of Amazon Security Lake object.
  final DataLakeEncryptionConfiguration? encryptionConfiguration;

  /// Provides lifecycle details of Amazon Security Lake object.
  final DataLakeLifecycleConfiguration? lifecycleConfiguration;

  /// Provides replication details of Amazon Security Lake object.
  final DataLakeReplicationConfiguration? replicationConfiguration;

  DataLakeConfiguration({
    required this.region,
    this.encryptionConfiguration,
    this.lifecycleConfiguration,
    this.replicationConfiguration,
  });

  Map<String, dynamic> toJson() {
    final region = this.region;
    final encryptionConfiguration = this.encryptionConfiguration;
    final lifecycleConfiguration = this.lifecycleConfiguration;
    final replicationConfiguration = this.replicationConfiguration;
    return {
      'region': region,
      if (encryptionConfiguration != null)
        'encryptionConfiguration': encryptionConfiguration,
      if (lifecycleConfiguration != null)
        'lifecycleConfiguration': lifecycleConfiguration,
      if (replicationConfiguration != null)
        'replicationConfiguration': replicationConfiguration,
    };
  }
}

/// Provides encryption details of Amazon Security Lake object.
class DataLakeEncryptionConfiguration {
  /// The id of KMS encryption key used by Amazon Security Lake to encrypt the
  /// Security Lake object.
  final String? kmsKeyId;

  DataLakeEncryptionConfiguration({
    this.kmsKeyId,
  });

  factory DataLakeEncryptionConfiguration.fromJson(Map<String, dynamic> json) {
    return DataLakeEncryptionConfiguration(
      kmsKeyId: json['kmsKeyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final kmsKeyId = this.kmsKeyId;
    return {
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
    };
  }
}

/// The details for an Amazon Security Lake exception.
class DataLakeException {
  /// The underlying exception of a Security Lake exception.
  final String? exception;

  /// The Amazon Web Services Regions where the exception occurred.
  final String? region;

  /// List of all remediation steps for a Security Lake exception.
  final String? remediation;

  /// This error can occur if you configure the wrong timestamp format, or if the
  /// subset of entries used for validation had errors or missing values.
  final DateTime? timestamp;

  DataLakeException({
    this.exception,
    this.region,
    this.remediation,
    this.timestamp,
  });

  factory DataLakeException.fromJson(Map<String, dynamic> json) {
    return DataLakeException(
      exception: json['exception'] as String?,
      region: json['region'] as String?,
      remediation: json['remediation'] as String?,
      timestamp: timeStampFromJson(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final exception = this.exception;
    final region = this.region;
    final remediation = this.remediation;
    final timestamp = this.timestamp;
    return {
      if (exception != null) 'exception': exception,
      if (region != null) 'region': region,
      if (remediation != null) 'remediation': remediation,
      if (timestamp != null) 'timestamp': iso8601ToJson(timestamp),
    };
  }
}

/// Provides lifecycle details of Amazon Security Lake object.
class DataLakeLifecycleConfiguration {
  /// Provides data expiration details of Amazon Security Lake object.
  final DataLakeLifecycleExpiration? expiration;

  /// Provides data storage transition details of Amazon Security Lake object.
  final List<DataLakeLifecycleTransition>? transitions;

  DataLakeLifecycleConfiguration({
    this.expiration,
    this.transitions,
  });

  factory DataLakeLifecycleConfiguration.fromJson(Map<String, dynamic> json) {
    return DataLakeLifecycleConfiguration(
      expiration: json['expiration'] != null
          ? DataLakeLifecycleExpiration.fromJson(
              json['expiration'] as Map<String, dynamic>)
          : null,
      transitions: (json['transitions'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DataLakeLifecycleTransition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final expiration = this.expiration;
    final transitions = this.transitions;
    return {
      if (expiration != null) 'expiration': expiration,
      if (transitions != null) 'transitions': transitions,
    };
  }
}

/// Provide expiration lifecycle details of Amazon Security Lake object.
class DataLakeLifecycleExpiration {
  /// Number of days before data expires in the Amazon Security Lake object.
  final int? days;

  DataLakeLifecycleExpiration({
    this.days,
  });

  factory DataLakeLifecycleExpiration.fromJson(Map<String, dynamic> json) {
    return DataLakeLifecycleExpiration(
      days: json['days'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final days = this.days;
    return {
      if (days != null) 'days': days,
    };
  }
}

/// Provide transition lifecycle details of Amazon Security Lake object.
class DataLakeLifecycleTransition {
  /// Number of days before data transitions to a different S3 Storage Class in
  /// the Amazon Security Lake object.
  final int? days;

  /// The range of storage classes that you can choose from based on the data
  /// access, resiliency, and cost requirements of your workloads.
  final String? storageClass;

  DataLakeLifecycleTransition({
    this.days,
    this.storageClass,
  });

  factory DataLakeLifecycleTransition.fromJson(Map<String, dynamic> json) {
    return DataLakeLifecycleTransition(
      days: json['days'] as int?,
      storageClass: json['storageClass'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final days = this.days;
    final storageClass = this.storageClass;
    return {
      if (days != null) 'days': days,
      if (storageClass != null) 'storageClass': storageClass,
    };
  }
}

/// Provides replication details for objects stored in the Amazon Security Lake
/// data lake.
class DataLakeReplicationConfiguration {
  /// Specifies one or more centralized rollup Regions. The Amazon Web Services
  /// Region specified in the <code>region</code> parameter of the <a
  /// href="https://docs.aws.amazon.com/security-lake/latest/APIReference/API_CreateDataLake.html">
  /// <code>CreateDataLake</code> </a> or <a
  /// href="https://docs.aws.amazon.com/security-lake/latest/APIReference/API_UpdateDataLake.html">
  /// <code>UpdateDataLake</code> </a> operations contributes data to the rollup
  /// Region or Regions specified in this parameter.
  ///
  /// Replication enables automatic, asynchronous copying of objects across Amazon
  /// S3 buckets. S3 buckets that are configured for object replication can be
  /// owned by the same Amazon Web Services account or by different accounts. You
  /// can replicate objects to a single destination bucket or to multiple
  /// destination buckets. The destination buckets can be in different Regions or
  /// within the same Region as the source bucket.
  final List<String>? regions;

  /// Replication settings for the Amazon S3 buckets. This parameter uses the
  /// Identity and Access Management (IAM) role you created that is managed by
  /// Security Lake, to ensure the replication setting is correct.
  final String? roleArn;

  DataLakeReplicationConfiguration({
    this.regions,
    this.roleArn,
  });

  factory DataLakeReplicationConfiguration.fromJson(Map<String, dynamic> json) {
    return DataLakeReplicationConfiguration(
      regions: (json['regions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      roleArn: json['roleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final regions = this.regions;
    final roleArn = this.roleArn;
    return {
      if (regions != null) 'regions': regions,
      if (roleArn != null) 'roleArn': roleArn,
    };
  }
}

/// Provides details of Amazon Security Lake object.
class DataLakeResource {
  /// The Amazon Resource Name (ARN) created by you to provide to the subscriber.
  /// For more information about ARNs and how to use them in policies, see the <a
  /// href="https://docs.aws.amazon.com/security-lake/latest/userguide/subscriber-management.html">Amazon
  /// Security Lake User Guide</a>.
  final String dataLakeArn;

  /// The Amazon Web Services Regions where Security Lake is enabled.
  final String region;

  /// Retrieves the status of the configuration operation for an account in Amazon
  /// Security Lake.
  final DataLakeStatus? createStatus;

  /// Provides encryption details of Amazon Security Lake object.
  final DataLakeEncryptionConfiguration? encryptionConfiguration;

  /// Provides lifecycle details of Amazon Security Lake object.
  final DataLakeLifecycleConfiguration? lifecycleConfiguration;

  /// Provides replication details of Amazon Security Lake object.
  final DataLakeReplicationConfiguration? replicationConfiguration;

  /// The ARN for the Amazon Security Lake Amazon S3 bucket.
  final String? s3BucketArn;

  /// The status of the last <code>UpdateDataLake </code>or
  /// <code>DeleteDataLake</code> API request.
  final DataLakeUpdateStatus? updateStatus;

  DataLakeResource({
    required this.dataLakeArn,
    required this.region,
    this.createStatus,
    this.encryptionConfiguration,
    this.lifecycleConfiguration,
    this.replicationConfiguration,
    this.s3BucketArn,
    this.updateStatus,
  });

  factory DataLakeResource.fromJson(Map<String, dynamic> json) {
    return DataLakeResource(
      dataLakeArn: json['dataLakeArn'] as String,
      region: json['region'] as String,
      createStatus: (json['createStatus'] as String?)?.toDataLakeStatus(),
      encryptionConfiguration: json['encryptionConfiguration'] != null
          ? DataLakeEncryptionConfiguration.fromJson(
              json['encryptionConfiguration'] as Map<String, dynamic>)
          : null,
      lifecycleConfiguration: json['lifecycleConfiguration'] != null
          ? DataLakeLifecycleConfiguration.fromJson(
              json['lifecycleConfiguration'] as Map<String, dynamic>)
          : null,
      replicationConfiguration: json['replicationConfiguration'] != null
          ? DataLakeReplicationConfiguration.fromJson(
              json['replicationConfiguration'] as Map<String, dynamic>)
          : null,
      s3BucketArn: json['s3BucketArn'] as String?,
      updateStatus: json['updateStatus'] != null
          ? DataLakeUpdateStatus.fromJson(
              json['updateStatus'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dataLakeArn = this.dataLakeArn;
    final region = this.region;
    final createStatus = this.createStatus;
    final encryptionConfiguration = this.encryptionConfiguration;
    final lifecycleConfiguration = this.lifecycleConfiguration;
    final replicationConfiguration = this.replicationConfiguration;
    final s3BucketArn = this.s3BucketArn;
    final updateStatus = this.updateStatus;
    return {
      'dataLakeArn': dataLakeArn,
      'region': region,
      if (createStatus != null) 'createStatus': createStatus.toValue(),
      if (encryptionConfiguration != null)
        'encryptionConfiguration': encryptionConfiguration,
      if (lifecycleConfiguration != null)
        'lifecycleConfiguration': lifecycleConfiguration,
      if (replicationConfiguration != null)
        'replicationConfiguration': replicationConfiguration,
      if (s3BucketArn != null) 's3BucketArn': s3BucketArn,
      if (updateStatus != null) 'updateStatus': updateStatus,
    };
  }
}

/// Amazon Security Lake collects logs and events from supported Amazon Web
/// Services and custom sources. For the list of supported Amazon Web Services,
/// see the <a
/// href="https://docs.aws.amazon.com/security-lake/latest/userguide/internal-sources.html">Amazon
/// Security Lake User Guide</a>.
class DataLakeSource {
  /// The ID of the Security Lake account for which logs are collected.
  final String? account;

  /// The Open Cybersecurity Schema Framework (OCSF) event classes which describes
  /// the type of data that the custom source will send to Security Lake. The
  /// supported event classes are:
  ///
  /// <ul>
  /// <li>
  /// <code>ACCESS_ACTIVITY</code>
  /// </li>
  /// <li>
  /// <code>FILE_ACTIVITY</code>
  /// </li>
  /// <li>
  /// <code>KERNEL_ACTIVITY</code>
  /// </li>
  /// <li>
  /// <code>KERNEL_EXTENSION</code>
  /// </li>
  /// <li>
  /// <code>MEMORY_ACTIVITY</code>
  /// </li>
  /// <li>
  /// <code>MODULE_ACTIVITY</code>
  /// </li>
  /// <li>
  /// <code>PROCESS_ACTIVITY</code>
  /// </li>
  /// <li>
  /// <code>REGISTRY_KEY_ACTIVITY</code>
  /// </li>
  /// <li>
  /// <code>REGISTRY_VALUE_ACTIVITY</code>
  /// </li>
  /// <li>
  /// <code>RESOURCE_ACTIVITY</code>
  /// </li>
  /// <li>
  /// <code>SCHEDULED_JOB_ACTIVITY</code>
  /// </li>
  /// <li>
  /// <code>SECURITY_FINDING</code>
  /// </li>
  /// <li>
  /// <code>ACCOUNT_CHANGE</code>
  /// </li>
  /// <li>
  /// <code>AUTHENTICATION</code>
  /// </li>
  /// <li>
  /// <code>AUTHORIZATION</code>
  /// </li>
  /// <li>
  /// <code>ENTITY_MANAGEMENT_AUDIT</code>
  /// </li>
  /// <li>
  /// <code>DHCP_ACTIVITY</code>
  /// </li>
  /// <li>
  /// <code>NETWORK_ACTIVITY</code>
  /// </li>
  /// <li>
  /// <code>DNS_ACTIVITY</code>
  /// </li>
  /// <li>
  /// <code>FTP_ACTIVITY</code>
  /// </li>
  /// <li>
  /// <code>HTTP_ACTIVITY</code>
  /// </li>
  /// <li>
  /// <code>RDP_ACTIVITY</code>
  /// </li>
  /// <li>
  /// <code>SMB_ACTIVITY</code>
  /// </li>
  /// <li>
  /// <code>SSH_ACTIVITY</code>
  /// </li>
  /// <li>
  /// <code>CONFIG_STATE</code>
  /// </li>
  /// <li>
  /// <code>INVENTORY_INFO</code>
  /// </li>
  /// <li>
  /// <code>EMAIL_ACTIVITY</code>
  /// </li>
  /// <li>
  /// <code>API_ACTIVITY</code>
  /// </li>
  /// <li>
  /// <code>CLOUD_API</code>
  /// </li>
  /// </ul>
  final List<String>? eventClasses;

  /// The supported Amazon Web Services from which logs and events are collected.
  /// Amazon Security Lake supports log and event collection for natively
  /// supported Amazon Web Services.
  final String? sourceName;

  /// The log status for the Security Lake account.
  final List<DataLakeSourceStatus>? sourceStatuses;

  DataLakeSource({
    this.account,
    this.eventClasses,
    this.sourceName,
    this.sourceStatuses,
  });

  factory DataLakeSource.fromJson(Map<String, dynamic> json) {
    return DataLakeSource(
      account: json['account'] as String?,
      eventClasses: (json['eventClasses'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      sourceName: json['sourceName'] as String?,
      sourceStatuses: (json['sourceStatuses'] as List?)
          ?.whereNotNull()
          .map((e) => DataLakeSourceStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final account = this.account;
    final eventClasses = this.eventClasses;
    final sourceName = this.sourceName;
    final sourceStatuses = this.sourceStatuses;
    return {
      if (account != null) 'account': account,
      if (eventClasses != null) 'eventClasses': eventClasses,
      if (sourceName != null) 'sourceName': sourceName,
      if (sourceStatuses != null) 'sourceStatuses': sourceStatuses,
    };
  }
}

/// Retrieves the Logs status for the Amazon Security Lake account.
class DataLakeSourceStatus {
  /// Defines path the stored logs are available which has information on your
  /// systems, applications, and services.
  final String? resource;

  /// The health status of services, including error codes and patterns.
  final SourceCollectionStatus? status;

  DataLakeSourceStatus({
    this.resource,
    this.status,
  });

  factory DataLakeSourceStatus.fromJson(Map<String, dynamic> json) {
    return DataLakeSourceStatus(
      resource: json['resource'] as String?,
      status: (json['status'] as String?)?.toSourceCollectionStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final resource = this.resource;
    final status = this.status;
    return {
      if (resource != null) 'resource': resource,
      if (status != null) 'status': status.toValue(),
    };
  }
}

enum DataLakeStatus {
  initialized,
  pending,
  completed,
  failed,
}

extension DataLakeStatusValueExtension on DataLakeStatus {
  String toValue() {
    switch (this) {
      case DataLakeStatus.initialized:
        return 'INITIALIZED';
      case DataLakeStatus.pending:
        return 'PENDING';
      case DataLakeStatus.completed:
        return 'COMPLETED';
      case DataLakeStatus.failed:
        return 'FAILED';
    }
  }
}

extension DataLakeStatusFromString on String {
  DataLakeStatus toDataLakeStatus() {
    switch (this) {
      case 'INITIALIZED':
        return DataLakeStatus.initialized;
      case 'PENDING':
        return DataLakeStatus.pending;
      case 'COMPLETED':
        return DataLakeStatus.completed;
      case 'FAILED':
        return DataLakeStatus.failed;
    }
    throw Exception('$this is not known in enum DataLakeStatus');
  }
}

/// The details of the last <code>UpdateDataLake</code> or
/// <code>DeleteDataLake</code> API request which failed.
class DataLakeUpdateException {
  /// The reason code for the exception of the last <code>UpdateDataLake</code> or
  /// <code>DeleteDataLake</code> API request.
  final String? code;

  /// The reason for the exception of the last <code>UpdateDataLake</code>or
  /// <code>DeleteDataLake</code> API request.
  final String? reason;

  DataLakeUpdateException({
    this.code,
    this.reason,
  });

  factory DataLakeUpdateException.fromJson(Map<String, dynamic> json) {
    return DataLakeUpdateException(
      code: json['code'] as String?,
      reason: json['reason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final reason = this.reason;
    return {
      if (code != null) 'code': code,
      if (reason != null) 'reason': reason,
    };
  }
}

/// The status of the last <code>UpdateDataLake</code> or
/// <code>DeleteDataLake</code> API request. This is set to Completed after the
/// configuration is updated, or removed if deletion of the data lake is
/// successful.
class DataLakeUpdateStatus {
  /// The details of the last <code>UpdateDataLake</code>or
  /// <code>DeleteDataLake</code> API request which failed.
  final DataLakeUpdateException? exception;

  /// The unique ID for the last <code>UpdateDataLake</code> or
  /// <code>DeleteDataLake</code> API request.
  final String? requestId;

  /// The status of the last <code>UpdateDataLake</code> or
  /// <code>DeleteDataLake</code> API request that was requested.
  final DataLakeStatus? status;

  DataLakeUpdateStatus({
    this.exception,
    this.requestId,
    this.status,
  });

  factory DataLakeUpdateStatus.fromJson(Map<String, dynamic> json) {
    return DataLakeUpdateStatus(
      exception: json['exception'] != null
          ? DataLakeUpdateException.fromJson(
              json['exception'] as Map<String, dynamic>)
          : null,
      requestId: json['requestId'] as String?,
      status: (json['status'] as String?)?.toDataLakeStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final exception = this.exception;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (exception != null) 'exception': exception,
      if (requestId != null) 'requestId': requestId,
      if (status != null) 'status': status.toValue(),
    };
  }
}

class DeleteAwsLogSourceResponse {
  /// Deletion of the Amazon Web Services sources failed as the account is not a
  /// part of the organization.
  final List<String>? failed;

  DeleteAwsLogSourceResponse({
    this.failed,
  });

  factory DeleteAwsLogSourceResponse.fromJson(Map<String, dynamic> json) {
    return DeleteAwsLogSourceResponse(
      failed: (json['failed'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failed = this.failed;
    return {
      if (failed != null) 'failed': failed,
    };
  }
}

class DeleteCustomLogSourceResponse {
  DeleteCustomLogSourceResponse();

  factory DeleteCustomLogSourceResponse.fromJson(Map<String, dynamic> _) {
    return DeleteCustomLogSourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteDataLakeExceptionSubscriptionResponse {
  DeleteDataLakeExceptionSubscriptionResponse();

  factory DeleteDataLakeExceptionSubscriptionResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteDataLakeExceptionSubscriptionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteDataLakeOrganizationConfigurationResponse {
  DeleteDataLakeOrganizationConfigurationResponse();

  factory DeleteDataLakeOrganizationConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteDataLakeOrganizationConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteDataLakeResponse {
  DeleteDataLakeResponse();

  factory DeleteDataLakeResponse.fromJson(Map<String, dynamic> _) {
    return DeleteDataLakeResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteSubscriberNotificationResponse {
  DeleteSubscriberNotificationResponse();

  factory DeleteSubscriberNotificationResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteSubscriberNotificationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteSubscriberResponse {
  DeleteSubscriberResponse();

  factory DeleteSubscriberResponse.fromJson(Map<String, dynamic> _) {
    return DeleteSubscriberResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeregisterDataLakeDelegatedAdministratorResponse {
  DeregisterDataLakeDelegatedAdministratorResponse();

  factory DeregisterDataLakeDelegatedAdministratorResponse.fromJson(
      Map<String, dynamic> _) {
    return DeregisterDataLakeDelegatedAdministratorResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class GetDataLakeExceptionSubscriptionResponse {
  /// The expiration period and time-to-live (TTL).
  final int? exceptionTimeToLive;

  /// The Amazon Web Services account where you receive exception notifications.
  final String? notificationEndpoint;

  /// The subscription protocol to which exception notifications are posted.
  final String? subscriptionProtocol;

  GetDataLakeExceptionSubscriptionResponse({
    this.exceptionTimeToLive,
    this.notificationEndpoint,
    this.subscriptionProtocol,
  });

  factory GetDataLakeExceptionSubscriptionResponse.fromJson(
      Map<String, dynamic> json) {
    return GetDataLakeExceptionSubscriptionResponse(
      exceptionTimeToLive: json['exceptionTimeToLive'] as int?,
      notificationEndpoint: json['notificationEndpoint'] as String?,
      subscriptionProtocol: json['subscriptionProtocol'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final exceptionTimeToLive = this.exceptionTimeToLive;
    final notificationEndpoint = this.notificationEndpoint;
    final subscriptionProtocol = this.subscriptionProtocol;
    return {
      if (exceptionTimeToLive != null)
        'exceptionTimeToLive': exceptionTimeToLive,
      if (notificationEndpoint != null)
        'notificationEndpoint': notificationEndpoint,
      if (subscriptionProtocol != null)
        'subscriptionProtocol': subscriptionProtocol,
    };
  }
}

class GetDataLakeOrganizationConfigurationResponse {
  /// The configuration for new accounts.
  final List<DataLakeAutoEnableNewAccountConfiguration>? autoEnableNewAccount;

  GetDataLakeOrganizationConfigurationResponse({
    this.autoEnableNewAccount,
  });

  factory GetDataLakeOrganizationConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetDataLakeOrganizationConfigurationResponse(
      autoEnableNewAccount: (json['autoEnableNewAccount'] as List?)
          ?.whereNotNull()
          .map((e) => DataLakeAutoEnableNewAccountConfiguration.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final autoEnableNewAccount = this.autoEnableNewAccount;
    return {
      if (autoEnableNewAccount != null)
        'autoEnableNewAccount': autoEnableNewAccount,
    };
  }
}

class GetDataLakeSourcesResponse {
  /// The Amazon Resource Name (ARN) created by you to provide to the subscriber.
  /// For more information about ARNs and how to use them in policies, see the <a
  /// href="https://docs.aws.amazon.com/security-lake/latest/userguide/subscriber-management.html">Amazon
  /// Security Lake User Guide</a>.
  final String? dataLakeArn;

  /// The list of enabled accounts and enabled sources.
  final List<DataLakeSource>? dataLakeSources;

  /// Lists if there are more results available. The value of nextToken is a
  /// unique pagination token for each page. Repeat the call using the returned
  /// token to retrieve the next page. Keep all other arguments unchanged.
  ///
  /// Each pagination token expires after 24 hours. Using an expired pagination
  /// token will return an HTTP 400 InvalidToken error.
  final String? nextToken;

  GetDataLakeSourcesResponse({
    this.dataLakeArn,
    this.dataLakeSources,
    this.nextToken,
  });

  factory GetDataLakeSourcesResponse.fromJson(Map<String, dynamic> json) {
    return GetDataLakeSourcesResponse(
      dataLakeArn: json['dataLakeArn'] as String?,
      dataLakeSources: (json['dataLakeSources'] as List?)
          ?.whereNotNull()
          .map((e) => DataLakeSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataLakeArn = this.dataLakeArn;
    final dataLakeSources = this.dataLakeSources;
    final nextToken = this.nextToken;
    return {
      if (dataLakeArn != null) 'dataLakeArn': dataLakeArn,
      if (dataLakeSources != null) 'dataLakeSources': dataLakeSources,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class GetSubscriberResponse {
  /// The subscriber information for the specified subscriber ID.
  final SubscriberResource? subscriber;

  GetSubscriberResponse({
    this.subscriber,
  });

  factory GetSubscriberResponse.fromJson(Map<String, dynamic> json) {
    return GetSubscriberResponse(
      subscriber: json['subscriber'] != null
          ? SubscriberResource.fromJson(
              json['subscriber'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final subscriber = this.subscriber;
    return {
      if (subscriber != null) 'subscriber': subscriber,
    };
  }
}

enum HttpMethod {
  post,
  put,
}

extension HttpMethodValueExtension on HttpMethod {
  String toValue() {
    switch (this) {
      case HttpMethod.post:
        return 'POST';
      case HttpMethod.put:
        return 'PUT';
    }
  }
}

extension HttpMethodFromString on String {
  HttpMethod toHttpMethod() {
    switch (this) {
      case 'POST':
        return HttpMethod.post;
      case 'PUT':
        return HttpMethod.put;
    }
    throw Exception('$this is not known in enum HttpMethod');
  }
}

/// The configurations for HTTPS subscriber notification.
class HttpsNotificationConfiguration {
  /// The subscription endpoint in Security Lake. If you prefer notification with
  /// an HTTPs endpoint, populate this field.
  final String endpoint;

  /// The Amazon Resource Name (ARN) of the EventBridge API destinations IAM role
  /// that you created. For more information about ARNs and how to use them in
  /// policies, see <a
  /// href="https://docs.aws.amazon.com//security-lake/latest/userguide/subscriber-data-access.html">Managing
  /// data access</a> and <a
  /// href="https://docs.aws.amazon.com/security-lake/latest/userguide/security-iam-awsmanpol.html">Amazon
  /// Web Services Managed Policies</a> in the <i>Amazon Security Lake User
  /// Guide</i>.
  final String targetRoleArn;

  /// The key name for the notification subscription.
  final String? authorizationApiKeyName;

  /// The key value for the notification subscription.
  final String? authorizationApiKeyValue;

  /// The HTTPS method used for the notification subscription.
  final HttpMethod? httpMethod;

  HttpsNotificationConfiguration({
    required this.endpoint,
    required this.targetRoleArn,
    this.authorizationApiKeyName,
    this.authorizationApiKeyValue,
    this.httpMethod,
  });

  Map<String, dynamic> toJson() {
    final endpoint = this.endpoint;
    final targetRoleArn = this.targetRoleArn;
    final authorizationApiKeyName = this.authorizationApiKeyName;
    final authorizationApiKeyValue = this.authorizationApiKeyValue;
    final httpMethod = this.httpMethod;
    return {
      'endpoint': endpoint,
      'targetRoleArn': targetRoleArn,
      if (authorizationApiKeyName != null)
        'authorizationApiKeyName': authorizationApiKeyName,
      if (authorizationApiKeyValue != null)
        'authorizationApiKeyValue': authorizationApiKeyValue,
      if (httpMethod != null) 'httpMethod': httpMethod.toValue(),
    };
  }
}

class ListDataLakeExceptionsResponse {
  /// Lists the failures that cannot be retried in the current Region.
  final List<DataLakeException>? exceptions;

  /// List if there are more results available. The value of nextToken is a unique
  /// pagination token for each page. Repeat the call using the returned token to
  /// retrieve the next page. Keep all other arguments unchanged.
  ///
  /// Each pagination token expires after 24 hours. Using an expired pagination
  /// token will return an HTTP 400 InvalidToken error.
  final String? nextToken;

  ListDataLakeExceptionsResponse({
    this.exceptions,
    this.nextToken,
  });

  factory ListDataLakeExceptionsResponse.fromJson(Map<String, dynamic> json) {
    return ListDataLakeExceptionsResponse(
      exceptions: (json['exceptions'] as List?)
          ?.whereNotNull()
          .map((e) => DataLakeException.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final exceptions = this.exceptions;
    final nextToken = this.nextToken;
    return {
      if (exceptions != null) 'exceptions': exceptions,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListDataLakesResponse {
  /// Retrieves the Security Lake configuration object.
  final List<DataLakeResource>? dataLakes;

  ListDataLakesResponse({
    this.dataLakes,
  });

  factory ListDataLakesResponse.fromJson(Map<String, dynamic> json) {
    return ListDataLakesResponse(
      dataLakes: (json['dataLakes'] as List?)
          ?.whereNotNull()
          .map((e) => DataLakeResource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dataLakes = this.dataLakes;
    return {
      if (dataLakes != null) 'dataLakes': dataLakes,
    };
  }
}

class ListLogSourcesResponse {
  /// If nextToken is returned, there are more results available. You can repeat
  /// the call using the returned token to retrieve the next page.
  final String? nextToken;

  /// The list of log sources in your organization that send data to the data
  /// lake.
  final List<LogSource>? sources;

  ListLogSourcesResponse({
    this.nextToken,
    this.sources,
  });

  factory ListLogSourcesResponse.fromJson(Map<String, dynamic> json) {
    return ListLogSourcesResponse(
      nextToken: json['nextToken'] as String?,
      sources: (json['sources'] as List?)
          ?.whereNotNull()
          .map((e) => LogSource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final sources = this.sources;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (sources != null) 'sources': sources,
    };
  }
}

class ListSubscribersResponse {
  /// If nextToken is returned, there are more results available. You can repeat
  /// the call using the returned token to retrieve the next page.
  final String? nextToken;

  /// The subscribers available for the specified Security Lake account ID.
  final List<SubscriberResource>? subscribers;

  ListSubscribersResponse({
    this.nextToken,
    this.subscribers,
  });

  factory ListSubscribersResponse.fromJson(Map<String, dynamic> json) {
    return ListSubscribersResponse(
      nextToken: json['nextToken'] as String?,
      subscribers: (json['subscribers'] as List?)
          ?.whereNotNull()
          .map((e) => SubscriberResource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final subscribers = this.subscribers;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (subscribers != null) 'subscribers': subscribers,
    };
  }
}

class ListTagsForResourceResponse {
  /// An array of objects, one for each tag (key and value) that’s associated with
  /// the Amazon Security Lake resource.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'tags': tags,
    };
  }
}

/// Amazon Security Lake can collect logs and events from natively-supported
/// Amazon Web Services services and custom sources.
class LogSource {
  /// Specify the account from which you want to collect logs.
  final String? account;

  /// Specify the Regions from which you want to collect logs.
  final String? region;

  /// Specify the sources from which you want to collect logs.
  final List<LogSourceResource>? sources;

  LogSource({
    this.account,
    this.region,
    this.sources,
  });

  factory LogSource.fromJson(Map<String, dynamic> json) {
    return LogSource(
      account: json['account'] as String?,
      region: json['region'] as String?,
      sources: (json['sources'] as List?)
          ?.whereNotNull()
          .map((e) => LogSourceResource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final account = this.account;
    final region = this.region;
    final sources = this.sources;
    return {
      if (account != null) 'account': account,
      if (region != null) 'region': region,
      if (sources != null) 'sources': sources,
    };
  }
}

/// The supported source types from which logs and events are collected in
/// Amazon Security Lake. For a list of supported Amazon Web Services, see the
/// <a
/// href="https://docs.aws.amazon.com/security-lake/latest/userguide/internal-sources.html">Amazon
/// Security Lake User Guide</a>.
class LogSourceResource {
  /// Amazon Security Lake supports log and event collection for natively
  /// supported Amazon Web Services. For more information, see the <a
  /// href="https://docs.aws.amazon.com/security-lake/latest/userguide/internal-sources.html">Amazon
  /// Security Lake User Guide</a>.
  final AwsLogSourceResource? awsLogSource;

  /// Amazon Security Lake supports custom source types. For more information, see
  /// the <a
  /// href="https://docs.aws.amazon.com/security-lake/latest/userguide/custom-sources.html">Amazon
  /// Security Lake User Guide</a>.
  final CustomLogSourceResource? customLogSource;

  LogSourceResource({
    this.awsLogSource,
    this.customLogSource,
  });

  factory LogSourceResource.fromJson(Map<String, dynamic> json) {
    return LogSourceResource(
      awsLogSource: json['awsLogSource'] != null
          ? AwsLogSourceResource.fromJson(
              json['awsLogSource'] as Map<String, dynamic>)
          : null,
      customLogSource: json['customLogSource'] != null
          ? CustomLogSourceResource.fromJson(
              json['customLogSource'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final awsLogSource = this.awsLogSource;
    final customLogSource = this.customLogSource;
    return {
      if (awsLogSource != null) 'awsLogSource': awsLogSource,
      if (customLogSource != null) 'customLogSource': customLogSource,
    };
  }
}

/// Specify the configurations you want to use for subscriber notification to
/// notify the subscriber when new data is written to the data lake for sources
/// that the subscriber consumes in Security Lake.
class NotificationConfiguration {
  /// The configurations for HTTPS subscriber notification.
  final HttpsNotificationConfiguration? httpsNotificationConfiguration;

  /// The configurations for SQS subscriber notification.
  final SqsNotificationConfiguration? sqsNotificationConfiguration;

  NotificationConfiguration({
    this.httpsNotificationConfiguration,
    this.sqsNotificationConfiguration,
  });

  Map<String, dynamic> toJson() {
    final httpsNotificationConfiguration = this.httpsNotificationConfiguration;
    final sqsNotificationConfiguration = this.sqsNotificationConfiguration;
    return {
      if (httpsNotificationConfiguration != null)
        'httpsNotificationConfiguration': httpsNotificationConfiguration,
      if (sqsNotificationConfiguration != null)
        'sqsNotificationConfiguration': sqsNotificationConfiguration,
    };
  }
}

class RegisterDataLakeDelegatedAdministratorResponse {
  RegisterDataLakeDelegatedAdministratorResponse();

  factory RegisterDataLakeDelegatedAdministratorResponse.fromJson(
      Map<String, dynamic> _) {
    return RegisterDataLakeDelegatedAdministratorResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum SourceCollectionStatus {
  collecting,
  misconfigured,
  notCollecting,
}

extension SourceCollectionStatusValueExtension on SourceCollectionStatus {
  String toValue() {
    switch (this) {
      case SourceCollectionStatus.collecting:
        return 'COLLECTING';
      case SourceCollectionStatus.misconfigured:
        return 'MISCONFIGURED';
      case SourceCollectionStatus.notCollecting:
        return 'NOT_COLLECTING';
    }
  }
}

extension SourceCollectionStatusFromString on String {
  SourceCollectionStatus toSourceCollectionStatus() {
    switch (this) {
      case 'COLLECTING':
        return SourceCollectionStatus.collecting;
      case 'MISCONFIGURED':
        return SourceCollectionStatus.misconfigured;
      case 'NOT_COLLECTING':
        return SourceCollectionStatus.notCollecting;
    }
    throw Exception('$this is not known in enum SourceCollectionStatus');
  }
}

/// The configurations for SQS subscriber notification.
class SqsNotificationConfiguration {
  SqsNotificationConfiguration();

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Provides details about the Amazon Security Lake account subscription.
/// Subscribers are notified of new objects for a source as the data is written
/// to your Amazon S3 bucket for Security Lake.
class SubscriberResource {
  /// Amazon Security Lake supports log and event collection for natively
  /// supported Amazon Web Services. For more information, see the <a
  /// href="https://docs.aws.amazon.com/security-lake/latest/userguide/source-management.html">Amazon
  /// Security Lake User Guide</a>.
  final List<LogSourceResource> sources;

  /// The subscriber ARN of the Amazon Security Lake subscriber account.
  final String subscriberArn;

  /// The subscriber ID of the Amazon Security Lake subscriber account.
  final String subscriberId;

  /// The AWS identity used to access your data.
  final AwsIdentity subscriberIdentity;

  /// The name of your Amazon Security Lake subscriber account.
  final String subscriberName;

  /// You can choose to notify subscribers of new objects with an Amazon Simple
  /// Queue Service (Amazon SQS) queue or through messaging to an HTTPS endpoint
  /// provided by the subscriber.
  ///
  /// Subscribers can consume data by directly querying Lake Formation tables in
  /// your Amazon S3 bucket through services like Amazon Athena. This subscription
  /// type is defined as <code>LAKEFORMATION</code>.
  final List<AccessType>? accessTypes;

  /// The date and time when the subscriber was created.
  final DateTime? createdAt;

  /// The Amazon Resource Name (ARN) which uniquely defines the AWS RAM resource
  /// share. Before accepting the RAM resource share invitation, you can view
  /// details related to the RAM resource share.
  ///
  /// This field is available only for Lake Formation subscribers created after
  /// March 8, 2023.
  final String? resourceShareArn;

  /// The name of the resource share.
  final String? resourceShareName;

  /// The Amazon Resource Name (ARN) specifying the role of the subscriber.
  final String? roleArn;

  /// The ARN for the Amazon S3 bucket.
  final String? s3BucketArn;

  /// The subscriber descriptions for a subscriber account. The description for a
  /// subscriber includes <code>subscriberName</code>, <code>accountID</code>,
  /// <code>externalID</code>, and <code>subscriberId</code>.
  final String? subscriberDescription;

  /// The subscriber endpoint to which exception messages are posted.
  final String? subscriberEndpoint;

  /// The subscriber status of the Amazon Security Lake subscriber account.
  final SubscriberStatus? subscriberStatus;

  /// The date and time when the subscriber was last updated.
  final DateTime? updatedAt;

  SubscriberResource({
    required this.sources,
    required this.subscriberArn,
    required this.subscriberId,
    required this.subscriberIdentity,
    required this.subscriberName,
    this.accessTypes,
    this.createdAt,
    this.resourceShareArn,
    this.resourceShareName,
    this.roleArn,
    this.s3BucketArn,
    this.subscriberDescription,
    this.subscriberEndpoint,
    this.subscriberStatus,
    this.updatedAt,
  });

  factory SubscriberResource.fromJson(Map<String, dynamic> json) {
    return SubscriberResource(
      sources: (json['sources'] as List)
          .whereNotNull()
          .map((e) => LogSourceResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      subscriberArn: json['subscriberArn'] as String,
      subscriberId: json['subscriberId'] as String,
      subscriberIdentity: AwsIdentity.fromJson(
          json['subscriberIdentity'] as Map<String, dynamic>),
      subscriberName: json['subscriberName'] as String,
      accessTypes: (json['accessTypes'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toAccessType())
          .toList(),
      createdAt: timeStampFromJson(json['createdAt']),
      resourceShareArn: json['resourceShareArn'] as String?,
      resourceShareName: json['resourceShareName'] as String?,
      roleArn: json['roleArn'] as String?,
      s3BucketArn: json['s3BucketArn'] as String?,
      subscriberDescription: json['subscriberDescription'] as String?,
      subscriberEndpoint: json['subscriberEndpoint'] as String?,
      subscriberStatus:
          (json['subscriberStatus'] as String?)?.toSubscriberStatus(),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final sources = this.sources;
    final subscriberArn = this.subscriberArn;
    final subscriberId = this.subscriberId;
    final subscriberIdentity = this.subscriberIdentity;
    final subscriberName = this.subscriberName;
    final accessTypes = this.accessTypes;
    final createdAt = this.createdAt;
    final resourceShareArn = this.resourceShareArn;
    final resourceShareName = this.resourceShareName;
    final roleArn = this.roleArn;
    final s3BucketArn = this.s3BucketArn;
    final subscriberDescription = this.subscriberDescription;
    final subscriberEndpoint = this.subscriberEndpoint;
    final subscriberStatus = this.subscriberStatus;
    final updatedAt = this.updatedAt;
    return {
      'sources': sources,
      'subscriberArn': subscriberArn,
      'subscriberId': subscriberId,
      'subscriberIdentity': subscriberIdentity,
      'subscriberName': subscriberName,
      if (accessTypes != null)
        'accessTypes': accessTypes.map((e) => e.toValue()).toList(),
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (resourceShareArn != null) 'resourceShareArn': resourceShareArn,
      if (resourceShareName != null) 'resourceShareName': resourceShareName,
      if (roleArn != null) 'roleArn': roleArn,
      if (s3BucketArn != null) 's3BucketArn': s3BucketArn,
      if (subscriberDescription != null)
        'subscriberDescription': subscriberDescription,
      if (subscriberEndpoint != null) 'subscriberEndpoint': subscriberEndpoint,
      if (subscriberStatus != null)
        'subscriberStatus': subscriberStatus.toValue(),
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

enum SubscriberStatus {
  active,
  deactivated,
  pending,
  ready,
}

extension SubscriberStatusValueExtension on SubscriberStatus {
  String toValue() {
    switch (this) {
      case SubscriberStatus.active:
        return 'ACTIVE';
      case SubscriberStatus.deactivated:
        return 'DEACTIVATED';
      case SubscriberStatus.pending:
        return 'PENDING';
      case SubscriberStatus.ready:
        return 'READY';
    }
  }
}

extension SubscriberStatusFromString on String {
  SubscriberStatus toSubscriberStatus() {
    switch (this) {
      case 'ACTIVE':
        return SubscriberStatus.active;
      case 'DEACTIVATED':
        return SubscriberStatus.deactivated;
      case 'PENDING':
        return SubscriberStatus.pending;
      case 'READY':
        return SubscriberStatus.ready;
    }
    throw Exception('$this is not known in enum SubscriberStatus');
  }
}

/// A <i>tag</i> is a label that you can define and associate with Amazon Web
/// Services resources, including certain types of Amazon Security Lake
/// resources. Tags can help you identify, categorize, and manage resources in
/// different ways, such as by owner, environment, or other criteria. You can
/// associate tags with the following types of Security Lake resources:
/// subscribers, and the data lake configuration for your Amazon Web Services
/// account in individual Amazon Web Services Regions.
///
/// A resource can have up to 50 tags. Each tag consists of a required <i>tag
/// key</i> and an associated <i>tag value</i>. A <i>tag key</i> is a general
/// label that acts as a category for a more specific tag value. Each tag key
/// must be unique and it can have only one tag value. A <i>tag value</i> acts
/// as a descriptor for a tag key. Tag keys and values are case sensitive. They
/// can contain letters, numbers, spaces, or the following symbols: _ . : / = +
/// @ -
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/security-lake/latest/userguide/tagging-resources.html">Tagging
/// Amazon Security Lake resources</a> in the <i>Amazon Security Lake User
/// Guide</i>.
class Tag {
  /// The name of the tag. This is a general label that acts as a category for a
  /// more specific tag value (<code>value</code>).
  final String key;

  /// The value that’s associated with the specified tag key (<code>key</code>).
  /// This value acts as a descriptor for the tag key. A tag value cannot be null,
  /// but it can be an empty string.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['key'] as String,
      value: json['value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'key': key,
      'value': value,
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

class UpdateDataLakeExceptionSubscriptionResponse {
  UpdateDataLakeExceptionSubscriptionResponse();

  factory UpdateDataLakeExceptionSubscriptionResponse.fromJson(
      Map<String, dynamic> _) {
    return UpdateDataLakeExceptionSubscriptionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateDataLakeResponse {
  /// The created Security Lake configuration object.
  final List<DataLakeResource>? dataLakes;

  UpdateDataLakeResponse({
    this.dataLakes,
  });

  factory UpdateDataLakeResponse.fromJson(Map<String, dynamic> json) {
    return UpdateDataLakeResponse(
      dataLakes: (json['dataLakes'] as List?)
          ?.whereNotNull()
          .map((e) => DataLakeResource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dataLakes = this.dataLakes;
    return {
      if (dataLakes != null) 'dataLakes': dataLakes,
    };
  }
}

class UpdateSubscriberNotificationResponse {
  /// The subscriber endpoint to which exception messages are posted.
  final String? subscriberEndpoint;

  UpdateSubscriberNotificationResponse({
    this.subscriberEndpoint,
  });

  factory UpdateSubscriberNotificationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateSubscriberNotificationResponse(
      subscriberEndpoint: json['subscriberEndpoint'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final subscriberEndpoint = this.subscriberEndpoint;
    return {
      if (subscriberEndpoint != null) 'subscriberEndpoint': subscriberEndpoint,
    };
  }
}

class UpdateSubscriberResponse {
  /// The updated subscriber information.
  final SubscriberResource? subscriber;

  UpdateSubscriberResponse({
    this.subscriber,
  });

  factory UpdateSubscriberResponse.fromJson(Map<String, dynamic> json) {
    return UpdateSubscriberResponse(
      subscriber: json['subscriber'] != null
          ? SubscriberResource.fromJson(
              json['subscriber'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final subscriber = this.subscriber;
    return {
      if (subscriber != null) 'subscriber': subscriber,
    };
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String? type, String? message})
      : super(type: type, code: 'BadRequestException', message: message);
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

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
};
