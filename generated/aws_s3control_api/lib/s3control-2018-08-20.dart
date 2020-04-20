// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show Uint8ListConverter, Uint8ListListConverter;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// AWS S3 Control provides access to Amazon S3 control plane operations.
class S3Control {
  final _s.RestXmlProtocol _protocol;
  S3Control({
    @_s.required String region,
    @_s.required _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestXmlProtocol(
          client: client,
          service: 's3-control',
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Creates an access point and associates it with the specified bucket.
  ///
  /// Parameter [accountId] :
  /// The AWS account ID for the owner of the bucket for which you want to
  /// create an access point.
  ///
  /// Parameter [bucket] :
  /// The name of the bucket that you want to associate this access point with.
  ///
  /// Parameter [name] :
  /// The name you want to assign to this access point.
  ///
  /// Parameter [vpcConfiguration] :
  /// If you include this field, Amazon S3 restricts access to this access point
  /// to requests from the specified Virtual Private Cloud (VPC).
  Future<void> createAccessPoint({
    @_s.required String accountId,
    @_s.required String bucket,
    @_s.required String name,
    PublicAccessBlockConfiguration publicAccessBlockConfiguration,
    VpcConfiguration vpcConfiguration,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
    );
    ArgumentError.checkNotNull(bucket, 'bucket');
    _s.validateStringLength(
      'bucket',
      bucket,
      3,
      255,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      3,
      50,
    );
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    await _protocol.send(
      method: 'PUT',
      requestUri: '/v20180820/accesspoint/$name',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates an Amazon S3 batch operations job.
  ///
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [IdempotencyException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [accountId] :
  /// <p/>
  ///
  /// Parameter [clientRequestToken] :
  /// An idempotency token to ensure that you don't accidentally submit the same
  /// request twice. You can use any string up to the maximum length.
  ///
  /// Parameter [manifest] :
  /// Configuration parameters for the manifest.
  ///
  /// Parameter [operation] :
  /// The operation that you want this job to perform on each object listed in
  /// the manifest. For more information about the available operations, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/batch-ops-operations.html">Available
  /// Operations</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// Parameter [priority] :
  /// The numerical priority for this job. Higher numbers indicate higher
  /// priority.
  ///
  /// Parameter [report] :
  /// Configuration parameters for the optional job-completion report.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) for the Identity and Access Management
  /// (IAM) Role that batch operations will use to execute this job's operation
  /// on each object in the manifest.
  ///
  /// Parameter [confirmationRequired] :
  /// Indicates whether confirmation is required before Amazon S3 runs the job.
  /// Confirmation is only required for jobs created through the Amazon S3
  /// console.
  ///
  /// Parameter [description] :
  /// A description for this job. You can use any string within the permitted
  /// length. Descriptions don't need to be unique and can be used for multiple
  /// jobs.
  ///
  /// Parameter [tags] :
  /// An optional set of tags to associate with the job when it is created.
  Future<CreateJobResult> createJob({
    @_s.required String accountId,
    @_s.required String clientRequestToken,
    @_s.required JobManifest manifest,
    @_s.required JobOperation operation,
    @_s.required int priority,
    @_s.required JobReport report,
    @_s.required String roleArn,
    bool confirmationRequired,
    String description,
    List<S3Tag> tags,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
    );
    ArgumentError.checkNotNull(clientRequestToken, 'clientRequestToken');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
    );
    ArgumentError.checkNotNull(manifest, 'manifest');
    ArgumentError.checkNotNull(operation, 'operation');
    ArgumentError.checkNotNull(priority, 'priority');
    _s.validateNumRange(
      'priority',
      priority,
      0,
      2147483647,
    );
    ArgumentError.checkNotNull(report, 'report');
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringLength(
      'roleArn',
      roleArn,
      1,
      2048,
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      256,
    );
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    final $result = await _protocol.send(
      method: 'POST',
      requestUri: '/v20180820/jobs',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateJobResult.fromXml($result.body);
  }

  /// Deletes the specified access point.
  ///
  /// Parameter [accountId] :
  /// The account ID for the account that owns the specified access point.
  ///
  /// Parameter [name] :
  /// The name of the access point you want to delete.
  Future<void> deleteAccessPoint({
    @_s.required String accountId,
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      3,
      50,
    );
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    await _protocol.send(
      method: 'DELETE',
      requestUri: '/v20180820/accesspoint/$name',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the access point policy for the specified access point.
  ///
  /// Parameter [accountId] :
  /// The account ID for the account that owns the specified access point.
  ///
  /// Parameter [name] :
  /// The name of the access point whose policy you want to delete.
  Future<void> deleteAccessPointPolicy({
    @_s.required String accountId,
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      3,
      50,
    );
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    await _protocol.send(
      method: 'DELETE',
      requestUri: '/v20180820/accesspoint/$name/policy',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Delete the tags on a Amazon S3 batch operations job, if any.
  ///
  /// May throw [InternalServiceException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [accountId] :
  /// The account ID for the Amazon Web Services account associated with the
  /// Amazon S3 batch operations job you want to remove tags from.
  ///
  /// Parameter [jobId] :
  /// The ID for the job whose tags you want to delete.
  Future<void> deleteJobTagging({
    @_s.required String accountId,
    @_s.required String jobId,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
    );
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      5,
      36,
    );
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    await _protocol.send(
      method: 'DELETE',
      requestUri: '/v20180820/jobs/$jobId/tagging',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes the <code>PublicAccessBlock</code> configuration for an Amazon Web
  /// Services account.
  ///
  /// Parameter [accountId] :
  /// The account ID for the Amazon Web Services account whose
  /// <code>PublicAccessBlock</code> configuration you want to remove.
  Future<void> deletePublicAccessBlock({
    @_s.required String accountId,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
    );
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    await _protocol.send(
      method: 'DELETE',
      requestUri: '/v20180820/configuration/publicAccessBlock',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves the configuration parameters and status for a batch operations
  /// job.
  ///
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotFoundException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [accountId] :
  /// <p/>
  ///
  /// Parameter [jobId] :
  /// The ID for the job whose information you want to retrieve.
  Future<DescribeJobResult> describeJob({
    @_s.required String accountId,
    @_s.required String jobId,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
    );
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      5,
      36,
    );
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/v20180820/jobs/$jobId',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeJobResult.fromXml($result.body);
  }

  /// Returns configuration information about the specified access point.
  ///
  /// Parameter [accountId] :
  /// The account ID for the account that owns the specified access point.
  ///
  /// Parameter [name] :
  /// The name of the access point whose configuration information you want to
  /// retrieve.
  Future<GetAccessPointResult> getAccessPoint({
    @_s.required String accountId,
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      3,
      50,
    );
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/v20180820/accesspoint/$name',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetAccessPointResult.fromXml($result.body);
  }

  /// Returns the access point policy associated with the specified access
  /// point.
  ///
  /// Parameter [accountId] :
  /// The account ID for the account that owns the specified access point.
  ///
  /// Parameter [name] :
  /// The name of the access point whose policy you want to retrieve.
  Future<GetAccessPointPolicyResult> getAccessPointPolicy({
    @_s.required String accountId,
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      3,
      50,
    );
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/v20180820/accesspoint/$name/policy',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetAccessPointPolicyResult.fromXml($result.body);
  }

  /// Indicates whether the specified access point currently has a policy that
  /// allows public access. For more information about public access through
  /// access points, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-points.html">Managing
  /// Data Access with Amazon S3 Access Points</a> in the <i>Amazon Simple
  /// Storage Service Developer Guide</i>.
  ///
  /// Parameter [accountId] :
  /// The account ID for the account that owns the specified access point.
  ///
  /// Parameter [name] :
  /// The name of the access point whose policy status you want to retrieve.
  Future<GetAccessPointPolicyStatusResult> getAccessPointPolicyStatus({
    @_s.required String accountId,
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      3,
      50,
    );
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/v20180820/accesspoint/$name/policyStatus',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetAccessPointPolicyStatusResult.fromXml($result.body);
  }

  /// Retrieve the tags on a Amazon S3 batch operations job.
  ///
  /// May throw [InternalServiceException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [accountId] :
  /// The account ID for the Amazon Web Services account associated with the
  /// Amazon S3 batch operations job you want to retrieve tags for.
  ///
  /// Parameter [jobId] :
  /// The ID for the job whose tags you want to retrieve.
  Future<GetJobTaggingResult> getJobTagging({
    @_s.required String accountId,
    @_s.required String jobId,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
    );
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      5,
      36,
    );
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/v20180820/jobs/$jobId/tagging',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetJobTaggingResult.fromXml($result.body);
  }

  /// Retrieves the <code>PublicAccessBlock</code> configuration for an Amazon
  /// Web Services account.
  ///
  /// May throw [NoSuchPublicAccessBlockConfiguration].
  ///
  /// Parameter [accountId] :
  /// The account ID for the Amazon Web Services account whose
  /// <code>PublicAccessBlock</code> configuration you want to retrieve.
  Future<GetPublicAccessBlockOutput> getPublicAccessBlock({
    @_s.required String accountId,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
    );
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/v20180820/configuration/publicAccessBlock',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetPublicAccessBlockOutput.fromXml($result.body);
  }

  /// Returns a list of the access points currently associated with the
  /// specified bucket. You can retrieve up to 1000 access points per call. If
  /// the specified bucket has more than 1000 access points (or the number
  /// specified in <code>maxResults</code>, whichever is less), then the
  /// response will include a continuation token that you can use to list the
  /// additional access points.
  ///
  /// Parameter [accountId] :
  /// The AWS account ID for owner of the bucket whose access points you want to
  /// list.
  ///
  /// Parameter [bucket] :
  /// The name of the bucket whose associated access points you want to list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of access points that you want to include in the list.
  /// If the specified bucket has more than this number of access points, then
  /// the response will include a continuation token in the
  /// <code>NextToken</code> field that you can use to retrieve the next page of
  /// access points.
  ///
  /// Parameter [nextToken] :
  /// A continuation token. If a previous call to <code>ListAccessPoints</code>
  /// returned a continuation token in the <code>NextToken</code> field, then
  /// providing that value here causes Amazon S3 to retrieve the next page of
  /// results.
  Future<ListAccessPointsResult> listAccessPoints({
    @_s.required String accountId,
    String bucket,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
    );
    _s.validateStringLength(
      'bucket',
      bucket,
      3,
      255,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    final queryParams = <String, String>{};
    bucket?.let((v) => queryParams['bucket'] = v.toString());
    maxResults?.let((v) => queryParams['maxResults'] = v.toString());
    nextToken?.let((v) => queryParams['nextToken'] = v.toString());
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/v20180820/accesspoint',
      queryParams: queryParams,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListAccessPointsResult.fromXml($result.body);
  }

  /// Lists current jobs and jobs that have ended within the last 30 days for
  /// the AWS account making the request.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [accountId] :
  /// <p/>
  ///
  /// Parameter [jobStatuses] :
  /// The <code>List Jobs</code> request returns jobs that match the statuses
  /// listed in this element.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of jobs that Amazon S3 will include in the <code>List
  /// Jobs</code> response. If there are more jobs than this number, the
  /// response will include a pagination token in the <code>NextToken</code>
  /// field to enable you to retrieve the next page of results.
  ///
  /// Parameter [nextToken] :
  /// A pagination token to request the next page of results. Use the token that
  /// Amazon S3 returned in the <code>NextToken</code> element of the
  /// <code>ListJobsResult</code> from the previous <code>List Jobs</code>
  /// request.
  Future<ListJobsResult> listJobs({
    @_s.required String accountId,
    List<String> jobStatuses,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    final queryParams = <String, String>{};
    jobStatuses?.let((v) => queryParams['jobStatuses'] = v.toString());
    maxResults?.let((v) => queryParams['maxResults'] = v.toString());
    nextToken?.let((v) => queryParams['nextToken'] = v.toString());
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/v20180820/jobs',
      queryParams: queryParams,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListJobsResult.fromXml($result.body);
  }

  /// Associates an access policy with the specified access point. Each access
  /// point can have only one policy, so a request made to this API replaces any
  /// existing policy associated with the specified access point.
  ///
  /// Parameter [accountId] :
  /// The AWS account ID for owner of the bucket associated with the specified
  /// access point.
  ///
  /// Parameter [name] :
  /// The name of the access point that you want to associate with the specified
  /// policy.
  ///
  /// Parameter [policy] :
  /// The policy that you want to apply to the specified access point. For more
  /// information about access point policies, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-points.html">Managing
  /// Data Access with Amazon S3 Access Points</a> in the <i>Amazon Simple
  /// Storage Service Developer Guide</i>.
  Future<void> putAccessPointPolicy({
    @_s.required String accountId,
    @_s.required String name,
    @_s.required String policy,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      3,
      50,
    );
    ArgumentError.checkNotNull(policy, 'policy');
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    await _protocol.send(
      method: 'PUT',
      requestUri: '/v20180820/accesspoint/$name/policy',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Replace the set of tags on a Amazon S3 batch operations job.
  ///
  /// May throw [InternalServiceException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotFoundException].
  /// May throw [TooManyTagsException].
  ///
  /// Parameter [accountId] :
  /// The account ID for the Amazon Web Services account associated with the
  /// Amazon S3 batch operations job you want to replace tags on.
  ///
  /// Parameter [jobId] :
  /// The ID for the job whose tags you want to replace.
  ///
  /// Parameter [tags] :
  /// The set of tags to associate with the job.
  Future<void> putJobTagging({
    @_s.required String accountId,
    @_s.required String jobId,
    @_s.required List<S3Tag> tags,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
    );
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      5,
      36,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    await _protocol.send(
      method: 'PUT',
      requestUri: '/v20180820/jobs/$jobId/tagging',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates or modifies the <code>PublicAccessBlock</code> configuration for
  /// an Amazon Web Services account.
  ///
  /// Parameter [accountId] :
  /// The account ID for the Amazon Web Services account whose
  /// <code>PublicAccessBlock</code> configuration you want to set.
  ///
  /// Parameter [publicAccessBlockConfiguration] :
  /// The <code>PublicAccessBlock</code> configuration that you want to apply to
  /// the specified Amazon Web Services account.
  Future<void> putPublicAccessBlock({
    @_s.required String accountId,
    @_s.required PublicAccessBlockConfiguration publicAccessBlockConfiguration,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
    );
    ArgumentError.checkNotNull(
        publicAccessBlockConfiguration, 'publicAccessBlockConfiguration');
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    await _protocol.send(
      method: 'PUT',
      requestUri: '/v20180820/configuration/publicAccessBlock',
      headers: headers,
      payload: publicAccessBlockConfiguration
          .toXml('PublicAccessBlockConfiguration'),
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates an existing job's priority.
  ///
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotFoundException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [accountId] :
  /// <p/>
  ///
  /// Parameter [jobId] :
  /// The ID for the job whose priority you want to update.
  ///
  /// Parameter [priority] :
  /// The priority you want to assign to this job.
  Future<UpdateJobPriorityResult> updateJobPriority({
    @_s.required String accountId,
    @_s.required String jobId,
    @_s.required int priority,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
    );
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      5,
      36,
    );
    ArgumentError.checkNotNull(priority, 'priority');
    _s.validateNumRange(
      'priority',
      priority,
      0,
      2147483647,
    );
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    final queryParams = <String, String>{};
    priority?.let((v) => queryParams['priority'] = v.toString());
    final $result = await _protocol.send(
      method: 'POST',
      requestUri: '/v20180820/jobs/$jobId/priority',
      queryParams: queryParams,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return UpdateJobPriorityResult.fromXml($result.body);
  }

  /// Updates the status for the specified job. Use this operation to confirm
  /// that you want to run a job or to cancel an existing job.
  ///
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotFoundException].
  /// May throw [JobStatusException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [accountId] :
  /// <p/>
  ///
  /// Parameter [jobId] :
  /// The ID of the job whose status you want to update.
  ///
  /// Parameter [requestedJobStatus] :
  /// The status that you want to move the specified job to.
  ///
  /// Parameter [statusUpdateReason] :
  /// A description of the reason why you want to change the specified job's
  /// status. This field can be any string up to the maximum length.
  Future<UpdateJobStatusResult> updateJobStatus({
    @_s.required String accountId,
    @_s.required String jobId,
    @_s.required RequestedJobStatus requestedJobStatus,
    String statusUpdateReason,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
    );
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      5,
      36,
    );
    ArgumentError.checkNotNull(requestedJobStatus, 'requestedJobStatus');
    _s.validateStringLength(
      'statusUpdateReason',
      statusUpdateReason,
      1,
      256,
    );
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    final queryParams = <String, String>{};
    requestedJobStatus
        ?.let((v) => queryParams['requestedJobStatus'] = v.toString());
    statusUpdateReason
        ?.let((v) => queryParams['statusUpdateReason'] = v.toString());
    final $result = await _protocol.send(
      method: 'POST',
      requestUri: '/v20180820/jobs/$jobId/status',
      queryParams: queryParams,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return UpdateJobStatusResult.fromXml($result.body);
  }
}

/// An access point used to access a bucket.
class AccessPoint {
  /// The name of the bucket associated with this access point.
  final String bucket;

  /// The name of this access point.
  final String name;

  /// Indicates whether this access point allows access from the public Internet.
  /// If <code>VpcConfiguration</code> is specified for this access point, then
  /// <code>NetworkOrigin</code> is <code>VPC</code>, and the access point doesn't
  /// allow access from the public Internet. Otherwise, <code>NetworkOrigin</code>
  /// is <code>Internet</code>, and the access point allows access from the public
  /// Internet, subject to the access point and bucket access policies.
  final NetworkOrigin networkOrigin;

  /// The Virtual Private Cloud (VPC) configuration for this access point, if one
  /// exists.
  final VpcConfiguration vpcConfiguration;

  AccessPoint({
    @_s.required this.bucket,
    @_s.required this.name,
    @_s.required this.networkOrigin,
    this.vpcConfiguration,
  });
  factory AccessPoint.fromXml(_s.XmlElement elem) {
    return AccessPoint(
      bucket: _s.extractXmlStringValue(elem, 'Bucket'),
      name: _s.extractXmlStringValue(elem, 'Name'),
      networkOrigin:
          _s.extractXmlStringValue(elem, 'NetworkOrigin')?.toNetworkOrigin(),
      vpcConfiguration: _s
          .extractXmlChild(elem, 'VpcConfiguration')
          ?.let((e) => VpcConfiguration.fromXml(e)),
    );
  }
}

class CreateJobResult {
  /// The ID for this job. Amazon S3 generates this ID automatically and returns
  /// it after a successful <code>Create Job</code> request.
  final String jobId;

  CreateJobResult({
    this.jobId,
  });
  factory CreateJobResult.fromXml(_s.XmlElement elem) {
    return CreateJobResult(
      jobId: _s.extractXmlStringValue(elem, 'JobId'),
    );
  }
}

class DeleteJobTaggingResult {
  DeleteJobTaggingResult();
  factory DeleteJobTaggingResult.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeleteJobTaggingResult();
  }
}

class DescribeJobResult {
  /// Contains the configuration parameters and status for the job specified in
  /// the <code>Describe Job</code> request.
  final JobDescriptor job;

  DescribeJobResult({
    this.job,
  });
  factory DescribeJobResult.fromXml(_s.XmlElement elem) {
    return DescribeJobResult(
      job:
          _s.extractXmlChild(elem, 'Job')?.let((e) => JobDescriptor.fromXml(e)),
    );
  }
}

class GetAccessPointPolicyResult {
  /// The access point policy associated with the specified access point.
  final String policy;

  GetAccessPointPolicyResult({
    this.policy,
  });
  factory GetAccessPointPolicyResult.fromXml(_s.XmlElement elem) {
    return GetAccessPointPolicyResult(
      policy: _s.extractXmlStringValue(elem, 'Policy'),
    );
  }
}

class GetAccessPointPolicyStatusResult {
  /// Indicates the current policy status of the specified access point.
  final PolicyStatus policyStatus;

  GetAccessPointPolicyStatusResult({
    this.policyStatus,
  });
  factory GetAccessPointPolicyStatusResult.fromXml(_s.XmlElement elem) {
    return GetAccessPointPolicyStatusResult(
      policyStatus: _s
          .extractXmlChild(elem, 'PolicyStatus')
          ?.let((e) => PolicyStatus.fromXml(e)),
    );
  }
}

class GetAccessPointResult {
  /// The name of the bucket associated with the specified access point.
  final String bucket;

  /// The date and time when the specified access point was created.
  final DateTime creationDate;

  /// The name of the specified access point.
  final String name;

  /// Indicates whether this access point allows access from the public Internet.
  /// If <code>VpcConfiguration</code> is specified for this access point, then
  /// <code>NetworkOrigin</code> is <code>VPC</code>, and the access point doesn't
  /// allow access from the public Internet. Otherwise, <code>NetworkOrigin</code>
  /// is <code>Internet</code>, and the access point allows access from the public
  /// Internet, subject to the access point and bucket access policies.
  final NetworkOrigin networkOrigin;
  final PublicAccessBlockConfiguration publicAccessBlockConfiguration;

  /// Contains the Virtual Private Cloud (VPC) configuration for the specified
  /// access point.
  final VpcConfiguration vpcConfiguration;

  GetAccessPointResult({
    this.bucket,
    this.creationDate,
    this.name,
    this.networkOrigin,
    this.publicAccessBlockConfiguration,
    this.vpcConfiguration,
  });
  factory GetAccessPointResult.fromXml(_s.XmlElement elem) {
    return GetAccessPointResult(
      bucket: _s.extractXmlStringValue(elem, 'Bucket'),
      creationDate: _s.extractXmlDateTimeValue(elem, 'CreationDate'),
      name: _s.extractXmlStringValue(elem, 'Name'),
      networkOrigin:
          _s.extractXmlStringValue(elem, 'NetworkOrigin')?.toNetworkOrigin(),
      publicAccessBlockConfiguration: _s
          .extractXmlChild(elem, 'PublicAccessBlockConfiguration')
          ?.let((e) => PublicAccessBlockConfiguration.fromXml(e)),
      vpcConfiguration: _s
          .extractXmlChild(elem, 'VpcConfiguration')
          ?.let((e) => VpcConfiguration.fromXml(e)),
    );
  }
}

class GetJobTaggingResult {
  /// The set of tags associated with the job.
  final List<S3Tag> tags;

  GetJobTaggingResult({
    this.tags,
  });
  factory GetJobTaggingResult.fromXml(_s.XmlElement elem) {
    return GetJobTaggingResult(
      tags: _s.extractXmlChild(elem, 'Tags')?.let((elem) =>
          elem.findElements('Tags').map((c) => S3Tag.fromXml(c)).toList()),
    );
  }
}

class GetPublicAccessBlockOutput {
  /// The <code>PublicAccessBlock</code> configuration currently in effect for
  /// this Amazon Web Services account.
  final PublicAccessBlockConfiguration publicAccessBlockConfiguration;

  GetPublicAccessBlockOutput({
    this.publicAccessBlockConfiguration,
  });
  factory GetPublicAccessBlockOutput.fromXml(_s.XmlElement elem) {
    return GetPublicAccessBlockOutput(
      publicAccessBlockConfiguration: _s
          .extractXmlChild(elem, 'PublicAccessBlockConfiguration')
          ?.let((e) => PublicAccessBlockConfiguration.fromXml(e)),
    );
  }
}

/// A container element for the job configuration and status information
/// returned by a <code>Describe Job</code> request.
class JobDescriptor {
  /// Indicates whether confirmation is required before Amazon S3 begins running
  /// the specified job. Confirmation is required only for jobs created through
  /// the Amazon S3 console.
  final bool confirmationRequired;

  /// A timestamp indicating when this job was created.
  final DateTime creationTime;

  /// The description for this job, if one was provided in this job's <code>Create
  /// Job</code> request.
  final String description;

  /// If the specified job failed, this field contains information describing the
  /// failure.
  final List<JobFailure> failureReasons;

  /// The Amazon Resource Name (ARN) for this job.
  final String jobArn;

  /// The ID for the specified job.
  final String jobId;

  /// The configuration information for the specified job's manifest object.
  final JobManifest manifest;

  /// The operation that the specified job is configured to execute on the objects
  /// listed in the manifest.
  final JobOperation operation;

  /// The priority of the specified job.
  final int priority;

  /// Describes the total number of tasks that the specified job has executed, the
  /// number of tasks that succeeded, and the number of tasks that failed.
  final JobProgressSummary progressSummary;

  /// Contains the configuration information for the job-completion report if you
  /// requested one in the <code>Create Job</code> request.
  final JobReport report;

  /// The Amazon Resource Name (ARN) for the Identity and Access Management (IAM)
  /// Role assigned to execute the tasks for this job.
  final String roleArn;

  /// The current status of the specified job.
  final JobStatus status;

  /// <p/>
  final String statusUpdateReason;

  /// The reason why the specified job was suspended. A job is only suspended if
  /// you create it through the Amazon S3 console. When you create the job, it
  /// enters the <code>Suspended</code> state to await confirmation before
  /// running. After you confirm the job, it automatically exits the
  /// <code>Suspended</code> state.
  final String suspendedCause;

  /// The timestamp when this job was suspended, if it has been suspended.
  final DateTime suspendedDate;

  /// A timestamp indicating when this job terminated. A job's termination date is
  /// the date and time when it succeeded, failed, or was canceled.
  final DateTime terminationDate;

  JobDescriptor({
    this.confirmationRequired,
    this.creationTime,
    this.description,
    this.failureReasons,
    this.jobArn,
    this.jobId,
    this.manifest,
    this.operation,
    this.priority,
    this.progressSummary,
    this.report,
    this.roleArn,
    this.status,
    this.statusUpdateReason,
    this.suspendedCause,
    this.suspendedDate,
    this.terminationDate,
  });
  factory JobDescriptor.fromXml(_s.XmlElement elem) {
    return JobDescriptor(
      confirmationRequired:
          _s.extractXmlBoolValue(elem, 'ConfirmationRequired'),
      creationTime: _s.extractXmlDateTimeValue(elem, 'CreationTime'),
      description: _s.extractXmlStringValue(elem, 'Description'),
      failureReasons: _s.extractXmlChild(elem, 'FailureReasons')?.let((elem) =>
          elem
              .findElements('FailureReasons')
              .map((c) => JobFailure.fromXml(c))
              .toList()),
      jobArn: _s.extractXmlStringValue(elem, 'JobArn'),
      jobId: _s.extractXmlStringValue(elem, 'JobId'),
      manifest: _s
          .extractXmlChild(elem, 'Manifest')
          ?.let((e) => JobManifest.fromXml(e)),
      operation: _s
          .extractXmlChild(elem, 'Operation')
          ?.let((e) => JobOperation.fromXml(e)),
      priority: _s.extractXmlIntValue(elem, 'Priority'),
      progressSummary: _s
          .extractXmlChild(elem, 'ProgressSummary')
          ?.let((e) => JobProgressSummary.fromXml(e)),
      report:
          _s.extractXmlChild(elem, 'Report')?.let((e) => JobReport.fromXml(e)),
      roleArn: _s.extractXmlStringValue(elem, 'RoleArn'),
      status: _s.extractXmlStringValue(elem, 'Status')?.toJobStatus(),
      statusUpdateReason: _s.extractXmlStringValue(elem, 'StatusUpdateReason'),
      suspendedCause: _s.extractXmlStringValue(elem, 'SuspendedCause'),
      suspendedDate: _s.extractXmlDateTimeValue(elem, 'SuspendedDate'),
      terminationDate: _s.extractXmlDateTimeValue(elem, 'TerminationDate'),
    );
  }
}

/// If this job failed, this element indicates why the job failed.
class JobFailure {
  /// The failure code, if any, for the specified job.
  final String failureCode;

  /// The failure reason, if any, for the specified job.
  final String failureReason;

  JobFailure({
    this.failureCode,
    this.failureReason,
  });
  factory JobFailure.fromXml(_s.XmlElement elem) {
    return JobFailure(
      failureCode: _s.extractXmlStringValue(elem, 'FailureCode'),
      failureReason: _s.extractXmlStringValue(elem, 'FailureReason'),
    );
  }
}

/// Contains the configuration and status information for a single job retrieved
/// as part of a job list.
class JobListDescriptor {
  /// A timestamp indicating when the specified job was created.
  final DateTime creationTime;

  /// The user-specified description that was included in the specified job's
  /// <code>Create Job</code> request.
  final String description;

  /// The ID for the specified job.
  final String jobId;

  /// The operation that the specified job is configured to run on each object
  /// listed in the manifest.
  final OperationName operation;

  /// The current priority for the specified job.
  final int priority;

  /// Describes the total number of tasks that the specified job has executed, the
  /// number of tasks that succeeded, and the number of tasks that failed.
  final JobProgressSummary progressSummary;

  /// The specified job's current status.
  final JobStatus status;

  /// A timestamp indicating when the specified job terminated. A job's
  /// termination date is the date and time when it succeeded, failed, or was
  /// canceled.
  final DateTime terminationDate;

  JobListDescriptor({
    this.creationTime,
    this.description,
    this.jobId,
    this.operation,
    this.priority,
    this.progressSummary,
    this.status,
    this.terminationDate,
  });
  factory JobListDescriptor.fromXml(_s.XmlElement elem) {
    return JobListDescriptor(
      creationTime: _s.extractXmlDateTimeValue(elem, 'CreationTime'),
      description: _s.extractXmlStringValue(elem, 'Description'),
      jobId: _s.extractXmlStringValue(elem, 'JobId'),
      operation: _s.extractXmlStringValue(elem, 'Operation')?.toOperationName(),
      priority: _s.extractXmlIntValue(elem, 'Priority'),
      progressSummary: _s
          .extractXmlChild(elem, 'ProgressSummary')
          ?.let((e) => JobProgressSummary.fromXml(e)),
      status: _s.extractXmlStringValue(elem, 'Status')?.toJobStatus(),
      terminationDate: _s.extractXmlDateTimeValue(elem, 'TerminationDate'),
    );
  }
}

/// Contains the configuration information for a job's manifest.
class JobManifest {
  /// Contains the information required to locate the specified job's manifest.
  final JobManifestLocation location;

  /// Describes the format of the specified job's manifest. If the manifest is in
  /// CSV format, also describes the columns contained within the manifest.
  final JobManifestSpec spec;

  JobManifest({
    @_s.required this.location,
    @_s.required this.spec,
  });
  factory JobManifest.fromXml(_s.XmlElement elem) {
    return JobManifest(
      location: _s
          .extractXmlChild(elem, 'Location')
          ?.let((e) => JobManifestLocation.fromXml(e)),
      spec: _s
          .extractXmlChild(elem, 'Spec')
          ?.let((e) => JobManifestSpec.fromXml(e)),
    );
  }

  _s.XmlElement toXml(String elemName) {
    final $children = <_s.XmlNode>[
      location.toXml('Location'),
      spec.toXml('Spec'),
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      [],
      $children.where((e) => e != null),
    );
  }
}

enum JobManifestFieldName {
  ignore,
  bucket,
  key,
  versionId,
}

extension on JobManifestFieldName {
  String toValue() {
    switch (this) {
      case JobManifestFieldName.ignore:
        return 'Ignore';
      case JobManifestFieldName.bucket:
        return 'Bucket';
      case JobManifestFieldName.key:
        return 'Key';
      case JobManifestFieldName.versionId:
        return 'VersionId';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  JobManifestFieldName toJobManifestFieldName() {
    switch (this) {
      case 'Ignore':
        return JobManifestFieldName.ignore;
      case 'Bucket':
        return JobManifestFieldName.bucket;
      case 'Key':
        return JobManifestFieldName.key;
      case 'VersionId':
        return JobManifestFieldName.versionId;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum JobManifestFormat {
  s3BatchOperationsCsv_20180820,
  s3InventoryReportCsv_20161130,
}

extension on JobManifestFormat {
  String toValue() {
    switch (this) {
      case JobManifestFormat.s3BatchOperationsCsv_20180820:
        return 'S3BatchOperations_CSV_20180820';
      case JobManifestFormat.s3InventoryReportCsv_20161130:
        return 'S3InventoryReport_CSV_20161130';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  JobManifestFormat toJobManifestFormat() {
    switch (this) {
      case 'S3BatchOperations_CSV_20180820':
        return JobManifestFormat.s3BatchOperationsCsv_20180820;
      case 'S3InventoryReport_CSV_20161130':
        return JobManifestFormat.s3InventoryReportCsv_20161130;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Contains the information required to locate a manifest object.
class JobManifestLocation {
  /// The ETag for the specified manifest object.
  final String eTag;

  /// The Amazon Resource Name (ARN) for a manifest object.
  final String objectArn;

  /// The optional version ID to identify a specific version of the manifest
  /// object.
  final String objectVersionId;

  JobManifestLocation({
    @_s.required this.eTag,
    @_s.required this.objectArn,
    this.objectVersionId,
  });
  factory JobManifestLocation.fromXml(_s.XmlElement elem) {
    return JobManifestLocation(
      eTag: _s.extractXmlStringValue(elem, 'ETag'),
      objectArn: _s.extractXmlStringValue(elem, 'ObjectArn'),
      objectVersionId: _s.extractXmlStringValue(elem, 'ObjectVersionId'),
    );
  }

  _s.XmlElement toXml(String elemName) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('ETag', eTag),
      _s.encodeXmlStringValue('ObjectArn', objectArn),
      _s.encodeXmlStringValue('ObjectVersionId', objectVersionId),
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      [],
      $children.where((e) => e != null),
    );
  }
}

/// Describes the format of a manifest. If the manifest is in CSV format, also
/// describes the columns contained within the manifest.
class JobManifestSpec {
  /// Indicates which of the available formats the specified manifest uses.
  final JobManifestFormat format;

  /// If the specified manifest object is in the
  /// <code>S3BatchOperations_CSV_20180820</code> format, this element describes
  /// which columns contain the required data.
  final List<String> fields;

  JobManifestSpec({
    @_s.required this.format,
    this.fields,
  });
  factory JobManifestSpec.fromXml(_s.XmlElement elem) {
    return JobManifestSpec(
      format: _s.extractXmlStringValue(elem, 'Format')?.toJobManifestFormat(),
      fields: _s
          .extractXmlChild(elem, 'Fields')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'Fields')),
    );
  }

  _s.XmlElement toXml(String elemName) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Format', format?.toValue()),
      if (fields != null)
        _s.XmlElement(_s.XmlName('Fields'), [], <_s.XmlNode>[
          ...fields.map((v) => _s.encodeXmlStringValue('Fields', v))
        ]),
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      [],
      $children.where((e) => e != null),
    );
  }
}

/// The operation that you want this job to perform on each object listed in the
/// manifest. For more information about the available operations, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/batch-ops-operations.html">Available
/// Operations</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.
class JobOperation {
  /// Directs the specified job to invoke an AWS Lambda function on each object in
  /// the manifest.
  final LambdaInvokeOperation lambdaInvoke;

  /// Directs the specified job to execute an Initiate Glacier Restore call on
  /// each object in the manifest.
  final S3InitiateRestoreObjectOperation s3InitiateRestoreObject;

  /// Directs the specified job to execute a PUT Object acl call on each object in
  /// the manifest.
  final S3SetObjectAclOperation s3PutObjectAcl;

  /// Directs the specified job to execute a PUT Copy object call on each object
  /// in the manifest.
  final S3CopyObjectOperation s3PutObjectCopy;

  /// Directs the specified job to execute a PUT Object tagging call on each
  /// object in the manifest.
  final S3SetObjectTaggingOperation s3PutObjectTagging;

  JobOperation({
    this.lambdaInvoke,
    this.s3InitiateRestoreObject,
    this.s3PutObjectAcl,
    this.s3PutObjectCopy,
    this.s3PutObjectTagging,
  });
  factory JobOperation.fromXml(_s.XmlElement elem) {
    return JobOperation(
      lambdaInvoke: _s
          .extractXmlChild(elem, 'LambdaInvoke')
          ?.let((e) => LambdaInvokeOperation.fromXml(e)),
      s3InitiateRestoreObject: _s
          .extractXmlChild(elem, 'S3InitiateRestoreObject')
          ?.let((e) => S3InitiateRestoreObjectOperation.fromXml(e)),
      s3PutObjectAcl: _s
          .extractXmlChild(elem, 'S3PutObjectAcl')
          ?.let((e) => S3SetObjectAclOperation.fromXml(e)),
      s3PutObjectCopy: _s
          .extractXmlChild(elem, 'S3PutObjectCopy')
          ?.let((e) => S3CopyObjectOperation.fromXml(e)),
      s3PutObjectTagging: _s
          .extractXmlChild(elem, 'S3PutObjectTagging')
          ?.let((e) => S3SetObjectTaggingOperation.fromXml(e)),
    );
  }

  _s.XmlElement toXml(String elemName) {
    final $children = <_s.XmlNode>[
      lambdaInvoke.toXml('LambdaInvoke'),
      s3InitiateRestoreObject.toXml('S3InitiateRestoreObject'),
      s3PutObjectAcl.toXml('S3PutObjectAcl'),
      s3PutObjectCopy.toXml('S3PutObjectCopy'),
      s3PutObjectTagging.toXml('S3PutObjectTagging'),
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      [],
      $children.where((e) => e != null),
    );
  }
}

/// Describes the total number of tasks that the specified job has executed, the
/// number of tasks that succeeded, and the number of tasks that failed.
class JobProgressSummary {
  /// <p/>
  final int numberOfTasksFailed;

  /// <p/>
  final int numberOfTasksSucceeded;

  /// <p/>
  final int totalNumberOfTasks;

  JobProgressSummary({
    this.numberOfTasksFailed,
    this.numberOfTasksSucceeded,
    this.totalNumberOfTasks,
  });
  factory JobProgressSummary.fromXml(_s.XmlElement elem) {
    return JobProgressSummary(
      numberOfTasksFailed: _s.extractXmlIntValue(elem, 'NumberOfTasksFailed'),
      numberOfTasksSucceeded:
          _s.extractXmlIntValue(elem, 'NumberOfTasksSucceeded'),
      totalNumberOfTasks: _s.extractXmlIntValue(elem, 'TotalNumberOfTasks'),
    );
  }
}

/// Contains the configuration parameters for a job-completion report.
class JobReport {
  /// Indicates whether the specified job will generate a job-completion report.
  final bool enabled;

  /// The Amazon Resource Name (ARN) for the bucket where specified job-completion
  /// report will be stored.
  final String bucket;

  /// The format of the specified job-completion report.
  final JobReportFormat format;

  /// An optional prefix to describe where in the specified bucket the
  /// job-completion report will be stored. Amazon S3 will store the
  /// job-completion report at &lt;prefix&gt;/job-&lt;job-id&gt;/report.json.
  final String prefix;

  /// Indicates whether the job-completion report will include details of all
  /// tasks or only failed tasks.
  final JobReportScope reportScope;

  JobReport({
    @_s.required this.enabled,
    this.bucket,
    this.format,
    this.prefix,
    this.reportScope,
  });
  factory JobReport.fromXml(_s.XmlElement elem) {
    return JobReport(
      enabled: _s.extractXmlBoolValue(elem, 'Enabled'),
      bucket: _s.extractXmlStringValue(elem, 'Bucket'),
      format: _s.extractXmlStringValue(elem, 'Format')?.toJobReportFormat(),
      prefix: _s.extractXmlStringValue(elem, 'Prefix'),
      reportScope:
          _s.extractXmlStringValue(elem, 'ReportScope')?.toJobReportScope(),
    );
  }

  _s.XmlElement toXml(String elemName) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlBoolValue('Enabled', enabled),
      _s.encodeXmlStringValue('Bucket', bucket),
      _s.encodeXmlStringValue('Format', format?.toValue()),
      _s.encodeXmlStringValue('Prefix', prefix),
      _s.encodeXmlStringValue('ReportScope', reportScope?.toValue()),
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      [],
      $children.where((e) => e != null),
    );
  }
}

enum JobReportFormat {
  reportCsv_20180820,
}

extension on JobReportFormat {
  String toValue() {
    switch (this) {
      case JobReportFormat.reportCsv_20180820:
        return 'Report_CSV_20180820';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  JobReportFormat toJobReportFormat() {
    switch (this) {
      case 'Report_CSV_20180820':
        return JobReportFormat.reportCsv_20180820;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum JobReportScope {
  allTasks,
  failedTasksOnly,
}

extension on JobReportScope {
  String toValue() {
    switch (this) {
      case JobReportScope.allTasks:
        return 'AllTasks';
      case JobReportScope.failedTasksOnly:
        return 'FailedTasksOnly';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  JobReportScope toJobReportScope() {
    switch (this) {
      case 'AllTasks':
        return JobReportScope.allTasks;
      case 'FailedTasksOnly':
        return JobReportScope.failedTasksOnly;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum JobStatus {
  active,
  cancelled,
  cancelling,
  complete,
  completing,
  failed,
  failing,
  $new,
  paused,
  pausing,
  preparing,
  ready,
  suspended,
}

extension on JobStatus {
  String toValue() {
    switch (this) {
      case JobStatus.active:
        return 'Active';
      case JobStatus.cancelled:
        return 'Cancelled';
      case JobStatus.cancelling:
        return 'Cancelling';
      case JobStatus.complete:
        return 'Complete';
      case JobStatus.completing:
        return 'Completing';
      case JobStatus.failed:
        return 'Failed';
      case JobStatus.failing:
        return 'Failing';
      case JobStatus.$new:
        return 'New';
      case JobStatus.paused:
        return 'Paused';
      case JobStatus.pausing:
        return 'Pausing';
      case JobStatus.preparing:
        return 'Preparing';
      case JobStatus.ready:
        return 'Ready';
      case JobStatus.suspended:
        return 'Suspended';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  JobStatus toJobStatus() {
    switch (this) {
      case 'Active':
        return JobStatus.active;
      case 'Cancelled':
        return JobStatus.cancelled;
      case 'Cancelling':
        return JobStatus.cancelling;
      case 'Complete':
        return JobStatus.complete;
      case 'Completing':
        return JobStatus.completing;
      case 'Failed':
        return JobStatus.failed;
      case 'Failing':
        return JobStatus.failing;
      case 'New':
        return JobStatus.$new;
      case 'Paused':
        return JobStatus.paused;
      case 'Pausing':
        return JobStatus.pausing;
      case 'Preparing':
        return JobStatus.preparing;
      case 'Ready':
        return JobStatus.ready;
      case 'Suspended':
        return JobStatus.suspended;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Contains the configuration parameters for a <code>Lambda Invoke</code>
/// operation.
class LambdaInvokeOperation {
  /// The Amazon Resource Name (ARN) for the AWS Lambda function that the
  /// specified job will invoke for each object in the manifest.
  final String functionArn;

  LambdaInvokeOperation({
    this.functionArn,
  });
  factory LambdaInvokeOperation.fromXml(_s.XmlElement elem) {
    return LambdaInvokeOperation(
      functionArn: _s.extractXmlStringValue(elem, 'FunctionArn'),
    );
  }

  _s.XmlElement toXml(String elemName) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('FunctionArn', functionArn),
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      [],
      $children.where((e) => e != null),
    );
  }
}

class ListAccessPointsResult {
  /// Contains identification and configuration information for one or more access
  /// points associated with the specified bucket.
  final List<AccessPoint> accessPointList;

  /// If the specified bucket has more access points than can be returned in one
  /// call to this API, then this field contains a continuation token that you can
  /// provide in subsequent calls to this API to retrieve additional access
  /// points.
  final String nextToken;

  ListAccessPointsResult({
    this.accessPointList,
    this.nextToken,
  });
  factory ListAccessPointsResult.fromXml(_s.XmlElement elem) {
    return ListAccessPointsResult(
      accessPointList: _s.extractXmlChild(elem, 'AccessPointList')?.let(
          (elem) => elem
              .findElements('AccessPoint')
              .map((c) => AccessPoint.fromXml(c))
              .toList()),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }
}

class ListJobsResult {
  /// The list of current jobs and jobs that have ended within the last 30 days.
  final List<JobListDescriptor> jobs;

  /// If the <code>List Jobs</code> request produced more than the maximum number
  /// of results, you can pass this value into a subsequent <code>List Jobs</code>
  /// request in order to retrieve the next page of results.
  final String nextToken;

  ListJobsResult({
    this.jobs,
    this.nextToken,
  });
  factory ListJobsResult.fromXml(_s.XmlElement elem) {
    return ListJobsResult(
      jobs: _s.extractXmlChild(elem, 'Jobs')?.let((elem) => elem
          .findElements('Jobs')
          .map((c) => JobListDescriptor.fromXml(c))
          .toList()),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }
}

enum NetworkOrigin {
  internet,
  vpc,
}

extension on NetworkOrigin {
  String toValue() {
    switch (this) {
      case NetworkOrigin.internet:
        return 'Internet';
      case NetworkOrigin.vpc:
        return 'VPC';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  NetworkOrigin toNetworkOrigin() {
    switch (this) {
      case 'Internet':
        return NetworkOrigin.internet;
      case 'VPC':
        return NetworkOrigin.vpc;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum OperationName {
  lambdaInvoke,
  s3PutObjectCopy,
  s3PutObjectAcl,
  s3PutObjectTagging,
  s3InitiateRestoreObject,
}

extension on OperationName {
  String toValue() {
    switch (this) {
      case OperationName.lambdaInvoke:
        return 'LambdaInvoke';
      case OperationName.s3PutObjectCopy:
        return 'S3PutObjectCopy';
      case OperationName.s3PutObjectAcl:
        return 'S3PutObjectAcl';
      case OperationName.s3PutObjectTagging:
        return 'S3PutObjectTagging';
      case OperationName.s3InitiateRestoreObject:
        return 'S3InitiateRestoreObject';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  OperationName toOperationName() {
    switch (this) {
      case 'LambdaInvoke':
        return OperationName.lambdaInvoke;
      case 'S3PutObjectCopy':
        return OperationName.s3PutObjectCopy;
      case 'S3PutObjectAcl':
        return OperationName.s3PutObjectAcl;
      case 'S3PutObjectTagging':
        return OperationName.s3PutObjectTagging;
      case 'S3InitiateRestoreObject':
        return OperationName.s3InitiateRestoreObject;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Indicates whether this access point policy is public. For more information
/// about how Amazon S3 evaluates policies to determine whether they are public,
/// see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html#access-control-block-public-access-policy-status">The
/// Meaning of "Public"</a> in the <i>Amazon Simple Storage Service Developer
/// Guide</i>.
class PolicyStatus {
  /// <p/>
  final bool isPublic;

  PolicyStatus({
    this.isPublic,
  });
  factory PolicyStatus.fromXml(_s.XmlElement elem) {
    return PolicyStatus(
      isPublic: _s.extractXmlBoolValue(elem, 'IsPublic'),
    );
  }
}

/// The <code>PublicAccessBlock</code> configuration that you want to apply to
/// this Amazon S3 bucket. You can enable the configuration options in any
/// combination. For more information about when Amazon S3 considers a bucket or
/// object public, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html#access-control-block-public-access-policy-status">The
/// Meaning of "Public"</a> in the Amazon Simple Storage Service Developer
/// Guide.
class PublicAccessBlockConfiguration {
  /// Specifies whether Amazon S3 should block public access control lists (ACLs)
  /// for buckets in this account. Setting this element to <code>TRUE</code>
  /// causes the following behavior:
  ///
  /// <ul>
  /// <li>
  /// PUT Bucket acl and PUT Object acl calls fail if the specified ACL is public.
  /// </li>
  /// <li>
  /// PUT Object calls fail if the request includes a public ACL.
  /// </li>
  /// <li>
  /// PUT Bucket calls fail if the request includes a public ACL.
  /// </li>
  /// </ul>
  /// Enabling this setting doesn't affect existing policies or ACLs.
  final bool blockPublicAcls;

  /// Specifies whether Amazon S3 should block public bucket policies for buckets
  /// in this account. Setting this element to <code>TRUE</code> causes Amazon S3
  /// to reject calls to PUT Bucket policy if the specified bucket policy allows
  /// public access.
  ///
  /// Enabling this setting doesn't affect existing bucket policies.
  final bool blockPublicPolicy;

  /// Specifies whether Amazon S3 should ignore public ACLs for buckets in this
  /// account. Setting this element to <code>TRUE</code> causes Amazon S3 to
  /// ignore all public ACLs on buckets in this account and any objects that they
  /// contain.
  ///
  /// Enabling this setting doesn't affect the persistence of any existing ACLs
  /// and doesn't prevent new public ACLs from being set.
  final bool ignorePublicAcls;

  /// Specifies whether Amazon S3 should restrict public bucket policies for
  /// buckets in this account. Setting this element to <code>TRUE</code> restricts
  /// access to buckets with public policies to only AWS services and authorized
  /// users within this account.
  ///
  /// Enabling this setting doesn't affect previously stored bucket policies,
  /// except that public and cross-account access within any public bucket policy,
  /// including non-public delegation to specific accounts, is blocked.
  final bool restrictPublicBuckets;

  PublicAccessBlockConfiguration({
    this.blockPublicAcls,
    this.blockPublicPolicy,
    this.ignorePublicAcls,
    this.restrictPublicBuckets,
  });
  factory PublicAccessBlockConfiguration.fromXml(_s.XmlElement elem) {
    return PublicAccessBlockConfiguration(
      blockPublicAcls: _s.extractXmlBoolValue(elem, 'BlockPublicAcls'),
      blockPublicPolicy: _s.extractXmlBoolValue(elem, 'BlockPublicPolicy'),
      ignorePublicAcls: _s.extractXmlBoolValue(elem, 'IgnorePublicAcls'),
      restrictPublicBuckets:
          _s.extractXmlBoolValue(elem, 'RestrictPublicBuckets'),
    );
  }

  _s.XmlElement toXml(String elemName) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlBoolValue('BlockPublicAcls', blockPublicAcls),
      _s.encodeXmlBoolValue('BlockPublicPolicy', blockPublicPolicy),
      _s.encodeXmlBoolValue('IgnorePublicAcls', ignorePublicAcls),
      _s.encodeXmlBoolValue('RestrictPublicBuckets', restrictPublicBuckets),
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      [],
      $children.where((e) => e != null),
    );
  }
}

class PutJobTaggingResult {
  PutJobTaggingResult();
  factory PutJobTaggingResult.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return PutJobTaggingResult();
  }
}

enum RequestedJobStatus {
  cancelled,
  ready,
}

extension on RequestedJobStatus {
  String toValue() {
    switch (this) {
      case RequestedJobStatus.cancelled:
        return 'Cancelled';
      case RequestedJobStatus.ready:
        return 'Ready';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  RequestedJobStatus toRequestedJobStatus() {
    switch (this) {
      case 'Cancelled':
        return RequestedJobStatus.cancelled;
      case 'Ready':
        return RequestedJobStatus.ready;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// <p/>
class S3AccessControlList {
  /// <p/>
  final S3ObjectOwner owner;

  /// <p/>
  final List<S3Grant> grants;

  S3AccessControlList({
    @_s.required this.owner,
    this.grants,
  });
  factory S3AccessControlList.fromXml(_s.XmlElement elem) {
    return S3AccessControlList(
      owner: _s
          .extractXmlChild(elem, 'Owner')
          ?.let((e) => S3ObjectOwner.fromXml(e)),
      grants: _s.extractXmlChild(elem, 'Grants')?.let((elem) =>
          elem.findElements('Grants').map((c) => S3Grant.fromXml(c)).toList()),
    );
  }

  _s.XmlElement toXml(String elemName) {
    final $children = <_s.XmlNode>[
      owner.toXml('Owner'),
      if (grants != null)
        _s.XmlElement(_s.XmlName('Grants'), [],
            <_s.XmlNode>[...grants.map((v) => v.toXml('Grants'))]),
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      [],
      $children.where((e) => e != null),
    );
  }
}

/// <p/>
class S3AccessControlPolicy {
  /// <p/>
  final S3AccessControlList accessControlList;

  /// <p/>
  final S3CannedAccessControlList cannedAccessControlList;

  S3AccessControlPolicy({
    this.accessControlList,
    this.cannedAccessControlList,
  });
  factory S3AccessControlPolicy.fromXml(_s.XmlElement elem) {
    return S3AccessControlPolicy(
      accessControlList: _s
          .extractXmlChild(elem, 'AccessControlList')
          ?.let((e) => S3AccessControlList.fromXml(e)),
      cannedAccessControlList: _s
          .extractXmlStringValue(elem, 'CannedAccessControlList')
          ?.toS3CannedAccessControlList(),
    );
  }

  _s.XmlElement toXml(String elemName) {
    final $children = <_s.XmlNode>[
      accessControlList.toXml('AccessControlList'),
      _s.encodeXmlStringValue(
          'CannedAccessControlList', cannedAccessControlList?.toValue()),
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      [],
      $children.where((e) => e != null),
    );
  }
}

enum S3CannedAccessControlList {
  private,
  publicRead,
  publicReadWrite,
  awsExecRead,
  authenticatedRead,
  bucketOwnerRead,
  bucketOwnerFullControl,
}

extension on S3CannedAccessControlList {
  String toValue() {
    switch (this) {
      case S3CannedAccessControlList.private:
        return 'private';
      case S3CannedAccessControlList.publicRead:
        return 'public-read';
      case S3CannedAccessControlList.publicReadWrite:
        return 'public-read-write';
      case S3CannedAccessControlList.awsExecRead:
        return 'aws-exec-read';
      case S3CannedAccessControlList.authenticatedRead:
        return 'authenticated-read';
      case S3CannedAccessControlList.bucketOwnerRead:
        return 'bucket-owner-read';
      case S3CannedAccessControlList.bucketOwnerFullControl:
        return 'bucket-owner-full-control';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  S3CannedAccessControlList toS3CannedAccessControlList() {
    switch (this) {
      case 'private':
        return S3CannedAccessControlList.private;
      case 'public-read':
        return S3CannedAccessControlList.publicRead;
      case 'public-read-write':
        return S3CannedAccessControlList.publicReadWrite;
      case 'aws-exec-read':
        return S3CannedAccessControlList.awsExecRead;
      case 'authenticated-read':
        return S3CannedAccessControlList.authenticatedRead;
      case 'bucket-owner-read':
        return S3CannedAccessControlList.bucketOwnerRead;
      case 'bucket-owner-full-control':
        return S3CannedAccessControlList.bucketOwnerFullControl;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Contains the configuration parameters for a PUT Copy object operation.
/// Amazon S3 batch operations passes each value through to the underlying PUT
/// Copy object API. For more information about the parameters for this
/// operation, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTObjectCOPY.html">PUT
/// Object - Copy</a>.
class S3CopyObjectOperation {
  /// <p/>
  final List<S3Grant> accessControlGrants;

  /// <p/>
  final S3CannedAccessControlList cannedAccessControlList;

  /// <p/>
  final S3MetadataDirective metadataDirective;

  /// <p/>
  final DateTime modifiedSinceConstraint;

  /// <p/>
  final S3ObjectMetadata newObjectMetadata;

  /// <p/>
  final List<S3Tag> newObjectTagging;

  /// <p/>
  final S3ObjectLockLegalHoldStatus objectLockLegalHoldStatus;

  /// <p/>
  final S3ObjectLockMode objectLockMode;

  /// <p/>
  final DateTime objectLockRetainUntilDate;

  /// <p/>
  final String redirectLocation;

  /// <p/>
  final bool requesterPays;

  /// <p/>
  final String sSEAwsKmsKeyId;

  /// <p/>
  final S3StorageClass storageClass;

  /// <p/>
  final String targetKeyPrefix;

  /// <p/>
  final String targetResource;

  /// <p/>
  final DateTime unModifiedSinceConstraint;

  S3CopyObjectOperation({
    this.accessControlGrants,
    this.cannedAccessControlList,
    this.metadataDirective,
    this.modifiedSinceConstraint,
    this.newObjectMetadata,
    this.newObjectTagging,
    this.objectLockLegalHoldStatus,
    this.objectLockMode,
    this.objectLockRetainUntilDate,
    this.redirectLocation,
    this.requesterPays,
    this.sSEAwsKmsKeyId,
    this.storageClass,
    this.targetKeyPrefix,
    this.targetResource,
    this.unModifiedSinceConstraint,
  });
  factory S3CopyObjectOperation.fromXml(_s.XmlElement elem) {
    return S3CopyObjectOperation(
      accessControlGrants: _s.extractXmlChild(elem, 'AccessControlGrants')?.let(
          (elem) => elem
              .findElements('AccessControlGrants')
              .map((c) => S3Grant.fromXml(c))
              .toList()),
      cannedAccessControlList: _s
          .extractXmlStringValue(elem, 'CannedAccessControlList')
          ?.toS3CannedAccessControlList(),
      metadataDirective: _s
          .extractXmlStringValue(elem, 'MetadataDirective')
          ?.toS3MetadataDirective(),
      modifiedSinceConstraint:
          _s.extractXmlDateTimeValue(elem, 'ModifiedSinceConstraint'),
      newObjectMetadata: _s
          .extractXmlChild(elem, 'NewObjectMetadata')
          ?.let((e) => S3ObjectMetadata.fromXml(e)),
      newObjectTagging: _s.extractXmlChild(elem, 'NewObjectTagging')?.let(
          (elem) => elem
              .findElements('NewObjectTagging')
              .map((c) => S3Tag.fromXml(c))
              .toList()),
      objectLockLegalHoldStatus: _s
          .extractXmlStringValue(elem, 'ObjectLockLegalHoldStatus')
          ?.toS3ObjectLockLegalHoldStatus(),
      objectLockMode: _s
          .extractXmlStringValue(elem, 'ObjectLockMode')
          ?.toS3ObjectLockMode(),
      objectLockRetainUntilDate:
          _s.extractXmlDateTimeValue(elem, 'ObjectLockRetainUntilDate'),
      redirectLocation: _s.extractXmlStringValue(elem, 'RedirectLocation'),
      requesterPays: _s.extractXmlBoolValue(elem, 'RequesterPays'),
      sSEAwsKmsKeyId: _s.extractXmlStringValue(elem, 'SSEAwsKmsKeyId'),
      storageClass:
          _s.extractXmlStringValue(elem, 'StorageClass')?.toS3StorageClass(),
      targetKeyPrefix: _s.extractXmlStringValue(elem, 'TargetKeyPrefix'),
      targetResource: _s.extractXmlStringValue(elem, 'TargetResource'),
      unModifiedSinceConstraint:
          _s.extractXmlDateTimeValue(elem, 'UnModifiedSinceConstraint'),
    );
  }

  _s.XmlElement toXml(String elemName) {
    final $children = <_s.XmlNode>[
      if (accessControlGrants != null)
        _s.XmlElement(_s.XmlName('AccessControlGrants'), [], <_s.XmlNode>[
          ...accessControlGrants.map((v) => v.toXml('AccessControlGrants'))
        ]),
      _s.encodeXmlStringValue(
          'CannedAccessControlList', cannedAccessControlList?.toValue()),
      _s.encodeXmlStringValue(
          'MetadataDirective', metadataDirective?.toValue()),
      _s.encodeXmlDateTimeValue(
          'ModifiedSinceConstraint', modifiedSinceConstraint),
      newObjectMetadata.toXml('NewObjectMetadata'),
      if (newObjectTagging != null)
        _s.XmlElement(_s.XmlName('NewObjectTagging'), [], <_s.XmlNode>[
          ...newObjectTagging.map((v) => v.toXml('NewObjectTagging'))
        ]),
      _s.encodeXmlStringValue(
          'ObjectLockLegalHoldStatus', objectLockLegalHoldStatus?.toValue()),
      _s.encodeXmlStringValue('ObjectLockMode', objectLockMode?.toValue()),
      _s.encodeXmlDateTimeValue(
          'ObjectLockRetainUntilDate', objectLockRetainUntilDate),
      _s.encodeXmlStringValue('RedirectLocation', redirectLocation),
      _s.encodeXmlBoolValue('RequesterPays', requesterPays),
      _s.encodeXmlStringValue('SSEAwsKmsKeyId', sSEAwsKmsKeyId),
      _s.encodeXmlStringValue('StorageClass', storageClass?.toValue()),
      _s.encodeXmlStringValue('TargetKeyPrefix', targetKeyPrefix),
      _s.encodeXmlStringValue('TargetResource', targetResource),
      _s.encodeXmlDateTimeValue(
          'UnModifiedSinceConstraint', unModifiedSinceConstraint),
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      [],
      $children.where((e) => e != null),
    );
  }
}

enum S3GlacierJobTier {
  bulk,
  standard,
}

extension on S3GlacierJobTier {
  String toValue() {
    switch (this) {
      case S3GlacierJobTier.bulk:
        return 'BULK';
      case S3GlacierJobTier.standard:
        return 'STANDARD';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  S3GlacierJobTier toS3GlacierJobTier() {
    switch (this) {
      case 'BULK':
        return S3GlacierJobTier.bulk;
      case 'STANDARD':
        return S3GlacierJobTier.standard;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// <p/>
class S3Grant {
  /// <p/>
  final S3Grantee grantee;

  /// <p/>
  final S3Permission permission;

  S3Grant({
    this.grantee,
    this.permission,
  });
  factory S3Grant.fromXml(_s.XmlElement elem) {
    return S3Grant(
      grantee:
          _s.extractXmlChild(elem, 'Grantee')?.let((e) => S3Grantee.fromXml(e)),
      permission:
          _s.extractXmlStringValue(elem, 'Permission')?.toS3Permission(),
    );
  }

  _s.XmlElement toXml(String elemName) {
    final $children = <_s.XmlNode>[
      grantee.toXml('Grantee'),
      _s.encodeXmlStringValue('Permission', permission?.toValue()),
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      [],
      $children.where((e) => e != null),
    );
  }
}

/// <p/>
class S3Grantee {
  /// <p/>
  final String displayName;

  /// <p/>
  final String identifier;

  /// <p/>
  final S3GranteeTypeIdentifier typeIdentifier;

  S3Grantee({
    this.displayName,
    this.identifier,
    this.typeIdentifier,
  });
  factory S3Grantee.fromXml(_s.XmlElement elem) {
    return S3Grantee(
      displayName: _s.extractXmlStringValue(elem, 'DisplayName'),
      identifier: _s.extractXmlStringValue(elem, 'Identifier'),
      typeIdentifier: _s
          .extractXmlStringValue(elem, 'TypeIdentifier')
          ?.toS3GranteeTypeIdentifier(),
    );
  }

  _s.XmlElement toXml(String elemName) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('DisplayName', displayName),
      _s.encodeXmlStringValue('Identifier', identifier),
      _s.encodeXmlStringValue('TypeIdentifier', typeIdentifier?.toValue()),
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      [],
      $children.where((e) => e != null),
    );
  }
}

enum S3GranteeTypeIdentifier {
  id,
  emailAddress,
  uri,
}

extension on S3GranteeTypeIdentifier {
  String toValue() {
    switch (this) {
      case S3GranteeTypeIdentifier.id:
        return 'id';
      case S3GranteeTypeIdentifier.emailAddress:
        return 'emailAddress';
      case S3GranteeTypeIdentifier.uri:
        return 'uri';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  S3GranteeTypeIdentifier toS3GranteeTypeIdentifier() {
    switch (this) {
      case 'id':
        return S3GranteeTypeIdentifier.id;
      case 'emailAddress':
        return S3GranteeTypeIdentifier.emailAddress;
      case 'uri':
        return S3GranteeTypeIdentifier.uri;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Contains the configuration parameters for an Initiate Glacier Restore job.
/// Amazon S3 batch operations passes each value through to the underlying POST
/// Object restore API. For more information about the parameters for this
/// operation, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTObjectPOSTrestore.html#RESTObjectPOSTrestore-restore-request">Restoring
/// Archives</a>.
class S3InitiateRestoreObjectOperation {
  /// <p/>
  final int expirationInDays;

  /// <p/>
  final S3GlacierJobTier glacierJobTier;

  S3InitiateRestoreObjectOperation({
    this.expirationInDays,
    this.glacierJobTier,
  });
  factory S3InitiateRestoreObjectOperation.fromXml(_s.XmlElement elem) {
    return S3InitiateRestoreObjectOperation(
      expirationInDays: _s.extractXmlIntValue(elem, 'ExpirationInDays'),
      glacierJobTier: _s
          .extractXmlStringValue(elem, 'GlacierJobTier')
          ?.toS3GlacierJobTier(),
    );
  }

  _s.XmlElement toXml(String elemName) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlIntValue('ExpirationInDays', expirationInDays),
      _s.encodeXmlStringValue('GlacierJobTier', glacierJobTier?.toValue()),
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      [],
      $children.where((e) => e != null),
    );
  }
}

enum S3MetadataDirective {
  copy,
  replace,
}

extension on S3MetadataDirective {
  String toValue() {
    switch (this) {
      case S3MetadataDirective.copy:
        return 'COPY';
      case S3MetadataDirective.replace:
        return 'REPLACE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  S3MetadataDirective toS3MetadataDirective() {
    switch (this) {
      case 'COPY':
        return S3MetadataDirective.copy;
      case 'REPLACE':
        return S3MetadataDirective.replace;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum S3ObjectLockLegalHoldStatus {
  off,
  on,
}

extension on S3ObjectLockLegalHoldStatus {
  String toValue() {
    switch (this) {
      case S3ObjectLockLegalHoldStatus.off:
        return 'OFF';
      case S3ObjectLockLegalHoldStatus.on:
        return 'ON';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  S3ObjectLockLegalHoldStatus toS3ObjectLockLegalHoldStatus() {
    switch (this) {
      case 'OFF':
        return S3ObjectLockLegalHoldStatus.off;
      case 'ON':
        return S3ObjectLockLegalHoldStatus.on;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum S3ObjectLockMode {
  compliance,
  governance,
}

extension on S3ObjectLockMode {
  String toValue() {
    switch (this) {
      case S3ObjectLockMode.compliance:
        return 'COMPLIANCE';
      case S3ObjectLockMode.governance:
        return 'GOVERNANCE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  S3ObjectLockMode toS3ObjectLockMode() {
    switch (this) {
      case 'COMPLIANCE':
        return S3ObjectLockMode.compliance;
      case 'GOVERNANCE':
        return S3ObjectLockMode.governance;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// <p/>
class S3ObjectMetadata {
  /// <p/>
  final String cacheControl;

  /// <p/>
  final String contentDisposition;

  /// <p/>
  final String contentEncoding;

  /// <p/>
  final String contentLanguage;

  /// <p/>
  final int contentLength;

  /// <p/>
  final String contentMD5;

  /// <p/>
  final String contentType;

  /// <p/>
  final DateTime httpExpiresDate;

  /// <p/>
  final bool requesterCharged;

  /// <p/>
  final S3SSEAlgorithm sSEAlgorithm;

  /// <p/>
  final Map<String, String> userMetadata;

  S3ObjectMetadata({
    this.cacheControl,
    this.contentDisposition,
    this.contentEncoding,
    this.contentLanguage,
    this.contentLength,
    this.contentMD5,
    this.contentType,
    this.httpExpiresDate,
    this.requesterCharged,
    this.sSEAlgorithm,
    this.userMetadata,
  });
  factory S3ObjectMetadata.fromXml(_s.XmlElement elem) {
    return S3ObjectMetadata(
      cacheControl: _s.extractXmlStringValue(elem, 'CacheControl'),
      contentDisposition: _s.extractXmlStringValue(elem, 'ContentDisposition'),
      contentEncoding: _s.extractXmlStringValue(elem, 'ContentEncoding'),
      contentLanguage: _s.extractXmlStringValue(elem, 'ContentLanguage'),
      contentLength: _s.extractXmlIntValue(elem, 'ContentLength'),
      contentMD5: _s.extractXmlStringValue(elem, 'ContentMD5'),
      contentType: _s.extractXmlStringValue(elem, 'ContentType'),
      httpExpiresDate: _s.extractXmlDateTimeValue(elem, 'HttpExpiresDate'),
      requesterCharged: _s.extractXmlBoolValue(elem, 'RequesterCharged'),
      sSEAlgorithm:
          _s.extractXmlStringValue(elem, 'SSEAlgorithm')?.toS3SSEAlgorithm(),
      userMetadata: Map.fromEntries(
        elem.findElements('UserMetadata').map(
              (c) => MapEntry(
                _s.extractXmlStringValue(c, 'null'),
                _s.extractXmlStringValue(c, 'null'),
              ),
            ),
      ),
    );
  }

  _s.XmlElement toXml(String elemName) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('CacheControl', cacheControl),
      _s.encodeXmlStringValue('ContentDisposition', contentDisposition),
      _s.encodeXmlStringValue('ContentEncoding', contentEncoding),
      _s.encodeXmlStringValue('ContentLanguage', contentLanguage),
      _s.encodeXmlIntValue('ContentLength', contentLength),
      _s.encodeXmlStringValue('ContentMD5', contentMD5),
      _s.encodeXmlStringValue('ContentType', contentType),
      _s.encodeXmlDateTimeValue('HttpExpiresDate', httpExpiresDate),
      _s.encodeXmlBoolValue('RequesterCharged', requesterCharged),
      _s.encodeXmlStringValue('SSEAlgorithm', sSEAlgorithm?.toValue()),
      if (userMetadata != null)
        throw UnimplementedError('XML map: S3UserMetadata'),
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      [],
      $children.where((e) => e != null),
    );
  }
}

/// <p/>
class S3ObjectOwner {
  /// <p/>
  final String displayName;

  /// <p/>
  final String id;

  S3ObjectOwner({
    this.displayName,
    this.id,
  });
  factory S3ObjectOwner.fromXml(_s.XmlElement elem) {
    return S3ObjectOwner(
      displayName: _s.extractXmlStringValue(elem, 'DisplayName'),
      id: _s.extractXmlStringValue(elem, 'ID'),
    );
  }

  _s.XmlElement toXml(String elemName) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('DisplayName', displayName),
      _s.encodeXmlStringValue('ID', id),
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      [],
      $children.where((e) => e != null),
    );
  }
}

enum S3Permission {
  fullControl,
  read,
  write,
  readAcp,
  writeAcp,
}

extension on S3Permission {
  String toValue() {
    switch (this) {
      case S3Permission.fullControl:
        return 'FULL_CONTROL';
      case S3Permission.read:
        return 'READ';
      case S3Permission.write:
        return 'WRITE';
      case S3Permission.readAcp:
        return 'READ_ACP';
      case S3Permission.writeAcp:
        return 'WRITE_ACP';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  S3Permission toS3Permission() {
    switch (this) {
      case 'FULL_CONTROL':
        return S3Permission.fullControl;
      case 'READ':
        return S3Permission.read;
      case 'WRITE':
        return S3Permission.write;
      case 'READ_ACP':
        return S3Permission.readAcp;
      case 'WRITE_ACP':
        return S3Permission.writeAcp;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum S3SSEAlgorithm {
  aes256,
  kms,
}

extension on S3SSEAlgorithm {
  String toValue() {
    switch (this) {
      case S3SSEAlgorithm.aes256:
        return 'AES256';
      case S3SSEAlgorithm.kms:
        return 'KMS';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  S3SSEAlgorithm toS3SSEAlgorithm() {
    switch (this) {
      case 'AES256':
        return S3SSEAlgorithm.aes256;
      case 'KMS':
        return S3SSEAlgorithm.kms;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Contains the configuration parameters for a Set Object ACL operation. Amazon
/// S3 batch operations passes each value through to the underlying PUT Object
/// acl API. For more information about the parameters for this operation, see
/// <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTObjectPUTacl.html">PUT
/// Object acl</a>.
class S3SetObjectAclOperation {
  /// <p/>
  final S3AccessControlPolicy accessControlPolicy;

  S3SetObjectAclOperation({
    this.accessControlPolicy,
  });
  factory S3SetObjectAclOperation.fromXml(_s.XmlElement elem) {
    return S3SetObjectAclOperation(
      accessControlPolicy: _s
          .extractXmlChild(elem, 'AccessControlPolicy')
          ?.let((e) => S3AccessControlPolicy.fromXml(e)),
    );
  }

  _s.XmlElement toXml(String elemName) {
    final $children = <_s.XmlNode>[
      accessControlPolicy.toXml('AccessControlPolicy'),
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      [],
      $children.where((e) => e != null),
    );
  }
}

/// Contains the configuration parameters for a Set Object Tagging operation.
/// Amazon S3 batch operations passes each value through to the underlying PUT
/// Object tagging API. For more information about the parameters for this
/// operation, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTObjectPUTtagging.html">PUT
/// Object tagging</a>.
class S3SetObjectTaggingOperation {
  /// <p/>
  final List<S3Tag> tagSet;

  S3SetObjectTaggingOperation({
    this.tagSet,
  });
  factory S3SetObjectTaggingOperation.fromXml(_s.XmlElement elem) {
    return S3SetObjectTaggingOperation(
      tagSet: _s.extractXmlChild(elem, 'TagSet')?.let((elem) =>
          elem.findElements('TagSet').map((c) => S3Tag.fromXml(c)).toList()),
    );
  }

  _s.XmlElement toXml(String elemName) {
    final $children = <_s.XmlNode>[
      if (tagSet != null)
        _s.XmlElement(_s.XmlName('TagSet'), [],
            <_s.XmlNode>[...tagSet.map((v) => v.toXml('TagSet'))]),
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      [],
      $children.where((e) => e != null),
    );
  }
}

enum S3StorageClass {
  standard,
  standardIa,
  onezoneIa,
  glacier,
  intelligentTiering,
  deepArchive,
}

extension on S3StorageClass {
  String toValue() {
    switch (this) {
      case S3StorageClass.standard:
        return 'STANDARD';
      case S3StorageClass.standardIa:
        return 'STANDARD_IA';
      case S3StorageClass.onezoneIa:
        return 'ONEZONE_IA';
      case S3StorageClass.glacier:
        return 'GLACIER';
      case S3StorageClass.intelligentTiering:
        return 'INTELLIGENT_TIERING';
      case S3StorageClass.deepArchive:
        return 'DEEP_ARCHIVE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  S3StorageClass toS3StorageClass() {
    switch (this) {
      case 'STANDARD':
        return S3StorageClass.standard;
      case 'STANDARD_IA':
        return S3StorageClass.standardIa;
      case 'ONEZONE_IA':
        return S3StorageClass.onezoneIa;
      case 'GLACIER':
        return S3StorageClass.glacier;
      case 'INTELLIGENT_TIERING':
        return S3StorageClass.intelligentTiering;
      case 'DEEP_ARCHIVE':
        return S3StorageClass.deepArchive;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// <p/>
class S3Tag {
  /// <p/>
  final String key;

  /// <p/>
  final String value;

  S3Tag({
    @_s.required this.key,
    @_s.required this.value,
  });
  factory S3Tag.fromXml(_s.XmlElement elem) {
    return S3Tag(
      key: _s.extractXmlStringValue(elem, 'Key'),
      value: _s.extractXmlStringValue(elem, 'Value'),
    );
  }

  _s.XmlElement toXml(String elemName) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Key', key),
      _s.encodeXmlStringValue('Value', value),
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      [],
      $children.where((e) => e != null),
    );
  }
}

class UpdateJobPriorityResult {
  /// The ID for the job whose priority Amazon S3 updated.
  final String jobId;

  /// The new priority assigned to the specified job.
  final int priority;

  UpdateJobPriorityResult({
    @_s.required this.jobId,
    @_s.required this.priority,
  });
  factory UpdateJobPriorityResult.fromXml(_s.XmlElement elem) {
    return UpdateJobPriorityResult(
      jobId: _s.extractXmlStringValue(elem, 'JobId'),
      priority: _s.extractXmlIntValue(elem, 'Priority'),
    );
  }
}

class UpdateJobStatusResult {
  /// The ID for the job whose status was updated.
  final String jobId;

  /// The current status for the specified job.
  final JobStatus status;

  /// The reason that the specified job's status was updated.
  final String statusUpdateReason;

  UpdateJobStatusResult({
    this.jobId,
    this.status,
    this.statusUpdateReason,
  });
  factory UpdateJobStatusResult.fromXml(_s.XmlElement elem) {
    return UpdateJobStatusResult(
      jobId: _s.extractXmlStringValue(elem, 'JobId'),
      status: _s.extractXmlStringValue(elem, 'Status')?.toJobStatus(),
      statusUpdateReason: _s.extractXmlStringValue(elem, 'StatusUpdateReason'),
    );
  }
}

/// The Virtual Private Cloud (VPC) configuration for an access point.
class VpcConfiguration {
  /// If this field is specified, this access point will only allow connections
  /// from the specified VPC ID.
  final String vpcId;

  VpcConfiguration({
    @_s.required this.vpcId,
  });
  factory VpcConfiguration.fromXml(_s.XmlElement elem) {
    return VpcConfiguration(
      vpcId: _s.extractXmlStringValue(elem, 'VpcId'),
    );
  }

  _s.XmlElement toXml(String elemName) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('VpcId', vpcId),
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      [],
      $children.where((e) => e != null),
    );
  }
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String type, String message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class IdempotencyException extends _s.GenericAwsException {
  IdempotencyException({String type, String message})
      : super(type: type, code: 'IdempotencyException', message: message);
}

class InternalServiceException extends _s.GenericAwsException {
  InternalServiceException({String type, String message})
      : super(type: type, code: 'InternalServiceException', message: message);
}

class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String type, String message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String type, String message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class JobStatusException extends _s.GenericAwsException {
  JobStatusException({String type, String message})
      : super(type: type, code: 'JobStatusException', message: message);
}

class NoSuchPublicAccessBlockConfiguration extends _s.GenericAwsException {
  NoSuchPublicAccessBlockConfiguration({String type, String message})
      : super(
            type: type,
            code: 'NoSuchPublicAccessBlockConfiguration',
            message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String type, String message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String type, String message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String type, String message})
      : super(type: type, code: 'TooManyTagsException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
  'IdempotencyException': (type, message) =>
      IdempotencyException(type: type, message: message),
  'InternalServiceException': (type, message) =>
      InternalServiceException(type: type, message: message),
  'InvalidNextTokenException': (type, message) =>
      InvalidNextTokenException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'JobStatusException': (type, message) =>
      JobStatusException(type: type, message: message),
  'NoSuchPublicAccessBlockConfiguration': (type, message) =>
      NoSuchPublicAccessBlockConfiguration(type: type, message: message),
  'NotFoundException': (type, message) =>
      NotFoundException(type: type, message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
};
