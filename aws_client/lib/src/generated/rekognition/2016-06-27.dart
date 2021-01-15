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
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        timeStampFromJson,
        RfcDateTimeConverter,
        IsoDateTimeConverter,
        UnixDateTimeConverter,
        StringJsonConverter,
        Base64JsonConverter;

export '../../shared/shared.dart' show AwsClientCredentials;

part '2016-06-27.g.dart';

/// This is the Amazon Rekognition API reference.
class Rekognition {
  final _s.JsonProtocol _protocol;
  Rekognition({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'rekognition',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Compares a face in the <i>source</i> input image with each of the 100
  /// largest faces detected in the <i>target</i> input image.
  /// <note>
  /// If the source image contains multiple faces, the service detects the
  /// largest face and compares it with each face detected in the target image.
  /// </note>
  /// You pass the input and target images either as base64-encoded image bytes
  /// or as references to images in an Amazon S3 bucket. If you use the AWS CLI
  /// to call Amazon Rekognition operations, passing image bytes isn't
  /// supported. The image must be formatted as a PNG or JPEG file.
  ///
  /// In response, the operation returns an array of face matches ordered by
  /// similarity score in descending order. For each face match, the response
  /// provides a bounding box of the face, facial landmarks, pose details
  /// (pitch, role, and yaw), quality (brightness and sharpness), and confidence
  /// value (indicating the level of confidence that the bounding box contains a
  /// face). The response also provides a similarity score, which indicates how
  /// closely the faces match.
  /// <note>
  /// By default, only faces with a similarity score of greater than or equal to
  /// 80% are returned in the response. You can change this value by specifying
  /// the <code>SimilarityThreshold</code> parameter.
  /// </note>
  /// <code>CompareFaces</code> also returns an array of faces that don't match
  /// the source image. For each face, it returns a bounding box, confidence
  /// value, landmarks, pose details, and quality. The response also returns
  /// information about the face in the source image, including the bounding box
  /// of the face and confidence value.
  ///
  /// The <code>QualityFilter</code> input parameter allows you to filter out
  /// detected faces that don’t meet a required quality bar. The quality bar is
  /// based on a variety of common use cases. Use <code>QualityFilter</code> to
  /// set the quality bar by specifying <code>LOW</code>, <code>MEDIUM</code>,
  /// or <code>HIGH</code>. If you do not want to filter detected faces, specify
  /// <code>NONE</code>. The default value is <code>NONE</code>.
  ///
  /// If the image doesn't contain Exif metadata, <code>CompareFaces</code>
  /// returns orientation information for the source and target images. Use
  /// these values to display the images with the correct image orientation.
  ///
  /// If no faces are detected in the source or target images,
  /// <code>CompareFaces</code> returns an
  /// <code>InvalidParameterException</code> error.
  /// <note>
  /// This is a stateless API operation. That is, data returned by this
  /// operation doesn't persist.
  /// </note>
  /// For an example, see Comparing Faces in Images in the Amazon Rekognition
  /// Developer Guide.
  ///
  /// This operation requires permissions to perform the
  /// <code>rekognition:CompareFaces</code> action.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidS3ObjectException].
  /// May throw [ImageTooLargeException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [InvalidImageFormatException].
  ///
  /// Parameter [sourceImage] :
  /// The input image as base64-encoded bytes or an S3 object. If you use the
  /// AWS CLI to call Amazon Rekognition operations, passing base64-encoded
  /// image bytes is not supported.
  ///
  /// If you are using an AWS SDK to call Amazon Rekognition, you might not need
  /// to base64-encode image bytes passed using the <code>Bytes</code> field.
  /// For more information, see Images in the Amazon Rekognition developer
  /// guide.
  ///
  /// Parameter [targetImage] :
  /// The target image as base64-encoded bytes or an S3 object. If you use the
  /// AWS CLI to call Amazon Rekognition operations, passing base64-encoded
  /// image bytes is not supported.
  ///
  /// If you are using an AWS SDK to call Amazon Rekognition, you might not need
  /// to base64-encode image bytes passed using the <code>Bytes</code> field.
  /// For more information, see Images in the Amazon Rekognition developer
  /// guide.
  ///
  /// Parameter [qualityFilter] :
  /// A filter that specifies a quality bar for how much filtering is done to
  /// identify faces. Filtered faces aren't compared. If you specify
  /// <code>AUTO</code>, Amazon Rekognition chooses the quality bar. If you
  /// specify <code>LOW</code>, <code>MEDIUM</code>, or <code>HIGH</code>,
  /// filtering removes all faces that don’t meet the chosen quality bar. The
  /// quality bar is based on a variety of common use cases. Low-quality
  /// detections can occur for a number of reasons. Some examples are an object
  /// that's misidentified as a face, a face that's too blurry, or a face with a
  /// pose that's too extreme to use. If you specify <code>NONE</code>, no
  /// filtering is performed. The default value is <code>NONE</code>.
  ///
  /// To use quality filtering, the collection you are using must be associated
  /// with version 3 of the face model or higher.
  ///
  /// Parameter [similarityThreshold] :
  /// The minimum level of confidence in the face matches that a match must meet
  /// to be included in the <code>FaceMatches</code> array.
  Future<CompareFacesResponse> compareFaces({
    @_s.required Image sourceImage,
    @_s.required Image targetImage,
    QualityFilter qualityFilter,
    double similarityThreshold,
  }) async {
    ArgumentError.checkNotNull(sourceImage, 'sourceImage');
    ArgumentError.checkNotNull(targetImage, 'targetImage');
    _s.validateNumRange(
      'similarityThreshold',
      similarityThreshold,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.CompareFaces'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SourceImage': sourceImage,
        'TargetImage': targetImage,
        if (qualityFilter != null) 'QualityFilter': qualityFilter.toValue(),
        if (similarityThreshold != null)
          'SimilarityThreshold': similarityThreshold,
      },
    );

    return CompareFacesResponse.fromJson(jsonResponse.body);
  }

  /// Creates a collection in an AWS Region. You can add faces to the collection
  /// using the <a>IndexFaces</a> operation.
  ///
  /// For example, you might create collections, one for each of your
  /// application users. A user can then index faces using the
  /// <code>IndexFaces</code> operation and persist results in a specific
  /// collection. Then, a user can search the collection for faces in the
  /// user-specific container.
  ///
  /// When you create a collection, it is associated with the latest version of
  /// the face model version.
  /// <note>
  /// Collection names are case-sensitive.
  /// </note>
  /// This operation requires permissions to perform the
  /// <code>rekognition:CreateCollection</code> action.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [ResourceAlreadyExistsException].
  ///
  /// Parameter [collectionId] :
  /// ID for the collection that you are creating.
  Future<CreateCollectionResponse> createCollection({
    @_s.required String collectionId,
  }) async {
    ArgumentError.checkNotNull(collectionId, 'collectionId');
    _s.validateStringLength(
      'collectionId',
      collectionId,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'collectionId',
      collectionId,
      r'''[a-zA-Z0-9_.\-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.CreateCollection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CollectionId': collectionId,
      },
    );

    return CreateCollectionResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new Amazon Rekognition Custom Labels project. A project is a
  /// logical grouping of resources (images, Labels, models) and operations
  /// (training, evaluation and detection).
  ///
  /// This operation requires permissions to perform the
  /// <code>rekognition:CreateProject</code> action.
  ///
  /// May throw [ResourceInUseException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidParameterException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [ProvisionedThroughputExceededException].
  ///
  /// Parameter [projectName] :
  /// The name of the project to create.
  Future<CreateProjectResponse> createProject({
    @_s.required String projectName,
  }) async {
    ArgumentError.checkNotNull(projectName, 'projectName');
    _s.validateStringLength(
      'projectName',
      projectName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'projectName',
      projectName,
      r'''[a-zA-Z0-9_.\-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.CreateProject'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProjectName': projectName,
      },
    );

    return CreateProjectResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new version of a model and begins training. Models are managed
  /// as part of an Amazon Rekognition Custom Labels project. You can specify
  /// one training dataset and one testing dataset. The response from
  /// <code>CreateProjectVersion</code> is an Amazon Resource Name (ARN) for the
  /// version of the model.
  ///
  /// Training takes a while to complete. You can get the current status by
  /// calling <a>DescribeProjectVersions</a>.
  ///
  /// Once training has successfully completed, call
  /// <a>DescribeProjectVersions</a> to get the training results and evaluate
  /// the model.
  ///
  /// After evaluating the model, you start the model by calling
  /// <a>StartProjectVersion</a>.
  ///
  /// This operation requires permissions to perform the
  /// <code>rekognition:CreateProjectVersion</code> action.
  ///
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidParameterException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [ProvisionedThroughputExceededException].
  ///
  /// Parameter [outputConfig] :
  /// The Amazon S3 location to store the results of training.
  ///
  /// Parameter [projectArn] :
  /// The ARN of the Amazon Rekognition Custom Labels project that manages the
  /// model that you want to train.
  ///
  /// Parameter [testingData] :
  /// The dataset to use for testing.
  ///
  /// Parameter [trainingData] :
  /// The dataset to use for training.
  ///
  /// Parameter [versionName] :
  /// A name for the version of the model. This value must be unique.
  Future<CreateProjectVersionResponse> createProjectVersion({
    @_s.required OutputConfig outputConfig,
    @_s.required String projectArn,
    @_s.required TestingData testingData,
    @_s.required TrainingData trainingData,
    @_s.required String versionName,
  }) async {
    ArgumentError.checkNotNull(outputConfig, 'outputConfig');
    ArgumentError.checkNotNull(projectArn, 'projectArn');
    _s.validateStringLength(
      'projectArn',
      projectArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'projectArn',
      projectArn,
      r'''(^arn:[a-z\d-]+:rekognition:[a-z\d-]+:\d{12}:project\/[a-zA-Z0-9_.\-]{1,255}\/[0-9]+$)''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(testingData, 'testingData');
    ArgumentError.checkNotNull(trainingData, 'trainingData');
    ArgumentError.checkNotNull(versionName, 'versionName');
    _s.validateStringLength(
      'versionName',
      versionName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'versionName',
      versionName,
      r'''[a-zA-Z0-9_.\-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.CreateProjectVersion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OutputConfig': outputConfig,
        'ProjectArn': projectArn,
        'TestingData': testingData,
        'TrainingData': trainingData,
        'VersionName': versionName,
      },
    );

    return CreateProjectVersionResponse.fromJson(jsonResponse.body);
  }

  /// Creates an Amazon Rekognition stream processor that you can use to detect
  /// and recognize faces in a streaming video.
  ///
  /// Amazon Rekognition Video is a consumer of live video from Amazon Kinesis
  /// Video Streams. Amazon Rekognition Video sends analysis results to Amazon
  /// Kinesis Data Streams.
  ///
  /// You provide as input a Kinesis video stream (<code>Input</code>) and a
  /// Kinesis data stream (<code>Output</code>) stream. You also specify the
  /// face recognition criteria in <code>Settings</code>. For example, the
  /// collection containing faces that you want to recognize. Use
  /// <code>Name</code> to assign an identifier for the stream processor. You
  /// use <code>Name</code> to manage the stream processor. For example, you can
  /// start processing the source video by calling <a>StartStreamProcessor</a>
  /// with the <code>Name</code> field.
  ///
  /// After you have finished analyzing a streaming video, use
  /// <a>StopStreamProcessor</a> to stop processing. You can delete the stream
  /// processor by calling <a>DeleteStreamProcessor</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [InvalidParameterException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceInUseException].
  /// May throw [ProvisionedThroughputExceededException].
  ///
  /// Parameter [input] :
  /// Kinesis video stream stream that provides the source streaming video. If
  /// you are using the AWS CLI, the parameter name is
  /// <code>StreamProcessorInput</code>.
  ///
  /// Parameter [name] :
  /// An identifier you assign to the stream processor. You can use
  /// <code>Name</code> to manage the stream processor. For example, you can get
  /// the current status of the stream processor by calling
  /// <a>DescribeStreamProcessor</a>. <code>Name</code> is idempotent.
  ///
  /// Parameter [output] :
  /// Kinesis data stream stream to which Amazon Rekognition Video puts the
  /// analysis results. If you are using the AWS CLI, the parameter name is
  /// <code>StreamProcessorOutput</code>.
  ///
  /// Parameter [roleArn] :
  /// ARN of the IAM role that allows access to the stream processor.
  ///
  /// Parameter [settings] :
  /// Face recognition input parameters to be used by the stream processor.
  /// Includes the collection to use for face recognition and the face
  /// attributes to detect.
  Future<CreateStreamProcessorResponse> createStreamProcessor({
    @_s.required StreamProcessorInput input,
    @_s.required String name,
    @_s.required StreamProcessorOutput output,
    @_s.required String roleArn,
    @_s.required StreamProcessorSettings settings,
  }) async {
    ArgumentError.checkNotNull(input, 'input');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[a-zA-Z0-9_.\-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(output, 'output');
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringPattern(
      'roleArn',
      roleArn,
      r'''arn:aws:iam::\d{12}:role/?[a-zA-Z_0-9+=,.@\-_/]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(settings, 'settings');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.CreateStreamProcessor'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Input': input,
        'Name': name,
        'Output': output,
        'RoleArn': roleArn,
        'Settings': settings,
      },
    );

    return CreateStreamProcessorResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the specified collection. Note that this operation removes all
  /// faces in the collection. For an example, see
  /// <a>delete-collection-procedure</a>.
  ///
  /// This operation requires permissions to perform the
  /// <code>rekognition:DeleteCollection</code> action.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [collectionId] :
  /// ID of the collection to delete.
  Future<DeleteCollectionResponse> deleteCollection({
    @_s.required String collectionId,
  }) async {
    ArgumentError.checkNotNull(collectionId, 'collectionId');
    _s.validateStringLength(
      'collectionId',
      collectionId,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'collectionId',
      collectionId,
      r'''[a-zA-Z0-9_.\-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.DeleteCollection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CollectionId': collectionId,
      },
    );

    return DeleteCollectionResponse.fromJson(jsonResponse.body);
  }

  /// Deletes faces from a collection. You specify a collection ID and an array
  /// of face IDs to remove from the collection.
  ///
  /// This operation requires permissions to perform the
  /// <code>rekognition:DeleteFaces</code> action.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [collectionId] :
  /// Collection from which to remove the specific faces.
  ///
  /// Parameter [faceIds] :
  /// An array of face IDs to delete.
  Future<DeleteFacesResponse> deleteFaces({
    @_s.required String collectionId,
    @_s.required List<String> faceIds,
  }) async {
    ArgumentError.checkNotNull(collectionId, 'collectionId');
    _s.validateStringLength(
      'collectionId',
      collectionId,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'collectionId',
      collectionId,
      r'''[a-zA-Z0-9_.\-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(faceIds, 'faceIds');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.DeleteFaces'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CollectionId': collectionId,
        'FaceIds': faceIds,
      },
    );

    return DeleteFacesResponse.fromJson(jsonResponse.body);
  }

  /// Deletes an Amazon Rekognition Custom Labels project. To delete a project
  /// you must first delete all models associated with the project. To delete a
  /// model, see <a>DeleteProjectVersion</a>.
  ///
  /// This operation requires permissions to perform the
  /// <code>rekognition:DeleteProject</code> action.
  ///
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [ProvisionedThroughputExceededException].
  ///
  /// Parameter [projectArn] :
  /// The Amazon Resource Name (ARN) of the project that you want to delete.
  Future<DeleteProjectResponse> deleteProject({
    @_s.required String projectArn,
  }) async {
    ArgumentError.checkNotNull(projectArn, 'projectArn');
    _s.validateStringLength(
      'projectArn',
      projectArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'projectArn',
      projectArn,
      r'''(^arn:[a-z\d-]+:rekognition:[a-z\d-]+:\d{12}:project\/[a-zA-Z0-9_.\-]{1,255}\/[0-9]+$)''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.DeleteProject'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProjectArn': projectArn,
      },
    );

    return DeleteProjectResponse.fromJson(jsonResponse.body);
  }

  /// Deletes an Amazon Rekognition Custom Labels model.
  ///
  /// You can't delete a model if it is running or if it is training. To check
  /// the status of a model, use the <code>Status</code> field returned from
  /// <a>DescribeProjectVersions</a>. To stop a running model call
  /// <a>StopProjectVersion</a>. If the model is training, wait until it
  /// finishes.
  ///
  /// This operation requires permissions to perform the
  /// <code>rekognition:DeleteProjectVersion</code> action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidParameterException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [ProvisionedThroughputExceededException].
  ///
  /// Parameter [projectVersionArn] :
  /// The Amazon Resource Name (ARN) of the model version that you want to
  /// delete.
  Future<DeleteProjectVersionResponse> deleteProjectVersion({
    @_s.required String projectVersionArn,
  }) async {
    ArgumentError.checkNotNull(projectVersionArn, 'projectVersionArn');
    _s.validateStringLength(
      'projectVersionArn',
      projectVersionArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'projectVersionArn',
      projectVersionArn,
      r'''(^arn:[a-z\d-]+:rekognition:[a-z\d-]+:\d{12}:project\/[a-zA-Z0-9_.\-]{1,255}\/version\/[a-zA-Z0-9_.\-]{1,255}\/[0-9]+$)''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.DeleteProjectVersion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProjectVersionArn': projectVersionArn,
      },
    );

    return DeleteProjectVersionResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the stream processor identified by <code>Name</code>. You assign
  /// the value for <code>Name</code> when you create the stream processor with
  /// <a>CreateStreamProcessor</a>. You might not be able to use the same name
  /// for a stream processor for a few seconds after calling
  /// <code>DeleteStreamProcessor</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [ProvisionedThroughputExceededException].
  ///
  /// Parameter [name] :
  /// The name of the stream processor you want to delete.
  Future<void> deleteStreamProcessor({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[a-zA-Z0-9_.\-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.DeleteStreamProcessor'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
      },
    );

    return DeleteStreamProcessorResponse.fromJson(jsonResponse.body);
  }

  /// Describes the specified collection. You can use
  /// <code>DescribeCollection</code> to get information, such as the number of
  /// faces indexed into a collection and the version of the model used by the
  /// collection for face detection.
  ///
  /// For more information, see Describing a Collection in the Amazon
  /// Rekognition Developer Guide.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [collectionId] :
  /// The ID of the collection to describe.
  Future<DescribeCollectionResponse> describeCollection({
    @_s.required String collectionId,
  }) async {
    ArgumentError.checkNotNull(collectionId, 'collectionId');
    _s.validateStringLength(
      'collectionId',
      collectionId,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'collectionId',
      collectionId,
      r'''[a-zA-Z0-9_.\-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.DescribeCollection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CollectionId': collectionId,
      },
    );

    return DescribeCollectionResponse.fromJson(jsonResponse.body);
  }

  /// Lists and describes the models in an Amazon Rekognition Custom Labels
  /// project. You can specify up to 10 model versions in
  /// <code>ProjectVersionArns</code>. If you don't specify a value,
  /// descriptions for all models are returned.
  ///
  /// This operation requires permissions to perform the
  /// <code>rekognition:DescribeProjectVersions</code> action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [InvalidParameterException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [ProvisionedThroughputExceededException].
  ///
  /// Parameter [projectArn] :
  /// The Amazon Resource Name (ARN) of the project that contains the models you
  /// want to describe.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per paginated call. The largest
  /// value you can specify is 100. If you specify a value greater than 100, a
  /// ValidationException error occurs. The default value is 100.
  ///
  /// Parameter [nextToken] :
  /// If the previous response was incomplete (because there is more results to
  /// retrieve), Amazon Rekognition Custom Labels returns a pagination token in
  /// the response. You can use this pagination token to retrieve the next set
  /// of results.
  ///
  /// Parameter [versionNames] :
  /// A list of model version names that you want to describe. You can add up to
  /// 10 model version names to the list. If you don't specify a value, all
  /// model descriptions are returned. A version name is part of a model
  /// (ProjectVersion) ARN. For example,
  /// <code>my-model.2020-01-21T09.10.15</code> is the version name in the
  /// following ARN.
  /// <code>arn:aws:rekognition:us-east-1:123456789012:project/getting-started/version/<i>my-model.2020-01-21T09.10.15</i>/1234567890123</code>.
  Future<DescribeProjectVersionsResponse> describeProjectVersions({
    @_s.required String projectArn,
    int maxResults,
    String nextToken,
    List<String> versionNames,
  }) async {
    ArgumentError.checkNotNull(projectArn, 'projectArn');
    _s.validateStringLength(
      'projectArn',
      projectArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'projectArn',
      projectArn,
      r'''(^arn:[a-z\d-]+:rekognition:[a-z\d-]+:\d{12}:project\/[a-zA-Z0-9_.\-]{1,255}\/[0-9]+$)''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.DescribeProjectVersions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProjectArn': projectArn,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (versionNames != null) 'VersionNames': versionNames,
      },
    );

    return DescribeProjectVersionsResponse.fromJson(jsonResponse.body);
  }

  /// Lists and gets information about your Amazon Rekognition Custom Labels
  /// projects.
  ///
  /// This operation requires permissions to perform the
  /// <code>rekognition:DescribeProjects</code> action.
  ///
  /// May throw [InvalidPaginationTokenException].
  /// May throw [InvalidParameterException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [ProvisionedThroughputExceededException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per paginated call. The largest
  /// value you can specify is 100. If you specify a value greater than 100, a
  /// ValidationException error occurs. The default value is 100.
  ///
  /// Parameter [nextToken] :
  /// If the previous response was incomplete (because there is more results to
  /// retrieve), Amazon Rekognition Custom Labels returns a pagination token in
  /// the response. You can use this pagination token to retrieve the next set
  /// of results.
  Future<DescribeProjectsResponse> describeProjects({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.DescribeProjects'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeProjectsResponse.fromJson(jsonResponse.body);
  }

  /// Provides information about a stream processor created by
  /// <a>CreateStreamProcessor</a>. You can get information about the input and
  /// output streams, the input parameters for the face recognition being
  /// performed, and the current status of the stream processor.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ProvisionedThroughputExceededException].
  ///
  /// Parameter [name] :
  /// Name of the stream processor for which you want information.
  Future<DescribeStreamProcessorResponse> describeStreamProcessor({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[a-zA-Z0-9_.\-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.DescribeStreamProcessor'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
      },
    );

    return DescribeStreamProcessorResponse.fromJson(jsonResponse.body);
  }

  /// Detects custom labels in a supplied image by using an Amazon Rekognition
  /// Custom Labels model.
  ///
  /// You specify which version of a model version to use by using the
  /// <code>ProjectVersionArn</code> input parameter.
  ///
  /// You pass the input image as base64-encoded image bytes or as a reference
  /// to an image in an Amazon S3 bucket. If you use the AWS CLI to call Amazon
  /// Rekognition operations, passing image bytes is not supported. The image
  /// must be either a PNG or JPEG formatted file.
  ///
  /// For each object that the model version detects on an image, the API
  /// returns a (<code>CustomLabel</code>) object in an array
  /// (<code>CustomLabels</code>). Each <code>CustomLabel</code> object provides
  /// the label name (<code>Name</code>), the level of confidence that the image
  /// contains the object (<code>Confidence</code>), and object location
  /// information, if it exists, for the label on the image
  /// (<code>Geometry</code>).
  ///
  /// During training model calculates a threshold value that determines if a
  /// prediction for a label is true. By default,
  /// <code>DetectCustomLabels</code> doesn't return labels whose confidence
  /// value is below the model's calculated threshold value. To filter labels
  /// that are returned, specify a value for <code>MinConfidence</code> that is
  /// higher than the model's calculated threshold. You can get the model's
  /// calculated threshold from the model's training results shown in the Amazon
  /// Rekognition Custom Labels console. To get all labels, regardless of
  /// confidence, specify a <code>MinConfidence</code> value of 0.
  ///
  /// You can also add the <code>MaxResults</code> parameter to limit the number
  /// of labels returned.
  ///
  /// This is a stateless API operation. That is, the operation does not persist
  /// any data.
  ///
  /// This operation requires permissions to perform the
  /// <code>rekognition:DetectCustomLabels</code> action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceNotReadyException].
  /// May throw [InvalidS3ObjectException].
  /// May throw [InvalidParameterException].
  /// May throw [ImageTooLargeException].
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [InvalidImageFormatException].
  ///
  /// Parameter [projectVersionArn] :
  /// The ARN of the model version that you want to use.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results you want the service to return in the response.
  /// The service returns the specified number of highest confidence labels
  /// ranked from highest confidence to lowest.
  ///
  /// Parameter [minConfidence] :
  /// Specifies the minimum confidence level for the labels to return. Amazon
  /// Rekognition doesn't return any labels with a confidence lower than this
  /// specified value. If you specify a value of 0, all labels are return,
  /// regardless of the default thresholds that the model version applies.
  Future<DetectCustomLabelsResponse> detectCustomLabels({
    @_s.required Image image,
    @_s.required String projectVersionArn,
    int maxResults,
    double minConfidence,
  }) async {
    ArgumentError.checkNotNull(image, 'image');
    ArgumentError.checkNotNull(projectVersionArn, 'projectVersionArn');
    _s.validateStringLength(
      'projectVersionArn',
      projectVersionArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'projectVersionArn',
      projectVersionArn,
      r'''(^arn:[a-z\d-]+:rekognition:[a-z\d-]+:\d{12}:project\/[a-zA-Z0-9_.\-]{1,255}\/version\/[a-zA-Z0-9_.\-]{1,255}\/[0-9]+$)''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      1152921504606846976,
    );
    _s.validateNumRange(
      'minConfidence',
      minConfidence,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.DetectCustomLabels'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Image': image,
        'ProjectVersionArn': projectVersionArn,
        if (maxResults != null) 'MaxResults': maxResults,
        if (minConfidence != null) 'MinConfidence': minConfidence,
      },
    );

    return DetectCustomLabelsResponse.fromJson(jsonResponse.body);
  }

  /// Detects faces within an image that is provided as input.
  ///
  /// <code>DetectFaces</code> detects the 100 largest faces in the image. For
  /// each face detected, the operation returns face details. These details
  /// include a bounding box of the face, a confidence value (that the bounding
  /// box contains a face), and a fixed set of attributes such as facial
  /// landmarks (for example, coordinates of eye and mouth), presence of beard,
  /// sunglasses, and so on.
  ///
  /// The face-detection algorithm is most effective on frontal faces. For
  /// non-frontal or obscured faces, the algorithm might not detect the faces or
  /// might detect faces with lower confidence.
  ///
  /// You pass the input image either as base64-encoded image bytes or as a
  /// reference to an image in an Amazon S3 bucket. If you use the AWS CLI to
  /// call Amazon Rekognition operations, passing image bytes is not supported.
  /// The image must be either a PNG or JPEG formatted file.
  /// <note>
  /// This is a stateless API operation. That is, the operation does not persist
  /// any data.
  /// </note>
  /// This operation requires permissions to perform the
  /// <code>rekognition:DetectFaces</code> action.
  ///
  /// May throw [InvalidS3ObjectException].
  /// May throw [InvalidParameterException].
  /// May throw [ImageTooLargeException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [InvalidImageFormatException].
  ///
  /// Parameter [image] :
  /// The input image as base64-encoded bytes or an S3 object. If you use the
  /// AWS CLI to call Amazon Rekognition operations, passing base64-encoded
  /// image bytes is not supported.
  ///
  /// If you are using an AWS SDK to call Amazon Rekognition, you might not need
  /// to base64-encode image bytes passed using the <code>Bytes</code> field.
  /// For more information, see Images in the Amazon Rekognition developer
  /// guide.
  ///
  /// Parameter [attributes] :
  /// An array of facial attributes you want to be returned. This can be the
  /// default list of attributes or all attributes. If you don't specify a value
  /// for <code>Attributes</code> or if you specify <code>["DEFAULT"]</code>,
  /// the API returns the following subset of facial attributes:
  /// <code>BoundingBox</code>, <code>Confidence</code>, <code>Pose</code>,
  /// <code>Quality</code>, and <code>Landmarks</code>. If you provide
  /// <code>["ALL"]</code>, all facial attributes are returned, but the
  /// operation takes longer to complete.
  ///
  /// If you provide both, <code>["ALL", "DEFAULT"]</code>, the service uses a
  /// logical AND operator to determine which attributes to return (in this
  /// case, all attributes).
  Future<DetectFacesResponse> detectFaces({
    @_s.required Image image,
    List<Attribute> attributes,
  }) async {
    ArgumentError.checkNotNull(image, 'image');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.DetectFaces'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Image': image,
        if (attributes != null)
          'Attributes': attributes.map((e) => e?.toValue() ?? '').toList(),
      },
    );

