// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        Uint8ListConverter,
        rfc822FromJson,
        rfc822ToJson,
        iso8601FromJson,
        iso8601ToJson,
        unixTimestampFromJson,
        unixTimestampToJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'elastictranscoder-2012-09-25.g.dart';

/// The AWS Elastic Transcoder Service.
class ElasticTranscoder {
  final _s.RestJsonProtocol _protocol;
  ElasticTranscoder({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: 'elastictranscoder',
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// The CancelJob operation cancels an unfinished job.
  /// <note>
  /// You can only cancel a job that has a status of <code>Submitted</code>. To
  /// prevent a pipeline from starting to process a job while you're getting the
  /// job identifier, use <a>UpdatePipelineStatus</a> to temporarily pause the
  /// pipeline.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [IncompatibleVersionException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [id] :
  /// The identifier of the job that you want to cancel.
  ///
  /// To get a list of the jobs (including their <code>jobId</code>) that have a
  /// status of <code>Submitted</code>, use the <a>ListJobsByStatus</a> API
  /// action.
  Future<void> cancelJob({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringPattern(
      'id',
      id,
      r'''^\d{13}-\w{6}$''',
      isRequired: true,
    );
    final $payload = CancelJobRequest(
      id: id,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri: '/2012-09-25/jobs/${Uri.encodeComponent(id.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return CancelJobResponse.fromJson(response);
  }

  /// When you create a job, Elastic Transcoder returns JSON data that includes
  /// the values that you specified plus information about the job that is
  /// created.
  ///
  /// If you have specified more than one output for your jobs (for example, one
  /// output for the Kindle Fire and another output for the Apple iPhone 4s),
  /// you currently must use the Elastic Transcoder API to list the jobs (as
  /// opposed to the AWS Console).
  ///
  /// May throw [ValidationException].
  /// May throw [IncompatibleVersionException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [pipelineId] :
  /// The <code>Id</code> of the pipeline that you want Elastic Transcoder to
  /// use for transcoding. The pipeline determines several settings, including
  /// the Amazon S3 bucket from which Elastic Transcoder gets the files to
  /// transcode and the bucket into which Elastic Transcoder puts the transcoded
  /// files.
  ///
  /// Parameter [input] :
  /// A section of the request body that provides information about the file
  /// that is being transcoded.
  ///
  /// Parameter [inputs] :
  /// A section of the request body that provides information about the files
  /// that are being transcoded.
  ///
  /// Parameter [output] :
  /// A section of the request body that provides information about the
  /// transcoded (target) file. We strongly recommend that you use the
  /// <code>Outputs</code> syntax instead of the <code>Output</code> syntax.
  ///
  /// Parameter [outputKeyPrefix] :
  /// The value, if any, that you want Elastic Transcoder to prepend to the
  /// names of all files that this job creates, including output files,
  /// thumbnails, and playlists.
  ///
  /// Parameter [outputs] :
  /// A section of the request body that provides information about the
  /// transcoded (target) files. We recommend that you use the
  /// <code>Outputs</code> syntax instead of the <code>Output</code> syntax.
  ///
  /// Parameter [playlists] :
  /// If you specify a preset in <code>PresetId</code> for which the value of
  /// <code>Container</code> is fmp4 (Fragmented MP4) or ts (MPEG-TS), Playlists
  /// contains information about the master playlists that you want Elastic
  /// Transcoder to create.
  ///
  /// The maximum number of master playlists in a job is 30.
  ///
  /// Parameter [userMetadata] :
  /// User-defined metadata that you want to associate with an Elastic
  /// Transcoder job. You specify metadata in <code>key/value</code> pairs, and
  /// you can add up to 10 <code>key/value</code> pairs per job. Elastic
  /// Transcoder does not guarantee that <code>key/value</code> pairs are
  /// returned in the same order in which you specify them.
  Future<CreateJobResponse> createJob({
    @_s.required String pipelineId,
    JobInput input,
    List<JobInput> inputs,
    CreateJobOutput output,
    String outputKeyPrefix,
    List<CreateJobOutput> outputs,
    List<CreateJobPlaylist> playlists,
    Map<String, String> userMetadata,
  }) async {
    ArgumentError.checkNotNull(pipelineId, 'pipelineId');
    _s.validateStringPattern(
      'pipelineId',
      pipelineId,
      r'''^\d{13}-\w{6}$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'outputKeyPrefix',
      outputKeyPrefix,
      1,
      255,
    );
    final $payload = CreateJobRequest(
      pipelineId: pipelineId,
      input: input,
      inputs: inputs,
      output: output,
      outputKeyPrefix: outputKeyPrefix,
      outputs: outputs,
      playlists: playlists,
      userMetadata: userMetadata,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2012-09-25/jobs',
      exceptionFnMap: _exceptionFns,
    );
    return CreateJobResponse.fromJson(response);
  }

  /// The CreatePipeline operation creates a pipeline with settings that you
  /// specify.
  ///
  /// May throw [ValidationException].
  /// May throw [IncompatibleVersionException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [inputBucket] :
  /// The Amazon S3 bucket in which you saved the media files that you want to
  /// transcode.
  ///
  /// Parameter [name] :
  /// The name of the pipeline. We recommend that the name be unique within the
  /// AWS account, but uniqueness is not enforced.
  ///
  /// Constraints: Maximum 40 characters.
  ///
  /// Parameter [role] :
  /// The IAM Amazon Resource Name (ARN) for the role that you want Elastic
  /// Transcoder to use to create the pipeline.
  ///
  /// Parameter [awsKmsKeyArn] :
  /// The AWS Key Management Service (AWS KMS) key that you want to use with
  /// this pipeline.
  ///
  /// If you use either <code>s3</code> or <code>s3-aws-kms</code> as your
  /// <code>Encryption:Mode</code>, you don't need to provide a key with your
  /// job because a default key, known as an AWS-KMS key, is created for you
  /// automatically. You need to provide an AWS-KMS key only if you want to use
  /// a non-default AWS-KMS key, or if you are using an
  /// <code>Encryption:Mode</code> of <code>aes-cbc-pkcs7</code>,
  /// <code>aes-ctr</code>, or <code>aes-gcm</code>.
  ///
  /// Parameter [contentConfig] :
  /// The optional <code>ContentConfig</code> object specifies information about
  /// the Amazon S3 bucket in which you want Elastic Transcoder to save
  /// transcoded files and playlists: which bucket to use, which users you want
  /// to have access to the files, the type of access you want users to have,
  /// and the storage class that you want to assign to the files.
  ///
  /// If you specify values for <code>ContentConfig</code>, you must also
  /// specify values for <code>ThumbnailConfig</code>.
  ///
  /// If you specify values for <code>ContentConfig</code> and
  /// <code>ThumbnailConfig</code>, omit the <code>OutputBucket</code> object.
  ///
  /// <ul>
  /// <li>
  /// <b>Bucket</b>: The Amazon S3 bucket in which you want Elastic Transcoder
  /// to save transcoded files and playlists.
  /// </li>
  /// <li>
  /// <b>Permissions</b> (Optional): The Permissions object specifies which
  /// users you want to have access to transcoded files and the type of access
  /// you want them to have. You can grant permissions to a maximum of 30 users
  /// and/or predefined Amazon S3 groups.
  /// </li>
  /// <li>
  /// <b>Grantee Type</b>: Specify the type of value that appears in the
  /// <code>Grantee</code> object:
  ///
  /// <ul>
  /// <li>
  /// <b>Canonical</b>: The value in the <code>Grantee</code> object is either
  /// the canonical user ID for an AWS account or an origin access identity for
  /// an Amazon CloudFront distribution. For more information about canonical
  /// user IDs, see Access Control List (ACL) Overview in the Amazon Simple
  /// Storage Service Developer Guide. For more information about using
  /// CloudFront origin access identities to require that users use CloudFront
  /// URLs instead of Amazon S3 URLs, see Using an Origin Access Identity to
  /// Restrict Access to Your Amazon S3 Content.
  /// <important>
  /// A canonical user ID is not the same as an AWS account number.
  /// </important> </li>
  /// <li>
  /// <b>Email</b>: The value in the <code>Grantee</code> object is the
  /// registered email address of an AWS account.
  /// </li>
  /// <li>
  /// <b>Group</b>: The value in the <code>Grantee</code> object is one of the
  /// following predefined Amazon S3 groups: <code>AllUsers</code>,
  /// <code>AuthenticatedUsers</code>, or <code>LogDelivery</code>.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b>Grantee</b>: The AWS user or group that you want to have access to
  /// transcoded files and playlists. To identify the user or group, you can
  /// specify the canonical user ID for an AWS account, an origin access
  /// identity for a CloudFront distribution, the registered email address of an
  /// AWS account, or a predefined Amazon S3 group
  /// </li>
  /// <li>
  /// <b>Access</b>: The permission that you want to give to the AWS user that
  /// you specified in <code>Grantee</code>. Permissions are granted on the
  /// files that Elastic Transcoder adds to the bucket, including playlists and
  /// video files. Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>READ</code>: The grantee can read the objects and metadata for
  /// objects that Elastic Transcoder adds to the Amazon S3 bucket.
  /// </li>
  /// <li>
  /// <code>READ_ACP</code>: The grantee can read the object ACL for objects
  /// that Elastic Transcoder adds to the Amazon S3 bucket.
  /// </li>
  /// <li>
  /// <code>WRITE_ACP</code>: The grantee can write the ACL for the objects that
  /// Elastic Transcoder adds to the Amazon S3 bucket.
  /// </li>
  /// <li>
  /// <code>FULL_CONTROL</code>: The grantee has <code>READ</code>,
  /// <code>READ_ACP</code>, and <code>WRITE_ACP</code> permissions for the
  /// objects that Elastic Transcoder adds to the Amazon S3 bucket.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b>StorageClass</b>: The Amazon S3 storage class, <code>Standard</code> or
  /// <code>ReducedRedundancy</code>, that you want Elastic Transcoder to assign
  /// to the video files and playlists that it stores in your Amazon S3 bucket.
  /// </li>
  /// </ul>
  ///
  /// Parameter [notifications] :
  /// The Amazon Simple Notification Service (Amazon SNS) topic that you want to
  /// notify to report job status.
  /// <important>
  /// To receive notifications, you must also subscribe to the new topic in the
  /// Amazon SNS console.
  /// </important>
  /// <ul>
  /// <li>
  /// <b>Progressing</b>: The topic ARN for the Amazon Simple Notification
  /// Service (Amazon SNS) topic that you want to notify when Elastic Transcoder
  /// has started to process a job in this pipeline. This is the ARN that Amazon
  /// SNS returned when you created the topic. For more information, see Create
  /// a Topic in the Amazon Simple Notification Service Developer Guide.
  /// </li>
  /// <li>
  /// <b>Complete</b>: The topic ARN for the Amazon SNS topic that you want to
  /// notify when Elastic Transcoder has finished processing a job in this
  /// pipeline. This is the ARN that Amazon SNS returned when you created the
  /// topic.
  /// </li>
  /// <li>
  /// <b>Warning</b>: The topic ARN for the Amazon SNS topic that you want to
  /// notify when Elastic Transcoder encounters a warning condition while
  /// processing a job in this pipeline. This is the ARN that Amazon SNS
  /// returned when you created the topic.
  /// </li>
  /// <li>
  /// <b>Error</b>: The topic ARN for the Amazon SNS topic that you want to
  /// notify when Elastic Transcoder encounters an error condition while
  /// processing a job in this pipeline. This is the ARN that Amazon SNS
  /// returned when you created the topic.
  /// </li>
  /// </ul>
  ///
  /// Parameter [outputBucket] :
  /// The Amazon S3 bucket in which you want Elastic Transcoder to save the
  /// transcoded files. (Use this, or use ContentConfig:Bucket plus
  /// ThumbnailConfig:Bucket.)
  ///
  /// Specify this value when all of the following are true:
  ///
  /// <ul>
  /// <li>
  /// You want to save transcoded files, thumbnails (if any), and playlists (if
  /// any) together in one bucket.
  /// </li>
  /// <li>
  /// You do not want to specify the users or groups who have access to the
  /// transcoded files, thumbnails, and playlists.
  /// </li>
  /// <li>
  /// You do not want to specify the permissions that Elastic Transcoder grants
  /// to the files.
  /// <important>
  /// When Elastic Transcoder saves files in <code>OutputBucket</code>, it
  /// grants full control over the files only to the AWS account that owns the
  /// role that is specified by <code>Role</code>.
  /// </important> </li>
  /// <li>
  /// You want to associate the transcoded files and thumbnails with the Amazon
  /// S3 Standard storage class.
  /// </li>
  /// </ul>
  /// If you want to save transcoded files and playlists in one bucket and
  /// thumbnails in another bucket, specify which users can access the
  /// transcoded files or the permissions the users have, or change the Amazon
  /// S3 storage class, omit <code>OutputBucket</code> and specify values for
  /// <code>ContentConfig</code> and <code>ThumbnailConfig</code> instead.
  ///
  /// Parameter [thumbnailConfig] :
  /// The <code>ThumbnailConfig</code> object specifies several values,
  /// including the Amazon S3 bucket in which you want Elastic Transcoder to
  /// save thumbnail files, which users you want to have access to the files,
  /// the type of access you want users to have, and the storage class that you
  /// want to assign to the files.
  ///
  /// If you specify values for <code>ContentConfig</code>, you must also
  /// specify values for <code>ThumbnailConfig</code> even if you don't want to
  /// create thumbnails.
  ///
  /// If you specify values for <code>ContentConfig</code> and
  /// <code>ThumbnailConfig</code>, omit the <code>OutputBucket</code> object.
  ///
  /// <ul>
  /// <li>
  /// <b>Bucket</b>: The Amazon S3 bucket in which you want Elastic Transcoder
  /// to save thumbnail files.
  /// </li>
  /// <li>
  /// <b>Permissions</b> (Optional): The <code>Permissions</code> object
  /// specifies which users and/or predefined Amazon S3 groups you want to have
  /// access to thumbnail files, and the type of access you want them to have.
  /// You can grant permissions to a maximum of 30 users and/or predefined
  /// Amazon S3 groups.
  /// </li>
  /// <li>
  /// <b>GranteeType</b>: Specify the type of value that appears in the Grantee
  /// object:
  ///
  /// <ul>
  /// <li>
  /// <b>Canonical</b>: The value in the <code>Grantee</code> object is either
  /// the canonical user ID for an AWS account or an origin access identity for
  /// an Amazon CloudFront distribution.
  /// <important>
  /// A canonical user ID is not the same as an AWS account number.
  /// </important> </li>
  /// <li>
  /// <b>Email</b>: The value in the <code>Grantee</code> object is the
  /// registered email address of an AWS account.
  /// </li>
  /// <li>
  /// <b>Group</b>: The value in the <code>Grantee</code> object is one of the
  /// following predefined Amazon S3 groups: <code>AllUsers</code>,
  /// <code>AuthenticatedUsers</code>, or <code>LogDelivery</code>.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b>Grantee</b>: The AWS user or group that you want to have access to
  /// thumbnail files. To identify the user or group, you can specify the
  /// canonical user ID for an AWS account, an origin access identity for a
  /// CloudFront distribution, the registered email address of an AWS account,
  /// or a predefined Amazon S3 group.
  /// </li>
  /// <li>
  /// <b>Access</b>: The permission that you want to give to the AWS user that
  /// you specified in <code>Grantee</code>. Permissions are granted on the
  /// thumbnail files that Elastic Transcoder adds to the bucket. Valid values
  /// include:
  ///
  /// <ul>
  /// <li>
  /// <code>READ</code>: The grantee can read the thumbnails and metadata for
  /// objects that Elastic Transcoder adds to the Amazon S3 bucket.
  /// </li>
  /// <li>
  /// <code>READ_ACP</code>: The grantee can read the object ACL for thumbnails
  /// that Elastic Transcoder adds to the Amazon S3 bucket.
  /// </li>
  /// <li>
  /// <code>WRITE_ACP</code>: The grantee can write the ACL for the thumbnails
  /// that Elastic Transcoder adds to the Amazon S3 bucket.
  /// </li>
  /// <li>
  /// <code>FULL_CONTROL</code>: The grantee has <code>READ</code>,
  /// <code>READ_ACP</code>, and <code>WRITE_ACP</code> permissions for the
  /// thumbnails that Elastic Transcoder adds to the Amazon S3 bucket.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b>StorageClass</b>: The Amazon S3 storage class, <code>Standard</code> or
  /// <code>ReducedRedundancy</code>, that you want Elastic Transcoder to assign
  /// to the thumbnails that it stores in your Amazon S3 bucket.
  /// </li>
  /// </ul>
  Future<CreatePipelineResponse> createPipeline({
    @_s.required String inputBucket,
    @_s.required String name,
    @_s.required String role,
    String awsKmsKeyArn,
    PipelineOutputConfig contentConfig,
    Notifications notifications,
    String outputBucket,
    PipelineOutputConfig thumbnailConfig,
  }) async {
    ArgumentError.checkNotNull(inputBucket, 'inputBucket');
    _s.validateStringPattern(
      'inputBucket',
      inputBucket,
      r'''^(\w|\.|-){1,255}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      40,
      isRequired: true,
    );
    ArgumentError.checkNotNull(role, 'role');
    _s.validateStringPattern(
      'role',
      role,
      r'''^arn:aws:iam::\w{12}:role/.+$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'awsKmsKeyArn',
      awsKmsKeyArn,
      0,
      255,
    );
    _s.validateStringPattern(
      'outputBucket',
      outputBucket,
      r'''^(\w|\.|-){1,255}$''',
    );
    final $payload = CreatePipelineRequest(
      inputBucket: inputBucket,
      name: name,
      role: role,
      awsKmsKeyArn: awsKmsKeyArn,
      contentConfig: contentConfig,
      notifications: notifications,
      outputBucket: outputBucket,
      thumbnailConfig: thumbnailConfig,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2012-09-25/pipelines',
      exceptionFnMap: _exceptionFns,
    );
    return CreatePipelineResponse.fromJson(response);
  }

  /// The CreatePreset operation creates a preset with settings that you
  /// specify.
  /// <important>
  /// Elastic Transcoder checks the CreatePreset settings to ensure that they
  /// meet Elastic Transcoder requirements and to determine whether they comply
  /// with H.264 standards. If your settings are not valid for Elastic
  /// Transcoder, Elastic Transcoder returns an HTTP 400 response
  /// (<code>ValidationException</code>) and does not create the preset. If the
  /// settings are valid for Elastic Transcoder but aren't strictly compliant
  /// with the H.264 standard, Elastic Transcoder creates the preset and returns
  /// a warning message in the response. This helps you determine whether your
  /// settings comply with the H.264 standard while giving you greater
  /// flexibility with respect to the video that Elastic Transcoder produces.
  /// </important>
  /// Elastic Transcoder uses the H.264 video-compression format. For more
  /// information, see the International Telecommunication Union publication
  /// <i>Recommendation ITU-T H.264: Advanced video coding for generic
  /// audiovisual services</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [IncompatibleVersionException].
  /// May throw [AccessDeniedException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [container] :
  /// The container type for the output file. Valid values include
  /// <code>flac</code>, <code>flv</code>, <code>fmp4</code>, <code>gif</code>,
  /// <code>mp3</code>, <code>mp4</code>, <code>mpg</code>, <code>mxf</code>,
  /// <code>oga</code>, <code>ogg</code>, <code>ts</code>, and
  /// <code>webm</code>.
  ///
  /// Parameter [name] :
  /// The name of the preset. We recommend that the name be unique within the
  /// AWS account, but uniqueness is not enforced.
  ///
  /// Parameter [audio] :
  /// A section of the request body that specifies the audio parameters.
  ///
  /// Parameter [description] :
  /// A description of the preset.
  ///
  /// Parameter [thumbnails] :
  /// A section of the request body that specifies the thumbnail parameters, if
  /// any.
  ///
  /// Parameter [video] :
  /// A section of the request body that specifies the video parameters.
  Future<CreatePresetResponse> createPreset({
    @_s.required String container,
    @_s.required String name,
    AudioParameters audio,
    String description,
    Thumbnails thumbnails,
    VideoParameters video,
  }) async {
    ArgumentError.checkNotNull(container, 'container');
    _s.validateStringPattern(
      'container',
      container,
      r'''(^mp4$)|(^ts$)|(^webm$)|(^mp3$)|(^flac$)|(^oga$)|(^ogg$)|(^fmp4$)|(^mpg$)|(^flv$)|(^gif$)|(^mxf$)|(^wav$)|(^mp2$)''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      40,
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      255,
    );
    final $payload = CreatePresetRequest(
      container: container,
      name: name,
      audio: audio,
      description: description,
      thumbnails: thumbnails,
      video: video,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2012-09-25/presets',
      exceptionFnMap: _exceptionFns,
    );
    return CreatePresetResponse.fromJson(response);
  }

  /// The DeletePipeline operation removes a pipeline.
  ///
  /// You can only delete a pipeline that has never been used or that is not
  /// currently in use (doesn't contain any active jobs). If the pipeline is
  /// currently in use, <code>DeletePipeline</code> returns an error.
  ///
  /// May throw [ValidationException].
  /// May throw [IncompatibleVersionException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [id] :
  /// The identifier of the pipeline that you want to delete.
  Future<void> deletePipeline({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringPattern(
      'id',
      id,
      r'''^\d{13}-\w{6}$''',
      isRequired: true,
    );
    final $payload = DeletePipelineRequest(
      id: id,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri: '/2012-09-25/pipelines/${Uri.encodeComponent(id.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return DeletePipelineResponse.fromJson(response);
  }

  /// The DeletePreset operation removes a preset that you've added in an AWS
  /// region.
  /// <note>
  /// You can't delete the default presets that are included with Elastic
  /// Transcoder.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [IncompatibleVersionException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [id] :
  /// The identifier of the preset for which you want to get detailed
  /// information.
  Future<void> deletePreset({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringPattern(
      'id',
      id,
      r'''^\d{13}-\w{6}$''',
      isRequired: true,
    );
    final $payload = DeletePresetRequest(
      id: id,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri: '/2012-09-25/presets/${Uri.encodeComponent(id.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return DeletePresetResponse.fromJson(response);
  }

  /// The ListJobsByPipeline operation gets a list of the jobs currently in a
  /// pipeline.
  ///
  /// Elastic Transcoder returns all of the jobs currently in the specified
  /// pipeline. The response body contains one element for each job that
  /// satisfies the search criteria.
  ///
  /// May throw [ValidationException].
  /// May throw [IncompatibleVersionException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [pipelineId] :
  /// The ID of the pipeline for which you want to get job information.
  ///
  /// Parameter [ascending] :
  /// To list jobs in chronological order by the date and time that they were
  /// submitted, enter <code>true</code>. To list jobs in reverse chronological
  /// order, enter <code>false</code>.
  ///
  /// Parameter [pageToken] :
  /// When Elastic Transcoder returns more than one page of results, use
  /// <code>pageToken</code> in subsequent <code>GET</code> requests to get each
  /// successive page of results.
  Future<ListJobsByPipelineResponse> listJobsByPipeline({
    @_s.required String pipelineId,
    String ascending,
    String pageToken,
  }) async {
    ArgumentError.checkNotNull(pipelineId, 'pipelineId');
    _s.validateStringPattern(
      'pipelineId',
      pipelineId,
      r'''^\d{13}-\w{6}$''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'ascending',
      ascending,
      r'''(^true$)|(^false$)''',
    );
    _s.validateStringPattern(
      'pageToken',
      pageToken,
      r'''^\d{13}-\w{6}$''',
    );
    var _query = '';
    _query = '?${[
      if (ascending != null) _s.toQueryParam('Ascending', ascending),
      if (pageToken != null) _s.toQueryParam('PageToken', pageToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2012-09-25/jobsByPipeline/${Uri.encodeComponent(pipelineId.toString())}$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ListJobsByPipelineResponse.fromJson(response);
  }

  /// The ListJobsByStatus operation gets a list of jobs that have a specified
  /// status. The response body contains one element for each job that satisfies
  /// the search criteria.
  ///
  /// May throw [ValidationException].
  /// May throw [IncompatibleVersionException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [status] :
  /// To get information about all of the jobs associated with the current AWS
  /// account that have a given status, specify the following status:
  /// <code>Submitted</code>, <code>Progressing</code>, <code>Complete</code>,
  /// <code>Canceled</code>, or <code>Error</code>.
  ///
  /// Parameter [ascending] :
  /// To list jobs in chronological order by the date and time that they were
  /// submitted, enter <code>true</code>. To list jobs in reverse chronological
  /// order, enter <code>false</code>.
  ///
  /// Parameter [pageToken] :
  /// When Elastic Transcoder returns more than one page of results, use
  /// <code>pageToken</code> in subsequent <code>GET</code> requests to get each
  /// successive page of results.
  Future<ListJobsByStatusResponse> listJobsByStatus({
    @_s.required String status,
    String ascending,
    String pageToken,
  }) async {
    ArgumentError.checkNotNull(status, 'status');
    _s.validateStringPattern(
      'status',
      status,
      r'''(^Submitted$)|(^Progressing$)|(^Complete$)|(^Canceled$)|(^Error$)''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'ascending',
      ascending,
      r'''(^true$)|(^false$)''',
    );
    _s.validateStringPattern(
      'pageToken',
      pageToken,
      r'''^\d{13}-\w{6}$''',
    );
    var _query = '';
    _query = '?${[
      if (ascending != null) _s.toQueryParam('Ascending', ascending),
      if (pageToken != null) _s.toQueryParam('PageToken', pageToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2012-09-25/jobsByStatus/${Uri.encodeComponent(status.toString())}$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ListJobsByStatusResponse.fromJson(response);
  }

  /// The ListPipelines operation gets a list of the pipelines associated with
  /// the current AWS account.
  ///
  /// May throw [ValidationException].
  /// May throw [IncompatibleVersionException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [ascending] :
  /// To list pipelines in chronological order by the date and time that they
  /// were created, enter <code>true</code>. To list pipelines in reverse
  /// chronological order, enter <code>false</code>.
  ///
  /// Parameter [pageToken] :
  /// When Elastic Transcoder returns more than one page of results, use
  /// <code>pageToken</code> in subsequent <code>GET</code> requests to get each
  /// successive page of results.
  Future<ListPipelinesResponse> listPipelines({
    String ascending,
    String pageToken,
  }) async {
    _s.validateStringPattern(
      'ascending',
      ascending,
      r'''(^true$)|(^false$)''',
    );
    _s.validateStringPattern(
      'pageToken',
      pageToken,
      r'''^\d{13}-\w{6}$''',
    );
    var _query = '';
    _query = '?${[
      if (ascending != null) _s.toQueryParam('Ascending', ascending),
      if (pageToken != null) _s.toQueryParam('PageToken', pageToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2012-09-25/pipelines$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ListPipelinesResponse.fromJson(response);
  }

  /// The ListPresets operation gets a list of the default presets included with
  /// Elastic Transcoder and the presets that you've added in an AWS region.
  ///
  /// May throw [ValidationException].
  /// May throw [IncompatibleVersionException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [ascending] :
  /// To list presets in chronological order by the date and time that they were
  /// created, enter <code>true</code>. To list presets in reverse chronological
  /// order, enter <code>false</code>.
  ///
  /// Parameter [pageToken] :
  /// When Elastic Transcoder returns more than one page of results, use
  /// <code>pageToken</code> in subsequent <code>GET</code> requests to get each
  /// successive page of results.
  Future<ListPresetsResponse> listPresets({
    String ascending,
    String pageToken,
  }) async {
    _s.validateStringPattern(
      'ascending',
      ascending,
      r'''(^true$)|(^false$)''',
    );
    _s.validateStringPattern(
      'pageToken',
      pageToken,
      r'''^\d{13}-\w{6}$''',
    );
    var _query = '';
    _query = '?${[
      if (ascending != null) _s.toQueryParam('Ascending', ascending),
      if (pageToken != null) _s.toQueryParam('PageToken', pageToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2012-09-25/presets$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ListPresetsResponse.fromJson(response);
  }

  /// The ReadJob operation returns detailed information about a job.
  ///
  /// May throw [ValidationException].
  /// May throw [IncompatibleVersionException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [id] :
  /// The identifier of the job for which you want to get detailed information.
  Future<ReadJobResponse> readJob({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringPattern(
      'id',
      id,
      r'''^\d{13}-\w{6}$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2012-09-25/jobs/${Uri.encodeComponent(id.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return ReadJobResponse.fromJson(response);
  }

  /// The ReadPipeline operation gets detailed information about a pipeline.
  ///
  /// May throw [ValidationException].
  /// May throw [IncompatibleVersionException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [id] :
  /// The identifier of the pipeline to read.
  Future<ReadPipelineResponse> readPipeline({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringPattern(
      'id',
      id,
      r'''^\d{13}-\w{6}$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2012-09-25/pipelines/${Uri.encodeComponent(id.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return ReadPipelineResponse.fromJson(response);
  }

  /// The ReadPreset operation gets detailed information about a preset.
  ///
  /// May throw [ValidationException].
  /// May throw [IncompatibleVersionException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [id] :
  /// The identifier of the preset for which you want to get detailed
  /// information.
  Future<ReadPresetResponse> readPreset({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringPattern(
      'id',
      id,
      r'''^\d{13}-\w{6}$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2012-09-25/presets/${Uri.encodeComponent(id.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return ReadPresetResponse.fromJson(response);
  }

  /// The TestRole operation tests the IAM role used to create the pipeline.
  ///
  /// The <code>TestRole</code> action lets you determine whether the IAM role
  /// you are using has sufficient permissions to let Elastic Transcoder perform
  /// tasks associated with the transcoding process. The action attempts to
  /// assume the specified IAM role, checks read access to the input and output
  /// buckets, and tries to send a test notification to Amazon SNS topics that
  /// you specify.
  ///
  /// May throw [ValidationException].
  /// May throw [IncompatibleVersionException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [inputBucket] :
  /// The Amazon S3 bucket that contains media files to be transcoded. The
  /// action attempts to read from this bucket.
  ///
  /// Parameter [outputBucket] :
  /// The Amazon S3 bucket that Elastic Transcoder writes transcoded media files
  /// to. The action attempts to read from this bucket.
  ///
  /// Parameter [role] :
  /// The IAM Amazon Resource Name (ARN) for the role that you want Elastic
  /// Transcoder to test.
  ///
  /// Parameter [topics] :
  /// The ARNs of one or more Amazon Simple Notification Service (Amazon SNS)
  /// topics that you want the action to send a test notification to.
  @Deprecated('Deprecated')
  Future<TestRoleResponse> testRole({
    @_s.required String inputBucket,
    @_s.required String outputBucket,
    @_s.required String role,
    @_s.required List<String> topics,
  }) async {
    ArgumentError.checkNotNull(inputBucket, 'inputBucket');
    _s.validateStringPattern(
      'inputBucket',
      inputBucket,
      r'''^(\w|\.|-){1,255}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(outputBucket, 'outputBucket');
    _s.validateStringPattern(
      'outputBucket',
      outputBucket,
      r'''^(\w|\.|-){1,255}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(role, 'role');
    _s.validateStringPattern(
      'role',
      role,
      r'''^arn:aws:iam::\w{12}:role/.+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(topics, 'topics');
    final $payload = TestRoleRequest(
      inputBucket: inputBucket,
      outputBucket: outputBucket,
      role: role,
      topics: topics,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2012-09-25/roleTests',
      exceptionFnMap: _exceptionFns,
    );
    return TestRoleResponse.fromJson(response);
  }

  /// Use the <code>UpdatePipeline</code> operation to update settings for a
  /// pipeline.
  /// <important>
  /// When you change pipeline settings, your changes take effect immediately.
  /// Jobs that you have already submitted and that Elastic Transcoder has not
  /// started to process are affected in addition to jobs that you submit after
  /// you change settings.
  /// </important>
  ///
  /// May throw [ValidationException].
  /// May throw [IncompatibleVersionException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [id] :
  /// The ID of the pipeline that you want to update.
  ///
  /// Parameter [awsKmsKeyArn] :
  /// The AWS Key Management Service (AWS KMS) key that you want to use with
  /// this pipeline.
  ///
  /// If you use either <code>s3</code> or <code>s3-aws-kms</code> as your
  /// <code>Encryption:Mode</code>, you don't need to provide a key with your
  /// job because a default key, known as an AWS-KMS key, is created for you
  /// automatically. You need to provide an AWS-KMS key only if you want to use
  /// a non-default AWS-KMS key, or if you are using an
  /// <code>Encryption:Mode</code> of <code>aes-cbc-pkcs7</code>,
  /// <code>aes-ctr</code>, or <code>aes-gcm</code>.
  ///
  /// Parameter [contentConfig] :
  /// The optional <code>ContentConfig</code> object specifies information about
  /// the Amazon S3 bucket in which you want Elastic Transcoder to save
  /// transcoded files and playlists: which bucket to use, which users you want
  /// to have access to the files, the type of access you want users to have,
  /// and the storage class that you want to assign to the files.
  ///
  /// If you specify values for <code>ContentConfig</code>, you must also
  /// specify values for <code>ThumbnailConfig</code>.
  ///
  /// If you specify values for <code>ContentConfig</code> and
  /// <code>ThumbnailConfig</code>, omit the <code>OutputBucket</code> object.
  ///
  /// <ul>
  /// <li>
  /// <b>Bucket</b>: The Amazon S3 bucket in which you want Elastic Transcoder
  /// to save transcoded files and playlists.
  /// </li>
  /// <li>
  /// <b>Permissions</b> (Optional): The Permissions object specifies which
  /// users you want to have access to transcoded files and the type of access
  /// you want them to have. You can grant permissions to a maximum of 30 users
  /// and/or predefined Amazon S3 groups.
  /// </li>
  /// <li>
  /// <b>Grantee Type</b>: Specify the type of value that appears in the
  /// <code>Grantee</code> object:
  ///
  /// <ul>
  /// <li>
  /// <b>Canonical</b>: The value in the <code>Grantee</code> object is either
  /// the canonical user ID for an AWS account or an origin access identity for
  /// an Amazon CloudFront distribution. For more information about canonical
  /// user IDs, see Access Control List (ACL) Overview in the Amazon Simple
  /// Storage Service Developer Guide. For more information about using
  /// CloudFront origin access identities to require that users use CloudFront
  /// URLs instead of Amazon S3 URLs, see Using an Origin Access Identity to
  /// Restrict Access to Your Amazon S3 Content.
  /// <important>
  /// A canonical user ID is not the same as an AWS account number.
  /// </important> </li>
  /// <li>
  /// <b>Email</b>: The value in the <code>Grantee</code> object is the
  /// registered email address of an AWS account.
  /// </li>
  /// <li>
  /// <b>Group</b>: The value in the <code>Grantee</code> object is one of the
  /// following predefined Amazon S3 groups: <code>AllUsers</code>,
  /// <code>AuthenticatedUsers</code>, or <code>LogDelivery</code>.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b>Grantee</b>: The AWS user or group that you want to have access to
  /// transcoded files and playlists. To identify the user or group, you can
  /// specify the canonical user ID for an AWS account, an origin access
  /// identity for a CloudFront distribution, the registered email address of an
  /// AWS account, or a predefined Amazon S3 group
  /// </li>
  /// <li>
  /// <b>Access</b>: The permission that you want to give to the AWS user that
  /// you specified in <code>Grantee</code>. Permissions are granted on the
  /// files that Elastic Transcoder adds to the bucket, including playlists and
  /// video files. Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>READ</code>: The grantee can read the objects and metadata for
  /// objects that Elastic Transcoder adds to the Amazon S3 bucket.
  /// </li>
  /// <li>
  /// <code>READ_ACP</code>: The grantee can read the object ACL for objects
  /// that Elastic Transcoder adds to the Amazon S3 bucket.
  /// </li>
  /// <li>
  /// <code>WRITE_ACP</code>: The grantee can write the ACL for the objects that
  /// Elastic Transcoder adds to the Amazon S3 bucket.
  /// </li>
  /// <li>
  /// <code>FULL_CONTROL</code>: The grantee has <code>READ</code>,
  /// <code>READ_ACP</code>, and <code>WRITE_ACP</code> permissions for the
  /// objects that Elastic Transcoder adds to the Amazon S3 bucket.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b>StorageClass</b>: The Amazon S3 storage class, <code>Standard</code> or
  /// <code>ReducedRedundancy</code>, that you want Elastic Transcoder to assign
  /// to the video files and playlists that it stores in your Amazon S3 bucket.
  /// </li>
  /// </ul>
  ///
  /// Parameter [inputBucket] :
  /// The Amazon S3 bucket in which you saved the media files that you want to
  /// transcode and the graphics that you want to use as watermarks.
  ///
  /// Parameter [name] :
  /// The name of the pipeline. We recommend that the name be unique within the
  /// AWS account, but uniqueness is not enforced.
  ///
  /// Constraints: Maximum 40 characters
  ///
  /// Parameter [notifications] :
  /// The topic ARN for the Amazon Simple Notification Service (Amazon SNS)
  /// topic that you want to notify to report job status.
  /// <important>
  /// To receive notifications, you must also subscribe to the new topic in the
  /// Amazon SNS console.
  /// </important>
  /// <ul>
  /// <li>
  /// <b>Progressing</b>: The topic ARN for the Amazon Simple Notification
  /// Service (Amazon SNS) topic that you want to notify when Elastic Transcoder
  /// has started to process jobs that are added to this pipeline. This is the
  /// ARN that Amazon SNS returned when you created the topic.
  /// </li>
  /// <li>
  /// <b>Complete</b>: The topic ARN for the Amazon SNS topic that you want to
  /// notify when Elastic Transcoder has finished processing a job. This is the
  /// ARN that Amazon SNS returned when you created the topic.
  /// </li>
  /// <li>
  /// <b>Warning</b>: The topic ARN for the Amazon SNS topic that you want to
  /// notify when Elastic Transcoder encounters a warning condition. This is the
  /// ARN that Amazon SNS returned when you created the topic.
  /// </li>
  /// <li>
  /// <b>Error</b>: The topic ARN for the Amazon SNS topic that you want to
  /// notify when Elastic Transcoder encounters an error condition. This is the
  /// ARN that Amazon SNS returned when you created the topic.
  /// </li>
  /// </ul>
  ///
  /// Parameter [role] :
  /// The IAM Amazon Resource Name (ARN) for the role that you want Elastic
  /// Transcoder to use to transcode jobs for this pipeline.
  ///
  /// Parameter [thumbnailConfig] :
  /// The <code>ThumbnailConfig</code> object specifies several values,
  /// including the Amazon S3 bucket in which you want Elastic Transcoder to
  /// save thumbnail files, which users you want to have access to the files,
  /// the type of access you want users to have, and the storage class that you
  /// want to assign to the files.
  ///
  /// If you specify values for <code>ContentConfig</code>, you must also
  /// specify values for <code>ThumbnailConfig</code> even if you don't want to
  /// create thumbnails.
  ///
  /// If you specify values for <code>ContentConfig</code> and
  /// <code>ThumbnailConfig</code>, omit the <code>OutputBucket</code> object.
  ///
  /// <ul>
  /// <li>
  /// <b>Bucket</b>: The Amazon S3 bucket in which you want Elastic Transcoder
  /// to save thumbnail files.
  /// </li>
  /// <li>
  /// <b>Permissions</b> (Optional): The <code>Permissions</code> object
  /// specifies which users and/or predefined Amazon S3 groups you want to have
  /// access to thumbnail files, and the type of access you want them to have.
  /// You can grant permissions to a maximum of 30 users and/or predefined
  /// Amazon S3 groups.
  /// </li>
  /// <li>
  /// <b>GranteeType</b>: Specify the type of value that appears in the Grantee
  /// object:
  ///
  /// <ul>
  /// <li>
  /// <b>Canonical</b>: The value in the <code>Grantee</code> object is either
  /// the canonical user ID for an AWS account or an origin access identity for
  /// an Amazon CloudFront distribution.
  /// <important>
  /// A canonical user ID is not the same as an AWS account number.
  /// </important> </li>
  /// <li>
  /// <b>Email</b>: The value in the <code>Grantee</code> object is the
  /// registered email address of an AWS account.
  /// </li>
  /// <li>
  /// <b>Group</b>: The value in the <code>Grantee</code> object is one of the
  /// following predefined Amazon S3 groups: <code>AllUsers</code>,
  /// <code>AuthenticatedUsers</code>, or <code>LogDelivery</code>.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b>Grantee</b>: The AWS user or group that you want to have access to
  /// thumbnail files. To identify the user or group, you can specify the
  /// canonical user ID for an AWS account, an origin access identity for a
  /// CloudFront distribution, the registered email address of an AWS account,
  /// or a predefined Amazon S3 group.
  /// </li>
  /// <li>
  /// <b>Access</b>: The permission that you want to give to the AWS user that
  /// you specified in <code>Grantee</code>. Permissions are granted on the
  /// thumbnail files that Elastic Transcoder adds to the bucket. Valid values
  /// include:
  ///
  /// <ul>
  /// <li>
  /// <code>READ</code>: The grantee can read the thumbnails and metadata for
  /// objects that Elastic Transcoder adds to the Amazon S3 bucket.
  /// </li>
  /// <li>
  /// <code>READ_ACP</code>: The grantee can read the object ACL for thumbnails
  /// that Elastic Transcoder adds to the Amazon S3 bucket.
  /// </li>
  /// <li>
  /// <code>WRITE_ACP</code>: The grantee can write the ACL for the thumbnails
  /// that Elastic Transcoder adds to the Amazon S3 bucket.
  /// </li>
  /// <li>
  /// <code>FULL_CONTROL</code>: The grantee has <code>READ</code>,
  /// <code>READ_ACP</code>, and <code>WRITE_ACP</code> permissions for the
  /// thumbnails that Elastic Transcoder adds to the Amazon S3 bucket.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b>StorageClass</b>: The Amazon S3 storage class, <code>Standard</code> or
  /// <code>ReducedRedundancy</code>, that you want Elastic Transcoder to assign
  /// to the thumbnails that it stores in your Amazon S3 bucket.
  /// </li>
  /// </ul>
  Future<UpdatePipelineResponse> updatePipeline({
    @_s.required String id,
    String awsKmsKeyArn,
    PipelineOutputConfig contentConfig,
    String inputBucket,
    String name,
    Notifications notifications,
    String role,
    PipelineOutputConfig thumbnailConfig,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringPattern(
      'id',
      id,
      r'''^\d{13}-\w{6}$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'awsKmsKeyArn',
      awsKmsKeyArn,
      0,
      255,
    );
    _s.validateStringPattern(
      'inputBucket',
      inputBucket,
      r'''^(\w|\.|-){1,255}$''',
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      40,
    );
    _s.validateStringPattern(
      'role',
      role,
      r'''^arn:aws:iam::\w{12}:role/.+$''',
    );
    final $payload = UpdatePipelineRequest(
      id: id,
      awsKmsKeyArn: awsKmsKeyArn,
      contentConfig: contentConfig,
      inputBucket: inputBucket,
      name: name,
      notifications: notifications,
      role: role,
      thumbnailConfig: thumbnailConfig,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/2012-09-25/pipelines/${Uri.encodeComponent(id.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdatePipelineResponse.fromJson(response);
  }

  /// With the UpdatePipelineNotifications operation, you can update Amazon
  /// Simple Notification Service (Amazon SNS) notifications for a pipeline.
  ///
  /// When you update notifications for a pipeline, Elastic Transcoder returns
  /// the values that you specified in the request.
  ///
  /// May throw [ValidationException].
  /// May throw [IncompatibleVersionException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [id] :
  /// The identifier of the pipeline for which you want to change notification
  /// settings.
  ///
  /// Parameter [notifications] :
  /// The topic ARN for the Amazon Simple Notification Service (Amazon SNS)
  /// topic that you want to notify to report job status.
  /// <important>
  /// To receive notifications, you must also subscribe to the new topic in the
  /// Amazon SNS console.
  /// </important>
  /// <ul>
  /// <li>
  /// <b>Progressing</b>: The topic ARN for the Amazon Simple Notification
  /// Service (Amazon SNS) topic that you want to notify when Elastic Transcoder
  /// has started to process jobs that are added to this pipeline. This is the
  /// ARN that Amazon SNS returned when you created the topic.
  /// </li>
  /// <li>
  /// <b>Complete</b>: The topic ARN for the Amazon SNS topic that you want to
  /// notify when Elastic Transcoder has finished processing a job. This is the
  /// ARN that Amazon SNS returned when you created the topic.
  /// </li>
  /// <li>
  /// <b>Warning</b>: The topic ARN for the Amazon SNS topic that you want to
  /// notify when Elastic Transcoder encounters a warning condition. This is the
  /// ARN that Amazon SNS returned when you created the topic.
  /// </li>
  /// <li>
  /// <b>Error</b>: The topic ARN for the Amazon SNS topic that you want to
  /// notify when Elastic Transcoder encounters an error condition. This is the
  /// ARN that Amazon SNS returned when you created the topic.
  /// </li>
  /// </ul>
  Future<UpdatePipelineNotificationsResponse> updatePipelineNotifications({
    @_s.required String id,
    @_s.required Notifications notifications,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringPattern(
      'id',
      id,
      r'''^\d{13}-\w{6}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(notifications, 'notifications');
    final $payload = UpdatePipelineNotificationsRequest(
      id: id,
      notifications: notifications,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2012-09-25/pipelines/${Uri.encodeComponent(id.toString())}/notifications',
      exceptionFnMap: _exceptionFns,
    );
    return UpdatePipelineNotificationsResponse.fromJson(response);
  }

  /// The UpdatePipelineStatus operation pauses or reactivates a pipeline, so
  /// that the pipeline stops or restarts the processing of jobs.
  ///
  /// Changing the pipeline status is useful if you want to cancel one or more
  /// jobs. You can't cancel jobs after Elastic Transcoder has started
  /// processing them; if you pause the pipeline to which you submitted the
  /// jobs, you have more time to get the job IDs for the jobs that you want to
  /// cancel, and to send a <a>CancelJob</a> request.
  ///
  /// May throw [ValidationException].
  /// May throw [IncompatibleVersionException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [id] :
  /// The identifier of the pipeline to update.
  ///
  /// Parameter [status] :
  /// The desired status of the pipeline:
  ///
  /// <ul>
  /// <li>
  /// <code>Active</code>: The pipeline is processing jobs.
  /// </li>
  /// <li>
  /// <code>Paused</code>: The pipeline is not currently processing jobs.
  /// </li>
  /// </ul>
  Future<UpdatePipelineStatusResponse> updatePipelineStatus({
    @_s.required String id,
    @_s.required String status,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringPattern(
      'id',
      id,
      r'''^\d{13}-\w{6}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(status, 'status');
    _s.validateStringPattern(
      'status',
      status,
      r'''(^Active$)|(^Paused$)''',
      isRequired: true,
    );
    final $payload = UpdatePipelineStatusRequest(
      id: id,
      status: status,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2012-09-25/pipelines/${Uri.encodeComponent(id.toString())}/status',
      exceptionFnMap: _exceptionFns,
    );
    return UpdatePipelineStatusResponse.fromJson(response);
  }
}

/// The file to be used as album art. There can be multiple artworks associated
/// with an audio file, to a maximum of 20.
///
/// To remove artwork or leave the artwork empty, you can either set
/// <code>Artwork</code> to null, or set the <code>Merge Policy</code> to
/// "Replace" and use an empty <code>Artwork</code> array.
///
/// To pass through existing artwork unchanged, set the <code>Merge
/// Policy</code> to "Prepend", "Append", or "Fallback", and use an empty
/// <code>Artwork</code> array.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Artwork {
  /// The format of album art, if any. Valid formats are <code>.jpg</code> and
  /// <code>.png</code>.
  @_s.JsonKey(name: 'AlbumArtFormat')
  final String albumArtFormat;

  /// The encryption settings, if any, that you want Elastic Transcoder to apply
  /// to your artwork.
  @_s.JsonKey(name: 'Encryption')
  final Encryption encryption;

  /// The name of the file to be used as album art. To determine which Amazon S3
  /// bucket contains the specified file, Elastic Transcoder checks the pipeline
  /// specified by <code>PipelineId</code>; the <code>InputBucket</code> object in
  /// that pipeline identifies the bucket.
  ///
  /// If the file name includes a prefix, for example,
  /// <code>cooking/pie.jpg</code>, include the prefix in the key. If the file
  /// isn't in the specified bucket, Elastic Transcoder returns an error.
  @_s.JsonKey(name: 'InputKey')
  final String inputKey;

  /// The maximum height of the output album art in pixels. If you specify
  /// <code>auto</code>, Elastic Transcoder uses 600 as the default value. If you
  /// specify a numeric value, enter an even integer between 32 and 3072,
  /// inclusive.
  @_s.JsonKey(name: 'MaxHeight')
  final String maxHeight;

  /// The maximum width of the output album art in pixels. If you specify
  /// <code>auto</code>, Elastic Transcoder uses 600 as the default value. If you
  /// specify a numeric value, enter an even integer between 32 and 4096,
  /// inclusive.
  @_s.JsonKey(name: 'MaxWidth')
  final String maxWidth;

  /// When you set <code>PaddingPolicy</code> to <code>Pad</code>, Elastic
  /// Transcoder may add white bars to the top and bottom and/or left and right
  /// sides of the output album art to make the total size of the output art match
  /// the values that you specified for <code>MaxWidth</code> and
  /// <code>MaxHeight</code>.
  @_s.JsonKey(name: 'PaddingPolicy')
  final String paddingPolicy;

  /// Specify one of the following values to control scaling of the output album
  /// art:
  ///
  /// <ul>
  /// <li>
  /// <code>Fit:</code> Elastic Transcoder scales the output art so it matches the
  /// value that you specified in either <code>MaxWidth</code> or
  /// <code>MaxHeight</code> without exceeding the other value.
  /// </li>
  /// <li>
  /// <code>Fill:</code> Elastic Transcoder scales the output art so it matches
  /// the value that you specified in either <code>MaxWidth</code> or
  /// <code>MaxHeight</code> and matches or exceeds the other value. Elastic
  /// Transcoder centers the output art and then crops it in the dimension (if
  /// any) that exceeds the maximum value.
  /// </li>
  /// <li>
  /// <code>Stretch:</code> Elastic Transcoder stretches the output art to match
  /// the values that you specified for <code>MaxWidth</code> and
  /// <code>MaxHeight</code>. If the relative proportions of the input art and the
  /// output art are different, the output art will be distorted.
  /// </li>
  /// <li>
  /// <code>Keep:</code> Elastic Transcoder does not scale the output art. If
  /// either dimension of the input art exceeds the values that you specified for
  /// <code>MaxWidth</code> and <code>MaxHeight</code>, Elastic Transcoder crops
  /// the output art.
  /// </li>
  /// <li>
  /// <code>ShrinkToFit:</code> Elastic Transcoder scales the output art down so
  /// that its dimensions match the values that you specified for at least one of
  /// <code>MaxWidth</code> and <code>MaxHeight</code> without exceeding either
  /// value. If you specify this option, Elastic Transcoder does not scale the art
  /// up.
  /// </li>
  /// <li>
  /// <code>ShrinkToFill</code> Elastic Transcoder scales the output art down so
  /// that its dimensions match the values that you specified for at least one of
  /// <code>MaxWidth</code> and <code>MaxHeight</code> without dropping below
  /// either value. If you specify this option, Elastic Transcoder does not scale
  /// the art up.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'SizingPolicy')
  final String sizingPolicy;

  Artwork({
    this.albumArtFormat,
    this.encryption,
    this.inputKey,
    this.maxHeight,
    this.maxWidth,
    this.paddingPolicy,
    this.sizingPolicy,
  });
  factory Artwork.fromJson(Map<String, dynamic> json) =>
      _$ArtworkFromJson(json);

  Map<String, dynamic> toJson() => _$ArtworkToJson(this);
}

/// Options associated with your audio codec.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AudioCodecOptions {
  /// You can only choose an audio bit depth when you specify <code>flac</code> or
  /// <code>pcm</code> for the value of Audio:Codec.
  ///
  /// The bit depth of a sample is how many bits of information are included in
  /// the audio samples. The higher the bit depth, the better the audio, but the
  /// larger the file.
  ///
  /// Valid values are <code>16</code> and <code>24</code>.
  ///
  /// The most common bit depth is <code>24</code>.
  @_s.JsonKey(name: 'BitDepth')
  final String bitDepth;

  /// You can only choose an audio bit order when you specify <code>pcm</code> for
  /// the value of Audio:Codec.
  ///
  /// The order the bits of a PCM sample are stored in.
  ///
  /// The supported value is <code>LittleEndian</code>.
  @_s.JsonKey(name: 'BitOrder')
  final String bitOrder;

  /// You can only choose an audio profile when you specify AAC for the value of
  /// Audio:Codec.
  ///
  /// Specify the AAC profile for the output file. Elastic Transcoder supports the
  /// following profiles:
  ///
  /// <ul>
  /// <li>
  /// <code>auto</code>: If you specify <code>auto</code>, Elastic Transcoder
  /// selects the profile based on the bit rate selected for the output file.
  /// </li>
  /// <li>
  /// <code>AAC-LC</code>: The most common AAC profile. Use for bit rates larger
  /// than 64 kbps.
  /// </li>
  /// <li>
  /// <code>HE-AAC</code>: Not supported on some older players and devices. Use
  /// for bit rates between 40 and 80 kbps.
  /// </li>
  /// <li>
  /// <code>HE-AACv2</code>: Not supported on some players and devices. Use for
  /// bit rates less than 48 kbps.
  /// </li>
  /// </ul>
  /// All outputs in a <code>Smooth</code> playlist must have the same value for
  /// <code>Profile</code>.
  /// <note>
  /// If you created any presets before AAC profiles were added, Elastic
  /// Transcoder automatically updated your presets to use AAC-LC. You can change
  /// the value as required.
  /// </note>
  @_s.JsonKey(name: 'Profile')
  final String profile;

  /// You can only choose whether an audio sample is signed when you specify
  /// <code>pcm</code> for the value of Audio:Codec.
  ///
  /// Whether audio samples are represented with negative and positive numbers
  /// (signed) or only positive numbers (unsigned).
  ///
  /// The supported value is <code>Signed</code>.
  @_s.JsonKey(name: 'Signed')
  final String signed;

  AudioCodecOptions({
    this.bitDepth,
    this.bitOrder,
    this.profile,
    this.signed,
  });
  factory AudioCodecOptions.fromJson(Map<String, dynamic> json) =>
      _$AudioCodecOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$AudioCodecOptionsToJson(this);
}

/// Parameters required for transcoding audio.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AudioParameters {
  /// The method of organizing audio channels and tracks. Use
  /// <code>Audio:Channels</code> to specify the number of channels in your
  /// output, and <code>Audio:AudioPackingMode</code> to specify the number of
  /// tracks and their relation to the channels. If you do not specify an
  /// <code>Audio:AudioPackingMode</code>, Elastic Transcoder uses
  /// <code>SingleTrack</code>.
  ///
  /// The following values are valid:
  ///
  /// <code>SingleTrack</code>, <code>OneChannelPerTrack</code>, and
  /// <code>OneChannelPerTrackWithMosTo8Tracks</code>
  ///
  /// When you specify <code>SingleTrack</code>, Elastic Transcoder creates a
  /// single track for your output. The track can have up to eight channels. Use
  /// <code>SingleTrack</code> for all non-<code>mxf</code> containers.
  ///
  /// The outputs of <code>SingleTrack</code> for a specific channel value and
  /// inputs are as follows:
  ///
  /// <ul>
  /// <li>
  /// <code>0</code> <b> channels with any input:</b> Audio omitted from the
  /// output
  /// </li>
  /// <li>
  /// <code>1, 2, or auto </code> <b>channels with no audio input:</b> Audio
  /// omitted from the output
  /// </li>
  /// <li>
  /// <code>1 </code> <b>channel with any input with audio:</b> One track with one
  /// channel, downmixed if necessary
  /// </li>
  /// <li>
  /// <code>2 </code> <b>channels with one track with one channel:</b> One track
  /// with two identical channels
  /// </li>
  /// <li>
  /// <code>2 or auto </code> <b>channels with two tracks with one channel
  /// each:</b> One track with two channels
  /// </li>
  /// <li>
  /// <code>2 or auto </code> <b>channels with one track with two channels:</b>
  /// One track with two channels
  /// </li>
  /// <li>
  /// <code>2 </code> <b>channels with one track with multiple channels:</b> One
  /// track with two channels
  /// </li>
  /// <li>
  /// <code>auto </code> <b>channels with one track with one channel:</b> One
  /// track with one channel
  /// </li>
  /// <li>
  /// <code>auto </code> <b>channels with one track with multiple channels:</b>
  /// One track with multiple channels
  /// </li>
  /// </ul>
  /// When you specify <code>OneChannelPerTrack</code>, Elastic Transcoder creates
  /// a new track for every channel in your output. Your output can have up to
  /// eight single-channel tracks.
  ///
  /// The outputs of <code>OneChannelPerTrack</code> for a specific channel value
  /// and inputs are as follows:
  ///
  /// <ul>
  /// <li>
  /// <code>0 </code> <b>channels with any input:</b> Audio omitted from the
  /// output
  /// </li>
  /// <li>
  /// <code>1, 2, or auto </code> <b>channels with no audio input:</b> Audio
  /// omitted from the output
  /// </li>
  /// <li>
  /// <code>1 </code> <b>channel with any input with audio:</b> One track with one
  /// channel, downmixed if necessary
  /// </li>
  /// <li>
  /// <code>2 </code> <b>channels with one track with one channel:</b> Two tracks
  /// with one identical channel each
  /// </li>
  /// <li>
  /// <code>2 or auto </code> <b>channels with two tracks with one channel
  /// each:</b> Two tracks with one channel each
  /// </li>
  /// <li>
  /// <code>2 or auto </code> <b>channels with one track with two channels:</b>
  /// Two tracks with one channel each
  /// </li>
  /// <li>
  /// <code>2 </code> <b>channels with one track with multiple channels:</b> Two
  /// tracks with one channel each
  /// </li>
  /// <li>
  /// <code>auto </code> <b>channels with one track with one channel:</b> One
  /// track with one channel
  /// </li>
  /// <li>
  /// <code>auto </code> <b>channels with one track with multiple channels:</b> Up
  /// to eight tracks with one channel each
  /// </li>
  /// </ul>
  /// When you specify <code>OneChannelPerTrackWithMosTo8Tracks</code>, Elastic
  /// Transcoder creates eight single-channel tracks for your output. All tracks
  /// that do not contain audio data from an input channel are MOS, or Mit Out
  /// Sound, tracks.
  ///
  /// The outputs of <code>OneChannelPerTrackWithMosTo8Tracks</code> for a
  /// specific channel value and inputs are as follows:
  ///
  /// <ul>
  /// <li>
  /// <code>0 </code> <b>channels with any input:</b> Audio omitted from the
  /// output
  /// </li>
  /// <li>
  /// <code>1, 2, or auto </code> <b>channels with no audio input:</b> Audio
  /// omitted from the output
  /// </li>
  /// <li>
  /// <code>1 </code> <b>channel with any input with audio:</b> One track with one
  /// channel, downmixed if necessary, plus six MOS tracks
  /// </li>
  /// <li>
  /// <code>2 </code> <b>channels with one track with one channel:</b> Two tracks
  /// with one identical channel each, plus six MOS tracks
  /// </li>
  /// <li>
  /// <code>2 or auto </code> <b>channels with two tracks with one channel
  /// each:</b> Two tracks with one channel each, plus six MOS tracks
  /// </li>
  /// <li>
  /// <code>2 or auto </code> <b>channels with one track with two channels:</b>
  /// Two tracks with one channel each, plus six MOS tracks
  /// </li>
  /// <li>
  /// <code>2 </code> <b>channels with one track with multiple channels:</b> Two
  /// tracks with one channel each, plus six MOS tracks
  /// </li>
  /// <li>
  /// <code>auto </code> <b>channels with one track with one channel:</b> One
  /// track with one channel, plus seven MOS tracks
  /// </li>
  /// <li>
  /// <code>auto </code> <b>channels with one track with multiple channels:</b> Up
  /// to eight tracks with one channel each, plus MOS tracks until there are eight
  /// tracks in all
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'AudioPackingMode')
  final String audioPackingMode;

  /// The bit rate of the audio stream in the output file, in kilobits/second.
  /// Enter an integer between 64 and 320, inclusive.
  @_s.JsonKey(name: 'BitRate')
  final String bitRate;

  /// The number of audio channels in the output file. The following values are
  /// valid:
  ///
  /// <code>auto</code>, <code>0</code>, <code>1</code>, <code>2</code>
  ///
  /// One channel carries the information played by a single speaker. For example,
  /// a stereo track with two channels sends one channel to the left speaker, and
  /// the other channel to the right speaker. The output channels are organized
  /// into tracks. If you want Elastic Transcoder to automatically detect the
  /// number of audio channels in the input file and use that value for the output
  /// file, select <code>auto</code>.
  ///
  /// The output of a specific channel value and inputs are as follows:
  ///
  /// <ul>
  /// <li>
  /// <code>auto</code> <b> channel specified, with any input:</b> Pass through up
  /// to eight input channels.
  /// </li>
  /// <li>
  /// <code>0</code> <b> channels specified, with any input:</b> Audio omitted
  /// from the output.
  /// </li>
  /// <li>
  /// <code>1</code> <b> channel specified, with at least one input channel:</b>
  /// Mono sound.
  /// </li>
  /// <li>
  /// <code>2</code> <b> channels specified, with any input:</b> Two identical
  /// mono channels or stereo. For more information about tracks, see
  /// <code>Audio:AudioPackingMode.</code>
  /// </li>
  /// </ul>
  /// For more information about how Elastic Transcoder organizes channels and
  /// tracks, see <code>Audio:AudioPackingMode</code>.
  @_s.JsonKey(name: 'Channels')
  final String channels;

  /// The audio codec for the output file. Valid values include <code>aac</code>,
  /// <code>flac</code>, <code>mp2</code>, <code>mp3</code>, <code>pcm</code>, and
  /// <code>vorbis</code>.
  @_s.JsonKey(name: 'Codec')
  final String codec;

  /// If you specified <code>AAC</code> for <code>Audio:Codec</code>, this is the
  /// <code>AAC</code> compression profile to use. Valid values include:
  ///
  /// <code>auto</code>, <code>AAC-LC</code>, <code>HE-AAC</code>,
  /// <code>HE-AACv2</code>
  ///
  /// If you specify <code>auto</code>, Elastic Transcoder chooses a profile based
  /// on the bit rate of the output file.
  @_s.JsonKey(name: 'CodecOptions')
  final AudioCodecOptions codecOptions;

  /// The sample rate of the audio stream in the output file, in Hertz. Valid
  /// values include:
  ///
  /// <code>auto</code>, <code>22050</code>, <code>32000</code>,
  /// <code>44100</code>, <code>48000</code>, <code>96000</code>
  ///
  /// If you specify <code>auto</code>, Elastic Transcoder automatically detects
  /// the sample rate.
  @_s.JsonKey(name: 'SampleRate')
  final String sampleRate;

  AudioParameters({
    this.audioPackingMode,
    this.bitRate,
    this.channels,
    this.codec,
    this.codecOptions,
    this.sampleRate,
  });
  factory AudioParameters.fromJson(Map<String, dynamic> json) =>
      _$AudioParametersFromJson(json);

  Map<String, dynamic> toJson() => _$AudioParametersToJson(this);
}

/// The <code>CancelJobRequest</code> structure.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CancelJobRequest {
  /// The identifier of the job that you want to cancel.
  ///
  /// To get a list of the jobs (including their <code>jobId</code>) that have a
  /// status of <code>Submitted</code>, use the <a>ListJobsByStatus</a> API
  /// action.
  @_s.JsonKey(name: 'Id', ignore: true)
  final String id;

  CancelJobRequest({
    @_s.required this.id,
  });
  Map<String, dynamic> toJson() => _$CancelJobRequestToJson(this);
}

/// The response body contains a JSON object. If the job is successfully
/// canceled, the value of <code>Success</code> is <code>true</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CancelJobResponse {
  CancelJobResponse();
  factory CancelJobResponse.fromJson(Map<String, dynamic> json) =>
      _$CancelJobResponseFromJson(json);
}

/// The file format of the output captions. If you leave this value blank,
/// Elastic Transcoder returns an error.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CaptionFormat {
  /// The encryption settings, if any, that you want Elastic Transcoder to apply
  /// to your caption formats.
  @_s.JsonKey(name: 'Encryption')
  final Encryption encryption;

  /// The format you specify determines whether Elastic Transcoder generates an
  /// embedded or sidecar caption for this output.
  ///
  /// <ul>
  /// <li>
  /// <b>Valid Embedded Caption Formats:</b>
  ///
  /// <ul>
  /// <li>
  /// <b>for FLAC</b>: None
  /// </li>
  /// <li>
  /// <b>For MP3</b>: None
  /// </li>
  /// <li>
  /// <b>For MP4</b>: mov-text
  /// </li>
  /// <li>
  /// <b>For MPEG-TS</b>: None
  /// </li>
  /// <li>
  /// <b>For ogg</b>: None
  /// </li>
  /// <li>
  /// <b>For webm</b>: None
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b>Valid Sidecar Caption Formats:</b> Elastic Transcoder supports dfxp
  /// (first div element only), scc, srt, and webvtt. If you want ttml or smpte-tt
  /// compatible captions, specify dfxp as your output format.
  ///
  /// <ul>
  /// <li>
  /// <b>For FMP4</b>: dfxp
  /// </li>
  /// <li>
  /// <b>Non-FMP4 outputs</b>: All sidecar types
  /// </li>
  /// </ul>
  /// <code>fmp4</code> captions have an extension of <code>.ismt</code>
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Format')
  final String format;

  /// The prefix for caption filenames, in the form
  /// <i>description</i>-<code>{language}</code>, where:
  ///
  /// <ul>
  /// <li>
  /// <i>description</i> is a description of the video.
  /// </li>
  /// <li>
  /// <code>{language}</code> is a literal value that Elastic Transcoder replaces
  /// with the two- or three-letter code for the language of the caption in the
  /// output file names.
  /// </li>
  /// </ul>
  /// If you don't include <code>{language}</code> in the file name pattern,
  /// Elastic Transcoder automatically appends "<code>{language}</code>" to the
  /// value that you specify for the description. In addition, Elastic Transcoder
  /// automatically appends the count to the end of the segment files.
  ///
  /// For example, suppose you're transcoding into srt format. When you enter
  /// "Sydney-{language}-sunrise", and the language of the captions is English
  /// (en), the name of the first caption file is be Sydney-en-sunrise00000.srt.
  @_s.JsonKey(name: 'Pattern')
  final String pattern;

  CaptionFormat({
    this.encryption,
    this.format,
    this.pattern,
  });
  factory CaptionFormat.fromJson(Map<String, dynamic> json) =>
      _$CaptionFormatFromJson(json);

  Map<String, dynamic> toJson() => _$CaptionFormatToJson(this);
}

/// A source file for the input sidecar captions used during the transcoding
/// process.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CaptionSource {
  /// The encryption settings, if any, that Elastic Transcoder needs to decyrpt
  /// your caption sources, or that you want Elastic Transcoder to apply to your
  /// caption sources.
  @_s.JsonKey(name: 'Encryption')
  final Encryption encryption;

  /// The name of the sidecar caption file that you want Elastic Transcoder to
  /// include in the output file.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The label of the caption shown in the player when choosing a language. We
  /// recommend that you put the caption language name here, in the language of
  /// the captions.
  @_s.JsonKey(name: 'Label')
  final String label;

  /// A string that specifies the language of the caption. If you specified
  /// multiple inputs with captions, the caption language must match in order to
  /// be included in the output. Specify this as one of:
  ///
  /// <ul>
  /// <li>
  /// 2-character ISO 639-1 code
  /// </li>
  /// <li>
  /// 3-character ISO 639-2 code
  /// </li>
  /// </ul>
  /// For more information on ISO language codes and language names, see the List
  /// of ISO 639-1 codes.
  @_s.JsonKey(name: 'Language')
  final String language;

  /// For clip generation or captions that do not start at the same time as the
  /// associated video file, the <code>TimeOffset</code> tells Elastic Transcoder
  /// how much of the video to encode before including captions.
  ///
  /// Specify the TimeOffset in the form [+-]SS.sss or [+-]HH:mm:SS.ss.
  @_s.JsonKey(name: 'TimeOffset')
  final String timeOffset;

  CaptionSource({
    this.encryption,
    this.key,
    this.label,
    this.language,
    this.timeOffset,
  });
  factory CaptionSource.fromJson(Map<String, dynamic> json) =>
      _$CaptionSourceFromJson(json);

  Map<String, dynamic> toJson() => _$CaptionSourceToJson(this);
}

/// The captions to be created, if any.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Captions {
  /// The array of file formats for the output captions. If you leave this value
  /// blank, Elastic Transcoder returns an error.
  @_s.JsonKey(name: 'CaptionFormats')
  final List<CaptionFormat> captionFormats;

  /// Source files for the input sidecar captions used during the transcoding
  /// process. To omit all sidecar captions, leave <code>CaptionSources</code>
  /// blank.
  @_s.JsonKey(name: 'CaptionSources')
  final List<CaptionSource> captionSources;

  /// A policy that determines how Elastic Transcoder handles the existence of
  /// multiple captions.
  ///
  /// <ul>
  /// <li>
  /// <b>MergeOverride:</b> Elastic Transcoder transcodes both embedded and
  /// sidecar captions into outputs. If captions for a language are embedded in
  /// the input file and also appear in a sidecar file, Elastic Transcoder uses
  /// the sidecar captions and ignores the embedded captions for that language.
  /// </li>
  /// <li>
  /// <b>MergeRetain:</b> Elastic Transcoder transcodes both embedded and sidecar
  /// captions into outputs. If captions for a language are embedded in the input
  /// file and also appear in a sidecar file, Elastic Transcoder uses the embedded
  /// captions and ignores the sidecar captions for that language. If
  /// <code>CaptionSources</code> is empty, Elastic Transcoder omits all sidecar
  /// captions from the output files.
  /// </li>
  /// <li>
  /// <b>Override:</b> Elastic Transcoder transcodes only the sidecar captions
  /// that you specify in <code>CaptionSources</code>.
  /// </li>
  /// </ul>
  /// <code>MergePolicy</code> cannot be null.
  @_s.JsonKey(name: 'MergePolicy')
  final String mergePolicy;

  Captions({
    this.captionFormats,
    this.captionSources,
    this.mergePolicy,
  });
  factory Captions.fromJson(Map<String, dynamic> json) =>
      _$CaptionsFromJson(json);

  Map<String, dynamic> toJson() => _$CaptionsToJson(this);
}

/// Settings for one clip in a composition. All jobs in a playlist must have the
/// same clip settings.
@deprecated
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Clip {
  /// Settings that determine when a clip begins and how long it lasts.
  @_s.JsonKey(name: 'TimeSpan')
  final TimeSpan timeSpan;

  Clip({
    this.timeSpan,
  });
  factory Clip.fromJson(Map<String, dynamic> json) => _$ClipFromJson(json);

  Map<String, dynamic> toJson() => _$ClipToJson(this);
}

/// The <code>CreateJobOutput</code> structure.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateJobOutput {
  /// Information about the album art that you want Elastic Transcoder to add to
  /// the file during transcoding. You can specify up to twenty album artworks for
  /// each output. Settings for each artwork must be defined in the job for the
  /// current output.
  @_s.JsonKey(name: 'AlbumArt')
  final JobAlbumArt albumArt;

  /// You can configure Elastic Transcoder to transcode captions, or subtitles,
  /// from one format to another. All captions must be in UTF-8. Elastic
  /// Transcoder supports two types of captions:
  ///
  /// <ul>
  /// <li>
  /// <b>Embedded:</b> Embedded captions are included in the same file as the
  /// audio and video. Elastic Transcoder supports only one embedded caption per
  /// language, to a maximum of 300 embedded captions per file.
  ///
  /// Valid input values include: <code>CEA-608 (EIA-608</code>, first non-empty
  /// channel only), <code>CEA-708 (EIA-708</code>, first non-empty channel only),
  /// and <code>mov-text</code>
  ///
  /// Valid outputs include: <code>mov-text</code>
  ///
  /// Elastic Transcoder supports a maximum of one embedded format per output.
  /// </li>
  /// <li>
  /// <b>Sidecar:</b> Sidecar captions are kept in a separate metadata file from
  /// the audio and video data. Sidecar captions require a player that is capable
  /// of understanding the relationship between the video file and the sidecar
  /// file. Elastic Transcoder supports only one sidecar caption per language, to
  /// a maximum of 20 sidecar captions per file.
  ///
  /// Valid input values include: <code>dfxp</code> (first div element only),
  /// <code>ebu-tt</code>, <code>scc</code>, <code>smpt</code>, <code>srt</code>,
  /// <code>ttml</code> (first div element only), and <code>webvtt</code>
  ///
  /// Valid outputs include: <code>dfxp</code> (first div element only),
  /// <code>scc</code>, <code>srt</code>, and <code>webvtt</code>.
  /// </li>
  /// </ul>
  /// If you want ttml or smpte-tt compatible captions, specify dfxp as your
  /// output format.
  ///
  /// Elastic Transcoder does not support OCR (Optical Character Recognition),
  /// does not accept pictures as a valid input for captions, and is not available
  /// for audio-only transcoding. Elastic Transcoder does not preserve text
  /// formatting (for example, italics) during the transcoding process.
  ///
  /// To remove captions or leave the captions empty, set <code>Captions</code> to
  /// null. To pass through existing captions unchanged, set the
  /// <code>MergePolicy</code> to <code>MergeRetain</code>, and pass in a null
  /// <code>CaptionSources</code> array.
  ///
  /// For more information on embedded files, see the Subtitles Wikipedia page.
  ///
  /// For more information on sidecar files, see the Extensible Metadata Platform
  /// and Sidecar file Wikipedia pages.
  @_s.JsonKey(name: 'Captions')
  final Captions captions;

  /// You can create an output file that contains an excerpt from the input file.
  /// This excerpt, called a clip, can come from the beginning, middle, or end of
  /// the file. The Composition object contains settings for the clips that make
  /// up an output file. For the current release, you can only specify settings
  /// for a single clip per output file. The Composition object cannot be null.
  @_s.JsonKey(name: 'Composition')
  final List<Clip> composition;

  /// You can specify encryption settings for any output files that you want to
  /// use for a transcoding job. This includes the output file and any watermarks,
  /// thumbnails, album art, or captions that you want to use. You must specify
  /// encryption settings for each file individually.
  @_s.JsonKey(name: 'Encryption')
  final Encryption encryption;

  /// The name to assign to the transcoded file. Elastic Transcoder saves the file
  /// in the Amazon S3 bucket specified by the <code>OutputBucket</code> object in
  /// the pipeline that is specified by the pipeline ID. If a file with the
  /// specified name already exists in the output bucket, the job fails.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The <code>Id</code> of the preset to use for this job. The preset determines
  /// the audio, video, and thumbnail settings that Elastic Transcoder uses for
  /// transcoding.
  @_s.JsonKey(name: 'PresetId')
  final String presetId;

  /// The number of degrees clockwise by which you want Elastic Transcoder to
  /// rotate the output relative to the input. Enter one of the following values:
  /// <code>auto</code>, <code>0</code>, <code>90</code>, <code>180</code>,
  /// <code>270</code>. The value <code>auto</code> generally works only if the
  /// file that you're transcoding contains rotation metadata.
  @_s.JsonKey(name: 'Rotate')
  final String rotate;

  /// <important>
  /// (Outputs in Fragmented MP4 or MPEG-TS format only.
  /// </important>
  /// If you specify a preset in <code>PresetId</code> for which the value of
  /// <code>Container</code> is <code>fmp4</code> (Fragmented MP4) or
  /// <code>ts</code> (MPEG-TS), <code>SegmentDuration</code> is the target
  /// maximum duration of each segment in seconds. For <code>HLSv3</code> format
  /// playlists, each media segment is stored in a separate <code>.ts</code> file.
  /// For <code>HLSv4</code> and <code>Smooth</code> playlists, all media segments
  /// for an output are stored in a single file. Each segment is approximately the
  /// length of the <code>SegmentDuration</code>, though individual segments might
  /// be shorter or longer.
  ///
  /// The range of valid values is 1 to 60 seconds. If the duration of the video
  /// is not evenly divisible by <code>SegmentDuration</code>, the duration of the
  /// last segment is the remainder of total length/SegmentDuration.
  ///
  /// Elastic Transcoder creates an output-specific playlist for each output
  /// <code>HLS</code> output that you specify in OutputKeys. To add an output to
  /// the master playlist for this job, include it in the <code>OutputKeys</code>
  /// of the associated playlist.
  @_s.JsonKey(name: 'SegmentDuration')
  final String segmentDuration;

  /// The encryption settings, if any, that you want Elastic Transcoder to apply
  /// to your thumbnail.
  @_s.JsonKey(name: 'ThumbnailEncryption')
  final Encryption thumbnailEncryption;

  /// Whether you want Elastic Transcoder to create thumbnails for your videos
  /// and, if so, how you want Elastic Transcoder to name the files.
  ///
  /// If you don't want Elastic Transcoder to create thumbnails, specify "".
  ///
  /// If you do want Elastic Transcoder to create thumbnails, specify the
  /// information that you want to include in the file name for each thumbnail.
  /// You can specify the following values in any sequence:
  ///
  /// <ul>
  /// <li>
  /// <b> <code>{count}</code> (Required)</b>: If you want to create thumbnails,
  /// you must include <code>{count}</code> in the <code>ThumbnailPattern</code>
  /// object. Wherever you specify <code>{count}</code>, Elastic Transcoder adds a
  /// five-digit sequence number (beginning with <b>00001</b>) to thumbnail file
  /// names. The number indicates where a given thumbnail appears in the sequence
  /// of thumbnails for a transcoded file.
  /// <important>
  /// If you specify a literal value and/or <code>{resolution}</code> but you omit
  /// <code>{count}</code>, Elastic Transcoder returns a validation error and does
  /// not create the job.
  /// </important> </li>
  /// <li>
  /// <b>Literal values (Optional)</b>: You can specify literal values anywhere in
  /// the <code>ThumbnailPattern</code> object. For example, you can include them
  /// as a file name prefix or as a delimiter between <code>{resolution}</code>
  /// and <code>{count}</code>.
  /// </li>
  /// <li>
  /// <b> <code>{resolution}</code> (Optional)</b>: If you want Elastic Transcoder
  /// to include the resolution in the file name, include
  /// <code>{resolution}</code> in the <code>ThumbnailPattern</code> object.
  /// </li>
  /// </ul>
  /// When creating thumbnails, Elastic Transcoder automatically saves the files
  /// in the format (.jpg or .png) that appears in the preset that you specified
  /// in the <code>PresetID</code> value of <code>CreateJobOutput</code>. Elastic
  /// Transcoder also appends the applicable file name extension.
  @_s.JsonKey(name: 'ThumbnailPattern')
  final String thumbnailPattern;

  /// Information about the watermarks that you want Elastic Transcoder to add to
  /// the video during transcoding. You can specify up to four watermarks for each
  /// output. Settings for each watermark must be defined in the preset for the
  /// current output.
  @_s.JsonKey(name: 'Watermarks')
  final List<JobWatermark> watermarks;

  CreateJobOutput({
    this.albumArt,
    this.captions,
    this.composition,
    this.encryption,
    this.key,
    this.presetId,
    this.rotate,
    this.segmentDuration,
    this.thumbnailEncryption,
    this.thumbnailPattern,
    this.watermarks,
  });
  Map<String, dynamic> toJson() => _$CreateJobOutputToJson(this);
}

/// Information about the master playlist.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateJobPlaylist {
  /// The format of the output playlist. Valid formats include <code>HLSv3</code>,
  /// <code>HLSv4</code>, and <code>Smooth</code>.
  @_s.JsonKey(name: 'Format')
  final String format;

  /// The HLS content protection settings, if any, that you want Elastic
  /// Transcoder to apply to the output files associated with this playlist.
  @_s.JsonKey(name: 'HlsContentProtection')
  final HlsContentProtection hlsContentProtection;

  /// The name that you want Elastic Transcoder to assign to the master playlist,
  /// for example, nyc-vacation.m3u8. If the name includes a <code>/</code>
  /// character, the section of the name before the last <code>/</code> must be
  /// identical for all <code>Name</code> objects. If you create more than one
  /// master playlist, the values of all <code>Name</code> objects must be unique.
  /// <note>
  /// Elastic Transcoder automatically appends the relevant file extension to the
  /// file name (<code>.m3u8</code> for <code>HLSv3</code> and <code>HLSv4</code>
  /// playlists, and <code>.ism</code> and <code>.ismc</code> for
  /// <code>Smooth</code> playlists). If you include a file extension in
  /// <code>Name</code>, the file name will have two extensions.
  /// </note>
  @_s.JsonKey(name: 'Name')
  final String name;

  /// For each output in this job that you want to include in a master playlist,
  /// the value of the <code>Outputs:Key</code> object.
  ///
  /// <ul>
  /// <li>
  /// If your output is not <code>HLS</code> or does not have a segment duration
  /// set, the name of the output file is a concatenation of
  /// <code>OutputKeyPrefix</code> and <code>Outputs:Key</code>:
  ///
  /// OutputKeyPrefix<code>Outputs:Key</code>
  /// </li>
  /// <li>
  /// If your output is <code>HLSv3</code> and has a segment duration set, or is
  /// not included in a playlist, Elastic Transcoder creates an output playlist
  /// file with a file extension of <code>.m3u8</code>, and a series of
  /// <code>.ts</code> files that include a five-digit sequential counter
  /// beginning with 00000:
  ///
  /// OutputKeyPrefix<code>Outputs:Key</code>.m3u8
  ///
  /// OutputKeyPrefix<code>Outputs:Key</code>00000.ts
  /// </li>
  /// <li>
  /// If your output is <code>HLSv4</code>, has a segment duration set, and is
  /// included in an <code>HLSv4</code> playlist, Elastic Transcoder creates an
  /// output playlist file with a file extension of <code>_v4.m3u8</code>. If the
  /// output is video, Elastic Transcoder also creates an output file with an
  /// extension of <code>_iframe.m3u8</code>:
  ///
  /// OutputKeyPrefix<code>Outputs:Key</code>_v4.m3u8
  ///
  /// OutputKeyPrefix<code>Outputs:Key</code>_iframe.m3u8
  ///
  /// OutputKeyPrefix<code>Outputs:Key</code>.ts
  /// </li>
  /// </ul>
  /// Elastic Transcoder automatically appends the relevant file extension to the
  /// file name. If you include a file extension in Output Key, the file name will
  /// have two extensions.
  ///
  /// If you include more than one output in a playlist, any segment duration
  /// settings, clip settings, or caption settings must be the same for all
  /// outputs in the playlist. For <code>Smooth</code> playlists, the
  /// <code>Audio:Profile</code>, <code>Video:Profile</code>, and
  /// <code>Video:FrameRate</code> to <code>Video:KeyframesMaxDist</code> ratio
  /// must be the same for all outputs.
  @_s.JsonKey(name: 'OutputKeys')
  final List<String> outputKeys;

  /// The DRM settings, if any, that you want Elastic Transcoder to apply to the
  /// output files associated with this playlist.
  @_s.JsonKey(name: 'PlayReadyDrm')
  final PlayReadyDrm playReadyDrm;

  CreateJobPlaylist({
    this.format,
    this.hlsContentProtection,
    this.name,
    this.outputKeys,
    this.playReadyDrm,
  });
  Map<String, dynamic> toJson() => _$CreateJobPlaylistToJson(this);
}

/// The <code>CreateJobRequest</code> structure.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateJobRequest {
  /// The <code>Id</code> of the pipeline that you want Elastic Transcoder to use
  /// for transcoding. The pipeline determines several settings, including the
  /// Amazon S3 bucket from which Elastic Transcoder gets the files to transcode
  /// and the bucket into which Elastic Transcoder puts the transcoded files.
  @_s.JsonKey(name: 'PipelineId')
  final String pipelineId;

  /// A section of the request body that provides information about the file that
  /// is being transcoded.
  @_s.JsonKey(name: 'Input')
  final JobInput input;

  /// A section of the request body that provides information about the files that
  /// are being transcoded.
  @_s.JsonKey(name: 'Inputs')
  final List<JobInput> inputs;

  /// A section of the request body that provides information about the transcoded
  /// (target) file. We strongly recommend that you use the <code>Outputs</code>
  /// syntax instead of the <code>Output</code> syntax.
  @_s.JsonKey(name: 'Output')
  final CreateJobOutput output;

  /// The value, if any, that you want Elastic Transcoder to prepend to the names
  /// of all files that this job creates, including output files, thumbnails, and
  /// playlists.
  @_s.JsonKey(name: 'OutputKeyPrefix')
  final String outputKeyPrefix;

  /// A section of the request body that provides information about the transcoded
  /// (target) files. We recommend that you use the <code>Outputs</code> syntax
  /// instead of the <code>Output</code> syntax.
  @_s.JsonKey(name: 'Outputs')
  final List<CreateJobOutput> outputs;

  /// If you specify a preset in <code>PresetId</code> for which the value of
  /// <code>Container</code> is fmp4 (Fragmented MP4) or ts (MPEG-TS), Playlists
  /// contains information about the master playlists that you want Elastic
  /// Transcoder to create.
  ///
  /// The maximum number of master playlists in a job is 30.
  @_s.JsonKey(name: 'Playlists')
  final List<CreateJobPlaylist> playlists;

  /// User-defined metadata that you want to associate with an Elastic Transcoder
  /// job. You specify metadata in <code>key/value</code> pairs, and you can add
  /// up to 10 <code>key/value</code> pairs per job. Elastic Transcoder does not
  /// guarantee that <code>key/value</code> pairs are returned in the same order
  /// in which you specify them.
  @_s.JsonKey(name: 'UserMetadata')
  final Map<String, String> userMetadata;

  CreateJobRequest({
    @_s.required this.pipelineId,
    this.input,
    this.inputs,
    this.output,
    this.outputKeyPrefix,
    this.outputs,
    this.playlists,
    this.userMetadata,
  });
  Map<String, dynamic> toJson() => _$CreateJobRequestToJson(this);
}

/// The CreateJobResponse structure.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateJobResponse {
  /// A section of the response body that provides information about the job that
  /// is created.
  @_s.JsonKey(name: 'Job')
  final Job job;

  CreateJobResponse({
    this.job,
  });
  factory CreateJobResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateJobResponseFromJson(json);
}

/// The <code>CreatePipelineRequest</code> structure.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreatePipelineRequest {
  /// The Amazon S3 bucket in which you saved the media files that you want to
  /// transcode.
  @_s.JsonKey(name: 'InputBucket')
  final String inputBucket;

  /// The name of the pipeline. We recommend that the name be unique within the
  /// AWS account, but uniqueness is not enforced.
  ///
  /// Constraints: Maximum 40 characters.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The IAM Amazon Resource Name (ARN) for the role that you want Elastic
  /// Transcoder to use to create the pipeline.
  @_s.JsonKey(name: 'Role')
  final String role;

  /// The AWS Key Management Service (AWS KMS) key that you want to use with this
  /// pipeline.
  ///
  /// If you use either <code>s3</code> or <code>s3-aws-kms</code> as your
  /// <code>Encryption:Mode</code>, you don't need to provide a key with your job
  /// because a default key, known as an AWS-KMS key, is created for you
  /// automatically. You need to provide an AWS-KMS key only if you want to use a
  /// non-default AWS-KMS key, or if you are using an <code>Encryption:Mode</code>
  /// of <code>aes-cbc-pkcs7</code>, <code>aes-ctr</code>, or
  /// <code>aes-gcm</code>.
  @_s.JsonKey(name: 'AwsKmsKeyArn')
  final String awsKmsKeyArn;

  /// The optional <code>ContentConfig</code> object specifies information about
  /// the Amazon S3 bucket in which you want Elastic Transcoder to save transcoded
  /// files and playlists: which bucket to use, which users you want to have
  /// access to the files, the type of access you want users to have, and the
  /// storage class that you want to assign to the files.
  ///
  /// If you specify values for <code>ContentConfig</code>, you must also specify
  /// values for <code>ThumbnailConfig</code>.
  ///
  /// If you specify values for <code>ContentConfig</code> and
  /// <code>ThumbnailConfig</code>, omit the <code>OutputBucket</code> object.
  ///
  /// <ul>
  /// <li>
  /// <b>Bucket</b>: The Amazon S3 bucket in which you want Elastic Transcoder to
  /// save transcoded files and playlists.
  /// </li>
  /// <li>
  /// <b>Permissions</b> (Optional): The Permissions object specifies which users
  /// you want to have access to transcoded files and the type of access you want
  /// them to have. You can grant permissions to a maximum of 30 users and/or
  /// predefined Amazon S3 groups.
  /// </li>
  /// <li>
  /// <b>Grantee Type</b>: Specify the type of value that appears in the
  /// <code>Grantee</code> object:
  ///
  /// <ul>
  /// <li>
  /// <b>Canonical</b>: The value in the <code>Grantee</code> object is either the
  /// canonical user ID for an AWS account or an origin access identity for an
  /// Amazon CloudFront distribution. For more information about canonical user
  /// IDs, see Access Control List (ACL) Overview in the Amazon Simple Storage
  /// Service Developer Guide. For more information about using CloudFront origin
  /// access identities to require that users use CloudFront URLs instead of
  /// Amazon S3 URLs, see Using an Origin Access Identity to Restrict Access to
  /// Your Amazon S3 Content.
  /// <important>
  /// A canonical user ID is not the same as an AWS account number.
  /// </important> </li>
  /// <li>
  /// <b>Email</b>: The value in the <code>Grantee</code> object is the registered
  /// email address of an AWS account.
  /// </li>
  /// <li>
  /// <b>Group</b>: The value in the <code>Grantee</code> object is one of the
  /// following predefined Amazon S3 groups: <code>AllUsers</code>,
  /// <code>AuthenticatedUsers</code>, or <code>LogDelivery</code>.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b>Grantee</b>: The AWS user or group that you want to have access to
  /// transcoded files and playlists. To identify the user or group, you can
  /// specify the canonical user ID for an AWS account, an origin access identity
  /// for a CloudFront distribution, the registered email address of an AWS
  /// account, or a predefined Amazon S3 group
  /// </li>
  /// <li>
  /// <b>Access</b>: The permission that you want to give to the AWS user that you
  /// specified in <code>Grantee</code>. Permissions are granted on the files that
  /// Elastic Transcoder adds to the bucket, including playlists and video files.
  /// Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>READ</code>: The grantee can read the objects and metadata for objects
  /// that Elastic Transcoder adds to the Amazon S3 bucket.
  /// </li>
  /// <li>
  /// <code>READ_ACP</code>: The grantee can read the object ACL for objects that
  /// Elastic Transcoder adds to the Amazon S3 bucket.
  /// </li>
  /// <li>
  /// <code>WRITE_ACP</code>: The grantee can write the ACL for the objects that
  /// Elastic Transcoder adds to the Amazon S3 bucket.
  /// </li>
  /// <li>
  /// <code>FULL_CONTROL</code>: The grantee has <code>READ</code>,
  /// <code>READ_ACP</code>, and <code>WRITE_ACP</code> permissions for the
  /// objects that Elastic Transcoder adds to the Amazon S3 bucket.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b>StorageClass</b>: The Amazon S3 storage class, <code>Standard</code> or
  /// <code>ReducedRedundancy</code>, that you want Elastic Transcoder to assign
  /// to the video files and playlists that it stores in your Amazon S3 bucket.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ContentConfig')
  final PipelineOutputConfig contentConfig;

  /// The Amazon Simple Notification Service (Amazon SNS) topic that you want to
  /// notify to report job status.
  /// <important>
  /// To receive notifications, you must also subscribe to the new topic in the
  /// Amazon SNS console.
  /// </important>
  /// <ul>
  /// <li>
  /// <b>Progressing</b>: The topic ARN for the Amazon Simple Notification Service
  /// (Amazon SNS) topic that you want to notify when Elastic Transcoder has
  /// started to process a job in this pipeline. This is the ARN that Amazon SNS
  /// returned when you created the topic. For more information, see Create a
  /// Topic in the Amazon Simple Notification Service Developer Guide.
  /// </li>
  /// <li>
  /// <b>Complete</b>: The topic ARN for the Amazon SNS topic that you want to
  /// notify when Elastic Transcoder has finished processing a job in this
  /// pipeline. This is the ARN that Amazon SNS returned when you created the
  /// topic.
  /// </li>
  /// <li>
  /// <b>Warning</b>: The topic ARN for the Amazon SNS topic that you want to
  /// notify when Elastic Transcoder encounters a warning condition while
  /// processing a job in this pipeline. This is the ARN that Amazon SNS returned
  /// when you created the topic.
  /// </li>
  /// <li>
  /// <b>Error</b>: The topic ARN for the Amazon SNS topic that you want to notify
  /// when Elastic Transcoder encounters an error condition while processing a job
  /// in this pipeline. This is the ARN that Amazon SNS returned when you created
  /// the topic.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Notifications')
  final Notifications notifications;

  /// The Amazon S3 bucket in which you want Elastic Transcoder to save the
  /// transcoded files. (Use this, or use ContentConfig:Bucket plus
  /// ThumbnailConfig:Bucket.)
  ///
  /// Specify this value when all of the following are true:
  ///
  /// <ul>
  /// <li>
  /// You want to save transcoded files, thumbnails (if any), and playlists (if
  /// any) together in one bucket.
  /// </li>
  /// <li>
  /// You do not want to specify the users or groups who have access to the
  /// transcoded files, thumbnails, and playlists.
  /// </li>
  /// <li>
  /// You do not want to specify the permissions that Elastic Transcoder grants to
  /// the files.
  /// <important>
  /// When Elastic Transcoder saves files in <code>OutputBucket</code>, it grants
  /// full control over the files only to the AWS account that owns the role that
  /// is specified by <code>Role</code>.
  /// </important> </li>
  /// <li>
  /// You want to associate the transcoded files and thumbnails with the Amazon S3
  /// Standard storage class.
  /// </li>
  /// </ul>
  /// If you want to save transcoded files and playlists in one bucket and
  /// thumbnails in another bucket, specify which users can access the transcoded
  /// files or the permissions the users have, or change the Amazon S3 storage
  /// class, omit <code>OutputBucket</code> and specify values for
  /// <code>ContentConfig</code> and <code>ThumbnailConfig</code> instead.
  @_s.JsonKey(name: 'OutputBucket')
  final String outputBucket;

  /// The <code>ThumbnailConfig</code> object specifies several values, including
  /// the Amazon S3 bucket in which you want Elastic Transcoder to save thumbnail
  /// files, which users you want to have access to the files, the type of access
  /// you want users to have, and the storage class that you want to assign to the
  /// files.
  ///
  /// If you specify values for <code>ContentConfig</code>, you must also specify
  /// values for <code>ThumbnailConfig</code> even if you don't want to create
  /// thumbnails.
  ///
  /// If you specify values for <code>ContentConfig</code> and
  /// <code>ThumbnailConfig</code>, omit the <code>OutputBucket</code> object.
  ///
  /// <ul>
  /// <li>
  /// <b>Bucket</b>: The Amazon S3 bucket in which you want Elastic Transcoder to
  /// save thumbnail files.
  /// </li>
  /// <li>
  /// <b>Permissions</b> (Optional): The <code>Permissions</code> object specifies
  /// which users and/or predefined Amazon S3 groups you want to have access to
  /// thumbnail files, and the type of access you want them to have. You can grant
  /// permissions to a maximum of 30 users and/or predefined Amazon S3 groups.
  /// </li>
  /// <li>
  /// <b>GranteeType</b>: Specify the type of value that appears in the Grantee
  /// object:
  ///
  /// <ul>
  /// <li>
  /// <b>Canonical</b>: The value in the <code>Grantee</code> object is either the
  /// canonical user ID for an AWS account or an origin access identity for an
  /// Amazon CloudFront distribution.
  /// <important>
  /// A canonical user ID is not the same as an AWS account number.
  /// </important> </li>
  /// <li>
  /// <b>Email</b>: The value in the <code>Grantee</code> object is the registered
  /// email address of an AWS account.
  /// </li>
  /// <li>
  /// <b>Group</b>: The value in the <code>Grantee</code> object is one of the
  /// following predefined Amazon S3 groups: <code>AllUsers</code>,
  /// <code>AuthenticatedUsers</code>, or <code>LogDelivery</code>.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b>Grantee</b>: The AWS user or group that you want to have access to
  /// thumbnail files. To identify the user or group, you can specify the
  /// canonical user ID for an AWS account, an origin access identity for a
  /// CloudFront distribution, the registered email address of an AWS account, or
  /// a predefined Amazon S3 group.
  /// </li>
  /// <li>
  /// <b>Access</b>: The permission that you want to give to the AWS user that you
  /// specified in <code>Grantee</code>. Permissions are granted on the thumbnail
  /// files that Elastic Transcoder adds to the bucket. Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>READ</code>: The grantee can read the thumbnails and metadata for
  /// objects that Elastic Transcoder adds to the Amazon S3 bucket.
  /// </li>
  /// <li>
  /// <code>READ_ACP</code>: The grantee can read the object ACL for thumbnails
  /// that Elastic Transcoder adds to the Amazon S3 bucket.
  /// </li>
  /// <li>
  /// <code>WRITE_ACP</code>: The grantee can write the ACL for the thumbnails
  /// that Elastic Transcoder adds to the Amazon S3 bucket.
  /// </li>
  /// <li>
  /// <code>FULL_CONTROL</code>: The grantee has <code>READ</code>,
  /// <code>READ_ACP</code>, and <code>WRITE_ACP</code> permissions for the
  /// thumbnails that Elastic Transcoder adds to the Amazon S3 bucket.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b>StorageClass</b>: The Amazon S3 storage class, <code>Standard</code> or
  /// <code>ReducedRedundancy</code>, that you want Elastic Transcoder to assign
  /// to the thumbnails that it stores in your Amazon S3 bucket.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ThumbnailConfig')
  final PipelineOutputConfig thumbnailConfig;

  CreatePipelineRequest({
    @_s.required this.inputBucket,
    @_s.required this.name,
    @_s.required this.role,
    this.awsKmsKeyArn,
    this.contentConfig,
    this.notifications,
    this.outputBucket,
    this.thumbnailConfig,
  });
  Map<String, dynamic> toJson() => _$CreatePipelineRequestToJson(this);
}

/// When you create a pipeline, Elastic Transcoder returns the values that you
/// specified in the request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreatePipelineResponse {
  /// A section of the response body that provides information about the pipeline
  /// that is created.
  @_s.JsonKey(name: 'Pipeline')
  final Pipeline pipeline;

  /// Elastic Transcoder returns a warning if the resources used by your pipeline
  /// are not in the same region as the pipeline.
  ///
  /// Using resources in the same region, such as your Amazon S3 buckets, Amazon
  /// SNS notification topics, and AWS KMS key, reduces processing time and
  /// prevents cross-regional charges.
  @_s.JsonKey(name: 'Warnings')
  final List<Warning> warnings;

  CreatePipelineResponse({
    this.pipeline,
    this.warnings,
  });
  factory CreatePipelineResponse.fromJson(Map<String, dynamic> json) =>
      _$CreatePipelineResponseFromJson(json);
}

/// The <code>CreatePresetRequest</code> structure.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreatePresetRequest {
  /// The container type for the output file. Valid values include
  /// <code>flac</code>, <code>flv</code>, <code>fmp4</code>, <code>gif</code>,
  /// <code>mp3</code>, <code>mp4</code>, <code>mpg</code>, <code>mxf</code>,
  /// <code>oga</code>, <code>ogg</code>, <code>ts</code>, and <code>webm</code>.
  @_s.JsonKey(name: 'Container')
  final String container;

  /// The name of the preset. We recommend that the name be unique within the AWS
  /// account, but uniqueness is not enforced.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// A section of the request body that specifies the audio parameters.
  @_s.JsonKey(name: 'Audio')
  final AudioParameters audio;

  /// A description of the preset.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// A section of the request body that specifies the thumbnail parameters, if
  /// any.
  @_s.JsonKey(name: 'Thumbnails')
  final Thumbnails thumbnails;

  /// A section of the request body that specifies the video parameters.
  @_s.JsonKey(name: 'Video')
  final VideoParameters video;

  CreatePresetRequest({
    @_s.required this.container,
    @_s.required this.name,
    this.audio,
    this.description,
    this.thumbnails,
    this.video,
  });
  Map<String, dynamic> toJson() => _$CreatePresetRequestToJson(this);
}

/// The <code>CreatePresetResponse</code> structure.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreatePresetResponse {
  /// A section of the response body that provides information about the preset
  /// that is created.
  @_s.JsonKey(name: 'Preset')
  final Preset preset;

  /// If the preset settings don't comply with the standards for the video codec
  /// but Elastic Transcoder created the preset, this message explains the reason
  /// the preset settings don't meet the standard. Elastic Transcoder created the
  /// preset because the settings might produce acceptable output.
  @_s.JsonKey(name: 'Warning')
  final String warning;

  CreatePresetResponse({
    this.preset,
    this.warning,
  });
  factory CreatePresetResponse.fromJson(Map<String, dynamic> json) =>
      _$CreatePresetResponseFromJson(json);
}

/// The <code>DeletePipelineRequest</code> structure.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeletePipelineRequest {
  /// The identifier of the pipeline that you want to delete.
  @_s.JsonKey(name: 'Id', ignore: true)
  final String id;

  DeletePipelineRequest({
    @_s.required this.id,
  });
  Map<String, dynamic> toJson() => _$DeletePipelineRequestToJson(this);
}

/// The <code>DeletePipelineResponse</code> structure.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeletePipelineResponse {
  DeletePipelineResponse();
  factory DeletePipelineResponse.fromJson(Map<String, dynamic> json) =>
      _$DeletePipelineResponseFromJson(json);
}

/// The <code>DeletePresetRequest</code> structure.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeletePresetRequest {
  /// The identifier of the preset for which you want to get detailed information.
  @_s.JsonKey(name: 'Id', ignore: true)
  final String id;

  DeletePresetRequest({
    @_s.required this.id,
  });
  Map<String, dynamic> toJson() => _$DeletePresetRequestToJson(this);
}

/// The <code>DeletePresetResponse</code> structure.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeletePresetResponse {
  DeletePresetResponse();
  factory DeletePresetResponse.fromJson(Map<String, dynamic> json) =>
      _$DeletePresetResponseFromJson(json);
}

/// The detected properties of the input file. Elastic Transcoder identifies
/// these values from the input file.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DetectedProperties {
  /// The detected duration of the input file, in milliseconds.
  @_s.JsonKey(name: 'DurationMillis')
  final int durationMillis;

  /// The detected file size of the input file, in bytes.
  @_s.JsonKey(name: 'FileSize')
  final int fileSize;

  /// The detected frame rate of the input file, in frames per second.
  @_s.JsonKey(name: 'FrameRate')
  final String frameRate;

  /// The detected height of the input file, in pixels.
  @_s.JsonKey(name: 'Height')
  final int height;

  /// The detected width of the input file, in pixels.
  @_s.JsonKey(name: 'Width')
  final int width;

  DetectedProperties({
    this.durationMillis,
    this.fileSize,
    this.frameRate,
    this.height,
    this.width,
  });
  factory DetectedProperties.fromJson(Map<String, dynamic> json) =>
      _$DetectedPropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$DetectedPropertiesToJson(this);
}

/// The encryption settings, if any, that are used for decrypting your input
/// files or encrypting your output files. If your input file is encrypted, you
/// must specify the mode that Elastic Transcoder uses to decrypt your file,
/// otherwise you must specify the mode you want Elastic Transcoder to use to
/// encrypt your output files.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Encryption {
  /// The series of random bits created by a random bit generator, unique for
  /// every encryption operation, that you used to encrypt your input files or
  /// that you want Elastic Transcoder to use to encrypt your output files. The
  /// initialization vector must be base64-encoded, and it must be exactly 16
  /// bytes long before being base64-encoded.
  @_s.JsonKey(name: 'InitializationVector')
  final String initializationVector;

  /// The data encryption key that you want Elastic Transcoder to use to encrypt
  /// your output file, or that was used to encrypt your input file. The key must
  /// be base64-encoded and it must be one of the following bit lengths before
  /// being base64-encoded:
  ///
  /// <code>128</code>, <code>192</code>, or <code>256</code>.
  ///
  /// The key must also be encrypted by using the Amazon Key Management Service.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The MD5 digest of the key that you used to encrypt your input file, or that
  /// you want Elastic Transcoder to use to encrypt your output file. Elastic
  /// Transcoder uses the key digest as a checksum to make sure your key was not
  /// corrupted in transit. The key MD5 must be base64-encoded, and it must be
  /// exactly 16 bytes long before being base64-encoded.
  @_s.JsonKey(name: 'KeyMd5')
  final String keyMd5;

  /// The specific server-side encryption mode that you want Elastic Transcoder to
  /// use when decrypting your input files or encrypting your output files.
  /// Elastic Transcoder supports the following options:
  ///
  /// <ul>
  /// <li>
  /// <b>s3:</b> Amazon S3 creates and manages the keys used for encrypting your
  /// files.
  /// </li>
  /// <li>
  /// <b>s3-aws-kms:</b> Amazon S3 calls the Amazon Key Management Service, which
  /// creates and manages the keys that are used for encrypting your files. If you
  /// specify <code>s3-aws-kms</code> and you don't want to use the default key,
  /// you must add the AWS-KMS key that you want to use to your pipeline.
  /// </li>
  /// <li>
  /// <b>aes-cbc-pkcs7:</b> A padded cipher-block mode of operation originally
  /// used for HLS files.
  /// </li>
  /// <li>
  /// <b>aes-ctr:</b> AES Counter Mode.
  /// </li>
  /// <li>
  /// <b>aes-gcm:</b> AES Galois Counter Mode, a mode of operation that is an
  /// authenticated encryption format, meaning that a file, key, or initialization
  /// vector that has been tampered with fails the decryption process.
  /// </li>
  /// </ul>
  /// For all three AES options, you must provide the following settings, which
  /// must be base64-encoded:
  ///
  /// <ul>
  /// <li>
  /// <b>Key</b>
  /// </li>
  /// <li>
  /// <b>Key MD5</b>
  /// </li>
  /// <li>
  /// <b>Initialization Vector</b>
  /// </li>
  /// </ul> <important>
  /// For the AES modes, your private encryption keys and your unencrypted data
  /// are never stored by AWS; therefore, it is important that you safely manage
  /// your encryption keys. If you lose them, you won't be able to unencrypt your
  /// data.
  /// </important>
  @_s.JsonKey(name: 'Mode')
  final String mode;

  Encryption({
    this.initializationVector,
    this.key,
    this.keyMd5,
    this.mode,
  });
  factory Encryption.fromJson(Map<String, dynamic> json) =>
      _$EncryptionFromJson(json);

  Map<String, dynamic> toJson() => _$EncryptionToJson(this);
}

/// The HLS content protection settings, if any, that you want Elastic
/// Transcoder to apply to your output files.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HlsContentProtection {
  /// If Elastic Transcoder is generating your key for you, you must leave this
  /// field blank.
  ///
  /// The series of random bits created by a random bit generator, unique for
  /// every encryption operation, that you want Elastic Transcoder to use to
  /// encrypt your output files. The initialization vector must be base64-encoded,
  /// and it must be exactly 16 bytes before being base64-encoded.
  @_s.JsonKey(name: 'InitializationVector')
  final String initializationVector;

  /// If you want Elastic Transcoder to generate a key for you, leave this field
  /// blank.
  ///
  /// If you choose to supply your own key, you must encrypt the key by using AWS
  /// KMS. The key must be base64-encoded, and it must be one of the following bit
  /// lengths before being base64-encoded:
  ///
  /// <code>128</code>, <code>192</code>, or <code>256</code>.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// If Elastic Transcoder is generating your key for you, you must leave this
  /// field blank.
  ///
  /// The MD5 digest of the key that you want Elastic Transcoder to use to encrypt
  /// your output file, and that you want Elastic Transcoder to use as a checksum
  /// to make sure your key was not corrupted in transit. The key MD5 must be
  /// base64-encoded, and it must be exactly 16 bytes before being base64-
  /// encoded.
  @_s.JsonKey(name: 'KeyMd5')
  final String keyMd5;

  /// Specify whether you want Elastic Transcoder to write your HLS license key to
  /// an Amazon S3 bucket. If you choose <code>WithVariantPlaylists</code>,
  /// <code>LicenseAcquisitionUrl</code> must be left blank and Elastic Transcoder
  /// writes your data key into the same bucket as the associated playlist.
  @_s.JsonKey(name: 'KeyStoragePolicy')
  final String keyStoragePolicy;

  /// The location of the license key required to decrypt your HLS playlist. The
  /// URL must be an absolute path, and is referenced in the URI attribute of the
  /// EXT-X-KEY metadata tag in the playlist file.
  @_s.JsonKey(name: 'LicenseAcquisitionUrl')
  final String licenseAcquisitionUrl;

  /// The content protection method for your output. The only valid value is:
  /// <code>aes-128</code>.
  ///
  /// This value is written into the method attribute of the
  /// <code>EXT-X-KEY</code> metadata tag in the output playlist.
  @_s.JsonKey(name: 'Method')
  final String method;

  HlsContentProtection({
    this.initializationVector,
    this.key,
    this.keyMd5,
    this.keyStoragePolicy,
    this.licenseAcquisitionUrl,
    this.method,
  });
  factory HlsContentProtection.fromJson(Map<String, dynamic> json) =>
      _$HlsContentProtectionFromJson(json);

  Map<String, dynamic> toJson() => _$HlsContentProtectionToJson(this);
}

/// The captions to be created, if any.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class InputCaptions {
  /// Source files for the input sidecar captions used during the transcoding
  /// process. To omit all sidecar captions, leave <code>CaptionSources</code>
  /// blank.
  @_s.JsonKey(name: 'CaptionSources')
  final List<CaptionSource> captionSources;

  /// A policy that determines how Elastic Transcoder handles the existence of
  /// multiple captions.
  ///
  /// <ul>
  /// <li>
  /// <b>MergeOverride:</b> Elastic Transcoder transcodes both embedded and
  /// sidecar captions into outputs. If captions for a language are embedded in
  /// the input file and also appear in a sidecar file, Elastic Transcoder uses
  /// the sidecar captions and ignores the embedded captions for that language.
  /// </li>
  /// <li>
  /// <b>MergeRetain:</b> Elastic Transcoder transcodes both embedded and sidecar
  /// captions into outputs. If captions for a language are embedded in the input
  /// file and also appear in a sidecar file, Elastic Transcoder uses the embedded
  /// captions and ignores the sidecar captions for that language. If
  /// <code>CaptionSources</code> is empty, Elastic Transcoder omits all sidecar
  /// captions from the output files.
  /// </li>
  /// <li>
  /// <b>Override:</b> Elastic Transcoder transcodes only the sidecar captions
  /// that you specify in <code>CaptionSources</code>.
  /// </li>
  /// </ul>
  /// <code>MergePolicy</code> cannot be null.
  @_s.JsonKey(name: 'MergePolicy')
  final String mergePolicy;

  InputCaptions({
    this.captionSources,
    this.mergePolicy,
  });
  factory InputCaptions.fromJson(Map<String, dynamic> json) =>
      _$InputCaptionsFromJson(json);

  Map<String, dynamic> toJson() => _$InputCaptionsToJson(this);
}

/// A section of the response body that provides information about the job that
/// is created.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Job {
  /// The Amazon Resource Name (ARN) for the job.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The identifier that Elastic Transcoder assigned to the job. You use this
  /// value to get settings for the job or to delete the job.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// A section of the request or response body that provides information about
  /// the file that is being transcoded.
  @_s.JsonKey(name: 'Input')
  final JobInput input;

  /// Information about the files that you're transcoding. If you specified
  /// multiple files for this job, Elastic Transcoder stitches the files together
  /// to make one output.
  @_s.JsonKey(name: 'Inputs')
  final List<JobInput> inputs;

  /// If you specified one output for a job, information about that output. If you
  /// specified multiple outputs for a job, the Output object lists information
  /// about the first output. This duplicates the information that is listed for
  /// the first output in the Outputs object.
  /// <important>
  /// Outputs recommended instead.
  /// </important>
  /// A section of the request or response body that provides information about
  /// the transcoded (target) file.
  @_s.JsonKey(name: 'Output')
  final JobOutput output;

  /// The value, if any, that you want Elastic Transcoder to prepend to the names
  /// of all files that this job creates, including output files, thumbnails, and
  /// playlists. We recommend that you add a / or some other delimiter to the end
  /// of the <code>OutputKeyPrefix</code>.
  @_s.JsonKey(name: 'OutputKeyPrefix')
  final String outputKeyPrefix;

  /// Information about the output files. We recommend that you use the
  /// <code>Outputs</code> syntax for all jobs, even when you want Elastic
  /// Transcoder to transcode a file into only one format. Do not use both the
  /// <code>Outputs</code> and <code>Output</code> syntaxes in the same request.
  /// You can create a maximum of 30 outputs per job.
  ///
  /// If you specify more than one output for a job, Elastic Transcoder creates
  /// the files for each output in the order in which you specify them in the job.
  @_s.JsonKey(name: 'Outputs')
  final List<JobOutput> outputs;

  /// The <code>Id</code> of the pipeline that you want Elastic Transcoder to use
  /// for transcoding. The pipeline determines several settings, including the
  /// Amazon S3 bucket from which Elastic Transcoder gets the files to transcode
  /// and the bucket into which Elastic Transcoder puts the transcoded files.
  @_s.JsonKey(name: 'PipelineId')
  final String pipelineId;

  /// <important>
  /// Outputs in Fragmented MP4 or MPEG-TS format only.
  /// </important>
  /// If you specify a preset in <code>PresetId</code> for which the value of
  /// <code>Container</code> is fmp4 (Fragmented MP4) or ts (MPEG-TS),
  /// <code>Playlists</code> contains information about the master playlists that
  /// you want Elastic Transcoder to create.
  ///
  /// The maximum number of master playlists in a job is 30.
  @_s.JsonKey(name: 'Playlists')
  final List<Playlist> playlists;

  /// The status of the job: <code>Submitted</code>, <code>Progressing</code>,
  /// <code>Complete</code>, <code>Canceled</code>, or <code>Error</code>.
  @_s.JsonKey(name: 'Status')
  final String status;

  /// Details about the timing of a job.
  @_s.JsonKey(name: 'Timing')
  final Timing timing;

  /// User-defined metadata that you want to associate with an Elastic Transcoder
  /// job. You specify metadata in <code>key/value</code> pairs, and you can add
  /// up to 10 <code>key/value</code> pairs per job. Elastic Transcoder does not
  /// guarantee that <code>key/value</code> pairs are returned in the same order
  /// in which you specify them.
  ///
  /// Metadata <code>keys</code> and <code>values</code> must use characters from
  /// the following list:
  ///
  /// <ul>
  /// <li>
  /// <code>0-9</code>
  /// </li>
  /// <li>
  /// <code>A-Z</code> and <code>a-z</code>
  /// </li>
  /// <li>
  /// <code>Space</code>
  /// </li>
  /// <li>
  /// The following symbols: <code>_.:/=+-%@</code>
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'UserMetadata')
  final Map<String, String> userMetadata;

  Job({
    this.arn,
    this.id,
    this.input,
    this.inputs,
    this.output,
    this.outputKeyPrefix,
    this.outputs,
    this.pipelineId,
    this.playlists,
    this.status,
    this.timing,
    this.userMetadata,
  });
  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);
}

/// The .jpg or .png file associated with an audio file.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class JobAlbumArt {
  /// The file to be used as album art. There can be multiple artworks associated
  /// with an audio file, to a maximum of 20. Valid formats are <code>.jpg</code>
  /// and <code>.png</code>
  @_s.JsonKey(name: 'Artwork')
  final List<Artwork> artwork;

  /// A policy that determines how Elastic Transcoder handles the existence of
  /// multiple album artwork files.
  ///
  /// <ul>
  /// <li>
  /// <code>Replace:</code> The specified album art replaces any existing album
  /// art.
  /// </li>
  /// <li>
  /// <code>Prepend:</code> The specified album art is placed in front of any
  /// existing album art.
  /// </li>
  /// <li>
  /// <code>Append:</code> The specified album art is placed after any existing
  /// album art.
  /// </li>
  /// <li>
  /// <code>Fallback:</code> If the original input file contains artwork, Elastic
  /// Transcoder uses that artwork for the output. If the original input does not
  /// contain artwork, Elastic Transcoder uses the specified album art file.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'MergePolicy')
  final String mergePolicy;

  JobAlbumArt({
    this.artwork,
    this.mergePolicy,
  });
  factory JobAlbumArt.fromJson(Map<String, dynamic> json) =>
      _$JobAlbumArtFromJson(json);

  Map<String, dynamic> toJson() => _$JobAlbumArtToJson(this);
}

/// Information about the file that you're transcoding.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class JobInput {
  /// The aspect ratio of the input file. If you want Elastic Transcoder to
  /// automatically detect the aspect ratio of the input file, specify
  /// <code>auto</code>. If you want to specify the aspect ratio for the output
  /// file, enter one of the following values:
  ///
  /// <code>1:1</code>, <code>4:3</code>, <code>3:2</code>, <code>16:9</code>
  ///
  /// If you specify a value other than <code>auto</code>, Elastic Transcoder
  /// disables automatic detection of the aspect ratio.
  @_s.JsonKey(name: 'AspectRatio')
  final String aspectRatio;

  /// The container type for the input file. If you want Elastic Transcoder to
  /// automatically detect the container type of the input file, specify
  /// <code>auto</code>. If you want to specify the container type for the input
  /// file, enter one of the following values:
  ///
  /// <code>3gp</code>, <code>aac</code>, <code>asf</code>, <code>avi</code>,
  /// <code>divx</code>, <code>flv</code>, <code>m4a</code>, <code>mkv</code>,
  /// <code>mov</code>, <code>mp3</code>, <code>mp4</code>, <code>mpeg</code>,
  /// <code>mpeg-ps</code>, <code>mpeg-ts</code>, <code>mxf</code>,
  /// <code>ogg</code>, <code>vob</code>, <code>wav</code>, <code>webm</code>
  @_s.JsonKey(name: 'Container')
  final String container;

  /// The detected properties of the input file.
  @_s.JsonKey(name: 'DetectedProperties')
  final DetectedProperties detectedProperties;

  /// The encryption settings, if any, that are used for decrypting your input
  /// files. If your input file is encrypted, you must specify the mode that
  /// Elastic Transcoder uses to decrypt your file.
  @_s.JsonKey(name: 'Encryption')
  final Encryption encryption;

  /// The frame rate of the input file. If you want Elastic Transcoder to
  /// automatically detect the frame rate of the input file, specify
  /// <code>auto</code>. If you want to specify the frame rate for the input file,
  /// enter one of the following values:
  ///
  /// <code>10</code>, <code>15</code>, <code>23.97</code>, <code>24</code>,
  /// <code>25</code>, <code>29.97</code>, <code>30</code>, <code>60</code>
  ///
  /// If you specify a value other than <code>auto</code>, Elastic Transcoder
  /// disables automatic detection of the frame rate.
  @_s.JsonKey(name: 'FrameRate')
  final String frameRate;

  /// You can configure Elastic Transcoder to transcode captions, or subtitles,
  /// from one format to another. All captions must be in UTF-8. Elastic
  /// Transcoder supports two types of captions:
  ///
  /// <ul>
  /// <li>
  /// <b>Embedded:</b> Embedded captions are included in the same file as the
  /// audio and video. Elastic Transcoder supports only one embedded caption per
  /// language, to a maximum of 300 embedded captions per file.
  ///
  /// Valid input values include: <code>CEA-608 (EIA-608</code>, first non-empty
  /// channel only), <code>CEA-708 (EIA-708</code>, first non-empty channel only),
  /// and <code>mov-text</code>
  ///
  /// Valid outputs include: <code>mov-text</code>
  ///
  /// Elastic Transcoder supports a maximum of one embedded format per output.
  /// </li>
  /// <li>
  /// <b>Sidecar:</b> Sidecar captions are kept in a separate metadata file from
  /// the audio and video data. Sidecar captions require a player that is capable
  /// of understanding the relationship between the video file and the sidecar
  /// file. Elastic Transcoder supports only one sidecar caption per language, to
  /// a maximum of 20 sidecar captions per file.
  ///
  /// Valid input values include: <code>dfxp</code> (first div element only),
  /// <code>ebu-tt</code>, <code>scc</code>, <code>smpt</code>, <code>srt</code>,
  /// <code>ttml</code> (first div element only), and <code>webvtt</code>
  ///
  /// Valid outputs include: <code>dfxp</code> (first div element only),
  /// <code>scc</code>, <code>srt</code>, and <code>webvtt</code>.
  /// </li>
  /// </ul>
  /// If you want ttml or smpte-tt compatible captions, specify dfxp as your
  /// output format.
  ///
  /// Elastic Transcoder does not support OCR (Optical Character Recognition),
  /// does not accept pictures as a valid input for captions, and is not available
  /// for audio-only transcoding. Elastic Transcoder does not preserve text
  /// formatting (for example, italics) during the transcoding process.
  ///
  /// To remove captions or leave the captions empty, set <code>Captions</code> to
  /// null. To pass through existing captions unchanged, set the
  /// <code>MergePolicy</code> to <code>MergeRetain</code>, and pass in a null
  /// <code>CaptionSources</code> array.
  ///
  /// For more information on embedded files, see the Subtitles Wikipedia page.
  ///
  /// For more information on sidecar files, see the Extensible Metadata Platform
  /// and Sidecar file Wikipedia pages.
  @_s.JsonKey(name: 'InputCaptions')
  final InputCaptions inputCaptions;

  /// Whether the input file is interlaced. If you want Elastic Transcoder to
  /// automatically detect whether the input file is interlaced, specify
  /// <code>auto</code>. If you want to specify whether the input file is
  /// interlaced, enter one of the following values:
  ///
  /// <code>true</code>, <code>false</code>
  ///
  /// If you specify a value other than <code>auto</code>, Elastic Transcoder
  /// disables automatic detection of interlacing.
  @_s.JsonKey(name: 'Interlaced')
  final String interlaced;

  /// The name of the file to transcode. Elsewhere in the body of the JSON block
  /// is the the ID of the pipeline to use for processing the job. The
  /// <code>InputBucket</code> object in that pipeline tells Elastic Transcoder
  /// which Amazon S3 bucket to get the file from.
  ///
  /// If the file name includes a prefix, such as
  /// <code>cooking/lasagna.mpg</code>, include the prefix in the key. If the file
  /// isn't in the specified bucket, Elastic Transcoder returns an error.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// This value must be <code>auto</code>, which causes Elastic Transcoder to
  /// automatically detect the resolution of the input file.
  @_s.JsonKey(name: 'Resolution')
  final String resolution;

  /// Settings for clipping an input. Each input can have different clip settings.
  @_s.JsonKey(name: 'TimeSpan')
  final TimeSpan timeSpan;

  JobInput({
    this.aspectRatio,
    this.container,
    this.detectedProperties,
    this.encryption,
    this.frameRate,
    this.inputCaptions,
    this.interlaced,
    this.key,
    this.resolution,
    this.timeSpan,
  });
  factory JobInput.fromJson(Map<String, dynamic> json) =>
      _$JobInputFromJson(json);

  Map<String, dynamic> toJson() => _$JobInputToJson(this);
}

/// <important>
/// Outputs recommended instead.
/// </important>
/// If you specified one output for a job, information about that output. If you
/// specified multiple outputs for a job, the <code>Output</code> object lists
/// information about the first output. This duplicates the information that is
/// listed for the first output in the <code>Outputs</code> object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class JobOutput {
  /// The album art to be associated with the output file, if any.
  @_s.JsonKey(name: 'AlbumArt')
  final JobAlbumArt albumArt;

  /// If Elastic Transcoder used a preset with a
  /// <code>ColorSpaceConversionMode</code> to transcode the output file, the
  /// <code>AppliedColorSpaceConversion</code> parameter shows the conversion
  /// used. If no <code>ColorSpaceConversionMode</code> was defined in the preset,
  /// this parameter is not be included in the job response.
  @_s.JsonKey(name: 'AppliedColorSpaceConversion')
  final String appliedColorSpaceConversion;

  /// You can configure Elastic Transcoder to transcode captions, or subtitles,
  /// from one format to another. All captions must be in UTF-8. Elastic
  /// Transcoder supports two types of captions:
  ///
  /// <ul>
  /// <li>
  /// <b>Embedded:</b> Embedded captions are included in the same file as the
  /// audio and video. Elastic Transcoder supports only one embedded caption per
  /// language, to a maximum of 300 embedded captions per file.
  ///
  /// Valid input values include: <code>CEA-608 (EIA-608</code>, first non-empty
  /// channel only), <code>CEA-708 (EIA-708</code>, first non-empty channel only),
  /// and <code>mov-text</code>
  ///
  /// Valid outputs include: <code>mov-text</code>
  ///
  /// Elastic Transcoder supports a maximum of one embedded format per output.
  /// </li>
  /// <li>
  /// <b>Sidecar:</b> Sidecar captions are kept in a separate metadata file from
  /// the audio and video data. Sidecar captions require a player that is capable
  /// of understanding the relationship between the video file and the sidecar
  /// file. Elastic Transcoder supports only one sidecar caption per language, to
  /// a maximum of 20 sidecar captions per file.
  ///
  /// Valid input values include: <code>dfxp</code> (first div element only),
  /// <code>ebu-tt</code>, <code>scc</code>, <code>smpt</code>, <code>srt</code>,
  /// <code>ttml</code> (first div element only), and <code>webvtt</code>
  ///
  /// Valid outputs include: <code>dfxp</code> (first div element only),
  /// <code>scc</code>, <code>srt</code>, and <code>webvtt</code>.
  /// </li>
  /// </ul>
  /// If you want ttml or smpte-tt compatible captions, specify dfxp as your
  /// output format.
  ///
  /// Elastic Transcoder does not support OCR (Optical Character Recognition),
  /// does not accept pictures as a valid input for captions, and is not available
  /// for audio-only transcoding. Elastic Transcoder does not preserve text
  /// formatting (for example, italics) during the transcoding process.
  ///
  /// To remove captions or leave the captions empty, set <code>Captions</code> to
  /// null. To pass through existing captions unchanged, set the
  /// <code>MergePolicy</code> to <code>MergeRetain</code>, and pass in a null
  /// <code>CaptionSources</code> array.
  ///
  /// For more information on embedded files, see the Subtitles Wikipedia page.
  ///
  /// For more information on sidecar files, see the Extensible Metadata Platform
  /// and Sidecar file Wikipedia pages.
  @_s.JsonKey(name: 'Captions')
  final Captions captions;

  /// You can create an output file that contains an excerpt from the input file.
  /// This excerpt, called a clip, can come from the beginning, middle, or end of
  /// the file. The Composition object contains settings for the clips that make
  /// up an output file. For the current release, you can only specify settings
  /// for a single clip per output file. The Composition object cannot be null.
  @_s.JsonKey(name: 'Composition')
  final List<Clip> composition;

  /// Duration of the output file, in seconds.
  @_s.JsonKey(name: 'Duration')
  final int duration;

  /// Duration of the output file, in milliseconds.
  @_s.JsonKey(name: 'DurationMillis')
  final int durationMillis;

  /// The encryption settings, if any, that you want Elastic Transcoder to apply
  /// to your output files. If you choose to use encryption, you must specify a
  /// mode to use. If you choose not to use encryption, Elastic Transcoder writes
  /// an unencrypted file to your Amazon S3 bucket.
  @_s.JsonKey(name: 'Encryption')
  final Encryption encryption;

  /// File size of the output file, in bytes.
  @_s.JsonKey(name: 'FileSize')
  final int fileSize;

  /// Frame rate of the output file, in frames per second.
  @_s.JsonKey(name: 'FrameRate')
  final String frameRate;

  /// Height of the output file, in pixels.
  @_s.JsonKey(name: 'Height')
  final int height;

  /// A sequential counter, starting with 1, that identifies an output among the
  /// outputs from the current job. In the Output syntax, this value is always 1.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name to assign to the transcoded file. Elastic Transcoder saves the file
  /// in the Amazon S3 bucket specified by the <code>OutputBucket</code> object in
  /// the pipeline that is specified by the pipeline ID.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The value of the <code>Id</code> object for the preset that you want to use
  /// for this job. The preset determines the audio, video, and thumbnail settings
  /// that Elastic Transcoder uses for transcoding. To use a preset that you
  /// created, specify the preset ID that Elastic Transcoder returned in the
  /// response when you created the preset. You can also use the Elastic
  /// Transcoder system presets, which you can get with <code>ListPresets</code>.
  @_s.JsonKey(name: 'PresetId')
  final String presetId;

  /// The number of degrees clockwise by which you want Elastic Transcoder to
  /// rotate the output relative to the input. Enter one of the following values:
  ///
  /// <code>auto</code>, <code>0</code>, <code>90</code>, <code>180</code>,
  /// <code>270</code>
  ///
  /// The value <code>auto</code> generally works only if the file that you're
  /// transcoding contains rotation metadata.
  @_s.JsonKey(name: 'Rotate')
  final String rotate;

  /// <important>
  /// (Outputs in Fragmented MP4 or MPEG-TS format only.
  /// </important>
  /// If you specify a preset in <code>PresetId</code> for which the value of
  /// <code>Container</code> is <code>fmp4</code> (Fragmented MP4) or
  /// <code>ts</code> (MPEG-TS), <code>SegmentDuration</code> is the target
  /// maximum duration of each segment in seconds. For <code>HLSv3</code> format
  /// playlists, each media segment is stored in a separate <code>.ts</code> file.
  /// For <code>HLSv4</code>, <code>MPEG-DASH</code>, and <code>Smooth</code>
  /// playlists, all media segments for an output are stored in a single file.
  /// Each segment is approximately the length of the
  /// <code>SegmentDuration</code>, though individual segments might be shorter or
  /// longer.
  ///
  /// The range of valid values is 1 to 60 seconds. If the duration of the video
  /// is not evenly divisible by <code>SegmentDuration</code>, the duration of the
  /// last segment is the remainder of total length/SegmentDuration.
  ///
  /// Elastic Transcoder creates an output-specific playlist for each output
  /// <code>HLS</code> output that you specify in OutputKeys. To add an output to
  /// the master playlist for this job, include it in the <code>OutputKeys</code>
  /// of the associated playlist.
  @_s.JsonKey(name: 'SegmentDuration')
  final String segmentDuration;

  /// The status of one output in a job. If you specified only one output for the
  /// job, <code>Outputs:Status</code> is always the same as
  /// <code>Job:Status</code>. If you specified more than one output:
  ///
  /// <ul>
  /// <li>
  /// <code>Job:Status</code> and <code>Outputs:Status</code> for all of the
  /// outputs is Submitted until Elastic Transcoder starts to process the first
  /// output.
  /// </li>
  /// <li>
  /// When Elastic Transcoder starts to process the first output,
  /// <code>Outputs:Status</code> for that output and <code>Job:Status</code> both
  /// change to Progressing. For each output, the value of
  /// <code>Outputs:Status</code> remains Submitted until Elastic Transcoder
  /// starts to process the output.
  /// </li>
  /// <li>
  /// Job:Status remains Progressing until all of the outputs reach a terminal
  /// status, either Complete or Error.
  /// </li>
  /// <li>
  /// When all of the outputs reach a terminal status, <code>Job:Status</code>
  /// changes to Complete only if <code>Outputs:Status</code> for all of the
  /// outputs is <code>Complete</code>. If <code>Outputs:Status</code> for one or
  /// more outputs is <code>Error</code>, the terminal status for
  /// <code>Job:Status</code> is also <code>Error</code>.
  /// </li>
  /// </ul>
  /// The value of <code>Status</code> is one of the following:
  /// <code>Submitted</code>, <code>Progressing</code>, <code>Complete</code>,
  /// <code>Canceled</code>, or <code>Error</code>.
  @_s.JsonKey(name: 'Status')
  final String status;

  /// Information that further explains <code>Status</code>.
  @_s.JsonKey(name: 'StatusDetail')
  final String statusDetail;

  /// The encryption settings, if any, that you want Elastic Transcoder to apply
  /// to your thumbnail.
  @_s.JsonKey(name: 'ThumbnailEncryption')
  final Encryption thumbnailEncryption;

  /// Whether you want Elastic Transcoder to create thumbnails for your videos
  /// and, if so, how you want Elastic Transcoder to name the files.
  ///
  /// If you don't want Elastic Transcoder to create thumbnails, specify "".
  ///
  /// If you do want Elastic Transcoder to create thumbnails, specify the
  /// information that you want to include in the file name for each thumbnail.
  /// You can specify the following values in any sequence:
  ///
  /// <ul>
  /// <li>
  /// <b> <code>{count}</code> (Required)</b>: If you want to create thumbnails,
  /// you must include <code>{count}</code> in the <code>ThumbnailPattern</code>
  /// object. Wherever you specify <code>{count}</code>, Elastic Transcoder adds a
  /// five-digit sequence number (beginning with <b>00001</b>) to thumbnail file
  /// names. The number indicates where a given thumbnail appears in the sequence
  /// of thumbnails for a transcoded file.
  /// <important>
  /// If you specify a literal value and/or <code>{resolution}</code> but you omit
  /// <code>{count}</code>, Elastic Transcoder returns a validation error and does
  /// not create the job.
  /// </important> </li>
  /// <li>
  /// <b>Literal values (Optional)</b>: You can specify literal values anywhere in
  /// the <code>ThumbnailPattern</code> object. For example, you can include them
  /// as a file name prefix or as a delimiter between <code>{resolution}</code>
  /// and <code>{count}</code>.
  /// </li>
  /// <li>
  /// <b> <code>{resolution}</code> (Optional)</b>: If you want Elastic Transcoder
  /// to include the resolution in the file name, include
  /// <code>{resolution}</code> in the <code>ThumbnailPattern</code> object.
  /// </li>
  /// </ul>
  /// When creating thumbnails, Elastic Transcoder automatically saves the files
  /// in the format (.jpg or .png) that appears in the preset that you specified
  /// in the <code>PresetID</code> value of <code>CreateJobOutput</code>. Elastic
  /// Transcoder also appends the applicable file name extension.
  @_s.JsonKey(name: 'ThumbnailPattern')
  final String thumbnailPattern;

  /// Information about the watermarks that you want Elastic Transcoder to add to
  /// the video during transcoding. You can specify up to four watermarks for each
  /// output. Settings for each watermark must be defined in the preset that you
  /// specify in <code>Preset</code> for the current output.
  ///
  /// Watermarks are added to the output video in the sequence in which you list
  /// them in the job output—the first watermark in the list is added to the
  /// output video first, the second watermark in the list is added next, and so
  /// on. As a result, if the settings in a preset cause Elastic Transcoder to
  /// place all watermarks in the same location, the second watermark that you add
  /// covers the first one, the third one covers the second, and the fourth one
  /// covers the third.
  @_s.JsonKey(name: 'Watermarks')
  final List<JobWatermark> watermarks;

  /// Specifies the width of the output file in pixels.
  @_s.JsonKey(name: 'Width')
  final int width;

  JobOutput({
    this.albumArt,
    this.appliedColorSpaceConversion,
    this.captions,
    this.composition,
    this.duration,
    this.durationMillis,
    this.encryption,
    this.fileSize,
    this.frameRate,
    this.height,
    this.id,
    this.key,
    this.presetId,
    this.rotate,
    this.segmentDuration,
    this.status,
    this.statusDetail,
    this.thumbnailEncryption,
    this.thumbnailPattern,
    this.watermarks,
    this.width,
  });
  factory JobOutput.fromJson(Map<String, dynamic> json) =>
      _$JobOutputFromJson(json);
}

/// Watermarks can be in .png or .jpg format. If you want to display a watermark
/// that is not rectangular, use the .png format, which supports transparency.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class JobWatermark {
  /// The encryption settings, if any, that you want Elastic Transcoder to apply
  /// to your watermarks.
  @_s.JsonKey(name: 'Encryption')
  final Encryption encryption;

  /// The name of the .png or .jpg file that you want to use for the watermark. To
  /// determine which Amazon S3 bucket contains the specified file, Elastic
  /// Transcoder checks the pipeline specified by <code>Pipeline</code>; the
  /// <code>Input Bucket</code> object in that pipeline identifies the bucket.
  ///
  /// If the file name includes a prefix, for example, <b>logos/128x64.png</b>,
  /// include the prefix in the key. If the file isn't in the specified bucket,
  /// Elastic Transcoder returns an error.
  @_s.JsonKey(name: 'InputKey')
  final String inputKey;

  /// The ID of the watermark settings that Elastic Transcoder uses to add
  /// watermarks to the video during transcoding. The settings are in the preset
  /// specified by Preset for the current output. In that preset, the value of
  /// Watermarks Id tells Elastic Transcoder which settings to use.
  @_s.JsonKey(name: 'PresetWatermarkId')
  final String presetWatermarkId;

  JobWatermark({
    this.encryption,
    this.inputKey,
    this.presetWatermarkId,
  });
  factory JobWatermark.fromJson(Map<String, dynamic> json) =>
      _$JobWatermarkFromJson(json);

  Map<String, dynamic> toJson() => _$JobWatermarkToJson(this);
}

/// The <code>ListJobsByPipelineResponse</code> structure.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListJobsByPipelineResponse {
  /// An array of <code>Job</code> objects that are in the specified pipeline.
  @_s.JsonKey(name: 'Jobs')
  final List<Job> jobs;

  /// A value that you use to access the second and subsequent pages of results,
  /// if any. When the jobs in the specified pipeline fit on one page or when
  /// you've reached the last page of results, the value of
  /// <code>NextPageToken</code> is <code>null</code>.
  @_s.JsonKey(name: 'NextPageToken')
  final String nextPageToken;

  ListJobsByPipelineResponse({
    this.jobs,
    this.nextPageToken,
  });
  factory ListJobsByPipelineResponse.fromJson(Map<String, dynamic> json) =>
      _$ListJobsByPipelineResponseFromJson(json);
}

/// The <code>ListJobsByStatusResponse</code> structure.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListJobsByStatusResponse {
  /// An array of <code>Job</code> objects that have the specified status.
  @_s.JsonKey(name: 'Jobs')
  final List<Job> jobs;

  /// A value that you use to access the second and subsequent pages of results,
  /// if any. When the jobs in the specified pipeline fit on one page or when
  /// you've reached the last page of results, the value of
  /// <code>NextPageToken</code> is <code>null</code>.
  @_s.JsonKey(name: 'NextPageToken')
  final String nextPageToken;

  ListJobsByStatusResponse({
    this.jobs,
    this.nextPageToken,
  });
  factory ListJobsByStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$ListJobsByStatusResponseFromJson(json);
}

/// A list of the pipelines associated with the current AWS account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListPipelinesResponse {
  /// A value that you use to access the second and subsequent pages of results,
  /// if any. When the pipelines fit on one page or when you've reached the last
  /// page of results, the value of <code>NextPageToken</code> is
  /// <code>null</code>.
  @_s.JsonKey(name: 'NextPageToken')
  final String nextPageToken;

  /// An array of <code>Pipeline</code> objects.
  @_s.JsonKey(name: 'Pipelines')
  final List<Pipeline> pipelines;

  ListPipelinesResponse({
    this.nextPageToken,
    this.pipelines,
  });
  factory ListPipelinesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListPipelinesResponseFromJson(json);
}

/// The <code>ListPresetsResponse</code> structure.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListPresetsResponse {
  /// A value that you use to access the second and subsequent pages of results,
  /// if any. When the presets fit on one page or when you've reached the last
  /// page of results, the value of <code>NextPageToken</code> is
  /// <code>null</code>.
  @_s.JsonKey(name: 'NextPageToken')
  final String nextPageToken;

  /// An array of <code>Preset</code> objects.
  @_s.JsonKey(name: 'Presets')
  final List<Preset> presets;

  ListPresetsResponse({
    this.nextPageToken,
    this.presets,
  });
  factory ListPresetsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListPresetsResponseFromJson(json);
}

/// The Amazon Simple Notification Service (Amazon SNS) topic or topics to
/// notify in order to report job status.
/// <important>
/// To receive notifications, you must also subscribe to the new topic in the
/// Amazon SNS console.
/// </important>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Notifications {
  /// The Amazon SNS topic that you want to notify when Elastic Transcoder has
  /// finished processing the job.
  @_s.JsonKey(name: 'Completed')
  final String completed;

  /// The Amazon SNS topic that you want to notify when Elastic Transcoder
  /// encounters an error condition.
  @_s.JsonKey(name: 'Error')
  final String error;

  /// The Amazon Simple Notification Service (Amazon SNS) topic that you want to
  /// notify when Elastic Transcoder has started to process the job.
  @_s.JsonKey(name: 'Progressing')
  final String progressing;

  /// The Amazon SNS topic that you want to notify when Elastic Transcoder
  /// encounters a warning condition.
  @_s.JsonKey(name: 'Warning')
  final String warning;

  Notifications({
    this.completed,
    this.error,
    this.progressing,
    this.warning,
  });
  factory Notifications.fromJson(Map<String, dynamic> json) =>
      _$NotificationsFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationsToJson(this);
}

/// The <code>Permission</code> structure.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Permission {
  /// The permission that you want to give to the AWS user that is listed in
  /// Grantee. Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>READ</code>: The grantee can read the thumbnails and metadata for
  /// thumbnails that Elastic Transcoder adds to the Amazon S3 bucket.
  /// </li>
  /// <li>
  /// <code>READ_ACP</code>: The grantee can read the object ACL for thumbnails
  /// that Elastic Transcoder adds to the Amazon S3 bucket.
  /// </li>
  /// <li>
  /// <code>WRITE_ACP</code>: The grantee can write the ACL for the thumbnails
  /// that Elastic Transcoder adds to the Amazon S3 bucket.
  /// </li>
  /// <li>
  /// <code>FULL_CONTROL</code>: The grantee has READ, READ_ACP, and WRITE_ACP
  /// permissions for the thumbnails that Elastic Transcoder adds to the Amazon S3
  /// bucket.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Access')
  final List<String> access;

  /// The AWS user or group that you want to have access to transcoded files and
  /// playlists. To identify the user or group, you can specify the canonical user
  /// ID for an AWS account, an origin access identity for a CloudFront
  /// distribution, the registered email address of an AWS account, or a
  /// predefined Amazon S3 group.
  @_s.JsonKey(name: 'Grantee')
  final String grantee;

  /// The type of value that appears in the Grantee object:
  ///
  /// <ul>
  /// <li>
  /// <code>Canonical</code>: Either the canonical user ID for an AWS account or
  /// an origin access identity for an Amazon CloudFront distribution.
  /// <important>
  /// A canonical user ID is not the same as an AWS account number.
  /// </important> </li>
  /// <li>
  /// <code>Email</code>: The registered email address of an AWS account.
  /// </li>
  /// <li>
  /// <code>Group</code>: One of the following predefined Amazon S3 groups:
  /// <code>AllUsers</code>, <code>AuthenticatedUsers</code>, or
  /// <code>LogDelivery</code>.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'GranteeType')
  final String granteeType;

  Permission({
    this.access,
    this.grantee,
    this.granteeType,
  });
  factory Permission.fromJson(Map<String, dynamic> json) =>
      _$PermissionFromJson(json);

  Map<String, dynamic> toJson() => _$PermissionToJson(this);
}

/// The pipeline (queue) that is used to manage jobs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Pipeline {
  /// The Amazon Resource Name (ARN) for the pipeline.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The AWS Key Management Service (AWS KMS) key that you want to use with this
  /// pipeline.
  ///
  /// If you use either <code>s3</code> or <code>s3-aws-kms</code> as your
  /// <code>Encryption:Mode</code>, you don't need to provide a key with your job
  /// because a default key, known as an AWS-KMS key, is created for you
  /// automatically. You need to provide an AWS-KMS key only if you want to use a
  /// non-default AWS-KMS key, or if you are using an <code>Encryption:Mode</code>
  /// of <code>aes-cbc-pkcs7</code>, <code>aes-ctr</code>, or
  /// <code>aes-gcm</code>.
  @_s.JsonKey(name: 'AwsKmsKeyArn')
  final String awsKmsKeyArn;

  /// Information about the Amazon S3 bucket in which you want Elastic Transcoder
  /// to save transcoded files and playlists. Either you specify both
  /// <code>ContentConfig</code> and <code>ThumbnailConfig</code>, or you specify
  /// <code>OutputBucket</code>.
  ///
  /// <ul>
  /// <li>
  /// <b>Bucket</b>: The Amazon S3 bucket in which you want Elastic Transcoder to
  /// save transcoded files and playlists.
  /// </li>
  /// <li>
  /// <b>Permissions</b>: A list of the users and/or predefined Amazon S3 groups
  /// you want to have access to transcoded files and playlists, and the type of
  /// access that you want them to have.
  ///
  /// <ul>
  /// <li>
  /// GranteeType: The type of value that appears in the <code>Grantee</code>
  /// object:
  ///
  /// <ul>
  /// <li>
  /// <code>Canonical</code>: Either the canonical user ID for an AWS account or
  /// an origin access identity for an Amazon CloudFront distribution.
  /// </li>
  /// <li>
  /// <code>Email</code>: The registered email address of an AWS account.
  /// </li>
  /// <li>
  /// <code>Group</code>: One of the following predefined Amazon S3 groups:
  /// <code>AllUsers</code>, <code>AuthenticatedUsers</code>, or
  /// <code>LogDelivery</code>.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>Grantee</code>: The AWS user or group that you want to have access to
  /// transcoded files and playlists.
  /// </li>
  /// <li>
  /// <code>Access</code>: The permission that you want to give to the AWS user
  /// that is listed in <code>Grantee</code>. Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>READ</code>: The grantee can read the objects and metadata for objects
  /// that Elastic Transcoder adds to the Amazon S3 bucket.
  /// </li>
  /// <li>
  /// <code>READ_ACP</code>: The grantee can read the object ACL for objects that
  /// Elastic Transcoder adds to the Amazon S3 bucket.
  /// </li>
  /// <li>
  /// <code>WRITE_ACP</code>: The grantee can write the ACL for the objects that
  /// Elastic Transcoder adds to the Amazon S3 bucket.
  /// </li>
  /// <li>
  /// <code>FULL_CONTROL</code>: The grantee has <code>READ</code>,
  /// <code>READ_ACP</code>, and <code>WRITE_ACP</code> permissions for the
  /// objects that Elastic Transcoder adds to the Amazon S3 bucket.
  /// </li>
  /// </ul> </li>
  /// </ul> </li>
  /// <li>
  /// <b>StorageClass</b>: The Amazon S3 storage class, Standard or
  /// ReducedRedundancy, that you want Elastic Transcoder to assign to the video
  /// files and playlists that it stores in your Amazon S3 bucket.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ContentConfig')
  final PipelineOutputConfig contentConfig;

  /// The identifier for the pipeline. You use this value to identify the pipeline
  /// in which you want to perform a variety of operations, such as creating a job
  /// or a preset.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The Amazon S3 bucket from which Elastic Transcoder gets media files for
  /// transcoding and the graphics files, if any, that you want to use for
  /// watermarks.
  @_s.JsonKey(name: 'InputBucket')
  final String inputBucket;

  /// The name of the pipeline. We recommend that the name be unique within the
  /// AWS account, but uniqueness is not enforced.
  ///
  /// Constraints: Maximum 40 characters
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The Amazon Simple Notification Service (Amazon SNS) topic that you want to
  /// notify to report job status.
  /// <important>
  /// To receive notifications, you must also subscribe to the new topic in the
  /// Amazon SNS console.
  /// </important>
  /// <ul>
  /// <li>
  /// <b>Progressing</b> (optional): The Amazon Simple Notification Service
  /// (Amazon SNS) topic that you want to notify when Elastic Transcoder has
  /// started to process the job.
  /// </li>
  /// <li>
  /// <b>Complete</b> (optional): The Amazon SNS topic that you want to notify
  /// when Elastic Transcoder has finished processing the job.
  /// </li>
  /// <li>
  /// <b>Warning</b> (optional): The Amazon SNS topic that you want to notify when
  /// Elastic Transcoder encounters a warning condition.
  /// </li>
  /// <li>
  /// <b>Error</b> (optional): The Amazon SNS topic that you want to notify when
  /// Elastic Transcoder encounters an error condition.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Notifications')
  final Notifications notifications;

  /// The Amazon S3 bucket in which you want Elastic Transcoder to save transcoded
  /// files, thumbnails, and playlists. Either you specify this value, or you
  /// specify both <code>ContentConfig</code> and <code>ThumbnailConfig</code>.
  @_s.JsonKey(name: 'OutputBucket')
  final String outputBucket;

  /// The IAM Amazon Resource Name (ARN) for the role that Elastic Transcoder uses
  /// to transcode jobs for this pipeline.
  @_s.JsonKey(name: 'Role')
  final String role;

  /// The current status of the pipeline:
  ///
  /// <ul>
  /// <li>
  /// <code>Active</code>: The pipeline is processing jobs.
  /// </li>
  /// <li>
  /// <code>Paused</code>: The pipeline is not currently processing jobs.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Status')
  final String status;

  /// Information about the Amazon S3 bucket in which you want Elastic Transcoder
  /// to save thumbnail files. Either you specify both <code>ContentConfig</code>
  /// and <code>ThumbnailConfig</code>, or you specify <code>OutputBucket</code>.
  ///
  /// <ul>
  /// <li>
  /// <code>Bucket</code>: The Amazon S3 bucket in which you want Elastic
  /// Transcoder to save thumbnail files.
  /// </li>
  /// <li>
  /// <code>Permissions</code>: A list of the users and/or predefined Amazon S3
  /// groups you want to have access to thumbnail files, and the type of access
  /// that you want them to have.
  ///
  /// <ul>
  /// <li>
  /// GranteeType: The type of value that appears in the Grantee object:
  ///
  /// <ul>
  /// <li>
  /// <code>Canonical</code>: Either the canonical user ID for an AWS account or
  /// an origin access identity for an Amazon CloudFront distribution.
  /// <important>
  /// A canonical user ID is not the same as an AWS account number.
  /// </important> </li>
  /// <li>
  /// <code>Email</code>: The registered email address of an AWS account.
  /// </li>
  /// <li>
  /// <code>Group</code>: One of the following predefined Amazon S3 groups:
  /// <code>AllUsers</code>, <code>AuthenticatedUsers</code>, or
  /// <code>LogDelivery</code>.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>Grantee</code>: The AWS user or group that you want to have access to
  /// thumbnail files.
  /// </li>
  /// <li>
  /// Access: The permission that you want to give to the AWS user that is listed
  /// in Grantee. Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>READ</code>: The grantee can read the thumbnails and metadata for
  /// thumbnails that Elastic Transcoder adds to the Amazon S3 bucket.
  /// </li>
  /// <li>
  /// <code>READ_ACP</code>: The grantee can read the object ACL for thumbnails
  /// that Elastic Transcoder adds to the Amazon S3 bucket.
  /// </li>
  /// <li>
  /// <code>WRITE_ACP</code>: The grantee can write the ACL for the thumbnails
  /// that Elastic Transcoder adds to the Amazon S3 bucket.
  /// </li>
  /// <li>
  /// <code>FULL_CONTROL</code>: The grantee has READ, READ_ACP, and WRITE_ACP
  /// permissions for the thumbnails that Elastic Transcoder adds to the Amazon S3
  /// bucket.
  /// </li>
  /// </ul> </li>
  /// </ul> </li>
  /// <li>
  /// <code>StorageClass</code>: The Amazon S3 storage class,
  /// <code>Standard</code> or <code>ReducedRedundancy</code>, that you want
  /// Elastic Transcoder to assign to the thumbnails that it stores in your Amazon
  /// S3 bucket.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ThumbnailConfig')
  final PipelineOutputConfig thumbnailConfig;

  Pipeline({
    this.arn,
    this.awsKmsKeyArn,
    this.contentConfig,
    this.id,
    this.inputBucket,
    this.name,
    this.notifications,
    this.outputBucket,
    this.role,
    this.status,
    this.thumbnailConfig,
  });
  factory Pipeline.fromJson(Map<String, dynamic> json) =>
      _$PipelineFromJson(json);
}

/// The <code>PipelineOutputConfig</code> structure.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PipelineOutputConfig {
  /// The Amazon S3 bucket in which you want Elastic Transcoder to save the
  /// transcoded files. Specify this value when all of the following are true:
  ///
  /// <ul>
  /// <li>
  /// You want to save transcoded files, thumbnails (if any), and playlists (if
  /// any) together in one bucket.
  /// </li>
  /// <li>
  /// You do not want to specify the users or groups who have access to the
  /// transcoded files, thumbnails, and playlists.
  /// </li>
  /// <li>
  /// You do not want to specify the permissions that Elastic Transcoder grants to
  /// the files.
  /// </li>
  /// <li>
  /// You want to associate the transcoded files and thumbnails with the Amazon S3
  /// Standard storage class.
  /// </li>
  /// </ul>
  /// If you want to save transcoded files and playlists in one bucket and
  /// thumbnails in another bucket, specify which users can access the transcoded
  /// files or the permissions the users have, or change the Amazon S3 storage
  /// class, omit OutputBucket and specify values for <code>ContentConfig</code>
  /// and <code>ThumbnailConfig</code> instead.
  @_s.JsonKey(name: 'Bucket')
  final String bucket;

  /// Optional. The <code>Permissions</code> object specifies which users and/or
  /// predefined Amazon S3 groups you want to have access to transcoded files and
  /// playlists, and the type of access you want them to have. You can grant
  /// permissions to a maximum of 30 users and/or predefined Amazon S3 groups.
  ///
  /// If you include <code>Permissions</code>, Elastic Transcoder grants only the
  /// permissions that you specify. It does not grant full permissions to the
  /// owner of the role specified by <code>Role</code>. If you want that user to
  /// have full control, you must explicitly grant full control to the user.
  ///
  /// If you omit <code>Permissions</code>, Elastic Transcoder grants full control
  /// over the transcoded files and playlists to the owner of the role specified
  /// by <code>Role</code>, and grants no other permissions to any other user or
  /// group.
  @_s.JsonKey(name: 'Permissions')
  final List<Permission> permissions;

  /// The Amazon S3 storage class, <code>Standard</code> or
  /// <code>ReducedRedundancy</code>, that you want Elastic Transcoder to assign
  /// to the video files and playlists that it stores in your Amazon S3 bucket.
  @_s.JsonKey(name: 'StorageClass')
  final String storageClass;

  PipelineOutputConfig({
    this.bucket,
    this.permissions,
    this.storageClass,
  });
  factory PipelineOutputConfig.fromJson(Map<String, dynamic> json) =>
      _$PipelineOutputConfigFromJson(json);

  Map<String, dynamic> toJson() => _$PipelineOutputConfigToJson(this);
}

/// The PlayReady DRM settings, if any, that you want Elastic Transcoder to
/// apply to the output files associated with this playlist.
///
/// PlayReady DRM encrypts your media files using <code>aes-ctr</code>
/// encryption.
///
/// If you use DRM for an <code>HLSv3</code> playlist, your outputs must have a
/// master playlist.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PlayReadyDrm {
  /// The type of DRM, if any, that you want Elastic Transcoder to apply to the
  /// output files associated with this playlist.
  @_s.JsonKey(name: 'Format')
  final String format;

  /// The series of random bits created by a random bit generator, unique for
  /// every encryption operation, that you want Elastic Transcoder to use to
  /// encrypt your files. The initialization vector must be base64-encoded, and it
  /// must be exactly 8 bytes long before being base64-encoded. If no
  /// initialization vector is provided, Elastic Transcoder generates one for you.
  @_s.JsonKey(name: 'InitializationVector')
  final String initializationVector;

  /// The DRM key for your file, provided by your DRM license provider. The key
  /// must be base64-encoded, and it must be one of the following bit lengths
  /// before being base64-encoded:
  ///
  /// <code>128</code>, <code>192</code>, or <code>256</code>.
  ///
  /// The key must also be encrypted by using AWS KMS.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The ID for your DRM key, so that your DRM license provider knows which key
  /// to provide.
  ///
  /// The key ID must be provided in big endian, and Elastic Transcoder converts
  /// it to little endian before inserting it into the PlayReady DRM headers. If
  /// you are unsure whether your license server provides your key ID in big or
  /// little endian, check with your DRM provider.
  @_s.JsonKey(name: 'KeyId')
  final String keyId;

  /// The MD5 digest of the key used for DRM on your file, and that you want
  /// Elastic Transcoder to use as a checksum to make sure your key was not
  /// corrupted in transit. The key MD5 must be base64-encoded, and it must be
  /// exactly 16 bytes before being base64-encoded.
  @_s.JsonKey(name: 'KeyMd5')
  final String keyMd5;

  /// The location of the license key required to play DRM content. The URL must
  /// be an absolute path, and is referenced by the PlayReady header. The
  /// PlayReady header is referenced in the protection header of the client
  /// manifest for Smooth Streaming outputs, and in the EXT-X-DXDRM and
  /// EXT-XDXDRMINFO metadata tags for HLS playlist outputs. An example URL looks
  /// like this: <code>https://www.example.com/exampleKey/</code>
  @_s.JsonKey(name: 'LicenseAcquisitionUrl')
  final String licenseAcquisitionUrl;

  PlayReadyDrm({
    this.format,
    this.initializationVector,
    this.key,
    this.keyId,
    this.keyMd5,
    this.licenseAcquisitionUrl,
  });
  factory PlayReadyDrm.fromJson(Map<String, dynamic> json) =>
      _$PlayReadyDrmFromJson(json);

  Map<String, dynamic> toJson() => _$PlayReadyDrmToJson(this);
}

/// Use Only for Fragmented MP4 or MPEG-TS Outputs. If you specify a preset for
/// which the value of Container is <code>fmp4</code> (Fragmented MP4) or
/// <code>ts</code> (MPEG-TS), Playlists contains information about the master
/// playlists that you want Elastic Transcoder to create. We recommend that you
/// create only one master playlist per output format. The maximum number of
/// master playlists in a job is 30.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Playlist {
  /// The format of the output playlist. Valid formats include <code>HLSv3</code>,
  /// <code>HLSv4</code>, and <code>Smooth</code>.
  @_s.JsonKey(name: 'Format')
  final String format;

  /// The HLS content protection settings, if any, that you want Elastic
  /// Transcoder to apply to the output files associated with this playlist.
  @_s.JsonKey(name: 'HlsContentProtection')
  final HlsContentProtection hlsContentProtection;

  /// The name that you want Elastic Transcoder to assign to the master playlist,
  /// for example, nyc-vacation.m3u8. If the name includes a <code>/</code>
  /// character, the section of the name before the last <code>/</code> must be
  /// identical for all <code>Name</code> objects. If you create more than one
  /// master playlist, the values of all <code>Name</code> objects must be unique.
  /// <note>
  /// Elastic Transcoder automatically appends the relevant file extension to the
  /// file name (<code>.m3u8</code> for <code>HLSv3</code> and <code>HLSv4</code>
  /// playlists, and <code>.ism</code> and <code>.ismc</code> for
  /// <code>Smooth</code> playlists). If you include a file extension in
  /// <code>Name</code>, the file name will have two extensions.
  /// </note>
  @_s.JsonKey(name: 'Name')
  final String name;

  /// For each output in this job that you want to include in a master playlist,
  /// the value of the Outputs:Key object.
  ///
  /// <ul>
  /// <li>
  /// If your output is not <code>HLS</code> or does not have a segment duration
  /// set, the name of the output file is a concatenation of
  /// <code>OutputKeyPrefix</code> and <code>Outputs:Key</code>:
  ///
  /// OutputKeyPrefix<code>Outputs:Key</code>
  /// </li>
  /// <li>
  /// If your output is <code>HLSv3</code> and has a segment duration set, or is
  /// not included in a playlist, Elastic Transcoder creates an output playlist
  /// file with a file extension of <code>.m3u8</code>, and a series of
  /// <code>.ts</code> files that include a five-digit sequential counter
  /// beginning with 00000:
  ///
  /// OutputKeyPrefix<code>Outputs:Key</code>.m3u8
  ///
  /// OutputKeyPrefix<code>Outputs:Key</code>00000.ts
  /// </li>
  /// <li>
  /// If your output is <code>HLSv4</code>, has a segment duration set, and is
  /// included in an <code>HLSv4</code> playlist, Elastic Transcoder creates an
  /// output playlist file with a file extension of <code>_v4.m3u8</code>. If the
  /// output is video, Elastic Transcoder also creates an output file with an
  /// extension of <code>_iframe.m3u8</code>:
  ///
  /// OutputKeyPrefix<code>Outputs:Key</code>_v4.m3u8
  ///
  /// OutputKeyPrefix<code>Outputs:Key</code>_iframe.m3u8
  ///
  /// OutputKeyPrefix<code>Outputs:Key</code>.ts
  /// </li>
  /// </ul>
  /// Elastic Transcoder automatically appends the relevant file extension to the
  /// file name. If you include a file extension in Output Key, the file name will
  /// have two extensions.
  ///
  /// If you include more than one output in a playlist, any segment duration
  /// settings, clip settings, or caption settings must be the same for all
  /// outputs in the playlist. For <code>Smooth</code> playlists, the
  /// <code>Audio:Profile</code>, <code>Video:Profile</code>, and
  /// <code>Video:FrameRate</code> to <code>Video:KeyframesMaxDist</code> ratio
  /// must be the same for all outputs.
  @_s.JsonKey(name: 'OutputKeys')
  final List<String> outputKeys;

  /// The DRM settings, if any, that you want Elastic Transcoder to apply to the
  /// output files associated with this playlist.
  @_s.JsonKey(name: 'PlayReadyDrm')
  final PlayReadyDrm playReadyDrm;

  /// The status of the job with which the playlist is associated.
  @_s.JsonKey(name: 'Status')
  final String status;

  /// Information that further explains the status.
  @_s.JsonKey(name: 'StatusDetail')
  final String statusDetail;

  Playlist({
    this.format,
    this.hlsContentProtection,
    this.name,
    this.outputKeys,
    this.playReadyDrm,
    this.status,
    this.statusDetail,
  });
  factory Playlist.fromJson(Map<String, dynamic> json) =>
      _$PlaylistFromJson(json);
}

/// Presets are templates that contain most of the settings for transcoding
/// media files from one format to another. Elastic Transcoder includes some
/// default presets for common formats, for example, several iPod and iPhone
/// versions. You can also create your own presets for formats that aren't
/// included among the default presets. You specify which preset you want to use
/// when you create a job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Preset {
  /// The Amazon Resource Name (ARN) for the preset.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// A section of the response body that provides information about the audio
  /// preset values.
  @_s.JsonKey(name: 'Audio')
  final AudioParameters audio;

  /// The container type for the output file. Valid values include
  /// <code>flac</code>, <code>flv</code>, <code>fmp4</code>, <code>gif</code>,
  /// <code>mp3</code>, <code>mp4</code>, <code>mpg</code>, <code>mxf</code>,
  /// <code>oga</code>, <code>ogg</code>, <code>ts</code>, and <code>webm</code>.
  @_s.JsonKey(name: 'Container')
  final String container;

  /// A description of the preset.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// Identifier for the new preset. You use this value to get settings for the
  /// preset or to delete it.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the preset.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// A section of the response body that provides information about the thumbnail
  /// preset values, if any.
  @_s.JsonKey(name: 'Thumbnails')
  final Thumbnails thumbnails;

  /// Whether the preset is a default preset provided by Elastic Transcoder
  /// (<code>System</code>) or a preset that you have defined
  /// (<code>Custom</code>).
  @_s.JsonKey(name: 'Type')
  final String type;

  /// A section of the response body that provides information about the video
  /// preset values.
  @_s.JsonKey(name: 'Video')
  final VideoParameters video;

  Preset({
    this.arn,
    this.audio,
    this.container,
    this.description,
    this.id,
    this.name,
    this.thumbnails,
    this.type,
    this.video,
  });
  factory Preset.fromJson(Map<String, dynamic> json) => _$PresetFromJson(json);
}

/// Settings for the size, location, and opacity of graphics that you want
/// Elastic Transcoder to overlay over videos that are transcoded using this
/// preset. You can specify settings for up to four watermarks. Watermarks
/// appear in the specified size and location, and with the specified opacity
/// for the duration of the transcoded video.
///
/// Watermarks can be in .png or .jpg format. If you want to display a watermark
/// that is not rectangular, use the .png format, which supports transparency.
///
/// When you create a job that uses this preset, you specify the .png or .jpg
/// graphics that you want Elastic Transcoder to include in the transcoded
/// videos. You can specify fewer graphics in the job than you specify watermark
/// settings in the preset, which allows you to use the same preset for up to
/// four watermarks that have different dimensions.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PresetWatermark {
  /// The horizontal position of the watermark unless you specify a non-zero value
  /// for <code>HorizontalOffset</code>:
  ///
  /// <ul>
  /// <li>
  /// <b>Left</b>: The left edge of the watermark is aligned with the left border
  /// of the video.
  /// </li>
  /// <li>
  /// <b>Right</b>: The right edge of the watermark is aligned with the right
  /// border of the video.
  /// </li>
  /// <li>
  /// <b>Center</b>: The watermark is centered between the left and right borders.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'HorizontalAlign')
  final String horizontalAlign;

  /// The amount by which you want the horizontal position of the watermark to be
  /// offset from the position specified by HorizontalAlign:
  ///
  /// <ul>
  /// <li>
  /// number of pixels (px): The minimum value is 0 pixels, and the maximum value
  /// is the value of MaxWidth.
  /// </li>
  /// <li>
  /// integer percentage (%): The range of valid values is 0 to 100.
  /// </li>
  /// </ul>
  /// For example, if you specify Left for <code>HorizontalAlign</code> and 5px
  /// for <code>HorizontalOffset</code>, the left side of the watermark appears 5
  /// pixels from the left border of the output video.
  ///
  /// <code>HorizontalOffset</code> is only valid when the value of
  /// <code>HorizontalAlign</code> is <code>Left</code> or <code>Right</code>. If
  /// you specify an offset that causes the watermark to extend beyond the left or
  /// right border and Elastic Transcoder has not added black bars, the watermark
  /// is cropped. If Elastic Transcoder has added black bars, the watermark
  /// extends into the black bars. If the watermark extends beyond the black bars,
  /// it is cropped.
  ///
  /// Use the value of <code>Target</code> to specify whether you want to include
  /// the black bars that are added by Elastic Transcoder, if any, in the offset
  /// calculation.
  @_s.JsonKey(name: 'HorizontalOffset')
  final String horizontalOffset;

  /// A unique identifier for the settings for one watermark. The value of
  /// <code>Id</code> can be up to 40 characters long.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The maximum height of the watermark in one of the following formats:
  ///
  /// <ul>
  /// <li>
  /// number of pixels (px): The minimum value is 16 pixels, and the maximum value
  /// is the value of <code>MaxHeight</code>.
  /// </li>
  /// <li>
  /// integer percentage (%): The range of valid values is 0 to 100. Use the value
  /// of <code>Target</code> to specify whether you want Elastic Transcoder to
  /// include the black bars that are added by Elastic Transcoder, if any, in the
  /// calculation.
  /// </li>
  /// </ul>
  /// If you specify the value in pixels, it must be less than or equal to the
  /// value of <code>MaxHeight</code>.
  @_s.JsonKey(name: 'MaxHeight')
  final String maxHeight;

  /// The maximum width of the watermark in one of the following formats:
  ///
  /// <ul>
  /// <li>
  /// number of pixels (px): The minimum value is 16 pixels, and the maximum value
  /// is the value of <code>MaxWidth</code>.
  /// </li>
  /// <li>
  /// integer percentage (%): The range of valid values is 0 to 100. Use the value
  /// of <code>Target</code> to specify whether you want Elastic Transcoder to
  /// include the black bars that are added by Elastic Transcoder, if any, in the
  /// calculation.
  ///
  /// If you specify the value in pixels, it must be less than or equal to the
  /// value of <code>MaxWidth</code>.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'MaxWidth')
  final String maxWidth;

  /// A percentage that indicates how much you want a watermark to obscure the
  /// video in the location where it appears. Valid values are 0 (the watermark is
  /// invisible) to 100 (the watermark completely obscures the video in the
  /// specified location). The datatype of <code>Opacity</code> is float.
  ///
  /// Elastic Transcoder supports transparent .png graphics. If you use a
  /// transparent .png, the transparent portion of the video appears as if you had
  /// specified a value of 0 for <code>Opacity</code>. The .jpg file format
  /// doesn't support transparency.
  @_s.JsonKey(name: 'Opacity')
  final String opacity;

  /// A value that controls scaling of the watermark:
  ///
  /// <ul>
  /// <li>
  /// <b>Fit</b>: Elastic Transcoder scales the watermark so it matches the value
  /// that you specified in either <code>MaxWidth</code> or <code>MaxHeight</code>
  /// without exceeding the other value.
  /// </li>
  /// <li>
  /// <b>Stretch</b>: Elastic Transcoder stretches the watermark to match the
  /// values that you specified for <code>MaxWidth</code> and
  /// <code>MaxHeight</code>. If the relative proportions of the watermark and the
  /// values of <code>MaxWidth</code> and <code>MaxHeight</code> are different,
  /// the watermark will be distorted.
  /// </li>
  /// <li>
  /// <b>ShrinkToFit</b>: Elastic Transcoder scales the watermark down so that its
  /// dimensions match the values that you specified for at least one of
  /// <code>MaxWidth</code> and <code>MaxHeight</code> without exceeding either
  /// value. If you specify this option, Elastic Transcoder does not scale the
  /// watermark up.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'SizingPolicy')
  final String sizingPolicy;

  /// A value that determines how Elastic Transcoder interprets values that you
  /// specified for <code>HorizontalOffset</code>, <code>VerticalOffset</code>,
  /// <code>MaxWidth</code>, and <code>MaxHeight</code>:
  ///
  /// <ul>
  /// <li>
  /// <b>Content</b>: <code>HorizontalOffset</code> and
  /// <code>VerticalOffset</code> values are calculated based on the borders of
  /// the video excluding black bars added by Elastic Transcoder, if any. In
  /// addition, <code>MaxWidth</code> and <code>MaxHeight</code>, if specified as
  /// a percentage, are calculated based on the borders of the video excluding
  /// black bars added by Elastic Transcoder, if any.
  /// </li>
  /// <li>
  /// <b>Frame</b>: <code>HorizontalOffset</code> and <code>VerticalOffset</code>
  /// values are calculated based on the borders of the video including black bars
  /// added by Elastic Transcoder, if any. In addition, <code>MaxWidth</code> and
  /// <code>MaxHeight</code>, if specified as a percentage, are calculated based
  /// on the borders of the video including black bars added by Elastic
  /// Transcoder, if any.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Target')
  final String target;

  /// The vertical position of the watermark unless you specify a non-zero value
  /// for <code>VerticalOffset</code>:
  ///
  /// <ul>
  /// <li>
  /// <b>Top</b>: The top edge of the watermark is aligned with the top border of
  /// the video.
  /// </li>
  /// <li>
  /// <b>Bottom</b>: The bottom edge of the watermark is aligned with the bottom
  /// border of the video.
  /// </li>
  /// <li>
  /// <b>Center</b>: The watermark is centered between the top and bottom borders.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'VerticalAlign')
  final String verticalAlign;

  /// <code>VerticalOffset</code>
  ///
  /// The amount by which you want the vertical position of the watermark to be
  /// offset from the position specified by VerticalAlign:
  ///
  /// <ul>
  /// <li>
  /// number of pixels (px): The minimum value is 0 pixels, and the maximum value
  /// is the value of <code>MaxHeight</code>.
  /// </li>
  /// <li>
  /// integer percentage (%): The range of valid values is 0 to 100.
  /// </li>
  /// </ul>
  /// For example, if you specify <code>Top</code> for <code>VerticalAlign</code>
  /// and <code>5px</code> for <code>VerticalOffset</code>, the top of the
  /// watermark appears 5 pixels from the top border of the output video.
  ///
  /// <code>VerticalOffset</code> is only valid when the value of VerticalAlign is
  /// Top or Bottom.
  ///
  /// If you specify an offset that causes the watermark to extend beyond the top
  /// or bottom border and Elastic Transcoder has not added black bars, the
  /// watermark is cropped. If Elastic Transcoder has added black bars, the
  /// watermark extends into the black bars. If the watermark extends beyond the
  /// black bars, it is cropped.
  ///
  /// Use the value of <code>Target</code> to specify whether you want Elastic
  /// Transcoder to include the black bars that are added by Elastic Transcoder,
  /// if any, in the offset calculation.
  @_s.JsonKey(name: 'VerticalOffset')
  final String verticalOffset;

  PresetWatermark({
    this.horizontalAlign,
    this.horizontalOffset,
    this.id,
    this.maxHeight,
    this.maxWidth,
    this.opacity,
    this.sizingPolicy,
    this.target,
    this.verticalAlign,
    this.verticalOffset,
  });
  factory PresetWatermark.fromJson(Map<String, dynamic> json) =>
      _$PresetWatermarkFromJson(json);

  Map<String, dynamic> toJson() => _$PresetWatermarkToJson(this);
}

/// The <code>ReadJobResponse</code> structure.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReadJobResponse {
  /// A section of the response body that provides information about the job.
  @_s.JsonKey(name: 'Job')
  final Job job;

  ReadJobResponse({
    this.job,
  });
  factory ReadJobResponse.fromJson(Map<String, dynamic> json) =>
      _$ReadJobResponseFromJson(json);
}

/// The <code>ReadPipelineResponse</code> structure.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReadPipelineResponse {
  /// A section of the response body that provides information about the pipeline.
  @_s.JsonKey(name: 'Pipeline')
  final Pipeline pipeline;

  /// Elastic Transcoder returns a warning if the resources used by your pipeline
  /// are not in the same region as the pipeline.
  ///
  /// Using resources in the same region, such as your Amazon S3 buckets, Amazon
  /// SNS notification topics, and AWS KMS key, reduces processing time and
  /// prevents cross-regional charges.
  @_s.JsonKey(name: 'Warnings')
  final List<Warning> warnings;

  ReadPipelineResponse({
    this.pipeline,
    this.warnings,
  });
  factory ReadPipelineResponse.fromJson(Map<String, dynamic> json) =>
      _$ReadPipelineResponseFromJson(json);
}

/// The <code>ReadPresetResponse</code> structure.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReadPresetResponse {
  /// A section of the response body that provides information about the preset.
  @_s.JsonKey(name: 'Preset')
  final Preset preset;

  ReadPresetResponse({
    this.preset,
  });
  factory ReadPresetResponse.fromJson(Map<String, dynamic> json) =>
      _$ReadPresetResponseFromJson(json);
}

/// The <code>TestRoleRequest</code> structure.
@deprecated
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TestRoleRequest {
  /// The Amazon S3 bucket that contains media files to be transcoded. The action
  /// attempts to read from this bucket.
  @_s.JsonKey(name: 'InputBucket')
  final String inputBucket;

  /// The Amazon S3 bucket that Elastic Transcoder writes transcoded media files
  /// to. The action attempts to read from this bucket.
  @_s.JsonKey(name: 'OutputBucket')
  final String outputBucket;

  /// The IAM Amazon Resource Name (ARN) for the role that you want Elastic
  /// Transcoder to test.
  @_s.JsonKey(name: 'Role')
  final String role;

  /// The ARNs of one or more Amazon Simple Notification Service (Amazon SNS)
  /// topics that you want the action to send a test notification to.
  @_s.JsonKey(name: 'Topics')
  final List<String> topics;

  TestRoleRequest({
    @_s.required this.inputBucket,
    @_s.required this.outputBucket,
    @_s.required this.role,
    @_s.required this.topics,
  });
  Map<String, dynamic> toJson() => _$TestRoleRequestToJson(this);
}

/// The <code>TestRoleResponse</code> structure.
@deprecated
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TestRoleResponse {
  /// If the <code>Success</code> element contains <code>false</code>, this value
  /// is an array of one or more error messages that were generated during the
  /// test process.
  @_s.JsonKey(name: 'Messages')
  final List<String> messages;

  /// If the operation is successful, this value is <code>true</code>; otherwise,
  /// the value is <code>false</code>.
  @_s.JsonKey(name: 'Success')
  final String success;

  TestRoleResponse({
    this.messages,
    this.success,
  });
  factory TestRoleResponse.fromJson(Map<String, dynamic> json) =>
      _$TestRoleResponseFromJson(json);
}

/// Thumbnails for videos.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Thumbnails {
  /// <important>
  /// To better control resolution and aspect ratio of thumbnails, we recommend
  /// that you use the values <code>MaxWidth</code>, <code>MaxHeight</code>,
  /// <code>SizingPolicy</code>, and <code>PaddingPolicy</code> instead of
  /// <code>Resolution</code> and <code>AspectRatio</code>. The two groups of
  /// settings are mutually exclusive. Do not use them together.
  /// </important>
  /// The aspect ratio of thumbnails. Valid values include:
  ///
  /// <code>auto</code>, <code>1:1</code>, <code>4:3</code>, <code>3:2</code>,
  /// <code>16:9</code>
  ///
  /// If you specify <code>auto</code>, Elastic Transcoder tries to preserve the
  /// aspect ratio of the video in the output file.
  @_s.JsonKey(name: 'AspectRatio')
  final String aspectRatio;

  /// The format of thumbnails, if any. Valid values are <code>jpg</code> and
  /// <code>png</code>.
  ///
  /// You specify whether you want Elastic Transcoder to create thumbnails when
  /// you create a job.
  @_s.JsonKey(name: 'Format')
  final String format;

  /// The approximate number of seconds between thumbnails. Specify an integer
  /// value.
  @_s.JsonKey(name: 'Interval')
  final String interval;

  /// The maximum height of thumbnails in pixels. If you specify auto, Elastic
  /// Transcoder uses 1080 (Full HD) as the default value. If you specify a
  /// numeric value, enter an even integer between 32 and 3072.
  @_s.JsonKey(name: 'MaxHeight')
  final String maxHeight;

  /// The maximum width of thumbnails in pixels. If you specify auto, Elastic
  /// Transcoder uses 1920 (Full HD) as the default value. If you specify a
  /// numeric value, enter an even integer between 32 and 4096.
  @_s.JsonKey(name: 'MaxWidth')
  final String maxWidth;

  /// When you set <code>PaddingPolicy</code> to <code>Pad</code>, Elastic
  /// Transcoder may add black bars to the top and bottom and/or left and right
  /// sides of thumbnails to make the total size of the thumbnails match the
  /// values that you specified for thumbnail <code>MaxWidth</code> and
  /// <code>MaxHeight</code> settings.
  @_s.JsonKey(name: 'PaddingPolicy')
  final String paddingPolicy;

  /// <important>
  /// To better control resolution and aspect ratio of thumbnails, we recommend
  /// that you use the values <code>MaxWidth</code>, <code>MaxHeight</code>,
  /// <code>SizingPolicy</code>, and <code>PaddingPolicy</code> instead of
  /// <code>Resolution</code> and <code>AspectRatio</code>. The two groups of
  /// settings are mutually exclusive. Do not use them together.
  /// </important>
  /// The width and height of thumbnail files in pixels. Specify a value in the
  /// format <code> <i>width</i> </code> x <code> <i>height</i> </code> where both
  /// values are even integers. The values cannot exceed the width and height that
  /// you specified in the <code>Video:Resolution</code> object.
  @_s.JsonKey(name: 'Resolution')
  final String resolution;

  /// Specify one of the following values to control scaling of thumbnails:
  ///
  /// <ul>
  /// <li>
  /// <code>Fit</code>: Elastic Transcoder scales thumbnails so they match the
  /// value that you specified in thumbnail MaxWidth or MaxHeight settings without
  /// exceeding the other value.
  /// </li>
  /// <li>
  /// <code>Fill</code>: Elastic Transcoder scales thumbnails so they match the
  /// value that you specified in thumbnail <code>MaxWidth</code> or
  /// <code>MaxHeight</code> settings and matches or exceeds the other value.
  /// Elastic Transcoder centers the image in thumbnails and then crops in the
  /// dimension (if any) that exceeds the maximum value.
  /// </li>
  /// <li>
  /// <code>Stretch</code>: Elastic Transcoder stretches thumbnails to match the
  /// values that you specified for thumbnail <code>MaxWidth</code> and
  /// <code>MaxHeight</code> settings. If the relative proportions of the input
  /// video and thumbnails are different, the thumbnails will be distorted.
  /// </li>
  /// <li>
  /// <code>Keep</code>: Elastic Transcoder does not scale thumbnails. If either
  /// dimension of the input video exceeds the values that you specified for
  /// thumbnail <code>MaxWidth</code> and <code>MaxHeight</code> settings, Elastic
  /// Transcoder crops the thumbnails.
  /// </li>
  /// <li>
  /// <code>ShrinkToFit</code>: Elastic Transcoder scales thumbnails down so that
  /// their dimensions match the values that you specified for at least one of
  /// thumbnail <code>MaxWidth</code> and <code>MaxHeight</code> without exceeding
  /// either value. If you specify this option, Elastic Transcoder does not scale
  /// thumbnails up.
  /// </li>
  /// <li>
  /// <code>ShrinkToFill</code>: Elastic Transcoder scales thumbnails down so that
  /// their dimensions match the values that you specified for at least one of
  /// <code>MaxWidth</code> and <code>MaxHeight</code> without dropping below
  /// either value. If you specify this option, Elastic Transcoder does not scale
  /// thumbnails up.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'SizingPolicy')
  final String sizingPolicy;

  Thumbnails({
    this.aspectRatio,
    this.format,
    this.interval,
    this.maxHeight,
    this.maxWidth,
    this.paddingPolicy,
    this.resolution,
    this.sizingPolicy,
  });
  factory Thumbnails.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailsFromJson(json);

  Map<String, dynamic> toJson() => _$ThumbnailsToJson(this);
}

/// Settings that determine when a clip begins and how long it lasts.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TimeSpan {
  /// The duration of the clip. The format can be either HH:mm:ss.SSS (maximum
  /// value: 23:59:59.999; SSS is thousandths of a second) or sssss.SSS (maximum
  /// value: 86399.999). If you don't specify a value, Elastic Transcoder creates
  /// an output file from StartTime to the end of the file.
  ///
  /// If you specify a value longer than the duration of the input file, Elastic
  /// Transcoder transcodes the file and returns a warning message.
  @_s.JsonKey(name: 'Duration')
  final String duration;

  /// The place in the input file where you want a clip to start. The format can
  /// be either HH:mm:ss.SSS (maximum value: 23:59:59.999; SSS is thousandths of a
  /// second) or sssss.SSS (maximum value: 86399.999). If you don't specify a
  /// value, Elastic Transcoder starts at the beginning of the input file.
  @_s.JsonKey(name: 'StartTime')
  final String startTime;

  TimeSpan({
    this.duration,
    this.startTime,
  });
  factory TimeSpan.fromJson(Map<String, dynamic> json) =>
      _$TimeSpanFromJson(json);

  Map<String, dynamic> toJson() => _$TimeSpanToJson(this);
}

/// Details about the timing of a job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Timing {
  /// The time the job finished transcoding, in epoch milliseconds.
  @_s.JsonKey(name: 'FinishTimeMillis')
  final int finishTimeMillis;

  /// The time the job began transcoding, in epoch milliseconds.
  @_s.JsonKey(name: 'StartTimeMillis')
  final int startTimeMillis;

  /// The time the job was submitted to Elastic Transcoder, in epoch milliseconds.
  @_s.JsonKey(name: 'SubmitTimeMillis')
  final int submitTimeMillis;

  Timing({
    this.finishTimeMillis,
    this.startTimeMillis,
    this.submitTimeMillis,
  });
  factory Timing.fromJson(Map<String, dynamic> json) => _$TimingFromJson(json);
}

/// The <code>UpdatePipelineNotificationsRequest</code> structure.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdatePipelineNotificationsRequest {
  /// The identifier of the pipeline for which you want to change notification
  /// settings.
  @_s.JsonKey(name: 'Id', ignore: true)
  final String id;

  /// The topic ARN for the Amazon Simple Notification Service (Amazon SNS) topic
  /// that you want to notify to report job status.
  /// <important>
  /// To receive notifications, you must also subscribe to the new topic in the
  /// Amazon SNS console.
  /// </important>
  /// <ul>
  /// <li>
  /// <b>Progressing</b>: The topic ARN for the Amazon Simple Notification Service
  /// (Amazon SNS) topic that you want to notify when Elastic Transcoder has
  /// started to process jobs that are added to this pipeline. This is the ARN
  /// that Amazon SNS returned when you created the topic.
  /// </li>
  /// <li>
  /// <b>Complete</b>: The topic ARN for the Amazon SNS topic that you want to
  /// notify when Elastic Transcoder has finished processing a job. This is the
  /// ARN that Amazon SNS returned when you created the topic.
  /// </li>
  /// <li>
  /// <b>Warning</b>: The topic ARN for the Amazon SNS topic that you want to
  /// notify when Elastic Transcoder encounters a warning condition. This is the
  /// ARN that Amazon SNS returned when you created the topic.
  /// </li>
  /// <li>
  /// <b>Error</b>: The topic ARN for the Amazon SNS topic that you want to notify
  /// when Elastic Transcoder encounters an error condition. This is the ARN that
  /// Amazon SNS returned when you created the topic.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Notifications')
  final Notifications notifications;

  UpdatePipelineNotificationsRequest({
    @_s.required this.id,
    @_s.required this.notifications,
  });
  Map<String, dynamic> toJson() =>
      _$UpdatePipelineNotificationsRequestToJson(this);
}

/// The <code>UpdatePipelineNotificationsResponse</code> structure.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdatePipelineNotificationsResponse {
  /// A section of the response body that provides information about the pipeline
  /// associated with this notification.
  @_s.JsonKey(name: 'Pipeline')
  final Pipeline pipeline;

  UpdatePipelineNotificationsResponse({
    this.pipeline,
  });
  factory UpdatePipelineNotificationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdatePipelineNotificationsResponseFromJson(json);
}

/// The <code>UpdatePipelineRequest</code> structure.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdatePipelineRequest {
  /// The ID of the pipeline that you want to update.
  @_s.JsonKey(name: 'Id', ignore: true)
  final String id;

  /// The AWS Key Management Service (AWS KMS) key that you want to use with this
  /// pipeline.
  ///
  /// If you use either <code>s3</code> or <code>s3-aws-kms</code> as your
  /// <code>Encryption:Mode</code>, you don't need to provide a key with your job
  /// because a default key, known as an AWS-KMS key, is created for you
  /// automatically. You need to provide an AWS-KMS key only if you want to use a
  /// non-default AWS-KMS key, or if you are using an <code>Encryption:Mode</code>
  /// of <code>aes-cbc-pkcs7</code>, <code>aes-ctr</code>, or
  /// <code>aes-gcm</code>.
  @_s.JsonKey(name: 'AwsKmsKeyArn')
  final String awsKmsKeyArn;

  /// The optional <code>ContentConfig</code> object specifies information about
  /// the Amazon S3 bucket in which you want Elastic Transcoder to save transcoded
  /// files and playlists: which bucket to use, which users you want to have
  /// access to the files, the type of access you want users to have, and the
  /// storage class that you want to assign to the files.
  ///
  /// If you specify values for <code>ContentConfig</code>, you must also specify
  /// values for <code>ThumbnailConfig</code>.
  ///
  /// If you specify values for <code>ContentConfig</code> and
  /// <code>ThumbnailConfig</code>, omit the <code>OutputBucket</code> object.
  ///
  /// <ul>
  /// <li>
  /// <b>Bucket</b>: The Amazon S3 bucket in which you want Elastic Transcoder to
  /// save transcoded files and playlists.
  /// </li>
  /// <li>
  /// <b>Permissions</b> (Optional): The Permissions object specifies which users
  /// you want to have access to transcoded files and the type of access you want
  /// them to have. You can grant permissions to a maximum of 30 users and/or
  /// predefined Amazon S3 groups.
  /// </li>
  /// <li>
  /// <b>Grantee Type</b>: Specify the type of value that appears in the
  /// <code>Grantee</code> object:
  ///
  /// <ul>
  /// <li>
  /// <b>Canonical</b>: The value in the <code>Grantee</code> object is either the
  /// canonical user ID for an AWS account or an origin access identity for an
  /// Amazon CloudFront distribution. For more information about canonical user
  /// IDs, see Access Control List (ACL) Overview in the Amazon Simple Storage
  /// Service Developer Guide. For more information about using CloudFront origin
  /// access identities to require that users use CloudFront URLs instead of
  /// Amazon S3 URLs, see Using an Origin Access Identity to Restrict Access to
  /// Your Amazon S3 Content.
  /// <important>
  /// A canonical user ID is not the same as an AWS account number.
  /// </important> </li>
  /// <li>
  /// <b>Email</b>: The value in the <code>Grantee</code> object is the registered
  /// email address of an AWS account.
  /// </li>
  /// <li>
  /// <b>Group</b>: The value in the <code>Grantee</code> object is one of the
  /// following predefined Amazon S3 groups: <code>AllUsers</code>,
  /// <code>AuthenticatedUsers</code>, or <code>LogDelivery</code>.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b>Grantee</b>: The AWS user or group that you want to have access to
  /// transcoded files and playlists. To identify the user or group, you can
  /// specify the canonical user ID for an AWS account, an origin access identity
  /// for a CloudFront distribution, the registered email address of an AWS
  /// account, or a predefined Amazon S3 group
  /// </li>
  /// <li>
  /// <b>Access</b>: The permission that you want to give to the AWS user that you
  /// specified in <code>Grantee</code>. Permissions are granted on the files that
  /// Elastic Transcoder adds to the bucket, including playlists and video files.
  /// Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>READ</code>: The grantee can read the objects and metadata for objects
  /// that Elastic Transcoder adds to the Amazon S3 bucket.
  /// </li>
  /// <li>
  /// <code>READ_ACP</code>: The grantee can read the object ACL for objects that
  /// Elastic Transcoder adds to the Amazon S3 bucket.
  /// </li>
  /// <li>
  /// <code>WRITE_ACP</code>: The grantee can write the ACL for the objects that
  /// Elastic Transcoder adds to the Amazon S3 bucket.
  /// </li>
  /// <li>
  /// <code>FULL_CONTROL</code>: The grantee has <code>READ</code>,
  /// <code>READ_ACP</code>, and <code>WRITE_ACP</code> permissions for the
  /// objects that Elastic Transcoder adds to the Amazon S3 bucket.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b>StorageClass</b>: The Amazon S3 storage class, <code>Standard</code> or
  /// <code>ReducedRedundancy</code>, that you want Elastic Transcoder to assign
  /// to the video files and playlists that it stores in your Amazon S3 bucket.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ContentConfig')
  final PipelineOutputConfig contentConfig;

  /// The Amazon S3 bucket in which you saved the media files that you want to
  /// transcode and the graphics that you want to use as watermarks.
  @_s.JsonKey(name: 'InputBucket')
  final String inputBucket;

  /// The name of the pipeline. We recommend that the name be unique within the
  /// AWS account, but uniqueness is not enforced.
  ///
  /// Constraints: Maximum 40 characters
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The topic ARN for the Amazon Simple Notification Service (Amazon SNS) topic
  /// that you want to notify to report job status.
  /// <important>
  /// To receive notifications, you must also subscribe to the new topic in the
  /// Amazon SNS console.
  /// </important>
  /// <ul>
  /// <li>
  /// <b>Progressing</b>: The topic ARN for the Amazon Simple Notification Service
  /// (Amazon SNS) topic that you want to notify when Elastic Transcoder has
  /// started to process jobs that are added to this pipeline. This is the ARN
  /// that Amazon SNS returned when you created the topic.
  /// </li>
  /// <li>
  /// <b>Complete</b>: The topic ARN for the Amazon SNS topic that you want to
  /// notify when Elastic Transcoder has finished processing a job. This is the
  /// ARN that Amazon SNS returned when you created the topic.
  /// </li>
  /// <li>
  /// <b>Warning</b>: The topic ARN for the Amazon SNS topic that you want to
  /// notify when Elastic Transcoder encounters a warning condition. This is the
  /// ARN that Amazon SNS returned when you created the topic.
  /// </li>
  /// <li>
  /// <b>Error</b>: The topic ARN for the Amazon SNS topic that you want to notify
  /// when Elastic Transcoder encounters an error condition. This is the ARN that
  /// Amazon SNS returned when you created the topic.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Notifications')
  final Notifications notifications;

  /// The IAM Amazon Resource Name (ARN) for the role that you want Elastic
  /// Transcoder to use to transcode jobs for this pipeline.
  @_s.JsonKey(name: 'Role')
  final String role;

  /// The <code>ThumbnailConfig</code> object specifies several values, including
  /// the Amazon S3 bucket in which you want Elastic Transcoder to save thumbnail
  /// files, which users you want to have access to the files, the type of access
  /// you want users to have, and the storage class that you want to assign to the
  /// files.
  ///
  /// If you specify values for <code>ContentConfig</code>, you must also specify
  /// values for <code>ThumbnailConfig</code> even if you don't want to create
  /// thumbnails.
  ///
  /// If you specify values for <code>ContentConfig</code> and
  /// <code>ThumbnailConfig</code>, omit the <code>OutputBucket</code> object.
  ///
  /// <ul>
  /// <li>
  /// <b>Bucket</b>: The Amazon S3 bucket in which you want Elastic Transcoder to
  /// save thumbnail files.
  /// </li>
  /// <li>
  /// <b>Permissions</b> (Optional): The <code>Permissions</code> object specifies
  /// which users and/or predefined Amazon S3 groups you want to have access to
  /// thumbnail files, and the type of access you want them to have. You can grant
  /// permissions to a maximum of 30 users and/or predefined Amazon S3 groups.
  /// </li>
  /// <li>
  /// <b>GranteeType</b>: Specify the type of value that appears in the Grantee
  /// object:
  ///
  /// <ul>
  /// <li>
  /// <b>Canonical</b>: The value in the <code>Grantee</code> object is either the
  /// canonical user ID for an AWS account or an origin access identity for an
  /// Amazon CloudFront distribution.
  /// <important>
  /// A canonical user ID is not the same as an AWS account number.
  /// </important> </li>
  /// <li>
  /// <b>Email</b>: The value in the <code>Grantee</code> object is the registered
  /// email address of an AWS account.
  /// </li>
  /// <li>
  /// <b>Group</b>: The value in the <code>Grantee</code> object is one of the
  /// following predefined Amazon S3 groups: <code>AllUsers</code>,
  /// <code>AuthenticatedUsers</code>, or <code>LogDelivery</code>.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b>Grantee</b>: The AWS user or group that you want to have access to
  /// thumbnail files. To identify the user or group, you can specify the
  /// canonical user ID for an AWS account, an origin access identity for a
  /// CloudFront distribution, the registered email address of an AWS account, or
  /// a predefined Amazon S3 group.
  /// </li>
  /// <li>
  /// <b>Access</b>: The permission that you want to give to the AWS user that you
  /// specified in <code>Grantee</code>. Permissions are granted on the thumbnail
  /// files that Elastic Transcoder adds to the bucket. Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>READ</code>: The grantee can read the thumbnails and metadata for
  /// objects that Elastic Transcoder adds to the Amazon S3 bucket.
  /// </li>
  /// <li>
  /// <code>READ_ACP</code>: The grantee can read the object ACL for thumbnails
  /// that Elastic Transcoder adds to the Amazon S3 bucket.
  /// </li>
  /// <li>
  /// <code>WRITE_ACP</code>: The grantee can write the ACL for the thumbnails
  /// that Elastic Transcoder adds to the Amazon S3 bucket.
  /// </li>
  /// <li>
  /// <code>FULL_CONTROL</code>: The grantee has <code>READ</code>,
  /// <code>READ_ACP</code>, and <code>WRITE_ACP</code> permissions for the
  /// thumbnails that Elastic Transcoder adds to the Amazon S3 bucket.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b>StorageClass</b>: The Amazon S3 storage class, <code>Standard</code> or
  /// <code>ReducedRedundancy</code>, that you want Elastic Transcoder to assign
  /// to the thumbnails that it stores in your Amazon S3 bucket.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ThumbnailConfig')
  final PipelineOutputConfig thumbnailConfig;

  UpdatePipelineRequest({
    @_s.required this.id,
    this.awsKmsKeyArn,
    this.contentConfig,
    this.inputBucket,
    this.name,
    this.notifications,
    this.role,
    this.thumbnailConfig,
  });
  Map<String, dynamic> toJson() => _$UpdatePipelineRequestToJson(this);
}

/// When you update a pipeline, Elastic Transcoder returns the values that you
/// specified in the request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdatePipelineResponse {
  /// The pipeline updated by this <code>UpdatePipelineResponse</code> call.
  @_s.JsonKey(name: 'Pipeline')
  final Pipeline pipeline;

  /// Elastic Transcoder returns a warning if the resources used by your pipeline
  /// are not in the same region as the pipeline.
  ///
  /// Using resources in the same region, such as your Amazon S3 buckets, Amazon
  /// SNS notification topics, and AWS KMS key, reduces processing time and
  /// prevents cross-regional charges.
  @_s.JsonKey(name: 'Warnings')
  final List<Warning> warnings;

  UpdatePipelineResponse({
    this.pipeline,
    this.warnings,
  });
  factory UpdatePipelineResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdatePipelineResponseFromJson(json);
}

/// The <code>UpdatePipelineStatusRequest</code> structure.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdatePipelineStatusRequest {
  /// The identifier of the pipeline to update.
  @_s.JsonKey(name: 'Id', ignore: true)
  final String id;

  /// The desired status of the pipeline:
  ///
  /// <ul>
  /// <li>
  /// <code>Active</code>: The pipeline is processing jobs.
  /// </li>
  /// <li>
  /// <code>Paused</code>: The pipeline is not currently processing jobs.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Status')
  final String status;

  UpdatePipelineStatusRequest({
    @_s.required this.id,
    @_s.required this.status,
  });
  Map<String, dynamic> toJson() => _$UpdatePipelineStatusRequestToJson(this);
}

/// When you update status for a pipeline, Elastic Transcoder returns the values
/// that you specified in the request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdatePipelineStatusResponse {
  /// A section of the response body that provides information about the pipeline.
  @_s.JsonKey(name: 'Pipeline')
  final Pipeline pipeline;

  UpdatePipelineStatusResponse({
    this.pipeline,
  });
  factory UpdatePipelineStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdatePipelineStatusResponseFromJson(json);
}

/// The <code>VideoParameters</code> structure.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VideoParameters {
  /// <important>
  /// To better control resolution and aspect ratio of output videos, we recommend
  /// that you use the values <code>MaxWidth</code>, <code>MaxHeight</code>,
  /// <code>SizingPolicy</code>, <code>PaddingPolicy</code>, and
  /// <code>DisplayAspectRatio</code> instead of <code>Resolution</code> and
  /// <code>AspectRatio</code>. The two groups of settings are mutually exclusive.
  /// Do not use them together.
  /// </important>
  /// The display aspect ratio of the video in the output file. Valid values
  /// include:
  ///
  /// <code>auto</code>, <code>1:1</code>, <code>4:3</code>, <code>3:2</code>,
  /// <code>16:9</code>
  ///
  /// If you specify <code>auto</code>, Elastic Transcoder tries to preserve the
  /// aspect ratio of the input file.
  ///
  /// If you specify an aspect ratio for the output file that differs from aspect
  /// ratio of the input file, Elastic Transcoder adds pillarboxing (black bars on
  /// the sides) or letterboxing (black bars on the top and bottom) to maintain
  /// the aspect ratio of the active region of the video.
  @_s.JsonKey(name: 'AspectRatio')
  final String aspectRatio;

  /// The bit rate of the video stream in the output file, in kilobits/second.
  /// Valid values depend on the values of <code>Level</code> and
  /// <code>Profile</code>. If you specify <code>auto</code>, Elastic Transcoder
  /// uses the detected bit rate of the input source. If you specify a value other
  /// than <code>auto</code>, we recommend that you specify a value less than or
  /// equal to the maximum H.264-compliant value listed for your level and
  /// profile:
  ///
  /// <i>Level - Maximum video bit rate in kilobits/second (baseline and main
  /// Profile) : maximum video bit rate in kilobits/second (high Profile)</i>
  ///
  /// <ul>
  /// <li>
  /// 1 - 64 : 80
  /// </li>
  /// <li>
  /// 1b - 128 : 160
  /// </li>
  /// <li>
  /// 1.1 - 192 : 240
  /// </li>
  /// <li>
  /// 1.2 - 384 : 480
  /// </li>
  /// <li>
  /// 1.3 - 768 : 960
  /// </li>
  /// <li>
  /// 2 - 2000 : 2500
  /// </li>
  /// <li>
  /// 3 - 10000 : 12500
  /// </li>
  /// <li>
  /// 3.1 - 14000 : 17500
  /// </li>
  /// <li>
  /// 3.2 - 20000 : 25000
  /// </li>
  /// <li>
  /// 4 - 20000 : 25000
  /// </li>
  /// <li>
  /// 4.1 - 50000 : 62500
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'BitRate')
  final String bitRate;

  /// The video codec for the output file. Valid values include <code>gif</code>,
  /// <code>H.264</code>, <code>mpeg2</code>, <code>vp8</code>, and
  /// <code>vp9</code>. You can only specify <code>vp8</code> and <code>vp9</code>
  /// when the container type is <code>webm</code>, <code>gif</code> when the
  /// container type is <code>gif</code>, and <code>mpeg2</code> when the
  /// container type is <code>mpg</code>.
  @_s.JsonKey(name: 'Codec')
  final String codec;

  /// <b>Profile (H.264/VP8/VP9 Only)</b>
  ///
  /// The H.264 profile that you want to use for the output file. Elastic
  /// Transcoder supports the following profiles:
  ///
  /// <ul>
  /// <li>
  /// <code>baseline</code>: The profile most commonly used for videoconferencing
  /// and for mobile applications.
  /// </li>
  /// <li>
  /// <code>main</code>: The profile used for standard-definition digital TV
  /// broadcasts.
  /// </li>
  /// <li>
  /// <code>high</code>: The profile used for high-definition digital TV
  /// broadcasts and for Blu-ray discs.
  /// </li>
  /// </ul>
  /// <b>Level (H.264 Only)</b>
  ///
  /// The H.264 level that you want to use for the output file. Elastic Transcoder
  /// supports the following levels:
  ///
  /// <code>1</code>, <code>1b</code>, <code>1.1</code>, <code>1.2</code>,
  /// <code>1.3</code>, <code>2</code>, <code>2.1</code>, <code>2.2</code>,
  /// <code>3</code>, <code>3.1</code>, <code>3.2</code>, <code>4</code>,
  /// <code>4.1</code>
  ///
  /// <b>MaxReferenceFrames (H.264 Only)</b>
  ///
  /// Applicable only when the value of Video:Codec is H.264. The maximum number
  /// of previously decoded frames to use as a reference for decoding future
  /// frames. Valid values are integers 0 through 16, but we recommend that you
  /// not use a value greater than the following:
  ///
  /// <code>Min(Floor(Maximum decoded picture buffer in macroblocks * 256 / (Width
  /// in pixels * Height in pixels)), 16)</code>
  ///
  /// where <i>Width in pixels</i> and <i>Height in pixels</i> represent either
  /// MaxWidth and MaxHeight, or Resolution. <i>Maximum decoded picture buffer in
  /// macroblocks</i> depends on the value of the <code>Level</code> object. See
  /// the list below. (A macroblock is a block of pixels measuring 16x16.)
  ///
  /// <ul>
  /// <li>
  /// 1 - 396
  /// </li>
  /// <li>
  /// 1b - 396
  /// </li>
  /// <li>
  /// 1.1 - 900
  /// </li>
  /// <li>
  /// 1.2 - 2376
  /// </li>
  /// <li>
  /// 1.3 - 2376
  /// </li>
  /// <li>
  /// 2 - 2376
  /// </li>
  /// <li>
  /// 2.1 - 4752
  /// </li>
  /// <li>
  /// 2.2 - 8100
  /// </li>
  /// <li>
  /// 3 - 8100
  /// </li>
  /// <li>
  /// 3.1 - 18000
  /// </li>
  /// <li>
  /// 3.2 - 20480
  /// </li>
  /// <li>
  /// 4 - 32768
  /// </li>
  /// <li>
  /// 4.1 - 32768
  /// </li>
  /// </ul>
  /// <b>MaxBitRate (Optional, H.264/MPEG2/VP8/VP9 only)</b>
  ///
  /// The maximum number of bits per second in a video buffer; the size of the
  /// buffer is specified by <code>BufferSize</code>. Specify a value between 16
  /// and 62,500. You can reduce the bandwidth required to stream a video by
  /// reducing the maximum bit rate, but this also reduces the quality of the
  /// video.
  ///
  /// <b>BufferSize (Optional, H.264/MPEG2/VP8/VP9 only)</b>
  ///
  /// The maximum number of bits in any x seconds of the output video. This window
  /// is commonly 10 seconds, the standard segment duration when you're using FMP4
  /// or MPEG-TS for the container type of the output video. Specify an integer
  /// greater than 0. If you specify <code>MaxBitRate</code> and omit
  /// <code>BufferSize</code>, Elastic Transcoder sets <code>BufferSize</code> to
  /// 10 times the value of <code>MaxBitRate</code>.
  ///
  /// <b>InterlacedMode (Optional, H.264/MPEG2 Only)</b>
  ///
  /// The interlace mode for the output video.
  ///
  /// Interlaced video is used to double the perceived frame rate for a video by
  /// interlacing two fields (one field on every other line, the other field on
  /// the other lines) so that the human eye registers multiple pictures per
  /// frame. Interlacing reduces the bandwidth required for transmitting a video,
  /// but can result in blurred images and flickering.
  ///
  /// Valid values include <code>Progressive</code> (no interlacing, top to
  /// bottom), <code>TopFirst</code> (top field first), <code>BottomFirst</code>
  /// (bottom field first), and <code>Auto</code>.
  ///
  /// If <code>InterlaceMode</code> is not specified, Elastic Transcoder uses
  /// <code>Progressive</code> for the output. If <code>Auto</code> is specified,
  /// Elastic Transcoder interlaces the output.
  ///
  /// <b>ColorSpaceConversionMode (Optional, H.264/MPEG2 Only)</b>
  ///
  /// The color space conversion Elastic Transcoder applies to the output video.
  /// Color spaces are the algorithms used by the computer to store information
  /// about how to render color. <code>Bt.601</code> is the standard for standard
  /// definition video, while <code>Bt.709</code> is the standard for high
  /// definition video.
  ///
  /// Valid values include <code>None</code>, <code>Bt709toBt601</code>,
  /// <code>Bt601toBt709</code>, and <code>Auto</code>.
  ///
  /// If you chose <code>Auto</code> for <code>ColorSpaceConversionMode</code> and
  /// your output is interlaced, your frame rate is one of <code>23.97</code>,
  /// <code>24</code>, <code>25</code>, <code>29.97</code>, <code>50</code>, or
  /// <code>60</code>, your <code>SegmentDuration</code> is null, and you are
  /// using one of the resolution changes from the list below, Elastic Transcoder
  /// applies the following color space conversions:
  ///
  /// <ul>
  /// <li>
  /// <i>Standard to HD, 720x480 to 1920x1080</i> - Elastic Transcoder applies
  /// <code>Bt601ToBt709</code>
  /// </li>
  /// <li>
  /// <i>Standard to HD, 720x576 to 1920x1080</i> - Elastic Transcoder applies
  /// <code>Bt601ToBt709</code>
  /// </li>
  /// <li>
  /// <i>HD to Standard, 1920x1080 to 720x480</i> - Elastic Transcoder applies
  /// <code>Bt709ToBt601</code>
  /// </li>
  /// <li>
  /// <i>HD to Standard, 1920x1080 to 720x576</i> - Elastic Transcoder applies
  /// <code>Bt709ToBt601</code>
  /// </li>
  /// </ul> <note>
  /// Elastic Transcoder may change the behavior of the
  /// <code>ColorspaceConversionMode</code> <code>Auto</code> mode in the future.
  /// All outputs in a playlist must use the same
  /// <code>ColorSpaceConversionMode</code>.
  /// </note>
  /// If you do not specify a <code>ColorSpaceConversionMode</code>, Elastic
  /// Transcoder does not change the color space of a file. If you are unsure what
  /// <code>ColorSpaceConversionMode</code> was applied to your output file, you
  /// can check the <code>AppliedColorSpaceConversion</code> parameter included in
  /// your job response. If your job does not have an
  /// <code>AppliedColorSpaceConversion</code> in its response, no
  /// <code>ColorSpaceConversionMode</code> was applied.
  ///
  /// <b>ChromaSubsampling</b>
  ///
  /// The sampling pattern for the chroma (color) channels of the output video.
  /// Valid values include <code>yuv420p</code> and <code>yuv422p</code>.
  ///
  /// <code>yuv420p</code> samples the chroma information of every other
  /// horizontal and every other vertical line, <code>yuv422p</code> samples the
  /// color information of every horizontal line and every other vertical line.
  ///
  /// <b>LoopCount (Gif Only)</b>
  ///
  /// The number of times you want the output gif to loop. Valid values include
  /// <code>Infinite</code> and integers between <code>0</code> and
  /// <code>100</code>, inclusive.
  @_s.JsonKey(name: 'CodecOptions')
  final Map<String, String> codecOptions;

  /// The value that Elastic Transcoder adds to the metadata in the output file.
  @_s.JsonKey(name: 'DisplayAspectRatio')
  final String displayAspectRatio;

  /// Applicable only when the value of Video:Codec is one of <code>H.264</code>,
  /// <code>MPEG2</code>, or <code>VP8</code>.
  ///
  /// Whether to use a fixed value for <code>FixedGOP</code>. Valid values are
  /// <code>true</code> and <code>false</code>:
  ///
  /// <ul>
  /// <li>
  /// <code>true</code>: Elastic Transcoder uses the value of
  /// <code>KeyframesMaxDist</code> for the distance between key frames (the
  /// number of frames in a group of pictures, or GOP).
  /// </li>
  /// <li>
  /// <code>false</code>: The distance between key frames can vary.
  /// </li>
  /// </ul> <important>
  /// <code>FixedGOP</code> must be set to <code>true</code> for <code>fmp4</code>
  /// containers.
  /// </important>
  @_s.JsonKey(name: 'FixedGOP')
  final String fixedGOP;

  /// The frames per second for the video stream in the output file. Valid values
  /// include:
  ///
  /// <code>auto</code>, <code>10</code>, <code>15</code>, <code>23.97</code>,
  /// <code>24</code>, <code>25</code>, <code>29.97</code>, <code>30</code>,
  /// <code>60</code>
  ///
  /// If you specify <code>auto</code>, Elastic Transcoder uses the detected frame
  /// rate of the input source. If you specify a frame rate, we recommend that you
  /// perform the following calculation:
  ///
  /// <code>Frame rate = maximum recommended decoding speed in luma samples/second
  /// / (width in pixels * height in pixels)</code>
  ///
  /// where:
  ///
  /// <ul>
  /// <li>
  /// <i>width in pixels</i> and <i>height in pixels</i> represent the Resolution
  /// of the output video.
  /// </li>
  /// <li>
  /// <i>maximum recommended decoding speed in Luma samples/second</i> is less
  /// than or equal to the maximum value listed in the following table, based on
  /// the value that you specified for Level.
  /// </li>
  /// </ul>
  /// The maximum recommended decoding speed in Luma samples/second for each level
  /// is described in the following list (<i>Level - Decoding speed</i>):
  ///
  /// <ul>
  /// <li>
  /// 1 - 380160
  /// </li>
  /// <li>
  /// 1b - 380160
  /// </li>
  /// <li>
  /// 1.1 - 76800
  /// </li>
  /// <li>
  /// 1.2 - 1536000
  /// </li>
  /// <li>
  /// 1.3 - 3041280
  /// </li>
  /// <li>
  /// 2 - 3041280
  /// </li>
  /// <li>
  /// 2.1 - 5068800
  /// </li>
  /// <li>
  /// 2.2 - 5184000
  /// </li>
  /// <li>
  /// 3 - 10368000
  /// </li>
  /// <li>
  /// 3.1 - 27648000
  /// </li>
  /// <li>
  /// 3.2 - 55296000
  /// </li>
  /// <li>
  /// 4 - 62914560
  /// </li>
  /// <li>
  /// 4.1 - 62914560
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'FrameRate')
  final String frameRate;

  /// Applicable only when the value of Video:Codec is one of <code>H.264</code>,
  /// <code>MPEG2</code>, or <code>VP8</code>.
  ///
  /// The maximum number of frames between key frames. Key frames are fully
  /// encoded frames; the frames between key frames are encoded based, in part, on
  /// the content of the key frames. The value is an integer formatted as a
  /// string; valid values are between 1 (every frame is a key frame) and 100000,
  /// inclusive. A higher value results in higher compression but may also
  /// discernibly decrease video quality.
  ///
  /// For <code>Smooth</code> outputs, the <code>FrameRate</code> must have a
  /// constant ratio to the <code>KeyframesMaxDist</code>. This allows
  /// <code>Smooth</code> playlists to switch between different quality levels
  /// while the file is being played.
  ///
  /// For example, an input file can have a <code>FrameRate</code> of 30 with a
  /// <code>KeyframesMaxDist</code> of 90. The output file then needs to have a
  /// ratio of 1:3. Valid outputs would have <code>FrameRate</code> of 30, 25, and
  /// 10, and <code>KeyframesMaxDist</code> of 90, 75, and 30, respectively.
  ///
  /// Alternately, this can be achieved by setting <code>FrameRate</code> to auto
  /// and having the same values for <code>MaxFrameRate</code> and
  /// <code>KeyframesMaxDist</code>.
  @_s.JsonKey(name: 'KeyframesMaxDist')
  final String keyframesMaxDist;

  /// If you specify <code>auto</code> for <code>FrameRate</code>, Elastic
  /// Transcoder uses the frame rate of the input video for the frame rate of the
  /// output video. Specify the maximum frame rate that you want Elastic
  /// Transcoder to use when the frame rate of the input video is greater than the
  /// desired maximum frame rate of the output video. Valid values include:
  /// <code>10</code>, <code>15</code>, <code>23.97</code>, <code>24</code>,
  /// <code>25</code>, <code>29.97</code>, <code>30</code>, <code>60</code>.
  @_s.JsonKey(name: 'MaxFrameRate')
  final String maxFrameRate;

  /// The maximum height of the output video in pixels. If you specify
  /// <code>auto</code>, Elastic Transcoder uses 1080 (Full HD) as the default
  /// value. If you specify a numeric value, enter an even integer between 96 and
  /// 3072.
  @_s.JsonKey(name: 'MaxHeight')
  final String maxHeight;

  /// The maximum width of the output video in pixels. If you specify
  /// <code>auto</code>, Elastic Transcoder uses 1920 (Full HD) as the default
  /// value. If you specify a numeric value, enter an even integer between 128 and
  /// 4096.
  @_s.JsonKey(name: 'MaxWidth')
  final String maxWidth;

  /// When you set <code>PaddingPolicy</code> to <code>Pad</code>, Elastic
  /// Transcoder may add black bars to the top and bottom and/or left and right
  /// sides of the output video to make the total size of the output video match
  /// the values that you specified for <code>MaxWidth</code> and
  /// <code>MaxHeight</code>.
  @_s.JsonKey(name: 'PaddingPolicy')
  final String paddingPolicy;

  /// <important>
  /// To better control resolution and aspect ratio of output videos, we recommend
  /// that you use the values <code>MaxWidth</code>, <code>MaxHeight</code>,
  /// <code>SizingPolicy</code>, <code>PaddingPolicy</code>, and
  /// <code>DisplayAspectRatio</code> instead of <code>Resolution</code> and
  /// <code>AspectRatio</code>. The two groups of settings are mutually exclusive.
  /// Do not use them together.
  /// </important>
  /// The width and height of the video in the output file, in pixels. Valid
  /// values are <code>auto</code> and <i>width</i> x <i>height</i>:
  ///
  /// <ul>
  /// <li>
  /// <code>auto</code>: Elastic Transcoder attempts to preserve the width and
  /// height of the input file, subject to the following rules.
  /// </li>
  /// <li>
  /// <code> <i>width</i> x <i>height</i> </code>: The width and height of the
  /// output video in pixels.
  /// </li>
  /// </ul>
  /// Note the following about specifying the width and height:
  ///
  /// <ul>
  /// <li>
  /// The width must be an even integer between 128 and 4096, inclusive.
  /// </li>
  /// <li>
  /// The height must be an even integer between 96 and 3072, inclusive.
  /// </li>
  /// <li>
  /// If you specify a resolution that is less than the resolution of the input
  /// file, Elastic Transcoder rescales the output file to the lower resolution.
  /// </li>
  /// <li>
  /// If you specify a resolution that is greater than the resolution of the input
  /// file, Elastic Transcoder rescales the output to the higher resolution.
  /// </li>
  /// <li>
  /// We recommend that you specify a resolution for which the product of width
  /// and height is less than or equal to the applicable value in the following
  /// list (<i>List - Max width x height value</i>):
  ///
  /// <ul>
  /// <li>
  /// 1 - 25344
  /// </li>
  /// <li>
  /// 1b - 25344
  /// </li>
  /// <li>
  /// 1.1 - 101376
  /// </li>
  /// <li>
  /// 1.2 - 101376
  /// </li>
  /// <li>
  /// 1.3 - 101376
  /// </li>
  /// <li>
  /// 2 - 101376
  /// </li>
  /// <li>
  /// 2.1 - 202752
  /// </li>
  /// <li>
  /// 2.2 - 404720
  /// </li>
  /// <li>
  /// 3 - 404720
  /// </li>
  /// <li>
  /// 3.1 - 921600
  /// </li>
  /// <li>
  /// 3.2 - 1310720
  /// </li>
  /// <li>
  /// 4 - 2097152
  /// </li>
  /// <li>
  /// 4.1 - 2097152
  /// </li>
  /// </ul> </li>
  /// </ul>
  @_s.JsonKey(name: 'Resolution')
  final String resolution;

  /// Specify one of the following values to control scaling of the output video:
  ///
  /// <ul>
  /// <li>
  /// <code>Fit</code>: Elastic Transcoder scales the output video so it matches
  /// the value that you specified in either <code>MaxWidth</code> or
  /// <code>MaxHeight</code> without exceeding the other value.
  /// </li>
  /// <li>
  /// <code>Fill</code>: Elastic Transcoder scales the output video so it matches
  /// the value that you specified in either <code>MaxWidth</code> or
  /// <code>MaxHeight</code> and matches or exceeds the other value. Elastic
  /// Transcoder centers the output video and then crops it in the dimension (if
  /// any) that exceeds the maximum value.
  /// </li>
  /// <li>
  /// <code>Stretch</code>: Elastic Transcoder stretches the output video to match
  /// the values that you specified for <code>MaxWidth</code> and
  /// <code>MaxHeight</code>. If the relative proportions of the input video and
  /// the output video are different, the output video will be distorted.
  /// </li>
  /// <li>
  /// <code>Keep</code>: Elastic Transcoder does not scale the output video. If
  /// either dimension of the input video exceeds the values that you specified
  /// for <code>MaxWidth</code> and <code>MaxHeight</code>, Elastic Transcoder
  /// crops the output video.
  /// </li>
  /// <li>
  /// <code>ShrinkToFit</code>: Elastic Transcoder scales the output video down so
  /// that its dimensions match the values that you specified for at least one of
  /// <code>MaxWidth</code> and <code>MaxHeight</code> without exceeding either
  /// value. If you specify this option, Elastic Transcoder does not scale the
  /// video up.
  /// </li>
  /// <li>
  /// <code>ShrinkToFill</code>: Elastic Transcoder scales the output video down
  /// so that its dimensions match the values that you specified for at least one
  /// of <code>MaxWidth</code> and <code>MaxHeight</code> without dropping below
  /// either value. If you specify this option, Elastic Transcoder does not scale
  /// the video up.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'SizingPolicy')
  final String sizingPolicy;

  /// Settings for the size, location, and opacity of graphics that you want
  /// Elastic Transcoder to overlay over videos that are transcoded using this
  /// preset. You can specify settings for up to four watermarks. Watermarks
  /// appear in the specified size and location, and with the specified opacity
  /// for the duration of the transcoded video.
  ///
  /// Watermarks can be in .png or .jpg format. If you want to display a watermark
  /// that is not rectangular, use the .png format, which supports transparency.
  ///
  /// When you create a job that uses this preset, you specify the .png or .jpg
  /// graphics that you want Elastic Transcoder to include in the transcoded
  /// videos. You can specify fewer graphics in the job than you specify watermark
  /// settings in the preset, which allows you to use the same preset for up to
  /// four watermarks that have different dimensions.
  @_s.JsonKey(name: 'Watermarks')
  final List<PresetWatermark> watermarks;

  VideoParameters({
    this.aspectRatio,
    this.bitRate,
    this.codec,
    this.codecOptions,
    this.displayAspectRatio,
    this.fixedGOP,
    this.frameRate,
    this.keyframesMaxDist,
    this.maxFrameRate,
    this.maxHeight,
    this.maxWidth,
    this.paddingPolicy,
    this.resolution,
    this.sizingPolicy,
    this.watermarks,
  });
  factory VideoParameters.fromJson(Map<String, dynamic> json) =>
      _$VideoParametersFromJson(json);

  Map<String, dynamic> toJson() => _$VideoParametersToJson(this);
}

/// Elastic Transcoder returns a warning if the resources used by your pipeline
/// are not in the same region as the pipeline.
///
/// Using resources in the same region, such as your Amazon S3 buckets, Amazon
/// SNS notification topics, and AWS KMS key, reduces processing time and
/// prevents cross-regional charges.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Warning {
  /// The code of the cross-regional warning.
  @_s.JsonKey(name: 'Code')
  final String code;

  /// The message explaining what resources are in a different region from the
  /// pipeline.
  /// <note>
  /// AWS KMS keys must be in the same region as the pipeline.
  /// </note>
  @_s.JsonKey(name: 'Message')
  final String message;

  Warning({
    this.code,
    this.message,
  });
  factory Warning.fromJson(Map<String, dynamic> json) =>
      _$WarningFromJson(json);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class IncompatibleVersionException extends _s.GenericAwsException {
  IncompatibleVersionException({String type, String message})
      : super(
            type: type, code: 'IncompatibleVersionException', message: message);
}

class InternalServiceException extends _s.GenericAwsException {
  InternalServiceException({String type, String message})
      : super(type: type, code: 'InternalServiceException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String type, String message})
      : super(type: type, code: 'ResourceInUseException', message: message);
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
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'IncompatibleVersionException': (type, message) =>
      IncompatibleVersionException(type: type, message: message),
  'InternalServiceException': (type, message) =>
      InternalServiceException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'ResourceInUseException': (type, message) =>
      ResourceInUseException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
