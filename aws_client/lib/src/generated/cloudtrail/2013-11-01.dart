// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: camel_case_types

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
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'cloudtrail',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Adds one or more tags to a trail, up to a limit of 50. Overwrites an
  /// existing tag's value when a new value is specified for an existing tag
  /// key. Tag key names must be unique for a trail; you cannot have two keys
  /// with the same name but different values. If you specify a key without a
  /// value, the tag will be created with the specified key and a value of null.
  /// You can tag a trail that applies to all AWS Regions only from the Region
  /// in which the trail was created (also known as its home region).
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [CloudTrailARNInvalidException].
  /// May throw [ResourceTypeNotSupportedException].
  /// May throw [TagsLimitExceededException].
  /// May throw [InvalidTrailNameException].
  /// May throw [InvalidTagParameterException].
  /// May throw [UnsupportedOperationException].
  /// May throw [OperationNotPermittedException].
  /// May throw [NotOrganizationMasterAccountException].
  ///
  /// Parameter [resourceId] :
  /// Specifies the ARN of the trail to which one or more tags will be added.
  /// The format of a trail ARN is:
  ///
  /// <code>arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail</code>
  ///
  /// Parameter [tagsList] :
  /// Contains a list of CloudTrail tags, up to a limit of 50
  Future<void> addTags({
    required String resourceId,
    List<Tag>? tagsList,
  }) async {
    ArgumentError.checkNotNull(resourceId, 'resourceId');
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
        if (tagsList != null) 'TagsList': tagsList,
      },
    );
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
  /// May throw [InvalidParameterCombinationException].
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
  /// May throw [CloudTrailInvalidClientTokenIdException].
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
  /// <code>my-_namespace</code> and <code>my--namespace</code> are invalid.
  /// </li>
  /// <li>
  /// Not be in IP address format (for example, 192.168.5.4)
  /// </li>
  /// </ul>
  ///
  /// Parameter [s3BucketName] :
  /// Specifies the name of the Amazon S3 bucket designated for publishing log
  /// files. See <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/create_trail_naming_policy.html">Amazon
  /// S3 Bucket Naming Requirements</a>.
  ///
  /// Parameter [cloudWatchLogsLogGroupArn] :
  /// Specifies a log group name using an Amazon Resource Name (ARN), a unique
  /// identifier that represents the log group to which CloudTrail logs will be
  /// delivered. Not required unless you specify CloudWatchLogsRoleArn.
  ///
  /// Parameter [cloudWatchLogsRoleArn] :
  /// Specifies the role for the CloudWatch Logs endpoint to assume to write to
  /// a user's log group.
  ///
  /// Parameter [enableLogFileValidation] :
  /// Specifies whether log file integrity validation is enabled. The default is
  /// false.
  /// <note>
  /// When you disable log file integrity validation, the chain of digest files
  /// is broken after one hour. CloudTrail will not create digest files for log
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
  /// Specifies whether the trail is created in the current region or in all
  /// regions. The default is false, which creates a trail only in the region
  /// where you are signed in. As a best practice, consider creating trails that
  /// log events in all regions.
  ///
  /// Parameter [isOrganizationTrail] :
  /// Specifies whether the trail is created for all accounts in an organization
  /// in AWS Organizations, or only for the current AWS account. The default is
  /// false, and cannot be true unless the call is made on behalf of an AWS
  /// account that is the master account for an organization in AWS
  /// Organizations.
  ///
  /// Parameter [kmsKeyId] :
  /// Specifies the KMS key ID to use to encrypt the logs delivered by
  /// CloudTrail. The value can be an alias name prefixed by "alias/", a fully
  /// specified ARN to an alias, a fully specified ARN to a key, or a globally
  /// unique identifier.
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
  /// Parameter [s3KeyPrefix] :
  /// Specifies the Amazon S3 key prefix that comes after the name of the bucket
  /// you have designated for log file delivery. For more information, see <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-find-log-files.html">Finding
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
    ArgumentError.checkNotNull(name, 'name');
    ArgumentError.checkNotNull(s3BucketName, 's3BucketName');
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

  /// Deletes a trail. This operation must be called from the region in which
  /// the trail was created. <code>DeleteTrail</code> cannot be called on the
  /// shadow trails (replicated trails in other regions) of a trail that is
  /// enabled in all regions.
  ///
  /// May throw [TrailNotFoundException].
  /// May throw [InvalidTrailNameException].
  /// May throw [InvalidHomeRegionException].
  /// May throw [UnsupportedOperationException].
  /// May throw [OperationNotPermittedException].
  /// May throw [NotOrganizationMasterAccountException].
  /// May throw [InsufficientDependencyServiceAccessPermissionException].
  /// May throw [ConflictException].
  ///
  /// Parameter [name] :
  /// Specifies the name or the CloudTrail ARN of the trail to be deleted. The
  /// format of a trail ARN is:
  /// <code>arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail</code>
  Future<void> deleteTrail({
    required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
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

  /// Retrieves settings for one or more trails associated with the current
  /// region for your account.
  ///
  /// May throw [UnsupportedOperationException].
  /// May throw [OperationNotPermittedException].
  /// May throw [InvalidTrailNameException].
  ///
  /// Parameter [includeShadowTrails] :
  /// Specifies whether to include shadow trails in the response. A shadow trail
  /// is the replication in a region of a trail that was created in a different
  /// region, or in the case of an organization trail, the replication of an
  /// organization trail in member accounts. If you do not include shadow
  /// trails, organization trails in a member account and region replication
  /// trails will not be returned. The default is true.
  ///
  /// Parameter [trailNameList] :
  /// Specifies a list of trail names, trail ARNs, or both, of the trails to
  /// describe. The format of a trail ARN is:
  ///
  /// <code>arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail</code>
  ///
  /// If an empty list is specified, information for the trail in the current
  /// region is returned.
  ///
  /// <ul>
  /// <li>
  /// If an empty list is specified and <code>IncludeShadowTrails</code> is
  /// false, then information for all trails in the current region is returned.
  /// </li>
  /// <li>
  /// If an empty list is specified and IncludeShadowTrails is null or true,
  /// then information for all trails in the current region and any associated
  /// shadow trails in other regions is returned.
  /// </li>
  /// </ul> <note>
  /// If one or more trail names are specified, information is returned only if
  /// the names match the names of trails belonging only to the current region.
  /// To return information about a trail in another region, you must specify
  /// its trail ARN.
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
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-management-and-data-events-with-cloudtrail.html">Logging
  /// Data and Management Events for Trails </a> in the <i>AWS CloudTrail User
  /// Guide</i>.
  ///
  /// May throw [TrailNotFoundException].
  /// May throw [InvalidTrailNameException].
  /// May throw [UnsupportedOperationException].
  /// May throw [OperationNotPermittedException].
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
    ArgumentError.checkNotNull(trailName, 'trailName');
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

  /// Describes the settings for the Insights event selectors that you
  /// configured for your trail. <code>GetInsightSelectors</code> shows if
  /// CloudTrail Insights event logging is enabled on the trail, and if it is,
  /// which insight types are enabled. If you run
  /// <code>GetInsightSelectors</code> on a trail that does not have Insights
  /// events enabled, the operation throws the exception
  /// <code>InsightNotEnabledException</code>
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-insights-events-with-cloudtrail.html">Logging
  /// CloudTrail Insights Events for Trails </a> in the <i>AWS CloudTrail User
  /// Guide</i>.
  ///
  /// May throw [TrailNotFoundException].
  /// May throw [InvalidTrailNameException].
  /// May throw [UnsupportedOperationException].
  /// May throw [OperationNotPermittedException].
  /// May throw [InsightNotEnabledException].
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
  Future<GetInsightSelectorsResponse> getInsightSelectors({
    required String trailName,
  }) async {
    ArgumentError.checkNotNull(trailName, 'trailName');
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
        'TrailName': trailName,
      },
    );

    return GetInsightSelectorsResponse.fromJson(jsonResponse.body);
  }

  /// Returns settings information for a specified trail.
  ///
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
    ArgumentError.checkNotNull(name, 'name');
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
  /// returns trail status from a single region. To return trail status from all
  /// regions, you must call the operation on each region.
  ///
  /// May throw [TrailNotFoundException].
  /// May throw [InvalidTrailNameException].
  /// May throw [UnsupportedOperationException].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [name] :
  /// Specifies the name or the CloudTrail ARN of the trail for which you are
  /// requesting status. To get the status of a shadow trail (a replication of
  /// the trail in another region), you must specify its ARN. The format of a
  /// trail ARN is:
  ///
  /// <code>arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail</code>
  Future<GetTrailStatusResponse> getTrailStatus({
    required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
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

  /// Returns all public keys whose private keys were used to sign the digest
  /// files within the specified time range. The public key is needed to
  /// validate digest files that were signed with its corresponding private key.
  /// <note>
  /// CloudTrail uses different private/public key pairs per region. Each digest
  /// file is signed with a private key unique to its region. Therefore, when
  /// you validate a digest file from a particular region, you must look in the
  /// same region for its corresponding public key.
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

  /// Lists the tags for the trail in the current region.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [CloudTrailARNInvalidException].
  /// May throw [ResourceTypeNotSupportedException].
  /// May throw [InvalidTrailNameException].
  /// May throw [UnsupportedOperationException].
  /// May throw [OperationNotPermittedException].
  /// May throw [InvalidTokenException].
  ///
  /// Parameter [resourceIdList] :
  /// Specifies a list of trail ARNs whose tags will be listed. The list has a
  /// limit of 20 ARNs. The format of a trail ARN is:
  ///
  /// <code>arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail</code>
  ///
  /// Parameter [nextToken] :
  /// Reserved for future use.
  Future<ListTagsResponse> listTags({
    required List<String> resourceIdList,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(resourceIdList, 'resourceIdList');
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
  /// specified in the the original call. For example, if the original call
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
  /// events that occurred in a region within the last 90 days. Lookup supports
  /// the following attributes for management events:
  ///
  /// <ul>
  /// <li>
  /// AWS access key
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
  /// region. If this limit is exceeded, a throttling error occurs.
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
  /// specified in the the original call. For example, if the original call
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
  /// data event settings for your trail. By default, trails created without
  /// specific event selectors are configured to log all read and write
  /// management events, and no data events.
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
  /// region in which the trail was created; otherwise, an
  /// <code>InvalidHomeRegionException</code> exception is thrown.
  ///
  /// You can configure up to five event selectors for each trail. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-management-and-data-events-with-cloudtrail.html">Logging
  /// data and management events for trails </a> and <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/WhatIsCloudTrail-Limits.html">Quotas
  /// in AWS CloudTrail</a> in the <i>AWS CloudTrail User Guide</i>.
  ///
  /// You can add advanced event selectors, and conditions for your advanced
  /// event selectors, up to a maximum of 500 values for all conditions and
  /// selectors on a trail. You can use either
  /// <code>AdvancedEventSelectors</code> or <code>EventSelectors</code>, but
  /// not both. If you apply <code>AdvancedEventSelectors</code> to a trail, any
  /// existing <code>EventSelectors</code> are overwritten. For more information
  /// about advanced event selectors, see <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-data-events-with-cloudtrail.html">Logging
  /// data events for trails</a> in the <i>AWS CloudTrail User Guide</i>.
  ///
  /// May throw [TrailNotFoundException].
  /// May throw [InvalidTrailNameException].
  /// May throw [InvalidHomeRegionException].
  /// May throw [InvalidEventSelectorsException].
  /// May throw [UnsupportedOperationException].
  /// May throw [OperationNotPermittedException].
  /// May throw [NotOrganizationMasterAccountException].
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
  /// <code>my-_namespace</code> and <code>my--namespace</code> are invalid.
  /// </li>
  /// <li>
  /// Not be in IP address format (for example, 192.168.5.4)
  /// </li>
  /// </ul>
  /// If you specify a trail ARN, it must be in the format:
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
  /// data events for trails</a> in the <i>AWS CloudTrail User Guide</i>.
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
    ArgumentError.checkNotNull(trailName, 'trailName');
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
  /// selectors that you want to enable on an existing trail. You also use
  /// <code>PutInsightSelectors</code> to turn off Insights event logging, by
  /// passing an empty list of insight types. In this release, only
  /// <code>ApiCallRateInsight</code> is supported as an Insights selector.
  ///
  /// May throw [TrailNotFoundException].
  /// May throw [InvalidTrailNameException].
  /// May throw [InvalidHomeRegionException].
  /// May throw [InvalidInsightSelectorsException].
  /// May throw [InsufficientS3BucketPolicyException].
  /// May throw [InsufficientEncryptionPolicyException].
  /// May throw [S3BucketDoesNotExistException].
  /// May throw [KmsException].
  /// May throw [UnsupportedOperationException].
  /// May throw [OperationNotPermittedException].
  /// May throw [NotOrganizationMasterAccountException].
  ///
  /// Parameter [insightSelectors] :
  /// A JSON string that contains the insight types you want to log on a trail.
  /// In this release, only <code>ApiCallRateInsight</code> is supported as an
  /// insight type.
  ///
  /// Parameter [trailName] :
  /// The name of the CloudTrail trail for which you want to change or add
  /// Insights selectors.
  Future<PutInsightSelectorsResponse> putInsightSelectors({
    required List<InsightSelector> insightSelectors,
    required String trailName,
  }) async {
    ArgumentError.checkNotNull(insightSelectors, 'insightSelectors');
    ArgumentError.checkNotNull(trailName, 'trailName');
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
        'TrailName': trailName,
      },
    );

    return PutInsightSelectorsResponse.fromJson(jsonResponse.body);
  }

  /// Removes the specified tags from a trail.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [CloudTrailARNInvalidException].
  /// May throw [ResourceTypeNotSupportedException].
  /// May throw [InvalidTrailNameException].
  /// May throw [InvalidTagParameterException].
  /// May throw [UnsupportedOperationException].
  /// May throw [OperationNotPermittedException].
  /// May throw [NotOrganizationMasterAccountException].
  ///
  /// Parameter [resourceId] :
  /// Specifies the ARN of the trail from which tags should be removed. The
  /// format of a trail ARN is:
  ///
  /// <code>arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail</code>
  ///
  /// Parameter [tagsList] :
  /// Specifies a list of tags to be removed.
  Future<void> removeTags({
    required String resourceId,
    List<Tag>? tagsList,
  }) async {
    ArgumentError.checkNotNull(resourceId, 'resourceId');
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
        if (tagsList != null) 'TagsList': tagsList,
      },
    );
  }

  /// Starts the recording of AWS API calls and log file delivery for a trail.
  /// For a trail that is enabled in all regions, this operation must be called
  /// from the region in which the trail was created. This operation cannot be
  /// called on the shadow trails (replicated trails in other regions) of a
  /// trail that is enabled in all regions.
  ///
  /// May throw [TrailNotFoundException].
  /// May throw [InvalidTrailNameException].
  /// May throw [InvalidHomeRegionException].
  /// May throw [UnsupportedOperationException].
  /// May throw [OperationNotPermittedException].
  /// May throw [NotOrganizationMasterAccountException].
  /// May throw [InsufficientDependencyServiceAccessPermissionException].
  ///
  /// Parameter [name] :
  /// Specifies the name or the CloudTrail ARN of the trail for which CloudTrail
  /// logs AWS API calls. The format of a trail ARN is:
  ///
  /// <code>arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail</code>
  Future<void> startLogging({
    required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
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

  /// Suspends the recording of AWS API calls and log file delivery for the
  /// specified trail. Under most circumstances, there is no need to use this
  /// action. You can update a trail without stopping it first. This action is
  /// the only way to stop recording. For a trail enabled in all regions, this
  /// operation must be called from the region in which the trail was created,
  /// or an <code>InvalidHomeRegionException</code> will occur. This operation
  /// cannot be called on the shadow trails (replicated trails in other regions)
  /// of a trail enabled in all regions.
  ///
  /// May throw [TrailNotFoundException].
  /// May throw [InvalidTrailNameException].
  /// May throw [InvalidHomeRegionException].
  /// May throw [UnsupportedOperationException].
  /// May throw [OperationNotPermittedException].
  /// May throw [NotOrganizationMasterAccountException].
  /// May throw [InsufficientDependencyServiceAccessPermissionException].
  ///
  /// Parameter [name] :
  /// Specifies the name or the CloudTrail ARN of the trail for which CloudTrail
  /// will stop logging AWS API calls. The format of a trail ARN is:
  ///
  /// <code>arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail</code>
  Future<void> stopLogging({
    required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
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

  /// Updates the settings that specify delivery of log files. Changes to a
  /// trail do not require stopping the CloudTrail service. Use this action to
  /// designate an existing bucket for log delivery. If the existing bucket has
  /// previously been a target for CloudTrail log files, an IAM policy exists
  /// for the bucket. <code>UpdateTrail</code> must be called from the region in
  /// which the trail was created; otherwise, an
  /// <code>InvalidHomeRegionException</code> is thrown.
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
  /// May throw [CloudTrailInvalidClientTokenIdException].
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
  /// <code>my-_namespace</code> and <code>my--namespace</code> are invalid.
  /// </li>
  /// <li>
  /// Not be in IP address format (for example, 192.168.5.4)
  /// </li>
  /// </ul>
  /// If <code>Name</code> is a trail ARN, it must be in the format:
  ///
  /// <code>arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail</code>
  ///
  /// Parameter [cloudWatchLogsLogGroupArn] :
  /// Specifies a log group name using an Amazon Resource Name (ARN), a unique
  /// identifier that represents the log group to which CloudTrail logs will be
  /// delivered. Not required unless you specify CloudWatchLogsRoleArn.
  ///
  /// Parameter [cloudWatchLogsRoleArn] :
  /// Specifies the role for the CloudWatch Logs endpoint to assume to write to
  /// a user's log group.
  ///
  /// Parameter [enableLogFileValidation] :
  /// Specifies whether log file validation is enabled. The default is false.
  /// <note>
  /// When you disable log file integrity validation, the chain of digest files
  /// is broken after one hour. CloudTrail will not create digest files for log
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
  /// Specifies whether the trail applies only to the current region or to all
  /// regions. The default is false. If the trail exists only in the current
  /// region and this value is set to true, shadow trails (replications of the
  /// trail) will be created in the other regions. If the trail exists in all
  /// regions and this value is set to false, the trail will remain in the
  /// region where it was created, and its shadow trails in other regions will
  /// be deleted. As a best practice, consider using trails that log events in
  /// all regions.
  ///
  /// Parameter [isOrganizationTrail] :
  /// Specifies whether the trail is applied to all accounts in an organization
  /// in AWS Organizations, or only for the current AWS account. The default is
  /// false, and cannot be true unless the call is made on behalf of an AWS
  /// account that is the master account for an organization in AWS
  /// Organizations. If the trail is not an organization trail and this is set
  /// to true, the trail will be created in all AWS accounts that belong to the
  /// organization. If the trail is an organization trail and this is set to
  /// false, the trail will remain in the current AWS account but be deleted
  /// from all member accounts in the organization.
  ///
  /// Parameter [kmsKeyId] :
  /// Specifies the KMS key ID to use to encrypt the logs delivered by
  /// CloudTrail. The value can be an alias name prefixed by "alias/", a fully
  /// specified ARN to an alias, a fully specified ARN to a key, or a globally
  /// unique identifier.
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
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/create_trail_naming_policy.html">Amazon
  /// S3 Bucket Naming Requirements</a>.
  ///
  /// Parameter [s3KeyPrefix] :
  /// Specifies the Amazon S3 key prefix that comes after the name of the bucket
  /// you have designated for log file delivery. For more information, see <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-find-log-files.html">Finding
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
    ArgumentError.checkNotNull(name, 'name');
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

/// Returns the objects or data listed below if successful. Otherwise, returns
/// an error.
class AddTagsResponse {
  AddTagsResponse();

  factory AddTagsResponse.fromJson(Map<String, dynamic> _) {
    return AddTagsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Advanced event selectors let you create fine-grained selectors for the
/// following AWS CloudTrail event record ﬁelds. They help you control costs by
/// logging only those events that are important to you. For more information
/// about advanced event selectors, see <a
/// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-data-events-with-cloudtrail.html">Logging
/// data events for trails</a> in the <i>AWS CloudTrail User Guide</i>.
///
/// <ul>
/// <li>
/// <code>readOnly</code>
/// </li>
/// <li>
/// <code>eventSource</code>
/// </li>
/// <li>
/// <code>eventName</code>
/// </li>
/// <li>
/// <code>eventCategory</code>
/// </li>
/// <li>
/// <code>resources.type</code>
/// </li>
/// <li>
/// <code>resources.ARN</code>
/// </li>
/// </ul>
/// You cannot apply both event selectors and advanced event selectors to a
/// trail.
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
  /// A field in an event record on which to filter events to be logged. Supported
  /// fields include <code>readOnly</code>, <code>eventCategory</code>,
  /// <code>eventSource</code> (for management events), <code>eventName</code>,
  /// <code>resources.type</code>, and <code>resources.ARN</code>.
  ///
  /// <ul>
  /// <li>
  /// <b> <code>readOnly</code> </b> - Optional. Can be set to <code>Equals</code>
  /// a value of <code>true</code> or <code>false</code>. A value of
  /// <code>false</code> logs both <code>read</code> and <code>write</code>
  /// events.
  /// </li>
  /// <li>
  /// <b> <code>eventSource</code> </b> - For filtering management events only.
  /// This can be set only to <code>NotEquals</code>
  /// <code>kms.amazonaws.com</code>.
  /// </li>
  /// <li>
  /// <b> <code>eventName</code> </b> - Can use any operator. You can use it to
  /// ﬁlter in or ﬁlter out any data event logged to CloudTrail, such as
  /// <code>PutBucket</code>. You can have multiple values for this ﬁeld,
  /// separated by commas.
  /// </li>
  /// <li>
  /// <b> <code>eventCategory</code> </b> - This is required. It must be set to
  /// <code>Equals</code>, and the value must be <code>Management</code> or
  /// <code>Data</code>.
  /// </li>
  /// <li>
  /// <b> <code>resources.type</code> </b> - This ﬁeld is required.
  /// <code>resources.type</code> can only use the <code>Equals</code> operator,
  /// and the value can be one of the following: <code>AWS::S3::Object</code>,
  /// <code>AWS::Lambda::Function</code>, <code>AWS::DynamoDB::Table</code>,
  /// <code>AWS::S3Outposts::Object</code>,
  /// <code>AWS::ManagedBlockchain::Node</code>, or
  /// <code>AWS::S3ObjectLambda::AccessPoint</code>. You can have only one
  /// <code>resources.type</code> ﬁeld per selector. To log data events on more
  /// than one resource type, add another selector.
  /// </li>
  /// <li>
  /// <b> <code>resources.ARN</code> </b> - You can use any operator with
  /// resources.ARN, but if you use <code>Equals</code> or <code>NotEquals</code>,
  /// the value must exactly match the ARN of a valid resource of the type you've
  /// speciﬁed in the template as the value of resources.type. For example, if
  /// resources.type equals <code>AWS::S3::Object</code>, the ARN must be in one
  /// of the following formats. To log all data events for all objects in a
  /// specific S3 bucket, use the <code>StartsWith</code> operator, and include
  /// only the bucket ARN as the matching value.
  ///
  /// The trailing slash is intentional; do not exclude it.
  ///
  /// <ul>
  /// <li>
  /// <code>arn:partition:s3:::bucket_name/</code>
  /// </li>
  /// <li>
  /// <code>arn:partition:s3:::bucket_name/object_or_file_name/</code>
  /// </li>
  /// </ul>
  /// When resources.type equals <code>AWS::Lambda::Function</code>, and the
  /// operator is set to <code>Equals</code> or <code>NotEquals</code>, the ARN
  /// must be in the following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:partition:lambda:region:account_ID:function:function_name</code>
  /// </li>
  /// </ul>
  /// When resources.type equals <code>AWS::DynamoDB::Table</code>, and the
  /// operator is set to <code>Equals</code> or <code>NotEquals</code>, the ARN
  /// must be in the following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:partition:dynamodb:region:account_ID:table:table_name</code>
  /// </li>
  /// </ul>
  /// When <code>resources.type</code> equals
  /// <code>AWS::S3Outposts::Object</code>, and the operator is set to
  /// <code>Equals</code> or <code>NotEquals</code>, the ARN must be in the
  /// following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:partition:s3-outposts:region:&gt;account_ID:object_path</code>
  /// </li>
  /// </ul>
  /// When <code>resources.type</code> equals
  /// <code>AWS::ManagedBlockchain::Node</code>, and the operator is set to
  /// <code>Equals</code> or <code>NotEquals</code>, the ARN must be in the
  /// following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:partition:managedblockchain:region:account_ID:nodes/node_ID</code>
  /// </li>
  /// </ul>
  /// When <code>resources.type</code> equals
  /// <code>AWS::S3ObjectLambda::AccessPoint</code>, and the operator is set to
  /// <code>Equals</code> or <code>NotEquals</code>, the ARN must be in the
  /// following format:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:partition:s3-object-lambda:region:account_ID:accesspoint/access_point_name</code>
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

  /// Specifies whether the trail exists in one region or in all regions.
  final bool? isMultiRegionTrail;

  /// Specifies whether the trail is an organization trail.
  final bool? isOrganizationTrail;

  /// Specifies the KMS key ID that encrypts the logs delivered by CloudTrail. The
  /// value is a fully specified ARN to a KMS key in the format:
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
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-find-log-files.html">Finding
  /// Your CloudTrail Log Files</a>.
  final String? s3KeyPrefix;

  /// Specifies the ARN of the Amazon SNS topic that CloudTrail uses to send
  /// notifications when log files are delivered. The format of a topic ARN is:
  ///
  /// <code>arn:aws:sns:us-east-2:123456789012:MyTopic</code>
  final String? snsTopicARN;

  /// This field is no longer in use. Use SnsTopicARN.
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

/// The Amazon S3 buckets, AWS Lambda functions, or Amazon DynamoDB tables that
/// you specify in your event selectors for your trail to log data events. Data
/// events provide information about the resource operations performed on or
/// within a resource itself. These are also known as data plane operations. You
/// can specify up to 250 data resources for a trail.
/// <note>
/// The total number of allowed data resources is 250. This number can be
/// distributed between 1 and 5 event selectors, but the total cannot exceed 250
/// across all selectors.
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
/// logging of AWS Lambda data events for a Lambda function named
/// <i>MyLambdaFunction</i>, but not for all AWS Lambda functions.
/// <ol>
/// <li>
/// A user runs a script that includes a call to the <i>MyLambdaFunction</i>
/// function and the <i>MyOtherLambdaFunction</i> function.
/// </li>
/// <li>
/// The <code>Invoke</code> API operation on <i>MyLambdaFunction</i> is an AWS
/// Lambda API. It is recorded as a data event in CloudTrail. Because the
/// CloudTrail user specified logging data events for <i>MyLambdaFunction</i>,
/// any invocations of that function are logged. The trail processes and logs
/// the event.
/// </li>
/// <li>
/// The <code>Invoke</code> API operation on <i>MyOtherLambdaFunction</i> is an
/// AWS Lambda API. Because the CloudTrail user did not specify logging data
/// events for all Lambda functions, the <code>Invoke</code> operation for
/// <i>MyOtherLambdaFunction</i> does not match the function specified for the
/// trail. The trail doesn’t log the event.
/// </li> </ol>
class DataResource {
  /// The resource type in which you want to log data events. You can specify
  /// <code>AWS::S3::Object</code>, <code>AWS::Lambda::Function</code>, or
  /// <code>AWS::DynamoDB::Table</code> resources.
  ///
  /// The <code>AWS::S3Outposts::Object</code>,
  /// <code>AWS::ManagedBlockchain::Node</code>, and
  /// <code>AWS::S3ObjectLambda::AccessPoint</code> resource types are not valid
  /// in basic event selectors. To log data events on these resource types, use
  /// advanced event selectors.
  final String? type;

  /// An array of Amazon Resource Name (ARN) strings or partial ARN strings for
  /// the specified objects.
  ///
  /// <ul>
  /// <li>
  /// To log data events for all objects in all S3 buckets in your AWS account,
  /// specify the prefix as <code>arn:aws:s3:::</code>.
  /// <note>
  /// This will also enable logging of data event activity performed by any user
  /// or role in your AWS account, even if that activity is performed on a bucket
  /// that belongs to another AWS account.
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
  /// To log data events for all Lambda functions in your AWS account, specify the
  /// prefix as <code>arn:aws:lambda</code>.
  /// <note>
  /// This will also enable logging of <code>Invoke</code> activity performed by
  /// any user or role in your AWS account, even if that activity is performed on
  /// a function that belongs to another AWS account.
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
  /// To log data events for all DynamoDB tables in your AWS account, specify the
  /// prefix as <code>arn:aws:dynamodb</code>.
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

/// Returns the objects or data listed below if successful. Otherwise, returns
/// an error.
class DescribeTrailsResponse {
  /// The list of trail objects. Trail objects with string values are only
  /// returned if values for the objects exist in a trail's configuration. For
  /// example, <code>SNSTopicName</code> and <code>SNSTopicARN</code> are only
  /// returned in results if a trail is configured to send SNS notifications.
  /// Similarly, <code>KMSKeyId</code> only appears in results if a trail's log
  /// files are encrypted with AWS KMS-managed keys.
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

/// Contains information about an event that was returned by a lookup request.
/// The result includes a representation of a CloudTrail event.
class Event {
  /// The AWS access key ID that was used to sign the request. If the request was
  /// made with temporary security credentials, this is the access key ID of the
  /// temporary credentials.
  final String? accessKeyId;

  /// A JSON string that contains a representation of the event returned.
  final String? cloudTrailEvent;

  /// The CloudTrail ID of the event returned.
  final String? eventId;

  /// The name of the event returned.
  final String? eventName;

  /// The AWS service that the request was made to.
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

extension on EventCategory {
  String toValue() {
    switch (this) {
      case EventCategory.insight:
        return 'insight';
    }
  }
}

extension on String {
  EventCategory toEventCategory() {
    switch (this) {
      case 'insight':
        return EventCategory.insight;
    }
    throw Exception('$this is not known in enum EventCategory');
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
  /// CloudTrail supports data event logging for Amazon S3 objects and AWS Lambda
  /// functions with basic event selectors. You can specify up to 250 resources
  /// for an individual event selector, but the total number of data resources
  /// cannot exceed 250 across all event selectors in a trail. This limit does not
  /// apply if you configure resource logging for all data events.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-management-and-data-events-with-cloudtrail.html#logging-data-events">Data
  /// Events</a> and <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/WhatIsCloudTrail-Limits.html">Limits
  /// in AWS CloudTrail</a> in the <i>AWS CloudTrail User Guide</i>.
  final List<DataResource>? dataResources;

  /// An optional list of service event sources from which you do not want
  /// management events to be logged on your trail. In this release, the list can
  /// be empty (disables the filter), or it can filter out AWS Key Management
  /// Service events by containing <code>"kms.amazonaws.com"</code>. By default,
  /// <code>ExcludeManagementEventSources</code> is empty, and AWS KMS events are
  /// included in events that are logged to your trail.
  final List<String>? excludeManagementEventSources;

  /// Specify if you want your event selector to include management events for
  /// your trail.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-management-and-data-events-with-cloudtrail.html#logging-management-events">Management
  /// Events</a> in the <i>AWS CloudTrail User Guide</i>.
  ///
  /// By default, the value is <code>true</code>.
  ///
  /// The first copy of management events is free. You are charged for additional
  /// copies of management events that you are logging on any subsequent trail in
  /// the same region. For more information about CloudTrail pricing, see <a
  /// href="http://aws.amazon.com/cloudtrail/pricing/">AWS CloudTrail Pricing</a>.
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

class GetInsightSelectorsResponse {
  /// A JSON string that contains the insight types you want to log on a trail. In
  /// this release, only <code>ApiCallRateInsight</code> is supported as an
  /// insight type.
  final List<InsightSelector>? insightSelectors;

  /// The Amazon Resource Name (ARN) of a trail for which you want to get Insights
  /// selectors.
  final String? trailARN;

  GetInsightSelectorsResponse({
    this.insightSelectors,
    this.trailARN,
  });

  factory GetInsightSelectorsResponse.fromJson(Map<String, dynamic> json) {
    return GetInsightSelectorsResponse(
      insightSelectors: (json['InsightSelectors'] as List?)
          ?.whereNotNull()
          .map((e) => InsightSelector.fromJson(e as Map<String, dynamic>))
          .toList(),
      trailARN: json['TrailARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final insightSelectors = this.insightSelectors;
    final trailARN = this.trailARN;
    return {
      if (insightSelectors != null) 'InsightSelectors': insightSelectors,
      if (trailARN != null) 'TrailARN': trailARN,
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
  /// Whether the CloudTrail is currently logging AWS API calls.
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
  /// deliver log files to the designated bucket. For more information see the
  /// topic <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/ErrorResponses.html">Error
  /// Responses</a> in the Amazon S3 API Reference.
  /// <note>
  /// This error occurs only when there is a problem with the destination S3
  /// bucket and will not occur for timeouts. To resolve the issue, create a new
  /// bucket and call <code>UpdateTrail</code> to specify the new bucket, or fix
  /// the existing objects so that CloudTrail can again write to the bucket.
  /// </note>
  final String? latestDeliveryError;

  /// Specifies the date and time that CloudTrail last delivered log files to an
  /// account's Amazon S3 bucket.
  final DateTime? latestDeliveryTime;

  /// Displays any Amazon S3 error that CloudTrail encountered when attempting to
  /// deliver a digest file to the designated bucket. For more information see the
  /// topic <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/ErrorResponses.html">Error
  /// Responses</a> in the Amazon S3 API Reference.
  /// <note>
  /// This error occurs only when there is a problem with the destination S3
  /// bucket and will not occur for timeouts. To resolve the issue, create a new
  /// bucket and call <code>UpdateTrail</code> to specify the new bucket, or fix
  /// the existing objects so that CloudTrail can again write to the bucket.
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
  /// API calls for an AWS account.
  final DateTime? startLoggingTime;

  /// Specifies the most recent date and time when CloudTrail stopped recording
  /// API calls for an AWS account.
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

/// A JSON string that contains a list of insight types that are logged on a
/// trail.
class InsightSelector {
  /// The type of insights to log on a trail. In this release, only
  /// <code>ApiCallRateInsight</code> is supported as an insight type.
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
}

extension on InsightType {
  String toValue() {
    switch (this) {
      case InsightType.apiCallRateInsight:
        return 'ApiCallRateInsight';
    }
  }
}

extension on String {
  InsightType toInsightType() {
    switch (this) {
      case 'ApiCallRateInsight':
        return InsightType.apiCallRateInsight;
    }
    throw Exception('$this is not known in enum InsightType');
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

  /// Returns the name, ARN, and home region of trails in the current account.
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

  /// Specifies a value for the specified AttributeKey.
  final String attributeValue;

  LookupAttribute({
    required this.attributeKey,
    required this.attributeValue,
  });

  factory LookupAttribute.fromJson(Map<String, dynamic> json) {
    return LookupAttribute(
      attributeKey: (json['AttributeKey'] as String).toLookupAttributeKey(),
      attributeValue: json['AttributeValue'] as String,
    );
  }

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

extension on LookupAttributeKey {
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

extension on String {
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
  /// format of a trail ARN is:
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
  /// A JSON string that contains the insight types you want to log on a trail. In
  /// this release, only <code>ApiCallRateInsight</code> is supported as an
  /// insight type.
  final List<InsightSelector>? insightSelectors;

  /// The Amazon Resource Name (ARN) of a trail for which you want to change or
  /// add Insights selectors.
  final String? trailARN;

  PutInsightSelectorsResponse({
    this.insightSelectors,
    this.trailARN,
  });

  factory PutInsightSelectorsResponse.fromJson(Map<String, dynamic> json) {
    return PutInsightSelectorsResponse(
      insightSelectors: (json['InsightSelectors'] as List?)
          ?.whereNotNull()
          .map((e) => InsightSelector.fromJson(e as Map<String, dynamic>))
          .toList(),
      trailARN: json['TrailARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final insightSelectors = this.insightSelectors;
    final trailARN = this.trailARN;
    return {
      if (insightSelectors != null) 'InsightSelectors': insightSelectors,
      if (trailARN != null) 'TrailARN': trailARN,
    };
  }
}

enum ReadWriteType {
  readOnly,
  writeOnly,
  all,
}

extension on ReadWriteType {
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

extension on String {
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
  /// for RDS, and <b>AccessKey</b> for IAM. To learn more about how to look up
  /// and filter events by the resource types supported for a service, see <a
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
/// trail.
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

  /// The region in which the trail was created.
  final String? homeRegion;

  /// Set to <b>True</b> to include AWS API calls from AWS global services such as
  /// IAM. Otherwise, <b>False</b>.
  final bool? includeGlobalServiceEvents;

  /// Specifies whether the trail exists only in one region or exists in all
  /// regions.
  final bool? isMultiRegionTrail;

  /// Specifies whether the trail is an organization trail.
  final bool? isOrganizationTrail;

  /// Specifies the KMS key ID that encrypts the logs delivered by CloudTrail. The
  /// value is a fully specified ARN to a KMS key in the format:
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
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/create_trail_naming_policy.html">Amazon
  /// S3 Bucket Naming Requirements</a>.
  final String? s3BucketName;

  /// Specifies the Amazon S3 key prefix that comes after the name of the bucket
  /// you have designated for log file delivery. For more information, see <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-find-log-files.html">Finding
  /// Your CloudTrail Log Files</a>.The maximum length is 200 characters.
  final String? s3KeyPrefix;

  /// Specifies the ARN of the Amazon SNS topic that CloudTrail uses to send
  /// notifications when log files are delivered. The format of a topic ARN is:
  ///
  /// <code>arn:aws:sns:us-east-2:123456789012:MyTopic</code>
  final String? snsTopicARN;

  /// This field is no longer in use. Use SnsTopicARN.
  final String? snsTopicName;

  /// Specifies the ARN of the trail. The format of a trail ARN is:
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
/// region, and Amazon Resource Name (ARN).
class TrailInfo {
  /// The AWS region in which a trail was created.
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

/// Returns the objects or data listed below if successful. Otherwise, returns
/// an error.
class UpdateTrailResponse {
  /// Specifies the Amazon Resource Name (ARN) of the log group to which
  /// CloudTrail logs will be delivered.
  final String? cloudWatchLogsLogGroupArn;

  /// Specifies the role for the CloudWatch Logs endpoint to assume to write to a
  /// user's log group.
  final String? cloudWatchLogsRoleArn;

  /// Specifies whether the trail is publishing events from global services such
  /// as IAM to the log files.
  final bool? includeGlobalServiceEvents;

  /// Specifies whether the trail exists in one region or in all regions.
  final bool? isMultiRegionTrail;

  /// Specifies whether the trail is an organization trail.
  final bool? isOrganizationTrail;

  /// Specifies the KMS key ID that encrypts the logs delivered by CloudTrail. The
  /// value is a fully specified ARN to a KMS key in the format:
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
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-find-log-files.html">Finding
  /// Your CloudTrail Log Files</a>.
  final String? s3KeyPrefix;

  /// Specifies the ARN of the Amazon SNS topic that CloudTrail uses to send
  /// notifications when log files are delivered. The format of a topic ARN is:
  ///
  /// <code>arn:aws:sns:us-east-2:123456789012:MyTopic</code>
  final String? snsTopicARN;

  /// This field is no longer in use. Use SnsTopicARN.
  final String? snsTopicName;

  /// Specifies the ARN of the trail that was updated. The format of a trail ARN
  /// is:
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

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
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

class InvalidEventCategoryException extends _s.GenericAwsException {
  InvalidEventCategoryException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidEventCategoryException',
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

class MaximumNumberOfTrailsExceededException extends _s.GenericAwsException {
  MaximumNumberOfTrailsExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'MaximumNumberOfTrailsExceededException',
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

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
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
  'CloudTrailARNInvalidException': (type, message) =>
      CloudTrailARNInvalidException(type: type, message: message),
  'CloudTrailAccessNotEnabledException': (type, message) =>
      CloudTrailAccessNotEnabledException(type: type, message: message),
  'CloudTrailInvalidClientTokenIdException': (type, message) =>
      CloudTrailInvalidClientTokenIdException(type: type, message: message),
  'CloudWatchLogsDeliveryUnavailableException': (type, message) =>
      CloudWatchLogsDeliveryUnavailableException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
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
  'InvalidEventCategoryException': (type, message) =>
      InvalidEventCategoryException(type: type, message: message),
  'InvalidEventSelectorsException': (type, message) =>
      InvalidEventSelectorsException(type: type, message: message),
  'InvalidHomeRegionException': (type, message) =>
      InvalidHomeRegionException(type: type, message: message),
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
  'InvalidS3BucketNameException': (type, message) =>
      InvalidS3BucketNameException(type: type, message: message),
  'InvalidS3PrefixException': (type, message) =>
      InvalidS3PrefixException(type: type, message: message),
  'InvalidSnsTopicNameException': (type, message) =>
      InvalidSnsTopicNameException(type: type, message: message),
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
  'MaximumNumberOfTrailsExceededException': (type, message) =>
      MaximumNumberOfTrailsExceededException(type: type, message: message),
  'NotOrganizationMasterAccountException': (type, message) =>
      NotOrganizationMasterAccountException(type: type, message: message),
  'OperationNotPermittedException': (type, message) =>
      OperationNotPermittedException(type: type, message: message),
  'OrganizationNotInAllFeaturesModeException': (type, message) =>
      OrganizationNotInAllFeaturesModeException(type: type, message: message),
  'OrganizationsNotInUseException': (type, message) =>
      OrganizationsNotInUseException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ResourceTypeNotSupportedException': (type, message) =>
      ResourceTypeNotSupportedException(type: type, message: message),
  'S3BucketDoesNotExistException': (type, message) =>
      S3BucketDoesNotExistException(type: type, message: message),
  'TagsLimitExceededException': (type, message) =>
      TagsLimitExceededException(type: type, message: message),
  'TrailAlreadyExistsException': (type, message) =>
      TrailAlreadyExistsException(type: type, message: message),
  'TrailNotFoundException': (type, message) =>
      TrailNotFoundException(type: type, message: message),
  'TrailNotProvidedException': (type, message) =>
      TrailNotProvidedException(type: type, message: message),
  'UnsupportedOperationException': (type, message) =>
      UnsupportedOperationException(type: type, message: message),
};