    return DetectFacesResponse.fromJson(jsonResponse.body);
  }

  /// Detects instances of real-world entities within an image (JPEG or PNG)
  /// provided as input. This includes objects like flower, tree, and table;
  /// events like wedding, graduation, and birthday party; and concepts like
  /// landscape, evening, and nature.
  ///
  /// For an example, see Analyzing Images Stored in an Amazon S3 Bucket in the
  /// Amazon Rekognition Developer Guide.
  /// <note>
  /// <code>DetectLabels</code> does not support the detection of activities.
  /// However, activity detection is supported for label detection in videos.
  /// For more information, see StartLabelDetection in the Amazon Rekognition
  /// Developer Guide.
  /// </note>
  /// You pass the input image as base64-encoded image bytes or as a reference
  /// to an image in an Amazon S3 bucket. If you use the AWS CLI to call Amazon
  /// Rekognition operations, passing image bytes is not supported. The image
  /// must be either a PNG or JPEG formatted file.
  ///
  /// For each object, scene, and concept the API returns one or more labels.
  /// Each label provides the object name, and the level of confidence that the
  /// image contains the object. For example, suppose the input image has a
  /// lighthouse, the sea, and a rock. The response includes all three labels,
  /// one for each object.
  ///
  /// <code>{Name: lighthouse, Confidence: 98.4629}</code>
  ///
  /// <code>{Name: rock,Confidence: 79.2097}</code>
  ///
  /// <code> {Name: sea,Confidence: 75.061}</code>
  ///
  /// In the preceding example, the operation returns one label for each of the
  /// three objects. The operation can also return multiple labels for the same
  /// object in the image. For example, if the input image shows a flower (for
  /// example, a tulip), the operation might return the following three labels.
  ///
  /// <code>{Name: flower,Confidence: 99.0562}</code>
  ///
  /// <code>{Name: plant,Confidence: 99.0562}</code>
  ///
  /// <code>{Name: tulip,Confidence: 99.0562}</code>
  ///
  /// In this example, the detection algorithm more precisely identifies the
  /// flower as a tulip.
  ///
  /// In response, the API returns an array of labels. In addition, the response
  /// also includes the orientation correction. Optionally, you can specify
  /// <code>MinConfidence</code> to control the confidence threshold for the
  /// labels returned. The default is 55%. You can also add the
  /// <code>MaxLabels</code> parameter to limit the number of labels returned.
  /// <note>
  /// If the object detected is a person, the operation doesn't provide the same
  /// facial details that the <a>DetectFaces</a> operation provides.
  /// </note>
  /// <code>DetectLabels</code> returns bounding boxes for instances of common
  /// object labels in an array of <a>Instance</a> objects. An
  /// <code>Instance</code> object contains a <a>BoundingBox</a> object, for the
  /// location of the label on the image. It also includes the confidence by
  /// which the bounding box was detected.
  ///
  /// <code>DetectLabels</code> also returns a hierarchical taxonomy of detected
  /// labels. For example, a detected car might be assigned the label
  /// <i>car</i>. The label <i>car</i> has two parent labels: <i>Vehicle</i>
  /// (its parent) and <i>Transportation</i> (its grandparent). The response
  /// returns the entire list of ancestors for a label. Each ancestor is a
  /// unique label in the response. In the previous example, <i>Car</i>,
  /// <i>Vehicle</i>, and <i>Transportation</i> are returned as unique labels in
  /// the response.
  ///
  /// This is a stateless API operation. That is, the operation does not persist
  /// any data.
  ///
  /// This operation requires permissions to perform the
  /// <code>rekognition:DetectLabels</code> action.
  ///
  /// May throw [InvalidS3ObjectException].
  /// May throw [InvalidParameterException].
  /// May throw [ImageTooLargeException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [InvalidImageFormatException].
  ///
  /// Parameter [image] :
  /// The input image as base64-encoded bytes or an S3 object. If you use the
  /// AWS CLI to call Amazon Rekognition operations, passing image bytes is not
  /// supported. Images stored in an S3 Bucket do not need to be base64-encoded.
  ///
  /// If you are using an AWS SDK to call Amazon Rekognition, you might not need
  /// to base64-encode image bytes passed using the <code>Bytes</code> field.
  /// For more information, see Images in the Amazon Rekognition developer
  /// guide.
  ///
  /// Parameter [maxLabels] :
  /// Maximum number of labels you want the service to return in the response.
  /// The service returns the specified number of highest confidence labels.
  ///
  /// Parameter [minConfidence] :
  /// Specifies the minimum confidence level for the labels to return. Amazon
  /// Rekognition doesn't return any labels with confidence lower than this
  /// specified value.
  ///
  /// If <code>MinConfidence</code> is not specified, the operation returns
  /// labels with a confidence values greater than or equal to 55 percent.
  Future<DetectLabelsResponse> detectLabels({
    @_s.required Image image,
    int maxLabels,
    double minConfidence,
  }) async {
    ArgumentError.checkNotNull(image, 'image');
    _s.validateNumRange(
      'maxLabels',
      maxLabels,
      0,
      1152921504606846976,
    );
    _s.validateNumRange(
      'minConfidence',
      minConfidence,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.DetectLabels'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Image': image,
        if (maxLabels != null) 'MaxLabels': maxLabels,
        if (minConfidence != null) 'MinConfidence': minConfidence,
      },
    );

    return DetectLabelsResponse.fromJson(jsonResponse.body);
  }

  /// Detects unsafe content in a specified JPEG or PNG format image. Use
  /// <code>DetectModerationLabels</code> to moderate images depending on your
  /// requirements. For example, you might want to filter images that contain
  /// nudity, but not images containing suggestive content.
  ///
  /// To filter images, use the labels returned by
  /// <code>DetectModerationLabels</code> to determine which types of content
  /// are appropriate.
  ///
  /// For information about moderation labels, see Detecting Unsafe Content in
  /// the Amazon Rekognition Developer Guide.
  ///
  /// You pass the input image either as base64-encoded image bytes or as a
  /// reference to an image in an Amazon S3 bucket. If you use the AWS CLI to
  /// call Amazon Rekognition operations, passing image bytes is not supported.
  /// The image must be either a PNG or JPEG formatted file.
  ///
  /// May throw [InvalidS3ObjectException].
  /// May throw [InvalidParameterException].
  /// May throw [ImageTooLargeException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [InvalidImageFormatException].
  /// May throw [HumanLoopQuotaExceededException].
  ///
  /// Parameter [image] :
  /// The input image as base64-encoded bytes or an S3 object. If you use the
  /// AWS CLI to call Amazon Rekognition operations, passing base64-encoded
  /// image bytes is not supported.
  ///
  /// If you are using an AWS SDK to call Amazon Rekognition, you might not need
  /// to base64-encode image bytes passed using the <code>Bytes</code> field.
  /// For more information, see Images in the Amazon Rekognition developer
  /// guide.
  ///
  /// Parameter [humanLoopConfig] :
  /// Sets up the configuration for human evaluation, including the
  /// FlowDefinition the image will be sent to.
  ///
  /// Parameter [minConfidence] :
  /// Specifies the minimum confidence level for the labels to return. Amazon
  /// Rekognition doesn't return any labels with a confidence level lower than
  /// this specified value.
  ///
  /// If you don't specify <code>MinConfidence</code>, the operation returns
  /// labels with confidence values greater than or equal to 50 percent.
  Future<DetectModerationLabelsResponse> detectModerationLabels({
    @_s.required Image image,
    HumanLoopConfig humanLoopConfig,
    double minConfidence,
  }) async {
    ArgumentError.checkNotNull(image, 'image');
    _s.validateNumRange(
      'minConfidence',
      minConfidence,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.DetectModerationLabels'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Image': image,
        if (humanLoopConfig != null) 'HumanLoopConfig': humanLoopConfig,
        if (minConfidence != null) 'MinConfidence': minConfidence,
      },
    );

    return DetectModerationLabelsResponse.fromJson(jsonResponse.body);
  }

  /// Detects Personal Protective Equipment (PPE) worn by people detected in an
  /// image. Amazon Rekognition can detect the following types of PPE.
  ///
  /// <ul>
  /// <li>
  /// Face cover
  /// </li>
  /// <li>
  /// Hand cover
  /// </li>
  /// <li>
  /// Head cover
  /// </li>
  /// </ul>
  /// You pass the input image as base64-encoded image bytes or as a reference
  /// to an image in an Amazon S3 bucket. The image must be either a PNG or JPG
  /// formatted file.
  ///
  /// <code>DetectProtectiveEquipment</code> detects PPE worn by up to 15
  /// persons detected in an image.
  ///
  /// For each person detected in the image the API returns an array of body
  /// parts (face, head, left-hand, right-hand). For each body part, an array of
  /// detected items of PPE is returned, including an indicator of whether or
  /// not the PPE covers the body part. The API returns the confidence it has in
  /// each detection (person, PPE, body part and body part coverage). It also
  /// returns a bounding box (<a>BoundingBox</a>) for each detected person and
  /// each detected item of PPE.
  ///
  /// You can optionally request a summary of detected PPE items with the
  /// <code>SummarizationAttributes</code> input parameter. The summary provides
  /// the following information.
  ///
  /// <ul>
  /// <li>
  /// The persons detected as wearing all of the types of PPE that you specify.
  /// </li>
  /// <li>
  /// The persons detected as not wearing all of the types PPE that you specify.
  /// </li>
  /// <li>
  /// The persons detected where PPE adornment could not be determined.
  /// </li>
  /// </ul>
  /// This is a stateless API operation. That is, the operation does not persist
  /// any data.
  ///
  /// This operation requires permissions to perform the
  /// <code>rekognition:DetectProtectiveEquipment</code> action.
  ///
  /// May throw [InvalidS3ObjectException].
  /// May throw [InvalidParameterException].
  /// May throw [ImageTooLargeException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [InvalidImageFormatException].
  ///
  /// Parameter [image] :
  /// The image in which you want to detect PPE on detected persons. The image
  /// can be passed as image bytes or you can reference an image stored in an
  /// Amazon S3 bucket.
  ///
  /// Parameter [summarizationAttributes] :
  /// An array of PPE types that you want to summarize.
  Future<DetectProtectiveEquipmentResponse> detectProtectiveEquipment({
    @_s.required Image image,
    ProtectiveEquipmentSummarizationAttributes summarizationAttributes,
  }) async {
    ArgumentError.checkNotNull(image, 'image');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.DetectProtectiveEquipment'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Image': image,
        if (summarizationAttributes != null)
          'SummarizationAttributes': summarizationAttributes,
      },
    );

    return DetectProtectiveEquipmentResponse.fromJson(jsonResponse.body);
  }

  /// Detects text in the input image and converts it into machine-readable
  /// text.
  ///
  /// Pass the input image as base64-encoded image bytes or as a reference to an
  /// image in an Amazon S3 bucket. If you use the AWS CLI to call Amazon
  /// Rekognition operations, you must pass it as a reference to an image in an
  /// Amazon S3 bucket. For the AWS CLI, passing image bytes is not supported.
  /// The image must be either a .png or .jpeg formatted file.
  ///
  /// The <code>DetectText</code> operation returns text in an array of
  /// <a>TextDetection</a> elements, <code>TextDetections</code>. Each
  /// <code>TextDetection</code> element provides information about a single
  /// word or line of text that was detected in the image.
  ///
  /// A word is one or more ISO basic latin script characters that are not
  /// separated by spaces. <code>DetectText</code> can detect up to 50 words in
  /// an image.
  ///
  /// A line is a string of equally spaced words. A line isn't necessarily a
  /// complete sentence. For example, a driver's license number is detected as a
  /// line. A line ends when there is no aligned text after it. Also, a line
  /// ends when there is a large gap between words, relative to the length of
  /// the words. This means, depending on the gap between words, Amazon
  /// Rekognition may detect multiple lines in text aligned in the same
  /// direction. Periods don't represent the end of a line. If a sentence spans
  /// multiple lines, the <code>DetectText</code> operation returns multiple
  /// lines.
  ///
  /// To determine whether a <code>TextDetection</code> element is a line of
  /// text or a word, use the <code>TextDetection</code> object
  /// <code>Type</code> field.
  ///
  /// To be detected, text must be within +/- 90 degrees orientation of the
  /// horizontal axis.
  ///
  /// For more information, see DetectText in the Amazon Rekognition Developer
  /// Guide.
  ///
  /// May throw [InvalidS3ObjectException].
  /// May throw [InvalidParameterException].
  /// May throw [ImageTooLargeException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [InvalidImageFormatException].
  ///
  /// Parameter [image] :
  /// The input image as base64-encoded bytes or an Amazon S3 object. If you use
  /// the AWS CLI to call Amazon Rekognition operations, you can't pass image
  /// bytes.
  ///
  /// If you are using an AWS SDK to call Amazon Rekognition, you might not need
  /// to base64-encode image bytes passed using the <code>Bytes</code> field.
  /// For more information, see Images in the Amazon Rekognition developer
  /// guide.
  ///
  /// Parameter [filters] :
  /// Optional parameters that let you set the criteria that the text must meet
  /// to be included in your response.
  Future<DetectTextResponse> detectText({
    @_s.required Image image,
    DetectTextFilters filters,
  }) async {
    ArgumentError.checkNotNull(image, 'image');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.DetectText'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Image': image,
        if (filters != null) 'Filters': filters,
      },
    );

    return DetectTextResponse.fromJson(jsonResponse.body);
  }

  /// Gets the name and additional information about a celebrity based on his or
  /// her Amazon Rekognition ID. The additional information is returned as an
  /// array of URLs. If there is no additional information about the celebrity,
  /// this list is empty.
  ///
  /// For more information, see Recognizing Celebrities in an Image in the
  /// Amazon Rekognition Developer Guide.
  ///
  /// This operation requires permissions to perform the
  /// <code>rekognition:GetCelebrityInfo</code> action.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [id] :
  /// The ID for the celebrity. You get the celebrity ID from a call to the
  /// <a>RecognizeCelebrities</a> operation, which recognizes celebrities in an
  /// image.
  Future<GetCelebrityInfoResponse> getCelebrityInfo({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringPattern(
      'id',
      id,
      r'''[0-9A-Za-z]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.GetCelebrityInfo'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
      },
    );

    return GetCelebrityInfoResponse.fromJson(jsonResponse.body);
  }

  /// Gets the celebrity recognition results for a Amazon Rekognition Video
  /// analysis started by <a>StartCelebrityRecognition</a>.
  ///
  /// Celebrity recognition in a video is an asynchronous operation. Analysis is
  /// started by a call to <a>StartCelebrityRecognition</a> which returns a job
  /// identifier (<code>JobId</code>). When the celebrity recognition operation
  /// finishes, Amazon Rekognition Video publishes a completion status to the
  /// Amazon Simple Notification Service topic registered in the initial call to
  /// <code>StartCelebrityRecognition</code>. To get the results of the
  /// celebrity recognition analysis, first check that the status value
  /// published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call
  /// <code>GetCelebrityDetection</code> and pass the job identifier
  /// (<code>JobId</code>) from the initial call to
  /// <code>StartCelebrityDetection</code>.
  ///
  /// For more information, see Working With Stored Videos in the Amazon
  /// Rekognition Developer Guide.
  ///
  /// <code>GetCelebrityRecognition</code> returns detected celebrities and the
  /// time(s) they are detected in an array (<code>Celebrities</code>) of
  /// <a>CelebrityRecognition</a> objects. Each
  /// <code>CelebrityRecognition</code> contains information about the celebrity
  /// in a <a>CelebrityDetail</a> object and the time, <code>Timestamp</code>,
  /// the celebrity was detected.
  /// <note>
  /// <code>GetCelebrityRecognition</code> only returns the default facial
  /// attributes (<code>BoundingBox</code>, <code>Confidence</code>,
  /// <code>Landmarks</code>, <code>Pose</code>, and <code>Quality</code>). The
  /// other facial attributes listed in the <code>Face</code> object of the
  /// following response syntax are not returned. For more information, see
  /// FaceDetail in the Amazon Rekognition Developer Guide.
  /// </note>
  /// By default, the <code>Celebrities</code> array is sorted by time
  /// (milliseconds from the start of the video). You can also sort the array by
  /// celebrity by specifying the value <code>ID</code> in the
  /// <code>SortBy</code> input parameter.
  ///
  /// The <code>CelebrityDetail</code> object includes the celebrity identifer
  /// and additional information urls. If you don't store the additional
  /// information urls, you can get them later by calling
  /// <a>GetCelebrityInfo</a> with the celebrity identifer.
  ///
  /// No information is returned for faces not recognized as celebrities.
  ///
  /// Use MaxResults parameter to limit the number of labels returned. If there
  /// are more results than specified in <code>MaxResults</code>, the value of
  /// <code>NextToken</code> in the operation response contains a pagination
  /// token for getting the next set of results. To get the next page of
  /// results, call <code>GetCelebrityDetection</code> and populate the
  /// <code>NextToken</code> request parameter with the token value returned
  /// from the previous call to <code>GetCelebrityRecognition</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [jobId] :
  /// Job identifier for the required celebrity recognition analysis. You can
  /// get the job identifer from a call to
  /// <code>StartCelebrityRecognition</code>.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return per paginated call. The largest value
  /// you can specify is 1000. If you specify a value greater than 1000, a
  /// maximum of 1000 results is returned. The default value is 1000.
  ///
  /// Parameter [nextToken] :
  /// If the previous response was incomplete (because there is more recognized
  /// celebrities to retrieve), Amazon Rekognition Video returns a pagination
  /// token in the response. You can use this pagination token to retrieve the
  /// next set of celebrities.
  ///
  /// Parameter [sortBy] :
  /// Sort to use for celebrities returned in <code>Celebrities</code> field.
  /// Specify <code>ID</code> to sort by the celebrity identifier, specify
  /// <code>TIMESTAMP</code> to sort by the time the celebrity was recognized.
  Future<GetCelebrityRecognitionResponse> getCelebrityRecognition({
    @_s.required String jobId,
    int maxResults,
    String nextToken,
    CelebrityRecognitionSortBy sortBy,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'jobId',
      jobId,
      r'''^[a-zA-Z0-9-_]+$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.GetCelebrityRecognition'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobId': jobId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (sortBy != null) 'SortBy': sortBy.toValue(),
      },
    );

    return GetCelebrityRecognitionResponse.fromJson(jsonResponse.body);
  }

  /// Gets the unsafe content analysis results for a Amazon Rekognition Video
  /// analysis started by <a>StartContentModeration</a>.
  ///
  /// Unsafe content analysis of a video is an asynchronous operation. You start
  /// analysis by calling <a>StartContentModeration</a> which returns a job
  /// identifier (<code>JobId</code>). When analysis finishes, Amazon
  /// Rekognition Video publishes a completion status to the Amazon Simple
  /// Notification Service topic registered in the initial call to
  /// <code>StartContentModeration</code>. To get the results of the unsafe
  /// content analysis, first check that the status value published to the
  /// Amazon SNS topic is <code>SUCCEEDED</code>. If so, call
  /// <code>GetContentModeration</code> and pass the job identifier
  /// (<code>JobId</code>) from the initial call to
  /// <code>StartContentModeration</code>.
  ///
  /// For more information, see Working with Stored Videos in the Amazon
  /// Rekognition Devlopers Guide.
  ///
  /// <code>GetContentModeration</code> returns detected unsafe content labels,
  /// and the time they are detected, in an array,
  /// <code>ModerationLabels</code>, of <a>ContentModerationDetection</a>
  /// objects.
  ///
  /// By default, the moderated labels are returned sorted by time, in
  /// milliseconds from the start of the video. You can also sort them by
  /// moderated label by specifying <code>NAME</code> for the
  /// <code>SortBy</code> input parameter.
  ///
  /// Since video analysis can return a large number of results, use the
  /// <code>MaxResults</code> parameter to limit the number of labels returned
  /// in a single call to <code>GetContentModeration</code>. If there are more
  /// results than specified in <code>MaxResults</code>, the value of
  /// <code>NextToken</code> in the operation response contains a pagination
  /// token for getting the next set of results. To get the next page of
  /// results, call <code>GetContentModeration</code> and populate the
  /// <code>NextToken</code> request parameter with the value of
  /// <code>NextToken</code> returned from the previous call to
  /// <code>GetContentModeration</code>.
  ///
  /// For more information, see Detecting Unsafe Content in the Amazon
  /// Rekognition Developer Guide.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [jobId] :
  /// The identifier for the unsafe content job. Use <code>JobId</code> to
  /// identify the job in a subsequent call to
  /// <code>GetContentModeration</code>.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return per paginated call. The largest value
  /// you can specify is 1000. If you specify a value greater than 1000, a
  /// maximum of 1000 results is returned. The default value is 1000.
  ///
  /// Parameter [nextToken] :
  /// If the previous response was incomplete (because there is more data to
  /// retrieve), Amazon Rekognition returns a pagination token in the response.
  /// You can use this pagination token to retrieve the next set of unsafe
  /// content labels.
  ///
  /// Parameter [sortBy] :
  /// Sort to use for elements in the <code>ModerationLabelDetections</code>
  /// array. Use <code>TIMESTAMP</code> to sort array elements by the time
  /// labels are detected. Use <code>NAME</code> to alphabetically group
  /// elements for a label together. Within each label group, the array element
  /// are sorted by detection confidence. The default sort is by
  /// <code>TIMESTAMP</code>.
  Future<GetContentModerationResponse> getContentModeration({
    @_s.required String jobId,
    int maxResults,
    String nextToken,
    ContentModerationSortBy sortBy,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'jobId',
      jobId,
      r'''^[a-zA-Z0-9-_]+$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.GetContentModeration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobId': jobId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (sortBy != null) 'SortBy': sortBy.toValue(),
      },
    );

    return GetContentModerationResponse.fromJson(jsonResponse.body);
  }

  /// Gets face detection results for a Amazon Rekognition Video analysis
  /// started by <a>StartFaceDetection</a>.
  ///
  /// Face detection with Amazon Rekognition Video is an asynchronous operation.
  /// You start face detection by calling <a>StartFaceDetection</a> which
  /// returns a job identifier (<code>JobId</code>). When the face detection
  /// operation finishes, Amazon Rekognition Video publishes a completion status
  /// to the Amazon Simple Notification Service topic registered in the initial
  /// call to <code>StartFaceDetection</code>. To get the results of the face
  /// detection operation, first check that the status value published to the
  /// Amazon SNS topic is <code>SUCCEEDED</code>. If so, call
  /// <a>GetFaceDetection</a> and pass the job identifier (<code>JobId</code>)
  /// from the initial call to <code>StartFaceDetection</code>.
  ///
  /// <code>GetFaceDetection</code> returns an array of detected faces
  /// (<code>Faces</code>) sorted by the time the faces were detected.
  ///
  /// Use MaxResults parameter to limit the number of labels returned. If there
  /// are more results than specified in <code>MaxResults</code>, the value of
  /// <code>NextToken</code> in the operation response contains a pagination
  /// token for getting the next set of results. To get the next page of
  /// results, call <code>GetFaceDetection</code> and populate the
  /// <code>NextToken</code> request parameter with the token value returned
  /// from the previous call to <code>GetFaceDetection</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [jobId] :
  /// Unique identifier for the face detection job. The <code>JobId</code> is
  /// returned from <code>StartFaceDetection</code>.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return per paginated call. The largest value
  /// you can specify is 1000. If you specify a value greater than 1000, a
  /// maximum of 1000 results is returned. The default value is 1000.
  ///
  /// Parameter [nextToken] :
  /// If the previous response was incomplete (because there are more faces to
  /// retrieve), Amazon Rekognition Video returns a pagination token in the
  /// response. You can use this pagination token to retrieve the next set of
  /// faces.
  Future<GetFaceDetectionResponse> getFaceDetection({
    @_s.required String jobId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'jobId',
      jobId,
      r'''^[a-zA-Z0-9-_]+$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.GetFaceDetection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobId': jobId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return GetFaceDetectionResponse.fromJson(jsonResponse.body);
  }

  /// Gets the face search results for Amazon Rekognition Video face search
  /// started by <a>StartFaceSearch</a>. The search returns faces in a
  /// collection that match the faces of persons detected in a video. It also
  /// includes the time(s) that faces are matched in the video.
  ///
  /// Face search in a video is an asynchronous operation. You start face search
  /// by calling to <a>StartFaceSearch</a> which returns a job identifier
  /// (<code>JobId</code>). When the search operation finishes, Amazon
  /// Rekognition Video publishes a completion status to the Amazon Simple
  /// Notification Service topic registered in the initial call to
  /// <code>StartFaceSearch</code>. To get the search results, first check that
  /// the status value published to the Amazon SNS topic is
  /// <code>SUCCEEDED</code>. If so, call <code>GetFaceSearch</code> and pass
  /// the job identifier (<code>JobId</code>) from the initial call to
  /// <code>StartFaceSearch</code>.
  ///
  /// For more information, see Searching Faces in a Collection in the Amazon
  /// Rekognition Developer Guide.
  ///
  /// The search results are retured in an array, <code>Persons</code>, of
  /// <a>PersonMatch</a> objects. Each<code>PersonMatch</code> element contains
  /// details about the matching faces in the input collection, person
  /// information (facial attributes, bounding boxes, and person identifer) for
  /// the matched person, and the time the person was matched in the video.
  /// <note>
  /// <code>GetFaceSearch</code> only returns the default facial attributes
  /// (<code>BoundingBox</code>, <code>Confidence</code>,
  /// <code>Landmarks</code>, <code>Pose</code>, and <code>Quality</code>). The
  /// other facial attributes listed in the <code>Face</code> object of the
  /// following response syntax are not returned. For more information, see
  /// FaceDetail in the Amazon Rekognition Developer Guide.
  /// </note>
  /// By default, the <code>Persons</code> array is sorted by the time, in
  /// milliseconds from the start of the video, persons are matched. You can
  /// also sort by persons by specifying <code>INDEX</code> for the
  /// <code>SORTBY</code> input parameter.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [jobId] :
  /// The job identifer for the search request. You get the job identifier from
  /// an initial call to <code>StartFaceSearch</code>.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return per paginated call. The largest value
  /// you can specify is 1000. If you specify a value greater than 1000, a
  /// maximum of 1000 results is returned. The default value is 1000.
  ///
  /// Parameter [nextToken] :
  /// If the previous response was incomplete (because there is more search
  /// results to retrieve), Amazon Rekognition Video returns a pagination token
  /// in the response. You can use this pagination token to retrieve the next
  /// set of search results.
  ///
  /// Parameter [sortBy] :
  /// Sort to use for grouping faces in the response. Use <code>TIMESTAMP</code>
  /// to group faces by the time that they are recognized. Use
  /// <code>INDEX</code> to sort by recognized faces.
  Future<GetFaceSearchResponse> getFaceSearch({
    @_s.required String jobId,
    int maxResults,
    String nextToken,
    FaceSearchSortBy sortBy,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'jobId',
      jobId,
      r'''^[a-zA-Z0-9-_]+$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.GetFaceSearch'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobId': jobId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (sortBy != null) 'SortBy': sortBy.toValue(),
      },
    );

    return GetFaceSearchResponse.fromJson(jsonResponse.body);
  }

  /// Gets the label detection results of a Amazon Rekognition Video analysis
  /// started by <a>StartLabelDetection</a>.
  ///
  /// The label detection operation is started by a call to
  /// <a>StartLabelDetection</a> which returns a job identifier
  /// (<code>JobId</code>). When the label detection operation finishes, Amazon
  /// Rekognition publishes a completion status to the Amazon Simple
  /// Notification Service topic registered in the initial call to
  /// <code>StartlabelDetection</code>. To get the results of the label
  /// detection operation, first check that the status value published to the
  /// Amazon SNS topic is <code>SUCCEEDED</code>. If so, call
  /// <a>GetLabelDetection</a> and pass the job identifier (<code>JobId</code>)
  /// from the initial call to <code>StartLabelDetection</code>.
  ///
  /// <code>GetLabelDetection</code> returns an array of detected labels
  /// (<code>Labels</code>) sorted by the time the labels were detected. You can
  /// also sort by the label name by specifying <code>NAME</code> for the
  /// <code>SortBy</code> input parameter.
  ///
  /// The labels returned include the label name, the percentage confidence in
  /// the accuracy of the detected label, and the time the label was detected in
  /// the video.
  ///
  /// The returned labels also include bounding box information for common
  /// objects, a hierarchical taxonomy of detected labels, and the version of
  /// the label model used for detection.
  ///
  /// Use MaxResults parameter to limit the number of labels returned. If there
  /// are more results than specified in <code>MaxResults</code>, the value of
  /// <code>NextToken</code> in the operation response contains a pagination
  /// token for getting the next set of results. To get the next page of
  /// results, call <code>GetlabelDetection</code> and populate the
  /// <code>NextToken</code> request parameter with the token value returned
  /// from the previous call to <code>GetLabelDetection</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [jobId] :
  /// Job identifier for the label detection operation for which you want
  /// results returned. You get the job identifer from an initial call to
  /// <code>StartlabelDetection</code>.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return per paginated call. The largest value
  /// you can specify is 1000. If you specify a value greater than 1000, a
  /// maximum of 1000 results is returned. The default value is 1000.
  ///
  /// Parameter [nextToken] :
  /// If the previous response was incomplete (because there are more labels to
  /// retrieve), Amazon Rekognition Video returns a pagination token in the
  /// response. You can use this pagination token to retrieve the next set of
  /// labels.
  ///
  /// Parameter [sortBy] :
  /// Sort to use for elements in the <code>Labels</code> array. Use
  /// <code>TIMESTAMP</code> to sort array elements by the time labels are
  /// detected. Use <code>NAME</code> to alphabetically group elements for a
  /// label together. Within each label group, the array element are sorted by
  /// detection confidence. The default sort is by <code>TIMESTAMP</code>.
  Future<GetLabelDetectionResponse> getLabelDetection({
    @_s.required String jobId,
    int maxResults,
    String nextToken,
    LabelDetectionSortBy sortBy,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'jobId',
      jobId,
      r'''^[a-zA-Z0-9-_]+$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.GetLabelDetection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobId': jobId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (sortBy != null) 'SortBy': sortBy.toValue(),
      },
    );

    return GetLabelDetectionResponse.fromJson(jsonResponse.body);
  }

  /// Gets the path tracking results of a Amazon Rekognition Video analysis
  /// started by <a>StartPersonTracking</a>.
  ///
  /// The person path tracking operation is started by a call to
  /// <code>StartPersonTracking</code> which returns a job identifier
  /// (<code>JobId</code>). When the operation finishes, Amazon Rekognition
  /// Video publishes a completion status to the Amazon Simple Notification
  /// Service topic registered in the initial call to
  /// <code>StartPersonTracking</code>.
  ///
  /// To get the results of the person path tracking operation, first check that
  /// the status value published to the Amazon SNS topic is
  /// <code>SUCCEEDED</code>. If so, call <a>GetPersonTracking</a> and pass the
  /// job identifier (<code>JobId</code>) from the initial call to
  /// <code>StartPersonTracking</code>.
  ///
  /// <code>GetPersonTracking</code> returns an array, <code>Persons</code>, of
  /// tracked persons and the time(s) their paths were tracked in the video.
  /// <note>
  /// <code>GetPersonTracking</code> only returns the default facial attributes
  /// (<code>BoundingBox</code>, <code>Confidence</code>,
  /// <code>Landmarks</code>, <code>Pose</code>, and <code>Quality</code>). The
  /// other facial attributes listed in the <code>Face</code> object of the
  /// following response syntax are not returned.
  ///
  /// For more information, see FaceDetail in the Amazon Rekognition Developer
  /// Guide.
  /// </note>
  /// By default, the array is sorted by the time(s) a person's path is tracked
  /// in the video. You can sort by tracked persons by specifying
  /// <code>INDEX</code> for the <code>SortBy</code> input parameter.
  ///
  /// Use the <code>MaxResults</code> parameter to limit the number of items
  /// returned. If there are more results than specified in
  /// <code>MaxResults</code>, the value of <code>NextToken</code> in the
  /// operation response contains a pagination token for getting the next set of
  /// results. To get the next page of results, call
  /// <code>GetPersonTracking</code> and populate the <code>NextToken</code>
  /// request parameter with the token value returned from the previous call to
  /// <code>GetPersonTracking</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [jobId] :
  /// The identifier for a job that tracks persons in a video. You get the
  /// <code>JobId</code> from a call to <code>StartPersonTracking</code>.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return per paginated call. The largest value
  /// you can specify is 1000. If you specify a value greater than 1000, a
  /// maximum of 1000 results is returned. The default value is 1000.
  ///
  /// Parameter [nextToken] :
  /// If the previous response was incomplete (because there are more persons to
  /// retrieve), Amazon Rekognition Video returns a pagination token in the
  /// response. You can use this pagination token to retrieve the next set of
  /// persons.
  ///
  /// Parameter [sortBy] :
  /// Sort to use for elements in the <code>Persons</code> array. Use
  /// <code>TIMESTAMP</code> to sort array elements by the time persons are
  /// detected. Use <code>INDEX</code> to sort by the tracked persons. If you
  /// sort by <code>INDEX</code>, the array elements for each person are sorted
  /// by detection confidence. The default sort is by <code>TIMESTAMP</code>.
  Future<GetPersonTrackingResponse> getPersonTracking({
    @_s.required String jobId,
    int maxResults,
    String nextToken,
    PersonTrackingSortBy sortBy,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'jobId',
      jobId,
      r'''^[a-zA-Z0-9-_]+$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.GetPersonTracking'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobId': jobId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (sortBy != null) 'SortBy': sortBy.toValue(),
      },
    );

    return GetPersonTrackingResponse.fromJson(jsonResponse.body);
  }

  /// Gets the segment detection results of a Amazon Rekognition Video analysis
  /// started by <a>StartSegmentDetection</a>.
  ///
  /// Segment detection with Amazon Rekognition Video is an asynchronous
  /// operation. You start segment detection by calling
  /// <a>StartSegmentDetection</a> which returns a job identifier
  /// (<code>JobId</code>). When the segment detection operation finishes,
  /// Amazon Rekognition publishes a completion status to the Amazon Simple
  /// Notification Service topic registered in the initial call to
  /// <code>StartSegmentDetection</code>. To get the results of the segment
  /// detection operation, first check that the status value published to the
  /// Amazon SNS topic is <code>SUCCEEDED</code>. if so, call
  /// <code>GetSegmentDetection</code> and pass the job identifier
  /// (<code>JobId</code>) from the initial call of
  /// <code>StartSegmentDetection</code>.
  ///
  /// <code>GetSegmentDetection</code> returns detected segments in an array
  /// (<code>Segments</code>) of <a>SegmentDetection</a> objects.
  /// <code>Segments</code> is sorted by the segment types specified in the
  /// <code>SegmentTypes</code> input parameter of
  /// <code>StartSegmentDetection</code>. Each element of the array includes the
  /// detected segment, the precentage confidence in the acuracy of the detected
  /// segment, the type of the segment, and the frame in which the segment was
  /// detected.
  ///
  /// Use <code>SelectedSegmentTypes</code> to find out the type of segment
  /// detection requested in the call to <code>StartSegmentDetection</code>.
  ///
  /// Use the <code>MaxResults</code> parameter to limit the number of segment
  /// detections returned. If there are more results than specified in
  /// <code>MaxResults</code>, the value of <code>NextToken</code> in the
  /// operation response contains a pagination token for getting the next set of
  /// results. To get the next page of results, call
  /// <code>GetSegmentDetection</code> and populate the <code>NextToken</code>
  /// request parameter with the token value returned from the previous call to
  /// <code>GetSegmentDetection</code>.
  ///
  /// For more information, see Detecting Video Segments in Stored Video in the
  /// Amazon Rekognition Developer Guide.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [jobId] :
  /// Job identifier for the text detection operation for which you want results
  /// returned. You get the job identifer from an initial call to
  /// <code>StartSegmentDetection</code>.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return per paginated call. The largest value
  /// you can specify is 1000.
  ///
  /// Parameter [nextToken] :
  /// If the response is truncated, Amazon Rekognition Video returns this token
  /// that you can use in the subsequent request to retrieve the next set of
  /// text.
  Future<GetSegmentDetectionResponse> getSegmentDetection({
    @_s.required String jobId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'jobId',
      jobId,
      r'''^[a-zA-Z0-9-_]+$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.GetSegmentDetection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobId': jobId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return GetSegmentDetectionResponse.fromJson(jsonResponse.body);
  }

  /// Gets the text detection results of a Amazon Rekognition Video analysis
  /// started by <a>StartTextDetection</a>.
  ///
  /// Text detection with Amazon Rekognition Video is an asynchronous operation.
  /// You start text detection by calling <a>StartTextDetection</a> which
  /// returns a job identifier (<code>JobId</code>) When the text detection
  /// operation finishes, Amazon Rekognition publishes a completion status to
  /// the Amazon Simple Notification Service topic registered in the initial
  /// call to <code>StartTextDetection</code>. To get the results of the text
  /// detection operation, first check that the status value published to the
  /// Amazon SNS topic is <code>SUCCEEDED</code>. if so, call
  /// <code>GetTextDetection</code> and pass the job identifier
  /// (<code>JobId</code>) from the initial call of
  /// <code>StartLabelDetection</code>.
  ///
  /// <code>GetTextDetection</code> returns an array of detected text
  /// (<code>TextDetections</code>) sorted by the time the text was detected, up
  /// to 50 words per frame of video.
  ///
  /// Each element of the array includes the detected text, the precentage
  /// confidence in the acuracy of the detected text, the time the text was
  /// detected, bounding box information for where the text was located, and
  /// unique identifiers for words and their lines.
  ///
  /// Use MaxResults parameter to limit the number of text detections returned.
  /// If there are more results than specified in <code>MaxResults</code>, the
  /// value of <code>NextToken</code> in the operation response contains a
  /// pagination token for getting the next set of results. To get the next page
  /// of results, call <code>GetTextDetection</code> and populate the
  /// <code>NextToken</code> request parameter with the token value returned
  /// from the previous call to <code>GetTextDetection</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [jobId] :
  /// Job identifier for the text detection operation for which you want results
  /// returned. You get the job identifer from an initial call to
  /// <code>StartTextDetection</code>.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return per paginated call. The largest value
  /// you can specify is 1000.
  ///
  /// Parameter [nextToken] :
  /// If the previous response was incomplete (because there are more labels to
  /// retrieve), Amazon Rekognition Video returns a pagination token in the
  /// response. You can use this pagination token to retrieve the next set of
  /// text.
  Future<GetTextDetectionResponse> getTextDetection({
    @_s.required String jobId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'jobId',
      jobId,
      r'''^[a-zA-Z0-9-_]+$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.GetTextDetection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobId': jobId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return GetTextDetectionResponse.fromJson(jsonResponse.body);
  }

  /// Detects faces in the input image and adds them to the specified
  /// collection.
  ///
  /// Amazon Rekognition doesn't save the actual faces that are detected.
  /// Instead, the underlying detection algorithm first detects the faces in the
  /// input image. For each face, the algorithm extracts facial features into a
  /// feature vector, and stores it in the backend database. Amazon Rekognition
  /// uses feature vectors when it performs face match and search operations
  /// using the <a>SearchFaces</a> and <a>SearchFacesByImage</a> operations.
  ///
  /// For more information, see Adding Faces to a Collection in the Amazon
  /// Rekognition Developer Guide.
  ///
  /// To get the number of faces in a collection, call
  /// <a>DescribeCollection</a>.
  ///
  /// If you're using version 1.0 of the face detection model,
  /// <code>IndexFaces</code> indexes the 15 largest faces in the input image.
  /// Later versions of the face detection model index the 100 largest faces in
  /// the input image.
  ///
  /// If you're using version 4 or later of the face model, image orientation
  /// information is not returned in the <code>OrientationCorrection</code>
  /// field.
  ///
  /// To determine which version of the model you're using, call
  /// <a>DescribeCollection</a> and supply the collection ID. You can also get
  /// the model version from the value of <code>FaceModelVersion</code> in the
  /// response from <code>IndexFaces</code>
  ///
  /// For more information, see Model Versioning in the Amazon Rekognition
  /// Developer Guide.
  ///
  /// If you provide the optional <code>ExternalImageId</code> for the input
  /// image you provided, Amazon Rekognition associates this ID with all faces
  /// that it detects. When you call the <a>ListFaces</a> operation, the
  /// response returns the external ID. You can use this external image ID to
  /// create a client-side index to associate the faces with each image. You can
  /// then use the index to find all faces in an image.
  ///
  /// You can specify the maximum number of faces to index with the
  /// <code>MaxFaces</code> input parameter. This is useful when you want to
  /// index the largest faces in an image and don't want to index smaller faces,
  /// such as those belonging to people standing in the background.
  ///
  /// The <code>QualityFilter</code> input parameter allows you to filter out
  /// detected faces that don’t meet a required quality bar. The quality bar is
  /// based on a variety of common use cases. By default,
  /// <code>IndexFaces</code> chooses the quality bar that's used to filter
  /// faces. You can also explicitly choose the quality bar. Use
  /// <code>QualityFilter</code>, to set the quality bar by specifying
  /// <code>LOW</code>, <code>MEDIUM</code>, or <code>HIGH</code>. If you do not
  /// want to filter detected faces, specify <code>NONE</code>.
  /// <note>
  /// To use quality filtering, you need a collection associated with version 3
  /// of the face model or higher. To get the version of the face model
  /// associated with a collection, call <a>DescribeCollection</a>.
  /// </note>
  /// Information about faces detected in an image, but not indexed, is returned
  /// in an array of <a>UnindexedFace</a> objects, <code>UnindexedFaces</code>.
  /// Faces aren't indexed for reasons such as:
  ///
  /// <ul>
  /// <li>
  /// The number of faces detected exceeds the value of the
  /// <code>MaxFaces</code> request parameter.
  /// </li>
  /// <li>
  /// The face is too small compared to the image dimensions.
  /// </li>
  /// <li>
  /// The face is too blurry.
  /// </li>
  /// <li>
  /// The image is too dark.
  /// </li>
  /// <li>
  /// The face has an extreme pose.
  /// </li>
  /// <li>
  /// The face doesn’t have enough detail to be suitable for face search.
  /// </li>
  /// </ul>
  /// In response, the <code>IndexFaces</code> operation returns an array of
  /// metadata for all detected faces, <code>FaceRecords</code>. This includes:
  ///
  /// <ul>
  /// <li>
  /// The bounding box, <code>BoundingBox</code>, of the detected face.
  /// </li>
  /// <li>
  /// A confidence value, <code>Confidence</code>, which indicates the
  /// confidence that the bounding box contains a face.
  /// </li>
  /// <li>
  /// A face ID, <code>FaceId</code>, assigned by the service for each face
  /// that's detected and stored.
  /// </li>
  /// <li>
  /// An image ID, <code>ImageId</code>, assigned by the service for the input
  /// image.
  /// </li>
  /// </ul>
  /// If you request all facial attributes (by using the
  /// <code>detectionAttributes</code> parameter), Amazon Rekognition returns
  /// detailed facial attributes, such as facial landmarks (for example,
  /// location of eye and mouth) and other facial attributes. If you provide the
  /// same image, specify the same collection, and use the same external ID in
  /// the <code>IndexFaces</code> operation, Amazon Rekognition doesn't save
  /// duplicate face metadata.
  /// <p/>
  /// The input image is passed either as base64-encoded image bytes, or as a
  /// reference to an image in an Amazon S3 bucket. If you use the AWS CLI to
  /// call Amazon Rekognition operations, passing image bytes isn't supported.
  /// The image must be formatted as a PNG or JPEG file.
  ///
  /// This operation requires permissions to perform the
  /// <code>rekognition:IndexFaces</code> action.
  ///
  /// May throw [InvalidS3ObjectException].
  /// May throw [InvalidParameterException].
  /// May throw [ImageTooLargeException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidImageFormatException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [collectionId] :
  /// The ID of an existing collection to which you want to add the faces that
  /// are detected in the input images.
  ///
  /// Parameter [image] :
  /// The input image as base64-encoded bytes or an S3 object. If you use the
  /// AWS CLI to call Amazon Rekognition operations, passing base64-encoded
  /// image bytes isn't supported.
  ///
  /// If you are using an AWS SDK to call Amazon Rekognition, you might not need
  /// to base64-encode image bytes passed using the <code>Bytes</code> field.
  /// For more information, see Images in the Amazon Rekognition developer
  /// guide.
  ///
  /// Parameter [detectionAttributes] :
  /// An array of facial attributes that you want to be returned. This can be
  /// the default list of attributes or all attributes. If you don't specify a
  /// value for <code>Attributes</code> or if you specify
  /// <code>["DEFAULT"]</code>, the API returns the following subset of facial
  /// attributes: <code>BoundingBox</code>, <code>Confidence</code>,
  /// <code>Pose</code>, <code>Quality</code>, and <code>Landmarks</code>. If
  /// you provide <code>["ALL"]</code>, all facial attributes are returned, but
  /// the operation takes longer to complete.
  ///
  /// If you provide both, <code>["ALL", "DEFAULT"]</code>, the service uses a
  /// logical AND operator to determine which attributes to return (in this
  /// case, all attributes).
  ///
  /// Parameter [externalImageId] :
  /// The ID you want to assign to all the faces detected in the image.
  ///
  /// Parameter [maxFaces] :
  /// The maximum number of faces to index. The value of <code>MaxFaces</code>
  /// must be greater than or equal to 1. <code>IndexFaces</code> returns no
  /// more than 100 detected faces in an image, even if you specify a larger
  /// value for <code>MaxFaces</code>.
  ///
  /// If <code>IndexFaces</code> detects more faces than the value of
  /// <code>MaxFaces</code>, the faces with the lowest quality are filtered out
  /// first. If there are still more faces than the value of
  /// <code>MaxFaces</code>, the faces with the smallest bounding boxes are
  /// filtered out (up to the number that's needed to satisfy the value of
  /// <code>MaxFaces</code>). Information about the unindexed faces is available
  /// in the <code>UnindexedFaces</code> array.
  ///
  /// The faces that are returned by <code>IndexFaces</code> are sorted by the
  /// largest face bounding box size to the smallest size, in descending order.
  ///
  /// <code>MaxFaces</code> can be used with a collection associated with any
  /// version of the face model.
  ///
  /// Parameter [qualityFilter] :
  /// A filter that specifies a quality bar for how much filtering is done to
  /// identify faces. Filtered faces aren't indexed. If you specify
  /// <code>AUTO</code>, Amazon Rekognition chooses the quality bar. If you
  /// specify <code>LOW</code>, <code>MEDIUM</code>, or <code>HIGH</code>,
  /// filtering removes all faces that don’t meet the chosen quality bar. The
  /// default value is <code>AUTO</code>. The quality bar is based on a variety
  /// of common use cases. Low-quality detections can occur for a number of
  /// reasons. Some examples are an object that's misidentified as a face, a
  /// face that's too blurry, or a face with a pose that's too extreme to use.
  /// If you specify <code>NONE</code>, no filtering is performed.
  ///
  /// To use quality filtering, the collection you are using must be associated
  /// with version 3 of the face model or higher.
  Future<IndexFacesResponse> indexFaces({
    @_s.required String collectionId,
    @_s.required Image image,
    List<Attribute> detectionAttributes,
    String externalImageId,
    int maxFaces,
    QualityFilter qualityFilter,
  }) async {
    ArgumentError.checkNotNull(collectionId, 'collectionId');
    _s.validateStringLength(
      'collectionId',
      collectionId,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'collectionId',
      collectionId,
      r'''[a-zA-Z0-9_.\-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(image, 'image');
    _s.validateStringLength(
      'externalImageId',
      externalImageId,
      1,
      255,
    );
    _s.validateStringPattern(
      'externalImageId',
      externalImageId,
      r'''[a-zA-Z0-9_.\-:]+''',
    );
    _s.validateNumRange(
      'maxFaces',
      maxFaces,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.IndexFaces'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CollectionId': collectionId,
        'Image': image,
        if (detectionAttributes != null)
          'DetectionAttributes':
              detectionAttributes.map((e) => e?.toValue() ?? '').toList(),
        if (externalImageId != null) 'ExternalImageId': externalImageId,
        if (maxFaces != null) 'MaxFaces': maxFaces,
        if (qualityFilter != null) 'QualityFilter': qualityFilter.toValue(),
      },
    );

    return IndexFacesResponse.fromJson(jsonResponse.body);
  }

  /// Returns list of collection IDs in your account. If the result is
  /// truncated, the response also provides a <code>NextToken</code> that you
  /// can use in the subsequent request to fetch the next set of collection IDs.
  ///
  /// For an example, see Listing Collections in the Amazon Rekognition
  /// Developer Guide.
  ///
  /// This operation requires permissions to perform the
  /// <code>rekognition:ListCollections</code> action.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [maxResults] :
  /// Maximum number of collection IDs to return.
  ///
  /// Parameter [nextToken] :
  /// Pagination token from the previous response.
  Future<ListCollectionsResponse> listCollections({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      4096,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.ListCollections'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListCollectionsResponse.fromJson(jsonResponse.body);
  }

  /// Returns metadata for faces in the specified collection. This metadata
  /// includes information such as the bounding box coordinates, the confidence
  /// (that the bounding box contains a face), and face ID. For an example, see
  /// Listing Faces in a Collection in the Amazon Rekognition Developer Guide.
  ///
  /// This operation requires permissions to perform the
  /// <code>rekognition:ListFaces</code> action.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [collectionId] :
  /// ID of the collection from which to list the faces.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of faces to return.
  ///
  /// Parameter [nextToken] :
  /// If the previous response was incomplete (because there is more data to
  /// retrieve), Amazon Rekognition returns a pagination token in the response.
  /// You can use this pagination token to retrieve the next set of faces.
  Future<ListFacesResponse> listFaces({
    @_s.required String collectionId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(collectionId, 'collectionId');
    _s.validateStringLength(
      'collectionId',
      collectionId,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'collectionId',
      collectionId,
      r'''[a-zA-Z0-9_.\-]+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      4096,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.ListFaces'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CollectionId': collectionId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListFacesResponse.fromJson(jsonResponse.body);
  }

  /// Gets a list of stream processors that you have created with
  /// <a>CreateStreamProcessor</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [ProvisionedThroughputExceededException].
  ///
  /// Parameter [maxResults] :
  /// Maximum number of stream processors you want Amazon Rekognition Video to
  /// return in the response. The default is 1000.
  ///
  /// Parameter [nextToken] :
  /// If the previous response was incomplete (because there are more stream
  /// processors to retrieve), Amazon Rekognition Video returns a pagination
  /// token in the response. You can use this pagination token to retrieve the
  /// next set of stream processors.
  Future<ListStreamProcessorsResponse> listStreamProcessors({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.ListStreamProcessors'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListStreamProcessorsResponse.fromJson(jsonResponse.body);
  }

  /// Returns an array of celebrities recognized in the input image. For more
  /// information, see Recognizing Celebrities in the Amazon Rekognition
  /// Developer Guide.
  ///
  /// <code>RecognizeCelebrities</code> returns the 64 largest faces in the
  /// image. It lists recognized celebrities in the <code>CelebrityFaces</code>
  /// array and unrecognized faces in the <code>UnrecognizedFaces</code> array.
  /// <code>RecognizeCelebrities</code> doesn't return celebrities whose faces
  /// aren't among the largest 64 faces in the image.
  ///
  /// For each celebrity recognized, <code>RecognizeCelebrities</code> returns a
  /// <code>Celebrity</code> object. The <code>Celebrity</code> object contains
  /// the celebrity name, ID, URL links to additional information, match
  /// confidence, and a <code>ComparedFace</code> object that you can use to
  /// locate the celebrity's face on the image.
  ///
  /// Amazon Rekognition doesn't retain information about which images a
  /// celebrity has been recognized in. Your application must store this
  /// information and use the <code>Celebrity</code> ID property as a unique
  /// identifier for the celebrity. If you don't store the celebrity name or
  /// additional information URLs returned by <code>RecognizeCelebrities</code>,
  /// you will need the ID to identify the celebrity in a call to the
  /// <a>GetCelebrityInfo</a> operation.
  ///
  /// You pass the input image either as base64-encoded image bytes or as a
  /// reference to an image in an Amazon S3 bucket. If you use the AWS CLI to
  /// call Amazon Rekognition operations, passing image bytes is not supported.
  /// The image must be either a PNG or JPEG formatted file.
  ///
  /// For an example, see Recognizing Celebrities in an Image in the Amazon
  /// Rekognition Developer Guide.
  ///
  /// This operation requires permissions to perform the
  /// <code>rekognition:RecognizeCelebrities</code> operation.
  ///
  /// May throw [InvalidS3ObjectException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidImageFormatException].
  /// May throw [ImageTooLargeException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [InvalidImageFormatException].
  ///
  /// Parameter [image] :
  /// The input image as base64-encoded bytes or an S3 object. If you use the
  /// AWS CLI to call Amazon Rekognition operations, passing base64-encoded
  /// image bytes is not supported.
  ///
  /// If you are using an AWS SDK to call Amazon Rekognition, you might not need
  /// to base64-encode image bytes passed using the <code>Bytes</code> field.
  /// For more information, see Images in the Amazon Rekognition developer
  /// guide.
  Future<RecognizeCelebritiesResponse> recognizeCelebrities({
    @_s.required Image image,
  }) async {
    ArgumentError.checkNotNull(image, 'image');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.RecognizeCelebrities'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Image': image,
      },
    );

    return RecognizeCelebritiesResponse.fromJson(jsonResponse.body);
  }

  /// For a given input face ID, searches for matching faces in the collection
  /// the face belongs to. You get a face ID when you add a face to the
  /// collection using the <a>IndexFaces</a> operation. The operation compares
  /// the features of the input face with faces in the specified collection.
  /// <note>
  /// You can also search faces without indexing faces by using the
  /// <code>SearchFacesByImage</code> operation.
  /// </note>
  /// The operation response returns an array of faces that match, ordered by
  /// similarity score with the highest similarity first. More specifically, it
  /// is an array of metadata for each face match that is found. Along with the
  /// metadata, the response also includes a <code>confidence</code> value for
  /// each face match, indicating the confidence that the specific face matches
  /// the input face.
  ///
  /// For an example, see Searching for a Face Using Its Face ID in the Amazon
  /// Rekognition Developer Guide.
  ///
  /// This operation requires permissions to perform the
  /// <code>rekognition:SearchFaces</code> action.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [collectionId] :
  /// ID of the collection the face belongs to.
  ///
  /// Parameter [faceId] :
  /// ID of a face to find matches for in the collection.
  ///
  /// Parameter [faceMatchThreshold] :
  /// Optional value specifying the minimum confidence in the face match to
  /// return. For example, don't return any matches where confidence in matches
  /// is less than 70%. The default value is 80%.
  ///
  /// Parameter [maxFaces] :
  /// Maximum number of faces to return. The operation returns the maximum
  /// number of faces with the highest confidence in the match.
  Future<SearchFacesResponse> searchFaces({
    @_s.required String collectionId,
    @_s.required String faceId,
    double faceMatchThreshold,
    int maxFaces,
  }) async {
    ArgumentError.checkNotNull(collectionId, 'collectionId');
    _s.validateStringLength(
      'collectionId',
      collectionId,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'collectionId',
      collectionId,
      r'''[a-zA-Z0-9_.\-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(faceId, 'faceId');
    _s.validateStringPattern(
      'faceId',
      faceId,
      r'''[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}''',
      isRequired: true,
    );
    _s.validateNumRange(
      'faceMatchThreshold',
      faceMatchThreshold,
      0,
      100,
    );
    _s.validateNumRange(
      'maxFaces',
      maxFaces,
      1,
      4096,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.SearchFaces'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CollectionId': collectionId,
        'FaceId': faceId,
        if (faceMatchThreshold != null)
          'FaceMatchThreshold': faceMatchThreshold,
        if (maxFaces != null) 'MaxFaces': maxFaces,
      },
    );

    return SearchFacesResponse.fromJson(jsonResponse.body);
  }

  /// For a given input image, first detects the largest face in the image, and
  /// then searches the specified collection for matching faces. The operation
  /// compares the features of the input face with faces in the specified
  /// collection.
  /// <note>
  /// To search for all faces in an input image, you might first call the
  /// <a>IndexFaces</a> operation, and then use the face IDs returned in
  /// subsequent calls to the <a>SearchFaces</a> operation.
  ///
  /// You can also call the <code>DetectFaces</code> operation and use the
  /// bounding boxes in the response to make face crops, which then you can pass
  /// in to the <code>SearchFacesByImage</code> operation.
  /// </note>
  /// You pass the input image either as base64-encoded image bytes or as a
  /// reference to an image in an Amazon S3 bucket. If you use the AWS CLI to
  /// call Amazon Rekognition operations, passing image bytes is not supported.
  /// The image must be either a PNG or JPEG formatted file.
  ///
  /// The response returns an array of faces that match, ordered by similarity
  /// score with the highest similarity first. More specifically, it is an array
  /// of metadata for each face match found. Along with the metadata, the
  /// response also includes a <code>similarity</code> indicating how similar
  /// the face is to the input face. In the response, the operation also returns
  /// the bounding box (and a confidence level that the bounding box contains a
  /// face) of the face that Amazon Rekognition used for the input image.
  ///
  /// For an example, Searching for a Face Using an Image in the Amazon
  /// Rekognition Developer Guide.
  ///
  /// The <code>QualityFilter</code> input parameter allows you to filter out
  /// detected faces that don’t meet a required quality bar. The quality bar is
  /// based on a variety of common use cases. Use <code>QualityFilter</code> to
  /// set the quality bar for filtering by specifying <code>LOW</code>,
  /// <code>MEDIUM</code>, or <code>HIGH</code>. If you do not want to filter
  /// detected faces, specify <code>NONE</code>. The default value is
  /// <code>NONE</code>.
  /// <note>
  /// To use quality filtering, you need a collection associated with version 3
  /// of the face model or higher. To get the version of the face model
  /// associated with a collection, call <a>DescribeCollection</a>.
  /// </note>
  /// This operation requires permissions to perform the
  /// <code>rekognition:SearchFacesByImage</code> action.
  ///
  /// May throw [InvalidS3ObjectException].
  /// May throw [InvalidParameterException].
  /// May throw [ImageTooLargeException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidImageFormatException].
  ///
  /// Parameter [collectionId] :
  /// ID of the collection to search.
  ///
  /// Parameter [image] :
  /// The input image as base64-encoded bytes or an S3 object. If you use the
  /// AWS CLI to call Amazon Rekognition operations, passing base64-encoded
  /// image bytes is not supported.
  ///
  /// If you are using an AWS SDK to call Amazon Rekognition, you might not need
  /// to base64-encode image bytes passed using the <code>Bytes</code> field.
  /// For more information, see Images in the Amazon Rekognition developer
  /// guide.
  ///
  /// Parameter [faceMatchThreshold] :
  /// (Optional) Specifies the minimum confidence in the face match to return.
  /// For example, don't return any matches where confidence in matches is less
  /// than 70%. The default value is 80%.
  ///
  /// Parameter [maxFaces] :
  /// Maximum number of faces to return. The operation returns the maximum
  /// number of faces with the highest confidence in the match.
  ///
  /// Parameter [qualityFilter] :
  /// A filter that specifies a quality bar for how much filtering is done to
  /// identify faces. Filtered faces aren't searched for in the collection. If
  /// you specify <code>AUTO</code>, Amazon Rekognition chooses the quality bar.
  /// If you specify <code>LOW</code>, <code>MEDIUM</code>, or
  /// <code>HIGH</code>, filtering removes all faces that don’t meet the chosen
  /// quality bar. The quality bar is based on a variety of common use cases.
  /// Low-quality detections can occur for a number of reasons. Some examples
  /// are an object that's misidentified as a face, a face that's too blurry, or
  /// a face with a pose that's too extreme to use. If you specify
  /// <code>NONE</code>, no filtering is performed. The default value is
  /// <code>NONE</code>.
  ///
  /// To use quality filtering, the collection you are using must be associated
  /// with version 3 of the face model or higher.
  Future<SearchFacesByImageResponse> searchFacesByImage({
    @_s.required String collectionId,
    @_s.required Image image,
    double faceMatchThreshold,
    int maxFaces,
    QualityFilter qualityFilter,
  }) async {
    ArgumentError.checkNotNull(collectionId, 'collectionId');
    _s.validateStringLength(
      'collectionId',
      collectionId,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'collectionId',
      collectionId,
      r'''[a-zA-Z0-9_.\-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(image, 'image');
    _s.validateNumRange(
      'faceMatchThreshold',
      faceMatchThreshold,
      0,
      100,
    );
    _s.validateNumRange(
      'maxFaces',
      maxFaces,
      1,
      4096,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.SearchFacesByImage'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CollectionId': collectionId,
        'Image': image,
        if (faceMatchThreshold != null)
          'FaceMatchThreshold': faceMatchThreshold,
        if (maxFaces != null) 'MaxFaces': maxFaces,
        if (qualityFilter != null) 'QualityFilter': qualityFilter.toValue(),
      },
    );

    return SearchFacesByImageResponse.fromJson(jsonResponse.body);
  }

  /// Starts asynchronous recognition of celebrities in a stored video.
  ///
  /// Amazon Rekognition Video can detect celebrities in a video must be stored
  /// in an Amazon S3 bucket. Use <a>Video</a> to specify the bucket name and
  /// the filename of the video. <code>StartCelebrityRecognition</code> returns
  /// a job identifier (<code>JobId</code>) which you use to get the results of
  /// the analysis. When celebrity recognition analysis is finished, Amazon
  /// Rekognition Video publishes a completion status to the Amazon Simple
  /// Notification Service topic that you specify in
  /// <code>NotificationChannel</code>. To get the results of the celebrity
  /// recognition analysis, first check that the status value published to the
  /// Amazon SNS topic is <code>SUCCEEDED</code>. If so, call
  /// <a>GetCelebrityRecognition</a> and pass the job identifier
  /// (<code>JobId</code>) from the initial call to
  /// <code>StartCelebrityRecognition</code>.
  ///
  /// For more information, see Recognizing Celebrities in the Amazon
  /// Rekognition Developer Guide.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidS3ObjectException].
  /// May throw [InternalServerError].
  /// May throw [VideoTooLargeException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [video] :
  /// The video in which you want to recognize celebrities. The video must be
  /// stored in an Amazon S3 bucket.
  ///
  /// Parameter [clientRequestToken] :
  /// Idempotent token used to identify the start request. If you use the same
  /// token with multiple <code>StartCelebrityRecognition</code> requests, the
  /// same <code>JobId</code> is returned. Use <code>ClientRequestToken</code>
  /// to prevent the same job from being accidently started more than once.
  ///
  /// Parameter [jobTag] :
  /// An identifier you specify that's returned in the completion notification
  /// that's published to your Amazon Simple Notification Service topic. For
  /// example, you can use <code>JobTag</code> to group related jobs and
  /// identify them in the completion notification.
  ///
  /// Parameter [notificationChannel] :
  /// The Amazon SNS topic ARN that you want Amazon Rekognition Video to publish
  /// the completion status of the celebrity recognition analysis to.
  Future<StartCelebrityRecognitionResponse> startCelebrityRecognition({
    @_s.required Video video,
    String clientRequestToken,
    String jobTag,
    NotificationChannel notificationChannel,
  }) async {
    ArgumentError.checkNotNull(video, 'video');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''^[a-zA-Z0-9-_]+$''',
    );
    _s.validateStringLength(
      'jobTag',
      jobTag,
      1,
      256,
    );
    _s.validateStringPattern(
      'jobTag',
      jobTag,
      r'''[a-zA-Z0-9_.\-:]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.StartCelebrityRecognition'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Video': video,
        if (clientRequestToken != null)
          'ClientRequestToken': clientRequestToken,
        if (jobTag != null) 'JobTag': jobTag,
        if (notificationChannel != null)
          'NotificationChannel': notificationChannel,
      },
    );

    return StartCelebrityRecognitionResponse.fromJson(jsonResponse.body);
  }

  /// Starts asynchronous detection of unsafe content in a stored video.
  ///
  /// Amazon Rekognition Video can moderate content in a video stored in an
  /// Amazon S3 bucket. Use <a>Video</a> to specify the bucket name and the
  /// filename of the video. <code>StartContentModeration</code> returns a job
  /// identifier (<code>JobId</code>) which you use to get the results of the
  /// analysis. When unsafe content analysis is finished, Amazon Rekognition
  /// Video publishes a completion status to the Amazon Simple Notification
  /// Service topic that you specify in <code>NotificationChannel</code>.
  ///
  /// To get the results of the unsafe content analysis, first check that the
  /// status value published to the Amazon SNS topic is <code>SUCCEEDED</code>.
  /// If so, call <a>GetContentModeration</a> and pass the job identifier
  /// (<code>JobId</code>) from the initial call to
  /// <code>StartContentModeration</code>.
  ///
  /// For more information, see Detecting Unsafe Content in the Amazon
  /// Rekognition Developer Guide.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidS3ObjectException].
  /// May throw [InternalServerError].
  /// May throw [VideoTooLargeException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [video] :
  /// The video in which you want to detect unsafe content. The video must be
  /// stored in an Amazon S3 bucket.
  ///
  /// Parameter [clientRequestToken] :
  /// Idempotent token used to identify the start request. If you use the same
  /// token with multiple <code>StartContentModeration</code> requests, the same
  /// <code>JobId</code> is returned. Use <code>ClientRequestToken</code> to
  /// prevent the same job from being accidently started more than once.
  ///
  /// Parameter [jobTag] :
  /// An identifier you specify that's returned in the completion notification
  /// that's published to your Amazon Simple Notification Service topic. For
  /// example, you can use <code>JobTag</code> to group related jobs and
  /// identify them in the completion notification.
  ///
  /// Parameter [minConfidence] :
  /// Specifies the minimum confidence that Amazon Rekognition must have in
  /// order to return a moderated content label. Confidence represents how
  /// certain Amazon Rekognition is that the moderated content is correctly
  /// identified. 0 is the lowest confidence. 100 is the highest confidence.
  /// Amazon Rekognition doesn't return any moderated content labels with a
  /// confidence level lower than this specified value. If you don't specify
  /// <code>MinConfidence</code>, <code>GetContentModeration</code> returns
  /// labels with confidence values greater than or equal to 50 percent.
  ///
  /// Parameter [notificationChannel] :
  /// The Amazon SNS topic ARN that you want Amazon Rekognition Video to publish
  /// the completion status of the unsafe content analysis to.
  Future<StartContentModerationResponse> startContentModeration({
    @_s.required Video video,
    String clientRequestToken,
    String jobTag,
    double minConfidence,
    NotificationChannel notificationChannel,
  }) async {
    ArgumentError.checkNotNull(video, 'video');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''^[a-zA-Z0-9-_]+$''',
    );
    _s.validateStringLength(
      'jobTag',
      jobTag,
      1,
      256,
    );
    _s.validateStringPattern(
      'jobTag',
      jobTag,
      r'''[a-zA-Z0-9_.\-:]+''',
    );
    _s.validateNumRange(
      'minConfidence',
      minConfidence,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.StartContentModeration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Video': video,
        if (clientRequestToken != null)
          'ClientRequestToken': clientRequestToken,
        if (jobTag != null) 'JobTag': jobTag,
        if (minConfidence != null) 'MinConfidence': minConfidence,
        if (notificationChannel != null)
          'NotificationChannel': notificationChannel,
      },
    );

    return StartContentModerationResponse.fromJson(jsonResponse.body);
  }

  /// Starts asynchronous detection of faces in a stored video.
  ///
  /// Amazon Rekognition Video can detect faces in a video stored in an Amazon
  /// S3 bucket. Use <a>Video</a> to specify the bucket name and the filename of
  /// the video. <code>StartFaceDetection</code> returns a job identifier
  /// (<code>JobId</code>) that you use to get the results of the operation.
  /// When face detection is finished, Amazon Rekognition Video publishes a
  /// completion status to the Amazon Simple Notification Service topic that you
  /// specify in <code>NotificationChannel</code>. To get the results of the
  /// face detection operation, first check that the status value published to
  /// the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call
  /// <a>GetFaceDetection</a> and pass the job identifier (<code>JobId</code>)
  /// from the initial call to <code>StartFaceDetection</code>.
  ///
  /// For more information, see Detecting Faces in a Stored Video in the Amazon
  /// Rekognition Developer Guide.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidS3ObjectException].
  /// May throw [InternalServerError].
  /// May throw [VideoTooLargeException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [video] :
  /// The video in which you want to detect faces. The video must be stored in
  /// an Amazon S3 bucket.
  ///
  /// Parameter [clientRequestToken] :
  /// Idempotent token used to identify the start request. If you use the same
  /// token with multiple <code>StartFaceDetection</code> requests, the same
  /// <code>JobId</code> is returned. Use <code>ClientRequestToken</code> to
  /// prevent the same job from being accidently started more than once.
  ///
  /// Parameter [faceAttributes] :
  /// The face attributes you want returned.
  ///
  /// <code>DEFAULT</code> - The following subset of facial attributes are
  /// returned: BoundingBox, Confidence, Pose, Quality and Landmarks.
  ///
  /// <code>ALL</code> - All facial attributes are returned.
  ///
  /// Parameter [jobTag] :
  /// An identifier you specify that's returned in the completion notification
  /// that's published to your Amazon Simple Notification Service topic. For
  /// example, you can use <code>JobTag</code> to group related jobs and
  /// identify them in the completion notification.
  ///
  /// Parameter [notificationChannel] :
  /// The ARN of the Amazon SNS topic to which you want Amazon Rekognition Video
  /// to publish the completion status of the face detection operation.
  Future<StartFaceDetectionResponse> startFaceDetection({
    @_s.required Video video,
    String clientRequestToken,
    FaceAttributes faceAttributes,
    String jobTag,
    NotificationChannel notificationChannel,
  }) async {
    ArgumentError.checkNotNull(video, 'video');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''^[a-zA-Z0-9-_]+$''',
    );
    _s.validateStringLength(
      'jobTag',
      jobTag,
      1,
      256,
    );
    _s.validateStringPattern(
      'jobTag',
      jobTag,
      r'''[a-zA-Z0-9_.\-:]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.StartFaceDetection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Video': video,
        if (clientRequestToken != null)
          'ClientRequestToken': clientRequestToken,
        if (faceAttributes != null) 'FaceAttributes': faceAttributes.toValue(),
        if (jobTag != null) 'JobTag': jobTag,
        if (notificationChannel != null)
          'NotificationChannel': notificationChannel,
      },
    );

    return StartFaceDetectionResponse.fromJson(jsonResponse.body);
  }

  /// Starts the asynchronous search for faces in a collection that match the
  /// faces of persons detected in a stored video.
  ///
  /// The video must be stored in an Amazon S3 bucket. Use <a>Video</a> to
  /// specify the bucket name and the filename of the video.
  /// <code>StartFaceSearch</code> returns a job identifier (<code>JobId</code>)
  /// which you use to get the search results once the search has completed.
  /// When searching is finished, Amazon Rekognition Video publishes a
  /// completion status to the Amazon Simple Notification Service topic that you
  /// specify in <code>NotificationChannel</code>. To get the search results,
  /// first check that the status value published to the Amazon SNS topic is
  /// <code>SUCCEEDED</code>. If so, call <a>GetFaceSearch</a> and pass the job
  /// identifier (<code>JobId</code>) from the initial call to
  /// <code>StartFaceSearch</code>. For more information, see
  /// <a>procedure-person-search-videos</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidS3ObjectException].
  /// May throw [InternalServerError].
  /// May throw [VideoTooLargeException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [collectionId] :
  /// ID of the collection that contains the faces you want to search for.
  ///
  /// Parameter [video] :
  /// The video you want to search. The video must be stored in an Amazon S3
  /// bucket.
  ///
  /// Parameter [clientRequestToken] :
  /// Idempotent token used to identify the start request. If you use the same
  /// token with multiple <code>StartFaceSearch</code> requests, the same
  /// <code>JobId</code> is returned. Use <code>ClientRequestToken</code> to
  /// prevent the same job from being accidently started more than once.
  ///
  /// Parameter [faceMatchThreshold] :
  /// The minimum confidence in the person match to return. For example, don't
  /// return any matches where confidence in matches is less than 70%. The
  /// default value is 80%.
  ///
  /// Parameter [jobTag] :
  /// An identifier you specify that's returned in the completion notification
  /// that's published to your Amazon Simple Notification Service topic. For
  /// example, you can use <code>JobTag</code> to group related jobs and
  /// identify them in the completion notification.
  ///
  /// Parameter [notificationChannel] :
  /// The ARN of the Amazon SNS topic to which you want Amazon Rekognition Video
  /// to publish the completion status of the search.
  Future<StartFaceSearchResponse> startFaceSearch({
    @_s.required String collectionId,
    @_s.required Video video,
    String clientRequestToken,
    double faceMatchThreshold,
    String jobTag,
    NotificationChannel notificationChannel,
  }) async {
    ArgumentError.checkNotNull(collectionId, 'collectionId');
    _s.validateStringLength(
      'collectionId',
      collectionId,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'collectionId',
      collectionId,
      r'''[a-zA-Z0-9_.\-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(video, 'video');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''^[a-zA-Z0-9-_]+$''',
    );
    _s.validateNumRange(
      'faceMatchThreshold',
      faceMatchThreshold,
      0,
      100,
    );
    _s.validateStringLength(
      'jobTag',
      jobTag,
      1,
      256,
    );
    _s.validateStringPattern(
      'jobTag',
      jobTag,
      r'''[a-zA-Z0-9_.\-:]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.StartFaceSearch'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CollectionId': collectionId,
        'Video': video,
        if (clientRequestToken != null)
          'ClientRequestToken': clientRequestToken,
        if (faceMatchThreshold != null)
          'FaceMatchThreshold': faceMatchThreshold,
        if (jobTag != null) 'JobTag': jobTag,
        if (notificationChannel != null)
          'NotificationChannel': notificationChannel,
      },
    );

    return StartFaceSearchResponse.fromJson(jsonResponse.body);
  }

  /// Starts asynchronous detection of labels in a stored video.
  ///
  /// Amazon Rekognition Video can detect labels in a video. Labels are
  /// instances of real-world entities. This includes objects like flower, tree,
  /// and table; events like wedding, graduation, and birthday party; concepts
  /// like landscape, evening, and nature; and activities like a person getting
  /// out of a car or a person skiing.
  ///
  /// The video must be stored in an Amazon S3 bucket. Use <a>Video</a> to
  /// specify the bucket name and the filename of the video.
  /// <code>StartLabelDetection</code> returns a job identifier
  /// (<code>JobId</code>) which you use to get the results of the operation.
  /// When label detection is finished, Amazon Rekognition Video publishes a
  /// completion status to the Amazon Simple Notification Service topic that you
  /// specify in <code>NotificationChannel</code>.
  ///
  /// To get the results of the label detection operation, first check that the
  /// status value published to the Amazon SNS topic is <code>SUCCEEDED</code>.
  /// If so, call <a>GetLabelDetection</a> and pass the job identifier
  /// (<code>JobId</code>) from the initial call to
  /// <code>StartLabelDetection</code>.
  /// <p/>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidS3ObjectException].
  /// May throw [InternalServerError].
  /// May throw [VideoTooLargeException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [video] :
  /// The video in which you want to detect labels. The video must be stored in
  /// an Amazon S3 bucket.
  ///
  /// Parameter [clientRequestToken] :
  /// Idempotent token used to identify the start request. If you use the same
  /// token with multiple <code>StartLabelDetection</code> requests, the same
  /// <code>JobId</code> is returned. Use <code>ClientRequestToken</code> to
  /// prevent the same job from being accidently started more than once.
  ///
  /// Parameter [jobTag] :
  /// An identifier you specify that's returned in the completion notification
  /// that's published to your Amazon Simple Notification Service topic. For
  /// example, you can use <code>JobTag</code> to group related jobs and
  /// identify them in the completion notification.
  ///
  /// Parameter [minConfidence] :
  /// Specifies the minimum confidence that Amazon Rekognition Video must have
  /// in order to return a detected label. Confidence represents how certain
  /// Amazon Rekognition is that a label is correctly identified.0 is the lowest
  /// confidence. 100 is the highest confidence. Amazon Rekognition Video
  /// doesn't return any labels with a confidence level lower than this
  /// specified value.
  ///
  /// If you don't specify <code>MinConfidence</code>, the operation returns
  /// labels with confidence values greater than or equal to 50 percent.
  ///
  /// Parameter [notificationChannel] :
  /// The Amazon SNS topic ARN you want Amazon Rekognition Video to publish the
  /// completion status of the label detection operation to.
  Future<StartLabelDetectionResponse> startLabelDetection({
    @_s.required Video video,
    String clientRequestToken,
    String jobTag,
    double minConfidence,
    NotificationChannel notificationChannel,
  }) async {
    ArgumentError.checkNotNull(video, 'video');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''^[a-zA-Z0-9-_]+$''',
    );
    _s.validateStringLength(
      'jobTag',
      jobTag,
      1,
      256,
    );
    _s.validateStringPattern(
      'jobTag',
      jobTag,
      r'''[a-zA-Z0-9_.\-:]+''',
    );
    _s.validateNumRange(
      'minConfidence',
      minConfidence,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.StartLabelDetection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Video': video,
        if (clientRequestToken != null)
          'ClientRequestToken': clientRequestToken,
        if (jobTag != null) 'JobTag': jobTag,
        if (minConfidence != null) 'MinConfidence': minConfidence,
        if (notificationChannel != null)
          'NotificationChannel': notificationChannel,
      },
    );

    return StartLabelDetectionResponse.fromJson(jsonResponse.body);
  }

  /// Starts the asynchronous tracking of a person's path in a stored video.
  ///
  /// Amazon Rekognition Video can track the path of people in a video stored in
  /// an Amazon S3 bucket. Use <a>Video</a> to specify the bucket name and the
  /// filename of the video. <code>StartPersonTracking</code> returns a job
  /// identifier (<code>JobId</code>) which you use to get the results of the
  /// operation. When label detection is finished, Amazon Rekognition publishes
  /// a completion status to the Amazon Simple Notification Service topic that
  /// you specify in <code>NotificationChannel</code>.
  ///
  /// To get the results of the person detection operation, first check that the
  /// status value published to the Amazon SNS topic is <code>SUCCEEDED</code>.
  /// If so, call <a>GetPersonTracking</a> and pass the job identifier
  /// (<code>JobId</code>) from the initial call to
  /// <code>StartPersonTracking</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidS3ObjectException].
  /// May throw [InternalServerError].
  /// May throw [VideoTooLargeException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [video] :
  /// The video in which you want to detect people. The video must be stored in
  /// an Amazon S3 bucket.
  ///
  /// Parameter [clientRequestToken] :
  /// Idempotent token used to identify the start request. If you use the same
  /// token with multiple <code>StartPersonTracking</code> requests, the same
  /// <code>JobId</code> is returned. Use <code>ClientRequestToken</code> to
  /// prevent the same job from being accidently started more than once.
  ///
  /// Parameter [jobTag] :
  /// An identifier you specify that's returned in the completion notification
  /// that's published to your Amazon Simple Notification Service topic. For
  /// example, you can use <code>JobTag</code> to group related jobs and
  /// identify them in the completion notification.
  ///
  /// Parameter [notificationChannel] :
  /// The Amazon SNS topic ARN you want Amazon Rekognition Video to publish the
  /// completion status of the people detection operation to.
  Future<StartPersonTrackingResponse> startPersonTracking({
    @_s.required Video video,
    String clientRequestToken,
    String jobTag,
    NotificationChannel notificationChannel,
  }) async {
    ArgumentError.checkNotNull(video, 'video');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''^[a-zA-Z0-9-_]+$''',
    );
    _s.validateStringLength(
      'jobTag',
      jobTag,
      1,
      256,
    );
    _s.validateStringPattern(
      'jobTag',
      jobTag,
      r'''[a-zA-Z0-9_.\-:]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.StartPersonTracking'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Video': video,
        if (clientRequestToken != null)
          'ClientRequestToken': clientRequestToken,
        if (jobTag != null) 'JobTag': jobTag,
        if (notificationChannel != null)
          'NotificationChannel': notificationChannel,
      },
    );

    return StartPersonTrackingResponse.fromJson(jsonResponse.body);
  }

  /// Starts the running of the version of a model. Starting a model takes a
  /// while to complete. To check the current state of the model, use
  /// <a>DescribeProjectVersions</a>.
  ///
  /// Once the model is running, you can detect custom labels in new images by
  /// calling <a>DetectCustomLabels</a>.
  /// <note>
  /// You are charged for the amount of time that the model is running. To stop
  /// a running model, call <a>StopProjectVersion</a>.
  /// </note>
  /// This operation requires permissions to perform the
  /// <code>rekognition:StartProjectVersion</code> action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidParameterException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [ProvisionedThroughputExceededException].
  ///
  /// Parameter [minInferenceUnits] :
  /// The minimum number of inference units to use. A single inference unit
  /// represents 1 hour of processing and can support up to 5 Transaction Pers
  /// Second (TPS). Use a higher number to increase the TPS throughput of your
  /// model. You are charged for the number of inference units that you use.
  ///
  /// Parameter [projectVersionArn] :
  /// The Amazon Resource Name(ARN) of the model version that you want to start.
  Future<StartProjectVersionResponse> startProjectVersion({
    @_s.required int minInferenceUnits,
    @_s.required String projectVersionArn,
  }) async {
    ArgumentError.checkNotNull(minInferenceUnits, 'minInferenceUnits');
    _s.validateNumRange(
      'minInferenceUnits',
      minInferenceUnits,
      1,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(projectVersionArn, 'projectVersionArn');
    _s.validateStringLength(
      'projectVersionArn',
      projectVersionArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'projectVersionArn',
      projectVersionArn,
      r'''(^arn:[a-z\d-]+:rekognition:[a-z\d-]+:\d{12}:project\/[a-zA-Z0-9_.\-]{1,255}\/version\/[a-zA-Z0-9_.\-]{1,255}\/[0-9]+$)''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.StartProjectVersion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MinInferenceUnits': minInferenceUnits,
        'ProjectVersionArn': projectVersionArn,
      },
    );

    return StartProjectVersionResponse.fromJson(jsonResponse.body);
  }

  /// Starts asynchronous detection of segment detection in a stored video.
  ///
  /// Amazon Rekognition Video can detect segments in a video stored in an
  /// Amazon S3 bucket. Use <a>Video</a> to specify the bucket name and the
  /// filename of the video. <code>StartSegmentDetection</code> returns a job
  /// identifier (<code>JobId</code>) which you use to get the results of the
  /// operation. When segment detection is finished, Amazon Rekognition Video
  /// publishes a completion status to the Amazon Simple Notification Service
  /// topic that you specify in <code>NotificationChannel</code>.
  ///
  /// You can use the <code>Filters</code> (<a>StartSegmentDetectionFilters</a>)
  /// input parameter to specify the minimum detection confidence returned in
  /// the response. Within <code>Filters</code>, use <code>ShotFilter</code>
  /// (<a>StartShotDetectionFilter</a>) to filter detected shots. Use
  /// <code>TechnicalCueFilter</code> (<a>StartTechnicalCueDetectionFilter</a>)
  /// to filter technical cues.
  ///
  /// To get the results of the segment detection operation, first check that
  /// the status value published to the Amazon SNS topic is
  /// <code>SUCCEEDED</code>. if so, call <a>GetSegmentDetection</a> and pass
  /// the job identifier (<code>JobId</code>) from the initial call to
  /// <code>StartSegmentDetection</code>.
  ///
  /// For more information, see Detecting Video Segments in Stored Video in the
  /// Amazon Rekognition Developer Guide.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidS3ObjectException].
  /// May throw [InternalServerError].
  /// May throw [VideoTooLargeException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [segmentTypes] :
  /// An array of segment types to detect in the video. Valid values are
  /// TECHNICAL_CUE and SHOT.
  ///
  /// Parameter [clientRequestToken] :
  /// Idempotent token used to identify the start request. If you use the same
  /// token with multiple <code>StartSegmentDetection</code> requests, the same
  /// <code>JobId</code> is returned. Use <code>ClientRequestToken</code> to
  /// prevent the same job from being accidently started more than once.
  ///
  /// Parameter [filters] :
  /// Filters for technical cue or shot detection.
  ///
  /// Parameter [jobTag] :
  /// An identifier you specify that's returned in the completion notification
  /// that's published to your Amazon Simple Notification Service topic. For
  /// example, you can use <code>JobTag</code> to group related jobs and
  /// identify them in the completion notification.
  ///
  /// Parameter [notificationChannel] :
  /// The ARN of the Amazon SNS topic to which you want Amazon Rekognition Video
  /// to publish the completion status of the segment detection operation.
  Future<StartSegmentDetectionResponse> startSegmentDetection({
    @_s.required List<SegmentType> segmentTypes,
    @_s.required Video video,
    String clientRequestToken,
    StartSegmentDetectionFilters filters,
    String jobTag,
    NotificationChannel notificationChannel,
  }) async {
    ArgumentError.checkNotNull(segmentTypes, 'segmentTypes');
    ArgumentError.checkNotNull(video, 'video');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''^[a-zA-Z0-9-_]+$''',
    );
    _s.validateStringLength(
      'jobTag',
      jobTag,
      1,
      256,
    );
    _s.validateStringPattern(
      'jobTag',
      jobTag,
      r'''[a-zA-Z0-9_.\-:]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.StartSegmentDetection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SegmentTypes': segmentTypes?.map((e) => e?.toValue() ?? '')?.toList(),
        'Video': video,
        if (clientRequestToken != null)
          'ClientRequestToken': clientRequestToken,
        if (filters != null) 'Filters': filters,
        if (jobTag != null) 'JobTag': jobTag,
        if (notificationChannel != null)
          'NotificationChannel': notificationChannel,
      },
    );

    return StartSegmentDetectionResponse.fromJson(jsonResponse.body);
  }

  /// Starts processing a stream processor. You create a stream processor by
  /// calling <a>CreateStreamProcessor</a>. To tell
  /// <code>StartStreamProcessor</code> which stream processor to start, use the
  /// value of the <code>Name</code> field specified in the call to
  /// <code>CreateStreamProcessor</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [ProvisionedThroughputExceededException].
  ///
  /// Parameter [name] :
  /// The name of the stream processor to start processing.
  Future<void> startStreamProcessor({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[a-zA-Z0-9_.\-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.StartStreamProcessor'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
      },
    );

    return StartStreamProcessorResponse.fromJson(jsonResponse.body);
  }

  /// Starts asynchronous detection of text in a stored video.
  ///
  /// Amazon Rekognition Video can detect text in a video stored in an Amazon S3
  /// bucket. Use <a>Video</a> to specify the bucket name and the filename of
  /// the video. <code>StartTextDetection</code> returns a job identifier
  /// (<code>JobId</code>) which you use to get the results of the operation.
  /// When text detection is finished, Amazon Rekognition Video publishes a
  /// completion status to the Amazon Simple Notification Service topic that you
  /// specify in <code>NotificationChannel</code>.
  ///
  /// To get the results of the text detection operation, first check that the
  /// status value published to the Amazon SNS topic is <code>SUCCEEDED</code>.
  /// if so, call <a>GetTextDetection</a> and pass the job identifier
  /// (<code>JobId</code>) from the initial call to
  /// <code>StartTextDetection</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidS3ObjectException].
  /// May throw [InternalServerError].
  /// May throw [VideoTooLargeException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [clientRequestToken] :
  /// Idempotent token used to identify the start request. If you use the same
  /// token with multiple <code>StartTextDetection</code> requests, the same
  /// <code>JobId</code> is returned. Use <code>ClientRequestToken</code> to
  /// prevent the same job from being accidentaly started more than once.
  ///
  /// Parameter [filters] :
  /// Optional parameters that let you set criteria the text must meet to be
  /// included in your response.
  ///
  /// Parameter [jobTag] :
  /// An identifier returned in the completion status published by your Amazon
  /// Simple Notification Service topic. For example, you can use
  /// <code>JobTag</code> to group related jobs and identify them in the
  /// completion notification.
  Future<StartTextDetectionResponse> startTextDetection({
    @_s.required Video video,
    String clientRequestToken,
    StartTextDetectionFilters filters,
    String jobTag,
    NotificationChannel notificationChannel,
  }) async {
    ArgumentError.checkNotNull(video, 'video');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''^[a-zA-Z0-9-_]+$''',
    );
    _s.validateStringLength(
      'jobTag',
      jobTag,
      1,
      256,
    );
    _s.validateStringPattern(
      'jobTag',
      jobTag,
      r'''[a-zA-Z0-9_.\-:]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.StartTextDetection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Video': video,
        if (clientRequestToken != null)
          'ClientRequestToken': clientRequestToken,
        if (filters != null) 'Filters': filters,
        if (jobTag != null) 'JobTag': jobTag,
        if (notificationChannel != null)
          'NotificationChannel': notificationChannel,
      },
    );

    return StartTextDetectionResponse.fromJson(jsonResponse.body);
  }

  /// Stops a running model. The operation might take a while to complete. To
  /// check the current status, call <a>DescribeProjectVersions</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidParameterException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [ProvisionedThroughputExceededException].
  ///
  /// Parameter [projectVersionArn] :
  /// The Amazon Resource Name (ARN) of the model version that you want to
  /// delete.
  ///
  /// This operation requires permissions to perform the
  /// <code>rekognition:StopProjectVersion</code> action.
  Future<StopProjectVersionResponse> stopProjectVersion({
    @_s.required String projectVersionArn,
  }) async {
    ArgumentError.checkNotNull(projectVersionArn, 'projectVersionArn');
    _s.validateStringLength(
      'projectVersionArn',
      projectVersionArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'projectVersionArn',
      projectVersionArn,
      r'''(^arn:[a-z\d-]+:rekognition:[a-z\d-]+:\d{12}:project\/[a-zA-Z0-9_.\-]{1,255}\/version\/[a-zA-Z0-9_.\-]{1,255}\/[0-9]+$)''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.StopProjectVersion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProjectVersionArn': projectVersionArn,
      },
    );

    return StopProjectVersionResponse.fromJson(jsonResponse.body);
  }

  /// Stops a running stream processor that was created by
  /// <a>CreateStreamProcessor</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [ProvisionedThroughputExceededException].
  ///
  /// Parameter [name] :
  /// The name of a stream processor created by <a>CreateStreamProcessor</a>.
  Future<void> stopStreamProcessor({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[a-zA-Z0-9_.\-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.StopStreamProcessor'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
      },
    );

    return StopStreamProcessorResponse.fromJson(jsonResponse.body);
  }
}

