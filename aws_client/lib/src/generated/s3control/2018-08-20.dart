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

/// AWS S3 Control provides access to Amazon S3 control plane actions.
class S3Control {
  final _s.RestXmlProtocol _protocol;
  S3Control({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
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
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/access-points.html">Managing
  /// Data Access with Amazon S3 Access Points</a> in the <i>Amazon S3 User
  /// Guide</i>.
  /// <p/> <note>
  /// S3 on Outposts only supports VPC-style access points.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3onOutposts.html">
  /// Accessing Amazon S3 on Outposts using virtual private cloud (VPC) only
  /// access points</a> in the <i>Amazon S3 User Guide</i>.
  /// </note>
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
  /// Parameter [publicAccessBlockConfiguration] :
  /// The <code>PublicAccessBlock</code> configuration that you want to apply to
  /// the access point.
  ///
  /// Parameter [vpcConfiguration] :
  /// If you include this field, Amazon S3 restricts access to this access point
  /// to requests from the specified virtual private cloud (VPC).
  /// <note>
  /// This is required for creating an access point for Amazon S3 on Outposts
  /// buckets.
  /// </note>
  Future<CreateAccessPointResult> createAccessPoint({
    required String accountId,
    required String bucket,
    required String name,
    PublicAccessBlockConfiguration? publicAccessBlockConfiguration,
    VpcConfiguration? vpcConfiguration,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
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
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
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

  /// Creates an Object Lambda Access Point. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/transforming-objects.html">Transforming
  /// objects with Object Lambda Access Points</a> in the <i>Amazon S3 User
  /// Guide</i>.
  ///
  /// The following actions are related to
  /// <code>CreateAccessPointForObjectLambda</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DeleteAccessPointForObjectLambda.html">DeleteAccessPointForObjectLambda</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_GetAccessPointForObjectLambda.html">GetAccessPointForObjectLambda</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_ListAccessPointsForObjectLambda.html">ListAccessPointsForObjectLambda</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [accountId] :
  /// The AWS account ID for owner of the specified Object Lambda Access Point.
  ///
  /// Parameter [configuration] :
  /// Object Lambda Access Point configuration as a JSON document.
  ///
  /// Parameter [name] :
  /// The name you want to assign to this Object Lambda Access Point.
  Future<CreateAccessPointForObjectLambdaResult>
      createAccessPointForObjectLambda({
    required String accountId,
    required ObjectLambdaConfiguration configuration,
    required String name,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(configuration, 'configuration');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      3,
      45,
      isRequired: true,
    );
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    final $result = await _protocol.send(
      method: 'PUT',
      requestUri:
          '/v20180820/accesspointforobjectlambda/${Uri.encodeComponent(name)}',
      headers: headers,
      payload: CreateAccessPointForObjectLambdaRequest(
              accountId: accountId, configuration: configuration, name: name)
          .toXml(
        'CreateAccessPointForObjectLambdaRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'),
              'http://awss3control.amazonaws.com/doc/2018-08-20/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
    return CreateAccessPointForObjectLambdaResult.fromXml($result.body);
  }

  /// <note>
  /// This action creates an Amazon S3 on Outposts bucket. To create an S3
  /// bucket, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucket.html">Create
  /// Bucket</a> in the <i>Amazon S3 API Reference</i>.
  /// </note>
  /// Creates a new Outposts bucket. By creating the bucket, you become the
  /// bucket owner. To create an Outposts bucket, you must have S3 on Outposts.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3onOutposts.html">Using
  /// Amazon S3 on Outposts</a> in <i>Amazon S3 User Guide</i>.
  ///
  /// Not every string is an acceptable bucket name. For information on bucket
  /// naming restrictions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/BucketRestrictions.html#bucketnamingrules">Working
  /// with Amazon S3 Buckets</a>.
  ///
  /// S3 on Outposts buckets support:
  ///
  /// <ul>
  /// <li>
  /// Tags
  /// </li>
  /// <li>
  /// LifecycleConfigurations for deleting expired objects
  /// </li>
  /// </ul>
  /// For a complete list of restrictions and Amazon S3 feature limitations on
  /// S3 on Outposts, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3OnOutpostsRestrictionsLimitations.html">
  /// Amazon S3 on Outposts Restrictions and Limitations</a>.
  ///
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
    required String bucket,
    BucketCannedACL? acl,
    CreateBucketConfiguration? createBucketConfiguration,
    String? grantFullControl,
    String? grantRead,
    String? grantReadACP,
    String? grantWrite,
    String? grantWriteACP,
    bool? objectLockEnabledForBucket,
    String? outpostId,
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
    final headers = <String, String>{
      if (acl != null) 'x-amz-acl': acl.toValue(),
      if (grantFullControl != null)
        'x-amz-grant-full-control': grantFullControl.toString(),
      if (grantRead != null) 'x-amz-grant-read': grantRead.toString(),
      if (grantReadACP != null) 'x-amz-grant-read-acp': grantReadACP.toString(),
      if (grantWrite != null) 'x-amz-grant-write': grantWrite.toString(),
      if (grantWriteACP != null)
        'x-amz-grant-write-acp': grantWriteACP.toString(),
      if (objectLockEnabledForBucket != null)
        'x-amz-bucket-object-lock-enabled':
            objectLockEnabledForBucket.toString(),
      if (outpostId != null) 'x-amz-outpost-id': outpostId.toString(),
    };
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

  /// You can use S3 Batch Operations to perform large-scale batch actions on
  /// Amazon S3 objects. Batch Operations can run a single action on lists of
  /// Amazon S3 objects that you specify. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/batch-ops-basics.html">S3
  /// Batch Operations</a> in the <i>Amazon S3 User Guide</i>.
  ///
  /// This action creates a S3 Batch Operations job.
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
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_JobOperation.html">JobOperation</a>
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
  /// Parameter [manifest] :
  /// Configuration parameters for the manifest.
  ///
  /// Parameter [operation] :
  /// The action that you want this job to perform on every object listed in the
  /// manifest. For more information about the available actions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/batch-ops-actions.html">Operations</a>
  /// in the <i>Amazon S3 User Guide</i>.
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
  /// (IAM) role that Batch Operations will use to run this job's action on
  /// every object in the manifest.
  ///
  /// Parameter [clientRequestToken] :
  /// An idempotency token to ensure that you don't accidentally submit the same
  /// request twice. You can use any string up to the maximum length.
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
    required String accountId,
    required JobManifest manifest,
    required JobOperation operation,
    required int priority,
    required JobReport report,
    required String roleArn,
    String? clientRequestToken,
    bool? confirmationRequired,
    String? description,
    List<S3Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
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
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      256,
    );
    clientRequestToken ??= _s.generateIdempotencyToken();
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    final $result = await _protocol.send(
      method: 'POST',
      requestUri: '/v20180820/jobs',
      headers: headers,
      payload: CreateJobRequest(
              accountId: accountId,
              manifest: manifest,
              operation: operation,
              priority: priority,
              report: report,
              roleArn: roleArn,
              clientRequestToken: clientRequestToken,
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
    required String accountId,
    required String name,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
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
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    await _protocol.send(
      method: 'DELETE',
      requestUri: '/v20180820/accesspoint/${Uri.encodeComponent(name)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified Object Lambda Access Point.
  ///
  /// The following actions are related to
  /// <code>DeleteAccessPointForObjectLambda</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_CreateAccessPointForObjectLambda.html">CreateAccessPointForObjectLambda</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_GetAccessPointForObjectLambda.html">GetAccessPointForObjectLambda</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_ListAccessPointsForObjectLambda.html">ListAccessPointsForObjectLambda</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [accountId] :
  /// The account ID for the account that owns the specified Object Lambda
  /// Access Point.
  ///
  /// Parameter [name] :
  /// The name of the access point you want to delete.
  Future<void> deleteAccessPointForObjectLambda({
    required String accountId,
    required String name,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      3,
      45,
      isRequired: true,
    );
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    await _protocol.send(
      method: 'DELETE',
      requestUri:
          '/v20180820/accesspointforobjectlambda/${Uri.encodeComponent(name)}',
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
    required String accountId,
    required String name,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
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
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    await _protocol.send(
      method: 'DELETE',
      requestUri: '/v20180820/accesspoint/${Uri.encodeComponent(name)}/policy',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes the resource policy for an Object Lambda Access Point.
  ///
  /// The following actions are related to
  /// <code>DeleteAccessPointPolicyForObjectLambda</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_GetAccessPointPolicyForObjectLambda.html">GetAccessPointPolicyForObjectLambda</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_PutAccessPointPolicyForObjectLambda.html">PutAccessPointPolicyForObjectLambda</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [accountId] :
  /// The account ID for the account that owns the specified Object Lambda
  /// Access Point.
  ///
  /// Parameter [name] :
  /// The name of the Object Lambda Access Point you want to delete the policy
  /// for.
  Future<void> deleteAccessPointPolicyForObjectLambda({
    required String accountId,
    required String name,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      3,
      45,
      isRequired: true,
    );
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    await _protocol.send(
      method: 'DELETE',
      requestUri:
          '/v20180820/accesspointforobjectlambda/${Uri.encodeComponent(name)}/policy',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// <note>
  /// This action deletes an Amazon S3 on Outposts bucket. To delete an S3
  /// bucket, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucket.html">DeleteBucket</a>
  /// in the <i>Amazon S3 API Reference</i>.
  /// </note>
  /// Deletes the Amazon S3 on Outposts bucket. All objects (including all
  /// object versions and delete markers) in the bucket must be deleted before
  /// the bucket itself can be deleted. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3onOutposts.html">Using
  /// Amazon S3 on Outposts</a> in <i>Amazon S3 User Guide</i>.
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
    required String accountId,
    required String bucket,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
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
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    await _protocol.send(
      method: 'DELETE',
      requestUri: '/v20180820/bucket/${Uri.encodeComponent(bucket)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// <note>
  /// This action deletes an Amazon S3 on Outposts bucket's lifecycle
  /// configuration. To delete an S3 bucket's lifecycle configuration, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketLifecycle.html">DeleteBucketLifecycle</a>
  /// in the <i>Amazon S3 API Reference</i>.
  /// </note>
  /// Deletes the lifecycle configuration from the specified Outposts bucket.
  /// Amazon S3 on Outposts removes all the lifecycle configuration rules in the
  /// lifecycle subresource associated with the bucket. Your objects never
  /// expire, and Amazon S3 on Outposts no longer automatically deletes any
  /// objects on the basis of rules contained in the deleted lifecycle
  /// configuration. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3onOutposts.html">Using
  /// Amazon S3 on Outposts</a> in <i>Amazon S3 User Guide</i>.
  ///
  /// To use this action, you must have permission to perform the
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
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/intro-lifecycle-rules.html#intro-lifecycle-rules-actions">Elements
  /// to Describe Lifecycle Actions</a>.
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
    required String accountId,
    required String bucket,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
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
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    await _protocol.send(
      method: 'DELETE',
      requestUri:
          '/v20180820/bucket/${Uri.encodeComponent(bucket)}/lifecycleconfiguration',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// <note>
  /// This action deletes an Amazon S3 on Outposts bucket policy. To delete an
  /// S3 bucket policy, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketPolicy.html">DeleteBucketPolicy</a>
  /// in the <i>Amazon S3 API Reference</i>.
  /// </note>
  /// This implementation of the DELETE action uses the policy subresource to
  /// delete the policy of a specified Amazon S3 on Outposts bucket. If you are
  /// using an identity other than the root user of the AWS account that owns
  /// the bucket, the calling identity must have the
  /// <code>s3-outposts:DeleteBucketPolicy</code> permissions on the specified
  /// Outposts bucket and belong to the bucket owner's account to use this
  /// action. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3onOutposts.html">Using
  /// Amazon S3 on Outposts</a> in <i>Amazon S3 User Guide</i>.
  ///
  /// If you don't have <code>DeleteBucketPolicy</code> permissions, Amazon S3
  /// returns a <code>403 Access Denied</code> error. If you have the correct
  /// permissions, but you're not using an identity that belongs to the bucket
  /// owner's account, Amazon S3 returns a <code>405 Method Not Allowed</code>
  /// error.
  /// <important>
  /// As a security precaution, the root user of the AWS account that owns a
  /// bucket can always use this action, even if the policy explicitly denies
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
    required String accountId,
    required String bucket,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
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
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    await _protocol.send(
      method: 'DELETE',
      requestUri: '/v20180820/bucket/${Uri.encodeComponent(bucket)}/policy',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// <note>
  /// This action deletes an Amazon S3 on Outposts bucket's tags. To delete an
  /// S3 bucket tags, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketTagging.html">DeleteBucketTagging</a>
  /// in the <i>Amazon S3 API Reference</i>.
  /// </note>
  /// Deletes the tags from the Outposts bucket. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3onOutposts.html">Using
  /// Amazon S3 on Outposts</a> in <i>Amazon S3 User Guide</i>.
  ///
  /// To use this action, you must have permission to perform the
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
    required String accountId,
    required String bucket,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
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
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
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
  /// access and labeling jobs using tags</a> in the <i>Amazon S3 User
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
    required String accountId,
    required String jobId,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
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
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
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
    required String accountId,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
      isRequired: true,
    );
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    await _protocol.send(
      method: 'DELETE',
      requestUri: '/v20180820/configuration/publicAccessBlock',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the Amazon S3 Storage Lens configuration. For more information
  /// about S3 Storage Lens, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage_lens.html">Assessing
  /// your storage activity and usage with Amazon S3 Storage Lens </a> in the
  /// <i>Amazon S3 User Guide</i>.
  /// <note>
  /// To use this action, you must have permission to perform the
  /// <code>s3:DeleteStorageLensConfiguration</code> action. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage_lens_iam_permissions.html">Setting
  /// permissions to use Amazon S3 Storage Lens</a> in the <i>Amazon S3 User
  /// Guide</i>.
  /// </note>
  ///
  /// Parameter [accountId] :
  /// The account ID of the requester.
  ///
  /// Parameter [configId] :
  /// The ID of the S3 Storage Lens configuration.
  Future<void> deleteStorageLensConfiguration({
    required String accountId,
    required String configId,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
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
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    await _protocol.send(
      method: 'DELETE',
      requestUri: '/v20180820/storagelens/${Uri.encodeComponent(configId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the Amazon S3 Storage Lens configuration tags. For more
  /// information about S3 Storage Lens, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage_lens.html">Assessing
  /// your storage activity and usage with Amazon S3 Storage Lens </a> in the
  /// <i>Amazon S3 User Guide</i>.
  /// <note>
  /// To use this action, you must have permission to perform the
  /// <code>s3:DeleteStorageLensConfigurationTagging</code> action. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage_lens_iam_permissions.html">Setting
  /// permissions to use Amazon S3 Storage Lens</a> in the <i>Amazon S3 User
  /// Guide</i>.
  /// </note>
  ///
  /// Parameter [accountId] :
  /// The account ID of the requester.
  ///
  /// Parameter [configId] :
  /// The ID of the S3 Storage Lens configuration.
  Future<void> deleteStorageLensConfigurationTagging({
    required String accountId,
    required String configId,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
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
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
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
  /// Batch Operations</a> in the <i>Amazon S3 User Guide</i>.
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
  /// The AWS account ID associated with the S3 Batch Operations job.
  ///
  /// Parameter [jobId] :
  /// The ID for the job whose information you want to retrieve.
  Future<DescribeJobResult> describeJob({
    required String accountId,
    required String jobId,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
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
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
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
    required String accountId,
    required String name,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
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
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/v20180820/accesspoint/${Uri.encodeComponent(name)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetAccessPointResult.fromXml($result.body);
  }

  /// Returns configuration for an Object Lambda Access Point.
  ///
  /// The following actions are related to
  /// <code>GetAccessPointConfigurationForObjectLambda</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_PutAccessPointConfigurationForObjectLambda.html">PutAccessPointConfigurationForObjectLambda</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [accountId] :
  /// The account ID for the account that owns the specified Object Lambda
  /// Access Point.
  ///
  /// Parameter [name] :
  /// The name of the Object Lambda Access Point you want to return the
  /// configuration for.
  Future<GetAccessPointConfigurationForObjectLambdaResult>
      getAccessPointConfigurationForObjectLambda({
    required String accountId,
    required String name,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      3,
      45,
      isRequired: true,
    );
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri:
          '/v20180820/accesspointforobjectlambda/${Uri.encodeComponent(name)}/configuration',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetAccessPointConfigurationForObjectLambdaResult.fromXml(
        $result.body);
  }

  /// Returns configuration information about the specified Object Lambda Access
  /// Point
  ///
  /// The following actions are related to
  /// <code>GetAccessPointForObjectLambda</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_CreateAccessPointForObjectLambda.html">CreateAccessPointForObjectLambda</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DeleteAccessPointForObjectLambda.html">DeleteAccessPointForObjectLambda</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_ListAccessPointsForObjectLambda.html">ListAccessPointsForObjectLambda</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [accountId] :
  /// The account ID for the account that owns the specified Object Lambda
  /// Access Point.
  ///
  /// Parameter [name] :
  /// The name of the Object Lambda Access Point.
  Future<GetAccessPointForObjectLambdaResult> getAccessPointForObjectLambda({
    required String accountId,
    required String name,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      3,
      45,
      isRequired: true,
    );
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri:
          '/v20180820/accesspointforobjectlambda/${Uri.encodeComponent(name)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetAccessPointForObjectLambdaResult.fromXml($result.body);
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
    required String accountId,
    required String name,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
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
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/v20180820/accesspoint/${Uri.encodeComponent(name)}/policy',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetAccessPointPolicyResult.fromXml($result.body);
  }

  /// Returns the resource policy for an Object Lambda Access Point.
  ///
  /// The following actions are related to
  /// <code>GetAccessPointPolicyForObjectLambda</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DeleteAccessPointPolicyForObjectLambda.html">DeleteAccessPointPolicyForObjectLambda</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_PutAccessPointPolicyForObjectLambda.html">PutAccessPointPolicyForObjectLambda</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [accountId] :
  /// The account ID for the account that owns the specified Object Lambda
  /// Access Point.
  ///
  /// Parameter [name] :
  /// The name of the Object Lambda Access Point.
  Future<GetAccessPointPolicyForObjectLambdaResult>
      getAccessPointPolicyForObjectLambda({
    required String accountId,
    required String name,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      3,
      45,
      isRequired: true,
    );
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri:
          '/v20180820/accesspointforobjectlambda/${Uri.encodeComponent(name)}/policy',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetAccessPointPolicyForObjectLambdaResult.fromXml($result.body);
  }

  /// Indicates whether the specified access point currently has a policy that
  /// allows public access. For more information about public access through
  /// access points, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/access-points.html">Managing
  /// Data Access with Amazon S3 access points</a> in the <i>Amazon S3 User
  /// Guide</i>.
  ///
  /// Parameter [accountId] :
  /// The account ID for the account that owns the specified access point.
  ///
  /// Parameter [name] :
  /// The name of the access point whose policy status you want to retrieve.
  Future<GetAccessPointPolicyStatusResult> getAccessPointPolicyStatus({
    required String accountId,
    required String name,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
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
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri:
          '/v20180820/accesspoint/${Uri.encodeComponent(name)}/policyStatus',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetAccessPointPolicyStatusResult.fromXml($result.body);
  }

  /// Returns the status of the resource policy associated with an Object Lambda
  /// Access Point.
  ///
  /// Parameter [accountId] :
  /// The account ID for the account that owns the specified Object Lambda
  /// Access Point.
  ///
  /// Parameter [name] :
  /// The name of the Object Lambda Access Point.
  Future<GetAccessPointPolicyStatusForObjectLambdaResult>
      getAccessPointPolicyStatusForObjectLambda({
    required String accountId,
    required String name,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      3,
      45,
      isRequired: true,
    );
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri:
          '/v20180820/accesspointforobjectlambda/${Uri.encodeComponent(name)}/policyStatus',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetAccessPointPolicyStatusForObjectLambdaResult.fromXml(
        $result.body);
  }

  /// Gets an Amazon S3 on Outposts bucket. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3onOutposts.html">
  /// Using Amazon S3 on Outposts</a> in the <i>Amazon S3 User Guide</i>.
  ///
  /// If you are using an identity other than the root user of the AWS account
  /// that owns the Outposts bucket, the calling identity must have the
  /// <code>s3-outposts:GetBucket</code> permissions on the specified Outposts
  /// bucket and belong to the Outposts bucket owner's account in order to use
  /// this action. Only users from Outposts bucket owner account with the right
  /// permissions can perform actions on an Outposts bucket.
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
    required String accountId,
    required String bucket,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
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
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/v20180820/bucket/${Uri.encodeComponent(bucket)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetBucketResult.fromXml($result.body);
  }

  /// <note>
  /// This action gets an Amazon S3 on Outposts bucket's lifecycle
  /// configuration. To get an S3 bucket's lifecycle configuration, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketLifecycleConfiguration.html">GetBucketLifecycleConfiguration</a>
  /// in the <i>Amazon S3 API Reference</i>.
  /// </note>
  /// Returns the lifecycle configuration information set on the Outposts
  /// bucket. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3onOutposts.html">Using
  /// Amazon S3 on Outposts</a> and for information about lifecycle
  /// configuration, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lifecycle-mgmt.html">
  /// Object Lifecycle Management</a> in <i>Amazon S3 User Guide</i>.
  ///
  /// To use this action, you must have permission to perform the
  /// <code>s3-outposts:GetLifecycleConfiguration</code> action. The Outposts
  /// bucket owner has this permission, by default. The bucket owner can grant
  /// this permission to others. For more information about permissions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">Permissions
  /// Related to Bucket Subresource Operations</a> and <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-access-control.html">Managing
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
    required String accountId,
    required String bucket,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
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
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
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
  /// in the <i>Amazon S3 API Reference</i>.
  /// </note>
  /// Returns the policy of a specified Outposts bucket. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3onOutposts.html">Using
  /// Amazon S3 on Outposts</a> in the <i>Amazon S3 User Guide</i>.
  ///
  /// If you are using an identity other than the root user of the AWS account
  /// that owns the bucket, the calling identity must have the
  /// <code>GetBucketPolicy</code> permissions on the specified bucket and
  /// belong to the bucket owner's account in order to use this action.
  ///
  /// Only users from Outposts bucket owner account with the right permissions
  /// can perform actions on an Outposts bucket. If you don't have
  /// <code>s3-outposts:GetBucketPolicy</code> permissions or you're not using
  /// an identity that belongs to the bucket owner's account, Amazon S3 returns
  /// a <code>403 Access Denied</code> error.
  /// <important>
  /// As a security precaution, the root user of the AWS account that owns a
  /// bucket can always use this action, even if the policy explicitly denies
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
    required String accountId,
    required String bucket,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
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
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/v20180820/bucket/${Uri.encodeComponent(bucket)}/policy',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetBucketPolicyResult.fromXml($result.body);
  }

  /// <note>
  /// This action gets an Amazon S3 on Outposts bucket's tags. To get an S3
  /// bucket tags, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketTagging.html">GetBucketTagging</a>
  /// in the <i>Amazon S3 API Reference</i>.
  /// </note>
  /// Returns the tag set associated with the Outposts bucket. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3onOutposts.html">Using
  /// Amazon S3 on Outposts</a> in the <i>Amazon S3 User Guide</i>.
  ///
  /// To use this action, you must have permission to perform the
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
    required String accountId,
    required String bucket,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
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
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
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
  /// access and labeling jobs using tags</a> in the <i>Amazon S3 User
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
    required String accountId,
    required String jobId,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
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
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
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
    required String accountId,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
      isRequired: true,
    );
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
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
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage_lens.html">Assessing
  /// your storage activity and usage with Amazon S3 Storage Lens </a> in the
  /// <i>Amazon S3 User Guide</i>.
  /// <note>
  /// To use this action, you must have permission to perform the
  /// <code>s3:GetStorageLensConfiguration</code> action. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage_lens_iam_permissions.html">Setting
  /// permissions to use Amazon S3 Storage Lens</a> in the <i>Amazon S3 User
  /// Guide</i>.
  /// </note>
  ///
  /// Parameter [accountId] :
  /// The account ID of the requester.
  ///
  /// Parameter [configId] :
  /// The ID of the Amazon S3 Storage Lens configuration.
  Future<GetStorageLensConfigurationResult> getStorageLensConfiguration({
    required String accountId,
    required String configId,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
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
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
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
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage_lens.html">Assessing
  /// your storage activity and usage with Amazon S3 Storage Lens </a> in the
  /// <i>Amazon S3 User Guide</i>.
  /// <note>
  /// To use this action, you must have permission to perform the
  /// <code>s3:GetStorageLensConfigurationTagging</code> action. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage_lens_iam_permissions.html">Setting
  /// permissions to use Amazon S3 Storage Lens</a> in the <i>Amazon S3 User
  /// Guide</i>.
  /// </note>
  ///
  /// Parameter [accountId] :
  /// The account ID of the requester.
  ///
  /// Parameter [configId] :
  /// The ID of the Amazon S3 Storage Lens configuration.
  Future<GetStorageLensConfigurationTaggingResult>
      getStorageLensConfigurationTagging({
    required String accountId,
    required String configId,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
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
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
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
    required String accountId,
    String? bucket,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
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
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
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

  /// Returns a list of the access points associated with the Object Lambda
  /// Access Point. You can retrieve up to 1000 access points per call. If there
  /// are more than 1,000 access points (or the number specified in
  /// <code>maxResults</code>, whichever is less), the response will include a
  /// continuation token that you can use to list the additional access points.
  ///
  /// The following actions are related to
  /// <code>ListAccessPointsForObjectLambda</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_CreateAccessPointForObjectLambda.html">CreateAccessPointForObjectLambda</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DeleteAccessPointForObjectLambda.html">DeleteAccessPointForObjectLambda</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_GetAccessPointForObjectLambda.html">GetAccessPointForObjectLambda</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [accountId] :
  /// The account ID for the account that owns the specified Object Lambda
  /// Access Point.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of access points that you want to include in the list.
  /// If there are more than this number of access points, then the response
  /// will include a continuation token in the <code>NextToken</code> field that
  /// you can use to retrieve the next page of access points.
  ///
  /// Parameter [nextToken] :
  /// If the list has more access points than can be returned in one call to
  /// this API, this field contains a continuation token that you can provide in
  /// subsequent calls to this API to retrieve additional access points.
  Future<ListAccessPointsForObjectLambdaResult>
      listAccessPointsForObjectLambda({
    required String accountId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
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
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/v20180820/accesspointforobjectlambda',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListAccessPointsForObjectLambdaResult.fromXml($result.body);
  }

  /// Lists current S3 Batch Operations jobs and jobs that have ended within the
  /// last 30 days for the AWS account making the request. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/batch-ops-basics.html">S3
  /// Batch Operations</a> in the <i>Amazon S3 User Guide</i>.
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
  /// The AWS account ID associated with the S3 Batch Operations job.
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
    required String accountId,
    List<JobStatus>? jobStatuses,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
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
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    final $query = <String, List<String>>{
      if (jobStatuses != null)
        'jobStatuses': jobStatuses.map((e) => e.toValue()).toList(),
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
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3onOutposts.html">Using
  /// Amazon S3 on Outposts</a> in the <i>Amazon S3 User Guide</i>.
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
    required String accountId,
    int? maxResults,
    String? nextToken,
    String? outpostId,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
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
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
      if (outpostId != null) 'x-amz-outpost-id': outpostId.toString(),
    };
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
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage_lens.html">Assessing
  /// your storage activity and usage with Amazon S3 Storage Lens </a> in the
  /// <i>Amazon S3 User Guide</i>.
  /// <note>
  /// To use this action, you must have permission to perform the
  /// <code>s3:ListStorageLensConfigurations</code> action. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage_lens_iam_permissions.html">Setting
  /// permissions to use Amazon S3 Storage Lens</a> in the <i>Amazon S3 User
  /// Guide</i>.
  /// </note>
  ///
  /// Parameter [accountId] :
  /// The account ID of the requester.
  ///
  /// Parameter [nextToken] :
  /// A pagination token to request the next page of results.
  Future<ListStorageLensConfigurationsResult> listStorageLensConfigurations({
    required String accountId,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
      isRequired: true,
    );
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
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

  /// Replaces configuration for an Object Lambda Access Point.
  ///
  /// The following actions are related to
  /// <code>PutAccessPointConfigurationForObjectLambda</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_GetAccessPointConfigurationForObjectLambda.html">GetAccessPointConfigurationForObjectLambda</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [accountId] :
  /// The account ID for the account that owns the specified Object Lambda
  /// Access Point.
  ///
  /// Parameter [configuration] :
  /// Object Lambda Access Point configuration document.
  ///
  /// Parameter [name] :
  /// The name of the Object Lambda Access Point.
  Future<void> putAccessPointConfigurationForObjectLambda({
    required String accountId,
    required ObjectLambdaConfiguration configuration,
    required String name,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(configuration, 'configuration');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      3,
      45,
      isRequired: true,
    );
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    await _protocol.send(
      method: 'PUT',
      requestUri:
          '/v20180820/accesspointforobjectlambda/${Uri.encodeComponent(name)}/configuration',
      headers: headers,
      payload: PutAccessPointConfigurationForObjectLambdaRequest(
              accountId: accountId, configuration: configuration, name: name)
          .toXml(
        'PutAccessPointConfigurationForObjectLambdaRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'),
              'http://awss3control.amazonaws.com/doc/2018-08-20/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
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
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/access-points.html">Managing
  /// data access with Amazon S3 access points</a> in the <i>Amazon S3 User
  /// Guide</i>.
  Future<void> putAccessPointPolicy({
    required String accountId,
    required String name,
    required String policy,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
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
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
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

  /// Creates or replaces resource policy for an Object Lambda Access Point. For
  /// an example policy, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/olap-create.html#olap-create-cli">Creating
  /// Object Lambda Access Points</a> in the <i>Amazon S3 User Guide</i>.
  ///
  /// The following actions are related to
  /// <code>PutAccessPointPolicyForObjectLambda</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DeleteAccessPointPolicyForObjectLambda.html">DeleteAccessPointPolicyForObjectLambda</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_GetAccessPointPolicyForObjectLambda.html">GetAccessPointPolicyForObjectLambda</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [accountId] :
  /// The account ID for the account that owns the specified Object Lambda
  /// Access Point.
  ///
  /// Parameter [name] :
  /// The name of the Object Lambda Access Point.
  ///
  /// Parameter [policy] :
  /// Object Lambda Access Point resource policy document.
  Future<void> putAccessPointPolicyForObjectLambda({
    required String accountId,
    required String name,
    required String policy,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      3,
      45,
      isRequired: true,
    );
    ArgumentError.checkNotNull(policy, 'policy');
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    await _protocol.send(
      method: 'PUT',
      requestUri:
          '/v20180820/accesspointforobjectlambda/${Uri.encodeComponent(name)}/policy',
      headers: headers,
      payload: PutAccessPointPolicyForObjectLambdaRequest(
              accountId: accountId, name: name, policy: policy)
          .toXml(
        'PutAccessPointPolicyForObjectLambdaRequest',
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
  /// in the <i>Amazon S3 API Reference</i>.
  /// </note>
  /// Creates a new lifecycle configuration for the S3 on Outposts bucket or
  /// replaces an existing lifecycle configuration. Outposts buckets only
  /// support lifecycle configurations that delete/expire objects after a
  /// certain period of time and abort incomplete multipart uploads.
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
    required String accountId,
    required String bucket,
    LifecycleConfiguration? lifecycleConfiguration,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
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
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
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
  /// in the <i>Amazon S3 API Reference</i>.
  /// </note>
  /// Applies an Amazon S3 bucket policy to an Outposts bucket. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3onOutposts.html">Using
  /// Amazon S3 on Outposts</a> in the <i>Amazon S3 User Guide</i>.
  ///
  /// If you are using an identity other than the root user of the AWS account
  /// that owns the Outposts bucket, the calling identity must have the
  /// <code>PutBucketPolicy</code> permissions on the specified Outposts bucket
  /// and belong to the bucket owner's account in order to use this action.
  ///
  /// If you don't have <code>PutBucketPolicy</code> permissions, Amazon S3
  /// returns a <code>403 Access Denied</code> error. If you have the correct
  /// permissions, but you're not using an identity that belongs to the bucket
  /// owner's account, Amazon S3 returns a <code>405 Method Not Allowed</code>
  /// error.
  /// <important>
  /// As a security precaution, the root user of the AWS account that owns a
  /// bucket can always use this action, even if the policy explicitly denies
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
    required String accountId,
    required String bucket,
    required String policy,
    bool? confirmRemoveSelfBucketAccess,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
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
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
      if (confirmRemoveSelfBucketAccess != null)
        'x-amz-confirm-remove-self-bucket-access':
            confirmRemoveSelfBucketAccess.toString(),
    };
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
  /// in the <i>Amazon S3 API Reference</i>.
  /// </note>
  /// Sets the tags for an S3 on Outposts bucket. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3onOutposts.html">Using
  /// Amazon S3 on Outposts</a> in the <i>Amazon S3 User Guide</i>.
  ///
  /// Use tags to organize your AWS bill to reflect your own cost structure. To
  /// do this, sign up to get your AWS account bill with tag key values
  /// included. Then, to see the cost of combined resources, organize your
  /// billing information according to resources with the same tag key values.
  /// For example, you can tag several resources with a specific application
  /// name, and then organize your billing information to see the total cost of
  /// that application across several services. For more information, see <a
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html">Cost
  /// allocation and tagging</a>.
  /// <note>
  /// Within a bucket, if you add a tag that has the same key as an existing
  /// tag, the new value overwrites the old value. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/CostAllocTagging.html">
  /// Using cost allocation in Amazon S3 bucket tags</a>.
  /// </note>
  /// To use this action, you must have permissions to perform the
  /// <code>s3-outposts:PutBucketTagging</code> action. The Outposts bucket
  /// owner has this permission by default and can grant this permission to
  /// others. For more information about permissions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">
  /// Permissions Related to Bucket Subresource Operations</a> and <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-access-control.html">Managing
  /// access permissions to your Amazon S3 resources</a>.
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
  /// Description: A conflicting conditional action is currently in progress
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
    required String accountId,
    required String bucket,
    required Tagging tagging,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
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
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
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
  /// access and labeling jobs using tags</a> in the <i>Amazon S3 User
  /// Guide</i>.
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
  /// To use this action, you must have permission to perform the
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
    required String accountId,
    required String jobId,
    required List<S3Tag> tags,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
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
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
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
    required String accountId,
    required PublicAccessBlockConfiguration publicAccessBlockConfiguration,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        publicAccessBlockConfiguration, 'publicAccessBlockConfiguration');
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
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
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage_lens.html">Working
  /// with Amazon S3 Storage Lens</a> in the <i>Amazon S3 User Guide</i>.
  /// <note>
  /// To use this action, you must have permission to perform the
  /// <code>s3:PutStorageLensConfiguration</code> action. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage_lens_iam_permissions.html">Setting
  /// permissions to use Amazon S3 Storage Lens</a> in the <i>Amazon S3 User
  /// Guide</i>.
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
    required String accountId,
    required String configId,
    required StorageLensConfiguration storageLensConfiguration,
    List<StorageLensTag>? tags,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
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
    ArgumentError.checkNotNull(
        storageLensConfiguration, 'storageLensConfiguration');
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
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
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage_lens.html">Assessing
  /// your storage activity and usage with Amazon S3 Storage Lens </a> in the
  /// <i>Amazon S3 User Guide</i>.
  /// <note>
  /// To use this action, you must have permission to perform the
  /// <code>s3:PutStorageLensConfigurationTagging</code> action. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage_lens_iam_permissions.html">Setting
  /// permissions to use Amazon S3 Storage Lens</a> in the <i>Amazon S3 User
  /// Guide</i>.
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
    required String accountId,
    required String configId,
    required List<StorageLensTag> tags,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
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
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
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
  /// Batch Operations</a> in the <i>Amazon S3 User Guide</i>.
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
  /// The AWS account ID associated with the S3 Batch Operations job.
  ///
  /// Parameter [jobId] :
  /// The ID for the job whose priority you want to update.
  ///
  /// Parameter [priority] :
  /// The priority you want to assign to this job.
  Future<UpdateJobPriorityResult> updateJobPriority({
    required String accountId,
    required String jobId,
    required int priority,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
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
    ArgumentError.checkNotNull(priority, 'priority');
    _s.validateNumRange(
      'priority',
      priority,
      0,
      2147483647,
      isRequired: true,
    );
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    final $query = <String, List<String>>{
      'priority': [priority.toString()],
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

  /// Updates the status for the specified job. Use this action to confirm that
  /// you want to run a job or to cancel an existing job. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/batch-ops-basics.html">S3
  /// Batch Operations</a> in the <i>Amazon S3 User Guide</i>.
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
  /// The AWS account ID associated with the S3 Batch Operations job.
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
    required String accountId,
    required String jobId,
    required RequestedJobStatus requestedJobStatus,
    String? statusUpdateReason,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      64,
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
    ArgumentError.checkNotNull(requestedJobStatus, 'requestedJobStatus');
    _s.validateStringLength(
      'statusUpdateReason',
      statusUpdateReason,
      1,
      256,
    );
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    final $query = <String, List<String>>{
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
  final int? daysAfterInitiation;

  AbortIncompleteMultipartUpload({
    this.daysAfterInitiation,
  });

  factory AbortIncompleteMultipartUpload.fromJson(Map<String, dynamic> json) {
    return AbortIncompleteMultipartUpload(
      daysAfterInitiation: json['DaysAfterInitiation'] as int?,
    );
  }

  factory AbortIncompleteMultipartUpload.fromXml(_s.XmlElement elem) {
    return AbortIncompleteMultipartUpload(
      daysAfterInitiation: _s.extractXmlIntValue(elem, 'DaysAfterInitiation'),
    );
  }

  Map<String, dynamic> toJson() {
    final daysAfterInitiation = this.daysAfterInitiation;
    return {
      if (daysAfterInitiation != null)
        'DaysAfterInitiation': daysAfterInitiation,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final daysAfterInitiation = this.daysAfterInitiation;
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
      $children,
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
  final String? accessPointArn;

  /// The virtual private cloud (VPC) configuration for this access point, if one
  /// exists.
  /// <note>
  /// This element is empty if this access point is an Amazon S3 on Outposts
  /// access point that is used by other AWS services.
  /// </note>
  final VpcConfiguration? vpcConfiguration;

  AccessPoint({
    required this.bucket,
    required this.name,
    required this.networkOrigin,
    this.accessPointArn,
    this.vpcConfiguration,
  });

  factory AccessPoint.fromJson(Map<String, dynamic> json) {
    return AccessPoint(
      bucket: json['Bucket'] as String,
      name: json['Name'] as String,
      networkOrigin: (json['NetworkOrigin'] as String).toNetworkOrigin(),
      accessPointArn: json['AccessPointArn'] as String?,
      vpcConfiguration: json['VpcConfiguration'] != null
          ? VpcConfiguration.fromJson(
              json['VpcConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  factory AccessPoint.fromXml(_s.XmlElement elem) {
    return AccessPoint(
      bucket: _s.extractXmlStringValue(elem, 'Bucket')!,
      name: _s.extractXmlStringValue(elem, 'Name')!,
      networkOrigin:
          _s.extractXmlStringValue(elem, 'NetworkOrigin')!.toNetworkOrigin(),
      accessPointArn: _s.extractXmlStringValue(elem, 'AccessPointArn'),
      vpcConfiguration: _s
          .extractXmlChild(elem, 'VpcConfiguration')
          ?.let((e) => VpcConfiguration.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final name = this.name;
    final networkOrigin = this.networkOrigin;
    final accessPointArn = this.accessPointArn;
    final vpcConfiguration = this.vpcConfiguration;
    return {
      'Bucket': bucket,
      'Name': name,
      'NetworkOrigin': networkOrigin.toValue(),
      if (accessPointArn != null) 'AccessPointArn': accessPointArn,
      if (vpcConfiguration != null) 'VpcConfiguration': vpcConfiguration,
    };
  }
}

/// A container for the account level Amazon S3 Storage Lens configuration.
class AccountLevel {
  /// A container for the S3 Storage Lens bucket-level configuration.
  final BucketLevel bucketLevel;

  /// A container for the S3 Storage Lens activity metrics.
  final ActivityMetrics? activityMetrics;

  AccountLevel({
    required this.bucketLevel,
    this.activityMetrics,
  });

  factory AccountLevel.fromJson(Map<String, dynamic> json) {
    return AccountLevel(
      bucketLevel:
          BucketLevel.fromJson(json['BucketLevel'] as Map<String, dynamic>),
      activityMetrics: json['ActivityMetrics'] != null
          ? ActivityMetrics.fromJson(
              json['ActivityMetrics'] as Map<String, dynamic>)
          : null,
    );
  }

  factory AccountLevel.fromXml(_s.XmlElement elem) {
    return AccountLevel(
      bucketLevel:
          BucketLevel.fromXml(_s.extractXmlChild(elem, 'BucketLevel')!),
      activityMetrics: _s
          .extractXmlChild(elem, 'ActivityMetrics')
          ?.let((e) => ActivityMetrics.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final bucketLevel = this.bucketLevel;
    final activityMetrics = this.activityMetrics;
    return {
      'BucketLevel': bucketLevel,
      if (activityMetrics != null) 'ActivityMetrics': activityMetrics,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final bucketLevel = this.bucketLevel;
    final activityMetrics = this.activityMetrics;
    final $children = <_s.XmlNode>[
      if (activityMetrics != null) activityMetrics.toXml('ActivityMetrics'),
      bucketLevel.toXml('BucketLevel'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// A container for the activity metrics.
class ActivityMetrics {
  /// A container for whether the activity metrics are enabled.
  final bool? isEnabled;

  ActivityMetrics({
    this.isEnabled,
  });

  factory ActivityMetrics.fromJson(Map<String, dynamic> json) {
    return ActivityMetrics(
      isEnabled: json['IsEnabled'] as bool?,
    );
  }

  factory ActivityMetrics.fromXml(_s.XmlElement elem) {
    return ActivityMetrics(
      isEnabled: _s.extractXmlBoolValue(elem, 'IsEnabled'),
    );
  }

  Map<String, dynamic> toJson() {
    final isEnabled = this.isEnabled;
    return {
      if (isEnabled != null) 'IsEnabled': isEnabled,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final isEnabled = this.isEnabled;
    final $children = <_s.XmlNode>[
      if (isEnabled != null) _s.encodeXmlBoolValue('IsEnabled', isEnabled),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// AWS Lambda function used to transform objects through an Object Lambda
/// Access Point.
class AwsLambdaTransformation {
  /// The Amazon Resource Name (ARN) of the AWS Lambda function.
  final String functionArn;

  /// Additional JSON that provides supplemental data to the Lambda function used
  /// to transform objects.
  final String? functionPayload;

  AwsLambdaTransformation({
    required this.functionArn,
    this.functionPayload,
  });

  factory AwsLambdaTransformation.fromJson(Map<String, dynamic> json) {
    return AwsLambdaTransformation(
      functionArn: json['FunctionArn'] as String,
      functionPayload: json['FunctionPayload'] as String?,
    );
  }

  factory AwsLambdaTransformation.fromXml(_s.XmlElement elem) {
    return AwsLambdaTransformation(
      functionArn: _s.extractXmlStringValue(elem, 'FunctionArn')!,
      functionPayload: _s.extractXmlStringValue(elem, 'FunctionPayload'),
    );
  }

  Map<String, dynamic> toJson() {
    final functionArn = this.functionArn;
    final functionPayload = this.functionPayload;
    return {
      'FunctionArn': functionArn,
      if (functionPayload != null) 'FunctionPayload': functionPayload,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final functionArn = this.functionArn;
    final functionPayload = this.functionPayload;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('FunctionArn', functionArn),
      if (functionPayload != null)
        _s.encodeXmlStringValue('FunctionPayload', functionPayload),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
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
    throw Exception('$this is not known in enum BucketCannedACL');
  }
}

/// A container for the bucket-level configuration.
class BucketLevel {
  /// A container for the bucket-level activity metrics for Amazon S3 Storage Lens
  final ActivityMetrics? activityMetrics;

  /// A container for the bucket-level prefix-level metrics for S3 Storage Lens
  final PrefixLevel? prefixLevel;

  BucketLevel({
    this.activityMetrics,
    this.prefixLevel,
  });

  factory BucketLevel.fromJson(Map<String, dynamic> json) {
    return BucketLevel(
      activityMetrics: json['ActivityMetrics'] != null
          ? ActivityMetrics.fromJson(
              json['ActivityMetrics'] as Map<String, dynamic>)
          : null,
      prefixLevel: json['PrefixLevel'] != null
          ? PrefixLevel.fromJson(json['PrefixLevel'] as Map<String, dynamic>)
          : null,
    );
  }

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

  Map<String, dynamic> toJson() {
    final activityMetrics = this.activityMetrics;
    final prefixLevel = this.prefixLevel;
    return {
      if (activityMetrics != null) 'ActivityMetrics': activityMetrics,
      if (prefixLevel != null) 'PrefixLevel': prefixLevel,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final activityMetrics = this.activityMetrics;
    final prefixLevel = this.prefixLevel;
    final $children = <_s.XmlNode>[
      if (activityMetrics != null) activityMetrics.toXml('ActivityMetrics'),
      if (prefixLevel != null) prefixLevel.toXml('PrefixLevel'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
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
    throw Exception('$this is not known in enum BucketLocationConstraint');
  }
}

class CreateAccessPointForObjectLambdaRequest {
  /// The AWS account ID for owner of the specified Object Lambda Access Point.
  final String accountId;

  /// Object Lambda Access Point configuration as a JSON document.
  final ObjectLambdaConfiguration configuration;

  /// The name you want to assign to this Object Lambda Access Point.
  final String name;

  CreateAccessPointForObjectLambdaRequest({
    required this.accountId,
    required this.configuration,
    required this.name,
  });

  factory CreateAccessPointForObjectLambdaRequest.fromJson(
      Map<String, dynamic> json) {
    return CreateAccessPointForObjectLambdaRequest(
      accountId: json['x-amz-account-id'] as String,
      configuration: ObjectLambdaConfiguration.fromJson(
          json['Configuration'] as Map<String, dynamic>),
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final configuration = this.configuration;
    final name = this.name;
    return {
      'Configuration': configuration,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final accountId = this.accountId;
    final configuration = this.configuration;
    final name = this.name;
    final $children = <_s.XmlNode>[
      configuration.toXml('Configuration'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

class CreateAccessPointForObjectLambdaResult {
  /// Specifies the ARN for the Object Lambda Access Point.
  final String? objectLambdaAccessPointArn;

  CreateAccessPointForObjectLambdaResult({
    this.objectLambdaAccessPointArn,
  });

  factory CreateAccessPointForObjectLambdaResult.fromJson(
      Map<String, dynamic> json) {
    return CreateAccessPointForObjectLambdaResult(
      objectLambdaAccessPointArn: json['ObjectLambdaAccessPointArn'] as String?,
    );
  }

  factory CreateAccessPointForObjectLambdaResult.fromXml(_s.XmlElement elem) {
    return CreateAccessPointForObjectLambdaResult(
      objectLambdaAccessPointArn:
          _s.extractXmlStringValue(elem, 'ObjectLambdaAccessPointArn'),
    );
  }

  Map<String, dynamic> toJson() {
    final objectLambdaAccessPointArn = this.objectLambdaAccessPointArn;
    return {
      if (objectLambdaAccessPointArn != null)
        'ObjectLambdaAccessPointArn': objectLambdaAccessPointArn,
    };
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

  /// The <code>PublicAccessBlock</code> configuration that you want to apply to
  /// the access point.
  final PublicAccessBlockConfiguration? publicAccessBlockConfiguration;

  /// If you include this field, Amazon S3 restricts access to this access point
  /// to requests from the specified virtual private cloud (VPC).
  /// <note>
  /// This is required for creating an access point for Amazon S3 on Outposts
  /// buckets.
  /// </note>
  final VpcConfiguration? vpcConfiguration;

  CreateAccessPointRequest({
    required this.accountId,
    required this.bucket,
    required this.name,
    this.publicAccessBlockConfiguration,
    this.vpcConfiguration,
  });

  factory CreateAccessPointRequest.fromJson(Map<String, dynamic> json) {
    return CreateAccessPointRequest(
      accountId: json['x-amz-account-id'] as String,
      bucket: json['Bucket'] as String,
      name: json['name'] as String,
      publicAccessBlockConfiguration: json['PublicAccessBlockConfiguration'] !=
              null
          ? PublicAccessBlockConfiguration.fromJson(
              json['PublicAccessBlockConfiguration'] as Map<String, dynamic>)
          : null,
      vpcConfiguration: json['VpcConfiguration'] != null
          ? VpcConfiguration.fromJson(
              json['VpcConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final bucket = this.bucket;
    final name = this.name;
    final publicAccessBlockConfiguration = this.publicAccessBlockConfiguration;
    final vpcConfiguration = this.vpcConfiguration;
    return {
      'Bucket': bucket,
      if (publicAccessBlockConfiguration != null)
        'PublicAccessBlockConfiguration': publicAccessBlockConfiguration,
      if (vpcConfiguration != null) 'VpcConfiguration': vpcConfiguration,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final accountId = this.accountId;
    final bucket = this.bucket;
    final name = this.name;
    final publicAccessBlockConfiguration = this.publicAccessBlockConfiguration;
    final vpcConfiguration = this.vpcConfiguration;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Bucket', bucket),
      if (vpcConfiguration != null) vpcConfiguration.toXml('VpcConfiguration'),
      if (publicAccessBlockConfiguration != null)
        publicAccessBlockConfiguration.toXml('PublicAccessBlockConfiguration'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

class CreateAccessPointResult {
  /// The ARN of the access point.
  /// <note>
  /// This is only supported by Amazon S3 on Outposts.
  /// </note>
  final String? accessPointArn;

  CreateAccessPointResult({
    this.accessPointArn,
  });

  factory CreateAccessPointResult.fromJson(Map<String, dynamic> json) {
    return CreateAccessPointResult(
      accessPointArn: json['AccessPointArn'] as String?,
    );
  }

  factory CreateAccessPointResult.fromXml(_s.XmlElement elem) {
    return CreateAccessPointResult(
      accessPointArn: _s.extractXmlStringValue(elem, 'AccessPointArn'),
    );
  }

  Map<String, dynamic> toJson() {
    final accessPointArn = this.accessPointArn;
    return {
      if (accessPointArn != null) 'AccessPointArn': accessPointArn,
    };
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
  final BucketLocationConstraint? locationConstraint;

  CreateBucketConfiguration({
    this.locationConstraint,
  });

  factory CreateBucketConfiguration.fromJson(Map<String, dynamic> json) {
    return CreateBucketConfiguration(
      locationConstraint:
          (json['LocationConstraint'] as String?)?.toBucketLocationConstraint(),
    );
  }

  Map<String, dynamic> toJson() {
    final locationConstraint = this.locationConstraint;
    return {
      if (locationConstraint != null)
        'LocationConstraint': locationConstraint.toValue(),
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final locationConstraint = this.locationConstraint;
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
      $children,
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
  final String? bucketArn;

  /// The location of the bucket.
  final String? location;

  CreateBucketResult({
    this.bucketArn,
    this.location,
  });

  factory CreateBucketResult.fromJson(Map<String, dynamic> json) {
    return CreateBucketResult(
      bucketArn: json['BucketArn'] as String?,
      location: json['Location'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketArn = this.bucketArn;
    final location = this.location;
    return {
      if (bucketArn != null) 'BucketArn': bucketArn,
    };
  }
}

class CreateJobRequest {
  /// The AWS account ID that creates the job.
  final String accountId;

  /// Configuration parameters for the manifest.
  final JobManifest manifest;

  /// The action that you want this job to perform on every object listed in the
  /// manifest. For more information about the available actions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/batch-ops-actions.html">Operations</a>
  /// in the <i>Amazon S3 User Guide</i>.
  final JobOperation operation;

  /// The numerical priority for this job. Higher numbers indicate higher
  /// priority.
  final int priority;

  /// Configuration parameters for the optional job-completion report.
  final JobReport report;

  /// The Amazon Resource Name (ARN) for the AWS Identity and Access Management
  /// (IAM) role that Batch Operations will use to run this job's action on every
  /// object in the manifest.
  final String roleArn;

  /// An idempotency token to ensure that you don't accidentally submit the same
  /// request twice. You can use any string up to the maximum length.
  final String? clientRequestToken;

  /// Indicates whether confirmation is required before Amazon S3 runs the job.
  /// Confirmation is only required for jobs created through the Amazon S3
  /// console.
  final bool? confirmationRequired;

  /// A description for this job. You can use any string within the permitted
  /// length. Descriptions don't need to be unique and can be used for multiple
  /// jobs.
  final String? description;

  /// A set of tags to associate with the S3 Batch Operations job. This is an
  /// optional parameter.
  final List<S3Tag>? tags;

  CreateJobRequest({
    required this.accountId,
    required this.manifest,
    required this.operation,
    required this.priority,
    required this.report,
    required this.roleArn,
    this.clientRequestToken,
    this.confirmationRequired,
    this.description,
    this.tags,
  });

  factory CreateJobRequest.fromJson(Map<String, dynamic> json) {
    return CreateJobRequest(
      accountId: json['x-amz-account-id'] as String,
      manifest: JobManifest.fromJson(json['Manifest'] as Map<String, dynamic>),
      operation:
          JobOperation.fromJson(json['Operation'] as Map<String, dynamic>),
      priority: json['Priority'] as int,
      report: JobReport.fromJson(json['Report'] as Map<String, dynamic>),
      roleArn: json['RoleArn'] as String,
      clientRequestToken: json['ClientRequestToken'] as String?,
      confirmationRequired: json['ConfirmationRequired'] as bool?,
      description: json['Description'] as String?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => S3Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final manifest = this.manifest;
    final operation = this.operation;
    final priority = this.priority;
    final report = this.report;
    final roleArn = this.roleArn;
    final clientRequestToken = this.clientRequestToken;
    final confirmationRequired = this.confirmationRequired;
    final description = this.description;
    final tags = this.tags;
    return {
      'Manifest': manifest,
      'Operation': operation,
      'Priority': priority,
      'Report': report,
      'RoleArn': roleArn,
      if (clientRequestToken != null) 'ClientRequestToken': clientRequestToken,
      if (confirmationRequired != null)
        'ConfirmationRequired': confirmationRequired,
      if (description != null) 'Description': description,
      if (tags != null) 'Tags': tags,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final accountId = this.accountId;
    final manifest = this.manifest;
    final operation = this.operation;
    final priority = this.priority;
    final report = this.report;
    final roleArn = this.roleArn;
    final clientRequestToken = this.clientRequestToken;
    final confirmationRequired = this.confirmationRequired;
    final description = this.description;
    final tags = this.tags;
    final $children = <_s.XmlNode>[
      if (confirmationRequired != null)
        _s.encodeXmlBoolValue('ConfirmationRequired', confirmationRequired),
      operation.toXml('Operation'),
      report.toXml('Report'),
      if (clientRequestToken != null)
        _s.encodeXmlStringValue('ClientRequestToken', clientRequestToken),
      manifest.toXml('Manifest'),
      if (description != null)
        _s.encodeXmlStringValue('Description', description),
      _s.encodeXmlIntValue('Priority', priority),
      _s.encodeXmlStringValue('RoleArn', roleArn),
      if (tags != null)
        _s.XmlElement(
            _s.XmlName('Tags'), [], tags.map((e) => e.toXml('member'))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

class CreateJobResult {
  /// The ID for this job. Amazon S3 generates this ID automatically and returns
  /// it after a successful <code>Create Job</code> request.
  final String? jobId;

  CreateJobResult({
    this.jobId,
  });

  factory CreateJobResult.fromJson(Map<String, dynamic> json) {
    return CreateJobResult(
      jobId: json['JobId'] as String?,
    );
  }

  factory CreateJobResult.fromXml(_s.XmlElement elem) {
    return CreateJobResult(
      jobId: _s.extractXmlStringValue(elem, 'JobId'),
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    return {
      if (jobId != null) 'JobId': jobId,
    };
  }
}

class DeleteJobTaggingResult {
  DeleteJobTaggingResult();

  factory DeleteJobTaggingResult.fromJson(Map<String, dynamic> _) {
    return DeleteJobTaggingResult();
  }

  factory DeleteJobTaggingResult.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeleteJobTaggingResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteStorageLensConfigurationTaggingResult {
  DeleteStorageLensConfigurationTaggingResult();

  factory DeleteStorageLensConfigurationTaggingResult.fromJson(
      Map<String, dynamic> _) {
    return DeleteStorageLensConfigurationTaggingResult();
  }

  factory DeleteStorageLensConfigurationTaggingResult.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeleteStorageLensConfigurationTaggingResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeJobResult {
  /// Contains the configuration parameters and status for the job specified in
  /// the <code>Describe Job</code> request.
  final JobDescriptor? job;

  DescribeJobResult({
    this.job,
  });

  factory DescribeJobResult.fromJson(Map<String, dynamic> json) {
    return DescribeJobResult(
      job: json['Job'] != null
          ? JobDescriptor.fromJson(json['Job'] as Map<String, dynamic>)
          : null,
    );
  }

  factory DescribeJobResult.fromXml(_s.XmlElement elem) {
    return DescribeJobResult(
      job:
          _s.extractXmlChild(elem, 'Job')?.let((e) => JobDescriptor.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final job = this.job;
    return {
      if (job != null) 'Job': job,
    };
  }
}

/// A container for what Amazon S3 Storage Lens will exclude.
class Exclude {
  /// A container for the S3 Storage Lens bucket excludes.
  final List<String>? buckets;

  /// A container for the S3 Storage Lens Region excludes.
  final List<String>? regions;

  Exclude({
    this.buckets,
    this.regions,
  });

  factory Exclude.fromJson(Map<String, dynamic> json) {
    return Exclude(
      buckets: (json['Buckets'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      regions: (json['Regions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

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

  Map<String, dynamic> toJson() {
    final buckets = this.buckets;
    final regions = this.regions;
    return {
      if (buckets != null) 'Buckets': buckets,
      if (regions != null) 'Regions': regions,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final buckets = this.buckets;
    final regions = this.regions;
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
      $children,
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
    throw Exception('$this is not known in enum ExpirationStatus');
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
    throw Exception('$this is not known in enum Format');
  }
}

class GetAccessPointConfigurationForObjectLambdaResult {
  /// Object Lambda Access Point configuration document.
  final ObjectLambdaConfiguration? configuration;

  GetAccessPointConfigurationForObjectLambdaResult({
    this.configuration,
  });

  factory GetAccessPointConfigurationForObjectLambdaResult.fromJson(
      Map<String, dynamic> json) {
    return GetAccessPointConfigurationForObjectLambdaResult(
      configuration: json['Configuration'] != null
          ? ObjectLambdaConfiguration.fromJson(
              json['Configuration'] as Map<String, dynamic>)
          : null,
    );
  }

  factory GetAccessPointConfigurationForObjectLambdaResult.fromXml(
      _s.XmlElement elem) {
    return GetAccessPointConfigurationForObjectLambdaResult(
      configuration: _s
          .extractXmlChild(elem, 'Configuration')
          ?.let((e) => ObjectLambdaConfiguration.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    return {
      if (configuration != null) 'Configuration': configuration,
    };
  }
}

class GetAccessPointForObjectLambdaResult {
  /// The date and time when the specified Object Lambda Access Point was created.
  final DateTime? creationDate;

  /// The name of the Object Lambda Access Point.
  final String? name;

  /// Configuration to block all public access. This setting is turned on and can
  /// not be edited.
  final PublicAccessBlockConfiguration? publicAccessBlockConfiguration;

  GetAccessPointForObjectLambdaResult({
    this.creationDate,
    this.name,
    this.publicAccessBlockConfiguration,
  });

  factory GetAccessPointForObjectLambdaResult.fromJson(
      Map<String, dynamic> json) {
    return GetAccessPointForObjectLambdaResult(
      creationDate: timeStampFromJson(json['CreationDate']),
      name: json['Name'] as String?,
      publicAccessBlockConfiguration: json['PublicAccessBlockConfiguration'] !=
              null
          ? PublicAccessBlockConfiguration.fromJson(
              json['PublicAccessBlockConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  factory GetAccessPointForObjectLambdaResult.fromXml(_s.XmlElement elem) {
    return GetAccessPointForObjectLambdaResult(
      creationDate: _s.extractXmlDateTimeValue(elem, 'CreationDate'),
      name: _s.extractXmlStringValue(elem, 'Name'),
      publicAccessBlockConfiguration: _s
          .extractXmlChild(elem, 'PublicAccessBlockConfiguration')
          ?.let((e) => PublicAccessBlockConfiguration.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final creationDate = this.creationDate;
    final name = this.name;
    final publicAccessBlockConfiguration = this.publicAccessBlockConfiguration;
    return {
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (name != null) 'Name': name,
      if (publicAccessBlockConfiguration != null)
        'PublicAccessBlockConfiguration': publicAccessBlockConfiguration,
    };
  }
}

class GetAccessPointPolicyForObjectLambdaResult {
  /// Object Lambda Access Point resource policy document.
  final String? policy;

  GetAccessPointPolicyForObjectLambdaResult({
    this.policy,
  });

  factory GetAccessPointPolicyForObjectLambdaResult.fromJson(
      Map<String, dynamic> json) {
    return GetAccessPointPolicyForObjectLambdaResult(
      policy: json['Policy'] as String?,
    );
  }

  factory GetAccessPointPolicyForObjectLambdaResult.fromXml(
      _s.XmlElement elem) {
    return GetAccessPointPolicyForObjectLambdaResult(
      policy: _s.extractXmlStringValue(elem, 'Policy'),
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    return {
      if (policy != null) 'Policy': policy,
    };
  }
}

class GetAccessPointPolicyResult {
  /// The access point policy associated with the specified access point.
  final String? policy;

  GetAccessPointPolicyResult({
    this.policy,
  });

  factory GetAccessPointPolicyResult.fromJson(Map<String, dynamic> json) {
    return GetAccessPointPolicyResult(
      policy: json['Policy'] as String?,
    );
  }

  factory GetAccessPointPolicyResult.fromXml(_s.XmlElement elem) {
    return GetAccessPointPolicyResult(
      policy: _s.extractXmlStringValue(elem, 'Policy'),
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    return {
      if (policy != null) 'Policy': policy,
    };
  }
}

class GetAccessPointPolicyStatusForObjectLambdaResult {
  final PolicyStatus? policyStatus;

  GetAccessPointPolicyStatusForObjectLambdaResult({
    this.policyStatus,
  });

  factory GetAccessPointPolicyStatusForObjectLambdaResult.fromJson(
      Map<String, dynamic> json) {
    return GetAccessPointPolicyStatusForObjectLambdaResult(
      policyStatus: json['PolicyStatus'] != null
          ? PolicyStatus.fromJson(json['PolicyStatus'] as Map<String, dynamic>)
          : null,
    );
  }

  factory GetAccessPointPolicyStatusForObjectLambdaResult.fromXml(
      _s.XmlElement elem) {
    return GetAccessPointPolicyStatusForObjectLambdaResult(
      policyStatus: _s
          .extractXmlChild(elem, 'PolicyStatus')
          ?.let((e) => PolicyStatus.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final policyStatus = this.policyStatus;
    return {
      if (policyStatus != null) 'PolicyStatus': policyStatus,
    };
  }
}

class GetAccessPointPolicyStatusResult {
  /// Indicates the current policy status of the specified access point.
  final PolicyStatus? policyStatus;

  GetAccessPointPolicyStatusResult({
    this.policyStatus,
  });

  factory GetAccessPointPolicyStatusResult.fromJson(Map<String, dynamic> json) {
    return GetAccessPointPolicyStatusResult(
      policyStatus: json['PolicyStatus'] != null
          ? PolicyStatus.fromJson(json['PolicyStatus'] as Map<String, dynamic>)
          : null,
    );
  }

  factory GetAccessPointPolicyStatusResult.fromXml(_s.XmlElement elem) {
    return GetAccessPointPolicyStatusResult(
      policyStatus: _s
          .extractXmlChild(elem, 'PolicyStatus')
          ?.let((e) => PolicyStatus.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final policyStatus = this.policyStatus;
    return {
      if (policyStatus != null) 'PolicyStatus': policyStatus,
    };
  }
}

class GetAccessPointResult {
  /// The name of the bucket associated with the specified access point.
  final String? bucket;

  /// The date and time when the specified access point was created.
  final DateTime? creationDate;

  /// The name of the specified access point.
  final String? name;

  /// Indicates whether this access point allows access from the public internet.
  /// If <code>VpcConfiguration</code> is specified for this access point, then
  /// <code>NetworkOrigin</code> is <code>VPC</code>, and the access point doesn't
  /// allow access from the public internet. Otherwise, <code>NetworkOrigin</code>
  /// is <code>Internet</code>, and the access point allows access from the public
  /// internet, subject to the access point and bucket access policies.
  ///
  /// This will always be true for an Amazon S3 on Outposts access point
  final NetworkOrigin? networkOrigin;
  final PublicAccessBlockConfiguration? publicAccessBlockConfiguration;

  /// Contains the virtual private cloud (VPC) configuration for the specified
  /// access point.
  /// <note>
  /// This element is empty if this access point is an Amazon S3 on Outposts
  /// access point that is used by other AWS services.
  /// </note>
  final VpcConfiguration? vpcConfiguration;

  GetAccessPointResult({
    this.bucket,
    this.creationDate,
    this.name,
    this.networkOrigin,
    this.publicAccessBlockConfiguration,
    this.vpcConfiguration,
  });

  factory GetAccessPointResult.fromJson(Map<String, dynamic> json) {
    return GetAccessPointResult(
      bucket: json['Bucket'] as String?,
      creationDate: timeStampFromJson(json['CreationDate']),
      name: json['Name'] as String?,
      networkOrigin: (json['NetworkOrigin'] as String?)?.toNetworkOrigin(),
      publicAccessBlockConfiguration: json['PublicAccessBlockConfiguration'] !=
              null
          ? PublicAccessBlockConfiguration.fromJson(
              json['PublicAccessBlockConfiguration'] as Map<String, dynamic>)
          : null,
      vpcConfiguration: json['VpcConfiguration'] != null
          ? VpcConfiguration.fromJson(
              json['VpcConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

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

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final creationDate = this.creationDate;
    final name = this.name;
    final networkOrigin = this.networkOrigin;
    final publicAccessBlockConfiguration = this.publicAccessBlockConfiguration;
    final vpcConfiguration = this.vpcConfiguration;
    return {
      if (bucket != null) 'Bucket': bucket,
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (name != null) 'Name': name,
      if (networkOrigin != null) 'NetworkOrigin': networkOrigin.toValue(),
      if (publicAccessBlockConfiguration != null)
        'PublicAccessBlockConfiguration': publicAccessBlockConfiguration,
      if (vpcConfiguration != null) 'VpcConfiguration': vpcConfiguration,
    };
  }
}

class GetBucketLifecycleConfigurationResult {
  /// Container for the lifecycle rule of the Outposts bucket.
  final List<LifecycleRule>? rules;

  GetBucketLifecycleConfigurationResult({
    this.rules,
  });

  factory GetBucketLifecycleConfigurationResult.fromJson(
      Map<String, dynamic> json) {
    return GetBucketLifecycleConfigurationResult(
      rules: (json['Rules'] as List?)
          ?.whereNotNull()
          .map((e) => LifecycleRule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  factory GetBucketLifecycleConfigurationResult.fromXml(_s.XmlElement elem) {
    return GetBucketLifecycleConfigurationResult(
      rules: _s.extractXmlChild(elem, 'Rules')?.let((elem) => elem
          .findElements('Rule')
          .map((c) => LifecycleRule.fromXml(c))
          .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final rules = this.rules;
    return {
      if (rules != null) 'Rules': rules,
    };
  }
}

class GetBucketPolicyResult {
  /// The policy of the Outposts bucket.
  final String? policy;

  GetBucketPolicyResult({
    this.policy,
  });

  factory GetBucketPolicyResult.fromJson(Map<String, dynamic> json) {
    return GetBucketPolicyResult(
      policy: json['Policy'] as String?,
    );
  }

  factory GetBucketPolicyResult.fromXml(_s.XmlElement elem) {
    return GetBucketPolicyResult(
      policy: _s.extractXmlStringValue(elem, 'Policy'),
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    return {
      if (policy != null) 'Policy': policy,
    };
  }
}

class GetBucketResult {
  /// The Outposts bucket requested.
  final String? bucket;

  /// The creation date of the Outposts bucket.
  final DateTime? creationDate;

  /// <p/>
  final bool? publicAccessBlockEnabled;

  GetBucketResult({
    this.bucket,
    this.creationDate,
    this.publicAccessBlockEnabled,
  });

  factory GetBucketResult.fromJson(Map<String, dynamic> json) {
    return GetBucketResult(
      bucket: json['Bucket'] as String?,
      creationDate: timeStampFromJson(json['CreationDate']),
      publicAccessBlockEnabled: json['PublicAccessBlockEnabled'] as bool?,
    );
  }

  factory GetBucketResult.fromXml(_s.XmlElement elem) {
    return GetBucketResult(
      bucket: _s.extractXmlStringValue(elem, 'Bucket'),
      creationDate: _s.extractXmlDateTimeValue(elem, 'CreationDate'),
      publicAccessBlockEnabled:
          _s.extractXmlBoolValue(elem, 'PublicAccessBlockEnabled'),
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final creationDate = this.creationDate;
    final publicAccessBlockEnabled = this.publicAccessBlockEnabled;
    return {
      if (bucket != null) 'Bucket': bucket,
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (publicAccessBlockEnabled != null)
        'PublicAccessBlockEnabled': publicAccessBlockEnabled,
    };
  }
}

class GetBucketTaggingResult {
  /// The tags set of the Outposts bucket.
  final List<S3Tag> tagSet;

  GetBucketTaggingResult({
    required this.tagSet,
  });

  factory GetBucketTaggingResult.fromJson(Map<String, dynamic> json) {
    return GetBucketTaggingResult(
      tagSet: (json['TagSet'] as List)
          .whereNotNull()
          .map((e) => S3Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  factory GetBucketTaggingResult.fromXml(_s.XmlElement elem) {
    return GetBucketTaggingResult(
      tagSet: _s
          .extractXmlChild(elem, 'TagSet')!
          .findElements('member')
          .map((c) => S3Tag.fromXml(c))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tagSet = this.tagSet;
    return {
      'TagSet': tagSet,
    };
  }
}

class GetJobTaggingResult {
  /// The set of tags associated with the S3 Batch Operations job.
  final List<S3Tag>? tags;

  GetJobTaggingResult({
    this.tags,
  });

  factory GetJobTaggingResult.fromJson(Map<String, dynamic> json) {
    return GetJobTaggingResult(
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => S3Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  factory GetJobTaggingResult.fromXml(_s.XmlElement elem) {
    return GetJobTaggingResult(
      tags: _s.extractXmlChild(elem, 'Tags')?.let((elem) =>
          elem.findElements('member').map((c) => S3Tag.fromXml(c)).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

class GetPublicAccessBlockOutput {
  /// The <code>PublicAccessBlock</code> configuration currently in effect for
  /// this AWS account.
  final PublicAccessBlockConfiguration? publicAccessBlockConfiguration;

  GetPublicAccessBlockOutput({
    this.publicAccessBlockConfiguration,
  });

  factory GetPublicAccessBlockOutput.fromJson(Map<String, dynamic> json) {
    return GetPublicAccessBlockOutput(
      publicAccessBlockConfiguration: json['PublicAccessBlockConfiguration'] !=
              null
          ? PublicAccessBlockConfiguration.fromJson(
              json['PublicAccessBlockConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final publicAccessBlockConfiguration = this.publicAccessBlockConfiguration;
    return {
      if (publicAccessBlockConfiguration != null)
        'PublicAccessBlockConfiguration': publicAccessBlockConfiguration,
    };
  }
}

class GetStorageLensConfigurationResult {
  /// The S3 Storage Lens configuration requested.
  final StorageLensConfiguration? storageLensConfiguration;

  GetStorageLensConfigurationResult({
    this.storageLensConfiguration,
  });

  factory GetStorageLensConfigurationResult.fromJson(
      Map<String, dynamic> json) {
    return GetStorageLensConfigurationResult(
      storageLensConfiguration: json['StorageLensConfiguration'] != null
          ? StorageLensConfiguration.fromJson(
              json['StorageLensConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final storageLensConfiguration = this.storageLensConfiguration;
    return {
      if (storageLensConfiguration != null)
        'StorageLensConfiguration': storageLensConfiguration,
    };
  }
}

class GetStorageLensConfigurationTaggingResult {
  /// The tags of S3 Storage Lens configuration requested.
  final List<StorageLensTag>? tags;

  GetStorageLensConfigurationTaggingResult({
    this.tags,
  });

  factory GetStorageLensConfigurationTaggingResult.fromJson(
      Map<String, dynamic> json) {
    return GetStorageLensConfigurationTaggingResult(
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => StorageLensTag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  factory GetStorageLensConfigurationTaggingResult.fromXml(_s.XmlElement elem) {
    return GetStorageLensConfigurationTaggingResult(
      tags: _s.extractXmlChild(elem, 'Tags')?.let((elem) => elem
          .findElements('Tag')
          .map((c) => StorageLensTag.fromXml(c))
          .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

/// A container for what Amazon S3 Storage Lens configuration includes.
class Include {
  /// A container for the S3 Storage Lens bucket includes.
  final List<String>? buckets;

  /// A container for the S3 Storage Lens Region includes.
  final List<String>? regions;

  Include({
    this.buckets,
    this.regions,
  });

  factory Include.fromJson(Map<String, dynamic> json) {
    return Include(
      buckets: (json['Buckets'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      regions: (json['Regions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

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

  Map<String, dynamic> toJson() {
    final buckets = this.buckets;
    final regions = this.regions;
    return {
      if (buckets != null) 'Buckets': buckets,
      if (regions != null) 'Regions': regions,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final buckets = this.buckets;
    final regions = this.regions;
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
      $children,
    );
  }
}

/// A container element for the job configuration and status information
/// returned by a <code>Describe Job</code> request.
class JobDescriptor {
  /// Indicates whether confirmation is required before Amazon S3 begins running
  /// the specified job. Confirmation is required only for jobs created through
  /// the Amazon S3 console.
  final bool? confirmationRequired;

  /// A timestamp indicating when this job was created.
  final DateTime? creationTime;

  /// The description for this job, if one was provided in this job's <code>Create
  /// Job</code> request.
  final String? description;

  /// If the specified job failed, this field contains information describing the
  /// failure.
  final List<JobFailure>? failureReasons;

  /// The Amazon Resource Name (ARN) for this job.
  final String? jobArn;

  /// The ID for the specified job.
  final String? jobId;

  /// The configuration information for the specified job's manifest object.
  final JobManifest? manifest;

  /// The operation that the specified job is configured to run on the objects
  /// listed in the manifest.
  final JobOperation? operation;

  /// The priority of the specified job.
  final int? priority;

  /// Describes the total number of tasks that the specified job has run, the
  /// number of tasks that succeeded, and the number of tasks that failed.
  final JobProgressSummary? progressSummary;

  /// Contains the configuration information for the job-completion report if you
  /// requested one in the <code>Create Job</code> request.
  final JobReport? report;

  /// The Amazon Resource Name (ARN) for the AWS Identity and Access Management
  /// (IAM) role assigned to run the tasks for this job.
  final String? roleArn;

  /// The current status of the specified job.
  final JobStatus? status;

  /// The reason for updating the job.
  final String? statusUpdateReason;

  /// The reason why the specified job was suspended. A job is only suspended if
  /// you create it through the Amazon S3 console. When you create the job, it
  /// enters the <code>Suspended</code> state to await confirmation before
  /// running. After you confirm the job, it automatically exits the
  /// <code>Suspended</code> state.
  final String? suspendedCause;

  /// The timestamp when this job was suspended, if it has been suspended.
  final DateTime? suspendedDate;

  /// A timestamp indicating when this job terminated. A job's termination date is
  /// the date and time when it succeeded, failed, or was canceled.
  final DateTime? terminationDate;

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

  factory JobDescriptor.fromJson(Map<String, dynamic> json) {
    return JobDescriptor(
      confirmationRequired: json['ConfirmationRequired'] as bool?,
      creationTime: timeStampFromJson(json['CreationTime']),
      description: json['Description'] as String?,
      failureReasons: (json['FailureReasons'] as List?)
          ?.whereNotNull()
          .map((e) => JobFailure.fromJson(e as Map<String, dynamic>))
          .toList(),
      jobArn: json['JobArn'] as String?,
      jobId: json['JobId'] as String?,
      manifest: json['Manifest'] != null
          ? JobManifest.fromJson(json['Manifest'] as Map<String, dynamic>)
          : null,
      operation: json['Operation'] != null
          ? JobOperation.fromJson(json['Operation'] as Map<String, dynamic>)
          : null,
      priority: json['Priority'] as int?,
      progressSummary: json['ProgressSummary'] != null
          ? JobProgressSummary.fromJson(
              json['ProgressSummary'] as Map<String, dynamic>)
          : null,
      report: json['Report'] != null
          ? JobReport.fromJson(json['Report'] as Map<String, dynamic>)
          : null,
      roleArn: json['RoleArn'] as String?,
      status: (json['Status'] as String?)?.toJobStatus(),
      statusUpdateReason: json['StatusUpdateReason'] as String?,
      suspendedCause: json['SuspendedCause'] as String?,
      suspendedDate: timeStampFromJson(json['SuspendedDate']),
      terminationDate: timeStampFromJson(json['TerminationDate']),
    );
  }

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

  Map<String, dynamic> toJson() {
    final confirmationRequired = this.confirmationRequired;
    final creationTime = this.creationTime;
    final description = this.description;
    final failureReasons = this.failureReasons;
    final jobArn = this.jobArn;
    final jobId = this.jobId;
    final manifest = this.manifest;
    final operation = this.operation;
    final priority = this.priority;
    final progressSummary = this.progressSummary;
    final report = this.report;
    final roleArn = this.roleArn;
    final status = this.status;
    final statusUpdateReason = this.statusUpdateReason;
    final suspendedCause = this.suspendedCause;
    final suspendedDate = this.suspendedDate;
    final terminationDate = this.terminationDate;
    return {
      if (confirmationRequired != null)
        'ConfirmationRequired': confirmationRequired,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (description != null) 'Description': description,
      if (failureReasons != null) 'FailureReasons': failureReasons,
      if (jobArn != null) 'JobArn': jobArn,
      if (jobId != null) 'JobId': jobId,
      if (manifest != null) 'Manifest': manifest,
      if (operation != null) 'Operation': operation,
      if (priority != null) 'Priority': priority,
      if (progressSummary != null) 'ProgressSummary': progressSummary,
      if (report != null) 'Report': report,
      if (roleArn != null) 'RoleArn': roleArn,
      if (status != null) 'Status': status.toValue(),
      if (statusUpdateReason != null) 'StatusUpdateReason': statusUpdateReason,
      if (suspendedCause != null) 'SuspendedCause': suspendedCause,
      if (suspendedDate != null)
        'SuspendedDate': unixTimestampToJson(suspendedDate),
      if (terminationDate != null)
        'TerminationDate': unixTimestampToJson(terminationDate),
    };
  }
}

/// If this job failed, this element indicates why the job failed.
class JobFailure {
  /// The failure code, if any, for the specified job.
  final String? failureCode;

  /// The failure reason, if any, for the specified job.
  final String? failureReason;

  JobFailure({
    this.failureCode,
    this.failureReason,
  });

  factory JobFailure.fromJson(Map<String, dynamic> json) {
    return JobFailure(
      failureCode: json['FailureCode'] as String?,
      failureReason: json['FailureReason'] as String?,
    );
  }

  factory JobFailure.fromXml(_s.XmlElement elem) {
    return JobFailure(
      failureCode: _s.extractXmlStringValue(elem, 'FailureCode'),
      failureReason: _s.extractXmlStringValue(elem, 'FailureReason'),
    );
  }

  Map<String, dynamic> toJson() {
    final failureCode = this.failureCode;
    final failureReason = this.failureReason;
    return {
      if (failureCode != null) 'FailureCode': failureCode,
      if (failureReason != null) 'FailureReason': failureReason,
    };
  }
}

/// Contains the configuration and status information for a single job retrieved
/// as part of a job list.
class JobListDescriptor {
  /// A timestamp indicating when the specified job was created.
  final DateTime? creationTime;

  /// The user-specified description that was included in the specified job's
  /// <code>Create Job</code> request.
  final String? description;

  /// The ID for the specified job.
  final String? jobId;

  /// The operation that the specified job is configured to run on every object
  /// listed in the manifest.
  final OperationName? operation;

  /// The current priority for the specified job.
  final int? priority;

  /// Describes the total number of tasks that the specified job has run, the
  /// number of tasks that succeeded, and the number of tasks that failed.
  final JobProgressSummary? progressSummary;

  /// The specified job's current status.
  final JobStatus? status;

  /// A timestamp indicating when the specified job terminated. A job's
  /// termination date is the date and time when it succeeded, failed, or was
  /// canceled.
  final DateTime? terminationDate;

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

  factory JobListDescriptor.fromJson(Map<String, dynamic> json) {
    return JobListDescriptor(
      creationTime: timeStampFromJson(json['CreationTime']),
      description: json['Description'] as String?,
      jobId: json['JobId'] as String?,
      operation: (json['Operation'] as String?)?.toOperationName(),
      priority: json['Priority'] as int?,
      progressSummary: json['ProgressSummary'] != null
          ? JobProgressSummary.fromJson(
              json['ProgressSummary'] as Map<String, dynamic>)
          : null,
      status: (json['Status'] as String?)?.toJobStatus(),
      terminationDate: timeStampFromJson(json['TerminationDate']),
    );
  }

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

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final description = this.description;
    final jobId = this.jobId;
    final operation = this.operation;
    final priority = this.priority;
    final progressSummary = this.progressSummary;
    final status = this.status;
    final terminationDate = this.terminationDate;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (description != null) 'Description': description,
      if (jobId != null) 'JobId': jobId,
      if (operation != null) 'Operation': operation.toValue(),
      if (priority != null) 'Priority': priority,
      if (progressSummary != null) 'ProgressSummary': progressSummary,
      if (status != null) 'Status': status.toValue(),
      if (terminationDate != null)
        'TerminationDate': unixTimestampToJson(terminationDate),
    };
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
    required this.location,
    required this.spec,
  });

  factory JobManifest.fromJson(Map<String, dynamic> json) {
    return JobManifest(
      location: JobManifestLocation.fromJson(
          json['Location'] as Map<String, dynamic>),
      spec: JobManifestSpec.fromJson(json['Spec'] as Map<String, dynamic>),
    );
  }

  factory JobManifest.fromXml(_s.XmlElement elem) {
    return JobManifest(
      location:
          JobManifestLocation.fromXml(_s.extractXmlChild(elem, 'Location')!),
      spec: JobManifestSpec.fromXml(_s.extractXmlChild(elem, 'Spec')!),
    );
  }

  Map<String, dynamic> toJson() {
    final location = this.location;
    final spec = this.spec;
    return {
      'Location': location,
      'Spec': spec,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final location = this.location;
    final spec = this.spec;
    final $children = <_s.XmlNode>[
      spec.toXml('Spec'),
      location.toXml('Location'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
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
    throw Exception('$this is not known in enum JobManifestFieldName');
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
    throw Exception('$this is not known in enum JobManifestFormat');
  }
}

/// Contains the information required to locate a manifest object.
class JobManifestLocation {
  /// The ETag for the specified manifest object.
  final String eTag;

  /// The Amazon Resource Name (ARN) for a manifest object.
  /// <important>
  /// Replacement must be made for object keys containing special characters (such
  /// as carriage returns) when using XML requests. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-keys.html#object-key-xml-related-constraints">
  /// XML related object key constraints</a>.
  /// </important>
  final String objectArn;

  /// The optional version ID to identify a specific version of the manifest
  /// object.
  final String? objectVersionId;

  JobManifestLocation({
    required this.eTag,
    required this.objectArn,
    this.objectVersionId,
  });

  factory JobManifestLocation.fromJson(Map<String, dynamic> json) {
    return JobManifestLocation(
      eTag: json['ETag'] as String,
      objectArn: json['ObjectArn'] as String,
      objectVersionId: json['ObjectVersionId'] as String?,
    );
  }

  factory JobManifestLocation.fromXml(_s.XmlElement elem) {
    return JobManifestLocation(
      eTag: _s.extractXmlStringValue(elem, 'ETag')!,
      objectArn: _s.extractXmlStringValue(elem, 'ObjectArn')!,
      objectVersionId: _s.extractXmlStringValue(elem, 'ObjectVersionId'),
    );
  }

  Map<String, dynamic> toJson() {
    final eTag = this.eTag;
    final objectArn = this.objectArn;
    final objectVersionId = this.objectVersionId;
    return {
      'ETag': eTag,
      'ObjectArn': objectArn,
      if (objectVersionId != null) 'ObjectVersionId': objectVersionId,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final eTag = this.eTag;
    final objectArn = this.objectArn;
    final objectVersionId = this.objectVersionId;
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
      $children,
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
  final List<JobManifestFieldName>? fields;

  JobManifestSpec({
    required this.format,
    this.fields,
  });

  factory JobManifestSpec.fromJson(Map<String, dynamic> json) {
    return JobManifestSpec(
      format: (json['Format'] as String).toJobManifestFormat(),
      fields: (json['Fields'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toJobManifestFieldName())
          .toList(),
    );
  }

  factory JobManifestSpec.fromXml(_s.XmlElement elem) {
    return JobManifestSpec(
      format: _s.extractXmlStringValue(elem, 'Format')!.toJobManifestFormat(),
      fields: _s.extractXmlChild(elem, 'Fields')?.let((elem) => _s
          .extractXmlStringListValues(elem, 'member')
          .map((s) => s.toJobManifestFieldName())
          .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final format = this.format;
    final fields = this.fields;
    return {
      'Format': format.toValue(),
      if (fields != null) 'Fields': fields.map((e) => e.toValue()).toList(),
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final format = this.format;
    final fields = this.fields;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Format', format.toValue()),
      if (fields != null)
        _s.XmlElement(_s.XmlName('Fields'), [],
            fields.map((e) => _s.encodeXmlStringValue('member', e.toValue()))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// The operation that you want this job to perform on every object listed in
/// the manifest. For more information about the available operations, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/batch-ops-operations.html">Operations</a>
/// in the <i>Amazon S3 User Guide</i>.
class JobOperation {
  /// Directs the specified job to invoke an AWS Lambda function on every object
  /// in the manifest.
  final LambdaInvokeOperation? lambdaInvoke;

  /// Directs the specified job to execute a DELETE Object tagging call on every
  /// object in the manifest.
  final S3DeleteObjectTaggingOperation? s3DeleteObjectTagging;

  /// Directs the specified job to initiate restore requests for every archived
  /// object in the manifest.
  final S3InitiateRestoreObjectOperation? s3InitiateRestoreObject;

  /// Directs the specified job to run a PUT Object acl call on every object in
  /// the manifest.
  final S3SetObjectAclOperation? s3PutObjectAcl;

  /// Directs the specified job to run a PUT Copy object call on every object in
  /// the manifest.
  final S3CopyObjectOperation? s3PutObjectCopy;
  final S3SetObjectLegalHoldOperation? s3PutObjectLegalHold;
  final S3SetObjectRetentionOperation? s3PutObjectRetention;

  /// Directs the specified job to run a PUT Object tagging call on every object
  /// in the manifest.
  final S3SetObjectTaggingOperation? s3PutObjectTagging;

  JobOperation({
    this.lambdaInvoke,
    this.s3DeleteObjectTagging,
    this.s3InitiateRestoreObject,
    this.s3PutObjectAcl,
    this.s3PutObjectCopy,
    this.s3PutObjectLegalHold,
    this.s3PutObjectRetention,
    this.s3PutObjectTagging,
  });

  factory JobOperation.fromJson(Map<String, dynamic> json) {
    return JobOperation(
      lambdaInvoke: json['LambdaInvoke'] != null
          ? LambdaInvokeOperation.fromJson(
              json['LambdaInvoke'] as Map<String, dynamic>)
          : null,
      s3DeleteObjectTagging: json['S3DeleteObjectTagging'] != null
          ? S3DeleteObjectTaggingOperation.fromJson(
              json['S3DeleteObjectTagging'] as Map<String, dynamic>)
          : null,
      s3InitiateRestoreObject: json['S3InitiateRestoreObject'] != null
          ? S3InitiateRestoreObjectOperation.fromJson(
              json['S3InitiateRestoreObject'] as Map<String, dynamic>)
          : null,
      s3PutObjectAcl: json['S3PutObjectAcl'] != null
          ? S3SetObjectAclOperation.fromJson(
              json['S3PutObjectAcl'] as Map<String, dynamic>)
          : null,
      s3PutObjectCopy: json['S3PutObjectCopy'] != null
          ? S3CopyObjectOperation.fromJson(
              json['S3PutObjectCopy'] as Map<String, dynamic>)
          : null,
      s3PutObjectLegalHold: json['S3PutObjectLegalHold'] != null
          ? S3SetObjectLegalHoldOperation.fromJson(
              json['S3PutObjectLegalHold'] as Map<String, dynamic>)
          : null,
      s3PutObjectRetention: json['S3PutObjectRetention'] != null
          ? S3SetObjectRetentionOperation.fromJson(
              json['S3PutObjectRetention'] as Map<String, dynamic>)
          : null,
      s3PutObjectTagging: json['S3PutObjectTagging'] != null
          ? S3SetObjectTaggingOperation.fromJson(
              json['S3PutObjectTagging'] as Map<String, dynamic>)
          : null,
    );
  }

  factory JobOperation.fromXml(_s.XmlElement elem) {
    return JobOperation(
      lambdaInvoke: _s
          .extractXmlChild(elem, 'LambdaInvoke')
          ?.let((e) => LambdaInvokeOperation.fromXml(e)),
      s3DeleteObjectTagging: _s
          .extractXmlChild(elem, 'S3DeleteObjectTagging')
          ?.let((e) => S3DeleteObjectTaggingOperation.fromXml(e)),
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

  Map<String, dynamic> toJson() {
    final lambdaInvoke = this.lambdaInvoke;
    final s3DeleteObjectTagging = this.s3DeleteObjectTagging;
    final s3InitiateRestoreObject = this.s3InitiateRestoreObject;
    final s3PutObjectAcl = this.s3PutObjectAcl;
    final s3PutObjectCopy = this.s3PutObjectCopy;
    final s3PutObjectLegalHold = this.s3PutObjectLegalHold;
    final s3PutObjectRetention = this.s3PutObjectRetention;
    final s3PutObjectTagging = this.s3PutObjectTagging;
    return {
      if (lambdaInvoke != null) 'LambdaInvoke': lambdaInvoke,
      if (s3DeleteObjectTagging != null)
        'S3DeleteObjectTagging': s3DeleteObjectTagging,
      if (s3InitiateRestoreObject != null)
        'S3InitiateRestoreObject': s3InitiateRestoreObject,
      if (s3PutObjectAcl != null) 'S3PutObjectAcl': s3PutObjectAcl,
      if (s3PutObjectCopy != null) 'S3PutObjectCopy': s3PutObjectCopy,
      if (s3PutObjectLegalHold != null)
        'S3PutObjectLegalHold': s3PutObjectLegalHold,
      if (s3PutObjectRetention != null)
        'S3PutObjectRetention': s3PutObjectRetention,
      if (s3PutObjectTagging != null) 'S3PutObjectTagging': s3PutObjectTagging,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final lambdaInvoke = this.lambdaInvoke;
    final s3DeleteObjectTagging = this.s3DeleteObjectTagging;
    final s3InitiateRestoreObject = this.s3InitiateRestoreObject;
    final s3PutObjectAcl = this.s3PutObjectAcl;
    final s3PutObjectCopy = this.s3PutObjectCopy;
    final s3PutObjectLegalHold = this.s3PutObjectLegalHold;
    final s3PutObjectRetention = this.s3PutObjectRetention;
    final s3PutObjectTagging = this.s3PutObjectTagging;
    final $children = <_s.XmlNode>[
      if (lambdaInvoke != null) lambdaInvoke.toXml('LambdaInvoke'),
      if (s3PutObjectCopy != null) s3PutObjectCopy.toXml('S3PutObjectCopy'),
      if (s3PutObjectAcl != null) s3PutObjectAcl.toXml('S3PutObjectAcl'),
      if (s3PutObjectTagging != null)
        s3PutObjectTagging.toXml('S3PutObjectTagging'),
      if (s3DeleteObjectTagging != null)
        s3DeleteObjectTagging.toXml('S3DeleteObjectTagging'),
      if (s3InitiateRestoreObject != null)
        s3InitiateRestoreObject.toXml('S3InitiateRestoreObject'),
      if (s3PutObjectLegalHold != null)
        s3PutObjectLegalHold.toXml('S3PutObjectLegalHold'),
      if (s3PutObjectRetention != null)
        s3PutObjectRetention.toXml('S3PutObjectRetention'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// Describes the total number of tasks that the specified job has started, the
/// number of tasks that succeeded, and the number of tasks that failed.
class JobProgressSummary {
  /// <p/>
  final int? numberOfTasksFailed;

  /// <p/>
  final int? numberOfTasksSucceeded;

  /// <p/>
  final int? totalNumberOfTasks;

  JobProgressSummary({
    this.numberOfTasksFailed,
    this.numberOfTasksSucceeded,
    this.totalNumberOfTasks,
  });

  factory JobProgressSummary.fromJson(Map<String, dynamic> json) {
    return JobProgressSummary(
      numberOfTasksFailed: json['NumberOfTasksFailed'] as int?,
      numberOfTasksSucceeded: json['NumberOfTasksSucceeded'] as int?,
      totalNumberOfTasks: json['TotalNumberOfTasks'] as int?,
    );
  }

  factory JobProgressSummary.fromXml(_s.XmlElement elem) {
    return JobProgressSummary(
      numberOfTasksFailed: _s.extractXmlIntValue(elem, 'NumberOfTasksFailed'),
      numberOfTasksSucceeded:
          _s.extractXmlIntValue(elem, 'NumberOfTasksSucceeded'),
      totalNumberOfTasks: _s.extractXmlIntValue(elem, 'TotalNumberOfTasks'),
    );
  }

  Map<String, dynamic> toJson() {
    final numberOfTasksFailed = this.numberOfTasksFailed;
    final numberOfTasksSucceeded = this.numberOfTasksSucceeded;
    final totalNumberOfTasks = this.totalNumberOfTasks;
    return {
      if (numberOfTasksFailed != null)
        'NumberOfTasksFailed': numberOfTasksFailed,
      if (numberOfTasksSucceeded != null)
        'NumberOfTasksSucceeded': numberOfTasksSucceeded,
      if (totalNumberOfTasks != null) 'TotalNumberOfTasks': totalNumberOfTasks,
    };
  }
}

/// Contains the configuration parameters for a job-completion report.
class JobReport {
  /// Indicates whether the specified job will generate a job-completion report.
  final bool enabled;

  /// The Amazon Resource Name (ARN) for the bucket where specified job-completion
  /// report will be stored.
  final String? bucket;

  /// The format of the specified job-completion report.
  final JobReportFormat? format;

  /// An optional prefix to describe where in the specified bucket the
  /// job-completion report will be stored. Amazon S3 stores the job-completion
  /// report at <code>&lt;prefix&gt;/job-&lt;job-id&gt;/report.json</code>.
  final String? prefix;

  /// Indicates whether the job-completion report will include details of all
  /// tasks or only failed tasks.
  final JobReportScope? reportScope;

  JobReport({
    required this.enabled,
    this.bucket,
    this.format,
    this.prefix,
    this.reportScope,
  });

  factory JobReport.fromJson(Map<String, dynamic> json) {
    return JobReport(
      enabled: json['Enabled'] as bool,
      bucket: json['Bucket'] as String?,
      format: (json['Format'] as String?)?.toJobReportFormat(),
      prefix: json['Prefix'] as String?,
      reportScope: (json['ReportScope'] as String?)?.toJobReportScope(),
    );
  }

  factory JobReport.fromXml(_s.XmlElement elem) {
    return JobReport(
      enabled: _s.extractXmlBoolValue(elem, 'Enabled')!,
      bucket: _s.extractXmlStringValue(elem, 'Bucket'),
      format: _s.extractXmlStringValue(elem, 'Format')?.toJobReportFormat(),
      prefix: _s.extractXmlStringValue(elem, 'Prefix'),
      reportScope:
          _s.extractXmlStringValue(elem, 'ReportScope')?.toJobReportScope(),
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final bucket = this.bucket;
    final format = this.format;
    final prefix = this.prefix;
    final reportScope = this.reportScope;
    return {
      'Enabled': enabled,
      if (bucket != null) 'Bucket': bucket,
      if (format != null) 'Format': format.toValue(),
      if (prefix != null) 'Prefix': prefix,
      if (reportScope != null) 'ReportScope': reportScope.toValue(),
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final enabled = this.enabled;
    final bucket = this.bucket;
    final format = this.format;
    final prefix = this.prefix;
    final reportScope = this.reportScope;
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
      $children,
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
  }
}

extension on String {
  JobReportFormat toJobReportFormat() {
    switch (this) {
      case 'Report_CSV_20180820':
        return JobReportFormat.reportCsv_20180820;
    }
    throw Exception('$this is not known in enum JobReportFormat');
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
    throw Exception('$this is not known in enum JobReportScope');
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
    throw Exception('$this is not known in enum JobStatus');
  }
}

/// Contains the configuration parameters for a <code>Lambda Invoke</code>
/// operation.
class LambdaInvokeOperation {
  /// The Amazon Resource Name (ARN) for the AWS Lambda function that the
  /// specified job will invoke on every object in the manifest.
  final String? functionArn;

  LambdaInvokeOperation({
    this.functionArn,
  });

  factory LambdaInvokeOperation.fromJson(Map<String, dynamic> json) {
    return LambdaInvokeOperation(
      functionArn: json['FunctionArn'] as String?,
    );
  }

  factory LambdaInvokeOperation.fromXml(_s.XmlElement elem) {
    return LambdaInvokeOperation(
      functionArn: _s.extractXmlStringValue(elem, 'FunctionArn'),
    );
  }

  Map<String, dynamic> toJson() {
    final functionArn = this.functionArn;
    return {
      if (functionArn != null) 'FunctionArn': functionArn,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final functionArn = this.functionArn;
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
      $children,
    );
  }
}

/// The container for the Outposts bucket lifecycle configuration.
class LifecycleConfiguration {
  /// A lifecycle rule for individual objects in an Outposts bucket.
  final List<LifecycleRule>? rules;

  LifecycleConfiguration({
    this.rules,
  });

  factory LifecycleConfiguration.fromJson(Map<String, dynamic> json) {
    return LifecycleConfiguration(
      rules: (json['Rules'] as List?)
          ?.whereNotNull()
          .map((e) => LifecycleRule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final rules = this.rules;
    return {
      if (rules != null) 'Rules': rules,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final rules = this.rules;
    final $children = <_s.XmlNode>[
      if (rules != null)
        _s.XmlElement(
            _s.XmlName('Rules'), [], rules.map((e) => e.toXml('Rule'))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// The container of the Outposts bucket lifecycle expiration.
class LifecycleExpiration {
  /// Indicates at what date the object is to be deleted. Should be in GMT ISO
  /// 8601 format.
  final DateTime? date;

  /// Indicates the lifetime, in days, of the objects that are subject to the
  /// rule. The value must be a non-zero positive integer.
  final int? days;

  /// Indicates whether Amazon S3 will remove a delete marker with no noncurrent
  /// versions. If set to true, the delete marker will be expired. If set to
  /// false, the policy takes no action. This cannot be specified with Days or
  /// Date in a Lifecycle Expiration Policy.
  final bool? expiredObjectDeleteMarker;

  LifecycleExpiration({
    this.date,
    this.days,
    this.expiredObjectDeleteMarker,
  });

  factory LifecycleExpiration.fromJson(Map<String, dynamic> json) {
    return LifecycleExpiration(
      date: timeStampFromJson(json['Date']),
      days: json['Days'] as int?,
      expiredObjectDeleteMarker: json['ExpiredObjectDeleteMarker'] as bool?,
    );
  }

  factory LifecycleExpiration.fromXml(_s.XmlElement elem) {
    return LifecycleExpiration(
      date: _s.extractXmlDateTimeValue(elem, 'Date'),
      days: _s.extractXmlIntValue(elem, 'Days'),
      expiredObjectDeleteMarker:
          _s.extractXmlBoolValue(elem, 'ExpiredObjectDeleteMarker'),
    );
  }

  Map<String, dynamic> toJson() {
    final date = this.date;
    final days = this.days;
    final expiredObjectDeleteMarker = this.expiredObjectDeleteMarker;
    return {
      if (date != null) 'Date': unixTimestampToJson(date),
      if (days != null) 'Days': days,
      if (expiredObjectDeleteMarker != null)
        'ExpiredObjectDeleteMarker': expiredObjectDeleteMarker,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final date = this.date;
    final days = this.days;
    final expiredObjectDeleteMarker = this.expiredObjectDeleteMarker;
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
      $children,
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
  /// the <i>Amazon S3 User Guide</i>.
  final AbortIncompleteMultipartUpload? abortIncompleteMultipartUpload;

  /// Specifies the expiration for the lifecycle of the object in the form of
  /// date, days and, whether the object has a delete marker.
  final LifecycleExpiration? expiration;

  /// The container for the filter of lifecycle rule.
  final LifecycleRuleFilter? filter;

  /// Unique identifier for the rule. The value cannot be longer than 255
  /// characters.
  final String? id;

  /// The noncurrent version expiration of the lifecycle rule.
  /// <note>
  /// This is not supported by Amazon S3 on Outposts buckets.
  /// </note>
  final NoncurrentVersionExpiration? noncurrentVersionExpiration;

  /// Specifies the transition rule for the lifecycle rule that describes when
  /// noncurrent objects transition to a specific storage class. If your bucket is
  /// versioning-enabled (or versioning is suspended), you can set this action to
  /// request that Amazon S3 transition noncurrent object versions to a specific
  /// storage class at a set period in the object's lifetime.
  /// <note>
  /// This is not supported by Amazon S3 on Outposts buckets.
  /// </note>
  final List<NoncurrentVersionTransition>? noncurrentVersionTransitions;

  /// Specifies when an Amazon S3 object transitions to a specified storage class.
  /// <note>
  /// This is not supported by Amazon S3 on Outposts buckets.
  /// </note>
  final List<Transition>? transitions;

  LifecycleRule({
    required this.status,
    this.abortIncompleteMultipartUpload,
    this.expiration,
    this.filter,
    this.id,
    this.noncurrentVersionExpiration,
    this.noncurrentVersionTransitions,
    this.transitions,
  });

  factory LifecycleRule.fromJson(Map<String, dynamic> json) {
    return LifecycleRule(
      status: (json['Status'] as String).toExpirationStatus(),
      abortIncompleteMultipartUpload: json['AbortIncompleteMultipartUpload'] !=
              null
          ? AbortIncompleteMultipartUpload.fromJson(
              json['AbortIncompleteMultipartUpload'] as Map<String, dynamic>)
          : null,
      expiration: json['Expiration'] != null
          ? LifecycleExpiration.fromJson(
              json['Expiration'] as Map<String, dynamic>)
          : null,
      filter: json['Filter'] != null
          ? LifecycleRuleFilter.fromJson(json['Filter'] as Map<String, dynamic>)
          : null,
      id: json['ID'] as String?,
      noncurrentVersionExpiration: json['NoncurrentVersionExpiration'] != null
          ? NoncurrentVersionExpiration.fromJson(
              json['NoncurrentVersionExpiration'] as Map<String, dynamic>)
          : null,
      noncurrentVersionTransitions: (json['NoncurrentVersionTransitions']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              NoncurrentVersionTransition.fromJson(e as Map<String, dynamic>))
          .toList(),
      transitions: (json['Transitions'] as List?)
          ?.whereNotNull()
          .map((e) => Transition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  factory LifecycleRule.fromXml(_s.XmlElement elem) {
    return LifecycleRule(
      status: _s.extractXmlStringValue(elem, 'Status')!.toExpirationStatus(),
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

  Map<String, dynamic> toJson() {
    final status = this.status;
    final abortIncompleteMultipartUpload = this.abortIncompleteMultipartUpload;
    final expiration = this.expiration;
    final filter = this.filter;
    final id = this.id;
    final noncurrentVersionExpiration = this.noncurrentVersionExpiration;
    final noncurrentVersionTransitions = this.noncurrentVersionTransitions;
    final transitions = this.transitions;
    return {
      'Status': status.toValue(),
      if (abortIncompleteMultipartUpload != null)
        'AbortIncompleteMultipartUpload': abortIncompleteMultipartUpload,
      if (expiration != null) 'Expiration': expiration,
      if (filter != null) 'Filter': filter,
      if (id != null) 'ID': id,
      if (noncurrentVersionExpiration != null)
        'NoncurrentVersionExpiration': noncurrentVersionExpiration,
      if (noncurrentVersionTransitions != null)
        'NoncurrentVersionTransitions': noncurrentVersionTransitions,
      if (transitions != null) 'Transitions': transitions,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final status = this.status;
    final abortIncompleteMultipartUpload = this.abortIncompleteMultipartUpload;
    final expiration = this.expiration;
    final filter = this.filter;
    final id = this.id;
    final noncurrentVersionExpiration = this.noncurrentVersionExpiration;
    final noncurrentVersionTransitions = this.noncurrentVersionTransitions;
    final transitions = this.transitions;
    final $children = <_s.XmlNode>[
      if (expiration != null) expiration.toXml('Expiration'),
      if (id != null) _s.encodeXmlStringValue('ID', id),
      if (filter != null) filter.toXml('Filter'),
      _s.encodeXmlStringValue('Status', status.toValue()),
      if (transitions != null)
        _s.XmlElement(_s.XmlName('Transitions'), [],
            transitions.map((e) => e.toXml('Transition'))),
      if (noncurrentVersionTransitions != null)
        _s.XmlElement(
            _s.XmlName('NoncurrentVersionTransitions'),
            [],
            noncurrentVersionTransitions
                .map((e) => e.toXml('NoncurrentVersionTransition'))),
      if (noncurrentVersionExpiration != null)
        noncurrentVersionExpiration.toXml('NoncurrentVersionExpiration'),
      if (abortIncompleteMultipartUpload != null)
        abortIncompleteMultipartUpload.toXml('AbortIncompleteMultipartUpload'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// The container for the Outposts bucket lifecycle rule and operator.
class LifecycleRuleAndOperator {
  /// Prefix identifying one or more objects to which the rule applies.
  final String? prefix;

  /// All of these tags must exist in the object's tag set in order for the rule
  /// to apply.
  final List<S3Tag>? tags;

  LifecycleRuleAndOperator({
    this.prefix,
    this.tags,
  });

  factory LifecycleRuleAndOperator.fromJson(Map<String, dynamic> json) {
    return LifecycleRuleAndOperator(
      prefix: json['Prefix'] as String?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => S3Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  factory LifecycleRuleAndOperator.fromXml(_s.XmlElement elem) {
    return LifecycleRuleAndOperator(
      prefix: _s.extractXmlStringValue(elem, 'Prefix'),
      tags: _s.extractXmlChild(elem, 'Tags')?.let((elem) =>
          elem.findElements('member').map((c) => S3Tag.fromXml(c)).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final prefix = this.prefix;
    final tags = this.tags;
    return {
      if (prefix != null) 'Prefix': prefix,
      if (tags != null) 'Tags': tags,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final prefix = this.prefix;
    final tags = this.tags;
    final $children = <_s.XmlNode>[
      if (prefix != null) _s.encodeXmlStringValue('Prefix', prefix),
      if (tags != null)
        _s.XmlElement(
            _s.XmlName('Tags'), [], tags.map((e) => e.toXml('member'))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// The container for the filter of the lifecycle rule.
class LifecycleRuleFilter {
  /// The container for the <code>AND</code> condition for the lifecycle rule.
  final LifecycleRuleAndOperator? and;

  /// Prefix identifying one or more objects to which the rule applies.
  /// <important>
  /// Replacement must be made for object keys containing special characters (such
  /// as carriage returns) when using XML requests. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-keys.html#object-key-xml-related-constraints">
  /// XML related object key constraints</a>.
  /// </important>
  final String? prefix;
  final S3Tag? tag;

  LifecycleRuleFilter({
    this.and,
    this.prefix,
    this.tag,
  });

  factory LifecycleRuleFilter.fromJson(Map<String, dynamic> json) {
    return LifecycleRuleFilter(
      and: json['And'] != null
          ? LifecycleRuleAndOperator.fromJson(
              json['And'] as Map<String, dynamic>)
          : null,
      prefix: json['Prefix'] as String?,
      tag: json['Tag'] != null
          ? S3Tag.fromJson(json['Tag'] as Map<String, dynamic>)
          : null,
    );
  }

  factory LifecycleRuleFilter.fromXml(_s.XmlElement elem) {
    return LifecycleRuleFilter(
      and: _s
          .extractXmlChild(elem, 'And')
          ?.let((e) => LifecycleRuleAndOperator.fromXml(e)),
      prefix: _s.extractXmlStringValue(elem, 'Prefix'),
      tag: _s.extractXmlChild(elem, 'Tag')?.let((e) => S3Tag.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final and = this.and;
    final prefix = this.prefix;
    final tag = this.tag;
    return {
      if (and != null) 'And': and,
      if (prefix != null) 'Prefix': prefix,
      if (tag != null) 'Tag': tag,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final and = this.and;
    final prefix = this.prefix;
    final tag = this.tag;
    final $children = <_s.XmlNode>[
      if (prefix != null) _s.encodeXmlStringValue('Prefix', prefix),
      if (tag != null) tag.toXml('Tag'),
      if (and != null) and.toXml('And'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

class ListAccessPointsForObjectLambdaResult {
  /// If the list has more access points than can be returned in one call to this
  /// API, this field contains a continuation token that you can provide in
  /// subsequent calls to this API to retrieve additional access points.
  final String? nextToken;

  /// Returns list of Object Lambda Access Points.
  final List<ObjectLambdaAccessPoint>? objectLambdaAccessPointList;

  ListAccessPointsForObjectLambdaResult({
    this.nextToken,
    this.objectLambdaAccessPointList,
  });

  factory ListAccessPointsForObjectLambdaResult.fromJson(
      Map<String, dynamic> json) {
    return ListAccessPointsForObjectLambdaResult(
      nextToken: json['NextToken'] as String?,
      objectLambdaAccessPointList:
          (json['ObjectLambdaAccessPointList'] as List?)
              ?.whereNotNull()
              .map((e) =>
                  ObjectLambdaAccessPoint.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  factory ListAccessPointsForObjectLambdaResult.fromXml(_s.XmlElement elem) {
    return ListAccessPointsForObjectLambdaResult(
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      objectLambdaAccessPointList: _s
          .extractXmlChild(elem, 'ObjectLambdaAccessPointList')
          ?.let((elem) => elem
              .findElements('ObjectLambdaAccessPoint')
              .map((c) => ObjectLambdaAccessPoint.fromXml(c))
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final objectLambdaAccessPointList = this.objectLambdaAccessPointList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (objectLambdaAccessPointList != null)
        'ObjectLambdaAccessPointList': objectLambdaAccessPointList,
    };
  }
}

class ListAccessPointsResult {
  /// Contains identification and configuration information for one or more access
  /// points associated with the specified bucket.
  final List<AccessPoint>? accessPointList;

  /// If the specified bucket has more access points than can be returned in one
  /// call to this API, this field contains a continuation token that you can
  /// provide in subsequent calls to this API to retrieve additional access
  /// points.
  final String? nextToken;

  ListAccessPointsResult({
    this.accessPointList,
    this.nextToken,
  });

  factory ListAccessPointsResult.fromJson(Map<String, dynamic> json) {
    return ListAccessPointsResult(
      accessPointList: (json['AccessPointList'] as List?)
          ?.whereNotNull()
          .map((e) => AccessPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

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

  Map<String, dynamic> toJson() {
    final accessPointList = this.accessPointList;
    final nextToken = this.nextToken;
    return {
      if (accessPointList != null) 'AccessPointList': accessPointList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListJobsResult {
  /// The list of current jobs and jobs that have ended within the last 30 days.
  final List<JobListDescriptor>? jobs;

  /// If the <code>List Jobs</code> request produced more than the maximum number
  /// of results, you can pass this value into a subsequent <code>List Jobs</code>
  /// request in order to retrieve the next page of results.
  final String? nextToken;

  ListJobsResult({
    this.jobs,
    this.nextToken,
  });

  factory ListJobsResult.fromJson(Map<String, dynamic> json) {
    return ListJobsResult(
      jobs: (json['Jobs'] as List?)
          ?.whereNotNull()
          .map((e) => JobListDescriptor.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  factory ListJobsResult.fromXml(_s.XmlElement elem) {
    return ListJobsResult(
      jobs: _s.extractXmlChild(elem, 'Jobs')?.let((elem) => elem
          .findElements('member')
          .map((c) => JobListDescriptor.fromXml(c))
          .toList()),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }

  Map<String, dynamic> toJson() {
    final jobs = this.jobs;
    final nextToken = this.nextToken;
    return {
      if (jobs != null) 'Jobs': jobs,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListRegionalBucketsResult {
  /// <code>NextToken</code> is sent when <code>isTruncated</code> is true, which
  /// means there are more buckets that can be listed. The next list requests to
  /// Amazon S3 can be continued with this <code>NextToken</code>.
  /// <code>NextToken</code> is obfuscated and is not a real key.
  final String? nextToken;

  /// <p/>
  final List<RegionalBucket>? regionalBucketList;

  ListRegionalBucketsResult({
    this.nextToken,
    this.regionalBucketList,
  });

  factory ListRegionalBucketsResult.fromJson(Map<String, dynamic> json) {
    return ListRegionalBucketsResult(
      nextToken: json['NextToken'] as String?,
      regionalBucketList: (json['RegionalBucketList'] as List?)
          ?.whereNotNull()
          .map((e) => RegionalBucket.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

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

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final regionalBucketList = this.regionalBucketList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (regionalBucketList != null) 'RegionalBucketList': regionalBucketList,
    };
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
  final bool? isEnabled;

  ListStorageLensConfigurationEntry({
    required this.homeRegion,
    required this.id,
    required this.storageLensArn,
    this.isEnabled,
  });

  factory ListStorageLensConfigurationEntry.fromJson(
      Map<String, dynamic> json) {
    return ListStorageLensConfigurationEntry(
      homeRegion: json['HomeRegion'] as String,
      id: json['Id'] as String,
      storageLensArn: json['StorageLensArn'] as String,
      isEnabled: json['IsEnabled'] as bool?,
    );
  }

  factory ListStorageLensConfigurationEntry.fromXml(_s.XmlElement elem) {
    return ListStorageLensConfigurationEntry(
      homeRegion: _s.extractXmlStringValue(elem, 'HomeRegion')!,
      id: _s.extractXmlStringValue(elem, 'Id')!,
      storageLensArn: _s.extractXmlStringValue(elem, 'StorageLensArn')!,
      isEnabled: _s.extractXmlBoolValue(elem, 'IsEnabled'),
    );
  }

  Map<String, dynamic> toJson() {
    final homeRegion = this.homeRegion;
    final id = this.id;
    final storageLensArn = this.storageLensArn;
    final isEnabled = this.isEnabled;
    return {
      'HomeRegion': homeRegion,
      'Id': id,
      'StorageLensArn': storageLensArn,
      if (isEnabled != null) 'IsEnabled': isEnabled,
    };
  }
}

class ListStorageLensConfigurationsResult {
  /// If the request produced more than the maximum number of S3 Storage Lens
  /// configuration results, you can pass this value into a subsequent request to
  /// retrieve the next page of results.
  final String? nextToken;

  /// A list of S3 Storage Lens configurations.
  final List<ListStorageLensConfigurationEntry>? storageLensConfigurationList;

  ListStorageLensConfigurationsResult({
    this.nextToken,
    this.storageLensConfigurationList,
  });

  factory ListStorageLensConfigurationsResult.fromJson(
      Map<String, dynamic> json) {
    return ListStorageLensConfigurationsResult(
      nextToken: json['NextToken'] as String?,
      storageLensConfigurationList:
          (json['StorageLensConfigurationList'] as List?)
              ?.whereNotNull()
              .map((e) => ListStorageLensConfigurationEntry.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  factory ListStorageLensConfigurationsResult.fromXml(_s.XmlElement elem) {
    return ListStorageLensConfigurationsResult(
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      storageLensConfigurationList: elem
          .findElements('StorageLensConfiguration')
          .map((c) => ListStorageLensConfigurationEntry.fromXml(c))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final storageLensConfigurationList = this.storageLensConfigurationList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (storageLensConfigurationList != null)
        'StorageLensConfigurationList': storageLensConfigurationList,
    };
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
    throw Exception('$this is not known in enum NetworkOrigin');
  }
}

/// The container of the noncurrent version expiration.
class NoncurrentVersionExpiration {
  /// Specifies the number of days an object is noncurrent before Amazon S3 can
  /// perform the associated action. For information about the noncurrent days
  /// calculations, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/intro-lifecycle-rules.html#non-current-days-calculations">How
  /// Amazon S3 Calculates When an Object Became Noncurrent</a> in the <i>Amazon
  /// S3 User Guide</i>.
  final int? noncurrentDays;

  NoncurrentVersionExpiration({
    this.noncurrentDays,
  });

  factory NoncurrentVersionExpiration.fromJson(Map<String, dynamic> json) {
    return NoncurrentVersionExpiration(
      noncurrentDays: json['NoncurrentDays'] as int?,
    );
  }

  factory NoncurrentVersionExpiration.fromXml(_s.XmlElement elem) {
    return NoncurrentVersionExpiration(
      noncurrentDays: _s.extractXmlIntValue(elem, 'NoncurrentDays'),
    );
  }

  Map<String, dynamic> toJson() {
    final noncurrentDays = this.noncurrentDays;
    return {
      if (noncurrentDays != null) 'NoncurrentDays': noncurrentDays,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final noncurrentDays = this.noncurrentDays;
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
      $children,
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
  /// <i>Amazon S3 User Guide</i>.
  final int? noncurrentDays;

  /// The class of storage used to store the object.
  final TransitionStorageClass? storageClass;

  NoncurrentVersionTransition({
    this.noncurrentDays,
    this.storageClass,
  });

  factory NoncurrentVersionTransition.fromJson(Map<String, dynamic> json) {
    return NoncurrentVersionTransition(
      noncurrentDays: json['NoncurrentDays'] as int?,
      storageClass:
          (json['StorageClass'] as String?)?.toTransitionStorageClass(),
    );
  }

  factory NoncurrentVersionTransition.fromXml(_s.XmlElement elem) {
    return NoncurrentVersionTransition(
      noncurrentDays: _s.extractXmlIntValue(elem, 'NoncurrentDays'),
      storageClass: _s
          .extractXmlStringValue(elem, 'StorageClass')
          ?.toTransitionStorageClass(),
    );
  }

  Map<String, dynamic> toJson() {
    final noncurrentDays = this.noncurrentDays;
    final storageClass = this.storageClass;
    return {
      if (noncurrentDays != null) 'NoncurrentDays': noncurrentDays,
      if (storageClass != null) 'StorageClass': storageClass.toValue(),
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final noncurrentDays = this.noncurrentDays;
    final storageClass = this.storageClass;
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
      $children,
    );
  }
}

/// An access point with an attached AWS Lambda function used to access
/// transformed data from an Amazon S3 bucket.
class ObjectLambdaAccessPoint {
  /// The name of the Object Lambda Access Point.
  final String name;

  /// Specifies the ARN for the Object Lambda Access Point.
  final String? objectLambdaAccessPointArn;

  ObjectLambdaAccessPoint({
    required this.name,
    this.objectLambdaAccessPointArn,
  });

  factory ObjectLambdaAccessPoint.fromJson(Map<String, dynamic> json) {
    return ObjectLambdaAccessPoint(
      name: json['Name'] as String,
      objectLambdaAccessPointArn: json['ObjectLambdaAccessPointArn'] as String?,
    );
  }

  factory ObjectLambdaAccessPoint.fromXml(_s.XmlElement elem) {
    return ObjectLambdaAccessPoint(
      name: _s.extractXmlStringValue(elem, 'Name')!,
      objectLambdaAccessPointArn:
          _s.extractXmlStringValue(elem, 'ObjectLambdaAccessPointArn'),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final objectLambdaAccessPointArn = this.objectLambdaAccessPointArn;
    return {
      'Name': name,
      if (objectLambdaAccessPointArn != null)
        'ObjectLambdaAccessPointArn': objectLambdaAccessPointArn,
    };
  }
}

enum ObjectLambdaAllowedFeature {
  getObjectRange,
  getObjectPartNumber,
}

extension on ObjectLambdaAllowedFeature {
  String toValue() {
    switch (this) {
      case ObjectLambdaAllowedFeature.getObjectRange:
        return 'GetObject-Range';
      case ObjectLambdaAllowedFeature.getObjectPartNumber:
        return 'GetObject-PartNumber';
    }
  }
}

extension on String {
  ObjectLambdaAllowedFeature toObjectLambdaAllowedFeature() {
    switch (this) {
      case 'GetObject-Range':
        return ObjectLambdaAllowedFeature.getObjectRange;
      case 'GetObject-PartNumber':
        return ObjectLambdaAllowedFeature.getObjectPartNumber;
    }
    throw Exception('$this is not known in enum ObjectLambdaAllowedFeature');
  }
}

/// A configuration used when creating an Object Lambda Access Point.
class ObjectLambdaConfiguration {
  /// Standard access point associated with the Object Lambda Access Point.
  final String supportingAccessPoint;

  /// A container for transformation configurations for an Object Lambda Access
  /// Point.
  final List<ObjectLambdaTransformationConfiguration>
      transformationConfigurations;

  /// A container for allowed features. Valid inputs are
  /// <code>GetObject-Range</code> and <code>GetObject-PartNumber</code>.
  final List<ObjectLambdaAllowedFeature>? allowedFeatures;

  /// A container for whether the CloudWatch metrics configuration is enabled.
  final bool? cloudWatchMetricsEnabled;

  ObjectLambdaConfiguration({
    required this.supportingAccessPoint,
    required this.transformationConfigurations,
    this.allowedFeatures,
    this.cloudWatchMetricsEnabled,
  });

  factory ObjectLambdaConfiguration.fromJson(Map<String, dynamic> json) {
    return ObjectLambdaConfiguration(
      supportingAccessPoint: json['SupportingAccessPoint'] as String,
      transformationConfigurations:
          (json['TransformationConfigurations'] as List)
              .whereNotNull()
              .map((e) => ObjectLambdaTransformationConfiguration.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      allowedFeatures: (json['AllowedFeatures'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toObjectLambdaAllowedFeature())
          .toList(),
      cloudWatchMetricsEnabled: json['CloudWatchMetricsEnabled'] as bool?,
    );
  }

  factory ObjectLambdaConfiguration.fromXml(_s.XmlElement elem) {
    return ObjectLambdaConfiguration(
      supportingAccessPoint:
          _s.extractXmlStringValue(elem, 'SupportingAccessPoint')!,
      transformationConfigurations: _s
          .extractXmlChild(elem, 'TransformationConfigurations')!
          .findElements('TransformationConfiguration')
          .map((c) => ObjectLambdaTransformationConfiguration.fromXml(c))
          .toList(),
      allowedFeatures: _s.extractXmlChild(elem, 'AllowedFeatures')?.let(
          (elem) => _s
              .extractXmlStringListValues(elem, 'AllowedFeature')
              .map((s) => s.toObjectLambdaAllowedFeature())
              .toList()),
      cloudWatchMetricsEnabled:
          _s.extractXmlBoolValue(elem, 'CloudWatchMetricsEnabled'),
    );
  }

  Map<String, dynamic> toJson() {
    final supportingAccessPoint = this.supportingAccessPoint;
    final transformationConfigurations = this.transformationConfigurations;
    final allowedFeatures = this.allowedFeatures;
    final cloudWatchMetricsEnabled = this.cloudWatchMetricsEnabled;
    return {
      'SupportingAccessPoint': supportingAccessPoint,
      'TransformationConfigurations': transformationConfigurations,
      if (allowedFeatures != null)
        'AllowedFeatures': allowedFeatures.map((e) => e.toValue()).toList(),
      if (cloudWatchMetricsEnabled != null)
        'CloudWatchMetricsEnabled': cloudWatchMetricsEnabled,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final supportingAccessPoint = this.supportingAccessPoint;
    final transformationConfigurations = this.transformationConfigurations;
    final allowedFeatures = this.allowedFeatures;
    final cloudWatchMetricsEnabled = this.cloudWatchMetricsEnabled;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('SupportingAccessPoint', supportingAccessPoint),
      if (cloudWatchMetricsEnabled != null)
        _s.encodeXmlBoolValue(
            'CloudWatchMetricsEnabled', cloudWatchMetricsEnabled),
      if (allowedFeatures != null)
        _s.XmlElement(
            _s.XmlName('AllowedFeatures'),
            [],
            allowedFeatures.map(
                (e) => _s.encodeXmlStringValue('AllowedFeature', e.toValue()))),
      _s.XmlElement(
          _s.XmlName('TransformationConfigurations'),
          [],
          transformationConfigurations
              .map((e) => e.toXml('TransformationConfiguration'))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// A container for AwsLambdaTransformation.
class ObjectLambdaContentTransformation {
  /// A container for an AWS Lambda function.
  final AwsLambdaTransformation? awsLambda;

  ObjectLambdaContentTransformation({
    this.awsLambda,
  });

  factory ObjectLambdaContentTransformation.fromJson(
      Map<String, dynamic> json) {
    return ObjectLambdaContentTransformation(
      awsLambda: json['AwsLambda'] != null
          ? AwsLambdaTransformation.fromJson(
              json['AwsLambda'] as Map<String, dynamic>)
          : null,
    );
  }

  factory ObjectLambdaContentTransformation.fromXml(_s.XmlElement elem) {
    return ObjectLambdaContentTransformation(
      awsLambda: _s
          .extractXmlChild(elem, 'AwsLambda')
          ?.let((e) => AwsLambdaTransformation.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final awsLambda = this.awsLambda;
    return {
      if (awsLambda != null) 'AwsLambda': awsLambda,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final awsLambda = this.awsLambda;
    final $children = <_s.XmlNode>[
      if (awsLambda != null) awsLambda.toXml('AwsLambda'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// A configuration used when creating an Object Lambda Access Point
/// transformation.
class ObjectLambdaTransformationConfiguration {
  /// A container for the action of an Object Lambda Access Point configuration.
  /// Valid input is <code>GetObject</code>.
  final List<ObjectLambdaTransformationConfigurationAction> actions;

  /// A container for the content transformation of an Object Lambda Access Point
  /// configuration.
  final ObjectLambdaContentTransformation contentTransformation;

  ObjectLambdaTransformationConfiguration({
    required this.actions,
    required this.contentTransformation,
  });

  factory ObjectLambdaTransformationConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ObjectLambdaTransformationConfiguration(
      actions: (json['Actions'] as List)
          .whereNotNull()
          .map((e) =>
              (e as String).toObjectLambdaTransformationConfigurationAction())
          .toList(),
      contentTransformation: ObjectLambdaContentTransformation.fromJson(
          json['ContentTransformation'] as Map<String, dynamic>),
    );
  }

  factory ObjectLambdaTransformationConfiguration.fromXml(_s.XmlElement elem) {
    return ObjectLambdaTransformationConfiguration(
      actions: _s
          .extractXmlStringListValues(
              _s.extractXmlChild(elem, 'Actions')!, 'Action')
          .map((s) => s.toObjectLambdaTransformationConfigurationAction())
          .toList(),
      contentTransformation: ObjectLambdaContentTransformation.fromXml(
          _s.extractXmlChild(elem, 'ContentTransformation')!),
    );
  }

  Map<String, dynamic> toJson() {
    final actions = this.actions;
    final contentTransformation = this.contentTransformation;
    return {
      'Actions': actions.map((e) => e.toValue()).toList(),
      'ContentTransformation': contentTransformation,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final actions = this.actions;
    final contentTransformation = this.contentTransformation;
    final $children = <_s.XmlNode>[
      _s.XmlElement(_s.XmlName('Actions'), [],
          actions.map((e) => _s.encodeXmlStringValue('Action', e.toValue()))),
      contentTransformation.toXml('ContentTransformation'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

enum ObjectLambdaTransformationConfigurationAction {
  getObject,
}

extension on ObjectLambdaTransformationConfigurationAction {
  String toValue() {
    switch (this) {
      case ObjectLambdaTransformationConfigurationAction.getObject:
        return 'GetObject';
    }
  }
}

extension on String {
  ObjectLambdaTransformationConfigurationAction
      toObjectLambdaTransformationConfigurationAction() {
    switch (this) {
      case 'GetObject':
        return ObjectLambdaTransformationConfigurationAction.getObject;
    }
    throw Exception(
        '$this is not known in enum ObjectLambdaTransformationConfigurationAction');
  }
}

enum OperationName {
  lambdaInvoke,
  s3PutObjectCopy,
  s3PutObjectAcl,
  s3PutObjectTagging,
  s3DeleteObjectTagging,
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
      case OperationName.s3DeleteObjectTagging:
        return 'S3DeleteObjectTagging';
      case OperationName.s3InitiateRestoreObject:
        return 'S3InitiateRestoreObject';
      case OperationName.s3PutObjectLegalHold:
        return 'S3PutObjectLegalHold';
      case OperationName.s3PutObjectRetention:
        return 'S3PutObjectRetention';
    }
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
      case 'S3DeleteObjectTagging':
        return OperationName.s3DeleteObjectTagging;
      case 'S3InitiateRestoreObject':
        return OperationName.s3InitiateRestoreObject;
      case 'S3PutObjectLegalHold':
        return OperationName.s3PutObjectLegalHold;
      case 'S3PutObjectRetention':
        return OperationName.s3PutObjectRetention;
    }
    throw Exception('$this is not known in enum OperationName');
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
  }
}

extension on String {
  OutputSchemaVersion toOutputSchemaVersion() {
    switch (this) {
      case 'V_1':
        return OutputSchemaVersion.v_1;
    }
    throw Exception('$this is not known in enum OutputSchemaVersion');
  }
}

/// Indicates whether this access point policy is public. For more information
/// about how Amazon S3 evaluates policies to determine whether they are public,
/// see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html#access-control-block-public-access-policy-status">The
/// Meaning of "Public"</a> in the <i>Amazon S3 User Guide</i>.
class PolicyStatus {
  /// <p/>
  final bool? isPublic;

  PolicyStatus({
    this.isPublic,
  });

  factory PolicyStatus.fromJson(Map<String, dynamic> json) {
    return PolicyStatus(
      isPublic: json['IsPublic'] as bool?,
    );
  }

  factory PolicyStatus.fromXml(_s.XmlElement elem) {
    return PolicyStatus(
      isPublic: _s.extractXmlBoolValue(elem, 'IsPublic'),
    );
  }

  Map<String, dynamic> toJson() {
    final isPublic = this.isPublic;
    return {
      if (isPublic != null) 'IsPublic': isPublic,
    };
  }
}

/// A container for the prefix-level configuration.
class PrefixLevel {
  /// A container for the prefix-level storage metrics for S3 Storage Lens.
  final PrefixLevelStorageMetrics storageMetrics;

  PrefixLevel({
    required this.storageMetrics,
  });

  factory PrefixLevel.fromJson(Map<String, dynamic> json) {
    return PrefixLevel(
      storageMetrics: PrefixLevelStorageMetrics.fromJson(
          json['StorageMetrics'] as Map<String, dynamic>),
    );
  }

  factory PrefixLevel.fromXml(_s.XmlElement elem) {
    return PrefixLevel(
      storageMetrics: PrefixLevelStorageMetrics.fromXml(
          _s.extractXmlChild(elem, 'StorageMetrics')!),
    );
  }

  Map<String, dynamic> toJson() {
    final storageMetrics = this.storageMetrics;
    return {
      'StorageMetrics': storageMetrics,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final storageMetrics = this.storageMetrics;
    final $children = <_s.XmlNode>[
      storageMetrics.toXml('StorageMetrics'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// A container for the prefix-level storage metrics for S3 Storage Lens.
class PrefixLevelStorageMetrics {
  /// A container for whether prefix-level storage metrics are enabled.
  final bool? isEnabled;
  final SelectionCriteria? selectionCriteria;

  PrefixLevelStorageMetrics({
    this.isEnabled,
    this.selectionCriteria,
  });

  factory PrefixLevelStorageMetrics.fromJson(Map<String, dynamic> json) {
    return PrefixLevelStorageMetrics(
      isEnabled: json['IsEnabled'] as bool?,
      selectionCriteria: json['SelectionCriteria'] != null
          ? SelectionCriteria.fromJson(
              json['SelectionCriteria'] as Map<String, dynamic>)
          : null,
    );
  }

  factory PrefixLevelStorageMetrics.fromXml(_s.XmlElement elem) {
    return PrefixLevelStorageMetrics(
      isEnabled: _s.extractXmlBoolValue(elem, 'IsEnabled'),
      selectionCriteria: _s
          .extractXmlChild(elem, 'SelectionCriteria')
          ?.let((e) => SelectionCriteria.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final isEnabled = this.isEnabled;
    final selectionCriteria = this.selectionCriteria;
    return {
      if (isEnabled != null) 'IsEnabled': isEnabled,
      if (selectionCriteria != null) 'SelectionCriteria': selectionCriteria,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final isEnabled = this.isEnabled;
    final selectionCriteria = this.selectionCriteria;
    final $children = <_s.XmlNode>[
      if (isEnabled != null) _s.encodeXmlBoolValue('IsEnabled', isEnabled),
      if (selectionCriteria != null)
        selectionCriteria.toXml('SelectionCriteria'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// The <code>PublicAccessBlock</code> configuration that you want to apply to
/// this Amazon S3 account. You can enable the configuration options in any
/// combination. For more information about when Amazon S3 considers a bucket or
/// object public, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html#access-control-block-public-access-policy-status">The
/// Meaning of "Public"</a> in the <i>Amazon S3 User Guide</i>.
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
  final bool? blockPublicAcls;

  /// Specifies whether Amazon S3 should block public bucket policies for buckets
  /// in this account. Setting this element to <code>TRUE</code> causes Amazon S3
  /// to reject calls to PUT Bucket policy if the specified bucket policy allows
  /// public access.
  ///
  /// Enabling this setting doesn't affect existing bucket policies.
  ///
  /// This is not supported for Amazon S3 on Outposts.
  final bool? blockPublicPolicy;

  /// Specifies whether Amazon S3 should ignore public ACLs for buckets in this
  /// account. Setting this element to <code>TRUE</code> causes Amazon S3 to
  /// ignore all public ACLs on buckets in this account and any objects that they
  /// contain.
  ///
  /// Enabling this setting doesn't affect the persistence of any existing ACLs
  /// and doesn't prevent new public ACLs from being set.
  ///
  /// This is not supported for Amazon S3 on Outposts.
  final bool? ignorePublicAcls;

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
  final bool? restrictPublicBuckets;

  PublicAccessBlockConfiguration({
    this.blockPublicAcls,
    this.blockPublicPolicy,
    this.ignorePublicAcls,
    this.restrictPublicBuckets,
  });

  factory PublicAccessBlockConfiguration.fromJson(Map<String, dynamic> json) {
    return PublicAccessBlockConfiguration(
      blockPublicAcls: json['BlockPublicAcls'] as bool?,
      blockPublicPolicy: json['BlockPublicPolicy'] as bool?,
      ignorePublicAcls: json['IgnorePublicAcls'] as bool?,
      restrictPublicBuckets: json['RestrictPublicBuckets'] as bool?,
    );
  }

  factory PublicAccessBlockConfiguration.fromXml(_s.XmlElement elem) {
    return PublicAccessBlockConfiguration(
      blockPublicAcls: _s.extractXmlBoolValue(elem, 'BlockPublicAcls'),
      blockPublicPolicy: _s.extractXmlBoolValue(elem, 'BlockPublicPolicy'),
      ignorePublicAcls: _s.extractXmlBoolValue(elem, 'IgnorePublicAcls'),
      restrictPublicBuckets:
          _s.extractXmlBoolValue(elem, 'RestrictPublicBuckets'),
    );
  }

  Map<String, dynamic> toJson() {
    final blockPublicAcls = this.blockPublicAcls;
    final blockPublicPolicy = this.blockPublicPolicy;
    final ignorePublicAcls = this.ignorePublicAcls;
    final restrictPublicBuckets = this.restrictPublicBuckets;
    return {
      if (blockPublicAcls != null) 'BlockPublicAcls': blockPublicAcls,
      if (blockPublicPolicy != null) 'BlockPublicPolicy': blockPublicPolicy,
      if (ignorePublicAcls != null) 'IgnorePublicAcls': ignorePublicAcls,
      if (restrictPublicBuckets != null)
        'RestrictPublicBuckets': restrictPublicBuckets,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final blockPublicAcls = this.blockPublicAcls;
    final blockPublicPolicy = this.blockPublicPolicy;
    final ignorePublicAcls = this.ignorePublicAcls;
    final restrictPublicBuckets = this.restrictPublicBuckets;
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
      $children,
    );
  }
}

class PutAccessPointConfigurationForObjectLambdaRequest {
  /// The account ID for the account that owns the specified Object Lambda Access
  /// Point.
  final String accountId;

  /// Object Lambda Access Point configuration document.
  final ObjectLambdaConfiguration configuration;

  /// The name of the Object Lambda Access Point.
  final String name;

  PutAccessPointConfigurationForObjectLambdaRequest({
    required this.accountId,
    required this.configuration,
    required this.name,
  });

  factory PutAccessPointConfigurationForObjectLambdaRequest.fromJson(
      Map<String, dynamic> json) {
    return PutAccessPointConfigurationForObjectLambdaRequest(
      accountId: json['x-amz-account-id'] as String,
      configuration: ObjectLambdaConfiguration.fromJson(
          json['Configuration'] as Map<String, dynamic>),
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final configuration = this.configuration;
    final name = this.name;
    return {
      'Configuration': configuration,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final accountId = this.accountId;
    final configuration = this.configuration;
    final name = this.name;
    final $children = <_s.XmlNode>[
      configuration.toXml('Configuration'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

class PutAccessPointPolicyForObjectLambdaRequest {
  /// The account ID for the account that owns the specified Object Lambda Access
  /// Point.
  final String accountId;

  /// The name of the Object Lambda Access Point.
  final String name;

  /// Object Lambda Access Point resource policy document.
  final String policy;

  PutAccessPointPolicyForObjectLambdaRequest({
    required this.accountId,
    required this.name,
    required this.policy,
  });

  factory PutAccessPointPolicyForObjectLambdaRequest.fromJson(
      Map<String, dynamic> json) {
    return PutAccessPointPolicyForObjectLambdaRequest(
      accountId: json['x-amz-account-id'] as String,
      name: json['name'] as String,
      policy: json['Policy'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final name = this.name;
    final policy = this.policy;
    return {
      'Policy': policy,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final accountId = this.accountId;
    final name = this.name;
    final policy = this.policy;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Policy', policy),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
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
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/access-points.html">Managing
  /// data access with Amazon S3 access points</a> in the <i>Amazon S3 User
  /// Guide</i>.
  final String policy;

  PutAccessPointPolicyRequest({
    required this.accountId,
    required this.name,
    required this.policy,
  });

  factory PutAccessPointPolicyRequest.fromJson(Map<String, dynamic> json) {
    return PutAccessPointPolicyRequest(
      accountId: json['x-amz-account-id'] as String,
      name: json['name'] as String,
      policy: json['Policy'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final name = this.name;
    final policy = this.policy;
    return {
      'Policy': policy,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final accountId = this.accountId;
    final name = this.name;
    final policy = this.policy;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Policy', policy),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
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
  final bool? confirmRemoveSelfBucketAccess;

  PutBucketPolicyRequest({
    required this.accountId,
    required this.bucket,
    required this.policy,
    this.confirmRemoveSelfBucketAccess,
  });

  factory PutBucketPolicyRequest.fromJson(Map<String, dynamic> json) {
    return PutBucketPolicyRequest(
      accountId: json['x-amz-account-id'] as String,
      bucket: json['name'] as String,
      policy: json['Policy'] as String,
      confirmRemoveSelfBucketAccess:
          json['x-amz-confirm-remove-self-bucket-access'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final bucket = this.bucket;
    final policy = this.policy;
    final confirmRemoveSelfBucketAccess = this.confirmRemoveSelfBucketAccess;
    return {
      'Policy': policy,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final accountId = this.accountId;
    final bucket = this.bucket;
    final policy = this.policy;
    final confirmRemoveSelfBucketAccess = this.confirmRemoveSelfBucketAccess;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Policy', policy),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
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
    required this.accountId,
    required this.jobId,
    required this.tags,
  });

  factory PutJobTaggingRequest.fromJson(Map<String, dynamic> json) {
    return PutJobTaggingRequest(
      accountId: json['x-amz-account-id'] as String,
      jobId: json['id'] as String,
      tags: (json['Tags'] as List)
          .whereNotNull()
          .map((e) => S3Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final jobId = this.jobId;
    final tags = this.tags;
    return {
      'Tags': tags,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final accountId = this.accountId;
    final jobId = this.jobId;
    final tags = this.tags;
    final $children = <_s.XmlNode>[
      _s.XmlElement(_s.XmlName('Tags'), [], tags.map((e) => e.toXml('member'))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

class PutJobTaggingResult {
  PutJobTaggingResult();

  factory PutJobTaggingResult.fromJson(Map<String, dynamic> _) {
    return PutJobTaggingResult();
  }

  factory PutJobTaggingResult.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return PutJobTaggingResult();
  }

  Map<String, dynamic> toJson() {
    return {};
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
  final List<StorageLensTag>? tags;

  PutStorageLensConfigurationRequest({
    required this.accountId,
    required this.configId,
    required this.storageLensConfiguration,
    this.tags,
  });

  factory PutStorageLensConfigurationRequest.fromJson(
      Map<String, dynamic> json) {
    return PutStorageLensConfigurationRequest(
      accountId: json['x-amz-account-id'] as String,
      configId: json['storagelensid'] as String,
      storageLensConfiguration: StorageLensConfiguration.fromJson(
          json['StorageLensConfiguration'] as Map<String, dynamic>),
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => StorageLensTag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final configId = this.configId;
    final storageLensConfiguration = this.storageLensConfiguration;
    final tags = this.tags;
    return {
      'StorageLensConfiguration': storageLensConfiguration,
      if (tags != null) 'Tags': tags,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final accountId = this.accountId;
    final configId = this.configId;
    final storageLensConfiguration = this.storageLensConfiguration;
    final tags = this.tags;
    final $children = <_s.XmlNode>[
      storageLensConfiguration.toXml('StorageLensConfiguration'),
      if (tags != null)
        _s.XmlElement(_s.XmlName('Tags'), [], tags.map((e) => e.toXml('Tag'))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
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
    required this.accountId,
    required this.configId,
    required this.tags,
  });

  factory PutStorageLensConfigurationTaggingRequest.fromJson(
      Map<String, dynamic> json) {
    return PutStorageLensConfigurationTaggingRequest(
      accountId: json['x-amz-account-id'] as String,
      configId: json['storagelensid'] as String,
      tags: (json['Tags'] as List)
          .whereNotNull()
          .map((e) => StorageLensTag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final configId = this.configId;
    final tags = this.tags;
    return {
      'Tags': tags,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final accountId = this.accountId;
    final configId = this.configId;
    final tags = this.tags;
    final $children = <_s.XmlNode>[
      _s.XmlElement(_s.XmlName('Tags'), [], tags.map((e) => e.toXml('Tag'))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

class PutStorageLensConfigurationTaggingResult {
  PutStorageLensConfigurationTaggingResult();

  factory PutStorageLensConfigurationTaggingResult.fromJson(
      Map<String, dynamic> _) {
    return PutStorageLensConfigurationTaggingResult();
  }

  factory PutStorageLensConfigurationTaggingResult.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return PutStorageLensConfigurationTaggingResult();
  }

  Map<String, dynamic> toJson() {
    return {};
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
  final String? bucketArn;

  /// The AWS Outposts ID of the regional bucket.
  final String? outpostId;

  RegionalBucket({
    required this.bucket,
    required this.creationDate,
    required this.publicAccessBlockEnabled,
    this.bucketArn,
    this.outpostId,
  });

  factory RegionalBucket.fromJson(Map<String, dynamic> json) {
    return RegionalBucket(
      bucket: json['Bucket'] as String,
      creationDate:
          nonNullableTimeStampFromJson(json['CreationDate'] as Object),
      publicAccessBlockEnabled: json['PublicAccessBlockEnabled'] as bool,
      bucketArn: json['BucketArn'] as String?,
      outpostId: json['OutpostId'] as String?,
    );
  }

  factory RegionalBucket.fromXml(_s.XmlElement elem) {
    return RegionalBucket(
      bucket: _s.extractXmlStringValue(elem, 'Bucket')!,
      creationDate: _s.extractXmlDateTimeValue(elem, 'CreationDate')!,
      publicAccessBlockEnabled:
          _s.extractXmlBoolValue(elem, 'PublicAccessBlockEnabled')!,
      bucketArn: _s.extractXmlStringValue(elem, 'BucketArn'),
      outpostId: _s.extractXmlStringValue(elem, 'OutpostId'),
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final creationDate = this.creationDate;
    final publicAccessBlockEnabled = this.publicAccessBlockEnabled;
    final bucketArn = this.bucketArn;
    final outpostId = this.outpostId;
    return {
      'Bucket': bucket,
      'CreationDate': unixTimestampToJson(creationDate),
      'PublicAccessBlockEnabled': publicAccessBlockEnabled,
      if (bucketArn != null) 'BucketArn': bucketArn,
      if (outpostId != null) 'OutpostId': outpostId,
    };
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
    throw Exception('$this is not known in enum RequestedJobStatus');
  }
}

/// <p/>
class S3AccessControlList {
  /// <p/>
  final S3ObjectOwner owner;

  /// <p/>
  final List<S3Grant>? grants;

  S3AccessControlList({
    required this.owner,
    this.grants,
  });

  factory S3AccessControlList.fromJson(Map<String, dynamic> json) {
    return S3AccessControlList(
      owner: S3ObjectOwner.fromJson(json['Owner'] as Map<String, dynamic>),
      grants: (json['Grants'] as List?)
          ?.whereNotNull()
          .map((e) => S3Grant.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  factory S3AccessControlList.fromXml(_s.XmlElement elem) {
    return S3AccessControlList(
      owner: S3ObjectOwner.fromXml(_s.extractXmlChild(elem, 'Owner')!),
      grants: _s.extractXmlChild(elem, 'Grants')?.let((elem) =>
          elem.findElements('member').map((c) => S3Grant.fromXml(c)).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final owner = this.owner;
    final grants = this.grants;
    return {
      'Owner': owner,
      if (grants != null) 'Grants': grants,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final owner = this.owner;
    final grants = this.grants;
    final $children = <_s.XmlNode>[
      owner.toXml('Owner'),
      if (grants != null)
        _s.XmlElement(
            _s.XmlName('Grants'), [], grants.map((e) => e.toXml('member'))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// <p/>
class S3AccessControlPolicy {
  /// <p/>
  final S3AccessControlList? accessControlList;

  /// <p/>
  final S3CannedAccessControlList? cannedAccessControlList;

  S3AccessControlPolicy({
    this.accessControlList,
    this.cannedAccessControlList,
  });

  factory S3AccessControlPolicy.fromJson(Map<String, dynamic> json) {
    return S3AccessControlPolicy(
      accessControlList: json['AccessControlList'] != null
          ? S3AccessControlList.fromJson(
              json['AccessControlList'] as Map<String, dynamic>)
          : null,
      cannedAccessControlList: (json['CannedAccessControlList'] as String?)
          ?.toS3CannedAccessControlList(),
    );
  }

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

  Map<String, dynamic> toJson() {
    final accessControlList = this.accessControlList;
    final cannedAccessControlList = this.cannedAccessControlList;
    return {
      if (accessControlList != null) 'AccessControlList': accessControlList,
      if (cannedAccessControlList != null)
        'CannedAccessControlList': cannedAccessControlList.toValue(),
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final accessControlList = this.accessControlList;
    final cannedAccessControlList = this.cannedAccessControlList;
    final $children = <_s.XmlNode>[
      if (accessControlList != null)
        accessControlList.toXml('AccessControlList'),
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
      $children,
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
  final StorageLensDataExportEncryption? encryption;

  /// The prefix of the destination bucket where the metrics export will be
  /// delivered.
  final String? prefix;

  S3BucketDestination({
    required this.accountId,
    required this.arn,
    required this.format,
    required this.outputSchemaVersion,
    this.encryption,
    this.prefix,
  });

  factory S3BucketDestination.fromJson(Map<String, dynamic> json) {
    return S3BucketDestination(
      accountId: json['AccountId'] as String,
      arn: json['Arn'] as String,
      format: (json['Format'] as String).toFormat(),
      outputSchemaVersion:
          (json['OutputSchemaVersion'] as String).toOutputSchemaVersion(),
      encryption: json['Encryption'] != null
          ? StorageLensDataExportEncryption.fromJson(
              json['Encryption'] as Map<String, dynamic>)
          : null,
      prefix: json['Prefix'] as String?,
    );
  }

  factory S3BucketDestination.fromXml(_s.XmlElement elem) {
    return S3BucketDestination(
      accountId: _s.extractXmlStringValue(elem, 'AccountId')!,
      arn: _s.extractXmlStringValue(elem, 'Arn')!,
      format: _s.extractXmlStringValue(elem, 'Format')!.toFormat(),
      outputSchemaVersion: _s
          .extractXmlStringValue(elem, 'OutputSchemaVersion')!
          .toOutputSchemaVersion(),
      encryption: _s
          .extractXmlChild(elem, 'Encryption')
          ?.let((e) => StorageLensDataExportEncryption.fromXml(e)),
      prefix: _s.extractXmlStringValue(elem, 'Prefix'),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final arn = this.arn;
    final format = this.format;
    final outputSchemaVersion = this.outputSchemaVersion;
    final encryption = this.encryption;
    final prefix = this.prefix;
    return {
      'AccountId': accountId,
      'Arn': arn,
      'Format': format.toValue(),
      'OutputSchemaVersion': outputSchemaVersion.toValue(),
      if (encryption != null) 'Encryption': encryption,
      if (prefix != null) 'Prefix': prefix,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final accountId = this.accountId;
    final arn = this.arn;
    final format = this.format;
    final outputSchemaVersion = this.outputSchemaVersion;
    final encryption = this.encryption;
    final prefix = this.prefix;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Format', format.toValue()),
      _s.encodeXmlStringValue(
          'OutputSchemaVersion', outputSchemaVersion.toValue()),
      _s.encodeXmlStringValue('AccountId', accountId),
      _s.encodeXmlStringValue('Arn', arn),
      if (prefix != null) _s.encodeXmlStringValue('Prefix', prefix),
      if (encryption != null) encryption.toXml('Encryption'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
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
    throw Exception('$this is not known in enum S3CannedAccessControlList');
  }
}

/// Contains the configuration parameters for a PUT Copy object operation. S3
/// Batch Operations passes every object to the underlying PUT Copy object API.
/// For more information about the parameters for this operation, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTObjectCOPY.html">PUT
/// Object - Copy</a>.
class S3CopyObjectOperation {
  /// <p/>
  final List<S3Grant>? accessControlGrants;

  /// Specifies whether Amazon S3 should use an S3 Bucket Key for object
  /// encryption with server-side encryption using AWS KMS (SSE-KMS). Setting this
  /// header to <code>true</code> causes Amazon S3 to use an S3 Bucket Key for
  /// object encryption with SSE-KMS.
  ///
  /// Specifying this header with an <i>object</i> action doesn’t affect
  /// <i>bucket-level</i> settings for S3 Bucket Key.
  final bool? bucketKeyEnabled;

  /// <p/>
  final S3CannedAccessControlList? cannedAccessControlList;

  /// <p/>
  final S3MetadataDirective? metadataDirective;

  /// <p/>
  final DateTime? modifiedSinceConstraint;

  /// <p/>
  final S3ObjectMetadata? newObjectMetadata;

  /// <p/>
  final List<S3Tag>? newObjectTagging;

  /// The legal hold status to be applied to all objects in the Batch Operations
  /// job.
  final S3ObjectLockLegalHoldStatus? objectLockLegalHoldStatus;

  /// The retention mode to be applied to all objects in the Batch Operations job.
  final S3ObjectLockMode? objectLockMode;

  /// The date when the applied object retention configuration expires on all
  /// objects in the Batch Operations job.
  final DateTime? objectLockRetainUntilDate;

  /// Specifies an optional metadata property for website redirects,
  /// <code>x-amz-website-redirect-location</code>. Allows webpage redirects if
  /// the object is accessed through a website endpoint.
  final String? redirectLocation;

  /// <p/>
  final bool? requesterPays;

  /// <p/>
  final String? sSEAwsKmsKeyId;

  /// <p/>
  final S3StorageClass? storageClass;

  /// Specifies the folder prefix into which you would like the objects to be
  /// copied. For example, to copy objects into a folder named "Folder1" in the
  /// destination bucket, set the TargetKeyPrefix to "Folder1/".
  final String? targetKeyPrefix;

  /// Specifies the destination bucket ARN for the batch copy operation. For
  /// example, to copy objects to a bucket named "destinationBucket", set the
  /// TargetResource to "arn:aws:s3:::destinationBucket".
  final String? targetResource;

  /// <p/>
  final DateTime? unModifiedSinceConstraint;

  S3CopyObjectOperation({
    this.accessControlGrants,
    this.bucketKeyEnabled,
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

  factory S3CopyObjectOperation.fromJson(Map<String, dynamic> json) {
    return S3CopyObjectOperation(
      accessControlGrants: (json['AccessControlGrants'] as List?)
          ?.whereNotNull()
          .map((e) => S3Grant.fromJson(e as Map<String, dynamic>))
          .toList(),
      bucketKeyEnabled: json['BucketKeyEnabled'] as bool?,
      cannedAccessControlList: (json['CannedAccessControlList'] as String?)
          ?.toS3CannedAccessControlList(),
      metadataDirective:
          (json['MetadataDirective'] as String?)?.toS3MetadataDirective(),
      modifiedSinceConstraint:
          timeStampFromJson(json['ModifiedSinceConstraint']),
      newObjectMetadata: json['NewObjectMetadata'] != null
          ? S3ObjectMetadata.fromJson(
              json['NewObjectMetadata'] as Map<String, dynamic>)
          : null,
      newObjectTagging: (json['NewObjectTagging'] as List?)
          ?.whereNotNull()
          .map((e) => S3Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      objectLockLegalHoldStatus: (json['ObjectLockLegalHoldStatus'] as String?)
          ?.toS3ObjectLockLegalHoldStatus(),
      objectLockMode: (json['ObjectLockMode'] as String?)?.toS3ObjectLockMode(),
      objectLockRetainUntilDate:
          timeStampFromJson(json['ObjectLockRetainUntilDate']),
      redirectLocation: json['RedirectLocation'] as String?,
      requesterPays: json['RequesterPays'] as bool?,
      sSEAwsKmsKeyId: json['SSEAwsKmsKeyId'] as String?,
      storageClass: (json['StorageClass'] as String?)?.toS3StorageClass(),
      targetKeyPrefix: json['TargetKeyPrefix'] as String?,
      targetResource: json['TargetResource'] as String?,
      unModifiedSinceConstraint:
          timeStampFromJson(json['UnModifiedSinceConstraint']),
    );
  }

  factory S3CopyObjectOperation.fromXml(_s.XmlElement elem) {
    return S3CopyObjectOperation(
      accessControlGrants: _s.extractXmlChild(elem, 'AccessControlGrants')?.let(
          (elem) => elem
              .findElements('member')
              .map((c) => S3Grant.fromXml(c))
              .toList()),
      bucketKeyEnabled: _s.extractXmlBoolValue(elem, 'BucketKeyEnabled'),
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

  Map<String, dynamic> toJson() {
    final accessControlGrants = this.accessControlGrants;
    final bucketKeyEnabled = this.bucketKeyEnabled;
    final cannedAccessControlList = this.cannedAccessControlList;
    final metadataDirective = this.metadataDirective;
    final modifiedSinceConstraint = this.modifiedSinceConstraint;
    final newObjectMetadata = this.newObjectMetadata;
    final newObjectTagging = this.newObjectTagging;
    final objectLockLegalHoldStatus = this.objectLockLegalHoldStatus;
    final objectLockMode = this.objectLockMode;
    final objectLockRetainUntilDate = this.objectLockRetainUntilDate;
    final redirectLocation = this.redirectLocation;
    final requesterPays = this.requesterPays;
    final sSEAwsKmsKeyId = this.sSEAwsKmsKeyId;
    final storageClass = this.storageClass;
    final targetKeyPrefix = this.targetKeyPrefix;
    final targetResource = this.targetResource;
    final unModifiedSinceConstraint = this.unModifiedSinceConstraint;
    return {
      if (accessControlGrants != null)
        'AccessControlGrants': accessControlGrants,
      if (bucketKeyEnabled != null) 'BucketKeyEnabled': bucketKeyEnabled,
      if (cannedAccessControlList != null)
        'CannedAccessControlList': cannedAccessControlList.toValue(),
      if (metadataDirective != null)
        'MetadataDirective': metadataDirective.toValue(),
      if (modifiedSinceConstraint != null)
        'ModifiedSinceConstraint': unixTimestampToJson(modifiedSinceConstraint),
      if (newObjectMetadata != null) 'NewObjectMetadata': newObjectMetadata,
      if (newObjectTagging != null) 'NewObjectTagging': newObjectTagging,
      if (objectLockLegalHoldStatus != null)
        'ObjectLockLegalHoldStatus': objectLockLegalHoldStatus.toValue(),
      if (objectLockMode != null) 'ObjectLockMode': objectLockMode.toValue(),
      if (objectLockRetainUntilDate != null)
        'ObjectLockRetainUntilDate':
            unixTimestampToJson(objectLockRetainUntilDate),
      if (redirectLocation != null) 'RedirectLocation': redirectLocation,
      if (requesterPays != null) 'RequesterPays': requesterPays,
      if (sSEAwsKmsKeyId != null) 'SSEAwsKmsKeyId': sSEAwsKmsKeyId,
      if (storageClass != null) 'StorageClass': storageClass.toValue(),
      if (targetKeyPrefix != null) 'TargetKeyPrefix': targetKeyPrefix,
      if (targetResource != null) 'TargetResource': targetResource,
      if (unModifiedSinceConstraint != null)
        'UnModifiedSinceConstraint':
            unixTimestampToJson(unModifiedSinceConstraint),
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final accessControlGrants = this.accessControlGrants;
    final bucketKeyEnabled = this.bucketKeyEnabled;
    final cannedAccessControlList = this.cannedAccessControlList;
    final metadataDirective = this.metadataDirective;
    final modifiedSinceConstraint = this.modifiedSinceConstraint;
    final newObjectMetadata = this.newObjectMetadata;
    final newObjectTagging = this.newObjectTagging;
    final objectLockLegalHoldStatus = this.objectLockLegalHoldStatus;
    final objectLockMode = this.objectLockMode;
    final objectLockRetainUntilDate = this.objectLockRetainUntilDate;
    final redirectLocation = this.redirectLocation;
    final requesterPays = this.requesterPays;
    final sSEAwsKmsKeyId = this.sSEAwsKmsKeyId;
    final storageClass = this.storageClass;
    final targetKeyPrefix = this.targetKeyPrefix;
    final targetResource = this.targetResource;
    final unModifiedSinceConstraint = this.unModifiedSinceConstraint;
    final $children = <_s.XmlNode>[
      if (targetResource != null)
        _s.encodeXmlStringValue('TargetResource', targetResource),
      if (cannedAccessControlList != null)
        _s.encodeXmlStringValue(
            'CannedAccessControlList', cannedAccessControlList.toValue()),
      if (accessControlGrants != null)
        _s.XmlElement(_s.XmlName('AccessControlGrants'), [],
            accessControlGrants.map((e) => e.toXml('member'))),
      if (metadataDirective != null)
        _s.encodeXmlStringValue(
            'MetadataDirective', metadataDirective.toValue()),
      if (modifiedSinceConstraint != null)
        _s.encodeXmlDateTimeValue(
            'ModifiedSinceConstraint', modifiedSinceConstraint),
      if (newObjectMetadata != null)
        newObjectMetadata.toXml('NewObjectMetadata'),
      if (newObjectTagging != null)
        _s.XmlElement(_s.XmlName('NewObjectTagging'), [],
            newObjectTagging.map((e) => e.toXml('member'))),
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
      if (bucketKeyEnabled != null)
        _s.encodeXmlBoolValue('BucketKeyEnabled', bucketKeyEnabled),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// Contains no configuration parameters because the DELETE Object tagging API
/// only accepts the bucket name and key name as parameters, which are defined
/// in the job's manifest.
class S3DeleteObjectTaggingOperation {
  S3DeleteObjectTaggingOperation();

  factory S3DeleteObjectTaggingOperation.fromJson(Map<String, dynamic> _) {
    return S3DeleteObjectTaggingOperation();
  }

  factory S3DeleteObjectTaggingOperation.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return S3DeleteObjectTaggingOperation();
  }

  Map<String, dynamic> toJson() {
    return {};
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final $children = <_s.XmlNode>[];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
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
    throw Exception('$this is not known in enum S3GlacierJobTier');
  }
}

/// <p/>
class S3Grant {
  /// <p/>
  final S3Grantee? grantee;

  /// <p/>
  final S3Permission? permission;

  S3Grant({
    this.grantee,
    this.permission,
  });

  factory S3Grant.fromJson(Map<String, dynamic> json) {
    return S3Grant(
      grantee: json['Grantee'] != null
          ? S3Grantee.fromJson(json['Grantee'] as Map<String, dynamic>)
          : null,
      permission: (json['Permission'] as String?)?.toS3Permission(),
    );
  }

  factory S3Grant.fromXml(_s.XmlElement elem) {
    return S3Grant(
      grantee:
          _s.extractXmlChild(elem, 'Grantee')?.let((e) => S3Grantee.fromXml(e)),
      permission:
          _s.extractXmlStringValue(elem, 'Permission')?.toS3Permission(),
    );
  }

  Map<String, dynamic> toJson() {
    final grantee = this.grantee;
    final permission = this.permission;
    return {
      if (grantee != null) 'Grantee': grantee,
      if (permission != null) 'Permission': permission.toValue(),
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final grantee = this.grantee;
    final permission = this.permission;
    final $children = <_s.XmlNode>[
      if (grantee != null) grantee.toXml('Grantee'),
      if (permission != null)
        _s.encodeXmlStringValue('Permission', permission.toValue()),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// <p/>
class S3Grantee {
  /// <p/>
  final String? displayName;

  /// <p/>
  final String? identifier;

  /// <p/>
  final S3GranteeTypeIdentifier? typeIdentifier;

  S3Grantee({
    this.displayName,
    this.identifier,
    this.typeIdentifier,
  });

  factory S3Grantee.fromJson(Map<String, dynamic> json) {
    return S3Grantee(
      displayName: json['DisplayName'] as String?,
      identifier: json['Identifier'] as String?,
      typeIdentifier:
          (json['TypeIdentifier'] as String?)?.toS3GranteeTypeIdentifier(),
    );
  }

  factory S3Grantee.fromXml(_s.XmlElement elem) {
    return S3Grantee(
      displayName: _s.extractXmlStringValue(elem, 'DisplayName'),
      identifier: _s.extractXmlStringValue(elem, 'Identifier'),
      typeIdentifier: _s
          .extractXmlStringValue(elem, 'TypeIdentifier')
          ?.toS3GranteeTypeIdentifier(),
    );
  }

  Map<String, dynamic> toJson() {
    final displayName = this.displayName;
    final identifier = this.identifier;
    final typeIdentifier = this.typeIdentifier;
    return {
      if (displayName != null) 'DisplayName': displayName,
      if (identifier != null) 'Identifier': identifier,
      if (typeIdentifier != null) 'TypeIdentifier': typeIdentifier.toValue(),
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final displayName = this.displayName;
    final identifier = this.identifier;
    final typeIdentifier = this.typeIdentifier;
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
      $children,
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
    throw Exception('$this is not known in enum S3GranteeTypeIdentifier');
  }
}

/// Contains the configuration parameters for an S3 Initiate Restore Object job.
/// S3 Batch Operations passes every object to the underlying POST Object
/// restore API. For more information about the parameters for this operation,
/// see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTObjectPOSTrestore.html#RESTObjectPOSTrestore-restore-request">RestoreObject</a>.
class S3InitiateRestoreObjectOperation {
  /// This argument specifies how long the S3 Glacier or S3 Glacier Deep Archive
  /// object remains available in Amazon S3. S3 Initiate Restore Object jobs that
  /// target S3 Glacier and S3 Glacier Deep Archive objects require
  /// <code>ExpirationInDays</code> set to 1 or greater.
  ///
  /// Conversely, do <i>not</i> set <code>ExpirationInDays</code> when creating S3
  /// Initiate Restore Object jobs that target S3 Intelligent-Tiering Archive
  /// Access and Deep Archive Access tier objects. Objects in S3
  /// Intelligent-Tiering archive access tiers are not subject to restore expiry,
  /// so specifying <code>ExpirationInDays</code> results in restore request
  /// failure.
  ///
  /// S3 Batch Operations jobs can operate either on S3 Glacier and S3 Glacier
  /// Deep Archive storage class objects or on S3 Intelligent-Tiering Archive
  /// Access and Deep Archive Access storage tier objects, but not both types in
  /// the same job. If you need to restore objects of both types you <i>must</i>
  /// create separate Batch Operations jobs.
  final int? expirationInDays;

  /// S3 Batch Operations supports <code>STANDARD</code> and <code>BULK</code>
  /// retrieval tiers, but not the <code>EXPEDITED</code> retrieval tier.
  final S3GlacierJobTier? glacierJobTier;

  S3InitiateRestoreObjectOperation({
    this.expirationInDays,
    this.glacierJobTier,
  });

  factory S3InitiateRestoreObjectOperation.fromJson(Map<String, dynamic> json) {
    return S3InitiateRestoreObjectOperation(
      expirationInDays: json['ExpirationInDays'] as int?,
      glacierJobTier: (json['GlacierJobTier'] as String?)?.toS3GlacierJobTier(),
    );
  }

  factory S3InitiateRestoreObjectOperation.fromXml(_s.XmlElement elem) {
    return S3InitiateRestoreObjectOperation(
      expirationInDays: _s.extractXmlIntValue(elem, 'ExpirationInDays'),
      glacierJobTier: _s
          .extractXmlStringValue(elem, 'GlacierJobTier')
          ?.toS3GlacierJobTier(),
    );
  }

  Map<String, dynamic> toJson() {
    final expirationInDays = this.expirationInDays;
    final glacierJobTier = this.glacierJobTier;
    return {
      if (expirationInDays != null) 'ExpirationInDays': expirationInDays,
      if (glacierJobTier != null) 'GlacierJobTier': glacierJobTier.toValue(),
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final expirationInDays = this.expirationInDays;
    final glacierJobTier = this.glacierJobTier;
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
      $children,
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
    throw Exception('$this is not known in enum S3MetadataDirective');
  }
}

/// Whether S3 Object Lock legal hold will be applied to objects in an S3 Batch
/// Operations job.
class S3ObjectLockLegalHold {
  /// The Object Lock legal hold status to be applied to all objects in the Batch
  /// Operations job.
  final S3ObjectLockLegalHoldStatus status;

  S3ObjectLockLegalHold({
    required this.status,
  });

  factory S3ObjectLockLegalHold.fromJson(Map<String, dynamic> json) {
    return S3ObjectLockLegalHold(
      status: (json['Status'] as String).toS3ObjectLockLegalHoldStatus(),
    );
  }

  factory S3ObjectLockLegalHold.fromXml(_s.XmlElement elem) {
    return S3ObjectLockLegalHold(
      status: _s
          .extractXmlStringValue(elem, 'Status')!
          .toS3ObjectLockLegalHoldStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'Status': status.toValue(),
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final status = this.status;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Status', status.toValue()),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
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
    throw Exception('$this is not known in enum S3ObjectLockLegalHoldStatus');
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
    throw Exception('$this is not known in enum S3ObjectLockMode');
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
    throw Exception('$this is not known in enum S3ObjectLockRetentionMode');
  }
}

/// <p/>
class S3ObjectMetadata {
  /// <p/>
  final String? cacheControl;

  /// <p/>
  final String? contentDisposition;

  /// <p/>
  final String? contentEncoding;

  /// <p/>
  final String? contentLanguage;

  /// <p/>
  final int? contentLength;

  /// <p/>
  final String? contentMD5;

  /// <p/>
  final String? contentType;

  /// <p/>
  final DateTime? httpExpiresDate;

  /// <p/>
  final bool? requesterCharged;

  /// <p/>
  final S3SSEAlgorithm? sSEAlgorithm;

  /// <p/>
  final Map<String, String>? userMetadata;

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

  factory S3ObjectMetadata.fromJson(Map<String, dynamic> json) {
    return S3ObjectMetadata(
      cacheControl: json['CacheControl'] as String?,
      contentDisposition: json['ContentDisposition'] as String?,
      contentEncoding: json['ContentEncoding'] as String?,
      contentLanguage: json['ContentLanguage'] as String?,
      contentLength: json['ContentLength'] as int?,
      contentMD5: json['ContentMD5'] as String?,
      contentType: json['ContentType'] as String?,
      httpExpiresDate: timeStampFromJson(json['HttpExpiresDate']),
      requesterCharged: json['RequesterCharged'] as bool?,
      sSEAlgorithm: (json['SSEAlgorithm'] as String?)?.toS3SSEAlgorithm(),
      userMetadata: (json['UserMetadata'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

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
        elem.getElement('UserMetadata')?.findElements('entry').map(
                  (c) => MapEntry(
                    _s.extractXmlStringValue(c, 'key')!,
                    _s.extractXmlStringValue(c, 'value')!,
                  ),
                ) ??
            {},
      ),
    );
  }

  Map<String, dynamic> toJson() {
    final cacheControl = this.cacheControl;
    final contentDisposition = this.contentDisposition;
    final contentEncoding = this.contentEncoding;
    final contentLanguage = this.contentLanguage;
    final contentLength = this.contentLength;
    final contentMD5 = this.contentMD5;
    final contentType = this.contentType;
    final httpExpiresDate = this.httpExpiresDate;
    final requesterCharged = this.requesterCharged;
    final sSEAlgorithm = this.sSEAlgorithm;
    final userMetadata = this.userMetadata;
    return {
      if (cacheControl != null) 'CacheControl': cacheControl,
      if (contentDisposition != null) 'ContentDisposition': contentDisposition,
      if (contentEncoding != null) 'ContentEncoding': contentEncoding,
      if (contentLanguage != null) 'ContentLanguage': contentLanguage,
      if (contentLength != null) 'ContentLength': contentLength,
      if (contentMD5 != null) 'ContentMD5': contentMD5,
      if (contentType != null) 'ContentType': contentType,
      if (httpExpiresDate != null)
        'HttpExpiresDate': unixTimestampToJson(httpExpiresDate),
      if (requesterCharged != null) 'RequesterCharged': requesterCharged,
      if (sSEAlgorithm != null) 'SSEAlgorithm': sSEAlgorithm.toValue(),
      if (userMetadata != null) 'UserMetadata': userMetadata,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final cacheControl = this.cacheControl;
    final contentDisposition = this.contentDisposition;
    final contentEncoding = this.contentEncoding;
    final contentLanguage = this.contentLanguage;
    final contentLength = this.contentLength;
    final contentMD5 = this.contentMD5;
    final contentType = this.contentType;
    final httpExpiresDate = this.httpExpiresDate;
    final requesterCharged = this.requesterCharged;
    final sSEAlgorithm = this.sSEAlgorithm;
    final userMetadata = this.userMetadata;
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
      $children,
    );
  }
}

/// <p/>
class S3ObjectOwner {
  /// <p/>
  final String? displayName;

  /// <p/>
  final String? id;

  S3ObjectOwner({
    this.displayName,
    this.id,
  });

  factory S3ObjectOwner.fromJson(Map<String, dynamic> json) {
    return S3ObjectOwner(
      displayName: json['DisplayName'] as String?,
      id: json['ID'] as String?,
    );
  }

  factory S3ObjectOwner.fromXml(_s.XmlElement elem) {
    return S3ObjectOwner(
      displayName: _s.extractXmlStringValue(elem, 'DisplayName'),
      id: _s.extractXmlStringValue(elem, 'ID'),
    );
  }

  Map<String, dynamic> toJson() {
    final displayName = this.displayName;
    final id = this.id;
    return {
      if (displayName != null) 'DisplayName': displayName,
      if (id != null) 'ID': id,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final displayName = this.displayName;
    final id = this.id;
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
      $children,
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
    throw Exception('$this is not known in enum S3Permission');
  }
}

/// Contains the S3 Object Lock retention mode to be applied to all objects in
/// the S3 Batch Operations job. If you don't provide <code>Mode</code> and
/// <code>RetainUntilDate</code> data types in your operation, you will remove
/// the retention from your objects. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/batch-ops-retention-date.html">Using
/// S3 Object Lock retention with S3 Batch Operations</a> in the <i>Amazon S3
/// User Guide</i>.
class S3Retention {
  /// The Object Lock retention mode to be applied to all objects in the Batch
  /// Operations job.
  final S3ObjectLockRetentionMode? mode;

  /// The date when the applied Object Lock retention will expire on all objects
  /// set by the Batch Operations job.
  final DateTime? retainUntilDate;

  S3Retention({
    this.mode,
    this.retainUntilDate,
  });

  factory S3Retention.fromJson(Map<String, dynamic> json) {
    return S3Retention(
      mode: (json['Mode'] as String?)?.toS3ObjectLockRetentionMode(),
      retainUntilDate: timeStampFromJson(json['RetainUntilDate']),
    );
  }

  factory S3Retention.fromXml(_s.XmlElement elem) {
    return S3Retention(
      mode:
          _s.extractXmlStringValue(elem, 'Mode')?.toS3ObjectLockRetentionMode(),
      retainUntilDate: _s.extractXmlDateTimeValue(elem, 'RetainUntilDate'),
    );
  }

  Map<String, dynamic> toJson() {
    final mode = this.mode;
    final retainUntilDate = this.retainUntilDate;
    return {
      if (mode != null) 'Mode': mode.toValue(),
      if (retainUntilDate != null)
        'RetainUntilDate': unixTimestampToJson(retainUntilDate),
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final mode = this.mode;
    final retainUntilDate = this.retainUntilDate;
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
      $children,
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
    throw Exception('$this is not known in enum S3SSEAlgorithm');
  }
}

/// Contains the configuration parameters for a Set Object ACL operation. S3
/// Batch Operations passes every object to the underlying PUT Object acl API.
/// For more information about the parameters for this operation, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTObjectPUTacl.html">PUT
/// Object acl</a>.
class S3SetObjectAclOperation {
  /// <p/>
  final S3AccessControlPolicy? accessControlPolicy;

  S3SetObjectAclOperation({
    this.accessControlPolicy,
  });

  factory S3SetObjectAclOperation.fromJson(Map<String, dynamic> json) {
    return S3SetObjectAclOperation(
      accessControlPolicy: json['AccessControlPolicy'] != null
          ? S3AccessControlPolicy.fromJson(
              json['AccessControlPolicy'] as Map<String, dynamic>)
          : null,
    );
  }

  factory S3SetObjectAclOperation.fromXml(_s.XmlElement elem) {
    return S3SetObjectAclOperation(
      accessControlPolicy: _s
          .extractXmlChild(elem, 'AccessControlPolicy')
          ?.let((e) => S3AccessControlPolicy.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final accessControlPolicy = this.accessControlPolicy;
    return {
      if (accessControlPolicy != null)
        'AccessControlPolicy': accessControlPolicy,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final accessControlPolicy = this.accessControlPolicy;
    final $children = <_s.XmlNode>[
      if (accessControlPolicy != null)
        accessControlPolicy.toXml('AccessControlPolicy'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// Contains the configuration for an S3 Object Lock legal hold operation that
/// an S3 Batch Operations job passes every object to the underlying
/// <code>PutObjectLegalHold</code> API. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/batch-ops-legal-hold.html">Using
/// S3 Object Lock legal hold with S3 Batch Operations</a> in the <i>Amazon S3
/// User Guide</i>.
class S3SetObjectLegalHoldOperation {
  /// Contains the Object Lock legal hold status to be applied to all objects in
  /// the Batch Operations job.
  final S3ObjectLockLegalHold legalHold;

  S3SetObjectLegalHoldOperation({
    required this.legalHold,
  });

  factory S3SetObjectLegalHoldOperation.fromJson(Map<String, dynamic> json) {
    return S3SetObjectLegalHoldOperation(
      legalHold: S3ObjectLockLegalHold.fromJson(
          json['LegalHold'] as Map<String, dynamic>),
    );
  }

  factory S3SetObjectLegalHoldOperation.fromXml(_s.XmlElement elem) {
    return S3SetObjectLegalHoldOperation(
      legalHold:
          S3ObjectLockLegalHold.fromXml(_s.extractXmlChild(elem, 'LegalHold')!),
    );
  }

  Map<String, dynamic> toJson() {
    final legalHold = this.legalHold;
    return {
      'LegalHold': legalHold,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final legalHold = this.legalHold;
    final $children = <_s.XmlNode>[
      legalHold.toXml('LegalHold'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// Contains the configuration parameters for the Object Lock retention action
/// for an S3 Batch Operations job. Batch Operations passes every object to the
/// underlying <code>PutObjectRetention</code> API. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/batch-ops-retention-date.html">Using
/// S3 Object Lock retention with S3 Batch Operations</a> in the <i>Amazon S3
/// User Guide</i>.
class S3SetObjectRetentionOperation {
  /// Contains the Object Lock retention mode to be applied to all objects in the
  /// Batch Operations job. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/batch-ops-retention-date.html">Using
  /// S3 Object Lock retention with S3 Batch Operations</a> in the <i>Amazon S3
  /// User Guide</i>.
  final S3Retention retention;

  /// Indicates if the action should be applied to objects in the Batch Operations
  /// job even if they have Object Lock <code> GOVERNANCE</code> type in place.
  final bool? bypassGovernanceRetention;

  S3SetObjectRetentionOperation({
    required this.retention,
    this.bypassGovernanceRetention,
  });

  factory S3SetObjectRetentionOperation.fromJson(Map<String, dynamic> json) {
    return S3SetObjectRetentionOperation(
      retention:
          S3Retention.fromJson(json['Retention'] as Map<String, dynamic>),
      bypassGovernanceRetention: json['BypassGovernanceRetention'] as bool?,
    );
  }

  factory S3SetObjectRetentionOperation.fromXml(_s.XmlElement elem) {
    return S3SetObjectRetentionOperation(
      retention: S3Retention.fromXml(_s.extractXmlChild(elem, 'Retention')!),
      bypassGovernanceRetention:
          _s.extractXmlBoolValue(elem, 'BypassGovernanceRetention'),
    );
  }

  Map<String, dynamic> toJson() {
    final retention = this.retention;
    final bypassGovernanceRetention = this.bypassGovernanceRetention;
    return {
      'Retention': retention,
      if (bypassGovernanceRetention != null)
        'BypassGovernanceRetention': bypassGovernanceRetention,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final retention = this.retention;
    final bypassGovernanceRetention = this.bypassGovernanceRetention;
    final $children = <_s.XmlNode>[
      if (bypassGovernanceRetention != null)
        _s.encodeXmlBoolValue(
            'BypassGovernanceRetention', bypassGovernanceRetention),
      retention.toXml('Retention'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// Contains the configuration parameters for a Set Object Tagging operation. S3
/// Batch Operations passes every object to the underlying PUT Object tagging
/// API. For more information about the parameters for this operation, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTObjectPUTtagging.html">PUT
/// Object tagging</a>.
class S3SetObjectTaggingOperation {
  /// <p/>
  final List<S3Tag>? tagSet;

  S3SetObjectTaggingOperation({
    this.tagSet,
  });

  factory S3SetObjectTaggingOperation.fromJson(Map<String, dynamic> json) {
    return S3SetObjectTaggingOperation(
      tagSet: (json['TagSet'] as List?)
          ?.whereNotNull()
          .map((e) => S3Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  factory S3SetObjectTaggingOperation.fromXml(_s.XmlElement elem) {
    return S3SetObjectTaggingOperation(
      tagSet: _s.extractXmlChild(elem, 'TagSet')?.let((elem) =>
          elem.findElements('member').map((c) => S3Tag.fromXml(c)).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final tagSet = this.tagSet;
    return {
      if (tagSet != null) 'TagSet': tagSet,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final tagSet = this.tagSet;
    final $children = <_s.XmlNode>[
      if (tagSet != null)
        _s.XmlElement(
            _s.XmlName('TagSet'), [], tagSet.map((e) => e.toXml('member'))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
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
    throw Exception('$this is not known in enum S3StorageClass');
  }
}

/// <p/>
class S3Tag {
  /// <p/>
  final String key;

  /// <p/>
  final String value;

  S3Tag({
    required this.key,
    required this.value,
  });

  factory S3Tag.fromJson(Map<String, dynamic> json) {
    return S3Tag(
      key: json['Key'] as String,
      value: json['Value'] as String,
    );
  }

  factory S3Tag.fromXml(_s.XmlElement elem) {
    return S3Tag(
      key: _s.extractXmlStringValue(elem, 'Key')!,
      value: _s.extractXmlStringValue(elem, 'Value')!,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'Key': key,
      'Value': value,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final key = this.key;
    final value = this.value;
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
      $children,
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
    required this.keyId,
  });

  factory SSEKMS.fromJson(Map<String, dynamic> json) {
    return SSEKMS(
      keyId: json['KeyId'] as String,
    );
  }

  factory SSEKMS.fromXml(_s.XmlElement elem) {
    return SSEKMS(
      keyId: _s.extractXmlStringValue(elem, 'KeyId')!,
    );
  }

  Map<String, dynamic> toJson() {
    final keyId = this.keyId;
    return {
      'KeyId': keyId,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final keyId = this.keyId;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('KeyId', keyId),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// <p/>
class SSES3 {
  SSES3();

  factory SSES3.fromJson(Map<String, dynamic> _) {
    return SSES3();
  }

  factory SSES3.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return SSES3();
  }

  Map<String, dynamic> toJson() {
    return {};
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final $children = <_s.XmlNode>[];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// <p/>
class SelectionCriteria {
  /// A container for the delimiter of the selection criteria being used.
  final String? delimiter;

  /// The max depth of the selection criteria
  final int? maxDepth;

  /// The minimum number of storage bytes percentage whose metrics will be
  /// selected.
  /// <note>
  /// You must choose a value greater than or equal to <code>1.0</code>.
  /// </note>
  final double? minStorageBytesPercentage;

  SelectionCriteria({
    this.delimiter,
    this.maxDepth,
    this.minStorageBytesPercentage,
  });

  factory SelectionCriteria.fromJson(Map<String, dynamic> json) {
    return SelectionCriteria(
      delimiter: json['Delimiter'] as String?,
      maxDepth: json['MaxDepth'] as int?,
      minStorageBytesPercentage: json['MinStorageBytesPercentage'] as double?,
    );
  }

  factory SelectionCriteria.fromXml(_s.XmlElement elem) {
    return SelectionCriteria(
      delimiter: _s.extractXmlStringValue(elem, 'Delimiter'),
      maxDepth: _s.extractXmlIntValue(elem, 'MaxDepth'),
      minStorageBytesPercentage:
          _s.extractXmlDoubleValue(elem, 'MinStorageBytesPercentage'),
    );
  }

  Map<String, dynamic> toJson() {
    final delimiter = this.delimiter;
    final maxDepth = this.maxDepth;
    final minStorageBytesPercentage = this.minStorageBytesPercentage;
    return {
      if (delimiter != null) 'Delimiter': delimiter,
      if (maxDepth != null) 'MaxDepth': maxDepth,
      if (minStorageBytesPercentage != null)
        'MinStorageBytesPercentage': minStorageBytesPercentage,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final delimiter = this.delimiter;
    final maxDepth = this.maxDepth;
    final minStorageBytesPercentage = this.minStorageBytesPercentage;
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
      $children,
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
    required this.arn,
  });

  factory StorageLensAwsOrg.fromJson(Map<String, dynamic> json) {
    return StorageLensAwsOrg(
      arn: json['Arn'] as String,
    );
  }

  factory StorageLensAwsOrg.fromXml(_s.XmlElement elem) {
    return StorageLensAwsOrg(
      arn: _s.extractXmlStringValue(elem, 'Arn')!,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      'Arn': arn,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final arn = this.arn;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Arn', arn),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
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
  final StorageLensAwsOrg? awsOrg;

  /// A container to specify the properties of your S3 Storage Lens metrics export
  /// including, the destination, schema and format.
  final StorageLensDataExport? dataExport;

  /// A container for what is excluded in this configuration. This container can
  /// only be valid if there is no <code>Include</code> container submitted, and
  /// it's not empty.
  final Exclude? exclude;

  /// A container for what is included in this configuration. This container can
  /// only be valid if there is no <code>Exclude</code> container submitted, and
  /// it's not empty.
  final Include? include;

  /// The Amazon Resource Name (ARN) of the S3 Storage Lens configuration. This
  /// property is read-only and follows the following format: <code>
  /// arn:aws:s3:<i>us-east-1</i>:<i>example-account-id</i>:storage-lens/<i>your-dashboard-name</i>
  /// </code>
  final String? storageLensArn;

  StorageLensConfiguration({
    required this.accountLevel,
    required this.id,
    required this.isEnabled,
    this.awsOrg,
    this.dataExport,
    this.exclude,
    this.include,
    this.storageLensArn,
  });

  factory StorageLensConfiguration.fromJson(Map<String, dynamic> json) {
    return StorageLensConfiguration(
      accountLevel:
          AccountLevel.fromJson(json['AccountLevel'] as Map<String, dynamic>),
      id: json['Id'] as String,
      isEnabled: json['IsEnabled'] as bool,
      awsOrg: json['AwsOrg'] != null
          ? StorageLensAwsOrg.fromJson(json['AwsOrg'] as Map<String, dynamic>)
          : null,
      dataExport: json['DataExport'] != null
          ? StorageLensDataExport.fromJson(
              json['DataExport'] as Map<String, dynamic>)
          : null,
      exclude: json['Exclude'] != null
          ? Exclude.fromJson(json['Exclude'] as Map<String, dynamic>)
          : null,
      include: json['Include'] != null
          ? Include.fromJson(json['Include'] as Map<String, dynamic>)
          : null,
      storageLensArn: json['StorageLensArn'] as String?,
    );
  }

  factory StorageLensConfiguration.fromXml(_s.XmlElement elem) {
    return StorageLensConfiguration(
      accountLevel:
          AccountLevel.fromXml(_s.extractXmlChild(elem, 'AccountLevel')!),
      id: _s.extractXmlStringValue(elem, 'Id')!,
      isEnabled: _s.extractXmlBoolValue(elem, 'IsEnabled')!,
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

  Map<String, dynamic> toJson() {
    final accountLevel = this.accountLevel;
    final id = this.id;
    final isEnabled = this.isEnabled;
    final awsOrg = this.awsOrg;
    final dataExport = this.dataExport;
    final exclude = this.exclude;
    final include = this.include;
    final storageLensArn = this.storageLensArn;
    return {
      'AccountLevel': accountLevel,
      'Id': id,
      'IsEnabled': isEnabled,
      if (awsOrg != null) 'AwsOrg': awsOrg,
      if (dataExport != null) 'DataExport': dataExport,
      if (exclude != null) 'Exclude': exclude,
      if (include != null) 'Include': include,
      if (storageLensArn != null) 'StorageLensArn': storageLensArn,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final accountLevel = this.accountLevel;
    final id = this.id;
    final isEnabled = this.isEnabled;
    final awsOrg = this.awsOrg;
    final dataExport = this.dataExport;
    final exclude = this.exclude;
    final include = this.include;
    final storageLensArn = this.storageLensArn;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Id', id),
      accountLevel.toXml('AccountLevel'),
      if (include != null) include.toXml('Include'),
      if (exclude != null) exclude.toXml('Exclude'),
      if (dataExport != null) dataExport.toXml('DataExport'),
      _s.encodeXmlBoolValue('IsEnabled', isEnabled),
      if (awsOrg != null) awsOrg.toXml('AwsOrg'),
      if (storageLensArn != null)
        _s.encodeXmlStringValue('StorageLensArn', storageLensArn),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// A container to specify the properties of your S3 Storage Lens metrics
/// export, including the destination, schema, and format.
class StorageLensDataExport {
  /// A container for the bucket where the S3 Storage Lens metrics export will be
  /// located.
  /// <note>
  /// This bucket must be located in the same Region as the storage lens
  /// configuration.
  /// </note>
  final S3BucketDestination s3BucketDestination;

  StorageLensDataExport({
    required this.s3BucketDestination,
  });

  factory StorageLensDataExport.fromJson(Map<String, dynamic> json) {
    return StorageLensDataExport(
      s3BucketDestination: S3BucketDestination.fromJson(
          json['S3BucketDestination'] as Map<String, dynamic>),
    );
  }

  factory StorageLensDataExport.fromXml(_s.XmlElement elem) {
    return StorageLensDataExport(
      s3BucketDestination: S3BucketDestination.fromXml(
          _s.extractXmlChild(elem, 'S3BucketDestination')!),
    );
  }

  Map<String, dynamic> toJson() {
    final s3BucketDestination = this.s3BucketDestination;
    return {
      'S3BucketDestination': s3BucketDestination,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final s3BucketDestination = this.s3BucketDestination;
    final $children = <_s.XmlNode>[
      s3BucketDestination.toXml('S3BucketDestination'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// A container for the encryption of the S3 Storage Lens metrics exports.
class StorageLensDataExportEncryption {
  /// <p/>
  final SSEKMS? ssekms;

  /// <p/>
  final SSES3? sses3;

  StorageLensDataExportEncryption({
    this.ssekms,
    this.sses3,
  });

  factory StorageLensDataExportEncryption.fromJson(Map<String, dynamic> json) {
    return StorageLensDataExportEncryption(
      ssekms: json['SSE-KMS'] != null
          ? SSEKMS.fromJson(json['SSE-KMS'] as Map<String, dynamic>)
          : null,
      sses3: json['SSE-S3'] != null
          ? SSES3.fromJson(json['SSE-S3'] as Map<String, dynamic>)
          : null,
    );
  }

  factory StorageLensDataExportEncryption.fromXml(_s.XmlElement elem) {
    return StorageLensDataExportEncryption(
      ssekms:
          _s.extractXmlChild(elem, 'SSE-KMS')?.let((e) => SSEKMS.fromXml(e)),
      sses3: _s.extractXmlChild(elem, 'SSE-S3')?.let((e) => SSES3.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final ssekms = this.ssekms;
    final sses3 = this.sses3;
    return {
      if (ssekms != null) 'SSE-KMS': ssekms,
      if (sses3 != null) 'SSE-S3': sses3,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final ssekms = this.ssekms;
    final sses3 = this.sses3;
    final $children = <_s.XmlNode>[
      if (sses3 != null) sses3.toXml('SSE-S3'),
      if (ssekms != null) ssekms.toXml('SSE-KMS'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
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
    required this.key,
    required this.value,
  });

  factory StorageLensTag.fromJson(Map<String, dynamic> json) {
    return StorageLensTag(
      key: json['Key'] as String,
      value: json['Value'] as String,
    );
  }

  factory StorageLensTag.fromXml(_s.XmlElement elem) {
    return StorageLensTag(
      key: _s.extractXmlStringValue(elem, 'Key')!,
      value: _s.extractXmlStringValue(elem, 'Value')!,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'Key': key,
      'Value': value,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final key = this.key;
    final value = this.value;
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
      $children,
    );
  }
}

/// <p/>
class Tagging {
  /// A collection for a set of tags.
  final List<S3Tag> tagSet;

  Tagging({
    required this.tagSet,
  });

  factory Tagging.fromJson(Map<String, dynamic> json) {
    return Tagging(
      tagSet: (json['TagSet'] as List)
          .whereNotNull()
          .map((e) => S3Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tagSet = this.tagSet;
    return {
      'TagSet': tagSet,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final tagSet = this.tagSet;
    final $children = <_s.XmlNode>[
      _s.XmlElement(
          _s.XmlName('TagSet'), [], tagSet.map((e) => e.toXml('member'))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// Specifies when an object transitions to a specified storage class. For more
/// information about Amazon S3 Lifecycle configuration rules, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/lifecycle-transition-general-considerations.html">
/// Transitioning objects using Amazon S3 Lifecycle</a> in the <i>Amazon S3 User
/// Guide</i>.
class Transition {
  /// Indicates when objects are transitioned to the specified storage class. The
  /// date value must be in ISO 8601 format. The time is always midnight UTC.
  final DateTime? date;

  /// Indicates the number of days after creation when objects are transitioned to
  /// the specified storage class. The value must be a positive integer.
  final int? days;

  /// The storage class to which you want the object to transition.
  final TransitionStorageClass? storageClass;

  Transition({
    this.date,
    this.days,
    this.storageClass,
  });

  factory Transition.fromJson(Map<String, dynamic> json) {
    return Transition(
      date: timeStampFromJson(json['Date']),
      days: json['Days'] as int?,
      storageClass:
          (json['StorageClass'] as String?)?.toTransitionStorageClass(),
    );
  }

  factory Transition.fromXml(_s.XmlElement elem) {
    return Transition(
      date: _s.extractXmlDateTimeValue(elem, 'Date'),
      days: _s.extractXmlIntValue(elem, 'Days'),
      storageClass: _s
          .extractXmlStringValue(elem, 'StorageClass')
          ?.toTransitionStorageClass(),
    );
  }

  Map<String, dynamic> toJson() {
    final date = this.date;
    final days = this.days;
    final storageClass = this.storageClass;
    return {
      if (date != null) 'Date': unixTimestampToJson(date),
      if (days != null) 'Days': days,
      if (storageClass != null) 'StorageClass': storageClass.toValue(),
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final date = this.date;
    final days = this.days;
    final storageClass = this.storageClass;
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
      $children,
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
    throw Exception('$this is not known in enum TransitionStorageClass');
  }
}

class UpdateJobPriorityResult {
  /// The ID for the job whose priority Amazon S3 updated.
  final String jobId;

  /// The new priority assigned to the specified job.
  final int priority;

  UpdateJobPriorityResult({
    required this.jobId,
    required this.priority,
  });

  factory UpdateJobPriorityResult.fromJson(Map<String, dynamic> json) {
    return UpdateJobPriorityResult(
      jobId: json['JobId'] as String,
      priority: json['Priority'] as int,
    );
  }

  factory UpdateJobPriorityResult.fromXml(_s.XmlElement elem) {
    return UpdateJobPriorityResult(
      jobId: _s.extractXmlStringValue(elem, 'JobId')!,
      priority: _s.extractXmlIntValue(elem, 'Priority')!,
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    final priority = this.priority;
    return {
      'JobId': jobId,
      'Priority': priority,
    };
  }
}

class UpdateJobStatusResult {
  /// The ID for the job whose status was updated.
  final String? jobId;

  /// The current status for the specified job.
  final JobStatus? status;

  /// The reason that the specified job's status was updated.
  final String? statusUpdateReason;

  UpdateJobStatusResult({
    this.jobId,
    this.status,
    this.statusUpdateReason,
  });

  factory UpdateJobStatusResult.fromJson(Map<String, dynamic> json) {
    return UpdateJobStatusResult(
      jobId: json['JobId'] as String?,
      status: (json['Status'] as String?)?.toJobStatus(),
      statusUpdateReason: json['StatusUpdateReason'] as String?,
    );
  }

  factory UpdateJobStatusResult.fromXml(_s.XmlElement elem) {
    return UpdateJobStatusResult(
      jobId: _s.extractXmlStringValue(elem, 'JobId'),
      status: _s.extractXmlStringValue(elem, 'Status')?.toJobStatus(),
      statusUpdateReason: _s.extractXmlStringValue(elem, 'StatusUpdateReason'),
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    final status = this.status;
    final statusUpdateReason = this.statusUpdateReason;
    return {
      if (jobId != null) 'JobId': jobId,
      if (status != null) 'Status': status.toValue(),
      if (statusUpdateReason != null) 'StatusUpdateReason': statusUpdateReason,
    };
  }
}

/// The virtual private cloud (VPC) configuration for an access point.
class VpcConfiguration {
  /// If this field is specified, this access point will only allow connections
  /// from the specified VPC ID.
  final String vpcId;

  VpcConfiguration({
    required this.vpcId,
  });

  factory VpcConfiguration.fromJson(Map<String, dynamic> json) {
    return VpcConfiguration(
      vpcId: json['VpcId'] as String,
    );
  }

  factory VpcConfiguration.fromXml(_s.XmlElement elem) {
    return VpcConfiguration(
      vpcId: _s.extractXmlStringValue(elem, 'VpcId')!,
    );
  }

  Map<String, dynamic> toJson() {
    final vpcId = this.vpcId;
    return {
      'VpcId': vpcId,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final vpcId = this.vpcId;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('VpcId', vpcId),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String? type, String? message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class BucketAlreadyExists extends _s.GenericAwsException {
  BucketAlreadyExists({String? type, String? message})
      : super(type: type, code: 'BucketAlreadyExists', message: message);
}

class BucketAlreadyOwnedByYou extends _s.GenericAwsException {
  BucketAlreadyOwnedByYou({String? type, String? message})
      : super(type: type, code: 'BucketAlreadyOwnedByYou', message: message);
}

class IdempotencyException extends _s.GenericAwsException {
  IdempotencyException({String? type, String? message})
      : super(type: type, code: 'IdempotencyException', message: message);
}

class InternalServiceException extends _s.GenericAwsException {
  InternalServiceException({String? type, String? message})
      : super(type: type, code: 'InternalServiceException', message: message);
}

class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String? type, String? message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class JobStatusException extends _s.GenericAwsException {
  JobStatusException({String? type, String? message})
      : super(type: type, code: 'JobStatusException', message: message);
}

class NoSuchPublicAccessBlockConfiguration extends _s.GenericAwsException {
  NoSuchPublicAccessBlockConfiguration({String? type, String? message})
      : super(
            type: type,
            code: 'NoSuchPublicAccessBlockConfiguration',
            message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String? type, String? message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String? type, String? message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String? type, String? message})
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
