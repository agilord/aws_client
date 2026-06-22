// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: unnecessary_brace_in_string_interps

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

import 'v2017_10_11.endpoints.dart' as _endpoints;
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
  factory Synthetics({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'synthetics',
    );
    return Synthetics._(
      protocol: _s.RestJsonProtocol(
        client: client,
        endpointBuilder: () => _s.Endpoint.fromResolved(
            _endpoints.resolveEndpoint(
                region: region,
                endpoint: endpointUrl,
                useFips: useFipsEndpoint,
                useDualStack: useDualStackEndpoint),
            service: service,
            region: region),
        credentials: credentials,
        credentialsProvider: credentialsProvider,
      ),
    );
  }
  Synthetics._({
    required _s.RestJsonProtocol protocol,
  }) : _protocol = protocol;

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
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
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
  /// May throw [RequestEntityTooLargeException].
  /// May throw [ValidationException].
  ///
  /// Parameter [artifactS3Location] :
  /// The location in Amazon S3 where Synthetics stores artifacts from the test
  /// runs of this canary. Artifacts include the log file, screenshots, and HAR
  /// files. The name of the Amazon S3 bucket can't include a period (.).
  ///
  /// Parameter [code] :
  /// A structure that includes the entry point from which the canary should
  /// start running your script. If the script is stored in an Amazon S3 bucket,
  /// the bucket name, key, and version are also included.
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
  /// Parameter [browserConfigs] :
  /// CloudWatch Synthetics now supports multibrowser canaries for
  /// <code>syn-nodejs-puppeteer-11.0</code> and
  /// <code>syn-nodejs-playwright-3.0</code> runtimes. This feature allows you
  /// to run your canaries on both Firefox and Chrome browsers. To create a
  /// multibrowser canary, you need to specify the BrowserConfigs with a list of
  /// browsers you want to use.
  /// <note>
  /// If not specified, <code>browserConfigs</code> defaults to Chrome.
  /// </note>
  ///
  /// Parameter [failureRetentionPeriodInDays] :
  /// The number of days to retain data about failed runs of this canary. If you
  /// omit this field, the default of 31 days is used. The valid range is 1 to
  /// 455 days.
  ///
  /// This setting affects the range of information returned by <a
  /// href="https://docs.aws.amazon.com/AmazonSynthetics/latest/APIReference/API_GetCanaryRuns.html">GetCanaryRuns</a>,
  /// as well as the range of information displayed in the Synthetics console.
  ///
  /// Parameter [provisionedResourceCleanup] :
  /// Specifies whether to also delete the Lambda functions and layers used by
  /// this canary when the canary is deleted. If you omit this parameter, the
  /// default of <code>AUTOMATIC</code> is used, which means that the Lambda
  /// functions and layers will be deleted when the canary is deleted.
  ///
  /// If the value of this parameter is <code>OFF</code>, then the value of the
  /// <code>DeleteLambda</code> parameter of the <a
  /// href="https://docs.aws.amazon.com/AmazonSynthetics/latest/APIReference/API_DeleteCanary.html">DeleteCanary</a>
  /// operation determines whether the Lambda functions and layers will be
  /// deleted.
  ///
  /// Parameter [resourcesToReplicateTags] :
  /// To have the tags that you apply to this canary also be applied to the
  /// Lambda function that the canary uses, specify this parameter with the
  /// value <code>lambda-function</code>.
  ///
  /// If you specify this parameter and don't specify any tags in the
  /// <code>Tags</code> parameter, the canary creation fails.
  ///
  /// Parameter [runConfig] :
  /// A structure that contains the configuration for individual canary runs,
  /// such as timeout value and environment variables.
  /// <important>
  /// Environment variable keys and values are encrypted at rest using Amazon
  /// Web Services owned KMS keys. However, the environment variables are not
  /// encrypted on the client side. Do not store sensitive information in them.
  /// </important>
  ///
  /// Parameter [successRetentionPeriodInDays] :
  /// The number of days to retain data about successful runs of this canary. If
  /// you omit this field, the default of 31 days is used. The valid range is 1
  /// to 455 days.
  ///
  /// This setting affects the range of information returned by <a
  /// href="https://docs.aws.amazon.com/AmazonSynthetics/latest/APIReference/API_GetCanaryRuns.html">GetCanaryRuns</a>,
  /// as well as the range of information displayed in the Synthetics console.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs to associate with the canary. You can associate
  /// as many as 50 tags with a canary.
  ///
  /// Tags can help you organize and categorize your resources. You can also use
  /// them to scope user permissions, by granting a user permission to access or
  /// change only the resources that have certain tag values.
  ///
  /// To have the tags that you apply to this canary also be applied to the
  /// Lambda function that the canary uses, specify this parameter with the
  /// value <code>lambda-function</code>.
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
    List<BrowserConfig>? browserConfigs,
    int? failureRetentionPeriodInDays,
    ProvisionedResourceCleanupSetting? provisionedResourceCleanup,
    List<ResourceToTag>? resourcesToReplicateTags,
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
      if (browserConfigs != null) 'BrowserConfigs': browserConfigs,
      if (failureRetentionPeriodInDays != null)
        'FailureRetentionPeriodInDays': failureRetentionPeriodInDays,
      if (provisionedResourceCleanup != null)
        'ProvisionedResourceCleanup': provisionedResourceCleanup.value,
      if (resourcesToReplicateTags != null)
        'ResourcesToReplicateTags':
            resourcesToReplicateTags.map((e) => e.value).toList(),
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
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
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
  /// If the canary's <code>ProvisionedResourceCleanup</code> field is set to
  /// <code>AUTOMATIC</code> or you specify <code>DeleteLambda</code> in this
  /// operation as <code>true</code>, CloudWatch Synthetics also deletes the
  /// Lambda functions and layers that are used by the canary.
  ///
  /// Other resources used and created by the canary are not automatically
  /// deleted. After you delete a canary, you should also delete the following:
  ///
  /// <ul>
  /// <li>
  /// The CloudWatch alarms created for this canary. These alarms have a name of
  /// <code>Synthetics-Alarm-<i>first-198-characters-of-canary-name</i>-<i>canaryId</i>-<i>alarm
  /// number</i> </code>
  /// </li>
  /// <li>
  /// Amazon S3 objects and buckets, such as the canary's artifact location.
  /// </li>
  /// <li>
  /// IAM roles created for the canary. If they were created in the console,
  /// these roles have the name <code>
  /// role/service-role/CloudWatchSyntheticsRole-<i>First-21-Characters-of-CanaryName</i>
  /// </code>
  /// </li>
  /// <li>
  /// CloudWatch Logs log groups created for the canary. These logs groups have
  /// the name <code>/aws/lambda/cwsyn-<i>First-21-Characters-of-CanaryName</i>
  /// </code>
  /// </li>
  /// </ul>
  /// Before you delete a canary, you might want to use <code>GetCanary</code>
  /// to display the information about this canary. Make note of the information
  /// returned by this operation so that you can delete these resources after
  /// you delete the canary.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the canary that you want to delete. To find the names of your
  /// canaries, use <a
  /// href="https://docs.aws.amazon.com/AmazonSynthetics/latest/APIReference/API_DescribeCanaries.html">DescribeCanaries</a>.
  ///
  /// Parameter [deleteLambda] :
  /// Specifies whether to also delete the Lambda functions and layers used by
  /// this canary. The default is <code>false</code>.
  ///
  /// Your setting for this parameter is used only if the canary doesn't have
  /// <code>AUTOMATIC</code> for its <code>ProvisionedResourceCleanup</code>
  /// field. If that field is set to <code>AUTOMATIC</code>, then the Lambda
  /// functions and layers will be deleted when this canary is deleted.
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
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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
  /// parameter, the default of 20 is used.
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
  /// Parameter [browserType] :
  /// The type of browser to use for the canary run.
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
    BrowserType? browserType,
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
      if (browserType != null) 'BrowserType': browserType.value,
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
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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
  ///
  /// Parameter [dryRunId] :
  /// The DryRunId associated with an existing canary’s dry run. You can use
  /// this DryRunId to retrieve information about the dry run.
  Future<GetCanaryResponse> getCanary({
    required String name,
    String? dryRunId,
  }) async {
    final $query = <String, List<String>>{
      if (dryRunId != null) 'dryRunId': [dryRunId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/canary/${Uri.encodeComponent(name)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetCanaryResponse.fromJson(response);
  }

  /// Retrieves a list of runs for a specified canary.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the canary that you want to see runs for.
  ///
  /// Parameter [dryRunId] :
  /// The DryRunId associated with an existing canary’s dry run. You can use
  /// this DryRunId to retrieve information about the dry run.
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
  /// <note>
  /// When auto retry is enabled for the canary, the first subsequent retry is
  /// suffixed with *1 indicating its the first retry and the next subsequent
  /// try is suffixed with *2.
  /// </note>
  ///
  /// Parameter [runType] :
  /// <ul>
  /// <li>
  /// When you provide <code>RunType=CANARY_RUN</code> and
  /// <code>dryRunId</code>, you will get an exception
  /// </li>
  /// <li>
  /// When a value is not provided for <code>RunType</code>, the default value
  /// is <code>CANARY_RUN</code>
  /// </li>
  /// <li>
  /// When <code>CANARY_RUN</code> is provided, all canary runs excluding dry
  /// runs are returned
  /// </li>
  /// <li>
  /// When <code>DRY_RUN</code> is provided, all dry runs excluding canary runs
  /// are returned
  /// </li>
  /// </ul>
  Future<GetCanaryRunsResponse> getCanaryRuns({
    required String name,
    String? dryRunId,
    int? maxResults,
    String? nextToken,
    RunType? runType,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (dryRunId != null) 'DryRunId': dryRunId,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (runType != null) 'RunType': runType.value,
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
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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
  /// May throw [ConflictException].
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
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
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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

  /// Use this operation to start a dry run for a canary that has already been
  /// created
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the canary that you want to dry run. To find canary names, use
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonSynthetics/latest/APIReference/API_DescribeCanaries.html">DescribeCanaries</a>.
  ///
  /// Parameter [artifactS3Location] :
  /// The location in Amazon S3 where Synthetics stores artifacts from the test
  /// runs of this canary. Artifacts include the log file, screenshots, and HAR
  /// files. The name of the Amazon S3 bucket can't include a period (.).
  ///
  /// Parameter [browserConfigs] :
  /// A structure that specifies the browser type to use for a canary run.
  /// CloudWatch Synthetics supports running canaries on both
  /// <code>CHROME</code> and <code>FIREFOX</code> browsers.
  /// <note>
  /// If not specified, <code>browserConfigs</code> defaults to Chrome.
  /// </note>
  ///
  /// Parameter [executionRoleArn] :
  /// The ARN of the IAM role to be used to run the canary. This role must
  /// already exist, and must include <code>lambda.amazonaws.com</code> as a
  /// principal in the trust policy. The role must also have the following
  /// permissions:
  ///
  /// Parameter [failureRetentionPeriodInDays] :
  /// The number of days to retain data about failed runs of this canary. If you
  /// omit this field, the default of 31 days is used. The valid range is 1 to
  /// 455 days.
  ///
  /// This setting affects the range of information returned by <a
  /// href="https://docs.aws.amazon.com/AmazonSynthetics/latest/APIReference/API_GetCanaryRuns.html">GetCanaryRuns</a>,
  /// as well as the range of information displayed in the Synthetics console.
  ///
  /// Parameter [provisionedResourceCleanup] :
  /// Specifies whether to also delete the Lambda functions and layers used by
  /// this canary when the canary is deleted. If you omit this parameter, the
  /// default of <code>AUTOMATIC</code> is used, which means that the Lambda
  /// functions and layers will be deleted when the canary is deleted.
  ///
  /// If the value of this parameter is <code>OFF</code>, then the value of the
  /// <code>DeleteLambda</code> parameter of the <a
  /// href="https://docs.aws.amazon.com/AmazonSynthetics/latest/APIReference/API_DeleteCanary.html">DeleteCanary</a>
  /// operation determines whether the Lambda functions and layers will be
  /// deleted.
  ///
  /// Parameter [runtimeVersion] :
  /// Specifies the runtime version to use for the canary. For a list of valid
  /// runtime versions and for more information about runtime versions, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_Library.html">
  /// Canary Runtime Versions</a>.
  ///
  /// Parameter [successRetentionPeriodInDays] :
  /// The number of days to retain data about successful runs of this canary. If
  /// you omit this field, the default of 31 days is used. The valid range is 1
  /// to 455 days.
  ///
  /// This setting affects the range of information returned by <a
  /// href="https://docs.aws.amazon.com/AmazonSynthetics/latest/APIReference/API_GetCanaryRuns.html">GetCanaryRuns</a>,
  /// as well as the range of information displayed in the Synthetics console.
  ///
  /// Parameter [visualReferences] :
  /// A list of visual reference configurations for the canary, one for each
  /// browser type that the canary is configured to run on. Visual references
  /// are used for visual monitoring comparisons.
  ///
  /// <code>syn-nodejs-puppeteer-11.0</code> and above, and
  /// <code>syn-nodejs-playwright-3.0</code> and above, only supports
  /// <code>visualReferences</code>. <code>visualReference</code> field is not
  /// supported.
  ///
  /// Versions older than <code>syn-nodejs-puppeteer-11.0</code> supports both
  /// <code>visualReference</code> and <code>visualReferences</code> for
  /// backward compatibility. It is recommended to use
  /// <code>visualReferences</code> for consistency and future compatibility.
  Future<StartCanaryDryRunResponse> startCanaryDryRun({
    required String name,
    ArtifactConfigInput? artifactConfig,
    String? artifactS3Location,
    List<BrowserConfig>? browserConfigs,
    CanaryCodeInput? code,
    String? executionRoleArn,
    int? failureRetentionPeriodInDays,
    ProvisionedResourceCleanupSetting? provisionedResourceCleanup,
    CanaryRunConfigInput? runConfig,
    String? runtimeVersion,
    int? successRetentionPeriodInDays,
    VisualReferenceInput? visualReference,
    List<VisualReferenceInput>? visualReferences,
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
      if (browserConfigs != null) 'BrowserConfigs': browserConfigs,
      if (code != null) 'Code': code,
      if (executionRoleArn != null) 'ExecutionRoleArn': executionRoleArn,
      if (failureRetentionPeriodInDays != null)
        'FailureRetentionPeriodInDays': failureRetentionPeriodInDays,
      if (provisionedResourceCleanup != null)
        'ProvisionedResourceCleanup': provisionedResourceCleanup.value,
      if (runConfig != null) 'RunConfig': runConfig,
      if (runtimeVersion != null) 'RuntimeVersion': runtimeVersion,
      if (successRetentionPeriodInDays != null)
        'SuccessRetentionPeriodInDays': successRetentionPeriodInDays,
      if (visualReference != null) 'VisualReference': visualReference,
      if (visualReferences != null) 'VisualReferences': visualReferences,
      if (vpcConfig != null) 'VpcConfig': vpcConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/canary/${Uri.encodeComponent(name)}/dry-run/start',
      exceptionFnMap: _exceptionFns,
    );
    return StartCanaryDryRunResponse.fromJson(response);
  }

  /// Stops the canary to prevent all future runs. If the canary is currently
  /// running,the run that is in progress completes on its own, publishes
  /// metrics, and uploads artifacts, but it is not recorded in Synthetics as a
  /// completed run.
  ///
  /// You can use <code>StartCanary</code> to start it running again with the
  /// canary’s current schedule at any point in the future.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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
  /// May throw [ConflictException].
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
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
  /// May throw [ConflictException].
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
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
  /// For multibrowser canaries, you can add or remove browsers by updating the
  /// browserConfig list in the update call. For example:
  ///
  /// <ul>
  /// <li>
  /// To add Firefox to a canary that currently uses Chrome, specify
  /// browserConfigs as \[CHROME, FIREFOX\]
  /// </li>
  /// <li>
  /// To remove Firefox and keep only Chrome, specify browserConfigs as
  /// \[CHROME\]
  /// </li>
  /// </ul>
  /// You can't use this operation to update the tags of an existing canary. To
  /// change the tags of an existing canary, use <a
  /// href="https://docs.aws.amazon.com/AmazonSynthetics/latest/APIReference/API_TagResource.html">TagResource</a>.
  /// <note>
  /// When you use the <code>dryRunId</code> field when updating a canary, the
  /// only other field you can provide is the <code>Schedule</code>. Adding any
  /// other field will thrown an exception.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [RequestEntityTooLargeException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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
  /// files. The name of the Amazon S3 bucket can't include a period (.).
  ///
  /// Parameter [browserConfigs] :
  /// A structure that specifies the browser type to use for a canary run.
  /// CloudWatch Synthetics supports running canaries on both
  /// <code>CHROME</code> and <code>FIREFOX</code> browsers.
  /// <note>
  /// If not specified, <code>browserConfigs</code> defaults to Chrome.
  /// </note>
  ///
  /// Parameter [code] :
  /// A structure that includes the entry point from which the canary should
  /// start running your script. If the script is stored in an Amazon S3 bucket,
  /// the bucket name, key, and version are also included.
  ///
  /// Parameter [dryRunId] :
  /// Update the existing canary using the updated configurations from the
  /// DryRun associated with the DryRunId.
  /// <note>
  /// When you use the <code>dryRunId</code> field when updating a canary, the
  /// only other field you can provide is the <code>Schedule</code>. Adding any
  /// other field will thrown an exception.
  /// </note>
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
  /// This setting affects the range of information returned by <a
  /// href="https://docs.aws.amazon.com/AmazonSynthetics/latest/APIReference/API_GetCanaryRuns.html">GetCanaryRuns</a>,
  /// as well as the range of information displayed in the Synthetics console.
  ///
  /// Parameter [provisionedResourceCleanup] :
  /// Specifies whether to also delete the Lambda functions and layers used by
  /// this canary when the canary is deleted.
  ///
  /// If the value of this parameter is <code>OFF</code>, then the value of the
  /// <code>DeleteLambda</code> parameter of the <a
  /// href="https://docs.aws.amazon.com/AmazonSynthetics/latest/APIReference/API_DeleteCanary.html">DeleteCanary</a>
  /// operation determines whether the Lambda functions and layers will be
  /// deleted.
  ///
  /// Parameter [runConfig] :
  /// A structure that contains the timeout value that is used for each
  /// individual run of the canary.
  /// <important>
  /// Environment variable keys and values are encrypted at rest using Amazon
  /// Web Services owned KMS keys. However, the environment variables are not
  /// encrypted on the client side. Do not store sensitive information in them.
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
  /// This setting affects the range of information returned by <a
  /// href="https://docs.aws.amazon.com/AmazonSynthetics/latest/APIReference/API_GetCanaryRuns.html">GetCanaryRuns</a>,
  /// as well as the range of information displayed in the Synthetics console.
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
  /// Parameter [visualReferences] :
  /// A list of visual reference configurations for the canary, one for each
  /// browser type that the canary is configured to run on. Visual references
  /// are used for visual monitoring comparisons.
  ///
  /// <code>syn-nodejs-puppeteer-11.0</code> and above, and
  /// <code>syn-nodejs-playwright-3.0</code> and above, only supports
  /// <code>visualReferences</code>. <code>visualReference</code> field is not
  /// supported.
  ///
  /// Versions older than <code>syn-nodejs-puppeteer-11.0</code> supports both
  /// <code>visualReference</code> and <code>visualReferences</code> for
  /// backward compatibility. It is recommended to use
  /// <code>visualReferences</code> for consistency and future compatibility.
  ///
  /// For multibrowser visual monitoring, you can update the baseline for all
  /// configured browsers in a single update call by specifying a list of
  /// VisualReference objects, one per browser. Each VisualReference object maps
  /// to a specific browser configuration, allowing you to manage visual
  /// baselines for multiple browsers simultaneously.
  ///
  /// For single configuration canaries using Chrome browser (default browser),
  /// use visualReferences for <code>syn-nodejs-puppeteer-11.0</code> and above,
  /// and <code>syn-nodejs-playwright-3.0</code> and above canaries. The
  /// browserType in the visualReference object is not mandatory.
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
    List<BrowserConfig>? browserConfigs,
    CanaryCodeInput? code,
    String? dryRunId,
    String? executionRoleArn,
    int? failureRetentionPeriodInDays,
    ProvisionedResourceCleanupSetting? provisionedResourceCleanup,
    CanaryRunConfigInput? runConfig,
    String? runtimeVersion,
    CanaryScheduleInput? schedule,
    int? successRetentionPeriodInDays,
    VisualReferenceInput? visualReference,
    List<VisualReferenceInput>? visualReferences,
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
      if (browserConfigs != null) 'BrowserConfigs': browserConfigs,
      if (code != null) 'Code': code,
      if (dryRunId != null) 'DryRunId': dryRunId,
      if (executionRoleArn != null) 'ExecutionRoleArn': executionRoleArn,
      if (failureRetentionPeriodInDays != null)
        'FailureRetentionPeriodInDays': failureRetentionPeriodInDays,
      if (provisionedResourceCleanup != null)
        'ProvisionedResourceCleanup': provisionedResourceCleanup.value,
      if (runConfig != null) 'RunConfig': runConfig,
      if (runtimeVersion != null) 'RuntimeVersion': runtimeVersion,
      if (schedule != null) 'Schedule': schedule,
      if (successRetentionPeriodInDays != null)
        'SuccessRetentionPeriodInDays': successRetentionPeriodInDays,
      if (visualReference != null) 'VisualReference': visualReference,
      if (visualReferences != null) 'VisualReferences': visualReferences,
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

/// @nodoc
class AssociateResourceResponse {
  AssociateResourceResponse();

  factory AssociateResourceResponse.fromJson(Map<String, dynamic> _) {
    return AssociateResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
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

/// @nodoc
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

/// @nodoc
class DeleteCanaryResponse {
  DeleteCanaryResponse();

  factory DeleteCanaryResponse.fromJson(Map<String, dynamic> _) {
    return DeleteCanaryResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class DeleteGroupResponse {
  DeleteGroupResponse();

  factory DeleteGroupResponse.fromJson(Map<String, dynamic> _) {
    return DeleteGroupResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
class DisassociateResourceResponse {
  DisassociateResourceResponse();

  factory DisassociateResourceResponse.fromJson(Map<String, dynamic> _) {
    return DisassociateResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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

/// @nodoc
class StartCanaryResponse {
  StartCanaryResponse();

  factory StartCanaryResponse.fromJson(Map<String, dynamic> _) {
    return StartCanaryResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class StartCanaryDryRunResponse {
  /// Returns the dry run configurations for a canary.
  final DryRunConfigOutput? dryRunConfig;

  StartCanaryDryRunResponse({
    this.dryRunConfig,
  });

  factory StartCanaryDryRunResponse.fromJson(Map<String, dynamic> json) {
    return StartCanaryDryRunResponse(
      dryRunConfig: json['DryRunConfig'] != null
          ? DryRunConfigOutput.fromJson(
              json['DryRunConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dryRunConfig = this.dryRunConfig;
    return {
      if (dryRunConfig != null) 'DryRunConfig': dryRunConfig,
    };
  }
}

/// @nodoc
class StopCanaryResponse {
  StopCanaryResponse();

  factory StopCanaryResponse.fromJson(Map<String, dynamic> _) {
    return StopCanaryResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UpdateCanaryResponse {
  UpdateCanaryResponse();

  factory UpdateCanaryResponse.fromJson(Map<String, dynamic> _) {
    return UpdateCanaryResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Use this structure to input your script code for the canary. This structure
/// contains the Lambda handler with the location where the canary should start
/// running the script. If the script is stored in an Amazon S3 bucket, the
/// bucket name, key, and version are also included. If the script was passed
/// into the canary directly, the script code is contained in the value of
/// <code>Zipfile</code>.
///
/// If you are uploading your canary scripts with an Amazon S3 bucket, your zip
/// file should include your script in a certain folder structure.
///
/// <ul>
/// <li>
/// For Node.js canaries, the folder structure must be
/// <code>nodejs/node_modules/<i>myCanaryFilename.js</i> </code> For more
/// information, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_WritingCanary_Nodejs.html#CloudWatch_Synthetics_Canaries_package">Packaging
/// your Node.js canary files</a>
/// </li>
/// <li>
/// For Python canaries, the folder structure must be
/// <code>python/<i>myCanaryFilename.py</i> </code> or
/// <code>python/<i>myFolder/myCanaryFilename.py</i> </code> For more
/// information, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_WritingCanary_Python.html#CloudWatch_Synthetics_Canaries_WritingCanary_Python_package">Packaging
/// your Python canary files</a>
/// </li>
/// </ul>
///
/// @nodoc
class CanaryCodeInput {
  /// <code>BlueprintTypes</code> is a list of templates that enable simplified
  /// canary creation. You can create canaries for common monitoring scenarios by
  /// providing only a JSON configuration file instead of writing custom scripts.
  /// The only supported value is <code>multi-checks</code>.
  ///
  /// Multi-checks monitors HTTP/DNS/SSL/TCP endpoints with built-in
  /// authentication schemes (Basic, API Key, OAuth, SigV4) and assertion
  /// capabilities. When you specify <code>BlueprintTypes</code>, the Handler
  /// field cannot be specified since the blueprint provides a pre-defined entry
  /// point.
  ///
  /// <code>BlueprintTypes</code> is supported only on canaries for syn-nodejs-3.0
  /// runtime or later.
  final List<String>? blueprintTypes;

  /// A list of dependencies that should be used for running this canary. Specify
  /// the dependencies as a key-value pair, where the key is the type of
  /// dependency and the value is the dependency reference.
  final List<Dependency>? dependencies;

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
  ///
  /// This field is required when you don't specify <code>BlueprintTypes</code>
  /// and is not allowed when you specify <code>BlueprintTypes</code>.
  final String? handler;

  /// If your canary script is located in Amazon S3, specify the bucket name here.
  /// Do not include <code>s3://</code> as the start of the bucket name.
  final String? s3Bucket;

  /// The Amazon S3 key of your script. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingObjects.html">Working
  /// with Amazon S3 Objects</a>.
  final String? s3Key;

  /// The Amazon S3 version ID of your script.
  final String? s3Version;

  /// If you input your canary script directly into the canary instead of
  /// referring to an Amazon S3 location, the value of this parameter is the
  /// base64-encoded contents of the .zip file that contains the script. It must
  /// be smaller than 225 Kb.
  ///
  /// For large canary scripts, we recommend that you use an Amazon S3 location
  /// instead of inputting it directly with this parameter.
  final Uint8List? zipFile;

  CanaryCodeInput({
    this.blueprintTypes,
    this.dependencies,
    this.handler,
    this.s3Bucket,
    this.s3Key,
    this.s3Version,
    this.zipFile,
  });

  Map<String, dynamic> toJson() {
    final blueprintTypes = this.blueprintTypes;
    final dependencies = this.dependencies;
    final handler = this.handler;
    final s3Bucket = this.s3Bucket;
    final s3Key = this.s3Key;
    final s3Version = this.s3Version;
    final zipFile = this.zipFile;
    return {
      if (blueprintTypes != null) 'BlueprintTypes': blueprintTypes,
      if (dependencies != null) 'Dependencies': dependencies,
      if (handler != null) 'Handler': handler,
      if (s3Bucket != null) 'S3Bucket': s3Bucket,
      if (s3Key != null) 'S3Key': s3Key,
      if (s3Version != null) 'S3Version': s3Version,
      if (zipFile != null) 'ZipFile': base64Encode(zipFile),
    };
  }
}

/// This structure specifies how often a canary is to make runs and the date and
/// time when it should stop making runs.
///
/// @nodoc
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

  /// A structure that contains the retry configuration for a canary
  final RetryConfigInput? retryConfig;

  CanaryScheduleInput({
    required this.expression,
    this.durationInSeconds,
    this.retryConfig,
  });

  Map<String, dynamic> toJson() {
    final expression = this.expression;
    final durationInSeconds = this.durationInSeconds;
    final retryConfig = this.retryConfig;
    return {
      'Expression': expression,
      if (durationInSeconds != null) 'DurationInSeconds': durationInSeconds,
      if (retryConfig != null) 'RetryConfig': retryConfig,
    };
  }
}

/// A structure that contains input information for a canary run.
///
/// @nodoc
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
  /// Environment variable keys and values are encrypted at rest using Amazon Web
  /// Services owned KMS keys. However, the environment variables are not
  /// encrypted on the client side. Do not store sensitive information in them.
  /// </important>
  final Map<String, String>? environmentVariables;

  /// Specifies the amount of ephemeral storage (in MB) to allocate for the canary
  /// run during execution. This temporary storage is used for storing canary run
  /// artifacts (which are uploaded to an Amazon S3 bucket at the end of the run),
  /// and any canary browser operations. This temporary storage is cleared after
  /// the run is completed. Default storage value is 1024 MB.
  final int? ephemeralStorage;

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
    this.ephemeralStorage,
    this.memoryInMB,
    this.timeoutInSeconds,
  });

  Map<String, dynamic> toJson() {
    final activeTracing = this.activeTracing;
    final environmentVariables = this.environmentVariables;
    final ephemeralStorage = this.ephemeralStorage;
    final memoryInMB = this.memoryInMB;
    final timeoutInSeconds = this.timeoutInSeconds;
    return {
      if (activeTracing != null) 'ActiveTracing': activeTracing,
      if (environmentVariables != null)
        'EnvironmentVariables': environmentVariables,
      if (ephemeralStorage != null) 'EphemeralStorage': ephemeralStorage,
      if (memoryInMB != null) 'MemoryInMB': memoryInMB,
      if (timeoutInSeconds != null) 'TimeoutInSeconds': timeoutInSeconds,
    };
  }
}

/// If this canary is to test an endpoint in a VPC, this structure contains
/// information about the subnets and security groups of the VPC endpoint. For
/// more information, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_VPC.html">
/// Running a Canary in a VPC</a>.
///
/// @nodoc
class VpcConfigInput {
  /// Set this to <code>true</code> to allow outbound IPv6 traffic on VPC canaries
  /// that are connected to dual-stack subnets. The default is <code>false</code>
  final bool? ipv6AllowedForDualStack;

  /// The IDs of the security groups for this canary.
  final List<String>? securityGroupIds;

  /// The IDs of the subnets where this canary is to run.
  final List<String>? subnetIds;

  VpcConfigInput({
    this.ipv6AllowedForDualStack,
    this.securityGroupIds,
    this.subnetIds,
  });

  Map<String, dynamic> toJson() {
    final ipv6AllowedForDualStack = this.ipv6AllowedForDualStack;
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    return {
      if (ipv6AllowedForDualStack != null)
        'Ipv6AllowedForDualStack': ipv6AllowedForDualStack,
      if (securityGroupIds != null) 'SecurityGroupIds': securityGroupIds,
      if (subnetIds != null) 'SubnetIds': subnetIds,
    };
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
///
/// @nodoc
class VisualReferenceInput {
  /// Specifies which canary run to use the screenshots from as the baseline for
  /// future visual monitoring with this canary. Valid values are
  /// <code>nextrun</code> to use the screenshots from the next run after this
  /// update is made, <code>lastrun</code> to use the screenshots from the most
  /// recent run before this update was made, or the value of <code>Id</code> in
  /// the <a
  /// href="https://docs.aws.amazon.com/AmazonSynthetics/latest/APIReference/API_CanaryRun.html">
  /// CanaryRun</a> from a run of this a canary in the past 31 days. If you
  /// specify the <code>Id</code> of a canary run older than 31 days, the
  /// operation returns a 400 validation exception error..
  final String baseCanaryRunId;

  /// An array of screenshots that will be used as the baseline for visual
  /// monitoring in future runs of this canary. If there is a screenshot that you
  /// don't want to be used for visual monitoring, remove it from this array.
  final List<BaseScreenshot>? baseScreenshots;

  /// The browser type associated with this visual reference.
  final BrowserType? browserType;

  VisualReferenceInput({
    required this.baseCanaryRunId,
    this.baseScreenshots,
    this.browserType,
  });

  Map<String, dynamic> toJson() {
    final baseCanaryRunId = this.baseCanaryRunId;
    final baseScreenshots = this.baseScreenshots;
    final browserType = this.browserType;
    return {
      'BaseCanaryRunId': baseCanaryRunId,
      if (baseScreenshots != null) 'BaseScreenshots': baseScreenshots,
      if (browserType != null) 'BrowserType': browserType.value,
    };
  }
}

/// A structure that contains the configuration for canary artifacts, including
/// the encryption-at-rest settings for artifacts that the canary uploads to
/// Amazon S3.
///
/// @nodoc
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

/// @nodoc
class ProvisionedResourceCleanupSetting {
  static const automatic = ProvisionedResourceCleanupSetting._('AUTOMATIC');
  static const off = ProvisionedResourceCleanupSetting._('OFF');

  final String value;

  const ProvisionedResourceCleanupSetting._(this.value);

  static const values = [automatic, off];

  static ProvisionedResourceCleanupSetting fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ProvisionedResourceCleanupSetting._(value));

  @override
  bool operator ==(other) =>
      other is ProvisionedResourceCleanupSetting && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A structure that specifies the browser type to use for a canary run.
///
/// @nodoc
class BrowserConfig {
  /// The browser type associated with this browser configuration.
  final BrowserType? browserType;

  BrowserConfig({
    this.browserType,
  });

  factory BrowserConfig.fromJson(Map<String, dynamic> json) {
    return BrowserConfig(
      browserType:
          (json['BrowserType'] as String?)?.let(BrowserType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final browserType = this.browserType;
    return {
      if (browserType != null) 'BrowserType': browserType.value,
    };
  }
}

/// @nodoc
class BrowserType {
  static const chrome = BrowserType._('CHROME');
  static const firefox = BrowserType._('FIREFOX');

  final String value;

  const BrowserType._(this.value);

  static const values = [chrome, firefox];

  static BrowserType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => BrowserType._(value));

  @override
  bool operator ==(other) => other is BrowserType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A structure that contains the configuration of encryption-at-rest settings
/// for canary artifacts that the canary uploads to Amazon S3.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_artifact_encryption.html">Encrypting
/// canary artifacts</a>
///
/// @nodoc
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
      encryptionMode:
          (json['EncryptionMode'] as String?)?.let(EncryptionMode.fromString),
      kmsKeyArn: json['KmsKeyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionMode = this.encryptionMode;
    final kmsKeyArn = this.kmsKeyArn;
    return {
      if (encryptionMode != null) 'EncryptionMode': encryptionMode.value,
      if (kmsKeyArn != null) 'KmsKeyArn': kmsKeyArn,
    };
  }
}

/// @nodoc
class EncryptionMode {
  static const sseS3 = EncryptionMode._('SSE_S3');
  static const sseKms = EncryptionMode._('SSE_KMS');

  final String value;

  const EncryptionMode._(this.value);

  static const values = [sseS3, sseKms];

  static EncryptionMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EncryptionMode._(value));

  @override
  bool operator ==(other) => other is EncryptionMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A structure representing a screenshot that is used as a baseline during
/// visual monitoring comparisons made by the canary.
///
/// @nodoc
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
      screenshotName: (json['ScreenshotName'] as String?) ?? '',
      ignoreCoordinates: (json['IgnoreCoordinates'] as List?)
          ?.nonNulls
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

/// This structure contains information about the canary's retry configuration.
/// <note>
/// The default account level concurrent execution limit from Lambda is 1000.
/// When you have more than 1000 canaries, it's possible there are more than
/// 1000 Lambda invocations due to retries and the console might hang. For more
/// information on the Lambda execution limit, see <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-concurrency.html#:~:text=As%20your%20functions%20receive%20more,functions%20in%20an%20AWS%20Region">Understanding
/// Lambda function scaling</a>.
/// </note> <note>
/// For canary with <code>MaxRetries = 2</code>, you need to set the
/// <code>CanaryRunConfigInput.TimeoutInSeconds</code> to less than 600 seconds
/// to avoid validation errors.
/// </note>
///
/// @nodoc
class RetryConfigInput {
  /// The maximum number of retries. The value must be less than or equal to 2.
  final int maxRetries;

  RetryConfigInput({
    required this.maxRetries,
  });

  Map<String, dynamic> toJson() {
    final maxRetries = this.maxRetries;
    return {
      'MaxRetries': maxRetries,
    };
  }
}

/// A structure that contains information about a dependency for a canary.
///
/// @nodoc
class Dependency {
  /// The dependency reference. For Lambda layers, this is the ARN of the Lambda
  /// layer. For more information about Lambda ARN format, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/api/API_Layer.html">Lambda</a>.
  final String reference;

  /// The type of dependency. Valid value is <code>LambdaLayer</code>.
  final DependencyType? type;

  Dependency({
    required this.reference,
    this.type,
  });

  factory Dependency.fromJson(Map<String, dynamic> json) {
    return Dependency(
      reference: (json['Reference'] as String?) ?? '',
      type: (json['Type'] as String?)?.let(DependencyType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final reference = this.reference;
    final type = this.type;
    return {
      'Reference': reference,
      if (type != null) 'Type': type.value,
    };
  }
}

/// @nodoc
class DependencyType {
  static const lambdaLayer = DependencyType._('LambdaLayer');

  final String value;

  const DependencyType._(this.value);

  static const values = [lambdaLayer];

  static DependencyType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DependencyType._(value));

  @override
  bool operator ==(other) => other is DependencyType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Returns the dry run configurations set for a canary.
///
/// @nodoc
class DryRunConfigOutput {
  /// The DryRunId associated with an existing canary’s dry run. You can use this
  /// DryRunId to retrieve information about the dry run.
  final String? dryRunId;

  /// Returns the last execution status for a canary's dry run.
  final String? lastDryRunExecutionStatus;

  DryRunConfigOutput({
    this.dryRunId,
    this.lastDryRunExecutionStatus,
  });

  factory DryRunConfigOutput.fromJson(Map<String, dynamic> json) {
    return DryRunConfigOutput(
      dryRunId: json['DryRunId'] as String?,
      lastDryRunExecutionStatus: json['LastDryRunExecutionStatus'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dryRunId = this.dryRunId;
    final lastDryRunExecutionStatus = this.lastDryRunExecutionStatus;
    return {
      if (dryRunId != null) 'DryRunId': dryRunId,
      if (lastDryRunExecutionStatus != null)
        'LastDryRunExecutionStatus': lastDryRunExecutionStatus,
    };
  }
}

/// A structure containing some information about a group.
///
/// @nodoc
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

/// This structure contains information about one group.
///
/// @nodoc
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

/// This structure contains the details about one run of one canary.
///
/// @nodoc
class CanaryRun {
  /// The location where the canary stored artifacts from the run. Artifacts
  /// include the log file, screenshots, and HAR files.
  final String? artifactS3Location;

  /// The browser type associated with this canary run.
  final BrowserType? browserType;

  /// Returns the dry run configurations for a canary.
  final CanaryDryRunConfigOutput? dryRunConfig;

  /// A unique ID that identifies this canary run.
  final String? id;

  /// The name of the canary.
  final String? name;

  /// The count in number of the retry attempt.
  final int? retryAttempt;

  /// The ID of the scheduled canary run.
  final String? scheduledRunId;

  /// The status of this run.
  final CanaryRunStatus? status;

  /// A structure that contains the start and end times of this run.
  final CanaryRunTimeline? timeline;

  CanaryRun({
    this.artifactS3Location,
    this.browserType,
    this.dryRunConfig,
    this.id,
    this.name,
    this.retryAttempt,
    this.scheduledRunId,
    this.status,
    this.timeline,
  });

  factory CanaryRun.fromJson(Map<String, dynamic> json) {
    return CanaryRun(
      artifactS3Location: json['ArtifactS3Location'] as String?,
      browserType:
          (json['BrowserType'] as String?)?.let(BrowserType.fromString),
      dryRunConfig: json['DryRunConfig'] != null
          ? CanaryDryRunConfigOutput.fromJson(
              json['DryRunConfig'] as Map<String, dynamic>)
          : null,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      retryAttempt: json['RetryAttempt'] as int?,
      scheduledRunId: json['ScheduledRunId'] as String?,
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
    final browserType = this.browserType;
    final dryRunConfig = this.dryRunConfig;
    final id = this.id;
    final name = this.name;
    final retryAttempt = this.retryAttempt;
    final scheduledRunId = this.scheduledRunId;
    final status = this.status;
    final timeline = this.timeline;
    return {
      if (artifactS3Location != null) 'ArtifactS3Location': artifactS3Location,
      if (browserType != null) 'BrowserType': browserType.value,
      if (dryRunConfig != null) 'DryRunConfig': dryRunConfig,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (retryAttempt != null) 'RetryAttempt': retryAttempt,
      if (scheduledRunId != null) 'ScheduledRunId': scheduledRunId,
      if (status != null) 'Status': status,
      if (timeline != null) 'Timeline': timeline,
    };
  }
}

/// This structure contains the status information about a canary run.
///
/// @nodoc
class CanaryRunStatus {
  /// The current state of the run.
  final CanaryRunState? state;

  /// If run of the canary failed, this field contains the reason for the error.
  final String? stateReason;

  /// If this value is <code>CANARY_FAILURE</code>, either the canary script
  /// failed or Synthetics ran into a fatal error when running the canary. For
  /// example, a canary timeout misconfiguration setting can cause the canary to
  /// timeout before Synthetics can evaluate its status.
  ///
  /// If this value is <code>EXECUTION_FAILURE</code>, a non-critical failure
  /// occurred such as failing to save generated debug artifacts (for example,
  /// screenshots or har files).
  ///
  /// If both types of failures occurred, the <code>CANARY_FAILURE</code> takes
  /// precedence. To understand the exact error, use the <a
  /// href="https://docs.aws.amazon.com/AmazonSynthetics/latest/APIReference/API_CanaryRunStatus.html">StateReason</a>
  /// API.
  final CanaryRunStateReasonCode? stateReasonCode;

  /// Specifies the status of canary script for this run. When Synthetics tries to
  /// determine the status but fails, the result is marked as
  /// <code>UNKNOWN</code>. For the overall status of canary run, see <a
  /// href="https://docs.aws.amazon.com/AmazonSynthetics/latest/APIReference/API_CanaryRunStatus.html">State</a>.
  final CanaryRunTestResult? testResult;

  CanaryRunStatus({
    this.state,
    this.stateReason,
    this.stateReasonCode,
    this.testResult,
  });

  factory CanaryRunStatus.fromJson(Map<String, dynamic> json) {
    return CanaryRunStatus(
      state: (json['State'] as String?)?.let(CanaryRunState.fromString),
      stateReason: json['StateReason'] as String?,
      stateReasonCode: (json['StateReasonCode'] as String?)
          ?.let(CanaryRunStateReasonCode.fromString),
      testResult:
          (json['TestResult'] as String?)?.let(CanaryRunTestResult.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    final stateReason = this.stateReason;
    final stateReasonCode = this.stateReasonCode;
    final testResult = this.testResult;
    return {
      if (state != null) 'State': state.value,
      if (stateReason != null) 'StateReason': stateReason,
      if (stateReasonCode != null) 'StateReasonCode': stateReasonCode.value,
      if (testResult != null) 'TestResult': testResult.value,
    };
  }
}

/// This structure contains the start and end times of a single canary run.
///
/// @nodoc
class CanaryRunTimeline {
  /// The end time of the run.
  final DateTime? completed;

  /// The time at which the metrics will be generated for this run or retries.
  final DateTime? metricTimestampForRunAndRetries;

  /// The start time of the run.
  final DateTime? started;

  CanaryRunTimeline({
    this.completed,
    this.metricTimestampForRunAndRetries,
    this.started,
  });

  factory CanaryRunTimeline.fromJson(Map<String, dynamic> json) {
    return CanaryRunTimeline(
      completed: timeStampFromJson(json['Completed']),
      metricTimestampForRunAndRetries:
          timeStampFromJson(json['MetricTimestampForRunAndRetries']),
      started: timeStampFromJson(json['Started']),
    );
  }

  Map<String, dynamic> toJson() {
    final completed = this.completed;
    final metricTimestampForRunAndRetries =
        this.metricTimestampForRunAndRetries;
    final started = this.started;
    return {
      if (completed != null) 'Completed': unixTimestampToJson(completed),
      if (metricTimestampForRunAndRetries != null)
        'MetricTimestampForRunAndRetries':
            unixTimestampToJson(metricTimestampForRunAndRetries),
      if (started != null) 'Started': unixTimestampToJson(started),
    };
  }
}

/// Returns the dry run configurations set for a canary.
///
/// @nodoc
class CanaryDryRunConfigOutput {
  /// The DryRunId associated with an existing canary’s dry run. You can use this
  /// DryRunId to retrieve information about the dry run.
  final String? dryRunId;

  CanaryDryRunConfigOutput({
    this.dryRunId,
  });

  factory CanaryDryRunConfigOutput.fromJson(Map<String, dynamic> json) {
    return CanaryDryRunConfigOutput(
      dryRunId: json['DryRunId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dryRunId = this.dryRunId;
    return {
      if (dryRunId != null) 'DryRunId': dryRunId,
    };
  }
}

/// @nodoc
class CanaryRunState {
  static const running = CanaryRunState._('RUNNING');
  static const passed = CanaryRunState._('PASSED');
  static const failed = CanaryRunState._('FAILED');

  final String value;

  const CanaryRunState._(this.value);

  static const values = [running, passed, failed];

  static CanaryRunState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CanaryRunState._(value));

  @override
  bool operator ==(other) => other is CanaryRunState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class CanaryRunStateReasonCode {
  static const canaryFailure = CanaryRunStateReasonCode._('CANARY_FAILURE');
  static const executionFailure =
      CanaryRunStateReasonCode._('EXECUTION_FAILURE');

  final String value;

  const CanaryRunStateReasonCode._(this.value);

  static const values = [canaryFailure, executionFailure];

  static CanaryRunStateReasonCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CanaryRunStateReasonCode._(value));

  @override
  bool operator ==(other) =>
      other is CanaryRunStateReasonCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class CanaryRunTestResult {
  static const passed = CanaryRunTestResult._('PASSED');
  static const failed = CanaryRunTestResult._('FAILED');
  static const unknown = CanaryRunTestResult._('UNKNOWN');

  final String value;

  const CanaryRunTestResult._(this.value);

  static const values = [passed, failed, unknown];

  static CanaryRunTestResult fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CanaryRunTestResult._(value));

  @override
  bool operator ==(other) =>
      other is CanaryRunTestResult && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RunType {
  static const canaryRun = RunType._('CANARY_RUN');
  static const dryRun = RunType._('DRY_RUN');

  final String value;

  const RunType._(this.value);

  static const values = [canaryRun, dryRun];

  static RunType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => RunType._(value));

  @override
  bool operator ==(other) => other is RunType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// This structure contains all information about one canary in your account.
///
/// @nodoc
class Canary {
  /// A structure that contains the configuration for canary artifacts, including
  /// the encryption-at-rest settings for artifacts that the canary uploads to
  /// Amazon S3.
  final ArtifactConfigOutput? artifactConfig;

  /// The location in Amazon S3 where Synthetics stores artifacts from the runs of
  /// this canary. Artifacts include the log file, screenshots, and HAR files.
  final String? artifactS3Location;

  /// A structure that specifies the browser type to use for a canary run.
  /// CloudWatch Synthetics supports running canaries on both <code>CHROME</code>
  /// and <code>FIREFOX</code> browsers.
  /// <note>
  /// If not specified, <code>browserConfigs</code> defaults to Chrome.
  /// </note>
  final List<BrowserConfig>? browserConfigs;
  final CanaryCodeOutput? code;

  /// Returns the dry run configurations for a canary.
  final DryRunConfigOutput? dryRunConfig;

  /// The ARN of the Lambda function that is used as your canary's engine. For
  /// more information about Lambda ARN format, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-api-permissions-ref.html">Resources
  /// and Conditions for Lambda Actions</a>.
  final String? engineArn;

  /// A list of engine configurations for the canary, one for each browser type
  /// that the canary is configured to run on.
  ///
  /// All runtime versions <code>syn-nodejs-puppeteer-11.0</code> and above, and
  /// <code>syn-nodejs-playwright-3.0</code> and above, use
  /// <code>engineConfigs</code> only. You can no longer use
  /// <code>engineArn</code> in these versions.
  ///
  /// Runtime versions older than <code>syn-nodejs-puppeteer-11.0</code> and
  /// <code>syn-nodejs-playwright-3.0</code> continue to support
  /// <code>engineArn</code> to ensure backward compatibility.
  final List<EngineConfig>? engineConfigs;

  /// The ARN of the IAM role used to run the canary. This role must include
  /// <code>lambda.amazonaws.com</code> as a principal in the trust policy.
  final String? executionRoleArn;

  /// The number of days to retain data about failed runs of this canary.
  ///
  /// This setting affects the range of information returned by <a
  /// href="https://docs.aws.amazon.com/AmazonSynthetics/latest/APIReference/API_GetCanaryRuns.html">GetCanaryRuns</a>,
  /// as well as the range of information displayed in the Synthetics console.
  final int? failureRetentionPeriodInDays;

  /// The unique ID of this canary.
  final String? id;

  /// The name of the canary.
  final String? name;

  /// Specifies whether to also delete the Lambda functions and layers used by
  /// this canary when the canary is deleted. If it is <code>AUTOMATIC</code>, the
  /// Lambda functions and layers will be deleted when the canary is deleted.
  ///
  /// If the value of this parameter is <code>OFF</code>, then the value of the
  /// <code>DeleteLambda</code> parameter of the <a
  /// href="https://docs.aws.amazon.com/AmazonSynthetics/latest/APIReference/API_DeleteCanary.html">DeleteCanary</a>
  /// operation determines whether the Lambda functions and layers will be
  /// deleted.
  final ProvisionedResourceCleanupSetting? provisionedResourceCleanup;
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
  ///
  /// This setting affects the range of information returned by <a
  /// href="https://docs.aws.amazon.com/AmazonSynthetics/latest/APIReference/API_GetCanaryRuns.html">GetCanaryRuns</a>,
  /// as well as the range of information displayed in the Synthetics console.
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

  /// A list of visual reference configurations for the canary, one for each
  /// browser type that the canary is configured to run on. Visual references are
  /// used for visual monitoring comparisons.
  ///
  /// <code>syn-nodejs-puppeteer-11.0</code> and above, and
  /// <code>syn-nodejs-playwright-3.0</code> and above, only supports
  /// <code>visualReferences</code>. <code>visualReference</code> field is not
  /// supported.
  ///
  /// Versions older than <code>syn-nodejs-puppeteer-11.0</code> supports both
  /// <code>visualReference</code> and <code>visualReferences</code> for backward
  /// compatibility. It is recommended to use <code>visualReferences</code> for
  /// consistency and future compatibility.
  final List<VisualReferenceOutput>? visualReferences;
  final VpcConfigOutput? vpcConfig;

  Canary({
    this.artifactConfig,
    this.artifactS3Location,
    this.browserConfigs,
    this.code,
    this.dryRunConfig,
    this.engineArn,
    this.engineConfigs,
    this.executionRoleArn,
    this.failureRetentionPeriodInDays,
    this.id,
    this.name,
    this.provisionedResourceCleanup,
    this.runConfig,
    this.runtimeVersion,
    this.schedule,
    this.status,
    this.successRetentionPeriodInDays,
    this.tags,
    this.timeline,
    this.visualReference,
    this.visualReferences,
    this.vpcConfig,
  });

  factory Canary.fromJson(Map<String, dynamic> json) {
    return Canary(
      artifactConfig: json['ArtifactConfig'] != null
          ? ArtifactConfigOutput.fromJson(
              json['ArtifactConfig'] as Map<String, dynamic>)
          : null,
      artifactS3Location: json['ArtifactS3Location'] as String?,
      browserConfigs: (json['BrowserConfigs'] as List?)
          ?.nonNulls
          .map((e) => BrowserConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      code: json['Code'] != null
          ? CanaryCodeOutput.fromJson(json['Code'] as Map<String, dynamic>)
          : null,
      dryRunConfig: json['DryRunConfig'] != null
          ? DryRunConfigOutput.fromJson(
              json['DryRunConfig'] as Map<String, dynamic>)
          : null,
      engineArn: json['EngineArn'] as String?,
      engineConfigs: (json['EngineConfigs'] as List?)
          ?.nonNulls
          .map((e) => EngineConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      executionRoleArn: json['ExecutionRoleArn'] as String?,
      failureRetentionPeriodInDays:
          json['FailureRetentionPeriodInDays'] as int?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      provisionedResourceCleanup:
          (json['ProvisionedResourceCleanup'] as String?)
              ?.let(ProvisionedResourceCleanupSetting.fromString),
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
      visualReferences: (json['VisualReferences'] as List?)
          ?.nonNulls
          .map((e) => VisualReferenceOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
      vpcConfig: json['VpcConfig'] != null
          ? VpcConfigOutput.fromJson(json['VpcConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final artifactConfig = this.artifactConfig;
    final artifactS3Location = this.artifactS3Location;
    final browserConfigs = this.browserConfigs;
    final code = this.code;
    final dryRunConfig = this.dryRunConfig;
    final engineArn = this.engineArn;
    final engineConfigs = this.engineConfigs;
    final executionRoleArn = this.executionRoleArn;
    final failureRetentionPeriodInDays = this.failureRetentionPeriodInDays;
    final id = this.id;
    final name = this.name;
    final provisionedResourceCleanup = this.provisionedResourceCleanup;
    final runConfig = this.runConfig;
    final runtimeVersion = this.runtimeVersion;
    final schedule = this.schedule;
    final status = this.status;
    final successRetentionPeriodInDays = this.successRetentionPeriodInDays;
    final tags = this.tags;
    final timeline = this.timeline;
    final visualReference = this.visualReference;
    final visualReferences = this.visualReferences;
    final vpcConfig = this.vpcConfig;
    return {
      if (artifactConfig != null) 'ArtifactConfig': artifactConfig,
      if (artifactS3Location != null) 'ArtifactS3Location': artifactS3Location,
      if (browserConfigs != null) 'BrowserConfigs': browserConfigs,
      if (code != null) 'Code': code,
      if (dryRunConfig != null) 'DryRunConfig': dryRunConfig,
      if (engineArn != null) 'EngineArn': engineArn,
      if (engineConfigs != null) 'EngineConfigs': engineConfigs,
      if (executionRoleArn != null) 'ExecutionRoleArn': executionRoleArn,
      if (failureRetentionPeriodInDays != null)
        'FailureRetentionPeriodInDays': failureRetentionPeriodInDays,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (provisionedResourceCleanup != null)
        'ProvisionedResourceCleanup': provisionedResourceCleanup.value,
      if (runConfig != null) 'RunConfig': runConfig,
      if (runtimeVersion != null) 'RuntimeVersion': runtimeVersion,
      if (schedule != null) 'Schedule': schedule,
      if (status != null) 'Status': status,
      if (successRetentionPeriodInDays != null)
        'SuccessRetentionPeriodInDays': successRetentionPeriodInDays,
      if (tags != null) 'Tags': tags,
      if (timeline != null) 'Timeline': timeline,
      if (visualReference != null) 'VisualReference': visualReference,
      if (visualReferences != null) 'VisualReferences': visualReferences,
      if (vpcConfig != null) 'VpcConfig': vpcConfig,
    };
  }
}

/// This structure contains information about the canary's Lambda handler and
/// where its code is stored by CloudWatch Synthetics.
///
/// @nodoc
class CanaryCodeOutput {
  /// <code>BlueprintTypes</code> is a list of templates that enable simplified
  /// canary creation. You can create canaries for common monitoring scenarios by
  /// providing only a JSON configuration file instead of writing custom scripts.
  /// The only supported value is <code>multi-checks</code>.
  ///
  /// Multi-checks monitors HTTP/DNS/SSL/TCP endpoints with built-in
  /// authentication schemes (Basic, API Key, OAuth, SigV4) and assertion
  /// capabilities. When you specify <code>BlueprintTypes</code>, the Handler
  /// field cannot be specified since the blueprint provides a pre-defined entry
  /// point.
  ///
  /// <code>BlueprintTypes</code> is supported only on canaries for syn-nodejs-3.0
  /// runtime or later.
  final List<String>? blueprintTypes;

  /// A list of dependencies that are used for running this canary. The
  /// dependencies are specified as a key-value pair, where the key is the type of
  /// dependency and the value is the dependency reference.
  final List<Dependency>? dependencies;

  /// The entry point to use for the source code when running the canary.
  ///
  /// This field is required when you don't specify <code>BlueprintTypes</code>
  /// and is not allowed when you specify <code>BlueprintTypes</code>.
  final String? handler;

  /// The ARN of the Lambda layer where Synthetics stores the canary script code.
  final String? sourceLocationArn;

  CanaryCodeOutput({
    this.blueprintTypes,
    this.dependencies,
    this.handler,
    this.sourceLocationArn,
  });

  factory CanaryCodeOutput.fromJson(Map<String, dynamic> json) {
    return CanaryCodeOutput(
      blueprintTypes: (json['BlueprintTypes'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      dependencies: (json['Dependencies'] as List?)
          ?.nonNulls
          .map((e) => Dependency.fromJson(e as Map<String, dynamic>))
          .toList(),
      handler: json['Handler'] as String?,
      sourceLocationArn: json['SourceLocationArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final blueprintTypes = this.blueprintTypes;
    final dependencies = this.dependencies;
    final handler = this.handler;
    final sourceLocationArn = this.sourceLocationArn;
    return {
      if (blueprintTypes != null) 'BlueprintTypes': blueprintTypes,
      if (dependencies != null) 'Dependencies': dependencies,
      if (handler != null) 'Handler': handler,
      if (sourceLocationArn != null) 'SourceLocationArn': sourceLocationArn,
    };
  }
}

/// How long, in seconds, for the canary to continue making regular runs
/// according to the schedule in the <code>Expression</code> value.
///
/// @nodoc
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

  /// A structure that contains the retry configuration for a canary
  final RetryConfigOutput? retryConfig;

  CanaryScheduleOutput({
    this.durationInSeconds,
    this.expression,
    this.retryConfig,
  });

  factory CanaryScheduleOutput.fromJson(Map<String, dynamic> json) {
    return CanaryScheduleOutput(
      durationInSeconds: json['DurationInSeconds'] as int?,
      expression: json['Expression'] as String?,
      retryConfig: json['RetryConfig'] != null
          ? RetryConfigOutput.fromJson(
              json['RetryConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final durationInSeconds = this.durationInSeconds;
    final expression = this.expression;
    final retryConfig = this.retryConfig;
    return {
      if (durationInSeconds != null) 'DurationInSeconds': durationInSeconds,
      if (expression != null) 'Expression': expression,
      if (retryConfig != null) 'RetryConfig': retryConfig,
    };
  }
}

/// A structure that contains information about a canary run.
///
/// @nodoc
class CanaryRunConfigOutput {
  /// Displays whether this canary run used active X-Ray tracing.
  final bool? activeTracing;

  /// Specifies the amount of ephemeral storage (in MB) to allocate for the canary
  /// run during execution. This temporary storage is used for storing canary run
  /// artifacts (which are uploaded to an Amazon S3 bucket at the end of the run),
  /// and any canary browser operations. This temporary storage is cleared after
  /// the run is completed. Default storage value is 1024 MB.
  final int? ephemeralStorage;

  /// The maximum amount of memory available to the canary while it is running, in
  /// MB. This value must be a multiple of 64.
  final int? memoryInMB;

  /// How long the canary is allowed to run before it must stop.
  final int? timeoutInSeconds;

  CanaryRunConfigOutput({
    this.activeTracing,
    this.ephemeralStorage,
    this.memoryInMB,
    this.timeoutInSeconds,
  });

  factory CanaryRunConfigOutput.fromJson(Map<String, dynamic> json) {
    return CanaryRunConfigOutput(
      activeTracing: json['ActiveTracing'] as bool?,
      ephemeralStorage: json['EphemeralStorage'] as int?,
      memoryInMB: json['MemoryInMB'] as int?,
      timeoutInSeconds: json['TimeoutInSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final activeTracing = this.activeTracing;
    final ephemeralStorage = this.ephemeralStorage;
    final memoryInMB = this.memoryInMB;
    final timeoutInSeconds = this.timeoutInSeconds;
    return {
      if (activeTracing != null) 'ActiveTracing': activeTracing,
      if (ephemeralStorage != null) 'EphemeralStorage': ephemeralStorage,
      if (memoryInMB != null) 'MemoryInMB': memoryInMB,
      if (timeoutInSeconds != null) 'TimeoutInSeconds': timeoutInSeconds,
    };
  }
}

/// A structure that contains the current state of the canary.
///
/// @nodoc
class CanaryStatus {
  /// The current state of the canary.
  final CanaryState? state;

  /// If the canary creation or update failed, this field provides details on the
  /// failure.
  final String? stateReason;

  /// If the canary creation or update failed, this field displays the reason
  /// code.
  final CanaryStateReasonCode? stateReasonCode;

  CanaryStatus({
    this.state,
    this.stateReason,
    this.stateReasonCode,
  });

  factory CanaryStatus.fromJson(Map<String, dynamic> json) {
    return CanaryStatus(
      state: (json['State'] as String?)?.let(CanaryState.fromString),
      stateReason: json['StateReason'] as String?,
      stateReasonCode: (json['StateReasonCode'] as String?)
          ?.let(CanaryStateReasonCode.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    final stateReason = this.stateReason;
    final stateReasonCode = this.stateReasonCode;
    return {
      if (state != null) 'State': state.value,
      if (stateReason != null) 'StateReason': stateReason,
      if (stateReasonCode != null) 'StateReasonCode': stateReasonCode.value,
    };
  }
}

/// This structure contains information about when the canary was created and
/// modified.
///
/// @nodoc
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

/// If this canary is to test an endpoint in a VPC, this structure contains
/// information about the subnets and security groups of the VPC endpoint. For
/// more information, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_VPC.html">
/// Running a Canary in a VPC</a>.
///
/// @nodoc
class VpcConfigOutput {
  /// Indicates whether this canary allows outbound IPv6 traffic if it is
  /// connected to dual-stack subnets.
  final bool? ipv6AllowedForDualStack;

  /// The IDs of the security groups for this canary.
  final List<String>? securityGroupIds;

  /// The IDs of the subnets where this canary is to run.
  final List<String>? subnetIds;

  /// The IDs of the VPC where this canary is to run.
  final String? vpcId;

  VpcConfigOutput({
    this.ipv6AllowedForDualStack,
    this.securityGroupIds,
    this.subnetIds,
    this.vpcId,
  });

  factory VpcConfigOutput.fromJson(Map<String, dynamic> json) {
    return VpcConfigOutput(
      ipv6AllowedForDualStack: json['Ipv6AllowedForDualStack'] as bool?,
      securityGroupIds: (json['SecurityGroupIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      subnetIds: (json['SubnetIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ipv6AllowedForDualStack = this.ipv6AllowedForDualStack;
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    final vpcId = this.vpcId;
    return {
      if (ipv6AllowedForDualStack != null)
        'Ipv6AllowedForDualStack': ipv6AllowedForDualStack,
      if (securityGroupIds != null) 'SecurityGroupIds': securityGroupIds,
      if (subnetIds != null) 'SubnetIds': subnetIds,
      if (vpcId != null) 'VpcId': vpcId,
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
///
/// @nodoc
class VisualReferenceOutput {
  /// The ID of the canary run that produced the baseline screenshots that are
  /// used for visual monitoring comparisons by this canary.
  final String? baseCanaryRunId;

  /// An array of screenshots that are used as the baseline for comparisons during
  /// visual monitoring.
  final List<BaseScreenshot>? baseScreenshots;

  /// The browser type associated with this visual reference.
  final BrowserType? browserType;

  VisualReferenceOutput({
    this.baseCanaryRunId,
    this.baseScreenshots,
    this.browserType,
  });

  factory VisualReferenceOutput.fromJson(Map<String, dynamic> json) {
    return VisualReferenceOutput(
      baseCanaryRunId: json['BaseCanaryRunId'] as String?,
      baseScreenshots: (json['BaseScreenshots'] as List?)
          ?.nonNulls
          .map((e) => BaseScreenshot.fromJson(e as Map<String, dynamic>))
          .toList(),
      browserType:
          (json['BrowserType'] as String?)?.let(BrowserType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final baseCanaryRunId = this.baseCanaryRunId;
    final baseScreenshots = this.baseScreenshots;
    final browserType = this.browserType;
    return {
      if (baseCanaryRunId != null) 'BaseCanaryRunId': baseCanaryRunId,
      if (baseScreenshots != null) 'BaseScreenshots': baseScreenshots,
      if (browserType != null) 'BrowserType': browserType.value,
    };
  }
}

/// A structure that contains the configuration for canary artifacts, including
/// the encryption-at-rest settings for artifacts that the canary uploads to
/// Amazon S3.
///
/// @nodoc
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

/// A structure of engine configurations for the canary, one for each browser
/// type that the canary is configured to run on.
///
/// @nodoc
class EngineConfig {
  /// The browser type associated with this engine configuration.
  final BrowserType? browserType;

  /// Each engine configuration contains the ARN of the Lambda function that is
  /// used as the canary's engine for a specific browser type.
  final String? engineArn;

  EngineConfig({
    this.browserType,
    this.engineArn,
  });

  factory EngineConfig.fromJson(Map<String, dynamic> json) {
    return EngineConfig(
      browserType:
          (json['BrowserType'] as String?)?.let(BrowserType.fromString),
      engineArn: json['EngineArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final browserType = this.browserType;
    final engineArn = this.engineArn;
    return {
      if (browserType != null) 'BrowserType': browserType.value,
      if (engineArn != null) 'EngineArn': engineArn,
    };
  }
}

/// @nodoc
class CanaryState {
  static const creating = CanaryState._('CREATING');
  static const ready = CanaryState._('READY');
  static const starting = CanaryState._('STARTING');
  static const running = CanaryState._('RUNNING');
  static const updating = CanaryState._('UPDATING');
  static const stopping = CanaryState._('STOPPING');
  static const stopped = CanaryState._('STOPPED');
  static const error = CanaryState._('ERROR');
  static const deleting = CanaryState._('DELETING');

  final String value;

  const CanaryState._(this.value);

  static const values = [
    creating,
    ready,
    starting,
    running,
    updating,
    stopping,
    stopped,
    error,
    deleting
  ];

  static CanaryState fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => CanaryState._(value));

  @override
  bool operator ==(other) => other is CanaryState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class CanaryStateReasonCode {
  static const invalidPermissions =
      CanaryStateReasonCode._('INVALID_PERMISSIONS');
  static const createPending = CanaryStateReasonCode._('CREATE_PENDING');
  static const createInProgress = CanaryStateReasonCode._('CREATE_IN_PROGRESS');
  static const createFailed = CanaryStateReasonCode._('CREATE_FAILED');
  static const updatePending = CanaryStateReasonCode._('UPDATE_PENDING');
  static const updateInProgress = CanaryStateReasonCode._('UPDATE_IN_PROGRESS');
  static const updateComplete = CanaryStateReasonCode._('UPDATE_COMPLETE');
  static const rollbackComplete = CanaryStateReasonCode._('ROLLBACK_COMPLETE');
  static const rollbackFailed = CanaryStateReasonCode._('ROLLBACK_FAILED');
  static const deleteInProgress = CanaryStateReasonCode._('DELETE_IN_PROGRESS');
  static const deleteFailed = CanaryStateReasonCode._('DELETE_FAILED');
  static const syncDeleteInProgress =
      CanaryStateReasonCode._('SYNC_DELETE_IN_PROGRESS');

  final String value;

  const CanaryStateReasonCode._(this.value);

  static const values = [
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
    syncDeleteInProgress
  ];

  static CanaryStateReasonCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CanaryStateReasonCode._(value));

  @override
  bool operator ==(other) =>
      other is CanaryStateReasonCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// This structure contains information about the canary's retry configuration.
///
/// @nodoc
class RetryConfigOutput {
  /// The maximum number of retries. The value must be less than or equal to 2.
  final int? maxRetries;

  RetryConfigOutput({
    this.maxRetries,
  });

  factory RetryConfigOutput.fromJson(Map<String, dynamic> json) {
    return RetryConfigOutput(
      maxRetries: json['MaxRetries'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final maxRetries = this.maxRetries;
    return {
      if (maxRetries != null) 'MaxRetries': maxRetries,
    };
  }
}

/// This structure contains information about one canary runtime version. For
/// more information about runtime versions, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_Library.html">
/// Canary Runtime Versions</a>.
///
/// @nodoc
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

/// This structure contains information about the most recent run of a single
/// canary.
///
/// @nodoc
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

/// @nodoc
class ResourceToTag {
  static const lambdaFunction = ResourceToTag._('lambda-function');

  final String value;

  const ResourceToTag._(this.value);

  static const values = [lambdaFunction];

  static ResourceToTag fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ResourceToTag._(value));

  @override
  bool operator ==(other) => other is ResourceToTag && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

/// @nodoc
class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String? type, String? message})
      : super(type: type, code: 'BadRequestException', message: message);
}

/// @nodoc
class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

/// @nodoc
class InternalFailureException extends _s.GenericAwsException {
  InternalFailureException({String? type, String? message})
      : super(type: type, code: 'InternalFailureException', message: message);
}

/// @nodoc
class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

/// @nodoc
class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String? type, String? message})
      : super(type: type, code: 'NotFoundException', message: message);
}

/// @nodoc
class RequestEntityTooLargeException extends _s.GenericAwsException {
  RequestEntityTooLargeException({String? type, String? message})
      : super(
            type: type,
            code: 'RequestEntityTooLargeException',
            message: message);
}

/// @nodoc
class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

/// @nodoc
class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

/// @nodoc
class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String? type, String? message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

/// @nodoc
class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
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