/// Structure containing the estimated age range, in years, for a face.
///
/// Amazon Rekognition estimates an age range for faces detected in the input
/// image. Estimated age ranges can overlap. A face of a 5-year-old might have
/// an estimated range of 4-6, while the face of a 6-year-old might have an
/// estimated range of 4-8.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AgeRange {
  /// The highest estimated age.
  @_s.JsonKey(name: 'High')
  final int high;

  /// The lowest estimated age.
  @_s.JsonKey(name: 'Low')
  final int low;

  AgeRange({
    this.high,
    this.low,
  });
  factory AgeRange.fromJson(Map<String, dynamic> json) =>
      _$AgeRangeFromJson(json);
}

/// Assets are the images that you use to train and evaluate a model version.
/// Assets can also contain validation information that you use to debug a
/// failed model training.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Asset {
  @_s.JsonKey(name: 'GroundTruthManifest')
  final GroundTruthManifest groundTruthManifest;

  Asset({
    this.groundTruthManifest,
  });
  factory Asset.fromJson(Map<String, dynamic> json) => _$AssetFromJson(json);

  Map<String, dynamic> toJson() => _$AssetToJson(this);
}

enum Attribute {
  @_s.JsonValue('DEFAULT')
  $default,
  @_s.JsonValue('ALL')
  all,
}

