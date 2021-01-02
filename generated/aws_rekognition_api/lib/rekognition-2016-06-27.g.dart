// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rekognition-2016-06-27.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgeRange _$AgeRangeFromJson(Map<String, dynamic> json) {
  return AgeRange(
    high: json['High'] as int,
    low: json['Low'] as int,
  );
}

Asset _$AssetFromJson(Map<String, dynamic> json) {
  return Asset(
    groundTruthManifest: json['GroundTruthManifest'] == null
        ? null
        : GroundTruthManifest.fromJson(
            json['GroundTruthManifest'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AssetToJson(Asset instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GroundTruthManifest', instance.groundTruthManifest?.toJson());
  return val;
}

Beard _$BeardFromJson(Map<String, dynamic> json) {
  return Beard(
    confidence: (json['Confidence'] as num)?.toDouble(),
    value: json['Value'] as bool,
  );
}

BoundingBox _$BoundingBoxFromJson(Map<String, dynamic> json) {
  return BoundingBox(
    height: (json['Height'] as num)?.toDouble(),
    left: (json['Left'] as num)?.toDouble(),
    top: (json['Top'] as num)?.toDouble(),
    width: (json['Width'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$BoundingBoxToJson(BoundingBox instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Height', instance.height);
  writeNotNull('Left', instance.left);
  writeNotNull('Top', instance.top);
  writeNotNull('Width', instance.width);
  return val;
}

Celebrity _$CelebrityFromJson(Map<String, dynamic> json) {
  return Celebrity(
    face: json['Face'] == null
        ? null
        : ComparedFace.fromJson(json['Face'] as Map<String, dynamic>),
    id: json['Id'] as String,
    matchConfidence: (json['MatchConfidence'] as num)?.toDouble(),
    name: json['Name'] as String,
    urls: (json['Urls'] as List)?.map((e) => e as String)?.toList(),
  );
}

CelebrityDetail _$CelebrityDetailFromJson(Map<String, dynamic> json) {
  return CelebrityDetail(
    boundingBox: json['BoundingBox'] == null
        ? null
        : BoundingBox.fromJson(json['BoundingBox'] as Map<String, dynamic>),
    confidence: (json['Confidence'] as num)?.toDouble(),
    face: json['Face'] == null
        ? null
        : FaceDetail.fromJson(json['Face'] as Map<String, dynamic>),
    id: json['Id'] as String,
    name: json['Name'] as String,
    urls: (json['Urls'] as List)?.map((e) => e as String)?.toList(),
  );
}

CelebrityRecognition _$CelebrityRecognitionFromJson(Map<String, dynamic> json) {
  return CelebrityRecognition(
    celebrity: json['Celebrity'] == null
        ? null
        : CelebrityDetail.fromJson(json['Celebrity'] as Map<String, dynamic>),
    timestamp: json['Timestamp'] as int,
  );
}

CompareFacesMatch _$CompareFacesMatchFromJson(Map<String, dynamic> json) {
  return CompareFacesMatch(
    face: json['Face'] == null
        ? null
        : ComparedFace.fromJson(json['Face'] as Map<String, dynamic>),
    similarity: (json['Similarity'] as num)?.toDouble(),
  );
}

CompareFacesResponse _$CompareFacesResponseFromJson(Map<String, dynamic> json) {
  return CompareFacesResponse(
    faceMatches: (json['FaceMatches'] as List)
        ?.map((e) => e == null
            ? null
            : CompareFacesMatch.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    sourceImageFace: json['SourceImageFace'] == null
        ? null
        : ComparedSourceImageFace.fromJson(
            json['SourceImageFace'] as Map<String, dynamic>),
    sourceImageOrientationCorrection: _$enumDecodeNullable(
        _$OrientationCorrectionEnumMap,
        json['SourceImageOrientationCorrection']),
    targetImageOrientationCorrection: _$enumDecodeNullable(
        _$OrientationCorrectionEnumMap,
        json['TargetImageOrientationCorrection']),
    unmatchedFaces: (json['UnmatchedFaces'] as List)
        ?.map((e) =>
            e == null ? null : ComparedFace.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$OrientationCorrectionEnumMap = {
  OrientationCorrection.rotate_0: 'ROTATE_0',
  OrientationCorrection.rotate_90: 'ROTATE_90',
  OrientationCorrection.rotate_180: 'ROTATE_180',
  OrientationCorrection.rotate_270: 'ROTATE_270',
};

ComparedFace _$ComparedFaceFromJson(Map<String, dynamic> json) {
  return ComparedFace(
    boundingBox: json['BoundingBox'] == null
        ? null
        : BoundingBox.fromJson(json['BoundingBox'] as Map<String, dynamic>),
    confidence: (json['Confidence'] as num)?.toDouble(),
    landmarks: (json['Landmarks'] as List)
        ?.map((e) =>
            e == null ? null : Landmark.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    pose: json['Pose'] == null
        ? null
        : Pose.fromJson(json['Pose'] as Map<String, dynamic>),
    quality: json['Quality'] == null
        ? null
        : ImageQuality.fromJson(json['Quality'] as Map<String, dynamic>),
  );
}

ComparedSourceImageFace _$ComparedSourceImageFaceFromJson(
    Map<String, dynamic> json) {
  return ComparedSourceImageFace(
    boundingBox: json['BoundingBox'] == null
        ? null
        : BoundingBox.fromJson(json['BoundingBox'] as Map<String, dynamic>),
    confidence: (json['Confidence'] as num)?.toDouble(),
  );
}

ContentModerationDetection _$ContentModerationDetectionFromJson(
    Map<String, dynamic> json) {
  return ContentModerationDetection(
    moderationLabel: json['ModerationLabel'] == null
        ? null
        : ModerationLabel.fromJson(
            json['ModerationLabel'] as Map<String, dynamic>),
    timestamp: json['Timestamp'] as int,
  );
}

CreateCollectionResponse _$CreateCollectionResponseFromJson(
    Map<String, dynamic> json) {
  return CreateCollectionResponse(
    collectionArn: json['CollectionArn'] as String,
    faceModelVersion: json['FaceModelVersion'] as String,
    statusCode: json['StatusCode'] as int,
  );
}

CreateProjectResponse _$CreateProjectResponseFromJson(
    Map<String, dynamic> json) {
  return CreateProjectResponse(
    projectArn: json['ProjectArn'] as String,
  );
}

CreateProjectVersionResponse _$CreateProjectVersionResponseFromJson(
    Map<String, dynamic> json) {
  return CreateProjectVersionResponse(
    projectVersionArn: json['ProjectVersionArn'] as String,
  );
}

CreateStreamProcessorResponse _$CreateStreamProcessorResponseFromJson(
    Map<String, dynamic> json) {
  return CreateStreamProcessorResponse(
    streamProcessorArn: json['StreamProcessorArn'] as String,
  );
}

CustomLabel _$CustomLabelFromJson(Map<String, dynamic> json) {
  return CustomLabel(
    confidence: (json['Confidence'] as num)?.toDouble(),
    geometry: json['Geometry'] == null
        ? null
        : Geometry.fromJson(json['Geometry'] as Map<String, dynamic>),
    name: json['Name'] as String,
  );
}

DeleteCollectionResponse _$DeleteCollectionResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteCollectionResponse(
    statusCode: json['StatusCode'] as int,
  );
}

DeleteFacesResponse _$DeleteFacesResponseFromJson(Map<String, dynamic> json) {
  return DeleteFacesResponse(
    deletedFaces:
        (json['DeletedFaces'] as List)?.map((e) => e as String)?.toList(),
  );
}

DeleteProjectResponse _$DeleteProjectResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteProjectResponse(
    status: _$enumDecodeNullable(_$ProjectStatusEnumMap, json['Status']),
  );
}

const _$ProjectStatusEnumMap = {
  ProjectStatus.creating: 'CREATING',
  ProjectStatus.created: 'CREATED',
  ProjectStatus.deleting: 'DELETING',
};

DeleteProjectVersionResponse _$DeleteProjectVersionResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteProjectVersionResponse(
    status: _$enumDecodeNullable(_$ProjectVersionStatusEnumMap, json['Status']),
  );
}

const _$ProjectVersionStatusEnumMap = {
  ProjectVersionStatus.trainingInProgress: 'TRAINING_IN_PROGRESS',
  ProjectVersionStatus.trainingCompleted: 'TRAINING_COMPLETED',
  ProjectVersionStatus.trainingFailed: 'TRAINING_FAILED',
  ProjectVersionStatus.starting: 'STARTING',
  ProjectVersionStatus.running: 'RUNNING',
  ProjectVersionStatus.failed: 'FAILED',
  ProjectVersionStatus.stopping: 'STOPPING',
  ProjectVersionStatus.stopped: 'STOPPED',
  ProjectVersionStatus.deleting: 'DELETING',
};

DeleteStreamProcessorResponse _$DeleteStreamProcessorResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteStreamProcessorResponse();
}

DescribeCollectionResponse _$DescribeCollectionResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeCollectionResponse(
    collectionARN: json['CollectionARN'] as String,
    creationTimestamp:
        const UnixDateTimeConverter().fromJson(json['CreationTimestamp']),
    faceCount: json['FaceCount'] as int,
    faceModelVersion: json['FaceModelVersion'] as String,
  );
}

DescribeProjectVersionsResponse _$DescribeProjectVersionsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeProjectVersionsResponse(
    nextToken: json['NextToken'] as String,
    projectVersionDescriptions: (json['ProjectVersionDescriptions'] as List)
        ?.map((e) => e == null
            ? null
            : ProjectVersionDescription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeProjectsResponse _$DescribeProjectsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeProjectsResponse(
    nextToken: json['NextToken'] as String,
    projectDescriptions: (json['ProjectDescriptions'] as List)
        ?.map((e) => e == null
            ? null
            : ProjectDescription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeStreamProcessorResponse _$DescribeStreamProcessorResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeStreamProcessorResponse(
    creationTimestamp:
        const UnixDateTimeConverter().fromJson(json['CreationTimestamp']),
    input: json['Input'] == null
        ? null
        : StreamProcessorInput.fromJson(json['Input'] as Map<String, dynamic>),
    lastUpdateTimestamp:
        const UnixDateTimeConverter().fromJson(json['LastUpdateTimestamp']),
    name: json['Name'] as String,
    output: json['Output'] == null
        ? null
        : StreamProcessorOutput.fromJson(
            json['Output'] as Map<String, dynamic>),
    roleArn: json['RoleArn'] as String,
    settings: json['Settings'] == null
        ? null
        : StreamProcessorSettings.fromJson(
            json['Settings'] as Map<String, dynamic>),
    status:
        _$enumDecodeNullable(_$StreamProcessorStatusEnumMap, json['Status']),
    statusMessage: json['StatusMessage'] as String,
    streamProcessorArn: json['StreamProcessorArn'] as String,
  );
}

const _$StreamProcessorStatusEnumMap = {
  StreamProcessorStatus.stopped: 'STOPPED',
  StreamProcessorStatus.starting: 'STARTING',
  StreamProcessorStatus.running: 'RUNNING',
  StreamProcessorStatus.failed: 'FAILED',
  StreamProcessorStatus.stopping: 'STOPPING',
};

DetectCustomLabelsResponse _$DetectCustomLabelsResponseFromJson(
    Map<String, dynamic> json) {
  return DetectCustomLabelsResponse(
    customLabels: (json['CustomLabels'] as List)
        ?.map((e) =>
            e == null ? null : CustomLabel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DetectFacesResponse _$DetectFacesResponseFromJson(Map<String, dynamic> json) {
  return DetectFacesResponse(
    faceDetails: (json['FaceDetails'] as List)
        ?.map((e) =>
            e == null ? null : FaceDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    orientationCorrection: _$enumDecodeNullable(
        _$OrientationCorrectionEnumMap, json['OrientationCorrection']),
  );
}

DetectLabelsResponse _$DetectLabelsResponseFromJson(Map<String, dynamic> json) {
  return DetectLabelsResponse(
    labelModelVersion: json['LabelModelVersion'] as String,
    labels: (json['Labels'] as List)
        ?.map(
            (e) => e == null ? null : Label.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    orientationCorrection: _$enumDecodeNullable(
        _$OrientationCorrectionEnumMap, json['OrientationCorrection']),
  );
}

DetectModerationLabelsResponse _$DetectModerationLabelsResponseFromJson(
    Map<String, dynamic> json) {
  return DetectModerationLabelsResponse(
    humanLoopActivationOutput: json['HumanLoopActivationOutput'] == null
        ? null
        : HumanLoopActivationOutput.fromJson(
            json['HumanLoopActivationOutput'] as Map<String, dynamic>),
    moderationLabels: (json['ModerationLabels'] as List)
        ?.map((e) => e == null
            ? null
            : ModerationLabel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    moderationModelVersion: json['ModerationModelVersion'] as String,
  );
}

Map<String, dynamic> _$DetectTextFiltersToJson(DetectTextFilters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RegionsOfInterest',
      instance.regionsOfInterest?.map((e) => e?.toJson())?.toList());
  writeNotNull('WordFilter', instance.wordFilter?.toJson());
  return val;
}

DetectTextResponse _$DetectTextResponseFromJson(Map<String, dynamic> json) {
  return DetectTextResponse(
    textDetections: (json['TextDetections'] as List)
        ?.map((e) => e == null
            ? null
            : TextDetection.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    textModelVersion: json['TextModelVersion'] as String,
  );
}

Map<String, dynamic> _$DetectionFilterToJson(DetectionFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MinBoundingBoxHeight', instance.minBoundingBoxHeight);
  writeNotNull('MinBoundingBoxWidth', instance.minBoundingBoxWidth);
  writeNotNull('MinConfidence', instance.minConfidence);
  return val;
}

Emotion _$EmotionFromJson(Map<String, dynamic> json) {
  return Emotion(
    confidence: (json['Confidence'] as num)?.toDouble(),
    type: _$enumDecodeNullable(_$EmotionNameEnumMap, json['Type']),
  );
}

const _$EmotionNameEnumMap = {
  EmotionName.happy: 'HAPPY',
  EmotionName.sad: 'SAD',
  EmotionName.angry: 'ANGRY',
  EmotionName.confused: 'CONFUSED',
  EmotionName.disgusted: 'DISGUSTED',
  EmotionName.surprised: 'SURPRISED',
  EmotionName.calm: 'CALM',
  EmotionName.unknown: 'UNKNOWN',
  EmotionName.fear: 'FEAR',
};

EvaluationResult _$EvaluationResultFromJson(Map<String, dynamic> json) {
  return EvaluationResult(
    f1Score: (json['F1Score'] as num)?.toDouble(),
    summary: json['Summary'] == null
        ? null
        : Summary.fromJson(json['Summary'] as Map<String, dynamic>),
  );
}

EyeOpen _$EyeOpenFromJson(Map<String, dynamic> json) {
  return EyeOpen(
    confidence: (json['Confidence'] as num)?.toDouble(),
    value: json['Value'] as bool,
  );
}

Eyeglasses _$EyeglassesFromJson(Map<String, dynamic> json) {
  return Eyeglasses(
    confidence: (json['Confidence'] as num)?.toDouble(),
    value: json['Value'] as bool,
  );
}

Face _$FaceFromJson(Map<String, dynamic> json) {
  return Face(
    boundingBox: json['BoundingBox'] == null
        ? null
        : BoundingBox.fromJson(json['BoundingBox'] as Map<String, dynamic>),
    confidence: (json['Confidence'] as num)?.toDouble(),
    externalImageId: json['ExternalImageId'] as String,
    faceId: json['FaceId'] as String,
    imageId: json['ImageId'] as String,
  );
}

FaceDetail _$FaceDetailFromJson(Map<String, dynamic> json) {
  return FaceDetail(
    ageRange: json['AgeRange'] == null
        ? null
        : AgeRange.fromJson(json['AgeRange'] as Map<String, dynamic>),
    beard: json['Beard'] == null
        ? null
        : Beard.fromJson(json['Beard'] as Map<String, dynamic>),
    boundingBox: json['BoundingBox'] == null
        ? null
        : BoundingBox.fromJson(json['BoundingBox'] as Map<String, dynamic>),
    confidence: (json['Confidence'] as num)?.toDouble(),
    emotions: (json['Emotions'] as List)
        ?.map((e) =>
            e == null ? null : Emotion.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    eyeglasses: json['Eyeglasses'] == null
        ? null
        : Eyeglasses.fromJson(json['Eyeglasses'] as Map<String, dynamic>),
    eyesOpen: json['EyesOpen'] == null
        ? null
        : EyeOpen.fromJson(json['EyesOpen'] as Map<String, dynamic>),
    gender: json['Gender'] == null
        ? null
        : Gender.fromJson(json['Gender'] as Map<String, dynamic>),
    landmarks: (json['Landmarks'] as List)
        ?.map((e) =>
            e == null ? null : Landmark.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    mouthOpen: json['MouthOpen'] == null
        ? null
        : MouthOpen.fromJson(json['MouthOpen'] as Map<String, dynamic>),
    mustache: json['Mustache'] == null
        ? null
        : Mustache.fromJson(json['Mustache'] as Map<String, dynamic>),
    pose: json['Pose'] == null
        ? null
        : Pose.fromJson(json['Pose'] as Map<String, dynamic>),
    quality: json['Quality'] == null
        ? null
        : ImageQuality.fromJson(json['Quality'] as Map<String, dynamic>),
    smile: json['Smile'] == null
        ? null
        : Smile.fromJson(json['Smile'] as Map<String, dynamic>),
    sunglasses: json['Sunglasses'] == null
        ? null
        : Sunglasses.fromJson(json['Sunglasses'] as Map<String, dynamic>),
  );
}

FaceDetection _$FaceDetectionFromJson(Map<String, dynamic> json) {
  return FaceDetection(
    face: json['Face'] == null
        ? null
        : FaceDetail.fromJson(json['Face'] as Map<String, dynamic>),
    timestamp: json['Timestamp'] as int,
  );
}

FaceMatch _$FaceMatchFromJson(Map<String, dynamic> json) {
  return FaceMatch(
    face: json['Face'] == null
        ? null
        : Face.fromJson(json['Face'] as Map<String, dynamic>),
    similarity: (json['Similarity'] as num)?.toDouble(),
  );
}

FaceRecord _$FaceRecordFromJson(Map<String, dynamic> json) {
  return FaceRecord(
    face: json['Face'] == null
        ? null
        : Face.fromJson(json['Face'] as Map<String, dynamic>),
    faceDetail: json['FaceDetail'] == null
        ? null
        : FaceDetail.fromJson(json['FaceDetail'] as Map<String, dynamic>),
  );
}

FaceSearchSettings _$FaceSearchSettingsFromJson(Map<String, dynamic> json) {
  return FaceSearchSettings(
    collectionId: json['CollectionId'] as String,
    faceMatchThreshold: (json['FaceMatchThreshold'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$FaceSearchSettingsToJson(FaceSearchSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CollectionId', instance.collectionId);
  writeNotNull('FaceMatchThreshold', instance.faceMatchThreshold);
  return val;
}

Gender _$GenderFromJson(Map<String, dynamic> json) {
  return Gender(
    confidence: (json['Confidence'] as num)?.toDouble(),
    value: _$enumDecodeNullable(_$GenderTypeEnumMap, json['Value']),
  );
}

const _$GenderTypeEnumMap = {
  GenderType.male: 'Male',
  GenderType.female: 'Female',
};

Geometry _$GeometryFromJson(Map<String, dynamic> json) {
  return Geometry(
    boundingBox: json['BoundingBox'] == null
        ? null
        : BoundingBox.fromJson(json['BoundingBox'] as Map<String, dynamic>),
    polygon: (json['Polygon'] as List)
        ?.map(
            (e) => e == null ? null : Point.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetCelebrityInfoResponse _$GetCelebrityInfoResponseFromJson(
    Map<String, dynamic> json) {
  return GetCelebrityInfoResponse(
    name: json['Name'] as String,
    urls: (json['Urls'] as List)?.map((e) => e as String)?.toList(),
  );
}

GetCelebrityRecognitionResponse _$GetCelebrityRecognitionResponseFromJson(
    Map<String, dynamic> json) {
  return GetCelebrityRecognitionResponse(
    celebrities: (json['Celebrities'] as List)
        ?.map((e) => e == null
            ? null
            : CelebrityRecognition.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    jobStatus: _$enumDecodeNullable(_$VideoJobStatusEnumMap, json['JobStatus']),
    nextToken: json['NextToken'] as String,
    statusMessage: json['StatusMessage'] as String,
    videoMetadata: json['VideoMetadata'] == null
        ? null
        : VideoMetadata.fromJson(json['VideoMetadata'] as Map<String, dynamic>),
  );
}

const _$VideoJobStatusEnumMap = {
  VideoJobStatus.inProgress: 'IN_PROGRESS',
  VideoJobStatus.succeeded: 'SUCCEEDED',
  VideoJobStatus.failed: 'FAILED',
};

GetContentModerationResponse _$GetContentModerationResponseFromJson(
    Map<String, dynamic> json) {
  return GetContentModerationResponse(
    jobStatus: _$enumDecodeNullable(_$VideoJobStatusEnumMap, json['JobStatus']),
    moderationLabels: (json['ModerationLabels'] as List)
        ?.map((e) => e == null
            ? null
            : ContentModerationDetection.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    moderationModelVersion: json['ModerationModelVersion'] as String,
    nextToken: json['NextToken'] as String,
    statusMessage: json['StatusMessage'] as String,
    videoMetadata: json['VideoMetadata'] == null
        ? null
        : VideoMetadata.fromJson(json['VideoMetadata'] as Map<String, dynamic>),
  );
}

GetFaceDetectionResponse _$GetFaceDetectionResponseFromJson(
    Map<String, dynamic> json) {
  return GetFaceDetectionResponse(
    faces: (json['Faces'] as List)
        ?.map((e) => e == null
            ? null
            : FaceDetection.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    jobStatus: _$enumDecodeNullable(_$VideoJobStatusEnumMap, json['JobStatus']),
    nextToken: json['NextToken'] as String,
    statusMessage: json['StatusMessage'] as String,
    videoMetadata: json['VideoMetadata'] == null
        ? null
        : VideoMetadata.fromJson(json['VideoMetadata'] as Map<String, dynamic>),
  );
}

GetFaceSearchResponse _$GetFaceSearchResponseFromJson(
    Map<String, dynamic> json) {
  return GetFaceSearchResponse(
    jobStatus: _$enumDecodeNullable(_$VideoJobStatusEnumMap, json['JobStatus']),
    nextToken: json['NextToken'] as String,
    persons: (json['Persons'] as List)
        ?.map((e) =>
            e == null ? null : PersonMatch.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    statusMessage: json['StatusMessage'] as String,
    videoMetadata: json['VideoMetadata'] == null
        ? null
        : VideoMetadata.fromJson(json['VideoMetadata'] as Map<String, dynamic>),
  );
}

GetLabelDetectionResponse _$GetLabelDetectionResponseFromJson(
    Map<String, dynamic> json) {
  return GetLabelDetectionResponse(
    jobStatus: _$enumDecodeNullable(_$VideoJobStatusEnumMap, json['JobStatus']),
    labelModelVersion: json['LabelModelVersion'] as String,
    labels: (json['Labels'] as List)
        ?.map((e) => e == null
            ? null
            : LabelDetection.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
    statusMessage: json['StatusMessage'] as String,
    videoMetadata: json['VideoMetadata'] == null
        ? null
        : VideoMetadata.fromJson(json['VideoMetadata'] as Map<String, dynamic>),
  );
}

GetPersonTrackingResponse _$GetPersonTrackingResponseFromJson(
    Map<String, dynamic> json) {
  return GetPersonTrackingResponse(
    jobStatus: _$enumDecodeNullable(_$VideoJobStatusEnumMap, json['JobStatus']),
    nextToken: json['NextToken'] as String,
    persons: (json['Persons'] as List)
        ?.map((e) => e == null
            ? null
            : PersonDetection.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    statusMessage: json['StatusMessage'] as String,
    videoMetadata: json['VideoMetadata'] == null
        ? null
        : VideoMetadata.fromJson(json['VideoMetadata'] as Map<String, dynamic>),
  );
}

GetTextDetectionResponse _$GetTextDetectionResponseFromJson(
    Map<String, dynamic> json) {
  return GetTextDetectionResponse(
    jobStatus: _$enumDecodeNullable(_$VideoJobStatusEnumMap, json['JobStatus']),
    nextToken: json['NextToken'] as String,
    statusMessage: json['StatusMessage'] as String,
    textDetections: (json['TextDetections'] as List)
        ?.map((e) => e == null
            ? null
            : TextDetectionResult.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    textModelVersion: json['TextModelVersion'] as String,
    videoMetadata: json['VideoMetadata'] == null
        ? null
        : VideoMetadata.fromJson(json['VideoMetadata'] as Map<String, dynamic>),
  );
}

GroundTruthManifest _$GroundTruthManifestFromJson(Map<String, dynamic> json) {
  return GroundTruthManifest(
    s3Object: json['S3Object'] == null
        ? null
        : S3Object.fromJson(json['S3Object'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GroundTruthManifestToJson(GroundTruthManifest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('S3Object', instance.s3Object?.toJson());
  return val;
}

HumanLoopActivationOutput _$HumanLoopActivationOutputFromJson(
    Map<String, dynamic> json) {
  return HumanLoopActivationOutput(
    humanLoopActivationConditionsEvaluationResults:
        json['HumanLoopActivationConditionsEvaluationResults'],
    humanLoopActivationReasons: (json['HumanLoopActivationReasons'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    humanLoopArn: json['HumanLoopArn'] as String,
  );
}

Map<String, dynamic> _$HumanLoopConfigToJson(HumanLoopConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FlowDefinitionArn', instance.flowDefinitionArn);
  writeNotNull('HumanLoopName', instance.humanLoopName);
  writeNotNull('DataAttributes', instance.dataAttributes?.toJson());
  return val;
}

Map<String, dynamic> _$HumanLoopDataAttributesToJson(
    HumanLoopDataAttributes instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'ContentClassifiers',
      instance.contentClassifiers
          ?.map((e) => _$ContentClassifierEnumMap[e])
          ?.toList());
  return val;
}

const _$ContentClassifierEnumMap = {
  ContentClassifier.freeOfPersonallyIdentifiableInformation:
      'FreeOfPersonallyIdentifiableInformation',
  ContentClassifier.freeOfAdultContent: 'FreeOfAdultContent',
};

Map<String, dynamic> _$ImageToJson(Image instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Bytes', const Uint8ListConverter().toJson(instance.bytes));
  writeNotNull('S3Object', instance.s3Object?.toJson());
  return val;
}

ImageQuality _$ImageQualityFromJson(Map<String, dynamic> json) {
  return ImageQuality(
    brightness: (json['Brightness'] as num)?.toDouble(),
    sharpness: (json['Sharpness'] as num)?.toDouble(),
  );
}

IndexFacesResponse _$IndexFacesResponseFromJson(Map<String, dynamic> json) {
  return IndexFacesResponse(
    faceModelVersion: json['FaceModelVersion'] as String,
    faceRecords: (json['FaceRecords'] as List)
        ?.map((e) =>
            e == null ? null : FaceRecord.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    orientationCorrection: _$enumDecodeNullable(
        _$OrientationCorrectionEnumMap, json['OrientationCorrection']),
    unindexedFaces: (json['UnindexedFaces'] as List)
        ?.map((e) => e == null
            ? null
            : UnindexedFace.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Instance _$InstanceFromJson(Map<String, dynamic> json) {
  return Instance(
    boundingBox: json['BoundingBox'] == null
        ? null
        : BoundingBox.fromJson(json['BoundingBox'] as Map<String, dynamic>),
    confidence: (json['Confidence'] as num)?.toDouble(),
  );
}

KinesisDataStream _$KinesisDataStreamFromJson(Map<String, dynamic> json) {
  return KinesisDataStream(
    arn: json['Arn'] as String,
  );
}

Map<String, dynamic> _$KinesisDataStreamToJson(KinesisDataStream instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Arn', instance.arn);
  return val;
}

KinesisVideoStream _$KinesisVideoStreamFromJson(Map<String, dynamic> json) {
  return KinesisVideoStream(
    arn: json['Arn'] as String,
  );
}

Map<String, dynamic> _$KinesisVideoStreamToJson(KinesisVideoStream instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Arn', instance.arn);
  return val;
}

Label _$LabelFromJson(Map<String, dynamic> json) {
  return Label(
    confidence: (json['Confidence'] as num)?.toDouble(),
    instances: (json['Instances'] as List)
        ?.map((e) =>
            e == null ? null : Instance.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    name: json['Name'] as String,
    parents: (json['Parents'] as List)
        ?.map((e) =>
            e == null ? null : Parent.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

LabelDetection _$LabelDetectionFromJson(Map<String, dynamic> json) {
  return LabelDetection(
    label: json['Label'] == null
        ? null
        : Label.fromJson(json['Label'] as Map<String, dynamic>),
    timestamp: json['Timestamp'] as int,
  );
}

Landmark _$LandmarkFromJson(Map<String, dynamic> json) {
  return Landmark(
    type: _$enumDecodeNullable(_$LandmarkTypeEnumMap, json['Type']),
    x: (json['X'] as num)?.toDouble(),
    y: (json['Y'] as num)?.toDouble(),
  );
}

const _$LandmarkTypeEnumMap = {
  LandmarkType.eyeLeft: 'eyeLeft',
  LandmarkType.eyeRight: 'eyeRight',
  LandmarkType.nose: 'nose',
  LandmarkType.mouthLeft: 'mouthLeft',
  LandmarkType.mouthRight: 'mouthRight',
  LandmarkType.leftEyeBrowLeft: 'leftEyeBrowLeft',
  LandmarkType.leftEyeBrowRight: 'leftEyeBrowRight',
  LandmarkType.leftEyeBrowUp: 'leftEyeBrowUp',
  LandmarkType.rightEyeBrowLeft: 'rightEyeBrowLeft',
  LandmarkType.rightEyeBrowRight: 'rightEyeBrowRight',
  LandmarkType.rightEyeBrowUp: 'rightEyeBrowUp',
  LandmarkType.leftEyeLeft: 'leftEyeLeft',
  LandmarkType.leftEyeRight: 'leftEyeRight',
  LandmarkType.leftEyeUp: 'leftEyeUp',
  LandmarkType.leftEyeDown: 'leftEyeDown',
  LandmarkType.rightEyeLeft: 'rightEyeLeft',
  LandmarkType.rightEyeRight: 'rightEyeRight',
  LandmarkType.rightEyeUp: 'rightEyeUp',
  LandmarkType.rightEyeDown: 'rightEyeDown',
  LandmarkType.noseLeft: 'noseLeft',
  LandmarkType.noseRight: 'noseRight',
  LandmarkType.mouthUp: 'mouthUp',
  LandmarkType.mouthDown: 'mouthDown',
  LandmarkType.leftPupil: 'leftPupil',
  LandmarkType.rightPupil: 'rightPupil',
  LandmarkType.upperJawlineLeft: 'upperJawlineLeft',
  LandmarkType.midJawlineLeft: 'midJawlineLeft',
  LandmarkType.chinBottom: 'chinBottom',
  LandmarkType.midJawlineRight: 'midJawlineRight',
  LandmarkType.upperJawlineRight: 'upperJawlineRight',
};

ListCollectionsResponse _$ListCollectionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListCollectionsResponse(
    collectionIds:
        (json['CollectionIds'] as List)?.map((e) => e as String)?.toList(),
    faceModelVersions:
        (json['FaceModelVersions'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListFacesResponse _$ListFacesResponseFromJson(Map<String, dynamic> json) {
  return ListFacesResponse(
    faceModelVersion: json['FaceModelVersion'] as String,
    faces: (json['Faces'] as List)
        ?.map(
            (e) => e == null ? null : Face.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListStreamProcessorsResponse _$ListStreamProcessorsResponseFromJson(
    Map<String, dynamic> json) {
  return ListStreamProcessorsResponse(
    nextToken: json['NextToken'] as String,
    streamProcessors: (json['StreamProcessors'] as List)
        ?.map((e) => e == null
            ? null
            : StreamProcessor.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ModerationLabel _$ModerationLabelFromJson(Map<String, dynamic> json) {
  return ModerationLabel(
    confidence: (json['Confidence'] as num)?.toDouble(),
    name: json['Name'] as String,
    parentName: json['ParentName'] as String,
  );
}

MouthOpen _$MouthOpenFromJson(Map<String, dynamic> json) {
  return MouthOpen(
    confidence: (json['Confidence'] as num)?.toDouble(),
    value: json['Value'] as bool,
  );
}

Mustache _$MustacheFromJson(Map<String, dynamic> json) {
  return Mustache(
    confidence: (json['Confidence'] as num)?.toDouble(),
    value: json['Value'] as bool,
  );
}

Map<String, dynamic> _$NotificationChannelToJson(NotificationChannel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RoleArn', instance.roleArn);
  writeNotNull('SNSTopicArn', instance.sNSTopicArn);
  return val;
}

OutputConfig _$OutputConfigFromJson(Map<String, dynamic> json) {
  return OutputConfig(
    s3Bucket: json['S3Bucket'] as String,
    s3KeyPrefix: json['S3KeyPrefix'] as String,
  );
}

Map<String, dynamic> _$OutputConfigToJson(OutputConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('S3Bucket', instance.s3Bucket);
  writeNotNull('S3KeyPrefix', instance.s3KeyPrefix);
  return val;
}

Parent _$ParentFromJson(Map<String, dynamic> json) {
  return Parent(
    name: json['Name'] as String,
  );
}

PersonDetail _$PersonDetailFromJson(Map<String, dynamic> json) {
  return PersonDetail(
    boundingBox: json['BoundingBox'] == null
        ? null
        : BoundingBox.fromJson(json['BoundingBox'] as Map<String, dynamic>),
    face: json['Face'] == null
        ? null
        : FaceDetail.fromJson(json['Face'] as Map<String, dynamic>),
    index: json['Index'] as int,
  );
}

PersonDetection _$PersonDetectionFromJson(Map<String, dynamic> json) {
  return PersonDetection(
    person: json['Person'] == null
        ? null
        : PersonDetail.fromJson(json['Person'] as Map<String, dynamic>),
    timestamp: json['Timestamp'] as int,
  );
}

PersonMatch _$PersonMatchFromJson(Map<String, dynamic> json) {
  return PersonMatch(
    faceMatches: (json['FaceMatches'] as List)
        ?.map((e) =>
            e == null ? null : FaceMatch.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    person: json['Person'] == null
        ? null
        : PersonDetail.fromJson(json['Person'] as Map<String, dynamic>),
    timestamp: json['Timestamp'] as int,
  );
}

Point _$PointFromJson(Map<String, dynamic> json) {
  return Point(
    x: (json['X'] as num)?.toDouble(),
    y: (json['Y'] as num)?.toDouble(),
  );
}

Pose _$PoseFromJson(Map<String, dynamic> json) {
  return Pose(
    pitch: (json['Pitch'] as num)?.toDouble(),
    roll: (json['Roll'] as num)?.toDouble(),
    yaw: (json['Yaw'] as num)?.toDouble(),
  );
}

ProjectDescription _$ProjectDescriptionFromJson(Map<String, dynamic> json) {
  return ProjectDescription(
    creationTimestamp:
        const UnixDateTimeConverter().fromJson(json['CreationTimestamp']),
    projectArn: json['ProjectArn'] as String,
    status: _$enumDecodeNullable(_$ProjectStatusEnumMap, json['Status']),
  );
}

ProjectVersionDescription _$ProjectVersionDescriptionFromJson(
    Map<String, dynamic> json) {
  return ProjectVersionDescription(
    billableTrainingTimeInSeconds: json['BillableTrainingTimeInSeconds'] as int,
    creationTimestamp:
        const UnixDateTimeConverter().fromJson(json['CreationTimestamp']),
    evaluationResult: json['EvaluationResult'] == null
        ? null
        : EvaluationResult.fromJson(
            json['EvaluationResult'] as Map<String, dynamic>),
    minInferenceUnits: json['MinInferenceUnits'] as int,
    outputConfig: json['OutputConfig'] == null
        ? null
        : OutputConfig.fromJson(json['OutputConfig'] as Map<String, dynamic>),
    projectVersionArn: json['ProjectVersionArn'] as String,
    status: _$enumDecodeNullable(_$ProjectVersionStatusEnumMap, json['Status']),
    statusMessage: json['StatusMessage'] as String,
    testingDataResult: json['TestingDataResult'] == null
        ? null
        : TestingDataResult.fromJson(
            json['TestingDataResult'] as Map<String, dynamic>),
    trainingDataResult: json['TrainingDataResult'] == null
        ? null
        : TrainingDataResult.fromJson(
            json['TrainingDataResult'] as Map<String, dynamic>),
    trainingEndTimestamp:
        const UnixDateTimeConverter().fromJson(json['TrainingEndTimestamp']),
  );
}

RecognizeCelebritiesResponse _$RecognizeCelebritiesResponseFromJson(
    Map<String, dynamic> json) {
  return RecognizeCelebritiesResponse(
    celebrityFaces: (json['CelebrityFaces'] as List)
        ?.map((e) =>
            e == null ? null : Celebrity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    orientationCorrection: _$enumDecodeNullable(
        _$OrientationCorrectionEnumMap, json['OrientationCorrection']),
    unrecognizedFaces: (json['UnrecognizedFaces'] as List)
        ?.map((e) =>
            e == null ? null : ComparedFace.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RegionOfInterestToJson(RegionOfInterest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BoundingBox', instance.boundingBox?.toJson());
  return val;
}

S3Object _$S3ObjectFromJson(Map<String, dynamic> json) {
  return S3Object(
    bucket: json['Bucket'] as String,
    name: json['Name'] as String,
    version: json['Version'] as String,
  );
}

Map<String, dynamic> _$S3ObjectToJson(S3Object instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Bucket', instance.bucket);
  writeNotNull('Name', instance.name);
  writeNotNull('Version', instance.version);
  return val;
}

SearchFacesByImageResponse _$SearchFacesByImageResponseFromJson(
    Map<String, dynamic> json) {
  return SearchFacesByImageResponse(
    faceMatches: (json['FaceMatches'] as List)
        ?.map((e) =>
            e == null ? null : FaceMatch.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    faceModelVersion: json['FaceModelVersion'] as String,
    searchedFaceBoundingBox: json['SearchedFaceBoundingBox'] == null
        ? null
        : BoundingBox.fromJson(
            json['SearchedFaceBoundingBox'] as Map<String, dynamic>),
    searchedFaceConfidence: (json['SearchedFaceConfidence'] as num)?.toDouble(),
  );
}

SearchFacesResponse _$SearchFacesResponseFromJson(Map<String, dynamic> json) {
  return SearchFacesResponse(
    faceMatches: (json['FaceMatches'] as List)
        ?.map((e) =>
            e == null ? null : FaceMatch.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    faceModelVersion: json['FaceModelVersion'] as String,
    searchedFaceId: json['SearchedFaceId'] as String,
  );
}

Smile _$SmileFromJson(Map<String, dynamic> json) {
  return Smile(
    confidence: (json['Confidence'] as num)?.toDouble(),
    value: json['Value'] as bool,
  );
}

StartCelebrityRecognitionResponse _$StartCelebrityRecognitionResponseFromJson(
    Map<String, dynamic> json) {
  return StartCelebrityRecognitionResponse(
    jobId: json['JobId'] as String,
  );
}

StartContentModerationResponse _$StartContentModerationResponseFromJson(
    Map<String, dynamic> json) {
  return StartContentModerationResponse(
    jobId: json['JobId'] as String,
  );
}

StartFaceDetectionResponse _$StartFaceDetectionResponseFromJson(
    Map<String, dynamic> json) {
  return StartFaceDetectionResponse(
    jobId: json['JobId'] as String,
  );
}

StartFaceSearchResponse _$StartFaceSearchResponseFromJson(
    Map<String, dynamic> json) {
  return StartFaceSearchResponse(
    jobId: json['JobId'] as String,
  );
}

StartLabelDetectionResponse _$StartLabelDetectionResponseFromJson(
    Map<String, dynamic> json) {
  return StartLabelDetectionResponse(
    jobId: json['JobId'] as String,
  );
}

StartPersonTrackingResponse _$StartPersonTrackingResponseFromJson(
    Map<String, dynamic> json) {
  return StartPersonTrackingResponse(
    jobId: json['JobId'] as String,
  );
}

StartProjectVersionResponse _$StartProjectVersionResponseFromJson(
    Map<String, dynamic> json) {
  return StartProjectVersionResponse(
    status: _$enumDecodeNullable(_$ProjectVersionStatusEnumMap, json['Status']),
  );
}

StartStreamProcessorResponse _$StartStreamProcessorResponseFromJson(
    Map<String, dynamic> json) {
  return StartStreamProcessorResponse();
}

Map<String, dynamic> _$StartTextDetectionFiltersToJson(
    StartTextDetectionFilters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RegionsOfInterest',
      instance.regionsOfInterest?.map((e) => e?.toJson())?.toList());
  writeNotNull('WordFilter', instance.wordFilter?.toJson());
  return val;
}

StartTextDetectionResponse _$StartTextDetectionResponseFromJson(
    Map<String, dynamic> json) {
  return StartTextDetectionResponse(
    jobId: json['JobId'] as String,
  );
}

StopProjectVersionResponse _$StopProjectVersionResponseFromJson(
    Map<String, dynamic> json) {
  return StopProjectVersionResponse(
    status: _$enumDecodeNullable(_$ProjectVersionStatusEnumMap, json['Status']),
  );
}

StopStreamProcessorResponse _$StopStreamProcessorResponseFromJson(
    Map<String, dynamic> json) {
  return StopStreamProcessorResponse();
}

StreamProcessor _$StreamProcessorFromJson(Map<String, dynamic> json) {
  return StreamProcessor(
    name: json['Name'] as String,
    status:
        _$enumDecodeNullable(_$StreamProcessorStatusEnumMap, json['Status']),
  );
}

StreamProcessorInput _$StreamProcessorInputFromJson(Map<String, dynamic> json) {
  return StreamProcessorInput(
    kinesisVideoStream: json['KinesisVideoStream'] == null
        ? null
        : KinesisVideoStream.fromJson(
            json['KinesisVideoStream'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$StreamProcessorInputToJson(
    StreamProcessorInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KinesisVideoStream', instance.kinesisVideoStream?.toJson());
  return val;
}

StreamProcessorOutput _$StreamProcessorOutputFromJson(
    Map<String, dynamic> json) {
  return StreamProcessorOutput(
    kinesisDataStream: json['KinesisDataStream'] == null
        ? null
        : KinesisDataStream.fromJson(
            json['KinesisDataStream'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$StreamProcessorOutputToJson(
    StreamProcessorOutput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KinesisDataStream', instance.kinesisDataStream?.toJson());
  return val;
}

StreamProcessorSettings _$StreamProcessorSettingsFromJson(
    Map<String, dynamic> json) {
  return StreamProcessorSettings(
    faceSearch: json['FaceSearch'] == null
        ? null
        : FaceSearchSettings.fromJson(
            json['FaceSearch'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$StreamProcessorSettingsToJson(
    StreamProcessorSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FaceSearch', instance.faceSearch?.toJson());
  return val;
}

Summary _$SummaryFromJson(Map<String, dynamic> json) {
  return Summary(
    s3Object: json['S3Object'] == null
        ? null
        : S3Object.fromJson(json['S3Object'] as Map<String, dynamic>),
  );
}

Sunglasses _$SunglassesFromJson(Map<String, dynamic> json) {
  return Sunglasses(
    confidence: (json['Confidence'] as num)?.toDouble(),
    value: json['Value'] as bool,
  );
}

TestingData _$TestingDataFromJson(Map<String, dynamic> json) {
  return TestingData(
    assets: (json['Assets'] as List)
        ?.map(
            (e) => e == null ? null : Asset.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    autoCreate: json['AutoCreate'] as bool,
  );
}

Map<String, dynamic> _$TestingDataToJson(TestingData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Assets', instance.assets?.map((e) => e?.toJson())?.toList());
  writeNotNull('AutoCreate', instance.autoCreate);
  return val;
}

TestingDataResult _$TestingDataResultFromJson(Map<String, dynamic> json) {
  return TestingDataResult(
    input: json['Input'] == null
        ? null
        : TestingData.fromJson(json['Input'] as Map<String, dynamic>),
    output: json['Output'] == null
        ? null
        : TestingData.fromJson(json['Output'] as Map<String, dynamic>),
  );
}

TextDetection _$TextDetectionFromJson(Map<String, dynamic> json) {
  return TextDetection(
    confidence: (json['Confidence'] as num)?.toDouble(),
    detectedText: json['DetectedText'] as String,
    geometry: json['Geometry'] == null
        ? null
        : Geometry.fromJson(json['Geometry'] as Map<String, dynamic>),
    id: json['Id'] as int,
    parentId: json['ParentId'] as int,
    type: _$enumDecodeNullable(_$TextTypesEnumMap, json['Type']),
  );
}

const _$TextTypesEnumMap = {
  TextTypes.line: 'LINE',
  TextTypes.word: 'WORD',
};

TextDetectionResult _$TextDetectionResultFromJson(Map<String, dynamic> json) {
  return TextDetectionResult(
    textDetection: json['TextDetection'] == null
        ? null
        : TextDetection.fromJson(json['TextDetection'] as Map<String, dynamic>),
    timestamp: json['Timestamp'] as int,
  );
}

TrainingData _$TrainingDataFromJson(Map<String, dynamic> json) {
  return TrainingData(
    assets: (json['Assets'] as List)
        ?.map(
            (e) => e == null ? null : Asset.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$TrainingDataToJson(TrainingData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Assets', instance.assets?.map((e) => e?.toJson())?.toList());
  return val;
}

TrainingDataResult _$TrainingDataResultFromJson(Map<String, dynamic> json) {
  return TrainingDataResult(
    input: json['Input'] == null
        ? null
        : TrainingData.fromJson(json['Input'] as Map<String, dynamic>),
    output: json['Output'] == null
        ? null
        : TrainingData.fromJson(json['Output'] as Map<String, dynamic>),
  );
}

UnindexedFace _$UnindexedFaceFromJson(Map<String, dynamic> json) {
  return UnindexedFace(
    faceDetail: json['FaceDetail'] == null
        ? null
        : FaceDetail.fromJson(json['FaceDetail'] as Map<String, dynamic>),
    reasons: (json['Reasons'] as List)
        ?.map((e) => _$enumDecodeNullable(_$ReasonEnumMap, e))
        ?.toList(),
  );
}

const _$ReasonEnumMap = {
  Reason.exceedsMaxFaces: 'EXCEEDS_MAX_FACES',
  Reason.extremePose: 'EXTREME_POSE',
  Reason.lowBrightness: 'LOW_BRIGHTNESS',
  Reason.lowSharpness: 'LOW_SHARPNESS',
  Reason.lowConfidence: 'LOW_CONFIDENCE',
  Reason.smallBoundingBox: 'SMALL_BOUNDING_BOX',
  Reason.lowFaceQuality: 'LOW_FACE_QUALITY',
};

Map<String, dynamic> _$VideoToJson(Video instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('S3Object', instance.s3Object?.toJson());
  return val;
}

VideoMetadata _$VideoMetadataFromJson(Map<String, dynamic> json) {
  return VideoMetadata(
    codec: json['Codec'] as String,
    durationMillis: json['DurationMillis'] as int,
    format: json['Format'] as String,
    frameHeight: json['FrameHeight'] as int,
    frameRate: (json['FrameRate'] as num)?.toDouble(),
    frameWidth: json['FrameWidth'] as int,
  );
}
