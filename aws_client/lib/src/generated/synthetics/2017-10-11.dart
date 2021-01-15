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
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        timeStampFromJson,
        RfcDateTimeConverter,
        IsoDateTimeConverter,
        UnixDateTimeConverter,
        StringJsonConverter,
        Base64JsonConverter;

export '../../shared/shared.dart' show AwsClientCredentials;

part '2017-10-11.g.dart';

/// You can use Amazon CloudWatch Synthetics to continually monitor your
/// services. You can create and manage <i>canaries</i>, which are modular,
/// lightweight scripts that monitor your endpoints and APIs from the
/// outside-in. You can set up your canaries to run 24 hours a day, once per
/// minute. The canaries help you check the availability and latency of your web
/// services and troubleshoot anomalies by investigating load time data,
/// screenshots of the UI, logs, and metrics. The canaries seamlessly integrate
/// with CloudWatch ServiceLens to help you trace the causes of impacted nodes
/// in your applications. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/ServiceLens.html">Using
/// ServiceLens to Monitor the Health of Your Applications</a> in the <i>Amazon
/// CloudWatch User Guide</i>.
class Synthetics {
  final _s.RestJsonProtocol _protocol;
  Synthetics({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'synthetics',
            signingName: 'synthetics',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Creates a canary. Canaries are scripts that monitor your endpoints and
  /// APIs from the outside-in. Canaries help you check the availability and
  /// latency of your web services and troubleshoot anomalies by investigating
  /// load time data, screenshots of the UI, logs, and metrics. You can set up a
  /// canary to run continuously or just once.
  ///
  /// Do not use <code>CreateCanary</code> to modify an existing canary. Use <a
  /// href="https://docs.aws.amazon.com/AmazonSynthetics/latest/APIReference/API_UpdateCanary.html">UpdateCanary</a>
  /// instead.
  ///
  /// To create canaries, you must have the
  /// <code>CloudWatchSyntheticsFullAccess</code> policy. If you are creating a
  /// new IAM role for the canary, you also need the the
  /// <code>iam:CreateRole</code>, <code>iam:CreatePolicy</code> and
  /// <code>iam:AttachRolePolicy</code> permissions. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_Roles">Necessary
  /// Roles and Permissions</a>.
  ///
  /// Do not include secrets or proprietary information in your canary names.
  /// The canary name makes up part of the Amazon Resource Name (ARN) for the
  /// canary, and the ARN is included in outbound calls over the internet. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/servicelens_canaries_security.html">Security
  /// Considerations for Synthetics Canaries</a>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [artifactS3Location] :
  /// The location in Amazon S3 where Synthetics stores artifacts from the test
  /// runs of this canary. Artifacts include the log file, screenshots, and HAR
  /// files.
  ///
  /// Parameter [code] :
  /// A structure that includes the entry point from which the canary should
  /// start running your script. If the script is stored in an S3 bucket, the
  /// bucket name, key, and version are also included.
  ///
  /// Parameter [executionRoleArn] :
  /// The ARN of the IAM role to be used to run the canary. This role must
  /// already exist, and must include <code>lambda.amazonaws.com</code> as a
  /// principal in the trust policy. The role must also have the following
  /// permissions:
  ///
  /// <ul>
  /// <li>
  /// <code>s3:PutObject</code>
  /// </li>
  /// <li>
  /// <code>s3:GetBucketLocation</code>
  /// </li>
  /// <li>
  /// <code>s3:ListAllMyBuckets</code>
  /// </li>
  /// <li>
  /// <code>cloudwatch:PutMetricData</code>
  /// </li>
  /// <li>
  /// <code>logs:CreateLogGroup</code>
  /// </li>
  /// <li>
  /// <code>logs:CreateLogStream</code>
  /// </li>
  /// <li>
  /// <code>logs:PutLogEvents</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [name] :
  /// The name for this canary. Be sure to give it a descriptive name that
  /// distinguishes it from other canaries in your account.
  ///
  /// Do not include secrets or proprietary information in your canary names.
  /// The canary name makes up part of the canary ARN, and the ARN is included
  /// in outbound calls over the internet. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/servicelens_canaries_security.html">Security
  /// Considerations for Synthetics Canaries</a>.
  ///
  /// Parameter [runtimeVersion] :
  /// Specifies the runtime version to use for the canary. For a list of valid
  /// runtime versions and more information about runtime versions, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_Library.html">
  /// Canary Runtime Versions</a>.
  ///
  /// Parameter [schedule] :
  /// A structure that contains information about how often the canary is to run
  /// and when these test runs are to stop.
  ///
  /// Parameter [failureRetentionPeriodInDays] :
  /// The number of days to retain data about failed runs of this canary. If you
  /// omit this field, the default of 31 days is used. The valid range is 1 to
  /// 455 days.
  ///
  /// Parameter [runConfig] :
  /// A structure that contains the configuration for individual canary runs,
  /// such as timeout value.
  ///
  /// Parameter [successRetentionPeriodInDays] :
  /// The number of days to retain data about successful runs of this canary. If
  /// you omit this field, the default of 31 days is used. The valid range is 1
  /// to 455 days.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs to associate with the canary. You can associate
  /// as many as 50 tags with a canary.
  ///
  /// Tags can help you organize and categorize your resources. You can also use
  /// them to scope user permissions, by granting a user permission to access or
  /// change only the resources that have certain tag values.
  ///
  /// Parameter [vpcConfig] :
  /// If this canary is to test an endpoint in a VPC, this structure contains
  /// information about the subnet and security groups of the VPC endpoint. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_VPC.html">
  /// Running a Canary in a VPC</a>.
  Future<CreateCanaryResponse> createCanary({
    @_s.required String artifactS3Location,
    @_s.required CanaryCodeInput code,
    @_s.required String executionRoleArn,
    @_s.required String name,
    @_s.required String runtimeVersion,
    @_s.required CanaryScheduleInput schedule,
    int failureRetentionPeriodInDays,
    CanaryRunConfigInput runConfig,
    int successRetentionPeriodInDays,
    Map<String, String> tags,
    VpcConfigInput vpcConfig,
  }) async {
    ArgumentError.checkNotNull(artifactS3Location, 'artifactS3Location');
    _s.validateStringLength(
      'artifactS3Location',
      artifactS3Location,
      1,
      1024,
      isRequired: true,
    );
    ArgumentError.checkNotNull(code, 'code');
    ArgumentError.checkNotNull(executionRoleArn, 'executionRoleArn');
    _s.validateStringLength(
      'executionRoleArn',
      executionRoleArn,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'executionRoleArn',
      executionRoleArn,
      r'''arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/?[a-zA-Z_0-9+=,.@\-_/]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      21,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[0-9a-z_\-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(runtimeVersion, 'runtimeVersion');
    _s.validateStringLength(
      'runtimeVersion',
      runtimeVersion,
      1,
      1024,
      isRequired: true,
    );
    ArgumentError.checkNotNull(schedule, 'schedule');
    _s.validateNumRange(
      'failureRetentionPeriodInDays',
      failureRetentionPeriodInDays,
      1,
      1024,
    );
    _s.validateNumRange(
      'successRetentionPeriodInDays',
      successRetentionPeriodInDays,
      1,
      1024,
    );
    final $payload = <String, dynamic>{
      'ArtifactS3Location': artifactS3Location,
      'Code': code,
      'ExecutionRoleArn': executionRoleArn,
      'Name': name,
      'RuntimeVersion': runtimeVersion,
      'Schedule': schedule,
      if (failureRetentionPeriodInDays != null)
        'FailureRetentionPeriodInDays': failureRetentionPeriodInDays,
      if (runConfig != null) 'RunConfig': runConfig,
      if (successRetentionPeriodInDays != null)
        'SuccessRetentionPeriodInDays': successRetentionPeriodInDays,
      if (tags != null) 'Tags': tags,
      if (vpcConfig != null) 'VpcConfig': vpcConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/canary',
      exceptionFnMap: _exceptionFns,
    );
    return CreateCanaryResponse.fromJson(response);
  }

  /// Permanently deletes the specified canary.
  ///
  /// When you delete a canary, resources used and created by the canary are not
  /// automatically deleted. After you delete a canary that you do not intend to
  /// use again, you should also delete the following:
  ///
  /// <ul>
  /// <li>
  /// The Lambda functions and layers used by this canary. These have the prefix
  /// <code>cwsyn-<i>MyCanaryName</i> </code>.
  /// </li>
  /// <li>
  /// The CloudWatch alarms created for this canary. These alarms have a name of
  /// <code>Synthetics-SharpDrop-Alarm-<i>MyCanaryName</i> </code>.
  /// </li>
  /// <li>
  /// Amazon S3 objects and buckets, such as the canary's artifact location.
  /// </li>
  /// <li>
  /// IAM roles created for the canary. If they were created in the console,
  /// these roles have the name <code>
  /// role/service-role/CloudWatchSyntheticsRole-<i>MyCanaryName</i> </code>.
  /// </li>
  /// <li>
  /// CloudWatch Logs log groups created for the canary. These logs groups have
  /// the name <code>/aws/lambda/cwsyn-<i>MyCanaryName</i> </code>.
  /// </li>
  /// </ul>
  /// Before you delete a canary, you might want to use <code>GetCanary</code>
  /// to display the information about this canary. Make note of the information
  /// returned by this operation so that you can delete these resources after
  /// you delete the canary.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [name] :
  /// The name of the canary that you want to delete. To find the names of your
  /// canaries, use <a
  /// href="https://docs.aws.amazon.com/AmazonSynthetics/latest/APIReference/API_DescribeCanaries.html">DescribeCanaries</a>.
  Future<void> deleteCanary({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      21,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[0-9a-z_\-]+$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/canary/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteCanaryResponse.fromJson(response);
  }

  /// This operation returns a list of the canaries in your account, along with
  /// full details about each canary.
  ///
  /// This operation does not have resource-level authorization, so if a user is
  /// able to use <code>DescribeCanaries</code>, the user can see all of the
  /// canaries in the account. A deny policy can only be used to restrict access
  /// to all canaries. It cannot be used on specific resources.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// Specify this parameter to limit how many canaries are returned each time
  /// you use the <code>DescribeCanaries</code> operation. If you omit this
  /// parameter, the default of 100 is used.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates that there is more data available. You can use this
  /// token in a subsequent operation to retrieve the next set of results.
  Future<DescribeCanariesResponse> describeCanaries({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      4,
      252,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/canaries',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeCanariesResponse.fromJson(response);
  }

  /// Use this operation to see information from the most recent run of each
  /// canary that you have created.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// Specify this parameter to limit how many runs are returned each time you
  /// use the <code>DescribeLastRun</code> operation. If you omit this
  /// parameter, the default of 100 is used.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates that there is more data available. You can use this
  /// token in a subsequent <code>DescribeCanaries</code> operation to retrieve
  /// the next set of results.
  Future<DescribeCanariesLastRunResponse> describeCanariesLastRun({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      4,
      252,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/canaries/last-run',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeCanariesLastRunResponse.fromJson(response);
  }

  /// Returns a list of Synthetics canary runtime versions. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_Library.html">
  /// Canary Runtime Versions</a>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// Specify this parameter to limit how many runs are returned each time you
  /// use the <code>DescribeRuntimeVersions</code> operation. If you omit this
  /// parameter, the default of 100 is used.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates that there is more data available. You can use this
  /// token in a subsequent <code>DescribeRuntimeVersions</code> operation to
  /// retrieve the next set of results.
  Future<DescribeRuntimeVersionsResponse> describeRuntimeVersions({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      4,
      252,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/runtime-versions',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeRuntimeVersionsResponse.fromJson(response);
  }

  /// Retrieves complete information about one canary. You must specify the name
  /// of the canary that you want. To get a list of canaries and their names,
  /// use <a
  /// href="https://docs.aws.amazon.com/AmazonSynthetics/latest/APIReference/API_DescribeCanaries.html">DescribeCanaries</a>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the canary that you want details for.
  Future<GetCanaryResponse> getCanary({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      21,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[0-9a-z_\-]+$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/canary/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetCanaryResponse.fromJson(response);
  }

  /// Retrieves a list of runs for a specified canary.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [name] :
  /// The name of the canary that you want to see runs for.
  ///
  /// Parameter [maxResults] :
  /// Specify this parameter to limit how many runs are returned each time you
  /// use the <code>GetCanaryRuns</code> operation. If you omit this parameter,
  /// the default of 100 is used.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates that there is more data available. You can use this
  /// token in a subsequent <code>GetCanaryRuns</code> operation to retrieve the
  /// next set of results.
  Future<GetCanaryRunsResponse> getCanaryRuns({
    @_s.required String name,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      21,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[0-9a-z_\-]+$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      4,
      252,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/canary/${Uri.encodeComponent(name)}/runs',
      exceptionFnMap: _exceptionFns,
    );
    return GetCanaryRunsResponse.fromJson(response);
  }

  /// Displays the tags associated with a canary.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the canary that you want to view tags for.
  ///
  /// The ARN format of a canary is
  /// <code>arn:aws:synthetics:<i>Region</i>:<i>account-id</i>:canary:<i>canary-name</i>
  /// </code>.
  Future<ListTagsForResourceResponse> listTagsForResource({
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''arn:(aws[a-zA-Z-]*)?:synthetics:[a-z]{2}((-gov)|(-iso(b?)))?-[a-z]+-\d{1}:\d{12}:canary:[0-9a-z_\-]{1,21}''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Use this operation to run a canary that has already been created. The
  /// frequency of the canary runs is determined by the value of the canary's
  /// <code>Schedule</code>. To see a canary's schedule, use <a
  /// href="https://docs.aws.amazon.com/AmazonSynthetics/latest/APIReference/API_GetCanary.html">GetCanary</a>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [name] :
  /// The name of the canary that you want to run. To find canary names, use <a
  /// href="https://docs.aws.amazon.com/AmazonSynthetics/latest/APIReference/API_DescribeCanaries.html">DescribeCanaries</a>.
  Future<void> startCanary({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      21,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[0-9a-z_\-]+$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/canary/${Uri.encodeComponent(name)}/start',
      exceptionFnMap: _exceptionFns,
    );
    return StartCanaryResponse.fromJson(response);
  }

  /// Stops the canary to prevent all future runs. If the canary is currently
  /// running, Synthetics stops waiting for the current run of the specified
  /// canary to complete. The run that is in progress completes on its own,
  /// publishes metrics, and uploads artifacts, but it is not recorded in
  /// Synthetics as a completed run.
  ///
  /// You can use <code>StartCanary</code> to start it running again with the
  /// canary’s current schedule at any point in the future.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [name] :
  /// The name of the canary that you want to stop. To find the names of your
  /// canaries, use <a
  /// href="https://docs.aws.amazon.com/AmazonSynthetics/latest/APIReference/API_DescribeCanaries.html">DescribeCanaries</a>.
  Future<void> stopCanary({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      21,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[0-9a-z_\-]+$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/canary/${Uri.encodeComponent(name)}/stop',
      exceptionFnMap: _exceptionFns,
    );
    return StopCanaryResponse.fromJson(response);
  }

  /// Assigns one or more tags (key-value pairs) to the specified canary.
  ///
  /// Tags can help you organize and categorize your resources. You can also use
  /// them to scope user permissions, by granting a user permission to access or
  /// change only resources with certain tag values.
  ///
  /// Tags don't have any semantic meaning to AWS and are interpreted strictly
  /// as strings of characters.
  ///
  /// You can use the <code>TagResource</code> action with a canary that already
  /// has tags. If you specify a new tag key for the alarm, this tag is appended
  /// to the list of tags associated with the alarm. If you specify a tag key
  /// that is already associated with the alarm, the new tag value that you
  /// specify replaces the previous value for that tag.
  ///
  /// You can associate as many as 50 tags with a canary.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the canary that you're adding tags to.
  ///
  /// The ARN format of a canary is
  /// <code>arn:aws:synthetics:<i>Region</i>:<i>account-id</i>:canary:<i>canary-name</i>
  /// </code>.
  ///
  /// Parameter [tags] :
  /// The list of key-value pairs to associate with the canary.
  Future<void> tagResource({
    @_s.required String resourceArn,
    @_s.required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''arn:(aws[a-zA-Z-]*)?:synthetics:[a-z]{2}((-gov)|(-iso(b?)))?-[a-z]+-\d{1}:\d{12}:canary:[0-9a-z_\-]{1,21}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final $payload = <String, dynamic>{
      'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return TagResourceResponse.fromJson(response);
  }

  /// Removes one or more tags from the specified canary.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the canary that you're removing tags from.
  ///
  /// The ARN format of a canary is
  /// <code>arn:aws:synthetics:<i>Region</i>:<i>account-id</i>:canary:<i>canary-name</i>
  /// </code>.
  ///
  /// Parameter [tagKeys] :
  /// The list of tag keys to remove from the resource.
  Future<void> untagResource({
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''arn:(aws[a-zA-Z-]*)?:synthetics:[a-z]{2}((-gov)|(-iso(b?)))?-[a-z]+-\d{1}:\d{12}:canary:[0-9a-z_\-]{1,21}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      if (tagKeys != null) 'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UntagResourceResponse.fromJson(response);
  }

  /// Use this operation to change the settings of a canary that has already
  /// been created.
  ///
  /// You can't use this operation to update the tags of an existing canary. To
  /// change the tags of an existing canary, use <a
  /// href="https://docs.aws.amazon.com/AmazonSynthetics/latest/APIReference/API_TagResource.html">TagResource</a>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [name] :
  /// The name of the canary that you want to update. To find the names of your
  /// canaries, use <a
  /// href="https://docs.aws.amazon.com/AmazonSynthetics/latest/APIReference/API_DescribeCanaries.html">DescribeCanaries</a>.
  ///
  /// You cannot change the name of a canary that has already been created.
  ///
  /// Parameter [code] :
  /// A structure that includes the entry point from which the canary should
  /// start running your script. If the script is stored in an S3 bucket, the
  /// bucket name, key, and version are also included.
  ///
  /// Parameter [executionRoleArn] :
  /// The ARN of the IAM role to be used to run the canary. This role must
  /// already exist, and must include <code>lambda.amazonaws.com</code> as a
  /// principal in the trust policy. The role must also have the following
  /// permissions:
  ///
  /// <ul>
  /// <li>
  /// <code>s3:PutObject</code>
  /// </li>
  /// <li>
  /// <code>s3:GetBucketLocation</code>
  /// </li>
  /// <li>
  /// <code>s3:ListAllMyBuckets</code>
  /// </li>
  /// <li>
  /// <code>cloudwatch:PutMetricData</code>
  /// </li>
  /// <li>
  /// <code>logs:CreateLogGroup</code>
  /// </li>
  /// <li>
  /// <code>logs:CreateLogStream</code>
  /// </li>
  /// <li>
  /// <code>logs:CreateLogStream</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [failureRetentionPeriodInDays] :
  /// The number of days to retain data about failed runs of this canary.
  ///
  /// Parameter [runConfig] :
  /// A structure that contains the timeout value that is used for each
  /// individual run of the canary.
  ///
  /// Parameter [runtimeVersion] :
  /// Specifies the runtime version to use for the canary. For a list of valid
  /// runtime versions and for more information about runtime versions, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_Library.html">
  /// Canary Runtime Versions</a>.
  ///
  /// Parameter [schedule] :
  /// A structure that contains information about how often the canary is to
  /// run, and when these runs are to stop.
  ///
  /// Parameter [successRetentionPeriodInDays] :
  /// The number of days to retain data about successful runs of this canary.
  ///
  /// Parameter [vpcConfig] :
  /// If this canary is to test an endpoint in a VPC, this structure contains
  /// information about the subnet and security groups of the VPC endpoint. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_VPC.html">
  /// Running a Canary in a VPC</a>.
  Future<void> updateCanary({
    @_s.required String name,
    CanaryCodeInput code,
    String executionRoleArn,
    int failureRetentionPeriodInDays,
    CanaryRunConfigInput runConfig,
    String runtimeVersion,
    CanaryScheduleInput schedule,
    int successRetentionPeriodInDays,
    VpcConfigInput vpcConfig,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      21,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[0-9a-z_\-]+$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'executionRoleArn',
      executionRoleArn,
      1,
      2048,
    );
    _s.validateStringPattern(
      'executionRoleArn',
      executionRoleArn,
      r'''arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/?[a-zA-Z_0-9+=,.@\-_/]+''',
    );
    _s.validateNumRange(
      'failureRetentionPeriodInDays',
      failureRetentionPeriodInDays,
      1,
      1024,
    );
    _s.validateStringLength(
      'runtimeVersion',
      runtimeVersion,
      1,
      1024,
    );
    _s.validateNumRange(
      'successRetentionPeriodInDays',
      successRetentionPeriodInDays,
      1,
      1024,
    );
    final $payload = <String, dynamic>{
      if (code != null) 'Code': code,
      if (executionRoleArn != null) 'ExecutionRoleArn': executionRoleArn,
      if (failureRetentionPeriodInDays != null)
        'FailureRetentionPeriodInDays': failureRetentionPeriodInDays,
      if (runConfig != null) 'RunConfig': runConfig,
      if (runtimeVersion != null) 'RuntimeVersion': runtimeVersion,
      if (schedule != null) 'Schedule': schedule,
      if (successRetentionPeriodInDays != null)
        'SuccessRetentionPeriodInDays': successRetentionPeriodInDays,
      if (vpcConfig != null) 'VpcConfig': vpcConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/canary/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateCanaryResponse.fromJson(response);
  }
}

/// This structure contains all information about one canary in your account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Canary {
  /// The location in Amazon S3 where Synthetics stores artifacts from the runs of
  /// this canary. Artifacts include the log file, screenshots, and HAR files.
  @_s.JsonKey(name: 'ArtifactS3Location')
  final String artifactS3Location;
  @_s.JsonKey(name: 'Code')
  final CanaryCodeOutput code;

  /// The ARN of the Lambda function that is used as your canary's engine. For
  /// more information about Lambda ARN format, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-api-permissions-ref.html">Resources
  /// and Conditions for Lambda Actions</a>.
  @_s.JsonKey(name: 'EngineArn')
  final String engineArn;

  /// The ARN of the IAM role used to run the canary. This role must include
  /// <code>lambda.amazonaws.com</code> as a principal in the trust policy.
  @_s.JsonKey(name: 'ExecutionRoleArn')
  final String executionRoleArn;

  /// The number of days to retain data about failed runs of this canary.
  @_s.JsonKey(name: 'FailureRetentionPeriodInDays')
  final int failureRetentionPeriodInDays;

  /// The unique ID of this canary.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the canary.
  @_s.JsonKey(name: 'Name')
  final String name;
  @_s.JsonKey(name: 'RunConfig')
  final CanaryRunConfigOutput runConfig;

  /// Specifies the runtime version to use for the canary. For more information
  /// about runtime versions, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_Library.html">
  /// Canary Runtime Versions</a>.
  @_s.JsonKey(name: 'RuntimeVersion')
  final String runtimeVersion;

  /// A structure that contains information about how often the canary is to run,
  /// and when these runs are to stop.
  @_s.JsonKey(name: 'Schedule')
  final CanaryScheduleOutput schedule;

  /// A structure that contains information about the canary's status.
  @_s.JsonKey(name: 'Status')
  final CanaryStatus status;

  /// The number of days to retain data about successful runs of this canary.
  @_s.JsonKey(name: 'SuccessRetentionPeriodInDays')
  final int successRetentionPeriodInDays;

  /// The list of key-value pairs that are associated with the canary.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  /// A structure that contains information about when the canary was created,
  /// modified, and most recently run.
  @_s.JsonKey(name: 'Timeline')
  final CanaryTimeline timeline;
  @_s.JsonKey(name: 'VpcConfig')
  final VpcConfigOutput vpcConfig;

  Canary({
    this.artifactS3Location,
    this.code,
    this.engineArn,
    this.executionRoleArn,
    this.failureRetentionPeriodInDays,
    this.id,
    this.name,
    this.runConfig,
    this.runtimeVersion,
    this.schedule,
    this.status,
    this.successRetentionPeriodInDays,
    this.tags,
    this.timeline,
    this.vpcConfig,
  });
  factory Canary.fromJson(Map<String, dynamic> json) => _$CanaryFromJson(json);
}

/// Use this structure to input your script code for the canary. This structure
/// contains the Lambda handler with the location where the canary should start
/// running the script. If the script is stored in an S3 bucket, the bucket
/// name, key, and version are also included. If the script was passed into the
/// canary directly, the script code is contained in the value of
/// <code>Zipfile</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CanaryCodeInput {
  /// The entry point to use for the source code when running the canary. This
  /// value must end with the string <code>.handler</code>.
  @_s.JsonKey(name: 'Handler')
  final String handler;

  /// If your canary script is located in S3, specify the full bucket name here.
  /// The bucket must already exist. Specify the full bucket name, including
  /// <code>s3://</code> as the start of the bucket name.
  @_s.JsonKey(name: 'S3Bucket')
  final String s3Bucket;

  /// The S3 key of your script. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingObjects.html">Working
  /// with Amazon S3 Objects</a>.
  @_s.JsonKey(name: 'S3Key')
  final String s3Key;

  /// The S3 version ID of your script.
  @_s.JsonKey(name: 'S3Version')
  final String s3Version;

  /// If you input your canary script directly into the canary instead of
  /// referring to an S3 location, the value of this parameter is the .zip file
  /// that contains the script. It can be up to 5 MB.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'ZipFile')
  final Uint8List zipFile;

  CanaryCodeInput({
    @_s.required this.handler,
    this.s3Bucket,
    this.s3Key,
    this.s3Version,
    this.zipFile,
  });
  Map<String, dynamic> toJson() => _$CanaryCodeInputToJson(this);
}

/// This structure contains information about the canary's Lambda handler and
/// where its code is stored by CloudWatch Synthetics.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CanaryCodeOutput {
  /// The entry point to use for the source code when running the canary.
  @_s.JsonKey(name: 'Handler')
  final String handler;

  /// The ARN of the Lambda layer where Synthetics stores the canary script code.
  @_s.JsonKey(name: 'SourceLocationArn')
  final String sourceLocationArn;

  CanaryCodeOutput({
    this.handler,
    this.sourceLocationArn,
  });
  factory CanaryCodeOutput.fromJson(Map<String, dynamic> json) =>
      _$CanaryCodeOutputFromJson(json);
}

/// This structure contains information about the most recent run of a single
/// canary.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CanaryLastRun {
  /// The name of the canary.
  @_s.JsonKey(name: 'CanaryName')
  final String canaryName;

  /// The results from this canary's most recent run.
  @_s.JsonKey(name: 'LastRun')
  final CanaryRun lastRun;

  CanaryLastRun({
    this.canaryName,
    this.lastRun,
  });
  factory CanaryLastRun.fromJson(Map<String, dynamic> json) =>
      _$CanaryLastRunFromJson(json);
}

/// This structure contains the details about one run of one canary.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CanaryRun {
  /// The location where the canary stored artifacts from the run. Artifacts
  /// include the log file, screenshots, and HAR files.
  @_s.JsonKey(name: 'ArtifactS3Location')
  final String artifactS3Location;

  /// A unique ID that identifies this canary run.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the canary.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The status of this run.
  @_s.JsonKey(name: 'Status')
  final CanaryRunStatus status;

  /// A structure that contains the start and end times of this run.
  @_s.JsonKey(name: 'Timeline')
  final CanaryRunTimeline timeline;

  CanaryRun({
    this.artifactS3Location,
    this.id,
    this.name,
    this.status,
    this.timeline,
  });
  factory CanaryRun.fromJson(Map<String, dynamic> json) =>
      _$CanaryRunFromJson(json);
}

/// A structure that contains input information for a canary run.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CanaryRunConfigInput {
  /// Specifies whether this canary is to use active AWS X-Ray tracing when it
  /// runs. Active tracing enables this canary run to be displayed in the
  /// ServiceLens and X-Ray service maps even if the canary does not hit an
  /// endpoint that has X-ray tracing enabled. Using X-Ray tracing incurs charges.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_tracing.html">
  /// Canaries and X-Ray tracing</a>.
  ///
  /// You can enable active tracing only for canaries that use version
  /// <code>syn-nodejs-2.0</code> or later for their canary runtime.
  @_s.JsonKey(name: 'ActiveTracing')
  final bool activeTracing;

  /// Specifies the keys and values to use for any environment variables used in
  /// the canary script. Use the following format:
  ///
  /// { "key1" : "value1", "key2" : "value2", ...}
  ///
  /// Keys must start with a letter and be at least two characters. The total size
  /// of your environment variables cannot exceed 4 KB. You can't specify any
  /// Lambda reserved environment variables as the keys for your environment
  /// variables. For more information about reserved keys, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-envvars.html#configuration-envvars-runtime">
  /// Runtime environment variables</a>.
  @_s.JsonKey(name: 'EnvironmentVariables')
  final Map<String, String> environmentVariables;

  /// The maximum amount of memory available to the canary while it is running, in
  /// MB. This value must be a multiple of 64.
  @_s.JsonKey(name: 'MemoryInMB')
  final int memoryInMB;

  /// How long the canary is allowed to run before it must stop. You can't set
  /// this time to be longer than the frequency of the runs of this canary.
  ///
  /// If you omit this field, the frequency of the canary is used as this value,
  /// up to a maximum of 14 minutes.
  @_s.JsonKey(name: 'TimeoutInSeconds')
  final int timeoutInSeconds;

  CanaryRunConfigInput({
    this.activeTracing,
    this.environmentVariables,
    this.memoryInMB,
    this.timeoutInSeconds,
  });
  Map<String, dynamic> toJson() => _$CanaryRunConfigInputToJson(this);
}

/// A structure that contains information about a canary run.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CanaryRunConfigOutput {
  /// Displays whether this canary run used active AWS X-Ray tracing.
  @_s.JsonKey(name: 'ActiveTracing')
  final bool activeTracing;

  /// The maximum amount of memory available to the canary while it is running, in
  /// MB. This value must be a multiple of 64.
  @_s.JsonKey(name: 'MemoryInMB')
  final int memoryInMB;

  /// How long the canary is allowed to run before it must stop.
  @_s.JsonKey(name: 'TimeoutInSeconds')
  final int timeoutInSeconds;

  CanaryRunConfigOutput({
    this.activeTracing,
    this.memoryInMB,
    this.timeoutInSeconds,
  });
  factory CanaryRunConfigOutput.fromJson(Map<String, dynamic> json) =>
      _$CanaryRunConfigOutputFromJson(json);
}

enum CanaryRunState {
  @_s.JsonValue('RUNNING')
  running,
  @_s.JsonValue('PASSED')
  passed,
  @_s.JsonValue('FAILED')
  failed,
}

enum CanaryRunStateReasonCode {
  @_s.JsonValue('CANARY_FAILURE')
  canaryFailure,
  @_s.JsonValue('EXECUTION_FAILURE')
  executionFailure,
}

/// This structure contains the status information about a canary run.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CanaryRunStatus {
  /// The current state of the run.
  @_s.JsonKey(name: 'State')
  final CanaryRunState state;

  /// If run of the canary failed, this field contains the reason for the error.
  @_s.JsonKey(name: 'StateReason')
  final String stateReason;

  /// If this value is <code>CANARY_FAILURE</code>, an exception occurred in the
  /// canary code. If this value is <code>EXECUTION_FAILURE</code>, an exception
  /// occurred in CloudWatch Synthetics.
  @_s.JsonKey(name: 'StateReasonCode')
  final CanaryRunStateReasonCode stateReasonCode;

  CanaryRunStatus({
    this.state,
    this.stateReason,
    this.stateReasonCode,
  });
  factory CanaryRunStatus.fromJson(Map<String, dynamic> json) =>
      _$CanaryRunStatusFromJson(json);
}

/// This structure contains the start and end times of a single canary run.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CanaryRunTimeline {
  /// The end time of the run.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'Completed')
  final DateTime completed;

  /// The start time of the run.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'Started')
  final DateTime started;

  CanaryRunTimeline({
    this.completed,
    this.started,
  });
  factory CanaryRunTimeline.fromJson(Map<String, dynamic> json) =>
      _$CanaryRunTimelineFromJson(json);
}

/// This structure specifies how often a canary is to make runs and the date and
/// time when it should stop making runs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CanaryScheduleInput {
  /// A rate expression that defines how often the canary is to run. The syntax is
  /// <code>rate(<i>number unit</i>)</code>. <i>unit</i> can be
  /// <code>minute</code>, <code>minutes</code>, or <code>hour</code>.
  ///
  /// For example, <code>rate(1 minute)</code> runs the canary once a minute,
  /// <code>rate(10 minutes)</code> runs it once every 10 minutes, and
  /// <code>rate(1 hour)</code> runs it once every hour. You can specify a
  /// frequency between <code>rate(1 minute)</code> and <code>rate(1 hour)</code>.
  ///
  /// Specifying <code>rate(0 minute)</code> or <code>rate(0 hour)</code> is a
  /// special value that causes the canary to run only once when it is started.
  @_s.JsonKey(name: 'Expression')
  final String expression;

  /// How long, in seconds, for the canary to continue making regular runs
  /// according to the schedule in the <code>Expression</code> value. If you
  /// specify 0, the canary continues making runs until you stop it. If you omit
  /// this field, the default of 0 is used.
  @_s.JsonKey(name: 'DurationInSeconds')
  final int durationInSeconds;

  CanaryScheduleInput({
    @_s.required this.expression,
    this.durationInSeconds,
  });
  Map<String, dynamic> toJson() => _$CanaryScheduleInputToJson(this);
}

/// How long, in seconds, for the canary to continue making regular runs
/// according to the schedule in the <code>Expression</code> value.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CanaryScheduleOutput {
  /// How long, in seconds, for the canary to continue making regular runs after
  /// it was created. The runs are performed according to the schedule in the
  /// <code>Expression</code> value.
  @_s.JsonKey(name: 'DurationInSeconds')
  final int durationInSeconds;

  /// A rate expression that defines how often the canary is to run. The syntax is
  /// <code>rate(<i>number unit</i>)</code>. <i>unit</i> can be
  /// <code>minute</code>, <code>minutes</code>, or <code>hour</code>.
  ///
  /// For example, <code>rate(1 minute)</code> runs the canary once a minute,
  /// <code>rate(10 minutes)</code> runs it once every 10 minutes, and
  /// <code>rate(1 hour)</code> runs it once every hour.
  ///
  /// Specifying <code>rate(0 minute)</code> or <code>rate(0 hour)</code> is a
  /// special value that causes the canary to run only once when it is started.
  @_s.JsonKey(name: 'Expression')
  final String expression;

  CanaryScheduleOutput({
    this.durationInSeconds,
    this.expression,
  });
  factory CanaryScheduleOutput.fromJson(Map<String, dynamic> json) =>
      _$CanaryScheduleOutputFromJson(json);
}

enum CanaryState {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('READY')
  ready,
  @_s.JsonValue('STARTING')
  starting,
  @_s.JsonValue('RUNNING')
  running,
  @_s.JsonValue('UPDATING')
  updating,
  @_s.JsonValue('STOPPING')
  stopping,
  @_s.JsonValue('STOPPED')
  stopped,
  @_s.JsonValue('ERROR')
  error,
  @_s.JsonValue('DELETING')
  deleting,
}

enum CanaryStateReasonCode {
  @_s.JsonValue('INVALID_PERMISSIONS')
  invalidPermissions,
}

/// A structure that contains the current state of the canary.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CanaryStatus {
  /// The current state of the canary.
  @_s.JsonKey(name: 'State')
  final CanaryState state;

  /// If the canary has insufficient permissions to run, this field provides more
  /// details.
  @_s.JsonKey(name: 'StateReason')
  final String stateReason;

  /// If the canary cannot run or has failed, this field displays the reason.
  @_s.JsonKey(name: 'StateReasonCode')
  final CanaryStateReasonCode stateReasonCode;

  CanaryStatus({
    this.state,
    this.stateReason,
    this.stateReasonCode,
  });
  factory CanaryStatus.fromJson(Map<String, dynamic> json) =>
      _$CanaryStatusFromJson(json);
}

/// This structure contains information about when the canary was created and
/// modified.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CanaryTimeline {
  /// The date and time the canary was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'Created')
  final DateTime created;

  /// The date and time the canary was most recently modified.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastModified')
  final DateTime lastModified;

  /// The date and time that the canary's most recent run started.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastStarted')
  final DateTime lastStarted;

  /// The date and time that the canary's most recent run ended.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastStopped')
  final DateTime lastStopped;

  CanaryTimeline({
    this.created,
    this.lastModified,
    this.lastStarted,
    this.lastStopped,
  });
  factory CanaryTimeline.fromJson(Map<String, dynamic> json) =>
      _$CanaryTimelineFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateCanaryResponse {
  /// The full details about the canary you have created.
  @_s.JsonKey(name: 'Canary')
  final Canary canary;

  CreateCanaryResponse({
    this.canary,
  });
  factory CreateCanaryResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateCanaryResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteCanaryResponse {
  DeleteCanaryResponse();
  factory DeleteCanaryResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteCanaryResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeCanariesLastRunResponse {
  /// An array that contains the information from the most recent run of each
  /// canary.
  @_s.JsonKey(name: 'CanariesLastRun')
  final List<CanaryLastRun> canariesLastRun;

  /// A token that indicates that there is more data available. You can use this
  /// token in a subsequent <code>DescribeCanariesLastRun</code> operation to
  /// retrieve the next set of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeCanariesLastRunResponse({
    this.canariesLastRun,
    this.nextToken,
  });
  factory DescribeCanariesLastRunResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeCanariesLastRunResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeCanariesResponse {
  /// Returns an array. Each item in the array contains the full information about
  /// one canary.
  @_s.JsonKey(name: 'Canaries')
  final List<Canary> canaries;

  /// A token that indicates that there is more data available. You can use this
  /// token in a subsequent <code>DescribeCanaries</code> operation to retrieve
  /// the next set of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeCanariesResponse({
    this.canaries,
    this.nextToken,
  });
  factory DescribeCanariesResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeCanariesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeRuntimeVersionsResponse {
  /// A token that indicates that there is more data available. You can use this
  /// token in a subsequent <code>DescribeRuntimeVersions</code> operation to
  /// retrieve the next set of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// An array of objects that display the details about each Synthetics canary
  /// runtime version.
  @_s.JsonKey(name: 'RuntimeVersions')
  final List<RuntimeVersion> runtimeVersions;

  DescribeRuntimeVersionsResponse({
    this.nextToken,
    this.runtimeVersions,
  });
  factory DescribeRuntimeVersionsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeRuntimeVersionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetCanaryResponse {
  /// A strucure that contains the full information about the canary.
  @_s.JsonKey(name: 'Canary')
  final Canary canary;

  GetCanaryResponse({
    this.canary,
  });
  factory GetCanaryResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCanaryResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetCanaryRunsResponse {
  /// An array of structures. Each structure contains the details of one of the
  /// retrieved canary runs.
  @_s.JsonKey(name: 'CanaryRuns')
  final List<CanaryRun> canaryRuns;

  /// A token that indicates that there is more data available. You can use this
  /// token in a subsequent <code>GetCanaryRuns</code> operation to retrieve the
  /// next set of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetCanaryRunsResponse({
    this.canaryRuns,
    this.nextToken,
  });
  factory GetCanaryRunsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCanaryRunsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// The list of tag keys and values associated with the canary that you
  /// specified.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

/// This structure contains information about one canary runtime version. For
/// more information about runtime versions, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_Library.html">
/// Canary Runtime Versions</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RuntimeVersion {
  /// If this runtime version is deprecated, this value is the date of
  /// deprecation.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'DeprecationDate')
  final DateTime deprecationDate;

  /// A description of the runtime version, created by Amazon.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The date that the runtime version was released.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ReleaseDate')
  final DateTime releaseDate;

  /// The name of the runtime version. For a list of valid runtime versions, see
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_Library.html">
  /// Canary Runtime Versions</a>.
  @_s.JsonKey(name: 'VersionName')
  final String versionName;

  RuntimeVersion({
    this.deprecationDate,
    this.description,
    this.releaseDate,
    this.versionName,
  });
  factory RuntimeVersion.fromJson(Map<String, dynamic> json) =>
      _$RuntimeVersionFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartCanaryResponse {
  StartCanaryResponse();
  factory StartCanaryResponse.fromJson(Map<String, dynamic> json) =>
      _$StartCanaryResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopCanaryResponse {
  StopCanaryResponse();
  factory StopCanaryResponse.fromJson(Map<String, dynamic> json) =>
      _$StopCanaryResponseFromJson(json);
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateCanaryResponse {
  UpdateCanaryResponse();
  factory UpdateCanaryResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateCanaryResponseFromJson(json);
}

/// If this canary is to test an endpoint in a VPC, this structure contains
/// information about the subnets and security groups of the VPC endpoint. For
/// more information, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_VPC.html">
/// Running a Canary in a VPC</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class VpcConfigInput {
  /// The IDs of the security groups for this canary.
  @_s.JsonKey(name: 'SecurityGroupIds')
  final List<String> securityGroupIds;

  /// The IDs of the subnets where this canary is to run.
  @_s.JsonKey(name: 'SubnetIds')
  final List<String> subnetIds;

  VpcConfigInput({
    this.securityGroupIds,
    this.subnetIds,
  });
  Map<String, dynamic> toJson() => _$VpcConfigInputToJson(this);
}

/// If this canary is to test an endpoint in a VPC, this structure contains
/// information about the subnets and security groups of the VPC endpoint. For
/// more information, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_VPC.html">
/// Running a Canary in a VPC</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VpcConfigOutput {
  /// The IDs of the security groups for this canary.
  @_s.JsonKey(name: 'SecurityGroupIds')
  final List<String> securityGroupIds;

  /// The IDs of the subnets where this canary is to run.
  @_s.JsonKey(name: 'SubnetIds')
  final List<String> subnetIds;

  /// The IDs of the VPC where this canary is to run.
  @_s.JsonKey(name: 'VpcId')
  final String vpcId;

  VpcConfigOutput({
    this.securityGroupIds,
    this.subnetIds,
    this.vpcId,
  });
  factory VpcConfigOutput.fromJson(Map<String, dynamic> json) =>
      _$VpcConfigOutputFromJson(json);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String type, String message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String type, String message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String type, String message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