extension on Attribute {
  String toValue() {
    switch (this) {
      case Attribute.$default:
        return 'DEFAULT';
      case Attribute.all:
        return 'ALL';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Metadata information about an audio stream. An array of
/// <code>AudioMetadata</code> objects for the audio streams found in a stored
/// video is returned by <a>GetSegmentDetection</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AudioMetadata {
  /// The audio codec used to encode or decode the audio stream.
  @_s.JsonKey(name: 'Codec')
  final String codec;

  /// The duration of the audio stream in milliseconds.
  @_s.JsonKey(name: 'DurationMillis')
  final int durationMillis;

  /// The number of audio channels in the segment.
  @_s.JsonKey(name: 'NumberOfChannels')
  final int numberOfChannels;

  /// The sample rate for the audio stream.
  @_s.JsonKey(name: 'SampleRate')
  final int sampleRate;

  AudioMetadata({
    this.codec,
    this.durationMillis,
    this.numberOfChannels,
    this.sampleRate,
  });
  factory AudioMetadata.fromJson(Map<String, dynamic> json) =>
      _$AudioMetadataFromJson(json);
}

/// Indicates whether or not the face has a beard, and the confidence level in
/// the determination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Beard {
  /// Level of confidence in the determination.
  @_s.JsonKey(name: 'Confidence')
  final double confidence;

  /// Boolean value that indicates whether the face has beard or not.
  @_s.JsonKey(name: 'Value')
  final bool value;

  Beard({
    this.confidence,
    this.value,
  });
  factory Beard.fromJson(Map<String, dynamic> json) => _$BeardFromJson(json);
}

enum BodyPart {
  @_s.JsonValue('FACE')
  face,
  @_s.JsonValue('HEAD')
  head,
  @_s.JsonValue('LEFT_HAND')
  leftHand,
  @_s.JsonValue('RIGHT_HAND')
  rightHand,
}

/// Identifies the bounding box around the label, face, text or personal
/// protective equipment. The <code>left</code> (x-coordinate) and
/// <code>top</code> (y-coordinate) are coordinates representing the top and
/// left sides of the bounding box. Note that the upper-left corner of the image
/// is the origin (0,0).
///
/// The <code>top</code> and <code>left</code> values returned are ratios of the
/// overall image size. For example, if the input image is 700x200 pixels, and
/// the top-left coordinate of the bounding box is 350x50 pixels, the API
/// returns a <code>left</code> value of 0.5 (350/700) and a <code>top</code>
/// value of 0.25 (50/200).
///
/// The <code>width</code> and <code>height</code> values represent the
/// dimensions of the bounding box as a ratio of the overall image dimension.
/// For example, if the input image is 700x200 pixels, and the bounding box
/// width is 70 pixels, the width returned is 0.1.
/// <note>
/// The bounding box coordinates can have negative values. For example, if
/// Amazon Rekognition is able to detect a face that is at the image edge and is
/// only partially visible, the service can return coordinates that are outside
/// the image bounds and, depending on the image edge, you might get negative
/// values or values greater than 1 for the <code>left</code> or
/// <code>top</code> values.
/// </note>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class BoundingBox {
  /// Height of the bounding box as a ratio of the overall image height.
  @_s.JsonKey(name: 'Height')
  final double height;

