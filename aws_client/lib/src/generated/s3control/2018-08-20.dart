// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import '../../shared/shared.dart' as _s;
import '../../shared/shared.dart'
    show Uint8ListConverter, Uint8ListListConverter;

export '../../shared/shared.dart' show AwsClientCredentials;

/// AWS S3 Control provides access to Amazon S3 control plane operations.
class S3Control {
  final _s.RestXmlProtocol _protocol;
  S3Control({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestXmlProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 's3-control',
            signingName: 's3',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Creates an access point and associates it with the specified bucket. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-points.html">Managing
  /// Data Access with Amazon S3 Access Points</a> in the <i>Amazon Simple
  /// Storage Service Developer Guide</i>.
  /// <p/>
  /// <b>Using this action with Amazon S3 on Outposts</b>
  ///
  /// This action:
  ///
  /// <ul>
  /// <li>
  /// Requires a virtual private cloud (VPC) configuration as S3 on Outposts
  /// only supports VPC style access points.
  /// </li>
  /// <li>
  /// Does not support ACL on S3 on Outposts buckets.
  /// </li>
  /// <li>
  /// Does not support Public Access on S3 on Outposts buckets.
  /// </li>
  /// <li>
  /// Does not support object lock for S3 on Outposts buckets.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="AmazonS3/latest/dev/S3onOutposts.html">Using Amazon S3 on
  /// Outposts</a> in the <i>Amazon Simple Storage Service Developer Guide </i>.
  ///
  /// All Amazon S3 on Outposts REST API requests for this action require an
  /// additional parameter of <code>x-amz-outpost-id</code> to be passed with
  /// the request and an S3 on Outposts endpoint hostname prefix instead of
  /// <code>s3-control</code>. For an example of the request syntax for Amazon
  /// S3 on Outposts that uses the S3 on Outposts endpoint hostname prefix and
  /// the <code>x-amz-outpost-id</code> derived using the access point ARN, see
  /// the <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_CreateAccessPoint.html#API_control_CreateAccessPoint_Examples">Examples</a>
  /// section.
  /// <p/>
  /// The following actions are related to <code>CreateAccessPoint</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_GetAccessPoint.html">GetAccessPoint</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DeleteAccessPoint.html">DeleteAccessPoint</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_ListAccessPoints.html">ListAccessPoints</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [accountId] :
  /// The AWS account ID for the owner of the bucket for which you want to
  /// create an access point.
  ///
  /// Parameter [bucket] :
  /// The name of the bucket that you want to associate this access point with.
  ///
  /// For using this parameter with Amazon S3 on Outposts with the REST API, you
  /// must specify the name and the x-amz-outpost-id as well.
  ///
  /// For using this parameter with S3 on Outposts with the AWS SDK and CLI, you
  /// must specify the ARN of the bucket accessed in the format
  /// <code>arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/bucket/&lt;my-bucket-name&gt;</code>.
  /// For example, to access the bucket <code>reports</code> through outpost
  /// <code>my-outpost</code> owned by account <code>123456789012</code> in
  /// Region <code>us-west-2</code>, use the URL encoding of
  /// <code>arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/bucket/reports</code>.
  /// The value must be URL encoded.
  ///
  /// Parameter [name] :
  /// The name you want to assign to this access point.
  ///
  /// Parameter [vpcConfiguration] :
  /// If you include this field, Amazon S3 restricts access to this access point
  /// to requests from the specified virtual private cloud (VPC).
  /// <note>
  /// This is required for creating an access point for Amazon S3 on Outposts
  /// buckets.
  /// </note>
  Future<CreateAccessPointResult> createAccessPoint({
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
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''^\d{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(bucket, 'bucket');
    _s.validateStringLength(
      'bucket',
      bucket,
      3,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      3,
      50,
      isRequired: true,
    );
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    final $result = await _protocol.send(
      method: 'PUT',
      requestUri: '/v20180820/accesspoint/${Uri.encodeComponent(name)}',
      headers: headers,
      payload: CreateAccessPointRequest(
              accountId: accountId,
              bucket: bucket,
              name: name,
              publicAccessBlockConfiguration: publicAccessBlockConfiguration,
              vpcConfiguration: vpcConfiguration)
          .toXml(
        'CreateAccessPointRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'),
              'http://awss3control.amazonaws.com/doc/2018-08-20/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
    return CreateAccessPointResult.fromXml($result.body);
  }

  /// <note>
  /// This API operation creates an Amazon S3 on Outposts bucket. To create an
  /// S3 bucket, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucket.html">Create
  /// Bucket</a> in the <i>Amazon Simple Storage Service API</i>.
  /// </note>
  /// Creates a new Outposts bucket. By creating the bucket, you become the
  /// bucket owner. To create an Outposts bucket, you must have S3 on Outposts.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using
  /// Amazon S3 on Outposts</a> in <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// Not every string is an acceptable bucket name. For information on bucket
  /// naming restrictions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/BucketRestrictions.html#bucketnamingrules">Working
  /// with Amazon S3 Buckets</a>.
  ///
  /// S3 on Outposts buckets do not support
  ///
  /// <ul>
  /// <li>
  /// ACLs. Instead, configure access point policies to manage access to
  /// buckets.
  /// </li>
  /// <li>
  /// Public access.
  /// </li>
  /// <li>
  /// Object Lock
  /// </li>
  /// <li>
  /// Bucket Location constraint
  /// </li>
  /// </ul>
  /// For an example of the request syntax for Amazon S3 on Outposts that uses
  /// the S3 on Outposts endpoint hostname prefix and
  /// <code>x-amz-outpost-id</code> in your API request, see the <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_CreateBucket.html#API_control_CreateBucket_Examples">Examples</a>
  /// section.
  ///
  /// The following actions are related to <code>CreateBucket</code> for Amazon
  /// S3 on Outposts:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutObject.html">PutObject</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_GetBucket.html">GetBucket</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DeleteBucket.html">DeleteBucket</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_CreateAccessPoint.html">CreateAccessPoint</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_PutAccessPointPolicy.html">PutAccessPointPolicy</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [BucketAlreadyExists].
  /// May throw [BucketAlreadyOwnedByYou].
  ///
  /// Parameter [bucket] :
  /// The name of the bucket.
  ///
  /// Parameter [acl] :
  /// The canned ACL to apply to the bucket.
  /// <note>
  /// This is not supported by Amazon S3 on Outposts buckets.
  /// </note>
  ///
  /// Parameter [createBucketConfiguration] :
  /// The configuration information for the bucket.
  /// <note>
  /// This is not supported by Amazon S3 on Outposts buckets.
  /// </note>
  ///
  /// Parameter [grantFullControl] :
  /// Allows grantee the read, write, read ACP, and write ACP permissions on the
  /// bucket.
  /// <note>
  /// This is not supported by Amazon S3 on Outposts buckets.
  /// </note>
  ///
  /// Parameter [grantRead] :
  /// Allows grantee to list the objects in the bucket.
  /// <note>
  /// This is not supported by Amazon S3 on Outposts buckets.
  /// </note>
  ///
  /// Parameter [grantReadACP] :
  /// Allows grantee to read the bucket ACL.
  /// <note>
  /// This is not supported by Amazon S3 on Outposts buckets.
  /// </note>
  ///
  /// Parameter [grantWrite] :
  /// Allows grantee to create, overwrite, and delete any object in the bucket.
  /// <note>
  /// This is not supported by Amazon S3 on Outposts buckets.
  /// </note>
  ///
  /// Parameter [grantWriteACP] :
  /// Allows grantee to write the ACL for the applicable bucket.
  /// <note>
  /// This is not supported by Amazon S3 on Outposts buckets.
  /// </note>
  ///
  /// Parameter [objectLockEnabledForBucket] :
  /// Specifies whether you want S3 Object Lock to be enabled for the new
  /// bucket.
  /// <note>
  /// This is not supported by Amazon S3 on Outposts buckets.
  /// </note>
  ///
  /// Parameter [outpostId] :
  /// The ID of the Outposts where the bucket is being created.
  /// <note>
  /// This is required by Amazon S3 on Outposts buckets.
  /// </note>
  Future<CreateBucketResult> createBucket({
    @_s.required String bucket,
    BucketCannedACL acl,
    CreateBucketConfiguration createBucketConfiguration,
    String grantFullControl,
    String grantRead,
    String grantReadACP,
    String grantWrite,
    String grantWriteACP,
    bool objectLockEnabledForBucket,
    String outpostId,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    _s.validateStringLength(
      'bucket',
      bucket,
      3,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'outpostId',
      outpostId,
      1,
      64,
    );
    final headers = <String, String>{};
    acl?.let((v) => headers['x-amz-acl'] = v.toValue());
    grantFullControl
        ?.let((v) => headers['x-amz-grant-full-control'] = v.toString());
    grantRead?.let((v) => headers['x-amz-grant-read'] = v.toString());
    grantReadACP?.let((v) => headers['x-amz-grant-read-acp'] = v.toString());
    grantWrite?.let((v) => headers['x-amz-grant-write'] = v.toString());
    grantWriteACP?.let((v) => headers['x-amz-grant-write-acp'] = v.toString());
    objectLockEnabledForBucket?.let(
        (v) => headers['x-amz-bucket-object-lock-enabled'] = v.toString());
    outpostId?.let((v) => headers['x-amz-outpost-id'] = v.toString());
    final $result = await _protocol.sendRaw(
      method: 'PUT',
      requestUri: '/v20180820/bucket/${Uri.encodeComponent(bucket)}',
      headers: headers,
      payload: createBucketConfiguration?.toXml('CreateBucketConfiguration'),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return CreateBucketResult(
      bucketArn: _s.extractXmlStringValue($elem, 'BucketArn'),
      location: _s.extractHeaderStringValue($result.headers, 'Location'),
    );
  }

  /// S3 Batch Operations performs large-scale Batch Operations on Amazon S3
  /// objects. Batch Operations can run a single operation or action on lists of
  /// Amazon S3 objects that you specify. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/batch-ops-basics.html">S3
  /// Batch Operations</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// This operation creates an S3 Batch Operations job.
  /// <p/>
  /// Related actions include:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DescribeJob.html">DescribeJob</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_ListJobs.html">ListJobs</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_UpdateJobPriority.html">UpdateJobPriority</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_UpdateJobStatus.html">UpdateJobStatus</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [IdempotencyException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [accountId] :
  /// The AWS account ID that creates the job.
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
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/batch-ops-operations.html">Operations</a>
  /// in the <i>Amazon Simple Storage Service Developer Guide</i>.
  ///
  /// Parameter [priority] :
  /// The numerical priority for this job. Higher numbers indicate higher
  /// priority.
  ///
  /// Parameter [report] :
  /// Configuration parameters for the optional job-completion report.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) for the AWS Identity and Access Management
  /// (IAM) role that Batch Operations will use to run this job's operation on
  /// each object in the manifest.
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
  /// A set of tags to associate with the S3 Batch Operations job. This is an
  /// optional parameter.
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
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''^\d{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(clientRequestToken, 'clientRequestToken');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(manifest, 'manifest');
    ArgumentError.checkNotNull(operation, 'operation');
    ArgumentError.checkNotNull(priority, 'priority');
    _s.validateNumRange(
      'priority',
      priority,
      0,
      2147483647,
      isRequired: true,
    );
    ArgumentError.checkNotNull(report, 'report');
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringLength(
      'roleArn',
      roleArn,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'roleArn',
      roleArn,
      r'''arn:[^:]+:iam::\d{12}:role/.*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      256,
    );
    clientRequestToken ??= _s.generateIdempotencyToken();
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    final $result = await _protocol.send(
      method: 'POST',
      requestUri: '/v20180820/jobs',
      headers: headers,
      payload: CreateJobRequest(
              accountId: accountId,
              clientRequestToken: clientRequestToken,
              manifest: manifest,
              operation: operation,
              priority: priority,
              report: report,
              roleArn: roleArn,
              confirmationRequired: confirmationRequired,
              description: description,
              tags: tags)
          .toXml(
        'CreateJobRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'),
              'http://awss3control.amazonaws.com/doc/2018-08-20/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
    return CreateJobResult.fromXml($result.body);
  }

  /// Deletes the specified access point.
  ///
  /// All Amazon S3 on Outposts REST API requests for this action require an
  /// additional parameter of <code>x-amz-outpost-id</code> to be passed with
  /// the request and an S3 on Outposts endpoint hostname prefix instead of
  /// <code>s3-control</code>. For an example of the request syntax for Amazon
  /// S3 on Outposts that uses the S3 on Outposts endpoint hostname prefix and
  /// the <code>x-amz-outpost-id</code> derived using the access point ARN, see
  /// the <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DeleteAccessPoint.html#API_control_DeleteAccessPoint_Examples">Examples</a>
  /// section.
  ///
  /// The following actions are related to <code>DeleteAccessPoint</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_CreateAccessPoint.html">CreateAccessPoint</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_GetAccessPoint.html">GetAccessPoint</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_ListAccessPoints.html">ListAccessPoints</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [accountId] :
  /// The account ID for the account that owns the specified access point.
  ///
  /// Parameter [name] :
  /// The name of the access point you want to delete.
  ///
  /// For using this parameter with Amazon S3 on Outposts with the REST API, you
  /// must specify the name and the x-amz-outpost-id as well.
  ///
  /// For using this parameter with S3 on Outposts with the AWS SDK and CLI, you
  /// must specify the ARN of the access point accessed in the format
  /// <code>arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/accesspoint/&lt;my-accesspoint-name&gt;</code>.
  /// For example, to access the access point <code>reports-ap</code> through
  /// outpost <code>my-outpost</code> owned by account <code>123456789012</code>
  /// in Region <code>us-west-2</code>, use the URL encoding of
  /// <code>arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/accesspoint/reports-ap</code>.
  /// The value must be URL encoded.
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
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''^\d{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      3,
      50,
      isRequired: true,
    );
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    await _protocol.send(
      method: 'DELETE',
      requestUri: '/v20180820/accesspoint/${Uri.encodeComponent(name)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the access point policy for the specified access point.
  /// <p/>
  /// All Amazon S3 on Outposts REST API requests for this action require an
  /// additional parameter of <code>x-amz-outpost-id</code> to be passed with
  /// the request and an S3 on Outposts endpoint hostname prefix instead of
  /// <code>s3-control</code>. For an example of the request syntax for Amazon
  /// S3 on Outposts that uses the S3 on Outposts endpoint hostname prefix and
  /// the <code>x-amz-outpost-id</code> derived using the access point ARN, see
  /// the <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DeleteAccessPointPolicy.html#API_control_DeleteAccessPointPolicy_Examples">Examples</a>
  /// section.
  ///
  /// The following actions are related to <code>DeleteAccessPointPolicy</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_PutAccessPointPolicy.html">PutAccessPointPolicy</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_GetAccessPointPolicy.html">GetAccessPointPolicy</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [accountId] :
  /// The account ID for the account that owns the specified access point.
  ///
  /// Parameter [name] :
  /// The name of the access point whose policy you want to delete.
  ///
  /// For using this parameter with Amazon S3 on Outposts with the REST API, you
  /// must specify the name and the x-amz-outpost-id as well.
  ///
  /// For using this parameter with S3 on Outposts with the AWS SDK and CLI, you
  /// must specify the ARN of the access point accessed in the format
  /// <code>arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/accesspoint/&lt;my-accesspoint-name&gt;</code>.
  /// For example, to access the access point <code>reports-ap</code> through
  /// outpost <code>my-outpost</code> owned by account <code>123456789012</code>
  /// in Region <code>us-west-2</code>, use the URL encoding of
  /// <code>arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/accesspoint/reports-ap</code>.
  /// The value must be URL encoded.
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
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''^\d{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      3,
      50,
      isRequired: true,
    );
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    await _protocol.send(
      method: 'DELETE',
      requestUri: '/v20180820/accesspoint/${Uri.encodeComponent(name)}/policy',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// <note>
  /// This API operation deletes an Amazon S3 on Outposts bucket. To delete an
  /// S3 bucket, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucket.html">DeleteBucket</a>
  /// in the <i>Amazon Simple Storage Service API</i>.
  /// </note>
  /// Deletes the Amazon S3 on Outposts bucket. All objects (including all
  /// object versions and delete markers) in the bucket must be deleted before
  /// the bucket itself can be deleted. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using
  /// Amazon S3 on Outposts</a> in <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// All Amazon S3 on Outposts REST API requests for this action require an
  /// additional parameter of <code>x-amz-outpost-id</code> to be passed with
  /// the request and an S3 on Outposts endpoint hostname prefix instead of
  /// <code>s3-control</code>. For an example of the request syntax for Amazon
  /// S3 on Outposts that uses the S3 on Outposts endpoint hostname prefix and
  /// the <code>x-amz-outpost-id</code> derived using the access point ARN, see
  /// the <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DeleteBucket.html#API_control_DeleteBucket_Examples">Examples</a>
  /// section.
  /// <p class="title"> <b>Related Resources</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_CreateBucket.html">CreateBucket</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_GetBucket.html">GetBucket</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteObject.html">DeleteObject</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [accountId] :
  /// The account ID that owns the Outposts bucket.
  ///
  /// Parameter [bucket] :
  /// Specifies the bucket being deleted.
  ///
  /// For using this parameter with Amazon S3 on Outposts with the REST API, you
  /// must specify the name and the x-amz-outpost-id as well.
  ///
  /// For using this parameter with S3 on Outposts with the AWS SDK and CLI, you
  /// must specify the ARN of the bucket accessed in the format
  /// <code>arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/bucket/&lt;my-bucket-name&gt;</code>.
  /// For example, to access the bucket <code>reports</code> through outpost
  /// <code>my-outpost</code> owned by account <code>123456789012</code> in
  /// Region <code>us-west-2</code>, use the URL encoding of
  /// <code>arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/bucket/reports</code>.
  /// The value must be URL encoded.
  Future<void> deleteBucket({
    @_s.required String accountId,
    @_s.required String bucket,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''^\d{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(bucket, 'bucket');
    _s.validateStringLength(
      'bucket',
      bucket,
      3,
      255,
      isRequired: true,
    );
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    await _protocol.send(
      method: 'DELETE',
      requestUri: '/v20180820/bucket/${Uri.encodeComponent(bucket)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// <note>
  /// This API action deletes an Amazon S3 on Outposts bucket's lifecycle
  /// configuration. To delete an S3 bucket's lifecycle configuration, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketLifecycle.html">DeleteBucketLifecycle</a>
  /// in the <i>Amazon Simple Storage Service API</i>.
  /// </note>
  /// Deletes the lifecycle configuration from the specified Outposts bucket.
  /// Amazon S3 on Outposts removes all the lifecycle configuration rules in the
  /// lifecycle subresource associated with the bucket. Your objects never
  /// expire, and Amazon S3 on Outposts no longer automatically deletes any
  /// objects on the basis of rules contained in the deleted lifecycle
  /// configuration. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using
  /// Amazon S3 on Outposts</a> in <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// To use this operation, you must have permission to perform the
  /// <code>s3-outposts:DeleteLifecycleConfiguration</code> action. By default,
  /// the bucket owner has this permission and the Outposts bucket owner can
  /// grant this permission to others.
  ///
  /// All Amazon S3 on Outposts REST API requests for this action require an
  /// additional parameter of <code>x-amz-outpost-id</code> to be passed with
  /// the request and an S3 on Outposts endpoint hostname prefix instead of
  /// <code>s3-control</code>. For an example of the request syntax for Amazon
  /// S3 on Outposts that uses the S3 on Outposts endpoint hostname prefix and
  /// the <code>x-amz-outpost-id</code> derived using the access point ARN, see
  /// the <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DeleteBucketLifecycleConfiguration.html#API_control_DeleteBucketLifecycleConfiguration_Examples">Examples</a>
  /// section.
  ///
  /// For more information about object expiration, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/intro-lifecycle-rules.html#intro-lifecycle-rules-actions">
  /// Elements to Describe Lifecycle Actions</a>.
  ///
  /// Related actions include:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_PutBucketLifecycleConfiguration.html">PutBucketLifecycleConfiguration</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_GetBucketLifecycleConfiguration.html">GetBucketLifecycleConfiguration</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [accountId] :
  /// The account ID of the lifecycle configuration to delete.
  ///
  /// Parameter [bucket] :
  /// Specifies the bucket.
  ///
  /// For using this parameter with Amazon S3 on Outposts with the REST API, you
  /// must specify the name and the x-amz-outpost-id as well.
  ///
  /// For using this parameter with S3 on Outposts with the AWS SDK and CLI, you
  /// must specify the ARN of the bucket accessed in the format
  /// <code>arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/bucket/&lt;my-bucket-name&gt;</code>.
  /// For example, to access the bucket <code>reports</code> through outpost
  /// <code>my-outpost</code> owned by account <code>123456789012</code> in
  /// Region <code>us-west-2</code>, use the URL encoding of
  /// <code>arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/bucket/reports</code>.
  /// The value must be URL encoded.
  Future<void> deleteBucketLifecycleConfiguration({
    @_s.required String accountId,
    @_s.required String bucket,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''^\d{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(bucket, 'bucket');
    _s.validateStringLength(
      'bucket',
      bucket,
      3,
      255,
      isRequired: true,
    );
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    await _protocol.send(
      method: 'DELETE',
      requestUri:
          '/v20180820/bucket/${Uri.encodeComponent(bucket)}/lifecycleconfiguration',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// <note>
  /// This API operation deletes an Amazon S3 on Outposts bucket policy. To
  /// delete an S3 bucket policy, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketPolicy.html">DeleteBucketPolicy</a>
  /// in the <i>Amazon Simple Storage Service API</i>.
  /// </note>
  /// This implementation of the DELETE operation uses the policy subresource to
  /// delete the policy of a specified Amazon S3 on Outposts bucket. If you are
  /// using an identity other than the root user of the AWS account that owns
  /// the bucket, the calling identity must have the
  /// <code>s3-outposts:DeleteBucketPolicy</code> permissions on the specified
  /// Outposts bucket and belong to the bucket owner's account to use this
  /// operation. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using
  /// Amazon S3 on Outposts</a> in <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// If you don't have <code>DeleteBucketPolicy</code> permissions, Amazon S3
  /// returns a <code>403 Access Denied</code> error. If you have the correct
  /// permissions, but you're not using an identity that belongs to the bucket
  /// owner's account, Amazon S3 returns a <code>405 Method Not Allowed</code>
  /// error.
  /// <important>
  /// As a security precaution, the root user of the AWS account that owns a
  /// bucket can always use this operation, even if the policy explicitly denies
  /// the root user the ability to perform this action.
  /// </important>
  /// For more information about bucket policies, see <a href="
  /// https://docs.aws.amazon.com/AmazonS3/latest/dev/using-iam-policies.html">Using
  /// Bucket Policies and User Policies</a>.
  ///
  /// All Amazon S3 on Outposts REST API requests for this action require an
  /// additional parameter of <code>x-amz-outpost-id</code> to be passed with
  /// the request and an S3 on Outposts endpoint hostname prefix instead of
  /// <code>s3-control</code>. For an example of the request syntax for Amazon
  /// S3 on Outposts that uses the S3 on Outposts endpoint hostname prefix and
  /// the <code>x-amz-outpost-id</code> derived using the access point ARN, see
  /// the <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DeleteBucketPolicy.html#API_control_DeleteBucketPolicy_Examples">Examples</a>
  /// section.
  ///
  /// The following actions are related to <code>DeleteBucketPolicy</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_GetBucketPolicy.html">GetBucketPolicy</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_PutBucketPolicy.html">PutBucketPolicy</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [accountId] :
  /// The account ID of the Outposts bucket.
  ///
  /// Parameter [bucket] :
  /// Specifies the bucket.
  ///
  /// For using this parameter with Amazon S3 on Outposts with the REST API, you
  /// must specify the name and the x-amz-outpost-id as well.
  ///
  /// For using this parameter with S3 on Outposts with the AWS SDK and CLI, you
  /// must specify the ARN of the bucket accessed in the format
  /// <code>arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/bucket/&lt;my-bucket-name&gt;</code>.
  /// For example, to access the bucket <code>reports</code> through outpost
  /// <code>my-outpost</code> owned by account <code>123456789012</code> in
  /// Region <code>us-west-2</code>, use the URL encoding of
  /// <code>arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/bucket/reports</code>.
  /// The value must be URL encoded.
  Future<void> deleteBucketPolicy({
    @_s.required String accountId,
    @_s.required String bucket,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''^\d{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(bucket, 'bucket');
    _s.validateStringLength(
      'bucket',
      bucket,
      3,
      255,
      isRequired: true,
    );
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    await _protocol.send(
      method: 'DELETE',
      requestUri: '/v20180820/bucket/${Uri.encodeComponent(bucket)}/policy',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// <note>
  /// This operation deletes an Amazon S3 on Outposts bucket's tags. To delete
  /// an S3 bucket tags, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketTagging.html">DeleteBucketTagging</a>
  /// in the <i>Amazon Simple Storage Service API</i>.
  /// </note>
  /// Deletes the tags from the Outposts bucket. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using
  /// Amazon S3 on Outposts</a> in <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// To use this operation, you must have permission to perform the
  /// <code>PutBucketTagging</code> action. By default, the bucket owner has
  /// this permission and can grant this permission to others.
  ///
  /// All Amazon S3 on Outposts REST API requests for this action require an
  /// additional parameter of <code>x-amz-outpost-id</code> to be passed with
  /// the request and an S3 on Outposts endpoint hostname prefix instead of
  /// <code>s3-control</code>. For an example of the request syntax for Amazon
  /// S3 on Outposts that uses the S3 on Outposts endpoint hostname prefix and
  /// the <code>x-amz-outpost-id</code> derived using the access point ARN, see
  /// the <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DeleteBucketTagging.html#API_control_DeleteBucketTagging_Examples">Examples</a>
  /// section.
  ///
  /// The following actions are related to <code>DeleteBucketTagging</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_GetBucketTagging.html">GetBucketTagging</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_PutBucketTagging.html">PutBucketTagging</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [accountId] :
  /// The AWS account ID of the Outposts bucket tag set to be removed.
  ///
  /// Parameter [bucket] :
  /// The bucket ARN that has the tag set to be removed.
  ///
  /// For using this parameter with Amazon S3 on Outposts with the REST API, you
  /// must specify the name and the x-amz-outpost-id as well.
  ///
  /// For using this parameter with S3 on Outposts with the AWS SDK and CLI, you
  /// must specify the ARN of the bucket accessed in the format
  /// <code>arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/bucket/&lt;my-bucket-name&gt;</code>.
  /// For example, to access the bucket <code>reports</code> through outpost
  /// <code>my-outpost</code> owned by account <code>123456789012</code> in
  /// Region <code>us-west-2</code>, use the URL encoding of
  /// <code>arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/bucket/reports</code>.
  /// The value must be URL encoded.
  Future<void> deleteBucketTagging({
    @_s.required String accountId,
    @_s.required String bucket,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''^\d{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(bucket, 'bucket');
    _s.validateStringLength(
      'bucket',
      bucket,
      3,
      255,
      isRequired: true,
    );
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    await _protocol.send(
      method: 'DELETE',
      requestUri: '/v20180820/bucket/${Uri.encodeComponent(bucket)}/tagging',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes the entire tag set from the specified S3 Batch Operations job. To
  /// use this operation, you must have permission to perform the
  /// <code>s3:DeleteJobTagging</code> action. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/batch-ops-managing-jobs.html#batch-ops-job-tags">Controlling
  /// access and labeling jobs using tags</a> in the <i>Amazon Simple Storage
  /// Service Developer Guide</i>.
  /// <p/>
  /// Related actions include:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_CreateJob.html">CreateJob</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_GetJobTagging.html">GetJobTagging</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_PutJobTagging.html">PutJobTagging</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InternalServiceException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [accountId] :
  /// The AWS account ID associated with the S3 Batch Operations job.
  ///
  /// Parameter [jobId] :
  /// The ID for the S3 Batch Operations job whose tags you want to delete.
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
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''^\d{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      5,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'jobId',
      jobId,
      r'''[a-zA-Z0-9\-\_]+''',
      isRequired: true,
    );
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    await _protocol.send(
      method: 'DELETE',
      requestUri: '/v20180820/jobs/${Uri.encodeComponent(jobId)}/tagging',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes the <code>PublicAccessBlock</code> configuration for an AWS
  /// account. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html">
  /// Using Amazon S3 block public access</a>.
  ///
  /// Related actions include:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_GetPublicAccessBlock.html">GetPublicAccessBlock</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_PutPublicAccessBlock.html">PutPublicAccessBlock</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [accountId] :
  /// The account ID for the AWS account whose <code>PublicAccessBlock</code>
  /// configuration you want to remove.
  Future<void> deletePublicAccessBlock({
    @_s.required String accountId,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''^\d{12}$''',
      isRequired: true,
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

  /// Deletes the Amazon S3 Storage Lens configuration. For more information
  /// about S3 Storage Lens, see <a
  /// href="https://docs.aws.amazon.com/https:/docs.aws.amazon.com/AmazonS3/latest/dev/storage_lens.html">Working
  /// with Amazon S3 Storage Lens</a> in the <i>Amazon Simple Storage Service
  /// Developer Guide</i>.
  /// <note>
  /// To use this action, you must have permission to perform the
  /// <code>s3:DeleteStorageLensConfiguration</code> action. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage_lens.html#storage_lens_IAM">Setting
  /// permissions to use Amazon S3 Storage Lens</a> in the <i>Amazon Simple
  /// Storage Service Developer Guide</i>.
  /// </note>
  ///
  /// Parameter [accountId] :
  /// The account ID of the requester.
  ///
  /// Parameter [configId] :
  /// The ID of the S3 Storage Lens configuration.
  Future<void> deleteStorageLensConfiguration({
    @_s.required String accountId,
    @_s.required String configId,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''^\d{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(configId, 'configId');
    _s.validateStringLength(
      'configId',
      configId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'configId',
      configId,
      r'''[a-zA-Z0-9\-\_\.]+''',
      isRequired: true,
    );
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    await _protocol.send(
      method: 'DELETE',
      requestUri: '/v20180820/storagelens/${Uri.encodeComponent(configId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the Amazon S3 Storage Lens configuration tags. For more
  /// information about S3 Storage Lens, see <a
  /// href="https://docs.aws.amazon.com/https:/docs.aws.amazon.com/AmazonS3/latest/dev/storage_lens.html">Working
  /// with Amazon S3 Storage Lens</a> in the <i>Amazon Simple Storage Service
  /// Developer Guide</i>.
  /// <note>
  /// To use this action, you must have permission to perform the
  /// <code>s3:DeleteStorageLensConfigurationTagging</code> action. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage_lens.html#storage_lens_IAM">Setting
  /// permissions to use Amazon S3 Storage Lens</a> in the <i>Amazon Simple
  /// Storage Service Developer Guide</i>.
  /// </note>
  ///
  /// Parameter [accountId] :
  /// The account ID of the requester.
  ///
  /// Parameter [configId] :
  /// The ID of the S3 Storage Lens configuration.
  Future<void> deleteStorageLensConfigurationTagging({
    @_s.required String accountId,
    @_s.required String configId,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''^\d{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(configId, 'configId');
    _s.validateStringLength(
      'configId',
      configId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'configId',
      configId,
      r'''[a-zA-Z0-9\-\_\.]+''',
      isRequired: true,
    );
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    await _protocol.send(
      method: 'DELETE',
      requestUri:
          '/v20180820/storagelens/${Uri.encodeComponent(configId)}/tagging',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves the configuration parameters and status for a Batch Operations
  /// job. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/batch-ops-basics.html">S3
  /// Batch Operations</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  /// <p/>
  /// Related actions include:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_CreateJob.html">CreateJob</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_ListJobs.html">ListJobs</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_UpdateJobPriority.html">UpdateJobPriority</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_UpdateJobStatus.html">UpdateJobStatus</a>
  /// </li>
  /// </ul>
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
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''^\d{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      5,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'jobId',
      jobId,
      r'''[a-zA-Z0-9\-\_]+''',
      isRequired: true,
    );
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/v20180820/jobs/${Uri.encodeComponent(jobId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeJobResult.fromXml($result.body);
  }

  /// Returns configuration information about the specified access point.
  /// <p/>
  /// All Amazon S3 on Outposts REST API requests for this action require an
  /// additional parameter of <code>x-amz-outpost-id</code> to be passed with
  /// the request and an S3 on Outposts endpoint hostname prefix instead of
  /// <code>s3-control</code>. For an example of the request syntax for Amazon
  /// S3 on Outposts that uses the S3 on Outposts endpoint hostname prefix and
  /// the <code>x-amz-outpost-id</code> derived using the access point ARN, see
  /// the <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_GetAccessPoint.html#API_control_GetAccessPoint_Examples">Examples</a>
  /// section.
  ///
  /// The following actions are related to <code>GetAccessPoint</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_CreateAccessPoint.html">CreateAccessPoint</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DeleteAccessPoint.html">DeleteAccessPoint</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_ListAccessPoints.html">ListAccessPoints</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [accountId] :
  /// The account ID for the account that owns the specified access point.
  ///
  /// Parameter [name] :
  /// The name of the access point whose configuration information you want to
  /// retrieve.
  ///
  /// For using this parameter with Amazon S3 on Outposts with the REST API, you
  /// must specify the name and the x-amz-outpost-id as well.
  ///
  /// For using this parameter with S3 on Outposts with the AWS SDK and CLI, you
  /// must specify the ARN of the access point accessed in the format
  /// <code>arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/accesspoint/&lt;my-accesspoint-name&gt;</code>.
  /// For example, to access the access point <code>reports-ap</code> through
  /// outpost <code>my-outpost</code> owned by account <code>123456789012</code>
  /// in Region <code>us-west-2</code>, use the URL encoding of
  /// <code>arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/accesspoint/reports-ap</code>.
  /// The value must be URL encoded.
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
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''^\d{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      3,
      50,
      isRequired: true,
    );
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/v20180820/accesspoint/${Uri.encodeComponent(name)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetAccessPointResult.fromXml($result.body);
  }

  /// Returns the access point policy associated with the specified access
  /// point.
  ///
  /// The following actions are related to <code>GetAccessPointPolicy</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_PutAccessPointPolicy.html">PutAccessPointPolicy</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DeleteAccessPointPolicy.html">DeleteAccessPointPolicy</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [accountId] :
  /// The account ID for the account that owns the specified access point.
  ///
  /// Parameter [name] :
  /// The name of the access point whose policy you want to retrieve.
  ///
  /// For using this parameter with Amazon S3 on Outposts with the REST API, you
  /// must specify the name and the x-amz-outpost-id as well.
  ///
  /// For using this parameter with S3 on Outposts with the AWS SDK and CLI, you
  /// must specify the ARN of the access point accessed in the format
  /// <code>arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/accesspoint/&lt;my-accesspoint-name&gt;</code>.
  /// For example, to access the access point <code>reports-ap</code> through
  /// outpost <code>my-outpost</code> owned by account <code>123456789012</code>
  /// in Region <code>us-west-2</code>, use the URL encoding of
  /// <code>arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/accesspoint/reports-ap</code>.
  /// The value must be URL encoded.
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
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''^\d{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      3,
      50,
      isRequired: true,
    );
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/v20180820/accesspoint/${Uri.encodeComponent(name)}/policy',
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
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''^\d{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      3,
      50,
      isRequired: true,
    );
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    final $result = await _protocol.send(
      method: 'GET',
      requestUri:
          '/v20180820/accesspoint/${Uri.encodeComponent(name)}/policyStatus',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetAccessPointPolicyStatusResult.fromXml($result.body);
  }

  /// Gets an Amazon S3 on Outposts bucket. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">
  /// Using Amazon S3 on Outposts</a> in the <i>Amazon Simple Storage Service
  /// Developer Guide</i>.
  ///
  /// If you are using an identity other than the root user of the AWS account
  /// that owns the bucket, the calling identity must have the
  /// <code>s3-outposts:GetBucket</code> permissions on the specified bucket and
  /// belong to the bucket owner's account in order to use this operation. Only
  /// users from Outposts bucket owner account with the right permissions can
  /// perform actions on an Outposts bucket.
  ///
  /// If you don't have <code>s3-outposts:GetBucket</code> permissions or you're
  /// not using an identity that belongs to the bucket owner's account, Amazon
  /// S3 returns a <code>403 Access Denied</code> error.
  ///
  /// The following actions are related to <code>GetBucket</code> for Amazon S3
  /// on Outposts:
  ///
  /// All Amazon S3 on Outposts REST API requests for this action require an
  /// additional parameter of <code>x-amz-outpost-id</code> to be passed with
  /// the request and an S3 on Outposts endpoint hostname prefix instead of
  /// <code>s3-control</code>. For an example of the request syntax for Amazon
  /// S3 on Outposts that uses the S3 on Outposts endpoint hostname prefix and
  /// the <code>x-amz-outpost-id</code> derived using the access point ARN, see
  /// the <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_GetBucket.html#API_control_GetBucket_Examples">Examples</a>
  /// section.
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutObject.html">PutObject</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_CreateBucket.html">CreateBucket</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DeleteBucket.html">DeleteBucket</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [accountId] :
  /// The AWS account ID of the Outposts bucket.
  ///
  /// Parameter [bucket] :
  /// Specifies the bucket.
  ///
  /// For using this parameter with Amazon S3 on Outposts with the REST API, you
  /// must specify the name and the x-amz-outpost-id as well.
  ///
  /// For using this parameter with S3 on Outposts with the AWS SDK and CLI, you
  /// must specify the ARN of the bucket accessed in the format
  /// <code>arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/bucket/&lt;my-bucket-name&gt;</code>.
  /// For example, to access the bucket <code>reports</code> through outpost
  /// <code>my-outpost</code> owned by account <code>123456789012</code> in
  /// Region <code>us-west-2</code>, use the URL encoding of
  /// <code>arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/bucket/reports</code>.
  /// The value must be URL encoded.
  Future<GetBucketResult> getBucket({
    @_s.required String accountId,
    @_s.required String bucket,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''^\d{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(bucket, 'bucket');
    _s.validateStringLength(
      'bucket',
      bucket,
      3,
      255,
      isRequired: true,
    );
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/v20180820/bucket/${Uri.encodeComponent(bucket)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetBucketResult.fromXml($result.body);
  }

  /// <note>
  /// This operation gets an Amazon S3 on Outposts bucket's lifecycle
  /// configuration. To get an S3 bucket's lifecycle configuration, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketLifecycleConfiguration.html">GetBucketLifecycleConfiguration</a>
  /// in the <i>Amazon Simple Storage Service API</i>.
  /// </note>
  /// Returns the lifecycle configuration information set on the Outposts
  /// bucket. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using
  /// Amazon S3 on Outposts</a> and for information about lifecycle
  /// configuration, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lifecycle-mgmt.html">
  /// Object Lifecycle Management</a> in <i>Amazon Simple Storage Service
  /// Developer Guide</i>.
  ///
  /// To use this operation, you must have permission to perform the
  /// <code>s3-outposts:GetLifecycleConfiguration</code> action. The Outposts
  /// bucket owner has this permission, by default. The bucket owner can grant
  /// this permission to others. For more information about permissions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">Permissions
  /// Related to Bucket Subresource Operations</a> and <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing
  /// Access Permissions to Your Amazon S3 Resources</a>.
  ///
  /// All Amazon S3 on Outposts REST API requests for this action require an
  /// additional parameter of <code>x-amz-outpost-id</code> to be passed with
  /// the request and an S3 on Outposts endpoint hostname prefix instead of
  /// <code>s3-control</code>. For an example of the request syntax for Amazon
  /// S3 on Outposts that uses the S3 on Outposts endpoint hostname prefix and
  /// the <code>x-amz-outpost-id</code> derived using the access point ARN, see
  /// the <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_GetBucketLifecycleConfiguration.html#API_control_GetBucketLifecycleConfiguration_Examples">Examples</a>
  /// section.
  ///
  /// <code>GetBucketLifecycleConfiguration</code> has the following special
  /// error:
  ///
  /// <ul>
  /// <li>
  /// Error code: <code>NoSuchLifecycleConfiguration</code>
  ///
  /// <ul>
  /// <li>
  /// Description: The lifecycle configuration does not exist.
  /// </li>
  /// <li>
  /// HTTP Status Code: 404 Not Found
  /// </li>
  /// <li>
  /// SOAP Fault Code Prefix: Client
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// The following actions are related to
  /// <code>GetBucketLifecycleConfiguration</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_PutBucketLifecycleConfiguration.html">PutBucketLifecycleConfiguration</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DeleteBucketLifecycleConfiguration.html">DeleteBucketLifecycleConfiguration</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [accountId] :
  /// The AWS account ID of the Outposts bucket.
  ///
  /// Parameter [bucket] :
  /// The Amazon Resource Name (ARN) of the bucket.
  ///
  /// For using this parameter with Amazon S3 on Outposts with the REST API, you
  /// must specify the name and the x-amz-outpost-id as well.
  ///
  /// For using this parameter with S3 on Outposts with the AWS SDK and CLI, you
  /// must specify the ARN of the bucket accessed in the format
  /// <code>arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/bucket/&lt;my-bucket-name&gt;</code>.
  /// For example, to access the bucket <code>reports</code> through outpost
  /// <code>my-outpost</code> owned by account <code>123456789012</code> in
  /// Region <code>us-west-2</code>, use the URL encoding of
  /// <code>arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/bucket/reports</code>.
  /// The value must be URL encoded.
  Future<GetBucketLifecycleConfigurationResult>
      getBucketLifecycleConfiguration({
    @_s.required String accountId,
    @_s.required String bucket,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''^\d{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(bucket, 'bucket');
    _s.validateStringLength(
      'bucket',
      bucket,
      3,
      255,
      isRequired: true,
    );
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    final $result = await _protocol.send(
      method: 'GET',
      requestUri:
          '/v20180820/bucket/${Uri.encodeComponent(bucket)}/lifecycleconfiguration',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetBucketLifecycleConfigurationResult.fromXml($result.body);
  }

  /// <note>
  /// This action gets a bucket policy for an Amazon S3 on Outposts bucket. To
  /// get a policy for an S3 bucket, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketPolicy.html">GetBucketPolicy</a>
  /// in the <i>Amazon Simple Storage Service API</i>.
  /// </note>
  /// Returns the policy of a specified Outposts bucket. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using
  /// Amazon S3 on Outposts</a> in the <i>Amazon Simple Storage Service
  /// Developer Guide</i>.
  ///
  /// If you are using an identity other than the root user of the AWS account
  /// that owns the bucket, the calling identity must have the
  /// <code>GetBucketPolicy</code> permissions on the specified bucket and
  /// belong to the bucket owner's account in order to use this operation.
  ///
  /// Only users from Outposts bucket owner account with the right permissions
  /// can perform actions on an Outposts bucket. If you don't have
  /// <code>s3-outposts:GetBucketPolicy</code> permissions or you're not using
  /// an identity that belongs to the bucket owner's account, Amazon S3 returns
  /// a <code>403 Access Denied</code> error.
  /// <important>
  /// As a security precaution, the root user of the AWS account that owns a
  /// bucket can always use this operation, even if the policy explicitly denies
  /// the root user the ability to perform this action.
  /// </important>
  /// For more information about bucket policies, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-iam-policies.html">Using
  /// Bucket Policies and User Policies</a>.
  ///
  /// All Amazon S3 on Outposts REST API requests for this action require an
  /// additional parameter of <code>x-amz-outpost-id</code> to be passed with
  /// the request and an S3 on Outposts endpoint hostname prefix instead of
  /// <code>s3-control</code>. For an example of the request syntax for Amazon
  /// S3 on Outposts that uses the S3 on Outposts endpoint hostname prefix and
  /// the <code>x-amz-outpost-id</code> derived using the access point ARN, see
  /// the <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_GetBucketPolicy.html#API_control_GetBucketPolicy_Examples">Examples</a>
  /// section.
  ///
  /// The following actions are related to <code>GetBucketPolicy</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html">GetObject</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_PutBucketPolicy.html">PutBucketPolicy</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DeleteBucketPolicy.html">DeleteBucketPolicy</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [accountId] :
  /// The AWS account ID of the Outposts bucket.
  ///
  /// Parameter [bucket] :
  /// Specifies the bucket.
  ///
  /// For using this parameter with Amazon S3 on Outposts with the REST API, you
  /// must specify the name and the x-amz-outpost-id as well.
  ///
  /// For using this parameter with S3 on Outposts with the AWS SDK and CLI, you
  /// must specify the ARN of the bucket accessed in the format
  /// <code>arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/bucket/&lt;my-bucket-name&gt;</code>.
  /// For example, to access the bucket <code>reports</code> through outpost
  /// <code>my-outpost</code> owned by account <code>123456789012</code> in
  /// Region <code>us-west-2</code>, use the URL encoding of
  /// <code>arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/bucket/reports</code>.
  /// The value must be URL encoded.
  Future<GetBucketPolicyResult> getBucketPolicy({
    @_s.required String accountId,
    @_s.required String bucket,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''^\d{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(bucket, 'bucket');
    _s.validateStringLength(
      'bucket',
      bucket,
      3,
      255,
      isRequired: true,
    );
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/v20180820/bucket/${Uri.encodeComponent(bucket)}/policy',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetBucketPolicyResult.fromXml($result.body);
  }

  /// <note>
  /// This operation gets an Amazon S3 on Outposts bucket's tags. To get an S3
  /// bucket tags, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketTagging.html">GetBucketTagging</a>
  /// in the <i>Amazon Simple Storage Service API</i>.
  /// </note>
  /// Returns the tag set associated with the Outposts bucket. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using
  /// Amazon S3 on Outposts</a> in the <i>Amazon Simple Storage Service
  /// Developer Guide</i>.
  ///
  /// To use this operation, you must have permission to perform the
  /// <code>GetBucketTagging</code> action. By default, the bucket owner has
  /// this permission and can grant this permission to others.
  ///
  /// <code>GetBucketTagging</code> has the following special error:
  ///
  /// <ul>
  /// <li>
  /// Error code: <code>NoSuchTagSetError</code>
  ///
  /// <ul>
  /// <li>
  /// Description: There is no tag set associated with the bucket.
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// All Amazon S3 on Outposts REST API requests for this action require an
  /// additional parameter of <code>x-amz-outpost-id</code> to be passed with
  /// the request and an S3 on Outposts endpoint hostname prefix instead of
  /// <code>s3-control</code>. For an example of the request syntax for Amazon
  /// S3 on Outposts that uses the S3 on Outposts endpoint hostname prefix and
  /// the <code>x-amz-outpost-id</code> derived using the access point ARN, see
  /// the <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_GetBucketTagging.html#API_control_GetBucketTagging_Examples">Examples</a>
  /// section.
  ///
  /// The following actions are related to <code>GetBucketTagging</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_PutBucketTagging.html">PutBucketTagging</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DeleteBucketTagging.html">DeleteBucketTagging</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [accountId] :
  /// The AWS account ID of the Outposts bucket.
  ///
  /// Parameter [bucket] :
  /// Specifies the bucket.
  ///
  /// For using this parameter with Amazon S3 on Outposts with the REST API, you
  /// must specify the name and the x-amz-outpost-id as well.
  ///
  /// For using this parameter with S3 on Outposts with the AWS SDK and CLI, you
  /// must specify the ARN of the bucket accessed in the format
  /// <code>arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/bucket/&lt;my-bucket-name&gt;</code>.
  /// For example, to access the bucket <code>reports</code> through outpost
  /// <code>my-outpost</code> owned by account <code>123456789012</code> in
  /// Region <code>us-west-2</code>, use the URL encoding of
  /// <code>arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/bucket/reports</code>.
  /// The value must be URL encoded.
  Future<GetBucketTaggingResult> getBucketTagging({
    @_s.required String accountId,
    @_s.required String bucket,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''^\d{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(bucket, 'bucket');
    _s.validateStringLength(
      'bucket',
      bucket,
      3,
      255,
      isRequired: true,
    );
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/v20180820/bucket/${Uri.encodeComponent(bucket)}/tagging',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetBucketTaggingResult.fromXml($result.body);
  }

  /// Returns the tags on an S3 Batch Operations job. To use this operation, you
  /// must have permission to perform the <code>s3:GetJobTagging</code> action.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/batch-ops-managing-jobs.html#batch-ops-job-tags">Controlling
  /// access and labeling jobs using tags</a> in the <i>Amazon Simple Storage
  /// Service Developer Guide</i>.
  /// <p/>
  /// Related actions include:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_CreateJob.html">CreateJob</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_PutJobTagging.html">PutJobTagging</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DeleteJobTagging.html">DeleteJobTagging</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InternalServiceException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [accountId] :
  /// The AWS account ID associated with the S3 Batch Operations job.
  ///
  /// Parameter [jobId] :
  /// The ID for the S3 Batch Operations job whose tags you want to retrieve.
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
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''^\d{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      5,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'jobId',
      jobId,
      r'''[a-zA-Z0-9\-\_]+''',
      isRequired: true,
    );
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/v20180820/jobs/${Uri.encodeComponent(jobId)}/tagging',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetJobTaggingResult.fromXml($result.body);
  }

  /// Retrieves the <code>PublicAccessBlock</code> configuration for an AWS
  /// account. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html">
  /// Using Amazon S3 block public access</a>.
  ///
  /// Related actions include:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DeletePublicAccessBlock.html">DeletePublicAccessBlock</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_PutPublicAccessBlock.html">PutPublicAccessBlock</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [NoSuchPublicAccessBlockConfiguration].
  ///
  /// Parameter [accountId] :
  /// The account ID for the AWS account whose <code>PublicAccessBlock</code>
  /// configuration you want to retrieve.
  Future<GetPublicAccessBlockOutput> getPublicAccessBlock({
    @_s.required String accountId,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''^\d{12}$''',
      isRequired: true,
    );
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri: '/v20180820/configuration/publicAccessBlock',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return GetPublicAccessBlockOutput(
      publicAccessBlockConfiguration:
          PublicAccessBlockConfiguration.fromXml($elem),
    );
  }

  /// Gets the Amazon S3 Storage Lens configuration. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/https:/docs.aws.amazon.com/AmazonS3/latest/dev/storage_lens.html">Working
  /// with Amazon S3 Storage Lens</a> in the <i>Amazon Simple Storage Service
  /// Developer Guide</i>.
  /// <note>
  /// To use this action, you must have permission to perform the
  /// <code>s3:GetStorageLensConfiguration</code> action. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage_lens.html#storage_lens_IAM">Setting
  /// permissions to use Amazon S3 Storage Lens</a> in the <i>Amazon Simple
  /// Storage Service Developer Guide</i>.
  /// </note>
  ///
  /// Parameter [accountId] :
  /// The account ID of the requester.
  ///
  /// Parameter [configId] :
  /// The ID of the Amazon S3 Storage Lens configuration.
  Future<GetStorageLensConfigurationResult> getStorageLensConfiguration({
    @_s.required String accountId,
    @_s.required String configId,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''^\d{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(configId, 'configId');
    _s.validateStringLength(
      'configId',
      configId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'configId',
      configId,
      r'''[a-zA-Z0-9\-\_\.]+''',
      isRequired: true,
    );
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri: '/v20180820/storagelens/${Uri.encodeComponent(configId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return GetStorageLensConfigurationResult(
      storageLensConfiguration: StorageLensConfiguration.fromXml($elem),
    );
  }

  /// Gets the tags of Amazon S3 Storage Lens configuration. For more
  /// information about S3 Storage Lens, see <a
  /// href="https://docs.aws.amazon.com/https:/docs.aws.amazon.com/AmazonS3/latest/dev/storage_lens.html">Working
  /// with Amazon S3 Storage Lens</a> in the <i>Amazon Simple Storage Service
  /// Developer Guide</i>.
  /// <note>
  /// To use this action, you must have permission to perform the
  /// <code>s3:GetStorageLensConfigurationTagging</code> action. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage_lens.html#storage_lens_IAM">Setting
  /// permissions to use Amazon S3 Storage Lens</a> in the <i>Amazon Simple
  /// Storage Service Developer Guide</i>.
  /// </note>
  ///
  /// Parameter [accountId] :
  /// The account ID of the requester.
  ///
  /// Parameter [configId] :
  /// The ID of the Amazon S3 Storage Lens configuration.
  Future<GetStorageLensConfigurationTaggingResult>
      getStorageLensConfigurationTagging({
    @_s.required String accountId,
    @_s.required String configId,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''^\d{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(configId, 'configId');
    _s.validateStringLength(
      'configId',
      configId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'configId',
      configId,
      r'''[a-zA-Z0-9\-\_\.]+''',
      isRequired: true,
    );
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    final $result = await _protocol.send(
      method: 'GET',
      requestUri:
          '/v20180820/storagelens/${Uri.encodeComponent(configId)}/tagging',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetStorageLensConfigurationTaggingResult.fromXml($result.body);
  }

  /// Returns a list of the access points currently associated with the
  /// specified bucket. You can retrieve up to 1000 access points per call. If
  /// the specified bucket has more than 1,000 access points (or the number
  /// specified in <code>maxResults</code>, whichever is less), the response
  /// will include a continuation token that you can use to list the additional
  /// access points.
  /// <p/>
  /// All Amazon S3 on Outposts REST API requests for this action require an
  /// additional parameter of <code>x-amz-outpost-id</code> to be passed with
  /// the request and an S3 on Outposts endpoint hostname prefix instead of
  /// <code>s3-control</code>. For an example of the request syntax for Amazon
  /// S3 on Outposts that uses the S3 on Outposts endpoint hostname prefix and
  /// the <code>x-amz-outpost-id</code> derived using the access point ARN, see
  /// the <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_GetAccessPoint.html#API_control_GetAccessPoint_Examples">Examples</a>
  /// section.
  ///
  /// The following actions are related to <code>ListAccessPoints</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_CreateAccessPoint.html">CreateAccessPoint</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DeleteAccessPoint.html">DeleteAccessPoint</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_GetAccessPoint.html">GetAccessPoint</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [accountId] :
  /// The AWS account ID for owner of the bucket whose access points you want to
  /// list.
  ///
  /// Parameter [bucket] :
  /// The name of the bucket whose associated access points you want to list.
  ///
  /// For using this parameter with Amazon S3 on Outposts with the REST API, you
  /// must specify the name and the x-amz-outpost-id as well.
  ///
  /// For using this parameter with S3 on Outposts with the AWS SDK and CLI, you
  /// must specify the ARN of the bucket accessed in the format
  /// <code>arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/bucket/&lt;my-bucket-name&gt;</code>.
  /// For example, to access the bucket <code>reports</code> through outpost
  /// <code>my-outpost</code> owned by account <code>123456789012</code> in
  /// Region <code>us-west-2</code>, use the URL encoding of
  /// <code>arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/bucket/reports</code>.
  /// The value must be URL encoded.
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
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''^\d{12}$''',
      isRequired: true,
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
      0,
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
    final $query = <String, List<String>>{
      if (bucket != null) 'bucket': [bucket],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/v20180820/accesspoint',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListAccessPointsResult.fromXml($result.body);
  }

  /// Lists current S3 Batch Operations jobs and jobs that have ended within the
  /// last 30 days for the AWS account making the request. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/batch-ops-basics.html">S3
  /// Batch Operations</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// Related actions include:
  /// <p/>
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_CreateJob.html">CreateJob</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DescribeJob.html">DescribeJob</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_UpdateJobPriority.html">UpdateJobPriority</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_UpdateJobStatus.html">UpdateJobStatus</a>
  /// </li>
  /// </ul>
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
    List<JobStatus> jobStatuses,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''^\d{12}$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      1000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[A-Za-z0-9\+\:\/\=\?\#-_]+$''',
    );
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    final $query = <String, List<String>>{
      if (jobStatuses != null)
        'jobStatuses': jobStatuses.map((e) => e?.toValue() ?? '').toList(),
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/v20180820/jobs',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListJobsResult.fromXml($result.body);
  }

  /// Returns a list of all Outposts buckets in an Outpost that are owned by the
  /// authenticated sender of the request. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using
  /// Amazon S3 on Outposts</a> in the <i>Amazon Simple Storage Service
  /// Developer Guide</i>.
  ///
  /// For an example of the request syntax for Amazon S3 on Outposts that uses
  /// the S3 on Outposts endpoint hostname prefix and
  /// <code>x-amz-outpost-id</code> in your request, see the <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_ListRegionalBuckets.html#API_control_ListRegionalBuckets_Examples">Examples</a>
  /// section.
  ///
  /// Parameter [accountId] :
  /// The AWS account ID of the Outposts bucket.
  ///
  /// Parameter [maxResults] :
  /// <p/>
  ///
  /// Parameter [nextToken] :
  /// <p/>
  ///
  /// Parameter [outpostId] :
  /// The ID of the AWS Outposts.
  /// <note>
  /// This is required by Amazon S3 on Outposts buckets.
  /// </note>
  Future<ListRegionalBucketsResult> listRegionalBuckets({
    @_s.required String accountId,
    int maxResults,
    String nextToken,
    String outpostId,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''^\d{12}$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      1000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    _s.validateStringLength(
      'outpostId',
      outpostId,
      1,
      64,
    );
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    outpostId?.let((v) => headers['x-amz-outpost-id'] = v.toString());
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/v20180820/bucket',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListRegionalBucketsResult.fromXml($result.body);
  }

  /// Gets a list of Amazon S3 Storage Lens configurations. For more information
  /// about S3 Storage Lens, see <a
  /// href="https://docs.aws.amazon.com/https:/docs.aws.amazon.com/AmazonS3/latest/dev/storage_lens.html">Working
  /// with Amazon S3 Storage Lens</a> in the <i>Amazon Simple Storage Service
  /// Developer Guide</i>.
  /// <note>
  /// To use this action, you must have permission to perform the
  /// <code>s3:ListStorageLensConfigurations</code> action. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage_lens.html#storage_lens_IAM">Setting
  /// permissions to use Amazon S3 Storage Lens</a> in the <i>Amazon Simple
  /// Storage Service Developer Guide</i>.
  /// </note>
  ///
  /// Parameter [accountId] :
  /// The account ID of the requester.
  ///
  /// Parameter [nextToken] :
  /// A pagination token to request the next page of results.
  Future<ListStorageLensConfigurationsResult> listStorageLensConfigurations({
    @_s.required String accountId,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''^\d{12}$''',
      isRequired: true,
    );
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    final $query = <String, List<String>>{
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/v20180820/storagelens',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListStorageLensConfigurationsResult.fromXml($result.body);
  }

  /// Associates an access policy with the specified access point. Each access
  /// point can have only one policy, so a request made to this API replaces any
  /// existing policy associated with the specified access point.
  /// <p/>
  /// All Amazon S3 on Outposts REST API requests for this action require an
  /// additional parameter of <code>x-amz-outpost-id</code> to be passed with
  /// the request and an S3 on Outposts endpoint hostname prefix instead of
  /// <code>s3-control</code>. For an example of the request syntax for Amazon
  /// S3 on Outposts that uses the S3 on Outposts endpoint hostname prefix and
  /// the <code>x-amz-outpost-id</code> derived using the access point ARN, see
  /// the <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_PutAccessPointPolicy.html#API_control_PutAccessPointPolicy_Examples">Examples</a>
  /// section.
  ///
  /// The following actions are related to <code>PutAccessPointPolicy</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_GetAccessPointPolicy.html">GetAccessPointPolicy</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DeleteAccessPointPolicy.html">DeleteAccessPointPolicy</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [accountId] :
  /// The AWS account ID for owner of the bucket associated with the specified
  /// access point.
  ///
  /// Parameter [name] :
  /// The name of the access point that you want to associate with the specified
  /// policy.
  ///
  /// For using this parameter with Amazon S3 on Outposts with the REST API, you
  /// must specify the name and the x-amz-outpost-id as well.
  ///
  /// For using this parameter with S3 on Outposts with the AWS SDK and CLI, you
  /// must specify the ARN of the access point accessed in the format
  /// <code>arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/accesspoint/&lt;my-accesspoint-name&gt;</code>.
  /// For example, to access the access point <code>reports-ap</code> through
  /// outpost <code>my-outpost</code> owned by account <code>123456789012</code>
  /// in Region <code>us-west-2</code>, use the URL encoding of
  /// <code>arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/accesspoint/reports-ap</code>.
  /// The value must be URL encoded.
  ///
  /// Parameter [policy] :
  /// The policy that you want to apply to the specified access point. For more
  /// information about access point policies, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-points.html">Managing
  /// data access with Amazon S3 Access Points</a> in the <i>Amazon Simple
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
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''^\d{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      3,
      50,
      isRequired: true,
    );
    ArgumentError.checkNotNull(policy, 'policy');
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    await _protocol.send(
      method: 'PUT',
      requestUri: '/v20180820/accesspoint/${Uri.encodeComponent(name)}/policy',
      headers: headers,
      payload: PutAccessPointPolicyRequest(
              accountId: accountId, name: name, policy: policy)
          .toXml(
        'PutAccessPointPolicyRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'),
              'http://awss3control.amazonaws.com/doc/2018-08-20/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
  }

  /// <note>
  /// This action puts a lifecycle configuration to an Amazon S3 on Outposts
  /// bucket. To put a lifecycle configuration to an S3 bucket, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketLifecycleConfiguration.html">PutBucketLifecycleConfiguration</a>
  /// in the <i>Amazon Simple Storage Service API</i>.
  /// </note>
  /// Creates a new lifecycle configuration for the Outposts bucket or replaces
  /// an existing lifecycle configuration. Outposts buckets only support
  /// lifecycle configurations that delete/expire objects after a certain period
  /// of time and abort incomplete multipart uploads. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Managing
  /// Lifecycle Permissions for Amazon S3 on Outposts</a>.
  /// <p/>
  /// All Amazon S3 on Outposts REST API requests for this action require an
  /// additional parameter of <code>x-amz-outpost-id</code> to be passed with
  /// the request and an S3 on Outposts endpoint hostname prefix instead of
  /// <code>s3-control</code>. For an example of the request syntax for Amazon
  /// S3 on Outposts that uses the S3 on Outposts endpoint hostname prefix and
  /// the <code>x-amz-outpost-id</code> derived using the access point ARN, see
  /// the <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_PutBucketLifecycleConfiguration.html#API_control_PutBucketLifecycleConfiguration_Examples">Examples</a>
  /// section.
  ///
  /// The following actions are related to
  /// <code>PutBucketLifecycleConfiguration</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_GetBucketLifecycleConfiguration.html">GetBucketLifecycleConfiguration</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DeleteBucketLifecycleConfiguration.html">DeleteBucketLifecycleConfiguration</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [accountId] :
  /// The AWS account ID of the Outposts bucket.
  ///
  /// Parameter [bucket] :
  /// The name of the bucket for which to set the configuration.
  ///
  /// Parameter [lifecycleConfiguration] :
  /// Container for lifecycle rules. You can add as many as 1,000 rules.
  Future<void> putBucketLifecycleConfiguration({
    @_s.required String accountId,
    @_s.required String bucket,
    LifecycleConfiguration lifecycleConfiguration,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''^\d{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(bucket, 'bucket');
    _s.validateStringLength(
      'bucket',
      bucket,
      3,
      255,
      isRequired: true,
    );
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    await _protocol.send(
      method: 'PUT',
      requestUri:
          '/v20180820/bucket/${Uri.encodeComponent(bucket)}/lifecycleconfiguration',
      headers: headers,
      payload: lifecycleConfiguration?.toXml('LifecycleConfiguration'),
      exceptionFnMap: _exceptionFns,
    );
  }

  /// <note>
  /// This action puts a bucket policy to an Amazon S3 on Outposts bucket. To
  /// put a policy on an S3 bucket, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketPolicy.html">PutBucketPolicy</a>
  /// in the <i>Amazon Simple Storage Service API</i>.
  /// </note>
  /// Applies an Amazon S3 bucket policy to an Outposts bucket. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using
  /// Amazon S3 on Outposts</a> in the <i>Amazon Simple Storage Service
  /// Developer Guide</i>.
  ///
  /// If you are using an identity other than the root user of the AWS account
  /// that owns the Outposts bucket, the calling identity must have the
  /// <code>PutBucketPolicy</code> permissions on the specified Outposts bucket
  /// and belong to the bucket owner's account in order to use this operation.
  ///
  /// If you don't have <code>PutBucketPolicy</code> permissions, Amazon S3
  /// returns a <code>403 Access Denied</code> error. If you have the correct
  /// permissions, but you're not using an identity that belongs to the bucket
  /// owner's account, Amazon S3 returns a <code>405 Method Not Allowed</code>
  /// error.
  /// <important>
  /// As a security precaution, the root user of the AWS account that owns a
  /// bucket can always use this operation, even if the policy explicitly denies
  /// the root user the ability to perform this action.
  /// </important>
  /// For more information about bucket policies, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-iam-policies.html">Using
  /// Bucket Policies and User Policies</a>.
  ///
  /// All Amazon S3 on Outposts REST API requests for this action require an
  /// additional parameter of <code>x-amz-outpost-id</code> to be passed with
  /// the request and an S3 on Outposts endpoint hostname prefix instead of
  /// <code>s3-control</code>. For an example of the request syntax for Amazon
  /// S3 on Outposts that uses the S3 on Outposts endpoint hostname prefix and
  /// the <code>x-amz-outpost-id</code> derived using the access point ARN, see
  /// the <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_PutBucketPolicy.html#API_control_PutBucketPolicy_Examples">Examples</a>
  /// section.
  ///
  /// The following actions are related to <code>PutBucketPolicy</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_GetBucketPolicy.html">GetBucketPolicy</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DeleteBucketPolicy.html">DeleteBucketPolicy</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [accountId] :
  /// The AWS account ID of the Outposts bucket.
  ///
  /// Parameter [bucket] :
  /// Specifies the bucket.
  ///
  /// For using this parameter with Amazon S3 on Outposts with the REST API, you
  /// must specify the name and the x-amz-outpost-id as well.
  ///
  /// For using this parameter with S3 on Outposts with the AWS SDK and CLI, you
  /// must specify the ARN of the bucket accessed in the format
  /// <code>arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/bucket/&lt;my-bucket-name&gt;</code>.
  /// For example, to access the bucket <code>reports</code> through outpost
  /// <code>my-outpost</code> owned by account <code>123456789012</code> in
  /// Region <code>us-west-2</code>, use the URL encoding of
  /// <code>arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/bucket/reports</code>.
  /// The value must be URL encoded.
  ///
  /// Parameter [policy] :
  /// The bucket policy as a JSON document.
  ///
  /// Parameter [confirmRemoveSelfBucketAccess] :
  /// Set this parameter to true to confirm that you want to remove your
  /// permissions to change this bucket policy in the future.
  /// <note>
  /// This is not supported by Amazon S3 on Outposts buckets.
  /// </note>
  Future<void> putBucketPolicy({
    @_s.required String accountId,
    @_s.required String bucket,
    @_s.required String policy,
    bool confirmRemoveSelfBucketAccess,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''^\d{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(bucket, 'bucket');
    _s.validateStringLength(
      'bucket',
      bucket,
      3,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(policy, 'policy');
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    confirmRemoveSelfBucketAccess?.let((v) =>
        headers['x-amz-confirm-remove-self-bucket-access'] = v.toString());
    await _protocol.send(
      method: 'PUT',
      requestUri: '/v20180820/bucket/${Uri.encodeComponent(bucket)}/policy',
      headers: headers,
      payload: PutBucketPolicyRequest(
              accountId: accountId,
              bucket: bucket,
              policy: policy,
              confirmRemoveSelfBucketAccess: confirmRemoveSelfBucketAccess)
          .toXml(
        'PutBucketPolicyRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'),
              'http://awss3control.amazonaws.com/doc/2018-08-20/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
  }

  /// <note>
  /// This action puts tags on an Amazon S3 on Outposts bucket. To put tags on
  /// an S3 bucket, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketTagging.html">PutBucketTagging</a>
  /// in the <i>Amazon Simple Storage Service API</i>.
  /// </note>
  /// Sets the tags for an Outposts bucket. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using
  /// Amazon S3 on Outposts</a> in the <i>Amazon Simple Storage Service
  /// Developer Guide</i>.
  ///
  /// Use tags to organize your AWS bill to reflect your own cost structure. To
  /// do this, sign up to get your AWS account bill with tag key values
  /// included. Then, to see the cost of combined resources, organize your
  /// billing information according to resources with the same tag key values.
  /// For example, you can tag several resources with a specific application
  /// name, and then organize your billing information to see the total cost of
  /// that application across several services. For more information, see <a
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html">Cost
  /// Allocation and Tagging</a>.
  /// <note>
  /// Within a bucket, if you add a tag that has the same key as an existing
  /// tag, the new value overwrites the old value. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/CostAllocTagging.html">Using
  /// Cost Allocation in Amazon S3 Bucket Tags</a>.
  /// </note>
  /// To use this operation, you must have permissions to perform the
  /// <code>s3-outposts:PutBucketTagging</code> action. The Outposts bucket
  /// owner has this permission by default and can grant this permission to
  /// others. For more information about permissions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">
  /// Permissions Related to Bucket Subresource Operations</a> and <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing
  /// Access Permissions to Your Amazon S3 Resources</a>.
  ///
  /// <code>PutBucketTagging</code> has the following special errors:
  ///
  /// <ul>
  /// <li>
  /// Error code: <code>InvalidTagError</code>
  ///
  /// <ul>
  /// <li>
  /// Description: The tag provided was not a valid tag. This error can occur if
  /// the tag did not pass input validation. For information about tag
  /// restrictions, see <a
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/allocation-tag-restrictions.html">
  /// User-Defined Tag Restrictions</a> and <a
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/aws-tag-restrictions.html">
  /// AWS-Generated Cost Allocation Tag Restrictions</a>.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Error code: <code>MalformedXMLError</code>
  ///
  /// <ul>
  /// <li>
  /// Description: The XML provided does not match the schema.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Error code: <code>OperationAbortedError </code>
  ///
  /// <ul>
  /// <li>
  /// Description: A conflicting conditional operation is currently in progress
  /// against this resource. Try again.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Error code: <code>InternalError</code>
  ///
  /// <ul>
  /// <li>
  /// Description: The service was unable to apply the provided tag to the
  /// bucket.
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// All Amazon S3 on Outposts REST API requests for this action require an
  /// additional parameter of <code>x-amz-outpost-id</code> to be passed with
  /// the request and an S3 on Outposts endpoint hostname prefix instead of
  /// <code>s3-control</code>. For an example of the request syntax for Amazon
  /// S3 on Outposts that uses the S3 on Outposts endpoint hostname prefix and
  /// the <code>x-amz-outpost-id</code> derived using the access point ARN, see
  /// the <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_PutBucketTagging.html#API_control_PutBucketTagging_Examples">Examples</a>
  /// section.
  ///
  /// The following actions are related to <code>PutBucketTagging</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_GetBucketTagging.html">GetBucketTagging</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DeleteBucketTagging.html">DeleteBucketTagging</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [accountId] :
  /// The AWS account ID of the Outposts bucket.
  ///
  /// Parameter [bucket] :
  /// The Amazon Resource Name (ARN) of the bucket.
  ///
  /// For using this parameter with Amazon S3 on Outposts with the REST API, you
  /// must specify the name and the x-amz-outpost-id as well.
  ///
  /// For using this parameter with S3 on Outposts with the AWS SDK and CLI, you
  /// must specify the ARN of the bucket accessed in the format
  /// <code>arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/bucket/&lt;my-bucket-name&gt;</code>.
  /// For example, to access the bucket <code>reports</code> through outpost
  /// <code>my-outpost</code> owned by account <code>123456789012</code> in
  /// Region <code>us-west-2</code>, use the URL encoding of
  /// <code>arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/bucket/reports</code>.
  /// The value must be URL encoded.
  ///
  /// Parameter [tagging] :
  /// <p/>
  Future<void> putBucketTagging({
    @_s.required String accountId,
    @_s.required String bucket,
    @_s.required Tagging tagging,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''^\d{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(bucket, 'bucket');
    _s.validateStringLength(
      'bucket',
      bucket,
      3,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagging, 'tagging');
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    await _protocol.send(
      method: 'PUT',
      requestUri: '/v20180820/bucket/${Uri.encodeComponent(bucket)}/tagging',
      headers: headers,
      payload: tagging.toXml('Tagging'),
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Sets the supplied tag-set on an S3 Batch Operations job.
  ///
  /// A tag is a key-value pair. You can associate S3 Batch Operations tags with
  /// any job by sending a PUT request against the tagging subresource that is
  /// associated with the job. To modify the existing tag set, you can either
  /// replace the existing tag set entirely, or make changes within the existing
  /// tag set by retrieving the existing tag set using <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_GetJobTagging.html">GetJobTagging</a>,
  /// modify that tag set, and use this action to replace the tag set with the
  /// one you modified. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/batch-ops-managing-jobs.html#batch-ops-job-tags">Controlling
  /// access and labeling jobs using tags</a> in the <i>Amazon Simple Storage
  /// Service Developer Guide</i>.
  /// <p/> <note>
  /// <ul>
  /// <li>
  /// If you send this request with an empty tag set, Amazon S3 deletes the
  /// existing tag set on the Batch Operations job. If you use this method, you
  /// are charged for a Tier 1 Request (PUT). For more information, see <a
  /// href="http://aws.amazon.com/s3/pricing/">Amazon S3 pricing</a>.
  /// </li>
  /// <li>
  /// For deleting existing tags for your Batch Operations job, a <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DeleteJobTagging.html">DeleteJobTagging</a>
  /// request is preferred because it achieves the same result without incurring
  /// charges.
  /// </li>
  /// <li>
  /// A few things to consider about using tags:
  ///
  /// <ul>
  /// <li>
  /// Amazon S3 limits the maximum number of tags to 50 tags per job.
  /// </li>
  /// <li>
  /// You can associate up to 50 tags with a job as long as they have unique tag
  /// keys.
  /// </li>
  /// <li>
  /// A tag key can be up to 128 Unicode characters in length, and tag values
  /// can be up to 256 Unicode characters in length.
  /// </li>
  /// <li>
  /// The key and values are case sensitive.
  /// </li>
  /// <li>
  /// For tagging-related restrictions related to characters and encodings, see
  /// <a
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/allocation-tag-restrictions.html">User-Defined
  /// Tag Restrictions</a> in the <i>AWS Billing and Cost Management User
  /// Guide</i>.
  /// </li>
  /// </ul> </li>
  /// </ul> </note> <p/>
  /// To use this operation, you must have permission to perform the
  /// <code>s3:PutJobTagging</code> action.
  ///
  /// Related actions include:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_CreateJob.html">CreatJob</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_GetJobTagging.html">GetJobTagging</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DeleteJobTagging.html">DeleteJobTagging</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InternalServiceException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotFoundException].
  /// May throw [TooManyTagsException].
  ///
  /// Parameter [accountId] :
  /// The AWS account ID associated with the S3 Batch Operations job.
  ///
  /// Parameter [jobId] :
  /// The ID for the S3 Batch Operations job whose tags you want to replace.
  ///
  /// Parameter [tags] :
  /// The set of tags to associate with the S3 Batch Operations job.
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
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''^\d{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      5,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'jobId',
      jobId,
      r'''[a-zA-Z0-9\-\_]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    await _protocol.send(
      method: 'PUT',
      requestUri: '/v20180820/jobs/${Uri.encodeComponent(jobId)}/tagging',
      headers: headers,
      payload:
          PutJobTaggingRequest(accountId: accountId, jobId: jobId, tags: tags)
              .toXml(
        'PutJobTaggingRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'),
              'http://awss3control.amazonaws.com/doc/2018-08-20/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates or modifies the <code>PublicAccessBlock</code> configuration for
  /// an AWS account. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html">
  /// Using Amazon S3 block public access</a>.
  ///
  /// Related actions include:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_GetPublicAccessBlock.html">GetPublicAccessBlock</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DeletePublicAccessBlock.html">DeletePublicAccessBlock</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [accountId] :
  /// The account ID for the AWS account whose <code>PublicAccessBlock</code>
  /// configuration you want to set.
  ///
  /// Parameter [publicAccessBlockConfiguration] :
  /// The <code>PublicAccessBlock</code> configuration that you want to apply to
  /// the specified AWS account.
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
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''^\d{12}$''',
      isRequired: true,
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

  /// Puts an Amazon S3 Storage Lens configuration. For more information about
  /// S3 Storage Lens, see <a
  /// href="https://docs.aws.amazon.com/https:/docs.aws.amazon.com/AmazonS3/latest/dev/storage_lens.html">Working
  /// with Amazon S3 Storage Lens</a> in the <i>Amazon Simple Storage Service
  /// Developer Guide</i>.
  /// <note>
  /// To use this action, you must have permission to perform the
  /// <code>s3:PutStorageLensConfiguration</code> action. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage_lens.html#storage_lens_IAM">Setting
  /// permissions to use Amazon S3 Storage Lens</a> in the <i>Amazon Simple
  /// Storage Service Developer Guide</i>.
  /// </note>
  ///
  /// Parameter [accountId] :
  /// The account ID of the requester.
  ///
  /// Parameter [configId] :
  /// The ID of the S3 Storage Lens configuration.
  ///
  /// Parameter [storageLensConfiguration] :
  /// The S3 Storage Lens configuration.
  ///
  /// Parameter [tags] :
  /// The tag set of the S3 Storage Lens configuration.
  /// <note>
  /// You can set up to a maximum of 50 tags.
  /// </note>
  Future<void> putStorageLensConfiguration({
    @_s.required String accountId,
    @_s.required String configId,
    @_s.required StorageLensConfiguration storageLensConfiguration,
    List<StorageLensTag> tags,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''^\d{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(configId, 'configId');
    _s.validateStringLength(
      'configId',
      configId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'configId',
      configId,
      r'''[a-zA-Z0-9\-\_\.]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        storageLensConfiguration, 'storageLensConfiguration');
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    await _protocol.send(
      method: 'PUT',
      requestUri: '/v20180820/storagelens/${Uri.encodeComponent(configId)}',
      headers: headers,
      payload: PutStorageLensConfigurationRequest(
              accountId: accountId,
              configId: configId,
              storageLensConfiguration: storageLensConfiguration,
              tags: tags)
          .toXml(
        'PutStorageLensConfigurationRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'),
              'http://awss3control.amazonaws.com/doc/2018-08-20/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Put or replace tags on an existing Amazon S3 Storage Lens configuration.
  /// For more information about S3 Storage Lens, see <a
  /// href="https://docs.aws.amazon.com/https:/docs.aws.amazon.com/AmazonS3/latest/dev/storage_lens.html">Working
  /// with Amazon S3 Storage Lens</a> in the <i>Amazon Simple Storage Service
  /// Developer Guide</i>.
  /// <note>
  /// To use this action, you must have permission to perform the
  /// <code>s3:PutStorageLensConfigurationTagging</code> action. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage_lens.html#storage_lens_IAM">Setting
  /// permissions to use Amazon S3 Storage Lens</a> in the <i>Amazon Simple
  /// Storage Service Developer Guide</i>.
  /// </note>
  ///
  /// Parameter [accountId] :
  /// The account ID of the requester.
  ///
  /// Parameter [configId] :
  /// The ID of the S3 Storage Lens configuration.
  ///
  /// Parameter [tags] :
  /// The tag set of the S3 Storage Lens configuration.
  /// <note>
  /// You can set up to a maximum of 50 tags.
  /// </note>
  Future<void> putStorageLensConfigurationTagging({
    @_s.required String accountId,
    @_s.required String configId,
    @_s.required List<StorageLensTag> tags,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''^\d{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(configId, 'configId');
    _s.validateStringLength(
      'configId',
      configId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'configId',
      configId,
      r'''[a-zA-Z0-9\-\_\.]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    await _protocol.send(
      method: 'PUT',
      requestUri:
          '/v20180820/storagelens/${Uri.encodeComponent(configId)}/tagging',
      headers: headers,
      payload: PutStorageLensConfigurationTaggingRequest(
              accountId: accountId, configId: configId, tags: tags)
          .toXml(
        'PutStorageLensConfigurationTaggingRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'),
              'http://awss3control.amazonaws.com/doc/2018-08-20/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates an existing S3 Batch Operations job's priority. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/batch-ops-basics.html">S3
  /// Batch Operations</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  /// <p/>
  /// Related actions include:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_CreateJob.html">CreateJob</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_ListJobs.html">ListJobs</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DescribeJob.html">DescribeJob</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_UpdateJobStatus.html">UpdateJobStatus</a>
  /// </li>
  /// </ul>
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
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''^\d{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      5,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'jobId',
      jobId,
      r'''[a-zA-Z0-9\-\_]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(priority, 'priority');
    _s.validateNumRange(
      'priority',
      priority,
      0,
      2147483647,
      isRequired: true,
    );
    final headers = <String, String>{};
    accountId?.let((v) => headers['x-amz-account-id'] = v.toString());
    final $query = <String, List<String>>{
      if (priority != null) 'priority': [priority.toString()],
    };
    final $result = await _protocol.send(
      method: 'POST',
      requestUri: '/v20180820/jobs/${Uri.encodeComponent(jobId)}/priority',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return UpdateJobPriorityResult.fromXml($result.body);
  }

  /// Updates the status for the specified job. Use this operation to confirm
  /// that you want to run a job or to cancel an existing job. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/batch-ops-basics.html">S3
  /// Batch Operations</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  /// <p/>
  /// Related actions include:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_CreateJob.html">CreateJob</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_ListJobs.html">ListJobs</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DescribeJob.html">DescribeJob</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_UpdateJobStatus.html">UpdateJobStatus</a>
  /// </li>
  /// </ul>
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
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''^\d{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      5,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'jobId',
      jobId,
      r'''[a-zA-Z0-9\-\_]+''',
      isRequired: true,
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
    final $query = <String, List<String>>{
      if (requestedJobStatus != null)
        'requestedJobStatus': [requestedJobStatus.toValue()],
      if (statusUpdateReason != null)
        'statusUpdateReason': [statusUpdateReason],
    };
    final $result = await _protocol.send(
      method: 'POST',
      requestUri: '/v20180820/jobs/${Uri.encodeComponent(jobId)}/status',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return UpdateJobStatusResult.fromXml($result.body);
  }
}

/// The container for abort incomplete multipart upload
class AbortIncompleteMultipartUpload {
  /// Specifies the number of days after which Amazon S3 aborts an incomplete
  /// multipart upload to the Outposts bucket.
  final int daysAfterInitiation;

  AbortIncompleteMultipartUpload({
    this.daysAfterInitiation,
  });
  factory AbortIncompleteMultipartUpload.fromXml(_s.XmlElement elem) {
    return AbortIncompleteMultipartUpload(
      daysAfterInitiation: _s.extractXmlIntValue(elem, 'DaysAfterInitiation'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (daysAfterInitiation != null)
        _s.encodeXmlIntValue('DaysAfterInitiation', daysAfterInitiation),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// An access point used to access a bucket.
class AccessPoint {
  /// The name of the bucket associated with this access point.
  final String bucket;

  /// The name of this access point.
  final String name;

  /// Indicates whether this access point allows access from the public internet.
  /// If <code>VpcConfiguration</code> is specified for this access point, then
  /// <code>NetworkOrigin</code> is <code>VPC</code>, and the access point doesn't
  /// allow access from the public internet. Otherwise, <code>NetworkOrigin</code>
  /// is <code>Internet</code>, and the access point allows access from the public
  /// internet, subject to the access point and bucket access policies.
  final NetworkOrigin networkOrigin;

  /// The ARN for the access point.
  final String accessPointArn;

  /// The virtual private cloud (VPC) configuration for this access point, if one
  /// exists.
  final VpcConfiguration vpcConfiguration;

  AccessPoint({
    @_s.required this.bucket,
    @_s.required this.name,
    @_s.required this.networkOrigin,
    this.accessPointArn,
    this.vpcConfiguration,
  });
  factory AccessPoint.fromXml(_s.XmlElement elem) {
    return AccessPoint(
      bucket: _s.extractXmlStringValue(elem, 'Bucket'),
      name: _s.extractXmlStringValue(elem, 'Name'),
      networkOrigin:
          _s.extractXmlStringValue(elem, 'NetworkOrigin')?.toNetworkOrigin(),
      accessPointArn: _s.extractXmlStringValue(elem, 'AccessPointArn'),
      vpcConfiguration: _s
          .extractXmlChild(elem, 'VpcConfiguration')
          ?.let((e) => VpcConfiguration.fromXml(e)),
    );
  }
}

/// A container for the account level Amazon S3 Storage Lens configuration.
class AccountLevel {
  /// A container for the S3 Storage Lens bucket-level configuration.
  final BucketLevel bucketLevel;

  /// A container for the S3 Storage Lens activity metrics.
  final ActivityMetrics activityMetrics;

  AccountLevel({
    @_s.required this.bucketLevel,
    this.activityMetrics,
  });
  factory AccountLevel.fromXml(_s.XmlElement elem) {
    return AccountLevel(
      bucketLevel: _s
          .extractXmlChild(elem, 'BucketLevel')
          ?.let((e) => BucketLevel.fromXml(e)),
      activityMetrics: _s
          .extractXmlChild(elem, 'ActivityMetrics')
          ?.let((e) => ActivityMetrics.fromXml(e)),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (activityMetrics != null) activityMetrics?.toXml('ActivityMetrics'),
      bucketLevel?.toXml('BucketLevel'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// A container for the activity metrics.
class ActivityMetrics {
  /// A container for whether the activity metrics are enabled.
  final bool isEnabled;

  ActivityMetrics({
    this.isEnabled,
  });
  factory ActivityMetrics.fromXml(_s.XmlElement elem) {
    return ActivityMetrics(
      isEnabled: _s.extractXmlBoolValue(elem, 'IsEnabled'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (isEnabled != null) _s.encodeXmlBoolValue('IsEnabled', isEnabled),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

enum BucketCannedACL {
  private,
  publicRead,
  publicReadWrite,
  authenticatedRead,
}

extension on BucketCannedACL {
  String toValue() {
    switch (this) {
      case BucketCannedACL.private:
        return 'private';
      case BucketCannedACL.publicRead:
        return 'public-read';
      case BucketCannedACL.publicReadWrite:
        return 'public-read-write';
      case BucketCannedACL.authenticatedRead:
        return 'authenticated-read';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  BucketCannedACL toBucketCannedACL() {
    switch (this) {
      case 'private':
        return BucketCannedACL.private;
      case 'public-read':
        return BucketCannedACL.publicRead;
      case 'public-read-write':
        return BucketCannedACL.publicReadWrite;
      case 'authenticated-read':
        return BucketCannedACL.authenticatedRead;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// A container for the bucket-level configuration.
class BucketLevel {
  /// A container for the bucket-level activity metrics for Amazon S3 Storage Lens
  final ActivityMetrics activityMetrics;

  /// A container for the bucket-level prefix-level metrics for S3 Storage Lens
  final PrefixLevel prefixLevel;

  BucketLevel({
    this.activityMetrics,
    this.prefixLevel,
  });
  factory BucketLevel.fromXml(_s.XmlElement elem) {
    return BucketLevel(
      activityMetrics: _s
          .extractXmlChild(elem, 'ActivityMetrics')
          ?.let((e) => ActivityMetrics.fromXml(e)),
      prefixLevel: _s
          .extractXmlChild(elem, 'PrefixLevel')
          ?.let((e) => PrefixLevel.fromXml(e)),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (activityMetrics != null) activityMetrics?.toXml('ActivityMetrics'),
      if (prefixLevel != null) prefixLevel?.toXml('PrefixLevel'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

enum BucketLocationConstraint {
  eu,
  euWest_1,
  usWest_1,
  usWest_2,
  apSouth_1,
  apSoutheast_1,
  apSoutheast_2,
  apNortheast_1,
  saEast_1,
  cnNorth_1,
  euCentral_1,
}

extension on BucketLocationConstraint {
  String toValue() {
    switch (this) {
      case BucketLocationConstraint.eu:
        return 'EU';
      case BucketLocationConstraint.euWest_1:
        return 'eu-west-1';
      case BucketLocationConstraint.usWest_1:
        return 'us-west-1';
      case BucketLocationConstraint.usWest_2:
        return 'us-west-2';
      case BucketLocationConstraint.apSouth_1:
        return 'ap-south-1';
      case BucketLocationConstraint.apSoutheast_1:
        return 'ap-southeast-1';
      case BucketLocationConstraint.apSoutheast_2:
        return 'ap-southeast-2';
      case BucketLocationConstraint.apNortheast_1:
        return 'ap-northeast-1';
      case BucketLocationConstraint.saEast_1:
        return 'sa-east-1';
      case BucketLocationConstraint.cnNorth_1:
        return 'cn-north-1';
      case BucketLocationConstraint.euCentral_1:
        return 'eu-central-1';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  BucketLocationConstraint toBucketLocationConstraint() {
    switch (this) {
      case 'EU':
        return BucketLocationConstraint.eu;
      case 'eu-west-1':
        return BucketLocationConstraint.euWest_1;
      case 'us-west-1':
        return BucketLocationConstraint.usWest_1;
      case 'us-west-2':
        return BucketLocationConstraint.usWest_2;
      case 'ap-south-1':
        return BucketLocationConstraint.apSouth_1;
      case 'ap-southeast-1':
        return BucketLocationConstraint.apSoutheast_1;
      case 'ap-southeast-2':
        return BucketLocationConstraint.apSoutheast_2;
      case 'ap-northeast-1':
        return BucketLocationConstraint.apNortheast_1;
      case 'sa-east-1':
        return BucketLocationConstraint.saEast_1;
      case 'cn-north-1':
        return BucketLocationConstraint.cnNorth_1;
      case 'eu-central-1':
        return BucketLocationConstraint.euCentral_1;
    }
    throw Exception('Unknown enum value: $this');
  }
}

class CreateAccessPointRequest {
  /// The AWS account ID for the owner of the bucket for which you want to create
  /// an access point.
  final String accountId;

  /// The name of the bucket that you want to associate this access point with.
  ///
  /// For using this parameter with Amazon S3 on Outposts with the REST API, you
  /// must specify the name and the x-amz-outpost-id as well.
  ///
  /// For using this parameter with S3 on Outposts with the AWS SDK and CLI, you
  /// must specify the ARN of the bucket accessed in the format
  /// <code>arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/bucket/&lt;my-bucket-name&gt;</code>.
  /// For example, to access the bucket <code>reports</code> through outpost
  /// <code>my-outpost</code> owned by account <code>123456789012</code> in Region
  /// <code>us-west-2</code>, use the URL encoding of
  /// <code>arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/bucket/reports</code>.
  /// The value must be URL encoded.
  final String bucket;

  /// The name you want to assign to this access point.
  final String name;
  final PublicAccessBlockConfiguration publicAccessBlockConfiguration;

  /// If you include this field, Amazon S3 restricts access to this access point
  /// to requests from the specified virtual private cloud (VPC).
  /// <note>
  /// This is required for creating an access point for Amazon S3 on Outposts
  /// buckets.
  /// </note>
  final VpcConfiguration vpcConfiguration;

  CreateAccessPointRequest({
    @_s.required this.accountId,
    @_s.required this.bucket,
    @_s.required this.name,
    this.publicAccessBlockConfiguration,
    this.vpcConfiguration,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Bucket', bucket),
      if (vpcConfiguration != null) vpcConfiguration?.toXml('VpcConfiguration'),
      if (publicAccessBlockConfiguration != null)
        publicAccessBlockConfiguration?.toXml('PublicAccessBlockConfiguration'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

class CreateAccessPointResult {
  /// The ARN of the access point.
  /// <note>
  /// This is only supported by Amazon S3 on Outposts.
  /// </note>
  final String accessPointArn;

  CreateAccessPointResult({
    this.accessPointArn,
  });
  factory CreateAccessPointResult.fromXml(_s.XmlElement elem) {
    return CreateAccessPointResult(
      accessPointArn: _s.extractXmlStringValue(elem, 'AccessPointArn'),
    );
  }
}

/// The container for the bucket configuration.
/// <note>
/// This is not supported by Amazon S3 on Outposts buckets.
/// </note>
class CreateBucketConfiguration {
  /// Specifies the Region where the bucket will be created. If you are creating a
  /// bucket on the US East (N. Virginia) Region (us-east-1), you do not need to
  /// specify the location.
  /// <note>
  /// This is not supported by Amazon S3 on Outposts buckets.
  /// </note>
  final BucketLocationConstraint locationConstraint;

  CreateBucketConfiguration({
    this.locationConstraint,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (locationConstraint != null)
        _s.encodeXmlStringValue(
            'LocationConstraint', locationConstraint.toValue()),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

class CreateBucketResult {
  /// The Amazon Resource Name (ARN) of the bucket.
  ///
  /// For using this parameter with Amazon S3 on Outposts with the REST API, you
  /// must specify the name and the x-amz-outpost-id as well.
  ///
  /// For using this parameter with S3 on Outposts with the AWS SDK and CLI, you
  /// must specify the ARN of the bucket accessed in the format
  /// <code>arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/bucket/&lt;my-bucket-name&gt;</code>.
  /// For example, to access the bucket <code>reports</code> through outpost
  /// <code>my-outpost</code> owned by account <code>123456789012</code> in Region
  /// <code>us-west-2</code>, use the URL encoding of
  /// <code>arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/bucket/reports</code>.
  /// The value must be URL encoded.
  final String bucketArn;

  /// The location of the bucket.
  final String location;

  CreateBucketResult({
    this.bucketArn,
    this.location,
  });
}

class CreateJobRequest {
  /// The AWS account ID that creates the job.
  final String accountId;

  /// An idempotency token to ensure that you don't accidentally submit the same
  /// request twice. You can use any string up to the maximum length.
  final String clientRequestToken;

  /// Configuration parameters for the manifest.
  final JobManifest manifest;

  /// The operation that you want this job to perform on each object listed in the
  /// manifest. For more information about the available operations, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/batch-ops-operations.html">Operations</a>
  /// in the <i>Amazon Simple Storage Service Developer Guide</i>.
  final JobOperation operation;

  /// The numerical priority for this job. Higher numbers indicate higher
  /// priority.
  final int priority;

  /// Configuration parameters for the optional job-completion report.
  final JobReport report;

  /// The Amazon Resource Name (ARN) for the AWS Identity and Access Management
  /// (IAM) role that Batch Operations will use to run this job's operation on
  /// each object in the manifest.
  final String roleArn;

  /// Indicates whether confirmation is required before Amazon S3 runs the job.
  /// Confirmation is only required for jobs created through the Amazon S3
  /// console.
  final bool confirmationRequired;

  /// A description for this job. You can use any string within the permitted
  /// length. Descriptions don't need to be unique and can be used for multiple
  /// jobs.
  final String description;

  /// A set of tags to associate with the S3 Batch Operations job. This is an
  /// optional parameter.
  final List<S3Tag> tags;

  CreateJobRequest({
    @_s.required this.accountId,
    @_s.required this.clientRequestToken,
    @_s.required this.manifest,
    @_s.required this.operation,
    @_s.required this.priority,
    @_s.required this.report,
    @_s.required this.roleArn,
    this.confirmationRequired,
    this.description,
    this.tags,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (confirmationRequired != null)
        _s.encodeXmlBoolValue('ConfirmationRequired', confirmationRequired),
      operation?.toXml('Operation'),
      report?.toXml('Report'),
      _s.encodeXmlStringValue('ClientRequestToken', clientRequestToken),
      manifest?.toXml('Manifest'),
      if (description != null)
        _s.encodeXmlStringValue('Description', description),
      _s.encodeXmlIntValue('Priority', priority),
      _s.encodeXmlStringValue('RoleArn', roleArn),
      if (tags != null)
        _s.XmlElement(
            _s.XmlName('Tags'), [], tags.map((e) => e?.toXml('member'))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
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

class DeleteStorageLensConfigurationTaggingResult {
  DeleteStorageLensConfigurationTaggingResult();
  factory DeleteStorageLensConfigurationTaggingResult.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeleteStorageLensConfigurationTaggingResult();
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

/// A container for what Amazon S3 Storage Lens will exclude.
class Exclude {
  /// A container for the S3 Storage Lens bucket excludes.
  final List<String> buckets;

  /// A container for the S3 Storage Lens Region excludes.
  final List<String> regions;

  Exclude({
    this.buckets,
    this.regions,
  });
  factory Exclude.fromXml(_s.XmlElement elem) {
    return Exclude(
      buckets: _s
          .extractXmlChild(elem, 'Buckets')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'Arn')),
      regions: _s
          .extractXmlChild(elem, 'Regions')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'Region')),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (buckets != null)
        _s.XmlElement(_s.XmlName('Buckets'), [],
            buckets.map((e) => _s.encodeXmlStringValue('Arn', e))),
      if (regions != null)
        _s.XmlElement(_s.XmlName('Regions'), [],
            regions.map((e) => _s.encodeXmlStringValue('Region', e))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

enum ExpirationStatus {
  enabled,
  disabled,
}

extension on ExpirationStatus {
  String toValue() {
    switch (this) {
      case ExpirationStatus.enabled:
        return 'Enabled';
      case ExpirationStatus.disabled:
        return 'Disabled';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  ExpirationStatus toExpirationStatus() {
    switch (this) {
      case 'Enabled':
        return ExpirationStatus.enabled;
      case 'Disabled':
        return ExpirationStatus.disabled;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum Format {
  csv,
  parquet,
}

extension on Format {
  String toValue() {
    switch (this) {
      case Format.csv:
        return 'CSV';
      case Format.parquet:
        return 'Parquet';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  Format toFormat() {
    switch (this) {
      case 'CSV':
        return Format.csv;
      case 'Parquet':
        return Format.parquet;
    }
    throw Exception('Unknown enum value: $this');
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

  /// Indicates whether this access point allows access from the public internet.
  /// If <code>VpcConfiguration</code> is specified for this access point, then
  /// <code>NetworkOrigin</code> is <code>VPC</code>, and the access point doesn't
  /// allow access from the public internet. Otherwise, <code>NetworkOrigin</code>
  /// is <code>Internet</code>, and the access point allows access from the public
  /// internet, subject to the access point and bucket access policies.
  ///
  /// This will always be true for an Amazon S3 on Outposts access point
  final NetworkOrigin networkOrigin;
  final PublicAccessBlockConfiguration publicAccessBlockConfiguration;

  /// Contains the virtual private cloud (VPC) configuration for the specified
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

class GetBucketLifecycleConfigurationResult {
  /// Container for the lifecycle rule of the Outposts bucket.
  final List<LifecycleRule> rules;

  GetBucketLifecycleConfigurationResult({
    this.rules,
  });
  factory GetBucketLifecycleConfigurationResult.fromXml(_s.XmlElement elem) {
    return GetBucketLifecycleConfigurationResult(
      rules: _s.extractXmlChild(elem, 'Rules')?.let((elem) => elem
          .findElements('Rule')
          .map((c) => LifecycleRule.fromXml(c))
          .toList()),
    );
  }
}

class GetBucketPolicyResult {
  /// The policy of the Outposts bucket.
  final String policy;

  GetBucketPolicyResult({
    this.policy,
  });
  factory GetBucketPolicyResult.fromXml(_s.XmlElement elem) {
    return GetBucketPolicyResult(
      policy: _s.extractXmlStringValue(elem, 'Policy'),
    );
  }
}

class GetBucketResult {
  /// The Outposts bucket requested.
  final String bucket;

  /// The creation date of the Outposts bucket.
  final DateTime creationDate;

  /// <p/>
  final bool publicAccessBlockEnabled;

  GetBucketResult({
    this.bucket,
    this.creationDate,
    this.publicAccessBlockEnabled,
  });
  factory GetBucketResult.fromXml(_s.XmlElement elem) {
    return GetBucketResult(
      bucket: _s.extractXmlStringValue(elem, 'Bucket'),
      creationDate: _s.extractXmlDateTimeValue(elem, 'CreationDate'),
      publicAccessBlockEnabled:
          _s.extractXmlBoolValue(elem, 'PublicAccessBlockEnabled'),
    );
  }
}

class GetBucketTaggingResult {
  /// The tags set of the Outposts bucket.
  final List<S3Tag> tagSet;

  GetBucketTaggingResult({
    @_s.required this.tagSet,
  });
  factory GetBucketTaggingResult.fromXml(_s.XmlElement elem) {
    return GetBucketTaggingResult(
      tagSet: _s.extractXmlChild(elem, 'TagSet')?.let((elem) =>
          elem.findElements('member').map((c) => S3Tag.fromXml(c)).toList()),
    );
  }
}

class GetJobTaggingResult {
  /// The set of tags associated with the S3 Batch Operations job.
  final List<S3Tag> tags;

  GetJobTaggingResult({
    this.tags,
  });
  factory GetJobTaggingResult.fromXml(_s.XmlElement elem) {
    return GetJobTaggingResult(
      tags: _s.extractXmlChild(elem, 'Tags')?.let((elem) =>
          elem.findElements('member').map((c) => S3Tag.fromXml(c)).toList()),
    );
  }
}

class GetPublicAccessBlockOutput {
  /// The <code>PublicAccessBlock</code> configuration currently in effect for
  /// this AWS account.
  final PublicAccessBlockConfiguration publicAccessBlockConfiguration;

  GetPublicAccessBlockOutput({
    this.publicAccessBlockConfiguration,
  });
  factory GetPublicAccessBlockOutput.fromXml(_s.XmlElement elem) {
    return GetPublicAccessBlockOutput(
      publicAccessBlockConfiguration:
          elem?.let((e) => PublicAccessBlockConfiguration.fromXml(e)),
    );
  }
}

class GetStorageLensConfigurationResult {
  /// The S3 Storage Lens configuration requested.
  final StorageLensConfiguration storageLensConfiguration;

  GetStorageLensConfigurationResult({
    this.storageLensConfiguration,
  });
  factory GetStorageLensConfigurationResult.fromXml(_s.XmlElement elem) {
    return GetStorageLensConfigurationResult(
      storageLensConfiguration:
          elem?.let((e) => StorageLensConfiguration.fromXml(e)),
    );
  }
}

class GetStorageLensConfigurationTaggingResult {
  /// The tags of S3 Storage Lens configuration requested.
  final List<StorageLensTag> tags;

  GetStorageLensConfigurationTaggingResult({
    this.tags,
  });
  factory GetStorageLensConfigurationTaggingResult.fromXml(_s.XmlElement elem) {
    return GetStorageLensConfigurationTaggingResult(
      tags: _s.extractXmlChild(elem, 'Tags')?.let((elem) => elem
          .findElements('Tag')
          .map((c) => StorageLensTag.fromXml(c))
          .toList()),
    );
  }
}

/// A container for what Amazon S3 Storage Lens configuration includes.
class Include {
  /// A container for the S3 Storage Lens bucket includes.
  final List<String> buckets;

  /// A container for the S3 Storage Lens Region includes.
  final List<String> regions;

  Include({
    this.buckets,
    this.regions,
  });
  factory Include.fromXml(_s.XmlElement elem) {
    return Include(
      buckets: _s
          .extractXmlChild(elem, 'Buckets')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'Arn')),
      regions: _s
          .extractXmlChild(elem, 'Regions')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'Region')),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (buckets != null)
        _s.XmlElement(_s.XmlName('Buckets'), [],
            buckets.map((e) => _s.encodeXmlStringValue('Arn', e))),
      if (regions != null)
        _s.XmlElement(_s.XmlName('Regions'), [],
            regions.map((e) => _s.encodeXmlStringValue('Region', e))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
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

  /// The operation that the specified job is configured to run on the objects
  /// listed in the manifest.
  final JobOperation operation;

  /// The priority of the specified job.
  final int priority;

  /// Describes the total number of tasks that the specified job has run, the
  /// number of tasks that succeeded, and the number of tasks that failed.
  final JobProgressSummary progressSummary;

  /// Contains the configuration information for the job-completion report if you
  /// requested one in the <code>Create Job</code> request.
  final JobReport report;

  /// The Amazon Resource Name (ARN) for the AWS Identity and Access Management
  /// (IAM) role assigned to run the tasks for this job.
  final String roleArn;

  /// The current status of the specified job.
  final JobStatus status;

  /// The reason for updating the job.
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
              .findElements('member')
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

  /// Describes the total number of tasks that the specified job has run, the
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

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      spec?.toXml('Spec'),
      location?.toXml('Location'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
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

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('ObjectArn', objectArn),
      if (objectVersionId != null)
        _s.encodeXmlStringValue('ObjectVersionId', objectVersionId),
      _s.encodeXmlStringValue('ETag', eTag),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
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
  final List<JobManifestFieldName> fields;

  JobManifestSpec({
    @_s.required this.format,
    this.fields,
  });
  factory JobManifestSpec.fromXml(_s.XmlElement elem) {
    return JobManifestSpec(
      format: _s.extractXmlStringValue(elem, 'Format')?.toJobManifestFormat(),
      fields: _s.extractXmlChild(elem, 'Fields')?.let((elem) => _s
          .extractXmlStringListValues(elem, 'member')
          .map((s) => s.toJobManifestFieldName())
          .toList()),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Format', format?.toValue() ?? ''),
      if (fields != null)
        _s.XmlElement(
            _s.XmlName('Fields'),
            [],
            fields.map(
                (e) => _s.encodeXmlStringValue('member', e?.toValue() ?? ''))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// The operation that you want this job to perform on each object listed in the
/// manifest. For more information about the available operations, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/batch-ops-operations.html">Operations</a>
/// in the <i>Amazon Simple Storage Service Developer Guide</i>.
class JobOperation {
  /// Directs the specified job to invoke an AWS Lambda function on each object in
  /// the manifest.
  final LambdaInvokeOperation lambdaInvoke;

  /// Directs the specified job to run an Initiate Glacier Restore call on each
  /// object in the manifest.
  final S3InitiateRestoreObjectOperation s3InitiateRestoreObject;

  /// Directs the specified job to run a PUT Object acl call on each object in the
  /// manifest.
  final S3SetObjectAclOperation s3PutObjectAcl;

  /// Directs the specified job to run a PUT Copy object call on each object in
  /// the manifest.
  final S3CopyObjectOperation s3PutObjectCopy;
  final S3SetObjectLegalHoldOperation s3PutObjectLegalHold;
  final S3SetObjectRetentionOperation s3PutObjectRetention;

  /// Directs the specified job to run a PUT Object tagging call on each object in
  /// the manifest.
  final S3SetObjectTaggingOperation s3PutObjectTagging;

  JobOperation({
    this.lambdaInvoke,
    this.s3InitiateRestoreObject,
    this.s3PutObjectAcl,
    this.s3PutObjectCopy,
    this.s3PutObjectLegalHold,
    this.s3PutObjectRetention,
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
      s3PutObjectLegalHold: _s
          .extractXmlChild(elem, 'S3PutObjectLegalHold')
          ?.let((e) => S3SetObjectLegalHoldOperation.fromXml(e)),
      s3PutObjectRetention: _s
          .extractXmlChild(elem, 'S3PutObjectRetention')
          ?.let((e) => S3SetObjectRetentionOperation.fromXml(e)),
      s3PutObjectTagging: _s
          .extractXmlChild(elem, 'S3PutObjectTagging')
          ?.let((e) => S3SetObjectTaggingOperation.fromXml(e)),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (lambdaInvoke != null) lambdaInvoke?.toXml('LambdaInvoke'),
      if (s3PutObjectCopy != null) s3PutObjectCopy?.toXml('S3PutObjectCopy'),
      if (s3PutObjectAcl != null) s3PutObjectAcl?.toXml('S3PutObjectAcl'),
      if (s3PutObjectTagging != null)
        s3PutObjectTagging?.toXml('S3PutObjectTagging'),
      if (s3InitiateRestoreObject != null)
        s3InitiateRestoreObject?.toXml('S3InitiateRestoreObject'),
      if (s3PutObjectLegalHold != null)
        s3PutObjectLegalHold?.toXml('S3PutObjectLegalHold'),
      if (s3PutObjectRetention != null)
        s3PutObjectRetention?.toXml('S3PutObjectRetention'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// Describes the total number of tasks that the specified job has started, the
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
  /// job-completion report will be stored. Amazon S3 stores the job-completion
  /// report at <code>&lt;prefix&gt;/job-&lt;job-id&gt;/report.json</code>.
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

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (bucket != null) _s.encodeXmlStringValue('Bucket', bucket),
      if (format != null) _s.encodeXmlStringValue('Format', format.toValue()),
      _s.encodeXmlBoolValue('Enabled', enabled),
      if (prefix != null) _s.encodeXmlStringValue('Prefix', prefix),
      if (reportScope != null)
        _s.encodeXmlStringValue('ReportScope', reportScope.toValue()),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
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

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (functionArn != null)
        _s.encodeXmlStringValue('FunctionArn', functionArn),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// The container for the Outposts bucket lifecycle configuration.
class LifecycleConfiguration {
  /// A lifecycle rule for individual objects in an Outposts bucket.
  final List<LifecycleRule> rules;

  LifecycleConfiguration({
    this.rules,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (rules != null)
        _s.XmlElement(
            _s.XmlName('Rules'), [], rules.map((e) => e?.toXml('Rule'))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// The container of the Outposts bucket lifecycle expiration.
class LifecycleExpiration {
  /// Indicates at what date the object is to be deleted. Should be in GMT ISO
  /// 8601 format.
  final DateTime date;

  /// Indicates the lifetime, in days, of the objects that are subject to the
  /// rule. The value must be a non-zero positive integer.
  final int days;

  /// Indicates whether Amazon S3 will remove a delete marker with no noncurrent
  /// versions. If set to true, the delete marker will be expired. If set to
  /// false, the policy takes no action. This cannot be specified with Days or
  /// Date in a Lifecycle Expiration Policy.
  final bool expiredObjectDeleteMarker;

  LifecycleExpiration({
    this.date,
    this.days,
    this.expiredObjectDeleteMarker,
  });
  factory LifecycleExpiration.fromXml(_s.XmlElement elem) {
    return LifecycleExpiration(
      date: _s.extractXmlDateTimeValue(elem, 'Date'),
      days: _s.extractXmlIntValue(elem, 'Days'),
      expiredObjectDeleteMarker:
          _s.extractXmlBoolValue(elem, 'ExpiredObjectDeleteMarker'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (date != null) _s.encodeXmlDateTimeValue('Date', date),
      if (days != null) _s.encodeXmlIntValue('Days', days),
      if (expiredObjectDeleteMarker != null)
        _s.encodeXmlBoolValue(
            'ExpiredObjectDeleteMarker', expiredObjectDeleteMarker),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// The container for the Outposts bucket lifecycle rule.
class LifecycleRule {
  /// If 'Enabled', the rule is currently being applied. If 'Disabled', the rule
  /// is not currently being applied.
  final ExpirationStatus status;

  /// Specifies the days since the initiation of an incomplete multipart upload
  /// that Amazon S3 waits before permanently removing all parts of the upload.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuoverview.html#mpu-abort-incomplete-mpu-lifecycle-config">
  /// Aborting Incomplete Multipart Uploads Using a Bucket Lifecycle Policy</a> in
  /// the <i>Amazon Simple Storage Service Developer Guide</i>.
  final AbortIncompleteMultipartUpload abortIncompleteMultipartUpload;

  /// Specifies the expiration for the lifecycle of the object in the form of
  /// date, days and, whether the object has a delete marker.
  final LifecycleExpiration expiration;

  /// The container for the filter of lifecycle rule.
  final LifecycleRuleFilter filter;

  /// Unique identifier for the rule. The value cannot be longer than 255
  /// characters.
  final String id;

  /// The noncurrent version expiration of the lifecycle rule.
  /// <note>
  /// This is not supported by Amazon S3 on Outposts buckets.
  /// </note>
  final NoncurrentVersionExpiration noncurrentVersionExpiration;

  /// Specifies the transition rule for the lifecycle rule that describes when
  /// noncurrent objects transition to a specific storage class. If your bucket is
  /// versioning-enabled (or versioning is suspended), you can set this action to
  /// request that Amazon S3 transition noncurrent object versions to a specific
  /// storage class at a set period in the object's lifetime.
  /// <note>
  /// This is not supported by Amazon S3 on Outposts buckets.
  /// </note>
  final List<NoncurrentVersionTransition> noncurrentVersionTransitions;

  /// Specifies when an Amazon S3 object transitions to a specified storage class.
  /// <note>
  /// This is not supported by Amazon S3 on Outposts buckets.
  /// </note>
  final List<Transition> transitions;

  LifecycleRule({
    @_s.required this.status,
    this.abortIncompleteMultipartUpload,
    this.expiration,
    this.filter,
    this.id,
    this.noncurrentVersionExpiration,
    this.noncurrentVersionTransitions,
    this.transitions,
  });
  factory LifecycleRule.fromXml(_s.XmlElement elem) {
    return LifecycleRule(
      status: _s.extractXmlStringValue(elem, 'Status')?.toExpirationStatus(),
      abortIncompleteMultipartUpload: _s
          .extractXmlChild(elem, 'AbortIncompleteMultipartUpload')
          ?.let((e) => AbortIncompleteMultipartUpload.fromXml(e)),
      expiration: _s
          .extractXmlChild(elem, 'Expiration')
          ?.let((e) => LifecycleExpiration.fromXml(e)),
      filter: _s
          .extractXmlChild(elem, 'Filter')
          ?.let((e) => LifecycleRuleFilter.fromXml(e)),
      id: _s.extractXmlStringValue(elem, 'ID'),
      noncurrentVersionExpiration: _s
          .extractXmlChild(elem, 'NoncurrentVersionExpiration')
          ?.let((e) => NoncurrentVersionExpiration.fromXml(e)),
      noncurrentVersionTransitions: _s
          .extractXmlChild(elem, 'NoncurrentVersionTransitions')
          ?.let((elem) => elem
              .findElements('NoncurrentVersionTransition')
              .map((c) => NoncurrentVersionTransition.fromXml(c))
              .toList()),
      transitions: _s.extractXmlChild(elem, 'Transitions')?.let((elem) => elem
          .findElements('Transition')
          .map((c) => Transition.fromXml(c))
          .toList()),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (expiration != null) expiration?.toXml('Expiration'),
      if (id != null) _s.encodeXmlStringValue('ID', id),
      if (filter != null) filter?.toXml('Filter'),
      _s.encodeXmlStringValue('Status', status?.toValue() ?? ''),
      if (transitions != null)
        _s.XmlElement(_s.XmlName('Transitions'), [],
            transitions.map((e) => e?.toXml('Transition'))),
      if (noncurrentVersionTransitions != null)
        _s.XmlElement(
            _s.XmlName('NoncurrentVersionTransitions'),
            [],
            noncurrentVersionTransitions
                .map((e) => e?.toXml('NoncurrentVersionTransition'))),
      if (noncurrentVersionExpiration != null)
        noncurrentVersionExpiration?.toXml('NoncurrentVersionExpiration'),
      if (abortIncompleteMultipartUpload != null)
        abortIncompleteMultipartUpload?.toXml('AbortIncompleteMultipartUpload'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// The container for the Outposts bucket lifecycle rule and operator.
class LifecycleRuleAndOperator {
  /// Prefix identifying one or more objects to which the rule applies.
  final String prefix;

  /// All of these tags must exist in the object's tag set in order for the rule
  /// to apply.
  final List<S3Tag> tags;

  LifecycleRuleAndOperator({
    this.prefix,
    this.tags,
  });
  factory LifecycleRuleAndOperator.fromXml(_s.XmlElement elem) {
    return LifecycleRuleAndOperator(
      prefix: _s.extractXmlStringValue(elem, 'Prefix'),
      tags: _s.extractXmlChild(elem, 'Tags')?.let((elem) =>
          elem.findElements('member').map((c) => S3Tag.fromXml(c)).toList()),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (prefix != null) _s.encodeXmlStringValue('Prefix', prefix),
      if (tags != null)
        _s.XmlElement(
            _s.XmlName('Tags'), [], tags.map((e) => e?.toXml('member'))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// The container for the filter of the lifecycle rule.
class LifecycleRuleFilter {
  /// The container for the <code>AND</code> condition for the lifecycle rule.
  final LifecycleRuleAndOperator and;

  /// Prefix identifying one or more objects to which the rule applies.
  final String prefix;
  final S3Tag tag;

  LifecycleRuleFilter({
    this.and,
    this.prefix,
    this.tag,
  });
  factory LifecycleRuleFilter.fromXml(_s.XmlElement elem) {
    return LifecycleRuleFilter(
      and: _s
          .extractXmlChild(elem, 'And')
          ?.let((e) => LifecycleRuleAndOperator.fromXml(e)),
      prefix: _s.extractXmlStringValue(elem, 'Prefix'),
      tag: _s.extractXmlChild(elem, 'Tag')?.let((e) => S3Tag.fromXml(e)),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (prefix != null) _s.encodeXmlStringValue('Prefix', prefix),
      if (tag != null) tag?.toXml('Tag'),
      if (and != null) and?.toXml('And'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

class ListAccessPointsResult {
  /// Contains identification and configuration information for one or more access
  /// points associated with the specified bucket.
  final List<AccessPoint> accessPointList;

  /// If the specified bucket has more access points than can be returned in one
  /// call to this API, this field contains a continuation token that you can
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
          .findElements('member')
          .map((c) => JobListDescriptor.fromXml(c))
          .toList()),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }
}

class ListRegionalBucketsResult {
  /// <code>NextToken</code> is sent when <code>isTruncated</code> is true, which
  /// means there are more buckets that can be listed. The next list requests to
  /// Amazon S3 can be continued with this <code>NextToken</code>.
  /// <code>NextToken</code> is obfuscated and is not a real key.
  final String nextToken;

  /// <p/>
  final List<RegionalBucket> regionalBucketList;

  ListRegionalBucketsResult({
    this.nextToken,
    this.regionalBucketList,
  });
  factory ListRegionalBucketsResult.fromXml(_s.XmlElement elem) {
    return ListRegionalBucketsResult(
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      regionalBucketList: _s.extractXmlChild(elem, 'RegionalBucketList')?.let(
          (elem) => elem
              .findElements('RegionalBucket')
              .map((c) => RegionalBucket.fromXml(c))
              .toList()),
    );
  }
}

/// Part of <code>ListStorageLensConfigurationResult</code>. Each entry includes
/// the description of the S3 Storage Lens configuration, its home Region,
/// whether it is enabled, its Amazon Resource Name (ARN), and config ID.
class ListStorageLensConfigurationEntry {
  /// A container for the S3 Storage Lens home Region. Your metrics data is stored
  /// and retained in your designated S3 Storage Lens home Region.
  final String homeRegion;

  /// A container for the S3 Storage Lens configuration ID.
  final String id;

  /// The ARN of the S3 Storage Lens configuration. This property is read-only.
  final String storageLensArn;

  /// A container for whether the S3 Storage Lens configuration is enabled. This
  /// property is required.
  final bool isEnabled;

  ListStorageLensConfigurationEntry({
    @_s.required this.homeRegion,
    @_s.required this.id,
    @_s.required this.storageLensArn,
    this.isEnabled,
  });
  factory ListStorageLensConfigurationEntry.fromXml(_s.XmlElement elem) {
    return ListStorageLensConfigurationEntry(
      homeRegion: _s.extractXmlStringValue(elem, 'HomeRegion'),
      id: _s.extractXmlStringValue(elem, 'Id'),
      storageLensArn: _s.extractXmlStringValue(elem, 'StorageLensArn'),
      isEnabled: _s.extractXmlBoolValue(elem, 'IsEnabled'),
    );
  }
}

class ListStorageLensConfigurationsResult {
  /// If the request produced more than the maximum number of S3 Storage Lens
  /// configuration results, you can pass this value into a subsequent request to
  /// retrieve the next page of results.
  final String nextToken;

  /// A list of S3 Storage Lens configurations.
  final List<ListStorageLensConfigurationEntry> storageLensConfigurationList;

  ListStorageLensConfigurationsResult({
    this.nextToken,
    this.storageLensConfigurationList,
  });
  factory ListStorageLensConfigurationsResult.fromXml(_s.XmlElement elem) {
    return ListStorageLensConfigurationsResult(
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      storageLensConfigurationList: elem
          .findElements('StorageLensConfiguration')
          .map((c) => ListStorageLensConfigurationEntry.fromXml(c))
          .toList(),
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

/// The container of the noncurrent version expiration.
class NoncurrentVersionExpiration {
  /// Specifies the number of days an object is noncurrent before Amazon S3 can
  /// perform the associated action. For information about the noncurrent days
  /// calculations, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/intro-lifecycle-rules.html#non-current-days-calculations">How
  /// Amazon S3 Calculates When an Object Became Noncurrent</a> in the <i>Amazon
  /// Simple Storage Service Developer Guide</i>.
  final int noncurrentDays;

  NoncurrentVersionExpiration({
    this.noncurrentDays,
  });
  factory NoncurrentVersionExpiration.fromXml(_s.XmlElement elem) {
    return NoncurrentVersionExpiration(
      noncurrentDays: _s.extractXmlIntValue(elem, 'NoncurrentDays'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (noncurrentDays != null)
        _s.encodeXmlIntValue('NoncurrentDays', noncurrentDays),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// The container for the noncurrent version transition.
class NoncurrentVersionTransition {
  /// Specifies the number of days an object is noncurrent before Amazon S3 can
  /// perform the associated action. For information about the noncurrent days
  /// calculations, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/intro-lifecycle-rules.html#non-current-days-calculations">
  /// How Amazon S3 Calculates How Long an Object Has Been Noncurrent</a> in the
  /// <i>Amazon Simple Storage Service Developer Guide</i>.
  final int noncurrentDays;

  /// The class of storage used to store the object.
  final TransitionStorageClass storageClass;

  NoncurrentVersionTransition({
    this.noncurrentDays,
    this.storageClass,
  });
  factory NoncurrentVersionTransition.fromXml(_s.XmlElement elem) {
    return NoncurrentVersionTransition(
      noncurrentDays: _s.extractXmlIntValue(elem, 'NoncurrentDays'),
      storageClass: _s
          .extractXmlStringValue(elem, 'StorageClass')
          ?.toTransitionStorageClass(),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (noncurrentDays != null)
        _s.encodeXmlIntValue('NoncurrentDays', noncurrentDays),
      if (storageClass != null)
        _s.encodeXmlStringValue('StorageClass', storageClass.toValue()),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

enum OperationName {
  lambdaInvoke,
  s3PutObjectCopy,
  s3PutObjectAcl,
  s3PutObjectTagging,
  s3InitiateRestoreObject,
  s3PutObjectLegalHold,
  s3PutObjectRetention,
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
      case OperationName.s3PutObjectLegalHold:
        return 'S3PutObjectLegalHold';
      case OperationName.s3PutObjectRetention:
        return 'S3PutObjectRetention';
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
      case 'S3PutObjectLegalHold':
        return OperationName.s3PutObjectLegalHold;
      case 'S3PutObjectRetention':
        return OperationName.s3PutObjectRetention;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum OutputSchemaVersion {
  v_1,
}

extension on OutputSchemaVersion {
  String toValue() {
    switch (this) {
      case OutputSchemaVersion.v_1:
        return 'V_1';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  OutputSchemaVersion toOutputSchemaVersion() {
    switch (this) {
      case 'V_1':
        return OutputSchemaVersion.v_1;
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

/// A container for the prefix-level configuration.
class PrefixLevel {
  /// A container for the prefix-level storage metrics for S3 Storage Lens.
  final PrefixLevelStorageMetrics storageMetrics;

  PrefixLevel({
    @_s.required this.storageMetrics,
  });
  factory PrefixLevel.fromXml(_s.XmlElement elem) {
    return PrefixLevel(
      storageMetrics: _s
          .extractXmlChild(elem, 'StorageMetrics')
          ?.let((e) => PrefixLevelStorageMetrics.fromXml(e)),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      storageMetrics?.toXml('StorageMetrics'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// A container for the prefix-level storage metrics for S3 Storage Lens.
class PrefixLevelStorageMetrics {
  /// A container for whether prefix-level storage metrics are enabled.
  final bool isEnabled;
  final SelectionCriteria selectionCriteria;

  PrefixLevelStorageMetrics({
    this.isEnabled,
    this.selectionCriteria,
  });
  factory PrefixLevelStorageMetrics.fromXml(_s.XmlElement elem) {
    return PrefixLevelStorageMetrics(
      isEnabled: _s.extractXmlBoolValue(elem, 'IsEnabled'),
      selectionCriteria: _s
          .extractXmlChild(elem, 'SelectionCriteria')
          ?.let((e) => SelectionCriteria.fromXml(e)),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (isEnabled != null) _s.encodeXmlBoolValue('IsEnabled', isEnabled),
      if (selectionCriteria != null)
        selectionCriteria?.toXml('SelectionCriteria'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// The <code>PublicAccessBlock</code> configuration that you want to apply to
/// this Amazon S3 account. You can enable the configuration options in any
/// combination. For more information about when Amazon S3 considers a bucket or
/// object public, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html#access-control-block-public-access-policy-status">The
/// Meaning of "Public"</a> in the <i>Amazon Simple Storage Service Developer
/// Guide</i>.
///
/// This is not supported for Amazon S3 on Outposts.
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
  ///
  /// This is not supported for Amazon S3 on Outposts.
  final bool blockPublicAcls;

  /// Specifies whether Amazon S3 should block public bucket policies for buckets
  /// in this account. Setting this element to <code>TRUE</code> causes Amazon S3
  /// to reject calls to PUT Bucket policy if the specified bucket policy allows
  /// public access.
  ///
  /// Enabling this setting doesn't affect existing bucket policies.
  ///
  /// This is not supported for Amazon S3 on Outposts.
  final bool blockPublicPolicy;

  /// Specifies whether Amazon S3 should ignore public ACLs for buckets in this
  /// account. Setting this element to <code>TRUE</code> causes Amazon S3 to
  /// ignore all public ACLs on buckets in this account and any objects that they
  /// contain.
  ///
  /// Enabling this setting doesn't affect the persistence of any existing ACLs
  /// and doesn't prevent new public ACLs from being set.
  ///
  /// This is not supported for Amazon S3 on Outposts.
  final bool ignorePublicAcls;

  /// Specifies whether Amazon S3 should restrict public bucket policies for
  /// buckets in this account. Setting this element to <code>TRUE</code> restricts
  /// access to buckets with public policies to only AWS service principals and
  /// authorized users within this account.
  ///
  /// Enabling this setting doesn't affect previously stored bucket policies,
  /// except that public and cross-account access within any public bucket policy,
  /// including non-public delegation to specific accounts, is blocked.
  ///
  /// This is not supported for Amazon S3 on Outposts.
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

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (blockPublicAcls != null)
        _s.encodeXmlBoolValue('BlockPublicAcls', blockPublicAcls),
      if (ignorePublicAcls != null)
        _s.encodeXmlBoolValue('IgnorePublicAcls', ignorePublicAcls),
      if (blockPublicPolicy != null)
        _s.encodeXmlBoolValue('BlockPublicPolicy', blockPublicPolicy),
      if (restrictPublicBuckets != null)
        _s.encodeXmlBoolValue('RestrictPublicBuckets', restrictPublicBuckets),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

class PutAccessPointPolicyRequest {
  /// The AWS account ID for owner of the bucket associated with the specified
  /// access point.
  final String accountId;

  /// The name of the access point that you want to associate with the specified
  /// policy.
  ///
  /// For using this parameter with Amazon S3 on Outposts with the REST API, you
  /// must specify the name and the x-amz-outpost-id as well.
  ///
  /// For using this parameter with S3 on Outposts with the AWS SDK and CLI, you
  /// must specify the ARN of the access point accessed in the format
  /// <code>arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/accesspoint/&lt;my-accesspoint-name&gt;</code>.
  /// For example, to access the access point <code>reports-ap</code> through
  /// outpost <code>my-outpost</code> owned by account <code>123456789012</code>
  /// in Region <code>us-west-2</code>, use the URL encoding of
  /// <code>arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/accesspoint/reports-ap</code>.
  /// The value must be URL encoded.
  final String name;

  /// The policy that you want to apply to the specified access point. For more
  /// information about access point policies, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-points.html">Managing
  /// data access with Amazon S3 Access Points</a> in the <i>Amazon Simple Storage
  /// Service Developer Guide</i>.
  final String policy;

  PutAccessPointPolicyRequest({
    @_s.required this.accountId,
    @_s.required this.name,
    @_s.required this.policy,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Policy', policy),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

class PutBucketPolicyRequest {
  /// The AWS account ID of the Outposts bucket.
  final String accountId;

  /// Specifies the bucket.
  ///
  /// For using this parameter with Amazon S3 on Outposts with the REST API, you
  /// must specify the name and the x-amz-outpost-id as well.
  ///
  /// For using this parameter with S3 on Outposts with the AWS SDK and CLI, you
  /// must specify the ARN of the bucket accessed in the format
  /// <code>arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/bucket/&lt;my-bucket-name&gt;</code>.
  /// For example, to access the bucket <code>reports</code> through outpost
  /// <code>my-outpost</code> owned by account <code>123456789012</code> in Region
  /// <code>us-west-2</code>, use the URL encoding of
  /// <code>arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/bucket/reports</code>.
  /// The value must be URL encoded.
  final String bucket;

  /// The bucket policy as a JSON document.
  final String policy;

  /// Set this parameter to true to confirm that you want to remove your
  /// permissions to change this bucket policy in the future.
  /// <note>
  /// This is not supported by Amazon S3 on Outposts buckets.
  /// </note>
  final bool confirmRemoveSelfBucketAccess;

  PutBucketPolicyRequest({
    @_s.required this.accountId,
    @_s.required this.bucket,
    @_s.required this.policy,
    this.confirmRemoveSelfBucketAccess,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Policy', policy),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

class PutJobTaggingRequest {
  /// The AWS account ID associated with the S3 Batch Operations job.
  final String accountId;

  /// The ID for the S3 Batch Operations job whose tags you want to replace.
  final String jobId;

  /// The set of tags to associate with the S3 Batch Operations job.
  final List<S3Tag> tags;

  PutJobTaggingRequest({
    @_s.required this.accountId,
    @_s.required this.jobId,
    @_s.required this.tags,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.XmlElement(
          _s.XmlName('Tags'), [], tags?.map((e) => e?.toXml('member'))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
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

class PutStorageLensConfigurationRequest {
  /// The account ID of the requester.
  final String accountId;

  /// The ID of the S3 Storage Lens configuration.
  final String configId;

  /// The S3 Storage Lens configuration.
  final StorageLensConfiguration storageLensConfiguration;

  /// The tag set of the S3 Storage Lens configuration.
  /// <note>
  /// You can set up to a maximum of 50 tags.
  /// </note>
  final List<StorageLensTag> tags;

  PutStorageLensConfigurationRequest({
    @_s.required this.accountId,
    @_s.required this.configId,
    @_s.required this.storageLensConfiguration,
    this.tags,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      storageLensConfiguration?.toXml('StorageLensConfiguration'),
      if (tags != null)
        _s.XmlElement(_s.XmlName('Tags'), [], tags.map((e) => e?.toXml('Tag'))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

class PutStorageLensConfigurationTaggingRequest {
  /// The account ID of the requester.
  final String accountId;

  /// The ID of the S3 Storage Lens configuration.
  final String configId;

  /// The tag set of the S3 Storage Lens configuration.
  /// <note>
  /// You can set up to a maximum of 50 tags.
  /// </note>
  final List<StorageLensTag> tags;

  PutStorageLensConfigurationTaggingRequest({
    @_s.required this.accountId,
    @_s.required this.configId,
    @_s.required this.tags,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.XmlElement(_s.XmlName('Tags'), [], tags?.map((e) => e?.toXml('Tag'))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

class PutStorageLensConfigurationTaggingResult {
  PutStorageLensConfigurationTaggingResult();
  factory PutStorageLensConfigurationTaggingResult.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return PutStorageLensConfigurationTaggingResult();
  }
}

/// The container for the regional bucket.
class RegionalBucket {
  /// <p/>
  final String bucket;

  /// The creation date of the regional bucket
  final DateTime creationDate;

  /// <p/>
  final bool publicAccessBlockEnabled;

  /// The Amazon Resource Name (ARN) for the regional bucket.
  final String bucketArn;

  /// The AWS Outposts ID of the regional bucket.
  final String outpostId;

  RegionalBucket({
    @_s.required this.bucket,
    @_s.required this.creationDate,
    @_s.required this.publicAccessBlockEnabled,
    this.bucketArn,
    this.outpostId,
  });
  factory RegionalBucket.fromXml(_s.XmlElement elem) {
    return RegionalBucket(
      bucket: _s.extractXmlStringValue(elem, 'Bucket'),
      creationDate: _s.extractXmlDateTimeValue(elem, 'CreationDate'),
      publicAccessBlockEnabled:
          _s.extractXmlBoolValue(elem, 'PublicAccessBlockEnabled'),
      bucketArn: _s.extractXmlStringValue(elem, 'BucketArn'),
      outpostId: _s.extractXmlStringValue(elem, 'OutpostId'),
    );
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
          elem.findElements('member').map((c) => S3Grant.fromXml(c)).toList()),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      owner?.toXml('Owner'),
      if (grants != null)
        _s.XmlElement(
            _s.XmlName('Grants'), [], grants.map((e) => e?.toXml('member'))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
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

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (accessControlList != null)
        accessControlList?.toXml('AccessControlList'),
      if (cannedAccessControlList != null)
        _s.encodeXmlStringValue(
            'CannedAccessControlList', cannedAccessControlList.toValue()),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// A container for the bucket where the Amazon S3 Storage Lens metrics export
/// files are located.
class S3BucketDestination {
  /// The account ID of the owner of the S3 Storage Lens metrics export bucket.
  final String accountId;

  /// The Amazon Resource Name (ARN) of the bucket. This property is read-only and
  /// follows the following format: <code>
  /// arn:aws:s3:<i>us-east-1</i>:<i>example-account-id</i>:bucket/<i>your-destination-bucket-name</i>
  /// </code>
  final String arn;

  /// <p/>
  final Format format;

  /// The schema version of the export file.
  final OutputSchemaVersion outputSchemaVersion;

  /// The container for the type encryption of the metrics exports in this bucket.
  final StorageLensDataExportEncryption encryption;

  /// The prefix of the destination bucket where the metrics export will be
  /// delivered.
  final String prefix;

  S3BucketDestination({
    @_s.required this.accountId,
    @_s.required this.arn,
    @_s.required this.format,
    @_s.required this.outputSchemaVersion,
    this.encryption,
    this.prefix,
  });
  factory S3BucketDestination.fromXml(_s.XmlElement elem) {
    return S3BucketDestination(
      accountId: _s.extractXmlStringValue(elem, 'AccountId'),
      arn: _s.extractXmlStringValue(elem, 'Arn'),
      format: _s.extractXmlStringValue(elem, 'Format')?.toFormat(),
      outputSchemaVersion: _s
          .extractXmlStringValue(elem, 'OutputSchemaVersion')
          ?.toOutputSchemaVersion(),
      encryption: _s
          .extractXmlChild(elem, 'Encryption')
          ?.let((e) => StorageLensDataExportEncryption.fromXml(e)),
      prefix: _s.extractXmlStringValue(elem, 'Prefix'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Format', format?.toValue() ?? ''),
      _s.encodeXmlStringValue(
          'OutputSchemaVersion', outputSchemaVersion?.toValue() ?? ''),
      _s.encodeXmlStringValue('AccountId', accountId),
      _s.encodeXmlStringValue('Arn', arn),
      if (prefix != null) _s.encodeXmlStringValue('Prefix', prefix),
      if (encryption != null) encryption?.toXml('Encryption'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
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

/// Contains the configuration parameters for a PUT Copy object operation. S3
/// Batch Operations passes each value through to the underlying PUT Copy object
/// API. For more information about the parameters for this operation, see <a
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

  /// The legal hold status to be applied to all objects in the Batch Operations
  /// job.
  final S3ObjectLockLegalHoldStatus objectLockLegalHoldStatus;

  /// The retention mode to be applied to all objects in the Batch Operations job.
  final S3ObjectLockMode objectLockMode;

  /// The date when the applied object retention configuration expires on all
  /// objects in the Batch Operations job.
  final DateTime objectLockRetainUntilDate;

  /// Specifies an optional metadata property for website redirects,
  /// <code>x-amz-website-redirect-location</code>. Allows webpage redirects if
  /// the object is accessed through a website endpoint.
  final String redirectLocation;

  /// <p/>
  final bool requesterPays;

  /// <p/>
  final String sSEAwsKmsKeyId;

  /// <p/>
  final S3StorageClass storageClass;

  /// Specifies the folder prefix into which you would like the objects to be
  /// copied. For example, to copy objects into a folder named "Folder1" in the
  /// destination bucket, set the TargetKeyPrefix to "Folder1/".
  final String targetKeyPrefix;

  /// Specifies the destination bucket ARN for the batch copy operation. For
  /// example, to copy objects to a bucket named "destinationBucket", set the
  /// TargetResource to "arn:aws:s3:::destinationBucket".
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
              .findElements('member')
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
              .findElements('member')
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

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (targetResource != null)
        _s.encodeXmlStringValue('TargetResource', targetResource),
      if (cannedAccessControlList != null)
        _s.encodeXmlStringValue(
            'CannedAccessControlList', cannedAccessControlList.toValue()),
      if (accessControlGrants != null)
        _s.XmlElement(_s.XmlName('AccessControlGrants'), [],
            accessControlGrants.map((e) => e?.toXml('member'))),
      if (metadataDirective != null)
        _s.encodeXmlStringValue(
            'MetadataDirective', metadataDirective.toValue()),
      if (modifiedSinceConstraint != null)
        _s.encodeXmlDateTimeValue(
            'ModifiedSinceConstraint', modifiedSinceConstraint),
      if (newObjectMetadata != null)
        newObjectMetadata?.toXml('NewObjectMetadata'),
      if (newObjectTagging != null)
        _s.XmlElement(_s.XmlName('NewObjectTagging'), [],
            newObjectTagging.map((e) => e?.toXml('member'))),
      if (redirectLocation != null)
        _s.encodeXmlStringValue('RedirectLocation', redirectLocation),
      if (requesterPays != null)
        _s.encodeXmlBoolValue('RequesterPays', requesterPays),
      if (storageClass != null)
        _s.encodeXmlStringValue('StorageClass', storageClass.toValue()),
      if (unModifiedSinceConstraint != null)
        _s.encodeXmlDateTimeValue(
            'UnModifiedSinceConstraint', unModifiedSinceConstraint),
      if (sSEAwsKmsKeyId != null)
        _s.encodeXmlStringValue('SSEAwsKmsKeyId', sSEAwsKmsKeyId),
      if (targetKeyPrefix != null)
        _s.encodeXmlStringValue('TargetKeyPrefix', targetKeyPrefix),
      if (objectLockLegalHoldStatus != null)
        _s.encodeXmlStringValue(
            'ObjectLockLegalHoldStatus', objectLockLegalHoldStatus.toValue()),
      if (objectLockMode != null)
        _s.encodeXmlStringValue('ObjectLockMode', objectLockMode.toValue()),
      if (objectLockRetainUntilDate != null)
        _s.encodeXmlDateTimeValue(
            'ObjectLockRetainUntilDate', objectLockRetainUntilDate),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
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

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (grantee != null) grantee?.toXml('Grantee'),
      if (permission != null)
        _s.encodeXmlStringValue('Permission', permission.toValue()),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
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

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (typeIdentifier != null)
        _s.encodeXmlStringValue('TypeIdentifier', typeIdentifier.toValue()),
      if (identifier != null) _s.encodeXmlStringValue('Identifier', identifier),
      if (displayName != null)
        _s.encodeXmlStringValue('DisplayName', displayName),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
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
/// S3 Batch Operations passes each value through to the underlying POST Object
/// restore API. For more information about the parameters for this operation,
/// see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTObjectPOSTrestore.html#RESTObjectPOSTrestore-restore-request">RestoreObject</a>.
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

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (expirationInDays != null)
        _s.encodeXmlIntValue('ExpirationInDays', expirationInDays),
      if (glacierJobTier != null)
        _s.encodeXmlStringValue('GlacierJobTier', glacierJobTier.toValue()),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
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

/// Whether S3 Object Lock legal hold will be applied to objects in an S3 Batch
/// Operations job.
class S3ObjectLockLegalHold {
  /// The Object Lock legal hold status to be applied to all objects in the Batch
  /// Operations job.
  final S3ObjectLockLegalHoldStatus status;

  S3ObjectLockLegalHold({
    @_s.required this.status,
  });
  factory S3ObjectLockLegalHold.fromXml(_s.XmlElement elem) {
    return S3ObjectLockLegalHold(
      status: _s
          .extractXmlStringValue(elem, 'Status')
          ?.toS3ObjectLockLegalHoldStatus(),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Status', status?.toValue() ?? ''),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
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

enum S3ObjectLockRetentionMode {
  compliance,
  governance,
}

extension on S3ObjectLockRetentionMode {
  String toValue() {
    switch (this) {
      case S3ObjectLockRetentionMode.compliance:
        return 'COMPLIANCE';
      case S3ObjectLockRetentionMode.governance:
        return 'GOVERNANCE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  S3ObjectLockRetentionMode toS3ObjectLockRetentionMode() {
    switch (this) {
      case 'COMPLIANCE':
        return S3ObjectLockRetentionMode.compliance;
      case 'GOVERNANCE':
        return S3ObjectLockRetentionMode.governance;
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
        elem.getElement('UserMetadata').findElements('entry').map(
              (c) => MapEntry(
                _s.extractXmlStringValue(c, 'key'),
                _s.extractXmlStringValue(c, 'value'),
              ),
            ),
      ),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (cacheControl != null)
        _s.encodeXmlStringValue('CacheControl', cacheControl),
      if (contentDisposition != null)
        _s.encodeXmlStringValue('ContentDisposition', contentDisposition),
      if (contentEncoding != null)
        _s.encodeXmlStringValue('ContentEncoding', contentEncoding),
      if (contentLanguage != null)
        _s.encodeXmlStringValue('ContentLanguage', contentLanguage),
      if (userMetadata != null)
        _s.XmlElement(
            _s.XmlName('UserMetadata'),
            [],
            userMetadata.entries.map((e) => _s.XmlElement(
                    _s.XmlName('entry'), [], <_s.XmlNode>[
                  _s.encodeXmlStringValue('key', e.key),
                  _s.encodeXmlStringValue('value', e.value)
                ]))),
      if (contentLength != null)
        _s.encodeXmlIntValue('ContentLength', contentLength),
      if (contentMD5 != null) _s.encodeXmlStringValue('ContentMD5', contentMD5),
      if (contentType != null)
        _s.encodeXmlStringValue('ContentType', contentType),
      if (httpExpiresDate != null)
        _s.encodeXmlDateTimeValue('HttpExpiresDate', httpExpiresDate),
      if (requesterCharged != null)
        _s.encodeXmlBoolValue('RequesterCharged', requesterCharged),
      if (sSEAlgorithm != null)
        _s.encodeXmlStringValue('SSEAlgorithm', sSEAlgorithm.toValue()),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
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

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (id != null) _s.encodeXmlStringValue('ID', id),
      if (displayName != null)
        _s.encodeXmlStringValue('DisplayName', displayName),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
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

/// Contains the S3 Object Lock retention mode to be applied to all objects in
/// the S3 Batch Operations job. If you don't provide <code>Mode</code> and
/// <code>RetainUntilDate</code> data types in your operation, you will remove
/// the retention from your objects. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/batch-ops-retention-date.html">Using
/// S3 Object Lock retention with S3 Batch Operations</a> in the <i>Amazon
/// Simple Storage Service Developer Guide</i>.
class S3Retention {
  /// The Object Lock retention mode to be applied to all objects in the Batch
  /// Operations job.
  final S3ObjectLockRetentionMode mode;

  /// The date when the applied Object Lock retention will expire on all objects
  /// set by the Batch Operations job.
  final DateTime retainUntilDate;

  S3Retention({
    this.mode,
    this.retainUntilDate,
  });
  factory S3Retention.fromXml(_s.XmlElement elem) {
    return S3Retention(
      mode:
          _s.extractXmlStringValue(elem, 'Mode')?.toS3ObjectLockRetentionMode(),
      retainUntilDate: _s.extractXmlDateTimeValue(elem, 'RetainUntilDate'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (retainUntilDate != null)
        _s.encodeXmlDateTimeValue('RetainUntilDate', retainUntilDate),
      if (mode != null) _s.encodeXmlStringValue('Mode', mode.toValue()),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
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

/// Contains the configuration parameters for a Set Object ACL operation. S3
/// Batch Operations passes each value through to the underlying PUT Object acl
/// API. For more information about the parameters for this operation, see <a
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

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (accessControlPolicy != null)
        accessControlPolicy?.toXml('AccessControlPolicy'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// Contains the configuration for an S3 Object Lock legal hold operation that
/// an S3 Batch Operations job passes each object through to the underlying
/// <code>PutObjectLegalHold</code> API. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/batch-ops-legal-hold.html">Using
/// S3 Object Lock legal hold with S3 Batch Operations</a> in the <i>Amazon
/// Simple Storage Service Developer Guide</i>.
class S3SetObjectLegalHoldOperation {
  /// Contains the Object Lock legal hold status to be applied to all objects in
  /// the Batch Operations job.
  final S3ObjectLockLegalHold legalHold;

  S3SetObjectLegalHoldOperation({
    @_s.required this.legalHold,
  });
  factory S3SetObjectLegalHoldOperation.fromXml(_s.XmlElement elem) {
    return S3SetObjectLegalHoldOperation(
      legalHold: _s
          .extractXmlChild(elem, 'LegalHold')
          ?.let((e) => S3ObjectLockLegalHold.fromXml(e)),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      legalHold?.toXml('LegalHold'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// Contains the configuration parameters for the Object Lock retention action
/// for an S3 Batch Operations job. Batch Operations passes each value through
/// to the underlying <code>PutObjectRetention</code> API. For more information,
/// see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/batch-ops-retention-date.html">Using
/// S3 Object Lock retention with S3 Batch Operations</a> in the <i>Amazon
/// Simple Storage Service Developer Guide</i>.
class S3SetObjectRetentionOperation {
  /// Contains the Object Lock retention mode to be applied to all objects in the
  /// Batch Operations job. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/batch-ops-retention-date.html">Using
  /// S3 Object Lock retention with S3 Batch Operations</a> in the <i>Amazon
  /// Simple Storage Service Developer Guide</i>.
  final S3Retention retention;

  /// Indicates if the action should be applied to objects in the Batch Operations
  /// job even if they have Object Lock <code> GOVERNANCE</code> type in place.
  final bool bypassGovernanceRetention;

  S3SetObjectRetentionOperation({
    @_s.required this.retention,
    this.bypassGovernanceRetention,
  });
  factory S3SetObjectRetentionOperation.fromXml(_s.XmlElement elem) {
    return S3SetObjectRetentionOperation(
      retention: _s
          .extractXmlChild(elem, 'Retention')
          ?.let((e) => S3Retention.fromXml(e)),
      bypassGovernanceRetention:
          _s.extractXmlBoolValue(elem, 'BypassGovernanceRetention'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (bypassGovernanceRetention != null)
        _s.encodeXmlBoolValue(
            'BypassGovernanceRetention', bypassGovernanceRetention),
      retention?.toXml('Retention'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// Contains the configuration parameters for a Set Object Tagging operation. S3
/// Batch Operations passes each value through to the underlying PUT Object
/// tagging API. For more information about the parameters for this operation,
/// see <a
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
          elem.findElements('member').map((c) => S3Tag.fromXml(c)).toList()),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (tagSet != null)
        _s.XmlElement(
            _s.XmlName('TagSet'), [], tagSet.map((e) => e?.toXml('member'))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
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

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Key', key),
      _s.encodeXmlStringValue('Value', value),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// <p/>
class SSEKMS {
  /// A container for the ARN of the SSE-KMS encryption. This property is
  /// read-only and follows the following format: <code>
  /// arn:aws:kms:<i>us-east-1</i>:<i>example-account-id</i>:key/<i>example-9a73-4afc-8d29-8f5900cef44e</i>
  /// </code>
  final String keyId;

  SSEKMS({
    @_s.required this.keyId,
  });
  factory SSEKMS.fromXml(_s.XmlElement elem) {
    return SSEKMS(
      keyId: _s.extractXmlStringValue(elem, 'KeyId'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('KeyId', keyId),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// <p/>
class SSES3 {
  SSES3();
  factory SSES3.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return SSES3();
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// <p/>
class SelectionCriteria {
  /// A container for the delimiter of the selection criteria being used.
  final String delimiter;

  /// The max depth of the selection criteria
  final int maxDepth;

  /// The minimum number of storage bytes percentage whose metrics will be
  /// selected.
  /// <note>
  /// You must choose a value greater than or equal to <code>1.0</code>.
  /// </note>
  final double minStorageBytesPercentage;

  SelectionCriteria({
    this.delimiter,
    this.maxDepth,
    this.minStorageBytesPercentage,
  });
  factory SelectionCriteria.fromXml(_s.XmlElement elem) {
    return SelectionCriteria(
      delimiter: _s.extractXmlStringValue(elem, 'Delimiter'),
      maxDepth: _s.extractXmlIntValue(elem, 'MaxDepth'),
      minStorageBytesPercentage:
          _s.extractXmlDoubleValue(elem, 'MinStorageBytesPercentage'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (delimiter != null) _s.encodeXmlStringValue('Delimiter', delimiter),
      if (maxDepth != null) _s.encodeXmlIntValue('MaxDepth', maxDepth),
      if (minStorageBytesPercentage != null)
        _s.encodeXmlDoubleValue(
            'MinStorageBytesPercentage', minStorageBytesPercentage),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// The AWS organization for your S3 Storage Lens.
class StorageLensAwsOrg {
  /// A container for the Amazon Resource Name (ARN) of the AWS organization. This
  /// property is read-only and follows the following format: <code>
  /// arn:aws:organizations:<i>us-east-1</i>:<i>example-account-id</i>:organization/<i>o-ex2l495dck</i>
  /// </code>
  final String arn;

  StorageLensAwsOrg({
    @_s.required this.arn,
  });
  factory StorageLensAwsOrg.fromXml(_s.XmlElement elem) {
    return StorageLensAwsOrg(
      arn: _s.extractXmlStringValue(elem, 'Arn'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Arn', arn),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// A container for the Amazon S3 Storage Lens configuration.
class StorageLensConfiguration {
  /// A container for all the account-level configurations of your S3 Storage Lens
  /// configuration.
  final AccountLevel accountLevel;

  /// A container for the Amazon S3 Storage Lens configuration ID.
  final String id;

  /// A container for whether the S3 Storage Lens configuration is enabled.
  final bool isEnabled;

  /// A container for the AWS organization for this S3 Storage Lens configuration.
  final StorageLensAwsOrg awsOrg;

  /// A container to specify the properties of your S3 Storage Lens metrics export
  /// including, the destination, schema and format.
  final StorageLensDataExport dataExport;

  /// A container for what is excluded in this configuration. This container can
  /// only be valid if there is no <code>Include</code> container submitted, and
  /// it's not empty.
  final Exclude exclude;

  /// A container for what is included in this configuration. This container can
  /// only be valid if there is no <code>Exclude</code> container submitted, and
  /// it's not empty.
  final Include include;

  /// The Amazon Resource Name (ARN) of the S3 Storage Lens configuration. This
  /// property is read-only and follows the following format: <code>
  /// arn:aws:s3:<i>us-east-1</i>:<i>example-account-id</i>:storage-lens/<i>your-dashboard-name</i>
  /// </code>
  final String storageLensArn;

  StorageLensConfiguration({
    @_s.required this.accountLevel,
    @_s.required this.id,
    @_s.required this.isEnabled,
    this.awsOrg,
    this.dataExport,
    this.exclude,
    this.include,
    this.storageLensArn,
  });
  factory StorageLensConfiguration.fromXml(_s.XmlElement elem) {
    return StorageLensConfiguration(
      accountLevel: _s
          .extractXmlChild(elem, 'AccountLevel')
          ?.let((e) => AccountLevel.fromXml(e)),
      id: _s.extractXmlStringValue(elem, 'Id'),
      isEnabled: _s.extractXmlBoolValue(elem, 'IsEnabled'),
      awsOrg: _s
          .extractXmlChild(elem, 'AwsOrg')
          ?.let((e) => StorageLensAwsOrg.fromXml(e)),
      dataExport: _s
          .extractXmlChild(elem, 'DataExport')
          ?.let((e) => StorageLensDataExport.fromXml(e)),
      exclude:
          _s.extractXmlChild(elem, 'Exclude')?.let((e) => Exclude.fromXml(e)),
      include:
          _s.extractXmlChild(elem, 'Include')?.let((e) => Include.fromXml(e)),
      storageLensArn: _s.extractXmlStringValue(elem, 'StorageLensArn'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Id', id),
      accountLevel?.toXml('AccountLevel'),
      if (include != null) include?.toXml('Include'),
      if (exclude != null) exclude?.toXml('Exclude'),
      if (dataExport != null) dataExport?.toXml('DataExport'),
      _s.encodeXmlBoolValue('IsEnabled', isEnabled),
      if (awsOrg != null) awsOrg?.toXml('AwsOrg'),
      if (storageLensArn != null)
        _s.encodeXmlStringValue('StorageLensArn', storageLensArn),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// A container to specify the properties of your S3 Storage Lens metrics
/// export, including the destination, schema, and format.
class StorageLensDataExport {
  /// A container for the bucket where the S3 Storage Lens metrics export will be
  /// located.
  final S3BucketDestination s3BucketDestination;

  StorageLensDataExport({
    @_s.required this.s3BucketDestination,
  });
  factory StorageLensDataExport.fromXml(_s.XmlElement elem) {
    return StorageLensDataExport(
      s3BucketDestination: _s
          .extractXmlChild(elem, 'S3BucketDestination')
          ?.let((e) => S3BucketDestination.fromXml(e)),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      s3BucketDestination?.toXml('S3BucketDestination'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// A container for the encryption of the S3 Storage Lens metrics exports.
class StorageLensDataExportEncryption {
  /// <p/>
  final SSEKMS ssekms;

  /// <p/>
  final SSES3 sses3;

  StorageLensDataExportEncryption({
    this.ssekms,
    this.sses3,
  });
  factory StorageLensDataExportEncryption.fromXml(_s.XmlElement elem) {
    return StorageLensDataExportEncryption(
      ssekms:
          _s.extractXmlChild(elem, 'SSE-KMS')?.let((e) => SSEKMS.fromXml(e)),
      sses3: _s.extractXmlChild(elem, 'SSE-S3')?.let((e) => SSES3.fromXml(e)),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (sses3 != null) sses3?.toXml('SSE-S3'),
      if (ssekms != null) ssekms?.toXml('SSE-KMS'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// <p/>
class StorageLensTag {
  /// <p/>
  final String key;

  /// <p/>
  final String value;

  StorageLensTag({
    @_s.required this.key,
    @_s.required this.value,
  });
  factory StorageLensTag.fromXml(_s.XmlElement elem) {
    return StorageLensTag(
      key: _s.extractXmlStringValue(elem, 'Key'),
      value: _s.extractXmlStringValue(elem, 'Value'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Key', key),
      _s.encodeXmlStringValue('Value', value),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// <p/>
class Tagging {
  /// A collection for a set of tags.
  final List<S3Tag> tagSet;

  Tagging({
    @_s.required this.tagSet,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.XmlElement(
          _s.XmlName('TagSet'), [], tagSet?.map((e) => e?.toXml('member'))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// Specifies when an object transitions to a specified storage class. For more
/// information about Amazon S3 Lifecycle configuration rules, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/lifecycle-transition-general-considerations.html">
/// Transitioning objects using Amazon S3 Lifecycle</a> in the <i>Amazon Simple
/// Storage Service Developer Guide</i>.
class Transition {
  /// Indicates when objects are transitioned to the specified storage class. The
  /// date value must be in ISO 8601 format. The time is always midnight UTC.
  final DateTime date;

  /// Indicates the number of days after creation when objects are transitioned to
  /// the specified storage class. The value must be a positive integer.
  final int days;

  /// The storage class to which you want the object to transition.
  final TransitionStorageClass storageClass;

  Transition({
    this.date,
    this.days,
    this.storageClass,
  });
  factory Transition.fromXml(_s.XmlElement elem) {
    return Transition(
      date: _s.extractXmlDateTimeValue(elem, 'Date'),
      days: _s.extractXmlIntValue(elem, 'Days'),
      storageClass: _s
          .extractXmlStringValue(elem, 'StorageClass')
          ?.toTransitionStorageClass(),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (date != null) _s.encodeXmlDateTimeValue('Date', date),
      if (days != null) _s.encodeXmlIntValue('Days', days),
      if (storageClass != null)
        _s.encodeXmlStringValue('StorageClass', storageClass.toValue()),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

enum TransitionStorageClass {
  glacier,
  standardIa,
  onezoneIa,
  intelligentTiering,
  deepArchive,
}

extension on TransitionStorageClass {
  String toValue() {
    switch (this) {
      case TransitionStorageClass.glacier:
        return 'GLACIER';
      case TransitionStorageClass.standardIa:
        return 'STANDARD_IA';
      case TransitionStorageClass.onezoneIa:
        return 'ONEZONE_IA';
      case TransitionStorageClass.intelligentTiering:
        return 'INTELLIGENT_TIERING';
      case TransitionStorageClass.deepArchive:
        return 'DEEP_ARCHIVE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  TransitionStorageClass toTransitionStorageClass() {
    switch (this) {
      case 'GLACIER':
        return TransitionStorageClass.glacier;
      case 'STANDARD_IA':
        return TransitionStorageClass.standardIa;
      case 'ONEZONE_IA':
        return TransitionStorageClass.onezoneIa;
      case 'INTELLIGENT_TIERING':
        return TransitionStorageClass.intelligentTiering;
      case 'DEEP_ARCHIVE':
        return TransitionStorageClass.deepArchive;
    }
    throw Exception('Unknown enum value: $this');
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

/// The virtual private cloud (VPC) configuration for an access point.
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

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('VpcId', vpcId),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String type, String message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class BucketAlreadyExists extends _s.GenericAwsException {
  BucketAlreadyExists({String type, String message})
      : super(type: type, code: 'BucketAlreadyExists', message: message);
}

class BucketAlreadyOwnedByYou extends _s.GenericAwsException {
  BucketAlreadyOwnedByYou({String type, String message})
      : super(type: type, code: 'BucketAlreadyOwnedByYou', message: message);
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
  'BucketAlreadyExists': (type, message) =>
      BucketAlreadyExists(type: type, message: message),
  'BucketAlreadyOwnedByYou': (type, message) =>
      BucketAlreadyOwnedByYou(type: type, message: message),
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
