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

/// Amazon Web Services S3 Control provides access to Amazon S3 control plane
/// actions.
class S3Control {
  final _s.RestXmlProtocol _protocol;
  S3Control({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
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
  /// the request. In addition, you must use an S3 on Outposts endpoint hostname
  /// prefix instead of <code>s3-control</code>. For an example of the request
  /// syntax for Amazon S3 on Outposts that uses the S3 on Outposts endpoint
  /// hostname prefix and the <code>x-amz-outpost-id</code> derived by using the
  /// access point ARN, see the <a
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
  /// The Amazon Web Services account ID for the account that owns the specified
  /// access point.
  ///
  /// Parameter [bucket] :
  /// The name of the bucket that you want to associate this access point with.
  ///
  /// For using this parameter with Amazon S3 on Outposts with the REST API, you
  /// must specify the name and the x-amz-outpost-id as well.
  ///
  /// For using this parameter with S3 on Outposts with the Amazon Web Services
  /// SDK and CLI, you must specify the ARN of the bucket accessed in the format
  /// <code>arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/bucket/&lt;my-bucket-name&gt;</code>.
  /// For example, to access the bucket <code>reports</code> through Outpost
  /// <code>my-outpost</code> owned by account <code>123456789012</code> in
  /// Region <code>us-west-2</code>, use the URL encoding of
  /// <code>arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/bucket/reports</code>.
  /// The value must be URL encoded.
  ///
  /// Parameter [name] :
  /// The name you want to assign to this access point.
  ///
  /// Parameter [bucketAccountId] :
  /// The Amazon Web Services account ID associated with the S3 bucket
  /// associated with this access point.
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
    String? bucketAccountId,
    PublicAccessBlockConfiguration? publicAccessBlockConfiguration,
    VpcConfiguration? vpcConfiguration,
  }) async {
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
              bucketAccountId: bucketAccountId,
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
  /// The Amazon Web Services account ID for owner of the specified Object
  /// Lambda Access Point.
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
  /// This ID is required by Amazon S3 on Outposts buckets.
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
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/batch-ops.html">S3
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
  /// The Amazon Web Services account ID that creates the job.
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
  /// The Amazon Resource Name (ARN) for the Identity and Access Management
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
  /// Parameter [manifest] :
  /// Configuration parameters for the manifest.
  ///
  /// Parameter [manifestGenerator] :
  /// The attribute container for the ManifestGenerator details. Jobs must be
  /// created with either a manifest file or a ManifestGenerator, but not both.
  ///
  /// Parameter [tags] :
  /// A set of tags to associate with the S3 Batch Operations job. This is an
  /// optional parameter.
  Future<CreateJobResult> createJob({
    required String accountId,
    required JobOperation operation,
    required int priority,
    required JobReport report,
    required String roleArn,
    String? clientRequestToken,
    bool? confirmationRequired,
    String? description,
    JobManifest? manifest,
    JobManifestGenerator? manifestGenerator,
    List<S3Tag>? tags,
  }) async {
    _s.validateNumRange(
      'priority',
      priority,
      0,
      2147483647,
      isRequired: true,
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
              operation: operation,
              priority: priority,
              report: report,
              roleArn: roleArn,
              clientRequestToken: clientRequestToken,
              confirmationRequired: confirmationRequired,
              description: description,
              manifest: manifest,
              manifestGenerator: manifestGenerator,
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

  /// Creates a Multi-Region Access Point and associates it with the specified
  /// buckets. For more information about creating Multi-Region Access Points,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/CreatingMultiRegionAccessPoints.html">Creating
  /// Multi-Region Access Points</a> in the <i>Amazon S3 User Guide</i>.
  ///
  /// This action will always be routed to the US West (Oregon) Region. For more
  /// information about the restrictions around managing Multi-Region Access
  /// Points, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/ManagingMultiRegionAccessPoints.html">Managing
  /// Multi-Region Access Points</a> in the <i>Amazon S3 User Guide</i>.
  ///
  /// This request is asynchronous, meaning that you might receive a response
  /// before the command has completed. When this request provides a response,
  /// it provides a token that you can use to monitor the status of the request
  /// with <code>DescribeMultiRegionAccessPointOperation</code>.
  ///
  /// The following actions are related to
  /// <code>CreateMultiRegionAccessPoint</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DeleteMultiRegionAccessPoint.html">DeleteMultiRegionAccessPoint</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DescribeMultiRegionAccessPointOperation.html">DescribeMultiRegionAccessPointOperation</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_GetMultiRegionAccessPoint.html">GetMultiRegionAccessPoint</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_ListMultiRegionAccessPoints.html">ListMultiRegionAccessPoints</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID for the owner of the Multi-Region
  /// Access Point. The owner of the Multi-Region Access Point also must own the
  /// underlying buckets.
  ///
  /// Parameter [details] :
  /// A container element containing details about the Multi-Region Access
  /// Point.
  ///
  /// Parameter [clientToken] :
  /// An idempotency token used to identify the request and guarantee that
  /// requests are unique.
  Future<CreateMultiRegionAccessPointResult> createMultiRegionAccessPoint({
    required String accountId,
    required CreateMultiRegionAccessPointInput details,
    String? clientToken,
  }) async {
    clientToken ??= _s.generateIdempotencyToken();
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    final $result = await _protocol.send(
      method: 'POST',
      requestUri: '/v20180820/async-requests/mrap/create',
      headers: headers,
      payload: CreateMultiRegionAccessPointRequest(
              accountId: accountId, details: details, clientToken: clientToken)
          .toXml(
        'CreateMultiRegionAccessPointRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'),
              'http://awss3control.amazonaws.com/doc/2018-08-20/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
    return CreateMultiRegionAccessPointResult.fromXml($result.body);
  }

  /// Deletes the specified access point.
  ///
  /// All Amazon S3 on Outposts REST API requests for this action require an
  /// additional parameter of <code>x-amz-outpost-id</code> to be passed with
  /// the request. In addition, you must use an S3 on Outposts endpoint hostname
  /// prefix instead of <code>s3-control</code>. For an example of the request
  /// syntax for Amazon S3 on Outposts that uses the S3 on Outposts endpoint
  /// hostname prefix and the <code>x-amz-outpost-id</code> derived by using the
  /// access point ARN, see the <a
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
  /// The Amazon Web Services account ID for the account that owns the specified
  /// access point.
  ///
  /// Parameter [name] :
  /// The name of the access point you want to delete.
  ///
  /// For using this parameter with Amazon S3 on Outposts with the REST API, you
  /// must specify the name and the x-amz-outpost-id as well.
  ///
  /// For using this parameter with S3 on Outposts with the Amazon Web Services
  /// SDK and CLI, you must specify the ARN of the access point accessed in the
  /// format
  /// <code>arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/accesspoint/&lt;my-accesspoint-name&gt;</code>.
  /// For example, to access the access point <code>reports-ap</code> through
  /// Outpost <code>my-outpost</code> owned by account <code>123456789012</code>
  /// in Region <code>us-west-2</code>, use the URL encoding of
  /// <code>arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/accesspoint/reports-ap</code>.
  /// The value must be URL encoded.
  Future<void> deleteAccessPoint({
    required String accountId,
    required String name,
  }) async {
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
  /// the request. In addition, you must use an S3 on Outposts endpoint hostname
  /// prefix instead of <code>s3-control</code>. For an example of the request
  /// syntax for Amazon S3 on Outposts that uses the S3 on Outposts endpoint
  /// hostname prefix and the <code>x-amz-outpost-id</code> derived by using the
  /// access point ARN, see the <a
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
  /// For using this parameter with S3 on Outposts with the Amazon Web Services
  /// SDK and CLI, you must specify the ARN of the access point accessed in the
  /// format
  /// <code>arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/accesspoint/&lt;my-accesspoint-name&gt;</code>.
  /// For example, to access the access point <code>reports-ap</code> through
  /// Outpost <code>my-outpost</code> owned by account <code>123456789012</code>
  /// in Region <code>us-west-2</code>, use the URL encoding of
  /// <code>arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/accesspoint/reports-ap</code>.
  /// The value must be URL encoded.
  Future<void> deleteAccessPointPolicy({
    required String accountId,
    required String name,
  }) async {
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
  /// the request. In addition, you must use an S3 on Outposts endpoint hostname
  /// prefix instead of <code>s3-control</code>. For an example of the request
  /// syntax for Amazon S3 on Outposts that uses the S3 on Outposts endpoint
  /// hostname prefix and the <code>x-amz-outpost-id</code> derived by using the
  /// access point ARN, see the <a
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
  /// For using this parameter with S3 on Outposts with the Amazon Web Services
  /// SDK and CLI, you must specify the ARN of the bucket accessed in the format
  /// <code>arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/bucket/&lt;my-bucket-name&gt;</code>.
  /// For example, to access the bucket <code>reports</code> through Outpost
  /// <code>my-outpost</code> owned by account <code>123456789012</code> in
  /// Region <code>us-west-2</code>, use the URL encoding of
  /// <code>arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/bucket/reports</code>.
  /// The value must be URL encoded.
  Future<void> deleteBucket({
    required String accountId,
    required String bucket,
  }) async {
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
  /// the request. In addition, you must use an S3 on Outposts endpoint hostname
  /// prefix instead of <code>s3-control</code>. For an example of the request
  /// syntax for Amazon S3 on Outposts that uses the S3 on Outposts endpoint
  /// hostname prefix and the <code>x-amz-outpost-id</code> derived by using the
  /// access point ARN, see the <a
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
  /// For using this parameter with S3 on Outposts with the Amazon Web Services
  /// SDK and CLI, you must specify the ARN of the bucket accessed in the format
  /// <code>arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/bucket/&lt;my-bucket-name&gt;</code>.
  /// For example, to access the bucket <code>reports</code> through Outpost
  /// <code>my-outpost</code> owned by account <code>123456789012</code> in
  /// Region <code>us-west-2</code>, use the URL encoding of
  /// <code>arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/bucket/reports</code>.
  /// The value must be URL encoded.
  Future<void> deleteBucketLifecycleConfiguration({
    required String accountId,
    required String bucket,
  }) async {
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
  /// using an identity other than the root user of the Amazon Web Services
  /// account that owns the bucket, the calling identity must have the
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
  /// As a security precaution, the root user of the Amazon Web Services account
  /// that owns a bucket can always use this action, even if the policy
  /// explicitly denies the root user the ability to perform this action.
  /// </important>
  /// For more information about bucket policies, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-iam-policies.html">Using
  /// Bucket Policies and User Policies</a>.
  ///
  /// All Amazon S3 on Outposts REST API requests for this action require an
  /// additional parameter of <code>x-amz-outpost-id</code> to be passed with
  /// the request. In addition, you must use an S3 on Outposts endpoint hostname
  /// prefix instead of <code>s3-control</code>. For an example of the request
  /// syntax for Amazon S3 on Outposts that uses the S3 on Outposts endpoint
  /// hostname prefix and the <code>x-amz-outpost-id</code> derived by using the
  /// access point ARN, see the <a
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
  /// For using this parameter with S3 on Outposts with the Amazon Web Services
  /// SDK and CLI, you must specify the ARN of the bucket accessed in the format
  /// <code>arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/bucket/&lt;my-bucket-name&gt;</code>.
  /// For example, to access the bucket <code>reports</code> through Outpost
  /// <code>my-outpost</code> owned by account <code>123456789012</code> in
  /// Region <code>us-west-2</code>, use the URL encoding of
  /// <code>arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/bucket/reports</code>.
  /// The value must be URL encoded.
  Future<void> deleteBucketPolicy({
    required String accountId,
    required String bucket,
  }) async {
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
  /// This operation deletes an Amazon S3 on Outposts bucket's replication
  /// configuration. To delete an S3 bucket's replication configuration, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketReplication.html">DeleteBucketReplication</a>
  /// in the <i>Amazon S3 API Reference</i>.
  /// </note>
  /// Deletes the replication configuration from the specified S3 on Outposts
  /// bucket.
  ///
  /// To use this operation, you must have permissions to perform the
  /// <code>s3-outposts:PutReplicationConfiguration</code> action. The Outposts
  /// bucket owner has this permission by default and can grant it to others.
  /// For more information about permissions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3OutpostsIAM.html">Setting
  /// up IAM with S3 on Outposts</a> and <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3OutpostsBucketPolicy.html">Managing
  /// access to S3 on Outposts buckets</a> in the <i>Amazon S3 User Guide</i>.
  /// <note>
  /// It can take a while to propagate <code>PUT</code> or <code>DELETE</code>
  /// requests for a replication configuration to all S3 on Outposts systems.
  /// Therefore, the replication configuration that's returned by a
  /// <code>GET</code> request soon after a <code>PUT</code> or
  /// <code>DELETE</code> request might return a more recent result than what's
  /// on the Outpost. If an Outpost is offline, the delay in updating the
  /// replication configuration on that Outpost can be significant.
  /// </note>
  /// All Amazon S3 on Outposts REST API requests for this action require an
  /// additional parameter of <code>x-amz-outpost-id</code> to be passed with
  /// the request. In addition, you must use an S3 on Outposts endpoint hostname
  /// prefix instead of <code>s3-control</code>. For an example of the request
  /// syntax for Amazon S3 on Outposts that uses the S3 on Outposts endpoint
  /// hostname prefix and the <code>x-amz-outpost-id</code> derived by using the
  /// access point ARN, see the <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DeleteBucketReplication.html#API_control_DeleteBucketReplication_Examples">Examples</a>
  /// section.
  ///
  /// For information about S3 replication on Outposts configuration, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3OutpostsReplication.html">Replicating
  /// objects for S3 on Outposts</a> in the <i>Amazon S3 User Guide</i>.
  ///
  /// The following operations are related to
  /// <code>DeleteBucketReplication</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_PutBucketReplication.html">PutBucketReplication</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_GetBucketReplication.html">GetBucketReplication</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID of the Outposts bucket to delete the
  /// replication configuration for.
  ///
  /// Parameter [bucket] :
  /// Specifies the S3 on Outposts bucket to delete the replication
  /// configuration for.
  ///
  /// For using this parameter with Amazon S3 on Outposts with the REST API, you
  /// must specify the name and the x-amz-outpost-id as well.
  ///
  /// For using this parameter with S3 on Outposts with the Amazon Web Services
  /// SDK and CLI, you must specify the ARN of the bucket accessed in the format
  /// <code>arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/bucket/&lt;my-bucket-name&gt;</code>.
  /// For example, to access the bucket <code>reports</code> through Outpost
  /// <code>my-outpost</code> owned by account <code>123456789012</code> in
  /// Region <code>us-west-2</code>, use the URL encoding of
  /// <code>arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/bucket/reports</code>.
  /// The value must be URL encoded.
  Future<void> deleteBucketReplication({
    required String accountId,
    required String bucket,
  }) async {
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    await _protocol.send(
      method: 'DELETE',
      requestUri:
          '/v20180820/bucket/${Uri.encodeComponent(bucket)}/replication',
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
  /// the request. In addition, you must use an S3 on Outposts endpoint hostname
  /// prefix instead of <code>s3-control</code>. For an example of the request
  /// syntax for Amazon S3 on Outposts that uses the S3 on Outposts endpoint
  /// hostname prefix and the <code>x-amz-outpost-id</code> derived by using the
  /// access point ARN, see the <a
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
  /// The Amazon Web Services account ID of the Outposts bucket tag set to be
  /// removed.
  ///
  /// Parameter [bucket] :
  /// The bucket ARN that has the tag set to be removed.
  ///
  /// For using this parameter with Amazon S3 on Outposts with the REST API, you
  /// must specify the name and the x-amz-outpost-id as well.
  ///
  /// For using this parameter with S3 on Outposts with the Amazon Web Services
  /// SDK and CLI, you must specify the ARN of the bucket accessed in the format
  /// <code>arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/bucket/&lt;my-bucket-name&gt;</code>.
  /// For example, to access the bucket <code>reports</code> through Outpost
  /// <code>my-outpost</code> owned by account <code>123456789012</code> in
  /// Region <code>us-west-2</code>, use the URL encoding of
  /// <code>arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/bucket/reports</code>.
  /// The value must be URL encoded.
  Future<void> deleteBucketTagging({
    required String accountId,
    required String bucket,
  }) async {
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
  /// use the <code>DeleteJobTagging</code> operation, you must have permission
  /// to perform the <code>s3:DeleteJobTagging</code> action. For more
  /// information, see <a
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
  /// The Amazon Web Services account ID associated with the S3 Batch Operations
  /// job.
  ///
  /// Parameter [jobId] :
  /// The ID for the S3 Batch Operations job whose tags you want to delete.
  Future<void> deleteJobTagging({
    required String accountId,
    required String jobId,
  }) async {
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

  /// Deletes a Multi-Region Access Point. This action does not delete the
  /// buckets associated with the Multi-Region Access Point, only the
  /// Multi-Region Access Point itself.
  ///
  /// This action will always be routed to the US West (Oregon) Region. For more
  /// information about the restrictions around managing Multi-Region Access
  /// Points, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/ManagingMultiRegionAccessPoints.html">Managing
  /// Multi-Region Access Points</a> in the <i>Amazon S3 User Guide</i>.
  ///
  /// This request is asynchronous, meaning that you might receive a response
  /// before the command has completed. When this request provides a response,
  /// it provides a token that you can use to monitor the status of the request
  /// with <code>DescribeMultiRegionAccessPointOperation</code>.
  ///
  /// The following actions are related to
  /// <code>DeleteMultiRegionAccessPoint</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_CreateMultiRegionAccessPoint.html">CreateMultiRegionAccessPoint</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DescribeMultiRegionAccessPointOperation.html">DescribeMultiRegionAccessPointOperation</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_GetMultiRegionAccessPoint.html">GetMultiRegionAccessPoint</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_ListMultiRegionAccessPoints.html">ListMultiRegionAccessPoints</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID for the owner of the Multi-Region
  /// Access Point.
  ///
  /// Parameter [details] :
  /// A container element containing details about the Multi-Region Access
  /// Point.
  ///
  /// Parameter [clientToken] :
  /// An idempotency token used to identify the request and guarantee that
  /// requests are unique.
  Future<DeleteMultiRegionAccessPointResult> deleteMultiRegionAccessPoint({
    required String accountId,
    required DeleteMultiRegionAccessPointInput details,
    String? clientToken,
  }) async {
    clientToken ??= _s.generateIdempotencyToken();
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    final $result = await _protocol.send(
      method: 'POST',
      requestUri: '/v20180820/async-requests/mrap/delete',
      headers: headers,
      payload: DeleteMultiRegionAccessPointRequest(
              accountId: accountId, details: details, clientToken: clientToken)
          .toXml(
        'DeleteMultiRegionAccessPointRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'),
              'http://awss3control.amazonaws.com/doc/2018-08-20/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
    return DeleteMultiRegionAccessPointResult.fromXml($result.body);
  }

  /// Removes the <code>PublicAccessBlock</code> configuration for an Amazon Web
  /// Services account. For more information, see <a
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
  /// The account ID for the Amazon Web Services account whose
  /// <code>PublicAccessBlock</code> configuration you want to remove.
  Future<void> deletePublicAccessBlock({
    required String accountId,
  }) async {
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
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/batch-ops.html">S3
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
  /// The Amazon Web Services account ID associated with the S3 Batch Operations
  /// job.
  ///
  /// Parameter [jobId] :
  /// The ID for the job whose information you want to retrieve.
  Future<DescribeJobResult> describeJob({
    required String accountId,
    required String jobId,
  }) async {
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

  /// Retrieves the status of an asynchronous request to manage a Multi-Region
  /// Access Point. For more information about managing Multi-Region Access
  /// Points and how asynchronous requests work, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/ManagingMultiRegionAccessPoints.html">Managing
  /// Multi-Region Access Points</a> in the <i>Amazon S3 User Guide</i>.
  ///
  /// The following actions are related to
  /// <code>GetMultiRegionAccessPoint</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_CreateMultiRegionAccessPoint.html">CreateMultiRegionAccessPoint</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DeleteMultiRegionAccessPoint.html">DeleteMultiRegionAccessPoint</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_GetMultiRegionAccessPoint.html">GetMultiRegionAccessPoint</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_ListMultiRegionAccessPoints.html">ListMultiRegionAccessPoints</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID for the owner of the Multi-Region
  /// Access Point.
  ///
  /// Parameter [requestTokenARN] :
  /// The request token associated with the request you want to know about. This
  /// request token is returned as part of the response when you make an
  /// asynchronous request. You provide this token to query about the status of
  /// the asynchronous action.
  Future<DescribeMultiRegionAccessPointOperationResult>
      describeMultiRegionAccessPointOperation({
    required String accountId,
    required String requestTokenARN,
  }) async {
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri:
          '/v20180820/async-requests/mrap/${requestTokenARN.split('/').map(Uri.encodeComponent).join('/')}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeMultiRegionAccessPointOperationResult.fromXml($result.body);
  }

  /// Returns configuration information about the specified access point.
  /// <p/>
  /// All Amazon S3 on Outposts REST API requests for this action require an
  /// additional parameter of <code>x-amz-outpost-id</code> to be passed with
  /// the request. In addition, you must use an S3 on Outposts endpoint hostname
  /// prefix instead of <code>s3-control</code>. For an example of the request
  /// syntax for Amazon S3 on Outposts that uses the S3 on Outposts endpoint
  /// hostname prefix and the <code>x-amz-outpost-id</code> derived by using the
  /// access point ARN, see the <a
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
  /// The Amazon Web Services account ID for the account that owns the specified
  /// access point.
  ///
  /// Parameter [name] :
  /// The name of the access point whose configuration information you want to
  /// retrieve.
  ///
  /// For using this parameter with Amazon S3 on Outposts with the REST API, you
  /// must specify the name and the x-amz-outpost-id as well.
  ///
  /// For using this parameter with S3 on Outposts with the Amazon Web Services
  /// SDK and CLI, you must specify the ARN of the access point accessed in the
  /// format
  /// <code>arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/accesspoint/&lt;my-accesspoint-name&gt;</code>.
  /// For example, to access the access point <code>reports-ap</code> through
  /// Outpost <code>my-outpost</code> owned by account <code>123456789012</code>
  /// in Region <code>us-west-2</code>, use the URL encoding of
  /// <code>arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/accesspoint/reports-ap</code>.
  /// The value must be URL encoded.
  Future<GetAccessPointResult> getAccessPoint({
    required String accountId,
    required String name,
  }) async {
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
  /// For using this parameter with S3 on Outposts with the Amazon Web Services
  /// SDK and CLI, you must specify the ARN of the access point accessed in the
  /// format
  /// <code>arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/accesspoint/&lt;my-accesspoint-name&gt;</code>.
  /// For example, to access the access point <code>reports-ap</code> through
  /// Outpost <code>my-outpost</code> owned by account <code>123456789012</code>
  /// in Region <code>us-west-2</code>, use the URL encoding of
  /// <code>arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/accesspoint/reports-ap</code>.
  /// The value must be URL encoded.
  Future<GetAccessPointPolicyResult> getAccessPointPolicy({
    required String accountId,
    required String name,
  }) async {
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
  /// If you are using an identity other than the root user of the Amazon Web
  /// Services account that owns the Outposts bucket, the calling identity must
  /// have the <code>s3-outposts:GetBucket</code> permissions on the specified
  /// Outposts bucket and belong to the Outposts bucket owner's account in order
  /// to use this action. Only users from Outposts bucket owner account with the
  /// right permissions can perform actions on an Outposts bucket.
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
  /// the request. In addition, you must use an S3 on Outposts endpoint hostname
  /// prefix instead of <code>s3-control</code>. For an example of the request
  /// syntax for Amazon S3 on Outposts that uses the S3 on Outposts endpoint
  /// hostname prefix and the <code>x-amz-outpost-id</code> derived by using the
  /// access point ARN, see the <a
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
  /// The Amazon Web Services account ID of the Outposts bucket.
  ///
  /// Parameter [bucket] :
  /// Specifies the bucket.
  ///
  /// For using this parameter with Amazon S3 on Outposts with the REST API, you
  /// must specify the name and the x-amz-outpost-id as well.
  ///
  /// For using this parameter with S3 on Outposts with the Amazon Web Services
  /// SDK and CLI, you must specify the ARN of the bucket accessed in the format
  /// <code>arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/bucket/&lt;my-bucket-name&gt;</code>.
  /// For example, to access the bucket <code>reports</code> through Outpost
  /// <code>my-outpost</code> owned by account <code>123456789012</code> in
  /// Region <code>us-west-2</code>, use the URL encoding of
  /// <code>arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/bucket/reports</code>.
  /// The value must be URL encoded.
  Future<GetBucketResult> getBucket({
    required String accountId,
    required String bucket,
  }) async {
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
  /// the request. In addition, you must use an S3 on Outposts endpoint hostname
  /// prefix instead of <code>s3-control</code>. For an example of the request
  /// syntax for Amazon S3 on Outposts that uses the S3 on Outposts endpoint
  /// hostname prefix and the <code>x-amz-outpost-id</code> derived by using the
  /// access point ARN, see the <a
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
  /// The Amazon Web Services account ID of the Outposts bucket.
  ///
  /// Parameter [bucket] :
  /// The Amazon Resource Name (ARN) of the bucket.
  ///
  /// For using this parameter with Amazon S3 on Outposts with the REST API, you
  /// must specify the name and the x-amz-outpost-id as well.
  ///
  /// For using this parameter with S3 on Outposts with the Amazon Web Services
  /// SDK and CLI, you must specify the ARN of the bucket accessed in the format
  /// <code>arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/bucket/&lt;my-bucket-name&gt;</code>.
  /// For example, to access the bucket <code>reports</code> through Outpost
  /// <code>my-outpost</code> owned by account <code>123456789012</code> in
  /// Region <code>us-west-2</code>, use the URL encoding of
  /// <code>arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/bucket/reports</code>.
  /// The value must be URL encoded.
  Future<GetBucketLifecycleConfigurationResult>
      getBucketLifecycleConfiguration({
    required String accountId,
    required String bucket,
  }) async {
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
  /// If you are using an identity other than the root user of the Amazon Web
  /// Services account that owns the bucket, the calling identity must have the
  /// <code>GetBucketPolicy</code> permissions on the specified bucket and
  /// belong to the bucket owner's account in order to use this action.
  ///
  /// Only users from Outposts bucket owner account with the right permissions
  /// can perform actions on an Outposts bucket. If you don't have
  /// <code>s3-outposts:GetBucketPolicy</code> permissions or you're not using
  /// an identity that belongs to the bucket owner's account, Amazon S3 returns
  /// a <code>403 Access Denied</code> error.
  /// <important>
  /// As a security precaution, the root user of the Amazon Web Services account
  /// that owns a bucket can always use this action, even if the policy
  /// explicitly denies the root user the ability to perform this action.
  /// </important>
  /// For more information about bucket policies, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-iam-policies.html">Using
  /// Bucket Policies and User Policies</a>.
  ///
  /// All Amazon S3 on Outposts REST API requests for this action require an
  /// additional parameter of <code>x-amz-outpost-id</code> to be passed with
  /// the request. In addition, you must use an S3 on Outposts endpoint hostname
  /// prefix instead of <code>s3-control</code>. For an example of the request
  /// syntax for Amazon S3 on Outposts that uses the S3 on Outposts endpoint
  /// hostname prefix and the <code>x-amz-outpost-id</code> derived by using the
  /// access point ARN, see the <a
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
  /// The Amazon Web Services account ID of the Outposts bucket.
  ///
  /// Parameter [bucket] :
  /// Specifies the bucket.
  ///
  /// For using this parameter with Amazon S3 on Outposts with the REST API, you
  /// must specify the name and the x-amz-outpost-id as well.
  ///
  /// For using this parameter with S3 on Outposts with the Amazon Web Services
  /// SDK and CLI, you must specify the ARN of the bucket accessed in the format
  /// <code>arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/bucket/&lt;my-bucket-name&gt;</code>.
  /// For example, to access the bucket <code>reports</code> through Outpost
  /// <code>my-outpost</code> owned by account <code>123456789012</code> in
  /// Region <code>us-west-2</code>, use the URL encoding of
  /// <code>arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/bucket/reports</code>.
  /// The value must be URL encoded.
  Future<GetBucketPolicyResult> getBucketPolicy({
    required String accountId,
    required String bucket,
  }) async {
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
  /// This operation gets an Amazon S3 on Outposts bucket's replication
  /// configuration. To get an S3 bucket's replication configuration, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketReplication.html">GetBucketReplication</a>
  /// in the <i>Amazon S3 API Reference</i>.
  /// </note>
  /// Returns the replication configuration of an S3 on Outposts bucket. For
  /// more information about S3 on Outposts, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3onOutposts.html">Using
  /// Amazon S3 on Outposts</a> in the <i>Amazon S3 User Guide</i>. For
  /// information about S3 replication on Outposts configuration, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3OutpostsReplication.html">Replicating
  /// objects for S3 on Outposts</a> in the <i>Amazon S3 User Guide</i>.
  /// <note>
  /// It can take a while to propagate <code>PUT</code> or <code>DELETE</code>
  /// requests for a replication configuration to all S3 on Outposts systems.
  /// Therefore, the replication configuration that's returned by a
  /// <code>GET</code> request soon after a <code>PUT</code> or
  /// <code>DELETE</code> request might return a more recent result than what's
  /// on the Outpost. If an Outpost is offline, the delay in updating the
  /// replication configuration on that Outpost can be significant.
  /// </note>
  /// This action requires permissions for the
  /// <code>s3-outposts:GetReplicationConfiguration</code> action. The Outposts
  /// bucket owner has this permission by default and can grant it to others.
  /// For more information about permissions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3OutpostsIAM.html">Setting
  /// up IAM with S3 on Outposts</a> and <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3OutpostsBucketPolicy.html">Managing
  /// access to S3 on Outposts bucket</a> in the <i>Amazon S3 User Guide</i>.
  ///
  /// All Amazon S3 on Outposts REST API requests for this action require an
  /// additional parameter of <code>x-amz-outpost-id</code> to be passed with
  /// the request. In addition, you must use an S3 on Outposts endpoint hostname
  /// prefix instead of <code>s3-control</code>. For an example of the request
  /// syntax for Amazon S3 on Outposts that uses the S3 on Outposts endpoint
  /// hostname prefix and the <code>x-amz-outpost-id</code> derived by using the
  /// access point ARN, see the <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_GetBucketReplication.html#API_control_GetBucketReplication_Examples">Examples</a>
  /// section.
  ///
  /// If you include the <code>Filter</code> element in a replication
  /// configuration, you must also include the
  /// <code>DeleteMarkerReplication</code>, <code>Status</code>, and
  /// <code>Priority</code> elements. The response also returns those elements.
  ///
  /// For information about S3 on Outposts replication failure reasons, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/outposts-replication-eventbridge.html#outposts-replication-failure-codes">Replication
  /// failure reasons</a> in the <i>Amazon S3 User Guide</i>.
  ///
  /// The following operations are related to <code>GetBucketReplication</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_PutBucketReplication.html">PutBucketReplication</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DeleteBucketReplication.html">DeleteBucketReplication</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID of the Outposts bucket.
  ///
  /// Parameter [bucket] :
  /// Specifies the bucket to get the replication information for.
  ///
  /// For using this parameter with Amazon S3 on Outposts with the REST API, you
  /// must specify the name and the x-amz-outpost-id as well.
  ///
  /// For using this parameter with S3 on Outposts with the Amazon Web Services
  /// SDK and CLI, you must specify the ARN of the bucket accessed in the format
  /// <code>arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/bucket/&lt;my-bucket-name&gt;</code>.
  /// For example, to access the bucket <code>reports</code> through Outpost
  /// <code>my-outpost</code> owned by account <code>123456789012</code> in
  /// Region <code>us-west-2</code>, use the URL encoding of
  /// <code>arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/bucket/reports</code>.
  /// The value must be URL encoded.
  Future<GetBucketReplicationResult> getBucketReplication({
    required String accountId,
    required String bucket,
  }) async {
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri:
          '/v20180820/bucket/${Uri.encodeComponent(bucket)}/replication',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetBucketReplicationResult.fromXml($result.body);
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
  /// the request. In addition, you must use an S3 on Outposts endpoint hostname
  /// prefix instead of <code>s3-control</code>. For an example of the request
  /// syntax for Amazon S3 on Outposts that uses the S3 on Outposts endpoint
  /// hostname prefix and the <code>x-amz-outpost-id</code> derived by using the
  /// access point ARN, see the <a
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
  /// The Amazon Web Services account ID of the Outposts bucket.
  ///
  /// Parameter [bucket] :
  /// Specifies the bucket.
  ///
  /// For using this parameter with Amazon S3 on Outposts with the REST API, you
  /// must specify the name and the x-amz-outpost-id as well.
  ///
  /// For using this parameter with S3 on Outposts with the Amazon Web Services
  /// SDK and CLI, you must specify the ARN of the bucket accessed in the format
  /// <code>arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/bucket/&lt;my-bucket-name&gt;</code>.
  /// For example, to access the bucket <code>reports</code> through Outpost
  /// <code>my-outpost</code> owned by account <code>123456789012</code> in
  /// Region <code>us-west-2</code>, use the URL encoding of
  /// <code>arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/bucket/reports</code>.
  /// The value must be URL encoded.
  Future<GetBucketTaggingResult> getBucketTagging({
    required String accountId,
    required String bucket,
  }) async {
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

  /// <note>
  /// This operation returns the versioning state for S3 on Outposts buckets
  /// only. To return the versioning state for an S3 bucket, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketVersioning.html">GetBucketVersioning</a>
  /// in the <i>Amazon S3 API Reference</i>.
  /// </note>
  /// Returns the versioning state for an S3 on Outposts bucket. With S3
  /// Versioning, you can save multiple distinct copies of your objects and
  /// recover from unintended user actions and application failures.
  ///
  /// If you've never set versioning on your bucket, it has no versioning state.
  /// In that case, the <code>GetBucketVersioning</code> request does not return
  /// a versioning state value.
  ///
  /// For more information about versioning, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/Versioning.html">Versioning</a>
  /// in the <i>Amazon S3 User Guide</i>.
  ///
  /// All Amazon S3 on Outposts REST API requests for this action require an
  /// additional parameter of <code>x-amz-outpost-id</code> to be passed with
  /// the request. In addition, you must use an S3 on Outposts endpoint hostname
  /// prefix instead of <code>s3-control</code>. For an example of the request
  /// syntax for Amazon S3 on Outposts that uses the S3 on Outposts endpoint
  /// hostname prefix and the <code>x-amz-outpost-id</code> derived by using the
  /// access point ARN, see the <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_GetBucketVersioning.html#API_control_GetBucketVersioning_Examples">Examples</a>
  /// section.
  ///
  /// The following operations are related to <code>GetBucketVersioning</code>
  /// for S3 on Outposts.
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_PutBucketVersioning.html">PutBucketVersioning</a>
  /// </li>
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
  /// The Amazon Web Services account ID of the S3 on Outposts bucket.
  ///
  /// Parameter [bucket] :
  /// The S3 on Outposts bucket to return the versioning state for.
  Future<GetBucketVersioningResult> getBucketVersioning({
    required String accountId,
    required String bucket,
  }) async {
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/v20180820/bucket/${Uri.encodeComponent(bucket)}/versioning',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetBucketVersioningResult.fromXml($result.body);
  }

  /// Returns the tags on an S3 Batch Operations job. To use the
  /// <code>GetJobTagging</code> operation, you must have permission to perform
  /// the <code>s3:GetJobTagging</code> action. For more information, see <a
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
  /// The Amazon Web Services account ID associated with the S3 Batch Operations
  /// job.
  ///
  /// Parameter [jobId] :
  /// The ID for the S3 Batch Operations job whose tags you want to retrieve.
  Future<GetJobTaggingResult> getJobTagging({
    required String accountId,
    required String jobId,
  }) async {
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

  /// Returns configuration information about the specified Multi-Region Access
  /// Point.
  ///
  /// This action will always be routed to the US West (Oregon) Region. For more
  /// information about the restrictions around managing Multi-Region Access
  /// Points, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/ManagingMultiRegionAccessPoints.html">Managing
  /// Multi-Region Access Points</a> in the <i>Amazon S3 User Guide</i>.
  ///
  /// The following actions are related to
  /// <code>GetMultiRegionAccessPoint</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_CreateMultiRegionAccessPoint.html">CreateMultiRegionAccessPoint</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DeleteMultiRegionAccessPoint.html">DeleteMultiRegionAccessPoint</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DescribeMultiRegionAccessPointOperation.html">DescribeMultiRegionAccessPointOperation</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_ListMultiRegionAccessPoints.html">ListMultiRegionAccessPoints</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID for the owner of the Multi-Region
  /// Access Point.
  ///
  /// Parameter [name] :
  /// The name of the Multi-Region Access Point whose configuration information
  /// you want to receive. The name of the Multi-Region Access Point is
  /// different from the alias. For more information about the distinction
  /// between the name and the alias of an Multi-Region Access Point, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/CreatingMultiRegionAccessPoints.html#multi-region-access-point-naming">Managing
  /// Multi-Region Access Points</a> in the <i>Amazon S3 User Guide</i>.
  Future<GetMultiRegionAccessPointResult> getMultiRegionAccessPoint({
    required String accountId,
    required String name,
  }) async {
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri:
          '/v20180820/mrap/instances/${name.split('/').map(Uri.encodeComponent).join('/')}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetMultiRegionAccessPointResult.fromXml($result.body);
  }

  /// Returns the access control policy of the specified Multi-Region Access
  /// Point.
  ///
  /// This action will always be routed to the US West (Oregon) Region. For more
  /// information about the restrictions around managing Multi-Region Access
  /// Points, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/ManagingMultiRegionAccessPoints.html">Managing
  /// Multi-Region Access Points</a> in the <i>Amazon S3 User Guide</i>.
  ///
  /// The following actions are related to
  /// <code>GetMultiRegionAccessPointPolicy</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_GetMultiRegionAccessPointPolicyStatus.html">GetMultiRegionAccessPointPolicyStatus</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_PutMultiRegionAccessPointPolicy.html">PutMultiRegionAccessPointPolicy</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID for the owner of the Multi-Region
  /// Access Point.
  ///
  /// Parameter [name] :
  /// Specifies the Multi-Region Access Point. The name of the Multi-Region
  /// Access Point is different from the alias. For more information about the
  /// distinction between the name and the alias of an Multi-Region Access
  /// Point, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/CreatingMultiRegionAccessPoints.html#multi-region-access-point-naming">Managing
  /// Multi-Region Access Points</a> in the <i>Amazon S3 User Guide</i>.
  Future<GetMultiRegionAccessPointPolicyResult>
      getMultiRegionAccessPointPolicy({
    required String accountId,
    required String name,
  }) async {
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri:
          '/v20180820/mrap/instances/${name.split('/').map(Uri.encodeComponent).join('/')}/policy',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetMultiRegionAccessPointPolicyResult.fromXml($result.body);
  }

  /// Indicates whether the specified Multi-Region Access Point has an access
  /// control policy that allows public access.
  ///
  /// This action will always be routed to the US West (Oregon) Region. For more
  /// information about the restrictions around managing Multi-Region Access
  /// Points, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/ManagingMultiRegionAccessPoints.html">Managing
  /// Multi-Region Access Points</a> in the <i>Amazon S3 User Guide</i>.
  ///
  /// The following actions are related to
  /// <code>GetMultiRegionAccessPointPolicyStatus</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_GetMultiRegionAccessPointPolicy.html">GetMultiRegionAccessPointPolicy</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_PutMultiRegionAccessPointPolicy.html">PutMultiRegionAccessPointPolicy</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID for the owner of the Multi-Region
  /// Access Point.
  ///
  /// Parameter [name] :
  /// Specifies the Multi-Region Access Point. The name of the Multi-Region
  /// Access Point is different from the alias. For more information about the
  /// distinction between the name and the alias of an Multi-Region Access
  /// Point, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/CreatingMultiRegionAccessPoints.html#multi-region-access-point-naming">Managing
  /// Multi-Region Access Points</a> in the <i>Amazon S3 User Guide</i>.
  Future<GetMultiRegionAccessPointPolicyStatusResult>
      getMultiRegionAccessPointPolicyStatus({
    required String accountId,
    required String name,
  }) async {
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri:
          '/v20180820/mrap/instances/${name.split('/').map(Uri.encodeComponent).join('/')}/policystatus',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetMultiRegionAccessPointPolicyStatusResult.fromXml($result.body);
  }

  /// Returns the routing configuration for a Multi-Region Access Point,
  /// indicating which Regions are active or passive.
  ///
  /// To obtain routing control changes and failover requests, use the Amazon S3
  /// failover control infrastructure endpoints in these five Amazon Web
  /// Services Regions:
  ///
  /// <ul>
  /// <li>
  /// <code>us-east-1</code>
  /// </li>
  /// <li>
  /// <code>us-west-2</code>
  /// </li>
  /// <li>
  /// <code>ap-southeast-2</code>
  /// </li>
  /// <li>
  /// <code>ap-northeast-1</code>
  /// </li>
  /// <li>
  /// <code>eu-west-1</code>
  /// </li>
  /// </ul> <note>
  /// Your Amazon S3 bucket does not need to be in these five Regions.
  /// </note>
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID for the owner of the Multi-Region
  /// Access Point.
  ///
  /// Parameter [mrap] :
  /// The Multi-Region Access Point ARN.
  Future<GetMultiRegionAccessPointRoutesResult>
      getMultiRegionAccessPointRoutes({
    required String accountId,
    required String mrap,
  }) async {
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri:
          '/v20180820/mrap/instances/${mrap.split('/').map(Uri.encodeComponent).join('/')}/routes',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetMultiRegionAccessPointRoutesResult.fromXml($result.body);
  }

  /// Retrieves the <code>PublicAccessBlock</code> configuration for an Amazon
  /// Web Services account. For more information, see <a
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
  /// The account ID for the Amazon Web Services account whose
  /// <code>PublicAccessBlock</code> configuration you want to retrieve.
  Future<GetPublicAccessBlockOutput> getPublicAccessBlock({
    required String accountId,
  }) async {
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
  /// <i>Amazon S3 User Guide</i>. For a complete list of S3 Storage Lens
  /// metrics, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage_lens_metrics_glossary.html">S3
  /// Storage Lens metrics glossary</a> in the <i>Amazon S3 User Guide</i>.
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

  /// Returns a list of the access points that are owned by the current account
  /// that's associated with the specified bucket. You can retrieve up to 1000
  /// access points per call. If the specified bucket has more than 1,000 access
  /// points (or the number specified in <code>maxResults</code>, whichever is
  /// less), the response will include a continuation token that you can use to
  /// list the additional access points.
  /// <p/>
  /// All Amazon S3 on Outposts REST API requests for this action require an
  /// additional parameter of <code>x-amz-outpost-id</code> to be passed with
  /// the request. In addition, you must use an S3 on Outposts endpoint hostname
  /// prefix instead of <code>s3-control</code>. For an example of the request
  /// syntax for Amazon S3 on Outposts that uses the S3 on Outposts endpoint
  /// hostname prefix and the <code>x-amz-outpost-id</code> derived by using the
  /// access point ARN, see the <a
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
  /// The Amazon Web Services account ID for the account that owns the specified
  /// access points.
  ///
  /// Parameter [bucket] :
  /// The name of the bucket whose associated access points you want to list.
  ///
  /// For using this parameter with Amazon S3 on Outposts with the REST API, you
  /// must specify the name and the x-amz-outpost-id as well.
  ///
  /// For using this parameter with S3 on Outposts with the Amazon Web Services
  /// SDK and CLI, you must specify the ARN of the bucket accessed in the format
  /// <code>arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/bucket/&lt;my-bucket-name&gt;</code>.
  /// For example, to access the bucket <code>reports</code> through Outpost
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      1000,
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

  /// Returns some or all (up to 1,000) access points associated with the Object
  /// Lambda Access Point per call. If there are more access points than what
  /// can be returned in one call, the response will include a continuation
  /// token that you can use to list the additional access points.
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
  /// The response may contain fewer access points but will never contain more.
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      1000,
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
  /// last 30 days for the Amazon Web Services account making the request. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/batch-ops.html">S3
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
  /// The Amazon Web Services account ID associated with the S3 Batch Operations
  /// job.
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      1000,
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

  /// Returns a list of the Multi-Region Access Points currently associated with
  /// the specified Amazon Web Services account. Each call can return up to 100
  /// Multi-Region Access Points, the maximum number of Multi-Region Access
  /// Points that can be associated with a single account.
  ///
  /// This action will always be routed to the US West (Oregon) Region. For more
  /// information about the restrictions around managing Multi-Region Access
  /// Points, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/ManagingMultiRegionAccessPoints.html">Managing
  /// Multi-Region Access Points</a> in the <i>Amazon S3 User Guide</i>.
  ///
  /// The following actions are related to
  /// <code>ListMultiRegionAccessPoint</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_CreateMultiRegionAccessPoint.html">CreateMultiRegionAccessPoint</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DeleteMultiRegionAccessPoint.html">DeleteMultiRegionAccessPoint</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DescribeMultiRegionAccessPointOperation.html">DescribeMultiRegionAccessPointOperation</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_GetMultiRegionAccessPoint.html">GetMultiRegionAccessPoint</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID for the owner of the Multi-Region
  /// Access Point.
  ///
  /// Parameter [maxResults] :
  /// Not currently used. Do not use this parameter.
  ///
  /// Parameter [nextToken] :
  /// Not currently used. Do not use this parameter.
  Future<ListMultiRegionAccessPointsResult> listMultiRegionAccessPoints({
    required String accountId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      1000,
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
      requestUri: '/v20180820/mrap/instances',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListMultiRegionAccessPointsResult.fromXml($result.body);
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
  /// The Amazon Web Services account ID of the Outposts bucket.
  ///
  /// Parameter [maxResults] :
  /// <p/>
  ///
  /// Parameter [nextToken] :
  /// <p/>
  ///
  /// Parameter [outpostId] :
  /// The ID of the Outposts resource.
  /// <note>
  /// This ID is required by Amazon S3 on Outposts buckets.
  /// </note>
  Future<ListRegionalBucketsResult> listRegionalBuckets({
    required String accountId,
    int? maxResults,
    String? nextToken,
    String? outpostId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      1000,
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
  /// the request. In addition, you must use an S3 on Outposts endpoint hostname
  /// prefix instead of <code>s3-control</code>. For an example of the request
  /// syntax for Amazon S3 on Outposts that uses the S3 on Outposts endpoint
  /// hostname prefix and the <code>x-amz-outpost-id</code> derived by using the
  /// access point ARN, see the <a
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
  /// The Amazon Web Services account ID for owner of the bucket associated with
  /// the specified access point.
  ///
  /// Parameter [name] :
  /// The name of the access point that you want to associate with the specified
  /// policy.
  ///
  /// For using this parameter with Amazon S3 on Outposts with the REST API, you
  /// must specify the name and the x-amz-outpost-id as well.
  ///
  /// For using this parameter with S3 on Outposts with the Amazon Web Services
  /// SDK and CLI, you must specify the ARN of the access point accessed in the
  /// format
  /// <code>arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/accesspoint/&lt;my-accesspoint-name&gt;</code>.
  /// For example, to access the access point <code>reports-ap</code> through
  /// Outpost <code>my-outpost</code> owned by account <code>123456789012</code>
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
  /// the request. In addition, you must use an S3 on Outposts endpoint hostname
  /// prefix instead of <code>s3-control</code>. For an example of the request
  /// syntax for Amazon S3 on Outposts that uses the S3 on Outposts endpoint
  /// hostname prefix and the <code>x-amz-outpost-id</code> derived by using the
  /// access point ARN, see the <a
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
  /// The Amazon Web Services account ID of the Outposts bucket.
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
  /// If you are using an identity other than the root user of the Amazon Web
  /// Services account that owns the Outposts bucket, the calling identity must
  /// have the <code>PutBucketPolicy</code> permissions on the specified
  /// Outposts bucket and belong to the bucket owner's account in order to use
  /// this action.
  ///
  /// If you don't have <code>PutBucketPolicy</code> permissions, Amazon S3
  /// returns a <code>403 Access Denied</code> error. If you have the correct
  /// permissions, but you're not using an identity that belongs to the bucket
  /// owner's account, Amazon S3 returns a <code>405 Method Not Allowed</code>
  /// error.
  /// <important>
  /// As a security precaution, the root user of the Amazon Web Services account
  /// that owns a bucket can always use this action, even if the policy
  /// explicitly denies the root user the ability to perform this action.
  /// </important>
  /// For more information about bucket policies, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-iam-policies.html">Using
  /// Bucket Policies and User Policies</a>.
  ///
  /// All Amazon S3 on Outposts REST API requests for this action require an
  /// additional parameter of <code>x-amz-outpost-id</code> to be passed with
  /// the request. In addition, you must use an S3 on Outposts endpoint hostname
  /// prefix instead of <code>s3-control</code>. For an example of the request
  /// syntax for Amazon S3 on Outposts that uses the S3 on Outposts endpoint
  /// hostname prefix and the <code>x-amz-outpost-id</code> derived by using the
  /// access point ARN, see the <a
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
  /// The Amazon Web Services account ID of the Outposts bucket.
  ///
  /// Parameter [bucket] :
  /// Specifies the bucket.
  ///
  /// For using this parameter with Amazon S3 on Outposts with the REST API, you
  /// must specify the name and the x-amz-outpost-id as well.
  ///
  /// For using this parameter with S3 on Outposts with the Amazon Web Services
  /// SDK and CLI, you must specify the ARN of the bucket accessed in the format
  /// <code>arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/bucket/&lt;my-bucket-name&gt;</code>.
  /// For example, to access the bucket <code>reports</code> through Outpost
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
  /// This action creates an Amazon S3 on Outposts bucket's replication
  /// configuration. To create an S3 bucket's replication configuration, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketReplication.html">PutBucketReplication</a>
  /// in the <i>Amazon S3 API Reference</i>.
  /// </note>
  /// Creates a replication configuration or replaces an existing one. For
  /// information about S3 replication on Outposts configuration, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3OutpostsReplication.html">Replicating
  /// objects for S3 on Outposts</a> in the <i>Amazon S3 User Guide</i>.
  /// <note>
  /// It can take a while to propagate <code>PUT</code> or <code>DELETE</code>
  /// requests for a replication configuration to all S3 on Outposts systems.
  /// Therefore, the replication configuration that's returned by a
  /// <code>GET</code> request soon after a <code>PUT</code> or
  /// <code>DELETE</code> request might return a more recent result than what's
  /// on the Outpost. If an Outpost is offline, the delay in updating the
  /// replication configuration on that Outpost can be significant.
  /// </note>
  /// Specify the replication configuration in the request body. In the
  /// replication configuration, you provide the following information:
  ///
  /// <ul>
  /// <li>
  /// The name of the destination bucket or buckets where you want S3 on
  /// Outposts to replicate objects
  /// </li>
  /// <li>
  /// The Identity and Access Management (IAM) role that S3 on Outposts can
  /// assume to replicate objects on your behalf
  /// </li>
  /// <li>
  /// Other relevant information, such as replication rules
  /// </li>
  /// </ul>
  /// A replication configuration must include at least one rule and can contain
  /// a maximum of 100. Each rule identifies a subset of objects to replicate by
  /// filtering the objects in the source Outposts bucket. To choose additional
  /// subsets of objects to replicate, add a rule for each subset.
  ///
  /// To specify a subset of the objects in the source Outposts bucket to apply
  /// a replication rule to, add the <code>Filter</code> element as a child of
  /// the <code>Rule</code> element. You can filter objects based on an object
  /// key prefix, one or more object tags, or both. When you add the
  /// <code>Filter</code> element in the configuration, you must also add the
  /// following elements: <code>DeleteMarkerReplication</code>,
  /// <code>Status</code>, and <code>Priority</code>.
  ///
  /// Using <code>PutBucketReplication</code> on Outposts requires that both the
  /// source and destination buckets must have versioning enabled. For
  /// information about enabling versioning on a bucket, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3OutpostsManagingVersioning.html">Managing
  /// S3 Versioning for your S3 on Outposts bucket</a>.
  ///
  /// For information about S3 on Outposts replication failure reasons, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/outposts-replication-eventbridge.html#outposts-replication-failure-codes">Replication
  /// failure reasons</a> in the <i>Amazon S3 User Guide</i>.
  ///
  /// <b>Handling Replication of Encrypted Objects</b>
  ///
  /// Outposts buckets are encrypted at all times. All the objects in the source
  /// Outposts bucket are encrypted and can be replicated. Also, all the
  /// replicas in the destination Outposts bucket are encrypted with the same
  /// encryption key as the objects in the source Outposts bucket.
  ///
  /// <b>Permissions</b>
  ///
  /// To create a <code>PutBucketReplication</code> request, you must have
  /// <code>s3-outposts:PutReplicationConfiguration</code> permissions for the
  /// bucket. The Outposts bucket owner has this permission by default and can
  /// grant it to others. For more information about permissions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3OutpostsIAM.html">Setting
  /// up IAM with S3 on Outposts</a> and <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3OutpostsBucketPolicy.html">Managing
  /// access to S3 on Outposts buckets</a>.
  /// <note>
  /// To perform this operation, the user or role must also have the
  /// <code>iam:CreateRole</code> and <code>iam:PassRole</code> permissions. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_passrole.html">Granting
  /// a user permissions to pass a role to an Amazon Web Services service</a>.
  /// </note>
  /// All Amazon S3 on Outposts REST API requests for this action require an
  /// additional parameter of <code>x-amz-outpost-id</code> to be passed with
  /// the request. In addition, you must use an S3 on Outposts endpoint hostname
  /// prefix instead of <code>s3-control</code>. For an example of the request
  /// syntax for Amazon S3 on Outposts that uses the S3 on Outposts endpoint
  /// hostname prefix and the <code>x-amz-outpost-id</code> derived by using the
  /// access point ARN, see the <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_PutBucketReplication.html#API_control_PutBucketReplication_Examples">Examples</a>
  /// section.
  ///
  /// The following operations are related to <code>PutBucketReplication</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_GetBucketReplication.html">GetBucketReplication</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DeleteBucketReplication.html">DeleteBucketReplication</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID of the Outposts bucket.
  ///
  /// Parameter [bucket] :
  /// Specifies the S3 on Outposts bucket to set the configuration for.
  ///
  /// For using this parameter with Amazon S3 on Outposts with the REST API, you
  /// must specify the name and the x-amz-outpost-id as well.
  ///
  /// For using this parameter with S3 on Outposts with the Amazon Web Services
  /// SDK and CLI, you must specify the ARN of the bucket accessed in the format
  /// <code>arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/bucket/&lt;my-bucket-name&gt;</code>.
  /// For example, to access the bucket <code>reports</code> through Outpost
  /// <code>my-outpost</code> owned by account <code>123456789012</code> in
  /// Region <code>us-west-2</code>, use the URL encoding of
  /// <code>arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/bucket/reports</code>.
  /// The value must be URL encoded.
  ///
  /// Parameter [replicationConfiguration] :
  /// <p/>
  Future<void> putBucketReplication({
    required String accountId,
    required String bucket,
    required ReplicationConfiguration replicationConfiguration,
  }) async {
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    await _protocol.send(
      method: 'PUT',
      requestUri:
          '/v20180820/bucket/${Uri.encodeComponent(bucket)}/replication',
      headers: headers,
      payload: replicationConfiguration.toXml('ReplicationConfiguration'),
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
  /// Use tags to organize your Amazon Web Services bill to reflect your own
  /// cost structure. To do this, sign up to get your Amazon Web Services
  /// account bill with tag key values included. Then, to see the cost of
  /// combined resources, organize your billing information according to
  /// resources with the same tag key values. For example, you can tag several
  /// resources with a specific application name, and then organize your billing
  /// information to see the total cost of that application across several
  /// services. For more information, see <a
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
  /// Amazon Web Services-Generated Cost Allocation Tag Restrictions</a>.
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
  /// the request. In addition, you must use an S3 on Outposts endpoint hostname
  /// prefix instead of <code>s3-control</code>. For an example of the request
  /// syntax for Amazon S3 on Outposts that uses the S3 on Outposts endpoint
  /// hostname prefix and the <code>x-amz-outpost-id</code> derived by using the
  /// access point ARN, see the <a
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
  /// The Amazon Web Services account ID of the Outposts bucket.
  ///
  /// Parameter [bucket] :
  /// The Amazon Resource Name (ARN) of the bucket.
  ///
  /// For using this parameter with Amazon S3 on Outposts with the REST API, you
  /// must specify the name and the x-amz-outpost-id as well.
  ///
  /// For using this parameter with S3 on Outposts with the Amazon Web Services
  /// SDK and CLI, you must specify the ARN of the bucket accessed in the format
  /// <code>arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/bucket/&lt;my-bucket-name&gt;</code>.
  /// For example, to access the bucket <code>reports</code> through Outpost
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

  /// <note>
  /// This operation sets the versioning state for S3 on Outposts buckets only.
  /// To set the versioning state for an S3 bucket, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketVersioning.html">PutBucketVersioning</a>
  /// in the <i>Amazon S3 API Reference</i>.
  /// </note>
  /// Sets the versioning state for an S3 on Outposts bucket. With S3
  /// Versioning, you can save multiple distinct copies of your objects and
  /// recover from unintended user actions and application failures.
  ///
  /// You can set the versioning state to one of the following:
  ///
  /// <ul>
  /// <li>
  /// <b>Enabled</b> - Enables versioning for the objects in the bucket. All
  /// objects added to the bucket receive a unique version ID.
  /// </li>
  /// <li>
  /// <b>Suspended</b> - Suspends versioning for the objects in the bucket. All
  /// objects added to the bucket receive the version ID <code>null</code>.
  /// </li>
  /// </ul>
  /// If you've never set versioning on your bucket, it has no versioning state.
  /// In that case, a <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_GetBucketVersioning.html">
  /// GetBucketVersioning</a> request does not return a versioning state value.
  ///
  /// When you enable S3 Versioning, for each object in your bucket, you have a
  /// current version and zero or more noncurrent versions. You can configure
  /// your bucket S3 Lifecycle rules to expire noncurrent versions after a
  /// specified time period. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3OutpostsLifecycleManaging.html">
  /// Creating and managing a lifecycle configuration for your S3 on Outposts
  /// bucket</a> in the <i>Amazon S3 User Guide</i>.
  ///
  /// If you have an object expiration lifecycle configuration in your
  /// non-versioned bucket and you want to maintain the same permanent delete
  /// behavior when you enable versioning, you must add a noncurrent expiration
  /// policy. The noncurrent expiration lifecycle configuration will manage the
  /// deletes of the noncurrent object versions in the version-enabled bucket.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/Versioning.html">Versioning</a>
  /// in the <i>Amazon S3 User Guide</i>.
  ///
  /// All Amazon S3 on Outposts REST API requests for this action require an
  /// additional parameter of <code>x-amz-outpost-id</code> to be passed with
  /// the request. In addition, you must use an S3 on Outposts endpoint hostname
  /// prefix instead of <code>s3-control</code>. For an example of the request
  /// syntax for Amazon S3 on Outposts that uses the S3 on Outposts endpoint
  /// hostname prefix and the <code>x-amz-outpost-id</code> derived by using the
  /// access point ARN, see the <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_PutBucketVersioning.html#API_control_PutBucketVersioning_Examples">Examples</a>
  /// section.
  ///
  /// The following operations are related to <code>PutBucketVersioning</code>
  /// for S3 on Outposts.
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_GetBucketVersioning.html">GetBucketVersioning</a>
  /// </li>
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
  /// The Amazon Web Services account ID of the S3 on Outposts bucket.
  ///
  /// Parameter [bucket] :
  /// The S3 on Outposts bucket to set the versioning state for.
  ///
  /// Parameter [versioningConfiguration] :
  /// The root-level tag for the <code>VersioningConfiguration</code>
  /// parameters.
  ///
  /// Parameter [mfa] :
  /// The concatenation of the authentication device's serial number, a space,
  /// and the value that is displayed on your authentication device.
  Future<void> putBucketVersioning({
    required String accountId,
    required String bucket,
    required VersioningConfiguration versioningConfiguration,
    String? mfa,
  }) async {
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
      if (mfa != null) 'x-amz-mfa': mfa.toString(),
    };
    await _protocol.send(
      method: 'PUT',
      requestUri: '/v20180820/bucket/${Uri.encodeComponent(bucket)}/versioning',
      headers: headers,
      payload: versioningConfiguration.toXml('VersioningConfiguration'),
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
  /// Tag Restrictions</a> in the <i>Billing and Cost Management User Guide</i>.
  /// </li>
  /// </ul> </li>
  /// </ul> </note> <p/>
  /// To use the <code>PutJobTagging</code> operation, you must have permission
  /// to perform the <code>s3:PutJobTagging</code> action.
  ///
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
  /// The Amazon Web Services account ID associated with the S3 Batch Operations
  /// job.
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

  /// Associates an access control policy with the specified Multi-Region Access
  /// Point. Each Multi-Region Access Point can have only one policy, so a
  /// request made to this action replaces any existing policy that is
  /// associated with the specified Multi-Region Access Point.
  ///
  /// This action will always be routed to the US West (Oregon) Region. For more
  /// information about the restrictions around managing Multi-Region Access
  /// Points, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/ManagingMultiRegionAccessPoints.html">Managing
  /// Multi-Region Access Points</a> in the <i>Amazon S3 User Guide</i>.
  ///
  /// The following actions are related to
  /// <code>PutMultiRegionAccessPointPolicy</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_GetMultiRegionAccessPointPolicy.html">GetMultiRegionAccessPointPolicy</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_GetMultiRegionAccessPointPolicyStatus.html">GetMultiRegionAccessPointPolicyStatus</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID for the owner of the Multi-Region
  /// Access Point.
  ///
  /// Parameter [details] :
  /// A container element containing the details of the policy for the
  /// Multi-Region Access Point.
  ///
  /// Parameter [clientToken] :
  /// An idempotency token used to identify the request and guarantee that
  /// requests are unique.
  Future<PutMultiRegionAccessPointPolicyResult>
      putMultiRegionAccessPointPolicy({
    required String accountId,
    required PutMultiRegionAccessPointPolicyInput details,
    String? clientToken,
  }) async {
    clientToken ??= _s.generateIdempotencyToken();
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    final $result = await _protocol.send(
      method: 'POST',
      requestUri: '/v20180820/async-requests/mrap/put-policy',
      headers: headers,
      payload: PutMultiRegionAccessPointPolicyRequest(
              accountId: accountId, details: details, clientToken: clientToken)
          .toXml(
        'PutMultiRegionAccessPointPolicyRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'),
              'http://awss3control.amazonaws.com/doc/2018-08-20/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
    return PutMultiRegionAccessPointPolicyResult.fromXml($result.body);
  }

  /// Creates or modifies the <code>PublicAccessBlock</code> configuration for
  /// an Amazon Web Services account. For this operation, users must have the
  /// <code>s3:PutAccountPublicAccessBlock</code> permission. For more
  /// information, see <a
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
  /// The account ID for the Amazon Web Services account whose
  /// <code>PublicAccessBlock</code> configuration you want to set.
  ///
  /// Parameter [publicAccessBlockConfiguration] :
  /// The <code>PublicAccessBlock</code> configuration that you want to apply to
  /// the specified Amazon Web Services account.
  Future<void> putPublicAccessBlock({
    required String accountId,
    required PublicAccessBlockConfiguration publicAccessBlockConfiguration,
  }) async {
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
  /// with Amazon S3 Storage Lens</a> in the <i>Amazon S3 User Guide</i>. For a
  /// complete list of S3 Storage Lens metrics, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage_lens_metrics_glossary.html">S3
  /// Storage Lens metrics glossary</a> in the <i>Amazon S3 User Guide</i>.
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

  /// Submits an updated route configuration for a Multi-Region Access Point.
  /// This API operation updates the routing status for the specified Regions
  /// from active to passive, or from passive to active. A value of
  /// <code>0</code> indicates a passive status, which means that traffic won't
  /// be routed to the specified Region. A value of <code>100</code> indicates
  /// an active status, which means that traffic will be routed to the specified
  /// Region. At least one Region must be active at all times.
  ///
  /// When the routing configuration is changed, any in-progress operations
  /// (uploads, copies, deletes, and so on) to formerly active Regions will
  /// continue to run to their final completion state (success or failure). The
  /// routing configurations of any Regions that aren’t specified remain
  /// unchanged.
  /// <note>
  /// Updated routing configurations might not be immediately applied. It can
  /// take up to 2 minutes for your changes to take effect.
  /// </note>
  /// To submit routing control changes and failover requests, use the Amazon S3
  /// failover control infrastructure endpoints in these five Amazon Web
  /// Services Regions:
  ///
  /// <ul>
  /// <li>
  /// <code>us-east-1</code>
  /// </li>
  /// <li>
  /// <code>us-west-2</code>
  /// </li>
  /// <li>
  /// <code>ap-southeast-2</code>
  /// </li>
  /// <li>
  /// <code>ap-northeast-1</code>
  /// </li>
  /// <li>
  /// <code>eu-west-1</code>
  /// </li>
  /// </ul> <note>
  /// Your Amazon S3 bucket does not need to be in these five Regions.
  /// </note>
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID for the owner of the Multi-Region
  /// Access Point.
  ///
  /// Parameter [mrap] :
  /// The Multi-Region Access Point ARN.
  ///
  /// Parameter [routeUpdates] :
  /// The different routes that make up the new route configuration. Active
  /// routes return a value of <code>100</code>, and passive routes return a
  /// value of <code>0</code>.
  Future<void> submitMultiRegionAccessPointRoutes({
    required String accountId,
    required String mrap,
    required List<MultiRegionAccessPointRoute> routeUpdates,
  }) async {
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    await _protocol.send(
      method: 'PATCH',
      requestUri:
          '/v20180820/mrap/instances/${mrap.split('/').map(Uri.encodeComponent).join('/')}/routes',
      headers: headers,
      payload: SubmitMultiRegionAccessPointRoutesRequest(
              accountId: accountId, mrap: mrap, routeUpdates: routeUpdates)
          .toXml(
        'SubmitMultiRegionAccessPointRoutesRequest',
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
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/batch-ops.html">S3
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
  /// The Amazon Web Services account ID associated with the S3 Batch Operations
  /// job.
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
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/batch-ops.html">S3
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
  /// The Amazon Web Services account ID associated with the S3 Batch Operations
  /// job.
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

/// A container for information about access control for replicas.
/// <note>
/// This is not supported by Amazon S3 on Outposts buckets.
/// </note>
class AccessControlTranslation {
  /// Specifies the replica ownership.
  final OwnerOverride owner;

  AccessControlTranslation({
    required this.owner,
  });
  factory AccessControlTranslation.fromXml(_s.XmlElement elem) {
    return AccessControlTranslation(
      owner: _s.extractXmlStringValue(elem, 'Owner')!.toOwnerOverride(),
    );
  }

  Map<String, dynamic> toJson() {
    final owner = this.owner;
    return {
      'Owner': owner.toValue(),
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final owner = this.owner;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Owner', owner.toValue()),
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

  /// The name or alias of the access point.
  final String? alias;

  /// The Amazon Web Services account ID associated with the S3 bucket associated
  /// with this access point.
  final String? bucketAccountId;

  /// The virtual private cloud (VPC) configuration for this access point, if one
  /// exists.
  /// <note>
  /// This element is empty if this access point is an Amazon S3 on Outposts
  /// access point that is used by other Amazon Web Services.
  /// </note>
  final VpcConfiguration? vpcConfiguration;

  AccessPoint({
    required this.bucket,
    required this.name,
    required this.networkOrigin,
    this.accessPointArn,
    this.alias,
    this.bucketAccountId,
    this.vpcConfiguration,
  });
  factory AccessPoint.fromXml(_s.XmlElement elem) {
    return AccessPoint(
      bucket: _s.extractXmlStringValue(elem, 'Bucket')!,
      name: _s.extractXmlStringValue(elem, 'Name')!,
      networkOrigin:
          _s.extractXmlStringValue(elem, 'NetworkOrigin')!.toNetworkOrigin(),
      accessPointArn: _s.extractXmlStringValue(elem, 'AccessPointArn'),
      alias: _s.extractXmlStringValue(elem, 'Alias'),
      bucketAccountId: _s.extractXmlStringValue(elem, 'BucketAccountId'),
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
    final alias = this.alias;
    final bucketAccountId = this.bucketAccountId;
    final vpcConfiguration = this.vpcConfiguration;
    return {
      'Bucket': bucket,
      'Name': name,
      'NetworkOrigin': networkOrigin.toValue(),
      if (accessPointArn != null) 'AccessPointArn': accessPointArn,
      if (alias != null) 'Alias': alias,
      if (bucketAccountId != null) 'BucketAccountId': bucketAccountId,
      if (vpcConfiguration != null) 'VpcConfiguration': vpcConfiguration,
    };
  }
}

/// A container for the account-level Amazon S3 Storage Lens configuration.
///
/// For more information about S3 Storage Lens, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage_lens.html">Assessing
/// your storage activity and usage with S3 Storage Lens</a> in the <i>Amazon S3
/// User Guide</i>. For a complete list of S3 Storage Lens metrics, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage_lens_metrics_glossary.html">S3
/// Storage Lens metrics glossary</a> in the <i>Amazon S3 User Guide</i>.
class AccountLevel {
  /// A container for the S3 Storage Lens bucket-level configuration.
  final BucketLevel bucketLevel;

  /// A container for S3 Storage Lens activity metrics.
  final ActivityMetrics? activityMetrics;

  /// A container for S3 Storage Lens advanced cost-optimization metrics.
  final AdvancedCostOptimizationMetrics? advancedCostOptimizationMetrics;

  /// A container for S3 Storage Lens advanced data-protection metrics.
  final AdvancedDataProtectionMetrics? advancedDataProtectionMetrics;

  /// A container for detailed status code metrics.
  final DetailedStatusCodesMetrics? detailedStatusCodesMetrics;

  AccountLevel({
    required this.bucketLevel,
    this.activityMetrics,
    this.advancedCostOptimizationMetrics,
    this.advancedDataProtectionMetrics,
    this.detailedStatusCodesMetrics,
  });
  factory AccountLevel.fromXml(_s.XmlElement elem) {
    return AccountLevel(
      bucketLevel:
          BucketLevel.fromXml(_s.extractXmlChild(elem, 'BucketLevel')!),
      activityMetrics: _s
          .extractXmlChild(elem, 'ActivityMetrics')
          ?.let((e) => ActivityMetrics.fromXml(e)),
      advancedCostOptimizationMetrics: _s
          .extractXmlChild(elem, 'AdvancedCostOptimizationMetrics')
          ?.let((e) => AdvancedCostOptimizationMetrics.fromXml(e)),
      advancedDataProtectionMetrics: _s
          .extractXmlChild(elem, 'AdvancedDataProtectionMetrics')
          ?.let((e) => AdvancedDataProtectionMetrics.fromXml(e)),
      detailedStatusCodesMetrics: _s
          .extractXmlChild(elem, 'DetailedStatusCodesMetrics')
          ?.let((e) => DetailedStatusCodesMetrics.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final bucketLevel = this.bucketLevel;
    final activityMetrics = this.activityMetrics;
    final advancedCostOptimizationMetrics =
        this.advancedCostOptimizationMetrics;
    final advancedDataProtectionMetrics = this.advancedDataProtectionMetrics;
    final detailedStatusCodesMetrics = this.detailedStatusCodesMetrics;
    return {
      'BucketLevel': bucketLevel,
      if (activityMetrics != null) 'ActivityMetrics': activityMetrics,
      if (advancedCostOptimizationMetrics != null)
        'AdvancedCostOptimizationMetrics': advancedCostOptimizationMetrics,
      if (advancedDataProtectionMetrics != null)
        'AdvancedDataProtectionMetrics': advancedDataProtectionMetrics,
      if (detailedStatusCodesMetrics != null)
        'DetailedStatusCodesMetrics': detailedStatusCodesMetrics,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final bucketLevel = this.bucketLevel;
    final activityMetrics = this.activityMetrics;
    final advancedCostOptimizationMetrics =
        this.advancedCostOptimizationMetrics;
    final advancedDataProtectionMetrics = this.advancedDataProtectionMetrics;
    final detailedStatusCodesMetrics = this.detailedStatusCodesMetrics;
    final $children = <_s.XmlNode>[
      if (activityMetrics != null) activityMetrics.toXml('ActivityMetrics'),
      bucketLevel.toXml('BucketLevel'),
      if (advancedCostOptimizationMetrics != null)
        advancedCostOptimizationMetrics
            .toXml('AdvancedCostOptimizationMetrics'),
      if (advancedDataProtectionMetrics != null)
        advancedDataProtectionMetrics.toXml('AdvancedDataProtectionMetrics'),
      if (detailedStatusCodesMetrics != null)
        detailedStatusCodesMetrics.toXml('DetailedStatusCodesMetrics'),
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

/// The container element for Amazon S3 Storage Lens activity metrics. Activity
/// metrics show details about how your storage is requested, such as requests
/// (for example, All requests, Get requests, Put requests), bytes uploaded or
/// downloaded, and errors.
///
/// For more information about S3 Storage Lens, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage_lens.html">Assessing
/// your storage activity and usage with S3 Storage Lens</a> in the <i>Amazon S3
/// User Guide</i>. For a complete list of S3 Storage Lens metrics, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage_lens_metrics_glossary.html">S3
/// Storage Lens metrics glossary</a> in the <i>Amazon S3 User Guide</i>.
class ActivityMetrics {
  /// A container that indicates whether activity metrics are enabled.
  final bool? isEnabled;

  ActivityMetrics({
    this.isEnabled,
  });
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

/// The container element for Amazon S3 Storage Lens advanced cost-optimization
/// metrics. Advanced cost-optimization metrics provide insights that you can
/// use to manage and optimize your storage costs, for example, lifecycle rule
/// counts for transitions, expirations, and incomplete multipart uploads.
///
/// For more information about S3 Storage Lens, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage_lens.html">Assessing
/// your storage activity and usage with S3 Storage Lens</a> in the <i>Amazon S3
/// User Guide</i>. For a complete list of S3 Storage Lens metrics, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage_lens_metrics_glossary.html">S3
/// Storage Lens metrics glossary</a> in the <i>Amazon S3 User Guide</i>.
class AdvancedCostOptimizationMetrics {
  /// A container that indicates whether advanced cost-optimization metrics are
  /// enabled.
  final bool? isEnabled;

  AdvancedCostOptimizationMetrics({
    this.isEnabled,
  });
  factory AdvancedCostOptimizationMetrics.fromXml(_s.XmlElement elem) {
    return AdvancedCostOptimizationMetrics(
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

/// The container element for Amazon S3 Storage Lens advanced data-protection
/// metrics. Advanced data-protection metrics provide insights that you can use
/// to perform audits and protect your data, for example replication rule counts
/// within and across Regions.
///
/// For more information about S3 Storage Lens, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage_lens.html">Assessing
/// your storage activity and usage with S3 Storage Lens</a> in the <i>Amazon S3
/// User Guide</i>. For a complete list of S3 Storage Lens metrics, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage_lens_metrics_glossary.html">S3
/// Storage Lens metrics glossary</a> in the <i>Amazon S3 User Guide</i>.
class AdvancedDataProtectionMetrics {
  /// A container that indicates whether advanced data-protection metrics are
  /// enabled.
  final bool? isEnabled;

  AdvancedDataProtectionMetrics({
    this.isEnabled,
  });
  factory AdvancedDataProtectionMetrics.fromXml(_s.XmlElement elem) {
    return AdvancedDataProtectionMetrics(
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

/// Error details for the failed asynchronous operation.
class AsyncErrorDetails {
  /// A string that uniquely identifies the error condition.
  final String? code;

  /// A generic description of the error condition in English.
  final String? message;

  /// The ID of the request associated with the error.
  final String? requestId;

  /// The identifier of the resource associated with the error.
  final String? resource;

  AsyncErrorDetails({
    this.code,
    this.message,
    this.requestId,
    this.resource,
  });
  factory AsyncErrorDetails.fromXml(_s.XmlElement elem) {
    return AsyncErrorDetails(
      code: _s.extractXmlStringValue(elem, 'Code'),
      message: _s.extractXmlStringValue(elem, 'Message'),
      requestId: _s.extractXmlStringValue(elem, 'RequestId'),
      resource: _s.extractXmlStringValue(elem, 'Resource'),
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    final requestId = this.requestId;
    final resource = this.resource;
    return {
      if (code != null) 'Code': code,
      if (message != null) 'Message': message,
      if (requestId != null) 'RequestId': requestId,
      if (resource != null) 'Resource': resource,
    };
  }
}

/// A container for the information about an asynchronous operation.
class AsyncOperation {
  /// The time that the request was sent to the service.
  final DateTime? creationTime;

  /// The specific operation for the asynchronous request.
  final AsyncOperationName? operation;

  /// The parameters associated with the request.
  final AsyncRequestParameters? requestParameters;

  /// The current status of the request.
  final String? requestStatus;

  /// The request token associated with the request.
  final String? requestTokenARN;

  /// The details of the response.
  final AsyncResponseDetails? responseDetails;

  AsyncOperation({
    this.creationTime,
    this.operation,
    this.requestParameters,
    this.requestStatus,
    this.requestTokenARN,
    this.responseDetails,
  });
  factory AsyncOperation.fromXml(_s.XmlElement elem) {
    return AsyncOperation(
      creationTime: _s.extractXmlDateTimeValue(elem, 'CreationTime'),
      operation:
          _s.extractXmlStringValue(elem, 'Operation')?.toAsyncOperationName(),
      requestParameters: _s
          .extractXmlChild(elem, 'RequestParameters')
          ?.let((e) => AsyncRequestParameters.fromXml(e)),
      requestStatus: _s.extractXmlStringValue(elem, 'RequestStatus'),
      requestTokenARN: _s.extractXmlStringValue(elem, 'RequestTokenARN'),
      responseDetails: _s
          .extractXmlChild(elem, 'ResponseDetails')
          ?.let((e) => AsyncResponseDetails.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final operation = this.operation;
    final requestParameters = this.requestParameters;
    final requestStatus = this.requestStatus;
    final requestTokenARN = this.requestTokenARN;
    final responseDetails = this.responseDetails;
    return {
      if (creationTime != null) 'CreationTime': iso8601ToJson(creationTime),
      if (operation != null) 'Operation': operation.toValue(),
      if (requestParameters != null) 'RequestParameters': requestParameters,
      if (requestStatus != null) 'RequestStatus': requestStatus,
      if (requestTokenARN != null) 'RequestTokenARN': requestTokenARN,
      if (responseDetails != null) 'ResponseDetails': responseDetails,
    };
  }
}

enum AsyncOperationName {
  createMultiRegionAccessPoint,
  deleteMultiRegionAccessPoint,
  putMultiRegionAccessPointPolicy,
}

extension AsyncOperationNameValueExtension on AsyncOperationName {
  String toValue() {
    switch (this) {
      case AsyncOperationName.createMultiRegionAccessPoint:
        return 'CreateMultiRegionAccessPoint';
      case AsyncOperationName.deleteMultiRegionAccessPoint:
        return 'DeleteMultiRegionAccessPoint';
      case AsyncOperationName.putMultiRegionAccessPointPolicy:
        return 'PutMultiRegionAccessPointPolicy';
    }
  }
}

extension AsyncOperationNameFromString on String {
  AsyncOperationName toAsyncOperationName() {
    switch (this) {
      case 'CreateMultiRegionAccessPoint':
        return AsyncOperationName.createMultiRegionAccessPoint;
      case 'DeleteMultiRegionAccessPoint':
        return AsyncOperationName.deleteMultiRegionAccessPoint;
      case 'PutMultiRegionAccessPointPolicy':
        return AsyncOperationName.putMultiRegionAccessPointPolicy;
    }
    throw Exception('$this is not known in enum AsyncOperationName');
  }
}

/// A container for the request parameters associated with an asynchronous
/// request.
class AsyncRequestParameters {
  /// A container of the parameters for a <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_CreateMultiRegionAccessPoint.html">CreateMultiRegionAccessPoint</a>
  /// request.
  final CreateMultiRegionAccessPointInput? createMultiRegionAccessPointRequest;

  /// A container of the parameters for a <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DeleteMultiRegionAccessPoint.html">DeleteMultiRegionAccessPoint</a>
  /// request.
  final DeleteMultiRegionAccessPointInput? deleteMultiRegionAccessPointRequest;

  /// A container of the parameters for a <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_PutMultiRegionAccessPoint.html">PutMultiRegionAccessPoint</a>
  /// request.
  final PutMultiRegionAccessPointPolicyInput?
      putMultiRegionAccessPointPolicyRequest;

  AsyncRequestParameters({
    this.createMultiRegionAccessPointRequest,
    this.deleteMultiRegionAccessPointRequest,
    this.putMultiRegionAccessPointPolicyRequest,
  });
  factory AsyncRequestParameters.fromXml(_s.XmlElement elem) {
    return AsyncRequestParameters(
      createMultiRegionAccessPointRequest: _s
          .extractXmlChild(elem, 'CreateMultiRegionAccessPointRequest')
          ?.let((e) => CreateMultiRegionAccessPointInput.fromXml(e)),
      deleteMultiRegionAccessPointRequest: _s
          .extractXmlChild(elem, 'DeleteMultiRegionAccessPointRequest')
          ?.let((e) => DeleteMultiRegionAccessPointInput.fromXml(e)),
      putMultiRegionAccessPointPolicyRequest: _s
          .extractXmlChild(elem, 'PutMultiRegionAccessPointPolicyRequest')
          ?.let((e) => PutMultiRegionAccessPointPolicyInput.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final createMultiRegionAccessPointRequest =
        this.createMultiRegionAccessPointRequest;
    final deleteMultiRegionAccessPointRequest =
        this.deleteMultiRegionAccessPointRequest;
    final putMultiRegionAccessPointPolicyRequest =
        this.putMultiRegionAccessPointPolicyRequest;
    return {
      if (createMultiRegionAccessPointRequest != null)
        'CreateMultiRegionAccessPointRequest':
            createMultiRegionAccessPointRequest,
      if (deleteMultiRegionAccessPointRequest != null)
        'DeleteMultiRegionAccessPointRequest':
            deleteMultiRegionAccessPointRequest,
      if (putMultiRegionAccessPointPolicyRequest != null)
        'PutMultiRegionAccessPointPolicyRequest':
            putMultiRegionAccessPointPolicyRequest,
    };
  }
}

/// A container for the response details that are returned when querying about
/// an asynchronous request.
class AsyncResponseDetails {
  /// Error details for an asynchronous request.
  final AsyncErrorDetails? errorDetails;

  /// The details for the Multi-Region Access Point.
  final MultiRegionAccessPointsAsyncResponse? multiRegionAccessPointDetails;

  AsyncResponseDetails({
    this.errorDetails,
    this.multiRegionAccessPointDetails,
  });
  factory AsyncResponseDetails.fromXml(_s.XmlElement elem) {
    return AsyncResponseDetails(
      errorDetails: _s
          .extractXmlChild(elem, 'ErrorDetails')
          ?.let((e) => AsyncErrorDetails.fromXml(e)),
      multiRegionAccessPointDetails: _s
          .extractXmlChild(elem, 'MultiRegionAccessPointDetails')
          ?.let((e) => MultiRegionAccessPointsAsyncResponse.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final errorDetails = this.errorDetails;
    final multiRegionAccessPointDetails = this.multiRegionAccessPointDetails;
    return {
      if (errorDetails != null) 'ErrorDetails': errorDetails,
      if (multiRegionAccessPointDetails != null)
        'MultiRegionAccessPointDetails': multiRegionAccessPointDetails,
    };
  }
}

/// Lambda function used to transform objects through an Object Lambda Access
/// Point.
class AwsLambdaTransformation {
  /// The Amazon Resource Name (ARN) of the Lambda function.
  final String functionArn;

  /// Additional JSON that provides supplemental data to the Lambda function used
  /// to transform objects.
  final String? functionPayload;

  AwsLambdaTransformation({
    required this.functionArn,
    this.functionPayload,
  });
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

extension BucketCannedACLValueExtension on BucketCannedACL {
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

extension BucketCannedACLFromString on String {
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

/// A container for the bucket-level configuration for Amazon S3 Storage Lens.
///
/// For more information about S3 Storage Lens, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage_lens.html">Assessing
/// your storage activity and usage with S3 Storage Lens</a> in the <i>Amazon S3
/// User Guide</i>.
class BucketLevel {
  /// A container for the bucket-level activity metrics for S3 Storage Lens.
  final ActivityMetrics? activityMetrics;

  /// A container for bucket-level advanced cost-optimization metrics for S3
  /// Storage Lens.
  final AdvancedCostOptimizationMetrics? advancedCostOptimizationMetrics;

  /// A container for bucket-level advanced data-protection metrics for S3 Storage
  /// Lens.
  final AdvancedDataProtectionMetrics? advancedDataProtectionMetrics;

  /// A container for bucket-level detailed status code metrics for S3 Storage
  /// Lens.
  final DetailedStatusCodesMetrics? detailedStatusCodesMetrics;

  /// A container for the prefix-level metrics for S3 Storage Lens.
  final PrefixLevel? prefixLevel;

  BucketLevel({
    this.activityMetrics,
    this.advancedCostOptimizationMetrics,
    this.advancedDataProtectionMetrics,
    this.detailedStatusCodesMetrics,
    this.prefixLevel,
  });
  factory BucketLevel.fromXml(_s.XmlElement elem) {
    return BucketLevel(
      activityMetrics: _s
          .extractXmlChild(elem, 'ActivityMetrics')
          ?.let((e) => ActivityMetrics.fromXml(e)),
      advancedCostOptimizationMetrics: _s
          .extractXmlChild(elem, 'AdvancedCostOptimizationMetrics')
          ?.let((e) => AdvancedCostOptimizationMetrics.fromXml(e)),
      advancedDataProtectionMetrics: _s
          .extractXmlChild(elem, 'AdvancedDataProtectionMetrics')
          ?.let((e) => AdvancedDataProtectionMetrics.fromXml(e)),
      detailedStatusCodesMetrics: _s
          .extractXmlChild(elem, 'DetailedStatusCodesMetrics')
          ?.let((e) => DetailedStatusCodesMetrics.fromXml(e)),
      prefixLevel: _s
          .extractXmlChild(elem, 'PrefixLevel')
          ?.let((e) => PrefixLevel.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final activityMetrics = this.activityMetrics;
    final advancedCostOptimizationMetrics =
        this.advancedCostOptimizationMetrics;
    final advancedDataProtectionMetrics = this.advancedDataProtectionMetrics;
    final detailedStatusCodesMetrics = this.detailedStatusCodesMetrics;
    final prefixLevel = this.prefixLevel;
    return {
      if (activityMetrics != null) 'ActivityMetrics': activityMetrics,
      if (advancedCostOptimizationMetrics != null)
        'AdvancedCostOptimizationMetrics': advancedCostOptimizationMetrics,
      if (advancedDataProtectionMetrics != null)
        'AdvancedDataProtectionMetrics': advancedDataProtectionMetrics,
      if (detailedStatusCodesMetrics != null)
        'DetailedStatusCodesMetrics': detailedStatusCodesMetrics,
      if (prefixLevel != null) 'PrefixLevel': prefixLevel,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final activityMetrics = this.activityMetrics;
    final advancedCostOptimizationMetrics =
        this.advancedCostOptimizationMetrics;
    final advancedDataProtectionMetrics = this.advancedDataProtectionMetrics;
    final detailedStatusCodesMetrics = this.detailedStatusCodesMetrics;
    final prefixLevel = this.prefixLevel;
    final $children = <_s.XmlNode>[
      if (activityMetrics != null) activityMetrics.toXml('ActivityMetrics'),
      if (prefixLevel != null) prefixLevel.toXml('PrefixLevel'),
      if (advancedCostOptimizationMetrics != null)
        advancedCostOptimizationMetrics
            .toXml('AdvancedCostOptimizationMetrics'),
      if (advancedDataProtectionMetrics != null)
        advancedDataProtectionMetrics.toXml('AdvancedDataProtectionMetrics'),
      if (detailedStatusCodesMetrics != null)
        detailedStatusCodesMetrics.toXml('DetailedStatusCodesMetrics'),
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

extension BucketLocationConstraintValueExtension on BucketLocationConstraint {
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

extension BucketLocationConstraintFromString on String {
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

enum BucketVersioningStatus {
  enabled,
  suspended,
}

extension BucketVersioningStatusValueExtension on BucketVersioningStatus {
  String toValue() {
    switch (this) {
      case BucketVersioningStatus.enabled:
        return 'Enabled';
      case BucketVersioningStatus.suspended:
        return 'Suspended';
    }
  }
}

extension BucketVersioningStatusFromString on String {
  BucketVersioningStatus toBucketVersioningStatus() {
    switch (this) {
      case 'Enabled':
        return BucketVersioningStatus.enabled;
      case 'Suspended':
        return BucketVersioningStatus.suspended;
    }
    throw Exception('$this is not known in enum BucketVersioningStatus');
  }
}

/// A container for enabling Amazon CloudWatch publishing for S3 Storage Lens
/// metrics.
///
/// For more information about publishing S3 Storage Lens metrics to CloudWatch,
/// see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage_lens_view_metrics_cloudwatch.html">Monitor
/// S3 Storage Lens metrics in CloudWatch</a> in the <i>Amazon S3 User
/// Guide</i>.
class CloudWatchMetrics {
  /// A container that indicates whether CloudWatch publishing for S3 Storage Lens
  /// metrics is enabled. A value of <code>true</code> indicates that CloudWatch
  /// publishing for S3 Storage Lens metrics is enabled.
  final bool isEnabled;

  CloudWatchMetrics({
    required this.isEnabled,
  });
  factory CloudWatchMetrics.fromXml(_s.XmlElement elem) {
    return CloudWatchMetrics(
      isEnabled: _s.extractXmlBoolValue(elem, 'IsEnabled')!,
    );
  }

  Map<String, dynamic> toJson() {
    final isEnabled = this.isEnabled;
    return {
      'IsEnabled': isEnabled,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final isEnabled = this.isEnabled;
    final $children = <_s.XmlNode>[
      _s.encodeXmlBoolValue('IsEnabled', isEnabled),
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

class CreateAccessPointForObjectLambdaRequest {
  /// The Amazon Web Services account ID for owner of the specified Object Lambda
  /// Access Point.
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
  /// The alias of the Object Lambda Access Point.
  final ObjectLambdaAccessPointAlias? alias;

  /// Specifies the ARN for the Object Lambda Access Point.
  final String? objectLambdaAccessPointArn;

  CreateAccessPointForObjectLambdaResult({
    this.alias,
    this.objectLambdaAccessPointArn,
  });
  factory CreateAccessPointForObjectLambdaResult.fromXml(_s.XmlElement elem) {
    return CreateAccessPointForObjectLambdaResult(
      alias: _s
          .extractXmlChild(elem, 'Alias')
          ?.let((e) => ObjectLambdaAccessPointAlias.fromXml(e)),
      objectLambdaAccessPointArn:
          _s.extractXmlStringValue(elem, 'ObjectLambdaAccessPointArn'),
    );
  }

  Map<String, dynamic> toJson() {
    final alias = this.alias;
    final objectLambdaAccessPointArn = this.objectLambdaAccessPointArn;
    return {
      if (alias != null) 'Alias': alias,
      if (objectLambdaAccessPointArn != null)
        'ObjectLambdaAccessPointArn': objectLambdaAccessPointArn,
    };
  }
}

class CreateAccessPointRequest {
  /// The Amazon Web Services account ID for the account that owns the specified
  /// access point.
  final String accountId;

  /// The name of the bucket that you want to associate this access point with.
  ///
  /// For using this parameter with Amazon S3 on Outposts with the REST API, you
  /// must specify the name and the x-amz-outpost-id as well.
  ///
  /// For using this parameter with S3 on Outposts with the Amazon Web Services
  /// SDK and CLI, you must specify the ARN of the bucket accessed in the format
  /// <code>arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/bucket/&lt;my-bucket-name&gt;</code>.
  /// For example, to access the bucket <code>reports</code> through Outpost
  /// <code>my-outpost</code> owned by account <code>123456789012</code> in Region
  /// <code>us-west-2</code>, use the URL encoding of
  /// <code>arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/bucket/reports</code>.
  /// The value must be URL encoded.
  final String bucket;

  /// The name you want to assign to this access point.
  final String name;

  /// The Amazon Web Services account ID associated with the S3 bucket associated
  /// with this access point.
  final String? bucketAccountId;

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
    this.bucketAccountId,
    this.publicAccessBlockConfiguration,
    this.vpcConfiguration,
  });

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final bucket = this.bucket;
    final name = this.name;
    final bucketAccountId = this.bucketAccountId;
    final publicAccessBlockConfiguration = this.publicAccessBlockConfiguration;
    final vpcConfiguration = this.vpcConfiguration;
    return {
      'Bucket': bucket,
      if (bucketAccountId != null) 'BucketAccountId': bucketAccountId,
      if (publicAccessBlockConfiguration != null)
        'PublicAccessBlockConfiguration': publicAccessBlockConfiguration,
      if (vpcConfiguration != null) 'VpcConfiguration': vpcConfiguration,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final accountId = this.accountId;
    final bucket = this.bucket;
    final name = this.name;
    final bucketAccountId = this.bucketAccountId;
    final publicAccessBlockConfiguration = this.publicAccessBlockConfiguration;
    final vpcConfiguration = this.vpcConfiguration;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Bucket', bucket),
      if (vpcConfiguration != null) vpcConfiguration.toXml('VpcConfiguration'),
      if (publicAccessBlockConfiguration != null)
        publicAccessBlockConfiguration.toXml('PublicAccessBlockConfiguration'),
      if (bucketAccountId != null)
        _s.encodeXmlStringValue('BucketAccountId', bucketAccountId),
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

  /// The name or alias of the access point.
  final String? alias;

  CreateAccessPointResult({
    this.accessPointArn,
    this.alias,
  });
  factory CreateAccessPointResult.fromXml(_s.XmlElement elem) {
    return CreateAccessPointResult(
      accessPointArn: _s.extractXmlStringValue(elem, 'AccessPointArn'),
      alias: _s.extractXmlStringValue(elem, 'Alias'),
    );
  }

  Map<String, dynamic> toJson() {
    final accessPointArn = this.accessPointArn;
    final alias = this.alias;
    return {
      if (accessPointArn != null) 'AccessPointArn': accessPointArn,
      if (alias != null) 'Alias': alias,
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
  /// For using this parameter with S3 on Outposts with the Amazon Web Services
  /// SDK and CLI, you must specify the ARN of the bucket accessed in the format
  /// <code>arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/bucket/&lt;my-bucket-name&gt;</code>.
  /// For example, to access the bucket <code>reports</code> through Outpost
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

  Map<String, dynamic> toJson() {
    final bucketArn = this.bucketArn;
    final location = this.location;
    return {
      if (bucketArn != null) 'BucketArn': bucketArn,
    };
  }
}

class CreateJobRequest {
  /// The Amazon Web Services account ID that creates the job.
  final String accountId;

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

  /// The Amazon Resource Name (ARN) for the Identity and Access Management (IAM)
  /// role that Batch Operations will use to run this job's action on every object
  /// in the manifest.
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

  /// Configuration parameters for the manifest.
  final JobManifest? manifest;

  /// The attribute container for the ManifestGenerator details. Jobs must be
  /// created with either a manifest file or a ManifestGenerator, but not both.
  final JobManifestGenerator? manifestGenerator;

  /// A set of tags to associate with the S3 Batch Operations job. This is an
  /// optional parameter.
  final List<S3Tag>? tags;

  CreateJobRequest({
    required this.accountId,
    required this.operation,
    required this.priority,
    required this.report,
    required this.roleArn,
    this.clientRequestToken,
    this.confirmationRequired,
    this.description,
    this.manifest,
    this.manifestGenerator,
    this.tags,
  });

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final operation = this.operation;
    final priority = this.priority;
    final report = this.report;
    final roleArn = this.roleArn;
    final clientRequestToken = this.clientRequestToken;
    final confirmationRequired = this.confirmationRequired;
    final description = this.description;
    final manifest = this.manifest;
    final manifestGenerator = this.manifestGenerator;
    final tags = this.tags;
    return {
      'Operation': operation,
      'Priority': priority,
      'Report': report,
      'RoleArn': roleArn,
      if (clientRequestToken != null) 'ClientRequestToken': clientRequestToken,
      if (confirmationRequired != null)
        'ConfirmationRequired': confirmationRequired,
      if (description != null) 'Description': description,
      if (manifest != null) 'Manifest': manifest,
      if (manifestGenerator != null) 'ManifestGenerator': manifestGenerator,
      if (tags != null) 'Tags': tags,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final accountId = this.accountId;
    final operation = this.operation;
    final priority = this.priority;
    final report = this.report;
    final roleArn = this.roleArn;
    final clientRequestToken = this.clientRequestToken;
    final confirmationRequired = this.confirmationRequired;
    final description = this.description;
    final manifest = this.manifest;
    final manifestGenerator = this.manifestGenerator;
    final tags = this.tags;
    final $children = <_s.XmlNode>[
      if (confirmationRequired != null)
        _s.encodeXmlBoolValue('ConfirmationRequired', confirmationRequired),
      operation.toXml('Operation'),
      report.toXml('Report'),
      if (clientRequestToken != null)
        _s.encodeXmlStringValue('ClientRequestToken', clientRequestToken),
      if (manifest != null) manifest.toXml('Manifest'),
      if (description != null)
        _s.encodeXmlStringValue('Description', description),
      _s.encodeXmlIntValue('Priority', priority),
      _s.encodeXmlStringValue('RoleArn', roleArn),
      if (tags != null)
        _s.XmlElement(
            _s.XmlName('Tags'), [], tags.map((e) => e.toXml('member'))),
      if (manifestGenerator != null)
        manifestGenerator.toXml('ManifestGenerator'),
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

/// A container for the information associated with a <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_CreateMultiRegionAccessPoint.html">CreateMultiRegionAccessPoint</a>
/// request.
class CreateMultiRegionAccessPointInput {
  /// The name of the Multi-Region Access Point associated with this request.
  final String name;

  /// The buckets in different Regions that are associated with the Multi-Region
  /// Access Point.
  final List<Region> regions;
  final PublicAccessBlockConfiguration? publicAccessBlock;

  CreateMultiRegionAccessPointInput({
    required this.name,
    required this.regions,
    this.publicAccessBlock,
  });
  factory CreateMultiRegionAccessPointInput.fromXml(_s.XmlElement elem) {
    return CreateMultiRegionAccessPointInput(
      name: _s.extractXmlStringValue(elem, 'Name')!,
      regions: _s
          .extractXmlChild(elem, 'Regions')!
          .findElements('Region')
          .map((c) => Region.fromXml(c))
          .toList(),
      publicAccessBlock: _s
          .extractXmlChild(elem, 'PublicAccessBlock')
          ?.let((e) => PublicAccessBlockConfiguration.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final regions = this.regions;
    final publicAccessBlock = this.publicAccessBlock;
    return {
      'Name': name,
      'Regions': regions,
      if (publicAccessBlock != null) 'PublicAccessBlock': publicAccessBlock,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final name = this.name;
    final regions = this.regions;
    final publicAccessBlock = this.publicAccessBlock;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Name', name),
      if (publicAccessBlock != null)
        publicAccessBlock.toXml('PublicAccessBlock'),
      _s.XmlElement(
          _s.XmlName('Regions'), [], regions.map((e) => e.toXml('Region'))),
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

class CreateMultiRegionAccessPointRequest {
  /// The Amazon Web Services account ID for the owner of the Multi-Region Access
  /// Point. The owner of the Multi-Region Access Point also must own the
  /// underlying buckets.
  final String accountId;

  /// A container element containing details about the Multi-Region Access Point.
  final CreateMultiRegionAccessPointInput details;

  /// An idempotency token used to identify the request and guarantee that
  /// requests are unique.
  final String? clientToken;

  CreateMultiRegionAccessPointRequest({
    required this.accountId,
    required this.details,
    this.clientToken,
  });

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final details = this.details;
    final clientToken = this.clientToken;
    return {
      'Details': details,
      if (clientToken != null) 'ClientToken': clientToken,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final accountId = this.accountId;
    final details = this.details;
    final clientToken = this.clientToken;
    final $children = <_s.XmlNode>[
      if (clientToken != null)
        _s.encodeXmlStringValue('ClientToken', clientToken),
      details.toXml('Details'),
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

class CreateMultiRegionAccessPointResult {
  /// The request token associated with the request. You can use this token with
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DescribeMultiRegionAccessPointOperation.html">DescribeMultiRegionAccessPointOperation</a>
  /// to determine the status of asynchronous requests.
  final String? requestTokenARN;

  CreateMultiRegionAccessPointResult({
    this.requestTokenARN,
  });
  factory CreateMultiRegionAccessPointResult.fromXml(_s.XmlElement elem) {
    return CreateMultiRegionAccessPointResult(
      requestTokenARN: _s.extractXmlStringValue(elem, 'RequestTokenARN'),
    );
  }

  Map<String, dynamic> toJson() {
    final requestTokenARN = this.requestTokenARN;
    return {
      if (requestTokenARN != null) 'RequestTokenARN': requestTokenARN,
    };
  }
}

class DeleteJobTaggingResult {
  DeleteJobTaggingResult();
  factory DeleteJobTaggingResult.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeleteJobTaggingResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Specifies whether S3 on Outposts replicates delete markers. If you specify a
/// <code>Filter</code> element in your replication configuration, you must also
/// include a <code>DeleteMarkerReplication</code> element. If your
/// <code>Filter</code> includes a <code>Tag</code> element, the
/// <code>DeleteMarkerReplication</code> element's <code>Status</code> child
/// element must be set to <code>Disabled</code>, because S3 on Outposts does
/// not support replicating delete markers for tag-based rules.
///
/// For more information about delete marker replication, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3OutpostsReplication.html#outposts-replication-what-is-replicated">How
/// delete operations affect replication</a> in the <i>Amazon S3 User Guide</i>.
class DeleteMarkerReplication {
  /// Indicates whether to replicate delete markers.
  final DeleteMarkerReplicationStatus status;

  DeleteMarkerReplication({
    required this.status,
  });
  factory DeleteMarkerReplication.fromXml(_s.XmlElement elem) {
    return DeleteMarkerReplication(
      status: _s
          .extractXmlStringValue(elem, 'Status')!
          .toDeleteMarkerReplicationStatus(),
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

enum DeleteMarkerReplicationStatus {
  enabled,
  disabled,
}

extension DeleteMarkerReplicationStatusValueExtension
    on DeleteMarkerReplicationStatus {
  String toValue() {
    switch (this) {
      case DeleteMarkerReplicationStatus.enabled:
        return 'Enabled';
      case DeleteMarkerReplicationStatus.disabled:
        return 'Disabled';
    }
  }
}

extension DeleteMarkerReplicationStatusFromString on String {
  DeleteMarkerReplicationStatus toDeleteMarkerReplicationStatus() {
    switch (this) {
      case 'Enabled':
        return DeleteMarkerReplicationStatus.enabled;
      case 'Disabled':
        return DeleteMarkerReplicationStatus.disabled;
    }
    throw Exception('$this is not known in enum DeleteMarkerReplicationStatus');
  }
}

/// A container for the information associated with a <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DeleteMultiRegionAccessPoint.html">DeleteMultiRegionAccessPoint</a>
/// request.
class DeleteMultiRegionAccessPointInput {
  /// The name of the Multi-Region Access Point associated with this request.
  final String name;

  DeleteMultiRegionAccessPointInput({
    required this.name,
  });
  factory DeleteMultiRegionAccessPointInput.fromXml(_s.XmlElement elem) {
    return DeleteMultiRegionAccessPointInput(
      name: _s.extractXmlStringValue(elem, 'Name')!,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'Name': name,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final name = this.name;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Name', name),
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

class DeleteMultiRegionAccessPointRequest {
  /// The Amazon Web Services account ID for the owner of the Multi-Region Access
  /// Point.
  final String accountId;

  /// A container element containing details about the Multi-Region Access Point.
  final DeleteMultiRegionAccessPointInput details;

  /// An idempotency token used to identify the request and guarantee that
  /// requests are unique.
  final String? clientToken;

  DeleteMultiRegionAccessPointRequest({
    required this.accountId,
    required this.details,
    this.clientToken,
  });

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final details = this.details;
    final clientToken = this.clientToken;
    return {
      'Details': details,
      if (clientToken != null) 'ClientToken': clientToken,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final accountId = this.accountId;
    final details = this.details;
    final clientToken = this.clientToken;
    final $children = <_s.XmlNode>[
      if (clientToken != null)
        _s.encodeXmlStringValue('ClientToken', clientToken),
      details.toXml('Details'),
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

class DeleteMultiRegionAccessPointResult {
  /// The request token associated with the request. You can use this token with
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DescribeMultiRegionAccessPointOperation.html">DescribeMultiRegionAccessPointOperation</a>
  /// to determine the status of asynchronous requests.
  final String? requestTokenARN;

  DeleteMultiRegionAccessPointResult({
    this.requestTokenARN,
  });
  factory DeleteMultiRegionAccessPointResult.fromXml(_s.XmlElement elem) {
    return DeleteMultiRegionAccessPointResult(
      requestTokenARN: _s.extractXmlStringValue(elem, 'RequestTokenARN'),
    );
  }

  Map<String, dynamic> toJson() {
    final requestTokenARN = this.requestTokenARN;
    return {
      if (requestTokenARN != null) 'RequestTokenARN': requestTokenARN,
    };
  }
}

class DeleteStorageLensConfigurationTaggingResult {
  DeleteStorageLensConfigurationTaggingResult();
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

class DescribeMultiRegionAccessPointOperationResult {
  /// A container element containing the details of the asynchronous operation.
  final AsyncOperation? asyncOperation;

  DescribeMultiRegionAccessPointOperationResult({
    this.asyncOperation,
  });
  factory DescribeMultiRegionAccessPointOperationResult.fromXml(
      _s.XmlElement elem) {
    return DescribeMultiRegionAccessPointOperationResult(
      asyncOperation: _s
          .extractXmlChild(elem, 'AsyncOperation')
          ?.let((e) => AsyncOperation.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final asyncOperation = this.asyncOperation;
    return {
      if (asyncOperation != null) 'AsyncOperation': asyncOperation,
    };
  }
}

/// Specifies information about the replication destination bucket and its
/// settings for an S3 on Outposts replication configuration.
class Destination {
  /// The Amazon Resource Name (ARN) of the access point for the destination
  /// bucket where you want S3 on Outposts to store the replication results.
  final String bucket;

  /// Specify this property only in a cross-account scenario (where the source and
  /// destination bucket owners are not the same), and you want to change replica
  /// ownership to the Amazon Web Services account that owns the destination
  /// bucket. If this property is not specified in the replication configuration,
  /// the replicas are owned by same Amazon Web Services account that owns the
  /// source object.
  /// <note>
  /// This is not supported by Amazon S3 on Outposts buckets.
  /// </note>
  final AccessControlTranslation? accessControlTranslation;

  /// The destination bucket owner's account ID.
  final String? account;

  /// A container that provides information about encryption. If
  /// <code>SourceSelectionCriteria</code> is specified, you must specify this
  /// element.
  /// <note>
  /// This is not supported by Amazon S3 on Outposts buckets.
  /// </note>
  final EncryptionConfiguration? encryptionConfiguration;

  /// A container that specifies replication metrics-related settings.
  final Metrics? metrics;

  /// A container that specifies S3 Replication Time Control (S3 RTC) settings,
  /// including whether S3 RTC is enabled and the time when all objects and
  /// operations on objects must be replicated. Must be specified together with a
  /// <code>Metrics</code> block.
  /// <note>
  /// This is not supported by Amazon S3 on Outposts buckets.
  /// </note>
  final ReplicationTime? replicationTime;

  /// The storage class to use when replicating objects. All objects stored on S3
  /// on Outposts are stored in the <code>OUTPOSTS</code> storage class. S3 on
  /// Outposts uses the <code>OUTPOSTS</code> storage class to create the object
  /// replicas.
  /// <note>
  /// Values other than <code>OUTPOSTS</code> are not supported by Amazon S3 on
  /// Outposts.
  /// </note>
  final ReplicationStorageClass? storageClass;

  Destination({
    required this.bucket,
    this.accessControlTranslation,
    this.account,
    this.encryptionConfiguration,
    this.metrics,
    this.replicationTime,
    this.storageClass,
  });
  factory Destination.fromXml(_s.XmlElement elem) {
    return Destination(
      bucket: _s.extractXmlStringValue(elem, 'Bucket')!,
      accessControlTranslation: _s
          .extractXmlChild(elem, 'AccessControlTranslation')
          ?.let((e) => AccessControlTranslation.fromXml(e)),
      account: _s.extractXmlStringValue(elem, 'Account'),
      encryptionConfiguration: _s
          .extractXmlChild(elem, 'EncryptionConfiguration')
          ?.let((e) => EncryptionConfiguration.fromXml(e)),
      metrics:
          _s.extractXmlChild(elem, 'Metrics')?.let((e) => Metrics.fromXml(e)),
      replicationTime: _s
          .extractXmlChild(elem, 'ReplicationTime')
          ?.let((e) => ReplicationTime.fromXml(e)),
      storageClass: _s
          .extractXmlStringValue(elem, 'StorageClass')
          ?.toReplicationStorageClass(),
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final accessControlTranslation = this.accessControlTranslation;
    final account = this.account;
    final encryptionConfiguration = this.encryptionConfiguration;
    final metrics = this.metrics;
    final replicationTime = this.replicationTime;
    final storageClass = this.storageClass;
    return {
      'Bucket': bucket,
      if (accessControlTranslation != null)
        'AccessControlTranslation': accessControlTranslation,
      if (account != null) 'Account': account,
      if (encryptionConfiguration != null)
        'EncryptionConfiguration': encryptionConfiguration,
      if (metrics != null) 'Metrics': metrics,
      if (replicationTime != null) 'ReplicationTime': replicationTime,
      if (storageClass != null) 'StorageClass': storageClass.toValue(),
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final bucket = this.bucket;
    final accessControlTranslation = this.accessControlTranslation;
    final account = this.account;
    final encryptionConfiguration = this.encryptionConfiguration;
    final metrics = this.metrics;
    final replicationTime = this.replicationTime;
    final storageClass = this.storageClass;
    final $children = <_s.XmlNode>[
      if (account != null) _s.encodeXmlStringValue('Account', account),
      _s.encodeXmlStringValue('Bucket', bucket),
      if (replicationTime != null) replicationTime.toXml('ReplicationTime'),
      if (accessControlTranslation != null)
        accessControlTranslation.toXml('AccessControlTranslation'),
      if (encryptionConfiguration != null)
        encryptionConfiguration.toXml('EncryptionConfiguration'),
      if (metrics != null) metrics.toXml('Metrics'),
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

/// The container element for Amazon S3 Storage Lens detailed status code
/// metrics. Detailed status code metrics generate metrics for HTTP status
/// codes, such as <code>200 OK</code>, <code>403 Forbidden</code>, <code>503
/// Service Unavailable</code> and others.
///
/// For more information about S3 Storage Lens, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage_lens.html">Assessing
/// your storage activity and usage with S3 Storage Lens</a> in the <i>Amazon S3
/// User Guide</i>. For a complete list of S3 Storage Lens metrics, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage_lens_metrics_glossary.html">S3
/// Storage Lens metrics glossary</a> in the <i>Amazon S3 User Guide</i>.
class DetailedStatusCodesMetrics {
  /// A container that indicates whether detailed status code metrics are enabled.
  final bool? isEnabled;

  DetailedStatusCodesMetrics({
    this.isEnabled,
  });
  factory DetailedStatusCodesMetrics.fromXml(_s.XmlElement elem) {
    return DetailedStatusCodesMetrics(
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

/// Specifies encryption-related information for an Amazon S3 bucket that is a
/// destination for replicated objects.
/// <note>
/// This is not supported by Amazon S3 on Outposts buckets.
/// </note>
class EncryptionConfiguration {
  /// Specifies the ID of the customer managed KMS key that's stored in Key
  /// Management Service (KMS) for the destination bucket. This ID is either the
  /// Amazon Resource Name (ARN) for the KMS key or the alias ARN for the KMS key.
  /// Amazon S3 uses this KMS key to encrypt replica objects. Amazon S3 supports
  /// only symmetric encryption KMS keys. For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#symmetric-cmks">Symmetric
  /// encryption KMS keys</a> in the <i>Amazon Web Services Key Management Service
  /// Developer Guide</i>.
  final String? replicaKmsKeyID;

  EncryptionConfiguration({
    this.replicaKmsKeyID,
  });
  factory EncryptionConfiguration.fromXml(_s.XmlElement elem) {
    return EncryptionConfiguration(
      replicaKmsKeyID: _s.extractXmlStringValue(elem, 'ReplicaKmsKeyID'),
    );
  }

  Map<String, dynamic> toJson() {
    final replicaKmsKeyID = this.replicaKmsKeyID;
    return {
      if (replicaKmsKeyID != null) 'ReplicaKmsKeyID': replicaKmsKeyID,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final replicaKmsKeyID = this.replicaKmsKeyID;
    final $children = <_s.XmlNode>[
      if (replicaKmsKeyID != null)
        _s.encodeXmlStringValue('ReplicaKmsKeyID', replicaKmsKeyID),
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

/// The last established access control policy for a Multi-Region Access Point.
///
/// When you update the policy, the update is first listed as the proposed
/// policy. After the update is finished and all Regions have been updated, the
/// proposed policy is listed as the established policy. If both policies have
/// the same version number, the proposed policy is the established policy.
class EstablishedMultiRegionAccessPointPolicy {
  /// The details of the last established policy.
  final String? policy;

  EstablishedMultiRegionAccessPointPolicy({
    this.policy,
  });
  factory EstablishedMultiRegionAccessPointPolicy.fromXml(_s.XmlElement elem) {
    return EstablishedMultiRegionAccessPointPolicy(
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

/// An optional configuration to replicate existing source bucket objects.
/// <note>
/// This is not supported by Amazon S3 on Outposts buckets.
/// </note>
class ExistingObjectReplication {
  /// Specifies whether Amazon S3 replicates existing source bucket objects.
  final ExistingObjectReplicationStatus status;

  ExistingObjectReplication({
    required this.status,
  });
  factory ExistingObjectReplication.fromXml(_s.XmlElement elem) {
    return ExistingObjectReplication(
      status: _s
          .extractXmlStringValue(elem, 'Status')!
          .toExistingObjectReplicationStatus(),
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

enum ExistingObjectReplicationStatus {
  enabled,
  disabled,
}

extension ExistingObjectReplicationStatusValueExtension
    on ExistingObjectReplicationStatus {
  String toValue() {
    switch (this) {
      case ExistingObjectReplicationStatus.enabled:
        return 'Enabled';
      case ExistingObjectReplicationStatus.disabled:
        return 'Disabled';
    }
  }
}

extension ExistingObjectReplicationStatusFromString on String {
  ExistingObjectReplicationStatus toExistingObjectReplicationStatus() {
    switch (this) {
      case 'Enabled':
        return ExistingObjectReplicationStatus.enabled;
      case 'Disabled':
        return ExistingObjectReplicationStatus.disabled;
    }
    throw Exception(
        '$this is not known in enum ExistingObjectReplicationStatus');
  }
}

enum ExpirationStatus {
  enabled,
  disabled,
}

extension ExpirationStatusValueExtension on ExpirationStatus {
  String toValue() {
    switch (this) {
      case ExpirationStatus.enabled:
        return 'Enabled';
      case ExpirationStatus.disabled:
        return 'Disabled';
    }
  }
}

extension ExpirationStatusFromString on String {
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

extension FormatValueExtension on Format {
  String toValue() {
    switch (this) {
      case Format.csv:
        return 'CSV';
      case Format.parquet:
        return 'Parquet';
    }
  }
}

extension FormatFromString on String {
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

/// The encryption configuration to use when storing the generated manifest.
class GeneratedManifestEncryption {
  /// Configuration details on how SSE-KMS is used to encrypt generated manifest
  /// objects.
  final SSEKMSEncryption? ssekms;

  /// Specifies the use of SSE-S3 to encrypt generated manifest objects.
  final SSES3Encryption? sses3;

  GeneratedManifestEncryption({
    this.ssekms,
    this.sses3,
  });
  factory GeneratedManifestEncryption.fromXml(_s.XmlElement elem) {
    return GeneratedManifestEncryption(
      ssekms: _s
          .extractXmlChild(elem, 'SSE-KMS')
          ?.let((e) => SSEKMSEncryption.fromXml(e)),
      sses3: _s
          .extractXmlChild(elem, 'SSE-S3')
          ?.let((e) => SSES3Encryption.fromXml(e)),
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

enum GeneratedManifestFormat {
  s3InventoryReportCsv_20211130,
}

extension GeneratedManifestFormatValueExtension on GeneratedManifestFormat {
  String toValue() {
    switch (this) {
      case GeneratedManifestFormat.s3InventoryReportCsv_20211130:
        return 'S3InventoryReport_CSV_20211130';
    }
  }
}

extension GeneratedManifestFormatFromString on String {
  GeneratedManifestFormat toGeneratedManifestFormat() {
    switch (this) {
      case 'S3InventoryReport_CSV_20211130':
        return GeneratedManifestFormat.s3InventoryReportCsv_20211130;
    }
    throw Exception('$this is not known in enum GeneratedManifestFormat');
  }
}

class GetAccessPointConfigurationForObjectLambdaResult {
  /// Object Lambda Access Point configuration document.
  final ObjectLambdaConfiguration? configuration;

  GetAccessPointConfigurationForObjectLambdaResult({
    this.configuration,
  });
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
  /// The alias of the Object Lambda Access Point.
  final ObjectLambdaAccessPointAlias? alias;

  /// The date and time when the specified Object Lambda Access Point was created.
  final DateTime? creationDate;

  /// The name of the Object Lambda Access Point.
  final String? name;

  /// Configuration to block all public access. This setting is turned on and can
  /// not be edited.
  final PublicAccessBlockConfiguration? publicAccessBlockConfiguration;

  GetAccessPointForObjectLambdaResult({
    this.alias,
    this.creationDate,
    this.name,
    this.publicAccessBlockConfiguration,
  });
  factory GetAccessPointForObjectLambdaResult.fromXml(_s.XmlElement elem) {
    return GetAccessPointForObjectLambdaResult(
      alias: _s
          .extractXmlChild(elem, 'Alias')
          ?.let((e) => ObjectLambdaAccessPointAlias.fromXml(e)),
      creationDate: _s.extractXmlDateTimeValue(elem, 'CreationDate'),
      name: _s.extractXmlStringValue(elem, 'Name'),
      publicAccessBlockConfiguration: _s
          .extractXmlChild(elem, 'PublicAccessBlockConfiguration')
          ?.let((e) => PublicAccessBlockConfiguration.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final alias = this.alias;
    final creationDate = this.creationDate;
    final name = this.name;
    final publicAccessBlockConfiguration = this.publicAccessBlockConfiguration;
    return {
      if (alias != null) 'Alias': alias,
      if (creationDate != null) 'CreationDate': iso8601ToJson(creationDate),
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
  /// The ARN of the access point.
  final String? accessPointArn;

  /// The name or alias of the access point.
  final String? alias;

  /// The name of the bucket associated with the specified access point.
  final String? bucket;

  /// The Amazon Web Services account ID associated with the S3 bucket associated
  /// with this access point.
  final String? bucketAccountId;

  /// The date and time when the specified access point was created.
  final DateTime? creationDate;

  /// The VPC endpoint for the access point.
  final Map<String, String>? endpoints;

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
  /// access point that is used by other Amazon Web Services.
  /// </note>
  final VpcConfiguration? vpcConfiguration;

  GetAccessPointResult({
    this.accessPointArn,
    this.alias,
    this.bucket,
    this.bucketAccountId,
    this.creationDate,
    this.endpoints,
    this.name,
    this.networkOrigin,
    this.publicAccessBlockConfiguration,
    this.vpcConfiguration,
  });
  factory GetAccessPointResult.fromXml(_s.XmlElement elem) {
    return GetAccessPointResult(
      accessPointArn: _s.extractXmlStringValue(elem, 'AccessPointArn'),
      alias: _s.extractXmlStringValue(elem, 'Alias'),
      bucket: _s.extractXmlStringValue(elem, 'Bucket'),
      bucketAccountId: _s.extractXmlStringValue(elem, 'BucketAccountId'),
      creationDate: _s.extractXmlDateTimeValue(elem, 'CreationDate'),
      endpoints: Map.fromEntries(
        elem.getElement('Endpoints')?.findElements('entry').map(
                  (c) => MapEntry(
                    _s.extractXmlStringValue(c, 'key')!,
                    _s.extractXmlStringValue(c, 'value')!,
                  ),
                ) ??
            {},
      ),
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
    final accessPointArn = this.accessPointArn;
    final alias = this.alias;
    final bucket = this.bucket;
    final bucketAccountId = this.bucketAccountId;
    final creationDate = this.creationDate;
    final endpoints = this.endpoints;
    final name = this.name;
    final networkOrigin = this.networkOrigin;
    final publicAccessBlockConfiguration = this.publicAccessBlockConfiguration;
    final vpcConfiguration = this.vpcConfiguration;
    return {
      if (accessPointArn != null) 'AccessPointArn': accessPointArn,
      if (alias != null) 'Alias': alias,
      if (bucket != null) 'Bucket': bucket,
      if (bucketAccountId != null) 'BucketAccountId': bucketAccountId,
      if (creationDate != null) 'CreationDate': iso8601ToJson(creationDate),
      if (endpoints != null) 'Endpoints': endpoints,
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

class GetBucketReplicationResult {
  /// A container for one or more replication rules. A replication configuration
  /// must have at least one rule and you can add up to 100 rules. The maximum
  /// size of a replication configuration is 128 KB.
  final ReplicationConfiguration? replicationConfiguration;

  GetBucketReplicationResult({
    this.replicationConfiguration,
  });
  factory GetBucketReplicationResult.fromXml(_s.XmlElement elem) {
    return GetBucketReplicationResult(
      replicationConfiguration: _s
          .extractXmlChild(elem, 'ReplicationConfiguration')
          ?.let((e) => ReplicationConfiguration.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final replicationConfiguration = this.replicationConfiguration;
    return {
      if (replicationConfiguration != null)
        'ReplicationConfiguration': replicationConfiguration,
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
      if (creationDate != null) 'CreationDate': iso8601ToJson(creationDate),
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

class GetBucketVersioningResult {
  /// Specifies whether MFA delete is enabled in the bucket versioning
  /// configuration. This element is returned only if the bucket has been
  /// configured with MFA delete. If MFA delete has never been configured for the
  /// bucket, this element is not returned.
  final MFADeleteStatus? mFADelete;

  /// The versioning state of the S3 on Outposts bucket.
  final BucketVersioningStatus? status;

  GetBucketVersioningResult({
    this.mFADelete,
    this.status,
  });
  factory GetBucketVersioningResult.fromXml(_s.XmlElement elem) {
    return GetBucketVersioningResult(
      mFADelete:
          _s.extractXmlStringValue(elem, 'MfaDelete')?.toMFADeleteStatus(),
      status:
          _s.extractXmlStringValue(elem, 'Status')?.toBucketVersioningStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final mFADelete = this.mFADelete;
    final status = this.status;
    return {
      if (mFADelete != null) 'MfaDelete': mFADelete.toValue(),
      if (status != null) 'Status': status.toValue(),
    };
  }
}

class GetJobTaggingResult {
  /// The set of tags associated with the S3 Batch Operations job.
  final List<S3Tag>? tags;

  GetJobTaggingResult({
    this.tags,
  });
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

class GetMultiRegionAccessPointPolicyResult {
  /// The policy associated with the specified Multi-Region Access Point.
  final MultiRegionAccessPointPolicyDocument? policy;

  GetMultiRegionAccessPointPolicyResult({
    this.policy,
  });
  factory GetMultiRegionAccessPointPolicyResult.fromXml(_s.XmlElement elem) {
    return GetMultiRegionAccessPointPolicyResult(
      policy: _s
          .extractXmlChild(elem, 'Policy')
          ?.let((e) => MultiRegionAccessPointPolicyDocument.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    return {
      if (policy != null) 'Policy': policy,
    };
  }
}

class GetMultiRegionAccessPointPolicyStatusResult {
  final PolicyStatus? established;

  GetMultiRegionAccessPointPolicyStatusResult({
    this.established,
  });
  factory GetMultiRegionAccessPointPolicyStatusResult.fromXml(
      _s.XmlElement elem) {
    return GetMultiRegionAccessPointPolicyStatusResult(
      established: _s
          .extractXmlChild(elem, 'Established')
          ?.let((e) => PolicyStatus.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final established = this.established;
    return {
      if (established != null) 'Established': established,
    };
  }
}

class GetMultiRegionAccessPointResult {
  /// A container element containing the details of the requested Multi-Region
  /// Access Point.
  final MultiRegionAccessPointReport? accessPoint;

  GetMultiRegionAccessPointResult({
    this.accessPoint,
  });
  factory GetMultiRegionAccessPointResult.fromXml(_s.XmlElement elem) {
    return GetMultiRegionAccessPointResult(
      accessPoint: _s
          .extractXmlChild(elem, 'AccessPoint')
          ?.let((e) => MultiRegionAccessPointReport.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final accessPoint = this.accessPoint;
    return {
      if (accessPoint != null) 'AccessPoint': accessPoint,
    };
  }
}

class GetMultiRegionAccessPointRoutesResult {
  /// The Multi-Region Access Point ARN.
  final String? mrap;

  /// The different routes that make up the route configuration. Active routes
  /// return a value of <code>100</code>, and passive routes return a value of
  /// <code>0</code>.
  final List<MultiRegionAccessPointRoute>? routes;

  GetMultiRegionAccessPointRoutesResult({
    this.mrap,
    this.routes,
  });
  factory GetMultiRegionAccessPointRoutesResult.fromXml(_s.XmlElement elem) {
    return GetMultiRegionAccessPointRoutesResult(
      mrap: _s.extractXmlStringValue(elem, 'Mrap'),
      routes: _s.extractXmlChild(elem, 'Routes')?.let((elem) => elem
          .findElements('Route')
          .map((c) => MultiRegionAccessPointRoute.fromXml(c))
          .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final mrap = this.mrap;
    final routes = this.routes;
    return {
      if (mrap != null) 'Mrap': mrap,
      if (routes != null) 'Routes': routes,
    };
  }
}

class GetPublicAccessBlockOutput {
  /// The <code>PublicAccessBlock</code> configuration currently in effect for
  /// this Amazon Web Services account.
  final PublicAccessBlockConfiguration? publicAccessBlockConfiguration;

  GetPublicAccessBlockOutput({
    this.publicAccessBlockConfiguration,
  });

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

  /// The attribute of the JobDescriptor containing details about the job's
  /// generated manifest.
  final S3GeneratedManifestDescriptor? generatedManifestDescriptor;

  /// The Amazon Resource Name (ARN) for this job.
  final String? jobArn;

  /// The ID for the specified job.
  final String? jobId;

  /// The configuration information for the specified job's manifest object.
  final JobManifest? manifest;

  /// The manifest generator that was used to generate a job manifest for this
  /// job.
  final JobManifestGenerator? manifestGenerator;

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

  /// The Amazon Resource Name (ARN) for the Identity and Access Management (IAM)
  /// role assigned to run the tasks for this job.
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
    this.generatedManifestDescriptor,
    this.jobArn,
    this.jobId,
    this.manifest,
    this.manifestGenerator,
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
      generatedManifestDescriptor: _s
          .extractXmlChild(elem, 'GeneratedManifestDescriptor')
          ?.let((e) => S3GeneratedManifestDescriptor.fromXml(e)),
      jobArn: _s.extractXmlStringValue(elem, 'JobArn'),
      jobId: _s.extractXmlStringValue(elem, 'JobId'),
      manifest: _s
          .extractXmlChild(elem, 'Manifest')
          ?.let((e) => JobManifest.fromXml(e)),
      manifestGenerator: _s
          .extractXmlChild(elem, 'ManifestGenerator')
          ?.let((e) => JobManifestGenerator.fromXml(e)),
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
    final generatedManifestDescriptor = this.generatedManifestDescriptor;
    final jobArn = this.jobArn;
    final jobId = this.jobId;
    final manifest = this.manifest;
    final manifestGenerator = this.manifestGenerator;
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
      if (creationTime != null) 'CreationTime': iso8601ToJson(creationTime),
      if (description != null) 'Description': description,
      if (failureReasons != null) 'FailureReasons': failureReasons,
      if (generatedManifestDescriptor != null)
        'GeneratedManifestDescriptor': generatedManifestDescriptor,
      if (jobArn != null) 'JobArn': jobArn,
      if (jobId != null) 'JobId': jobId,
      if (manifest != null) 'Manifest': manifest,
      if (manifestGenerator != null) 'ManifestGenerator': manifestGenerator,
      if (operation != null) 'Operation': operation,
      if (priority != null) 'Priority': priority,
      if (progressSummary != null) 'ProgressSummary': progressSummary,
      if (report != null) 'Report': report,
      if (roleArn != null) 'RoleArn': roleArn,
      if (status != null) 'Status': status.toValue(),
      if (statusUpdateReason != null) 'StatusUpdateReason': statusUpdateReason,
      if (suspendedCause != null) 'SuspendedCause': suspendedCause,
      if (suspendedDate != null) 'SuspendedDate': iso8601ToJson(suspendedDate),
      if (terminationDate != null)
        'TerminationDate': iso8601ToJson(terminationDate),
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
      if (creationTime != null) 'CreationTime': iso8601ToJson(creationTime),
      if (description != null) 'Description': description,
      if (jobId != null) 'JobId': jobId,
      if (operation != null) 'Operation': operation.toValue(),
      if (priority != null) 'Priority': priority,
      if (progressSummary != null) 'ProgressSummary': progressSummary,
      if (status != null) 'Status': status.toValue(),
      if (terminationDate != null)
        'TerminationDate': iso8601ToJson(terminationDate),
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

extension JobManifestFieldNameValueExtension on JobManifestFieldName {
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

extension JobManifestFieldNameFromString on String {
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

extension JobManifestFormatValueExtension on JobManifestFormat {
  String toValue() {
    switch (this) {
      case JobManifestFormat.s3BatchOperationsCsv_20180820:
        return 'S3BatchOperations_CSV_20180820';
      case JobManifestFormat.s3InventoryReportCsv_20161130:
        return 'S3InventoryReport_CSV_20161130';
    }
  }
}

extension JobManifestFormatFromString on String {
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

/// Configures the type of the job's ManifestGenerator.
class JobManifestGenerator {
  /// The S3 job ManifestGenerator's configuration details.
  final S3JobManifestGenerator? s3JobManifestGenerator;

  JobManifestGenerator({
    this.s3JobManifestGenerator,
  });
  factory JobManifestGenerator.fromXml(_s.XmlElement elem) {
    return JobManifestGenerator(
      s3JobManifestGenerator: _s
          .extractXmlChild(elem, 'S3JobManifestGenerator')
          ?.let((e) => S3JobManifestGenerator.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final s3JobManifestGenerator = this.s3JobManifestGenerator;
    return {
      if (s3JobManifestGenerator != null)
        'S3JobManifestGenerator': s3JobManifestGenerator,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final s3JobManifestGenerator = this.s3JobManifestGenerator;
    final $children = <_s.XmlNode>[
      if (s3JobManifestGenerator != null)
        s3JobManifestGenerator.toXml('S3JobManifestGenerator'),
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

/// The filter used to describe a set of objects for the job's manifest.
class JobManifestGeneratorFilter {
  /// If provided, the generated manifest should include only source bucket
  /// objects that were created after this time.
  final DateTime? createdAfter;

  /// If provided, the generated manifest should include only source bucket
  /// objects that were created before this time.
  final DateTime? createdBefore;

  /// Include objects in the generated manifest only if they are eligible for
  /// replication according to the Replication configuration on the source bucket.
  final bool? eligibleForReplication;

  /// If provided, the generated manifest should include only source bucket
  /// objects that have one of the specified Replication statuses.
  final List<ReplicationStatus>? objectReplicationStatuses;

  JobManifestGeneratorFilter({
    this.createdAfter,
    this.createdBefore,
    this.eligibleForReplication,
    this.objectReplicationStatuses,
  });
  factory JobManifestGeneratorFilter.fromXml(_s.XmlElement elem) {
    return JobManifestGeneratorFilter(
      createdAfter: _s.extractXmlDateTimeValue(elem, 'CreatedAfter'),
      createdBefore: _s.extractXmlDateTimeValue(elem, 'CreatedBefore'),
      eligibleForReplication:
          _s.extractXmlBoolValue(elem, 'EligibleForReplication'),
      objectReplicationStatuses: _s
          .extractXmlChild(elem, 'ObjectReplicationStatuses')
          ?.let((elem) => _s
              .extractXmlStringListValues(elem, 'member')
              .map((s) => s.toReplicationStatus())
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAfter = this.createdAfter;
    final createdBefore = this.createdBefore;
    final eligibleForReplication = this.eligibleForReplication;
    final objectReplicationStatuses = this.objectReplicationStatuses;
    return {
      if (createdAfter != null) 'CreatedAfter': iso8601ToJson(createdAfter),
      if (createdBefore != null) 'CreatedBefore': iso8601ToJson(createdBefore),
      if (eligibleForReplication != null)
        'EligibleForReplication': eligibleForReplication,
      if (objectReplicationStatuses != null)
        'ObjectReplicationStatuses':
            objectReplicationStatuses.map((e) => e.toValue()).toList(),
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final createdAfter = this.createdAfter;
    final createdBefore = this.createdBefore;
    final eligibleForReplication = this.eligibleForReplication;
    final objectReplicationStatuses = this.objectReplicationStatuses;
    final $children = <_s.XmlNode>[
      if (eligibleForReplication != null)
        _s.encodeXmlBoolValue('EligibleForReplication', eligibleForReplication),
      if (createdAfter != null)
        _s.encodeXmlDateTimeValue('CreatedAfter', createdAfter),
      if (createdBefore != null)
        _s.encodeXmlDateTimeValue('CreatedBefore', createdBefore),
      if (objectReplicationStatuses != null)
        _s.XmlElement(
            _s.XmlName('ObjectReplicationStatuses'),
            [],
            objectReplicationStatuses
                .map((e) => _s.encodeXmlStringValue('member', e.toValue()))),
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

/// Contains the information required to locate a manifest object.
class JobManifestLocation {
  /// The ETag for the specified manifest object.
  final String eTag;

  /// The Amazon Resource Name (ARN) for a manifest object.
  /// <important>
  /// When you're using XML requests, you must replace special characters (such as
  /// carriage returns) in object keys with their equivalent XML entity codes. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-keys.html#object-key-xml-related-constraints">
  /// XML-related object key constraints</a> in the <i>Amazon S3 User Guide</i>.
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
  /// Directs the specified job to invoke an Lambda function on every object in
  /// the manifest.
  final LambdaInvokeOperation? lambdaInvoke;

  /// Directs the specified job to execute a DELETE Object tagging call on every
  /// object in the manifest.
  final S3DeleteObjectTaggingOperation? s3DeleteObjectTagging;

  /// Directs the specified job to initiate restore requests for every archived
  /// object in the manifest.
  final S3InitiateRestoreObjectOperation? s3InitiateRestoreObject;

  /// Directs the specified job to run a <code>PutObjectAcl</code> call on every
  /// object in the manifest.
  final S3SetObjectAclOperation? s3PutObjectAcl;

  /// Directs the specified job to run a PUT Copy object call on every object in
  /// the manifest.
  final S3CopyObjectOperation? s3PutObjectCopy;
  final S3SetObjectLegalHoldOperation? s3PutObjectLegalHold;
  final S3SetObjectRetentionOperation? s3PutObjectRetention;

  /// Directs the specified job to run a PUT Object tagging call on every object
  /// in the manifest.
  final S3SetObjectTaggingOperation? s3PutObjectTagging;

  /// Directs the specified job to invoke <code>ReplicateObject</code> on every
  /// object in the job's manifest.
  final S3ReplicateObjectOperation? s3ReplicateObject;

  JobOperation({
    this.lambdaInvoke,
    this.s3DeleteObjectTagging,
    this.s3InitiateRestoreObject,
    this.s3PutObjectAcl,
    this.s3PutObjectCopy,
    this.s3PutObjectLegalHold,
    this.s3PutObjectRetention,
    this.s3PutObjectTagging,
    this.s3ReplicateObject,
  });
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
      s3ReplicateObject: _s
          .extractXmlChild(elem, 'S3ReplicateObject')
          ?.let((e) => S3ReplicateObjectOperation.fromXml(e)),
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
    final s3ReplicateObject = this.s3ReplicateObject;
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
      if (s3ReplicateObject != null) 'S3ReplicateObject': s3ReplicateObject,
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
    final s3ReplicateObject = this.s3ReplicateObject;
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
      if (s3ReplicateObject != null)
        s3ReplicateObject.toXml('S3ReplicateObject'),
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

  /// The JobTimers attribute of a job's progress summary.
  final JobTimers? timers;

  /// <p/>
  final int? totalNumberOfTasks;

  JobProgressSummary({
    this.numberOfTasksFailed,
    this.numberOfTasksSucceeded,
    this.timers,
    this.totalNumberOfTasks,
  });
  factory JobProgressSummary.fromXml(_s.XmlElement elem) {
    return JobProgressSummary(
      numberOfTasksFailed: _s.extractXmlIntValue(elem, 'NumberOfTasksFailed'),
      numberOfTasksSucceeded:
          _s.extractXmlIntValue(elem, 'NumberOfTasksSucceeded'),
      timers:
          _s.extractXmlChild(elem, 'Timers')?.let((e) => JobTimers.fromXml(e)),
      totalNumberOfTasks: _s.extractXmlIntValue(elem, 'TotalNumberOfTasks'),
    );
  }

  Map<String, dynamic> toJson() {
    final numberOfTasksFailed = this.numberOfTasksFailed;
    final numberOfTasksSucceeded = this.numberOfTasksSucceeded;
    final timers = this.timers;
    final totalNumberOfTasks = this.totalNumberOfTasks;
    return {
      if (numberOfTasksFailed != null)
        'NumberOfTasksFailed': numberOfTasksFailed,
      if (numberOfTasksSucceeded != null)
        'NumberOfTasksSucceeded': numberOfTasksSucceeded,
      if (timers != null) 'Timers': timers,
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

extension JobReportFormatValueExtension on JobReportFormat {
  String toValue() {
    switch (this) {
      case JobReportFormat.reportCsv_20180820:
        return 'Report_CSV_20180820';
    }
  }
}

extension JobReportFormatFromString on String {
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

extension JobReportScopeValueExtension on JobReportScope {
  String toValue() {
    switch (this) {
      case JobReportScope.allTasks:
        return 'AllTasks';
      case JobReportScope.failedTasksOnly:
        return 'FailedTasksOnly';
    }
  }
}

extension JobReportScopeFromString on String {
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

extension JobStatusValueExtension on JobStatus {
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

extension JobStatusFromString on String {
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

/// Provides timing details for the job.
class JobTimers {
  /// Indicates the elapsed time in seconds the job has been in the Active job
  /// state.
  final int? elapsedTimeInActiveSeconds;

  JobTimers({
    this.elapsedTimeInActiveSeconds,
  });
  factory JobTimers.fromXml(_s.XmlElement elem) {
    return JobTimers(
      elapsedTimeInActiveSeconds:
          _s.extractXmlIntValue(elem, 'ElapsedTimeInActiveSeconds'),
    );
  }

  Map<String, dynamic> toJson() {
    final elapsedTimeInActiveSeconds = this.elapsedTimeInActiveSeconds;
    return {
      if (elapsedTimeInActiveSeconds != null)
        'ElapsedTimeInActiveSeconds': elapsedTimeInActiveSeconds,
    };
  }
}

/// Contains the configuration parameters for a <code>Lambda Invoke</code>
/// operation.
class LambdaInvokeOperation {
  /// The Amazon Resource Name (ARN) for the Lambda function that the specified
  /// job will invoke on every object in the manifest.
  final String? functionArn;

  LambdaInvokeOperation({
    this.functionArn,
  });
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
      if (date != null) 'Date': iso8601ToJson(date),
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
  /// Aborting Incomplete Multipart Uploads Using a Bucket Lifecycle
  /// Configuration</a> in the <i>Amazon S3 User Guide</i>.
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
  /// Minimum object size to which the rule applies.
  final int? objectSizeGreaterThan;

  /// Maximum object size to which the rule applies.
  final int? objectSizeLessThan;

  /// Prefix identifying one or more objects to which the rule applies.
  final String? prefix;

  /// All of these tags must exist in the object's tag set in order for the rule
  /// to apply.
  final List<S3Tag>? tags;

  LifecycleRuleAndOperator({
    this.objectSizeGreaterThan,
    this.objectSizeLessThan,
    this.prefix,
    this.tags,
  });
  factory LifecycleRuleAndOperator.fromXml(_s.XmlElement elem) {
    return LifecycleRuleAndOperator(
      objectSizeGreaterThan:
          _s.extractXmlIntValue(elem, 'ObjectSizeGreaterThan'),
      objectSizeLessThan: _s.extractXmlIntValue(elem, 'ObjectSizeLessThan'),
      prefix: _s.extractXmlStringValue(elem, 'Prefix'),
      tags: _s.extractXmlChild(elem, 'Tags')?.let((elem) =>
          elem.findElements('member').map((c) => S3Tag.fromXml(c)).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final objectSizeGreaterThan = this.objectSizeGreaterThan;
    final objectSizeLessThan = this.objectSizeLessThan;
    final prefix = this.prefix;
    final tags = this.tags;
    return {
      if (objectSizeGreaterThan != null)
        'ObjectSizeGreaterThan': objectSizeGreaterThan,
      if (objectSizeLessThan != null) 'ObjectSizeLessThan': objectSizeLessThan,
      if (prefix != null) 'Prefix': prefix,
      if (tags != null) 'Tags': tags,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final objectSizeGreaterThan = this.objectSizeGreaterThan;
    final objectSizeLessThan = this.objectSizeLessThan;
    final prefix = this.prefix;
    final tags = this.tags;
    final $children = <_s.XmlNode>[
      if (prefix != null) _s.encodeXmlStringValue('Prefix', prefix),
      if (tags != null)
        _s.XmlElement(
            _s.XmlName('Tags'), [], tags.map((e) => e.toXml('member'))),
      if (objectSizeGreaterThan != null)
        _s.encodeXmlIntValue('ObjectSizeGreaterThan', objectSizeGreaterThan),
      if (objectSizeLessThan != null)
        _s.encodeXmlIntValue('ObjectSizeLessThan', objectSizeLessThan),
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

  /// Minimum object size to which the rule applies.
  final int? objectSizeGreaterThan;

  /// Maximum object size to which the rule applies.
  final int? objectSizeLessThan;

  /// Prefix identifying one or more objects to which the rule applies.
  /// <important>
  /// When you're using XML requests, you must replace special characters (such as
  /// carriage returns) in object keys with their equivalent XML entity codes. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-keys.html#object-key-xml-related-constraints">
  /// XML-related object key constraints</a> in the <i>Amazon S3 User Guide</i>.
  /// </important>
  final String? prefix;
  final S3Tag? tag;

  LifecycleRuleFilter({
    this.and,
    this.objectSizeGreaterThan,
    this.objectSizeLessThan,
    this.prefix,
    this.tag,
  });
  factory LifecycleRuleFilter.fromXml(_s.XmlElement elem) {
    return LifecycleRuleFilter(
      and: _s
          .extractXmlChild(elem, 'And')
          ?.let((e) => LifecycleRuleAndOperator.fromXml(e)),
      objectSizeGreaterThan:
          _s.extractXmlIntValue(elem, 'ObjectSizeGreaterThan'),
      objectSizeLessThan: _s.extractXmlIntValue(elem, 'ObjectSizeLessThan'),
      prefix: _s.extractXmlStringValue(elem, 'Prefix'),
      tag: _s.extractXmlChild(elem, 'Tag')?.let((e) => S3Tag.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final and = this.and;
    final objectSizeGreaterThan = this.objectSizeGreaterThan;
    final objectSizeLessThan = this.objectSizeLessThan;
    final prefix = this.prefix;
    final tag = this.tag;
    return {
      if (and != null) 'And': and,
      if (objectSizeGreaterThan != null)
        'ObjectSizeGreaterThan': objectSizeGreaterThan,
      if (objectSizeLessThan != null) 'ObjectSizeLessThan': objectSizeLessThan,
      if (prefix != null) 'Prefix': prefix,
      if (tag != null) 'Tag': tag,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final and = this.and;
    final objectSizeGreaterThan = this.objectSizeGreaterThan;
    final objectSizeLessThan = this.objectSizeLessThan;
    final prefix = this.prefix;
    final tag = this.tag;
    final $children = <_s.XmlNode>[
      if (prefix != null) _s.encodeXmlStringValue('Prefix', prefix),
      if (tag != null) tag.toXml('Tag'),
      if (and != null) and.toXml('And'),
      if (objectSizeGreaterThan != null)
        _s.encodeXmlIntValue('ObjectSizeGreaterThan', objectSizeGreaterThan),
      if (objectSizeLessThan != null)
        _s.encodeXmlIntValue('ObjectSizeLessThan', objectSizeLessThan),
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

class ListMultiRegionAccessPointsResult {
  /// The list of Multi-Region Access Points associated with the user.
  final List<MultiRegionAccessPointReport>? accessPoints;

  /// If the specified bucket has more Multi-Region Access Points than can be
  /// returned in one call to this action, this field contains a continuation
  /// token. You can use this token tin subsequent calls to this action to
  /// retrieve additional Multi-Region Access Points.
  final String? nextToken;

  ListMultiRegionAccessPointsResult({
    this.accessPoints,
    this.nextToken,
  });
  factory ListMultiRegionAccessPointsResult.fromXml(_s.XmlElement elem) {
    return ListMultiRegionAccessPointsResult(
      accessPoints: _s.extractXmlChild(elem, 'AccessPoints')?.let((elem) => elem
          .findElements('AccessPoint')
          .map((c) => MultiRegionAccessPointReport.fromXml(c))
          .toList()),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }

  Map<String, dynamic> toJson() {
    final accessPoints = this.accessPoints;
    final nextToken = this.nextToken;
    return {
      if (accessPoints != null) 'AccessPoints': accessPoints,
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

enum MFADelete {
  enabled,
  disabled,
}

extension MFADeleteValueExtension on MFADelete {
  String toValue() {
    switch (this) {
      case MFADelete.enabled:
        return 'Enabled';
      case MFADelete.disabled:
        return 'Disabled';
    }
  }
}

extension MFADeleteFromString on String {
  MFADelete toMFADelete() {
    switch (this) {
      case 'Enabled':
        return MFADelete.enabled;
      case 'Disabled':
        return MFADelete.disabled;
    }
    throw Exception('$this is not known in enum MFADelete');
  }
}

enum MFADeleteStatus {
  enabled,
  disabled,
}

extension MFADeleteStatusValueExtension on MFADeleteStatus {
  String toValue() {
    switch (this) {
      case MFADeleteStatus.enabled:
        return 'Enabled';
      case MFADeleteStatus.disabled:
        return 'Disabled';
    }
  }
}

extension MFADeleteStatusFromString on String {
  MFADeleteStatus toMFADeleteStatus() {
    switch (this) {
      case 'Enabled':
        return MFADeleteStatus.enabled;
      case 'Disabled':
        return MFADeleteStatus.disabled;
    }
    throw Exception('$this is not known in enum MFADeleteStatus');
  }
}

/// A container that specifies replication metrics-related settings.
class Metrics {
  /// Specifies whether replication metrics are enabled.
  final MetricsStatus status;

  /// A container that specifies the time threshold for emitting the
  /// <code>s3:Replication:OperationMissedThreshold</code> event.
  /// <note>
  /// This is not supported by Amazon S3 on Outposts buckets.
  /// </note>
  final ReplicationTimeValue? eventThreshold;

  Metrics({
    required this.status,
    this.eventThreshold,
  });
  factory Metrics.fromXml(_s.XmlElement elem) {
    return Metrics(
      status: _s.extractXmlStringValue(elem, 'Status')!.toMetricsStatus(),
      eventThreshold: _s
          .extractXmlChild(elem, 'EventThreshold')
          ?.let((e) => ReplicationTimeValue.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final eventThreshold = this.eventThreshold;
    return {
      'Status': status.toValue(),
      if (eventThreshold != null) 'EventThreshold': eventThreshold,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final status = this.status;
    final eventThreshold = this.eventThreshold;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Status', status.toValue()),
      if (eventThreshold != null) eventThreshold.toXml('EventThreshold'),
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

enum MetricsStatus {
  enabled,
  disabled,
}

extension MetricsStatusValueExtension on MetricsStatus {
  String toValue() {
    switch (this) {
      case MetricsStatus.enabled:
        return 'Enabled';
      case MetricsStatus.disabled:
        return 'Disabled';
    }
  }
}

extension MetricsStatusFromString on String {
  MetricsStatus toMetricsStatus() {
    switch (this) {
      case 'Enabled':
        return MetricsStatus.enabled;
      case 'Disabled':
        return MetricsStatus.disabled;
    }
    throw Exception('$this is not known in enum MetricsStatus');
  }
}

/// The Multi-Region Access Point access control policy.
///
/// When you update the policy, the update is first listed as the proposed
/// policy. After the update is finished and all Regions have been updated, the
/// proposed policy is listed as the established policy. If both policies have
/// the same version number, the proposed policy is the established policy.
class MultiRegionAccessPointPolicyDocument {
  /// The last established policy for the Multi-Region Access Point.
  final EstablishedMultiRegionAccessPointPolicy? established;

  /// The proposed policy for the Multi-Region Access Point.
  final ProposedMultiRegionAccessPointPolicy? proposed;

  MultiRegionAccessPointPolicyDocument({
    this.established,
    this.proposed,
  });
  factory MultiRegionAccessPointPolicyDocument.fromXml(_s.XmlElement elem) {
    return MultiRegionAccessPointPolicyDocument(
      established: _s
          .extractXmlChild(elem, 'Established')
          ?.let((e) => EstablishedMultiRegionAccessPointPolicy.fromXml(e)),
      proposed: _s
          .extractXmlChild(elem, 'Proposed')
          ?.let((e) => ProposedMultiRegionAccessPointPolicy.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final established = this.established;
    final proposed = this.proposed;
    return {
      if (established != null) 'Established': established,
      if (proposed != null) 'Proposed': proposed,
    };
  }
}

/// Status information for a single Multi-Region Access Point Region.
class MultiRegionAccessPointRegionalResponse {
  /// The name of the Region in the Multi-Region Access Point.
  final String? name;

  /// The current status of the Multi-Region Access Point in this Region.
  final String? requestStatus;

  MultiRegionAccessPointRegionalResponse({
    this.name,
    this.requestStatus,
  });
  factory MultiRegionAccessPointRegionalResponse.fromXml(_s.XmlElement elem) {
    return MultiRegionAccessPointRegionalResponse(
      name: _s.extractXmlStringValue(elem, 'Name'),
      requestStatus: _s.extractXmlStringValue(elem, 'RequestStatus'),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final requestStatus = this.requestStatus;
    return {
      if (name != null) 'Name': name,
      if (requestStatus != null) 'RequestStatus': requestStatus,
    };
  }
}

/// A collection of statuses for a Multi-Region Access Point in the various
/// Regions it supports.
class MultiRegionAccessPointReport {
  /// The alias for the Multi-Region Access Point. For more information about the
  /// distinction between the name and the alias of an Multi-Region Access Point,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/CreatingMultiRegionAccessPoints.html#multi-region-access-point-naming">Managing
  /// Multi-Region Access Points</a>.
  final String? alias;

  /// When the Multi-Region Access Point create request was received.
  final DateTime? createdAt;

  /// The name of the Multi-Region Access Point.
  final String? name;
  final PublicAccessBlockConfiguration? publicAccessBlock;

  /// A collection of the Regions and buckets associated with the Multi-Region
  /// Access Point.
  final List<RegionReport>? regions;

  /// The current status of the Multi-Region Access Point.
  ///
  /// <code>CREATING</code> and <code>DELETING</code> are temporary states that
  /// exist while the request is propagating and being completed. If a
  /// Multi-Region Access Point has a status of <code>PARTIALLY_CREATED</code>,
  /// you can retry creation or send a request to delete the Multi-Region Access
  /// Point. If a Multi-Region Access Point has a status of
  /// <code>PARTIALLY_DELETED</code>, you can retry a delete request to finish the
  /// deletion of the Multi-Region Access Point.
  final MultiRegionAccessPointStatus? status;

  MultiRegionAccessPointReport({
    this.alias,
    this.createdAt,
    this.name,
    this.publicAccessBlock,
    this.regions,
    this.status,
  });
  factory MultiRegionAccessPointReport.fromXml(_s.XmlElement elem) {
    return MultiRegionAccessPointReport(
      alias: _s.extractXmlStringValue(elem, 'Alias'),
      createdAt: _s.extractXmlDateTimeValue(elem, 'CreatedAt'),
      name: _s.extractXmlStringValue(elem, 'Name'),
      publicAccessBlock: _s
          .extractXmlChild(elem, 'PublicAccessBlock')
          ?.let((e) => PublicAccessBlockConfiguration.fromXml(e)),
      regions: _s.extractXmlChild(elem, 'Regions')?.let((elem) => elem
          .findElements('Region')
          .map((c) => RegionReport.fromXml(c))
          .toList()),
      status: _s
          .extractXmlStringValue(elem, 'Status')
          ?.toMultiRegionAccessPointStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final alias = this.alias;
    final createdAt = this.createdAt;
    final name = this.name;
    final publicAccessBlock = this.publicAccessBlock;
    final regions = this.regions;
    final status = this.status;
    return {
      if (alias != null) 'Alias': alias,
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (name != null) 'Name': name,
      if (publicAccessBlock != null) 'PublicAccessBlock': publicAccessBlock,
      if (regions != null) 'Regions': regions,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// A structure for a Multi-Region Access Point that indicates where Amazon S3
/// traffic can be routed. Routes can be either active or passive. Active routes
/// can process Amazon S3 requests through the Multi-Region Access Point, but
/// passive routes are not eligible to process Amazon S3 requests.
///
/// Each route contains the Amazon S3 bucket name and the Amazon Web Services
/// Region that the bucket is located in. The route also includes the
/// <code>TrafficDialPercentage</code> value, which shows whether the bucket and
/// Region are active (indicated by a value of <code>100</code>) or passive
/// (indicated by a value of <code>0</code>).
class MultiRegionAccessPointRoute {
  /// The traffic state for the specified bucket or Amazon Web Services Region.
  ///
  /// A value of <code>0</code> indicates a passive state, which means that no new
  /// traffic will be routed to the Region.
  ///
  /// A value of <code>100</code> indicates an active state, which means that
  /// traffic will be routed to the specified Region.
  ///
  /// When the routing configuration for a Region is changed from active to
  /// passive, any in-progress operations (uploads, copies, deletes, and so on) to
  /// the formerly active Region will continue to run to until a final success or
  /// failure status is reached.
  ///
  /// If all Regions in the routing configuration are designated as passive,
  /// you'll receive an <code>InvalidRequest</code> error.
  final int trafficDialPercentage;

  /// The name of the Amazon S3 bucket for which you'll submit a routing
  /// configuration change. Either the <code>Bucket</code> or the
  /// <code>Region</code> value must be provided. If both are provided, the bucket
  /// must be in the specified Region.
  final String? bucket;

  /// The Amazon Web Services Region to which you'll be submitting a routing
  /// configuration change. Either the <code>Bucket</code> or the
  /// <code>Region</code> value must be provided. If both are provided, the bucket
  /// must be in the specified Region.
  final String? region;

  MultiRegionAccessPointRoute({
    required this.trafficDialPercentage,
    this.bucket,
    this.region,
  });
  factory MultiRegionAccessPointRoute.fromXml(_s.XmlElement elem) {
    return MultiRegionAccessPointRoute(
      trafficDialPercentage:
          _s.extractXmlIntValue(elem, 'TrafficDialPercentage')!,
      bucket: _s.extractXmlStringValue(elem, 'Bucket'),
      region: _s.extractXmlStringValue(elem, 'Region'),
    );
  }

  Map<String, dynamic> toJson() {
    final trafficDialPercentage = this.trafficDialPercentage;
    final bucket = this.bucket;
    final region = this.region;
    return {
      'TrafficDialPercentage': trafficDialPercentage,
      if (bucket != null) 'Bucket': bucket,
      if (region != null) 'Region': region,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final trafficDialPercentage = this.trafficDialPercentage;
    final bucket = this.bucket;
    final region = this.region;
    final $children = <_s.XmlNode>[
      if (bucket != null) _s.encodeXmlStringValue('Bucket', bucket),
      if (region != null) _s.encodeXmlStringValue('Region', region),
      _s.encodeXmlIntValue('TrafficDialPercentage', trafficDialPercentage),
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

enum MultiRegionAccessPointStatus {
  ready,
  inconsistentAcrossRegions,
  creating,
  partiallyCreated,
  partiallyDeleted,
  deleting,
}

extension MultiRegionAccessPointStatusValueExtension
    on MultiRegionAccessPointStatus {
  String toValue() {
    switch (this) {
      case MultiRegionAccessPointStatus.ready:
        return 'READY';
      case MultiRegionAccessPointStatus.inconsistentAcrossRegions:
        return 'INCONSISTENT_ACROSS_REGIONS';
      case MultiRegionAccessPointStatus.creating:
        return 'CREATING';
      case MultiRegionAccessPointStatus.partiallyCreated:
        return 'PARTIALLY_CREATED';
      case MultiRegionAccessPointStatus.partiallyDeleted:
        return 'PARTIALLY_DELETED';
      case MultiRegionAccessPointStatus.deleting:
        return 'DELETING';
    }
  }
}

extension MultiRegionAccessPointStatusFromString on String {
  MultiRegionAccessPointStatus toMultiRegionAccessPointStatus() {
    switch (this) {
      case 'READY':
        return MultiRegionAccessPointStatus.ready;
      case 'INCONSISTENT_ACROSS_REGIONS':
        return MultiRegionAccessPointStatus.inconsistentAcrossRegions;
      case 'CREATING':
        return MultiRegionAccessPointStatus.creating;
      case 'PARTIALLY_CREATED':
        return MultiRegionAccessPointStatus.partiallyCreated;
      case 'PARTIALLY_DELETED':
        return MultiRegionAccessPointStatus.partiallyDeleted;
      case 'DELETING':
        return MultiRegionAccessPointStatus.deleting;
    }
    throw Exception('$this is not known in enum MultiRegionAccessPointStatus');
  }
}

/// The Multi-Region Access Point details that are returned when querying about
/// an asynchronous request.
class MultiRegionAccessPointsAsyncResponse {
  /// A collection of status information for the different Regions that a
  /// Multi-Region Access Point supports.
  final List<MultiRegionAccessPointRegionalResponse>? regions;

  MultiRegionAccessPointsAsyncResponse({
    this.regions,
  });
  factory MultiRegionAccessPointsAsyncResponse.fromXml(_s.XmlElement elem) {
    return MultiRegionAccessPointsAsyncResponse(
      regions: _s.extractXmlChild(elem, 'Regions')?.let((elem) => elem
          .findElements('Region')
          .map((c) => MultiRegionAccessPointRegionalResponse.fromXml(c))
          .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final regions = this.regions;
    return {
      if (regions != null) 'Regions': regions,
    };
  }
}

enum NetworkOrigin {
  internet,
  vpc,
}

extension NetworkOriginValueExtension on NetworkOrigin {
  String toValue() {
    switch (this) {
      case NetworkOrigin.internet:
        return 'Internet';
      case NetworkOrigin.vpc:
        return 'VPC';
    }
  }
}

extension NetworkOriginFromString on String {
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
  /// Specifies how many noncurrent versions S3 on Outposts will retain. If there
  /// are this many more recent noncurrent versions, S3 on Outposts will take the
  /// associated action. For more information about noncurrent versions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/intro-lifecycle-rules.html">Lifecycle
  /// configuration elements</a> in the <i>Amazon S3 User Guide</i>.
  final int? newerNoncurrentVersions;

  /// Specifies the number of days an object is noncurrent before Amazon S3 can
  /// perform the associated action. For information about the noncurrent days
  /// calculations, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/intro-lifecycle-rules.html#non-current-days-calculations">How
  /// Amazon S3 Calculates When an Object Became Noncurrent</a> in the <i>Amazon
  /// S3 User Guide</i>.
  final int? noncurrentDays;

  NoncurrentVersionExpiration({
    this.newerNoncurrentVersions,
    this.noncurrentDays,
  });
  factory NoncurrentVersionExpiration.fromXml(_s.XmlElement elem) {
    return NoncurrentVersionExpiration(
      newerNoncurrentVersions:
          _s.extractXmlIntValue(elem, 'NewerNoncurrentVersions'),
      noncurrentDays: _s.extractXmlIntValue(elem, 'NoncurrentDays'),
    );
  }

  Map<String, dynamic> toJson() {
    final newerNoncurrentVersions = this.newerNoncurrentVersions;
    final noncurrentDays = this.noncurrentDays;
    return {
      if (newerNoncurrentVersions != null)
        'NewerNoncurrentVersions': newerNoncurrentVersions,
      if (noncurrentDays != null) 'NoncurrentDays': noncurrentDays,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final newerNoncurrentVersions = this.newerNoncurrentVersions;
    final noncurrentDays = this.noncurrentDays;
    final $children = <_s.XmlNode>[
      if (noncurrentDays != null)
        _s.encodeXmlIntValue('NoncurrentDays', noncurrentDays),
      if (newerNoncurrentVersions != null)
        _s.encodeXmlIntValue(
            'NewerNoncurrentVersions', newerNoncurrentVersions),
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

/// An access point with an attached Lambda function used to access transformed
/// data from an Amazon S3 bucket.
class ObjectLambdaAccessPoint {
  /// The name of the Object Lambda Access Point.
  final String name;

  /// The alias of the Object Lambda Access Point.
  final ObjectLambdaAccessPointAlias? alias;

  /// Specifies the ARN for the Object Lambda Access Point.
  final String? objectLambdaAccessPointArn;

  ObjectLambdaAccessPoint({
    required this.name,
    this.alias,
    this.objectLambdaAccessPointArn,
  });
  factory ObjectLambdaAccessPoint.fromXml(_s.XmlElement elem) {
    return ObjectLambdaAccessPoint(
      name: _s.extractXmlStringValue(elem, 'Name')!,
      alias: _s
          .extractXmlChild(elem, 'Alias')
          ?.let((e) => ObjectLambdaAccessPointAlias.fromXml(e)),
      objectLambdaAccessPointArn:
          _s.extractXmlStringValue(elem, 'ObjectLambdaAccessPointArn'),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final alias = this.alias;
    final objectLambdaAccessPointArn = this.objectLambdaAccessPointArn;
    return {
      'Name': name,
      if (alias != null) 'Alias': alias,
      if (objectLambdaAccessPointArn != null)
        'ObjectLambdaAccessPointArn': objectLambdaAccessPointArn,
    };
  }
}

/// The alias of an Object Lambda Access Point. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/olap-use.html#ol-access-points-alias">How
/// to use a bucket-style alias for your S3 bucket Object Lambda Access
/// Point</a>.
class ObjectLambdaAccessPointAlias {
  /// The status of the Object Lambda Access Point alias. If the status is
  /// <code>PROVISIONING</code>, the Object Lambda Access Point is provisioning
  /// the alias and the alias is not ready for use yet. If the status is
  /// <code>READY</code>, the Object Lambda Access Point alias is successfully
  /// provisioned and ready for use.
  final ObjectLambdaAccessPointAliasStatus? status;

  /// The alias value of the Object Lambda Access Point.
  final String? value;

  ObjectLambdaAccessPointAlias({
    this.status,
    this.value,
  });
  factory ObjectLambdaAccessPointAlias.fromXml(_s.XmlElement elem) {
    return ObjectLambdaAccessPointAlias(
      status: _s
          .extractXmlStringValue(elem, 'Status')
          ?.toObjectLambdaAccessPointAliasStatus(),
      value: _s.extractXmlStringValue(elem, 'Value'),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final value = this.value;
    return {
      if (status != null) 'Status': status.toValue(),
      if (value != null) 'Value': value,
    };
  }
}

enum ObjectLambdaAccessPointAliasStatus {
  provisioning,
  ready,
}

extension ObjectLambdaAccessPointAliasStatusValueExtension
    on ObjectLambdaAccessPointAliasStatus {
  String toValue() {
    switch (this) {
      case ObjectLambdaAccessPointAliasStatus.provisioning:
        return 'PROVISIONING';
      case ObjectLambdaAccessPointAliasStatus.ready:
        return 'READY';
    }
  }
}

extension ObjectLambdaAccessPointAliasStatusFromString on String {
  ObjectLambdaAccessPointAliasStatus toObjectLambdaAccessPointAliasStatus() {
    switch (this) {
      case 'PROVISIONING':
        return ObjectLambdaAccessPointAliasStatus.provisioning;
      case 'READY':
        return ObjectLambdaAccessPointAliasStatus.ready;
    }
    throw Exception(
        '$this is not known in enum ObjectLambdaAccessPointAliasStatus');
  }
}

enum ObjectLambdaAllowedFeature {
  getObjectRange,
  getObjectPartNumber,
  headObjectRange,
  headObjectPartNumber,
}

extension ObjectLambdaAllowedFeatureValueExtension
    on ObjectLambdaAllowedFeature {
  String toValue() {
    switch (this) {
      case ObjectLambdaAllowedFeature.getObjectRange:
        return 'GetObject-Range';
      case ObjectLambdaAllowedFeature.getObjectPartNumber:
        return 'GetObject-PartNumber';
      case ObjectLambdaAllowedFeature.headObjectRange:
        return 'HeadObject-Range';
      case ObjectLambdaAllowedFeature.headObjectPartNumber:
        return 'HeadObject-PartNumber';
    }
  }
}

extension ObjectLambdaAllowedFeatureFromString on String {
  ObjectLambdaAllowedFeature toObjectLambdaAllowedFeature() {
    switch (this) {
      case 'GetObject-Range':
        return ObjectLambdaAllowedFeature.getObjectRange;
      case 'GetObject-PartNumber':
        return ObjectLambdaAllowedFeature.getObjectPartNumber;
      case 'HeadObject-Range':
        return ObjectLambdaAllowedFeature.headObjectRange;
      case 'HeadObject-PartNumber':
        return ObjectLambdaAllowedFeature.headObjectPartNumber;
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
  /// <code>GetObject-Range</code>, <code>GetObject-PartNumber</code>,
  /// <code>HeadObject-Range</code>, and <code>HeadObject-PartNumber</code>.
  final List<ObjectLambdaAllowedFeature>? allowedFeatures;

  /// A container for whether the CloudWatch metrics configuration is enabled.
  final bool? cloudWatchMetricsEnabled;

  ObjectLambdaConfiguration({
    required this.supportingAccessPoint,
    required this.transformationConfigurations,
    this.allowedFeatures,
    this.cloudWatchMetricsEnabled,
  });
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
  /// A container for an Lambda function.
  final AwsLambdaTransformation? awsLambda;

  ObjectLambdaContentTransformation({
    this.awsLambda,
  });
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
  /// Valid inputs are <code>GetObject</code>, <code>ListObjects</code>,
  /// <code>HeadObject</code>, and <code>ListObjectsV2</code>.
  final List<ObjectLambdaTransformationConfigurationAction> actions;

  /// A container for the content transformation of an Object Lambda Access Point
  /// configuration.
  final ObjectLambdaContentTransformation contentTransformation;

  ObjectLambdaTransformationConfiguration({
    required this.actions,
    required this.contentTransformation,
  });
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
  headObject,
  listObjects,
  listObjectsV2,
}

extension ObjectLambdaTransformationConfigurationActionValueExtension
    on ObjectLambdaTransformationConfigurationAction {
  String toValue() {
    switch (this) {
      case ObjectLambdaTransformationConfigurationAction.getObject:
        return 'GetObject';
      case ObjectLambdaTransformationConfigurationAction.headObject:
        return 'HeadObject';
      case ObjectLambdaTransformationConfigurationAction.listObjects:
        return 'ListObjects';
      case ObjectLambdaTransformationConfigurationAction.listObjectsV2:
        return 'ListObjectsV2';
    }
  }
}

extension ObjectLambdaTransformationConfigurationActionFromString on String {
  ObjectLambdaTransformationConfigurationAction
      toObjectLambdaTransformationConfigurationAction() {
    switch (this) {
      case 'GetObject':
        return ObjectLambdaTransformationConfigurationAction.getObject;
      case 'HeadObject':
        return ObjectLambdaTransformationConfigurationAction.headObject;
      case 'ListObjects':
        return ObjectLambdaTransformationConfigurationAction.listObjects;
      case 'ListObjectsV2':
        return ObjectLambdaTransformationConfigurationAction.listObjectsV2;
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
  s3ReplicateObject,
}

extension OperationNameValueExtension on OperationName {
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
      case OperationName.s3ReplicateObject:
        return 'S3ReplicateObject';
    }
  }
}

extension OperationNameFromString on String {
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
      case 'S3ReplicateObject':
        return OperationName.s3ReplicateObject;
    }
    throw Exception('$this is not known in enum OperationName');
  }
}

enum OutputSchemaVersion {
  v_1,
}

extension OutputSchemaVersionValueExtension on OutputSchemaVersion {
  String toValue() {
    switch (this) {
      case OutputSchemaVersion.v_1:
        return 'V_1';
    }
  }
}

extension OutputSchemaVersionFromString on String {
  OutputSchemaVersion toOutputSchemaVersion() {
    switch (this) {
      case 'V_1':
        return OutputSchemaVersion.v_1;
    }
    throw Exception('$this is not known in enum OutputSchemaVersion');
  }
}

enum OwnerOverride {
  destination,
}

extension OwnerOverrideValueExtension on OwnerOverride {
  String toValue() {
    switch (this) {
      case OwnerOverride.destination:
        return 'Destination';
    }
  }
}

extension OwnerOverrideFromString on String {
  OwnerOverride toOwnerOverride() {
    switch (this) {
      case 'Destination':
        return OwnerOverride.destination;
    }
    throw Exception('$this is not known in enum OwnerOverride');
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

/// The proposed access control policy for the Multi-Region Access Point.
///
/// When you update the policy, the update is first listed as the proposed
/// policy. After the update is finished and all Regions have been updated, the
/// proposed policy is listed as the established policy. If both policies have
/// the same version number, the proposed policy is the established policy.
class ProposedMultiRegionAccessPointPolicy {
  /// The details of the proposed policy.
  final String? policy;

  ProposedMultiRegionAccessPointPolicy({
    this.policy,
  });
  factory ProposedMultiRegionAccessPointPolicy.fromXml(_s.XmlElement elem) {
    return ProposedMultiRegionAccessPointPolicy(
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

/// The <code>PublicAccessBlock</code> configuration that you want to apply to
/// this Amazon S3 account. You can enable the configuration options in any
/// combination. For more information about when Amazon S3 considers a bucket or
/// object public, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html#access-control-block-public-access-policy-status">The
/// Meaning of "Public"</a> in the <i>Amazon S3 User Guide</i>.
///
/// This data type is not supported for Amazon S3 on Outposts.
class PublicAccessBlockConfiguration {
  /// Specifies whether Amazon S3 should block public access control lists (ACLs)
  /// for buckets in this account. Setting this element to <code>TRUE</code>
  /// causes the following behavior:
  ///
  /// <ul>
  /// <li>
  /// <code>PutBucketAcl</code> and <code>PutObjectAcl</code> calls fail if the
  /// specified ACL is public.
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
  /// This property is not supported for Amazon S3 on Outposts.
  final bool? blockPublicAcls;

  /// Specifies whether Amazon S3 should block public bucket policies for buckets
  /// in this account. Setting this element to <code>TRUE</code> causes Amazon S3
  /// to reject calls to PUT Bucket policy if the specified bucket policy allows
  /// public access.
  ///
  /// Enabling this setting doesn't affect existing bucket policies.
  ///
  /// This property is not supported for Amazon S3 on Outposts.
  final bool? blockPublicPolicy;

  /// Specifies whether Amazon S3 should ignore public ACLs for buckets in this
  /// account. Setting this element to <code>TRUE</code> causes Amazon S3 to
  /// ignore all public ACLs on buckets in this account and any objects that they
  /// contain.
  ///
  /// Enabling this setting doesn't affect the persistence of any existing ACLs
  /// and doesn't prevent new public ACLs from being set.
  ///
  /// This property is not supported for Amazon S3 on Outposts.
  final bool? ignorePublicAcls;

  /// Specifies whether Amazon S3 should restrict public bucket policies for
  /// buckets in this account. Setting this element to <code>TRUE</code> restricts
  /// access to buckets with public policies to only Amazon Web Service principals
  /// and authorized users within this account.
  ///
  /// Enabling this setting doesn't affect previously stored bucket policies,
  /// except that public and cross-account access within any public bucket policy,
  /// including non-public delegation to specific accounts, is blocked.
  ///
  /// This property is not supported for Amazon S3 on Outposts.
  final bool? restrictPublicBuckets;

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
  /// The Amazon Web Services account ID for owner of the bucket associated with
  /// the specified access point.
  final String accountId;

  /// The name of the access point that you want to associate with the specified
  /// policy.
  ///
  /// For using this parameter with Amazon S3 on Outposts with the REST API, you
  /// must specify the name and the x-amz-outpost-id as well.
  ///
  /// For using this parameter with S3 on Outposts with the Amazon Web Services
  /// SDK and CLI, you must specify the ARN of the access point accessed in the
  /// format
  /// <code>arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/accesspoint/&lt;my-accesspoint-name&gt;</code>.
  /// For example, to access the access point <code>reports-ap</code> through
  /// Outpost <code>my-outpost</code> owned by account <code>123456789012</code>
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
  /// The Amazon Web Services account ID of the Outposts bucket.
  final String accountId;

  /// Specifies the bucket.
  ///
  /// For using this parameter with Amazon S3 on Outposts with the REST API, you
  /// must specify the name and the x-amz-outpost-id as well.
  ///
  /// For using this parameter with S3 on Outposts with the Amazon Web Services
  /// SDK and CLI, you must specify the ARN of the bucket accessed in the format
  /// <code>arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/bucket/&lt;my-bucket-name&gt;</code>.
  /// For example, to access the bucket <code>reports</code> through Outpost
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
  /// The Amazon Web Services account ID associated with the S3 Batch Operations
  /// job.
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
  factory PutJobTaggingResult.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return PutJobTaggingResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A container for the information associated with a <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_PutMultiRegionAccessPoint.html">PutMultiRegionAccessPoint</a>
/// request.
class PutMultiRegionAccessPointPolicyInput {
  /// The name of the Multi-Region Access Point associated with the request.
  final String name;

  /// The policy details for the <code>PutMultiRegionAccessPoint</code> request.
  final String policy;

  PutMultiRegionAccessPointPolicyInput({
    required this.name,
    required this.policy,
  });
  factory PutMultiRegionAccessPointPolicyInput.fromXml(_s.XmlElement elem) {
    return PutMultiRegionAccessPointPolicyInput(
      name: _s.extractXmlStringValue(elem, 'Name')!,
      policy: _s.extractXmlStringValue(elem, 'Policy')!,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final policy = this.policy;
    return {
      'Name': name,
      'Policy': policy,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final name = this.name;
    final policy = this.policy;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Name', name),
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

class PutMultiRegionAccessPointPolicyRequest {
  /// The Amazon Web Services account ID for the owner of the Multi-Region Access
  /// Point.
  final String accountId;

  /// A container element containing the details of the policy for the
  /// Multi-Region Access Point.
  final PutMultiRegionAccessPointPolicyInput details;

  /// An idempotency token used to identify the request and guarantee that
  /// requests are unique.
  final String? clientToken;

  PutMultiRegionAccessPointPolicyRequest({
    required this.accountId,
    required this.details,
    this.clientToken,
  });

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final details = this.details;
    final clientToken = this.clientToken;
    return {
      'Details': details,
      if (clientToken != null) 'ClientToken': clientToken,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final accountId = this.accountId;
    final details = this.details;
    final clientToken = this.clientToken;
    final $children = <_s.XmlNode>[
      if (clientToken != null)
        _s.encodeXmlStringValue('ClientToken', clientToken),
      details.toXml('Details'),
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

class PutMultiRegionAccessPointPolicyResult {
  /// The request token associated with the request. You can use this token with
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DescribeMultiRegionAccessPointOperation.html">DescribeMultiRegionAccessPointOperation</a>
  /// to determine the status of asynchronous requests.
  final String? requestTokenARN;

  PutMultiRegionAccessPointPolicyResult({
    this.requestTokenARN,
  });
  factory PutMultiRegionAccessPointPolicyResult.fromXml(_s.XmlElement elem) {
    return PutMultiRegionAccessPointPolicyResult(
      requestTokenARN: _s.extractXmlStringValue(elem, 'RequestTokenARN'),
    );
  }

  Map<String, dynamic> toJson() {
    final requestTokenARN = this.requestTokenARN;
    return {
      if (requestTokenARN != null) 'RequestTokenARN': requestTokenARN,
    };
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
  factory PutStorageLensConfigurationTaggingResult.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return PutStorageLensConfigurationTaggingResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A Region that supports a Multi-Region Access Point as well as the associated
/// bucket for the Region.
class Region {
  /// The name of the associated bucket for the Region.
  final String bucket;

  /// The Amazon Web Services account ID that owns the Amazon S3 bucket that's
  /// associated with this Multi-Region Access Point.
  final String? bucketAccountId;

  Region({
    required this.bucket,
    this.bucketAccountId,
  });
  factory Region.fromXml(_s.XmlElement elem) {
    return Region(
      bucket: _s.extractXmlStringValue(elem, 'Bucket')!,
      bucketAccountId: _s.extractXmlStringValue(elem, 'BucketAccountId'),
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final bucketAccountId = this.bucketAccountId;
    return {
      'Bucket': bucket,
      if (bucketAccountId != null) 'BucketAccountId': bucketAccountId,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final bucket = this.bucket;
    final bucketAccountId = this.bucketAccountId;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Bucket', bucket),
      if (bucketAccountId != null)
        _s.encodeXmlStringValue('BucketAccountId', bucketAccountId),
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

/// A combination of a bucket and Region that's part of a Multi-Region Access
/// Point.
class RegionReport {
  /// The name of the bucket.
  final String? bucket;

  /// The Amazon Web Services account ID that owns the Amazon S3 bucket that's
  /// associated with this Multi-Region Access Point.
  final String? bucketAccountId;

  /// The name of the Region.
  final String? region;

  RegionReport({
    this.bucket,
    this.bucketAccountId,
    this.region,
  });
  factory RegionReport.fromXml(_s.XmlElement elem) {
    return RegionReport(
      bucket: _s.extractXmlStringValue(elem, 'Bucket'),
      bucketAccountId: _s.extractXmlStringValue(elem, 'BucketAccountId'),
      region: _s.extractXmlStringValue(elem, 'Region'),
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final bucketAccountId = this.bucketAccountId;
    final region = this.region;
    return {
      if (bucket != null) 'Bucket': bucket,
      if (bucketAccountId != null) 'BucketAccountId': bucketAccountId,
      if (region != null) 'Region': region,
    };
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

  /// The Outposts ID of the regional bucket.
  final String? outpostId;

  RegionalBucket({
    required this.bucket,
    required this.creationDate,
    required this.publicAccessBlockEnabled,
    this.bucketArn,
    this.outpostId,
  });
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
      'CreationDate': iso8601ToJson(creationDate),
      'PublicAccessBlockEnabled': publicAccessBlockEnabled,
      if (bucketArn != null) 'BucketArn': bucketArn,
      if (outpostId != null) 'OutpostId': outpostId,
    };
  }
}

/// A filter that you can use to specify whether replica modification sync is
/// enabled. S3 on Outposts replica modification sync can help you keep object
/// metadata synchronized between replicas and source objects. By default, S3 on
/// Outposts replicates metadata from the source objects to the replicas only.
/// When replica modification sync is enabled, S3 on Outposts replicates
/// metadata changes made to the replica copies back to the source object,
/// making the replication bidirectional.
///
/// To replicate object metadata modifications on replicas, you can specify this
/// element and set the <code>Status</code> of this element to
/// <code>Enabled</code>.
/// <note>
/// You must enable replica modification sync on the source and destination
/// buckets to replicate replica metadata changes between the source and the
/// replicas.
/// </note>
class ReplicaModifications {
  /// Specifies whether S3 on Outposts replicates modifications to object metadata
  /// on replicas.
  final ReplicaModificationsStatus status;

  ReplicaModifications({
    required this.status,
  });
  factory ReplicaModifications.fromXml(_s.XmlElement elem) {
    return ReplicaModifications(
      status: _s
          .extractXmlStringValue(elem, 'Status')!
          .toReplicaModificationsStatus(),
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

enum ReplicaModificationsStatus {
  enabled,
  disabled,
}

extension ReplicaModificationsStatusValueExtension
    on ReplicaModificationsStatus {
  String toValue() {
    switch (this) {
      case ReplicaModificationsStatus.enabled:
        return 'Enabled';
      case ReplicaModificationsStatus.disabled:
        return 'Disabled';
    }
  }
}

extension ReplicaModificationsStatusFromString on String {
  ReplicaModificationsStatus toReplicaModificationsStatus() {
    switch (this) {
      case 'Enabled':
        return ReplicaModificationsStatus.enabled;
      case 'Disabled':
        return ReplicaModificationsStatus.disabled;
    }
    throw Exception('$this is not known in enum ReplicaModificationsStatus');
  }
}

/// A container for one or more replication rules. A replication configuration
/// must have at least one rule and you can add up to 100 rules. The maximum
/// size of a replication configuration is 128 KB.
class ReplicationConfiguration {
  /// The Amazon Resource Name (ARN) of the Identity and Access Management (IAM)
  /// role that S3 on Outposts assumes when replicating objects. For information
  /// about S3 replication on Outposts configuration, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/outposts-replication-how-setup.html">Setting
  /// up replication</a> in the <i>Amazon S3 User Guide</i>.
  final String role;

  /// A container for one or more replication rules. A replication configuration
  /// must have at least one rule and can contain an array of 100 rules at the
  /// most.
  final List<ReplicationRule> rules;

  ReplicationConfiguration({
    required this.role,
    required this.rules,
  });
  factory ReplicationConfiguration.fromXml(_s.XmlElement elem) {
    return ReplicationConfiguration(
      role: _s.extractXmlStringValue(elem, 'Role')!,
      rules: _s
          .extractXmlChild(elem, 'Rules')!
          .findElements('Rule')
          .map((c) => ReplicationRule.fromXml(c))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final role = this.role;
    final rules = this.rules;
    return {
      'Role': role,
      'Rules': rules,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final role = this.role;
    final rules = this.rules;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Role', role),
      _s.XmlElement(_s.XmlName('Rules'), [], rules.map((e) => e.toXml('Rule'))),
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

/// Specifies which S3 on Outposts objects to replicate and where to store the
/// replicas.
class ReplicationRule {
  /// The Amazon Resource Name (ARN) of the access point for the source Outposts
  /// bucket that you want S3 on Outposts to replicate the objects from.
  final String bucket;

  /// A container for information about the replication destination and its
  /// configurations.
  final Destination destination;

  /// Specifies whether the rule is enabled.
  final ReplicationRuleStatus status;

  /// Specifies whether S3 on Outposts replicates delete markers. If you specify a
  /// <code>Filter</code> element in your replication configuration, you must also
  /// include a <code>DeleteMarkerReplication</code> element. If your
  /// <code>Filter</code> includes a <code>Tag</code> element, the
  /// <code>DeleteMarkerReplication</code> element's <code>Status</code> child
  /// element must be set to <code>Disabled</code>, because S3 on Outposts doesn't
  /// support replicating delete markers for tag-based rules.
  ///
  /// For more information about delete marker replication, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3OutpostsReplication.html#outposts-replication-what-is-replicated">How
  /// delete operations affect replication</a> in the <i>Amazon S3 User Guide</i>.
  final DeleteMarkerReplication? deleteMarkerReplication;

  /// An optional configuration to replicate existing source bucket objects.
  /// <note>
  /// This is not supported by Amazon S3 on Outposts buckets.
  /// </note>
  final ExistingObjectReplication? existingObjectReplication;

  /// A filter that identifies the subset of objects to which the replication rule
  /// applies. A <code>Filter</code> element must specify exactly one
  /// <code>Prefix</code>, <code>Tag</code>, or <code>And</code> child element.
  final ReplicationRuleFilter? filter;

  /// A unique identifier for the rule. The maximum value is 255 characters.
  final String? id;

  /// An object key name prefix that identifies the object or objects to which the
  /// rule applies. The maximum prefix length is 1,024 characters. To include all
  /// objects in an Outposts bucket, specify an empty string.
  /// <important>
  /// When you're using XML requests, you must replace special characters (such as
  /// carriage returns) in object keys with their equivalent XML entity codes. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-keys.html#object-key-xml-related-constraints">
  /// XML-related object key constraints</a> in the <i>Amazon S3 User Guide</i>.
  /// </important>
  final String? prefix;

  /// The priority indicates which rule has precedence whenever two or more
  /// replication rules conflict. S3 on Outposts attempts to replicate objects
  /// according to all replication rules. However, if there are two or more rules
  /// with the same destination Outposts bucket, then objects will be replicated
  /// according to the rule with the highest priority. The higher the number, the
  /// higher the priority.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/replication-between-outposts.html">Creating
  /// replication rules on Outposts</a> in the <i>Amazon S3 User Guide</i>.
  final int? priority;

  /// A container that describes additional filters for identifying the source
  /// Outposts objects that you want to replicate. You can choose to enable or
  /// disable the replication of these objects.
  final SourceSelectionCriteria? sourceSelectionCriteria;

  ReplicationRule({
    required this.bucket,
    required this.destination,
    required this.status,
    this.deleteMarkerReplication,
    this.existingObjectReplication,
    this.filter,
    this.id,
    this.prefix,
    this.priority,
    this.sourceSelectionCriteria,
  });
  factory ReplicationRule.fromXml(_s.XmlElement elem) {
    return ReplicationRule(
      bucket: _s.extractXmlStringValue(elem, 'Bucket')!,
      destination:
          Destination.fromXml(_s.extractXmlChild(elem, 'Destination')!),
      status:
          _s.extractXmlStringValue(elem, 'Status')!.toReplicationRuleStatus(),
      deleteMarkerReplication: _s
          .extractXmlChild(elem, 'DeleteMarkerReplication')
          ?.let((e) => DeleteMarkerReplication.fromXml(e)),
      existingObjectReplication: _s
          .extractXmlChild(elem, 'ExistingObjectReplication')
          ?.let((e) => ExistingObjectReplication.fromXml(e)),
      filter: _s
          .extractXmlChild(elem, 'Filter')
          ?.let((e) => ReplicationRuleFilter.fromXml(e)),
      id: _s.extractXmlStringValue(elem, 'ID'),
      prefix: _s.extractXmlStringValue(elem, 'Prefix'),
      priority: _s.extractXmlIntValue(elem, 'Priority'),
      sourceSelectionCriteria: _s
          .extractXmlChild(elem, 'SourceSelectionCriteria')
          ?.let((e) => SourceSelectionCriteria.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final destination = this.destination;
    final status = this.status;
    final deleteMarkerReplication = this.deleteMarkerReplication;
    final existingObjectReplication = this.existingObjectReplication;
    final filter = this.filter;
    final id = this.id;
    final prefix = this.prefix;
    final priority = this.priority;
    final sourceSelectionCriteria = this.sourceSelectionCriteria;
    return {
      'Bucket': bucket,
      'Destination': destination,
      'Status': status.toValue(),
      if (deleteMarkerReplication != null)
        'DeleteMarkerReplication': deleteMarkerReplication,
      if (existingObjectReplication != null)
        'ExistingObjectReplication': existingObjectReplication,
      if (filter != null) 'Filter': filter,
      if (id != null) 'ID': id,
      if (prefix != null) 'Prefix': prefix,
      if (priority != null) 'Priority': priority,
      if (sourceSelectionCriteria != null)
        'SourceSelectionCriteria': sourceSelectionCriteria,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final bucket = this.bucket;
    final destination = this.destination;
    final status = this.status;
    final deleteMarkerReplication = this.deleteMarkerReplication;
    final existingObjectReplication = this.existingObjectReplication;
    final filter = this.filter;
    final id = this.id;
    final prefix = this.prefix;
    final priority = this.priority;
    final sourceSelectionCriteria = this.sourceSelectionCriteria;
    final $children = <_s.XmlNode>[
      if (id != null) _s.encodeXmlStringValue('ID', id),
      if (priority != null) _s.encodeXmlIntValue('Priority', priority),
      if (prefix != null) _s.encodeXmlStringValue('Prefix', prefix),
      if (filter != null) filter.toXml('Filter'),
      _s.encodeXmlStringValue('Status', status.toValue()),
      if (sourceSelectionCriteria != null)
        sourceSelectionCriteria.toXml('SourceSelectionCriteria'),
      if (existingObjectReplication != null)
        existingObjectReplication.toXml('ExistingObjectReplication'),
      destination.toXml('Destination'),
      if (deleteMarkerReplication != null)
        deleteMarkerReplication.toXml('DeleteMarkerReplication'),
      _s.encodeXmlStringValue('Bucket', bucket),
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

/// A container for specifying rule filters. The filters determine the subset of
/// objects to which the rule applies. This element is required only if you
/// specify more than one filter.
///
/// For example:
///
/// <ul>
/// <li>
/// If you specify both a <code>Prefix</code> and a <code>Tag</code> filter,
/// wrap these filters in an <code>And</code> element.
/// </li>
/// <li>
/// If you specify a filter based on multiple tags, wrap the <code>Tag</code>
/// elements in an <code>And</code> element.
/// </li>
/// </ul>
class ReplicationRuleAndOperator {
  /// An object key name prefix that identifies the subset of objects that the
  /// rule applies to.
  final String? prefix;

  /// An array of tags that contain key and value pairs.
  final List<S3Tag>? tags;

  ReplicationRuleAndOperator({
    this.prefix,
    this.tags,
  });
  factory ReplicationRuleAndOperator.fromXml(_s.XmlElement elem) {
    return ReplicationRuleAndOperator(
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

/// A filter that identifies the subset of objects to which the replication rule
/// applies. A <code>Filter</code> element must specify exactly one
/// <code>Prefix</code>, <code>Tag</code>, or <code>And</code> child element.
class ReplicationRuleFilter {
  /// A container for specifying rule filters. The filters determine the subset of
  /// objects that the rule applies to. This element is required only if you
  /// specify more than one filter. For example:
  ///
  /// <ul>
  /// <li>
  /// If you specify both a <code>Prefix</code> and a <code>Tag</code> filter,
  /// wrap these filters in an <code>And</code> element.
  /// </li>
  /// <li>
  /// If you specify a filter based on multiple tags, wrap the <code>Tag</code>
  /// elements in an <code>And</code> element.
  /// </li>
  /// </ul>
  final ReplicationRuleAndOperator? and;

  /// An object key name prefix that identifies the subset of objects that the
  /// rule applies to.
  /// <important>
  /// When you're using XML requests, you must replace special characters (such as
  /// carriage returns) in object keys with their equivalent XML entity codes. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-keys.html#object-key-xml-related-constraints">
  /// XML-related object key constraints</a> in the <i>Amazon S3 User Guide</i>.
  /// </important>
  final String? prefix;
  final S3Tag? tag;

  ReplicationRuleFilter({
    this.and,
    this.prefix,
    this.tag,
  });
  factory ReplicationRuleFilter.fromXml(_s.XmlElement elem) {
    return ReplicationRuleFilter(
      and: _s
          .extractXmlChild(elem, 'And')
          ?.let((e) => ReplicationRuleAndOperator.fromXml(e)),
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

enum ReplicationRuleStatus {
  enabled,
  disabled,
}

extension ReplicationRuleStatusValueExtension on ReplicationRuleStatus {
  String toValue() {
    switch (this) {
      case ReplicationRuleStatus.enabled:
        return 'Enabled';
      case ReplicationRuleStatus.disabled:
        return 'Disabled';
    }
  }
}

extension ReplicationRuleStatusFromString on String {
  ReplicationRuleStatus toReplicationRuleStatus() {
    switch (this) {
      case 'Enabled':
        return ReplicationRuleStatus.enabled;
      case 'Disabled':
        return ReplicationRuleStatus.disabled;
    }
    throw Exception('$this is not known in enum ReplicationRuleStatus');
  }
}

enum ReplicationStatus {
  completed,
  failed,
  replica,
  none,
}

extension ReplicationStatusValueExtension on ReplicationStatus {
  String toValue() {
    switch (this) {
      case ReplicationStatus.completed:
        return 'COMPLETED';
      case ReplicationStatus.failed:
        return 'FAILED';
      case ReplicationStatus.replica:
        return 'REPLICA';
      case ReplicationStatus.none:
        return 'NONE';
    }
  }
}

extension ReplicationStatusFromString on String {
  ReplicationStatus toReplicationStatus() {
    switch (this) {
      case 'COMPLETED':
        return ReplicationStatus.completed;
      case 'FAILED':
        return ReplicationStatus.failed;
      case 'REPLICA':
        return ReplicationStatus.replica;
      case 'NONE':
        return ReplicationStatus.none;
    }
    throw Exception('$this is not known in enum ReplicationStatus');
  }
}

enum ReplicationStorageClass {
  standard,
  reducedRedundancy,
  standardIa,
  onezoneIa,
  intelligentTiering,
  glacier,
  deepArchive,
  outposts,
  glacierIr,
}

extension ReplicationStorageClassValueExtension on ReplicationStorageClass {
  String toValue() {
    switch (this) {
      case ReplicationStorageClass.standard:
        return 'STANDARD';
      case ReplicationStorageClass.reducedRedundancy:
        return 'REDUCED_REDUNDANCY';
      case ReplicationStorageClass.standardIa:
        return 'STANDARD_IA';
      case ReplicationStorageClass.onezoneIa:
        return 'ONEZONE_IA';
      case ReplicationStorageClass.intelligentTiering:
        return 'INTELLIGENT_TIERING';
      case ReplicationStorageClass.glacier:
        return 'GLACIER';
      case ReplicationStorageClass.deepArchive:
        return 'DEEP_ARCHIVE';
      case ReplicationStorageClass.outposts:
        return 'OUTPOSTS';
      case ReplicationStorageClass.glacierIr:
        return 'GLACIER_IR';
    }
  }
}

extension ReplicationStorageClassFromString on String {
  ReplicationStorageClass toReplicationStorageClass() {
    switch (this) {
      case 'STANDARD':
        return ReplicationStorageClass.standard;
      case 'REDUCED_REDUNDANCY':
        return ReplicationStorageClass.reducedRedundancy;
      case 'STANDARD_IA':
        return ReplicationStorageClass.standardIa;
      case 'ONEZONE_IA':
        return ReplicationStorageClass.onezoneIa;
      case 'INTELLIGENT_TIERING':
        return ReplicationStorageClass.intelligentTiering;
      case 'GLACIER':
        return ReplicationStorageClass.glacier;
      case 'DEEP_ARCHIVE':
        return ReplicationStorageClass.deepArchive;
      case 'OUTPOSTS':
        return ReplicationStorageClass.outposts;
      case 'GLACIER_IR':
        return ReplicationStorageClass.glacierIr;
    }
    throw Exception('$this is not known in enum ReplicationStorageClass');
  }
}

/// A container that specifies S3 Replication Time Control (S3 RTC) related
/// information, including whether S3 RTC is enabled and the time when all
/// objects and operations on objects must be replicated.
/// <note>
/// This is not supported by Amazon S3 on Outposts buckets.
/// </note>
class ReplicationTime {
  /// Specifies whether S3 Replication Time Control (S3 RTC) is enabled.
  final ReplicationTimeStatus status;

  /// A container that specifies the time by which replication should be complete
  /// for all objects and operations on objects.
  final ReplicationTimeValue time;

  ReplicationTime({
    required this.status,
    required this.time,
  });
  factory ReplicationTime.fromXml(_s.XmlElement elem) {
    return ReplicationTime(
      status:
          _s.extractXmlStringValue(elem, 'Status')!.toReplicationTimeStatus(),
      time: ReplicationTimeValue.fromXml(_s.extractXmlChild(elem, 'Time')!),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final time = this.time;
    return {
      'Status': status.toValue(),
      'Time': time,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final status = this.status;
    final time = this.time;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Status', status.toValue()),
      time.toXml('Time'),
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

enum ReplicationTimeStatus {
  enabled,
  disabled,
}

extension ReplicationTimeStatusValueExtension on ReplicationTimeStatus {
  String toValue() {
    switch (this) {
      case ReplicationTimeStatus.enabled:
        return 'Enabled';
      case ReplicationTimeStatus.disabled:
        return 'Disabled';
    }
  }
}

extension ReplicationTimeStatusFromString on String {
  ReplicationTimeStatus toReplicationTimeStatus() {
    switch (this) {
      case 'Enabled':
        return ReplicationTimeStatus.enabled;
      case 'Disabled':
        return ReplicationTimeStatus.disabled;
    }
    throw Exception('$this is not known in enum ReplicationTimeStatus');
  }
}

/// A container that specifies the time value for S3 Replication Time Control
/// (S3 RTC). This value is also used for the replication metrics
/// <code>EventThreshold</code> element.
/// <note>
/// This is not supported by Amazon S3 on Outposts buckets.
/// </note>
class ReplicationTimeValue {
  /// Contains an integer that specifies the time period in minutes.
  ///
  /// Valid value: 15
  final int? minutes;

  ReplicationTimeValue({
    this.minutes,
  });
  factory ReplicationTimeValue.fromXml(_s.XmlElement elem) {
    return ReplicationTimeValue(
      minutes: _s.extractXmlIntValue(elem, 'Minutes'),
    );
  }

  Map<String, dynamic> toJson() {
    final minutes = this.minutes;
    return {
      if (minutes != null) 'Minutes': minutes,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final minutes = this.minutes;
    final $children = <_s.XmlNode>[
      if (minutes != null) _s.encodeXmlIntValue('Minutes', minutes),
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

enum RequestedJobStatus {
  cancelled,
  ready,
}

extension RequestedJobStatusValueExtension on RequestedJobStatus {
  String toValue() {
    switch (this) {
      case RequestedJobStatus.cancelled:
        return 'Cancelled';
      case RequestedJobStatus.ready:
        return 'Ready';
    }
  }
}

extension RequestedJobStatusFromString on String {
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

extension S3CannedAccessControlListValueExtension on S3CannedAccessControlList {
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

extension S3CannedAccessControlListFromString on String {
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

enum S3ChecksumAlgorithm {
  crc32,
  crc32c,
  sha1,
  sha256,
}

extension S3ChecksumAlgorithmValueExtension on S3ChecksumAlgorithm {
  String toValue() {
    switch (this) {
      case S3ChecksumAlgorithm.crc32:
        return 'CRC32';
      case S3ChecksumAlgorithm.crc32c:
        return 'CRC32C';
      case S3ChecksumAlgorithm.sha1:
        return 'SHA1';
      case S3ChecksumAlgorithm.sha256:
        return 'SHA256';
    }
  }
}

extension S3ChecksumAlgorithmFromString on String {
  S3ChecksumAlgorithm toS3ChecksumAlgorithm() {
    switch (this) {
      case 'CRC32':
        return S3ChecksumAlgorithm.crc32;
      case 'CRC32C':
        return S3ChecksumAlgorithm.crc32c;
      case 'SHA1':
        return S3ChecksumAlgorithm.sha1;
      case 'SHA256':
        return S3ChecksumAlgorithm.sha256;
    }
    throw Exception('$this is not known in enum S3ChecksumAlgorithm');
  }
}

/// Contains the configuration parameters for a PUT Copy object operation. S3
/// Batch Operations passes every object to the underlying
/// <code>CopyObject</code> API operation. For more information about the
/// parameters for this operation, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTObjectCOPY.html">CopyObject</a>.
class S3CopyObjectOperation {
  /// <p/>
  final List<S3Grant>? accessControlGrants;

  /// Specifies whether Amazon S3 should use an S3 Bucket Key for object
  /// encryption with server-side encryption using Amazon Web Services KMS
  /// (SSE-KMS). Setting this header to <code>true</code> causes Amazon S3 to use
  /// an S3 Bucket Key for object encryption with SSE-KMS.
  ///
  /// Specifying this header with an <i>object</i> action doesn’t affect
  /// <i>bucket-level</i> settings for S3 Bucket Key.
  final bool? bucketKeyEnabled;

  /// <p/>
  final S3CannedAccessControlList? cannedAccessControlList;

  /// Indicates the algorithm that you want Amazon S3 to use to create the
  /// checksum. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/CheckingObjectIntegrity.xml">
  /// Checking object integrity</a> in the <i>Amazon S3 User Guide</i>.
  final S3ChecksumAlgorithm? checksumAlgorithm;

  /// <p/>
  final S3MetadataDirective? metadataDirective;

  /// <p/>
  final DateTime? modifiedSinceConstraint;

  /// If you don't provide this parameter, Amazon S3 copies all the metadata from
  /// the original objects. If you specify an empty set, the new objects will have
  /// no tags. Otherwise, Amazon S3 assigns the supplied tags to the new objects.
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

  /// Specifies the folder prefix that you want the objects to be copied into. For
  /// example, to copy objects into a folder named <code>Folder1</code> in the
  /// destination bucket, set the <code>TargetKeyPrefix</code> property to
  /// <code>Folder1</code>.
  final String? targetKeyPrefix;

  /// Specifies the destination bucket Amazon Resource Name (ARN) for the batch
  /// copy operation. For example, to copy objects to a bucket named
  /// <code>destinationBucket</code>, set the <code>TargetResource</code> property
  /// to <code>arn:aws:s3:::destinationBucket</code>.
  final String? targetResource;

  /// <p/>
  final DateTime? unModifiedSinceConstraint;

  S3CopyObjectOperation({
    this.accessControlGrants,
    this.bucketKeyEnabled,
    this.cannedAccessControlList,
    this.checksumAlgorithm,
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
      bucketKeyEnabled: _s.extractXmlBoolValue(elem, 'BucketKeyEnabled'),
      cannedAccessControlList: _s
          .extractXmlStringValue(elem, 'CannedAccessControlList')
          ?.toS3CannedAccessControlList(),
      checksumAlgorithm: _s
          .extractXmlStringValue(elem, 'ChecksumAlgorithm')
          ?.toS3ChecksumAlgorithm(),
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
    final checksumAlgorithm = this.checksumAlgorithm;
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
      if (checksumAlgorithm != null)
        'ChecksumAlgorithm': checksumAlgorithm.toValue(),
      if (metadataDirective != null)
        'MetadataDirective': metadataDirective.toValue(),
      if (modifiedSinceConstraint != null)
        'ModifiedSinceConstraint': iso8601ToJson(modifiedSinceConstraint),
      if (newObjectMetadata != null) 'NewObjectMetadata': newObjectMetadata,
      if (newObjectTagging != null) 'NewObjectTagging': newObjectTagging,
      if (objectLockLegalHoldStatus != null)
        'ObjectLockLegalHoldStatus': objectLockLegalHoldStatus.toValue(),
      if (objectLockMode != null) 'ObjectLockMode': objectLockMode.toValue(),
      if (objectLockRetainUntilDate != null)
        'ObjectLockRetainUntilDate': iso8601ToJson(objectLockRetainUntilDate),
      if (redirectLocation != null) 'RedirectLocation': redirectLocation,
      if (requesterPays != null) 'RequesterPays': requesterPays,
      if (sSEAwsKmsKeyId != null) 'SSEAwsKmsKeyId': sSEAwsKmsKeyId,
      if (storageClass != null) 'StorageClass': storageClass.toValue(),
      if (targetKeyPrefix != null) 'TargetKeyPrefix': targetKeyPrefix,
      if (targetResource != null) 'TargetResource': targetResource,
      if (unModifiedSinceConstraint != null)
        'UnModifiedSinceConstraint': iso8601ToJson(unModifiedSinceConstraint),
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final accessControlGrants = this.accessControlGrants;
    final bucketKeyEnabled = this.bucketKeyEnabled;
    final cannedAccessControlList = this.cannedAccessControlList;
    final checksumAlgorithm = this.checksumAlgorithm;
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
      if (checksumAlgorithm != null)
        _s.encodeXmlStringValue(
            'ChecksumAlgorithm', checksumAlgorithm.toValue()),
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

/// Contains no configuration parameters because the DELETE Object tagging
/// (<code>DeleteObjectTagging</code>) API operation accepts only the bucket
/// name and key name as parameters, which are defined in the job's manifest.
class S3DeleteObjectTaggingOperation {
  S3DeleteObjectTaggingOperation();
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

/// Describes the specified job's generated manifest. Batch Operations jobs
/// created with a ManifestGenerator populate details of this descriptor after
/// execution of the ManifestGenerator.
class S3GeneratedManifestDescriptor {
  /// The format of the generated manifest.
  final GeneratedManifestFormat? format;
  final JobManifestLocation? location;

  S3GeneratedManifestDescriptor({
    this.format,
    this.location,
  });
  factory S3GeneratedManifestDescriptor.fromXml(_s.XmlElement elem) {
    return S3GeneratedManifestDescriptor(
      format:
          _s.extractXmlStringValue(elem, 'Format')?.toGeneratedManifestFormat(),
      location: _s
          .extractXmlChild(elem, 'Location')
          ?.let((e) => JobManifestLocation.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final format = this.format;
    final location = this.location;
    return {
      if (format != null) 'Format': format.toValue(),
      if (location != null) 'Location': location,
    };
  }
}

enum S3GlacierJobTier {
  bulk,
  standard,
}

extension S3GlacierJobTierValueExtension on S3GlacierJobTier {
  String toValue() {
    switch (this) {
      case S3GlacierJobTier.bulk:
        return 'BULK';
      case S3GlacierJobTier.standard:
        return 'STANDARD';
    }
  }
}

extension S3GlacierJobTierFromString on String {
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

extension S3GranteeTypeIdentifierValueExtension on S3GranteeTypeIdentifier {
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

extension S3GranteeTypeIdentifierFromString on String {
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

/// Contains the configuration parameters for a POST Object restore job. S3
/// Batch Operations passes every object to the underlying
/// <code>RestoreObject</code> API operation. For more information about the
/// parameters for this operation, see <a
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

/// The container for the service that will create the S3 manifest.
class S3JobManifestGenerator {
  /// Determines whether or not to write the job's generated manifest to a bucket.
  final bool enableManifestOutput;

  /// The source bucket used by the ManifestGenerator.
  final String sourceBucket;

  /// The Amazon Web Services account ID that owns the bucket the generated
  /// manifest is written to. If provided the generated manifest bucket's owner
  /// Amazon Web Services account ID must match this value, else the job fails.
  final String? expectedBucketOwner;

  /// Specifies rules the S3JobManifestGenerator should use to use to decide
  /// whether an object in the source bucket should or should not be included in
  /// the generated job manifest.
  final JobManifestGeneratorFilter? filter;

  /// Specifies the location the generated manifest will be written to.
  final S3ManifestOutputLocation? manifestOutputLocation;

  S3JobManifestGenerator({
    required this.enableManifestOutput,
    required this.sourceBucket,
    this.expectedBucketOwner,
    this.filter,
    this.manifestOutputLocation,
  });
  factory S3JobManifestGenerator.fromXml(_s.XmlElement elem) {
    return S3JobManifestGenerator(
      enableManifestOutput:
          _s.extractXmlBoolValue(elem, 'EnableManifestOutput')!,
      sourceBucket: _s.extractXmlStringValue(elem, 'SourceBucket')!,
      expectedBucketOwner:
          _s.extractXmlStringValue(elem, 'ExpectedBucketOwner'),
      filter: _s
          .extractXmlChild(elem, 'Filter')
          ?.let((e) => JobManifestGeneratorFilter.fromXml(e)),
      manifestOutputLocation: _s
          .extractXmlChild(elem, 'ManifestOutputLocation')
          ?.let((e) => S3ManifestOutputLocation.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final enableManifestOutput = this.enableManifestOutput;
    final sourceBucket = this.sourceBucket;
    final expectedBucketOwner = this.expectedBucketOwner;
    final filter = this.filter;
    final manifestOutputLocation = this.manifestOutputLocation;
    return {
      'EnableManifestOutput': enableManifestOutput,
      'SourceBucket': sourceBucket,
      if (expectedBucketOwner != null)
        'ExpectedBucketOwner': expectedBucketOwner,
      if (filter != null) 'Filter': filter,
      if (manifestOutputLocation != null)
        'ManifestOutputLocation': manifestOutputLocation,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final enableManifestOutput = this.enableManifestOutput;
    final sourceBucket = this.sourceBucket;
    final expectedBucketOwner = this.expectedBucketOwner;
    final filter = this.filter;
    final manifestOutputLocation = this.manifestOutputLocation;
    final $children = <_s.XmlNode>[
      if (expectedBucketOwner != null)
        _s.encodeXmlStringValue('ExpectedBucketOwner', expectedBucketOwner),
      _s.encodeXmlStringValue('SourceBucket', sourceBucket),
      if (manifestOutputLocation != null)
        manifestOutputLocation.toXml('ManifestOutputLocation'),
      if (filter != null) filter.toXml('Filter'),
      _s.encodeXmlBoolValue('EnableManifestOutput', enableManifestOutput),
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

/// Location details for where the generated manifest should be written.
class S3ManifestOutputLocation {
  /// The bucket ARN the generated manifest should be written to.
  final String bucket;

  /// The format of the generated manifest.
  final GeneratedManifestFormat manifestFormat;

  /// The Account ID that owns the bucket the generated manifest is written to.
  final String? expectedManifestBucketOwner;

  /// Specifies what encryption should be used when the generated manifest objects
  /// are written.
  final GeneratedManifestEncryption? manifestEncryption;

  /// Prefix identifying one or more objects to which the manifest applies.
  final String? manifestPrefix;

  S3ManifestOutputLocation({
    required this.bucket,
    required this.manifestFormat,
    this.expectedManifestBucketOwner,
    this.manifestEncryption,
    this.manifestPrefix,
  });
  factory S3ManifestOutputLocation.fromXml(_s.XmlElement elem) {
    return S3ManifestOutputLocation(
      bucket: _s.extractXmlStringValue(elem, 'Bucket')!,
      manifestFormat: _s
          .extractXmlStringValue(elem, 'ManifestFormat')!
          .toGeneratedManifestFormat(),
      expectedManifestBucketOwner:
          _s.extractXmlStringValue(elem, 'ExpectedManifestBucketOwner'),
      manifestEncryption: _s
          .extractXmlChild(elem, 'ManifestEncryption')
          ?.let((e) => GeneratedManifestEncryption.fromXml(e)),
      manifestPrefix: _s.extractXmlStringValue(elem, 'ManifestPrefix'),
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final manifestFormat = this.manifestFormat;
    final expectedManifestBucketOwner = this.expectedManifestBucketOwner;
    final manifestEncryption = this.manifestEncryption;
    final manifestPrefix = this.manifestPrefix;
    return {
      'Bucket': bucket,
      'ManifestFormat': manifestFormat.toValue(),
      if (expectedManifestBucketOwner != null)
        'ExpectedManifestBucketOwner': expectedManifestBucketOwner,
      if (manifestEncryption != null) 'ManifestEncryption': manifestEncryption,
      if (manifestPrefix != null) 'ManifestPrefix': manifestPrefix,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final bucket = this.bucket;
    final manifestFormat = this.manifestFormat;
    final expectedManifestBucketOwner = this.expectedManifestBucketOwner;
    final manifestEncryption = this.manifestEncryption;
    final manifestPrefix = this.manifestPrefix;
    final $children = <_s.XmlNode>[
      if (expectedManifestBucketOwner != null)
        _s.encodeXmlStringValue(
            'ExpectedManifestBucketOwner', expectedManifestBucketOwner),
      _s.encodeXmlStringValue('Bucket', bucket),
      if (manifestPrefix != null)
        _s.encodeXmlStringValue('ManifestPrefix', manifestPrefix),
      if (manifestEncryption != null)
        manifestEncryption.toXml('ManifestEncryption'),
      _s.encodeXmlStringValue('ManifestFormat', manifestFormat.toValue()),
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

extension S3MetadataDirectiveValueExtension on S3MetadataDirective {
  String toValue() {
    switch (this) {
      case S3MetadataDirective.copy:
        return 'COPY';
      case S3MetadataDirective.replace:
        return 'REPLACE';
    }
  }
}

extension S3MetadataDirectiveFromString on String {
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

extension S3ObjectLockLegalHoldStatusValueExtension
    on S3ObjectLockLegalHoldStatus {
  String toValue() {
    switch (this) {
      case S3ObjectLockLegalHoldStatus.off:
        return 'OFF';
      case S3ObjectLockLegalHoldStatus.on:
        return 'ON';
    }
  }
}

extension S3ObjectLockLegalHoldStatusFromString on String {
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

extension S3ObjectLockModeValueExtension on S3ObjectLockMode {
  String toValue() {
    switch (this) {
      case S3ObjectLockMode.compliance:
        return 'COMPLIANCE';
      case S3ObjectLockMode.governance:
        return 'GOVERNANCE';
    }
  }
}

extension S3ObjectLockModeFromString on String {
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

extension S3ObjectLockRetentionModeValueExtension on S3ObjectLockRetentionMode {
  String toValue() {
    switch (this) {
      case S3ObjectLockRetentionMode.compliance:
        return 'COMPLIANCE';
      case S3ObjectLockRetentionMode.governance:
        return 'GOVERNANCE';
    }
  }
}

extension S3ObjectLockRetentionModeFromString on String {
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
        'HttpExpiresDate': iso8601ToJson(httpExpiresDate),
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

extension S3PermissionValueExtension on S3Permission {
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

extension S3PermissionFromString on String {
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

/// Directs the specified job to invoke <code>ReplicateObject</code> on every
/// object in the job's manifest.
class S3ReplicateObjectOperation {
  S3ReplicateObjectOperation();
  factory S3ReplicateObjectOperation.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return S3ReplicateObjectOperation();
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
        'RetainUntilDate': iso8601ToJson(retainUntilDate),
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

extension S3SSEAlgorithmValueExtension on S3SSEAlgorithm {
  String toValue() {
    switch (this) {
      case S3SSEAlgorithm.aes256:
        return 'AES256';
      case S3SSEAlgorithm.kms:
        return 'KMS';
    }
  }
}

extension S3SSEAlgorithmFromString on String {
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

/// Contains the configuration parameters for a PUT Object ACL operation. S3
/// Batch Operations passes every object to the underlying
/// <code>PutObjectAcl</code> API operation. For more information about the
/// parameters for this operation, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTObjectPUTacl.html">PutObjectAcl</a>.
class S3SetObjectAclOperation {
  /// <p/>
  final S3AccessControlPolicy? accessControlPolicy;

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
/// an S3 Batch Operations job passes to every object to the underlying
/// <code>PutObjectLegalHold</code> API operation. For more information, see <a
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
/// underlying <code>PutObjectRetention</code> API operation. For more
/// information, see <a
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

/// Contains the configuration parameters for a PUT Object Tagging operation. S3
/// Batch Operations passes every object to the underlying
/// <code>PutObjectTagging</code> API operation. For more information about the
/// parameters for this operation, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTObjectPUTtagging.html">PutObjectTagging</a>.
class S3SetObjectTaggingOperation {
  /// <p/>
  final List<S3Tag>? tagSet;

  S3SetObjectTaggingOperation({
    this.tagSet,
  });
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
  glacierIr,
}

extension S3StorageClassValueExtension on S3StorageClass {
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
      case S3StorageClass.glacierIr:
        return 'GLACIER_IR';
    }
  }
}

extension S3StorageClassFromString on String {
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
      case 'GLACIER_IR':
        return S3StorageClass.glacierIr;
    }
    throw Exception('$this is not known in enum S3StorageClass');
  }
}

/// A container for a key-value name pair.
class S3Tag {
  /// Key of the tag
  final String key;

  /// Value of the tag
  final String value;

  S3Tag({
    required this.key,
    required this.value,
  });
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

/// Configuration for the use of SSE-KMS to encrypt generated manifest objects.
class SSEKMSEncryption {
  /// Specifies the ID of the Amazon Web Services Key Management Service (Amazon
  /// Web Services KMS) symmetric encryption customer managed key to use for
  /// encrypting generated manifest objects.
  final String keyId;

  SSEKMSEncryption({
    required this.keyId,
  });
  factory SSEKMSEncryption.fromXml(_s.XmlElement elem) {
    return SSEKMSEncryption(
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

/// Configuration for the use of SSE-S3 to encrypt generated manifest objects.
class SSES3Encryption {
  SSES3Encryption();
  factory SSES3Encryption.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return SSES3Encryption();
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

/// A container that describes additional filters for identifying the source
/// objects that you want to replicate. You can choose to enable or disable the
/// replication of these objects.
class SourceSelectionCriteria {
  /// A filter that you can use to specify whether replica modification sync is
  /// enabled. S3 on Outposts replica modification sync can help you keep object
  /// metadata synchronized between replicas and source objects. By default, S3 on
  /// Outposts replicates metadata from the source objects to the replicas only.
  /// When replica modification sync is enabled, S3 on Outposts replicates
  /// metadata changes made to the replica copies back to the source object,
  /// making the replication bidirectional.
  ///
  /// To replicate object metadata modifications on replicas, you can specify this
  /// element and set the <code>Status</code> of this element to
  /// <code>Enabled</code>.
  /// <note>
  /// You must enable replica modification sync on the source and destination
  /// buckets to replicate replica metadata changes between the source and the
  /// replicas.
  /// </note>
  final ReplicaModifications? replicaModifications;

  /// A filter that you can use to select Amazon S3 objects that are encrypted
  /// with server-side encryption by using Key Management Service (KMS) keys. If
  /// you include <code>SourceSelectionCriteria</code> in the replication
  /// configuration, this element is required.
  /// <note>
  /// This is not supported by Amazon S3 on Outposts buckets.
  /// </note>
  final SseKmsEncryptedObjects? sseKmsEncryptedObjects;

  SourceSelectionCriteria({
    this.replicaModifications,
    this.sseKmsEncryptedObjects,
  });
  factory SourceSelectionCriteria.fromXml(_s.XmlElement elem) {
    return SourceSelectionCriteria(
      replicaModifications: _s
          .extractXmlChild(elem, 'ReplicaModifications')
          ?.let((e) => ReplicaModifications.fromXml(e)),
      sseKmsEncryptedObjects: _s
          .extractXmlChild(elem, 'SseKmsEncryptedObjects')
          ?.let((e) => SseKmsEncryptedObjects.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final replicaModifications = this.replicaModifications;
    final sseKmsEncryptedObjects = this.sseKmsEncryptedObjects;
    return {
      if (replicaModifications != null)
        'ReplicaModifications': replicaModifications,
      if (sseKmsEncryptedObjects != null)
        'SseKmsEncryptedObjects': sseKmsEncryptedObjects,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final replicaModifications = this.replicaModifications;
    final sseKmsEncryptedObjects = this.sseKmsEncryptedObjects;
    final $children = <_s.XmlNode>[
      if (sseKmsEncryptedObjects != null)
        sseKmsEncryptedObjects.toXml('SseKmsEncryptedObjects'),
      if (replicaModifications != null)
        replicaModifications.toXml('ReplicaModifications'),
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

/// A container for filter information that you can use to select S3 objects
/// that are encrypted with Key Management Service (KMS).
/// <note>
/// This is not supported by Amazon S3 on Outposts buckets.
/// </note>
class SseKmsEncryptedObjects {
  /// Specifies whether Amazon S3 replicates objects that are created with
  /// server-side encryption by using an KMS key stored in Key Management Service.
  final SseKmsEncryptedObjectsStatus status;

  SseKmsEncryptedObjects({
    required this.status,
  });
  factory SseKmsEncryptedObjects.fromXml(_s.XmlElement elem) {
    return SseKmsEncryptedObjects(
      status: _s
          .extractXmlStringValue(elem, 'Status')!
          .toSseKmsEncryptedObjectsStatus(),
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

enum SseKmsEncryptedObjectsStatus {
  enabled,
  disabled,
}

extension SseKmsEncryptedObjectsStatusValueExtension
    on SseKmsEncryptedObjectsStatus {
  String toValue() {
    switch (this) {
      case SseKmsEncryptedObjectsStatus.enabled:
        return 'Enabled';
      case SseKmsEncryptedObjectsStatus.disabled:
        return 'Disabled';
    }
  }
}

extension SseKmsEncryptedObjectsStatusFromString on String {
  SseKmsEncryptedObjectsStatus toSseKmsEncryptedObjectsStatus() {
    switch (this) {
      case 'Enabled':
        return SseKmsEncryptedObjectsStatus.enabled;
      case 'Disabled':
        return SseKmsEncryptedObjectsStatus.disabled;
    }
    throw Exception('$this is not known in enum SseKmsEncryptedObjectsStatus');
  }
}

/// The Amazon Web Services organization for your S3 Storage Lens.
class StorageLensAwsOrg {
  /// A container for the Amazon Resource Name (ARN) of the Amazon Web Services
  /// organization. This property is read-only and follows the following format:
  /// <code>
  /// arn:aws:organizations:<i>us-east-1</i>:<i>example-account-id</i>:organization/<i>o-ex2l495dck</i>
  /// </code>
  final String arn;

  StorageLensAwsOrg({
    required this.arn,
  });
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

  /// A container for the Amazon Web Services organization for this S3 Storage
  /// Lens configuration.
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
  /// A container for enabling Amazon CloudWatch publishing for S3 Storage Lens
  /// metrics.
  final CloudWatchMetrics? cloudWatchMetrics;

  /// A container for the bucket where the S3 Storage Lens metrics export will be
  /// located.
  /// <note>
  /// This bucket must be located in the same Region as the storage lens
  /// configuration.
  /// </note>
  final S3BucketDestination? s3BucketDestination;

  StorageLensDataExport({
    this.cloudWatchMetrics,
    this.s3BucketDestination,
  });
  factory StorageLensDataExport.fromXml(_s.XmlElement elem) {
    return StorageLensDataExport(
      cloudWatchMetrics: _s
          .extractXmlChild(elem, 'CloudWatchMetrics')
          ?.let((e) => CloudWatchMetrics.fromXml(e)),
      s3BucketDestination: _s
          .extractXmlChild(elem, 'S3BucketDestination')
          ?.let((e) => S3BucketDestination.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchMetrics = this.cloudWatchMetrics;
    final s3BucketDestination = this.s3BucketDestination;
    return {
      if (cloudWatchMetrics != null) 'CloudWatchMetrics': cloudWatchMetrics,
      if (s3BucketDestination != null)
        'S3BucketDestination': s3BucketDestination,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final cloudWatchMetrics = this.cloudWatchMetrics;
    final s3BucketDestination = this.s3BucketDestination;
    final $children = <_s.XmlNode>[
      if (s3BucketDestination != null)
        s3BucketDestination.toXml('S3BucketDestination'),
      if (cloudWatchMetrics != null)
        cloudWatchMetrics.toXml('CloudWatchMetrics'),
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

class SubmitMultiRegionAccessPointRoutesRequest {
  /// The Amazon Web Services account ID for the owner of the Multi-Region Access
  /// Point.
  final String accountId;

  /// The Multi-Region Access Point ARN.
  final String mrap;

  /// The different routes that make up the new route configuration. Active routes
  /// return a value of <code>100</code>, and passive routes return a value of
  /// <code>0</code>.
  final List<MultiRegionAccessPointRoute> routeUpdates;

  SubmitMultiRegionAccessPointRoutesRequest({
    required this.accountId,
    required this.mrap,
    required this.routeUpdates,
  });

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final mrap = this.mrap;
    final routeUpdates = this.routeUpdates;
    return {
      'RouteUpdates': routeUpdates,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final accountId = this.accountId;
    final mrap = this.mrap;
    final routeUpdates = this.routeUpdates;
    final $children = <_s.XmlNode>[
      _s.XmlElement(_s.XmlName('RouteUpdates'), [],
          routeUpdates.map((e) => e.toXml('Route'))),
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

class SubmitMultiRegionAccessPointRoutesResult {
  SubmitMultiRegionAccessPointRoutesResult();
  factory SubmitMultiRegionAccessPointRoutesResult.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return SubmitMultiRegionAccessPointRoutesResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// <p/>
class Tagging {
  /// A collection for a set of tags.
  final List<S3Tag> tagSet;

  Tagging({
    required this.tagSet,
  });

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
      if (date != null) 'Date': iso8601ToJson(date),
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

extension TransitionStorageClassValueExtension on TransitionStorageClass {
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

extension TransitionStorageClassFromString on String {
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

/// Describes the versioning state of an Amazon S3 on Outposts bucket. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_PutBucketVersioning.html">PutBucketVersioning</a>.
class VersioningConfiguration {
  /// Specifies whether MFA delete is enabled or disabled in the bucket versioning
  /// configuration for the S3 on Outposts bucket.
  final MFADelete? mFADelete;

  /// Sets the versioning state of the S3 on Outposts bucket.
  final BucketVersioningStatus? status;

  VersioningConfiguration({
    this.mFADelete,
    this.status,
  });

  Map<String, dynamic> toJson() {
    final mFADelete = this.mFADelete;
    final status = this.status;
    return {
      if (mFADelete != null) 'MfaDelete': mFADelete.toValue(),
      if (status != null) 'Status': status.toValue(),
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final mFADelete = this.mFADelete;
    final status = this.status;
    final $children = <_s.XmlNode>[
      if (mFADelete != null)
        _s.encodeXmlStringValue('MfaDelete', mFADelete.toValue()),
      if (status != null) _s.encodeXmlStringValue('Status', status.toValue()),
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

/// The virtual private cloud (VPC) configuration for an access point.
class VpcConfiguration {
  /// If this field is specified, this access point will only allow connections
  /// from the specified VPC ID.
  final String vpcId;

  VpcConfiguration({
    required this.vpcId,
  });
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