  /// Left coordinate of the bounding box as a ratio of overall image width.
  @_s.JsonKey(name: 'Left')
  final double left;

  /// Top coordinate of the bounding box as a ratio of overall image height.
  @_s.JsonKey(name: 'Top')
  final double top;

  /// Width of the bounding box as a ratio of the overall image width.
  @_s.JsonKey(name: 'Width')
  final double width;

  BoundingBox({
    this.height,
    this.left,
    this.top,
    this.width,
  });
  factory BoundingBox.fromJson(Map<String, dynamic> json) =>
      _$BoundingBoxFromJson(json);

  Map<String, dynamic> toJson() => _$BoundingBoxToJson(this);
}

/// Provides information about a celebrity recognized by the
/// <a>RecognizeCelebrities</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Celebrity {
  /// Provides information about the celebrity's face, such as its location on the
  /// image.
  @_s.JsonKey(name: 'Face')
  final ComparedFace face;

  /// A unique identifier for the celebrity.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The confidence, in percentage, that Amazon Rekognition has that the
  /// recognized face is the celebrity.
  @_s.JsonKey(name: 'MatchConfidence')
  final double matchConfidence;

  /// The name of the celebrity.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// An array of URLs pointing to additional information about the celebrity. If
  /// there is no additional information about the celebrity, this list is empty.
  @_s.JsonKey(name: 'Urls')
  final List<String> urls;

  Celebrity({
    this.face,
    this.id,
    this.matchConfidence,
    this.name,
    this.urls,
  });
  factory Celebrity.fromJson(Map<String, dynamic> json) =>
      _$CelebrityFromJson(json);
}

/// Information about a recognized celebrity.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CelebrityDetail {
  /// Bounding box around the body of a celebrity.
  @_s.JsonKey(name: 'BoundingBox')
  final BoundingBox boundingBox;

  /// The confidence, in percentage, that Amazon Rekognition has that the
  /// recognized face is the celebrity.
  @_s.JsonKey(name: 'Confidence')
  final double confidence;

  /// Face details for the recognized celebrity.
  @_s.JsonKey(name: 'Face')
  final FaceDetail face;

  /// The unique identifier for the celebrity.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the celebrity.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// An array of URLs pointing to additional celebrity information.
  @_s.JsonKey(name: 'Urls')
  final List<String> urls;

  CelebrityDetail({
    this.boundingBox,
    this.confidence,
    this.face,
    this.id,
    this.name,
    this.urls,
  });
  factory CelebrityDetail.fromJson(Map<String, dynamic> json) =>
      _$CelebrityDetailFromJson(json);
}

/// Information about a detected celebrity and the time the celebrity was
/// detected in a stored video. For more information, see
/// GetCelebrityRecognition in the Amazon Rekognition Developer Guide.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CelebrityRecognition {
  /// Information about a recognized celebrity.
  @_s.JsonKey(name: 'Celebrity')
  final CelebrityDetail celebrity;

  /// The time, in milliseconds from the start of the video, that the celebrity
  /// was recognized.
  @_s.JsonKey(name: 'Timestamp')
  final int timestamp;

  CelebrityRecognition({
    this.celebrity,
    this.timestamp,
  });
  factory CelebrityRecognition.fromJson(Map<String, dynamic> json) =>
      _$CelebrityRecognitionFromJson(json);
}

enum CelebrityRecognitionSortBy {
  @_s.JsonValue('ID')
  id,
  @_s.JsonValue('TIMESTAMP')
  timestamp,
}

extension on CelebrityRecognitionSortBy {
  String toValue() {
    switch (this) {
      case CelebrityRecognitionSortBy.id:
        return 'ID';
      case CelebrityRecognitionSortBy.timestamp:
        return 'TIMESTAMP';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Provides information about a face in a target image that matches the source
/// image face analyzed by <code>CompareFaces</code>. The <code>Face</code>
/// property contains the bounding box of the face in the target image. The
/// <code>Similarity</code> property is the confidence that the source image
/// face matches the face in the bounding box.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CompareFacesMatch {
  /// Provides face metadata (bounding box and confidence that the bounding box
  /// actually contains a face).
  @_s.JsonKey(name: 'Face')
  final ComparedFace face;

  /// Level of confidence that the faces match.
  @_s.JsonKey(name: 'Similarity')
  final double similarity;

  CompareFacesMatch({
    this.face,
    this.similarity,
  });
  factory CompareFacesMatch.fromJson(Map<String, dynamic> json) =>
      _$CompareFacesMatchFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CompareFacesResponse {
  /// An array of faces in the target image that match the source image face. Each
  /// <code>CompareFacesMatch</code> object provides the bounding box, the
  /// confidence level that the bounding box contains a face, and the similarity
  /// score for the face in the bounding box and the face in the source image.
  @_s.JsonKey(name: 'FaceMatches')
  final List<CompareFacesMatch> faceMatches;

  /// The face in the source image that was used for comparison.
  @_s.JsonKey(name: 'SourceImageFace')
  final ComparedSourceImageFace sourceImageFace;

  /// The value of <code>SourceImageOrientationCorrection</code> is always null.
  ///
  /// If the input image is in .jpeg format, it might contain exchangeable image
  /// file format (Exif) metadata that includes the image's orientation. Amazon
  /// Rekognition uses this orientation information to perform image correction.
  /// The bounding box coordinates are translated to represent object locations
  /// after the orientation information in the Exif metadata is used to correct
  /// the image orientation. Images in .png format don't contain Exif metadata.
  ///
  /// Amazon Rekognition doesn’t perform image correction for images in .png
  /// format and .jpeg images without orientation information in the image Exif
  /// metadata. The bounding box coordinates aren't translated and represent the
  /// object locations before the image is rotated.
  @_s.JsonKey(name: 'SourceImageOrientationCorrection')
  final OrientationCorrection sourceImageOrientationCorrection;

  /// The value of <code>TargetImageOrientationCorrection</code> is always null.
  ///
  /// If the input image is in .jpeg format, it might contain exchangeable image
  /// file format (Exif) metadata that includes the image's orientation. Amazon
  /// Rekognition uses this orientation information to perform image correction.
  /// The bounding box coordinates are translated to represent object locations
  /// after the orientation information in the Exif metadata is used to correct
  /// the image orientation. Images in .png format don't contain Exif metadata.
  ///
  /// Amazon Rekognition doesn’t perform image correction for images in .png
  /// format and .jpeg images without orientation information in the image Exif
  /// metadata. The bounding box coordinates aren't translated and represent the
  /// object locations before the image is rotated.
  @_s.JsonKey(name: 'TargetImageOrientationCorrection')
  final OrientationCorrection targetImageOrientationCorrection;

  /// An array of faces in the target image that did not match the source image
  /// face.
  @_s.JsonKey(name: 'UnmatchedFaces')
  final List<ComparedFace> unmatchedFaces;

  CompareFacesResponse({
    this.faceMatches,
    this.sourceImageFace,
    this.sourceImageOrientationCorrection,
    this.targetImageOrientationCorrection,
    this.unmatchedFaces,
  });
  factory CompareFacesResponse.fromJson(Map<String, dynamic> json) =>
      _$CompareFacesResponseFromJson(json);
}

/// Provides face metadata for target image faces that are analyzed by
/// <code>CompareFaces</code> and <code>RecognizeCelebrities</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ComparedFace {
  /// Bounding box of the face.
  @_s.JsonKey(name: 'BoundingBox')
  final BoundingBox boundingBox;

  /// Level of confidence that what the bounding box contains is a face.
  @_s.JsonKey(name: 'Confidence')
  final double confidence;

  /// An array of facial landmarks.
  @_s.JsonKey(name: 'Landmarks')
  final List<Landmark> landmarks;

  /// Indicates the pose of the face as determined by its pitch, roll, and yaw.
  @_s.JsonKey(name: 'Pose')
  final Pose pose;

  /// Identifies face image brightness and sharpness.
  @_s.JsonKey(name: 'Quality')
  final ImageQuality quality;

  ComparedFace({
    this.boundingBox,
    this.confidence,
    this.landmarks,
    this.pose,
    this.quality,
  });
  factory ComparedFace.fromJson(Map<String, dynamic> json) =>
      _$ComparedFaceFromJson(json);
}

/// Type that describes the face Amazon Rekognition chose to compare with the
/// faces in the target. This contains a bounding box for the selected face and
/// confidence level that the bounding box contains a face. Note that Amazon
/// Rekognition selects the largest face in the source image for this
/// comparison.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ComparedSourceImageFace {
  /// Bounding box of the face.
  @_s.JsonKey(name: 'BoundingBox')
  final BoundingBox boundingBox;

  /// Confidence level that the selected bounding box contains a face.
  @_s.JsonKey(name: 'Confidence')
  final double confidence;

  ComparedSourceImageFace({
    this.boundingBox,
    this.confidence,
  });
  factory ComparedSourceImageFace.fromJson(Map<String, dynamic> json) =>
      _$ComparedSourceImageFaceFromJson(json);
}

enum ContentClassifier {
  @_s.JsonValue('FreeOfPersonallyIdentifiableInformation')
  freeOfPersonallyIdentifiableInformation,
  @_s.JsonValue('FreeOfAdultContent')
  freeOfAdultContent,
}

/// Information about an unsafe content label detection in a stored video.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ContentModerationDetection {
  /// The unsafe content label detected by in the stored video.
  @_s.JsonKey(name: 'ModerationLabel')
  final ModerationLabel moderationLabel;

  /// Time, in milliseconds from the beginning of the video, that the unsafe
  /// content label was detected.
  @_s.JsonKey(name: 'Timestamp')
  final int timestamp;

  ContentModerationDetection({
    this.moderationLabel,
    this.timestamp,
  });
  factory ContentModerationDetection.fromJson(Map<String, dynamic> json) =>
      _$ContentModerationDetectionFromJson(json);
}

enum ContentModerationSortBy {
  @_s.JsonValue('NAME')
  name,
  @_s.JsonValue('TIMESTAMP')
  timestamp,
}

