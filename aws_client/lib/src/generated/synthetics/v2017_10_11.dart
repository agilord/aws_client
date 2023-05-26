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
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'synthetics',
            signingName: 'synthetics',
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

  /// Associates a canary with a group. Using groups can help you with managing
  /// and automating your canaries, and you can also view aggregated run results
  /// and statistics for all canaries in a group.
  ///
  /// You must run this operation in the Region where the canary exists.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [groupIdentifier] :
  /// Specifies the group. You can specify the group name, the ARN, or the group
  /// ID as the <code>GroupIdentifier</code>.
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the canary that you want to associate with the specified group.
  Future<void> associateResource({
    required String groupIdentifier,
    required String resourceArn,
  }) async {
    final $payload = <String, dynamic>{
      'ResourceArn': resourceArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/group/${Uri.encodeComponent(groupIdentifier)}/associate',
      exceptionFnMap: _exceptionFns,
    );
  }

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
  /// new IAM role for the canary, you also need the
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
  /// May throw [RequestEntityTooLargeException].
  ///
  /// Parameter [artifactS3Location] :
  /// The location in Amazon S3 where Synthetics stores artifacts from the test
  /// runs of this canary. Artifacts include the log file, screenshots, and HAR
  /// files. The name of the S3 bucket can't include a period (.).
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
  /// Parameter [artifactConfig] :
  /// A structure that contains the configuration for canary artifacts,
  /// including the encryption-at-rest settings for artifacts that the canary
  /// uploads to Amazon S3.
  ///
  /// Parameter [failureRetentionPeriodInDays] :
  /// The number of days to retain data about failed runs of this canary. If you
  /// omit this field, the default of 31 days is used. The valid range is 1 to
  /// 455 days.
  ///
  /// Parameter [runConfig] :
  /// A structure that contains the configuration for individual canary runs,
  /// such as timeout value and environment variables.
  /// <important>
  /// The environment variables keys and values are not encrypted. Do not store
  /// sensitive information in this field.
  /// </important>
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
    required String artifactS3Location,
    required CanaryCodeInput code,
    required String executionRoleArn,
    required String name,
    required String runtimeVersion,
    required CanaryScheduleInput schedule,
    ArtifactConfigInput? artifactConfig,
    int? failureRetentionPeriodInDays,
    CanaryRunConfigInput? runConfig,
    int? successRetentionPeriodInDays,
    Map<String, String>? tags,
    VpcConfigInput? vpcConfig,
  }) async {
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
      if (artifactConfig != null) 'ArtifactConfig': artifactConfig,
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

  /// Creates a group which you can use to associate canaries with each other,
  /// including cross-Region canaries. Using groups can help you with managing
  /// and automating your canaries, and you can also view aggregated run results
  /// and statistics for all canaries in a group.
  ///
  /// Groups are global resources. When you create a group, it is replicated
  /// across Amazon Web Services Regions, and you can view it and add canaries
  /// to it from any Region. Although the group ARN format reflects the Region
  /// name where it was created, a group is not constrained to any Region. This
  /// means that you can put canaries from multiple Regions into the same group,
  /// and then use that group to view and manage all of those canaries in a
  /// single view.
  ///
  /// Groups are supported in all Regions except the Regions that are disabled
  /// by default. For more information about these Regions, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/rande-manage.html#rande-manage-enable">Enabling
  /// a Region</a>.
  ///
  /// Each group can contain as many as 10 canaries. You can have as many as 20
  /// groups in your account. Any single canary can be a member of up to 10
  /// groups.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [name] :
  /// The name for the group. It can include any Unicode characters.
  ///
  /// The names for all groups in your account, across all Regions, must be
  /// unique.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs to associate with the group. You can associate
  /// as many as 50 tags with a group.
  ///
  /// Tags can help you organize and categorize your resources. You can also use
  /// them to scope user permissions, by granting a user permission to access or
  /// change only the resources that have certain tag values.
  Future<CreateGroupResponse> createGroup({
    required String name,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'Name': name,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/group',
      exceptionFnMap: _exceptionFns,
    );
    return CreateGroupResponse.fromJson(response);
  }

  /// Permanently deletes the specified canary.
  ///
  /// If you specify <code>DeleteLambda</code> to <code>true</code>, CloudWatch
  /// Synthetics also deletes the Lambda functions and layers that are used by
  /// the canary.
  ///
  /// Other resources used and created by the canary are not automatically
  /// deleted. After you delete a canary that you do not intend to use again,
  /// you should also delete the following:
  ///
  /// <ul>
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
  ///
  /// Parameter [deleteLambda] :
  /// Specifies whether to also delete the Lambda functions and layers used by
  /// this canary. The default is false.
  ///
  /// Type: Boolean
  Future<void> deleteCanary({
    required String name,
    bool? deleteLambda,
  }) async {
    final $query = <String, List<String>>{
      if (deleteLambda != null) 'deleteLambda': [deleteLambda.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/canary/${Uri.encodeComponent(name)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a group. The group doesn't need to be empty to be deleted. If
  /// there are canaries in the group, they are not deleted when you delete the
  /// group.
  ///
  /// Groups are a global resource that appear in all Regions, but the request
  /// to delete a group must be made from its home Region. You can find the home
  /// Region of a group within its ARN.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [groupIdentifier] :
  /// Specifies which group to delete. You can specify the group name, the ARN,
  /// or the group ID as the <code>GroupIdentifier</code>.
  Future<void> deleteGroup({
    required String groupIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/group/${Uri.encodeComponent(groupIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This operation returns a list of the canaries in your account, along with
  /// full details about each canary.
  ///
  /// This operation supports resource-level authorization using an IAM policy
  /// and the <code>Names</code> parameter. If you specify the
  /// <code>Names</code> parameter, the operation is successful only if you have
  /// authorization to view all the canaries that you specify in your request.
  /// If you do not have permission to view any of the canaries, the request
  /// fails with a 403 response.
  ///
  /// You are required to use the <code>Names</code> parameter if you are logged
  /// on to a user or role that has an IAM policy that restricts which canaries
  /// that you are allowed to view. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_Restricted.html">
  /// Limiting a user to viewing specific canaries</a>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// Specify this parameter to limit how many canaries are returned each time
  /// you use the <code>DescribeCanaries</code> operation. If you omit this
  /// parameter, the default of 100 is used.
  ///
  /// Parameter [names] :
  /// Use this parameter to return only canaries that match the names that you
  /// specify here. You can specify as many as five canary names.
  ///
  /// If you specify this parameter, the operation is successful only if you
  /// have authorization to view all the canaries that you specify in your
  /// request. If you do not have permission to view any of the canaries, the
  /// request fails with a 403 response.
  ///
  /// You are required to use this parameter if you are logged on to a user or
  /// role that has an IAM policy that restricts which canaries that you are
  /// allowed to view. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_Restricted.html">
  /// Limiting a user to viewing specific canaries</a>.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates that there is more data available. You can use this
  /// token in a subsequent operation to retrieve the next set of results.
  Future<DescribeCanariesResponse> describeCanaries({
    int? maxResults,
    List<String>? names,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (names != null) 'Names': names,
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
  /// This operation supports resource-level authorization using an IAM policy
  /// and the <code>Names</code> parameter. If you specify the
  /// <code>Names</code> parameter, the operation is successful only if you have
  /// authorization to view all the canaries that you specify in your request.
  /// If you do not have permission to view any of the canaries, the request
  /// fails with a 403 response.
  ///
  /// You are required to use the <code>Names</code> parameter if you are logged
  /// on to a user or role that has an IAM policy that restricts which canaries
  /// that you are allowed to view. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_Restricted.html">
  /// Limiting a user to viewing specific canaries</a>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// Specify this parameter to limit how many runs are returned each time you
  /// use the <code>DescribeLastRun</code> operation. If you omit this
  /// parameter, the default of 100 is used.
  ///
  /// Parameter [names] :
  /// Use this parameter to return only canaries that match the names that you
  /// specify here. You can specify as many as five canary names.
  ///
  /// If you specify this parameter, the operation is successful only if you
  /// have authorization to view all the canaries that you specify in your
  /// request. If you do not have permission to view any of the canaries, the
  /// request fails with a 403 response.
  ///
  /// You are required to use the <code>Names</code> parameter if you are logged
  /// on to a user or role that has an IAM policy that restricts which canaries
  /// that you are allowed to view. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_Restricted.html">
  /// Limiting a user to viewing specific canaries</a>.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates that there is more data available. You can use this
  /// token in a subsequent <code>DescribeCanariesLastRun</code> operation to
  /// retrieve the next set of results.
  Future<DescribeCanariesLastRunResponse> describeCanariesLastRun({
    int? maxResults,
    List<String>? names,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (names != null) 'Names': names,
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

  /// Removes a canary from a group. You must run this operation in the Region
  /// where the canary exists.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [groupIdentifier] :
  /// Specifies the group. You can specify the group name, the ARN, or the group
  /// ID as the <code>GroupIdentifier</code>.
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the canary that you want to remove from the specified group.
  Future<void> disassociateResource({
    required String groupIdentifier,
    required String resourceArn,
  }) async {
    final $payload = <String, dynamic>{
      'ResourceArn': resourceArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/group/${Uri.encodeComponent(groupIdentifier)}/disassociate',
      exceptionFnMap: _exceptionFns,
    );
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
    required String name,
  }) async {
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
    required String name,
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

  /// Returns information about one group. Groups are a global resource, so you
  /// can use this operation from any Region.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [groupIdentifier] :
  /// Specifies the group to return information for. You can specify the group
  /// name, the ARN, or the group ID as the <code>GroupIdentifier</code>.
  Future<GetGroupResponse> getGroup({
    required String groupIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/group/${Uri.encodeComponent(groupIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetGroupResponse.fromJson(response);
  }

  /// Returns a list of the groups that the specified canary is associated with.
  /// The canary that you specify must be in the current Region.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the canary that you want to view groups for.
  ///
  /// Parameter [maxResults] :
  /// Specify this parameter to limit how many groups are returned each time you
  /// use the <code>ListAssociatedGroups</code> operation. If you omit this
  /// parameter, the default of 20 is used.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates that there is more data available. You can use this
  /// token in a subsequent operation to retrieve the next set of results.
  Future<ListAssociatedGroupsResponse> listAssociatedGroups({
    required String resourceArn,
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
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/resource/${Uri.encodeComponent(resourceArn)}/groups',
      exceptionFnMap: _exceptionFns,
    );
    return ListAssociatedGroupsResponse.fromJson(response);
  }

  /// This operation returns a list of the ARNs of the canaries that are
  /// associated with the specified group.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [groupIdentifier] :
  /// Specifies the group to return information for. You can specify the group
  /// name, the ARN, or the group ID as the <code>GroupIdentifier</code>.
  ///
  /// Parameter [maxResults] :
  /// Specify this parameter to limit how many canary ARNs are returned each
  /// time you use the <code>ListGroupResources</code> operation. If you omit
  /// this parameter, the default of 20 is used.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates that there is more data available. You can use this
  /// token in a subsequent operation to retrieve the next set of results.
  Future<ListGroupResourcesResponse> listGroupResources({
    required String groupIdentifier,
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
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/group/${Uri.encodeComponent(groupIdentifier)}/resources',
      exceptionFnMap: _exceptionFns,
    );
    return ListGroupResourcesResponse.fromJson(response);
  }

  /// Returns a list of all groups in the account, displaying their names,
  /// unique IDs, and ARNs. The groups from all Regions are returned.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// Specify this parameter to limit how many groups are returned each time you
  /// use the <code>ListGroups</code> operation. If you omit this parameter, the
  /// default of 20 is used.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates that there is more data available. You can use this
  /// token in a subsequent operation to retrieve the next set of results.
  Future<ListGroupsResponse> listGroups({
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
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/groups',
      exceptionFnMap: _exceptionFns,
    );
    return ListGroupsResponse.fromJson(response);
  }

  /// Displays the tags associated with a canary or group.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the canary or group that you want to view tags for.
  ///
  /// The ARN format of a canary is
  /// <code>arn:aws:synthetics:<i>Region</i>:<i>account-id</i>:canary:<i>canary-name</i>
  /// </code>.
  ///
  /// The ARN format of a group is
  /// <code>arn:aws:synthetics:<i>Region</i>:<i>account-id</i>:group:<i>group-name</i>
  /// </code>
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
    required String name,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/canary/${Uri.encodeComponent(name)}/start',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Stops the canary to prevent all future runs. If the canary is currently
  /// running,the run that is in progress completes on its own, publishes
  /// metrics, and uploads artifacts, but it is not recorded in Synthetics as a
  /// completed run.
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
  /// href="https://docs.aws.amazon.com/AmazonSynthetics/latest/APIReference/API_DescribeCanaries.html">ListCanaries</a>.
  Future<void> stopCanary({
    required String name,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/canary/${Uri.encodeComponent(name)}/stop',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Assigns one or more tags (key-value pairs) to the specified canary or
  /// group.
  ///
  /// Tags can help you organize and categorize your resources. You can also use
  /// them to scope user permissions, by granting a user permission to access or
  /// change only resources with certain tag values.
  ///
  /// Tags don't have any semantic meaning to Amazon Web Services and are
  /// interpreted strictly as strings of characters.
  ///
  /// You can use the <code>TagResource</code> action with a resource that
  /// already has tags. If you specify a new tag key for the resource, this tag
  /// is appended to the list of tags associated with the resource. If you
  /// specify a tag key that is already associated with the resource, the new
  /// tag value that you specify replaces the previous value for that tag.
  ///
  /// You can associate as many as 50 tags with a canary or group.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the canary or group that you're adding tags to.
  ///
  /// The ARN format of a canary is
  /// <code>arn:aws:synthetics:<i>Region</i>:<i>account-id</i>:canary:<i>canary-name</i>
  /// </code>.
  ///
  /// The ARN format of a group is
  /// <code>arn:aws:synthetics:<i>Region</i>:<i>account-id</i>:group:<i>group-name</i>
  /// </code>
  ///
  /// Parameter [tags] :
  /// The list of key-value pairs to associate with the resource.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes one or more tags from the specified resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the canary or group that you're removing tags from.
  ///
  /// The ARN format of a canary is
  /// <code>arn:aws:synthetics:<i>Region</i>:<i>account-id</i>:canary:<i>canary-name</i>
  /// </code>.
  ///
  /// The ARN format of a group is
  /// <code>arn:aws:synthetics:<i>Region</i>:<i>account-id</i>:group:<i>group-name</i>
  /// </code>
  ///
  /// Parameter [tagKeys] :
  /// The list of tag keys to remove from the resource.
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

  /// Updates the configuration of a canary that has already been created.
  ///
  /// You can't use this operation to update the tags of an existing canary. To
  /// change the tags of an existing canary, use <a
  /// href="https://docs.aws.amazon.com/AmazonSynthetics/latest/APIReference/API_TagResource.html">TagResource</a>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [RequestEntityTooLargeException].
  ///
  /// Parameter [name] :
  /// The name of the canary that you want to update. To find the names of your
  /// canaries, use <a
  /// href="https://docs.aws.amazon.com/AmazonSynthetics/latest/APIReference/API_DescribeCanaries.html">DescribeCanaries</a>.
  ///
  /// You cannot change the name of a canary that has already been created.
  ///
  /// Parameter [artifactConfig] :
  /// A structure that contains the configuration for canary artifacts,
  /// including the encryption-at-rest settings for artifacts that the canary
  /// uploads to Amazon S3.
  ///
  /// Parameter [artifactS3Location] :
  /// The location in Amazon S3 where Synthetics stores artifacts from the test
  /// runs of this canary. Artifacts include the log file, screenshots, and HAR
  /// files. The name of the S3 bucket can't include a period (.).
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
  /// <important>
  /// The environment variables keys and values are not encrypted. Do not store
  /// sensitive information in this field.
  /// </important>
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
  /// Parameter [visualReference] :
  /// Defines the screenshots to use as the baseline for comparisons during
  /// visual monitoring comparisons during future runs of this canary. If you
  /// omit this parameter, no changes are made to any baseline screenshots that
  /// the canary might be using already.
  ///
  /// Visual monitoring is supported only on canaries running the
  /// <b>syn-puppeteer-node-3.2</b> runtime or later. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Library_SyntheticsLogger_VisualTesting.html">
  /// Visual monitoring</a> and <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_Blueprints_VisualTesting.html">
  /// Visual monitoring blueprint</a>
  ///
  /// Parameter [vpcConfig] :
  /// If this canary is to test an endpoint in a VPC, this structure contains
  /// information about the subnet and security groups of the VPC endpoint. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_VPC.html">
  /// Running a Canary in a VPC</a>.
  Future<void> updateCanary({
    required String name,
    ArtifactConfigInput? artifactConfig,
    String? artifactS3Location,
    CanaryCodeInput? code,
    String? executionRoleArn,
    int? failureRetentionPeriodInDays,
    CanaryRunConfigInput? runConfig,
    String? runtimeVersion,
    CanaryScheduleInput? schedule,
    int? successRetentionPeriodInDays,
    VisualReferenceInput? visualReference,
    VpcConfigInput? vpcConfig,
  }) async {
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
      if (artifactConfig != null) 'ArtifactConfig': artifactConfig,
      if (artifactS3Location != null) 'ArtifactS3Location': artifactS3Location,
      if (code != null) 'Code': code,
      if (executionRoleArn != null) 'ExecutionRoleArn': executionRoleArn,
      if (failureRetentionPeriodInDays != null)
        'FailureRetentionPeriodInDays': failureRetentionPeriodInDays,
      if (runConfig != null) 'RunConfig': runConfig,
      if (runtimeVersion != null) 'RuntimeVersion': runtimeVersion,
      if (schedule != null) 'Schedule': schedule,
      if (successRetentionPeriodInDays != null)
        'SuccessRetentionPeriodInDays': successRetentionPeriodInDays,
      if (visualReference != null) 'VisualReference': visualReference,
      if (vpcConfig != null) 'VpcConfig': vpcConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/canary/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
  }
}

/// A structure that contains the configuration for canary artifacts, including
/// the encryption-at-rest settings for artifacts that the canary uploads to
/// Amazon S3.
class ArtifactConfigInput {
  /// A structure that contains the configuration of the encryption-at-rest
  /// settings for artifacts that the canary uploads to Amazon S3. Artifact
  /// encryption functionality is available only for canaries that use Synthetics
  /// runtime version syn-nodejs-puppeteer-3.3 or later. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_artifact_encryption.html">Encrypting
  /// canary artifacts</a>
  final S3EncryptionConfig? s3Encryption;

  ArtifactConfigInput({
    this.s3Encryption,
  });

  Map<String, dynamic> toJson() {
    final s3Encryption = this.s3Encryption;
    return {
      if (s3Encryption != null) 'S3Encryption': s3Encryption,
    };
  }
}

/// A structure that contains the configuration for canary artifacts, including
/// the encryption-at-rest settings for artifacts that the canary uploads to
/// Amazon S3.
class ArtifactConfigOutput {
  /// A structure that contains the configuration of encryption settings for
  /// canary artifacts that are stored in Amazon S3.
  final S3EncryptionConfig? s3Encryption;

  ArtifactConfigOutput({
    this.s3Encryption,
  });

  factory ArtifactConfigOutput.fromJson(Map<String, dynamic> json) {
    return ArtifactConfigOutput(
      s3Encryption: json['S3Encryption'] != null
          ? S3EncryptionConfig.fromJson(
              json['S3Encryption'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Encryption = this.s3Encryption;
    return {
      if (s3Encryption != null) 'S3Encryption': s3Encryption,
    };
  }
}

class AssociateResourceResponse {
  AssociateResourceResponse();

  factory AssociateResourceResponse.fromJson(Map<String, dynamic> _) {
    return AssociateResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A structure representing a screenshot that is used as a baseline during
/// visual monitoring comparisons made by the canary.
class BaseScreenshot {
  /// The name of the screenshot. This is generated the first time the canary is
  /// run after the <code>UpdateCanary</code> operation that specified for this
  /// canary to perform visual monitoring.
  final String screenshotName;

  /// Coordinates that define the part of a screen to ignore during screenshot
  /// comparisons. To obtain the coordinates to use here, use the CloudWatch
  /// console to draw the boundaries on the screen. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/synthetics_canaries_deletion.html">
  /// Editing or deleting a canary</a>
  final List<String>? ignoreCoordinates;

  BaseScreenshot({
    required this.screenshotName,
    this.ignoreCoordinates,
  });

  factory BaseScreenshot.fromJson(Map<String, dynamic> json) {
    return BaseScreenshot(
      screenshotName: json['ScreenshotName'] as String,
      ignoreCoordinates: (json['IgnoreCoordinates'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final screenshotName = this.screenshotName;
    final ignoreCoordinates = this.ignoreCoordinates;
    return {
      'ScreenshotName': screenshotName,
      if (ignoreCoordinates != null) 'IgnoreCoordinates': ignoreCoordinates,
    };
  }
}

/// This structure contains all information about one canary in your account.
class Canary {
  /// A structure that contains the configuration for canary artifacts, including
  /// the encryption-at-rest settings for artifacts that the canary uploads to
  /// Amazon S3.
  final ArtifactConfigOutput? artifactConfig;

  /// The location in Amazon S3 where Synthetics stores artifacts from the runs of
  /// this canary. Artifacts include the log file, screenshots, and HAR files.
  final String? artifactS3Location;
  final CanaryCodeOutput? code;

  /// The ARN of the Lambda function that is used as your canary's engine. For
  /// more information about Lambda ARN format, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-api-permissions-ref.html">Resources
  /// and Conditions for Lambda Actions</a>.
  final String? engineArn;

  /// The ARN of the IAM role used to run the canary. This role must include
  /// <code>lambda.amazonaws.com</code> as a principal in the trust policy.
  final String? executionRoleArn;

  /// The number of days to retain data about failed runs of this canary.
  final int? failureRetentionPeriodInDays;

  /// The unique ID of this canary.
  final String? id;

  /// The name of the canary.
  final String? name;
  final CanaryRunConfigOutput? runConfig;

  /// Specifies the runtime version to use for the canary. For more information
  /// about runtime versions, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_Library.html">
  /// Canary Runtime Versions</a>.
  final String? runtimeVersion;

  /// A structure that contains information about how often the canary is to run,
  /// and when these runs are to stop.
  final CanaryScheduleOutput? schedule;

  /// A structure that contains information about the canary's status.
  final CanaryStatus? status;

  /// The number of days to retain data about successful runs of this canary.
  final int? successRetentionPeriodInDays;

  /// The list of key-value pairs that are associated with the canary.
  final Map<String, String>? tags;

  /// A structure that contains information about when the canary was created,
  /// modified, and most recently run.
  final CanaryTimeline? timeline;

  /// If this canary performs visual monitoring by comparing screenshots, this
  /// structure contains the ID of the canary run to use as the baseline for
  /// screenshots, and the coordinates of any parts of the screen to ignore during
  /// the visual monitoring comparison.
  final VisualReferenceOutput? visualReference;
  final VpcConfigOutput? vpcConfig;

  Canary({
    this.artifactConfig,
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
    this.visualReference,
    this.vpcConfig,
  });

  factory Canary.fromJson(Map<String, dynamic> json) {
    return Canary(
      artifactConfig: json['ArtifactConfig'] != null
          ? ArtifactConfigOutput.fromJson(
              json['ArtifactConfig'] as Map<String, dynamic>)
          : null,
      artifactS3Location: json['ArtifactS3Location'] as String?,
      code: json['Code'] != null
          ? CanaryCodeOutput.fromJson(json['Code'] as Map<String, dynamic>)
          : null,
      engineArn: json['EngineArn'] as String?,
      executionRoleArn: json['ExecutionRoleArn'] as String?,
      failureRetentionPeriodInDays:
          json['FailureRetentionPeriodInDays'] as int?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      runConfig: json['RunConfig'] != null
          ? CanaryRunConfigOutput.fromJson(
              json['RunConfig'] as Map<String, dynamic>)
          : null,
      runtimeVersion: json['RuntimeVersion'] as String?,
      schedule: json['Schedule'] != null
          ? CanaryScheduleOutput.fromJson(
              json['Schedule'] as Map<String, dynamic>)
          : null,
      status: json['Status'] != null
          ? CanaryStatus.fromJson(json['Status'] as Map<String, dynamic>)
          : null,
      successRetentionPeriodInDays:
          json['SuccessRetentionPeriodInDays'] as int?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      timeline: json['Timeline'] != null
          ? CanaryTimeline.fromJson(json['Timeline'] as Map<String, dynamic>)
          : null,
      visualReference: json['VisualReference'] != null
          ? VisualReferenceOutput.fromJson(
              json['VisualReference'] as Map<String, dynamic>)
          : null,
      vpcConfig: json['VpcConfig'] != null
          ? VpcConfigOutput.fromJson(json['VpcConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final artifactConfig = this.artifactConfig;
    final artifactS3Location = this.artifactS3Location;
    final code = this.code;
    final engineArn = this.engineArn;
    final executionRoleArn = this.executionRoleArn;
    final failureRetentionPeriodInDays = this.failureRetentionPeriodInDays;
    final id = this.id;
    final name = this.name;
    final runConfig = this.runConfig;
    final runtimeVersion = this.runtimeVersion;
    final schedule = this.schedule;
    final status = this.status;
    final successRetentionPeriodInDays = this.successRetentionPeriodInDays;
    final tags = this.tags;
    final timeline = this.timeline;
    final visualReference = this.visualReference;
    final vpcConfig = this.vpcConfig;
    return {
      if (artifactConfig != null) 'ArtifactConfig': artifactConfig,
      if (artifactS3Location != null) 'ArtifactS3Location': artifactS3Location,
      if (code != null) 'Code': code,
      if (engineArn != null) 'EngineArn': engineArn,
      if (executionRoleArn != null) 'ExecutionRoleArn': executionRoleArn,
      if (failureRetentionPeriodInDays != null)
        'FailureRetentionPeriodInDays': failureRetentionPeriodInDays,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (runConfig != null) 'RunConfig': runConfig,
      if (runtimeVersion != null) 'RuntimeVersion': runtimeVersion,
      if (schedule != null) 'Schedule': schedule,
      if (status != null) 'Status': status,
      if (successRetentionPeriodInDays != null)
        'SuccessRetentionPeriodInDays': successRetentionPeriodInDays,
      if (tags != null) 'Tags': tags,
      if (timeline != null) 'Timeline': timeline,
      if (visualReference != null) 'VisualReference': visualReference,
      if (vpcConfig != null) 'VpcConfig': vpcConfig,
    };
  }
}

/// Use this structure to input your script code for the canary. This structure
/// contains the Lambda handler with the location where the canary should start
/// running the script. If the script is stored in an S3 bucket, the bucket
/// name, key, and version are also included. If the script was passed into the
/// canary directly, the script code is contained in the value of
/// <code>Zipfile</code>.
class CanaryCodeInput {
  /// The entry point to use for the source code when running the canary. For
  /// canaries that use the <code>syn-python-selenium-1.0</code> runtime or a
  /// <code>syn-nodejs.puppeteer</code> runtime earlier than
  /// <code>syn-nodejs.puppeteer-3.4</code>, the handler must be specified as
  /// <code> <i>fileName</i>.handler</code>. For
  /// <code>syn-python-selenium-1.1</code>, <code>syn-nodejs.puppeteer-3.4</code>,
  /// and later runtimes, the handler can be specified as <code>
  /// <i>fileName</i>.<i>functionName</i> </code>, or you can specify a folder
  /// where canary scripts reside as <code>
  /// <i>folder</i>/<i>fileName</i>.<i>functionName</i> </code>.
  final String handler;

  /// If your canary script is located in S3, specify the bucket name here. Do not
  /// include <code>s3://</code> as the start of the bucket name.
  final String? s3Bucket;

  /// The S3 key of your script. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingObjects.html">Working
  /// with Amazon S3 Objects</a>.
  final String? s3Key;

  /// The S3 version ID of your script.
  final String? s3Version;

  /// If you input your canary script directly into the canary instead of
  /// referring to an S3 location, the value of this parameter is the
  /// base64-encoded contents of the .zip file that contains the script. It must
  /// be smaller than 225 Kb.
  ///
  /// For large canary scripts, we recommend that you use an S3 location instead
  /// of inputting it directly with this parameter.
  final Uint8List? zipFile;

  CanaryCodeInput({
    required this.handler,
    this.s3Bucket,
    this.s3Key,
    this.s3Version,
    this.zipFile,
  });

  Map<String, dynamic> toJson() {
    final handler = this.handler;
    final s3Bucket = this.s3Bucket;
    final s3Key = this.s3Key;
    final s3Version = this.s3Version;
    final zipFile = this.zipFile;
    return {
      'Handler': handler,
      if (s3Bucket != null) 'S3Bucket': s3Bucket,
      if (s3Key != null) 'S3Key': s3Key,
      if (s3Version != null) 'S3Version': s3Version,
      if (zipFile != null) 'ZipFile': base64Encode(zipFile),
    };
  }
}

/// This structure contains information about the canary's Lambda handler and
/// where its code is stored by CloudWatch Synthetics.
class CanaryCodeOutput {
  /// The entry point to use for the source code when running the canary.
  final String? handler;

  /// The ARN of the Lambda layer where Synthetics stores the canary script code.
  final String? sourceLocationArn;

  CanaryCodeOutput({
    this.handler,
    this.sourceLocationArn,
  });

  factory CanaryCodeOutput.fromJson(Map<String, dynamic> json) {
    return CanaryCodeOutput(
      handler: json['Handler'] as String?,
      sourceLocationArn: json['SourceLocationArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final handler = this.handler;
    final sourceLocationArn = this.sourceLocationArn;
    return {
      if (handler != null) 'Handler': handler,
      if (sourceLocationArn != null) 'SourceLocationArn': sourceLocationArn,
    };
  }
}

/// This structure contains information about the most recent run of a single
/// canary.
class CanaryLastRun {
  /// The name of the canary.
  final String? canaryName;

  /// The results from this canary's most recent run.
  final CanaryRun? lastRun;

  CanaryLastRun({
    this.canaryName,
    this.lastRun,
  });

  factory CanaryLastRun.fromJson(Map<String, dynamic> json) {
    return CanaryLastRun(
      canaryName: json['CanaryName'] as String?,
      lastRun: json['LastRun'] != null
          ? CanaryRun.fromJson(json['LastRun'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final canaryName = this.canaryName;
    final lastRun = this.lastRun;
    return {
      if (canaryName != null) 'CanaryName': canaryName,
      if (lastRun != null) 'LastRun': lastRun,
    };
  }
}

/// This structure contains the details about one run of one canary.
class CanaryRun {
  /// The location where the canary stored artifacts from the run. Artifacts
  /// include the log file, screenshots, and HAR files.
  final String? artifactS3Location;

  /// A unique ID that identifies this canary run.
  final String? id;

  /// The name of the canary.
  final String? name;

  /// The status of this run.
  final CanaryRunStatus? status;

  /// A structure that contains the start and end times of this run.
  final CanaryRunTimeline? timeline;

  CanaryRun({
    this.artifactS3Location,
    this.id,
    this.name,
    this.status,
    this.timeline,
  });

  factory CanaryRun.fromJson(Map<String, dynamic> json) {
    return CanaryRun(
      artifactS3Location: json['ArtifactS3Location'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      status: json['Status'] != null
          ? CanaryRunStatus.fromJson(json['Status'] as Map<String, dynamic>)
          : null,
      timeline: json['Timeline'] != null
          ? CanaryRunTimeline.fromJson(json['Timeline'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final artifactS3Location = this.artifactS3Location;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    final timeline = this.timeline;
    return {
      if (artifactS3Location != null) 'ArtifactS3Location': artifactS3Location,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (status != null) 'Status': status,
      if (timeline != null) 'Timeline': timeline,
    };
  }
}

/// A structure that contains input information for a canary run.
class CanaryRunConfigInput {
  /// Specifies whether this canary is to use active X-Ray tracing when it runs.
  /// Active tracing enables this canary run to be displayed in the ServiceLens
  /// and X-Ray service maps even if the canary does not hit an endpoint that has
  /// X-Ray tracing enabled. Using X-Ray tracing incurs charges. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_tracing.html">
  /// Canaries and X-Ray tracing</a>.
  ///
  /// You can enable active tracing only for canaries that use version
  /// <code>syn-nodejs-2.0</code> or later for their canary runtime.
  final bool? activeTracing;

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
  /// <important>
  /// The environment variables keys and values are not encrypted. Do not store
  /// sensitive information in this field.
  /// </important>
  final Map<String, String>? environmentVariables;

  /// The maximum amount of memory available to the canary while it is running, in
  /// MB. This value must be a multiple of 64.
  final int? memoryInMB;

  /// How long the canary is allowed to run before it must stop. You can't set
  /// this time to be longer than the frequency of the runs of this canary.
  ///
  /// If you omit this field, the frequency of the canary is used as this value,
  /// up to a maximum of 14 minutes.
  final int? timeoutInSeconds;

  CanaryRunConfigInput({
    this.activeTracing,
    this.environmentVariables,
    this.memoryInMB,
    this.timeoutInSeconds,
  });

  Map<String, dynamic> toJson() {
    final activeTracing = this.activeTracing;
    final environmentVariables = this.environmentVariables;
    final memoryInMB = this.memoryInMB;
    final timeoutInSeconds = this.timeoutInSeconds;
    return {
      if (activeTracing != null) 'ActiveTracing': activeTracing,
      if (environmentVariables != null)
        'EnvironmentVariables': environmentVariables,
      if (memoryInMB != null) 'MemoryInMB': memoryInMB,
      if (timeoutInSeconds != null) 'TimeoutInSeconds': timeoutInSeconds,
    };
  }
}

/// A structure that contains information about a canary run.
class CanaryRunConfigOutput {
  /// Displays whether this canary run used active X-Ray tracing.
  final bool? activeTracing;

  /// The maximum amount of memory available to the canary while it is running, in
  /// MB. This value must be a multiple of 64.
  final int? memoryInMB;

  /// How long the canary is allowed to run before it must stop.
  final int? timeoutInSeconds;

  CanaryRunConfigOutput({
    this.activeTracing,
    this.memoryInMB,
    this.timeoutInSeconds,
  });

  factory CanaryRunConfigOutput.fromJson(Map<String, dynamic> json) {
    return CanaryRunConfigOutput(
      activeTracing: json['ActiveTracing'] as bool?,
      memoryInMB: json['MemoryInMB'] as int?,
      timeoutInSeconds: json['TimeoutInSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final activeTracing = this.activeTracing;
    final memoryInMB = this.memoryInMB;
    final timeoutInSeconds = this.timeoutInSeconds;
    return {
      if (activeTracing != null) 'ActiveTracing': activeTracing,
      if (memoryInMB != null) 'MemoryInMB': memoryInMB,
      if (timeoutInSeconds != null) 'TimeoutInSeconds': timeoutInSeconds,
    };
  }
}

enum CanaryRunState {
  running,
  passed,
  failed,
}

extension CanaryRunStateValueExtension on CanaryRunState {
  String toValue() {
    switch (this) {
      case CanaryRunState.running:
        return 'RUNNING';
      case CanaryRunState.passed:
        return 'PASSED';
      case CanaryRunState.failed:
        return 'FAILED';
    }
  }
}

extension CanaryRunStateFromString on String {
  CanaryRunState toCanaryRunState() {
    switch (this) {
      case 'RUNNING':
        return CanaryRunState.running;
      case 'PASSED':
        return CanaryRunState.passed;
      case 'FAILED':
        return CanaryRunState.failed;
    }
    throw Exception('$this is not known in enum CanaryRunState');
  }
}

enum CanaryRunStateReasonCode {
  canaryFailure,
  executionFailure,
}

extension CanaryRunStateReasonCodeValueExtension on CanaryRunStateReasonCode {
  String toValue() {
    switch (this) {
      case CanaryRunStateReasonCode.canaryFailure:
        return 'CANARY_FAILURE';
      case CanaryRunStateReasonCode.executionFailure:
        return 'EXECUTION_FAILURE';
    }
  }
}

extension CanaryRunStateReasonCodeFromString on String {
  CanaryRunStateReasonCode toCanaryRunStateReasonCode() {
    switch (this) {
      case 'CANARY_FAILURE':
        return CanaryRunStateReasonCode.canaryFailure;
      case 'EXECUTION_FAILURE':
        return CanaryRunStateReasonCode.executionFailure;
    }
    throw Exception('$this is not known in enum CanaryRunStateReasonCode');
  }
}

/// This structure contains the status information about a canary run.
class CanaryRunStatus {
  /// The current state of the run.
  final CanaryRunState? state;

  /// If run of the canary failed, this field contains the reason for the error.
  final String? stateReason;

  /// If this value is <code>CANARY_FAILURE</code>, an exception occurred in the
  /// canary code. If this value is <code>EXECUTION_FAILURE</code>, an exception
  /// occurred in CloudWatch Synthetics.
  final CanaryRunStateReasonCode? stateReasonCode;

  CanaryRunStatus({
    this.state,
    this.stateReason,
    this.stateReasonCode,
  });

  factory CanaryRunStatus.fromJson(Map<String, dynamic> json) {
    return CanaryRunStatus(
      state: (json['State'] as String?)?.toCanaryRunState(),
      stateReason: json['StateReason'] as String?,
      stateReasonCode:
          (json['StateReasonCode'] as String?)?.toCanaryRunStateReasonCode(),
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    final stateReason = this.stateReason;
    final stateReasonCode = this.stateReasonCode;
    return {
      if (state != null) 'State': state.toValue(),
      if (stateReason != null) 'StateReason': stateReason,
      if (stateReasonCode != null) 'StateReasonCode': stateReasonCode.toValue(),
    };
  }
}

/// This structure contains the start and end times of a single canary run.
class CanaryRunTimeline {
  /// The end time of the run.
  final DateTime? completed;

  /// The start time of the run.
  final DateTime? started;

  CanaryRunTimeline({
    this.completed,
    this.started,
  });

  factory CanaryRunTimeline.fromJson(Map<String, dynamic> json) {
    return CanaryRunTimeline(
      completed: timeStampFromJson(json['Completed']),
      started: timeStampFromJson(json['Started']),
    );
  }

  Map<String, dynamic> toJson() {
    final completed = this.completed;
    final started = this.started;
    return {
      if (completed != null) 'Completed': unixTimestampToJson(completed),
      if (started != null) 'Started': unixTimestampToJson(started),
    };
  }
}

/// This structure specifies how often a canary is to make runs and the date and
/// time when it should stop making runs.
class CanaryScheduleInput {
  /// A <code>rate</code> expression or a <code>cron</code> expression that
  /// defines how often the canary is to run.
  ///
  /// For a rate expression, The syntax is <code>rate(<i>number unit</i>)</code>.
  /// <i>unit</i> can be <code>minute</code>, <code>minutes</code>, or
  /// <code>hour</code>.
  ///
  /// For example, <code>rate(1 minute)</code> runs the canary once a minute,
  /// <code>rate(10 minutes)</code> runs it once every 10 minutes, and
  /// <code>rate(1 hour)</code> runs it once every hour. You can specify a
  /// frequency between <code>rate(1 minute)</code> and <code>rate(1 hour)</code>.
  ///
  /// Specifying <code>rate(0 minute)</code> or <code>rate(0 hour)</code> is a
  /// special value that causes the canary to run only once when it is started.
  ///
  /// Use <code>cron(<i>expression</i>)</code> to specify a cron expression. You
  /// can't schedule a canary to wait for more than a year before running. For
  /// information about the syntax for cron expressions, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_cron.html">
  /// Scheduling canary runs using cron</a>.
  final String expression;

  /// How long, in seconds, for the canary to continue making regular runs
  /// according to the schedule in the <code>Expression</code> value. If you
  /// specify 0, the canary continues making runs until you stop it. If you omit
  /// this field, the default of 0 is used.
  final int? durationInSeconds;

  CanaryScheduleInput({
    required this.expression,
    this.durationInSeconds,
  });

  Map<String, dynamic> toJson() {
    final expression = this.expression;
    final durationInSeconds = this.durationInSeconds;
    return {
      'Expression': expression,
      if (durationInSeconds != null) 'DurationInSeconds': durationInSeconds,
    };
  }
}

/// How long, in seconds, for the canary to continue making regular runs
/// according to the schedule in the <code>Expression</code> value.
class CanaryScheduleOutput {
  /// How long, in seconds, for the canary to continue making regular runs after
  /// it was created. The runs are performed according to the schedule in the
  /// <code>Expression</code> value.
  final int? durationInSeconds;

  /// A <code>rate</code> expression or a <code>cron</code> expression that
  /// defines how often the canary is to run.
  ///
  /// For a rate expression, The syntax is <code>rate(<i>number unit</i>)</code>.
  /// <i>unit</i> can be <code>minute</code>, <code>minutes</code>, or
  /// <code>hour</code>.
  ///
  /// For example, <code>rate(1 minute)</code> runs the canary once a minute,
  /// <code>rate(10 minutes)</code> runs it once every 10 minutes, and
  /// <code>rate(1 hour)</code> runs it once every hour. You can specify a
  /// frequency between <code>rate(1 minute)</code> and <code>rate(1 hour)</code>.
  ///
  /// Specifying <code>rate(0 minute)</code> or <code>rate(0 hour)</code> is a
  /// special value that causes the canary to run only once when it is started.
  ///
  /// Use <code>cron(<i>expression</i>)</code> to specify a cron expression. For
  /// information about the syntax for cron expressions, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_cron.html">
  /// Scheduling canary runs using cron</a>.
  final String? expression;

  CanaryScheduleOutput({
    this.durationInSeconds,
    this.expression,
  });

  factory CanaryScheduleOutput.fromJson(Map<String, dynamic> json) {
    return CanaryScheduleOutput(
      durationInSeconds: json['DurationInSeconds'] as int?,
      expression: json['Expression'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final durationInSeconds = this.durationInSeconds;
    final expression = this.expression;
    return {
      if (durationInSeconds != null) 'DurationInSeconds': durationInSeconds,
      if (expression != null) 'Expression': expression,
    };
  }
}

enum CanaryState {
  creating,
  ready,
  starting,
  running,
  updating,
  stopping,
  stopped,
  error,
  deleting,
}

extension CanaryStateValueExtension on CanaryState {
  String toValue() {
    switch (this) {
      case CanaryState.creating:
        return 'CREATING';
      case CanaryState.ready:
        return 'READY';
      case CanaryState.starting:
        return 'STARTING';
      case CanaryState.running:
        return 'RUNNING';
      case CanaryState.updating:
        return 'UPDATING';
      case CanaryState.stopping:
        return 'STOPPING';
      case CanaryState.stopped:
        return 'STOPPED';
      case CanaryState.error:
        return 'ERROR';
      case CanaryState.deleting:
        return 'DELETING';
    }
  }
}

extension CanaryStateFromString on String {
  CanaryState toCanaryState() {
    switch (this) {
      case 'CREATING':
        return CanaryState.creating;
      case 'READY':
        return CanaryState.ready;
      case 'STARTING':
        return CanaryState.starting;
      case 'RUNNING':
        return CanaryState.running;
      case 'UPDATING':
        return CanaryState.updating;
      case 'STOPPING':
        return CanaryState.stopping;
      case 'STOPPED':
        return CanaryState.stopped;
      case 'ERROR':
        return CanaryState.error;
      case 'DELETING':
        return CanaryState.deleting;
    }
    throw Exception('$this is not known in enum CanaryState');
  }
}

enum CanaryStateReasonCode {
  invalidPermissions,
  createPending,
  createInProgress,
  createFailed,
  updatePending,
  updateInProgress,
  updateComplete,
  rollbackComplete,
  rollbackFailed,
  deleteInProgress,
  deleteFailed,
  syncDeleteInProgress,
}

extension CanaryStateReasonCodeValueExtension on CanaryStateReasonCode {
  String toValue() {
    switch (this) {
      case CanaryStateReasonCode.invalidPermissions:
        return 'INVALID_PERMISSIONS';
      case CanaryStateReasonCode.createPending:
        return 'CREATE_PENDING';
      case CanaryStateReasonCode.createInProgress:
        return 'CREATE_IN_PROGRESS';
      case CanaryStateReasonCode.createFailed:
        return 'CREATE_FAILED';
      case CanaryStateReasonCode.updatePending:
        return 'UPDATE_PENDING';
      case CanaryStateReasonCode.updateInProgress:
        return 'UPDATE_IN_PROGRESS';
      case CanaryStateReasonCode.updateComplete:
        return 'UPDATE_COMPLETE';
      case CanaryStateReasonCode.rollbackComplete:
        return 'ROLLBACK_COMPLETE';
      case CanaryStateReasonCode.rollbackFailed:
        return 'ROLLBACK_FAILED';
      case CanaryStateReasonCode.deleteInProgress:
        return 'DELETE_IN_PROGRESS';
      case CanaryStateReasonCode.deleteFailed:
        return 'DELETE_FAILED';
      case CanaryStateReasonCode.syncDeleteInProgress:
        return 'SYNC_DELETE_IN_PROGRESS';
    }
  }
}

extension CanaryStateReasonCodeFromString on String {
  CanaryStateReasonCode toCanaryStateReasonCode() {
    switch (this) {
      case 'INVALID_PERMISSIONS':
        return CanaryStateReasonCode.invalidPermissions;
      case 'CREATE_PENDING':
        return CanaryStateReasonCode.createPending;
      case 'CREATE_IN_PROGRESS':
        return CanaryStateReasonCode.createInProgress;
      case 'CREATE_FAILED':
        return CanaryStateReasonCode.createFailed;
      case 'UPDATE_PENDING':
        return CanaryStateReasonCode.updatePending;
      case 'UPDATE_IN_PROGRESS':
        return CanaryStateReasonCode.updateInProgress;
      case 'UPDATE_COMPLETE':
        return CanaryStateReasonCode.updateComplete;
      case 'ROLLBACK_COMPLETE':
        return CanaryStateReasonCode.rollbackComplete;
      case 'ROLLBACK_FAILED':
        return CanaryStateReasonCode.rollbackFailed;
      case 'DELETE_IN_PROGRESS':
        return CanaryStateReasonCode.deleteInProgress;
      case 'DELETE_FAILED':
        return CanaryStateReasonCode.deleteFailed;
      case 'SYNC_DELETE_IN_PROGRESS':
        return CanaryStateReasonCode.syncDeleteInProgress;
    }
    throw Exception('$this is not known in enum CanaryStateReasonCode');
  }
}

/// A structure that contains the current state of the canary.
class CanaryStatus {
  /// The current state of the canary.
  final CanaryState? state;

  /// If the canary has insufficient permissions to run, this field provides more
  /// details.
  final String? stateReason;

  /// If the canary cannot run or has failed, this field displays the reason.
  final CanaryStateReasonCode? stateReasonCode;

  CanaryStatus({
    this.state,
    this.stateReason,
    this.stateReasonCode,
  });

  factory CanaryStatus.fromJson(Map<String, dynamic> json) {
    return CanaryStatus(
      state: (json['State'] as String?)?.toCanaryState(),
      stateReason: json['StateReason'] as String?,
      stateReasonCode:
          (json['StateReasonCode'] as String?)?.toCanaryStateReasonCode(),
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    final stateReason = this.stateReason;
    final stateReasonCode = this.stateReasonCode;
    return {
      if (state != null) 'State': state.toValue(),
      if (stateReason != null) 'StateReason': stateReason,
      if (stateReasonCode != null) 'StateReasonCode': stateReasonCode.toValue(),
    };
  }
}

/// This structure contains information about when the canary was created and
/// modified.
class CanaryTimeline {
  /// The date and time the canary was created.
  final DateTime? created;

  /// The date and time the canary was most recently modified.
  final DateTime? lastModified;

  /// The date and time that the canary's most recent run started.
  final DateTime? lastStarted;

  /// The date and time that the canary's most recent run ended.
  final DateTime? lastStopped;

  CanaryTimeline({
    this.created,
    this.lastModified,
    this.lastStarted,
    this.lastStopped,
  });

  factory CanaryTimeline.fromJson(Map<String, dynamic> json) {
    return CanaryTimeline(
      created: timeStampFromJson(json['Created']),
      lastModified: timeStampFromJson(json['LastModified']),
      lastStarted: timeStampFromJson(json['LastStarted']),
      lastStopped: timeStampFromJson(json['LastStopped']),
    );
  }

  Map<String, dynamic> toJson() {
    final created = this.created;
    final lastModified = this.lastModified;
    final lastStarted = this.lastStarted;
    final lastStopped = this.lastStopped;
    return {
      if (created != null) 'Created': unixTimestampToJson(created),
      if (lastModified != null)
        'LastModified': unixTimestampToJson(lastModified),
      if (lastStarted != null) 'LastStarted': unixTimestampToJson(lastStarted),
      if (lastStopped != null) 'LastStopped': unixTimestampToJson(lastStopped),
    };
  }
}

class CreateCanaryResponse {
  /// The full details about the canary you have created.
  final Canary? canary;

  CreateCanaryResponse({
    this.canary,
  });

  factory CreateCanaryResponse.fromJson(Map<String, dynamic> json) {
    return CreateCanaryResponse(
      canary: json['Canary'] != null
          ? Canary.fromJson(json['Canary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final canary = this.canary;
    return {
      if (canary != null) 'Canary': canary,
    };
  }
}

class CreateGroupResponse {
  /// A structure that contains information about the group that was just created.
  final Group? group;

  CreateGroupResponse({
    this.group,
  });

  factory CreateGroupResponse.fromJson(Map<String, dynamic> json) {
    return CreateGroupResponse(
      group: json['Group'] != null
          ? Group.fromJson(json['Group'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final group = this.group;
    return {
      if (group != null) 'Group': group,
    };
  }
}

class DeleteCanaryResponse {
  DeleteCanaryResponse();

  factory DeleteCanaryResponse.fromJson(Map<String, dynamic> _) {
    return DeleteCanaryResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteGroupResponse {
  DeleteGroupResponse();

  factory DeleteGroupResponse.fromJson(Map<String, dynamic> _) {
    return DeleteGroupResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeCanariesLastRunResponse {
  /// An array that contains the information from the most recent run of each
  /// canary.
  final List<CanaryLastRun>? canariesLastRun;

  /// A token that indicates that there is more data available. You can use this
  /// token in a subsequent <code>DescribeCanariesLastRun</code> operation to
  /// retrieve the next set of results.
  final String? nextToken;

  DescribeCanariesLastRunResponse({
    this.canariesLastRun,
    this.nextToken,
  });

  factory DescribeCanariesLastRunResponse.fromJson(Map<String, dynamic> json) {
    return DescribeCanariesLastRunResponse(
      canariesLastRun: (json['CanariesLastRun'] as List?)
          ?.whereNotNull()
          .map((e) => CanaryLastRun.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final canariesLastRun = this.canariesLastRun;
    final nextToken = this.nextToken;
    return {
      if (canariesLastRun != null) 'CanariesLastRun': canariesLastRun,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeCanariesResponse {
  /// Returns an array. Each item in the array contains the full information about
  /// one canary.
  final List<Canary>? canaries;

  /// A token that indicates that there is more data available. You can use this
  /// token in a subsequent <code>DescribeCanaries</code> operation to retrieve
  /// the next set of results.
  final String? nextToken;

  DescribeCanariesResponse({
    this.canaries,
    this.nextToken,
  });

  factory DescribeCanariesResponse.fromJson(Map<String, dynamic> json) {
    return DescribeCanariesResponse(
      canaries: (json['Canaries'] as List?)
          ?.whereNotNull()
          .map((e) => Canary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final canaries = this.canaries;
    final nextToken = this.nextToken;
    return {
      if (canaries != null) 'Canaries': canaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeRuntimeVersionsResponse {
  /// A token that indicates that there is more data available. You can use this
  /// token in a subsequent <code>DescribeRuntimeVersions</code> operation to
  /// retrieve the next set of results.
  final String? nextToken;

  /// An array of objects that display the details about each Synthetics canary
  /// runtime version.
  final List<RuntimeVersion>? runtimeVersions;

  DescribeRuntimeVersionsResponse({
    this.nextToken,
    this.runtimeVersions,
  });

  factory DescribeRuntimeVersionsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeRuntimeVersionsResponse(
      nextToken: json['NextToken'] as String?,
      runtimeVersions: (json['RuntimeVersions'] as List?)
          ?.whereNotNull()
          .map((e) => RuntimeVersion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final runtimeVersions = this.runtimeVersions;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (runtimeVersions != null) 'RuntimeVersions': runtimeVersions,
    };
  }
}

class DisassociateResourceResponse {
  DisassociateResourceResponse();

  factory DisassociateResourceResponse.fromJson(Map<String, dynamic> _) {
    return DisassociateResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum EncryptionMode {
  sseS3,
  sseKms,
}

extension EncryptionModeValueExtension on EncryptionMode {
  String toValue() {
    switch (this) {
      case EncryptionMode.sseS3:
        return 'SSE_S3';
      case EncryptionMode.sseKms:
        return 'SSE_KMS';
    }
  }
}

extension EncryptionModeFromString on String {
  EncryptionMode toEncryptionMode() {
    switch (this) {
      case 'SSE_S3':
        return EncryptionMode.sseS3;
      case 'SSE_KMS':
        return EncryptionMode.sseKms;
    }
    throw Exception('$this is not known in enum EncryptionMode');
  }
}

class GetCanaryResponse {
  /// A structure that contains the full information about the canary.
  final Canary? canary;

  GetCanaryResponse({
    this.canary,
  });

  factory GetCanaryResponse.fromJson(Map<String, dynamic> json) {
    return GetCanaryResponse(
      canary: json['Canary'] != null
          ? Canary.fromJson(json['Canary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final canary = this.canary;
    return {
      if (canary != null) 'Canary': canary,
    };
  }
}

class GetCanaryRunsResponse {
  /// An array of structures. Each structure contains the details of one of the
  /// retrieved canary runs.
  final List<CanaryRun>? canaryRuns;

  /// A token that indicates that there is more data available. You can use this
  /// token in a subsequent <code>GetCanaryRuns</code> operation to retrieve the
  /// next set of results.
  final String? nextToken;

  GetCanaryRunsResponse({
    this.canaryRuns,
    this.nextToken,
  });

  factory GetCanaryRunsResponse.fromJson(Map<String, dynamic> json) {
    return GetCanaryRunsResponse(
      canaryRuns: (json['CanaryRuns'] as List?)
          ?.whereNotNull()
          .map((e) => CanaryRun.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final canaryRuns = this.canaryRuns;
    final nextToken = this.nextToken;
    return {
      if (canaryRuns != null) 'CanaryRuns': canaryRuns,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class GetGroupResponse {
  /// A structure that contains information about the group.
  final Group? group;

  GetGroupResponse({
    this.group,
  });

  factory GetGroupResponse.fromJson(Map<String, dynamic> json) {
    return GetGroupResponse(
      group: json['Group'] != null
          ? Group.fromJson(json['Group'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final group = this.group;
    return {
      if (group != null) 'Group': group,
    };
  }
}

/// This structure contains information about one group.
class Group {
  /// The ARN of the group.
  final String? arn;

  /// The date and time that the group was created.
  final DateTime? createdTime;

  /// The unique ID of the group.
  final String? id;

  /// The date and time that the group was most recently updated.
  final DateTime? lastModifiedTime;

  /// The name of the group.
  final String? name;

  /// The list of key-value pairs that are associated with the canary.
  final Map<String, String>? tags;

  Group({
    this.arn,
    this.createdTime,
    this.id,
    this.lastModifiedTime,
    this.name,
    this.tags,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      arn: json['Arn'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      id: json['Id'] as String?,
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      name: json['Name'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdTime = this.createdTime;
    final id = this.id;
    final lastModifiedTime = this.lastModifiedTime;
    final name = this.name;
    final tags = this.tags;
    return {
      if (arn != null) 'Arn': arn,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (id != null) 'Id': id,
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (name != null) 'Name': name,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// A structure containing some information about a group.
class GroupSummary {
  /// The ARN of the group.
  final String? arn;

  /// The unique ID of the group.
  final String? id;

  /// The name of the group.
  final String? name;

  GroupSummary({
    this.arn,
    this.id,
    this.name,
  });

  factory GroupSummary.fromJson(Map<String, dynamic> json) {
    return GroupSummary(
      arn: json['Arn'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    return {
      if (arn != null) 'Arn': arn,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
    };
  }
}

class ListAssociatedGroupsResponse {
  /// An array of structures that contain information about the groups that this
  /// canary is associated with.
  final List<GroupSummary>? groups;

  /// A token that indicates that there is more data available. You can use this
  /// token in a subsequent <code>ListAssociatedGroups</code> operation to
  /// retrieve the next set of results.
  final String? nextToken;

  ListAssociatedGroupsResponse({
    this.groups,
    this.nextToken,
  });

  factory ListAssociatedGroupsResponse.fromJson(Map<String, dynamic> json) {
    return ListAssociatedGroupsResponse(
      groups: (json['Groups'] as List?)
          ?.whereNotNull()
          .map((e) => GroupSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final groups = this.groups;
    final nextToken = this.nextToken;
    return {
      if (groups != null) 'Groups': groups,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListGroupResourcesResponse {
  /// A token that indicates that there is more data available. You can use this
  /// token in a subsequent <code>ListGroupResources</code> operation to retrieve
  /// the next set of results.
  final String? nextToken;

  /// An array of ARNs. These ARNs are for the canaries that are associated with
  /// the group.
  final List<String>? resources;

  ListGroupResourcesResponse({
    this.nextToken,
    this.resources,
  });

  factory ListGroupResourcesResponse.fromJson(Map<String, dynamic> json) {
    return ListGroupResourcesResponse(
      nextToken: json['NextToken'] as String?,
      resources: (json['Resources'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final resources = this.resources;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (resources != null) 'Resources': resources,
    };
  }
}

class ListGroupsResponse {
  /// An array of structures that each contain information about one group.
  final List<GroupSummary>? groups;

  /// A token that indicates that there is more data available. You can use this
  /// token in a subsequent <code>ListGroups</code> operation to retrieve the next
  /// set of results.
  final String? nextToken;

  ListGroupsResponse({
    this.groups,
    this.nextToken,
  });

  factory ListGroupsResponse.fromJson(Map<String, dynamic> json) {
    return ListGroupsResponse(
      groups: (json['Groups'] as List?)
          ?.whereNotNull()
          .map((e) => GroupSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final groups = this.groups;
    final nextToken = this.nextToken;
    return {
      if (groups != null) 'Groups': groups,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// The list of tag keys and values associated with the resource that you
  /// specified.
  final Map<String, String>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

/// This structure contains information about one canary runtime version. For
/// more information about runtime versions, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_Library.html">
/// Canary Runtime Versions</a>.
class RuntimeVersion {
  /// If this runtime version is deprecated, this value is the date of
  /// deprecation.
  final DateTime? deprecationDate;

  /// A description of the runtime version, created by Amazon.
  final String? description;

  /// The date that the runtime version was released.
  final DateTime? releaseDate;

  /// The name of the runtime version. For a list of valid runtime versions, see
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_Library.html">
  /// Canary Runtime Versions</a>.
  final String? versionName;

  RuntimeVersion({
    this.deprecationDate,
    this.description,
    this.releaseDate,
    this.versionName,
  });

  factory RuntimeVersion.fromJson(Map<String, dynamic> json) {
    return RuntimeVersion(
      deprecationDate: timeStampFromJson(json['DeprecationDate']),
      description: json['Description'] as String?,
      releaseDate: timeStampFromJson(json['ReleaseDate']),
      versionName: json['VersionName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deprecationDate = this.deprecationDate;
    final description = this.description;
    final releaseDate = this.releaseDate;
    final versionName = this.versionName;
    return {
      if (deprecationDate != null)
        'DeprecationDate': unixTimestampToJson(deprecationDate),
      if (description != null) 'Description': description,
      if (releaseDate != null) 'ReleaseDate': unixTimestampToJson(releaseDate),
      if (versionName != null) 'VersionName': versionName,
    };
  }
}

/// A structure that contains the configuration of encryption-at-rest settings
/// for canary artifacts that the canary uploads to Amazon S3.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_artifact_encryption.html">Encrypting
/// canary artifacts</a>
class S3EncryptionConfig {
  /// The encryption method to use for artifacts created by this canary. Specify
  /// <code>SSE_S3</code> to use server-side encryption (SSE) with an Amazon
  /// S3-managed key. Specify <code>SSE-KMS</code> to use server-side encryption
  /// with a customer-managed KMS key.
  ///
  /// If you omit this parameter, an Amazon Web Services-managed KMS key is used.
  final EncryptionMode? encryptionMode;

  /// The ARN of the customer-managed KMS key to use, if you specify
  /// <code>SSE-KMS</code> for <code>EncryptionMode</code>
  final String? kmsKeyArn;

  S3EncryptionConfig({
    this.encryptionMode,
    this.kmsKeyArn,
  });

  factory S3EncryptionConfig.fromJson(Map<String, dynamic> json) {
    return S3EncryptionConfig(
      encryptionMode: (json['EncryptionMode'] as String?)?.toEncryptionMode(),
      kmsKeyArn: json['KmsKeyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionMode = this.encryptionMode;
    final kmsKeyArn = this.kmsKeyArn;
    return {
      if (encryptionMode != null) 'EncryptionMode': encryptionMode.toValue(),
      if (kmsKeyArn != null) 'KmsKeyArn': kmsKeyArn,
    };
  }
}

class StartCanaryResponse {
  StartCanaryResponse();

  factory StartCanaryResponse.fromJson(Map<String, dynamic> _) {
    return StartCanaryResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class StopCanaryResponse {
  StopCanaryResponse();

  factory StopCanaryResponse.fromJson(Map<String, dynamic> _) {
    return StopCanaryResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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

class UpdateCanaryResponse {
  UpdateCanaryResponse();

  factory UpdateCanaryResponse.fromJson(Map<String, dynamic> _) {
    return UpdateCanaryResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An object that specifies what screenshots to use as a baseline for visual
/// monitoring by this canary. It can optionally also specify parts of the
/// screenshots to ignore during the visual monitoring comparison.
///
/// Visual monitoring is supported only on canaries running the
/// <b>syn-puppeteer-node-3.2</b> runtime or later. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Library_SyntheticsLogger_VisualTesting.html">
/// Visual monitoring</a> and <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_Blueprints_VisualTesting.html">
/// Visual monitoring blueprint</a>
class VisualReferenceInput {
  /// Specifies which canary run to use the screenshots from as the baseline for
  /// future visual monitoring with this canary. Valid values are
  /// <code>nextrun</code> to use the screenshots from the next run after this
  /// update is made, <code>lastrun</code> to use the screenshots from the most
  /// recent run before this update was made, or the value of <code>Id</code> in
  /// the <a
  /// href="https://docs.aws.amazon.com/AmazonSynthetics/latest/APIReference/API_CanaryRun.html">
  /// CanaryRun</a> from any past run of this canary.
  final String baseCanaryRunId;

  /// An array of screenshots that will be used as the baseline for visual
  /// monitoring in future runs of this canary. If there is a screenshot that you
  /// don't want to be used for visual monitoring, remove it from this array.
  final List<BaseScreenshot>? baseScreenshots;

  VisualReferenceInput({
    required this.baseCanaryRunId,
    this.baseScreenshots,
  });

  Map<String, dynamic> toJson() {
    final baseCanaryRunId = this.baseCanaryRunId;
    final baseScreenshots = this.baseScreenshots;
    return {
      'BaseCanaryRunId': baseCanaryRunId,
      if (baseScreenshots != null) 'BaseScreenshots': baseScreenshots,
    };
  }
}

/// If this canary performs visual monitoring by comparing screenshots, this
/// structure contains the ID of the canary run that is used as the baseline for
/// screenshots, and the coordinates of any parts of those screenshots that are
/// ignored during visual monitoring comparison.
///
/// Visual monitoring is supported only on canaries running the
/// <b>syn-puppeteer-node-3.2</b> runtime or later.
class VisualReferenceOutput {
  /// The ID of the canary run that produced the baseline screenshots that are
  /// used for visual monitoring comparisons by this canary.
  final String? baseCanaryRunId;

  /// An array of screenshots that are used as the baseline for comparisons during
  /// visual monitoring.
  final List<BaseScreenshot>? baseScreenshots;

  VisualReferenceOutput({
    this.baseCanaryRunId,
    this.baseScreenshots,
  });

  factory VisualReferenceOutput.fromJson(Map<String, dynamic> json) {
    return VisualReferenceOutput(
      baseCanaryRunId: json['BaseCanaryRunId'] as String?,
      baseScreenshots: (json['BaseScreenshots'] as List?)
          ?.whereNotNull()
          .map((e) => BaseScreenshot.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final baseCanaryRunId = this.baseCanaryRunId;
    final baseScreenshots = this.baseScreenshots;
    return {
      if (baseCanaryRunId != null) 'BaseCanaryRunId': baseCanaryRunId,
      if (baseScreenshots != null) 'BaseScreenshots': baseScreenshots,
    };
  }
}

/// If this canary is to test an endpoint in a VPC, this structure contains
/// information about the subnets and security groups of the VPC endpoint. For
/// more information, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_VPC.html">
/// Running a Canary in a VPC</a>.
class VpcConfigInput {
  /// The IDs of the security groups for this canary.
  final List<String>? securityGroupIds;

  /// The IDs of the subnets where this canary is to run.
  final List<String>? subnetIds;

  VpcConfigInput({
    this.securityGroupIds,
    this.subnetIds,
  });

  Map<String, dynamic> toJson() {
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    return {
      if (securityGroupIds != null) 'SecurityGroupIds': securityGroupIds,
      if (subnetIds != null) 'SubnetIds': subnetIds,
    };
  }
}

/// If this canary is to test an endpoint in a VPC, this structure contains
/// information about the subnets and security groups of the VPC endpoint. For
/// more information, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_VPC.html">
/// Running a Canary in a VPC</a>.
class VpcConfigOutput {
  /// The IDs of the security groups for this canary.
  final List<String>? securityGroupIds;

  /// The IDs of the subnets where this canary is to run.
  final List<String>? subnetIds;

  /// The IDs of the VPC where this canary is to run.
  final String? vpcId;

  VpcConfigOutput({
    this.securityGroupIds,
    this.subnetIds,
    this.vpcId,
  });

  factory VpcConfigOutput.fromJson(Map<String, dynamic> json) {
    return VpcConfigOutput(
      securityGroupIds: (json['SecurityGroupIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      subnetIds: (json['SubnetIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    final vpcId = this.vpcId;
    return {
      if (securityGroupIds != null) 'SecurityGroupIds': securityGroupIds,
      if (subnetIds != null) 'SubnetIds': subnetIds,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String? type, String? message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalFailureException extends _s.GenericAwsException {
  InternalFailureException({String? type, String? message})
      : super(type: type, code: 'InternalFailureException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String? type, String? message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class RequestEntityTooLargeException extends _s.GenericAwsException {
  RequestEntityTooLargeException({String? type, String? message})
      : super(
            type: type,
            code: 'RequestEntityTooLargeException',
            message: message);
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

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String? type, String? message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalFailureException': (type, message) =>
      InternalFailureException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'NotFoundException': (type, message) =>
      NotFoundException(type: type, message: message),
  'RequestEntityTooLargeException': (type, message) =>
      RequestEntityTooLargeException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
