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

/// This is the CloudTrail API Reference. It provides descriptions of actions,
/// data types, common parameters, and common errors for CloudTrail.
class CloudTrail {
  final _s.JsonProtocol _protocol;
  CloudTrail({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'cloudtrail',
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

  /// Adds one or more tags to a trail, event data store, or channel, up to a
  /// limit of 50. Overwrites an existing tag's value when a new value is
  /// specified for an existing tag key. Tag key names must be unique; you
  /// cannot have two keys with the same name but different values. If you
  /// specify a key without a value, the tag will be created with the specified
  /// key and a value of null. You can tag a trail or event data store that
  /// applies to all Amazon Web Services Regions only from the Region in which
  /// the trail or event data store was created (also known as its home Region).
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [CloudTrailARNInvalidException].
  /// May throw [EventDataStoreARNInvalidException].
  /// May throw [ChannelARNInvalidException].
  /// May throw [ResourceTypeNotSupportedException].
  /// May throw [TagsLimitExceededException].
  /// May throw [InvalidTrailNameException].
  /// May throw [InvalidTagParameterException].
  /// May throw [InactiveEventDataStoreException].
  /// May throw [EventDataStoreNotFoundException].
  /// May throw [ChannelNotFoundException].
  /// May throw [UnsupportedOperationException].
  /// May throw [OperationNotPermittedException].
  /// May throw [NotOrganizationMasterAccountException].
  /// May throw [NoManagementAccountSLRExistsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [resourceId] :
  /// Specifies the ARN of the trail, event data store, or channel to which one
  /// or more tags will be added.
  ///
  /// The format of a trail ARN is:
  /// <code>arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail</code>
  ///
  /// The format of an event data store ARN is:
  /// <code>arn:aws:cloudtrail:us-east-2:123456789012:eventdatastore/EXAMPLE-f852-4e8f-8bd1-bcf6cEXAMPLE</code>
  ///
  /// The format of a channel ARN is:
  /// <code>arn:aws:cloudtrail:us-east-2:123456789012:channel/01234567890</code>
  ///
  /// Parameter [tagsList] :
  /// Contains a list of tags, up to a limit of 50
  Future<void> addTags({
    required String resourceId,
    required List<Tag> tagsList,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101.AddTags'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceId': resourceId,
        'TagsList': tagsList,
      },
    );
  }

  /// Cancels a query if the query is not in a terminated state, such as
  /// <code>CANCELLED</code>, <code>FAILED</code>, <code>TIMED_OUT</code>, or
  /// <code>FINISHED</code>. You must specify an ARN value for
  /// <code>EventDataStore</code>. The ID of the query that you want to cancel
  /// is also required. When you run <code>CancelQuery</code>, the query status
  /// might show as <code>CANCELLED</code> even if the operation is not yet
  /// finished.
  ///
  /// May throw [EventDataStoreARNInvalidException].
  /// May throw [EventDataStoreNotFoundException].
  /// May throw [InactiveEventDataStoreException].
  /// May throw [InactiveQueryException].
  /// May throw [InvalidParameterException].
  /// May throw [QueryIdNotFoundException].
  /// May throw [OperationNotPermittedException].
  /// May throw [UnsupportedOperationException].
  /// May throw [NoManagementAccountSLRExistsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [queryId] :
  /// The ID of the query that you want to cancel. The <code>QueryId</code>
  /// comes from the response of a <code>StartQuery</code> operation.
  ///
  /// Parameter [eventDataStore] :
  /// The ARN (or the ID suffix of the ARN) of an event data store on which the
  /// specified query is running.
  Future<CancelQueryResponse> cancelQuery({
    required String queryId,
    String? eventDataStore,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101.CancelQuery'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'QueryId': queryId,
        if (eventDataStore != null) 'EventDataStore': eventDataStore,
      },
    );

    return CancelQueryResponse.fromJson(jsonResponse.body);
  }

  /// Creates a channel for CloudTrail to ingest events from a partner or
  /// external source. After you create a channel, a CloudTrail Lake event data
  /// store can log events from the partner or source that you specify.
  ///
  /// May throw [ChannelMaxLimitExceededException].
  /// May throw [InvalidSourceException].
  /// May throw [ChannelAlreadyExistsException].
  /// May throw [EventDataStoreARNInvalidException].
  /// May throw [EventDataStoreNotFoundException].
  /// May throw [InvalidEventDataStoreCategoryException].
  /// May throw [InactiveEventDataStoreException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidTagParameterException].
  /// May throw [TagsLimitExceededException].
  /// May throw [OperationNotPermittedException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [destinations] :
  /// One or more event data stores to which events arriving through a channel
  /// will be logged.
  ///
  /// Parameter [name] :
  /// The name of the channel.
  ///
  /// Parameter [source] :
  /// The name of the partner or external event source. You cannot change this
  /// name after you create the channel. A maximum of one channel is allowed per
  /// source.
  ///
  /// A source can be either <code>Custom</code> for all valid non-Amazon Web
  /// Services events, or the name of a partner event source. For information
  /// about the source names for available partners, see <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/query-event-data-store-integration.html#cloudtrail-lake-partner-information">Additional
  /// information about integration partners</a> in the CloudTrail User Guide.
  Future<CreateChannelResponse> createChannel({
    required List<Destination> destinations,
    required String name,
    required String source,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101.CreateChannel'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Destinations': destinations,
        'Name': name,
        'Source': source,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateChannelResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new event data store.
  ///
  /// May throw [EventDataStoreAlreadyExistsException].
  /// May throw [EventDataStoreMaxLimitExceededException].
  /// May throw [InvalidEventSelectorsException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidTagParameterException].
  /// May throw [OperationNotPermittedException].
  /// May throw [UnsupportedOperationException].
  /// May throw [ConflictException].
  /// May throw [InsufficientEncryptionPolicyException].
  /// May throw [InvalidKmsKeyIdException].
  /// May throw [KmsKeyNotFoundException].
  /// May throw [KmsException].
  /// May throw [CloudTrailAccessNotEnabledException].
  /// May throw [InsufficientDependencyServiceAccessPermissionException].
  /// May throw [NotOrganizationMasterAccountException].
  /// May throw [OrganizationsNotInUseException].
  /// May throw [OrganizationNotInAllFeaturesModeException].
  /// May throw [NoManagementAccountSLRExistsException].
  ///
  /// Parameter [name] :
  /// The name of the event data store.
  ///
  /// Parameter [advancedEventSelectors] :
  /// The advanced event selectors to use to select the events for the data
  /// store. You can configure up to five advanced event selectors for each
  /// event data store.
  ///
  /// For more information about how to use advanced event selectors to log
  /// CloudTrail events, see <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-data-events-with-cloudtrail.html#creating-data-event-selectors-advanced">Log
  /// events by using advanced event selectors</a> in the CloudTrail User Guide.
  ///
  /// For more information about how to use advanced event selectors to include
  /// Config configuration items in your event data store, see <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/lake-eds-cli.html#lake-cli-create-eds-config">Create
  /// an event data store for Config configuration items</a> in the CloudTrail
  /// User Guide.
  ///
  /// For more information about how to use advanced event selectors to include
  /// events outside of Amazon Web Services events in your event data store, see
  /// <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/lake-integrations-cli.html#lake-cli-create-integration">Create
  /// an integration to log events from outside Amazon Web Services</a> in the
  /// CloudTrail User Guide.
  ///
  /// Parameter [billingMode] :
  /// The billing mode for the event data store determines the cost for
  /// ingesting events and the default and maximum retention period for the
  /// event data store.
  ///
  /// The following are the possible values:
  ///
  /// <ul>
  /// <li>
  /// <code>EXTENDABLE_RETENTION_PRICING</code> - This billing mode is generally
  /// recommended if you want a flexible retention period of up to 3653 days
  /// (about 10 years). The default retention period for this billing mode is
  /// 366 days.
  /// </li>
  /// <li>
  /// <code>FIXED_RETENTION_PRICING</code> - This billing mode is recommended if
  /// you expect to ingest more than 25 TB of event data per month and need a
  /// retention period of up to 2557 days (about 7 years). The default retention
  /// period for this billing mode is 2557 days.
  /// </li>
  /// </ul>
  /// The default value is <code>EXTENDABLE_RETENTION_PRICING</code>.
  ///
  /// For more information about CloudTrail pricing, see <a
  /// href="http://aws.amazon.com/cloudtrail/pricing/">CloudTrail Pricing</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-lake-manage-costs.html">Managing
  /// CloudTrail Lake costs</a>.
  ///
  /// Parameter [kmsKeyId] :
  /// Specifies the KMS key ID to use to encrypt the events delivered by
  /// CloudTrail. The value can be an alias name prefixed by
  /// <code>alias/</code>, a fully specified ARN to an alias, a fully specified
  /// ARN to a key, or a globally unique identifier.
  /// <important>
  /// Disabling or deleting the KMS key, or removing CloudTrail permissions on
  /// the key, prevents CloudTrail from logging events to the event data store,
  /// and prevents users from querying the data in the event data store that was
  /// encrypted with the key. After you associate an event data store with a KMS
  /// key, the KMS key cannot be removed or changed. Before you disable or
  /// delete a KMS key that you are using with an event data store, delete or
  /// back up your event data store.
  /// </important>
  /// CloudTrail also supports KMS multi-Region keys. For more information about
  /// multi-Region keys, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html">Using
  /// multi-Region keys</a> in the <i>Key Management Service Developer
  /// Guide</i>.
  ///
  /// Examples:
  ///
  /// <ul>
  /// <li>
  /// <code>alias/MyAliasName</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:kms:us-east-2:123456789012:alias/MyAliasName</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:kms:us-east-2:123456789012:key/12345678-1234-1234-1234-123456789012</code>
  /// </li>
  /// <li>
  /// <code>12345678-1234-1234-1234-123456789012</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [multiRegionEnabled] :
  /// Specifies whether the event data store includes events from all Regions,
  /// or only from the Region in which the event data store is created.
  ///
  /// Parameter [organizationEnabled] :
  /// Specifies whether an event data store collects events logged for an
  /// organization in Organizations.
  ///
  /// Parameter [retentionPeriod] :
  /// The retention period of the event data store, in days. If
  /// <code>BillingMode</code> is set to
  /// <code>EXTENDABLE_RETENTION_PRICING</code>, you can set a retention period
  /// of up to 3653 days, the equivalent of 10 years. If
  /// <code>BillingMode</code> is set to <code>FIXED_RETENTION_PRICING</code>,
  /// you can set a retention period of up to 2557 days, the equivalent of seven
  /// years.
  ///
  /// CloudTrail Lake determines whether to retain an event by checking if the
  /// <code>eventTime</code> of the event is within the specified retention
  /// period. For example, if you set a retention period of 90 days, CloudTrail
  /// will remove events when the <code>eventTime</code> is older than 90 days.
  /// <note>
  /// If you plan to copy trail events to this event data store, we recommend
  /// that you consider both the age of the events that you want to copy as well
  /// as how long you want to keep the copied events in your event data store.
  /// For example, if you copy trail events that are 5 years old and specify a
  /// retention period of 7 years, the event data store will retain those events
  /// for two years.
  /// </note>
  ///
  /// Parameter [startIngestion] :
  /// Specifies whether the event data store should start ingesting live events.
  /// The default is true.
  ///
  /// Parameter [terminationProtectionEnabled] :
  /// Specifies whether termination protection is enabled for the event data
  /// store. If termination protection is enabled, you cannot delete the event
  /// data store until termination protection is disabled.
  Future<CreateEventDataStoreResponse> createEventDataStore({
    required String name,
    List<AdvancedEventSelector>? advancedEventSelectors,
    BillingMode? billingMode,
    String? kmsKeyId,
    bool? multiRegionEnabled,
    bool? organizationEnabled,
    int? retentionPeriod,
    bool? startIngestion,
    List<Tag>? tagsList,
    bool? terminationProtectionEnabled,
  }) async {
    _s.validateNumRange(
      'retentionPeriod',
      retentionPeriod,
      7,
      3653,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101.CreateEventDataStore'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        if (advancedEventSelectors != null)
          'AdvancedEventSelectors': advancedEventSelectors,
        if (billingMode != null) 'BillingMode': billingMode.toValue(),
        if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
        if (multiRegionEnabled != null)
          'MultiRegionEnabled': multiRegionEnabled,
        if (organizationEnabled != null)
          'OrganizationEnabled': organizationEnabled,
        if (retentionPeriod != null) 'RetentionPeriod': retentionPeriod,
        if (startIngestion != null) 'StartIngestion': startIngestion,
        if (tagsList != null) 'TagsList': tagsList,
        if (terminationProtectionEnabled != null)
          'TerminationProtectionEnabled': terminationProtectionEnabled,
      },
    );

    return CreateEventDataStoreResponse.fromJson(jsonResponse.body);
  }

  /// Creates a trail that specifies the settings for delivery of log data to an
  /// Amazon S3 bucket.
  ///
  /// May throw [MaximumNumberOfTrailsExceededException].
  /// May throw [TrailAlreadyExistsException].
  /// May throw [S3BucketDoesNotExistException].
  /// May throw [InsufficientS3BucketPolicyException].
  /// May throw [InsufficientSnsTopicPolicyException].
  /// May throw [InsufficientEncryptionPolicyException].
  /// May throw [InvalidS3BucketNameException].
  /// May throw [InvalidS3PrefixException].
  /// May throw [InvalidSnsTopicNameException].
  /// May throw [InvalidKmsKeyIdException].
  /// May throw [InvalidTrailNameException].
  /// May throw [TrailNotProvidedException].
  /// May throw [TagsLimitExceededException].
  /// May throw [InvalidParameterCombinationException].
  /// May throw [InvalidParameterException].
  /// May throw [KmsKeyNotFoundException].
  /// May throw [KmsKeyDisabledException].
  /// May throw [KmsException].
  /// May throw [InvalidCloudWatchLogsLogGroupArnException].
  /// May throw [InvalidCloudWatchLogsRoleArnException].
  /// May throw [CloudWatchLogsDeliveryUnavailableException].
  /// May throw [InvalidTagParameterException].
  /// May throw [UnsupportedOperationException].
  /// May throw [OperationNotPermittedException].
  /// May throw [CloudTrailAccessNotEnabledException].
  /// May throw [InsufficientDependencyServiceAccessPermissionException].
  /// May throw [NotOrganizationMasterAccountException].
  /// May throw [OrganizationsNotInUseException].
  /// May throw [OrganizationNotInAllFeaturesModeException].
  /// May throw [NoManagementAccountSLRExistsException].
  /// May throw [CloudTrailInvalidClientTokenIdException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [name] :
  /// Specifies the name of the trail. The name must meet the following
  /// requirements:
  ///
  /// <ul>
  /// <li>
  /// Contain only ASCII letters (a-z, A-Z), numbers (0-9), periods (.),
  /// underscores (_), or dashes (-)
  /// </li>
  /// <li>
  /// Start with a letter or number, and end with a letter or number
  /// </li>
  /// <li>
  /// Be between 3 and 128 characters
  /// </li>
  /// <li>
  /// Have no adjacent periods, underscores or dashes. Names like
  /// <code>my-_namespace</code> and <code>my--namespace</code> are not valid.
  /// </li>
  /// <li>
  /// Not be in IP address format (for example, 192.168.5.4)
  /// </li>
  /// </ul>
  ///
  /// Parameter [s3BucketName] :
  /// Specifies the name of the Amazon S3 bucket designated for publishing log
  /// files. For information about bucket naming rules, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html">Bucket
  /// naming rules</a> in the <i>Amazon Simple Storage Service User Guide</i>.
  ///
  /// Parameter [cloudWatchLogsLogGroupArn] :
  /// Specifies a log group name using an Amazon Resource Name (ARN), a unique
  /// identifier that represents the log group to which CloudTrail logs will be
  /// delivered. You must use a log group that exists in your account.
  ///
  /// Not required unless you specify <code>CloudWatchLogsRoleArn</code>.
  ///
  /// Parameter [cloudWatchLogsRoleArn] :
  /// Specifies the role for the CloudWatch Logs endpoint to assume to write to
  /// a user's log group. You must use a role that exists in your account.
  ///
  /// Parameter [enableLogFileValidation] :
  /// Specifies whether log file integrity validation is enabled. The default is
  /// false.
  /// <note>
  /// When you disable log file integrity validation, the chain of digest files
  /// is broken after one hour. CloudTrail does not create digest files for log
  /// files that were delivered during a period in which log file integrity
  /// validation was disabled. For example, if you enable log file integrity
  /// validation at noon on January 1, disable it at noon on January 2, and
  /// re-enable it at noon on January 10, digest files will not be created for
  /// the log files delivered from noon on January 2 to noon on January 10. The
  /// same applies whenever you stop CloudTrail logging or delete a trail.
  /// </note>
  ///
  /// Parameter [includeGlobalServiceEvents] :
  /// Specifies whether the trail is publishing events from global services such
  /// as IAM to the log files.
  ///
  /// Parameter [isMultiRegionTrail] :
  /// Specifies whether the trail is created in the current Region or in all
  /// Regions. The default is false, which creates a trail only in the Region
  /// where you are signed in. As a best practice, consider creating trails that
  /// log events in all Regions.
  ///
  /// Parameter [isOrganizationTrail] :
  /// Specifies whether the trail is created for all accounts in an organization
  /// in Organizations, or only for the current Amazon Web Services account. The
  /// default is false, and cannot be true unless the call is made on behalf of
  /// an Amazon Web Services account that is the management account or delegated
  /// administrator account for an organization in Organizations.
  ///
  /// Parameter [kmsKeyId] :
  /// Specifies the KMS key ID to use to encrypt the logs delivered by
  /// CloudTrail. The value can be an alias name prefixed by
  /// <code>alias/</code>, a fully specified ARN to an alias, a fully specified
  /// ARN to a key, or a globally unique identifier.
  ///
  /// CloudTrail also supports KMS multi-Region keys. For more information about
  /// multi-Region keys, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html">Using
  /// multi-Region keys</a> in the <i>Key Management Service Developer
  /// Guide</i>.
  ///
  /// Examples:
  ///
  /// <ul>
  /// <li>
  /// <code>alias/MyAliasName</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:kms:us-east-2:123456789012:alias/MyAliasName</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:kms:us-east-2:123456789012:key/12345678-1234-1234-1234-123456789012</code>
  /// </li>
  /// <li>
  /// <code>12345678-1234-1234-1234-123456789012</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [s3KeyPrefix] :
  /// Specifies the Amazon S3 key prefix that comes after the name of the bucket
  /// you have designated for log file delivery. For more information, see <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/get-and-view-cloudtrail-log-files.html#cloudtrail-find-log-files">Finding
  /// Your CloudTrail Log Files</a>. The maximum length is 200 characters.
  ///
  /// Parameter [snsTopicName] :
  /// Specifies the name of the Amazon SNS topic defined for notification of log
  /// file delivery. The maximum length is 256 characters.
  Future<CreateTrailResponse> createTrail({
    required String name,
    required String s3BucketName,
    String? cloudWatchLogsLogGroupArn,
    String? cloudWatchLogsRoleArn,
    bool? enableLogFileValidation,
    bool? includeGlobalServiceEvents,
    bool? isMultiRegionTrail,
    bool? isOrganizationTrail,
    String? kmsKeyId,
    String? s3KeyPrefix,
    String? snsTopicName,
    List<Tag>? tagsList,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101.CreateTrail'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'S3BucketName': s3BucketName,
        if (cloudWatchLogsLogGroupArn != null)
          'CloudWatchLogsLogGroupArn': cloudWatchLogsLogGroupArn,
        if (cloudWatchLogsRoleArn != null)
          'CloudWatchLogsRoleArn': cloudWatchLogsRoleArn,
        if (enableLogFileValidation != null)
          'EnableLogFileValidation': enableLogFileValidation,
        if (includeGlobalServiceEvents != null)
          'IncludeGlobalServiceEvents': includeGlobalServiceEvents,
        if (isMultiRegionTrail != null)
          'IsMultiRegionTrail': isMultiRegionTrail,
        if (isOrganizationTrail != null)
          'IsOrganizationTrail': isOrganizationTrail,
        if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
        if (s3KeyPrefix != null) 'S3KeyPrefix': s3KeyPrefix,
        if (snsTopicName != null) 'SnsTopicName': snsTopicName,
        if (tagsList != null) 'TagsList': tagsList,
      },
    );

    return CreateTrailResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a channel.
  ///
  /// May throw [ChannelARNInvalidException].
  /// May throw [ChannelNotFoundException].
  /// May throw [OperationNotPermittedException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [channel] :
  /// The ARN or the <code>UUID</code> value of the channel that you want to
  /// delete.
  Future<void> deleteChannel({
    required String channel,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101.DeleteChannel'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Channel': channel,
      },
    );
  }