extension on ContentModerationSortBy {
  String toValue() {
    switch (this) {
      case ContentModerationSortBy.name:
        return 'NAME';
      case ContentModerationSortBy.timestamp:
        return 'TIMESTAMP';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Information about an item of Personal Protective Equipment covering a
/// corresponding body part. For more information, see
/// <a>DetectProtectiveEquipment</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CoversBodyPart {
  /// The confidence that Amazon Rekognition has in the value of
  /// <code>Value</code>.
  @_s.JsonKey(name: 'Confidence')
  final double confidence;

  /// True if the PPE covers the corresponding body part, otherwise false.
  @_s.JsonKey(name: 'Value')
  final bool value;

  CoversBodyPart({
    this.confidence,
    this.value,
  });
  factory CoversBodyPart.fromJson(Map<String, dynamic> json) =>
      _$CoversBodyPartFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateCollectionResponse {
  /// Amazon Resource Name (ARN) of the collection. You can use this to manage
  /// permissions on your resources.
  @_s.JsonKey(name: 'CollectionArn')
  final String collectionArn;

  /// Version number of the face detection model associated with the collection
  /// you are creating.
  @_s.JsonKey(name: 'FaceModelVersion')
  final String faceModelVersion;

  /// HTTP status code indicating the result of the operation.
  @_s.JsonKey(name: 'StatusCode')
  final int statusCode;

  CreateCollectionResponse({
    this.collectionArn,
    this.faceModelVersion,
    this.statusCode,
  });
  factory CreateCollectionResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateCollectionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateProjectResponse {
  /// The Amazon Resource Name (ARN) of the new project. You can use the ARN to
  /// configure IAM access to the project.
  @_s.JsonKey(name: 'ProjectArn')
  final String projectArn;

  CreateProjectResponse({
    this.projectArn,
  });
  factory CreateProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateProjectResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateProjectVersionResponse {
  /// The ARN of the model version that was created. Use
  /// <code>DescribeProjectVersion</code> to get the current status of the
  /// training operation.
  @_s.JsonKey(name: 'ProjectVersionArn')
  final String projectVersionArn;

  CreateProjectVersionResponse({
    this.projectVersionArn,
  });
  factory CreateProjectVersionResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateProjectVersionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateStreamProcessorResponse {
  /// ARN for the newly create stream processor.
  @_s.JsonKey(name: 'StreamProcessorArn')
  final String streamProcessorArn;

  CreateStreamProcessorResponse({
    this.streamProcessorArn,
  });
  factory CreateStreamProcessorResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateStreamProcessorResponseFromJson(json);
}

/// A custom label detected in an image by a call to <a>DetectCustomLabels</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CustomLabel {
  /// The confidence that the model has in the detection of the custom label. The
  /// range is 0-100. A higher value indicates a higher confidence.
  @_s.JsonKey(name: 'Confidence')
  final double confidence;

  /// The location of the detected object on the image that corresponds to the
  /// custom label. Includes an axis aligned coarse bounding box surrounding the
  /// object and a finer grain polygon for more accurate spatial information.
  @_s.JsonKey(name: 'Geometry')
  final Geometry geometry;

  /// The name of the custom label.
  @_s.JsonKey(name: 'Name')
  final String name;

  CustomLabel({
    this.confidence,
    this.geometry,
    this.name,
  });
  factory CustomLabel.fromJson(Map<String, dynamic> json) =>
      _$CustomLabelFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteCollectionResponse {
  /// HTTP status code that indicates the result of the operation.
  @_s.JsonKey(name: 'StatusCode')
  final int statusCode;

  DeleteCollectionResponse({
    this.statusCode,
  });
  factory DeleteCollectionResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteCollectionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteFacesResponse {
  /// An array of strings (face IDs) of the faces that were deleted.
  @_s.JsonKey(name: 'DeletedFaces')
  final List<String> deletedFaces;

  DeleteFacesResponse({
    this.deletedFaces,
  });
  factory DeleteFacesResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteFacesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteProjectResponse {
  /// The current status of the delete project operation.
  @_s.JsonKey(name: 'Status')
  final ProjectStatus status;

  DeleteProjectResponse({
    this.status,
  });
  factory DeleteProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteProjectResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteProjectVersionResponse {
  /// The status of the deletion operation.
  @_s.JsonKey(name: 'Status')
  final ProjectVersionStatus status;

  DeleteProjectVersionResponse({
    this.status,
  });
  factory DeleteProjectVersionResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteProjectVersionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteStreamProcessorResponse {
  DeleteStreamProcessorResponse();
  factory DeleteStreamProcessorResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteStreamProcessorResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeCollectionResponse {
  /// The Amazon Resource Name (ARN) of the collection.
  @_s.JsonKey(name: 'CollectionARN')
  final String collectionARN;

  /// The number of milliseconds since the Unix epoch time until the creation of
  /// the collection. The Unix epoch time is 00:00:00 Coordinated Universal Time
  /// (UTC), Thursday, 1 January 1970.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationTimestamp')
  final DateTime creationTimestamp;

  /// The number of faces that are indexed into the collection. To index faces
  /// into a collection, use <a>IndexFaces</a>.
  @_s.JsonKey(name: 'FaceCount')
  final int faceCount;

  /// The version of the face model that's used by the collection for face
  /// detection.
  ///
  /// For more information, see Model Versioning in the Amazon Rekognition
  /// Developer Guide.
  @_s.JsonKey(name: 'FaceModelVersion')
  final String faceModelVersion;

  DescribeCollectionResponse({
    this.collectionARN,
    this.creationTimestamp,
    this.faceCount,
    this.faceModelVersion,
  });
  factory DescribeCollectionResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeCollectionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeProjectVersionsResponse {
  /// If the previous response was incomplete (because there is more results to
  /// retrieve), Amazon Rekognition Custom Labels returns a pagination token in
  /// the response. You can use this pagination token to retrieve the next set of
  /// results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of model descriptions. The list is sorted by the creation date and
  /// time of the model versions, latest to earliest.
  @_s.JsonKey(name: 'ProjectVersionDescriptions')
  final List<ProjectVersionDescription> projectVersionDescriptions;

  DescribeProjectVersionsResponse({
    this.nextToken,
    this.projectVersionDescriptions,
  });
  factory DescribeProjectVersionsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeProjectVersionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeProjectsResponse {
  /// If the previous response was incomplete (because there is more results to
  /// retrieve), Amazon Rekognition Custom Labels returns a pagination token in
  /// the response. You can use this pagination token to retrieve the next set of
  /// results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of project descriptions. The list is sorted by the date and time the
  /// projects are created.
  @_s.JsonKey(name: 'ProjectDescriptions')
  final List<ProjectDescription> projectDescriptions;

  DescribeProjectsResponse({
    this.nextToken,
    this.projectDescriptions,
  });
  factory DescribeProjectsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeProjectsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeStreamProcessorResponse {
  /// Date and time the stream processor was created
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationTimestamp')
  final DateTime creationTimestamp;

  /// Kinesis video stream that provides the source streaming video.
  @_s.JsonKey(name: 'Input')
  final StreamProcessorInput input;

  /// The time, in Unix format, the stream processor was last updated. For
  /// example, when the stream processor moves from a running state to a failed
  /// state, or when the user starts or stops the stream processor.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdateTimestamp')
  final DateTime lastUpdateTimestamp;

  /// Name of the stream processor.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Kinesis data stream to which Amazon Rekognition Video puts the analysis
  /// results.
  @_s.JsonKey(name: 'Output')
  final StreamProcessorOutput output;

  /// ARN of the IAM role that allows access to the stream processor.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;

  /// Face recognition input parameters that are being used by the stream
  /// processor. Includes the collection to use for face recognition and the face
  /// attributes to detect.
  @_s.JsonKey(name: 'Settings')
  final StreamProcessorSettings settings;

  /// Current status of the stream processor.
  @_s.JsonKey(name: 'Status')
  final StreamProcessorStatus status;

  /// Detailed status message about the stream processor.
  @_s.JsonKey(name: 'StatusMessage')
  final String statusMessage;

  /// ARN of the stream processor.
  @_s.JsonKey(name: 'StreamProcessorArn')
  final String streamProcessorArn;

  DescribeStreamProcessorResponse({
    this.creationTimestamp,
    this.input,
    this.lastUpdateTimestamp,
    this.name,
    this.output,
    this.roleArn,
    this.settings,
    this.status,
    this.statusMessage,
    this.streamProcessorArn,
  });
  factory DescribeStreamProcessorResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeStreamProcessorResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DetectCustomLabelsResponse {
  /// An array of custom labels detected in the input image.
  @_s.JsonKey(name: 'CustomLabels')
  final List<CustomLabel> customLabels;

  DetectCustomLabelsResponse({
    this.customLabels,
  });
  factory DetectCustomLabelsResponse.fromJson(Map<String, dynamic> json) =>
      _$DetectCustomLabelsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DetectFacesResponse {
  /// Details of each face found in the image.
  @_s.JsonKey(name: 'FaceDetails')
  final List<FaceDetail> faceDetails;

  /// The value of <code>OrientationCorrection</code> is always null.
  ///
  /// If the input image is in .jpeg format, it might contain exchangeable image
  /// file format (Exif) metadata that includes the image's orientation. Amazon
  /// Rekognition uses this orientation information to perform image correction.
  /// The bounding box coordinates are translated to represent object locations
  /// after the orientation information in the Exif metadata is used to correct
  /// the image orientation. Images in .png format don't contain Exif metadata.
  ///
  /// Amazon Rekognition doesn’t perform image correction for images in .png
  /// format and .jpeg images without orientation information in the image Exif
  /// metadata. The bounding box coordinates aren't translated and represent the
  /// object locations before the image is rotated.
  @_s.JsonKey(name: 'OrientationCorrection')
  final OrientationCorrection orientationCorrection;

  DetectFacesResponse({
    this.faceDetails,
    this.orientationCorrection,
  });
  factory DetectFacesResponse.fromJson(Map<String, dynamic> json) =>
      _$DetectFacesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DetectLabelsResponse {
  /// Version number of the label detection model that was used to detect labels.
  @_s.JsonKey(name: 'LabelModelVersion')
  final String labelModelVersion;

  /// An array of labels for the real-world objects detected.
  @_s.JsonKey(name: 'Labels')
  final List<Label> labels;

  /// The value of <code>OrientationCorrection</code> is always null.
  ///
  /// If the input image is in .jpeg format, it might contain exchangeable image
  /// file format (Exif) metadata that includes the image's orientation. Amazon
  /// Rekognition uses this orientation information to perform image correction.
  /// The bounding box coordinates are translated to represent object locations
  /// after the orientation information in the Exif metadata is used to correct
  /// the image orientation. Images in .png format don't contain Exif metadata.
  ///
  /// Amazon Rekognition doesn’t perform image correction for images in .png
  /// format and .jpeg images without orientation information in the image Exif
  /// metadata. The bounding box coordinates aren't translated and represent the
  /// object locations before the image is rotated.
  @_s.JsonKey(name: 'OrientationCorrection')
  final OrientationCorrection orientationCorrection;

  DetectLabelsResponse({
    this.labelModelVersion,
    this.labels,
    this.orientationCorrection,
  });
  factory DetectLabelsResponse.fromJson(Map<String, dynamic> json) =>
      _$DetectLabelsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DetectModerationLabelsResponse {
  /// Shows the results of the human in the loop evaluation.
  @_s.JsonKey(name: 'HumanLoopActivationOutput')
  final HumanLoopActivationOutput humanLoopActivationOutput;

  /// Array of detected Moderation labels and the time, in milliseconds from the
  /// start of the video, they were detected.
  @_s.JsonKey(name: 'ModerationLabels')
  final List<ModerationLabel> moderationLabels;

  /// Version number of the moderation detection model that was used to detect
  /// unsafe content.
  @_s.JsonKey(name: 'ModerationModelVersion')
  final String moderationModelVersion;

  DetectModerationLabelsResponse({
    this.humanLoopActivationOutput,
    this.moderationLabels,
    this.moderationModelVersion,
  });
  factory DetectModerationLabelsResponse.fromJson(Map<String, dynamic> json) =>
      _$DetectModerationLabelsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DetectProtectiveEquipmentResponse {
  /// An array of persons detected in the image (including persons not wearing
  /// PPE).
  @_s.JsonKey(name: 'Persons')
  final List<ProtectiveEquipmentPerson> persons;

  /// The version number of the PPE detection model used to detect PPE in the
  /// image.
  @_s.JsonKey(name: 'ProtectiveEquipmentModelVersion')
  final String protectiveEquipmentModelVersion;

  /// Summary information for the types of PPE specified in the
  /// <code>SummarizationAttributes</code> input parameter.
  @_s.JsonKey(name: 'Summary')
  final ProtectiveEquipmentSummary summary;

  DetectProtectiveEquipmentResponse({
    this.persons,
    this.protectiveEquipmentModelVersion,
    this.summary,
  });
  factory DetectProtectiveEquipmentResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DetectProtectiveEquipmentResponseFromJson(json);
}

/// A set of optional parameters that you can use to set the criteria that the
/// text must meet to be included in your response. <code>WordFilter</code>
/// looks at a word’s height, width, and minimum confidence.
/// <code>RegionOfInterest</code> lets you set a specific region of the image to
/// look for text in.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DetectTextFilters {
  /// A Filter focusing on a certain area of the image. Uses a
  /// <code>BoundingBox</code> object to set the region of the image.
  @_s.JsonKey(name: 'RegionsOfInterest')
  final List<RegionOfInterest> regionsOfInterest;
  @_s.JsonKey(name: 'WordFilter')
  final DetectionFilter wordFilter;

  DetectTextFilters({
    this.regionsOfInterest,
    this.wordFilter,
  });
  Map<String, dynamic> toJson() => _$DetectTextFiltersToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DetectTextResponse {
  /// An array of text that was detected in the input image.
  @_s.JsonKey(name: 'TextDetections')
  final List<TextDetection> textDetections;

  /// The model version used to detect text.
  @_s.JsonKey(name: 'TextModelVersion')
  final String textModelVersion;

  DetectTextResponse({
    this.textDetections,
    this.textModelVersion,
  });
  factory DetectTextResponse.fromJson(Map<String, dynamic> json) =>
      _$DetectTextResponseFromJson(json);
}

/// A set of parameters that allow you to filter out certain results from your
/// returned results.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DetectionFilter {
  /// Sets the minimum height of the word bounding box. Words with bounding box
  /// heights lesser than this value will be excluded from the result. Value is
  /// relative to the video frame height.
  @_s.JsonKey(name: 'MinBoundingBoxHeight')
  final double minBoundingBoxHeight;

  /// Sets the minimum width of the word bounding box. Words with bounding boxes
  /// widths lesser than this value will be excluded from the result. Value is
  /// relative to the video frame width.
  @_s.JsonKey(name: 'MinBoundingBoxWidth')
  final double minBoundingBoxWidth;

  /// Sets confidence of word detection. Words with detection confidence below
  /// this will be excluded from the result. Values should be between 0.5 and 1 as
  /// Text in Video will not return any result below 0.5.
  @_s.JsonKey(name: 'MinConfidence')
  final double minConfidence;

  DetectionFilter({
    this.minBoundingBoxHeight,
    this.minBoundingBoxWidth,
    this.minConfidence,
  });
  Map<String, dynamic> toJson() => _$DetectionFilterToJson(this);
}

/// The emotions that appear to be expressed on the face, and the confidence
/// level in the determination. The API is only making a determination of the
/// physical appearance of a person's face. It is not a determination of the
/// person’s internal emotional state and should not be used in such a way. For
/// example, a person pretending to have a sad face might not be sad
/// emotionally.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Emotion {
  /// Level of confidence in the determination.
  @_s.JsonKey(name: 'Confidence')
  final double confidence;

  /// Type of emotion detected.
  @_s.JsonKey(name: 'Type')
  final EmotionName type;

  Emotion({
    this.confidence,
    this.type,
  });
  factory Emotion.fromJson(Map<String, dynamic> json) =>
      _$EmotionFromJson(json);
}

enum EmotionName {
  @_s.JsonValue('HAPPY')
  happy,
  @_s.JsonValue('SAD')
  sad,
  @_s.JsonValue('ANGRY')
  angry,
  @_s.JsonValue('CONFUSED')
  confused,
  @_s.JsonValue('DISGUSTED')
  disgusted,
  @_s.JsonValue('SURPRISED')
  surprised,
  @_s.JsonValue('CALM')
  calm,
  @_s.JsonValue('UNKNOWN')
  unknown,
  @_s.JsonValue('FEAR')
  fear,
}

/// Information about an item of Personal Protective Equipment (PPE) detected by
/// <a>DetectProtectiveEquipment</a>. For more information, see
/// <a>DetectProtectiveEquipment</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EquipmentDetection {
  /// A bounding box surrounding the item of detected PPE.
  @_s.JsonKey(name: 'BoundingBox')
  final BoundingBox boundingBox;

  /// The confidence that Amazon Rekognition has that the bounding box
  /// (<code>BoundingBox</code>) contains an item of PPE.
  @_s.JsonKey(name: 'Confidence')
  final double confidence;

  /// Information about the body part covered by the detected PPE.
  @_s.JsonKey(name: 'CoversBodyPart')
  final CoversBodyPart coversBodyPart;

  /// The type of detected PPE.
  @_s.JsonKey(name: 'Type')
  final ProtectiveEquipmentType type;

  EquipmentDetection({
    this.boundingBox,
    this.confidence,
    this.coversBodyPart,
    this.type,
  });
  factory EquipmentDetection.fromJson(Map<String, dynamic> json) =>
      _$EquipmentDetectionFromJson(json);
}

/// The evaluation results for the training of a model.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EvaluationResult {
  /// The F1 score for the evaluation of all labels. The F1 score metric evaluates
  /// the overall precision and recall performance of the model as a single value.
  /// A higher value indicates better precision and recall performance. A lower
  /// score indicates that precision, recall, or both are performing poorly.
  @_s.JsonKey(name: 'F1Score')
  final double f1Score;

  /// The S3 bucket that contains the training summary.
  @_s.JsonKey(name: 'Summary')
  final Summary summary;

  EvaluationResult({
    this.f1Score,
    this.summary,
  });
  factory EvaluationResult.fromJson(Map<String, dynamic> json) =>
      _$EvaluationResultFromJson(json);
}

/// Indicates whether or not the eyes on the face are open, and the confidence
/// level in the determination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EyeOpen {
  /// Level of confidence in the determination.
  @_s.JsonKey(name: 'Confidence')
  final double confidence;

  /// Boolean value that indicates whether the eyes on the face are open.
  @_s.JsonKey(name: 'Value')
  final bool value;

  EyeOpen({
    this.confidence,
    this.value,
  });
  factory EyeOpen.fromJson(Map<String, dynamic> json) =>
      _$EyeOpenFromJson(json);
}

/// Indicates whether or not the face is wearing eye glasses, and the confidence
/// level in the determination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Eyeglasses {
  /// Level of confidence in the determination.
  @_s.JsonKey(name: 'Confidence')
  final double confidence;

  /// Boolean value that indicates whether the face is wearing eye glasses or not.
  @_s.JsonKey(name: 'Value')
  final bool value;

  Eyeglasses({
    this.confidence,
    this.value,
  });
  factory Eyeglasses.fromJson(Map<String, dynamic> json) =>
      _$EyeglassesFromJson(json);
}

/// Describes the face properties such as the bounding box, face ID, image ID of
/// the input image, and external image ID that you assigned.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Face {
  /// Bounding box of the face.
  @_s.JsonKey(name: 'BoundingBox')
  final BoundingBox boundingBox;

  /// Confidence level that the bounding box contains a face (and not a different
  /// object such as a tree).
  @_s.JsonKey(name: 'Confidence')
  final double confidence;

  /// Identifier that you assign to all the faces in the input image.
  @_s.JsonKey(name: 'ExternalImageId')
  final String externalImageId;

  /// Unique identifier that Amazon Rekognition assigns to the face.
  @_s.JsonKey(name: 'FaceId')
  final String faceId;

  /// Unique identifier that Amazon Rekognition assigns to the input image.
  @_s.JsonKey(name: 'ImageId')
  final String imageId;

  Face({
    this.boundingBox,
    this.confidence,
    this.externalImageId,
    this.faceId,
    this.imageId,
  });
  factory Face.fromJson(Map<String, dynamic> json) => _$FaceFromJson(json);
}

enum FaceAttributes {
  @_s.JsonValue('DEFAULT')
  $default,
  @_s.JsonValue('ALL')
  all,
}

extension on FaceAttributes {
  String toValue() {
    switch (this) {
      case FaceAttributes.$default:
        return 'DEFAULT';
      case FaceAttributes.all:
        return 'ALL';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Structure containing attributes of the face that the algorithm detected.
///
/// A <code>FaceDetail</code> object contains either the default facial
/// attributes or all facial attributes. The default attributes are
/// <code>BoundingBox</code>, <code>Confidence</code>, <code>Landmarks</code>,
/// <code>Pose</code>, and <code>Quality</code>.
///
/// <a>GetFaceDetection</a> is the only Amazon Rekognition Video stored video
/// operation that can return a <code>FaceDetail</code> object with all
/// attributes. To specify which attributes to return, use the
/// <code>FaceAttributes</code> input parameter for <a>StartFaceDetection</a>.
/// The following Amazon Rekognition Video operations return only the default
/// attributes. The corresponding Start operations don't have a
/// <code>FaceAttributes</code> input parameter.
///
/// <ul>
/// <li>
/// GetCelebrityRecognition
/// </li>
/// <li>
/// GetPersonTracking
/// </li>
/// <li>
/// GetFaceSearch
/// </li>
/// </ul>
/// The Amazon Rekognition Image <a>DetectFaces</a> and <a>IndexFaces</a>
/// operations can return all facial attributes. To specify which attributes to
/// return, use the <code>Attributes</code> input parameter for
/// <code>DetectFaces</code>. For <code>IndexFaces</code>, use the
/// <code>DetectAttributes</code> input parameter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FaceDetail {
  /// The estimated age range, in years, for the face. Low represents the lowest
  /// estimated age and High represents the highest estimated age.
  @_s.JsonKey(name: 'AgeRange')
  final AgeRange ageRange;

  /// Indicates whether or not the face has a beard, and the confidence level in
  /// the determination.
  @_s.JsonKey(name: 'Beard')
  final Beard beard;

  /// Bounding box of the face. Default attribute.
  @_s.JsonKey(name: 'BoundingBox')
  final BoundingBox boundingBox;

  /// Confidence level that the bounding box contains a face (and not a different
  /// object such as a tree). Default attribute.
  @_s.JsonKey(name: 'Confidence')
  final double confidence;

  /// The emotions that appear to be expressed on the face, and the confidence
  /// level in the determination. The API is only making a determination of the
  /// physical appearance of a person's face. It is not a determination of the
  /// person’s internal emotional state and should not be used in such a way. For
  /// example, a person pretending to have a sad face might not be sad
  /// emotionally.
  @_s.JsonKey(name: 'Emotions')
  final List<Emotion> emotions;

  /// Indicates whether or not the face is wearing eye glasses, and the confidence
  /// level in the determination.
  @_s.JsonKey(name: 'Eyeglasses')
  final Eyeglasses eyeglasses;

  /// Indicates whether or not the eyes on the face are open, and the confidence
  /// level in the determination.
  @_s.JsonKey(name: 'EyesOpen')
  final EyeOpen eyesOpen;

  /// The predicted gender of a detected face.
  @_s.JsonKey(name: 'Gender')
  final Gender gender;

  /// Indicates the location of landmarks on the face. Default attribute.
  @_s.JsonKey(name: 'Landmarks')
  final List<Landmark> landmarks;

  /// Indicates whether or not the mouth on the face is open, and the confidence
  /// level in the determination.
  @_s.JsonKey(name: 'MouthOpen')
  final MouthOpen mouthOpen;

  /// Indicates whether or not the face has a mustache, and the confidence level
  /// in the determination.
  @_s.JsonKey(name: 'Mustache')
  final Mustache mustache;

  /// Indicates the pose of the face as determined by its pitch, roll, and yaw.
  /// Default attribute.
  @_s.JsonKey(name: 'Pose')
  final Pose pose;

  /// Identifies image brightness and sharpness. Default attribute.
  @_s.JsonKey(name: 'Quality')
  final ImageQuality quality;

  /// Indicates whether or not the face is smiling, and the confidence level in
  /// the determination.
  @_s.JsonKey(name: 'Smile')
  final Smile smile;

  /// Indicates whether or not the face is wearing sunglasses, and the confidence
  /// level in the determination.
  @_s.JsonKey(name: 'Sunglasses')
  final Sunglasses sunglasses;

  FaceDetail({
    this.ageRange,
    this.beard,
    this.boundingBox,
    this.confidence,
    this.emotions,
    this.eyeglasses,
    this.eyesOpen,
    this.gender,
    this.landmarks,
    this.mouthOpen,
    this.mustache,
    this.pose,
    this.quality,
    this.smile,
    this.sunglasses,
  });
  factory FaceDetail.fromJson(Map<String, dynamic> json) =>
      _$FaceDetailFromJson(json);
}

/// Information about a face detected in a video analysis request and the time
/// the face was detected in the video.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FaceDetection {
  /// The face properties for the detected face.
  @_s.JsonKey(name: 'Face')
  final FaceDetail face;

  /// Time, in milliseconds from the start of the video, that the face was
  /// detected.
  @_s.JsonKey(name: 'Timestamp')
  final int timestamp;

  FaceDetection({
    this.face,
    this.timestamp,
  });
  factory FaceDetection.fromJson(Map<String, dynamic> json) =>
      _$FaceDetectionFromJson(json);
}

/// Provides face metadata. In addition, it also provides the confidence in the
/// match of this face with the input face.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FaceMatch {
  /// Describes the face properties such as the bounding box, face ID, image ID of
  /// the source image, and external image ID that you assigned.
  @_s.JsonKey(name: 'Face')
  final Face face;

  /// Confidence in the match of this face with the input face.
  @_s.JsonKey(name: 'Similarity')
  final double similarity;

  FaceMatch({
    this.face,
    this.similarity,
  });
  factory FaceMatch.fromJson(Map<String, dynamic> json) =>
      _$FaceMatchFromJson(json);
}

/// Object containing both the face metadata (stored in the backend database),
/// and facial attributes that are detected but aren't stored in the database.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FaceRecord {
  /// Describes the face properties such as the bounding box, face ID, image ID of
  /// the input image, and external image ID that you assigned.
  @_s.JsonKey(name: 'Face')
  final Face face;

  /// Structure containing attributes of the face that the algorithm detected.
  @_s.JsonKey(name: 'FaceDetail')
  final FaceDetail faceDetail;

  FaceRecord({
    this.face,
    this.faceDetail,
  });
  factory FaceRecord.fromJson(Map<String, dynamic> json) =>
      _$FaceRecordFromJson(json);
}

/// Input face recognition parameters for an Amazon Rekognition stream
/// processor. <code>FaceRecognitionSettings</code> is a request parameter for
/// <a>CreateStreamProcessor</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class FaceSearchSettings {
  /// The ID of a collection that contains faces that you want to search for.
  @_s.JsonKey(name: 'CollectionId')
  final String collectionId;

  /// Minimum face match confidence score that must be met to return a result for
  /// a recognized face. Default is 80. 0 is the lowest confidence. 100 is the
  /// highest confidence.
  @_s.JsonKey(name: 'FaceMatchThreshold')
  final double faceMatchThreshold;

  FaceSearchSettings({
    this.collectionId,
    this.faceMatchThreshold,
  });
  factory FaceSearchSettings.fromJson(Map<String, dynamic> json) =>
      _$FaceSearchSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$FaceSearchSettingsToJson(this);
}

enum FaceSearchSortBy {
  @_s.JsonValue('INDEX')
  $index,
  @_s.JsonValue('TIMESTAMP')
  timestamp,
}

extension on FaceSearchSortBy {
  String toValue() {
    switch (this) {
      case FaceSearchSortBy.$index:
        return 'INDEX';
      case FaceSearchSortBy.timestamp:
        return 'TIMESTAMP';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The predicted gender of a detected face.
///
/// Amazon Rekognition makes gender binary (male/female) predictions based on
/// the physical appearance of a face in a particular image. This kind of
/// prediction is not designed to categorize a person’s gender identity, and you
/// shouldn't use Amazon Rekognition to make such a determination. For example,
/// a male actor wearing a long-haired wig and earrings for a role might be
/// predicted as female.
///
/// Using Amazon Rekognition to make gender binary predictions is best suited
/// for use cases where aggregate gender distribution statistics need to be
/// analyzed without identifying specific users. For example, the percentage of
/// female users compared to male users on a social media platform.
///
/// We don't recommend using gender binary predictions to make decisions that
/// impact&#x2028; an individual's rights, privacy, or access to services.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Gender {
  /// Level of confidence in the prediction.
  @_s.JsonKey(name: 'Confidence')
  final double confidence;

  /// The predicted gender of the face.
  @_s.JsonKey(name: 'Value')
  final GenderType value;

  Gender({
    this.confidence,
    this.value,
  });
  factory Gender.fromJson(Map<String, dynamic> json) => _$GenderFromJson(json);
}

enum GenderType {
  @_s.JsonValue('Male')
  male,
  @_s.JsonValue('Female')
  female,
}

/// Information about where an object (<a>DetectCustomLabels</a>) or text
/// (<a>DetectText</a>) is located on an image.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Geometry {
  /// An axis-aligned coarse representation of the detected item's location on the
  /// image.
  @_s.JsonKey(name: 'BoundingBox')
  final BoundingBox boundingBox;

  /// Within the bounding box, a fine-grained polygon around the detected item.
  @_s.JsonKey(name: 'Polygon')
  final List<Point> polygon;

  Geometry({
    this.boundingBox,
    this.polygon,
  });
  factory Geometry.fromJson(Map<String, dynamic> json) =>
      _$GeometryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetCelebrityInfoResponse {
  /// The name of the celebrity.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// An array of URLs pointing to additional celebrity information.
  @_s.JsonKey(name: 'Urls')
  final List<String> urls;

  GetCelebrityInfoResponse({
    this.name,
    this.urls,
  });
  factory GetCelebrityInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCelebrityInfoResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetCelebrityRecognitionResponse {
  /// Array of celebrities recognized in the video.
  @_s.JsonKey(name: 'Celebrities')
  final List<CelebrityRecognition> celebrities;

  /// The current status of the celebrity recognition job.
  @_s.JsonKey(name: 'JobStatus')
  final VideoJobStatus jobStatus;

  /// If the response is truncated, Amazon Rekognition Video returns this token
  /// that you can use in the subsequent request to retrieve the next set of
  /// celebrities.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// If the job fails, <code>StatusMessage</code> provides a descriptive error
  /// message.
  @_s.JsonKey(name: 'StatusMessage')
  final String statusMessage;

  /// Information about a video that Amazon Rekognition Video analyzed.
  /// <code>Videometadata</code> is returned in every page of paginated responses
  /// from a Amazon Rekognition Video operation.
  @_s.JsonKey(name: 'VideoMetadata')
  final VideoMetadata videoMetadata;

  GetCelebrityRecognitionResponse({
    this.celebrities,
    this.jobStatus,
    this.nextToken,
    this.statusMessage,
    this.videoMetadata,
  });
  factory GetCelebrityRecognitionResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCelebrityRecognitionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetContentModerationResponse {
  /// The current status of the unsafe content analysis job.
  @_s.JsonKey(name: 'JobStatus')
  final VideoJobStatus jobStatus;

  /// The detected unsafe content labels and the time(s) they were detected.
  @_s.JsonKey(name: 'ModerationLabels')
  final List<ContentModerationDetection> moderationLabels;

  /// Version number of the moderation detection model that was used to detect
  /// unsafe content.
  @_s.JsonKey(name: 'ModerationModelVersion')
  final String moderationModelVersion;

  /// If the response is truncated, Amazon Rekognition Video returns this token
  /// that you can use in the subsequent request to retrieve the next set of
  /// unsafe content labels.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// If the job fails, <code>StatusMessage</code> provides a descriptive error
  /// message.
  @_s.JsonKey(name: 'StatusMessage')
  final String statusMessage;

  /// Information about a video that Amazon Rekognition analyzed.
  /// <code>Videometadata</code> is returned in every page of paginated responses
  /// from <code>GetContentModeration</code>.
  @_s.JsonKey(name: 'VideoMetadata')
  final VideoMetadata videoMetadata;

  GetContentModerationResponse({
    this.jobStatus,
    this.moderationLabels,
    this.moderationModelVersion,
    this.nextToken,
    this.statusMessage,
    this.videoMetadata,
  });
  factory GetContentModerationResponse.fromJson(Map<String, dynamic> json) =>
      _$GetContentModerationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetFaceDetectionResponse {
  /// An array of faces detected in the video. Each element contains a detected
  /// face's details and the time, in milliseconds from the start of the video,
  /// the face was detected.
  @_s.JsonKey(name: 'Faces')
  final List<FaceDetection> faces;

  /// The current status of the face detection job.
  @_s.JsonKey(name: 'JobStatus')
  final VideoJobStatus jobStatus;

  /// If the response is truncated, Amazon Rekognition returns this token that you
  /// can use in the subsequent request to retrieve the next set of faces.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// If the job fails, <code>StatusMessage</code> provides a descriptive error
  /// message.
  @_s.JsonKey(name: 'StatusMessage')
  final String statusMessage;

  /// Information about a video that Amazon Rekognition Video analyzed.
  /// <code>Videometadata</code> is returned in every page of paginated responses
  /// from a Amazon Rekognition video operation.
  @_s.JsonKey(name: 'VideoMetadata')
  final VideoMetadata videoMetadata;

  GetFaceDetectionResponse({
    this.faces,
    this.jobStatus,
    this.nextToken,
    this.statusMessage,
    this.videoMetadata,
  });
  factory GetFaceDetectionResponse.fromJson(Map<String, dynamic> json) =>
      _$GetFaceDetectionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetFaceSearchResponse {
  /// The current status of the face search job.
  @_s.JsonKey(name: 'JobStatus')
  final VideoJobStatus jobStatus;

  /// If the response is truncated, Amazon Rekognition Video returns this token
  /// that you can use in the subsequent request to retrieve the next set of
  /// search results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// An array of persons, <a>PersonMatch</a>, in the video whose face(s) match
  /// the face(s) in an Amazon Rekognition collection. It also includes time
  /// information for when persons are matched in the video. You specify the input
  /// collection in an initial call to <code>StartFaceSearch</code>. Each
  /// <code>Persons</code> element includes a time the person was matched, face
  /// match details (<code>FaceMatches</code>) for matching faces in the
  /// collection, and person information (<code>Person</code>) for the matched
  /// person.
  @_s.JsonKey(name: 'Persons')
  final List<PersonMatch> persons;

  /// If the job fails, <code>StatusMessage</code> provides a descriptive error
  /// message.
  @_s.JsonKey(name: 'StatusMessage')
  final String statusMessage;

  /// Information about a video that Amazon Rekognition analyzed.
  /// <code>Videometadata</code> is returned in every page of paginated responses
  /// from a Amazon Rekognition Video operation.
  @_s.JsonKey(name: 'VideoMetadata')
  final VideoMetadata videoMetadata;

  GetFaceSearchResponse({
    this.jobStatus,
    this.nextToken,
    this.persons,
    this.statusMessage,
    this.videoMetadata,
  });
  factory GetFaceSearchResponse.fromJson(Map<String, dynamic> json) =>
      _$GetFaceSearchResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetLabelDetectionResponse {
  /// The current status of the label detection job.
  @_s.JsonKey(name: 'JobStatus')
  final VideoJobStatus jobStatus;

  /// Version number of the label detection model that was used to detect labels.
  @_s.JsonKey(name: 'LabelModelVersion')
  final String labelModelVersion;

  /// An array of labels detected in the video. Each element contains the detected
  /// label and the time, in milliseconds from the start of the video, that the
  /// label was detected.
  @_s.JsonKey(name: 'Labels')
  final List<LabelDetection> labels;

  /// If the response is truncated, Amazon Rekognition Video returns this token
  /// that you can use in the subsequent request to retrieve the next set of
  /// labels.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// If the job fails, <code>StatusMessage</code> provides a descriptive error
  /// message.
  @_s.JsonKey(name: 'StatusMessage')
  final String statusMessage;

  /// Information about a video that Amazon Rekognition Video analyzed.
  /// <code>Videometadata</code> is returned in every page of paginated responses
  /// from a Amazon Rekognition video operation.
  @_s.JsonKey(name: 'VideoMetadata')
  final VideoMetadata videoMetadata;

  GetLabelDetectionResponse({
    this.jobStatus,
    this.labelModelVersion,
    this.labels,
    this.nextToken,
    this.statusMessage,
    this.videoMetadata,
  });
  factory GetLabelDetectionResponse.fromJson(Map<String, dynamic> json) =>
      _$GetLabelDetectionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetPersonTrackingResponse {
  /// The current status of the person tracking job.
  @_s.JsonKey(name: 'JobStatus')
  final VideoJobStatus jobStatus;

  /// If the response is truncated, Amazon Rekognition Video returns this token
  /// that you can use in the subsequent request to retrieve the next set of
  /// persons.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// An array of the persons detected in the video and the time(s) their path was
  /// tracked throughout the video. An array element will exist for each time a
  /// person's path is tracked.
  @_s.JsonKey(name: 'Persons')
  final List<PersonDetection> persons;

  /// If the job fails, <code>StatusMessage</code> provides a descriptive error
  /// message.
  @_s.JsonKey(name: 'StatusMessage')
  final String statusMessage;

  /// Information about a video that Amazon Rekognition Video analyzed.
  /// <code>Videometadata</code> is returned in every page of paginated responses
  /// from a Amazon Rekognition Video operation.
  @_s.JsonKey(name: 'VideoMetadata')
  final VideoMetadata videoMetadata;

  GetPersonTrackingResponse({
    this.jobStatus,
    this.nextToken,
    this.persons,
    this.statusMessage,
    this.videoMetadata,
  });
  factory GetPersonTrackingResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPersonTrackingResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSegmentDetectionResponse {
  /// An array of objects. There can be multiple audio streams. Each
  /// <code>AudioMetadata</code> object contains metadata for a single audio
  /// stream. Audio information in an <code>AudioMetadata</code> objects includes
  /// the audio codec, the number of audio channels, the duration of the audio
  /// stream, and the sample rate. Audio metadata is returned in each page of
  /// information returned by <code>GetSegmentDetection</code>.
  @_s.JsonKey(name: 'AudioMetadata')
  final List<AudioMetadata> audioMetadata;

  /// Current status of the segment detection job.
  @_s.JsonKey(name: 'JobStatus')
  final VideoJobStatus jobStatus;

  /// If the previous response was incomplete (because there are more labels to
  /// retrieve), Amazon Rekognition Video returns a pagination token in the
  /// response. You can use this pagination token to retrieve the next set of
  /// text.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// An array of segments detected in a video. The array is sorted by the segment
  /// types (TECHNICAL_CUE or SHOT) specified in the <code>SegmentTypes</code>
  /// input parameter of <code>StartSegmentDetection</code>. Within each segment
  /// type the array is sorted by timestamp values.
  @_s.JsonKey(name: 'Segments')
  final List<SegmentDetection> segments;

  /// An array containing the segment types requested in the call to
  /// <code>StartSegmentDetection</code>.
  @_s.JsonKey(name: 'SelectedSegmentTypes')
  final List<SegmentTypeInfo> selectedSegmentTypes;

  /// If the job fails, <code>StatusMessage</code> provides a descriptive error
  /// message.
  @_s.JsonKey(name: 'StatusMessage')
  final String statusMessage;

  /// Currently, Amazon Rekognition Video returns a single object in the
  /// <code>VideoMetadata</code> array. The object contains information about the
  /// video stream in the input file that Amazon Rekognition Video chose to
  /// analyze. The <code>VideoMetadata</code> object includes the video codec,
  /// video format and other information. Video metadata is returned in each page
  /// of information returned by <code>GetSegmentDetection</code>.
  @_s.JsonKey(name: 'VideoMetadata')
  final List<VideoMetadata> videoMetadata;

  GetSegmentDetectionResponse({
    this.audioMetadata,
    this.jobStatus,
    this.nextToken,
    this.segments,
    this.selectedSegmentTypes,
    this.statusMessage,
    this.videoMetadata,
  });
  factory GetSegmentDetectionResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSegmentDetectionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetTextDetectionResponse {
  /// Current status of the text detection job.
  @_s.JsonKey(name: 'JobStatus')
  final VideoJobStatus jobStatus;

  /// If the response is truncated, Amazon Rekognition Video returns this token
  /// that you can use in the subsequent request to retrieve the next set of text.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// If the job fails, <code>StatusMessage</code> provides a descriptive error
  /// message.
  @_s.JsonKey(name: 'StatusMessage')
  final String statusMessage;

  /// An array of text detected in the video. Each element contains the detected
  /// text, the time in milliseconds from the start of the video that the text was
  /// detected, and where it was detected on the screen.
  @_s.JsonKey(name: 'TextDetections')
  final List<TextDetectionResult> textDetections;

  /// Version number of the text detection model that was used to detect text.
  @_s.JsonKey(name: 'TextModelVersion')
  final String textModelVersion;
  @_s.JsonKey(name: 'VideoMetadata')
  final VideoMetadata videoMetadata;

  GetTextDetectionResponse({
    this.jobStatus,
    this.nextToken,
    this.statusMessage,
    this.textDetections,
    this.textModelVersion,
    this.videoMetadata,
  });
  factory GetTextDetectionResponse.fromJson(Map<String, dynamic> json) =>
      _$GetTextDetectionResponseFromJson(json);
}

/// The S3 bucket that contains an Amazon Sagemaker Ground Truth format manifest
/// file.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class GroundTruthManifest {
  @_s.JsonKey(name: 'S3Object')
  final S3Object s3Object;

  GroundTruthManifest({
    this.s3Object,
  });
  factory GroundTruthManifest.fromJson(Map<String, dynamic> json) =>
      _$GroundTruthManifestFromJson(json);

  Map<String, dynamic> toJson() => _$GroundTruthManifestToJson(this);
}

/// Shows the results of the human in the loop evaluation. If there is no
/// HumanLoopArn, the input did not trigger human review.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class HumanLoopActivationOutput {
  /// Shows the result of condition evaluations, including those conditions which
  /// activated a human review.
  @_s.JsonKey(name: 'HumanLoopActivationConditionsEvaluationResults')
  final Object humanLoopActivationConditionsEvaluationResults;

  /// Shows if and why human review was needed.
  @_s.JsonKey(name: 'HumanLoopActivationReasons')
  final List<String> humanLoopActivationReasons;

  /// The Amazon Resource Name (ARN) of the HumanLoop created.
  @_s.JsonKey(name: 'HumanLoopArn')
  final String humanLoopArn;

  HumanLoopActivationOutput({
    this.humanLoopActivationConditionsEvaluationResults,
    this.humanLoopActivationReasons,
    this.humanLoopArn,
  });
  factory HumanLoopActivationOutput.fromJson(Map<String, dynamic> json) =>
      _$HumanLoopActivationOutputFromJson(json);
}

/// Sets up the flow definition the image will be sent to if one of the
/// conditions is met. You can also set certain attributes of the image before
/// review.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class HumanLoopConfig {
  /// The Amazon Resource Name (ARN) of the flow definition. You can create a flow
  /// definition by using the Amazon Sagemaker <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/API_CreateFlowDefinition.html">CreateFlowDefinition</a>
  /// Operation.
  @_s.JsonKey(name: 'FlowDefinitionArn')
  final String flowDefinitionArn;

  /// The name of the human review used for this image. This should be kept unique
  /// within a region.
  @_s.JsonKey(name: 'HumanLoopName')
  final String humanLoopName;

  /// Sets attributes of the input data.
  @_s.JsonKey(name: 'DataAttributes')
  final HumanLoopDataAttributes dataAttributes;

  HumanLoopConfig({
    @_s.required this.flowDefinitionArn,
    @_s.required this.humanLoopName,
    this.dataAttributes,
  });
  Map<String, dynamic> toJson() => _$HumanLoopConfigToJson(this);
}

/// Allows you to set attributes of the image. Currently, you can declare an
/// image as free of personally identifiable information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class HumanLoopDataAttributes {
  /// Sets whether the input image is free of personally identifiable information.
  @_s.JsonKey(name: 'ContentClassifiers')
  final List<ContentClassifier> contentClassifiers;

  HumanLoopDataAttributes({
    this.contentClassifiers,
  });
  Map<String, dynamic> toJson() => _$HumanLoopDataAttributesToJson(this);
}

/// Provides the input image either as bytes or an S3 object.
///
/// You pass image bytes to an Amazon Rekognition API operation by using the
/// <code>Bytes</code> property. For example, you would use the
/// <code>Bytes</code> property to pass an image loaded from a local file
/// system. Image bytes passed by using the <code>Bytes</code> property must be
/// base64-encoded. Your code may not need to encode image bytes if you are
/// using an AWS SDK to call Amazon Rekognition API operations.
///
/// For more information, see Analyzing an Image Loaded from a Local File System
/// in the Amazon Rekognition Developer Guide.
///
/// You pass images stored in an S3 bucket to an Amazon Rekognition API
/// operation by using the <code>S3Object</code> property. Images stored in an
/// S3 bucket do not need to be base64-encoded.
///
/// The region for the S3 bucket containing the S3 object must match the region
/// you use for Amazon Rekognition operations.
///
/// If you use the AWS CLI to call Amazon Rekognition operations, passing image
/// bytes using the Bytes property is not supported. You must first upload the
/// image to an Amazon S3 bucket and then call the operation using the S3Object
/// property.
///
/// For Amazon Rekognition to process an S3 object, the user must have
/// permission to access the S3 object. For more information, see Resource Based
/// Policies in the Amazon Rekognition Developer Guide.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Image {
  /// Blob of image bytes up to 5 MBs.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'Bytes')
  final Uint8List bytes;

  /// Identifies an S3 object as the image source.
  @_s.JsonKey(name: 'S3Object')
  final S3Object s3Object;

  Image({
    this.bytes,
    this.s3Object,
  });
  Map<String, dynamic> toJson() => _$ImageToJson(this);
}

/// Identifies face image brightness and sharpness.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ImageQuality {
  /// Value representing brightness of the face. The service returns a value
  /// between 0 and 100 (inclusive). A higher value indicates a brighter face
  /// image.
  @_s.JsonKey(name: 'Brightness')
  final double brightness;

  /// Value representing sharpness of the face. The service returns a value
  /// between 0 and 100 (inclusive). A higher value indicates a sharper face
  /// image.
  @_s.JsonKey(name: 'Sharpness')
  final double sharpness;

  ImageQuality({
    this.brightness,
    this.sharpness,
  });
  factory ImageQuality.fromJson(Map<String, dynamic> json) =>
      _$ImageQualityFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class IndexFacesResponse {
  /// The version number of the face detection model that's associated with the
  /// input collection (<code>CollectionId</code>).
  @_s.JsonKey(name: 'FaceModelVersion')
  final String faceModelVersion;

  /// An array of faces detected and added to the collection. For more
  /// information, see Searching Faces in a Collection in the Amazon Rekognition
  /// Developer Guide.
  @_s.JsonKey(name: 'FaceRecords')
  final List<FaceRecord> faceRecords;

  /// If your collection is associated with a face detection model that's later
  /// than version 3.0, the value of <code>OrientationCorrection</code> is always
  /// null and no orientation information is returned.
  ///
  /// If your collection is associated with a face detection model that's version
  /// 3.0 or earlier, the following applies:
  ///
  /// <ul>
  /// <li>
  /// If the input image is in .jpeg format, it might contain exchangeable image
  /// file format (Exif) metadata that includes the image's orientation. Amazon
  /// Rekognition uses this orientation information to perform image correction -
  /// the bounding box coordinates are translated to represent object locations
  /// after the orientation information in the Exif metadata is used to correct
  /// the image orientation. Images in .png format don't contain Exif metadata.
  /// The value of <code>OrientationCorrection</code> is null.
  /// </li>
  /// <li>
  /// If the image doesn't contain orientation information in its Exif metadata,
  /// Amazon Rekognition returns an estimated orientation (ROTATE_0, ROTATE_90,
  /// ROTATE_180, ROTATE_270). Amazon Rekognition doesn’t perform image correction
  /// for images. The bounding box coordinates aren't translated and represent the
  /// object locations before the image is rotated.
  /// </li>
  /// </ul>
  /// Bounding box information is returned in the <code>FaceRecords</code> array.
  /// You can get the version of the face detection model by calling
  /// <a>DescribeCollection</a>.
  @_s.JsonKey(name: 'OrientationCorrection')
  final OrientationCorrection orientationCorrection;

  /// An array of faces that were detected in the image but weren't indexed. They
  /// weren't indexed because the quality filter identified them as low quality,
  /// or the <code>MaxFaces</code> request parameter filtered them out. To use the
  /// quality filter, you specify the <code>QualityFilter</code> request
  /// parameter.
  @_s.JsonKey(name: 'UnindexedFaces')
  final List<UnindexedFace> unindexedFaces;

  IndexFacesResponse({
    this.faceModelVersion,
    this.faceRecords,
    this.orientationCorrection,
    this.unindexedFaces,
  });
  factory IndexFacesResponse.fromJson(Map<String, dynamic> json) =>
      _$IndexFacesResponseFromJson(json);
}

/// An instance of a label returned by Amazon Rekognition Image
/// (<a>DetectLabels</a>) or by Amazon Rekognition Video
/// (<a>GetLabelDetection</a>).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Instance {
  /// The position of the label instance on the image.
  @_s.JsonKey(name: 'BoundingBox')
  final BoundingBox boundingBox;

  /// The confidence that Amazon Rekognition has in the accuracy of the bounding
  /// box.
  @_s.JsonKey(name: 'Confidence')
  final double confidence;

  Instance({
    this.boundingBox,
    this.confidence,
  });
  factory Instance.fromJson(Map<String, dynamic> json) =>
      _$InstanceFromJson(json);
}

/// The Kinesis data stream Amazon Rekognition to which the analysis results of
/// a Amazon Rekognition stream processor are streamed. For more information,
/// see CreateStreamProcessor in the Amazon Rekognition Developer Guide.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class KinesisDataStream {
  /// ARN of the output Amazon Kinesis Data Streams stream.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  KinesisDataStream({
    this.arn,
  });
  factory KinesisDataStream.fromJson(Map<String, dynamic> json) =>
      _$KinesisDataStreamFromJson(json);

  Map<String, dynamic> toJson() => _$KinesisDataStreamToJson(this);
}

/// Kinesis video stream stream that provides the source streaming video for a
/// Amazon Rekognition Video stream processor. For more information, see
/// CreateStreamProcessor in the Amazon Rekognition Developer Guide.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class KinesisVideoStream {
  /// ARN of the Kinesis video stream stream that streams the source video.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  KinesisVideoStream({
    this.arn,
  });
  factory KinesisVideoStream.fromJson(Map<String, dynamic> json) =>
      _$KinesisVideoStreamFromJson(json);

  Map<String, dynamic> toJson() => _$KinesisVideoStreamToJson(this);
}

/// Structure containing details about the detected label, including the name,
/// detected instances, parent labels, and level of confidence.
///
///
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Label {
  /// Level of confidence.
  @_s.JsonKey(name: 'Confidence')
  final double confidence;

  /// If <code>Label</code> represents an object, <code>Instances</code> contains
  /// the bounding boxes for each instance of the detected object. Bounding boxes
  /// are returned for common object labels such as people, cars, furniture,
  /// apparel or pets.
  @_s.JsonKey(name: 'Instances')
  final List<Instance> instances;

  /// The name (label) of the object or scene.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The parent labels for a label. The response includes all ancestor labels.
  @_s.JsonKey(name: 'Parents')
  final List<Parent> parents;

  Label({
    this.confidence,
    this.instances,
    this.name,
    this.parents,
  });
  factory Label.fromJson(Map<String, dynamic> json) => _$LabelFromJson(json);
}

/// Information about a label detected in a video analysis request and the time
/// the label was detected in the video.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LabelDetection {
  /// Details about the detected label.
  @_s.JsonKey(name: 'Label')
  final Label label;

  /// Time, in milliseconds from the start of the video, that the label was
  /// detected.
  @_s.JsonKey(name: 'Timestamp')
  final int timestamp;

  LabelDetection({
    this.label,
    this.timestamp,
  });
  factory LabelDetection.fromJson(Map<String, dynamic> json) =>
      _$LabelDetectionFromJson(json);
}

enum LabelDetectionSortBy {
  @_s.JsonValue('NAME')
  name,
  @_s.JsonValue('TIMESTAMP')
  timestamp,
}

extension on LabelDetectionSortBy {
  String toValue() {
    switch (this) {
      case LabelDetectionSortBy.name:
        return 'NAME';
      case LabelDetectionSortBy.timestamp:
        return 'TIMESTAMP';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Indicates the location of the landmark on the face.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Landmark {
  /// Type of landmark.
  @_s.JsonKey(name: 'Type')
  final LandmarkType type;

  /// The x-coordinate of the landmark expressed as a ratio of the width of the
  /// image. The x-coordinate is measured from the left-side of the image. For
  /// example, if the image is 700 pixels wide and the x-coordinate of the
  /// landmark is at 350 pixels, this value is 0.5.
  @_s.JsonKey(name: 'X')
  final double x;

  /// The y-coordinate of the landmark expressed as a ratio of the height of the
  /// image. The y-coordinate is measured from the top of the image. For example,
  /// if the image height is 200 pixels and the y-coordinate of the landmark is at
  /// 50 pixels, this value is 0.25.
  @_s.JsonKey(name: 'Y')
  final double y;

  Landmark({
    this.type,
    this.x,
    this.y,
  });
  factory Landmark.fromJson(Map<String, dynamic> json) =>
      _$LandmarkFromJson(json);
}

enum LandmarkType {
  @_s.JsonValue('eyeLeft')
  eyeLeft,
  @_s.JsonValue('eyeRight')
  eyeRight,
  @_s.JsonValue('nose')
  nose,
  @_s.JsonValue('mouthLeft')
  mouthLeft,
  @_s.JsonValue('mouthRight')
  mouthRight,
  @_s.JsonValue('leftEyeBrowLeft')
  leftEyeBrowLeft,
  @_s.JsonValue('leftEyeBrowRight')
  leftEyeBrowRight,
  @_s.JsonValue('leftEyeBrowUp')
  leftEyeBrowUp,
  @_s.JsonValue('rightEyeBrowLeft')
  rightEyeBrowLeft,
  @_s.JsonValue('rightEyeBrowRight')
  rightEyeBrowRight,
  @_s.JsonValue('rightEyeBrowUp')
  rightEyeBrowUp,
  @_s.JsonValue('leftEyeLeft')
  leftEyeLeft,
  @_s.JsonValue('leftEyeRight')
  leftEyeRight,
  @_s.JsonValue('leftEyeUp')
  leftEyeUp,
  @_s.JsonValue('leftEyeDown')
  leftEyeDown,
  @_s.JsonValue('rightEyeLeft')
  rightEyeLeft,
  @_s.JsonValue('rightEyeRight')
  rightEyeRight,
  @_s.JsonValue('rightEyeUp')
  rightEyeUp,
  @_s.JsonValue('rightEyeDown')
  rightEyeDown,
  @_s.JsonValue('noseLeft')
  noseLeft,
  @_s.JsonValue('noseRight')
  noseRight,
  @_s.JsonValue('mouthUp')
  mouthUp,
  @_s.JsonValue('mouthDown')
  mouthDown,
  @_s.JsonValue('leftPupil')
  leftPupil,
  @_s.JsonValue('rightPupil')
  rightPupil,
  @_s.JsonValue('upperJawlineLeft')
  upperJawlineLeft,
  @_s.JsonValue('midJawlineLeft')
  midJawlineLeft,
  @_s.JsonValue('chinBottom')
  chinBottom,
  @_s.JsonValue('midJawlineRight')
  midJawlineRight,
  @_s.JsonValue('upperJawlineRight')
  upperJawlineRight,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListCollectionsResponse {
  /// An array of collection IDs.
  @_s.JsonKey(name: 'CollectionIds')
  final List<String> collectionIds;

  /// Version numbers of the face detection models associated with the collections
  /// in the array <code>CollectionIds</code>. For example, the value of
  /// <code>FaceModelVersions[2]</code> is the version number for the face
  /// detection model used by the collection in <code>CollectionId[2]</code>.
  @_s.JsonKey(name: 'FaceModelVersions')
  final List<String> faceModelVersions;

  /// If the result is truncated, the response provides a <code>NextToken</code>
  /// that you can use in the subsequent request to fetch the next set of
  /// collection IDs.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListCollectionsResponse({
    this.collectionIds,
    this.faceModelVersions,
    this.nextToken,
  });
  factory ListCollectionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListCollectionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListFacesResponse {
  /// Version number of the face detection model associated with the input
  /// collection (<code>CollectionId</code>).
  @_s.JsonKey(name: 'FaceModelVersion')
  final String faceModelVersion;

  /// An array of <code>Face</code> objects.
  @_s.JsonKey(name: 'Faces')
  final List<Face> faces;

  /// If the response is truncated, Amazon Rekognition returns this token that you
  /// can use in the subsequent request to retrieve the next set of faces.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListFacesResponse({
    this.faceModelVersion,
    this.faces,
    this.nextToken,
  });
  factory ListFacesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListFacesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListStreamProcessorsResponse {
  /// If the response is truncated, Amazon Rekognition Video returns this token
  /// that you can use in the subsequent request to retrieve the next set of
  /// stream processors.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// List of stream processors that you have created.
  @_s.JsonKey(name: 'StreamProcessors')
  final List<StreamProcessor> streamProcessors;

  ListStreamProcessorsResponse({
    this.nextToken,
    this.streamProcessors,
  });
  factory ListStreamProcessorsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListStreamProcessorsResponseFromJson(json);
}

/// Provides information about a single type of unsafe content found in an image
/// or video. Each type of moderated content has a label within a hierarchical
/// taxonomy. For more information, see Detecting Unsafe Content in the Amazon
/// Rekognition Developer Guide.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ModerationLabel {
  /// Specifies the confidence that Amazon Rekognition has that the label has been
  /// correctly identified.
  ///
  /// If you don't specify the <code>MinConfidence</code> parameter in the call to
  /// <code>DetectModerationLabels</code>, the operation returns labels with a
  /// confidence value greater than or equal to 50 percent.
  @_s.JsonKey(name: 'Confidence')
  final double confidence;

  /// The label name for the type of unsafe content detected in the image.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The name for the parent label. Labels at the top level of the hierarchy have
  /// the parent label <code>""</code>.
  @_s.JsonKey(name: 'ParentName')
  final String parentName;

  ModerationLabel({
    this.confidence,
    this.name,
    this.parentName,
  });
  factory ModerationLabel.fromJson(Map<String, dynamic> json) =>
      _$ModerationLabelFromJson(json);
}

/// Indicates whether or not the mouth on the face is open, and the confidence
/// level in the determination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MouthOpen {
  /// Level of confidence in the determination.
  @_s.JsonKey(name: 'Confidence')
  final double confidence;

  /// Boolean value that indicates whether the mouth on the face is open or not.
  @_s.JsonKey(name: 'Value')
  final bool value;

  MouthOpen({
    this.confidence,
    this.value,
  });
  factory MouthOpen.fromJson(Map<String, dynamic> json) =>
      _$MouthOpenFromJson(json);
}

/// Indicates whether or not the face has a mustache, and the confidence level
/// in the determination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Mustache {
  /// Level of confidence in the determination.
  @_s.JsonKey(name: 'Confidence')
  final double confidence;

  /// Boolean value that indicates whether the face has mustache or not.
  @_s.JsonKey(name: 'Value')
  final bool value;

  Mustache({
    this.confidence,
    this.value,
  });
  factory Mustache.fromJson(Map<String, dynamic> json) =>
      _$MustacheFromJson(json);
}

/// The Amazon Simple Notification Service topic to which Amazon Rekognition
/// publishes the completion status of a video analysis operation. For more
/// information, see <a>api-video</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class NotificationChannel {
  /// The ARN of an IAM role that gives Amazon Rekognition publishing permissions
  /// to the Amazon SNS topic.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;

  /// The Amazon SNS topic to which Amazon Rekognition to posts the completion
  /// status.
  @_s.JsonKey(name: 'SNSTopicArn')
  final String sNSTopicArn;

  NotificationChannel({
    @_s.required this.roleArn,
    @_s.required this.sNSTopicArn,
  });
  Map<String, dynamic> toJson() => _$NotificationChannelToJson(this);
}

enum OrientationCorrection {
  @_s.JsonValue('ROTATE_0')
  rotate_0,
  @_s.JsonValue('ROTATE_90')
  rotate_90,
  @_s.JsonValue('ROTATE_180')
  rotate_180,
  @_s.JsonValue('ROTATE_270')
  rotate_270,
}

/// The S3 bucket and folder location where training output is placed.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OutputConfig {
  /// The S3 bucket where training output is placed.
  @_s.JsonKey(name: 'S3Bucket')
  final String s3Bucket;

  /// The prefix applied to the training output files.
  @_s.JsonKey(name: 'S3KeyPrefix')
  final String s3KeyPrefix;

  OutputConfig({
    this.s3Bucket,
    this.s3KeyPrefix,
  });
  factory OutputConfig.fromJson(Map<String, dynamic> json) =>
      _$OutputConfigFromJson(json);

  Map<String, dynamic> toJson() => _$OutputConfigToJson(this);
}

/// A parent label for a label. A label can have 0, 1, or more parents.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Parent {
  /// The name of the parent label.
  @_s.JsonKey(name: 'Name')
  final String name;

  Parent({
    this.name,
  });
  factory Parent.fromJson(Map<String, dynamic> json) => _$ParentFromJson(json);
}

/// Details about a person detected in a video analysis request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PersonDetail {
  /// Bounding box around the detected person.
  @_s.JsonKey(name: 'BoundingBox')
  final BoundingBox boundingBox;

  /// Face details for the detected person.
  @_s.JsonKey(name: 'Face')
  final FaceDetail face;

  /// Identifier for the person detected person within a video. Use to keep track
  /// of the person throughout the video. The identifier is not stored by Amazon
  /// Rekognition.
  @_s.JsonKey(name: 'Index')
  final int index;

  PersonDetail({
    this.boundingBox,
    this.face,
    this.index,
  });
  factory PersonDetail.fromJson(Map<String, dynamic> json) =>
      _$PersonDetailFromJson(json);
}

/// Details and path tracking information for a single time a person's path is
/// tracked in a video. Amazon Rekognition operations that track people's paths
/// return an array of <code>PersonDetection</code> objects with elements for
/// each time a person's path is tracked in a video.
///
/// For more information, see GetPersonTracking in the Amazon Rekognition
/// Developer Guide.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PersonDetection {
  /// Details about a person whose path was tracked in a video.
  @_s.JsonKey(name: 'Person')
  final PersonDetail person;

  /// The time, in milliseconds from the start of the video, that the person's
  /// path was tracked.
  @_s.JsonKey(name: 'Timestamp')
  final int timestamp;

  PersonDetection({
    this.person,
    this.timestamp,
  });
  factory PersonDetection.fromJson(Map<String, dynamic> json) =>
      _$PersonDetectionFromJson(json);
}

/// Information about a person whose face matches a face(s) in an Amazon
/// Rekognition collection. Includes information about the faces in the Amazon
/// Rekognition collection (<a>FaceMatch</a>), information about the person
/// (<a>PersonDetail</a>), and the time stamp for when the person was detected
/// in a video. An array of <code>PersonMatch</code> objects is returned by
/// <a>GetFaceSearch</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PersonMatch {
  /// Information about the faces in the input collection that match the face of a
  /// person in the video.
  @_s.JsonKey(name: 'FaceMatches')
  final List<FaceMatch> faceMatches;

