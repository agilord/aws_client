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

/// The Amazon Braket API Reference provides information about the operations
/// and structures supported by Amazon Braket.
///
/// To learn about the permissions required to call an Amazon Braket API action,
/// see <a
/// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_amazonbraket.html">Actions,
/// resources, and condition keys for Amazon Braket</a>. <a
/// href="https://amazon-braket-sdk-python.readthedocs.io/en/latest/#">Amazon
/// Braket Python SDK</a> and the <a
/// href="https://docs.aws.amazon.com/cli/latest/reference/braket/">AWS Command
/// Line Interface</a> can be used to make discovery and creation of API calls
/// easier. For more information about Amazon Braket features, see <a
/// href="https://docs.aws.amazon.com/braket/latest/developerguide/what-is-braket.html">What
/// is Amazon Braket?</a> and important <a
/// href="https://docs.aws.amazon.com/braket/latest/developerguide/braket-terms.html">terms
/// and concepts</a> in the <i>Amazon Braket Developer Guide</i>.
///
/// <b>In this guide:</b>
///
/// <ul>
/// <li> <p/> </li>
/// <li> <p/> </li>
/// <li>
/// <a>CommonParameters</a>
/// </li>
/// <li>
/// <a>CommonErrors</a>
/// </li>
/// </ul>
/// <b>Available languages for AWS SDK:</b>
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/sdkfornet/v3/apidocs/items/Braket/NBraket.html">.NET</a>
/// </li>
/// <li>
/// <a
/// href="https://sdk.amazonaws.com/cpp/api/LATEST/root/html/index.html">C++</a>
/// </li>
/// <li>
/// <a href="https://docs.aws.amazon.com/sdk-for-go/api/service/braket/">Go API
/// reference</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/com/amazonaws/services/braket/package-summary.html">Java</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/AWSJavaScriptSDK/latest/AWS/Braket.html">JavaScript</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/aws-sdk-php/v3/api/class-Aws.Braket.BraketClient.html">PHP</a>
/// </li>
/// <li>
/// <a
/// href="https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/braket.html">Python
/// (Boto)</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/sdk-for-ruby/v3/api/Aws/Braket.html">Ruby</a>
/// </li>
/// </ul>
/// <b>Code examples from the Amazon Braket Tutorials GitHub repository:</b>
///
/// <ul>
/// <li>
/// <a href="https://github.com/amazon-braket/amazon-braket-examples">Amazon
/// Braket Examples</a>
/// </li>
/// </ul>
class Braket {
  final _s.RestJsonProtocol _protocol;
  Braket({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'braket',
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

  /// Shows the tags associated with this resource.
  ///
  /// May throw [InternalServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// Specify the <code>resourceArn</code> for the resource whose tags to
  /// display.
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

  /// Add a tag to the specified resource.
  ///
  /// May throw [InternalServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// Specify the <code>resourceArn</code> of the resource to which a tag will
  /// be added.
  ///
  /// Parameter [tags] :
  /// Specify the tags to add to the resource. Tags can be specified as a
  /// key-value map.
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

  /// Remove tags from a resource.
  ///
  /// May throw [InternalServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// Specify the <code>resourceArn</code> for the resource from which to remove
  /// the tags.
  ///
  /// Parameter [tagKeys] :
  /// Specify the keys for the tags to remove from the resource.
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

  /// Retrieves the devices available in Amazon Braket.
  /// <note>
  /// For backwards compatibility with older versions of BraketSchemas, OpenQASM
  /// information is omitted from GetDevice API calls. To get this information
  /// the user-agent needs to present a recent version of the BraketSchemas
  /// (1.8.0 or later). The Braket SDK automatically reports this for you. If
  /// you do not see OpenQASM results in the GetDevice response when using a
  /// Braket SDK, you may need to set AWS_EXECUTION_ENV environment variable to
  /// configure user-agent. See the code examples provided below for how to do
  /// this for the AWS CLI, Boto3, and the Go, Java, and JavaScript/TypeScript
  /// SDKs.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [deviceArn] :
  /// The ARN of the device to retrieve.
  Future<GetDeviceResponse> getDevice({
    required String deviceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/device/${Uri.encodeComponent(deviceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDeviceResponse.fromJson(response);
  }

  /// Searches for devices using the specified filters.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filters] :
  /// Array of SearchDevicesFilter objects to use when searching for devices.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// A token used for pagination of results returned in the response. Use the
  /// token returned from the previous request to continue search where the
  /// previous request ended.
  Future<SearchDevicesResponse> searchDevices({
    required List<SearchDevicesFilter> filters,
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/devices',
      exceptionFnMap: _exceptionFns,
    );
    return SearchDevicesResponse.fromJson(response);
  }

  /// Creates an Amazon Braket hybrid job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [DeviceOfflineException].
  /// May throw [DeviceRetiredException].
  /// May throw [InternalServiceException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [algorithmSpecification] :
  /// Definition of the Amazon Braket job to be created. Specifies the container
  /// image the job uses and information about the Python scripts used for entry
  /// and training.
  ///
  /// Parameter [deviceConfig] :
  /// The quantum processing unit (QPU) or simulator used to create an Amazon
  /// Braket hybrid job.
  ///
  /// Parameter [instanceConfig] :
  /// Configuration of the resource instances to use while running the hybrid
  /// job on Amazon Braket.
  ///
  /// Parameter [jobName] :
  /// The name of the Amazon Braket hybrid job.
  ///
  /// Parameter [outputDataConfig] :
  /// The path to the S3 location where you want to store hybrid job artifacts
  /// and the encryption key used to store them.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of an IAM role that Amazon Braket can
  /// assume to perform tasks on behalf of a user. It can access user resources,
  /// run an Amazon Braket job container on behalf of user, and output results
  /// and hybrid job details to the users' s3 buckets.
  ///
  /// Parameter [associations] :
  /// The list of Amazon Braket resources associated with the hybrid job.
  ///
  /// Parameter [checkpointConfig] :
  /// Information about the output locations for hybrid job checkpoint data.
  ///
  /// Parameter [clientToken] :
  /// The client token associated with this request that guarantees that the
  /// request is idempotent.
  ///
  /// Parameter [hyperParameters] :
  /// Algorithm-specific parameters used by an Amazon Braket hybrid job that
  /// influence the quality of the training job. The values are set with a map
  /// of JSON key:value pairs, where the key is the name of the hyperparameter
  /// and the value is the value of the hyperparameter.
  /// <important>
  /// Do not include any security-sensitive information including account access
  /// IDs, secrets, or tokens in any hyperparameter fields. As part of the
  /// shared responsibility model, you are responsible for any potential
  /// exposure, unauthorized access, or compromise of your sensitive data if
  /// caused by security-sensitive information included in the request
  /// hyperparameter variable or plain text fields.
  /// </important>
  ///
  /// Parameter [inputDataConfig] :
  /// A list of parameters that specify the name and type of input data and
  /// where it is located.
  ///
  /// Parameter [stoppingCondition] :
  /// The user-defined criteria that specifies when a hybrid job stops running.
  ///
  /// Parameter [tags] :
  /// Tags to be added to the hybrid job you're creating.
  Future<CreateJobResponse> createJob({
    required AlgorithmSpecification algorithmSpecification,
    required DeviceConfig deviceConfig,
    required InstanceConfig instanceConfig,
    required String jobName,
    required JobOutputDataConfig outputDataConfig,
    required String roleArn,
    List<Association>? associations,
    JobCheckpointConfig? checkpointConfig,
    String? clientToken,
    Map<String, String>? hyperParameters,
    List<InputFileConfig>? inputDataConfig,
    JobStoppingCondition? stoppingCondition,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'algorithmSpecification': algorithmSpecification,
      'deviceConfig': deviceConfig,
      'instanceConfig': instanceConfig,
      'jobName': jobName,
      'outputDataConfig': outputDataConfig,
      'roleArn': roleArn,
      if (associations != null) 'associations': associations,
      if (checkpointConfig != null) 'checkpointConfig': checkpointConfig,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (hyperParameters != null) 'hyperParameters': hyperParameters,
      if (inputDataConfig != null) 'inputDataConfig': inputDataConfig,
      if (stoppingCondition != null) 'stoppingCondition': stoppingCondition,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/job',
      exceptionFnMap: _exceptionFns,
    );
    return CreateJobResponse.fromJson(response);
  }

  /// Retrieves the specified Amazon Braket hybrid job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [jobArn] :
  /// The ARN of the hybrid job to retrieve.
  ///
  /// Parameter [additionalAttributeNames] :
  /// A list of attributes to return additional information for. Only the
  /// QueueInfo additional attribute name is currently supported.
  Future<GetJobResponse> getJob({
    required String jobArn,
    List<HybridJobAdditionalAttributeName>? additionalAttributeNames,
  }) async {
    final $query = <String, List<String>>{
      if (additionalAttributeNames != null)
        'additionalAttributeNames':
            additionalAttributeNames.map((e) => e.value).toList(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/job/${Uri.encodeComponent(jobArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetJobResponse.fromJson(response);
  }

  /// Cancels an Amazon Braket hybrid job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [jobArn] :
  /// The ARN of the Amazon Braket hybrid job to cancel.
  Future<CancelJobResponse> cancelJob({
    required String jobArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri: '/job/${Uri.encodeComponent(jobArn)}/cancel',
      exceptionFnMap: _exceptionFns,
    );
    return CancelJobResponse.fromJson(response);
  }

  /// Searches for Amazon Braket hybrid jobs that match the specified filter
  /// values.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filters] :
  /// Array of SearchJobsFilter objects to use when searching for hybrid jobs.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// A token used for pagination of results returned in the response. Use the
  /// token returned from the previous request to continue search where the
  /// previous request ended.
  Future<SearchJobsResponse> searchJobs({
    required List<SearchJobsFilter> filters,
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/jobs',
      exceptionFnMap: _exceptionFns,
    );
    return SearchJobsResponse.fromJson(response);
  }

  /// Creates a quantum task.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [DeviceOfflineException].
  /// May throw [DeviceRetiredException].
  /// May throw [InternalServiceException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [action] :
  /// The action associated with the quantum task.
  ///
  /// Parameter [deviceArn] :
  /// The ARN of the device to run the quantum task on.
  ///
  /// Parameter [outputS3Bucket] :
  /// The S3 bucket to store quantum task result files in.
  ///
  /// Parameter [outputS3KeyPrefix] :
  /// The key prefix for the location in the S3 bucket to store quantum task
  /// results in.
  ///
  /// Parameter [shots] :
  /// The number of shots to use for the quantum task.
  ///
  /// Parameter [associations] :
  /// The list of Amazon Braket resources associated with the quantum task.
  ///
  /// Parameter [clientToken] :
  /// The client token associated with the request.
  ///
  /// Parameter [deviceParameters] :
  /// The parameters for the device to run the quantum task on.
  ///
  /// Parameter [experimentalCapabilities] :
  /// Enable experimental capabilities for the quantum task.
  ///
  /// Parameter [jobToken] :
  /// The token for an Amazon Braket hybrid job that associates it with the
  /// quantum task.
  ///
  /// Parameter [tags] :
  /// Tags to be added to the quantum task you're creating.
  Future<CreateQuantumTaskResponse> createQuantumTask({
    required Object action,
    required String deviceArn,
    required String outputS3Bucket,
    required String outputS3KeyPrefix,
    required int shots,
    List<Association>? associations,
    String? clientToken,
    Object? deviceParameters,
    ExperimentalCapabilities? experimentalCapabilities,
    String? jobToken,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'action': jsonEncode(action),
      'deviceArn': deviceArn,
      'outputS3Bucket': outputS3Bucket,
      'outputS3KeyPrefix': outputS3KeyPrefix,
      'shots': shots,
      if (associations != null) 'associations': associations,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (deviceParameters != null)
        'deviceParameters': jsonEncode(deviceParameters),
      if (experimentalCapabilities != null)
        'experimentalCapabilities': experimentalCapabilities,
      if (jobToken != null) 'jobToken': jobToken,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/quantum-task',
      exceptionFnMap: _exceptionFns,
    );
    return CreateQuantumTaskResponse.fromJson(response);
  }

  /// Retrieves the specified quantum task.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [quantumTaskArn] :
  /// The ARN of the quantum task to retrieve.
  ///
  /// Parameter [additionalAttributeNames] :
  /// A list of attributes to return additional information for. Only the
  /// QueueInfo additional attribute name is currently supported.
  Future<GetQuantumTaskResponse> getQuantumTask({
    required String quantumTaskArn,
    List<QuantumTaskAdditionalAttributeName>? additionalAttributeNames,
  }) async {
    final $query = <String, List<String>>{
      if (additionalAttributeNames != null)
        'additionalAttributeNames':
            additionalAttributeNames.map((e) => e.value).toList(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/quantum-task/${Uri.encodeComponent(quantumTaskArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetQuantumTaskResponse.fromJson(response);
  }

  /// Cancels the specified task.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [quantumTaskArn] :
  /// The ARN of the quantum task to cancel.
  ///
  /// Parameter [clientToken] :
  /// The client token associated with the cancellation request.
  Future<CancelQuantumTaskResponse> cancelQuantumTask({
    required String quantumTaskArn,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/quantum-task/${Uri.encodeComponent(quantumTaskArn)}/cancel',
      exceptionFnMap: _exceptionFns,
    );
    return CancelQuantumTaskResponse.fromJson(response);
  }

  /// Searches for tasks that match the specified filter values.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filters] :
  /// Array of <code>SearchQuantumTasksFilter</code> objects to use when
  /// searching for quantum tasks.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// A token used for pagination of results returned in the response. Use the
  /// token returned from the previous request to continue search where the
  /// previous request ended.
  Future<SearchQuantumTasksResponse> searchQuantumTasks({
    required List<SearchQuantumTasksFilter> filters,
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/quantum-tasks',
      exceptionFnMap: _exceptionFns,
    );
    return SearchQuantumTasksResponse.fromJson(response);
  }

  /// Creates a spending limit for a specified quantum device. Spending limits
  /// help you control costs by setting maximum amounts that can be spent on
  /// quantum computing tasks within a specified time period. Simulators do not
  /// support spending limits.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [DeviceRetiredException].
  /// May throw [InternalServiceException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [deviceArn] :
  /// The Amazon Resource Name (ARN) of the quantum device to apply the spending
  /// limit to.
  ///
  /// Parameter [spendingLimit] :
  /// The maximum amount that can be spent on the specified device, in USD.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure that the operation completes
  /// no more than one time. If this token matches a previous request, Amazon
  /// Braket ignores the request, but does not return an error.
  ///
  /// Parameter [tags] :
  /// The tags to apply to the spending limit. Each tag consists of a key and an
  /// optional value.
  ///
  /// Parameter [timePeriod] :
  /// The time period during which the spending limit is active, including start
  /// and end dates.
  Future<CreateSpendingLimitResponse> createSpendingLimit({
    required String deviceArn,
    required String spendingLimit,
    String? clientToken,
    Map<String, String>? tags,
    TimePeriod? timePeriod,
  }) async {
    final $payload = <String, dynamic>{
      'deviceArn': deviceArn,
      'spendingLimit': spendingLimit,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
      if (timePeriod != null) 'timePeriod': timePeriod,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/spending-limit',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSpendingLimitResponse.fromJson(response);
  }

  /// Updates an existing spending limit. You can modify the spending amount or
  /// time period. Changes take effect immediately.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [spendingLimitArn] :
  /// The Amazon Resource Name (ARN) of the spending limit to update.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure that the operation completes
  /// no more than one time. If this token matches a previous request, Amazon
  /// Braket ignores the request, but does not return an error.
  ///
  /// Parameter [spendingLimit] :
  /// The new maximum amount that can be spent on the specified device, in USD.
  ///
  /// Parameter [timePeriod] :
  /// The new time period during which the spending limit is active, including
  /// start and end dates.
  Future<void> updateSpendingLimit({
    required String spendingLimitArn,
    String? clientToken,
    String? spendingLimit,
    TimePeriod? timePeriod,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (spendingLimit != null) 'spendingLimit': spendingLimit,
      if (timePeriod != null) 'timePeriod': timePeriod,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/spending-limit/${Uri.encodeComponent(spendingLimitArn)}/update',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an existing spending limit. This operation permanently removes the
  /// spending limit and cannot be undone. After deletion, the associated device
  /// becomes unrestricted for spending.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [spendingLimitArn] :
  /// The Amazon Resource Name (ARN) of the spending limit to delete.
  Future<void> deleteSpendingLimit({
    required String spendingLimitArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/spending-limit/${Uri.encodeComponent(spendingLimitArn)}/delete',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Searches and lists spending limits based on specified filters. This
  /// operation supports pagination and allows filtering by various criteria to
  /// find specific spending limits. We recommend using pagination to ensure
  /// that the operation returns quickly and successfully.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filters] :
  /// The filters to apply when searching for spending limits. Use filters to
  /// narrow down the results based on specific criteria.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. Minimum value of
  /// 1, maximum value of 100. Default is 20.
  ///
  /// Parameter [nextToken] :
  /// The token to retrieve the next page of results. This value is returned
  /// from a previous call to SearchSpendingLimits when there are more results
  /// available.
  Future<SearchSpendingLimitsResponse> searchSpendingLimits({
    List<SearchSpendingLimitsFilter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/spending-limits',
      exceptionFnMap: _exceptionFns,
    );
    return SearchSpendingLimitsResponse.fromJson(response);
  }
}

class ListTagsForResourceResponse {
  /// Displays the key, value pairs of tags associated with this resource.
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

class GetDeviceResponse {
  /// The ARN of the device.
  final String deviceArn;

  /// Details about the capabilities of the device.
  final Object deviceCapabilities;

  /// The name of the device.
  final String deviceName;

  /// The status of the device.
  final DeviceStatus deviceStatus;

  /// The type of the device.
  final DeviceType deviceType;

  /// The name of the partner company for the device.
  final String providerName;

  /// The number of quantum tasks and hybrid jobs currently queued on the device.
  final List<DeviceQueueInfo>? deviceQueueInfo;

  GetDeviceResponse({
    required this.deviceArn,
    required this.deviceCapabilities,
    required this.deviceName,
    required this.deviceStatus,
    required this.deviceType,
    required this.providerName,
    this.deviceQueueInfo,
  });

  factory GetDeviceResponse.fromJson(Map<String, dynamic> json) {
    return GetDeviceResponse(
      deviceArn: (json['deviceArn'] as String?) ?? '',
      deviceCapabilities:
          jsonDecode(json['deviceCapabilities'] as String) as Object,
      deviceName: (json['deviceName'] as String?) ?? '',
      deviceStatus:
          DeviceStatus.fromString((json['deviceStatus'] as String?) ?? ''),
      deviceType: DeviceType.fromString((json['deviceType'] as String?) ?? ''),
      providerName: (json['providerName'] as String?) ?? '',
      deviceQueueInfo: (json['deviceQueueInfo'] as List?)
          ?.nonNulls
          .map((e) => DeviceQueueInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final deviceArn = this.deviceArn;
    final deviceCapabilities = this.deviceCapabilities;
    final deviceName = this.deviceName;
    final deviceStatus = this.deviceStatus;
    final deviceType = this.deviceType;
    final providerName = this.providerName;
    final deviceQueueInfo = this.deviceQueueInfo;
    return {
      'deviceArn': deviceArn,
      'deviceCapabilities': jsonEncode(deviceCapabilities),
      'deviceName': deviceName,
      'deviceStatus': deviceStatus.value,
      'deviceType': deviceType.value,
      'providerName': providerName,
      if (deviceQueueInfo != null) 'deviceQueueInfo': deviceQueueInfo,
    };
  }
}

class SearchDevicesResponse {
  /// An array of <code>DeviceSummary</code> objects for devices that match the
  /// specified filter values.
  final List<DeviceSummary> devices;

  /// A token used for pagination of results, or null if there are no additional
  /// results. Use the token value in a subsequent request to continue search
  /// where the previous request ended.
  final String? nextToken;

  SearchDevicesResponse({
    required this.devices,
    this.nextToken,
  });

  factory SearchDevicesResponse.fromJson(Map<String, dynamic> json) {
    return SearchDevicesResponse(
      devices: ((json['devices'] as List?) ?? const [])
          .nonNulls
          .map((e) => DeviceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final devices = this.devices;
    final nextToken = this.nextToken;
    return {
      'devices': devices,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class CreateJobResponse {
  /// The ARN of the Amazon Braket hybrid job created.
  final String jobArn;

  CreateJobResponse({
    required this.jobArn,
  });

  factory CreateJobResponse.fromJson(Map<String, dynamic> json) {
    return CreateJobResponse(
      jobArn: (json['jobArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final jobArn = this.jobArn;
    return {
      'jobArn': jobArn,
    };
  }
}

class GetJobResponse {
  /// Definition of the Amazon Braket hybrid job created. Provides information
  /// about the container image used, and the Python scripts used for training.
  final AlgorithmSpecification algorithmSpecification;

  /// The time at which the Amazon Braket hybrid job was created.
  final DateTime createdAt;

  /// The resource instances to use while running the hybrid job on Amazon Braket.
  final InstanceConfig instanceConfig;

  /// The ARN of the Amazon Braket hybrid job.
  final String jobArn;

  /// The name of the Amazon Braket hybrid job.
  final String jobName;

  /// The path to the S3 location where hybrid job artifacts are stored and the
  /// encryption key used to store them there.
  final JobOutputDataConfig outputDataConfig;

  /// The Amazon Resource Name (ARN) of an IAM role that Amazon Braket can assume
  /// to perform tasks on behalf of a user. It can access user resources, run an
  /// Amazon Braket job container on behalf of user, and output results and other
  /// hybrid job details to the s3 buckets of a user.
  final String roleArn;

  /// The status of the Amazon Braket hybrid job.
  final JobPrimaryStatus status;

  /// The list of Amazon Braket resources associated with the hybrid job.
  final List<Association>? associations;

  /// The billable time for which the Amazon Braket hybrid job used to complete.
  final int? billableDuration;

  /// Information about the output locations for hybrid job checkpoint data.
  final JobCheckpointConfig? checkpointConfig;

  /// The primary device used by the Amazon Braket hybrid job.
  final DeviceConfig? deviceConfig;

  /// The time at which the Amazon Braket hybrid job ended.
  final DateTime? endedAt;

  /// Details about the time and type of events occurred related to the Amazon
  /// Braket hybrid job.
  final List<JobEventDetails>? events;

  /// A description of the reason why an Amazon Braket hybrid job failed, if it
  /// failed.
  final String? failureReason;

  /// Algorithm-specific parameters used by an Amazon Braket hybrid job that
  /// influence the quality of the traiing job. The values are set with a map of
  /// JSON key:value pairs, where the key is the name of the hyperparameter and
  /// the value is the value of th hyperparameter.
  final Map<String, String>? hyperParameters;

  /// A list of parameters that specify the name and type of input data and where
  /// it is located.
  final List<InputFileConfig>? inputDataConfig;

  /// Queue information for the requested hybrid job. Only returned if
  /// <code>QueueInfo</code> is specified in the
  /// <code>additionalAttributeNames"</code> field in the <code>GetJob</code> API
  /// request.
  final HybridJobQueueInfo? queueInfo;

  /// The time at which the Amazon Braket hybrid job was started.
  final DateTime? startedAt;

  /// The user-defined criteria that specifies when to stop a running hybrid job.
  final JobStoppingCondition? stoppingCondition;

  /// The tags associated with this hybrid job.
  final Map<String, String>? tags;

  GetJobResponse({
    required this.algorithmSpecification,
    required this.createdAt,
    required this.instanceConfig,
    required this.jobArn,
    required this.jobName,
    required this.outputDataConfig,
    required this.roleArn,
    required this.status,
    this.associations,
    this.billableDuration,
    this.checkpointConfig,
    this.deviceConfig,
    this.endedAt,
    this.events,
    this.failureReason,
    this.hyperParameters,
    this.inputDataConfig,
    this.queueInfo,
    this.startedAt,
    this.stoppingCondition,
    this.tags,
  });

  factory GetJobResponse.fromJson(Map<String, dynamic> json) {
    return GetJobResponse(
      algorithmSpecification: AlgorithmSpecification.fromJson(
          (json['algorithmSpecification'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      instanceConfig: InstanceConfig.fromJson(
          (json['instanceConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      jobArn: (json['jobArn'] as String?) ?? '',
      jobName: (json['jobName'] as String?) ?? '',
      outputDataConfig: JobOutputDataConfig.fromJson(
          (json['outputDataConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      roleArn: (json['roleArn'] as String?) ?? '',
      status: JobPrimaryStatus.fromString((json['status'] as String?) ?? ''),
      associations: (json['associations'] as List?)
          ?.nonNulls
          .map((e) => Association.fromJson(e as Map<String, dynamic>))
          .toList(),
      billableDuration: json['billableDuration'] as int?,
      checkpointConfig: json['checkpointConfig'] != null
          ? JobCheckpointConfig.fromJson(
              json['checkpointConfig'] as Map<String, dynamic>)
          : null,
      deviceConfig: json['deviceConfig'] != null
          ? DeviceConfig.fromJson(json['deviceConfig'] as Map<String, dynamic>)
          : null,
      endedAt: timeStampFromJson(json['endedAt']),
      events: (json['events'] as List?)
          ?.nonNulls
          .map((e) => JobEventDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      failureReason: json['failureReason'] as String?,
      hyperParameters: (json['hyperParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      inputDataConfig: (json['inputDataConfig'] as List?)
          ?.nonNulls
          .map((e) => InputFileConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      queueInfo: json['queueInfo'] != null
          ? HybridJobQueueInfo.fromJson(
              json['queueInfo'] as Map<String, dynamic>)
          : null,
      startedAt: timeStampFromJson(json['startedAt']),
      stoppingCondition: json['stoppingCondition'] != null
          ? JobStoppingCondition.fromJson(
              json['stoppingCondition'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final algorithmSpecification = this.algorithmSpecification;
    final createdAt = this.createdAt;
    final instanceConfig = this.instanceConfig;
    final jobArn = this.jobArn;
    final jobName = this.jobName;
    final outputDataConfig = this.outputDataConfig;
    final roleArn = this.roleArn;
    final status = this.status;
    final associations = this.associations;
    final billableDuration = this.billableDuration;
    final checkpointConfig = this.checkpointConfig;
    final deviceConfig = this.deviceConfig;
    final endedAt = this.endedAt;
    final events = this.events;
    final failureReason = this.failureReason;
    final hyperParameters = this.hyperParameters;
    final inputDataConfig = this.inputDataConfig;
    final queueInfo = this.queueInfo;
    final startedAt = this.startedAt;
    final stoppingCondition = this.stoppingCondition;
    final tags = this.tags;
    return {
      'algorithmSpecification': algorithmSpecification,
      'createdAt': iso8601ToJson(createdAt),
      'instanceConfig': instanceConfig,
      'jobArn': jobArn,
      'jobName': jobName,
      'outputDataConfig': outputDataConfig,
      'roleArn': roleArn,
      'status': status.value,
      if (associations != null) 'associations': associations,
      if (billableDuration != null) 'billableDuration': billableDuration,
      if (checkpointConfig != null) 'checkpointConfig': checkpointConfig,
      if (deviceConfig != null) 'deviceConfig': deviceConfig,
      if (endedAt != null) 'endedAt': iso8601ToJson(endedAt),
      if (events != null) 'events': events,
      if (failureReason != null) 'failureReason': failureReason,
      if (hyperParameters != null) 'hyperParameters': hyperParameters,
      if (inputDataConfig != null) 'inputDataConfig': inputDataConfig,
      if (queueInfo != null) 'queueInfo': queueInfo,
      if (startedAt != null) 'startedAt': iso8601ToJson(startedAt),
      if (stoppingCondition != null) 'stoppingCondition': stoppingCondition,
      if (tags != null) 'tags': tags,
    };
  }
}

class CancelJobResponse {
  /// The status of the hybrid job.
  final CancellationStatus cancellationStatus;

  /// The ARN of the Amazon Braket job.
  final String jobArn;

  CancelJobResponse({
    required this.cancellationStatus,
    required this.jobArn,
  });

  factory CancelJobResponse.fromJson(Map<String, dynamic> json) {
    return CancelJobResponse(
      cancellationStatus: CancellationStatus.fromString(
          (json['cancellationStatus'] as String?) ?? ''),
      jobArn: (json['jobArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final cancellationStatus = this.cancellationStatus;
    final jobArn = this.jobArn;
    return {
      'cancellationStatus': cancellationStatus.value,
      'jobArn': jobArn,
    };
  }
}

class SearchJobsResponse {
  /// An array of <code>JobSummary</code> objects for devices that match the
  /// specified filter values.
  final List<JobSummary> jobs;

  /// A token used for pagination of results, or <code>null</code> if there are no
  /// additional results. Use the token value in a subsequent request to continue
  /// search where the previous request ended.
  final String? nextToken;

  SearchJobsResponse({
    required this.jobs,
    this.nextToken,
  });

  factory SearchJobsResponse.fromJson(Map<String, dynamic> json) {
    return SearchJobsResponse(
      jobs: ((json['jobs'] as List?) ?? const [])
          .nonNulls
          .map((e) => JobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobs = this.jobs;
    final nextToken = this.nextToken;
    return {
      'jobs': jobs,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class CreateQuantumTaskResponse {
  /// The ARN of the quantum task created by the request.
  final String quantumTaskArn;

  CreateQuantumTaskResponse({
    required this.quantumTaskArn,
  });

  factory CreateQuantumTaskResponse.fromJson(Map<String, dynamic> json) {
    return CreateQuantumTaskResponse(
      quantumTaskArn: (json['quantumTaskArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final quantumTaskArn = this.quantumTaskArn;
    return {
      'quantumTaskArn': quantumTaskArn,
    };
  }
}

class GetQuantumTaskResponse {
  /// The time at which the quantum task was created.
  final DateTime createdAt;

  /// The ARN of the device the quantum task was run on.
  final String deviceArn;

  /// The parameters for the device on which the quantum task ran.
  final Object deviceParameters;

  /// The S3 bucket where quantum task results are stored.
  final String outputS3Bucket;

  /// The folder in the S3 bucket where quantum task results are stored.
  final String outputS3Directory;

  /// The ARN of the quantum task.
  final String quantumTaskArn;

  /// The number of shots used in the quantum task.
  final int shots;

  /// The status of the quantum task.
  final QuantumTaskStatus status;

  /// Metadata about the action performed by the quantum task, including
  /// information about the type of action and program counts.
  final ActionMetadata? actionMetadata;

  /// The list of Amazon Braket resources associated with the quantum task.
  final List<Association>? associations;

  /// The time at which the quantum task ended.
  final DateTime? endedAt;

  /// Enabled experimental capabilities for the quantum task, if any.
  final ExperimentalCapabilities? experimentalCapabilities;

  /// The reason that a quantum task failed.
  final String? failureReason;

  /// The ARN of the Amazon Braket job associated with the quantum task.
  final String? jobArn;

  /// The number of successful shots for the quantum task. This is available after
  /// a successfully completed quantum task.
  final int? numSuccessfulShots;

  /// Queue information for the requested quantum task. Only returned if
  /// <code>QueueInfo</code> is specified in the
  /// <code>additionalAttributeNames"</code> field in the
  /// <code>GetQuantumTask</code> API request.
  final QuantumTaskQueueInfo? queueInfo;

  /// The tags that belong to this quantum task.
  final Map<String, String>? tags;

  GetQuantumTaskResponse({
    required this.createdAt,
    required this.deviceArn,
    required this.deviceParameters,
    required this.outputS3Bucket,
    required this.outputS3Directory,
    required this.quantumTaskArn,
    required this.shots,
    required this.status,
    this.actionMetadata,
    this.associations,
    this.endedAt,
    this.experimentalCapabilities,
    this.failureReason,
    this.jobArn,
    this.numSuccessfulShots,
    this.queueInfo,
    this.tags,
  });

  factory GetQuantumTaskResponse.fromJson(Map<String, dynamic> json) {
    return GetQuantumTaskResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      deviceArn: (json['deviceArn'] as String?) ?? '',
      deviceParameters:
          jsonDecode(json['deviceParameters'] as String) as Object,
      outputS3Bucket: (json['outputS3Bucket'] as String?) ?? '',
      outputS3Directory: (json['outputS3Directory'] as String?) ?? '',
      quantumTaskArn: (json['quantumTaskArn'] as String?) ?? '',
      shots: (json['shots'] as int?) ?? 0,
      status: QuantumTaskStatus.fromString((json['status'] as String?) ?? ''),
      actionMetadata: json['actionMetadata'] != null
          ? ActionMetadata.fromJson(
              json['actionMetadata'] as Map<String, dynamic>)
          : null,
      associations: (json['associations'] as List?)
          ?.nonNulls
          .map((e) => Association.fromJson(e as Map<String, dynamic>))
          .toList(),
      endedAt: timeStampFromJson(json['endedAt']),
      experimentalCapabilities: json['experimentalCapabilities'] != null
          ? ExperimentalCapabilities.fromJson(
              json['experimentalCapabilities'] as Map<String, dynamic>)
          : null,
      failureReason: json['failureReason'] as String?,
      jobArn: json['jobArn'] as String?,
      numSuccessfulShots: json['numSuccessfulShots'] as int?,
      queueInfo: json['queueInfo'] != null
          ? QuantumTaskQueueInfo.fromJson(
              json['queueInfo'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final deviceArn = this.deviceArn;
    final deviceParameters = this.deviceParameters;
    final outputS3Bucket = this.outputS3Bucket;
    final outputS3Directory = this.outputS3Directory;
    final quantumTaskArn = this.quantumTaskArn;
    final shots = this.shots;
    final status = this.status;
    final actionMetadata = this.actionMetadata;
    final associations = this.associations;
    final endedAt = this.endedAt;
    final experimentalCapabilities = this.experimentalCapabilities;
    final failureReason = this.failureReason;
    final jobArn = this.jobArn;
    final numSuccessfulShots = this.numSuccessfulShots;
    final queueInfo = this.queueInfo;
    final tags = this.tags;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'deviceArn': deviceArn,
      'deviceParameters': jsonEncode(deviceParameters),
      'outputS3Bucket': outputS3Bucket,
      'outputS3Directory': outputS3Directory,
      'quantumTaskArn': quantumTaskArn,
      'shots': shots,
      'status': status.value,
      if (actionMetadata != null) 'actionMetadata': actionMetadata,
      if (associations != null) 'associations': associations,
      if (endedAt != null) 'endedAt': iso8601ToJson(endedAt),
      if (experimentalCapabilities != null)
        'experimentalCapabilities': experimentalCapabilities,
      if (failureReason != null) 'failureReason': failureReason,
      if (jobArn != null) 'jobArn': jobArn,
      if (numSuccessfulShots != null) 'numSuccessfulShots': numSuccessfulShots,
      if (queueInfo != null) 'queueInfo': queueInfo,
      if (tags != null) 'tags': tags,
    };
  }
}

class CancelQuantumTaskResponse {
  /// The status of the quantum task.
  final CancellationStatus cancellationStatus;

  /// The ARN of the quantum task.
  final String quantumTaskArn;

  CancelQuantumTaskResponse({
    required this.cancellationStatus,
    required this.quantumTaskArn,
  });

  factory CancelQuantumTaskResponse.fromJson(Map<String, dynamic> json) {
    return CancelQuantumTaskResponse(
      cancellationStatus: CancellationStatus.fromString(
          (json['cancellationStatus'] as String?) ?? ''),
      quantumTaskArn: (json['quantumTaskArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final cancellationStatus = this.cancellationStatus;
    final quantumTaskArn = this.quantumTaskArn;
    return {
      'cancellationStatus': cancellationStatus.value,
      'quantumTaskArn': quantumTaskArn,
    };
  }
}

class SearchQuantumTasksResponse {
  /// An array of <code>QuantumTaskSummary</code> objects for quantum tasks that
  /// match the specified filters.
  final List<QuantumTaskSummary> quantumTasks;

  /// A token used for pagination of results, or null if there are no additional
  /// results. Use the token value in a subsequent request to continue search
  /// where the previous request ended.
  final String? nextToken;

  SearchQuantumTasksResponse({
    required this.quantumTasks,
    this.nextToken,
  });

  factory SearchQuantumTasksResponse.fromJson(Map<String, dynamic> json) {
    return SearchQuantumTasksResponse(
      quantumTasks: ((json['quantumTasks'] as List?) ?? const [])
          .nonNulls
          .map((e) => QuantumTaskSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final quantumTasks = this.quantumTasks;
    final nextToken = this.nextToken;
    return {
      'quantumTasks': quantumTasks,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class CreateSpendingLimitResponse {
  /// The Amazon Resource Name (ARN) of the created spending limit.
  final String spendingLimitArn;

  CreateSpendingLimitResponse({
    required this.spendingLimitArn,
  });

  factory CreateSpendingLimitResponse.fromJson(Map<String, dynamic> json) {
    return CreateSpendingLimitResponse(
      spendingLimitArn: (json['spendingLimitArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final spendingLimitArn = this.spendingLimitArn;
    return {
      'spendingLimitArn': spendingLimitArn,
    };
  }
}

class UpdateSpendingLimitResponse {
  UpdateSpendingLimitResponse();

  factory UpdateSpendingLimitResponse.fromJson(Map<String, dynamic> _) {
    return UpdateSpendingLimitResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteSpendingLimitResponse {
  DeleteSpendingLimitResponse();

  factory DeleteSpendingLimitResponse.fromJson(Map<String, dynamic> _) {
    return DeleteSpendingLimitResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class SearchSpendingLimitsResponse {
  /// An array of spending limit summaries that match the specified filters.
  final List<SpendingLimitSummary> spendingLimits;

  /// The token to retrieve the next page of results. This value is null when
  /// there are no more results to return.
  final String? nextToken;

  SearchSpendingLimitsResponse({
    required this.spendingLimits,
    this.nextToken,
  });

  factory SearchSpendingLimitsResponse.fromJson(Map<String, dynamic> json) {
    return SearchSpendingLimitsResponse(
      spendingLimits: ((json['spendingLimits'] as List?) ?? const [])
          .nonNulls
          .map((e) => SpendingLimitSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final spendingLimits = this.spendingLimits;
    final nextToken = this.nextToken;
    return {
      'spendingLimits': spendingLimits,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Contains summary information about a spending limit, including current
/// spending status and configuration details.
class SpendingLimitSummary {
  /// The date and time when the spending limit was created, in epoch seconds.
  final DateTime createdAt;

  /// The Amazon Resource Name (ARN) of the quantum device associated with this
  /// spending limit.
  final String deviceArn;

  /// The amount currently queued for spending on the device, in USD.
  final String queuedSpend;

  /// The maximum spending amount allowed for the device during the specified time
  /// period, in USD.
  final String spendingLimit;

  /// The Amazon Resource Name (ARN) that uniquely identifies the spending limit.
  final String spendingLimitArn;

  /// The time period during which the spending limit is active.
  final TimePeriod timePeriod;

  /// The total amount spent on the device so far during the current time period,
  /// in USD.
  final String totalSpend;

  /// The date and time when the spending limit was last modified, in epoch
  /// seconds.
  final DateTime updatedAt;

  /// The tags associated with the spending limit. Each tag consists of a key and
  /// an optional value.
  final Map<String, String>? tags;

  SpendingLimitSummary({
    required this.createdAt,
    required this.deviceArn,
    required this.queuedSpend,
    required this.spendingLimit,
    required this.spendingLimitArn,
    required this.timePeriod,
    required this.totalSpend,
    required this.updatedAt,
    this.tags,
  });

  factory SpendingLimitSummary.fromJson(Map<String, dynamic> json) {
    return SpendingLimitSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      deviceArn: (json['deviceArn'] as String?) ?? '',
      queuedSpend: (json['queuedSpend'] as String?) ?? '',
      spendingLimit: (json['spendingLimit'] as String?) ?? '',
      spendingLimitArn: (json['spendingLimitArn'] as String?) ?? '',
      timePeriod: TimePeriod.fromJson(
          (json['timePeriod'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      totalSpend: (json['totalSpend'] as String?) ?? '',
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final deviceArn = this.deviceArn;
    final queuedSpend = this.queuedSpend;
    final spendingLimit = this.spendingLimit;
    final spendingLimitArn = this.spendingLimitArn;
    final timePeriod = this.timePeriod;
    final totalSpend = this.totalSpend;
    final updatedAt = this.updatedAt;
    final tags = this.tags;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'deviceArn': deviceArn,
      'queuedSpend': queuedSpend,
      'spendingLimit': spendingLimit,
      'spendingLimitArn': spendingLimitArn,
      'timePeriod': timePeriod,
      'totalSpend': totalSpend,
      'updatedAt': iso8601ToJson(updatedAt),
      if (tags != null) 'tags': tags,
    };
  }
}

/// Defines a time range for spending limits, specifying when the limit is
/// active.
class TimePeriod {
  /// The end date and time for the spending limit period, in epoch seconds.
  final DateTime endAt;

  /// The start date and time for the spending limit period, in epoch seconds.
  final DateTime startAt;

  TimePeriod({
    required this.endAt,
    required this.startAt,
  });

  factory TimePeriod.fromJson(Map<String, dynamic> json) {
    return TimePeriod(
      endAt: nonNullableTimeStampFromJson(json['endAt'] ?? 0),
      startAt: nonNullableTimeStampFromJson(json['startAt'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final endAt = this.endAt;
    final startAt = this.startAt;
    return {
      'endAt': unixTimestampToJson(endAt),
      'startAt': unixTimestampToJson(startAt),
    };
  }
}

/// Specifies filter criteria for searching spending limits. Use filters to
/// narrow down results based on specific attributes.
class SearchSpendingLimitsFilter {
  /// The name of the field to filter on. Currently only supports
  /// <code>deviceArn</code>.
  final String name;

  /// The comparison operator to use when filtering.
  final SearchSpendingLimitsFilterOperator operator;

  /// An array of values to match against the specified field.
  final List<String> values;

  SearchSpendingLimitsFilter({
    required this.name,
    required this.operator,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final operator = this.operator;
    final values = this.values;
    return {
      'name': name,
      'operator': operator.value,
      'values': values,
    };
  }
}

class SearchSpendingLimitsFilterOperator {
  static const equal = SearchSpendingLimitsFilterOperator._('EQUAL');

  final String value;

  const SearchSpendingLimitsFilterOperator._(this.value);

  static const values = [equal];

  static SearchSpendingLimitsFilterOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SearchSpendingLimitsFilterOperator._(value));

  @override
  bool operator ==(other) =>
      other is SearchSpendingLimitsFilterOperator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Includes information about a quantum task.
class QuantumTaskSummary {
  /// The time at which the quantum task was created.
  final DateTime createdAt;

  /// The ARN of the device the quantum task ran on.
  final String deviceArn;

  /// The S3 bucket where the quantum task result file is stored.
  final String outputS3Bucket;

  /// The folder in the S3 bucket where the quantum task result file is stored.
  final String outputS3Directory;

  /// The ARN of the quantum task.
  final String quantumTaskArn;

  /// The shots used for the quantum task.
  final int shots;

  /// The status of the quantum task.
  final QuantumTaskStatus status;

  /// The time at which the quantum task finished.
  final DateTime? endedAt;

  /// Displays the key, value pairs of tags associated with this quantum task.
  final Map<String, String>? tags;

  QuantumTaskSummary({
    required this.createdAt,
    required this.deviceArn,
    required this.outputS3Bucket,
    required this.outputS3Directory,
    required this.quantumTaskArn,
    required this.shots,
    required this.status,
    this.endedAt,
    this.tags,
  });

  factory QuantumTaskSummary.fromJson(Map<String, dynamic> json) {
    return QuantumTaskSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      deviceArn: (json['deviceArn'] as String?) ?? '',
      outputS3Bucket: (json['outputS3Bucket'] as String?) ?? '',
      outputS3Directory: (json['outputS3Directory'] as String?) ?? '',
      quantumTaskArn: (json['quantumTaskArn'] as String?) ?? '',
      shots: (json['shots'] as int?) ?? 0,
      status: QuantumTaskStatus.fromString((json['status'] as String?) ?? ''),
      endedAt: timeStampFromJson(json['endedAt']),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final deviceArn = this.deviceArn;
    final outputS3Bucket = this.outputS3Bucket;
    final outputS3Directory = this.outputS3Directory;
    final quantumTaskArn = this.quantumTaskArn;
    final shots = this.shots;
    final status = this.status;
    final endedAt = this.endedAt;
    final tags = this.tags;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'deviceArn': deviceArn,
      'outputS3Bucket': outputS3Bucket,
      'outputS3Directory': outputS3Directory,
      'quantumTaskArn': quantumTaskArn,
      'shots': shots,
      'status': status.value,
      if (endedAt != null) 'endedAt': iso8601ToJson(endedAt),
      if (tags != null) 'tags': tags,
    };
  }
}

class QuantumTaskStatus {
  static const created = QuantumTaskStatus._('CREATED');
  static const queued = QuantumTaskStatus._('QUEUED');
  static const running = QuantumTaskStatus._('RUNNING');
  static const completed = QuantumTaskStatus._('COMPLETED');
  static const failed = QuantumTaskStatus._('FAILED');
  static const cancelling = QuantumTaskStatus._('CANCELLING');
  static const cancelled = QuantumTaskStatus._('CANCELLED');

  final String value;

  const QuantumTaskStatus._(this.value);

  static const values = [
    created,
    queued,
    running,
    completed,
    failed,
    cancelling,
    cancelled
  ];

  static QuantumTaskStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => QuantumTaskStatus._(value));

  @override
  bool operator ==(other) => other is QuantumTaskStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A filter used to search for quantum tasks.
class SearchQuantumTasksFilter {
  /// The name of the quantum task parameter to filter based on. Filter name can
  /// be either <code>quantumTaskArn</code>, <code>deviceArn</code>,
  /// <code>jobArn</code>, <code>status</code> or <code>createdAt</code>.
  final String name;

  /// An operator to use for the filter.
  final SearchQuantumTasksFilterOperator operator;

  /// The values used to filter quantum tasks based on the filter name and
  /// operator.
  final List<String> values;

  SearchQuantumTasksFilter({
    required this.name,
    required this.operator,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final operator = this.operator;
    final values = this.values;
    return {
      'name': name,
      'operator': operator.value,
      'values': values,
    };
  }
}

class SearchQuantumTasksFilterOperator {
  static const lt = SearchQuantumTasksFilterOperator._('LT');
  static const lte = SearchQuantumTasksFilterOperator._('LTE');
  static const equal = SearchQuantumTasksFilterOperator._('EQUAL');
  static const gt = SearchQuantumTasksFilterOperator._('GT');
  static const gte = SearchQuantumTasksFilterOperator._('GTE');
  static const between = SearchQuantumTasksFilterOperator._('BETWEEN');

  final String value;

  const SearchQuantumTasksFilterOperator._(this.value);

  static const values = [lt, lte, equal, gt, gte, between];

  static SearchQuantumTasksFilterOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SearchQuantumTasksFilterOperator._(value));

  @override
  bool operator ==(other) =>
      other is SearchQuantumTasksFilterOperator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class CancellationStatus {
  static const cancelling = CancellationStatus._('CANCELLING');
  static const cancelled = CancellationStatus._('CANCELLED');

  final String value;

  const CancellationStatus._(this.value);

  static const values = [cancelling, cancelled];

  static CancellationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CancellationStatus._(value));

  @override
  bool operator ==(other) =>
      other is CancellationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The queue information for the specified quantum task.
class QuantumTaskQueueInfo {
  /// Current position of the quantum task in the quantum tasks queue.
  final String position;

  /// The name of the queue.
  final QueueName queue;

  /// Optional. Provides more information about the queue position. For example,
  /// if the quantum task is complete and no longer in the queue, the message
  /// field contains that information.
  final String? message;

  /// Optional. Specifies the priority of the queue. Quantum tasks in a priority
  /// queue are processed before the quantum tasks in a normal queue.
  final QueuePriority? queuePriority;

  QuantumTaskQueueInfo({
    required this.position,
    required this.queue,
    this.message,
    this.queuePriority,
  });

  factory QuantumTaskQueueInfo.fromJson(Map<String, dynamic> json) {
    return QuantumTaskQueueInfo(
      position: (json['position'] as String?) ?? '',
      queue: QueueName.fromString((json['queue'] as String?) ?? ''),
      message: json['message'] as String?,
      queuePriority:
          (json['queuePriority'] as String?)?.let(QueuePriority.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final position = this.position;
    final queue = this.queue;
    final message = this.message;
    final queuePriority = this.queuePriority;
    return {
      'position': position,
      'queue': queue.value,
      if (message != null) 'message': message,
      if (queuePriority != null) 'queuePriority': queuePriority.value,
    };
  }
}

/// Contains metadata about the quantum task action, including the action type
/// and program statistics.
class ActionMetadata {
  /// The type of action associated with the quantum task.
  final String actionType;

  /// The number of executables in a program set. This is only available for a
  /// program set.
  final int? executableCount;

  /// The number of programs in a program set. This is only available for a
  /// program set.
  final int? programCount;

  ActionMetadata({
    required this.actionType,
    this.executableCount,
    this.programCount,
  });

  factory ActionMetadata.fromJson(Map<String, dynamic> json) {
    return ActionMetadata(
      actionType: (json['actionType'] as String?) ?? '',
      executableCount: json['executableCount'] as int?,
      programCount: json['programCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final actionType = this.actionType;
    final executableCount = this.executableCount;
    final programCount = this.programCount;
    return {
      'actionType': actionType,
      if (executableCount != null) 'executableCount': executableCount,
      if (programCount != null) 'programCount': programCount,
    };
  }
}

/// Enabled experimental capabilities for quantum hardware. Note that the use of
/// these features may impact device capabilities and performance beyond its
/// standard specifications.
class ExperimentalCapabilities {
  /// Enabled experimental capabilities.
  final ExperimentalCapabilitiesEnablementType? enabled;

  ExperimentalCapabilities({
    this.enabled,
  });

  factory ExperimentalCapabilities.fromJson(Map<String, dynamic> json) {
    return ExperimentalCapabilities(
      enabled: (json['enabled'] as String?)
          ?.let(ExperimentalCapabilitiesEnablementType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    return {
      if (enabled != null) 'enabled': enabled.value,
    };
  }
}

class ExperimentalCapabilitiesEnablementType {
  static const all = ExperimentalCapabilitiesEnablementType._('ALL');
  static const none = ExperimentalCapabilitiesEnablementType._('NONE');

  final String value;

  const ExperimentalCapabilitiesEnablementType._(this.value);

  static const values = [all, none];

  static ExperimentalCapabilitiesEnablementType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ExperimentalCapabilitiesEnablementType._(value));

  @override
  bool operator ==(other) =>
      other is ExperimentalCapabilitiesEnablementType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The Amazon Braket resource and the association type.
class Association {
  /// The Amazon Braket resource arn.
  final String arn;

  /// The association type for the specified Amazon Braket resource arn.
  final AssociationType type;

  Association({
    required this.arn,
    required this.type,
  });

  factory Association.fromJson(Map<String, dynamic> json) {
    return Association(
      arn: (json['arn'] as String?) ?? '',
      type: AssociationType.fromString((json['type'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final type = this.type;
    return {
      'arn': arn,
      'type': type.value,
    };
  }
}

class AssociationType {
  static const reservationTimeWindowArn =
      AssociationType._('RESERVATION_TIME_WINDOW_ARN');

  final String value;

  const AssociationType._(this.value);

  static const values = [reservationTimeWindowArn];

  static AssociationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AssociationType._(value));

  @override
  bool operator ==(other) => other is AssociationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class QueueName {
  static const quantumTasksQueue = QueueName._('QUANTUM_TASKS_QUEUE');
  static const jobsQueue = QueueName._('JOBS_QUEUE');

  final String value;

  const QueueName._(this.value);

  static const values = [quantumTasksQueue, jobsQueue];

  static QueueName fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => QueueName._(value));

  @override
  bool operator ==(other) => other is QueueName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class QueuePriority {
  static const normal = QueuePriority._('Normal');
  static const priority = QueuePriority._('Priority');

  final String value;

  const QueuePriority._(this.value);

  static const values = [normal, priority];

  static QueuePriority fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => QueuePriority._(value));

  @override
  bool operator ==(other) => other is QueuePriority && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class QuantumTaskAdditionalAttributeName {
  static const queueInfo = QuantumTaskAdditionalAttributeName._('QueueInfo');

  final String value;

  const QuantumTaskAdditionalAttributeName._(this.value);

  static const values = [queueInfo];

  static QuantumTaskAdditionalAttributeName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => QuantumTaskAdditionalAttributeName._(value));

  @override
  bool operator ==(other) =>
      other is QuantumTaskAdditionalAttributeName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Provides summary information about an Amazon Braket hybrid job.
class JobSummary {
  /// The time at which the Amazon Braket hybrid job was created.
  final DateTime createdAt;

  /// The primary device used by an Amazon Braket hybrid job.
  final String device;

  /// The ARN of the Amazon Braket hybrid job.
  final String jobArn;

  /// The name of the Amazon Braket hybrid job.
  final String jobName;

  /// The status of the Amazon Braket hybrid job.
  final JobPrimaryStatus status;

  /// The time at which the Amazon Braket hybrid job ended.
  final DateTime? endedAt;

  /// The time at which the Amazon Braket hybrid job was started.
  final DateTime? startedAt;

  /// Displays the key, value pairs of tags associated with this hybrid job.
  final Map<String, String>? tags;

  JobSummary({
    required this.createdAt,
    required this.device,
    required this.jobArn,
    required this.jobName,
    required this.status,
    this.endedAt,
    this.startedAt,
    this.tags,
  });

  factory JobSummary.fromJson(Map<String, dynamic> json) {
    return JobSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      device: (json['device'] as String?) ?? '',
      jobArn: (json['jobArn'] as String?) ?? '',
      jobName: (json['jobName'] as String?) ?? '',
      status: JobPrimaryStatus.fromString((json['status'] as String?) ?? ''),
      endedAt: timeStampFromJson(json['endedAt']),
      startedAt: timeStampFromJson(json['startedAt']),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final device = this.device;
    final jobArn = this.jobArn;
    final jobName = this.jobName;
    final status = this.status;
    final endedAt = this.endedAt;
    final startedAt = this.startedAt;
    final tags = this.tags;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'device': device,
      'jobArn': jobArn,
      'jobName': jobName,
      'status': status.value,
      if (endedAt != null) 'endedAt': iso8601ToJson(endedAt),
      if (startedAt != null) 'startedAt': iso8601ToJson(startedAt),
      if (tags != null) 'tags': tags,
    };
  }
}

class JobPrimaryStatus {
  static const queued = JobPrimaryStatus._('QUEUED');
  static const running = JobPrimaryStatus._('RUNNING');
  static const completed = JobPrimaryStatus._('COMPLETED');
  static const failed = JobPrimaryStatus._('FAILED');
  static const cancelling = JobPrimaryStatus._('CANCELLING');
  static const cancelled = JobPrimaryStatus._('CANCELLED');

  final String value;

  const JobPrimaryStatus._(this.value);

  static const values = [
    queued,
    running,
    completed,
    failed,
    cancelling,
    cancelled
  ];

  static JobPrimaryStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => JobPrimaryStatus._(value));

  @override
  bool operator ==(other) => other is JobPrimaryStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A filter used to search for Amazon Braket hybrid jobs.
class SearchJobsFilter {
  /// The name of the hybrid job parameter to filter based on. Filter name can be
  /// either <code>jobArn</code> or <code>createdAt</code>.
  final String name;

  /// An operator to use for the filter.
  final SearchJobsFilterOperator operator;

  /// The values used to filter hybrid jobs based on the filter name and operator.
  final List<String> values;

  SearchJobsFilter({
    required this.name,
    required this.operator,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final operator = this.operator;
    final values = this.values;
    return {
      'name': name,
      'operator': operator.value,
      'values': values,
    };
  }
}

class SearchJobsFilterOperator {
  static const lt = SearchJobsFilterOperator._('LT');
  static const lte = SearchJobsFilterOperator._('LTE');
  static const equal = SearchJobsFilterOperator._('EQUAL');
  static const gt = SearchJobsFilterOperator._('GT');
  static const gte = SearchJobsFilterOperator._('GTE');
  static const between = SearchJobsFilterOperator._('BETWEEN');
  static const contains = SearchJobsFilterOperator._('CONTAINS');

  final String value;

  const SearchJobsFilterOperator._(this.value);

  static const values = [lt, lte, equal, gt, gte, between, contains];

  static SearchJobsFilterOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SearchJobsFilterOperator._(value));

  @override
  bool operator ==(other) =>
      other is SearchJobsFilterOperator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specifies the path to the S3 location where you want to store hybrid job
/// artifacts and the encryption key used to store them.
class JobOutputDataConfig {
  /// Identifies the S3 path where you want Amazon Braket to store the hybrid job
  /// training artifacts. For example,
  /// <code>s3://bucket-name/key-name-prefix</code>.
  final String s3Path;

  /// The AWS Key Management Service (AWS KMS) key that Amazon Braket uses to
  /// encrypt the hybrid job training artifacts at rest using Amazon S3
  /// server-side encryption.
  final String? kmsKeyId;

  JobOutputDataConfig({
    required this.s3Path,
    this.kmsKeyId,
  });

  factory JobOutputDataConfig.fromJson(Map<String, dynamic> json) {
    return JobOutputDataConfig(
      s3Path: (json['s3Path'] as String?) ?? '',
      kmsKeyId: json['kmsKeyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Path = this.s3Path;
    final kmsKeyId = this.kmsKeyId;
    return {
      's3Path': s3Path,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
    };
  }
}

/// Specifies limits for how long an Amazon Braket hybrid job can run.
class JobStoppingCondition {
  /// The maximum length of time, in seconds, that an Amazon Braket hybrid job can
  /// run.
  final int? maxRuntimeInSeconds;

  JobStoppingCondition({
    this.maxRuntimeInSeconds,
  });

  factory JobStoppingCondition.fromJson(Map<String, dynamic> json) {
    return JobStoppingCondition(
      maxRuntimeInSeconds: json['maxRuntimeInSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final maxRuntimeInSeconds = this.maxRuntimeInSeconds;
    return {
      if (maxRuntimeInSeconds != null)
        'maxRuntimeInSeconds': maxRuntimeInSeconds,
    };
  }
}

/// Contains information about the output locations for hybrid job checkpoint
/// data.
class JobCheckpointConfig {
  /// Identifies the S3 path where you want Amazon Braket to store checkpoint
  /// data. For example, <code>s3://bucket-name/key-name-prefix</code>.
  final String s3Uri;

  /// (Optional) The local directory where checkpoint data is stored. The default
  /// directory is <code>/opt/braket/checkpoints/</code>.
  final String? localPath;

  JobCheckpointConfig({
    required this.s3Uri,
    this.localPath,
  });

  factory JobCheckpointConfig.fromJson(Map<String, dynamic> json) {
    return JobCheckpointConfig(
      s3Uri: (json['s3Uri'] as String?) ?? '',
      localPath: json['localPath'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Uri = this.s3Uri;
    final localPath = this.localPath;
    return {
      's3Uri': s3Uri,
      if (localPath != null) 'localPath': localPath,
    };
  }
}

/// Defines the Amazon Braket hybrid job to be created. Specifies the container
/// image the job uses and the paths to the Python scripts used for entry and
/// training.
class AlgorithmSpecification {
  /// The container image used to create an Amazon Braket hybrid job.
  final ContainerImage? containerImage;

  /// Configures the paths to the Python scripts used for entry and training.
  final ScriptModeConfig? scriptModeConfig;

  AlgorithmSpecification({
    this.containerImage,
    this.scriptModeConfig,
  });

  factory AlgorithmSpecification.fromJson(Map<String, dynamic> json) {
    return AlgorithmSpecification(
      containerImage: json['containerImage'] != null
          ? ContainerImage.fromJson(
              json['containerImage'] as Map<String, dynamic>)
          : null,
      scriptModeConfig: json['scriptModeConfig'] != null
          ? ScriptModeConfig.fromJson(
              json['scriptModeConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final containerImage = this.containerImage;
    final scriptModeConfig = this.scriptModeConfig;
    return {
      if (containerImage != null) 'containerImage': containerImage,
      if (scriptModeConfig != null) 'scriptModeConfig': scriptModeConfig,
    };
  }
}

/// Configures the resource instances to use while running the Amazon Braket
/// hybrid job on Amazon Braket.
class InstanceConfig {
  /// Configures the type of resource instances to use while running an Amazon
  /// Braket hybrid job.
  final InstanceType instanceType;

  /// The size of the storage volume, in GB, to provision.
  final int volumeSizeInGb;

  /// Configures the number of resource instances to use while running an Amazon
  /// Braket hybrid job on Amazon Braket. The default value is 1.
  final int? instanceCount;

  InstanceConfig({
    required this.instanceType,
    required this.volumeSizeInGb,
    this.instanceCount,
  });

  factory InstanceConfig.fromJson(Map<String, dynamic> json) {
    return InstanceConfig(
      instanceType:
          InstanceType.fromString((json['instanceType'] as String?) ?? ''),
      volumeSizeInGb: (json['volumeSizeInGb'] as int?) ?? 0,
      instanceCount: json['instanceCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceType = this.instanceType;
    final volumeSizeInGb = this.volumeSizeInGb;
    final instanceCount = this.instanceCount;
    return {
      'instanceType': instanceType.value,
      'volumeSizeInGb': volumeSizeInGb,
      if (instanceCount != null) 'instanceCount': instanceCount,
    };
  }
}

/// Configures the primary device used to create and run an Amazon Braket hybrid
/// job.
class DeviceConfig {
  /// The primary device ARN used to create and run an Amazon Braket hybrid job.
  final String device;

  DeviceConfig({
    required this.device,
  });

  factory DeviceConfig.fromJson(Map<String, dynamic> json) {
    return DeviceConfig(
      device: (json['device'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final device = this.device;
    return {
      'device': device,
    };
  }
}

/// Information about the queue for a specified hybrid job.
class HybridJobQueueInfo {
  /// Current position of the hybrid job in the jobs queue.
  final String position;

  /// The name of the queue.
  final QueueName queue;

  /// Optional. Provides more information about the queue position. For example,
  /// if the hybrid job is complete and no longer in the queue, the message field
  /// contains that information.
  final String? message;

  HybridJobQueueInfo({
    required this.position,
    required this.queue,
    this.message,
  });

  factory HybridJobQueueInfo.fromJson(Map<String, dynamic> json) {
    return HybridJobQueueInfo(
      position: (json['position'] as String?) ?? '',
      queue: QueueName.fromString((json['queue'] as String?) ?? ''),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final position = this.position;
    final queue = this.queue;
    final message = this.message;
    return {
      'position': position,
      'queue': queue.value,
      if (message != null) 'message': message,
    };
  }
}

/// Details about the type and time events that occurred related to the Amazon
/// Braket hybrid job.
class JobEventDetails {
  /// The type of event that occurred related to the Amazon Braket hybrid job.
  final JobEventType? eventType;

  /// A message describing the event that occurred related to the Amazon Braket
  /// hybrid job.
  final String? message;

  /// The time of the event that occurred related to the Amazon Braket hybrid job.
  final DateTime? timeOfEvent;

  JobEventDetails({
    this.eventType,
    this.message,
    this.timeOfEvent,
  });

  factory JobEventDetails.fromJson(Map<String, dynamic> json) {
    return JobEventDetails(
      eventType: (json['eventType'] as String?)?.let(JobEventType.fromString),
      message: json['message'] as String?,
      timeOfEvent: timeStampFromJson(json['timeOfEvent']),
    );
  }

  Map<String, dynamic> toJson() {
    final eventType = this.eventType;
    final message = this.message;
    final timeOfEvent = this.timeOfEvent;
    return {
      if (eventType != null) 'eventType': eventType.value,
      if (message != null) 'message': message,
      if (timeOfEvent != null) 'timeOfEvent': iso8601ToJson(timeOfEvent),
    };
  }
}

class JobEventType {
  static const waitingForPriority = JobEventType._('WAITING_FOR_PRIORITY');
  static const queuedForExecution = JobEventType._('QUEUED_FOR_EXECUTION');
  static const startingInstance = JobEventType._('STARTING_INSTANCE');
  static const downloadingData = JobEventType._('DOWNLOADING_DATA');
  static const running = JobEventType._('RUNNING');
  static const deprioritizedDueToInactivity =
      JobEventType._('DEPRIORITIZED_DUE_TO_INACTIVITY');
  static const uploadingResults = JobEventType._('UPLOADING_RESULTS');
  static const completed = JobEventType._('COMPLETED');
  static const failed = JobEventType._('FAILED');
  static const maxRuntimeExceeded = JobEventType._('MAX_RUNTIME_EXCEEDED');
  static const cancelled = JobEventType._('CANCELLED');

  final String value;

  const JobEventType._(this.value);

  static const values = [
    waitingForPriority,
    queuedForExecution,
    startingInstance,
    downloadingData,
    running,
    deprioritizedDueToInactivity,
    uploadingResults,
    completed,
    failed,
    maxRuntimeExceeded,
    cancelled
  ];

  static JobEventType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => JobEventType._(value));

  @override
  bool operator ==(other) => other is JobEventType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class InstanceType {
  static const mlT3Large = InstanceType._('ml.t3.large');
  static const mlT3Xlarge = InstanceType._('ml.t3.xlarge');
  static const mlT3_2xlarge = InstanceType._('ml.t3.2xlarge');
  static const mlM4Xlarge = InstanceType._('ml.m4.xlarge');
  static const mlM4_2xlarge = InstanceType._('ml.m4.2xlarge');
  static const mlM4_4xlarge = InstanceType._('ml.m4.4xlarge');
  static const mlM4_10xlarge = InstanceType._('ml.m4.10xlarge');
  static const mlM4_16xlarge = InstanceType._('ml.m4.16xlarge');
  static const mlM5Large = InstanceType._('ml.m5.large');
  static const mlM5Xlarge = InstanceType._('ml.m5.xlarge');
  static const mlM5_2xlarge = InstanceType._('ml.m5.2xlarge');
  static const mlM5_4xlarge = InstanceType._('ml.m5.4xlarge');
  static const mlM5_12xlarge = InstanceType._('ml.m5.12xlarge');
  static const mlM5_24xlarge = InstanceType._('ml.m5.24xlarge');
  static const mlC4Xlarge = InstanceType._('ml.c4.xlarge');
  static const mlC4_2xlarge = InstanceType._('ml.c4.2xlarge');
  static const mlC4_4xlarge = InstanceType._('ml.c4.4xlarge');
  static const mlC4_8xlarge = InstanceType._('ml.c4.8xlarge');
  static const mlC5Xlarge = InstanceType._('ml.c5.xlarge');
  static const mlC5_2xlarge = InstanceType._('ml.c5.2xlarge');
  static const mlC5_4xlarge = InstanceType._('ml.c5.4xlarge');
  static const mlC5_9xlarge = InstanceType._('ml.c5.9xlarge');
  static const mlC5_18xlarge = InstanceType._('ml.c5.18xlarge');
  static const mlC5nXlarge = InstanceType._('ml.c5n.xlarge');
  static const mlC5n_2xlarge = InstanceType._('ml.c5n.2xlarge');
  static const mlC5n_4xlarge = InstanceType._('ml.c5n.4xlarge');
  static const mlC5n_9xlarge = InstanceType._('ml.c5n.9xlarge');
  static const mlC5n_18xlarge = InstanceType._('ml.c5n.18xlarge');
  static const mlP2Xlarge = InstanceType._('ml.p2.xlarge');
  static const mlP2_8xlarge = InstanceType._('ml.p2.8xlarge');
  static const mlP2_16xlarge = InstanceType._('ml.p2.16xlarge');
  static const mlP3_2xlarge = InstanceType._('ml.p3.2xlarge');
  static const mlP3_8xlarge = InstanceType._('ml.p3.8xlarge');
  static const mlP3_16xlarge = InstanceType._('ml.p3.16xlarge');
  static const mlP3dn_24xlarge = InstanceType._('ml.p3dn.24xlarge');
  static const mlP4d_24xlarge = InstanceType._('ml.p4d.24xlarge');
  static const mlG4dnXlarge = InstanceType._('ml.g4dn.xlarge');
  static const mlG4dn_2xlarge = InstanceType._('ml.g4dn.2xlarge');
  static const mlG4dn_4xlarge = InstanceType._('ml.g4dn.4xlarge');
  static const mlG4dn_8xlarge = InstanceType._('ml.g4dn.8xlarge');
  static const mlG4dn_12xlarge = InstanceType._('ml.g4dn.12xlarge');
  static const mlG4dn_16xlarge = InstanceType._('ml.g4dn.16xlarge');
  static const mlG6Xlarge = InstanceType._('ml.g6.xlarge');
  static const mlG6_2xlarge = InstanceType._('ml.g6.2xlarge');
  static const mlG6_4xlarge = InstanceType._('ml.g6.4xlarge');
  static const mlG6_8xlarge = InstanceType._('ml.g6.8xlarge');
  static const mlG6_12xlarge = InstanceType._('ml.g6.12xlarge');
  static const mlG6_16xlarge = InstanceType._('ml.g6.16xlarge');
  static const mlG6_24xlarge = InstanceType._('ml.g6.24xlarge');
  static const mlG6_48xlarge = InstanceType._('ml.g6.48xlarge');
  static const mlG6eXlarge = InstanceType._('ml.g6e.xlarge');
  static const mlG6e_2xlarge = InstanceType._('ml.g6e.2xlarge');
  static const mlG6e_4xlarge = InstanceType._('ml.g6e.4xlarge');
  static const mlG6e_8xlarge = InstanceType._('ml.g6e.8xlarge');
  static const mlG6e_12xlarge = InstanceType._('ml.g6e.12xlarge');
  static const mlG6e_16xlarge = InstanceType._('ml.g6e.16xlarge');
  static const mlG6e_24xlarge = InstanceType._('ml.g6e.24xlarge');
  static const mlG6e_48xlarge = InstanceType._('ml.g6e.48xlarge');

  final String value;

  const InstanceType._(this.value);

  static const values = [
    mlT3Large,
    mlT3Xlarge,
    mlT3_2xlarge,
    mlM4Xlarge,
    mlM4_2xlarge,
    mlM4_4xlarge,
    mlM4_10xlarge,
    mlM4_16xlarge,
    mlM5Large,
    mlM5Xlarge,
    mlM5_2xlarge,
    mlM5_4xlarge,
    mlM5_12xlarge,
    mlM5_24xlarge,
    mlC4Xlarge,
    mlC4_2xlarge,
    mlC4_4xlarge,
    mlC4_8xlarge,
    mlC5Xlarge,
    mlC5_2xlarge,
    mlC5_4xlarge,
    mlC5_9xlarge,
    mlC5_18xlarge,
    mlC5nXlarge,
    mlC5n_2xlarge,
    mlC5n_4xlarge,
    mlC5n_9xlarge,
    mlC5n_18xlarge,
    mlP2Xlarge,
    mlP2_8xlarge,
    mlP2_16xlarge,
    mlP3_2xlarge,
    mlP3_8xlarge,
    mlP3_16xlarge,
    mlP3dn_24xlarge,
    mlP4d_24xlarge,
    mlG4dnXlarge,
    mlG4dn_2xlarge,
    mlG4dn_4xlarge,
    mlG4dn_8xlarge,
    mlG4dn_12xlarge,
    mlG4dn_16xlarge,
    mlG6Xlarge,
    mlG6_2xlarge,
    mlG6_4xlarge,
    mlG6_8xlarge,
    mlG6_12xlarge,
    mlG6_16xlarge,
    mlG6_24xlarge,
    mlG6_48xlarge,
    mlG6eXlarge,
    mlG6e_2xlarge,
    mlG6e_4xlarge,
    mlG6e_8xlarge,
    mlG6e_12xlarge,
    mlG6e_16xlarge,
    mlG6e_24xlarge,
    mlG6e_48xlarge
  ];

  static InstanceType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => InstanceType._(value));

  @override
  bool operator ==(other) => other is InstanceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information about algorithm scripts used for the Amazon Braket
/// hybrid job.
class ScriptModeConfig {
  /// The entry point in the algorithm scripts from where the execution begins in
  /// the hybrid job.
  final String entryPoint;

  /// The URI that specifies the S3 path to the algorithm scripts used by an
  /// Amazon Braket hybrid job.
  final String s3Uri;

  /// The type of compression used to store the algorithm scripts in Amazon S3
  /// storage.
  final CompressionType? compressionType;

  ScriptModeConfig({
    required this.entryPoint,
    required this.s3Uri,
    this.compressionType,
  });

  factory ScriptModeConfig.fromJson(Map<String, dynamic> json) {
    return ScriptModeConfig(
      entryPoint: (json['entryPoint'] as String?) ?? '',
      s3Uri: (json['s3Uri'] as String?) ?? '',
      compressionType:
          (json['compressionType'] as String?)?.let(CompressionType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final entryPoint = this.entryPoint;
    final s3Uri = this.s3Uri;
    final compressionType = this.compressionType;
    return {
      'entryPoint': entryPoint,
      's3Uri': s3Uri,
      if (compressionType != null) 'compressionType': compressionType.value,
    };
  }
}

/// The container image used to create an Amazon Braket hybrid job.
class ContainerImage {
  /// The URI locating the container image.
  final String uri;

  ContainerImage({
    required this.uri,
  });

  factory ContainerImage.fromJson(Map<String, dynamic> json) {
    return ContainerImage(
      uri: (json['uri'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final uri = this.uri;
    return {
      'uri': uri,
    };
  }
}

class CompressionType {
  static const none = CompressionType._('NONE');
  static const gzip = CompressionType._('GZIP');

  final String value;

  const CompressionType._(this.value);

  static const values = [none, gzip];

  static CompressionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CompressionType._(value));

  @override
  bool operator ==(other) => other is CompressionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A list of parameters that specify the input channels, type of input data,
/// and where it is located.
class InputFileConfig {
  /// A named input source that an Amazon Braket hybrid job can consume.
  final String channelName;

  /// The location of the input data.
  final DataSource dataSource;

  /// The MIME type of the data.
  final String? contentType;

  InputFileConfig({
    required this.channelName,
    required this.dataSource,
    this.contentType,
  });

  factory InputFileConfig.fromJson(Map<String, dynamic> json) {
    return InputFileConfig(
      channelName: (json['channelName'] as String?) ?? '',
      dataSource: DataSource.fromJson(
          (json['dataSource'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      contentType: json['contentType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelName = this.channelName;
    final dataSource = this.dataSource;
    final contentType = this.contentType;
    return {
      'channelName': channelName,
      'dataSource': dataSource,
      if (contentType != null) 'contentType': contentType,
    };
  }
}

/// Information about the source of the input data used by the Amazon Braket
/// hybrid job.
class DataSource {
  /// Amazon S3 path of the input data used by the hybrid job.
  final S3DataSource s3DataSource;

  DataSource({
    required this.s3DataSource,
  });

  factory DataSource.fromJson(Map<String, dynamic> json) {
    return DataSource(
      s3DataSource: S3DataSource.fromJson(
          (json['s3DataSource'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final s3DataSource = this.s3DataSource;
    return {
      's3DataSource': s3DataSource,
    };
  }
}

/// Information about the Amazon S3 storage used by the Amazon Braket hybrid
/// job.
class S3DataSource {
  /// Depending on the value specified for the <code>S3DataType</code>, identifies
  /// either a key name prefix or a manifest that locates the S3 data source.
  final String s3Uri;

  S3DataSource({
    required this.s3Uri,
  });

  factory S3DataSource.fromJson(Map<String, dynamic> json) {
    return S3DataSource(
      s3Uri: (json['s3Uri'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final s3Uri = this.s3Uri;
    return {
      's3Uri': s3Uri,
    };
  }
}

class HybridJobAdditionalAttributeName {
  static const queueInfo = HybridJobAdditionalAttributeName._('QueueInfo');

  final String value;

  const HybridJobAdditionalAttributeName._(this.value);

  static const values = [queueInfo];

  static HybridJobAdditionalAttributeName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => HybridJobAdditionalAttributeName._(value));

  @override
  bool operator ==(other) =>
      other is HybridJobAdditionalAttributeName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Includes information about the device.
class DeviceSummary {
  /// The ARN of the device.
  final String deviceArn;

  /// The name of the device.
  final String deviceName;

  /// The status of the device.
  final DeviceStatus deviceStatus;

  /// The type of the device.
  final DeviceType deviceType;

  /// The provider of the device.
  final String providerName;

  DeviceSummary({
    required this.deviceArn,
    required this.deviceName,
    required this.deviceStatus,
    required this.deviceType,
    required this.providerName,
  });

  factory DeviceSummary.fromJson(Map<String, dynamic> json) {
    return DeviceSummary(
      deviceArn: (json['deviceArn'] as String?) ?? '',
      deviceName: (json['deviceName'] as String?) ?? '',
      deviceStatus:
          DeviceStatus.fromString((json['deviceStatus'] as String?) ?? ''),
      deviceType: DeviceType.fromString((json['deviceType'] as String?) ?? ''),
      providerName: (json['providerName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final deviceArn = this.deviceArn;
    final deviceName = this.deviceName;
    final deviceStatus = this.deviceStatus;
    final deviceType = this.deviceType;
    final providerName = this.providerName;
    return {
      'deviceArn': deviceArn,
      'deviceName': deviceName,
      'deviceStatus': deviceStatus.value,
      'deviceType': deviceType.value,
      'providerName': providerName,
    };
  }
}

class DeviceType {
  static const qpu = DeviceType._('QPU');
  static const simulator = DeviceType._('SIMULATOR');

  final String value;

  const DeviceType._(this.value);

  static const values = [qpu, simulator];

  static DeviceType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => DeviceType._(value));

  @override
  bool operator ==(other) => other is DeviceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class DeviceStatus {
  static const online = DeviceStatus._('ONLINE');
  static const offline = DeviceStatus._('OFFLINE');
  static const retired = DeviceStatus._('RETIRED');

  final String value;

  const DeviceStatus._(this.value);

  static const values = [online, offline, retired];

  static DeviceStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => DeviceStatus._(value));

  @override
  bool operator ==(other) => other is DeviceStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The filter used to search for devices.
class SearchDevicesFilter {
  /// The name of the device parameter to filter based on. Only
  /// <code>deviceArn</code> filter name is currently supported.
  final String name;

  /// The values used to filter devices based on the filter name.
  final List<String> values;

  SearchDevicesFilter({
    required this.name,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'name': name,
      'values': values,
    };
  }
}

/// Information about quantum tasks and hybrid jobs queued on a device.
class DeviceQueueInfo {
  /// The name of the queue.
  final QueueName queue;

  /// The number of hybrid jobs or quantum tasks in the queue for a given device.
  final String queueSize;

  /// Optional. Specifies the priority of the queue. Quantum tasks in a priority
  /// queue are processed before the quantum tasks in a normal queue.
  final QueuePriority? queuePriority;

  DeviceQueueInfo({
    required this.queue,
    required this.queueSize,
    this.queuePriority,
  });

  factory DeviceQueueInfo.fromJson(Map<String, dynamic> json) {
    return DeviceQueueInfo(
      queue: QueueName.fromString((json['queue'] as String?) ?? ''),
      queueSize: (json['queueSize'] as String?) ?? '',
      queuePriority:
          (json['queuePriority'] as String?)?.let(QueuePriority.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final queue = this.queue;
    final queueSize = this.queueSize;
    final queuePriority = this.queuePriority;
    return {
      'queue': queue.value,
      'queueSize': queueSize,
      if (queuePriority != null) 'queuePriority': queuePriority.value,
    };
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

class DeviceOfflineException extends _s.GenericAwsException {
  DeviceOfflineException({String? type, String? message})
      : super(type: type, code: 'DeviceOfflineException', message: message);
}

class DeviceRetiredException extends _s.GenericAwsException {
  DeviceRetiredException({String? type, String? message})
      : super(type: type, code: 'DeviceRetiredException', message: message);
}

class InternalServiceException extends _s.GenericAwsException {
  InternalServiceException({String? type, String? message})
      : super(type: type, code: 'InternalServiceException', message: message);
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
  'DeviceOfflineException': (type, message) =>
      DeviceOfflineException(type: type, message: message),
  'DeviceRetiredException': (type, message) =>
      DeviceRetiredException(type: type, message: message),
  'InternalServiceException': (type, message) =>
      InternalServiceException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