  /// Disables the event data store specified by <code>EventDataStore</code>,
  /// which accepts an event data store ARN. After you run
  /// <code>DeleteEventDataStore</code>, the event data store enters a
  /// <code>PENDING_DELETION</code> state, and is automatically deleted after a
  /// wait period of seven days. <code>TerminationProtectionEnabled</code> must
  /// be set to <code>False</code> on the event data store and the
  /// <code>FederationStatus</code> must be <code>DISABLED</code>. You cannot
  /// delete an event data store if <code>TerminationProtectionEnabled</code> is
  /// <code>True</code> or the <code>FederationStatus</code> is
  /// <code>ENABLED</code>.
  ///
  /// After you run <code>DeleteEventDataStore</code> on an event data store,
  /// you cannot run <code>ListQueries</code>, <code>DescribeQuery</code>, or
  /// <code>GetQueryResults</code> on queries that are using an event data store
  /// in a <code>PENDING_DELETION</code> state. An event data store in the
  /// <code>PENDING_DELETION</code> state does not incur costs.
  ///
  /// May throw [EventDataStoreARNInvalidException].
  /// May throw [EventDataStoreNotFoundException].
  /// May throw [EventDataStoreTerminationProtectedException].
  /// May throw [EventDataStoreHasOngoingImportException].
  /// May throw [InactiveEventDataStoreException].
  /// May throw [InvalidParameterException].
  /// May throw [OperationNotPermittedException].
  /// May throw [UnsupportedOperationException].
  /// May throw [NotOrganizationMasterAccountException].
  /// May throw [NoManagementAccountSLRExistsException].
  /// May throw [ChannelExistsForEDSException].
  /// May throw [InsufficientDependencyServiceAccessPermissionException].
  /// May throw [ConflictException].
  /// May throw [EventDataStoreFederationEnabledException].
  ///
  /// Parameter [eventDataStore] :
  /// The ARN (or the ID suffix of the ARN) of the event data store to delete.
  Future<void> deleteEventDataStore({
    required String eventDataStore,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101.DeleteEventDataStore'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EventDataStore': eventDataStore,
      },
    );
  }

  /// Deletes the resource-based policy attached to the CloudTrail channel.
  ///
  /// May throw [ResourceARNNotValidException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourcePolicyNotFoundException].
  /// May throw [ResourceTypeNotSupportedException].
  /// May throw [OperationNotPermittedException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the CloudTrail channel you're deleting
  /// the resource-based policy from. The following is the format of a resource
  /// ARN:
  /// <code>arn:aws:cloudtrail:us-east-2:123456789012:channel/MyChannel</code>.
  Future<void> deleteResourcePolicy({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101.DeleteResourcePolicy'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
      },
    );
  }

  /// Deletes a trail. This operation must be called from the Region in which
  /// the trail was created. <code>DeleteTrail</code> cannot be called on the
  /// shadow trails (replicated trails in other Regions) of a trail that is
  /// enabled in all Regions.
  ///
  /// May throw [TrailNotFoundException].
  /// May throw [InvalidTrailNameException].
  /// May throw [CloudTrailARNInvalidException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InvalidHomeRegionException].
  /// May throw [UnsupportedOperationException].
  /// May throw [OperationNotPermittedException].
  /// May throw [NotOrganizationMasterAccountException].
  /// May throw [NoManagementAccountSLRExistsException].
  /// May throw [InsufficientDependencyServiceAccessPermissionException].
  ///
  /// Parameter [name] :
  /// Specifies the name or the CloudTrail ARN of the trail to be deleted. The
  /// following is the format of a trail ARN.
  /// <code>arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail</code>
  Future<void> deleteTrail({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101.DeleteTrail'
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

  /// Removes CloudTrail delegated administrator permissions from a member
  /// account in an organization.
  ///
  /// May throw [AccountNotFoundException].
  /// May throw [AccountNotRegisteredException].
  /// May throw [CloudTrailAccessNotEnabledException].
  /// May throw [ConflictException].
  /// May throw [InsufficientDependencyServiceAccessPermissionException].
  /// May throw [InvalidParameterException].
  /// May throw [NotOrganizationManagementAccountException].
  /// May throw [OrganizationNotInAllFeaturesModeException].
  /// May throw [OrganizationsNotInUseException].
  /// May throw [UnsupportedOperationException].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [delegatedAdminAccountId] :
  /// A delegated administrator account ID. This is a member account in an
  /// organization that is currently designated as a delegated administrator.
  Future<void> deregisterOrganizationDelegatedAdmin({
    required String delegatedAdminAccountId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101.DeregisterOrganizationDelegatedAdmin'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DelegatedAdminAccountId': delegatedAdminAccountId,
      },
    );
  }

  /// Returns metadata about a query, including query run time in milliseconds,
  /// number of events scanned and matched, and query status. If the query
  /// results were delivered to an S3 bucket, the response also provides the S3
  /// URI and the delivery status.
  ///
  /// You must specify either a <code>QueryID</code> or a
  /// <code>QueryAlias</code>. Specifying the <code>QueryAlias</code> parameter
  /// returns information about the last query run for the alias.
  ///
  /// May throw [EventDataStoreARNInvalidException].
  /// May throw [EventDataStoreNotFoundException].
  /// May throw [InactiveEventDataStoreException].
  /// May throw [InvalidParameterException].
  /// May throw [QueryIdNotFoundException].
  /// May throw [OperationNotPermittedException].
  /// May throw [UnsupportedOperationException].
  /// May throw [NoManagementAccountSLRExistsException].
  ///
  /// Parameter [eventDataStore] :
  /// The ARN (or the ID suffix of the ARN) of an event data store on which the
  /// specified query was run.
  ///
  /// Parameter [queryAlias] :
  /// The alias that identifies a query template.
  ///
  /// Parameter [queryId] :
  /// The query ID.
  Future<DescribeQueryResponse> describeQuery({
    String? eventDataStore,
    String? queryAlias,
    String? queryId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101.DescribeQuery'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (eventDataStore != null) 'EventDataStore': eventDataStore,
        if (queryAlias != null) 'QueryAlias': queryAlias,
        if (queryId != null) 'QueryId': queryId,
      },
    );

    return DescribeQueryResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves settings for one or more trails associated with the current
  /// Region for your account.
  ///
  /// May throw [UnsupportedOperationException].
  /// May throw [OperationNotPermittedException].
  /// May throw [InvalidTrailNameException].
  /// May throw [CloudTrailARNInvalidException].
  /// May throw [NoManagementAccountSLRExistsException].
  ///
  /// Parameter [includeShadowTrails] :
  /// Specifies whether to include shadow trails in the response. A shadow trail
  /// is the replication in a Region of a trail that was created in a different
  /// Region, or in the case of an organization trail, the replication of an
  /// organization trail in member accounts. If you do not include shadow
  /// trails, organization trails in a member account and Region replication
  /// trails will not be returned. The default is true.
  ///
  /// Parameter [trailNameList] :
  /// Specifies a list of trail names, trail ARNs, or both, of the trails to
  /// describe. The format of a trail ARN is:
  ///
  /// <code>arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail</code>
  ///
  /// If an empty list is specified, information for the trail in the current
  /// Region is returned.
  ///
  /// <ul>
  /// <li>
  /// If an empty list is specified and <code>IncludeShadowTrails</code> is
  /// false, then information for all trails in the current Region is returned.
  /// </li>
  /// <li>
  /// If an empty list is specified and IncludeShadowTrails is null or true,
  /// then information for all trails in the current Region and any associated
  /// shadow trails in other Regions is returned.
  /// </li>
  /// </ul> <note>
  /// If one or more trail names are specified, information is returned only if
  /// the names match the names of trails belonging only to the current Region
  /// and current account. To return information about a trail in another
  /// Region, you must specify its trail ARN.
  /// </note>
  Future<DescribeTrailsResponse> describeTrails({
    bool? includeShadowTrails,
    List<String>? trailNameList,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101.DescribeTrails'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (includeShadowTrails != null)
          'includeShadowTrails': includeShadowTrails,
        if (trailNameList != null) 'trailNameList': trailNameList,
      },
    );

    return DescribeTrailsResponse.fromJson(jsonResponse.body);
  }

  /// Disables Lake query federation on the specified event data store. When you
  /// disable federation, CloudTrail disables the integration with Glue, Lake
  /// Formation, and Amazon Athena. After disabling Lake query federation, you
  /// can no longer query your event data in Amazon Athena.
  ///
  /// No CloudTrail Lake data is deleted when you disable federation and you can
  /// continue to run queries in CloudTrail Lake.
  ///
  /// May throw [EventDataStoreARNInvalidException].
  /// May throw [EventDataStoreNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InactiveEventDataStoreException].
  /// May throw [OperationNotPermittedException].
  /// May throw [UnsupportedOperationException].
  /// May throw [CloudTrailAccessNotEnabledException].
  /// May throw [InsufficientDependencyServiceAccessPermissionException].
  /// May throw [NotOrganizationMasterAccountException].
  /// May throw [NoManagementAccountSLRExistsException].
  /// May throw [OrganizationsNotInUseException].
  /// May throw [OrganizationNotInAllFeaturesModeException].
  /// May throw [ConcurrentModificationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [eventDataStore] :
  /// The ARN (or ID suffix of the ARN) of the event data store for which you
  /// want to disable Lake query federation.
  Future<DisableFederationResponse> disableFederation({
    required String eventDataStore,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101.DisableFederation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EventDataStore': eventDataStore,
      },
    );

    return DisableFederationResponse.fromJson(jsonResponse.body);
  }

  /// Enables Lake query federation on the specified event data store.
  /// Federating an event data store lets you view the metadata associated with
  /// the event data store in the Glue <a
  /// href="https://docs.aws.amazon.com/glue/latest/dg/components-overview.html#data-catalog-intro">Data
  /// Catalog</a> and run SQL queries against your event data using Amazon
  /// Athena. The table metadata stored in the Glue Data Catalog lets the Athena
  /// query engine know how to find, read, and process the data that you want to
  /// query.
  ///
  /// When you enable Lake query federation, CloudTrail creates a managed
  /// database named <code>aws:cloudtrail</code> (if the database doesn't
  /// already exist) and a managed federated table in the Glue Data Catalog. The
  /// event data store ID is used for the table name. CloudTrail registers the
  /// role ARN and event data store in <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/query-federation-lake-formation.html">Lake
  /// Formation</a>, the service responsible for allowing fine-grained access
  /// control of the federated resources in the Glue Data Catalog.
  ///
  /// For more information about Lake query federation, see <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/query-federation.html">Federate
  /// an event data store</a>.
  ///
  /// May throw [EventDataStoreARNInvalidException].
  /// May throw [EventDataStoreNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InactiveEventDataStoreException].
  /// May throw [OperationNotPermittedException].
  /// May throw [UnsupportedOperationException].
  /// May throw [CloudTrailAccessNotEnabledException].
  /// May throw [InsufficientDependencyServiceAccessPermissionException].
  /// May throw [NotOrganizationMasterAccountException].
  /// May throw [NoManagementAccountSLRExistsException].
  /// May throw [OrganizationsNotInUseException].
  /// May throw [OrganizationNotInAllFeaturesModeException].
  /// May throw [ConcurrentModificationException].
  /// May throw [AccessDeniedException].
  /// May throw [EventDataStoreFederationEnabledException].
  ///
  /// Parameter [eventDataStore] :
  /// The ARN (or ID suffix of the ARN) of the event data store for which you
  /// want to enable Lake query federation.
  ///
  /// Parameter [federationRoleArn] :
  /// The ARN of the federation role to use for the event data store. Amazon Web
  /// Services services like Lake Formation use this federation role to access
  /// data for the federated event data store. The federation role must exist in
  /// your account and provide the <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/query-federation.html#query-federation-permissions-role">required
  /// minimum permissions</a>.
  Future<EnableFederationResponse> enableFederation({
    required String eventDataStore,
    required String federationRoleArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101.EnableFederation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EventDataStore': eventDataStore,
        'FederationRoleArn': federationRoleArn,
      },
    );

    return EnableFederationResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about a specific channel.
  ///
  /// May throw [ChannelARNInvalidException].
  /// May throw [ChannelNotFoundException].
  /// May throw [OperationNotPermittedException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [channel] :
  /// The ARN or <code>UUID</code> of a channel.
  Future<GetChannelResponse> getChannel({
    required String channel,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101.GetChannel'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Channel': channel,
      },
    );

    return GetChannelResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about an event data store specified as either an ARN
  /// or the ID portion of the ARN.
  ///
  /// May throw [EventDataStoreARNInvalidException].
  /// May throw [EventDataStoreNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [OperationNotPermittedException].
  /// May throw [UnsupportedOperationException].
  /// May throw [NoManagementAccountSLRExistsException].
  ///
  /// Parameter [eventDataStore] :
  /// The ARN (or ID suffix of the ARN) of the event data store about which you
  /// want information.
  Future<GetEventDataStoreResponse> getEventDataStore({
    required String eventDataStore,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101.GetEventDataStore'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EventDataStore': eventDataStore,
      },
    );

    return GetEventDataStoreResponse.fromJson(jsonResponse.body);
  }

  /// Describes the settings for the event selectors that you configured for
  /// your trail. The information returned for your event selectors includes the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// If your event selector includes read-only events, write-only events, or
  /// all events. This applies to both management events and data events.
  /// </li>
  /// <li>
  /// If your event selector includes management events.
  /// </li>
  /// <li>
  /// If your event selector includes data events, the resources on which you
  /// are logging data events.
  /// </li>
  /// </ul>
  /// For more information about logging management and data events, see the
  /// following topics in the <i>CloudTrail User Guide</i>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-management-events-with-cloudtrail.html">Logging
  /// management events</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-data-events-with-cloudtrail.html">Logging
  /// data events</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [TrailNotFoundException].
  /// May throw [InvalidTrailNameException].
  /// May throw [CloudTrailARNInvalidException].
  /// May throw [UnsupportedOperationException].
  /// May throw [OperationNotPermittedException].
  /// May throw [NoManagementAccountSLRExistsException].
  ///
  /// Parameter [trailName] :
  /// Specifies the name of the trail or trail ARN. If you specify a trail name,
  /// the string must meet the following requirements:
  ///
  /// <ul>
  /// <li>
  /// Contain only ASCII letters (a-z, A-Z), numbers (0-9), periods (.),
  /// underscores (_), or dashes (-)
  /// </li>
  /// <li>
  /// Start with a letter or number, and end with a letter or number
  /// </li>
  /// <li>
  /// Be between 3 and 128 characters
  /// </li>
  /// <li>
  /// Have no adjacent periods, underscores or dashes. Names like
  /// <code>my-_namespace</code> and <code>my--namespace</code> are not valid.
  /// </li>
  /// <li>
  /// Not be in IP address format (for example, 192.168.5.4)
  /// </li>
  /// </ul>
  /// If you specify a trail ARN, it must be in the format:
  ///
  /// <code>arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail</code>
  Future<GetEventSelectorsResponse> getEventSelectors({
    required String trailName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101.GetEventSelectors'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TrailName': trailName,
      },
    );

    return GetEventSelectorsResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about a specific import.
  ///
  /// May throw [ImportNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [OperationNotPermittedException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [importId] :
  /// The ID for the import.
  Future<GetImportResponse> getImport({
    required String importId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101.GetImport'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ImportId': importId,
      },
    );

    return GetImportResponse.fromJson(jsonResponse.body);
  }

  /// Describes the settings for the Insights event selectors that you
  /// configured for your trail or event data store.
  /// <code>GetInsightSelectors</code> shows if CloudTrail Insights event
  /// logging is enabled on the trail or event data store, and if it is, which
  /// Insights types are enabled. If you run <code>GetInsightSelectors</code> on
  /// a trail or event data store that does not have Insights events enabled,
  /// the operation throws the exception <code>InsightNotEnabledException</code>
  ///
  /// Specify either the <code>EventDataStore</code> parameter to get Insights
  /// event selectors for an event data store, or the <code>TrailName</code>
  /// parameter to the get Insights event selectors for a trail. You cannot
  /// specify these parameters together.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-insights-events-with-cloudtrail.html">Logging
  /// CloudTrail Insights events</a> in the <i>CloudTrail User Guide</i>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidParameterCombinationException].
  /// May throw [TrailNotFoundException].
  /// May throw [InvalidTrailNameException].
  /// May throw [CloudTrailARNInvalidException].
  /// May throw [UnsupportedOperationException].
  /// May throw [OperationNotPermittedException].
  /// May throw [InsightNotEnabledException].
  /// May throw [NoManagementAccountSLRExistsException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [eventDataStore] :
  /// Specifies the ARN (or ID suffix of the ARN) of the event data store for
  /// which you want to get Insights selectors.
  ///
  /// You cannot use this parameter with the <code>TrailName</code> parameter.
  ///
  /// Parameter [trailName] :
  /// Specifies the name of the trail or trail ARN. If you specify a trail name,
  /// the string must meet the following requirements:
  ///
  /// <ul>
  /// <li>
  /// Contain only ASCII letters (a-z, A-Z), numbers (0-9), periods (.),
  /// underscores (_), or dashes (-)
  /// </li>
  /// <li>
  /// Start with a letter or number, and end with a letter or number
  /// </li>
  /// <li>
  /// Be between 3 and 128 characters
  /// </li>
  /// <li>
  /// Have no adjacent periods, underscores or dashes. Names like
  /// <code>my-_namespace</code> and <code>my--namespace</code> are not valid.
  /// </li>
  /// <li>
  /// Not be in IP address format (for example, 192.168.5.4)
  /// </li>
  /// </ul>
  /// If you specify a trail ARN, it must be in the format:
  ///
  /// <code>arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail</code>
  ///
  /// You cannot use this parameter with the <code>EventDataStore</code>
  /// parameter.
  Future<GetInsightSelectorsResponse> getInsightSelectors({
    String? eventDataStore,
    String? trailName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101.GetInsightSelectors'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (eventDataStore != null) 'EventDataStore': eventDataStore,
        if (trailName != null) 'TrailName': trailName,
      },
    );

    return GetInsightSelectorsResponse.fromJson(jsonResponse.body);
  }

  /// Gets event data results of a query. You must specify the
  /// <code>QueryID</code> value returned by the <code>StartQuery</code>
  /// operation.
  ///
  /// May throw [EventDataStoreARNInvalidException].
  /// May throw [EventDataStoreNotFoundException].
  /// May throw [InactiveEventDataStoreException].
  /// May throw [InvalidMaxResultsException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidParameterException].
  /// May throw [QueryIdNotFoundException].
  /// May throw [InsufficientEncryptionPolicyException].
  /// May throw [OperationNotPermittedException].
  /// May throw [UnsupportedOperationException].
  /// May throw [NoManagementAccountSLRExistsException].
  ///
  /// Parameter [queryId] :
  /// The ID of the query for which you want to get results.
  ///
  /// Parameter [eventDataStore] :
  /// The ARN (or ID suffix of the ARN) of the event data store against which
  /// the query was run.
  ///
  /// Parameter [maxQueryResults] :
  /// The maximum number of query results to display on a single page.
  ///
  /// Parameter [nextToken] :
  /// A token you can use to get the next page of query results.
  Future<GetQueryResultsResponse> getQueryResults({
    required String queryId,
    String? eventDataStore,
    int? maxQueryResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxQueryResults',
      maxQueryResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101.GetQueryResults'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'QueryId': queryId,
        if (eventDataStore != null) 'EventDataStore': eventDataStore,
        if (maxQueryResults != null) 'MaxQueryResults': maxQueryResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return GetQueryResultsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the JSON text of the resource-based policy document attached to
  /// the CloudTrail channel.
  ///
  /// May throw [ResourceARNNotValidException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourcePolicyNotFoundException].
  /// May throw [ResourceTypeNotSupportedException].
  /// May throw [OperationNotPermittedException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the CloudTrail channel attached to the
  /// resource-based policy. The following is the format of a resource ARN:
  /// <code>arn:aws:cloudtrail:us-east-2:123456789012:channel/MyChannel</code>.
  Future<GetResourcePolicyResponse> getResourcePolicy({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101.GetResourcePolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
      },
    );

    return GetResourcePolicyResponse.fromJson(jsonResponse.body);
  }

  /// Returns settings information for a specified trail.
  ///
  /// May throw [CloudTrailARNInvalidException].
  /// May throw [TrailNotFoundException].
  /// May throw [InvalidTrailNameException].
  /// May throw [UnsupportedOperationException].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [name] :
  /// The name or the Amazon Resource Name (ARN) of the trail for which you want
  /// to retrieve settings information.
  Future<GetTrailResponse> getTrail({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101.GetTrail'
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

    return GetTrailResponse.fromJson(jsonResponse.body);
  }

  /// Returns a JSON-formatted list of information about the specified trail.
  /// Fields include information on delivery errors, Amazon SNS and Amazon S3
  /// errors, and start and stop logging times for each trail. This operation
  /// returns trail status from a single Region. To return trail status from all
  /// Regions, you must call the operation on each Region.
  ///
  /// May throw [CloudTrailARNInvalidException].
  /// May throw [TrailNotFoundException].
  /// May throw [InvalidTrailNameException].
  /// May throw [UnsupportedOperationException].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [name] :
  /// Specifies the name or the CloudTrail ARN of the trail for which you are
  /// requesting status. To get the status of a shadow trail (a replication of
  /// the trail in another Region), you must specify its ARN. The following is
  /// the format of a trail ARN.
  ///
  /// <code>arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail</code>
  Future<GetTrailStatusResponse> getTrailStatus({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101.GetTrailStatus'
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

    return GetTrailStatusResponse.fromJson(jsonResponse.body);
  }

  /// Lists the channels in the current account, and their source names.
  ///
  /// May throw [InvalidNextTokenException].
  /// May throw [OperationNotPermittedException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of CloudTrail channels to display on a single page.
  ///
  /// Parameter [nextToken] :
  /// The token to use to get the next page of results after a previous API
  /// call. This token must be passed in with the same parameters that were
  /// specified in the original call. For example, if the original call
  /// specified an AttributeKey of 'Username' with a value of 'root', the call
  /// with NextToken should include those same parameters.
  Future<ListChannelsResponse> listChannels({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101.ListChannels'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListChannelsResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about all event data stores in the account, in the
  /// current Region.
  ///
  /// May throw [InvalidMaxResultsException].
  /// May throw [InvalidNextTokenException].
  /// May throw [OperationNotPermittedException].
  /// May throw [UnsupportedOperationException].
  /// May throw [NoManagementAccountSLRExistsException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of event data stores to display on a single page.
  ///
  /// Parameter [nextToken] :
  /// A token you can use to get the next page of event data store results.
  Future<ListEventDataStoresResponse> listEventDataStores({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101.ListEventDataStores'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListEventDataStoresResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of failures for the specified import.
  ///
  /// May throw [InvalidNextTokenException].
  /// May throw [OperationNotPermittedException].
  /// May throw [UnsupportedOperationException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [importId] :
  /// The ID of the import.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of failures to display on a single page.
  ///
  /// Parameter [nextToken] :
  /// A token you can use to get the next page of import failures.
  Future<ListImportFailuresResponse> listImportFailures({
    required String importId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101.ListImportFailures'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ImportId': importId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListImportFailuresResponse.fromJson(jsonResponse.body);
  }

  /// Returns information on all imports, or a select set of imports by
  /// <code>ImportStatus</code> or <code>Destination</code>.
  ///
  /// May throw [EventDataStoreARNInvalidException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidParameterException].
  /// May throw [OperationNotPermittedException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [destination] :
  /// The ARN of the destination event data store.
  ///
  /// Parameter [importStatus] :
  /// The status of the import.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of imports to display on a single page.
  ///
  /// Parameter [nextToken] :
  /// A token you can use to get the next page of import results.
  Future<ListImportsResponse> listImports({
    String? destination,
    ImportStatus? importStatus,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101.ListImports'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (destination != null) 'Destination': destination,
        if (importStatus != null) 'ImportStatus': importStatus.toValue(),
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListImportsResponse.fromJson(jsonResponse.body);
  }

  /// Returns Insights metrics data for trails that have enabled Insights. The
  /// request must include the <code>EventSource</code>, <code>EventName</code>,
  /// and <code>InsightType</code> parameters.
  ///
  /// If the <code>InsightType</code> is set to
  /// <code>ApiErrorRateInsight</code>, the request must also include the
  /// <code>ErrorCode</code> parameter.
  ///
  /// The following are the available time periods for
  /// <code>ListInsightsMetricData</code>. Each cutoff is inclusive.
  ///
  /// <ul>
  /// <li>
  /// Data points with a period of 60 seconds (1-minute) are available for 15
  /// days.
  /// </li>
  /// <li>
  /// Data points with a period of 300 seconds (5-minute) are available for 63
  /// days.
  /// </li>
  /// <li>
  /// Data points with a period of 3600 seconds (1 hour) are available for 90
  /// days.
  /// </li>
  /// </ul>
  /// Access to the <code>ListInsightsMetricData</code> API operation is linked
  /// to the <code>cloudtrail:LookupEvents</code> action. To use this operation,
  /// you must have permissions to perform the
  /// <code>cloudtrail:LookupEvents</code> action.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OperationNotPermittedException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [eventName] :
  /// The name of the event, typically the Amazon Web Services API on which
  /// unusual levels of activity were recorded.
  ///
  /// Parameter [eventSource] :
  /// The Amazon Web Services service to which the request was made, such as
  /// <code>iam.amazonaws.com</code> or <code>s3.amazonaws.com</code>.
  ///
  /// Parameter [insightType] :
  /// The type of CloudTrail Insights event, which is either
  /// <code>ApiCallRateInsight</code> or <code>ApiErrorRateInsight</code>. The
  /// <code>ApiCallRateInsight</code> Insights type analyzes write-only
  /// management API calls that are aggregated per minute against a baseline API
  /// call volume. The <code>ApiErrorRateInsight</code> Insights type analyzes
  /// management API calls that result in error codes.
  ///
  /// Parameter [dataType] :
  /// Type of datapoints to return. Valid values are <code>NonZeroData</code>
  /// and <code>FillWithZeros</code>. The default is <code>NonZeroData</code>.
  ///
  /// Parameter [endTime] :
  /// Specifies, in UTC, the end time for time-series data. The value specified
  /// is exclusive; results include data points up to the specified time stamp.
  ///
  /// The default is the time of request.
  ///
  /// Parameter [errorCode] :
  /// Conditionally required if the <code>InsightType</code> parameter is set to
  /// <code>ApiErrorRateInsight</code>.
  ///
  /// If returning metrics for the <code>ApiErrorRateInsight</code> Insights
  /// type, this is the error to retrieve data for. For example,
  /// <code>AccessDenied</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of datapoints to return. Valid values are integers from
  /// 1 to 21600. The default value is 21600.
  ///
  /// Parameter [nextToken] :
  /// Returned if all datapoints can't be returned in a single call. For
  /// example, due to reaching <code>MaxResults</code>.
  ///
  /// Add this parameter to the request to continue retrieving results starting
  /// from the last evaluated point.
  ///
  /// Parameter [period] :
  /// Granularity of data to retrieve, in seconds. Valid values are
  /// <code>60</code>, <code>300</code>, and <code>3600</code>. If you specify
  /// any other value, you will get an error. The default is 3600 seconds.
  ///
  /// Parameter [startTime] :
  /// Specifies, in UTC, the start time for time-series data. The value
  /// specified is inclusive; results include data points with the specified
  /// time stamp.
  ///
  /// The default is 90 days before the time of request.
  Future<ListInsightsMetricDataResponse> listInsightsMetricData({
    required String eventName,
    required String eventSource,
    required InsightType insightType,
    InsightsMetricDataType? dataType,
    DateTime? endTime,
    String? errorCode,
    int? maxResults,
    String? nextToken,
    int? period,
    DateTime? startTime,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      21600,
    );
    _s.validateNumRange(
      'period',
      period,
      60,
      3600,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101.ListInsightsMetricData'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EventName': eventName,
        'EventSource': eventSource,
        'InsightType': insightType.toValue(),
        if (dataType != null) 'DataType': dataType.toValue(),
        if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
        if (errorCode != null) 'ErrorCode': errorCode,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (period != null) 'Period': period,
        if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      },
    );

    return ListInsightsMetricDataResponse.fromJson(jsonResponse.body);
  }

  /// Returns all public keys whose private keys were used to sign the digest
  /// files within the specified time range. The public key is needed to
  /// validate digest files that were signed with its corresponding private key.
  /// <note>
  /// CloudTrail uses different private and public key pairs per Region. Each
  /// digest file is signed with a private key unique to its Region. When you
  /// validate a digest file from a specific Region, you must look in the same
  /// Region for its corresponding public key.
  /// </note>
  ///
  /// May throw [InvalidTimeRangeException].
  /// May throw [UnsupportedOperationException].
  /// May throw [OperationNotPermittedException].
  /// May throw [InvalidTokenException].
  ///
  /// Parameter [endTime] :
  /// Optionally specifies, in UTC, the end of the time range to look up public
  /// keys for CloudTrail digest files. If not specified, the current time is
  /// used.
  ///
  /// Parameter [nextToken] :
  /// Reserved for future use.
  ///
  /// Parameter [startTime] :
  /// Optionally specifies, in UTC, the start of the time range to look up
  /// public keys for CloudTrail digest files. If not specified, the current
  /// time is used, and the current public key is returned.
  Future<ListPublicKeysResponse> listPublicKeys({
    DateTime? endTime,
    String? nextToken,
    DateTime? startTime,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101.ListPublicKeys'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
        if (nextToken != null) 'NextToken': nextToken,
        if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      },
    );

    return ListPublicKeysResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of queries and query statuses for the past seven days. You
  /// must specify an ARN value for <code>EventDataStore</code>. Optionally, to
  /// shorten the list of results, you can specify a time range, formatted as
  /// timestamps, by adding <code>StartTime</code> and <code>EndTime</code>
  /// parameters, and a <code>QueryStatus</code> value. Valid values for
  /// <code>QueryStatus</code> include <code>QUEUED</code>,
  /// <code>RUNNING</code>, <code>FINISHED</code>, <code>FAILED</code>,
  /// <code>TIMED_OUT</code>, or <code>CANCELLED</code>.
  ///
  /// May throw [EventDataStoreARNInvalidException].
  /// May throw [EventDataStoreNotFoundException].
  /// May throw [InactiveEventDataStoreException].
  /// May throw [InvalidDateRangeException].
  /// May throw [InvalidMaxResultsException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidQueryStatusException].
  /// May throw [OperationNotPermittedException].
  /// May throw [UnsupportedOperationException].
  /// May throw [NoManagementAccountSLRExistsException].
  ///
  /// Parameter [eventDataStore] :
  /// The ARN (or the ID suffix of the ARN) of an event data store on which
  /// queries were run.
  ///
  /// Parameter [endTime] :
  /// Use with <code>StartTime</code> to bound a <code>ListQueries</code>
  /// request, and limit its results to only those queries run within a
  /// specified time period.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of queries to show on a page.
  ///
  /// Parameter [nextToken] :
  /// A token you can use to get the next page of results.
  ///
  /// Parameter [queryStatus] :
  /// The status of queries that you want to return in results. Valid values for
  /// <code>QueryStatus</code> include <code>QUEUED</code>,
  /// <code>RUNNING</code>, <code>FINISHED</code>, <code>FAILED</code>,
  /// <code>TIMED_OUT</code>, or <code>CANCELLED</code>.
  ///
  /// Parameter [startTime] :
  /// Use with <code>EndTime</code> to bound a <code>ListQueries</code> request,
  /// and limit its results to only those queries run within a specified time
  /// period.
  Future<ListQueriesResponse> listQueries({
    required String eventDataStore,
    DateTime? endTime,
    int? maxResults,
    String? nextToken,
    QueryStatus? queryStatus,
    DateTime? startTime,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101.ListQueries'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EventDataStore': eventDataStore,
        if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (queryStatus != null) 'QueryStatus': queryStatus.toValue(),
        if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      },
    );

    return ListQueriesResponse.fromJson(jsonResponse.body);
  }

  /// Lists the tags for the specified trails, event data stores, or channels in
  /// the current Region.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [CloudTrailARNInvalidException].
  /// May throw [EventDataStoreARNInvalidException].
  /// May throw [ChannelARNInvalidException].
  /// May throw [ResourceTypeNotSupportedException].
  /// May throw [InvalidTrailNameException].
  /// May throw [InactiveEventDataStoreException].
  /// May throw [EventDataStoreNotFoundException].
  /// May throw [UnsupportedOperationException].
  /// May throw [OperationNotPermittedException].
  /// May throw [InvalidTokenException].
  /// May throw [NoManagementAccountSLRExistsException].
  ///
  /// Parameter [resourceIdList] :
  /// Specifies a list of trail, event data store, or channel ARNs whose tags
  /// will be listed. The list has a limit of 20 ARNs.
  ///
  /// Example trail ARN format:
  /// <code>arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail</code>
  ///
  /// Example event data store ARN format:
  /// <code>arn:aws:cloudtrail:us-east-2:123456789012:eventdatastore/EXAMPLE-f852-4e8f-8bd1-bcf6cEXAMPLE</code>
  ///
  /// Example channel ARN format:
  /// <code>arn:aws:cloudtrail:us-east-2:123456789012:channel/01234567890</code>
  ///
  /// Parameter [nextToken] :
  /// Reserved for future use.
  Future<ListTagsResponse> listTags({
    required List<String> resourceIdList,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101.ListTags'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceIdList': resourceIdList,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListTagsResponse.fromJson(jsonResponse.body);
  }

  /// Lists trails that are in the current account.
  ///
  /// May throw [UnsupportedOperationException].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [nextToken] :
  /// The token to use to get the next page of results after a previous API
  /// call. This token must be passed in with the same parameters that were
  /// specified in the original call. For example, if the original call
  /// specified an AttributeKey of 'Username' with a value of 'root', the call
  /// with NextToken should include those same parameters.
  Future<ListTrailsResponse> listTrails({
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101.ListTrails'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListTrailsResponse.fromJson(jsonResponse.body);
  }

  /// Looks up <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-concepts.html#cloudtrail-concepts-management-events">management
  /// events</a> or <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-concepts.html#cloudtrail-concepts-insights-events">CloudTrail
  /// Insights events</a> that are captured by CloudTrail. You can look up
  /// events that occurred in a Region within the last 90 days.
  /// <note>
  /// <code>LookupEvents</code> returns recent Insights events for trails that
  /// enable Insights. To view Insights events for an event data store, you can
  /// run queries on your Insights event data store, and you can also view the
  /// Lake dashboard for Insights.
  /// </note>
  /// Lookup supports the following attributes for management events:
  ///
  /// <ul>
  /// <li>
  /// Amazon Web Services access key
  /// </li>
  /// <li>
  /// Event ID
  /// </li>
  /// <li>
  /// Event name
  /// </li>
  /// <li>
  /// Event source
  /// </li>
  /// <li>
  /// Read only
  /// </li>
  /// <li>
  /// Resource name
  /// </li>
  /// <li>
  /// Resource type
  /// </li>
  /// <li>
  /// User name
  /// </li>
  /// </ul>
  /// Lookup supports the following attributes for Insights events:
  ///
  /// <ul>
  /// <li>
  /// Event ID
  /// </li>
  /// <li>
  /// Event name
  /// </li>
  /// <li>
  /// Event source
  /// </li>
  /// </ul>
  /// All attributes are optional. The default number of results returned is 50,
  /// with a maximum of 50 possible. The response includes a token that you can
  /// use to get the next page of results.
  /// <important>
  /// The rate of lookup requests is limited to two per second, per account, per
  /// Region. If this limit is exceeded, a throttling error occurs.
  /// </important>
  ///
  /// May throw [InvalidLookupAttributesException].
  /// May throw [InvalidTimeRangeException].
  /// May throw [InvalidMaxResultsException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidEventCategoryException].
  /// May throw [UnsupportedOperationException].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [endTime] :
  /// Specifies that only events that occur before or at the specified time are
  /// returned. If the specified end time is before the specified start time, an
  /// error is returned.
  ///
  /// Parameter [eventCategory] :
  /// Specifies the event category. If you do not specify an event category,
  /// events of the category are not returned in the response. For example, if
  /// you do not specify <code>insight</code> as the value of
  /// <code>EventCategory</code>, no Insights events are returned.
  ///
  /// Parameter [lookupAttributes] :
  /// Contains a list of lookup attributes. Currently the list can contain only
  /// one item.
  ///
  /// Parameter [maxResults] :
  /// The number of events to return. Possible values are 1 through 50. The
  /// default is 50.
  ///
  /// Parameter [nextToken] :
  /// The token to use to get the next page of results after a previous API
  /// call. This token must be passed in with the same parameters that were
  /// specified in the original call. For example, if the original call
  /// specified an AttributeKey of 'Username' with a value of 'root', the call
  /// with NextToken should include those same parameters.
  ///
  /// Parameter [startTime] :
  /// Specifies that only events that occur after or at the specified time are
  /// returned. If the specified start time is after the specified end time, an
  /// error is returned.
  Future<LookupEventsResponse> lookupEvents({
    DateTime? endTime,
    EventCategory? eventCategory,
    List<LookupAttribute>? lookupAttributes,
    int? maxResults,
    String? nextToken,
    DateTime? startTime,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101.LookupEvents'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
        if (eventCategory != null) 'EventCategory': eventCategory.toValue(),
        if (lookupAttributes != null) 'LookupAttributes': lookupAttributes,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      },
    );

    return LookupEventsResponse.fromJson(jsonResponse.body);
  }

  /// Configures an event selector or advanced event selectors for your trail.
  /// Use event selectors or advanced event selectors to specify management and
  /// data event settings for your trail. If you want your trail to log Insights
  /// events, be sure the event selector enables logging of the Insights event
  /// types you want configured for your trail. For more information about
  /// logging Insights events, see <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-insights-events-with-cloudtrail.html">Logging
  /// Insights events</a> in the <i>CloudTrail User Guide</i>. By default,
  /// trails created without specific event selectors are configured to log all
  /// read and write management events, and no data events.
  ///
  /// When an event occurs in your account, CloudTrail evaluates the event
  /// selectors or advanced event selectors in all trails. For each trail, if
  /// the event matches any event selector, the trail processes and logs the
  /// event. If the event doesn't match any event selector, the trail doesn't
  /// log the event.
  ///
  /// Example
  /// <ol>
  /// <li>
  /// You create an event selector for a trail and specify that you want
  /// write-only events.
  /// </li>
  /// <li>
  /// The EC2 <code>GetConsoleOutput</code> and <code>RunInstances</code> API
  /// operations occur in your account.
  /// </li>
  /// <li>
  /// CloudTrail evaluates whether the events match your event selectors.
  /// </li>
  /// <li>
  /// The <code>RunInstances</code> is a write-only event and it matches your
  /// event selector. The trail logs the event.
  /// </li>
  /// <li>
  /// The <code>GetConsoleOutput</code> is a read-only event that doesn't match
  /// your event selector. The trail doesn't log the event.
  /// </li> </ol>
  /// The <code>PutEventSelectors</code> operation must be called from the
  /// Region in which the trail was created; otherwise, an
  /// <code>InvalidHomeRegionException</code> exception is thrown.
  ///
  /// You can configure up to five event selectors for each trail. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-management-events-with-cloudtrail.html">Logging
  /// management events</a>, <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-data-events-with-cloudtrail.html">Logging
  /// data events</a>, and <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/WhatIsCloudTrail-Limits.html">Quotas
  /// in CloudTrail</a> in the <i>CloudTrail User Guide</i>.
  ///
  /// You can add advanced event selectors, and conditions for your advanced
  /// event selectors, up to a maximum of 500 values for all conditions and
  /// selectors on a trail. You can use either
  /// <code>AdvancedEventSelectors</code> or <code>EventSelectors</code>, but
  /// not both. If you apply <code>AdvancedEventSelectors</code> to a trail, any
  /// existing <code>EventSelectors</code> are overwritten. For more information
  /// about advanced event selectors, see <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-data-events-with-cloudtrail.html">Logging
  /// data events</a> in the <i>CloudTrail User Guide</i>.
  ///
  /// May throw [TrailNotFoundException].
  /// May throw [InvalidTrailNameException].
  /// May throw [CloudTrailARNInvalidException].
  /// May throw [InvalidHomeRegionException].
  /// May throw [InvalidEventSelectorsException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [UnsupportedOperationException].
  /// May throw [OperationNotPermittedException].
  /// May throw [NotOrganizationMasterAccountException].
  /// May throw [NoManagementAccountSLRExistsException].
  /// May throw [InsufficientDependencyServiceAccessPermissionException].
  ///
  /// Parameter [trailName] :
  /// Specifies the name of the trail or trail ARN. If you specify a trail name,
  /// the string must meet the following requirements:
  ///
  /// <ul>
  /// <li>
  /// Contain only ASCII letters (a-z, A-Z), numbers (0-9), periods (.),
  /// underscores (_), or dashes (-)
  /// </li>
  /// <li>
  /// Start with a letter or number, and end with a letter or number
  /// </li>
  /// <li>
  /// Be between 3 and 128 characters
  /// </li>
  /// <li>
  /// Have no adjacent periods, underscores or dashes. Names like
  /// <code>my-_namespace</code> and <code>my--namespace</code> are not valid.
  /// </li>
  /// <li>
  /// Not be in IP address format (for example, 192.168.5.4)
  /// </li>
  /// </ul>
  /// If you specify a trail ARN, it must be in the following format.
  ///
  /// <code>arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail</code>
  ///
  /// Parameter [advancedEventSelectors] :
  /// Specifies the settings for advanced event selectors. You can add advanced
  /// event selectors, and conditions for your advanced event selectors, up to a
  /// maximum of 500 values for all conditions and selectors on a trail. You can
  /// use either <code>AdvancedEventSelectors</code> or
  /// <code>EventSelectors</code>, but not both. If you apply
  /// <code>AdvancedEventSelectors</code> to a trail, any existing
  /// <code>EventSelectors</code> are overwritten. For more information about
  /// advanced event selectors, see <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-data-events-with-cloudtrail.html">Logging
  /// data events</a> in the <i>CloudTrail User Guide</i>.
  ///
  /// Parameter [eventSelectors] :
  /// Specifies the settings for your event selectors. You can configure up to
  /// five event selectors for a trail. You can use either
  /// <code>EventSelectors</code> or <code>AdvancedEventSelectors</code> in a
  /// <code>PutEventSelectors</code> request, but not both. If you apply
  /// <code>EventSelectors</code> to a trail, any existing
  /// <code>AdvancedEventSelectors</code> are overwritten.
  Future<PutEventSelectorsResponse> putEventSelectors({
    required String trailName,
    List<AdvancedEventSelector>? advancedEventSelectors,
    List<EventSelector>? eventSelectors,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101.PutEventSelectors'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TrailName': trailName,
        if (advancedEventSelectors != null)
          'AdvancedEventSelectors': advancedEventSelectors,
        if (eventSelectors != null) 'EventSelectors': eventSelectors,
      },
    );

    return PutEventSelectorsResponse.fromJson(jsonResponse.body);
  }

  /// Lets you enable Insights event logging by specifying the Insights
  /// selectors that you want to enable on an existing trail or event data
  /// store. You also use <code>PutInsightSelectors</code> to turn off Insights
  /// event logging, by passing an empty list of Insights types. The valid
  /// Insights event types are <code>ApiErrorRateInsight</code> and
  /// <code>ApiCallRateInsight</code>.
  ///
  /// To enable Insights on an event data store, you must specify the ARNs (or
  /// ID suffix of the ARNs) for the source event data store
  /// (<code>EventDataStore</code>) and the destination event data store
  /// (<code>InsightsDestination</code>). The source event data store logs
  /// management events and enables Insights. The destination event data store
  /// logs Insights events based upon the management event activity of the
  /// source event data store. The source and destination event data stores must
  /// belong to the same Amazon Web Services account.
  ///
  /// To log Insights events for a trail, you must specify the name
  /// (<code>TrailName</code>) of the CloudTrail trail for which you want to
  /// change or add Insights selectors.
  ///
  /// To log CloudTrail Insights events on API call volume, the trail or event
  /// data store must log <code>write</code> management events. To log
  /// CloudTrail Insights events on API error rate, the trail or event data
  /// store must log <code>read</code> or <code>write</code> management events.
  /// You can call <code>GetEventSelectors</code> on a trail to check whether
  /// the trail logs management events. You can call
  /// <code>GetEventDataStore</code> on an event data store to check whether the
  /// event data store logs management events.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-insights-events-with-cloudtrail.html">Logging
  /// CloudTrail Insights events</a> in the <i>CloudTrail User Guide</i>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidParameterCombinationException].
  /// May throw [TrailNotFoundException].
  /// May throw [InvalidTrailNameException].
  /// May throw [CloudTrailARNInvalidException].
  /// May throw [InvalidHomeRegionException].
  /// May throw [InvalidInsightSelectorsException].
  /// May throw [InsufficientS3BucketPolicyException].
  /// May throw [InsufficientEncryptionPolicyException].
  /// May throw [S3BucketDoesNotExistException].
  /// May throw [KmsException].
  /// May throw [UnsupportedOperationException].
  /// May throw [OperationNotPermittedException].
  /// May throw [NotOrganizationMasterAccountException].
  /// May throw [NoManagementAccountSLRExistsException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [insightSelectors] :
  /// A JSON string that contains the Insights types you want to log on a trail
  /// or event data store. <code>ApiCallRateInsight</code> and
  /// <code>ApiErrorRateInsight</code> are valid Insight types.
  ///
  /// The <code>ApiCallRateInsight</code> Insights type analyzes write-only
  /// management API calls that are aggregated per minute against a baseline API
  /// call volume.
  ///
  /// The <code>ApiErrorRateInsight</code> Insights type analyzes management API
  /// calls that result in error codes. The error is shown if the API call is
  /// unsuccessful.
  ///
  /// Parameter [eventDataStore] :
  /// The ARN (or ID suffix of the ARN) of the source event data store for which
  /// you want to change or add Insights selectors. To enable Insights on an
  /// event data store, you must provide both the <code>EventDataStore</code>
  /// and <code>InsightsDestination</code> parameters.
  ///
  /// You cannot use this parameter with the <code>TrailName</code> parameter.
  ///
  /// Parameter [insightsDestination] :
  /// The ARN (or ID suffix of the ARN) of the destination event data store that
  /// logs Insights events. To enable Insights on an event data store, you must
  /// provide both the <code>EventDataStore</code> and
  /// <code>InsightsDestination</code> parameters.
  ///
  /// You cannot use this parameter with the <code>TrailName</code> parameter.
  ///
  /// Parameter [trailName] :
  /// The name of the CloudTrail trail for which you want to change or add
  /// Insights selectors.
  ///
  /// You cannot use this parameter with the <code>EventDataStore</code> and
  /// <code>InsightsDestination</code> parameters.
  Future<PutInsightSelectorsResponse> putInsightSelectors({
    required List<InsightSelector> insightSelectors,
    String? eventDataStore,
    String? insightsDestination,
    String? trailName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101.PutInsightSelectors'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InsightSelectors': insightSelectors,
        if (eventDataStore != null) 'EventDataStore': eventDataStore,
        if (insightsDestination != null)
          'InsightsDestination': insightsDestination,
        if (trailName != null) 'TrailName': trailName,
      },
    );

    return PutInsightSelectorsResponse.fromJson(jsonResponse.body);
  }

  /// Attaches a resource-based permission policy to a CloudTrail channel that
  /// is used for an integration with an event source outside of Amazon Web
  /// Services. For more information about resource-based policies, see <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/security_iam_resource-based-policy-examples.html">CloudTrail
  /// resource-based policy examples</a> in the <i>CloudTrail User Guide</i>.
  ///
  /// May throw [ResourceARNNotValidException].
  /// May throw [ResourcePolicyNotValidException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceTypeNotSupportedException].
  /// May throw [OperationNotPermittedException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the CloudTrail channel attached to the
  /// resource-based policy. The following is the format of a resource ARN:
  /// <code>arn:aws:cloudtrail:us-east-2:123456789012:channel/MyChannel</code>.
  ///
  /// Parameter [resourcePolicy] :
  /// A JSON-formatted string for an Amazon Web Services resource-based policy.
  ///
  /// The following are requirements for the resource policy:
  ///
  /// <ul>
  /// <li>
  /// Contains only one action: cloudtrail-data:PutAuditEvents
  /// </li>
  /// <li>
  /// Contains at least one statement. The policy can have a maximum of 20
  /// statements.
  /// </li>
  /// <li>
  /// Each statement contains at least one principal. A statement can have a
  /// maximum of 50 principals.
  /// </li>
  /// </ul>
  Future<PutResourcePolicyResponse> putResourcePolicy({
    required String resourceArn,
    required String resourcePolicy,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101.PutResourcePolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'ResourcePolicy': resourcePolicy,
      },
    );

    return PutResourcePolicyResponse.fromJson(jsonResponse.body);
  }

  /// Registers an organization’s member account as the CloudTrail <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-delegated-administrator.html">delegated
  /// administrator</a>.
  ///
  /// May throw [AccountRegisteredException].
  /// May throw [AccountNotFoundException].
  /// May throw [InsufficientDependencyServiceAccessPermissionException].
  /// May throw [InvalidParameterException].
  /// May throw [CannotDelegateManagementAccountException].
  /// May throw [CloudTrailAccessNotEnabledException].
  /// May throw [ConflictException].
  /// May throw [DelegatedAdminAccountLimitExceededException].
  /// May throw [NotOrganizationManagementAccountException].
  /// May throw [OrganizationNotInAllFeaturesModeException].
  /// May throw [OrganizationsNotInUseException].
  /// May throw [UnsupportedOperationException].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [memberAccountId] :
  /// An organization member account ID that you want to designate as a
  /// delegated administrator.
  Future<void> registerOrganizationDelegatedAdmin({
    required String memberAccountId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101.RegisterOrganizationDelegatedAdmin'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MemberAccountId': memberAccountId,
      },
    );
  }

  /// Removes the specified tags from a trail, event data store, or channel.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [CloudTrailARNInvalidException].
  /// May throw [EventDataStoreARNInvalidException].
  /// May throw [ChannelARNInvalidException].
  /// May throw [ResourceTypeNotSupportedException].
  /// May throw [InvalidTrailNameException].
  /// May throw [InvalidTagParameterException].
  /// May throw [InactiveEventDataStoreException].
  /// May throw [EventDataStoreNotFoundException].
  /// May throw [ChannelNotFoundException].
  /// May throw [UnsupportedOperationException].
  /// May throw [OperationNotPermittedException].
  /// May throw [NotOrganizationMasterAccountException].
  /// May throw [NoManagementAccountSLRExistsException].
  ///
  /// Parameter [resourceId] :
  /// Specifies the ARN of the trail, event data store, or channel from which
  /// tags should be removed.
  ///
  /// Example trail ARN format:
  /// <code>arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail</code>
  ///
  /// Example event data store ARN format:
  /// <code>arn:aws:cloudtrail:us-east-2:123456789012:eventdatastore/EXAMPLE-f852-4e8f-8bd1-bcf6cEXAMPLE</code>
  ///
  /// Example channel ARN format:
  /// <code>arn:aws:cloudtrail:us-east-2:123456789012:channel/01234567890</code>
  ///
  /// Parameter [tagsList] :
  /// Specifies a list of tags to be removed.
  Future<void> removeTags({
    required String resourceId,
    required List<Tag> tagsList,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101.RemoveTags'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceId': resourceId,
        'TagsList': tagsList,
      },
    );
  }

  /// Restores a deleted event data store specified by
  /// <code>EventDataStore</code>, which accepts an event data store ARN. You
  /// can only restore a deleted event data store within the seven-day wait
  /// period after deletion. Restoring an event data store can take several
  /// minutes, depending on the size of the event data store.
  ///
  /// May throw [EventDataStoreARNInvalidException].
  /// May throw [EventDataStoreNotFoundException].
  /// May throw [EventDataStoreMaxLimitExceededException].
  /// May throw [InvalidEventDataStoreStatusException].
  /// May throw [InvalidParameterException].
  /// May throw [OperationNotPermittedException].
  /// May throw [UnsupportedOperationException].
  /// May throw [CloudTrailAccessNotEnabledException].
  /// May throw [InsufficientDependencyServiceAccessPermissionException].
  /// May throw [OrganizationsNotInUseException].
  /// May throw [NotOrganizationMasterAccountException].
  /// May throw [NoManagementAccountSLRExistsException].
  /// May throw [OrganizationNotInAllFeaturesModeException].
  ///
  /// Parameter [eventDataStore] :
  /// The ARN (or the ID suffix of the ARN) of the event data store that you
  /// want to restore.
  Future<RestoreEventDataStoreResponse> restoreEventDataStore({
    required String eventDataStore,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101.RestoreEventDataStore'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EventDataStore': eventDataStore,
      },
    );

    return RestoreEventDataStoreResponse.fromJson(jsonResponse.body);
  }

  /// Starts the ingestion of live events on an event data store specified as
  /// either an ARN or the ID portion of the ARN. To start ingestion, the event
  /// data store <code>Status</code> must be <code>STOPPED_INGESTION</code> and
  /// the <code>eventCategory</code> must be <code>Management</code>,
  /// <code>Data</code>, or <code>ConfigurationItem</code>.
  ///
  /// May throw [EventDataStoreARNInvalidException].
  /// May throw [EventDataStoreNotFoundException].
  /// May throw [InvalidEventDataStoreStatusException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidEventDataStoreCategoryException].
  /// May throw [OperationNotPermittedException].
  /// May throw [UnsupportedOperationException].
  /// May throw [NotOrganizationMasterAccountException].
  /// May throw [NoManagementAccountSLRExistsException].
  /// May throw [InsufficientDependencyServiceAccessPermissionException].
  ///
  /// Parameter [eventDataStore] :
  /// The ARN (or ID suffix of the ARN) of the event data store for which you
  /// want to start ingestion.
  Future<void> startEventDataStoreIngestion({
    required String eventDataStore,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101.StartEventDataStoreIngestion'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EventDataStore': eventDataStore,
      },
    );
  }

  /// Starts an import of logged trail events from a source S3 bucket to a
  /// destination event data store. By default, CloudTrail only imports events
  /// contained in the S3 bucket's <code>CloudTrail</code> prefix and the
  /// prefixes inside the <code>CloudTrail</code> prefix, and does not check
  /// prefixes for other Amazon Web Services services. If you want to import
  /// CloudTrail events contained in another prefix, you must include the prefix
  /// in the <code>S3LocationUri</code>. For more considerations about importing
  /// trail events, see <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-copy-trail-to-lake.html#cloudtrail-trail-copy-considerations">Considerations
  /// for copying trail events</a> in the <i>CloudTrail User Guide</i>.
  ///
  /// When you start a new import, the <code>Destinations</code> and
  /// <code>ImportSource</code> parameters are required. Before starting a new
  /// import, disable any access control lists (ACLs) attached to the source S3
  /// bucket. For more information about disabling ACLs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/about-object-ownership.html">Controlling
  /// ownership of objects and disabling ACLs for your bucket</a>.
  ///
  /// When you retry an import, the <code>ImportID</code> parameter is required.
  /// <note>
  /// If the destination event data store is for an organization, you must use
  /// the management account to import trail events. You cannot use the
  /// delegated administrator account for the organization.
  /// </note>
  ///
  /// May throw [AccountHasOngoingImportException].
  /// May throw [EventDataStoreARNInvalidException].
  /// May throw [EventDataStoreNotFoundException].
  /// May throw [InvalidEventDataStoreStatusException].
  /// May throw [InvalidEventDataStoreCategoryException].
  /// May throw [InactiveEventDataStoreException].
  /// May throw [InvalidImportSourceException].
  /// May throw [ImportNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InsufficientEncryptionPolicyException].
  /// May throw [OperationNotPermittedException].
  /// May throw [UnsupportedOperationException].
  /// May throw [OperationNotPermittedException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [destinations] :
  /// The ARN of the destination event data store. Use this parameter for a new
  /// import.
  ///
  /// Parameter [endEventTime] :
  /// Use with <code>StartEventTime</code> to bound a <code>StartImport</code>
  /// request, and limit imported trail events to only those events logged
  /// within a specified time period. When you specify a time range, CloudTrail
  /// checks the prefix and log file names to verify the names contain a date
  /// between the specified <code>StartEventTime</code> and
  /// <code>EndEventTime</code> before attempting to import events.
  ///
  /// Parameter [importId] :
  /// The ID of the import. Use this parameter when you are retrying an import.
  ///
  /// Parameter [importSource] :
  /// The source S3 bucket for the import. Use this parameter for a new import.
  ///
  /// Parameter [startEventTime] :
  /// Use with <code>EndEventTime</code> to bound a <code>StartImport</code>
  /// request, and limit imported trail events to only those events logged
  /// within a specified time period. When you specify a time range, CloudTrail
  /// checks the prefix and log file names to verify the names contain a date
  /// between the specified <code>StartEventTime</code> and
  /// <code>EndEventTime</code> before attempting to import events.
  Future<StartImportResponse> startImport({
    List<String>? destinations,
    DateTime? endEventTime,
    String? importId,
    ImportSource? importSource,
    DateTime? startEventTime,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101.StartImport'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (destinations != null) 'Destinations': destinations,
        if (endEventTime != null)
          'EndEventTime': unixTimestampToJson(endEventTime),
        if (importId != null) 'ImportId': importId,
        if (importSource != null) 'ImportSource': importSource,
        if (startEventTime != null)
          'StartEventTime': unixTimestampToJson(startEventTime),
      },
    );

    return StartImportResponse.fromJson(jsonResponse.body);
  }

  /// Starts the recording of Amazon Web Services API calls and log file
  /// delivery for a trail. For a trail that is enabled in all Regions, this
  /// operation must be called from the Region in which the trail was created.
  /// This operation cannot be called on the shadow trails (replicated trails in
  /// other Regions) of a trail that is enabled in all Regions.
  ///
  /// May throw [CloudTrailARNInvalidException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [TrailNotFoundException].
  /// May throw [InvalidTrailNameException].
  /// May throw [InvalidHomeRegionException].
  /// May throw [UnsupportedOperationException].
  /// May throw [OperationNotPermittedException].
  /// May throw [NotOrganizationMasterAccountException].
  /// May throw [NoManagementAccountSLRExistsException].
  /// May throw [InsufficientDependencyServiceAccessPermissionException].
  ///
  /// Parameter [name] :
  /// Specifies the name or the CloudTrail ARN of the trail for which CloudTrail
  /// logs Amazon Web Services API calls. The following is the format of a trail
  /// ARN.
  ///
  /// <code>arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail</code>
  Future<void> startLogging({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101.StartLogging'
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

  /// Starts a CloudTrail Lake query. Use the <code>QueryStatement</code>
  /// parameter to provide your SQL query, enclosed in single quotation marks.
  /// Use the optional <code>DeliveryS3Uri</code> parameter to deliver the query
  /// results to an S3 bucket.
  ///
  /// <code>StartQuery</code> requires you specify either the
  /// <code>QueryStatement</code> parameter, or a <code>QueryAlias</code> and
  /// any <code>QueryParameters</code>. In the current release, the
  /// <code>QueryAlias</code> and <code>QueryParameters</code> parameters are
  /// used only for the queries that populate the CloudTrail Lake dashboards.
  ///
  /// May throw [EventDataStoreARNInvalidException].
  /// May throw [EventDataStoreNotFoundException].
  /// May throw [InactiveEventDataStoreException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidQueryStatementException].
  /// May throw [MaxConcurrentQueriesException].
  /// May throw [InsufficientEncryptionPolicyException].
  /// May throw [InvalidS3PrefixException].
  /// May throw [InvalidS3BucketNameException].
  /// May throw [InsufficientS3BucketPolicyException].
  /// May throw [S3BucketDoesNotExistException].
  /// May throw [OperationNotPermittedException].
  /// May throw [UnsupportedOperationException].
  /// May throw [NoManagementAccountSLRExistsException].
  ///
  /// Parameter [deliveryS3Uri] :
  /// The URI for the S3 bucket where CloudTrail delivers the query results.
  ///
  /// Parameter [queryAlias] :
  /// The alias that identifies a query template.
  ///
  /// Parameter [queryParameters] :
  /// The query parameters for the specified <code>QueryAlias</code>.
  ///
  /// Parameter [queryStatement] :
  /// The SQL code of your query.
  Future<StartQueryResponse> startQuery({
    String? deliveryS3Uri,
    String? queryAlias,
    List<String>? queryParameters,
    String? queryStatement,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101.StartQuery'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (deliveryS3Uri != null) 'DeliveryS3Uri': deliveryS3Uri,
        if (queryAlias != null) 'QueryAlias': queryAlias,
        if (queryParameters != null) 'QueryParameters': queryParameters,
        if (queryStatement != null) 'QueryStatement': queryStatement,
      },
    );

    return StartQueryResponse.fromJson(jsonResponse.body);
  }

  /// Stops the ingestion of live events on an event data store specified as
  /// either an ARN or the ID portion of the ARN. To stop ingestion, the event
  /// data store <code>Status</code> must be <code>ENABLED</code> and the
  /// <code>eventCategory</code> must be <code>Management</code>,
  /// <code>Data</code>, or <code>ConfigurationItem</code>.
  ///
  /// May throw [EventDataStoreARNInvalidException].
  /// May throw [EventDataStoreNotFoundException].
  /// May throw [InvalidEventDataStoreStatusException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidEventDataStoreCategoryException].
  /// May throw [OperationNotPermittedException].
  /// May throw [UnsupportedOperationException].
  /// May throw [NotOrganizationMasterAccountException].
  /// May throw [NoManagementAccountSLRExistsException].
  /// May throw [InsufficientDependencyServiceAccessPermissionException].
  ///
  /// Parameter [eventDataStore] :
  /// The ARN (or ID suffix of the ARN) of the event data store for which you
  /// want to stop ingestion.
  Future<void> stopEventDataStoreIngestion({
    required String eventDataStore,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101.StopEventDataStoreIngestion'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EventDataStore': eventDataStore,
      },
    );
  }

  /// Stops a specified import.
  ///
  /// May throw [ImportNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [OperationNotPermittedException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [importId] :
  /// The ID of the import.
  Future<StopImportResponse> stopImport({
    required String importId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101.StopImport'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ImportId': importId,
      },
    );

    return StopImportResponse.fromJson(jsonResponse.body);
  }

  /// Suspends the recording of Amazon Web Services API calls and log file
  /// delivery for the specified trail. Under most circumstances, there is no
  /// need to use this action. You can update a trail without stopping it first.
  /// This action is the only way to stop recording. For a trail enabled in all
  /// Regions, this operation must be called from the Region in which the trail
  /// was created, or an <code>InvalidHomeRegionException</code> will occur.
  /// This operation cannot be called on the shadow trails (replicated trails in
  /// other Regions) of a trail enabled in all Regions.
  ///
  /// May throw [TrailNotFoundException].
  /// May throw [InvalidTrailNameException].
  /// May throw [CloudTrailARNInvalidException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InvalidHomeRegionException].
  /// May throw [UnsupportedOperationException].
  /// May throw [OperationNotPermittedException].
  /// May throw [NotOrganizationMasterAccountException].
  /// May throw [NoManagementAccountSLRExistsException].
  /// May throw [InsufficientDependencyServiceAccessPermissionException].
  ///
  /// Parameter [name] :
  /// Specifies the name or the CloudTrail ARN of the trail for which CloudTrail
  /// will stop logging Amazon Web Services API calls. The following is the
  /// format of a trail ARN.
  ///
  /// <code>arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail</code>
  Future<void> stopLogging({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101.StopLogging'
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

  /// Updates a channel specified by a required channel ARN or UUID.
  ///
  /// May throw [ChannelARNInvalidException].
  /// May throw [ChannelNotFoundException].
  /// May throw [ChannelAlreadyExistsException].
  /// May throw [EventDataStoreARNInvalidException].
  /// May throw [EventDataStoreNotFoundException].
  /// May throw [InvalidEventDataStoreCategoryException].
  /// May throw [InactiveEventDataStoreException].
  /// May throw [InvalidParameterException].
  /// May throw [OperationNotPermittedException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [channel] :
  /// The ARN or ID (the ARN suffix) of the channel that you want to update.
  ///
  /// Parameter [destinations] :
  /// The ARNs of event data stores that you want to log events arriving through
  /// the channel.
  ///
  /// Parameter [name] :
  /// Changes the name of the channel.
  Future<UpdateChannelResponse> updateChannel({
    required String channel,
    List<Destination>? destinations,
    String? name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101.UpdateChannel'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Channel': channel,
        if (destinations != null) 'Destinations': destinations,
        if (name != null) 'Name': name,
      },
    );

    return UpdateChannelResponse.fromJson(jsonResponse.body);
  }

  /// Updates an event data store. The required <code>EventDataStore</code>
  /// value is an ARN or the ID portion of the ARN. Other parameters are
  /// optional, but at least one optional parameter must be specified, or
  /// CloudTrail throws an error. <code>RetentionPeriod</code> is in days, and
  /// valid values are integers between 7 and 3653 if the
  /// <code>BillingMode</code> is set to
  /// <code>EXTENDABLE_RETENTION_PRICING</code>, or between 7 and 2557 if
  /// <code>BillingMode</code> is set to <code>FIXED_RETENTION_PRICING</code>.
  /// By default, <code>TerminationProtection</code> is enabled.
  ///
  /// For event data stores for CloudTrail events,
  /// <code>AdvancedEventSelectors</code> includes or excludes management or
  /// data events in your event data store. For more information about
  /// <code>AdvancedEventSelectors</code>, see <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/APIReference/API_AdvancedEventSelector.html">AdvancedEventSelectors</a>.
  ///
  /// For event data stores for CloudTrail Insights events, Config configuration
  /// items, Audit Manager evidence, or non-Amazon Web Services events,
  /// <code>AdvancedEventSelectors</code> includes events of that type in your
  /// event data store.
  ///
  /// May throw [EventDataStoreAlreadyExistsException].
  /// May throw [EventDataStoreARNInvalidException].
  /// May throw [EventDataStoreNotFoundException].
  /// May throw [InvalidEventSelectorsException].
  /// May throw [InvalidInsightSelectorsException].
  /// May throw [EventDataStoreHasOngoingImportException].
  /// May throw [InactiveEventDataStoreException].
  /// May throw [InvalidParameterException].
  /// May throw [OperationNotPermittedException].
  /// May throw [UnsupportedOperationException].
  /// May throw [InsufficientEncryptionPolicyException].
  /// May throw [InvalidKmsKeyIdException].
  /// May throw [KmsKeyNotFoundException].
  /// May throw [KmsException].
  /// May throw [CloudTrailAccessNotEnabledException].
  /// May throw [InsufficientDependencyServiceAccessPermissionException].
  /// May throw [OrganizationsNotInUseException].
  /// May throw [NotOrganizationMasterAccountException].
  /// May throw [NoManagementAccountSLRExistsException].
  /// May throw [OrganizationNotInAllFeaturesModeException].
  ///
  /// Parameter [eventDataStore] :
  /// The ARN (or the ID suffix of the ARN) of the event data store that you
  /// want to update.
  ///
  /// Parameter [advancedEventSelectors] :
  /// The advanced event selectors used to select events for the event data
  /// store. You can configure up to five advanced event selectors for each
  /// event data store.
  ///
  /// Parameter [billingMode] :
  /// <note>
  /// You can't change the billing mode from
  /// <code>EXTENDABLE_RETENTION_PRICING</code> to
  /// <code>FIXED_RETENTION_PRICING</code>. If <code>BillingMode</code> is set
  /// to <code>EXTENDABLE_RETENTION_PRICING</code> and you want to use
  /// <code>FIXED_RETENTION_PRICING</code> instead, you'll need to stop
  /// ingestion on the event data store and create a new event data store that
  /// uses <code>FIXED_RETENTION_PRICING</code>.
  /// </note>
  /// The billing mode for the event data store determines the cost for
  /// ingesting events and the default and maximum retention period for the
  /// event data store.
  ///
  /// The following are the possible values:
  ///
  /// <ul>
  /// <li>
  /// <code>EXTENDABLE_RETENTION_PRICING</code> - This billing mode is generally
  /// recommended if you want a flexible retention period of up to 3653 days
  /// (about 10 years). The default retention period for this billing mode is
  /// 366 days.
  /// </li>
  /// <li>
  /// <code>FIXED_RETENTION_PRICING</code> - This billing mode is recommended if
  /// you expect to ingest more than 25 TB of event data per month and need a
  /// retention period of up to 2557 days (about 7 years). The default retention
  /// period for this billing mode is 2557 days.
  /// </li>
  /// </ul>
  /// For more information about CloudTrail pricing, see <a
  /// href="http://aws.amazon.com/cloudtrail/pricing/">CloudTrail Pricing</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-lake-manage-costs.html">Managing
  /// CloudTrail Lake costs</a>.
  ///
  /// Parameter [kmsKeyId] :
  /// Specifies the KMS key ID to use to encrypt the events delivered by
  /// CloudTrail. The value can be an alias name prefixed by
  /// <code>alias/</code>, a fully specified ARN to an alias, a fully specified
  /// ARN to a key, or a globally unique identifier.
  /// <important>
  /// Disabling or deleting the KMS key, or removing CloudTrail permissions on
  /// the key, prevents CloudTrail from logging events to the event data store,
  /// and prevents users from querying the data in the event data store that was
  /// encrypted with the key. After you associate an event data store with a KMS
  /// key, the KMS key cannot be removed or changed. Before you disable or
  /// delete a KMS key that you are using with an event data store, delete or
  /// back up your event data store.
  /// </important>
  /// CloudTrail also supports KMS multi-Region keys. For more information about
  /// multi-Region keys, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html">Using
  /// multi-Region keys</a> in the <i>Key Management Service Developer
  /// Guide</i>.
  ///
  /// Examples:
  ///
  /// <ul>
  /// <li>
  /// <code>alias/MyAliasName</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:kms:us-east-2:123456789012:alias/MyAliasName</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:kms:us-east-2:123456789012:key/12345678-1234-1234-1234-123456789012</code>
  /// </li>
  /// <li>
  /// <code>12345678-1234-1234-1234-123456789012</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [multiRegionEnabled] :
  /// Specifies whether an event data store collects events from all Regions, or
  /// only from the Region in which it was created.
  ///
  /// Parameter [name] :
  /// The event data store name.
  ///
  /// Parameter [organizationEnabled] :
  /// Specifies whether an event data store collects events logged for an
  /// organization in Organizations.
  /// <note>
  /// Only the management account for the organization can convert an
  /// organization event data store to a non-organization event data store, or
  /// convert a non-organization event data store to an organization event data
  /// store.
  /// </note>
  ///
  /// Parameter [retentionPeriod] :
  /// The retention period of the event data store, in days. If
  /// <code>BillingMode</code> is set to
  /// <code>EXTENDABLE_RETENTION_PRICING</code>, you can set a retention period
  /// of up to 3653 days, the equivalent of 10 years. If
  /// <code>BillingMode</code> is set to <code>FIXED_RETENTION_PRICING</code>,
  /// you can set a retention period of up to 2557 days, the equivalent of seven
  /// years.
  ///
  /// CloudTrail Lake determines whether to retain an event by checking if the
  /// <code>eventTime</code> of the event is within the specified retention
  /// period. For example, if you set a retention period of 90 days, CloudTrail
  /// will remove events when the <code>eventTime</code> is older than 90 days.
  /// <note>
  /// If you decrease the retention period of an event data store, CloudTrail
  /// will remove any events with an <code>eventTime</code> older than the new
  /// retention period. For example, if the previous retention period was 365
  /// days and you decrease it to 100 days, CloudTrail will remove events with
  /// an <code>eventTime</code> older than 100 days.
  /// </note>
  ///
  /// Parameter [terminationProtectionEnabled] :
  /// Indicates that termination protection is enabled and the event data store
  /// cannot be automatically deleted.
  Future<UpdateEventDataStoreResponse> updateEventDataStore({
    required String eventDataStore,
    List<AdvancedEventSelector>? advancedEventSelectors,
    BillingMode? billingMode,
    String? kmsKeyId,
    bool? multiRegionEnabled,
    String? name,
    bool? organizationEnabled,
    int? retentionPeriod,
    bool? terminationProtectionEnabled,
  }) async {
    _s.validateNumRange(
      'retentionPeriod',
      retentionPeriod,
      7,
      3653,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101.UpdateEventDataStore'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EventDataStore': eventDataStore,
        if (advancedEventSelectors != null)
          'AdvancedEventSelectors': advancedEventSelectors,
        if (billingMode != null) 'BillingMode': billingMode.toValue(),
        if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
        if (multiRegionEnabled != null)
          'MultiRegionEnabled': multiRegionEnabled,
        if (name != null) 'Name': name,
        if (organizationEnabled != null)
          'OrganizationEnabled': organizationEnabled,
        if (retentionPeriod != null) 'RetentionPeriod': retentionPeriod,
        if (terminationProtectionEnabled != null)
          'TerminationProtectionEnabled': terminationProtectionEnabled,
      },
    );

    return UpdateEventDataStoreResponse.fromJson(jsonResponse.body);
  }

  /// Updates trail settings that control what events you are logging, and how
  /// to handle log files. Changes to a trail do not require stopping the
  /// CloudTrail service. Use this action to designate an existing bucket for
  /// log delivery. If the existing bucket has previously been a target for
  /// CloudTrail log files, an IAM policy exists for the bucket.
  /// <code>UpdateTrail</code> must be called from the Region in which the trail
  /// was created; otherwise, an <code>InvalidHomeRegionException</code> is
  /// thrown.
  ///
  /// May throw [S3BucketDoesNotExistException].
  /// May throw [InsufficientS3BucketPolicyException].
  /// May throw [InsufficientSnsTopicPolicyException].
  /// May throw [InsufficientEncryptionPolicyException].
  /// May throw [TrailNotFoundException].
  /// May throw [InvalidS3BucketNameException].
  /// May throw [InvalidS3PrefixException].
  /// May throw [InvalidSnsTopicNameException].
  /// May throw [InvalidKmsKeyIdException].
  /// May throw [InvalidTrailNameException].
  /// May throw [TrailNotProvidedException].
  /// May throw [InvalidEventSelectorsException].
  /// May throw [CloudTrailARNInvalidException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InvalidParameterCombinationException].
  /// May throw [InvalidHomeRegionException].
  /// May throw [KmsKeyNotFoundException].
  /// May throw [KmsKeyDisabledException].
  /// May throw [KmsException].
  /// May throw [InvalidCloudWatchLogsLogGroupArnException].
  /// May throw [InvalidCloudWatchLogsRoleArnException].
  /// May throw [CloudWatchLogsDeliveryUnavailableException].
  /// May throw [UnsupportedOperationException].
  /// May throw [OperationNotPermittedException].
  /// May throw [CloudTrailAccessNotEnabledException].
  /// May throw [InsufficientDependencyServiceAccessPermissionException].
  /// May throw [OrganizationsNotInUseException].
  /// May throw [NotOrganizationMasterAccountException].
  /// May throw [OrganizationNotInAllFeaturesModeException].
  /// May throw [NoManagementAccountSLRExistsException].
  /// May throw [CloudTrailInvalidClientTokenIdException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [name] :
  /// Specifies the name of the trail or trail ARN. If <code>Name</code> is a
  /// trail name, the string must meet the following requirements:
  ///
  /// <ul>
  /// <li>
  /// Contain only ASCII letters (a-z, A-Z), numbers (0-9), periods (.),
  /// underscores (_), or dashes (-)
  /// </li>
  /// <li>
  /// Start with a letter or number, and end with a letter or number
  /// </li>
  /// <li>
  /// Be between 3 and 128 characters
  /// </li>
  /// <li>
  /// Have no adjacent periods, underscores or dashes. Names like
  /// <code>my-_namespace</code> and <code>my--namespace</code> are not valid.
  /// </li>
  /// <li>
  /// Not be in IP address format (for example, 192.168.5.4)
  /// </li>
  /// </ul>
  /// If <code>Name</code> is a trail ARN, it must be in the following format.
  ///
  /// <code>arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail</code>
  ///
  /// Parameter [cloudWatchLogsLogGroupArn] :
  /// Specifies a log group name using an Amazon Resource Name (ARN), a unique
  /// identifier that represents the log group to which CloudTrail logs are
  /// delivered. You must use a log group that exists in your account.
  ///
  /// Not required unless you specify <code>CloudWatchLogsRoleArn</code>.
  ///
  /// Parameter [cloudWatchLogsRoleArn] :
  /// Specifies the role for the CloudWatch Logs endpoint to assume to write to
  /// a user's log group. You must use a role that exists in your account.
  ///
  /// Parameter [enableLogFileValidation] :
  /// Specifies whether log file validation is enabled. The default is false.
  /// <note>
  /// When you disable log file integrity validation, the chain of digest files
  /// is broken after one hour. CloudTrail does not create digest files for log
  /// files that were delivered during a period in which log file integrity
  /// validation was disabled. For example, if you enable log file integrity
  /// validation at noon on January 1, disable it at noon on January 2, and
  /// re-enable it at noon on January 10, digest files will not be created for
  /// the log files delivered from noon on January 2 to noon on January 10. The
  /// same applies whenever you stop CloudTrail logging or delete a trail.
  /// </note>
  ///
  /// Parameter [includeGlobalServiceEvents] :
  /// Specifies whether the trail is publishing events from global services such
  /// as IAM to the log files.
  ///
  /// Parameter [isMultiRegionTrail] :
  /// Specifies whether the trail applies only to the current Region or to all
  /// Regions. The default is false. If the trail exists only in the current
  /// Region and this value is set to true, shadow trails (replications of the
  /// trail) will be created in the other Regions. If the trail exists in all
  /// Regions and this value is set to false, the trail will remain in the
  /// Region where it was created, and its shadow trails in other Regions will
  /// be deleted. As a best practice, consider using trails that log events in
  /// all Regions.
  ///
  /// Parameter [isOrganizationTrail] :
  /// Specifies whether the trail is applied to all accounts in an organization
  /// in Organizations, or only for the current Amazon Web Services account. The
  /// default is false, and cannot be true unless the call is made on behalf of
  /// an Amazon Web Services account that is the management account for an
  /// organization in Organizations. If the trail is not an organization trail
  /// and this is set to <code>true</code>, the trail will be created in all
  /// Amazon Web Services accounts that belong to the organization. If the trail
  /// is an organization trail and this is set to <code>false</code>, the trail
  /// will remain in the current Amazon Web Services account but be deleted from
  /// all member accounts in the organization.
  /// <note>
  /// Only the management account for the organization can convert an
  /// organization trail to a non-organization trail, or convert a
  /// non-organization trail to an organization trail.
  /// </note>
  ///
  /// Parameter [kmsKeyId] :
  /// Specifies the KMS key ID to use to encrypt the logs delivered by
  /// CloudTrail. The value can be an alias name prefixed by "alias/", a fully
  /// specified ARN to an alias, a fully specified ARN to a key, or a globally
  /// unique identifier.
  ///
  /// CloudTrail also supports KMS multi-Region keys. For more information about
  /// multi-Region keys, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html">Using
  /// multi-Region keys</a> in the <i>Key Management Service Developer
  /// Guide</i>.
  ///
  /// Examples:
  ///
  /// <ul>
  /// <li>
  /// alias/MyAliasName
  /// </li>
  /// <li>
  /// arn:aws:kms:us-east-2:123456789012:alias/MyAliasName
  /// </li>
  /// <li>
  /// arn:aws:kms:us-east-2:123456789012:key/12345678-1234-1234-1234-123456789012
  /// </li>
  /// <li>
  /// 12345678-1234-1234-1234-123456789012
  /// </li>
  /// </ul>
  ///
  /// Parameter [s3BucketName] :
  /// Specifies the name of the Amazon S3 bucket designated for publishing log
  /// files. See <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html">Amazon
  /// S3 Bucket naming rules</a>.
  ///
  /// Parameter [s3KeyPrefix] :
  /// Specifies the Amazon S3 key prefix that comes after the name of the bucket
  /// you have designated for log file delivery. For more information, see <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/get-and-view-cloudtrail-log-files.html#cloudtrail-find-log-files">Finding
  /// Your CloudTrail Log Files</a>. The maximum length is 200 characters.
  ///
  /// Parameter [snsTopicName] :
  /// Specifies the name of the Amazon SNS topic defined for notification of log
  /// file delivery. The maximum length is 256 characters.
  Future<UpdateTrailResponse> updateTrail({
    required String name,
    String? cloudWatchLogsLogGroupArn,
    String? cloudWatchLogsRoleArn,
    bool? enableLogFileValidation,
    bool? includeGlobalServiceEvents,
    bool? isMultiRegionTrail,
    bool? isOrganizationTrail,
    String? kmsKeyId,
    String? s3BucketName,
    String? s3KeyPrefix,
    String? snsTopicName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101.UpdateTrail'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        if (cloudWatchLogsLogGroupArn != null)
          'CloudWatchLogsLogGroupArn': cloudWatchLogsLogGroupArn,
        if (cloudWatchLogsRoleArn != null)
          'CloudWatchLogsRoleArn': cloudWatchLogsRoleArn,
        if (enableLogFileValidation != null)
          'EnableLogFileValidation': enableLogFileValidation,
        if (includeGlobalServiceEvents != null)
          'IncludeGlobalServiceEvents': includeGlobalServiceEvents,
        if (isMultiRegionTrail != null)
          'IsMultiRegionTrail': isMultiRegionTrail,
        if (isOrganizationTrail != null)
          'IsOrganizationTrail': isOrganizationTrail,
        if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
        if (s3BucketName != null) 'S3BucketName': s3BucketName,
        if (s3KeyPrefix != null) 'S3KeyPrefix': s3KeyPrefix,
        if (snsTopicName != null) 'SnsTopicName': snsTopicName,
      },
    );

    return UpdateTrailResponse.fromJson(jsonResponse.body);
  }
}