  /// Information about the matched person.
  @_s.JsonKey(name: 'Person')
  final PersonDetail person;

  /// The time, in milliseconds from the beginning of the video, that the person
  /// was matched in the video.
  @_s.JsonKey(name: 'Timestamp')
  final int timestamp;

  PersonMatch({
    this.faceMatches,
    this.person,
    this.timestamp,
  });
  factory PersonMatch.fromJson(Map<String, dynamic> json) =>
      _$PersonMatchFromJson(json);
}

enum PersonTrackingSortBy {
  @_s.JsonValue('INDEX')
  $index,
  @_s.JsonValue('TIMESTAMP')
  timestamp,
}

extension on PersonTrackingSortBy {
  String toValue() {
    switch (this) {
      case PersonTrackingSortBy.$index:
        return 'INDEX';
      case PersonTrackingSortBy.timestamp:
        return 'TIMESTAMP';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The X and Y coordinates of a point on an image. The X and Y values returned
/// are ratios of the overall image size. For example, if the input image is
/// 700x200 and the operation returns X=0.5 and Y=0.25, then the point is at the
/// (350,50) pixel coordinate on the image.
///
/// An array of <code>Point</code> objects, <code>Polygon</code>, is returned by
/// <a>DetectText</a> and by <a>DetectCustomLabels</a>. <code>Polygon</code>
/// represents a fine-grained polygon around a detected item. For more
/// information, see Geometry in the Amazon Rekognition Developer Guide.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Point {
  /// The value of the X coordinate for a point on a <code>Polygon</code>.
  @_s.JsonKey(name: 'X')
  final double x;

  /// The value of the Y coordinate for a point on a <code>Polygon</code>.
  @_s.JsonKey(name: 'Y')
  final double y;

  Point({
    this.x,
    this.y,
  });
  factory Point.fromJson(Map<String, dynamic> json) => _$PointFromJson(json);
}

/// Indicates the pose of the face as determined by its pitch, roll, and yaw.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Pose {
  /// Value representing the face rotation on the pitch axis.
  @_s.JsonKey(name: 'Pitch')
  final double pitch;

  /// Value representing the face rotation on the roll axis.
  @_s.JsonKey(name: 'Roll')
  final double roll;

  /// Value representing the face rotation on the yaw axis.
  @_s.JsonKey(name: 'Yaw')
  final double yaw;

  Pose({
    this.pitch,
    this.roll,
    this.yaw,
  });
  factory Pose.fromJson(Map<String, dynamic> json) => _$PoseFromJson(json);
}

/// A description of a Amazon Rekognition Custom Labels project.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProjectDescription {
  /// The Unix timestamp for the date and time that the project was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationTimestamp')
  final DateTime creationTimestamp;

  /// The Amazon Resource Name (ARN) of the project.
  @_s.JsonKey(name: 'ProjectArn')
  final String projectArn;

  /// The current status of the project.
  @_s.JsonKey(name: 'Status')
  final ProjectStatus status;

  ProjectDescription({
    this.creationTimestamp,
    this.projectArn,
    this.status,
  });
  factory ProjectDescription.fromJson(Map<String, dynamic> json) =>
      _$ProjectDescriptionFromJson(json);
}

enum ProjectStatus {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('CREATED')
  created,
  @_s.JsonValue('DELETING')
  deleting,
}

/// The description of a version of a model.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProjectVersionDescription {
  /// The duration, in seconds, that the model version has been billed for
  /// training. This value is only returned if the model version has been
  /// successfully trained.
  @_s.JsonKey(name: 'BillableTrainingTimeInSeconds')
  final int billableTrainingTimeInSeconds;

  /// The Unix datetime for the date and time that training started.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationTimestamp')
  final DateTime creationTimestamp;

  /// The training results. <code>EvaluationResult</code> is only returned if
  /// training is successful.
  @_s.JsonKey(name: 'EvaluationResult')
  final EvaluationResult evaluationResult;

  /// The location of the summary manifest. The summary manifest provides
  /// aggregate data validation results for the training and test datasets.
  @_s.JsonKey(name: 'ManifestSummary')
  final GroundTruthManifest manifestSummary;

  /// The minimum number of inference units used by the model. For more
  /// information, see <a>StartProjectVersion</a>.
  @_s.JsonKey(name: 'MinInferenceUnits')
  final int minInferenceUnits;

  /// The location where training results are saved.
  @_s.JsonKey(name: 'OutputConfig')
  final OutputConfig outputConfig;

  /// The Amazon Resource Name (ARN) of the model version.
  @_s.JsonKey(name: 'ProjectVersionArn')
  final String projectVersionArn;

  /// The current status of the model version.
  @_s.JsonKey(name: 'Status')
  final ProjectVersionStatus status;

  /// A descriptive message for an error or warning that occurred.
  @_s.JsonKey(name: 'StatusMessage')
  final String statusMessage;

  /// Contains information about the testing results.
  @_s.JsonKey(name: 'TestingDataResult')
  final TestingDataResult testingDataResult;

  /// Contains information about the training results.
  @_s.JsonKey(name: 'TrainingDataResult')
  final TrainingDataResult trainingDataResult;

  /// The Unix date and time that training of the model ended.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'TrainingEndTimestamp')
  final DateTime trainingEndTimestamp;

  ProjectVersionDescription({
    this.billableTrainingTimeInSeconds,
    this.creationTimestamp,
    this.evaluationResult,
    this.manifestSummary,
    this.minInferenceUnits,
    this.outputConfig,
    this.projectVersionArn,
    this.status,
    this.statusMessage,
    this.testingDataResult,
    this.trainingDataResult,
    this.trainingEndTimestamp,
  });
  factory ProjectVersionDescription.fromJson(Map<String, dynamic> json) =>
      _$ProjectVersionDescriptionFromJson(json);
}

enum ProjectVersionStatus {
  @_s.JsonValue('TRAINING_IN_PROGRESS')
  trainingInProgress,
  @_s.JsonValue('TRAINING_COMPLETED')
  trainingCompleted,
  @_s.JsonValue('TRAINING_FAILED')
  trainingFailed,
  @_s.JsonValue('STARTING')
  starting,
  @_s.JsonValue('RUNNING')
  running,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('STOPPING')
  stopping,
  @_s.JsonValue('STOPPED')
  stopped,
  @_s.JsonValue('DELETING')
  deleting,
}

/// Information about a body part detected by <a>DetectProtectiveEquipment</a>
/// that contains PPE. An array of <code>ProtectiveEquipmentBodyPart</code>
/// objects is returned for each person detected by
/// <code>DetectProtectiveEquipment</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProtectiveEquipmentBodyPart {
  /// The confidence that Amazon Rekognition has in the detection accuracy of the
  /// detected body part.
  @_s.JsonKey(name: 'Confidence')
  final double confidence;

  /// An array of Personal Protective Equipment items detected around a body part.
  @_s.JsonKey(name: 'EquipmentDetections')
  final List<EquipmentDetection> equipmentDetections;

  /// The detected body part.
  @_s.JsonKey(name: 'Name')
  final BodyPart name;

  ProtectiveEquipmentBodyPart({
    this.confidence,
    this.equipmentDetections,
    this.name,
  });
  factory ProtectiveEquipmentBodyPart.fromJson(Map<String, dynamic> json) =>
      _$ProtectiveEquipmentBodyPartFromJson(json);
}

/// A person detected by a call to <a>DetectProtectiveEquipment</a>. The API
/// returns all persons detected in the input image in an array of
/// <code>ProtectiveEquipmentPerson</code> objects.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProtectiveEquipmentPerson {
  /// An array of body parts detected on a person's body (including body parts
  /// without PPE).
  @_s.JsonKey(name: 'BodyParts')
  final List<ProtectiveEquipmentBodyPart> bodyParts;

  /// A bounding box around the detected person.
  @_s.JsonKey(name: 'BoundingBox')
  final BoundingBox boundingBox;

  /// The confidence that Amazon Rekognition has that the bounding box contains a
  /// person.
  @_s.JsonKey(name: 'Confidence')
  final double confidence;

  /// The identifier for the detected person. The identifier is only unique for a
  /// single call to <code>DetectProtectiveEquipment</code>.
  @_s.JsonKey(name: 'Id')
  final int id;

  ProtectiveEquipmentPerson({
    this.bodyParts,
    this.boundingBox,
    this.confidence,
    this.id,
  });
  factory ProtectiveEquipmentPerson.fromJson(Map<String, dynamic> json) =>
      _$ProtectiveEquipmentPersonFromJson(json);
}

/// Specifies summary attributes to return from a call to
/// <a>DetectProtectiveEquipment</a>. You can specify which types of PPE to
/// summarize. You can also specify a minimum confidence value for detections.
/// Summary information is returned in the <code>Summary</code>
/// (<a>ProtectiveEquipmentSummary</a>) field of the response from
/// <code>DetectProtectiveEquipment</code>. The summary includes which persons
/// in an image were detected wearing the requested types of person protective
/// equipment (PPE), which persons were detected as not wearing PPE, and the
/// persons in which a determination could not be made. For more information,
/// see <a>ProtectiveEquipmentSummary</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ProtectiveEquipmentSummarizationAttributes {
  /// The minimum confidence level for which you want summary information. The
  /// confidence level applies to person detection, body part detection, equipment
  /// detection, and body part coverage. Amazon Rekognition doesn't return summary
  /// information with a confidence than this specified value. There isn't a
  /// default value.
  ///
  /// Specify a <code>MinConfidence</code> value that is between 50-100% as
  /// <code>DetectProtectiveEquipment</code> returns predictions only where the
  /// detection confidence is between 50% - 100%. If you specify a value that is
  /// less than 50%, the results are the same specifying a value of 50%.
  ///
  ///
  @_s.JsonKey(name: 'MinConfidence')
  final double minConfidence;

  /// An array of personal protective equipment types for which you want summary
  /// information. If a person is detected wearing a required requipment type, the
  /// person's ID is added to the <code>PersonsWithRequiredEquipment</code> array
  /// field returned in <a>ProtectiveEquipmentSummary</a> by
  /// <code>DetectProtectiveEquipment</code>.
  @_s.JsonKey(name: 'RequiredEquipmentTypes')
  final List<ProtectiveEquipmentType> requiredEquipmentTypes;

  ProtectiveEquipmentSummarizationAttributes({
    @_s.required this.minConfidence,
    @_s.required this.requiredEquipmentTypes,
  });
  Map<String, dynamic> toJson() =>
      _$ProtectiveEquipmentSummarizationAttributesToJson(this);
}

/// Summary information for required items of personal protective equipment
/// (PPE) detected on persons by a call to <a>DetectProtectiveEquipment</a>. You
/// specify the required type of PPE in the <code>SummarizationAttributes</code>
/// (<a>ProtectiveEquipmentSummarizationAttributes</a>) input parameter. The
/// summary includes which persons were detected wearing the required personal
/// protective equipment (<code>PersonsWithRequiredEquipment</code>), which
/// persons were detected as not wearing the required PPE
/// (<code>PersonsWithoutRequiredEquipment</code>), and the persons in which a
/// determination could not be made (<code>PersonsIndeterminate</code>).
///
/// To get a total for each category, use the size of the field array. For
/// example, to find out how many people were detected as wearing the specified
/// PPE, use the size of the <code>PersonsWithRequiredEquipment</code> array. If
/// you want to find out more about a person, such as the location
/// (<a>BoundingBox</a>) of the person on the image, use the person ID in each
/// array element. Each person ID matches the ID field of a
/// <a>ProtectiveEquipmentPerson</a> object returned in the <code>Persons</code>
/// array by <code>DetectProtectiveEquipment</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProtectiveEquipmentSummary {
  /// An array of IDs for persons where it was not possible to determine if they
  /// are wearing personal protective equipment.
  @_s.JsonKey(name: 'PersonsIndeterminate')
  final List<int> personsIndeterminate;

  /// An array of IDs for persons who are wearing detected personal protective
  /// equipment.
  @_s.JsonKey(name: 'PersonsWithRequiredEquipment')
  final List<int> personsWithRequiredEquipment;

  /// An array of IDs for persons who are not wearing all of the types of PPE
  /// specified in the RequiredEquipmentTypes field of the detected personal
  /// protective equipment.
  @_s.JsonKey(name: 'PersonsWithoutRequiredEquipment')
  final List<int> personsWithoutRequiredEquipment;

  ProtectiveEquipmentSummary({
    this.personsIndeterminate,
    this.personsWithRequiredEquipment,
    this.personsWithoutRequiredEquipment,
  });
  factory ProtectiveEquipmentSummary.fromJson(Map<String, dynamic> json) =>
      _$ProtectiveEquipmentSummaryFromJson(json);
}

enum ProtectiveEquipmentType {
  @_s.JsonValue('FACE_COVER')
  faceCover,
  @_s.JsonValue('HAND_COVER')
  handCover,
  @_s.JsonValue('HEAD_COVER')
  headCover,
}

enum QualityFilter {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('AUTO')
  auto,
  @_s.JsonValue('LOW')
  low,
  @_s.JsonValue('MEDIUM')
  medium,
  @_s.JsonValue('HIGH')
  high,
}

