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

/// <p/>
class S3 {
  final _s.RestXmlProtocol _protocol;
  S3({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestXmlProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 's3',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// This operation aborts a multipart upload. After a multipart upload is
  /// aborted, no additional parts can be uploaded using that upload ID. The
  /// storage consumed by any previously uploaded parts will be freed. However,
  /// if any part uploads are currently in progress, those part uploads might or
  /// might not succeed. As a result, it might be necessary to abort a given
  /// multipart upload multiple times in order to completely free all storage
  /// consumed by all parts.
  ///
  /// To verify that all parts have been removed, so you don't get charged for
  /// the part storage, you should call the <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListParts.html">ListParts</a>
  /// operation and ensure that the parts list is empty.
  ///
  /// For information about permissions required to use the multipart upload
  /// API, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuAndPermissions.html">Multipart
  /// Upload API and Permissions</a>.
  ///
  /// The following operations are related to <code>AbortMultipartUpload</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateMultipartUpload.html">CreateMultipartUpload</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPart.html">UploadPart</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CompleteMultipartUpload.html">CompleteMultipartUpload</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListParts.html">ListParts</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListMultipartUploads.html">ListMultipartUploads</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [NoSuchUpload].
  ///
  /// Parameter [bucket] :
  /// The bucket name to which the upload was taking place.
  ///
  /// When using this API with an access point, you must direct requests to the
  /// access point hostname. The access point hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com.
  /// When using this operation with an access point through the AWS SDKs, you
  /// provide the access point ARN in place of the bucket name. For more
  /// information about access point ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using
  /// Access Points</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// When using this API with Amazon S3 on Outposts, you must direct requests
  /// to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com.
  /// When using this operation using S3 on Outposts through the AWS SDKs, you
  /// provide the Outposts bucket ARN in place of the bucket name. For more
  /// information about S3 on Outposts ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using
  /// S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// Parameter [key] :
  /// Key of the object for which the multipart upload was initiated.
  ///
  /// Parameter [uploadId] :
  /// Upload ID that identifies the multipart upload.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<AbortMultipartUploadOutput> abortMultipartUpload({
    @_s.required String bucket,
    @_s.required String key,
    @_s.required String uploadId,
    String expectedBucketOwner,
    RequestPayer requestPayer,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    ArgumentError.checkNotNull(key, 'key');
    _s.validateStringLength(
      'key',
      key,
      1,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(uploadId, 'uploadId');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    requestPayer?.let((v) => headers['x-amz-request-payer'] = v.toValue());
    final $query = <String, List<String>>{
      if (uploadId != null) 'uploadId': [uploadId],
    };
    final $result = await _protocol.sendRaw(
      method: 'DELETE',
      requestUri:
          '/${Uri.encodeComponent(bucket)}/${key.split('/').map(Uri.encodeComponent).join('/')}',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return AbortMultipartUploadOutput(
      requestCharged: _s
          .extractHeaderStringValue($result.headers, 'x-amz-request-charged')
          ?.toRequestCharged(),
    );
  }

  /// Completes a multipart upload by assembling previously uploaded parts.
  ///
  /// You first initiate the multipart upload and then upload all parts using
  /// the <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPart.html">UploadPart</a>
  /// operation. After successfully uploading all relevant parts of an upload,
  /// you call this operation to complete the upload. Upon receiving this
  /// request, Amazon S3 concatenates all the parts in ascending order by part
  /// number to create a new object. In the Complete Multipart Upload request,
  /// you must provide the parts list. You must ensure that the parts list is
  /// complete. This operation concatenates the parts that you provide in the
  /// list. For each part in the list, you must provide the part number and the
  /// <code>ETag</code> value, returned after that part was uploaded.
  ///
  /// Processing of a Complete Multipart Upload request could take several
  /// minutes to complete. After Amazon S3 begins processing the request, it
  /// sends an HTTP response header that specifies a 200 OK response. While
  /// processing is in progress, Amazon S3 periodically sends white space
  /// characters to keep the connection from timing out. Because a request could
  /// fail after the initial 200 OK response has been sent, it is important that
  /// you check the response body to determine whether the request succeeded.
  ///
  /// Note that if <code>CompleteMultipartUpload</code> fails, applications
  /// should be prepared to retry the failed requests. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/ErrorBestPractices.html">Amazon
  /// S3 Error Best Practices</a>.
  ///
  /// For more information about multipart uploads, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/uploadobjusingmpu.html">Uploading
  /// Objects Using Multipart Upload</a>.
  ///
  /// For information about permissions required to use the multipart upload
  /// API, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuAndPermissions.html">Multipart
  /// Upload API and Permissions</a>.
  ///
  /// <code>CompleteMultipartUpload</code> has the following special errors:
  ///
  /// <ul>
  /// <li>
  /// Error code: <code>EntityTooSmall</code>
  ///
  /// <ul>
  /// <li>
  /// Description: Your proposed upload is smaller than the minimum allowed
  /// object size. Each part must be at least 5 MB in size, except the last
  /// part.
  /// </li>
  /// <li>
  /// 400 Bad Request
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Error code: <code>InvalidPart</code>
  ///
  /// <ul>
  /// <li>
  /// Description: One or more of the specified parts could not be found. The
  /// part might not have been uploaded, or the specified entity tag might not
  /// have matched the part's entity tag.
  /// </li>
  /// <li>
  /// 400 Bad Request
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Error code: <code>InvalidPartOrder</code>
  ///
  /// <ul>
  /// <li>
  /// Description: The list of parts was not in ascending order. The parts list
  /// must be specified in order by part number.
  /// </li>
  /// <li>
  /// 400 Bad Request
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Error code: <code>NoSuchUpload</code>
  ///
  /// <ul>
  /// <li>
  /// Description: The specified multipart upload does not exist. The upload ID
  /// might be invalid, or the multipart upload might have been aborted or
  /// completed.
  /// </li>
  /// <li>
  /// 404 Not Found
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// The following operations are related to
  /// <code>CompleteMultipartUpload</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateMultipartUpload.html">CreateMultipartUpload</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPart.html">UploadPart</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_AbortMultipartUpload.html">AbortMultipartUpload</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListParts.html">ListParts</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListMultipartUploads.html">ListMultipartUploads</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// Name of the bucket to which the multipart upload was initiated.
  ///
  /// Parameter [key] :
  /// Object key for which the multipart upload was initiated.
  ///
  /// Parameter [uploadId] :
  /// ID for the initiated multipart upload.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  ///
  /// Parameter [multipartUpload] :
  /// The container for the multipart upload request information.
  Future<CompleteMultipartUploadOutput> completeMultipartUpload({
    @_s.required String bucket,
    @_s.required String key,
    @_s.required String uploadId,
    String expectedBucketOwner,
    CompletedMultipartUpload multipartUpload,
    RequestPayer requestPayer,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    ArgumentError.checkNotNull(key, 'key');
    _s.validateStringLength(
      'key',
      key,
      1,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(uploadId, 'uploadId');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    requestPayer?.let((v) => headers['x-amz-request-payer'] = v.toValue());
    final $query = <String, List<String>>{
      if (uploadId != null) 'uploadId': [uploadId],
    };
    final $result = await _protocol.sendRaw(
      method: 'POST',
      requestUri:
          '/${Uri.encodeComponent(bucket)}/${key.split('/').map(Uri.encodeComponent).join('/')}',
      queryParams: $query,
      headers: headers,
      payload: multipartUpload?.toXml('MultipartUpload'),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return CompleteMultipartUploadOutput(
      bucket: _s.extractXmlStringValue($elem, 'Bucket'),
      eTag: _s.extractXmlStringValue($elem, 'ETag'),
      key: _s.extractXmlStringValue($elem, 'Key'),
      location: _s.extractXmlStringValue($elem, 'Location'),
      bucketKeyEnabled: _s.extractHeaderBoolValue(
          $result.headers, 'x-amz-server-side-encryption-bucket-key-enabled'),
      expiration:
          _s.extractHeaderStringValue($result.headers, 'x-amz-expiration'),
      requestCharged: _s
          .extractHeaderStringValue($result.headers, 'x-amz-request-charged')
          ?.toRequestCharged(),
      sSEKMSKeyId: _s.extractHeaderStringValue(
          $result.headers, 'x-amz-server-side-encryption-aws-kms-key-id'),
      serverSideEncryption: _s
          .extractHeaderStringValue(
              $result.headers, 'x-amz-server-side-encryption')
          ?.toServerSideEncryption(),
      versionId:
          _s.extractHeaderStringValue($result.headers, 'x-amz-version-id'),
    );
  }

  /// Creates a copy of an object that is already stored in Amazon S3.
  /// <note>
  /// You can store individual objects of up to 5 TB in Amazon S3. You create a
  /// copy of your object up to 5 GB in size in a single atomic operation using
  /// this API. However, to copy an object greater than 5 GB, you must use the
  /// multipart upload Upload Part - Copy API. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/CopyingObjctsUsingRESTMPUapi.html">Copy
  /// Object Using the REST Multipart Upload API</a>.
  /// </note>
  /// All copy requests must be authenticated. Additionally, you must have
  /// <i>read</i> access to the source object and <i>write</i> access to the
  /// destination bucket. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/RESTAuthentication.html">REST
  /// Authentication</a>. Both the Region that you want to copy the object from
  /// and the Region that you want to copy the object to must be enabled for
  /// your account.
  ///
  /// A copy request might return an error when Amazon S3 receives the copy
  /// request or while Amazon S3 is copying the files. If the error occurs
  /// before the copy operation starts, you receive a standard Amazon S3 error.
  /// If the error occurs during the copy operation, the error response is
  /// embedded in the <code>200 OK</code> response. This means that a <code>200
  /// OK</code> response can contain either a success or an error. Design your
  /// application to parse the contents of the response and handle it
  /// appropriately.
  ///
  /// If the copy is successful, you receive a response with information about
  /// the copied object.
  /// <note>
  /// If the request is an HTTP 1.1 request, the response is chunk encoded. If
  /// it were not, it would not contain the content-length, and you would need
  /// to read the entire body.
  /// </note>
  /// The copy request charge is based on the storage class and Region that you
  /// specify for the destination object. For pricing information, see <a
  /// href="https://aws.amazon.com/s3/pricing/">Amazon S3 pricing</a>.
  /// <important>
  /// Amazon S3 transfer acceleration does not support cross-Region copies. If
  /// you request a cross-Region copy using a transfer acceleration endpoint,
  /// you get a 400 <code>Bad Request</code> error. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/transfer-acceleration.html">Transfer
  /// Acceleration</a>.
  /// </important>
  /// <b>Metadata</b>
  ///
  /// When copying an object, you can preserve all metadata (default) or specify
  /// new metadata. However, the ACL is not preserved and is set to private for
  /// the user making the request. To override the default ACL setting, specify
  /// a new ACL when generating a copy request. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3_ACLs_UsingACLs.html">Using
  /// ACLs</a>.
  ///
  /// To specify whether you want the object metadata copied from the source
  /// object or replaced with metadata provided in the request, you can
  /// optionally add the <code>x-amz-metadata-directive</code> header. When you
  /// grant permissions, you can use the
  /// <code>s3:x-amz-metadata-directive</code> condition key to enforce certain
  /// metadata behavior when objects are uploaded. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/amazon-s3-policy-keys.html">Specifying
  /// Conditions in a Policy</a> in the <i>Amazon S3 Developer Guide</i>. For a
  /// complete list of Amazon S3-specific condition keys, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/list_amazons3.html">Actions,
  /// Resources, and Condition Keys for Amazon S3</a>.
  ///
  /// <b> <code>x-amz-copy-source-if</code> Headers</b>
  ///
  /// To only copy an object under certain conditions, such as whether the
  /// <code>Etag</code> matches or whether the object was modified before or
  /// after a specified date, use the following request parameters:
  ///
  /// <ul>
  /// <li>
  /// <code>x-amz-copy-source-if-match</code>
  /// </li>
  /// <li>
  /// <code>x-amz-copy-source-if-none-match</code>
  /// </li>
  /// <li>
  /// <code>x-amz-copy-source-if-unmodified-since</code>
  /// </li>
  /// <li>
  /// <code>x-amz-copy-source-if-modified-since</code>
  /// </li>
  /// </ul>
  /// If both the <code>x-amz-copy-source-if-match</code> and
  /// <code>x-amz-copy-source-if-unmodified-since</code> headers are present in
  /// the request and evaluate as follows, Amazon S3 returns <code>200 OK</code>
  /// and copies the data:
  ///
  /// <ul>
  /// <li>
  /// <code>x-amz-copy-source-if-match</code> condition evaluates to true
  /// </li>
  /// <li>
  /// <code>x-amz-copy-source-if-unmodified-since</code> condition evaluates to
  /// false
  /// </li>
  /// </ul>
  /// If both the <code>x-amz-copy-source-if-none-match</code> and
  /// <code>x-amz-copy-source-if-modified-since</code> headers are present in
  /// the request and evaluate as follows, Amazon S3 returns the <code>412
  /// Precondition Failed</code> response code:
  ///
  /// <ul>
  /// <li>
  /// <code>x-amz-copy-source-if-none-match</code> condition evaluates to false
  /// </li>
  /// <li>
  /// <code>x-amz-copy-source-if-modified-since</code> condition evaluates to
  /// true
  /// </li>
  /// </ul> <note>
  /// All headers with the <code>x-amz-</code> prefix, including
  /// <code>x-amz-copy-source</code>, must be signed.
  /// </note>
  /// <b>Server-side encryption</b>
  ///
  /// When you perform a CopyObject operation, you can optionally use the
  /// appropriate encryption-related headers to encrypt the object using
  /// server-side encryption with AWS managed encryption keys (SSE-S3 or
  /// SSE-KMS) or a customer-provided encryption key. With server-side
  /// encryption, Amazon S3 encrypts your data as it writes it to disks in its
  /// data centers and decrypts the data when you access it. For more
  /// information about server-side encryption, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/serv-side-encryption.html">Using
  /// Server-Side Encryption</a>.
  ///
  /// If a target object uses SSE-KMS, you can enable an S3 Bucket Key for the
  /// object. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/bucket-key.html">Amazon
  /// S3 Bucket Keys</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// <b>Access Control List (ACL)-Specific Request Headers</b>
  ///
  /// When copying an object, you can optionally use headers to grant ACL-based
  /// permissions. By default, all objects are private. Only the owner has full
  /// access control. When adding a new object, you can grant permissions to
  /// individual AWS accounts or to predefined groups defined by Amazon S3.
  /// These permissions are then added to the ACL on the object. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html">Access
  /// Control List (ACL) Overview</a> and <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-using-rest-api.html">Managing
  /// ACLs Using the REST API</a>.
  ///
  /// <b>Storage Class Options</b>
  ///
  /// You can use the <code>CopyObject</code> operation to change the storage
  /// class of an object that is already stored in Amazon S3 using the
  /// <code>StorageClass</code> parameter. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-class-intro.html">Storage
  /// Classes</a> in the <i>Amazon S3 Service Developer Guide</i>.
  ///
  /// <b>Versioning</b>
  ///
  /// By default, <code>x-amz-copy-source</code> identifies the current version
  /// of an object to copy. If the current version is a delete marker, Amazon S3
  /// behaves as if the object was deleted. To copy a different version, use the
  /// <code>versionId</code> subresource.
  ///
  /// If you enable versioning on the target bucket, Amazon S3 generates a
  /// unique version ID for the object being copied. This version ID is
  /// different from the version ID of the source object. Amazon S3 returns the
  /// version ID of the copied object in the <code>x-amz-version-id</code>
  /// response header in the response.
  ///
  /// If you do not enable versioning or suspend it on the target bucket, the
  /// version ID that Amazon S3 generates is always null.
  ///
  /// If the source object's storage class is GLACIER, you must restore a copy
  /// of this object before you can use it as a source object for the copy
  /// operation. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_RestoreObject.html">RestoreObject</a>.
  ///
  /// The following operations are related to <code>CopyObject</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutObject.html">PutObject</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html">GetObject</a>
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/CopyingObjectsExamples.html">Copying
  /// Objects</a>.
  ///
  /// May throw [ObjectNotInActiveTierError].
  ///
  /// Parameter [bucket] :
  /// The name of the destination bucket.
  ///
  /// When using this API with an access point, you must direct requests to the
  /// access point hostname. The access point hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com.
  /// When using this operation with an access point through the AWS SDKs, you
  /// provide the access point ARN in place of the bucket name. For more
  /// information about access point ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using
  /// Access Points</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// When using this API with Amazon S3 on Outposts, you must direct requests
  /// to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com.
  /// When using this operation using S3 on Outposts through the AWS SDKs, you
  /// provide the Outposts bucket ARN in place of the bucket name. For more
  /// information about S3 on Outposts ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using
  /// S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// Parameter [copySource] :
  /// Specifies the source object for the copy operation. You specify the value
  /// in one of two formats, depending on whether you want to access the source
  /// object through an <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-points.html">access
  /// point</a>:
  ///
  /// <ul>
  /// <li>
  /// For objects not accessed through an access point, specify the name of the
  /// source bucket and the key of the source object, separated by a slash (/).
  /// For example, to copy the object <code>reports/january.pdf</code> from the
  /// bucket <code>awsexamplebucket</code>, use
  /// <code>awsexamplebucket/reports/january.pdf</code>. The value must be URL
  /// encoded.
  /// </li>
  /// <li>
  /// For objects accessed through access points, specify the Amazon Resource
  /// Name (ARN) of the object as accessed through the access point, in the
  /// format
  /// <code>arn:aws:s3:&lt;Region&gt;:&lt;account-id&gt;:accesspoint/&lt;access-point-name&gt;/object/&lt;key&gt;</code>.
  /// For example, to copy the object <code>reports/january.pdf</code> through
  /// access point <code>my-access-point</code> owned by account
  /// <code>123456789012</code> in Region <code>us-west-2</code>, use the URL
  /// encoding of
  /// <code>arn:aws:s3:us-west-2:123456789012:accesspoint/my-access-point/object/reports/january.pdf</code>.
  /// The value must be URL encoded.
  /// <note>
  /// Amazon S3 supports copy operations using access points only when the
  /// source and destination buckets are in the same AWS Region.
  /// </note>
  /// Alternatively, for objects accessed through Amazon S3 on Outposts, specify
  /// the ARN of the object as accessed in the format
  /// <code>arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/object/&lt;key&gt;</code>.
  /// For example, to copy the object <code>reports/january.pdf</code> through
  /// outpost <code>my-outpost</code> owned by account <code>123456789012</code>
  /// in Region <code>us-west-2</code>, use the URL encoding of
  /// <code>arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/object/reports/january.pdf</code>.
  /// The value must be URL encoded.
  /// </li>
  /// </ul>
  /// To copy a specific version of an object, append
  /// <code>?versionId=&lt;version-id&gt;</code> to the value (for example,
  /// <code>awsexamplebucket/reports/january.pdf?versionId=QUpfdndhfd8438MNFDN93jdnJFkdmqnh893</code>).
  /// If you don't specify a version ID, Amazon S3 copies the latest version of
  /// the source object.
  ///
  /// Parameter [key] :
  /// The key of the destination object.
  ///
  /// Parameter [acl] :
  /// The canned ACL to apply to the object.
  ///
  /// This action is not supported by Amazon S3 on Outposts.
  ///
  /// Parameter [bucketKeyEnabled] :
  /// Specifies whether Amazon S3 should use an S3 Bucket Key for object
  /// encryption with server-side encryption using AWS KMS (SSE-KMS). Setting
  /// this header to <code>true</code> causes Amazon S3 to use an S3 Bucket Key
  /// for object encryption with SSE-KMS.
  ///
  /// Specifying this header with a COPY operation doesn’t affect bucket-level
  /// settings for S3 Bucket Key.
  ///
  /// Parameter [cacheControl] :
  /// Specifies caching behavior along the request/reply chain.
  ///
  /// Parameter [contentDisposition] :
  /// Specifies presentational information for the object.
  ///
  /// Parameter [contentEncoding] :
  /// Specifies what content encodings have been applied to the object and thus
  /// what decoding mechanisms must be applied to obtain the media-type
  /// referenced by the Content-Type header field.
  ///
  /// Parameter [contentLanguage] :
  /// The language the content is in.
  ///
  /// Parameter [contentType] :
  /// A standard MIME type describing the format of the object data.
  ///
  /// Parameter [copySourceIfMatch] :
  /// Copies the object if its entity tag (ETag) matches the specified tag.
  ///
  /// Parameter [copySourceIfModifiedSince] :
  /// Copies the object if it has been modified since the specified time.
  ///
  /// Parameter [copySourceIfNoneMatch] :
  /// Copies the object if its entity tag (ETag) is different than the specified
  /// ETag.
  ///
  /// Parameter [copySourceIfUnmodifiedSince] :
  /// Copies the object if it hasn't been modified since the specified time.
  ///
  /// Parameter [copySourceSSECustomerAlgorithm] :
  /// Specifies the algorithm to use when decrypting the source object (for
  /// example, AES256).
  ///
  /// Parameter [copySourceSSECustomerKey] :
  /// Specifies the customer-provided encryption key for Amazon S3 to use to
  /// decrypt the source object. The encryption key provided in this header must
  /// be one that was used when the source object was created.
  ///
  /// Parameter [copySourceSSECustomerKeyMD5] :
  /// Specifies the 128-bit MD5 digest of the encryption key according to RFC
  /// 1321. Amazon S3 uses this header for a message integrity check to ensure
  /// that the encryption key was transmitted without error.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected destination bucket owner. If the
  /// destination bucket is owned by a different account, the request will fail
  /// with an HTTP <code>403 (Access Denied)</code> error.
  ///
  /// Parameter [expectedSourceBucketOwner] :
  /// The account id of the expected source bucket owner. If the source bucket
  /// is owned by a different account, the request will fail with an HTTP
  /// <code>403 (Access Denied)</code> error.
  ///
  /// Parameter [expires] :
  /// The date and time at which the object is no longer cacheable.
  ///
  /// Parameter [grantFullControl] :
  /// Gives the grantee READ, READ_ACP, and WRITE_ACP permissions on the object.
  ///
  /// This action is not supported by Amazon S3 on Outposts.
  ///
  /// Parameter [grantRead] :
  /// Allows grantee to read the object data and its metadata.
  ///
  /// This action is not supported by Amazon S3 on Outposts.
  ///
  /// Parameter [grantReadACP] :
  /// Allows grantee to read the object ACL.
  ///
  /// This action is not supported by Amazon S3 on Outposts.
  ///
  /// Parameter [grantWriteACP] :
  /// Allows grantee to write the ACL for the applicable object.
  ///
  /// This action is not supported by Amazon S3 on Outposts.
  ///
  /// Parameter [metadata] :
  /// A map of metadata to store with the object in S3.
  ///
  /// Parameter [metadataDirective] :
  /// Specifies whether the metadata is copied from the source object or
  /// replaced with metadata provided in the request.
  ///
  /// Parameter [objectLockLegalHoldStatus] :
  /// Specifies whether you want to apply a Legal Hold to the copied object.
  ///
  /// Parameter [objectLockMode] :
  /// The Object Lock mode that you want to apply to the copied object.
  ///
  /// Parameter [objectLockRetainUntilDate] :
  /// The date and time when you want the copied object's Object Lock to expire.
  ///
  /// Parameter [sSECustomerAlgorithm] :
  /// Specifies the algorithm to use to when encrypting the object (for example,
  /// AES256).
  ///
  /// Parameter [sSECustomerKey] :
  /// Specifies the customer-provided encryption key for Amazon S3 to use in
  /// encrypting data. This value is used to store the object and then it is
  /// discarded; Amazon S3 does not store the encryption key. The key must be
  /// appropriate for use with the algorithm specified in the
  /// <code>x-amz-server-side-encryption-customer-algorithm</code> header.
  ///
  /// Parameter [sSECustomerKeyMD5] :
  /// Specifies the 128-bit MD5 digest of the encryption key according to RFC
  /// 1321. Amazon S3 uses this header for a message integrity check to ensure
  /// that the encryption key was transmitted without error.
  ///
  /// Parameter [sSEKMSEncryptionContext] :
  /// Specifies the AWS KMS Encryption Context to use for object encryption. The
  /// value of this header is a base64-encoded UTF-8 string holding JSON with
  /// the encryption context key-value pairs.
  ///
  /// Parameter [sSEKMSKeyId] :
  /// Specifies the AWS KMS key ID to use for object encryption. All GET and PUT
  /// requests for an object protected by AWS KMS will fail if not made via SSL
  /// or using SigV4. For information about configuring using any of the
  /// officially supported AWS SDKs and AWS CLI, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingAWSSDK.html#specify-signature-version">Specifying
  /// the Signature Version in Request Authentication</a> in the <i>Amazon S3
  /// Developer Guide</i>.
  ///
  /// Parameter [serverSideEncryption] :
  /// The server-side encryption algorithm used when storing this object in
  /// Amazon S3 (for example, AES256, aws:kms).
  ///
  /// Parameter [storageClass] :
  /// By default, Amazon S3 uses the STANDARD Storage Class to store newly
  /// created objects. The STANDARD storage class provides high durability and
  /// high availability. Depending on performance needs, you can specify a
  /// different Storage Class. Amazon S3 on Outposts only uses the OUTPOSTS
  /// Storage Class. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-class-intro.html">Storage
  /// Classes</a> in the <i>Amazon S3 Service Developer Guide</i>.
  ///
  /// Parameter [tagging] :
  /// The tag-set for the object destination object this value must be used in
  /// conjunction with the <code>TaggingDirective</code>. The tag-set must be
  /// encoded as URL Query parameters.
  ///
  /// Parameter [taggingDirective] :
  /// Specifies whether the object tag-set are copied from the source object or
  /// replaced with tag-set provided in the request.
  ///
  /// Parameter [websiteRedirectLocation] :
  /// If the bucket is configured as a website, redirects requests for this
  /// object to another object in the same bucket or to an external URL. Amazon
  /// S3 stores the value of this header in the object metadata.
  Future<CopyObjectOutput> copyObject({
    @_s.required String bucket,
    @_s.required String copySource,
    @_s.required String key,
    ObjectCannedACL acl,
    bool bucketKeyEnabled,
    String cacheControl,
    String contentDisposition,
    String contentEncoding,
    String contentLanguage,
    String contentType,
    String copySourceIfMatch,
    DateTime copySourceIfModifiedSince,
    String copySourceIfNoneMatch,
    DateTime copySourceIfUnmodifiedSince,
    String copySourceSSECustomerAlgorithm,
    Uint8List copySourceSSECustomerKey,
    String copySourceSSECustomerKeyMD5,
    String expectedBucketOwner,
    String expectedSourceBucketOwner,
    DateTime expires,
    String grantFullControl,
    String grantRead,
    String grantReadACP,
    String grantWriteACP,
    Map<String, String> metadata,
    MetadataDirective metadataDirective,
    ObjectLockLegalHoldStatus objectLockLegalHoldStatus,
    ObjectLockMode objectLockMode,
    DateTime objectLockRetainUntilDate,
    RequestPayer requestPayer,
    String sSECustomerAlgorithm,
    Uint8List sSECustomerKey,
    String sSECustomerKeyMD5,
    String sSEKMSEncryptionContext,
    String sSEKMSKeyId,
    ServerSideEncryption serverSideEncryption,
    StorageClass storageClass,
    String tagging,
    TaggingDirective taggingDirective,
    String websiteRedirectLocation,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    ArgumentError.checkNotNull(copySource, 'copySource');
    _s.validateStringPattern(
      'copySource',
      copySource,
      r'''\/.+\/.+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(key, 'key');
    _s.validateStringLength(
      'key',
      key,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final headers = <String, String>{};
    copySource?.let((v) => headers['x-amz-copy-source'] = v.toString());
    acl?.let((v) => headers['x-amz-acl'] = v.toValue());
    bucketKeyEnabled?.let((v) =>
        headers['x-amz-server-side-encryption-bucket-key-enabled'] =
            v.toString());
    cacheControl?.let((v) => headers['Cache-Control'] = v.toString());
    contentDisposition
        ?.let((v) => headers['Content-Disposition'] = v.toString());
    contentEncoding?.let((v) => headers['Content-Encoding'] = v.toString());
    contentLanguage?.let((v) => headers['Content-Language'] = v.toString());
    contentType?.let((v) => headers['Content-Type'] = v.toString());
    copySourceIfMatch
        ?.let((v) => headers['x-amz-copy-source-if-match'] = v.toString());
    copySourceIfModifiedSince?.let((v) =>
        headers['x-amz-copy-source-if-modified-since'] = _s.rfc822ToJson(v));
    copySourceIfNoneMatch
        ?.let((v) => headers['x-amz-copy-source-if-none-match'] = v.toString());
    copySourceIfUnmodifiedSince?.let((v) =>
        headers['x-amz-copy-source-if-unmodified-since'] = _s.rfc822ToJson(v));
    copySourceSSECustomerAlgorithm?.let((v) =>
        headers['x-amz-copy-source-server-side-encryption-customer-algorithm'] =
            v.toString());
    copySourceSSECustomerKey?.let((v) =>
        headers['x-amz-copy-source-server-side-encryption-customer-key'] =
            v.toString());
    copySourceSSECustomerKeyMD5?.let((v) =>
        headers['x-amz-copy-source-server-side-encryption-customer-key-MD5'] =
            v.toString());
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    expectedSourceBucketOwner?.let(
        (v) => headers['x-amz-source-expected-bucket-owner'] = v.toString());
    expires?.let((v) => headers['Expires'] = _s.rfc822ToJson(v));
    grantFullControl
        ?.let((v) => headers['x-amz-grant-full-control'] = v.toString());
    grantRead?.let((v) => headers['x-amz-grant-read'] = v.toString());
    grantReadACP?.let((v) => headers['x-amz-grant-read-acp'] = v.toString());
    grantWriteACP?.let((v) => headers['x-amz-grant-write-acp'] = v.toString());
    metadata?.forEach((key, value) => headers['x-amz-meta-$key'] = value);
    metadataDirective
        ?.let((v) => headers['x-amz-metadata-directive'] = v.toValue());
    objectLockLegalHoldStatus
        ?.let((v) => headers['x-amz-object-lock-legal-hold'] = v.toValue());
    objectLockMode?.let((v) => headers['x-amz-object-lock-mode'] = v.toValue());
    objectLockRetainUntilDate?.let((v) =>
        headers['x-amz-object-lock-retain-until-date'] = _s.iso8601ToJson(v));
    requestPayer?.let((v) => headers['x-amz-request-payer'] = v.toValue());
    sSECustomerAlgorithm?.let((v) =>
        headers['x-amz-server-side-encryption-customer-algorithm'] =
            v.toString());
    sSECustomerKey?.let((v) =>
        headers['x-amz-server-side-encryption-customer-key'] = v.toString());
    sSECustomerKeyMD5?.let((v) =>
        headers['x-amz-server-side-encryption-customer-key-MD5'] =
            v.toString());
    sSEKMSEncryptionContext?.let(
        (v) => headers['x-amz-server-side-encryption-context'] = v.toString());
    sSEKMSKeyId?.let((v) =>
        headers['x-amz-server-side-encryption-aws-kms-key-id'] = v.toString());
    serverSideEncryption
        ?.let((v) => headers['x-amz-server-side-encryption'] = v.toValue());
    storageClass?.let((v) => headers['x-amz-storage-class'] = v.toValue());
    tagging?.let((v) => headers['x-amz-tagging'] = v.toString());
    taggingDirective
        ?.let((v) => headers['x-amz-tagging-directive'] = v.toValue());
    websiteRedirectLocation
        ?.let((v) => headers['x-amz-website-redirect-location'] = v.toString());
    final $result = await _protocol.sendRaw(
      method: 'PUT',
      requestUri:
          '/${Uri.encodeComponent(bucket)}/${key.split('/').map(Uri.encodeComponent).join('/')}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return CopyObjectOutput(
      copyObjectResult: CopyObjectResult.fromXml($elem),
      bucketKeyEnabled: _s.extractHeaderBoolValue(
          $result.headers, 'x-amz-server-side-encryption-bucket-key-enabled'),
      copySourceVersionId: _s.extractHeaderStringValue(
          $result.headers, 'x-amz-copy-source-version-id'),
      expiration:
          _s.extractHeaderStringValue($result.headers, 'x-amz-expiration'),
      requestCharged: _s
          .extractHeaderStringValue($result.headers, 'x-amz-request-charged')
          ?.toRequestCharged(),
      sSECustomerAlgorithm: _s.extractHeaderStringValue(
          $result.headers, 'x-amz-server-side-encryption-customer-algorithm'),
      sSECustomerKeyMD5: _s.extractHeaderStringValue(
          $result.headers, 'x-amz-server-side-encryption-customer-key-MD5'),
      sSEKMSEncryptionContext: _s.extractHeaderStringValue(
          $result.headers, 'x-amz-server-side-encryption-context'),
      sSEKMSKeyId: _s.extractHeaderStringValue(
          $result.headers, 'x-amz-server-side-encryption-aws-kms-key-id'),
      serverSideEncryption: _s
          .extractHeaderStringValue(
              $result.headers, 'x-amz-server-side-encryption')
          ?.toServerSideEncryption(),
      versionId:
          _s.extractHeaderStringValue($result.headers, 'x-amz-version-id'),
    );
  }

  /// Creates a new S3 bucket. To create a bucket, you must register with Amazon
  /// S3 and have a valid AWS Access Key ID to authenticate requests. Anonymous
  /// requests are never allowed to create buckets. By creating the bucket, you
  /// become the bucket owner.
  ///
  /// Not every string is an acceptable bucket name. For information about
  /// bucket naming restrictions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingBucket.html">Working
  /// with Amazon S3 buckets</a>.
  ///
  /// If you want to create an Amazon S3 on Outposts bucket, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_CreateBucket.html">Create
  /// Bucket</a>.
  ///
  /// By default, the bucket is created in the US East (N. Virginia) Region. You
  /// can optionally specify a Region in the request body. You might choose a
  /// Region to optimize latency, minimize costs, or address regulatory
  /// requirements. For example, if you reside in Europe, you will probably find
  /// it advantageous to create buckets in the Europe (Ireland) Region. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingBucket.html#access-bucket-intro">Accessing
  /// a bucket</a>.
  /// <note>
  /// If you send your create bucket request to the
  /// <code>s3.amazonaws.com</code> endpoint, the request goes to the us-east-1
  /// Region. Accordingly, the signature calculations in Signature Version 4
  /// must use us-east-1 as the Region, even if the location constraint in the
  /// request specifies another Region where the bucket is to be created. If you
  /// create a bucket in a Region other than US East (N. Virginia), your
  /// application must be able to handle 307 redirect. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/VirtualHosting.html">Virtual
  /// hosting of buckets</a>.
  /// </note>
  /// When creating a bucket using this operation, you can optionally specify
  /// the accounts or groups that should be granted specific permissions on the
  /// bucket. There are two ways to grant the appropriate permissions using the
  /// request headers.
  ///
  /// <ul>
  /// <li>
  /// Specify a canned ACL using the <code>x-amz-acl</code> request header.
  /// Amazon S3 supports a set of predefined ACLs, known as <i>canned ACLs</i>.
  /// Each canned ACL has a predefined set of grantees and permissions. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#CannedACL">Canned
  /// ACL</a>.
  /// </li>
  /// <li>
  /// Specify access permissions explicitly using the
  /// <code>x-amz-grant-read</code>, <code>x-amz-grant-write</code>,
  /// <code>x-amz-grant-read-acp</code>, <code>x-amz-grant-write-acp</code>, and
  /// <code>x-amz-grant-full-control</code> headers. These headers map to the
  /// set of permissions Amazon S3 supports in an ACL. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html">Access
  /// control list (ACL) overview</a>.
  ///
  /// You specify each grantee as a type=value pair, where the type is one of
  /// the following:
  ///
  /// <ul>
  /// <li>
  /// <code>id</code> – if the value specified is the canonical user ID of an
  /// AWS account
  /// </li>
  /// <li>
  /// <code>uri</code> – if you are granting permissions to a predefined group
  /// </li>
  /// <li>
  /// <code>emailAddress</code> – if the value specified is the email address of
  /// an AWS account
  /// <note>
  /// Using email addresses to specify a grantee is only supported in the
  /// following AWS Regions:
  ///
  /// <ul>
  /// <li>
  /// US East (N. Virginia)
  /// </li>
  /// <li>
  /// US West (N. California)
  /// </li>
  /// <li>
  /// US West (Oregon)
  /// </li>
  /// <li>
  /// Asia Pacific (Singapore)
  /// </li>
  /// <li>
  /// Asia Pacific (Sydney)
  /// </li>
  /// <li>
  /// Asia Pacific (Tokyo)
  /// </li>
  /// <li>
  /// Europe (Ireland)
  /// </li>
  /// <li>
  /// South America (São Paulo)
  /// </li>
  /// </ul>
  /// For a list of all the Amazon S3 supported Regions and endpoints, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/rande.html#s3_region">Regions
  /// and Endpoints</a> in the AWS General Reference.
  /// </note> </li>
  /// </ul>
  /// For example, the following <code>x-amz-grant-read</code> header grants the
  /// AWS accounts identified by account IDs permissions to read object data and
  /// its metadata:
  ///
  /// <code>x-amz-grant-read: id="11112222333", id="444455556666" </code>
  /// </li>
  /// </ul> <note>
  /// You can use either a canned ACL or specify access permissions explicitly.
  /// You cannot do both.
  /// </note>
  /// The following operations are related to <code>CreateBucket</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutObject.html">PutObject</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucket.html">DeleteBucket</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [BucketAlreadyExists].
  /// May throw [BucketAlreadyOwnedByYou].
  ///
  /// Parameter [bucket] :
  /// The name of the bucket to create.
  ///
  /// Parameter [acl] :
  /// The canned ACL to apply to the bucket.
  ///
  /// Parameter [createBucketConfiguration] :
  /// The configuration information for the bucket.
  ///
  /// Parameter [grantFullControl] :
  /// Allows grantee the read, write, read ACP, and write ACP permissions on the
  /// bucket.
  ///
  /// Parameter [grantRead] :
  /// Allows grantee to list the objects in the bucket.
  ///
  /// Parameter [grantReadACP] :
  /// Allows grantee to read the bucket ACL.
  ///
  /// Parameter [grantWrite] :
  /// Allows grantee to create, overwrite, and delete any object in the bucket.
  ///
  /// Parameter [grantWriteACP] :
  /// Allows grantee to write the ACL for the applicable bucket.
  ///
  /// Parameter [objectLockEnabledForBucket] :
  /// Specifies whether you want S3 Object Lock to be enabled for the new
  /// bucket.
  Future<CreateBucketOutput> createBucket({
    @_s.required String bucket,
    BucketCannedACL acl,
    CreateBucketConfiguration createBucketConfiguration,
    String grantFullControl,
    String grantRead,
    String grantReadACP,
    String grantWrite,
    String grantWriteACP,
    bool objectLockEnabledForBucket,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
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
    final $result = await _protocol.sendRaw(
      method: 'PUT',
      requestUri: '/${Uri.encodeComponent(bucket)}',
      headers: headers,
      payload: createBucketConfiguration?.toXml('CreateBucketConfiguration'),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return CreateBucketOutput(
      location: _s.extractHeaderStringValue($result.headers, 'Location'),
    );
  }

  /// This operation initiates a multipart upload and returns an upload ID. This
  /// upload ID is used to associate all of the parts in the specific multipart
  /// upload. You specify this upload ID in each of your subsequent upload part
  /// requests (see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPart.html">UploadPart</a>).
  /// You also include this upload ID in the final request to either complete or
  /// abort the multipart upload request.
  ///
  /// For more information about multipart uploads, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuoverview.html">Multipart
  /// Upload Overview</a>.
  ///
  /// If you have configured a lifecycle rule to abort incomplete multipart
  /// uploads, the upload must complete within the number of days specified in
  /// the bucket lifecycle configuration. Otherwise, the incomplete multipart
  /// upload becomes eligible for an abort operation and Amazon S3 aborts the
  /// multipart upload. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuoverview.html#mpu-abort-incomplete-mpu-lifecycle-config">Aborting
  /// Incomplete Multipart Uploads Using a Bucket Lifecycle Policy</a>.
  ///
  /// For information about the permissions required to use the multipart upload
  /// API, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuAndPermissions.html">Multipart
  /// Upload API and Permissions</a>.
  ///
  /// For request signing, multipart upload is just a series of regular
  /// requests. You initiate a multipart upload, send one or more requests to
  /// upload parts, and then complete the multipart upload process. You sign
  /// each request individually. There is nothing special about signing
  /// multipart upload requests. For more information about signing, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/sig-v4-authenticating-requests.html">Authenticating
  /// Requests (AWS Signature Version 4)</a>.
  /// <note>
  /// After you initiate a multipart upload and upload one or more parts, to
  /// stop being charged for storing the uploaded parts, you must either
  /// complete or abort the multipart upload. Amazon S3 frees up the space used
  /// to store the parts and stop charging you for storing them only after you
  /// either complete or abort a multipart upload.
  /// </note>
  /// You can optionally request server-side encryption. For server-side
  /// encryption, Amazon S3 encrypts your data as it writes it to disks in its
  /// data centers and decrypts it when you access it. You can provide your own
  /// encryption key, or use AWS Key Management Service (AWS KMS) customer
  /// master keys (CMKs) or Amazon S3-managed encryption keys. If you choose to
  /// provide your own encryption key, the request headers you provide in <a
  /// href="AmazonS3/latest/API/API_UploadPart.html">UploadPart</a> and <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPartCopy.html">UploadPartCopy</a>
  /// requests must match the headers you used in the request to initiate the
  /// upload by using <code>CreateMultipartUpload</code>.
  ///
  /// To perform a multipart upload with encryption using an AWS KMS CMK, the
  /// requester must have permission to the <code>kms:Encrypt</code>,
  /// <code>kms:Decrypt</code>, <code>kms:ReEncrypt*</code>,
  /// <code>kms:GenerateDataKey*</code>, and <code>kms:DescribeKey</code>
  /// actions on the key. These permissions are required because Amazon S3 must
  /// decrypt and read data from the encrypted file parts before it completes
  /// the multipart upload.
  ///
  /// If your AWS Identity and Access Management (IAM) user or role is in the
  /// same AWS account as the AWS KMS CMK, then you must have these permissions
  /// on the key policy. If your IAM user or role belongs to a different account
  /// than the key, then you must have the permissions on both the key policy
  /// and your IAM user or role.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/serv-side-encryption.html">Protecting
  /// Data Using Server-Side Encryption</a>.
  /// <dl> <dt>Access Permissions</dt> <dd>
  /// When copying an object, you can optionally specify the accounts or groups
  /// that should be granted specific permissions on the new object. There are
  /// two ways to grant the permissions using the request headers:
  ///
  /// <ul>
  /// <li>
  /// Specify a canned ACL with the <code>x-amz-acl</code> request header. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#CannedACL">Canned
  /// ACL</a>.
  /// </li>
  /// <li>
  /// Specify access permissions explicitly with the
  /// <code>x-amz-grant-read</code>, <code>x-amz-grant-read-acp</code>,
  /// <code>x-amz-grant-write-acp</code>, and
  /// <code>x-amz-grant-full-control</code> headers. These parameters map to the
  /// set of permissions that Amazon S3 supports in an ACL. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html">Access
  /// Control List (ACL) Overview</a>.
  /// </li>
  /// </ul>
  /// You can use either a canned ACL or specify access permissions explicitly.
  /// You cannot do both.
  /// </dd> <dt>Server-Side- Encryption-Specific Request Headers</dt> <dd>
  /// You can optionally tell Amazon S3 to encrypt data at rest using
  /// server-side encryption. Server-side encryption is for data encryption at
  /// rest. Amazon S3 encrypts your data as it writes it to disks in its data
  /// centers and decrypts it when you access it. The option you use depends on
  /// whether you want to use AWS managed encryption keys or provide your own
  /// encryption key.
  ///
  /// <ul>
  /// <li>
  /// Use encryption keys managed by Amazon S3 or customer master keys (CMKs)
  /// stored in AWS Key Management Service (AWS KMS) – If you want AWS to manage
  /// the keys used to encrypt data, specify the following headers in the
  /// request.
  ///
  /// <ul>
  /// <li>
  /// x-amz-server-side-encryption
  /// </li>
  /// <li>
  /// x-amz-server-side-encryption-aws-kms-key-id
  /// </li>
  /// <li>
  /// x-amz-server-side-encryption-context
  /// </li>
  /// </ul> <note>
  /// If you specify <code>x-amz-server-side-encryption:aws:kms</code>, but
  /// don't provide <code>x-amz-server-side-encryption-aws-kms-key-id</code>,
  /// Amazon S3 uses the AWS managed CMK in AWS KMS to protect the data.
  /// </note> <important>
  /// All GET and PUT requests for an object protected by AWS KMS fail if you
  /// don't make them with SSL or by using SigV4.
  /// </important>
  /// For more information about server-side encryption with CMKs stored in AWS
  /// KMS (SSE-KMS), see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingKMSEncryption.html">Protecting
  /// Data Using Server-Side Encryption with CMKs stored in AWS KMS</a>.
  /// </li>
  /// <li>
  /// Use customer-provided encryption keys – If you want to manage your own
  /// encryption keys, provide all the following headers in the request.
  ///
  /// <ul>
  /// <li>
  /// x-amz-server-side-encryption-customer-algorithm
  /// </li>
  /// <li>
  /// x-amz-server-side-encryption-customer-key
  /// </li>
  /// <li>
  /// x-amz-server-side-encryption-customer-key-MD5
  /// </li>
  /// </ul>
  /// For more information about server-side encryption with CMKs stored in AWS
  /// KMS (SSE-KMS), see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingKMSEncryption.html">Protecting
  /// Data Using Server-Side Encryption with CMKs stored in AWS KMS</a>.
  /// </li>
  /// </ul> </dd> <dt>Access-Control-List (ACL)-Specific Request Headers</dt>
  /// <dd>
  /// You also can use the following access control–related headers with this
  /// operation. By default, all objects are private. Only the owner has full
  /// access control. When adding a new object, you can grant permissions to
  /// individual AWS accounts or to predefined groups defined by Amazon S3.
  /// These permissions are then added to the access control list (ACL) on the
  /// object. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3_ACLs_UsingACLs.html">Using
  /// ACLs</a>. With this operation, you can grant access permissions using one
  /// of the following two methods:
  ///
  /// <ul>
  /// <li>
  /// Specify a canned ACL (<code>x-amz-acl</code>) — Amazon S3 supports a set
  /// of predefined ACLs, known as <i>canned ACLs</i>. Each canned ACL has a
  /// predefined set of grantees and permissions. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#CannedACL">Canned
  /// ACL</a>.
  /// </li>
  /// <li>
  /// Specify access permissions explicitly — To explicitly grant access
  /// permissions to specific AWS accounts or groups, use the following headers.
  /// Each header maps to specific permissions that Amazon S3 supports in an
  /// ACL. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html">Access
  /// Control List (ACL) Overview</a>. In the header, you specify a list of
  /// grantees who get the specific permission. To grant permissions explicitly,
  /// use:
  ///
  /// <ul>
  /// <li>
  /// x-amz-grant-read
  /// </li>
  /// <li>
  /// x-amz-grant-write
  /// </li>
  /// <li>
  /// x-amz-grant-read-acp
  /// </li>
  /// <li>
  /// x-amz-grant-write-acp
  /// </li>
  /// <li>
  /// x-amz-grant-full-control
  /// </li>
  /// </ul>
  /// You specify each grantee as a type=value pair, where the type is one of
  /// the following:
  ///
  /// <ul>
  /// <li>
  /// <code>id</code> – if the value specified is the canonical user ID of an
  /// AWS account
  /// </li>
  /// <li>
  /// <code>uri</code> – if you are granting permissions to a predefined group
  /// </li>
  /// <li>
  /// <code>emailAddress</code> – if the value specified is the email address of
  /// an AWS account
  /// <note>
  /// Using email addresses to specify a grantee is only supported in the
  /// following AWS Regions:
  ///
  /// <ul>
  /// <li>
  /// US East (N. Virginia)
  /// </li>
  /// <li>
  /// US West (N. California)
  /// </li>
  /// <li>
  /// US West (Oregon)
  /// </li>
  /// <li>
  /// Asia Pacific (Singapore)
  /// </li>
  /// <li>
  /// Asia Pacific (Sydney)
  /// </li>
  /// <li>
  /// Asia Pacific (Tokyo)
  /// </li>
  /// <li>
  /// Europe (Ireland)
  /// </li>
  /// <li>
  /// South America (São Paulo)
  /// </li>
  /// </ul>
  /// For a list of all the Amazon S3 supported Regions and endpoints, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/rande.html#s3_region">Regions
  /// and Endpoints</a> in the AWS General Reference.
  /// </note> </li>
  /// </ul>
  /// For example, the following <code>x-amz-grant-read</code> header grants the
  /// AWS accounts identified by account IDs permissions to read object data and
  /// its metadata:
  ///
  /// <code>x-amz-grant-read: id="11112222333", id="444455556666" </code>
  /// </li>
  /// </ul> </dd> </dl>
  /// The following operations are related to
  /// <code>CreateMultipartUpload</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPart.html">UploadPart</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CompleteMultipartUpload.html">CompleteMultipartUpload</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_AbortMultipartUpload.html">AbortMultipartUpload</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListParts.html">ListParts</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListMultipartUploads.html">ListMultipartUploads</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The name of the bucket to which to initiate the upload
  ///
  /// When using this API with an access point, you must direct requests to the
  /// access point hostname. The access point hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com.
  /// When using this operation with an access point through the AWS SDKs, you
  /// provide the access point ARN in place of the bucket name. For more
  /// information about access point ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using
  /// Access Points</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// When using this API with Amazon S3 on Outposts, you must direct requests
  /// to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com.
  /// When using this operation using S3 on Outposts through the AWS SDKs, you
  /// provide the Outposts bucket ARN in place of the bucket name. For more
  /// information about S3 on Outposts ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using
  /// S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// Parameter [key] :
  /// Object key for which the multipart upload is to be initiated.
  ///
  /// Parameter [acl] :
  /// The canned ACL to apply to the object.
  ///
  /// This action is not supported by Amazon S3 on Outposts.
  ///
  /// Parameter [bucketKeyEnabled] :
  /// Specifies whether Amazon S3 should use an S3 Bucket Key for object
  /// encryption with server-side encryption using AWS KMS (SSE-KMS). Setting
  /// this header to <code>true</code> causes Amazon S3 to use an S3 Bucket Key
  /// for object encryption with SSE-KMS.
  ///
  /// Specifying this header with an object operation doesn’t affect
  /// bucket-level settings for S3 Bucket Key.
  ///
  /// Parameter [cacheControl] :
  /// Specifies caching behavior along the request/reply chain.
  ///
  /// Parameter [contentDisposition] :
  /// Specifies presentational information for the object.
  ///
  /// Parameter [contentEncoding] :
  /// Specifies what content encodings have been applied to the object and thus
  /// what decoding mechanisms must be applied to obtain the media-type
  /// referenced by the Content-Type header field.
  ///
  /// Parameter [contentLanguage] :
  /// The language the content is in.
  ///
  /// Parameter [contentType] :
  /// A standard MIME type describing the format of the object data.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  ///
  /// Parameter [expires] :
  /// The date and time at which the object is no longer cacheable.
  ///
  /// Parameter [grantFullControl] :
  /// Gives the grantee READ, READ_ACP, and WRITE_ACP permissions on the object.
  ///
  /// This action is not supported by Amazon S3 on Outposts.
  ///
  /// Parameter [grantRead] :
  /// Allows grantee to read the object data and its metadata.
  ///
  /// This action is not supported by Amazon S3 on Outposts.
  ///
  /// Parameter [grantReadACP] :
  /// Allows grantee to read the object ACL.
  ///
  /// This action is not supported by Amazon S3 on Outposts.
  ///
  /// Parameter [grantWriteACP] :
  /// Allows grantee to write the ACL for the applicable object.
  ///
  /// This action is not supported by Amazon S3 on Outposts.
  ///
  /// Parameter [metadata] :
  /// A map of metadata to store with the object in S3.
  ///
  /// Parameter [objectLockLegalHoldStatus] :
  /// Specifies whether you want to apply a Legal Hold to the uploaded object.
  ///
  /// Parameter [objectLockMode] :
  /// Specifies the Object Lock mode that you want to apply to the uploaded
  /// object.
  ///
  /// Parameter [objectLockRetainUntilDate] :
  /// Specifies the date and time when you want the Object Lock to expire.
  ///
  /// Parameter [sSECustomerAlgorithm] :
  /// Specifies the algorithm to use to when encrypting the object (for example,
  /// AES256).
  ///
  /// Parameter [sSECustomerKey] :
  /// Specifies the customer-provided encryption key for Amazon S3 to use in
  /// encrypting data. This value is used to store the object and then it is
  /// discarded; Amazon S3 does not store the encryption key. The key must be
  /// appropriate for use with the algorithm specified in the
  /// <code>x-amz-server-side-encryption-customer-algorithm</code> header.
  ///
  /// Parameter [sSECustomerKeyMD5] :
  /// Specifies the 128-bit MD5 digest of the encryption key according to RFC
  /// 1321. Amazon S3 uses this header for a message integrity check to ensure
  /// that the encryption key was transmitted without error.
  ///
  /// Parameter [sSEKMSEncryptionContext] :
  /// Specifies the AWS KMS Encryption Context to use for object encryption. The
  /// value of this header is a base64-encoded UTF-8 string holding JSON with
  /// the encryption context key-value pairs.
  ///
  /// Parameter [sSEKMSKeyId] :
  /// Specifies the ID of the symmetric customer managed AWS KMS CMK to use for
  /// object encryption. All GET and PUT requests for an object protected by AWS
  /// KMS will fail if not made via SSL or using SigV4. For information about
  /// configuring using any of the officially supported AWS SDKs and AWS CLI,
  /// see <a
  /// href="https://docs.aws.amazon.com/http:/docs.aws.amazon.com/AmazonS3/latest/dev/UsingAWSSDK.html#specify-signature-version">Specifying
  /// the Signature Version in Request Authentication</a> in the <i>Amazon S3
  /// Developer Guide</i>.
  ///
  /// Parameter [serverSideEncryption] :
  /// The server-side encryption algorithm used when storing this object in
  /// Amazon S3 (for example, AES256, aws:kms).
  ///
  /// Parameter [storageClass] :
  /// By default, Amazon S3 uses the STANDARD Storage Class to store newly
  /// created objects. The STANDARD storage class provides high durability and
  /// high availability. Depending on performance needs, you can specify a
  /// different Storage Class. Amazon S3 on Outposts only uses the OUTPOSTS
  /// Storage Class. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-class-intro.html">Storage
  /// Classes</a> in the <i>Amazon S3 Service Developer Guide</i>.
  ///
  /// Parameter [tagging] :
  /// The tag-set for the object. The tag-set must be encoded as URL Query
  /// parameters.
  ///
  /// Parameter [websiteRedirectLocation] :
  /// If the bucket is configured as a website, redirects requests for this
  /// object to another object in the same bucket or to an external URL. Amazon
  /// S3 stores the value of this header in the object metadata.
  Future<CreateMultipartUploadOutput> createMultipartUpload({
    @_s.required String bucket,
    @_s.required String key,
    ObjectCannedACL acl,
    bool bucketKeyEnabled,
    String cacheControl,
    String contentDisposition,
    String contentEncoding,
    String contentLanguage,
    String contentType,
    String expectedBucketOwner,
    DateTime expires,
    String grantFullControl,
    String grantRead,
    String grantReadACP,
    String grantWriteACP,
    Map<String, String> metadata,
    ObjectLockLegalHoldStatus objectLockLegalHoldStatus,
    ObjectLockMode objectLockMode,
    DateTime objectLockRetainUntilDate,
    RequestPayer requestPayer,
    String sSECustomerAlgorithm,
    Uint8List sSECustomerKey,
    String sSECustomerKeyMD5,
    String sSEKMSEncryptionContext,
    String sSEKMSKeyId,
    ServerSideEncryption serverSideEncryption,
    StorageClass storageClass,
    String tagging,
    String websiteRedirectLocation,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    ArgumentError.checkNotNull(key, 'key');
    _s.validateStringLength(
      'key',
      key,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final headers = <String, String>{};
    acl?.let((v) => headers['x-amz-acl'] = v.toValue());
    bucketKeyEnabled?.let((v) =>
        headers['x-amz-server-side-encryption-bucket-key-enabled'] =
            v.toString());
    cacheControl?.let((v) => headers['Cache-Control'] = v.toString());
    contentDisposition
        ?.let((v) => headers['Content-Disposition'] = v.toString());
    contentEncoding?.let((v) => headers['Content-Encoding'] = v.toString());
    contentLanguage?.let((v) => headers['Content-Language'] = v.toString());
    contentType?.let((v) => headers['Content-Type'] = v.toString());
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    expires?.let((v) => headers['Expires'] = _s.rfc822ToJson(v));
    grantFullControl
        ?.let((v) => headers['x-amz-grant-full-control'] = v.toString());
    grantRead?.let((v) => headers['x-amz-grant-read'] = v.toString());
    grantReadACP?.let((v) => headers['x-amz-grant-read-acp'] = v.toString());
    grantWriteACP?.let((v) => headers['x-amz-grant-write-acp'] = v.toString());
    metadata?.forEach((key, value) => headers['x-amz-meta-$key'] = value);
    objectLockLegalHoldStatus
        ?.let((v) => headers['x-amz-object-lock-legal-hold'] = v.toValue());
    objectLockMode?.let((v) => headers['x-amz-object-lock-mode'] = v.toValue());
    objectLockRetainUntilDate?.let((v) =>
        headers['x-amz-object-lock-retain-until-date'] = _s.iso8601ToJson(v));
    requestPayer?.let((v) => headers['x-amz-request-payer'] = v.toValue());
    sSECustomerAlgorithm?.let((v) =>
        headers['x-amz-server-side-encryption-customer-algorithm'] =
            v.toString());
    sSECustomerKey?.let((v) =>
        headers['x-amz-server-side-encryption-customer-key'] = v.toString());
    sSECustomerKeyMD5?.let((v) =>
        headers['x-amz-server-side-encryption-customer-key-MD5'] =
            v.toString());
    sSEKMSEncryptionContext?.let(
        (v) => headers['x-amz-server-side-encryption-context'] = v.toString());
    sSEKMSKeyId?.let((v) =>
        headers['x-amz-server-side-encryption-aws-kms-key-id'] = v.toString());
    serverSideEncryption
        ?.let((v) => headers['x-amz-server-side-encryption'] = v.toValue());
    storageClass?.let((v) => headers['x-amz-storage-class'] = v.toValue());
    tagging?.let((v) => headers['x-amz-tagging'] = v.toString());
    websiteRedirectLocation
        ?.let((v) => headers['x-amz-website-redirect-location'] = v.toString());
    final $result = await _protocol.sendRaw(
      method: 'POST',
      requestUri:
          '/${Uri.encodeComponent(bucket)}/${key.split('/').map(Uri.encodeComponent).join('/')}?uploads',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return CreateMultipartUploadOutput(
      bucket: _s.extractXmlStringValue($elem, 'Bucket'),
      key: _s.extractXmlStringValue($elem, 'Key'),
      uploadId: _s.extractXmlStringValue($elem, 'UploadId'),
      abortDate:
          _s.extractHeaderDateTimeValue($result.headers, 'x-amz-abort-date'),
      abortRuleId:
          _s.extractHeaderStringValue($result.headers, 'x-amz-abort-rule-id'),
      bucketKeyEnabled: _s.extractHeaderBoolValue(
          $result.headers, 'x-amz-server-side-encryption-bucket-key-enabled'),
      requestCharged: _s
          .extractHeaderStringValue($result.headers, 'x-amz-request-charged')
          ?.toRequestCharged(),
      sSECustomerAlgorithm: _s.extractHeaderStringValue(
          $result.headers, 'x-amz-server-side-encryption-customer-algorithm'),
      sSECustomerKeyMD5: _s.extractHeaderStringValue(
          $result.headers, 'x-amz-server-side-encryption-customer-key-MD5'),
      sSEKMSEncryptionContext: _s.extractHeaderStringValue(
          $result.headers, 'x-amz-server-side-encryption-context'),
      sSEKMSKeyId: _s.extractHeaderStringValue(
          $result.headers, 'x-amz-server-side-encryption-aws-kms-key-id'),
      serverSideEncryption: _s
          .extractHeaderStringValue(
              $result.headers, 'x-amz-server-side-encryption')
          ?.toServerSideEncryption(),
    );
  }

  /// Deletes the S3 bucket. All objects (including all object versions and
  /// delete markers) in the bucket must be deleted before the bucket itself can
  /// be deleted.
  /// <p class="title"> <b>Related Resources</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucket.html">CreateBucket</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteObject.html">DeleteObject</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// Specifies the bucket being deleted.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<void> deleteBucket({
    @_s.required String bucket,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    await _protocol.send(
      method: 'DELETE',
      requestUri: '/${Uri.encodeComponent(bucket)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an analytics configuration for the bucket (specified by the
  /// analytics configuration ID).
  ///
  /// To use this operation, you must have permissions to perform the
  /// <code>s3:PutAnalyticsConfiguration</code> action. The bucket owner has
  /// this permission by default. The bucket owner can grant this permission to
  /// others. For more information about permissions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">Permissions
  /// Related to Bucket Subresource Operations</a> and <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing
  /// Access Permissions to Your Amazon S3 Resources</a>.
  ///
  /// For information about the Amazon S3 analytics feature, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/analytics-storage-class.html">Amazon
  /// S3 Analytics – Storage Class Analysis</a>.
  ///
  /// The following operations are related to
  /// <code>DeleteBucketAnalyticsConfiguration</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketAnalyticsConfiguration.html">GetBucketAnalyticsConfiguration</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListBucketAnalyticsConfigurations.html">ListBucketAnalyticsConfigurations</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketAnalyticsConfiguration.html">PutBucketAnalyticsConfiguration</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The name of the bucket from which an analytics configuration is deleted.
  ///
  /// Parameter [id] :
  /// The ID that identifies the analytics configuration.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<void> deleteBucketAnalyticsConfiguration({
    @_s.required String bucket,
    @_s.required String id,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    ArgumentError.checkNotNull(id, 'id');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    final $query = <String, List<String>>{
      if (id != null) 'id': [id],
    };
    await _protocol.send(
      method: 'DELETE',
      requestUri: '/${Uri.encodeComponent(bucket)}?analytics',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the <code>cors</code> configuration information set for the
  /// bucket.
  ///
  /// To use this operation, you must have permission to perform the
  /// <code>s3:PutBucketCORS</code> action. The bucket owner has this permission
  /// by default and can grant this permission to others.
  ///
  /// For information about <code>cors</code>, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/cors.html">Enabling
  /// Cross-Origin Resource Sharing</a> in the <i>Amazon Simple Storage Service
  /// Developer Guide</i>.
  /// <p class="title"> <b>Related Resources:</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketCors.html">PutBucketCors</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTOPTIONSobject.html">RESTOPTIONSobject</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// Specifies the bucket whose <code>cors</code> configuration is being
  /// deleted.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<void> deleteBucketCors({
    @_s.required String bucket,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    await _protocol.send(
      method: 'DELETE',
      requestUri: '/${Uri.encodeComponent(bucket)}?cors',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This implementation of the DELETE operation removes default encryption
  /// from the bucket. For information about the Amazon S3 default encryption
  /// feature, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/bucket-encryption.html">Amazon
  /// S3 Default Bucket Encryption</a> in the <i>Amazon Simple Storage Service
  /// Developer Guide</i>.
  ///
  /// To use this operation, you must have permissions to perform the
  /// <code>s3:PutEncryptionConfiguration</code> action. The bucket owner has
  /// this permission by default. The bucket owner can grant this permission to
  /// others. For more information about permissions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">Permissions
  /// Related to Bucket Subresource Operations</a> and <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing
  /// Access Permissions to your Amazon S3 Resources</a> in the <i>Amazon Simple
  /// Storage Service Developer Guide</i>.
  /// <p class="title"> <b>Related Resources</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketEncryption.html">PutBucketEncryption</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketEncryption.html">GetBucketEncryption</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The name of the bucket containing the server-side encryption configuration
  /// to delete.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<void> deleteBucketEncryption({
    @_s.required String bucket,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    await _protocol.send(
      method: 'DELETE',
      requestUri: '/${Uri.encodeComponent(bucket)}?encryption',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the S3 Intelligent-Tiering configuration from the specified
  /// bucket.
  ///
  /// The S3 Intelligent-Tiering storage class is designed to optimize storage
  /// costs by automatically moving data to the most cost-effective storage
  /// access tier, without additional operational overhead. S3
  /// Intelligent-Tiering delivers automatic cost savings by moving data between
  /// access tiers, when access patterns change.
  ///
  /// The S3 Intelligent-Tiering storage class is suitable for objects larger
  /// than 128 KB that you plan to store for at least 30 days. If the size of an
  /// object is less than 128 KB, it is not eligible for auto-tiering. Smaller
  /// objects can be stored, but they are always charged at the frequent access
  /// tier rates in the S3 Intelligent-Tiering storage class.
  ///
  /// If you delete an object before the end of the 30-day minimum storage
  /// duration period, you are charged for 30 days. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-class-intro.html#sc-dynamic-data-access">Storage
  /// class for automatically optimizing frequently and infrequently accessed
  /// objects</a>.
  ///
  /// Operations related to
  /// <code>DeleteBucketIntelligentTieringConfiguration</code> include:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketIntelligentTieringConfiguration.html">GetBucketIntelligentTieringConfiguration</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketIntelligentTieringConfiguration.html">PutBucketIntelligentTieringConfiguration</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListBucketIntelligentTieringConfigurations.html">ListBucketIntelligentTieringConfigurations</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The name of the Amazon S3 bucket whose configuration you want to modify or
  /// retrieve.
  ///
  /// Parameter [id] :
  /// The ID used to identify the S3 Intelligent-Tiering configuration.
  Future<void> deleteBucketIntelligentTieringConfiguration({
    @_s.required String bucket,
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    ArgumentError.checkNotNull(id, 'id');
    final $query = <String, List<String>>{
      if (id != null) 'id': [id],
    };
    await _protocol.send(
      method: 'DELETE',
      requestUri: '/${Uri.encodeComponent(bucket)}?intelligent-tiering',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an inventory configuration (identified by the inventory ID) from
  /// the bucket.
  ///
  /// To use this operation, you must have permissions to perform the
  /// <code>s3:PutInventoryConfiguration</code> action. The bucket owner has
  /// this permission by default. The bucket owner can grant this permission to
  /// others. For more information about permissions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">Permissions
  /// Related to Bucket Subresource Operations</a> and <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing
  /// Access Permissions to Your Amazon S3 Resources</a>.
  ///
  /// For information about the Amazon S3 inventory feature, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-inventory.html">Amazon
  /// S3 Inventory</a>.
  ///
  /// Operations related to <code>DeleteBucketInventoryConfiguration</code>
  /// include:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketInventoryConfiguration.html">GetBucketInventoryConfiguration</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketInventoryConfiguration.html">PutBucketInventoryConfiguration</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListBucketInventoryConfigurations.html">ListBucketInventoryConfigurations</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The name of the bucket containing the inventory configuration to delete.
  ///
  /// Parameter [id] :
  /// The ID used to identify the inventory configuration.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<void> deleteBucketInventoryConfiguration({
    @_s.required String bucket,
    @_s.required String id,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    ArgumentError.checkNotNull(id, 'id');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    final $query = <String, List<String>>{
      if (id != null) 'id': [id],
    };
    await _protocol.send(
      method: 'DELETE',
      requestUri: '/${Uri.encodeComponent(bucket)}?inventory',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the lifecycle configuration from the specified bucket. Amazon S3
  /// removes all the lifecycle configuration rules in the lifecycle subresource
  /// associated with the bucket. Your objects never expire, and Amazon S3 no
  /// longer automatically deletes any objects on the basis of rules contained
  /// in the deleted lifecycle configuration.
  ///
  /// To use this operation, you must have permission to perform the
  /// <code>s3:PutLifecycleConfiguration</code> action. By default, the bucket
  /// owner has this permission and the bucket owner can grant this permission
  /// to others.
  ///
  /// There is usually some time lag before lifecycle configuration deletion is
  /// fully propagated to all the Amazon S3 systems.
  ///
  /// For more information about the object expiration, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/intro-lifecycle-rules.html#intro-lifecycle-rules-actions">Elements
  /// to Describe Lifecycle Actions</a>.
  ///
  /// Related actions include:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketLifecycleConfiguration.html">PutBucketLifecycleConfiguration</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketLifecycleConfiguration.html">GetBucketLifecycleConfiguration</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The bucket name of the lifecycle to delete.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<void> deleteBucketLifecycle({
    @_s.required String bucket,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    await _protocol.send(
      method: 'DELETE',
      requestUri: '/${Uri.encodeComponent(bucket)}?lifecycle',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a metrics configuration for the Amazon CloudWatch request metrics
  /// (specified by the metrics configuration ID) from the bucket. Note that
  /// this doesn't include the daily storage metrics.
  ///
  /// To use this operation, you must have permissions to perform the
  /// <code>s3:PutMetricsConfiguration</code> action. The bucket owner has this
  /// permission by default. The bucket owner can grant this permission to
  /// others. For more information about permissions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">Permissions
  /// Related to Bucket Subresource Operations</a> and <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing
  /// Access Permissions to Your Amazon S3 Resources</a>.
  ///
  /// For information about CloudWatch request metrics for Amazon S3, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/cloudwatch-monitoring.html">Monitoring
  /// Metrics with Amazon CloudWatch</a>.
  ///
  /// The following operations are related to
  /// <code>DeleteBucketMetricsConfiguration</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketMetricsConfiguration.html">GetBucketMetricsConfiguration</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketMetricsConfiguration.html">PutBucketMetricsConfiguration</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListBucketMetricsConfigurations.html">ListBucketMetricsConfigurations</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/cloudwatch-monitoring.html">Monitoring
  /// Metrics with Amazon CloudWatch</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The name of the bucket containing the metrics configuration to delete.
  ///
  /// Parameter [id] :
  /// The ID used to identify the metrics configuration.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<void> deleteBucketMetricsConfiguration({
    @_s.required String bucket,
    @_s.required String id,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    ArgumentError.checkNotNull(id, 'id');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    final $query = <String, List<String>>{
      if (id != null) 'id': [id],
    };
    await _protocol.send(
      method: 'DELETE',
      requestUri: '/${Uri.encodeComponent(bucket)}?metrics',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes <code>OwnershipControls</code> for an Amazon S3 bucket. To use
  /// this operation, you must have the
  /// <code>s3:PutBucketOwnershipControls</code> permission. For more
  /// information about Amazon S3 permissions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html">Specifying
  /// Permissions in a Policy</a>.
  ///
  /// For information about Amazon S3 Object Ownership, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/about-object-ownership.html">Using
  /// Object Ownership</a>.
  ///
  /// The following operations are related to
  /// <code>DeleteBucketOwnershipControls</code>:
  ///
  /// <ul>
  /// <li>
  /// <a>GetBucketOwnershipControls</a>
  /// </li>
  /// <li>
  /// <a>PutBucketOwnershipControls</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The Amazon S3 bucket whose <code>OwnershipControls</code> you want to
  /// delete.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<void> deleteBucketOwnershipControls({
    @_s.required String bucket,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    await _protocol.send(
      method: 'DELETE',
      requestUri: '/${Uri.encodeComponent(bucket)}?ownershipControls',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This implementation of the DELETE operation uses the policy subresource to
  /// delete the policy of a specified bucket. If you are using an identity
  /// other than the root user of the AWS account that owns the bucket, the
  /// calling identity must have the <code>DeleteBucketPolicy</code> permissions
  /// on the specified bucket and belong to the bucket owner's account to use
  /// this operation.
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
  /// Bucket Policies and UserPolicies</a>.
  ///
  /// The following operations are related to <code>DeleteBucketPolicy</code>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucket.html">CreateBucket</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteObject.html">DeleteObject</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The bucket name.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<void> deleteBucketPolicy({
    @_s.required String bucket,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    await _protocol.send(
      method: 'DELETE',
      requestUri: '/${Uri.encodeComponent(bucket)}?policy',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the replication configuration from the bucket.
  ///
  /// To use this operation, you must have permissions to perform the
  /// <code>s3:PutReplicationConfiguration</code> action. The bucket owner has
  /// these permissions by default and can grant it to others. For more
  /// information about permissions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">Permissions
  /// Related to Bucket Subresource Operations</a> and <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing
  /// Access Permissions to Your Amazon S3 Resources</a>.
  /// <note>
  /// It can take a while for the deletion of a replication configuration to
  /// fully propagate.
  /// </note>
  /// For information about replication configuration, see <a href="
  /// https://docs.aws.amazon.com/AmazonS3/latest/dev/replication.html">Replication</a>
  /// in the <i>Amazon S3 Developer Guide</i>.
  ///
  /// The following operations are related to
  /// <code>DeleteBucketReplication</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketReplication.html">PutBucketReplication</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketReplication.html">GetBucketReplication</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The bucket name.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<void> deleteBucketReplication({
    @_s.required String bucket,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    await _protocol.send(
      method: 'DELETE',
      requestUri: '/${Uri.encodeComponent(bucket)}?replication',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the tags from the bucket.
  ///
  /// To use this operation, you must have permission to perform the
  /// <code>s3:PutBucketTagging</code> action. By default, the bucket owner has
  /// this permission and can grant this permission to others.
  ///
  /// The following operations are related to <code>DeleteBucketTagging</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketTagging.html">GetBucketTagging</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketTagging.html">PutBucketTagging</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The bucket that has the tag set to be removed.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<void> deleteBucketTagging({
    @_s.required String bucket,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    await _protocol.send(
      method: 'DELETE',
      requestUri: '/${Uri.encodeComponent(bucket)}?tagging',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This operation removes the website configuration for a bucket. Amazon S3
  /// returns a <code>200 OK</code> response upon successfully deleting a
  /// website configuration on the specified bucket. You will get a <code>200
  /// OK</code> response if the website configuration you are trying to delete
  /// does not exist on the bucket. Amazon S3 returns a <code>404</code>
  /// response if the bucket specified in the request does not exist.
  ///
  /// This DELETE operation requires the <code>S3:DeleteBucketWebsite</code>
  /// permission. By default, only the bucket owner can delete the website
  /// configuration attached to a bucket. However, bucket owners can grant other
  /// users permission to delete the website configuration by writing a bucket
  /// policy granting them the <code>S3:DeleteBucketWebsite</code> permission.
  ///
  /// For more information about hosting websites, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/WebsiteHosting.html">Hosting
  /// Websites on Amazon S3</a>.
  ///
  /// The following operations are related to <code>DeleteBucketWebsite</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketWebsite.html">GetBucketWebsite</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketWebsite.html">PutBucketWebsite</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The bucket name for which you want to remove the website configuration.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<void> deleteBucketWebsite({
    @_s.required String bucket,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    await _protocol.send(
      method: 'DELETE',
      requestUri: '/${Uri.encodeComponent(bucket)}?website',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes the null version (if there is one) of an object and inserts a
  /// delete marker, which becomes the latest version of the object. If there
  /// isn't a null version, Amazon S3 does not remove any objects.
  ///
  /// To remove a specific version, you must be the bucket owner and you must
  /// use the version Id subresource. Using this subresource permanently deletes
  /// the version. If the object deleted is a delete marker, Amazon S3 sets the
  /// response header, <code>x-amz-delete-marker</code>, to true.
  ///
  /// If the object you want to delete is in a bucket where the bucket
  /// versioning configuration is MFA Delete enabled, you must include the
  /// <code>x-amz-mfa</code> request header in the DELETE <code>versionId</code>
  /// request. Requests that include <code>x-amz-mfa</code> must use HTTPS.
  ///
  /// For more information about MFA Delete, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMFADelete.html">Using
  /// MFA Delete</a>. To see sample requests that use versioning, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTObjectDELETE.html#ExampleVersionObjectDelete">Sample
  /// Request</a>.
  ///
  /// You can delete objects by explicitly calling the DELETE Object API or
  /// configure its lifecycle (<a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketLifecycle.html">PutBucketLifecycle</a>)
  /// to enable Amazon S3 to remove them for you. If you want to block users or
  /// accounts from removing or deleting objects from your bucket, you must deny
  /// them the <code>s3:DeleteObject</code>,
  /// <code>s3:DeleteObjectVersion</code>, and
  /// <code>s3:PutLifeCycleConfiguration</code> actions.
  ///
  /// The following operation is related to <code>DeleteObject</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutObject.html">PutObject</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The bucket name of the bucket containing the object.
  ///
  /// When using this API with an access point, you must direct requests to the
  /// access point hostname. The access point hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com.
  /// When using this operation with an access point through the AWS SDKs, you
  /// provide the access point ARN in place of the bucket name. For more
  /// information about access point ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using
  /// Access Points</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// When using this API with Amazon S3 on Outposts, you must direct requests
  /// to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com.
  /// When using this operation using S3 on Outposts through the AWS SDKs, you
  /// provide the Outposts bucket ARN in place of the bucket name. For more
  /// information about S3 on Outposts ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using
  /// S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// Parameter [key] :
  /// Key name of the object to delete.
  ///
  /// Parameter [bypassGovernanceRetention] :
  /// Indicates whether S3 Object Lock should bypass Governance-mode
  /// restrictions to process this operation.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  ///
  /// Parameter [mfa] :
  /// The concatenation of the authentication device's serial number, a space,
  /// and the value that is displayed on your authentication device. Required to
  /// permanently delete a versioned object if versioning is configured with MFA
  /// delete enabled.
  ///
  /// Parameter [versionId] :
  /// VersionId used to reference a specific version of the object.
  Future<DeleteObjectOutput> deleteObject({
    @_s.required String bucket,
    @_s.required String key,
    bool bypassGovernanceRetention,
    String expectedBucketOwner,
    String mfa,
    RequestPayer requestPayer,
    String versionId,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    ArgumentError.checkNotNull(key, 'key');
    _s.validateStringLength(
      'key',
      key,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final headers = <String, String>{};
    bypassGovernanceRetention?.let(
        (v) => headers['x-amz-bypass-governance-retention'] = v.toString());
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    mfa?.let((v) => headers['x-amz-mfa'] = v.toString());
    requestPayer?.let((v) => headers['x-amz-request-payer'] = v.toValue());
    final $query = <String, List<String>>{
      if (versionId != null) 'versionId': [versionId],
    };
    final $result = await _protocol.sendRaw(
      method: 'DELETE',
      requestUri:
          '/${Uri.encodeComponent(bucket)}/${key.split('/').map(Uri.encodeComponent).join('/')}',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return DeleteObjectOutput(
      deleteMarker:
          _s.extractHeaderBoolValue($result.headers, 'x-amz-delete-marker'),
      requestCharged: _s
          .extractHeaderStringValue($result.headers, 'x-amz-request-charged')
          ?.toRequestCharged(),
      versionId:
          _s.extractHeaderStringValue($result.headers, 'x-amz-version-id'),
    );
  }

  /// Removes the entire tag set from the specified object. For more information
  /// about managing object tags, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-tagging.html">
  /// Object Tagging</a>.
  ///
  /// To use this operation, you must have permission to perform the
  /// <code>s3:DeleteObjectTagging</code> action.
  ///
  /// To delete tags of a specific object version, add the
  /// <code>versionId</code> query parameter in the request. You will need
  /// permission for the <code>s3:DeleteObjectVersionTagging</code> action.
  ///
  /// The following operations are related to
  /// <code>DeleteBucketMetricsConfiguration</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutObjectTagging.html">PutObjectTagging</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObjectTagging.html">GetObjectTagging</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The bucket name containing the objects from which to remove the tags.
  ///
  /// When using this API with an access point, you must direct requests to the
  /// access point hostname. The access point hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com.
  /// When using this operation with an access point through the AWS SDKs, you
  /// provide the access point ARN in place of the bucket name. For more
  /// information about access point ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using
  /// Access Points</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// When using this API with Amazon S3 on Outposts, you must direct requests
  /// to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com.
  /// When using this operation using S3 on Outposts through the AWS SDKs, you
  /// provide the Outposts bucket ARN in place of the bucket name. For more
  /// information about S3 on Outposts ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using
  /// S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// Parameter [key] :
  /// Name of the object key.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  ///
  /// Parameter [versionId] :
  /// The versionId of the object that the tag-set will be removed from.
  Future<DeleteObjectTaggingOutput> deleteObjectTagging({
    @_s.required String bucket,
    @_s.required String key,
    String expectedBucketOwner,
    String versionId,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    ArgumentError.checkNotNull(key, 'key');
    _s.validateStringLength(
      'key',
      key,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    final $query = <String, List<String>>{
      if (versionId != null) 'versionId': [versionId],
    };
    final $result = await _protocol.sendRaw(
      method: 'DELETE',
      requestUri:
          '/${Uri.encodeComponent(bucket)}/${key.split('/').map(Uri.encodeComponent).join('/')}?tagging',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return DeleteObjectTaggingOutput(
      versionId:
          _s.extractHeaderStringValue($result.headers, 'x-amz-version-id'),
    );
  }

  /// This operation enables you to delete multiple objects from a bucket using
  /// a single HTTP request. If you know the object keys that you want to
  /// delete, then this operation provides a suitable alternative to sending
  /// individual delete requests, reducing per-request overhead.
  ///
  /// The request contains a list of up to 1000 keys that you want to delete. In
  /// the XML, you provide the object key names, and optionally, version IDs if
  /// you want to delete a specific version of the object from a
  /// versioning-enabled bucket. For each key, Amazon S3 performs a delete
  /// operation and returns the result of that delete, success, or failure, in
  /// the response. Note that if the object specified in the request is not
  /// found, Amazon S3 returns the result as deleted.
  ///
  /// The operation supports two modes for the response: verbose and quiet. By
  /// default, the operation uses verbose mode in which the response includes
  /// the result of deletion of each key in your request. In quiet mode the
  /// response includes only keys where the delete operation encountered an
  /// error. For a successful deletion, the operation does not return any
  /// information about the delete in the response body.
  ///
  /// When performing this operation on an MFA Delete enabled bucket, that
  /// attempts to delete any versioned objects, you must include an MFA token.
  /// If you do not provide one, the entire request will fail, even if there are
  /// non-versioned objects you are trying to delete. If you provide an invalid
  /// token, whether there are versioned keys in the request or not, the entire
  /// Multi-Object Delete request will fail. For information about MFA Delete,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/Versioning.html#MultiFactorAuthenticationDelete">
  /// MFA Delete</a>.
  ///
  /// Finally, the Content-MD5 header is required for all Multi-Object Delete
  /// requests. Amazon S3 uses the header value to ensure that your request body
  /// has not been altered in transit.
  ///
  /// The following operations are related to <code>DeleteObjects</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateMultipartUpload.html">CreateMultipartUpload</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPart.html">UploadPart</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CompleteMultipartUpload.html">CompleteMultipartUpload</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListParts.html">ListParts</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_AbortMultipartUpload.html">AbortMultipartUpload</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The bucket name containing the objects to delete.
  ///
  /// When using this API with an access point, you must direct requests to the
  /// access point hostname. The access point hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com.
  /// When using this operation with an access point through the AWS SDKs, you
  /// provide the access point ARN in place of the bucket name. For more
  /// information about access point ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using
  /// Access Points</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// When using this API with Amazon S3 on Outposts, you must direct requests
  /// to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com.
  /// When using this operation using S3 on Outposts through the AWS SDKs, you
  /// provide the Outposts bucket ARN in place of the bucket name. For more
  /// information about S3 on Outposts ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using
  /// S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// Parameter [delete] :
  /// Container for the request.
  ///
  /// Parameter [bypassGovernanceRetention] :
  /// Specifies whether you want to delete this object even if it has a
  /// Governance-type Object Lock in place. You must have sufficient permissions
  /// to perform this operation.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  ///
  /// Parameter [mfa] :
  /// The concatenation of the authentication device's serial number, a space,
  /// and the value that is displayed on your authentication device. Required to
  /// permanently delete a versioned object if versioning is configured with MFA
  /// delete enabled.
  Future<DeleteObjectsOutput> deleteObjects({
    @_s.required String bucket,
    @_s.required Delete delete,
    bool bypassGovernanceRetention,
    String expectedBucketOwner,
    String mfa,
    RequestPayer requestPayer,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    ArgumentError.checkNotNull(delete, 'delete');
    final headers = <String, String>{};
    bypassGovernanceRetention?.let(
        (v) => headers['x-amz-bypass-governance-retention'] = v.toString());
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    mfa?.let((v) => headers['x-amz-mfa'] = v.toString());
    requestPayer?.let((v) => headers['x-amz-request-payer'] = v.toValue());
    final $result = await _protocol.sendRaw(
      method: 'POST',
      requestUri: '/${Uri.encodeComponent(bucket)}?delete',
      headers: headers,
      payload: delete.toXml('Delete'),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return DeleteObjectsOutput(
      deleted: $elem
          .findElements('Deleted')
          .map((c) => DeletedObject.fromXml(c))
          .toList(),
      errors: $elem.findElements('Error').map((c) => Error.fromXml(c)).toList(),
      requestCharged: _s
          .extractHeaderStringValue($result.headers, 'x-amz-request-charged')
          ?.toRequestCharged(),
    );
  }

  /// Removes the <code>PublicAccessBlock</code> configuration for an Amazon S3
  /// bucket. To use this operation, you must have the
  /// <code>s3:PutBucketPublicAccessBlock</code> permission. For more
  /// information about permissions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">Permissions
  /// Related to Bucket Subresource Operations</a> and <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing
  /// Access Permissions to Your Amazon S3 Resources</a>.
  ///
  /// The following operations are related to
  /// <code>DeletePublicAccessBlock</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html">Using
  /// Amazon S3 Block Public Access</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetPublicAccessBlock.html">GetPublicAccessBlock</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutPublicAccessBlock.html">PutPublicAccessBlock</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketPolicyStatus.html">GetBucketPolicyStatus</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The Amazon S3 bucket whose <code>PublicAccessBlock</code> configuration
  /// you want to delete.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<void> deletePublicAccessBlock({
    @_s.required String bucket,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    await _protocol.send(
      method: 'DELETE',
      requestUri: '/${Uri.encodeComponent(bucket)}?publicAccessBlock',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This implementation of the GET operation uses the <code>accelerate</code>
  /// subresource to return the Transfer Acceleration state of a bucket, which
  /// is either <code>Enabled</code> or <code>Suspended</code>. Amazon S3
  /// Transfer Acceleration is a bucket-level feature that enables you to
  /// perform faster data transfers to and from Amazon S3.
  ///
  /// To use this operation, you must have permission to perform the
  /// <code>s3:GetAccelerateConfiguration</code> action. The bucket owner has
  /// this permission by default. The bucket owner can grant this permission to
  /// others. For more information about permissions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">Permissions
  /// Related to Bucket Subresource Operations</a> and <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing
  /// Access Permissions to your Amazon S3 Resources</a> in the <i>Amazon Simple
  /// Storage Service Developer Guide</i>.
  ///
  /// You set the Transfer Acceleration state of an existing bucket to
  /// <code>Enabled</code> or <code>Suspended</code> by using the <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketAccelerateConfiguration.html">PutBucketAccelerateConfiguration</a>
  /// operation.
  ///
  /// A GET <code>accelerate</code> request does not return a state value for a
  /// bucket that has no transfer acceleration state. A bucket has no Transfer
  /// Acceleration state if a state has never been set on the bucket.
  ///
  /// For more information about transfer acceleration, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/transfer-acceleration.html">Transfer
  /// Acceleration</a> in the Amazon Simple Storage Service Developer Guide.
  /// <p class="title"> <b>Related Resources</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketAccelerateConfiguration.html">PutBucketAccelerateConfiguration</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The name of the bucket for which the accelerate configuration is
  /// retrieved.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<GetBucketAccelerateConfigurationOutput>
      getBucketAccelerateConfiguration({
    @_s.required String bucket,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/${Uri.encodeComponent(bucket)}?accelerate',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetBucketAccelerateConfigurationOutput.fromXml($result.body);
  }

  /// This implementation of the <code>GET</code> operation uses the
  /// <code>acl</code> subresource to return the access control list (ACL) of a
  /// bucket. To use <code>GET</code> to return the ACL of the bucket, you must
  /// have <code>READ_ACP</code> access to the bucket. If <code>READ_ACP</code>
  /// permission is granted to the anonymous user, you can return the ACL of the
  /// bucket without using an authorization header.
  /// <p class="title"> <b>Related Resources</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListObjects.html">ListObjects</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// Specifies the S3 bucket whose ACL is being requested.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<GetBucketAclOutput> getBucketAcl({
    @_s.required String bucket,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/${Uri.encodeComponent(bucket)}?acl',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetBucketAclOutput.fromXml($result.body);
  }

  /// This implementation of the GET operation returns an analytics
  /// configuration (identified by the analytics configuration ID) from the
  /// bucket.
  ///
  /// To use this operation, you must have permissions to perform the
  /// <code>s3:GetAnalyticsConfiguration</code> action. The bucket owner has
  /// this permission by default. The bucket owner can grant this permission to
  /// others. For more information about permissions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">
  /// Permissions Related to Bucket Subresource Operations</a> and <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing
  /// Access Permissions to Your Amazon S3 Resources</a> in the <i>Amazon Simple
  /// Storage Service Developer Guide</i>.
  ///
  /// For information about Amazon S3 analytics feature, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/analytics-storage-class.html">Amazon
  /// S3 Analytics – Storage Class Analysis</a> in the <i>Amazon Simple Storage
  /// Service Developer Guide</i>.
  /// <p class="title"> <b>Related Resources</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketAnalyticsConfiguration.html">DeleteBucketAnalyticsConfiguration</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListBucketAnalyticsConfigurations.html">ListBucketAnalyticsConfigurations</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketAnalyticsConfiguration.html">PutBucketAnalyticsConfiguration</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The name of the bucket from which an analytics configuration is retrieved.
  ///
  /// Parameter [id] :
  /// The ID that identifies the analytics configuration.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<GetBucketAnalyticsConfigurationOutput>
      getBucketAnalyticsConfiguration({
    @_s.required String bucket,
    @_s.required String id,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    ArgumentError.checkNotNull(id, 'id');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    final $query = <String, List<String>>{
      if (id != null) 'id': [id],
    };
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri: '/${Uri.encodeComponent(bucket)}?analytics',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return GetBucketAnalyticsConfigurationOutput(
      analyticsConfiguration: AnalyticsConfiguration.fromXml($elem),
    );
  }

  /// Returns the cors configuration information set for the bucket.
  ///
  /// To use this operation, you must have permission to perform the
  /// s3:GetBucketCORS action. By default, the bucket owner has this permission
  /// and can grant it to others.
  ///
  /// For more information about cors, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/cors.html"> Enabling
  /// Cross-Origin Resource Sharing</a>.
  ///
  /// The following operations are related to <code>GetBucketCors</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketCors.html">PutBucketCors</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketCors.html">DeleteBucketCors</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The bucket name for which to get the cors configuration.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<GetBucketCorsOutput> getBucketCors({
    @_s.required String bucket,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/${Uri.encodeComponent(bucket)}?cors',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetBucketCorsOutput.fromXml($result.body);
  }

  /// Returns the default encryption configuration for an Amazon S3 bucket. For
  /// information about the Amazon S3 default encryption feature, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/bucket-encryption.html">Amazon
  /// S3 Default Bucket Encryption</a>.
  ///
  /// To use this operation, you must have permission to perform the
  /// <code>s3:GetEncryptionConfiguration</code> action. The bucket owner has
  /// this permission by default. The bucket owner can grant this permission to
  /// others. For more information about permissions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">Permissions
  /// Related to Bucket Subresource Operations</a> and <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing
  /// Access Permissions to Your Amazon S3 Resources</a>.
  ///
  /// The following operations are related to <code>GetBucketEncryption</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketEncryption.html">PutBucketEncryption</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketEncryption.html">DeleteBucketEncryption</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The name of the bucket from which the server-side encryption configuration
  /// is retrieved.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<GetBucketEncryptionOutput> getBucketEncryption({
    @_s.required String bucket,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri: '/${Uri.encodeComponent(bucket)}?encryption',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return GetBucketEncryptionOutput(
      serverSideEncryptionConfiguration:
          ServerSideEncryptionConfiguration.fromXml($elem),
    );
  }

  /// Gets the S3 Intelligent-Tiering configuration from the specified bucket.
  ///
  /// The S3 Intelligent-Tiering storage class is designed to optimize storage
  /// costs by automatically moving data to the most cost-effective storage
  /// access tier, without additional operational overhead. S3
  /// Intelligent-Tiering delivers automatic cost savings by moving data between
  /// access tiers, when access patterns change.
  ///
  /// The S3 Intelligent-Tiering storage class is suitable for objects larger
  /// than 128 KB that you plan to store for at least 30 days. If the size of an
  /// object is less than 128 KB, it is not eligible for auto-tiering. Smaller
  /// objects can be stored, but they are always charged at the frequent access
  /// tier rates in the S3 Intelligent-Tiering storage class.
  ///
  /// If you delete an object before the end of the 30-day minimum storage
  /// duration period, you are charged for 30 days. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-class-intro.html#sc-dynamic-data-access">Storage
  /// class for automatically optimizing frequently and infrequently accessed
  /// objects</a>.
  ///
  /// Operations related to
  /// <code>GetBucketIntelligentTieringConfiguration</code> include:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketIntelligentTieringConfiguration.html">DeleteBucketIntelligentTieringConfiguration</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketIntelligentTieringConfiguration.html">PutBucketIntelligentTieringConfiguration</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListBucketIntelligentTieringConfigurations.html">ListBucketIntelligentTieringConfigurations</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The name of the Amazon S3 bucket whose configuration you want to modify or
  /// retrieve.
  ///
  /// Parameter [id] :
  /// The ID used to identify the S3 Intelligent-Tiering configuration.
  Future<GetBucketIntelligentTieringConfigurationOutput>
      getBucketIntelligentTieringConfiguration({
    @_s.required String bucket,
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    ArgumentError.checkNotNull(id, 'id');
    final $query = <String, List<String>>{
      if (id != null) 'id': [id],
    };
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri: '/${Uri.encodeComponent(bucket)}?intelligent-tiering',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return GetBucketIntelligentTieringConfigurationOutput(
      intelligentTieringConfiguration:
          IntelligentTieringConfiguration.fromXml($elem),
    );
  }

  /// Returns an inventory configuration (identified by the inventory
  /// configuration ID) from the bucket.
  ///
  /// To use this operation, you must have permissions to perform the
  /// <code>s3:GetInventoryConfiguration</code> action. The bucket owner has
  /// this permission by default and can grant this permission to others. For
  /// more information about permissions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">Permissions
  /// Related to Bucket Subresource Operations</a> and <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing
  /// Access Permissions to Your Amazon S3 Resources</a>.
  ///
  /// For information about the Amazon S3 inventory feature, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-inventory.html">Amazon
  /// S3 Inventory</a>.
  ///
  /// The following operations are related to
  /// <code>GetBucketInventoryConfiguration</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketInventoryConfiguration.html">DeleteBucketInventoryConfiguration</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListBucketInventoryConfigurations.html">ListBucketInventoryConfigurations</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketInventoryConfiguration.html">PutBucketInventoryConfiguration</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The name of the bucket containing the inventory configuration to retrieve.
  ///
  /// Parameter [id] :
  /// The ID used to identify the inventory configuration.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<GetBucketInventoryConfigurationOutput>
      getBucketInventoryConfiguration({
    @_s.required String bucket,
    @_s.required String id,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    ArgumentError.checkNotNull(id, 'id');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    final $query = <String, List<String>>{
      if (id != null) 'id': [id],
    };
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri: '/${Uri.encodeComponent(bucket)}?inventory',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return GetBucketInventoryConfigurationOutput(
      inventoryConfiguration: InventoryConfiguration.fromXml($elem),
    );
  }

  /// <important>
  /// For an updated version of this API, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketLifecycleConfiguration.html">GetBucketLifecycleConfiguration</a>.
  /// If you configured a bucket lifecycle using the <code>filter</code>
  /// element, you should see the updated version of this topic. This topic is
  /// provided for backward compatibility.
  /// </important>
  /// Returns the lifecycle configuration information set on the bucket. For
  /// information about lifecycle configuration, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lifecycle-mgmt.html">Object
  /// Lifecycle Management</a>.
  ///
  /// To use this operation, you must have permission to perform the
  /// <code>s3:GetLifecycleConfiguration</code> action. The bucket owner has
  /// this permission by default. The bucket owner can grant this permission to
  /// others. For more information about permissions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">Permissions
  /// Related to Bucket Subresource Operations</a> and <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing
  /// Access Permissions to Your Amazon S3 Resources</a>.
  ///
  /// <code>GetBucketLifecycle</code> has the following special error:
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
  /// The following operations are related to <code>GetBucketLifecycle</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketLifecycleConfiguration.html">GetBucketLifecycleConfiguration</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketLifecycle.html">PutBucketLifecycle</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketLifecycle.html">DeleteBucketLifecycle</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The name of the bucket for which to get the lifecycle information.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  @Deprecated('Deprecated')
  Future<GetBucketLifecycleOutput> getBucketLifecycle({
    @_s.required String bucket,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/${Uri.encodeComponent(bucket)}?lifecycle',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetBucketLifecycleOutput.fromXml($result.body);
  }

  /// <note>
  /// Bucket lifecycle configuration now supports specifying a lifecycle rule
  /// using an object key name prefix, one or more object tags, or a combination
  /// of both. Accordingly, this section describes the latest API. The response
  /// describes the new filter element that you can use to specify a filter to
  /// select a subset of objects to which the rule applies. If you are using a
  /// previous version of the lifecycle configuration, it still works. For the
  /// earlier API description, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketLifecycle.html">GetBucketLifecycle</a>.
  /// </note>
  /// Returns the lifecycle configuration information set on the bucket. For
  /// information about lifecycle configuration, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lifecycle-mgmt.html">Object
  /// Lifecycle Management</a>.
  ///
  /// To use this operation, you must have permission to perform the
  /// <code>s3:GetLifecycleConfiguration</code> action. The bucket owner has
  /// this permission, by default. The bucket owner can grant this permission to
  /// others. For more information about permissions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">Permissions
  /// Related to Bucket Subresource Operations</a> and <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing
  /// Access Permissions to Your Amazon S3 Resources</a>.
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
  /// The following operations are related to
  /// <code>GetBucketLifecycleConfiguration</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketLifecycle.html">GetBucketLifecycle</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketLifecycle.html">PutBucketLifecycle</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketLifecycle.html">DeleteBucketLifecycle</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The name of the bucket for which to get the lifecycle information.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<GetBucketLifecycleConfigurationOutput>
      getBucketLifecycleConfiguration({
    @_s.required String bucket,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/${Uri.encodeComponent(bucket)}?lifecycle',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetBucketLifecycleConfigurationOutput.fromXml($result.body);
  }

  /// Returns the Region the bucket resides in. You set the bucket's Region
  /// using the <code>LocationConstraint</code> request parameter in a
  /// <code>CreateBucket</code> request. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucket.html">CreateBucket</a>.
  ///
  /// To use this implementation of the operation, you must be the bucket owner.
  ///
  /// The following operations are related to <code>GetBucketLocation</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html">GetObject</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucket.html">CreateBucket</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The name of the bucket for which to get the location.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<GetBucketLocationOutput> getBucketLocation({
    @_s.required String bucket,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/${Uri.encodeComponent(bucket)}?location',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetBucketLocationOutput.fromXml($result.body);
  }

  /// Returns the logging status of a bucket and the permissions users have to
  /// view and modify that status. To use GET, you must be the bucket owner.
  ///
  /// The following operations are related to <code>GetBucketLogging</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucket.html">CreateBucket</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketLogging.html">PutBucketLogging</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The bucket name for which to get the logging information.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<GetBucketLoggingOutput> getBucketLogging({
    @_s.required String bucket,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/${Uri.encodeComponent(bucket)}?logging',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetBucketLoggingOutput.fromXml($result.body);
  }

  /// Gets a metrics configuration (specified by the metrics configuration ID)
  /// from the bucket. Note that this doesn't include the daily storage metrics.
  ///
  /// To use this operation, you must have permissions to perform the
  /// <code>s3:GetMetricsConfiguration</code> action. The bucket owner has this
  /// permission by default. The bucket owner can grant this permission to
  /// others. For more information about permissions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">Permissions
  /// Related to Bucket Subresource Operations</a> and <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing
  /// Access Permissions to Your Amazon S3 Resources</a>.
  ///
  /// For information about CloudWatch request metrics for Amazon S3, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/cloudwatch-monitoring.html">Monitoring
  /// Metrics with Amazon CloudWatch</a>.
  ///
  /// The following operations are related to
  /// <code>GetBucketMetricsConfiguration</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketMetricsConfiguration.html">PutBucketMetricsConfiguration</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketMetricsConfiguration.html">DeleteBucketMetricsConfiguration</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListBucketMetricsConfigurations.html">ListBucketMetricsConfigurations</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/cloudwatch-monitoring.html">Monitoring
  /// Metrics with Amazon CloudWatch</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The name of the bucket containing the metrics configuration to retrieve.
  ///
  /// Parameter [id] :
  /// The ID used to identify the metrics configuration.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<GetBucketMetricsConfigurationOutput> getBucketMetricsConfiguration({
    @_s.required String bucket,
    @_s.required String id,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    ArgumentError.checkNotNull(id, 'id');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    final $query = <String, List<String>>{
      if (id != null) 'id': [id],
    };
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri: '/${Uri.encodeComponent(bucket)}?metrics',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return GetBucketMetricsConfigurationOutput(
      metricsConfiguration: MetricsConfiguration.fromXml($elem),
    );
  }

  /// No longer used, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketNotificationConfiguration.html">GetBucketNotificationConfiguration</a>.
  ///
  /// Parameter [bucket] :
  /// The name of the bucket for which to get the notification configuration.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  @Deprecated('Deprecated')
  Future<NotificationConfigurationDeprecated> getBucketNotification({
    @_s.required String bucket,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/${Uri.encodeComponent(bucket)}?notification',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return NotificationConfigurationDeprecated.fromXml($result.body);
  }

  /// Returns the notification configuration of a bucket.
  ///
  /// If notifications are not enabled on the bucket, the operation returns an
  /// empty <code>NotificationConfiguration</code> element.
  ///
  /// By default, you must be the bucket owner to read the notification
  /// configuration of a bucket. However, the bucket owner can use a bucket
  /// policy to grant permission to other users to read this configuration with
  /// the <code>s3:GetBucketNotification</code> permission.
  ///
  /// For more information about setting and reading the notification
  /// configuration on a bucket, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html">Setting
  /// Up Notification of Bucket Events</a>. For more information about bucket
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-iam-policies.html">Using
  /// Bucket Policies</a>.
  ///
  /// The following operation is related to <code>GetBucketNotification</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketNotification.html">PutBucketNotification</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The name of the bucket for which to get the notification configuration.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<NotificationConfiguration> getBucketNotificationConfiguration({
    @_s.required String bucket,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/${Uri.encodeComponent(bucket)}?notification',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return NotificationConfiguration.fromXml($result.body);
  }

  /// Retrieves <code>OwnershipControls</code> for an Amazon S3 bucket. To use
  /// this operation, you must have the
  /// <code>s3:GetBucketOwnershipControls</code> permission. For more
  /// information about Amazon S3 permissions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html">Specifying
  /// Permissions in a Policy</a>.
  ///
  /// For information about Amazon S3 Object Ownership, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/about-object-ownership.html">Using
  /// Object Ownership</a>.
  ///
  /// The following operations are related to
  /// <code>GetBucketOwnershipControls</code>:
  ///
  /// <ul>
  /// <li>
  /// <a>PutBucketOwnershipControls</a>
  /// </li>
  /// <li>
  /// <a>DeleteBucketOwnershipControls</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The name of the Amazon S3 bucket whose <code>OwnershipControls</code> you
  /// want to retrieve.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<GetBucketOwnershipControlsOutput> getBucketOwnershipControls({
    @_s.required String bucket,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri: '/${Uri.encodeComponent(bucket)}?ownershipControls',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return GetBucketOwnershipControlsOutput(
      ownershipControls: OwnershipControls.fromXml($elem),
    );
  }

  /// Returns the policy of a specified bucket. If you are using an identity
  /// other than the root user of the AWS account that owns the bucket, the
  /// calling identity must have the <code>GetBucketPolicy</code> permissions on
  /// the specified bucket and belong to the bucket owner's account in order to
  /// use this operation.
  ///
  /// If you don't have <code>GetBucketPolicy</code> permissions, Amazon S3
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
  /// The following operation is related to <code>GetBucketPolicy</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html">GetObject</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The bucket name for which to get the bucket policy.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<GetBucketPolicyOutput> getBucketPolicy({
    @_s.required String bucket,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri: '/${Uri.encodeComponent(bucket)}?policy',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetBucketPolicyOutput(
      policy: await $result.stream.bytesToString(),
    );
  }

  /// Retrieves the policy status for an Amazon S3 bucket, indicating whether
  /// the bucket is public. In order to use this operation, you must have the
  /// <code>s3:GetBucketPolicyStatus</code> permission. For more information
  /// about Amazon S3 permissions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html">Specifying
  /// Permissions in a Policy</a>.
  ///
  /// For more information about when Amazon S3 considers a bucket public, see
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html#access-control-block-public-access-policy-status">The
  /// Meaning of "Public"</a>.
  ///
  /// The following operations are related to
  /// <code>GetBucketPolicyStatus</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html">Using
  /// Amazon S3 Block Public Access</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetPublicAccessBlock.html">GetPublicAccessBlock</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutPublicAccessBlock.html">PutPublicAccessBlock</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeletePublicAccessBlock.html">DeletePublicAccessBlock</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The name of the Amazon S3 bucket whose policy status you want to retrieve.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<GetBucketPolicyStatusOutput> getBucketPolicyStatus({
    @_s.required String bucket,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri: '/${Uri.encodeComponent(bucket)}?policyStatus',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return GetBucketPolicyStatusOutput(
      policyStatus: PolicyStatus.fromXml($elem),
    );
  }

  /// Returns the replication configuration of a bucket.
  /// <note>
  /// It can take a while to propagate the put or delete a replication
  /// configuration to all Amazon S3 systems. Therefore, a get request soon
  /// after put or delete can return a wrong result.
  /// </note>
  /// For information about replication configuration, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/replication.html">Replication</a>
  /// in the <i>Amazon Simple Storage Service Developer Guide</i>.
  ///
  /// This operation requires permissions for the
  /// <code>s3:GetReplicationConfiguration</code> action. For more information
  /// about permissions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-iam-policies.html">Using
  /// Bucket Policies and User Policies</a>.
  ///
  /// If you include the <code>Filter</code> element in a replication
  /// configuration, you must also include the
  /// <code>DeleteMarkerReplication</code> and <code>Priority</code> elements.
  /// The response also returns those elements.
  ///
  /// For information about <code>GetBucketReplication</code> errors, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/ErrorResponses.html#ReplicationErrorCodeList">List
  /// of replication-related error codes</a>
  ///
  /// The following operations are related to <code>GetBucketReplication</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketReplication.html">PutBucketReplication</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketReplication.html">DeleteBucketReplication</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The bucket name for which to get the replication information.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<GetBucketReplicationOutput> getBucketReplication({
    @_s.required String bucket,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri: '/${Uri.encodeComponent(bucket)}?replication',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return GetBucketReplicationOutput(
      replicationConfiguration: ReplicationConfiguration.fromXml($elem),
    );
  }

  /// Returns the request payment configuration of a bucket. To use this version
  /// of the operation, you must be the bucket owner. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/RequesterPaysBuckets.html">Requester
  /// Pays Buckets</a>.
  ///
  /// The following operations are related to
  /// <code>GetBucketRequestPayment</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListObjects.html">ListObjects</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The name of the bucket for which to get the payment request configuration
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<GetBucketRequestPaymentOutput> getBucketRequestPayment({
    @_s.required String bucket,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/${Uri.encodeComponent(bucket)}?requestPayment',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetBucketRequestPaymentOutput.fromXml($result.body);
  }

  /// Returns the tag set associated with the bucket.
  ///
  /// To use this operation, you must have permission to perform the
  /// <code>s3:GetBucketTagging</code> action. By default, the bucket owner has
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
  /// The following operations are related to <code>GetBucketTagging</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketTagging.html">PutBucketTagging</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketTagging.html">DeleteBucketTagging</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The name of the bucket for which to get the tagging information.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<GetBucketTaggingOutput> getBucketTagging({
    @_s.required String bucket,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/${Uri.encodeComponent(bucket)}?tagging',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetBucketTaggingOutput.fromXml($result.body);
  }

  /// Returns the versioning state of a bucket.
  ///
  /// To retrieve the versioning state of a bucket, you must be the bucket
  /// owner.
  ///
  /// This implementation also returns the MFA Delete status of the versioning
  /// state. If the MFA Delete status is <code>enabled</code>, the bucket owner
  /// must use an authentication device to change the versioning state of the
  /// bucket.
  ///
  /// The following operations are related to <code>GetBucketVersioning</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html">GetObject</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutObject.html">PutObject</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteObject.html">DeleteObject</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The name of the bucket for which to get the versioning information.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<GetBucketVersioningOutput> getBucketVersioning({
    @_s.required String bucket,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/${Uri.encodeComponent(bucket)}?versioning',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetBucketVersioningOutput.fromXml($result.body);
  }

  /// Returns the website configuration for a bucket. To host website on Amazon
  /// S3, you can configure a bucket as website by adding a website
  /// configuration. For more information about hosting websites, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/WebsiteHosting.html">Hosting
  /// Websites on Amazon S3</a>.
  ///
  /// This GET operation requires the <code>S3:GetBucketWebsite</code>
  /// permission. By default, only the bucket owner can read the bucket website
  /// configuration. However, bucket owners can allow other users to read the
  /// website configuration by writing a bucket policy granting them the
  /// <code>S3:GetBucketWebsite</code> permission.
  ///
  /// The following operations are related to <code>DeleteBucketWebsite</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketWebsite.html">DeleteBucketWebsite</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketWebsite.html">PutBucketWebsite</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The bucket name for which to get the website configuration.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<GetBucketWebsiteOutput> getBucketWebsite({
    @_s.required String bucket,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/${Uri.encodeComponent(bucket)}?website',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetBucketWebsiteOutput.fromXml($result.body);
  }

  /// Retrieves objects from Amazon S3. To use <code>GET</code>, you must have
  /// <code>READ</code> access to the object. If you grant <code>READ</code>
  /// access to the anonymous user, you can return the object without using an
  /// authorization header.
  ///
  /// An Amazon S3 bucket has no directory hierarchy such as you would find in a
  /// typical computer file system. You can, however, create a logical hierarchy
  /// by using object key names that imply a folder structure. For example,
  /// instead of naming an object <code>sample.jpg</code>, you can name it
  /// <code>photos/2006/February/sample.jpg</code>.
  ///
  /// To get an object from such a logical hierarchy, specify the full key name
  /// for the object in the <code>GET</code> operation. For a virtual
  /// hosted-style request example, if you have the object
  /// <code>photos/2006/February/sample.jpg</code>, specify the resource as
  /// <code>/photos/2006/February/sample.jpg</code>. For a path-style request
  /// example, if you have the object
  /// <code>photos/2006/February/sample.jpg</code> in the bucket named
  /// <code>examplebucket</code>, specify the resource as
  /// <code>/examplebucket/photos/2006/February/sample.jpg</code>. For more
  /// information about request types, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/VirtualHosting.html#VirtualHostingSpecifyBucket">HTTP
  /// Host Header Bucket Specification</a>.
  ///
  /// To distribute large files to many people, you can save bandwidth costs by
  /// using BitTorrent. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3Torrent.html">Amazon
  /// S3 Torrent</a>. For more information about returning the ACL of an object,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObjectAcl.html">GetObjectAcl</a>.
  ///
  /// If the object you are retrieving is stored in the S3 Glacier or S3 Glacier
  /// Deep Archive storage class, or S3 Intelligent-Tiering Archive or S3
  /// Intelligent-Tiering Deep Archive tiers, before you can retrieve the object
  /// you must first restore a copy using <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_RestoreObject.html">RestoreObject</a>.
  /// Otherwise, this operation returns an <code>InvalidObjectStateError</code>
  /// error. For information about restoring archived objects, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/restoring-objects.html">Restoring
  /// Archived Objects</a>.
  ///
  /// Encryption request headers, like
  /// <code>x-amz-server-side-encryption</code>, should not be sent for GET
  /// requests if your object uses server-side encryption with CMKs stored in
  /// AWS KMS (SSE-KMS) or server-side encryption with Amazon S3–managed
  /// encryption keys (SSE-S3). If your object does use these types of keys,
  /// you’ll get an HTTP 400 BadRequest error.
  ///
  /// If you encrypt an object by using server-side encryption with
  /// customer-provided encryption keys (SSE-C) when you store the object in
  /// Amazon S3, then when you GET the object, you must use the following
  /// headers:
  ///
  /// <ul>
  /// <li>
  /// x-amz-server-side-encryption-customer-algorithm
  /// </li>
  /// <li>
  /// x-amz-server-side-encryption-customer-key
  /// </li>
  /// <li>
  /// x-amz-server-side-encryption-customer-key-MD5
  /// </li>
  /// </ul>
  /// For more information about SSE-C, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/ServerSideEncryptionCustomerKeys.html">Server-Side
  /// Encryption (Using Customer-Provided Encryption Keys)</a>.
  ///
  /// Assuming you have permission to read object tags (permission for the
  /// <code>s3:GetObjectVersionTagging</code> action), the response also returns
  /// the <code>x-amz-tagging-count</code> header that provides the count of
  /// number of tags associated with the object. You can use <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObjectTagging.html">GetObjectTagging</a>
  /// to retrieve the tag set associated with an object.
  ///
  /// <b>Permissions</b>
  ///
  /// You need the <code>s3:GetObject</code> permission for this operation. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html">Specifying
  /// Permissions in a Policy</a>. If the object you request does not exist, the
  /// error Amazon S3 returns depends on whether you also have the
  /// <code>s3:ListBucket</code> permission.
  ///
  /// <ul>
  /// <li>
  /// If you have the <code>s3:ListBucket</code> permission on the bucket,
  /// Amazon S3 will return an HTTP status code 404 ("no such key") error.
  /// </li>
  /// <li>
  /// If you don’t have the <code>s3:ListBucket</code> permission, Amazon S3
  /// will return an HTTP status code 403 ("access denied") error.
  /// </li>
  /// </ul>
  /// <b>Versioning</b>
  ///
  /// By default, the GET operation returns the current version of an object. To
  /// return a different version, use the <code>versionId</code> subresource.
  /// <note>
  /// If the current version of the object is a delete marker, Amazon S3 behaves
  /// as if the object was deleted and includes <code>x-amz-delete-marker:
  /// true</code> in the response.
  /// </note>
  /// For more information about versioning, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketVersioning.html">PutBucketVersioning</a>.
  ///
  /// <b>Overriding Response Header Values</b>
  ///
  /// There are times when you want to override certain response header values
  /// in a GET response. For example, you might override the Content-Disposition
  /// response header value in your GET request.
  ///
  /// You can override values for a set of response headers using the following
  /// query parameters. These response header values are sent only on a
  /// successful request, that is, when status code 200 OK is returned. The set
  /// of headers you can override using these parameters is a subset of the
  /// headers that Amazon S3 accepts when you create an object. The response
  /// headers that you can override for the GET response are
  /// <code>Content-Type</code>, <code>Content-Language</code>,
  /// <code>Expires</code>, <code>Cache-Control</code>,
  /// <code>Content-Disposition</code>, and <code>Content-Encoding</code>. To
  /// override these header values in the GET response, you use the following
  /// request parameters.
  /// <note>
  /// You must sign the request, either using an Authorization header or a
  /// presigned URL, when using these parameters. They cannot be used with an
  /// unsigned (anonymous) request.
  /// </note>
  /// <ul>
  /// <li>
  /// <code>response-content-type</code>
  /// </li>
  /// <li>
  /// <code>response-content-language</code>
  /// </li>
  /// <li>
  /// <code>response-expires</code>
  /// </li>
  /// <li>
  /// <code>response-cache-control</code>
  /// </li>
  /// <li>
  /// <code>response-content-disposition</code>
  /// </li>
  /// <li>
  /// <code>response-content-encoding</code>
  /// </li>
  /// </ul>
  /// <b>Additional Considerations about Request Headers</b>
  ///
  /// If both of the <code>If-Match</code> and <code>If-Unmodified-Since</code>
  /// headers are present in the request as follows: <code>If-Match</code>
  /// condition evaluates to <code>true</code>, and;
  /// <code>If-Unmodified-Since</code> condition evaluates to
  /// <code>false</code>; then, S3 returns 200 OK and the data requested.
  ///
  /// If both of the <code>If-None-Match</code> and
  /// <code>If-Modified-Since</code> headers are present in the request as
  /// follows:<code> If-None-Match</code> condition evaluates to
  /// <code>false</code>, and; <code>If-Modified-Since</code> condition
  /// evaluates to <code>true</code>; then, S3 returns 304 Not Modified response
  /// code.
  ///
  /// For more information about conditional requests, see <a
  /// href="https://tools.ietf.org/html/rfc7232">RFC 7232</a>.
  ///
  /// The following operations are related to <code>GetObject</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListBuckets.html">ListBuckets</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObjectAcl.html">GetObjectAcl</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [NoSuchKey].
  /// May throw [InvalidObjectState].
  ///
  /// Parameter [bucket] :
  /// The bucket name containing the object.
  ///
  /// When using this API with an access point, you must direct requests to the
  /// access point hostname. The access point hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com.
  /// When using this operation with an access point through the AWS SDKs, you
  /// provide the access point ARN in place of the bucket name. For more
  /// information about access point ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using
  /// Access Points</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// When using this API with Amazon S3 on Outposts, you must direct requests
  /// to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com.
  /// When using this operation using S3 on Outposts through the AWS SDKs, you
  /// provide the Outposts bucket ARN in place of the bucket name. For more
  /// information about S3 on Outposts ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using
  /// S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// Parameter [key] :
  /// Key of the object to get.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  ///
  /// Parameter [ifMatch] :
  /// Return the object only if its entity tag (ETag) is the same as the one
  /// specified, otherwise return a 412 (precondition failed).
  ///
  /// Parameter [ifModifiedSince] :
  /// Return the object only if it has been modified since the specified time,
  /// otherwise return a 304 (not modified).
  ///
  /// Parameter [ifNoneMatch] :
  /// Return the object only if its entity tag (ETag) is different from the one
  /// specified, otherwise return a 304 (not modified).
  ///
  /// Parameter [ifUnmodifiedSince] :
  /// Return the object only if it has not been modified since the specified
  /// time, otherwise return a 412 (precondition failed).
  ///
  /// Parameter [partNumber] :
  /// Part number of the object being read. This is a positive integer between 1
  /// and 10,000. Effectively performs a 'ranged' GET request for the part
  /// specified. Useful for downloading just a part of an object.
  ///
  /// Parameter [range] :
  /// Downloads the specified range bytes of an object. For more information
  /// about the HTTP Range header, see <a
  /// href="https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.35">https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.35</a>.
  /// <note>
  /// Amazon S3 doesn't support retrieving multiple ranges of data per
  /// <code>GET</code> request.
  /// </note>
  ///
  /// Parameter [responseCacheControl] :
  /// Sets the <code>Cache-Control</code> header of the response.
  ///
  /// Parameter [responseContentDisposition] :
  /// Sets the <code>Content-Disposition</code> header of the response
  ///
  /// Parameter [responseContentEncoding] :
  /// Sets the <code>Content-Encoding</code> header of the response.
  ///
  /// Parameter [responseContentLanguage] :
  /// Sets the <code>Content-Language</code> header of the response.
  ///
  /// Parameter [responseContentType] :
  /// Sets the <code>Content-Type</code> header of the response.
  ///
  /// Parameter [responseExpires] :
  /// Sets the <code>Expires</code> header of the response.
  ///
  /// Parameter [sSECustomerAlgorithm] :
  /// Specifies the algorithm to use to when encrypting the object (for example,
  /// AES256).
  ///
  /// Parameter [sSECustomerKey] :
  /// Specifies the customer-provided encryption key for Amazon S3 to use in
  /// encrypting data. This value is used to store the object and then it is
  /// discarded; Amazon S3 does not store the encryption key. The key must be
  /// appropriate for use with the algorithm specified in the
  /// <code>x-amz-server-side-encryption-customer-algorithm</code> header.
  ///
  /// Parameter [sSECustomerKeyMD5] :
  /// Specifies the 128-bit MD5 digest of the encryption key according to RFC
  /// 1321. Amazon S3 uses this header for a message integrity check to ensure
  /// that the encryption key was transmitted without error.
  ///
  /// Parameter [versionId] :
  /// VersionId used to reference a specific version of the object.
  Future<GetObjectOutput> getObject({
    @_s.required String bucket,
    @_s.required String key,
    String expectedBucketOwner,
    String ifMatch,
    DateTime ifModifiedSince,
    String ifNoneMatch,
    DateTime ifUnmodifiedSince,
    int partNumber,
    String range,
    RequestPayer requestPayer,
    String responseCacheControl,
    String responseContentDisposition,
    String responseContentEncoding,
    String responseContentLanguage,
    String responseContentType,
    DateTime responseExpires,
    String sSECustomerAlgorithm,
    Uint8List sSECustomerKey,
    String sSECustomerKeyMD5,
    String versionId,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    ArgumentError.checkNotNull(key, 'key');
    _s.validateStringLength(
      'key',
      key,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    ifMatch?.let((v) => headers['If-Match'] = v.toString());
    ifModifiedSince
        ?.let((v) => headers['If-Modified-Since'] = _s.rfc822ToJson(v));
    ifNoneMatch?.let((v) => headers['If-None-Match'] = v.toString());
    ifUnmodifiedSince
        ?.let((v) => headers['If-Unmodified-Since'] = _s.rfc822ToJson(v));
    range?.let((v) => headers['Range'] = v.toString());
    requestPayer?.let((v) => headers['x-amz-request-payer'] = v.toValue());
    sSECustomerAlgorithm?.let((v) =>
        headers['x-amz-server-side-encryption-customer-algorithm'] =
            v.toString());
    sSECustomerKey?.let((v) =>
        headers['x-amz-server-side-encryption-customer-key'] = v.toString());
    sSECustomerKeyMD5?.let((v) =>
        headers['x-amz-server-side-encryption-customer-key-MD5'] =
            v.toString());
    final $query = <String, List<String>>{
      if (partNumber != null) 'partNumber': [partNumber.toString()],
      if (responseCacheControl != null)
        'response-cache-control': [responseCacheControl],
      if (responseContentDisposition != null)
        'response-content-disposition': [responseContentDisposition],
      if (responseContentEncoding != null)
        'response-content-encoding': [responseContentEncoding],
      if (responseContentLanguage != null)
        'response-content-language': [responseContentLanguage],
      if (responseContentType != null)
        'response-content-type': [responseContentType],
      if (responseExpires != null)
        'response-expires': [_s.rfc822ToJson(responseExpires).toString()],
      if (versionId != null) 'versionId': [versionId],
    };
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri:
          '/${Uri.encodeComponent(bucket)}/${key.split('/').map(Uri.encodeComponent).join('/')}',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetObjectOutput(
      body: await $result.stream.toBytes(),
      acceptRanges:
          _s.extractHeaderStringValue($result.headers, 'accept-ranges'),
      bucketKeyEnabled: _s.extractHeaderBoolValue(
          $result.headers, 'x-amz-server-side-encryption-bucket-key-enabled'),
      cacheControl:
          _s.extractHeaderStringValue($result.headers, 'Cache-Control'),
      contentDisposition:
          _s.extractHeaderStringValue($result.headers, 'Content-Disposition'),
      contentEncoding:
          _s.extractHeaderStringValue($result.headers, 'Content-Encoding'),
      contentLanguage:
          _s.extractHeaderStringValue($result.headers, 'Content-Language'),
      contentLength:
          _s.extractHeaderIntValue($result.headers, 'Content-Length'),
      contentRange:
          _s.extractHeaderStringValue($result.headers, 'Content-Range'),
      contentType: _s.extractHeaderStringValue($result.headers, 'Content-Type'),
      deleteMarker:
          _s.extractHeaderBoolValue($result.headers, 'x-amz-delete-marker'),
      eTag: _s.extractHeaderStringValue($result.headers, 'ETag'),
      expiration:
          _s.extractHeaderStringValue($result.headers, 'x-amz-expiration'),
      expires: _s.extractHeaderDateTimeValue($result.headers, 'Expires'),
      lastModified:
          _s.extractHeaderDateTimeValue($result.headers, 'Last-Modified'),
      metadata: _s.extractHeaderMapValues($result.headers, 'x-amz-meta-'),
      missingMeta:
          _s.extractHeaderIntValue($result.headers, 'x-amz-missing-meta'),
      objectLockLegalHoldStatus: _s
          .extractHeaderStringValue(
              $result.headers, 'x-amz-object-lock-legal-hold')
          ?.toObjectLockLegalHoldStatus(),
      objectLockMode: _s
          .extractHeaderStringValue($result.headers, 'x-amz-object-lock-mode')
          ?.toObjectLockMode(),
      objectLockRetainUntilDate: _s.extractHeaderDateTimeValue(
          $result.headers, 'x-amz-object-lock-retain-until-date',
          parser: _s.timeStampFromJson),
      partsCount:
          _s.extractHeaderIntValue($result.headers, 'x-amz-mp-parts-count'),
      replicationStatus: _s
          .extractHeaderStringValue($result.headers, 'x-amz-replication-status')
          ?.toReplicationStatus(),
      requestCharged: _s
          .extractHeaderStringValue($result.headers, 'x-amz-request-charged')
          ?.toRequestCharged(),
      restore: _s.extractHeaderStringValue($result.headers, 'x-amz-restore'),
      sSECustomerAlgorithm: _s.extractHeaderStringValue(
          $result.headers, 'x-amz-server-side-encryption-customer-algorithm'),
      sSECustomerKeyMD5: _s.extractHeaderStringValue(
          $result.headers, 'x-amz-server-side-encryption-customer-key-MD5'),
      sSEKMSKeyId: _s.extractHeaderStringValue(
          $result.headers, 'x-amz-server-side-encryption-aws-kms-key-id'),
      serverSideEncryption: _s
          .extractHeaderStringValue(
              $result.headers, 'x-amz-server-side-encryption')
          ?.toServerSideEncryption(),
      storageClass: _s
          .extractHeaderStringValue($result.headers, 'x-amz-storage-class')
          ?.toStorageClass(),
      tagCount:
          _s.extractHeaderIntValue($result.headers, 'x-amz-tagging-count'),
      versionId:
          _s.extractHeaderStringValue($result.headers, 'x-amz-version-id'),
      websiteRedirectLocation: _s.extractHeaderStringValue(
          $result.headers, 'x-amz-website-redirect-location'),
    );
  }

  /// Returns the access control list (ACL) of an object. To use this operation,
  /// you must have <code>READ_ACP</code> access to the object.
  ///
  /// This action is not supported by Amazon S3 on Outposts.
  ///
  /// <b>Versioning</b>
  ///
  /// By default, GET returns ACL information about the current version of an
  /// object. To return ACL information about a different version, use the
  /// versionId subresource.
  ///
  /// The following operations are related to <code>GetObjectAcl</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html">GetObject</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteObject.html">DeleteObject</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutObject.html">PutObject</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [NoSuchKey].
  ///
  /// Parameter [bucket] :
  /// The bucket name that contains the object for which to get the ACL
  /// information.
  ///
  /// When using this API with an access point, you must direct requests to the
  /// access point hostname. The access point hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com.
  /// When using this operation with an access point through the AWS SDKs, you
  /// provide the access point ARN in place of the bucket name. For more
  /// information about access point ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using
  /// Access Points</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// Parameter [key] :
  /// The key of the object for which to get the ACL information.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  ///
  /// Parameter [versionId] :
  /// VersionId used to reference a specific version of the object.
  Future<GetObjectAclOutput> getObjectAcl({
    @_s.required String bucket,
    @_s.required String key,
    String expectedBucketOwner,
    RequestPayer requestPayer,
    String versionId,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    ArgumentError.checkNotNull(key, 'key');
    _s.validateStringLength(
      'key',
      key,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    requestPayer?.let((v) => headers['x-amz-request-payer'] = v.toValue());
    final $query = <String, List<String>>{
      if (versionId != null) 'versionId': [versionId],
    };
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri:
          '/${Uri.encodeComponent(bucket)}/${key.split('/').map(Uri.encodeComponent).join('/')}?acl',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return GetObjectAclOutput(
      grants: _s.extractXmlChild($elem, 'AccessControlList')?.let(($elem) =>
          $elem.findElements('Grant').map((c) => Grant.fromXml(c)).toList()),
      owner: _s.extractXmlChild($elem, 'Owner')?.let((e) => Owner.fromXml(e)),
      requestCharged: _s
          .extractHeaderStringValue($result.headers, 'x-amz-request-charged')
          ?.toRequestCharged(),
    );
  }

  /// Gets an object's current Legal Hold status. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lock.html">Locking
  /// Objects</a>.
  ///
  /// This action is not supported by Amazon S3 on Outposts.
  ///
  /// Parameter [bucket] :
  /// The bucket name containing the object whose Legal Hold status you want to
  /// retrieve.
  ///
  /// When using this API with an access point, you must direct requests to the
  /// access point hostname. The access point hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com.
  /// When using this operation with an access point through the AWS SDKs, you
  /// provide the access point ARN in place of the bucket name. For more
  /// information about access point ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using
  /// Access Points</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// Parameter [key] :
  /// The key name for the object whose Legal Hold status you want to retrieve.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  ///
  /// Parameter [versionId] :
  /// The version ID of the object whose Legal Hold status you want to retrieve.
  Future<GetObjectLegalHoldOutput> getObjectLegalHold({
    @_s.required String bucket,
    @_s.required String key,
    String expectedBucketOwner,
    RequestPayer requestPayer,
    String versionId,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    ArgumentError.checkNotNull(key, 'key');
    _s.validateStringLength(
      'key',
      key,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    requestPayer?.let((v) => headers['x-amz-request-payer'] = v.toValue());
    final $query = <String, List<String>>{
      if (versionId != null) 'versionId': [versionId],
    };
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri:
          '/${Uri.encodeComponent(bucket)}/${key.split('/').map(Uri.encodeComponent).join('/')}?legal-hold',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return GetObjectLegalHoldOutput(
      legalHold: ObjectLockLegalHold.fromXml($elem),
    );
  }

  /// Gets the Object Lock configuration for a bucket. The rule specified in the
  /// Object Lock configuration will be applied by default to every new object
  /// placed in the specified bucket. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lock.html">Locking
  /// Objects</a>.
  ///
  /// Parameter [bucket] :
  /// The bucket whose Object Lock configuration you want to retrieve.
  ///
  /// When using this API with an access point, you must direct requests to the
  /// access point hostname. The access point hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com.
  /// When using this operation with an access point through the AWS SDKs, you
  /// provide the access point ARN in place of the bucket name. For more
  /// information about access point ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using
  /// Access Points</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<GetObjectLockConfigurationOutput> getObjectLockConfiguration({
    @_s.required String bucket,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri: '/${Uri.encodeComponent(bucket)}?object-lock',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return GetObjectLockConfigurationOutput(
      objectLockConfiguration: ObjectLockConfiguration.fromXml($elem),
    );
  }

  /// Retrieves an object's retention settings. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lock.html">Locking
  /// Objects</a>.
  ///
  /// This action is not supported by Amazon S3 on Outposts.
  ///
  /// Parameter [bucket] :
  /// The bucket name containing the object whose retention settings you want to
  /// retrieve.
  ///
  /// When using this API with an access point, you must direct requests to the
  /// access point hostname. The access point hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com.
  /// When using this operation with an access point through the AWS SDKs, you
  /// provide the access point ARN in place of the bucket name. For more
  /// information about access point ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using
  /// Access Points</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// Parameter [key] :
  /// The key name for the object whose retention settings you want to retrieve.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  ///
  /// Parameter [versionId] :
  /// The version ID for the object whose retention settings you want to
  /// retrieve.
  Future<GetObjectRetentionOutput> getObjectRetention({
    @_s.required String bucket,
    @_s.required String key,
    String expectedBucketOwner,
    RequestPayer requestPayer,
    String versionId,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    ArgumentError.checkNotNull(key, 'key');
    _s.validateStringLength(
      'key',
      key,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    requestPayer?.let((v) => headers['x-amz-request-payer'] = v.toValue());
    final $query = <String, List<String>>{
      if (versionId != null) 'versionId': [versionId],
    };
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri:
          '/${Uri.encodeComponent(bucket)}/${key.split('/').map(Uri.encodeComponent).join('/')}?retention',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return GetObjectRetentionOutput(
      retention: ObjectLockRetention.fromXml($elem),
    );
  }

  /// Returns the tag-set of an object. You send the GET request against the
  /// tagging subresource associated with the object.
  ///
  /// To use this operation, you must have permission to perform the
  /// <code>s3:GetObjectTagging</code> action. By default, the GET operation
  /// returns information about current version of an object. For a versioned
  /// bucket, you can have multiple versions of an object in your bucket. To
  /// retrieve tags of any other version, use the versionId query parameter. You
  /// also need permission for the <code>s3:GetObjectVersionTagging</code>
  /// action.
  ///
  /// By default, the bucket owner has this permission and can grant this
  /// permission to others.
  ///
  /// For information about the Amazon S3 object tagging feature, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-tagging.html">Object
  /// Tagging</a>.
  ///
  /// The following operation is related to <code>GetObjectTagging</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutObjectTagging.html">PutObjectTagging</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The bucket name containing the object for which to get the tagging
  /// information.
  ///
  /// When using this API with an access point, you must direct requests to the
  /// access point hostname. The access point hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com.
  /// When using this operation with an access point through the AWS SDKs, you
  /// provide the access point ARN in place of the bucket name. For more
  /// information about access point ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using
  /// Access Points</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// When using this API with Amazon S3 on Outposts, you must direct requests
  /// to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com.
  /// When using this operation using S3 on Outposts through the AWS SDKs, you
  /// provide the Outposts bucket ARN in place of the bucket name. For more
  /// information about S3 on Outposts ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using
  /// S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// Parameter [key] :
  /// Object key for which to get the tagging information.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  ///
  /// Parameter [versionId] :
  /// The versionId of the object for which to get the tagging information.
  Future<GetObjectTaggingOutput> getObjectTagging({
    @_s.required String bucket,
    @_s.required String key,
    String expectedBucketOwner,
    String versionId,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    ArgumentError.checkNotNull(key, 'key');
    _s.validateStringLength(
      'key',
      key,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    final $query = <String, List<String>>{
      if (versionId != null) 'versionId': [versionId],
    };
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri:
          '/${Uri.encodeComponent(bucket)}/${key.split('/').map(Uri.encodeComponent).join('/')}?tagging',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return GetObjectTaggingOutput(
      tagSet: _s.extractXmlChild($elem, 'TagSet')?.let(($elem) =>
          $elem.findElements('Tag').map((c) => Tag.fromXml(c)).toList()),
      versionId:
          _s.extractHeaderStringValue($result.headers, 'x-amz-version-id'),
    );
  }

  /// Returns torrent files from a bucket. BitTorrent can save you bandwidth
  /// when you're distributing large files. For more information about
  /// BitTorrent, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3Torrent.html">Using
  /// BitTorrent with Amazon S3</a>.
  /// <note>
  /// You can get torrent only for objects that are less than 5 GB in size, and
  /// that are not encrypted using server-side encryption with a
  /// customer-provided encryption key.
  /// </note>
  /// To use GET, you must have READ access to the object.
  ///
  /// This action is not supported by Amazon S3 on Outposts.
  ///
  /// The following operation is related to <code>GetObjectTorrent</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html">GetObject</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The name of the bucket containing the object for which to get the torrent
  /// files.
  ///
  /// Parameter [key] :
  /// The object key for which to get the information.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<GetObjectTorrentOutput> getObjectTorrent({
    @_s.required String bucket,
    @_s.required String key,
    String expectedBucketOwner,
    RequestPayer requestPayer,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    ArgumentError.checkNotNull(key, 'key');
    _s.validateStringLength(
      'key',
      key,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    requestPayer?.let((v) => headers['x-amz-request-payer'] = v.toValue());
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri:
          '/${Uri.encodeComponent(bucket)}/${key.split('/').map(Uri.encodeComponent).join('/')}?torrent',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetObjectTorrentOutput(
      body: await $result.stream.toBytes(),
      requestCharged: _s
          .extractHeaderStringValue($result.headers, 'x-amz-request-charged')
          ?.toRequestCharged(),
    );
  }

  /// Retrieves the <code>PublicAccessBlock</code> configuration for an Amazon
  /// S3 bucket. To use this operation, you must have the
  /// <code>s3:GetBucketPublicAccessBlock</code> permission. For more
  /// information about Amazon S3 permissions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html">Specifying
  /// Permissions in a Policy</a>.
  /// <important>
  /// When Amazon S3 evaluates the <code>PublicAccessBlock</code> configuration
  /// for a bucket or an object, it checks the <code>PublicAccessBlock</code>
  /// configuration for both the bucket (or the bucket that contains the object)
  /// and the bucket owner's account. If the <code>PublicAccessBlock</code>
  /// settings are different between the bucket and the account, Amazon S3 uses
  /// the most restrictive combination of the bucket-level and account-level
  /// settings.
  /// </important>
  /// For more information about when Amazon S3 considers a bucket or an object
  /// public, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html#access-control-block-public-access-policy-status">The
  /// Meaning of "Public"</a>.
  ///
  /// The following operations are related to <code>GetPublicAccessBlock</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html">Using
  /// Amazon S3 Block Public Access</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutPublicAccessBlock.html">PutPublicAccessBlock</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetPublicAccessBlock.html">GetPublicAccessBlock</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeletePublicAccessBlock.html">DeletePublicAccessBlock</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The name of the Amazon S3 bucket whose <code>PublicAccessBlock</code>
  /// configuration you want to retrieve.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<GetPublicAccessBlockOutput> getPublicAccessBlock({
    @_s.required String bucket,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri: '/${Uri.encodeComponent(bucket)}?publicAccessBlock',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return GetPublicAccessBlockOutput(
      publicAccessBlockConfiguration:
          PublicAccessBlockConfiguration.fromXml($elem),
    );
  }

  /// This operation is useful to determine if a bucket exists and you have
  /// permission to access it. The operation returns a <code>200 OK</code> if
  /// the bucket exists and you have permission to access it. Otherwise, the
  /// operation might return responses such as <code>404 Not Found</code> and
  /// <code>403 Forbidden</code>.
  ///
  /// To use this operation, you must have permissions to perform the
  /// <code>s3:ListBucket</code> action. The bucket owner has this permission by
  /// default and can grant this permission to others. For more information
  /// about permissions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">Permissions
  /// Related to Bucket Subresource Operations</a> and <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing
  /// Access Permissions to Your Amazon S3 Resources</a>.
  ///
  /// May throw [NoSuchBucket].
  ///
  /// Parameter [bucket] :
  /// The bucket name.
  ///
  /// When using this API with an access point, you must direct requests to the
  /// access point hostname. The access point hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com.
  /// When using this operation with an access point through the AWS SDKs, you
  /// provide the access point ARN in place of the bucket name. For more
  /// information about access point ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using
  /// Access Points</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// When using this API with Amazon S3 on Outposts, you must direct requests
  /// to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com.
  /// When using this operation using S3 on Outposts through the AWS SDKs, you
  /// provide the Outposts bucket ARN in place of the bucket name. For more
  /// information about S3 on Outposts ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using
  /// S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<void> headBucket({
    @_s.required String bucket,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    await _protocol.send(
      method: 'HEAD',
      requestUri: '/${Uri.encodeComponent(bucket)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// The HEAD operation retrieves metadata from an object without returning the
  /// object itself. This operation is useful if you're only interested in an
  /// object's metadata. To use HEAD, you must have READ access to the object.
  ///
  /// A <code>HEAD</code> request has the same options as a <code>GET</code>
  /// operation on an object. The response is identical to the <code>GET</code>
  /// response except that there is no response body.
  ///
  /// If you encrypt an object by using server-side encryption with
  /// customer-provided encryption keys (SSE-C) when you store the object in
  /// Amazon S3, then when you retrieve the metadata from the object, you must
  /// use the following headers:
  ///
  /// <ul>
  /// <li>
  /// x-amz-server-side-encryption-customer-algorithm
  /// </li>
  /// <li>
  /// x-amz-server-side-encryption-customer-key
  /// </li>
  /// <li>
  /// x-amz-server-side-encryption-customer-key-MD5
  /// </li>
  /// </ul>
  /// For more information about SSE-C, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/ServerSideEncryptionCustomerKeys.html">Server-Side
  /// Encryption (Using Customer-Provided Encryption Keys)</a>.
  /// <note>
  /// Encryption request headers, like
  /// <code>x-amz-server-side-encryption</code>, should not be sent for GET
  /// requests if your object uses server-side encryption with CMKs stored in
  /// AWS KMS (SSE-KMS) or server-side encryption with Amazon S3–managed
  /// encryption keys (SSE-S3). If your object does use these types of keys,
  /// you’ll get an HTTP 400 BadRequest error.
  /// </note>
  /// Request headers are limited to 8 KB in size. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTCommonRequestHeaders.html">Common
  /// Request Headers</a>.
  ///
  /// Consider the following when using request headers:
  ///
  /// <ul>
  /// <li>
  /// Consideration 1 – If both of the <code>If-Match</code> and
  /// <code>If-Unmodified-Since</code> headers are present in the request as
  /// follows:
  ///
  /// <ul>
  /// <li>
  /// <code>If-Match</code> condition evaluates to <code>true</code>, and;
  /// </li>
  /// <li>
  /// <code>If-Unmodified-Since</code> condition evaluates to
  /// <code>false</code>;
  /// </li>
  /// </ul>
  /// Then Amazon S3 returns <code>200 OK</code> and the data requested.
  /// </li>
  /// <li>
  /// Consideration 2 – If both of the <code>If-None-Match</code> and
  /// <code>If-Modified-Since</code> headers are present in the request as
  /// follows:
  ///
  /// <ul>
  /// <li>
  /// <code>If-None-Match</code> condition evaluates to <code>false</code>, and;
  /// </li>
  /// <li>
  /// <code>If-Modified-Since</code> condition evaluates to <code>true</code>;
  /// </li>
  /// </ul>
  /// Then Amazon S3 returns the <code>304 Not Modified</code> response code.
  /// </li>
  /// </ul>
  /// For more information about conditional requests, see <a
  /// href="https://tools.ietf.org/html/rfc7232">RFC 7232</a>.
  ///
  /// <b>Permissions</b>
  ///
  /// You need the <code>s3:GetObject</code> permission for this operation. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html">Specifying
  /// Permissions in a Policy</a>. If the object you request does not exist, the
  /// error Amazon S3 returns depends on whether you also have the s3:ListBucket
  /// permission.
  ///
  /// <ul>
  /// <li>
  /// If you have the <code>s3:ListBucket</code> permission on the bucket,
  /// Amazon S3 returns an HTTP status code 404 ("no such key") error.
  /// </li>
  /// <li>
  /// If you don’t have the <code>s3:ListBucket</code> permission, Amazon S3
  /// returns an HTTP status code 403 ("access denied") error.
  /// </li>
  /// </ul>
  /// The following operation is related to <code>HeadObject</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html">GetObject</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [NoSuchKey].
  ///
  /// Parameter [bucket] :
  /// The name of the bucket containing the object.
  ///
  /// When using this API with an access point, you must direct requests to the
  /// access point hostname. The access point hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com.
  /// When using this operation with an access point through the AWS SDKs, you
  /// provide the access point ARN in place of the bucket name. For more
  /// information about access point ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using
  /// Access Points</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// When using this API with Amazon S3 on Outposts, you must direct requests
  /// to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com.
  /// When using this operation using S3 on Outposts through the AWS SDKs, you
  /// provide the Outposts bucket ARN in place of the bucket name. For more
  /// information about S3 on Outposts ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using
  /// S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// Parameter [key] :
  /// The object key.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  ///
  /// Parameter [ifMatch] :
  /// Return the object only if its entity tag (ETag) is the same as the one
  /// specified, otherwise return a 412 (precondition failed).
  ///
  /// Parameter [ifModifiedSince] :
  /// Return the object only if it has been modified since the specified time,
  /// otherwise return a 304 (not modified).
  ///
  /// Parameter [ifNoneMatch] :
  /// Return the object only if its entity tag (ETag) is different from the one
  /// specified, otherwise return a 304 (not modified).
  ///
  /// Parameter [ifUnmodifiedSince] :
  /// Return the object only if it has not been modified since the specified
  /// time, otherwise return a 412 (precondition failed).
  ///
  /// Parameter [partNumber] :
  /// Part number of the object being read. This is a positive integer between 1
  /// and 10,000. Effectively performs a 'ranged' HEAD request for the part
  /// specified. Useful querying about the size of the part and the number of
  /// parts in this object.
  ///
  /// Parameter [range] :
  /// Downloads the specified range bytes of an object. For more information
  /// about the HTTP Range header, see <a
  /// href="http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.35">http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.35</a>.
  /// <note>
  /// Amazon S3 doesn't support retrieving multiple ranges of data per
  /// <code>GET</code> request.
  /// </note>
  ///
  /// Parameter [sSECustomerAlgorithm] :
  /// Specifies the algorithm to use to when encrypting the object (for example,
  /// AES256).
  ///
  /// Parameter [sSECustomerKey] :
  /// Specifies the customer-provided encryption key for Amazon S3 to use in
  /// encrypting data. This value is used to store the object and then it is
  /// discarded; Amazon S3 does not store the encryption key. The key must be
  /// appropriate for use with the algorithm specified in the
  /// <code>x-amz-server-side-encryption-customer-algorithm</code> header.
  ///
  /// Parameter [sSECustomerKeyMD5] :
  /// Specifies the 128-bit MD5 digest of the encryption key according to RFC
  /// 1321. Amazon S3 uses this header for a message integrity check to ensure
  /// that the encryption key was transmitted without error.
  ///
  /// Parameter [versionId] :
  /// VersionId used to reference a specific version of the object.
  Future<HeadObjectOutput> headObject({
    @_s.required String bucket,
    @_s.required String key,
    String expectedBucketOwner,
    String ifMatch,
    DateTime ifModifiedSince,
    String ifNoneMatch,
    DateTime ifUnmodifiedSince,
    int partNumber,
    String range,
    RequestPayer requestPayer,
    String sSECustomerAlgorithm,
    Uint8List sSECustomerKey,
    String sSECustomerKeyMD5,
    String versionId,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    ArgumentError.checkNotNull(key, 'key');
    _s.validateStringLength(
      'key',
      key,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    ifMatch?.let((v) => headers['If-Match'] = v.toString());
    ifModifiedSince
        ?.let((v) => headers['If-Modified-Since'] = _s.rfc822ToJson(v));
    ifNoneMatch?.let((v) => headers['If-None-Match'] = v.toString());
    ifUnmodifiedSince
        ?.let((v) => headers['If-Unmodified-Since'] = _s.rfc822ToJson(v));
    range?.let((v) => headers['Range'] = v.toString());
    requestPayer?.let((v) => headers['x-amz-request-payer'] = v.toValue());
    sSECustomerAlgorithm?.let((v) =>
        headers['x-amz-server-side-encryption-customer-algorithm'] =
            v.toString());
    sSECustomerKey?.let((v) =>
        headers['x-amz-server-side-encryption-customer-key'] = v.toString());
    sSECustomerKeyMD5?.let((v) =>
        headers['x-amz-server-side-encryption-customer-key-MD5'] =
            v.toString());
    final $query = <String, List<String>>{
      if (partNumber != null) 'partNumber': [partNumber.toString()],
      if (versionId != null) 'versionId': [versionId],
    };
    final $result = await _protocol.sendRaw(
      method: 'HEAD',
      requestUri:
          '/${Uri.encodeComponent(bucket)}/${key.split('/').map(Uri.encodeComponent).join('/')}',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return HeadObjectOutput(
      acceptRanges:
          _s.extractHeaderStringValue($result.headers, 'accept-ranges'),
      archiveStatus: _s
          .extractHeaderStringValue($result.headers, 'x-amz-archive-status')
          ?.toArchiveStatus(),
      bucketKeyEnabled: _s.extractHeaderBoolValue(
          $result.headers, 'x-amz-server-side-encryption-bucket-key-enabled'),
      cacheControl:
          _s.extractHeaderStringValue($result.headers, 'Cache-Control'),
      contentDisposition:
          _s.extractHeaderStringValue($result.headers, 'Content-Disposition'),
      contentEncoding:
          _s.extractHeaderStringValue($result.headers, 'Content-Encoding'),
      contentLanguage:
          _s.extractHeaderStringValue($result.headers, 'Content-Language'),
      contentLength:
          _s.extractHeaderIntValue($result.headers, 'Content-Length'),
      contentType: _s.extractHeaderStringValue($result.headers, 'Content-Type'),
      deleteMarker:
          _s.extractHeaderBoolValue($result.headers, 'x-amz-delete-marker'),
      eTag: _s.extractHeaderStringValue($result.headers, 'ETag'),
      expiration:
          _s.extractHeaderStringValue($result.headers, 'x-amz-expiration'),
      expires: _s.extractHeaderDateTimeValue($result.headers, 'Expires'),
      lastModified:
          _s.extractHeaderDateTimeValue($result.headers, 'Last-Modified'),
      metadata: _s.extractHeaderMapValues($result.headers, 'x-amz-meta-'),
      missingMeta:
          _s.extractHeaderIntValue($result.headers, 'x-amz-missing-meta'),
      objectLockLegalHoldStatus: _s
          .extractHeaderStringValue(
              $result.headers, 'x-amz-object-lock-legal-hold')
          ?.toObjectLockLegalHoldStatus(),
      objectLockMode: _s
          .extractHeaderStringValue($result.headers, 'x-amz-object-lock-mode')
          ?.toObjectLockMode(),
      objectLockRetainUntilDate: _s.extractHeaderDateTimeValue(
          $result.headers, 'x-amz-object-lock-retain-until-date',
          parser: _s.timeStampFromJson),
      partsCount:
          _s.extractHeaderIntValue($result.headers, 'x-amz-mp-parts-count'),
      replicationStatus: _s
          .extractHeaderStringValue($result.headers, 'x-amz-replication-status')
          ?.toReplicationStatus(),
      requestCharged: _s
          .extractHeaderStringValue($result.headers, 'x-amz-request-charged')
          ?.toRequestCharged(),
      restore: _s.extractHeaderStringValue($result.headers, 'x-amz-restore'),
      sSECustomerAlgorithm: _s.extractHeaderStringValue(
          $result.headers, 'x-amz-server-side-encryption-customer-algorithm'),
      sSECustomerKeyMD5: _s.extractHeaderStringValue(
          $result.headers, 'x-amz-server-side-encryption-customer-key-MD5'),
      sSEKMSKeyId: _s.extractHeaderStringValue(
          $result.headers, 'x-amz-server-side-encryption-aws-kms-key-id'),
      serverSideEncryption: _s
          .extractHeaderStringValue(
              $result.headers, 'x-amz-server-side-encryption')
          ?.toServerSideEncryption(),
      storageClass: _s
          .extractHeaderStringValue($result.headers, 'x-amz-storage-class')
          ?.toStorageClass(),
      versionId:
          _s.extractHeaderStringValue($result.headers, 'x-amz-version-id'),
      websiteRedirectLocation: _s.extractHeaderStringValue(
          $result.headers, 'x-amz-website-redirect-location'),
    );
  }

  /// Lists the analytics configurations for the bucket. You can have up to
  /// 1,000 analytics configurations per bucket.
  ///
  /// This operation supports list pagination and does not return more than 100
  /// configurations at a time. You should always check the
  /// <code>IsTruncated</code> element in the response. If there are no more
  /// configurations to list, <code>IsTruncated</code> is set to false. If there
  /// are more configurations to list, <code>IsTruncated</code> is set to true,
  /// and there will be a value in <code>NextContinuationToken</code>. You use
  /// the <code>NextContinuationToken</code> value to continue the pagination of
  /// the list by passing the value in continuation-token in the request to
  /// <code>GET</code> the next page.
  ///
  /// To use this operation, you must have permissions to perform the
  /// <code>s3:GetAnalyticsConfiguration</code> action. The bucket owner has
  /// this permission by default. The bucket owner can grant this permission to
  /// others. For more information about permissions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">Permissions
  /// Related to Bucket Subresource Operations</a> and <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing
  /// Access Permissions to Your Amazon S3 Resources</a>.
  ///
  /// For information about Amazon S3 analytics feature, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/analytics-storage-class.html">Amazon
  /// S3 Analytics – Storage Class Analysis</a>.
  ///
  /// The following operations are related to
  /// <code>ListBucketAnalyticsConfigurations</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketAnalyticsConfiguration.html">GetBucketAnalyticsConfiguration</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketAnalyticsConfiguration.html">DeleteBucketAnalyticsConfiguration</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketAnalyticsConfiguration.html">PutBucketAnalyticsConfiguration</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The name of the bucket from which analytics configurations are retrieved.
  ///
  /// Parameter [continuationToken] :
  /// The ContinuationToken that represents a placeholder from where this
  /// request should begin.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<ListBucketAnalyticsConfigurationsOutput>
      listBucketAnalyticsConfigurations({
    @_s.required String bucket,
    String continuationToken,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    final $query = <String, List<String>>{
      if (continuationToken != null) 'continuation-token': [continuationToken],
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/${Uri.encodeComponent(bucket)}?analytics',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListBucketAnalyticsConfigurationsOutput.fromXml($result.body);
  }

  /// Lists the S3 Intelligent-Tiering configuration from the specified bucket.
  ///
  /// The S3 Intelligent-Tiering storage class is designed to optimize storage
  /// costs by automatically moving data to the most cost-effective storage
  /// access tier, without additional operational overhead. S3
  /// Intelligent-Tiering delivers automatic cost savings by moving data between
  /// access tiers, when access patterns change.
  ///
  /// The S3 Intelligent-Tiering storage class is suitable for objects larger
  /// than 128 KB that you plan to store for at least 30 days. If the size of an
  /// object is less than 128 KB, it is not eligible for auto-tiering. Smaller
  /// objects can be stored, but they are always charged at the frequent access
  /// tier rates in the S3 Intelligent-Tiering storage class.
  ///
  /// If you delete an object before the end of the 30-day minimum storage
  /// duration period, you are charged for 30 days. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-class-intro.html#sc-dynamic-data-access">Storage
  /// class for automatically optimizing frequently and infrequently accessed
  /// objects</a>.
  ///
  /// Operations related to
  /// <code>ListBucketIntelligentTieringConfigurations</code> include:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketIntelligentTieringConfiguration.html">DeleteBucketIntelligentTieringConfiguration</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketIntelligentTieringConfiguration.html">PutBucketIntelligentTieringConfiguration</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketIntelligentTieringConfiguration.html">GetBucketIntelligentTieringConfiguration</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The name of the Amazon S3 bucket whose configuration you want to modify or
  /// retrieve.
  ///
  /// Parameter [continuationToken] :
  /// The ContinuationToken that represents a placeholder from where this
  /// request should begin.
  Future<ListBucketIntelligentTieringConfigurationsOutput>
      listBucketIntelligentTieringConfigurations({
    @_s.required String bucket,
    String continuationToken,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    final $query = <String, List<String>>{
      if (continuationToken != null) 'continuation-token': [continuationToken],
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/${Uri.encodeComponent(bucket)}?intelligent-tiering',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListBucketIntelligentTieringConfigurationsOutput.fromXml(
        $result.body);
  }

  /// Returns a list of inventory configurations for the bucket. You can have up
  /// to 1,000 analytics configurations per bucket.
  ///
  /// This operation supports list pagination and does not return more than 100
  /// configurations at a time. Always check the <code>IsTruncated</code>
  /// element in the response. If there are no more configurations to list,
  /// <code>IsTruncated</code> is set to false. If there are more configurations
  /// to list, <code>IsTruncated</code> is set to true, and there is a value in
  /// <code>NextContinuationToken</code>. You use the
  /// <code>NextContinuationToken</code> value to continue the pagination of the
  /// list by passing the value in continuation-token in the request to
  /// <code>GET</code> the next page.
  ///
  /// To use this operation, you must have permissions to perform the
  /// <code>s3:GetInventoryConfiguration</code> action. The bucket owner has
  /// this permission by default. The bucket owner can grant this permission to
  /// others. For more information about permissions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">Permissions
  /// Related to Bucket Subresource Operations</a> and <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing
  /// Access Permissions to Your Amazon S3 Resources</a>.
  ///
  /// For information about the Amazon S3 inventory feature, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-inventory.html">Amazon
  /// S3 Inventory</a>
  ///
  /// The following operations are related to
  /// <code>ListBucketInventoryConfigurations</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketInventoryConfiguration.html">GetBucketInventoryConfiguration</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketInventoryConfiguration.html">DeleteBucketInventoryConfiguration</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketInventoryConfiguration.html">PutBucketInventoryConfiguration</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The name of the bucket containing the inventory configurations to
  /// retrieve.
  ///
  /// Parameter [continuationToken] :
  /// The marker used to continue an inventory configuration listing that has
  /// been truncated. Use the NextContinuationToken from a previously truncated
  /// list response to continue the listing. The continuation token is an opaque
  /// value that Amazon S3 understands.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<ListBucketInventoryConfigurationsOutput>
      listBucketInventoryConfigurations({
    @_s.required String bucket,
    String continuationToken,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    final $query = <String, List<String>>{
      if (continuationToken != null) 'continuation-token': [continuationToken],
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/${Uri.encodeComponent(bucket)}?inventory',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListBucketInventoryConfigurationsOutput.fromXml($result.body);
  }

  /// Lists the metrics configurations for the bucket. The metrics
  /// configurations are only for the request metrics of the bucket and do not
  /// provide information on daily storage metrics. You can have up to 1,000
  /// configurations per bucket.
  ///
  /// This operation supports list pagination and does not return more than 100
  /// configurations at a time. Always check the <code>IsTruncated</code>
  /// element in the response. If there are no more configurations to list,
  /// <code>IsTruncated</code> is set to false. If there are more configurations
  /// to list, <code>IsTruncated</code> is set to true, and there is a value in
  /// <code>NextContinuationToken</code>. You use the
  /// <code>NextContinuationToken</code> value to continue the pagination of the
  /// list by passing the value in <code>continuation-token</code> in the
  /// request to <code>GET</code> the next page.
  ///
  /// To use this operation, you must have permissions to perform the
  /// <code>s3:GetMetricsConfiguration</code> action. The bucket owner has this
  /// permission by default. The bucket owner can grant this permission to
  /// others. For more information about permissions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">Permissions
  /// Related to Bucket Subresource Operations</a> and <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing
  /// Access Permissions to Your Amazon S3 Resources</a>.
  ///
  /// For more information about metrics configurations and CloudWatch request
  /// metrics, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/cloudwatch-monitoring.html">Monitoring
  /// Metrics with Amazon CloudWatch</a>.
  ///
  /// The following operations are related to
  /// <code>ListBucketMetricsConfigurations</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketMetricsConfiguration.html">PutBucketMetricsConfiguration</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketMetricsConfiguration.html">GetBucketMetricsConfiguration</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketMetricsConfiguration.html">DeleteBucketMetricsConfiguration</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The name of the bucket containing the metrics configurations to retrieve.
  ///
  /// Parameter [continuationToken] :
  /// The marker that is used to continue a metrics configuration listing that
  /// has been truncated. Use the NextContinuationToken from a previously
  /// truncated list response to continue the listing. The continuation token is
  /// an opaque value that Amazon S3 understands.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<ListBucketMetricsConfigurationsOutput>
      listBucketMetricsConfigurations({
    @_s.required String bucket,
    String continuationToken,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    final $query = <String, List<String>>{
      if (continuationToken != null) 'continuation-token': [continuationToken],
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/${Uri.encodeComponent(bucket)}?metrics',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListBucketMetricsConfigurationsOutput.fromXml($result.body);
  }

  /// Returns a list of all buckets owned by the authenticated sender of the
  /// request.
  Future<ListBucketsOutput> listBuckets() async {
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
    return ListBucketsOutput.fromXml($result.body);
  }

  /// This operation lists in-progress multipart uploads. An in-progress
  /// multipart upload is a multipart upload that has been initiated using the
  /// Initiate Multipart Upload request, but has not yet been completed or
  /// aborted.
  ///
  /// This operation returns at most 1,000 multipart uploads in the response.
  /// 1,000 multipart uploads is the maximum number of uploads a response can
  /// include, which is also the default value. You can further limit the number
  /// of uploads in a response by specifying the <code>max-uploads</code>
  /// parameter in the response. If additional multipart uploads satisfy the
  /// list criteria, the response will contain an <code>IsTruncated</code>
  /// element with the value true. To list the additional multipart uploads, use
  /// the <code>key-marker</code> and <code>upload-id-marker</code> request
  /// parameters.
  ///
  /// In the response, the uploads are sorted by key. If your application has
  /// initiated more than one multipart upload using the same object key, then
  /// uploads in the response are first sorted by key. Additionally, uploads are
  /// sorted in ascending order within each key by the upload initiation time.
  ///
  /// For more information on multipart uploads, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/uploadobjusingmpu.html">Uploading
  /// Objects Using Multipart Upload</a>.
  ///
  /// For information on permissions required to use the multipart upload API,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuAndPermissions.html">Multipart
  /// Upload API and Permissions</a>.
  ///
  /// The following operations are related to <code>ListMultipartUploads</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateMultipartUpload.html">CreateMultipartUpload</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPart.html">UploadPart</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CompleteMultipartUpload.html">CompleteMultipartUpload</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListParts.html">ListParts</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_AbortMultipartUpload.html">AbortMultipartUpload</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The name of the bucket to which the multipart upload was initiated.
  ///
  /// When using this API with an access point, you must direct requests to the
  /// access point hostname. The access point hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com.
  /// When using this operation with an access point through the AWS SDKs, you
  /// provide the access point ARN in place of the bucket name. For more
  /// information about access point ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using
  /// Access Points</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// When using this API with Amazon S3 on Outposts, you must direct requests
  /// to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com.
  /// When using this operation using S3 on Outposts through the AWS SDKs, you
  /// provide the Outposts bucket ARN in place of the bucket name. For more
  /// information about S3 on Outposts ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using
  /// S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// Parameter [delimiter] :
  /// Character you use to group keys.
  ///
  /// All keys that contain the same string between the prefix, if specified,
  /// and the first occurrence of the delimiter after the prefix are grouped
  /// under a single result element, <code>CommonPrefixes</code>. If you don't
  /// specify the prefix parameter, then the substring starts at the beginning
  /// of the key. The keys that are grouped under <code>CommonPrefixes</code>
  /// result element are not returned elsewhere in the response.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  ///
  /// Parameter [keyMarker] :
  /// Together with upload-id-marker, this parameter specifies the multipart
  /// upload after which listing should begin.
  ///
  /// If <code>upload-id-marker</code> is not specified, only the keys
  /// lexicographically greater than the specified <code>key-marker</code> will
  /// be included in the list.
  ///
  /// If <code>upload-id-marker</code> is specified, any multipart uploads for a
  /// key equal to the <code>key-marker</code> might also be included, provided
  /// those multipart uploads have upload IDs lexicographically greater than the
  /// specified <code>upload-id-marker</code>.
  ///
  /// Parameter [maxUploads] :
  /// Sets the maximum number of multipart uploads, from 1 to 1,000, to return
  /// in the response body. 1,000 is the maximum number of uploads that can be
  /// returned in a response.
  ///
  /// Parameter [prefix] :
  /// Lists in-progress uploads only for those keys that begin with the
  /// specified prefix. You can use prefixes to separate a bucket into different
  /// grouping of keys. (You can think of using prefix to make groups in the
  /// same way you'd use a folder in a file system.)
  ///
  /// Parameter [uploadIdMarker] :
  /// Together with key-marker, specifies the multipart upload after which
  /// listing should begin. If key-marker is not specified, the upload-id-marker
  /// parameter is ignored. Otherwise, any multipart uploads for a key equal to
  /// the key-marker might be included in the list only if they have an upload
  /// ID lexicographically greater than the specified
  /// <code>upload-id-marker</code>.
  Future<ListMultipartUploadsOutput> listMultipartUploads({
    @_s.required String bucket,
    String delimiter,
    EncodingType encodingType,
    String expectedBucketOwner,
    String keyMarker,
    int maxUploads,
    String prefix,
    String uploadIdMarker,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    final $query = <String, List<String>>{
      if (delimiter != null) 'delimiter': [delimiter],
      if (encodingType != null) 'encoding-type': [encodingType.toValue()],
      if (keyMarker != null) 'key-marker': [keyMarker],
      if (maxUploads != null) 'max-uploads': [maxUploads.toString()],
      if (prefix != null) 'prefix': [prefix],
      if (uploadIdMarker != null) 'upload-id-marker': [uploadIdMarker],
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/${Uri.encodeComponent(bucket)}?uploads',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListMultipartUploadsOutput.fromXml($result.body);
  }

  /// Returns metadata about all versions of the objects in a bucket. You can
  /// also use request parameters as selection criteria to return metadata about
  /// a subset of all the object versions.
  /// <note>
  /// A 200 OK response can contain valid or invalid XML. Make sure to design
  /// your application to parse the contents of the response and handle it
  /// appropriately.
  /// </note>
  /// To use this operation, you must have READ access to the bucket.
  ///
  /// This action is not supported by Amazon S3 on Outposts.
  ///
  /// The following operations are related to <code>ListObjectVersions</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListObjectsV2.html">ListObjectsV2</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html">GetObject</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutObject.html">PutObject</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteObject.html">DeleteObject</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The bucket name that contains the objects.
  ///
  /// Parameter [delimiter] :
  /// A delimiter is a character that you specify to group keys. All keys that
  /// contain the same string between the <code>prefix</code> and the first
  /// occurrence of the delimiter are grouped under a single result element in
  /// CommonPrefixes. These groups are counted as one result against the
  /// max-keys limitation. These keys are not returned elsewhere in the
  /// response.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  ///
  /// Parameter [keyMarker] :
  /// Specifies the key to start with when listing objects in a bucket.
  ///
  /// Parameter [maxKeys] :
  /// Sets the maximum number of keys returned in the response. By default the
  /// API returns up to 1,000 key names. The response might contain fewer keys
  /// but will never contain more. If additional keys satisfy the search
  /// criteria, but were not returned because max-keys was exceeded, the
  /// response contains &lt;isTruncated&gt;true&lt;/isTruncated&gt;. To return
  /// the additional keys, see key-marker and version-id-marker.
  ///
  /// Parameter [prefix] :
  /// Use this parameter to select only those keys that begin with the specified
  /// prefix. You can use prefixes to separate a bucket into different groupings
  /// of keys. (You can think of using prefix to make groups in the same way
  /// you'd use a folder in a file system.) You can use prefix with delimiter to
  /// roll up numerous objects into a single result under CommonPrefixes.
  ///
  /// Parameter [versionIdMarker] :
  /// Specifies the object version you want to start listing from.
  Future<ListObjectVersionsOutput> listObjectVersions({
    @_s.required String bucket,
    String delimiter,
    EncodingType encodingType,
    String expectedBucketOwner,
    String keyMarker,
    int maxKeys,
    String prefix,
    String versionIdMarker,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    final $query = <String, List<String>>{
      if (delimiter != null) 'delimiter': [delimiter],
      if (encodingType != null) 'encoding-type': [encodingType.toValue()],
      if (keyMarker != null) 'key-marker': [keyMarker],
      if (maxKeys != null) 'max-keys': [maxKeys.toString()],
      if (prefix != null) 'prefix': [prefix],
      if (versionIdMarker != null) 'version-id-marker': [versionIdMarker],
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/${Uri.encodeComponent(bucket)}?versions',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListObjectVersionsOutput.fromXml($result.body);
  }

  /// Returns some or all (up to 1,000) of the objects in a bucket. You can use
  /// the request parameters as selection criteria to return a subset of the
  /// objects in a bucket. A 200 OK response can contain valid or invalid XML.
  /// Be sure to design your application to parse the contents of the response
  /// and handle it appropriately.
  /// <important>
  /// This API has been revised. We recommend that you use the newer version, <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListObjectsV2.html">ListObjectsV2</a>,
  /// when developing applications. For backward compatibility, Amazon S3
  /// continues to support <code>ListObjects</code>.
  /// </important>
  /// The following operations are related to <code>ListObjects</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListObjectsV2.html">ListObjectsV2</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html">GetObject</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutObject.html">PutObject</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucket.html">CreateBucket</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListBuckets.html">ListBuckets</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [NoSuchBucket].
  ///
  /// Parameter [bucket] :
  /// The name of the bucket containing the objects.
  ///
  /// When using this API with an access point, you must direct requests to the
  /// access point hostname. The access point hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com.
  /// When using this operation with an access point through the AWS SDKs, you
  /// provide the access point ARN in place of the bucket name. For more
  /// information about access point ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using
  /// Access Points</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// When using this API with Amazon S3 on Outposts, you must direct requests
  /// to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com.
  /// When using this operation using S3 on Outposts through the AWS SDKs, you
  /// provide the Outposts bucket ARN in place of the bucket name. For more
  /// information about S3 on Outposts ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using
  /// S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// Parameter [delimiter] :
  /// A delimiter is a character you use to group keys.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  ///
  /// Parameter [marker] :
  /// Specifies the key to start with when listing objects in a bucket.
  ///
  /// Parameter [maxKeys] :
  /// Sets the maximum number of keys returned in the response. By default the
  /// API returns up to 1,000 key names. The response might contain fewer keys
  /// but will never contain more.
  ///
  /// Parameter [prefix] :
  /// Limits the response to keys that begin with the specified prefix.
  ///
  /// Parameter [requestPayer] :
  /// Confirms that the requester knows that she or he will be charged for the
  /// list objects request. Bucket owners need not specify this parameter in
  /// their requests.
  Future<ListObjectsOutput> listObjects({
    @_s.required String bucket,
    String delimiter,
    EncodingType encodingType,
    String expectedBucketOwner,
    String marker,
    int maxKeys,
    String prefix,
    RequestPayer requestPayer,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    requestPayer?.let((v) => headers['x-amz-request-payer'] = v.toValue());
    final $query = <String, List<String>>{
      if (delimiter != null) 'delimiter': [delimiter],
      if (encodingType != null) 'encoding-type': [encodingType.toValue()],
      if (marker != null) 'marker': [marker],
      if (maxKeys != null) 'max-keys': [maxKeys.toString()],
      if (prefix != null) 'prefix': [prefix],
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/${Uri.encodeComponent(bucket)}',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListObjectsOutput.fromXml($result.body);
  }

  /// Returns some or all (up to 1,000) of the objects in a bucket. You can use
  /// the request parameters as selection criteria to return a subset of the
  /// objects in a bucket. A <code>200 OK</code> response can contain valid or
  /// invalid XML. Make sure to design your application to parse the contents of
  /// the response and handle it appropriately.
  ///
  /// To use this operation, you must have READ access to the bucket.
  ///
  /// To use this operation in an AWS Identity and Access Management (IAM)
  /// policy, you must have permissions to perform the
  /// <code>s3:ListBucket</code> action. The bucket owner has this permission by
  /// default and can grant this permission to others. For more information
  /// about permissions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">Permissions
  /// Related to Bucket Subresource Operations</a> and <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing
  /// Access Permissions to Your Amazon S3 Resources</a>.
  /// <important>
  /// This section describes the latest revision of the API. We recommend that
  /// you use this revised API for application development. For backward
  /// compatibility, Amazon S3 continues to support the prior version of this
  /// API, <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListObjects.html">ListObjects</a>.
  /// </important>
  /// To get a list of your buckets, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListBuckets.html">ListBuckets</a>.
  ///
  /// The following operations are related to <code>ListObjectsV2</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html">GetObject</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutObject.html">PutObject</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucket.html">CreateBucket</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [NoSuchBucket].
  ///
  /// Parameter [bucket] :
  /// Bucket name to list.
  ///
  /// When using this API with an access point, you must direct requests to the
  /// access point hostname. The access point hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com.
  /// When using this operation with an access point through the AWS SDKs, you
  /// provide the access point ARN in place of the bucket name. For more
  /// information about access point ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using
  /// Access Points</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// When using this API with Amazon S3 on Outposts, you must direct requests
  /// to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com.
  /// When using this operation using S3 on Outposts through the AWS SDKs, you
  /// provide the Outposts bucket ARN in place of the bucket name. For more
  /// information about S3 on Outposts ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using
  /// S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// Parameter [continuationToken] :
  /// ContinuationToken indicates Amazon S3 that the list is being continued on
  /// this bucket with a token. ContinuationToken is obfuscated and is not a
  /// real key.
  ///
  /// Parameter [delimiter] :
  /// A delimiter is a character you use to group keys.
  ///
  /// Parameter [encodingType] :
  /// Encoding type used by Amazon S3 to encode object keys in the response.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  ///
  /// Parameter [fetchOwner] :
  /// The owner field is not present in listV2 by default, if you want to return
  /// owner field with each key in the result then set the fetch owner field to
  /// true.
  ///
  /// Parameter [maxKeys] :
  /// Sets the maximum number of keys returned in the response. By default the
  /// API returns up to 1,000 key names. The response might contain fewer keys
  /// but will never contain more.
  ///
  /// Parameter [prefix] :
  /// Limits the response to keys that begin with the specified prefix.
  ///
  /// Parameter [requestPayer] :
  /// Confirms that the requester knows that she or he will be charged for the
  /// list objects request in V2 style. Bucket owners need not specify this
  /// parameter in their requests.
  ///
  /// Parameter [startAfter] :
  /// StartAfter is where you want Amazon S3 to start listing from. Amazon S3
  /// starts listing after this specified key. StartAfter can be any key in the
  /// bucket.
  Future<ListObjectsV2Output> listObjectsV2({
    @_s.required String bucket,
    String continuationToken,
    String delimiter,
    EncodingType encodingType,
    String expectedBucketOwner,
    bool fetchOwner,
    int maxKeys,
    String prefix,
    RequestPayer requestPayer,
    String startAfter,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    requestPayer?.let((v) => headers['x-amz-request-payer'] = v.toValue());
    final $query = <String, List<String>>{
      if (continuationToken != null) 'continuation-token': [continuationToken],
      if (delimiter != null) 'delimiter': [delimiter],
      if (encodingType != null) 'encoding-type': [encodingType.toValue()],
      if (fetchOwner != null) 'fetch-owner': [fetchOwner.toString()],
      if (maxKeys != null) 'max-keys': [maxKeys.toString()],
      if (prefix != null) 'prefix': [prefix],
      if (startAfter != null) 'start-after': [startAfter],
    };
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/${Uri.encodeComponent(bucket)}?list-type=2',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListObjectsV2Output.fromXml($result.body);
  }

  /// Lists the parts that have been uploaded for a specific multipart upload.
  /// This operation must include the upload ID, which you obtain by sending the
  /// initiate multipart upload request (see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateMultipartUpload.html">CreateMultipartUpload</a>).
  /// This request returns a maximum of 1,000 uploaded parts. The default number
  /// of parts returned is 1,000 parts. You can restrict the number of parts
  /// returned by specifying the <code>max-parts</code> request parameter. If
  /// your multipart upload consists of more than 1,000 parts, the response
  /// returns an <code>IsTruncated</code> field with the value of true, and a
  /// <code>NextPartNumberMarker</code> element. In subsequent
  /// <code>ListParts</code> requests you can include the part-number-marker
  /// query string parameter and set its value to the
  /// <code>NextPartNumberMarker</code> field value from the previous response.
  ///
  /// For more information on multipart uploads, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/uploadobjusingmpu.html">Uploading
  /// Objects Using Multipart Upload</a>.
  ///
  /// For information on permissions required to use the multipart upload API,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuAndPermissions.html">Multipart
  /// Upload API and Permissions</a>.
  ///
  /// The following operations are related to <code>ListParts</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateMultipartUpload.html">CreateMultipartUpload</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPart.html">UploadPart</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CompleteMultipartUpload.html">CompleteMultipartUpload</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_AbortMultipartUpload.html">AbortMultipartUpload</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListMultipartUploads.html">ListMultipartUploads</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The name of the bucket to which the parts are being uploaded.
  ///
  /// When using this API with an access point, you must direct requests to the
  /// access point hostname. The access point hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com.
  /// When using this operation with an access point through the AWS SDKs, you
  /// provide the access point ARN in place of the bucket name. For more
  /// information about access point ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using
  /// Access Points</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// When using this API with Amazon S3 on Outposts, you must direct requests
  /// to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com.
  /// When using this operation using S3 on Outposts through the AWS SDKs, you
  /// provide the Outposts bucket ARN in place of the bucket name. For more
  /// information about S3 on Outposts ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using
  /// S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// Parameter [key] :
  /// Object key for which the multipart upload was initiated.
  ///
  /// Parameter [uploadId] :
  /// Upload ID identifying the multipart upload whose parts are being listed.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  ///
  /// Parameter [maxParts] :
  /// Sets the maximum number of parts to return.
  ///
  /// Parameter [partNumberMarker] :
  /// Specifies the part after which listing should begin. Only parts with
  /// higher part numbers will be listed.
  Future<ListPartsOutput> listParts({
    @_s.required String bucket,
    @_s.required String key,
    @_s.required String uploadId,
    String expectedBucketOwner,
    int maxParts,
    int partNumberMarker,
    RequestPayer requestPayer,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    ArgumentError.checkNotNull(key, 'key');
    _s.validateStringLength(
      'key',
      key,
      1,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(uploadId, 'uploadId');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    requestPayer?.let((v) => headers['x-amz-request-payer'] = v.toValue());
    final $query = <String, List<String>>{
      if (uploadId != null) 'uploadId': [uploadId],
      if (maxParts != null) 'max-parts': [maxParts.toString()],
      if (partNumberMarker != null)
        'part-number-marker': [partNumberMarker.toString()],
    };
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri:
          '/${Uri.encodeComponent(bucket)}/${key.split('/').map(Uri.encodeComponent).join('/')}',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return ListPartsOutput(
      bucket: _s.extractXmlStringValue($elem, 'Bucket'),
      initiator: _s
          .extractXmlChild($elem, 'Initiator')
          ?.let((e) => Initiator.fromXml(e)),
      isTruncated: _s.extractXmlBoolValue($elem, 'IsTruncated'),
      key: _s.extractXmlStringValue($elem, 'Key'),
      maxParts: _s.extractXmlIntValue($elem, 'MaxParts'),
      nextPartNumberMarker:
          _s.extractXmlIntValue($elem, 'NextPartNumberMarker'),
      owner: _s.extractXmlChild($elem, 'Owner')?.let((e) => Owner.fromXml(e)),
      partNumberMarker: _s.extractXmlIntValue($elem, 'PartNumberMarker'),
      parts: $elem.findElements('Part').map((c) => Part.fromXml(c)).toList(),
      storageClass:
          _s.extractXmlStringValue($elem, 'StorageClass')?.toStorageClass(),
      uploadId: _s.extractXmlStringValue($elem, 'UploadId'),
      abortDate:
          _s.extractHeaderDateTimeValue($result.headers, 'x-amz-abort-date'),
      abortRuleId:
          _s.extractHeaderStringValue($result.headers, 'x-amz-abort-rule-id'),
      requestCharged: _s
          .extractHeaderStringValue($result.headers, 'x-amz-request-charged')
          ?.toRequestCharged(),
    );
  }

  /// Sets the accelerate configuration of an existing bucket. Amazon S3
  /// Transfer Acceleration is a bucket-level feature that enables you to
  /// perform faster data transfers to Amazon S3.
  ///
  /// To use this operation, you must have permission to perform the
  /// s3:PutAccelerateConfiguration action. The bucket owner has this permission
  /// by default. The bucket owner can grant this permission to others. For more
  /// information about permissions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">Permissions
  /// Related to Bucket Subresource Operations</a> and <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing
  /// Access Permissions to Your Amazon S3 Resources</a>.
  ///
  /// The Transfer Acceleration state of a bucket can be set to one of the
  /// following two values:
  ///
  /// <ul>
  /// <li>
  /// Enabled – Enables accelerated data transfers to the bucket.
  /// </li>
  /// <li>
  /// Suspended – Disables accelerated data transfers to the bucket.
  /// </li>
  /// </ul>
  /// The <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketAccelerateConfiguration.html">GetBucketAccelerateConfiguration</a>
  /// operation returns the transfer acceleration state of a bucket.
  ///
  /// After setting the Transfer Acceleration state of a bucket to Enabled, it
  /// might take up to thirty minutes before the data transfer rates to the
  /// bucket increase.
  ///
  /// The name of the bucket used for Transfer Acceleration must be
  /// DNS-compliant and must not contain periods (".").
  ///
  /// For more information about transfer acceleration, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/transfer-acceleration.html">Transfer
  /// Acceleration</a>.
  ///
  /// The following operations are related to
  /// <code>PutBucketAccelerateConfiguration</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketAccelerateConfiguration.html">GetBucketAccelerateConfiguration</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucket.html">CreateBucket</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [accelerateConfiguration] :
  /// Container for setting the transfer acceleration state.
  ///
  /// Parameter [bucket] :
  /// The name of the bucket for which the accelerate configuration is set.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<void> putBucketAccelerateConfiguration({
    @_s.required AccelerateConfiguration accelerateConfiguration,
    @_s.required String bucket,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(
        accelerateConfiguration, 'accelerateConfiguration');
    ArgumentError.checkNotNull(bucket, 'bucket');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    await _protocol.send(
      method: 'PUT',
      requestUri: '/${Uri.encodeComponent(bucket)}?accelerate',
      headers: headers,
      payload: accelerateConfiguration.toXml('AccelerateConfiguration'),
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Sets the permissions on an existing bucket using access control lists
  /// (ACL). For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3_ACLs_UsingACLs.html">Using
  /// ACLs</a>. To set the ACL of a bucket, you must have <code>WRITE_ACP</code>
  /// permission.
  ///
  /// You can use one of the following two ways to set a bucket's permissions:
  ///
  /// <ul>
  /// <li>
  /// Specify the ACL in the request body
  /// </li>
  /// <li>
  /// Specify permissions using request headers
  /// </li>
  /// </ul> <note>
  /// You cannot specify access permission using both the body and the request
  /// headers.
  /// </note>
  /// Depending on your application needs, you may choose to set the ACL on a
  /// bucket using either the request body or the headers. For example, if you
  /// have an existing application that updates a bucket ACL using the request
  /// body, then you can continue to use that approach.
  ///
  /// <b>Access Permissions</b>
  ///
  /// You can set access permissions using one of the following methods:
  ///
  /// <ul>
  /// <li>
  /// Specify a canned ACL with the <code>x-amz-acl</code> request header.
  /// Amazon S3 supports a set of predefined ACLs, known as <i>canned ACLs</i>.
  /// Each canned ACL has a predefined set of grantees and permissions. Specify
  /// the canned ACL name as the value of <code>x-amz-acl</code>. If you use
  /// this header, you cannot use other access control-specific headers in your
  /// request. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#CannedACL">Canned
  /// ACL</a>.
  /// </li>
  /// <li>
  /// Specify access permissions explicitly with the
  /// <code>x-amz-grant-read</code>, <code>x-amz-grant-read-acp</code>,
  /// <code>x-amz-grant-write-acp</code>, and
  /// <code>x-amz-grant-full-control</code> headers. When using these headers,
  /// you specify explicit access permissions and grantees (AWS accounts or
  /// Amazon S3 groups) who will receive the permission. If you use these
  /// ACL-specific headers, you cannot use the <code>x-amz-acl</code> header to
  /// set a canned ACL. These parameters map to the set of permissions that
  /// Amazon S3 supports in an ACL. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html">Access
  /// Control List (ACL) Overview</a>.
  ///
  /// You specify each grantee as a type=value pair, where the type is one of
  /// the following:
  ///
  /// <ul>
  /// <li>
  /// <code>id</code> – if the value specified is the canonical user ID of an
  /// AWS account
  /// </li>
  /// <li>
  /// <code>uri</code> – if you are granting permissions to a predefined group
  /// </li>
  /// <li>
  /// <code>emailAddress</code> – if the value specified is the email address of
  /// an AWS account
  /// <note>
  /// Using email addresses to specify a grantee is only supported in the
  /// following AWS Regions:
  ///
  /// <ul>
  /// <li>
  /// US East (N. Virginia)
  /// </li>
  /// <li>
  /// US West (N. California)
  /// </li>
  /// <li>
  /// US West (Oregon)
  /// </li>
  /// <li>
  /// Asia Pacific (Singapore)
  /// </li>
  /// <li>
  /// Asia Pacific (Sydney)
  /// </li>
  /// <li>
  /// Asia Pacific (Tokyo)
  /// </li>
  /// <li>
  /// Europe (Ireland)
  /// </li>
  /// <li>
  /// South America (São Paulo)
  /// </li>
  /// </ul>
  /// For a list of all the Amazon S3 supported Regions and endpoints, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/rande.html#s3_region">Regions
  /// and Endpoints</a> in the AWS General Reference.
  /// </note> </li>
  /// </ul>
  /// For example, the following <code>x-amz-grant-write</code> header grants
  /// create, overwrite, and delete objects permission to LogDelivery group
  /// predefined by Amazon S3 and two AWS accounts identified by their email
  /// addresses.
  ///
  /// <code>x-amz-grant-write:
  /// uri="http://acs.amazonaws.com/groups/s3/LogDelivery", id="111122223333",
  /// id="555566667777" </code>
  /// </li>
  /// </ul>
  /// You can use either a canned ACL or specify access permissions explicitly.
  /// You cannot do both.
  ///
  /// <b>Grantee Values</b>
  ///
  /// You can specify the person (grantee) to whom you're assigning access
  /// rights (using request elements) in the following ways:
  ///
  /// <ul>
  /// <li>
  /// By the person's ID:
  ///
  /// <code>&lt;Grantee xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  /// xsi:type="CanonicalUser"&gt;&lt;ID&gt;&lt;&gt;ID&lt;&gt;&lt;/ID&gt;&lt;DisplayName&gt;&lt;&gt;GranteesEmail&lt;&gt;&lt;/DisplayName&gt;
  /// &lt;/Grantee&gt;</code>
  ///
  /// DisplayName is optional and ignored in the request
  /// </li>
  /// <li>
  /// By URI:
  ///
  /// <code>&lt;Grantee xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  /// xsi:type="Group"&gt;&lt;URI&gt;&lt;&gt;http://acs.amazonaws.com/groups/global/AuthenticatedUsers&lt;&gt;&lt;/URI&gt;&lt;/Grantee&gt;</code>
  /// </li>
  /// <li>
  /// By Email address:
  ///
  /// <code>&lt;Grantee xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  /// xsi:type="AmazonCustomerByEmail"&gt;&lt;EmailAddress&gt;&lt;&gt;Grantees@email.com&lt;&gt;&lt;/EmailAddress&gt;lt;/Grantee&gt;</code>
  ///
  /// The grantee is resolved to the CanonicalUser and, in a response to a GET
  /// Object acl request, appears as the CanonicalUser.
  /// <note>
  /// Using email addresses to specify a grantee is only supported in the
  /// following AWS Regions:
  ///
  /// <ul>
  /// <li>
  /// US East (N. Virginia)
  /// </li>
  /// <li>
  /// US West (N. California)
  /// </li>
  /// <li>
  /// US West (Oregon)
  /// </li>
  /// <li>
  /// Asia Pacific (Singapore)
  /// </li>
  /// <li>
  /// Asia Pacific (Sydney)
  /// </li>
  /// <li>
  /// Asia Pacific (Tokyo)
  /// </li>
  /// <li>
  /// Europe (Ireland)
  /// </li>
  /// <li>
  /// South America (São Paulo)
  /// </li>
  /// </ul>
  /// For a list of all the Amazon S3 supported Regions and endpoints, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/rande.html#s3_region">Regions
  /// and Endpoints</a> in the AWS General Reference.
  /// </note> </li>
  /// </ul> <p class="title"> <b>Related Resources</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucket.html">CreateBucket</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucket.html">DeleteBucket</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObjectAcl.html">GetObjectAcl</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The bucket to which to apply the ACL.
  ///
  /// Parameter [acl] :
  /// The canned ACL to apply to the bucket.
  ///
  /// Parameter [accessControlPolicy] :
  /// Contains the elements that set the ACL permissions for an object per
  /// grantee.
  ///
  /// Parameter [contentMD5] :
  /// The base64-encoded 128-bit MD5 digest of the data. This header must be
  /// used as a message integrity check to verify that the request body was not
  /// corrupted in transit. For more information, go to <a
  /// href="http://www.ietf.org/rfc/rfc1864.txt">RFC 1864.</a>
  ///
  /// For requests made using the AWS Command Line Interface (CLI) or AWS SDKs,
  /// this field is calculated automatically.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  ///
  /// Parameter [grantFullControl] :
  /// Allows grantee the read, write, read ACP, and write ACP permissions on the
  /// bucket.
  ///
  /// Parameter [grantRead] :
  /// Allows grantee to list the objects in the bucket.
  ///
  /// Parameter [grantReadACP] :
  /// Allows grantee to read the bucket ACL.
  ///
  /// Parameter [grantWrite] :
  /// Allows grantee to create, overwrite, and delete any object in the bucket.
  ///
  /// Parameter [grantWriteACP] :
  /// Allows grantee to write the ACL for the applicable bucket.
  Future<void> putBucketAcl({
    @_s.required String bucket,
    BucketCannedACL acl,
    AccessControlPolicy accessControlPolicy,
    String contentMD5,
    String expectedBucketOwner,
    String grantFullControl,
    String grantRead,
    String grantReadACP,
    String grantWrite,
    String grantWriteACP,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    final headers = <String, String>{};
    acl?.let((v) => headers['x-amz-acl'] = v.toValue());
    contentMD5?.let((v) => headers['Content-MD5'] = v.toString());
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    grantFullControl
        ?.let((v) => headers['x-amz-grant-full-control'] = v.toString());
    grantRead?.let((v) => headers['x-amz-grant-read'] = v.toString());
    grantReadACP?.let((v) => headers['x-amz-grant-read-acp'] = v.toString());
    grantWrite?.let((v) => headers['x-amz-grant-write'] = v.toString());
    grantWriteACP?.let((v) => headers['x-amz-grant-write-acp'] = v.toString());
    await _protocol.send(
      method: 'PUT',
      requestUri: '/${Uri.encodeComponent(bucket)}?acl',
      headers: headers,
      payload: accessControlPolicy?.toXml('AccessControlPolicy'),
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Sets an analytics configuration for the bucket (specified by the analytics
  /// configuration ID). You can have up to 1,000 analytics configurations per
  /// bucket.
  ///
  /// You can choose to have storage class analysis export analysis reports sent
  /// to a comma-separated values (CSV) flat file. See the
  /// <code>DataExport</code> request element. Reports are updated daily and are
  /// based on the object filters that you configure. When selecting data
  /// export, you specify a destination bucket and an optional destination
  /// prefix where the file is written. You can export the data to a destination
  /// bucket in a different account. However, the destination bucket must be in
  /// the same Region as the bucket that you are making the PUT analytics
  /// configuration to. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/analytics-storage-class.html">Amazon
  /// S3 Analytics – Storage Class Analysis</a>.
  /// <important>
  /// You must create a bucket policy on the destination bucket where the
  /// exported file is written to grant permissions to Amazon S3 to write
  /// objects to the bucket. For an example policy, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/example-bucket-policies.html#example-bucket-policies-use-case-9">Granting
  /// Permissions for Amazon S3 Inventory and Storage Class Analysis</a>.
  /// </important>
  /// To use this operation, you must have permissions to perform the
  /// <code>s3:PutAnalyticsConfiguration</code> action. The bucket owner has
  /// this permission by default. The bucket owner can grant this permission to
  /// others. For more information about permissions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">Permissions
  /// Related to Bucket Subresource Operations</a> and <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing
  /// Access Permissions to Your Amazon S3 Resources</a>.
  /// <p class="title"> <b>Special Errors</b>
  ///
  /// <ul>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>HTTP Error: HTTP 400 Bad Request</i>
  /// </li>
  /// <li>
  /// <i>Code: InvalidArgument</i>
  /// </li>
  /// <li>
  /// <i>Cause: Invalid argument.</i>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>HTTP Error: HTTP 400 Bad Request</i>
  /// </li>
  /// <li>
  /// <i>Code: TooManyConfigurations</i>
  /// </li>
  /// <li>
  /// <i>Cause: You are attempting to create a new configuration but have
  /// already reached the 1,000-configuration limit.</i>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>HTTP Error: HTTP 403 Forbidden</i>
  /// </li>
  /// <li>
  /// <i>Code: AccessDenied</i>
  /// </li>
  /// <li>
  /// <i>Cause: You are not the owner of the specified bucket, or you do not
  /// have the s3:PutAnalyticsConfiguration bucket permission to set the
  /// configuration on the bucket.</i>
  /// </li>
  /// </ul> </li>
  /// </ul> <p class="title"> <b>Related Resources</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketAnalyticsConfiguration.html">GetBucketAnalyticsConfiguration</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketAnalyticsConfiguration.html">DeleteBucketAnalyticsConfiguration</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListBucketAnalyticsConfigurations.html">ListBucketAnalyticsConfigurations</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [analyticsConfiguration] :
  /// The configuration and any analyses for the analytics filter.
  ///
  /// Parameter [bucket] :
  /// The name of the bucket to which an analytics configuration is stored.
  ///
  /// Parameter [id] :
  /// The ID that identifies the analytics configuration.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<void> putBucketAnalyticsConfiguration({
    @_s.required AnalyticsConfiguration analyticsConfiguration,
    @_s.required String bucket,
    @_s.required String id,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(
        analyticsConfiguration, 'analyticsConfiguration');
    ArgumentError.checkNotNull(bucket, 'bucket');
    ArgumentError.checkNotNull(id, 'id');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    final $query = <String, List<String>>{
      if (id != null) 'id': [id],
    };
    await _protocol.send(
      method: 'PUT',
      requestUri: '/${Uri.encodeComponent(bucket)}?analytics',
      queryParams: $query,
      headers: headers,
      payload: analyticsConfiguration.toXml('AnalyticsConfiguration'),
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Sets the <code>cors</code> configuration for your bucket. If the
  /// configuration exists, Amazon S3 replaces it.
  ///
  /// To use this operation, you must be allowed to perform the
  /// <code>s3:PutBucketCORS</code> action. By default, the bucket owner has
  /// this permission and can grant it to others.
  ///
  /// You set this configuration on a bucket so that the bucket can service
  /// cross-origin requests. For example, you might want to enable a request
  /// whose origin is <code>http://www.example.com</code> to access your Amazon
  /// S3 bucket at <code>my.example.bucket.com</code> by using the browser's
  /// <code>XMLHttpRequest</code> capability.
  ///
  /// To enable cross-origin resource sharing (CORS) on a bucket, you add the
  /// <code>cors</code> subresource to the bucket. The <code>cors</code>
  /// subresource is an XML document in which you configure rules that identify
  /// origins and the HTTP methods that can be executed on your bucket. The
  /// document is limited to 64 KB in size.
  ///
  /// When Amazon S3 receives a cross-origin request (or a pre-flight OPTIONS
  /// request) against a bucket, it evaluates the <code>cors</code>
  /// configuration on the bucket and uses the first <code>CORSRule</code> rule
  /// that matches the incoming browser request to enable a cross-origin
  /// request. For a rule to match, the following conditions must be met:
  ///
  /// <ul>
  /// <li>
  /// The request's <code>Origin</code> header must match
  /// <code>AllowedOrigin</code> elements.
  /// </li>
  /// <li>
  /// The request method (for example, GET, PUT, HEAD, and so on) or the
  /// <code>Access-Control-Request-Method</code> header in case of a pre-flight
  /// <code>OPTIONS</code> request must be one of the <code>AllowedMethod</code>
  /// elements.
  /// </li>
  /// <li>
  /// Every header specified in the <code>Access-Control-Request-Headers</code>
  /// request header of a pre-flight request must match an
  /// <code>AllowedHeader</code> element.
  /// </li>
  /// </ul>
  /// For more information about CORS, go to <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/cors.html">Enabling
  /// Cross-Origin Resource Sharing</a> in the <i>Amazon Simple Storage Service
  /// Developer Guide</i>.
  /// <p class="title"> <b>Related Resources</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketCors.html">GetBucketCors</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketCors.html">DeleteBucketCors</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTOPTIONSobject.html">RESTOPTIONSobject</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// Specifies the bucket impacted by the <code>cors</code>configuration.
  ///
  /// Parameter [cORSConfiguration] :
  /// Describes the cross-origin access configuration for objects in an Amazon
  /// S3 bucket. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/cors.html">Enabling
  /// Cross-Origin Resource Sharing</a> in the <i>Amazon Simple Storage Service
  /// Developer Guide</i>.
  ///
  /// Parameter [contentMD5] :
  /// The base64-encoded 128-bit MD5 digest of the data. This header must be
  /// used as a message integrity check to verify that the request body was not
  /// corrupted in transit. For more information, go to <a
  /// href="http://www.ietf.org/rfc/rfc1864.txt">RFC 1864.</a>
  ///
  /// For requests made using the AWS Command Line Interface (CLI) or AWS SDKs,
  /// this field is calculated automatically.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<void> putBucketCors({
    @_s.required String bucket,
    @_s.required CORSConfiguration cORSConfiguration,
    String contentMD5,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    ArgumentError.checkNotNull(cORSConfiguration, 'cORSConfiguration');
    final headers = <String, String>{};
    contentMD5?.let((v) => headers['Content-MD5'] = v.toString());
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    await _protocol.send(
      method: 'PUT',
      requestUri: '/${Uri.encodeComponent(bucket)}?cors',
      headers: headers,
      payload: cORSConfiguration.toXml('CORSConfiguration'),
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This operation uses the <code>encryption</code> subresource to configure
  /// default encryption and Amazon S3 Bucket Key for an existing bucket.
  ///
  /// Default encryption for a bucket can use server-side encryption with Amazon
  /// S3-managed keys (SSE-S3) or AWS KMS customer master keys (SSE-KMS). If you
  /// specify default encryption using SSE-KMS, you can also configure Amazon S3
  /// Bucket Key. For information about default encryption, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/bucket-encryption.html">Amazon
  /// S3 default bucket encryption</a> in the <i>Amazon Simple Storage Service
  /// Developer Guide</i>. For more information about S3 Bucket Keys, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/bucket-key.html">Amazon
  /// S3 Bucket Keys</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  /// <important>
  /// This operation requires AWS Signature Version 4. For more information, see
  /// <a href="sig-v4-authenticating-requests.html"> Authenticating Requests
  /// (AWS Signature Version 4)</a>.
  /// </important>
  /// To use this operation, you must have permissions to perform the
  /// <code>s3:PutEncryptionConfiguration</code> action. The bucket owner has
  /// this permission by default. The bucket owner can grant this permission to
  /// others. For more information about permissions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">Permissions
  /// Related to Bucket Subresource Operations</a> and <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing
  /// Access Permissions to Your Amazon S3 Resources</a> in the Amazon Simple
  /// Storage Service Developer Guide.
  /// <p class="title"> <b>Related Resources</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketEncryption.html">GetBucketEncryption</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketEncryption.html">DeleteBucketEncryption</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// Specifies default encryption for a bucket using server-side encryption
  /// with Amazon S3-managed keys (SSE-S3) or customer master keys stored in AWS
  /// KMS (SSE-KMS). For information about the Amazon S3 default encryption
  /// feature, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/bucket-encryption.html">Amazon
  /// S3 Default Bucket Encryption</a> in the <i>Amazon Simple Storage Service
  /// Developer Guide</i>.
  ///
  /// Parameter [contentMD5] :
  /// The base64-encoded 128-bit MD5 digest of the server-side encryption
  /// configuration.
  ///
  /// For requests made using the AWS Command Line Interface (CLI) or AWS SDKs,
  /// this field is calculated automatically.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<void> putBucketEncryption({
    @_s.required String bucket,
    @_s.required
        ServerSideEncryptionConfiguration serverSideEncryptionConfiguration,
    String contentMD5,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    ArgumentError.checkNotNull(
        serverSideEncryptionConfiguration, 'serverSideEncryptionConfiguration');
    final headers = <String, String>{};
    contentMD5?.let((v) => headers['Content-MD5'] = v.toString());
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    await _protocol.send(
      method: 'PUT',
      requestUri: '/${Uri.encodeComponent(bucket)}?encryption',
      headers: headers,
      payload: serverSideEncryptionConfiguration
          .toXml('ServerSideEncryptionConfiguration'),
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Puts a S3 Intelligent-Tiering configuration to the specified bucket.
  ///
  /// The S3 Intelligent-Tiering storage class is designed to optimize storage
  /// costs by automatically moving data to the most cost-effective storage
  /// access tier, without additional operational overhead. S3
  /// Intelligent-Tiering delivers automatic cost savings by moving data between
  /// access tiers, when access patterns change.
  ///
  /// The S3 Intelligent-Tiering storage class is suitable for objects larger
  /// than 128 KB that you plan to store for at least 30 days. If the size of an
  /// object is less than 128 KB, it is not eligible for auto-tiering. Smaller
  /// objects can be stored, but they are always charged at the frequent access
  /// tier rates in the S3 Intelligent-Tiering storage class.
  ///
  /// If you delete an object before the end of the 30-day minimum storage
  /// duration period, you are charged for 30 days. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-class-intro.html#sc-dynamic-data-access">Storage
  /// class for automatically optimizing frequently and infrequently accessed
  /// objects</a>.
  ///
  /// Operations related to
  /// <code>PutBucketIntelligentTieringConfiguration</code> include:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketIntelligentTieringConfiguration.html">DeleteBucketIntelligentTieringConfiguration</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketIntelligentTieringConfiguration.html">GetBucketIntelligentTieringConfiguration</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListBucketIntelligentTieringConfigurations.html">ListBucketIntelligentTieringConfigurations</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The name of the Amazon S3 bucket whose configuration you want to modify or
  /// retrieve.
  ///
  /// Parameter [id] :
  /// The ID used to identify the S3 Intelligent-Tiering configuration.
  ///
  /// Parameter [intelligentTieringConfiguration] :
  /// Container for S3 Intelligent-Tiering configuration.
  Future<void> putBucketIntelligentTieringConfiguration({
    @_s.required String bucket,
    @_s.required String id,
    @_s.required
        IntelligentTieringConfiguration intelligentTieringConfiguration,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(
        intelligentTieringConfiguration, 'intelligentTieringConfiguration');
    final $query = <String, List<String>>{
      if (id != null) 'id': [id],
    };
    await _protocol.send(
      method: 'PUT',
      requestUri: '/${Uri.encodeComponent(bucket)}?intelligent-tiering',
      queryParams: $query,
      payload: intelligentTieringConfiguration
          .toXml('IntelligentTieringConfiguration'),
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This implementation of the <code>PUT</code> operation adds an inventory
  /// configuration (identified by the inventory ID) to the bucket. You can have
  /// up to 1,000 inventory configurations per bucket.
  ///
  /// Amazon S3 inventory generates inventories of the objects in the bucket on
  /// a daily or weekly basis, and the results are published to a flat file. The
  /// bucket that is inventoried is called the <i>source</i> bucket, and the
  /// bucket where the inventory flat file is stored is called the
  /// <i>destination</i> bucket. The <i>destination</i> bucket must be in the
  /// same AWS Region as the <i>source</i> bucket.
  ///
  /// When you configure an inventory for a <i>source</i> bucket, you specify
  /// the <i>destination</i> bucket where you want the inventory to be stored,
  /// and whether to generate the inventory daily or weekly. You can also
  /// configure what object metadata to include and whether to inventory all
  /// object versions or only current versions. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-inventory.html">Amazon
  /// S3 Inventory</a> in the Amazon Simple Storage Service Developer Guide.
  /// <important>
  /// You must create a bucket policy on the <i>destination</i> bucket to grant
  /// permissions to Amazon S3 to write objects to the bucket in the defined
  /// location. For an example policy, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/example-bucket-policies.html#example-bucket-policies-use-case-9">
  /// Granting Permissions for Amazon S3 Inventory and Storage Class
  /// Analysis</a>.
  /// </important>
  /// To use this operation, you must have permissions to perform the
  /// <code>s3:PutInventoryConfiguration</code> action. The bucket owner has
  /// this permission by default and can grant this permission to others. For
  /// more information about permissions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">Permissions
  /// Related to Bucket Subresource Operations</a> and <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing
  /// Access Permissions to Your Amazon S3 Resources</a> in the Amazon Simple
  /// Storage Service Developer Guide.
  /// <p class="title"> <b>Special Errors</b>
  ///
  /// <ul>
  /// <li> <p class="title"> <b>HTTP 400 Bad Request Error</b>
  ///
  /// <ul>
  /// <li>
  /// <i>Code:</i> InvalidArgument
  /// </li>
  /// <li>
  /// <i>Cause:</i> Invalid Argument
  /// </li>
  /// </ul> </li>
  /// <li> <p class="title"> <b>HTTP 400 Bad Request Error</b>
  ///
  /// <ul>
  /// <li>
  /// <i>Code:</i> TooManyConfigurations
  /// </li>
  /// <li>
  /// <i>Cause:</i> You are attempting to create a new configuration but have
  /// already reached the 1,000-configuration limit.
  /// </li>
  /// </ul> </li>
  /// <li> <p class="title"> <b>HTTP 403 Forbidden Error</b>
  ///
  /// <ul>
  /// <li>
  /// <i>Code:</i> AccessDenied
  /// </li>
  /// <li>
  /// <i>Cause:</i> You are not the owner of the specified bucket, or you do not
  /// have the <code>s3:PutInventoryConfiguration</code> bucket permission to
  /// set the configuration on the bucket.
  /// </li>
  /// </ul> </li>
  /// </ul> <p class="title"> <b>Related Resources</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketInventoryConfiguration.html">GetBucketInventoryConfiguration</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketInventoryConfiguration.html">DeleteBucketInventoryConfiguration</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListBucketInventoryConfigurations.html">ListBucketInventoryConfigurations</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The name of the bucket where the inventory configuration will be stored.
  ///
  /// Parameter [id] :
  /// The ID used to identify the inventory configuration.
  ///
  /// Parameter [inventoryConfiguration] :
  /// Specifies the inventory configuration.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<void> putBucketInventoryConfiguration({
    @_s.required String bucket,
    @_s.required String id,
    @_s.required InventoryConfiguration inventoryConfiguration,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(
        inventoryConfiguration, 'inventoryConfiguration');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    final $query = <String, List<String>>{
      if (id != null) 'id': [id],
    };
    await _protocol.send(
      method: 'PUT',
      requestUri: '/${Uri.encodeComponent(bucket)}?inventory',
      queryParams: $query,
      headers: headers,
      payload: inventoryConfiguration.toXml('InventoryConfiguration'),
      exceptionFnMap: _exceptionFns,
    );
  }

  /// <important>
  /// For an updated version of this API, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketLifecycleConfiguration.html">PutBucketLifecycleConfiguration</a>.
  /// This version has been deprecated. Existing lifecycle configurations will
  /// work. For new lifecycle configurations, use the updated API.
  /// </important>
  /// Creates a new lifecycle configuration for the bucket or replaces an
  /// existing lifecycle configuration. For information about lifecycle
  /// configuration, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lifecycle-mgmt.html">Object
  /// Lifecycle Management</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// By default, all Amazon S3 resources, including buckets, objects, and
  /// related subresources (for example, lifecycle configuration and website
  /// configuration) are private. Only the resource owner, the AWS account that
  /// created the resource, can access it. The resource owner can optionally
  /// grant access permissions to others by writing an access policy. For this
  /// operation, users must get the <code>s3:PutLifecycleConfiguration</code>
  /// permission.
  ///
  /// You can also explicitly deny permissions. Explicit denial also supersedes
  /// any other permissions. If you want to prevent users or accounts from
  /// removing or deleting objects from your bucket, you must deny them
  /// permissions for the following actions:
  ///
  /// <ul>
  /// <li>
  /// <code>s3:DeleteObject</code>
  /// </li>
  /// <li>
  /// <code>s3:DeleteObjectVersion</code>
  /// </li>
  /// <li>
  /// <code>s3:PutLifecycleConfiguration</code>
  /// </li>
  /// </ul>
  /// For more information about permissions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing
  /// Access Permissions to your Amazon S3 Resources</a> in the <i>Amazon Simple
  /// Storage Service Developer Guide</i>.
  ///
  /// For more examples of transitioning objects to storage classes such as
  /// STANDARD_IA or ONEZONE_IA, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/intro-lifecycle-rules.html#lifecycle-configuration-examples">Examples
  /// of Lifecycle Configuration</a>.
  /// <p class="title"> <b>Related Resources</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketLifecycle.html">GetBucketLifecycle</a>(Deprecated)
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketLifecycleConfiguration.html">GetBucketLifecycleConfiguration</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_RestoreObject.html">RestoreObject</a>
  /// </li>
  /// <li>
  /// By default, a resource owner—in this case, a bucket owner, which is the
  /// AWS account that created the bucket—can perform any of the operations. A
  /// resource owner can also grant others permission to perform the operation.
  /// For more information, see the following topics in the Amazon Simple
  /// Storage Service Developer Guide:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html">Specifying
  /// Permissions in a Policy</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing
  /// Access Permissions to your Amazon S3 Resources</a>
  /// </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// <p/>
  ///
  /// Parameter [contentMD5] :
  /// <p/>
  /// For requests made using the AWS Command Line Interface (CLI) or AWS SDKs,
  /// this field is calculated automatically.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  ///
  /// Parameter [lifecycleConfiguration] :
  /// <p/>
  @Deprecated('Deprecated')
  Future<void> putBucketLifecycle({
    @_s.required String bucket,
    String contentMD5,
    String expectedBucketOwner,
    LifecycleConfiguration lifecycleConfiguration,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    final headers = <String, String>{};
    contentMD5?.let((v) => headers['Content-MD5'] = v.toString());
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    await _protocol.send(
      method: 'PUT',
      requestUri: '/${Uri.encodeComponent(bucket)}?lifecycle',
      headers: headers,
      payload: lifecycleConfiguration?.toXml('LifecycleConfiguration'),
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates a new lifecycle configuration for the bucket or replaces an
  /// existing lifecycle configuration. For information about lifecycle
  /// configuration, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing
  /// Access Permissions to Your Amazon S3 Resources</a>.
  /// <note>
  /// Bucket lifecycle configuration now supports specifying a lifecycle rule
  /// using an object key name prefix, one or more object tags, or a combination
  /// of both. Accordingly, this section describes the latest API. The previous
  /// version of the API supported filtering based only on an object key name
  /// prefix, which is supported for backward compatibility. For the related API
  /// description, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketLifecycle.html">PutBucketLifecycle</a>.
  /// </note>
  /// <b>Rules</b>
  ///
  /// You specify the lifecycle configuration in your request body. The
  /// lifecycle configuration is specified as XML consisting of one or more
  /// rules. Each rule consists of the following:
  ///
  /// <ul>
  /// <li>
  /// Filter identifying a subset of objects to which the rule applies. The
  /// filter can be based on a key name prefix, object tags, or a combination of
  /// both.
  /// </li>
  /// <li>
  /// Status whether the rule is in effect.
  /// </li>
  /// <li>
  /// One or more lifecycle transition and expiration actions that you want
  /// Amazon S3 to perform on the objects identified by the filter. If the state
  /// of your bucket is versioning-enabled or versioning-suspended, you can have
  /// many versions of the same object (one current version and zero or more
  /// noncurrent versions). Amazon S3 provides predefined actions that you can
  /// specify for current and noncurrent object versions.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lifecycle-mgmt.html">Object
  /// Lifecycle Management</a> and <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/intro-lifecycle-rules.html">Lifecycle
  /// Configuration Elements</a>.
  ///
  /// <b>Permissions</b>
  ///
  /// By default, all Amazon S3 resources are private, including buckets,
  /// objects, and related subresources (for example, lifecycle configuration
  /// and website configuration). Only the resource owner (that is, the AWS
  /// account that created it) can access the resource. The resource owner can
  /// optionally grant access permissions to others by writing an access policy.
  /// For this operation, a user must get the s3:PutLifecycleConfiguration
  /// permission.
  ///
  /// You can also explicitly deny permissions. Explicit deny also supersedes
  /// any other permissions. If you want to block users or accounts from
  /// removing or deleting objects from your bucket, you must deny them
  /// permissions for the following actions:
  ///
  /// <ul>
  /// <li>
  /// s3:DeleteObject
  /// </li>
  /// <li>
  /// s3:DeleteObjectVersion
  /// </li>
  /// <li>
  /// s3:PutLifecycleConfiguration
  /// </li>
  /// </ul>
  /// For more information about permissions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing
  /// Access Permissions to Your Amazon S3 Resources</a>.
  ///
  /// The following are related to <code>PutBucketLifecycleConfiguration</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/lifecycle-configuration-examples.html">Examples
  /// of Lifecycle Configuration</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketLifecycleConfiguration.html">GetBucketLifecycleConfiguration</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketLifecycle.html">DeleteBucketLifecycle</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The name of the bucket for which to set the configuration.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  ///
  /// Parameter [lifecycleConfiguration] :
  /// Container for lifecycle rules. You can add as many as 1,000 rules.
  Future<void> putBucketLifecycleConfiguration({
    @_s.required String bucket,
    String expectedBucketOwner,
    BucketLifecycleConfiguration lifecycleConfiguration,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    await _protocol.send(
      method: 'PUT',
      requestUri: '/${Uri.encodeComponent(bucket)}?lifecycle',
      headers: headers,
      payload: lifecycleConfiguration?.toXml('LifecycleConfiguration'),
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Set the logging parameters for a bucket and to specify permissions for who
  /// can view and modify the logging parameters. All logs are saved to buckets
  /// in the same AWS Region as the source bucket. To set the logging status of
  /// a bucket, you must be the bucket owner.
  ///
  /// The bucket owner is automatically granted FULL_CONTROL to all logs. You
  /// use the <code>Grantee</code> request element to grant access to other
  /// people. The <code>Permissions</code> request element specifies the kind of
  /// access the grantee has to the logs.
  ///
  /// <b>Grantee Values</b>
  ///
  /// You can specify the person (grantee) to whom you're assigning access
  /// rights (using request elements) in the following ways:
  ///
  /// <ul>
  /// <li>
  /// By the person's ID:
  ///
  /// <code>&lt;Grantee xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  /// xsi:type="CanonicalUser"&gt;&lt;ID&gt;&lt;&gt;ID&lt;&gt;&lt;/ID&gt;&lt;DisplayName&gt;&lt;&gt;GranteesEmail&lt;&gt;&lt;/DisplayName&gt;
  /// &lt;/Grantee&gt;</code>
  ///
  /// DisplayName is optional and ignored in the request.
  /// </li>
  /// <li>
  /// By Email address:
  ///
  /// <code> &lt;Grantee xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  /// xsi:type="AmazonCustomerByEmail"&gt;&lt;EmailAddress&gt;&lt;&gt;Grantees@email.com&lt;&gt;&lt;/EmailAddress&gt;&lt;/Grantee&gt;</code>
  ///
  /// The grantee is resolved to the CanonicalUser and, in a response to a GET
  /// Object acl request, appears as the CanonicalUser.
  /// </li>
  /// <li>
  /// By URI:
  ///
  /// <code>&lt;Grantee xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  /// xsi:type="Group"&gt;&lt;URI&gt;&lt;&gt;http://acs.amazonaws.com/groups/global/AuthenticatedUsers&lt;&gt;&lt;/URI&gt;&lt;/Grantee&gt;</code>
  /// </li>
  /// </ul>
  /// To enable logging, you use LoggingEnabled and its children request
  /// elements. To disable logging, you use an empty BucketLoggingStatus request
  /// element:
  ///
  /// <code>&lt;BucketLoggingStatus
  /// xmlns="http://doc.s3.amazonaws.com/2006-03-01" /&gt;</code>
  ///
  /// For more information about server access logging, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/ServerLogs.html">Server
  /// Access Logging</a>.
  ///
  /// For more information about creating a bucket, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucket.html">CreateBucket</a>.
  /// For more information about returning the logging status of a bucket, see
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketLogging.html">GetBucketLogging</a>.
  ///
  /// The following operations are related to <code>PutBucketLogging</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutObject.html">PutObject</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucket.html">DeleteBucket</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucket.html">CreateBucket</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketLogging.html">GetBucketLogging</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The name of the bucket for which to set the logging parameters.
  ///
  /// Parameter [bucketLoggingStatus] :
  /// Container for logging status information.
  ///
  /// Parameter [contentMD5] :
  /// The MD5 hash of the <code>PutBucketLogging</code> request body.
  ///
  /// For requests made using the AWS Command Line Interface (CLI) or AWS SDKs,
  /// this field is calculated automatically.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<void> putBucketLogging({
    @_s.required String bucket,
    @_s.required BucketLoggingStatus bucketLoggingStatus,
    String contentMD5,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    ArgumentError.checkNotNull(bucketLoggingStatus, 'bucketLoggingStatus');
    final headers = <String, String>{};
    contentMD5?.let((v) => headers['Content-MD5'] = v.toString());
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    await _protocol.send(
      method: 'PUT',
      requestUri: '/${Uri.encodeComponent(bucket)}?logging',
      headers: headers,
      payload: bucketLoggingStatus.toXml('BucketLoggingStatus'),
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Sets a metrics configuration (specified by the metrics configuration ID)
  /// for the bucket. You can have up to 1,000 metrics configurations per
  /// bucket. If you're updating an existing metrics configuration, note that
  /// this is a full replacement of the existing metrics configuration. If you
  /// don't include the elements you want to keep, they are erased.
  ///
  /// To use this operation, you must have permissions to perform the
  /// <code>s3:PutMetricsConfiguration</code> action. The bucket owner has this
  /// permission by default. The bucket owner can grant this permission to
  /// others. For more information about permissions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">Permissions
  /// Related to Bucket Subresource Operations</a> and <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing
  /// Access Permissions to Your Amazon S3 Resources</a>.
  ///
  /// For information about CloudWatch request metrics for Amazon S3, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/cloudwatch-monitoring.html">Monitoring
  /// Metrics with Amazon CloudWatch</a>.
  ///
  /// The following operations are related to
  /// <code>PutBucketMetricsConfiguration</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketMetricsConfiguration.html">DeleteBucketMetricsConfiguration</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketMetricsConfiguration.html">PutBucketMetricsConfiguration</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListBucketMetricsConfigurations.html">ListBucketMetricsConfigurations</a>
  /// </li>
  /// </ul>
  /// <code>GetBucketLifecycle</code> has the following special error:
  ///
  /// <ul>
  /// <li>
  /// Error code: <code>TooManyConfigurations</code>
  ///
  /// <ul>
  /// <li>
  /// Description: You are attempting to create a new configuration but have
  /// already reached the 1,000-configuration limit.
  /// </li>
  /// <li>
  /// HTTP Status Code: HTTP 400 Bad Request
  /// </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The name of the bucket for which the metrics configuration is set.
  ///
  /// Parameter [id] :
  /// The ID used to identify the metrics configuration.
  ///
  /// Parameter [metricsConfiguration] :
  /// Specifies the metrics configuration.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<void> putBucketMetricsConfiguration({
    @_s.required String bucket,
    @_s.required String id,
    @_s.required MetricsConfiguration metricsConfiguration,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(metricsConfiguration, 'metricsConfiguration');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    final $query = <String, List<String>>{
      if (id != null) 'id': [id],
    };
    await _protocol.send(
      method: 'PUT',
      requestUri: '/${Uri.encodeComponent(bucket)}?metrics',
      queryParams: $query,
      headers: headers,
      payload: metricsConfiguration.toXml('MetricsConfiguration'),
      exceptionFnMap: _exceptionFns,
    );
  }

  /// No longer used, see the <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketNotificationConfiguration.html">PutBucketNotificationConfiguration</a>
  /// operation.
  ///
  /// Parameter [bucket] :
  /// The name of the bucket.
  ///
  /// Parameter [notificationConfiguration] :
  /// The container for the configuration.
  ///
  /// Parameter [contentMD5] :
  /// The MD5 hash of the <code>PutPublicAccessBlock</code> request body.
  ///
  /// For requests made using the AWS Command Line Interface (CLI) or AWS SDKs,
  /// this field is calculated automatically.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  @Deprecated('Deprecated')
  Future<void> putBucketNotification({
    @_s.required String bucket,
    @_s.required NotificationConfigurationDeprecated notificationConfiguration,
    String contentMD5,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    ArgumentError.checkNotNull(
        notificationConfiguration, 'notificationConfiguration');
    final headers = <String, String>{};
    contentMD5?.let((v) => headers['Content-MD5'] = v.toString());
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    await _protocol.send(
      method: 'PUT',
      requestUri: '/${Uri.encodeComponent(bucket)}?notification',
      headers: headers,
      payload: notificationConfiguration.toXml('NotificationConfiguration'),
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Enables notifications of specified events for a bucket. For more
  /// information about event notifications, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html">Configuring
  /// Event Notifications</a>.
  ///
  /// Using this API, you can replace an existing notification configuration.
  /// The configuration is an XML file that defines the event types that you
  /// want Amazon S3 to publish and the destination where you want Amazon S3 to
  /// publish an event notification when it detects an event of the specified
  /// type.
  ///
  /// By default, your bucket has no event notifications configured. That is,
  /// the notification configuration will be an empty
  /// <code>NotificationConfiguration</code>.
  ///
  /// <code>&lt;NotificationConfiguration&gt;</code>
  ///
  /// <code>&lt;/NotificationConfiguration&gt;</code>
  ///
  /// This operation replaces the existing notification configuration with the
  /// configuration you include in the request body.
  ///
  /// After Amazon S3 receives this request, it first verifies that any Amazon
  /// Simple Notification Service (Amazon SNS) or Amazon Simple Queue Service
  /// (Amazon SQS) destination exists, and that the bucket owner has permission
  /// to publish to it by sending a test notification. In the case of AWS Lambda
  /// destinations, Amazon S3 verifies that the Lambda function permissions
  /// grant Amazon S3 permission to invoke the function from the Amazon S3
  /// bucket. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html">Configuring
  /// Notifications for Amazon S3 Events</a>.
  ///
  /// You can disable notifications by adding the empty
  /// NotificationConfiguration element.
  ///
  /// By default, only the bucket owner can configure notifications on a bucket.
  /// However, bucket owners can use a bucket policy to grant permission to
  /// other users to set this configuration with
  /// <code>s3:PutBucketNotification</code> permission.
  /// <note>
  /// The PUT notification is an atomic operation. For example, suppose your
  /// notification configuration includes SNS topic, SQS queue, and Lambda
  /// function configurations. When you send a PUT request with this
  /// configuration, Amazon S3 sends test messages to your SNS topic. If the
  /// message fails, the entire PUT operation will fail, and Amazon S3 will not
  /// add the configuration to your bucket.
  /// </note>
  /// <b>Responses</b>
  ///
  /// If the configuration in the request body includes only one
  /// <code>TopicConfiguration</code> specifying only the
  /// <code>s3:ReducedRedundancyLostObject</code> event type, the response will
  /// also include the <code>x-amz-sns-test-message-id</code> header containing
  /// the message ID of the test notification sent to the topic.
  ///
  /// The following operation is related to
  /// <code>PutBucketNotificationConfiguration</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketNotificationConfiguration.html">GetBucketNotificationConfiguration</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The name of the bucket.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<void> putBucketNotificationConfiguration({
    @_s.required String bucket,
    @_s.required NotificationConfiguration notificationConfiguration,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    ArgumentError.checkNotNull(
        notificationConfiguration, 'notificationConfiguration');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    await _protocol.send(
      method: 'PUT',
      requestUri: '/${Uri.encodeComponent(bucket)}?notification',
      headers: headers,
      payload: notificationConfiguration.toXml('NotificationConfiguration'),
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates or modifies <code>OwnershipControls</code> for an Amazon S3
  /// bucket. To use this operation, you must have the
  /// <code>s3:PutBucketOwnershipControls</code> permission. For more
  /// information about Amazon S3 permissions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html">Specifying
  /// Permissions in a Policy</a>.
  ///
  /// For information about Amazon S3 Object Ownership, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/about-object-ownership.html">Using
  /// Object Ownership</a>.
  ///
  /// The following operations are related to
  /// <code>PutBucketOwnershipControls</code>:
  ///
  /// <ul>
  /// <li>
  /// <a>GetBucketOwnershipControls</a>
  /// </li>
  /// <li>
  /// <a>DeleteBucketOwnershipControls</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The name of the Amazon S3 bucket whose <code>OwnershipControls</code> you
  /// want to set.
  ///
  /// Parameter [ownershipControls] :
  /// The <code>OwnershipControls</code> (BucketOwnerPreferred or ObjectWriter)
  /// that you want to apply to this Amazon S3 bucket.
  ///
  /// Parameter [contentMD5] :
  /// The MD5 hash of the <code>OwnershipControls</code> request body.
  ///
  /// For requests made using the AWS Command Line Interface (CLI) or AWS SDKs,
  /// this field is calculated automatically.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<void> putBucketOwnershipControls({
    @_s.required String bucket,
    @_s.required OwnershipControls ownershipControls,
    String contentMD5,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    ArgumentError.checkNotNull(ownershipControls, 'ownershipControls');
    final headers = <String, String>{};
    contentMD5?.let((v) => headers['Content-MD5'] = v.toString());
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    await _protocol.send(
      method: 'PUT',
      requestUri: '/${Uri.encodeComponent(bucket)}?ownershipControls',
      headers: headers,
      payload: ownershipControls.toXml('OwnershipControls'),
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Applies an Amazon S3 bucket policy to an Amazon S3 bucket. If you are
  /// using an identity other than the root user of the AWS account that owns
  /// the bucket, the calling identity must have the
  /// <code>PutBucketPolicy</code> permissions on the specified bucket and
  /// belong to the bucket owner's account in order to use this operation.
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
  /// The following operations are related to <code>PutBucketPolicy</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucket.html">CreateBucket</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucket.html">DeleteBucket</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The name of the bucket.
  ///
  /// Parameter [policy] :
  /// The bucket policy as a JSON document.
  ///
  /// Parameter [confirmRemoveSelfBucketAccess] :
  /// Set this parameter to true to confirm that you want to remove your
  /// permissions to change this bucket policy in the future.
  ///
  /// Parameter [contentMD5] :
  /// The MD5 hash of the request body.
  ///
  /// For requests made using the AWS Command Line Interface (CLI) or AWS SDKs,
  /// this field is calculated automatically.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<void> putBucketPolicy({
    @_s.required String bucket,
    @_s.required String policy,
    bool confirmRemoveSelfBucketAccess,
    String contentMD5,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    ArgumentError.checkNotNull(policy, 'policy');
    final headers = <String, String>{};
    confirmRemoveSelfBucketAccess?.let((v) =>
        headers['x-amz-confirm-remove-self-bucket-access'] = v.toString());
    contentMD5?.let((v) => headers['Content-MD5'] = v.toString());
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    await _protocol.send(
      method: 'PUT',
      requestUri: '/${Uri.encodeComponent(bucket)}?policy',
      headers: headers,
      payload: policy,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates a replication configuration or replaces an existing one. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/replication.html">Replication</a>
  /// in the <i>Amazon S3 Developer Guide</i>.
  /// <note>
  /// To perform this operation, the user or role performing the operation must
  /// have the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_passrole.html">iam:PassRole</a>
  /// permission.
  /// </note>
  /// Specify the replication configuration in the request body. In the
  /// replication configuration, you provide the name of the destination bucket
  /// or buckets where you want Amazon S3 to replicate objects, the IAM role
  /// that Amazon S3 can assume to replicate objects on your behalf, and other
  /// relevant information.
  ///
  /// A replication configuration must include at least one rule, and can
  /// contain a maximum of 1,000. Each rule identifies a subset of objects to
  /// replicate by filtering the objects in the source bucket. To choose
  /// additional subsets of objects to replicate, add a rule for each subset.
  ///
  /// To specify a subset of the objects in the source bucket to apply a
  /// replication rule to, add the Filter element as a child of the Rule
  /// element. You can filter objects based on an object key prefix, one or more
  /// object tags, or both. When you add the Filter element in the
  /// configuration, you must also add the following elements:
  /// <code>DeleteMarkerReplication</code>, <code>Status</code>, and
  /// <code>Priority</code>.
  /// <note>
  /// If you are using an earlier version of the replication configuration,
  /// Amazon S3 handles replication of delete markers differently. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/replication-add-config.html#replication-backward-compat-considerations">Backward
  /// Compatibility</a>.
  /// </note>
  /// For information about enabling versioning on a bucket, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/Versioning.html">Using
  /// Versioning</a>.
  ///
  /// By default, a resource owner, in this case the AWS account that created
  /// the bucket, can perform this operation. The resource owner can also grant
  /// others permissions to perform the operation. For more information about
  /// permissions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html">Specifying
  /// Permissions in a Policy</a> and <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing
  /// Access Permissions to Your Amazon S3 Resources</a>.
  ///
  /// <b>Handling Replication of Encrypted Objects</b>
  ///
  /// By default, Amazon S3 doesn't replicate objects that are stored at rest
  /// using server-side encryption with CMKs stored in AWS KMS. To replicate AWS
  /// KMS-encrypted objects, add the following:
  /// <code>SourceSelectionCriteria</code>, <code>SseKmsEncryptedObjects</code>,
  /// <code>Status</code>, <code>EncryptionConfiguration</code>, and
  /// <code>ReplicaKmsKeyID</code>. For information about replication
  /// configuration, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/replication-config-for-kms-objects.html">Replicating
  /// Objects Created with SSE Using CMKs stored in AWS KMS</a>.
  ///
  /// For information on <code>PutBucketReplication</code> errors, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/ErrorResponses.html#ReplicationErrorCodeList">List
  /// of replication-related error codes</a>
  ///
  /// The following operations are related to <code>PutBucketReplication</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketReplication.html">GetBucketReplication</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketReplication.html">DeleteBucketReplication</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The name of the bucket
  ///
  /// Parameter [contentMD5] :
  /// The base64-encoded 128-bit MD5 digest of the data. You must use this
  /// header as a message integrity check to verify that the request body was
  /// not corrupted in transit. For more information, see <a
  /// href="http://www.ietf.org/rfc/rfc1864.txt">RFC 1864</a>.
  ///
  /// For requests made using the AWS Command Line Interface (CLI) or AWS SDKs,
  /// this field is calculated automatically.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  ///
  /// Parameter [token] :
  /// A token to allow Object Lock to be enabled for an existing bucket.
  Future<void> putBucketReplication({
    @_s.required String bucket,
    @_s.required ReplicationConfiguration replicationConfiguration,
    String contentMD5,
    String expectedBucketOwner,
    String token,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    ArgumentError.checkNotNull(
        replicationConfiguration, 'replicationConfiguration');
    final headers = <String, String>{};
    contentMD5?.let((v) => headers['Content-MD5'] = v.toString());
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    token?.let((v) => headers['x-amz-bucket-object-lock-token'] = v.toString());
    await _protocol.send(
      method: 'PUT',
      requestUri: '/${Uri.encodeComponent(bucket)}?replication',
      headers: headers,
      payload: replicationConfiguration.toXml('ReplicationConfiguration'),
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Sets the request payment configuration for a bucket. By default, the
  /// bucket owner pays for downloads from the bucket. This configuration
  /// parameter enables the bucket owner (only) to specify that the person
  /// requesting the download will be charged for the download. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/RequesterPaysBuckets.html">Requester
  /// Pays Buckets</a>.
  ///
  /// The following operations are related to
  /// <code>PutBucketRequestPayment</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucket.html">CreateBucket</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketRequestPayment.html">GetBucketRequestPayment</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The bucket name.
  ///
  /// Parameter [requestPaymentConfiguration] :
  /// Container for Payer.
  ///
  /// Parameter [contentMD5] :
  /// &gt;The base64-encoded 128-bit MD5 digest of the data. You must use this
  /// header as a message integrity check to verify that the request body was
  /// not corrupted in transit. For more information, see <a
  /// href="http://www.ietf.org/rfc/rfc1864.txt">RFC 1864</a>.
  ///
  /// For requests made using the AWS Command Line Interface (CLI) or AWS SDKs,
  /// this field is calculated automatically.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<void> putBucketRequestPayment({
    @_s.required String bucket,
    @_s.required RequestPaymentConfiguration requestPaymentConfiguration,
    String contentMD5,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    ArgumentError.checkNotNull(
        requestPaymentConfiguration, 'requestPaymentConfiguration');
    final headers = <String, String>{};
    contentMD5?.let((v) => headers['Content-MD5'] = v.toString());
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    await _protocol.send(
      method: 'PUT',
      requestUri: '/${Uri.encodeComponent(bucket)}?requestPayment',
      headers: headers,
      payload: requestPaymentConfiguration.toXml('RequestPaymentConfiguration'),
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Sets the tags for a bucket.
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
  /// <code>s3:PutBucketTagging</code> action. The bucket owner has this
  /// permission by default and can grant this permission to others. For more
  /// information about permissions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">Permissions
  /// Related to Bucket Subresource Operations</a> and <a
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
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/allocation-tag-restrictions.html">User-Defined
  /// Tag Restrictions</a> and <a
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/aws-tag-restrictions.html">AWS-Generated
  /// Cost Allocation Tag Restrictions</a>.
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
  /// against this resource. Please try again.
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
  /// The following operations are related to <code>PutBucketTagging</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketTagging.html">GetBucketTagging</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketTagging.html">DeleteBucketTagging</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The bucket name.
  ///
  /// Parameter [tagging] :
  /// Container for the <code>TagSet</code> and <code>Tag</code> elements.
  ///
  /// Parameter [contentMD5] :
  /// The base64-encoded 128-bit MD5 digest of the data. You must use this
  /// header as a message integrity check to verify that the request body was
  /// not corrupted in transit. For more information, see <a
  /// href="http://www.ietf.org/rfc/rfc1864.txt">RFC 1864</a>.
  ///
  /// For requests made using the AWS Command Line Interface (CLI) or AWS SDKs,
  /// this field is calculated automatically.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<void> putBucketTagging({
    @_s.required String bucket,
    @_s.required Tagging tagging,
    String contentMD5,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    ArgumentError.checkNotNull(tagging, 'tagging');
    final headers = <String, String>{};
    contentMD5?.let((v) => headers['Content-MD5'] = v.toString());
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    await _protocol.send(
      method: 'PUT',
      requestUri: '/${Uri.encodeComponent(bucket)}?tagging',
      headers: headers,
      payload: tagging.toXml('Tagging'),
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Sets the versioning state of an existing bucket. To set the versioning
  /// state, you must be the bucket owner.
  ///
  /// You can set the versioning state with one of the following values:
  ///
  /// <b>Enabled</b>—Enables versioning for the objects in the bucket. All
  /// objects added to the bucket receive a unique version ID.
  ///
  /// <b>Suspended</b>—Disables versioning for the objects in the bucket. All
  /// objects added to the bucket receive the version ID null.
  ///
  /// If the versioning state has never been set on a bucket, it has no
  /// versioning state; a <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketVersioning.html">GetBucketVersioning</a>
  /// request does not return a versioning state value.
  ///
  /// If the bucket owner enables MFA Delete in the bucket versioning
  /// configuration, the bucket owner must include the <code>x-amz-mfa
  /// request</code> header and the <code>Status</code> and the
  /// <code>MfaDelete</code> request elements in a request to set the versioning
  /// state of the bucket.
  /// <important>
  /// If you have an object expiration lifecycle policy in your non-versioned
  /// bucket and you want to maintain the same permanent delete behavior when
  /// you enable versioning, you must add a noncurrent expiration policy. The
  /// noncurrent expiration lifecycle policy will manage the deletes of the
  /// noncurrent object versions in the version-enabled bucket. (A
  /// version-enabled bucket maintains one current and zero or more noncurrent
  /// object versions.) For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lifecycle-mgmt.html#lifecycle-and-other-bucket-config">Lifecycle
  /// and Versioning</a>.
  /// </important> <p class="title"> <b>Related Resources</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucket.html">CreateBucket</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucket.html">DeleteBucket</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketVersioning.html">GetBucketVersioning</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The bucket name.
  ///
  /// Parameter [versioningConfiguration] :
  /// Container for setting the versioning state.
  ///
  /// Parameter [contentMD5] :
  /// &gt;The base64-encoded 128-bit MD5 digest of the data. You must use this
  /// header as a message integrity check to verify that the request body was
  /// not corrupted in transit. For more information, see <a
  /// href="http://www.ietf.org/rfc/rfc1864.txt">RFC 1864</a>.
  ///
  /// For requests made using the AWS Command Line Interface (CLI) or AWS SDKs,
  /// this field is calculated automatically.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  ///
  /// Parameter [mfa] :
  /// The concatenation of the authentication device's serial number, a space,
  /// and the value that is displayed on your authentication device.
  Future<void> putBucketVersioning({
    @_s.required String bucket,
    @_s.required VersioningConfiguration versioningConfiguration,
    String contentMD5,
    String expectedBucketOwner,
    String mfa,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    ArgumentError.checkNotNull(
        versioningConfiguration, 'versioningConfiguration');
    final headers = <String, String>{};
    contentMD5?.let((v) => headers['Content-MD5'] = v.toString());
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    mfa?.let((v) => headers['x-amz-mfa'] = v.toString());
    await _protocol.send(
      method: 'PUT',
      requestUri: '/${Uri.encodeComponent(bucket)}?versioning',
      headers: headers,
      payload: versioningConfiguration.toXml('VersioningConfiguration'),
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Sets the configuration of the website that is specified in the
  /// <code>website</code> subresource. To configure a bucket as a website, you
  /// can add this subresource on the bucket with website configuration
  /// information such as the file name of the index document and any redirect
  /// rules. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/WebsiteHosting.html">Hosting
  /// Websites on Amazon S3</a>.
  ///
  /// This PUT operation requires the <code>S3:PutBucketWebsite</code>
  /// permission. By default, only the bucket owner can configure the website
  /// attached to a bucket; however, bucket owners can allow other users to set
  /// the website configuration by writing a bucket policy that grants them the
  /// <code>S3:PutBucketWebsite</code> permission.
  ///
  /// To redirect all website requests sent to the bucket's website endpoint,
  /// you add a website configuration with the following elements. Because all
  /// requests are sent to another website, you don't need to provide index
  /// document name for the bucket.
  ///
  /// <ul>
  /// <li>
  /// <code>WebsiteConfiguration</code>
  /// </li>
  /// <li>
  /// <code>RedirectAllRequestsTo</code>
  /// </li>
  /// <li>
  /// <code>HostName</code>
  /// </li>
  /// <li>
  /// <code>Protocol</code>
  /// </li>
  /// </ul>
  /// If you want granular control over redirects, you can use the following
  /// elements to add routing rules that describe conditions for redirecting
  /// requests and information about the redirect destination. In this case, the
  /// website configuration must provide an index document for the bucket,
  /// because some requests might not be redirected.
  ///
  /// <ul>
  /// <li>
  /// <code>WebsiteConfiguration</code>
  /// </li>
  /// <li>
  /// <code>IndexDocument</code>
  /// </li>
  /// <li>
  /// <code>Suffix</code>
  /// </li>
  /// <li>
  /// <code>ErrorDocument</code>
  /// </li>
  /// <li>
  /// <code>Key</code>
  /// </li>
  /// <li>
  /// <code>RoutingRules</code>
  /// </li>
  /// <li>
  /// <code>RoutingRule</code>
  /// </li>
  /// <li>
  /// <code>Condition</code>
  /// </li>
  /// <li>
  /// <code>HttpErrorCodeReturnedEquals</code>
  /// </li>
  /// <li>
  /// <code>KeyPrefixEquals</code>
  /// </li>
  /// <li>
  /// <code>Redirect</code>
  /// </li>
  /// <li>
  /// <code>Protocol</code>
  /// </li>
  /// <li>
  /// <code>HostName</code>
  /// </li>
  /// <li>
  /// <code>ReplaceKeyPrefixWith</code>
  /// </li>
  /// <li>
  /// <code>ReplaceKeyWith</code>
  /// </li>
  /// <li>
  /// <code>HttpRedirectCode</code>
  /// </li>
  /// </ul>
  /// Amazon S3 has a limitation of 50 routing rules per website configuration.
  /// If you require more than 50 routing rules, you can use object redirect.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/how-to-page-redirect.html">Configuring
  /// an Object Redirect</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// Parameter [bucket] :
  /// The bucket name.
  ///
  /// Parameter [websiteConfiguration] :
  /// Container for the request.
  ///
  /// Parameter [contentMD5] :
  /// The base64-encoded 128-bit MD5 digest of the data. You must use this
  /// header as a message integrity check to verify that the request body was
  /// not corrupted in transit. For more information, see <a
  /// href="http://www.ietf.org/rfc/rfc1864.txt">RFC 1864</a>.
  ///
  /// For requests made using the AWS Command Line Interface (CLI) or AWS SDKs,
  /// this field is calculated automatically.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<void> putBucketWebsite({
    @_s.required String bucket,
    @_s.required WebsiteConfiguration websiteConfiguration,
    String contentMD5,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    ArgumentError.checkNotNull(websiteConfiguration, 'websiteConfiguration');
    final headers = <String, String>{};
    contentMD5?.let((v) => headers['Content-MD5'] = v.toString());
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    await _protocol.send(
      method: 'PUT',
      requestUri: '/${Uri.encodeComponent(bucket)}?website',
      headers: headers,
      payload: websiteConfiguration.toXml('WebsiteConfiguration'),
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Adds an object to a bucket. You must have WRITE permissions on a bucket to
  /// add an object to it.
  ///
  /// Amazon S3 never adds partial objects; if you receive a success response,
  /// Amazon S3 added the entire object to the bucket.
  ///
  /// Amazon S3 is a distributed system. If it receives multiple write requests
  /// for the same object simultaneously, it overwrites all but the last object
  /// written. Amazon S3 does not provide object locking; if you need this, make
  /// sure to build it into your application layer or use versioning instead.
  ///
  /// To ensure that data is not corrupted traversing the network, use the
  /// <code>Content-MD5</code> header. When you use this header, Amazon S3
  /// checks the object against the provided MD5 value and, if they do not
  /// match, returns an error. Additionally, you can calculate the MD5 while
  /// putting an object to Amazon S3 and compare the returned ETag to the
  /// calculated MD5 value.
  /// <note>
  /// The <code>Content-MD5</code> header is required for any request to upload
  /// an object with a retention period configured using Amazon S3 Object Lock.
  /// For more information about Amazon S3 Object Lock, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lock-overview.html">Amazon
  /// S3 Object Lock Overview</a> in the <i>Amazon Simple Storage Service
  /// Developer Guide</i>.
  /// </note>
  /// <b>Server-side Encryption</b>
  ///
  /// You can optionally request server-side encryption. With server-side
  /// encryption, Amazon S3 encrypts your data as it writes it to disks in its
  /// data centers and decrypts the data when you access it. You have the option
  /// to provide your own encryption key or use AWS managed encryption keys
  /// (SSE-S3 or SSE-KMS). For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingServerSideEncryption.html">Using
  /// Server-Side Encryption</a>.
  ///
  /// If you request server-side encryption using AWS Key Management Service
  /// (SSE-KMS), you can enable an S3 Bucket Key at the object-level. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/bucket-key.html">Amazon
  /// S3 Bucket Keys</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// <b>Access Control List (ACL)-Specific Request Headers</b>
  ///
  /// You can use headers to grant ACL- based permissions. By default, all
  /// objects are private. Only the owner has full access control. When adding a
  /// new object, you can grant permissions to individual AWS accounts or to
  /// predefined groups defined by Amazon S3. These permissions are then added
  /// to the ACL on the object. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html">Access
  /// Control List (ACL) Overview</a> and <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-using-rest-api.html">Managing
  /// ACLs Using the REST API</a>.
  ///
  /// <b>Storage Class Options</b>
  ///
  /// By default, Amazon S3 uses the STANDARD Storage Class to store newly
  /// created objects. The STANDARD storage class provides high durability and
  /// high availability. Depending on performance needs, you can specify a
  /// different Storage Class. Amazon S3 on Outposts only uses the OUTPOSTS
  /// Storage Class. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-class-intro.html">Storage
  /// Classes</a> in the <i>Amazon S3 Service Developer Guide</i>.
  ///
  /// <b>Versioning</b>
  ///
  /// If you enable versioning for a bucket, Amazon S3 automatically generates a
  /// unique version ID for the object being stored. Amazon S3 returns this ID
  /// in the response. When you enable versioning for a bucket, if Amazon S3
  /// receives multiple write requests for the same object simultaneously, it
  /// stores all of the objects.
  ///
  /// For more information about versioning, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/AddingObjectstoVersioningEnabledBuckets.html">Adding
  /// Objects to Versioning Enabled Buckets</a>. For information about returning
  /// the versioning state of a bucket, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketVersioning.html">GetBucketVersioning</a>.
  /// <p class="title"> <b>Related Resources</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CopyObject.html">CopyObject</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteObject.html">DeleteObject</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The bucket name to which the PUT operation was initiated.
  ///
  /// When using this API with an access point, you must direct requests to the
  /// access point hostname. The access point hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com.
  /// When using this operation with an access point through the AWS SDKs, you
  /// provide the access point ARN in place of the bucket name. For more
  /// information about access point ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using
  /// Access Points</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// When using this API with Amazon S3 on Outposts, you must direct requests
  /// to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com.
  /// When using this operation using S3 on Outposts through the AWS SDKs, you
  /// provide the Outposts bucket ARN in place of the bucket name. For more
  /// information about S3 on Outposts ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using
  /// S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// Parameter [key] :
  /// Object key for which the PUT operation was initiated.
  ///
  /// Parameter [acl] :
  /// The canned ACL to apply to the object. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#CannedACL">Canned
  /// ACL</a>.
  ///
  /// This action is not supported by Amazon S3 on Outposts.
  ///
  /// Parameter [body] :
  /// Object data.
  ///
  /// Parameter [bucketKeyEnabled] :
  /// Specifies whether Amazon S3 should use an S3 Bucket Key for object
  /// encryption with server-side encryption using AWS KMS (SSE-KMS). Setting
  /// this header to <code>true</code> causes Amazon S3 to use an S3 Bucket Key
  /// for object encryption with SSE-KMS.
  ///
  /// Specifying this header with a PUT operation doesn’t affect bucket-level
  /// settings for S3 Bucket Key.
  ///
  /// Parameter [cacheControl] :
  /// Can be used to specify caching behavior along the request/reply chain. For
  /// more information, see <a
  /// href="http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.9">http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.9</a>.
  ///
  /// Parameter [contentDisposition] :
  /// Specifies presentational information for the object. For more information,
  /// see <a
  /// href="http://www.w3.org/Protocols/rfc2616/rfc2616-sec19.html#sec19.5.1">http://www.w3.org/Protocols/rfc2616/rfc2616-sec19.html#sec19.5.1</a>.
  ///
  /// Parameter [contentEncoding] :
  /// Specifies what content encodings have been applied to the object and thus
  /// what decoding mechanisms must be applied to obtain the media-type
  /// referenced by the Content-Type header field. For more information, see <a
  /// href="http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.11">http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.11</a>.
  ///
  /// Parameter [contentLanguage] :
  /// The language the content is in.
  ///
  /// Parameter [contentLength] :
  /// Size of the body in bytes. This parameter is useful when the size of the
  /// body cannot be determined automatically. For more information, see <a
  /// href="http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.13">http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.13</a>.
  ///
  /// Parameter [contentMD5] :
  /// The base64-encoded 128-bit MD5 digest of the message (without the headers)
  /// according to RFC 1864. This header can be used as a message integrity
  /// check to verify that the data is the same data that was originally sent.
  /// Although it is optional, we recommend using the Content-MD5 mechanism as
  /// an end-to-end integrity check. For more information about REST request
  /// authentication, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/RESTAuthentication.html">REST
  /// Authentication</a>.
  ///
  /// Parameter [contentType] :
  /// A standard MIME type describing the format of the contents. For more
  /// information, see <a
  /// href="http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.17">http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.17</a>.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  ///
  /// Parameter [expires] :
  /// The date and time at which the object is no longer cacheable. For more
  /// information, see <a
  /// href="http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.21">http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.21</a>.
  ///
  /// Parameter [grantFullControl] :
  /// Gives the grantee READ, READ_ACP, and WRITE_ACP permissions on the object.
  ///
  /// This action is not supported by Amazon S3 on Outposts.
  ///
  /// Parameter [grantRead] :
  /// Allows grantee to read the object data and its metadata.
  ///
  /// This action is not supported by Amazon S3 on Outposts.
  ///
  /// Parameter [grantReadACP] :
  /// Allows grantee to read the object ACL.
  ///
  /// This action is not supported by Amazon S3 on Outposts.
  ///
  /// Parameter [grantWriteACP] :
  /// Allows grantee to write the ACL for the applicable object.
  ///
  /// This action is not supported by Amazon S3 on Outposts.
  ///
  /// Parameter [metadata] :
  /// A map of metadata to store with the object in S3.
  ///
  /// Parameter [objectLockLegalHoldStatus] :
  /// Specifies whether a legal hold will be applied to this object. For more
  /// information about S3 Object Lock, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lock.html">Object
  /// Lock</a>.
  ///
  /// Parameter [objectLockMode] :
  /// The Object Lock mode that you want to apply to this object.
  ///
  /// Parameter [objectLockRetainUntilDate] :
  /// The date and time when you want this object's Object Lock to expire.
  ///
  /// Parameter [sSECustomerAlgorithm] :
  /// Specifies the algorithm to use to when encrypting the object (for example,
  /// AES256).
  ///
  /// Parameter [sSECustomerKey] :
  /// Specifies the customer-provided encryption key for Amazon S3 to use in
  /// encrypting data. This value is used to store the object and then it is
  /// discarded; Amazon S3 does not store the encryption key. The key must be
  /// appropriate for use with the algorithm specified in the
  /// <code>x-amz-server-side-encryption-customer-algorithm</code> header.
  ///
  /// Parameter [sSECustomerKeyMD5] :
  /// Specifies the 128-bit MD5 digest of the encryption key according to RFC
  /// 1321. Amazon S3 uses this header for a message integrity check to ensure
  /// that the encryption key was transmitted without error.
  ///
  /// Parameter [sSEKMSEncryptionContext] :
  /// Specifies the AWS KMS Encryption Context to use for object encryption. The
  /// value of this header is a base64-encoded UTF-8 string holding JSON with
  /// the encryption context key-value pairs.
  ///
  /// Parameter [sSEKMSKeyId] :
  /// If <code>x-amz-server-side-encryption</code> is present and has the value
  /// of <code>aws:kms</code>, this header specifies the ID of the AWS Key
  /// Management Service (AWS KMS) symmetrical customer managed customer master
  /// key (CMK) that was used for the object.
  ///
  /// If the value of <code>x-amz-server-side-encryption</code> is
  /// <code>aws:kms</code>, this header specifies the ID of the symmetric
  /// customer managed AWS KMS CMK that will be used for the object. If you
  /// specify <code>x-amz-server-side-encryption:aws:kms</code>, but do not
  /// provide<code> x-amz-server-side-encryption-aws-kms-key-id</code>, Amazon
  /// S3 uses the AWS managed CMK in AWS to protect the data.
  ///
  /// Parameter [serverSideEncryption] :
  /// The server-side encryption algorithm used when storing this object in
  /// Amazon S3 (for example, AES256, aws:kms).
  ///
  /// Parameter [storageClass] :
  /// By default, Amazon S3 uses the STANDARD Storage Class to store newly
  /// created objects. The STANDARD storage class provides high durability and
  /// high availability. Depending on performance needs, you can specify a
  /// different Storage Class. Amazon S3 on Outposts only uses the OUTPOSTS
  /// Storage Class. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-class-intro.html">Storage
  /// Classes</a> in the <i>Amazon S3 Service Developer Guide</i>.
  ///
  /// Parameter [tagging] :
  /// The tag-set for the object. The tag-set must be encoded as URL Query
  /// parameters. (For example, "Key1=Value1")
  ///
  /// Parameter [websiteRedirectLocation] :
  /// If the bucket is configured as a website, redirects requests for this
  /// object to another object in the same bucket or to an external URL. Amazon
  /// S3 stores the value of this header in the object metadata. For information
  /// about object metadata, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html">Object
  /// Key and Metadata</a>.
  ///
  /// In the following example, the request header sets the redirect to an
  /// object (anotherPage.html) in the same bucket:
  ///
  /// <code>x-amz-website-redirect-location: /anotherPage.html</code>
  ///
  /// In the following example, the request header sets the object redirect to
  /// another website:
  ///
  /// <code>x-amz-website-redirect-location: http://www.example.com/</code>
  ///
  /// For more information about website hosting in Amazon S3, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/WebsiteHosting.html">Hosting
  /// Websites on Amazon S3</a> and <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/how-to-page-redirect.html">How
  /// to Configure Website Page Redirects</a>.
  Future<PutObjectOutput> putObject({
    @_s.required String bucket,
    @_s.required String key,
    ObjectCannedACL acl,
    Uint8List body,
    bool bucketKeyEnabled,
    String cacheControl,
    String contentDisposition,
    String contentEncoding,
    String contentLanguage,
    int contentLength,
    String contentMD5,
    String contentType,
    String expectedBucketOwner,
    DateTime expires,
    String grantFullControl,
    String grantRead,
    String grantReadACP,
    String grantWriteACP,
    Map<String, String> metadata,
    ObjectLockLegalHoldStatus objectLockLegalHoldStatus,
    ObjectLockMode objectLockMode,
    DateTime objectLockRetainUntilDate,
    RequestPayer requestPayer,
    String sSECustomerAlgorithm,
    Uint8List sSECustomerKey,
    String sSECustomerKeyMD5,
    String sSEKMSEncryptionContext,
    String sSEKMSKeyId,
    ServerSideEncryption serverSideEncryption,
    StorageClass storageClass,
    String tagging,
    String websiteRedirectLocation,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    ArgumentError.checkNotNull(key, 'key');
    _s.validateStringLength(
      'key',
      key,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final headers = <String, String>{};
    acl?.let((v) => headers['x-amz-acl'] = v.toValue());
    bucketKeyEnabled?.let((v) =>
        headers['x-amz-server-side-encryption-bucket-key-enabled'] =
            v.toString());
    cacheControl?.let((v) => headers['Cache-Control'] = v.toString());
    contentDisposition
        ?.let((v) => headers['Content-Disposition'] = v.toString());
    contentEncoding?.let((v) => headers['Content-Encoding'] = v.toString());
    contentLanguage?.let((v) => headers['Content-Language'] = v.toString());
    contentLength?.let((v) => headers['Content-Length'] = v.toString());
    contentMD5?.let((v) => headers['Content-MD5'] = v.toString());
    contentType?.let((v) => headers['Content-Type'] = v.toString());
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    expires?.let((v) => headers['Expires'] = _s.rfc822ToJson(v));
    grantFullControl
        ?.let((v) => headers['x-amz-grant-full-control'] = v.toString());
    grantRead?.let((v) => headers['x-amz-grant-read'] = v.toString());
    grantReadACP?.let((v) => headers['x-amz-grant-read-acp'] = v.toString());
    grantWriteACP?.let((v) => headers['x-amz-grant-write-acp'] = v.toString());
    metadata?.forEach((key, value) => headers['x-amz-meta-$key'] = value);
    objectLockLegalHoldStatus
        ?.let((v) => headers['x-amz-object-lock-legal-hold'] = v.toValue());
    objectLockMode?.let((v) => headers['x-amz-object-lock-mode'] = v.toValue());
    objectLockRetainUntilDate?.let((v) =>
        headers['x-amz-object-lock-retain-until-date'] = _s.iso8601ToJson(v));
    requestPayer?.let((v) => headers['x-amz-request-payer'] = v.toValue());
    sSECustomerAlgorithm?.let((v) =>
        headers['x-amz-server-side-encryption-customer-algorithm'] =
            v.toString());
    sSECustomerKey?.let((v) =>
        headers['x-amz-server-side-encryption-customer-key'] = v.toString());
    sSECustomerKeyMD5?.let((v) =>
        headers['x-amz-server-side-encryption-customer-key-MD5'] =
            v.toString());
    sSEKMSEncryptionContext?.let(
        (v) => headers['x-amz-server-side-encryption-context'] = v.toString());
    sSEKMSKeyId?.let((v) =>
        headers['x-amz-server-side-encryption-aws-kms-key-id'] = v.toString());
    serverSideEncryption
        ?.let((v) => headers['x-amz-server-side-encryption'] = v.toValue());
    storageClass?.let((v) => headers['x-amz-storage-class'] = v.toValue());
    tagging?.let((v) => headers['x-amz-tagging'] = v.toString());
    websiteRedirectLocation
        ?.let((v) => headers['x-amz-website-redirect-location'] = v.toString());
    final $result = await _protocol.sendRaw(
      method: 'PUT',
      requestUri:
          '/${Uri.encodeComponent(bucket)}/${key.split('/').map(Uri.encodeComponent).join('/')}',
      headers: headers,
      payload: body,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return PutObjectOutput(
      bucketKeyEnabled: _s.extractHeaderBoolValue(
          $result.headers, 'x-amz-server-side-encryption-bucket-key-enabled'),
      eTag: _s.extractHeaderStringValue($result.headers, 'ETag'),
      expiration:
          _s.extractHeaderStringValue($result.headers, 'x-amz-expiration'),
      requestCharged: _s
          .extractHeaderStringValue($result.headers, 'x-amz-request-charged')
          ?.toRequestCharged(),
      sSECustomerAlgorithm: _s.extractHeaderStringValue(
          $result.headers, 'x-amz-server-side-encryption-customer-algorithm'),
      sSECustomerKeyMD5: _s.extractHeaderStringValue(
          $result.headers, 'x-amz-server-side-encryption-customer-key-MD5'),
      sSEKMSEncryptionContext: _s.extractHeaderStringValue(
          $result.headers, 'x-amz-server-side-encryption-context'),
      sSEKMSKeyId: _s.extractHeaderStringValue(
          $result.headers, 'x-amz-server-side-encryption-aws-kms-key-id'),
      serverSideEncryption: _s
          .extractHeaderStringValue(
              $result.headers, 'x-amz-server-side-encryption')
          ?.toServerSideEncryption(),
      versionId:
          _s.extractHeaderStringValue($result.headers, 'x-amz-version-id'),
    );
  }

  /// Uses the <code>acl</code> subresource to set the access control list (ACL)
  /// permissions for a new or existing object in an S3 bucket. You must have
  /// <code>WRITE_ACP</code> permission to set the ACL of an object. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#permissions">What
  /// permissions can I grant?</a> in the <i>Amazon Simple Storage Service
  /// Developer Guide</i>.
  ///
  /// This action is not supported by Amazon S3 on Outposts.
  ///
  /// Depending on your application needs, you can choose to set the ACL on an
  /// object using either the request body or the headers. For example, if you
  /// have an existing application that updates a bucket ACL using the request
  /// body, you can continue to use that approach. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html">Access
  /// Control List (ACL) Overview</a> in the <i>Amazon S3 Developer Guide</i>.
  ///
  /// <b>Access Permissions</b>
  ///
  /// You can set access permissions using one of the following methods:
  ///
  /// <ul>
  /// <li>
  /// Specify a canned ACL with the <code>x-amz-acl</code> request header.
  /// Amazon S3 supports a set of predefined ACLs, known as canned ACLs. Each
  /// canned ACL has a predefined set of grantees and permissions. Specify the
  /// canned ACL name as the value of <code>x-amz-ac</code>l. If you use this
  /// header, you cannot use other access control-specific headers in your
  /// request. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#CannedACL">Canned
  /// ACL</a>.
  /// </li>
  /// <li>
  /// Specify access permissions explicitly with the
  /// <code>x-amz-grant-read</code>, <code>x-amz-grant-read-acp</code>,
  /// <code>x-amz-grant-write-acp</code>, and
  /// <code>x-amz-grant-full-control</code> headers. When using these headers,
  /// you specify explicit access permissions and grantees (AWS accounts or
  /// Amazon S3 groups) who will receive the permission. If you use these
  /// ACL-specific headers, you cannot use <code>x-amz-acl</code> header to set
  /// a canned ACL. These parameters map to the set of permissions that Amazon
  /// S3 supports in an ACL. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html">Access
  /// Control List (ACL) Overview</a>.
  ///
  /// You specify each grantee as a type=value pair, where the type is one of
  /// the following:
  ///
  /// <ul>
  /// <li>
  /// <code>id</code> – if the value specified is the canonical user ID of an
  /// AWS account
  /// </li>
  /// <li>
  /// <code>uri</code> – if you are granting permissions to a predefined group
  /// </li>
  /// <li>
  /// <code>emailAddress</code> – if the value specified is the email address of
  /// an AWS account
  /// <note>
  /// Using email addresses to specify a grantee is only supported in the
  /// following AWS Regions:
  ///
  /// <ul>
  /// <li>
  /// US East (N. Virginia)
  /// </li>
  /// <li>
  /// US West (N. California)
  /// </li>
  /// <li>
  /// US West (Oregon)
  /// </li>
  /// <li>
  /// Asia Pacific (Singapore)
  /// </li>
  /// <li>
  /// Asia Pacific (Sydney)
  /// </li>
  /// <li>
  /// Asia Pacific (Tokyo)
  /// </li>
  /// <li>
  /// Europe (Ireland)
  /// </li>
  /// <li>
  /// South America (São Paulo)
  /// </li>
  /// </ul>
  /// For a list of all the Amazon S3 supported Regions and endpoints, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/rande.html#s3_region">Regions
  /// and Endpoints</a> in the AWS General Reference.
  /// </note> </li>
  /// </ul>
  /// For example, the following <code>x-amz-grant-read</code> header grants
  /// list objects permission to the two AWS accounts identified by their email
  /// addresses.
  ///
  /// <code>x-amz-grant-read: emailAddress="xyz@amazon.com",
  /// emailAddress="abc@amazon.com" </code>
  /// </li>
  /// </ul>
  /// You can use either a canned ACL or specify access permissions explicitly.
  /// You cannot do both.
  ///
  /// <b>Grantee Values</b>
  ///
  /// You can specify the person (grantee) to whom you're assigning access
  /// rights (using request elements) in the following ways:
  ///
  /// <ul>
  /// <li>
  /// By the person's ID:
  ///
  /// <code>&lt;Grantee xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  /// xsi:type="CanonicalUser"&gt;&lt;ID&gt;&lt;&gt;ID&lt;&gt;&lt;/ID&gt;&lt;DisplayName&gt;&lt;&gt;GranteesEmail&lt;&gt;&lt;/DisplayName&gt;
  /// &lt;/Grantee&gt;</code>
  ///
  /// DisplayName is optional and ignored in the request.
  /// </li>
  /// <li>
  /// By URI:
  ///
  /// <code>&lt;Grantee xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  /// xsi:type="Group"&gt;&lt;URI&gt;&lt;&gt;http://acs.amazonaws.com/groups/global/AuthenticatedUsers&lt;&gt;&lt;/URI&gt;&lt;/Grantee&gt;</code>
  /// </li>
  /// <li>
  /// By Email address:
  ///
  /// <code>&lt;Grantee xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  /// xsi:type="AmazonCustomerByEmail"&gt;&lt;EmailAddress&gt;&lt;&gt;Grantees@email.com&lt;&gt;&lt;/EmailAddress&gt;lt;/Grantee&gt;</code>
  ///
  /// The grantee is resolved to the CanonicalUser and, in a response to a GET
  /// Object acl request, appears as the CanonicalUser.
  /// <note>
  /// Using email addresses to specify a grantee is only supported in the
  /// following AWS Regions:
  ///
  /// <ul>
  /// <li>
  /// US East (N. Virginia)
  /// </li>
  /// <li>
  /// US West (N. California)
  /// </li>
  /// <li>
  /// US West (Oregon)
  /// </li>
  /// <li>
  /// Asia Pacific (Singapore)
  /// </li>
  /// <li>
  /// Asia Pacific (Sydney)
  /// </li>
  /// <li>
  /// Asia Pacific (Tokyo)
  /// </li>
  /// <li>
  /// Europe (Ireland)
  /// </li>
  /// <li>
  /// South America (São Paulo)
  /// </li>
  /// </ul>
  /// For a list of all the Amazon S3 supported Regions and endpoints, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/rande.html#s3_region">Regions
  /// and Endpoints</a> in the AWS General Reference.
  /// </note> </li>
  /// </ul>
  /// <b>Versioning</b>
  ///
  /// The ACL of an object is set at the object version level. By default, PUT
  /// sets the ACL of the current version of an object. To set the ACL of a
  /// different version, use the <code>versionId</code> subresource.
  /// <p class="title"> <b>Related Resources</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CopyObject.html">CopyObject</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html">GetObject</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [NoSuchKey].
  ///
  /// Parameter [bucket] :
  /// The bucket name that contains the object to which you want to attach the
  /// ACL.
  ///
  /// When using this API with an access point, you must direct requests to the
  /// access point hostname. The access point hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com.
  /// When using this operation with an access point through the AWS SDKs, you
  /// provide the access point ARN in place of the bucket name. For more
  /// information about access point ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using
  /// Access Points</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// Parameter [key] :
  /// Key for which the PUT operation was initiated.
  ///
  /// When using this API with an access point, you must direct requests to the
  /// access point hostname. The access point hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com.
  /// When using this operation with an access point through the AWS SDKs, you
  /// provide the access point ARN in place of the bucket name. For more
  /// information about access point ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using
  /// Access Points</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// When using this API with Amazon S3 on Outposts, you must direct requests
  /// to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com.
  /// When using this operation using S3 on Outposts through the AWS SDKs, you
  /// provide the Outposts bucket ARN in place of the bucket name. For more
  /// information about S3 on Outposts ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using
  /// S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// Parameter [acl] :
  /// The canned ACL to apply to the object. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#CannedACL">Canned
  /// ACL</a>.
  ///
  /// Parameter [accessControlPolicy] :
  /// Contains the elements that set the ACL permissions for an object per
  /// grantee.
  ///
  /// Parameter [contentMD5] :
  /// The base64-encoded 128-bit MD5 digest of the data. This header must be
  /// used as a message integrity check to verify that the request body was not
  /// corrupted in transit. For more information, go to <a
  /// href="http://www.ietf.org/rfc/rfc1864.txt">RFC 1864.&gt;</a>
  ///
  /// For requests made using the AWS Command Line Interface (CLI) or AWS SDKs,
  /// this field is calculated automatically.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  ///
  /// Parameter [grantFullControl] :
  /// Allows grantee the read, write, read ACP, and write ACP permissions on the
  /// bucket.
  ///
  /// This action is not supported by Amazon S3 on Outposts.
  ///
  /// Parameter [grantRead] :
  /// Allows grantee to list the objects in the bucket.
  ///
  /// This action is not supported by Amazon S3 on Outposts.
  ///
  /// Parameter [grantReadACP] :
  /// Allows grantee to read the bucket ACL.
  ///
  /// This action is not supported by Amazon S3 on Outposts.
  ///
  /// Parameter [grantWrite] :
  /// Allows grantee to create, overwrite, and delete any object in the bucket.
  ///
  /// Parameter [grantWriteACP] :
  /// Allows grantee to write the ACL for the applicable bucket.
  ///
  /// This action is not supported by Amazon S3 on Outposts.
  ///
  /// Parameter [versionId] :
  /// VersionId used to reference a specific version of the object.
  Future<PutObjectAclOutput> putObjectAcl({
    @_s.required String bucket,
    @_s.required String key,
    ObjectCannedACL acl,
    AccessControlPolicy accessControlPolicy,
    String contentMD5,
    String expectedBucketOwner,
    String grantFullControl,
    String grantRead,
    String grantReadACP,
    String grantWrite,
    String grantWriteACP,
    RequestPayer requestPayer,
    String versionId,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    ArgumentError.checkNotNull(key, 'key');
    _s.validateStringLength(
      'key',
      key,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final headers = <String, String>{};
    acl?.let((v) => headers['x-amz-acl'] = v.toValue());
    contentMD5?.let((v) => headers['Content-MD5'] = v.toString());
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    grantFullControl
        ?.let((v) => headers['x-amz-grant-full-control'] = v.toString());
    grantRead?.let((v) => headers['x-amz-grant-read'] = v.toString());
    grantReadACP?.let((v) => headers['x-amz-grant-read-acp'] = v.toString());
    grantWrite?.let((v) => headers['x-amz-grant-write'] = v.toString());
    grantWriteACP?.let((v) => headers['x-amz-grant-write-acp'] = v.toString());
    requestPayer?.let((v) => headers['x-amz-request-payer'] = v.toValue());
    final $query = <String, List<String>>{
      if (versionId != null) 'versionId': [versionId],
    };
    final $result = await _protocol.sendRaw(
      method: 'PUT',
      requestUri:
          '/${Uri.encodeComponent(bucket)}/${key.split('/').map(Uri.encodeComponent).join('/')}?acl',
      queryParams: $query,
      headers: headers,
      payload: accessControlPolicy?.toXml('AccessControlPolicy'),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return PutObjectAclOutput(
      requestCharged: _s
          .extractHeaderStringValue($result.headers, 'x-amz-request-charged')
          ?.toRequestCharged(),
    );
  }

  /// Applies a Legal Hold configuration to the specified object.
  ///
  /// This action is not supported by Amazon S3 on Outposts.
  /// <p class="title"> <b>Related Resources</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lock.html">Locking
  /// Objects</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The bucket name containing the object that you want to place a Legal Hold
  /// on.
  ///
  /// When using this API with an access point, you must direct requests to the
  /// access point hostname. The access point hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com.
  /// When using this operation with an access point through the AWS SDKs, you
  /// provide the access point ARN in place of the bucket name. For more
  /// information about access point ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using
  /// Access Points</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// Parameter [key] :
  /// The key name for the object that you want to place a Legal Hold on.
  ///
  /// Parameter [contentMD5] :
  /// The MD5 hash for the request body.
  ///
  /// For requests made using the AWS Command Line Interface (CLI) or AWS SDKs,
  /// this field is calculated automatically.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  ///
  /// Parameter [legalHold] :
  /// Container element for the Legal Hold configuration you want to apply to
  /// the specified object.
  ///
  /// Parameter [versionId] :
  /// The version ID of the object that you want to place a Legal Hold on.
  Future<PutObjectLegalHoldOutput> putObjectLegalHold({
    @_s.required String bucket,
    @_s.required String key,
    String contentMD5,
    String expectedBucketOwner,
    ObjectLockLegalHold legalHold,
    RequestPayer requestPayer,
    String versionId,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    ArgumentError.checkNotNull(key, 'key');
    _s.validateStringLength(
      'key',
      key,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final headers = <String, String>{};
    contentMD5?.let((v) => headers['Content-MD5'] = v.toString());
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    requestPayer?.let((v) => headers['x-amz-request-payer'] = v.toValue());
    final $query = <String, List<String>>{
      if (versionId != null) 'versionId': [versionId],
    };
    final $result = await _protocol.sendRaw(
      method: 'PUT',
      requestUri:
          '/${Uri.encodeComponent(bucket)}/${key.split('/').map(Uri.encodeComponent).join('/')}?legal-hold',
      queryParams: $query,
      headers: headers,
      payload: legalHold?.toXml('LegalHold'),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return PutObjectLegalHoldOutput(
      requestCharged: _s
          .extractHeaderStringValue($result.headers, 'x-amz-request-charged')
          ?.toRequestCharged(),
    );
  }

  /// Places an Object Lock configuration on the specified bucket. The rule
  /// specified in the Object Lock configuration will be applied by default to
  /// every new object placed in the specified bucket.
  /// <note>
  /// <code>DefaultRetention</code> requires either Days or Years. You can't
  /// specify both at the same time.
  /// </note> <p class="title"> <b>Related Resources</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lock.html">Locking
  /// Objects</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The bucket whose Object Lock configuration you want to create or replace.
  ///
  /// Parameter [contentMD5] :
  /// The MD5 hash for the request body.
  ///
  /// For requests made using the AWS Command Line Interface (CLI) or AWS SDKs,
  /// this field is calculated automatically.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  ///
  /// Parameter [objectLockConfiguration] :
  /// The Object Lock configuration that you want to apply to the specified
  /// bucket.
  ///
  /// Parameter [token] :
  /// A token to allow Object Lock to be enabled for an existing bucket.
  Future<PutObjectLockConfigurationOutput> putObjectLockConfiguration({
    @_s.required String bucket,
    String contentMD5,
    String expectedBucketOwner,
    ObjectLockConfiguration objectLockConfiguration,
    RequestPayer requestPayer,
    String token,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    final headers = <String, String>{};
    contentMD5?.let((v) => headers['Content-MD5'] = v.toString());
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    requestPayer?.let((v) => headers['x-amz-request-payer'] = v.toValue());
    token?.let((v) => headers['x-amz-bucket-object-lock-token'] = v.toString());
    final $result = await _protocol.sendRaw(
      method: 'PUT',
      requestUri: '/${Uri.encodeComponent(bucket)}?object-lock',
      headers: headers,
      payload: objectLockConfiguration?.toXml('ObjectLockConfiguration'),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return PutObjectLockConfigurationOutput(
      requestCharged: _s
          .extractHeaderStringValue($result.headers, 'x-amz-request-charged')
          ?.toRequestCharged(),
    );
  }

  /// Places an Object Retention configuration on an object.
  ///
  /// This action is not supported by Amazon S3 on Outposts.
  /// <p class="title"> <b>Related Resources</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lock.html">Locking
  /// Objects</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The bucket name that contains the object you want to apply this Object
  /// Retention configuration to.
  ///
  /// When using this API with an access point, you must direct requests to the
  /// access point hostname. The access point hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com.
  /// When using this operation with an access point through the AWS SDKs, you
  /// provide the access point ARN in place of the bucket name. For more
  /// information about access point ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using
  /// Access Points</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// Parameter [key] :
  /// The key name for the object that you want to apply this Object Retention
  /// configuration to.
  ///
  /// Parameter [bypassGovernanceRetention] :
  /// Indicates whether this operation should bypass Governance-mode
  /// restrictions.
  ///
  /// Parameter [contentMD5] :
  /// The MD5 hash for the request body.
  ///
  /// For requests made using the AWS Command Line Interface (CLI) or AWS SDKs,
  /// this field is calculated automatically.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  ///
  /// Parameter [retention] :
  /// The container element for the Object Retention configuration.
  ///
  /// Parameter [versionId] :
  /// The version ID for the object that you want to apply this Object Retention
  /// configuration to.
  Future<PutObjectRetentionOutput> putObjectRetention({
    @_s.required String bucket,
    @_s.required String key,
    bool bypassGovernanceRetention,
    String contentMD5,
    String expectedBucketOwner,
    RequestPayer requestPayer,
    ObjectLockRetention retention,
    String versionId,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    ArgumentError.checkNotNull(key, 'key');
    _s.validateStringLength(
      'key',
      key,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final headers = <String, String>{};
    bypassGovernanceRetention?.let(
        (v) => headers['x-amz-bypass-governance-retention'] = v.toString());
    contentMD5?.let((v) => headers['Content-MD5'] = v.toString());
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    requestPayer?.let((v) => headers['x-amz-request-payer'] = v.toValue());
    final $query = <String, List<String>>{
      if (versionId != null) 'versionId': [versionId],
    };
    final $result = await _protocol.sendRaw(
      method: 'PUT',
      requestUri:
          '/${Uri.encodeComponent(bucket)}/${key.split('/').map(Uri.encodeComponent).join('/')}?retention',
      queryParams: $query,
      headers: headers,
      payload: retention?.toXml('Retention'),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return PutObjectRetentionOutput(
      requestCharged: _s
          .extractHeaderStringValue($result.headers, 'x-amz-request-charged')
          ?.toRequestCharged(),
    );
  }

  /// Sets the supplied tag-set to an object that already exists in a bucket.
  ///
  /// A tag is a key-value pair. You can associate tags with an object by
  /// sending a PUT request against the tagging subresource that is associated
  /// with the object. You can retrieve tags by sending a GET request. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObjectTagging.html">GetObjectTagging</a>.
  ///
  /// For tagging-related restrictions related to characters and encodings, see
  /// <a
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/allocation-tag-restrictions.html">Tag
  /// Restrictions</a>. Note that Amazon S3 limits the maximum number of tags to
  /// 10 tags per object.
  ///
  /// To use this operation, you must have permission to perform the
  /// <code>s3:PutObjectTagging</code> action. By default, the bucket owner has
  /// this permission and can grant this permission to others.
  ///
  /// To put tags of any other version, use the <code>versionId</code> query
  /// parameter. You also need permission for the
  /// <code>s3:PutObjectVersionTagging</code> action.
  ///
  /// For information about the Amazon S3 object tagging feature, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-tagging.html">Object
  /// Tagging</a>.
  /// <p class="title"> <b>Special Errors</b>
  ///
  /// <ul>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code: InvalidTagError </i>
  /// </li>
  /// <li>
  /// <i>Cause: The tag provided was not a valid tag. This error can occur if
  /// the tag did not pass input validation. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-tagging.html">Object
  /// Tagging</a>.</i>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code: MalformedXMLError </i>
  /// </li>
  /// <li>
  /// <i>Cause: The XML provided does not match the schema.</i>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code: OperationAbortedError </i>
  /// </li>
  /// <li>
  /// <i>Cause: A conflicting conditional operation is currently in progress
  /// against this resource. Please try again.</i>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code: InternalError</i>
  /// </li>
  /// <li>
  /// <i>Cause: The service was unable to apply the provided tag to the
  /// object.</i>
  /// </li>
  /// </ul> </li>
  /// </ul> <p class="title"> <b>Related Resources</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObjectTagging.html">GetObjectTagging</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The bucket name containing the object.
  ///
  /// When using this API with an access point, you must direct requests to the
  /// access point hostname. The access point hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com.
  /// When using this operation with an access point through the AWS SDKs, you
  /// provide the access point ARN in place of the bucket name. For more
  /// information about access point ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using
  /// Access Points</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// When using this API with Amazon S3 on Outposts, you must direct requests
  /// to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com.
  /// When using this operation using S3 on Outposts through the AWS SDKs, you
  /// provide the Outposts bucket ARN in place of the bucket name. For more
  /// information about S3 on Outposts ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using
  /// S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// Parameter [key] :
  /// Name of the object key.
  ///
  /// Parameter [tagging] :
  /// Container for the <code>TagSet</code> and <code>Tag</code> elements
  ///
  /// Parameter [contentMD5] :
  /// The MD5 hash for the request body.
  ///
  /// For requests made using the AWS Command Line Interface (CLI) or AWS SDKs,
  /// this field is calculated automatically.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  ///
  /// Parameter [versionId] :
  /// The versionId of the object that the tag-set will be added to.
  Future<PutObjectTaggingOutput> putObjectTagging({
    @_s.required String bucket,
    @_s.required String key,
    @_s.required Tagging tagging,
    String contentMD5,
    String expectedBucketOwner,
    String versionId,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    ArgumentError.checkNotNull(key, 'key');
    _s.validateStringLength(
      'key',
      key,
      1,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagging, 'tagging');
    final headers = <String, String>{};
    contentMD5?.let((v) => headers['Content-MD5'] = v.toString());
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    final $query = <String, List<String>>{
      if (versionId != null) 'versionId': [versionId],
    };
    final $result = await _protocol.sendRaw(
      method: 'PUT',
      requestUri:
          '/${Uri.encodeComponent(bucket)}/${key.split('/').map(Uri.encodeComponent).join('/')}?tagging',
      queryParams: $query,
      headers: headers,
      payload: tagging.toXml('Tagging'),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return PutObjectTaggingOutput(
      versionId:
          _s.extractHeaderStringValue($result.headers, 'x-amz-version-id'),
    );
  }

  /// Creates or modifies the <code>PublicAccessBlock</code> configuration for
  /// an Amazon S3 bucket. To use this operation, you must have the
  /// <code>s3:PutBucketPublicAccessBlock</code> permission. For more
  /// information about Amazon S3 permissions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html">Specifying
  /// Permissions in a Policy</a>.
  /// <important>
  /// When Amazon S3 evaluates the <code>PublicAccessBlock</code> configuration
  /// for a bucket or an object, it checks the <code>PublicAccessBlock</code>
  /// configuration for both the bucket (or the bucket that contains the object)
  /// and the bucket owner's account. If the <code>PublicAccessBlock</code>
  /// configurations are different between the bucket and the account, Amazon S3
  /// uses the most restrictive combination of the bucket-level and
  /// account-level settings.
  /// </important>
  /// For more information about when Amazon S3 considers a bucket or an object
  /// public, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html#access-control-block-public-access-policy-status">The
  /// Meaning of "Public"</a>.
  /// <p class="title"> <b>Related Resources</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetPublicAccessBlock.html">GetPublicAccessBlock</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeletePublicAccessBlock.html">DeletePublicAccessBlock</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketPolicyStatus.html">GetBucketPolicyStatus</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html">Using
  /// Amazon S3 Block Public Access</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The name of the Amazon S3 bucket whose <code>PublicAccessBlock</code>
  /// configuration you want to set.
  ///
  /// Parameter [publicAccessBlockConfiguration] :
  /// The <code>PublicAccessBlock</code> configuration that you want to apply to
  /// this Amazon S3 bucket. You can enable the configuration options in any
  /// combination. For more information about when Amazon S3 considers a bucket
  /// or object public, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html#access-control-block-public-access-policy-status">The
  /// Meaning of "Public"</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// Parameter [contentMD5] :
  /// The MD5 hash of the <code>PutPublicAccessBlock</code> request body.
  ///
  /// For requests made using the AWS Command Line Interface (CLI) or AWS SDKs,
  /// this field is calculated automatically.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  Future<void> putPublicAccessBlock({
    @_s.required String bucket,
    @_s.required PublicAccessBlockConfiguration publicAccessBlockConfiguration,
    String contentMD5,
    String expectedBucketOwner,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    ArgumentError.checkNotNull(
        publicAccessBlockConfiguration, 'publicAccessBlockConfiguration');
    final headers = <String, String>{};
    contentMD5?.let((v) => headers['Content-MD5'] = v.toString());
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    await _protocol.send(
      method: 'PUT',
      requestUri: '/${Uri.encodeComponent(bucket)}?publicAccessBlock',
      headers: headers,
      payload: publicAccessBlockConfiguration
          .toXml('PublicAccessBlockConfiguration'),
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Restores an archived copy of an object back into Amazon S3
  ///
  /// This action is not supported by Amazon S3 on Outposts.
  ///
  /// This action performs the following types of requests:
  ///
  /// <ul>
  /// <li>
  /// <code>select</code> - Perform a select query on an archived object
  /// </li>
  /// <li>
  /// <code>restore an archive</code> - Restore an archived object
  /// </li>
  /// </ul>
  /// To use this operation, you must have permissions to perform the
  /// <code>s3:RestoreObject</code> action. The bucket owner has this permission
  /// by default and can grant this permission to others. For more information
  /// about permissions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources">Permissions
  /// Related to Bucket Subresource Operations</a> and <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">Managing
  /// Access Permissions to Your Amazon S3 Resources</a> in the <i>Amazon Simple
  /// Storage Service Developer Guide</i>.
  ///
  /// <b>Querying Archives with Select Requests</b>
  ///
  /// You use a select type of request to perform SQL queries on archived
  /// objects. The archived objects that are being queried by the select request
  /// must be formatted as uncompressed comma-separated values (CSV) files. You
  /// can run queries and custom analytics on your archived data without having
  /// to restore your data to a hotter Amazon S3 tier. For an overview about
  /// select requests, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/querying-glacier-archives.html">Querying
  /// Archived Objects</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// When making a select request, do the following:
  ///
  /// <ul>
  /// <li>
  /// Define an output location for the select query's output. This must be an
  /// Amazon S3 bucket in the same AWS Region as the bucket that contains the
  /// archive object that is being queried. The AWS account that initiates the
  /// job must have permissions to write to the S3 bucket. You can specify the
  /// storage class and encryption for the output objects stored in the bucket.
  /// For more information about output, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/querying-glacier-archives.html">Querying
  /// Archived Objects</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// For more information about the <code>S3</code> structure in the request
  /// body, see the following:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutObject.html">PutObject</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3_ACLs_UsingACLs.html">Managing
  /// Access with ACLs</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/serv-side-encryption.html">Protecting
  /// Data Using Server-Side Encryption</a> in the <i>Amazon Simple Storage
  /// Service Developer Guide</i>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Define the SQL expression for the <code>SELECT</code> type of restoration
  /// for your query in the request body's <code>SelectParameters</code>
  /// structure. You can use expressions like the following examples.
  ///
  /// <ul>
  /// <li>
  /// The following expression returns all records from the specified object.
  ///
  /// <code>SELECT * FROM Object</code>
  /// </li>
  /// <li>
  /// Assuming that you are not using any headers for data stored in the object,
  /// you can specify columns with positional headers.
  ///
  /// <code>SELECT s._1, s._2 FROM Object s WHERE s._3 &gt; 100</code>
  /// </li>
  /// <li>
  /// If you have headers and you set the <code>fileHeaderInfo</code> in the
  /// <code>CSV</code> structure in the request body to <code>USE</code>, you
  /// can specify headers in the query. (If you set the
  /// <code>fileHeaderInfo</code> field to <code>IGNORE</code>, the first row is
  /// skipped for the query.) You cannot mix ordinal positions with header
  /// column names.
  ///
  /// <code>SELECT s.Id, s.FirstName, s.SSN FROM S3Object s</code>
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// For more information about using SQL with S3 Glacier Select restore, see
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-glacier-select-sql-reference.html">SQL
  /// Reference for Amazon S3 Select and S3 Glacier Select</a> in the <i>Amazon
  /// Simple Storage Service Developer Guide</i>.
  ///
  /// When making a select request, you can also do the following:
  ///
  /// <ul>
  /// <li>
  /// To expedite your queries, specify the <code>Expedited</code> tier. For
  /// more information about tiers, see "Restoring Archives," later in this
  /// topic.
  /// </li>
  /// <li>
  /// Specify details about the data serialization format of both the input
  /// object that is being queried and the serialization of the CSV-encoded
  /// query results.
  /// </li>
  /// </ul>
  /// The following are additional important facts about the select feature:
  ///
  /// <ul>
  /// <li>
  /// The output results are new Amazon S3 objects. Unlike archive retrievals,
  /// they are stored until explicitly deleted-manually or through a lifecycle
  /// policy.
  /// </li>
  /// <li>
  /// You can issue more than one select request on the same Amazon S3 object.
  /// Amazon S3 doesn't deduplicate requests, so avoid issuing duplicate
  /// requests.
  /// </li>
  /// <li>
  /// Amazon S3 accepts a select request even if the object has already been
  /// restored. A select request doesn’t return error response <code>409</code>.
  /// </li>
  /// </ul>
  /// <b>Restoring objects</b>
  ///
  /// Objects that you archive to the S3 Glacier or S3 Glacier Deep Archive
  /// storage class, and S3 Intelligent-Tiering Archive or S3
  /// Intelligent-Tiering Deep Archive tiers are not accessible in real time.
  /// For objects in Archive Access or Deep Archive Access tiers you must first
  /// initiate a restore request, and then wait until the object is moved into
  /// the Frequent Access tier. For objects in S3 Glacier or S3 Glacier Deep
  /// Archive storage classes you must first initiate a restore request, and
  /// then wait until a temporary copy of the object is available. To access an
  /// archived object, you must restore the object for the duration (number of
  /// days) that you specify.
  ///
  /// To restore a specific object version, you can provide a version ID. If you
  /// don't provide a version ID, Amazon S3 restores the current version.
  ///
  /// When restoring an archived object (or using a select request), you can
  /// specify one of the following data access tier options in the
  /// <code>Tier</code> element of the request body:
  ///
  /// <ul>
  /// <li>
  /// <b> <code>Expedited</code> </b> - Expedited retrievals allow you to
  /// quickly access your data stored in the S3 Glacier storage class or S3
  /// Intelligent-Tiering Archive tier when occasional urgent requests for a
  /// subset of archives are required. For all but the largest archived objects
  /// (250 MB+), data accessed using Expedited retrievals is typically made
  /// available within 1–5 minutes. Provisioned capacity ensures that retrieval
  /// capacity for Expedited retrievals is available when you need it. Expedited
  /// retrievals and provisioned capacity are not available for objects stored
  /// in the S3 Glacier Deep Archive storage class or S3 Intelligent-Tiering
  /// Deep Archive tier.
  /// </li>
  /// <li>
  /// <b> <code>Standard</code> </b> - Standard retrievals allow you to access
  /// any of your archived objects within several hours. This is the default
  /// option for retrieval requests that do not specify the retrieval option.
  /// Standard retrievals typically finish within 3–5 hours for objects stored
  /// in the S3 Glacier storage class or S3 Intelligent-Tiering Archive tier.
  /// They typically finish within 12 hours for objects stored in the S3 Glacier
  /// Deep Archive storage class or S3 Intelligent-Tiering Deep Archive tier.
  /// Standard retrievals are free for objects stored in S3 Intelligent-Tiering.
  /// </li>
  /// <li>
  /// <b> <code>Bulk</code> </b> - Bulk retrievals are the lowest-cost retrieval
  /// option in S3 Glacier, enabling you to retrieve large amounts, even
  /// petabytes, of data inexpensively. Bulk retrievals typically finish within
  /// 5–12 hours for objects stored in the S3 Glacier storage class or S3
  /// Intelligent-Tiering Archive tier. They typically finish within 48 hours
  /// for objects stored in the S3 Glacier Deep Archive storage class or S3
  /// Intelligent-Tiering Deep Archive tier. Bulk retrievals are free for
  /// objects stored in S3 Intelligent-Tiering.
  /// </li>
  /// </ul>
  /// For more information about archive retrieval options and provisioned
  /// capacity for <code>Expedited</code> data access, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/restoring-objects.html">Restoring
  /// Archived Objects</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// You can use Amazon S3 restore speed upgrade to change the restore speed to
  /// a faster speed while it is in progress. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/restoring-objects.html#restoring-objects-upgrade-tier.title.html">
  /// Upgrading the speed of an in-progress restore</a> in the <i>Amazon Simple
  /// Storage Service Developer Guide</i>.
  ///
  /// To get the status of object restoration, you can send a <code>HEAD</code>
  /// request. Operations return the <code>x-amz-restore</code> header, which
  /// provides information about the restoration status, in the response. You
  /// can use Amazon S3 event notifications to notify you when a restore is
  /// initiated or completed. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html">Configuring
  /// Amazon S3 Event Notifications</a> in the <i>Amazon Simple Storage Service
  /// Developer Guide</i>.
  ///
  /// After restoring an archived object, you can update the restoration period
  /// by reissuing the request with a new period. Amazon S3 updates the
  /// restoration period relative to the current time and charges only for the
  /// request-there are no data transfer charges. You cannot update the
  /// restoration period when Amazon S3 is actively processing your current
  /// restore request for the object.
  ///
  /// If your bucket has a lifecycle configuration with a rule that includes an
  /// expiration action, the object expiration overrides the life span that you
  /// specify in a restore request. For example, if you restore an object copy
  /// for 10 days, but the object is scheduled to expire in 3 days, Amazon S3
  /// deletes the object in 3 days. For more information about lifecycle
  /// configuration, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketLifecycleConfiguration.html">PutBucketLifecycleConfiguration</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lifecycle-mgmt.html">Object
  /// Lifecycle Management</a> in <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// <b>Responses</b>
  ///
  /// A successful operation returns either the <code>200 OK</code> or <code>202
  /// Accepted</code> status code.
  ///
  /// <ul>
  /// <li>
  /// If the object is not previously restored, then Amazon S3 returns <code>202
  /// Accepted</code> in the response.
  /// </li>
  /// <li>
  /// If the object is previously restored, Amazon S3 returns <code>200
  /// OK</code> in the response.
  /// </li>
  /// </ul> <p class="title"> <b>Special Errors</b>
  ///
  /// <ul>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code: RestoreAlreadyInProgress</i>
  /// </li>
  /// <li>
  /// <i>Cause: Object restore is already in progress. (This error does not
  /// apply to SELECT type requests.)</i>
  /// </li>
  /// <li>
  /// <i>HTTP Status Code: 409 Conflict</i>
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix: Client</i>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code: GlacierExpeditedRetrievalNotAvailable</i>
  /// </li>
  /// <li>
  /// <i>Cause: expedited retrievals are currently not available. Try again
  /// later. (Returned if there is insufficient capacity to process the
  /// Expedited request. This error applies only to Expedited retrievals and not
  /// to S3 Standard or Bulk retrievals.)</i>
  /// </li>
  /// <li>
  /// <i>HTTP Status Code: 503</i>
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix: N/A</i>
  /// </li>
  /// </ul> </li>
  /// </ul> <p class="title"> <b>Related Resources</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketLifecycleConfiguration.html">PutBucketLifecycleConfiguration</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketNotificationConfiguration.html">GetBucketNotificationConfiguration</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-glacier-select-sql-reference.html">SQL
  /// Reference for Amazon S3 Select and S3 Glacier Select </a> in the <i>Amazon
  /// Simple Storage Service Developer Guide</i>
  /// </li>
  /// </ul>
  ///
  /// May throw [ObjectAlreadyInActiveTierError].
  ///
  /// Parameter [bucket] :
  /// The bucket name containing the object to restore.
  ///
  /// When using this API with an access point, you must direct requests to the
  /// access point hostname. The access point hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com.
  /// When using this operation with an access point through the AWS SDKs, you
  /// provide the access point ARN in place of the bucket name. For more
  /// information about access point ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using
  /// Access Points</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// When using this API with Amazon S3 on Outposts, you must direct requests
  /// to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com.
  /// When using this operation using S3 on Outposts through the AWS SDKs, you
  /// provide the Outposts bucket ARN in place of the bucket name. For more
  /// information about S3 on Outposts ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using
  /// S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// Parameter [key] :
  /// Object key for which the operation was initiated.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  ///
  /// Parameter [versionId] :
  /// VersionId used to reference a specific version of the object.
  Future<RestoreObjectOutput> restoreObject({
    @_s.required String bucket,
    @_s.required String key,
    String expectedBucketOwner,
    RequestPayer requestPayer,
    RestoreRequest restoreRequest,
    String versionId,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    ArgumentError.checkNotNull(key, 'key');
    _s.validateStringLength(
      'key',
      key,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    requestPayer?.let((v) => headers['x-amz-request-payer'] = v.toValue());
    final $query = <String, List<String>>{
      if (versionId != null) 'versionId': [versionId],
    };
    final $result = await _protocol.sendRaw(
      method: 'POST',
      requestUri:
          '/${Uri.encodeComponent(bucket)}/${key.split('/').map(Uri.encodeComponent).join('/')}?restore',
      queryParams: $query,
      headers: headers,
      payload: restoreRequest?.toXml('RestoreRequest'),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return RestoreObjectOutput(
      requestCharged: _s
          .extractHeaderStringValue($result.headers, 'x-amz-request-charged')
          ?.toRequestCharged(),
      restoreOutputPath: _s.extractHeaderStringValue(
          $result.headers, 'x-amz-restore-output-path'),
    );
  }

  /// This operation filters the contents of an Amazon S3 object based on a
  /// simple structured query language (SQL) statement. In the request, along
  /// with the SQL expression, you must also specify a data serialization format
  /// (JSON, CSV, or Apache Parquet) of the object. Amazon S3 uses this format
  /// to parse object data into records, and returns only records that match the
  /// specified SQL expression. You must also specify the data serialization
  /// format for the response.
  ///
  /// This action is not supported by Amazon S3 on Outposts.
  ///
  /// For more information about Amazon S3 Select, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/selecting-content-from-objects.html">Selecting
  /// Content from Objects</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// For more information about using SQL with Amazon S3 Select, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-glacier-select-sql-reference.html">
  /// SQL Reference for Amazon S3 Select and S3 Glacier Select</a> in the
  /// <i>Amazon Simple Storage Service Developer Guide</i>.
  /// <p/>
  /// <b>Permissions</b>
  ///
  /// You must have <code>s3:GetObject</code> permission for this
  /// operation. Amazon S3 Select does not support anonymous access. For more
  /// information about permissions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html">Specifying
  /// Permissions in a Policy</a> in the <i>Amazon Simple Storage Service
  /// Developer Guide</i>.
  /// <p/>
  /// <i>Object Data Formats</i>
  ///
  /// You can use Amazon S3 Select to query objects that have the following
  /// format properties:
  ///
  /// <ul>
  /// <li>
  /// <i>CSV, JSON, and Parquet</i> - Objects must be in CSV, JSON, or Parquet
  /// format.
  /// </li>
  /// <li>
  /// <i>UTF-8</i> - UTF-8 is the only encoding type Amazon S3 Select supports.
  /// </li>
  /// <li>
  /// <i>GZIP or BZIP2</i> - CSV and JSON files can be compressed using GZIP or
  /// BZIP2. GZIP and BZIP2 are the only compression formats that Amazon S3
  /// Select supports for CSV and JSON files. Amazon S3 Select supports columnar
  /// compression for Parquet using GZIP or Snappy. Amazon S3 Select does not
  /// support whole-object compression for Parquet objects.
  /// </li>
  /// <li>
  /// <i>Server-side encryption</i> - Amazon S3 Select supports querying objects
  /// that are protected with server-side encryption.
  ///
  /// For objects that are encrypted with customer-provided encryption keys
  /// (SSE-C), you must use HTTPS, and you must use the headers that are
  /// documented in the <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html">GetObject</a>.
  /// For more information about SSE-C, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/ServerSideEncryptionCustomerKeys.html">Server-Side
  /// Encryption (Using Customer-Provided Encryption Keys)</a> in the <i>Amazon
  /// Simple Storage Service Developer Guide</i>.
  ///
  /// For objects that are encrypted with Amazon S3 managed encryption keys
  /// (SSE-S3) and customer master keys (CMKs) stored in AWS Key Management
  /// Service (SSE-KMS), server-side encryption is handled transparently, so you
  /// don't need to specify anything. For more information about server-side
  /// encryption, including SSE-S3 and SSE-KMS, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/serv-side-encryption.html">Protecting
  /// Data Using Server-Side Encryption</a> in the <i>Amazon Simple Storage
  /// Service Developer Guide</i>.
  /// </li>
  /// </ul>
  /// <b>Working with the Response Body</b>
  ///
  /// Given the response size is unknown, Amazon S3 Select streams the response
  /// as a series of messages and includes a <code>Transfer-Encoding</code>
  /// header with <code>chunked</code> as its value in the response. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTSelectObjectAppendix.html">Appendix:
  /// SelectObjectContent Response</a> .
  /// <p/>
  /// <b>GetObject Support</b>
  ///
  /// The <code>SelectObjectContent</code> operation does not support the
  /// following <code>GetObject</code> functionality. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html">GetObject</a>.
  ///
  /// <ul>
  /// <li>
  /// <code>Range</code>: Although you can specify a scan range for an Amazon S3
  /// Select request (see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_SelectObjectContent.html#AmazonS3-SelectObjectContent-request-ScanRange">SelectObjectContentRequest
  /// - ScanRange</a> in the request parameters), you cannot specify the range
  /// of bytes of an object to return.
  /// </li>
  /// <li>
  /// GLACIER, DEEP_ARCHIVE and REDUCED_REDUNDANCY storage classes: You cannot
  /// specify the GLACIER, DEEP_ARCHIVE, or <code>REDUCED_REDUNDANCY</code>
  /// storage classes. For more information, about storage classes see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html#storage-class-intro">Storage
  /// Classes</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.
  /// </li>
  /// </ul> <p/>
  /// <b>Special Errors</b>
  ///
  /// For a list of special errors for this operation, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/ErrorResponses.html#SelectObjectContentErrorCodeList">List
  /// of SELECT Object Content Error Codes</a>
  /// <p class="title"> <b>Related Resources</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html">GetObject</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketLifecycleConfiguration.html">GetBucketLifecycleConfiguration</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketLifecycleConfiguration.html">PutBucketLifecycleConfiguration</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The S3 bucket.
  ///
  /// Parameter [expression] :
  /// The expression that is used to query the object.
  ///
  /// Parameter [expressionType] :
  /// The type of the provided expression (for example, SQL).
  ///
  /// Parameter [inputSerialization] :
  /// Describes the format of the data in the object that is being queried.
  ///
  /// Parameter [key] :
  /// The object key.
  ///
  /// Parameter [outputSerialization] :
  /// Describes the format of the data that you want Amazon S3 to return in
  /// response.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  ///
  /// Parameter [requestProgress] :
  /// Specifies if periodic request progress information should be enabled.
  ///
  /// Parameter [sSECustomerAlgorithm] :
  /// The SSE Algorithm used to encrypt the object. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/ServerSideEncryptionCustomerKeys.html">Server-Side
  /// Encryption (Using Customer-Provided Encryption Keys</a>.
  ///
  /// Parameter [sSECustomerKey] :
  /// The SSE Customer Key. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/ServerSideEncryptionCustomerKeys.html">Server-Side
  /// Encryption (Using Customer-Provided Encryption Keys</a>.
  ///
  /// Parameter [sSECustomerKeyMD5] :
  /// The SSE Customer Key MD5. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/ServerSideEncryptionCustomerKeys.html">Server-Side
  /// Encryption (Using Customer-Provided Encryption Keys</a>.
  ///
  /// Parameter [scanRange] :
  /// Specifies the byte range of the object to get the records from. A record
  /// is processed when its first byte is contained by the range. This parameter
  /// is optional, but when specified, it must not be empty. See RFC 2616,
  /// Section 14.35.1 about how to specify the start and end of the range.
  ///
  /// <code>ScanRange</code>may be used in the following ways:
  ///
  /// <ul>
  /// <li>
  /// <code>&lt;scanrange&gt;&lt;start&gt;50&lt;/start&gt;&lt;end&gt;100&lt;/end&gt;&lt;/scanrange&gt;</code>
  /// - process only the records starting between the bytes 50 and 100
  /// (inclusive, counting from zero)
  /// </li>
  /// <li>
  /// <code>&lt;scanrange&gt;&lt;start&gt;50&lt;/start&gt;&lt;/scanrange&gt;</code>
  /// - process only the records starting after the byte 50
  /// </li>
  /// <li>
  /// <code>&lt;scanrange&gt;&lt;end&gt;50&lt;/end&gt;&lt;/scanrange&gt;</code>
  /// - process only the records within the last 50 bytes of the file.
  /// </li>
  /// </ul>
  Future<SelectObjectContentOutput> selectObjectContent({
    @_s.required String bucket,
    @_s.required String expression,
    @_s.required ExpressionType expressionType,
    @_s.required InputSerialization inputSerialization,
    @_s.required String key,
    @_s.required OutputSerialization outputSerialization,
    String expectedBucketOwner,
    RequestProgress requestProgress,
    String sSECustomerAlgorithm,
    Uint8List sSECustomerKey,
    String sSECustomerKeyMD5,
    ScanRange scanRange,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    ArgumentError.checkNotNull(expression, 'expression');
    ArgumentError.checkNotNull(expressionType, 'expressionType');
    ArgumentError.checkNotNull(inputSerialization, 'inputSerialization');
    ArgumentError.checkNotNull(key, 'key');
    _s.validateStringLength(
      'key',
      key,
      1,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(outputSerialization, 'outputSerialization');
    final headers = <String, String>{};
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    sSECustomerAlgorithm?.let((v) =>
        headers['x-amz-server-side-encryption-customer-algorithm'] =
            v.toString());
    sSECustomerKey?.let((v) =>
        headers['x-amz-server-side-encryption-customer-key'] = v.toString());
    sSECustomerKeyMD5?.let((v) =>
        headers['x-amz-server-side-encryption-customer-key-MD5'] =
            v.toString());
    final $result = await _protocol.sendRaw(
      method: 'POST',
      requestUri:
          '/${Uri.encodeComponent(bucket)}/${key.split('/').map(Uri.encodeComponent).join('/')}?select&select-type=2',
      headers: headers,
      payload: SelectObjectContentRequest(
              bucket: bucket,
              expression: expression,
              expressionType: expressionType,
              inputSerialization: inputSerialization,
              key: key,
              outputSerialization: outputSerialization,
              expectedBucketOwner: expectedBucketOwner,
              requestProgress: requestProgress,
              sSECustomerAlgorithm: sSECustomerAlgorithm,
              sSECustomerKey: sSECustomerKey,
              sSECustomerKeyMD5: sSECustomerKeyMD5,
              scanRange: scanRange)
          .toXml(
        'SelectObjectContentRequest',
        attributes: [
          _s.XmlAttribute(
              _s.XmlName('xmlns'), 'http://s3.amazonaws.com/doc/2006-03-01/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return SelectObjectContentOutput(
      payload: SelectObjectContentEventStream.fromXml($elem),
    );
  }

  /// Uploads a part in a multipart upload.
  /// <note>
  /// In this operation, you provide part data in your request. However, you
  /// have an option to specify your existing Amazon S3 object as a data source
  /// for the part you are uploading. To upload a part from an existing object,
  /// you use the <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPartCopy.html">UploadPartCopy</a>
  /// operation.
  /// </note>
  /// You must initiate a multipart upload (see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateMultipartUpload.html">CreateMultipartUpload</a>)
  /// before you can upload any part. In response to your initiate request,
  /// Amazon S3 returns an upload ID, a unique identifier, that you must include
  /// in your upload part request.
  ///
  /// Part numbers can be any number from 1 to 10,000, inclusive. A part number
  /// uniquely identifies a part and also defines its position within the object
  /// being created. If you upload a new part using the same part number that
  /// was used with a previous part, the previously uploaded part is
  /// overwritten. Each part must be at least 5 MB in size, except the last
  /// part. There is no size limit on the last part of your multipart upload.
  ///
  /// To ensure that data is not corrupted when traversing the network, specify
  /// the <code>Content-MD5</code> header in the upload part request. Amazon S3
  /// checks the part data against the provided MD5 value. If they do not match,
  /// Amazon S3 returns an error.
  ///
  /// If the upload request is signed with Signature Version 4, then AWS S3 uses
  /// the <code>x-amz-content-sha256</code> header as a checksum instead of
  /// <code>Content-MD5</code>. For more information see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/sigv4-auth-using-authorization-header.html">Authenticating
  /// Requests: Using the Authorization Header (AWS Signature Version 4)</a>.
  ///
  /// <b>Note:</b> After you initiate multipart upload and upload one or more
  /// parts, you must either complete or abort multipart upload in order to stop
  /// getting charged for storage of the uploaded parts. Only after you either
  /// complete or abort multipart upload, Amazon S3 frees up the parts storage
  /// and stops charging you for the parts storage.
  ///
  /// For more information on multipart uploads, go to <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuoverview.html">Multipart
  /// Upload Overview</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide </i>.
  ///
  /// For information on the permissions required to use the multipart upload
  /// API, go to <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuAndPermissions.html">Multipart
  /// Upload API and Permissions</a> in the <i>Amazon Simple Storage Service
  /// Developer Guide</i>.
  ///
  /// You can optionally request server-side encryption where Amazon S3 encrypts
  /// your data as it writes it to disks in its data centers and decrypts it for
  /// you when you access it. You have the option of providing your own
  /// encryption key, or you can use the AWS managed encryption keys. If you
  /// choose to provide your own encryption key, the request headers you provide
  /// in the request must match the headers you used in the request to initiate
  /// the upload by using <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateMultipartUpload.html">CreateMultipartUpload</a>.
  /// For more information, go to <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingServerSideEncryption.html">Using
  /// Server-Side Encryption</a> in the <i>Amazon Simple Storage Service
  /// Developer Guide</i>.
  ///
  /// Server-side encryption is supported by the S3 Multipart Upload actions.
  /// Unless you are using a customer-provided encryption key, you don't need to
  /// specify the encryption parameters in each UploadPart request. Instead, you
  /// only need to specify the server-side encryption parameters in the initial
  /// Initiate Multipart request. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateMultipartUpload.html">CreateMultipartUpload</a>.
  ///
  /// If you requested server-side encryption using a customer-provided
  /// encryption key in your initiate multipart upload request, you must provide
  /// identical encryption information in each part upload using the following
  /// headers.
  ///
  /// <ul>
  /// <li>
  /// x-amz-server-side-encryption-customer-algorithm
  /// </li>
  /// <li>
  /// x-amz-server-side-encryption-customer-key
  /// </li>
  /// <li>
  /// x-amz-server-side-encryption-customer-key-MD5
  /// </li>
  /// </ul> <p class="title"> <b>Special Errors</b>
  ///
  /// <ul>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code: NoSuchUpload</i>
  /// </li>
  /// <li>
  /// <i>Cause: The specified multipart upload does not exist. The upload ID
  /// might be invalid, or the multipart upload might have been aborted or
  /// completed.</i>
  /// </li>
  /// <li>
  /// <i> HTTP Status Code: 404 Not Found </i>
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix: Client</i>
  /// </li>
  /// </ul> </li>
  /// </ul> <p class="title"> <b>Related Resources</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateMultipartUpload.html">CreateMultipartUpload</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CompleteMultipartUpload.html">CompleteMultipartUpload</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_AbortMultipartUpload.html">AbortMultipartUpload</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListParts.html">ListParts</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListMultipartUploads.html">ListMultipartUploads</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The name of the bucket to which the multipart upload was initiated.
  ///
  /// When using this API with an access point, you must direct requests to the
  /// access point hostname. The access point hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com.
  /// When using this operation with an access point through the AWS SDKs, you
  /// provide the access point ARN in place of the bucket name. For more
  /// information about access point ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using
  /// Access Points</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// When using this API with Amazon S3 on Outposts, you must direct requests
  /// to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com.
  /// When using this operation using S3 on Outposts through the AWS SDKs, you
  /// provide the Outposts bucket ARN in place of the bucket name. For more
  /// information about S3 on Outposts ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using
  /// S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// Parameter [key] :
  /// Object key for which the multipart upload was initiated.
  ///
  /// Parameter [partNumber] :
  /// Part number of part being uploaded. This is a positive integer between 1
  /// and 10,000.
  ///
  /// Parameter [uploadId] :
  /// Upload ID identifying the multipart upload whose part is being uploaded.
  ///
  /// Parameter [body] :
  /// Object data.
  ///
  /// Parameter [contentLength] :
  /// Size of the body in bytes. This parameter is useful when the size of the
  /// body cannot be determined automatically.
  ///
  /// Parameter [contentMD5] :
  /// The base64-encoded 128-bit MD5 digest of the part data. This parameter is
  /// auto-populated when using the command from the CLI. This parameter is
  /// required if object lock parameters are specified.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  ///
  /// Parameter [sSECustomerAlgorithm] :
  /// Specifies the algorithm to use to when encrypting the object (for example,
  /// AES256).
  ///
  /// Parameter [sSECustomerKey] :
  /// Specifies the customer-provided encryption key for Amazon S3 to use in
  /// encrypting data. This value is used to store the object and then it is
  /// discarded; Amazon S3 does not store the encryption key. The key must be
  /// appropriate for use with the algorithm specified in the
  /// <code>x-amz-server-side-encryption-customer-algorithm header</code>. This
  /// must be the same encryption key specified in the initiate multipart upload
  /// request.
  ///
  /// Parameter [sSECustomerKeyMD5] :
  /// Specifies the 128-bit MD5 digest of the encryption key according to RFC
  /// 1321. Amazon S3 uses this header for a message integrity check to ensure
  /// that the encryption key was transmitted without error.
  Future<UploadPartOutput> uploadPart({
    @_s.required String bucket,
    @_s.required String key,
    @_s.required int partNumber,
    @_s.required String uploadId,
    Uint8List body,
    int contentLength,
    String contentMD5,
    String expectedBucketOwner,
    RequestPayer requestPayer,
    String sSECustomerAlgorithm,
    Uint8List sSECustomerKey,
    String sSECustomerKeyMD5,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    ArgumentError.checkNotNull(key, 'key');
    _s.validateStringLength(
      'key',
      key,
      1,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(partNumber, 'partNumber');
    ArgumentError.checkNotNull(uploadId, 'uploadId');
    final headers = <String, String>{};
    contentLength?.let((v) => headers['Content-Length'] = v.toString());
    contentMD5?.let((v) => headers['Content-MD5'] = v.toString());
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    requestPayer?.let((v) => headers['x-amz-request-payer'] = v.toValue());
    sSECustomerAlgorithm?.let((v) =>
        headers['x-amz-server-side-encryption-customer-algorithm'] =
            v.toString());
    sSECustomerKey?.let((v) =>
        headers['x-amz-server-side-encryption-customer-key'] = v.toString());
    sSECustomerKeyMD5?.let((v) =>
        headers['x-amz-server-side-encryption-customer-key-MD5'] =
            v.toString());
    final $query = <String, List<String>>{
      if (partNumber != null) 'partNumber': [partNumber.toString()],
      if (uploadId != null) 'uploadId': [uploadId],
    };
    final $result = await _protocol.sendRaw(
      method: 'PUT',
      requestUri:
          '/${Uri.encodeComponent(bucket)}/${key.split('/').map(Uri.encodeComponent).join('/')}',
      queryParams: $query,
      headers: headers,
      payload: body,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return UploadPartOutput(
      bucketKeyEnabled: _s.extractHeaderBoolValue(
          $result.headers, 'x-amz-server-side-encryption-bucket-key-enabled'),
      eTag: _s.extractHeaderStringValue($result.headers, 'ETag'),
      requestCharged: _s
          .extractHeaderStringValue($result.headers, 'x-amz-request-charged')
          ?.toRequestCharged(),
      sSECustomerAlgorithm: _s.extractHeaderStringValue(
          $result.headers, 'x-amz-server-side-encryption-customer-algorithm'),
      sSECustomerKeyMD5: _s.extractHeaderStringValue(
          $result.headers, 'x-amz-server-side-encryption-customer-key-MD5'),
      sSEKMSKeyId: _s.extractHeaderStringValue(
          $result.headers, 'x-amz-server-side-encryption-aws-kms-key-id'),
      serverSideEncryption: _s
          .extractHeaderStringValue(
              $result.headers, 'x-amz-server-side-encryption')
          ?.toServerSideEncryption(),
    );
  }

  /// Uploads a part by copying data from an existing object as data source. You
  /// specify the data source by adding the request header
  /// <code>x-amz-copy-source</code> in your request and a byte range by adding
  /// the request header <code>x-amz-copy-source-range</code> in your request.
  ///
  /// The minimum allowable part size for a multipart upload is 5 MB. For more
  /// information about multipart upload limits, go to <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/qfacts.html">Quick
  /// Facts</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.
  /// <note>
  /// Instead of using an existing object as part data, you might use the <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPart.html">UploadPart</a>
  /// operation and provide data in your request.
  /// </note>
  /// You must initiate a multipart upload before you can upload any part. In
  /// response to your initiate request. Amazon S3 returns a unique identifier,
  /// the upload ID, that you must include in your upload part request.
  ///
  /// For more information about using the <code>UploadPartCopy</code>
  /// operation, see the following:
  ///
  /// <ul>
  /// <li>
  /// For conceptual information about multipart uploads, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/uploadobjusingmpu.html">Uploading
  /// Objects Using Multipart Upload</a> in the <i>Amazon Simple Storage Service
  /// Developer Guide</i>.
  /// </li>
  /// <li>
  /// For information about permissions required to use the multipart upload
  /// API, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuAndPermissions.html">Multipart
  /// Upload API and Permissions</a> in the <i>Amazon Simple Storage Service
  /// Developer Guide</i>.
  /// </li>
  /// <li>
  /// For information about copying objects using a single atomic operation vs.
  /// the multipart upload, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectOperations.html">Operations
  /// on Objects</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  /// </li>
  /// <li>
  /// For information about using server-side encryption with customer-provided
  /// encryption keys with the UploadPartCopy operation, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CopyObject.html">CopyObject</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPart.html">UploadPart</a>.
  /// </li>
  /// </ul>
  /// Note the following additional considerations about the request headers
  /// <code>x-amz-copy-source-if-match</code>,
  /// <code>x-amz-copy-source-if-none-match</code>,
  /// <code>x-amz-copy-source-if-unmodified-since</code>, and
  /// <code>x-amz-copy-source-if-modified-since</code>:
  ///
  ///
  ///
  /// <ul>
  /// <li>
  /// <b>Consideration 1</b> - If both of the
  /// <code>x-amz-copy-source-if-match</code> and
  /// <code>x-amz-copy-source-if-unmodified-since</code> headers are present in
  /// the request as follows:
  ///
  /// <code>x-amz-copy-source-if-match</code> condition evaluates to
  /// <code>true</code>, and;
  ///
  /// <code>x-amz-copy-source-if-unmodified-since</code> condition evaluates to
  /// <code>false</code>;
  ///
  /// Amazon S3 returns <code>200 OK</code> and copies the data.
  /// </li>
  /// <li>
  /// <b>Consideration 2</b> - If both of the
  /// <code>x-amz-copy-source-if-none-match</code> and
  /// <code>x-amz-copy-source-if-modified-since</code> headers are present in
  /// the request as follows:
  ///
  /// <code>x-amz-copy-source-if-none-match</code> condition evaluates to
  /// <code>false</code>, and;
  ///
  /// <code>x-amz-copy-source-if-modified-since</code> condition evaluates to
  /// <code>true</code>;
  ///
  /// Amazon S3 returns <code>412 Precondition Failed</code> response code.
  /// </li>
  /// </ul>
  /// <b>Versioning</b>
  ///
  /// If your bucket has versioning enabled, you could have multiple versions of
  /// the same object. By default, <code>x-amz-copy-source</code> identifies the
  /// current version of the object to copy. If the current version is a delete
  /// marker and you don't specify a versionId in the
  /// <code>x-amz-copy-source</code>, Amazon S3 returns a 404 error, because the
  /// object does not exist. If you specify versionId in the
  /// <code>x-amz-copy-source</code> and the versionId is a delete marker,
  /// Amazon S3 returns an HTTP 400 error, because you are not allowed to
  /// specify a delete marker as a version for the
  /// <code>x-amz-copy-source</code>.
  ///
  /// You can optionally specify a specific version of the source object to copy
  /// by adding the <code>versionId</code> subresource as shown in the following
  /// example:
  ///
  /// <code>x-amz-copy-source: /bucket/object?versionId=version id</code>
  /// <p class="title"> <b>Special Errors</b>
  ///
  /// <ul>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code: NoSuchUpload</i>
  /// </li>
  /// <li>
  /// <i>Cause: The specified multipart upload does not exist. The upload ID
  /// might be invalid, or the multipart upload might have been aborted or
  /// completed.</i>
  /// </li>
  /// <li>
  /// <i>HTTP Status Code: 404 Not Found</i>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code: InvalidRequest</i>
  /// </li>
  /// <li>
  /// <i>Cause: The specified copy source is not supported as a byte-range copy
  /// source.</i>
  /// </li>
  /// <li>
  /// <i>HTTP Status Code: 400 Bad Request</i>
  /// </li>
  /// </ul> </li>
  /// </ul> <p class="title"> <b>Related Resources</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateMultipartUpload.html">CreateMultipartUpload</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPart.html">UploadPart</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_CompleteMultipartUpload.html">CompleteMultipartUpload</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_AbortMultipartUpload.html">AbortMultipartUpload</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListParts.html">ListParts</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListMultipartUploads.html">ListMultipartUploads</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucket] :
  /// The bucket name.
  ///
  /// When using this API with an access point, you must direct requests to the
  /// access point hostname. The access point hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com.
  /// When using this operation with an access point through the AWS SDKs, you
  /// provide the access point ARN in place of the bucket name. For more
  /// information about access point ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using
  /// Access Points</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// When using this API with Amazon S3 on Outposts, you must direct requests
  /// to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com.
  /// When using this operation using S3 on Outposts through the AWS SDKs, you
  /// provide the Outposts bucket ARN in place of the bucket name. For more
  /// information about S3 on Outposts ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using
  /// S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// Parameter [copySource] :
  /// Specifies the source object for the copy operation. You specify the value
  /// in one of two formats, depending on whether you want to access the source
  /// object through an <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-points.html">access
  /// point</a>:
  ///
  /// <ul>
  /// <li>
  /// For objects not accessed through an access point, specify the name of the
  /// source bucket and key of the source object, separated by a slash (/). For
  /// example, to copy the object <code>reports/january.pdf</code> from the
  /// bucket <code>awsexamplebucket</code>, use
  /// <code>awsexamplebucket/reports/january.pdf</code>. The value must be URL
  /// encoded.
  /// </li>
  /// <li>
  /// For objects accessed through access points, specify the Amazon Resource
  /// Name (ARN) of the object as accessed through the access point, in the
  /// format
  /// <code>arn:aws:s3:&lt;Region&gt;:&lt;account-id&gt;:accesspoint/&lt;access-point-name&gt;/object/&lt;key&gt;</code>.
  /// For example, to copy the object <code>reports/january.pdf</code> through
  /// access point <code>my-access-point</code> owned by account
  /// <code>123456789012</code> in Region <code>us-west-2</code>, use the URL
  /// encoding of
  /// <code>arn:aws:s3:us-west-2:123456789012:accesspoint/my-access-point/object/reports/january.pdf</code>.
  /// The value must be URL encoded.
  /// <note>
  /// Amazon S3 supports copy operations using access points only when the
  /// source and destination buckets are in the same AWS Region.
  /// </note>
  /// Alternatively, for objects accessed through Amazon S3 on Outposts, specify
  /// the ARN of the object as accessed in the format
  /// <code>arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/object/&lt;key&gt;</code>.
  /// For example, to copy the object <code>reports/january.pdf</code> through
  /// outpost <code>my-outpost</code> owned by account <code>123456789012</code>
  /// in Region <code>us-west-2</code>, use the URL encoding of
  /// <code>arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/object/reports/january.pdf</code>.
  /// The value must be URL encoded.
  /// </li>
  /// </ul>
  /// To copy a specific version of an object, append
  /// <code>?versionId=&lt;version-id&gt;</code> to the value (for example,
  /// <code>awsexamplebucket/reports/january.pdf?versionId=QUpfdndhfd8438MNFDN93jdnJFkdmqnh893</code>).
  /// If you don't specify a version ID, Amazon S3 copies the latest version of
  /// the source object.
  ///
  /// Parameter [key] :
  /// Object key for which the multipart upload was initiated.
  ///
  /// Parameter [partNumber] :
  /// Part number of part being copied. This is a positive integer between 1 and
  /// 10,000.
  ///
  /// Parameter [uploadId] :
  /// Upload ID identifying the multipart upload whose part is being copied.
  ///
  /// Parameter [copySourceIfMatch] :
  /// Copies the object if its entity tag (ETag) matches the specified tag.
  ///
  /// Parameter [copySourceIfModifiedSince] :
  /// Copies the object if it has been modified since the specified time.
  ///
  /// Parameter [copySourceIfNoneMatch] :
  /// Copies the object if its entity tag (ETag) is different than the specified
  /// ETag.
  ///
  /// Parameter [copySourceIfUnmodifiedSince] :
  /// Copies the object if it hasn't been modified since the specified time.
  ///
  /// Parameter [copySourceRange] :
  /// The range of bytes to copy from the source object. The range value must
  /// use the form bytes=first-last, where the first and last are the zero-based
  /// byte offsets to copy. For example, bytes=0-9 indicates that you want to
  /// copy the first 10 bytes of the source. You can copy a range only if the
  /// source object is greater than 5 MB.
  ///
  /// Parameter [copySourceSSECustomerAlgorithm] :
  /// Specifies the algorithm to use when decrypting the source object (for
  /// example, AES256).
  ///
  /// Parameter [copySourceSSECustomerKey] :
  /// Specifies the customer-provided encryption key for Amazon S3 to use to
  /// decrypt the source object. The encryption key provided in this header must
  /// be one that was used when the source object was created.
  ///
  /// Parameter [copySourceSSECustomerKeyMD5] :
  /// Specifies the 128-bit MD5 digest of the encryption key according to RFC
  /// 1321. Amazon S3 uses this header for a message integrity check to ensure
  /// that the encryption key was transmitted without error.
  ///
  /// Parameter [expectedBucketOwner] :
  /// The account id of the expected destination bucket owner. If the
  /// destination bucket is owned by a different account, the request will fail
  /// with an HTTP <code>403 (Access Denied)</code> error.
  ///
  /// Parameter [expectedSourceBucketOwner] :
  /// The account id of the expected source bucket owner. If the source bucket
  /// is owned by a different account, the request will fail with an HTTP
  /// <code>403 (Access Denied)</code> error.
  ///
  /// Parameter [sSECustomerAlgorithm] :
  /// Specifies the algorithm to use to when encrypting the object (for example,
  /// AES256).
  ///
  /// Parameter [sSECustomerKey] :
  /// Specifies the customer-provided encryption key for Amazon S3 to use in
  /// encrypting data. This value is used to store the object and then it is
  /// discarded; Amazon S3 does not store the encryption key. The key must be
  /// appropriate for use with the algorithm specified in the
  /// <code>x-amz-server-side-encryption-customer-algorithm</code> header. This
  /// must be the same encryption key specified in the initiate multipart upload
  /// request.
  ///
  /// Parameter [sSECustomerKeyMD5] :
  /// Specifies the 128-bit MD5 digest of the encryption key according to RFC
  /// 1321. Amazon S3 uses this header for a message integrity check to ensure
  /// that the encryption key was transmitted without error.
  Future<UploadPartCopyOutput> uploadPartCopy({
    @_s.required String bucket,
    @_s.required String copySource,
    @_s.required String key,
    @_s.required int partNumber,
    @_s.required String uploadId,
    String copySourceIfMatch,
    DateTime copySourceIfModifiedSince,
    String copySourceIfNoneMatch,
    DateTime copySourceIfUnmodifiedSince,
    String copySourceRange,
    String copySourceSSECustomerAlgorithm,
    Uint8List copySourceSSECustomerKey,
    String copySourceSSECustomerKeyMD5,
    String expectedBucketOwner,
    String expectedSourceBucketOwner,
    RequestPayer requestPayer,
    String sSECustomerAlgorithm,
    Uint8List sSECustomerKey,
    String sSECustomerKeyMD5,
  }) async {
    ArgumentError.checkNotNull(bucket, 'bucket');
    ArgumentError.checkNotNull(copySource, 'copySource');
    _s.validateStringPattern(
      'copySource',
      copySource,
      r'''\/.+\/.+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(key, 'key');
    _s.validateStringLength(
      'key',
      key,
      1,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(partNumber, 'partNumber');
    ArgumentError.checkNotNull(uploadId, 'uploadId');
    final headers = <String, String>{};
    copySource?.let((v) => headers['x-amz-copy-source'] = v.toString());
    copySourceIfMatch
        ?.let((v) => headers['x-amz-copy-source-if-match'] = v.toString());
    copySourceIfModifiedSince?.let((v) =>
        headers['x-amz-copy-source-if-modified-since'] = _s.rfc822ToJson(v));
    copySourceIfNoneMatch
        ?.let((v) => headers['x-amz-copy-source-if-none-match'] = v.toString());
    copySourceIfUnmodifiedSince?.let((v) =>
        headers['x-amz-copy-source-if-unmodified-since'] = _s.rfc822ToJson(v));
    copySourceRange
        ?.let((v) => headers['x-amz-copy-source-range'] = v.toString());
    copySourceSSECustomerAlgorithm?.let((v) =>
        headers['x-amz-copy-source-server-side-encryption-customer-algorithm'] =
            v.toString());
    copySourceSSECustomerKey?.let((v) =>
        headers['x-amz-copy-source-server-side-encryption-customer-key'] =
            v.toString());
    copySourceSSECustomerKeyMD5?.let((v) =>
        headers['x-amz-copy-source-server-side-encryption-customer-key-MD5'] =
            v.toString());
    expectedBucketOwner
        ?.let((v) => headers['x-amz-expected-bucket-owner'] = v.toString());
    expectedSourceBucketOwner?.let(
        (v) => headers['x-amz-source-expected-bucket-owner'] = v.toString());
    requestPayer?.let((v) => headers['x-amz-request-payer'] = v.toValue());
    sSECustomerAlgorithm?.let((v) =>
        headers['x-amz-server-side-encryption-customer-algorithm'] =
            v.toString());
    sSECustomerKey?.let((v) =>
        headers['x-amz-server-side-encryption-customer-key'] = v.toString());
    sSECustomerKeyMD5?.let((v) =>
        headers['x-amz-server-side-encryption-customer-key-MD5'] =
            v.toString());
    final $query = <String, List<String>>{
      if (partNumber != null) 'partNumber': [partNumber.toString()],
      if (uploadId != null) 'uploadId': [uploadId],
    };
    final $result = await _protocol.sendRaw(
      method: 'PUT',
      requestUri:
          '/${Uri.encodeComponent(bucket)}/${key.split('/').map(Uri.encodeComponent).join('/')}',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return UploadPartCopyOutput(
      copyPartResult: CopyPartResult.fromXml($elem),
      bucketKeyEnabled: _s.extractHeaderBoolValue(
          $result.headers, 'x-amz-server-side-encryption-bucket-key-enabled'),
      copySourceVersionId: _s.extractHeaderStringValue(
          $result.headers, 'x-amz-copy-source-version-id'),
      requestCharged: _s
          .extractHeaderStringValue($result.headers, 'x-amz-request-charged')
          ?.toRequestCharged(),
      sSECustomerAlgorithm: _s.extractHeaderStringValue(
          $result.headers, 'x-amz-server-side-encryption-customer-algorithm'),
      sSECustomerKeyMD5: _s.extractHeaderStringValue(
          $result.headers, 'x-amz-server-side-encryption-customer-key-MD5'),
      sSEKMSKeyId: _s.extractHeaderStringValue(
          $result.headers, 'x-amz-server-side-encryption-aws-kms-key-id'),
      serverSideEncryption: _s
          .extractHeaderStringValue(
              $result.headers, 'x-amz-server-side-encryption')
          ?.toServerSideEncryption(),
    );
  }
}

/// Specifies the days since the initiation of an incomplete multipart upload
/// that Amazon S3 will wait before permanently removing all parts of the
/// upload. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuoverview.html#mpu-abort-incomplete-mpu-lifecycle-config">
/// Aborting Incomplete Multipart Uploads Using a Bucket Lifecycle Policy</a> in
/// the <i>Amazon Simple Storage Service Developer Guide</i>.
class AbortIncompleteMultipartUpload {
  /// Specifies the number of days after which Amazon S3 aborts an incomplete
  /// multipart upload.
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

class AbortMultipartUploadOutput {
  final RequestCharged requestCharged;

  AbortMultipartUploadOutput({
    this.requestCharged,
  });
}

/// Configures the transfer acceleration state for an Amazon S3 bucket. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/transfer-acceleration.html">Amazon
/// S3 Transfer Acceleration</a> in the <i>Amazon Simple Storage Service
/// Developer Guide</i>.
class AccelerateConfiguration {
  /// Specifies the transfer acceleration status of the bucket.
  final BucketAccelerateStatus status;

  AccelerateConfiguration({
    this.status,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (status != null) _s.encodeXmlStringValue('Status', status.toValue()),
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

/// Contains the elements that set the ACL permissions for an object per
/// grantee.
class AccessControlPolicy {
  /// A list of grants.
  final List<Grant> grants;

  /// Container for the bucket owner's display name and ID.
  final Owner owner;

  AccessControlPolicy({
    this.grants,
    this.owner,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (grants != null)
        _s.XmlElement(_s.XmlName('AccessControlList'), [],
            grants.map((e) => e?.toXml('Grant'))),
      if (owner != null) owner?.toXml('Owner'),
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

/// A container for information about access control for replicas.
class AccessControlTranslation {
  /// Specifies the replica ownership. For default and valid values, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTBucketPUTreplication.html">PUT
  /// bucket replication</a> in the <i>Amazon Simple Storage Service API
  /// Reference</i>.
  final OwnerOverride owner;

  AccessControlTranslation({
    @_s.required this.owner,
  });
  factory AccessControlTranslation.fromXml(_s.XmlElement elem) {
    return AccessControlTranslation(
      owner: _s.extractXmlStringValue(elem, 'Owner')?.toOwnerOverride(),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Owner', owner?.toValue() ?? ''),
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

/// A conjunction (logical AND) of predicates, which is used in evaluating a
/// metrics filter. The operator must have at least two predicates in any
/// combination, and an object must match all of the predicates for the filter
/// to apply.
class AnalyticsAndOperator {
  /// The prefix to use when evaluating an AND predicate: The prefix that an
  /// object must have to be included in the metrics results.
  final String prefix;

  /// The list of tags to use when evaluating an AND predicate.
  final List<Tag> tags;

  AnalyticsAndOperator({
    this.prefix,
    this.tags,
  });
  factory AnalyticsAndOperator.fromXml(_s.XmlElement elem) {
    return AnalyticsAndOperator(
      prefix: _s.extractXmlStringValue(elem, 'Prefix'),
      tags: elem.findElements('Tag').map((c) => Tag.fromXml(c)).toList(),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (prefix != null) _s.encodeXmlStringValue('Prefix', prefix),
      if (tags != null) ...tags.map((e) => e?.toXml('Tag')),
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

/// Specifies the configuration and any analyses for the analytics filter of an
/// Amazon S3 bucket.
class AnalyticsConfiguration {
  /// The ID that identifies the analytics configuration.
  final String id;

  /// Contains data related to access patterns to be collected and made available
  /// to analyze the tradeoffs between different storage classes.
  final StorageClassAnalysis storageClassAnalysis;

  /// The filter used to describe a set of objects for analyses. A filter must
  /// have exactly one prefix, one tag, or one conjunction (AnalyticsAndOperator).
  /// If no filter is provided, all objects will be considered in any analysis.
  final AnalyticsFilter filter;

  AnalyticsConfiguration({
    @_s.required this.id,
    @_s.required this.storageClassAnalysis,
    this.filter,
  });
  factory AnalyticsConfiguration.fromXml(_s.XmlElement elem) {
    return AnalyticsConfiguration(
      id: _s.extractXmlStringValue(elem, 'Id'),
      storageClassAnalysis: _s
          .extractXmlChild(elem, 'StorageClassAnalysis')
          ?.let((e) => StorageClassAnalysis.fromXml(e)),
      filter: _s
          .extractXmlChild(elem, 'Filter')
          ?.let((e) => AnalyticsFilter.fromXml(e)),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Id', id),
      if (filter != null) filter?.toXml('Filter'),
      storageClassAnalysis?.toXml('StorageClassAnalysis'),
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

/// Where to publish the analytics results.
class AnalyticsExportDestination {
  /// A destination signifying output to an S3 bucket.
  final AnalyticsS3BucketDestination s3BucketDestination;

  AnalyticsExportDestination({
    @_s.required this.s3BucketDestination,
  });
  factory AnalyticsExportDestination.fromXml(_s.XmlElement elem) {
    return AnalyticsExportDestination(
      s3BucketDestination: _s
          .extractXmlChild(elem, 'S3BucketDestination')
          ?.let((e) => AnalyticsS3BucketDestination.fromXml(e)),
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

/// The filter used to describe a set of objects for analyses. A filter must
/// have exactly one prefix, one tag, or one conjunction (AnalyticsAndOperator).
/// If no filter is provided, all objects will be considered in any analysis.
class AnalyticsFilter {
  /// A conjunction (logical AND) of predicates, which is used in evaluating an
  /// analytics filter. The operator must have at least two predicates.
  final AnalyticsAndOperator and;

  /// The prefix to use when evaluating an analytics filter.
  final String prefix;

  /// The tag to use when evaluating an analytics filter.
  final Tag tag;

  AnalyticsFilter({
    this.and,
    this.prefix,
    this.tag,
  });
  factory AnalyticsFilter.fromXml(_s.XmlElement elem) {
    return AnalyticsFilter(
      and: _s
          .extractXmlChild(elem, 'And')
          ?.let((e) => AnalyticsAndOperator.fromXml(e)),
      prefix: _s.extractXmlStringValue(elem, 'Prefix'),
      tag: _s.extractXmlChild(elem, 'Tag')?.let((e) => Tag.fromXml(e)),
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

/// Contains information about where to publish the analytics results.
class AnalyticsS3BucketDestination {
  /// The Amazon Resource Name (ARN) of the bucket to which data is exported.
  final String bucket;

  /// Specifies the file format used when exporting data to Amazon S3.
  final AnalyticsS3ExportFileFormat format;

  /// The account ID that owns the destination S3 bucket. If no account ID is
  /// provided, the owner is not validated before exporting data.
  /// <note>
  /// Although this value is optional, we strongly recommend that you set it to
  /// help prevent problems if the destination bucket ownership changes.
  /// </note>
  final String bucketAccountId;

  /// The prefix to use when exporting data. The prefix is prepended to all
  /// results.
  final String prefix;

  AnalyticsS3BucketDestination({
    @_s.required this.bucket,
    @_s.required this.format,
    this.bucketAccountId,
    this.prefix,
  });
  factory AnalyticsS3BucketDestination.fromXml(_s.XmlElement elem) {
    return AnalyticsS3BucketDestination(
      bucket: _s.extractXmlStringValue(elem, 'Bucket'),
      format: _s
          .extractXmlStringValue(elem, 'Format')
          ?.toAnalyticsS3ExportFileFormat(),
      bucketAccountId: _s.extractXmlStringValue(elem, 'BucketAccountId'),
      prefix: _s.extractXmlStringValue(elem, 'Prefix'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Format', format?.toValue() ?? ''),
      if (bucketAccountId != null)
        _s.encodeXmlStringValue('BucketAccountId', bucketAccountId),
      _s.encodeXmlStringValue('Bucket', bucket),
      if (prefix != null) _s.encodeXmlStringValue('Prefix', prefix),
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

enum AnalyticsS3ExportFileFormat {
  csv,
}

extension on AnalyticsS3ExportFileFormat {
  String toValue() {
    switch (this) {
      case AnalyticsS3ExportFileFormat.csv:
        return 'CSV';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  AnalyticsS3ExportFileFormat toAnalyticsS3ExportFileFormat() {
    switch (this) {
      case 'CSV':
        return AnalyticsS3ExportFileFormat.csv;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum ArchiveStatus {
  archiveAccess,
  deepArchiveAccess,
}

extension on ArchiveStatus {
  String toValue() {
    switch (this) {
      case ArchiveStatus.archiveAccess:
        return 'ARCHIVE_ACCESS';
      case ArchiveStatus.deepArchiveAccess:
        return 'DEEP_ARCHIVE_ACCESS';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  ArchiveStatus toArchiveStatus() {
    switch (this) {
      case 'ARCHIVE_ACCESS':
        return ArchiveStatus.archiveAccess;
      case 'DEEP_ARCHIVE_ACCESS':
        return ArchiveStatus.deepArchiveAccess;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// In terms of implementation, a Bucket is a resource. An Amazon S3 bucket name
/// is globally unique, and the namespace is shared by all AWS accounts.
class Bucket {
  /// Date the bucket was created. This date can change when making changes to
  /// your bucket, such as editing its bucket policy.
  final DateTime creationDate;

  /// The name of the bucket.
  final String name;

  Bucket({
    this.creationDate,
    this.name,
  });
  factory Bucket.fromXml(_s.XmlElement elem) {
    return Bucket(
      creationDate: _s.extractXmlDateTimeValue(elem, 'CreationDate'),
      name: _s.extractXmlStringValue(elem, 'Name'),
    );
  }
}

enum BucketAccelerateStatus {
  enabled,
  suspended,
}

extension on BucketAccelerateStatus {
  String toValue() {
    switch (this) {
      case BucketAccelerateStatus.enabled:
        return 'Enabled';
      case BucketAccelerateStatus.suspended:
        return 'Suspended';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  BucketAccelerateStatus toBucketAccelerateStatus() {
    switch (this) {
      case 'Enabled':
        return BucketAccelerateStatus.enabled;
      case 'Suspended':
        return BucketAccelerateStatus.suspended;
    }
    throw Exception('Unknown enum value: $this');
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

/// Specifies the lifecycle configuration for objects in an Amazon S3 bucket.
/// For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lifecycle-mgmt.html">Object
/// Lifecycle Management</a> in the <i>Amazon Simple Storage Service Developer
/// Guide</i>.
class BucketLifecycleConfiguration {
  /// A lifecycle rule for individual objects in an Amazon S3 bucket.
  final List<LifecycleRule> rules;

  BucketLifecycleConfiguration({
    @_s.required this.rules,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      ...rules?.map((e) => e?.toXml('Rule')),
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
  afSouth_1,
  apEast_1,
  apNortheast_1,
  apNortheast_2,
  apNortheast_3,
  apSouth_1,
  apSoutheast_1,
  apSoutheast_2,
  caCentral_1,
  cnNorth_1,
  cnNorthwest_1,
  eu,
  euCentral_1,
  euNorth_1,
  euSouth_1,
  euWest_1,
  euWest_2,
  euWest_3,
  meSouth_1,
  saEast_1,
  usEast_2,
  usGovEast_1,
  usGovWest_1,
  usWest_1,
  usWest_2,
}

extension on BucketLocationConstraint {
  String toValue() {
    switch (this) {
      case BucketLocationConstraint.afSouth_1:
        return 'af-south-1';
      case BucketLocationConstraint.apEast_1:
        return 'ap-east-1';
      case BucketLocationConstraint.apNortheast_1:
        return 'ap-northeast-1';
      case BucketLocationConstraint.apNortheast_2:
        return 'ap-northeast-2';
      case BucketLocationConstraint.apNortheast_3:
        return 'ap-northeast-3';
      case BucketLocationConstraint.apSouth_1:
        return 'ap-south-1';
      case BucketLocationConstraint.apSoutheast_1:
        return 'ap-southeast-1';
      case BucketLocationConstraint.apSoutheast_2:
        return 'ap-southeast-2';
      case BucketLocationConstraint.caCentral_1:
        return 'ca-central-1';
      case BucketLocationConstraint.cnNorth_1:
        return 'cn-north-1';
      case BucketLocationConstraint.cnNorthwest_1:
        return 'cn-northwest-1';
      case BucketLocationConstraint.eu:
        return 'EU';
      case BucketLocationConstraint.euCentral_1:
        return 'eu-central-1';
      case BucketLocationConstraint.euNorth_1:
        return 'eu-north-1';
      case BucketLocationConstraint.euSouth_1:
        return 'eu-south-1';
      case BucketLocationConstraint.euWest_1:
        return 'eu-west-1';
      case BucketLocationConstraint.euWest_2:
        return 'eu-west-2';
      case BucketLocationConstraint.euWest_3:
        return 'eu-west-3';
      case BucketLocationConstraint.meSouth_1:
        return 'me-south-1';
      case BucketLocationConstraint.saEast_1:
        return 'sa-east-1';
      case BucketLocationConstraint.usEast_2:
        return 'us-east-2';
      case BucketLocationConstraint.usGovEast_1:
        return 'us-gov-east-1';
      case BucketLocationConstraint.usGovWest_1:
        return 'us-gov-west-1';
      case BucketLocationConstraint.usWest_1:
        return 'us-west-1';
      case BucketLocationConstraint.usWest_2:
        return 'us-west-2';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  BucketLocationConstraint toBucketLocationConstraint() {
    switch (this) {
      case 'af-south-1':
        return BucketLocationConstraint.afSouth_1;
      case 'ap-east-1':
        return BucketLocationConstraint.apEast_1;
      case 'ap-northeast-1':
        return BucketLocationConstraint.apNortheast_1;
      case 'ap-northeast-2':
        return BucketLocationConstraint.apNortheast_2;
      case 'ap-northeast-3':
        return BucketLocationConstraint.apNortheast_3;
      case 'ap-south-1':
        return BucketLocationConstraint.apSouth_1;
      case 'ap-southeast-1':
        return BucketLocationConstraint.apSoutheast_1;
      case 'ap-southeast-2':
        return BucketLocationConstraint.apSoutheast_2;
      case 'ca-central-1':
        return BucketLocationConstraint.caCentral_1;
      case 'cn-north-1':
        return BucketLocationConstraint.cnNorth_1;
      case 'cn-northwest-1':
        return BucketLocationConstraint.cnNorthwest_1;
      case 'EU':
        return BucketLocationConstraint.eu;
      case 'eu-central-1':
        return BucketLocationConstraint.euCentral_1;
      case 'eu-north-1':
        return BucketLocationConstraint.euNorth_1;
      case 'eu-south-1':
        return BucketLocationConstraint.euSouth_1;
      case 'eu-west-1':
        return BucketLocationConstraint.euWest_1;
      case 'eu-west-2':
        return BucketLocationConstraint.euWest_2;
      case 'eu-west-3':
        return BucketLocationConstraint.euWest_3;
      case 'me-south-1':
        return BucketLocationConstraint.meSouth_1;
      case 'sa-east-1':
        return BucketLocationConstraint.saEast_1;
      case 'us-east-2':
        return BucketLocationConstraint.usEast_2;
      case 'us-gov-east-1':
        return BucketLocationConstraint.usGovEast_1;
      case 'us-gov-west-1':
        return BucketLocationConstraint.usGovWest_1;
      case 'us-west-1':
        return BucketLocationConstraint.usWest_1;
      case 'us-west-2':
        return BucketLocationConstraint.usWest_2;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Container for logging status information.
class BucketLoggingStatus {
  final LoggingEnabled loggingEnabled;

  BucketLoggingStatus({
    this.loggingEnabled,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (loggingEnabled != null) loggingEnabled?.toXml('LoggingEnabled'),
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

enum BucketLogsPermission {
  fullControl,
  read,
  write,
}

extension on BucketLogsPermission {
  String toValue() {
    switch (this) {
      case BucketLogsPermission.fullControl:
        return 'FULL_CONTROL';
      case BucketLogsPermission.read:
        return 'READ';
      case BucketLogsPermission.write:
        return 'WRITE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  BucketLogsPermission toBucketLogsPermission() {
    switch (this) {
      case 'FULL_CONTROL':
        return BucketLogsPermission.fullControl;
      case 'READ':
        return BucketLogsPermission.read;
      case 'WRITE':
        return BucketLogsPermission.write;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum BucketVersioningStatus {
  enabled,
  suspended,
}

extension on BucketVersioningStatus {
  String toValue() {
    switch (this) {
      case BucketVersioningStatus.enabled:
        return 'Enabled';
      case BucketVersioningStatus.suspended:
        return 'Suspended';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  BucketVersioningStatus toBucketVersioningStatus() {
    switch (this) {
      case 'Enabled':
        return BucketVersioningStatus.enabled;
      case 'Suspended':
        return BucketVersioningStatus.suspended;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes the cross-origin access configuration for objects in an Amazon S3
/// bucket. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/cors.html">Enabling
/// Cross-Origin Resource Sharing</a> in the <i>Amazon Simple Storage Service
/// Developer Guide</i>.
class CORSConfiguration {
  /// A set of origins and methods (cross-origin access that you want to allow).
  /// You can add up to 100 rules to the configuration.
  final List<CORSRule> cORSRules;

  CORSConfiguration({
    @_s.required this.cORSRules,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      ...cORSRules?.map((e) => e?.toXml('CORSRule')),
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

/// Specifies a cross-origin access rule for an Amazon S3 bucket.
class CORSRule {
  /// An HTTP method that you allow the origin to execute. Valid values are
  /// <code>GET</code>, <code>PUT</code>, <code>HEAD</code>, <code>POST</code>,
  /// and <code>DELETE</code>.
  final List<String> allowedMethods;

  /// One or more origins you want customers to be able to access the bucket from.
  final List<String> allowedOrigins;

  /// Headers that are specified in the
  /// <code>Access-Control-Request-Headers</code> header. These headers are
  /// allowed in a preflight OPTIONS request. In response to any preflight OPTIONS
  /// request, Amazon S3 returns any requested headers that are allowed.
  final List<String> allowedHeaders;

  /// One or more headers in the response that you want customers to be able to
  /// access from their applications (for example, from a JavaScript
  /// <code>XMLHttpRequest</code> object).
  final List<String> exposeHeaders;

  /// The time in seconds that your browser is to cache the preflight response for
  /// the specified resource.
  final int maxAgeSeconds;

  CORSRule({
    @_s.required this.allowedMethods,
    @_s.required this.allowedOrigins,
    this.allowedHeaders,
    this.exposeHeaders,
    this.maxAgeSeconds,
  });
  factory CORSRule.fromXml(_s.XmlElement elem) {
    return CORSRule(
      allowedMethods: _s.extractXmlStringListValues(elem, 'AllowedMethod'),
      allowedOrigins: _s.extractXmlStringListValues(elem, 'AllowedOrigin'),
      allowedHeaders: _s.extractXmlStringListValues(elem, 'AllowedHeader'),
      exposeHeaders: _s.extractXmlStringListValues(elem, 'ExposeHeader'),
      maxAgeSeconds: _s.extractXmlIntValue(elem, 'MaxAgeSeconds'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (allowedHeaders != null)
        ...allowedHeaders
            .map((e) => _s.encodeXmlStringValue('AllowedHeader', e)),
      ...allowedMethods
          ?.map((e) => _s.encodeXmlStringValue('AllowedMethod', e)),
      ...allowedOrigins
          ?.map((e) => _s.encodeXmlStringValue('AllowedOrigin', e)),
      if (exposeHeaders != null)
        ...exposeHeaders.map((e) => _s.encodeXmlStringValue('ExposeHeader', e)),
      if (maxAgeSeconds != null)
        _s.encodeXmlIntValue('MaxAgeSeconds', maxAgeSeconds),
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

/// Describes how an uncompressed comma-separated values (CSV)-formatted input
/// object is formatted.
class CSVInput {
  /// Specifies that CSV field values may contain quoted record delimiters and
  /// such records should be allowed. Default value is FALSE. Setting this value
  /// to TRUE may lower performance.
  final bool allowQuotedRecordDelimiter;

  /// A single character used to indicate that a row should be ignored when the
  /// character is present at the start of that row. You can specify any character
  /// to indicate a comment line.
  final String comments;

  /// A single character used to separate individual fields in a record. You can
  /// specify an arbitrary delimiter.
  final String fieldDelimiter;

  /// Describes the first line of input. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>NONE</code>: First line is not a header.
  /// </li>
  /// <li>
  /// <code>IGNORE</code>: First line is a header, but you can't use the header
  /// values to indicate the column in an expression. You can use column position
  /// (such as _1, _2, …) to indicate the column (<code>SELECT s._1 FROM OBJECT
  /// s</code>).
  /// </li>
  /// <li>
  /// <code>Use</code>: First line is a header, and you can use the header value
  /// to identify a column in an expression (<code>SELECT "name" FROM
  /// OBJECT</code>).
  /// </li>
  /// </ul>
  final FileHeaderInfo fileHeaderInfo;

  /// A single character used for escaping when the field delimiter is part of the
  /// value. For example, if the value is <code>a, b</code>, Amazon S3 wraps this
  /// field value in quotation marks, as follows: <code>" a , b "</code>.
  ///
  /// Type: String
  ///
  /// Default: <code>"</code>
  ///
  /// Ancestors: <code>CSV</code>
  final String quoteCharacter;

  /// A single character used for escaping the quotation mark character inside an
  /// already escaped value. For example, the value """ a , b """ is parsed as " a
  /// , b ".
  final String quoteEscapeCharacter;

  /// A single character used to separate individual records in the input. Instead
  /// of the default value, you can specify an arbitrary delimiter.
  final String recordDelimiter;

  CSVInput({
    this.allowQuotedRecordDelimiter,
    this.comments,
    this.fieldDelimiter,
    this.fileHeaderInfo,
    this.quoteCharacter,
    this.quoteEscapeCharacter,
    this.recordDelimiter,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (fileHeaderInfo != null)
        _s.encodeXmlStringValue('FileHeaderInfo', fileHeaderInfo.toValue()),
      if (comments != null) _s.encodeXmlStringValue('Comments', comments),
      if (quoteEscapeCharacter != null)
        _s.encodeXmlStringValue('QuoteEscapeCharacter', quoteEscapeCharacter),
      if (recordDelimiter != null)
        _s.encodeXmlStringValue('RecordDelimiter', recordDelimiter),
      if (fieldDelimiter != null)
        _s.encodeXmlStringValue('FieldDelimiter', fieldDelimiter),
      if (quoteCharacter != null)
        _s.encodeXmlStringValue('QuoteCharacter', quoteCharacter),
      if (allowQuotedRecordDelimiter != null)
        _s.encodeXmlBoolValue(
            'AllowQuotedRecordDelimiter', allowQuotedRecordDelimiter),
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

/// Describes how uncompressed comma-separated values (CSV)-formatted results
/// are formatted.
class CSVOutput {
  /// The value used to separate individual fields in a record. You can specify an
  /// arbitrary delimiter.
  final String fieldDelimiter;

  /// A single character used for escaping when the field delimiter is part of the
  /// value. For example, if the value is <code>a, b</code>, Amazon S3 wraps this
  /// field value in quotation marks, as follows: <code>" a , b "</code>.
  final String quoteCharacter;

  /// The single character used for escaping the quote character inside an already
  /// escaped value.
  final String quoteEscapeCharacter;

  /// Indicates whether to use quotation marks around output fields.
  ///
  /// <ul>
  /// <li>
  /// <code>ALWAYS</code>: Always use quotation marks for output fields.
  /// </li>
  /// <li>
  /// <code>ASNEEDED</code>: Use quotation marks for output fields when needed.
  /// </li>
  /// </ul>
  final QuoteFields quoteFields;

  /// A single character used to separate individual records in the output.
  /// Instead of the default value, you can specify an arbitrary delimiter.
  final String recordDelimiter;

  CSVOutput({
    this.fieldDelimiter,
    this.quoteCharacter,
    this.quoteEscapeCharacter,
    this.quoteFields,
    this.recordDelimiter,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (quoteFields != null)
        _s.encodeXmlStringValue('QuoteFields', quoteFields.toValue()),
      if (quoteEscapeCharacter != null)
        _s.encodeXmlStringValue('QuoteEscapeCharacter', quoteEscapeCharacter),
      if (recordDelimiter != null)
        _s.encodeXmlStringValue('RecordDelimiter', recordDelimiter),
      if (fieldDelimiter != null)
        _s.encodeXmlStringValue('FieldDelimiter', fieldDelimiter),
      if (quoteCharacter != null)
        _s.encodeXmlStringValue('QuoteCharacter', quoteCharacter),
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

/// Container for specifying the AWS Lambda notification configuration.
class CloudFunctionConfiguration {
  /// Lambda cloud function ARN that Amazon S3 can invoke when it detects events
  /// of the specified type.
  final String cloudFunction;
  final Event event;

  /// Bucket events for which to send notifications.
  final List<Event> events;
  final String id;

  /// The role supporting the invocation of the Lambda function
  final String invocationRole;

  CloudFunctionConfiguration({
    this.cloudFunction,
    this.event,
    this.events,
    this.id,
    this.invocationRole,
  });
  factory CloudFunctionConfiguration.fromXml(_s.XmlElement elem) {
    return CloudFunctionConfiguration(
      cloudFunction: _s.extractXmlStringValue(elem, 'CloudFunction'),
      event: _s.extractXmlStringValue(elem, 'Event')?.toEvent(),
      events: _s
          .extractXmlStringListValues(elem, 'Event')
          .map((s) => s.toEvent())
          .toList(),
      id: _s.extractXmlStringValue(elem, 'Id'),
      invocationRole: _s.extractXmlStringValue(elem, 'InvocationRole'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (id != null) _s.encodeXmlStringValue('Id', id),
      if (event != null) _s.encodeXmlStringValue('Event', event.toValue()),
      if (events != null)
        ...events
            .map((e) => _s.encodeXmlStringValue('Event', e?.toValue() ?? '')),
      if (cloudFunction != null)
        _s.encodeXmlStringValue('CloudFunction', cloudFunction),
      if (invocationRole != null)
        _s.encodeXmlStringValue('InvocationRole', invocationRole),
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

/// Container for all (if there are any) keys between Prefix and the next
/// occurrence of the string specified by a delimiter. CommonPrefixes lists keys
/// that act like subdirectories in the directory specified by Prefix. For
/// example, if the prefix is notes/ and the delimiter is a slash (/) as in
/// notes/summer/july, the common prefix is notes/summer/.
class CommonPrefix {
  /// Container for the specified common prefix.
  final String prefix;

  CommonPrefix({
    this.prefix,
  });
  factory CommonPrefix.fromXml(_s.XmlElement elem) {
    return CommonPrefix(
      prefix: _s.extractXmlStringValue(elem, 'Prefix'),
    );
  }
}

class CompleteMultipartUploadOutput {
  /// The name of the bucket that contains the newly created object.
  ///
  /// When using this API with an access point, you must direct requests to the
  /// access point hostname. The access point hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com.
  /// When using this operation with an access point through the AWS SDKs, you
  /// provide the access point ARN in place of the bucket name. For more
  /// information about access point ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using
  /// Access Points</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// When using this API with Amazon S3 on Outposts, you must direct requests to
  /// the S3 on Outposts hostname. The S3 on Outposts hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com.
  /// When using this operation using S3 on Outposts through the AWS SDKs, you
  /// provide the Outposts bucket ARN in place of the bucket name. For more
  /// information about S3 on Outposts ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using
  /// S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  final String bucket;

  /// Indicates whether the multipart upload uses an S3 Bucket Key for server-side
  /// encryption with AWS KMS (SSE-KMS).
  final bool bucketKeyEnabled;

  /// Entity tag that identifies the newly created object's data. Objects with
  /// different object data will have different entity tags. The entity tag is an
  /// opaque string. The entity tag may or may not be an MD5 digest of the object
  /// data. If the entity tag is not an MD5 digest of the object data, it will
  /// contain one or more nonhexadecimal characters and/or will consist of less
  /// than 32 or more than 32 hexadecimal digits.
  final String eTag;

  /// If the object expiration is configured, this will contain the expiration
  /// date (expiry-date) and rule ID (rule-id). The value of rule-id is URL
  /// encoded.
  final String expiration;

  /// The object key of the newly created object.
  final String key;

  /// The URI that identifies the newly created object.
  final String location;
  final RequestCharged requestCharged;

  /// If present, specifies the ID of the AWS Key Management Service (AWS KMS)
  /// symmetric customer managed customer master key (CMK) that was used for the
  /// object.
  final String sSEKMSKeyId;

  /// If you specified server-side encryption either with an Amazon S3-managed
  /// encryption key or an AWS KMS customer master key (CMK) in your initiate
  /// multipart upload request, the response includes this header. It confirms the
  /// encryption algorithm that Amazon S3 used to encrypt the object.
  final ServerSideEncryption serverSideEncryption;

  /// Version ID of the newly created object, in case the bucket has versioning
  /// turned on.
  final String versionId;

  CompleteMultipartUploadOutput({
    this.bucket,
    this.bucketKeyEnabled,
    this.eTag,
    this.expiration,
    this.key,
    this.location,
    this.requestCharged,
    this.sSEKMSKeyId,
    this.serverSideEncryption,
    this.versionId,
  });
}

/// The container for the completed multipart upload details.
class CompletedMultipartUpload {
  /// Array of CompletedPart data types.
  final List<CompletedPart> parts;

  CompletedMultipartUpload({
    this.parts,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (parts != null) ...parts.map((e) => e?.toXml('Part')),
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

/// Details of the parts that were uploaded.
class CompletedPart {
  /// Entity tag returned when the part was uploaded.
  final String eTag;

  /// Part number that identifies the part. This is a positive integer between 1
  /// and 10,000.
  final int partNumber;

  CompletedPart({
    this.eTag,
    this.partNumber,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (eTag != null) _s.encodeXmlStringValue('ETag', eTag),
      if (partNumber != null) _s.encodeXmlIntValue('PartNumber', partNumber),
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

enum CompressionType {
  none,
  gzip,
  bzip2,
}

extension on CompressionType {
  String toValue() {
    switch (this) {
      case CompressionType.none:
        return 'NONE';
      case CompressionType.gzip:
        return 'GZIP';
      case CompressionType.bzip2:
        return 'BZIP2';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  CompressionType toCompressionType() {
    switch (this) {
      case 'NONE':
        return CompressionType.none;
      case 'GZIP':
        return CompressionType.gzip;
      case 'BZIP2':
        return CompressionType.bzip2;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// A container for describing a condition that must be met for the specified
/// redirect to apply. For example, 1. If request is for pages in the
/// <code>/docs</code> folder, redirect to the <code>/documents</code> folder.
/// 2. If request results in HTTP error 4xx, redirect request to another host
/// where you might process the error.
class Condition {
  /// The HTTP error code when the redirect is applied. In the event of an error,
  /// if the error code equals this value, then the specified redirect is applied.
  /// Required when parent element <code>Condition</code> is specified and sibling
  /// <code>KeyPrefixEquals</code> is not specified. If both are specified, then
  /// both must be true for the redirect to be applied.
  final String httpErrorCodeReturnedEquals;

  /// The object key name prefix when the redirect is applied. For example, to
  /// redirect requests for <code>ExamplePage.html</code>, the key prefix will be
  /// <code>ExamplePage.html</code>. To redirect request for all pages with the
  /// prefix <code>docs/</code>, the key prefix will be <code>/docs</code>, which
  /// identifies all objects in the <code>docs/</code> folder. Required when the
  /// parent element <code>Condition</code> is specified and sibling
  /// <code>HttpErrorCodeReturnedEquals</code> is not specified. If both
  /// conditions are specified, both must be true for the redirect to be applied.
  final String keyPrefixEquals;

  Condition({
    this.httpErrorCodeReturnedEquals,
    this.keyPrefixEquals,
  });
  factory Condition.fromXml(_s.XmlElement elem) {
    return Condition(
      httpErrorCodeReturnedEquals:
          _s.extractXmlStringValue(elem, 'HttpErrorCodeReturnedEquals'),
      keyPrefixEquals: _s.extractXmlStringValue(elem, 'KeyPrefixEquals'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (httpErrorCodeReturnedEquals != null)
        _s.encodeXmlStringValue(
            'HttpErrorCodeReturnedEquals', httpErrorCodeReturnedEquals),
      if (keyPrefixEquals != null)
        _s.encodeXmlStringValue('KeyPrefixEquals', keyPrefixEquals),
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
class ContinuationEvent {
  ContinuationEvent();
  factory ContinuationEvent.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return ContinuationEvent();
  }
}

class CopyObjectOutput {
  /// Indicates whether the copied object uses an S3 Bucket Key for server-side
  /// encryption with AWS KMS (SSE-KMS).
  final bool bucketKeyEnabled;

  /// Container for all response elements.
  final CopyObjectResult copyObjectResult;

  /// Version of the copied object in the destination bucket.
  final String copySourceVersionId;

  /// If the object expiration is configured, the response includes this header.
  final String expiration;
  final RequestCharged requestCharged;

  /// If server-side encryption with a customer-provided encryption key was
  /// requested, the response will include this header confirming the encryption
  /// algorithm used.
  final String sSECustomerAlgorithm;

  /// If server-side encryption with a customer-provided encryption key was
  /// requested, the response will include this header to provide round-trip
  /// message integrity verification of the customer-provided encryption key.
  final String sSECustomerKeyMD5;

  /// If present, specifies the AWS KMS Encryption Context to use for object
  /// encryption. The value of this header is a base64-encoded UTF-8 string
  /// holding JSON with the encryption context key-value pairs.
  final String sSEKMSEncryptionContext;

  /// If present, specifies the ID of the AWS Key Management Service (AWS KMS)
  /// symmetric customer managed customer master key (CMK) that was used for the
  /// object.
  final String sSEKMSKeyId;

  /// The server-side encryption algorithm used when storing this object in Amazon
  /// S3 (for example, AES256, aws:kms).
  final ServerSideEncryption serverSideEncryption;

  /// Version ID of the newly created copy.
  final String versionId;

  CopyObjectOutput({
    this.bucketKeyEnabled,
    this.copyObjectResult,
    this.copySourceVersionId,
    this.expiration,
    this.requestCharged,
    this.sSECustomerAlgorithm,
    this.sSECustomerKeyMD5,
    this.sSEKMSEncryptionContext,
    this.sSEKMSKeyId,
    this.serverSideEncryption,
    this.versionId,
  });
}

/// Container for all response elements.
class CopyObjectResult {
  /// Returns the ETag of the new object. The ETag reflects only changes to the
  /// contents of an object, not its metadata. The source and destination ETag is
  /// identical for a successfully copied object.
  final String eTag;

  /// Returns the date that the object was last modified.
  final DateTime lastModified;

  CopyObjectResult({
    this.eTag,
    this.lastModified,
  });
  factory CopyObjectResult.fromXml(_s.XmlElement elem) {
    return CopyObjectResult(
      eTag: _s.extractXmlStringValue(elem, 'ETag'),
      lastModified: _s.extractXmlDateTimeValue(elem, 'LastModified'),
    );
  }
}

/// Container for all response elements.
class CopyPartResult {
  /// Entity tag of the object.
  final String eTag;

  /// Date and time at which the object was uploaded.
  final DateTime lastModified;

  CopyPartResult({
    this.eTag,
    this.lastModified,
  });
  factory CopyPartResult.fromXml(_s.XmlElement elem) {
    return CopyPartResult(
      eTag: _s.extractXmlStringValue(elem, 'ETag'),
      lastModified: _s.extractXmlDateTimeValue(elem, 'LastModified'),
    );
  }
}

/// The configuration information for the bucket.
class CreateBucketConfiguration {
  /// Specifies the Region where the bucket will be created. If you don't specify
  /// a Region, the bucket is created in the US East (N. Virginia) Region
  /// (us-east-1).
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

class CreateBucketOutput {
  /// Specifies the Region where the bucket will be created. If you are creating a
  /// bucket on the US East (N. Virginia) Region (us-east-1), you do not need to
  /// specify the location.
  final String location;

  CreateBucketOutput({
    this.location,
  });
}

class CreateMultipartUploadOutput {
  /// If the bucket has a lifecycle rule configured with an action to abort
  /// incomplete multipart uploads and the prefix in the lifecycle rule matches
  /// the object name in the request, the response includes this header. The
  /// header indicates when the initiated multipart upload becomes eligible for an
  /// abort operation. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuoverview.html#mpu-abort-incomplete-mpu-lifecycle-config">
  /// Aborting Incomplete Multipart Uploads Using a Bucket Lifecycle Policy</a>.
  ///
  /// The response also includes the <code>x-amz-abort-rule-id</code> header that
  /// provides the ID of the lifecycle configuration rule that defines this
  /// action.
  final DateTime abortDate;

  /// This header is returned along with the <code>x-amz-abort-date</code> header.
  /// It identifies the applicable lifecycle configuration rule that defines the
  /// action to abort incomplete multipart uploads.
  final String abortRuleId;

  /// The name of the bucket to which the multipart upload was initiated.
  ///
  /// When using this API with an access point, you must direct requests to the
  /// access point hostname. The access point hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com.
  /// When using this operation with an access point through the AWS SDKs, you
  /// provide the access point ARN in place of the bucket name. For more
  /// information about access point ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using
  /// Access Points</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// When using this API with Amazon S3 on Outposts, you must direct requests to
  /// the S3 on Outposts hostname. The S3 on Outposts hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com.
  /// When using this operation using S3 on Outposts through the AWS SDKs, you
  /// provide the Outposts bucket ARN in place of the bucket name. For more
  /// information about S3 on Outposts ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using
  /// S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  final String bucket;

  /// Indicates whether the multipart upload uses an S3 Bucket Key for server-side
  /// encryption with AWS KMS (SSE-KMS).
  final bool bucketKeyEnabled;

  /// Object key for which the multipart upload was initiated.
  final String key;
  final RequestCharged requestCharged;

  /// If server-side encryption with a customer-provided encryption key was
  /// requested, the response will include this header confirming the encryption
  /// algorithm used.
  final String sSECustomerAlgorithm;

  /// If server-side encryption with a customer-provided encryption key was
  /// requested, the response will include this header to provide round-trip
  /// message integrity verification of the customer-provided encryption key.
  final String sSECustomerKeyMD5;

  /// If present, specifies the AWS KMS Encryption Context to use for object
  /// encryption. The value of this header is a base64-encoded UTF-8 string
  /// holding JSON with the encryption context key-value pairs.
  final String sSEKMSEncryptionContext;

  /// If present, specifies the ID of the AWS Key Management Service (AWS KMS)
  /// symmetric customer managed customer master key (CMK) that was used for the
  /// object.
  final String sSEKMSKeyId;

  /// The server-side encryption algorithm used when storing this object in Amazon
  /// S3 (for example, AES256, aws:kms).
  final ServerSideEncryption serverSideEncryption;

  /// ID for the initiated multipart upload.
  final String uploadId;

  CreateMultipartUploadOutput({
    this.abortDate,
    this.abortRuleId,
    this.bucket,
    this.bucketKeyEnabled,
    this.key,
    this.requestCharged,
    this.sSECustomerAlgorithm,
    this.sSECustomerKeyMD5,
    this.sSEKMSEncryptionContext,
    this.sSEKMSKeyId,
    this.serverSideEncryption,
    this.uploadId,
  });
}

/// The container element for specifying the default Object Lock retention
/// settings for new objects placed in the specified bucket.
class DefaultRetention {
  /// The number of days that you want to specify for the default retention
  /// period.
  final int days;

  /// The default Object Lock retention mode you want to apply to new objects
  /// placed in the specified bucket.
  final ObjectLockRetentionMode mode;

  /// The number of years that you want to specify for the default retention
  /// period.
  final int years;

  DefaultRetention({
    this.days,
    this.mode,
    this.years,
  });
  factory DefaultRetention.fromXml(_s.XmlElement elem) {
    return DefaultRetention(
      days: _s.extractXmlIntValue(elem, 'Days'),
      mode: _s.extractXmlStringValue(elem, 'Mode')?.toObjectLockRetentionMode(),
      years: _s.extractXmlIntValue(elem, 'Years'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (mode != null) _s.encodeXmlStringValue('Mode', mode.toValue()),
      if (days != null) _s.encodeXmlIntValue('Days', days),
      if (years != null) _s.encodeXmlIntValue('Years', years),
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

/// Container for the objects to delete.
class Delete {
  /// The objects to delete.
  final List<ObjectIdentifier> objects;

  /// Element to enable quiet mode for the request. When you add this element, you
  /// must set its value to true.
  final bool quiet;

  Delete({
    @_s.required this.objects,
    this.quiet,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      ...objects?.map((e) => e?.toXml('Object')),
      if (quiet != null) _s.encodeXmlBoolValue('Quiet', quiet),
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

/// Information about the delete marker.
class DeleteMarkerEntry {
  /// Specifies whether the object is (true) or is not (false) the latest version
  /// of an object.
  final bool isLatest;

  /// The object key.
  final String key;

  /// Date and time the object was last modified.
  final DateTime lastModified;

  /// The account that created the delete marker.&gt;
  final Owner owner;

  /// Version ID of an object.
  final String versionId;

  DeleteMarkerEntry({
    this.isLatest,
    this.key,
    this.lastModified,
    this.owner,
    this.versionId,
  });
  factory DeleteMarkerEntry.fromXml(_s.XmlElement elem) {
    return DeleteMarkerEntry(
      isLatest: _s.extractXmlBoolValue(elem, 'IsLatest'),
      key: _s.extractXmlStringValue(elem, 'Key'),
      lastModified: _s.extractXmlDateTimeValue(elem, 'LastModified'),
      owner: _s.extractXmlChild(elem, 'Owner')?.let((e) => Owner.fromXml(e)),
      versionId: _s.extractXmlStringValue(elem, 'VersionId'),
    );
  }
}

/// Specifies whether Amazon S3 replicates delete markers. If you specify a
/// <code>Filter</code> in your replication configuration, you must also include
/// a <code>DeleteMarkerReplication</code> element. If your <code>Filter</code>
/// includes a <code>Tag</code> element, the
/// <code>DeleteMarkerReplication</code> <code>Status</code> must be set to
/// Disabled, because Amazon S3 does not support replicating delete markers for
/// tag-based rules. For an example configuration, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/replication-add-config.html#replication-config-min-rule-config">Basic
/// Rule Configuration</a>.
///
/// For more information about delete marker replication, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/delete-marker-replication.html">Basic
/// Rule Configuration</a>.
/// <note>
/// If you are using an earlier version of the replication configuration, Amazon
/// S3 handles replication of delete markers differently. For more information,
/// see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/replication-add-config.html#replication-backward-compat-considerations">Backward
/// Compatibility</a>.
/// </note>
class DeleteMarkerReplication {
  /// Indicates whether to replicate delete markers.
  /// <note>
  /// Indicates whether to replicate delete markers.
  /// </note>
  final DeleteMarkerReplicationStatus status;

  DeleteMarkerReplication({
    this.status,
  });
  factory DeleteMarkerReplication.fromXml(_s.XmlElement elem) {
    return DeleteMarkerReplication(
      status: _s
          .extractXmlStringValue(elem, 'Status')
          ?.toDeleteMarkerReplicationStatus(),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (status != null) _s.encodeXmlStringValue('Status', status.toValue()),
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

enum DeleteMarkerReplicationStatus {
  enabled,
  disabled,
}

extension on DeleteMarkerReplicationStatus {
  String toValue() {
    switch (this) {
      case DeleteMarkerReplicationStatus.enabled:
        return 'Enabled';
      case DeleteMarkerReplicationStatus.disabled:
        return 'Disabled';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  DeleteMarkerReplicationStatus toDeleteMarkerReplicationStatus() {
    switch (this) {
      case 'Enabled':
        return DeleteMarkerReplicationStatus.enabled;
      case 'Disabled':
        return DeleteMarkerReplicationStatus.disabled;
    }
    throw Exception('Unknown enum value: $this');
  }
}

class DeleteObjectOutput {
  /// Specifies whether the versioned object that was permanently deleted was
  /// (true) or was not (false) a delete marker.
  final bool deleteMarker;
  final RequestCharged requestCharged;

  /// Returns the version ID of the delete marker created as a result of the
  /// DELETE operation.
  final String versionId;

  DeleteObjectOutput({
    this.deleteMarker,
    this.requestCharged,
    this.versionId,
  });
}

class DeleteObjectTaggingOutput {
  /// The versionId of the object the tag-set was removed from.
  final String versionId;

  DeleteObjectTaggingOutput({
    this.versionId,
  });
}

class DeleteObjectsOutput {
  /// Container element for a successful delete. It identifies the object that was
  /// successfully deleted.
  final List<DeletedObject> deleted;

  /// Container for a failed delete operation that describes the object that
  /// Amazon S3 attempted to delete and the error it encountered.
  final List<Error> errors;
  final RequestCharged requestCharged;

  DeleteObjectsOutput({
    this.deleted,
    this.errors,
    this.requestCharged,
  });
}

/// Information about the deleted object.
class DeletedObject {
  /// Specifies whether the versioned object that was permanently deleted was
  /// (true) or was not (false) a delete marker. In a simple DELETE, this header
  /// indicates whether (true) or not (false) a delete marker was created.
  final bool deleteMarker;

  /// The version ID of the delete marker created as a result of the DELETE
  /// operation. If you delete a specific object version, the value returned by
  /// this header is the version ID of the object version deleted.
  final String deleteMarkerVersionId;

  /// The name of the deleted object.
  final String key;

  /// The version ID of the deleted object.
  final String versionId;

  DeletedObject({
    this.deleteMarker,
    this.deleteMarkerVersionId,
    this.key,
    this.versionId,
  });
  factory DeletedObject.fromXml(_s.XmlElement elem) {
    return DeletedObject(
      deleteMarker: _s.extractXmlBoolValue(elem, 'DeleteMarker'),
      deleteMarkerVersionId:
          _s.extractXmlStringValue(elem, 'DeleteMarkerVersionId'),
      key: _s.extractXmlStringValue(elem, 'Key'),
      versionId: _s.extractXmlStringValue(elem, 'VersionId'),
    );
  }
}

/// Specifies information about where to publish analysis or configuration
/// results for an Amazon S3 bucket and S3 Replication Time Control (S3 RTC).
class Destination {
  /// The Amazon Resource Name (ARN) of the bucket where you want Amazon S3 to
  /// store the results.
  final String bucket;

  /// Specify this only in a cross-account scenario (where source and destination
  /// bucket owners are not the same), and you want to change replica ownership to
  /// the AWS account that owns the destination bucket. If this is not specified
  /// in the replication configuration, the replicas are owned by same AWS account
  /// that owns the source object.
  final AccessControlTranslation accessControlTranslation;

  /// Destination bucket owner account ID. In a cross-account scenario, if you
  /// direct Amazon S3 to change replica ownership to the AWS account that owns
  /// the destination bucket by specifying the
  /// <code>AccessControlTranslation</code> property, this is the account ID of
  /// the destination bucket owner. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/replication-change-owner.html">Replication
  /// Additional Configuration: Changing the Replica Owner</a> in the <i>Amazon
  /// Simple Storage Service Developer Guide</i>.
  final String account;

  /// A container that provides information about encryption. If
  /// <code>SourceSelectionCriteria</code> is specified, you must specify this
  /// element.
  final EncryptionConfiguration encryptionConfiguration;

  /// A container specifying replication metrics-related settings enabling
  /// replication metrics and events.
  final Metrics metrics;

  /// A container specifying S3 Replication Time Control (S3 RTC), including
  /// whether S3 RTC is enabled and the time when all objects and operations on
  /// objects must be replicated. Must be specified together with a
  /// <code>Metrics</code> block.
  final ReplicationTime replicationTime;

  /// The storage class to use when replicating objects, such as S3 Standard or
  /// reduced redundancy. By default, Amazon S3 uses the storage class of the
  /// source object to create the object replica.
  ///
  /// For valid values, see the <code>StorageClass</code> element of the <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTBucketPUTreplication.html">PUT
  /// Bucket replication</a> action in the <i>Amazon Simple Storage Service API
  /// Reference</i>.
  final StorageClass storageClass;

  Destination({
    @_s.required this.bucket,
    this.accessControlTranslation,
    this.account,
    this.encryptionConfiguration,
    this.metrics,
    this.replicationTime,
    this.storageClass,
  });
  factory Destination.fromXml(_s.XmlElement elem) {
    return Destination(
      bucket: _s.extractXmlStringValue(elem, 'Bucket'),
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
      storageClass:
          _s.extractXmlStringValue(elem, 'StorageClass')?.toStorageClass(),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Bucket', bucket),
      if (account != null) _s.encodeXmlStringValue('Account', account),
      if (storageClass != null)
        _s.encodeXmlStringValue('StorageClass', storageClass.toValue()),
      if (accessControlTranslation != null)
        accessControlTranslation?.toXml('AccessControlTranslation'),
      if (encryptionConfiguration != null)
        encryptionConfiguration?.toXml('EncryptionConfiguration'),
      if (replicationTime != null) replicationTime?.toXml('ReplicationTime'),
      if (metrics != null) metrics?.toXml('Metrics'),
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

/// Requests Amazon S3 to encode the object keys in the response and specifies
/// the encoding method to use. An object key may contain any Unicode character;
/// however, XML 1.0 parser cannot parse some characters, such as characters
/// with an ASCII value from 0 to 10. For characters that are not supported in
/// XML 1.0, you can add this parameter to request that Amazon S3 encode the
/// keys in the response.
enum EncodingType {
  url,
}

extension on EncodingType {
  String toValue() {
    switch (this) {
      case EncodingType.url:
        return 'url';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  EncodingType toEncodingType() {
    switch (this) {
      case 'url':
        return EncodingType.url;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Contains the type of server-side encryption used.
class Encryption {
  /// The server-side encryption algorithm used when storing job results in Amazon
  /// S3 (for example, AES256, aws:kms).
  final ServerSideEncryption encryptionType;

  /// If the encryption type is <code>aws:kms</code>, this optional value can be
  /// used to specify the encryption context for the restore results.
  final String kMSContext;

  /// If the encryption type is <code>aws:kms</code>, this optional value
  /// specifies the ID of the symmetric customer managed AWS KMS CMK to use for
  /// encryption of job results. Amazon S3 only supports symmetric CMKs. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html">Using
  /// Symmetric and Asymmetric Keys</a> in the <i>AWS Key Management Service
  /// Developer Guide</i>.
  final String kMSKeyId;

  Encryption({
    @_s.required this.encryptionType,
    this.kMSContext,
    this.kMSKeyId,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue(
          'EncryptionType', encryptionType?.toValue() ?? ''),
      if (kMSKeyId != null) _s.encodeXmlStringValue('KMSKeyId', kMSKeyId),
      if (kMSContext != null) _s.encodeXmlStringValue('KMSContext', kMSContext),
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

/// Specifies encryption-related information for an Amazon S3 bucket that is a
/// destination for replicated objects.
class EncryptionConfiguration {
  /// Specifies the ID (Key ARN or Alias ARN) of the customer managed customer
  /// master key (CMK) stored in AWS Key Management Service (KMS) for the
  /// destination bucket. Amazon S3 uses this key to encrypt replica objects.
  /// Amazon S3 only supports symmetric customer managed CMKs. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html">Using
  /// Symmetric and Asymmetric Keys</a> in the <i>AWS Key Management Service
  /// Developer Guide</i>.
  final String replicaKmsKeyID;

  EncryptionConfiguration({
    this.replicaKmsKeyID,
  });
  factory EncryptionConfiguration.fromXml(_s.XmlElement elem) {
    return EncryptionConfiguration(
      replicaKmsKeyID: _s.extractXmlStringValue(elem, 'ReplicaKmsKeyID'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
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
      $children.where((e) => e != null),
    );
  }
}

/// A message that indicates the request is complete and no more messages will
/// be sent. You should not assume that the request is complete until the client
/// receives an <code>EndEvent</code>.
class EndEvent {
  EndEvent();
  factory EndEvent.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return EndEvent();
  }
}

/// Container for all error elements.
class Error {
  /// The error code is a string that uniquely identifies an error condition. It
  /// is meant to be read and understood by programs that detect and handle errors
  /// by type.
  /// <p class="title"> <b>Amazon S3 error codes</b>
  ///
  /// <ul>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> AccessDenied
  /// </li>
  /// <li>
  /// <i>Description:</i> Access Denied
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 403 Forbidden
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> AccountProblem
  /// </li>
  /// <li>
  /// <i>Description:</i> There is a problem with your AWS account that prevents
  /// the operation from completing successfully. Contact AWS Support for further
  /// assistance.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 403 Forbidden
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> AllAccessDisabled
  /// </li>
  /// <li>
  /// <i>Description:</i> All access to this Amazon S3 resource has been disabled.
  /// Contact AWS Support for further assistance.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 403 Forbidden
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> AmbiguousGrantByEmailAddress
  /// </li>
  /// <li>
  /// <i>Description:</i> The email address you provided is associated with more
  /// than one account.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> AuthorizationHeaderMalformed
  /// </li>
  /// <li>
  /// <i>Description:</i> The authorization header you provided is invalid.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> N/A
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> BadDigest
  /// </li>
  /// <li>
  /// <i>Description:</i> The Content-MD5 you specified did not match what we
  /// received.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> BucketAlreadyExists
  /// </li>
  /// <li>
  /// <i>Description:</i> The requested bucket name is not available. The bucket
  /// namespace is shared by all users of the system. Please select a different
  /// name and try again.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 409 Conflict
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> BucketAlreadyOwnedByYou
  /// </li>
  /// <li>
  /// <i>Description:</i> The bucket you tried to create already exists, and you
  /// own it. Amazon S3 returns this error in all AWS Regions except in the North
  /// Virginia Region. For legacy compatibility, if you re-create an existing
  /// bucket that you already own in the North Virginia Region, Amazon S3 returns
  /// 200 OK and resets the bucket access control lists (ACLs).
  /// </li>
  /// <li>
  /// <i>Code:</i> 409 Conflict (in all Regions except the North Virginia Region)
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> BucketNotEmpty
  /// </li>
  /// <li>
  /// <i>Description:</i> The bucket you tried to delete is not empty.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 409 Conflict
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> CredentialsNotSupported
  /// </li>
  /// <li>
  /// <i>Description:</i> This request does not support credentials.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> CrossLocationLoggingProhibited
  /// </li>
  /// <li>
  /// <i>Description:</i> Cross-location logging not allowed. Buckets in one
  /// geographic location cannot log information to a bucket in another location.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 403 Forbidden
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> EntityTooSmall
  /// </li>
  /// <li>
  /// <i>Description:</i> Your proposed upload is smaller than the minimum allowed
  /// object size.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> EntityTooLarge
  /// </li>
  /// <li>
  /// <i>Description:</i> Your proposed upload exceeds the maximum allowed object
  /// size.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> ExpiredToken
  /// </li>
  /// <li>
  /// <i>Description:</i> The provided token has expired.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> IllegalVersioningConfigurationException
  /// </li>
  /// <li>
  /// <i>Description:</i> Indicates that the versioning configuration specified in
  /// the request is invalid.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> IncompleteBody
  /// </li>
  /// <li>
  /// <i>Description:</i> You did not provide the number of bytes specified by the
  /// Content-Length HTTP header
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> IncorrectNumberOfFilesInPostRequest
  /// </li>
  /// <li>
  /// <i>Description:</i> POST requires exactly one file upload per request.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> InlineDataTooLarge
  /// </li>
  /// <li>
  /// <i>Description:</i> Inline data exceeds the maximum allowed size.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> InternalError
  /// </li>
  /// <li>
  /// <i>Description:</i> We encountered an internal error. Please try again.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 500 Internal Server Error
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Server
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> InvalidAccessKeyId
  /// </li>
  /// <li>
  /// <i>Description:</i> The AWS access key ID you provided does not exist in our
  /// records.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 403 Forbidden
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> InvalidAddressingHeader
  /// </li>
  /// <li>
  /// <i>Description:</i> You must specify the Anonymous role.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> N/A
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> InvalidArgument
  /// </li>
  /// <li>
  /// <i>Description:</i> Invalid Argument
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> InvalidBucketName
  /// </li>
  /// <li>
  /// <i>Description:</i> The specified bucket is not valid.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> InvalidBucketState
  /// </li>
  /// <li>
  /// <i>Description:</i> The request is not valid with the current state of the
  /// bucket.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 409 Conflict
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> InvalidDigest
  /// </li>
  /// <li>
  /// <i>Description:</i> The Content-MD5 you specified is not valid.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> InvalidEncryptionAlgorithmError
  /// </li>
  /// <li>
  /// <i>Description:</i> The encryption request you specified is not valid. The
  /// valid value is AES256.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> InvalidLocationConstraint
  /// </li>
  /// <li>
  /// <i>Description:</i> The specified location constraint is not valid. For more
  /// information about Regions, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingBucket.html#access-bucket-intro">How
  /// to Select a Region for Your Buckets</a>.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> InvalidObjectState
  /// </li>
  /// <li>
  /// <i>Description:</i> The operation is not valid for the current state of the
  /// object.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 403 Forbidden
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> InvalidPart
  /// </li>
  /// <li>
  /// <i>Description:</i> One or more of the specified parts could not be found.
  /// The part might not have been uploaded, or the specified entity tag might not
  /// have matched the part's entity tag.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> InvalidPartOrder
  /// </li>
  /// <li>
  /// <i>Description:</i> The list of parts was not in ascending order. Parts list
  /// must be specified in order by part number.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> InvalidPayer
  /// </li>
  /// <li>
  /// <i>Description:</i> All access to this object has been disabled. Please
  /// contact AWS Support for further assistance.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 403 Forbidden
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> InvalidPolicyDocument
  /// </li>
  /// <li>
  /// <i>Description:</i> The content of the form does not meet the conditions
  /// specified in the policy document.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> InvalidRange
  /// </li>
  /// <li>
  /// <i>Description:</i> The requested range cannot be satisfied.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 416 Requested Range Not Satisfiable
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> InvalidRequest
  /// </li>
  /// <li>
  /// <i>Description:</i> Please use AWS4-HMAC-SHA256.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>Code:</i> N/A
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> InvalidRequest
  /// </li>
  /// <li>
  /// <i>Description:</i> SOAP requests must be made over an HTTPS connection.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> InvalidRequest
  /// </li>
  /// <li>
  /// <i>Description:</i> Amazon S3 Transfer Acceleration is not supported for
  /// buckets with non-DNS compliant names.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>Code:</i> N/A
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> InvalidRequest
  /// </li>
  /// <li>
  /// <i>Description:</i> Amazon S3 Transfer Acceleration is not supported for
  /// buckets with periods (.) in their names.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>Code:</i> N/A
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> InvalidRequest
  /// </li>
  /// <li>
  /// <i>Description:</i> Amazon S3 Transfer Accelerate endpoint only supports
  /// virtual style requests.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>Code:</i> N/A
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> InvalidRequest
  /// </li>
  /// <li>
  /// <i>Description:</i> Amazon S3 Transfer Accelerate is not configured on this
  /// bucket.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>Code:</i> N/A
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> InvalidRequest
  /// </li>
  /// <li>
  /// <i>Description:</i> Amazon S3 Transfer Accelerate is disabled on this
  /// bucket.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>Code:</i> N/A
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> InvalidRequest
  /// </li>
  /// <li>
  /// <i>Description:</i> Amazon S3 Transfer Acceleration is not supported on this
  /// bucket. Contact AWS Support for more information.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>Code:</i> N/A
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> InvalidRequest
  /// </li>
  /// <li>
  /// <i>Description:</i> Amazon S3 Transfer Acceleration cannot be enabled on
  /// this bucket. Contact AWS Support for more information.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>Code:</i> N/A
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> InvalidSecurity
  /// </li>
  /// <li>
  /// <i>Description:</i> The provided security credentials are not valid.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 403 Forbidden
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> InvalidSOAPRequest
  /// </li>
  /// <li>
  /// <i>Description:</i> The SOAP request body is invalid.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> InvalidStorageClass
  /// </li>
  /// <li>
  /// <i>Description:</i> The storage class you specified is not valid.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> InvalidTargetBucketForLogging
  /// </li>
  /// <li>
  /// <i>Description:</i> The target bucket for logging does not exist, is not
  /// owned by you, or does not have the appropriate grants for the log-delivery
  /// group.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> InvalidToken
  /// </li>
  /// <li>
  /// <i>Description:</i> The provided token is malformed or otherwise invalid.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> InvalidURI
  /// </li>
  /// <li>
  /// <i>Description:</i> Couldn't parse the specified URI.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> KeyTooLongError
  /// </li>
  /// <li>
  /// <i>Description:</i> Your key is too long.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> MalformedACLError
  /// </li>
  /// <li>
  /// <i>Description:</i> The XML you provided was not well-formed or did not
  /// validate against our published schema.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> MalformedPOSTRequest
  /// </li>
  /// <li>
  /// <i>Description:</i> The body of your POST request is not well-formed
  /// multipart/form-data.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> MalformedXML
  /// </li>
  /// <li>
  /// <i>Description:</i> This happens when the user sends malformed XML (XML that
  /// doesn't conform to the published XSD) for the configuration. The error
  /// message is, "The XML you provided was not well-formed or did not validate
  /// against our published schema."
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> MaxMessageLengthExceeded
  /// </li>
  /// <li>
  /// <i>Description:</i> Your request was too big.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> MaxPostPreDataLengthExceededError
  /// </li>
  /// <li>
  /// <i>Description:</i> Your POST request fields preceding the upload file were
  /// too large.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> MetadataTooLarge
  /// </li>
  /// <li>
  /// <i>Description:</i> Your metadata headers exceed the maximum allowed
  /// metadata size.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> MethodNotAllowed
  /// </li>
  /// <li>
  /// <i>Description:</i> The specified method is not allowed against this
  /// resource.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 405 Method Not Allowed
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> MissingAttachment
  /// </li>
  /// <li>
  /// <i>Description:</i> A SOAP attachment was expected, but none were found.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> N/A
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> MissingContentLength
  /// </li>
  /// <li>
  /// <i>Description:</i> You must provide the Content-Length HTTP header.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 411 Length Required
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> MissingRequestBodyError
  /// </li>
  /// <li>
  /// <i>Description:</i> This happens when the user sends an empty XML document
  /// as a request. The error message is, "Request body is empty."
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> MissingSecurityElement
  /// </li>
  /// <li>
  /// <i>Description:</i> The SOAP 1.1 request is missing a security element.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> MissingSecurityHeader
  /// </li>
  /// <li>
  /// <i>Description:</i> Your request is missing a required header.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> NoLoggingStatusForKey
  /// </li>
  /// <li>
  /// <i>Description:</i> There is no such thing as a logging status subresource
  /// for a key.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> NoSuchBucket
  /// </li>
  /// <li>
  /// <i>Description:</i> The specified bucket does not exist.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 404 Not Found
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> NoSuchBucketPolicy
  /// </li>
  /// <li>
  /// <i>Description:</i> The specified bucket does not have a bucket policy.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 404 Not Found
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> NoSuchKey
  /// </li>
  /// <li>
  /// <i>Description:</i> The specified key does not exist.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 404 Not Found
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> NoSuchLifecycleConfiguration
  /// </li>
  /// <li>
  /// <i>Description:</i> The lifecycle configuration does not exist.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 404 Not Found
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> NoSuchUpload
  /// </li>
  /// <li>
  /// <i>Description:</i> The specified multipart upload does not exist. The
  /// upload ID might be invalid, or the multipart upload might have been aborted
  /// or completed.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 404 Not Found
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> NoSuchVersion
  /// </li>
  /// <li>
  /// <i>Description:</i> Indicates that the version ID specified in the request
  /// does not match an existing version.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 404 Not Found
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> NotImplemented
  /// </li>
  /// <li>
  /// <i>Description:</i> A header you provided implies functionality that is not
  /// implemented.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 501 Not Implemented
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Server
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> NotSignedUp
  /// </li>
  /// <li>
  /// <i>Description:</i> Your account is not signed up for the Amazon S3 service.
  /// You must sign up before you can use Amazon S3. You can sign up at the
  /// following URL: https://aws.amazon.com/s3
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 403 Forbidden
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> OperationAborted
  /// </li>
  /// <li>
  /// <i>Description:</i> A conflicting conditional operation is currently in
  /// progress against this resource. Try again.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 409 Conflict
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> PermanentRedirect
  /// </li>
  /// <li>
  /// <i>Description:</i> The bucket you are attempting to access must be
  /// addressed using the specified endpoint. Send all future requests to this
  /// endpoint.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 301 Moved Permanently
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> PreconditionFailed
  /// </li>
  /// <li>
  /// <i>Description:</i> At least one of the preconditions you specified did not
  /// hold.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 412 Precondition Failed
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> Redirect
  /// </li>
  /// <li>
  /// <i>Description:</i> Temporary redirect.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 307 Moved Temporarily
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> RestoreAlreadyInProgress
  /// </li>
  /// <li>
  /// <i>Description:</i> Object restore is already in progress.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 409 Conflict
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> RequestIsNotMultiPartContent
  /// </li>
  /// <li>
  /// <i>Description:</i> Bucket POST must be of the enclosure-type
  /// multipart/form-data.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> RequestTimeout
  /// </li>
  /// <li>
  /// <i>Description:</i> Your socket connection to the server was not read from
  /// or written to within the timeout period.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> RequestTimeTooSkewed
  /// </li>
  /// <li>
  /// <i>Description:</i> The difference between the request time and the server's
  /// time is too large.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 403 Forbidden
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> RequestTorrentOfBucketError
  /// </li>
  /// <li>
  /// <i>Description:</i> Requesting the torrent file of a bucket is not
  /// permitted.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> SignatureDoesNotMatch
  /// </li>
  /// <li>
  /// <i>Description:</i> The request signature we calculated does not match the
  /// signature you provided. Check your AWS secret access key and signing method.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/RESTAuthentication.html">REST
  /// Authentication</a> and <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/SOAPAuthentication.html">SOAP
  /// Authentication</a> for details.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 403 Forbidden
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> ServiceUnavailable
  /// </li>
  /// <li>
  /// <i>Description:</i> Reduce your request rate.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 503 Service Unavailable
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Server
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> SlowDown
  /// </li>
  /// <li>
  /// <i>Description:</i> Reduce your request rate.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 503 Slow Down
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Server
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> TemporaryRedirect
  /// </li>
  /// <li>
  /// <i>Description:</i> You are being redirected to the bucket while DNS
  /// updates.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 307 Moved Temporarily
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> TokenRefreshRequired
  /// </li>
  /// <li>
  /// <i>Description:</i> The provided token must be refreshed.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> TooManyBuckets
  /// </li>
  /// <li>
  /// <i>Description:</i> You have attempted to create more buckets than allowed.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> UnexpectedContent
  /// </li>
  /// <li>
  /// <i>Description:</i> This request does not support content.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> UnresolvableGrantByEmailAddress
  /// </li>
  /// <li>
  /// <i>Description:</i> The email address you provided does not match any
  /// account on record.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <ul>
  /// <li>
  /// <i>Code:</i> UserKeyMustBeSpecified
  /// </li>
  /// <li>
  /// <i>Description:</i> The bucket POST must contain the specified field name.
  /// If it is specified, check the order of the fields.
  /// </li>
  /// <li>
  /// <i>HTTP Status Code:</i> 400 Bad Request
  /// </li>
  /// <li>
  /// <i>SOAP Fault Code Prefix:</i> Client
  /// </li>
  /// </ul> </li>
  /// </ul> <p/>
  final String code;

  /// The error key.
  final String key;

  /// The error message contains a generic description of the error condition in
  /// English. It is intended for a human audience. Simple programs display the
  /// message directly to the end user if they encounter an error condition they
  /// don't know how or don't care to handle. Sophisticated programs with more
  /// exhaustive error handling and proper internationalization are more likely to
  /// ignore the error message.
  final String message;

  /// The version ID of the error.
  final String versionId;

  Error({
    this.code,
    this.key,
    this.message,
    this.versionId,
  });
  factory Error.fromXml(_s.XmlElement elem) {
    return Error(
      code: _s.extractXmlStringValue(elem, 'Code'),
      key: _s.extractXmlStringValue(elem, 'Key'),
      message: _s.extractXmlStringValue(elem, 'Message'),
      versionId: _s.extractXmlStringValue(elem, 'VersionId'),
    );
  }
}

/// The error information.
class ErrorDocument {
  /// The object key name to use when a 4XX class error occurs.
  final String key;

  ErrorDocument({
    @_s.required this.key,
  });
  factory ErrorDocument.fromXml(_s.XmlElement elem) {
    return ErrorDocument(
      key: _s.extractXmlStringValue(elem, 'Key'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Key', key),
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

/// The bucket event for which to send notifications.
enum Event {
  s3ReducedRedundancyLostObject,
  s3ObjectCreated,
  s3ObjectCreatedPut,
  s3ObjectCreatedPost,
  s3ObjectCreatedCopy,
  s3ObjectCreatedCompleteMultipartUpload,
  s3ObjectRemoved,
  s3ObjectRemovedDelete,
  s3ObjectRemovedDeleteMarkerCreated,
  s3ObjectRestore,
  s3ObjectRestorePost,
  s3ObjectRestoreCompleted,
  s3Replication,
  s3ReplicationOperationFailedReplication,
  s3ReplicationOperationNotTracked,
  s3ReplicationOperationMissedThreshold,
  s3ReplicationOperationReplicatedAfterThreshold,
}

extension on Event {
  String toValue() {
    switch (this) {
      case Event.s3ReducedRedundancyLostObject:
        return 's3:ReducedRedundancyLostObject';
      case Event.s3ObjectCreated:
        return 's3:ObjectCreated:*';
      case Event.s3ObjectCreatedPut:
        return 's3:ObjectCreated:Put';
      case Event.s3ObjectCreatedPost:
        return 's3:ObjectCreated:Post';
      case Event.s3ObjectCreatedCopy:
        return 's3:ObjectCreated:Copy';
      case Event.s3ObjectCreatedCompleteMultipartUpload:
        return 's3:ObjectCreated:CompleteMultipartUpload';
      case Event.s3ObjectRemoved:
        return 's3:ObjectRemoved:*';
      case Event.s3ObjectRemovedDelete:
        return 's3:ObjectRemoved:Delete';
      case Event.s3ObjectRemovedDeleteMarkerCreated:
        return 's3:ObjectRemoved:DeleteMarkerCreated';
      case Event.s3ObjectRestore:
        return 's3:ObjectRestore:*';
      case Event.s3ObjectRestorePost:
        return 's3:ObjectRestore:Post';
      case Event.s3ObjectRestoreCompleted:
        return 's3:ObjectRestore:Completed';
      case Event.s3Replication:
        return 's3:Replication:*';
      case Event.s3ReplicationOperationFailedReplication:
        return 's3:Replication:OperationFailedReplication';
      case Event.s3ReplicationOperationNotTracked:
        return 's3:Replication:OperationNotTracked';
      case Event.s3ReplicationOperationMissedThreshold:
        return 's3:Replication:OperationMissedThreshold';
      case Event.s3ReplicationOperationReplicatedAfterThreshold:
        return 's3:Replication:OperationReplicatedAfterThreshold';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  Event toEvent() {
    switch (this) {
      case 's3:ReducedRedundancyLostObject':
        return Event.s3ReducedRedundancyLostObject;
      case 's3:ObjectCreated:*':
        return Event.s3ObjectCreated;
      case 's3:ObjectCreated:Put':
        return Event.s3ObjectCreatedPut;
      case 's3:ObjectCreated:Post':
        return Event.s3ObjectCreatedPost;
      case 's3:ObjectCreated:Copy':
        return Event.s3ObjectCreatedCopy;
      case 's3:ObjectCreated:CompleteMultipartUpload':
        return Event.s3ObjectCreatedCompleteMultipartUpload;
      case 's3:ObjectRemoved:*':
        return Event.s3ObjectRemoved;
      case 's3:ObjectRemoved:Delete':
        return Event.s3ObjectRemovedDelete;
      case 's3:ObjectRemoved:DeleteMarkerCreated':
        return Event.s3ObjectRemovedDeleteMarkerCreated;
      case 's3:ObjectRestore:*':
        return Event.s3ObjectRestore;
      case 's3:ObjectRestore:Post':
        return Event.s3ObjectRestorePost;
      case 's3:ObjectRestore:Completed':
        return Event.s3ObjectRestoreCompleted;
      case 's3:Replication:*':
        return Event.s3Replication;
      case 's3:Replication:OperationFailedReplication':
        return Event.s3ReplicationOperationFailedReplication;
      case 's3:Replication:OperationNotTracked':
        return Event.s3ReplicationOperationNotTracked;
      case 's3:Replication:OperationMissedThreshold':
        return Event.s3ReplicationOperationMissedThreshold;
      case 's3:Replication:OperationReplicatedAfterThreshold':
        return Event.s3ReplicationOperationReplicatedAfterThreshold;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Optional configuration to replicate existing source bucket objects. For more
/// information, see <a href="
/// https://docs.aws.amazon.com/AmazonS3/latest/dev/replication-what-is-isnot-replicated.html#existing-object-replication">Replicating
/// Existing Objects</a> in the <i>Amazon S3 Developer Guide</i>.
class ExistingObjectReplication {
  /// <p/>
  final ExistingObjectReplicationStatus status;

  ExistingObjectReplication({
    @_s.required this.status,
  });
  factory ExistingObjectReplication.fromXml(_s.XmlElement elem) {
    return ExistingObjectReplication(
      status: _s
          .extractXmlStringValue(elem, 'Status')
          ?.toExistingObjectReplicationStatus(),
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

enum ExistingObjectReplicationStatus {
  enabled,
  disabled,
}

extension on ExistingObjectReplicationStatus {
  String toValue() {
    switch (this) {
      case ExistingObjectReplicationStatus.enabled:
        return 'Enabled';
      case ExistingObjectReplicationStatus.disabled:
        return 'Disabled';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  ExistingObjectReplicationStatus toExistingObjectReplicationStatus() {
    switch (this) {
      case 'Enabled':
        return ExistingObjectReplicationStatus.enabled;
      case 'Disabled':
        return ExistingObjectReplicationStatus.disabled;
    }
    throw Exception('Unknown enum value: $this');
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

enum ExpressionType {
  sql,
}

extension on ExpressionType {
  String toValue() {
    switch (this) {
      case ExpressionType.sql:
        return 'SQL';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  ExpressionType toExpressionType() {
    switch (this) {
      case 'SQL':
        return ExpressionType.sql;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum FileHeaderInfo {
  use,
  ignore,
  none,
}

extension on FileHeaderInfo {
  String toValue() {
    switch (this) {
      case FileHeaderInfo.use:
        return 'USE';
      case FileHeaderInfo.ignore:
        return 'IGNORE';
      case FileHeaderInfo.none:
        return 'NONE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  FileHeaderInfo toFileHeaderInfo() {
    switch (this) {
      case 'USE':
        return FileHeaderInfo.use;
      case 'IGNORE':
        return FileHeaderInfo.ignore;
      case 'NONE':
        return FileHeaderInfo.none;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Specifies the Amazon S3 object key name to filter on and whether to filter
/// on the suffix or prefix of the key name.
class FilterRule {
  /// The object key name prefix or suffix identifying one or more objects to
  /// which the filtering rule applies. The maximum length is 1,024 characters.
  /// Overlapping prefixes and suffixes are not supported. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html">Configuring
  /// Event Notifications</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  final FilterRuleName name;

  /// The value that the filter searches for in object key names.
  final String value;

  FilterRule({
    this.name,
    this.value,
  });
  factory FilterRule.fromXml(_s.XmlElement elem) {
    return FilterRule(
      name: _s.extractXmlStringValue(elem, 'Name')?.toFilterRuleName(),
      value: _s.extractXmlStringValue(elem, 'Value'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (name != null) _s.encodeXmlStringValue('Name', name.toValue()),
      if (value != null) _s.encodeXmlStringValue('Value', value),
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

enum FilterRuleName {
  prefix,
  suffix,
}

extension on FilterRuleName {
  String toValue() {
    switch (this) {
      case FilterRuleName.prefix:
        return 'prefix';
      case FilterRuleName.suffix:
        return 'suffix';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  FilterRuleName toFilterRuleName() {
    switch (this) {
      case 'prefix':
        return FilterRuleName.prefix;
      case 'suffix':
        return FilterRuleName.suffix;
    }
    throw Exception('Unknown enum value: $this');
  }
}

class GetBucketAccelerateConfigurationOutput {
  /// The accelerate configuration of the bucket.
  final BucketAccelerateStatus status;

  GetBucketAccelerateConfigurationOutput({
    this.status,
  });
  factory GetBucketAccelerateConfigurationOutput.fromXml(_s.XmlElement elem) {
    return GetBucketAccelerateConfigurationOutput(
      status:
          _s.extractXmlStringValue(elem, 'Status')?.toBucketAccelerateStatus(),
    );
  }
}

class GetBucketAclOutput {
  /// A list of grants.
  final List<Grant> grants;

  /// Container for the bucket owner's display name and ID.
  final Owner owner;

  GetBucketAclOutput({
    this.grants,
    this.owner,
  });
  factory GetBucketAclOutput.fromXml(_s.XmlElement elem) {
    return GetBucketAclOutput(
      grants: _s.extractXmlChild(elem, 'AccessControlList')?.let((elem) =>
          elem.findElements('Grant').map((c) => Grant.fromXml(c)).toList()),
      owner: _s.extractXmlChild(elem, 'Owner')?.let((e) => Owner.fromXml(e)),
    );
  }
}

class GetBucketAnalyticsConfigurationOutput {
  /// The configuration and any analyses for the analytics filter.
  final AnalyticsConfiguration analyticsConfiguration;

  GetBucketAnalyticsConfigurationOutput({
    this.analyticsConfiguration,
  });
  factory GetBucketAnalyticsConfigurationOutput.fromXml(_s.XmlElement elem) {
    return GetBucketAnalyticsConfigurationOutput(
      analyticsConfiguration:
          elem?.let((e) => AnalyticsConfiguration.fromXml(e)),
    );
  }
}

class GetBucketCorsOutput {
  /// A set of origins and methods (cross-origin access that you want to allow).
  /// You can add up to 100 rules to the configuration.
  final List<CORSRule> cORSRules;

  GetBucketCorsOutput({
    this.cORSRules,
  });
  factory GetBucketCorsOutput.fromXml(_s.XmlElement elem) {
    return GetBucketCorsOutput(
      cORSRules: elem
          .findElements('CORSRule')
          .map((c) => CORSRule.fromXml(c))
          .toList(),
    );
  }
}

class GetBucketEncryptionOutput {
  final ServerSideEncryptionConfiguration serverSideEncryptionConfiguration;

  GetBucketEncryptionOutput({
    this.serverSideEncryptionConfiguration,
  });
  factory GetBucketEncryptionOutput.fromXml(_s.XmlElement elem) {
    return GetBucketEncryptionOutput(
      serverSideEncryptionConfiguration:
          elem?.let((e) => ServerSideEncryptionConfiguration.fromXml(e)),
    );
  }
}

class GetBucketIntelligentTieringConfigurationOutput {
  /// Container for S3 Intelligent-Tiering configuration.
  final IntelligentTieringConfiguration intelligentTieringConfiguration;

  GetBucketIntelligentTieringConfigurationOutput({
    this.intelligentTieringConfiguration,
  });
  factory GetBucketIntelligentTieringConfigurationOutput.fromXml(
      _s.XmlElement elem) {
    return GetBucketIntelligentTieringConfigurationOutput(
      intelligentTieringConfiguration:
          elem?.let((e) => IntelligentTieringConfiguration.fromXml(e)),
    );
  }
}

class GetBucketInventoryConfigurationOutput {
  /// Specifies the inventory configuration.
  final InventoryConfiguration inventoryConfiguration;

  GetBucketInventoryConfigurationOutput({
    this.inventoryConfiguration,
  });
  factory GetBucketInventoryConfigurationOutput.fromXml(_s.XmlElement elem) {
    return GetBucketInventoryConfigurationOutput(
      inventoryConfiguration:
          elem?.let((e) => InventoryConfiguration.fromXml(e)),
    );
  }
}

class GetBucketLifecycleConfigurationOutput {
  /// Container for a lifecycle rule.
  final List<LifecycleRule> rules;

  GetBucketLifecycleConfigurationOutput({
    this.rules,
  });
  factory GetBucketLifecycleConfigurationOutput.fromXml(_s.XmlElement elem) {
    return GetBucketLifecycleConfigurationOutput(
      rules: elem
          .findElements('Rule')
          .map((c) => LifecycleRule.fromXml(c))
          .toList(),
    );
  }
}

class GetBucketLifecycleOutput {
  /// Container for a lifecycle rule.
  final List<Rule> rules;

  GetBucketLifecycleOutput({
    this.rules,
  });
  factory GetBucketLifecycleOutput.fromXml(_s.XmlElement elem) {
    return GetBucketLifecycleOutput(
      rules: elem.findElements('Rule').map((c) => Rule.fromXml(c)).toList(),
    );
  }
}

class GetBucketLocationOutput {
  /// Specifies the Region where the bucket resides. For a list of all the Amazon
  /// S3 supported location constraints by Region, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/rande.html#s3_region">Regions
  /// and Endpoints</a>. Buckets in Region <code>us-east-1</code> have a
  /// LocationConstraint of <code>null</code>.
  final BucketLocationConstraint locationConstraint;

  GetBucketLocationOutput({
    this.locationConstraint,
  });
  factory GetBucketLocationOutput.fromXml(_s.XmlElement elem) {
    return GetBucketLocationOutput(
      locationConstraint: _s
          .extractXmlStringValue(elem, 'LocationConstraint')
          ?.toBucketLocationConstraint(),
    );
  }
}

class GetBucketLoggingOutput {
  final LoggingEnabled loggingEnabled;

  GetBucketLoggingOutput({
    this.loggingEnabled,
  });
  factory GetBucketLoggingOutput.fromXml(_s.XmlElement elem) {
    return GetBucketLoggingOutput(
      loggingEnabled: _s
          .extractXmlChild(elem, 'LoggingEnabled')
          ?.let((e) => LoggingEnabled.fromXml(e)),
    );
  }
}

class GetBucketMetricsConfigurationOutput {
  /// Specifies the metrics configuration.
  final MetricsConfiguration metricsConfiguration;

  GetBucketMetricsConfigurationOutput({
    this.metricsConfiguration,
  });
  factory GetBucketMetricsConfigurationOutput.fromXml(_s.XmlElement elem) {
    return GetBucketMetricsConfigurationOutput(
      metricsConfiguration: elem?.let((e) => MetricsConfiguration.fromXml(e)),
    );
  }
}

class GetBucketOwnershipControlsOutput {
  /// The <code>OwnershipControls</code> (BucketOwnerPreferred or ObjectWriter)
  /// currently in effect for this Amazon S3 bucket.
  final OwnershipControls ownershipControls;

  GetBucketOwnershipControlsOutput({
    this.ownershipControls,
  });
  factory GetBucketOwnershipControlsOutput.fromXml(_s.XmlElement elem) {
    return GetBucketOwnershipControlsOutput(
      ownershipControls: elem?.let((e) => OwnershipControls.fromXml(e)),
    );
  }
}

class GetBucketPolicyOutput {
  /// The bucket policy as a JSON document.
  final String policy;

  GetBucketPolicyOutput({
    this.policy,
  });
  factory GetBucketPolicyOutput.fromXml(_s.XmlElement elem) {
    return GetBucketPolicyOutput(
      policy: _s.extractXmlStringValue(elem, 'Policy'),
    );
  }
}

class GetBucketPolicyStatusOutput {
  /// The policy status for the specified bucket.
  final PolicyStatus policyStatus;

  GetBucketPolicyStatusOutput({
    this.policyStatus,
  });
  factory GetBucketPolicyStatusOutput.fromXml(_s.XmlElement elem) {
    return GetBucketPolicyStatusOutput(
      policyStatus: elem?.let((e) => PolicyStatus.fromXml(e)),
    );
  }
}

class GetBucketReplicationOutput {
  final ReplicationConfiguration replicationConfiguration;

  GetBucketReplicationOutput({
    this.replicationConfiguration,
  });
  factory GetBucketReplicationOutput.fromXml(_s.XmlElement elem) {
    return GetBucketReplicationOutput(
      replicationConfiguration:
          elem?.let((e) => ReplicationConfiguration.fromXml(e)),
    );
  }
}

class GetBucketRequestPaymentOutput {
  /// Specifies who pays for the download and request fees.
  final Payer payer;

  GetBucketRequestPaymentOutput({
    this.payer,
  });
  factory GetBucketRequestPaymentOutput.fromXml(_s.XmlElement elem) {
    return GetBucketRequestPaymentOutput(
      payer: _s.extractXmlStringValue(elem, 'Payer')?.toPayer(),
    );
  }
}

class GetBucketTaggingOutput {
  /// Contains the tag set.
  final List<Tag> tagSet;

  GetBucketTaggingOutput({
    @_s.required this.tagSet,
  });
  factory GetBucketTaggingOutput.fromXml(_s.XmlElement elem) {
    return GetBucketTaggingOutput(
      tagSet: _s.extractXmlChild(elem, 'TagSet')?.let((elem) =>
          elem.findElements('Tag').map((c) => Tag.fromXml(c)).toList()),
    );
  }
}

class GetBucketVersioningOutput {
  /// Specifies whether MFA delete is enabled in the bucket versioning
  /// configuration. This element is only returned if the bucket has been
  /// configured with MFA delete. If the bucket has never been so configured, this
  /// element is not returned.
  final MFADeleteStatus mFADelete;

  /// The versioning state of the bucket.
  final BucketVersioningStatus status;

  GetBucketVersioningOutput({
    this.mFADelete,
    this.status,
  });
  factory GetBucketVersioningOutput.fromXml(_s.XmlElement elem) {
    return GetBucketVersioningOutput(
      mFADelete:
          _s.extractXmlStringValue(elem, 'MfaDelete')?.toMFADeleteStatus(),
      status:
          _s.extractXmlStringValue(elem, 'Status')?.toBucketVersioningStatus(),
    );
  }
}

class GetBucketWebsiteOutput {
  /// The object key name of the website error document to use for 4XX class
  /// errors.
  final ErrorDocument errorDocument;

  /// The name of the index document for the website (for example
  /// <code>index.html</code>).
  final IndexDocument indexDocument;

  /// Specifies the redirect behavior of all requests to a website endpoint of an
  /// Amazon S3 bucket.
  final RedirectAllRequestsTo redirectAllRequestsTo;

  /// Rules that define when a redirect is applied and the redirect behavior.
  final List<RoutingRule> routingRules;

  GetBucketWebsiteOutput({
    this.errorDocument,
    this.indexDocument,
    this.redirectAllRequestsTo,
    this.routingRules,
  });
  factory GetBucketWebsiteOutput.fromXml(_s.XmlElement elem) {
    return GetBucketWebsiteOutput(
      errorDocument: _s
          .extractXmlChild(elem, 'ErrorDocument')
          ?.let((e) => ErrorDocument.fromXml(e)),
      indexDocument: _s
          .extractXmlChild(elem, 'IndexDocument')
          ?.let((e) => IndexDocument.fromXml(e)),
      redirectAllRequestsTo: _s
          .extractXmlChild(elem, 'RedirectAllRequestsTo')
          ?.let((e) => RedirectAllRequestsTo.fromXml(e)),
      routingRules: _s.extractXmlChild(elem, 'RoutingRules')?.let((elem) => elem
          .findElements('RoutingRule')
          .map((c) => RoutingRule.fromXml(c))
          .toList()),
    );
  }
}

class GetObjectAclOutput {
  /// A list of grants.
  final List<Grant> grants;

  /// Container for the bucket owner's display name and ID.
  final Owner owner;
  final RequestCharged requestCharged;

  GetObjectAclOutput({
    this.grants,
    this.owner,
    this.requestCharged,
  });
}

class GetObjectLegalHoldOutput {
  /// The current Legal Hold status for the specified object.
  final ObjectLockLegalHold legalHold;

  GetObjectLegalHoldOutput({
    this.legalHold,
  });
  factory GetObjectLegalHoldOutput.fromXml(_s.XmlElement elem) {
    return GetObjectLegalHoldOutput(
      legalHold: elem?.let((e) => ObjectLockLegalHold.fromXml(e)),
    );
  }
}

class GetObjectLockConfigurationOutput {
  /// The specified bucket's Object Lock configuration.
  final ObjectLockConfiguration objectLockConfiguration;

  GetObjectLockConfigurationOutput({
    this.objectLockConfiguration,
  });
  factory GetObjectLockConfigurationOutput.fromXml(_s.XmlElement elem) {
    return GetObjectLockConfigurationOutput(
      objectLockConfiguration:
          elem?.let((e) => ObjectLockConfiguration.fromXml(e)),
    );
  }
}

class GetObjectOutput {
  /// Indicates that a range of bytes was specified.
  final String acceptRanges;

  /// Object data.
  final Uint8List body;

  /// Indicates whether the object uses an S3 Bucket Key for server-side
  /// encryption with AWS KMS (SSE-KMS).
  final bool bucketKeyEnabled;

  /// Specifies caching behavior along the request/reply chain.
  final String cacheControl;

  /// Specifies presentational information for the object.
  final String contentDisposition;

  /// Specifies what content encodings have been applied to the object and thus
  /// what decoding mechanisms must be applied to obtain the media-type referenced
  /// by the Content-Type header field.
  final String contentEncoding;

  /// The language the content is in.
  final String contentLanguage;

  /// Size of the body in bytes.
  final int contentLength;

  /// The portion of the object returned in the response.
  final String contentRange;

  /// A standard MIME type describing the format of the object data.
  final String contentType;

  /// Specifies whether the object retrieved was (true) or was not (false) a
  /// Delete Marker. If false, this response header does not appear in the
  /// response.
  final bool deleteMarker;

  /// An ETag is an opaque identifier assigned by a web server to a specific
  /// version of a resource found at a URL.
  final String eTag;

  /// If the object expiration is configured (see PUT Bucket lifecycle), the
  /// response includes this header. It includes the expiry-date and rule-id
  /// key-value pairs providing object expiration information. The value of the
  /// rule-id is URL encoded.
  final String expiration;

  /// The date and time at which the object is no longer cacheable.
  final DateTime expires;

  /// Last modified date of the object
  final DateTime lastModified;

  /// A map of metadata to store with the object in S3.
  final Map<String, String> metadata;

  /// This is set to the number of metadata entries not returned in
  /// <code>x-amz-meta</code> headers. This can happen if you create metadata
  /// using an API like SOAP that supports more flexible metadata than the REST
  /// API. For example, using SOAP, you can create metadata whose values are not
  /// legal HTTP headers.
  final int missingMeta;

  /// Indicates whether this object has an active legal hold. This field is only
  /// returned if you have permission to view an object's legal hold status.
  final ObjectLockLegalHoldStatus objectLockLegalHoldStatus;

  /// The Object Lock mode currently in place for this object.
  final ObjectLockMode objectLockMode;

  /// The date and time when this object's Object Lock will expire.
  final DateTime objectLockRetainUntilDate;

  /// The count of parts this object has.
  final int partsCount;

  /// Amazon S3 can return this if your request involves a bucket that is either a
  /// source or destination in a replication rule.
  final ReplicationStatus replicationStatus;
  final RequestCharged requestCharged;

  /// Provides information about object restoration operation and expiration time
  /// of the restored object copy.
  final String restore;

  /// If server-side encryption with a customer-provided encryption key was
  /// requested, the response will include this header confirming the encryption
  /// algorithm used.
  final String sSECustomerAlgorithm;

  /// If server-side encryption with a customer-provided encryption key was
  /// requested, the response will include this header to provide round-trip
  /// message integrity verification of the customer-provided encryption key.
  final String sSECustomerKeyMD5;

  /// If present, specifies the ID of the AWS Key Management Service (AWS KMS)
  /// symmetric customer managed customer master key (CMK) that was used for the
  /// object.
  final String sSEKMSKeyId;

  /// The server-side encryption algorithm used when storing this object in Amazon
  /// S3 (for example, AES256, aws:kms).
  final ServerSideEncryption serverSideEncryption;

  /// Provides storage class information of the object. Amazon S3 returns this
  /// header for all objects except for S3 Standard storage class objects.
  final StorageClass storageClass;

  /// The number of tags, if any, on the object.
  final int tagCount;

  /// Version of the object.
  final String versionId;

  /// If the bucket is configured as a website, redirects requests for this object
  /// to another object in the same bucket or to an external URL. Amazon S3 stores
  /// the value of this header in the object metadata.
  final String websiteRedirectLocation;

  GetObjectOutput({
    this.acceptRanges,
    this.body,
    this.bucketKeyEnabled,
    this.cacheControl,
    this.contentDisposition,
    this.contentEncoding,
    this.contentLanguage,
    this.contentLength,
    this.contentRange,
    this.contentType,
    this.deleteMarker,
    this.eTag,
    this.expiration,
    this.expires,
    this.lastModified,
    this.metadata,
    this.missingMeta,
    this.objectLockLegalHoldStatus,
    this.objectLockMode,
    this.objectLockRetainUntilDate,
    this.partsCount,
    this.replicationStatus,
    this.requestCharged,
    this.restore,
    this.sSECustomerAlgorithm,
    this.sSECustomerKeyMD5,
    this.sSEKMSKeyId,
    this.serverSideEncryption,
    this.storageClass,
    this.tagCount,
    this.versionId,
    this.websiteRedirectLocation,
  });
}

class GetObjectRetentionOutput {
  /// The container element for an object's retention settings.
  final ObjectLockRetention retention;

  GetObjectRetentionOutput({
    this.retention,
  });
  factory GetObjectRetentionOutput.fromXml(_s.XmlElement elem) {
    return GetObjectRetentionOutput(
      retention: elem?.let((e) => ObjectLockRetention.fromXml(e)),
    );
  }
}

class GetObjectTaggingOutput {
  /// Contains the tag set.
  final List<Tag> tagSet;

  /// The versionId of the object for which you got the tagging information.
  final String versionId;

  GetObjectTaggingOutput({
    @_s.required this.tagSet,
    this.versionId,
  });
}

class GetObjectTorrentOutput {
  /// A Bencoded dictionary as defined by the BitTorrent specification
  final Uint8List body;
  final RequestCharged requestCharged;

  GetObjectTorrentOutput({
    this.body,
    this.requestCharged,
  });
}

class GetPublicAccessBlockOutput {
  /// The <code>PublicAccessBlock</code> configuration currently in effect for
  /// this Amazon S3 bucket.
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

/// Container for S3 Glacier job parameters.
class GlacierJobParameters {
  /// Retrieval tier at which the restore will be processed.
  final Tier tier;

  GlacierJobParameters({
    @_s.required this.tier,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Tier', tier?.toValue() ?? ''),
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

/// Container for grant information.
class Grant {
  /// The person being granted permissions.
  final Grantee grantee;

  /// Specifies the permission given to the grantee.
  final Permission permission;

  Grant({
    this.grantee,
    this.permission,
  });
  factory Grant.fromXml(_s.XmlElement elem) {
    return Grant(
      grantee:
          _s.extractXmlChild(elem, 'Grantee')?.let((e) => Grantee.fromXml(e)),
      permission: _s.extractXmlStringValue(elem, 'Permission')?.toPermission(),
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

/// Container for the person being granted permissions.
class Grantee {
  /// Type of grantee
  final Type type;

  /// Screen name of the grantee.
  final String displayName;

  /// Email address of the grantee.
  /// <note>
  /// Using email addresses to specify a grantee is only supported in the
  /// following AWS Regions:
  ///
  /// <ul>
  /// <li>
  /// US East (N. Virginia)
  /// </li>
  /// <li>
  /// US West (N. California)
  /// </li>
  /// <li>
  /// US West (Oregon)
  /// </li>
  /// <li>
  /// Asia Pacific (Singapore)
  /// </li>
  /// <li>
  /// Asia Pacific (Sydney)
  /// </li>
  /// <li>
  /// Asia Pacific (Tokyo)
  /// </li>
  /// <li>
  /// Europe (Ireland)
  /// </li>
  /// <li>
  /// South America (São Paulo)
  /// </li>
  /// </ul>
  /// For a list of all the Amazon S3 supported Regions and endpoints, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/rande.html#s3_region">Regions
  /// and Endpoints</a> in the AWS General Reference.
  /// </note>
  final String emailAddress;

  /// The canonical user ID of the grantee.
  final String id;

  /// URI of the grantee group.
  final String uri;

  Grantee({
    @_s.required this.type,
    this.displayName,
    this.emailAddress,
    this.id,
    this.uri,
  });
  factory Grantee.fromXml(_s.XmlElement elem) {
    return Grantee(
      type: _s.extractXmlStringAttribute(elem, 'xsi:type')?.toType(),
      displayName: _s.extractXmlStringValue(elem, 'DisplayName'),
      emailAddress: _s.extractXmlStringValue(elem, 'EmailAddress'),
      id: _s.extractXmlStringValue(elem, 'ID'),
      uri: _s.extractXmlStringValue(elem, 'URI'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (displayName != null)
        _s.encodeXmlStringValue('DisplayName', displayName),
      if (emailAddress != null)
        _s.encodeXmlStringValue('EmailAddress', emailAddress),
      if (id != null) _s.encodeXmlStringValue('ID', id),
      if (uri != null) _s.encodeXmlStringValue('URI', uri),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
      _s.XmlAttribute(_s.XmlName('xsi', 'xmlns'),
          'http://www.w3.org/2001/XMLSchema-instance'),
      if (type != null) _s.XmlAttribute(_s.XmlName('xsi:type'), type.toValue()),
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

class HeadObjectOutput {
  /// Indicates that a range of bytes was specified.
  final String acceptRanges;

  /// The archive state of the head object.
  final ArchiveStatus archiveStatus;

  /// Indicates whether the object uses an S3 Bucket Key for server-side
  /// encryption with AWS KMS (SSE-KMS).
  final bool bucketKeyEnabled;

  /// Specifies caching behavior along the request/reply chain.
  final String cacheControl;

  /// Specifies presentational information for the object.
  final String contentDisposition;

  /// Specifies what content encodings have been applied to the object and thus
  /// what decoding mechanisms must be applied to obtain the media-type referenced
  /// by the Content-Type header field.
  final String contentEncoding;

  /// The language the content is in.
  final String contentLanguage;

  /// Size of the body in bytes.
  final int contentLength;

  /// A standard MIME type describing the format of the object data.
  final String contentType;

  /// Specifies whether the object retrieved was (true) or was not (false) a
  /// Delete Marker. If false, this response header does not appear in the
  /// response.
  final bool deleteMarker;

  /// An ETag is an opaque identifier assigned by a web server to a specific
  /// version of a resource found at a URL.
  final String eTag;

  /// If the object expiration is configured (see PUT Bucket lifecycle), the
  /// response includes this header. It includes the expiry-date and rule-id
  /// key-value pairs providing object expiration information. The value of the
  /// rule-id is URL encoded.
  final String expiration;

  /// The date and time at which the object is no longer cacheable.
  final DateTime expires;

  /// Last modified date of the object
  final DateTime lastModified;

  /// A map of metadata to store with the object in S3.
  final Map<String, String> metadata;

  /// This is set to the number of metadata entries not returned in
  /// <code>x-amz-meta</code> headers. This can happen if you create metadata
  /// using an API like SOAP that supports more flexible metadata than the REST
  /// API. For example, using SOAP, you can create metadata whose values are not
  /// legal HTTP headers.
  final int missingMeta;

  /// Specifies whether a legal hold is in effect for this object. This header is
  /// only returned if the requester has the <code>s3:GetObjectLegalHold</code>
  /// permission. This header is not returned if the specified version of this
  /// object has never had a legal hold applied. For more information about S3
  /// Object Lock, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lock.html">Object
  /// Lock</a>.
  final ObjectLockLegalHoldStatus objectLockLegalHoldStatus;

  /// The Object Lock mode, if any, that's in effect for this object. This header
  /// is only returned if the requester has the <code>s3:GetObjectRetention</code>
  /// permission. For more information about S3 Object Lock, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lock.html">Object
  /// Lock</a>.
  final ObjectLockMode objectLockMode;

  /// The date and time when the Object Lock retention period expires. This header
  /// is only returned if the requester has the <code>s3:GetObjectRetention</code>
  /// permission.
  final DateTime objectLockRetainUntilDate;

  /// The count of parts this object has.
  final int partsCount;

  /// Amazon S3 can return this header if your request involves a bucket that is
  /// either a source or a destination in a replication rule.
  ///
  /// In replication, you have a source bucket on which you configure replication
  /// and destination bucket or buckets where Amazon S3 stores object replicas.
  /// When you request an object (<code>GetObject</code>) or object metadata
  /// (<code>HeadObject</code>) from these buckets, Amazon S3 will return the
  /// <code>x-amz-replication-status</code> header in the response as follows:
  ///
  /// <ul>
  /// <li>
  /// If requesting an object from the source bucket — Amazon S3 will return the
  /// <code>x-amz-replication-status</code> header if the object in your request
  /// is eligible for replication.
  ///
  /// For example, suppose that in your replication configuration, you specify
  /// object prefix <code>TaxDocs</code> requesting Amazon S3 to replicate objects
  /// with key prefix <code>TaxDocs</code>. Any objects you upload with this key
  /// name prefix, for example <code>TaxDocs/document1.pdf</code>, are eligible
  /// for replication. For any object request with this key name prefix, Amazon S3
  /// will return the <code>x-amz-replication-status</code> header with value
  /// PENDING, COMPLETED or FAILED indicating object replication status.
  /// </li>
  /// <li>
  /// If requesting an object from a destination bucket — Amazon S3 will return
  /// the <code>x-amz-replication-status</code> header with value REPLICA if the
  /// object in your request is a replica that Amazon S3 created and there is no
  /// replica modification replication in progress.
  /// </li>
  /// <li>
  /// When replicating objects to multiple destination buckets the
  /// <code>x-amz-replication-status</code> header acts differently. The header of
  /// the source object will only return a value of COMPLETED when replication is
  /// successful to all destinations. The header will remain at value PENDING
  /// until replication has completed for all destinations. If one or more
  /// destinations fails replication the header will return FAILED.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html">Replication</a>.
  final ReplicationStatus replicationStatus;
  final RequestCharged requestCharged;

  /// If the object is an archived object (an object whose storage class is
  /// GLACIER), the response includes this header if either the archive
  /// restoration is in progress (see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_RestoreObject.html">RestoreObject</a>
  /// or an archive copy is already restored.
  ///
  /// If an archive copy is already restored, the header value indicates when
  /// Amazon S3 is scheduled to delete the object copy. For example:
  ///
  /// <code>x-amz-restore: ongoing-request="false", expiry-date="Fri, 23 Dec 2012
  /// 00:00:00 GMT"</code>
  ///
  /// If the object restoration is in progress, the header returns the value
  /// <code>ongoing-request="true"</code>.
  ///
  /// For more information about archiving objects, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lifecycle-mgmt.html#lifecycle-transition-general-considerations">Transitioning
  /// Objects: General Considerations</a>.
  final String restore;

  /// If server-side encryption with a customer-provided encryption key was
  /// requested, the response will include this header confirming the encryption
  /// algorithm used.
  final String sSECustomerAlgorithm;

  /// If server-side encryption with a customer-provided encryption key was
  /// requested, the response will include this header to provide round-trip
  /// message integrity verification of the customer-provided encryption key.
  final String sSECustomerKeyMD5;

  /// If present, specifies the ID of the AWS Key Management Service (AWS KMS)
  /// symmetric customer managed customer master key (CMK) that was used for the
  /// object.
  final String sSEKMSKeyId;

  /// If the object is stored using server-side encryption either with an AWS KMS
  /// customer master key (CMK) or an Amazon S3-managed encryption key, the
  /// response includes this header with the value of the server-side encryption
  /// algorithm used when storing this object in Amazon S3 (for example, AES256,
  /// aws:kms).
  final ServerSideEncryption serverSideEncryption;

  /// Provides storage class information of the object. Amazon S3 returns this
  /// header for all objects except for S3 Standard storage class objects.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-class-intro.html">Storage
  /// Classes</a>.
  final StorageClass storageClass;

  /// Version of the object.
  final String versionId;

  /// If the bucket is configured as a website, redirects requests for this object
  /// to another object in the same bucket or to an external URL. Amazon S3 stores
  /// the value of this header in the object metadata.
  final String websiteRedirectLocation;

  HeadObjectOutput({
    this.acceptRanges,
    this.archiveStatus,
    this.bucketKeyEnabled,
    this.cacheControl,
    this.contentDisposition,
    this.contentEncoding,
    this.contentLanguage,
    this.contentLength,
    this.contentType,
    this.deleteMarker,
    this.eTag,
    this.expiration,
    this.expires,
    this.lastModified,
    this.metadata,
    this.missingMeta,
    this.objectLockLegalHoldStatus,
    this.objectLockMode,
    this.objectLockRetainUntilDate,
    this.partsCount,
    this.replicationStatus,
    this.requestCharged,
    this.restore,
    this.sSECustomerAlgorithm,
    this.sSECustomerKeyMD5,
    this.sSEKMSKeyId,
    this.serverSideEncryption,
    this.storageClass,
    this.versionId,
    this.websiteRedirectLocation,
  });
}

/// Container for the <code>Suffix</code> element.
class IndexDocument {
  /// A suffix that is appended to a request that is for a directory on the
  /// website endpoint (for example,if the suffix is index.html and you make a
  /// request to samplebucket/images/ the data that is returned will be for the
  /// object with the key name images/index.html) The suffix must not be empty and
  /// must not include a slash character.
  final String suffix;

  IndexDocument({
    @_s.required this.suffix,
  });
  factory IndexDocument.fromXml(_s.XmlElement elem) {
    return IndexDocument(
      suffix: _s.extractXmlStringValue(elem, 'Suffix'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Suffix', suffix),
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

/// Container element that identifies who initiated the multipart upload.
class Initiator {
  /// Name of the Principal.
  final String displayName;

  /// If the principal is an AWS account, it provides the Canonical User ID. If
  /// the principal is an IAM User, it provides a user ARN value.
  final String id;

  Initiator({
    this.displayName,
    this.id,
  });
  factory Initiator.fromXml(_s.XmlElement elem) {
    return Initiator(
      displayName: _s.extractXmlStringValue(elem, 'DisplayName'),
      id: _s.extractXmlStringValue(elem, 'ID'),
    );
  }
}

/// Describes the serialization format of the object.
class InputSerialization {
  /// Describes the serialization of a CSV-encoded object.
  final CSVInput csv;

  /// Specifies object's compression format. Valid values: NONE, GZIP, BZIP2.
  /// Default Value: NONE.
  final CompressionType compressionType;

  /// Specifies JSON as object's input serialization format.
  final JSONInput json;

  /// Specifies Parquet as object's input serialization format.
  final ParquetInput parquet;

  InputSerialization({
    this.csv,
    this.compressionType,
    this.json,
    this.parquet,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (csv != null) csv?.toXml('CSV'),
      if (compressionType != null)
        _s.encodeXmlStringValue('CompressionType', compressionType.toValue()),
      if (json != null) json?.toXml('JSON'),
      if (parquet != null) parquet?.toXml('Parquet'),
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

enum IntelligentTieringAccessTier {
  archiveAccess,
  deepArchiveAccess,
}

extension on IntelligentTieringAccessTier {
  String toValue() {
    switch (this) {
      case IntelligentTieringAccessTier.archiveAccess:
        return 'ARCHIVE_ACCESS';
      case IntelligentTieringAccessTier.deepArchiveAccess:
        return 'DEEP_ARCHIVE_ACCESS';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  IntelligentTieringAccessTier toIntelligentTieringAccessTier() {
    switch (this) {
      case 'ARCHIVE_ACCESS':
        return IntelligentTieringAccessTier.archiveAccess;
      case 'DEEP_ARCHIVE_ACCESS':
        return IntelligentTieringAccessTier.deepArchiveAccess;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// A container for specifying S3 Intelligent-Tiering filters. The filters
/// determine the subset of objects to which the rule applies.
class IntelligentTieringAndOperator {
  /// An object key name prefix that identifies the subset of objects to which the
  /// configuration applies.
  final String prefix;

  /// All of these tags must exist in the object's tag set in order for the
  /// configuration to apply.
  final List<Tag> tags;

  IntelligentTieringAndOperator({
    this.prefix,
    this.tags,
  });
  factory IntelligentTieringAndOperator.fromXml(_s.XmlElement elem) {
    return IntelligentTieringAndOperator(
      prefix: _s.extractXmlStringValue(elem, 'Prefix'),
      tags: elem.findElements('Tag').map((c) => Tag.fromXml(c)).toList(),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (prefix != null) _s.encodeXmlStringValue('Prefix', prefix),
      if (tags != null) ...tags.map((e) => e?.toXml('Tag')),
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

/// Specifies the S3 Intelligent-Tiering configuration for an Amazon S3 bucket.
///
/// For information about the S3 Intelligent-Tiering storage class, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-class-intro.html#sc-dynamic-data-access">Storage
/// class for automatically optimizing frequently and infrequently accessed
/// objects</a>.
class IntelligentTieringConfiguration {
  /// The ID used to identify the S3 Intelligent-Tiering configuration.
  final String id;

  /// Specifies the status of the configuration.
  final IntelligentTieringStatus status;

  /// Specifies the S3 Intelligent-Tiering storage class tier of the
  /// configuration.
  final List<Tiering> tierings;

  /// Specifies a bucket filter. The configuration only includes objects that meet
  /// the filter's criteria.
  final IntelligentTieringFilter filter;

  IntelligentTieringConfiguration({
    @_s.required this.id,
    @_s.required this.status,
    @_s.required this.tierings,
    this.filter,
  });
  factory IntelligentTieringConfiguration.fromXml(_s.XmlElement elem) {
    return IntelligentTieringConfiguration(
      id: _s.extractXmlStringValue(elem, 'Id'),
      status: _s
          .extractXmlStringValue(elem, 'Status')
          ?.toIntelligentTieringStatus(),
      tierings:
          elem.findElements('Tiering').map((c) => Tiering.fromXml(c)).toList(),
      filter: _s
          .extractXmlChild(elem, 'Filter')
          ?.let((e) => IntelligentTieringFilter.fromXml(e)),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Id', id),
      if (filter != null) filter?.toXml('Filter'),
      _s.encodeXmlStringValue('Status', status?.toValue() ?? ''),
      ...tierings?.map((e) => e?.toXml('Tiering')),
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

/// The <code>Filter</code> is used to identify objects that the S3
/// Intelligent-Tiering configuration applies to.
class IntelligentTieringFilter {
  /// A conjunction (logical AND) of predicates, which is used in evaluating a
  /// metrics filter. The operator must have at least two predicates, and an
  /// object must match all of the predicates in order for the filter to apply.
  final IntelligentTieringAndOperator and;

  /// An object key name prefix that identifies the subset of objects to which the
  /// rule applies.
  final String prefix;
  final Tag tag;

  IntelligentTieringFilter({
    this.and,
    this.prefix,
    this.tag,
  });
  factory IntelligentTieringFilter.fromXml(_s.XmlElement elem) {
    return IntelligentTieringFilter(
      and: _s
          .extractXmlChild(elem, 'And')
          ?.let((e) => IntelligentTieringAndOperator.fromXml(e)),
      prefix: _s.extractXmlStringValue(elem, 'Prefix'),
      tag: _s.extractXmlChild(elem, 'Tag')?.let((e) => Tag.fromXml(e)),
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

enum IntelligentTieringStatus {
  enabled,
  disabled,
}

extension on IntelligentTieringStatus {
  String toValue() {
    switch (this) {
      case IntelligentTieringStatus.enabled:
        return 'Enabled';
      case IntelligentTieringStatus.disabled:
        return 'Disabled';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  IntelligentTieringStatus toIntelligentTieringStatus() {
    switch (this) {
      case 'Enabled':
        return IntelligentTieringStatus.enabled;
      case 'Disabled':
        return IntelligentTieringStatus.disabled;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Specifies the inventory configuration for an Amazon S3 bucket. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTBucketGETInventoryConfig.html">GET
/// Bucket inventory</a> in the <i>Amazon Simple Storage Service API
/// Reference</i>.
class InventoryConfiguration {
  /// Contains information about where to publish the inventory results.
  final InventoryDestination destination;

  /// The ID used to identify the inventory configuration.
  final String id;

  /// Object versions to include in the inventory list. If set to
  /// <code>All</code>, the list includes all the object versions, which adds the
  /// version-related fields <code>VersionId</code>, <code>IsLatest</code>, and
  /// <code>DeleteMarker</code> to the list. If set to <code>Current</code>, the
  /// list does not contain these version-related fields.
  final InventoryIncludedObjectVersions includedObjectVersions;

  /// Specifies whether the inventory is enabled or disabled. If set to
  /// <code>True</code>, an inventory list is generated. If set to
  /// <code>False</code>, no inventory list is generated.
  final bool isEnabled;

  /// Specifies the schedule for generating inventory results.
  final InventorySchedule schedule;

  /// Specifies an inventory filter. The inventory only includes objects that meet
  /// the filter's criteria.
  final InventoryFilter filter;

  /// Contains the optional fields that are included in the inventory results.
  final List<InventoryOptionalField> optionalFields;

  InventoryConfiguration({
    @_s.required this.destination,
    @_s.required this.id,
    @_s.required this.includedObjectVersions,
    @_s.required this.isEnabled,
    @_s.required this.schedule,
    this.filter,
    this.optionalFields,
  });
  factory InventoryConfiguration.fromXml(_s.XmlElement elem) {
    return InventoryConfiguration(
      destination: _s
          .extractXmlChild(elem, 'Destination')
          ?.let((e) => InventoryDestination.fromXml(e)),
      id: _s.extractXmlStringValue(elem, 'Id'),
      includedObjectVersions: _s
          .extractXmlStringValue(elem, 'IncludedObjectVersions')
          ?.toInventoryIncludedObjectVersions(),
      isEnabled: _s.extractXmlBoolValue(elem, 'IsEnabled'),
      schedule: _s
          .extractXmlChild(elem, 'Schedule')
          ?.let((e) => InventorySchedule.fromXml(e)),
      filter: _s
          .extractXmlChild(elem, 'Filter')
          ?.let((e) => InventoryFilter.fromXml(e)),
      optionalFields: _s.extractXmlChild(elem, 'OptionalFields')?.let((elem) =>
          _s
              .extractXmlStringListValues(elem, 'Field')
              .map((s) => s.toInventoryOptionalField())
              .toList()),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      destination?.toXml('Destination'),
      _s.encodeXmlBoolValue('IsEnabled', isEnabled),
      if (filter != null) filter?.toXml('Filter'),
      _s.encodeXmlStringValue('Id', id),
      _s.encodeXmlStringValue(
          'IncludedObjectVersions', includedObjectVersions?.toValue() ?? ''),
      if (optionalFields != null)
        _s.XmlElement(
            _s.XmlName('OptionalFields'),
            [],
            optionalFields.map(
                (e) => _s.encodeXmlStringValue('Field', e?.toValue() ?? ''))),
      schedule?.toXml('Schedule'),
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

/// Specifies the inventory configuration for an Amazon S3 bucket.
class InventoryDestination {
  /// Contains the bucket name, file format, bucket owner (optional), and prefix
  /// (optional) where inventory results are published.
  final InventoryS3BucketDestination s3BucketDestination;

  InventoryDestination({
    @_s.required this.s3BucketDestination,
  });
  factory InventoryDestination.fromXml(_s.XmlElement elem) {
    return InventoryDestination(
      s3BucketDestination: _s
          .extractXmlChild(elem, 'S3BucketDestination')
          ?.let((e) => InventoryS3BucketDestination.fromXml(e)),
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

/// Contains the type of server-side encryption used to encrypt the inventory
/// results.
class InventoryEncryption {
  /// Specifies the use of SSE-KMS to encrypt delivered inventory reports.
  final SSEKMS ssekms;

  /// Specifies the use of SSE-S3 to encrypt delivered inventory reports.
  final SSES3 sses3;

  InventoryEncryption({
    this.ssekms,
    this.sses3,
  });
  factory InventoryEncryption.fromXml(_s.XmlElement elem) {
    return InventoryEncryption(
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

/// Specifies an inventory filter. The inventory only includes objects that meet
/// the filter's criteria.
class InventoryFilter {
  /// The prefix that an object must have to be included in the inventory results.
  final String prefix;

  InventoryFilter({
    @_s.required this.prefix,
  });
  factory InventoryFilter.fromXml(_s.XmlElement elem) {
    return InventoryFilter(
      prefix: _s.extractXmlStringValue(elem, 'Prefix'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Prefix', prefix),
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

enum InventoryFormat {
  csv,
  orc,
  parquet,
}

extension on InventoryFormat {
  String toValue() {
    switch (this) {
      case InventoryFormat.csv:
        return 'CSV';
      case InventoryFormat.orc:
        return 'ORC';
      case InventoryFormat.parquet:
        return 'Parquet';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  InventoryFormat toInventoryFormat() {
    switch (this) {
      case 'CSV':
        return InventoryFormat.csv;
      case 'ORC':
        return InventoryFormat.orc;
      case 'Parquet':
        return InventoryFormat.parquet;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum InventoryFrequency {
  daily,
  weekly,
}

extension on InventoryFrequency {
  String toValue() {
    switch (this) {
      case InventoryFrequency.daily:
        return 'Daily';
      case InventoryFrequency.weekly:
        return 'Weekly';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  InventoryFrequency toInventoryFrequency() {
    switch (this) {
      case 'Daily':
        return InventoryFrequency.daily;
      case 'Weekly':
        return InventoryFrequency.weekly;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum InventoryIncludedObjectVersions {
  all,
  current,
}

extension on InventoryIncludedObjectVersions {
  String toValue() {
    switch (this) {
      case InventoryIncludedObjectVersions.all:
        return 'All';
      case InventoryIncludedObjectVersions.current:
        return 'Current';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  InventoryIncludedObjectVersions toInventoryIncludedObjectVersions() {
    switch (this) {
      case 'All':
        return InventoryIncludedObjectVersions.all;
      case 'Current':
        return InventoryIncludedObjectVersions.current;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum InventoryOptionalField {
  size,
  lastModifiedDate,
  storageClass,
  eTag,
  isMultipartUploaded,
  replicationStatus,
  encryptionStatus,
  objectLockRetainUntilDate,
  objectLockMode,
  objectLockLegalHoldStatus,
  intelligentTieringAccessTier,
}

extension on InventoryOptionalField {
  String toValue() {
    switch (this) {
      case InventoryOptionalField.size:
        return 'Size';
      case InventoryOptionalField.lastModifiedDate:
        return 'LastModifiedDate';
      case InventoryOptionalField.storageClass:
        return 'StorageClass';
      case InventoryOptionalField.eTag:
        return 'ETag';
      case InventoryOptionalField.isMultipartUploaded:
        return 'IsMultipartUploaded';
      case InventoryOptionalField.replicationStatus:
        return 'ReplicationStatus';
      case InventoryOptionalField.encryptionStatus:
        return 'EncryptionStatus';
      case InventoryOptionalField.objectLockRetainUntilDate:
        return 'ObjectLockRetainUntilDate';
      case InventoryOptionalField.objectLockMode:
        return 'ObjectLockMode';
      case InventoryOptionalField.objectLockLegalHoldStatus:
        return 'ObjectLockLegalHoldStatus';
      case InventoryOptionalField.intelligentTieringAccessTier:
        return 'IntelligentTieringAccessTier';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  InventoryOptionalField toInventoryOptionalField() {
    switch (this) {
      case 'Size':
        return InventoryOptionalField.size;
      case 'LastModifiedDate':
        return InventoryOptionalField.lastModifiedDate;
      case 'StorageClass':
        return InventoryOptionalField.storageClass;
      case 'ETag':
        return InventoryOptionalField.eTag;
      case 'IsMultipartUploaded':
        return InventoryOptionalField.isMultipartUploaded;
      case 'ReplicationStatus':
        return InventoryOptionalField.replicationStatus;
      case 'EncryptionStatus':
        return InventoryOptionalField.encryptionStatus;
      case 'ObjectLockRetainUntilDate':
        return InventoryOptionalField.objectLockRetainUntilDate;
      case 'ObjectLockMode':
        return InventoryOptionalField.objectLockMode;
      case 'ObjectLockLegalHoldStatus':
        return InventoryOptionalField.objectLockLegalHoldStatus;
      case 'IntelligentTieringAccessTier':
        return InventoryOptionalField.intelligentTieringAccessTier;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Contains the bucket name, file format, bucket owner (optional), and prefix
/// (optional) where inventory results are published.
class InventoryS3BucketDestination {
  /// The Amazon Resource Name (ARN) of the bucket where inventory results will be
  /// published.
  final String bucket;

  /// Specifies the output format of the inventory results.
  final InventoryFormat format;

  /// The account ID that owns the destination S3 bucket. If no account ID is
  /// provided, the owner is not validated before exporting data.
  /// <note>
  /// Although this value is optional, we strongly recommend that you set it to
  /// help prevent problems if the destination bucket ownership changes.
  /// </note>
  final String accountId;

  /// Contains the type of server-side encryption used to encrypt the inventory
  /// results.
  final InventoryEncryption encryption;

  /// The prefix that is prepended to all inventory results.
  final String prefix;

  InventoryS3BucketDestination({
    @_s.required this.bucket,
    @_s.required this.format,
    this.accountId,
    this.encryption,
    this.prefix,
  });
  factory InventoryS3BucketDestination.fromXml(_s.XmlElement elem) {
    return InventoryS3BucketDestination(
      bucket: _s.extractXmlStringValue(elem, 'Bucket'),
      format: _s.extractXmlStringValue(elem, 'Format')?.toInventoryFormat(),
      accountId: _s.extractXmlStringValue(elem, 'AccountId'),
      encryption: _s
          .extractXmlChild(elem, 'Encryption')
          ?.let((e) => InventoryEncryption.fromXml(e)),
      prefix: _s.extractXmlStringValue(elem, 'Prefix'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (accountId != null) _s.encodeXmlStringValue('AccountId', accountId),
      _s.encodeXmlStringValue('Bucket', bucket),
      _s.encodeXmlStringValue('Format', format?.toValue() ?? ''),
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

/// Specifies the schedule for generating inventory results.
class InventorySchedule {
  /// Specifies how frequently inventory results are produced.
  final InventoryFrequency frequency;

  InventorySchedule({
    @_s.required this.frequency,
  });
  factory InventorySchedule.fromXml(_s.XmlElement elem) {
    return InventorySchedule(
      frequency:
          _s.extractXmlStringValue(elem, 'Frequency')?.toInventoryFrequency(),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Frequency', frequency?.toValue() ?? ''),
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

/// Specifies JSON as object's input serialization format.
class JSONInput {
  /// The type of JSON. Valid values: Document, Lines.
  final JSONType type;

  JSONInput({
    this.type,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (type != null) _s.encodeXmlStringValue('Type', type.toValue()),
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

/// Specifies JSON as request's output serialization format.
class JSONOutput {
  /// The value used to separate individual records in the output. If no value is
  /// specified, Amazon S3 uses a newline character ('\n').
  final String recordDelimiter;

  JSONOutput({
    this.recordDelimiter,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (recordDelimiter != null)
        _s.encodeXmlStringValue('RecordDelimiter', recordDelimiter),
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

enum JSONType {
  document,
  lines,
}

extension on JSONType {
  String toValue() {
    switch (this) {
      case JSONType.document:
        return 'DOCUMENT';
      case JSONType.lines:
        return 'LINES';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  JSONType toJSONType() {
    switch (this) {
      case 'DOCUMENT':
        return JSONType.document;
      case 'LINES':
        return JSONType.lines;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// A container for specifying the configuration for AWS Lambda notifications.
class LambdaFunctionConfiguration {
  /// The Amazon S3 bucket event for which to invoke the AWS Lambda function. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html">Supported
  /// Event Types</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.
  final List<Event> events;

  /// The Amazon Resource Name (ARN) of the AWS Lambda function that Amazon S3
  /// invokes when the specified event type occurs.
  final String lambdaFunctionArn;
  final NotificationConfigurationFilter filter;
  final String id;

  LambdaFunctionConfiguration({
    @_s.required this.events,
    @_s.required this.lambdaFunctionArn,
    this.filter,
    this.id,
  });
  factory LambdaFunctionConfiguration.fromXml(_s.XmlElement elem) {
    return LambdaFunctionConfiguration(
      events: _s
          .extractXmlStringListValues(elem, 'Event')
          .map((s) => s.toEvent())
          .toList(),
      lambdaFunctionArn: _s.extractXmlStringValue(elem, 'CloudFunction'),
      filter: _s
          .extractXmlChild(elem, 'Filter')
          ?.let((e) => NotificationConfigurationFilter.fromXml(e)),
      id: _s.extractXmlStringValue(elem, 'Id'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (id != null) _s.encodeXmlStringValue('Id', id),
      _s.encodeXmlStringValue('CloudFunction', lambdaFunctionArn),
      ...events
          ?.map((e) => _s.encodeXmlStringValue('Event', e?.toValue() ?? '')),
      if (filter != null) filter?.toXml('Filter'),
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

/// Container for lifecycle rules. You can add as many as 1000 rules.
class LifecycleConfiguration {
  /// Specifies lifecycle configuration rules for an Amazon S3 bucket.
  final List<Rule> rules;

  LifecycleConfiguration({
    @_s.required this.rules,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      ...rules?.map((e) => e?.toXml('Rule')),
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

/// Container for the expiration for the lifecycle of the object.
class LifecycleExpiration {
  /// Indicates at what date the object is to be moved or deleted. Should be in
  /// GMT ISO 8601 Format.
  final DateTime date;

  /// Indicates the lifetime, in days, of the objects that are subject to the
  /// rule. The value must be a non-zero positive integer.
  final int days;

  /// Indicates whether Amazon S3 will remove a delete marker with no noncurrent
  /// versions. If set to true, the delete marker will be expired; if set to false
  /// the policy takes no action. This cannot be specified with Days or Date in a
  /// Lifecycle Expiration Policy.
  final bool expiredObjectDeleteMarker;

  LifecycleExpiration({
    this.date,
    this.days,
    this.expiredObjectDeleteMarker,
  });
  factory LifecycleExpiration.fromXml(_s.XmlElement elem) {
    return LifecycleExpiration(
      date: _s.extractXmlDateTimeValue(elem, 'Date',
          parser: _s.timeStampFromJson),
      days: _s.extractXmlIntValue(elem, 'Days'),
      expiredObjectDeleteMarker:
          _s.extractXmlBoolValue(elem, 'ExpiredObjectDeleteMarker'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (date != null)
        _s.encodeXmlDateTimeValue('Date', date, formatter: _s.iso8601ToJson),
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

/// A lifecycle rule for individual objects in an Amazon S3 bucket.
class LifecycleRule {
  /// If 'Enabled', the rule is currently being applied. If 'Disabled', the rule
  /// is not currently being applied.
  final ExpirationStatus status;
  final AbortIncompleteMultipartUpload abortIncompleteMultipartUpload;

  /// Specifies the expiration for the lifecycle of the object in the form of
  /// date, days and, whether the object has a delete marker.
  final LifecycleExpiration expiration;
  final LifecycleRuleFilter filter;

  /// Unique identifier for the rule. The value cannot be longer than 255
  /// characters.
  final String id;
  final NoncurrentVersionExpiration noncurrentVersionExpiration;

  /// Specifies the transition rule for the lifecycle rule that describes when
  /// noncurrent objects transition to a specific storage class. If your bucket is
  /// versioning-enabled (or versioning is suspended), you can set this action to
  /// request that Amazon S3 transition noncurrent object versions to a specific
  /// storage class at a set period in the object's lifetime.
  final List<NoncurrentVersionTransition> noncurrentVersionTransitions;

  /// Prefix identifying one or more objects to which the rule applies. This is No
  /// longer used; use <code>Filter</code> instead.
  final String prefix;

  /// Specifies when an Amazon S3 object transitions to a specified storage class.
  final List<Transition> transitions;

  LifecycleRule({
    @_s.required this.status,
    this.abortIncompleteMultipartUpload,
    this.expiration,
    this.filter,
    this.id,
    this.noncurrentVersionExpiration,
    this.noncurrentVersionTransitions,
    this.prefix,
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
      noncurrentVersionTransitions: elem
          .findElements('NoncurrentVersionTransition')
          .map((c) => NoncurrentVersionTransition.fromXml(c))
          .toList(),
      prefix: _s.extractXmlStringValue(elem, 'Prefix'),
      transitions: elem
          .findElements('Transition')
          .map((c) => Transition.fromXml(c))
          .toList(),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (expiration != null) expiration?.toXml('Expiration'),
      if (id != null) _s.encodeXmlStringValue('ID', id),
      if (prefix != null) _s.encodeXmlStringValue('Prefix', prefix),
      if (filter != null) filter?.toXml('Filter'),
      _s.encodeXmlStringValue('Status', status?.toValue() ?? ''),
      if (transitions != null)
        ...transitions.map((e) => e?.toXml('Transition')),
      if (noncurrentVersionTransitions != null)
        ...noncurrentVersionTransitions
            .map((e) => e?.toXml('NoncurrentVersionTransition')),
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

/// This is used in a Lifecycle Rule Filter to apply a logical AND to two or
/// more predicates. The Lifecycle Rule will apply to any object matching all of
/// the predicates configured inside the And operator.
class LifecycleRuleAndOperator {
  /// Prefix identifying one or more objects to which the rule applies.
  final String prefix;

  /// All of these tags must exist in the object's tag set in order for the rule
  /// to apply.
  final List<Tag> tags;

  LifecycleRuleAndOperator({
    this.prefix,
    this.tags,
  });
  factory LifecycleRuleAndOperator.fromXml(_s.XmlElement elem) {
    return LifecycleRuleAndOperator(
      prefix: _s.extractXmlStringValue(elem, 'Prefix'),
      tags: elem.findElements('Tag').map((c) => Tag.fromXml(c)).toList(),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (prefix != null) _s.encodeXmlStringValue('Prefix', prefix),
      if (tags != null) ...tags.map((e) => e?.toXml('Tag')),
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

/// The <code>Filter</code> is used to identify objects that a Lifecycle Rule
/// applies to. A <code>Filter</code> must have exactly one of
/// <code>Prefix</code>, <code>Tag</code>, or <code>And</code> specified.
class LifecycleRuleFilter {
  final LifecycleRuleAndOperator and;

  /// Prefix identifying one or more objects to which the rule applies.
  final String prefix;

  /// This tag must exist in the object's tag set in order for the rule to apply.
  final Tag tag;

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
      tag: _s.extractXmlChild(elem, 'Tag')?.let((e) => Tag.fromXml(e)),
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

class ListBucketAnalyticsConfigurationsOutput {
  /// The list of analytics configurations for a bucket.
  final List<AnalyticsConfiguration> analyticsConfigurationList;

  /// The marker that is used as a starting point for this analytics configuration
  /// list response. This value is present if it was sent in the request.
  final String continuationToken;

  /// Indicates whether the returned list of analytics configurations is complete.
  /// A value of true indicates that the list is not complete and the
  /// NextContinuationToken will be provided for a subsequent request.
  final bool isTruncated;

  /// <code>NextContinuationToken</code> is sent when <code>isTruncated</code> is
  /// true, which indicates that there are more analytics configurations to list.
  /// The next request must include this <code>NextContinuationToken</code>. The
  /// token is obfuscated and is not a usable value.
  final String nextContinuationToken;

  ListBucketAnalyticsConfigurationsOutput({
    this.analyticsConfigurationList,
    this.continuationToken,
    this.isTruncated,
    this.nextContinuationToken,
  });
  factory ListBucketAnalyticsConfigurationsOutput.fromXml(_s.XmlElement elem) {
    return ListBucketAnalyticsConfigurationsOutput(
      analyticsConfigurationList: elem
          .findElements('AnalyticsConfiguration')
          .map((c) => AnalyticsConfiguration.fromXml(c))
          .toList(),
      continuationToken: _s.extractXmlStringValue(elem, 'ContinuationToken'),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      nextContinuationToken:
          _s.extractXmlStringValue(elem, 'NextContinuationToken'),
    );
  }
}

class ListBucketIntelligentTieringConfigurationsOutput {
  /// The ContinuationToken that represents a placeholder from where this request
  /// should begin.
  final String continuationToken;

  /// The list of S3 Intelligent-Tiering configurations for a bucket.
  final List<IntelligentTieringConfiguration>
      intelligentTieringConfigurationList;

  /// Indicates whether the returned list of analytics configurations is complete.
  /// A value of true indicates that the list is not complete and the
  /// NextContinuationToken will be provided for a subsequent request.
  final bool isTruncated;

  /// The marker used to continue this inventory configuration listing. Use the
  /// <code>NextContinuationToken</code> from this response to continue the
  /// listing in a subsequent request. The continuation token is an opaque value
  /// that Amazon S3 understands.
  final String nextContinuationToken;

  ListBucketIntelligentTieringConfigurationsOutput({
    this.continuationToken,
    this.intelligentTieringConfigurationList,
    this.isTruncated,
    this.nextContinuationToken,
  });
  factory ListBucketIntelligentTieringConfigurationsOutput.fromXml(
      _s.XmlElement elem) {
    return ListBucketIntelligentTieringConfigurationsOutput(
      continuationToken: _s.extractXmlStringValue(elem, 'ContinuationToken'),
      intelligentTieringConfigurationList: elem
          .findElements('IntelligentTieringConfiguration')
          .map((c) => IntelligentTieringConfiguration.fromXml(c))
          .toList(),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      nextContinuationToken:
          _s.extractXmlStringValue(elem, 'NextContinuationToken'),
    );
  }
}

class ListBucketInventoryConfigurationsOutput {
  /// If sent in the request, the marker that is used as a starting point for this
  /// inventory configuration list response.
  final String continuationToken;

  /// The list of inventory configurations for a bucket.
  final List<InventoryConfiguration> inventoryConfigurationList;

  /// Tells whether the returned list of inventory configurations is complete. A
  /// value of true indicates that the list is not complete and the
  /// NextContinuationToken is provided for a subsequent request.
  final bool isTruncated;

  /// The marker used to continue this inventory configuration listing. Use the
  /// <code>NextContinuationToken</code> from this response to continue the
  /// listing in a subsequent request. The continuation token is an opaque value
  /// that Amazon S3 understands.
  final String nextContinuationToken;

  ListBucketInventoryConfigurationsOutput({
    this.continuationToken,
    this.inventoryConfigurationList,
    this.isTruncated,
    this.nextContinuationToken,
  });
  factory ListBucketInventoryConfigurationsOutput.fromXml(_s.XmlElement elem) {
    return ListBucketInventoryConfigurationsOutput(
      continuationToken: _s.extractXmlStringValue(elem, 'ContinuationToken'),
      inventoryConfigurationList: elem
          .findElements('InventoryConfiguration')
          .map((c) => InventoryConfiguration.fromXml(c))
          .toList(),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      nextContinuationToken:
          _s.extractXmlStringValue(elem, 'NextContinuationToken'),
    );
  }
}

class ListBucketMetricsConfigurationsOutput {
  /// The marker that is used as a starting point for this metrics configuration
  /// list response. This value is present if it was sent in the request.
  final String continuationToken;

  /// Indicates whether the returned list of metrics configurations is complete. A
  /// value of true indicates that the list is not complete and the
  /// NextContinuationToken will be provided for a subsequent request.
  final bool isTruncated;

  /// The list of metrics configurations for a bucket.
  final List<MetricsConfiguration> metricsConfigurationList;

  /// The marker used to continue a metrics configuration listing that has been
  /// truncated. Use the <code>NextContinuationToken</code> from a previously
  /// truncated list response to continue the listing. The continuation token is
  /// an opaque value that Amazon S3 understands.
  final String nextContinuationToken;

  ListBucketMetricsConfigurationsOutput({
    this.continuationToken,
    this.isTruncated,
    this.metricsConfigurationList,
    this.nextContinuationToken,
  });
  factory ListBucketMetricsConfigurationsOutput.fromXml(_s.XmlElement elem) {
    return ListBucketMetricsConfigurationsOutput(
      continuationToken: _s.extractXmlStringValue(elem, 'ContinuationToken'),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      metricsConfigurationList: elem
          .findElements('MetricsConfiguration')
          .map((c) => MetricsConfiguration.fromXml(c))
          .toList(),
      nextContinuationToken:
          _s.extractXmlStringValue(elem, 'NextContinuationToken'),
    );
  }
}

class ListBucketsOutput {
  /// The list of buckets owned by the requestor.
  final List<Bucket> buckets;

  /// The owner of the buckets listed.
  final Owner owner;

  ListBucketsOutput({
    this.buckets,
    this.owner,
  });
  factory ListBucketsOutput.fromXml(_s.XmlElement elem) {
    return ListBucketsOutput(
      buckets: _s.extractXmlChild(elem, 'Buckets')?.let((elem) =>
          elem.findElements('Bucket').map((c) => Bucket.fromXml(c)).toList()),
      owner: _s.extractXmlChild(elem, 'Owner')?.let((e) => Owner.fromXml(e)),
    );
  }
}

class ListMultipartUploadsOutput {
  /// The name of the bucket to which the multipart upload was initiated.
  final String bucket;

  /// If you specify a delimiter in the request, then the result returns each
  /// distinct key prefix containing the delimiter in a
  /// <code>CommonPrefixes</code> element. The distinct key prefixes are returned
  /// in the <code>Prefix</code> child element.
  final List<CommonPrefix> commonPrefixes;

  /// Contains the delimiter you specified in the request. If you don't specify a
  /// delimiter in your request, this element is absent from the response.
  final String delimiter;

  /// Encoding type used by Amazon S3 to encode object keys in the response.
  ///
  /// If you specify <code>encoding-type</code> request parameter, Amazon S3
  /// includes this element in the response, and returns encoded key name values
  /// in the following response elements:
  ///
  /// <code>Delimiter</code>, <code>KeyMarker</code>, <code>Prefix</code>,
  /// <code>NextKeyMarker</code>, <code>Key</code>.
  final EncodingType encodingType;

  /// Indicates whether the returned list of multipart uploads is truncated. A
  /// value of true indicates that the list was truncated. The list can be
  /// truncated if the number of multipart uploads exceeds the limit allowed or
  /// specified by max uploads.
  final bool isTruncated;

  /// The key at or after which the listing began.
  final String keyMarker;

  /// Maximum number of multipart uploads that could have been included in the
  /// response.
  final int maxUploads;

  /// When a list is truncated, this element specifies the value that should be
  /// used for the key-marker request parameter in a subsequent request.
  final String nextKeyMarker;

  /// When a list is truncated, this element specifies the value that should be
  /// used for the <code>upload-id-marker</code> request parameter in a subsequent
  /// request.
  final String nextUploadIdMarker;

  /// When a prefix is provided in the request, this field contains the specified
  /// prefix. The result contains only keys starting with the specified prefix.
  final String prefix;

  /// Upload ID after which listing began.
  final String uploadIdMarker;

  /// Container for elements related to a particular multipart upload. A response
  /// can contain zero or more <code>Upload</code> elements.
  final List<MultipartUpload> uploads;

  ListMultipartUploadsOutput({
    this.bucket,
    this.commonPrefixes,
    this.delimiter,
    this.encodingType,
    this.isTruncated,
    this.keyMarker,
    this.maxUploads,
    this.nextKeyMarker,
    this.nextUploadIdMarker,
    this.prefix,
    this.uploadIdMarker,
    this.uploads,
  });
  factory ListMultipartUploadsOutput.fromXml(_s.XmlElement elem) {
    return ListMultipartUploadsOutput(
      bucket: _s.extractXmlStringValue(elem, 'Bucket'),
      commonPrefixes: elem
          .findElements('CommonPrefixes')
          .map((c) => CommonPrefix.fromXml(c))
          .toList(),
      delimiter: _s.extractXmlStringValue(elem, 'Delimiter'),
      encodingType:
          _s.extractXmlStringValue(elem, 'EncodingType')?.toEncodingType(),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      keyMarker: _s.extractXmlStringValue(elem, 'KeyMarker'),
      maxUploads: _s.extractXmlIntValue(elem, 'MaxUploads'),
      nextKeyMarker: _s.extractXmlStringValue(elem, 'NextKeyMarker'),
      nextUploadIdMarker: _s.extractXmlStringValue(elem, 'NextUploadIdMarker'),
      prefix: _s.extractXmlStringValue(elem, 'Prefix'),
      uploadIdMarker: _s.extractXmlStringValue(elem, 'UploadIdMarker'),
      uploads: elem
          .findElements('Upload')
          .map((c) => MultipartUpload.fromXml(c))
          .toList(),
    );
  }
}

class ListObjectVersionsOutput {
  /// All of the keys rolled up into a common prefix count as a single return when
  /// calculating the number of returns.
  final List<CommonPrefix> commonPrefixes;

  /// Container for an object that is a delete marker.
  final List<DeleteMarkerEntry> deleteMarkers;

  /// The delimiter grouping the included keys. A delimiter is a character that
  /// you specify to group keys. All keys that contain the same string between the
  /// prefix and the first occurrence of the delimiter are grouped under a single
  /// result element in <code>CommonPrefixes</code>. These groups are counted as
  /// one result against the max-keys limitation. These keys are not returned
  /// elsewhere in the response.
  final String delimiter;

  /// Encoding type used by Amazon S3 to encode object key names in the XML
  /// response.
  ///
  /// If you specify encoding-type request parameter, Amazon S3 includes this
  /// element in the response, and returns encoded key name values in the
  /// following response elements:
  ///
  /// <code>KeyMarker, NextKeyMarker, Prefix, Key</code>, and
  /// <code>Delimiter</code>.
  final EncodingType encodingType;

  /// A flag that indicates whether Amazon S3 returned all of the results that
  /// satisfied the search criteria. If your results were truncated, you can make
  /// a follow-up paginated request using the NextKeyMarker and
  /// NextVersionIdMarker response parameters as a starting place in another
  /// request to return the rest of the results.
  final bool isTruncated;

  /// Marks the last key returned in a truncated response.
  final String keyMarker;

  /// Specifies the maximum number of objects to return.
  final int maxKeys;

  /// The bucket name.
  final String name;

  /// When the number of responses exceeds the value of <code>MaxKeys</code>,
  /// <code>NextKeyMarker</code> specifies the first key not returned that
  /// satisfies the search criteria. Use this value for the key-marker request
  /// parameter in a subsequent request.
  final String nextKeyMarker;

  /// When the number of responses exceeds the value of <code>MaxKeys</code>,
  /// <code>NextVersionIdMarker</code> specifies the first object version not
  /// returned that satisfies the search criteria. Use this value for the
  /// version-id-marker request parameter in a subsequent request.
  final String nextVersionIdMarker;

  /// Selects objects that start with the value supplied by this parameter.
  final String prefix;

  /// Marks the last version of the key returned in a truncated response.
  final String versionIdMarker;

  /// Container for version information.
  final List<ObjectVersion> versions;

  ListObjectVersionsOutput({
    this.commonPrefixes,
    this.deleteMarkers,
    this.delimiter,
    this.encodingType,
    this.isTruncated,
    this.keyMarker,
    this.maxKeys,
    this.name,
    this.nextKeyMarker,
    this.nextVersionIdMarker,
    this.prefix,
    this.versionIdMarker,
    this.versions,
  });
  factory ListObjectVersionsOutput.fromXml(_s.XmlElement elem) {
    return ListObjectVersionsOutput(
      commonPrefixes: elem
          .findElements('CommonPrefixes')
          .map((c) => CommonPrefix.fromXml(c))
          .toList(),
      deleteMarkers: elem
          .findElements('DeleteMarker')
          .map((c) => DeleteMarkerEntry.fromXml(c))
          .toList(),
      delimiter: _s.extractXmlStringValue(elem, 'Delimiter'),
      encodingType:
          _s.extractXmlStringValue(elem, 'EncodingType')?.toEncodingType(),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      keyMarker: _s.extractXmlStringValue(elem, 'KeyMarker'),
      maxKeys: _s.extractXmlIntValue(elem, 'MaxKeys'),
      name: _s.extractXmlStringValue(elem, 'Name'),
      nextKeyMarker: _s.extractXmlStringValue(elem, 'NextKeyMarker'),
      nextVersionIdMarker:
          _s.extractXmlStringValue(elem, 'NextVersionIdMarker'),
      prefix: _s.extractXmlStringValue(elem, 'Prefix'),
      versionIdMarker: _s.extractXmlStringValue(elem, 'VersionIdMarker'),
      versions: elem
          .findElements('Version')
          .map((c) => ObjectVersion.fromXml(c))
          .toList(),
    );
  }
}

class ListObjectsOutput {
  /// All of the keys rolled up in a common prefix count as a single return when
  /// calculating the number of returns.
  ///
  /// A response can contain CommonPrefixes only if you specify a delimiter.
  ///
  /// CommonPrefixes contains all (if there are any) keys between Prefix and the
  /// next occurrence of the string specified by the delimiter.
  ///
  /// CommonPrefixes lists keys that act like subdirectories in the directory
  /// specified by Prefix.
  ///
  /// For example, if the prefix is notes/ and the delimiter is a slash (/) as in
  /// notes/summer/july, the common prefix is notes/summer/. All of the keys that
  /// roll up into a common prefix count as a single return when calculating the
  /// number of returns.
  final List<CommonPrefix> commonPrefixes;

  /// Metadata about each object returned.
  final List<Object> contents;

  /// Causes keys that contain the same string between the prefix and the first
  /// occurrence of the delimiter to be rolled up into a single result element in
  /// the <code>CommonPrefixes</code> collection. These rolled-up keys are not
  /// returned elsewhere in the response. Each rolled-up result counts as only one
  /// return against the <code>MaxKeys</code> value.
  final String delimiter;

  /// Encoding type used by Amazon S3 to encode object keys in the response.
  final EncodingType encodingType;

  /// A flag that indicates whether Amazon S3 returned all of the results that
  /// satisfied the search criteria.
  final bool isTruncated;

  /// Indicates where in the bucket listing begins. Marker is included in the
  /// response if it was sent with the request.
  final String marker;

  /// The maximum number of keys returned in the response body.
  final int maxKeys;

  /// The bucket name.
  final String name;

  /// When response is truncated (the IsTruncated element value in the response is
  /// true), you can use the key name in this field as marker in the subsequent
  /// request to get next set of objects. Amazon S3 lists objects in alphabetical
  /// order Note: This element is returned only if you have delimiter request
  /// parameter specified. If response does not include the NextMarker and it is
  /// truncated, you can use the value of the last Key in the response as the
  /// marker in the subsequent request to get the next set of object keys.
  final String nextMarker;

  /// Keys that begin with the indicated prefix.
  final String prefix;

  ListObjectsOutput({
    this.commonPrefixes,
    this.contents,
    this.delimiter,
    this.encodingType,
    this.isTruncated,
    this.marker,
    this.maxKeys,
    this.name,
    this.nextMarker,
    this.prefix,
  });
  factory ListObjectsOutput.fromXml(_s.XmlElement elem) {
    return ListObjectsOutput(
      commonPrefixes: elem
          .findElements('CommonPrefixes')
          .map((c) => CommonPrefix.fromXml(c))
          .toList(),
      contents:
          elem.findElements('Contents').map((c) => Object.fromXml(c)).toList(),
      delimiter: _s.extractXmlStringValue(elem, 'Delimiter'),
      encodingType:
          _s.extractXmlStringValue(elem, 'EncodingType')?.toEncodingType(),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      maxKeys: _s.extractXmlIntValue(elem, 'MaxKeys'),
      name: _s.extractXmlStringValue(elem, 'Name'),
      nextMarker: _s.extractXmlStringValue(elem, 'NextMarker'),
      prefix: _s.extractXmlStringValue(elem, 'Prefix'),
    );
  }
}

class ListObjectsV2Output {
  /// All of the keys rolled up into a common prefix count as a single return when
  /// calculating the number of returns.
  ///
  /// A response can contain <code>CommonPrefixes</code> only if you specify a
  /// delimiter.
  ///
  /// <code>CommonPrefixes</code> contains all (if there are any) keys between
  /// <code>Prefix</code> and the next occurrence of the string specified by a
  /// delimiter.
  ///
  /// <code>CommonPrefixes</code> lists keys that act like subdirectories in the
  /// directory specified by <code>Prefix</code>.
  ///
  /// For example, if the prefix is <code>notes/</code> and the delimiter is a
  /// slash (<code>/</code>) as in <code>notes/summer/july</code>, the common
  /// prefix is <code>notes/summer/</code>. All of the keys that roll up into a
  /// common prefix count as a single return when calculating the number of
  /// returns.
  final List<CommonPrefix> commonPrefixes;

  /// Metadata about each object returned.
  final List<Object> contents;

  /// If ContinuationToken was sent with the request, it is included in the
  /// response.
  final String continuationToken;

  /// Causes keys that contain the same string between the prefix and the first
  /// occurrence of the delimiter to be rolled up into a single result element in
  /// the CommonPrefixes collection. These rolled-up keys are not returned
  /// elsewhere in the response. Each rolled-up result counts as only one return
  /// against the <code>MaxKeys</code> value.
  final String delimiter;

  /// Encoding type used by Amazon S3 to encode object key names in the XML
  /// response.
  ///
  /// If you specify the encoding-type request parameter, Amazon S3 includes this
  /// element in the response, and returns encoded key name values in the
  /// following response elements:
  ///
  /// <code>Delimiter, Prefix, Key,</code> and <code>StartAfter</code>.
  final EncodingType encodingType;

  /// Set to false if all of the results were returned. Set to true if more keys
  /// are available to return. If the number of results exceeds that specified by
  /// MaxKeys, all of the results might not be returned.
  final bool isTruncated;

  /// KeyCount is the number of keys returned with this request. KeyCount will
  /// always be less than equals to MaxKeys field. Say you ask for 50 keys, your
  /// result will include less than equals 50 keys
  final int keyCount;

  /// Sets the maximum number of keys returned in the response. By default the API
  /// returns up to 1,000 key names. The response might contain fewer keys but
  /// will never contain more.
  final int maxKeys;

  /// The bucket name.
  ///
  /// When using this API with an access point, you must direct requests to the
  /// access point hostname. The access point hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com.
  /// When using this operation with an access point through the AWS SDKs, you
  /// provide the access point ARN in place of the bucket name. For more
  /// information about access point ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using
  /// Access Points</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  ///
  /// When using this API with Amazon S3 on Outposts, you must direct requests to
  /// the S3 on Outposts hostname. The S3 on Outposts hostname takes the form
  /// <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com.
  /// When using this operation using S3 on Outposts through the AWS SDKs, you
  /// provide the Outposts bucket ARN in place of the bucket name. For more
  /// information about S3 on Outposts ARNs, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using
  /// S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  final String name;

  /// <code>NextContinuationToken</code> is sent when <code>isTruncated</code> is
  /// true, which means there are more keys in the bucket that can be listed. The
  /// next list requests to Amazon S3 can be continued with this
  /// <code>NextContinuationToken</code>. <code>NextContinuationToken</code> is
  /// obfuscated and is not a real key
  final String nextContinuationToken;

  /// Keys that begin with the indicated prefix.
  final String prefix;

  /// If StartAfter was sent with the request, it is included in the response.
  final String startAfter;

  ListObjectsV2Output({
    this.commonPrefixes,
    this.contents,
    this.continuationToken,
    this.delimiter,
    this.encodingType,
    this.isTruncated,
    this.keyCount,
    this.maxKeys,
    this.name,
    this.nextContinuationToken,
    this.prefix,
    this.startAfter,
  });
  factory ListObjectsV2Output.fromXml(_s.XmlElement elem) {
    return ListObjectsV2Output(
      commonPrefixes: elem
          .findElements('CommonPrefixes')
          .map((c) => CommonPrefix.fromXml(c))
          .toList(),
      contents:
          elem.findElements('Contents').map((c) => Object.fromXml(c)).toList(),
      continuationToken: _s.extractXmlStringValue(elem, 'ContinuationToken'),
      delimiter: _s.extractXmlStringValue(elem, 'Delimiter'),
      encodingType:
          _s.extractXmlStringValue(elem, 'EncodingType')?.toEncodingType(),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      keyCount: _s.extractXmlIntValue(elem, 'KeyCount'),
      maxKeys: _s.extractXmlIntValue(elem, 'MaxKeys'),
      name: _s.extractXmlStringValue(elem, 'Name'),
      nextContinuationToken:
          _s.extractXmlStringValue(elem, 'NextContinuationToken'),
      prefix: _s.extractXmlStringValue(elem, 'Prefix'),
      startAfter: _s.extractXmlStringValue(elem, 'StartAfter'),
    );
  }
}

class ListPartsOutput {
  /// If the bucket has a lifecycle rule configured with an action to abort
  /// incomplete multipart uploads and the prefix in the lifecycle rule matches
  /// the object name in the request, then the response includes this header
  /// indicating when the initiated multipart upload will become eligible for
  /// abort operation. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuoverview.html#mpu-abort-incomplete-mpu-lifecycle-config">Aborting
  /// Incomplete Multipart Uploads Using a Bucket Lifecycle Policy</a>.
  ///
  /// The response will also include the <code>x-amz-abort-rule-id</code> header
  /// that will provide the ID of the lifecycle configuration rule that defines
  /// this action.
  final DateTime abortDate;

  /// This header is returned along with the <code>x-amz-abort-date</code> header.
  /// It identifies applicable lifecycle configuration rule that defines the
  /// action to abort incomplete multipart uploads.
  final String abortRuleId;

  /// The name of the bucket to which the multipart upload was initiated.
  final String bucket;

  /// Container element that identifies who initiated the multipart upload. If the
  /// initiator is an AWS account, this element provides the same information as
  /// the <code>Owner</code> element. If the initiator is an IAM User, this
  /// element provides the user ARN and display name.
  final Initiator initiator;

  /// Indicates whether the returned list of parts is truncated. A true value
  /// indicates that the list was truncated. A list can be truncated if the number
  /// of parts exceeds the limit returned in the MaxParts element.
  final bool isTruncated;

  /// Object key for which the multipart upload was initiated.
  final String key;

  /// Maximum number of parts that were allowed in the response.
  final int maxParts;

  /// When a list is truncated, this element specifies the last part in the list,
  /// as well as the value to use for the part-number-marker request parameter in
  /// a subsequent request.
  final int nextPartNumberMarker;

  /// Container element that identifies the object owner, after the object is
  /// created. If multipart upload is initiated by an IAM user, this element
  /// provides the parent account ID and display name.
  final Owner owner;

  /// When a list is truncated, this element specifies the last part in the list,
  /// as well as the value to use for the part-number-marker request parameter in
  /// a subsequent request.
  final int partNumberMarker;

  /// Container for elements related to a particular part. A response can contain
  /// zero or more <code>Part</code> elements.
  final List<Part> parts;
  final RequestCharged requestCharged;

  /// Class of storage (STANDARD or REDUCED_REDUNDANCY) used to store the uploaded
  /// object.
  final StorageClass storageClass;

  /// Upload ID identifying the multipart upload whose parts are being listed.
  final String uploadId;

  ListPartsOutput({
    this.abortDate,
    this.abortRuleId,
    this.bucket,
    this.initiator,
    this.isTruncated,
    this.key,
    this.maxParts,
    this.nextPartNumberMarker,
    this.owner,
    this.partNumberMarker,
    this.parts,
    this.requestCharged,
    this.storageClass,
    this.uploadId,
  });
}

/// Describes where logs are stored and the prefix that Amazon S3 assigns to all
/// log object keys for a bucket. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTBucketPUTlogging.html">PUT
/// Bucket logging</a> in the <i>Amazon Simple Storage Service API
/// Reference</i>.
class LoggingEnabled {
  /// Specifies the bucket where you want Amazon S3 to store server access logs.
  /// You can have your logs delivered to any bucket that you own, including the
  /// same bucket that is being logged. You can also configure multiple buckets to
  /// deliver their logs to the same target bucket. In this case, you should
  /// choose a different <code>TargetPrefix</code> for each source bucket so that
  /// the delivered log files can be distinguished by key.
  final String targetBucket;

  /// A prefix for all log object keys. If you store log files from multiple
  /// Amazon S3 buckets in a single bucket, you can use a prefix to distinguish
  /// which log files came from which bucket.
  final String targetPrefix;

  /// Container for granting information.
  final List<TargetGrant> targetGrants;

  LoggingEnabled({
    @_s.required this.targetBucket,
    @_s.required this.targetPrefix,
    this.targetGrants,
  });
  factory LoggingEnabled.fromXml(_s.XmlElement elem) {
    return LoggingEnabled(
      targetBucket: _s.extractXmlStringValue(elem, 'TargetBucket'),
      targetPrefix: _s.extractXmlStringValue(elem, 'TargetPrefix'),
      targetGrants: _s.extractXmlChild(elem, 'TargetGrants')?.let((elem) => elem
          .findElements('Grant')
          .map((c) => TargetGrant.fromXml(c))
          .toList()),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('TargetBucket', targetBucket),
      if (targetGrants != null)
        _s.XmlElement(_s.XmlName('TargetGrants'), [],
            targetGrants.map((e) => e?.toXml('Grant'))),
      _s.encodeXmlStringValue('TargetPrefix', targetPrefix),
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

enum MFADelete {
  enabled,
  disabled,
}

extension on MFADelete {
  String toValue() {
    switch (this) {
      case MFADelete.enabled:
        return 'Enabled';
      case MFADelete.disabled:
        return 'Disabled';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  MFADelete toMFADelete() {
    switch (this) {
      case 'Enabled':
        return MFADelete.enabled;
      case 'Disabled':
        return MFADelete.disabled;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum MFADeleteStatus {
  enabled,
  disabled,
}

extension on MFADeleteStatus {
  String toValue() {
    switch (this) {
      case MFADeleteStatus.enabled:
        return 'Enabled';
      case MFADeleteStatus.disabled:
        return 'Disabled';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  MFADeleteStatus toMFADeleteStatus() {
    switch (this) {
      case 'Enabled':
        return MFADeleteStatus.enabled;
      case 'Disabled':
        return MFADeleteStatus.disabled;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum MetadataDirective {
  copy,
  replace,
}

extension on MetadataDirective {
  String toValue() {
    switch (this) {
      case MetadataDirective.copy:
        return 'COPY';
      case MetadataDirective.replace:
        return 'REPLACE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  MetadataDirective toMetadataDirective() {
    switch (this) {
      case 'COPY':
        return MetadataDirective.copy;
      case 'REPLACE':
        return MetadataDirective.replace;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// A metadata key-value pair to store with an object.
class MetadataEntry {
  /// Name of the Object.
  final String name;

  /// Value of the Object.
  final String value;

  MetadataEntry({
    this.name,
    this.value,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (name != null) _s.encodeXmlStringValue('Name', name),
      if (value != null) _s.encodeXmlStringValue('Value', value),
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

/// A container specifying replication metrics-related settings enabling
/// replication metrics and events.
class Metrics {
  /// Specifies whether the replication metrics are enabled.
  final MetricsStatus status;

  /// A container specifying the time threshold for emitting the
  /// <code>s3:Replication:OperationMissedThreshold</code> event.
  final ReplicationTimeValue eventThreshold;

  Metrics({
    @_s.required this.status,
    this.eventThreshold,
  });
  factory Metrics.fromXml(_s.XmlElement elem) {
    return Metrics(
      status: _s.extractXmlStringValue(elem, 'Status')?.toMetricsStatus(),
      eventThreshold: _s
          .extractXmlChild(elem, 'EventThreshold')
          ?.let((e) => ReplicationTimeValue.fromXml(e)),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Status', status?.toValue() ?? ''),
      if (eventThreshold != null) eventThreshold?.toXml('EventThreshold'),
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

/// A conjunction (logical AND) of predicates, which is used in evaluating a
/// metrics filter. The operator must have at least two predicates, and an
/// object must match all of the predicates in order for the filter to apply.
class MetricsAndOperator {
  /// The prefix used when evaluating an AND predicate.
  final String prefix;

  /// The list of tags used when evaluating an AND predicate.
  final List<Tag> tags;

  MetricsAndOperator({
    this.prefix,
    this.tags,
  });
  factory MetricsAndOperator.fromXml(_s.XmlElement elem) {
    return MetricsAndOperator(
      prefix: _s.extractXmlStringValue(elem, 'Prefix'),
      tags: elem.findElements('Tag').map((c) => Tag.fromXml(c)).toList(),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (prefix != null) _s.encodeXmlStringValue('Prefix', prefix),
      if (tags != null) ...tags.map((e) => e?.toXml('Tag')),
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

/// Specifies a metrics configuration for the CloudWatch request metrics
/// (specified by the metrics configuration ID) from an Amazon S3 bucket. If
/// you're updating an existing metrics configuration, note that this is a full
/// replacement of the existing metrics configuration. If you don't include the
/// elements you want to keep, they are erased. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTBucketPUTMetricConfiguration.html">
/// PUT Bucket metrics</a> in the <i>Amazon Simple Storage Service API
/// Reference</i>.
class MetricsConfiguration {
  /// The ID used to identify the metrics configuration.
  final String id;

  /// Specifies a metrics configuration filter. The metrics configuration will
  /// only include objects that meet the filter's criteria. A filter must be a
  /// prefix, a tag, or a conjunction (MetricsAndOperator).
  final MetricsFilter filter;

  MetricsConfiguration({
    @_s.required this.id,
    this.filter,
  });
  factory MetricsConfiguration.fromXml(_s.XmlElement elem) {
    return MetricsConfiguration(
      id: _s.extractXmlStringValue(elem, 'Id'),
      filter: _s
          .extractXmlChild(elem, 'Filter')
          ?.let((e) => MetricsFilter.fromXml(e)),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Id', id),
      if (filter != null) filter?.toXml('Filter'),
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

/// Specifies a metrics configuration filter. The metrics configuration only
/// includes objects that meet the filter's criteria. A filter must be a prefix,
/// a tag, or a conjunction (MetricsAndOperator).
class MetricsFilter {
  /// A conjunction (logical AND) of predicates, which is used in evaluating a
  /// metrics filter. The operator must have at least two predicates, and an
  /// object must match all of the predicates in order for the filter to apply.
  final MetricsAndOperator and;

  /// The prefix used when evaluating a metrics filter.
  final String prefix;

  /// The tag used when evaluating a metrics filter.
  final Tag tag;

  MetricsFilter({
    this.and,
    this.prefix,
    this.tag,
  });
  factory MetricsFilter.fromXml(_s.XmlElement elem) {
    return MetricsFilter(
      and: _s
          .extractXmlChild(elem, 'And')
          ?.let((e) => MetricsAndOperator.fromXml(e)),
      prefix: _s.extractXmlStringValue(elem, 'Prefix'),
      tag: _s.extractXmlChild(elem, 'Tag')?.let((e) => Tag.fromXml(e)),
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

enum MetricsStatus {
  enabled,
  disabled,
}

extension on MetricsStatus {
  String toValue() {
    switch (this) {
      case MetricsStatus.enabled:
        return 'Enabled';
      case MetricsStatus.disabled:
        return 'Disabled';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  MetricsStatus toMetricsStatus() {
    switch (this) {
      case 'Enabled':
        return MetricsStatus.enabled;
      case 'Disabled':
        return MetricsStatus.disabled;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Container for the <code>MultipartUpload</code> for the Amazon S3 object.
class MultipartUpload {
  /// Date and time at which the multipart upload was initiated.
  final DateTime initiated;

  /// Identifies who initiated the multipart upload.
  final Initiator initiator;

  /// Key of the object for which the multipart upload was initiated.
  final String key;

  /// Specifies the owner of the object that is part of the multipart upload.
  final Owner owner;

  /// The class of storage used to store the object.
  final StorageClass storageClass;

  /// Upload ID that identifies the multipart upload.
  final String uploadId;

  MultipartUpload({
    this.initiated,
    this.initiator,
    this.key,
    this.owner,
    this.storageClass,
    this.uploadId,
  });
  factory MultipartUpload.fromXml(_s.XmlElement elem) {
    return MultipartUpload(
      initiated: _s.extractXmlDateTimeValue(elem, 'Initiated'),
      initiator: _s
          .extractXmlChild(elem, 'Initiator')
          ?.let((e) => Initiator.fromXml(e)),
      key: _s.extractXmlStringValue(elem, 'Key'),
      owner: _s.extractXmlChild(elem, 'Owner')?.let((e) => Owner.fromXml(e)),
      storageClass:
          _s.extractXmlStringValue(elem, 'StorageClass')?.toStorageClass(),
      uploadId: _s.extractXmlStringValue(elem, 'UploadId'),
    );
  }
}

/// Specifies when noncurrent object versions expire. Upon expiration, Amazon S3
/// permanently deletes the noncurrent object versions. You set this lifecycle
/// configuration action on a bucket that has versioning enabled (or suspended)
/// to request that Amazon S3 delete noncurrent object versions at a specific
/// period in the object's lifetime.
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

/// Container for the transition rule that describes when noncurrent objects
/// transition to the <code>STANDARD_IA</code>, <code>ONEZONE_IA</code>,
/// <code>INTELLIGENT_TIERING</code>, <code>GLACIER</code>, or
/// <code>DEEP_ARCHIVE</code> storage class. If your bucket is
/// versioning-enabled (or versioning is suspended), you can set this action to
/// request that Amazon S3 transition noncurrent object versions to the
/// <code>STANDARD_IA</code>, <code>ONEZONE_IA</code>,
/// <code>INTELLIGENT_TIERING</code>, <code>GLACIER</code>, or
/// <code>DEEP_ARCHIVE</code> storage class at a specific period in the object's
/// lifetime.
class NoncurrentVersionTransition {
  /// Specifies the number of days an object is noncurrent before Amazon S3 can
  /// perform the associated action. For information about the noncurrent days
  /// calculations, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/intro-lifecycle-rules.html#non-current-days-calculations">How
  /// Amazon S3 Calculates How Long an Object Has Been Noncurrent</a> in the
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

/// A container for specifying the notification configuration of the bucket. If
/// this element is empty, notifications are turned off for the bucket.
class NotificationConfiguration {
  /// Describes the AWS Lambda functions to invoke and the events for which to
  /// invoke them.
  final List<LambdaFunctionConfiguration> lambdaFunctionConfigurations;

  /// The Amazon Simple Queue Service queues to publish messages to and the events
  /// for which to publish messages.
  final List<QueueConfiguration> queueConfigurations;

  /// The topic to which notifications are sent and the events for which
  /// notifications are generated.
  final List<TopicConfiguration> topicConfigurations;

  NotificationConfiguration({
    this.lambdaFunctionConfigurations,
    this.queueConfigurations,
    this.topicConfigurations,
  });
  factory NotificationConfiguration.fromXml(_s.XmlElement elem) {
    return NotificationConfiguration(
      lambdaFunctionConfigurations: elem
          .findElements('CloudFunctionConfiguration')
          .map((c) => LambdaFunctionConfiguration.fromXml(c))
          .toList(),
      queueConfigurations: elem
          .findElements('QueueConfiguration')
          .map((c) => QueueConfiguration.fromXml(c))
          .toList(),
      topicConfigurations: elem
          .findElements('TopicConfiguration')
          .map((c) => TopicConfiguration.fromXml(c))
          .toList(),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (topicConfigurations != null)
        ...topicConfigurations.map((e) => e?.toXml('TopicConfiguration')),
      if (queueConfigurations != null)
        ...queueConfigurations.map((e) => e?.toXml('QueueConfiguration')),
      if (lambdaFunctionConfigurations != null)
        ...lambdaFunctionConfigurations
            .map((e) => e?.toXml('CloudFunctionConfiguration')),
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

class NotificationConfigurationDeprecated {
  /// Container for specifying the AWS Lambda notification configuration.
  final CloudFunctionConfiguration cloudFunctionConfiguration;

  /// This data type is deprecated. This data type specifies the configuration for
  /// publishing messages to an Amazon Simple Queue Service (Amazon SQS) queue
  /// when Amazon S3 detects specified events.
  final QueueConfigurationDeprecated queueConfiguration;

  /// This data type is deprecated. A container for specifying the configuration
  /// for publication of messages to an Amazon Simple Notification Service (Amazon
  /// SNS) topic when Amazon S3 detects specified events.
  final TopicConfigurationDeprecated topicConfiguration;

  NotificationConfigurationDeprecated({
    this.cloudFunctionConfiguration,
    this.queueConfiguration,
    this.topicConfiguration,
  });
  factory NotificationConfigurationDeprecated.fromXml(_s.XmlElement elem) {
    return NotificationConfigurationDeprecated(
      cloudFunctionConfiguration: _s
          .extractXmlChild(elem, 'CloudFunctionConfiguration')
          ?.let((e) => CloudFunctionConfiguration.fromXml(e)),
      queueConfiguration: _s
          .extractXmlChild(elem, 'QueueConfiguration')
          ?.let((e) => QueueConfigurationDeprecated.fromXml(e)),
      topicConfiguration: _s
          .extractXmlChild(elem, 'TopicConfiguration')
          ?.let((e) => TopicConfigurationDeprecated.fromXml(e)),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (topicConfiguration != null)
        topicConfiguration?.toXml('TopicConfiguration'),
      if (queueConfiguration != null)
        queueConfiguration?.toXml('QueueConfiguration'),
      if (cloudFunctionConfiguration != null)
        cloudFunctionConfiguration?.toXml('CloudFunctionConfiguration'),
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

/// Specifies object key name filtering rules. For information about key name
/// filtering, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html">Configuring
/// Event Notifications</a> in the <i>Amazon Simple Storage Service Developer
/// Guide</i>.
class NotificationConfigurationFilter {
  final S3KeyFilter key;

  NotificationConfigurationFilter({
    this.key,
  });
  factory NotificationConfigurationFilter.fromXml(_s.XmlElement elem) {
    return NotificationConfigurationFilter(
      key:
          _s.extractXmlChild(elem, 'S3Key')?.let((e) => S3KeyFilter.fromXml(e)),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (key != null) key?.toXml('S3Key'),
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

/// An object consists of data and its descriptive metadata.
class Object {
  /// The entity tag is a hash of the object. The ETag reflects changes only to
  /// the contents of an object, not its metadata. The ETag may or may not be an
  /// MD5 digest of the object data. Whether or not it is depends on how the
  /// object was created and how it is encrypted as described below:
  ///
  /// <ul>
  /// <li>
  /// Objects created by the PUT Object, POST Object, or Copy operation, or
  /// through the AWS Management Console, and are encrypted by SSE-S3 or
  /// plaintext, have ETags that are an MD5 digest of their object data.
  /// </li>
  /// <li>
  /// Objects created by the PUT Object, POST Object, or Copy operation, or
  /// through the AWS Management Console, and are encrypted by SSE-C or SSE-KMS,
  /// have ETags that are not an MD5 digest of their object data.
  /// </li>
  /// <li>
  /// If an object is created by either the Multipart Upload or Part Copy
  /// operation, the ETag is not an MD5 digest, regardless of the method of
  /// encryption.
  /// </li>
  /// </ul>
  final String eTag;

  /// The name that you assign to an object. You use the object key to retrieve
  /// the object.
  final String key;

  /// The date the Object was Last Modified
  final DateTime lastModified;

  /// The owner of the object
  final Owner owner;

  /// Size in bytes of the object
  final int size;

  /// The class of storage used to store the object.
  final ObjectStorageClass storageClass;

  Object({
    this.eTag,
    this.key,
    this.lastModified,
    this.owner,
    this.size,
    this.storageClass,
  });
  factory Object.fromXml(_s.XmlElement elem) {
    return Object(
      eTag: _s.extractXmlStringValue(elem, 'ETag'),
      key: _s.extractXmlStringValue(elem, 'Key'),
      lastModified: _s.extractXmlDateTimeValue(elem, 'LastModified'),
      owner: _s.extractXmlChild(elem, 'Owner')?.let((e) => Owner.fromXml(e)),
      size: _s.extractXmlIntValue(elem, 'Size'),
      storageClass: _s
          .extractXmlStringValue(elem, 'StorageClass')
          ?.toObjectStorageClass(),
    );
  }
}

enum ObjectCannedACL {
  private,
  publicRead,
  publicReadWrite,
  authenticatedRead,
  awsExecRead,
  bucketOwnerRead,
  bucketOwnerFullControl,
}

extension on ObjectCannedACL {
  String toValue() {
    switch (this) {
      case ObjectCannedACL.private:
        return 'private';
      case ObjectCannedACL.publicRead:
        return 'public-read';
      case ObjectCannedACL.publicReadWrite:
        return 'public-read-write';
      case ObjectCannedACL.authenticatedRead:
        return 'authenticated-read';
      case ObjectCannedACL.awsExecRead:
        return 'aws-exec-read';
      case ObjectCannedACL.bucketOwnerRead:
        return 'bucket-owner-read';
      case ObjectCannedACL.bucketOwnerFullControl:
        return 'bucket-owner-full-control';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  ObjectCannedACL toObjectCannedACL() {
    switch (this) {
      case 'private':
        return ObjectCannedACL.private;
      case 'public-read':
        return ObjectCannedACL.publicRead;
      case 'public-read-write':
        return ObjectCannedACL.publicReadWrite;
      case 'authenticated-read':
        return ObjectCannedACL.authenticatedRead;
      case 'aws-exec-read':
        return ObjectCannedACL.awsExecRead;
      case 'bucket-owner-read':
        return ObjectCannedACL.bucketOwnerRead;
      case 'bucket-owner-full-control':
        return ObjectCannedACL.bucketOwnerFullControl;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Object Identifier is unique value to identify objects.
class ObjectIdentifier {
  /// Key name of the object to delete.
  final String key;

  /// VersionId for the specific version of the object to delete.
  final String versionId;

  ObjectIdentifier({
    @_s.required this.key,
    this.versionId,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Key', key),
      if (versionId != null) _s.encodeXmlStringValue('VersionId', versionId),
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

/// The container element for Object Lock configuration parameters.
class ObjectLockConfiguration {
  /// Indicates whether this bucket has an Object Lock configuration enabled.
  final ObjectLockEnabled objectLockEnabled;

  /// The Object Lock rule in place for the specified object.
  final ObjectLockRule rule;

  ObjectLockConfiguration({
    this.objectLockEnabled,
    this.rule,
  });
  factory ObjectLockConfiguration.fromXml(_s.XmlElement elem) {
    return ObjectLockConfiguration(
      objectLockEnabled: _s
          .extractXmlStringValue(elem, 'ObjectLockEnabled')
          ?.toObjectLockEnabled(),
      rule: _s
          .extractXmlChild(elem, 'Rule')
          ?.let((e) => ObjectLockRule.fromXml(e)),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (objectLockEnabled != null)
        _s.encodeXmlStringValue(
            'ObjectLockEnabled', objectLockEnabled.toValue()),
      if (rule != null) rule?.toXml('Rule'),
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

enum ObjectLockEnabled {
  enabled,
}

extension on ObjectLockEnabled {
  String toValue() {
    switch (this) {
      case ObjectLockEnabled.enabled:
        return 'Enabled';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  ObjectLockEnabled toObjectLockEnabled() {
    switch (this) {
      case 'Enabled':
        return ObjectLockEnabled.enabled;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// A Legal Hold configuration for an object.
class ObjectLockLegalHold {
  /// Indicates whether the specified object has a Legal Hold in place.
  final ObjectLockLegalHoldStatus status;

  ObjectLockLegalHold({
    this.status,
  });
  factory ObjectLockLegalHold.fromXml(_s.XmlElement elem) {
    return ObjectLockLegalHold(
      status: _s
          .extractXmlStringValue(elem, 'Status')
          ?.toObjectLockLegalHoldStatus(),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (status != null) _s.encodeXmlStringValue('Status', status.toValue()),
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

enum ObjectLockLegalHoldStatus {
  on,
  off,
}

extension on ObjectLockLegalHoldStatus {
  String toValue() {
    switch (this) {
      case ObjectLockLegalHoldStatus.on:
        return 'ON';
      case ObjectLockLegalHoldStatus.off:
        return 'OFF';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  ObjectLockLegalHoldStatus toObjectLockLegalHoldStatus() {
    switch (this) {
      case 'ON':
        return ObjectLockLegalHoldStatus.on;
      case 'OFF':
        return ObjectLockLegalHoldStatus.off;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum ObjectLockMode {
  governance,
  compliance,
}

extension on ObjectLockMode {
  String toValue() {
    switch (this) {
      case ObjectLockMode.governance:
        return 'GOVERNANCE';
      case ObjectLockMode.compliance:
        return 'COMPLIANCE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  ObjectLockMode toObjectLockMode() {
    switch (this) {
      case 'GOVERNANCE':
        return ObjectLockMode.governance;
      case 'COMPLIANCE':
        return ObjectLockMode.compliance;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// A Retention configuration for an object.
class ObjectLockRetention {
  /// Indicates the Retention mode for the specified object.
  final ObjectLockRetentionMode mode;

  /// The date on which this Object Lock Retention will expire.
  final DateTime retainUntilDate;

  ObjectLockRetention({
    this.mode,
    this.retainUntilDate,
  });
  factory ObjectLockRetention.fromXml(_s.XmlElement elem) {
    return ObjectLockRetention(
      mode: _s.extractXmlStringValue(elem, 'Mode')?.toObjectLockRetentionMode(),
      retainUntilDate: _s.extractXmlDateTimeValue(elem, 'RetainUntilDate',
          parser: _s.timeStampFromJson),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (mode != null) _s.encodeXmlStringValue('Mode', mode.toValue()),
      if (retainUntilDate != null)
        _s.encodeXmlDateTimeValue('RetainUntilDate', retainUntilDate,
            formatter: _s.iso8601ToJson),
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

enum ObjectLockRetentionMode {
  governance,
  compliance,
}

extension on ObjectLockRetentionMode {
  String toValue() {
    switch (this) {
      case ObjectLockRetentionMode.governance:
        return 'GOVERNANCE';
      case ObjectLockRetentionMode.compliance:
        return 'COMPLIANCE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  ObjectLockRetentionMode toObjectLockRetentionMode() {
    switch (this) {
      case 'GOVERNANCE':
        return ObjectLockRetentionMode.governance;
      case 'COMPLIANCE':
        return ObjectLockRetentionMode.compliance;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The container element for an Object Lock rule.
class ObjectLockRule {
  /// The default retention period that you want to apply to new objects placed in
  /// the specified bucket.
  final DefaultRetention defaultRetention;

  ObjectLockRule({
    this.defaultRetention,
  });
  factory ObjectLockRule.fromXml(_s.XmlElement elem) {
    return ObjectLockRule(
      defaultRetention: _s
          .extractXmlChild(elem, 'DefaultRetention')
          ?.let((e) => DefaultRetention.fromXml(e)),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (defaultRetention != null) defaultRetention?.toXml('DefaultRetention'),
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

/// The container element for object ownership for a bucket's ownership
/// controls.
///
/// BucketOwnerPreferred - Objects uploaded to the bucket change ownership to
/// the bucket owner if the objects are uploaded with the
/// <code>bucket-owner-full-control</code> canned ACL.
///
/// ObjectWriter - The uploading account will own the object if the object is
/// uploaded with the <code>bucket-owner-full-control</code> canned ACL.
enum ObjectOwnership {
  bucketOwnerPreferred,
  objectWriter,
}

extension on ObjectOwnership {
  String toValue() {
    switch (this) {
      case ObjectOwnership.bucketOwnerPreferred:
        return 'BucketOwnerPreferred';
      case ObjectOwnership.objectWriter:
        return 'ObjectWriter';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  ObjectOwnership toObjectOwnership() {
    switch (this) {
      case 'BucketOwnerPreferred':
        return ObjectOwnership.bucketOwnerPreferred;
      case 'ObjectWriter':
        return ObjectOwnership.objectWriter;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum ObjectStorageClass {
  standard,
  reducedRedundancy,
  glacier,
  standardIa,
  onezoneIa,
  intelligentTiering,
  deepArchive,
  outposts,
}

extension on ObjectStorageClass {
  String toValue() {
    switch (this) {
      case ObjectStorageClass.standard:
        return 'STANDARD';
      case ObjectStorageClass.reducedRedundancy:
        return 'REDUCED_REDUNDANCY';
      case ObjectStorageClass.glacier:
        return 'GLACIER';
      case ObjectStorageClass.standardIa:
        return 'STANDARD_IA';
      case ObjectStorageClass.onezoneIa:
        return 'ONEZONE_IA';
      case ObjectStorageClass.intelligentTiering:
        return 'INTELLIGENT_TIERING';
      case ObjectStorageClass.deepArchive:
        return 'DEEP_ARCHIVE';
      case ObjectStorageClass.outposts:
        return 'OUTPOSTS';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  ObjectStorageClass toObjectStorageClass() {
    switch (this) {
      case 'STANDARD':
        return ObjectStorageClass.standard;
      case 'REDUCED_REDUNDANCY':
        return ObjectStorageClass.reducedRedundancy;
      case 'GLACIER':
        return ObjectStorageClass.glacier;
      case 'STANDARD_IA':
        return ObjectStorageClass.standardIa;
      case 'ONEZONE_IA':
        return ObjectStorageClass.onezoneIa;
      case 'INTELLIGENT_TIERING':
        return ObjectStorageClass.intelligentTiering;
      case 'DEEP_ARCHIVE':
        return ObjectStorageClass.deepArchive;
      case 'OUTPOSTS':
        return ObjectStorageClass.outposts;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The version of an object.
class ObjectVersion {
  /// The entity tag is an MD5 hash of that version of the object.
  final String eTag;

  /// Specifies whether the object is (true) or is not (false) the latest version
  /// of an object.
  final bool isLatest;

  /// The object key.
  final String key;

  /// Date and time the object was last modified.
  final DateTime lastModified;

  /// Specifies the owner of the object.
  final Owner owner;

  /// Size in bytes of the object.
  final int size;

  /// The class of storage used to store the object.
  final ObjectVersionStorageClass storageClass;

  /// Version ID of an object.
  final String versionId;

  ObjectVersion({
    this.eTag,
    this.isLatest,
    this.key,
    this.lastModified,
    this.owner,
    this.size,
    this.storageClass,
    this.versionId,
  });
  factory ObjectVersion.fromXml(_s.XmlElement elem) {
    return ObjectVersion(
      eTag: _s.extractXmlStringValue(elem, 'ETag'),
      isLatest: _s.extractXmlBoolValue(elem, 'IsLatest'),
      key: _s.extractXmlStringValue(elem, 'Key'),
      lastModified: _s.extractXmlDateTimeValue(elem, 'LastModified'),
      owner: _s.extractXmlChild(elem, 'Owner')?.let((e) => Owner.fromXml(e)),
      size: _s.extractXmlIntValue(elem, 'Size'),
      storageClass: _s
          .extractXmlStringValue(elem, 'StorageClass')
          ?.toObjectVersionStorageClass(),
      versionId: _s.extractXmlStringValue(elem, 'VersionId'),
    );
  }
}

enum ObjectVersionStorageClass {
  standard,
}

extension on ObjectVersionStorageClass {
  String toValue() {
    switch (this) {
      case ObjectVersionStorageClass.standard:
        return 'STANDARD';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  ObjectVersionStorageClass toObjectVersionStorageClass() {
    switch (this) {
      case 'STANDARD':
        return ObjectVersionStorageClass.standard;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes the location where the restore job's output is stored.
class OutputLocation {
  /// Describes an S3 location that will receive the results of the restore
  /// request.
  final S3Location s3;

  OutputLocation({
    this.s3,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (s3 != null) s3?.toXml('S3'),
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

/// Describes how results of the Select job are serialized.
class OutputSerialization {
  /// Describes the serialization of CSV-encoded Select results.
  final CSVOutput csv;

  /// Specifies JSON as request's output serialization format.
  final JSONOutput json;

  OutputSerialization({
    this.csv,
    this.json,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (csv != null) csv?.toXml('CSV'),
      if (json != null) json?.toXml('JSON'),
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

/// Container for the owner's display name and ID.
class Owner {
  /// Container for the display name of the owner.
  final String displayName;

  /// Container for the ID of the owner.
  final String id;

  Owner({
    this.displayName,
    this.id,
  });
  factory Owner.fromXml(_s.XmlElement elem) {
    return Owner(
      displayName: _s.extractXmlStringValue(elem, 'DisplayName'),
      id: _s.extractXmlStringValue(elem, 'ID'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (displayName != null)
        _s.encodeXmlStringValue('DisplayName', displayName),
      if (id != null) _s.encodeXmlStringValue('ID', id),
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

enum OwnerOverride {
  destination,
}

extension on OwnerOverride {
  String toValue() {
    switch (this) {
      case OwnerOverride.destination:
        return 'Destination';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  OwnerOverride toOwnerOverride() {
    switch (this) {
      case 'Destination':
        return OwnerOverride.destination;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The container element for a bucket's ownership controls.
class OwnershipControls {
  /// The container element for an ownership control rule.
  final List<OwnershipControlsRule> rules;

  OwnershipControls({
    @_s.required this.rules,
  });
  factory OwnershipControls.fromXml(_s.XmlElement elem) {
    return OwnershipControls(
      rules: elem
          .findElements('Rule')
          .map((c) => OwnershipControlsRule.fromXml(c))
          .toList(),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      ...rules?.map((e) => e?.toXml('Rule')),
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

/// The container element for an ownership control rule.
class OwnershipControlsRule {
  final ObjectOwnership objectOwnership;

  OwnershipControlsRule({
    @_s.required this.objectOwnership,
  });
  factory OwnershipControlsRule.fromXml(_s.XmlElement elem) {
    return OwnershipControlsRule(
      objectOwnership: _s
          .extractXmlStringValue(elem, 'ObjectOwnership')
          ?.toObjectOwnership(),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue(
          'ObjectOwnership', objectOwnership?.toValue() ?? ''),
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

/// Container for Parquet.
class ParquetInput {
  ParquetInput();
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

/// Container for elements related to a part.
class Part {
  /// Entity tag returned when the part was uploaded.
  final String eTag;

  /// Date and time at which the part was uploaded.
  final DateTime lastModified;

  /// Part number identifying the part. This is a positive integer between 1 and
  /// 10,000.
  final int partNumber;

  /// Size in bytes of the uploaded part data.
  final int size;

  Part({
    this.eTag,
    this.lastModified,
    this.partNumber,
    this.size,
  });
  factory Part.fromXml(_s.XmlElement elem) {
    return Part(
      eTag: _s.extractXmlStringValue(elem, 'ETag'),
      lastModified: _s.extractXmlDateTimeValue(elem, 'LastModified'),
      partNumber: _s.extractXmlIntValue(elem, 'PartNumber'),
      size: _s.extractXmlIntValue(elem, 'Size'),
    );
  }
}

enum Payer {
  requester,
  bucketOwner,
}

extension on Payer {
  String toValue() {
    switch (this) {
      case Payer.requester:
        return 'Requester';
      case Payer.bucketOwner:
        return 'BucketOwner';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  Payer toPayer() {
    switch (this) {
      case 'Requester':
        return Payer.requester;
      case 'BucketOwner':
        return Payer.bucketOwner;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum Permission {
  fullControl,
  write,
  writeAcp,
  read,
  readAcp,
}

extension on Permission {
  String toValue() {
    switch (this) {
      case Permission.fullControl:
        return 'FULL_CONTROL';
      case Permission.write:
        return 'WRITE';
      case Permission.writeAcp:
        return 'WRITE_ACP';
      case Permission.read:
        return 'READ';
      case Permission.readAcp:
        return 'READ_ACP';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  Permission toPermission() {
    switch (this) {
      case 'FULL_CONTROL':
        return Permission.fullControl;
      case 'WRITE':
        return Permission.write;
      case 'WRITE_ACP':
        return Permission.writeAcp;
      case 'READ':
        return Permission.read;
      case 'READ_ACP':
        return Permission.readAcp;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The container element for a bucket's policy status.
class PolicyStatus {
  /// The policy status for this bucket. <code>TRUE</code> indicates that this
  /// bucket is public. <code>FALSE</code> indicates that the bucket is not
  /// public.
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

/// This data type contains information about progress of an operation.
class Progress {
  /// The current number of uncompressed object bytes processed.
  final int bytesProcessed;

  /// The current number of bytes of records payload data returned.
  final int bytesReturned;

  /// The current number of object bytes scanned.
  final int bytesScanned;

  Progress({
    this.bytesProcessed,
    this.bytesReturned,
    this.bytesScanned,
  });
  factory Progress.fromXml(_s.XmlElement elem) {
    return Progress(
      bytesProcessed: _s.extractXmlIntValue(elem, 'BytesProcessed'),
      bytesReturned: _s.extractXmlIntValue(elem, 'BytesReturned'),
      bytesScanned: _s.extractXmlIntValue(elem, 'BytesScanned'),
    );
  }
}

/// This data type contains information about the progress event of an
/// operation.
class ProgressEvent {
  /// The Progress event details.
  final Progress details;

  ProgressEvent({
    this.details,
  });
  factory ProgressEvent.fromXml(_s.XmlElement elem) {
    return ProgressEvent(
      details:
          _s.extractXmlChild(elem, 'Details')?.let((e) => Progress.fromXml(e)),
    );
  }
}

enum Protocol {
  http,
  https,
}

extension on Protocol {
  String toValue() {
    switch (this) {
      case Protocol.http:
        return 'http';
      case Protocol.https:
        return 'https';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  Protocol toProtocol() {
    switch (this) {
      case 'http':
        return Protocol.http;
      case 'https':
        return Protocol.https;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The PublicAccessBlock configuration that you want to apply to this Amazon S3
/// bucket. You can enable the configuration options in any combination. For
/// more information about when Amazon S3 considers a bucket or object public,
/// see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html#access-control-block-public-access-policy-status">The
/// Meaning of "Public"</a> in the <i>Amazon Simple Storage Service Developer
/// Guide</i>.
class PublicAccessBlockConfiguration {
  /// Specifies whether Amazon S3 should block public access control lists (ACLs)
  /// for this bucket and objects in this bucket. Setting this element to
  /// <code>TRUE</code> causes the following behavior:
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

  /// Specifies whether Amazon S3 should block public bucket policies for this
  /// bucket. Setting this element to <code>TRUE</code> causes Amazon S3 to reject
  /// calls to PUT Bucket policy if the specified bucket policy allows public
  /// access.
  ///
  /// Enabling this setting doesn't affect existing bucket policies.
  final bool blockPublicPolicy;

  /// Specifies whether Amazon S3 should ignore public ACLs for this bucket and
  /// objects in this bucket. Setting this element to <code>TRUE</code> causes
  /// Amazon S3 to ignore all public ACLs on this bucket and objects in this
  /// bucket.
  ///
  /// Enabling this setting doesn't affect the persistence of any existing ACLs
  /// and doesn't prevent new public ACLs from being set.
  final bool ignorePublicAcls;

  /// Specifies whether Amazon S3 should restrict public bucket policies for this
  /// bucket. Setting this element to <code>TRUE</code> restricts access to this
  /// bucket to only AWS service principals and authorized users within this
  /// account if the bucket has a public policy.
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

class PutObjectAclOutput {
  final RequestCharged requestCharged;

  PutObjectAclOutput({
    this.requestCharged,
  });
}

class PutObjectLegalHoldOutput {
  final RequestCharged requestCharged;

  PutObjectLegalHoldOutput({
    this.requestCharged,
  });
}

class PutObjectLockConfigurationOutput {
  final RequestCharged requestCharged;

  PutObjectLockConfigurationOutput({
    this.requestCharged,
  });
}

class PutObjectOutput {
  /// Indicates whether the uploaded object uses an S3 Bucket Key for server-side
  /// encryption with AWS KMS (SSE-KMS).
  final bool bucketKeyEnabled;

  /// Entity tag for the uploaded object.
  final String eTag;

  /// If the expiration is configured for the object (see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketLifecycleConfiguration.html">PutBucketLifecycleConfiguration</a>),
  /// the response includes this header. It includes the expiry-date and rule-id
  /// key-value pairs that provide information about object expiration. The value
  /// of the rule-id is URL encoded.
  final String expiration;
  final RequestCharged requestCharged;

  /// If server-side encryption with a customer-provided encryption key was
  /// requested, the response will include this header confirming the encryption
  /// algorithm used.
  final String sSECustomerAlgorithm;

  /// If server-side encryption with a customer-provided encryption key was
  /// requested, the response will include this header to provide round-trip
  /// message integrity verification of the customer-provided encryption key.
  final String sSECustomerKeyMD5;

  /// If present, specifies the AWS KMS Encryption Context to use for object
  /// encryption. The value of this header is a base64-encoded UTF-8 string
  /// holding JSON with the encryption context key-value pairs.
  final String sSEKMSEncryptionContext;

  /// If <code>x-amz-server-side-encryption</code> is present and has the value of
  /// <code>aws:kms</code>, this header specifies the ID of the AWS Key Management
  /// Service (AWS KMS) symmetric customer managed customer master key (CMK) that
  /// was used for the object.
  final String sSEKMSKeyId;

  /// If you specified server-side encryption either with an AWS KMS customer
  /// master key (CMK) or Amazon S3-managed encryption key in your PUT request,
  /// the response includes this header. It confirms the encryption algorithm that
  /// Amazon S3 used to encrypt the object.
  final ServerSideEncryption serverSideEncryption;

  /// Version of the object.
  final String versionId;

  PutObjectOutput({
    this.bucketKeyEnabled,
    this.eTag,
    this.expiration,
    this.requestCharged,
    this.sSECustomerAlgorithm,
    this.sSECustomerKeyMD5,
    this.sSEKMSEncryptionContext,
    this.sSEKMSKeyId,
    this.serverSideEncryption,
    this.versionId,
  });
}

class PutObjectRetentionOutput {
  final RequestCharged requestCharged;

  PutObjectRetentionOutput({
    this.requestCharged,
  });
}

class PutObjectTaggingOutput {
  /// The versionId of the object the tag-set was added to.
  final String versionId;

  PutObjectTaggingOutput({
    this.versionId,
  });
}

/// Specifies the configuration for publishing messages to an Amazon Simple
/// Queue Service (Amazon SQS) queue when Amazon S3 detects specified events.
class QueueConfiguration {
  /// A collection of bucket events for which to send notifications
  final List<Event> events;

  /// The Amazon Resource Name (ARN) of the Amazon SQS queue to which Amazon S3
  /// publishes a message when it detects events of the specified type.
  final String queueArn;
  final NotificationConfigurationFilter filter;
  final String id;

  QueueConfiguration({
    @_s.required this.events,
    @_s.required this.queueArn,
    this.filter,
    this.id,
  });
  factory QueueConfiguration.fromXml(_s.XmlElement elem) {
    return QueueConfiguration(
      events: _s
          .extractXmlStringListValues(elem, 'Event')
          .map((s) => s.toEvent())
          .toList(),
      queueArn: _s.extractXmlStringValue(elem, 'Queue'),
      filter: _s
          .extractXmlChild(elem, 'Filter')
          ?.let((e) => NotificationConfigurationFilter.fromXml(e)),
      id: _s.extractXmlStringValue(elem, 'Id'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (id != null) _s.encodeXmlStringValue('Id', id),
      _s.encodeXmlStringValue('Queue', queueArn),
      ...events
          ?.map((e) => _s.encodeXmlStringValue('Event', e?.toValue() ?? '')),
      if (filter != null) filter?.toXml('Filter'),
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

/// This data type is deprecated. Use <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_QueueConfiguration.html">QueueConfiguration</a>
/// for the same purposes. This data type specifies the configuration for
/// publishing messages to an Amazon Simple Queue Service (Amazon SQS) queue
/// when Amazon S3 detects specified events.
class QueueConfigurationDeprecated {
  final Event event;

  /// A collection of bucket events for which to send notifications
  final List<Event> events;
  final String id;

  /// The Amazon Resource Name (ARN) of the Amazon SQS queue to which Amazon S3
  /// publishes a message when it detects events of the specified type.
  final String queue;

  QueueConfigurationDeprecated({
    this.event,
    this.events,
    this.id,
    this.queue,
  });
  factory QueueConfigurationDeprecated.fromXml(_s.XmlElement elem) {
    return QueueConfigurationDeprecated(
      event: _s.extractXmlStringValue(elem, 'Event')?.toEvent(),
      events: _s
          .extractXmlStringListValues(elem, 'Event')
          .map((s) => s.toEvent())
          .toList(),
      id: _s.extractXmlStringValue(elem, 'Id'),
      queue: _s.extractXmlStringValue(elem, 'Queue'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (id != null) _s.encodeXmlStringValue('Id', id),
      if (event != null) _s.encodeXmlStringValue('Event', event.toValue()),
      if (events != null)
        ...events
            .map((e) => _s.encodeXmlStringValue('Event', e?.toValue() ?? '')),
      if (queue != null) _s.encodeXmlStringValue('Queue', queue),
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

enum QuoteFields {
  always,
  asneeded,
}

extension on QuoteFields {
  String toValue() {
    switch (this) {
      case QuoteFields.always:
        return 'ALWAYS';
      case QuoteFields.asneeded:
        return 'ASNEEDED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  QuoteFields toQuoteFields() {
    switch (this) {
      case 'ALWAYS':
        return QuoteFields.always;
      case 'ASNEEDED':
        return QuoteFields.asneeded;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The container for the records event.
class RecordsEvent {
  /// The byte array of partial, one or more result records.
  final Uint8List payload;

  RecordsEvent({
    this.payload,
  });
  factory RecordsEvent.fromXml(_s.XmlElement elem) {
    return RecordsEvent(
      payload: _s.extractXmlUint8ListValue(elem, 'Payload'),
    );
  }
}

/// Specifies how requests are redirected. In the event of an error, you can
/// specify a different error code to return.
class Redirect {
  /// The host name to use in the redirect request.
  final String hostName;

  /// The HTTP redirect code to use on the response. Not required if one of the
  /// siblings is present.
  final String httpRedirectCode;

  /// Protocol to use when redirecting requests. The default is the protocol that
  /// is used in the original request.
  final Protocol protocol;

  /// The object key prefix to use in the redirect request. For example, to
  /// redirect requests for all pages with prefix <code>docs/</code> (objects in
  /// the <code>docs/</code> folder) to <code>documents/</code>, you can set a
  /// condition block with <code>KeyPrefixEquals</code> set to <code>docs/</code>
  /// and in the Redirect set <code>ReplaceKeyPrefixWith</code> to
  /// <code>/documents</code>. Not required if one of the siblings is present. Can
  /// be present only if <code>ReplaceKeyWith</code> is not provided.
  final String replaceKeyPrefixWith;

  /// The specific object key to use in the redirect request. For example,
  /// redirect request to <code>error.html</code>. Not required if one of the
  /// siblings is present. Can be present only if
  /// <code>ReplaceKeyPrefixWith</code> is not provided.
  final String replaceKeyWith;

  Redirect({
    this.hostName,
    this.httpRedirectCode,
    this.protocol,
    this.replaceKeyPrefixWith,
    this.replaceKeyWith,
  });
  factory Redirect.fromXml(_s.XmlElement elem) {
    return Redirect(
      hostName: _s.extractXmlStringValue(elem, 'HostName'),
      httpRedirectCode: _s.extractXmlStringValue(elem, 'HttpRedirectCode'),
      protocol: _s.extractXmlStringValue(elem, 'Protocol')?.toProtocol(),
      replaceKeyPrefixWith:
          _s.extractXmlStringValue(elem, 'ReplaceKeyPrefixWith'),
      replaceKeyWith: _s.extractXmlStringValue(elem, 'ReplaceKeyWith'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (hostName != null) _s.encodeXmlStringValue('HostName', hostName),
      if (httpRedirectCode != null)
        _s.encodeXmlStringValue('HttpRedirectCode', httpRedirectCode),
      if (protocol != null)
        _s.encodeXmlStringValue('Protocol', protocol.toValue()),
      if (replaceKeyPrefixWith != null)
        _s.encodeXmlStringValue('ReplaceKeyPrefixWith', replaceKeyPrefixWith),
      if (replaceKeyWith != null)
        _s.encodeXmlStringValue('ReplaceKeyWith', replaceKeyWith),
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

/// Specifies the redirect behavior of all requests to a website endpoint of an
/// Amazon S3 bucket.
class RedirectAllRequestsTo {
  /// Name of the host where requests are redirected.
  final String hostName;

  /// Protocol to use when redirecting requests. The default is the protocol that
  /// is used in the original request.
  final Protocol protocol;

  RedirectAllRequestsTo({
    @_s.required this.hostName,
    this.protocol,
  });
  factory RedirectAllRequestsTo.fromXml(_s.XmlElement elem) {
    return RedirectAllRequestsTo(
      hostName: _s.extractXmlStringValue(elem, 'HostName'),
      protocol: _s.extractXmlStringValue(elem, 'Protocol')?.toProtocol(),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('HostName', hostName),
      if (protocol != null)
        _s.encodeXmlStringValue('Protocol', protocol.toValue()),
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

/// A filter that you can specify for selection for modifications on replicas.
/// Amazon S3 doesn't replicate replica modifications by default. In the latest
/// version of replication configuration (when <code>Filter</code> is
/// specified), you can specify this element and set the status to
/// <code>Enabled</code> to replicate modifications on replicas.
/// <note>
/// If you don't specify the <code>Filter</code> element, Amazon S3 assumes that
/// the replication configuration is the earlier version, V1. In the earlier
/// version, this element is not allowed.
/// </note>
class ReplicaModifications {
  /// Specifies whether Amazon S3 replicates modifications on replicas.
  final ReplicaModificationsStatus status;

  ReplicaModifications({
    @_s.required this.status,
  });
  factory ReplicaModifications.fromXml(_s.XmlElement elem) {
    return ReplicaModifications(
      status: _s
          .extractXmlStringValue(elem, 'Status')
          ?.toReplicaModificationsStatus(),
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

enum ReplicaModificationsStatus {
  enabled,
  disabled,
}

extension on ReplicaModificationsStatus {
  String toValue() {
    switch (this) {
      case ReplicaModificationsStatus.enabled:
        return 'Enabled';
      case ReplicaModificationsStatus.disabled:
        return 'Disabled';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  ReplicaModificationsStatus toReplicaModificationsStatus() {
    switch (this) {
      case 'Enabled':
        return ReplicaModificationsStatus.enabled;
      case 'Disabled':
        return ReplicaModificationsStatus.disabled;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// A container for replication rules. You can add up to 1,000 rules. The
/// maximum size of a replication configuration is 2 MB.
class ReplicationConfiguration {
  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
  /// (IAM) role that Amazon S3 assumes when replicating objects. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/replication-how-setup.html">How
  /// to Set Up Replication</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  final String role;

  /// A container for one or more replication rules. A replication configuration
  /// must have at least one rule and can contain a maximum of 1,000 rules.
  final List<ReplicationRule> rules;

  ReplicationConfiguration({
    @_s.required this.role,
    @_s.required this.rules,
  });
  factory ReplicationConfiguration.fromXml(_s.XmlElement elem) {
    return ReplicationConfiguration(
      role: _s.extractXmlStringValue(elem, 'Role'),
      rules: elem
          .findElements('Rule')
          .map((c) => ReplicationRule.fromXml(c))
          .toList(),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Role', role),
      ...rules?.map((e) => e?.toXml('Rule')),
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

/// Specifies which Amazon S3 objects to replicate and where to store the
/// replicas.
class ReplicationRule {
  /// A container for information about the replication destination and its
  /// configurations including enabling the S3 Replication Time Control (S3 RTC).
  final Destination destination;

  /// Specifies whether the rule is enabled.
  final ReplicationRuleStatus status;
  final DeleteMarkerReplication deleteMarkerReplication;

  /// <p/>
  final ExistingObjectReplication existingObjectReplication;
  final ReplicationRuleFilter filter;

  /// A unique identifier for the rule. The maximum value is 255 characters.
  final String id;

  /// An object key name prefix that identifies the object or objects to which the
  /// rule applies. The maximum prefix length is 1,024 characters. To include all
  /// objects in a bucket, specify an empty string.
  final String prefix;

  /// The priority indicates which rule has precedence whenever two or more
  /// replication rules conflict. Amazon S3 will attempt to replicate objects
  /// according to all replication rules. However, if there are two or more rules
  /// with the same destination bucket, then objects will be replicated according
  /// to the rule with the highest priority. The higher the number, the higher the
  /// priority.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/replication.html">Replication</a>
  /// in the <i>Amazon Simple Storage Service Developer Guide</i>.
  final int priority;

  /// A container that describes additional filters for identifying the source
  /// objects that you want to replicate. You can choose to enable or disable the
  /// replication of these objects. Currently, Amazon S3 supports only the filter
  /// that you can specify for objects created with server-side encryption using a
  /// customer master key (CMK) stored in AWS Key Management Service (SSE-KMS).
  final SourceSelectionCriteria sourceSelectionCriteria;

  ReplicationRule({
    @_s.required this.destination,
    @_s.required this.status,
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
      destination: _s
          .extractXmlChild(elem, 'Destination')
          ?.let((e) => Destination.fromXml(e)),
      status:
          _s.extractXmlStringValue(elem, 'Status')?.toReplicationRuleStatus(),
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

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (id != null) _s.encodeXmlStringValue('ID', id),
      if (priority != null) _s.encodeXmlIntValue('Priority', priority),
      if (prefix != null) _s.encodeXmlStringValue('Prefix', prefix),
      if (filter != null) filter?.toXml('Filter'),
      _s.encodeXmlStringValue('Status', status?.toValue() ?? ''),
      if (sourceSelectionCriteria != null)
        sourceSelectionCriteria?.toXml('SourceSelectionCriteria'),
      if (existingObjectReplication != null)
        existingObjectReplication?.toXml('ExistingObjectReplication'),
      destination?.toXml('Destination'),
      if (deleteMarkerReplication != null)
        deleteMarkerReplication?.toXml('DeleteMarkerReplication'),
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

/// A container for specifying rule filters. The filters determine the subset of
/// objects to which the rule applies. This element is required only if you
/// specify more than one filter.
///
/// For example:
///
/// <ul>
/// <li>
/// If you specify both a <code>Prefix</code> and a <code>Tag</code> filter,
/// wrap these filters in an <code>And</code> tag.
/// </li>
/// <li>
/// If you specify a filter based on multiple tags, wrap the <code>Tag</code>
/// elements in an <code>And</code> tag
/// </li>
/// </ul>
class ReplicationRuleAndOperator {
  /// An object key name prefix that identifies the subset of objects to which the
  /// rule applies.
  final String prefix;

  /// An array of tags containing key and value pairs.
  final List<Tag> tags;

  ReplicationRuleAndOperator({
    this.prefix,
    this.tags,
  });
  factory ReplicationRuleAndOperator.fromXml(_s.XmlElement elem) {
    return ReplicationRuleAndOperator(
      prefix: _s.extractXmlStringValue(elem, 'Prefix'),
      tags: elem.findElements('Tag').map((c) => Tag.fromXml(c)).toList(),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (prefix != null) _s.encodeXmlStringValue('Prefix', prefix),
      if (tags != null) ...tags.map((e) => e?.toXml('Tag')),
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

/// A filter that identifies the subset of objects to which the replication rule
/// applies. A <code>Filter</code> must specify exactly one <code>Prefix</code>,
/// <code>Tag</code>, or an <code>And</code> child element.
class ReplicationRuleFilter {
  /// A container for specifying rule filters. The filters determine the subset of
  /// objects to which the rule applies. This element is required only if you
  /// specify more than one filter. For example:
  ///
  /// <ul>
  /// <li>
  /// If you specify both a <code>Prefix</code> and a <code>Tag</code> filter,
  /// wrap these filters in an <code>And</code> tag.
  /// </li>
  /// <li>
  /// If you specify a filter based on multiple tags, wrap the <code>Tag</code>
  /// elements in an <code>And</code> tag.
  /// </li>
  /// </ul>
  final ReplicationRuleAndOperator and;

  /// An object key name prefix that identifies the subset of objects to which the
  /// rule applies.
  final String prefix;

  /// A container for specifying a tag key and value.
  ///
  /// The rule applies only to objects that have the tag in their tag set.
  final Tag tag;

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
      tag: _s.extractXmlChild(elem, 'Tag')?.let((e) => Tag.fromXml(e)),
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

enum ReplicationRuleStatus {
  enabled,
  disabled,
}

extension on ReplicationRuleStatus {
  String toValue() {
    switch (this) {
      case ReplicationRuleStatus.enabled:
        return 'Enabled';
      case ReplicationRuleStatus.disabled:
        return 'Disabled';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  ReplicationRuleStatus toReplicationRuleStatus() {
    switch (this) {
      case 'Enabled':
        return ReplicationRuleStatus.enabled;
      case 'Disabled':
        return ReplicationRuleStatus.disabled;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum ReplicationStatus {
  complete,
  pending,
  failed,
  replica,
}

extension on ReplicationStatus {
  String toValue() {
    switch (this) {
      case ReplicationStatus.complete:
        return 'COMPLETE';
      case ReplicationStatus.pending:
        return 'PENDING';
      case ReplicationStatus.failed:
        return 'FAILED';
      case ReplicationStatus.replica:
        return 'REPLICA';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  ReplicationStatus toReplicationStatus() {
    switch (this) {
      case 'COMPLETE':
        return ReplicationStatus.complete;
      case 'PENDING':
        return ReplicationStatus.pending;
      case 'FAILED':
        return ReplicationStatus.failed;
      case 'REPLICA':
        return ReplicationStatus.replica;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// A container specifying S3 Replication Time Control (S3 RTC) related
/// information, including whether S3 RTC is enabled and the time when all
/// objects and operations on objects must be replicated. Must be specified
/// together with a <code>Metrics</code> block.
class ReplicationTime {
  /// Specifies whether the replication time is enabled.
  final ReplicationTimeStatus status;

  /// A container specifying the time by which replication should be complete for
  /// all objects and operations on objects.
  final ReplicationTimeValue time;

  ReplicationTime({
    @_s.required this.status,
    @_s.required this.time,
  });
  factory ReplicationTime.fromXml(_s.XmlElement elem) {
    return ReplicationTime(
      status:
          _s.extractXmlStringValue(elem, 'Status')?.toReplicationTimeStatus(),
      time: _s
          .extractXmlChild(elem, 'Time')
          ?.let((e) => ReplicationTimeValue.fromXml(e)),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Status', status?.toValue() ?? ''),
      time?.toXml('Time'),
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

enum ReplicationTimeStatus {
  enabled,
  disabled,
}

extension on ReplicationTimeStatus {
  String toValue() {
    switch (this) {
      case ReplicationTimeStatus.enabled:
        return 'Enabled';
      case ReplicationTimeStatus.disabled:
        return 'Disabled';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  ReplicationTimeStatus toReplicationTimeStatus() {
    switch (this) {
      case 'Enabled':
        return ReplicationTimeStatus.enabled;
      case 'Disabled':
        return ReplicationTimeStatus.disabled;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// A container specifying the time value for S3 Replication Time Control (S3
/// RTC) and replication metrics <code>EventThreshold</code>.
class ReplicationTimeValue {
  /// Contains an integer specifying time in minutes.
  ///
  /// Valid values: 15 minutes.
  final int minutes;

  ReplicationTimeValue({
    this.minutes,
  });
  factory ReplicationTimeValue.fromXml(_s.XmlElement elem) {
    return ReplicationTimeValue(
      minutes: _s.extractXmlIntValue(elem, 'Minutes'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (minutes != null) _s.encodeXmlIntValue('Minutes', minutes),
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

/// If present, indicates that the requester was successfully charged for the
/// request.
enum RequestCharged {
  requester,
}

extension on RequestCharged {
  String toValue() {
    switch (this) {
      case RequestCharged.requester:
        return 'requester';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  RequestCharged toRequestCharged() {
    switch (this) {
      case 'requester':
        return RequestCharged.requester;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Confirms that the requester knows that they will be charged for the request.
/// Bucket owners need not specify this parameter in their requests. For
/// information about downloading objects from requester pays buckets, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html">Downloading
/// Objects in Requestor Pays Buckets</a> in the <i>Amazon S3 Developer
/// Guide</i>.
enum RequestPayer {
  requester,
}

extension on RequestPayer {
  String toValue() {
    switch (this) {
      case RequestPayer.requester:
        return 'requester';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  RequestPayer toRequestPayer() {
    switch (this) {
      case 'requester':
        return RequestPayer.requester;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Container for Payer.
class RequestPaymentConfiguration {
  /// Specifies who pays for the download and request fees.
  final Payer payer;

  RequestPaymentConfiguration({
    @_s.required this.payer,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Payer', payer?.toValue() ?? ''),
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

/// Container for specifying if periodic <code>QueryProgress</code> messages
/// should be sent.
class RequestProgress {
  /// Specifies whether periodic QueryProgress frames should be sent. Valid
  /// values: TRUE, FALSE. Default value: FALSE.
  final bool enabled;

  RequestProgress({
    this.enabled,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (enabled != null) _s.encodeXmlBoolValue('Enabled', enabled),
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

class RestoreObjectOutput {
  final RequestCharged requestCharged;

  /// Indicates the path in the provided S3 output location where Select results
  /// will be restored to.
  final String restoreOutputPath;

  RestoreObjectOutput({
    this.requestCharged,
    this.restoreOutputPath,
  });
}

/// Container for restore job parameters.
class RestoreRequest {
  /// Lifetime of the active copy in days. Do not use with restores that specify
  /// <code>OutputLocation</code>.
  ///
  /// The Days element is required for regular restores, and must not be provided
  /// for select requests.
  final int days;

  /// The optional description for the job.
  final String description;

  /// S3 Glacier related parameters pertaining to this job. Do not use with
  /// restores that specify <code>OutputLocation</code>.
  final GlacierJobParameters glacierJobParameters;

  /// Describes the location where the restore job's output is stored.
  final OutputLocation outputLocation;

  /// Describes the parameters for Select job types.
  final SelectParameters selectParameters;

  /// Retrieval tier at which the restore will be processed.
  final Tier tier;

  /// Type of restore request.
  final RestoreRequestType type;

  RestoreRequest({
    this.days,
    this.description,
    this.glacierJobParameters,
    this.outputLocation,
    this.selectParameters,
    this.tier,
    this.type,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (days != null) _s.encodeXmlIntValue('Days', days),
      if (glacierJobParameters != null)
        glacierJobParameters?.toXml('GlacierJobParameters'),
      if (type != null) _s.encodeXmlStringValue('Type', type.toValue()),
      if (tier != null) _s.encodeXmlStringValue('Tier', tier.toValue()),
      if (description != null)
        _s.encodeXmlStringValue('Description', description),
      if (selectParameters != null) selectParameters?.toXml('SelectParameters'),
      if (outputLocation != null) outputLocation?.toXml('OutputLocation'),
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

enum RestoreRequestType {
  select,
}

extension on RestoreRequestType {
  String toValue() {
    switch (this) {
      case RestoreRequestType.select:
        return 'SELECT';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  RestoreRequestType toRestoreRequestType() {
    switch (this) {
      case 'SELECT':
        return RestoreRequestType.select;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Specifies the redirect behavior and when a redirect is applied. For more
/// information about routing rules, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/how-to-page-redirect.html#advanced-conditional-redirects">Configuring
/// advanced conditional redirects</a> in the <i>Amazon Simple Storage Service
/// Developer Guide</i>.
class RoutingRule {
  /// Container for redirect information. You can redirect requests to another
  /// host, to another page, or with another protocol. In the event of an error,
  /// you can specify a different error code to return.
  final Redirect redirect;

  /// A container for describing a condition that must be met for the specified
  /// redirect to apply. For example, 1. If request is for pages in the
  /// <code>/docs</code> folder, redirect to the <code>/documents</code> folder.
  /// 2. If request results in HTTP error 4xx, redirect request to another host
  /// where you might process the error.
  final Condition condition;

  RoutingRule({
    @_s.required this.redirect,
    this.condition,
  });
  factory RoutingRule.fromXml(_s.XmlElement elem) {
    return RoutingRule(
      redirect:
          _s.extractXmlChild(elem, 'Redirect')?.let((e) => Redirect.fromXml(e)),
      condition: _s
          .extractXmlChild(elem, 'Condition')
          ?.let((e) => Condition.fromXml(e)),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (condition != null) condition?.toXml('Condition'),
      redirect?.toXml('Redirect'),
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

/// Specifies lifecycle rules for an Amazon S3 bucket. For more information, see
/// <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTBucketPUTlifecycle.html">Put
/// Bucket Lifecycle Configuration</a> in the <i>Amazon Simple Storage Service
/// API Reference</i>. For examples, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketLifecycleConfiguration.html#API_PutBucketLifecycleConfiguration_Examples">Put
/// Bucket Lifecycle Configuration Examples</a>
class Rule {
  /// Object key prefix that identifies one or more objects to which this rule
  /// applies.
  final String prefix;

  /// If <code>Enabled</code>, the rule is currently being applied. If
  /// <code>Disabled</code>, the rule is not currently being applied.
  final ExpirationStatus status;
  final AbortIncompleteMultipartUpload abortIncompleteMultipartUpload;

  /// Specifies the expiration for the lifecycle of the object.
  final LifecycleExpiration expiration;

  /// Unique identifier for the rule. The value can't be longer than 255
  /// characters.
  final String id;
  final NoncurrentVersionExpiration noncurrentVersionExpiration;
  final NoncurrentVersionTransition noncurrentVersionTransition;

  /// Specifies when an object transitions to a specified storage class. For more
  /// information about Amazon S3 lifecycle configuration rules, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/lifecycle-transition-general-considerations.html">Transitioning
  /// Objects Using Amazon S3 Lifecycle</a> in the <i>Amazon Simple Storage
  /// Service Developer Guide</i>.
  final Transition transition;

  Rule({
    @_s.required this.prefix,
    @_s.required this.status,
    this.abortIncompleteMultipartUpload,
    this.expiration,
    this.id,
    this.noncurrentVersionExpiration,
    this.noncurrentVersionTransition,
    this.transition,
  });
  factory Rule.fromXml(_s.XmlElement elem) {
    return Rule(
      prefix: _s.extractXmlStringValue(elem, 'Prefix'),
      status: _s.extractXmlStringValue(elem, 'Status')?.toExpirationStatus(),
      abortIncompleteMultipartUpload: _s
          .extractXmlChild(elem, 'AbortIncompleteMultipartUpload')
          ?.let((e) => AbortIncompleteMultipartUpload.fromXml(e)),
      expiration: _s
          .extractXmlChild(elem, 'Expiration')
          ?.let((e) => LifecycleExpiration.fromXml(e)),
      id: _s.extractXmlStringValue(elem, 'ID'),
      noncurrentVersionExpiration: _s
          .extractXmlChild(elem, 'NoncurrentVersionExpiration')
          ?.let((e) => NoncurrentVersionExpiration.fromXml(e)),
      noncurrentVersionTransition: _s
          .extractXmlChild(elem, 'NoncurrentVersionTransition')
          ?.let((e) => NoncurrentVersionTransition.fromXml(e)),
      transition: _s
          .extractXmlChild(elem, 'Transition')
          ?.let((e) => Transition.fromXml(e)),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (expiration != null) expiration?.toXml('Expiration'),
      if (id != null) _s.encodeXmlStringValue('ID', id),
      _s.encodeXmlStringValue('Prefix', prefix),
      _s.encodeXmlStringValue('Status', status?.toValue() ?? ''),
      if (transition != null) transition?.toXml('Transition'),
      if (noncurrentVersionTransition != null)
        noncurrentVersionTransition?.toXml('NoncurrentVersionTransition'),
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

/// A container for object key name prefix and suffix filtering rules.
class S3KeyFilter {
  final List<FilterRule> filterRules;

  S3KeyFilter({
    this.filterRules,
  });
  factory S3KeyFilter.fromXml(_s.XmlElement elem) {
    return S3KeyFilter(
      filterRules: elem
          .findElements('FilterRule')
          .map((c) => FilterRule.fromXml(c))
          .toList(),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (filterRules != null)
        ...filterRules.map((e) => e?.toXml('FilterRule')),
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

/// Describes an Amazon S3 location that will receive the results of the restore
/// request.
class S3Location {
  /// The name of the bucket where the restore results will be placed.
  final String bucketName;

  /// The prefix that is prepended to the restore results for this request.
  final String prefix;

  /// A list of grants that control access to the staged results.
  final List<Grant> accessControlList;

  /// The canned ACL to apply to the restore results.
  final ObjectCannedACL cannedACL;
  final Encryption encryption;

  /// The class of storage used to store the restore results.
  final StorageClass storageClass;

  /// The tag-set that is applied to the restore results.
  final Tagging tagging;

  /// A list of metadata to store with the restore results in S3.
  final List<MetadataEntry> userMetadata;

  S3Location({
    @_s.required this.bucketName,
    @_s.required this.prefix,
    this.accessControlList,
    this.cannedACL,
    this.encryption,
    this.storageClass,
    this.tagging,
    this.userMetadata,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('BucketName', bucketName),
      _s.encodeXmlStringValue('Prefix', prefix),
      if (encryption != null) encryption?.toXml('Encryption'),
      if (cannedACL != null)
        _s.encodeXmlStringValue('CannedACL', cannedACL.toValue()),
      if (accessControlList != null)
        _s.XmlElement(_s.XmlName('AccessControlList'), [],
            accessControlList.map((e) => e?.toXml('Grant'))),
      if (tagging != null) tagging?.toXml('Tagging'),
      if (userMetadata != null)
        _s.XmlElement(_s.XmlName('UserMetadata'), [],
            userMetadata.map((e) => e?.toXml('MetadataEntry'))),
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

/// Specifies the use of SSE-KMS to encrypt delivered inventory reports.
class SSEKMS {
  /// Specifies the ID of the AWS Key Management Service (AWS KMS) symmetric
  /// customer managed customer master key (CMK) to use for encrypting inventory
  /// reports.
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

/// Specifies the use of SSE-S3 to encrypt delivered inventory reports.
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

/// Specifies the byte range of the object to get the records from. A record is
/// processed when its first byte is contained by the range. This parameter is
/// optional, but when specified, it must not be empty. See RFC 2616, Section
/// 14.35.1 about how to specify the start and end of the range.
class ScanRange {
  /// Specifies the end of the byte range. This parameter is optional. Valid
  /// values: non-negative integers. The default value is one less than the size
  /// of the object being queried. If only the End parameter is supplied, it is
  /// interpreted to mean scan the last N bytes of the file. For example,
  /// <code>&lt;scanrange&gt;&lt;end&gt;50&lt;/end&gt;&lt;/scanrange&gt;</code>
  /// means scan the last 50 bytes.
  final int end;

  /// Specifies the start of the byte range. This parameter is optional. Valid
  /// values: non-negative integers. The default value is 0. If only start is
  /// supplied, it means scan from that point to the end of the file.For example;
  /// <code>&lt;scanrange&gt;&lt;start&gt;50&lt;/start&gt;&lt;/scanrange&gt;</code>
  /// means scan from byte 50 until the end of the file.
  final int start;

  ScanRange({
    this.end,
    this.start,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (start != null) _s.encodeXmlIntValue('Start', start),
      if (end != null) _s.encodeXmlIntValue('End', end),
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

/// The container for selecting objects from a content event stream.
class SelectObjectContentEventStream {
  /// The Continuation Event.
  final ContinuationEvent cont;

  /// The End Event.
  final EndEvent end;

  /// The Progress Event.
  final ProgressEvent progress;

  /// The Records Event.
  final RecordsEvent records;

  /// The Stats Event.
  final StatsEvent stats;

  SelectObjectContentEventStream({
    this.cont,
    this.end,
    this.progress,
    this.records,
    this.stats,
  });
  factory SelectObjectContentEventStream.fromXml(_s.XmlElement elem) {
    return SelectObjectContentEventStream(
      cont: _s
          .extractXmlChild(elem, 'Cont')
          ?.let((e) => ContinuationEvent.fromXml(e)),
      end: _s.extractXmlChild(elem, 'End')?.let((e) => EndEvent.fromXml(e)),
      progress: _s
          .extractXmlChild(elem, 'Progress')
          ?.let((e) => ProgressEvent.fromXml(e)),
      records: _s
          .extractXmlChild(elem, 'Records')
          ?.let((e) => RecordsEvent.fromXml(e)),
      stats:
          _s.extractXmlChild(elem, 'Stats')?.let((e) => StatsEvent.fromXml(e)),
    );
  }
}

class SelectObjectContentOutput {
  /// The array of results.
  final SelectObjectContentEventStream payload;

  SelectObjectContentOutput({
    this.payload,
  });
  factory SelectObjectContentOutput.fromXml(_s.XmlElement elem) {
    return SelectObjectContentOutput(
      payload: elem?.let((e) => SelectObjectContentEventStream.fromXml(e)),
    );
  }
}

/// Request to filter the contents of an Amazon S3 object based on a simple
/// Structured Query Language (SQL) statement. In the request, along with the
/// SQL expression, you must specify a data serialization format (JSON or CSV)
/// of the object. Amazon S3 uses this to parse object data into records. It
/// returns only records that match the specified SQL expression. You must also
/// specify the data serialization format for the response. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTObjectSELECTContent.html">S3Select
/// API Documentation</a>.
class SelectObjectContentRequest {
  /// The S3 bucket.
  final String bucket;

  /// The expression that is used to query the object.
  final String expression;

  /// The type of the provided expression (for example, SQL).
  final ExpressionType expressionType;

  /// Describes the format of the data in the object that is being queried.
  final InputSerialization inputSerialization;

  /// The object key.
  final String key;

  /// Describes the format of the data that you want Amazon S3 to return in
  /// response.
  final OutputSerialization outputSerialization;

  /// The account id of the expected bucket owner. If the bucket is owned by a
  /// different account, the request will fail with an HTTP <code>403 (Access
  /// Denied)</code> error.
  final String expectedBucketOwner;

  /// Specifies if periodic request progress information should be enabled.
  final RequestProgress requestProgress;

  /// The SSE Algorithm used to encrypt the object. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/ServerSideEncryptionCustomerKeys.html">Server-Side
  /// Encryption (Using Customer-Provided Encryption Keys</a>.
  final String sSECustomerAlgorithm;

  /// The SSE Customer Key. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/ServerSideEncryptionCustomerKeys.html">Server-Side
  /// Encryption (Using Customer-Provided Encryption Keys</a>.
  final Uint8List sSECustomerKey;

  /// The SSE Customer Key MD5. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/ServerSideEncryptionCustomerKeys.html">Server-Side
  /// Encryption (Using Customer-Provided Encryption Keys</a>.
  final String sSECustomerKeyMD5;

  /// Specifies the byte range of the object to get the records from. A record is
  /// processed when its first byte is contained by the range. This parameter is
  /// optional, but when specified, it must not be empty. See RFC 2616, Section
  /// 14.35.1 about how to specify the start and end of the range.
  ///
  /// <code>ScanRange</code>may be used in the following ways:
  ///
  /// <ul>
  /// <li>
  /// <code>&lt;scanrange&gt;&lt;start&gt;50&lt;/start&gt;&lt;end&gt;100&lt;/end&gt;&lt;/scanrange&gt;</code>
  /// - process only the records starting between the bytes 50 and 100 (inclusive,
  /// counting from zero)
  /// </li>
  /// <li>
  /// <code>&lt;scanrange&gt;&lt;start&gt;50&lt;/start&gt;&lt;/scanrange&gt;</code>
  /// - process only the records starting after the byte 50
  /// </li>
  /// <li>
  /// <code>&lt;scanrange&gt;&lt;end&gt;50&lt;/end&gt;&lt;/scanrange&gt;</code> -
  /// process only the records within the last 50 bytes of the file.
  /// </li>
  /// </ul>
  final ScanRange scanRange;

  SelectObjectContentRequest({
    @_s.required this.bucket,
    @_s.required this.expression,
    @_s.required this.expressionType,
    @_s.required this.inputSerialization,
    @_s.required this.key,
    @_s.required this.outputSerialization,
    this.expectedBucketOwner,
    this.requestProgress,
    this.sSECustomerAlgorithm,
    this.sSECustomerKey,
    this.sSECustomerKeyMD5,
    this.scanRange,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Expression', expression),
      _s.encodeXmlStringValue(
          'ExpressionType', expressionType?.toValue() ?? ''),
      if (requestProgress != null) requestProgress?.toXml('RequestProgress'),
      inputSerialization?.toXml('InputSerialization'),
      outputSerialization?.toXml('OutputSerialization'),
      if (scanRange != null) scanRange?.toXml('ScanRange'),
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

/// Describes the parameters for Select job types.
class SelectParameters {
  /// The expression that is used to query the object.
  final String expression;

  /// The type of the provided expression (for example, SQL).
  final ExpressionType expressionType;

  /// Describes the serialization format of the object.
  final InputSerialization inputSerialization;

  /// Describes how the results of the Select job are serialized.
  final OutputSerialization outputSerialization;

  SelectParameters({
    @_s.required this.expression,
    @_s.required this.expressionType,
    @_s.required this.inputSerialization,
    @_s.required this.outputSerialization,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      inputSerialization?.toXml('InputSerialization'),
      _s.encodeXmlStringValue(
          'ExpressionType', expressionType?.toValue() ?? ''),
      _s.encodeXmlStringValue('Expression', expression),
      outputSerialization?.toXml('OutputSerialization'),
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

enum ServerSideEncryption {
  aes256,
  awsKms,
}

extension on ServerSideEncryption {
  String toValue() {
    switch (this) {
      case ServerSideEncryption.aes256:
        return 'AES256';
      case ServerSideEncryption.awsKms:
        return 'aws:kms';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  ServerSideEncryption toServerSideEncryption() {
    switch (this) {
      case 'AES256':
        return ServerSideEncryption.aes256;
      case 'aws:kms':
        return ServerSideEncryption.awsKms;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes the default server-side encryption to apply to new objects in the
/// bucket. If a PUT Object request doesn't specify any server-side encryption,
/// this default encryption will be applied. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTBucketPUTencryption.html">PUT
/// Bucket encryption</a> in the <i>Amazon Simple Storage Service API
/// Reference</i>.
class ServerSideEncryptionByDefault {
  /// Server-side encryption algorithm to use for the default encryption.
  final ServerSideEncryption sSEAlgorithm;

  /// AWS Key Management Service (KMS) customer master key ID to use for the
  /// default encryption. This parameter is allowed if and only if
  /// <code>SSEAlgorithm</code> is set to <code>aws:kms</code>.
  ///
  /// You can specify the key ID or the Amazon Resource Name (ARN) of the CMK.
  /// However, if you are using encryption with cross-account operations, you must
  /// use a fully qualified CMK ARN. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/bucket-encryption.html#bucket-encryption-update-bucket-policy">Using
  /// encryption for cross-account operations</a>.
  ///
  /// <b>For example:</b>
  ///
  /// <ul>
  /// <li>
  /// Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Key ARN:
  /// <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// </ul> <important>
  /// Amazon S3 only supports symmetric CMKs and not asymmetric CMKs. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html">Using
  /// Symmetric and Asymmetric Keys</a> in the <i>AWS Key Management Service
  /// Developer Guide</i>.
  /// </important>
  final String kMSMasterKeyID;

  ServerSideEncryptionByDefault({
    @_s.required this.sSEAlgorithm,
    this.kMSMasterKeyID,
  });
  factory ServerSideEncryptionByDefault.fromXml(_s.XmlElement elem) {
    return ServerSideEncryptionByDefault(
      sSEAlgorithm: _s
          .extractXmlStringValue(elem, 'SSEAlgorithm')
          ?.toServerSideEncryption(),
      kMSMasterKeyID: _s.extractXmlStringValue(elem, 'KMSMasterKeyID'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('SSEAlgorithm', sSEAlgorithm?.toValue() ?? ''),
      if (kMSMasterKeyID != null)
        _s.encodeXmlStringValue('KMSMasterKeyID', kMSMasterKeyID),
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

/// Specifies the default server-side-encryption configuration.
class ServerSideEncryptionConfiguration {
  /// Container for information about a particular server-side encryption
  /// configuration rule.
  final List<ServerSideEncryptionRule> rules;

  ServerSideEncryptionConfiguration({
    @_s.required this.rules,
  });
  factory ServerSideEncryptionConfiguration.fromXml(_s.XmlElement elem) {
    return ServerSideEncryptionConfiguration(
      rules: elem
          .findElements('Rule')
          .map((c) => ServerSideEncryptionRule.fromXml(c))
          .toList(),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      ...rules?.map((e) => e?.toXml('Rule')),
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

/// Specifies the default server-side encryption configuration.
class ServerSideEncryptionRule {
  /// Specifies the default server-side encryption to apply to new objects in the
  /// bucket. If a PUT Object request doesn't specify any server-side encryption,
  /// this default encryption will be applied.
  final ServerSideEncryptionByDefault applyServerSideEncryptionByDefault;

  /// Specifies whether Amazon S3 should use an S3 Bucket Key with server-side
  /// encryption using KMS (SSE-KMS) for new objects in the bucket. Existing
  /// objects are not affected. Setting the <code>BucketKeyEnabled</code> element
  /// to <code>true</code> causes Amazon S3 to use an S3 Bucket Key. By default,
  /// S3 Bucket Key is not enabled.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/bucket-key.html">Amazon
  /// S3 Bucket Keys</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide</i>.
  final bool bucketKeyEnabled;

  ServerSideEncryptionRule({
    this.applyServerSideEncryptionByDefault,
    this.bucketKeyEnabled,
  });
  factory ServerSideEncryptionRule.fromXml(_s.XmlElement elem) {
    return ServerSideEncryptionRule(
      applyServerSideEncryptionByDefault: _s
          .extractXmlChild(elem, 'ApplyServerSideEncryptionByDefault')
          ?.let((e) => ServerSideEncryptionByDefault.fromXml(e)),
      bucketKeyEnabled: _s.extractXmlBoolValue(elem, 'BucketKeyEnabled'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (applyServerSideEncryptionByDefault != null)
        applyServerSideEncryptionByDefault
            ?.toXml('ApplyServerSideEncryptionByDefault'),
      if (bucketKeyEnabled != null)
        _s.encodeXmlBoolValue('BucketKeyEnabled', bucketKeyEnabled),
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

/// A container that describes additional filters for identifying the source
/// objects that you want to replicate. You can choose to enable or disable the
/// replication of these objects. Currently, Amazon S3 supports only the filter
/// that you can specify for objects created with server-side encryption using a
/// customer master key (CMK) stored in AWS Key Management Service (SSE-KMS).
class SourceSelectionCriteria {
  /// A filter that you can specify for selections for modifications on replicas.
  /// Amazon S3 doesn't replicate replica modifications by default. In the latest
  /// version of replication configuration (when <code>Filter</code> is
  /// specified), you can specify this element and set the status to
  /// <code>Enabled</code> to replicate modifications on replicas.
  /// <note>
  /// If you don't specify the <code>Filter</code> element, Amazon S3 assumes that
  /// the replication configuration is the earlier version, V1. In the earlier
  /// version, this element is not allowed
  /// </note>
  final ReplicaModifications replicaModifications;

  /// A container for filter information for the selection of Amazon S3 objects
  /// encrypted with AWS KMS. If you include <code>SourceSelectionCriteria</code>
  /// in the replication configuration, this element is required.
  final SseKmsEncryptedObjects sseKmsEncryptedObjects;

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

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (sseKmsEncryptedObjects != null)
        sseKmsEncryptedObjects?.toXml('SseKmsEncryptedObjects'),
      if (replicaModifications != null)
        replicaModifications?.toXml('ReplicaModifications'),
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

/// A container for filter information for the selection of S3 objects encrypted
/// with AWS KMS.
class SseKmsEncryptedObjects {
  /// Specifies whether Amazon S3 replicates objects created with server-side
  /// encryption using a customer master key (CMK) stored in AWS Key Management
  /// Service.
  final SseKmsEncryptedObjectsStatus status;

  SseKmsEncryptedObjects({
    @_s.required this.status,
  });
  factory SseKmsEncryptedObjects.fromXml(_s.XmlElement elem) {
    return SseKmsEncryptedObjects(
      status: _s
          .extractXmlStringValue(elem, 'Status')
          ?.toSseKmsEncryptedObjectsStatus(),
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

enum SseKmsEncryptedObjectsStatus {
  enabled,
  disabled,
}

extension on SseKmsEncryptedObjectsStatus {
  String toValue() {
    switch (this) {
      case SseKmsEncryptedObjectsStatus.enabled:
        return 'Enabled';
      case SseKmsEncryptedObjectsStatus.disabled:
        return 'Disabled';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  SseKmsEncryptedObjectsStatus toSseKmsEncryptedObjectsStatus() {
    switch (this) {
      case 'Enabled':
        return SseKmsEncryptedObjectsStatus.enabled;
      case 'Disabled':
        return SseKmsEncryptedObjectsStatus.disabled;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Container for the stats details.
class Stats {
  /// The total number of uncompressed object bytes processed.
  final int bytesProcessed;

  /// The total number of bytes of records payload data returned.
  final int bytesReturned;

  /// The total number of object bytes scanned.
  final int bytesScanned;

  Stats({
    this.bytesProcessed,
    this.bytesReturned,
    this.bytesScanned,
  });
  factory Stats.fromXml(_s.XmlElement elem) {
    return Stats(
      bytesProcessed: _s.extractXmlIntValue(elem, 'BytesProcessed'),
      bytesReturned: _s.extractXmlIntValue(elem, 'BytesReturned'),
      bytesScanned: _s.extractXmlIntValue(elem, 'BytesScanned'),
    );
  }
}

/// Container for the Stats Event.
class StatsEvent {
  /// The Stats event details.
  final Stats details;

  StatsEvent({
    this.details,
  });
  factory StatsEvent.fromXml(_s.XmlElement elem) {
    return StatsEvent(
      details:
          _s.extractXmlChild(elem, 'Details')?.let((e) => Stats.fromXml(e)),
    );
  }
}

enum StorageClass {
  standard,
  reducedRedundancy,
  standardIa,
  onezoneIa,
  intelligentTiering,
  glacier,
  deepArchive,
  outposts,
}

extension on StorageClass {
  String toValue() {
    switch (this) {
      case StorageClass.standard:
        return 'STANDARD';
      case StorageClass.reducedRedundancy:
        return 'REDUCED_REDUNDANCY';
      case StorageClass.standardIa:
        return 'STANDARD_IA';
      case StorageClass.onezoneIa:
        return 'ONEZONE_IA';
      case StorageClass.intelligentTiering:
        return 'INTELLIGENT_TIERING';
      case StorageClass.glacier:
        return 'GLACIER';
      case StorageClass.deepArchive:
        return 'DEEP_ARCHIVE';
      case StorageClass.outposts:
        return 'OUTPOSTS';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  StorageClass toStorageClass() {
    switch (this) {
      case 'STANDARD':
        return StorageClass.standard;
      case 'REDUCED_REDUNDANCY':
        return StorageClass.reducedRedundancy;
      case 'STANDARD_IA':
        return StorageClass.standardIa;
      case 'ONEZONE_IA':
        return StorageClass.onezoneIa;
      case 'INTELLIGENT_TIERING':
        return StorageClass.intelligentTiering;
      case 'GLACIER':
        return StorageClass.glacier;
      case 'DEEP_ARCHIVE':
        return StorageClass.deepArchive;
      case 'OUTPOSTS':
        return StorageClass.outposts;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Specifies data related to access patterns to be collected and made available
/// to analyze the tradeoffs between different storage classes for an Amazon S3
/// bucket.
class StorageClassAnalysis {
  /// Specifies how data related to the storage class analysis for an Amazon S3
  /// bucket should be exported.
  final StorageClassAnalysisDataExport dataExport;

  StorageClassAnalysis({
    this.dataExport,
  });
  factory StorageClassAnalysis.fromXml(_s.XmlElement elem) {
    return StorageClassAnalysis(
      dataExport: _s
          .extractXmlChild(elem, 'DataExport')
          ?.let((e) => StorageClassAnalysisDataExport.fromXml(e)),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (dataExport != null) dataExport?.toXml('DataExport'),
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

/// Container for data related to the storage class analysis for an Amazon S3
/// bucket for export.
class StorageClassAnalysisDataExport {
  /// The place to store the data for an analysis.
  final AnalyticsExportDestination destination;

  /// The version of the output schema to use when exporting data. Must be
  /// <code>V_1</code>.
  final StorageClassAnalysisSchemaVersion outputSchemaVersion;

  StorageClassAnalysisDataExport({
    @_s.required this.destination,
    @_s.required this.outputSchemaVersion,
  });
  factory StorageClassAnalysisDataExport.fromXml(_s.XmlElement elem) {
    return StorageClassAnalysisDataExport(
      destination: _s
          .extractXmlChild(elem, 'Destination')
          ?.let((e) => AnalyticsExportDestination.fromXml(e)),
      outputSchemaVersion: _s
          .extractXmlStringValue(elem, 'OutputSchemaVersion')
          ?.toStorageClassAnalysisSchemaVersion(),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue(
          'OutputSchemaVersion', outputSchemaVersion?.toValue() ?? ''),
      destination?.toXml('Destination'),
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

enum StorageClassAnalysisSchemaVersion {
  v_1,
}

extension on StorageClassAnalysisSchemaVersion {
  String toValue() {
    switch (this) {
      case StorageClassAnalysisSchemaVersion.v_1:
        return 'V_1';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  StorageClassAnalysisSchemaVersion toStorageClassAnalysisSchemaVersion() {
    switch (this) {
      case 'V_1':
        return StorageClassAnalysisSchemaVersion.v_1;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// A container of a key value name pair.
class Tag {
  /// Name of the object key.
  final String key;

  /// Value of the tag.
  final String value;

  Tag({
    @_s.required this.key,
    @_s.required this.value,
  });
  factory Tag.fromXml(_s.XmlElement elem) {
    return Tag(
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

/// Container for <code>TagSet</code> elements.
class Tagging {
  /// A collection for a set of tags
  final List<Tag> tagSet;

  Tagging({
    @_s.required this.tagSet,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.XmlElement(
          _s.XmlName('TagSet'), [], tagSet?.map((e) => e?.toXml('Tag'))),
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

enum TaggingDirective {
  copy,
  replace,
}

extension on TaggingDirective {
  String toValue() {
    switch (this) {
      case TaggingDirective.copy:
        return 'COPY';
      case TaggingDirective.replace:
        return 'REPLACE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  TaggingDirective toTaggingDirective() {
    switch (this) {
      case 'COPY':
        return TaggingDirective.copy;
      case 'REPLACE':
        return TaggingDirective.replace;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Container for granting information.
class TargetGrant {
  /// Container for the person being granted permissions.
  final Grantee grantee;

  /// Logging permissions assigned to the grantee for the bucket.
  final BucketLogsPermission permission;

  TargetGrant({
    this.grantee,
    this.permission,
  });
  factory TargetGrant.fromXml(_s.XmlElement elem) {
    return TargetGrant(
      grantee:
          _s.extractXmlChild(elem, 'Grantee')?.let((e) => Grantee.fromXml(e)),
      permission: _s
          .extractXmlStringValue(elem, 'Permission')
          ?.toBucketLogsPermission(),
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

enum Tier {
  standard,
  bulk,
  expedited,
}

extension on Tier {
  String toValue() {
    switch (this) {
      case Tier.standard:
        return 'Standard';
      case Tier.bulk:
        return 'Bulk';
      case Tier.expedited:
        return 'Expedited';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  Tier toTier() {
    switch (this) {
      case 'Standard':
        return Tier.standard;
      case 'Bulk':
        return Tier.bulk;
      case 'Expedited':
        return Tier.expedited;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The S3 Intelligent-Tiering storage class is designed to optimize storage
/// costs by automatically moving data to the most cost-effective storage access
/// tier, without additional operational overhead.
class Tiering {
  /// S3 Intelligent-Tiering access tier. See <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-class-intro.html#sc-dynamic-data-access">Storage
  /// class for automatically optimizing frequently and infrequently accessed
  /// objects</a> for a list of access tiers in the S3 Intelligent-Tiering storage
  /// class.
  final IntelligentTieringAccessTier accessTier;

  /// The number of consecutive days of no access after which an object will be
  /// eligible to be transitioned to the corresponding tier. The minimum number of
  /// days specified for Archive Access tier must be at least 90 days and Deep
  /// Archive Access tier must be at least 180 days. The maximum can be up to 2
  /// years (730 days).
  final int days;

  Tiering({
    @_s.required this.accessTier,
    @_s.required this.days,
  });
  factory Tiering.fromXml(_s.XmlElement elem) {
    return Tiering(
      accessTier: _s
          .extractXmlStringValue(elem, 'AccessTier')
          ?.toIntelligentTieringAccessTier(),
      days: _s.extractXmlIntValue(elem, 'Days'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlIntValue('Days', days),
      _s.encodeXmlStringValue('AccessTier', accessTier?.toValue() ?? ''),
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

/// A container for specifying the configuration for publication of messages to
/// an Amazon Simple Notification Service (Amazon SNS) topic when Amazon S3
/// detects specified events.
class TopicConfiguration {
  /// The Amazon S3 bucket event about which to send notifications. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html">Supported
  /// Event Types</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.
  final List<Event> events;

  /// The Amazon Resource Name (ARN) of the Amazon SNS topic to which Amazon S3
  /// publishes a message when it detects events of the specified type.
  final String topicArn;
  final NotificationConfigurationFilter filter;
  final String id;

  TopicConfiguration({
    @_s.required this.events,
    @_s.required this.topicArn,
    this.filter,
    this.id,
  });
  factory TopicConfiguration.fromXml(_s.XmlElement elem) {
    return TopicConfiguration(
      events: _s
          .extractXmlStringListValues(elem, 'Event')
          .map((s) => s.toEvent())
          .toList(),
      topicArn: _s.extractXmlStringValue(elem, 'Topic'),
      filter: _s
          .extractXmlChild(elem, 'Filter')
          ?.let((e) => NotificationConfigurationFilter.fromXml(e)),
      id: _s.extractXmlStringValue(elem, 'Id'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (id != null) _s.encodeXmlStringValue('Id', id),
      _s.encodeXmlStringValue('Topic', topicArn),
      ...events
          ?.map((e) => _s.encodeXmlStringValue('Event', e?.toValue() ?? '')),
      if (filter != null) filter?.toXml('Filter'),
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

/// A container for specifying the configuration for publication of messages to
/// an Amazon Simple Notification Service (Amazon SNS) topic when Amazon S3
/// detects specified events. This data type is deprecated. Use <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_TopicConfiguration.html">TopicConfiguration</a>
/// instead.
class TopicConfigurationDeprecated {
  /// Bucket event for which to send notifications.
  final Event event;

  /// A collection of events related to objects
  final List<Event> events;
  final String id;

  /// Amazon SNS topic to which Amazon S3 will publish a message to report the
  /// specified events for the bucket.
  final String topic;

  TopicConfigurationDeprecated({
    this.event,
    this.events,
    this.id,
    this.topic,
  });
  factory TopicConfigurationDeprecated.fromXml(_s.XmlElement elem) {
    return TopicConfigurationDeprecated(
      event: _s.extractXmlStringValue(elem, 'Event')?.toEvent(),
      events: _s
          .extractXmlStringListValues(elem, 'Event')
          .map((s) => s.toEvent())
          .toList(),
      id: _s.extractXmlStringValue(elem, 'Id'),
      topic: _s.extractXmlStringValue(elem, 'Topic'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (id != null) _s.encodeXmlStringValue('Id', id),
      if (events != null)
        ...events
            .map((e) => _s.encodeXmlStringValue('Event', e?.toValue() ?? '')),
      if (event != null) _s.encodeXmlStringValue('Event', event.toValue()),
      if (topic != null) _s.encodeXmlStringValue('Topic', topic),
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
/// information about Amazon S3 lifecycle configuration rules, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/lifecycle-transition-general-considerations.html">Transitioning
/// Objects Using Amazon S3 Lifecycle</a> in the <i>Amazon Simple Storage
/// Service Developer Guide</i>.
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
      date: _s.extractXmlDateTimeValue(elem, 'Date',
          parser: _s.timeStampFromJson),
      days: _s.extractXmlIntValue(elem, 'Days'),
      storageClass: _s
          .extractXmlStringValue(elem, 'StorageClass')
          ?.toTransitionStorageClass(),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (date != null)
        _s.encodeXmlDateTimeValue('Date', date, formatter: _s.iso8601ToJson),
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

enum Type {
  canonicalUser,
  amazonCustomerByEmail,
  group,
}

extension on Type {
  String toValue() {
    switch (this) {
      case Type.canonicalUser:
        return 'CanonicalUser';
      case Type.amazonCustomerByEmail:
        return 'AmazonCustomerByEmail';
      case Type.group:
        return 'Group';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  Type toType() {
    switch (this) {
      case 'CanonicalUser':
        return Type.canonicalUser;
      case 'AmazonCustomerByEmail':
        return Type.amazonCustomerByEmail;
      case 'Group':
        return Type.group;
    }
    throw Exception('Unknown enum value: $this');
  }
}

class UploadPartCopyOutput {
  /// Indicates whether the multipart upload uses an S3 Bucket Key for server-side
  /// encryption with AWS KMS (SSE-KMS).
  final bool bucketKeyEnabled;

  /// Container for all response elements.
  final CopyPartResult copyPartResult;

  /// The version of the source object that was copied, if you have enabled
  /// versioning on the source bucket.
  final String copySourceVersionId;
  final RequestCharged requestCharged;

  /// If server-side encryption with a customer-provided encryption key was
  /// requested, the response will include this header confirming the encryption
  /// algorithm used.
  final String sSECustomerAlgorithm;

  /// If server-side encryption with a customer-provided encryption key was
  /// requested, the response will include this header to provide round-trip
  /// message integrity verification of the customer-provided encryption key.
  final String sSECustomerKeyMD5;

  /// If present, specifies the ID of the AWS Key Management Service (AWS KMS)
  /// symmetric customer managed customer master key (CMK) that was used for the
  /// object.
  final String sSEKMSKeyId;

  /// The server-side encryption algorithm used when storing this object in Amazon
  /// S3 (for example, AES256, aws:kms).
  final ServerSideEncryption serverSideEncryption;

  UploadPartCopyOutput({
    this.bucketKeyEnabled,
    this.copyPartResult,
    this.copySourceVersionId,
    this.requestCharged,
    this.sSECustomerAlgorithm,
    this.sSECustomerKeyMD5,
    this.sSEKMSKeyId,
    this.serverSideEncryption,
  });
}

class UploadPartOutput {
  /// Indicates whether the multipart upload uses an S3 Bucket Key for server-side
  /// encryption with AWS KMS (SSE-KMS).
  final bool bucketKeyEnabled;

  /// Entity tag for the uploaded object.
  final String eTag;
  final RequestCharged requestCharged;

  /// If server-side encryption with a customer-provided encryption key was
  /// requested, the response will include this header confirming the encryption
  /// algorithm used.
  final String sSECustomerAlgorithm;

  /// If server-side encryption with a customer-provided encryption key was
  /// requested, the response will include this header to provide round-trip
  /// message integrity verification of the customer-provided encryption key.
  final String sSECustomerKeyMD5;

  /// If present, specifies the ID of the AWS Key Management Service (AWS KMS)
  /// symmetric customer managed customer master key (CMK) was used for the
  /// object.
  final String sSEKMSKeyId;

  /// The server-side encryption algorithm used when storing this object in Amazon
  /// S3 (for example, AES256, aws:kms).
  final ServerSideEncryption serverSideEncryption;

  UploadPartOutput({
    this.bucketKeyEnabled,
    this.eTag,
    this.requestCharged,
    this.sSECustomerAlgorithm,
    this.sSECustomerKeyMD5,
    this.sSEKMSKeyId,
    this.serverSideEncryption,
  });
}

/// Describes the versioning state of an Amazon S3 bucket. For more information,
/// see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTBucketPUTVersioningStatus.html">PUT
/// Bucket versioning</a> in the <i>Amazon Simple Storage Service API
/// Reference</i>.
class VersioningConfiguration {
  /// Specifies whether MFA delete is enabled in the bucket versioning
  /// configuration. This element is only returned if the bucket has been
  /// configured with MFA delete. If the bucket has never been so configured, this
  /// element is not returned.
  final MFADelete mFADelete;

  /// The versioning state of the bucket.
  final BucketVersioningStatus status;

  VersioningConfiguration({
    this.mFADelete,
    this.status,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
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
      $children.where((e) => e != null),
    );
  }
}

/// Specifies website configuration parameters for an Amazon S3 bucket.
class WebsiteConfiguration {
  /// The name of the error document for the website.
  final ErrorDocument errorDocument;

  /// The name of the index document for the website.
  final IndexDocument indexDocument;

  /// The redirect behavior for every request to this bucket's website endpoint.
  /// <important>
  /// If you specify this property, you can't specify any other property.
  /// </important>
  final RedirectAllRequestsTo redirectAllRequestsTo;

  /// Rules that define when a redirect is applied and the redirect behavior.
  final List<RoutingRule> routingRules;

  WebsiteConfiguration({
    this.errorDocument,
    this.indexDocument,
    this.redirectAllRequestsTo,
    this.routingRules,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (errorDocument != null) errorDocument?.toXml('ErrorDocument'),
      if (indexDocument != null) indexDocument?.toXml('IndexDocument'),
      if (redirectAllRequestsTo != null)
        redirectAllRequestsTo?.toXml('RedirectAllRequestsTo'),
      if (routingRules != null)
        _s.XmlElement(_s.XmlName('RoutingRules'), [],
            routingRules.map((e) => e?.toXml('RoutingRule'))),
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

class BucketAlreadyExists extends _s.GenericAwsException {
  BucketAlreadyExists({String type, String message})
      : super(type: type, code: 'BucketAlreadyExists', message: message);
}

class BucketAlreadyOwnedByYou extends _s.GenericAwsException {
  BucketAlreadyOwnedByYou({String type, String message})
      : super(type: type, code: 'BucketAlreadyOwnedByYou', message: message);
}

class InvalidObjectState extends _s.GenericAwsException {
  InvalidObjectState({String type, String message})
      : super(type: type, code: 'InvalidObjectState', message: message);
}

class NoSuchBucket extends _s.GenericAwsException {
  NoSuchBucket({String type, String message})
      : super(type: type, code: 'NoSuchBucket', message: message);
}

class NoSuchKey extends _s.GenericAwsException {
  NoSuchKey({String type, String message})
      : super(type: type, code: 'NoSuchKey', message: message);
}

class NoSuchUpload extends _s.GenericAwsException {
  NoSuchUpload({String type, String message})
      : super(type: type, code: 'NoSuchUpload', message: message);
}

class ObjectAlreadyInActiveTierError extends _s.GenericAwsException {
  ObjectAlreadyInActiveTierError({String type, String message})
      : super(
            type: type,
            code: 'ObjectAlreadyInActiveTierError',
            message: message);
}

class ObjectNotInActiveTierError extends _s.GenericAwsException {
  ObjectNotInActiveTierError({String type, String message})
      : super(type: type, code: 'ObjectNotInActiveTierError', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'BucketAlreadyExists': (type, message) =>
      BucketAlreadyExists(type: type, message: message),
  'BucketAlreadyOwnedByYou': (type, message) =>
      BucketAlreadyOwnedByYou(type: type, message: message),
  'InvalidObjectState': (type, message) =>
      InvalidObjectState(type: type, message: message),
  'NoSuchBucket': (type, message) => NoSuchBucket(type: type, message: message),
  'NoSuchKey': (type, message) => NoSuchKey(type: type, message: message),
  'NoSuchUpload': (type, message) => NoSuchUpload(type: type, message: message),
  'ObjectAlreadyInActiveTierError': (type, message) =>
      ObjectAlreadyInActiveTierError(type: type, message: message),
  'ObjectNotInActiveTierError': (type, message) =>
      ObjectNotInActiveTierError(type: type, message: message),
};
