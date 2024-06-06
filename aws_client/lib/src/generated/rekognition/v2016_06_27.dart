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

/// This is the API Reference for <a
/// href="https://docs.aws.amazon.com/rekognition/latest/dg/images.html">Amazon
/// Rekognition Image</a>, <a
/// href="https://docs.aws.amazon.com/rekognition/latest/customlabels-dg/what-is.html">Amazon
/// Rekognition Custom Labels</a>, <a
/// href="https://docs.aws.amazon.com/rekognition/latest/dg/video.html">Amazon
/// Rekognition Stored Video</a>, <a
/// href="https://docs.aws.amazon.com/rekognition/latest/dg/streaming-video.html">Amazon
/// Rekognition Streaming Video</a>. It provides descriptions of actions, data
/// types, common parameters, and common errors.
///
/// <b>Amazon Rekognition Image</b>
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_AssociateFaces.html">AssociateFaces</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_CompareFaces.html">CompareFaces</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_CreateCollection.html">CreateCollection</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_CreateUser.html">CreateUser</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_DeleteCollection.html">DeleteCollection</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_DeleteFaces.html">DeleteFaces</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_DeleteUser.html">DeleteUser</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_DescribeCollection.html">DescribeCollection</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_DetectFaces.html">DetectFaces</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_DetectLabels.html">DetectLabels</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_DetectModerationLabels.html">DetectModerationLabels</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_DetectProtectiveEquipment.html">DetectProtectiveEquipment</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_DetectText.html">DetectText</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_DisassociateFaces.html">DisassociateFaces</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_GetCelebrityInfo.html">GetCelebrityInfo</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_GetMediaAnalysisJob.html">GetMediaAnalysisJob</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_IndexFaces.html">IndexFaces</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_ListCollections.html">ListCollections</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_ListMediaAnalysisJob.html">ListMediaAnalysisJob</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_ListFaces.html">ListFaces</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_ListFaces.html">ListUsers</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_RecognizeCelebrities.html">RecognizeCelebrities</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_SearchFaces.html">SearchFaces</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_SearchFacesByImage.html">SearchFacesByImage</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_SearchUsers.html">SearchUsers</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_SearchUsersByImage.html">SearchUsersByImage</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_StartMediaAnalysisJob.html">StartMediaAnalysisJob</a>
/// </li>
/// </ul>
/// <b>Amazon Rekognition Custom Labels</b>
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_CopyProjectVersion.html">CopyProjectVersion</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_CreateDataset.html">CreateDataset</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_CreateProject.html">CreateProject</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_CreateProjectVersion.html">CreateProjectVersion</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_DeleteDataset.html">DeleteDataset</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_DeleteProject.html">DeleteProject</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_DeleteProjectPolicy.html">DeleteProjectPolicy</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_DeleteProjectVersion.html">DeleteProjectVersion</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_DescribeDataset.html">DescribeDataset</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_DescribeProjects.html">DescribeProjects</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_DescribeProjectVersions.html">DescribeProjectVersions</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_DetectCustomLabels.html">DetectCustomLabels</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_DistributeDatasetEntries.html">DistributeDatasetEntries</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_ListDatasetEntries.html">ListDatasetEntries</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_ListDatasetLabels.html">ListDatasetLabels</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_ListProjectPolicies.html">ListProjectPolicies</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_PutProjectPolicy.html">PutProjectPolicy</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_StartProjectVersion.html">StartProjectVersion</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_StopProjectVersion.html">StopProjectVersion</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_UpdateDatasetEntries.html">UpdateDatasetEntries</a>
/// </li>
/// </ul>
/// <b>Amazon Rekognition Video Stored Video</b>
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_GetCelebrityRecognition.html">GetCelebrityRecognition</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_GetContentModeration.html">GetContentModeration</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_GetFaceDetection.html">GetFaceDetection</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_GetFaceSearch.html">GetFaceSearch</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_GetLabelDetection.html">GetLabelDetection</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_GetPersonTracking.html">GetPersonTracking</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_GetSegmentDetection.html">GetSegmentDetection</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_GetTextDetection.html">GetTextDetection</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_StartCelebrityRecognition.html">StartCelebrityRecognition</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_StartContentModeration.html">StartContentModeration</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_StartFaceDetection.html">StartFaceDetection</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_StartFaceSearch.html">StartFaceSearch</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_StartLabelDetection.html">StartLabelDetection</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_StartPersonTracking.html">StartPersonTracking</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_StartSegmentDetection.html">StartSegmentDetection</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_StartTextDetection.html">StartTextDetection</a>
/// </li>
/// </ul>
/// <b>Amazon Rekognition Video Streaming Video</b>
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_CreateStreamProcessor.html">CreateStreamProcessor</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_DeleteStreamProcessor.html">DeleteStreamProcessor</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_DescribeStreamProcessor.html">DescribeStreamProcessor</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_ListStreamProcessors.html">ListStreamProcessors</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_StartStreamProcessor.html">StartStreamProcessor</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_StopStreamProcessor.html">StopStreamProcessor</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_UpdateStreamProcessor.html">UpdateStreamProcessor</a>
/// </li>
/// </ul>
class Rekognition {
  final _s.JsonProtocol _protocol;
  Rekognition({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'rekognition',
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

  /// Associates one or more faces with an existing UserID. Takes an array of
  /// <code>FaceIds</code>. Each <code>FaceId</code> that are present in the
  /// <code>FaceIds</code> list is associated with the provided UserID. The
  /// maximum number of total <code>FaceIds</code> per UserID is 100.
  ///
  /// The <code>UserMatchThreshold</code> parameter specifies the minimum user
  /// match confidence required for the face to be associated with a UserID that
  /// has at least one <code>FaceID</code> already associated. This ensures that
  /// the <code>FaceIds</code> are associated with the right UserID. The value
  /// ranges from 0-100 and default value is 75.
  ///
  /// If successful, an array of <code>AssociatedFace</code> objects containing
  /// the associated <code>FaceIds</code> is returned. If a given face is
  /// already associated with the given <code>UserID</code>, it will be ignored
  /// and will not be returned in the response. If a given face is already
  /// associated to a different <code>UserID</code>, isn't found in the
  /// collection, doesn’t meet the <code>UserMatchThreshold</code>, or there are
  /// already 100 faces associated with the <code>UserID</code>, it will be
  /// returned as part of an array of <code>UnsuccessfulFaceAssociations.</code>
  ///
  /// The <code>UserStatus</code> reflects the status of an operation which
  /// updates a UserID representation with a list of given faces. The
  /// <code>UserStatus</code> can be:
  ///
  /// <ul>
  /// <li>
  /// ACTIVE - All associations or disassociations of FaceID(s) for a UserID are
  /// complete.
  /// </li>
  /// <li>
  /// CREATED - A UserID has been created, but has no FaceID(s) associated with
  /// it.
  /// </li>
  /// <li>
  /// UPDATING - A UserID is being updated and there are current associations or
  /// disassociations of FaceID(s) taking place.
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidParameterException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [collectionId] :
  /// The ID of an existing collection containing the UserID.
  ///
  /// Parameter [faceIds] :
  /// An array of FaceIDs to associate with the UserID.
  ///
  /// Parameter [userId] :
  /// The ID for the existing UserID.
  ///
  /// Parameter [clientRequestToken] :
  /// Idempotent token used to identify the request to
  /// <code>AssociateFaces</code>. If you use the same token with multiple
  /// <code>AssociateFaces</code> requests, the same response is returned. Use
  /// ClientRequestToken to prevent the same request from being processed more
  /// than once.
  ///
  /// Parameter [userMatchThreshold] :
  /// An optional value specifying the minimum confidence in the UserID match to
  /// return. The default value is 75.
  Future<AssociateFacesResponse> associateFaces({
    required String collectionId,
    required List<String> faceIds,
    required String userId,
    String? clientRequestToken,
    double? userMatchThreshold,
  }) async {
    _s.validateNumRange(
      'userMatchThreshold',
      userMatchThreshold,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.AssociateFaces'
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
        'UserId': userId,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (userMatchThreshold != null)
          'UserMatchThreshold': userMatchThreshold,
      },
    );

    return AssociateFacesResponse.fromJson(jsonResponse.body);
  }

  /// Compares a face in the <i>source</i> input image with each of the 100
  /// largest faces detected in the <i>target</i> input image.
  ///
  /// If the source image contains multiple faces, the service detects the
  /// largest face and compares it with each face detected in the target image.
  /// <note>
  /// CompareFaces uses machine learning algorithms, which are probabilistic. A
  /// false negative is an incorrect prediction that a face in the target image
  /// has a low similarity confidence score when compared to the face in the
  /// source image. To reduce the probability of false negatives, we recommend
  /// that you compare the target image against multiple source images. If you
  /// plan to use <code>CompareFaces</code> to make a decision that impacts an
  /// individual's rights, privacy, or access to services, we recommend that you
  /// pass the result to a human for review and further validation before taking
  /// action.
  /// </note>
  /// You pass the input and target images either as base64-encoded image bytes
  /// or as references to images in an Amazon S3 bucket. If you use the AWS CLI
  /// to call Amazon Rekognition operations, passing image bytes isn't
  /// supported. The image must be formatted as a PNG or JPEG file.
  ///
  /// In response, the operation returns an array of face matches ordered by
  /// similarity score in descending order. For each face match, the response
  /// provides a bounding box of the face, facial landmarks, pose details
  /// (pitch, roll, and yaw), quality (brightness and sharpness), and confidence
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
    required Image sourceImage,
    required Image targetImage,
    QualityFilter? qualityFilter,
    double? similarityThreshold,
  }) async {
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

  /// <note>
  /// This operation applies only to Amazon Rekognition Custom Labels.
  /// </note>
  /// Copies a version of an Amazon Rekognition Custom Labels model from a
  /// source project to a destination project. The source and destination
  /// projects can be in different AWS accounts but must be in the same AWS
  /// Region. You can't copy a model to another AWS service.
  ///
  /// To copy a model version to a different AWS account, you need to create a
  /// resource-based policy known as a <i>project policy</i>. You attach the
  /// project policy to the source project by calling <a>PutProjectPolicy</a>.
  /// The project policy gives permission to copy the model version from a
  /// trusting AWS account to a trusted account.
  ///
  /// For more information creating and attaching a project policy, see
  /// Attaching a project policy (SDK) in the <i>Amazon Rekognition Custom
  /// Labels Developer Guide</i>.
  ///
  /// If you are copying a model version to a project in the same AWS account,
  /// you don't need to create a project policy.
  /// <note>
  /// Copying project versions is supported only for Custom Labels models.
  ///
  /// To copy a model, the destination project, source project, and source model
  /// version must already exist.
  /// </note>
  /// Copying a model version takes a while to complete. To get the current
  /// status, call <a>DescribeProjectVersions</a> and check the value of
  /// <code>Status</code> in the <a>ProjectVersionDescription</a> object. The
  /// copy operation has finished when the value of <code>Status</code> is
  /// <code>COPYING_COMPLETED</code>.
  ///
  /// This operation requires permissions to perform the
  /// <code>rekognition:CopyProjectVersion</code> action.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [InvalidParameterException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [destinationProjectArn] :
  /// The ARN of the project in the trusted AWS account that you want to copy
  /// the model version to.
  ///
  /// Parameter [outputConfig] :
  /// The S3 bucket and folder location where the training output for the source
  /// model version is placed.
  ///
  /// Parameter [sourceProjectArn] :
  /// The ARN of the source project in the trusting AWS account.
  ///
  /// Parameter [sourceProjectVersionArn] :
  /// The ARN of the model version in the source project that you want to copy
  /// to a destination project.
  ///
  /// Parameter [versionName] :
  /// A name for the version of the model that's copied to the destination
  /// project.
  ///
  /// Parameter [kmsKeyId] :
  /// The identifier for your AWS Key Management Service key (AWS KMS key). You
  /// can supply the Amazon Resource Name (ARN) of your KMS key, the ID of your
  /// KMS key, an alias for your KMS key, or an alias ARN. The key is used to
  /// encrypt training results and manifest files written to the output Amazon
  /// S3 bucket (<code>OutputConfig</code>).
  ///
  /// If you choose to use your own KMS key, you need the following permissions
  /// on the KMS key.
  ///
  /// <ul>
  /// <li>
  /// kms:CreateGrant
  /// </li>
  /// <li>
  /// kms:DescribeKey
  /// </li>
  /// <li>
  /// kms:GenerateDataKey
  /// </li>
  /// <li>
  /// kms:Decrypt
  /// </li>
  /// </ul>
  /// If you don't specify a value for <code>KmsKeyId</code>, images copied into
  /// the service are encrypted using a key that AWS owns and manages.
  ///
  /// Parameter [tags] :
  /// The key-value tags to assign to the model version.
  Future<CopyProjectVersionResponse> copyProjectVersion({
    required String destinationProjectArn,
    required OutputConfig outputConfig,
    required String sourceProjectArn,
    required String sourceProjectVersionArn,
    required String versionName,
    String? kmsKeyId,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.CopyProjectVersion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DestinationProjectArn': destinationProjectArn,
        'OutputConfig': outputConfig,
        'SourceProjectArn': sourceProjectArn,
        'SourceProjectVersionArn': sourceProjectVersionArn,
        'VersionName': versionName,
        if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
        if (tags != null) 'Tags': tags,
      },
    );

    return CopyProjectVersionResponse.fromJson(jsonResponse.body);
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
  /// <code>rekognition:CreateCollection</code> action. If you want to tag your
  /// collection, you also require permission to perform the
  /// <code>rekognition:TagResource</code> operation.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [collectionId] :
  /// ID for the collection that you are creating.
  ///
  /// Parameter [tags] :
  /// A set of tags (key-value pairs) that you want to attach to the collection.
  Future<CreateCollectionResponse> createCollection({
    required String collectionId,
    Map<String, String>? tags,
  }) async {
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
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateCollectionResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This operation applies only to Amazon Rekognition Custom Labels.
  /// </note>
  /// Creates a new Amazon Rekognition Custom Labels dataset. You can create a
  /// dataset by using an Amazon Sagemaker format manifest file or by copying an
  /// existing Amazon Rekognition Custom Labels dataset.
  ///
  /// To create a training dataset for a project, specify <code>TRAIN</code> for
  /// the value of <code>DatasetType</code>. To create the test dataset for a
  /// project, specify <code>TEST</code> for the value of
  /// <code>DatasetType</code>.
  ///
  /// The response from <code>CreateDataset</code> is the Amazon Resource Name
  /// (ARN) for the dataset. Creating a dataset takes a while to complete. Use
  /// <a>DescribeDataset</a> to check the current status. The dataset created
  /// successfully if the value of <code>Status</code> is
  /// <code>CREATE_COMPLETE</code>.
  ///
  /// To check if any non-terminal errors occurred, call
  /// <a>ListDatasetEntries</a> and check for the presence of
  /// <code>errors</code> lists in the JSON Lines.
  ///
  /// Dataset creation fails if a terminal error occurs (<code>Status</code> =
  /// <code>CREATE_FAILED</code>). Currently, you can't access the terminal
  /// error information.
  ///
  /// For more information, see Creating dataset in the <i>Amazon Rekognition
  /// Custom Labels Developer Guide</i>.
  ///
  /// This operation requires permissions to perform the
  /// <code>rekognition:CreateDataset</code> action. If you want to copy an
  /// existing dataset, you also require permission to perform the
  /// <code>rekognition:ListDatasetEntries</code> action.
  ///
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [InvalidParameterException].
  /// May throw [AccessDeniedException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidS3ObjectException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [datasetType] :
  /// The type of the dataset. Specify <code>TRAIN</code> to create a training
  /// dataset. Specify <code>TEST</code> to create a test dataset.
  ///
  /// Parameter [projectArn] :
  /// The ARN of the Amazon Rekognition Custom Labels project to which you want
  /// to asssign the dataset.
  ///
  /// Parameter [datasetSource] :
  /// The source files for the dataset. You can specify the ARN of an existing
  /// dataset or specify the Amazon S3 bucket location of an Amazon Sagemaker
  /// format manifest file. If you don't specify <code>datasetSource</code>, an
  /// empty dataset is created. To add labeled images to the dataset, You can
  /// use the console or call <a>UpdateDatasetEntries</a>.
  Future<CreateDatasetResponse> createDataset({
    required DatasetType datasetType,
    required String projectArn,
    DatasetSource? datasetSource,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.CreateDataset'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatasetType': datasetType.toValue(),
        'ProjectArn': projectArn,
        if (datasetSource != null) 'DatasetSource': datasetSource,
      },
    );

    return CreateDatasetResponse.fromJson(jsonResponse.body);
  }

  /// This API operation initiates a Face Liveness session. It returns a
  /// <code>SessionId</code>, which you can use to start streaming Face Liveness
  /// video and get the results for a Face Liveness session.
  ///
  /// You can use the <code>OutputConfig</code> option in the Settings parameter
  /// to provide an Amazon S3 bucket location. The Amazon S3 bucket stores
  /// reference images and audit images. If no Amazon S3 bucket is defined, raw
  /// bytes are sent instead.
  ///
  /// You can use <code>AuditImagesLimit</code> to limit the number of audit
  /// images returned when <code>GetFaceLivenessSessionResults</code> is called.
  /// This number is between 0 and 4. By default, it is set to 0. The limit is
  /// best effort and based on the duration of the selfie-video.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [InvalidParameterException].
  /// May throw [ThrottlingException].
  /// May throw [ProvisionedThroughputExceededException].
  ///
  /// Parameter [clientRequestToken] :
  /// Idempotent token is used to recognize the Face Liveness request. If the
  /// same token is used with multiple <code>CreateFaceLivenessSession</code>
  /// requests, the same session is returned. This token is employed to avoid
  /// unintentionally creating the same session multiple times.
  ///
  /// Parameter [kmsKeyId] :
  /// The identifier for your AWS Key Management Service key (AWS KMS key). Used
  /// to encrypt audit images and reference images.
  ///
  /// Parameter [settings] :
  /// A session settings object. It contains settings for the operation to be
  /// performed. For Face Liveness, it accepts <code>OutputConfig</code> and
  /// <code>AuditImagesLimit</code>.
  Future<CreateFaceLivenessSessionResponse> createFaceLivenessSession({
    String? clientRequestToken,
    String? kmsKeyId,
    CreateFaceLivenessSessionRequestSettings? settings,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.CreateFaceLivenessSession'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (clientRequestToken != null)
          'ClientRequestToken': clientRequestToken,
        if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
        if (settings != null) 'Settings': settings,
      },
    );

    return CreateFaceLivenessSessionResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new Amazon Rekognition project. A project is a group of
  /// resources (datasets, model versions) that you use to create and manage a
  /// Amazon Rekognition Custom Labels Model or custom adapter. You can specify
  /// a feature to create the project with, if no feature is specified then
  /// Custom Labels is used by default. For adapters, you can also choose
  /// whether or not to have the project auto update by using the AutoUpdate
  /// argument. This operation requires permissions to perform the
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
  ///
  /// Parameter [autoUpdate] :
  /// Specifies whether automatic retraining should be attempted for the
  /// versions of the project. Automatic retraining is done as a best effort.
  /// Required argument for Content Moderation. Applicable only to adapters.
  ///
  /// Parameter [feature] :
  /// Specifies feature that is being customized. If no value is provided
  /// CUSTOM_LABELS is used as a default.
  Future<CreateProjectResponse> createProject({
    required String projectName,
    ProjectAutoUpdate? autoUpdate,
    CustomizationFeature? feature,
  }) async {
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
        if (autoUpdate != null) 'AutoUpdate': autoUpdate.toValue(),
        if (feature != null) 'Feature': feature.toValue(),
      },
    );

    return CreateProjectResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new version of Amazon Rekognition project (like a Custom Labels
  /// model or a custom adapter) and begins training. Models and adapters are
  /// managed as part of a Rekognition project. The response from
  /// <code>CreateProjectVersion</code> is an Amazon Resource Name (ARN) for the
  /// project version.
  ///
  /// The FeatureConfig operation argument allows you to configure specific
  /// model or adapter settings. You can provide a description to the project
  /// version by using the VersionDescription argment. Training can take a while
  /// to complete. You can get the current status by calling
  /// <a>DescribeProjectVersions</a>. Training completed successfully if the
  /// value of the <code>Status</code> field is <code>TRAINING_COMPLETED</code>.
  /// Once training has successfully completed, call
  /// <a>DescribeProjectVersions</a> to get the training results and evaluate
  /// the model.
  ///
  /// This operation requires permissions to perform the
  /// <code>rekognition:CreateProjectVersion</code> action.
  /// <note>
  /// <i>The following applies only to projects with Amazon Rekognition Custom
  /// Labels as the chosen feature:</i>
  ///
  /// You can train a model in a project that doesn't have associated datasets
  /// by specifying manifest files in the <code>TrainingData</code> and
  /// <code>TestingData</code> fields.
  ///
  /// If you open the console after training a model with manifest files, Amazon
  /// Rekognition Custom Labels creates the datasets for you using the most
  /// recent manifest files. You can no longer train a model version for the
  /// project by specifying manifest files.
  ///
  /// Instead of training with a project without associated datasets, we
  /// recommend that you use the manifest files to create training and test
  /// datasets for the project.
  /// </note> <p/>
  ///
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidParameterException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [outputConfig] :
  /// The Amazon S3 bucket location to store the results of training. The bucket
  /// can be any S3 bucket in your AWS account. You need
  /// <code>s3:PutObject</code> permission on the bucket.
  ///
  /// Parameter [projectArn] :
  /// The ARN of the Amazon Rekognition project that will manage the project
  /// version you want to train.
  ///
  /// Parameter [versionName] :
  /// A name for the version of the project version. This value must be unique.
  ///
  /// Parameter [featureConfig] :
  /// Feature-specific configuration of the training job. If the job
  /// configuration does not match the feature type associated with the project,
  /// an InvalidParameterException is returned.
  ///
  /// Parameter [kmsKeyId] :
  /// The identifier for your AWS Key Management Service key (AWS KMS key). You
  /// can supply the Amazon Resource Name (ARN) of your KMS key, the ID of your
  /// KMS key, an alias for your KMS key, or an alias ARN. The key is used to
  /// encrypt training images, test images, and manifest files copied into the
  /// service for the project version. Your source images are unaffected. The
  /// key is also used to encrypt training results and manifest files written to
  /// the output Amazon S3 bucket (<code>OutputConfig</code>).
  ///
  /// If you choose to use your own KMS key, you need the following permissions
  /// on the KMS key.
  ///
  /// <ul>
  /// <li>
  /// kms:CreateGrant
  /// </li>
  /// <li>
  /// kms:DescribeKey
  /// </li>
  /// <li>
  /// kms:GenerateDataKey
  /// </li>
  /// <li>
  /// kms:Decrypt
  /// </li>
  /// </ul>
  /// If you don't specify a value for <code>KmsKeyId</code>, images copied into
  /// the service are encrypted using a key that AWS owns and manages.
  ///
  /// Parameter [tags] :
  /// A set of tags (key-value pairs) that you want to attach to the project
  /// version.
  ///
  /// Parameter [testingData] :
  /// Specifies an external manifest that the service uses to test the project
  /// version. If you specify <code>TestingData</code> you must also specify
  /// <code>TrainingData</code>. The project must not have any associated
  /// datasets.
  ///
  /// Parameter [trainingData] :
  /// Specifies an external manifest that the services uses to train the project
  /// version. If you specify <code>TrainingData</code> you must also specify
  /// <code>TestingData</code>. The project must not have any associated
  /// datasets.
  ///
  /// Parameter [versionDescription] :
  /// A description applied to the project version being created.
  Future<CreateProjectVersionResponse> createProjectVersion({
    required OutputConfig outputConfig,
    required String projectArn,
    required String versionName,
    CustomizationFeatureConfig? featureConfig,
    String? kmsKeyId,
    Map<String, String>? tags,
    TestingData? testingData,
    TrainingData? trainingData,
    String? versionDescription,
  }) async {
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
        'VersionName': versionName,
        if (featureConfig != null) 'FeatureConfig': featureConfig,
        if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
        if (tags != null) 'Tags': tags,
        if (testingData != null) 'TestingData': testingData,
        if (trainingData != null) 'TrainingData': trainingData,
        if (versionDescription != null)
          'VersionDescription': versionDescription,
      },
    );

    return CreateProjectVersionResponse.fromJson(jsonResponse.body);
  }

  /// Creates an Amazon Rekognition stream processor that you can use to detect
  /// and recognize faces or to detect labels in a streaming video.
  ///
  /// Amazon Rekognition Video is a consumer of live video from Amazon Kinesis
  /// Video Streams. There are two different settings for stream processors in
  /// Amazon Rekognition: detecting faces and detecting labels.
  ///
  /// <ul>
  /// <li>
  /// If you are creating a stream processor for detecting faces, you provide as
  /// input a Kinesis video stream (<code>Input</code>) and a Kinesis data
  /// stream (<code>Output</code>) stream for receiving the output. You must use
  /// the <code>FaceSearch</code> option in <code>Settings</code>, specifying
  /// the collection that contains the faces you want to recognize. After you
  /// have finished analyzing a streaming video, use <a>StopStreamProcessor</a>
  /// to stop processing.
  /// </li>
  /// <li>
  /// If you are creating a stream processor to detect labels, you provide as
  /// input a Kinesis video stream (<code>Input</code>), Amazon S3 bucket
  /// information (<code>Output</code>), and an Amazon SNS topic ARN
  /// (<code>NotificationChannel</code>). You can also provide a KMS key ID to
  /// encrypt the data sent to your Amazon S3 bucket. You specify what you want
  /// to detect by using the <code>ConnectedHome</code> option in settings, and
  /// selecting one of the following: <code>PERSON</code>, <code>PET</code>,
  /// <code>PACKAGE</code>, <code>ALL</code> You can also specify where in the
  /// frame you want Amazon Rekognition to monitor with
  /// <code>RegionsOfInterest</code>. When you run the
  /// <a>StartStreamProcessor</a> operation on a label detection stream
  /// processor, you input start and stop information to determine the length of
  /// the processing time.
  /// </li>
  /// </ul>
  /// Use <code>Name</code> to assign an identifier for the stream processor.
  /// You use <code>Name</code> to manage the stream processor. For example, you
  /// can start processing the source video by calling
  /// <a>StartStreamProcessor</a> with the <code>Name</code> field.
  ///
  /// This operation requires permissions to perform the
  /// <code>rekognition:CreateStreamProcessor</code> action. If you want to tag
  /// your stream processor, you also require permission to perform the
  /// <code>rekognition:TagResource</code> operation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [InvalidParameterException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceInUseException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [input] :
  /// Kinesis video stream stream that provides the source streaming video. If
  /// you are using the AWS CLI, the parameter name is
  /// <code>StreamProcessorInput</code>. This is required for both face search
  /// and label detection stream processors.
  ///
  /// Parameter [name] :
  /// An identifier you assign to the stream processor. You can use
  /// <code>Name</code> to manage the stream processor. For example, you can get
  /// the current status of the stream processor by calling
  /// <a>DescribeStreamProcessor</a>. <code>Name</code> is idempotent. This is
  /// required for both face search and label detection stream processors.
  ///
  /// Parameter [output] :
  /// Kinesis data stream stream or Amazon S3 bucket location to which Amazon
  /// Rekognition Video puts the analysis results. If you are using the AWS CLI,
  /// the parameter name is <code>StreamProcessorOutput</code>. This must be a
  /// <a>S3Destination</a> of an Amazon S3 bucket that you own for a label
  /// detection stream processor or a Kinesis data stream ARN for a face search
  /// stream processor.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Number (ARN) of the IAM role that allows access to the
  /// stream processor. The IAM role provides Rekognition read permissions for a
  /// Kinesis stream. It also provides write permissions to an Amazon S3 bucket
  /// and Amazon Simple Notification Service topic for a label detection stream
  /// processor. This is required for both face search and label detection
  /// stream processors.
  ///
  /// Parameter [settings] :
  /// Input parameters used in a streaming video analyzed by a stream processor.
  /// You can use <code>FaceSearch</code> to recognize faces in a streaming
  /// video, or you can use <code>ConnectedHome</code> to detect labels.
  ///
  /// Parameter [dataSharingPreference] :
  /// Shows whether you are sharing data with Rekognition to improve model
  /// performance. You can choose this option at the account level or on a
  /// per-stream basis. Note that if you opt out at the account level this
  /// setting is ignored on individual streams.
  ///
  /// Parameter [kmsKeyId] :
  /// The identifier for your AWS Key Management Service key (AWS KMS key). This
  /// is an optional parameter for label detection stream processors and should
  /// not be used to create a face search stream processor. You can supply the
  /// Amazon Resource Name (ARN) of your KMS key, the ID of your KMS key, an
  /// alias for your KMS key, or an alias ARN. The key is used to encrypt
  /// results and data published to your Amazon S3 bucket, which includes image
  /// frames and hero images. Your source images are unaffected.
  ///
  ///
  ///
  /// Parameter [regionsOfInterest] :
  /// Specifies locations in the frames where Amazon Rekognition checks for
  /// objects or people. You can specify up to 10 regions of interest, and each
  /// region has either a polygon or a bounding box. This is an optional
  /// parameter for label detection stream processors and should not be used to
  /// create a face search stream processor.
  ///
  /// Parameter [tags] :
  /// A set of tags (key-value pairs) that you want to attach to the stream
  /// processor.
  Future<CreateStreamProcessorResponse> createStreamProcessor({
    required StreamProcessorInput input,
    required String name,
    required StreamProcessorOutput output,
    required String roleArn,
    required StreamProcessorSettings settings,
    StreamProcessorDataSharingPreference? dataSharingPreference,
    String? kmsKeyId,
    StreamProcessorNotificationChannel? notificationChannel,
    List<RegionOfInterest>? regionsOfInterest,
    Map<String, String>? tags,
  }) async {
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
        if (dataSharingPreference != null)
          'DataSharingPreference': dataSharingPreference,
        if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
        if (notificationChannel != null)
          'NotificationChannel': notificationChannel,
        if (regionsOfInterest != null) 'RegionsOfInterest': regionsOfInterest,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateStreamProcessorResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new User within a collection specified by
  /// <code>CollectionId</code>. Takes <code>UserId</code> as a parameter, which
  /// is a user provided ID which should be unique within the collection. The
  /// provided <code>UserId</code> will alias the system generated UUID to make
  /// the <code>UserId</code> more user friendly.
  ///
  /// Uses a <code>ClientToken</code>, an idempotency token that ensures a call
  /// to <code>CreateUser</code> completes only once. If the value is not
  /// supplied, the AWS SDK generates an idempotency token for the requests.
  /// This prevents retries after a network error results from making multiple
  /// <code>CreateUser</code> calls.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [collectionId] :
  /// The ID of an existing collection to which the new UserID needs to be
  /// created.
  ///
  /// Parameter [userId] :
  /// ID for the UserID to be created. This ID needs to be unique within the
  /// collection.
  ///
  /// Parameter [clientRequestToken] :
  /// Idempotent token used to identify the request to <code>CreateUser</code>.
  /// If you use the same token with multiple <code>CreateUser</code> requests,
  /// the same response is returned. Use ClientRequestToken to prevent the same
  /// request from being processed more than once.
  Future<void> createUser({
    required String collectionId,
    required String userId,
    String? clientRequestToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.CreateUser'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CollectionId': collectionId,
        'UserId': userId,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
      },
    );
  }

  /// Deletes the specified collection. Note that this operation removes all
  /// faces in the collection. For an example, see <a
  /// href="https://docs.aws.amazon.com/rekognition/latest/dg/delete-collection-procedure.html">Deleting
  /// a collection</a>.
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
    required String collectionId,
  }) async {
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

  /// <note>
  /// This operation applies only to Amazon Rekognition Custom Labels.
  /// </note>
  /// Deletes an existing Amazon Rekognition Custom Labels dataset. Deleting a
  /// dataset might take while. Use <a>DescribeDataset</a> to check the current
  /// status. The dataset is still deleting if the value of <code>Status</code>
  /// is <code>DELETE_IN_PROGRESS</code>. If you try to access the dataset after
  /// it is deleted, you get a <code>ResourceNotFoundException</code> exception.
  ///
  /// You can't delete a dataset while it is creating (<code>Status</code> =
  /// <code>CREATE_IN_PROGRESS</code>) or if the dataset is updating
  /// (<code>Status</code> = <code>UPDATE_IN_PROGRESS</code>).
  ///
  /// This operation requires permissions to perform the
  /// <code>rekognition:DeleteDataset</code> action.
  ///
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [InvalidParameterException].
  /// May throw [AccessDeniedException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [datasetArn] :
  /// The ARN of the Amazon Rekognition Custom Labels dataset that you want to
  /// delete.
  Future<void> deleteDataset({
    required String datasetArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.DeleteDataset'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatasetArn': datasetArn,
      },
    );
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
    required String collectionId,
    required List<String> faceIds,
  }) async {
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

  /// Deletes a Amazon Rekognition project. To delete a project you must first
  /// delete all models or adapters associated with the project. To delete a
  /// model or adapter, see <a>DeleteProjectVersion</a>.
  ///
  /// <code>DeleteProject</code> is an asynchronous operation. To check if the
  /// project is deleted, call <a>DescribeProjects</a>. The project is deleted
  /// when the project no longer appears in the response. Be aware that deleting
  /// a given project will also delete any <code>ProjectPolicies</code>
  /// associated with that project.
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
    required String projectArn,
  }) async {
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

  /// <note>
  /// This operation applies only to Amazon Rekognition Custom Labels.
  /// </note>
  /// Deletes an existing project policy.
  ///
  /// To get a list of project policies attached to a project, call
  /// <a>ListProjectPolicies</a>. To attach a project policy to a project, call
  /// <a>PutProjectPolicy</a>.
  ///
  /// This operation requires permissions to perform the
  /// <code>rekognition:DeleteProjectPolicy</code> action.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [InvalidPolicyRevisionIdException].
  ///
  /// Parameter [policyName] :
  /// The name of the policy that you want to delete.
  ///
  /// Parameter [projectArn] :
  /// The Amazon Resource Name (ARN) of the project that the project policy you
  /// want to delete is attached to.
  ///
  /// Parameter [policyRevisionId] :
  /// The ID of the project policy revision that you want to delete.
  Future<void> deleteProjectPolicy({
    required String policyName,
    required String projectArn,
    String? policyRevisionId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.DeleteProjectPolicy'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PolicyName': policyName,
        'ProjectArn': projectArn,
        if (policyRevisionId != null) 'PolicyRevisionId': policyRevisionId,
      },
    );
  }

  /// Deletes a Rekognition project model or project version, like a Amazon
  /// Rekognition Custom Labels model or a custom adapter.
  ///
  /// You can't delete a project version if it is running or if it is training.
  /// To check the status of a project version, use the Status field returned
  /// from <a>DescribeProjectVersions</a>. To stop a project version call
  /// <a>StopProjectVersion</a>. If the project version is training, wait until
  /// it finishes.
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
  /// The Amazon Resource Name (ARN) of the project version that you want to
  /// delete.
  Future<DeleteProjectVersionResponse> deleteProjectVersion({
    required String projectVersionArn,
  }) async {
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
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.DeleteStreamProcessor'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
      },
    );
  }

  /// Deletes the specified UserID within the collection. Faces that are
  /// associated with the UserID are disassociated from the UserID before
  /// deleting the specified UserID. If the specified <code>Collection</code> or
  /// <code>UserID</code> is already deleted or not found, a
  /// <code>ResourceNotFoundException</code> will be thrown. If the action is
  /// successful with a 200 response, an empty HTTP body is returned.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [collectionId] :
  /// The ID of an existing collection from which the UserID needs to be
  /// deleted.
  ///
  /// Parameter [userId] :
  /// ID for the UserID to be deleted.
  ///
  /// Parameter [clientRequestToken] :
  /// Idempotent token used to identify the request to <code>DeleteUser</code>.
  /// If you use the same token with multiple <code>DeleteUser </code>requests,
  /// the same response is returned. Use ClientRequestToken to prevent the same
  /// request from being processed more than once.
  Future<void> deleteUser({
    required String collectionId,
    required String userId,
    String? clientRequestToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.DeleteUser'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CollectionId': collectionId,
        'UserId': userId,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
      },
    );
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
    required String collectionId,
  }) async {
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

  /// <note>
  /// This operation applies only to Amazon Rekognition Custom Labels.
  /// </note>
  /// Describes an Amazon Rekognition Custom Labels dataset. You can get
  /// information such as the current status of a dataset and statistics about
  /// the images and labels in a dataset.
  ///
  /// This operation requires permissions to perform the
  /// <code>rekognition:DescribeDataset</code> action.
  ///
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [InvalidParameterException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [datasetArn] :
  /// The Amazon Resource Name (ARN) of the dataset that you want to describe.
  Future<DescribeDatasetResponse> describeDataset({
    required String datasetArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.DescribeDataset'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatasetArn': datasetArn,
      },
    );

    return DescribeDatasetResponse.fromJson(jsonResponse.body);
  }

  /// Lists and describes the versions of an Amazon Rekognition project. You can
  /// specify up to 10 model or adapter versions in
  /// <code>ProjectVersionArns</code>. If you don't specify a value,
  /// descriptions for all model/adapter versions in the project are returned.
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
  /// The Amazon Resource Name (ARN) of the project that contains the
  /// model/adapter you want to describe.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per paginated call. The largest
  /// value you can specify is 100. If you specify a value greater than 100, a
  /// ValidationException error occurs. The default value is 100.
  ///
  /// Parameter [nextToken] :
  /// If the previous response was incomplete (because there is more results to
  /// retrieve), Amazon Rekognition returns a pagination token in the response.
  /// You can use this pagination token to retrieve the next set of results.
  ///
  /// Parameter [versionNames] :
  /// A list of model or project version names that you want to describe. You
  /// can add up to 10 model or project version names to the list. If you don't
  /// specify a value, all project version descriptions are returned. A version
  /// name is part of a project version ARN. For example,
  /// <code>my-model.2020-01-21T09.10.15</code> is the version name in the
  /// following ARN.
  /// <code>arn:aws:rekognition:us-east-1:123456789012:project/getting-started/version/<i>my-model.2020-01-21T09.10.15</i>/1234567890123</code>.
  Future<DescribeProjectVersionsResponse> describeProjectVersions({
    required String projectArn,
    int? maxResults,
    String? nextToken,
    List<String>? versionNames,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
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

  /// Gets information about your Rekognition projects.
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
  /// Parameter [features] :
  /// Specifies the type of customization to filter projects by. If no value is
  /// specified, CUSTOM_LABELS is used as a default.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per paginated call. The largest
  /// value you can specify is 100. If you specify a value greater than 100, a
  /// ValidationException error occurs. The default value is 100.
  ///
  /// Parameter [nextToken] :
  /// If the previous response was incomplete (because there is more results to
  /// retrieve), Rekognition returns a pagination token in the response. You can
  /// use this pagination token to retrieve the next set of results.
  ///
  /// Parameter [projectNames] :
  /// A list of the projects that you want Rekognition to describe. If you don't
  /// specify a value, the response includes descriptions for all the projects
  /// in your AWS account.
  Future<DescribeProjectsResponse> describeProjects({
    List<CustomizationFeature>? features,
    int? maxResults,
    String? nextToken,
    List<String>? projectNames,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
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
        if (features != null)
          'Features': features.map((e) => e.toValue()).toList(),
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (projectNames != null) 'ProjectNames': projectNames,
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
    required String name,
  }) async {
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

  /// <note>
  /// This operation applies only to Amazon Rekognition Custom Labels.
  /// </note>
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
  /// (<code>Geometry</code>). Note that for the
  /// <code>DetectCustomLabelsLabels</code> operation, <code>Polygons</code> are
  /// not returned in the <code>Geometry</code> section of the response.
  ///
  /// To filter labels that are returned, specify a value for
  /// <code>MinConfidence</code>. <code>DetectCustomLabelsLabels</code> only
  /// returns labels with a confidence that's higher than the specified value.
  /// The value of <code>MinConfidence</code> maps to the assumed threshold
  /// values created during training. For more information, see <i>Assumed
  /// threshold</i> in the Amazon Rekognition Custom Labels Developer Guide.
  /// Amazon Rekognition Custom Labels metrics expresses an assumed threshold as
  /// a floating point value between 0-1. The range of
  /// <code>MinConfidence</code> normalizes the threshold value to a percentage
  /// value (0-100). Confidence responses from <code>DetectCustomLabels</code>
  /// are also returned as a percentage. You can use <code>MinConfidence</code>
  /// to change the precision and recall or your model. For more information,
  /// see <i>Analyzing an image</i> in the Amazon Rekognition Custom Labels
  /// Developer Guide.
  ///
  /// If you don't specify a value for <code>MinConfidence</code>,
  /// <code>DetectCustomLabels</code> returns labels based on the assumed
  /// threshold of each label.
  ///
  /// This is a stateless API operation. That is, the operation does not persist
  /// any data.
  ///
  /// This operation requires permissions to perform the
  /// <code>rekognition:DetectCustomLabels</code> action.
  ///
  /// For more information, see <i>Analyzing an image</i> in the Amazon
  /// Rekognition Custom Labels Developer Guide.
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
  /// The ARN of the model version that you want to use. Only models associated
  /// with Custom Labels projects accepted by the operation. If a provided ARN
  /// refers to a model version associated with a project for a different
  /// feature type, then an InvalidParameterException is returned.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results you want the service to return in the response.
  /// The service returns the specified number of highest confidence labels
  /// ranked from highest confidence to lowest.
  ///
  /// Parameter [minConfidence] :
  /// Specifies the minimum confidence level for the labels to return.
  /// <code>DetectCustomLabels</code> doesn't return any labels with a
  /// confidence value that's lower than this specified value. If you specify a
  /// value of 0, <code>DetectCustomLabels</code> returns all labels, regardless
  /// of the assumed threshold applied to each label. If you don't specify a
  /// value for <code>MinConfidence</code>, <code>DetectCustomLabels</code>
  /// returns labels based on the assumed threshold of each label.
  Future<DetectCustomLabelsResponse> detectCustomLabels({
    required Image image,
    required String projectVersionArn,
    int? maxResults,
    double? minConfidence,
  }) async {
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
  /// landmarks (for example, coordinates of eye and mouth), pose, presence of
  /// facial occlusion, and so on.
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
  /// An array of facial attributes you want to be returned. A
  /// <code>DEFAULT</code> subset of facial attributes -
  /// <code>BoundingBox</code>, <code>Confidence</code>, <code>Pose</code>,
  /// <code>Quality</code>, and <code>Landmarks</code> - will always be
  /// returned. You can request for specific facial attributes (in addition to
  /// the default list) - by using [<code>"DEFAULT", "FACE_OCCLUDED"</code>] or
  /// just [<code>"FACE_OCCLUDED"</code>]. You can request for all facial
  /// attributes by using [<code>"ALL"]</code>. Requesting more attributes may
  /// increase response time.
  ///
  /// If you provide both, <code>["ALL", "DEFAULT"]</code>, the service uses a
  /// logical "AND" operator to determine which attributes to return (in this
  /// case, all attributes).
  ///
  /// Note that while the FaceOccluded and EyeDirection attributes are supported
  /// when using <code>DetectFaces</code>, they aren't supported when analyzing
  /// videos with <code>StartFaceDetection</code> and
  /// <code>GetFaceDetection</code>.
  Future<DetectFacesResponse> detectFaces({
    required Image image,
    List<Attribute>? attributes,
  }) async {
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
          'Attributes': attributes.map((e) => e.toValue()).toList(),
      },
    );

    return DetectFacesResponse.fromJson(jsonResponse.body);
  }

  /// Detects instances of real-world entities within an image (JPEG or PNG)
  /// provided as input. This includes objects like flower, tree, and table;
  /// events like wedding, graduation, and birthday party; and concepts like
  /// landscape, evening, and nature.
  ///
  /// For an example, see Analyzing images stored in an Amazon S3 bucket in the
  /// Amazon Rekognition Developer Guide.
  ///
  /// You pass the input image as base64-encoded image bytes or as a reference
  /// to an image in an Amazon S3 bucket. If you use the AWS CLI to call Amazon
  /// Rekognition operations, passing image bytes is not supported. The image
  /// must be either a PNG or JPEG formatted file.
  ///
  /// <b>Optional Parameters</b>
  ///
  /// You can specify one or both of the <code>GENERAL_LABELS</code> and
  /// <code>IMAGE_PROPERTIES</code> feature types when calling the DetectLabels
  /// API. Including <code>GENERAL_LABELS</code> will ensure the response
  /// includes the labels detected in the input image, while including
  /// <code>IMAGE_PROPERTIES </code>will ensure the response includes
  /// information about the image quality and color.
  ///
  /// When using <code>GENERAL_LABELS</code> and/or
  /// <code>IMAGE_PROPERTIES</code> you can provide filtering criteria to the
  /// Settings parameter. You can filter with sets of individual labels or with
  /// label categories. You can specify inclusive filters, exclusive filters, or
  /// a combination of inclusive and exclusive filters. For more information on
  /// filtering see <a
  /// href="https://docs.aws.amazon.com/rekognition/latest/dg/labels-detect-labels-image.html">Detecting
  /// Labels in an Image</a>.
  ///
  /// When getting labels, you can specify <code>MinConfidence</code> to control
  /// the confidence threshold for the labels returned. The default is 55%. You
  /// can also add the <code>MaxLabels</code> parameter to limit the number of
  /// labels returned. The default and upper limit is 1000 labels. These
  /// arguments are only valid when supplying GENERAL_LABELS as a feature type.
  ///
  /// <b>Response Elements</b>
  ///
  /// For each object, scene, and concept the API returns one or more labels.
  /// The API returns the following types of information about labels:
  ///
  /// <ul>
  /// <li>
  /// Name - The name of the detected label.
  /// </li>
  /// <li>
  /// Confidence - The level of confidence in the label assigned to a detected
  /// object.
  /// </li>
  /// <li>
  /// Parents - The ancestor labels for a detected label. DetectLabels returns a
  /// hierarchical taxonomy of detected labels. For example, a detected car
  /// might be assigned the label car. The label car has two parent labels:
  /// Vehicle (its parent) and Transportation (its grandparent). The response
  /// includes the all ancestors for a label, where every ancestor is a unique
  /// label. In the previous example, Car, Vehicle, and Transportation are
  /// returned as unique labels in the response.
  /// </li>
  /// <li>
  /// Aliases - Possible Aliases for the label.
  /// </li>
  /// <li>
  /// Categories - The label categories that the detected label belongs to.
  /// </li>
  /// <li>
  /// BoundingBox — Bounding boxes are described for all instances of detected
  /// common object labels, returned in an array of Instance objects. An
  /// Instance object contains a BoundingBox object, describing the location of
  /// the label on the input image. It also includes the confidence for the
  /// accuracy of the detected bounding box.
  /// </li>
  /// </ul>
  /// The API returns the following information regarding the image, as part of
  /// the ImageProperties structure:
  ///
  /// <ul>
  /// <li>
  /// Quality - Information about the Sharpness, Brightness, and Contrast of the
  /// input image, scored between 0 to 100. Image quality is returned for the
  /// entire image, as well as the background and the foreground.
  /// </li>
  /// <li>
  /// Dominant Color - An array of the dominant colors in the image.
  /// </li>
  /// <li>
  /// Foreground - Information about the sharpness, brightness, and dominant
  /// colors of the input image’s foreground.
  /// </li>
  /// <li>
  /// Background - Information about the sharpness, brightness, and dominant
  /// colors of the input image’s background.
  /// </li>
  /// </ul>
  /// The list of returned labels will include at least one label for every
  /// detected object, along with information about that label. In the following
  /// example, suppose the input image has a lighthouse, the sea, and a rock.
  /// The response includes all three labels, one for each object, as well as
  /// the confidence in the label:
  ///
  /// <code>{Name: lighthouse, Confidence: 98.4629}</code>
  ///
  /// <code>{Name: rock,Confidence: 79.2097}</code>
  ///
  /// <code> {Name: sea,Confidence: 75.061}</code>
  ///
  /// The list of labels can include multiple labels for the same object. For
  /// example, if the input image shows a flower (for example, a tulip), the
  /// operation might return the following three labels.
  ///
  /// <code>{Name: flower,Confidence: 99.0562}</code>
  ///
  /// <code>{Name: plant,Confidence: 99.0562}</code>
  ///
  /// <code>{Name: tulip,Confidence: 99.0562}</code>
  ///
  /// In this example, the detection algorithm more precisely identifies the
  /// flower as a tulip.
  /// <note>
  /// If the object detected is a person, the operation doesn't provide the same
  /// facial details that the <a>DetectFaces</a> operation provides.
  /// </note>
  /// This is a stateless API operation that doesn't return any data.
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
  /// Parameter [features] :
  /// A list of the types of analysis to perform. Specifying GENERAL_LABELS uses
  /// the label detection feature, while specifying IMAGE_PROPERTIES returns
  /// information regarding image color and quality. If no option is specified
  /// GENERAL_LABELS is used by default.
  ///
  /// Parameter [maxLabels] :
  /// Maximum number of labels you want the service to return in the response.
  /// The service returns the specified number of highest confidence labels.
  /// Only valid when GENERAL_LABELS is specified as a feature type in the
  /// Feature input parameter.
  ///
  /// Parameter [minConfidence] :
  /// Specifies the minimum confidence level for the labels to return. Amazon
  /// Rekognition doesn't return any labels with confidence lower than this
  /// specified value.
  ///
  /// If <code>MinConfidence</code> is not specified, the operation returns
  /// labels with a confidence values greater than or equal to 55 percent. Only
  /// valid when GENERAL_LABELS is specified as a feature type in the Feature
  /// input parameter.
  ///
  /// Parameter [settings] :
  /// A list of the filters to be applied to returned detected labels and image
  /// properties. Specified filters can be inclusive, exclusive, or a
  /// combination of both. Filters can be used for individual labels or label
  /// categories. The exact label names or label categories must be supplied.
  /// For a full list of labels and label categories, see <a
  /// href="https://docs.aws.amazon.com/rekognition/latest/dg/labels.html">Detecting
  /// labels</a>.
  Future<DetectLabelsResponse> detectLabels({
    required Image image,
    List<DetectLabelsFeatureName>? features,
    int? maxLabels,
    double? minConfidence,
    DetectLabelsSettings? settings,
  }) async {
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
        if (features != null)
          'Features': features.map((e) => e.toValue()).toList(),
        if (maxLabels != null) 'MaxLabels': maxLabels,
        if (minConfidence != null) 'MinConfidence': minConfidence,
        if (settings != null) 'Settings': settings,
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
  /// You can specify an adapter to use when retrieving label predictions by
  /// providing a <code>ProjectVersionArn</code> to the
  /// <code>ProjectVersion</code> argument.
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceNotReadyException].
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
  ///
  /// Parameter [projectVersion] :
  /// Identifier for the custom adapter. Expects the ProjectVersionArn as a
  /// value. Use the CreateProject or CreateProjectVersion APIs to create a
  /// custom adapter.
  Future<DetectModerationLabelsResponse> detectModerationLabels({
    required Image image,
    HumanLoopConfig? humanLoopConfig,
    double? minConfidence,
    String? projectVersion,
  }) async {
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
        if (projectVersion != null) 'ProjectVersion': projectVersion,
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
    required Image image,
    ProtectiveEquipmentSummarizationAttributes? summarizationAttributes,
  }) async {
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
  /// A word is one or more script characters that are not separated by spaces.
  /// <code>DetectText</code> can detect up to 100 words in an image.
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
  /// For more information, see Detecting text in the Amazon Rekognition
  /// Developer Guide.
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
    required Image image,
    DetectTextFilters? filters,
  }) async {
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

  /// Removes the association between a <code>Face</code> supplied in an array
  /// of <code>FaceIds</code> and the User. If the User is not present already,
  /// then a <code>ResourceNotFound</code> exception is thrown. If successful,
  /// an array of faces that are disassociated from the User is returned. If a
  /// given face is already disassociated from the given UserID, it will be
  /// ignored and not be returned in the response. If a given face is already
  /// associated with a different User or not found in the collection it will be
  /// returned as part of <code>UnsuccessfulDisassociations</code>. You can
  /// remove 1 - 100 face IDs from a user at one time.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [collectionId] :
  /// The ID of an existing collection containing the UserID.
  ///
  /// Parameter [faceIds] :
  /// An array of face IDs to disassociate from the UserID.
  ///
  /// Parameter [userId] :
  /// ID for the existing UserID.
  ///
  /// Parameter [clientRequestToken] :
  /// Idempotent token used to identify the request to
  /// <code>DisassociateFaces</code>. If you use the same token with multiple
  /// <code>DisassociateFaces</code> requests, the same response is returned.
  /// Use ClientRequestToken to prevent the same request from being processed
  /// more than once.
  Future<DisassociateFacesResponse> disassociateFaces({
    required String collectionId,
    required List<String> faceIds,
    required String userId,
    String? clientRequestToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.DisassociateFaces'
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
        'UserId': userId,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
      },
    );

    return DisassociateFacesResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This operation applies only to Amazon Rekognition Custom Labels.
  /// </note>
  /// Distributes the entries (images) in a training dataset across the training
  /// dataset and the test dataset for a project.
  /// <code>DistributeDatasetEntries</code> moves 20% of the training dataset
  /// images to the test dataset. An entry is a JSON Line that describes an
  /// image.
  ///
  /// You supply the Amazon Resource Names (ARN) of a project's training dataset
  /// and test dataset. The training dataset must contain the images that you
  /// want to split. The test dataset must be empty. The datasets must belong to
  /// the same project. To create training and test datasets for a project, call
  /// <a>CreateDataset</a>.
  ///
  /// Distributing a dataset takes a while to complete. To check the status call
  /// <code>DescribeDataset</code>. The operation is complete when the
  /// <code>Status</code> field for the training dataset and the test dataset is
  /// <code>UPDATE_COMPLETE</code>. If the dataset split fails, the value of
  /// <code>Status</code> is <code>UPDATE_FAILED</code>.
  ///
  /// This operation requires permissions to perform the
  /// <code>rekognition:DistributeDatasetEntries</code> action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [ResourceNotReadyException].
  ///
  /// Parameter [datasets] :
  /// The ARNS for the training dataset and test dataset that you want to use.
  /// The datasets must belong to the same project. The test dataset must be
  /// empty.
  Future<void> distributeDatasetEntries({
    required List<DistributeDataset> datasets,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.DistributeDatasetEntries'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Datasets': datasets,
      },
    );
  }

  /// Gets the name and additional information about a celebrity based on their
  /// Amazon Rekognition ID. The additional information is returned as an array
  /// of URLs. If there is no additional information about the celebrity, this
  /// list is empty.
  ///
  /// For more information, see Getting information about a celebrity in the
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
    required String id,
  }) async {
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
  /// identifier (<code>JobId</code>).
  ///
  /// When the celebrity recognition operation finishes, Amazon Rekognition
  /// Video publishes a completion status to the Amazon Simple Notification
  /// Service topic registered in the initial call to
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
  /// the celebrity was detected. This <a>CelebrityDetail</a> object stores
  /// information about the detected celebrity's face attributes, a face
  /// bounding box, known gender, the celebrity's name, and a confidence
  /// estimate.
  /// <note>
  /// <code>GetCelebrityRecognition</code> only returns the default facial
  /// attributes (<code>BoundingBox</code>, <code>Confidence</code>,
  /// <code>Landmarks</code>, <code>Pose</code>, and <code>Quality</code>). The
  /// <code>BoundingBox</code> field only applies to the detected face instance.
  /// The other facial attributes listed in the <code>Face</code> object of the
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
    required String jobId,
    int? maxResults,
    String? nextToken,
    CelebrityRecognitionSortBy? sortBy,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
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

  /// Gets the inappropriate, unwanted, or offensive content analysis results
  /// for a Amazon Rekognition Video analysis started by
  /// <a>StartContentModeration</a>. For a list of moderation labels in Amazon
  /// Rekognition, see <a
  /// href="https://docs.aws.amazon.com/rekognition/latest/dg/moderation.html#moderation-api">Using
  /// the image and video moderation APIs</a>.
  ///
  /// Amazon Rekognition Video inappropriate or offensive content detection in a
  /// stored video is an asynchronous operation. You start analysis by calling
  /// <a>StartContentModeration</a> which returns a job identifier
  /// (<code>JobId</code>). When analysis finishes, Amazon Rekognition Video
  /// publishes a completion status to the Amazon Simple Notification Service
  /// topic registered in the initial call to
  /// <code>StartContentModeration</code>. To get the results of the content
  /// analysis, first check that the status value published to the Amazon SNS
  /// topic is <code>SUCCEEDED</code>. If so, call
  /// <code>GetContentModeration</code> and pass the job identifier
  /// (<code>JobId</code>) from the initial call to
  /// <code>StartContentModeration</code>.
  ///
  /// For more information, see Working with Stored Videos in the Amazon
  /// Rekognition Devlopers Guide.
  ///
  /// <code>GetContentModeration</code> returns detected inappropriate,
  /// unwanted, or offensive content moderation labels, and the time they are
  /// detected, in an array, <code>ModerationLabels</code>, of
  /// <a>ContentModerationDetection</a> objects.
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
  /// For more information, see moderating content in the Amazon Rekognition
  /// Developer Guide.
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
  /// The identifier for the inappropriate, unwanted, or offensive content
  /// moderation job. Use <code>JobId</code> to identify the job in a subsequent
  /// call to <code>GetContentModeration</code>.
  ///
  /// Parameter [aggregateBy] :
  /// Defines how to aggregate results of the StartContentModeration request.
  /// Default aggregation option is TIMESTAMPS. SEGMENTS mode aggregates
  /// moderation labels over time.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return per paginated call. The largest value
  /// you can specify is 1000. If you specify a value greater than 1000, a
  /// maximum of 1000 results is returned. The default value is 1000.
  ///
  /// Parameter [nextToken] :
  /// If the previous response was incomplete (because there is more data to
  /// retrieve), Amazon Rekognition returns a pagination token in the response.
  /// You can use this pagination token to retrieve the next set of content
  /// moderation labels.
  ///
  /// Parameter [sortBy] :
  /// Sort to use for elements in the <code>ModerationLabelDetections</code>
  /// array. Use <code>TIMESTAMP</code> to sort array elements by the time
  /// labels are detected. Use <code>NAME</code> to alphabetically group
  /// elements for a label together. Within each label group, the array element
  /// are sorted by detection confidence. The default sort is by
  /// <code>TIMESTAMP</code>.
  Future<GetContentModerationResponse> getContentModeration({
    required String jobId,
    ContentModerationAggregateBy? aggregateBy,
    int? maxResults,
    String? nextToken,
    ContentModerationSortBy? sortBy,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
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
        if (aggregateBy != null) 'AggregateBy': aggregateBy.toValue(),
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
  /// Note that for the <code>GetFaceDetection</code> operation, the returned
  /// values for <code>FaceOccluded</code> and <code>EyeDirection</code> will
  /// always be "null".
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
    required String jobId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
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

  /// Retrieves the results of a specific Face Liveness session. It requires the
  /// <code>sessionId</code> as input, which was created using
  /// <code>CreateFaceLivenessSession</code>. Returns the corresponding Face
  /// Liveness confidence score, a reference image that includes a face bounding
  /// box, and audit images that also contain face bounding boxes. The Face
  /// Liveness confidence score ranges from 0 to 100.
  ///
  /// The number of audit images returned by
  /// <code>GetFaceLivenessSessionResults</code> is defined by the
  /// <code>AuditImagesLimit</code> paramater when calling
  /// <code>CreateFaceLivenessSession</code>. Reference images are always
  /// returned when possible.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [InvalidParameterException].
  /// May throw [SessionNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ProvisionedThroughputExceededException].
  ///
  /// Parameter [sessionId] :
  /// A unique 128-bit UUID. This is used to uniquely identify the session and
  /// also acts as an idempotency token for all operations associated with the
  /// session.
  Future<GetFaceLivenessSessionResultsResponse> getFaceLivenessSessionResults({
    required String sessionId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.GetFaceLivenessSessionResults'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SessionId': sessionId,
      },
    );

    return GetFaceLivenessSessionResultsResponse.fromJson(jsonResponse.body);
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
    required String jobId,
    int? maxResults,
    String? nextToken,
    FaceSearchSortBy? sortBy,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
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
  /// <code>StartlabelDetection</code>.
  ///
  /// To get the results of the label detection operation, first check that the
  /// status value published to the Amazon SNS topic is <code>SUCCEEDED</code>.
  /// If so, call <a>GetLabelDetection</a> and pass the job identifier
  /// (<code>JobId</code>) from the initial call to
  /// <code>StartLabelDetection</code>.
  ///
  /// <code>GetLabelDetection</code> returns an array of detected labels
  /// (<code>Labels</code>) sorted by the time the labels were detected. You can
  /// also sort by the label name by specifying <code>NAME</code> for the
  /// <code>SortBy</code> input parameter. If there is no <code>NAME</code>
  /// specified, the default sort is by timestamp.
  ///
  /// You can select how results are aggregated by using the
  /// <code>AggregateBy</code> input parameter. The default aggregation method
  /// is <code>TIMESTAMPS</code>. You can also aggregate by
  /// <code>SEGMENTS</code>, which aggregates all instances of labels detected
  /// in a given segment.
  ///
  /// The returned Labels array may include the following attributes:
  ///
  /// <ul>
  /// <li>
  /// Name - The name of the detected label.
  /// </li>
  /// <li>
  /// Confidence - The level of confidence in the label assigned to a detected
  /// object.
  /// </li>
  /// <li>
  /// Parents - The ancestor labels for a detected label. GetLabelDetection
  /// returns a hierarchical taxonomy of detected labels. For example, a
  /// detected car might be assigned the label car. The label car has two parent
  /// labels: Vehicle (its parent) and Transportation (its grandparent). The
  /// response includes the all ancestors for a label, where every ancestor is a
  /// unique label. In the previous example, Car, Vehicle, and Transportation
  /// are returned as unique labels in the response.
  /// </li>
  /// <li>
  /// Aliases - Possible Aliases for the label.
  /// </li>
  /// <li>
  /// Categories - The label categories that the detected label belongs to.
  /// </li>
  /// <li>
  /// BoundingBox — Bounding boxes are described for all instances of detected
  /// common object labels, returned in an array of Instance objects. An
  /// Instance object contains a BoundingBox object, describing the location of
  /// the label on the input image. It also includes the confidence for the
  /// accuracy of the detected bounding box.
  /// </li>
  /// <li>
  /// Timestamp - Time, in milliseconds from the start of the video, that the
  /// label was detected. For aggregation by <code>SEGMENTS</code>, the
  /// <code>StartTimestampMillis</code>, <code>EndTimestampMillis</code>, and
  /// <code>DurationMillis</code> structures are what define a segment. Although
  /// the “Timestamp” structure is still returned with each label, its value is
  /// set to be the same as <code>StartTimestampMillis</code>.
  /// </li>
  /// </ul>
  /// Timestamp and Bounding box information are returned for detected
  /// Instances, only if aggregation is done by <code>TIMESTAMPS</code>. If
  /// aggregating by <code>SEGMENTS</code>, information about detected instances
  /// isn’t returned.
  ///
  /// The version of the label model used for the detection is also returned.
  ///
  /// <b>Note <code>DominantColors</code> isn't returned for
  /// <code>Instances</code>, although it is shown as part of the response in
  /// the sample seen below.</b>
  ///
  /// Use <code>MaxResults</code> parameter to limit the number of labels
  /// returned. If there are more results than specified in
  /// <code>MaxResults</code>, the value of <code>NextToken</code> in the
  /// operation response contains a pagination token for getting the next set of
  /// results. To get the next page of results, call
  /// <code>GetlabelDetection</code> and populate the <code>NextToken</code>
  /// request parameter with the token value returned from the previous call to
  /// <code>GetLabelDetection</code>.
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
  /// Parameter [aggregateBy] :
  /// Defines how to aggregate the returned results. Results can be aggregated
  /// by timestamps or segments.
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
    required String jobId,
    LabelDetectionAggregateBy? aggregateBy,
    int? maxResults,
    String? nextToken,
    LabelDetectionSortBy? sortBy,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
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
        if (aggregateBy != null) 'AggregateBy': aggregateBy.toValue(),
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (sortBy != null) 'SortBy': sortBy.toValue(),
      },
    );

    return GetLabelDetectionResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the results for a given media analysis job. Takes a
  /// <code>JobId</code> returned by StartMediaAnalysisJob.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerError].
  /// May throw [InvalidParameterException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [jobId] :
  /// Unique identifier for the media analysis job for which you want to
  /// retrieve results.
  Future<GetMediaAnalysisJobResponse> getMediaAnalysisJob({
    required String jobId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.GetMediaAnalysisJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobId': jobId,
      },
    );

    return GetMediaAnalysisJobResponse.fromJson(jsonResponse.body);
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
    required String jobId,
    int? maxResults,
    String? nextToken,
    PersonTrackingSortBy? sortBy,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
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
  /// For more information, see Detecting video segments in stored video in the
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
    required String jobId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
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
  /// to 100 words per frame of video.
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
    required String jobId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
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
  /// For more information, see Adding faces to a collection in the Amazon
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
  /// If you request <code>ALL</code> or specific facial attributes (e.g.,
  /// <code>FACE_OCCLUDED</code>) by using the detectionAttributes parameter,
  /// Amazon Rekognition returns detailed facial attributes, such as facial
  /// landmarks (for example, location of eye and mouth), facial occlusion, and
  /// other facial attributes.
  ///
  /// If you provide the same image, specify the same collection, and use the
  /// same external ID in the <code>IndexFaces</code> operation, Amazon
  /// Rekognition doesn't save duplicate face metadata.
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
  /// An array of facial attributes you want to be returned. A
  /// <code>DEFAULT</code> subset of facial attributes -
  /// <code>BoundingBox</code>, <code>Confidence</code>, <code>Pose</code>,
  /// <code>Quality</code>, and <code>Landmarks</code> - will always be
  /// returned. You can request for specific facial attributes (in addition to
  /// the default list) - by using <code>["DEFAULT", "FACE_OCCLUDED"]</code> or
  /// just <code>["FACE_OCCLUDED"]</code>. You can request for all facial
  /// attributes by using <code>["ALL"]</code>. Requesting more attributes may
  /// increase response time.
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
    required String collectionId,
    required Image image,
    List<Attribute>? detectionAttributes,
    String? externalImageId,
    int? maxFaces,
    QualityFilter? qualityFilter,
  }) async {
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
              detectionAttributes.map((e) => e.toValue()).toList(),
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
  /// For an example, see Listing collections in the Amazon Rekognition
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
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      4096,
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

  /// <note>
  /// This operation applies only to Amazon Rekognition Custom Labels.
  /// </note>
  /// Lists the entries (images) within a dataset. An entry is a JSON Line that
  /// contains the information for a single image, including the image location,
  /// assigned labels, and object location bounding boxes. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/rekognition/latest/customlabels-dg/md-manifest-files.html">Creating
  /// a manifest file</a>.
  ///
  /// JSON Lines in the response include information about non-terminal errors
  /// found in the dataset. Non terminal errors are reported in
  /// <code>errors</code> lists within each JSON Line. The same information is
  /// reported in the training and testing validation result manifests that
  /// Amazon Rekognition Custom Labels creates during model training.
  ///
  /// You can filter the response in variety of ways, such as choosing which
  /// labels to return and returning JSON Lines created after a specific date.
  ///
  /// This operation requires permissions to perform the
  /// <code>rekognition:ListDatasetEntries</code> action.
  ///
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [InvalidParameterException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [ResourceNotReadyException].
  ///
  /// Parameter [datasetArn] :
  /// The Amazon Resource Name (ARN) for the dataset that you want to use.
  ///
  /// Parameter [containsLabels] :
  /// Specifies a label filter for the response. The response includes an entry
  /// only if one or more of the labels in <code>ContainsLabels</code> exist in
  /// the entry.
  ///
  /// Parameter [hasErrors] :
  /// Specifies an error filter for the response. Specify <code>True</code> to
  /// only include entries that have errors.
  ///
  /// Parameter [labeled] :
  /// Specify <code>true</code> to get only the JSON Lines where the image is
  /// labeled. Specify <code>false</code> to get only the JSON Lines where the
  /// image isn't labeled. If you don't specify <code>Labeled</code>,
  /// <code>ListDatasetEntries</code> returns JSON Lines for labeled and
  /// unlabeled images.
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
  /// Parameter [sourceRefContains] :
  /// If specified, <code>ListDatasetEntries</code> only returns JSON Lines
  /// where the value of <code>SourceRefContains</code> is part of the
  /// <code>source-ref</code> field. The <code>source-ref</code> field contains
  /// the Amazon S3 location of the image. You can use
  /// <code>SouceRefContains</code> for tasks such as getting the JSON Line for
  /// a single image, or gettting JSON Lines for all images within a specific
  /// folder.
  Future<ListDatasetEntriesResponse> listDatasetEntries({
    required String datasetArn,
    List<String>? containsLabels,
    bool? hasErrors,
    bool? labeled,
    int? maxResults,
    String? nextToken,
    String? sourceRefContains,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.ListDatasetEntries'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatasetArn': datasetArn,
        if (containsLabels != null) 'ContainsLabels': containsLabels,
        if (hasErrors != null) 'HasErrors': hasErrors,
        if (labeled != null) 'Labeled': labeled,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (sourceRefContains != null) 'SourceRefContains': sourceRefContains,
      },
    );

    return ListDatasetEntriesResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This operation applies only to Amazon Rekognition Custom Labels.
  /// </note>
  /// Lists the labels in a dataset. Amazon Rekognition Custom Labels uses
  /// labels to describe images. For more information, see <a
  /// href="https://docs.aws.amazon.com/rekognition/latest/customlabels-dg/md-labeling-images.html">Labeling
  /// images</a>.
  ///
  /// Lists the labels in a dataset. Amazon Rekognition Custom Labels uses
  /// labels to describe images. For more information, see Labeling images in
  /// the <i>Amazon Rekognition Custom Labels Developer Guide</i>.
  ///
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [InvalidParameterException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceNotReadyException].
  ///
  /// Parameter [datasetArn] :
  /// The Amazon Resource Name (ARN) of the dataset that you want to use.
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
  Future<ListDatasetLabelsResponse> listDatasetLabels({
    required String datasetArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.ListDatasetLabels'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatasetArn': datasetArn,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListDatasetLabelsResponse.fromJson(jsonResponse.body);
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
  /// Parameter [faceIds] :
  /// An array of face IDs to filter results with when listing faces in a
  /// collection.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of faces to return.
  ///
  /// Parameter [nextToken] :
  /// If the previous response was incomplete (because there is more data to
  /// retrieve), Amazon Rekognition returns a pagination token in the response.
  /// You can use this pagination token to retrieve the next set of faces.
  ///
  /// Parameter [userId] :
  /// An array of user IDs to filter results with when listing faces in a
  /// collection.
  Future<ListFacesResponse> listFaces({
    required String collectionId,
    List<String>? faceIds,
    int? maxResults,
    String? nextToken,
    String? userId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      4096,
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
        if (faceIds != null) 'FaceIds': faceIds,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (userId != null) 'UserId': userId,
      },
    );

    return ListFacesResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of media analysis jobs. Results are sorted by
  /// <code>CreationTimestamp</code> in descending order.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per paginated call. The largest
  /// value user can specify is 100. If user specifies a value greater than 100,
  /// an <code>InvalidParameterException</code> error occurs. The default value
  /// is 100.
  ///
  /// Parameter [nextToken] :
  /// Pagination token, if the previous response was incomplete.
  Future<ListMediaAnalysisJobsResponse> listMediaAnalysisJobs({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.ListMediaAnalysisJobs'
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

    return ListMediaAnalysisJobsResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This operation applies only to Amazon Rekognition Custom Labels.
  /// </note>
  /// Gets a list of the project policies attached to a project.
  ///
  /// To attach a project policy to a project, call <a>PutProjectPolicy</a>. To
  /// remove a project policy from a project, call <a>DeleteProjectPolicy</a>.
  ///
  /// This operation requires permissions to perform the
  /// <code>rekognition:ListProjectPolicies</code> action.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [InvalidPaginationTokenException].
  ///
  /// Parameter [projectArn] :
  /// The ARN of the project for which you want to list the project policies.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per paginated call. The largest
  /// value you can specify is 5. If you specify a value greater than 5, a
  /// ValidationException error occurs. The default value is 5.
  ///
  /// Parameter [nextToken] :
  /// If the previous response was incomplete (because there is more results to
  /// retrieve), Amazon Rekognition Custom Labels returns a pagination token in
  /// the response. You can use this pagination token to retrieve the next set
  /// of results.
  Future<ListProjectPoliciesResponse> listProjectPolicies({
    required String projectArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      5,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.ListProjectPolicies'
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
      },
    );

    return ListProjectPoliciesResponse.fromJson(jsonResponse.body);
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
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
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

  /// Returns a list of tags in an Amazon Rekognition collection, stream
  /// processor, or Custom Labels model.
  ///
  /// This operation requires permissions to perform the
  /// <code>rekognition:ListTagsForResource</code> action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [ProvisionedThroughputExceededException].
  ///
  /// Parameter [resourceArn] :
  /// Amazon Resource Name (ARN) of the model, collection, or stream processor
  /// that contains the tags that you want a list of.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Returns metadata of the User such as <code>UserID</code> in the specified
  /// collection. Anonymous User (to reserve faces without any identity) is not
  /// returned as part of this request. The results are sorted by system
  /// generated primary key ID. If the response is truncated,
  /// <code>NextToken</code> is returned in the response that can be used in the
  /// subsequent request to retrieve the next set of identities.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [collectionId] :
  /// The ID of an existing collection.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of UsersID to return.
  ///
  /// Parameter [nextToken] :
  /// Pagingation token to receive the next set of UsersID.
  Future<ListUsersResponse> listUsers({
    required String collectionId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.ListUsers'
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

    return ListUsersResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This operation applies only to Amazon Rekognition Custom Labels.
  /// </note>
  /// Attaches a project policy to a Amazon Rekognition Custom Labels project in
  /// a trusting AWS account. A project policy specifies that a trusted AWS
  /// account can copy a model version from a trusting AWS account to a project
  /// in the trusted AWS account. To copy a model version you use the
  /// <a>CopyProjectVersion</a> operation. Only applies to Custom Labels
  /// projects.
  ///
  /// For more information about the format of a project policy document, see
  /// Attaching a project policy (SDK) in the <i>Amazon Rekognition Custom
  /// Labels Developer Guide</i>.
  ///
  /// The response from <code>PutProjectPolicy</code> is a revision ID for the
  /// project policy. You can attach multiple project policies to a project. You
  /// can also update an existing project policy by specifying the policy
  /// revision ID of the existing policy.
  ///
  /// To remove a project policy from a project, call
  /// <a>DeleteProjectPolicy</a>. To get a list of project policies attached to
  /// a project, call <a>ListProjectPolicies</a>.
  ///
  /// You copy a model version by calling <a>CopyProjectVersion</a>.
  ///
  /// This operation requires permissions to perform the
  /// <code>rekognition:PutProjectPolicy</code> action.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidPolicyRevisionIdException].
  /// May throw [MalformedPolicyDocumentException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [policyDocument] :
  /// A resource policy to add to the model. The policy is a JSON structure that
  /// contains one or more statements that define the policy. The policy must
  /// follow the IAM syntax. For more information about the contents of a JSON
  /// policy document, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies.html">IAM
  /// JSON policy reference</a>.
  ///
  /// Parameter [policyName] :
  /// A name for the policy.
  ///
  /// Parameter [projectArn] :
  /// The Amazon Resource Name (ARN) of the project that the project policy is
  /// attached to.
  ///
  /// Parameter [policyRevisionId] :
  /// The revision ID for the Project Policy. Each time you modify a policy,
  /// Amazon Rekognition Custom Labels generates and assigns a new
  /// <code>PolicyRevisionId</code> and then deletes the previous version of the
  /// policy.
  Future<PutProjectPolicyResponse> putProjectPolicy({
    required String policyDocument,
    required String policyName,
    required String projectArn,
    String? policyRevisionId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.PutProjectPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PolicyDocument': policyDocument,
        'PolicyName': policyName,
        'ProjectArn': projectArn,
        if (policyRevisionId != null) 'PolicyRevisionId': policyRevisionId,
      },
    );

    return PutProjectPolicyResponse.fromJson(jsonResponse.body);
  }

  /// Returns an array of celebrities recognized in the input image. For more
  /// information, see Recognizing celebrities in the Amazon Rekognition
  /// Developer Guide.
  ///
  /// <code>RecognizeCelebrities</code> returns the 64 largest faces in the
  /// image. It lists the recognized celebrities in the
  /// <code>CelebrityFaces</code> array and any unrecognized faces in the
  /// <code>UnrecognizedFaces</code> array. <code>RecognizeCelebrities</code>
  /// doesn't return celebrities whose faces aren't among the largest 64 faces
  /// in the image.
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
  /// For an example, see Recognizing celebrities in an image in the Amazon
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
    required Image image,
  }) async {
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
  /// For an example, see Searching for a face using its face ID in the Amazon
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
    required String collectionId,
    required String faceId,
    double? faceMatchThreshold,
    int? maxFaces,
  }) async {
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
  /// If no faces are detected in the input image,
  /// <code>SearchFacesByImage</code> returns an
  /// <code>InvalidParameterException</code> error.
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
    required String collectionId,
    required Image image,
    double? faceMatchThreshold,
    int? maxFaces,
    QualityFilter? qualityFilter,
  }) async {
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

  /// Searches for UserIDs within a collection based on a <code>FaceId</code> or
  /// <code>UserId</code>. This API can be used to find the closest UserID (with
  /// a highest similarity) to associate a face. The request must be provided
  /// with either <code>FaceId</code> or <code>UserId</code>. The operation
  /// returns an array of UserID that match the <code>FaceId</code> or
  /// <code>UserId</code>, ordered by similarity score with the highest
  /// similarity first.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [collectionId] :
  /// The ID of an existing collection containing the UserID, used with a UserId
  /// or FaceId. If a FaceId is provided, UserId isn’t required to be present in
  /// the Collection.
  ///
  /// Parameter [faceId] :
  /// ID for the existing face.
  ///
  /// Parameter [maxUsers] :
  /// Maximum number of identities to return.
  ///
  /// Parameter [userId] :
  /// ID for the existing User.
  ///
  /// Parameter [userMatchThreshold] :
  /// Optional value that specifies the minimum confidence in the matched UserID
  /// to return. Default value of 80.
  Future<SearchUsersResponse> searchUsers({
    required String collectionId,
    String? faceId,
    int? maxUsers,
    String? userId,
    double? userMatchThreshold,
  }) async {
    _s.validateNumRange(
      'maxUsers',
      maxUsers,
      1,
      500,
    );
    _s.validateNumRange(
      'userMatchThreshold',
      userMatchThreshold,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.SearchUsers'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CollectionId': collectionId,
        if (faceId != null) 'FaceId': faceId,
        if (maxUsers != null) 'MaxUsers': maxUsers,
        if (userId != null) 'UserId': userId,
        if (userMatchThreshold != null)
          'UserMatchThreshold': userMatchThreshold,
      },
    );

    return SearchUsersResponse.fromJson(jsonResponse.body);
  }

  /// Searches for UserIDs using a supplied image. It first detects the largest
  /// face in the image, and then searches a specified collection for matching
  /// UserIDs.
  ///
  /// The operation returns an array of UserIDs that match the face in the
  /// supplied image, ordered by similarity score with the highest similarity
  /// first. It also returns a bounding box for the face found in the input
  /// image.
  ///
  /// Information about faces detected in the supplied image, but not used for
  /// the search, is returned in an array of <code>UnsearchedFace</code>
  /// objects. If no valid face is detected in the image, the response will
  /// contain an empty <code>UserMatches</code> list and no
  /// <code>SearchedFace</code> object.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidImageFormatException].
  /// May throw [InvalidS3ObjectException].
  /// May throw [ImageTooLargeException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [collectionId] :
  /// The ID of an existing collection containing the UserID.
  ///
  /// Parameter [maxUsers] :
  /// Maximum number of UserIDs to return.
  ///
  /// Parameter [qualityFilter] :
  /// A filter that specifies a quality bar for how much filtering is done to
  /// identify faces. Filtered faces aren't searched for in the collection. The
  /// default value is NONE.
  ///
  /// Parameter [userMatchThreshold] :
  /// Specifies the minimum confidence in the UserID match to return. Default
  /// value is 80.
  Future<SearchUsersByImageResponse> searchUsersByImage({
    required String collectionId,
    required Image image,
    int? maxUsers,
    QualityFilter? qualityFilter,
    double? userMatchThreshold,
  }) async {
    _s.validateNumRange(
      'maxUsers',
      maxUsers,
      1,
      500,
    );
    _s.validateNumRange(
      'userMatchThreshold',
      userMatchThreshold,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.SearchUsersByImage'
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
        if (maxUsers != null) 'MaxUsers': maxUsers,
        if (qualityFilter != null) 'QualityFilter': qualityFilter.toValue(),
        if (userMatchThreshold != null)
          'UserMatchThreshold': userMatchThreshold,
      },
    );

    return SearchUsersByImageResponse.fromJson(jsonResponse.body);
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
  /// For more information, see Recognizing celebrities in the Amazon
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
  /// the completion status of the celebrity recognition analysis to. The Amazon
  /// SNS topic must have a topic name that begins with <i>AmazonRekognition</i>
  /// if you are using the AmazonRekognitionServiceRole permissions policy.
  Future<StartCelebrityRecognitionResponse> startCelebrityRecognition({
    required Video video,
    String? clientRequestToken,
    String? jobTag,
    NotificationChannel? notificationChannel,
  }) async {
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

  /// Starts asynchronous detection of inappropriate, unwanted, or offensive
  /// content in a stored video. For a list of moderation labels in Amazon
  /// Rekognition, see <a
  /// href="https://docs.aws.amazon.com/rekognition/latest/dg/moderation.html#moderation-api">Using
  /// the image and video moderation APIs</a>.
  ///
  /// Amazon Rekognition Video can moderate content in a video stored in an
  /// Amazon S3 bucket. Use <a>Video</a> to specify the bucket name and the
  /// filename of the video. <code>StartContentModeration</code> returns a job
  /// identifier (<code>JobId</code>) which you use to get the results of the
  /// analysis. When content analysis is finished, Amazon Rekognition Video
  /// publishes a completion status to the Amazon Simple Notification Service
  /// topic that you specify in <code>NotificationChannel</code>.
  ///
  /// To get the results of the content analysis, first check that the status
  /// value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so,
  /// call <a>GetContentModeration</a> and pass the job identifier
  /// (<code>JobId</code>) from the initial call to
  /// <code>StartContentModeration</code>.
  ///
  /// For more information, see Moderating content in the Amazon Rekognition
  /// Developer Guide.
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
  /// The video in which you want to detect inappropriate, unwanted, or
  /// offensive content. The video must be stored in an Amazon S3 bucket.
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
  /// the completion status of the content analysis to. The Amazon SNS topic
  /// must have a topic name that begins with <i>AmazonRekognition</i> if you
  /// are using the AmazonRekognitionServiceRole permissions policy to access
  /// the topic.
  Future<StartContentModerationResponse> startContentModeration({
    required Video video,
    String? clientRequestToken,
    String? jobTag,
    double? minConfidence,
    NotificationChannel? notificationChannel,
  }) async {
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
  /// For more information, see Detecting faces in a stored video in the Amazon
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
  /// to publish the completion status of the face detection operation. The
  /// Amazon SNS topic must have a topic name that begins with
  /// <i>AmazonRekognition</i> if you are using the AmazonRekognitionServiceRole
  /// permissions policy.
  Future<StartFaceDetectionResponse> startFaceDetection({
    required Video video,
    String? clientRequestToken,
    FaceAttributes? faceAttributes,
    String? jobTag,
    NotificationChannel? notificationChannel,
  }) async {
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
  /// <code>StartFaceSearch</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/rekognition/latest/dg/procedure-person-search-videos.html">Searching
  /// stored videos for faces</a>.
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
  /// to publish the completion status of the search. The Amazon SNS topic must
  /// have a topic name that begins with <i>AmazonRekognition</i> if you are
  /// using the AmazonRekognitionServiceRole permissions policy to access the
  /// topic.
  Future<StartFaceSearchResponse> startFaceSearch({
    required String collectionId,
    required Video video,
    String? clientRequestToken,
    double? faceMatchThreshold,
    String? jobTag,
    NotificationChannel? notificationChannel,
  }) async {
    _s.validateNumRange(
      'faceMatchThreshold',
      faceMatchThreshold,
      0,
      100,
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
  ///
  /// <i>Optional Parameters</i>
  ///
  /// <code>StartLabelDetection</code> has the <code>GENERAL_LABELS</code>
  /// Feature applied by default. This feature allows you to provide filtering
  /// criteria to the <code>Settings</code> parameter. You can filter with sets
  /// of individual labels or with label categories. You can specify inclusive
  /// filters, exclusive filters, or a combination of inclusive and exclusive
  /// filters. For more information on filtering, see <a
  /// href="https://docs.aws.amazon.com/rekognition/latest/dg/labels-detecting-labels-video.html">Detecting
  /// labels in a video</a>.
  ///
  /// You can specify <code>MinConfidence</code> to control the confidence
  /// threshold for the labels returned. The default is 50.
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
  /// Parameter [features] :
  /// The features to return after video analysis. You can specify that
  /// GENERAL_LABELS are returned.
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
  /// labels and bounding boxes (if detected) with confidence values greater
  /// than or equal to 50 percent.
  ///
  /// Parameter [notificationChannel] :
  /// The Amazon SNS topic ARN you want Amazon Rekognition Video to publish the
  /// completion status of the label detection operation to. The Amazon SNS
  /// topic must have a topic name that begins with <i>AmazonRekognition</i> if
  /// you are using the AmazonRekognitionServiceRole permissions policy.
  ///
  /// Parameter [settings] :
  /// The settings for a StartLabelDetection request.Contains the specified
  /// parameters for the label detection request of an asynchronous label
  /// analysis operation. Settings can include filters for GENERAL_LABELS.
  Future<StartLabelDetectionResponse> startLabelDetection({
    required Video video,
    String? clientRequestToken,
    List<LabelDetectionFeatureName>? features,
    String? jobTag,
    double? minConfidence,
    NotificationChannel? notificationChannel,
    LabelDetectionSettings? settings,
  }) async {
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
        if (features != null)
          'Features': features.map((e) => e.toValue()).toList(),
        if (jobTag != null) 'JobTag': jobTag,
        if (minConfidence != null) 'MinConfidence': minConfidence,
        if (notificationChannel != null)
          'NotificationChannel': notificationChannel,
        if (settings != null) 'Settings': settings,
      },
    );

    return StartLabelDetectionResponse.fromJson(jsonResponse.body);
  }

  /// Initiates a new media analysis job. Accepts a manifest file in an Amazon
  /// S3 bucket. The output is a manifest file and a summary of the manifest
  /// stored in the Amazon S3 bucket.
  ///
  /// May throw [InternalServerError].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidManifestException].
  /// May throw [InvalidS3ObjectException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceNotReadyException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [IdempotentParameterMismatchException].
  ///
  /// Parameter [input] :
  /// Input data to be analyzed by the job.
  ///
  /// Parameter [operationsConfig] :
  /// Configuration options for the media analysis job to be created.
  ///
  /// Parameter [outputConfig] :
  /// The Amazon S3 bucket location to store the results.
  ///
  /// Parameter [clientRequestToken] :
  /// Idempotency token used to prevent the accidental creation of duplicate
  /// versions. If you use the same token with multiple
  /// <code>StartMediaAnalysisJobRequest</code> requests, the same response is
  /// returned. Use <code>ClientRequestToken</code> to prevent the same request
  /// from being processed more than once.
  ///
  /// Parameter [jobName] :
  /// The name of the job. Does not have to be unique.
  ///
  /// Parameter [kmsKeyId] :
  /// The identifier of customer managed AWS KMS key (name or ARN). The key is
  /// used to encrypt images copied into the service. The key is also used to
  /// encrypt results and manifest files written to the output Amazon S3 bucket.
  Future<StartMediaAnalysisJobResponse> startMediaAnalysisJob({
    required MediaAnalysisInput input,
    required MediaAnalysisOperationsConfig operationsConfig,
    required MediaAnalysisOutputConfig outputConfig,
    String? clientRequestToken,
    String? jobName,
    String? kmsKeyId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.StartMediaAnalysisJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Input': input,
        'OperationsConfig': operationsConfig,
        'OutputConfig': outputConfig,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (jobName != null) 'JobName': jobName,
        if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      },
    );

    return StartMediaAnalysisJobResponse.fromJson(jsonResponse.body);
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
  /// completion status of the people detection operation to. The Amazon SNS
  /// topic must have a topic name that begins with <i>AmazonRekognition</i> if
  /// you are using the AmazonRekognitionServiceRole permissions policy.
  Future<StartPersonTrackingResponse> startPersonTracking({
    required Video video,
    String? clientRequestToken,
    String? jobTag,
    NotificationChannel? notificationChannel,
  }) async {
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

  /// <note>
  /// This operation applies only to Amazon Rekognition Custom Labels.
  /// </note>
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
  /// represents 1 hour of processing.
  ///
  /// Use a higher number to increase the TPS throughput of your model. You are
  /// charged for the number of inference units that you use.
  ///
  /// Parameter [projectVersionArn] :
  /// The Amazon Resource Name(ARN) of the model version that you want to start.
  ///
  /// Parameter [maxInferenceUnits] :
  /// The maximum number of inference units to use for auto-scaling the model.
  /// If you don't specify a value, Amazon Rekognition Custom Labels doesn't
  /// auto-scale the model.
  Future<StartProjectVersionResponse> startProjectVersion({
    required int minInferenceUnits,
    required String projectVersionArn,
    int? maxInferenceUnits,
  }) async {
    _s.validateNumRange(
      'minInferenceUnits',
      minInferenceUnits,
      1,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxInferenceUnits',
      maxInferenceUnits,
      1,
      1152921504606846976,
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
        if (maxInferenceUnits != null) 'MaxInferenceUnits': maxInferenceUnits,
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
  /// For more information, see Detecting video segments in stored video in the
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
  /// to publish the completion status of the segment detection operation. Note
  /// that the Amazon SNS topic must have a topic name that begins with
  /// <i>AmazonRekognition</i> if you are using the AmazonRekognitionServiceRole
  /// permissions policy to access the topic.
  Future<StartSegmentDetectionResponse> startSegmentDetection({
    required List<SegmentType> segmentTypes,
    required Video video,
    String? clientRequestToken,
    StartSegmentDetectionFilters? filters,
    String? jobTag,
    NotificationChannel? notificationChannel,
  }) async {
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
        'SegmentTypes': segmentTypes.map((e) => e.toValue()).toList(),
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
  /// If you are using a label detection stream processor to detect labels, you
  /// need to provide a <code>Start selector</code> and a <code>Stop
  /// selector</code> to determine the length of the stream processing time.
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
  ///
  /// Parameter [startSelector] :
  /// Specifies the starting point in the Kinesis stream to start processing.
  /// You can use the producer timestamp or the fragment number. If you use the
  /// producer timestamp, you must put the time in milliseconds. For more
  /// information about fragment numbers, see <a
  /// href="https://docs.aws.amazon.com/kinesisvideostreams/latest/dg/API_reader_Fragment.html">Fragment</a>.
  ///
  /// This is a required parameter for label detection stream processors and
  /// should not be used to start a face search stream processor.
  ///
  /// Parameter [stopSelector] :
  /// Specifies when to stop processing the stream. You can specify a maximum
  /// amount of time to process the video.
  ///
  /// This is a required parameter for label detection stream processors and
  /// should not be used to start a face search stream processor.
  Future<StartStreamProcessorResponse> startStreamProcessor({
    required String name,
    StreamProcessingStartSelector? startSelector,
    StreamProcessingStopSelector? stopSelector,
  }) async {
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
        if (startSelector != null) 'StartSelector': startSelector,
        if (stopSelector != null) 'StopSelector': stopSelector,
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
    required Video video,
    String? clientRequestToken,
    StartTextDetectionFilters? filters,
    String? jobTag,
    NotificationChannel? notificationChannel,
  }) async {
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

  /// <note>
  /// This operation applies only to Amazon Rekognition Custom Labels.
  /// </note>
  /// Stops a running model. The operation might take a while to complete. To
  /// check the current status, call <a>DescribeProjectVersions</a>. Only
  /// applies to Custom Labels projects.
  ///
  /// This operation requires permissions to perform the
  /// <code>rekognition:StopProjectVersion</code> action.
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
  /// The Amazon Resource Name (ARN) of the model version that you want to stop.
  ///
  /// This operation requires permissions to perform the
  /// <code>rekognition:StopProjectVersion</code> action.
  Future<StopProjectVersionResponse> stopProjectVersion({
    required String projectVersionArn,
  }) async {
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
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.StopStreamProcessor'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
      },
    );
  }

  /// Adds one or more key-value tags to an Amazon Rekognition collection,
  /// stream processor, or Custom Labels model. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// AWS Resources</a>.
  ///
  /// This operation requires permissions to perform the
  /// <code>rekognition:TagResource</code> action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [ProvisionedThroughputExceededException].
  ///
  /// Parameter [resourceArn] :
  /// Amazon Resource Name (ARN) of the model, collection, or stream processor
  /// that you want to assign the tags to.
  ///
  /// Parameter [tags] :
  /// The key-value tags to assign to the resource.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'Tags': tags,
      },
    );
  }

  /// Removes one or more tags from an Amazon Rekognition collection, stream
  /// processor, or Custom Labels model.
  ///
  /// This operation requires permissions to perform the
  /// <code>rekognition:UntagResource</code> action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [ProvisionedThroughputExceededException].
  ///
  /// Parameter [resourceArn] :
  /// Amazon Resource Name (ARN) of the model, collection, or stream processor
  /// that you want to remove the tags from.
  ///
  /// Parameter [tagKeys] :
  /// A list of the tags that you want to remove.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'TagKeys': tagKeys,
      },
    );
  }

  /// <note>
  /// This operation applies only to Amazon Rekognition Custom Labels.
  /// </note>
  /// Adds or updates one or more entries (images) in a dataset. An entry is a
  /// JSON Line which contains the information for a single image, including the
  /// image location, assigned labels, and object location bounding boxes. For
  /// more information, see Image-Level labels in manifest files and Object
  /// localization in manifest files in the <i>Amazon Rekognition Custom Labels
  /// Developer Guide</i>.
  ///
  /// If the <code>source-ref</code> field in the JSON line references an
  /// existing image, the existing image in the dataset is updated. If
  /// <code>source-ref</code> field doesn't reference an existing image, the
  /// image is added as a new image to the dataset.
  ///
  /// You specify the changes that you want to make in the <code>Changes</code>
  /// input parameter. There isn't a limit to the number JSON Lines that you can
  /// change, but the size of <code>Changes</code> must be less than 5MB.
  ///
  /// <code>UpdateDatasetEntries</code> returns immediatly, but the dataset
  /// update might take a while to complete. Use <a>DescribeDataset</a> to check
  /// the current status. The dataset updated successfully if the value of
  /// <code>Status</code> is <code>UPDATE_COMPLETE</code>.
  ///
  /// To check if any non-terminal errors occured, call
  /// <a>ListDatasetEntries</a> and check for the presence of
  /// <code>errors</code> lists in the JSON Lines.
  ///
  /// Dataset update fails if a terminal error occurs (<code>Status</code> =
  /// <code>UPDATE_FAILED</code>). Currently, you can't access the terminal
  /// error information from the Amazon Rekognition Custom Labels SDK.
  ///
  /// This operation requires permissions to perform the
  /// <code>rekognition:UpdateDatasetEntries</code> action.
  ///
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [InvalidParameterException].
  /// May throw [AccessDeniedException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [changes] :
  /// The changes that you want to make to the dataset.
  ///
  /// Parameter [datasetArn] :
  /// The Amazon Resource Name (ARN) of the dataset that you want to update.
  Future<void> updateDatasetEntries({
    required DatasetChanges changes,
    required String datasetArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.UpdateDatasetEntries'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Changes': changes,
        'DatasetArn': datasetArn,
      },
    );
  }

  /// Allows you to update a stream processor. You can change some settings and
  /// regions of interest and delete certain parameters.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerError].
  /// May throw [ThrottlingException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [name] :
  /// Name of the stream processor that you want to update.
  ///
  /// Parameter [dataSharingPreferenceForUpdate] :
  /// Shows whether you are sharing data with Rekognition to improve model
  /// performance. You can choose this option at the account level or on a
  /// per-stream basis. Note that if you opt out at the account level this
  /// setting is ignored on individual streams.
  ///
  /// Parameter [parametersToDelete] :
  /// A list of parameters you want to delete from the stream processor.
  ///
  /// Parameter [regionsOfInterestForUpdate] :
  /// Specifies locations in the frames where Amazon Rekognition checks for
  /// objects or people. This is an optional parameter for label detection
  /// stream processors.
  ///
  /// Parameter [settingsForUpdate] :
  /// The stream processor settings that you want to update. Label detection
  /// settings can be updated to detect different labels with a different
  /// minimum confidence.
  Future<void> updateStreamProcessor({
    required String name,
    StreamProcessorDataSharingPreference? dataSharingPreferenceForUpdate,
    List<StreamProcessorParameterToDelete>? parametersToDelete,
    List<RegionOfInterest>? regionsOfInterestForUpdate,
    StreamProcessorSettingsForUpdate? settingsForUpdate,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RekognitionService.UpdateStreamProcessor'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        if (dataSharingPreferenceForUpdate != null)
          'DataSharingPreferenceForUpdate': dataSharingPreferenceForUpdate,
        if (parametersToDelete != null)
          'ParametersToDelete':
              parametersToDelete.map((e) => e.toValue()).toList(),
        if (regionsOfInterestForUpdate != null)
          'RegionsOfInterestForUpdate': regionsOfInterestForUpdate,
        if (settingsForUpdate != null) 'SettingsForUpdate': settingsForUpdate,
      },
    );
  }
}

/// Structure containing the estimated age range, in years, for a face.
///
/// Amazon Rekognition estimates an age range for faces detected in the input
/// image. Estimated age ranges can overlap. A face of a 5-year-old might have
/// an estimated range of 4-6, while the face of a 6-year-old might have an
/// estimated range of 4-8.
class AgeRange {
  /// The highest estimated age.
  final int? high;

  /// The lowest estimated age.
  final int? low;

  AgeRange({
    this.high,
    this.low,
  });

  factory AgeRange.fromJson(Map<String, dynamic> json) {
    return AgeRange(
      high: json['High'] as int?,
      low: json['Low'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final high = this.high;
    final low = this.low;
    return {
      if (high != null) 'High': high,
      if (low != null) 'Low': low,
    };
  }
}

/// Assets are the images that you use to train and evaluate a model version.
/// Assets can also contain validation information that you use to debug a
/// failed model training.
class Asset {
  final GroundTruthManifest? groundTruthManifest;

  Asset({
    this.groundTruthManifest,
  });

  factory Asset.fromJson(Map<String, dynamic> json) {
    return Asset(
      groundTruthManifest: json['GroundTruthManifest'] != null
          ? GroundTruthManifest.fromJson(
              json['GroundTruthManifest'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final groundTruthManifest = this.groundTruthManifest;
    return {
      if (groundTruthManifest != null)
        'GroundTruthManifest': groundTruthManifest,
    };
  }
}

class AssociateFacesResponse {
  /// An array of AssociatedFace objects containing FaceIDs that have been
  /// successfully associated with the UserID. Returned if the AssociateFaces
  /// action is successful.
  final List<AssociatedFace>? associatedFaces;

  /// An array of UnsuccessfulAssociation objects containing FaceIDs that are not
  /// successfully associated along with the reasons. Returned if the
  /// AssociateFaces action is successful.
  final List<UnsuccessfulFaceAssociation>? unsuccessfulFaceAssociations;

  /// The status of an update made to a UserID. Reflects if the UserID has been
  /// updated for every requested change.
  final UserStatus? userStatus;

  AssociateFacesResponse({
    this.associatedFaces,
    this.unsuccessfulFaceAssociations,
    this.userStatus,
  });

  factory AssociateFacesResponse.fromJson(Map<String, dynamic> json) {
    return AssociateFacesResponse(
      associatedFaces: (json['AssociatedFaces'] as List?)
          ?.whereNotNull()
          .map((e) => AssociatedFace.fromJson(e as Map<String, dynamic>))
          .toList(),
      unsuccessfulFaceAssociations: (json['UnsuccessfulFaceAssociations']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              UnsuccessfulFaceAssociation.fromJson(e as Map<String, dynamic>))
          .toList(),
      userStatus: (json['UserStatus'] as String?)?.toUserStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final associatedFaces = this.associatedFaces;
    final unsuccessfulFaceAssociations = this.unsuccessfulFaceAssociations;
    final userStatus = this.userStatus;
    return {
      if (associatedFaces != null) 'AssociatedFaces': associatedFaces,
      if (unsuccessfulFaceAssociations != null)
        'UnsuccessfulFaceAssociations': unsuccessfulFaceAssociations,
      if (userStatus != null) 'UserStatus': userStatus.toValue(),
    };
  }
}

/// Provides face metadata for the faces that are associated to a specific
/// UserID.
class AssociatedFace {
  /// Unique identifier assigned to the face.
  final String? faceId;

  AssociatedFace({
    this.faceId,
  });

  factory AssociatedFace.fromJson(Map<String, dynamic> json) {
    return AssociatedFace(
      faceId: json['FaceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final faceId = this.faceId;
    return {
      if (faceId != null) 'FaceId': faceId,
    };
  }
}

enum Attribute {
  $default,
  all,
  ageRange,
  beard,
  emotions,
  eyeDirection,
  eyeglasses,
  eyesOpen,
  gender,
  mouthOpen,
  mustache,
  faceOccluded,
  smile,
  sunglasses,
}

extension AttributeValueExtension on Attribute {
  String toValue() {
    switch (this) {
      case Attribute.$default:
        return 'DEFAULT';
      case Attribute.all:
        return 'ALL';
      case Attribute.ageRange:
        return 'AGE_RANGE';
      case Attribute.beard:
        return 'BEARD';
      case Attribute.emotions:
        return 'EMOTIONS';
      case Attribute.eyeDirection:
        return 'EYE_DIRECTION';
      case Attribute.eyeglasses:
        return 'EYEGLASSES';
      case Attribute.eyesOpen:
        return 'EYES_OPEN';
      case Attribute.gender:
        return 'GENDER';
      case Attribute.mouthOpen:
        return 'MOUTH_OPEN';
      case Attribute.mustache:
        return 'MUSTACHE';
      case Attribute.faceOccluded:
        return 'FACE_OCCLUDED';
      case Attribute.smile:
        return 'SMILE';
      case Attribute.sunglasses:
        return 'SUNGLASSES';
    }
  }
}

extension AttributeFromString on String {
  Attribute toAttribute() {
    switch (this) {
      case 'DEFAULT':
        return Attribute.$default;
      case 'ALL':
        return Attribute.all;
      case 'AGE_RANGE':
        return Attribute.ageRange;
      case 'BEARD':
        return Attribute.beard;
      case 'EMOTIONS':
        return Attribute.emotions;
      case 'EYE_DIRECTION':
        return Attribute.eyeDirection;
      case 'EYEGLASSES':
        return Attribute.eyeglasses;
      case 'EYES_OPEN':
        return Attribute.eyesOpen;
      case 'GENDER':
        return Attribute.gender;
      case 'MOUTH_OPEN':
        return Attribute.mouthOpen;
      case 'MUSTACHE':
        return Attribute.mustache;
      case 'FACE_OCCLUDED':
        return Attribute.faceOccluded;
      case 'SMILE':
        return Attribute.smile;
      case 'SUNGLASSES':
        return Attribute.sunglasses;
    }
    throw Exception('$this is not known in enum Attribute');
  }
}

/// Metadata information about an audio stream. An array of
/// <code>AudioMetadata</code> objects for the audio streams found in a stored
/// video is returned by <a>GetSegmentDetection</a>.
class AudioMetadata {
  /// The audio codec used to encode or decode the audio stream.
  final String? codec;

  /// The duration of the audio stream in milliseconds.
  final int? durationMillis;

  /// The number of audio channels in the segment.
  final int? numberOfChannels;

  /// The sample rate for the audio stream.
  final int? sampleRate;

  AudioMetadata({
    this.codec,
    this.durationMillis,
    this.numberOfChannels,
    this.sampleRate,
  });

  factory AudioMetadata.fromJson(Map<String, dynamic> json) {
    return AudioMetadata(
      codec: json['Codec'] as String?,
      durationMillis: json['DurationMillis'] as int?,
      numberOfChannels: json['NumberOfChannels'] as int?,
      sampleRate: json['SampleRate'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final codec = this.codec;
    final durationMillis = this.durationMillis;
    final numberOfChannels = this.numberOfChannels;
    final sampleRate = this.sampleRate;
    return {
      if (codec != null) 'Codec': codec,
      if (durationMillis != null) 'DurationMillis': durationMillis,
      if (numberOfChannels != null) 'NumberOfChannels': numberOfChannels,
      if (sampleRate != null) 'SampleRate': sampleRate,
    };
  }
}

/// An image that is picked from the Face Liveness video and returned for audit
/// trail purposes, returned as Base64-encoded bytes.
class AuditImage {
  final BoundingBox? boundingBox;

  /// The Base64-encoded bytes representing an image selected from the Face
  /// Liveness video and returned for audit purposes.
  final Uint8List? bytes;
  final S3Object? s3Object;

  AuditImage({
    this.boundingBox,
    this.bytes,
    this.s3Object,
  });

  factory AuditImage.fromJson(Map<String, dynamic> json) {
    return AuditImage(
      boundingBox: json['BoundingBox'] != null
          ? BoundingBox.fromJson(json['BoundingBox'] as Map<String, dynamic>)
          : null,
      bytes: _s.decodeNullableUint8List(json['Bytes'] as String?),
      s3Object: json['S3Object'] != null
          ? S3Object.fromJson(json['S3Object'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final boundingBox = this.boundingBox;
    final bytes = this.bytes;
    final s3Object = this.s3Object;
    return {
      if (boundingBox != null) 'BoundingBox': boundingBox,
      if (bytes != null) 'Bytes': base64Encode(bytes),
      if (s3Object != null) 'S3Object': s3Object,
    };
  }
}

/// Indicates whether or not the face has a beard, and the confidence level in
/// the determination.
class Beard {
  /// Level of confidence in the determination.
  final double? confidence;

  /// Boolean value that indicates whether the face has beard or not.
  final bool? value;

  Beard({
    this.confidence,
    this.value,
  });

  factory Beard.fromJson(Map<String, dynamic> json) {
    return Beard(
      confidence: json['Confidence'] as double?,
      value: json['Value'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final confidence = this.confidence;
    final value = this.value;
    return {
      if (confidence != null) 'Confidence': confidence,
      if (value != null) 'Value': value,
    };
  }
}

/// A filter that allows you to control the black frame detection by specifying
/// the black levels and pixel coverage of black pixels in a frame. As videos
/// can come from multiple sources, formats, and time periods, they may contain
/// different standards and varying noise levels for black frames that need to
/// be accounted for. For more information, see <a>StartSegmentDetection</a>.
class BlackFrame {
  /// A threshold used to determine the maximum luminance value for a pixel to be
  /// considered black. In a full color range video, luminance values range from
  /// 0-255. A pixel value of 0 is pure black, and the most strict filter. The
  /// maximum black pixel value is computed as follows: max_black_pixel_value =
  /// minimum_luminance + MaxPixelThreshold *luminance_range.
  ///
  /// For example, for a full range video with BlackPixelThreshold = 0.1,
  /// max_black_pixel_value is 0 + 0.1 * (255-0) = 25.5.
  ///
  /// The default value of MaxPixelThreshold is 0.2, which maps to a
  /// max_black_pixel_value of 51 for a full range video. You can lower this
  /// threshold to be more strict on black levels.
  final double? maxPixelThreshold;

  /// The minimum percentage of pixels in a frame that need to have a luminance
  /// below the max_black_pixel_value for a frame to be considered a black frame.
  /// Luminance is calculated using the BT.709 matrix.
  ///
  /// The default value is 99, which means at least 99% of all pixels in the frame
  /// are black pixels as per the <code>MaxPixelThreshold</code> set. You can
  /// reduce this value to allow more noise on the black frame.
  final double? minCoveragePercentage;

  BlackFrame({
    this.maxPixelThreshold,
    this.minCoveragePercentage,
  });

  Map<String, dynamic> toJson() {
    final maxPixelThreshold = this.maxPixelThreshold;
    final minCoveragePercentage = this.minCoveragePercentage;
    return {
      if (maxPixelThreshold != null) 'MaxPixelThreshold': maxPixelThreshold,
      if (minCoveragePercentage != null)
        'MinCoveragePercentage': minCoveragePercentage,
    };
  }
}

enum BodyPart {
  face,
  head,
  leftHand,
  rightHand,
}

extension BodyPartValueExtension on BodyPart {
  String toValue() {
    switch (this) {
      case BodyPart.face:
        return 'FACE';
      case BodyPart.head:
        return 'HEAD';
      case BodyPart.leftHand:
        return 'LEFT_HAND';
      case BodyPart.rightHand:
        return 'RIGHT_HAND';
    }
  }
}

extension BodyPartFromString on String {
  BodyPart toBodyPart() {
    switch (this) {
      case 'FACE':
        return BodyPart.face;
      case 'HEAD':
        return BodyPart.head;
      case 'LEFT_HAND':
        return BodyPart.leftHand;
      case 'RIGHT_HAND':
        return BodyPart.rightHand;
    }
    throw Exception('$this is not known in enum BodyPart');
  }
}

/// Identifies the bounding box around the label, face, text, object of
/// interest, or personal protective equipment. The <code>left</code>
/// (x-coordinate) and <code>top</code> (y-coordinate) are coordinates
/// representing the top and left sides of the bounding box. Note that the
/// upper-left corner of the image is the origin (0,0).
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
class BoundingBox {
  /// Height of the bounding box as a ratio of the overall image height.
  final double? height;

  /// Left coordinate of the bounding box as a ratio of overall image width.
  final double? left;

  /// Top coordinate of the bounding box as a ratio of overall image height.
  final double? top;

  /// Width of the bounding box as a ratio of the overall image width.
  final double? width;

  BoundingBox({
    this.height,
    this.left,
    this.top,
    this.width,
  });

  factory BoundingBox.fromJson(Map<String, dynamic> json) {
    return BoundingBox(
      height: json['Height'] as double?,
      left: json['Left'] as double?,
      top: json['Top'] as double?,
      width: json['Width'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final height = this.height;
    final left = this.left;
    final top = this.top;
    final width = this.width;
    return {
      if (height != null) 'Height': height,
      if (left != null) 'Left': left,
      if (top != null) 'Top': top,
      if (width != null) 'Width': width,
    };
  }
}

/// Provides information about a celebrity recognized by the
/// <a>RecognizeCelebrities</a> operation.
class Celebrity {
  /// Provides information about the celebrity's face, such as its location on the
  /// image.
  final ComparedFace? face;

  /// A unique identifier for the celebrity.
  final String? id;
  final KnownGender? knownGender;

  /// The confidence, in percentage, that Amazon Rekognition has that the
  /// recognized face is the celebrity.
  final double? matchConfidence;

  /// The name of the celebrity.
  final String? name;

  /// An array of URLs pointing to additional information about the celebrity. If
  /// there is no additional information about the celebrity, this list is empty.
  final List<String>? urls;

  Celebrity({
    this.face,
    this.id,
    this.knownGender,
    this.matchConfidence,
    this.name,
    this.urls,
  });

  factory Celebrity.fromJson(Map<String, dynamic> json) {
    return Celebrity(
      face: json['Face'] != null
          ? ComparedFace.fromJson(json['Face'] as Map<String, dynamic>)
          : null,
      id: json['Id'] as String?,
      knownGender: json['KnownGender'] != null
          ? KnownGender.fromJson(json['KnownGender'] as Map<String, dynamic>)
          : null,
      matchConfidence: json['MatchConfidence'] as double?,
      name: json['Name'] as String?,
      urls: (json['Urls'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final face = this.face;
    final id = this.id;
    final knownGender = this.knownGender;
    final matchConfidence = this.matchConfidence;
    final name = this.name;
    final urls = this.urls;
    return {
      if (face != null) 'Face': face,
      if (id != null) 'Id': id,
      if (knownGender != null) 'KnownGender': knownGender,
      if (matchConfidence != null) 'MatchConfidence': matchConfidence,
      if (name != null) 'Name': name,
      if (urls != null) 'Urls': urls,
    };
  }
}

/// Information about a recognized celebrity.
class CelebrityDetail {
  /// Bounding box around the body of a celebrity.
  final BoundingBox? boundingBox;

  /// The confidence, in percentage, that Amazon Rekognition has that the
  /// recognized face is the celebrity.
  final double? confidence;

  /// Face details for the recognized celebrity.
  final FaceDetail? face;

  /// The unique identifier for the celebrity.
  final String? id;

  /// Retrieves the known gender for the celebrity.
  final KnownGender? knownGender;

  /// The name of the celebrity.
  final String? name;

  /// An array of URLs pointing to additional celebrity information.
  final List<String>? urls;

  CelebrityDetail({
    this.boundingBox,
    this.confidence,
    this.face,
    this.id,
    this.knownGender,
    this.name,
    this.urls,
  });

  factory CelebrityDetail.fromJson(Map<String, dynamic> json) {
    return CelebrityDetail(
      boundingBox: json['BoundingBox'] != null
          ? BoundingBox.fromJson(json['BoundingBox'] as Map<String, dynamic>)
          : null,
      confidence: json['Confidence'] as double?,
      face: json['Face'] != null
          ? FaceDetail.fromJson(json['Face'] as Map<String, dynamic>)
          : null,
      id: json['Id'] as String?,
      knownGender: json['KnownGender'] != null
          ? KnownGender.fromJson(json['KnownGender'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      urls: (json['Urls'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final boundingBox = this.boundingBox;
    final confidence = this.confidence;
    final face = this.face;
    final id = this.id;
    final knownGender = this.knownGender;
    final name = this.name;
    final urls = this.urls;
    return {
      if (boundingBox != null) 'BoundingBox': boundingBox,
      if (confidence != null) 'Confidence': confidence,
      if (face != null) 'Face': face,
      if (id != null) 'Id': id,
      if (knownGender != null) 'KnownGender': knownGender,
      if (name != null) 'Name': name,
      if (urls != null) 'Urls': urls,
    };
  }
}

/// Information about a detected celebrity and the time the celebrity was
/// detected in a stored video. For more information, see
/// GetCelebrityRecognition in the Amazon Rekognition Developer Guide.
class CelebrityRecognition {
  /// Information about a recognized celebrity.
  final CelebrityDetail? celebrity;

  /// The time, in milliseconds from the start of the video, that the celebrity
  /// was recognized. Note that <code>Timestamp</code> is not guaranteed to be
  /// accurate to the individual frame where the celebrity first appears.
  final int? timestamp;

  CelebrityRecognition({
    this.celebrity,
    this.timestamp,
  });

  factory CelebrityRecognition.fromJson(Map<String, dynamic> json) {
    return CelebrityRecognition(
      celebrity: json['Celebrity'] != null
          ? CelebrityDetail.fromJson(json['Celebrity'] as Map<String, dynamic>)
          : null,
      timestamp: json['Timestamp'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final celebrity = this.celebrity;
    final timestamp = this.timestamp;
    return {
      if (celebrity != null) 'Celebrity': celebrity,
      if (timestamp != null) 'Timestamp': timestamp,
    };
  }
}

enum CelebrityRecognitionSortBy {
  id,
  timestamp,
}

extension CelebrityRecognitionSortByValueExtension
    on CelebrityRecognitionSortBy {
  String toValue() {
    switch (this) {
      case CelebrityRecognitionSortBy.id:
        return 'ID';
      case CelebrityRecognitionSortBy.timestamp:
        return 'TIMESTAMP';
    }
  }
}

extension CelebrityRecognitionSortByFromString on String {
  CelebrityRecognitionSortBy toCelebrityRecognitionSortBy() {
    switch (this) {
      case 'ID':
        return CelebrityRecognitionSortBy.id;
      case 'TIMESTAMP':
        return CelebrityRecognitionSortBy.timestamp;
    }
    throw Exception('$this is not known in enum CelebrityRecognitionSortBy');
  }
}

/// Provides information about a face in a target image that matches the source
/// image face analyzed by <code>CompareFaces</code>. The <code>Face</code>
/// property contains the bounding box of the face in the target image. The
/// <code>Similarity</code> property is the confidence that the source image
/// face matches the face in the bounding box.
class CompareFacesMatch {
  /// Provides face metadata (bounding box and confidence that the bounding box
  /// actually contains a face).
  final ComparedFace? face;

  /// Level of confidence that the faces match.
  final double? similarity;

  CompareFacesMatch({
    this.face,
    this.similarity,
  });

  factory CompareFacesMatch.fromJson(Map<String, dynamic> json) {
    return CompareFacesMatch(
      face: json['Face'] != null
          ? ComparedFace.fromJson(json['Face'] as Map<String, dynamic>)
          : null,
      similarity: json['Similarity'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final face = this.face;
    final similarity = this.similarity;
    return {
      if (face != null) 'Face': face,
      if (similarity != null) 'Similarity': similarity,
    };
  }
}

class CompareFacesResponse {
  /// An array of faces in the target image that match the source image face. Each
  /// <code>CompareFacesMatch</code> object provides the bounding box, the
  /// confidence level that the bounding box contains a face, and the similarity
  /// score for the face in the bounding box and the face in the source image.
  final List<CompareFacesMatch>? faceMatches;

  /// The face in the source image that was used for comparison.
  final ComparedSourceImageFace? sourceImageFace;

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
  final OrientationCorrection? sourceImageOrientationCorrection;

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
  final OrientationCorrection? targetImageOrientationCorrection;

  /// An array of faces in the target image that did not match the source image
  /// face.
  final List<ComparedFace>? unmatchedFaces;

  CompareFacesResponse({
    this.faceMatches,
    this.sourceImageFace,
    this.sourceImageOrientationCorrection,
    this.targetImageOrientationCorrection,
    this.unmatchedFaces,
  });

  factory CompareFacesResponse.fromJson(Map<String, dynamic> json) {
    return CompareFacesResponse(
      faceMatches: (json['FaceMatches'] as List?)
          ?.whereNotNull()
          .map((e) => CompareFacesMatch.fromJson(e as Map<String, dynamic>))
          .toList(),
      sourceImageFace: json['SourceImageFace'] != null
          ? ComparedSourceImageFace.fromJson(
              json['SourceImageFace'] as Map<String, dynamic>)
          : null,
      sourceImageOrientationCorrection:
          (json['SourceImageOrientationCorrection'] as String?)
              ?.toOrientationCorrection(),
      targetImageOrientationCorrection:
          (json['TargetImageOrientationCorrection'] as String?)
              ?.toOrientationCorrection(),
      unmatchedFaces: (json['UnmatchedFaces'] as List?)
          ?.whereNotNull()
          .map((e) => ComparedFace.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final faceMatches = this.faceMatches;
    final sourceImageFace = this.sourceImageFace;
    final sourceImageOrientationCorrection =
        this.sourceImageOrientationCorrection;
    final targetImageOrientationCorrection =
        this.targetImageOrientationCorrection;
    final unmatchedFaces = this.unmatchedFaces;
    return {
      if (faceMatches != null) 'FaceMatches': faceMatches,
      if (sourceImageFace != null) 'SourceImageFace': sourceImageFace,
      if (sourceImageOrientationCorrection != null)
        'SourceImageOrientationCorrection':
            sourceImageOrientationCorrection.toValue(),
      if (targetImageOrientationCorrection != null)
        'TargetImageOrientationCorrection':
            targetImageOrientationCorrection.toValue(),
      if (unmatchedFaces != null) 'UnmatchedFaces': unmatchedFaces,
    };
  }
}

/// Provides face metadata for target image faces that are analyzed by
/// <code>CompareFaces</code> and <code>RecognizeCelebrities</code>.
class ComparedFace {
  /// Bounding box of the face.
  final BoundingBox? boundingBox;

  /// Level of confidence that what the bounding box contains is a face.
  final double? confidence;

  /// The emotions that appear to be expressed on the face, and the confidence
  /// level in the determination. Valid values include "Happy", "Sad", "Angry",
  /// "Confused", "Disgusted", "Surprised", "Calm", "Unknown", and "Fear".
  final List<Emotion>? emotions;

  /// An array of facial landmarks.
  final List<Landmark>? landmarks;

  /// Indicates the pose of the face as determined by its pitch, roll, and yaw.
  final Pose? pose;

  /// Identifies face image brightness and sharpness.
  final ImageQuality? quality;

  /// Indicates whether or not the face is smiling, and the confidence level in
  /// the determination.
  final Smile? smile;

  ComparedFace({
    this.boundingBox,
    this.confidence,
    this.emotions,
    this.landmarks,
    this.pose,
    this.quality,
    this.smile,
  });

  factory ComparedFace.fromJson(Map<String, dynamic> json) {
    return ComparedFace(
      boundingBox: json['BoundingBox'] != null
          ? BoundingBox.fromJson(json['BoundingBox'] as Map<String, dynamic>)
          : null,
      confidence: json['Confidence'] as double?,
      emotions: (json['Emotions'] as List?)
          ?.whereNotNull()
          .map((e) => Emotion.fromJson(e as Map<String, dynamic>))
          .toList(),
      landmarks: (json['Landmarks'] as List?)
          ?.whereNotNull()
          .map((e) => Landmark.fromJson(e as Map<String, dynamic>))
          .toList(),
      pose: json['Pose'] != null
          ? Pose.fromJson(json['Pose'] as Map<String, dynamic>)
          : null,
      quality: json['Quality'] != null
          ? ImageQuality.fromJson(json['Quality'] as Map<String, dynamic>)
          : null,
      smile: json['Smile'] != null
          ? Smile.fromJson(json['Smile'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final boundingBox = this.boundingBox;
    final confidence = this.confidence;
    final emotions = this.emotions;
    final landmarks = this.landmarks;
    final pose = this.pose;
    final quality = this.quality;
    final smile = this.smile;
    return {
      if (boundingBox != null) 'BoundingBox': boundingBox,
      if (confidence != null) 'Confidence': confidence,
      if (emotions != null) 'Emotions': emotions,
      if (landmarks != null) 'Landmarks': landmarks,
      if (pose != null) 'Pose': pose,
      if (quality != null) 'Quality': quality,
      if (smile != null) 'Smile': smile,
    };
  }
}

/// Type that describes the face Amazon Rekognition chose to compare with the
/// faces in the target. This contains a bounding box for the selected face and
/// confidence level that the bounding box contains a face. Note that Amazon
/// Rekognition selects the largest face in the source image for this
/// comparison.
class ComparedSourceImageFace {
  /// Bounding box of the face.
  final BoundingBox? boundingBox;

  /// Confidence level that the selected bounding box contains a face.
  final double? confidence;

  ComparedSourceImageFace({
    this.boundingBox,
    this.confidence,
  });

  factory ComparedSourceImageFace.fromJson(Map<String, dynamic> json) {
    return ComparedSourceImageFace(
      boundingBox: json['BoundingBox'] != null
          ? BoundingBox.fromJson(json['BoundingBox'] as Map<String, dynamic>)
          : null,
      confidence: json['Confidence'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final boundingBox = this.boundingBox;
    final confidence = this.confidence;
    return {
      if (boundingBox != null) 'BoundingBox': boundingBox,
      if (confidence != null) 'Confidence': confidence,
    };
  }
}

/// Label detection settings to use on a streaming video. Defining the settings
/// is required in the request parameter for <a>CreateStreamProcessor</a>.
/// Including this setting in the <code>CreateStreamProcessor</code> request
/// enables you to use the stream processor for label detection. You can then
/// select what you want the stream processor to detect, such as people or pets.
/// When the stream processor has started, one notification is sent for each
/// object class specified. For example, if packages and pets are selected, one
/// SNS notification is published the first time a package is detected and one
/// SNS notification is published the first time a pet is detected, as well as
/// an end-of-session summary.
class ConnectedHomeSettings {
  /// Specifies what you want to detect in the video, such as people, packages, or
  /// pets. The current valid labels you can include in this list are: "PERSON",
  /// "PET", "PACKAGE", and "ALL".
  final List<String> labels;

  /// The minimum confidence required to label an object in the video.
  final double? minConfidence;

  ConnectedHomeSettings({
    required this.labels,
    this.minConfidence,
  });

  factory ConnectedHomeSettings.fromJson(Map<String, dynamic> json) {
    return ConnectedHomeSettings(
      labels: (json['Labels'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      minConfidence: json['MinConfidence'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final labels = this.labels;
    final minConfidence = this.minConfidence;
    return {
      'Labels': labels,
      if (minConfidence != null) 'MinConfidence': minConfidence,
    };
  }
}

/// The label detection settings you want to use in your stream processor. This
/// includes the labels you want the stream processor to detect and the minimum
/// confidence level allowed to label objects.
class ConnectedHomeSettingsForUpdate {
  /// Specifies what you want to detect in the video, such as people, packages, or
  /// pets. The current valid labels you can include in this list are: "PERSON",
  /// "PET", "PACKAGE", and "ALL".
  final List<String>? labels;

  /// The minimum confidence required to label an object in the video.
  final double? minConfidence;

  ConnectedHomeSettingsForUpdate({
    this.labels,
    this.minConfidence,
  });

  Map<String, dynamic> toJson() {
    final labels = this.labels;
    final minConfidence = this.minConfidence;
    return {
      if (labels != null) 'Labels': labels,
      if (minConfidence != null) 'MinConfidence': minConfidence,
    };
  }
}

enum ContentClassifier {
  freeOfPersonallyIdentifiableInformation,
  freeOfAdultContent,
}

extension ContentClassifierValueExtension on ContentClassifier {
  String toValue() {
    switch (this) {
      case ContentClassifier.freeOfPersonallyIdentifiableInformation:
        return 'FreeOfPersonallyIdentifiableInformation';
      case ContentClassifier.freeOfAdultContent:
        return 'FreeOfAdultContent';
    }
  }
}

extension ContentClassifierFromString on String {
  ContentClassifier toContentClassifier() {
    switch (this) {
      case 'FreeOfPersonallyIdentifiableInformation':
        return ContentClassifier.freeOfPersonallyIdentifiableInformation;
      case 'FreeOfAdultContent':
        return ContentClassifier.freeOfAdultContent;
    }
    throw Exception('$this is not known in enum ContentClassifier');
  }
}

enum ContentModerationAggregateBy {
  timestamps,
  segments,
}

extension ContentModerationAggregateByValueExtension
    on ContentModerationAggregateBy {
  String toValue() {
    switch (this) {
      case ContentModerationAggregateBy.timestamps:
        return 'TIMESTAMPS';
      case ContentModerationAggregateBy.segments:
        return 'SEGMENTS';
    }
  }
}

extension ContentModerationAggregateByFromString on String {
  ContentModerationAggregateBy toContentModerationAggregateBy() {
    switch (this) {
      case 'TIMESTAMPS':
        return ContentModerationAggregateBy.timestamps;
      case 'SEGMENTS':
        return ContentModerationAggregateBy.segments;
    }
    throw Exception('$this is not known in enum ContentModerationAggregateBy');
  }
}

/// Information about an inappropriate, unwanted, or offensive content label
/// detection in a stored video.
class ContentModerationDetection {
  /// A list of predicted results for the type of content an image contains. For
  /// example, the image content might be from animation, sports, or a video game.
  final List<ContentType>? contentTypes;

  /// The time duration of a segment in milliseconds, I.e. time elapsed from
  /// StartTimestampMillis to EndTimestampMillis.
  final int? durationMillis;

  /// The time in milliseconds defining the end of the timeline segment containing
  /// a continuously detected moderation label.
  final int? endTimestampMillis;

  /// The content moderation label detected by in the stored video.
  final ModerationLabel? moderationLabel;

  /// The time in milliseconds defining the start of the timeline segment
  /// containing a continuously detected moderation label.
  final int? startTimestampMillis;

  /// Time, in milliseconds from the beginning of the video, that the content
  /// moderation label was detected. Note that <code>Timestamp</code> is not
  /// guaranteed to be accurate to the individual frame where the moderated
  /// content first appears.
  final int? timestamp;

  ContentModerationDetection({
    this.contentTypes,
    this.durationMillis,
    this.endTimestampMillis,
    this.moderationLabel,
    this.startTimestampMillis,
    this.timestamp,
  });

  factory ContentModerationDetection.fromJson(Map<String, dynamic> json) {
    return ContentModerationDetection(
      contentTypes: (json['ContentTypes'] as List?)
          ?.whereNotNull()
          .map((e) => ContentType.fromJson(e as Map<String, dynamic>))
          .toList(),
      durationMillis: json['DurationMillis'] as int?,
      endTimestampMillis: json['EndTimestampMillis'] as int?,
      moderationLabel: json['ModerationLabel'] != null
          ? ModerationLabel.fromJson(
              json['ModerationLabel'] as Map<String, dynamic>)
          : null,
      startTimestampMillis: json['StartTimestampMillis'] as int?,
      timestamp: json['Timestamp'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final contentTypes = this.contentTypes;
    final durationMillis = this.durationMillis;
    final endTimestampMillis = this.endTimestampMillis;
    final moderationLabel = this.moderationLabel;
    final startTimestampMillis = this.startTimestampMillis;
    final timestamp = this.timestamp;
    return {
      if (contentTypes != null) 'ContentTypes': contentTypes,
      if (durationMillis != null) 'DurationMillis': durationMillis,
      if (endTimestampMillis != null) 'EndTimestampMillis': endTimestampMillis,
      if (moderationLabel != null) 'ModerationLabel': moderationLabel,
      if (startTimestampMillis != null)
        'StartTimestampMillis': startTimestampMillis,
      if (timestamp != null) 'Timestamp': timestamp,
    };
  }
}

enum ContentModerationSortBy {
  name,
  timestamp,
}

extension ContentModerationSortByValueExtension on ContentModerationSortBy {
  String toValue() {
    switch (this) {
      case ContentModerationSortBy.name:
        return 'NAME';
      case ContentModerationSortBy.timestamp:
        return 'TIMESTAMP';
    }
  }
}

extension ContentModerationSortByFromString on String {
  ContentModerationSortBy toContentModerationSortBy() {
    switch (this) {
      case 'NAME':
        return ContentModerationSortBy.name;
      case 'TIMESTAMP':
        return ContentModerationSortBy.timestamp;
    }
    throw Exception('$this is not known in enum ContentModerationSortBy');
  }
}

/// Contains information regarding the confidence and name of a detected content
/// type.
class ContentType {
  /// The confidence level of the label given
  final double? confidence;

  /// The name of the label
  final String? name;

  ContentType({
    this.confidence,
    this.name,
  });

  factory ContentType.fromJson(Map<String, dynamic> json) {
    return ContentType(
      confidence: json['Confidence'] as double?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final confidence = this.confidence;
    final name = this.name;
    return {
      if (confidence != null) 'Confidence': confidence,
      if (name != null) 'Name': name,
    };
  }
}

class CopyProjectVersionResponse {
  /// The ARN of the copied model version in the destination project.
  final String? projectVersionArn;

  CopyProjectVersionResponse({
    this.projectVersionArn,
  });

  factory CopyProjectVersionResponse.fromJson(Map<String, dynamic> json) {
    return CopyProjectVersionResponse(
      projectVersionArn: json['ProjectVersionArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final projectVersionArn = this.projectVersionArn;
    return {
      if (projectVersionArn != null) 'ProjectVersionArn': projectVersionArn,
    };
  }
}

/// Information about an item of Personal Protective Equipment covering a
/// corresponding body part. For more information, see
/// <a>DetectProtectiveEquipment</a>.
class CoversBodyPart {
  /// The confidence that Amazon Rekognition has in the value of
  /// <code>Value</code>.
  final double? confidence;

  /// True if the PPE covers the corresponding body part, otherwise false.
  final bool? value;

  CoversBodyPart({
    this.confidence,
    this.value,
  });

  factory CoversBodyPart.fromJson(Map<String, dynamic> json) {
    return CoversBodyPart(
      confidence: json['Confidence'] as double?,
      value: json['Value'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final confidence = this.confidence;
    final value = this.value;
    return {
      if (confidence != null) 'Confidence': confidence,
      if (value != null) 'Value': value,
    };
  }
}

class CreateCollectionResponse {
  /// Amazon Resource Name (ARN) of the collection. You can use this to manage
  /// permissions on your resources.
  final String? collectionArn;

  /// Version number of the face detection model associated with the collection
  /// you are creating.
  final String? faceModelVersion;

  /// HTTP status code indicating the result of the operation.
  final int? statusCode;

  CreateCollectionResponse({
    this.collectionArn,
    this.faceModelVersion,
    this.statusCode,
  });

  factory CreateCollectionResponse.fromJson(Map<String, dynamic> json) {
    return CreateCollectionResponse(
      collectionArn: json['CollectionArn'] as String?,
      faceModelVersion: json['FaceModelVersion'] as String?,
      statusCode: json['StatusCode'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final collectionArn = this.collectionArn;
    final faceModelVersion = this.faceModelVersion;
    final statusCode = this.statusCode;
    return {
      if (collectionArn != null) 'CollectionArn': collectionArn,
      if (faceModelVersion != null) 'FaceModelVersion': faceModelVersion,
      if (statusCode != null) 'StatusCode': statusCode,
    };
  }
}

class CreateDatasetResponse {
  /// The ARN of the created Amazon Rekognition Custom Labels dataset.
  final String? datasetArn;

  CreateDatasetResponse({
    this.datasetArn,
  });

  factory CreateDatasetResponse.fromJson(Map<String, dynamic> json) {
    return CreateDatasetResponse(
      datasetArn: json['DatasetArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final datasetArn = this.datasetArn;
    return {
      if (datasetArn != null) 'DatasetArn': datasetArn,
    };
  }
}

/// A session settings object. It contains settings for the operation to be
/// performed. It accepts arguments for OutputConfig and AuditImagesLimit.
class CreateFaceLivenessSessionRequestSettings {
  /// Number of audit images to be returned back. Takes an integer between 0-4.
  /// Any integer less than 0 will return 0, any integer above 4 will return 4
  /// images in the response. By default, it is set to 0. The limit is best effort
  /// and is based on the actual duration of the selfie-video.
  final int? auditImagesLimit;

  /// Can specify the location of an Amazon S3 bucket, where reference and audit
  /// images will be stored. Note that the Amazon S3 bucket must be located in the
  /// caller's AWS account and in the same region as the Face Liveness end-point.
  /// Additionally, the Amazon S3 object keys are auto-generated by the Face
  /// Liveness system. Requires that the caller has the <code>s3:PutObject</code>
  /// permission on the Amazon S3 bucket.
  final LivenessOutputConfig? outputConfig;

  CreateFaceLivenessSessionRequestSettings({
    this.auditImagesLimit,
    this.outputConfig,
  });

  Map<String, dynamic> toJson() {
    final auditImagesLimit = this.auditImagesLimit;
    final outputConfig = this.outputConfig;
    return {
      if (auditImagesLimit != null) 'AuditImagesLimit': auditImagesLimit,
      if (outputConfig != null) 'OutputConfig': outputConfig,
    };
  }
}

class CreateFaceLivenessSessionResponse {
  /// A unique 128-bit UUID identifying a Face Liveness session. A new sessionID
  /// must be used for every Face Liveness check. If a given sessionID is used for
  /// subsequent Face Liveness checks, the checks will fail. Additionally, a
  /// SessionId expires 3 minutes after it's sent, making all Liveness data
  /// associated with the session (e.g., sessionID, reference image, audit images,
  /// etc.) unavailable.
  final String sessionId;

  CreateFaceLivenessSessionResponse({
    required this.sessionId,
  });

  factory CreateFaceLivenessSessionResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateFaceLivenessSessionResponse(
      sessionId: json['SessionId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final sessionId = this.sessionId;
    return {
      'SessionId': sessionId,
    };
  }
}

class CreateProjectResponse {
  /// The Amazon Resource Name (ARN) of the new project. You can use the ARN to
  /// configure IAM access to the project.
  final String? projectArn;

  CreateProjectResponse({
    this.projectArn,
  });

  factory CreateProjectResponse.fromJson(Map<String, dynamic> json) {
    return CreateProjectResponse(
      projectArn: json['ProjectArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final projectArn = this.projectArn;
    return {
      if (projectArn != null) 'ProjectArn': projectArn,
    };
  }
}

class CreateProjectVersionResponse {
  /// The ARN of the model or the project version that was created. Use
  /// <code>DescribeProjectVersion</code> to get the current status of the
  /// training operation.
  final String? projectVersionArn;

  CreateProjectVersionResponse({
    this.projectVersionArn,
  });

  factory CreateProjectVersionResponse.fromJson(Map<String, dynamic> json) {
    return CreateProjectVersionResponse(
      projectVersionArn: json['ProjectVersionArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final projectVersionArn = this.projectVersionArn;
    return {
      if (projectVersionArn != null) 'ProjectVersionArn': projectVersionArn,
    };
  }
}

class CreateStreamProcessorResponse {
  /// Amazon Resource Number for the newly created stream processor.
  final String? streamProcessorArn;

  CreateStreamProcessorResponse({
    this.streamProcessorArn,
  });

  factory CreateStreamProcessorResponse.fromJson(Map<String, dynamic> json) {
    return CreateStreamProcessorResponse(
      streamProcessorArn: json['StreamProcessorArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final streamProcessorArn = this.streamProcessorArn;
    return {
      if (streamProcessorArn != null) 'StreamProcessorArn': streamProcessorArn,
    };
  }
}

class CreateUserResponse {
  CreateUserResponse();

  factory CreateUserResponse.fromJson(Map<String, dynamic> _) {
    return CreateUserResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A custom label detected in an image by a call to <a>DetectCustomLabels</a>.
class CustomLabel {
  /// The confidence that the model has in the detection of the custom label. The
  /// range is 0-100. A higher value indicates a higher confidence.
  final double? confidence;

  /// The location of the detected object on the image that corresponds to the
  /// custom label. Includes an axis aligned coarse bounding box surrounding the
  /// object and a finer grain polygon for more accurate spatial information.
  final Geometry? geometry;

  /// The name of the custom label.
  final String? name;

  CustomLabel({
    this.confidence,
    this.geometry,
    this.name,
  });

  factory CustomLabel.fromJson(Map<String, dynamic> json) {
    return CustomLabel(
      confidence: json['Confidence'] as double?,
      geometry: json['Geometry'] != null
          ? Geometry.fromJson(json['Geometry'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final confidence = this.confidence;
    final geometry = this.geometry;
    final name = this.name;
    return {
      if (confidence != null) 'Confidence': confidence,
      if (geometry != null) 'Geometry': geometry,
      if (name != null) 'Name': name,
    };
  }
}

enum CustomizationFeature {
  contentModeration,
  customLabels,
}

extension CustomizationFeatureValueExtension on CustomizationFeature {
  String toValue() {
    switch (this) {
      case CustomizationFeature.contentModeration:
        return 'CONTENT_MODERATION';
      case CustomizationFeature.customLabels:
        return 'CUSTOM_LABELS';
    }
  }
}

extension CustomizationFeatureFromString on String {
  CustomizationFeature toCustomizationFeature() {
    switch (this) {
      case 'CONTENT_MODERATION':
        return CustomizationFeature.contentModeration;
      case 'CUSTOM_LABELS':
        return CustomizationFeature.customLabels;
    }
    throw Exception('$this is not known in enum CustomizationFeature');
  }
}

/// Feature specific configuration for the training job. Configuration provided
/// for the job must match the feature type parameter associated with project.
/// If configuration and feature type do not match an InvalidParameterException
/// is returned.
class CustomizationFeatureConfig {
  /// Configuration options for Custom Moderation training.
  final CustomizationFeatureContentModerationConfig? contentModeration;

  CustomizationFeatureConfig({
    this.contentModeration,
  });

  factory CustomizationFeatureConfig.fromJson(Map<String, dynamic> json) {
    return CustomizationFeatureConfig(
      contentModeration: json['ContentModeration'] != null
          ? CustomizationFeatureContentModerationConfig.fromJson(
              json['ContentModeration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final contentModeration = this.contentModeration;
    return {
      if (contentModeration != null) 'ContentModeration': contentModeration,
    };
  }
}

/// Configuration options for Content Moderation training.
class CustomizationFeatureContentModerationConfig {
  /// The confidence level you plan to use to identify if unsafe content is
  /// present during inference.
  final double? confidenceThreshold;

  CustomizationFeatureContentModerationConfig({
    this.confidenceThreshold,
  });

  factory CustomizationFeatureContentModerationConfig.fromJson(
      Map<String, dynamic> json) {
    return CustomizationFeatureContentModerationConfig(
      confidenceThreshold: json['ConfidenceThreshold'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final confidenceThreshold = this.confidenceThreshold;
    return {
      if (confidenceThreshold != null)
        'ConfidenceThreshold': confidenceThreshold,
    };
  }
}

/// Describes updates or additions to a dataset. A Single update or addition is
/// an entry (JSON Line) that provides information about a single image. To
/// update an existing entry, you match the <code>source-ref</code> field of the
/// update entry with the <code>source-ref</code> filed of the entry that you
/// want to update. If the <code>source-ref</code> field doesn't match an
/// existing entry, the entry is added to dataset as a new entry.
class DatasetChanges {
  /// A Base64-encoded binary data object containing one or JSON lines that either
  /// update the dataset or are additions to the dataset. You change a dataset by
  /// calling <a>UpdateDatasetEntries</a>. If you are using an AWS SDK to call
  /// <code>UpdateDatasetEntries</code>, you don't need to encode
  /// <code>Changes</code> as the SDK encodes the data for you.
  ///
  /// For example JSON lines, see Image-Level labels in manifest files and and
  /// Object localization in manifest files in the <i>Amazon Rekognition Custom
  /// Labels Developer Guide</i>.
  final Uint8List groundTruth;

  DatasetChanges({
    required this.groundTruth,
  });

  Map<String, dynamic> toJson() {
    final groundTruth = this.groundTruth;
    return {
      'GroundTruth': base64Encode(groundTruth),
    };
  }
}

/// A description for a dataset. For more information, see
/// <a>DescribeDataset</a>.
///
/// The status fields <code>Status</code>, <code>StatusMessage</code>, and
/// <code>StatusMessageCode</code> reflect the last operation on the dataset.
class DatasetDescription {
  /// The Unix timestamp for the time and date that the dataset was created.
  final DateTime? creationTimestamp;

  /// The status message code for the dataset.
  final DatasetStats? datasetStats;

  /// The Unix timestamp for the date and time that the dataset was last updated.
  final DateTime? lastUpdatedTimestamp;

  /// The status of the dataset.
  final DatasetStatus? status;

  /// The status message for the dataset.
  final String? statusMessage;

  /// The status message code for the dataset operation. If a service error
  /// occurs, try the API call again later. If a client error occurs, check the
  /// input parameters to the dataset API call that failed.
  final DatasetStatusMessageCode? statusMessageCode;

  DatasetDescription({
    this.creationTimestamp,
    this.datasetStats,
    this.lastUpdatedTimestamp,
    this.status,
    this.statusMessage,
    this.statusMessageCode,
  });

  factory DatasetDescription.fromJson(Map<String, dynamic> json) {
    return DatasetDescription(
      creationTimestamp: timeStampFromJson(json['CreationTimestamp']),
      datasetStats: json['DatasetStats'] != null
          ? DatasetStats.fromJson(json['DatasetStats'] as Map<String, dynamic>)
          : null,
      lastUpdatedTimestamp: timeStampFromJson(json['LastUpdatedTimestamp']),
      status: (json['Status'] as String?)?.toDatasetStatus(),
      statusMessage: json['StatusMessage'] as String?,
      statusMessageCode:
          (json['StatusMessageCode'] as String?)?.toDatasetStatusMessageCode(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTimestamp = this.creationTimestamp;
    final datasetStats = this.datasetStats;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final statusMessageCode = this.statusMessageCode;
    return {
      if (creationTimestamp != null)
        'CreationTimestamp': unixTimestampToJson(creationTimestamp),
      if (datasetStats != null) 'DatasetStats': datasetStats,
      if (lastUpdatedTimestamp != null)
        'LastUpdatedTimestamp': unixTimestampToJson(lastUpdatedTimestamp),
      if (status != null) 'Status': status.toValue(),
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (statusMessageCode != null)
        'StatusMessageCode': statusMessageCode.toValue(),
    };
  }
}

/// Describes a dataset label. For more information, see
/// <a>ListDatasetLabels</a>.
class DatasetLabelDescription {
  /// The name of the label.
  final String? labelName;

  /// Statistics about the label.
  final DatasetLabelStats? labelStats;

  DatasetLabelDescription({
    this.labelName,
    this.labelStats,
  });

  factory DatasetLabelDescription.fromJson(Map<String, dynamic> json) {
    return DatasetLabelDescription(
      labelName: json['LabelName'] as String?,
      labelStats: json['LabelStats'] != null
          ? DatasetLabelStats.fromJson(
              json['LabelStats'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final labelName = this.labelName;
    final labelStats = this.labelStats;
    return {
      if (labelName != null) 'LabelName': labelName,
      if (labelStats != null) 'LabelStats': labelStats,
    };
  }
}

/// Statistics about a label used in a dataset. For more information, see
/// <a>DatasetLabelDescription</a>.
class DatasetLabelStats {
  /// The total number of images that have the label assigned to a bounding box.
  final int? boundingBoxCount;

  /// The total number of images that use the label.
  final int? entryCount;

  DatasetLabelStats({
    this.boundingBoxCount,
    this.entryCount,
  });

  factory DatasetLabelStats.fromJson(Map<String, dynamic> json) {
    return DatasetLabelStats(
      boundingBoxCount: json['BoundingBoxCount'] as int?,
      entryCount: json['EntryCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final boundingBoxCount = this.boundingBoxCount;
    final entryCount = this.entryCount;
    return {
      if (boundingBoxCount != null) 'BoundingBoxCount': boundingBoxCount,
      if (entryCount != null) 'EntryCount': entryCount,
    };
  }
}

/// Summary information for an Amazon Rekognition Custom Labels dataset. For
/// more information, see <a>ProjectDescription</a>.
class DatasetMetadata {
  /// The Unix timestamp for the date and time that the dataset was created.
  final DateTime? creationTimestamp;

  /// The Amazon Resource Name (ARN) for the dataset.
  final String? datasetArn;

  /// The type of the dataset.
  final DatasetType? datasetType;

  /// The status for the dataset.
  final DatasetStatus? status;

  /// The status message for the dataset.
  final String? statusMessage;

  /// The status message code for the dataset operation. If a service error
  /// occurs, try the API call again later. If a client error occurs, check the
  /// input parameters to the dataset API call that failed.
  final DatasetStatusMessageCode? statusMessageCode;

  DatasetMetadata({
    this.creationTimestamp,
    this.datasetArn,
    this.datasetType,
    this.status,
    this.statusMessage,
    this.statusMessageCode,
  });

  factory DatasetMetadata.fromJson(Map<String, dynamic> json) {
    return DatasetMetadata(
      creationTimestamp: timeStampFromJson(json['CreationTimestamp']),
      datasetArn: json['DatasetArn'] as String?,
      datasetType: (json['DatasetType'] as String?)?.toDatasetType(),
      status: (json['Status'] as String?)?.toDatasetStatus(),
      statusMessage: json['StatusMessage'] as String?,
      statusMessageCode:
          (json['StatusMessageCode'] as String?)?.toDatasetStatusMessageCode(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTimestamp = this.creationTimestamp;
    final datasetArn = this.datasetArn;
    final datasetType = this.datasetType;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final statusMessageCode = this.statusMessageCode;
    return {
      if (creationTimestamp != null)
        'CreationTimestamp': unixTimestampToJson(creationTimestamp),
      if (datasetArn != null) 'DatasetArn': datasetArn,
      if (datasetType != null) 'DatasetType': datasetType.toValue(),
      if (status != null) 'Status': status.toValue(),
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (statusMessageCode != null)
        'StatusMessageCode': statusMessageCode.toValue(),
    };
  }
}

/// The source that Amazon Rekognition Custom Labels uses to create a dataset.
/// To use an Amazon Sagemaker format manifest file, specify the S3 bucket
/// location in the <code>GroundTruthManifest</code> field. The S3 bucket must
/// be in your AWS account. To create a copy of an existing dataset, specify the
/// Amazon Resource Name (ARN) of an existing dataset in
/// <code>DatasetArn</code>.
///
/// You need to specify a value for <code>DatasetArn</code> or
/// <code>GroundTruthManifest</code>, but not both. if you supply both values,
/// or if you don't specify any values, an InvalidParameterException exception
/// occurs.
///
/// For more information, see <a>CreateDataset</a>.
class DatasetSource {
  /// The ARN of an Amazon Rekognition Custom Labels dataset that you want to
  /// copy.
  final String? datasetArn;
  final GroundTruthManifest? groundTruthManifest;

  DatasetSource({
    this.datasetArn,
    this.groundTruthManifest,
  });

  Map<String, dynamic> toJson() {
    final datasetArn = this.datasetArn;
    final groundTruthManifest = this.groundTruthManifest;
    return {
      if (datasetArn != null) 'DatasetArn': datasetArn,
      if (groundTruthManifest != null)
        'GroundTruthManifest': groundTruthManifest,
    };
  }
}

/// Provides statistics about a dataset. For more information, see
/// <a>DescribeDataset</a>.
class DatasetStats {
  /// The total number of entries that contain at least one error.
  final int? errorEntries;

  /// The total number of images in the dataset that have labels.
  final int? labeledEntries;

  /// The total number of images in the dataset.
  final int? totalEntries;

  /// The total number of labels declared in the dataset.
  final int? totalLabels;

  DatasetStats({
    this.errorEntries,
    this.labeledEntries,
    this.totalEntries,
    this.totalLabels,
  });

  factory DatasetStats.fromJson(Map<String, dynamic> json) {
    return DatasetStats(
      errorEntries: json['ErrorEntries'] as int?,
      labeledEntries: json['LabeledEntries'] as int?,
      totalEntries: json['TotalEntries'] as int?,
      totalLabels: json['TotalLabels'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorEntries = this.errorEntries;
    final labeledEntries = this.labeledEntries;
    final totalEntries = this.totalEntries;
    final totalLabels = this.totalLabels;
    return {
      if (errorEntries != null) 'ErrorEntries': errorEntries,
      if (labeledEntries != null) 'LabeledEntries': labeledEntries,
      if (totalEntries != null) 'TotalEntries': totalEntries,
      if (totalLabels != null) 'TotalLabels': totalLabels,
    };
  }
}

enum DatasetStatus {
  createInProgress,
  createComplete,
  createFailed,
  updateInProgress,
  updateComplete,
  updateFailed,
  deleteInProgress,
}

extension DatasetStatusValueExtension on DatasetStatus {
  String toValue() {
    switch (this) {
      case DatasetStatus.createInProgress:
        return 'CREATE_IN_PROGRESS';
      case DatasetStatus.createComplete:
        return 'CREATE_COMPLETE';
      case DatasetStatus.createFailed:
        return 'CREATE_FAILED';
      case DatasetStatus.updateInProgress:
        return 'UPDATE_IN_PROGRESS';
      case DatasetStatus.updateComplete:
        return 'UPDATE_COMPLETE';
      case DatasetStatus.updateFailed:
        return 'UPDATE_FAILED';
      case DatasetStatus.deleteInProgress:
        return 'DELETE_IN_PROGRESS';
    }
  }
}

extension DatasetStatusFromString on String {
  DatasetStatus toDatasetStatus() {
    switch (this) {
      case 'CREATE_IN_PROGRESS':
        return DatasetStatus.createInProgress;
      case 'CREATE_COMPLETE':
        return DatasetStatus.createComplete;
      case 'CREATE_FAILED':
        return DatasetStatus.createFailed;
      case 'UPDATE_IN_PROGRESS':
        return DatasetStatus.updateInProgress;
      case 'UPDATE_COMPLETE':
        return DatasetStatus.updateComplete;
      case 'UPDATE_FAILED':
        return DatasetStatus.updateFailed;
      case 'DELETE_IN_PROGRESS':
        return DatasetStatus.deleteInProgress;
    }
    throw Exception('$this is not known in enum DatasetStatus');
  }
}

enum DatasetStatusMessageCode {
  success,
  serviceError,
  clientError,
}

extension DatasetStatusMessageCodeValueExtension on DatasetStatusMessageCode {
  String toValue() {
    switch (this) {
      case DatasetStatusMessageCode.success:
        return 'SUCCESS';
      case DatasetStatusMessageCode.serviceError:
        return 'SERVICE_ERROR';
      case DatasetStatusMessageCode.clientError:
        return 'CLIENT_ERROR';
    }
  }
}

extension DatasetStatusMessageCodeFromString on String {
  DatasetStatusMessageCode toDatasetStatusMessageCode() {
    switch (this) {
      case 'SUCCESS':
        return DatasetStatusMessageCode.success;
      case 'SERVICE_ERROR':
        return DatasetStatusMessageCode.serviceError;
      case 'CLIENT_ERROR':
        return DatasetStatusMessageCode.clientError;
    }
    throw Exception('$this is not known in enum DatasetStatusMessageCode');
  }
}

enum DatasetType {
  train,
  test,
}

extension DatasetTypeValueExtension on DatasetType {
  String toValue() {
    switch (this) {
      case DatasetType.train:
        return 'TRAIN';
      case DatasetType.test:
        return 'TEST';
    }
  }
}

extension DatasetTypeFromString on String {
  DatasetType toDatasetType() {
    switch (this) {
      case 'TRAIN':
        return DatasetType.train;
      case 'TEST':
        return DatasetType.test;
    }
    throw Exception('$this is not known in enum DatasetType');
  }
}

class DeleteCollectionResponse {
  /// HTTP status code that indicates the result of the operation.
  final int? statusCode;

  DeleteCollectionResponse({
    this.statusCode,
  });

  factory DeleteCollectionResponse.fromJson(Map<String, dynamic> json) {
    return DeleteCollectionResponse(
      statusCode: json['StatusCode'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final statusCode = this.statusCode;
    return {
      if (statusCode != null) 'StatusCode': statusCode,
    };
  }
}

class DeleteDatasetResponse {
  DeleteDatasetResponse();

  factory DeleteDatasetResponse.fromJson(Map<String, dynamic> _) {
    return DeleteDatasetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteFacesResponse {
  /// An array of strings (face IDs) of the faces that were deleted.
  final List<String>? deletedFaces;

  /// An array of any faces that weren't deleted.
  final List<UnsuccessfulFaceDeletion>? unsuccessfulFaceDeletions;

  DeleteFacesResponse({
    this.deletedFaces,
    this.unsuccessfulFaceDeletions,
  });

  factory DeleteFacesResponse.fromJson(Map<String, dynamic> json) {
    return DeleteFacesResponse(
      deletedFaces: (json['DeletedFaces'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      unsuccessfulFaceDeletions: (json['UnsuccessfulFaceDeletions'] as List?)
          ?.whereNotNull()
          .map((e) =>
              UnsuccessfulFaceDeletion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final deletedFaces = this.deletedFaces;
    final unsuccessfulFaceDeletions = this.unsuccessfulFaceDeletions;
    return {
      if (deletedFaces != null) 'DeletedFaces': deletedFaces,
      if (unsuccessfulFaceDeletions != null)
        'UnsuccessfulFaceDeletions': unsuccessfulFaceDeletions,
    };
  }
}

class DeleteProjectPolicyResponse {
  DeleteProjectPolicyResponse();

  factory DeleteProjectPolicyResponse.fromJson(Map<String, dynamic> _) {
    return DeleteProjectPolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteProjectResponse {
  /// The current status of the delete project operation.
  final ProjectStatus? status;

  DeleteProjectResponse({
    this.status,
  });

  factory DeleteProjectResponse.fromJson(Map<String, dynamic> json) {
    return DeleteProjectResponse(
      status: (json['Status'] as String?)?.toProjectStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'Status': status.toValue(),
    };
  }
}

class DeleteProjectVersionResponse {
  /// The status of the deletion operation.
  final ProjectVersionStatus? status;

  DeleteProjectVersionResponse({
    this.status,
  });

  factory DeleteProjectVersionResponse.fromJson(Map<String, dynamic> json) {
    return DeleteProjectVersionResponse(
      status: (json['Status'] as String?)?.toProjectVersionStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'Status': status.toValue(),
    };
  }
}

class DeleteStreamProcessorResponse {
  DeleteStreamProcessorResponse();

  factory DeleteStreamProcessorResponse.fromJson(Map<String, dynamic> _) {
    return DeleteStreamProcessorResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteUserResponse {
  DeleteUserResponse();

  factory DeleteUserResponse.fromJson(Map<String, dynamic> _) {
    return DeleteUserResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeCollectionResponse {
  /// The Amazon Resource Name (ARN) of the collection.
  final String? collectionARN;

  /// The number of milliseconds since the Unix epoch time until the creation of
  /// the collection. The Unix epoch time is 00:00:00 Coordinated Universal Time
  /// (UTC), Thursday, 1 January 1970.
  final DateTime? creationTimestamp;

  /// The number of faces that are indexed into the collection. To index faces
  /// into a collection, use <a>IndexFaces</a>.
  final int? faceCount;

  /// The version of the face model that's used by the collection for face
  /// detection.
  ///
  /// For more information, see Model versioning in the Amazon Rekognition
  /// Developer Guide.
  final String? faceModelVersion;

  /// The number of UserIDs assigned to the specified colleciton.
  final int? userCount;

  DescribeCollectionResponse({
    this.collectionARN,
    this.creationTimestamp,
    this.faceCount,
    this.faceModelVersion,
    this.userCount,
  });

  factory DescribeCollectionResponse.fromJson(Map<String, dynamic> json) {
    return DescribeCollectionResponse(
      collectionARN: json['CollectionARN'] as String?,
      creationTimestamp: timeStampFromJson(json['CreationTimestamp']),
      faceCount: json['FaceCount'] as int?,
      faceModelVersion: json['FaceModelVersion'] as String?,
      userCount: json['UserCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final collectionARN = this.collectionARN;
    final creationTimestamp = this.creationTimestamp;
    final faceCount = this.faceCount;
    final faceModelVersion = this.faceModelVersion;
    final userCount = this.userCount;
    return {
      if (collectionARN != null) 'CollectionARN': collectionARN,
      if (creationTimestamp != null)
        'CreationTimestamp': unixTimestampToJson(creationTimestamp),
      if (faceCount != null) 'FaceCount': faceCount,
      if (faceModelVersion != null) 'FaceModelVersion': faceModelVersion,
      if (userCount != null) 'UserCount': userCount,
    };
  }
}

class DescribeDatasetResponse {
  /// The description for the dataset.
  final DatasetDescription? datasetDescription;

  DescribeDatasetResponse({
    this.datasetDescription,
  });

  factory DescribeDatasetResponse.fromJson(Map<String, dynamic> json) {
    return DescribeDatasetResponse(
      datasetDescription: json['DatasetDescription'] != null
          ? DatasetDescription.fromJson(
              json['DatasetDescription'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final datasetDescription = this.datasetDescription;
    return {
      if (datasetDescription != null) 'DatasetDescription': datasetDescription,
    };
  }
}

class DescribeProjectVersionsResponse {
  /// If the previous response was incomplete (because there is more results to
  /// retrieve), Amazon Rekognition returns a pagination token in the response.
  /// You can use this pagination token to retrieve the next set of results.
  final String? nextToken;

  /// A list of project version descriptions. The list is sorted by the creation
  /// date and time of the project versions, latest to earliest.
  final List<ProjectVersionDescription>? projectVersionDescriptions;

  DescribeProjectVersionsResponse({
    this.nextToken,
    this.projectVersionDescriptions,
  });

  factory DescribeProjectVersionsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeProjectVersionsResponse(
      nextToken: json['NextToken'] as String?,
      projectVersionDescriptions: (json['ProjectVersionDescriptions'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ProjectVersionDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final projectVersionDescriptions = this.projectVersionDescriptions;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (projectVersionDescriptions != null)
        'ProjectVersionDescriptions': projectVersionDescriptions,
    };
  }
}

class DescribeProjectsResponse {
  /// If the previous response was incomplete (because there is more results to
  /// retrieve), Amazon Rekognition returns a pagination token in the response.
  /// You can use this pagination token to retrieve the next set of results.
  final String? nextToken;

  /// A list of project descriptions. The list is sorted by the date and time the
  /// projects are created.
  final List<ProjectDescription>? projectDescriptions;

  DescribeProjectsResponse({
    this.nextToken,
    this.projectDescriptions,
  });

  factory DescribeProjectsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeProjectsResponse(
      nextToken: json['NextToken'] as String?,
      projectDescriptions: (json['ProjectDescriptions'] as List?)
          ?.whereNotNull()
          .map((e) => ProjectDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final projectDescriptions = this.projectDescriptions;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (projectDescriptions != null)
        'ProjectDescriptions': projectDescriptions,
    };
  }
}

class DescribeStreamProcessorResponse {
  /// Date and time the stream processor was created
  final DateTime? creationTimestamp;

  /// Shows whether you are sharing data with Rekognition to improve model
  /// performance. You can choose this option at the account level or on a
  /// per-stream basis. Note that if you opt out at the account level this setting
  /// is ignored on individual streams.
  final StreamProcessorDataSharingPreference? dataSharingPreference;

  /// Kinesis video stream that provides the source streaming video.
  final StreamProcessorInput? input;

  /// The identifier for your AWS Key Management Service key (AWS KMS key). This
  /// is an optional parameter for label detection stream processors.
  final String? kmsKeyId;

  /// The time, in Unix format, the stream processor was last updated. For
  /// example, when the stream processor moves from a running state to a failed
  /// state, or when the user starts or stops the stream processor.
  final DateTime? lastUpdateTimestamp;

  /// Name of the stream processor.
  final String? name;
  final StreamProcessorNotificationChannel? notificationChannel;

  /// Kinesis data stream to which Amazon Rekognition Video puts the analysis
  /// results.
  final StreamProcessorOutput? output;

  /// Specifies locations in the frames where Amazon Rekognition checks for
  /// objects or people. This is an optional parameter for label detection stream
  /// processors.
  final List<RegionOfInterest>? regionsOfInterest;

  /// ARN of the IAM role that allows access to the stream processor.
  final String? roleArn;

  /// Input parameters used in a streaming video analyzed by a stream processor.
  /// You can use <code>FaceSearch</code> to recognize faces in a streaming video,
  /// or you can use <code>ConnectedHome</code> to detect labels.
  final StreamProcessorSettings? settings;

  /// Current status of the stream processor.
  final StreamProcessorStatus? status;

  /// Detailed status message about the stream processor.
  final String? statusMessage;

  /// ARN of the stream processor.
  final String? streamProcessorArn;

  DescribeStreamProcessorResponse({
    this.creationTimestamp,
    this.dataSharingPreference,
    this.input,
    this.kmsKeyId,
    this.lastUpdateTimestamp,
    this.name,
    this.notificationChannel,
    this.output,
    this.regionsOfInterest,
    this.roleArn,
    this.settings,
    this.status,
    this.statusMessage,
    this.streamProcessorArn,
  });

  factory DescribeStreamProcessorResponse.fromJson(Map<String, dynamic> json) {
    return DescribeStreamProcessorResponse(
      creationTimestamp: timeStampFromJson(json['CreationTimestamp']),
      dataSharingPreference: json['DataSharingPreference'] != null
          ? StreamProcessorDataSharingPreference.fromJson(
              json['DataSharingPreference'] as Map<String, dynamic>)
          : null,
      input: json['Input'] != null
          ? StreamProcessorInput.fromJson(json['Input'] as Map<String, dynamic>)
          : null,
      kmsKeyId: json['KmsKeyId'] as String?,
      lastUpdateTimestamp: timeStampFromJson(json['LastUpdateTimestamp']),
      name: json['Name'] as String?,
      notificationChannel: json['NotificationChannel'] != null
          ? StreamProcessorNotificationChannel.fromJson(
              json['NotificationChannel'] as Map<String, dynamic>)
          : null,
      output: json['Output'] != null
          ? StreamProcessorOutput.fromJson(
              json['Output'] as Map<String, dynamic>)
          : null,
      regionsOfInterest: (json['RegionsOfInterest'] as List?)
          ?.whereNotNull()
          .map((e) => RegionOfInterest.fromJson(e as Map<String, dynamic>))
          .toList(),
      roleArn: json['RoleArn'] as String?,
      settings: json['Settings'] != null
          ? StreamProcessorSettings.fromJson(
              json['Settings'] as Map<String, dynamic>)
          : null,
      status: (json['Status'] as String?)?.toStreamProcessorStatus(),
      statusMessage: json['StatusMessage'] as String?,
      streamProcessorArn: json['StreamProcessorArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTimestamp = this.creationTimestamp;
    final dataSharingPreference = this.dataSharingPreference;
    final input = this.input;
    final kmsKeyId = this.kmsKeyId;
    final lastUpdateTimestamp = this.lastUpdateTimestamp;
    final name = this.name;
    final notificationChannel = this.notificationChannel;
    final output = this.output;
    final regionsOfInterest = this.regionsOfInterest;
    final roleArn = this.roleArn;
    final settings = this.settings;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final streamProcessorArn = this.streamProcessorArn;
    return {
      if (creationTimestamp != null)
        'CreationTimestamp': unixTimestampToJson(creationTimestamp),
      if (dataSharingPreference != null)
        'DataSharingPreference': dataSharingPreference,
      if (input != null) 'Input': input,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (lastUpdateTimestamp != null)
        'LastUpdateTimestamp': unixTimestampToJson(lastUpdateTimestamp),
      if (name != null) 'Name': name,
      if (notificationChannel != null)
        'NotificationChannel': notificationChannel,
      if (output != null) 'Output': output,
      if (regionsOfInterest != null) 'RegionsOfInterest': regionsOfInterest,
      if (roleArn != null) 'RoleArn': roleArn,
      if (settings != null) 'Settings': settings,
      if (status != null) 'Status': status.toValue(),
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (streamProcessorArn != null) 'StreamProcessorArn': streamProcessorArn,
    };
  }
}

class DetectCustomLabelsResponse {
  /// An array of custom labels detected in the input image.
  final List<CustomLabel>? customLabels;

  DetectCustomLabelsResponse({
    this.customLabels,
  });

  factory DetectCustomLabelsResponse.fromJson(Map<String, dynamic> json) {
    return DetectCustomLabelsResponse(
      customLabels: (json['CustomLabels'] as List?)
          ?.whereNotNull()
          .map((e) => CustomLabel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final customLabels = this.customLabels;
    return {
      if (customLabels != null) 'CustomLabels': customLabels,
    };
  }
}

class DetectFacesResponse {
  /// Details of each face found in the image.
  final List<FaceDetail>? faceDetails;

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
  final OrientationCorrection? orientationCorrection;

  DetectFacesResponse({
    this.faceDetails,
    this.orientationCorrection,
  });

  factory DetectFacesResponse.fromJson(Map<String, dynamic> json) {
    return DetectFacesResponse(
      faceDetails: (json['FaceDetails'] as List?)
          ?.whereNotNull()
          .map((e) => FaceDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      orientationCorrection:
          (json['OrientationCorrection'] as String?)?.toOrientationCorrection(),
    );
  }

  Map<String, dynamic> toJson() {
    final faceDetails = this.faceDetails;
    final orientationCorrection = this.orientationCorrection;
    return {
      if (faceDetails != null) 'FaceDetails': faceDetails,
      if (orientationCorrection != null)
        'OrientationCorrection': orientationCorrection.toValue(),
    };
  }
}

enum DetectLabelsFeatureName {
  generalLabels,
  imageProperties,
}

extension DetectLabelsFeatureNameValueExtension on DetectLabelsFeatureName {
  String toValue() {
    switch (this) {
      case DetectLabelsFeatureName.generalLabels:
        return 'GENERAL_LABELS';
      case DetectLabelsFeatureName.imageProperties:
        return 'IMAGE_PROPERTIES';
    }
  }
}

extension DetectLabelsFeatureNameFromString on String {
  DetectLabelsFeatureName toDetectLabelsFeatureName() {
    switch (this) {
      case 'GENERAL_LABELS':
        return DetectLabelsFeatureName.generalLabels;
      case 'IMAGE_PROPERTIES':
        return DetectLabelsFeatureName.imageProperties;
    }
    throw Exception('$this is not known in enum DetectLabelsFeatureName');
  }
}

/// The background of the image with regard to image quality and dominant
/// colors.
class DetectLabelsImageBackground {
  /// The dominant colors found in the background of an image, defined with RGB
  /// values, CSS color name, simplified color name, and PixelPercentage (the
  /// percentage of image pixels that have a particular color).
  final List<DominantColor>? dominantColors;

  /// The quality of the image background as defined by brightness and sharpness.
  final DetectLabelsImageQuality? quality;

  DetectLabelsImageBackground({
    this.dominantColors,
    this.quality,
  });

  factory DetectLabelsImageBackground.fromJson(Map<String, dynamic> json) {
    return DetectLabelsImageBackground(
      dominantColors: (json['DominantColors'] as List?)
          ?.whereNotNull()
          .map((e) => DominantColor.fromJson(e as Map<String, dynamic>))
          .toList(),
      quality: json['Quality'] != null
          ? DetectLabelsImageQuality.fromJson(
              json['Quality'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dominantColors = this.dominantColors;
    final quality = this.quality;
    return {
      if (dominantColors != null) 'DominantColors': dominantColors,
      if (quality != null) 'Quality': quality,
    };
  }
}

/// The foreground of the image with regard to image quality and dominant
/// colors.
class DetectLabelsImageForeground {
  /// The dominant colors found in the foreground of an image, defined with RGB
  /// values, CSS color name, simplified color name, and PixelPercentage (the
  /// percentage of image pixels that have a particular color).
  final List<DominantColor>? dominantColors;

  /// The quality of the image foreground as defined by brightness and sharpness.
  final DetectLabelsImageQuality? quality;

  DetectLabelsImageForeground({
    this.dominantColors,
    this.quality,
  });

  factory DetectLabelsImageForeground.fromJson(Map<String, dynamic> json) {
    return DetectLabelsImageForeground(
      dominantColors: (json['DominantColors'] as List?)
          ?.whereNotNull()
          .map((e) => DominantColor.fromJson(e as Map<String, dynamic>))
          .toList(),
      quality: json['Quality'] != null
          ? DetectLabelsImageQuality.fromJson(
              json['Quality'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dominantColors = this.dominantColors;
    final quality = this.quality;
    return {
      if (dominantColors != null) 'DominantColors': dominantColors,
      if (quality != null) 'Quality': quality,
    };
  }
}

/// Information about the quality and dominant colors of an input image. Quality
/// and color information is returned for the entire image, foreground, and
/// background.
class DetectLabelsImageProperties {
  /// Information about the properties of an image’s background, including the
  /// background’s quality and dominant colors, including the quality and dominant
  /// colors of the image.
  final DetectLabelsImageBackground? background;

  /// Information about the dominant colors found in an image, described with RGB
  /// values, CSS color name, simplified color name, and PixelPercentage (the
  /// percentage of image pixels that have a particular color).
  final List<DominantColor>? dominantColors;

  /// Information about the properties of an image’s foreground, including the
  /// foreground’s quality and dominant colors, including the quality and dominant
  /// colors of the image.
  final DetectLabelsImageForeground? foreground;

  /// Information about the quality of the image foreground as defined by
  /// brightness, sharpness, and contrast. The higher the value the greater the
  /// brightness, sharpness, and contrast respectively.
  final DetectLabelsImageQuality? quality;

  DetectLabelsImageProperties({
    this.background,
    this.dominantColors,
    this.foreground,
    this.quality,
  });

  factory DetectLabelsImageProperties.fromJson(Map<String, dynamic> json) {
    return DetectLabelsImageProperties(
      background: json['Background'] != null
          ? DetectLabelsImageBackground.fromJson(
              json['Background'] as Map<String, dynamic>)
          : null,
      dominantColors: (json['DominantColors'] as List?)
          ?.whereNotNull()
          .map((e) => DominantColor.fromJson(e as Map<String, dynamic>))
          .toList(),
      foreground: json['Foreground'] != null
          ? DetectLabelsImageForeground.fromJson(
              json['Foreground'] as Map<String, dynamic>)
          : null,
      quality: json['Quality'] != null
          ? DetectLabelsImageQuality.fromJson(
              json['Quality'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final background = this.background;
    final dominantColors = this.dominantColors;
    final foreground = this.foreground;
    final quality = this.quality;
    return {
      if (background != null) 'Background': background,
      if (dominantColors != null) 'DominantColors': dominantColors,
      if (foreground != null) 'Foreground': foreground,
      if (quality != null) 'Quality': quality,
    };
  }
}

/// Settings for the IMAGE_PROPERTIES feature type.
class DetectLabelsImagePropertiesSettings {
  /// The maximum number of dominant colors to return when detecting labels in an
  /// image. The default value is 10.
  final int? maxDominantColors;

  DetectLabelsImagePropertiesSettings({
    this.maxDominantColors,
  });

  Map<String, dynamic> toJson() {
    final maxDominantColors = this.maxDominantColors;
    return {
      if (maxDominantColors != null) 'MaxDominantColors': maxDominantColors,
    };
  }
}

/// The quality of an image provided for label detection, with regard to
/// brightness, sharpness, and contrast.
class DetectLabelsImageQuality {
  /// The brightness of an image provided for label detection.
  final double? brightness;

  /// The contrast of an image provided for label detection.
  final double? contrast;

  /// The sharpness of an image provided for label detection.
  final double? sharpness;

  DetectLabelsImageQuality({
    this.brightness,
    this.contrast,
    this.sharpness,
  });

  factory DetectLabelsImageQuality.fromJson(Map<String, dynamic> json) {
    return DetectLabelsImageQuality(
      brightness: json['Brightness'] as double?,
      contrast: json['Contrast'] as double?,
      sharpness: json['Sharpness'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final brightness = this.brightness;
    final contrast = this.contrast;
    final sharpness = this.sharpness;
    return {
      if (brightness != null) 'Brightness': brightness,
      if (contrast != null) 'Contrast': contrast,
      if (sharpness != null) 'Sharpness': sharpness,
    };
  }
}

class DetectLabelsResponse {
  /// Information about the properties of the input image, such as brightness,
  /// sharpness, contrast, and dominant colors.
  final DetectLabelsImageProperties? imageProperties;

  /// Version number of the label detection model that was used to detect labels.
  final String? labelModelVersion;

  /// An array of labels for the real-world objects detected.
  final List<Label>? labels;

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
  final OrientationCorrection? orientationCorrection;

  DetectLabelsResponse({
    this.imageProperties,
    this.labelModelVersion,
    this.labels,
    this.orientationCorrection,
  });

  factory DetectLabelsResponse.fromJson(Map<String, dynamic> json) {
    return DetectLabelsResponse(
      imageProperties: json['ImageProperties'] != null
          ? DetectLabelsImageProperties.fromJson(
              json['ImageProperties'] as Map<String, dynamic>)
          : null,
      labelModelVersion: json['LabelModelVersion'] as String?,
      labels: (json['Labels'] as List?)
          ?.whereNotNull()
          .map((e) => Label.fromJson(e as Map<String, dynamic>))
          .toList(),
      orientationCorrection:
          (json['OrientationCorrection'] as String?)?.toOrientationCorrection(),
    );
  }

  Map<String, dynamic> toJson() {
    final imageProperties = this.imageProperties;
    final labelModelVersion = this.labelModelVersion;
    final labels = this.labels;
    final orientationCorrection = this.orientationCorrection;
    return {
      if (imageProperties != null) 'ImageProperties': imageProperties,
      if (labelModelVersion != null) 'LabelModelVersion': labelModelVersion,
      if (labels != null) 'Labels': labels,
      if (orientationCorrection != null)
        'OrientationCorrection': orientationCorrection.toValue(),
    };
  }
}

/// Settings for the DetectLabels request. Settings can include filters for both
/// GENERAL_LABELS and IMAGE_PROPERTIES. GENERAL_LABELS filters can be inclusive
/// or exclusive and applied to individual labels or label categories.
/// IMAGE_PROPERTIES filters allow specification of a maximum number of dominant
/// colors.
class DetectLabelsSettings {
  /// Contains the specified filters for GENERAL_LABELS.
  final GeneralLabelsSettings? generalLabels;

  /// Contains the chosen number of maximum dominant colors in an image.
  final DetectLabelsImagePropertiesSettings? imageProperties;

  DetectLabelsSettings({
    this.generalLabels,
    this.imageProperties,
  });

  Map<String, dynamic> toJson() {
    final generalLabels = this.generalLabels;
    final imageProperties = this.imageProperties;
    return {
      if (generalLabels != null) 'GeneralLabels': generalLabels,
      if (imageProperties != null) 'ImageProperties': imageProperties,
    };
  }
}

class DetectModerationLabelsResponse {
  /// A list of predicted results for the type of content an image contains. For
  /// example, the image content might be from animation, sports, or a video game.
  final List<ContentType>? contentTypes;

  /// Shows the results of the human in the loop evaluation.
  final HumanLoopActivationOutput? humanLoopActivationOutput;

  /// Array of detected Moderation labels and the time, in milliseconds from the
  /// start of the video, they were detected.
  final List<ModerationLabel>? moderationLabels;

  /// Version number of the base moderation detection model that was used to
  /// detect unsafe content.
  final String? moderationModelVersion;

  /// Identifier of the custom adapter that was used during inference. If during
  /// inference the adapter was EXPIRED, then the parameter will not be returned,
  /// indicating that a base moderation detection project version was used.
  final String? projectVersion;

  DetectModerationLabelsResponse({
    this.contentTypes,
    this.humanLoopActivationOutput,
    this.moderationLabels,
    this.moderationModelVersion,
    this.projectVersion,
  });

  factory DetectModerationLabelsResponse.fromJson(Map<String, dynamic> json) {
    return DetectModerationLabelsResponse(
      contentTypes: (json['ContentTypes'] as List?)
          ?.whereNotNull()
          .map((e) => ContentType.fromJson(e as Map<String, dynamic>))
          .toList(),
      humanLoopActivationOutput: json['HumanLoopActivationOutput'] != null
          ? HumanLoopActivationOutput.fromJson(
              json['HumanLoopActivationOutput'] as Map<String, dynamic>)
          : null,
      moderationLabels: (json['ModerationLabels'] as List?)
          ?.whereNotNull()
          .map((e) => ModerationLabel.fromJson(e as Map<String, dynamic>))
          .toList(),
      moderationModelVersion: json['ModerationModelVersion'] as String?,
      projectVersion: json['ProjectVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final contentTypes = this.contentTypes;
    final humanLoopActivationOutput = this.humanLoopActivationOutput;
    final moderationLabels = this.moderationLabels;
    final moderationModelVersion = this.moderationModelVersion;
    final projectVersion = this.projectVersion;
    return {
      if (contentTypes != null) 'ContentTypes': contentTypes,
      if (humanLoopActivationOutput != null)
        'HumanLoopActivationOutput': humanLoopActivationOutput,
      if (moderationLabels != null) 'ModerationLabels': moderationLabels,
      if (moderationModelVersion != null)
        'ModerationModelVersion': moderationModelVersion,
      if (projectVersion != null) 'ProjectVersion': projectVersion,
    };
  }
}

class DetectProtectiveEquipmentResponse {
  /// An array of persons detected in the image (including persons not wearing
  /// PPE).
  final List<ProtectiveEquipmentPerson>? persons;

  /// The version number of the PPE detection model used to detect PPE in the
  /// image.
  final String? protectiveEquipmentModelVersion;

  /// Summary information for the types of PPE specified in the
  /// <code>SummarizationAttributes</code> input parameter.
  final ProtectiveEquipmentSummary? summary;

  DetectProtectiveEquipmentResponse({
    this.persons,
    this.protectiveEquipmentModelVersion,
    this.summary,
  });

  factory DetectProtectiveEquipmentResponse.fromJson(
      Map<String, dynamic> json) {
    return DetectProtectiveEquipmentResponse(
      persons: (json['Persons'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ProtectiveEquipmentPerson.fromJson(e as Map<String, dynamic>))
          .toList(),
      protectiveEquipmentModelVersion:
          json['ProtectiveEquipmentModelVersion'] as String?,
      summary: json['Summary'] != null
          ? ProtectiveEquipmentSummary.fromJson(
              json['Summary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final persons = this.persons;
    final protectiveEquipmentModelVersion =
        this.protectiveEquipmentModelVersion;
    final summary = this.summary;
    return {
      if (persons != null) 'Persons': persons,
      if (protectiveEquipmentModelVersion != null)
        'ProtectiveEquipmentModelVersion': protectiveEquipmentModelVersion,
      if (summary != null) 'Summary': summary,
    };
  }
}

/// A set of optional parameters that you can use to set the criteria that the
/// text must meet to be included in your response. <code>WordFilter</code>
/// looks at a word’s height, width, and minimum confidence.
/// <code>RegionOfInterest</code> lets you set a specific region of the image to
/// look for text in.
class DetectTextFilters {
  /// A Filter focusing on a certain area of the image. Uses a
  /// <code>BoundingBox</code> object to set the region of the image.
  final List<RegionOfInterest>? regionsOfInterest;
  final DetectionFilter? wordFilter;

  DetectTextFilters({
    this.regionsOfInterest,
    this.wordFilter,
  });

  Map<String, dynamic> toJson() {
    final regionsOfInterest = this.regionsOfInterest;
    final wordFilter = this.wordFilter;
    return {
      if (regionsOfInterest != null) 'RegionsOfInterest': regionsOfInterest,
      if (wordFilter != null) 'WordFilter': wordFilter,
    };
  }
}

class DetectTextResponse {
  /// An array of text that was detected in the input image.
  final List<TextDetection>? textDetections;

  /// The model version used to detect text.
  final String? textModelVersion;

  DetectTextResponse({
    this.textDetections,
    this.textModelVersion,
  });

  factory DetectTextResponse.fromJson(Map<String, dynamic> json) {
    return DetectTextResponse(
      textDetections: (json['TextDetections'] as List?)
          ?.whereNotNull()
          .map((e) => TextDetection.fromJson(e as Map<String, dynamic>))
          .toList(),
      textModelVersion: json['TextModelVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final textDetections = this.textDetections;
    final textModelVersion = this.textModelVersion;
    return {
      if (textDetections != null) 'TextDetections': textDetections,
      if (textModelVersion != null) 'TextModelVersion': textModelVersion,
    };
  }
}

/// A set of parameters that allow you to filter out certain results from your
/// returned results.
class DetectionFilter {
  /// Sets the minimum height of the word bounding box. Words with bounding box
  /// heights lesser than this value will be excluded from the result. Value is
  /// relative to the video frame height.
  final double? minBoundingBoxHeight;

  /// Sets the minimum width of the word bounding box. Words with bounding boxes
  /// widths lesser than this value will be excluded from the result. Value is
  /// relative to the video frame width.
  final double? minBoundingBoxWidth;

  /// Sets the confidence of word detection. Words with detection confidence below
  /// this will be excluded from the result. Values should be between 0 and 100.
  /// The default MinConfidence is 80.
  final double? minConfidence;

  DetectionFilter({
    this.minBoundingBoxHeight,
    this.minBoundingBoxWidth,
    this.minConfidence,
  });

  Map<String, dynamic> toJson() {
    final minBoundingBoxHeight = this.minBoundingBoxHeight;
    final minBoundingBoxWidth = this.minBoundingBoxWidth;
    final minConfidence = this.minConfidence;
    return {
      if (minBoundingBoxHeight != null)
        'MinBoundingBoxHeight': minBoundingBoxHeight,
      if (minBoundingBoxWidth != null)
        'MinBoundingBoxWidth': minBoundingBoxWidth,
      if (minConfidence != null) 'MinConfidence': minConfidence,
    };
  }
}

class DisassociateFacesResponse {
  /// An array of DissociatedFace objects containing FaceIds that are successfully
  /// disassociated with the UserID is returned. Returned if the
  /// DisassociatedFaces action is successful.
  final List<DisassociatedFace>? disassociatedFaces;

  /// An array of UnsuccessfulDisassociation objects containing FaceIds that are
  /// not successfully associated, along with the reasons for the failure to
  /// associate. Returned if the DisassociateFaces action is successful.
  final List<UnsuccessfulFaceDisassociation>? unsuccessfulFaceDisassociations;

  /// The status of an update made to a User. Reflects if the User has been
  /// updated for every requested change.
  final UserStatus? userStatus;

  DisassociateFacesResponse({
    this.disassociatedFaces,
    this.unsuccessfulFaceDisassociations,
    this.userStatus,
  });

  factory DisassociateFacesResponse.fromJson(Map<String, dynamic> json) {
    return DisassociateFacesResponse(
      disassociatedFaces: (json['DisassociatedFaces'] as List?)
          ?.whereNotNull()
          .map((e) => DisassociatedFace.fromJson(e as Map<String, dynamic>))
          .toList(),
      unsuccessfulFaceDisassociations:
          (json['UnsuccessfulFaceDisassociations'] as List?)
              ?.whereNotNull()
              .map((e) => UnsuccessfulFaceDisassociation.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      userStatus: (json['UserStatus'] as String?)?.toUserStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final disassociatedFaces = this.disassociatedFaces;
    final unsuccessfulFaceDisassociations =
        this.unsuccessfulFaceDisassociations;
    final userStatus = this.userStatus;
    return {
      if (disassociatedFaces != null) 'DisassociatedFaces': disassociatedFaces,
      if (unsuccessfulFaceDisassociations != null)
        'UnsuccessfulFaceDisassociations': unsuccessfulFaceDisassociations,
      if (userStatus != null) 'UserStatus': userStatus.toValue(),
    };
  }
}

/// Provides face metadata for the faces that are disassociated from a specific
/// UserID.
class DisassociatedFace {
  /// Unique identifier assigned to the face.
  final String? faceId;

  DisassociatedFace({
    this.faceId,
  });

  factory DisassociatedFace.fromJson(Map<String, dynamic> json) {
    return DisassociatedFace(
      faceId: json['FaceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final faceId = this.faceId;
    return {
      if (faceId != null) 'FaceId': faceId,
    };
  }
}

/// A training dataset or a test dataset used in a dataset distribution
/// operation. For more information, see <a>DistributeDatasetEntries</a>.
class DistributeDataset {
  /// The Amazon Resource Name (ARN) of the dataset that you want to use.
  final String arn;

  DistributeDataset({
    required this.arn,
  });

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      'Arn': arn,
    };
  }
}

class DistributeDatasetEntriesResponse {
  DistributeDatasetEntriesResponse();

  factory DistributeDatasetEntriesResponse.fromJson(Map<String, dynamic> _) {
    return DistributeDatasetEntriesResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A description of the dominant colors in an image.
class DominantColor {
  /// The Blue RGB value for a dominant color.
  final int? blue;

  /// The CSS color name of a dominant color.
  final String? cSSColor;

  /// The Green RGB value for a dominant color.
  final int? green;

  /// The Hex code equivalent of the RGB values for a dominant color.
  final String? hexCode;

  /// The percentage of image pixels that have a given dominant color.
  final double? pixelPercent;

  /// The Red RGB value for a dominant color.
  final int? red;

  /// One of 12 simplified color names applied to a dominant color.
  final String? simplifiedColor;

  DominantColor({
    this.blue,
    this.cSSColor,
    this.green,
    this.hexCode,
    this.pixelPercent,
    this.red,
    this.simplifiedColor,
  });

  factory DominantColor.fromJson(Map<String, dynamic> json) {
    return DominantColor(
      blue: json['Blue'] as int?,
      cSSColor: json['CSSColor'] as String?,
      green: json['Green'] as int?,
      hexCode: json['HexCode'] as String?,
      pixelPercent: json['PixelPercent'] as double?,
      red: json['Red'] as int?,
      simplifiedColor: json['SimplifiedColor'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final blue = this.blue;
    final cSSColor = this.cSSColor;
    final green = this.green;
    final hexCode = this.hexCode;
    final pixelPercent = this.pixelPercent;
    final red = this.red;
    final simplifiedColor = this.simplifiedColor;
    return {
      if (blue != null) 'Blue': blue,
      if (cSSColor != null) 'CSSColor': cSSColor,
      if (green != null) 'Green': green,
      if (hexCode != null) 'HexCode': hexCode,
      if (pixelPercent != null) 'PixelPercent': pixelPercent,
      if (red != null) 'Red': red,
      if (simplifiedColor != null) 'SimplifiedColor': simplifiedColor,
    };
  }
}

/// The emotions that appear to be expressed on the face, and the confidence
/// level in the determination. The API is only making a determination of the
/// physical appearance of a person's face. It is not a determination of the
/// person’s internal emotional state and should not be used in such a way. For
/// example, a person pretending to have a sad face might not be sad
/// emotionally.
class Emotion {
  /// Level of confidence in the determination.
  final double? confidence;

  /// Type of emotion detected.
  final EmotionName? type;

  Emotion({
    this.confidence,
    this.type,
  });

  factory Emotion.fromJson(Map<String, dynamic> json) {
    return Emotion(
      confidence: json['Confidence'] as double?,
      type: (json['Type'] as String?)?.toEmotionName(),
    );
  }

  Map<String, dynamic> toJson() {
    final confidence = this.confidence;
    final type = this.type;
    return {
      if (confidence != null) 'Confidence': confidence,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum EmotionName {
  happy,
  sad,
  angry,
  confused,
  disgusted,
  surprised,
  calm,
  unknown,
  fear,
}

extension EmotionNameValueExtension on EmotionName {
  String toValue() {
    switch (this) {
      case EmotionName.happy:
        return 'HAPPY';
      case EmotionName.sad:
        return 'SAD';
      case EmotionName.angry:
        return 'ANGRY';
      case EmotionName.confused:
        return 'CONFUSED';
      case EmotionName.disgusted:
        return 'DISGUSTED';
      case EmotionName.surprised:
        return 'SURPRISED';
      case EmotionName.calm:
        return 'CALM';
      case EmotionName.unknown:
        return 'UNKNOWN';
      case EmotionName.fear:
        return 'FEAR';
    }
  }
}

extension EmotionNameFromString on String {
  EmotionName toEmotionName() {
    switch (this) {
      case 'HAPPY':
        return EmotionName.happy;
      case 'SAD':
        return EmotionName.sad;
      case 'ANGRY':
        return EmotionName.angry;
      case 'CONFUSED':
        return EmotionName.confused;
      case 'DISGUSTED':
        return EmotionName.disgusted;
      case 'SURPRISED':
        return EmotionName.surprised;
      case 'CALM':
        return EmotionName.calm;
      case 'UNKNOWN':
        return EmotionName.unknown;
      case 'FEAR':
        return EmotionName.fear;
    }
    throw Exception('$this is not known in enum EmotionName');
  }
}

/// Information about an item of Personal Protective Equipment (PPE) detected by
/// <a>DetectProtectiveEquipment</a>. For more information, see
/// <a>DetectProtectiveEquipment</a>.
class EquipmentDetection {
  /// A bounding box surrounding the item of detected PPE.
  final BoundingBox? boundingBox;

  /// The confidence that Amazon Rekognition has that the bounding box
  /// (<code>BoundingBox</code>) contains an item of PPE.
  final double? confidence;

  /// Information about the body part covered by the detected PPE.
  final CoversBodyPart? coversBodyPart;

  /// The type of detected PPE.
  final ProtectiveEquipmentType? type;

  EquipmentDetection({
    this.boundingBox,
    this.confidence,
    this.coversBodyPart,
    this.type,
  });

  factory EquipmentDetection.fromJson(Map<String, dynamic> json) {
    return EquipmentDetection(
      boundingBox: json['BoundingBox'] != null
          ? BoundingBox.fromJson(json['BoundingBox'] as Map<String, dynamic>)
          : null,
      confidence: json['Confidence'] as double?,
      coversBodyPart: json['CoversBodyPart'] != null
          ? CoversBodyPart.fromJson(
              json['CoversBodyPart'] as Map<String, dynamic>)
          : null,
      type: (json['Type'] as String?)?.toProtectiveEquipmentType(),
    );
  }

  Map<String, dynamic> toJson() {
    final boundingBox = this.boundingBox;
    final confidence = this.confidence;
    final coversBodyPart = this.coversBodyPart;
    final type = this.type;
    return {
      if (boundingBox != null) 'BoundingBox': boundingBox,
      if (confidence != null) 'Confidence': confidence,
      if (coversBodyPart != null) 'CoversBodyPart': coversBodyPart,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// The evaluation results for the training of a model.
class EvaluationResult {
  /// The F1 score for the evaluation of all labels. The F1 score metric evaluates
  /// the overall precision and recall performance of the model as a single value.
  /// A higher value indicates better precision and recall performance. A lower
  /// score indicates that precision, recall, or both are performing poorly.
  final double? f1Score;

  /// The S3 bucket that contains the training summary.
  final Summary? summary;

  EvaluationResult({
    this.f1Score,
    this.summary,
  });

  factory EvaluationResult.fromJson(Map<String, dynamic> json) {
    return EvaluationResult(
      f1Score: json['F1Score'] as double?,
      summary: json['Summary'] != null
          ? Summary.fromJson(json['Summary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final f1Score = this.f1Score;
    final summary = this.summary;
    return {
      if (f1Score != null) 'F1Score': f1Score,
      if (summary != null) 'Summary': summary,
    };
  }
}

/// Indicates the direction the eyes are gazing in (independent of the head
/// pose) as determined by its pitch and yaw.
class EyeDirection {
  /// The confidence that the service has in its predicted eye direction.
  final double? confidence;

  /// Value representing eye direction on the pitch axis.
  final double? pitch;

  /// Value representing eye direction on the yaw axis.
  final double? yaw;

  EyeDirection({
    this.confidence,
    this.pitch,
    this.yaw,
  });

  factory EyeDirection.fromJson(Map<String, dynamic> json) {
    return EyeDirection(
      confidence: json['Confidence'] as double?,
      pitch: json['Pitch'] as double?,
      yaw: json['Yaw'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final confidence = this.confidence;
    final pitch = this.pitch;
    final yaw = this.yaw;
    return {
      if (confidence != null) 'Confidence': confidence,
      if (pitch != null) 'Pitch': pitch,
      if (yaw != null) 'Yaw': yaw,
    };
  }
}

/// Indicates whether or not the eyes on the face are open, and the confidence
/// level in the determination.
class EyeOpen {
  /// Level of confidence in the determination.
  final double? confidence;

  /// Boolean value that indicates whether the eyes on the face are open.
  final bool? value;

  EyeOpen({
    this.confidence,
    this.value,
  });

  factory EyeOpen.fromJson(Map<String, dynamic> json) {
    return EyeOpen(
      confidence: json['Confidence'] as double?,
      value: json['Value'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final confidence = this.confidence;
    final value = this.value;
    return {
      if (confidence != null) 'Confidence': confidence,
      if (value != null) 'Value': value,
    };
  }
}

/// Indicates whether or not the face is wearing eye glasses, and the confidence
/// level in the determination.
class Eyeglasses {
  /// Level of confidence in the determination.
  final double? confidence;

  /// Boolean value that indicates whether the face is wearing eye glasses or not.
  final bool? value;

  Eyeglasses({
    this.confidence,
    this.value,
  });

  factory Eyeglasses.fromJson(Map<String, dynamic> json) {
    return Eyeglasses(
      confidence: json['Confidence'] as double?,
      value: json['Value'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final confidence = this.confidence;
    final value = this.value;
    return {
      if (confidence != null) 'Confidence': confidence,
      if (value != null) 'Value': value,
    };
  }
}

/// Describes the face properties such as the bounding box, face ID, image ID of
/// the input image, and external image ID that you assigned.
class Face {
  /// Bounding box of the face.
  final BoundingBox? boundingBox;

  /// Confidence level that the bounding box contains a face (and not a different
  /// object such as a tree).
  final double? confidence;

  /// Identifier that you assign to all the faces in the input image.
  final String? externalImageId;

  /// Unique identifier that Amazon Rekognition assigns to the face.
  final String? faceId;

  /// Unique identifier that Amazon Rekognition assigns to the input image.
  final String? imageId;

  /// The version of the face detect and storage model that was used when indexing
  /// the face vector.
  final String? indexFacesModelVersion;

  /// Unique identifier assigned to the user.
  final String? userId;

  Face({
    this.boundingBox,
    this.confidence,
    this.externalImageId,
    this.faceId,
    this.imageId,
    this.indexFacesModelVersion,
    this.userId,
  });

  factory Face.fromJson(Map<String, dynamic> json) {
    return Face(
      boundingBox: json['BoundingBox'] != null
          ? BoundingBox.fromJson(json['BoundingBox'] as Map<String, dynamic>)
          : null,
      confidence: json['Confidence'] as double?,
      externalImageId: json['ExternalImageId'] as String?,
      faceId: json['FaceId'] as String?,
      imageId: json['ImageId'] as String?,
      indexFacesModelVersion: json['IndexFacesModelVersion'] as String?,
      userId: json['UserId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final boundingBox = this.boundingBox;
    final confidence = this.confidence;
    final externalImageId = this.externalImageId;
    final faceId = this.faceId;
    final imageId = this.imageId;
    final indexFacesModelVersion = this.indexFacesModelVersion;
    final userId = this.userId;
    return {
      if (boundingBox != null) 'BoundingBox': boundingBox,
      if (confidence != null) 'Confidence': confidence,
      if (externalImageId != null) 'ExternalImageId': externalImageId,
      if (faceId != null) 'FaceId': faceId,
      if (imageId != null) 'ImageId': imageId,
      if (indexFacesModelVersion != null)
        'IndexFacesModelVersion': indexFacesModelVersion,
      if (userId != null) 'UserId': userId,
    };
  }
}

enum FaceAttributes {
  $default,
  all,
}

extension FaceAttributesValueExtension on FaceAttributes {
  String toValue() {
    switch (this) {
      case FaceAttributes.$default:
        return 'DEFAULT';
      case FaceAttributes.all:
        return 'ALL';
    }
  }
}

extension FaceAttributesFromString on String {
  FaceAttributes toFaceAttributes() {
    switch (this) {
      case 'DEFAULT':
        return FaceAttributes.$default;
      case 'ALL':
        return FaceAttributes.all;
    }
    throw Exception('$this is not known in enum FaceAttributes');
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
/// <code>FaceAttributes</code> input parameter:
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
class FaceDetail {
  /// The estimated age range, in years, for the face. Low represents the lowest
  /// estimated age and High represents the highest estimated age.
  final AgeRange? ageRange;

  /// Indicates whether or not the face has a beard, and the confidence level in
  /// the determination.
  final Beard? beard;

  /// Bounding box of the face. Default attribute.
  final BoundingBox? boundingBox;

  /// Confidence level that the bounding box contains a face (and not a different
  /// object such as a tree). Default attribute.
  final double? confidence;

  /// The emotions that appear to be expressed on the face, and the confidence
  /// level in the determination. The API is only making a determination of the
  /// physical appearance of a person's face. It is not a determination of the
  /// person’s internal emotional state and should not be used in such a way. For
  /// example, a person pretending to have a sad face might not be sad
  /// emotionally.
  final List<Emotion>? emotions;

  /// Indicates the direction the eyes are gazing in, as defined by pitch and yaw.
  final EyeDirection? eyeDirection;

  /// Indicates whether or not the face is wearing eye glasses, and the confidence
  /// level in the determination.
  final Eyeglasses? eyeglasses;

  /// Indicates whether or not the eyes on the face are open, and the confidence
  /// level in the determination.
  final EyeOpen? eyesOpen;

  /// <code>FaceOccluded</code> should return "true" with a high confidence score
  /// if a detected face’s eyes, nose, and mouth are partially captured or if they
  /// are covered by masks, dark sunglasses, cell phones, hands, or other objects.
  /// <code>FaceOccluded</code> should return "false" with a high confidence score
  /// if common occurrences that do not impact face verification are detected,
  /// such as eye glasses, lightly tinted sunglasses, strands of hair, and others.
  final FaceOccluded? faceOccluded;

  /// The predicted gender of a detected face.
  final Gender? gender;

  /// Indicates the location of landmarks on the face. Default attribute.
  final List<Landmark>? landmarks;

  /// Indicates whether or not the mouth on the face is open, and the confidence
  /// level in the determination.
  final MouthOpen? mouthOpen;

  /// Indicates whether or not the face has a mustache, and the confidence level
  /// in the determination.
  final Mustache? mustache;

  /// Indicates the pose of the face as determined by its pitch, roll, and yaw.
  /// Default attribute.
  final Pose? pose;

  /// Identifies image brightness and sharpness. Default attribute.
  final ImageQuality? quality;

  /// Indicates whether or not the face is smiling, and the confidence level in
  /// the determination.
  final Smile? smile;

  /// Indicates whether or not the face is wearing sunglasses, and the confidence
  /// level in the determination.
  final Sunglasses? sunglasses;

  FaceDetail({
    this.ageRange,
    this.beard,
    this.boundingBox,
    this.confidence,
    this.emotions,
    this.eyeDirection,
    this.eyeglasses,
    this.eyesOpen,
    this.faceOccluded,
    this.gender,
    this.landmarks,
    this.mouthOpen,
    this.mustache,
    this.pose,
    this.quality,
    this.smile,
    this.sunglasses,
  });

  factory FaceDetail.fromJson(Map<String, dynamic> json) {
    return FaceDetail(
      ageRange: json['AgeRange'] != null
          ? AgeRange.fromJson(json['AgeRange'] as Map<String, dynamic>)
          : null,
      beard: json['Beard'] != null
          ? Beard.fromJson(json['Beard'] as Map<String, dynamic>)
          : null,
      boundingBox: json['BoundingBox'] != null
          ? BoundingBox.fromJson(json['BoundingBox'] as Map<String, dynamic>)
          : null,
      confidence: json['Confidence'] as double?,
      emotions: (json['Emotions'] as List?)
          ?.whereNotNull()
          .map((e) => Emotion.fromJson(e as Map<String, dynamic>))
          .toList(),
      eyeDirection: json['EyeDirection'] != null
          ? EyeDirection.fromJson(json['EyeDirection'] as Map<String, dynamic>)
          : null,
      eyeglasses: json['Eyeglasses'] != null
          ? Eyeglasses.fromJson(json['Eyeglasses'] as Map<String, dynamic>)
          : null,
      eyesOpen: json['EyesOpen'] != null
          ? EyeOpen.fromJson(json['EyesOpen'] as Map<String, dynamic>)
          : null,
      faceOccluded: json['FaceOccluded'] != null
          ? FaceOccluded.fromJson(json['FaceOccluded'] as Map<String, dynamic>)
          : null,
      gender: json['Gender'] != null
          ? Gender.fromJson(json['Gender'] as Map<String, dynamic>)
          : null,
      landmarks: (json['Landmarks'] as List?)
          ?.whereNotNull()
          .map((e) => Landmark.fromJson(e as Map<String, dynamic>))
          .toList(),
      mouthOpen: json['MouthOpen'] != null
          ? MouthOpen.fromJson(json['MouthOpen'] as Map<String, dynamic>)
          : null,
      mustache: json['Mustache'] != null
          ? Mustache.fromJson(json['Mustache'] as Map<String, dynamic>)
          : null,
      pose: json['Pose'] != null
          ? Pose.fromJson(json['Pose'] as Map<String, dynamic>)
          : null,
      quality: json['Quality'] != null
          ? ImageQuality.fromJson(json['Quality'] as Map<String, dynamic>)
          : null,
      smile: json['Smile'] != null
          ? Smile.fromJson(json['Smile'] as Map<String, dynamic>)
          : null,
      sunglasses: json['Sunglasses'] != null
          ? Sunglasses.fromJson(json['Sunglasses'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final ageRange = this.ageRange;
    final beard = this.beard;
    final boundingBox = this.boundingBox;
    final confidence = this.confidence;
    final emotions = this.emotions;
    final eyeDirection = this.eyeDirection;
    final eyeglasses = this.eyeglasses;
    final eyesOpen = this.eyesOpen;
    final faceOccluded = this.faceOccluded;
    final gender = this.gender;
    final landmarks = this.landmarks;
    final mouthOpen = this.mouthOpen;
    final mustache = this.mustache;
    final pose = this.pose;
    final quality = this.quality;
    final smile = this.smile;
    final sunglasses = this.sunglasses;
    return {
      if (ageRange != null) 'AgeRange': ageRange,
      if (beard != null) 'Beard': beard,
      if (boundingBox != null) 'BoundingBox': boundingBox,
      if (confidence != null) 'Confidence': confidence,
      if (emotions != null) 'Emotions': emotions,
      if (eyeDirection != null) 'EyeDirection': eyeDirection,
      if (eyeglasses != null) 'Eyeglasses': eyeglasses,
      if (eyesOpen != null) 'EyesOpen': eyesOpen,
      if (faceOccluded != null) 'FaceOccluded': faceOccluded,
      if (gender != null) 'Gender': gender,
      if (landmarks != null) 'Landmarks': landmarks,
      if (mouthOpen != null) 'MouthOpen': mouthOpen,
      if (mustache != null) 'Mustache': mustache,
      if (pose != null) 'Pose': pose,
      if (quality != null) 'Quality': quality,
      if (smile != null) 'Smile': smile,
      if (sunglasses != null) 'Sunglasses': sunglasses,
    };
  }
}

/// Information about a face detected in a video analysis request and the time
/// the face was detected in the video.
class FaceDetection {
  /// The face properties for the detected face.
  final FaceDetail? face;

  /// Time, in milliseconds from the start of the video, that the face was
  /// detected. Note that <code>Timestamp</code> is not guaranteed to be accurate
  /// to the individual frame where the face first appears.
  final int? timestamp;

  FaceDetection({
    this.face,
    this.timestamp,
  });

  factory FaceDetection.fromJson(Map<String, dynamic> json) {
    return FaceDetection(
      face: json['Face'] != null
          ? FaceDetail.fromJson(json['Face'] as Map<String, dynamic>)
          : null,
      timestamp: json['Timestamp'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final face = this.face;
    final timestamp = this.timestamp;
    return {
      if (face != null) 'Face': face,
      if (timestamp != null) 'Timestamp': timestamp,
    };
  }
}

/// Provides face metadata. In addition, it also provides the confidence in the
/// match of this face with the input face.
class FaceMatch {
  /// Describes the face properties such as the bounding box, face ID, image ID of
  /// the source image, and external image ID that you assigned.
  final Face? face;

  /// Confidence in the match of this face with the input face.
  final double? similarity;

  FaceMatch({
    this.face,
    this.similarity,
  });

  factory FaceMatch.fromJson(Map<String, dynamic> json) {
    return FaceMatch(
      face: json['Face'] != null
          ? Face.fromJson(json['Face'] as Map<String, dynamic>)
          : null,
      similarity: json['Similarity'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final face = this.face;
    final similarity = this.similarity;
    return {
      if (face != null) 'Face': face,
      if (similarity != null) 'Similarity': similarity,
    };
  }
}

/// <code>FaceOccluded</code> should return "true" with a high confidence score
/// if a detected face’s eyes, nose, and mouth are partially captured or if they
/// are covered by masks, dark sunglasses, cell phones, hands, or other objects.
/// <code>FaceOccluded</code> should return "false" with a high confidence score
/// if common occurrences that do not impact face verification are detected,
/// such as eye glasses, lightly tinted sunglasses, strands of hair, and others.
///
/// You can use <code>FaceOccluded</code> to determine if an obstruction on a
/// face negatively impacts using the image for face matching.
class FaceOccluded {
  /// The confidence that the service has detected the presence of a face
  /// occlusion.
  final double? confidence;

  /// True if a detected face’s eyes, nose, and mouth are partially captured or if
  /// they are covered by masks, dark sunglasses, cell phones, hands, or other
  /// objects. False if common occurrences that do not impact face verification
  /// are detected, such as eye glasses, lightly tinted sunglasses, strands of
  /// hair, and others.
  final bool? value;

  FaceOccluded({
    this.confidence,
    this.value,
  });

  factory FaceOccluded.fromJson(Map<String, dynamic> json) {
    return FaceOccluded(
      confidence: json['Confidence'] as double?,
      value: json['Value'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final confidence = this.confidence;
    final value = this.value;
    return {
      if (confidence != null) 'Confidence': confidence,
      if (value != null) 'Value': value,
    };
  }
}

/// Object containing both the face metadata (stored in the backend database),
/// and facial attributes that are detected but aren't stored in the database.
class FaceRecord {
  /// Describes the face properties such as the bounding box, face ID, image ID of
  /// the input image, and external image ID that you assigned.
  final Face? face;

  /// Structure containing attributes of the face that the algorithm detected.
  final FaceDetail? faceDetail;

  FaceRecord({
    this.face,
    this.faceDetail,
  });

  factory FaceRecord.fromJson(Map<String, dynamic> json) {
    return FaceRecord(
      face: json['Face'] != null
          ? Face.fromJson(json['Face'] as Map<String, dynamic>)
          : null,
      faceDetail: json['FaceDetail'] != null
          ? FaceDetail.fromJson(json['FaceDetail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final face = this.face;
    final faceDetail = this.faceDetail;
    return {
      if (face != null) 'Face': face,
      if (faceDetail != null) 'FaceDetail': faceDetail,
    };
  }
}

/// Input face recognition parameters for an Amazon Rekognition stream
/// processor. Includes the collection to use for face recognition and the face
/// attributes to detect. Defining the settings is required in the request
/// parameter for <a>CreateStreamProcessor</a>.
class FaceSearchSettings {
  /// The ID of a collection that contains faces that you want to search for.
  final String? collectionId;

  /// Minimum face match confidence score that must be met to return a result for
  /// a recognized face. The default is 80. 0 is the lowest confidence. 100 is the
  /// highest confidence. Values between 0 and 100 are accepted, and values lower
  /// than 80 are set to 80.
  final double? faceMatchThreshold;

  FaceSearchSettings({
    this.collectionId,
    this.faceMatchThreshold,
  });

  factory FaceSearchSettings.fromJson(Map<String, dynamic> json) {
    return FaceSearchSettings(
      collectionId: json['CollectionId'] as String?,
      faceMatchThreshold: json['FaceMatchThreshold'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final collectionId = this.collectionId;
    final faceMatchThreshold = this.faceMatchThreshold;
    return {
      if (collectionId != null) 'CollectionId': collectionId,
      if (faceMatchThreshold != null) 'FaceMatchThreshold': faceMatchThreshold,
    };
  }
}

enum FaceSearchSortBy {
  $index,
  timestamp,
}

extension FaceSearchSortByValueExtension on FaceSearchSortBy {
  String toValue() {
    switch (this) {
      case FaceSearchSortBy.$index:
        return 'INDEX';
      case FaceSearchSortBy.timestamp:
        return 'TIMESTAMP';
    }
  }
}

extension FaceSearchSortByFromString on String {
  FaceSearchSortBy toFaceSearchSortBy() {
    switch (this) {
      case 'INDEX':
        return FaceSearchSortBy.$index;
      case 'TIMESTAMP':
        return FaceSearchSortBy.timestamp;
    }
    throw Exception('$this is not known in enum FaceSearchSortBy');
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
/// impact an individual's rights, privacy, or access to services.
class Gender {
  /// Level of confidence in the prediction.
  final double? confidence;

  /// The predicted gender of the face.
  final GenderType? value;

  Gender({
    this.confidence,
    this.value,
  });

  factory Gender.fromJson(Map<String, dynamic> json) {
    return Gender(
      confidence: json['Confidence'] as double?,
      value: (json['Value'] as String?)?.toGenderType(),
    );
  }

  Map<String, dynamic> toJson() {
    final confidence = this.confidence;
    final value = this.value;
    return {
      if (confidence != null) 'Confidence': confidence,
      if (value != null) 'Value': value.toValue(),
    };
  }
}

enum GenderType {
  male,
  female,
}

extension GenderTypeValueExtension on GenderType {
  String toValue() {
    switch (this) {
      case GenderType.male:
        return 'Male';
      case GenderType.female:
        return 'Female';
    }
  }
}

extension GenderTypeFromString on String {
  GenderType toGenderType() {
    switch (this) {
      case 'Male':
        return GenderType.male;
      case 'Female':
        return GenderType.female;
    }
    throw Exception('$this is not known in enum GenderType');
  }
}

/// Contains filters for the object labels returned by DetectLabels. Filters can
/// be inclusive, exclusive, or a combination of both and can be applied to
/// individual labels or entire label categories. To see a list of label
/// categories, see <a
/// href="https://docs.aws.amazon.com/rekognition/latest/dg/labels.html">Detecting
/// Labels</a>.
class GeneralLabelsSettings {
  /// The label categories that should be excluded from the return from
  /// DetectLabels.
  final List<String>? labelCategoryExclusionFilters;

  /// The label categories that should be included in the return from
  /// DetectLabels.
  final List<String>? labelCategoryInclusionFilters;

  /// The labels that should be excluded from the return from DetectLabels.
  final List<String>? labelExclusionFilters;

  /// The labels that should be included in the return from DetectLabels.
  final List<String>? labelInclusionFilters;

  GeneralLabelsSettings({
    this.labelCategoryExclusionFilters,
    this.labelCategoryInclusionFilters,
    this.labelExclusionFilters,
    this.labelInclusionFilters,
  });

  Map<String, dynamic> toJson() {
    final labelCategoryExclusionFilters = this.labelCategoryExclusionFilters;
    final labelCategoryInclusionFilters = this.labelCategoryInclusionFilters;
    final labelExclusionFilters = this.labelExclusionFilters;
    final labelInclusionFilters = this.labelInclusionFilters;
    return {
      if (labelCategoryExclusionFilters != null)
        'LabelCategoryExclusionFilters': labelCategoryExclusionFilters,
      if (labelCategoryInclusionFilters != null)
        'LabelCategoryInclusionFilters': labelCategoryInclusionFilters,
      if (labelExclusionFilters != null)
        'LabelExclusionFilters': labelExclusionFilters,
      if (labelInclusionFilters != null)
        'LabelInclusionFilters': labelInclusionFilters,
    };
  }
}

/// Information about where an object (<a>DetectCustomLabels</a>) or text
/// (<a>DetectText</a>) is located on an image.
class Geometry {
  /// An axis-aligned coarse representation of the detected item's location on the
  /// image.
  final BoundingBox? boundingBox;

  /// Within the bounding box, a fine-grained polygon around the detected item.
  final List<Point>? polygon;

  Geometry({
    this.boundingBox,
    this.polygon,
  });

  factory Geometry.fromJson(Map<String, dynamic> json) {
    return Geometry(
      boundingBox: json['BoundingBox'] != null
          ? BoundingBox.fromJson(json['BoundingBox'] as Map<String, dynamic>)
          : null,
      polygon: (json['Polygon'] as List?)
          ?.whereNotNull()
          .map((e) => Point.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final boundingBox = this.boundingBox;
    final polygon = this.polygon;
    return {
      if (boundingBox != null) 'BoundingBox': boundingBox,
      if (polygon != null) 'Polygon': polygon,
    };
  }
}

class GetCelebrityInfoResponse {
  /// Retrieves the known gender for the celebrity.
  final KnownGender? knownGender;

  /// The name of the celebrity.
  final String? name;

  /// An array of URLs pointing to additional celebrity information.
  final List<String>? urls;

  GetCelebrityInfoResponse({
    this.knownGender,
    this.name,
    this.urls,
  });

  factory GetCelebrityInfoResponse.fromJson(Map<String, dynamic> json) {
    return GetCelebrityInfoResponse(
      knownGender: json['KnownGender'] != null
          ? KnownGender.fromJson(json['KnownGender'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      urls: (json['Urls'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final knownGender = this.knownGender;
    final name = this.name;
    final urls = this.urls;
    return {
      if (knownGender != null) 'KnownGender': knownGender,
      if (name != null) 'Name': name,
      if (urls != null) 'Urls': urls,
    };
  }
}

class GetCelebrityRecognitionResponse {
  /// Array of celebrities recognized in the video.
  final List<CelebrityRecognition>? celebrities;

  /// Job identifier for the celebrity recognition operation for which you want to
  /// obtain results. The job identifer is returned by an initial call to
  /// StartCelebrityRecognition.
  final String? jobId;

  /// The current status of the celebrity recognition job.
  final VideoJobStatus? jobStatus;

  /// A job identifier specified in the call to StartCelebrityRecognition and
  /// returned in the job completion notification sent to your Amazon Simple
  /// Notification Service topic.
  final String? jobTag;

  /// If the response is truncated, Amazon Rekognition Video returns this token
  /// that you can use in the subsequent request to retrieve the next set of
  /// celebrities.
  final String? nextToken;

  /// If the job fails, <code>StatusMessage</code> provides a descriptive error
  /// message.
  final String? statusMessage;
  final Video? video;

  /// Information about a video that Amazon Rekognition Video analyzed.
  /// <code>Videometadata</code> is returned in every page of paginated responses
  /// from a Amazon Rekognition Video operation.
  final VideoMetadata? videoMetadata;

  GetCelebrityRecognitionResponse({
    this.celebrities,
    this.jobId,
    this.jobStatus,
    this.jobTag,
    this.nextToken,
    this.statusMessage,
    this.video,
    this.videoMetadata,
  });

  factory GetCelebrityRecognitionResponse.fromJson(Map<String, dynamic> json) {
    return GetCelebrityRecognitionResponse(
      celebrities: (json['Celebrities'] as List?)
          ?.whereNotNull()
          .map((e) => CelebrityRecognition.fromJson(e as Map<String, dynamic>))
          .toList(),
      jobId: json['JobId'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toVideoJobStatus(),
      jobTag: json['JobTag'] as String?,
      nextToken: json['NextToken'] as String?,
      statusMessage: json['StatusMessage'] as String?,
      video: json['Video'] != null
          ? Video.fromJson(json['Video'] as Map<String, dynamic>)
          : null,
      videoMetadata: json['VideoMetadata'] != null
          ? VideoMetadata.fromJson(
              json['VideoMetadata'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final celebrities = this.celebrities;
    final jobId = this.jobId;
    final jobStatus = this.jobStatus;
    final jobTag = this.jobTag;
    final nextToken = this.nextToken;
    final statusMessage = this.statusMessage;
    final video = this.video;
    final videoMetadata = this.videoMetadata;
    return {
      if (celebrities != null) 'Celebrities': celebrities,
      if (jobId != null) 'JobId': jobId,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
      if (jobTag != null) 'JobTag': jobTag,
      if (nextToken != null) 'NextToken': nextToken,
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (video != null) 'Video': video,
      if (videoMetadata != null) 'VideoMetadata': videoMetadata,
    };
  }
}

/// Contains metadata about a content moderation request, including the SortBy
/// and AggregateBy options.
class GetContentModerationRequestMetadata {
  /// The aggregation method chosen for a GetContentModeration request.
  final ContentModerationAggregateBy? aggregateBy;

  /// The sorting method chosen for a GetContentModeration request.
  final ContentModerationSortBy? sortBy;

  GetContentModerationRequestMetadata({
    this.aggregateBy,
    this.sortBy,
  });

  factory GetContentModerationRequestMetadata.fromJson(
      Map<String, dynamic> json) {
    return GetContentModerationRequestMetadata(
      aggregateBy:
          (json['AggregateBy'] as String?)?.toContentModerationAggregateBy(),
      sortBy: (json['SortBy'] as String?)?.toContentModerationSortBy(),
    );
  }

  Map<String, dynamic> toJson() {
    final aggregateBy = this.aggregateBy;
    final sortBy = this.sortBy;
    return {
      if (aggregateBy != null) 'AggregateBy': aggregateBy.toValue(),
      if (sortBy != null) 'SortBy': sortBy.toValue(),
    };
  }
}

class GetContentModerationResponse {
  /// Information about the paramters used when getting a response. Includes
  /// information on aggregation and sorting methods.
  final GetContentModerationRequestMetadata? getRequestMetadata;

  /// Job identifier for the content moderation operation for which you want to
  /// obtain results. The job identifer is returned by an initial call to
  /// StartContentModeration.
  final String? jobId;

  /// The current status of the content moderation analysis job.
  final VideoJobStatus? jobStatus;

  /// A job identifier specified in the call to StartContentModeration and
  /// returned in the job completion notification sent to your Amazon Simple
  /// Notification Service topic.
  final String? jobTag;

  /// The detected inappropriate, unwanted, or offensive content moderation labels
  /// and the time(s) they were detected.
  final List<ContentModerationDetection>? moderationLabels;

  /// Version number of the moderation detection model that was used to detect
  /// inappropriate, unwanted, or offensive content.
  final String? moderationModelVersion;

  /// If the response is truncated, Amazon Rekognition Video returns this token
  /// that you can use in the subsequent request to retrieve the next set of
  /// content moderation labels.
  final String? nextToken;

  /// If the job fails, <code>StatusMessage</code> provides a descriptive error
  /// message.
  final String? statusMessage;
  final Video? video;

  /// Information about a video that Amazon Rekognition analyzed.
  /// <code>Videometadata</code> is returned in every page of paginated responses
  /// from <code>GetContentModeration</code>.
  final VideoMetadata? videoMetadata;

  GetContentModerationResponse({
    this.getRequestMetadata,
    this.jobId,
    this.jobStatus,
    this.jobTag,
    this.moderationLabels,
    this.moderationModelVersion,
    this.nextToken,
    this.statusMessage,
    this.video,
    this.videoMetadata,
  });

  factory GetContentModerationResponse.fromJson(Map<String, dynamic> json) {
    return GetContentModerationResponse(
      getRequestMetadata: json['GetRequestMetadata'] != null
          ? GetContentModerationRequestMetadata.fromJson(
              json['GetRequestMetadata'] as Map<String, dynamic>)
          : null,
      jobId: json['JobId'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toVideoJobStatus(),
      jobTag: json['JobTag'] as String?,
      moderationLabels: (json['ModerationLabels'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ContentModerationDetection.fromJson(e as Map<String, dynamic>))
          .toList(),
      moderationModelVersion: json['ModerationModelVersion'] as String?,
      nextToken: json['NextToken'] as String?,
      statusMessage: json['StatusMessage'] as String?,
      video: json['Video'] != null
          ? Video.fromJson(json['Video'] as Map<String, dynamic>)
          : null,
      videoMetadata: json['VideoMetadata'] != null
          ? VideoMetadata.fromJson(
              json['VideoMetadata'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final getRequestMetadata = this.getRequestMetadata;
    final jobId = this.jobId;
    final jobStatus = this.jobStatus;
    final jobTag = this.jobTag;
    final moderationLabels = this.moderationLabels;
    final moderationModelVersion = this.moderationModelVersion;
    final nextToken = this.nextToken;
    final statusMessage = this.statusMessage;
    final video = this.video;
    final videoMetadata = this.videoMetadata;
    return {
      if (getRequestMetadata != null) 'GetRequestMetadata': getRequestMetadata,
      if (jobId != null) 'JobId': jobId,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
      if (jobTag != null) 'JobTag': jobTag,
      if (moderationLabels != null) 'ModerationLabels': moderationLabels,
      if (moderationModelVersion != null)
        'ModerationModelVersion': moderationModelVersion,
      if (nextToken != null) 'NextToken': nextToken,
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (video != null) 'Video': video,
      if (videoMetadata != null) 'VideoMetadata': videoMetadata,
    };
  }
}

class GetFaceDetectionResponse {
  /// An array of faces detected in the video. Each element contains a detected
  /// face's details and the time, in milliseconds from the start of the video,
  /// the face was detected.
  final List<FaceDetection>? faces;

  /// Job identifier for the face detection operation for which you want to obtain
  /// results. The job identifer is returned by an initial call to
  /// StartFaceDetection.
  final String? jobId;

  /// The current status of the face detection job.
  final VideoJobStatus? jobStatus;

  /// A job identifier specified in the call to StartFaceDetection and returned in
  /// the job completion notification sent to your Amazon Simple Notification
  /// Service topic.
  final String? jobTag;

  /// If the response is truncated, Amazon Rekognition returns this token that you
  /// can use in the subsequent request to retrieve the next set of faces.
  final String? nextToken;

  /// If the job fails, <code>StatusMessage</code> provides a descriptive error
  /// message.
  final String? statusMessage;
  final Video? video;

  /// Information about a video that Amazon Rekognition Video analyzed.
  /// <code>Videometadata</code> is returned in every page of paginated responses
  /// from a Amazon Rekognition video operation.
  final VideoMetadata? videoMetadata;

  GetFaceDetectionResponse({
    this.faces,
    this.jobId,
    this.jobStatus,
    this.jobTag,
    this.nextToken,
    this.statusMessage,
    this.video,
    this.videoMetadata,
  });

  factory GetFaceDetectionResponse.fromJson(Map<String, dynamic> json) {
    return GetFaceDetectionResponse(
      faces: (json['Faces'] as List?)
          ?.whereNotNull()
          .map((e) => FaceDetection.fromJson(e as Map<String, dynamic>))
          .toList(),
      jobId: json['JobId'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toVideoJobStatus(),
      jobTag: json['JobTag'] as String?,
      nextToken: json['NextToken'] as String?,
      statusMessage: json['StatusMessage'] as String?,
      video: json['Video'] != null
          ? Video.fromJson(json['Video'] as Map<String, dynamic>)
          : null,
      videoMetadata: json['VideoMetadata'] != null
          ? VideoMetadata.fromJson(
              json['VideoMetadata'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final faces = this.faces;
    final jobId = this.jobId;
    final jobStatus = this.jobStatus;
    final jobTag = this.jobTag;
    final nextToken = this.nextToken;
    final statusMessage = this.statusMessage;
    final video = this.video;
    final videoMetadata = this.videoMetadata;
    return {
      if (faces != null) 'Faces': faces,
      if (jobId != null) 'JobId': jobId,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
      if (jobTag != null) 'JobTag': jobTag,
      if (nextToken != null) 'NextToken': nextToken,
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (video != null) 'Video': video,
      if (videoMetadata != null) 'VideoMetadata': videoMetadata,
    };
  }
}

class GetFaceLivenessSessionResultsResponse {
  /// The sessionId for which this request was called.
  final String sessionId;

  /// Represents a status corresponding to the state of the session. Possible
  /// statuses are: CREATED, IN_PROGRESS, SUCCEEDED, FAILED, EXPIRED.
  final LivenessSessionStatus status;

  /// A set of images from the Face Liveness video that can be used for audit
  /// purposes. It includes a bounding box of the face and the Base64-encoded
  /// bytes that return an image. If the CreateFaceLivenessSession request
  /// included an OutputConfig argument, the image will be uploaded to an S3Object
  /// specified in the output configuration. If no Amazon S3 bucket is defined,
  /// raw bytes are sent instead.
  final List<AuditImage>? auditImages;

  /// Probabalistic confidence score for if the person in the given video was
  /// live, represented as a float value between 0 to 100.
  final double? confidence;

  /// A high-quality image from the Face Liveness video that can be used for face
  /// comparison or search. It includes a bounding box of the face and the
  /// Base64-encoded bytes that return an image. If the CreateFaceLivenessSession
  /// request included an OutputConfig argument, the image will be uploaded to an
  /// S3Object specified in the output configuration. In case the reference image
  /// is not returned, it's recommended to retry the Liveness check.
  final AuditImage? referenceImage;

  GetFaceLivenessSessionResultsResponse({
    required this.sessionId,
    required this.status,
    this.auditImages,
    this.confidence,
    this.referenceImage,
  });

  factory GetFaceLivenessSessionResultsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetFaceLivenessSessionResultsResponse(
      sessionId: json['SessionId'] as String,
      status: (json['Status'] as String).toLivenessSessionStatus(),
      auditImages: (json['AuditImages'] as List?)
          ?.whereNotNull()
          .map((e) => AuditImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      confidence: json['Confidence'] as double?,
      referenceImage: json['ReferenceImage'] != null
          ? AuditImage.fromJson(json['ReferenceImage'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sessionId = this.sessionId;
    final status = this.status;
    final auditImages = this.auditImages;
    final confidence = this.confidence;
    final referenceImage = this.referenceImage;
    return {
      'SessionId': sessionId,
      'Status': status.toValue(),
      if (auditImages != null) 'AuditImages': auditImages,
      if (confidence != null) 'Confidence': confidence,
      if (referenceImage != null) 'ReferenceImage': referenceImage,
    };
  }
}

class GetFaceSearchResponse {
  /// Job identifier for the face search operation for which you want to obtain
  /// results. The job identifer is returned by an initial call to
  /// StartFaceSearch.
  final String? jobId;

  /// The current status of the face search job.
  final VideoJobStatus? jobStatus;

  /// A job identifier specified in the call to StartFaceSearch and returned in
  /// the job completion notification sent to your Amazon Simple Notification
  /// Service topic.
  final String? jobTag;

  /// If the response is truncated, Amazon Rekognition Video returns this token
  /// that you can use in the subsequent request to retrieve the next set of
  /// search results.
  final String? nextToken;

  /// An array of persons, <a>PersonMatch</a>, in the video whose face(s) match
  /// the face(s) in an Amazon Rekognition collection. It also includes time
  /// information for when persons are matched in the video. You specify the input
  /// collection in an initial call to <code>StartFaceSearch</code>. Each
  /// <code>Persons</code> element includes a time the person was matched, face
  /// match details (<code>FaceMatches</code>) for matching faces in the
  /// collection, and person information (<code>Person</code>) for the matched
  /// person.
  final List<PersonMatch>? persons;

  /// If the job fails, <code>StatusMessage</code> provides a descriptive error
  /// message.
  final String? statusMessage;
  final Video? video;

  /// Information about a video that Amazon Rekognition analyzed.
  /// <code>Videometadata</code> is returned in every page of paginated responses
  /// from a Amazon Rekognition Video operation.
  final VideoMetadata? videoMetadata;

  GetFaceSearchResponse({
    this.jobId,
    this.jobStatus,
    this.jobTag,
    this.nextToken,
    this.persons,
    this.statusMessage,
    this.video,
    this.videoMetadata,
  });

  factory GetFaceSearchResponse.fromJson(Map<String, dynamic> json) {
    return GetFaceSearchResponse(
      jobId: json['JobId'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toVideoJobStatus(),
      jobTag: json['JobTag'] as String?,
      nextToken: json['NextToken'] as String?,
      persons: (json['Persons'] as List?)
          ?.whereNotNull()
          .map((e) => PersonMatch.fromJson(e as Map<String, dynamic>))
          .toList(),
      statusMessage: json['StatusMessage'] as String?,
      video: json['Video'] != null
          ? Video.fromJson(json['Video'] as Map<String, dynamic>)
          : null,
      videoMetadata: json['VideoMetadata'] != null
          ? VideoMetadata.fromJson(
              json['VideoMetadata'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    final jobStatus = this.jobStatus;
    final jobTag = this.jobTag;
    final nextToken = this.nextToken;
    final persons = this.persons;
    final statusMessage = this.statusMessage;
    final video = this.video;
    final videoMetadata = this.videoMetadata;
    return {
      if (jobId != null) 'JobId': jobId,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
      if (jobTag != null) 'JobTag': jobTag,
      if (nextToken != null) 'NextToken': nextToken,
      if (persons != null) 'Persons': persons,
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (video != null) 'Video': video,
      if (videoMetadata != null) 'VideoMetadata': videoMetadata,
    };
  }
}

/// Contains metadata about a label detection request, including the SortBy and
/// AggregateBy options.
class GetLabelDetectionRequestMetadata {
  /// The aggregation method chosen for a GetLabelDetection request.
  final LabelDetectionAggregateBy? aggregateBy;

  /// The sorting method chosen for a GetLabelDetection request.
  final LabelDetectionSortBy? sortBy;

  GetLabelDetectionRequestMetadata({
    this.aggregateBy,
    this.sortBy,
  });

  factory GetLabelDetectionRequestMetadata.fromJson(Map<String, dynamic> json) {
    return GetLabelDetectionRequestMetadata(
      aggregateBy:
          (json['AggregateBy'] as String?)?.toLabelDetectionAggregateBy(),
      sortBy: (json['SortBy'] as String?)?.toLabelDetectionSortBy(),
    );
  }

  Map<String, dynamic> toJson() {
    final aggregateBy = this.aggregateBy;
    final sortBy = this.sortBy;
    return {
      if (aggregateBy != null) 'AggregateBy': aggregateBy.toValue(),
      if (sortBy != null) 'SortBy': sortBy.toValue(),
    };
  }
}

class GetLabelDetectionResponse {
  /// Information about the paramters used when getting a response. Includes
  /// information on aggregation and sorting methods.
  final GetLabelDetectionRequestMetadata? getRequestMetadata;

  /// Job identifier for the label detection operation for which you want to
  /// obtain results. The job identifer is returned by an initial call to
  /// StartLabelDetection.
  final String? jobId;

  /// The current status of the label detection job.
  final VideoJobStatus? jobStatus;

  /// A job identifier specified in the call to StartLabelDetection and returned
  /// in the job completion notification sent to your Amazon Simple Notification
  /// Service topic.
  final String? jobTag;

  /// Version number of the label detection model that was used to detect labels.
  final String? labelModelVersion;

  /// An array of labels detected in the video. Each element contains the detected
  /// label and the time, in milliseconds from the start of the video, that the
  /// label was detected.
  final List<LabelDetection>? labels;

  /// If the response is truncated, Amazon Rekognition Video returns this token
  /// that you can use in the subsequent request to retrieve the next set of
  /// labels.
  final String? nextToken;

  /// If the job fails, <code>StatusMessage</code> provides a descriptive error
  /// message.
  final String? statusMessage;
  final Video? video;

  /// Information about a video that Amazon Rekognition Video analyzed.
  /// <code>Videometadata</code> is returned in every page of paginated responses
  /// from a Amazon Rekognition video operation.
  final VideoMetadata? videoMetadata;

  GetLabelDetectionResponse({
    this.getRequestMetadata,
    this.jobId,
    this.jobStatus,
    this.jobTag,
    this.labelModelVersion,
    this.labels,
    this.nextToken,
    this.statusMessage,
    this.video,
    this.videoMetadata,
  });

  factory GetLabelDetectionResponse.fromJson(Map<String, dynamic> json) {
    return GetLabelDetectionResponse(
      getRequestMetadata: json['GetRequestMetadata'] != null
          ? GetLabelDetectionRequestMetadata.fromJson(
              json['GetRequestMetadata'] as Map<String, dynamic>)
          : null,
      jobId: json['JobId'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toVideoJobStatus(),
      jobTag: json['JobTag'] as String?,
      labelModelVersion: json['LabelModelVersion'] as String?,
      labels: (json['Labels'] as List?)
          ?.whereNotNull()
          .map((e) => LabelDetection.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      statusMessage: json['StatusMessage'] as String?,
      video: json['Video'] != null
          ? Video.fromJson(json['Video'] as Map<String, dynamic>)
          : null,
      videoMetadata: json['VideoMetadata'] != null
          ? VideoMetadata.fromJson(
              json['VideoMetadata'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final getRequestMetadata = this.getRequestMetadata;
    final jobId = this.jobId;
    final jobStatus = this.jobStatus;
    final jobTag = this.jobTag;
    final labelModelVersion = this.labelModelVersion;
    final labels = this.labels;
    final nextToken = this.nextToken;
    final statusMessage = this.statusMessage;
    final video = this.video;
    final videoMetadata = this.videoMetadata;
    return {
      if (getRequestMetadata != null) 'GetRequestMetadata': getRequestMetadata,
      if (jobId != null) 'JobId': jobId,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
      if (jobTag != null) 'JobTag': jobTag,
      if (labelModelVersion != null) 'LabelModelVersion': labelModelVersion,
      if (labels != null) 'Labels': labels,
      if (nextToken != null) 'NextToken': nextToken,
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (video != null) 'Video': video,
      if (videoMetadata != null) 'VideoMetadata': videoMetadata,
    };
  }
}

class GetMediaAnalysisJobResponse {
  /// The Unix date and time when the job was started.
  final DateTime creationTimestamp;

  /// Reference to the input manifest that was provided in the job creation
  /// request.
  final MediaAnalysisInput input;

  /// The identifier for the media analysis job.
  final String jobId;

  /// Operation configurations that were provided during job creation.
  final MediaAnalysisOperationsConfig operationsConfig;

  /// Output configuration that was provided in the creation request.
  final MediaAnalysisOutputConfig outputConfig;

  /// The current status of the media analysis job.
  final MediaAnalysisJobStatus status;

  /// The Unix date and time when the job finished.
  final DateTime? completionTimestamp;

  /// Details about the error that resulted in failure of the job.
  final MediaAnalysisJobFailureDetails? failureDetails;

  /// The name of the media analysis job.
  final String? jobName;

  /// KMS Key that was provided in the creation request.
  final String? kmsKeyId;

  /// The summary manifest provides statistics on input manifest and errors
  /// identified in the input manifest.
  final MediaAnalysisManifestSummary? manifestSummary;

  /// Output manifest that contains prediction results.
  final MediaAnalysisResults? results;

  GetMediaAnalysisJobResponse({
    required this.creationTimestamp,
    required this.input,
    required this.jobId,
    required this.operationsConfig,
    required this.outputConfig,
    required this.status,
    this.completionTimestamp,
    this.failureDetails,
    this.jobName,
    this.kmsKeyId,
    this.manifestSummary,
    this.results,
  });

  factory GetMediaAnalysisJobResponse.fromJson(Map<String, dynamic> json) {
    return GetMediaAnalysisJobResponse(
      creationTimestamp:
          nonNullableTimeStampFromJson(json['CreationTimestamp'] as Object),
      input: MediaAnalysisInput.fromJson(json['Input'] as Map<String, dynamic>),
      jobId: json['JobId'] as String,
      operationsConfig: MediaAnalysisOperationsConfig.fromJson(
          json['OperationsConfig'] as Map<String, dynamic>),
      outputConfig: MediaAnalysisOutputConfig.fromJson(
          json['OutputConfig'] as Map<String, dynamic>),
      status: (json['Status'] as String).toMediaAnalysisJobStatus(),
      completionTimestamp: timeStampFromJson(json['CompletionTimestamp']),
      failureDetails: json['FailureDetails'] != null
          ? MediaAnalysisJobFailureDetails.fromJson(
              json['FailureDetails'] as Map<String, dynamic>)
          : null,
      jobName: json['JobName'] as String?,
      kmsKeyId: json['KmsKeyId'] as String?,
      manifestSummary: json['ManifestSummary'] != null
          ? MediaAnalysisManifestSummary.fromJson(
              json['ManifestSummary'] as Map<String, dynamic>)
          : null,
      results: json['Results'] != null
          ? MediaAnalysisResults.fromJson(
              json['Results'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTimestamp = this.creationTimestamp;
    final input = this.input;
    final jobId = this.jobId;
    final operationsConfig = this.operationsConfig;
    final outputConfig = this.outputConfig;
    final status = this.status;
    final completionTimestamp = this.completionTimestamp;
    final failureDetails = this.failureDetails;
    final jobName = this.jobName;
    final kmsKeyId = this.kmsKeyId;
    final manifestSummary = this.manifestSummary;
    final results = this.results;
    return {
      'CreationTimestamp': unixTimestampToJson(creationTimestamp),
      'Input': input,
      'JobId': jobId,
      'OperationsConfig': operationsConfig,
      'OutputConfig': outputConfig,
      'Status': status.toValue(),
      if (completionTimestamp != null)
        'CompletionTimestamp': unixTimestampToJson(completionTimestamp),
      if (failureDetails != null) 'FailureDetails': failureDetails,
      if (jobName != null) 'JobName': jobName,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (manifestSummary != null) 'ManifestSummary': manifestSummary,
      if (results != null) 'Results': results,
    };
  }
}

class GetPersonTrackingResponse {
  /// Job identifier for the person tracking operation for which you want to
  /// obtain results. The job identifer is returned by an initial call to
  /// StartPersonTracking.
  final String? jobId;

  /// The current status of the person tracking job.
  final VideoJobStatus? jobStatus;

  /// A job identifier specified in the call to StartCelebrityRecognition and
  /// returned in the job completion notification sent to your Amazon Simple
  /// Notification Service topic.
  final String? jobTag;

  /// If the response is truncated, Amazon Rekognition Video returns this token
  /// that you can use in the subsequent request to retrieve the next set of
  /// persons.
  final String? nextToken;

  /// An array of the persons detected in the video and the time(s) their path was
  /// tracked throughout the video. An array element will exist for each time a
  /// person's path is tracked.
  final List<PersonDetection>? persons;

  /// If the job fails, <code>StatusMessage</code> provides a descriptive error
  /// message.
  final String? statusMessage;
  final Video? video;

  /// Information about a video that Amazon Rekognition Video analyzed.
  /// <code>Videometadata</code> is returned in every page of paginated responses
  /// from a Amazon Rekognition Video operation.
  final VideoMetadata? videoMetadata;

  GetPersonTrackingResponse({
    this.jobId,
    this.jobStatus,
    this.jobTag,
    this.nextToken,
    this.persons,
    this.statusMessage,
    this.video,
    this.videoMetadata,
  });

  factory GetPersonTrackingResponse.fromJson(Map<String, dynamic> json) {
    return GetPersonTrackingResponse(
      jobId: json['JobId'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toVideoJobStatus(),
      jobTag: json['JobTag'] as String?,
      nextToken: json['NextToken'] as String?,
      persons: (json['Persons'] as List?)
          ?.whereNotNull()
          .map((e) => PersonDetection.fromJson(e as Map<String, dynamic>))
          .toList(),
      statusMessage: json['StatusMessage'] as String?,
      video: json['Video'] != null
          ? Video.fromJson(json['Video'] as Map<String, dynamic>)
          : null,
      videoMetadata: json['VideoMetadata'] != null
          ? VideoMetadata.fromJson(
              json['VideoMetadata'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    final jobStatus = this.jobStatus;
    final jobTag = this.jobTag;
    final nextToken = this.nextToken;
    final persons = this.persons;
    final statusMessage = this.statusMessage;
    final video = this.video;
    final videoMetadata = this.videoMetadata;
    return {
      if (jobId != null) 'JobId': jobId,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
      if (jobTag != null) 'JobTag': jobTag,
      if (nextToken != null) 'NextToken': nextToken,
      if (persons != null) 'Persons': persons,
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (video != null) 'Video': video,
      if (videoMetadata != null) 'VideoMetadata': videoMetadata,
    };
  }
}

class GetSegmentDetectionResponse {
  /// An array of objects. There can be multiple audio streams. Each
  /// <code>AudioMetadata</code> object contains metadata for a single audio
  /// stream. Audio information in an <code>AudioMetadata</code> objects includes
  /// the audio codec, the number of audio channels, the duration of the audio
  /// stream, and the sample rate. Audio metadata is returned in each page of
  /// information returned by <code>GetSegmentDetection</code>.
  final List<AudioMetadata>? audioMetadata;

  /// Job identifier for the segment detection operation for which you want to
  /// obtain results. The job identifer is returned by an initial call to
  /// StartSegmentDetection.
  final String? jobId;

  /// Current status of the segment detection job.
  final VideoJobStatus? jobStatus;

  /// A job identifier specified in the call to StartSegmentDetection and returned
  /// in the job completion notification sent to your Amazon Simple Notification
  /// Service topic.
  final String? jobTag;

  /// If the previous response was incomplete (because there are more labels to
  /// retrieve), Amazon Rekognition Video returns a pagination token in the
  /// response. You can use this pagination token to retrieve the next set of
  /// text.
  final String? nextToken;

  /// An array of segments detected in a video. The array is sorted by the segment
  /// types (TECHNICAL_CUE or SHOT) specified in the <code>SegmentTypes</code>
  /// input parameter of <code>StartSegmentDetection</code>. Within each segment
  /// type the array is sorted by timestamp values.
  final List<SegmentDetection>? segments;

  /// An array containing the segment types requested in the call to
  /// <code>StartSegmentDetection</code>.
  final List<SegmentTypeInfo>? selectedSegmentTypes;

  /// If the job fails, <code>StatusMessage</code> provides a descriptive error
  /// message.
  final String? statusMessage;
  final Video? video;

  /// Currently, Amazon Rekognition Video returns a single object in the
  /// <code>VideoMetadata</code> array. The object contains information about the
  /// video stream in the input file that Amazon Rekognition Video chose to
  /// analyze. The <code>VideoMetadata</code> object includes the video codec,
  /// video format and other information. Video metadata is returned in each page
  /// of information returned by <code>GetSegmentDetection</code>.
  final List<VideoMetadata>? videoMetadata;

  GetSegmentDetectionResponse({
    this.audioMetadata,
    this.jobId,
    this.jobStatus,
    this.jobTag,
    this.nextToken,
    this.segments,
    this.selectedSegmentTypes,
    this.statusMessage,
    this.video,
    this.videoMetadata,
  });

  factory GetSegmentDetectionResponse.fromJson(Map<String, dynamic> json) {
    return GetSegmentDetectionResponse(
      audioMetadata: (json['AudioMetadata'] as List?)
          ?.whereNotNull()
          .map((e) => AudioMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      jobId: json['JobId'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toVideoJobStatus(),
      jobTag: json['JobTag'] as String?,
      nextToken: json['NextToken'] as String?,
      segments: (json['Segments'] as List?)
          ?.whereNotNull()
          .map((e) => SegmentDetection.fromJson(e as Map<String, dynamic>))
          .toList(),
      selectedSegmentTypes: (json['SelectedSegmentTypes'] as List?)
          ?.whereNotNull()
          .map((e) => SegmentTypeInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      statusMessage: json['StatusMessage'] as String?,
      video: json['Video'] != null
          ? Video.fromJson(json['Video'] as Map<String, dynamic>)
          : null,
      videoMetadata: (json['VideoMetadata'] as List?)
          ?.whereNotNull()
          .map((e) => VideoMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final audioMetadata = this.audioMetadata;
    final jobId = this.jobId;
    final jobStatus = this.jobStatus;
    final jobTag = this.jobTag;
    final nextToken = this.nextToken;
    final segments = this.segments;
    final selectedSegmentTypes = this.selectedSegmentTypes;
    final statusMessage = this.statusMessage;
    final video = this.video;
    final videoMetadata = this.videoMetadata;
    return {
      if (audioMetadata != null) 'AudioMetadata': audioMetadata,
      if (jobId != null) 'JobId': jobId,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
      if (jobTag != null) 'JobTag': jobTag,
      if (nextToken != null) 'NextToken': nextToken,
      if (segments != null) 'Segments': segments,
      if (selectedSegmentTypes != null)
        'SelectedSegmentTypes': selectedSegmentTypes,
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (video != null) 'Video': video,
      if (videoMetadata != null) 'VideoMetadata': videoMetadata,
    };
  }
}

class GetTextDetectionResponse {
  /// Job identifier for the text detection operation for which you want to obtain
  /// results. The job identifer is returned by an initial call to
  /// StartTextDetection.
  final String? jobId;

  /// Current status of the text detection job.
  final VideoJobStatus? jobStatus;

  /// A job identifier specified in the call to StartTextDetection and returned in
  /// the job completion notification sent to your Amazon Simple Notification
  /// Service topic.
  final String? jobTag;

  /// If the response is truncated, Amazon Rekognition Video returns this token
  /// that you can use in the subsequent request to retrieve the next set of text.
  final String? nextToken;

  /// If the job fails, <code>StatusMessage</code> provides a descriptive error
  /// message.
  final String? statusMessage;

  /// An array of text detected in the video. Each element contains the detected
  /// text, the time in milliseconds from the start of the video that the text was
  /// detected, and where it was detected on the screen.
  final List<TextDetectionResult>? textDetections;

  /// Version number of the text detection model that was used to detect text.
  final String? textModelVersion;
  final Video? video;
  final VideoMetadata? videoMetadata;

  GetTextDetectionResponse({
    this.jobId,
    this.jobStatus,
    this.jobTag,
    this.nextToken,
    this.statusMessage,
    this.textDetections,
    this.textModelVersion,
    this.video,
    this.videoMetadata,
  });

  factory GetTextDetectionResponse.fromJson(Map<String, dynamic> json) {
    return GetTextDetectionResponse(
      jobId: json['JobId'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toVideoJobStatus(),
      jobTag: json['JobTag'] as String?,
      nextToken: json['NextToken'] as String?,
      statusMessage: json['StatusMessage'] as String?,
      textDetections: (json['TextDetections'] as List?)
          ?.whereNotNull()
          .map((e) => TextDetectionResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      textModelVersion: json['TextModelVersion'] as String?,
      video: json['Video'] != null
          ? Video.fromJson(json['Video'] as Map<String, dynamic>)
          : null,
      videoMetadata: json['VideoMetadata'] != null
          ? VideoMetadata.fromJson(
              json['VideoMetadata'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    final jobStatus = this.jobStatus;
    final jobTag = this.jobTag;
    final nextToken = this.nextToken;
    final statusMessage = this.statusMessage;
    final textDetections = this.textDetections;
    final textModelVersion = this.textModelVersion;
    final video = this.video;
    final videoMetadata = this.videoMetadata;
    return {
      if (jobId != null) 'JobId': jobId,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
      if (jobTag != null) 'JobTag': jobTag,
      if (nextToken != null) 'NextToken': nextToken,
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (textDetections != null) 'TextDetections': textDetections,
      if (textModelVersion != null) 'TextModelVersion': textModelVersion,
      if (video != null) 'Video': video,
      if (videoMetadata != null) 'VideoMetadata': videoMetadata,
    };
  }
}

/// The S3 bucket that contains an Amazon Sagemaker Ground Truth format manifest
/// file.
class GroundTruthManifest {
  final S3Object? s3Object;

  GroundTruthManifest({
    this.s3Object,
  });

  factory GroundTruthManifest.fromJson(Map<String, dynamic> json) {
    return GroundTruthManifest(
      s3Object: json['S3Object'] != null
          ? S3Object.fromJson(json['S3Object'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Object = this.s3Object;
    return {
      if (s3Object != null) 'S3Object': s3Object,
    };
  }
}

/// Shows the results of the human in the loop evaluation. If there is no
/// HumanLoopArn, the input did not trigger human review.
class HumanLoopActivationOutput {
  /// Shows the result of condition evaluations, including those conditions which
  /// activated a human review.
  final Object? humanLoopActivationConditionsEvaluationResults;

  /// Shows if and why human review was needed.
  final List<String>? humanLoopActivationReasons;

  /// The Amazon Resource Name (ARN) of the HumanLoop created.
  final String? humanLoopArn;

  HumanLoopActivationOutput({
    this.humanLoopActivationConditionsEvaluationResults,
    this.humanLoopActivationReasons,
    this.humanLoopArn,
  });

  factory HumanLoopActivationOutput.fromJson(Map<String, dynamic> json) {
    return HumanLoopActivationOutput(
      humanLoopActivationConditionsEvaluationResults:
          json['HumanLoopActivationConditionsEvaluationResults'] == null
              ? null
              : jsonDecode(
                  json['HumanLoopActivationConditionsEvaluationResults']
                      as String),
      humanLoopActivationReasons: (json['HumanLoopActivationReasons'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      humanLoopArn: json['HumanLoopArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final humanLoopActivationConditionsEvaluationResults =
        this.humanLoopActivationConditionsEvaluationResults;
    final humanLoopActivationReasons = this.humanLoopActivationReasons;
    final humanLoopArn = this.humanLoopArn;
    return {
      if (humanLoopActivationConditionsEvaluationResults != null)
        'HumanLoopActivationConditionsEvaluationResults':
            jsonEncode(humanLoopActivationConditionsEvaluationResults),
      if (humanLoopActivationReasons != null)
        'HumanLoopActivationReasons': humanLoopActivationReasons,
      if (humanLoopArn != null) 'HumanLoopArn': humanLoopArn,
    };
  }
}

/// Sets up the flow definition the image will be sent to if one of the
/// conditions is met. You can also set certain attributes of the image before
/// review.
class HumanLoopConfig {
  /// The Amazon Resource Name (ARN) of the flow definition. You can create a flow
  /// definition by using the Amazon Sagemaker <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/API_CreateFlowDefinition.html">CreateFlowDefinition</a>
  /// Operation.
  final String flowDefinitionArn;

  /// The name of the human review used for this image. This should be kept unique
  /// within a region.
  final String humanLoopName;

  /// Sets attributes of the input data.
  final HumanLoopDataAttributes? dataAttributes;

  HumanLoopConfig({
    required this.flowDefinitionArn,
    required this.humanLoopName,
    this.dataAttributes,
  });

  Map<String, dynamic> toJson() {
    final flowDefinitionArn = this.flowDefinitionArn;
    final humanLoopName = this.humanLoopName;
    final dataAttributes = this.dataAttributes;
    return {
      'FlowDefinitionArn': flowDefinitionArn,
      'HumanLoopName': humanLoopName,
      if (dataAttributes != null) 'DataAttributes': dataAttributes,
    };
  }
}

/// Allows you to set attributes of the image. Currently, you can declare an
/// image as free of personally identifiable information.
class HumanLoopDataAttributes {
  /// Sets whether the input image is free of personally identifiable information.
  final List<ContentClassifier>? contentClassifiers;

  HumanLoopDataAttributes({
    this.contentClassifiers,
  });

  Map<String, dynamic> toJson() {
    final contentClassifiers = this.contentClassifiers;
    return {
      if (contentClassifiers != null)
        'ContentClassifiers':
            contentClassifiers.map((e) => e.toValue()).toList(),
    };
  }
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
/// permission to access the S3 object. For more information, see How Amazon
/// Rekognition works with IAM in the Amazon Rekognition Developer Guide.
class Image {
  /// Blob of image bytes up to 5 MBs. Note that the maximum image size you can
  /// pass to <code>DetectCustomLabels</code> is 4MB.
  final Uint8List? bytes;

  /// Identifies an S3 object as the image source.
  final S3Object? s3Object;

  Image({
    this.bytes,
    this.s3Object,
  });

  Map<String, dynamic> toJson() {
    final bytes = this.bytes;
    final s3Object = this.s3Object;
    return {
      if (bytes != null) 'Bytes': base64Encode(bytes),
      if (s3Object != null) 'S3Object': s3Object,
    };
  }
}

/// Identifies face image brightness and sharpness.
class ImageQuality {
  /// Value representing brightness of the face. The service returns a value
  /// between 0 and 100 (inclusive). A higher value indicates a brighter face
  /// image.
  final double? brightness;

  /// Value representing sharpness of the face. The service returns a value
  /// between 0 and 100 (inclusive). A higher value indicates a sharper face
  /// image.
  final double? sharpness;

  ImageQuality({
    this.brightness,
    this.sharpness,
  });

  factory ImageQuality.fromJson(Map<String, dynamic> json) {
    return ImageQuality(
      brightness: json['Brightness'] as double?,
      sharpness: json['Sharpness'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final brightness = this.brightness;
    final sharpness = this.sharpness;
    return {
      if (brightness != null) 'Brightness': brightness,
      if (sharpness != null) 'Sharpness': sharpness,
    };
  }
}

class IndexFacesResponse {
  /// The version number of the face detection model that's associated with the
  /// input collection (<code>CollectionId</code>).
  final String? faceModelVersion;

  /// An array of faces detected and added to the collection. For more
  /// information, see Searching Faces in a Collection in the Amazon Rekognition
  /// Developer Guide.
  final List<FaceRecord>? faceRecords;

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
  final OrientationCorrection? orientationCorrection;

  /// An array of faces that were detected in the image but weren't indexed. They
  /// weren't indexed because the quality filter identified them as low quality,
  /// or the <code>MaxFaces</code> request parameter filtered them out. To use the
  /// quality filter, you specify the <code>QualityFilter</code> request
  /// parameter.
  final List<UnindexedFace>? unindexedFaces;

  IndexFacesResponse({
    this.faceModelVersion,
    this.faceRecords,
    this.orientationCorrection,
    this.unindexedFaces,
  });

  factory IndexFacesResponse.fromJson(Map<String, dynamic> json) {
    return IndexFacesResponse(
      faceModelVersion: json['FaceModelVersion'] as String?,
      faceRecords: (json['FaceRecords'] as List?)
          ?.whereNotNull()
          .map((e) => FaceRecord.fromJson(e as Map<String, dynamic>))
          .toList(),
      orientationCorrection:
          (json['OrientationCorrection'] as String?)?.toOrientationCorrection(),
      unindexedFaces: (json['UnindexedFaces'] as List?)
          ?.whereNotNull()
          .map((e) => UnindexedFace.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final faceModelVersion = this.faceModelVersion;
    final faceRecords = this.faceRecords;
    final orientationCorrection = this.orientationCorrection;
    final unindexedFaces = this.unindexedFaces;
    return {
      if (faceModelVersion != null) 'FaceModelVersion': faceModelVersion,
      if (faceRecords != null) 'FaceRecords': faceRecords,
      if (orientationCorrection != null)
        'OrientationCorrection': orientationCorrection.toValue(),
      if (unindexedFaces != null) 'UnindexedFaces': unindexedFaces,
    };
  }
}

/// An instance of a label returned by Amazon Rekognition Image
/// (<a>DetectLabels</a>) or by Amazon Rekognition Video
/// (<a>GetLabelDetection</a>).
class Instance {
  /// The position of the label instance on the image.
  final BoundingBox? boundingBox;

  /// The confidence that Amazon Rekognition has in the accuracy of the bounding
  /// box.
  final double? confidence;

  /// The dominant colors found in an individual instance of a label.
  final List<DominantColor>? dominantColors;

  Instance({
    this.boundingBox,
    this.confidence,
    this.dominantColors,
  });

  factory Instance.fromJson(Map<String, dynamic> json) {
    return Instance(
      boundingBox: json['BoundingBox'] != null
          ? BoundingBox.fromJson(json['BoundingBox'] as Map<String, dynamic>)
          : null,
      confidence: json['Confidence'] as double?,
      dominantColors: (json['DominantColors'] as List?)
          ?.whereNotNull()
          .map((e) => DominantColor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final boundingBox = this.boundingBox;
    final confidence = this.confidence;
    final dominantColors = this.dominantColors;
    return {
      if (boundingBox != null) 'BoundingBox': boundingBox,
      if (confidence != null) 'Confidence': confidence,
      if (dominantColors != null) 'DominantColors': dominantColors,
    };
  }
}

/// The Kinesis data stream Amazon Rekognition to which the analysis results of
/// a Amazon Rekognition stream processor are streamed. For more information,
/// see CreateStreamProcessor in the Amazon Rekognition Developer Guide.
class KinesisDataStream {
  /// ARN of the output Amazon Kinesis Data Streams stream.
  final String? arn;

  KinesisDataStream({
    this.arn,
  });

  factory KinesisDataStream.fromJson(Map<String, dynamic> json) {
    return KinesisDataStream(
      arn: json['Arn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      if (arn != null) 'Arn': arn,
    };
  }
}

/// Kinesis video stream stream that provides the source streaming video for a
/// Amazon Rekognition Video stream processor. For more information, see
/// CreateStreamProcessor in the Amazon Rekognition Developer Guide.
class KinesisVideoStream {
  /// ARN of the Kinesis video stream stream that streams the source video.
  final String? arn;

  KinesisVideoStream({
    this.arn,
  });

  factory KinesisVideoStream.fromJson(Map<String, dynamic> json) {
    return KinesisVideoStream(
      arn: json['Arn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      if (arn != null) 'Arn': arn,
    };
  }
}

/// Specifies the starting point in a Kinesis stream to start processing. You
/// can use the producer timestamp or the fragment number. One of either
/// producer timestamp or fragment number is required. If you use the producer
/// timestamp, you must put the time in milliseconds. For more information about
/// fragment numbers, see <a
/// href="https://docs.aws.amazon.com/kinesisvideostreams/latest/dg/API_reader_Fragment.html">Fragment</a>.
class KinesisVideoStreamStartSelector {
  /// The unique identifier of the fragment. This value monotonically increases
  /// based on the ingestion order.
  final String? fragmentNumber;

  /// The timestamp from the producer corresponding to the fragment, in
  /// milliseconds, expressed in unix time format.
  final int? producerTimestamp;

  KinesisVideoStreamStartSelector({
    this.fragmentNumber,
    this.producerTimestamp,
  });

  Map<String, dynamic> toJson() {
    final fragmentNumber = this.fragmentNumber;
    final producerTimestamp = this.producerTimestamp;
    return {
      if (fragmentNumber != null) 'FragmentNumber': fragmentNumber,
      if (producerTimestamp != null) 'ProducerTimestamp': producerTimestamp,
    };
  }
}

/// The known gender identity for the celebrity that matches the provided ID.
/// The known gender identity can be Male, Female, Nonbinary, or Unlisted.
class KnownGender {
  /// A string value of the KnownGender info about the Celebrity.
  final KnownGenderType? type;

  KnownGender({
    this.type,
  });

  factory KnownGender.fromJson(Map<String, dynamic> json) {
    return KnownGender(
      type: (json['Type'] as String?)?.toKnownGenderType(),
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    return {
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// A list of enum string of possible gender values that Celebrity returns.
enum KnownGenderType {
  male,
  female,
  nonbinary,
  unlisted,
}

extension KnownGenderTypeValueExtension on KnownGenderType {
  String toValue() {
    switch (this) {
      case KnownGenderType.male:
        return 'Male';
      case KnownGenderType.female:
        return 'Female';
      case KnownGenderType.nonbinary:
        return 'Nonbinary';
      case KnownGenderType.unlisted:
        return 'Unlisted';
    }
  }
}

extension KnownGenderTypeFromString on String {
  KnownGenderType toKnownGenderType() {
    switch (this) {
      case 'Male':
        return KnownGenderType.male;
      case 'Female':
        return KnownGenderType.female;
      case 'Nonbinary':
        return KnownGenderType.nonbinary;
      case 'Unlisted':
        return KnownGenderType.unlisted;
    }
    throw Exception('$this is not known in enum KnownGenderType');
  }
}

/// Structure containing details about the detected label, including the name,
/// detected instances, parent labels, and level of confidence.
///
///
class Label {
  /// A list of potential aliases for a given label.
  final List<LabelAlias>? aliases;

  /// A list of the categories associated with a given label.
  final List<LabelCategory>? categories;

  /// Level of confidence.
  final double? confidence;

  /// If <code>Label</code> represents an object, <code>Instances</code> contains
  /// the bounding boxes for each instance of the detected object. Bounding boxes
  /// are returned for common object labels such as people, cars, furniture,
  /// apparel or pets.
  final List<Instance>? instances;

  /// The name (label) of the object or scene.
  final String? name;

  /// The parent labels for a label. The response includes all ancestor labels.
  final List<Parent>? parents;

  Label({
    this.aliases,
    this.categories,
    this.confidence,
    this.instances,
    this.name,
    this.parents,
  });

  factory Label.fromJson(Map<String, dynamic> json) {
    return Label(
      aliases: (json['Aliases'] as List?)
          ?.whereNotNull()
          .map((e) => LabelAlias.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (json['Categories'] as List?)
          ?.whereNotNull()
          .map((e) => LabelCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      confidence: json['Confidence'] as double?,
      instances: (json['Instances'] as List?)
          ?.whereNotNull()
          .map((e) => Instance.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['Name'] as String?,
      parents: (json['Parents'] as List?)
          ?.whereNotNull()
          .map((e) => Parent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final aliases = this.aliases;
    final categories = this.categories;
    final confidence = this.confidence;
    final instances = this.instances;
    final name = this.name;
    final parents = this.parents;
    return {
      if (aliases != null) 'Aliases': aliases,
      if (categories != null) 'Categories': categories,
      if (confidence != null) 'Confidence': confidence,
      if (instances != null) 'Instances': instances,
      if (name != null) 'Name': name,
      if (parents != null) 'Parents': parents,
    };
  }
}

/// A potential alias of for a given label.
class LabelAlias {
  /// The name of an alias for a given label.
  final String? name;

  LabelAlias({
    this.name,
  });

  factory LabelAlias.fromJson(Map<String, dynamic> json) {
    return LabelAlias(
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      if (name != null) 'Name': name,
    };
  }
}

/// The category that applies to a given label.
class LabelCategory {
  /// The name of a category that applies to a given label.
  final String? name;

  LabelCategory({
    this.name,
  });

  factory LabelCategory.fromJson(Map<String, dynamic> json) {
    return LabelCategory(
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      if (name != null) 'Name': name,
    };
  }
}

/// Information about a label detected in a video analysis request and the time
/// the label was detected in the video.
class LabelDetection {
  /// The time duration of a segment in milliseconds, I.e. time elapsed from
  /// StartTimestampMillis to EndTimestampMillis.
  final int? durationMillis;

  /// The time in milliseconds defining the end of the timeline segment containing
  /// a continuously detected label.
  final int? endTimestampMillis;

  /// Details about the detected label.
  final Label? label;

  /// The time in milliseconds defining the start of the timeline segment
  /// containing a continuously detected label.
  final int? startTimestampMillis;

  /// Time, in milliseconds from the start of the video, that the label was
  /// detected. Note that <code>Timestamp</code> is not guaranteed to be accurate
  /// to the individual frame where the label first appears.
  final int? timestamp;

  LabelDetection({
    this.durationMillis,
    this.endTimestampMillis,
    this.label,
    this.startTimestampMillis,
    this.timestamp,
  });

  factory LabelDetection.fromJson(Map<String, dynamic> json) {
    return LabelDetection(
      durationMillis: json['DurationMillis'] as int?,
      endTimestampMillis: json['EndTimestampMillis'] as int?,
      label: json['Label'] != null
          ? Label.fromJson(json['Label'] as Map<String, dynamic>)
          : null,
      startTimestampMillis: json['StartTimestampMillis'] as int?,
      timestamp: json['Timestamp'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final durationMillis = this.durationMillis;
    final endTimestampMillis = this.endTimestampMillis;
    final label = this.label;
    final startTimestampMillis = this.startTimestampMillis;
    final timestamp = this.timestamp;
    return {
      if (durationMillis != null) 'DurationMillis': durationMillis,
      if (endTimestampMillis != null) 'EndTimestampMillis': endTimestampMillis,
      if (label != null) 'Label': label,
      if (startTimestampMillis != null)
        'StartTimestampMillis': startTimestampMillis,
      if (timestamp != null) 'Timestamp': timestamp,
    };
  }
}

enum LabelDetectionAggregateBy {
  timestamps,
  segments,
}

extension LabelDetectionAggregateByValueExtension on LabelDetectionAggregateBy {
  String toValue() {
    switch (this) {
      case LabelDetectionAggregateBy.timestamps:
        return 'TIMESTAMPS';
      case LabelDetectionAggregateBy.segments:
        return 'SEGMENTS';
    }
  }
}

extension LabelDetectionAggregateByFromString on String {
  LabelDetectionAggregateBy toLabelDetectionAggregateBy() {
    switch (this) {
      case 'TIMESTAMPS':
        return LabelDetectionAggregateBy.timestamps;
      case 'SEGMENTS':
        return LabelDetectionAggregateBy.segments;
    }
    throw Exception('$this is not known in enum LabelDetectionAggregateBy');
  }
}

enum LabelDetectionFeatureName {
  generalLabels,
}

extension LabelDetectionFeatureNameValueExtension on LabelDetectionFeatureName {
  String toValue() {
    switch (this) {
      case LabelDetectionFeatureName.generalLabels:
        return 'GENERAL_LABELS';
    }
  }
}

extension LabelDetectionFeatureNameFromString on String {
  LabelDetectionFeatureName toLabelDetectionFeatureName() {
    switch (this) {
      case 'GENERAL_LABELS':
        return LabelDetectionFeatureName.generalLabels;
    }
    throw Exception('$this is not known in enum LabelDetectionFeatureName');
  }
}

/// Contains the specified filters that should be applied to a list of returned
/// GENERAL_LABELS.
class LabelDetectionSettings {
  final GeneralLabelsSettings? generalLabels;

  LabelDetectionSettings({
    this.generalLabels,
  });

  Map<String, dynamic> toJson() {
    final generalLabels = this.generalLabels;
    return {
      if (generalLabels != null) 'GeneralLabels': generalLabels,
    };
  }
}

enum LabelDetectionSortBy {
  name,
  timestamp,
}

extension LabelDetectionSortByValueExtension on LabelDetectionSortBy {
  String toValue() {
    switch (this) {
      case LabelDetectionSortBy.name:
        return 'NAME';
      case LabelDetectionSortBy.timestamp:
        return 'TIMESTAMP';
    }
  }
}

extension LabelDetectionSortByFromString on String {
  LabelDetectionSortBy toLabelDetectionSortBy() {
    switch (this) {
      case 'NAME':
        return LabelDetectionSortBy.name;
      case 'TIMESTAMP':
        return LabelDetectionSortBy.timestamp;
    }
    throw Exception('$this is not known in enum LabelDetectionSortBy');
  }
}

/// Indicates the location of the landmark on the face.
class Landmark {
  /// Type of landmark.
  final LandmarkType? type;

  /// The x-coordinate of the landmark expressed as a ratio of the width of the
  /// image. The x-coordinate is measured from the left-side of the image. For
  /// example, if the image is 700 pixels wide and the x-coordinate of the
  /// landmark is at 350 pixels, this value is 0.5.
  final double? x;

  /// The y-coordinate of the landmark expressed as a ratio of the height of the
  /// image. The y-coordinate is measured from the top of the image. For example,
  /// if the image height is 200 pixels and the y-coordinate of the landmark is at
  /// 50 pixels, this value is 0.25.
  final double? y;

  Landmark({
    this.type,
    this.x,
    this.y,
  });

  factory Landmark.fromJson(Map<String, dynamic> json) {
    return Landmark(
      type: (json['Type'] as String?)?.toLandmarkType(),
      x: json['X'] as double?,
      y: json['Y'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final x = this.x;
    final y = this.y;
    return {
      if (type != null) 'Type': type.toValue(),
      if (x != null) 'X': x,
      if (y != null) 'Y': y,
    };
  }
}

enum LandmarkType {
  eyeLeft,
  eyeRight,
  nose,
  mouthLeft,
  mouthRight,
  leftEyeBrowLeft,
  leftEyeBrowRight,
  leftEyeBrowUp,
  rightEyeBrowLeft,
  rightEyeBrowRight,
  rightEyeBrowUp,
  leftEyeLeft,
  leftEyeRight,
  leftEyeUp,
  leftEyeDown,
  rightEyeLeft,
  rightEyeRight,
  rightEyeUp,
  rightEyeDown,
  noseLeft,
  noseRight,
  mouthUp,
  mouthDown,
  leftPupil,
  rightPupil,
  upperJawlineLeft,
  midJawlineLeft,
  chinBottom,
  midJawlineRight,
  upperJawlineRight,
}

extension LandmarkTypeValueExtension on LandmarkType {
  String toValue() {
    switch (this) {
      case LandmarkType.eyeLeft:
        return 'eyeLeft';
      case LandmarkType.eyeRight:
        return 'eyeRight';
      case LandmarkType.nose:
        return 'nose';
      case LandmarkType.mouthLeft:
        return 'mouthLeft';
      case LandmarkType.mouthRight:
        return 'mouthRight';
      case LandmarkType.leftEyeBrowLeft:
        return 'leftEyeBrowLeft';
      case LandmarkType.leftEyeBrowRight:
        return 'leftEyeBrowRight';
      case LandmarkType.leftEyeBrowUp:
        return 'leftEyeBrowUp';
      case LandmarkType.rightEyeBrowLeft:
        return 'rightEyeBrowLeft';
      case LandmarkType.rightEyeBrowRight:
        return 'rightEyeBrowRight';
      case LandmarkType.rightEyeBrowUp:
        return 'rightEyeBrowUp';
      case LandmarkType.leftEyeLeft:
        return 'leftEyeLeft';
      case LandmarkType.leftEyeRight:
        return 'leftEyeRight';
      case LandmarkType.leftEyeUp:
        return 'leftEyeUp';
      case LandmarkType.leftEyeDown:
        return 'leftEyeDown';
      case LandmarkType.rightEyeLeft:
        return 'rightEyeLeft';
      case LandmarkType.rightEyeRight:
        return 'rightEyeRight';
      case LandmarkType.rightEyeUp:
        return 'rightEyeUp';
      case LandmarkType.rightEyeDown:
        return 'rightEyeDown';
      case LandmarkType.noseLeft:
        return 'noseLeft';
      case LandmarkType.noseRight:
        return 'noseRight';
      case LandmarkType.mouthUp:
        return 'mouthUp';
      case LandmarkType.mouthDown:
        return 'mouthDown';
      case LandmarkType.leftPupil:
        return 'leftPupil';
      case LandmarkType.rightPupil:
        return 'rightPupil';
      case LandmarkType.upperJawlineLeft:
        return 'upperJawlineLeft';
      case LandmarkType.midJawlineLeft:
        return 'midJawlineLeft';
      case LandmarkType.chinBottom:
        return 'chinBottom';
      case LandmarkType.midJawlineRight:
        return 'midJawlineRight';
      case LandmarkType.upperJawlineRight:
        return 'upperJawlineRight';
    }
  }
}

extension LandmarkTypeFromString on String {
  LandmarkType toLandmarkType() {
    switch (this) {
      case 'eyeLeft':
        return LandmarkType.eyeLeft;
      case 'eyeRight':
        return LandmarkType.eyeRight;
      case 'nose':
        return LandmarkType.nose;
      case 'mouthLeft':
        return LandmarkType.mouthLeft;
      case 'mouthRight':
        return LandmarkType.mouthRight;
      case 'leftEyeBrowLeft':
        return LandmarkType.leftEyeBrowLeft;
      case 'leftEyeBrowRight':
        return LandmarkType.leftEyeBrowRight;
      case 'leftEyeBrowUp':
        return LandmarkType.leftEyeBrowUp;
      case 'rightEyeBrowLeft':
        return LandmarkType.rightEyeBrowLeft;
      case 'rightEyeBrowRight':
        return LandmarkType.rightEyeBrowRight;
      case 'rightEyeBrowUp':
        return LandmarkType.rightEyeBrowUp;
      case 'leftEyeLeft':
        return LandmarkType.leftEyeLeft;
      case 'leftEyeRight':
        return LandmarkType.leftEyeRight;
      case 'leftEyeUp':
        return LandmarkType.leftEyeUp;
      case 'leftEyeDown':
        return LandmarkType.leftEyeDown;
      case 'rightEyeLeft':
        return LandmarkType.rightEyeLeft;
      case 'rightEyeRight':
        return LandmarkType.rightEyeRight;
      case 'rightEyeUp':
        return LandmarkType.rightEyeUp;
      case 'rightEyeDown':
        return LandmarkType.rightEyeDown;
      case 'noseLeft':
        return LandmarkType.noseLeft;
      case 'noseRight':
        return LandmarkType.noseRight;
      case 'mouthUp':
        return LandmarkType.mouthUp;
      case 'mouthDown':
        return LandmarkType.mouthDown;
      case 'leftPupil':
        return LandmarkType.leftPupil;
      case 'rightPupil':
        return LandmarkType.rightPupil;
      case 'upperJawlineLeft':
        return LandmarkType.upperJawlineLeft;
      case 'midJawlineLeft':
        return LandmarkType.midJawlineLeft;
      case 'chinBottom':
        return LandmarkType.chinBottom;
      case 'midJawlineRight':
        return LandmarkType.midJawlineRight;
      case 'upperJawlineRight':
        return LandmarkType.upperJawlineRight;
    }
    throw Exception('$this is not known in enum LandmarkType');
  }
}

class ListCollectionsResponse {
  /// An array of collection IDs.
  final List<String>? collectionIds;

  /// Version numbers of the face detection models associated with the collections
  /// in the array <code>CollectionIds</code>. For example, the value of
  /// <code>FaceModelVersions[2]</code> is the version number for the face
  /// detection model used by the collection in <code>CollectionId[2]</code>.
  final List<String>? faceModelVersions;

  /// If the result is truncated, the response provides a <code>NextToken</code>
  /// that you can use in the subsequent request to fetch the next set of
  /// collection IDs.
  final String? nextToken;

  ListCollectionsResponse({
    this.collectionIds,
    this.faceModelVersions,
    this.nextToken,
  });

  factory ListCollectionsResponse.fromJson(Map<String, dynamic> json) {
    return ListCollectionsResponse(
      collectionIds: (json['CollectionIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      faceModelVersions: (json['FaceModelVersions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final collectionIds = this.collectionIds;
    final faceModelVersions = this.faceModelVersions;
    final nextToken = this.nextToken;
    return {
      if (collectionIds != null) 'CollectionIds': collectionIds,
      if (faceModelVersions != null) 'FaceModelVersions': faceModelVersions,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListDatasetEntriesResponse {
  /// A list of entries (images) in the dataset.
  final List<String>? datasetEntries;

  /// If the previous response was incomplete (because there is more results to
  /// retrieve), Amazon Rekognition Custom Labels returns a pagination token in
  /// the response. You can use this pagination token to retrieve the next set of
  /// results.
  final String? nextToken;

  ListDatasetEntriesResponse({
    this.datasetEntries,
    this.nextToken,
  });

  factory ListDatasetEntriesResponse.fromJson(Map<String, dynamic> json) {
    return ListDatasetEntriesResponse(
      datasetEntries: (json['DatasetEntries'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final datasetEntries = this.datasetEntries;
    final nextToken = this.nextToken;
    return {
      if (datasetEntries != null) 'DatasetEntries': datasetEntries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListDatasetLabelsResponse {
  /// A list of the labels in the dataset.
  final List<DatasetLabelDescription>? datasetLabelDescriptions;

  /// If the previous response was incomplete (because there is more results to
  /// retrieve), Amazon Rekognition Custom Labels returns a pagination token in
  /// the response. You can use this pagination token to retrieve the next set of
  /// results.
  final String? nextToken;

  ListDatasetLabelsResponse({
    this.datasetLabelDescriptions,
    this.nextToken,
  });

  factory ListDatasetLabelsResponse.fromJson(Map<String, dynamic> json) {
    return ListDatasetLabelsResponse(
      datasetLabelDescriptions: (json['DatasetLabelDescriptions'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DatasetLabelDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final datasetLabelDescriptions = this.datasetLabelDescriptions;
    final nextToken = this.nextToken;
    return {
      if (datasetLabelDescriptions != null)
        'DatasetLabelDescriptions': datasetLabelDescriptions,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListFacesResponse {
  /// Version number of the face detection model associated with the input
  /// collection (<code>CollectionId</code>).
  final String? faceModelVersion;

  /// An array of <code>Face</code> objects.
  final List<Face>? faces;

  /// If the response is truncated, Amazon Rekognition returns this token that you
  /// can use in the subsequent request to retrieve the next set of faces.
  final String? nextToken;

  ListFacesResponse({
    this.faceModelVersion,
    this.faces,
    this.nextToken,
  });

  factory ListFacesResponse.fromJson(Map<String, dynamic> json) {
    return ListFacesResponse(
      faceModelVersion: json['FaceModelVersion'] as String?,
      faces: (json['Faces'] as List?)
          ?.whereNotNull()
          .map((e) => Face.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final faceModelVersion = this.faceModelVersion;
    final faces = this.faces;
    final nextToken = this.nextToken;
    return {
      if (faceModelVersion != null) 'FaceModelVersion': faceModelVersion,
      if (faces != null) 'Faces': faces,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListMediaAnalysisJobsResponse {
  /// Contains a list of all media analysis jobs.
  final List<MediaAnalysisJobDescription> mediaAnalysisJobs;

  /// Pagination token, if the previous response was incomplete.
  final String? nextToken;

  ListMediaAnalysisJobsResponse({
    required this.mediaAnalysisJobs,
    this.nextToken,
  });

  factory ListMediaAnalysisJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListMediaAnalysisJobsResponse(
      mediaAnalysisJobs: (json['MediaAnalysisJobs'] as List)
          .whereNotNull()
          .map((e) =>
              MediaAnalysisJobDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final mediaAnalysisJobs = this.mediaAnalysisJobs;
    final nextToken = this.nextToken;
    return {
      'MediaAnalysisJobs': mediaAnalysisJobs,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListProjectPoliciesResponse {
  /// If the response is truncated, Amazon Rekognition returns this token that you
  /// can use in the subsequent request to retrieve the next set of project
  /// policies.
  final String? nextToken;

  /// A list of project policies attached to the project.
  final List<ProjectPolicy>? projectPolicies;

  ListProjectPoliciesResponse({
    this.nextToken,
    this.projectPolicies,
  });

  factory ListProjectPoliciesResponse.fromJson(Map<String, dynamic> json) {
    return ListProjectPoliciesResponse(
      nextToken: json['NextToken'] as String?,
      projectPolicies: (json['ProjectPolicies'] as List?)
          ?.whereNotNull()
          .map((e) => ProjectPolicy.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final projectPolicies = this.projectPolicies;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (projectPolicies != null) 'ProjectPolicies': projectPolicies,
    };
  }
}

class ListStreamProcessorsResponse {
  /// If the response is truncated, Amazon Rekognition Video returns this token
  /// that you can use in the subsequent request to retrieve the next set of
  /// stream processors.
  final String? nextToken;

  /// List of stream processors that you have created.
  final List<StreamProcessor>? streamProcessors;

  ListStreamProcessorsResponse({
    this.nextToken,
    this.streamProcessors,
  });

  factory ListStreamProcessorsResponse.fromJson(Map<String, dynamic> json) {
    return ListStreamProcessorsResponse(
      nextToken: json['NextToken'] as String?,
      streamProcessors: (json['StreamProcessors'] as List?)
          ?.whereNotNull()
          .map((e) => StreamProcessor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final streamProcessors = this.streamProcessors;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (streamProcessors != null) 'StreamProcessors': streamProcessors,
    };
  }
}

class ListTagsForResourceResponse {
  /// A list of key-value tags assigned to the resource.
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

class ListUsersResponse {
  /// A pagination token to be used with the subsequent request if the response is
  /// truncated.
  final String? nextToken;

  /// List of UsersID associated with the specified collection.
  final List<User>? users;

  ListUsersResponse({
    this.nextToken,
    this.users,
  });

  factory ListUsersResponse.fromJson(Map<String, dynamic> json) {
    return ListUsersResponse(
      nextToken: json['NextToken'] as String?,
      users: (json['Users'] as List?)
          ?.whereNotNull()
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final users = this.users;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (users != null) 'Users': users,
    };
  }
}

/// Contains settings that specify the location of an Amazon S3 bucket used to
/// store the output of a Face Liveness session. Note that the S3 bucket must be
/// located in the caller's AWS account and in the same region as the Face
/// Liveness end-point. Additionally, the Amazon S3 object keys are
/// auto-generated by the Face Liveness system.
class LivenessOutputConfig {
  /// The path to an AWS Amazon S3 bucket used to store Face Liveness session
  /// results.
  final String s3Bucket;

  /// The prefix prepended to the output files for the Face Liveness session
  /// results.
  final String? s3KeyPrefix;

  LivenessOutputConfig({
    required this.s3Bucket,
    this.s3KeyPrefix,
  });

  Map<String, dynamic> toJson() {
    final s3Bucket = this.s3Bucket;
    final s3KeyPrefix = this.s3KeyPrefix;
    return {
      'S3Bucket': s3Bucket,
      if (s3KeyPrefix != null) 'S3KeyPrefix': s3KeyPrefix,
    };
  }
}

enum LivenessSessionStatus {
  created,
  inProgress,
  succeeded,
  failed,
  expired,
}

extension LivenessSessionStatusValueExtension on LivenessSessionStatus {
  String toValue() {
    switch (this) {
      case LivenessSessionStatus.created:
        return 'CREATED';
      case LivenessSessionStatus.inProgress:
        return 'IN_PROGRESS';
      case LivenessSessionStatus.succeeded:
        return 'SUCCEEDED';
      case LivenessSessionStatus.failed:
        return 'FAILED';
      case LivenessSessionStatus.expired:
        return 'EXPIRED';
    }
  }
}

extension LivenessSessionStatusFromString on String {
  LivenessSessionStatus toLivenessSessionStatus() {
    switch (this) {
      case 'CREATED':
        return LivenessSessionStatus.created;
      case 'IN_PROGRESS':
        return LivenessSessionStatus.inProgress;
      case 'SUCCEEDED':
        return LivenessSessionStatus.succeeded;
      case 'FAILED':
        return LivenessSessionStatus.failed;
      case 'EXPIRED':
        return LivenessSessionStatus.expired;
    }
    throw Exception('$this is not known in enum LivenessSessionStatus');
  }
}

/// Contains metadata for a UserID matched with a given face.
class MatchedUser {
  /// A provided ID for the UserID. Unique within the collection.
  final String? userId;

  /// The status of the user matched to a provided FaceID.
  final UserStatus? userStatus;

  MatchedUser({
    this.userId,
    this.userStatus,
  });

  factory MatchedUser.fromJson(Map<String, dynamic> json) {
    return MatchedUser(
      userId: json['UserId'] as String?,
      userStatus: (json['UserStatus'] as String?)?.toUserStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final userId = this.userId;
    final userStatus = this.userStatus;
    return {
      if (userId != null) 'UserId': userId,
      if (userStatus != null) 'UserStatus': userStatus.toValue(),
    };
  }
}

/// Configuration for Moderation Labels Detection.
class MediaAnalysisDetectModerationLabelsConfig {
  /// Specifies the minimum confidence level for the moderation labels to return.
  /// Amazon Rekognition doesn't return any labels with a confidence level lower
  /// than this specified value.
  final double? minConfidence;

  /// Specifies the custom moderation model to be used during the label detection
  /// job. If not provided the pre-trained model is used.
  final String? projectVersion;

  MediaAnalysisDetectModerationLabelsConfig({
    this.minConfidence,
    this.projectVersion,
  });

  factory MediaAnalysisDetectModerationLabelsConfig.fromJson(
      Map<String, dynamic> json) {
    return MediaAnalysisDetectModerationLabelsConfig(
      minConfidence: json['MinConfidence'] as double?,
      projectVersion: json['ProjectVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final minConfidence = this.minConfidence;
    final projectVersion = this.projectVersion;
    return {
      if (minConfidence != null) 'MinConfidence': minConfidence,
      if (projectVersion != null) 'ProjectVersion': projectVersion,
    };
  }
}

/// Contains input information for a media analysis job.
class MediaAnalysisInput {
  final S3Object s3Object;

  MediaAnalysisInput({
    required this.s3Object,
  });

  factory MediaAnalysisInput.fromJson(Map<String, dynamic> json) {
    return MediaAnalysisInput(
      s3Object: S3Object.fromJson(json['S3Object'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final s3Object = this.s3Object;
    return {
      'S3Object': s3Object,
    };
  }
}

/// Description for a media analysis job.
class MediaAnalysisJobDescription {
  /// The Unix date and time when the job was started.
  final DateTime creationTimestamp;

  /// Reference to the input manifest that was provided in the job creation
  /// request.
  final MediaAnalysisInput input;

  /// The identifier for a media analysis job.
  final String jobId;

  /// Operation configurations that were provided during job creation.
  final MediaAnalysisOperationsConfig operationsConfig;

  /// Output configuration that was provided in the creation request.
  final MediaAnalysisOutputConfig outputConfig;

  /// The status of the media analysis job being retrieved.
  final MediaAnalysisJobStatus status;

  /// The Unix date and time when the job finished.
  final DateTime? completionTimestamp;

  /// Details about the error that resulted in failure of the job.
  final MediaAnalysisJobFailureDetails? failureDetails;

  /// The name of a media analysis job.
  final String? jobName;

  /// KMS Key that was provided in the creation request.
  final String? kmsKeyId;

  /// Provides statistics on input manifest and errors identified in the input
  /// manifest.
  final MediaAnalysisManifestSummary? manifestSummary;

  /// Output manifest that contains prediction results.
  final MediaAnalysisResults? results;

  MediaAnalysisJobDescription({
    required this.creationTimestamp,
    required this.input,
    required this.jobId,
    required this.operationsConfig,
    required this.outputConfig,
    required this.status,
    this.completionTimestamp,
    this.failureDetails,
    this.jobName,
    this.kmsKeyId,
    this.manifestSummary,
    this.results,
  });

  factory MediaAnalysisJobDescription.fromJson(Map<String, dynamic> json) {
    return MediaAnalysisJobDescription(
      creationTimestamp:
          nonNullableTimeStampFromJson(json['CreationTimestamp'] as Object),
      input: MediaAnalysisInput.fromJson(json['Input'] as Map<String, dynamic>),
      jobId: json['JobId'] as String,
      operationsConfig: MediaAnalysisOperationsConfig.fromJson(
          json['OperationsConfig'] as Map<String, dynamic>),
      outputConfig: MediaAnalysisOutputConfig.fromJson(
          json['OutputConfig'] as Map<String, dynamic>),
      status: (json['Status'] as String).toMediaAnalysisJobStatus(),
      completionTimestamp: timeStampFromJson(json['CompletionTimestamp']),
      failureDetails: json['FailureDetails'] != null
          ? MediaAnalysisJobFailureDetails.fromJson(
              json['FailureDetails'] as Map<String, dynamic>)
          : null,
      jobName: json['JobName'] as String?,
      kmsKeyId: json['KmsKeyId'] as String?,
      manifestSummary: json['ManifestSummary'] != null
          ? MediaAnalysisManifestSummary.fromJson(
              json['ManifestSummary'] as Map<String, dynamic>)
          : null,
      results: json['Results'] != null
          ? MediaAnalysisResults.fromJson(
              json['Results'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTimestamp = this.creationTimestamp;
    final input = this.input;
    final jobId = this.jobId;
    final operationsConfig = this.operationsConfig;
    final outputConfig = this.outputConfig;
    final status = this.status;
    final completionTimestamp = this.completionTimestamp;
    final failureDetails = this.failureDetails;
    final jobName = this.jobName;
    final kmsKeyId = this.kmsKeyId;
    final manifestSummary = this.manifestSummary;
    final results = this.results;
    return {
      'CreationTimestamp': unixTimestampToJson(creationTimestamp),
      'Input': input,
      'JobId': jobId,
      'OperationsConfig': operationsConfig,
      'OutputConfig': outputConfig,
      'Status': status.toValue(),
      if (completionTimestamp != null)
        'CompletionTimestamp': unixTimestampToJson(completionTimestamp),
      if (failureDetails != null) 'FailureDetails': failureDetails,
      if (jobName != null) 'JobName': jobName,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (manifestSummary != null) 'ManifestSummary': manifestSummary,
      if (results != null) 'Results': results,
    };
  }
}

enum MediaAnalysisJobFailureCode {
  internalError,
  invalidS3Object,
  invalidManifest,
  invalidOutputConfig,
  invalidKmsKey,
  accessDenied,
  resourceNotFound,
  resourceNotReady,
  throttled,
}

extension MediaAnalysisJobFailureCodeValueExtension
    on MediaAnalysisJobFailureCode {
  String toValue() {
    switch (this) {
      case MediaAnalysisJobFailureCode.internalError:
        return 'INTERNAL_ERROR';
      case MediaAnalysisJobFailureCode.invalidS3Object:
        return 'INVALID_S3_OBJECT';
      case MediaAnalysisJobFailureCode.invalidManifest:
        return 'INVALID_MANIFEST';
      case MediaAnalysisJobFailureCode.invalidOutputConfig:
        return 'INVALID_OUTPUT_CONFIG';
      case MediaAnalysisJobFailureCode.invalidKmsKey:
        return 'INVALID_KMS_KEY';
      case MediaAnalysisJobFailureCode.accessDenied:
        return 'ACCESS_DENIED';
      case MediaAnalysisJobFailureCode.resourceNotFound:
        return 'RESOURCE_NOT_FOUND';
      case MediaAnalysisJobFailureCode.resourceNotReady:
        return 'RESOURCE_NOT_READY';
      case MediaAnalysisJobFailureCode.throttled:
        return 'THROTTLED';
    }
  }
}

extension MediaAnalysisJobFailureCodeFromString on String {
  MediaAnalysisJobFailureCode toMediaAnalysisJobFailureCode() {
    switch (this) {
      case 'INTERNAL_ERROR':
        return MediaAnalysisJobFailureCode.internalError;
      case 'INVALID_S3_OBJECT':
        return MediaAnalysisJobFailureCode.invalidS3Object;
      case 'INVALID_MANIFEST':
        return MediaAnalysisJobFailureCode.invalidManifest;
      case 'INVALID_OUTPUT_CONFIG':
        return MediaAnalysisJobFailureCode.invalidOutputConfig;
      case 'INVALID_KMS_KEY':
        return MediaAnalysisJobFailureCode.invalidKmsKey;
      case 'ACCESS_DENIED':
        return MediaAnalysisJobFailureCode.accessDenied;
      case 'RESOURCE_NOT_FOUND':
        return MediaAnalysisJobFailureCode.resourceNotFound;
      case 'RESOURCE_NOT_READY':
        return MediaAnalysisJobFailureCode.resourceNotReady;
      case 'THROTTLED':
        return MediaAnalysisJobFailureCode.throttled;
    }
    throw Exception('$this is not known in enum MediaAnalysisJobFailureCode');
  }
}

/// Details about the error that resulted in failure of the job.
class MediaAnalysisJobFailureDetails {
  /// Error code for the failed job.
  final MediaAnalysisJobFailureCode? code;

  /// Human readable error message.
  final String? message;

  MediaAnalysisJobFailureDetails({
    this.code,
    this.message,
  });

  factory MediaAnalysisJobFailureDetails.fromJson(Map<String, dynamic> json) {
    return MediaAnalysisJobFailureDetails(
      code: (json['Code'] as String?)?.toMediaAnalysisJobFailureCode(),
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      if (code != null) 'Code': code.toValue(),
      if (message != null) 'Message': message,
    };
  }
}

enum MediaAnalysisJobStatus {
  created,
  queued,
  inProgress,
  succeeded,
  failed,
}

extension MediaAnalysisJobStatusValueExtension on MediaAnalysisJobStatus {
  String toValue() {
    switch (this) {
      case MediaAnalysisJobStatus.created:
        return 'CREATED';
      case MediaAnalysisJobStatus.queued:
        return 'QUEUED';
      case MediaAnalysisJobStatus.inProgress:
        return 'IN_PROGRESS';
      case MediaAnalysisJobStatus.succeeded:
        return 'SUCCEEDED';
      case MediaAnalysisJobStatus.failed:
        return 'FAILED';
    }
  }
}

extension MediaAnalysisJobStatusFromString on String {
  MediaAnalysisJobStatus toMediaAnalysisJobStatus() {
    switch (this) {
      case 'CREATED':
        return MediaAnalysisJobStatus.created;
      case 'QUEUED':
        return MediaAnalysisJobStatus.queued;
      case 'IN_PROGRESS':
        return MediaAnalysisJobStatus.inProgress;
      case 'SUCCEEDED':
        return MediaAnalysisJobStatus.succeeded;
      case 'FAILED':
        return MediaAnalysisJobStatus.failed;
    }
    throw Exception('$this is not known in enum MediaAnalysisJobStatus');
  }
}

/// Summary that provides statistics on input manifest and errors identified in
/// the input manifest.
class MediaAnalysisManifestSummary {
  final S3Object? s3Object;

  MediaAnalysisManifestSummary({
    this.s3Object,
  });

  factory MediaAnalysisManifestSummary.fromJson(Map<String, dynamic> json) {
    return MediaAnalysisManifestSummary(
      s3Object: json['S3Object'] != null
          ? S3Object.fromJson(json['S3Object'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Object = this.s3Object;
    return {
      if (s3Object != null) 'S3Object': s3Object,
    };
  }
}

/// Object containing information about the model versions of selected features
/// in a given job.
class MediaAnalysisModelVersions {
  /// The Moderation base model version.
  final String? moderation;

  MediaAnalysisModelVersions({
    this.moderation,
  });

  factory MediaAnalysisModelVersions.fromJson(Map<String, dynamic> json) {
    return MediaAnalysisModelVersions(
      moderation: json['Moderation'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final moderation = this.moderation;
    return {
      if (moderation != null) 'Moderation': moderation,
    };
  }
}

/// Configuration options for a media analysis job. Configuration is
/// operation-specific.
class MediaAnalysisOperationsConfig {
  /// Contains configuration options for a DetectModerationLabels job.
  final MediaAnalysisDetectModerationLabelsConfig? detectModerationLabels;

  MediaAnalysisOperationsConfig({
    this.detectModerationLabels,
  });

  factory MediaAnalysisOperationsConfig.fromJson(Map<String, dynamic> json) {
    return MediaAnalysisOperationsConfig(
      detectModerationLabels: json['DetectModerationLabels'] != null
          ? MediaAnalysisDetectModerationLabelsConfig.fromJson(
              json['DetectModerationLabels'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final detectModerationLabels = this.detectModerationLabels;
    return {
      if (detectModerationLabels != null)
        'DetectModerationLabels': detectModerationLabels,
    };
  }
}

/// Output configuration provided in the job creation request.
class MediaAnalysisOutputConfig {
  /// Specifies the Amazon S3 bucket to contain the output of the media analysis
  /// job.
  final String s3Bucket;

  /// Specifies the Amazon S3 key prefix that comes after the name of the bucket
  /// you have designated for storage.
  final String? s3KeyPrefix;

  MediaAnalysisOutputConfig({
    required this.s3Bucket,
    this.s3KeyPrefix,
  });

  factory MediaAnalysisOutputConfig.fromJson(Map<String, dynamic> json) {
    return MediaAnalysisOutputConfig(
      s3Bucket: json['S3Bucket'] as String,
      s3KeyPrefix: json['S3KeyPrefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Bucket = this.s3Bucket;
    final s3KeyPrefix = this.s3KeyPrefix;
    return {
      'S3Bucket': s3Bucket,
      if (s3KeyPrefix != null) 'S3KeyPrefix': s3KeyPrefix,
    };
  }
}

/// Contains the results for a media analysis job created with
/// StartMediaAnalysisJob.
class MediaAnalysisResults {
  /// Information about the model versions for the features selected in a given
  /// job.
  final MediaAnalysisModelVersions? modelVersions;
  final S3Object? s3Object;

  MediaAnalysisResults({
    this.modelVersions,
    this.s3Object,
  });

  factory MediaAnalysisResults.fromJson(Map<String, dynamic> json) {
    return MediaAnalysisResults(
      modelVersions: json['ModelVersions'] != null
          ? MediaAnalysisModelVersions.fromJson(
              json['ModelVersions'] as Map<String, dynamic>)
          : null,
      s3Object: json['S3Object'] != null
          ? S3Object.fromJson(json['S3Object'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final modelVersions = this.modelVersions;
    final s3Object = this.s3Object;
    return {
      if (modelVersions != null) 'ModelVersions': modelVersions,
      if (s3Object != null) 'S3Object': s3Object,
    };
  }
}

/// Provides information about a single type of inappropriate, unwanted, or
/// offensive content found in an image or video. Each type of moderated content
/// has a label within a hierarchical taxonomy. For more information, see
/// Content moderation in the Amazon Rekognition Developer Guide.
class ModerationLabel {
  /// Specifies the confidence that Amazon Rekognition has that the label has been
  /// correctly identified.
  ///
  /// If you don't specify the <code>MinConfidence</code> parameter in the call to
  /// <code>DetectModerationLabels</code>, the operation returns labels with a
  /// confidence value greater than or equal to 50 percent.
  final double? confidence;

  /// The label name for the type of unsafe content detected in the image.
  final String? name;

  /// The name for the parent label. Labels at the top level of the hierarchy have
  /// the parent label <code>""</code>.
  final String? parentName;

  /// The level of the moderation label with regard to its taxonomy, from 1 to 3.
  final int? taxonomyLevel;

  ModerationLabel({
    this.confidence,
    this.name,
    this.parentName,
    this.taxonomyLevel,
  });

  factory ModerationLabel.fromJson(Map<String, dynamic> json) {
    return ModerationLabel(
      confidence: json['Confidence'] as double?,
      name: json['Name'] as String?,
      parentName: json['ParentName'] as String?,
      taxonomyLevel: json['TaxonomyLevel'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final confidence = this.confidence;
    final name = this.name;
    final parentName = this.parentName;
    final taxonomyLevel = this.taxonomyLevel;
    return {
      if (confidence != null) 'Confidence': confidence,
      if (name != null) 'Name': name,
      if (parentName != null) 'ParentName': parentName,
      if (taxonomyLevel != null) 'TaxonomyLevel': taxonomyLevel,
    };
  }
}

/// Indicates whether or not the mouth on the face is open, and the confidence
/// level in the determination.
class MouthOpen {
  /// Level of confidence in the determination.
  final double? confidence;

  /// Boolean value that indicates whether the mouth on the face is open or not.
  final bool? value;

  MouthOpen({
    this.confidence,
    this.value,
  });

  factory MouthOpen.fromJson(Map<String, dynamic> json) {
    return MouthOpen(
      confidence: json['Confidence'] as double?,
      value: json['Value'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final confidence = this.confidence;
    final value = this.value;
    return {
      if (confidence != null) 'Confidence': confidence,
      if (value != null) 'Value': value,
    };
  }
}

/// Indicates whether or not the face has a mustache, and the confidence level
/// in the determination.
class Mustache {
  /// Level of confidence in the determination.
  final double? confidence;

  /// Boolean value that indicates whether the face has mustache or not.
  final bool? value;

  Mustache({
    this.confidence,
    this.value,
  });

  factory Mustache.fromJson(Map<String, dynamic> json) {
    return Mustache(
      confidence: json['Confidence'] as double?,
      value: json['Value'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final confidence = this.confidence;
    final value = this.value;
    return {
      if (confidence != null) 'Confidence': confidence,
      if (value != null) 'Value': value,
    };
  }
}

/// The Amazon Simple Notification Service topic to which Amazon Rekognition
/// publishes the completion status of a video analysis operation. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/rekognition/latest/dg/api-video.html">Calling
/// Amazon Rekognition Video operations</a>. Note that the Amazon SNS topic must
/// have a topic name that begins with <i>AmazonRekognition</i> if you are using
/// the AmazonRekognitionServiceRole permissions policy to access the topic. For
/// more information, see <a
/// href="https://docs.aws.amazon.com/rekognition/latest/dg/api-video-roles.html#api-video-roles-all-topics">Giving
/// access to multiple Amazon SNS topics</a>.
class NotificationChannel {
  /// The ARN of an IAM role that gives Amazon Rekognition publishing permissions
  /// to the Amazon SNS topic.
  final String roleArn;

  /// The Amazon SNS topic to which Amazon Rekognition posts the completion
  /// status.
  final String sNSTopicArn;

  NotificationChannel({
    required this.roleArn,
    required this.sNSTopicArn,
  });

  Map<String, dynamic> toJson() {
    final roleArn = this.roleArn;
    final sNSTopicArn = this.sNSTopicArn;
    return {
      'RoleArn': roleArn,
      'SNSTopicArn': sNSTopicArn,
    };
  }
}

enum OrientationCorrection {
  rotate_0,
  rotate_90,
  rotate_180,
  rotate_270,
}

extension OrientationCorrectionValueExtension on OrientationCorrection {
  String toValue() {
    switch (this) {
      case OrientationCorrection.rotate_0:
        return 'ROTATE_0';
      case OrientationCorrection.rotate_90:
        return 'ROTATE_90';
      case OrientationCorrection.rotate_180:
        return 'ROTATE_180';
      case OrientationCorrection.rotate_270:
        return 'ROTATE_270';
    }
  }
}

extension OrientationCorrectionFromString on String {
  OrientationCorrection toOrientationCorrection() {
    switch (this) {
      case 'ROTATE_0':
        return OrientationCorrection.rotate_0;
      case 'ROTATE_90':
        return OrientationCorrection.rotate_90;
      case 'ROTATE_180':
        return OrientationCorrection.rotate_180;
      case 'ROTATE_270':
        return OrientationCorrection.rotate_270;
    }
    throw Exception('$this is not known in enum OrientationCorrection');
  }
}

/// The S3 bucket and folder location where training output is placed.
class OutputConfig {
  /// The S3 bucket where training output is placed.
  final String? s3Bucket;

  /// The prefix applied to the training output files.
  final String? s3KeyPrefix;

  OutputConfig({
    this.s3Bucket,
    this.s3KeyPrefix,
  });

  factory OutputConfig.fromJson(Map<String, dynamic> json) {
    return OutputConfig(
      s3Bucket: json['S3Bucket'] as String?,
      s3KeyPrefix: json['S3KeyPrefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Bucket = this.s3Bucket;
    final s3KeyPrefix = this.s3KeyPrefix;
    return {
      if (s3Bucket != null) 'S3Bucket': s3Bucket,
      if (s3KeyPrefix != null) 'S3KeyPrefix': s3KeyPrefix,
    };
  }
}

/// A parent label for a label. A label can have 0, 1, or more parents.
class Parent {
  /// The name of the parent label.
  final String? name;

  Parent({
    this.name,
  });

  factory Parent.fromJson(Map<String, dynamic> json) {
    return Parent(
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      if (name != null) 'Name': name,
    };
  }
}

/// Details about a person detected in a video analysis request.
class PersonDetail {
  /// Bounding box around the detected person.
  final BoundingBox? boundingBox;

  /// Face details for the detected person.
  final FaceDetail? face;

  /// Identifier for the person detected person within a video. Use to keep track
  /// of the person throughout the video. The identifier is not stored by Amazon
  /// Rekognition.
  final int? index;

  PersonDetail({
    this.boundingBox,
    this.face,
    this.index,
  });

  factory PersonDetail.fromJson(Map<String, dynamic> json) {
    return PersonDetail(
      boundingBox: json['BoundingBox'] != null
          ? BoundingBox.fromJson(json['BoundingBox'] as Map<String, dynamic>)
          : null,
      face: json['Face'] != null
          ? FaceDetail.fromJson(json['Face'] as Map<String, dynamic>)
          : null,
      index: json['Index'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final boundingBox = this.boundingBox;
    final face = this.face;
    final index = this.index;
    return {
      if (boundingBox != null) 'BoundingBox': boundingBox,
      if (face != null) 'Face': face,
      if (index != null) 'Index': index,
    };
  }
}

/// Details and path tracking information for a single time a person's path is
/// tracked in a video. Amazon Rekognition operations that track people's paths
/// return an array of <code>PersonDetection</code> objects with elements for
/// each time a person's path is tracked in a video.
///
/// For more information, see GetPersonTracking in the Amazon Rekognition
/// Developer Guide.
class PersonDetection {
  /// Details about a person whose path was tracked in a video.
  final PersonDetail? person;

  /// The time, in milliseconds from the start of the video, that the person's
  /// path was tracked. Note that <code>Timestamp</code> is not guaranteed to be
  /// accurate to the individual frame where the person's path first appears.
  final int? timestamp;

  PersonDetection({
    this.person,
    this.timestamp,
  });

  factory PersonDetection.fromJson(Map<String, dynamic> json) {
    return PersonDetection(
      person: json['Person'] != null
          ? PersonDetail.fromJson(json['Person'] as Map<String, dynamic>)
          : null,
      timestamp: json['Timestamp'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final person = this.person;
    final timestamp = this.timestamp;
    return {
      if (person != null) 'Person': person,
      if (timestamp != null) 'Timestamp': timestamp,
    };
  }
}

/// Information about a person whose face matches a face(s) in an Amazon
/// Rekognition collection. Includes information about the faces in the Amazon
/// Rekognition collection (<a>FaceMatch</a>), information about the person
/// (<a>PersonDetail</a>), and the time stamp for when the person was detected
/// in a video. An array of <code>PersonMatch</code> objects is returned by
/// <a>GetFaceSearch</a>.
class PersonMatch {
  /// Information about the faces in the input collection that match the face of a
  /// person in the video.
  final List<FaceMatch>? faceMatches;

  /// Information about the matched person.
  final PersonDetail? person;

  /// The time, in milliseconds from the beginning of the video, that the person
  /// was matched in the video.
  final int? timestamp;

  PersonMatch({
    this.faceMatches,
    this.person,
    this.timestamp,
  });

  factory PersonMatch.fromJson(Map<String, dynamic> json) {
    return PersonMatch(
      faceMatches: (json['FaceMatches'] as List?)
          ?.whereNotNull()
          .map((e) => FaceMatch.fromJson(e as Map<String, dynamic>))
          .toList(),
      person: json['Person'] != null
          ? PersonDetail.fromJson(json['Person'] as Map<String, dynamic>)
          : null,
      timestamp: json['Timestamp'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final faceMatches = this.faceMatches;
    final person = this.person;
    final timestamp = this.timestamp;
    return {
      if (faceMatches != null) 'FaceMatches': faceMatches,
      if (person != null) 'Person': person,
      if (timestamp != null) 'Timestamp': timestamp,
    };
  }
}

enum PersonTrackingSortBy {
  $index,
  timestamp,
}

extension PersonTrackingSortByValueExtension on PersonTrackingSortBy {
  String toValue() {
    switch (this) {
      case PersonTrackingSortBy.$index:
        return 'INDEX';
      case PersonTrackingSortBy.timestamp:
        return 'TIMESTAMP';
    }
  }
}

extension PersonTrackingSortByFromString on String {
  PersonTrackingSortBy toPersonTrackingSortBy() {
    switch (this) {
      case 'INDEX':
        return PersonTrackingSortBy.$index;
      case 'TIMESTAMP':
        return PersonTrackingSortBy.timestamp;
    }
    throw Exception('$this is not known in enum PersonTrackingSortBy');
  }
}

/// The X and Y coordinates of a point on an image or video frame. The X and Y
/// values are ratios of the overall image size or video resolution. For
/// example, if an input image is 700x200 and the values are X=0.5 and Y=0.25,
/// then the point is at the (350,50) pixel coordinate on the image.
///
/// An array of <code>Point</code> objects makes up a <code>Polygon</code>. A
/// <code>Polygon</code> is returned by <a>DetectText</a> and by
/// <a>DetectCustomLabels</a> <code>Polygon</code> represents a fine-grained
/// polygon around a detected item. For more information, see Geometry in the
/// Amazon Rekognition Developer Guide.
class Point {
  /// The value of the X coordinate for a point on a <code>Polygon</code>.
  final double? x;

  /// The value of the Y coordinate for a point on a <code>Polygon</code>.
  final double? y;

  Point({
    this.x,
    this.y,
  });

  factory Point.fromJson(Map<String, dynamic> json) {
    return Point(
      x: json['X'] as double?,
      y: json['Y'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final x = this.x;
    final y = this.y;
    return {
      if (x != null) 'X': x,
      if (y != null) 'Y': y,
    };
  }
}

/// Indicates the pose of the face as determined by its pitch, roll, and yaw.
class Pose {
  /// Value representing the face rotation on the pitch axis.
  final double? pitch;

  /// Value representing the face rotation on the roll axis.
  final double? roll;

  /// Value representing the face rotation on the yaw axis.
  final double? yaw;

  Pose({
    this.pitch,
    this.roll,
    this.yaw,
  });

  factory Pose.fromJson(Map<String, dynamic> json) {
    return Pose(
      pitch: json['Pitch'] as double?,
      roll: json['Roll'] as double?,
      yaw: json['Yaw'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final pitch = this.pitch;
    final roll = this.roll;
    final yaw = this.yaw;
    return {
      if (pitch != null) 'Pitch': pitch,
      if (roll != null) 'Roll': roll,
      if (yaw != null) 'Yaw': yaw,
    };
  }
}

enum ProjectAutoUpdate {
  enabled,
  disabled,
}

extension ProjectAutoUpdateValueExtension on ProjectAutoUpdate {
  String toValue() {
    switch (this) {
      case ProjectAutoUpdate.enabled:
        return 'ENABLED';
      case ProjectAutoUpdate.disabled:
        return 'DISABLED';
    }
  }
}

extension ProjectAutoUpdateFromString on String {
  ProjectAutoUpdate toProjectAutoUpdate() {
    switch (this) {
      case 'ENABLED':
        return ProjectAutoUpdate.enabled;
      case 'DISABLED':
        return ProjectAutoUpdate.disabled;
    }
    throw Exception('$this is not known in enum ProjectAutoUpdate');
  }
}

/// A description of an Amazon Rekognition Custom Labels project. For more
/// information, see <a>DescribeProjects</a>.
class ProjectDescription {
  /// Indicates whether automatic retraining will be attempted for the versions of
  /// the project. Applies only to adapters.
  final ProjectAutoUpdate? autoUpdate;

  /// The Unix timestamp for the date and time that the project was created.
  final DateTime? creationTimestamp;

  /// Information about the training and test datasets in the project.
  final List<DatasetMetadata>? datasets;

  /// Specifies the project that is being customized.
  final CustomizationFeature? feature;

  /// The Amazon Resource Name (ARN) of the project.
  final String? projectArn;

  /// The current status of the project.
  final ProjectStatus? status;

  ProjectDescription({
    this.autoUpdate,
    this.creationTimestamp,
    this.datasets,
    this.feature,
    this.projectArn,
    this.status,
  });

  factory ProjectDescription.fromJson(Map<String, dynamic> json) {
    return ProjectDescription(
      autoUpdate: (json['AutoUpdate'] as String?)?.toProjectAutoUpdate(),
      creationTimestamp: timeStampFromJson(json['CreationTimestamp']),
      datasets: (json['Datasets'] as List?)
          ?.whereNotNull()
          .map((e) => DatasetMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      feature: (json['Feature'] as String?)?.toCustomizationFeature(),
      projectArn: json['ProjectArn'] as String?,
      status: (json['Status'] as String?)?.toProjectStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final autoUpdate = this.autoUpdate;
    final creationTimestamp = this.creationTimestamp;
    final datasets = this.datasets;
    final feature = this.feature;
    final projectArn = this.projectArn;
    final status = this.status;
    return {
      if (autoUpdate != null) 'AutoUpdate': autoUpdate.toValue(),
      if (creationTimestamp != null)
        'CreationTimestamp': unixTimestampToJson(creationTimestamp),
      if (datasets != null) 'Datasets': datasets,
      if (feature != null) 'Feature': feature.toValue(),
      if (projectArn != null) 'ProjectArn': projectArn,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// Describes a project policy in the response from <a>ListProjectPolicies</a>.
///
///
class ProjectPolicy {
  /// The Unix datetime for the creation of the project policy.
  final DateTime? creationTimestamp;

  /// The Unix datetime for when the project policy was last updated.
  final DateTime? lastUpdatedTimestamp;

  /// The JSON document for the project policy.
  final String? policyDocument;

  /// The name of the project policy.
  final String? policyName;

  /// The revision ID of the project policy.
  final String? policyRevisionId;

  /// The Amazon Resource Name (ARN) of the project to which the project policy is
  /// attached.
  final String? projectArn;

  ProjectPolicy({
    this.creationTimestamp,
    this.lastUpdatedTimestamp,
    this.policyDocument,
    this.policyName,
    this.policyRevisionId,
    this.projectArn,
  });

  factory ProjectPolicy.fromJson(Map<String, dynamic> json) {
    return ProjectPolicy(
      creationTimestamp: timeStampFromJson(json['CreationTimestamp']),
      lastUpdatedTimestamp: timeStampFromJson(json['LastUpdatedTimestamp']),
      policyDocument: json['PolicyDocument'] as String?,
      policyName: json['PolicyName'] as String?,
      policyRevisionId: json['PolicyRevisionId'] as String?,
      projectArn: json['ProjectArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTimestamp = this.creationTimestamp;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final policyDocument = this.policyDocument;
    final policyName = this.policyName;
    final policyRevisionId = this.policyRevisionId;
    final projectArn = this.projectArn;
    return {
      if (creationTimestamp != null)
        'CreationTimestamp': unixTimestampToJson(creationTimestamp),
      if (lastUpdatedTimestamp != null)
        'LastUpdatedTimestamp': unixTimestampToJson(lastUpdatedTimestamp),
      if (policyDocument != null) 'PolicyDocument': policyDocument,
      if (policyName != null) 'PolicyName': policyName,
      if (policyRevisionId != null) 'PolicyRevisionId': policyRevisionId,
      if (projectArn != null) 'ProjectArn': projectArn,
    };
  }
}

enum ProjectStatus {
  creating,
  created,
  deleting,
}

extension ProjectStatusValueExtension on ProjectStatus {
  String toValue() {
    switch (this) {
      case ProjectStatus.creating:
        return 'CREATING';
      case ProjectStatus.created:
        return 'CREATED';
      case ProjectStatus.deleting:
        return 'DELETING';
    }
  }
}

extension ProjectStatusFromString on String {
  ProjectStatus toProjectStatus() {
    switch (this) {
      case 'CREATING':
        return ProjectStatus.creating;
      case 'CREATED':
        return ProjectStatus.created;
      case 'DELETING':
        return ProjectStatus.deleting;
    }
    throw Exception('$this is not known in enum ProjectStatus');
  }
}

/// A description of a version of a Amazon Rekognition project version.
class ProjectVersionDescription {
  /// The base detection model version used to create the project version.
  final String? baseModelVersion;

  /// The duration, in seconds, that you were billed for a successful training of
  /// the model version. This value is only returned if the model version has been
  /// successfully trained.
  final int? billableTrainingTimeInSeconds;

  /// The Unix datetime for the date and time that training started.
  final DateTime? creationTimestamp;

  /// The training results. <code>EvaluationResult</code> is only returned if
  /// training is successful.
  final EvaluationResult? evaluationResult;

  /// The feature that was customized.
  final CustomizationFeature? feature;

  /// Feature specific configuration that was applied during training.
  final CustomizationFeatureConfig? featureConfig;

  /// The identifer for the AWS Key Management Service key (AWS KMS key) that was
  /// used to encrypt the model during training.
  final String? kmsKeyId;

  /// The location of the summary manifest. The summary manifest provides
  /// aggregate data validation results for the training and test datasets.
  final GroundTruthManifest? manifestSummary;

  /// The maximum number of inference units Amazon Rekognition uses to auto-scale
  /// the model. Applies only to Custom Labels projects. For more information, see
  /// <a>StartProjectVersion</a>.
  final int? maxInferenceUnits;

  /// The minimum number of inference units used by the model. Applies only to
  /// Custom Labels projects. For more information, see
  /// <a>StartProjectVersion</a>.
  final int? minInferenceUnits;

  /// The location where training results are saved.
  final OutputConfig? outputConfig;

  /// The Amazon Resource Name (ARN) of the project version.
  final String? projectVersionArn;

  /// If the model version was copied from a different project,
  /// <code>SourceProjectVersionArn</code> contains the ARN of the source model
  /// version.
  final String? sourceProjectVersionArn;

  /// The current status of the model version.
  final ProjectVersionStatus? status;

  /// A descriptive message for an error or warning that occurred.
  final String? statusMessage;

  /// Contains information about the testing results.
  final TestingDataResult? testingDataResult;

  /// Contains information about the training results.
  final TrainingDataResult? trainingDataResult;

  /// The Unix date and time that training of the model ended.
  final DateTime? trainingEndTimestamp;

  /// A user-provided description of the project version.
  final String? versionDescription;

  ProjectVersionDescription({
    this.baseModelVersion,
    this.billableTrainingTimeInSeconds,
    this.creationTimestamp,
    this.evaluationResult,
    this.feature,
    this.featureConfig,
    this.kmsKeyId,
    this.manifestSummary,
    this.maxInferenceUnits,
    this.minInferenceUnits,
    this.outputConfig,
    this.projectVersionArn,
    this.sourceProjectVersionArn,
    this.status,
    this.statusMessage,
    this.testingDataResult,
    this.trainingDataResult,
    this.trainingEndTimestamp,
    this.versionDescription,
  });

  factory ProjectVersionDescription.fromJson(Map<String, dynamic> json) {
    return ProjectVersionDescription(
      baseModelVersion: json['BaseModelVersion'] as String?,
      billableTrainingTimeInSeconds:
          json['BillableTrainingTimeInSeconds'] as int?,
      creationTimestamp: timeStampFromJson(json['CreationTimestamp']),
      evaluationResult: json['EvaluationResult'] != null
          ? EvaluationResult.fromJson(
              json['EvaluationResult'] as Map<String, dynamic>)
          : null,
      feature: (json['Feature'] as String?)?.toCustomizationFeature(),
      featureConfig: json['FeatureConfig'] != null
          ? CustomizationFeatureConfig.fromJson(
              json['FeatureConfig'] as Map<String, dynamic>)
          : null,
      kmsKeyId: json['KmsKeyId'] as String?,
      manifestSummary: json['ManifestSummary'] != null
          ? GroundTruthManifest.fromJson(
              json['ManifestSummary'] as Map<String, dynamic>)
          : null,
      maxInferenceUnits: json['MaxInferenceUnits'] as int?,
      minInferenceUnits: json['MinInferenceUnits'] as int?,
      outputConfig: json['OutputConfig'] != null
          ? OutputConfig.fromJson(json['OutputConfig'] as Map<String, dynamic>)
          : null,
      projectVersionArn: json['ProjectVersionArn'] as String?,
      sourceProjectVersionArn: json['SourceProjectVersionArn'] as String?,
      status: (json['Status'] as String?)?.toProjectVersionStatus(),
      statusMessage: json['StatusMessage'] as String?,
      testingDataResult: json['TestingDataResult'] != null
          ? TestingDataResult.fromJson(
              json['TestingDataResult'] as Map<String, dynamic>)
          : null,
      trainingDataResult: json['TrainingDataResult'] != null
          ? TrainingDataResult.fromJson(
              json['TrainingDataResult'] as Map<String, dynamic>)
          : null,
      trainingEndTimestamp: timeStampFromJson(json['TrainingEndTimestamp']),
      versionDescription: json['VersionDescription'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final baseModelVersion = this.baseModelVersion;
    final billableTrainingTimeInSeconds = this.billableTrainingTimeInSeconds;
    final creationTimestamp = this.creationTimestamp;
    final evaluationResult = this.evaluationResult;
    final feature = this.feature;
    final featureConfig = this.featureConfig;
    final kmsKeyId = this.kmsKeyId;
    final manifestSummary = this.manifestSummary;
    final maxInferenceUnits = this.maxInferenceUnits;
    final minInferenceUnits = this.minInferenceUnits;
    final outputConfig = this.outputConfig;
    final projectVersionArn = this.projectVersionArn;
    final sourceProjectVersionArn = this.sourceProjectVersionArn;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final testingDataResult = this.testingDataResult;
    final trainingDataResult = this.trainingDataResult;
    final trainingEndTimestamp = this.trainingEndTimestamp;
    final versionDescription = this.versionDescription;
    return {
      if (baseModelVersion != null) 'BaseModelVersion': baseModelVersion,
      if (billableTrainingTimeInSeconds != null)
        'BillableTrainingTimeInSeconds': billableTrainingTimeInSeconds,
      if (creationTimestamp != null)
        'CreationTimestamp': unixTimestampToJson(creationTimestamp),
      if (evaluationResult != null) 'EvaluationResult': evaluationResult,
      if (feature != null) 'Feature': feature.toValue(),
      if (featureConfig != null) 'FeatureConfig': featureConfig,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (manifestSummary != null) 'ManifestSummary': manifestSummary,
      if (maxInferenceUnits != null) 'MaxInferenceUnits': maxInferenceUnits,
      if (minInferenceUnits != null) 'MinInferenceUnits': minInferenceUnits,
      if (outputConfig != null) 'OutputConfig': outputConfig,
      if (projectVersionArn != null) 'ProjectVersionArn': projectVersionArn,
      if (sourceProjectVersionArn != null)
        'SourceProjectVersionArn': sourceProjectVersionArn,
      if (status != null) 'Status': status.toValue(),
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (testingDataResult != null) 'TestingDataResult': testingDataResult,
      if (trainingDataResult != null) 'TrainingDataResult': trainingDataResult,
      if (trainingEndTimestamp != null)
        'TrainingEndTimestamp': unixTimestampToJson(trainingEndTimestamp),
      if (versionDescription != null) 'VersionDescription': versionDescription,
    };
  }
}

enum ProjectVersionStatus {
  trainingInProgress,
  trainingCompleted,
  trainingFailed,
  starting,
  running,
  failed,
  stopping,
  stopped,
  deleting,
  copyingInProgress,
  copyingCompleted,
  copyingFailed,
  deprecated,
  expired,
}

extension ProjectVersionStatusValueExtension on ProjectVersionStatus {
  String toValue() {
    switch (this) {
      case ProjectVersionStatus.trainingInProgress:
        return 'TRAINING_IN_PROGRESS';
      case ProjectVersionStatus.trainingCompleted:
        return 'TRAINING_COMPLETED';
      case ProjectVersionStatus.trainingFailed:
        return 'TRAINING_FAILED';
      case ProjectVersionStatus.starting:
        return 'STARTING';
      case ProjectVersionStatus.running:
        return 'RUNNING';
      case ProjectVersionStatus.failed:
        return 'FAILED';
      case ProjectVersionStatus.stopping:
        return 'STOPPING';
      case ProjectVersionStatus.stopped:
        return 'STOPPED';
      case ProjectVersionStatus.deleting:
        return 'DELETING';
      case ProjectVersionStatus.copyingInProgress:
        return 'COPYING_IN_PROGRESS';
      case ProjectVersionStatus.copyingCompleted:
        return 'COPYING_COMPLETED';
      case ProjectVersionStatus.copyingFailed:
        return 'COPYING_FAILED';
      case ProjectVersionStatus.deprecated:
        return 'DEPRECATED';
      case ProjectVersionStatus.expired:
        return 'EXPIRED';
    }
  }
}

extension ProjectVersionStatusFromString on String {
  ProjectVersionStatus toProjectVersionStatus() {
    switch (this) {
      case 'TRAINING_IN_PROGRESS':
        return ProjectVersionStatus.trainingInProgress;
      case 'TRAINING_COMPLETED':
        return ProjectVersionStatus.trainingCompleted;
      case 'TRAINING_FAILED':
        return ProjectVersionStatus.trainingFailed;
      case 'STARTING':
        return ProjectVersionStatus.starting;
      case 'RUNNING':
        return ProjectVersionStatus.running;
      case 'FAILED':
        return ProjectVersionStatus.failed;
      case 'STOPPING':
        return ProjectVersionStatus.stopping;
      case 'STOPPED':
        return ProjectVersionStatus.stopped;
      case 'DELETING':
        return ProjectVersionStatus.deleting;
      case 'COPYING_IN_PROGRESS':
        return ProjectVersionStatus.copyingInProgress;
      case 'COPYING_COMPLETED':
        return ProjectVersionStatus.copyingCompleted;
      case 'COPYING_FAILED':
        return ProjectVersionStatus.copyingFailed;
      case 'DEPRECATED':
        return ProjectVersionStatus.deprecated;
      case 'EXPIRED':
        return ProjectVersionStatus.expired;
    }
    throw Exception('$this is not known in enum ProjectVersionStatus');
  }
}

/// Information about a body part detected by <a>DetectProtectiveEquipment</a>
/// that contains PPE. An array of <code>ProtectiveEquipmentBodyPart</code>
/// objects is returned for each person detected by
/// <code>DetectProtectiveEquipment</code>.
class ProtectiveEquipmentBodyPart {
  /// The confidence that Amazon Rekognition has in the detection accuracy of the
  /// detected body part.
  final double? confidence;

  /// An array of Personal Protective Equipment items detected around a body part.
  final List<EquipmentDetection>? equipmentDetections;

  /// The detected body part.
  final BodyPart? name;

  ProtectiveEquipmentBodyPart({
    this.confidence,
    this.equipmentDetections,
    this.name,
  });

  factory ProtectiveEquipmentBodyPart.fromJson(Map<String, dynamic> json) {
    return ProtectiveEquipmentBodyPart(
      confidence: json['Confidence'] as double?,
      equipmentDetections: (json['EquipmentDetections'] as List?)
          ?.whereNotNull()
          .map((e) => EquipmentDetection.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: (json['Name'] as String?)?.toBodyPart(),
    );
  }

  Map<String, dynamic> toJson() {
    final confidence = this.confidence;
    final equipmentDetections = this.equipmentDetections;
    final name = this.name;
    return {
      if (confidence != null) 'Confidence': confidence,
      if (equipmentDetections != null)
        'EquipmentDetections': equipmentDetections,
      if (name != null) 'Name': name.toValue(),
    };
  }
}

/// A person detected by a call to <a>DetectProtectiveEquipment</a>. The API
/// returns all persons detected in the input image in an array of
/// <code>ProtectiveEquipmentPerson</code> objects.
class ProtectiveEquipmentPerson {
  /// An array of body parts detected on a person's body (including body parts
  /// without PPE).
  final List<ProtectiveEquipmentBodyPart>? bodyParts;

  /// A bounding box around the detected person.
  final BoundingBox? boundingBox;

  /// The confidence that Amazon Rekognition has that the bounding box contains a
  /// person.
  final double? confidence;

  /// The identifier for the detected person. The identifier is only unique for a
  /// single call to <code>DetectProtectiveEquipment</code>.
  final int? id;

  ProtectiveEquipmentPerson({
    this.bodyParts,
    this.boundingBox,
    this.confidence,
    this.id,
  });

  factory ProtectiveEquipmentPerson.fromJson(Map<String, dynamic> json) {
    return ProtectiveEquipmentPerson(
      bodyParts: (json['BodyParts'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ProtectiveEquipmentBodyPart.fromJson(e as Map<String, dynamic>))
          .toList(),
      boundingBox: json['BoundingBox'] != null
          ? BoundingBox.fromJson(json['BoundingBox'] as Map<String, dynamic>)
          : null,
      confidence: json['Confidence'] as double?,
      id: json['Id'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final bodyParts = this.bodyParts;
    final boundingBox = this.boundingBox;
    final confidence = this.confidence;
    final id = this.id;
    return {
      if (bodyParts != null) 'BodyParts': bodyParts,
      if (boundingBox != null) 'BoundingBox': boundingBox,
      if (confidence != null) 'Confidence': confidence,
      if (id != null) 'Id': id,
    };
  }
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
  final double minConfidence;

  /// An array of personal protective equipment types for which you want summary
  /// information. If a person is detected wearing a required requipment type, the
  /// person's ID is added to the <code>PersonsWithRequiredEquipment</code> array
  /// field returned in <a>ProtectiveEquipmentSummary</a> by
  /// <code>DetectProtectiveEquipment</code>.
  final List<ProtectiveEquipmentType> requiredEquipmentTypes;

  ProtectiveEquipmentSummarizationAttributes({
    required this.minConfidence,
    required this.requiredEquipmentTypes,
  });

  Map<String, dynamic> toJson() {
    final minConfidence = this.minConfidence;
    final requiredEquipmentTypes = this.requiredEquipmentTypes;
    return {
      'MinConfidence': minConfidence,
      'RequiredEquipmentTypes':
          requiredEquipmentTypes.map((e) => e.toValue()).toList(),
    };
  }
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
class ProtectiveEquipmentSummary {
  /// An array of IDs for persons where it was not possible to determine if they
  /// are wearing personal protective equipment.
  final List<int>? personsIndeterminate;

  /// An array of IDs for persons who are wearing detected personal protective
  /// equipment.
  final List<int>? personsWithRequiredEquipment;

  /// An array of IDs for persons who are not wearing all of the types of PPE
  /// specified in the <code>RequiredEquipmentTypes</code> field of the detected
  /// personal protective equipment.
  final List<int>? personsWithoutRequiredEquipment;

  ProtectiveEquipmentSummary({
    this.personsIndeterminate,
    this.personsWithRequiredEquipment,
    this.personsWithoutRequiredEquipment,
  });

  factory ProtectiveEquipmentSummary.fromJson(Map<String, dynamic> json) {
    return ProtectiveEquipmentSummary(
      personsIndeterminate: (json['PersonsIndeterminate'] as List?)
          ?.whereNotNull()
          .map((e) => e as int)
          .toList(),
      personsWithRequiredEquipment:
          (json['PersonsWithRequiredEquipment'] as List?)
              ?.whereNotNull()
              .map((e) => e as int)
              .toList(),
      personsWithoutRequiredEquipment:
          (json['PersonsWithoutRequiredEquipment'] as List?)
              ?.whereNotNull()
              .map((e) => e as int)
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final personsIndeterminate = this.personsIndeterminate;
    final personsWithRequiredEquipment = this.personsWithRequiredEquipment;
    final personsWithoutRequiredEquipment =
        this.personsWithoutRequiredEquipment;
    return {
      if (personsIndeterminate != null)
        'PersonsIndeterminate': personsIndeterminate,
      if (personsWithRequiredEquipment != null)
        'PersonsWithRequiredEquipment': personsWithRequiredEquipment,
      if (personsWithoutRequiredEquipment != null)
        'PersonsWithoutRequiredEquipment': personsWithoutRequiredEquipment,
    };
  }
}

enum ProtectiveEquipmentType {
  faceCover,
  handCover,
  headCover,
}

extension ProtectiveEquipmentTypeValueExtension on ProtectiveEquipmentType {
  String toValue() {
    switch (this) {
      case ProtectiveEquipmentType.faceCover:
        return 'FACE_COVER';
      case ProtectiveEquipmentType.handCover:
        return 'HAND_COVER';
      case ProtectiveEquipmentType.headCover:
        return 'HEAD_COVER';
    }
  }
}

extension ProtectiveEquipmentTypeFromString on String {
  ProtectiveEquipmentType toProtectiveEquipmentType() {
    switch (this) {
      case 'FACE_COVER':
        return ProtectiveEquipmentType.faceCover;
      case 'HAND_COVER':
        return ProtectiveEquipmentType.handCover;
      case 'HEAD_COVER':
        return ProtectiveEquipmentType.headCover;
    }
    throw Exception('$this is not known in enum ProtectiveEquipmentType');
  }
}

class PutProjectPolicyResponse {
  /// The ID of the project policy.
  final String? policyRevisionId;

  PutProjectPolicyResponse({
    this.policyRevisionId,
  });

  factory PutProjectPolicyResponse.fromJson(Map<String, dynamic> json) {
    return PutProjectPolicyResponse(
      policyRevisionId: json['PolicyRevisionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policyRevisionId = this.policyRevisionId;
    return {
      if (policyRevisionId != null) 'PolicyRevisionId': policyRevisionId,
    };
  }
}

enum QualityFilter {
  none,
  auto,
  low,
  medium,
  high,
}

extension QualityFilterValueExtension on QualityFilter {
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
  }
}

extension QualityFilterFromString on String {
  QualityFilter toQualityFilter() {
    switch (this) {
      case 'NONE':
        return QualityFilter.none;
      case 'AUTO':
        return QualityFilter.auto;
      case 'LOW':
        return QualityFilter.low;
      case 'MEDIUM':
        return QualityFilter.medium;
      case 'HIGH':
        return QualityFilter.high;
    }
    throw Exception('$this is not known in enum QualityFilter');
  }
}

enum Reason {
  exceedsMaxFaces,
  extremePose,
  lowBrightness,
  lowSharpness,
  lowConfidence,
  smallBoundingBox,
  lowFaceQuality,
}

extension ReasonValueExtension on Reason {
  String toValue() {
    switch (this) {
      case Reason.exceedsMaxFaces:
        return 'EXCEEDS_MAX_FACES';
      case Reason.extremePose:
        return 'EXTREME_POSE';
      case Reason.lowBrightness:
        return 'LOW_BRIGHTNESS';
      case Reason.lowSharpness:
        return 'LOW_SHARPNESS';
      case Reason.lowConfidence:
        return 'LOW_CONFIDENCE';
      case Reason.smallBoundingBox:
        return 'SMALL_BOUNDING_BOX';
      case Reason.lowFaceQuality:
        return 'LOW_FACE_QUALITY';
    }
  }
}

extension ReasonFromString on String {
  Reason toReason() {
    switch (this) {
      case 'EXCEEDS_MAX_FACES':
        return Reason.exceedsMaxFaces;
      case 'EXTREME_POSE':
        return Reason.extremePose;
      case 'LOW_BRIGHTNESS':
        return Reason.lowBrightness;
      case 'LOW_SHARPNESS':
        return Reason.lowSharpness;
      case 'LOW_CONFIDENCE':
        return Reason.lowConfidence;
      case 'SMALL_BOUNDING_BOX':
        return Reason.smallBoundingBox;
      case 'LOW_FACE_QUALITY':
        return Reason.lowFaceQuality;
    }
    throw Exception('$this is not known in enum Reason');
  }
}

class RecognizeCelebritiesResponse {
  /// Details about each celebrity found in the image. Amazon Rekognition can
  /// detect a maximum of 64 celebrities in an image. Each celebrity object
  /// includes the following attributes: <code>Face</code>,
  /// <code>Confidence</code>, <code>Emotions</code>, <code>Landmarks</code>,
  /// <code>Pose</code>, <code>Quality</code>, <code>Smile</code>,
  /// <code>Id</code>, <code>KnownGender</code>, <code>MatchConfidence</code>,
  /// <code>Name</code>, <code>Urls</code>.
  final List<Celebrity>? celebrityFaces;

  /// <note>
  /// Support for estimating image orientation using the the OrientationCorrection
  /// field has ceased as of August 2021. Any returned values for this field
  /// included in an API response will always be NULL.
  /// </note>
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
  final OrientationCorrection? orientationCorrection;

  /// Details about each unrecognized face in the image.
  final List<ComparedFace>? unrecognizedFaces;

  RecognizeCelebritiesResponse({
    this.celebrityFaces,
    this.orientationCorrection,
    this.unrecognizedFaces,
  });

  factory RecognizeCelebritiesResponse.fromJson(Map<String, dynamic> json) {
    return RecognizeCelebritiesResponse(
      celebrityFaces: (json['CelebrityFaces'] as List?)
          ?.whereNotNull()
          .map((e) => Celebrity.fromJson(e as Map<String, dynamic>))
          .toList(),
      orientationCorrection:
          (json['OrientationCorrection'] as String?)?.toOrientationCorrection(),
      unrecognizedFaces: (json['UnrecognizedFaces'] as List?)
          ?.whereNotNull()
          .map((e) => ComparedFace.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final celebrityFaces = this.celebrityFaces;
    final orientationCorrection = this.orientationCorrection;
    final unrecognizedFaces = this.unrecognizedFaces;
    return {
      if (celebrityFaces != null) 'CelebrityFaces': celebrityFaces,
      if (orientationCorrection != null)
        'OrientationCorrection': orientationCorrection.toValue(),
      if (unrecognizedFaces != null) 'UnrecognizedFaces': unrecognizedFaces,
    };
  }
}

/// Specifies a location within the frame that Rekognition checks for objects of
/// interest such as text, labels, or faces. It uses a <code>BoundingBox</code>
/// or <code>Polygon</code> to set a region of the screen.
///
/// A word, face, or label is included in the region if it is more than half in
/// that region. If there is more than one region, the word, face, or label is
/// compared with all regions of the screen. Any object of interest that is more
/// than half in a region is kept in the results.
class RegionOfInterest {
  /// The box representing a region of interest on screen.
  final BoundingBox? boundingBox;

  /// Specifies a shape made up of up to 10 <code>Point</code> objects to define a
  /// region of interest.
  final List<Point>? polygon;

  RegionOfInterest({
    this.boundingBox,
    this.polygon,
  });

  factory RegionOfInterest.fromJson(Map<String, dynamic> json) {
    return RegionOfInterest(
      boundingBox: json['BoundingBox'] != null
          ? BoundingBox.fromJson(json['BoundingBox'] as Map<String, dynamic>)
          : null,
      polygon: (json['Polygon'] as List?)
          ?.whereNotNull()
          .map((e) => Point.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final boundingBox = this.boundingBox;
    final polygon = this.polygon;
    return {
      if (boundingBox != null) 'BoundingBox': boundingBox,
      if (polygon != null) 'Polygon': polygon,
    };
  }
}

/// The Amazon S3 bucket location to which Amazon Rekognition publishes the
/// detailed inference results of a video analysis operation. These results
/// include the name of the stream processor resource, the session ID of the
/// stream processing session, and labeled timestamps and bounding boxes for
/// detected labels.
class S3Destination {
  /// The name of the Amazon S3 bucket you want to associate with the streaming
  /// video project. You must be the owner of the Amazon S3 bucket.
  final String? bucket;

  /// The prefix value of the location within the bucket that you want the
  /// information to be published to. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-prefixes.html">Using
  /// prefixes</a>.
  final String? keyPrefix;

  S3Destination({
    this.bucket,
    this.keyPrefix,
  });

  factory S3Destination.fromJson(Map<String, dynamic> json) {
    return S3Destination(
      bucket: json['Bucket'] as String?,
      keyPrefix: json['KeyPrefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final keyPrefix = this.keyPrefix;
    return {
      if (bucket != null) 'Bucket': bucket,
      if (keyPrefix != null) 'KeyPrefix': keyPrefix,
    };
  }
}

/// Provides the S3 bucket name and object name.
///
/// The region for the S3 bucket containing the S3 object must match the region
/// you use for Amazon Rekognition operations.
///
/// For Amazon Rekognition to process an S3 object, the user must have
/// permission to access the S3 object. For more information, see How Amazon
/// Rekognition works with IAM in the Amazon Rekognition Developer Guide.
class S3Object {
  /// Name of the S3 bucket.
  final String? bucket;

  /// S3 object key name.
  final String? name;

  /// If the bucket is versioning enabled, you can specify the object version.
  final String? version;

  S3Object({
    this.bucket,
    this.name,
    this.version,
  });

  factory S3Object.fromJson(Map<String, dynamic> json) {
    return S3Object(
      bucket: json['Bucket'] as String?,
      name: json['Name'] as String?,
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final name = this.name;
    final version = this.version;
    return {
      if (bucket != null) 'Bucket': bucket,
      if (name != null) 'Name': name,
      if (version != null) 'Version': version,
    };
  }
}

class SearchFacesByImageResponse {
  /// An array of faces that match the input face, along with the confidence in
  /// the match.
  final List<FaceMatch>? faceMatches;

  /// Version number of the face detection model associated with the input
  /// collection (<code>CollectionId</code>).
  final String? faceModelVersion;

  /// The bounding box around the face in the input image that Amazon Rekognition
  /// used for the search.
  final BoundingBox? searchedFaceBoundingBox;

  /// The level of confidence that the <code>searchedFaceBoundingBox</code>,
  /// contains a face.
  final double? searchedFaceConfidence;

  SearchFacesByImageResponse({
    this.faceMatches,
    this.faceModelVersion,
    this.searchedFaceBoundingBox,
    this.searchedFaceConfidence,
  });

  factory SearchFacesByImageResponse.fromJson(Map<String, dynamic> json) {
    return SearchFacesByImageResponse(
      faceMatches: (json['FaceMatches'] as List?)
          ?.whereNotNull()
          .map((e) => FaceMatch.fromJson(e as Map<String, dynamic>))
          .toList(),
      faceModelVersion: json['FaceModelVersion'] as String?,
      searchedFaceBoundingBox: json['SearchedFaceBoundingBox'] != null
          ? BoundingBox.fromJson(
              json['SearchedFaceBoundingBox'] as Map<String, dynamic>)
          : null,
      searchedFaceConfidence: json['SearchedFaceConfidence'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final faceMatches = this.faceMatches;
    final faceModelVersion = this.faceModelVersion;
    final searchedFaceBoundingBox = this.searchedFaceBoundingBox;
    final searchedFaceConfidence = this.searchedFaceConfidence;
    return {
      if (faceMatches != null) 'FaceMatches': faceMatches,
      if (faceModelVersion != null) 'FaceModelVersion': faceModelVersion,
      if (searchedFaceBoundingBox != null)
        'SearchedFaceBoundingBox': searchedFaceBoundingBox,
      if (searchedFaceConfidence != null)
        'SearchedFaceConfidence': searchedFaceConfidence,
    };
  }
}

class SearchFacesResponse {
  /// An array of faces that matched the input face, along with the confidence in
  /// the match.
  final List<FaceMatch>? faceMatches;

  /// Version number of the face detection model associated with the input
  /// collection (<code>CollectionId</code>).
  final String? faceModelVersion;

  /// ID of the face that was searched for matches in a collection.
  final String? searchedFaceId;

  SearchFacesResponse({
    this.faceMatches,
    this.faceModelVersion,
    this.searchedFaceId,
  });

  factory SearchFacesResponse.fromJson(Map<String, dynamic> json) {
    return SearchFacesResponse(
      faceMatches: (json['FaceMatches'] as List?)
          ?.whereNotNull()
          .map((e) => FaceMatch.fromJson(e as Map<String, dynamic>))
          .toList(),
      faceModelVersion: json['FaceModelVersion'] as String?,
      searchedFaceId: json['SearchedFaceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final faceMatches = this.faceMatches;
    final faceModelVersion = this.faceModelVersion;
    final searchedFaceId = this.searchedFaceId;
    return {
      if (faceMatches != null) 'FaceMatches': faceMatches,
      if (faceModelVersion != null) 'FaceModelVersion': faceModelVersion,
      if (searchedFaceId != null) 'SearchedFaceId': searchedFaceId,
    };
  }
}

class SearchUsersByImageResponse {
  /// Version number of the face detection model associated with the input
  /// collection CollectionId.
  final String? faceModelVersion;

  /// A list of FaceDetail objects containing the BoundingBox for the largest face
  /// in image, as well as the confidence in the bounding box, that was searched
  /// for matches. If no valid face is detected in the image the response will
  /// contain no SearchedFace object.
  final SearchedFaceDetails? searchedFace;

  /// List of UnsearchedFace objects. Contains the face details infered from the
  /// specified image but not used for search. Contains reasons that describe why
  /// a face wasn't used for Search.
  final List<UnsearchedFace>? unsearchedFaces;

  /// An array of UserID objects that matched the input face, along with the
  /// confidence in the match. The returned structure will be empty if there are
  /// no matches. Returned if the SearchUsersByImageResponse action is successful.
  final List<UserMatch>? userMatches;

  SearchUsersByImageResponse({
    this.faceModelVersion,
    this.searchedFace,
    this.unsearchedFaces,
    this.userMatches,
  });

  factory SearchUsersByImageResponse.fromJson(Map<String, dynamic> json) {
    return SearchUsersByImageResponse(
      faceModelVersion: json['FaceModelVersion'] as String?,
      searchedFace: json['SearchedFace'] != null
          ? SearchedFaceDetails.fromJson(
              json['SearchedFace'] as Map<String, dynamic>)
          : null,
      unsearchedFaces: (json['UnsearchedFaces'] as List?)
          ?.whereNotNull()
          .map((e) => UnsearchedFace.fromJson(e as Map<String, dynamic>))
          .toList(),
      userMatches: (json['UserMatches'] as List?)
          ?.whereNotNull()
          .map((e) => UserMatch.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final faceModelVersion = this.faceModelVersion;
    final searchedFace = this.searchedFace;
    final unsearchedFaces = this.unsearchedFaces;
    final userMatches = this.userMatches;
    return {
      if (faceModelVersion != null) 'FaceModelVersion': faceModelVersion,
      if (searchedFace != null) 'SearchedFace': searchedFace,
      if (unsearchedFaces != null) 'UnsearchedFaces': unsearchedFaces,
      if (userMatches != null) 'UserMatches': userMatches,
    };
  }
}

class SearchUsersResponse {
  /// Version number of the face detection model associated with the input
  /// CollectionId.
  final String? faceModelVersion;

  /// Contains the ID of a face that was used to search for matches in a
  /// collection.
  final SearchedFace? searchedFace;

  /// Contains the ID of the UserID that was used to search for matches in a
  /// collection.
  final SearchedUser? searchedUser;

  /// An array of UserMatch objects that matched the input face along with the
  /// confidence in the match. Array will be empty if there are no matches.
  final List<UserMatch>? userMatches;

  SearchUsersResponse({
    this.faceModelVersion,
    this.searchedFace,
    this.searchedUser,
    this.userMatches,
  });

  factory SearchUsersResponse.fromJson(Map<String, dynamic> json) {
    return SearchUsersResponse(
      faceModelVersion: json['FaceModelVersion'] as String?,
      searchedFace: json['SearchedFace'] != null
          ? SearchedFace.fromJson(json['SearchedFace'] as Map<String, dynamic>)
          : null,
      searchedUser: json['SearchedUser'] != null
          ? SearchedUser.fromJson(json['SearchedUser'] as Map<String, dynamic>)
          : null,
      userMatches: (json['UserMatches'] as List?)
          ?.whereNotNull()
          .map((e) => UserMatch.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final faceModelVersion = this.faceModelVersion;
    final searchedFace = this.searchedFace;
    final searchedUser = this.searchedUser;
    final userMatches = this.userMatches;
    return {
      if (faceModelVersion != null) 'FaceModelVersion': faceModelVersion,
      if (searchedFace != null) 'SearchedFace': searchedFace,
      if (searchedUser != null) 'SearchedUser': searchedUser,
      if (userMatches != null) 'UserMatches': userMatches,
    };
  }
}

/// Provides face metadata such as FaceId, BoundingBox, Confidence of the input
/// face used for search.
class SearchedFace {
  /// Unique identifier assigned to the face.
  final String? faceId;

  SearchedFace({
    this.faceId,
  });

  factory SearchedFace.fromJson(Map<String, dynamic> json) {
    return SearchedFace(
      faceId: json['FaceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final faceId = this.faceId;
    return {
      if (faceId != null) 'FaceId': faceId,
    };
  }
}

/// Contains data regarding the input face used for a search.
class SearchedFaceDetails {
  final FaceDetail? faceDetail;

  SearchedFaceDetails({
    this.faceDetail,
  });

  factory SearchedFaceDetails.fromJson(Map<String, dynamic> json) {
    return SearchedFaceDetails(
      faceDetail: json['FaceDetail'] != null
          ? FaceDetail.fromJson(json['FaceDetail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final faceDetail = this.faceDetail;
    return {
      if (faceDetail != null) 'FaceDetail': faceDetail,
    };
  }
}

/// Contains metadata about a User searched for within a collection.
class SearchedUser {
  /// A provided ID for the UserID. Unique within the collection.
  final String? userId;

  SearchedUser({
    this.userId,
  });

  factory SearchedUser.fromJson(Map<String, dynamic> json) {
    return SearchedUser(
      userId: json['UserId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final userId = this.userId;
    return {
      if (userId != null) 'UserId': userId,
    };
  }
}

/// A technical cue or shot detection segment detected in a video. An array of
/// <code>SegmentDetection</code> objects containing all segments detected in a
/// stored video is returned by <a>GetSegmentDetection</a>.
class SegmentDetection {
  /// The duration of a video segment, expressed in frames.
  final int? durationFrames;

  /// The duration of the detected segment in milliseconds.
  final int? durationMillis;

  /// The duration of the timecode for the detected segment in SMPTE format.
  final String? durationSMPTE;

  /// The frame number at the end of a video segment, using a frame index that
  /// starts with 0.
  final int? endFrameNumber;

  /// The frame-accurate SMPTE timecode, from the start of a video, for the end of
  /// a detected segment. <code>EndTimecode</code> is in <i>HH:MM:SS:fr</i> format
  /// (and <i>;fr</i> for drop frame-rates).
  final String? endTimecodeSMPTE;

  /// The end time of the detected segment, in milliseconds, from the start of the
  /// video. This value is rounded down.
  final int? endTimestampMillis;

  /// If the segment is a shot detection, contains information about the shot
  /// detection.
  final ShotSegment? shotSegment;

  /// The frame number of the start of a video segment, using a frame index that
  /// starts with 0.
  final int? startFrameNumber;

  /// The frame-accurate SMPTE timecode, from the start of a video, for the start
  /// of a detected segment. <code>StartTimecode</code> is in <i>HH:MM:SS:fr</i>
  /// format (and <i>;fr</i> for drop frame-rates).
  final String? startTimecodeSMPTE;

  /// The start time of the detected segment in milliseconds from the start of the
  /// video. This value is rounded down. For example, if the actual timestamp is
  /// 100.6667 milliseconds, Amazon Rekognition Video returns a value of 100
  /// millis.
  final int? startTimestampMillis;

  /// If the segment is a technical cue, contains information about the technical
  /// cue.
  final TechnicalCueSegment? technicalCueSegment;

  /// The type of the segment. Valid values are <code>TECHNICAL_CUE</code> and
  /// <code>SHOT</code>.
  final SegmentType? type;

  SegmentDetection({
    this.durationFrames,
    this.durationMillis,
    this.durationSMPTE,
    this.endFrameNumber,
    this.endTimecodeSMPTE,
    this.endTimestampMillis,
    this.shotSegment,
    this.startFrameNumber,
    this.startTimecodeSMPTE,
    this.startTimestampMillis,
    this.technicalCueSegment,
    this.type,
  });

  factory SegmentDetection.fromJson(Map<String, dynamic> json) {
    return SegmentDetection(
      durationFrames: json['DurationFrames'] as int?,
      durationMillis: json['DurationMillis'] as int?,
      durationSMPTE: json['DurationSMPTE'] as String?,
      endFrameNumber: json['EndFrameNumber'] as int?,
      endTimecodeSMPTE: json['EndTimecodeSMPTE'] as String?,
      endTimestampMillis: json['EndTimestampMillis'] as int?,
      shotSegment: json['ShotSegment'] != null
          ? ShotSegment.fromJson(json['ShotSegment'] as Map<String, dynamic>)
          : null,
      startFrameNumber: json['StartFrameNumber'] as int?,
      startTimecodeSMPTE: json['StartTimecodeSMPTE'] as String?,
      startTimestampMillis: json['StartTimestampMillis'] as int?,
      technicalCueSegment: json['TechnicalCueSegment'] != null
          ? TechnicalCueSegment.fromJson(
              json['TechnicalCueSegment'] as Map<String, dynamic>)
          : null,
      type: (json['Type'] as String?)?.toSegmentType(),
    );
  }

  Map<String, dynamic> toJson() {
    final durationFrames = this.durationFrames;
    final durationMillis = this.durationMillis;
    final durationSMPTE = this.durationSMPTE;
    final endFrameNumber = this.endFrameNumber;
    final endTimecodeSMPTE = this.endTimecodeSMPTE;
    final endTimestampMillis = this.endTimestampMillis;
    final shotSegment = this.shotSegment;
    final startFrameNumber = this.startFrameNumber;
    final startTimecodeSMPTE = this.startTimecodeSMPTE;
    final startTimestampMillis = this.startTimestampMillis;
    final technicalCueSegment = this.technicalCueSegment;
    final type = this.type;
    return {
      if (durationFrames != null) 'DurationFrames': durationFrames,
      if (durationMillis != null) 'DurationMillis': durationMillis,
      if (durationSMPTE != null) 'DurationSMPTE': durationSMPTE,
      if (endFrameNumber != null) 'EndFrameNumber': endFrameNumber,
      if (endTimecodeSMPTE != null) 'EndTimecodeSMPTE': endTimecodeSMPTE,
      if (endTimestampMillis != null) 'EndTimestampMillis': endTimestampMillis,
      if (shotSegment != null) 'ShotSegment': shotSegment,
      if (startFrameNumber != null) 'StartFrameNumber': startFrameNumber,
      if (startTimecodeSMPTE != null) 'StartTimecodeSMPTE': startTimecodeSMPTE,
      if (startTimestampMillis != null)
        'StartTimestampMillis': startTimestampMillis,
      if (technicalCueSegment != null)
        'TechnicalCueSegment': technicalCueSegment,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum SegmentType {
  technicalCue,
  shot,
}

extension SegmentTypeValueExtension on SegmentType {
  String toValue() {
    switch (this) {
      case SegmentType.technicalCue:
        return 'TECHNICAL_CUE';
      case SegmentType.shot:
        return 'SHOT';
    }
  }
}

extension SegmentTypeFromString on String {
  SegmentType toSegmentType() {
    switch (this) {
      case 'TECHNICAL_CUE':
        return SegmentType.technicalCue;
      case 'SHOT':
        return SegmentType.shot;
    }
    throw Exception('$this is not known in enum SegmentType');
  }
}

/// Information about the type of a segment requested in a call to
/// <a>StartSegmentDetection</a>. An array of <code>SegmentTypeInfo</code>
/// objects is returned by the response from <a>GetSegmentDetection</a>.
class SegmentTypeInfo {
  /// The version of the model used to detect segments.
  final String? modelVersion;

  /// The type of a segment (technical cue or shot detection).
  final SegmentType? type;

  SegmentTypeInfo({
    this.modelVersion,
    this.type,
  });

  factory SegmentTypeInfo.fromJson(Map<String, dynamic> json) {
    return SegmentTypeInfo(
      modelVersion: json['ModelVersion'] as String?,
      type: (json['Type'] as String?)?.toSegmentType(),
    );
  }

  Map<String, dynamic> toJson() {
    final modelVersion = this.modelVersion;
    final type = this.type;
    return {
      if (modelVersion != null) 'ModelVersion': modelVersion,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// Information about a shot detection segment detected in a video. For more
/// information, see <a>SegmentDetection</a>.
class ShotSegment {
  /// The confidence that Amazon Rekognition Video has in the accuracy of the
  /// detected segment.
  final double? confidence;

  /// An Identifier for a shot detection segment detected in a video.
  final int? index;

  ShotSegment({
    this.confidence,
    this.index,
  });

  factory ShotSegment.fromJson(Map<String, dynamic> json) {
    return ShotSegment(
      confidence: json['Confidence'] as double?,
      index: json['Index'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final confidence = this.confidence;
    final index = this.index;
    return {
      if (confidence != null) 'Confidence': confidence,
      if (index != null) 'Index': index,
    };
  }
}

/// Indicates whether or not the face is smiling, and the confidence level in
/// the determination.
class Smile {
  /// Level of confidence in the determination.
  final double? confidence;

  /// Boolean value that indicates whether the face is smiling or not.
  final bool? value;

  Smile({
    this.confidence,
    this.value,
  });

  factory Smile.fromJson(Map<String, dynamic> json) {
    return Smile(
      confidence: json['Confidence'] as double?,
      value: json['Value'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final confidence = this.confidence;
    final value = this.value;
    return {
      if (confidence != null) 'Confidence': confidence,
      if (value != null) 'Value': value,
    };
  }
}

class StartCelebrityRecognitionResponse {
  /// The identifier for the celebrity recognition analysis job. Use
  /// <code>JobId</code> to identify the job in a subsequent call to
  /// <code>GetCelebrityRecognition</code>.
  final String? jobId;

  StartCelebrityRecognitionResponse({
    this.jobId,
  });

  factory StartCelebrityRecognitionResponse.fromJson(
      Map<String, dynamic> json) {
    return StartCelebrityRecognitionResponse(
      jobId: json['JobId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    return {
      if (jobId != null) 'JobId': jobId,
    };
  }
}

class StartContentModerationResponse {
  /// The identifier for the content analysis job. Use <code>JobId</code> to
  /// identify the job in a subsequent call to <code>GetContentModeration</code>.
  final String? jobId;

  StartContentModerationResponse({
    this.jobId,
  });

  factory StartContentModerationResponse.fromJson(Map<String, dynamic> json) {
    return StartContentModerationResponse(
      jobId: json['JobId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    return {
      if (jobId != null) 'JobId': jobId,
    };
  }
}

class StartFaceDetectionResponse {
  /// The identifier for the face detection job. Use <code>JobId</code> to
  /// identify the job in a subsequent call to <code>GetFaceDetection</code>.
  final String? jobId;

  StartFaceDetectionResponse({
    this.jobId,
  });

  factory StartFaceDetectionResponse.fromJson(Map<String, dynamic> json) {
    return StartFaceDetectionResponse(
      jobId: json['JobId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    return {
      if (jobId != null) 'JobId': jobId,
    };
  }
}

class StartFaceSearchResponse {
  /// The identifier for the search job. Use <code>JobId</code> to identify the
  /// job in a subsequent call to <code>GetFaceSearch</code>.
  final String? jobId;

  StartFaceSearchResponse({
    this.jobId,
  });

  factory StartFaceSearchResponse.fromJson(Map<String, dynamic> json) {
    return StartFaceSearchResponse(
      jobId: json['JobId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    return {
      if (jobId != null) 'JobId': jobId,
    };
  }
}

class StartLabelDetectionResponse {
  /// The identifier for the label detection job. Use <code>JobId</code> to
  /// identify the job in a subsequent call to <code>GetLabelDetection</code>.
  final String? jobId;

  StartLabelDetectionResponse({
    this.jobId,
  });

  factory StartLabelDetectionResponse.fromJson(Map<String, dynamic> json) {
    return StartLabelDetectionResponse(
      jobId: json['JobId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    return {
      if (jobId != null) 'JobId': jobId,
    };
  }
}

class StartMediaAnalysisJobResponse {
  /// Identifier for the created job.
  final String jobId;

  StartMediaAnalysisJobResponse({
    required this.jobId,
  });

  factory StartMediaAnalysisJobResponse.fromJson(Map<String, dynamic> json) {
    return StartMediaAnalysisJobResponse(
      jobId: json['JobId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    return {
      'JobId': jobId,
    };
  }
}

class StartPersonTrackingResponse {
  /// The identifier for the person detection job. Use <code>JobId</code> to
  /// identify the job in a subsequent call to <code>GetPersonTracking</code>.
  final String? jobId;

  StartPersonTrackingResponse({
    this.jobId,
  });

  factory StartPersonTrackingResponse.fromJson(Map<String, dynamic> json) {
    return StartPersonTrackingResponse(
      jobId: json['JobId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    return {
      if (jobId != null) 'JobId': jobId,
    };
  }
}

class StartProjectVersionResponse {
  /// The current running status of the model.
  final ProjectVersionStatus? status;

  StartProjectVersionResponse({
    this.status,
  });

  factory StartProjectVersionResponse.fromJson(Map<String, dynamic> json) {
    return StartProjectVersionResponse(
      status: (json['Status'] as String?)?.toProjectVersionStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// Filters applied to the technical cue or shot detection segments. For more
/// information, see <a>StartSegmentDetection</a>.
class StartSegmentDetectionFilters {
  /// Filters that are specific to shot detections.
  final StartShotDetectionFilter? shotFilter;

  /// Filters that are specific to technical cues.
  final StartTechnicalCueDetectionFilter? technicalCueFilter;

  StartSegmentDetectionFilters({
    this.shotFilter,
    this.technicalCueFilter,
  });

  Map<String, dynamic> toJson() {
    final shotFilter = this.shotFilter;
    final technicalCueFilter = this.technicalCueFilter;
    return {
      if (shotFilter != null) 'ShotFilter': shotFilter,
      if (technicalCueFilter != null) 'TechnicalCueFilter': technicalCueFilter,
    };
  }
}

class StartSegmentDetectionResponse {
  /// Unique identifier for the segment detection job. The <code>JobId</code> is
  /// returned from <code>StartSegmentDetection</code>.
  final String? jobId;

  StartSegmentDetectionResponse({
    this.jobId,
  });

  factory StartSegmentDetectionResponse.fromJson(Map<String, dynamic> json) {
    return StartSegmentDetectionResponse(
      jobId: json['JobId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    return {
      if (jobId != null) 'JobId': jobId,
    };
  }
}

/// Filters for the shot detection segments returned by
/// <code>GetSegmentDetection</code>. For more information, see
/// <a>StartSegmentDetectionFilters</a>.
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
  final double? minSegmentConfidence;

  StartShotDetectionFilter({
    this.minSegmentConfidence,
  });

  Map<String, dynamic> toJson() {
    final minSegmentConfidence = this.minSegmentConfidence;
    return {
      if (minSegmentConfidence != null)
        'MinSegmentConfidence': minSegmentConfidence,
    };
  }
}

class StartStreamProcessorResponse {
  /// A unique identifier for the stream processing session.
  final String? sessionId;

  StartStreamProcessorResponse({
    this.sessionId,
  });

  factory StartStreamProcessorResponse.fromJson(Map<String, dynamic> json) {
    return StartStreamProcessorResponse(
      sessionId: json['SessionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sessionId = this.sessionId;
    return {
      if (sessionId != null) 'SessionId': sessionId,
    };
  }
}

/// Filters for the technical segments returned by <a>GetSegmentDetection</a>.
/// For more information, see <a>StartSegmentDetectionFilters</a>.
class StartTechnicalCueDetectionFilter {
  /// A filter that allows you to control the black frame detection by specifying
  /// the black levels and pixel coverage of black pixels in a frame. Videos can
  /// come from multiple sources, formats, and time periods, with different
  /// standards and varying noise levels for black frames that need to be
  /// accounted for.
  final BlackFrame? blackFrame;

  /// Specifies the minimum confidence that Amazon Rekognition Video must have in
  /// order to return a detected segment. Confidence represents how certain Amazon
  /// Rekognition is that a segment is correctly identified. 0 is the lowest
  /// confidence. 100 is the highest confidence. Amazon Rekognition Video doesn't
  /// return any segments with a confidence level lower than this specified value.
  ///
  /// If you don't specify <code>MinSegmentConfidence</code>,
  /// <code>GetSegmentDetection</code> returns segments with confidence values
  /// greater than or equal to 50 percent.
  final double? minSegmentConfidence;

  StartTechnicalCueDetectionFilter({
    this.blackFrame,
    this.minSegmentConfidence,
  });

  Map<String, dynamic> toJson() {
    final blackFrame = this.blackFrame;
    final minSegmentConfidence = this.minSegmentConfidence;
    return {
      if (blackFrame != null) 'BlackFrame': blackFrame,
      if (minSegmentConfidence != null)
        'MinSegmentConfidence': minSegmentConfidence,
    };
  }
}

/// Set of optional parameters that let you set the criteria text must meet to
/// be included in your response. <code>WordFilter</code> looks at a word's
/// height, width and minimum confidence. <code>RegionOfInterest</code> lets you
/// set a specific region of the screen to look for text in.
class StartTextDetectionFilters {
  /// Filter focusing on a certain area of the frame. Uses a
  /// <code>BoundingBox</code> object to set the region of the screen.
  final List<RegionOfInterest>? regionsOfInterest;

  /// Filters focusing on qualities of the text, such as confidence or size.
  final DetectionFilter? wordFilter;

  StartTextDetectionFilters({
    this.regionsOfInterest,
    this.wordFilter,
  });

  Map<String, dynamic> toJson() {
    final regionsOfInterest = this.regionsOfInterest;
    final wordFilter = this.wordFilter;
    return {
      if (regionsOfInterest != null) 'RegionsOfInterest': regionsOfInterest,
      if (wordFilter != null) 'WordFilter': wordFilter,
    };
  }
}

class StartTextDetectionResponse {
  /// Identifier for the text detection job. Use <code>JobId</code> to identify
  /// the job in a subsequent call to <code>GetTextDetection</code>.
  final String? jobId;

  StartTextDetectionResponse({
    this.jobId,
  });

  factory StartTextDetectionResponse.fromJson(Map<String, dynamic> json) {
    return StartTextDetectionResponse(
      jobId: json['JobId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    return {
      if (jobId != null) 'JobId': jobId,
    };
  }
}

class StopProjectVersionResponse {
  /// The current status of the stop operation.
  final ProjectVersionStatus? status;

  StopProjectVersionResponse({
    this.status,
  });

  factory StopProjectVersionResponse.fromJson(Map<String, dynamic> json) {
    return StopProjectVersionResponse(
      status: (json['Status'] as String?)?.toProjectVersionStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'Status': status.toValue(),
    };
  }
}

class StopStreamProcessorResponse {
  StopStreamProcessorResponse();

  factory StopStreamProcessorResponse.fromJson(Map<String, dynamic> _) {
    return StopStreamProcessorResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// This is a required parameter for label detection stream processors and
/// should not be used to start a face search stream processor.
class StreamProcessingStartSelector {
  /// Specifies the starting point in the stream to start processing. This can be
  /// done with a producer timestamp or a fragment number in a Kinesis stream.
  final KinesisVideoStreamStartSelector? kVSStreamStartSelector;

  StreamProcessingStartSelector({
    this.kVSStreamStartSelector,
  });

  Map<String, dynamic> toJson() {
    final kVSStreamStartSelector = this.kVSStreamStartSelector;
    return {
      if (kVSStreamStartSelector != null)
        'KVSStreamStartSelector': kVSStreamStartSelector,
    };
  }
}

/// Specifies when to stop processing the stream. You can specify a maximum
/// amount of time to process the video.
class StreamProcessingStopSelector {
  /// Specifies the maximum amount of time in seconds that you want the stream to
  /// be processed. The largest amount of time is 2 minutes. The default is 10
  /// seconds.
  final int? maxDurationInSeconds;

  StreamProcessingStopSelector({
    this.maxDurationInSeconds,
  });

  Map<String, dynamic> toJson() {
    final maxDurationInSeconds = this.maxDurationInSeconds;
    return {
      if (maxDurationInSeconds != null)
        'MaxDurationInSeconds': maxDurationInSeconds,
    };
  }
}

/// An object that recognizes faces or labels in a streaming video. An Amazon
/// Rekognition stream processor is created by a call to
/// <a>CreateStreamProcessor</a>. The request parameters for
/// <code>CreateStreamProcessor</code> describe the Kinesis video stream source
/// for the streaming video, face recognition parameters, and where to stream
/// the analysis resullts.
class StreamProcessor {
  /// Name of the Amazon Rekognition stream processor.
  final String? name;

  /// Current status of the Amazon Rekognition stream processor.
  final StreamProcessorStatus? status;

  StreamProcessor({
    this.name,
    this.status,
  });

  factory StreamProcessor.fromJson(Map<String, dynamic> json) {
    return StreamProcessor(
      name: json['Name'] as String?,
      status: (json['Status'] as String?)?.toStreamProcessorStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final status = this.status;
    return {
      if (name != null) 'Name': name,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// Allows you to opt in or opt out to share data with Rekognition to improve
/// model performance. You can choose this option at the account level or on a
/// per-stream basis. Note that if you opt out at the account level this setting
/// is ignored on individual streams.
class StreamProcessorDataSharingPreference {
  /// If this option is set to true, you choose to share data with Rekognition to
  /// improve model performance.
  final bool optIn;

  StreamProcessorDataSharingPreference({
    required this.optIn,
  });

  factory StreamProcessorDataSharingPreference.fromJson(
      Map<String, dynamic> json) {
    return StreamProcessorDataSharingPreference(
      optIn: json['OptIn'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final optIn = this.optIn;
    return {
      'OptIn': optIn,
    };
  }
}

/// Information about the source streaming video.
class StreamProcessorInput {
  /// The Kinesis video stream input stream for the source streaming video.
  final KinesisVideoStream? kinesisVideoStream;

  StreamProcessorInput({
    this.kinesisVideoStream,
  });

  factory StreamProcessorInput.fromJson(Map<String, dynamic> json) {
    return StreamProcessorInput(
      kinesisVideoStream: json['KinesisVideoStream'] != null
          ? KinesisVideoStream.fromJson(
              json['KinesisVideoStream'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final kinesisVideoStream = this.kinesisVideoStream;
    return {
      if (kinesisVideoStream != null) 'KinesisVideoStream': kinesisVideoStream,
    };
  }
}

/// The Amazon Simple Notification Service topic to which Amazon Rekognition
/// publishes the object detection results and completion status of a video
/// analysis operation.
///
/// Amazon Rekognition publishes a notification the first time an object of
/// interest or a person is detected in the video stream. For example, if Amazon
/// Rekognition detects a person at second 2, a pet at second 4, and a person
/// again at second 5, Amazon Rekognition sends 2 object class detected
/// notifications, one for a person at second 2 and one for a pet at second 4.
///
/// Amazon Rekognition also publishes an an end-of-session notification with a
/// summary when the stream processing session is complete.
class StreamProcessorNotificationChannel {
  /// The Amazon Resource Number (ARN) of the Amazon Amazon Simple Notification
  /// Service topic to which Amazon Rekognition posts the completion status.
  final String sNSTopicArn;

  StreamProcessorNotificationChannel({
    required this.sNSTopicArn,
  });

  factory StreamProcessorNotificationChannel.fromJson(
      Map<String, dynamic> json) {
    return StreamProcessorNotificationChannel(
      sNSTopicArn: json['SNSTopicArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final sNSTopicArn = this.sNSTopicArn;
    return {
      'SNSTopicArn': sNSTopicArn,
    };
  }
}

/// Information about the Amazon Kinesis Data Streams stream to which a Amazon
/// Rekognition Video stream processor streams the results of a video analysis.
/// For more information, see CreateStreamProcessor in the Amazon Rekognition
/// Developer Guide.
class StreamProcessorOutput {
  /// The Amazon Kinesis Data Streams stream to which the Amazon Rekognition
  /// stream processor streams the analysis results.
  final KinesisDataStream? kinesisDataStream;

  /// The Amazon S3 bucket location to which Amazon Rekognition publishes the
  /// detailed inference results of a video analysis operation.
  final S3Destination? s3Destination;

  StreamProcessorOutput({
    this.kinesisDataStream,
    this.s3Destination,
  });

  factory StreamProcessorOutput.fromJson(Map<String, dynamic> json) {
    return StreamProcessorOutput(
      kinesisDataStream: json['KinesisDataStream'] != null
          ? KinesisDataStream.fromJson(
              json['KinesisDataStream'] as Map<String, dynamic>)
          : null,
      s3Destination: json['S3Destination'] != null
          ? S3Destination.fromJson(
              json['S3Destination'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final kinesisDataStream = this.kinesisDataStream;
    final s3Destination = this.s3Destination;
    return {
      if (kinesisDataStream != null) 'KinesisDataStream': kinesisDataStream,
      if (s3Destination != null) 'S3Destination': s3Destination,
    };
  }
}

enum StreamProcessorParameterToDelete {
  connectedHomeMinConfidence,
  regionsOfInterest,
}

extension StreamProcessorParameterToDeleteValueExtension
    on StreamProcessorParameterToDelete {
  String toValue() {
    switch (this) {
      case StreamProcessorParameterToDelete.connectedHomeMinConfidence:
        return 'ConnectedHomeMinConfidence';
      case StreamProcessorParameterToDelete.regionsOfInterest:
        return 'RegionsOfInterest';
    }
  }
}

extension StreamProcessorParameterToDeleteFromString on String {
  StreamProcessorParameterToDelete toStreamProcessorParameterToDelete() {
    switch (this) {
      case 'ConnectedHomeMinConfidence':
        return StreamProcessorParameterToDelete.connectedHomeMinConfidence;
      case 'RegionsOfInterest':
        return StreamProcessorParameterToDelete.regionsOfInterest;
    }
    throw Exception(
        '$this is not known in enum StreamProcessorParameterToDelete');
  }
}

/// Input parameters used in a streaming video analyzed by a Amazon Rekognition
/// stream processor. You can use <code>FaceSearch</code> to recognize faces in
/// a streaming video, or you can use <code>ConnectedHome</code> to detect
/// labels.
class StreamProcessorSettings {
  final ConnectedHomeSettings? connectedHome;

  /// Face search settings to use on a streaming video.
  final FaceSearchSettings? faceSearch;

  StreamProcessorSettings({
    this.connectedHome,
    this.faceSearch,
  });

  factory StreamProcessorSettings.fromJson(Map<String, dynamic> json) {
    return StreamProcessorSettings(
      connectedHome: json['ConnectedHome'] != null
          ? ConnectedHomeSettings.fromJson(
              json['ConnectedHome'] as Map<String, dynamic>)
          : null,
      faceSearch: json['FaceSearch'] != null
          ? FaceSearchSettings.fromJson(
              json['FaceSearch'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final connectedHome = this.connectedHome;
    final faceSearch = this.faceSearch;
    return {
      if (connectedHome != null) 'ConnectedHome': connectedHome,
      if (faceSearch != null) 'FaceSearch': faceSearch,
    };
  }
}

/// The stream processor settings that you want to update.
/// <code>ConnectedHome</code> settings can be updated to detect different
/// labels with a different minimum confidence.
class StreamProcessorSettingsForUpdate {
  /// The label detection settings you want to use for your stream processor.
  final ConnectedHomeSettingsForUpdate? connectedHomeForUpdate;

  StreamProcessorSettingsForUpdate({
    this.connectedHomeForUpdate,
  });

  Map<String, dynamic> toJson() {
    final connectedHomeForUpdate = this.connectedHomeForUpdate;
    return {
      if (connectedHomeForUpdate != null)
        'ConnectedHomeForUpdate': connectedHomeForUpdate,
    };
  }
}

enum StreamProcessorStatus {
  stopped,
  starting,
  running,
  failed,
  stopping,
  updating,
}

extension StreamProcessorStatusValueExtension on StreamProcessorStatus {
  String toValue() {
    switch (this) {
      case StreamProcessorStatus.stopped:
        return 'STOPPED';
      case StreamProcessorStatus.starting:
        return 'STARTING';
      case StreamProcessorStatus.running:
        return 'RUNNING';
      case StreamProcessorStatus.failed:
        return 'FAILED';
      case StreamProcessorStatus.stopping:
        return 'STOPPING';
      case StreamProcessorStatus.updating:
        return 'UPDATING';
    }
  }
}

extension StreamProcessorStatusFromString on String {
  StreamProcessorStatus toStreamProcessorStatus() {
    switch (this) {
      case 'STOPPED':
        return StreamProcessorStatus.stopped;
      case 'STARTING':
        return StreamProcessorStatus.starting;
      case 'RUNNING':
        return StreamProcessorStatus.running;
      case 'FAILED':
        return StreamProcessorStatus.failed;
      case 'STOPPING':
        return StreamProcessorStatus.stopping;
      case 'UPDATING':
        return StreamProcessorStatus.updating;
    }
    throw Exception('$this is not known in enum StreamProcessorStatus');
  }
}

/// The S3 bucket that contains the training summary. The training summary
/// includes aggregated evaluation metrics for the entire testing dataset and
/// metrics for each individual label.
///
/// You get the training summary S3 bucket location by calling
/// <a>DescribeProjectVersions</a>.
class Summary {
  final S3Object? s3Object;

  Summary({
    this.s3Object,
  });

  factory Summary.fromJson(Map<String, dynamic> json) {
    return Summary(
      s3Object: json['S3Object'] != null
          ? S3Object.fromJson(json['S3Object'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Object = this.s3Object;
    return {
      if (s3Object != null) 'S3Object': s3Object,
    };
  }
}

/// Indicates whether or not the face is wearing sunglasses, and the confidence
/// level in the determination.
class Sunglasses {
  /// Level of confidence in the determination.
  final double? confidence;

  /// Boolean value that indicates whether the face is wearing sunglasses or not.
  final bool? value;

  Sunglasses({
    this.confidence,
    this.value,
  });

  factory Sunglasses.fromJson(Map<String, dynamic> json) {
    return Sunglasses(
      confidence: json['Confidence'] as double?,
      value: json['Value'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final confidence = this.confidence;
    final value = this.value;
    return {
      if (confidence != null) 'Confidence': confidence,
      if (value != null) 'Value': value,
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

/// Information about a technical cue segment. For more information, see
/// <a>SegmentDetection</a>.
class TechnicalCueSegment {
  /// The confidence that Amazon Rekognition Video has in the accuracy of the
  /// detected segment.
  final double? confidence;

  /// The type of the technical cue.
  final TechnicalCueType? type;

  TechnicalCueSegment({
    this.confidence,
    this.type,
  });

  factory TechnicalCueSegment.fromJson(Map<String, dynamic> json) {
    return TechnicalCueSegment(
      confidence: json['Confidence'] as double?,
      type: (json['Type'] as String?)?.toTechnicalCueType(),
    );
  }

  Map<String, dynamic> toJson() {
    final confidence = this.confidence;
    final type = this.type;
    return {
      if (confidence != null) 'Confidence': confidence,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum TechnicalCueType {
  colorBars,
  endCredits,
  blackFrames,
  openingCredits,
  studioLogo,
  slate,
  content,
}

extension TechnicalCueTypeValueExtension on TechnicalCueType {
  String toValue() {
    switch (this) {
      case TechnicalCueType.colorBars:
        return 'ColorBars';
      case TechnicalCueType.endCredits:
        return 'EndCredits';
      case TechnicalCueType.blackFrames:
        return 'BlackFrames';
      case TechnicalCueType.openingCredits:
        return 'OpeningCredits';
      case TechnicalCueType.studioLogo:
        return 'StudioLogo';
      case TechnicalCueType.slate:
        return 'Slate';
      case TechnicalCueType.content:
        return 'Content';
    }
  }
}

extension TechnicalCueTypeFromString on String {
  TechnicalCueType toTechnicalCueType() {
    switch (this) {
      case 'ColorBars':
        return TechnicalCueType.colorBars;
      case 'EndCredits':
        return TechnicalCueType.endCredits;
      case 'BlackFrames':
        return TechnicalCueType.blackFrames;
      case 'OpeningCredits':
        return TechnicalCueType.openingCredits;
      case 'StudioLogo':
        return TechnicalCueType.studioLogo;
      case 'Slate':
        return TechnicalCueType.slate;
      case 'Content':
        return TechnicalCueType.content;
    }
    throw Exception('$this is not known in enum TechnicalCueType');
  }
}

/// The dataset used for testing. Optionally, if <code>AutoCreate</code> is set,
/// Amazon Rekognition uses the training dataset to create a test dataset with a
/// temporary split of the training dataset.
class TestingData {
  /// The assets used for testing.
  final List<Asset>? assets;

  /// If specified, Rekognition splits training dataset to create a test dataset
  /// for the training job.
  final bool? autoCreate;

  TestingData({
    this.assets,
    this.autoCreate,
  });

  factory TestingData.fromJson(Map<String, dynamic> json) {
    return TestingData(
      assets: (json['Assets'] as List?)
          ?.whereNotNull()
          .map((e) => Asset.fromJson(e as Map<String, dynamic>))
          .toList(),
      autoCreate: json['AutoCreate'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final assets = this.assets;
    final autoCreate = this.autoCreate;
    return {
      if (assets != null) 'Assets': assets,
      if (autoCreate != null) 'AutoCreate': autoCreate,
    };
  }
}

/// Sagemaker Groundtruth format manifest files for the input, output and
/// validation datasets that are used and created during testing.
class TestingDataResult {
  /// The testing dataset that was supplied for training.
  final TestingData? input;

  /// The subset of the dataset that was actually tested. Some images (assets)
  /// might not be tested due to file formatting and other issues.
  final TestingData? output;

  /// The location of the data validation manifest. The data validation manifest
  /// is created for the test dataset during model training.
  final ValidationData? validation;

  TestingDataResult({
    this.input,
    this.output,
    this.validation,
  });

  factory TestingDataResult.fromJson(Map<String, dynamic> json) {
    return TestingDataResult(
      input: json['Input'] != null
          ? TestingData.fromJson(json['Input'] as Map<String, dynamic>)
          : null,
      output: json['Output'] != null
          ? TestingData.fromJson(json['Output'] as Map<String, dynamic>)
          : null,
      validation: json['Validation'] != null
          ? ValidationData.fromJson(json['Validation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final input = this.input;
    final output = this.output;
    final validation = this.validation;
    return {
      if (input != null) 'Input': input,
      if (output != null) 'Output': output,
      if (validation != null) 'Validation': validation,
    };
  }
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
/// For more information, see Detecting text in the Amazon Rekognition Developer
/// Guide.
class TextDetection {
  /// The confidence that Amazon Rekognition has in the accuracy of the detected
  /// text and the accuracy of the geometry points around the detected text.
  final double? confidence;

  /// The word or line of text recognized by Amazon Rekognition.
  final String? detectedText;

  /// The location of the detected text on the image. Includes an axis aligned
  /// coarse bounding box surrounding the text and a finer grain polygon for more
  /// accurate spatial information.
  final Geometry? geometry;

  /// The identifier for the detected text. The identifier is only unique for a
  /// single call to <code>DetectText</code>.
  final int? id;

  /// The Parent identifier for the detected text identified by the value of
  /// <code>ID</code>. If the type of detected text is <code>LINE</code>, the
  /// value of <code>ParentId</code> is <code>Null</code>.
  final int? parentId;

  /// The type of text that was detected.
  final TextTypes? type;

  TextDetection({
    this.confidence,
    this.detectedText,
    this.geometry,
    this.id,
    this.parentId,
    this.type,
  });

  factory TextDetection.fromJson(Map<String, dynamic> json) {
    return TextDetection(
      confidence: json['Confidence'] as double?,
      detectedText: json['DetectedText'] as String?,
      geometry: json['Geometry'] != null
          ? Geometry.fromJson(json['Geometry'] as Map<String, dynamic>)
          : null,
      id: json['Id'] as int?,
      parentId: json['ParentId'] as int?,
      type: (json['Type'] as String?)?.toTextTypes(),
    );
  }

  Map<String, dynamic> toJson() {
    final confidence = this.confidence;
    final detectedText = this.detectedText;
    final geometry = this.geometry;
    final id = this.id;
    final parentId = this.parentId;
    final type = this.type;
    return {
      if (confidence != null) 'Confidence': confidence,
      if (detectedText != null) 'DetectedText': detectedText,
      if (geometry != null) 'Geometry': geometry,
      if (id != null) 'Id': id,
      if (parentId != null) 'ParentId': parentId,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// Information about text detected in a video. Incudes the detected text, the
/// time in milliseconds from the start of the video that the text was detected,
/// and where it was detected on the screen.
class TextDetectionResult {
  /// Details about text detected in a video.
  final TextDetection? textDetection;

  /// The time, in milliseconds from the start of the video, that the text was
  /// detected. Note that <code>Timestamp</code> is not guaranteed to be accurate
  /// to the individual frame where the text first appears.
  final int? timestamp;

  TextDetectionResult({
    this.textDetection,
    this.timestamp,
  });

  factory TextDetectionResult.fromJson(Map<String, dynamic> json) {
    return TextDetectionResult(
      textDetection: json['TextDetection'] != null
          ? TextDetection.fromJson(
              json['TextDetection'] as Map<String, dynamic>)
          : null,
      timestamp: json['Timestamp'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final textDetection = this.textDetection;
    final timestamp = this.timestamp;
    return {
      if (textDetection != null) 'TextDetection': textDetection,
      if (timestamp != null) 'Timestamp': timestamp,
    };
  }
}

enum TextTypes {
  line,
  word,
}

extension TextTypesValueExtension on TextTypes {
  String toValue() {
    switch (this) {
      case TextTypes.line:
        return 'LINE';
      case TextTypes.word:
        return 'WORD';
    }
  }
}

extension TextTypesFromString on String {
  TextTypes toTextTypes() {
    switch (this) {
      case 'LINE':
        return TextTypes.line;
      case 'WORD':
        return TextTypes.word;
    }
    throw Exception('$this is not known in enum TextTypes');
  }
}

/// The dataset used for training.
class TrainingData {
  /// A manifest file that contains references to the training images and
  /// ground-truth annotations.
  final List<Asset>? assets;

  TrainingData({
    this.assets,
  });

  factory TrainingData.fromJson(Map<String, dynamic> json) {
    return TrainingData(
      assets: (json['Assets'] as List?)
          ?.whereNotNull()
          .map((e) => Asset.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final assets = this.assets;
    return {
      if (assets != null) 'Assets': assets,
    };
  }
}

/// The data validation manifest created for the training dataset during model
/// training.
class TrainingDataResult {
  /// The training data that you supplied.
  final TrainingData? input;

  /// Reference to images (assets) that were actually used during training with
  /// trained model predictions.
  final TrainingData? output;

  /// A manifest that you supplied for training, with validation results for each
  /// line.
  final ValidationData? validation;

  TrainingDataResult({
    this.input,
    this.output,
    this.validation,
  });

  factory TrainingDataResult.fromJson(Map<String, dynamic> json) {
    return TrainingDataResult(
      input: json['Input'] != null
          ? TrainingData.fromJson(json['Input'] as Map<String, dynamic>)
          : null,
      output: json['Output'] != null
          ? TrainingData.fromJson(json['Output'] as Map<String, dynamic>)
          : null,
      validation: json['Validation'] != null
          ? ValidationData.fromJson(json['Validation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final input = this.input;
    final output = this.output;
    final validation = this.validation;
    return {
      if (input != null) 'Input': input,
      if (output != null) 'Output': output,
      if (validation != null) 'Validation': validation,
    };
  }
}

/// A face that <a>IndexFaces</a> detected, but didn't index. Use the
/// <code>Reasons</code> response attribute to determine why a face wasn't
/// indexed.
class UnindexedFace {
  /// The structure that contains attributes of a face that
  /// <code>IndexFaces</code>detected, but didn't index.
  final FaceDetail? faceDetail;

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
  final List<Reason>? reasons;

  UnindexedFace({
    this.faceDetail,
    this.reasons,
  });

  factory UnindexedFace.fromJson(Map<String, dynamic> json) {
    return UnindexedFace(
      faceDetail: json['FaceDetail'] != null
          ? FaceDetail.fromJson(json['FaceDetail'] as Map<String, dynamic>)
          : null,
      reasons: (json['Reasons'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toReason())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final faceDetail = this.faceDetail;
    final reasons = this.reasons;
    return {
      if (faceDetail != null) 'FaceDetail': faceDetail,
      if (reasons != null) 'Reasons': reasons.map((e) => e.toValue()).toList(),
    };
  }
}

/// Face details inferred from the image but not used for search. The response
/// attribute contains reasons for why a face wasn't used for Search.
class UnsearchedFace {
  final FaceDetail? faceDetails;

  /// Reasons why a face wasn't used for Search.
  final List<UnsearchedFaceReason>? reasons;

  UnsearchedFace({
    this.faceDetails,
    this.reasons,
  });

  factory UnsearchedFace.fromJson(Map<String, dynamic> json) {
    return UnsearchedFace(
      faceDetails: json['FaceDetails'] != null
          ? FaceDetail.fromJson(json['FaceDetails'] as Map<String, dynamic>)
          : null,
      reasons: (json['Reasons'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toUnsearchedFaceReason())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final faceDetails = this.faceDetails;
    final reasons = this.reasons;
    return {
      if (faceDetails != null) 'FaceDetails': faceDetails,
      if (reasons != null) 'Reasons': reasons.map((e) => e.toValue()).toList(),
    };
  }
}

enum UnsearchedFaceReason {
  faceNotLargest,
  exceedsMaxFaces,
  extremePose,
  lowBrightness,
  lowSharpness,
  lowConfidence,
  smallBoundingBox,
  lowFaceQuality,
}

extension UnsearchedFaceReasonValueExtension on UnsearchedFaceReason {
  String toValue() {
    switch (this) {
      case UnsearchedFaceReason.faceNotLargest:
        return 'FACE_NOT_LARGEST';
      case UnsearchedFaceReason.exceedsMaxFaces:
        return 'EXCEEDS_MAX_FACES';
      case UnsearchedFaceReason.extremePose:
        return 'EXTREME_POSE';
      case UnsearchedFaceReason.lowBrightness:
        return 'LOW_BRIGHTNESS';
      case UnsearchedFaceReason.lowSharpness:
        return 'LOW_SHARPNESS';
      case UnsearchedFaceReason.lowConfidence:
        return 'LOW_CONFIDENCE';
      case UnsearchedFaceReason.smallBoundingBox:
        return 'SMALL_BOUNDING_BOX';
      case UnsearchedFaceReason.lowFaceQuality:
        return 'LOW_FACE_QUALITY';
    }
  }
}

extension UnsearchedFaceReasonFromString on String {
  UnsearchedFaceReason toUnsearchedFaceReason() {
    switch (this) {
      case 'FACE_NOT_LARGEST':
        return UnsearchedFaceReason.faceNotLargest;
      case 'EXCEEDS_MAX_FACES':
        return UnsearchedFaceReason.exceedsMaxFaces;
      case 'EXTREME_POSE':
        return UnsearchedFaceReason.extremePose;
      case 'LOW_BRIGHTNESS':
        return UnsearchedFaceReason.lowBrightness;
      case 'LOW_SHARPNESS':
        return UnsearchedFaceReason.lowSharpness;
      case 'LOW_CONFIDENCE':
        return UnsearchedFaceReason.lowConfidence;
      case 'SMALL_BOUNDING_BOX':
        return UnsearchedFaceReason.smallBoundingBox;
      case 'LOW_FACE_QUALITY':
        return UnsearchedFaceReason.lowFaceQuality;
    }
    throw Exception('$this is not known in enum UnsearchedFaceReason');
  }
}

/// Contains metadata like FaceId, UserID, and Reasons, for a face that was
/// unsuccessfully associated.
class UnsuccessfulFaceAssociation {
  /// Match confidence with the UserID, provides information regarding if a face
  /// association was unsuccessful because it didn't meet UserMatchThreshold.
  final double? confidence;

  /// A unique identifier assigned to the face.
  final String? faceId;

  /// The reason why the association was unsuccessful.
  final List<UnsuccessfulFaceAssociationReason>? reasons;

  /// A provided ID for the UserID. Unique within the collection.
  final String? userId;

  UnsuccessfulFaceAssociation({
    this.confidence,
    this.faceId,
    this.reasons,
    this.userId,
  });

  factory UnsuccessfulFaceAssociation.fromJson(Map<String, dynamic> json) {
    return UnsuccessfulFaceAssociation(
      confidence: json['Confidence'] as double?,
      faceId: json['FaceId'] as String?,
      reasons: (json['Reasons'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toUnsuccessfulFaceAssociationReason())
          .toList(),
      userId: json['UserId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final confidence = this.confidence;
    final faceId = this.faceId;
    final reasons = this.reasons;
    final userId = this.userId;
    return {
      if (confidence != null) 'Confidence': confidence,
      if (faceId != null) 'FaceId': faceId,
      if (reasons != null) 'Reasons': reasons.map((e) => e.toValue()).toList(),
      if (userId != null) 'UserId': userId,
    };
  }
}

enum UnsuccessfulFaceAssociationReason {
  faceNotFound,
  associatedToADifferentUser,
  lowMatchConfidence,
}

extension UnsuccessfulFaceAssociationReasonValueExtension
    on UnsuccessfulFaceAssociationReason {
  String toValue() {
    switch (this) {
      case UnsuccessfulFaceAssociationReason.faceNotFound:
        return 'FACE_NOT_FOUND';
      case UnsuccessfulFaceAssociationReason.associatedToADifferentUser:
        return 'ASSOCIATED_TO_A_DIFFERENT_USER';
      case UnsuccessfulFaceAssociationReason.lowMatchConfidence:
        return 'LOW_MATCH_CONFIDENCE';
    }
  }
}

extension UnsuccessfulFaceAssociationReasonFromString on String {
  UnsuccessfulFaceAssociationReason toUnsuccessfulFaceAssociationReason() {
    switch (this) {
      case 'FACE_NOT_FOUND':
        return UnsuccessfulFaceAssociationReason.faceNotFound;
      case 'ASSOCIATED_TO_A_DIFFERENT_USER':
        return UnsuccessfulFaceAssociationReason.associatedToADifferentUser;
      case 'LOW_MATCH_CONFIDENCE':
        return UnsuccessfulFaceAssociationReason.lowMatchConfidence;
    }
    throw Exception(
        '$this is not known in enum UnsuccessfulFaceAssociationReason');
  }
}

/// Contains metadata like FaceId, UserID, and Reasons, for a face that was
/// unsuccessfully deleted.
class UnsuccessfulFaceDeletion {
  /// A unique identifier assigned to the face.
  final String? faceId;

  /// The reason why the deletion was unsuccessful.
  final List<UnsuccessfulFaceDeletionReason>? reasons;

  /// A provided ID for the UserID. Unique within the collection.
  final String? userId;

  UnsuccessfulFaceDeletion({
    this.faceId,
    this.reasons,
    this.userId,
  });

  factory UnsuccessfulFaceDeletion.fromJson(Map<String, dynamic> json) {
    return UnsuccessfulFaceDeletion(
      faceId: json['FaceId'] as String?,
      reasons: (json['Reasons'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toUnsuccessfulFaceDeletionReason())
          .toList(),
      userId: json['UserId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final faceId = this.faceId;
    final reasons = this.reasons;
    final userId = this.userId;
    return {
      if (faceId != null) 'FaceId': faceId,
      if (reasons != null) 'Reasons': reasons.map((e) => e.toValue()).toList(),
      if (userId != null) 'UserId': userId,
    };
  }
}

enum UnsuccessfulFaceDeletionReason {
  associatedToAnExistingUser,
  faceNotFound,
}

extension UnsuccessfulFaceDeletionReasonValueExtension
    on UnsuccessfulFaceDeletionReason {
  String toValue() {
    switch (this) {
      case UnsuccessfulFaceDeletionReason.associatedToAnExistingUser:
        return 'ASSOCIATED_TO_AN_EXISTING_USER';
      case UnsuccessfulFaceDeletionReason.faceNotFound:
        return 'FACE_NOT_FOUND';
    }
  }
}

extension UnsuccessfulFaceDeletionReasonFromString on String {
  UnsuccessfulFaceDeletionReason toUnsuccessfulFaceDeletionReason() {
    switch (this) {
      case 'ASSOCIATED_TO_AN_EXISTING_USER':
        return UnsuccessfulFaceDeletionReason.associatedToAnExistingUser;
      case 'FACE_NOT_FOUND':
        return UnsuccessfulFaceDeletionReason.faceNotFound;
    }
    throw Exception(
        '$this is not known in enum UnsuccessfulFaceDeletionReason');
  }
}

/// Contains metadata like FaceId, UserID, and Reasons, for a face that was
/// unsuccessfully disassociated.
class UnsuccessfulFaceDisassociation {
  /// A unique identifier assigned to the face.
  final String? faceId;

  /// The reason why the deletion was unsuccessful.
  final List<UnsuccessfulFaceDisassociationReason>? reasons;

  /// A provided ID for the UserID. Unique within the collection.
  final String? userId;

  UnsuccessfulFaceDisassociation({
    this.faceId,
    this.reasons,
    this.userId,
  });

  factory UnsuccessfulFaceDisassociation.fromJson(Map<String, dynamic> json) {
    return UnsuccessfulFaceDisassociation(
      faceId: json['FaceId'] as String?,
      reasons: (json['Reasons'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toUnsuccessfulFaceDisassociationReason())
          .toList(),
      userId: json['UserId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final faceId = this.faceId;
    final reasons = this.reasons;
    final userId = this.userId;
    return {
      if (faceId != null) 'FaceId': faceId,
      if (reasons != null) 'Reasons': reasons.map((e) => e.toValue()).toList(),
      if (userId != null) 'UserId': userId,
    };
  }
}

enum UnsuccessfulFaceDisassociationReason {
  faceNotFound,
  associatedToADifferentUser,
}

extension UnsuccessfulFaceDisassociationReasonValueExtension
    on UnsuccessfulFaceDisassociationReason {
  String toValue() {
    switch (this) {
      case UnsuccessfulFaceDisassociationReason.faceNotFound:
        return 'FACE_NOT_FOUND';
      case UnsuccessfulFaceDisassociationReason.associatedToADifferentUser:
        return 'ASSOCIATED_TO_A_DIFFERENT_USER';
    }
  }
}

extension UnsuccessfulFaceDisassociationReasonFromString on String {
  UnsuccessfulFaceDisassociationReason
      toUnsuccessfulFaceDisassociationReason() {
    switch (this) {
      case 'FACE_NOT_FOUND':
        return UnsuccessfulFaceDisassociationReason.faceNotFound;
      case 'ASSOCIATED_TO_A_DIFFERENT_USER':
        return UnsuccessfulFaceDisassociationReason.associatedToADifferentUser;
    }
    throw Exception(
        '$this is not known in enum UnsuccessfulFaceDisassociationReason');
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

class UpdateDatasetEntriesResponse {
  UpdateDatasetEntriesResponse();

  factory UpdateDatasetEntriesResponse.fromJson(Map<String, dynamic> _) {
    return UpdateDatasetEntriesResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateStreamProcessorResponse {
  UpdateStreamProcessorResponse();

  factory UpdateStreamProcessorResponse.fromJson(Map<String, dynamic> _) {
    return UpdateStreamProcessorResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Metadata of the user stored in a collection.
class User {
  /// A provided ID for the User. Unique within the collection.
  final String? userId;

  /// Communicates if the UserID has been updated with latest set of faces to be
  /// associated with the UserID.
  final UserStatus? userStatus;

  User({
    this.userId,
    this.userStatus,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['UserId'] as String?,
      userStatus: (json['UserStatus'] as String?)?.toUserStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final userId = this.userId;
    final userStatus = this.userStatus;
    return {
      if (userId != null) 'UserId': userId,
      if (userStatus != null) 'UserStatus': userStatus.toValue(),
    };
  }
}

/// Provides UserID metadata along with the confidence in the match of this
/// UserID with the input face.
class UserMatch {
  /// Describes the UserID metadata.
  final double? similarity;

  /// Confidence in the match of this UserID with the input face.
  final MatchedUser? user;

  UserMatch({
    this.similarity,
    this.user,
  });

  factory UserMatch.fromJson(Map<String, dynamic> json) {
    return UserMatch(
      similarity: json['Similarity'] as double?,
      user: json['User'] != null
          ? MatchedUser.fromJson(json['User'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final similarity = this.similarity;
    final user = this.user;
    return {
      if (similarity != null) 'Similarity': similarity,
      if (user != null) 'User': user,
    };
  }
}

enum UserStatus {
  active,
  updating,
  creating,
  created,
}

extension UserStatusValueExtension on UserStatus {
  String toValue() {
    switch (this) {
      case UserStatus.active:
        return 'ACTIVE';
      case UserStatus.updating:
        return 'UPDATING';
      case UserStatus.creating:
        return 'CREATING';
      case UserStatus.created:
        return 'CREATED';
    }
  }
}

extension UserStatusFromString on String {
  UserStatus toUserStatus() {
    switch (this) {
      case 'ACTIVE':
        return UserStatus.active;
      case 'UPDATING':
        return UserStatus.updating;
      case 'CREATING':
        return UserStatus.creating;
      case 'CREATED':
        return UserStatus.created;
    }
    throw Exception('$this is not known in enum UserStatus');
  }
}

/// Contains the Amazon S3 bucket location of the validation data for a model
/// training job.
///
/// The validation data includes error information for individual JSON Lines in
/// the dataset. For more information, see <i>Debugging a Failed Model
/// Training</i> in the Amazon Rekognition Custom Labels Developer Guide.
///
/// You get the <code>ValidationData</code> object for the training dataset
/// (<a>TrainingDataResult</a>) and the test dataset (<a>TestingDataResult</a>)
/// by calling <a>DescribeProjectVersions</a>.
///
/// The assets array contains a single <a>Asset</a> object. The
/// <a>GroundTruthManifest</a> field of the Asset object contains the S3 bucket
/// location of the validation data.
class ValidationData {
  /// The assets that comprise the validation data.
  final List<Asset>? assets;

  ValidationData({
    this.assets,
  });

  factory ValidationData.fromJson(Map<String, dynamic> json) {
    return ValidationData(
      assets: (json['Assets'] as List?)
          ?.whereNotNull()
          .map((e) => Asset.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final assets = this.assets;
    return {
      if (assets != null) 'Assets': assets,
    };
  }
}

/// Video file stored in an Amazon S3 bucket. Amazon Rekognition video start
/// operations such as <a>StartLabelDetection</a> use <code>Video</code> to
/// specify a video for analysis. The supported file formats are .mp4, .mov and
/// .avi.
class Video {
  /// The Amazon S3 bucket name and file name for the video.
  final S3Object? s3Object;

  Video({
    this.s3Object,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      s3Object: json['S3Object'] != null
          ? S3Object.fromJson(json['S3Object'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Object = this.s3Object;
    return {
      if (s3Object != null) 'S3Object': s3Object,
    };
  }
}

enum VideoColorRange {
  full,
  limited,
}

extension VideoColorRangeValueExtension on VideoColorRange {
  String toValue() {
    switch (this) {
      case VideoColorRange.full:
        return 'FULL';
      case VideoColorRange.limited:
        return 'LIMITED';
    }
  }
}

extension VideoColorRangeFromString on String {
  VideoColorRange toVideoColorRange() {
    switch (this) {
      case 'FULL':
        return VideoColorRange.full;
      case 'LIMITED':
        return VideoColorRange.limited;
    }
    throw Exception('$this is not known in enum VideoColorRange');
  }
}

enum VideoJobStatus {
  inProgress,
  succeeded,
  failed,
}

extension VideoJobStatusValueExtension on VideoJobStatus {
  String toValue() {
    switch (this) {
      case VideoJobStatus.inProgress:
        return 'IN_PROGRESS';
      case VideoJobStatus.succeeded:
        return 'SUCCEEDED';
      case VideoJobStatus.failed:
        return 'FAILED';
    }
  }
}

extension VideoJobStatusFromString on String {
  VideoJobStatus toVideoJobStatus() {
    switch (this) {
      case 'IN_PROGRESS':
        return VideoJobStatus.inProgress;
      case 'SUCCEEDED':
        return VideoJobStatus.succeeded;
      case 'FAILED':
        return VideoJobStatus.failed;
    }
    throw Exception('$this is not known in enum VideoJobStatus');
  }
}

/// Information about a video that Amazon Rekognition analyzed.
/// <code>Videometadata</code> is returned in every page of paginated responses
/// from a Amazon Rekognition video operation.
class VideoMetadata {
  /// Type of compression used in the analyzed video.
  final String? codec;

  /// A description of the range of luminance values in a video, either LIMITED
  /// (16 to 235) or FULL (0 to 255).
  final VideoColorRange? colorRange;

  /// Length of the video in milliseconds.
  final int? durationMillis;

  /// Format of the analyzed video. Possible values are MP4, MOV and AVI.
  final String? format;

  /// Vertical pixel dimension of the video.
  final int? frameHeight;

  /// Number of frames per second in the video.
  final double? frameRate;

  /// Horizontal pixel dimension of the video.
  final int? frameWidth;

  VideoMetadata({
    this.codec,
    this.colorRange,
    this.durationMillis,
    this.format,
    this.frameHeight,
    this.frameRate,
    this.frameWidth,
  });

  factory VideoMetadata.fromJson(Map<String, dynamic> json) {
    return VideoMetadata(
      codec: json['Codec'] as String?,
      colorRange: (json['ColorRange'] as String?)?.toVideoColorRange(),
      durationMillis: json['DurationMillis'] as int?,
      format: json['Format'] as String?,
      frameHeight: json['FrameHeight'] as int?,
      frameRate: json['FrameRate'] as double?,
      frameWidth: json['FrameWidth'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final codec = this.codec;
    final colorRange = this.colorRange;
    final durationMillis = this.durationMillis;
    final format = this.format;
    final frameHeight = this.frameHeight;
    final frameRate = this.frameRate;
    final frameWidth = this.frameWidth;
    return {
      if (codec != null) 'Codec': codec,
      if (colorRange != null) 'ColorRange': colorRange.toValue(),
      if (durationMillis != null) 'DurationMillis': durationMillis,
      if (format != null) 'Format': format,
      if (frameHeight != null) 'FrameHeight': frameHeight,
      if (frameRate != null) 'FrameRate': frameRate,
      if (frameWidth != null) 'FrameWidth': frameWidth,
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

class HumanLoopQuotaExceededException extends _s.GenericAwsException {
  HumanLoopQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'HumanLoopQuotaExceededException',
            message: message);
}

class IdempotentParameterMismatchException extends _s.GenericAwsException {
  IdempotentParameterMismatchException({String? type, String? message})
      : super(
            type: type,
            code: 'IdempotentParameterMismatchException',
            message: message);
}

class ImageTooLargeException extends _s.GenericAwsException {
  ImageTooLargeException({String? type, String? message})
      : super(type: type, code: 'ImageTooLargeException', message: message);
}

class InternalServerError extends _s.GenericAwsException {
  InternalServerError({String? type, String? message})
      : super(type: type, code: 'InternalServerError', message: message);
}

class InvalidImageFormatException extends _s.GenericAwsException {
  InvalidImageFormatException({String? type, String? message})
      : super(
            type: type, code: 'InvalidImageFormatException', message: message);
}

class InvalidManifestException extends _s.GenericAwsException {
  InvalidManifestException({String? type, String? message})
      : super(type: type, code: 'InvalidManifestException', message: message);
}

class InvalidPaginationTokenException extends _s.GenericAwsException {
  InvalidPaginationTokenException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidPaginationTokenException',
            message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String? type, String? message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class InvalidPolicyRevisionIdException extends _s.GenericAwsException {
  InvalidPolicyRevisionIdException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidPolicyRevisionIdException',
            message: message);
}

class InvalidS3ObjectException extends _s.GenericAwsException {
  InvalidS3ObjectException({String? type, String? message})
      : super(type: type, code: 'InvalidS3ObjectException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class MalformedPolicyDocumentException extends _s.GenericAwsException {
  MalformedPolicyDocumentException({String? type, String? message})
      : super(
            type: type,
            code: 'MalformedPolicyDocumentException',
            message: message);
}

class ProvisionedThroughputExceededException extends _s.GenericAwsException {
  ProvisionedThroughputExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ProvisionedThroughputExceededException',
            message: message);
}

class ResourceAlreadyExistsException extends _s.GenericAwsException {
  ResourceAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceAlreadyExistsException',
            message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String? type, String? message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ResourceNotReadyException extends _s.GenericAwsException {
  ResourceNotReadyException({String? type, String? message})
      : super(type: type, code: 'ResourceNotReadyException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class SessionNotFoundException extends _s.GenericAwsException {
  SessionNotFoundException({String? type, String? message})
      : super(type: type, code: 'SessionNotFoundException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class VideoTooLargeException extends _s.GenericAwsException {
  VideoTooLargeException({String? type, String? message})
      : super(type: type, code: 'VideoTooLargeException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
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
  'InvalidManifestException': (type, message) =>
      InvalidManifestException(type: type, message: message),
  'InvalidPaginationTokenException': (type, message) =>
      InvalidPaginationTokenException(type: type, message: message),
  'InvalidParameterException': (type, message) =>
      InvalidParameterException(type: type, message: message),
  'InvalidPolicyRevisionIdException': (type, message) =>
      InvalidPolicyRevisionIdException(type: type, message: message),
  'InvalidS3ObjectException': (type, message) =>
      InvalidS3ObjectException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'MalformedPolicyDocumentException': (type, message) =>
      MalformedPolicyDocumentException(type: type, message: message),
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
  'SessionNotFoundException': (type, message) =>
      SessionNotFoundException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'VideoTooLargeException': (type, message) =>
      VideoTooLargeException(type: type, message: message),
};
