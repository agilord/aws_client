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

/// <note>
/// Amazon Security Lake is in preview release. Your use of the Security Lake
/// preview is subject to Section 2 of the <a
/// href="http://aws.amazon.com/service-terms/">Amazon Web Services Service
/// Terms</a>("Betas and Previews").
/// </note>
/// Amazon Security Lake is a fully managed security data lake service. You can
/// use Security Lake to automatically centralize security data from cloud,
/// on-premises, and custom sources into a data lake that's stored in your
/// Amazon Web Servicesaccount. Amazon Web Services Organizations is an account
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
/// record of actions taken by a user, role, or an Amazon Web Services service
/// in Security Lake CloudTrail captures API calls for Security Lake as events.
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
  /// organization or standalone accounts. At least one of the three dimensions
  /// is a mandatory input to this API. However, you can supply any combination
  /// of the three dimensions to this API.
  ///
  /// By default, a dimension refers to the entire set. When you don't provide a
  /// dimension, Security Lake assumes that the missing dimension refers to the
  /// entire set. This is overridden when you supply any one of the inputs. For
  /// instance, when you do not specify members, the API enables all Security
  /// Lake member accounts for all sources. Similarly, when you do not specify
  /// Regions, Security Lake is enabled for all the Regions where Security Lake
  /// is available as a service.
  ///
  /// You can use this API only to enable natively supported Amazon Web Services
  /// as a source. Use <code>CreateCustomLogSource</code> to enable data
  /// collection from a custom source.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [S3Exception].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccountNotFoundException].
  ///
  /// Parameter [inputOrder] :
  /// Specifies the input order to enable dimensions in Security Lake, namely
  /// Region, source type, and member account.
  ///
  /// Parameter [enableAllDimensions] :
  /// Enables data collection from specific Amazon Web Services sources in all
  /// specific accounts and specific Regions.
  ///
  /// Parameter [enableSingleDimension] :
  /// Enables data collection from all Amazon Web Services sources in specific
  /// accounts or Regions.
  ///
  /// Parameter [enableTwoDimensions] :
  /// Enables data collection from specific Amazon Web Services sources in
  /// specific accounts or Regions.
  Future<CreateAwsLogSourceResponse> createAwsLogSource({
    required List<Dimension> inputOrder,
    Map<String, Map<String, List<String>>>? enableAllDimensions,
    List<String>? enableSingleDimension,
    Map<String, List<String>>? enableTwoDimensions,
  }) async {
    final $payload = <String, dynamic>{
      'inputOrder': inputOrder.map((e) => e.toValue()).toList(),
      if (enableAllDimensions != null)
        'enableAllDimensions': enableAllDimensions,
      if (enableSingleDimension != null)
        'enableSingleDimension': enableSingleDimension,
      if (enableTwoDimensions != null)
        'enableTwoDimensions': enableTwoDimensions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/logsources/aws',
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
  /// for log files from the custom source in addition to an associated Glue
  /// table and an Glue crawler.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ConflictSourceNamesException].
  /// May throw [AccessDeniedException].
  /// May throw [BucketNotFoundException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccountNotFoundException].
  ///
  /// Parameter [customSourceName] :
  /// The name for a third-party custom source. This must be a Regionally unique
  /// value.
  ///
  /// Parameter [eventClass] :
  /// The Open Cybersecurity Schema Framework (OCSF) event class which describes
  /// the type of data that the custom source will send to Security Lake.
  ///
  /// Parameter [glueInvocationRoleArn] :
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
  ///
  /// Parameter [logProviderAccountId] :
  /// The Amazon Web Services account ID of the custom source that will write
  /// logs and events into the Amazon S3 Data Lake.
  Future<CreateCustomLogSourceResponse> createCustomLogSource({
    required String customSourceName,
    required OcsfEventClass eventClass,
    required String glueInvocationRoleArn,
    required String logProviderAccountId,
  }) async {
    final $payload = <String, dynamic>{
      'customSourceName': customSourceName,
      'eventClass': eventClass.toValue(),
      'glueInvocationRoleArn': glueInvocationRoleArn,
      'logProviderAccountId': logProviderAccountId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/logsources/custom',
      exceptionFnMap: _exceptionFns,
    );
    return CreateCustomLogSourceResponse.fromJson(response);
  }

  /// Initializes an Amazon Security Lake instance with the provided (or
  /// default) configuration. You can enable Security Lake in Amazon Web
  /// Services Regions with customized settings before enabling log collection
  /// in Regions. You can either use the <code>enableAll</code> parameter to
  /// specify all Regions or specify the Regions where you want to enable
  /// Security Lake. To specify particular Regions, use the <code>Regions</code>
  /// parameter and then configure these Regions using the
  /// <code>configurations</code> parameter. If you have already enabled
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
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [configurations] :
  /// Specify the Region or Regions that will contribute data to the rollup
  /// region.
  ///
  /// Parameter [enableAll] :
  /// Enable Security Lake in all Regions.
  ///
  /// Parameter [metaStoreManagerRoleArn] :
  /// The Amazon Resource Name (ARN) used to create and update the Glue table.
  /// This table contains partitions generated by the ingestion and
  /// normalization of Amazon Web Services log sources and custom sources.
  ///
  /// Parameter [regions] :
  /// Enable Security Lake in the specified Regions. To enable Security Lake in
  /// specific Amazon Web Services Regions, such as us-east-1 or ap-northeast-3,
  /// provide the Region codes. For a list of Region codes, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/securitylake.html">Amazon
  /// Security Lake endpoints</a> in the Amazon Web Services General Reference.
  Future<void> createDatalake({
    Map<Region, LakeConfigurationRequest>? configurations,
    bool? enableAll,
    String? metaStoreManagerRoleArn,
    List<Region>? regions,
  }) async {
    final $payload = <String, dynamic>{
      if (configurations != null)
        'configurations':
            configurations.map((k, e) => MapEntry(k.toValue(), e)),
      if (enableAll != null) 'enableAll': enableAll,
      if (metaStoreManagerRoleArn != null)
        'metaStoreManagerRoleArn': metaStoreManagerRoleArn,
      if (regions != null) 'regions': regions.map((e) => e.toValue()).toList(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/datalake',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Automatically enables Amazon Security Lake for new member accounts in your
  /// organization. Security Lake is not automatically enabled for any existing
  /// member accounts in your organization.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountNotFoundException].
  ///
  /// Parameter [configurationForNewAccounts] :
  /// Enable Security Lake with the specified configuration settings to begin
  /// collecting security data for new accounts in your organization.
  Future<void> createDatalakeAutoEnable({
    required List<AutoEnableNewRegionConfiguration> configurationForNewAccounts,
  }) async {
    final $payload = <String, dynamic>{
      'configurationForNewAccounts': configurationForNewAccounts,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/datalake/autoenable',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Designates the Amazon Security Lake delegated administrator account for
  /// the organization. This API can only be called by the organization
  /// management account. The organization management account cannot be the
  /// delegated administrator account.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [account] :
  /// The Amazon Web Services account ID of the Security Lake delegated
  /// administrator.
  Future<void> createDatalakeDelegatedAdmin({
    required String account,
  }) async {
    final $payload = <String, dynamic>{
      'account': account,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/datalake/delegate',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates the specified notification subscription in Amazon Security Lake
  /// for the organization you specify.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountNotFoundException].
  ///
  /// Parameter [notificationEndpoint] :
  /// The Amazon Web Services account where you want to receive exception
  /// notifications.
  ///
  /// Parameter [subscriptionProtocol] :
  /// The subscription protocol to which exception notifications are posted.
  Future<void> createDatalakeExceptionsSubscription({
    required String notificationEndpoint,
    required SubscriptionProtocolType subscriptionProtocol,
  }) async {
    final $payload = <String, dynamic>{
      'notificationEndpoint': notificationEndpoint,
      'subscriptionProtocol': subscriptionProtocol.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/datalake/exceptions/subscription',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates a subscription permission for accounts that are already enabled in
  /// Amazon Security Lake. You can create a subscriber with access to data in
  /// the current Amazon Web Services Region.
  ///
  /// May throw [ConflictSubscriptionException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [BucketNotFoundException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccountNotFoundException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID used to access your data.
  ///
  /// Parameter [externalId] :
  /// The external ID of the subscriber. This lets the user that is assuming the
  /// role assert the circumstances in which they are operating. It also
  /// provides a way for the account owner to permit the role to be assumed only
  /// under specific circumstances.
  ///
  /// Parameter [sourceTypes] :
  /// The supported Amazon Web Services from which logs and events are
  /// collected. Security Lake supports log and event collection for natively
  /// supported Amazon Web Services.
  ///
  /// Parameter [subscriberName] :
  /// The name of your Security Lake subscriber account.
  ///
  /// Parameter [accessTypes] :
  /// The Amazon S3 or Lake Formation access type.
  ///
  /// Parameter [subscriberDescription] :
  /// The description for your subscriber account in Security Lake.
  Future<CreateSubscriberResponse> createSubscriber({
    required String accountId,
    required String externalId,
    required List<SourceType> sourceTypes,
    required String subscriberName,
    List<AccessType>? accessTypes,
    String? subscriberDescription,
  }) async {
    final $payload = <String, dynamic>{
      'accountId': accountId,
      'externalId': externalId,
      'sourceTypes': sourceTypes,
      'subscriberName': subscriberName,
      if (accessTypes != null)
        'accessTypes': accessTypes.map((e) => e.toValue()).toList(),
      if (subscriberDescription != null)
        'subscriberDescription': subscriberDescription,
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
  /// May throw [ConcurrentModificationException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccountNotFoundException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [subscriptionId] :
  /// The subscription ID for the notification subscription.
  ///
  /// Parameter [createSqs] :
  /// Create an Amazon Simple Queue Service queue.
  ///
  /// Parameter [httpsApiKeyName] :
  /// The key name for the notification subscription.
  ///
  /// Parameter [httpsApiKeyValue] :
  /// The key value for the notification subscription.
  ///
  /// Parameter [httpsMethod] :
  /// The HTTPS method used for the notification subscription.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the EventBridge API destinations IAM
  /// role that you created. For more information about ARNs and how to use them
  /// in policies, see <a
  /// href="https://docs.aws.amazon.com//security-lake/latest/userguide/subscriber-data-access.html">Managing
  /// data access</a> and <a
  /// href="https://docs.aws.amazon.com/security-lake/latest/userguide/security-iam-awsmanpol.html">Amazon
  /// Web Services Managed Policies</a> in the Amazon Security Lake User Guide.
  ///
  /// Parameter [subscriptionEndpoint] :
  /// The subscription endpoint in Security Lake. If you prefer notification
  /// with an HTTPs endpoint, populate this field.
  Future<CreateSubscriptionNotificationConfigurationResponse>
      createSubscriptionNotificationConfiguration({
    required String subscriptionId,
    bool? createSqs,
    String? httpsApiKeyName,
    String? httpsApiKeyValue,
    HttpsMethod? httpsMethod,
    String? roleArn,
    String? subscriptionEndpoint,
  }) async {
    final $payload = <String, dynamic>{
      if (createSqs != null) 'createSqs': createSqs,
      if (httpsApiKeyName != null) 'httpsApiKeyName': httpsApiKeyName,
      if (httpsApiKeyValue != null) 'httpsApiKeyValue': httpsApiKeyValue,
      if (httpsMethod != null) 'httpsMethod': httpsMethod.toValue(),
      if (roleArn != null) 'roleArn': roleArn,
      if (subscriptionEndpoint != null)
        'subscriptionEndpoint': subscriptionEndpoint,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/subscription-notifications/${Uri.encodeComponent(subscriptionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSubscriptionNotificationConfigurationResponse.fromJson(
        response);
  }

  /// Removes a natively supported Amazon Web Service as an Amazon Security Lake
  /// source. When you remove the source, Security Lake stops collecting data
  /// from that source, and subscribers can no longer consume new data from the
  /// source. Subscribers can still consume data that Security Lake collected
  /// from the source before disablement.
  ///
  /// You can choose any source type in any Amazon Web Services Region for
  /// either accounts that are part of a trusted organization or standalone
  /// accounts. At least one of the three dimensions is a mandatory input to
  /// this API. However, you can supply any combination of the three dimensions
  /// to this API.
  ///
  /// By default, a dimension refers to the entire set. This is overridden when
  /// you supply any one of the inputs. For instance, when you do not specify
  /// members, the API disables all Security Lake member accounts for sources.
  /// Similarly, when you do not specify Regions, Security Lake is disabled for
  /// all the Regions where Security Lake is available as a service.
  ///
  /// When you don't provide a dimension, Security Lake assumes that the missing
  /// dimension refers to the entire set. For example, if you don't provide
  /// specific accounts, the API applies to the entire set of accounts in your
  /// organization.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountNotFoundException].
  ///
  /// Parameter [inputOrder] :
  /// This is a mandatory input. Specify the input order to disable dimensions
  /// in Security Lake, namely Region (Amazon Web Services Region code, source
  /// type, and member (account ID of a specific Amazon Web Services account).
  ///
  /// Parameter [disableAllDimensions] :
  /// Removes the specific Amazon Web Services sources from specific accounts
  /// and specific Regions.
  ///
  /// Parameter [disableSingleDimension] :
  /// Removes all Amazon Web Services sources from specific accounts or Regions.
  ///
  /// Parameter [disableTwoDimensions] :
  /// Remove a specific Amazon Web Services source from specific accounts or
  /// Regions.
  Future<DeleteAwsLogSourceResponse> deleteAwsLogSource({
    required List<Dimension> inputOrder,
    Map<String, Map<String, List<String>>>? disableAllDimensions,
    List<String>? disableSingleDimension,
    Map<String, List<String>>? disableTwoDimensions,
  }) async {
    final $payload = <String, dynamic>{
      'inputOrder': inputOrder.map((e) => e.toValue()).toList(),
      if (disableAllDimensions != null)
        'disableAllDimensions': disableAllDimensions,
      if (disableSingleDimension != null)
        'disableSingleDimension': disableSingleDimension,
      if (disableTwoDimensions != null)
        'disableTwoDimensions': disableTwoDimensions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/logsources/aws/delete',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteAwsLogSourceResponse.fromJson(response);
  }

  /// Removes a custom log source from Amazon Security Lake.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ConflictSourceNamesException].
  /// May throw [AccessDeniedException].
  /// May throw [BucketNotFoundException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccountNotFoundException].
  ///
  /// Parameter [customSourceName] :
  /// The custom source name for the custom log source.
  Future<DeleteCustomLogSourceResponse> deleteCustomLogSource({
    required String customSourceName,
  }) async {
    final $query = <String, List<String>>{
      'customSourceName': [customSourceName],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/logsources/custom',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteCustomLogSourceResponse.fromJson(response);
  }

  /// When you delete Amazon Security Lake from your account, Security Lake is
  /// disabled in all Amazon Web Services Regions. Also, this API automatically
  /// takes steps to remove the account from Security Lake .
  ///
  /// This operation disables security data collection from sources, deletes
  /// data stored, and stops making data accessible to subscribers. Security
  /// Lake also deletes all the existing settings and resources that it stores
  /// or maintains for your Amazon Web Services account in the current Region,
  /// including security log and event data. The <code>DeleteDatalake</code>
  /// operation does not delete the Amazon S3 bucket, which is owned by your
  /// Amazon Web Services account. For more information, see the <a
  /// href="https://docs.aws.amazon.com/security-lake/latest/userguide/disable-security-lake.html">Amazon
  /// Security Lake User Guide</a>.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  Future<void> deleteDatalake() async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/datalake',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// <code>DeleteDatalakeAutoEnable</code> removes automatic enablement of
  /// configuration settings for new member accounts (but keeps settings for the
  /// delegated administrator) from Amazon Security Lake. You must run this API
  /// using credentials of the delegated administrator. When you run this API,
  /// new member accounts that are added after the organization enables Security
  /// Lake won't contribute to the data lake.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountNotFoundException].
  ///
  /// Parameter [removeFromConfigurationForNewAccounts] :
  /// Remove automatic enablement of configuration settings for new member
  /// accounts in Security Lake.
  Future<void> deleteDatalakeAutoEnable({
    required List<AutoEnableNewRegionConfiguration>
        removeFromConfigurationForNewAccounts,
  }) async {
    final $payload = <String, dynamic>{
      'removeFromConfigurationForNewAccounts':
          removeFromConfigurationForNewAccounts,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/datalake/autoenable/delete',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the Amazon Security Lake delegated administrator account for the
  /// organization. This API can only be called by the organization management
  /// account. The organization management account cannot be the delegated
  /// administrator account.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [account] :
  /// The account ID the Security Lake delegated administrator.
  Future<void> deleteDatalakeDelegatedAdmin({
    required String account,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/datalake/delegate/${Uri.encodeComponent(account)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified notification subscription in Amazon Security Lake
  /// for the organization you specify.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountNotFoundException].
  Future<DeleteDatalakeExceptionsSubscriptionResponse>
      deleteDatalakeExceptionsSubscription() async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/datalake/exceptions/subscription',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteDatalakeExceptionsSubscriptionResponse.fromJson(response);
  }

  /// Deletes the subscription permission for accounts that are already enabled
  /// in Amazon Security Lake. You can delete a subscriber and remove access to
  /// data in the current Amazon Web Services Region.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [BucketNotFoundException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccountNotFoundException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [id] :
  /// A value created by Security Lake that uniquely identifies your
  /// <code>DeleteSubscriber</code> API request.
  Future<void> deleteSubscriber({
    required String id,
  }) async {
    final $query = <String, List<String>>{
      'id': [id],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/subscribers',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified notification subscription in Amazon Security Lake
  /// for the organization you specify.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccountNotFoundException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [subscriptionId] :
  /// The ID of the Security Lake subscriber account.
  Future<void> deleteSubscriptionNotificationConfiguration({
    required String subscriptionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/subscription-notifications/${Uri.encodeComponent(subscriptionId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves the Amazon Security Lake configuration object for the specified
  /// Amazon Web Services account ID. You can use the <code>GetDatalake</code>
  /// API to know whether Security Lake is enabled for the current Region. This
  /// API does not take input parameters.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccountNotFoundException].
  Future<GetDatalakeResponse> getDatalake() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/datalake',
      exceptionFnMap: _exceptionFns,
    );
    return GetDatalakeResponse.fromJson(response);
  }

  /// Retrieves the configuration that will be automatically set up for accounts
  /// added to the organization after the organization has onboarded to Amazon
  /// Security Lake. This API does not take input parameters.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountNotFoundException].
  Future<GetDatalakeAutoEnableResponse> getDatalakeAutoEnable() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/datalake/autoenable',
      exceptionFnMap: _exceptionFns,
    );
    return GetDatalakeAutoEnableResponse.fromJson(response);
  }

  /// Retrieves the expiration period and time-to-live (TTL) for which the
  /// exception message will remain. Exceptions are stored by default, for 2
  /// weeks from when a record was created in Amazon Security Lake. This API
  /// does not take input parameters.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountNotFoundException].
  Future<GetDatalakeExceptionsExpiryResponse>
      getDatalakeExceptionsExpiry() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/datalake/exceptions/expiry',
      exceptionFnMap: _exceptionFns,
    );
    return GetDatalakeExceptionsExpiryResponse.fromJson(response);
  }

  /// Retrieves the details of exception notifications for the account in Amazon
  /// Security Lake.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountNotFoundException].
  Future<GetDatalakeExceptionsSubscriptionResponse>
      getDatalakeExceptionsSubscription() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/datalake/exceptions/subscription',
      exceptionFnMap: _exceptionFns,
    );
    return GetDatalakeExceptionsSubscriptionResponse.fromJson(response);
  }

  /// Retrieves a snapshot of the current Region, including whether Amazon
  /// Security Lake is enabled for those accounts and which sources Security
  /// Lake is collecting data from.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountNotFoundException].
  ///
  /// Parameter [accountSet] :
  /// The Amazon Web Services account ID for which a static snapshot of the
  /// current Amazon Web Services Region, including enabled accounts and log
  /// sources, is retrieved.
  ///
  /// Parameter [maxAccountResults] :
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
  Future<GetDatalakeStatusResponse> getDatalakeStatus({
    List<String>? accountSet,
    int? maxAccountResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (accountSet != null) 'accountSet': accountSet,
      if (maxAccountResults != null) 'maxAccountResults': maxAccountResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/datalake/status',
      exceptionFnMap: _exceptionFns,
    );
    return GetDatalakeStatusResponse.fromJson(response);
  }

  /// Retrieves the subscription information for the specified subscription ID.
  /// You can get information about a specific subscriber.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccountNotFoundException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [id] :
  /// A value created by Amazon Security Lake that uniquely identifies your
  /// <code>GetSubscriber</code> API request.
  Future<GetSubscriberResponse> getSubscriber({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/subscribers/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSubscriberResponse.fromJson(response);
  }

  /// Lists the Amazon Security Lake exceptions that you can use to find the
  /// source of problems and fix them.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountNotFoundException].
  ///
  /// Parameter [maxFailures] :
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
  /// Parameter [regionSet] :
  /// List the Amazon Web Services Regions from which exceptions are retrieved.
  Future<ListDatalakeExceptionsResponse> listDatalakeExceptions({
    int? maxFailures,
    String? nextToken,
    List<Region>? regionSet,
  }) async {
    final $payload = <String, dynamic>{
      if (maxFailures != null) 'maxFailures': maxFailures,
      if (nextToken != null) 'nextToken': nextToken,
      if (regionSet != null)
        'regionSet': regionSet.map((e) => e.toValue()).toList(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/datalake/exceptions',
      exceptionFnMap: _exceptionFns,
    );
    return ListDatalakeExceptionsResponse.fromJson(response);
  }

  /// Retrieves the log sources in the current Amazon Web Services Region.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccountNotFoundException].
  ///
  /// Parameter [inputOrder] :
  /// Lists the log sources in input order, namely Region, source type, and
  /// member account.
  ///
  /// Parameter [listAllDimensions] :
  /// List the view of log sources for enabled Amazon Security Lake accounts for
  /// specific Amazon Web Services sources from specific accounts and specific
  /// Regions.
  ///
  /// Parameter [listSingleDimension] :
  /// List the view of log sources for enabled Security Lake accounts for all
  /// Amazon Web Services sources from specific accounts or specific Regions.
  ///
  /// Parameter [listTwoDimensions] :
  /// Lists the view of log sources for enabled Security Lake accounts for
  /// specific Amazon Web Services sources from specific accounts or specific
  /// Regions.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of accounts for which the log sources are displayed.
  ///
  /// Parameter [nextToken] :
  /// If nextToken is returned, there are more results available. You can repeat
  /// the call using the returned token to retrieve the next page.
  Future<ListLogSourcesResponse> listLogSources({
    List<Dimension>? inputOrder,
    Map<String, Map<String, List<String>>>? listAllDimensions,
    List<String>? listSingleDimension,
    Map<String, List<String>>? listTwoDimensions,
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (inputOrder != null)
        'inputOrder': inputOrder.map((e) => e.toValue()).toList(),
      if (listAllDimensions != null) 'listAllDimensions': listAllDimensions,
      if (listSingleDimension != null)
        'listSingleDimension': listSingleDimension,
      if (listTwoDimensions != null) 'listTwoDimensions': listTwoDimensions,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/logsources/list',
      exceptionFnMap: _exceptionFns,
    );
    return ListLogSourcesResponse.fromJson(response);
  }

  /// List all subscribers for the specific Amazon Security Lake account ID. You
  /// can retrieve a list of subscriptions associated with a specific
  /// organization or Amazon Web Services account.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccountNotFoundException].
  /// May throw [InvalidInputException].
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

  /// Specifies where to store your security data and for how long. You can add
  /// a rollup Region to consolidate data from multiple Amazon Web Services
  /// Regions.
  ///
  /// May throw [EventBridgeException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [configurations] :
  /// Specify the Region or Regions that will contribute data to the rollup
  /// region.
  Future<void> updateDatalake({
    required Map<Region, LakeConfigurationRequest> configurations,
  }) async {
    final $payload = <String, dynamic>{
      'configurations': configurations.map((k, e) => MapEntry(k.toValue(), e)),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v1/datalake',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Update the expiration period for the exception message to your preferred
  /// time, and control the time-to-live (TTL) for the exception message to
  /// remain. Exceptions are stored by default for 2 weeks from when a record
  /// was created in Amazon Security Lake.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountNotFoundException].
  ///
  /// Parameter [exceptionMessageExpiry] :
  /// The time-to-live (TTL) for the exception message to remain.
  Future<void> updateDatalakeExceptionsExpiry({
    required int exceptionMessageExpiry,
  }) async {
    _s.validateNumRange(
      'exceptionMessageExpiry',
      exceptionMessageExpiry,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'exceptionMessageExpiry': exceptionMessageExpiry,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v1/datalake/exceptions/expiry',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the specified notification subscription in Amazon Security Lake
  /// for the organization you specify.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountNotFoundException].
  ///
  /// Parameter [notificationEndpoint] :
  /// The account that is subscribed to receive exception notifications.
  ///
  /// Parameter [subscriptionProtocol] :
  /// The subscription protocol to which exception messages are posted.
  Future<void> updateDatalakeExceptionsSubscription({
    required String notificationEndpoint,
    required SubscriptionProtocolType subscriptionProtocol,
  }) async {
    final $payload = <String, dynamic>{
      'notificationEndpoint': notificationEndpoint,
      'subscriptionProtocol': subscriptionProtocol.toValue(),
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
  /// May throw [ConflictSubscriptionException].
  /// May throw [ConcurrentModificationException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountNotFoundException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [id] :
  /// A value created by Security Lake that uniquely identifies your
  /// subscription.
  ///
  /// Parameter [sourceTypes] :
  /// The supported Amazon Web Services from which logs and events are
  /// collected. For the list of supported Amazon Web Services, see the <a
  /// href="https://docs.aws.amazon.com/security-lake/latest/userguide/internal-sources.html">Amazon
  /// Security Lake User Guide</a>.
  ///
  /// Parameter [externalId] :
  /// The external ID of the Security Lake account.
  ///
  /// Parameter [subscriberDescription] :
  /// The description of the Security Lake account subscriber.
  ///
  /// Parameter [subscriberName] :
  /// The name of the Security Lake account subscriber.
  Future<UpdateSubscriberResponse> updateSubscriber({
    required String id,
    required List<SourceType> sourceTypes,
    String? externalId,
    String? subscriberDescription,
    String? subscriberName,
  }) async {
    final $payload = <String, dynamic>{
      'sourceTypes': sourceTypes,
      if (externalId != null) 'externalId': externalId,
      if (subscriberDescription != null)
        'subscriberDescription': subscriberDescription,
      if (subscriberName != null) 'subscriberName': subscriberName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v1/subscribers/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateSubscriberResponse.fromJson(response);
  }

  /// Updates an existing notification method for the subscription (SQS or HTTPs
  /// endpoint) or switches the notification subscription endpoint for a
  /// subscriber.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccountNotFoundException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [subscriptionId] :
  /// The subscription ID for which the subscription notification is specified.
  ///
  /// Parameter [createSqs] :
  /// Create a new subscription notification for the specified subscription ID
  /// in Amazon Security Lake.
  ///
  /// Parameter [httpsApiKeyName] :
  /// The key name for the subscription notification.
  ///
  /// Parameter [httpsApiKeyValue] :
  /// The key value for the subscription notification.
  ///
  /// Parameter [httpsMethod] :
  /// The HTTPS method used for the subscription notification.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) specifying the role of the subscriber. For
  /// more information about ARNs and how to use them in policies, see, see the
  /// <a
  /// href="https://docs.aws.amazon.com//security-lake/latest/userguide/subscriber-data-access.html">Managing
  /// data access</a> and <a
  /// href="https://docs.aws.amazon.com/security-lake/latest/userguide/security-iam-awsmanpol.html">Amazon
  /// Web Services Managed Policies</a>in the Amazon Security Lake User Guide.
  ///
  /// Parameter [subscriptionEndpoint] :
  /// The subscription endpoint in Security Lake.
  Future<UpdateSubscriptionNotificationConfigurationResponse>
      updateSubscriptionNotificationConfiguration({
    required String subscriptionId,
    bool? createSqs,
    String? httpsApiKeyName,
    String? httpsApiKeyValue,
    HttpsMethod? httpsMethod,
    String? roleArn,
    String? subscriptionEndpoint,
  }) async {
    final $payload = <String, dynamic>{
      if (createSqs != null) 'createSqs': createSqs,
      if (httpsApiKeyName != null) 'httpsApiKeyName': httpsApiKeyName,
      if (httpsApiKeyValue != null) 'httpsApiKeyValue': httpsApiKeyValue,
      if (httpsMethod != null) 'httpsMethod': httpsMethod.toValue(),
      if (roleArn != null) 'roleArn': roleArn,
      if (subscriptionEndpoint != null)
        'subscriptionEndpoint': subscriptionEndpoint,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/subscription-notifications/${Uri.encodeComponent(subscriptionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateSubscriptionNotificationConfigurationResponse.fromJson(
        response);
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

/// Amazon Security Lake collects logs and events from supported Amazon Web
/// Services and custom sources. For the list of supported Amazon Web Services,
/// see the <a
/// href="https://docs.aws.amazon.com/security-lake/latest/userguide/internal-sources.html">Amazon
/// Security Lake User Guide</a>.
class AccountSources {
  /// The ID of the Security Lake account for which logs are collected.
  final String account;

  /// The supported Amazon Web Services from which logs and events are collected.
  /// Amazon Security Lake supports log and event collection for natively
  /// supported Amazon Web Services.
  final String sourceType;

  /// Initializes a new instance of the Event class.
  final OcsfEventClass? eventClass;

  /// The log status for the Security Lake account.
  final List<LogsStatus>? logsStatus;

  AccountSources({
    required this.account,
    required this.sourceType,
    this.eventClass,
    this.logsStatus,
  });

  factory AccountSources.fromJson(Map<String, dynamic> json) {
    return AccountSources(
      account: json['account'] as String,
      sourceType: json['sourceType'] as String,
      eventClass: (json['eventClass'] as String?)?.toOcsfEventClass(),
      logsStatus: (json['logsStatus'] as List?)
          ?.whereNotNull()
          .map((e) => LogsStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final account = this.account;
    final sourceType = this.sourceType;
    final eventClass = this.eventClass;
    final logsStatus = this.logsStatus;
    return {
      'account': account,
      'sourceType': sourceType,
      if (eventClass != null) 'eventClass': eventClass.toValue(),
      if (logsStatus != null) 'logsStatus': logsStatus,
    };
  }
}

/// Automatically enable new organization accounts as member accounts from an
/// Amazon Security Lake administrator account.
class AutoEnableNewRegionConfiguration {
  /// The Amazon Web Services Regions where Security Lake is automatically
  /// enabled.
  final Region region;

  /// The Amazon Web Services sources that are automatically enabled in Security
  /// Lake.
  final List<AwsLogSourceType> sources;

  AutoEnableNewRegionConfiguration({
    required this.region,
    required this.sources,
  });

  factory AutoEnableNewRegionConfiguration.fromJson(Map<String, dynamic> json) {
    return AutoEnableNewRegionConfiguration(
      region: (json['region'] as String).toRegion(),
      sources: (json['sources'] as List)
          .whereNotNull()
          .map((e) => (e as String).toAwsLogSourceType())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final region = this.region;
    final sources = this.sources;
    return {
      'region': region.toValue(),
      'sources': sources.map((e) => e.toValue()).toList(),
    };
  }
}

enum AwsLogSourceType {
  route53,
  vpcFlow,
  cloudTrail,
  shFindings,
}

extension AwsLogSourceTypeValueExtension on AwsLogSourceType {
  String toValue() {
    switch (this) {
      case AwsLogSourceType.route53:
        return 'ROUTE53';
      case AwsLogSourceType.vpcFlow:
        return 'VPC_FLOW';
      case AwsLogSourceType.cloudTrail:
        return 'CLOUD_TRAIL';
      case AwsLogSourceType.shFindings:
        return 'SH_FINDINGS';
    }
  }
}

extension AwsLogSourceTypeFromString on String {
  AwsLogSourceType toAwsLogSourceType() {
    switch (this) {
      case 'ROUTE53':
        return AwsLogSourceType.route53;
      case 'VPC_FLOW':
        return AwsLogSourceType.vpcFlow;
      case 'CLOUD_TRAIL':
        return AwsLogSourceType.cloudTrail;
      case 'SH_FINDINGS':
        return AwsLogSourceType.shFindings;
    }
    throw Exception('$this is not known in enum AwsLogSourceType');
  }
}

class CreateAwsLogSourceResponse {
  /// Lists all accounts in which enabling a natively supported Amazon Web Service
  /// as a Security Lake source failed. The failure occurred as these accounts are
  /// not part of an organization.
  final List<String>? failed;

  /// Lists the accounts that are in the process of enabling a natively supported
  /// Amazon Web Service as a Security Lake source.
  final List<String>? processing;

  CreateAwsLogSourceResponse({
    this.failed,
    this.processing,
  });

  factory CreateAwsLogSourceResponse.fromJson(Map<String, dynamic> json) {
    return CreateAwsLogSourceResponse(
      failed: (json['failed'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      processing: (json['processing'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failed = this.failed;
    final processing = this.processing;
    return {
      if (failed != null) 'failed': failed,
      if (processing != null) 'processing': processing,
    };
  }
}

class CreateCustomLogSourceResponse {
  /// The location of the partition in the Amazon S3 bucket for Security Lake.
  final String customDataLocation;

  /// The name of the Glue crawler.
  final String glueCrawlerName;

  /// The Glue database where results are written, such as:
  /// <code>arn:aws:daylight:us-east-1::database/sometable/*</code>.
  final String glueDatabaseName;

  /// The table name of the Glue crawler.
  final String glueTableName;

  /// The ARN of the IAM role to be used by the entity putting logs into your
  /// custom source partition. Security Lake will apply the correct access
  /// policies to this role, but you must first manually create the trust policy
  /// for this role. The IAM role name must start with the text 'Security Lake'.
  /// The IAM role must trust the <code>logProviderAccountId</code> to assume the
  /// role.
  final String logProviderAccessRoleArn;

  CreateCustomLogSourceResponse({
    required this.customDataLocation,
    required this.glueCrawlerName,
    required this.glueDatabaseName,
    required this.glueTableName,
    required this.logProviderAccessRoleArn,
  });

  factory CreateCustomLogSourceResponse.fromJson(Map<String, dynamic> json) {
    return CreateCustomLogSourceResponse(
      customDataLocation: json['customDataLocation'] as String,
      glueCrawlerName: json['glueCrawlerName'] as String,
      glueDatabaseName: json['glueDatabaseName'] as String,
      glueTableName: json['glueTableName'] as String,
      logProviderAccessRoleArn: json['logProviderAccessRoleArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final customDataLocation = this.customDataLocation;
    final glueCrawlerName = this.glueCrawlerName;
    final glueDatabaseName = this.glueDatabaseName;
    final glueTableName = this.glueTableName;
    final logProviderAccessRoleArn = this.logProviderAccessRoleArn;
    return {
      'customDataLocation': customDataLocation,
      'glueCrawlerName': glueCrawlerName,
      'glueDatabaseName': glueDatabaseName,
      'glueTableName': glueTableName,
      'logProviderAccessRoleArn': logProviderAccessRoleArn,
    };
  }
}

class CreateDatalakeAutoEnableResponse {
  CreateDatalakeAutoEnableResponse();

  factory CreateDatalakeAutoEnableResponse.fromJson(Map<String, dynamic> _) {
    return CreateDatalakeAutoEnableResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CreateDatalakeDelegatedAdminResponse {
  CreateDatalakeDelegatedAdminResponse();

  factory CreateDatalakeDelegatedAdminResponse.fromJson(
      Map<String, dynamic> _) {
    return CreateDatalakeDelegatedAdminResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CreateDatalakeExceptionsSubscriptionResponse {
  CreateDatalakeExceptionsSubscriptionResponse();

  factory CreateDatalakeExceptionsSubscriptionResponse.fromJson(
      Map<String, dynamic> _) {
    return CreateDatalakeExceptionsSubscriptionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CreateDatalakeResponse {
  CreateDatalakeResponse();

  factory CreateDatalakeResponse.fromJson(Map<String, dynamic> _) {
    return CreateDatalakeResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CreateSubscriberResponse {
  /// The <code>subscriptionId</code> created by the <code>CreateSubscriber</code>
  /// API call.
  final String subscriptionId;

  /// The Amazon Resource Name (ARN) which uniquely defines the AWS RAM resource
  /// share. Before accepting the RAM resource share invitation, you can view
  /// details related to the RAM resource share.
  final String? resourceShareArn;

  /// The name of the resource share.
  final String? resourceShareName;

  /// The Amazon Resource Name (ARN) created by you to provide to the subscriber.
  /// For more information about ARNs and how to use them in policies, see <a
  /// href="https://docs.aws.amazon.com/security-lake/latest/userguide/subscriber-management.html">Amazon
  /// Security Lake User Guide</a>.
  final String? roleArn;

  /// The ARN for the Amazon S3 bucket.
  final String? s3BucketArn;

  /// The ARN for the Amazon Simple Notification Service.
  final String? snsArn;

  CreateSubscriberResponse({
    required this.subscriptionId,
    this.resourceShareArn,
    this.resourceShareName,
    this.roleArn,
    this.s3BucketArn,
    this.snsArn,
  });

  factory CreateSubscriberResponse.fromJson(Map<String, dynamic> json) {
    return CreateSubscriberResponse(
      subscriptionId: json['subscriptionId'] as String,
      resourceShareArn: json['resourceShareArn'] as String?,
      resourceShareName: json['resourceShareName'] as String?,
      roleArn: json['roleArn'] as String?,
      s3BucketArn: json['s3BucketArn'] as String?,
      snsArn: json['snsArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final subscriptionId = this.subscriptionId;
    final resourceShareArn = this.resourceShareArn;
    final resourceShareName = this.resourceShareName;
    final roleArn = this.roleArn;
    final s3BucketArn = this.s3BucketArn;
    final snsArn = this.snsArn;
    return {
      'subscriptionId': subscriptionId,
      if (resourceShareArn != null) 'resourceShareArn': resourceShareArn,
      if (resourceShareName != null) 'resourceShareName': resourceShareName,
      if (roleArn != null) 'roleArn': roleArn,
      if (s3BucketArn != null) 's3BucketArn': s3BucketArn,
      if (snsArn != null) 'snsArn': snsArn,
    };
  }
}

class CreateSubscriptionNotificationConfigurationResponse {
  /// Returns the Amazon Resource Name (ARN) of the queue.
  final String? queueArn;

  CreateSubscriptionNotificationConfigurationResponse({
    this.queueArn,
  });

  factory CreateSubscriptionNotificationConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateSubscriptionNotificationConfigurationResponse(
      queueArn: json['queueArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final queueArn = this.queueArn;
    return {
      if (queueArn != null) 'queueArn': queueArn,
    };
  }
}

class DeleteAwsLogSourceResponse {
  /// Deletion of the Amazon Web Services sources failed as the account is not a
  /// part of the organization.
  final List<String>? failed;

  /// Deletion of the Amazon Web Services sources is in progress.
  final List<String>? processing;

  DeleteAwsLogSourceResponse({
    this.failed,
    this.processing,
  });

  factory DeleteAwsLogSourceResponse.fromJson(Map<String, dynamic> json) {
    return DeleteAwsLogSourceResponse(
      failed: (json['failed'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      processing: (json['processing'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failed = this.failed;
    final processing = this.processing;
    return {
      if (failed != null) 'failed': failed,
      if (processing != null) 'processing': processing,
    };
  }
}

class DeleteCustomLogSourceResponse {
  /// The location of the partition in the Amazon S3 bucket for Security Lake.
  final String customDataLocation;

  DeleteCustomLogSourceResponse({
    required this.customDataLocation,
  });

  factory DeleteCustomLogSourceResponse.fromJson(Map<String, dynamic> json) {
    return DeleteCustomLogSourceResponse(
      customDataLocation: json['customDataLocation'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final customDataLocation = this.customDataLocation;
    return {
      'customDataLocation': customDataLocation,
    };
  }
}

class DeleteDatalakeAutoEnableResponse {
  DeleteDatalakeAutoEnableResponse();

  factory DeleteDatalakeAutoEnableResponse.fromJson(Map<String, dynamic> _) {
    return DeleteDatalakeAutoEnableResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteDatalakeDelegatedAdminResponse {
  DeleteDatalakeDelegatedAdminResponse();

  factory DeleteDatalakeDelegatedAdminResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteDatalakeDelegatedAdminResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteDatalakeExceptionsSubscriptionResponse {
  /// Retrieves the status of the delete Security Lake operation for an account.
  final String status;

  DeleteDatalakeExceptionsSubscriptionResponse({
    required this.status,
  });

  factory DeleteDatalakeExceptionsSubscriptionResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteDatalakeExceptionsSubscriptionResponse(
      status: json['status'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status,
    };
  }
}

class DeleteDatalakeResponse {
  DeleteDatalakeResponse();

  factory DeleteDatalakeResponse.fromJson(Map<String, dynamic> _) {
    return DeleteDatalakeResponse();
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

class DeleteSubscriptionNotificationConfigurationResponse {
  DeleteSubscriptionNotificationConfigurationResponse();

  factory DeleteSubscriptionNotificationConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteSubscriptionNotificationConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum Dimension {
  region,
  sourceType,
  member,
}

extension DimensionValueExtension on Dimension {
  String toValue() {
    switch (this) {
      case Dimension.region:
        return 'REGION';
      case Dimension.sourceType:
        return 'SOURCE_TYPE';
      case Dimension.member:
        return 'MEMBER';
    }
  }
}

extension DimensionFromString on String {
  Dimension toDimension() {
    switch (this) {
      case 'REGION':
        return Dimension.region;
      case 'SOURCE_TYPE':
        return Dimension.sourceType;
      case 'MEMBER':
        return Dimension.member;
    }
    throw Exception('$this is not known in enum Dimension');
  }
}

enum EndpointProtocol {
  https,
  sqs,
}

extension EndpointProtocolValueExtension on EndpointProtocol {
  String toValue() {
    switch (this) {
      case EndpointProtocol.https:
        return 'HTTPS';
      case EndpointProtocol.sqs:
        return 'SQS';
    }
  }
}

extension EndpointProtocolFromString on String {
  EndpointProtocol toEndpointProtocol() {
    switch (this) {
      case 'HTTPS':
        return EndpointProtocol.https;
      case 'SQS':
        return EndpointProtocol.sqs;
    }
    throw Exception('$this is not known in enum EndpointProtocol');
  }
}

/// List of all failures.
class Failures {
  /// List of all exception messages.
  final String exceptionMessage;

  /// List of all remediation steps for failures.
  final String remediation;

  /// This error can occur if you configure the wrong timestamp format, or if the
  /// subset of entries used for validation had errors or missing values.
  final DateTime timestamp;

  Failures({
    required this.exceptionMessage,
    required this.remediation,
    required this.timestamp,
  });

  factory Failures.fromJson(Map<String, dynamic> json) {
    return Failures(
      exceptionMessage: json['exceptionMessage'] as String,
      remediation: json['remediation'] as String,
      timestamp: nonNullableTimeStampFromJson(json['timestamp'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final exceptionMessage = this.exceptionMessage;
    final remediation = this.remediation;
    final timestamp = this.timestamp;
    return {
      'exceptionMessage': exceptionMessage,
      'remediation': remediation,
      'timestamp': iso8601ToJson(timestamp),
    };
  }
}

/// Response element for actions that make changes, namely create, update, or
/// delete actions.
class FailuresResponse {
  /// List of all failures.
  final List<Failures>? failures;

  /// List of Amazon Web Services Regions where the failure occurred.
  final String? region;

  FailuresResponse({
    this.failures,
    this.region,
  });

  factory FailuresResponse.fromJson(Map<String, dynamic> json) {
    return FailuresResponse(
      failures: (json['failures'] as List?)
          ?.whereNotNull()
          .map((e) => Failures.fromJson(e as Map<String, dynamic>))
          .toList(),
      region: json['region'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final failures = this.failures;
    final region = this.region;
    return {
      if (failures != null) 'failures': failures,
      if (region != null) 'region': region,
    };
  }
}

class GetDatalakeAutoEnableResponse {
  /// The configuration for new accounts.
  final List<AutoEnableNewRegionConfiguration> autoEnableNewAccounts;

  GetDatalakeAutoEnableResponse({
    required this.autoEnableNewAccounts,
  });

  factory GetDatalakeAutoEnableResponse.fromJson(Map<String, dynamic> json) {
    return GetDatalakeAutoEnableResponse(
      autoEnableNewAccounts: (json['autoEnableNewAccounts'] as List)
          .whereNotNull()
          .map((e) => AutoEnableNewRegionConfiguration.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final autoEnableNewAccounts = this.autoEnableNewAccounts;
    return {
      'autoEnableNewAccounts': autoEnableNewAccounts,
    };
  }
}

class GetDatalakeExceptionsExpiryResponse {
  /// The expiration period and time-to-live (TTL).
  final int exceptionMessageExpiry;

  GetDatalakeExceptionsExpiryResponse({
    required this.exceptionMessageExpiry,
  });

  factory GetDatalakeExceptionsExpiryResponse.fromJson(
      Map<String, dynamic> json) {
    return GetDatalakeExceptionsExpiryResponse(
      exceptionMessageExpiry: json['exceptionMessageExpiry'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final exceptionMessageExpiry = this.exceptionMessageExpiry;
    return {
      'exceptionMessageExpiry': exceptionMessageExpiry,
    };
  }
}

class GetDatalakeExceptionsSubscriptionResponse {
  /// Retrieves the exception notification subscription information.
  final ProtocolAndNotificationEndpoint protocolAndNotificationEndpoint;

  GetDatalakeExceptionsSubscriptionResponse({
    required this.protocolAndNotificationEndpoint,
  });

  factory GetDatalakeExceptionsSubscriptionResponse.fromJson(
      Map<String, dynamic> json) {
    return GetDatalakeExceptionsSubscriptionResponse(
      protocolAndNotificationEndpoint: ProtocolAndNotificationEndpoint.fromJson(
          json['protocolAndNotificationEndpoint'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final protocolAndNotificationEndpoint =
        this.protocolAndNotificationEndpoint;
    return {
      'protocolAndNotificationEndpoint': protocolAndNotificationEndpoint,
    };
  }
}

class GetDatalakeResponse {
  /// Retrieves the Security Lake configuration object.
  final Map<Region, LakeConfigurationResponse> configurations;

  GetDatalakeResponse({
    required this.configurations,
  });

  factory GetDatalakeResponse.fromJson(Map<String, dynamic> json) {
    return GetDatalakeResponse(
      configurations: (json['configurations'] as Map<String, dynamic>).map(
          (k, e) => MapEntry(k.toRegion(),
              LakeConfigurationResponse.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final configurations = this.configurations;
    return {
      'configurations': configurations.map((k, e) => MapEntry(k.toValue(), e)),
    };
  }
}

class GetDatalakeStatusResponse {
  /// The list of enabled accounts and enabled sources.
  final List<AccountSources> accountSourcesList;

  /// Lists if there are more results available. The value of nextToken is a
  /// unique pagination token for each page. Repeat the call using the returned
  /// token to retrieve the next page. Keep all other arguments unchanged.
  ///
  /// Each pagination token expires after 24 hours. Using an expired pagination
  /// token will return an HTTP 400 InvalidToken error.
  final String? nextToken;

  GetDatalakeStatusResponse({
    required this.accountSourcesList,
    this.nextToken,
  });

  factory GetDatalakeStatusResponse.fromJson(Map<String, dynamic> json) {
    return GetDatalakeStatusResponse(
      accountSourcesList: (json['accountSourcesList'] as List)
          .whereNotNull()
          .map((e) => AccountSources.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountSourcesList = this.accountSourcesList;
    final nextToken = this.nextToken;
    return {
      'accountSourcesList': accountSourcesList,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class GetSubscriberResponse {
  /// The subscription information for the specified subscription ID.
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

enum HttpsMethod {
  post,
  put,
}

extension HttpsMethodValueExtension on HttpsMethod {
  String toValue() {
    switch (this) {
      case HttpsMethod.post:
        return 'POST';
      case HttpsMethod.put:
        return 'PUT';
    }
  }
}

extension HttpsMethodFromString on String {
  HttpsMethod toHttpsMethod() {
    switch (this) {
      case 'POST':
        return HttpsMethod.post;
      case 'PUT':
        return HttpsMethod.put;
    }
    throw Exception('$this is not known in enum HttpsMethod');
  }
}

/// Provides details of Amazon Security Lake configuration object.
class LakeConfigurationRequest {
  /// The type of encryption key used by Amazon Security Lake to encrypt the
  /// Security Lake configuration object.
  final String? encryptionKey;

  /// Replication enables automatic, asynchronous copying of objects across Amazon
  /// S3 buckets. Amazon S3 buckets that are configured for object replication can
  /// be owned by the same Amazon Web Services account or by different accounts.
  /// You can replicate objects to a single destination bucket or to multiple
  /// destination buckets. The destination buckets can be in different Amazon Web
  /// Services Regions or within the same Region as the source bucket.
  ///
  /// Set up one or more rollup Regions by providing the Region or Regions that
  /// should contribute to the central rollup Region.
  final List<Region>? replicationDestinationRegions;

  /// Replication settings for the Amazon S3 buckets. This parameter uses the
  /// Identity and Access Management (IAM) role you created that is managed by
  /// Security Lake, to ensure the replication setting is correct.
  final String? replicationRoleArn;

  /// Retention settings for the destination Amazon S3 buckets.
  final List<RetentionSetting>? retentionSettings;

  /// A tag is a label that you assign to an Amazon Web Services resource. Each
  /// tag consists of a key and an optional value, both of which you define.
  final Map<String, String>? tagsMap;

  LakeConfigurationRequest({
    this.encryptionKey,
    this.replicationDestinationRegions,
    this.replicationRoleArn,
    this.retentionSettings,
    this.tagsMap,
  });

  Map<String, dynamic> toJson() {
    final encryptionKey = this.encryptionKey;
    final replicationDestinationRegions = this.replicationDestinationRegions;
    final replicationRoleArn = this.replicationRoleArn;
    final retentionSettings = this.retentionSettings;
    final tagsMap = this.tagsMap;
    return {
      if (encryptionKey != null) 'encryptionKey': encryptionKey,
      if (replicationDestinationRegions != null)
        'replicationDestinationRegions':
            replicationDestinationRegions.map((e) => e.toValue()).toList(),
      if (replicationRoleArn != null) 'replicationRoleArn': replicationRoleArn,
      if (retentionSettings != null) 'retentionSettings': retentionSettings,
      if (tagsMap != null) 'tagsMap': tagsMap,
    };
  }
}

/// Provides details of Amazon Security Lake lake configuration object.
class LakeConfigurationResponse {
  /// The type of encryption key used by secure the Security Lake configuration
  /// object.
  final String? encryptionKey;

  /// Replication enables automatic, asynchronous copying of objects across Amazon
  /// S3 buckets. Amazon S3 buckets that are configured for object replication can
  /// be owned by the same Amazon Web Services account or by different accounts.
  /// You can replicate objects to a single destination bucket or to multiple
  /// destination buckets. The destination buckets can be in different Amazon Web
  /// Services Regions or within the same Region as the source bucket.
  ///
  /// Set up one or more rollup Regions by providing the Region or Regions that
  /// should contribute to the central rollup Region.
  final List<Region>? replicationDestinationRegions;

  /// Replication settings for the Amazon S3 buckets. This parameter uses the IAM
  /// role you created that is managed by Security Lake, to ensure the replication
  /// setting is correct.
  final String? replicationRoleArn;

  /// Retention settings for the destination Amazon S3 buckets.
  final List<RetentionSetting>? retentionSettings;

  /// Amazon Resource Names (ARNs) uniquely identify Amazon Web Services
  /// resources. Security Lake requires an ARN when you need to specify a resource
  /// unambiguously across all of Amazon Web Services, such as in IAM policies,
  /// Amazon Relational Database Service (Amazon RDS) tags, and API calls.
  final String? s3BucketArn;

  /// Retrieves the status of the configuration operation for an account in Amazon
  /// Security Lake.
  final SettingsStatus? status;

  /// A tag is a label that you assign to an Amazon Web Services resource. Each
  /// tag consists of a key and an optional value, both of which you define.
  final Map<String, String>? tagsMap;

  /// The status of the last <code>UpdateDatalake </code>or
  /// <code>DeleteDatalake</code> API request.
  final UpdateStatus? updateStatus;

  LakeConfigurationResponse({
    this.encryptionKey,
    this.replicationDestinationRegions,
    this.replicationRoleArn,
    this.retentionSettings,
    this.s3BucketArn,
    this.status,
    this.tagsMap,
    this.updateStatus,
  });

  factory LakeConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return LakeConfigurationResponse(
      encryptionKey: json['encryptionKey'] as String?,
      replicationDestinationRegions:
          (json['replicationDestinationRegions'] as List?)
              ?.whereNotNull()
              .map((e) => (e as String).toRegion())
              .toList(),
      replicationRoleArn: json['replicationRoleArn'] as String?,
      retentionSettings: (json['retentionSettings'] as List?)
          ?.whereNotNull()
          .map((e) => RetentionSetting.fromJson(e as Map<String, dynamic>))
          .toList(),
      s3BucketArn: json['s3BucketArn'] as String?,
      status: (json['status'] as String?)?.toSettingsStatus(),
      tagsMap: (json['tagsMap'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      updateStatus: json['updateStatus'] != null
          ? UpdateStatus.fromJson(json['updateStatus'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionKey = this.encryptionKey;
    final replicationDestinationRegions = this.replicationDestinationRegions;
    final replicationRoleArn = this.replicationRoleArn;
    final retentionSettings = this.retentionSettings;
    final s3BucketArn = this.s3BucketArn;
    final status = this.status;
    final tagsMap = this.tagsMap;
    final updateStatus = this.updateStatus;
    return {
      if (encryptionKey != null) 'encryptionKey': encryptionKey,
      if (replicationDestinationRegions != null)
        'replicationDestinationRegions':
            replicationDestinationRegions.map((e) => e.toValue()).toList(),
      if (replicationRoleArn != null) 'replicationRoleArn': replicationRoleArn,
      if (retentionSettings != null) 'retentionSettings': retentionSettings,
      if (s3BucketArn != null) 's3BucketArn': s3BucketArn,
      if (status != null) 'status': status.toValue(),
      if (tagsMap != null) 'tagsMap': tagsMap,
      if (updateStatus != null) 'updateStatus': updateStatus,
    };
  }
}

/// The details of the last <code>UpdateDatalake</code> or
/// <code>DeleteDatalake</code> API request which failed.
class LastUpdateFailure {
  /// The reason code for the failure of the last <code>UpdateDatalake</code> or
  /// <code>DeleteDatalake</code> API request.
  final String? code;

  /// The reason for the failure of the last <code>UpdateDatalake</code>or
  /// <code>DeleteDatalake</code> API request.
  final String? reason;

  LastUpdateFailure({
    this.code,
    this.reason,
  });

  factory LastUpdateFailure.fromJson(Map<String, dynamic> json) {
    return LastUpdateFailure(
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

class ListDatalakeExceptionsResponse {
  /// Lists the failures that cannot be retried in the current Region.
  final List<FailuresResponse> nonRetryableFailures;

  /// List if there are more results available. The value of nextToken is a unique
  /// pagination token for each page. Repeat the call using the returned token to
  /// retrieve the next page. Keep all other arguments unchanged.
  ///
  /// Each pagination token expires after 24 hours. Using an expired pagination
  /// token will return an HTTP 400 InvalidToken error.
  final String? nextToken;

  ListDatalakeExceptionsResponse({
    required this.nonRetryableFailures,
    this.nextToken,
  });

  factory ListDatalakeExceptionsResponse.fromJson(Map<String, dynamic> json) {
    return ListDatalakeExceptionsResponse(
      nonRetryableFailures: (json['nonRetryableFailures'] as List)
          .whereNotNull()
          .map((e) => FailuresResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final nonRetryableFailures = this.nonRetryableFailures;
    final nextToken = this.nextToken;
    return {
      'nonRetryableFailures': nonRetryableFailures,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListLogSourcesResponse {
  /// Lists the log sources by Regions for enabled Security Lake accounts.
  final List<Map<String, Map<String, List<String>>>>
      regionSourceTypesAccountsList;

  /// If nextToken is returned, there are more results available. You can repeat
  /// the call using the returned token to retrieve the next page.
  final String? nextToken;

  ListLogSourcesResponse({
    required this.regionSourceTypesAccountsList,
    this.nextToken,
  });

  factory ListLogSourcesResponse.fromJson(Map<String, dynamic> json) {
    return ListLogSourcesResponse(
      regionSourceTypesAccountsList:
          (json['regionSourceTypesAccountsList'] as List)
              .whereNotNull()
              .map((e) => (e as Map<String, dynamic>).map((k, e) => MapEntry(
                  k,
                  (e as Map<String, dynamic>).map((k, e) => MapEntry(
                      k,
                      (e as List)
                          .whereNotNull()
                          .map((e) => e as String)
                          .toList())))))
              .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final regionSourceTypesAccountsList = this.regionSourceTypesAccountsList;
    final nextToken = this.nextToken;
    return {
      'regionSourceTypesAccountsList': regionSourceTypesAccountsList,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListSubscribersResponse {
  /// The subscribers available for the specified Security Lake account ID.
  final List<SubscriberResource> subscribers;

  /// If nextToken is returned, there are more results available. You can repeat
  /// the call using the returned token to retrieve the next page.
  final String? nextToken;

  ListSubscribersResponse({
    required this.subscribers,
    this.nextToken,
  });

  factory ListSubscribersResponse.fromJson(Map<String, dynamic> json) {
    return ListSubscribersResponse(
      subscribers: (json['subscribers'] as List)
          .whereNotNull()
          .map((e) => SubscriberResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final subscribers = this.subscribers;
    final nextToken = this.nextToken;
    return {
      'subscribers': subscribers,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Retrieves the Logs status for the Amazon Security Lake account.
class LogsStatus {
  /// The health status of services, including error codes and patterns.
  final SourceStatus healthStatus;

  /// Defines path the stored logs are available which has information on your
  /// systems, applications, and services.
  final String pathToLogs;

  LogsStatus({
    required this.healthStatus,
    required this.pathToLogs,
  });

  factory LogsStatus.fromJson(Map<String, dynamic> json) {
    return LogsStatus(
      healthStatus: (json['healthStatus'] as String).toSourceStatus(),
      pathToLogs: json['pathToLogs'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final healthStatus = this.healthStatus;
    final pathToLogs = this.pathToLogs;
    return {
      'healthStatus': healthStatus.toValue(),
      'pathToLogs': pathToLogs,
    };
  }
}

enum OcsfEventClass {
  accessActivity,
  fileActivity,
  kernelActivity,
  kernelExtension,
  memoryActivity,
  moduleActivity,
  processActivity,
  registryKeyActivity,
  registryValueActivity,
  resourceActivity,
  scheduledJobActivity,
  securityFinding,
  accountChange,
  authentication,
  authorization,
  entityManagementAudit,
  dhcpActivity,
  networkActivity,
  dnsActivity,
  ftpActivity,
  httpActivity,
  rdpActivity,
  smbActivity,
  sshActivity,
  cloudApi,
  containerLifecycle,
  databaseLifecycle,
  configState,
  cloudStorage,
  inventoryInfo,
  rfbActivity,
  smtpActivity,
  virtualMachineActivity,
}

extension OcsfEventClassValueExtension on OcsfEventClass {
  String toValue() {
    switch (this) {
      case OcsfEventClass.accessActivity:
        return 'ACCESS_ACTIVITY';
      case OcsfEventClass.fileActivity:
        return 'FILE_ACTIVITY';
      case OcsfEventClass.kernelActivity:
        return 'KERNEL_ACTIVITY';
      case OcsfEventClass.kernelExtension:
        return 'KERNEL_EXTENSION';
      case OcsfEventClass.memoryActivity:
        return 'MEMORY_ACTIVITY';
      case OcsfEventClass.moduleActivity:
        return 'MODULE_ACTIVITY';
      case OcsfEventClass.processActivity:
        return 'PROCESS_ACTIVITY';
      case OcsfEventClass.registryKeyActivity:
        return 'REGISTRY_KEY_ACTIVITY';
      case OcsfEventClass.registryValueActivity:
        return 'REGISTRY_VALUE_ACTIVITY';
      case OcsfEventClass.resourceActivity:
        return 'RESOURCE_ACTIVITY';
      case OcsfEventClass.scheduledJobActivity:
        return 'SCHEDULED_JOB_ACTIVITY';
      case OcsfEventClass.securityFinding:
        return 'SECURITY_FINDING';
      case OcsfEventClass.accountChange:
        return 'ACCOUNT_CHANGE';
      case OcsfEventClass.authentication:
        return 'AUTHENTICATION';
      case OcsfEventClass.authorization:
        return 'AUTHORIZATION';
      case OcsfEventClass.entityManagementAudit:
        return 'ENTITY_MANAGEMENT_AUDIT';
      case OcsfEventClass.dhcpActivity:
        return 'DHCP_ACTIVITY';
      case OcsfEventClass.networkActivity:
        return 'NETWORK_ACTIVITY';
      case OcsfEventClass.dnsActivity:
        return 'DNS_ACTIVITY';
      case OcsfEventClass.ftpActivity:
        return 'FTP_ACTIVITY';
      case OcsfEventClass.httpActivity:
        return 'HTTP_ACTIVITY';
      case OcsfEventClass.rdpActivity:
        return 'RDP_ACTIVITY';
      case OcsfEventClass.smbActivity:
        return 'SMB_ACTIVITY';
      case OcsfEventClass.sshActivity:
        return 'SSH_ACTIVITY';
      case OcsfEventClass.cloudApi:
        return 'CLOUD_API';
      case OcsfEventClass.containerLifecycle:
        return 'CONTAINER_LIFECYCLE';
      case OcsfEventClass.databaseLifecycle:
        return 'DATABASE_LIFECYCLE';
      case OcsfEventClass.configState:
        return 'CONFIG_STATE';
      case OcsfEventClass.cloudStorage:
        return 'CLOUD_STORAGE';
      case OcsfEventClass.inventoryInfo:
        return 'INVENTORY_INFO';
      case OcsfEventClass.rfbActivity:
        return 'RFB_ACTIVITY';
      case OcsfEventClass.smtpActivity:
        return 'SMTP_ACTIVITY';
      case OcsfEventClass.virtualMachineActivity:
        return 'VIRTUAL_MACHINE_ACTIVITY';
    }
  }
}

extension OcsfEventClassFromString on String {
  OcsfEventClass toOcsfEventClass() {
    switch (this) {
      case 'ACCESS_ACTIVITY':
        return OcsfEventClass.accessActivity;
      case 'FILE_ACTIVITY':
        return OcsfEventClass.fileActivity;
      case 'KERNEL_ACTIVITY':
        return OcsfEventClass.kernelActivity;
      case 'KERNEL_EXTENSION':
        return OcsfEventClass.kernelExtension;
      case 'MEMORY_ACTIVITY':
        return OcsfEventClass.memoryActivity;
      case 'MODULE_ACTIVITY':
        return OcsfEventClass.moduleActivity;
      case 'PROCESS_ACTIVITY':
        return OcsfEventClass.processActivity;
      case 'REGISTRY_KEY_ACTIVITY':
        return OcsfEventClass.registryKeyActivity;
      case 'REGISTRY_VALUE_ACTIVITY':
        return OcsfEventClass.registryValueActivity;
      case 'RESOURCE_ACTIVITY':
        return OcsfEventClass.resourceActivity;
      case 'SCHEDULED_JOB_ACTIVITY':
        return OcsfEventClass.scheduledJobActivity;
      case 'SECURITY_FINDING':
        return OcsfEventClass.securityFinding;
      case 'ACCOUNT_CHANGE':
        return OcsfEventClass.accountChange;
      case 'AUTHENTICATION':
        return OcsfEventClass.authentication;
      case 'AUTHORIZATION':
        return OcsfEventClass.authorization;
      case 'ENTITY_MANAGEMENT_AUDIT':
        return OcsfEventClass.entityManagementAudit;
      case 'DHCP_ACTIVITY':
        return OcsfEventClass.dhcpActivity;
      case 'NETWORK_ACTIVITY':
        return OcsfEventClass.networkActivity;
      case 'DNS_ACTIVITY':
        return OcsfEventClass.dnsActivity;
      case 'FTP_ACTIVITY':
        return OcsfEventClass.ftpActivity;
      case 'HTTP_ACTIVITY':
        return OcsfEventClass.httpActivity;
      case 'RDP_ACTIVITY':
        return OcsfEventClass.rdpActivity;
      case 'SMB_ACTIVITY':
        return OcsfEventClass.smbActivity;
      case 'SSH_ACTIVITY':
        return OcsfEventClass.sshActivity;
      case 'CLOUD_API':
        return OcsfEventClass.cloudApi;
      case 'CONTAINER_LIFECYCLE':
        return OcsfEventClass.containerLifecycle;
      case 'DATABASE_LIFECYCLE':
        return OcsfEventClass.databaseLifecycle;
      case 'CONFIG_STATE':
        return OcsfEventClass.configState;
      case 'CLOUD_STORAGE':
        return OcsfEventClass.cloudStorage;
      case 'INVENTORY_INFO':
        return OcsfEventClass.inventoryInfo;
      case 'RFB_ACTIVITY':
        return OcsfEventClass.rfbActivity;
      case 'SMTP_ACTIVITY':
        return OcsfEventClass.smtpActivity;
      case 'VIRTUAL_MACHINE_ACTIVITY':
        return OcsfEventClass.virtualMachineActivity;
    }
    throw Exception('$this is not known in enum OcsfEventClass');
  }
}

/// Protocol used in Amazon Security Lake that dictates how notifications are
/// posted at the endpoint.
class ProtocolAndNotificationEndpoint {
  /// The account that is subscribed to receive exception notifications.
  final String? endpoint;

  /// The protocol to which notification messages are posted.
  final String? protocol;

  ProtocolAndNotificationEndpoint({
    this.endpoint,
    this.protocol,
  });

  factory ProtocolAndNotificationEndpoint.fromJson(Map<String, dynamic> json) {
    return ProtocolAndNotificationEndpoint(
      endpoint: json['endpoint'] as String?,
      protocol: json['protocol'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endpoint = this.endpoint;
    final protocol = this.protocol;
    return {
      if (endpoint != null) 'endpoint': endpoint,
      if (protocol != null) 'protocol': protocol,
    };
  }
}

enum Region {
  usEast_1,
  usWest_2,
  euCentral_1,
  usEast_2,
  euWest_1,
  apNortheast_1,
  apSoutheast_2,
}

extension RegionValueExtension on Region {
  String toValue() {
    switch (this) {
      case Region.usEast_1:
        return 'us-east-1';
      case Region.usWest_2:
        return 'us-west-2';
      case Region.euCentral_1:
        return 'eu-central-1';
      case Region.usEast_2:
        return 'us-east-2';
      case Region.euWest_1:
        return 'eu-west-1';
      case Region.apNortheast_1:
        return 'ap-northeast-1';
      case Region.apSoutheast_2:
        return 'ap-southeast-2';
    }
  }
}

extension RegionFromString on String {
  Region toRegion() {
    switch (this) {
      case 'us-east-1':
        return Region.usEast_1;
      case 'us-west-2':
        return Region.usWest_2;
      case 'eu-central-1':
        return Region.euCentral_1;
      case 'us-east-2':
        return Region.usEast_2;
      case 'eu-west-1':
        return Region.euWest_1;
      case 'ap-northeast-1':
        return Region.apNortheast_1;
      case 'ap-southeast-2':
        return Region.apSoutheast_2;
    }
    throw Exception('$this is not known in enum Region');
  }
}

/// Retention settings for the destination Amazon S3 buckets in Amazon Security
/// Lake.
class RetentionSetting {
  /// The retention period specifies a fixed period of time during which the
  /// Security Lake object remains locked. You can specify the retention period in
  /// days for one or more sources.
  final int? retentionPeriod;

  /// The range of storage classes that you can choose from based on the data
  /// access, resiliency, and cost requirements of your workloads.
  final StorageClass? storageClass;

  RetentionSetting({
    this.retentionPeriod,
    this.storageClass,
  });

  factory RetentionSetting.fromJson(Map<String, dynamic> json) {
    return RetentionSetting(
      retentionPeriod: json['retentionPeriod'] as int?,
      storageClass: (json['storageClass'] as String?)?.toStorageClass(),
    );
  }

  Map<String, dynamic> toJson() {
    final retentionPeriod = this.retentionPeriod;
    final storageClass = this.storageClass;
    return {
      if (retentionPeriod != null) 'retentionPeriod': retentionPeriod,
      if (storageClass != null) 'storageClass': storageClass.toValue(),
    };
  }
}

enum SourceStatus {
  active,
  deactivated,
  pending,
}

extension SourceStatusValueExtension on SourceStatus {
  String toValue() {
    switch (this) {
      case SourceStatus.active:
        return 'ACTIVE';
      case SourceStatus.deactivated:
        return 'DEACTIVATED';
      case SourceStatus.pending:
        return 'PENDING';
    }
  }
}

extension SourceStatusFromString on String {
  SourceStatus toSourceStatus() {
    switch (this) {
      case 'ACTIVE':
        return SourceStatus.active;
      case 'DEACTIVATED':
        return SourceStatus.deactivated;
      case 'PENDING':
        return SourceStatus.pending;
    }
    throw Exception('$this is not known in enum SourceStatus');
  }
}

/// The supported source types from which logs and events are collected in
/// Amazon Security Lake. For the list of supported Amazon Web Services, see the
/// <a
/// href="https://docs.aws.amazon.com/security-lake/latest/userguide/internal-sources.html">Amazon
/// Security Lake User Guide</a>.
class SourceType {
  /// Amazon Security Lake supports log and event collection for natively
  /// supported Amazon Web Services.
  final AwsLogSourceType? awsSourceType;

  /// Amazon Security Lake supports custom source types. For a detailed list, see
  /// the Amazon Security Lake User Guide.
  final String? customSourceType;

  SourceType({
    this.awsSourceType,
    this.customSourceType,
  });

  factory SourceType.fromJson(Map<String, dynamic> json) {
    return SourceType(
      awsSourceType: (json['awsSourceType'] as String?)?.toAwsLogSourceType(),
      customSourceType: json['customSourceType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final awsSourceType = this.awsSourceType;
    final customSourceType = this.customSourceType;
    return {
      if (awsSourceType != null) 'awsSourceType': awsSourceType.toValue(),
      if (customSourceType != null) 'customSourceType': customSourceType,
    };
  }
}

enum StorageClass {
  standardIa,
  onezoneIa,
  intelligentTiering,
  glacierIr,
  glacier,
  deepArchive,
  expire,
}

extension StorageClassValueExtension on StorageClass {
  String toValue() {
    switch (this) {
      case StorageClass.standardIa:
        return 'STANDARD_IA';
      case StorageClass.onezoneIa:
        return 'ONEZONE_IA';
      case StorageClass.intelligentTiering:
        return 'INTELLIGENT_TIERING';
      case StorageClass.glacierIr:
        return 'GLACIER_IR';
      case StorageClass.glacier:
        return 'GLACIER';
      case StorageClass.deepArchive:
        return 'DEEP_ARCHIVE';
      case StorageClass.expire:
        return 'EXPIRE';
    }
  }
}

extension StorageClassFromString on String {
  StorageClass toStorageClass() {
    switch (this) {
      case 'STANDARD_IA':
        return StorageClass.standardIa;
      case 'ONEZONE_IA':
        return StorageClass.onezoneIa;
      case 'INTELLIGENT_TIERING':
        return StorageClass.intelligentTiering;
      case 'GLACIER_IR':
        return StorageClass.glacierIr;
      case 'GLACIER':
        return StorageClass.glacier;
      case 'DEEP_ARCHIVE':
        return StorageClass.deepArchive;
      case 'EXPIRE':
        return StorageClass.expire;
    }
    throw Exception('$this is not known in enum StorageClass');
  }
}

/// Provides details about the Amazon Security Lake account subscription.
/// Subscribers are notified of new objects for a source as the data is written
/// to your Amazon S3 bucket for Security Lake.
class SubscriberResource {
  /// The Amazon Web Services account ID you are using to create your Amazon
  /// Security Lake account.
  final String accountId;

  /// Amazon Security Lake supports log and event collection for natively
  /// supported Amazon Web Services. For more information, see the Amazon Security
  /// Lake User Guide.
  final List<SourceType> sourceTypes;

  /// The subscription ID of the Amazon Security Lake subscriber account.
  final String subscriptionId;

  /// You can choose to notify subscribers of new objects with an Amazon Simple
  /// Queue Service (Amazon SQS) queue or through messaging to an HTTPS endpoint
  /// provided by the subscriber.
  ///
  /// Subscribers can consume data by directly querying Lake Formation tables in
  /// your Amazon S3 bucket through services like Amazon Athena. This subscription
  /// type is defined as <code>LAKEFORMATION</code>.
  final List<AccessType>? accessTypes;

  /// The date and time when the subscription was created.
  final DateTime? createdAt;

  /// The external ID of the subscriber. The external ID lets the user that is
  /// assuming the role assert the circumstances in which they are operating. It
  /// also provides a way for the account owner to permit the role to be assumed
  /// only under specific circumstances.
  final String? externalId;

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

  /// The ARN for the Amazon Simple Notification Service.
  final String? snsArn;

  /// The subscriber descriptions for a subscriber account. The description for a
  /// subscriber includes <code>subscriberName</code>, <code>accountID</code>,
  /// <code>externalID</code>, and <code>subscriptionId</code>.
  final String? subscriberDescription;

  /// The name of your Amazon Security Lake subscriber account.
  final String? subscriberName;

  /// The subscription endpoint to which exception messages are posted.
  final String? subscriptionEndpoint;

  /// The subscription protocol to which exception messages are posted.
  final EndpointProtocol? subscriptionProtocol;

  /// The subscription status of the Amazon Security Lake subscriber account.
  final SubscriptionStatus? subscriptionStatus;

  /// The date and time when the subscription was created.
  final DateTime? updatedAt;

  SubscriberResource({
    required this.accountId,
    required this.sourceTypes,
    required this.subscriptionId,
    this.accessTypes,
    this.createdAt,
    this.externalId,
    this.resourceShareArn,
    this.resourceShareName,
    this.roleArn,
    this.s3BucketArn,
    this.snsArn,
    this.subscriberDescription,
    this.subscriberName,
    this.subscriptionEndpoint,
    this.subscriptionProtocol,
    this.subscriptionStatus,
    this.updatedAt,
  });

  factory SubscriberResource.fromJson(Map<String, dynamic> json) {
    return SubscriberResource(
      accountId: json['accountId'] as String,
      sourceTypes: (json['sourceTypes'] as List)
          .whereNotNull()
          .map((e) => SourceType.fromJson(e as Map<String, dynamic>))
          .toList(),
      subscriptionId: json['subscriptionId'] as String,
      accessTypes: (json['accessTypes'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toAccessType())
          .toList(),
      createdAt: timeStampFromJson(json['createdAt']),
      externalId: json['externalId'] as String?,
      resourceShareArn: json['resourceShareArn'] as String?,
      resourceShareName: json['resourceShareName'] as String?,
      roleArn: json['roleArn'] as String?,
      s3BucketArn: json['s3BucketArn'] as String?,
      snsArn: json['snsArn'] as String?,
      subscriberDescription: json['subscriberDescription'] as String?,
      subscriberName: json['subscriberName'] as String?,
      subscriptionEndpoint: json['subscriptionEndpoint'] as String?,
      subscriptionProtocol:
          (json['subscriptionProtocol'] as String?)?.toEndpointProtocol(),
      subscriptionStatus:
          (json['subscriptionStatus'] as String?)?.toSubscriptionStatus(),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final sourceTypes = this.sourceTypes;
    final subscriptionId = this.subscriptionId;
    final accessTypes = this.accessTypes;
    final createdAt = this.createdAt;
    final externalId = this.externalId;
    final resourceShareArn = this.resourceShareArn;
    final resourceShareName = this.resourceShareName;
    final roleArn = this.roleArn;
    final s3BucketArn = this.s3BucketArn;
    final snsArn = this.snsArn;
    final subscriberDescription = this.subscriberDescription;
    final subscriberName = this.subscriberName;
    final subscriptionEndpoint = this.subscriptionEndpoint;
    final subscriptionProtocol = this.subscriptionProtocol;
    final subscriptionStatus = this.subscriptionStatus;
    final updatedAt = this.updatedAt;
    return {
      'accountId': accountId,
      'sourceTypes': sourceTypes,
      'subscriptionId': subscriptionId,
      if (accessTypes != null)
        'accessTypes': accessTypes.map((e) => e.toValue()).toList(),
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (externalId != null) 'externalId': externalId,
      if (resourceShareArn != null) 'resourceShareArn': resourceShareArn,
      if (resourceShareName != null) 'resourceShareName': resourceShareName,
      if (roleArn != null) 'roleArn': roleArn,
      if (s3BucketArn != null) 's3BucketArn': s3BucketArn,
      if (snsArn != null) 'snsArn': snsArn,
      if (subscriberDescription != null)
        'subscriberDescription': subscriberDescription,
      if (subscriberName != null) 'subscriberName': subscriberName,
      if (subscriptionEndpoint != null)
        'subscriptionEndpoint': subscriptionEndpoint,
      if (subscriptionProtocol != null)
        'subscriptionProtocol': subscriptionProtocol.toValue(),
      if (subscriptionStatus != null)
        'subscriptionStatus': subscriptionStatus.toValue(),
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

enum SubscriptionProtocolType {
  http,
  https,
  email,
  emailJson,
  sms,
  sqs,
  lambda,
  app,
  firehose,
}

extension SubscriptionProtocolTypeValueExtension on SubscriptionProtocolType {
  String toValue() {
    switch (this) {
      case SubscriptionProtocolType.http:
        return 'HTTP';
      case SubscriptionProtocolType.https:
        return 'HTTPS';
      case SubscriptionProtocolType.email:
        return 'EMAIL';
      case SubscriptionProtocolType.emailJson:
        return 'EMAIL_JSON';
      case SubscriptionProtocolType.sms:
        return 'SMS';
      case SubscriptionProtocolType.sqs:
        return 'SQS';
      case SubscriptionProtocolType.lambda:
        return 'LAMBDA';
      case SubscriptionProtocolType.app:
        return 'APP';
      case SubscriptionProtocolType.firehose:
        return 'FIREHOSE';
    }
  }
}

extension SubscriptionProtocolTypeFromString on String {
  SubscriptionProtocolType toSubscriptionProtocolType() {
    switch (this) {
      case 'HTTP':
        return SubscriptionProtocolType.http;
      case 'HTTPS':
        return SubscriptionProtocolType.https;
      case 'EMAIL':
        return SubscriptionProtocolType.email;
      case 'EMAIL_JSON':
        return SubscriptionProtocolType.emailJson;
      case 'SMS':
        return SubscriptionProtocolType.sms;
      case 'SQS':
        return SubscriptionProtocolType.sqs;
      case 'LAMBDA':
        return SubscriptionProtocolType.lambda;
      case 'APP':
        return SubscriptionProtocolType.app;
      case 'FIREHOSE':
        return SubscriptionProtocolType.firehose;
    }
    throw Exception('$this is not known in enum SubscriptionProtocolType');
  }
}

enum SubscriptionStatus {
  active,
  deactivated,
  pending,
  ready,
}

extension SubscriptionStatusValueExtension on SubscriptionStatus {
  String toValue() {
    switch (this) {
      case SubscriptionStatus.active:
        return 'ACTIVE';
      case SubscriptionStatus.deactivated:
        return 'DEACTIVATED';
      case SubscriptionStatus.pending:
        return 'PENDING';
      case SubscriptionStatus.ready:
        return 'READY';
    }
  }
}

extension SubscriptionStatusFromString on String {
  SubscriptionStatus toSubscriptionStatus() {
    switch (this) {
      case 'ACTIVE':
        return SubscriptionStatus.active;
      case 'DEACTIVATED':
        return SubscriptionStatus.deactivated;
      case 'PENDING':
        return SubscriptionStatus.pending;
      case 'READY':
        return SubscriptionStatus.ready;
    }
    throw Exception('$this is not known in enum SubscriptionStatus');
  }
}

class UpdateDatalakeExceptionsExpiryResponse {
  UpdateDatalakeExceptionsExpiryResponse();

  factory UpdateDatalakeExceptionsExpiryResponse.fromJson(
      Map<String, dynamic> _) {
    return UpdateDatalakeExceptionsExpiryResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateDatalakeExceptionsSubscriptionResponse {
  UpdateDatalakeExceptionsSubscriptionResponse();

  factory UpdateDatalakeExceptionsSubscriptionResponse.fromJson(
      Map<String, dynamic> _) {
    return UpdateDatalakeExceptionsSubscriptionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateDatalakeResponse {
  UpdateDatalakeResponse();

  factory UpdateDatalakeResponse.fromJson(Map<String, dynamic> _) {
    return UpdateDatalakeResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The status of the last <code>UpdateDatalake</code> or
/// <code>DeleteDatalake</code> API request. This is set to Completed after the
/// configuration is updated, or removed if deletion of the data lake is
/// successful.
class UpdateStatus {
  /// The details of the last <code>UpdateDatalake</code>or
  /// <code>DeleteDatalake</code> API request which failed.
  final LastUpdateFailure? lastUpdateFailure;

  /// The unique ID for the <code>UpdateDatalake</code> or
  /// <code>DeleteDatalake</code> API request.
  final String? lastUpdateRequestId;

  /// The status of the last <code>UpdateDatalake</code> or
  /// <code>DeleteDatalake</code> API request that was requested.
  final SettingsStatus? lastUpdateStatus;

  UpdateStatus({
    this.lastUpdateFailure,
    this.lastUpdateRequestId,
    this.lastUpdateStatus,
  });

  factory UpdateStatus.fromJson(Map<String, dynamic> json) {
    return UpdateStatus(
      lastUpdateFailure: json['lastUpdateFailure'] != null
          ? LastUpdateFailure.fromJson(
              json['lastUpdateFailure'] as Map<String, dynamic>)
          : null,
      lastUpdateRequestId: json['lastUpdateRequestId'] as String?,
      lastUpdateStatus:
          (json['lastUpdateStatus'] as String?)?.toSettingsStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final lastUpdateFailure = this.lastUpdateFailure;
    final lastUpdateRequestId = this.lastUpdateRequestId;
    final lastUpdateStatus = this.lastUpdateStatus;
    return {
      if (lastUpdateFailure != null) 'lastUpdateFailure': lastUpdateFailure,
      if (lastUpdateRequestId != null)
        'lastUpdateRequestId': lastUpdateRequestId,
      if (lastUpdateStatus != null)
        'lastUpdateStatus': lastUpdateStatus.toValue(),
    };
  }
}

class UpdateSubscriberResponse {
  /// The account of the subscriber.
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

class UpdateSubscriptionNotificationConfigurationResponse {
  /// Returns the ARN of the queue.
  final String? queueArn;

  UpdateSubscriptionNotificationConfigurationResponse({
    this.queueArn,
  });

  factory UpdateSubscriptionNotificationConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateSubscriptionNotificationConfigurationResponse(
      queueArn: json['queueArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final queueArn = this.queueArn;
    return {
      if (queueArn != null) 'queueArn': queueArn,
    };
  }
}

enum SettingsStatus {
  initialized,
  pending,
  completed,
  failed,
}

extension SettingsStatusValueExtension on SettingsStatus {
  String toValue() {
    switch (this) {
      case SettingsStatus.initialized:
        return 'INITIALIZED';
      case SettingsStatus.pending:
        return 'PENDING';
      case SettingsStatus.completed:
        return 'COMPLETED';
      case SettingsStatus.failed:
        return 'FAILED';
    }
  }
}

extension SettingsStatusFromString on String {
  SettingsStatus toSettingsStatus() {
    switch (this) {
      case 'INITIALIZED':
        return SettingsStatus.initialized;
      case 'PENDING':
        return SettingsStatus.pending;
      case 'COMPLETED':
        return SettingsStatus.completed;
      case 'FAILED':
        return SettingsStatus.failed;
    }
    throw Exception('$this is not known in enum SettingsStatus');
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class AccountNotFoundException extends _s.GenericAwsException {
  AccountNotFoundException({String? type, String? message})
      : super(type: type, code: 'AccountNotFoundException', message: message);
}

class BucketNotFoundException extends _s.GenericAwsException {
  BucketNotFoundException({String? type, String? message})
      : super(type: type, code: 'BucketNotFoundException', message: message);
}

class ConcurrentModificationException extends _s.GenericAwsException {
  ConcurrentModificationException({String? type, String? message})
      : super(
            type: type,
            code: 'ConcurrentModificationException',
            message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class ConflictSourceNamesException extends _s.GenericAwsException {
  ConflictSourceNamesException({String? type, String? message})
      : super(
            type: type, code: 'ConflictSourceNamesException', message: message);
}

class ConflictSubscriptionException extends _s.GenericAwsException {
  ConflictSubscriptionException({String? type, String? message})
      : super(
            type: type,
            code: 'ConflictSubscriptionException',
            message: message);
}

class EventBridgeException extends _s.GenericAwsException {
  EventBridgeException({String? type, String? message})
      : super(type: type, code: 'EventBridgeException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class InvalidInputException extends _s.GenericAwsException {
  InvalidInputException({String? type, String? message})
      : super(type: type, code: 'InvalidInputException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class S3Exception extends _s.GenericAwsException {
  S3Exception({String? type, String? message})
      : super(type: type, code: 'S3Exception', message: message);
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
  'AccountNotFoundException': (type, message) =>
      AccountNotFoundException(type: type, message: message),
  'BucketNotFoundException': (type, message) =>
      BucketNotFoundException(type: type, message: message),
  'ConcurrentModificationException': (type, message) =>
      ConcurrentModificationException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'ConflictSourceNamesException': (type, message) =>
      ConflictSourceNamesException(type: type, message: message),
  'ConflictSubscriptionException': (type, message) =>
      ConflictSubscriptionException(type: type, message: message),
  'EventBridgeException': (type, message) =>
      EventBridgeException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'InvalidInputException': (type, message) =>
      InvalidInputException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'S3Exception': (type, message) => S3Exception(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