extension on QualityFilter {
  String toValue() {
    switch (this) {
      case QualityFilter.none:
        return 'NONE';
      case QualityFilter.auto:
        return 'AUTO';
      case QualityFilter.low:
        return 'LOW';
      case QualityFilter.medium:
        return 'MEDIUM';
      case QualityFilter.high:
        return 'HIGH';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum Reason {
  @_s.JsonValue('EXCEEDS_MAX_FACES')
  exceedsMaxFaces,
  @_s.JsonValue('EXTREME_POSE')
  extremePose,
  @_s.JsonValue('LOW_BRIGHTNESS')
  lowBrightness,
  @_s.JsonValue('LOW_SHARPNESS')
  lowSharpness,
  @_s.JsonValue('LOW_CONFIDENCE')
  lowConfidence,
  @_s.JsonValue('SMALL_BOUNDING_BOX')
  smallBoundingBox,
  @_s.JsonValue('LOW_FACE_QUALITY')
  lowFaceQuality,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RecognizeCelebritiesResponse {
  /// Details about each celebrity found in the image. Amazon Rekognition can
  /// detect a maximum of 64 celebrities in an image.
  @_s.JsonKey(name: 'CelebrityFaces')
  final List<Celebrity> celebrityFaces;

  /// The orientation of the input image (counterclockwise direction). If your
  /// application displays the image, you can use this value to correct the
  /// orientation. The bounding box coordinates returned in
  /// <code>CelebrityFaces</code> and <code>UnrecognizedFaces</code> represent
  /// face locations before the image orientation is corrected.
  /// <note>
  /// If the input image is in .jpeg format, it might contain exchangeable image
  /// (Exif) metadata that includes the image's orientation. If so, and the Exif
  /// metadata for the input image populates the orientation field, the value of
  /// <code>OrientationCorrection</code> is null. The <code>CelebrityFaces</code>
  /// and <code>UnrecognizedFaces</code> bounding box coordinates represent face
  /// locations after Exif metadata is used to correct the image orientation.
  /// Images in .png format don't contain Exif metadata.
  /// </note>
  @_s.JsonKey(name: 'OrientationCorrection')
  final OrientationCorrection orientationCorrection;

  /// Details about each unrecognized face in the image.
  @_s.JsonKey(name: 'UnrecognizedFaces')
  final List<ComparedFace> unrecognizedFaces;

  RecognizeCelebritiesResponse({
    this.celebrityFaces,
    this.orientationCorrection,
    this.unrecognizedFaces,
  });
  factory RecognizeCelebritiesResponse.fromJson(Map<String, dynamic> json) =>
      _$RecognizeCelebritiesResponseFromJson(json);
}

/// Specifies a location within the frame that Rekognition checks for text. Uses
/// a <code>BoundingBox</code> object to set a region of the screen.
///
/// A word is included in the region if the word is more than half in that
/// region. If there is more than one region, the word will be compared with all
/// regions of the screen. Any word more than half in a region is kept in the
/// results.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class RegionOfInterest {
  /// The box representing a region of interest on screen.
  @_s.JsonKey(name: 'BoundingBox')
  final BoundingBox boundingBox;

  RegionOfInterest({
    this.boundingBox,
  });
  Map<String, dynamic> toJson() => _$RegionOfInterestToJson(this);
}

/// Provides the S3 bucket name and object name.
///
/// The region for the S3 bucket containing the S3 object must match the region
/// you use for Amazon Rekognition operations.
///
/// For Amazon Rekognition to process an S3 object, the user must have
/// permission to access the S3 object. For more information, see Resource-Based
/// Policies in the Amazon Rekognition Developer Guide.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class S3Object {
  /// Name of the S3 bucket.
  @_s.JsonKey(name: 'Bucket')
  final String bucket;

  /// S3 object key name.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// If the bucket is versioning enabled, you can specify the object version.
  @_s.JsonKey(name: 'Version')
  final String version;

  S3Object({
    this.bucket,
    this.name,
    this.version,
  });
  factory S3Object.fromJson(Map<String, dynamic> json) =>
      _$S3ObjectFromJson(json);

  Map<String, dynamic> toJson() => _$S3ObjectToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SearchFacesByImageResponse {
  /// An array of faces that match the input face, along with the confidence in
  /// the match.
  @_s.JsonKey(name: 'FaceMatches')
  final List<FaceMatch> faceMatches;

  /// Version number of the face detection model associated with the input
  /// collection (<code>CollectionId</code>).
  @_s.JsonKey(name: 'FaceModelVersion')
  final String faceModelVersion;

  /// The bounding box around the face in the input image that Amazon Rekognition
  /// used for the search.
  @_s.JsonKey(name: 'SearchedFaceBoundingBox')
  final BoundingBox searchedFaceBoundingBox;

  /// The level of confidence that the <code>searchedFaceBoundingBox</code>,
  /// contains a face.
  @_s.JsonKey(name: 'SearchedFaceConfidence')
  final double searchedFaceConfidence;

  SearchFacesByImageResponse({
    this.faceMatches,
    this.faceModelVersion,
    this.searchedFaceBoundingBox,
    this.searchedFaceConfidence,
  });
  factory SearchFacesByImageResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchFacesByImageResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SearchFacesResponse {
  /// An array of faces that matched the input face, along with the confidence in
  /// the match.
  @_s.JsonKey(name: 'FaceMatches')
  final List<FaceMatch> faceMatches;

  /// Version number of the face detection model associated with the input
  /// collection (<code>CollectionId</code>).
  @_s.JsonKey(name: 'FaceModelVersion')
  final String faceModelVersion;

  /// ID of the face that was searched for matches in a collection.
  @_s.JsonKey(name: 'SearchedFaceId')
  final String searchedFaceId;

  SearchFacesResponse({
    this.faceMatches,
    this.faceModelVersion,
    this.searchedFaceId,
  });
  factory SearchFacesResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchFacesResponseFromJson(json);
}

/// A technical cue or shot detection segment detected in a video. An array of
/// <code>SegmentDetection</code> objects containing all segments detected in a
/// stored video is returned by <a>GetSegmentDetection</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SegmentDetection {
  /// The duration of the detected segment in milliseconds.
  @_s.JsonKey(name: 'DurationMillis')
  final int durationMillis;

  /// The duration of the timecode for the detected segment in SMPTE format.
  @_s.JsonKey(name: 'DurationSMPTE')
  final String durationSMPTE;

  /// The frame-accurate SMPTE timecode, from the start of a video, for the end of
  /// a detected segment. <code>EndTimecode</code> is in <i>HH:MM:SS:fr</i> format
  /// (and <i>;fr</i> for drop frame-rates).
  @_s.JsonKey(name: 'EndTimecodeSMPTE')
  final String endTimecodeSMPTE;

  /// The end time of the detected segment, in milliseconds, from the start of the
  /// video. This value is rounded down.
  @_s.JsonKey(name: 'EndTimestampMillis')
  final int endTimestampMillis;

  /// If the segment is a shot detection, contains information about the shot
  /// detection.
  @_s.JsonKey(name: 'ShotSegment')
  final ShotSegment shotSegment;

  /// The frame-accurate SMPTE timecode, from the start of a video, for the start
  /// of a detected segment. <code>StartTimecode</code> is in <i>HH:MM:SS:fr</i>
  /// format (and <i>;fr</i> for drop frame-rates).
  @_s.JsonKey(name: 'StartTimecodeSMPTE')
  final String startTimecodeSMPTE;

  /// The start time of the detected segment in milliseconds from the start of the
  /// video. This value is rounded down. For example, if the actual timestamp is
  /// 100.6667 milliseconds, Amazon Rekognition Video returns a value of 100
  /// millis.
  @_s.JsonKey(name: 'StartTimestampMillis')
  final int startTimestampMillis;

  /// If the segment is a technical cue, contains information about the technical
  /// cue.
  @_s.JsonKey(name: 'TechnicalCueSegment')
  final TechnicalCueSegment technicalCueSegment;

  /// The type of the segment. Valid values are <code>TECHNICAL_CUE</code> and
  /// <code>SHOT</code>.
  @_s.JsonKey(name: 'Type')
  final SegmentType type;

  SegmentDetection({
    this.durationMillis,
    this.durationSMPTE,
    this.endTimecodeSMPTE,
    this.endTimestampMillis,
    this.shotSegment,
    this.startTimecodeSMPTE,
    this.startTimestampMillis,
    this.technicalCueSegment,
    this.type,
  });
  factory SegmentDetection.fromJson(Map<String, dynamic> json) =>
      _$SegmentDetectionFromJson(json);
}

enum SegmentType {
  @_s.JsonValue('TECHNICAL_CUE')
  technicalCue,
  @_s.JsonValue('SHOT')
  shot,
}

extension on SegmentType {
  String toValue() {
    switch (this) {
      case SegmentType.technicalCue:
        return 'TECHNICAL_CUE';
      case SegmentType.shot:
        return 'SHOT';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Information about the type of a segment requested in a call to
/// <a>StartSegmentDetection</a>. An array of <code>SegmentTypeInfo</code>
/// objects is returned by the response from <a>GetSegmentDetection</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SegmentTypeInfo {
  /// The version of the model used to detect segments.
  @_s.JsonKey(name: 'ModelVersion')
  final String modelVersion;

  /// The type of a segment (technical cue or shot detection).
  @_s.JsonKey(name: 'Type')
  final SegmentType type;

  SegmentTypeInfo({
    this.modelVersion,
    this.type,
  });
  factory SegmentTypeInfo.fromJson(Map<String, dynamic> json) =>
      _$SegmentTypeInfoFromJson(json);
}

/// Information about a shot detection segment detected in a video. For more
/// information, see <a>SegmentDetection</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ShotSegment {
  /// The confidence that Amazon Rekognition Video has in the accuracy of the
  /// detected segment.
  @_s.JsonKey(name: 'Confidence')
  final double confidence;

  /// An Identifier for a shot detection segment detected in a video.
  @_s.JsonKey(name: 'Index')
  final int index;

  ShotSegment({
    this.confidence,
    this.index,
  });
  factory ShotSegment.fromJson(Map<String, dynamic> json) =>
      _$ShotSegmentFromJson(json);
}

/// Indicates whether or not the face is smiling, and the confidence level in
/// the determination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Smile {
  /// Level of confidence in the determination.
  @_s.JsonKey(name: 'Confidence')
  final double confidence;

  /// Boolean value that indicates whether the face is smiling or not.
  @_s.JsonKey(name: 'Value')
  final bool value;

  Smile({
    this.confidence,
    this.value,
  });
  factory Smile.fromJson(Map<String, dynamic> json) => _$SmileFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartCelebrityRecognitionResponse {
  /// The identifier for the celebrity recognition analysis job. Use
  /// <code>JobId</code> to identify the job in a subsequent call to
  /// <code>GetCelebrityRecognition</code>.
  @_s.JsonKey(name: 'JobId')
  final String jobId;

  StartCelebrityRecognitionResponse({
    this.jobId,
  });
  factory StartCelebrityRecognitionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$StartCelebrityRecognitionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartContentModerationResponse {
  /// The identifier for the unsafe content analysis job. Use <code>JobId</code>
  /// to identify the job in a subsequent call to
  /// <code>GetContentModeration</code>.
  @_s.JsonKey(name: 'JobId')
  final String jobId;

  StartContentModerationResponse({
    this.jobId,
  });
  factory StartContentModerationResponse.fromJson(Map<String, dynamic> json) =>
      _$StartContentModerationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartFaceDetectionResponse {
  /// The identifier for the face detection job. Use <code>JobId</code> to
  /// identify the job in a subsequent call to <code>GetFaceDetection</code>.
  @_s.JsonKey(name: 'JobId')
  final String jobId;

  StartFaceDetectionResponse({
    this.jobId,
  });
  factory StartFaceDetectionResponse.fromJson(Map<String, dynamic> json) =>
      _$StartFaceDetectionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartFaceSearchResponse {
  /// The identifier for the search job. Use <code>JobId</code> to identify the
  /// job in a subsequent call to <code>GetFaceSearch</code>.
  @_s.JsonKey(name: 'JobId')
  final String jobId;

  StartFaceSearchResponse({
    this.jobId,
  });
  factory StartFaceSearchResponse.fromJson(Map<String, dynamic> json) =>
      _$StartFaceSearchResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartLabelDetectionResponse {
  /// The identifier for the label detection job. Use <code>JobId</code> to
  /// identify the job in a subsequent call to <code>GetLabelDetection</code>.
  @_s.JsonKey(name: 'JobId')
  final String jobId;

  StartLabelDetectionResponse({
    this.jobId,
  });
  factory StartLabelDetectionResponse.fromJson(Map<String, dynamic> json) =>
      _$StartLabelDetectionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartPersonTrackingResponse {
  /// The identifier for the person detection job. Use <code>JobId</code> to
  /// identify the job in a subsequent call to <code>GetPersonTracking</code>.
  @_s.JsonKey(name: 'JobId')
  final String jobId;

  StartPersonTrackingResponse({
    this.jobId,
  });
  factory StartPersonTrackingResponse.fromJson(Map<String, dynamic> json) =>
      _$StartPersonTrackingResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartProjectVersionResponse {
  /// The current running status of the model.
  @_s.JsonKey(name: 'Status')
  final ProjectVersionStatus status;

  StartProjectVersionResponse({
    this.status,
  });
  factory StartProjectVersionResponse.fromJson(Map<String, dynamic> json) =>
      _$StartProjectVersionResponseFromJson(json);
}

/// Filters applied to the technical cue or shot detection segments. For more
/// information, see <a>StartSegmentDetection</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class StartSegmentDetectionFilters {
  /// Filters that are specific to shot detections.
  @_s.JsonKey(name: 'ShotFilter')
  final StartShotDetectionFilter shotFilter;

  /// Filters that are specific to technical cues.
  @_s.JsonKey(name: 'TechnicalCueFilter')
  final StartTechnicalCueDetectionFilter technicalCueFilter;

  StartSegmentDetectionFilters({
    this.shotFilter,
    this.technicalCueFilter,
  });
  Map<String, dynamic> toJson() => _$StartSegmentDetectionFiltersToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartSegmentDetectionResponse {
  /// Unique identifier for the segment detection job. The <code>JobId</code> is
  /// returned from <code>StartSegmentDetection</code>.
  @_s.JsonKey(name: 'JobId')
  final String jobId;

  StartSegmentDetectionResponse({
    this.jobId,
  });
  factory StartSegmentDetectionResponse.fromJson(Map<String, dynamic> json) =>
      _$StartSegmentDetectionResponseFromJson(json);
}

/// Filters for the shot detection segments returned by
/// <code>GetSegmentDetection</code>. For more information, see
/// <a>StartSegmentDetectionFilters</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class StartShotDetectionFilter {
  /// Specifies the minimum confidence that Amazon Rekognition Video must have in
  /// order to return a detected segment. Confidence represents how certain Amazon
  /// Rekognition is that a segment is correctly identified. 0 is the lowest
  /// confidence. 100 is the highest confidence. Amazon Rekognition Video doesn't
  /// return any segments with a confidence level lower than this specified value.
  ///
  /// If you don't specify <code>MinSegmentConfidence</code>, the
  /// <code>GetSegmentDetection</code> returns segments with confidence values
  /// greater than or equal to 50 percent.
  @_s.JsonKey(name: 'MinSegmentConfidence')
  final double minSegmentConfidence;

  StartShotDetectionFilter({
    this.minSegmentConfidence,
  });
  Map<String, dynamic> toJson() => _$StartShotDetectionFilterToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartStreamProcessorResponse {
  StartStreamProcessorResponse();
  factory StartStreamProcessorResponse.fromJson(Map<String, dynamic> json) =>
      _$StartStreamProcessorResponseFromJson(json);
}

/// Filters for the technical segments returned by <a>GetSegmentDetection</a>.
/// For more information, see <a>StartSegmentDetectionFilters</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class StartTechnicalCueDetectionFilter {
  /// Specifies the minimum confidence that Amazon Rekognition Video must have in
  /// order to return a detected segment. Confidence represents how certain Amazon
  /// Rekognition is that a segment is correctly identified. 0 is the lowest
  /// confidence. 100 is the highest confidence. Amazon Rekognition Video doesn't
  /// return any segments with a confidence level lower than this specified value.
  ///
  /// If you don't specify <code>MinSegmentConfidence</code>,
  /// <code>GetSegmentDetection</code> returns segments with confidence values
  /// greater than or equal to 50 percent.
  @_s.JsonKey(name: 'MinSegmentConfidence')
  final double minSegmentConfidence;

  StartTechnicalCueDetectionFilter({
    this.minSegmentConfidence,
  });
  Map<String, dynamic> toJson() =>
      _$StartTechnicalCueDetectionFilterToJson(this);
}

/// Set of optional parameters that let you set the criteria text must meet to
/// be included in your response. <code>WordFilter</code> looks at a word's
/// height, width and minimum confidence. <code>RegionOfInterest</code> lets you
/// set a specific region of the screen to look for text in.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class StartTextDetectionFilters {
  /// Filter focusing on a certain area of the frame. Uses a
  /// <code>BoundingBox</code> object to set the region of the screen.
  @_s.JsonKey(name: 'RegionsOfInterest')
  final List<RegionOfInterest> regionsOfInterest;

  /// Filters focusing on qualities of the text, such as confidence or size.
  @_s.JsonKey(name: 'WordFilter')
  final DetectionFilter wordFilter;

  StartTextDetectionFilters({
    this.regionsOfInterest,
    this.wordFilter,
  });
  Map<String, dynamic> toJson() => _$StartTextDetectionFiltersToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartTextDetectionResponse {
  /// Identifier for the text detection job. Use <code>JobId</code> to identify
  /// the job in a subsequent call to <code>GetTextDetection</code>.
  @_s.JsonKey(name: 'JobId')
  final String jobId;

  StartTextDetectionResponse({
    this.jobId,
  });
  factory StartTextDetectionResponse.fromJson(Map<String, dynamic> json) =>
      _$StartTextDetectionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopProjectVersionResponse {
  /// The current status of the stop operation.
  @_s.JsonKey(name: 'Status')
  final ProjectVersionStatus status;

  StopProjectVersionResponse({
    this.status,
  });
  factory StopProjectVersionResponse.fromJson(Map<String, dynamic> json) =>
      _$StopProjectVersionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopStreamProcessorResponse {
  StopStreamProcessorResponse();
  factory StopStreamProcessorResponse.fromJson(Map<String, dynamic> json) =>
      _$StopStreamProcessorResponseFromJson(json);
}

/// An object that recognizes faces in a streaming video. An Amazon Rekognition
/// stream processor is created by a call to <a>CreateStreamProcessor</a>. The
/// request parameters for <code>CreateStreamProcessor</code> describe the
/// Kinesis video stream source for the streaming video, face recognition
/// parameters, and where to stream the analysis resullts.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StreamProcessor {
  /// Name of the Amazon Rekognition stream processor.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Current status of the Amazon Rekognition stream processor.
  @_s.JsonKey(name: 'Status')
  final StreamProcessorStatus status;

  StreamProcessor({
    this.name,
    this.status,
  });
  factory StreamProcessor.fromJson(Map<String, dynamic> json) =>
      _$StreamProcessorFromJson(json);
}

/// Information about the source streaming video.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class StreamProcessorInput {
  /// The Kinesis video stream input stream for the source streaming video.
  @_s.JsonKey(name: 'KinesisVideoStream')
  final KinesisVideoStream kinesisVideoStream;

  StreamProcessorInput({
    this.kinesisVideoStream,
  });
  factory StreamProcessorInput.fromJson(Map<String, dynamic> json) =>
      _$StreamProcessorInputFromJson(json);

  Map<String, dynamic> toJson() => _$StreamProcessorInputToJson(this);
}

/// Information about the Amazon Kinesis Data Streams stream to which a Amazon
/// Rekognition Video stream processor streams the results of a video analysis.
/// For more information, see CreateStreamProcessor in the Amazon Rekognition
/// Developer Guide.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class StreamProcessorOutput {
  /// The Amazon Kinesis Data Streams stream to which the Amazon Rekognition
  /// stream processor streams the analysis results.
  @_s.JsonKey(name: 'KinesisDataStream')
  final KinesisDataStream kinesisDataStream;

  StreamProcessorOutput({
    this.kinesisDataStream,
  });
  factory StreamProcessorOutput.fromJson(Map<String, dynamic> json) =>
      _$StreamProcessorOutputFromJson(json);

  Map<String, dynamic> toJson() => _$StreamProcessorOutputToJson(this);
}

/// Input parameters used to recognize faces in a streaming video analyzed by a
/// Amazon Rekognition stream processor.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class StreamProcessorSettings {
  /// Face search settings to use on a streaming video.
  @_s.JsonKey(name: 'FaceSearch')
  final FaceSearchSettings faceSearch;

  StreamProcessorSettings({
    this.faceSearch,
  });
  factory StreamProcessorSettings.fromJson(Map<String, dynamic> json) =>
      _$StreamProcessorSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$StreamProcessorSettingsToJson(this);
}

enum StreamProcessorStatus {
  @_s.JsonValue('STOPPED')
  stopped,
  @_s.JsonValue('STARTING')
  starting,
  @_s.JsonValue('RUNNING')
  running,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('STOPPING')
  stopping,
}

/// The S3 bucket that contains the training summary. The training summary
/// includes aggregated evaluation metrics for the entire testing dataset and
/// metrics for each individual label.
///
/// You get the training summary S3 bucket location by calling
/// <a>DescribeProjectVersions</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Summary {
  @_s.JsonKey(name: 'S3Object')
  final S3Object s3Object;

  Summary({
    this.s3Object,
  });
  factory Summary.fromJson(Map<String, dynamic> json) =>
      _$SummaryFromJson(json);
}

/// Indicates whether or not the face is wearing sunglasses, and the confidence
/// level in the determination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Sunglasses {
  /// Level of confidence in the determination.
  @_s.JsonKey(name: 'Confidence')
  final double confidence;

  /// Boolean value that indicates whether the face is wearing sunglasses or not.
  @_s.JsonKey(name: 'Value')
  final bool value;

  Sunglasses({
    this.confidence,
    this.value,
  });
  factory Sunglasses.fromJson(Map<String, dynamic> json) =>
      _$SunglassesFromJson(json);
}

/// Information about a technical cue segment. For more information, see
/// <a>SegmentDetection</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TechnicalCueSegment {
  /// The confidence that Amazon Rekognition Video has in the accuracy of the
  /// detected segment.
  @_s.JsonKey(name: 'Confidence')
  final double confidence;

  /// The type of the technical cue.
  @_s.JsonKey(name: 'Type')
  final TechnicalCueType type;

  TechnicalCueSegment({
    this.confidence,
    this.type,
  });
  factory TechnicalCueSegment.fromJson(Map<String, dynamic> json) =>
      _$TechnicalCueSegmentFromJson(json);
}

enum TechnicalCueType {
  @_s.JsonValue('ColorBars')
  colorBars,
  @_s.JsonValue('EndCredits')
  endCredits,
  @_s.JsonValue('BlackFrames')
  blackFrames,
}

/// The dataset used for testing. Optionally, if <code>AutoCreate</code> is set,
/// Amazon Rekognition Custom Labels creates a testing dataset using an 80/20
/// split of the training dataset.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TestingData {
  /// The assets used for testing.
  @_s.JsonKey(name: 'Assets')
  final List<Asset> assets;

  /// If specified, Amazon Rekognition Custom Labels creates a testing dataset
  /// with an 80/20 split of the training dataset.
  @_s.JsonKey(name: 'AutoCreate')
  final bool autoCreate;

  TestingData({
    this.assets,
    this.autoCreate,
  });
  factory TestingData.fromJson(Map<String, dynamic> json) =>
      _$TestingDataFromJson(json);

  Map<String, dynamic> toJson() => _$TestingDataToJson(this);
}

/// Sagemaker Groundtruth format manifest files for the input, output and
/// validation datasets that are used and created during testing.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TestingDataResult {
  /// The testing dataset that was supplied for training.
  @_s.JsonKey(name: 'Input')
  final TestingData input;

  /// The subset of the dataset that was actually tested. Some images (assets)
  /// might not be tested due to file formatting and other issues.
  @_s.JsonKey(name: 'Output')
  final TestingData output;

  /// The location of the data validation manifest. The data validation manifest
  /// is created for the test dataset during model training.
  @_s.JsonKey(name: 'Validation')
  final ValidationData validation;

  TestingDataResult({
    this.input,
    this.output,
    this.validation,
  });
  factory TestingDataResult.fromJson(Map<String, dynamic> json) =>
      _$TestingDataResultFromJson(json);
}

/// Information about a word or line of text detected by <a>DetectText</a>.
///
/// The <code>DetectedText</code> field contains the text that Amazon
/// Rekognition detected in the image.
///
/// Every word and line has an identifier (<code>Id</code>). Each word belongs
/// to a line and has a parent identifier (<code>ParentId</code>) that
/// identifies the line of text in which the word appears. The word
/// <code>Id</code> is also an index for the word within a line of words.
///
/// For more information, see Detecting Text in the Amazon Rekognition Developer
/// Guide.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TextDetection {
  /// The confidence that Amazon Rekognition has in the accuracy of the detected
  /// text and the accuracy of the geometry points around the detected text.
  @_s.JsonKey(name: 'Confidence')
  final double confidence;

  /// The word or line of text recognized by Amazon Rekognition.
  @_s.JsonKey(name: 'DetectedText')
  final String detectedText;

  /// The location of the detected text on the image. Includes an axis aligned
  /// coarse bounding box surrounding the text and a finer grain polygon for more
  /// accurate spatial information.
  @_s.JsonKey(name: 'Geometry')
  final Geometry geometry;

  /// The identifier for the detected text. The identifier is only unique for a
  /// single call to <code>DetectText</code>.
  @_s.JsonKey(name: 'Id')
  final int id;

  /// The Parent identifier for the detected text identified by the value of
  /// <code>ID</code>. If the type of detected text is <code>LINE</code>, the
  /// value of <code>ParentId</code> is <code>Null</code>.
  @_s.JsonKey(name: 'ParentId')
  final int parentId;

  /// The type of text that was detected.
  @_s.JsonKey(name: 'Type')
  final TextTypes type;

  TextDetection({
    this.confidence,
    this.detectedText,
    this.geometry,
    this.id,
    this.parentId,
    this.type,
  });
  factory TextDetection.fromJson(Map<String, dynamic> json) =>
      _$TextDetectionFromJson(json);
}

/// Information about text detected in a video. Incudes the detected text, the
/// time in milliseconds from the start of the video that the text was detected,
/// and where it was detected on the screen.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TextDetectionResult {
  /// Details about text detected in a video.
  @_s.JsonKey(name: 'TextDetection')
  final TextDetection textDetection;

  /// The time, in milliseconds from the start of the video, that the text was
  /// detected.
  @_s.JsonKey(name: 'Timestamp')
  final int timestamp;

  TextDetectionResult({
    this.textDetection,
    this.timestamp,
  });
  factory TextDetectionResult.fromJson(Map<String, dynamic> json) =>
      _$TextDetectionResultFromJson(json);
}

enum TextTypes {
  @_s.JsonValue('LINE')
  line,
  @_s.JsonValue('WORD')
  word,
}

/// The dataset used for training.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TrainingData {
  /// A Sagemaker GroundTruth manifest file that contains the training images
  /// (assets).
  @_s.JsonKey(name: 'Assets')
  final List<Asset> assets;

  TrainingData({
    this.assets,
  });
  factory TrainingData.fromJson(Map<String, dynamic> json) =>
      _$TrainingDataFromJson(json);

  Map<String, dynamic> toJson() => _$TrainingDataToJson(this);
}

/// Sagemaker Groundtruth format manifest files for the input, output and
/// validation datasets that are used and created during testing.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TrainingDataResult {
  /// The training assets that you supplied for training.
  @_s.JsonKey(name: 'Input')
  final TrainingData input;

  /// The images (assets) that were actually trained by Amazon Rekognition Custom
  /// Labels.
  @_s.JsonKey(name: 'Output')
  final TrainingData output;

  /// The location of the data validation manifest. The data validation manifest
  /// is created for the training dataset during model training.
  @_s.JsonKey(name: 'Validation')
  final ValidationData validation;

  TrainingDataResult({
    this.input,
    this.output,
    this.validation,
  });
  factory TrainingDataResult.fromJson(Map<String, dynamic> json) =>
      _$TrainingDataResultFromJson(json);
}

/// A face that <a>IndexFaces</a> detected, but didn't index. Use the
/// <code>Reasons</code> response attribute to determine why a face wasn't
/// indexed.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UnindexedFace {
  /// The structure that contains attributes of a face that
  /// <code>IndexFaces</code>detected, but didn't index.
  @_s.JsonKey(name: 'FaceDetail')
  final FaceDetail faceDetail;

  /// An array of reasons that specify why a face wasn't indexed.
  ///
  /// <ul>
  /// <li>
  /// EXTREME_POSE - The face is at a pose that can't be detected. For example,
  /// the head is turned too far away from the camera.
  /// </li>
  /// <li>
  /// EXCEEDS_MAX_FACES - The number of faces detected is already higher than that
  /// specified by the <code>MaxFaces</code> input parameter for
  /// <code>IndexFaces</code>.
  /// </li>
  /// <li>
  /// LOW_BRIGHTNESS - The image is too dark.
  /// </li>
  /// <li>
  /// LOW_SHARPNESS - The image is too blurry.
  /// </li>
  /// <li>
  /// LOW_CONFIDENCE - The face was detected with a low confidence.
  /// </li>
  /// <li>
  /// SMALL_BOUNDING_BOX - The bounding box around the face is too small.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Reasons')
  final List<Reason> reasons;

  UnindexedFace({
    this.faceDetail,
    this.reasons,
  });
  factory UnindexedFace.fromJson(Map<String, dynamic> json) =>
      _$UnindexedFaceFromJson(json);
}

/// Contains the Amazon S3 bucket location of the validation data for a model
/// training job.
///
/// The validation data includes error information for individual JSON lines in
/// the dataset. For more information, see Debugging a Failed Model Training in
/// the Amazon Rekognition Custom Labels Developer Guide.
///
/// You get the <code>ValidationData</code> object for the training dataset
/// (<a>TrainingDataResult</a>) and the test dataset (<a>TestingDataResult</a>)
/// by calling <a>DescribeProjectVersions</a>.
///
/// The assets array contains a single <a>Asset</a> object. The
/// <a>GroundTruthManifest</a> field of the Asset object contains the S3 bucket
/// location of the validation data.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ValidationData {
  /// The assets that comprise the validation data.
  @_s.JsonKey(name: 'Assets')
  final List<Asset> assets;

  ValidationData({
    this.assets,
  });
  factory ValidationData.fromJson(Map<String, dynamic> json) =>
      _$ValidationDataFromJson(json);
}

/// Video file stored in an Amazon S3 bucket. Amazon Rekognition video start
/// operations such as <a>StartLabelDetection</a> use <code>Video</code> to
/// specify a video for analysis. The supported file formats are .mp4, .mov and
/// .avi.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Video {
  /// The Amazon S3 bucket name and file name for the video.
  @_s.JsonKey(name: 'S3Object')
  final S3Object s3Object;

  Video({
    this.s3Object,
  });
  Map<String, dynamic> toJson() => _$VideoToJson(this);
}

enum VideoJobStatus {
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('SUCCEEDED')
  succeeded,
  @_s.JsonValue('FAILED')
  failed,
}

/// Information about a video that Amazon Rekognition analyzed.
/// <code>Videometadata</code> is returned in every page of paginated responses
/// from a Amazon Rekognition video operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VideoMetadata {
  /// Type of compression used in the analyzed video.
  @_s.JsonKey(name: 'Codec')
  final String codec;

  /// Length of the video in milliseconds.
  @_s.JsonKey(name: 'DurationMillis')
  final int durationMillis;

  /// Format of the analyzed video. Possible values are MP4, MOV and AVI.
  @_s.JsonKey(name: 'Format')
  final String format;

  /// Vertical pixel dimension of the video.
  @_s.JsonKey(name: 'FrameHeight')
  final int frameHeight;

  /// Number of frames per second in the video.
  @_s.JsonKey(name: 'FrameRate')
  final double frameRate;

  /// Horizontal pixel dimension of the video.
  @_s.JsonKey(name: 'FrameWidth')
  final int frameWidth;

  VideoMetadata({
    this.codec,
    this.durationMillis,
    this.format,
    this.frameHeight,
    this.frameRate,
    this.frameWidth,
  });
  factory VideoMetadata.fromJson(Map<String, dynamic> json) =>
      _$VideoMetadataFromJson(json);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class HumanLoopQuotaExceededException extends _s.GenericAwsException {
  HumanLoopQuotaExceededException({String type, String message})
      : super(
            type: type,
            code: 'HumanLoopQuotaExceededException',
            message: message);
}

class IdempotentParameterMismatchException extends _s.GenericAwsException {
  IdempotentParameterMismatchException({String type, String message})
      : super(
            type: type,
            code: 'IdempotentParameterMismatchException',
            message: message);
}

class ImageTooLargeException extends _s.GenericAwsException {
  ImageTooLargeException({String type, String message})
      : super(type: type, code: 'ImageTooLargeException', message: message);
}

class InternalServerError extends _s.GenericAwsException {
  InternalServerError({String type, String message})
      : super(type: type, code: 'InternalServerError', message: message);
}

class InvalidImageFormatException extends _s.GenericAwsException {
  InvalidImageFormatException({String type, String message})
      : super(
            type: type, code: 'InvalidImageFormatException', message: message);
}

class InvalidPaginationTokenException extends _s.GenericAwsException {
  InvalidPaginationTokenException({String type, String message})
      : super(
            type: type,
            code: 'InvalidPaginationTokenException',
            message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String type, String message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class InvalidS3ObjectException extends _s.GenericAwsException {
  InvalidS3ObjectException({String type, String message})
      : super(type: type, code: 'InvalidS3ObjectException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ProvisionedThroughputExceededException extends _s.GenericAwsException {
  ProvisionedThroughputExceededException({String type, String message})
      : super(
            type: type,
            code: 'ProvisionedThroughputExceededException',
            message: message);
}

class ResourceAlreadyExistsException extends _s.GenericAwsException {
  ResourceAlreadyExistsException({String type, String message})
      : super(
            type: type,
            code: 'ResourceAlreadyExistsException',
            message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String type, String message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ResourceNotReadyException extends _s.GenericAwsException {
  ResourceNotReadyException({String type, String message})
      : super(type: type, code: 'ResourceNotReadyException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String type, String message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String type, String message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class VideoTooLargeException extends _s.GenericAwsException {
  VideoTooLargeException({String type, String message})
      : super(type: type, code: 'VideoTooLargeException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'HumanLoopQuotaExceededException': (type, message) =>
      HumanLoopQuotaExceededException(type: type, message: message),
  'IdempotentParameterMismatchException': (type, message) =>
      IdempotentParameterMismatchException(type: type, message: message),
  'ImageTooLargeException': (type, message) =>
      ImageTooLargeException(type: type, message: message),
  'InternalServerError': (type, message) =>
      InternalServerError(type: type, message: message),
  'InvalidImageFormatException': (type, message) =>
      InvalidImageFormatException(type: type, message: message),
  'InvalidPaginationTokenException': (type, message) =>
      InvalidPaginationTokenException(type: type, message: message),
  'InvalidParameterException': (type, message) =>
      InvalidParameterException(type: type, message: message),
  'InvalidS3ObjectException': (type, message) =>
      InvalidS3ObjectException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'ProvisionedThroughputExceededException': (type, message) =>
      ProvisionedThroughputExceededException(type: type, message: message),
  'ResourceAlreadyExistsException': (type, message) =>
      ResourceAlreadyExistsException(type: type, message: message),
  'ResourceInUseException': (type, message) =>
      ResourceInUseException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ResourceNotReadyException': (type, message) =>
      ResourceNotReadyException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'VideoTooLargeException': (type, message) =>
      VideoTooLargeException(type: type, message: message),
};
