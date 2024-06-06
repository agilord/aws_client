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

  /// Associate your S3 Access Grants instance with an Amazon Web Services IAM
  /// Identity Center instance. Use this action if you want to create access
  /// grants for users or groups from your corporate identity directory. First,
  /// you must add your corporate identity directory to Amazon Web Services IAM
  /// Identity Center. Then, you can associate this IAM Identity Center instance
  /// with your S3 Access Grants instance.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3:AssociateAccessGrantsIdentityCenter</code>
  /// permission to use this operation.
  /// </dd> <dt>Additional Permissions</dt> <dd>
  /// You must also have the following permissions:
  /// <code>sso:CreateApplication</code>, <code>sso:PutApplicationGrant</code>,
  /// and <code>sso:PutApplicationAuthenticationMethod</code>.
  /// </dd> </dl>
  ///
  /// Parameter [accountId] :
  /// The ID of the Amazon Web Services account that is making this request.
  ///
  /// Parameter [identityCenterArn] :
  /// The Amazon Resource Name (ARN) of the Amazon Web Services IAM Identity
  /// Center instance that you are associating with your S3 Access Grants
  /// instance. An IAM Identity Center instance is your corporate identity
  /// directory that you added to the IAM Identity Center. You can use the <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/APIReference/API_ListInstances.html">ListInstances</a>
  /// API operation to retrieve a list of your Identity Center instances and
  /// their ARNs.
  Future<void> associateAccessGrantsIdentityCenter({
    required String accountId,
    required String identityCenterArn,
  }) async {
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/v20180820/accessgrantsinstance/identitycenter',
      headers: headers,
      payload: AssociateAccessGrantsIdentityCenterRequest(
              accountId: accountId, identityCenterArn: identityCenterArn)
          .toXml(
        'AssociateAccessGrantsIdentityCenterRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'),
              'http://awss3control.amazonaws.com/doc/2018-08-20/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates an access grant that gives a grantee access to your S3 data. The
  /// grantee can be an IAM user or role or a directory user, or group. Before
  /// you can create a grant, you must have an S3 Access Grants instance in the
  /// same Region as the S3 data. You can create an S3 Access Grants instance
  /// using the <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_CreateAccessGrantsInstance.html">CreateAccessGrantsInstance</a>.
  /// You must also have registered at least one S3 data location in your S3
  /// Access Grants instance using <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_CreateAccessGrantsLocation.html">CreateAccessGrantsLocation</a>.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3:CreateAccessGrant</code> permission to use this
  /// operation.
  /// </dd> <dt>Additional Permissions</dt> <dd>
  /// For any directory identity - <code>sso:DescribeInstance</code> and
  /// <code>sso:DescribeApplication</code>
  ///
  /// For directory users - <code>identitystore:DescribeUser</code>
  ///
  /// For directory groups - <code>identitystore:DescribeGroup</code>
  /// </dd> </dl>
  ///
  /// Parameter [accessGrantsLocationId] :
  /// The ID of the registered location to which you are granting access. S3
  /// Access Grants assigns this ID when you register the location. S3 Access
  /// Grants assigns the ID <code>default</code> to the default location
  /// <code>s3://</code> and assigns an auto-generated ID to other locations
  /// that you register.
  ///
  /// If you are passing the <code>default</code> location, you cannot create an
  /// access grant for the entire default location. You must also specify a
  /// bucket or a bucket and prefix in the <code>Subprefix</code> field.
  ///
  /// Parameter [accountId] :
  /// The ID of the Amazon Web Services account that is making this request.
  ///
  /// Parameter [grantee] :
  /// The user, group, or role to which you are granting access. You can grant
  /// access to an IAM user or role. If you have added your corporate directory
  /// to Amazon Web Services IAM Identity Center and associated your Identity
  /// Center instance with your S3 Access Grants instance, the grantee can also
  /// be a corporate directory user or group.
  ///
  /// Parameter [permission] :
  /// The type of access that you are granting to your S3 data, which can be set
  /// to one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>READ</code> – Grant read-only access to the S3 data.
  /// </li>
  /// <li>
  /// <code>WRITE</code> – Grant write-only access to the S3 data.
  /// </li>
  /// <li>
  /// <code>READWRITE</code> – Grant both read and write access to the S3 data.
  /// </li>
  /// </ul>
  ///
  /// Parameter [accessGrantsLocationConfiguration] :
  /// The configuration options of the grant location. The grant location is the
  /// S3 path to the data to which you are granting access. It contains the
  /// <code>S3SubPrefix</code> field. The grant scope is the result of appending
  /// the subprefix to the location scope of the registered location.
  ///
  /// Parameter [applicationArn] :
  /// The Amazon Resource Name (ARN) of an Amazon Web Services IAM Identity
  /// Center application associated with your Identity Center instance. If an
  /// application ARN is included in the request to create an access grant, the
  /// grantee can only access the S3 data through this application.
  ///
  /// Parameter [s3PrefixType] :
  /// The type of <code>S3SubPrefix</code>. The only possible value is
  /// <code>Object</code>. Pass this value if the access grant scope is an
  /// object. Do not pass this value if the access grant scope is a bucket or a
  /// bucket and a prefix.
  ///
  /// Parameter [tags] :
  /// The Amazon Web Services resource tags that you are adding to the access
  /// grant. Each tag is a label consisting of a user-defined key and value.
  /// Tags can help you manage, identify, organize, search for, and filter
  /// resources.
  Future<CreateAccessGrantResult> createAccessGrant({
    required String accessGrantsLocationId,
    required String accountId,
    required Grantee grantee,
    required Permission permission,
    AccessGrantsLocationConfiguration? accessGrantsLocationConfiguration,
    String? applicationArn,
    S3PrefixType? s3PrefixType,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    final $result = await _protocol.send(
      method: 'POST',
      requestUri: '/v20180820/accessgrantsinstance/grant',
      headers: headers,
      payload: CreateAccessGrantRequest(
              accessGrantsLocationId: accessGrantsLocationId,
              accountId: accountId,
              grantee: grantee,
              permission: permission,
              accessGrantsLocationConfiguration:
                  accessGrantsLocationConfiguration,
              applicationArn: applicationArn,
              s3PrefixType: s3PrefixType,
              tags: tags)
          .toXml(
        'CreateAccessGrantRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'),
              'http://awss3control.amazonaws.com/doc/2018-08-20/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
    return CreateAccessGrantResult.fromXml($result.body);
  }

  /// Creates an S3 Access Grants instance, which serves as a logical grouping
  /// for access grants. You can create one S3 Access Grants instance per Region
  /// per account.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3:CreateAccessGrantsInstance</code> permission to
  /// use this operation.
  /// </dd> <dt>Additional Permissions</dt> <dd>
  /// To associate an IAM Identity Center instance with your S3 Access Grants
  /// instance, you must also have the <code>sso:DescribeInstance</code>,
  /// <code>sso:CreateApplication</code>, <code>sso:PutApplicationGrant</code>,
  /// and <code>sso:PutApplicationAuthenticationMethod</code> permissions.
  /// </dd> </dl>
  ///
  /// Parameter [accountId] :
  /// The ID of the Amazon Web Services account that is making this request.
  ///
  /// Parameter [identityCenterArn] :
  /// If you would like to associate your S3 Access Grants instance with an
  /// Amazon Web Services IAM Identity Center instance, use this field to pass
  /// the Amazon Resource Name (ARN) of the Amazon Web Services IAM Identity
  /// Center instance that you are associating with your S3 Access Grants
  /// instance. An IAM Identity Center instance is your corporate identity
  /// directory that you added to the IAM Identity Center. You can use the <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/APIReference/API_ListInstances.html">ListInstances</a>
  /// API operation to retrieve a list of your Identity Center instances and
  /// their ARNs.
  ///
  /// Parameter [tags] :
  /// The Amazon Web Services resource tags that you are adding to the S3 Access
  /// Grants instance. Each tag is a label consisting of a user-defined key and
  /// value. Tags can help you manage, identify, organize, search for, and
  /// filter resources.
  Future<CreateAccessGrantsInstanceResult> createAccessGrantsInstance({
    required String accountId,
    String? identityCenterArn,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    final $result = await _protocol.send(
      method: 'POST',
      requestUri: '/v20180820/accessgrantsinstance',
      headers: headers,
      payload: CreateAccessGrantsInstanceRequest(
              accountId: accountId,
              identityCenterArn: identityCenterArn,
              tags: tags)
          .toXml(
        'CreateAccessGrantsInstanceRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'),
              'http://awss3control.amazonaws.com/doc/2018-08-20/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
    return CreateAccessGrantsInstanceResult.fromXml($result.body);
  }

  /// The S3 data location that you would like to register in your S3 Access
  /// Grants instance. Your S3 data must be in the same Region as your S3 Access
  /// Grants instance. The location can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// The default S3 location <code>s3://</code>
  /// </li>
  /// <li>
  /// A bucket - <code>S3://&lt;bucket-name&gt;</code>
  /// </li>
  /// <li>
  /// A bucket and prefix - <code>S3://&lt;bucket-name&gt;/&lt;prefix&gt;</code>
  /// </li>
  /// </ul>
  /// When you register a location, you must include the IAM role that has
  /// permission to manage the S3 location that you are registering. Give S3
  /// Access Grants permission to assume this role <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/access-grants-location.html">using
  /// a policy</a>. S3 Access Grants assumes this role to manage access to the
  /// location and to vend temporary credentials to grantees or client
  /// applications.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3:CreateAccessGrantsLocation</code> permission to
  /// use this operation.
  /// </dd> <dt>Additional Permissions</dt> <dd>
  /// You must also have the following permission for the specified IAM role:
  /// <code>iam:PassRole</code>
  /// </dd> </dl>
  ///
  /// Parameter [accountId] :
  /// The ID of the Amazon Web Services account that is making this request.
  ///
  /// Parameter [iAMRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role for the registered
  /// location. S3 Access Grants assumes this role to manage access to the
  /// registered location.
  ///
  /// Parameter [locationScope] :
  /// The S3 path to the location that you are registering. The location scope
  /// can be the default S3 location <code>s3://</code>, the S3 path to a bucket
  /// <code>s3://&lt;bucket&gt;</code>, or the S3 path to a bucket and prefix
  /// <code>s3://&lt;bucket&gt;/&lt;prefix&gt;</code>. A prefix in S3 is a
  /// string of characters at the beginning of an object key name used to
  /// organize the objects that you store in your S3 buckets. For example,
  /// object key names that start with the <code>engineering/</code> prefix or
  /// object key names that start with the <code>marketing/campaigns/</code>
  /// prefix.
  ///
  /// Parameter [tags] :
  /// The Amazon Web Services resource tags that you are adding to the S3 Access
  /// Grants location. Each tag is a label consisting of a user-defined key and
  /// value. Tags can help you manage, identify, organize, search for, and
  /// filter resources.
  Future<CreateAccessGrantsLocationResult> createAccessGrantsLocation({
    required String accountId,
    required String iAMRoleArn,
    required String locationScope,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    final $result = await _protocol.send(
      method: 'POST',
      requestUri: '/v20180820/accessgrantsinstance/location',
      headers: headers,
      payload: CreateAccessGrantsLocationRequest(
              accountId: accountId,
              iAMRoleArn: iAMRoleArn,
              locationScope: locationScope,
              tags: tags)
          .toXml(
        'CreateAccessGrantsLocationRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'),
              'http://awss3control.amazonaws.com/doc/2018-08-20/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
    return CreateAccessGrantsLocationResult.fromXml($result.body);
  }

  /// <note>
  /// This operation is not supported by directory buckets.
  /// </note>
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
  /// For same account access point when your bucket and access point belong to
  /// the same account owner, the <code>BucketAccountId</code> is not required.
  /// For cross-account access point when your bucket and access point are not
  /// in the same account, the <code>BucketAccountId</code> is required.
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

  /// <note>
  /// This operation is not supported by directory buckets.
  /// </note>
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

  /// This operation creates an S3 Batch Operations job.
  ///
  /// You can use S3 Batch Operations to perform large-scale batch actions on
  /// Amazon S3 objects. Batch Operations can run a single action on lists of
  /// Amazon S3 objects that you specify. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/batch-ops.html">S3
  /// Batch Operations</a> in the <i>Amazon S3 User Guide</i>.
  /// <dl> <dt>Permissions</dt> <dd>
  /// For information about permissions required to use the Batch Operations,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/batch-ops-iam-role-policies.html">Granting
  /// permissions for S3 Batch Operations</a> in the <i>Amazon S3 User
  /// Guide</i>.
  /// </dd> </dl> <p/>
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

  /// <note>
  /// This operation is not supported by directory buckets.
  /// </note>
  /// Creates a Multi-Region Access Point and associates it with the specified
  /// buckets. For more information about creating Multi-Region Access Points,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/CreatingMultiRegionAccessPoints.html">Creating
  /// Multi-Region Access Points</a> in the <i>Amazon S3 User Guide</i>.
  ///
  /// This action will always be routed to the US West (Oregon) Region. For more
  /// information about the restrictions around working with Multi-Region Access
  /// Points, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/MultiRegionAccessPointRestrictions.html">Multi-Region
  /// Access Point restrictions and limitations</a> in the <i>Amazon S3 User
  /// Guide</i>.
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

  /// Creates a new S3 Storage Lens group and associates it with the specified
  /// Amazon Web Services account ID. An S3 Storage Lens group is a custom
  /// grouping of objects based on prefix, suffix, object tags, object size,
  /// object age, or a combination of these filters. For each Storage Lens group
  /// that you’ve created, you can also optionally add Amazon Web Services
  /// resource tags. For more information about S3 Storage Lens groups, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage-lens-groups-overview.html">Working
  /// with S3 Storage Lens groups</a>.
  ///
  /// To use this operation, you must have the permission to perform the
  /// <code>s3:CreateStorageLensGroup</code> action. If you’re trying to create
  /// a Storage Lens group with Amazon Web Services resource tags, you must also
  /// have permission to perform the <code>s3:TagResource</code> action. For
  /// more information about the required Storage Lens Groups permissions, see
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage_lens_iam_permissions.html#storage_lens_groups_permissions">Setting
  /// account permissions to use S3 Storage Lens groups</a>.
  ///
  /// For information about Storage Lens groups errors, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/ErrorResponses.html#S3LensErrorCodeList">List
  /// of Amazon S3 Storage Lens error codes</a>.
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID that the Storage Lens group is created
  /// from and associated with.
  ///
  /// Parameter [storageLensGroup] :
  /// The Storage Lens group configuration.
  ///
  /// Parameter [tags] :
  /// The Amazon Web Services resource tags that you're adding to your Storage
  /// Lens group. This parameter is optional.
  Future<void> createStorageLensGroup({
    required String accountId,
    required StorageLensGroup storageLensGroup,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/v20180820/storagelensgroup',
      headers: headers,
      payload: CreateStorageLensGroupRequest(
              accountId: accountId,
              storageLensGroup: storageLensGroup,
              tags: tags)
          .toXml(
        'CreateStorageLensGroupRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'),
              'http://awss3control.amazonaws.com/doc/2018-08-20/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the access grant from the S3 Access Grants instance. You cannot
  /// undo an access grant deletion and the grantee will no longer have access
  /// to the S3 data.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3:DeleteAccessGrant</code> permission to use this
  /// operation.
  /// </dd> </dl>
  ///
  /// Parameter [accessGrantId] :
  /// The ID of the access grant. S3 Access Grants auto-generates this ID when
  /// you create the access grant.
  ///
  /// Parameter [accountId] :
  /// The ID of the Amazon Web Services account that is making this request.
  Future<void> deleteAccessGrant({
    required String accessGrantId,
    required String accountId,
  }) async {
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    await _protocol.send(
      method: 'DELETE',
      requestUri:
          '/v20180820/accessgrantsinstance/grant/${Uri.encodeComponent(accessGrantId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes your S3 Access Grants instance. You must first delete the access
  /// grants and locations before S3 Access Grants can delete the instance. See
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DeleteAccessGrant.html">DeleteAccessGrant</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DeleteAccessGrantsLocation.html">DeleteAccessGrantsLocation</a>.
  /// If you have associated an IAM Identity Center instance with your S3 Access
  /// Grants instance, you must first dissassociate the Identity Center instance
  /// from the S3 Access Grants instance before you can delete the S3 Access
  /// Grants instance. See <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_AssociateAccessGrantsIdentityCenter.html">AssociateAccessGrantsIdentityCenter</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DissociateAccessGrantsIdentityCenter.html">DissociateAccessGrantsIdentityCenter</a>.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3:DeleteAccessGrantsInstance</code> permission to
  /// use this operation.
  /// </dd> </dl>
  ///
  /// Parameter [accountId] :
  /// The ID of the Amazon Web Services account that is making this request.
  Future<void> deleteAccessGrantsInstance({
    required String accountId,
  }) async {
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    await _protocol.send(
      method: 'DELETE',
      requestUri: '/v20180820/accessgrantsinstance',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the resource policy of the S3 Access Grants instance. The resource
  /// policy is used to manage cross-account access to your S3 Access Grants
  /// instance. By deleting the resource policy, you delete any cross-account
  /// permissions to your S3 Access Grants instance.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3:DeleteAccessGrantsInstanceResourcePolicy</code>
  /// permission to use this operation.
  /// </dd> </dl>
  ///
  /// Parameter [accountId] :
  /// The ID of the Amazon Web Services account that is making this request.
  Future<void> deleteAccessGrantsInstanceResourcePolicy({
    required String accountId,
  }) async {
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    await _protocol.send(
      method: 'DELETE',
      requestUri: '/v20180820/accessgrantsinstance/resourcepolicy',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deregisters a location from your S3 Access Grants instance. You can only
  /// delete a location registration from an S3 Access Grants instance if there
  /// are no grants associated with this location. See <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_DeleteAccessGrant.html">Delete
  /// a grant</a> for information on how to delete grants. You need to have at
  /// least one registered location in your S3 Access Grants instance in order
  /// to create access grants.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3:DeleteAccessGrantsLocation</code> permission to
  /// use this operation.
  /// </dd> </dl>
  ///
  /// Parameter [accessGrantsLocationId] :
  /// The ID of the registered location that you are deregistering from your S3
  /// Access Grants instance. S3 Access Grants assigned this ID when you
  /// registered the location. S3 Access Grants assigns the ID
  /// <code>default</code> to the default location <code>s3://</code> and
  /// assigns an auto-generated ID to other locations that you register.
  ///
  /// Parameter [accountId] :
  /// The ID of the Amazon Web Services account that is making this request.
  Future<void> deleteAccessGrantsLocation({
    required String accessGrantsLocationId,
    required String accountId,
  }) async {
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    await _protocol.send(
      method: 'DELETE',
      requestUri:
          '/v20180820/accessgrantsinstance/location/${Uri.encodeComponent(accessGrantsLocationId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// <note>
  /// This operation is not supported by directory buckets.
  /// </note>
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

  /// <note>
  /// This operation is not supported by directory buckets.
  /// </note>
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

  /// <note>
  /// This operation is not supported by directory buckets.
  /// </note>
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

  /// <note>
  /// This operation is not supported by directory buckets.
  /// </note>
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
  /// To use this operation, you must have permission to perform the
  /// <code>s3-outposts:PutLifecycleConfiguration</code> action. By default, the
  /// bucket owner has this permission and the Outposts bucket owner can grant
  /// this permission to others.
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

  /// Removes the entire tag set from the specified S3 Batch Operations job.
  /// <dl> <dt>Permissions</dt> <dd>
  /// To use the <code>DeleteJobTagging</code> operation, you must have
  /// permission to perform the <code>s3:DeleteJobTagging</code> action. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/batch-ops-managing-jobs.html#batch-ops-job-tags">Controlling
  /// access and labeling jobs using tags</a> in the <i>Amazon S3 User
  /// Guide</i>.
  /// </dd> </dl>
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

  /// <note>
  /// This operation is not supported by directory buckets.
  /// </note>
  /// Deletes a Multi-Region Access Point. This action does not delete the
  /// buckets associated with the Multi-Region Access Point, only the
  /// Multi-Region Access Point itself.
  ///
  /// This action will always be routed to the US West (Oregon) Region. For more
  /// information about the restrictions around working with Multi-Region Access
  /// Points, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/MultiRegionAccessPointRestrictions.html">Multi-Region
  /// Access Point restrictions and limitations</a> in the <i>Amazon S3 User
  /// Guide</i>.
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

  /// <note>
  /// This operation is not supported by directory buckets.
  /// </note>
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

  /// <note>
  /// This operation is not supported by directory buckets.
  /// </note>
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

  /// <note>
  /// This operation is not supported by directory buckets.
  /// </note>
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

  /// Deletes an existing S3 Storage Lens group.
  ///
  /// To use this operation, you must have the permission to perform the
  /// <code>s3:DeleteStorageLensGroup</code> action. For more information about
  /// the required Storage Lens Groups permissions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage_lens_iam_permissions.html#storage_lens_groups_permissions">Setting
  /// account permissions to use S3 Storage Lens groups</a>.
  ///
  /// For information about Storage Lens groups errors, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/ErrorResponses.html#S3LensErrorCodeList">List
  /// of Amazon S3 Storage Lens error codes</a>.
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID used to create the Storage Lens group
  /// that you're trying to delete.
  ///
  /// Parameter [name] :
  /// The name of the Storage Lens group that you're trying to delete.
  Future<void> deleteStorageLensGroup({
    required String accountId,
    required String name,
  }) async {
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    await _protocol.send(
      method: 'DELETE',
      requestUri: '/v20180820/storagelensgroup/${Uri.encodeComponent(name)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves the configuration parameters and status for a Batch Operations
  /// job. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/batch-ops.html">S3
  /// Batch Operations</a> in the <i>Amazon S3 User Guide</i>.
  /// <dl> <dt>Permissions</dt> <dd>
  /// To use the <code>DescribeJob</code> operation, you must have permission to
  /// perform the <code>s3:DescribeJob</code> action.
  /// </dd> </dl>
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

  /// <note>
  /// This operation is not supported by directory buckets.
  /// </note>
  /// Retrieves the status of an asynchronous request to manage a Multi-Region
  /// Access Point. For more information about managing Multi-Region Access
  /// Points and how asynchronous requests work, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/MrapOperations.html">Using
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

  /// Dissociates the Amazon Web Services IAM Identity Center instance from the
  /// S3 Access Grants instance.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3:DissociateAccessGrantsIdentityCenter</code>
  /// permission to use this operation.
  /// </dd> <dt>Additional Permissions</dt> <dd>
  /// You must have the <code>sso:DeleteApplication</code> permission to use
  /// this operation.
  /// </dd> </dl>
  ///
  /// Parameter [accountId] :
  /// The ID of the Amazon Web Services account that is making this request.
  Future<void> dissociateAccessGrantsIdentityCenter({
    required String accountId,
  }) async {
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    await _protocol.send(
      method: 'DELETE',
      requestUri: '/v20180820/accessgrantsinstance/identitycenter',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Get the details of an access grant from your S3 Access Grants instance.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3:GetAccessGrant</code> permission to use this
  /// operation.
  /// </dd> </dl>
  ///
  /// Parameter [accessGrantId] :
  /// The ID of the access grant. S3 Access Grants auto-generates this ID when
  /// you create the access grant.
  ///
  /// Parameter [accountId] :
  /// The ID of the Amazon Web Services account that is making this request.
  Future<GetAccessGrantResult> getAccessGrant({
    required String accessGrantId,
    required String accountId,
  }) async {
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri:
          '/v20180820/accessgrantsinstance/grant/${Uri.encodeComponent(accessGrantId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetAccessGrantResult.fromXml($result.body);
  }

  /// Retrieves the S3 Access Grants instance for a Region in your account.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3:GetAccessGrantsInstance</code> permission to
  /// use this operation.
  /// </dd> </dl>
  ///
  /// Parameter [accountId] :
  /// The ID of the Amazon Web Services account that is making this request.
  Future<GetAccessGrantsInstanceResult> getAccessGrantsInstance({
    required String accountId,
  }) async {
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/v20180820/accessgrantsinstance',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetAccessGrantsInstanceResult.fromXml($result.body);
  }

  /// Retrieve the S3 Access Grants instance that contains a particular prefix.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3:GetAccessGrantsInstanceForPrefix</code>
  /// permission for the caller account to use this operation.
  /// </dd> <dt>Additional Permissions</dt> <dd>
  /// The prefix owner account must grant you the following permissions to their
  /// S3 Access Grants instance:
  /// <code>s3:GetAccessGrantsInstanceForPrefix</code>.
  /// </dd> </dl>
  ///
  /// Parameter [accountId] :
  /// The ID of the Amazon Web Services account that is making this request.
  ///
  /// Parameter [s3Prefix] :
  /// The S3 prefix of the access grants that you would like to retrieve.
  Future<GetAccessGrantsInstanceForPrefixResult>
      getAccessGrantsInstanceForPrefix({
    required String accountId,
    required String s3Prefix,
  }) async {
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    final $query = <String, List<String>>{
      's3prefix': [s3Prefix],
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/v20180820/accessgrantsinstance/prefix',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetAccessGrantsInstanceForPrefixResult.fromXml($result.body);
  }

  /// Returns the resource policy of the S3 Access Grants instance.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3:GetAccessGrantsInstanceResourcePolicy</code>
  /// permission to use this operation.
  /// </dd> </dl>
  ///
  /// Parameter [accountId] :
  /// The ID of the Amazon Web Services account that is making this request.
  Future<GetAccessGrantsInstanceResourcePolicyResult>
      getAccessGrantsInstanceResourcePolicy({
    required String accountId,
  }) async {
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/v20180820/accessgrantsinstance/resourcepolicy',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetAccessGrantsInstanceResourcePolicyResult.fromXml($result.body);
  }

  /// Retrieves the details of a particular location registered in your S3
  /// Access Grants instance.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3:GetAccessGrantsLocation</code> permission to
  /// use this operation.
  /// </dd> </dl>
  ///
  /// Parameter [accessGrantsLocationId] :
  /// The ID of the registered location that you are retrieving. S3 Access
  /// Grants assigns this ID when you register the location. S3 Access Grants
  /// assigns the ID <code>default</code> to the default location
  /// <code>s3://</code> and assigns an auto-generated ID to other locations
  /// that you register.
  ///
  /// Parameter [accountId] :
  /// The ID of the Amazon Web Services account that is making this request.
  Future<GetAccessGrantsLocationResult> getAccessGrantsLocation({
    required String accessGrantsLocationId,
    required String accountId,
  }) async {
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri:
          '/v20180820/accessgrantsinstance/location/${Uri.encodeComponent(accessGrantsLocationId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetAccessGrantsLocationResult.fromXml($result.body);
  }

  /// <note>
  /// This operation is not supported by directory buckets.
  /// </note>
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

  /// <note>
  /// This operation is not supported by directory buckets.
  /// </note>
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

  /// <note>
  /// This operation is not supported by directory buckets.
  /// </note>
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

  /// <note>
  /// This operation is not supported by directory buckets.
  /// </note>
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

  /// <note>
  /// This operation is not supported by directory buckets.
  /// </note>
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

  /// <note>
  /// This operation is not supported by directory buckets.
  /// </note>
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

  /// <note>
  /// This operation is not supported by directory buckets.
  /// </note>
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

  /// Returns a temporary access credential from S3 Access Grants to the grantee
  /// or client application. The <a
  /// href="https://docs.aws.amazon.com/STS/latest/APIReference/API_Credentials.html">temporary
  /// credential</a> is an Amazon Web Services STS token that grants them access
  /// to the S3 data.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3:GetDataAccess</code> permission to use this
  /// operation.
  /// </dd> <dt>Additional Permissions</dt> <dd>
  /// The IAM role that S3 Access Grants assumes must have the following
  /// permissions specified in the trust policy when registering the location:
  /// <code>sts:AssumeRole</code>, for directory users or groups
  /// <code>sts:SetContext</code>, and for IAM users or roles
  /// <code>sts:SetSourceIdentity</code>.
  /// </dd> </dl>
  ///
  /// Parameter [accountId] :
  /// The ID of the Amazon Web Services account that is making this request.
  ///
  /// Parameter [permission] :
  /// The type of permission granted to your S3 data, which can be set to one of
  /// the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>READ</code> – Grant read-only access to the S3 data.
  /// </li>
  /// <li>
  /// <code>WRITE</code> – Grant write-only access to the S3 data.
  /// </li>
  /// <li>
  /// <code>READWRITE</code> – Grant both read and write access to the S3 data.
  /// </li>
  /// </ul>
  ///
  /// Parameter [target] :
  /// The S3 URI path of the data to which you are requesting temporary access
  /// credentials. If the requesting account has an access grant for this data,
  /// S3 Access Grants vends temporary access credentials in the response.
  ///
  /// Parameter [durationSeconds] :
  /// The session duration, in seconds, of the temporary access credential that
  /// S3 Access Grants vends to the grantee or client application. The default
  /// value is 1 hour, but the grantee can specify a range from 900 seconds (15
  /// minutes) up to 43200 seconds (12 hours). If the grantee requests a value
  /// higher than this maximum, the operation fails.
  ///
  /// Parameter [privilege] :
  /// The scope of the temporary access credential that S3 Access Grants vends
  /// to the grantee or client application.
  ///
  /// <ul>
  /// <li>
  /// <code>Default</code> – The scope of the returned temporary access token is
  /// the scope of the grant that is closest to the target scope.
  /// </li>
  /// <li>
  /// <code>Minimal</code> – The scope of the returned temporary access token is
  /// the same as the requested target scope as long as the requested scope is
  /// the same as or a subset of the grant scope.
  /// </li>
  /// </ul>
  ///
  /// Parameter [targetType] :
  /// The type of <code>Target</code>. The only possible value is
  /// <code>Object</code>. Pass this value if the target data that you would
  /// like to access is a path to an object. Do not pass this value if the
  /// target data is a bucket or a bucket and a prefix.
  Future<GetDataAccessResult> getDataAccess({
    required String accountId,
    required Permission permission,
    required String target,
    int? durationSeconds,
    Privilege? privilege,
    S3PrefixType? targetType,
  }) async {
    _s.validateNumRange(
      'durationSeconds',
      durationSeconds,
      900,
      43200,
    );
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    final $query = <String, List<String>>{
      'permission': [permission.toValue()],
      'target': [target],
      if (durationSeconds != null)
        'durationSeconds': [durationSeconds.toString()],
      if (privilege != null) 'privilege': [privilege.toValue()],
      if (targetType != null) 'targetType': [targetType.toValue()],
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/v20180820/accessgrantsinstance/dataaccess',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetDataAccessResult.fromXml($result.body);
  }

  /// Returns the tags on an S3 Batch Operations job.
  /// <dl> <dt>Permissions</dt> <dd>
  /// To use the <code>GetJobTagging</code> operation, you must have permission
  /// to perform the <code>s3:GetJobTagging</code> action. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/batch-ops-managing-jobs.html#batch-ops-job-tags">Controlling
  /// access and labeling jobs using tags</a> in the <i>Amazon S3 User
  /// Guide</i>.
  /// </dd> </dl>
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

  /// <note>
  /// This operation is not supported by directory buckets.
  /// </note>
  /// Returns configuration information about the specified Multi-Region Access
  /// Point.
  ///
  /// This action will always be routed to the US West (Oregon) Region. For more
  /// information about the restrictions around working with Multi-Region Access
  /// Points, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/MultiRegionAccessPointRestrictions.html">Multi-Region
  /// Access Point restrictions and limitations</a> in the <i>Amazon S3 User
  /// Guide</i>.
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
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/CreatingMultiRegionAccessPoints.html#multi-region-access-point-naming">Rules
  /// for naming Amazon S3 Multi-Region Access Points</a> in the <i>Amazon S3
  /// User Guide</i>.
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

  /// <note>
  /// This operation is not supported by directory buckets.
  /// </note>
  /// Returns the access control policy of the specified Multi-Region Access
  /// Point.
  ///
  /// This action will always be routed to the US West (Oregon) Region. For more
  /// information about the restrictions around working with Multi-Region Access
  /// Points, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/MultiRegionAccessPointRestrictions.html">Multi-Region
  /// Access Point restrictions and limitations</a> in the <i>Amazon S3 User
  /// Guide</i>.
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
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/CreatingMultiRegionAccessPoints.html#multi-region-access-point-naming">Rules
  /// for naming Amazon S3 Multi-Region Access Points</a> in the <i>Amazon S3
  /// User Guide</i>.
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

  /// <note>
  /// This operation is not supported by directory buckets.
  /// </note>
  /// Indicates whether the specified Multi-Region Access Point has an access
  /// control policy that allows public access.
  ///
  /// This action will always be routed to the US West (Oregon) Region. For more
  /// information about the restrictions around working with Multi-Region Access
  /// Points, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/MultiRegionAccessPointRestrictions.html">Multi-Region
  /// Access Point restrictions and limitations</a> in the <i>Amazon S3 User
  /// Guide</i>.
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
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/CreatingMultiRegionAccessPoints.html#multi-region-access-point-naming">Rules
  /// for naming Amazon S3 Multi-Region Access Points</a> in the <i>Amazon S3
  /// User Guide</i>.
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

  /// <note>
  /// This operation is not supported by directory buckets.
  /// </note>
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
  /// </ul>
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

  /// <note>
  /// This operation is not supported by directory buckets.
  /// </note>
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

  /// <note>
  /// This operation is not supported by directory buckets.
  /// </note>
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

  /// <note>
  /// This operation is not supported by directory buckets.
  /// </note>
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

  /// Retrieves the Storage Lens group configuration details.
  ///
  /// To use this operation, you must have the permission to perform the
  /// <code>s3:GetStorageLensGroup</code> action. For more information about the
  /// required Storage Lens Groups permissions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage_lens_iam_permissions.html#storage_lens_groups_permissions">Setting
  /// account permissions to use S3 Storage Lens groups</a>.
  ///
  /// For information about Storage Lens groups errors, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/ErrorResponses.html#S3LensErrorCodeList">List
  /// of Amazon S3 Storage Lens error codes</a>.
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID associated with the Storage Lens group
  /// that you're trying to retrieve the details for.
  ///
  /// Parameter [name] :
  /// The name of the Storage Lens group that you're trying to retrieve the
  /// configuration details for.
  Future<GetStorageLensGroupResult> getStorageLensGroup({
    required String accountId,
    required String name,
  }) async {
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri: '/v20180820/storagelensgroup/${Uri.encodeComponent(name)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return GetStorageLensGroupResult(
      storageLensGroup: StorageLensGroup.fromXml($elem),
    );
  }

  /// Returns the list of access grants in your S3 Access Grants instance.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3:ListAccessGrants</code> permission to use this
  /// operation.
  /// </dd> </dl>
  ///
  /// Parameter [accountId] :
  /// The ID of the Amazon Web Services account that is making this request.
  ///
  /// Parameter [applicationArn] :
  /// The Amazon Resource Name (ARN) of an Amazon Web Services IAM Identity
  /// Center application associated with your Identity Center instance. If the
  /// grant includes an application ARN, the grantee can only access the S3 data
  /// through this application.
  ///
  /// Parameter [grantScope] :
  /// The S3 path of the data to which you are granting access. It is the result
  /// of appending the <code>Subprefix</code> to the location scope.
  ///
  /// Parameter [granteeIdentifier] :
  /// The unique identifer of the <code>Grantee</code>. If the grantee type is
  /// <code>IAM</code>, the identifier is the IAM Amazon Resource Name (ARN) of
  /// the user or role. If the grantee type is a directory user or group, the
  /// identifier is 128-bit universally unique identifier (UUID) in the format
  /// <code>a1b2c3d4-5678-90ab-cdef-EXAMPLE11111</code>. You can obtain this
  /// UUID from your Amazon Web Services IAM Identity Center instance.
  ///
  /// Parameter [granteeType] :
  /// The type of the grantee to which access has been granted. It can be one of
  /// the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>IAM</code> - An IAM user or role.
  /// </li>
  /// <li>
  /// <code>DIRECTORY_USER</code> - Your corporate directory user. You can use
  /// this option if you have added your corporate identity directory to IAM
  /// Identity Center and associated the IAM Identity Center instance with your
  /// S3 Access Grants instance.
  /// </li>
  /// <li>
  /// <code>DIRECTORY_GROUP</code> - Your corporate directory group. You can use
  /// this option if you have added your corporate identity directory to IAM
  /// Identity Center and associated the IAM Identity Center instance with your
  /// S3 Access Grants instance.
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of access grants that you would like returned in the
  /// <code>List Access Grants</code> response. If the results include the
  /// pagination token <code>NextToken</code>, make another call using the
  /// <code>NextToken</code> to determine if there are more results.
  ///
  /// Parameter [nextToken] :
  /// A pagination token to request the next page of results. Pass this value
  /// into a subsequent <code>List Access Grants</code> request in order to
  /// retrieve the next page of results.
  ///
  /// Parameter [permission] :
  /// The type of permission granted to your S3 data, which can be set to one of
  /// the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>READ</code> – Grant read-only access to the S3 data.
  /// </li>
  /// <li>
  /// <code>WRITE</code> – Grant write-only access to the S3 data.
  /// </li>
  /// <li>
  /// <code>READWRITE</code> – Grant both read and write access to the S3 data.
  /// </li>
  /// </ul>
  Future<ListAccessGrantsResult> listAccessGrants({
    required String accountId,
    String? applicationArn,
    String? grantScope,
    String? granteeIdentifier,
    GranteeType? granteeType,
    int? maxResults,
    String? nextToken,
    Permission? permission,
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
      if (applicationArn != null) 'application_arn': [applicationArn],
      if (grantScope != null) 'grantscope': [grantScope],
      if (granteeIdentifier != null) 'granteeidentifier': [granteeIdentifier],
      if (granteeType != null) 'granteetype': [granteeType.toValue()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (permission != null) 'permission': [permission.toValue()],
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/v20180820/accessgrantsinstance/grants',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListAccessGrantsResult.fromXml($result.body);
  }

  /// Returns a list of S3 Access Grants instances. An S3 Access Grants instance
  /// serves as a logical grouping for your individual access grants. You can
  /// only have one S3 Access Grants instance per Region per account.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3:ListAccessGrantsInstances</code> permission to
  /// use this operation.
  /// </dd> </dl>
  ///
  /// Parameter [accountId] :
  /// The ID of the Amazon Web Services account that is making this request.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of access grants that you would like returned in the
  /// <code>List Access Grants</code> response. If the results include the
  /// pagination token <code>NextToken</code>, make another call using the
  /// <code>NextToken</code> to determine if there are more results.
  ///
  /// Parameter [nextToken] :
  /// A pagination token to request the next page of results. Pass this value
  /// into a subsequent <code>List Access Grants Instances</code> request in
  /// order to retrieve the next page of results.
  Future<ListAccessGrantsInstancesResult> listAccessGrantsInstances({
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
      requestUri: '/v20180820/accessgrantsinstances',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListAccessGrantsInstancesResult.fromXml($result.body);
  }

  /// Returns a list of the locations registered in your S3 Access Grants
  /// instance.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3:ListAccessGrantsLocations</code> permission to
  /// use this operation.
  /// </dd> </dl>
  ///
  /// Parameter [accountId] :
  /// The ID of the Amazon Web Services account that is making this request.
  ///
  /// Parameter [locationScope] :
  /// The S3 path to the location that you are registering. The location scope
  /// can be the default S3 location <code>s3://</code>, the S3 path to a bucket
  /// <code>s3://&lt;bucket&gt;</code>, or the S3 path to a bucket and prefix
  /// <code>s3://&lt;bucket&gt;/&lt;prefix&gt;</code>. A prefix in S3 is a
  /// string of characters at the beginning of an object key name used to
  /// organize the objects that you store in your S3 buckets. For example,
  /// object key names that start with the <code>engineering/</code> prefix or
  /// object key names that start with the <code>marketing/campaigns/</code>
  /// prefix.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of access grants that you would like returned in the
  /// <code>List Access Grants</code> response. If the results include the
  /// pagination token <code>NextToken</code>, make another call using the
  /// <code>NextToken</code> to determine if there are more results.
  ///
  /// Parameter [nextToken] :
  /// A pagination token to request the next page of results. Pass this value
  /// into a subsequent <code>List Access Grants Locations</code> request in
  /// order to retrieve the next page of results.
  Future<ListAccessGrantsLocationsResult> listAccessGrantsLocations({
    required String accountId,
    String? locationScope,
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
      if (locationScope != null) 'locationscope': [locationScope],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/v20180820/accessgrantsinstance/locations',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListAccessGrantsLocationsResult.fromXml($result.body);
  }

  /// <note>
  /// This operation is not supported by directory buckets.
  /// </note>
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

  /// <note>
  /// This operation is not supported by directory buckets.
  /// </note>
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

  /// Lists current S3 Batch Operations jobs as well as the jobs that have ended
  /// within the last 90 days for the Amazon Web Services account making the
  /// request. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/batch-ops.html">S3
  /// Batch Operations</a> in the <i>Amazon S3 User Guide</i>.
  /// <dl> <dt>Permissions</dt> <dd>
  /// To use the <code>ListJobs</code> operation, you must have permission to
  /// perform the <code>s3:ListJobs</code> action.
  /// </dd> </dl>
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

  /// <note>
  /// This operation is not supported by directory buckets.
  /// </note>
  /// Returns a list of the Multi-Region Access Points currently associated with
  /// the specified Amazon Web Services account. Each call can return up to 100
  /// Multi-Region Access Points, the maximum number of Multi-Region Access
  /// Points that can be associated with a single account.
  ///
  /// This action will always be routed to the US West (Oregon) Region. For more
  /// information about the restrictions around working with Multi-Region Access
  /// Points, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/MultiRegionAccessPointRestrictions.html">Multi-Region
  /// Access Point restrictions and limitations</a> in the <i>Amazon S3 User
  /// Guide</i>.
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

  /// <note>
  /// This operation is not supported by directory buckets.
  /// </note>
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

  /// <note>
  /// This operation is not supported by directory buckets.
  /// </note>
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

  /// Lists all the Storage Lens groups in the specified home Region.
  ///
  /// To use this operation, you must have the permission to perform the
  /// <code>s3:ListStorageLensGroups</code> action. For more information about
  /// the required Storage Lens Groups permissions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage_lens_iam_permissions.html#storage_lens_groups_permissions">Setting
  /// account permissions to use S3 Storage Lens groups</a>.
  ///
  /// For information about Storage Lens groups errors, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/ErrorResponses.html#S3LensErrorCodeList">List
  /// of Amazon S3 Storage Lens error codes</a>.
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID that owns the Storage Lens groups.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> if there are
  /// no more results.
  Future<ListStorageLensGroupsResult> listStorageLensGroups({
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
      requestUri: '/v20180820/storagelensgroup',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListStorageLensGroupsResult.fromXml($result.body);
  }

  /// This operation allows you to list all the Amazon Web Services resource
  /// tags for a specified resource. Each tag is a label consisting of a
  /// user-defined key and value. Tags can help you manage, identify, organize,
  /// search for, and filter resources.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3:ListTagsForResource</code> permission to use
  /// this operation.
  /// </dd> </dl> <note>
  /// This operation is only supported for <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage-lens-groups.html">S3
  /// Storage Lens groups</a> and for <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/access-grants-tagging.html">S3
  /// Access Grants</a>. The tagged resource can be an S3 Storage Lens group or
  /// S3 Access Grants instance, registered location, or grant.
  /// </note>
  /// For more information about the required Storage Lens Groups permissions,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage_lens_iam_permissions.html#storage_lens_groups_permissions">Setting
  /// account permissions to use S3 Storage Lens groups</a>.
  ///
  /// For information about S3 Tagging errors, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/ErrorResponses.html#S3TaggingErrorCodeList">List
  /// of Amazon S3 Tagging error codes</a>.
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID of the resource owner.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the S3 resource that you want to list
  /// the tags for. The tagged resource can be an S3 Storage Lens group or S3
  /// Access Grants instance, registered location, or grant.
  Future<ListTagsForResourceResult> listTagsForResource({
    required String accountId,
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri:
          '/v20180820/tags/${resourceArn.split('/').map(Uri.encodeComponent).join('/')}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResult.fromXml($result.body);
  }

  /// Updates the resource policy of the S3 Access Grants instance.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3:PutAccessGrantsInstanceResourcePolicy</code>
  /// permission to use this operation.
  /// </dd> </dl>
  ///
  /// Parameter [accountId] :
  /// The ID of the Amazon Web Services account that is making this request.
  ///
  /// Parameter [policy] :
  /// The resource policy of the S3 Access Grants instance that you are
  /// updating.
  ///
  /// Parameter [organization] :
  /// The Organization of the resource policy of the S3 Access Grants instance.
  Future<PutAccessGrantsInstanceResourcePolicyResult>
      putAccessGrantsInstanceResourcePolicy({
    required String accountId,
    required String policy,
    String? organization,
  }) async {
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    final $result = await _protocol.send(
      method: 'PUT',
      requestUri: '/v20180820/accessgrantsinstance/resourcepolicy',
      headers: headers,
      payload: PutAccessGrantsInstanceResourcePolicyRequest(
              accountId: accountId, policy: policy, organization: organization)
          .toXml(
        'PutAccessGrantsInstanceResourcePolicyRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'),
              'http://awss3control.amazonaws.com/doc/2018-08-20/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
    return PutAccessGrantsInstanceResourcePolicyResult.fromXml($result.body);
  }

  /// <note>
  /// This operation is not supported by directory buckets.
  /// </note>
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

  /// <note>
  /// This operation is not supported by directory buckets.
  /// </note>
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

  /// <note>
  /// This operation is not supported by directory buckets.
  /// </note>
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
  /// modify that tag set, and use this operation to replace the tag set with
  /// the one you modified. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/batch-ops-managing-jobs.html#batch-ops-job-tags">Controlling
  /// access and labeling jobs using tags</a> in the <i>Amazon S3 User
  /// Guide</i>.
  /// <note>
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
  /// </ul> </note> <dl> <dt>Permissions</dt> <dd>
  /// To use the <code>PutJobTagging</code> operation, you must have permission
  /// to perform the <code>s3:PutJobTagging</code> action.
  /// </dd> </dl>
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

  /// <note>
  /// This operation is not supported by directory buckets.
  /// </note>
  /// Associates an access control policy with the specified Multi-Region Access
  /// Point. Each Multi-Region Access Point can have only one policy, so a
  /// request made to this action replaces any existing policy that is
  /// associated with the specified Multi-Region Access Point.
  ///
  /// This action will always be routed to the US West (Oregon) Region. For more
  /// information about the restrictions around working with Multi-Region Access
  /// Points, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/MultiRegionAccessPointRestrictions.html">Multi-Region
  /// Access Point restrictions and limitations</a> in the <i>Amazon S3 User
  /// Guide</i>.
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

  /// <note>
  /// This operation is not supported by directory buckets.
  /// </note>
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

  /// <note>
  /// This operation is not supported by directory buckets.
  /// </note>
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

  /// <note>
  /// This operation is not supported by directory buckets.
  /// </note>
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

  /// <note>
  /// This operation is not supported by directory buckets.
  /// </note>
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
  /// </ul>
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

  /// Creates a new Amazon Web Services resource tag or updates an existing
  /// resource tag. Each tag is a label consisting of a user-defined key and
  /// value. Tags can help you manage, identify, organize, search for, and
  /// filter resources. You can add up to 50 Amazon Web Services resource tags
  /// for each S3 resource.
  /// <note>
  /// This operation is only supported for <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage-lens-groups.html">S3
  /// Storage Lens groups</a> and for <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/access-grants-tagging.html">S3
  /// Access Grants</a>. The tagged resource can be an S3 Storage Lens group or
  /// S3 Access Grants instance, registered location, or grant.
  /// </note> <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3:TagResource</code> permission to use this
  /// operation.
  /// </dd> </dl>
  /// For more information about the required Storage Lens Groups permissions,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage_lens_iam_permissions.html#storage_lens_groups_permissions">Setting
  /// account permissions to use S3 Storage Lens groups</a>.
  ///
  /// For information about S3 Tagging errors, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/ErrorResponses.html#S3TaggingErrorCodeList">List
  /// of Amazon S3 Tagging error codes</a>.
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID that created the S3 resource that
  /// you're trying to add tags to or the requester's account ID.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the S3 resource that you're trying to
  /// add tags to. The tagged resource can be an S3 Storage Lens group or S3
  /// Access Grants instance, registered location, or grant.
  ///
  /// Parameter [tags] :
  /// The Amazon Web Services resource tags that you want to add to the
  /// specified S3 resource.
  Future<void> tagResource({
    required String accountId,
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    await _protocol.send(
      method: 'POST',
      requestUri:
          '/v20180820/tags/${resourceArn.split('/').map(Uri.encodeComponent).join('/')}',
      headers: headers,
      payload: TagResourceRequest(
              accountId: accountId, resourceArn: resourceArn, tags: tags)
          .toXml(
        'TagResourceRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'),
              'http://awss3control.amazonaws.com/doc/2018-08-20/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This operation removes the specified Amazon Web Services resource tags
  /// from an S3 resource. Each tag is a label consisting of a user-defined key
  /// and value. Tags can help you manage, identify, organize, search for, and
  /// filter resources.
  /// <note>
  /// This operation is only supported for <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage-lens-groups.html">S3
  /// Storage Lens groups</a> and for <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/access-grants-tagging.html">S3
  /// Access Grants</a>. The tagged resource can be an S3 Storage Lens group or
  /// S3 Access Grants instance, registered location, or grant.
  /// </note> <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3:UntagResource</code> permission to use this
  /// operation.
  /// </dd> </dl>
  /// For more information about the required Storage Lens Groups permissions,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage_lens_iam_permissions.html#storage_lens_groups_permissions">Setting
  /// account permissions to use S3 Storage Lens groups</a>.
  ///
  /// For information about S3 Tagging errors, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/ErrorResponses.html#S3TaggingErrorCodeList">List
  /// of Amazon S3 Tagging error codes</a>.
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID that owns the resource that you're
  /// trying to remove the tags from.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the S3 resource that you're trying to
  /// remove the tags from.
  ///
  /// Parameter [tagKeys] :
  /// The array of tag key-value pairs that you're trying to remove from of the
  /// S3 resource.
  Future<void> untagResource({
    required String accountId,
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    await _protocol.send(
      method: 'DELETE',
      requestUri:
          '/v20180820/tags/${resourceArn.split('/').map(Uri.encodeComponent).join('/')}',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the IAM role of a registered location in your S3 Access Grants
  /// instance.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3:UpdateAccessGrantsLocation</code> permission to
  /// use this operation.
  /// </dd> <dt>Additional Permissions</dt> <dd>
  /// You must also have the following permission: <code>iam:PassRole</code>
  /// </dd> </dl>
  ///
  /// Parameter [accessGrantsLocationId] :
  /// The ID of the registered location that you are updating. S3 Access Grants
  /// assigns this ID when you register the location. S3 Access Grants assigns
  /// the ID <code>default</code> to the default location <code>s3://</code> and
  /// assigns an auto-generated ID to other locations that you register.
  ///
  /// The ID of the registered location to which you are granting access. S3
  /// Access Grants assigned this ID when you registered the location. S3 Access
  /// Grants assigns the ID <code>default</code> to the default location
  /// <code>s3://</code> and assigns an auto-generated ID to other locations
  /// that you register.
  ///
  /// If you are passing the <code>default</code> location, you cannot create an
  /// access grant for the entire default location. You must also specify a
  /// bucket or a bucket and prefix in the <code>Subprefix</code> field.
  ///
  /// Parameter [accountId] :
  /// The ID of the Amazon Web Services account that is making this request.
  ///
  /// Parameter [iAMRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role for the registered
  /// location. S3 Access Grants assumes this role to manage access to the
  /// registered location.
  Future<UpdateAccessGrantsLocationResult> updateAccessGrantsLocation({
    required String accessGrantsLocationId,
    required String accountId,
    required String iAMRoleArn,
  }) async {
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    final $result = await _protocol.send(
      method: 'PUT',
      requestUri:
          '/v20180820/accessgrantsinstance/location/${Uri.encodeComponent(accessGrantsLocationId)}',
      headers: headers,
      payload: UpdateAccessGrantsLocationRequest(
              accessGrantsLocationId: accessGrantsLocationId,
              accountId: accountId,
              iAMRoleArn: iAMRoleArn)
          .toXml(
        'UpdateAccessGrantsLocationRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'),
              'http://awss3control.amazonaws.com/doc/2018-08-20/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAccessGrantsLocationResult.fromXml($result.body);
  }

  /// Updates an existing S3 Batch Operations job's priority. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/batch-ops.html">S3
  /// Batch Operations</a> in the <i>Amazon S3 User Guide</i>.
  /// <dl> <dt>Permissions</dt> <dd>
  /// To use the <code>UpdateJobPriority</code> operation, you must have
  /// permission to perform the <code>s3:UpdateJobPriority</code> action.
  /// </dd> </dl>
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

  /// Updates the status for the specified job. Use this operation to confirm
  /// that you want to run a job or to cancel an existing job. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/batch-ops.html">S3
  /// Batch Operations</a> in the <i>Amazon S3 User Guide</i>.
  /// <dl> <dt>Permissions</dt> <dd>
  /// To use the <code>UpdateJobStatus</code> operation, you must have
  /// permission to perform the <code>s3:UpdateJobStatus</code> action.
  /// </dd> </dl>
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

  /// Updates the existing Storage Lens group.
  ///
  /// To use this operation, you must have the permission to perform the
  /// <code>s3:UpdateStorageLensGroup</code> action. For more information about
  /// the required Storage Lens Groups permissions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage_lens_iam_permissions.html#storage_lens_groups_permissions">Setting
  /// account permissions to use S3 Storage Lens groups</a>.
  ///
  /// For information about Storage Lens groups errors, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/ErrorResponses.html#S3LensErrorCodeList">List
  /// of Amazon S3 Storage Lens error codes</a>.
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID of the Storage Lens group owner.
  ///
  /// Parameter [name] :
  /// The name of the Storage Lens group that you want to update.
  ///
  /// Parameter [storageLensGroup] :
  /// The JSON file that contains the Storage Lens group configuration.
  Future<void> updateStorageLensGroup({
    required String accountId,
    required String name,
    required StorageLensGroup storageLensGroup,
  }) async {
    final headers = <String, String>{
      'x-amz-account-id': accountId.toString(),
    };
    await _protocol.send(
      method: 'PUT',
      requestUri: '/v20180820/storagelensgroup/${Uri.encodeComponent(name)}',
      headers: headers,
      payload: UpdateStorageLensGroupRequest(
              accountId: accountId,
              name: name,
              storageLensGroup: storageLensGroup)
          .toXml(
        'UpdateStorageLensGroupRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'),
              'http://awss3control.amazonaws.com/doc/2018-08-20/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
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

/// The configuration options of the S3 Access Grants location. It contains the
/// <code>S3SubPrefix</code> field. The grant scope, the data to which you are
/// granting access, is the result of appending the <code>Subprefix</code> field
/// to the scope of the registered location.
class AccessGrantsLocationConfiguration {
  /// The <code>S3SubPrefix</code> is appended to the location scope creating the
  /// grant scope. Use this field to narrow the scope of the grant to a subset of
  /// the location scope. This field is required if the location scope is the
  /// default location <code>s3://</code> because you cannot create a grant for
  /// all of your S3 data in the Region and must narrow the scope. For example, if
  /// the location scope is the default location <code>s3://</code>, the
  /// <code>S3SubPrefx</code> can be a &lt;bucket-name&gt;/*, so the full grant
  /// scope path would be <code>s3://&lt;bucket-name&gt;/*</code>. Or the
  /// <code>S3SubPrefx</code> can be
  /// <code>&lt;bucket-name&gt;/&lt;prefix-name&gt;*</code>, so the full grant
  /// scope path would be or
  /// <code>s3://&lt;bucket-name&gt;/&lt;prefix-name&gt;*</code>.
  ///
  /// If the <code>S3SubPrefix</code> includes a prefix, append the wildcard
  /// character <code>*</code> after the prefix to indicate that you want to
  /// include all object key names in the bucket that start with that prefix.
  final String? s3SubPrefix;

  AccessGrantsLocationConfiguration({
    this.s3SubPrefix,
  });
  factory AccessGrantsLocationConfiguration.fromXml(_s.XmlElement elem) {
    return AccessGrantsLocationConfiguration(
      s3SubPrefix: _s.extractXmlStringValue(elem, 'S3SubPrefix'),
    );
  }

  Map<String, dynamic> toJson() {
    final s3SubPrefix = this.s3SubPrefix;
    return {
      if (s3SubPrefix != null) 'S3SubPrefix': s3SubPrefix,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final s3SubPrefix = this.s3SubPrefix;
    final $children = <_s.XmlNode>[
      if (s3SubPrefix != null)
        _s.encodeXmlStringValue('S3SubPrefix', s3SubPrefix),
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
          ?.let(VpcConfiguration.fromXml),
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

/// A container element for the account-level Amazon S3 Storage Lens
/// configuration.
///
/// For more information about S3 Storage Lens, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage_lens.html">Assessing
/// your storage activity and usage with S3 Storage Lens</a> in the <i>Amazon S3
/// User Guide</i>. For a complete list of S3 Storage Lens metrics, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage_lens_metrics_glossary.html">S3
/// Storage Lens metrics glossary</a> in the <i>Amazon S3 User Guide</i>.
class AccountLevel {
  /// A container element for the S3 Storage Lens bucket-level configuration.
  final BucketLevel bucketLevel;

  /// A container element for S3 Storage Lens activity metrics.
  final ActivityMetrics? activityMetrics;

  /// A container element for S3 Storage Lens advanced cost-optimization metrics.
  final AdvancedCostOptimizationMetrics? advancedCostOptimizationMetrics;

  /// A container element for S3 Storage Lens advanced data-protection metrics.
  final AdvancedDataProtectionMetrics? advancedDataProtectionMetrics;

  /// A container element for detailed status code metrics.
  final DetailedStatusCodesMetrics? detailedStatusCodesMetrics;

  /// A container element for S3 Storage Lens groups metrics.
  final StorageLensGroupLevel? storageLensGroupLevel;

  AccountLevel({
    required this.bucketLevel,
    this.activityMetrics,
    this.advancedCostOptimizationMetrics,
    this.advancedDataProtectionMetrics,
    this.detailedStatusCodesMetrics,
    this.storageLensGroupLevel,
  });
  factory AccountLevel.fromXml(_s.XmlElement elem) {
    return AccountLevel(
      bucketLevel:
          BucketLevel.fromXml(_s.extractXmlChild(elem, 'BucketLevel')!),
      activityMetrics: _s
          .extractXmlChild(elem, 'ActivityMetrics')
          ?.let(ActivityMetrics.fromXml),
      advancedCostOptimizationMetrics: _s
          .extractXmlChild(elem, 'AdvancedCostOptimizationMetrics')
          ?.let(AdvancedCostOptimizationMetrics.fromXml),
      advancedDataProtectionMetrics: _s
          .extractXmlChild(elem, 'AdvancedDataProtectionMetrics')
          ?.let(AdvancedDataProtectionMetrics.fromXml),
      detailedStatusCodesMetrics: _s
          .extractXmlChild(elem, 'DetailedStatusCodesMetrics')
          ?.let(DetailedStatusCodesMetrics.fromXml),
      storageLensGroupLevel: _s
          .extractXmlChild(elem, 'StorageLensGroupLevel')
          ?.let(StorageLensGroupLevel.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final bucketLevel = this.bucketLevel;
    final activityMetrics = this.activityMetrics;
    final advancedCostOptimizationMetrics =
        this.advancedCostOptimizationMetrics;
    final advancedDataProtectionMetrics = this.advancedDataProtectionMetrics;
    final detailedStatusCodesMetrics = this.detailedStatusCodesMetrics;
    final storageLensGroupLevel = this.storageLensGroupLevel;
    return {
      'BucketLevel': bucketLevel,
      if (activityMetrics != null) 'ActivityMetrics': activityMetrics,
      if (advancedCostOptimizationMetrics != null)
        'AdvancedCostOptimizationMetrics': advancedCostOptimizationMetrics,
      if (advancedDataProtectionMetrics != null)
        'AdvancedDataProtectionMetrics': advancedDataProtectionMetrics,
      if (detailedStatusCodesMetrics != null)
        'DetailedStatusCodesMetrics': detailedStatusCodesMetrics,
      if (storageLensGroupLevel != null)
        'StorageLensGroupLevel': storageLensGroupLevel,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final bucketLevel = this.bucketLevel;
    final activityMetrics = this.activityMetrics;
    final advancedCostOptimizationMetrics =
        this.advancedCostOptimizationMetrics;
    final advancedDataProtectionMetrics = this.advancedDataProtectionMetrics;
    final detailedStatusCodesMetrics = this.detailedStatusCodesMetrics;
    final storageLensGroupLevel = this.storageLensGroupLevel;
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
      if (storageLensGroupLevel != null)
        storageLensGroupLevel.toXml('StorageLensGroupLevel'),
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

class AssociateAccessGrantsIdentityCenterRequest {
  /// The ID of the Amazon Web Services account that is making this request.
  final String accountId;

  /// The Amazon Resource Name (ARN) of the Amazon Web Services IAM Identity
  /// Center instance that you are associating with your S3 Access Grants
  /// instance. An IAM Identity Center instance is your corporate identity
  /// directory that you added to the IAM Identity Center. You can use the <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/APIReference/API_ListInstances.html">ListInstances</a>
  /// API operation to retrieve a list of your Identity Center instances and their
  /// ARNs.
  final String identityCenterArn;

  AssociateAccessGrantsIdentityCenterRequest({
    required this.accountId,
    required this.identityCenterArn,
  });

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final identityCenterArn = this.identityCenterArn;
    return {
      'IdentityCenterArn': identityCenterArn,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final accountId = this.accountId;
    final identityCenterArn = this.identityCenterArn;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('IdentityCenterArn', identityCenterArn),
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
          ?.let(AsyncRequestParameters.fromXml),
      requestStatus: _s.extractXmlStringValue(elem, 'RequestStatus'),
      requestTokenARN: _s.extractXmlStringValue(elem, 'RequestTokenARN'),
      responseDetails: _s
          .extractXmlChild(elem, 'ResponseDetails')
          ?.let(AsyncResponseDetails.fromXml),
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
          ?.let(CreateMultiRegionAccessPointInput.fromXml),
      deleteMultiRegionAccessPointRequest: _s
          .extractXmlChild(elem, 'DeleteMultiRegionAccessPointRequest')
          ?.let(DeleteMultiRegionAccessPointInput.fromXml),
      putMultiRegionAccessPointPolicyRequest: _s
          .extractXmlChild(elem, 'PutMultiRegionAccessPointPolicyRequest')
          ?.let(PutMultiRegionAccessPointPolicyInput.fromXml),
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
          ?.let(AsyncErrorDetails.fromXml),
      multiRegionAccessPointDetails: _s
          .extractXmlChild(elem, 'MultiRegionAccessPointDetails')
          ?.let(MultiRegionAccessPointsAsyncResponse.fromXml),
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
          ?.let(ActivityMetrics.fromXml),
      advancedCostOptimizationMetrics: _s
          .extractXmlChild(elem, 'AdvancedCostOptimizationMetrics')
          ?.let(AdvancedCostOptimizationMetrics.fromXml),
      advancedDataProtectionMetrics: _s
          .extractXmlChild(elem, 'AdvancedDataProtectionMetrics')
          ?.let(AdvancedDataProtectionMetrics.fromXml),
      detailedStatusCodesMetrics: _s
          .extractXmlChild(elem, 'DetailedStatusCodesMetrics')
          ?.let(DetailedStatusCodesMetrics.fromXml),
      prefixLevel:
          _s.extractXmlChild(elem, 'PrefixLevel')?.let(PrefixLevel.fromXml),
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

class CreateAccessGrantRequest {
  /// The ID of the registered location to which you are granting access. S3
  /// Access Grants assigns this ID when you register the location. S3 Access
  /// Grants assigns the ID <code>default</code> to the default location
  /// <code>s3://</code> and assigns an auto-generated ID to other locations that
  /// you register.
  ///
  /// If you are passing the <code>default</code> location, you cannot create an
  /// access grant for the entire default location. You must also specify a bucket
  /// or a bucket and prefix in the <code>Subprefix</code> field.
  final String accessGrantsLocationId;

  /// The ID of the Amazon Web Services account that is making this request.
  final String accountId;

  /// The user, group, or role to which you are granting access. You can grant
  /// access to an IAM user or role. If you have added your corporate directory to
  /// Amazon Web Services IAM Identity Center and associated your Identity Center
  /// instance with your S3 Access Grants instance, the grantee can also be a
  /// corporate directory user or group.
  final Grantee grantee;

  /// The type of access that you are granting to your S3 data, which can be set
  /// to one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>READ</code> – Grant read-only access to the S3 data.
  /// </li>
  /// <li>
  /// <code>WRITE</code> – Grant write-only access to the S3 data.
  /// </li>
  /// <li>
  /// <code>READWRITE</code> – Grant both read and write access to the S3 data.
  /// </li>
  /// </ul>
  final Permission permission;

  /// The configuration options of the grant location. The grant location is the
  /// S3 path to the data to which you are granting access. It contains the
  /// <code>S3SubPrefix</code> field. The grant scope is the result of appending
  /// the subprefix to the location scope of the registered location.
  final AccessGrantsLocationConfiguration? accessGrantsLocationConfiguration;

  /// The Amazon Resource Name (ARN) of an Amazon Web Services IAM Identity Center
  /// application associated with your Identity Center instance. If an application
  /// ARN is included in the request to create an access grant, the grantee can
  /// only access the S3 data through this application.
  final String? applicationArn;

  /// The type of <code>S3SubPrefix</code>. The only possible value is
  /// <code>Object</code>. Pass this value if the access grant scope is an object.
  /// Do not pass this value if the access grant scope is a bucket or a bucket and
  /// a prefix.
  final S3PrefixType? s3PrefixType;

  /// The Amazon Web Services resource tags that you are adding to the access
  /// grant. Each tag is a label consisting of a user-defined key and value. Tags
  /// can help you manage, identify, organize, search for, and filter resources.
  final List<Tag>? tags;

  CreateAccessGrantRequest({
    required this.accessGrantsLocationId,
    required this.accountId,
    required this.grantee,
    required this.permission,
    this.accessGrantsLocationConfiguration,
    this.applicationArn,
    this.s3PrefixType,
    this.tags,
  });

  Map<String, dynamic> toJson() {
    final accessGrantsLocationId = this.accessGrantsLocationId;
    final accountId = this.accountId;
    final grantee = this.grantee;
    final permission = this.permission;
    final accessGrantsLocationConfiguration =
        this.accessGrantsLocationConfiguration;
    final applicationArn = this.applicationArn;
    final s3PrefixType = this.s3PrefixType;
    final tags = this.tags;
    return {
      'AccessGrantsLocationId': accessGrantsLocationId,
      'Grantee': grantee,
      'Permission': permission.toValue(),
      if (accessGrantsLocationConfiguration != null)
        'AccessGrantsLocationConfiguration': accessGrantsLocationConfiguration,
      if (applicationArn != null) 'ApplicationArn': applicationArn,
      if (s3PrefixType != null) 'S3PrefixType': s3PrefixType.toValue(),
      if (tags != null) 'Tags': tags,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final accessGrantsLocationId = this.accessGrantsLocationId;
    final accountId = this.accountId;
    final grantee = this.grantee;
    final permission = this.permission;
    final accessGrantsLocationConfiguration =
        this.accessGrantsLocationConfiguration;
    final applicationArn = this.applicationArn;
    final s3PrefixType = this.s3PrefixType;
    final tags = this.tags;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('AccessGrantsLocationId', accessGrantsLocationId),
      if (accessGrantsLocationConfiguration != null)
        accessGrantsLocationConfiguration
            .toXml('AccessGrantsLocationConfiguration'),
      grantee.toXml('Grantee'),
      _s.encodeXmlStringValue('Permission', permission.toValue()),
      if (applicationArn != null)
        _s.encodeXmlStringValue('ApplicationArn', applicationArn),
      if (s3PrefixType != null)
        _s.encodeXmlStringValue('S3PrefixType', s3PrefixType.toValue()),
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

class CreateAccessGrantResult {
  /// The Amazon Resource Name (ARN) of the access grant.
  final String? accessGrantArn;

  /// The ID of the access grant. S3 Access Grants auto-generates this ID when you
  /// create the access grant.
  final String? accessGrantId;

  /// The configuration options of the grant location. The grant location is the
  /// S3 path to the data to which you are granting access.
  final AccessGrantsLocationConfiguration? accessGrantsLocationConfiguration;

  /// The ID of the registered location to which you are granting access. S3
  /// Access Grants assigns this ID when you register the location. S3 Access
  /// Grants assigns the ID <code>default</code> to the default location
  /// <code>s3://</code> and assigns an auto-generated ID to other locations that
  /// you register.
  final String? accessGrantsLocationId;

  /// The Amazon Resource Name (ARN) of an Amazon Web Services IAM Identity Center
  /// application associated with your Identity Center instance. If the grant
  /// includes an application ARN, the grantee can only access the S3 data through
  /// this application.
  final String? applicationArn;

  /// The date and time when you created the access grant.
  final DateTime? createdAt;

  /// The S3 path of the data to which you are granting access. It is the result
  /// of appending the <code>Subprefix</code> to the location scope.
  final String? grantScope;

  /// The user, group, or role to which you are granting access. You can grant
  /// access to an IAM user or role. If you have added your corporate directory to
  /// Amazon Web Services IAM Identity Center and associated your Identity Center
  /// instance with your S3 Access Grants instance, the grantee can also be a
  /// corporate directory user or group.
  final Grantee? grantee;

  /// The type of access that you are granting to your S3 data, which can be set
  /// to one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>READ</code> – Grant read-only access to the S3 data.
  /// </li>
  /// <li>
  /// <code>WRITE</code> – Grant write-only access to the S3 data.
  /// </li>
  /// <li>
  /// <code>READWRITE</code> – Grant both read and write access to the S3 data.
  /// </li>
  /// </ul>
  final Permission? permission;

  CreateAccessGrantResult({
    this.accessGrantArn,
    this.accessGrantId,
    this.accessGrantsLocationConfiguration,
    this.accessGrantsLocationId,
    this.applicationArn,
    this.createdAt,
    this.grantScope,
    this.grantee,
    this.permission,
  });
  factory CreateAccessGrantResult.fromXml(_s.XmlElement elem) {
    return CreateAccessGrantResult(
      accessGrantArn: _s.extractXmlStringValue(elem, 'AccessGrantArn'),
      accessGrantId: _s.extractXmlStringValue(elem, 'AccessGrantId'),
      accessGrantsLocationConfiguration: _s
          .extractXmlChild(elem, 'AccessGrantsLocationConfiguration')
          ?.let(AccessGrantsLocationConfiguration.fromXml),
      accessGrantsLocationId:
          _s.extractXmlStringValue(elem, 'AccessGrantsLocationId'),
      applicationArn: _s.extractXmlStringValue(elem, 'ApplicationArn'),
      createdAt: _s.extractXmlDateTimeValue(elem, 'CreatedAt'),
      grantScope: _s.extractXmlStringValue(elem, 'GrantScope'),
      grantee: _s.extractXmlChild(elem, 'Grantee')?.let(Grantee.fromXml),
      permission: _s.extractXmlStringValue(elem, 'Permission')?.toPermission(),
    );
  }

  Map<String, dynamic> toJson() {
    final accessGrantArn = this.accessGrantArn;
    final accessGrantId = this.accessGrantId;
    final accessGrantsLocationConfiguration =
        this.accessGrantsLocationConfiguration;
    final accessGrantsLocationId = this.accessGrantsLocationId;
    final applicationArn = this.applicationArn;
    final createdAt = this.createdAt;
    final grantScope = this.grantScope;
    final grantee = this.grantee;
    final permission = this.permission;
    return {
      if (accessGrantArn != null) 'AccessGrantArn': accessGrantArn,
      if (accessGrantId != null) 'AccessGrantId': accessGrantId,
      if (accessGrantsLocationConfiguration != null)
        'AccessGrantsLocationConfiguration': accessGrantsLocationConfiguration,
      if (accessGrantsLocationId != null)
        'AccessGrantsLocationId': accessGrantsLocationId,
      if (applicationArn != null) 'ApplicationArn': applicationArn,
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (grantScope != null) 'GrantScope': grantScope,
      if (grantee != null) 'Grantee': grantee,
      if (permission != null) 'Permission': permission.toValue(),
    };
  }
}

class CreateAccessGrantsInstanceRequest {
  /// The ID of the Amazon Web Services account that is making this request.
  final String accountId;

  /// If you would like to associate your S3 Access Grants instance with an Amazon
  /// Web Services IAM Identity Center instance, use this field to pass the Amazon
  /// Resource Name (ARN) of the Amazon Web Services IAM Identity Center instance
  /// that you are associating with your S3 Access Grants instance. An IAM
  /// Identity Center instance is your corporate identity directory that you added
  /// to the IAM Identity Center. You can use the <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/APIReference/API_ListInstances.html">ListInstances</a>
  /// API operation to retrieve a list of your Identity Center instances and their
  /// ARNs.
  final String? identityCenterArn;

  /// The Amazon Web Services resource tags that you are adding to the S3 Access
  /// Grants instance. Each tag is a label consisting of a user-defined key and
  /// value. Tags can help you manage, identify, organize, search for, and filter
  /// resources.
  final List<Tag>? tags;

  CreateAccessGrantsInstanceRequest({
    required this.accountId,
    this.identityCenterArn,
    this.tags,
  });

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final identityCenterArn = this.identityCenterArn;
    final tags = this.tags;
    return {
      if (identityCenterArn != null) 'IdentityCenterArn': identityCenterArn,
      if (tags != null) 'Tags': tags,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final accountId = this.accountId;
    final identityCenterArn = this.identityCenterArn;
    final tags = this.tags;
    final $children = <_s.XmlNode>[
      if (identityCenterArn != null)
        _s.encodeXmlStringValue('IdentityCenterArn', identityCenterArn),
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

class CreateAccessGrantsInstanceResult {
  /// The Amazon Resource Name (ARN) of the S3 Access Grants instance.
  final String? accessGrantsInstanceArn;

  /// The ID of the S3 Access Grants instance. The ID is <code>default</code>. You
  /// can have one S3 Access Grants instance per Region per account.
  final String? accessGrantsInstanceId;

  /// The date and time when you created the S3 Access Grants instance.
  final DateTime? createdAt;

  /// If you associated your S3 Access Grants instance with an Amazon Web Services
  /// IAM Identity Center instance, this field returns the Amazon Resource Name
  /// (ARN) of the IAM Identity Center instance application; a subresource of the
  /// original Identity Center instance passed in the request. S3 Access Grants
  /// creates this Identity Center application for this specific S3 Access Grants
  /// instance.
  final String? identityCenterArn;

  CreateAccessGrantsInstanceResult({
    this.accessGrantsInstanceArn,
    this.accessGrantsInstanceId,
    this.createdAt,
    this.identityCenterArn,
  });
  factory CreateAccessGrantsInstanceResult.fromXml(_s.XmlElement elem) {
    return CreateAccessGrantsInstanceResult(
      accessGrantsInstanceArn:
          _s.extractXmlStringValue(elem, 'AccessGrantsInstanceArn'),
      accessGrantsInstanceId:
          _s.extractXmlStringValue(elem, 'AccessGrantsInstanceId'),
      createdAt: _s.extractXmlDateTimeValue(elem, 'CreatedAt'),
      identityCenterArn: _s.extractXmlStringValue(elem, 'IdentityCenterArn'),
    );
  }

  Map<String, dynamic> toJson() {
    final accessGrantsInstanceArn = this.accessGrantsInstanceArn;
    final accessGrantsInstanceId = this.accessGrantsInstanceId;
    final createdAt = this.createdAt;
    final identityCenterArn = this.identityCenterArn;
    return {
      if (accessGrantsInstanceArn != null)
        'AccessGrantsInstanceArn': accessGrantsInstanceArn,
      if (accessGrantsInstanceId != null)
        'AccessGrantsInstanceId': accessGrantsInstanceId,
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (identityCenterArn != null) 'IdentityCenterArn': identityCenterArn,
    };
  }
}

class CreateAccessGrantsLocationRequest {
  /// The ID of the Amazon Web Services account that is making this request.
  final String accountId;

  /// The Amazon Resource Name (ARN) of the IAM role for the registered location.
  /// S3 Access Grants assumes this role to manage access to the registered
  /// location.
  final String iAMRoleArn;

  /// The S3 path to the location that you are registering. The location scope can
  /// be the default S3 location <code>s3://</code>, the S3 path to a bucket
  /// <code>s3://&lt;bucket&gt;</code>, or the S3 path to a bucket and prefix
  /// <code>s3://&lt;bucket&gt;/&lt;prefix&gt;</code>. A prefix in S3 is a string
  /// of characters at the beginning of an object key name used to organize the
  /// objects that you store in your S3 buckets. For example, object key names
  /// that start with the <code>engineering/</code> prefix or object key names
  /// that start with the <code>marketing/campaigns/</code> prefix.
  final String locationScope;

  /// The Amazon Web Services resource tags that you are adding to the S3 Access
  /// Grants location. Each tag is a label consisting of a user-defined key and
  /// value. Tags can help you manage, identify, organize, search for, and filter
  /// resources.
  final List<Tag>? tags;

  CreateAccessGrantsLocationRequest({
    required this.accountId,
    required this.iAMRoleArn,
    required this.locationScope,
    this.tags,
  });

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final iAMRoleArn = this.iAMRoleArn;
    final locationScope = this.locationScope;
    final tags = this.tags;
    return {
      'IAMRoleArn': iAMRoleArn,
      'LocationScope': locationScope,
      if (tags != null) 'Tags': tags,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final accountId = this.accountId;
    final iAMRoleArn = this.iAMRoleArn;
    final locationScope = this.locationScope;
    final tags = this.tags;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('LocationScope', locationScope),
      _s.encodeXmlStringValue('IAMRoleArn', iAMRoleArn),
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

class CreateAccessGrantsLocationResult {
  /// The Amazon Resource Name (ARN) of the location you are registering.
  final String? accessGrantsLocationArn;

  /// The ID of the registered location to which you are granting access. S3
  /// Access Grants assigns this ID when you register the location. S3 Access
  /// Grants assigns the ID <code>default</code> to the default location
  /// <code>s3://</code> and assigns an auto-generated ID to other locations that
  /// you register.
  final String? accessGrantsLocationId;

  /// The date and time when you registered the location.
  final DateTime? createdAt;

  /// The Amazon Resource Name (ARN) of the IAM role for the registered location.
  /// S3 Access Grants assumes this role to manage access to the registered
  /// location.
  final String? iAMRoleArn;

  /// The S3 URI path to the location that you are registering. The location scope
  /// can be the default S3 location <code>s3://</code>, the S3 path to a bucket,
  /// or the S3 path to a bucket and prefix. A prefix in S3 is a string of
  /// characters at the beginning of an object key name used to organize the
  /// objects that you store in your S3 buckets. For example, object key names
  /// that start with the <code>engineering/</code> prefix or object key names
  /// that start with the <code>marketing/campaigns/</code> prefix.
  final String? locationScope;

  CreateAccessGrantsLocationResult({
    this.accessGrantsLocationArn,
    this.accessGrantsLocationId,
    this.createdAt,
    this.iAMRoleArn,
    this.locationScope,
  });
  factory CreateAccessGrantsLocationResult.fromXml(_s.XmlElement elem) {
    return CreateAccessGrantsLocationResult(
      accessGrantsLocationArn:
          _s.extractXmlStringValue(elem, 'AccessGrantsLocationArn'),
      accessGrantsLocationId:
          _s.extractXmlStringValue(elem, 'AccessGrantsLocationId'),
      createdAt: _s.extractXmlDateTimeValue(elem, 'CreatedAt'),
      iAMRoleArn: _s.extractXmlStringValue(elem, 'IAMRoleArn'),
      locationScope: _s.extractXmlStringValue(elem, 'LocationScope'),
    );
  }

  Map<String, dynamic> toJson() {
    final accessGrantsLocationArn = this.accessGrantsLocationArn;
    final accessGrantsLocationId = this.accessGrantsLocationId;
    final createdAt = this.createdAt;
    final iAMRoleArn = this.iAMRoleArn;
    final locationScope = this.locationScope;
    return {
      if (accessGrantsLocationArn != null)
        'AccessGrantsLocationArn': accessGrantsLocationArn,
      if (accessGrantsLocationId != null)
        'AccessGrantsLocationId': accessGrantsLocationId,
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (iAMRoleArn != null) 'IAMRoleArn': iAMRoleArn,
      if (locationScope != null) 'LocationScope': locationScope,
    };
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
          ?.let(ObjectLambdaAccessPointAlias.fromXml),
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
  ///
  /// For same account access point when your bucket and access point belong to
  /// the same account owner, the <code>BucketAccountId</code> is not required.
  /// For cross-account access point when your bucket and access point are not in
  /// the same account, the <code>BucketAccountId</code> is required.
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
          .map(Region.fromXml)
          .toList(),
      publicAccessBlock: _s
          .extractXmlChild(elem, 'PublicAccessBlock')
          ?.let(PublicAccessBlockConfiguration.fromXml),
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

class CreateStorageLensGroupRequest {
  /// The Amazon Web Services account ID that the Storage Lens group is created
  /// from and associated with.
  final String accountId;

  /// The Storage Lens group configuration.
  final StorageLensGroup storageLensGroup;

  /// The Amazon Web Services resource tags that you're adding to your Storage
  /// Lens group. This parameter is optional.
  final List<Tag>? tags;

  CreateStorageLensGroupRequest({
    required this.accountId,
    required this.storageLensGroup,
    this.tags,
  });

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final storageLensGroup = this.storageLensGroup;
    final tags = this.tags;
    return {
      'StorageLensGroup': storageLensGroup,
      if (tags != null) 'Tags': tags,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final accountId = this.accountId;
    final storageLensGroup = this.storageLensGroup;
    final tags = this.tags;
    final $children = <_s.XmlNode>[
      storageLensGroup.toXml('StorageLensGroup'),
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

/// The Amazon Web Services Security Token Service temporary credential that S3
/// Access Grants vends to grantees and client applications.
class Credentials {
  /// The unique access key ID of the Amazon Web Services STS temporary credential
  /// that S3 Access Grants vends to grantees and client applications.
  final String? accessKeyId;

  /// The expiration date and time of the temporary credential that S3 Access
  /// Grants vends to grantees and client applications.
  final DateTime? expiration;

  /// The secret access key of the Amazon Web Services STS temporary credential
  /// that S3 Access Grants vends to grantees and client applications.
  final String? secretAccessKey;

  /// The Amazon Web Services STS temporary credential that S3 Access Grants vends
  /// to grantees and client applications.
  final String? sessionToken;

  Credentials({
    this.accessKeyId,
    this.expiration,
    this.secretAccessKey,
    this.sessionToken,
  });
  factory Credentials.fromXml(_s.XmlElement elem) {
    return Credentials(
      accessKeyId: _s.extractXmlStringValue(elem, 'AccessKeyId'),
      expiration: _s.extractXmlDateTimeValue(elem, 'Expiration'),
      secretAccessKey: _s.extractXmlStringValue(elem, 'SecretAccessKey'),
      sessionToken: _s.extractXmlStringValue(elem, 'SessionToken'),
    );
  }

  Map<String, dynamic> toJson() {
    final accessKeyId = this.accessKeyId;
    final expiration = this.expiration;
    final secretAccessKey = this.secretAccessKey;
    final sessionToken = this.sessionToken;
    return {
      if (accessKeyId != null) 'AccessKeyId': accessKeyId,
      if (expiration != null) 'Expiration': iso8601ToJson(expiration),
      if (secretAccessKey != null) 'SecretAccessKey': secretAccessKey,
      if (sessionToken != null) 'SessionToken': sessionToken,
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
      job: _s.extractXmlChild(elem, 'Job')?.let(JobDescriptor.fromXml),
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
          ?.let(AsyncOperation.fromXml),
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
  /// Values other than <code>OUTPOSTS</code> aren't supported by Amazon S3 on
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
          ?.let(AccessControlTranslation.fromXml),
      account: _s.extractXmlStringValue(elem, 'Account'),
      encryptionConfiguration: _s
          .extractXmlChild(elem, 'EncryptionConfiguration')
          ?.let(EncryptionConfiguration.fromXml),
      metrics: _s.extractXmlChild(elem, 'Metrics')?.let(Metrics.fromXml),
      replicationTime: _s
          .extractXmlChild(elem, 'ReplicationTime')
          ?.let(ReplicationTime.fromXml),
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
      ssekms:
          _s.extractXmlChild(elem, 'SSE-KMS')?.let(SSEKMSEncryption.fromXml),
      sses3: _s.extractXmlChild(elem, 'SSE-S3')?.let(SSES3Encryption.fromXml),
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

class GetAccessGrantResult {
  /// The Amazon Resource Name (ARN) of the access grant.
  final String? accessGrantArn;

  /// The ID of the access grant. S3 Access Grants auto-generates this ID when you
  /// create the access grant.
  final String? accessGrantId;

  /// The configuration options of the grant location. The grant location is the
  /// S3 path to the data to which you are granting access.
  final AccessGrantsLocationConfiguration? accessGrantsLocationConfiguration;

  /// The ID of the registered location to which you are granting access. S3
  /// Access Grants assigns this ID when you register the location. S3 Access
  /// Grants assigns the ID <code>default</code> to the default location
  /// <code>s3://</code> and assigns an auto-generated ID to other locations that
  /// you register.
  final String? accessGrantsLocationId;

  /// The Amazon Resource Name (ARN) of an Amazon Web Services IAM Identity Center
  /// application associated with your Identity Center instance. If the grant
  /// includes an application ARN, the grantee can only access the S3 data through
  /// this application.
  final String? applicationArn;

  /// The date and time when you created the access grant.
  final DateTime? createdAt;

  /// The S3 path of the data to which you are granting access. It is the result
  /// of appending the <code>Subprefix</code> to the location scope.
  final String? grantScope;

  /// The user, group, or role to which you are granting access. You can grant
  /// access to an IAM user or role. If you have added a corporate directory to
  /// Amazon Web Services IAM Identity Center and associated this Identity Center
  /// instance with the S3 Access Grants instance, the grantee can also be a
  /// corporate directory user or group.
  final Grantee? grantee;

  /// The type of permission that was granted in the access grant. Can be one of
  /// the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>READ</code> – Grant read-only access to the S3 data.
  /// </li>
  /// <li>
  /// <code>WRITE</code> – Grant write-only access to the S3 data.
  /// </li>
  /// <li>
  /// <code>READWRITE</code> – Grant both read and write access to the S3 data.
  /// </li>
  /// </ul>
  final Permission? permission;

  GetAccessGrantResult({
    this.accessGrantArn,
    this.accessGrantId,
    this.accessGrantsLocationConfiguration,
    this.accessGrantsLocationId,
    this.applicationArn,
    this.createdAt,
    this.grantScope,
    this.grantee,
    this.permission,
  });
  factory GetAccessGrantResult.fromXml(_s.XmlElement elem) {
    return GetAccessGrantResult(
      accessGrantArn: _s.extractXmlStringValue(elem, 'AccessGrantArn'),
      accessGrantId: _s.extractXmlStringValue(elem, 'AccessGrantId'),
      accessGrantsLocationConfiguration: _s
          .extractXmlChild(elem, 'AccessGrantsLocationConfiguration')
          ?.let(AccessGrantsLocationConfiguration.fromXml),
      accessGrantsLocationId:
          _s.extractXmlStringValue(elem, 'AccessGrantsLocationId'),
      applicationArn: _s.extractXmlStringValue(elem, 'ApplicationArn'),
      createdAt: _s.extractXmlDateTimeValue(elem, 'CreatedAt'),
      grantScope: _s.extractXmlStringValue(elem, 'GrantScope'),
      grantee: _s.extractXmlChild(elem, 'Grantee')?.let(Grantee.fromXml),
      permission: _s.extractXmlStringValue(elem, 'Permission')?.toPermission(),
    );
  }

  Map<String, dynamic> toJson() {
    final accessGrantArn = this.accessGrantArn;
    final accessGrantId = this.accessGrantId;
    final accessGrantsLocationConfiguration =
        this.accessGrantsLocationConfiguration;
    final accessGrantsLocationId = this.accessGrantsLocationId;
    final applicationArn = this.applicationArn;
    final createdAt = this.createdAt;
    final grantScope = this.grantScope;
    final grantee = this.grantee;
    final permission = this.permission;
    return {
      if (accessGrantArn != null) 'AccessGrantArn': accessGrantArn,
      if (accessGrantId != null) 'AccessGrantId': accessGrantId,
      if (accessGrantsLocationConfiguration != null)
        'AccessGrantsLocationConfiguration': accessGrantsLocationConfiguration,
      if (accessGrantsLocationId != null)
        'AccessGrantsLocationId': accessGrantsLocationId,
      if (applicationArn != null) 'ApplicationArn': applicationArn,
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (grantScope != null) 'GrantScope': grantScope,
      if (grantee != null) 'Grantee': grantee,
      if (permission != null) 'Permission': permission.toValue(),
    };
  }
}

class GetAccessGrantsInstanceForPrefixResult {
  /// The Amazon Resource Name (ARN) of the S3 Access Grants instance.
  final String? accessGrantsInstanceArn;

  /// The ID of the S3 Access Grants instance. The ID is <code>default</code>. You
  /// can have one S3 Access Grants instance per Region per account.
  final String? accessGrantsInstanceId;

  GetAccessGrantsInstanceForPrefixResult({
    this.accessGrantsInstanceArn,
    this.accessGrantsInstanceId,
  });
  factory GetAccessGrantsInstanceForPrefixResult.fromXml(_s.XmlElement elem) {
    return GetAccessGrantsInstanceForPrefixResult(
      accessGrantsInstanceArn:
          _s.extractXmlStringValue(elem, 'AccessGrantsInstanceArn'),
      accessGrantsInstanceId:
          _s.extractXmlStringValue(elem, 'AccessGrantsInstanceId'),
    );
  }

  Map<String, dynamic> toJson() {
    final accessGrantsInstanceArn = this.accessGrantsInstanceArn;
    final accessGrantsInstanceId = this.accessGrantsInstanceId;
    return {
      if (accessGrantsInstanceArn != null)
        'AccessGrantsInstanceArn': accessGrantsInstanceArn,
      if (accessGrantsInstanceId != null)
        'AccessGrantsInstanceId': accessGrantsInstanceId,
    };
  }
}

class GetAccessGrantsInstanceResourcePolicyResult {
  /// The date and time when you created the S3 Access Grants instance resource
  /// policy.
  final DateTime? createdAt;

  /// The Organization of the resource policy of the S3 Access Grants instance.
  final String? organization;

  /// The resource policy of the S3 Access Grants instance.
  final String? policy;

  GetAccessGrantsInstanceResourcePolicyResult({
    this.createdAt,
    this.organization,
    this.policy,
  });
  factory GetAccessGrantsInstanceResourcePolicyResult.fromXml(
      _s.XmlElement elem) {
    return GetAccessGrantsInstanceResourcePolicyResult(
      createdAt: _s.extractXmlDateTimeValue(elem, 'CreatedAt'),
      organization: _s.extractXmlStringValue(elem, 'Organization'),
      policy: _s.extractXmlStringValue(elem, 'Policy'),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final organization = this.organization;
    final policy = this.policy;
    return {
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (organization != null) 'Organization': organization,
      if (policy != null) 'Policy': policy,
    };
  }
}

class GetAccessGrantsInstanceResult {
  /// The Amazon Resource Name (ARN) of the S3 Access Grants instance.
  final String? accessGrantsInstanceArn;

  /// The ID of the S3 Access Grants instance. The ID is <code>default</code>. You
  /// can have one S3 Access Grants instance per Region per account.
  final String? accessGrantsInstanceId;

  /// The date and time when you created the S3 Access Grants instance.
  final DateTime? createdAt;

  /// If you associated your S3 Access Grants instance with an Amazon Web Services
  /// IAM Identity Center instance, this field returns the Amazon Resource Name
  /// (ARN) of the Amazon Web Services IAM Identity Center instance application; a
  /// subresource of the original Identity Center instance. S3 Access Grants
  /// creates this Identity Center application for the specific S3 Access Grants
  /// instance.
  final String? identityCenterArn;

  GetAccessGrantsInstanceResult({
    this.accessGrantsInstanceArn,
    this.accessGrantsInstanceId,
    this.createdAt,
    this.identityCenterArn,
  });
  factory GetAccessGrantsInstanceResult.fromXml(_s.XmlElement elem) {
    return GetAccessGrantsInstanceResult(
      accessGrantsInstanceArn:
          _s.extractXmlStringValue(elem, 'AccessGrantsInstanceArn'),
      accessGrantsInstanceId:
          _s.extractXmlStringValue(elem, 'AccessGrantsInstanceId'),
      createdAt: _s.extractXmlDateTimeValue(elem, 'CreatedAt'),
      identityCenterArn: _s.extractXmlStringValue(elem, 'IdentityCenterArn'),
    );
  }

  Map<String, dynamic> toJson() {
    final accessGrantsInstanceArn = this.accessGrantsInstanceArn;
    final accessGrantsInstanceId = this.accessGrantsInstanceId;
    final createdAt = this.createdAt;
    final identityCenterArn = this.identityCenterArn;
    return {
      if (accessGrantsInstanceArn != null)
        'AccessGrantsInstanceArn': accessGrantsInstanceArn,
      if (accessGrantsInstanceId != null)
        'AccessGrantsInstanceId': accessGrantsInstanceId,
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (identityCenterArn != null) 'IdentityCenterArn': identityCenterArn,
    };
  }
}

class GetAccessGrantsLocationResult {
  /// The Amazon Resource Name (ARN) of the registered location.
  final String? accessGrantsLocationArn;

  /// The ID of the registered location to which you are granting access. S3
  /// Access Grants assigns this ID when you register the location. S3 Access
  /// Grants assigns the ID <code>default</code> to the default location
  /// <code>s3://</code> and assigns an auto-generated ID to other locations that
  /// you register.
  final String? accessGrantsLocationId;

  /// The date and time when you registered the location.
  final DateTime? createdAt;

  /// The Amazon Resource Name (ARN) of the IAM role for the registered location.
  /// S3 Access Grants assumes this role to manage access to the registered
  /// location.
  final String? iAMRoleArn;

  /// The S3 URI path to the registered location. The location scope can be the
  /// default S3 location <code>s3://</code>, the S3 path to a bucket, or the S3
  /// path to a bucket and prefix. A prefix in S3 is a string of characters at the
  /// beginning of an object key name used to organize the objects that you store
  /// in your S3 buckets. For example, object key names that start with the
  /// <code>engineering/</code> prefix or object key names that start with the
  /// <code>marketing/campaigns/</code> prefix.
  final String? locationScope;

  GetAccessGrantsLocationResult({
    this.accessGrantsLocationArn,
    this.accessGrantsLocationId,
    this.createdAt,
    this.iAMRoleArn,
    this.locationScope,
  });
  factory GetAccessGrantsLocationResult.fromXml(_s.XmlElement elem) {
    return GetAccessGrantsLocationResult(
      accessGrantsLocationArn:
          _s.extractXmlStringValue(elem, 'AccessGrantsLocationArn'),
      accessGrantsLocationId:
          _s.extractXmlStringValue(elem, 'AccessGrantsLocationId'),
      createdAt: _s.extractXmlDateTimeValue(elem, 'CreatedAt'),
      iAMRoleArn: _s.extractXmlStringValue(elem, 'IAMRoleArn'),
      locationScope: _s.extractXmlStringValue(elem, 'LocationScope'),
    );
  }

  Map<String, dynamic> toJson() {
    final accessGrantsLocationArn = this.accessGrantsLocationArn;
    final accessGrantsLocationId = this.accessGrantsLocationId;
    final createdAt = this.createdAt;
    final iAMRoleArn = this.iAMRoleArn;
    final locationScope = this.locationScope;
    return {
      if (accessGrantsLocationArn != null)
        'AccessGrantsLocationArn': accessGrantsLocationArn,
      if (accessGrantsLocationId != null)
        'AccessGrantsLocationId': accessGrantsLocationId,
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (iAMRoleArn != null) 'IAMRoleArn': iAMRoleArn,
      if (locationScope != null) 'LocationScope': locationScope,
    };
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
          ?.let(ObjectLambdaConfiguration.fromXml),
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
          ?.let(ObjectLambdaAccessPointAlias.fromXml),
      creationDate: _s.extractXmlDateTimeValue(elem, 'CreationDate'),
      name: _s.extractXmlStringValue(elem, 'Name'),
      publicAccessBlockConfiguration: _s
          .extractXmlChild(elem, 'PublicAccessBlockConfiguration')
          ?.let(PublicAccessBlockConfiguration.fromXml),
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
      policyStatus:
          _s.extractXmlChild(elem, 'PolicyStatus')?.let(PolicyStatus.fromXml),
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
      policyStatus:
          _s.extractXmlChild(elem, 'PolicyStatus')?.let(PolicyStatus.fromXml),
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
          ?.let(PublicAccessBlockConfiguration.fromXml),
      vpcConfiguration: _s
          .extractXmlChild(elem, 'VpcConfiguration')
          ?.let(VpcConfiguration.fromXml),
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
      rules: _s.extractXmlChild(elem, 'Rules')?.let((elem) =>
          elem.findElements('Rule').map(LifecycleRule.fromXml).toList()),
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
          ?.let(ReplicationConfiguration.fromXml),
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
          .map(S3Tag.fromXml)
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

class GetDataAccessResult {
  /// The temporary credential token that S3 Access Grants vends.
  final Credentials? credentials;

  /// The S3 URI path of the data to which you are being granted temporary access
  /// credentials.
  final String? matchedGrantTarget;

  GetDataAccessResult({
    this.credentials,
    this.matchedGrantTarget,
  });
  factory GetDataAccessResult.fromXml(_s.XmlElement elem) {
    return GetDataAccessResult(
      credentials:
          _s.extractXmlChild(elem, 'Credentials')?.let(Credentials.fromXml),
      matchedGrantTarget: _s.extractXmlStringValue(elem, 'MatchedGrantTarget'),
    );
  }

  Map<String, dynamic> toJson() {
    final credentials = this.credentials;
    final matchedGrantTarget = this.matchedGrantTarget;
    return {
      if (credentials != null) 'Credentials': credentials,
      if (matchedGrantTarget != null) 'MatchedGrantTarget': matchedGrantTarget,
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
      tags: _s.extractXmlChild(elem, 'Tags')?.let(
          (elem) => elem.findElements('member').map(S3Tag.fromXml).toList()),
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
          ?.let(MultiRegionAccessPointPolicyDocument.fromXml),
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
      established:
          _s.extractXmlChild(elem, 'Established')?.let(PolicyStatus.fromXml),
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
          ?.let(MultiRegionAccessPointReport.fromXml),
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
          .map(MultiRegionAccessPointRoute.fromXml)
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
      tags: _s.extractXmlChild(elem, 'Tags')?.let((elem) =>
          elem.findElements('Tag').map(StorageLensTag.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

class GetStorageLensGroupResult {
  /// The name of the Storage Lens group that you're trying to retrieve the
  /// configuration details for.
  final StorageLensGroup? storageLensGroup;

  GetStorageLensGroupResult({
    this.storageLensGroup,
  });

  Map<String, dynamic> toJson() {
    final storageLensGroup = this.storageLensGroup;
    return {
      if (storageLensGroup != null) 'StorageLensGroup': storageLensGroup,
    };
  }
}

/// The user, group, or role to which you are granting access. You can grant
/// access to an IAM user or role. If you have added your corporate directory to
/// Amazon Web Services IAM Identity Center and associated your Identity Center
/// instance with your S3 Access Grants instance, the grantee can also be a
/// corporate directory user or group.
class Grantee {
  /// The unique identifier of the <code>Grantee</code>. If the grantee type is
  /// <code>IAM</code>, the identifier is the IAM Amazon Resource Name (ARN) of
  /// the user or role. If the grantee type is a directory user or group, the
  /// identifier is 128-bit universally unique identifier (UUID) in the format
  /// <code>a1b2c3d4-5678-90ab-cdef-EXAMPLE11111</code>. You can obtain this UUID
  /// from your Amazon Web Services IAM Identity Center instance.
  final String? granteeIdentifier;

  /// The type of the grantee to which access has been granted. It can be one of
  /// the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>IAM</code> - An IAM user or role.
  /// </li>
  /// <li>
  /// <code>DIRECTORY_USER</code> - Your corporate directory user. You can use
  /// this option if you have added your corporate identity directory to IAM
  /// Identity Center and associated the IAM Identity Center instance with your S3
  /// Access Grants instance.
  /// </li>
  /// <li>
  /// <code>DIRECTORY_GROUP</code> - Your corporate directory group. You can use
  /// this option if you have added your corporate identity directory to IAM
  /// Identity Center and associated the IAM Identity Center instance with your S3
  /// Access Grants instance.
  /// </li>
  /// </ul>
  final GranteeType? granteeType;

  Grantee({
    this.granteeIdentifier,
    this.granteeType,
  });
  factory Grantee.fromXml(_s.XmlElement elem) {
    return Grantee(
      granteeIdentifier: _s.extractXmlStringValue(elem, 'GranteeIdentifier'),
      granteeType:
          _s.extractXmlStringValue(elem, 'GranteeType')?.toGranteeType(),
    );
  }

  Map<String, dynamic> toJson() {
    final granteeIdentifier = this.granteeIdentifier;
    final granteeType = this.granteeType;
    return {
      if (granteeIdentifier != null) 'GranteeIdentifier': granteeIdentifier,
      if (granteeType != null) 'GranteeType': granteeType.toValue(),
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final granteeIdentifier = this.granteeIdentifier;
    final granteeType = this.granteeType;
    final $children = <_s.XmlNode>[
      if (granteeType != null)
        _s.encodeXmlStringValue('GranteeType', granteeType.toValue()),
      if (granteeIdentifier != null)
        _s.encodeXmlStringValue('GranteeIdentifier', granteeIdentifier),
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

enum GranteeType {
  directoryUser,
  directoryGroup,
  iam,
}

extension GranteeTypeValueExtension on GranteeType {
  String toValue() {
    switch (this) {
      case GranteeType.directoryUser:
        return 'DIRECTORY_USER';
      case GranteeType.directoryGroup:
        return 'DIRECTORY_GROUP';
      case GranteeType.iam:
        return 'IAM';
    }
  }
}

extension GranteeTypeFromString on String {
  GranteeType toGranteeType() {
    switch (this) {
      case 'DIRECTORY_USER':
        return GranteeType.directoryUser;
      case 'DIRECTORY_GROUP':
        return GranteeType.directoryGroup;
      case 'IAM':
        return GranteeType.iam;
    }
    throw Exception('$this is not known in enum GranteeType');
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
          elem.findElements('member').map(JobFailure.fromXml).toList()),
      generatedManifestDescriptor: _s
          .extractXmlChild(elem, 'GeneratedManifestDescriptor')
          ?.let(S3GeneratedManifestDescriptor.fromXml),
      jobArn: _s.extractXmlStringValue(elem, 'JobArn'),
      jobId: _s.extractXmlStringValue(elem, 'JobId'),
      manifest: _s.extractXmlChild(elem, 'Manifest')?.let(JobManifest.fromXml),
      manifestGenerator: _s
          .extractXmlChild(elem, 'ManifestGenerator')
          ?.let(JobManifestGenerator.fromXml),
      operation:
          _s.extractXmlChild(elem, 'Operation')?.let(JobOperation.fromXml),
      priority: _s.extractXmlIntValue(elem, 'Priority'),
      progressSummary: _s
          .extractXmlChild(elem, 'ProgressSummary')
          ?.let(JobProgressSummary.fromXml),
      report: _s.extractXmlChild(elem, 'Report')?.let(JobReport.fromXml),
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
          ?.let(JobProgressSummary.fromXml),
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
  /// Manifests can't be imported from directory buckets. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-buckets-overview.html">Directory
  /// buckets</a>.
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
          ?.let(S3JobManifestGenerator.fromXml),
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
  /// If provided, the generated manifest includes only source bucket objects that
  /// were created after this time.
  final DateTime? createdAfter;

  /// If provided, the generated manifest includes only source bucket objects that
  /// were created before this time.
  final DateTime? createdBefore;

  /// Include objects in the generated manifest only if they are eligible for
  /// replication according to the Replication configuration on the source bucket.
  final bool? eligibleForReplication;

  /// If provided, the generated manifest includes only source bucket objects
  /// whose object keys match the string constraints specified for
  /// <code>MatchAnyPrefix</code>, <code>MatchAnySuffix</code>, and
  /// <code>MatchAnySubstring</code>.
  final KeyNameConstraint? keyNameConstraint;

  /// If provided, the generated manifest includes only source bucket objects that
  /// are stored with the specified storage class.
  final List<S3StorageClass>? matchAnyStorageClass;

  /// If provided, the generated manifest includes only source bucket objects that
  /// have one of the specified Replication statuses.
  final List<ReplicationStatus>? objectReplicationStatuses;

  /// If provided, the generated manifest includes only source bucket objects
  /// whose file size is greater than the specified number of bytes.
  final int? objectSizeGreaterThanBytes;

  /// If provided, the generated manifest includes only source bucket objects
  /// whose file size is less than the specified number of bytes.
  final int? objectSizeLessThanBytes;

  JobManifestGeneratorFilter({
    this.createdAfter,
    this.createdBefore,
    this.eligibleForReplication,
    this.keyNameConstraint,
    this.matchAnyStorageClass,
    this.objectReplicationStatuses,
    this.objectSizeGreaterThanBytes,
    this.objectSizeLessThanBytes,
  });
  factory JobManifestGeneratorFilter.fromXml(_s.XmlElement elem) {
    return JobManifestGeneratorFilter(
      createdAfter: _s.extractXmlDateTimeValue(elem, 'CreatedAfter'),
      createdBefore: _s.extractXmlDateTimeValue(elem, 'CreatedBefore'),
      eligibleForReplication:
          _s.extractXmlBoolValue(elem, 'EligibleForReplication'),
      keyNameConstraint: _s
          .extractXmlChild(elem, 'KeyNameConstraint')
          ?.let(KeyNameConstraint.fromXml),
      matchAnyStorageClass: _s
          .extractXmlChild(elem, 'MatchAnyStorageClass')
          ?.let((elem) => _s
              .extractXmlStringListValues(elem, 'member')
              .map((s) => s.toS3StorageClass())
              .toList()),
      objectReplicationStatuses: _s
          .extractXmlChild(elem, 'ObjectReplicationStatuses')
          ?.let((elem) => _s
              .extractXmlStringListValues(elem, 'member')
              .map((s) => s.toReplicationStatus())
              .toList()),
      objectSizeGreaterThanBytes:
          _s.extractXmlIntValue(elem, 'ObjectSizeGreaterThanBytes'),
      objectSizeLessThanBytes:
          _s.extractXmlIntValue(elem, 'ObjectSizeLessThanBytes'),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAfter = this.createdAfter;
    final createdBefore = this.createdBefore;
    final eligibleForReplication = this.eligibleForReplication;
    final keyNameConstraint = this.keyNameConstraint;
    final matchAnyStorageClass = this.matchAnyStorageClass;
    final objectReplicationStatuses = this.objectReplicationStatuses;
    final objectSizeGreaterThanBytes = this.objectSizeGreaterThanBytes;
    final objectSizeLessThanBytes = this.objectSizeLessThanBytes;
    return {
      if (createdAfter != null) 'CreatedAfter': iso8601ToJson(createdAfter),
      if (createdBefore != null) 'CreatedBefore': iso8601ToJson(createdBefore),
      if (eligibleForReplication != null)
        'EligibleForReplication': eligibleForReplication,
      if (keyNameConstraint != null) 'KeyNameConstraint': keyNameConstraint,
      if (matchAnyStorageClass != null)
        'MatchAnyStorageClass':
            matchAnyStorageClass.map((e) => e.toValue()).toList(),
      if (objectReplicationStatuses != null)
        'ObjectReplicationStatuses':
            objectReplicationStatuses.map((e) => e.toValue()).toList(),
      if (objectSizeGreaterThanBytes != null)
        'ObjectSizeGreaterThanBytes': objectSizeGreaterThanBytes,
      if (objectSizeLessThanBytes != null)
        'ObjectSizeLessThanBytes': objectSizeLessThanBytes,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final createdAfter = this.createdAfter;
    final createdBefore = this.createdBefore;
    final eligibleForReplication = this.eligibleForReplication;
    final keyNameConstraint = this.keyNameConstraint;
    final matchAnyStorageClass = this.matchAnyStorageClass;
    final objectReplicationStatuses = this.objectReplicationStatuses;
    final objectSizeGreaterThanBytes = this.objectSizeGreaterThanBytes;
    final objectSizeLessThanBytes = this.objectSizeLessThanBytes;
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
      if (keyNameConstraint != null)
        keyNameConstraint.toXml('KeyNameConstraint'),
      if (objectSizeGreaterThanBytes != null)
        _s.encodeXmlIntValue(
            'ObjectSizeGreaterThanBytes', objectSizeGreaterThanBytes),
      if (objectSizeLessThanBytes != null)
        _s.encodeXmlIntValue(
            'ObjectSizeLessThanBytes', objectSizeLessThanBytes),
      if (matchAnyStorageClass != null)
        _s.XmlElement(
            _s.XmlName('MatchAnyStorageClass'),
            [],
            matchAnyStorageClass
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

/// Contains the information required to locate a manifest object. Manifests
/// can't be imported from directory buckets. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-buckets-overview.html">Directory
/// buckets</a>.
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
  /// <note>
  /// This functionality is not supported by directory buckets.
  /// </note>
  final S3DeleteObjectTaggingOperation? s3DeleteObjectTagging;

  /// Directs the specified job to initiate restore requests for every archived
  /// object in the manifest.
  /// <note>
  /// This functionality is not supported by directory buckets.
  /// </note>
  final S3InitiateRestoreObjectOperation? s3InitiateRestoreObject;

  /// Directs the specified job to run a <code>PutObjectAcl</code> call on every
  /// object in the manifest.
  /// <note>
  /// This functionality is not supported by directory buckets.
  /// </note>
  final S3SetObjectAclOperation? s3PutObjectAcl;

  /// Directs the specified job to run a PUT Copy object call on every object in
  /// the manifest.
  final S3CopyObjectOperation? s3PutObjectCopy;
  final S3SetObjectLegalHoldOperation? s3PutObjectLegalHold;
  final S3SetObjectRetentionOperation? s3PutObjectRetention;

  /// Directs the specified job to run a PUT Object tagging call on every object
  /// in the manifest.
  /// <note>
  /// This functionality is not supported by directory buckets.
  /// </note>
  final S3SetObjectTaggingOperation? s3PutObjectTagging;

  /// Directs the specified job to invoke <code>ReplicateObject</code> on every
  /// object in the job's manifest.
  /// <note>
  /// This functionality is not supported by directory buckets.
  /// </note>
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
          ?.let(LambdaInvokeOperation.fromXml),
      s3DeleteObjectTagging: _s
          .extractXmlChild(elem, 'S3DeleteObjectTagging')
          ?.let(S3DeleteObjectTaggingOperation.fromXml),
      s3InitiateRestoreObject: _s
          .extractXmlChild(elem, 'S3InitiateRestoreObject')
          ?.let(S3InitiateRestoreObjectOperation.fromXml),
      s3PutObjectAcl: _s
          .extractXmlChild(elem, 'S3PutObjectAcl')
          ?.let(S3SetObjectAclOperation.fromXml),
      s3PutObjectCopy: _s
          .extractXmlChild(elem, 'S3PutObjectCopy')
          ?.let(S3CopyObjectOperation.fromXml),
      s3PutObjectLegalHold: _s
          .extractXmlChild(elem, 'S3PutObjectLegalHold')
          ?.let(S3SetObjectLegalHoldOperation.fromXml),
      s3PutObjectRetention: _s
          .extractXmlChild(elem, 'S3PutObjectRetention')
          ?.let(S3SetObjectRetentionOperation.fromXml),
      s3PutObjectTagging: _s
          .extractXmlChild(elem, 'S3PutObjectTagging')
          ?.let(S3SetObjectTaggingOperation.fromXml),
      s3ReplicateObject: _s
          .extractXmlChild(elem, 'S3ReplicateObject')
          ?.let(S3ReplicateObjectOperation.fromXml),
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
      timers: _s.extractXmlChild(elem, 'Timers')?.let(JobTimers.fromXml),
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
  /// <note>
  /// <b>Directory buckets</b> - Directory buckets aren't supported as a location
  /// for Batch Operations to store job completion reports.
  /// </note>
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

/// If provided, the generated manifest includes only source bucket objects
/// whose object keys match the string constraints specified for
/// <code>MatchAnyPrefix</code>, <code>MatchAnySuffix</code>, and
/// <code>MatchAnySubstring</code>.
class KeyNameConstraint {
  /// If provided, the generated manifest includes objects where the specified
  /// string appears at the start of the object key string.
  final List<String>? matchAnyPrefix;

  /// If provided, the generated manifest includes objects where the specified
  /// string appears anywhere within the object key string.
  final List<String>? matchAnySubstring;

  /// If provided, the generated manifest includes objects where the specified
  /// string appears at the end of the object key string.
  final List<String>? matchAnySuffix;

  KeyNameConstraint({
    this.matchAnyPrefix,
    this.matchAnySubstring,
    this.matchAnySuffix,
  });
  factory KeyNameConstraint.fromXml(_s.XmlElement elem) {
    return KeyNameConstraint(
      matchAnyPrefix: _s
          .extractXmlChild(elem, 'MatchAnyPrefix')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      matchAnySubstring: _s
          .extractXmlChild(elem, 'MatchAnySubstring')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      matchAnySuffix: _s
          .extractXmlChild(elem, 'MatchAnySuffix')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() {
    final matchAnyPrefix = this.matchAnyPrefix;
    final matchAnySubstring = this.matchAnySubstring;
    final matchAnySuffix = this.matchAnySuffix;
    return {
      if (matchAnyPrefix != null) 'MatchAnyPrefix': matchAnyPrefix,
      if (matchAnySubstring != null) 'MatchAnySubstring': matchAnySubstring,
      if (matchAnySuffix != null) 'MatchAnySuffix': matchAnySuffix,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final matchAnyPrefix = this.matchAnyPrefix;
    final matchAnySubstring = this.matchAnySubstring;
    final matchAnySuffix = this.matchAnySuffix;
    final $children = <_s.XmlNode>[
      if (matchAnyPrefix != null)
        _s.XmlElement(_s.XmlName('MatchAnyPrefix'), [],
            matchAnyPrefix.map((e) => _s.encodeXmlStringValue('member', e))),
      if (matchAnySuffix != null)
        _s.XmlElement(_s.XmlName('MatchAnySuffix'), [],
            matchAnySuffix.map((e) => _s.encodeXmlStringValue('member', e))),
      if (matchAnySubstring != null)
        _s.XmlElement(_s.XmlName('MatchAnySubstring'), [],
            matchAnySubstring.map((e) => _s.encodeXmlStringValue('member', e))),
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

/// Contains the configuration parameters for a <code>Lambda Invoke</code>
/// operation.
class LambdaInvokeOperation {
  /// The Amazon Resource Name (ARN) for the Lambda function that the specified
  /// job will invoke on every object in the manifest.
  final String? functionArn;

  /// Specifies the schema version for the payload that Batch Operations sends
  /// when invoking an Lambda function. Version <code>1.0</code> is the default.
  /// Version <code>2.0</code> is required when you use Batch Operations to invoke
  /// Lambda functions that act on directory buckets, or if you need to specify
  /// <code>UserArguments</code>. For more information, see <a
  /// href="https://aws.amazon.com/blogs/storage/automate-object-processing-in-amazon-s3-directory-buckets-with-s3-batch-operations-and-aws-lambda/">Automate
  /// object processing in Amazon S3 directory buckets with S3 Batch Operations
  /// and Lambda</a> in the <i>Amazon Web Services Storage Blog</i>.
  /// <important>
  /// Ensure that your Lambda function code expects
  /// <code>InvocationSchemaVersion</code> <b>2.0</b> and uses bucket name rather
  /// than bucket ARN. If the <code>InvocationSchemaVersion</code> does not match
  /// what your Lambda function expects, your function might not work as expected.
  /// </important> <note>
  /// <b>Directory buckets</b> - To initiate Amazon Web Services Lambda function
  /// to perform custom actions on objects in directory buckets, you must specify
  /// <code>2.0</code>.
  /// </note>
  final String? invocationSchemaVersion;

  /// Key-value pairs that are passed in the payload that Batch Operations sends
  /// when invoking an Lambda function. You must specify
  /// <code>InvocationSchemaVersion</code> <b>2.0</b> for
  /// <code>LambdaInvoke</code> operations that include
  /// <code>UserArguments</code>. For more information, see <a
  /// href="https://aws.amazon.com/blogs/storage/automate-object-processing-in-amazon-s3-directory-buckets-with-s3-batch-operations-and-aws-lambda/">Automate
  /// object processing in Amazon S3 directory buckets with S3 Batch Operations
  /// and Lambda</a> in the <i>Amazon Web Services Storage Blog</i>.
  final Map<String, String>? userArguments;

  LambdaInvokeOperation({
    this.functionArn,
    this.invocationSchemaVersion,
    this.userArguments,
  });
  factory LambdaInvokeOperation.fromXml(_s.XmlElement elem) {
    return LambdaInvokeOperation(
      functionArn: _s.extractXmlStringValue(elem, 'FunctionArn'),
      invocationSchemaVersion:
          _s.extractXmlStringValue(elem, 'InvocationSchemaVersion'),
      userArguments: Map.fromEntries(
        elem.getElement('UserArguments')?.findElements('entry').map(
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
    final functionArn = this.functionArn;
    final invocationSchemaVersion = this.invocationSchemaVersion;
    final userArguments = this.userArguments;
    return {
      if (functionArn != null) 'FunctionArn': functionArn,
      if (invocationSchemaVersion != null)
        'InvocationSchemaVersion': invocationSchemaVersion,
      if (userArguments != null) 'UserArguments': userArguments,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final functionArn = this.functionArn;
    final invocationSchemaVersion = this.invocationSchemaVersion;
    final userArguments = this.userArguments;
    final $children = <_s.XmlNode>[
      if (functionArn != null)
        _s.encodeXmlStringValue('FunctionArn', functionArn),
      if (invocationSchemaVersion != null)
        _s.encodeXmlStringValue(
            'InvocationSchemaVersion', invocationSchemaVersion),
      if (userArguments != null)
        _s.XmlElement(
            _s.XmlName('UserArguments'),
            [],
            userArguments.entries.map((e) => _s.XmlElement(
                    _s.XmlName('entry'), [], <_s.XmlNode>[
                  _s.encodeXmlStringValue('key', e.key),
                  _s.encodeXmlStringValue('value', e.value)
                ]))),
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
          ?.let(AbortIncompleteMultipartUpload.fromXml),
      expiration: _s
          .extractXmlChild(elem, 'Expiration')
          ?.let(LifecycleExpiration.fromXml),
      filter:
          _s.extractXmlChild(elem, 'Filter')?.let(LifecycleRuleFilter.fromXml),
      id: _s.extractXmlStringValue(elem, 'ID'),
      noncurrentVersionExpiration: _s
          .extractXmlChild(elem, 'NoncurrentVersionExpiration')
          ?.let(NoncurrentVersionExpiration.fromXml),
      noncurrentVersionTransitions: _s
          .extractXmlChild(elem, 'NoncurrentVersionTransitions')
          ?.let((elem) => elem
              .findElements('NoncurrentVersionTransition')
              .map(NoncurrentVersionTransition.fromXml)
              .toList()),
      transitions: _s.extractXmlChild(elem, 'Transitions')?.let((elem) =>
          elem.findElements('Transition').map(Transition.fromXml).toList()),
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
  /// The non-inclusive minimum object size for the lifecycle rule. Setting this
  /// property to 7 means the rule applies to objects with a size that is greater
  /// than 7.
  final int? objectSizeGreaterThan;

  /// The non-inclusive maximum object size for the lifecycle rule. Setting this
  /// property to 77 means the rule applies to objects with a size that is less
  /// than 77.
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
      tags: _s.extractXmlChild(elem, 'Tags')?.let(
          (elem) => elem.findElements('member').map(S3Tag.fromXml).toList()),
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
          ?.let(LifecycleRuleAndOperator.fromXml),
      objectSizeGreaterThan:
          _s.extractXmlIntValue(elem, 'ObjectSizeGreaterThan'),
      objectSizeLessThan: _s.extractXmlIntValue(elem, 'ObjectSizeLessThan'),
      prefix: _s.extractXmlStringValue(elem, 'Prefix'),
      tag: _s.extractXmlChild(elem, 'Tag')?.let(S3Tag.fromXml),
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

/// Information about the access grant.
class ListAccessGrantEntry {
  /// The Amazon Resource Name (ARN) of the access grant.
  final String? accessGrantArn;

  /// The ID of the access grant. S3 Access Grants auto-generates this ID when you
  /// create the access grant.
  final String? accessGrantId;

  /// The configuration options of the grant location. The grant location is the
  /// S3 path to the data to which you are granting access.
  final AccessGrantsLocationConfiguration? accessGrantsLocationConfiguration;

  /// The ID of the registered location to which you are granting access. S3
  /// Access Grants assigns this ID when you register the location. S3 Access
  /// Grants assigns the ID <code>default</code> to the default location
  /// <code>s3://</code> and assigns an auto-generated ID to other locations that
  /// you register.
  final String? accessGrantsLocationId;

  /// The Amazon Resource Name (ARN) of an Amazon Web Services IAM Identity Center
  /// application associated with your Identity Center instance. If the grant
  /// includes an application ARN, the grantee can only access the S3 data through
  /// this application.
  final String? applicationArn;

  /// The date and time when you created the S3 Access Grants instance.
  final DateTime? createdAt;

  /// The S3 path of the data to which you are granting access. It is the result
  /// of appending the <code>Subprefix</code> to the location scope.
  final String? grantScope;

  /// The user, group, or role to which you are granting access. You can grant
  /// access to an IAM user or role. If you have added your corporate directory to
  /// Amazon Web Services IAM Identity Center and associated your Identity Center
  /// instance with your S3 Access Grants instance, the grantee can also be a
  /// corporate directory user or group.
  final Grantee? grantee;

  /// The type of access granted to your S3 data, which can be set to one of the
  /// following values:
  ///
  /// <ul>
  /// <li>
  /// <code>READ</code> – Grant read-only access to the S3 data.
  /// </li>
  /// <li>
  /// <code>WRITE</code> – Grant write-only access to the S3 data.
  /// </li>
  /// <li>
  /// <code>READWRITE</code> – Grant both read and write access to the S3 data.
  /// </li>
  /// </ul>
  final Permission? permission;

  ListAccessGrantEntry({
    this.accessGrantArn,
    this.accessGrantId,
    this.accessGrantsLocationConfiguration,
    this.accessGrantsLocationId,
    this.applicationArn,
    this.createdAt,
    this.grantScope,
    this.grantee,
    this.permission,
  });
  factory ListAccessGrantEntry.fromXml(_s.XmlElement elem) {
    return ListAccessGrantEntry(
      accessGrantArn: _s.extractXmlStringValue(elem, 'AccessGrantArn'),
      accessGrantId: _s.extractXmlStringValue(elem, 'AccessGrantId'),
      accessGrantsLocationConfiguration: _s
          .extractXmlChild(elem, 'AccessGrantsLocationConfiguration')
          ?.let(AccessGrantsLocationConfiguration.fromXml),
      accessGrantsLocationId:
          _s.extractXmlStringValue(elem, 'AccessGrantsLocationId'),
      applicationArn: _s.extractXmlStringValue(elem, 'ApplicationArn'),
      createdAt: _s.extractXmlDateTimeValue(elem, 'CreatedAt'),
      grantScope: _s.extractXmlStringValue(elem, 'GrantScope'),
      grantee: _s.extractXmlChild(elem, 'Grantee')?.let(Grantee.fromXml),
      permission: _s.extractXmlStringValue(elem, 'Permission')?.toPermission(),
    );
  }

  Map<String, dynamic> toJson() {
    final accessGrantArn = this.accessGrantArn;
    final accessGrantId = this.accessGrantId;
    final accessGrantsLocationConfiguration =
        this.accessGrantsLocationConfiguration;
    final accessGrantsLocationId = this.accessGrantsLocationId;
    final applicationArn = this.applicationArn;
    final createdAt = this.createdAt;
    final grantScope = this.grantScope;
    final grantee = this.grantee;
    final permission = this.permission;
    return {
      if (accessGrantArn != null) 'AccessGrantArn': accessGrantArn,
      if (accessGrantId != null) 'AccessGrantId': accessGrantId,
      if (accessGrantsLocationConfiguration != null)
        'AccessGrantsLocationConfiguration': accessGrantsLocationConfiguration,
      if (accessGrantsLocationId != null)
        'AccessGrantsLocationId': accessGrantsLocationId,
      if (applicationArn != null) 'ApplicationArn': applicationArn,
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (grantScope != null) 'GrantScope': grantScope,
      if (grantee != null) 'Grantee': grantee,
      if (permission != null) 'Permission': permission.toValue(),
    };
  }
}

/// Information about the S3 Access Grants instance.
class ListAccessGrantsInstanceEntry {
  /// The Amazon Resource Name (ARN) of the S3 Access Grants instance.
  final String? accessGrantsInstanceArn;

  /// The ID of the S3 Access Grants instance. The ID is <code>default</code>. You
  /// can have one S3 Access Grants instance per Region per account.
  final String? accessGrantsInstanceId;

  /// The date and time when you created the S3 Access Grants instance.
  final DateTime? createdAt;

  /// If you associated your S3 Access Grants instance with an Amazon Web Services
  /// IAM Identity Center instance, this field returns the Amazon Resource Name
  /// (ARN) of the IAM Identity Center instance application; a subresource of the
  /// original Identity Center instance. S3 Access Grants creates this Identity
  /// Center application for the specific S3 Access Grants instance.
  final String? identityCenterArn;

  ListAccessGrantsInstanceEntry({
    this.accessGrantsInstanceArn,
    this.accessGrantsInstanceId,
    this.createdAt,
    this.identityCenterArn,
  });
  factory ListAccessGrantsInstanceEntry.fromXml(_s.XmlElement elem) {
    return ListAccessGrantsInstanceEntry(
      accessGrantsInstanceArn:
          _s.extractXmlStringValue(elem, 'AccessGrantsInstanceArn'),
      accessGrantsInstanceId:
          _s.extractXmlStringValue(elem, 'AccessGrantsInstanceId'),
      createdAt: _s.extractXmlDateTimeValue(elem, 'CreatedAt'),
      identityCenterArn: _s.extractXmlStringValue(elem, 'IdentityCenterArn'),
    );
  }

  Map<String, dynamic> toJson() {
    final accessGrantsInstanceArn = this.accessGrantsInstanceArn;
    final accessGrantsInstanceId = this.accessGrantsInstanceId;
    final createdAt = this.createdAt;
    final identityCenterArn = this.identityCenterArn;
    return {
      if (accessGrantsInstanceArn != null)
        'AccessGrantsInstanceArn': accessGrantsInstanceArn,
      if (accessGrantsInstanceId != null)
        'AccessGrantsInstanceId': accessGrantsInstanceId,
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (identityCenterArn != null) 'IdentityCenterArn': identityCenterArn,
    };
  }
}

class ListAccessGrantsInstancesResult {
  /// A container for a list of S3 Access Grants instances.
  final List<ListAccessGrantsInstanceEntry>? accessGrantsInstancesList;

  /// A pagination token to request the next page of results. Pass this value into
  /// a subsequent <code>List Access Grants Instances</code> request in order to
  /// retrieve the next page of results.
  final String? nextToken;

  ListAccessGrantsInstancesResult({
    this.accessGrantsInstancesList,
    this.nextToken,
  });
  factory ListAccessGrantsInstancesResult.fromXml(_s.XmlElement elem) {
    return ListAccessGrantsInstancesResult(
      accessGrantsInstancesList: _s
          .extractXmlChild(elem, 'AccessGrantsInstancesList')
          ?.let((elem) => elem
              .findElements('AccessGrantsInstance')
              .map(ListAccessGrantsInstanceEntry.fromXml)
              .toList()),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }

  Map<String, dynamic> toJson() {
    final accessGrantsInstancesList = this.accessGrantsInstancesList;
    final nextToken = this.nextToken;
    return {
      if (accessGrantsInstancesList != null)
        'AccessGrantsInstancesList': accessGrantsInstancesList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// A container for information about the registered location.
class ListAccessGrantsLocationsEntry {
  /// The Amazon Resource Name (ARN) of the registered location.
  final String? accessGrantsLocationArn;

  /// The ID of the registered location to which you are granting access. S3
  /// Access Grants assigns this ID when you register the location. S3 Access
  /// Grants assigns the ID <code>default</code> to the default location
  /// <code>s3://</code> and assigns an auto-generated ID to other locations that
  /// you register.
  final String? accessGrantsLocationId;

  /// The date and time when you registered the location.
  final DateTime? createdAt;

  /// The Amazon Resource Name (ARN) of the IAM role for the registered location.
  /// S3 Access Grants assumes this role to manage access to the registered
  /// location.
  final String? iAMRoleArn;

  /// The S3 path to the location that you are registering. The location scope can
  /// be the default S3 location <code>s3://</code>, the S3 path to a bucket
  /// <code>s3://&lt;bucket&gt;</code>, or the S3 path to a bucket and prefix
  /// <code>s3://&lt;bucket&gt;/&lt;prefix&gt;</code>. A prefix in S3 is a string
  /// of characters at the beginning of an object key name used to organize the
  /// objects that you store in your S3 buckets. For example, object key names
  /// that start with the <code>engineering/</code> prefix or object key names
  /// that start with the <code>marketing/campaigns/</code> prefix.
  final String? locationScope;

  ListAccessGrantsLocationsEntry({
    this.accessGrantsLocationArn,
    this.accessGrantsLocationId,
    this.createdAt,
    this.iAMRoleArn,
    this.locationScope,
  });
  factory ListAccessGrantsLocationsEntry.fromXml(_s.XmlElement elem) {
    return ListAccessGrantsLocationsEntry(
      accessGrantsLocationArn:
          _s.extractXmlStringValue(elem, 'AccessGrantsLocationArn'),
      accessGrantsLocationId:
          _s.extractXmlStringValue(elem, 'AccessGrantsLocationId'),
      createdAt: _s.extractXmlDateTimeValue(elem, 'CreatedAt'),
      iAMRoleArn: _s.extractXmlStringValue(elem, 'IAMRoleArn'),
      locationScope: _s.extractXmlStringValue(elem, 'LocationScope'),
    );
  }

  Map<String, dynamic> toJson() {
    final accessGrantsLocationArn = this.accessGrantsLocationArn;
    final accessGrantsLocationId = this.accessGrantsLocationId;
    final createdAt = this.createdAt;
    final iAMRoleArn = this.iAMRoleArn;
    final locationScope = this.locationScope;
    return {
      if (accessGrantsLocationArn != null)
        'AccessGrantsLocationArn': accessGrantsLocationArn,
      if (accessGrantsLocationId != null)
        'AccessGrantsLocationId': accessGrantsLocationId,
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (iAMRoleArn != null) 'IAMRoleArn': iAMRoleArn,
      if (locationScope != null) 'LocationScope': locationScope,
    };
  }
}

class ListAccessGrantsLocationsResult {
  /// A container for a list of registered locations in an S3 Access Grants
  /// instance.
  final List<ListAccessGrantsLocationsEntry>? accessGrantsLocationsList;

  /// A pagination token to request the next page of results. Pass this value into
  /// a subsequent <code>List Access Grants Locations</code> request in order to
  /// retrieve the next page of results.
  final String? nextToken;

  ListAccessGrantsLocationsResult({
    this.accessGrantsLocationsList,
    this.nextToken,
  });
  factory ListAccessGrantsLocationsResult.fromXml(_s.XmlElement elem) {
    return ListAccessGrantsLocationsResult(
      accessGrantsLocationsList: _s
          .extractXmlChild(elem, 'AccessGrantsLocationsList')
          ?.let((elem) => elem
              .findElements('AccessGrantsLocation')
              .map(ListAccessGrantsLocationsEntry.fromXml)
              .toList()),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }

  Map<String, dynamic> toJson() {
    final accessGrantsLocationsList = this.accessGrantsLocationsList;
    final nextToken = this.nextToken;
    return {
      if (accessGrantsLocationsList != null)
        'AccessGrantsLocationsList': accessGrantsLocationsList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListAccessGrantsResult {
  /// A container for a list of grants in an S3 Access Grants instance.
  final List<ListAccessGrantEntry>? accessGrantsList;

  /// A pagination token to request the next page of results. Pass this value into
  /// a subsequent <code>List Access Grants</code> request in order to retrieve
  /// the next page of results.
  final String? nextToken;

  ListAccessGrantsResult({
    this.accessGrantsList,
    this.nextToken,
  });
  factory ListAccessGrantsResult.fromXml(_s.XmlElement elem) {
    return ListAccessGrantsResult(
      accessGrantsList: _s.extractXmlChild(elem, 'AccessGrantsList')?.let(
          (elem) => elem
              .findElements('AccessGrant')
              .map(ListAccessGrantEntry.fromXml)
              .toList()),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }

  Map<String, dynamic> toJson() {
    final accessGrantsList = this.accessGrantsList;
    final nextToken = this.nextToken;
    return {
      if (accessGrantsList != null) 'AccessGrantsList': accessGrantsList,
      if (nextToken != null) 'NextToken': nextToken,
    };
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
              .map(ObjectLambdaAccessPoint.fromXml)
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
              .map(AccessPoint.fromXml)
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
      jobs: _s.extractXmlChild(elem, 'Jobs')?.let((elem) =>
          elem.findElements('member').map(JobListDescriptor.fromXml).toList()),
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
          .map(MultiRegionAccessPointReport.fromXml)
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
              .map(RegionalBucket.fromXml)
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
          .map(ListStorageLensConfigurationEntry.fromXml)
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

/// Each entry contains a Storage Lens group that exists in the specified home
/// Region.
class ListStorageLensGroupEntry {
  /// Contains the Amazon Web Services Region where the Storage Lens group was
  /// created.
  final String homeRegion;

  /// Contains the name of the Storage Lens group that exists in the specified
  /// home Region.
  final String name;

  /// Contains the Amazon Resource Name (ARN) of the Storage Lens group. This
  /// property is read-only.
  final String storageLensGroupArn;

  ListStorageLensGroupEntry({
    required this.homeRegion,
    required this.name,
    required this.storageLensGroupArn,
  });
  factory ListStorageLensGroupEntry.fromXml(_s.XmlElement elem) {
    return ListStorageLensGroupEntry(
      homeRegion: _s.extractXmlStringValue(elem, 'HomeRegion')!,
      name: _s.extractXmlStringValue(elem, 'Name')!,
      storageLensGroupArn:
          _s.extractXmlStringValue(elem, 'StorageLensGroupArn')!,
    );
  }

  Map<String, dynamic> toJson() {
    final homeRegion = this.homeRegion;
    final name = this.name;
    final storageLensGroupArn = this.storageLensGroupArn;
    return {
      'HomeRegion': homeRegion,
      'Name': name,
      'StorageLensGroupArn': storageLensGroupArn,
    };
  }
}

class ListStorageLensGroupsResult {
  /// If <code>NextToken</code> is returned, there are more Storage Lens groups
  /// results available. The value of <code>NextToken</code> is a unique
  /// pagination token for each page. Make the call again using the returned token
  /// to retrieve the next page. Keep all other arguments unchanged. Each
  /// pagination token expires after 24 hours.
  final String? nextToken;

  /// The list of Storage Lens groups that exist in the specified home Region.
  final List<ListStorageLensGroupEntry>? storageLensGroupList;

  ListStorageLensGroupsResult({
    this.nextToken,
    this.storageLensGroupList,
  });
  factory ListStorageLensGroupsResult.fromXml(_s.XmlElement elem) {
    return ListStorageLensGroupsResult(
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      storageLensGroupList: elem
          .findElements('StorageLensGroup')
          .map(ListStorageLensGroupEntry.fromXml)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final storageLensGroupList = this.storageLensGroupList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (storageLensGroupList != null)
        'StorageLensGroupList': storageLensGroupList,
    };
  }
}

class ListTagsForResourceResult {
  /// The Amazon Web Services resource tags that are associated with the resource.
  final List<Tag>? tags;

  ListTagsForResourceResult({
    this.tags,
  });
  factory ListTagsForResourceResult.fromXml(_s.XmlElement elem) {
    return ListTagsForResourceResult(
      tags: _s
          .extractXmlChild(elem, 'Tags')
          ?.let((elem) => elem.findElements('Tag').map(Tag.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
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

/// A filter condition that specifies the object age range of included objects
/// in days. Only integers are supported.
class MatchObjectAge {
  /// Specifies the maximum object age in days. Must be a positive whole number,
  /// greater than the minimum object age and less than or equal to 2,147,483,647.
  final int? daysGreaterThan;

  /// Specifies the minimum object age in days. The value must be a positive whole
  /// number, greater than 0 and less than or equal to 2,147,483,647.
  final int? daysLessThan;

  MatchObjectAge({
    this.daysGreaterThan,
    this.daysLessThan,
  });
  factory MatchObjectAge.fromXml(_s.XmlElement elem) {
    return MatchObjectAge(
      daysGreaterThan: _s.extractXmlIntValue(elem, 'DaysGreaterThan'),
      daysLessThan: _s.extractXmlIntValue(elem, 'DaysLessThan'),
    );
  }

  Map<String, dynamic> toJson() {
    final daysGreaterThan = this.daysGreaterThan;
    final daysLessThan = this.daysLessThan;
    return {
      if (daysGreaterThan != null) 'DaysGreaterThan': daysGreaterThan,
      if (daysLessThan != null) 'DaysLessThan': daysLessThan,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final daysGreaterThan = this.daysGreaterThan;
    final daysLessThan = this.daysLessThan;
    final $children = <_s.XmlNode>[
      if (daysGreaterThan != null)
        _s.encodeXmlIntValue('DaysGreaterThan', daysGreaterThan),
      if (daysLessThan != null)
        _s.encodeXmlIntValue('DaysLessThan', daysLessThan),
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

/// A filter condition that specifies the object size range of included objects
/// in bytes. Only integers are supported.
class MatchObjectSize {
  /// Specifies the minimum object size in Bytes. The value must be a positive
  /// number, greater than 0 and less than 5 TB.
  final int? bytesGreaterThan;

  /// Specifies the maximum object size in Bytes. The value must be a positive
  /// number, greater than the minimum object size and less than 5 TB.
  final int? bytesLessThan;

  MatchObjectSize({
    this.bytesGreaterThan,
    this.bytesLessThan,
  });
  factory MatchObjectSize.fromXml(_s.XmlElement elem) {
    return MatchObjectSize(
      bytesGreaterThan: _s.extractXmlIntValue(elem, 'BytesGreaterThan'),
      bytesLessThan: _s.extractXmlIntValue(elem, 'BytesLessThan'),
    );
  }

  Map<String, dynamic> toJson() {
    final bytesGreaterThan = this.bytesGreaterThan;
    final bytesLessThan = this.bytesLessThan;
    return {
      if (bytesGreaterThan != null) 'BytesGreaterThan': bytesGreaterThan,
      if (bytesLessThan != null) 'BytesLessThan': bytesLessThan,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final bytesGreaterThan = this.bytesGreaterThan;
    final bytesLessThan = this.bytesLessThan;
    final $children = <_s.XmlNode>[
      if (bytesGreaterThan != null)
        _s.encodeXmlIntValue('BytesGreaterThan', bytesGreaterThan),
      if (bytesLessThan != null)
        _s.encodeXmlIntValue('BytesLessThan', bytesLessThan),
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
          ?.let(ReplicationTimeValue.fromXml),
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
          ?.let(EstablishedMultiRegionAccessPointPolicy.fromXml),
      proposed: _s
          .extractXmlChild(elem, 'Proposed')
          ?.let(ProposedMultiRegionAccessPointPolicy.fromXml),
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
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/CreatingMultiRegionAccessPoints.html#multi-region-access-point-naming">Rules
  /// for naming Amazon S3 Multi-Region Access Points</a>.
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
          ?.let(PublicAccessBlockConfiguration.fromXml),
      regions: _s.extractXmlChild(elem, 'Regions')?.let((elem) =>
          elem.findElements('Region').map(RegionReport.fromXml).toList()),
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
          .map(MultiRegionAccessPointRegionalResponse.fromXml)
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
          ?.let(ObjectLambdaAccessPointAlias.fromXml),
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
          .map(ObjectLambdaTransformationConfiguration.fromXml)
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
          ?.let(AwsLambdaTransformation.fromXml),
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

enum Permission {
  read,
  write,
  readwrite,
}

extension PermissionValueExtension on Permission {
  String toValue() {
    switch (this) {
      case Permission.read:
        return 'READ';
      case Permission.write:
        return 'WRITE';
      case Permission.readwrite:
        return 'READWRITE';
    }
  }
}

extension PermissionFromString on String {
  Permission toPermission() {
    switch (this) {
      case 'READ':
        return Permission.read;
      case 'WRITE':
        return Permission.write;
      case 'READWRITE':
        return Permission.readwrite;
    }
    throw Exception('$this is not known in enum Permission');
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
          ?.let(SelectionCriteria.fromXml),
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

enum Privilege {
  minimal,
  $default,
}

extension PrivilegeValueExtension on Privilege {
  String toValue() {
    switch (this) {
      case Privilege.minimal:
        return 'Minimal';
      case Privilege.$default:
        return 'Default';
    }
  }
}

extension PrivilegeFromString on String {
  Privilege toPrivilege() {
    switch (this) {
      case 'Minimal':
        return Privilege.minimal;
      case 'Default':
        return Privilege.$default;
    }
    throw Exception('$this is not known in enum Privilege');
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

class PutAccessGrantsInstanceResourcePolicyRequest {
  /// The ID of the Amazon Web Services account that is making this request.
  final String accountId;

  /// The resource policy of the S3 Access Grants instance that you are updating.
  final String policy;

  /// The Organization of the resource policy of the S3 Access Grants instance.
  final String? organization;

  PutAccessGrantsInstanceResourcePolicyRequest({
    required this.accountId,
    required this.policy,
    this.organization,
  });

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final policy = this.policy;
    final organization = this.organization;
    return {
      'Policy': policy,
      if (organization != null) 'Organization': organization,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final accountId = this.accountId;
    final policy = this.policy;
    final organization = this.organization;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Policy', policy),
      if (organization != null)
        _s.encodeXmlStringValue('Organization', organization),
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

class PutAccessGrantsInstanceResourcePolicyResult {
  /// The date and time when you created the S3 Access Grants instance resource
  /// policy.
  final DateTime? createdAt;

  /// The Organization of the resource policy of the S3 Access Grants instance.
  final String? organization;

  /// The updated resource policy of the S3 Access Grants instance.
  final String? policy;

  PutAccessGrantsInstanceResourcePolicyResult({
    this.createdAt,
    this.organization,
    this.policy,
  });
  factory PutAccessGrantsInstanceResourcePolicyResult.fromXml(
      _s.XmlElement elem) {
    return PutAccessGrantsInstanceResourcePolicyResult(
      createdAt: _s.extractXmlDateTimeValue(elem, 'CreatedAt'),
      organization: _s.extractXmlStringValue(elem, 'Organization'),
      policy: _s.extractXmlStringValue(elem, 'Policy'),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final organization = this.organization;
    final policy = this.policy;
    return {
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (organization != null) 'Organization': organization,
      if (policy != null) 'Policy': policy,
    };
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
          .map(ReplicationRule.fromXml)
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
          ?.let(DeleteMarkerReplication.fromXml),
      existingObjectReplication: _s
          .extractXmlChild(elem, 'ExistingObjectReplication')
          ?.let(ExistingObjectReplication.fromXml),
      filter: _s
          .extractXmlChild(elem, 'Filter')
          ?.let(ReplicationRuleFilter.fromXml),
      id: _s.extractXmlStringValue(elem, 'ID'),
      prefix: _s.extractXmlStringValue(elem, 'Prefix'),
      priority: _s.extractXmlIntValue(elem, 'Priority'),
      sourceSelectionCriteria: _s
          .extractXmlChild(elem, 'SourceSelectionCriteria')
          ?.let(SourceSelectionCriteria.fromXml),
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
      tags: _s.extractXmlChild(elem, 'Tags')?.let(
          (elem) => elem.findElements('member').map(S3Tag.fromXml).toList()),
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
          ?.let(ReplicationRuleAndOperator.fromXml),
      prefix: _s.extractXmlStringValue(elem, 'Prefix'),
      tag: _s.extractXmlChild(elem, 'Tag')?.let(S3Tag.fromXml),
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
      grants: _s.extractXmlChild(elem, 'Grants')?.let(
          (elem) => elem.findElements('member').map(S3Grant.fromXml).toList()),
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
          ?.let(S3AccessControlList.fromXml),
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
          ?.let(StorageLensDataExportEncryption.fromXml),
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
  /// <p/> <note>
  /// This functionality is not supported by directory buckets.
  /// </note>
  final List<S3Grant>? accessControlGrants;

  /// Specifies whether Amazon S3 should use an S3 Bucket Key for object
  /// encryption with server-side encryption using Amazon Web Services KMS
  /// (SSE-KMS). Setting this header to <code>true</code> causes Amazon S3 to use
  /// an S3 Bucket Key for object encryption with SSE-KMS.
  ///
  /// Specifying this header with an <i>object</i> action doesn’t affect
  /// <i>bucket-level</i> settings for S3 Bucket Key.
  /// <note>
  /// This functionality is not supported by directory buckets.
  /// </note>
  final bool? bucketKeyEnabled;

  /// <p/> <note>
  /// This functionality is not supported by directory buckets.
  /// </note>
  final S3CannedAccessControlList? cannedAccessControlList;

  /// Indicates the algorithm that you want Amazon S3 to use to create the
  /// checksum. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html">
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

  /// Specifies a list of tags to add to the destination objects after they are
  /// copied. If <code>NewObjectTagging</code> is not specified, the tags of the
  /// source objects are copied to destination objects by default.
  /// <note>
  /// <b>Directory buckets</b> - Tags aren't supported by directory buckets. If
  /// your source objects have tags and your destination bucket is a directory
  /// bucket, specify an empty tag set in the <code>NewObjectTagging</code> field
  /// to prevent copying the source object tags to the directory bucket.
  /// </note>
  final List<S3Tag>? newObjectTagging;

  /// The legal hold status to be applied to all objects in the Batch Operations
  /// job.
  /// <note>
  /// This functionality is not supported by directory buckets.
  /// </note>
  final S3ObjectLockLegalHoldStatus? objectLockLegalHoldStatus;

  /// The retention mode to be applied to all objects in the Batch Operations job.
  /// <note>
  /// This functionality is not supported by directory buckets.
  /// </note>
  final S3ObjectLockMode? objectLockMode;

  /// The date when the applied object retention configuration expires on all
  /// objects in the Batch Operations job.
  /// <note>
  /// This functionality is not supported by directory buckets.
  /// </note>
  final DateTime? objectLockRetainUntilDate;

  /// If the destination bucket is configured as a website, specifies an optional
  /// metadata property for website redirects,
  /// <code>x-amz-website-redirect-location</code>. Allows webpage redirects if
  /// the object copy is accessed through a website endpoint.
  /// <note>
  /// This functionality is not supported by directory buckets.
  /// </note>
  final String? redirectLocation;

  /// <p/> <note>
  /// This functionality is not supported by directory buckets.
  /// </note>
  final bool? requesterPays;

  /// <p/> <note>
  /// This functionality is not supported by directory buckets.
  /// </note>
  final String? sSEAwsKmsKeyId;

  /// Specify the storage class for the destination objects in a <code>Copy</code>
  /// operation.
  /// <note>
  /// <b>Directory buckets </b> - This functionality is not supported by directory
  /// buckets.
  /// </note>
  final S3StorageClass? storageClass;

  /// Specifies the folder prefix that you want the objects to be copied into. For
  /// example, to copy objects into a folder named <code>Folder1</code> in the
  /// destination bucket, set the <code>TargetKeyPrefix</code> property to
  /// <code>Folder1</code>.
  final String? targetKeyPrefix;

  /// Specifies the destination bucket Amazon Resource Name (ARN) for the batch
  /// copy operation.
  ///
  /// <ul>
  /// <li>
  /// <b>General purpose buckets</b> - For example, to copy objects to a general
  /// purpose bucket named <code>destinationBucket</code>, set the
  /// <code>TargetResource</code> property to
  /// <code>arn:aws:s3:::destinationBucket</code>.
  /// </li>
  /// <li>
  /// <b>Directory buckets</b> - For example, to copy objects to a directory
  /// bucket named <code>destinationBucket</code> in the Availability Zone;
  /// identified by the AZ ID <code>usw2-az1</code>, set the
  /// <code>TargetResource</code> property to
  /// <code>arn:aws:s3express:<i>region</i>:<i>account_id</i>:/bucket/<i>destination_bucket_base_name</i>--<i>usw2-az1</i>--x-s3</code>.
  /// </li>
  /// </ul>
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
          (elem) => elem.findElements('member').map(S3Grant.fromXml).toList()),
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
          ?.let(S3ObjectMetadata.fromXml),
      newObjectTagging: _s.extractXmlChild(elem, 'NewObjectTagging')?.let(
          (elem) => elem.findElements('member').map(S3Tag.fromXml).toList()),
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
          ?.let(JobManifestLocation.fromXml),
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
      grantee: _s.extractXmlChild(elem, 'Grantee')?.let(S3Grantee.fromXml),
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
  /// <note>
  /// <b>Directory buckets</b> - Directory buckets aren't supported as the source
  /// buckets used by <code>S3JobManifestGenerator</code> to generate the job
  /// manifest.
  /// </note>
  final String sourceBucket;

  /// The Amazon Web Services account ID that owns the bucket the generated
  /// manifest is written to. If provided the generated manifest bucket's owner
  /// Amazon Web Services account ID must match this value, else the job fails.
  final String? expectedBucketOwner;

  /// Specifies rules the S3JobManifestGenerator should use to decide whether an
  /// object in the source bucket should or should not be included in the
  /// generated job manifest.
  final JobManifestGeneratorFilter? filter;

  /// Specifies the location the generated manifest will be written to. Manifests
  /// can't be written to directory buckets. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-buckets-overview.html">Directory
  /// buckets</a>.
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
          ?.let(JobManifestGeneratorFilter.fromXml),
      manifestOutputLocation: _s
          .extractXmlChild(elem, 'ManifestOutputLocation')
          ?.let(S3ManifestOutputLocation.fromXml),
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
  /// <note>
  /// <b>Directory buckets</b> - Directory buckets aren't supported as the buckets
  /// to store the generated manifest.
  /// </note>
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
          ?.let(GeneratedManifestEncryption.fromXml),
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

  /// <i>This member has been deprecated.</i>
  /// <p/>
  final int? contentLength;

  /// <i>This member has been deprecated.</i>
  /// <p/>
  final String? contentMD5;

  /// <p/>
  final String? contentType;

  /// <p/>
  final DateTime? httpExpiresDate;

  /// <i>This member has been deprecated.</i>
  /// <p/>
  final bool? requesterCharged;

  /// <p/> <note>
  /// For directory buckets, only the server-side encryption with Amazon S3
  /// managed keys (SSE-S3) (<code>AES256</code>) is supported.
  /// </note>
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

enum S3PrefixType {
  object,
}

extension S3PrefixTypeValueExtension on S3PrefixType {
  String toValue() {
    switch (this) {
      case S3PrefixType.object:
        return 'Object';
    }
  }
}

extension S3PrefixTypeFromString on String {
  S3PrefixType toS3PrefixType() {
    switch (this) {
      case 'Object':
        return S3PrefixType.object;
    }
    throw Exception('$this is not known in enum S3PrefixType');
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
          ?.let(S3AccessControlPolicy.fromXml),
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
/// <note>
/// This functionality is not supported by directory buckets.
/// </note>
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
/// <note>
/// This functionality is not supported by directory buckets.
/// </note>
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
      tagSet: _s.extractXmlChild(elem, 'TagSet')?.let(
          (elem) => elem.findElements('member').map(S3Tag.fromXml).toList()),
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
          ?.let(ReplicaModifications.fromXml),
      sseKmsEncryptedObjects: _s
          .extractXmlChild(elem, 'SseKmsEncryptedObjects')
          ?.let(SseKmsEncryptedObjects.fromXml),
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
      awsOrg:
          _s.extractXmlChild(elem, 'AwsOrg')?.let(StorageLensAwsOrg.fromXml),
      dataExport: _s
          .extractXmlChild(elem, 'DataExport')
          ?.let(StorageLensDataExport.fromXml),
      exclude: _s.extractXmlChild(elem, 'Exclude')?.let(Exclude.fromXml),
      include: _s.extractXmlChild(elem, 'Include')?.let(Include.fromXml),
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
          ?.let(CloudWatchMetrics.fromXml),
      s3BucketDestination: _s
          .extractXmlChild(elem, 'S3BucketDestination')
          ?.let(S3BucketDestination.fromXml),
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
      ssekms: _s.extractXmlChild(elem, 'SSE-KMS')?.let(SSEKMS.fromXml),
      sses3: _s.extractXmlChild(elem, 'SSE-S3')?.let(SSES3.fromXml),
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

/// A custom grouping of objects that include filters for prefixes, suffixes,
/// object tags, object size, or object age. You can create an S3 Storage Lens
/// group that includes a single filter or multiple filter conditions. To
/// specify multiple filter conditions, you use <code>AND</code> or
/// <code>OR</code> logical operators.
class StorageLensGroup {
  /// Sets the criteria for the Storage Lens group data that is displayed. For
  /// multiple filter conditions, the <code>AND</code> or <code>OR</code> logical
  /// operator is used.
  final StorageLensGroupFilter filter;

  /// Contains the name of the Storage Lens group.
  final String name;

  /// Contains the Amazon Resource Name (ARN) of the Storage Lens group. This
  /// property is read-only.
  final String? storageLensGroupArn;

  StorageLensGroup({
    required this.filter,
    required this.name,
    this.storageLensGroupArn,
  });
  factory StorageLensGroup.fromXml(_s.XmlElement elem) {
    return StorageLensGroup(
      filter:
          StorageLensGroupFilter.fromXml(_s.extractXmlChild(elem, 'Filter')!),
      name: _s.extractXmlStringValue(elem, 'Name')!,
      storageLensGroupArn:
          _s.extractXmlStringValue(elem, 'StorageLensGroupArn'),
    );
  }

  Map<String, dynamic> toJson() {
    final filter = this.filter;
    final name = this.name;
    final storageLensGroupArn = this.storageLensGroupArn;
    return {
      'Filter': filter,
      'Name': name,
      if (storageLensGroupArn != null)
        'StorageLensGroupArn': storageLensGroupArn,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final filter = this.filter;
    final name = this.name;
    final storageLensGroupArn = this.storageLensGroupArn;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Name', name),
      filter.toXml('Filter'),
      if (storageLensGroupArn != null)
        _s.encodeXmlStringValue('StorageLensGroupArn', storageLensGroupArn),
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

/// A logical operator that allows multiple filter conditions to be joined for
/// more complex comparisons of Storage Lens group data.
class StorageLensGroupAndOperator {
  /// Contains a list of prefixes. At least one prefix must be specified. Up to 10
  /// prefixes are allowed.
  final List<String>? matchAnyPrefix;

  /// Contains a list of suffixes. At least one suffix must be specified. Up to 10
  /// suffixes are allowed.
  final List<String>? matchAnySuffix;

  /// Contains the list of object tags. At least one object tag must be specified.
  /// Up to 10 object tags are allowed.
  final List<S3Tag>? matchAnyTag;

  /// Contains <code>DaysGreaterThan</code> and <code>DaysLessThan</code> to
  /// define the object age range (minimum and maximum number of days).
  final MatchObjectAge? matchObjectAge;

  /// Contains <code>BytesGreaterThan</code> and <code>BytesLessThan</code> to
  /// define the object size range (minimum and maximum number of Bytes).
  final MatchObjectSize? matchObjectSize;

  StorageLensGroupAndOperator({
    this.matchAnyPrefix,
    this.matchAnySuffix,
    this.matchAnyTag,
    this.matchObjectAge,
    this.matchObjectSize,
  });
  factory StorageLensGroupAndOperator.fromXml(_s.XmlElement elem) {
    return StorageLensGroupAndOperator(
      matchAnyPrefix: _s
          .extractXmlChild(elem, 'MatchAnyPrefix')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'Prefix')),
      matchAnySuffix: _s
          .extractXmlChild(elem, 'MatchAnySuffix')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'Suffix')),
      matchAnyTag: _s
          .extractXmlChild(elem, 'MatchAnyTag')
          ?.let((elem) => elem.findElements('Tag').map(S3Tag.fromXml).toList()),
      matchObjectAge: _s
          .extractXmlChild(elem, 'MatchObjectAge')
          ?.let(MatchObjectAge.fromXml),
      matchObjectSize: _s
          .extractXmlChild(elem, 'MatchObjectSize')
          ?.let(MatchObjectSize.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final matchAnyPrefix = this.matchAnyPrefix;
    final matchAnySuffix = this.matchAnySuffix;
    final matchAnyTag = this.matchAnyTag;
    final matchObjectAge = this.matchObjectAge;
    final matchObjectSize = this.matchObjectSize;
    return {
      if (matchAnyPrefix != null) 'MatchAnyPrefix': matchAnyPrefix,
      if (matchAnySuffix != null) 'MatchAnySuffix': matchAnySuffix,
      if (matchAnyTag != null) 'MatchAnyTag': matchAnyTag,
      if (matchObjectAge != null) 'MatchObjectAge': matchObjectAge,
      if (matchObjectSize != null) 'MatchObjectSize': matchObjectSize,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final matchAnyPrefix = this.matchAnyPrefix;
    final matchAnySuffix = this.matchAnySuffix;
    final matchAnyTag = this.matchAnyTag;
    final matchObjectAge = this.matchObjectAge;
    final matchObjectSize = this.matchObjectSize;
    final $children = <_s.XmlNode>[
      if (matchAnyPrefix != null)
        _s.XmlElement(_s.XmlName('MatchAnyPrefix'), [],
            matchAnyPrefix.map((e) => _s.encodeXmlStringValue('Prefix', e))),
      if (matchAnySuffix != null)
        _s.XmlElement(_s.XmlName('MatchAnySuffix'), [],
            matchAnySuffix.map((e) => _s.encodeXmlStringValue('Suffix', e))),
      if (matchAnyTag != null)
        _s.XmlElement(_s.XmlName('MatchAnyTag'), [],
            matchAnyTag.map((e) => e.toXml('Tag'))),
      if (matchObjectAge != null) matchObjectAge.toXml('MatchObjectAge'),
      if (matchObjectSize != null) matchObjectSize.toXml('MatchObjectSize'),
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

/// The filter element sets the criteria for the Storage Lens group data that is
/// displayed. For multiple filter conditions, the <code>AND</code> or
/// <code>OR</code> logical operator is used.
class StorageLensGroupFilter {
  /// A logical operator that allows multiple filter conditions to be joined for
  /// more complex comparisons of Storage Lens group data. Objects must match all
  /// of the listed filter conditions that are joined by the <code>And</code>
  /// logical operator. Only one of each filter condition is allowed.
  final StorageLensGroupAndOperator? and;

  /// Contains a list of prefixes. At least one prefix must be specified. Up to 10
  /// prefixes are allowed.
  final List<String>? matchAnyPrefix;

  /// Contains a list of suffixes. At least one suffix must be specified. Up to 10
  /// suffixes are allowed.
  final List<String>? matchAnySuffix;

  /// Contains the list of S3 object tags. At least one object tag must be
  /// specified. Up to 10 object tags are allowed.
  final List<S3Tag>? matchAnyTag;

  /// Contains <code>DaysGreaterThan</code> and <code>DaysLessThan</code> to
  /// define the object age range (minimum and maximum number of days).
  final MatchObjectAge? matchObjectAge;

  /// Contains <code>BytesGreaterThan</code> and <code>BytesLessThan</code> to
  /// define the object size range (minimum and maximum number of Bytes).
  final MatchObjectSize? matchObjectSize;

  /// A single logical operator that allows multiple filter conditions to be
  /// joined. Objects can match any of the listed filter conditions, which are
  /// joined by the <code>Or</code> logical operator. Only one of each filter
  /// condition is allowed.
  final StorageLensGroupOrOperator? or;

  StorageLensGroupFilter({
    this.and,
    this.matchAnyPrefix,
    this.matchAnySuffix,
    this.matchAnyTag,
    this.matchObjectAge,
    this.matchObjectSize,
    this.or,
  });
  factory StorageLensGroupFilter.fromXml(_s.XmlElement elem) {
    return StorageLensGroupFilter(
      and: _s
          .extractXmlChild(elem, 'And')
          ?.let(StorageLensGroupAndOperator.fromXml),
      matchAnyPrefix: _s
          .extractXmlChild(elem, 'MatchAnyPrefix')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'Prefix')),
      matchAnySuffix: _s
          .extractXmlChild(elem, 'MatchAnySuffix')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'Suffix')),
      matchAnyTag: _s
          .extractXmlChild(elem, 'MatchAnyTag')
          ?.let((elem) => elem.findElements('Tag').map(S3Tag.fromXml).toList()),
      matchObjectAge: _s
          .extractXmlChild(elem, 'MatchObjectAge')
          ?.let(MatchObjectAge.fromXml),
      matchObjectSize: _s
          .extractXmlChild(elem, 'MatchObjectSize')
          ?.let(MatchObjectSize.fromXml),
      or: _s
          .extractXmlChild(elem, 'Or')
          ?.let(StorageLensGroupOrOperator.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final and = this.and;
    final matchAnyPrefix = this.matchAnyPrefix;
    final matchAnySuffix = this.matchAnySuffix;
    final matchAnyTag = this.matchAnyTag;
    final matchObjectAge = this.matchObjectAge;
    final matchObjectSize = this.matchObjectSize;
    final or = this.or;
    return {
      if (and != null) 'And': and,
      if (matchAnyPrefix != null) 'MatchAnyPrefix': matchAnyPrefix,
      if (matchAnySuffix != null) 'MatchAnySuffix': matchAnySuffix,
      if (matchAnyTag != null) 'MatchAnyTag': matchAnyTag,
      if (matchObjectAge != null) 'MatchObjectAge': matchObjectAge,
      if (matchObjectSize != null) 'MatchObjectSize': matchObjectSize,
      if (or != null) 'Or': or,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final and = this.and;
    final matchAnyPrefix = this.matchAnyPrefix;
    final matchAnySuffix = this.matchAnySuffix;
    final matchAnyTag = this.matchAnyTag;
    final matchObjectAge = this.matchObjectAge;
    final matchObjectSize = this.matchObjectSize;
    final or = this.or;
    final $children = <_s.XmlNode>[
      if (matchAnyPrefix != null)
        _s.XmlElement(_s.XmlName('MatchAnyPrefix'), [],
            matchAnyPrefix.map((e) => _s.encodeXmlStringValue('Prefix', e))),
      if (matchAnySuffix != null)
        _s.XmlElement(_s.XmlName('MatchAnySuffix'), [],
            matchAnySuffix.map((e) => _s.encodeXmlStringValue('Suffix', e))),
      if (matchAnyTag != null)
        _s.XmlElement(_s.XmlName('MatchAnyTag'), [],
            matchAnyTag.map((e) => e.toXml('Tag'))),
      if (matchObjectAge != null) matchObjectAge.toXml('MatchObjectAge'),
      if (matchObjectSize != null) matchObjectSize.toXml('MatchObjectSize'),
      if (and != null) and.toXml('And'),
      if (or != null) or.toXml('Or'),
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

/// Specifies the Storage Lens groups to include in the Storage Lens group
/// aggregation.
class StorageLensGroupLevel {
  /// Indicates which Storage Lens group ARNs to include or exclude in the Storage
  /// Lens group aggregation. If this value is left null, then all Storage Lens
  /// groups are selected.
  final StorageLensGroupLevelSelectionCriteria? selectionCriteria;

  StorageLensGroupLevel({
    this.selectionCriteria,
  });
  factory StorageLensGroupLevel.fromXml(_s.XmlElement elem) {
    return StorageLensGroupLevel(
      selectionCriteria: _s
          .extractXmlChild(elem, 'SelectionCriteria')
          ?.let(StorageLensGroupLevelSelectionCriteria.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final selectionCriteria = this.selectionCriteria;
    return {
      if (selectionCriteria != null) 'SelectionCriteria': selectionCriteria,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final selectionCriteria = this.selectionCriteria;
    final $children = <_s.XmlNode>[
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

/// Indicates which Storage Lens group ARNs to include or exclude in the Storage
/// Lens group aggregation. You can only attach Storage Lens groups to your
/// Storage Lens dashboard if they're included in your Storage Lens group
/// aggregation. If this value is left null, then all Storage Lens groups are
/// selected.
class StorageLensGroupLevelSelectionCriteria {
  /// Indicates which Storage Lens group ARNs to exclude from the Storage Lens
  /// group aggregation.
  final List<String>? exclude;

  /// Indicates which Storage Lens group ARNs to include in the Storage Lens group
  /// aggregation.
  final List<String>? include;

  StorageLensGroupLevelSelectionCriteria({
    this.exclude,
    this.include,
  });
  factory StorageLensGroupLevelSelectionCriteria.fromXml(_s.XmlElement elem) {
    return StorageLensGroupLevelSelectionCriteria(
      exclude: _s
          .extractXmlChild(elem, 'Exclude')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'Arn')),
      include: _s
          .extractXmlChild(elem, 'Include')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'Arn')),
    );
  }

  Map<String, dynamic> toJson() {
    final exclude = this.exclude;
    final include = this.include;
    return {
      if (exclude != null) 'Exclude': exclude,
      if (include != null) 'Include': include,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final exclude = this.exclude;
    final include = this.include;
    final $children = <_s.XmlNode>[
      if (include != null)
        _s.XmlElement(_s.XmlName('Include'), [],
            include.map((e) => _s.encodeXmlStringValue('Arn', e))),
      if (exclude != null)
        _s.XmlElement(_s.XmlName('Exclude'), [],
            exclude.map((e) => _s.encodeXmlStringValue('Arn', e))),
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

/// A container element for specifying <code>Or</code> rule conditions. The rule
/// conditions determine the subset of objects to which the <code>Or</code> rule
/// applies. Objects can match any of the listed filter conditions, which are
/// joined by the <code>Or</code> logical operator. Only one of each filter
/// condition is allowed.
class StorageLensGroupOrOperator {
  /// Filters objects that match any of the specified prefixes.
  final List<String>? matchAnyPrefix;

  /// Filters objects that match any of the specified suffixes.
  final List<String>? matchAnySuffix;

  /// Filters objects that match any of the specified S3 object tags.
  final List<S3Tag>? matchAnyTag;

  /// Filters objects that match the specified object age range.
  final MatchObjectAge? matchObjectAge;

  /// Filters objects that match the specified object size range.
  final MatchObjectSize? matchObjectSize;

  StorageLensGroupOrOperator({
    this.matchAnyPrefix,
    this.matchAnySuffix,
    this.matchAnyTag,
    this.matchObjectAge,
    this.matchObjectSize,
  });
  factory StorageLensGroupOrOperator.fromXml(_s.XmlElement elem) {
    return StorageLensGroupOrOperator(
      matchAnyPrefix: _s
          .extractXmlChild(elem, 'MatchAnyPrefix')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'Prefix')),
      matchAnySuffix: _s
          .extractXmlChild(elem, 'MatchAnySuffix')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'Suffix')),
      matchAnyTag: _s
          .extractXmlChild(elem, 'MatchAnyTag')
          ?.let((elem) => elem.findElements('Tag').map(S3Tag.fromXml).toList()),
      matchObjectAge: _s
          .extractXmlChild(elem, 'MatchObjectAge')
          ?.let(MatchObjectAge.fromXml),
      matchObjectSize: _s
          .extractXmlChild(elem, 'MatchObjectSize')
          ?.let(MatchObjectSize.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final matchAnyPrefix = this.matchAnyPrefix;
    final matchAnySuffix = this.matchAnySuffix;
    final matchAnyTag = this.matchAnyTag;
    final matchObjectAge = this.matchObjectAge;
    final matchObjectSize = this.matchObjectSize;
    return {
      if (matchAnyPrefix != null) 'MatchAnyPrefix': matchAnyPrefix,
      if (matchAnySuffix != null) 'MatchAnySuffix': matchAnySuffix,
      if (matchAnyTag != null) 'MatchAnyTag': matchAnyTag,
      if (matchObjectAge != null) 'MatchObjectAge': matchObjectAge,
      if (matchObjectSize != null) 'MatchObjectSize': matchObjectSize,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final matchAnyPrefix = this.matchAnyPrefix;
    final matchAnySuffix = this.matchAnySuffix;
    final matchAnyTag = this.matchAnyTag;
    final matchObjectAge = this.matchObjectAge;
    final matchObjectSize = this.matchObjectSize;
    final $children = <_s.XmlNode>[
      if (matchAnyPrefix != null)
        _s.XmlElement(_s.XmlName('MatchAnyPrefix'), [],
            matchAnyPrefix.map((e) => _s.encodeXmlStringValue('Prefix', e))),
      if (matchAnySuffix != null)
        _s.XmlElement(_s.XmlName('MatchAnySuffix'), [],
            matchAnySuffix.map((e) => _s.encodeXmlStringValue('Suffix', e))),
      if (matchAnyTag != null)
        _s.XmlElement(_s.XmlName('MatchAnyTag'), [],
            matchAnyTag.map((e) => e.toXml('Tag'))),
      if (matchObjectAge != null) matchObjectAge.toXml('MatchObjectAge'),
      if (matchObjectSize != null) matchObjectSize.toXml('MatchObjectSize'),
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

/// An Amazon Web Services resource tag that's associated with your S3 resource.
/// You can add tags to new objects when you upload them, or you can add object
/// tags to existing objects.
/// <note>
/// This operation is only supported for <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage-lens-groups.html">S3
/// Storage Lens groups</a> and for <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/access-grants-tagging.html">S3
/// Access Grants</a>. The tagged resource can be an S3 Storage Lens group or S3
/// Access Grants instance, registered location, or grant.
/// </note>
class Tag {
  /// The key of the key-value pair of a tag added to your Amazon Web Services
  /// resource. A tag key can be up to 128 Unicode characters in length and is
  /// case-sensitive. System created tags that begin with <code>aws:</code> aren’t
  /// supported.
  final String key;

  /// The value of the key-value pair of a tag added to your Amazon Web Services
  /// resource. A tag value can be up to 256 Unicode characters in length and is
  /// case-sensitive.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });
  factory Tag.fromXml(_s.XmlElement elem) {
    return Tag(
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

class TagResourceRequest {
  /// The Amazon Web Services account ID that created the S3 resource that you're
  /// trying to add tags to or the requester's account ID.
  final String accountId;

  /// The Amazon Resource Name (ARN) of the S3 resource that you're trying to add
  /// tags to. The tagged resource can be an S3 Storage Lens group or S3 Access
  /// Grants instance, registered location, or grant.
  final String resourceArn;

  /// The Amazon Web Services resource tags that you want to add to the specified
  /// S3 resource.
  final List<Tag> tags;

  TagResourceRequest({
    required this.accountId,
    required this.resourceArn,
    required this.tags,
  });

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final resourceArn = this.resourceArn;
    final tags = this.tags;
    return {
      'Tags': tags,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final accountId = this.accountId;
    final resourceArn = this.resourceArn;
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

class TagResourceResult {
  TagResourceResult();
  factory TagResourceResult.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return TagResourceResult();
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

class UntagResourceResult {
  UntagResourceResult();
  factory UntagResourceResult.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return UntagResourceResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateAccessGrantsLocationRequest {
  /// The ID of the registered location that you are updating. S3 Access Grants
  /// assigns this ID when you register the location. S3 Access Grants assigns the
  /// ID <code>default</code> to the default location <code>s3://</code> and
  /// assigns an auto-generated ID to other locations that you register.
  ///
  /// The ID of the registered location to which you are granting access. S3
  /// Access Grants assigned this ID when you registered the location. S3 Access
  /// Grants assigns the ID <code>default</code> to the default location
  /// <code>s3://</code> and assigns an auto-generated ID to other locations that
  /// you register.
  ///
  /// If you are passing the <code>default</code> location, you cannot create an
  /// access grant for the entire default location. You must also specify a bucket
  /// or a bucket and prefix in the <code>Subprefix</code> field.
  final String accessGrantsLocationId;

  /// The ID of the Amazon Web Services account that is making this request.
  final String accountId;

  /// The Amazon Resource Name (ARN) of the IAM role for the registered location.
  /// S3 Access Grants assumes this role to manage access to the registered
  /// location.
  final String iAMRoleArn;

  UpdateAccessGrantsLocationRequest({
    required this.accessGrantsLocationId,
    required this.accountId,
    required this.iAMRoleArn,
  });

  Map<String, dynamic> toJson() {
    final accessGrantsLocationId = this.accessGrantsLocationId;
    final accountId = this.accountId;
    final iAMRoleArn = this.iAMRoleArn;
    return {
      'IAMRoleArn': iAMRoleArn,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final accessGrantsLocationId = this.accessGrantsLocationId;
    final accountId = this.accountId;
    final iAMRoleArn = this.iAMRoleArn;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('IAMRoleArn', iAMRoleArn),
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

class UpdateAccessGrantsLocationResult {
  /// The Amazon Resource Name (ARN) of the registered location that you are
  /// updating.
  final String? accessGrantsLocationArn;

  /// The ID of the registered location to which you are granting access. S3
  /// Access Grants assigned this ID when you registered the location. S3 Access
  /// Grants assigns the ID <code>default</code> to the default location
  /// <code>s3://</code> and assigns an auto-generated ID to other locations that
  /// you register.
  final String? accessGrantsLocationId;

  /// The date and time when you registered the location.
  final DateTime? createdAt;

  /// The Amazon Resource Name (ARN) of the IAM role of the registered location.
  /// S3 Access Grants assumes this role to manage access to the registered
  /// location.
  final String? iAMRoleArn;

  /// The S3 URI path of the location that you are updating. You cannot update the
  /// scope of the registered location. The location scope can be the default S3
  /// location <code>s3://</code>, the S3 path to a bucket
  /// <code>s3://&lt;bucket&gt;</code>, or the S3 path to a bucket and prefix
  /// <code>s3://&lt;bucket&gt;/&lt;prefix&gt;</code>.
  final String? locationScope;

  UpdateAccessGrantsLocationResult({
    this.accessGrantsLocationArn,
    this.accessGrantsLocationId,
    this.createdAt,
    this.iAMRoleArn,
    this.locationScope,
  });
  factory UpdateAccessGrantsLocationResult.fromXml(_s.XmlElement elem) {
    return UpdateAccessGrantsLocationResult(
      accessGrantsLocationArn:
          _s.extractXmlStringValue(elem, 'AccessGrantsLocationArn'),
      accessGrantsLocationId:
          _s.extractXmlStringValue(elem, 'AccessGrantsLocationId'),
      createdAt: _s.extractXmlDateTimeValue(elem, 'CreatedAt'),
      iAMRoleArn: _s.extractXmlStringValue(elem, 'IAMRoleArn'),
      locationScope: _s.extractXmlStringValue(elem, 'LocationScope'),
    );
  }

  Map<String, dynamic> toJson() {
    final accessGrantsLocationArn = this.accessGrantsLocationArn;
    final accessGrantsLocationId = this.accessGrantsLocationId;
    final createdAt = this.createdAt;
    final iAMRoleArn = this.iAMRoleArn;
    final locationScope = this.locationScope;
    return {
      if (accessGrantsLocationArn != null)
        'AccessGrantsLocationArn': accessGrantsLocationArn,
      if (accessGrantsLocationId != null)
        'AccessGrantsLocationId': accessGrantsLocationId,
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (iAMRoleArn != null) 'IAMRoleArn': iAMRoleArn,
      if (locationScope != null) 'LocationScope': locationScope,
    };
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

class UpdateStorageLensGroupRequest {
  /// The Amazon Web Services account ID of the Storage Lens group owner.
  final String accountId;

  /// The name of the Storage Lens group that you want to update.
  final String name;

  /// The JSON file that contains the Storage Lens group configuration.
  final StorageLensGroup storageLensGroup;

  UpdateStorageLensGroupRequest({
    required this.accountId,
    required this.name,
    required this.storageLensGroup,
  });

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final name = this.name;
    final storageLensGroup = this.storageLensGroup;
    return {
      'StorageLensGroup': storageLensGroup,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final accountId = this.accountId;
    final name = this.name;
    final storageLensGroup = this.storageLensGroup;
    final $children = <_s.XmlNode>[
      storageLensGroup.toXml('StorageLensGroup'),
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