/// Returns the objects or data if successful. Otherwise, returns an error.
class AddTagsResponse {
  AddTagsResponse();

  factory AddTagsResponse.fromJson(Map<String, dynamic> _) {
    return AddTagsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Advanced event selectors let you create fine-grained selectors for
/// CloudTrail management and data events. They help you control costs by
/// logging only those events that are important to you. For more information
/// about advanced event selectors, see <a
/// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-management-events-with-cloudtrail.html">Logging
/// management events</a> and <a
/// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-data-events-with-cloudtrail.html">Logging
/// data events</a> in the <i>CloudTrail User Guide</i>.
///
/// You cannot apply both event selectors and advanced event selectors to a
/// trail.
///
/// <b>Supported CloudTrail event record fields for management events</b>
///
/// <ul>
/// <li>
/// <code>eventCategory</code> (required)
/// </li>
/// <li>
/// <code>eventSource</code>
/// </li>
/// <li>
/// <code>readOnly</code>
/// </li>
/// </ul>
/// <b>Supported CloudTrail event record fields for data events</b>
///
/// <ul>
/// <li>
/// <code>eventCategory</code> (required)
/// </li>
/// <li>
/// <code>resources.type</code> (required)
/// </li>
/// <li>
/// <code>readOnly</code>
/// </li>
/// <li>
/// <code>eventName</code>
/// </li>
/// <li>
/// <code>resources.ARN</code>
/// </li>
/// </ul> <note>
/// For event data stores for CloudTrail Insights events, Config configuration
/// items, Audit Manager evidence, or events outside of Amazon Web Services, the
/// only supported field is <code>eventCategory</code>.
/// </note>
class AdvancedEventSelector {
  /// Contains all selector statements in an advanced event selector.
  final List<AdvancedFieldSelector> fieldSelectors;

  /// An optional, descriptive name for an advanced event selector, such as "Log
  /// data events for only two S3 buckets".
  final String? name;

  AdvancedEventSelector({
    required this.fieldSelectors,
    this.name,
  });

  factory AdvancedEventSelector.fromJson(Map<String, dynamic> json) {
    return AdvancedEventSelector(
      fieldSelectors: (json['FieldSelectors'] as List)
          .whereNotNull()
          .map((e) => AdvancedFieldSelector.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fieldSelectors = this.fieldSelectors;
    final name = this.name;
    return {
      'FieldSelectors': fieldSelectors,
      if (name != null) 'Name': name,
    };
  }
}

/// A single selector statement in an advanced event selector.
class AdvancedFieldSelector {
  /// A field in a CloudTrail event record on which to filter events to be logged.
  /// For event data stores for CloudTrail Insights events, Config configuration
  /// items, Audit Manager evidence, or events outside of Amazon Web Services, the
  /// field is used only for selecting events as filtering is not supported.
  ///
  /// For CloudTrail management events, supported fields include
  /// <code>readOnly</code>, <code>eventCategory</code>, and
  /// <code>eventSource</code>.
  ///
  /// For CloudTrail data events, supported fields include <code>readOnly</code>,
  /// <code>eventCategory</code>, <code>eventName</code>,
  /// <code>resources.type</code>, and <code>resources.ARN</code>.
  ///
  /// For event data stores for CloudTrail Insights events, Config configuration
  /// items, Audit Manager evidence, or events outside of Amazon Web Services, the
  /// only supported field is <code>eventCategory</code>.
  ///
  /// <ul>
  /// <li>
  /// <b> <code>readOnly</code> </b> - Optional. Can be set to <code>Equals</code>
  /// a value of <code>true</code> or <code>false</code>. If you do not add this
  /// field, CloudTrail logs both <code>read</code> and <code>write</code> events.
  /// A value of <code>true</code> logs only <code>read</code> events. A value of
  /// <code>false</code> logs only <code>write</code> events.
  /// </li>
  /// <li>
  /// <b> <code>eventSource</code> </b> - For filtering management events only.
  /// This can be set to <code>NotEquals</code> <code>kms.amazonaws.com</code> or
  /// <code>NotEquals</code> <code>rdsdata.amazonaws.com</code>.
  /// </li>
  /// <li>
  /// <b> <code>eventName</code> </b> - Can use any operator. You can use it to
  /// ﬁlter in or ﬁlter out any data event logged to CloudTrail, such as
  /// <code>PutBucket</code> or <code>GetSnapshotBlock</code>. You can have
  /// multiple values for this ﬁeld, separated by commas.
  /// </li>
  /// <li>
  /// <b> <code>eventCategory</code> </b> - This is required and must be set to
  /// <code>Equals</code>.
  ///
  /// <ul>
  /// <li>
  /// For CloudTrail management events, the value must be <code>Management</code>.
  /// </li>
  /// <li>
  /// For CloudTrail data events, the value must be <code>Data</code>.
  /// </li>
  /// </ul>
  /// The following are used only for event data stores:
  ///
  /// <ul>
  /// <li>
  /// For CloudTrail Insights events, the value must be <code>Insight</code>.
  /// </li>
  /// <li>
  /// For Config configuration items, the value must be
  /// <code>ConfigurationItem</code>.
  /// </li>
  /// <li>
  /// For Audit Manager evidence, the value must be <code>Evidence</code>.
  /// </li>
  /// <li>
  /// For non-Amazon Web Services events, the value must be
  /// <code>ActivityAuditLog</code>.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>resources.type</code> </b> - This ﬁeld is required for CloudTrail
  /// data events. <code>resources.type</code> can only use the
  /// <code>Equals</code> operator, and the value can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>AWS::DynamoDB::Table</code>
  /// </li>
  /// <li>
  /// <code>AWS::Lambda::Function</code>
  /// </li>
  /// <li>
  /// <code>AWS::S3::Object</code>
  /// </li>
  /// <li>
  /// <code>AWS::AppConfig::Configuration</code>
  /// </li>
  /// <li>
  /// <code>AWS::B2BI::Transformer</code>
  /// </li>
  /// <li>
  /// <code>AWS::Bedrock::AgentAlias</code>
  /// </li>
  /// <li>
  /// <code>AWS::Bedrock::KnowledgeBase</code>
  /// </li>
  /// <li>
  /// <code>AWS::Cassandra::Table</code>
  /// </li>
  /// <li>
  /// <code>AWS::CloudFront::KeyValueStore</code>
  /// </li>
  /// <li>
  /// <code>AWS::CloudTrail::Channel</code>
  /// </li>
  /// <li>
  /// <code>AWS::CodeWhisperer::Customization</code>
  /// </li>
  /// <li>
  /// <code>AWS::CodeWhisperer::Profile</code>
  /// </li>
  /// <li>
  /// <code>AWS::Cognito::IdentityPool</code>
  /// </li>
  /// <li>
  /// <code>AWS::DynamoDB::Stream</code>
  /// </li>
  /// <li>
  /// <code>AWS::EC2::Snapshot</code>
  /// </li>
  /// <li>
  /// <code>AWS::EMRWAL::Workspace</code>
  /// </li>
  /// <li>
  /// <code>AWS::FinSpace::Environment</code>
  /// </li>
  /// <li>
  /// <code>AWS::Glue::Table</code>
  /// </li>
  /// <li>
  /// <code>AWS::GreengrassV2::ComponentVersion</code>
  /// </li>
  /// <li>
  /// <code>AWS::GreengrassV2::Deployment</code>
  /// </li>
  /// <li>
  /// <code>AWS::GuardDuty::Detector</code>
  /// </li>
  /// <li>
  /// <code>AWS::IoT::Certificate</code>
  /// </li>
  /// <li>
  /// <code>AWS::IoT::Thing</code>
  /// </li>
  /// <li>
  /// <code>AWS::IoTSiteWise::Asset</code>
  /// </li>
  /// <li>
  /// <code>AWS::IoTSiteWise::TimeSeries</code>
  /// </li>
  /// <li>
  /// <code>AWS::IoTTwinMaker::Entity</code>
  /// </li>
  /// <li>
  /// <code>AWS::IoTTwinMaker::Workspace</code>
  /// </li>
  /// <li>
  /// <code>AWS::KendraRanking::ExecutionPlan</code>
  /// </li>
  /// <li>
  /// <code>AWS::KinesisVideo::Stream</code>
  /// </li>
  /// <li>
  /// <code>AWS::ManagedBlockchain::Network</code>
  /// </li>
  /// <li>
  /// <code>AWS::ManagedBlockchain::Node</code>
  /// </li>
  /// <li>
  /// <code>AWS::MedicalImaging::Datastore</code>
  /// </li>
  /// <li>
  /// <code>AWS::NeptuneGraph::Graph</code>
  /// </li>
  /// <li>
  /// <code>AWS::PCAConnectorAD::Connector</code>
  /// </li>
  /// <li>
  /// <code>AWS::QApps:QApp</code>
  /// </li>
  /// <li>
  /// <code>AWS::QBusiness::Application</code>
  /// </li>
  /// <li>
  /// <code>AWS::QBusiness::DataSource</code>
  /// </li>
  /// <li>
  /// <code>AWS::QBusiness::Index</code>
  /// </li>
  /// <li>
  /// <code>AWS::QBusiness::WebExperience</code>
  /// </li>
  /// <li>
  /// <code>AWS::RDS::DBCluster</code>
  /// </li>
  /// <li>
  /// <code>AWS::S3::AccessPoint</code>
  /// </li>
  /// <li>
  /// <code>AWS::S3ObjectLambda::AccessPoint</code>
  /// </li>
  /// <li>
  /// <code>AWS::S3Outposts::Object</code>
  /// </li>
  /// <li>
  /// <code>AWS::SageMaker::Endpoint</code>
  /// </li>
  /// <li>
  /// <code>AWS::SageMaker::ExperimentTrialComponent</code>
  /// </li>
  /// <li>
  /// <code>AWS::SageMaker::FeatureGroup</code>
  /// </li>
  /// <li>
  /// <code>AWS::ServiceDiscovery::Namespace </code>
  /// </li>
  /// <li>
  /// <code>AWS::ServiceDiscovery::Service</code>
  /// </li>
  /// <li>
  /// <code>AWS::SCN::Instance</code>
  /// </li>
  /// <li>
  /// <code>AWS::SNS::PlatformEndpoint</code>
  /// </li>
  /// <li>
  /// <code>AWS::SNS::Topic</code>
  /// </li>
  /// <li>
  /// <code>AWS::SQS::Queue</code>
  /// </li>
  /// <li>
  /// <code>AWS::SSM::ManagedNode</code>
  /// </li>
  /// <li>
  /// <code>AWS::SSMMessages::ControlChannel</code>
  /// </li>
  /// <li>
  /// <code>AWS::SWF::Domain</code>
  /// </li>
  /// <li>
  /// <code>AWS::ThinClient::Device</code>
  /// </li>
  /// <li>
  /// <code>AWS::ThinClient::Environment</code>
  /// </li>
  /// <li>
  /// <code>AWS::Timestream::Database</code>
  /// </li>
  /// <li>
  /// <code>AWS::Timestream::Table</code>
  /// </li>
  /// <li>
  /// <code>AWS::VerifiedPermissions::PolicyStore</code>
  /// </li>
  /// <li>
  /// <code>AWS::XRay::Trace</code>
  /// </li>
  /// </ul>
  /// You can have only one <code>resources.type</code> ﬁeld per selector. To log
  /// data events on more than one resource type, add another selector.
  /// </li>
  /// <li>
  /// <b> <code>resources.ARN</code> </b> - You can use any operator with
  /// <code>resources.ARN</code>, but if you use <code>Equals</code> or
  /// <code>NotEquals</code>, the value must exactly match the ARN of a valid
  /// resource of the type you've speciﬁed in the template as the value of
  /// resources.type.
  /// <note>
  /// You can't use the <code>resources.ARN</code> field to filter resource types
  /// that do not have ARNs.
  /// </note>
  /// The <code>resources.ARN</code> field can be set one of the following.
  ///
  /// If resources.type equals <code>AWS::S3::Object</code>, the ARN must be in
  /// one of the following formats. To log all data events for all objects in a
  /// specific S3 bucket, use the <code>StartsWith</code> operator, and include
  /// only the bucket ARN as the matching value.
  ///
  /// The trailing slash is intentional; do not exclude it. Replace the text
  /// between less than and greater than symbols (&lt;&gt;) with resource-specific
  /// information.
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:s3:::&lt;bucket_name&gt;/</code>
  /// </li>
  /// <li>
  /// <code>arn:&lt;partition&gt;:s3:::&lt;bucket_name&gt;/&lt;object_path&gt;/</code>
  /// </li>
  /// </ul>
  /// When resources.type equals <code>AWS::DynamoDB::Table</code>, and the
  /// operator is set to <code>Equals</code> or <code>NotEquals</code>, the ARN
  /// must be in the following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:dynamodb:&lt;region&gt;:&lt;account_ID&gt;:table/&lt;table_name&gt;</code>
  /// </li>
  /// </ul>
  /// When resources.type equals <code>AWS::Lambda::Function</code>, and the
  /// operator is set to <code>Equals</code> or <code>NotEquals</code>, the ARN
  /// must be in the following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:lambda:&lt;region&gt;:&lt;account_ID&gt;:function:&lt;function_name&gt;</code>
  /// </li>
  /// </ul>
  /// When resources.type equals <code>AWS::AppConfig::Configuration</code>, and
  /// the operator is set to <code>Equals</code> or <code>NotEquals</code>, the
  /// ARN must be in the following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:appconfig:&lt;region&gt;:&lt;account_ID&gt;:application/&lt;application_ID&gt;/environment/&lt;environment_ID&gt;/configuration/&lt;configuration_profile_ID&gt;</code>
  /// </li>
  /// </ul>
  /// When resources.type equals <code>AWS::B2BI::Transformer</code>, and the
  /// operator is set to <code>Equals</code> or <code>NotEquals</code>, the ARN
  /// must be in the following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:b2bi:&lt;region&gt;:&lt;account_ID&gt;:transformer/&lt;transformer_ID&gt;</code>
  /// </li>
  /// </ul>
  /// When resources.type equals <code>AWS::Bedrock::AgentAlias</code>, and the
  /// operator is set to <code>Equals</code> or <code>NotEquals</code>, the ARN
  /// must be in the following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:bedrock:&lt;region&gt;:&lt;account_ID&gt;:agent-alias/&lt;agent_ID&gt;/&lt;alias_ID&gt;</code>
  /// </li>
  /// </ul>
  /// When resources.type equals <code>AWS::Bedrock::KnowledgeBase</code>, and the
  /// operator is set to <code>Equals</code> or <code>NotEquals</code>, the ARN
  /// must be in the following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:bedrock:&lt;region&gt;:&lt;account_ID&gt;:knowledge-base/&lt;knowledge_base_ID&gt;</code>
  /// </li>
  /// </ul>
  /// When resources.type equals <code>AWS::Cassandra::Table</code>, and the
  /// operator is set to <code>Equals</code> or <code>NotEquals</code>, the ARN
  /// must be in the following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:cassandra:&lt;region&gt;:&lt;account_ID&gt;:/keyspace/&lt;keyspace_name&gt;/table/&lt;table_name&gt;</code>
  /// </li>
  /// </ul>
  /// When resources.type equals <code>AWS::CloudFront::KeyValueStore</code>, and
  /// the operator is set to <code>Equals</code> or <code>NotEquals</code>, the
  /// ARN must be in the following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:cloudfront:&lt;region&gt;:&lt;account_ID&gt;:key-value-store/&lt;KVS_name&gt;</code>
  /// </li>
  /// </ul>
  /// When resources.type equals <code>AWS::CloudTrail::Channel</code>, and the
  /// operator is set to <code>Equals</code> or <code>NotEquals</code>, the ARN
  /// must be in the following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:cloudtrail:&lt;region&gt;:&lt;account_ID&gt;:channel/&lt;channel_UUID&gt;</code>
  /// </li>
  /// </ul>
  /// When resources.type equals <code>AWS::CodeWhisperer::Customization</code>,
  /// and the operator is set to <code>Equals</code> or <code>NotEquals</code>,
  /// the ARN must be in the following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:codewhisperer:&lt;region&gt;:&lt;account_ID&gt;:customization/&lt;customization_ID&gt;</code>
  /// </li>
  /// </ul>
  /// When resources.type equals <code>AWS::CodeWhisperer::Profile</code>, and the
  /// operator is set to <code>Equals</code> or <code>NotEquals</code>, the ARN
  /// must be in the following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:codewhisperer:&lt;region&gt;:&lt;account_ID&gt;:profile/&lt;profile_ID&gt;</code>
  /// </li>
  /// </ul>
  /// When resources.type equals <code>AWS::Cognito::IdentityPool</code>, and the
  /// operator is set to <code>Equals</code> or <code>NotEquals</code>, the ARN
  /// must be in the following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:cognito-identity:&lt;region&gt;:&lt;account_ID&gt;:identitypool/&lt;identity_pool_ID&gt;</code>
  /// </li>
  /// </ul>
  /// When <code>resources.type</code> equals <code>AWS::DynamoDB::Stream</code>,
  /// and the operator is set to <code>Equals</code> or <code>NotEquals</code>,
  /// the ARN must be in the following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:dynamodb:&lt;region&gt;:&lt;account_ID&gt;:table/&lt;table_name&gt;/stream/&lt;date_time&gt;</code>
  /// </li>
  /// </ul>
  /// When <code>resources.type</code> equals <code>AWS::EC2::Snapshot</code>, and
  /// the operator is set to <code>Equals</code> or <code>NotEquals</code>, the
  /// ARN must be in the following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:ec2:&lt;region&gt;::snapshot/&lt;snapshot_ID&gt;</code>
  /// </li>
  /// </ul>
  /// When <code>resources.type</code> equals <code>AWS::EMRWAL::Workspace</code>,
  /// and the operator is set to <code>Equals</code> or <code>NotEquals</code>,
  /// the ARN must be in the following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:emrwal:&lt;region&gt;:&lt;account_ID&gt;:workspace/&lt;workspace_name&gt;</code>
  /// </li>
  /// </ul>
  /// When <code>resources.type</code> equals
  /// <code>AWS::FinSpace::Environment</code>, and the operator is set to
  /// <code>Equals</code> or <code>NotEquals</code>, the ARN must be in the
  /// following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:finspace:&lt;region&gt;:&lt;account_ID&gt;:environment/&lt;environment_ID&gt;</code>
  /// </li>
  /// </ul>
  /// When <code>resources.type</code> equals <code>AWS::Glue::Table</code>, and
  /// the operator is set to <code>Equals</code> or <code>NotEquals</code>, the
  /// ARN must be in the following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:glue:&lt;region&gt;:&lt;account_ID&gt;:table/&lt;database_name&gt;/&lt;table_name&gt;</code>
  /// </li>
  /// </ul>
  /// When <code>resources.type</code> equals
  /// <code>AWS::GreengrassV2::ComponentVersion</code>, and the operator is set to
  /// <code>Equals</code> or <code>NotEquals</code>, the ARN must be in the
  /// following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:greengrass:&lt;region&gt;:&lt;account_ID&gt;:components/&lt;component_name&gt;</code>
  /// </li>
  /// </ul>
  /// When <code>resources.type</code> equals
  /// <code>AWS::GreengrassV2::Deployment</code>, and the operator is set to
  /// <code>Equals</code> or <code>NotEquals</code>, the ARN must be in the
  /// following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:greengrass:&lt;region&gt;:&lt;account_ID&gt;:deployments/&lt;deployment_ID</code>
  /// </li>
  /// </ul>
  /// When <code>resources.type</code> equals
  /// <code>AWS::GuardDuty::Detector</code>, and the operator is set to
  /// <code>Equals</code> or <code>NotEquals</code>, the ARN must be in the
  /// following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:guardduty:&lt;region&gt;:&lt;account_ID&gt;:detector/&lt;detector_ID&gt;</code>
  /// </li>
  /// </ul>
  /// When <code>resources.type</code> equals <code>AWS::IoT::Certificate</code>,
  /// and the operator is set to <code>Equals</code> or <code>NotEquals</code>,
  /// the ARN must be in the following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:iot:&lt;region&gt;:&lt;account_ID&gt;:cert/&lt;certificate_ID&gt;</code>
  /// </li>
  /// </ul>
  /// When <code>resources.type</code> equals <code>AWS::IoT::Thing</code>, and
  /// the operator is set to <code>Equals</code> or <code>NotEquals</code>, the
  /// ARN must be in the following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:iot:&lt;region&gt;:&lt;account_ID&gt;:thing/&lt;thing_ID&gt;</code>
  /// </li>
  /// </ul>
  /// When <code>resources.type</code> equals
  /// <code>AWS::IoTSiteWise::Asset</code>, and the operator is set to
  /// <code>Equals</code> or <code>NotEquals</code>, the ARN must be in the
  /// following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:iotsitewise:&lt;region&gt;:&lt;account_ID&gt;:asset/&lt;asset_ID&gt;</code>
  /// </li>
  /// </ul>
  /// When <code>resources.type</code> equals
  /// <code>AWS::IoTSiteWise::TimeSeries</code>, and the operator is set to
  /// <code>Equals</code> or <code>NotEquals</code>, the ARN must be in the
  /// following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:iotsitewise:&lt;region&gt;:&lt;account_ID&gt;:timeseries/&lt;timeseries_ID&gt;</code>
  /// </li>
  /// </ul>
  /// When <code>resources.type</code> equals
  /// <code>AWS::IoTTwinMaker::Entity</code>, and the operator is set to
  /// <code>Equals</code> or <code>NotEquals</code>, the ARN must be in the
  /// following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:iottwinmaker:&lt;region&gt;:&lt;account_ID&gt;:workspace/&lt;workspace_ID&gt;/entity/&lt;entity_ID&gt;</code>
  /// </li>
  /// </ul>
  /// When <code>resources.type</code> equals
  /// <code>AWS::IoTTwinMaker::Workspace</code>, and the operator is set to
  /// <code>Equals</code> or <code>NotEquals</code>, the ARN must be in the
  /// following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:iottwinmaker:&lt;region&gt;:&lt;account_ID&gt;:workspace/&lt;workspace_ID&gt;</code>
  /// </li>
  /// </ul>
  /// When <code>resources.type</code> equals
  /// <code>AWS::KendraRanking::ExecutionPlan</code>, and the operator is set to
  /// <code>Equals</code> or <code>NotEquals</code>, the ARN must be in the
  /// following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:kendra-ranking:&lt;region&gt;:&lt;account_ID&gt;:rescore-execution-plan/&lt;rescore_execution_plan_ID&gt;</code>
  /// </li>
  /// </ul>
  /// When <code>resources.type</code> equals
  /// <code>AWS::KinesisVideo::Stream</code>, and the operator is set to
  /// <code>Equals</code> or <code>NotEquals</code>, the ARN must be in the
  /// following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:kinesisvideo:&lt;region&gt;:&lt;account_ID&gt;:stream/&lt;stream_name&gt;/&lt;creation_time&gt;</code>
  /// </li>
  /// </ul>
  /// When <code>resources.type</code> equals
  /// <code>AWS::ManagedBlockchain::Network</code>, and the operator is set to
  /// <code>Equals</code> or <code>NotEquals</code>, the ARN must be in the
  /// following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:managedblockchain:::networks/&lt;network_name&gt;</code>
  /// </li>
  /// </ul>
  /// When <code>resources.type</code> equals
  /// <code>AWS::ManagedBlockchain::Node</code>, and the operator is set to
  /// <code>Equals</code> or <code>NotEquals</code>, the ARN must be in the
  /// following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:managedblockchain:&lt;region&gt;:&lt;account_ID&gt;:nodes/&lt;node_ID&gt;</code>
  /// </li>
  /// </ul>
  /// When <code>resources.type</code> equals
  /// <code>AWS::MedicalImaging::Datastore</code>, and the operator is set to
  /// <code>Equals</code> or <code>NotEquals</code>, the ARN must be in the
  /// following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:medical-imaging:&lt;region&gt;:&lt;account_ID&gt;:datastore/&lt;data_store_ID&gt;</code>
  /// </li>
  /// </ul>
  /// When <code>resources.type</code> equals
  /// <code>AWS::NeptuneGraph::Graph</code>, and the operator is set to
  /// <code>Equals</code> or <code>NotEquals</code>, the ARN must be in the
  /// following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:neptune-graph:&lt;region&gt;:&lt;account_ID&gt;:graph/&lt;graph_ID&gt;</code>
  /// </li>
  /// </ul>
  /// When <code>resources.type</code> equals
  /// <code>AWS::PCAConnectorAD::Connector</code>, and the operator is set to
  /// <code>Equals</code> or <code>NotEquals</code>, the ARN must be in the
  /// following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:pca-connector-ad:&lt;region&gt;:&lt;account_ID&gt;:connector/&lt;connector_ID&gt;</code>
  /// </li>
  /// </ul>
  /// When <code>resources.type</code> equals <code>AWS::QApps:QApp</code>, and
  /// the operator is set to <code>Equals</code> or <code>NotEquals</code>, the
  /// ARN must be in the following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:qapps:&lt;region&gt;:&lt;account_ID&gt;:application/&lt;application_UUID&gt;/qapp/&lt;qapp_UUID&gt;</code>
  /// </li>
  /// </ul>
  /// When <code>resources.type</code> equals
  /// <code>AWS::QBusiness::Application</code>, and the operator is set to
  /// <code>Equals</code> or <code>NotEquals</code>, the ARN must be in the
  /// following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:qbusiness:&lt;region&gt;:&lt;account_ID&gt;:application/&lt;application_ID&gt;</code>
  /// </li>
  /// </ul>
  /// When <code>resources.type</code> equals
  /// <code>AWS::QBusiness::DataSource</code>, and the operator is set to
  /// <code>Equals</code> or <code>NotEquals</code>, the ARN must be in the
  /// following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:qbusiness:&lt;region&gt;:&lt;account_ID&gt;:application/&lt;application_ID&gt;/index/&lt;index_ID&gt;/data-source/&lt;datasource_ID&gt;</code>
  /// </li>
  /// </ul>
  /// When <code>resources.type</code> equals <code>AWS::QBusiness::Index</code>,
  /// and the operator is set to <code>Equals</code> or <code>NotEquals</code>,
  /// the ARN must be in the following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:qbusiness:&lt;region&gt;:&lt;account_ID&gt;:application/&lt;application_ID&gt;/index/&lt;index_ID&gt;</code>
  /// </li>
  /// </ul>
  /// When <code>resources.type</code> equals
  /// <code>AWS::QBusiness::WebExperience</code>, and the operator is set to
  /// <code>Equals</code> or <code>NotEquals</code>, the ARN must be in the
  /// following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:qbusiness:&lt;region&gt;:&lt;account_ID&gt;:application/&lt;application_ID&gt;/web-experience/&lt;web_experience_ID&gt;</code>
  /// </li>
  /// </ul>
  /// When <code>resources.type</code> equals <code>AWS::RDS::DBCluster</code>,
  /// and the operator is set to <code>Equals</code> or <code>NotEquals</code>,
  /// the ARN must be in the following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:rds:&lt;region&gt;:&lt;account_ID&gt;:cluster/&lt;cluster_name&gt;</code>
  /// </li>
  /// </ul>
  /// When <code>resources.type</code> equals <code>AWS::S3::AccessPoint</code>,
  /// and the operator is set to <code>Equals</code> or <code>NotEquals</code>,
  /// the ARN must be in one of the following formats. To log events on all
  /// objects in an S3 access point, we recommend that you use only the access
  /// point ARN, don’t include the object path, and use the
  /// <code>StartsWith</code> or <code>NotStartsWith</code> operators.
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:s3:&lt;region&gt;:&lt;account_ID&gt;:accesspoint/&lt;access_point_name&gt;</code>
  /// </li>
  /// <li>
  /// <code>arn:&lt;partition&gt;:s3:&lt;region&gt;:&lt;account_ID&gt;:accesspoint/&lt;access_point_name&gt;/object/&lt;object_path&gt;</code>
  /// </li>
  /// </ul>
  /// When <code>resources.type</code> equals
  /// <code>AWS::S3ObjectLambda::AccessPoint</code>, and the operator is set to
  /// <code>Equals</code> or <code>NotEquals</code>, the ARN must be in the
  /// following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:s3-object-lambda:&lt;region&gt;:&lt;account_ID&gt;:accesspoint/&lt;access_point_name&gt;</code>
  /// </li>
  /// </ul>
  /// When <code>resources.type</code> equals
  /// <code>AWS::S3Outposts::Object</code>, and the operator is set to
  /// <code>Equals</code> or <code>NotEquals</code>, the ARN must be in the
  /// following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:s3-outposts:&lt;region&gt;:&lt;account_ID&gt;:&lt;object_path&gt;</code>
  /// </li>
  /// </ul>
  /// When <code>resources.type</code> equals
  /// <code>AWS::SageMaker::Endpoint</code>, and the operator is set to
  /// <code>Equals</code> or <code>NotEquals</code>, the ARN must be in the
  /// following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:sagemaker:&lt;region&gt;:&lt;account_ID&gt;:endpoint/&lt;endpoint_name&gt;</code>
  /// </li>
  /// </ul>
  /// When <code>resources.type</code> equals
  /// <code>AWS::SageMaker::ExperimentTrialComponent</code>, and the operator is
  /// set to <code>Equals</code> or <code>NotEquals</code>, the ARN must be in the
  /// following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:sagemaker:&lt;region&gt;:&lt;account_ID&gt;:experiment-trial-component/&lt;experiment_trial_component_name&gt;</code>
  /// </li>
  /// </ul>
  /// When <code>resources.type</code> equals
  /// <code>AWS::SageMaker::FeatureGroup</code>, and the operator is set to
  /// <code>Equals</code> or <code>NotEquals</code>, the ARN must be in the
  /// following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:sagemaker:&lt;region&gt;:&lt;account_ID&gt;:feature-group/&lt;feature_group_name&gt;</code>
  /// </li>
  /// </ul>
  /// When <code>resources.type</code> equals <code>AWS::SCN::Instance</code>, and
  /// the operator is set to <code>Equals</code> or <code>NotEquals</code>, the
  /// ARN must be in the following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:scn:&lt;region&gt;:&lt;account_ID&gt;:instance/&lt;instance_ID&gt;</code>
  /// </li>
  /// </ul>
  /// When <code>resources.type</code> equals
  /// <code>AWS::ServiceDiscovery::Namespace</code>, and the operator is set to
  /// <code>Equals</code> or <code>NotEquals</code>, the ARN must be in the
  /// following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:servicediscovery:&lt;region&gt;:&lt;account_ID&gt;:namespace/&lt;namespace_ID&gt;</code>
  /// </li>
  /// </ul>
  /// When <code>resources.type</code> equals
  /// <code>AWS::ServiceDiscovery::Service</code>, and the operator is set to
  /// <code>Equals</code> or <code>NotEquals</code>, the ARN must be in the
  /// following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:servicediscovery:&lt;region&gt;:&lt;account_ID&gt;:service/&lt;service_ID&gt;</code>
  /// </li>
  /// </ul>
  /// When <code>resources.type</code> equals
  /// <code>AWS::SNS::PlatformEndpoint</code>, and the operator is set to
  /// <code>Equals</code> or <code>NotEquals</code>, the ARN must be in the
  /// following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:sns:&lt;region&gt;:&lt;account_ID&gt;:endpoint/&lt;endpoint_type&gt;/&lt;endpoint_name&gt;/&lt;endpoint_ID&gt;</code>
  /// </li>
  /// </ul>
  /// When <code>resources.type</code> equals <code>AWS::SNS::Topic</code>, and
  /// the operator is set to <code>Equals</code> or <code>NotEquals</code>, the
  /// ARN must be in the following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:sns:&lt;region&gt;:&lt;account_ID&gt;:&lt;topic_name&gt;</code>
  /// </li>
  /// </ul>
  /// When <code>resources.type</code> equals <code>AWS::SQS::Queue</code>, and
  /// the operator is set to <code>Equals</code> or <code>NotEquals</code>, the
  /// ARN must be in the following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:sqs:&lt;region&gt;:&lt;account_ID&gt;:&lt;queue_name&gt;</code>
  /// </li>
  /// </ul>
  /// When <code>resources.type</code> equals <code>AWS::SSM::ManagedNode</code>,
  /// and the operator is set to <code>Equals</code> or <code>NotEquals</code>,
  /// the ARN must be in one of the following formats:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:ssm:&lt;region&gt;:&lt;account_ID&gt;:managed-instance/&lt;instance_ID&gt;</code>
  /// </li>
  /// <li>
  /// <code>arn:&lt;partition&gt;:ec2:&lt;region&gt;:&lt;account_ID&gt;:instance/&lt;instance_ID&gt;</code>
  /// </li>
  /// </ul>
  /// When <code>resources.type</code> equals
  /// <code>AWS::SSMMessages::ControlChannel</code>, and the operator is set to
  /// <code>Equals</code> or <code>NotEquals</code>, the ARN must be in the
  /// following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:ssmmessages:&lt;region&gt;:&lt;account_ID&gt;:control-channel/&lt;channel_ID&gt;</code>
  /// </li>
  /// </ul>
  /// When <code>resources.type</code> equals <code>AWS::SWF::Domain</code>, and
  /// the operator is set to <code>Equals</code> or <code>NotEquals</code>, the
  /// ARN must be in the following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:swf:&lt;region&gt;:&lt;account_ID&gt;:domain/&lt;domain_name&gt;</code>
  /// </li>
  /// </ul>
  /// When <code>resources.type</code> equals
  /// <code>AWS::ThinClient::Device</code>, and the operator is set to
  /// <code>Equals</code> or <code>NotEquals</code>, the ARN must be in the
  /// following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:thinclient:&lt;region&gt;:&lt;account_ID&gt;:device/&lt;device_ID&gt;</code>
  /// </li>
  /// </ul>
  /// When <code>resources.type</code> equals
  /// <code>AWS::ThinClient::Environment</code>, and the operator is set to
  /// <code>Equals</code> or <code>NotEquals</code>, the ARN must be in the
  /// following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:thinclient:&lt;region&gt;:&lt;account_ID&gt;:environment/&lt;environment_ID&gt;</code>
  /// </li>
  /// </ul>
  /// When <code>resources.type</code> equals
  /// <code>AWS::Timestream::Database</code>, and the operator is set to
  /// <code>Equals</code> or <code>NotEquals</code>, the ARN must be in the
  /// following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:timestream:&lt;region&gt;:&lt;account_ID&gt;:database/&lt;database_name&gt;</code>
  /// </li>
  /// </ul>
  /// When <code>resources.type</code> equals <code>AWS::Timestream::Table</code>,
  /// and the operator is set to <code>Equals</code> or <code>NotEquals</code>,
  /// the ARN must be in the following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:timestream:&lt;region&gt;:&lt;account_ID&gt;:database/&lt;database_name&gt;/table/&lt;table_name&gt;</code>
  /// </li>
  /// </ul>
  /// When resources.type equals
  /// <code>AWS::VerifiedPermissions::PolicyStore</code>, and the operator is set
  /// to <code>Equals</code> or <code>NotEquals</code>, the ARN must be in the
  /// following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:&lt;partition&gt;:verifiedpermissions:&lt;region&gt;:&lt;account_ID&gt;:policy-store/&lt;policy_store_UUID&gt;</code>
  /// </li>
  /// </ul> </li>
  /// </ul>
  final String field;

  /// An operator that includes events that match the last few characters of the
  /// event record field specified as the value of <code>Field</code>.
  final List<String>? endsWith;

  /// An operator that includes events that match the exact value of the event
  /// record field specified as the value of <code>Field</code>. This is the only
  /// valid operator that you can use with the <code>readOnly</code>,
  /// <code>eventCategory</code>, and <code>resources.type</code> fields.
  final List<String>? equals;

  /// An operator that excludes events that match the last few characters of the
  /// event record field specified as the value of <code>Field</code>.
  final List<String>? notEndsWith;

  /// An operator that excludes events that match the exact value of the event
  /// record field specified as the value of <code>Field</code>.
  final List<String>? notEquals;

  /// An operator that excludes events that match the first few characters of the
  /// event record field specified as the value of <code>Field</code>.
  final List<String>? notStartsWith;

  /// An operator that includes events that match the first few characters of the
  /// event record field specified as the value of <code>Field</code>.
  final List<String>? startsWith;

  AdvancedFieldSelector({
    required this.field,
    this.endsWith,
    this.equals,
    this.notEndsWith,
    this.notEquals,
    this.notStartsWith,
    this.startsWith,
  });

  factory AdvancedFieldSelector.fromJson(Map<String, dynamic> json) {
    return AdvancedFieldSelector(
      field: json['Field'] as String,
      endsWith: (json['EndsWith'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      equals: (json['Equals'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      notEndsWith: (json['NotEndsWith'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      notEquals: (json['NotEquals'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      notStartsWith: (json['NotStartsWith'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      startsWith: (json['StartsWith'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final field = this.field;
    final endsWith = this.endsWith;
    final equals = this.equals;
    final notEndsWith = this.notEndsWith;
    final notEquals = this.notEquals;
    final notStartsWith = this.notStartsWith;
    final startsWith = this.startsWith;
    return {
      'Field': field,
      if (endsWith != null) 'EndsWith': endsWith,
      if (equals != null) 'Equals': equals,
      if (notEndsWith != null) 'NotEndsWith': notEndsWith,
      if (notEquals != null) 'NotEquals': notEquals,
      if (notStartsWith != null) 'NotStartsWith': notStartsWith,
      if (startsWith != null) 'StartsWith': startsWith,
    };
  }
}

enum BillingMode {
  extendableRetentionPricing,
  fixedRetentionPricing,
}

extension BillingModeValueExtension on BillingMode {
  String toValue() {
    switch (this) {
      case BillingMode.extendableRetentionPricing:
        return 'EXTENDABLE_RETENTION_PRICING';
      case BillingMode.fixedRetentionPricing:
        return 'FIXED_RETENTION_PRICING';
    }
  }
}

extension BillingModeFromString on String {
  BillingMode toBillingMode() {
    switch (this) {
      case 'EXTENDABLE_RETENTION_PRICING':
        return BillingMode.extendableRetentionPricing;
      case 'FIXED_RETENTION_PRICING':
        return BillingMode.fixedRetentionPricing;
    }
    throw Exception('$this is not known in enum BillingMode');
  }
}

class CancelQueryResponse {
  /// The ID of the canceled query.
  final String queryId;

  /// Shows the status of a query after a <code>CancelQuery</code> request.
  /// Typically, the values shown are either <code>RUNNING</code> or
  /// <code>CANCELLED</code>.
  final QueryStatus queryStatus;

  CancelQueryResponse({
    required this.queryId,
    required this.queryStatus,
  });

  factory CancelQueryResponse.fromJson(Map<String, dynamic> json) {
    return CancelQueryResponse(
      queryId: json['QueryId'] as String,
      queryStatus: (json['QueryStatus'] as String).toQueryStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final queryId = this.queryId;
    final queryStatus = this.queryStatus;
    return {
      'QueryId': queryId,
      'QueryStatus': queryStatus.toValue(),
    };
  }
}

/// Contains information about a returned CloudTrail channel.
class Channel {
  /// The Amazon Resource Name (ARN) of a channel.
  final String? channelArn;

  /// The name of the CloudTrail channel. For service-linked channels, the name is
  /// <code>aws-service-channel/service-name/custom-suffix</code> where
  /// <code>service-name</code> represents the name of the Amazon Web Services
  /// service that created the channel and <code>custom-suffix</code> represents
  /// the suffix created by the Amazon Web Services service.
  final String? name;

  Channel({
    this.channelArn,
    this.name,
  });

  factory Channel.fromJson(Map<String, dynamic> json) {
    return Channel(
      channelArn: json['ChannelArn'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelArn = this.channelArn;
    final name = this.name;
    return {
      if (channelArn != null) 'ChannelArn': channelArn,
      if (name != null) 'Name': name,
    };
  }
}

class CreateChannelResponse {
  /// The Amazon Resource Name (ARN) of the new channel.
  final String? channelArn;

  /// The event data stores that log the events arriving through the channel.
  final List<Destination>? destinations;

  /// The name of the new channel.
  final String? name;

  /// The partner or external event source name.
  final String? source;
  final List<Tag>? tags;

  CreateChannelResponse({
    this.channelArn,
    this.destinations,
    this.name,
    this.source,
    this.tags,
  });

  factory CreateChannelResponse.fromJson(Map<String, dynamic> json) {
    return CreateChannelResponse(
      channelArn: json['ChannelArn'] as String?,
      destinations: (json['Destinations'] as List?)
          ?.whereNotNull()
          .map((e) => Destination.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['Name'] as String?,
      source: json['Source'] as String?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final channelArn = this.channelArn;
    final destinations = this.destinations;
    final name = this.name;
    final source = this.source;
    final tags = this.tags;
    return {
      if (channelArn != null) 'ChannelArn': channelArn,
      if (destinations != null) 'Destinations': destinations,
      if (name != null) 'Name': name,
      if (source != null) 'Source': source,
      if (tags != null) 'Tags': tags,
    };
  }
}

class CreateEventDataStoreResponse {
  /// The advanced event selectors that were used to select the events for the
  /// data store.
  final List<AdvancedEventSelector>? advancedEventSelectors;

  /// The billing mode for the event data store.
  final BillingMode? billingMode;

  /// The timestamp that shows when the event data store was created.
  final DateTime? createdTimestamp;

  /// The ARN of the event data store.
  final String? eventDataStoreArn;

  /// Specifies the KMS key ID that encrypts the events delivered by CloudTrail.
  /// The value is a fully specified ARN to a KMS key in the following format.
  ///
  /// <code>arn:aws:kms:us-east-2:123456789012:key/12345678-1234-1234-1234-123456789012</code>
  final String? kmsKeyId;

  /// Indicates whether the event data store collects events from all Regions, or
  /// only from the Region in which it was created.
  final bool? multiRegionEnabled;

  /// The name of the event data store.
  final String? name;

  /// Indicates whether an event data store is collecting logged events for an
  /// organization in Organizations.
  final bool? organizationEnabled;

  /// The retention period of an event data store, in days.
  final int? retentionPeriod;

  /// The status of event data store creation.
  final EventDataStoreStatus? status;
  final List<Tag>? tagsList;

  /// Indicates whether termination protection is enabled for the event data
  /// store.
  final bool? terminationProtectionEnabled;

  /// The timestamp that shows when an event data store was updated, if
  /// applicable. <code>UpdatedTimestamp</code> is always either the same or newer
  /// than the time shown in <code>CreatedTimestamp</code>.
  final DateTime? updatedTimestamp;

  CreateEventDataStoreResponse({
    this.advancedEventSelectors,
    this.billingMode,
    this.createdTimestamp,
    this.eventDataStoreArn,
    this.kmsKeyId,
    this.multiRegionEnabled,
    this.name,
    this.organizationEnabled,
    this.retentionPeriod,
    this.status,
    this.tagsList,
    this.terminationProtectionEnabled,
    this.updatedTimestamp,
  });

  factory CreateEventDataStoreResponse.fromJson(Map<String, dynamic> json) {
    return CreateEventDataStoreResponse(
      advancedEventSelectors: (json['AdvancedEventSelectors'] as List?)
          ?.whereNotNull()
          .map((e) => AdvancedEventSelector.fromJson(e as Map<String, dynamic>))
          .toList(),
      billingMode: (json['BillingMode'] as String?)?.toBillingMode(),
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      eventDataStoreArn: json['EventDataStoreArn'] as String?,
      kmsKeyId: json['KmsKeyId'] as String?,
      multiRegionEnabled: json['MultiRegionEnabled'] as bool?,
      name: json['Name'] as String?,
      organizationEnabled: json['OrganizationEnabled'] as bool?,
      retentionPeriod: json['RetentionPeriod'] as int?,
      status: (json['Status'] as String?)?.toEventDataStoreStatus(),
      tagsList: (json['TagsList'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      terminationProtectionEnabled:
          json['TerminationProtectionEnabled'] as bool?,
      updatedTimestamp: timeStampFromJson(json['UpdatedTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final advancedEventSelectors = this.advancedEventSelectors;
    final billingMode = this.billingMode;
    final createdTimestamp = this.createdTimestamp;
    final eventDataStoreArn = this.eventDataStoreArn;
    final kmsKeyId = this.kmsKeyId;
    final multiRegionEnabled = this.multiRegionEnabled;
    final name = this.name;
    final organizationEnabled = this.organizationEnabled;
    final retentionPeriod = this.retentionPeriod;
    final status = this.status;
    final tagsList = this.tagsList;
    final terminationProtectionEnabled = this.terminationProtectionEnabled;
    final updatedTimestamp = this.updatedTimestamp;
    return {
      if (advancedEventSelectors != null)
        'AdvancedEventSelectors': advancedEventSelectors,
      if (billingMode != null) 'BillingMode': billingMode.toValue(),
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (eventDataStoreArn != null) 'EventDataStoreArn': eventDataStoreArn,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (multiRegionEnabled != null) 'MultiRegionEnabled': multiRegionEnabled,
      if (name != null) 'Name': name,
      if (organizationEnabled != null)
        'OrganizationEnabled': organizationEnabled,
      if (retentionPeriod != null) 'RetentionPeriod': retentionPeriod,
      if (status != null) 'Status': status.toValue(),
      if (tagsList != null) 'TagsList': tagsList,
      if (terminationProtectionEnabled != null)
        'TerminationProtectionEnabled': terminationProtectionEnabled,
      if (updatedTimestamp != null)
        'UpdatedTimestamp': unixTimestampToJson(updatedTimestamp),
    };
  }
}

/// Returns the objects or data listed below if successful. Otherwise, returns
/// an error.
class CreateTrailResponse {
  /// Specifies the Amazon Resource Name (ARN) of the log group to which
  /// CloudTrail logs will be delivered.
  final String? cloudWatchLogsLogGroupArn;

  /// Specifies the role for the CloudWatch Logs endpoint to assume to write to a
  /// user's log group.
  final String? cloudWatchLogsRoleArn;

  /// Specifies whether the trail is publishing events from global services such
  /// as IAM to the log files.
  final bool? includeGlobalServiceEvents;

  /// Specifies whether the trail exists in one Region or in all Regions.
  final bool? isMultiRegionTrail;

  /// Specifies whether the trail is an organization trail.
  final bool? isOrganizationTrail;

  /// Specifies the KMS key ID that encrypts the events delivered by CloudTrail.
  /// The value is a fully specified ARN to a KMS key in the following format.
  ///
  /// <code>arn:aws:kms:us-east-2:123456789012:key/12345678-1234-1234-1234-123456789012</code>
  final String? kmsKeyId;

  /// Specifies whether log file integrity validation is enabled.
  final bool? logFileValidationEnabled;

  /// Specifies the name of the trail.
  final String? name;

  /// Specifies the name of the Amazon S3 bucket designated for publishing log
  /// files.
  final String? s3BucketName;

  /// Specifies the Amazon S3 key prefix that comes after the name of the bucket
  /// you have designated for log file delivery. For more information, see <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/get-and-view-cloudtrail-log-files.html#cloudtrail-find-log-files">Finding
  /// Your CloudTrail Log Files</a>.
  final String? s3KeyPrefix;

  /// Specifies the ARN of the Amazon SNS topic that CloudTrail uses to send
  /// notifications when log files are delivered. The format of a topic ARN is:
  ///
  /// <code>arn:aws:sns:us-east-2:123456789012:MyTopic</code>
  final String? snsTopicARN;

  /// This field is no longer in use. Use <code>SnsTopicARN</code>.
  final String? snsTopicName;

  /// Specifies the ARN of the trail that was created. The format of a trail ARN
  /// is:
  ///
  /// <code>arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail</code>
  final String? trailARN;

  CreateTrailResponse({
    this.cloudWatchLogsLogGroupArn,
    this.cloudWatchLogsRoleArn,
    this.includeGlobalServiceEvents,
    this.isMultiRegionTrail,
    this.isOrganizationTrail,
    this.kmsKeyId,
    this.logFileValidationEnabled,
    this.name,
    this.s3BucketName,
    this.s3KeyPrefix,
    this.snsTopicARN,
    this.snsTopicName,
    this.trailARN,
  });

  factory CreateTrailResponse.fromJson(Map<String, dynamic> json) {
    return CreateTrailResponse(
      cloudWatchLogsLogGroupArn: json['CloudWatchLogsLogGroupArn'] as String?,
      cloudWatchLogsRoleArn: json['CloudWatchLogsRoleArn'] as String?,
      includeGlobalServiceEvents: json['IncludeGlobalServiceEvents'] as bool?,
      isMultiRegionTrail: json['IsMultiRegionTrail'] as bool?,
      isOrganizationTrail: json['IsOrganizationTrail'] as bool?,
      kmsKeyId: json['KmsKeyId'] as String?,
      logFileValidationEnabled: json['LogFileValidationEnabled'] as bool?,
      name: json['Name'] as String?,
      s3BucketName: json['S3BucketName'] as String?,
      s3KeyPrefix: json['S3KeyPrefix'] as String?,
      snsTopicARN: json['SnsTopicARN'] as String?,
      snsTopicName: json['SnsTopicName'] as String?,
      trailARN: json['TrailARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchLogsLogGroupArn = this.cloudWatchLogsLogGroupArn;
    final cloudWatchLogsRoleArn = this.cloudWatchLogsRoleArn;
    final includeGlobalServiceEvents = this.includeGlobalServiceEvents;
    final isMultiRegionTrail = this.isMultiRegionTrail;
    final isOrganizationTrail = this.isOrganizationTrail;
    final kmsKeyId = this.kmsKeyId;
    final logFileValidationEnabled = this.logFileValidationEnabled;
    final name = this.name;
    final s3BucketName = this.s3BucketName;
    final s3KeyPrefix = this.s3KeyPrefix;
    final snsTopicARN = this.snsTopicARN;
    final snsTopicName = this.snsTopicName;
    final trailARN = this.trailARN;
    return {
      if (cloudWatchLogsLogGroupArn != null)
        'CloudWatchLogsLogGroupArn': cloudWatchLogsLogGroupArn,
      if (cloudWatchLogsRoleArn != null)
        'CloudWatchLogsRoleArn': cloudWatchLogsRoleArn,
      if (includeGlobalServiceEvents != null)
        'IncludeGlobalServiceEvents': includeGlobalServiceEvents,
      if (isMultiRegionTrail != null) 'IsMultiRegionTrail': isMultiRegionTrail,
      if (isOrganizationTrail != null)
        'IsOrganizationTrail': isOrganizationTrail,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (logFileValidationEnabled != null)
        'LogFileValidationEnabled': logFileValidationEnabled,
      if (name != null) 'Name': name,
      if (s3BucketName != null) 'S3BucketName': s3BucketName,
      if (s3KeyPrefix != null) 'S3KeyPrefix': s3KeyPrefix,
      if (snsTopicARN != null) 'SnsTopicARN': snsTopicARN,
      if (snsTopicName != null) 'SnsTopicName': snsTopicName,
      if (trailARN != null) 'TrailARN': trailARN,
    };
  }
}

/// Data events provide information about the resource operations performed on
/// or within a resource itself. These are also known as data plane operations.
/// You can specify up to 250 data resources for a trail.
///
/// Configure the <code>DataResource</code> to specify the resource type and
/// resource ARNs for which you want to log data events.
///
/// You can specify the following resource types in your event selectors for
/// your trail:
///
/// <ul>
/// <li>
/// <code>AWS::DynamoDB::Table</code>
/// </li>
/// <li>
/// <code>AWS::Lambda::Function</code>
/// </li>
/// <li>
/// <code>AWS::S3::Object</code>
/// </li>
/// </ul> <note>
/// The total number of allowed data resources is 250. This number can be
/// distributed between 1 and 5 event selectors, but the total cannot exceed 250
/// across all selectors for the trail.
///
/// If you are using advanced event selectors, the maximum total number of
/// values for all conditions, across all advanced event selectors for the
/// trail, is 500.
/// </note>
/// The following example demonstrates how logging works when you configure
/// logging of all data events for an S3 bucket named <code>bucket-1</code>. In
/// this example, the CloudTrail user specified an empty prefix, and the option
/// to log both <code>Read</code> and <code>Write</code> data events.
/// <ol>
/// <li>
/// A user uploads an image file to <code>bucket-1</code>.
/// </li>
/// <li>
/// The <code>PutObject</code> API operation is an Amazon S3 object-level API.
/// It is recorded as a data event in CloudTrail. Because the CloudTrail user
/// specified an S3 bucket with an empty prefix, events that occur on any object
/// in that bucket are logged. The trail processes and logs the event.
/// </li>
/// <li>
/// A user uploads an object to an Amazon S3 bucket named
/// <code>arn:aws:s3:::bucket-2</code>.
/// </li>
/// <li>
/// The <code>PutObject</code> API operation occurred for an object in an S3
/// bucket that the CloudTrail user didn't specify for the trail. The trail
/// doesn’t log the event.
/// </li> </ol>
/// The following example demonstrates how logging works when you configure
/// logging of Lambda data events for a Lambda function named
/// <i>MyLambdaFunction</i>, but not for all Lambda functions.
/// <ol>
/// <li>
/// A user runs a script that includes a call to the <i>MyLambdaFunction</i>
/// function and the <i>MyOtherLambdaFunction</i> function.
/// </li>
/// <li>
/// The <code>Invoke</code> API operation on <i>MyLambdaFunction</i> is an
/// Lambda API. It is recorded as a data event in CloudTrail. Because the
/// CloudTrail user specified logging data events for <i>MyLambdaFunction</i>,
/// any invocations of that function are logged. The trail processes and logs
/// the event.
/// </li>
/// <li>
/// The <code>Invoke</code> API operation on <i>MyOtherLambdaFunction</i> is an
/// Lambda API. Because the CloudTrail user did not specify logging data events
/// for all Lambda functions, the <code>Invoke</code> operation for
/// <i>MyOtherLambdaFunction</i> does not match the function specified for the
/// trail. The trail doesn’t log the event.
/// </li> </ol>
class DataResource {
  /// The resource type in which you want to log data events. You can specify the
  /// following <i>basic</i> event selector resource types:
  ///
  /// <ul>
  /// <li>
  /// <code>AWS::DynamoDB::Table</code>
  /// </li>
  /// <li>
  /// <code>AWS::Lambda::Function</code>
  /// </li>
  /// <li>
  /// <code>AWS::S3::Object</code>
  /// </li>
  /// </ul>
  /// Additional resource types are available through <i>advanced</i> event
  /// selectors. For more information about these additional resource types, see
  /// <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/APIReference/API_AdvancedFieldSelector.html">AdvancedFieldSelector</a>.
  final String? type;

  /// An array of Amazon Resource Name (ARN) strings or partial ARN strings for
  /// the specified resource type.
  ///
  /// <ul>
  /// <li>
  /// To log data events for all objects in all S3 buckets in your Amazon Web
  /// Services account, specify the prefix as <code>arn:aws:s3</code>.
  /// <note>
  /// This also enables logging of data event activity performed by any user or
  /// role in your Amazon Web Services account, even if that activity is performed
  /// on a bucket that belongs to another Amazon Web Services account.
  /// </note> </li>
  /// <li>
  /// To log data events for all objects in an S3 bucket, specify the bucket and
  /// an empty object prefix such as <code>arn:aws:s3:::bucket-1/</code>. The
  /// trail logs data events for all objects in this S3 bucket.
  /// </li>
  /// <li>
  /// To log data events for specific objects, specify the S3 bucket and object
  /// prefix such as <code>arn:aws:s3:::bucket-1/example-images</code>. The trail
  /// logs data events for objects in this S3 bucket that match the prefix.
  /// </li>
  /// <li>
  /// To log data events for all Lambda functions in your Amazon Web Services
  /// account, specify the prefix as <code>arn:aws:lambda</code>.
  /// <note>
  /// This also enables logging of <code>Invoke</code> activity performed by any
  /// user or role in your Amazon Web Services account, even if that activity is
  /// performed on a function that belongs to another Amazon Web Services account.
  /// </note> </li>
  /// <li>
  /// To log data events for a specific Lambda function, specify the function ARN.
  /// <note>
  /// Lambda function ARNs are exact. For example, if you specify a function ARN
  /// <i>arn:aws:lambda:us-west-2:111111111111:function:helloworld</i>, data
  /// events will only be logged for
  /// <i>arn:aws:lambda:us-west-2:111111111111:function:helloworld</i>. They will
  /// not be logged for
  /// <i>arn:aws:lambda:us-west-2:111111111111:function:helloworld2</i>.
  /// </note> </li>
  /// <li>
  /// To log data events for all DynamoDB tables in your Amazon Web Services
  /// account, specify the prefix as <code>arn:aws:dynamodb</code>.
  /// </li>
  /// </ul>
  final List<String>? values;

  DataResource({
    this.type,
    this.values,
  });

  factory DataResource.fromJson(Map<String, dynamic> json) {
    return DataResource(
      type: json['Type'] as String?,
      values: (json['Values'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final values = this.values;
    return {
      if (type != null) 'Type': type,
      if (values != null) 'Values': values,
    };
  }
}

class DeleteChannelResponse {
  DeleteChannelResponse();

  factory DeleteChannelResponse.fromJson(Map<String, dynamic> _) {
    return DeleteChannelResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteEventDataStoreResponse {
  DeleteEventDataStoreResponse();

  factory DeleteEventDataStoreResponse.fromJson(Map<String, dynamic> _) {
    return DeleteEventDataStoreResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteResourcePolicyResponse {
  DeleteResourcePolicyResponse();

  factory DeleteResourcePolicyResponse.fromJson(Map<String, dynamic> _) {
    return DeleteResourcePolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Returns the objects or data listed below if successful. Otherwise, returns
/// an error.
class DeleteTrailResponse {
  DeleteTrailResponse();

  factory DeleteTrailResponse.fromJson(Map<String, dynamic> _) {
    return DeleteTrailResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum DeliveryStatus {
  success,
  failed,
  failedSigningFile,
  pending,
  resourceNotFound,
  accessDenied,
  accessDeniedSigningFile,
  cancelled,
  unknown,
}

extension DeliveryStatusValueExtension on DeliveryStatus {
  String toValue() {
    switch (this) {
      case DeliveryStatus.success:
        return 'SUCCESS';
      case DeliveryStatus.failed:
        return 'FAILED';
      case DeliveryStatus.failedSigningFile:
        return 'FAILED_SIGNING_FILE';
      case DeliveryStatus.pending:
        return 'PENDING';
      case DeliveryStatus.resourceNotFound:
        return 'RESOURCE_NOT_FOUND';
      case DeliveryStatus.accessDenied:
        return 'ACCESS_DENIED';
      case DeliveryStatus.accessDeniedSigningFile:
        return 'ACCESS_DENIED_SIGNING_FILE';
      case DeliveryStatus.cancelled:
        return 'CANCELLED';
      case DeliveryStatus.unknown:
        return 'UNKNOWN';
    }
  }
}

extension DeliveryStatusFromString on String {
  DeliveryStatus toDeliveryStatus() {
    switch (this) {
      case 'SUCCESS':
        return DeliveryStatus.success;
      case 'FAILED':
        return DeliveryStatus.failed;
      case 'FAILED_SIGNING_FILE':
        return DeliveryStatus.failedSigningFile;
      case 'PENDING':
        return DeliveryStatus.pending;
      case 'RESOURCE_NOT_FOUND':
        return DeliveryStatus.resourceNotFound;
      case 'ACCESS_DENIED':
        return DeliveryStatus.accessDenied;
      case 'ACCESS_DENIED_SIGNING_FILE':
        return DeliveryStatus.accessDeniedSigningFile;
      case 'CANCELLED':
        return DeliveryStatus.cancelled;
      case 'UNKNOWN':
        return DeliveryStatus.unknown;
    }
    throw Exception('$this is not known in enum DeliveryStatus');
  }
}

/// Returns the following response if successful. Otherwise, returns an error.
class DeregisterOrganizationDelegatedAdminResponse {
  DeregisterOrganizationDelegatedAdminResponse();

  factory DeregisterOrganizationDelegatedAdminResponse.fromJson(
      Map<String, dynamic> _) {
    return DeregisterOrganizationDelegatedAdminResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeQueryResponse {
  /// The URI for the S3 bucket where CloudTrail delivered query results, if
  /// applicable.
  final String? deliveryS3Uri;

  /// The delivery status.
  final DeliveryStatus? deliveryStatus;

  /// The error message returned if a query failed.
  final String? errorMessage;

  /// The ID of the query.
  final String? queryId;

  /// Metadata about a query, including the number of events that were matched,
  /// the total number of events scanned, the query run time in milliseconds, and
  /// the query's creation time.
  final QueryStatisticsForDescribeQuery? queryStatistics;

  /// The status of a query. Values for <code>QueryStatus</code> include
  /// <code>QUEUED</code>, <code>RUNNING</code>, <code>FINISHED</code>,
  /// <code>FAILED</code>, <code>TIMED_OUT</code>, or <code>CANCELLED</code>
  final QueryStatus? queryStatus;

  /// The SQL code of a query.
  final String? queryString;

  DescribeQueryResponse({
    this.deliveryS3Uri,
    this.deliveryStatus,
    this.errorMessage,
    this.queryId,
    this.queryStatistics,
    this.queryStatus,
    this.queryString,
  });

  factory DescribeQueryResponse.fromJson(Map<String, dynamic> json) {
    return DescribeQueryResponse(
      deliveryS3Uri: json['DeliveryS3Uri'] as String?,
      deliveryStatus: (json['DeliveryStatus'] as String?)?.toDeliveryStatus(),
      errorMessage: json['ErrorMessage'] as String?,
      queryId: json['QueryId'] as String?,
      queryStatistics: json['QueryStatistics'] != null
          ? QueryStatisticsForDescribeQuery.fromJson(
              json['QueryStatistics'] as Map<String, dynamic>)
          : null,
      queryStatus: (json['QueryStatus'] as String?)?.toQueryStatus(),
      queryString: json['QueryString'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deliveryS3Uri = this.deliveryS3Uri;
    final deliveryStatus = this.deliveryStatus;
    final errorMessage = this.errorMessage;
    final queryId = this.queryId;
    final queryStatistics = this.queryStatistics;
    final queryStatus = this.queryStatus;
    final queryString = this.queryString;
    return {
      if (deliveryS3Uri != null) 'DeliveryS3Uri': deliveryS3Uri,
      if (deliveryStatus != null) 'DeliveryStatus': deliveryStatus.toValue(),
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (queryId != null) 'QueryId': queryId,
      if (queryStatistics != null) 'QueryStatistics': queryStatistics,
      if (queryStatus != null) 'QueryStatus': queryStatus.toValue(),
      if (queryString != null) 'QueryString': queryString,
    };
  }
}

/// Returns the objects or data listed below if successful. Otherwise, returns
/// an error.
class DescribeTrailsResponse {
  /// The list of trail objects. Trail objects with string values are only
  /// returned if values for the objects exist in a trail's configuration. For
  /// example, <code>SNSTopicName</code> and <code>SNSTopicARN</code> are only
  /// returned in results if a trail is configured to send SNS notifications.
  /// Similarly, <code>KMSKeyId</code> only appears in results if a trail's log
  /// files are encrypted with KMS customer managed keys.
  final List<Trail>? trailList;

  DescribeTrailsResponse({
    this.trailList,
  });

  factory DescribeTrailsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeTrailsResponse(
      trailList: (json['trailList'] as List?)
          ?.whereNotNull()
          .map((e) => Trail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final trailList = this.trailList;
    return {
      if (trailList != null) 'trailList': trailList,
    };
  }
}

/// Contains information about the destination receiving events.
class Destination {
  /// For channels used for a CloudTrail Lake integration, the location is the ARN
  /// of an event data store that receives events from a channel. For
  /// service-linked channels, the location is the name of the Amazon Web Services
  /// service.
  final String location;

  /// The type of destination for events arriving from a channel. For channels
  /// used for a CloudTrail Lake integration, the value is
  /// <code>EVENT_DATA_STORE</code>. For service-linked channels, the value is
  /// <code>AWS_SERVICE</code>.
  final DestinationType type;

  Destination({
    required this.location,
    required this.type,
  });

  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      location: json['Location'] as String,
      type: (json['Type'] as String).toDestinationType(),
    );
  }

  Map<String, dynamic> toJson() {
    final location = this.location;
    final type = this.type;
    return {
      'Location': location,
      'Type': type.toValue(),
    };
  }
}

enum DestinationType {
  eventDataStore,
  awsService,
}

extension DestinationTypeValueExtension on DestinationType {
  String toValue() {
    switch (this) {
      case DestinationType.eventDataStore:
        return 'EVENT_DATA_STORE';
      case DestinationType.awsService:
        return 'AWS_SERVICE';
    }
  }
}

extension DestinationTypeFromString on String {
  DestinationType toDestinationType() {
    switch (this) {
      case 'EVENT_DATA_STORE':
        return DestinationType.eventDataStore;
      case 'AWS_SERVICE':
        return DestinationType.awsService;
    }
    throw Exception('$this is not known in enum DestinationType');
  }
}

class DisableFederationResponse {
  /// The ARN of the event data store for which you disabled Lake query
  /// federation.
  final String? eventDataStoreArn;

  /// The federation status.
  final FederationStatus? federationStatus;

  DisableFederationResponse({
    this.eventDataStoreArn,
    this.federationStatus,
  });

  factory DisableFederationResponse.fromJson(Map<String, dynamic> json) {
    return DisableFederationResponse(
      eventDataStoreArn: json['EventDataStoreArn'] as String?,
      federationStatus:
          (json['FederationStatus'] as String?)?.toFederationStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final eventDataStoreArn = this.eventDataStoreArn;
    final federationStatus = this.federationStatus;
    return {
      if (eventDataStoreArn != null) 'EventDataStoreArn': eventDataStoreArn,
      if (federationStatus != null)
        'FederationStatus': federationStatus.toValue(),
    };
  }
}

class EnableFederationResponse {
  /// The ARN of the event data store for which you enabled Lake query federation.
  final String? eventDataStoreArn;

  /// The ARN of the federation role.
  final String? federationRoleArn;

  /// The federation status.
  final FederationStatus? federationStatus;

  EnableFederationResponse({
    this.eventDataStoreArn,
    this.federationRoleArn,
    this.federationStatus,
  });

  factory EnableFederationResponse.fromJson(Map<String, dynamic> json) {
    return EnableFederationResponse(
      eventDataStoreArn: json['EventDataStoreArn'] as String?,
      federationRoleArn: json['FederationRoleArn'] as String?,
      federationStatus:
          (json['FederationStatus'] as String?)?.toFederationStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final eventDataStoreArn = this.eventDataStoreArn;
    final federationRoleArn = this.federationRoleArn;
    final federationStatus = this.federationStatus;
    return {
      if (eventDataStoreArn != null) 'EventDataStoreArn': eventDataStoreArn,
      if (federationRoleArn != null) 'FederationRoleArn': federationRoleArn,
      if (federationStatus != null)
        'FederationStatus': federationStatus.toValue(),
    };
  }
}

/// Contains information about an event that was returned by a lookup request.
/// The result includes a representation of a CloudTrail event.
class Event {
  /// The Amazon Web Services access key ID that was used to sign the request. If
  /// the request was made with temporary security credentials, this is the access
  /// key ID of the temporary credentials.
  final String? accessKeyId;

  /// A JSON string that contains a representation of the event returned.
  final String? cloudTrailEvent;

  /// The CloudTrail ID of the event returned.
  final String? eventId;

  /// The name of the event returned.
  final String? eventName;

  /// The Amazon Web Services service to which the request was made.
  final String? eventSource;

  /// The date and time of the event returned.
  final DateTime? eventTime;

  /// Information about whether the event is a write event or a read event.
  final String? readOnly;

  /// A list of resources referenced by the event returned.
  final List<Resource>? resources;

  /// A user name or role name of the requester that called the API in the event
  /// returned.
  final String? username;

  Event({
    this.accessKeyId,
    this.cloudTrailEvent,
    this.eventId,
    this.eventName,
    this.eventSource,
    this.eventTime,
    this.readOnly,
    this.resources,
    this.username,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      accessKeyId: json['AccessKeyId'] as String?,
      cloudTrailEvent: json['CloudTrailEvent'] as String?,
      eventId: json['EventId'] as String?,
      eventName: json['EventName'] as String?,
      eventSource: json['EventSource'] as String?,
      eventTime: timeStampFromJson(json['EventTime']),
      readOnly: json['ReadOnly'] as String?,
      resources: (json['Resources'] as List?)
          ?.whereNotNull()
          .map((e) => Resource.fromJson(e as Map<String, dynamic>))
          .toList(),
      username: json['Username'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accessKeyId = this.accessKeyId;
    final cloudTrailEvent = this.cloudTrailEvent;
    final eventId = this.eventId;
    final eventName = this.eventName;
    final eventSource = this.eventSource;
    final eventTime = this.eventTime;
    final readOnly = this.readOnly;
    final resources = this.resources;
    final username = this.username;
    return {
      if (accessKeyId != null) 'AccessKeyId': accessKeyId,
      if (cloudTrailEvent != null) 'CloudTrailEvent': cloudTrailEvent,
      if (eventId != null) 'EventId': eventId,
      if (eventName != null) 'EventName': eventName,
      if (eventSource != null) 'EventSource': eventSource,
      if (eventTime != null) 'EventTime': unixTimestampToJson(eventTime),
      if (readOnly != null) 'ReadOnly': readOnly,
      if (resources != null) 'Resources': resources,
      if (username != null) 'Username': username,
    };
  }
}

enum EventCategory {
  insight,
}

extension EventCategoryValueExtension on EventCategory {
  String toValue() {
    switch (this) {
      case EventCategory.insight:
        return 'insight';
    }
  }
}

extension EventCategoryFromString on String {
  EventCategory toEventCategory() {
    switch (this) {
      case 'insight':
        return EventCategory.insight;
    }
    throw Exception('$this is not known in enum EventCategory');
  }
}

/// A storage lake of event data against which you can run complex SQL-based
/// queries. An event data store can include events that you have logged on your
/// account. To select events for an event data store, use <a
/// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-lake-concepts.html#adv-event-selectors">advanced
/// event selectors</a>.
class EventDataStore {
  /// The advanced event selectors that were used to select events for the data
  /// store.
  final List<AdvancedEventSelector>? advancedEventSelectors;

  /// The timestamp of the event data store's creation.
  final DateTime? createdTimestamp;

  /// The ARN of the event data store.
  final String? eventDataStoreArn;

  /// Indicates whether the event data store includes events from all Regions, or
  /// only from the Region in which it was created.
  final bool? multiRegionEnabled;

  /// The name of the event data store.
  final String? name;

  /// Indicates that an event data store is collecting logged events for an
  /// organization.
  final bool? organizationEnabled;

  /// The retention period, in days.
  final int? retentionPeriod;

  /// The status of an event data store.
  final EventDataStoreStatus? status;

  /// Indicates whether the event data store is protected from termination.
  final bool? terminationProtectionEnabled;

  /// The timestamp showing when an event data store was updated, if applicable.
  /// <code>UpdatedTimestamp</code> is always either the same or newer than the
  /// time shown in <code>CreatedTimestamp</code>.
  final DateTime? updatedTimestamp;

  EventDataStore({
    this.advancedEventSelectors,
    this.createdTimestamp,
    this.eventDataStoreArn,
    this.multiRegionEnabled,
    this.name,
    this.organizationEnabled,
    this.retentionPeriod,
    this.status,
    this.terminationProtectionEnabled,
    this.updatedTimestamp,
  });

  factory EventDataStore.fromJson(Map<String, dynamic> json) {
    return EventDataStore(
      advancedEventSelectors: (json['AdvancedEventSelectors'] as List?)
          ?.whereNotNull()
          .map((e) => AdvancedEventSelector.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      eventDataStoreArn: json['EventDataStoreArn'] as String?,
      multiRegionEnabled: json['MultiRegionEnabled'] as bool?,
      name: json['Name'] as String?,
      organizationEnabled: json['OrganizationEnabled'] as bool?,
      retentionPeriod: json['RetentionPeriod'] as int?,
      status: (json['Status'] as String?)?.toEventDataStoreStatus(),
      terminationProtectionEnabled:
          json['TerminationProtectionEnabled'] as bool?,
      updatedTimestamp: timeStampFromJson(json['UpdatedTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final advancedEventSelectors = this.advancedEventSelectors;
    final createdTimestamp = this.createdTimestamp;
    final eventDataStoreArn = this.eventDataStoreArn;
    final multiRegionEnabled = this.multiRegionEnabled;
    final name = this.name;
    final organizationEnabled = this.organizationEnabled;
    final retentionPeriod = this.retentionPeriod;
    final status = this.status;
    final terminationProtectionEnabled = this.terminationProtectionEnabled;
    final updatedTimestamp = this.updatedTimestamp;
    return {
      if (advancedEventSelectors != null)
        'AdvancedEventSelectors': advancedEventSelectors,
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (eventDataStoreArn != null) 'EventDataStoreArn': eventDataStoreArn,
      if (multiRegionEnabled != null) 'MultiRegionEnabled': multiRegionEnabled,
      if (name != null) 'Name': name,
      if (organizationEnabled != null)
        'OrganizationEnabled': organizationEnabled,
      if (retentionPeriod != null) 'RetentionPeriod': retentionPeriod,
      if (status != null) 'Status': status.toValue(),
      if (terminationProtectionEnabled != null)
        'TerminationProtectionEnabled': terminationProtectionEnabled,
      if (updatedTimestamp != null)
        'UpdatedTimestamp': unixTimestampToJson(updatedTimestamp),
    };
  }
}

enum EventDataStoreStatus {
  created,
  enabled,
  pendingDeletion,
  startingIngestion,
  stoppingIngestion,
  stoppedIngestion,
}

extension EventDataStoreStatusValueExtension on EventDataStoreStatus {
  String toValue() {
    switch (this) {
      case EventDataStoreStatus.created:
        return 'CREATED';
      case EventDataStoreStatus.enabled:
        return 'ENABLED';
      case EventDataStoreStatus.pendingDeletion:
        return 'PENDING_DELETION';
      case EventDataStoreStatus.startingIngestion:
        return 'STARTING_INGESTION';
      case EventDataStoreStatus.stoppingIngestion:
        return 'STOPPING_INGESTION';
      case EventDataStoreStatus.stoppedIngestion:
        return 'STOPPED_INGESTION';
    }
  }
}

extension EventDataStoreStatusFromString on String {
  EventDataStoreStatus toEventDataStoreStatus() {
    switch (this) {
      case 'CREATED':
        return EventDataStoreStatus.created;
      case 'ENABLED':
        return EventDataStoreStatus.enabled;
      case 'PENDING_DELETION':
        return EventDataStoreStatus.pendingDeletion;
      case 'STARTING_INGESTION':
        return EventDataStoreStatus.startingIngestion;
      case 'STOPPING_INGESTION':
        return EventDataStoreStatus.stoppingIngestion;
      case 'STOPPED_INGESTION':
        return EventDataStoreStatus.stoppedIngestion;
    }
    throw Exception('$this is not known in enum EventDataStoreStatus');
  }
}

/// Use event selectors to further specify the management and data event
/// settings for your trail. By default, trails created without specific event
/// selectors will be configured to log all read and write management events,
/// and no data events. When an event occurs in your account, CloudTrail
/// evaluates the event selector for all trails. For each trail, if the event
/// matches any event selector, the trail processes and logs the event. If the
/// event doesn't match any event selector, the trail doesn't log the event.
///
/// You can configure up to five event selectors for a trail.
///
/// You cannot apply both event selectors and advanced event selectors to a
/// trail.
class EventSelector {
  /// CloudTrail supports data event logging for Amazon S3 objects, Lambda
  /// functions, and Amazon DynamoDB tables with basic event selectors. You can
  /// specify up to 250 resources for an individual event selector, but the total
  /// number of data resources cannot exceed 250 across all event selectors in a
  /// trail. This limit does not apply if you configure resource logging for all
  /// data events.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-data-events-with-cloudtrail.html">Data
  /// Events</a> and <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/WhatIsCloudTrail-Limits.html">Limits
  /// in CloudTrail</a> in the <i>CloudTrail User Guide</i>.
  final List<DataResource>? dataResources;

  /// An optional list of service event sources from which you do not want
  /// management events to be logged on your trail. In this release, the list can
  /// be empty (disables the filter), or it can filter out Key Management Service
  /// or Amazon RDS Data API events by containing <code>kms.amazonaws.com</code>
  /// or <code>rdsdata.amazonaws.com</code>. By default,
  /// <code>ExcludeManagementEventSources</code> is empty, and KMS and Amazon RDS
  /// Data API events are logged to your trail. You can exclude management event
  /// sources only in Regions that support the event source.
  final List<String>? excludeManagementEventSources;

  /// Specify if you want your event selector to include management events for
  /// your trail.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-management-events-with-cloudtrail.html">Management
  /// Events</a> in the <i>CloudTrail User Guide</i>.
  ///
  /// By default, the value is <code>true</code>.
  ///
  /// The first copy of management events is free. You are charged for additional
  /// copies of management events that you are logging on any subsequent trail in
  /// the same Region. For more information about CloudTrail pricing, see <a
  /// href="http://aws.amazon.com/cloudtrail/pricing/">CloudTrail Pricing</a>.
  final bool? includeManagementEvents;

  /// Specify if you want your trail to log read-only events, write-only events,
  /// or all. For example, the EC2 <code>GetConsoleOutput</code> is a read-only
  /// API operation and <code>RunInstances</code> is a write-only API operation.
  ///
  /// By default, the value is <code>All</code>.
  final ReadWriteType? readWriteType;

  EventSelector({
    this.dataResources,
    this.excludeManagementEventSources,
    this.includeManagementEvents,
    this.readWriteType,
  });

  factory EventSelector.fromJson(Map<String, dynamic> json) {
    return EventSelector(
      dataResources: (json['DataResources'] as List?)
          ?.whereNotNull()
          .map((e) => DataResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      excludeManagementEventSources:
          (json['ExcludeManagementEventSources'] as List?)
              ?.whereNotNull()
              .map((e) => e as String)
              .toList(),
      includeManagementEvents: json['IncludeManagementEvents'] as bool?,
      readWriteType: (json['ReadWriteType'] as String?)?.toReadWriteType(),
    );
  }

  Map<String, dynamic> toJson() {
    final dataResources = this.dataResources;
    final excludeManagementEventSources = this.excludeManagementEventSources;
    final includeManagementEvents = this.includeManagementEvents;
    final readWriteType = this.readWriteType;
    return {
      if (dataResources != null) 'DataResources': dataResources,
      if (excludeManagementEventSources != null)
        'ExcludeManagementEventSources': excludeManagementEventSources,
      if (includeManagementEvents != null)
        'IncludeManagementEvents': includeManagementEvents,
      if (readWriteType != null) 'ReadWriteType': readWriteType.toValue(),
    };
  }
}

enum FederationStatus {
  enabling,
  enabled,
  disabling,
  disabled,
}

extension FederationStatusValueExtension on FederationStatus {
  String toValue() {
    switch (this) {
      case FederationStatus.enabling:
        return 'ENABLING';
      case FederationStatus.enabled:
        return 'ENABLED';
      case FederationStatus.disabling:
        return 'DISABLING';
      case FederationStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension FederationStatusFromString on String {
  FederationStatus toFederationStatus() {
    switch (this) {
      case 'ENABLING':
        return FederationStatus.enabling;
      case 'ENABLED':
        return FederationStatus.enabled;
      case 'DISABLING':
        return FederationStatus.disabling;
      case 'DISABLED':
        return FederationStatus.disabled;
    }
    throw Exception('$this is not known in enum FederationStatus');
  }
}

class GetChannelResponse {
  /// The ARN of an channel returned by a <code>GetChannel</code> request.
  final String? channelArn;

  /// The destinations for the channel. For channels created for integrations, the
  /// destinations are the event data stores that log events arriving through the
  /// channel. For service-linked channels, the destination is the Amazon Web
  /// Services service that created the service-linked channel to receive events.
  final List<Destination>? destinations;

  /// A table showing information about the most recent successful and failed
  /// attempts to ingest events.
  final IngestionStatus? ingestionStatus;

  /// The name of the CloudTrail channel. For service-linked channels, the name is
  /// <code>aws-service-channel/service-name/custom-suffix</code> where
  /// <code>service-name</code> represents the name of the Amazon Web Services
  /// service that created the channel and <code>custom-suffix</code> represents
  /// the suffix generated by the Amazon Web Services service.
  final String? name;

  /// The source for the CloudTrail channel.
  final String? source;

  /// Provides information about the advanced event selectors configured for the
  /// channel, and whether the channel applies to all Regions or a single Region.
  final SourceConfig? sourceConfig;

  GetChannelResponse({
    this.channelArn,
    this.destinations,
    this.ingestionStatus,
    this.name,
    this.source,
    this.sourceConfig,
  });

  factory GetChannelResponse.fromJson(Map<String, dynamic> json) {
    return GetChannelResponse(
      channelArn: json['ChannelArn'] as String?,
      destinations: (json['Destinations'] as List?)
          ?.whereNotNull()
          .map((e) => Destination.fromJson(e as Map<String, dynamic>))
          .toList(),
      ingestionStatus: json['IngestionStatus'] != null
          ? IngestionStatus.fromJson(
              json['IngestionStatus'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      source: json['Source'] as String?,
      sourceConfig: json['SourceConfig'] != null
          ? SourceConfig.fromJson(json['SourceConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final channelArn = this.channelArn;
    final destinations = this.destinations;
    final ingestionStatus = this.ingestionStatus;
    final name = this.name;
    final source = this.source;
    final sourceConfig = this.sourceConfig;
    return {
      if (channelArn != null) 'ChannelArn': channelArn,
      if (destinations != null) 'Destinations': destinations,
      if (ingestionStatus != null) 'IngestionStatus': ingestionStatus,
      if (name != null) 'Name': name,
      if (source != null) 'Source': source,
      if (sourceConfig != null) 'SourceConfig': sourceConfig,
    };
  }
}

class GetEventDataStoreResponse {
  /// The advanced event selectors used to select events for the data store.
  final List<AdvancedEventSelector>? advancedEventSelectors;

  /// The billing mode for the event data store.
  final BillingMode? billingMode;

  /// The timestamp of the event data store's creation.
  final DateTime? createdTimestamp;

  /// The event data store Amazon Resource Number (ARN).
  final String? eventDataStoreArn;

  /// If Lake query federation is enabled, provides the ARN of the federation role
  /// used to access the resources for the federated event data store.
  final String? federationRoleArn;

  /// Indicates the <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/query-federation.html">Lake
  /// query federation</a> status. The status is <code>ENABLED</code> if Lake
  /// query federation is enabled, or <code>DISABLED</code> if Lake query
  /// federation is disabled. You cannot delete an event data store if the
  /// <code>FederationStatus</code> is <code>ENABLED</code>.
  final FederationStatus? federationStatus;

  /// Specifies the KMS key ID that encrypts the events delivered by CloudTrail.
  /// The value is a fully specified ARN to a KMS key in the following format.
  ///
  /// <code>arn:aws:kms:us-east-2:123456789012:key/12345678-1234-1234-1234-123456789012</code>
  final String? kmsKeyId;

  /// Indicates whether the event data store includes events from all Regions, or
  /// only from the Region in which it was created.
  final bool? multiRegionEnabled;

  /// The name of the event data store.
  final String? name;

  /// Indicates whether an event data store is collecting logged events for an
  /// organization in Organizations.
  final bool? organizationEnabled;

  /// The partition keys for the event data store. To improve query performance
  /// and efficiency, CloudTrail Lake organizes event data into partitions based
  /// on values derived from partition keys.
  final List<PartitionKey>? partitionKeys;

  /// The retention period of the event data store, in days.
  final int? retentionPeriod;

  /// The status of an event data store.
  final EventDataStoreStatus? status;

  /// Indicates that termination protection is enabled.
  final bool? terminationProtectionEnabled;

  /// Shows the time that an event data store was updated, if applicable.
  /// <code>UpdatedTimestamp</code> is always either the same or newer than the
  /// time shown in <code>CreatedTimestamp</code>.
  final DateTime? updatedTimestamp;

  GetEventDataStoreResponse({
    this.advancedEventSelectors,
    this.billingMode,
    this.createdTimestamp,
    this.eventDataStoreArn,
    this.federationRoleArn,
    this.federationStatus,
    this.kmsKeyId,
    this.multiRegionEnabled,
    this.name,
    this.organizationEnabled,
    this.partitionKeys,
    this.retentionPeriod,
    this.status,
    this.terminationProtectionEnabled,
    this.updatedTimestamp,
  });

  factory GetEventDataStoreResponse.fromJson(Map<String, dynamic> json) {
    return GetEventDataStoreResponse(
      advancedEventSelectors: (json['AdvancedEventSelectors'] as List?)
          ?.whereNotNull()
          .map((e) => AdvancedEventSelector.fromJson(e as Map<String, dynamic>))
          .toList(),
      billingMode: (json['BillingMode'] as String?)?.toBillingMode(),
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      eventDataStoreArn: json['EventDataStoreArn'] as String?,
      federationRoleArn: json['FederationRoleArn'] as String?,
      federationStatus:
          (json['FederationStatus'] as String?)?.toFederationStatus(),
      kmsKeyId: json['KmsKeyId'] as String?,
      multiRegionEnabled: json['MultiRegionEnabled'] as bool?,
      name: json['Name'] as String?,
      organizationEnabled: json['OrganizationEnabled'] as bool?,
      partitionKeys: (json['PartitionKeys'] as List?)
          ?.whereNotNull()
          .map((e) => PartitionKey.fromJson(e as Map<String, dynamic>))
          .toList(),
      retentionPeriod: json['RetentionPeriod'] as int?,
      status: (json['Status'] as String?)?.toEventDataStoreStatus(),
      terminationProtectionEnabled:
          json['TerminationProtectionEnabled'] as bool?,
      updatedTimestamp: timeStampFromJson(json['UpdatedTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final advancedEventSelectors = this.advancedEventSelectors;
    final billingMode = this.billingMode;
    final createdTimestamp = this.createdTimestamp;
    final eventDataStoreArn = this.eventDataStoreArn;
    final federationRoleArn = this.federationRoleArn;
    final federationStatus = this.federationStatus;
    final kmsKeyId = this.kmsKeyId;
    final multiRegionEnabled = this.multiRegionEnabled;
    final name = this.name;
    final organizationEnabled = this.organizationEnabled;
    final partitionKeys = this.partitionKeys;
    final retentionPeriod = this.retentionPeriod;
    final status = this.status;
    final terminationProtectionEnabled = this.terminationProtectionEnabled;
    final updatedTimestamp = this.updatedTimestamp;
    return {
      if (advancedEventSelectors != null)
        'AdvancedEventSelectors': advancedEventSelectors,
      if (billingMode != null) 'BillingMode': billingMode.toValue(),
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (eventDataStoreArn != null) 'EventDataStoreArn': eventDataStoreArn,
      if (federationRoleArn != null) 'FederationRoleArn': federationRoleArn,
      if (federationStatus != null)
        'FederationStatus': federationStatus.toValue(),
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (multiRegionEnabled != null) 'MultiRegionEnabled': multiRegionEnabled,
      if (name != null) 'Name': name,
      if (organizationEnabled != null)
        'OrganizationEnabled': organizationEnabled,
      if (partitionKeys != null) 'PartitionKeys': partitionKeys,
      if (retentionPeriod != null) 'RetentionPeriod': retentionPeriod,
      if (status != null) 'Status': status.toValue(),
      if (terminationProtectionEnabled != null)
        'TerminationProtectionEnabled': terminationProtectionEnabled,
      if (updatedTimestamp != null)
        'UpdatedTimestamp': unixTimestampToJson(updatedTimestamp),
    };
  }
}

class GetEventSelectorsResponse {
  /// The advanced event selectors that are configured for the trail.
  final List<AdvancedEventSelector>? advancedEventSelectors;

  /// The event selectors that are configured for the trail.
  final List<EventSelector>? eventSelectors;

  /// The specified trail ARN that has the event selectors.
  final String? trailARN;

  GetEventSelectorsResponse({
    this.advancedEventSelectors,
    this.eventSelectors,
    this.trailARN,
  });

  factory GetEventSelectorsResponse.fromJson(Map<String, dynamic> json) {
    return GetEventSelectorsResponse(
      advancedEventSelectors: (json['AdvancedEventSelectors'] as List?)
          ?.whereNotNull()
          .map((e) => AdvancedEventSelector.fromJson(e as Map<String, dynamic>))
          .toList(),
      eventSelectors: (json['EventSelectors'] as List?)
          ?.whereNotNull()
          .map((e) => EventSelector.fromJson(e as Map<String, dynamic>))
          .toList(),
      trailARN: json['TrailARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final advancedEventSelectors = this.advancedEventSelectors;
    final eventSelectors = this.eventSelectors;
    final trailARN = this.trailARN;
    return {
      if (advancedEventSelectors != null)
        'AdvancedEventSelectors': advancedEventSelectors,
      if (eventSelectors != null) 'EventSelectors': eventSelectors,
      if (trailARN != null) 'TrailARN': trailARN,
    };
  }
}

class GetImportResponse {
  /// The timestamp of the import's creation.
  final DateTime? createdTimestamp;

  /// The ARN of the destination event data store.
  final List<String>? destinations;

  /// Used with <code>StartEventTime</code> to bound a <code>StartImport</code>
  /// request, and limit imported trail events to only those events logged within
  /// a specified time period.
  final DateTime? endEventTime;

  /// The ID of the import.
  final String? importId;

  /// The source S3 bucket.
  final ImportSource? importSource;

  /// Provides statistics for the import. CloudTrail does not update import
  /// statistics in real-time. Returned values for parameters such as
  /// <code>EventsCompleted</code> may be lower than the actual value, because
  /// CloudTrail updates statistics incrementally over the course of the import.
  final ImportStatistics? importStatistics;

  /// The status of the import.
  final ImportStatus? importStatus;

  /// Used with <code>EndEventTime</code> to bound a <code>StartImport</code>
  /// request, and limit imported trail events to only those events logged within
  /// a specified time period.
  final DateTime? startEventTime;

  /// The timestamp of when the import was updated.
  final DateTime? updatedTimestamp;

  GetImportResponse({
    this.createdTimestamp,
    this.destinations,
    this.endEventTime,
    this.importId,
    this.importSource,
    this.importStatistics,
    this.importStatus,
    this.startEventTime,
    this.updatedTimestamp,
  });

  factory GetImportResponse.fromJson(Map<String, dynamic> json) {
    return GetImportResponse(
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      destinations: (json['Destinations'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      endEventTime: timeStampFromJson(json['EndEventTime']),
      importId: json['ImportId'] as String?,
      importSource: json['ImportSource'] != null
          ? ImportSource.fromJson(json['ImportSource'] as Map<String, dynamic>)
          : null,
      importStatistics: json['ImportStatistics'] != null
          ? ImportStatistics.fromJson(
              json['ImportStatistics'] as Map<String, dynamic>)
          : null,
      importStatus: (json['ImportStatus'] as String?)?.toImportStatus(),
      startEventTime: timeStampFromJson(json['StartEventTime']),
      updatedTimestamp: timeStampFromJson(json['UpdatedTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final destinations = this.destinations;
    final endEventTime = this.endEventTime;
    final importId = this.importId;
    final importSource = this.importSource;
    final importStatistics = this.importStatistics;
    final importStatus = this.importStatus;
    final startEventTime = this.startEventTime;
    final updatedTimestamp = this.updatedTimestamp;
    return {
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (destinations != null) 'Destinations': destinations,
      if (endEventTime != null)
        'EndEventTime': unixTimestampToJson(endEventTime),
      if (importId != null) 'ImportId': importId,
      if (importSource != null) 'ImportSource': importSource,
      if (importStatistics != null) 'ImportStatistics': importStatistics,
      if (importStatus != null) 'ImportStatus': importStatus.toValue(),
      if (startEventTime != null)
        'StartEventTime': unixTimestampToJson(startEventTime),
      if (updatedTimestamp != null)
        'UpdatedTimestamp': unixTimestampToJson(updatedTimestamp),
    };
  }
}

class GetInsightSelectorsResponse {
  /// The ARN of the source event data store that enabled Insights events.
  final String? eventDataStoreArn;

  /// A JSON string that contains the Insight types you want to log on a trail or
  /// event data store. <code>ApiErrorRateInsight</code> and
  /// <code>ApiCallRateInsight</code> are supported as Insights types.
  final List<InsightSelector>? insightSelectors;

  /// The ARN of the destination event data store that logs Insights events.
  final String? insightsDestination;

  /// The Amazon Resource Name (ARN) of a trail for which you want to get Insights
  /// selectors.
  final String? trailARN;

  GetInsightSelectorsResponse({
    this.eventDataStoreArn,
    this.insightSelectors,
    this.insightsDestination,
    this.trailARN,
  });

  factory GetInsightSelectorsResponse.fromJson(Map<String, dynamic> json) {
    return GetInsightSelectorsResponse(
      eventDataStoreArn: json['EventDataStoreArn'] as String?,
      insightSelectors: (json['InsightSelectors'] as List?)
          ?.whereNotNull()
          .map((e) => InsightSelector.fromJson(e as Map<String, dynamic>))
          .toList(),
      insightsDestination: json['InsightsDestination'] as String?,
      trailARN: json['TrailARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventDataStoreArn = this.eventDataStoreArn;
    final insightSelectors = this.insightSelectors;
    final insightsDestination = this.insightsDestination;
    final trailARN = this.trailARN;
    return {
      if (eventDataStoreArn != null) 'EventDataStoreArn': eventDataStoreArn,
      if (insightSelectors != null) 'InsightSelectors': insightSelectors,
      if (insightsDestination != null)
        'InsightsDestination': insightsDestination,
      if (trailARN != null) 'TrailARN': trailARN,
    };
  }
}

class GetQueryResultsResponse {
  /// The error message returned if a query failed.
  final String? errorMessage;

  /// A token you can use to get the next page of query results.
  final String? nextToken;

  /// Contains the individual event results of the query.
  final List<List<Map<String, String>>>? queryResultRows;

  /// Shows the count of query results.
  final QueryStatistics? queryStatistics;

  /// The status of the query. Values include <code>QUEUED</code>,
  /// <code>RUNNING</code>, <code>FINISHED</code>, <code>FAILED</code>,
  /// <code>TIMED_OUT</code>, or <code>CANCELLED</code>.
  final QueryStatus? queryStatus;

  GetQueryResultsResponse({
    this.errorMessage,
    this.nextToken,
    this.queryResultRows,
    this.queryStatistics,
    this.queryStatus,
  });

  factory GetQueryResultsResponse.fromJson(Map<String, dynamic> json) {
    return GetQueryResultsResponse(
      errorMessage: json['ErrorMessage'] as String?,
      nextToken: json['NextToken'] as String?,
      queryResultRows: (json['QueryResultRows'] as List?)
          ?.whereNotNull()
          .map((e) => (e as List)
              .whereNotNull()
              .map((e) => (e as Map<String, dynamic>)
                  .map((k, e) => MapEntry(k, e as String)))
              .toList())
          .toList(),
      queryStatistics: json['QueryStatistics'] != null
          ? QueryStatistics.fromJson(
              json['QueryStatistics'] as Map<String, dynamic>)
          : null,
      queryStatus: (json['QueryStatus'] as String?)?.toQueryStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final errorMessage = this.errorMessage;
    final nextToken = this.nextToken;
    final queryResultRows = this.queryResultRows;
    final queryStatistics = this.queryStatistics;
    final queryStatus = this.queryStatus;
    return {
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (nextToken != null) 'NextToken': nextToken,
      if (queryResultRows != null) 'QueryResultRows': queryResultRows,
      if (queryStatistics != null) 'QueryStatistics': queryStatistics,
      if (queryStatus != null) 'QueryStatus': queryStatus.toValue(),
    };
  }
}

class GetResourcePolicyResponse {
  /// The Amazon Resource Name (ARN) of the CloudTrail channel attached to
  /// resource-based policy.
  final String? resourceArn;

  /// A JSON-formatted string that contains the resource-based policy attached to
  /// the CloudTrail channel.
  final String? resourcePolicy;

  GetResourcePolicyResponse({
    this.resourceArn,
    this.resourcePolicy,
  });

  factory GetResourcePolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetResourcePolicyResponse(
      resourceArn: json['ResourceArn'] as String?,
      resourcePolicy: json['ResourcePolicy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceArn = this.resourceArn;
    final resourcePolicy = this.resourcePolicy;
    return {
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (resourcePolicy != null) 'ResourcePolicy': resourcePolicy,
    };
  }
}

class GetTrailResponse {
  final Trail? trail;

  GetTrailResponse({
    this.trail,
  });

  factory GetTrailResponse.fromJson(Map<String, dynamic> json) {
    return GetTrailResponse(
      trail: json['Trail'] != null
          ? Trail.fromJson(json['Trail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final trail = this.trail;
    return {
      if (trail != null) 'Trail': trail,
    };
  }
}

/// Returns the objects or data listed below if successful. Otherwise, returns
/// an error.
class GetTrailStatusResponse {
  /// Whether the CloudTrail trail is currently logging Amazon Web Services API
  /// calls.
  final bool? isLogging;

  /// Displays any CloudWatch Logs error that CloudTrail encountered when
  /// attempting to deliver logs to CloudWatch Logs.
  final String? latestCloudWatchLogsDeliveryError;

  /// Displays the most recent date and time when CloudTrail delivered logs to
  /// CloudWatch Logs.
  final DateTime? latestCloudWatchLogsDeliveryTime;

  /// This field is no longer in use.
  final String? latestDeliveryAttemptSucceeded;

  /// This field is no longer in use.
  final String? latestDeliveryAttemptTime;

  /// Displays any Amazon S3 error that CloudTrail encountered when attempting to
  /// deliver log files to the designated bucket. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/ErrorResponses.html">Error
  /// Responses</a> in the Amazon S3 API Reference.
  /// <note>
  /// This error occurs only when there is a problem with the destination S3
  /// bucket, and does not occur for requests that time out. To resolve the issue,
  /// fix the <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/create-s3-bucket-policy-for-cloudtrail.html">bucket
  /// policy</a> so that CloudTrail can write to the bucket; or create a new
  /// bucket and call <code>UpdateTrail</code> to specify the new bucket.
  /// </note>
  final String? latestDeliveryError;

  /// Specifies the date and time that CloudTrail last delivered log files to an
  /// account's Amazon S3 bucket.
  final DateTime? latestDeliveryTime;

  /// Displays any Amazon S3 error that CloudTrail encountered when attempting to
  /// deliver a digest file to the designated bucket. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/ErrorResponses.html">Error
  /// Responses</a> in the Amazon S3 API Reference.
  /// <note>
  /// This error occurs only when there is a problem with the destination S3
  /// bucket, and does not occur for requests that time out. To resolve the issue,
  /// fix the <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/create-s3-bucket-policy-for-cloudtrail.html">bucket
  /// policy</a> so that CloudTrail can write to the bucket; or create a new
  /// bucket and call <code>UpdateTrail</code> to specify the new bucket.
  /// </note>
  final String? latestDigestDeliveryError;

  /// Specifies the date and time that CloudTrail last delivered a digest file to
  /// an account's Amazon S3 bucket.
  final DateTime? latestDigestDeliveryTime;

  /// This field is no longer in use.
  final String? latestNotificationAttemptSucceeded;

  /// This field is no longer in use.
  final String? latestNotificationAttemptTime;

  /// Displays any Amazon SNS error that CloudTrail encountered when attempting to
  /// send a notification. For more information about Amazon SNS errors, see the
  /// <a href="https://docs.aws.amazon.com/sns/latest/dg/welcome.html">Amazon SNS
  /// Developer Guide</a>.
  final String? latestNotificationError;

  /// Specifies the date and time of the most recent Amazon SNS notification that
  /// CloudTrail has written a new log file to an account's Amazon S3 bucket.
  final DateTime? latestNotificationTime;

  /// Specifies the most recent date and time when CloudTrail started recording
  /// API calls for an Amazon Web Services account.
  final DateTime? startLoggingTime;

  /// Specifies the most recent date and time when CloudTrail stopped recording
  /// API calls for an Amazon Web Services account.
  final DateTime? stopLoggingTime;

  /// This field is no longer in use.
  final String? timeLoggingStarted;

  /// This field is no longer in use.
  final String? timeLoggingStopped;

  GetTrailStatusResponse({
    this.isLogging,
    this.latestCloudWatchLogsDeliveryError,
    this.latestCloudWatchLogsDeliveryTime,
    this.latestDeliveryAttemptSucceeded,
    this.latestDeliveryAttemptTime,
    this.latestDeliveryError,
    this.latestDeliveryTime,
    this.latestDigestDeliveryError,
    this.latestDigestDeliveryTime,
    this.latestNotificationAttemptSucceeded,
    this.latestNotificationAttemptTime,
    this.latestNotificationError,
    this.latestNotificationTime,
    this.startLoggingTime,
    this.stopLoggingTime,
    this.timeLoggingStarted,
    this.timeLoggingStopped,
  });

  factory GetTrailStatusResponse.fromJson(Map<String, dynamic> json) {
    return GetTrailStatusResponse(
      isLogging: json['IsLogging'] as bool?,
      latestCloudWatchLogsDeliveryError:
          json['LatestCloudWatchLogsDeliveryError'] as String?,
      latestCloudWatchLogsDeliveryTime:
          timeStampFromJson(json['LatestCloudWatchLogsDeliveryTime']),
      latestDeliveryAttemptSucceeded:
          json['LatestDeliveryAttemptSucceeded'] as String?,
      latestDeliveryAttemptTime: json['LatestDeliveryAttemptTime'] as String?,
      latestDeliveryError: json['LatestDeliveryError'] as String?,
      latestDeliveryTime: timeStampFromJson(json['LatestDeliveryTime']),
      latestDigestDeliveryError: json['LatestDigestDeliveryError'] as String?,
      latestDigestDeliveryTime:
          timeStampFromJson(json['LatestDigestDeliveryTime']),
      latestNotificationAttemptSucceeded:
          json['LatestNotificationAttemptSucceeded'] as String?,
      latestNotificationAttemptTime:
          json['LatestNotificationAttemptTime'] as String?,
      latestNotificationError: json['LatestNotificationError'] as String?,
      latestNotificationTime: timeStampFromJson(json['LatestNotificationTime']),
      startLoggingTime: timeStampFromJson(json['StartLoggingTime']),
      stopLoggingTime: timeStampFromJson(json['StopLoggingTime']),
      timeLoggingStarted: json['TimeLoggingStarted'] as String?,
      timeLoggingStopped: json['TimeLoggingStopped'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final isLogging = this.isLogging;
    final latestCloudWatchLogsDeliveryError =
        this.latestCloudWatchLogsDeliveryError;
    final latestCloudWatchLogsDeliveryTime =
        this.latestCloudWatchLogsDeliveryTime;
    final latestDeliveryAttemptSucceeded = this.latestDeliveryAttemptSucceeded;
    final latestDeliveryAttemptTime = this.latestDeliveryAttemptTime;
    final latestDeliveryError = this.latestDeliveryError;
    final latestDeliveryTime = this.latestDeliveryTime;
    final latestDigestDeliveryError = this.latestDigestDeliveryError;
    final latestDigestDeliveryTime = this.latestDigestDeliveryTime;
    final latestNotificationAttemptSucceeded =
        this.latestNotificationAttemptSucceeded;
    final latestNotificationAttemptTime = this.latestNotificationAttemptTime;
    final latestNotificationError = this.latestNotificationError;
    final latestNotificationTime = this.latestNotificationTime;
    final startLoggingTime = this.startLoggingTime;
    final stopLoggingTime = this.stopLoggingTime;
    final timeLoggingStarted = this.timeLoggingStarted;
    final timeLoggingStopped = this.timeLoggingStopped;
    return {
      if (isLogging != null) 'IsLogging': isLogging,
      if (latestCloudWatchLogsDeliveryError != null)
        'LatestCloudWatchLogsDeliveryError': latestCloudWatchLogsDeliveryError,
      if (latestCloudWatchLogsDeliveryTime != null)
        'LatestCloudWatchLogsDeliveryTime':
            unixTimestampToJson(latestCloudWatchLogsDeliveryTime),
      if (latestDeliveryAttemptSucceeded != null)
        'LatestDeliveryAttemptSucceeded': latestDeliveryAttemptSucceeded,
      if (latestDeliveryAttemptTime != null)
        'LatestDeliveryAttemptTime': latestDeliveryAttemptTime,
      if (latestDeliveryError != null)
        'LatestDeliveryError': latestDeliveryError,
      if (latestDeliveryTime != null)
        'LatestDeliveryTime': unixTimestampToJson(latestDeliveryTime),
      if (latestDigestDeliveryError != null)
        'LatestDigestDeliveryError': latestDigestDeliveryError,
      if (latestDigestDeliveryTime != null)
        'LatestDigestDeliveryTime':
            unixTimestampToJson(latestDigestDeliveryTime),
      if (latestNotificationAttemptSucceeded != null)
        'LatestNotificationAttemptSucceeded':
            latestNotificationAttemptSucceeded,
      if (latestNotificationAttemptTime != null)
        'LatestNotificationAttemptTime': latestNotificationAttemptTime,
      if (latestNotificationError != null)
        'LatestNotificationError': latestNotificationError,
      if (latestNotificationTime != null)
        'LatestNotificationTime': unixTimestampToJson(latestNotificationTime),
      if (startLoggingTime != null)
        'StartLoggingTime': unixTimestampToJson(startLoggingTime),
      if (stopLoggingTime != null)
        'StopLoggingTime': unixTimestampToJson(stopLoggingTime),
      if (timeLoggingStarted != null) 'TimeLoggingStarted': timeLoggingStarted,
      if (timeLoggingStopped != null) 'TimeLoggingStopped': timeLoggingStopped,
    };
  }
}

/// Provides information about an import failure.
class ImportFailureListItem {
  /// Provides the reason the import failed.
  final String? errorMessage;

  /// The type of import error.
  final String? errorType;

  /// When the import was last updated.
  final DateTime? lastUpdatedTime;

  /// The location of the failure in the S3 bucket.
  final String? location;

  /// The status of the import.
  final ImportFailureStatus? status;

  ImportFailureListItem({
    this.errorMessage,
    this.errorType,
    this.lastUpdatedTime,
    this.location,
    this.status,
  });

  factory ImportFailureListItem.fromJson(Map<String, dynamic> json) {
    return ImportFailureListItem(
      errorMessage: json['ErrorMessage'] as String?,
      errorType: json['ErrorType'] as String?,
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      location: json['Location'] as String?,
      status: (json['Status'] as String?)?.toImportFailureStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final errorMessage = this.errorMessage;
    final errorType = this.errorType;
    final lastUpdatedTime = this.lastUpdatedTime;
    final location = this.location;
    final status = this.status;
    return {
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (errorType != null) 'ErrorType': errorType,
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (location != null) 'Location': location,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum ImportFailureStatus {
  failed,
  retry,
  succeeded,
}

extension ImportFailureStatusValueExtension on ImportFailureStatus {
  String toValue() {
    switch (this) {
      case ImportFailureStatus.failed:
        return 'FAILED';
      case ImportFailureStatus.retry:
        return 'RETRY';
      case ImportFailureStatus.succeeded:
        return 'SUCCEEDED';
    }
  }
}

extension ImportFailureStatusFromString on String {
  ImportFailureStatus toImportFailureStatus() {
    switch (this) {
      case 'FAILED':
        return ImportFailureStatus.failed;
      case 'RETRY':
        return ImportFailureStatus.retry;
      case 'SUCCEEDED':
        return ImportFailureStatus.succeeded;
    }
    throw Exception('$this is not known in enum ImportFailureStatus');
  }
}

/// The import source.
class ImportSource {
  /// The source S3 bucket.
  final S3ImportSource s3;

  ImportSource({
    required this.s3,
  });

  factory ImportSource.fromJson(Map<String, dynamic> json) {
    return ImportSource(
      s3: S3ImportSource.fromJson(json['S3'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final s3 = this.s3;
    return {
      'S3': s3,
    };
  }
}

/// Provides statistics for the specified <code>ImportID</code>. CloudTrail does
/// not update import statistics in real-time. Returned values for parameters
/// such as <code>EventsCompleted</code> may be lower than the actual value,
/// because CloudTrail updates statistics incrementally over the course of the
/// import.
class ImportStatistics {
  /// The number of trail events imported into the event data store.
  final int? eventsCompleted;

  /// The number of failed entries.
  final int? failedEntries;

  /// The number of log files that completed import.
  final int? filesCompleted;

  /// The number of S3 prefixes that completed import.
  final int? prefixesCompleted;

  /// The number of S3 prefixes found for the import.
  final int? prefixesFound;

  ImportStatistics({
    this.eventsCompleted,
    this.failedEntries,
    this.filesCompleted,
    this.prefixesCompleted,
    this.prefixesFound,
  });

  factory ImportStatistics.fromJson(Map<String, dynamic> json) {
    return ImportStatistics(
      eventsCompleted: json['EventsCompleted'] as int?,
      failedEntries: json['FailedEntries'] as int?,
      filesCompleted: json['FilesCompleted'] as int?,
      prefixesCompleted: json['PrefixesCompleted'] as int?,
      prefixesFound: json['PrefixesFound'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventsCompleted = this.eventsCompleted;
    final failedEntries = this.failedEntries;
    final filesCompleted = this.filesCompleted;
    final prefixesCompleted = this.prefixesCompleted;
    final prefixesFound = this.prefixesFound;
    return {
      if (eventsCompleted != null) 'EventsCompleted': eventsCompleted,
      if (failedEntries != null) 'FailedEntries': failedEntries,
      if (filesCompleted != null) 'FilesCompleted': filesCompleted,
      if (prefixesCompleted != null) 'PrefixesCompleted': prefixesCompleted,
      if (prefixesFound != null) 'PrefixesFound': prefixesFound,
    };
  }
}

enum ImportStatus {
  initializing,
  inProgress,
  failed,
  stopped,
  completed,
}

extension ImportStatusValueExtension on ImportStatus {
  String toValue() {
    switch (this) {
      case ImportStatus.initializing:
        return 'INITIALIZING';
      case ImportStatus.inProgress:
        return 'IN_PROGRESS';
      case ImportStatus.failed:
        return 'FAILED';
      case ImportStatus.stopped:
        return 'STOPPED';
      case ImportStatus.completed:
        return 'COMPLETED';
    }
  }
}

extension ImportStatusFromString on String {
  ImportStatus toImportStatus() {
    switch (this) {
      case 'INITIALIZING':
        return ImportStatus.initializing;
      case 'IN_PROGRESS':
        return ImportStatus.inProgress;
      case 'FAILED':
        return ImportStatus.failed;
      case 'STOPPED':
        return ImportStatus.stopped;
      case 'COMPLETED':
        return ImportStatus.completed;
    }
    throw Exception('$this is not known in enum ImportStatus');
  }
}

/// Contains information about an import that was returned by a lookup request.
class ImportsListItem {
  /// The timestamp of the import's creation.
  final DateTime? createdTimestamp;

  /// The ARN of the destination event data store.
  final List<String>? destinations;

  /// The ID of the import.
  final String? importId;

  /// The status of the import.
  final ImportStatus? importStatus;

  /// The timestamp of the import's last update.
  final DateTime? updatedTimestamp;

  ImportsListItem({
    this.createdTimestamp,
    this.destinations,
    this.importId,
    this.importStatus,
    this.updatedTimestamp,
  });

  factory ImportsListItem.fromJson(Map<String, dynamic> json) {
    return ImportsListItem(
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      destinations: (json['Destinations'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      importId: json['ImportId'] as String?,
      importStatus: (json['ImportStatus'] as String?)?.toImportStatus(),
      updatedTimestamp: timeStampFromJson(json['UpdatedTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final destinations = this.destinations;
    final importId = this.importId;
    final importStatus = this.importStatus;
    final updatedTimestamp = this.updatedTimestamp;
    return {
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (destinations != null) 'Destinations': destinations,
      if (importId != null) 'ImportId': importId,
      if (importStatus != null) 'ImportStatus': importStatus.toValue(),
      if (updatedTimestamp != null)
        'UpdatedTimestamp': unixTimestampToJson(updatedTimestamp),
    };
  }
}

/// A table showing information about the most recent successful and failed
/// attempts to ingest events.
class IngestionStatus {
  /// The event ID of the most recent attempt to ingest events.
  final String? latestIngestionAttemptEventID;

  /// The time stamp of the most recent attempt to ingest events on the channel.
  final DateTime? latestIngestionAttemptTime;

  /// The error code for the most recent failure to ingest events.
  final String? latestIngestionErrorCode;

  /// The event ID of the most recent successful ingestion of events.
  final String? latestIngestionSuccessEventID;

  /// The time stamp of the most recent successful ingestion of events for the
  /// channel.
  final DateTime? latestIngestionSuccessTime;

  IngestionStatus({
    this.latestIngestionAttemptEventID,
    this.latestIngestionAttemptTime,
    this.latestIngestionErrorCode,
    this.latestIngestionSuccessEventID,
    this.latestIngestionSuccessTime,
  });

  factory IngestionStatus.fromJson(Map<String, dynamic> json) {
    return IngestionStatus(
      latestIngestionAttemptEventID:
          json['LatestIngestionAttemptEventID'] as String?,
      latestIngestionAttemptTime:
          timeStampFromJson(json['LatestIngestionAttemptTime']),
      latestIngestionErrorCode: json['LatestIngestionErrorCode'] as String?,
      latestIngestionSuccessEventID:
          json['LatestIngestionSuccessEventID'] as String?,
      latestIngestionSuccessTime:
          timeStampFromJson(json['LatestIngestionSuccessTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final latestIngestionAttemptEventID = this.latestIngestionAttemptEventID;
    final latestIngestionAttemptTime = this.latestIngestionAttemptTime;
    final latestIngestionErrorCode = this.latestIngestionErrorCode;
    final latestIngestionSuccessEventID = this.latestIngestionSuccessEventID;
    final latestIngestionSuccessTime = this.latestIngestionSuccessTime;
    return {
      if (latestIngestionAttemptEventID != null)
        'LatestIngestionAttemptEventID': latestIngestionAttemptEventID,
      if (latestIngestionAttemptTime != null)
        'LatestIngestionAttemptTime':
            unixTimestampToJson(latestIngestionAttemptTime),
      if (latestIngestionErrorCode != null)
        'LatestIngestionErrorCode': latestIngestionErrorCode,
      if (latestIngestionSuccessEventID != null)
        'LatestIngestionSuccessEventID': latestIngestionSuccessEventID,
      if (latestIngestionSuccessTime != null)
        'LatestIngestionSuccessTime':
            unixTimestampToJson(latestIngestionSuccessTime),
    };
  }
}

/// A JSON string that contains a list of Insights types that are logged on a
/// trail or event data store.
class InsightSelector {
  /// The type of Insights events to log on a trail or event data store.
  /// <code>ApiCallRateInsight</code> and <code>ApiErrorRateInsight</code> are
  /// valid Insight types.
  ///
  /// The <code>ApiCallRateInsight</code> Insights type analyzes write-only
  /// management API calls that are aggregated per minute against a baseline API
  /// call volume.
  ///
  /// The <code>ApiErrorRateInsight</code> Insights type analyzes management API
  /// calls that result in error codes. The error is shown if the API call is
  /// unsuccessful.
  final InsightType? insightType;

  InsightSelector({
    this.insightType,
  });

  factory InsightSelector.fromJson(Map<String, dynamic> json) {
    return InsightSelector(
      insightType: (json['InsightType'] as String?)?.toInsightType(),
    );
  }

  Map<String, dynamic> toJson() {
    final insightType = this.insightType;
    return {
      if (insightType != null) 'InsightType': insightType.toValue(),
    };
  }
}

enum InsightType {
  apiCallRateInsight,
  apiErrorRateInsight,
}

extension InsightTypeValueExtension on InsightType {
  String toValue() {
    switch (this) {
      case InsightType.apiCallRateInsight:
        return 'ApiCallRateInsight';
      case InsightType.apiErrorRateInsight:
        return 'ApiErrorRateInsight';
    }
  }
}

extension InsightTypeFromString on String {
  InsightType toInsightType() {
    switch (this) {
      case 'ApiCallRateInsight':
        return InsightType.apiCallRateInsight;
      case 'ApiErrorRateInsight':
        return InsightType.apiErrorRateInsight;
    }
    throw Exception('$this is not known in enum InsightType');
  }
}

enum InsightsMetricDataType {
  fillWithZeros,
  nonZeroData,
}

extension InsightsMetricDataTypeValueExtension on InsightsMetricDataType {
  String toValue() {
    switch (this) {
      case InsightsMetricDataType.fillWithZeros:
        return 'FillWithZeros';
      case InsightsMetricDataType.nonZeroData:
        return 'NonZeroData';
    }
  }
}

extension InsightsMetricDataTypeFromString on String {
  InsightsMetricDataType toInsightsMetricDataType() {
    switch (this) {
      case 'FillWithZeros':
        return InsightsMetricDataType.fillWithZeros;
      case 'NonZeroData':
        return InsightsMetricDataType.nonZeroData;
    }
    throw Exception('$this is not known in enum InsightsMetricDataType');
  }
}

class ListChannelsResponse {
  /// The list of channels in the account.
  final List<Channel>? channels;

  /// The token to use to get the next page of results after a previous API call.
  final String? nextToken;

  ListChannelsResponse({
    this.channels,
    this.nextToken,
  });

  factory ListChannelsResponse.fromJson(Map<String, dynamic> json) {
    return ListChannelsResponse(
      channels: (json['Channels'] as List?)
          ?.whereNotNull()
          .map((e) => Channel.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channels = this.channels;
    final nextToken = this.nextToken;
    return {
      if (channels != null) 'Channels': channels,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListEventDataStoresResponse {
  /// Contains information about event data stores in the account, in the current
  /// Region.
  final List<EventDataStore>? eventDataStores;

  /// A token you can use to get the next page of results.
  final String? nextToken;

  ListEventDataStoresResponse({
    this.eventDataStores,
    this.nextToken,
  });

  factory ListEventDataStoresResponse.fromJson(Map<String, dynamic> json) {
    return ListEventDataStoresResponse(
      eventDataStores: (json['EventDataStores'] as List?)
          ?.whereNotNull()
          .map((e) => EventDataStore.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventDataStores = this.eventDataStores;
    final nextToken = this.nextToken;
    return {
      if (eventDataStores != null) 'EventDataStores': eventDataStores,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListImportFailuresResponse {
  /// Contains information about the import failures.
  final List<ImportFailureListItem>? failures;

  /// A token you can use to get the next page of results.
  final String? nextToken;

  ListImportFailuresResponse({
    this.failures,
    this.nextToken,
  });

  factory ListImportFailuresResponse.fromJson(Map<String, dynamic> json) {
    return ListImportFailuresResponse(
      failures: (json['Failures'] as List?)
          ?.whereNotNull()
          .map((e) => ImportFailureListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final failures = this.failures;
    final nextToken = this.nextToken;
    return {
      if (failures != null) 'Failures': failures,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListImportsResponse {
  /// The list of returned imports.
  final List<ImportsListItem>? imports;

  /// A token you can use to get the next page of import results.
  final String? nextToken;

  ListImportsResponse({
    this.imports,
    this.nextToken,
  });

  factory ListImportsResponse.fromJson(Map<String, dynamic> json) {
    return ListImportsResponse(
      imports: (json['Imports'] as List?)
          ?.whereNotNull()
          .map((e) => ImportsListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final imports = this.imports;
    final nextToken = this.nextToken;
    return {
      if (imports != null) 'Imports': imports,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListInsightsMetricDataResponse {
  /// Only returned if <code>InsightType</code> parameter was set to
  /// <code>ApiErrorRateInsight</code>.
  ///
  /// If returning metrics for the <code>ApiErrorRateInsight</code> Insights type,
  /// this is the error to retrieve data for. For example,
  /// <code>AccessDenied</code>.
  final String? errorCode;

  /// The name of the event, typically the Amazon Web Services API on which
  /// unusual levels of activity were recorded.
  final String? eventName;

  /// The Amazon Web Services service to which the request was made, such as
  /// <code>iam.amazonaws.com</code> or <code>s3.amazonaws.com</code>.
  final String? eventSource;

  /// The type of CloudTrail Insights event, which is either
  /// <code>ApiCallRateInsight</code> or <code>ApiErrorRateInsight</code>. The
  /// <code>ApiCallRateInsight</code> Insights type analyzes write-only management
  /// API calls that are aggregated per minute against a baseline API call volume.
  /// The <code>ApiErrorRateInsight</code> Insights type analyzes management API
  /// calls that result in error codes.
  final InsightType? insightType;

  /// Only returned if the full results could not be returned in a single query.
  /// You can set the <code>NextToken</code> parameter in the next request to this
  /// value to continue retrieval.
  final String? nextToken;

  /// List of timestamps at intervals corresponding to the specified time period.
  final List<DateTime>? timestamps;

  /// List of values representing the API call rate or error rate at each
  /// timestamp. The number of values is equal to the number of timestamps.
  final List<double>? values;

  ListInsightsMetricDataResponse({
    this.errorCode,
    this.eventName,
    this.eventSource,
    this.insightType,
    this.nextToken,
    this.timestamps,
    this.values,
  });

  factory ListInsightsMetricDataResponse.fromJson(Map<String, dynamic> json) {
    return ListInsightsMetricDataResponse(
      errorCode: json['ErrorCode'] as String?,
      eventName: json['EventName'] as String?,
      eventSource: json['EventSource'] as String?,
      insightType: (json['InsightType'] as String?)?.toInsightType(),
      nextToken: json['NextToken'] as String?,
      timestamps: (json['Timestamps'] as List?)
          ?.whereNotNull()
          .map(nonNullableTimeStampFromJson)
          .toList(),
      values: (json['Values'] as List?)
          ?.whereNotNull()
          .map((e) => e as double)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final eventName = this.eventName;
    final eventSource = this.eventSource;
    final insightType = this.insightType;
    final nextToken = this.nextToken;
    final timestamps = this.timestamps;
    final values = this.values;
    return {
      if (errorCode != null) 'ErrorCode': errorCode,
      if (eventName != null) 'EventName': eventName,
      if (eventSource != null) 'EventSource': eventSource,
      if (insightType != null) 'InsightType': insightType.toValue(),
      if (nextToken != null) 'NextToken': nextToken,
      if (timestamps != null)
        'Timestamps': timestamps.map(unixTimestampToJson).toList(),
      if (values != null) 'Values': values,
    };
  }
}

/// Returns the objects or data listed below if successful. Otherwise, returns
/// an error.
class ListPublicKeysResponse {
  /// Reserved for future use.
  final String? nextToken;

  /// Contains an array of PublicKey objects.
  /// <note>
  /// The returned public keys may have validity time ranges that overlap.
  /// </note>
  final List<PublicKey>? publicKeyList;

  ListPublicKeysResponse({
    this.nextToken,
    this.publicKeyList,
  });

  factory ListPublicKeysResponse.fromJson(Map<String, dynamic> json) {
    return ListPublicKeysResponse(
      nextToken: json['NextToken'] as String?,
      publicKeyList: (json['PublicKeyList'] as List?)
          ?.whereNotNull()
          .map((e) => PublicKey.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final publicKeyList = this.publicKeyList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (publicKeyList != null) 'PublicKeyList': publicKeyList,
    };
  }
}

class ListQueriesResponse {
  /// A token you can use to get the next page of results.
  final String? nextToken;

  /// Lists matching query results, and shows query ID, status, and creation time
  /// of each query.
  final List<Query>? queries;

  ListQueriesResponse({
    this.nextToken,
    this.queries,
  });

  factory ListQueriesResponse.fromJson(Map<String, dynamic> json) {
    return ListQueriesResponse(
      nextToken: json['NextToken'] as String?,
      queries: (json['Queries'] as List?)
          ?.whereNotNull()
          .map((e) => Query.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final queries = this.queries;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (queries != null) 'Queries': queries,
    };
  }
}

/// Returns the objects or data listed below if successful. Otherwise, returns
/// an error.
class ListTagsResponse {
  /// Reserved for future use.
  final String? nextToken;

  /// A list of resource tags.
  final List<ResourceTag>? resourceTagList;

  ListTagsResponse({
    this.nextToken,
    this.resourceTagList,
  });

  factory ListTagsResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsResponse(
      nextToken: json['NextToken'] as String?,
      resourceTagList: (json['ResourceTagList'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceTag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final resourceTagList = this.resourceTagList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (resourceTagList != null) 'ResourceTagList': resourceTagList,
    };
  }
}

class ListTrailsResponse {
  /// The token to use to get the next page of results after a previous API call.
  /// If the token does not appear, there are no more results to return. The token
  /// must be passed in with the same parameters as the previous call. For
  /// example, if the original call specified an AttributeKey of 'Username' with a
  /// value of 'root', the call with NextToken should include those same
  /// parameters.
  final String? nextToken;

  /// Returns the name, ARN, and home Region of trails in the current account.
  final List<TrailInfo>? trails;

  ListTrailsResponse({
    this.nextToken,
    this.trails,
  });

  factory ListTrailsResponse.fromJson(Map<String, dynamic> json) {
    return ListTrailsResponse(
      nextToken: json['NextToken'] as String?,
      trails: (json['Trails'] as List?)
          ?.whereNotNull()
          .map((e) => TrailInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final trails = this.trails;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (trails != null) 'Trails': trails,
    };
  }
}

/// Specifies an attribute and value that filter the events returned.
class LookupAttribute {
  /// Specifies an attribute on which to filter the events returned.
  final LookupAttributeKey attributeKey;

  /// Specifies a value for the specified <code>AttributeKey</code>.
  ///
  /// The maximum length for the <code>AttributeValue</code> is 2000 characters.
  /// The following characters ('<code>_</code>', '<code> </code>',
  /// '<code>,</code>', '<code>\\n</code>') count as two characters towards the
  /// 2000 character limit.
  final String attributeValue;

  LookupAttribute({
    required this.attributeKey,
    required this.attributeValue,
  });

  Map<String, dynamic> toJson() {
    final attributeKey = this.attributeKey;
    final attributeValue = this.attributeValue;
    return {
      'AttributeKey': attributeKey.toValue(),
      'AttributeValue': attributeValue,
    };
  }
}

enum LookupAttributeKey {
  eventId,
  eventName,
  readOnly,
  username,
  resourceType,
  resourceName,
  eventSource,
  accessKeyId,
}

extension LookupAttributeKeyValueExtension on LookupAttributeKey {
  String toValue() {
    switch (this) {
      case LookupAttributeKey.eventId:
        return 'EventId';
      case LookupAttributeKey.eventName:
        return 'EventName';
      case LookupAttributeKey.readOnly:
        return 'ReadOnly';
      case LookupAttributeKey.username:
        return 'Username';
      case LookupAttributeKey.resourceType:
        return 'ResourceType';
      case LookupAttributeKey.resourceName:
        return 'ResourceName';
      case LookupAttributeKey.eventSource:
        return 'EventSource';
      case LookupAttributeKey.accessKeyId:
        return 'AccessKeyId';
    }
  }
}

extension LookupAttributeKeyFromString on String {
  LookupAttributeKey toLookupAttributeKey() {
    switch (this) {
      case 'EventId':
        return LookupAttributeKey.eventId;
      case 'EventName':
        return LookupAttributeKey.eventName;
      case 'ReadOnly':
        return LookupAttributeKey.readOnly;
      case 'Username':
        return LookupAttributeKey.username;
      case 'ResourceType':
        return LookupAttributeKey.resourceType;
      case 'ResourceName':
        return LookupAttributeKey.resourceName;
      case 'EventSource':
        return LookupAttributeKey.eventSource;
      case 'AccessKeyId':
        return LookupAttributeKey.accessKeyId;
    }
    throw Exception('$this is not known in enum LookupAttributeKey');
  }
}

/// Contains a response to a LookupEvents action.
class LookupEventsResponse {
  /// A list of events returned based on the lookup attributes specified and the
  /// CloudTrail event. The events list is sorted by time. The most recent event
  /// is listed first.
  final List<Event>? events;

  /// The token to use to get the next page of results after a previous API call.
  /// If the token does not appear, there are no more results to return. The token
  /// must be passed in with the same parameters as the previous call. For
  /// example, if the original call specified an AttributeKey of 'Username' with a
  /// value of 'root', the call with NextToken should include those same
  /// parameters.
  final String? nextToken;

  LookupEventsResponse({
    this.events,
    this.nextToken,
  });

  factory LookupEventsResponse.fromJson(Map<String, dynamic> json) {
    return LookupEventsResponse(
      events: (json['Events'] as List?)
          ?.whereNotNull()
          .map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final events = this.events;
    final nextToken = this.nextToken;
    return {
      if (events != null) 'Events': events,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Contains information about a partition key for an event data store.
class PartitionKey {
  /// The name of the partition key.
  final String name;

  /// The data type of the partition key. For example, <code>bigint</code> or
  /// <code>string</code>.
  final String type;

  PartitionKey({
    required this.name,
    required this.type,
  });

  factory PartitionKey.fromJson(Map<String, dynamic> json) {
    return PartitionKey(
      name: json['Name'] as String,
      type: json['Type'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    return {
      'Name': name,
      'Type': type,
    };
  }
}

/// Contains information about a returned public key.
class PublicKey {
  /// The fingerprint of the public key.
  final String? fingerprint;

  /// The ending time of validity of the public key.
  final DateTime? validityEndTime;

  /// The starting time of validity of the public key.
  final DateTime? validityStartTime;

  /// The DER encoded public key value in PKCS#1 format.
  final Uint8List? value;

  PublicKey({
    this.fingerprint,
    this.validityEndTime,
    this.validityStartTime,
    this.value,
  });

  factory PublicKey.fromJson(Map<String, dynamic> json) {
    return PublicKey(
      fingerprint: json['Fingerprint'] as String?,
      validityEndTime: timeStampFromJson(json['ValidityEndTime']),
      validityStartTime: timeStampFromJson(json['ValidityStartTime']),
      value: _s.decodeNullableUint8List(json['Value'] as String?),
    );
  }

  Map<String, dynamic> toJson() {
    final fingerprint = this.fingerprint;
    final validityEndTime = this.validityEndTime;
    final validityStartTime = this.validityStartTime;
    final value = this.value;
    return {
      if (fingerprint != null) 'Fingerprint': fingerprint,
      if (validityEndTime != null)
        'ValidityEndTime': unixTimestampToJson(validityEndTime),
      if (validityStartTime != null)
        'ValidityStartTime': unixTimestampToJson(validityStartTime),
      if (value != null) 'Value': base64Encode(value),
    };
  }
}

class PutEventSelectorsResponse {
  /// Specifies the advanced event selectors configured for your trail.
  final List<AdvancedEventSelector>? advancedEventSelectors;

  /// Specifies the event selectors configured for your trail.
  final List<EventSelector>? eventSelectors;

  /// Specifies the ARN of the trail that was updated with event selectors. The
  /// following is the format of a trail ARN.
  ///
  /// <code>arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail</code>
  final String? trailARN;

  PutEventSelectorsResponse({
    this.advancedEventSelectors,
    this.eventSelectors,
    this.trailARN,
  });

  factory PutEventSelectorsResponse.fromJson(Map<String, dynamic> json) {
    return PutEventSelectorsResponse(
      advancedEventSelectors: (json['AdvancedEventSelectors'] as List?)
          ?.whereNotNull()
          .map((e) => AdvancedEventSelector.fromJson(e as Map<String, dynamic>))
          .toList(),
      eventSelectors: (json['EventSelectors'] as List?)
          ?.whereNotNull()
          .map((e) => EventSelector.fromJson(e as Map<String, dynamic>))
          .toList(),
      trailARN: json['TrailARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final advancedEventSelectors = this.advancedEventSelectors;
    final eventSelectors = this.eventSelectors;
    final trailARN = this.trailARN;
    return {
      if (advancedEventSelectors != null)
        'AdvancedEventSelectors': advancedEventSelectors,
      if (eventSelectors != null) 'EventSelectors': eventSelectors,
      if (trailARN != null) 'TrailARN': trailARN,
    };
  }
}

class PutInsightSelectorsResponse {
  /// The Amazon Resource Name (ARN) of the source event data store for which you
  /// want to change or add Insights selectors.
  final String? eventDataStoreArn;

  /// A JSON string that contains the Insights event types that you want to log on
  /// a trail or event data store. The valid Insights types are
  /// <code>ApiErrorRateInsight</code> and <code>ApiCallRateInsight</code>.
  final List<InsightSelector>? insightSelectors;

  /// The ARN of the destination event data store that logs Insights events.
  final String? insightsDestination;

  /// The Amazon Resource Name (ARN) of a trail for which you want to change or
  /// add Insights selectors.
  final String? trailARN;

  PutInsightSelectorsResponse({
    this.eventDataStoreArn,
    this.insightSelectors,
    this.insightsDestination,
    this.trailARN,
  });

  factory PutInsightSelectorsResponse.fromJson(Map<String, dynamic> json) {
    return PutInsightSelectorsResponse(
      eventDataStoreArn: json['EventDataStoreArn'] as String?,
      insightSelectors: (json['InsightSelectors'] as List?)
          ?.whereNotNull()
          .map((e) => InsightSelector.fromJson(e as Map<String, dynamic>))
          .toList(),
      insightsDestination: json['InsightsDestination'] as String?,
      trailARN: json['TrailARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventDataStoreArn = this.eventDataStoreArn;
    final insightSelectors = this.insightSelectors;
    final insightsDestination = this.insightsDestination;
    final trailARN = this.trailARN;
    return {
      if (eventDataStoreArn != null) 'EventDataStoreArn': eventDataStoreArn,
      if (insightSelectors != null) 'InsightSelectors': insightSelectors,
      if (insightsDestination != null)
        'InsightsDestination': insightsDestination,
      if (trailARN != null) 'TrailARN': trailARN,
    };
  }
}

class PutResourcePolicyResponse {
  /// The Amazon Resource Name (ARN) of the CloudTrail channel attached to the
  /// resource-based policy.
  final String? resourceArn;

  /// The JSON-formatted string of the Amazon Web Services resource-based policy
  /// attached to the CloudTrail channel.
  final String? resourcePolicy;

  PutResourcePolicyResponse({
    this.resourceArn,
    this.resourcePolicy,
  });

  factory PutResourcePolicyResponse.fromJson(Map<String, dynamic> json) {
    return PutResourcePolicyResponse(
      resourceArn: json['ResourceArn'] as String?,
      resourcePolicy: json['ResourcePolicy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceArn = this.resourceArn;
    final resourcePolicy = this.resourcePolicy;
    return {
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (resourcePolicy != null) 'ResourcePolicy': resourcePolicy,
    };
  }
}

/// A SQL string of criteria about events that you want to collect in an event
/// data store.
class Query {
  /// The creation time of a query.
  final DateTime? creationTime;

  /// The ID of a query.
  final String? queryId;

  /// The status of the query. This can be <code>QUEUED</code>,
  /// <code>RUNNING</code>, <code>FINISHED</code>, <code>FAILED</code>,
  /// <code>TIMED_OUT</code>, or <code>CANCELLED</code>.
  final QueryStatus? queryStatus;

  Query({
    this.creationTime,
    this.queryId,
    this.queryStatus,
  });

  factory Query.fromJson(Map<String, dynamic> json) {
    return Query(
      creationTime: timeStampFromJson(json['CreationTime']),
      queryId: json['QueryId'] as String?,
      queryStatus: (json['QueryStatus'] as String?)?.toQueryStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final queryId = this.queryId;
    final queryStatus = this.queryStatus;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (queryId != null) 'QueryId': queryId,
      if (queryStatus != null) 'QueryStatus': queryStatus.toValue(),
    };
  }
}

/// Metadata about a query, such as the number of results.
class QueryStatistics {
  /// The total bytes that the query scanned in the event data store. This value
  /// matches the number of bytes for which your account is billed for the query,
  /// unless the query is still running.
  final int? bytesScanned;

  /// The number of results returned.
  final int? resultsCount;

  /// The total number of results returned by a query.
  final int? totalResultsCount;

  QueryStatistics({
    this.bytesScanned,
    this.resultsCount,
    this.totalResultsCount,
  });

  factory QueryStatistics.fromJson(Map<String, dynamic> json) {
    return QueryStatistics(
      bytesScanned: json['BytesScanned'] as int?,
      resultsCount: json['ResultsCount'] as int?,
      totalResultsCount: json['TotalResultsCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final bytesScanned = this.bytesScanned;
    final resultsCount = this.resultsCount;
    final totalResultsCount = this.totalResultsCount;
    return {
      if (bytesScanned != null) 'BytesScanned': bytesScanned,
      if (resultsCount != null) 'ResultsCount': resultsCount,
      if (totalResultsCount != null) 'TotalResultsCount': totalResultsCount,
    };
  }
}

/// Gets metadata about a query, including the number of events that were
/// matched, the total number of events scanned, the query run time in
/// milliseconds, and the query's creation time.
class QueryStatisticsForDescribeQuery {
  /// The total bytes that the query scanned in the event data store. This value
  /// matches the number of bytes for which your account is billed for the query,
  /// unless the query is still running.
  final int? bytesScanned;

  /// The creation time of the query.
  final DateTime? creationTime;

  /// The number of events that matched a query.
  final int? eventsMatched;

  /// The number of events that the query scanned in the event data store.
  final int? eventsScanned;

  /// The query's run time, in milliseconds.
  final int? executionTimeInMillis;

  QueryStatisticsForDescribeQuery({
    this.bytesScanned,
    this.creationTime,
    this.eventsMatched,
    this.eventsScanned,
    this.executionTimeInMillis,
  });

  factory QueryStatisticsForDescribeQuery.fromJson(Map<String, dynamic> json) {
    return QueryStatisticsForDescribeQuery(
      bytesScanned: json['BytesScanned'] as int?,
      creationTime: timeStampFromJson(json['CreationTime']),
      eventsMatched: json['EventsMatched'] as int?,
      eventsScanned: json['EventsScanned'] as int?,
      executionTimeInMillis: json['ExecutionTimeInMillis'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final bytesScanned = this.bytesScanned;
    final creationTime = this.creationTime;
    final eventsMatched = this.eventsMatched;
    final eventsScanned = this.eventsScanned;
    final executionTimeInMillis = this.executionTimeInMillis;
    return {
      if (bytesScanned != null) 'BytesScanned': bytesScanned,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (eventsMatched != null) 'EventsMatched': eventsMatched,
      if (eventsScanned != null) 'EventsScanned': eventsScanned,
      if (executionTimeInMillis != null)
        'ExecutionTimeInMillis': executionTimeInMillis,
    };
  }
}

enum QueryStatus {
  queued,
  running,
  finished,
  failed,
  cancelled,
  timedOut,
}

extension QueryStatusValueExtension on QueryStatus {
  String toValue() {
    switch (this) {
      case QueryStatus.queued:
        return 'QUEUED';
      case QueryStatus.running:
        return 'RUNNING';
      case QueryStatus.finished:
        return 'FINISHED';
      case QueryStatus.failed:
        return 'FAILED';
      case QueryStatus.cancelled:
        return 'CANCELLED';
      case QueryStatus.timedOut:
        return 'TIMED_OUT';
    }
  }
}

extension QueryStatusFromString on String {
  QueryStatus toQueryStatus() {
    switch (this) {
      case 'QUEUED':
        return QueryStatus.queued;
      case 'RUNNING':
        return QueryStatus.running;
      case 'FINISHED':
        return QueryStatus.finished;
      case 'FAILED':
        return QueryStatus.failed;
      case 'CANCELLED':
        return QueryStatus.cancelled;
      case 'TIMED_OUT':
        return QueryStatus.timedOut;
    }
    throw Exception('$this is not known in enum QueryStatus');
  }
}

enum ReadWriteType {
  readOnly,
  writeOnly,
  all,
}

extension ReadWriteTypeValueExtension on ReadWriteType {
  String toValue() {
    switch (this) {
      case ReadWriteType.readOnly:
        return 'ReadOnly';
      case ReadWriteType.writeOnly:
        return 'WriteOnly';
      case ReadWriteType.all:
        return 'All';
    }
  }
}

extension ReadWriteTypeFromString on String {
  ReadWriteType toReadWriteType() {
    switch (this) {
      case 'ReadOnly':
        return ReadWriteType.readOnly;
      case 'WriteOnly':
        return ReadWriteType.writeOnly;
      case 'All':
        return ReadWriteType.all;
    }
    throw Exception('$this is not known in enum ReadWriteType');
  }
}

/// Returns the following response if successful. Otherwise, returns an error.
class RegisterOrganizationDelegatedAdminResponse {
  RegisterOrganizationDelegatedAdminResponse();

  factory RegisterOrganizationDelegatedAdminResponse.fromJson(
      Map<String, dynamic> _) {
    return RegisterOrganizationDelegatedAdminResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Returns the objects or data listed below if successful. Otherwise, returns
/// an error.
class RemoveTagsResponse {
  RemoveTagsResponse();

  factory RemoveTagsResponse.fromJson(Map<String, dynamic> _) {
    return RemoveTagsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Specifies the type and name of a resource referenced by an event.
class Resource {
  /// The name of the resource referenced by the event returned. These are
  /// user-created names whose values will depend on the environment. For example,
  /// the resource name might be "auto-scaling-test-group" for an Auto Scaling
  /// Group or "i-1234567" for an EC2 Instance.
  final String? resourceName;

  /// The type of a resource referenced by the event returned. When the resource
  /// type cannot be determined, null is returned. Some examples of resource types
  /// are: <b>Instance</b> for EC2, <b>Trail</b> for CloudTrail, <b>DBInstance</b>
  /// for Amazon RDS, and <b>AccessKey</b> for IAM. To learn more about how to
  /// look up and filter events by the resource types supported for a service, see
  /// <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/view-cloudtrail-events-console.html#filtering-cloudtrail-events">Filtering
  /// CloudTrail Events</a>.
  final String? resourceType;

  Resource({
    this.resourceName,
    this.resourceType,
  });

  factory Resource.fromJson(Map<String, dynamic> json) {
    return Resource(
      resourceName: json['ResourceName'] as String?,
      resourceType: json['ResourceType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceName = this.resourceName;
    final resourceType = this.resourceType;
    return {
      if (resourceName != null) 'ResourceName': resourceName,
      if (resourceType != null) 'ResourceType': resourceType,
    };
  }
}

/// A resource tag.
class ResourceTag {
  /// Specifies the ARN of the resource.
  final String? resourceId;

  /// A list of tags.
  final List<Tag>? tagsList;

  ResourceTag({
    this.resourceId,
    this.tagsList,
  });

  factory ResourceTag.fromJson(Map<String, dynamic> json) {
    return ResourceTag(
      resourceId: json['ResourceId'] as String?,
      tagsList: (json['TagsList'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceId = this.resourceId;
    final tagsList = this.tagsList;
    return {
      if (resourceId != null) 'ResourceId': resourceId,
      if (tagsList != null) 'TagsList': tagsList,
    };
  }
}

class RestoreEventDataStoreResponse {
  /// The advanced event selectors that were used to select events.
  final List<AdvancedEventSelector>? advancedEventSelectors;

  /// The billing mode for the event data store.
  final BillingMode? billingMode;

  /// The timestamp of an event data store's creation.
  final DateTime? createdTimestamp;

  /// The event data store ARN.
  final String? eventDataStoreArn;

  /// Specifies the KMS key ID that encrypts the events delivered by CloudTrail.
  /// The value is a fully specified ARN to a KMS key in the following format.
  ///
  /// <code>arn:aws:kms:us-east-2:123456789012:key/12345678-1234-1234-1234-123456789012</code>
  final String? kmsKeyId;

  /// Indicates whether the event data store is collecting events from all
  /// Regions, or only from the Region in which the event data store was created.
  final bool? multiRegionEnabled;

  /// The name of the event data store.
  final String? name;

  /// Indicates whether an event data store is collecting logged events for an
  /// organization in Organizations.
  final bool? organizationEnabled;

  /// The retention period, in days.
  final int? retentionPeriod;

  /// The status of the event data store.
  final EventDataStoreStatus? status;

  /// Indicates that termination protection is enabled and the event data store
  /// cannot be automatically deleted.
  final bool? terminationProtectionEnabled;

  /// The timestamp that shows when an event data store was updated, if
  /// applicable. <code>UpdatedTimestamp</code> is always either the same or newer
  /// than the time shown in <code>CreatedTimestamp</code>.
  final DateTime? updatedTimestamp;

  RestoreEventDataStoreResponse({
    this.advancedEventSelectors,
    this.billingMode,
    this.createdTimestamp,
    this.eventDataStoreArn,
    this.kmsKeyId,
    this.multiRegionEnabled,
    this.name,
    this.organizationEnabled,
    this.retentionPeriod,
    this.status,
    this.terminationProtectionEnabled,
    this.updatedTimestamp,
  });

  factory RestoreEventDataStoreResponse.fromJson(Map<String, dynamic> json) {
    return RestoreEventDataStoreResponse(
      advancedEventSelectors: (json['AdvancedEventSelectors'] as List?)
          ?.whereNotNull()
          .map((e) => AdvancedEventSelector.fromJson(e as Map<String, dynamic>))
          .toList(),
      billingMode: (json['BillingMode'] as String?)?.toBillingMode(),
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      eventDataStoreArn: json['EventDataStoreArn'] as String?,
      kmsKeyId: json['KmsKeyId'] as String?,
      multiRegionEnabled: json['MultiRegionEnabled'] as bool?,
      name: json['Name'] as String?,
      organizationEnabled: json['OrganizationEnabled'] as bool?,
      retentionPeriod: json['RetentionPeriod'] as int?,
      status: (json['Status'] as String?)?.toEventDataStoreStatus(),
      terminationProtectionEnabled:
          json['TerminationProtectionEnabled'] as bool?,
      updatedTimestamp: timeStampFromJson(json['UpdatedTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final advancedEventSelectors = this.advancedEventSelectors;
    final billingMode = this.billingMode;
    final createdTimestamp = this.createdTimestamp;
    final eventDataStoreArn = this.eventDataStoreArn;
    final kmsKeyId = this.kmsKeyId;
    final multiRegionEnabled = this.multiRegionEnabled;
    final name = this.name;
    final organizationEnabled = this.organizationEnabled;
    final retentionPeriod = this.retentionPeriod;
    final status = this.status;
    final terminationProtectionEnabled = this.terminationProtectionEnabled;
    final updatedTimestamp = this.updatedTimestamp;
    return {
      if (advancedEventSelectors != null)
        'AdvancedEventSelectors': advancedEventSelectors,
      if (billingMode != null) 'BillingMode': billingMode.toValue(),
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (eventDataStoreArn != null) 'EventDataStoreArn': eventDataStoreArn,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (multiRegionEnabled != null) 'MultiRegionEnabled': multiRegionEnabled,
      if (name != null) 'Name': name,
      if (organizationEnabled != null)
        'OrganizationEnabled': organizationEnabled,
      if (retentionPeriod != null) 'RetentionPeriod': retentionPeriod,
      if (status != null) 'Status': status.toValue(),
      if (terminationProtectionEnabled != null)
        'TerminationProtectionEnabled': terminationProtectionEnabled,
      if (updatedTimestamp != null)
        'UpdatedTimestamp': unixTimestampToJson(updatedTimestamp),
    };
  }
}

/// The settings for the source S3 bucket.
class S3ImportSource {
  /// The IAM ARN role used to access the source S3 bucket.
  final String s3BucketAccessRoleArn;

  /// The Region associated with the source S3 bucket.
  final String s3BucketRegion;

  /// The URI for the source S3 bucket.
  final String s3LocationUri;

  S3ImportSource({
    required this.s3BucketAccessRoleArn,
    required this.s3BucketRegion,
    required this.s3LocationUri,
  });

  factory S3ImportSource.fromJson(Map<String, dynamic> json) {
    return S3ImportSource(
      s3BucketAccessRoleArn: json['S3BucketAccessRoleArn'] as String,
      s3BucketRegion: json['S3BucketRegion'] as String,
      s3LocationUri: json['S3LocationUri'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final s3BucketAccessRoleArn = this.s3BucketAccessRoleArn;
    final s3BucketRegion = this.s3BucketRegion;
    final s3LocationUri = this.s3LocationUri;
    return {
      'S3BucketAccessRoleArn': s3BucketAccessRoleArn,
      'S3BucketRegion': s3BucketRegion,
      'S3LocationUri': s3LocationUri,
    };
  }
}

/// Contains configuration information about the channel.
class SourceConfig {
  /// The advanced event selectors that are configured for the channel.
  final List<AdvancedEventSelector>? advancedEventSelectors;

  /// Specifies whether the channel applies to a single Region or to all Regions.
  final bool? applyToAllRegions;

  SourceConfig({
    this.advancedEventSelectors,
    this.applyToAllRegions,
  });

  factory SourceConfig.fromJson(Map<String, dynamic> json) {
    return SourceConfig(
      advancedEventSelectors: (json['AdvancedEventSelectors'] as List?)
          ?.whereNotNull()
          .map((e) => AdvancedEventSelector.fromJson(e as Map<String, dynamic>))
          .toList(),
      applyToAllRegions: json['ApplyToAllRegions'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final advancedEventSelectors = this.advancedEventSelectors;
    final applyToAllRegions = this.applyToAllRegions;
    return {
      if (advancedEventSelectors != null)
        'AdvancedEventSelectors': advancedEventSelectors,
      if (applyToAllRegions != null) 'ApplyToAllRegions': applyToAllRegions,
    };
  }
}

class StartEventDataStoreIngestionResponse {
  StartEventDataStoreIngestionResponse();

  factory StartEventDataStoreIngestionResponse.fromJson(
      Map<String, dynamic> _) {
    return StartEventDataStoreIngestionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class StartImportResponse {
  /// The timestamp for the import's creation.
  final DateTime? createdTimestamp;

  /// The ARN of the destination event data store.
  final List<String>? destinations;

  /// Used with <code>StartEventTime</code> to bound a <code>StartImport</code>
  /// request, and limit imported trail events to only those events logged within
  /// a specified time period.
  final DateTime? endEventTime;

  /// The ID of the import.
  final String? importId;

  /// The source S3 bucket for the import.
  final ImportSource? importSource;

  /// Shows the status of the import after a <code>StartImport</code> request. An
  /// import finishes with a status of <code>COMPLETED</code> if there were no
  /// failures, or <code>FAILED</code> if there were failures.
  final ImportStatus? importStatus;

  /// Used with <code>EndEventTime</code> to bound a <code>StartImport</code>
  /// request, and limit imported trail events to only those events logged within
  /// a specified time period.
  final DateTime? startEventTime;

  /// The timestamp of the import's last update, if applicable.
  final DateTime? updatedTimestamp;

  StartImportResponse({
    this.createdTimestamp,
    this.destinations,
    this.endEventTime,
    this.importId,
    this.importSource,
    this.importStatus,
    this.startEventTime,
    this.updatedTimestamp,
  });

  factory StartImportResponse.fromJson(Map<String, dynamic> json) {
    return StartImportResponse(
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      destinations: (json['Destinations'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      endEventTime: timeStampFromJson(json['EndEventTime']),
      importId: json['ImportId'] as String?,
      importSource: json['ImportSource'] != null
          ? ImportSource.fromJson(json['ImportSource'] as Map<String, dynamic>)
          : null,
      importStatus: (json['ImportStatus'] as String?)?.toImportStatus(),
      startEventTime: timeStampFromJson(json['StartEventTime']),
      updatedTimestamp: timeStampFromJson(json['UpdatedTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final destinations = this.destinations;
    final endEventTime = this.endEventTime;
    final importId = this.importId;
    final importSource = this.importSource;
    final importStatus = this.importStatus;
    final startEventTime = this.startEventTime;
    final updatedTimestamp = this.updatedTimestamp;
    return {
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (destinations != null) 'Destinations': destinations,
      if (endEventTime != null)
        'EndEventTime': unixTimestampToJson(endEventTime),
      if (importId != null) 'ImportId': importId,
      if (importSource != null) 'ImportSource': importSource,
      if (importStatus != null) 'ImportStatus': importStatus.toValue(),
      if (startEventTime != null)
        'StartEventTime': unixTimestampToJson(startEventTime),
      if (updatedTimestamp != null)
        'UpdatedTimestamp': unixTimestampToJson(updatedTimestamp),
    };
  }
}

/// Returns the objects or data listed below if successful. Otherwise, returns
/// an error.
class StartLoggingResponse {
  StartLoggingResponse();

  factory StartLoggingResponse.fromJson(Map<String, dynamic> _) {
    return StartLoggingResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class StartQueryResponse {
  /// The ID of the started query.
  final String? queryId;

  StartQueryResponse({
    this.queryId,
  });

  factory StartQueryResponse.fromJson(Map<String, dynamic> json) {
    return StartQueryResponse(
      queryId: json['QueryId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final queryId = this.queryId;
    return {
      if (queryId != null) 'QueryId': queryId,
    };
  }
}

class StopEventDataStoreIngestionResponse {
  StopEventDataStoreIngestionResponse();

  factory StopEventDataStoreIngestionResponse.fromJson(Map<String, dynamic> _) {
    return StopEventDataStoreIngestionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class StopImportResponse {
  /// The timestamp of the import's creation.
  final DateTime? createdTimestamp;

  /// The ARN of the destination event data store.
  final List<String>? destinations;

  /// Used with <code>StartEventTime</code> to bound a <code>StartImport</code>
  /// request, and limit imported trail events to only those events logged within
  /// a specified time period.
  final DateTime? endEventTime;

  /// The ID for the import.
  final String? importId;

  /// The source S3 bucket for the import.
  final ImportSource? importSource;

  /// Returns information on the stopped import.
  final ImportStatistics? importStatistics;

  /// The status of the import.
  final ImportStatus? importStatus;

  /// Used with <code>EndEventTime</code> to bound a <code>StartImport</code>
  /// request, and limit imported trail events to only those events logged within
  /// a specified time period.
  final DateTime? startEventTime;

  /// The timestamp of the import's last update.
  final DateTime? updatedTimestamp;

  StopImportResponse({
    this.createdTimestamp,
    this.destinations,
    this.endEventTime,
    this.importId,
    this.importSource,
    this.importStatistics,
    this.importStatus,
    this.startEventTime,
    this.updatedTimestamp,
  });

  factory StopImportResponse.fromJson(Map<String, dynamic> json) {
    return StopImportResponse(
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      destinations: (json['Destinations'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      endEventTime: timeStampFromJson(json['EndEventTime']),
      importId: json['ImportId'] as String?,
      importSource: json['ImportSource'] != null
          ? ImportSource.fromJson(json['ImportSource'] as Map<String, dynamic>)
          : null,
      importStatistics: json['ImportStatistics'] != null
          ? ImportStatistics.fromJson(
              json['ImportStatistics'] as Map<String, dynamic>)
          : null,
      importStatus: (json['ImportStatus'] as String?)?.toImportStatus(),
      startEventTime: timeStampFromJson(json['StartEventTime']),
      updatedTimestamp: timeStampFromJson(json['UpdatedTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final destinations = this.destinations;
    final endEventTime = this.endEventTime;
    final importId = this.importId;
    final importSource = this.importSource;
    final importStatistics = this.importStatistics;
    final importStatus = this.importStatus;
    final startEventTime = this.startEventTime;
    final updatedTimestamp = this.updatedTimestamp;
    return {
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (destinations != null) 'Destinations': destinations,
      if (endEventTime != null)
        'EndEventTime': unixTimestampToJson(endEventTime),
      if (importId != null) 'ImportId': importId,
      if (importSource != null) 'ImportSource': importSource,
      if (importStatistics != null) 'ImportStatistics': importStatistics,
      if (importStatus != null) 'ImportStatus': importStatus.toValue(),
      if (startEventTime != null)
        'StartEventTime': unixTimestampToJson(startEventTime),
      if (updatedTimestamp != null)
        'UpdatedTimestamp': unixTimestampToJson(updatedTimestamp),
    };
  }
}

/// Returns the objects or data listed below if successful. Otherwise, returns
/// an error.
class StopLoggingResponse {
  StopLoggingResponse();

  factory StopLoggingResponse.fromJson(Map<String, dynamic> _) {
    return StopLoggingResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A custom key-value pair associated with a resource such as a CloudTrail
/// trail, event data store, or channel.
class Tag {
  /// The key in a key-value pair. The key must be must be no longer than 128
  /// Unicode characters. The key must be unique for the resource to which it
  /// applies.
  final String key;

  /// The value in a key-value pair of a tag. The value must be no longer than 256
  /// Unicode characters.
  final String? value;

  Tag({
    required this.key,
    this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['Key'] as String,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'Key': key,
      if (value != null) 'Value': value,
    };
  }
}

/// The settings for a trail.
class Trail {
  /// Specifies an Amazon Resource Name (ARN), a unique identifier that represents
  /// the log group to which CloudTrail logs will be delivered.
  final String? cloudWatchLogsLogGroupArn;

  /// Specifies the role for the CloudWatch Logs endpoint to assume to write to a
  /// user's log group.
  final String? cloudWatchLogsRoleArn;

  /// Specifies if the trail has custom event selectors.
  final bool? hasCustomEventSelectors;

  /// Specifies whether a trail has insight types specified in an
  /// <code>InsightSelector</code> list.
  final bool? hasInsightSelectors;

  /// The Region in which the trail was created.
  final String? homeRegion;

  /// Set to <b>True</b> to include Amazon Web Services API calls from Amazon Web
  /// Services global services such as IAM. Otherwise, <b>False</b>.
  final bool? includeGlobalServiceEvents;

  /// Specifies whether the trail exists only in one Region or exists in all
  /// Regions.
  final bool? isMultiRegionTrail;

  /// Specifies whether the trail is an organization trail.
  final bool? isOrganizationTrail;

  /// Specifies the KMS key ID that encrypts the logs delivered by CloudTrail. The
  /// value is a fully specified ARN to a KMS key in the following format.
  ///
  /// <code>arn:aws:kms:us-east-2:123456789012:key/12345678-1234-1234-1234-123456789012</code>
  final String? kmsKeyId;

  /// Specifies whether log file validation is enabled.
  final bool? logFileValidationEnabled;

  /// Name of the trail set by calling <a>CreateTrail</a>. The maximum length is
  /// 128 characters.
  final String? name;

  /// Name of the Amazon S3 bucket into which CloudTrail delivers your trail
  /// files. See <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html">Amazon
  /// S3 Bucket naming rules</a>.
  final String? s3BucketName;

  /// Specifies the Amazon S3 key prefix that comes after the name of the bucket
  /// you have designated for log file delivery. For more information, see <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/get-and-view-cloudtrail-log-files.html#cloudtrail-find-log-files">Finding
  /// Your CloudTrail Log Files</a>. The maximum length is 200 characters.
  final String? s3KeyPrefix;

  /// Specifies the ARN of the Amazon SNS topic that CloudTrail uses to send
  /// notifications when log files are delivered. The following is the format of a
  /// topic ARN.
  ///
  /// <code>arn:aws:sns:us-east-2:123456789012:MyTopic</code>
  final String? snsTopicARN;

  /// This field is no longer in use. Use <code>SnsTopicARN</code>.
  final String? snsTopicName;

  /// Specifies the ARN of the trail. The following is the format of a trail ARN.
  ///
  /// <code>arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail</code>
  final String? trailARN;

  Trail({
    this.cloudWatchLogsLogGroupArn,
    this.cloudWatchLogsRoleArn,
    this.hasCustomEventSelectors,
    this.hasInsightSelectors,
    this.homeRegion,
    this.includeGlobalServiceEvents,
    this.isMultiRegionTrail,
    this.isOrganizationTrail,
    this.kmsKeyId,
    this.logFileValidationEnabled,
    this.name,
    this.s3BucketName,
    this.s3KeyPrefix,
    this.snsTopicARN,
    this.snsTopicName,
    this.trailARN,
  });

  factory Trail.fromJson(Map<String, dynamic> json) {
    return Trail(
      cloudWatchLogsLogGroupArn: json['CloudWatchLogsLogGroupArn'] as String?,
      cloudWatchLogsRoleArn: json['CloudWatchLogsRoleArn'] as String?,
      hasCustomEventSelectors: json['HasCustomEventSelectors'] as bool?,
      hasInsightSelectors: json['HasInsightSelectors'] as bool?,
      homeRegion: json['HomeRegion'] as String?,
      includeGlobalServiceEvents: json['IncludeGlobalServiceEvents'] as bool?,
      isMultiRegionTrail: json['IsMultiRegionTrail'] as bool?,
      isOrganizationTrail: json['IsOrganizationTrail'] as bool?,
      kmsKeyId: json['KmsKeyId'] as String?,
      logFileValidationEnabled: json['LogFileValidationEnabled'] as bool?,
      name: json['Name'] as String?,
      s3BucketName: json['S3BucketName'] as String?,
      s3KeyPrefix: json['S3KeyPrefix'] as String?,
      snsTopicARN: json['SnsTopicARN'] as String?,
      snsTopicName: json['SnsTopicName'] as String?,
      trailARN: json['TrailARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchLogsLogGroupArn = this.cloudWatchLogsLogGroupArn;
    final cloudWatchLogsRoleArn = this.cloudWatchLogsRoleArn;
    final hasCustomEventSelectors = this.hasCustomEventSelectors;
    final hasInsightSelectors = this.hasInsightSelectors;
    final homeRegion = this.homeRegion;
    final includeGlobalServiceEvents = this.includeGlobalServiceEvents;
    final isMultiRegionTrail = this.isMultiRegionTrail;
    final isOrganizationTrail = this.isOrganizationTrail;
    final kmsKeyId = this.kmsKeyId;
    final logFileValidationEnabled = this.logFileValidationEnabled;
    final name = this.name;
    final s3BucketName = this.s3BucketName;
    final s3KeyPrefix = this.s3KeyPrefix;
    final snsTopicARN = this.snsTopicARN;
    final snsTopicName = this.snsTopicName;
    final trailARN = this.trailARN;
    return {
      if (cloudWatchLogsLogGroupArn != null)
        'CloudWatchLogsLogGroupArn': cloudWatchLogsLogGroupArn,
      if (cloudWatchLogsRoleArn != null)
        'CloudWatchLogsRoleArn': cloudWatchLogsRoleArn,
      if (hasCustomEventSelectors != null)
        'HasCustomEventSelectors': hasCustomEventSelectors,
      if (hasInsightSelectors != null)
        'HasInsightSelectors': hasInsightSelectors,
      if (homeRegion != null) 'HomeRegion': homeRegion,
      if (includeGlobalServiceEvents != null)
        'IncludeGlobalServiceEvents': includeGlobalServiceEvents,
      if (isMultiRegionTrail != null) 'IsMultiRegionTrail': isMultiRegionTrail,
      if (isOrganizationTrail != null)
        'IsOrganizationTrail': isOrganizationTrail,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (logFileValidationEnabled != null)
        'LogFileValidationEnabled': logFileValidationEnabled,
      if (name != null) 'Name': name,
      if (s3BucketName != null) 'S3BucketName': s3BucketName,
      if (s3KeyPrefix != null) 'S3KeyPrefix': s3KeyPrefix,
      if (snsTopicARN != null) 'SnsTopicARN': snsTopicARN,
      if (snsTopicName != null) 'SnsTopicName': snsTopicName,
      if (trailARN != null) 'TrailARN': trailARN,
    };
  }
}

/// Information about a CloudTrail trail, including the trail's name, home
/// Region, and Amazon Resource Name (ARN).
class TrailInfo {
  /// The Amazon Web Services Region in which a trail was created.
  final String? homeRegion;

  /// The name of a trail.
  final String? name;

  /// The ARN of a trail.
  final String? trailARN;

  TrailInfo({
    this.homeRegion,
    this.name,
    this.trailARN,
  });

  factory TrailInfo.fromJson(Map<String, dynamic> json) {
    return TrailInfo(
      homeRegion: json['HomeRegion'] as String?,
      name: json['Name'] as String?,
      trailARN: json['TrailARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final homeRegion = this.homeRegion;
    final name = this.name;
    final trailARN = this.trailARN;
    return {
      if (homeRegion != null) 'HomeRegion': homeRegion,
      if (name != null) 'Name': name,
      if (trailARN != null) 'TrailARN': trailARN,
    };
  }
}

class UpdateChannelResponse {
  /// The ARN of the channel that was updated.
  final String? channelArn;

  /// The event data stores that log events arriving through the channel.
  final List<Destination>? destinations;

  /// The name of the channel that was updated.
  final String? name;

  /// The event source of the channel that was updated.
  final String? source;

  UpdateChannelResponse({
    this.channelArn,
    this.destinations,
    this.name,
    this.source,
  });

  factory UpdateChannelResponse.fromJson(Map<String, dynamic> json) {
    return UpdateChannelResponse(
      channelArn: json['ChannelArn'] as String?,
      destinations: (json['Destinations'] as List?)
          ?.whereNotNull()
          .map((e) => Destination.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['Name'] as String?,
      source: json['Source'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelArn = this.channelArn;
    final destinations = this.destinations;
    final name = this.name;
    final source = this.source;
    return {
      if (channelArn != null) 'ChannelArn': channelArn,
      if (destinations != null) 'Destinations': destinations,
      if (name != null) 'Name': name,
      if (source != null) 'Source': source,
    };
  }
}

class UpdateEventDataStoreResponse {
  /// The advanced event selectors that are applied to the event data store.
  final List<AdvancedEventSelector>? advancedEventSelectors;

  /// The billing mode for the event data store.
  final BillingMode? billingMode;

  /// The timestamp that shows when an event data store was first created.
  final DateTime? createdTimestamp;

  /// The ARN of the event data store.
  final String? eventDataStoreArn;

  /// If Lake query federation is enabled, provides the ARN of the federation role
  /// used to access the resources for the federated event data store.
  final String? federationRoleArn;

  /// Indicates the <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/query-federation.html">Lake
  /// query federation</a> status. The status is <code>ENABLED</code> if Lake
  /// query federation is enabled, or <code>DISABLED</code> if Lake query
  /// federation is disabled. You cannot delete an event data store if the
  /// <code>FederationStatus</code> is <code>ENABLED</code>.
  final FederationStatus? federationStatus;

  /// Specifies the KMS key ID that encrypts the events delivered by CloudTrail.
  /// The value is a fully specified ARN to a KMS key in the following format.
  ///
  /// <code>arn:aws:kms:us-east-2:123456789012:key/12345678-1234-1234-1234-123456789012</code>
  final String? kmsKeyId;

  /// Indicates whether the event data store includes events from all Regions, or
  /// only from the Region in which it was created.
  final bool? multiRegionEnabled;

  /// The name of the event data store.
  final String? name;

  /// Indicates whether an event data store is collecting logged events for an
  /// organization in Organizations.
  final bool? organizationEnabled;

  /// The retention period, in days.
  final int? retentionPeriod;

  /// The status of an event data store.
  final EventDataStoreStatus? status;

  /// Indicates whether termination protection is enabled for the event data
  /// store.
  final bool? terminationProtectionEnabled;

  /// The timestamp that shows when the event data store was last updated.
  /// <code>UpdatedTimestamp</code> is always either the same or newer than the
  /// time shown in <code>CreatedTimestamp</code>.
  final DateTime? updatedTimestamp;

  UpdateEventDataStoreResponse({
    this.advancedEventSelectors,
    this.billingMode,
    this.createdTimestamp,
    this.eventDataStoreArn,
    this.federationRoleArn,
    this.federationStatus,
    this.kmsKeyId,
    this.multiRegionEnabled,
    this.name,
    this.organizationEnabled,
    this.retentionPeriod,
    this.status,
    this.terminationProtectionEnabled,
    this.updatedTimestamp,
  });

  factory UpdateEventDataStoreResponse.fromJson(Map<String, dynamic> json) {
    return UpdateEventDataStoreResponse(
      advancedEventSelectors: (json['AdvancedEventSelectors'] as List?)
          ?.whereNotNull()
          .map((e) => AdvancedEventSelector.fromJson(e as Map<String, dynamic>))
          .toList(),
      billingMode: (json['BillingMode'] as String?)?.toBillingMode(),
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      eventDataStoreArn: json['EventDataStoreArn'] as String?,
      federationRoleArn: json['FederationRoleArn'] as String?,
      federationStatus:
          (json['FederationStatus'] as String?)?.toFederationStatus(),
      kmsKeyId: json['KmsKeyId'] as String?,
      multiRegionEnabled: json['MultiRegionEnabled'] as bool?,
      name: json['Name'] as String?,
      organizationEnabled: json['OrganizationEnabled'] as bool?,
      retentionPeriod: json['RetentionPeriod'] as int?,
      status: (json['Status'] as String?)?.toEventDataStoreStatus(),
      terminationProtectionEnabled:
          json['TerminationProtectionEnabled'] as bool?,
      updatedTimestamp: timeStampFromJson(json['UpdatedTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final advancedEventSelectors = this.advancedEventSelectors;
    final billingMode = this.billingMode;
    final createdTimestamp = this.createdTimestamp;
    final eventDataStoreArn = this.eventDataStoreArn;
    final federationRoleArn = this.federationRoleArn;
    final federationStatus = this.federationStatus;
    final kmsKeyId = this.kmsKeyId;
    final multiRegionEnabled = this.multiRegionEnabled;
    final name = this.name;
    final organizationEnabled = this.organizationEnabled;
    final retentionPeriod = this.retentionPeriod;
    final status = this.status;
    final terminationProtectionEnabled = this.terminationProtectionEnabled;
    final updatedTimestamp = this.updatedTimestamp;
    return {
      if (advancedEventSelectors != null)
        'AdvancedEventSelectors': advancedEventSelectors,
      if (billingMode != null) 'BillingMode': billingMode.toValue(),
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (eventDataStoreArn != null) 'EventDataStoreArn': eventDataStoreArn,
      if (federationRoleArn != null) 'FederationRoleArn': federationRoleArn,
      if (federationStatus != null)
        'FederationStatus': federationStatus.toValue(),
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (multiRegionEnabled != null) 'MultiRegionEnabled': multiRegionEnabled,
      if (name != null) 'Name': name,
      if (organizationEnabled != null)
        'OrganizationEnabled': organizationEnabled,
      if (retentionPeriod != null) 'RetentionPeriod': retentionPeriod,
      if (status != null) 'Status': status.toValue(),
      if (terminationProtectionEnabled != null)
        'TerminationProtectionEnabled': terminationProtectionEnabled,
      if (updatedTimestamp != null)
        'UpdatedTimestamp': unixTimestampToJson(updatedTimestamp),
    };
  }
}

/// Returns the objects or data listed below if successful. Otherwise, returns
/// an error.
class UpdateTrailResponse {
  /// Specifies the Amazon Resource Name (ARN) of the log group to which
  /// CloudTrail logs are delivered.
  final String? cloudWatchLogsLogGroupArn;

  /// Specifies the role for the CloudWatch Logs endpoint to assume to write to a
  /// user's log group.
  final String? cloudWatchLogsRoleArn;

  /// Specifies whether the trail is publishing events from global services such
  /// as IAM to the log files.
  final bool? includeGlobalServiceEvents;

  /// Specifies whether the trail exists in one Region or in all Regions.
  final bool? isMultiRegionTrail;

  /// Specifies whether the trail is an organization trail.
  final bool? isOrganizationTrail;

  /// Specifies the KMS key ID that encrypts the logs delivered by CloudTrail. The
  /// value is a fully specified ARN to a KMS key in the following format.
  ///
  /// <code>arn:aws:kms:us-east-2:123456789012:key/12345678-1234-1234-1234-123456789012</code>
  final String? kmsKeyId;

  /// Specifies whether log file integrity validation is enabled.
  final bool? logFileValidationEnabled;

  /// Specifies the name of the trail.
  final String? name;

  /// Specifies the name of the Amazon S3 bucket designated for publishing log
  /// files.
  final String? s3BucketName;

  /// Specifies the Amazon S3 key prefix that comes after the name of the bucket
  /// you have designated for log file delivery. For more information, see <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/get-and-view-cloudtrail-log-files.html#cloudtrail-find-log-files">Finding
  /// Your IAM Log Files</a>.
  final String? s3KeyPrefix;

  /// Specifies the ARN of the Amazon SNS topic that CloudTrail uses to send
  /// notifications when log files are delivered. The following is the format of a
  /// topic ARN.
  ///
  /// <code>arn:aws:sns:us-east-2:123456789012:MyTopic</code>
  final String? snsTopicARN;

  /// This field is no longer in use. Use <code>SnsTopicARN</code>.
  final String? snsTopicName;

  /// Specifies the ARN of the trail that was updated. The following is the format
  /// of a trail ARN.
  ///
  /// <code>arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail</code>
  final String? trailARN;

  UpdateTrailResponse({
    this.cloudWatchLogsLogGroupArn,
    this.cloudWatchLogsRoleArn,
    this.includeGlobalServiceEvents,
    this.isMultiRegionTrail,
    this.isOrganizationTrail,
    this.kmsKeyId,
    this.logFileValidationEnabled,
    this.name,
    this.s3BucketName,
    this.s3KeyPrefix,
    this.snsTopicARN,
    this.snsTopicName,
    this.trailARN,
  });

  factory UpdateTrailResponse.fromJson(Map<String, dynamic> json) {
    return UpdateTrailResponse(
      cloudWatchLogsLogGroupArn: json['CloudWatchLogsLogGroupArn'] as String?,
      cloudWatchLogsRoleArn: json['CloudWatchLogsRoleArn'] as String?,
      includeGlobalServiceEvents: json['IncludeGlobalServiceEvents'] as bool?,
      isMultiRegionTrail: json['IsMultiRegionTrail'] as bool?,
      isOrganizationTrail: json['IsOrganizationTrail'] as bool?,
      kmsKeyId: json['KmsKeyId'] as String?,
      logFileValidationEnabled: json['LogFileValidationEnabled'] as bool?,
      name: json['Name'] as String?,
      s3BucketName: json['S3BucketName'] as String?,
      s3KeyPrefix: json['S3KeyPrefix'] as String?,
      snsTopicARN: json['SnsTopicARN'] as String?,
      snsTopicName: json['SnsTopicName'] as String?,
      trailARN: json['TrailARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchLogsLogGroupArn = this.cloudWatchLogsLogGroupArn;
    final cloudWatchLogsRoleArn = this.cloudWatchLogsRoleArn;
    final includeGlobalServiceEvents = this.includeGlobalServiceEvents;
    final isMultiRegionTrail = this.isMultiRegionTrail;
    final isOrganizationTrail = this.isOrganizationTrail;
    final kmsKeyId = this.kmsKeyId;
    final logFileValidationEnabled = this.logFileValidationEnabled;
    final name = this.name;
    final s3BucketName = this.s3BucketName;
    final s3KeyPrefix = this.s3KeyPrefix;
    final snsTopicARN = this.snsTopicARN;
    final snsTopicName = this.snsTopicName;
    final trailARN = this.trailARN;
    return {
      if (cloudWatchLogsLogGroupArn != null)
        'CloudWatchLogsLogGroupArn': cloudWatchLogsLogGroupArn,
      if (cloudWatchLogsRoleArn != null)
        'CloudWatchLogsRoleArn': cloudWatchLogsRoleArn,
      if (includeGlobalServiceEvents != null)
        'IncludeGlobalServiceEvents': includeGlobalServiceEvents,
      if (isMultiRegionTrail != null) 'IsMultiRegionTrail': isMultiRegionTrail,
      if (isOrganizationTrail != null)
        'IsOrganizationTrail': isOrganizationTrail,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (logFileValidationEnabled != null)
        'LogFileValidationEnabled': logFileValidationEnabled,
      if (name != null) 'Name': name,
      if (s3BucketName != null) 'S3BucketName': s3BucketName,
      if (s3KeyPrefix != null) 'S3KeyPrefix': s3KeyPrefix,
      if (snsTopicARN != null) 'SnsTopicARN': snsTopicARN,
      if (snsTopicName != null) 'SnsTopicName': snsTopicName,
      if (trailARN != null) 'TrailARN': trailARN,
    };
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class AccountHasOngoingImportException extends _s.GenericAwsException {
  AccountHasOngoingImportException({String? type, String? message})
      : super(
            type: type,
            code: 'AccountHasOngoingImportException',
            message: message);
}

class AccountNotFoundException extends _s.GenericAwsException {
  AccountNotFoundException({String? type, String? message})
      : super(type: type, code: 'AccountNotFoundException', message: message);
}

class AccountNotRegisteredException extends _s.GenericAwsException {
  AccountNotRegisteredException({String? type, String? message})
      : super(
            type: type,
            code: 'AccountNotRegisteredException',
            message: message);
}

class AccountRegisteredException extends _s.GenericAwsException {
  AccountRegisteredException({String? type, String? message})
      : super(type: type, code: 'AccountRegisteredException', message: message);
}

class CannotDelegateManagementAccountException extends _s.GenericAwsException {
  CannotDelegateManagementAccountException({String? type, String? message})
      : super(
            type: type,
            code: 'CannotDelegateManagementAccountException',
            message: message);
}

class ChannelARNInvalidException extends _s.GenericAwsException {
  ChannelARNInvalidException({String? type, String? message})
      : super(type: type, code: 'ChannelARNInvalidException', message: message);
}

class ChannelAlreadyExistsException extends _s.GenericAwsException {
  ChannelAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'ChannelAlreadyExistsException',
            message: message);
}

class ChannelExistsForEDSException extends _s.GenericAwsException {
  ChannelExistsForEDSException({String? type, String? message})
      : super(
            type: type, code: 'ChannelExistsForEDSException', message: message);
}

class ChannelMaxLimitExceededException extends _s.GenericAwsException {
  ChannelMaxLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ChannelMaxLimitExceededException',
            message: message);
}

class ChannelNotFoundException extends _s.GenericAwsException {
  ChannelNotFoundException({String? type, String? message})
      : super(type: type, code: 'ChannelNotFoundException', message: message);
}

class CloudTrailARNInvalidException extends _s.GenericAwsException {
  CloudTrailARNInvalidException({String? type, String? message})
      : super(
            type: type,
            code: 'CloudTrailARNInvalidException',
            message: message);
}

class CloudTrailAccessNotEnabledException extends _s.GenericAwsException {
  CloudTrailAccessNotEnabledException({String? type, String? message})
      : super(
            type: type,
            code: 'CloudTrailAccessNotEnabledException',
            message: message);
}

class CloudTrailInvalidClientTokenIdException extends _s.GenericAwsException {
  CloudTrailInvalidClientTokenIdException({String? type, String? message})
      : super(
            type: type,
            code: 'CloudTrailInvalidClientTokenIdException',
            message: message);
}

class CloudWatchLogsDeliveryUnavailableException
    extends _s.GenericAwsException {
  CloudWatchLogsDeliveryUnavailableException({String? type, String? message})
      : super(
            type: type,
            code: 'CloudWatchLogsDeliveryUnavailableException',
            message: message);
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

class DelegatedAdminAccountLimitExceededException
    extends _s.GenericAwsException {
  DelegatedAdminAccountLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'DelegatedAdminAccountLimitExceededException',
            message: message);
}

class EventDataStoreARNInvalidException extends _s.GenericAwsException {
  EventDataStoreARNInvalidException({String? type, String? message})
      : super(
            type: type,
            code: 'EventDataStoreARNInvalidException',
            message: message);
}

class EventDataStoreAlreadyExistsException extends _s.GenericAwsException {
  EventDataStoreAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'EventDataStoreAlreadyExistsException',
            message: message);
}

class EventDataStoreFederationEnabledException extends _s.GenericAwsException {
  EventDataStoreFederationEnabledException({String? type, String? message})
      : super(
            type: type,
            code: 'EventDataStoreFederationEnabledException',
            message: message);
}

class EventDataStoreHasOngoingImportException extends _s.GenericAwsException {
  EventDataStoreHasOngoingImportException({String? type, String? message})
      : super(
            type: type,
            code: 'EventDataStoreHasOngoingImportException',
            message: message);
}

class EventDataStoreMaxLimitExceededException extends _s.GenericAwsException {
  EventDataStoreMaxLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'EventDataStoreMaxLimitExceededException',
            message: message);
}

class EventDataStoreNotFoundException extends _s.GenericAwsException {
  EventDataStoreNotFoundException({String? type, String? message})
      : super(
            type: type,
            code: 'EventDataStoreNotFoundException',
            message: message);
}

class EventDataStoreTerminationProtectedException
    extends _s.GenericAwsException {
  EventDataStoreTerminationProtectedException({String? type, String? message})
      : super(
            type: type,
            code: 'EventDataStoreTerminationProtectedException',
            message: message);
}

class ImportNotFoundException extends _s.GenericAwsException {
  ImportNotFoundException({String? type, String? message})
      : super(type: type, code: 'ImportNotFoundException', message: message);
}

class InactiveEventDataStoreException extends _s.GenericAwsException {
  InactiveEventDataStoreException({String? type, String? message})
      : super(
            type: type,
            code: 'InactiveEventDataStoreException',
            message: message);
}

class InactiveQueryException extends _s.GenericAwsException {
  InactiveQueryException({String? type, String? message})
      : super(type: type, code: 'InactiveQueryException', message: message);
}

class InsightNotEnabledException extends _s.GenericAwsException {
  InsightNotEnabledException({String? type, String? message})
      : super(type: type, code: 'InsightNotEnabledException', message: message);
}

class InsufficientDependencyServiceAccessPermissionException
    extends _s.GenericAwsException {
  InsufficientDependencyServiceAccessPermissionException(
      {String? type, String? message})
      : super(
            type: type,
            code: 'InsufficientDependencyServiceAccessPermissionException',
            message: message);
}

class InsufficientEncryptionPolicyException extends _s.GenericAwsException {
  InsufficientEncryptionPolicyException({String? type, String? message})
      : super(
            type: type,
            code: 'InsufficientEncryptionPolicyException',
            message: message);
}

class InsufficientS3BucketPolicyException extends _s.GenericAwsException {
  InsufficientS3BucketPolicyException({String? type, String? message})
      : super(
            type: type,
            code: 'InsufficientS3BucketPolicyException',
            message: message);
}

class InsufficientSnsTopicPolicyException extends _s.GenericAwsException {
  InsufficientSnsTopicPolicyException({String? type, String? message})
      : super(
            type: type,
            code: 'InsufficientSnsTopicPolicyException',
            message: message);
}

class InvalidCloudWatchLogsLogGroupArnException extends _s.GenericAwsException {
  InvalidCloudWatchLogsLogGroupArnException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidCloudWatchLogsLogGroupArnException',
            message: message);
}

class InvalidCloudWatchLogsRoleArnException extends _s.GenericAwsException {
  InvalidCloudWatchLogsRoleArnException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidCloudWatchLogsRoleArnException',
            message: message);
}

class InvalidDateRangeException extends _s.GenericAwsException {
  InvalidDateRangeException({String? type, String? message})
      : super(type: type, code: 'InvalidDateRangeException', message: message);
}

class InvalidEventCategoryException extends _s.GenericAwsException {
  InvalidEventCategoryException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidEventCategoryException',
            message: message);
}

class InvalidEventDataStoreCategoryException extends _s.GenericAwsException {
  InvalidEventDataStoreCategoryException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidEventDataStoreCategoryException',
            message: message);
}

class InvalidEventDataStoreStatusException extends _s.GenericAwsException {
  InvalidEventDataStoreStatusException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidEventDataStoreStatusException',
            message: message);
}

class InvalidEventSelectorsException extends _s.GenericAwsException {
  InvalidEventSelectorsException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidEventSelectorsException',
            message: message);
}

class InvalidHomeRegionException extends _s.GenericAwsException {
  InvalidHomeRegionException({String? type, String? message})
      : super(type: type, code: 'InvalidHomeRegionException', message: message);
}

class InvalidImportSourceException extends _s.GenericAwsException {
  InvalidImportSourceException({String? type, String? message})
      : super(
            type: type, code: 'InvalidImportSourceException', message: message);
}

class InvalidInsightSelectorsException extends _s.GenericAwsException {
  InvalidInsightSelectorsException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidInsightSelectorsException',
            message: message);
}

class InvalidKmsKeyIdException extends _s.GenericAwsException {
  InvalidKmsKeyIdException({String? type, String? message})
      : super(type: type, code: 'InvalidKmsKeyIdException', message: message);
}

class InvalidLookupAttributesException extends _s.GenericAwsException {
  InvalidLookupAttributesException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidLookupAttributesException',
            message: message);
}

class InvalidMaxResultsException extends _s.GenericAwsException {
  InvalidMaxResultsException({String? type, String? message})
      : super(type: type, code: 'InvalidMaxResultsException', message: message);
}

class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String? type, String? message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

class InvalidParameterCombinationException extends _s.GenericAwsException {
  InvalidParameterCombinationException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidParameterCombinationException',
            message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String? type, String? message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class InvalidQueryStatementException extends _s.GenericAwsException {
  InvalidQueryStatementException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidQueryStatementException',
            message: message);
}

class InvalidQueryStatusException extends _s.GenericAwsException {
  InvalidQueryStatusException({String? type, String? message})
      : super(
            type: type, code: 'InvalidQueryStatusException', message: message);
}

class InvalidS3BucketNameException extends _s.GenericAwsException {
  InvalidS3BucketNameException({String? type, String? message})
      : super(
            type: type, code: 'InvalidS3BucketNameException', message: message);
}

class InvalidS3PrefixException extends _s.GenericAwsException {
  InvalidS3PrefixException({String? type, String? message})
      : super(type: type, code: 'InvalidS3PrefixException', message: message);
}

class InvalidSnsTopicNameException extends _s.GenericAwsException {
  InvalidSnsTopicNameException({String? type, String? message})
      : super(
            type: type, code: 'InvalidSnsTopicNameException', message: message);
}

class InvalidSourceException extends _s.GenericAwsException {
  InvalidSourceException({String? type, String? message})
      : super(type: type, code: 'InvalidSourceException', message: message);
}

class InvalidTagParameterException extends _s.GenericAwsException {
  InvalidTagParameterException({String? type, String? message})
      : super(
            type: type, code: 'InvalidTagParameterException', message: message);
}

class InvalidTimeRangeException extends _s.GenericAwsException {
  InvalidTimeRangeException({String? type, String? message})
      : super(type: type, code: 'InvalidTimeRangeException', message: message);
}

class InvalidTokenException extends _s.GenericAwsException {
  InvalidTokenException({String? type, String? message})
      : super(type: type, code: 'InvalidTokenException', message: message);
}

class InvalidTrailNameException extends _s.GenericAwsException {
  InvalidTrailNameException({String? type, String? message})
      : super(type: type, code: 'InvalidTrailNameException', message: message);
}

class KmsException extends _s.GenericAwsException {
  KmsException({String? type, String? message})
      : super(type: type, code: 'KmsException', message: message);
}

class KmsKeyDisabledException extends _s.GenericAwsException {
  KmsKeyDisabledException({String? type, String? message})
      : super(type: type, code: 'KmsKeyDisabledException', message: message);
}

class KmsKeyNotFoundException extends _s.GenericAwsException {
  KmsKeyNotFoundException({String? type, String? message})
      : super(type: type, code: 'KmsKeyNotFoundException', message: message);
}

class MaxConcurrentQueriesException extends _s.GenericAwsException {
  MaxConcurrentQueriesException({String? type, String? message})
      : super(
            type: type,
            code: 'MaxConcurrentQueriesException',
            message: message);
}

class MaximumNumberOfTrailsExceededException extends _s.GenericAwsException {
  MaximumNumberOfTrailsExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'MaximumNumberOfTrailsExceededException',
            message: message);
}

class NoManagementAccountSLRExistsException extends _s.GenericAwsException {
  NoManagementAccountSLRExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'NoManagementAccountSLRExistsException',
            message: message);
}

class NotOrganizationManagementAccountException extends _s.GenericAwsException {
  NotOrganizationManagementAccountException({String? type, String? message})
      : super(
            type: type,
            code: 'NotOrganizationManagementAccountException',
            message: message);
}

class NotOrganizationMasterAccountException extends _s.GenericAwsException {
  NotOrganizationMasterAccountException({String? type, String? message})
      : super(
            type: type,
            code: 'NotOrganizationMasterAccountException',
            message: message);
}

class OperationNotPermittedException extends _s.GenericAwsException {
  OperationNotPermittedException({String? type, String? message})
      : super(
            type: type,
            code: 'OperationNotPermittedException',
            message: message);
}

class OrganizationNotInAllFeaturesModeException extends _s.GenericAwsException {
  OrganizationNotInAllFeaturesModeException({String? type, String? message})
      : super(
            type: type,
            code: 'OrganizationNotInAllFeaturesModeException',
            message: message);
}

class OrganizationsNotInUseException extends _s.GenericAwsException {
  OrganizationsNotInUseException({String? type, String? message})
      : super(
            type: type,
            code: 'OrganizationsNotInUseException',
            message: message);
}

class QueryIdNotFoundException extends _s.GenericAwsException {
  QueryIdNotFoundException({String? type, String? message})
      : super(type: type, code: 'QueryIdNotFoundException', message: message);
}

class ResourceARNNotValidException extends _s.GenericAwsException {
  ResourceARNNotValidException({String? type, String? message})
      : super(
            type: type, code: 'ResourceARNNotValidException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ResourcePolicyNotFoundException extends _s.GenericAwsException {
  ResourcePolicyNotFoundException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourcePolicyNotFoundException',
            message: message);
}

class ResourcePolicyNotValidException extends _s.GenericAwsException {
  ResourcePolicyNotValidException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourcePolicyNotValidException',
            message: message);
}

class ResourceTypeNotSupportedException extends _s.GenericAwsException {
  ResourceTypeNotSupportedException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceTypeNotSupportedException',
            message: message);
}

class S3BucketDoesNotExistException extends _s.GenericAwsException {
  S3BucketDoesNotExistException({String? type, String? message})
      : super(
            type: type,
            code: 'S3BucketDoesNotExistException',
            message: message);
}

class TagsLimitExceededException extends _s.GenericAwsException {
  TagsLimitExceededException({String? type, String? message})
      : super(type: type, code: 'TagsLimitExceededException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class TrailAlreadyExistsException extends _s.GenericAwsException {
  TrailAlreadyExistsException({String? type, String? message})
      : super(
            type: type, code: 'TrailAlreadyExistsException', message: message);
}

class TrailNotFoundException extends _s.GenericAwsException {
  TrailNotFoundException({String? type, String? message})
      : super(type: type, code: 'TrailNotFoundException', message: message);
}

class TrailNotProvidedException extends _s.GenericAwsException {
  TrailNotProvidedException({String? type, String? message})
      : super(type: type, code: 'TrailNotProvidedException', message: message);
}

class UnsupportedOperationException extends _s.GenericAwsException {
  UnsupportedOperationException({String? type, String? message})
      : super(
            type: type,
            code: 'UnsupportedOperationException',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'AccountHasOngoingImportException': (type, message) =>
      AccountHasOngoingImportException(type: type, message: message),
  'AccountNotFoundException': (type, message) =>
      AccountNotFoundException(type: type, message: message),
  'AccountNotRegisteredException': (type, message) =>
      AccountNotRegisteredException(type: type, message: message),
  'AccountRegisteredException': (type, message) =>
      AccountRegisteredException(type: type, message: message),
  'CannotDelegateManagementAccountException': (type, message) =>
      CannotDelegateManagementAccountException(type: type, message: message),
  'ChannelARNInvalidException': (type, message) =>
      ChannelARNInvalidException(type: type, message: message),
  'ChannelAlreadyExistsException': (type, message) =>
      ChannelAlreadyExistsException(type: type, message: message),
  'ChannelExistsForEDSException': (type, message) =>
      ChannelExistsForEDSException(type: type, message: message),
  'ChannelMaxLimitExceededException': (type, message) =>
      ChannelMaxLimitExceededException(type: type, message: message),
  'ChannelNotFoundException': (type, message) =>
      ChannelNotFoundException(type: type, message: message),
  'CloudTrailARNInvalidException': (type, message) =>
      CloudTrailARNInvalidException(type: type, message: message),
  'CloudTrailAccessNotEnabledException': (type, message) =>
      CloudTrailAccessNotEnabledException(type: type, message: message),
  'CloudTrailInvalidClientTokenIdException': (type, message) =>
      CloudTrailInvalidClientTokenIdException(type: type, message: message),
  'CloudWatchLogsDeliveryUnavailableException': (type, message) =>
      CloudWatchLogsDeliveryUnavailableException(type: type, message: message),
  'ConcurrentModificationException': (type, message) =>
      ConcurrentModificationException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'DelegatedAdminAccountLimitExceededException': (type, message) =>
      DelegatedAdminAccountLimitExceededException(type: type, message: message),
  'EventDataStoreARNInvalidException': (type, message) =>
      EventDataStoreARNInvalidException(type: type, message: message),
  'EventDataStoreAlreadyExistsException': (type, message) =>
      EventDataStoreAlreadyExistsException(type: type, message: message),
  'EventDataStoreFederationEnabledException': (type, message) =>
      EventDataStoreFederationEnabledException(type: type, message: message),
  'EventDataStoreHasOngoingImportException': (type, message) =>
      EventDataStoreHasOngoingImportException(type: type, message: message),
  'EventDataStoreMaxLimitExceededException': (type, message) =>
      EventDataStoreMaxLimitExceededException(type: type, message: message),
  'EventDataStoreNotFoundException': (type, message) =>
      EventDataStoreNotFoundException(type: type, message: message),
  'EventDataStoreTerminationProtectedException': (type, message) =>
      EventDataStoreTerminationProtectedException(type: type, message: message),
  'ImportNotFoundException': (type, message) =>
      ImportNotFoundException(type: type, message: message),
  'InactiveEventDataStoreException': (type, message) =>
      InactiveEventDataStoreException(type: type, message: message),
  'InactiveQueryException': (type, message) =>
      InactiveQueryException(type: type, message: message),
  'InsightNotEnabledException': (type, message) =>
      InsightNotEnabledException(type: type, message: message),
  'InsufficientDependencyServiceAccessPermissionException': (type, message) =>
      InsufficientDependencyServiceAccessPermissionException(
          type: type, message: message),
  'InsufficientEncryptionPolicyException': (type, message) =>
      InsufficientEncryptionPolicyException(type: type, message: message),
  'InsufficientS3BucketPolicyException': (type, message) =>
      InsufficientS3BucketPolicyException(type: type, message: message),
  'InsufficientSnsTopicPolicyException': (type, message) =>
      InsufficientSnsTopicPolicyException(type: type, message: message),
  'InvalidCloudWatchLogsLogGroupArnException': (type, message) =>
      InvalidCloudWatchLogsLogGroupArnException(type: type, message: message),
  'InvalidCloudWatchLogsRoleArnException': (type, message) =>
      InvalidCloudWatchLogsRoleArnException(type: type, message: message),
  'InvalidDateRangeException': (type, message) =>
      InvalidDateRangeException(type: type, message: message),
  'InvalidEventCategoryException': (type, message) =>
      InvalidEventCategoryException(type: type, message: message),
  'InvalidEventDataStoreCategoryException': (type, message) =>
      InvalidEventDataStoreCategoryException(type: type, message: message),
  'InvalidEventDataStoreStatusException': (type, message) =>
      InvalidEventDataStoreStatusException(type: type, message: message),
  'InvalidEventSelectorsException': (type, message) =>
      InvalidEventSelectorsException(type: type, message: message),
  'InvalidHomeRegionException': (type, message) =>
      InvalidHomeRegionException(type: type, message: message),
  'InvalidImportSourceException': (type, message) =>
      InvalidImportSourceException(type: type, message: message),
  'InvalidInsightSelectorsException': (type, message) =>
      InvalidInsightSelectorsException(type: type, message: message),
  'InvalidKmsKeyIdException': (type, message) =>
      InvalidKmsKeyIdException(type: type, message: message),
  'InvalidLookupAttributesException': (type, message) =>
      InvalidLookupAttributesException(type: type, message: message),
  'InvalidMaxResultsException': (type, message) =>
      InvalidMaxResultsException(type: type, message: message),
  'InvalidNextTokenException': (type, message) =>
      InvalidNextTokenException(type: type, message: message),
  'InvalidParameterCombinationException': (type, message) =>
      InvalidParameterCombinationException(type: type, message: message),
  'InvalidParameterException': (type, message) =>
      InvalidParameterException(type: type, message: message),
  'InvalidQueryStatementException': (type, message) =>
      InvalidQueryStatementException(type: type, message: message),
  'InvalidQueryStatusException': (type, message) =>
      InvalidQueryStatusException(type: type, message: message),
  'InvalidS3BucketNameException': (type, message) =>
      InvalidS3BucketNameException(type: type, message: message),
  'InvalidS3PrefixException': (type, message) =>
      InvalidS3PrefixException(type: type, message: message),
  'InvalidSnsTopicNameException': (type, message) =>
      InvalidSnsTopicNameException(type: type, message: message),
  'InvalidSourceException': (type, message) =>
      InvalidSourceException(type: type, message: message),
  'InvalidTagParameterException': (type, message) =>
      InvalidTagParameterException(type: type, message: message),
  'InvalidTimeRangeException': (type, message) =>
      InvalidTimeRangeException(type: type, message: message),
  'InvalidTokenException': (type, message) =>
      InvalidTokenException(type: type, message: message),
  'InvalidTrailNameException': (type, message) =>
      InvalidTrailNameException(type: type, message: message),
  'KmsException': (type, message) => KmsException(type: type, message: message),
  'KmsKeyDisabledException': (type, message) =>
      KmsKeyDisabledException(type: type, message: message),
  'KmsKeyNotFoundException': (type, message) =>
      KmsKeyNotFoundException(type: type, message: message),
  'MaxConcurrentQueriesException': (type, message) =>
      MaxConcurrentQueriesException(type: type, message: message),
  'MaximumNumberOfTrailsExceededException': (type, message) =>
      MaximumNumberOfTrailsExceededException(type: type, message: message),
  'NoManagementAccountSLRExistsException': (type, message) =>
      NoManagementAccountSLRExistsException(type: type, message: message),
  'NotOrganizationManagementAccountException': (type, message) =>
      NotOrganizationManagementAccountException(type: type, message: message),
  'NotOrganizationMasterAccountException': (type, message) =>
      NotOrganizationMasterAccountException(type: type, message: message),
  'OperationNotPermittedException': (type, message) =>
      OperationNotPermittedException(type: type, message: message),
  'OrganizationNotInAllFeaturesModeException': (type, message) =>
      OrganizationNotInAllFeaturesModeException(type: type, message: message),
  'OrganizationsNotInUseException': (type, message) =>
      OrganizationsNotInUseException(type: type, message: message),
  'QueryIdNotFoundException': (type, message) =>
      QueryIdNotFoundException(type: type, message: message),
  'ResourceARNNotValidException': (type, message) =>
      ResourceARNNotValidException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ResourcePolicyNotFoundException': (type, message) =>
      ResourcePolicyNotFoundException(type: type, message: message),
  'ResourcePolicyNotValidException': (type, message) =>
      ResourcePolicyNotValidException(type: type, message: message),
  'ResourceTypeNotSupportedException': (type, message) =>
      ResourceTypeNotSupportedException(type: type, message: message),
  'S3BucketDoesNotExistException': (type, message) =>
      S3BucketDoesNotExistException(type: type, message: message),
  'TagsLimitExceededException': (type, message) =>
      TagsLimitExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'TrailAlreadyExistsException': (type, message) =>
      TrailAlreadyExistsException(type: type, message: message),
  'TrailNotFoundException': (type, message) =>
      TrailNotFoundException(type: type, message: message),
  'TrailNotProvidedException': (type, message) =>
      TrailNotProvidedException(type: type, message: message),
  'UnsupportedOperationException': (type, message) =>
      UnsupportedOperationException(type: type, message: message),
};
