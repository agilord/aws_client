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

/// Amazon Lookout for Equipment is a machine learning service that uses
/// advanced analytics to identify anomalies in machines from sensor data for
/// use in predictive maintenance.
class LookoutEquipment {
  final _s.JsonProtocol _protocol;
  LookoutEquipment({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'lookoutequipment',
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

  /// Creates a container for a collection of data being ingested for analysis.
  /// The dataset contains the metadata describing where the data is and what
  /// the data actually looks like. For example, it contains the location of the
  /// data source, the data schema, and other information. A dataset also
  /// contains any tags associated with the ingested data.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [datasetName] :
  /// The name of the dataset being created.
  ///
  /// Parameter [clientToken] :
  /// A unique identifier for the request. If you do not set the client request
  /// token, Amazon Lookout for Equipment generates one.
  ///
  /// Parameter [datasetSchema] :
  /// A JSON description of the data that is in each time series dataset,
  /// including names, column names, and data types.
  ///
  /// Parameter [serverSideKmsKeyId] :
  /// Provides the identifier of the KMS key used to encrypt dataset data by
  /// Amazon Lookout for Equipment.
  ///
  /// Parameter [tags] :
  /// Any tags associated with the ingested data described in the dataset.
  Future<CreateDatasetResponse> createDataset({
    required String datasetName,
    String? clientToken,
    DatasetSchema? datasetSchema,
    String? serverSideKmsKeyId,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSLookoutEquipmentFrontendService.CreateDataset'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatasetName': datasetName,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (datasetSchema != null) 'DatasetSchema': datasetSchema,
        if (serverSideKmsKeyId != null)
          'ServerSideKmsKeyId': serverSideKmsKeyId,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateDatasetResponse.fromJson(jsonResponse.body);
  }

  /// Creates a scheduled inference. Scheduling an inference is setting up a
  /// continuous real-time inference plan to analyze new measurement data. When
  /// setting up the schedule, you provide an S3 bucket location for the input
  /// data, assign it a delimiter between separate entries in the data, set an
  /// offset delay if desired, and set the frequency of inferencing. You must
  /// also provide an S3 bucket location for the output data.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [dataInputConfiguration] :
  /// Specifies configuration information for the input data for the inference
  /// scheduler, including delimiter, format, and dataset location.
  ///
  /// Parameter [dataOutputConfiguration] :
  /// Specifies configuration information for the output results for the
  /// inference scheduler, including the S3 location for the output.
  ///
  /// Parameter [dataUploadFrequency] :
  /// How often data is uploaded to the source Amazon S3 bucket for the input
  /// data. The value chosen is the length of time between data uploads. For
  /// instance, if you select 5 minutes, Amazon Lookout for Equipment will
  /// upload the real-time data to the source bucket once every 5 minutes. This
  /// frequency also determines how often Amazon Lookout for Equipment runs
  /// inference on your data.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/lookout-for-equipment/latest/ug/understanding-inference-process.html">Understanding
  /// the inference process</a>.
  ///
  /// Parameter [inferenceSchedulerName] :
  /// The name of the inference scheduler being created.
  ///
  /// Parameter [modelName] :
  /// The name of the previously trained machine learning model being used to
  /// create the inference scheduler.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of a role with permission to access the
  /// data source being used for the inference.
  ///
  /// Parameter [clientToken] :
  /// A unique identifier for the request. If you do not set the client request
  /// token, Amazon Lookout for Equipment generates one.
  ///
  /// Parameter [dataDelayOffsetInMinutes] :
  /// The interval (in minutes) of planned delay at the start of each inference
  /// segment. For example, if inference is set to run every ten minutes, the
  /// delay is set to five minutes and the time is 09:08. The inference
  /// scheduler will wake up at the configured interval (which, without a delay
  /// configured, would be 09:10) plus the additional five minute delay time (so
  /// 09:15) to check your Amazon S3 bucket. The delay provides a buffer for you
  /// to upload data at the same frequency, so that you don't have to stop and
  /// restart the scheduler when uploading new data.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/lookout-for-equipment/latest/ug/understanding-inference-process.html">Understanding
  /// the inference process</a>.
  ///
  /// Parameter [serverSideKmsKeyId] :
  /// Provides the identifier of the KMS key used to encrypt inference scheduler
  /// data by Amazon Lookout for Equipment.
  ///
  /// Parameter [tags] :
  /// Any tags associated with the inference scheduler.
  Future<CreateInferenceSchedulerResponse> createInferenceScheduler({
    required InferenceInputConfiguration dataInputConfiguration,
    required InferenceOutputConfiguration dataOutputConfiguration,
    required DataUploadFrequency dataUploadFrequency,
    required String inferenceSchedulerName,
    required String modelName,
    required String roleArn,
    String? clientToken,
    int? dataDelayOffsetInMinutes,
    String? serverSideKmsKeyId,
    List<Tag>? tags,
  }) async {
    _s.validateNumRange(
      'dataDelayOffsetInMinutes',
      dataDelayOffsetInMinutes,
      0,
      60,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSLookoutEquipmentFrontendService.CreateInferenceScheduler'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DataInputConfiguration': dataInputConfiguration,
        'DataOutputConfiguration': dataOutputConfiguration,
        'DataUploadFrequency': dataUploadFrequency.toValue(),
        'InferenceSchedulerName': inferenceSchedulerName,
        'ModelName': modelName,
        'RoleArn': roleArn,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (dataDelayOffsetInMinutes != null)
          'DataDelayOffsetInMinutes': dataDelayOffsetInMinutes,
        if (serverSideKmsKeyId != null)
          'ServerSideKmsKeyId': serverSideKmsKeyId,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateInferenceSchedulerResponse.fromJson(jsonResponse.body);
  }

  /// Creates a label for an event.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [endTime] :
  /// The end time of the labeled event.
  ///
  /// Parameter [labelGroupName] :
  /// The name of a group of labels.
  ///
  /// Data in this field will be retained for service usage. Follow best
  /// practices for the security of your data.
  ///
  /// Parameter [rating] :
  /// Indicates whether a labeled event represents an anomaly.
  ///
  /// Parameter [startTime] :
  /// The start time of the labeled event.
  ///
  /// Parameter [clientToken] :
  /// A unique identifier for the request to create a label. If you do not set
  /// the client request token, Lookout for Equipment generates one.
  ///
  /// Parameter [equipment] :
  /// Indicates that a label pertains to a particular piece of equipment.
  ///
  /// Data in this field will be retained for service usage. Follow best
  /// practices for the security of your data.
  ///
  /// Parameter [faultCode] :
  /// Provides additional information about the label. The fault code must be
  /// defined in the FaultCodes attribute of the label group.
  ///
  /// Data in this field will be retained for service usage. Follow best
  /// practices for the security of your data.
  ///
  /// Parameter [notes] :
  /// Metadata providing additional information about the label.
  ///
  /// Data in this field will be retained for service usage. Follow best
  /// practices for the security of your data.
  Future<CreateLabelResponse> createLabel({
    required DateTime endTime,
    required String labelGroupName,
    required LabelRating rating,
    required DateTime startTime,
    String? clientToken,
    String? equipment,
    String? faultCode,
    String? notes,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSLookoutEquipmentFrontendService.CreateLabel'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EndTime': unixTimestampToJson(endTime),
        'LabelGroupName': labelGroupName,
        'Rating': rating.toValue(),
        'StartTime': unixTimestampToJson(startTime),
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (equipment != null) 'Equipment': equipment,
        if (faultCode != null) 'FaultCode': faultCode,
        if (notes != null) 'Notes': notes,
      },
    );

    return CreateLabelResponse.fromJson(jsonResponse.body);
  }

  /// Creates a group of labels.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [labelGroupName] :
  /// Names a group of labels.
  ///
  /// Data in this field will be retained for service usage. Follow best
  /// practices for the security of your data.
  ///
  /// Parameter [clientToken] :
  /// A unique identifier for the request to create a label group. If you do not
  /// set the client request token, Lookout for Equipment generates one.
  ///
  /// Parameter [faultCodes] :
  /// The acceptable fault codes (indicating the type of anomaly associated with
  /// the label) that can be used with this label group.
  ///
  /// Data in this field will be retained for service usage. Follow best
  /// practices for the security of your data.
  ///
  /// Parameter [tags] :
  /// Tags that provide metadata about the label group you are creating.
  ///
  /// Data in this field will be retained for service usage. Follow best
  /// practices for the security of your data.
  Future<CreateLabelGroupResponse> createLabelGroup({
    required String labelGroupName,
    String? clientToken,
    List<String>? faultCodes,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSLookoutEquipmentFrontendService.CreateLabelGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LabelGroupName': labelGroupName,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (faultCodes != null) 'FaultCodes': faultCodes,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateLabelGroupResponse.fromJson(jsonResponse.body);
  }

  /// Creates a machine learning model for data inference.
  ///
  /// A machine-learning (ML) model is a mathematical model that finds patterns
  /// in your data. In Amazon Lookout for Equipment, the model learns the
  /// patterns of normal behavior and detects abnormal behavior that could be
  /// potential equipment failure (or maintenance events). The models are made
  /// by analyzing normal data and abnormalities in machine behavior that have
  /// already occurred.
  ///
  /// Your model is trained using a portion of the data from your dataset and
  /// uses that data to learn patterns of normal behavior and abnormal patterns
  /// that lead to equipment failure. Another portion of the data is used to
  /// evaluate the model's accuracy.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [datasetName] :
  /// The name of the dataset for the machine learning model being created.
  ///
  /// Parameter [modelName] :
  /// The name for the machine learning model to be created.
  ///
  /// Parameter [clientToken] :
  /// A unique identifier for the request. If you do not set the client request
  /// token, Amazon Lookout for Equipment generates one.
  ///
  /// Parameter [dataPreProcessingConfiguration] :
  /// The configuration is the <code>TargetSamplingRate</code>, which is the
  /// sampling rate of the data after post processing by Amazon Lookout for
  /// Equipment. For example, if you provide data that has been collected at a 1
  /// second level and you want the system to resample the data at a 1 minute
  /// rate before training, the <code>TargetSamplingRate</code> is 1 minute.
  ///
  /// When providing a value for the <code>TargetSamplingRate</code>, you must
  /// attach the prefix "PT" to the rate you want. The value for a 1 second rate
  /// is therefore <i>PT1S</i>, the value for a 15 minute rate is <i>PT15M</i>,
  /// and the value for a 1 hour rate is <i>PT1H</i>
  ///
  /// Parameter [datasetSchema] :
  /// The data schema for the machine learning model being created.
  ///
  /// Parameter [evaluationDataEndTime] :
  /// Indicates the time reference in the dataset that should be used to end the
  /// subset of evaluation data for the machine learning model.
  ///
  /// Parameter [evaluationDataStartTime] :
  /// Indicates the time reference in the dataset that should be used to begin
  /// the subset of evaluation data for the machine learning model.
  ///
  /// Parameter [labelsInputConfiguration] :
  /// The input configuration for the labels being used for the machine learning
  /// model that's being created.
  ///
  /// Parameter [modelDiagnosticsOutputConfiguration] :
  /// The Amazon S3 location where you want Amazon Lookout for Equipment to save
  /// the pointwise model diagnostics. You must also specify the
  /// <code>RoleArn</code> request parameter.
  ///
  /// Parameter [offCondition] :
  /// Indicates that the asset associated with this sensor has been shut off. As
  /// long as this condition is met, Lookout for Equipment will not use data
  /// from this asset for training, evaluation, or inference.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of a role with permission to access the
  /// data source being used to create the machine learning model.
  ///
  /// Parameter [serverSideKmsKeyId] :
  /// Provides the identifier of the KMS key used to encrypt model data by
  /// Amazon Lookout for Equipment.
  ///
  /// Parameter [tags] :
  /// Any tags associated with the machine learning model being created.
  ///
  /// Parameter [trainingDataEndTime] :
  /// Indicates the time reference in the dataset that should be used to end the
  /// subset of training data for the machine learning model.
  ///
  /// Parameter [trainingDataStartTime] :
  /// Indicates the time reference in the dataset that should be used to begin
  /// the subset of training data for the machine learning model.
  Future<CreateModelResponse> createModel({
    required String datasetName,
    required String modelName,
    String? clientToken,
    DataPreProcessingConfiguration? dataPreProcessingConfiguration,
    DatasetSchema? datasetSchema,
    DateTime? evaluationDataEndTime,
    DateTime? evaluationDataStartTime,
    LabelsInputConfiguration? labelsInputConfiguration,
    ModelDiagnosticsOutputConfiguration? modelDiagnosticsOutputConfiguration,
    String? offCondition,
    String? roleArn,
    String? serverSideKmsKeyId,
    List<Tag>? tags,
    DateTime? trainingDataEndTime,
    DateTime? trainingDataStartTime,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSLookoutEquipmentFrontendService.CreateModel'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatasetName': datasetName,
        'ModelName': modelName,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (dataPreProcessingConfiguration != null)
          'DataPreProcessingConfiguration': dataPreProcessingConfiguration,
        if (datasetSchema != null) 'DatasetSchema': datasetSchema,
        if (evaluationDataEndTime != null)
          'EvaluationDataEndTime': unixTimestampToJson(evaluationDataEndTime),
        if (evaluationDataStartTime != null)
          'EvaluationDataStartTime':
              unixTimestampToJson(evaluationDataStartTime),
        if (labelsInputConfiguration != null)
          'LabelsInputConfiguration': labelsInputConfiguration,
        if (modelDiagnosticsOutputConfiguration != null)
          'ModelDiagnosticsOutputConfiguration':
              modelDiagnosticsOutputConfiguration,
        if (offCondition != null) 'OffCondition': offCondition,
        if (roleArn != null) 'RoleArn': roleArn,
        if (serverSideKmsKeyId != null)
          'ServerSideKmsKeyId': serverSideKmsKeyId,
        if (tags != null) 'Tags': tags,
        if (trainingDataEndTime != null)
          'TrainingDataEndTime': unixTimestampToJson(trainingDataEndTime),
        if (trainingDataStartTime != null)
          'TrainingDataStartTime': unixTimestampToJson(trainingDataStartTime),
      },
    );

    return CreateModelResponse.fromJson(jsonResponse.body);
  }

  /// Creates a retraining scheduler on the specified model.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [lookbackWindow] :
  /// The number of past days of data that will be used for retraining.
  ///
  /// Parameter [modelName] :
  /// The name of the model to add the retraining scheduler to.
  ///
  /// Parameter [retrainingFrequency] :
  /// This parameter uses the <a
  /// href="https://en.wikipedia.org/wiki/ISO_8601#Durations">ISO 8601</a>
  /// standard to set the frequency at which you want retraining to occur in
  /// terms of Years, Months, and/or Days (note: other parameters like Time are
  /// not currently supported). The minimum value is 30 days (P30D) and the
  /// maximum value is 1 year (P1Y). For example, the following values are
  /// valid:
  ///
  /// <ul>
  /// <li>
  /// P3M15D – Every 3 months and 15 days
  /// </li>
  /// <li>
  /// P2M – Every 2 months
  /// </li>
  /// <li>
  /// P150D – Every 150 days
  /// </li>
  /// </ul>
  ///
  /// Parameter [clientToken] :
  /// A unique identifier for the request. If you do not set the client request
  /// token, Amazon Lookout for Equipment generates one.
  ///
  /// Parameter [promoteMode] :
  /// Indicates how the service will use new models. In <code>MANAGED</code>
  /// mode, new models will automatically be used for inference if they have
  /// better performance than the current model. In <code>MANUAL</code> mode,
  /// the new models will not be used <a
  /// href="https://docs.aws.amazon.com/lookout-for-equipment/latest/ug/versioning-model.html#model-activation">until
  /// they are manually activated</a>.
  ///
  /// Parameter [retrainingStartDate] :
  /// The start date for the retraining scheduler. Lookout for Equipment
  /// truncates the time you provide to the nearest UTC day.
  Future<CreateRetrainingSchedulerResponse> createRetrainingScheduler({
    required String lookbackWindow,
    required String modelName,
    required String retrainingFrequency,
    String? clientToken,
    ModelPromoteMode? promoteMode,
    DateTime? retrainingStartDate,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSLookoutEquipmentFrontendService.CreateRetrainingScheduler'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LookbackWindow': lookbackWindow,
        'ModelName': modelName,
        'RetrainingFrequency': retrainingFrequency,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (promoteMode != null) 'PromoteMode': promoteMode.toValue(),
        if (retrainingStartDate != null)
          'RetrainingStartDate': unixTimestampToJson(retrainingStartDate),
      },
    );

    return CreateRetrainingSchedulerResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a dataset and associated artifacts. The operation will check to
  /// see if any inference scheduler or data ingestion job is currently using
  /// the dataset, and if there isn't, the dataset, its metadata, and any
  /// associated data stored in S3 will be deleted. This does not affect any
  /// models that used this dataset for training and evaluation, but does
  /// prevent it from being used in the future.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  ///
  /// Parameter [datasetName] :
  /// The name of the dataset to be deleted.
  Future<void> deleteDataset({
    required String datasetName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSLookoutEquipmentFrontendService.DeleteDataset'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatasetName': datasetName,
      },
    );
  }

  /// Deletes an inference scheduler that has been set up. Prior inference
  /// results will not be deleted.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [inferenceSchedulerName] :
  /// The name of the inference scheduler to be deleted.
  Future<void> deleteInferenceScheduler({
    required String inferenceSchedulerName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSLookoutEquipmentFrontendService.DeleteInferenceScheduler'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InferenceSchedulerName': inferenceSchedulerName,
      },
    );
  }

  /// Deletes a label.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  ///
  /// Parameter [labelGroupName] :
  /// The name of the label group that contains the label that you want to
  /// delete. Data in this field will be retained for service usage. Follow best
  /// practices for the security of your data.
  ///
  /// Parameter [labelId] :
  /// The ID of the label that you want to delete.
  Future<void> deleteLabel({
    required String labelGroupName,
    required String labelId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSLookoutEquipmentFrontendService.DeleteLabel'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LabelGroupName': labelGroupName,
        'LabelId': labelId,
      },
    );
  }

  /// Deletes a group of labels.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  ///
  /// Parameter [labelGroupName] :
  /// The name of the label group that you want to delete. Data in this field
  /// will be retained for service usage. Follow best practices for the security
  /// of your data.
  Future<void> deleteLabelGroup({
    required String labelGroupName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSLookoutEquipmentFrontendService.DeleteLabelGroup'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LabelGroupName': labelGroupName,
      },
    );
  }

  /// Deletes a machine learning model currently available for Amazon Lookout
  /// for Equipment. This will prevent it from being used with an inference
  /// scheduler, even one that is already set up.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [modelName] :
  /// The name of the machine learning model to be deleted.
  Future<void> deleteModel({
    required String modelName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSLookoutEquipmentFrontendService.DeleteModel'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ModelName': modelName,
      },
    );
  }

  /// Deletes the resource policy attached to the resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource for which the resource
  /// policy should be deleted.
  Future<void> deleteResourcePolicy({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSLookoutEquipmentFrontendService.DeleteResourcePolicy'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
      },
    );
  }

  /// Deletes a retraining scheduler from a model. The retraining scheduler must
  /// be in the <code>STOPPED</code> status.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [modelName] :
  /// The name of the model whose retraining scheduler you want to delete.
  Future<void> deleteRetrainingScheduler({
    required String modelName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSLookoutEquipmentFrontendService.DeleteRetrainingScheduler'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ModelName': modelName,
      },
    );
  }

  /// Provides information on a specific data ingestion job such as creation
  /// time, dataset ARN, and status.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [jobId] :
  /// The job ID of the data ingestion job.
  Future<DescribeDataIngestionJobResponse> describeDataIngestionJob({
    required String jobId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSLookoutEquipmentFrontendService.DescribeDataIngestionJob'
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

    return DescribeDataIngestionJobResponse.fromJson(jsonResponse.body);
  }

  /// Provides a JSON description of the data in each time series dataset,
  /// including names, column names, and data types.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [datasetName] :
  /// The name of the dataset to be described.
  Future<DescribeDatasetResponse> describeDataset({
    required String datasetName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSLookoutEquipmentFrontendService.DescribeDataset'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatasetName': datasetName,
      },
    );

    return DescribeDatasetResponse.fromJson(jsonResponse.body);
  }

  /// Specifies information about the inference scheduler being used, including
  /// name, model, status, and associated metadata
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [inferenceSchedulerName] :
  /// The name of the inference scheduler being described.
  Future<DescribeInferenceSchedulerResponse> describeInferenceScheduler({
    required String inferenceSchedulerName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSLookoutEquipmentFrontendService.DescribeInferenceScheduler'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InferenceSchedulerName': inferenceSchedulerName,
      },
    );

    return DescribeInferenceSchedulerResponse.fromJson(jsonResponse.body);
  }

  /// Returns the name of the label.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [labelGroupName] :
  /// Returns the name of the group containing the label.
  ///
  /// Parameter [labelId] :
  /// Returns the ID of the label.
  Future<DescribeLabelResponse> describeLabel({
    required String labelGroupName,
    required String labelId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSLookoutEquipmentFrontendService.DescribeLabel'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LabelGroupName': labelGroupName,
        'LabelId': labelId,
      },
    );

    return DescribeLabelResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about the label group.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [labelGroupName] :
  /// Returns the name of the label group.
  Future<DescribeLabelGroupResponse> describeLabelGroup({
    required String labelGroupName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSLookoutEquipmentFrontendService.DescribeLabelGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LabelGroupName': labelGroupName,
      },
    );

    return DescribeLabelGroupResponse.fromJson(jsonResponse.body);
  }

  /// Provides a JSON containing the overall information about a specific
  /// machine learning model, including model name and ARN, dataset, training
  /// and evaluation information, status, and so on.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [modelName] :
  /// The name of the machine learning model to be described.
  Future<DescribeModelResponse> describeModel({
    required String modelName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSLookoutEquipmentFrontendService.DescribeModel'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ModelName': modelName,
      },
    );

    return DescribeModelResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves information about a specific machine learning model version.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [modelName] :
  /// The name of the machine learning model that this version belongs to.
  ///
  /// Parameter [modelVersion] :
  /// The version of the machine learning model.
  Future<DescribeModelVersionResponse> describeModelVersion({
    required String modelName,
    required int modelVersion,
  }) async {
    _s.validateNumRange(
      'modelVersion',
      modelVersion,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSLookoutEquipmentFrontendService.DescribeModelVersion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ModelName': modelName,
        'ModelVersion': modelVersion,
      },
    );

    return DescribeModelVersionResponse.fromJson(jsonResponse.body);
  }

  /// Provides the details of a resource policy attached to a resource.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource that is associated with the
  /// resource policy.
  Future<DescribeResourcePolicyResponse> describeResourcePolicy({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSLookoutEquipmentFrontendService.DescribeResourcePolicy'
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

    return DescribeResourcePolicyResponse.fromJson(jsonResponse.body);
  }

  /// Provides a description of the retraining scheduler, including information
  /// such as the model name and retraining parameters.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [modelName] :
  /// The name of the model that the retraining scheduler is attached to.
  Future<DescribeRetrainingSchedulerResponse> describeRetrainingScheduler({
    required String modelName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSLookoutEquipmentFrontendService.DescribeRetrainingScheduler'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ModelName': modelName,
      },
    );

    return DescribeRetrainingSchedulerResponse.fromJson(jsonResponse.body);
  }

  /// Imports a dataset.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [sourceDatasetArn] :
  /// The Amazon Resource Name (ARN) of the dataset to import.
  ///
  /// Parameter [clientToken] :
  /// A unique identifier for the request. If you do not set the client request
  /// token, Amazon Lookout for Equipment generates one.
  ///
  /// Parameter [datasetName] :
  /// The name of the machine learning dataset to be created. If the dataset
  /// already exists, Amazon Lookout for Equipment overwrites the existing
  /// dataset. If you don't specify this field, it is filled with the name of
  /// the source dataset.
  ///
  /// Parameter [serverSideKmsKeyId] :
  /// Provides the identifier of the KMS key key used to encrypt model data by
  /// Amazon Lookout for Equipment.
  ///
  /// Parameter [tags] :
  /// Any tags associated with the dataset to be created.
  Future<ImportDatasetResponse> importDataset({
    required String sourceDatasetArn,
    String? clientToken,
    String? datasetName,
    String? serverSideKmsKeyId,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSLookoutEquipmentFrontendService.ImportDataset'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SourceDatasetArn': sourceDatasetArn,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (datasetName != null) 'DatasetName': datasetName,
        if (serverSideKmsKeyId != null)
          'ServerSideKmsKeyId': serverSideKmsKeyId,
        if (tags != null) 'Tags': tags,
      },
    );

    return ImportDatasetResponse.fromJson(jsonResponse.body);
  }

  /// Imports a model that has been trained successfully.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [datasetName] :
  /// The name of the dataset for the machine learning model being imported.
  ///
  /// Parameter [sourceModelVersionArn] :
  /// The Amazon Resource Name (ARN) of the model version to import.
  ///
  /// Parameter [clientToken] :
  /// A unique identifier for the request. If you do not set the client request
  /// token, Amazon Lookout for Equipment generates one.
  ///
  /// Parameter [inferenceDataImportStrategy] :
  /// Indicates how to import the accumulated inference data when a model
  /// version is imported. The possible values are as follows:
  ///
  /// <ul>
  /// <li>
  /// NO_IMPORT – Don't import the data.
  /// </li>
  /// <li>
  /// ADD_WHEN_EMPTY – Only import the data from the source model if there is no
  /// existing data in the target model.
  /// </li>
  /// <li>
  /// OVERWRITE – Import the data from the source model and overwrite the
  /// existing data in the target model.
  /// </li>
  /// </ul>
  ///
  /// Parameter [modelName] :
  /// The name for the machine learning model to be created. If the model
  /// already exists, Amazon Lookout for Equipment creates a new version. If you
  /// do not specify this field, it is filled with the name of the source model.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of a role with permission to access the
  /// data source being used to create the machine learning model.
  ///
  /// Parameter [serverSideKmsKeyId] :
  /// Provides the identifier of the KMS key key used to encrypt model data by
  /// Amazon Lookout for Equipment.
  ///
  /// Parameter [tags] :
  /// The tags associated with the machine learning model to be created.
  Future<ImportModelVersionResponse> importModelVersion({
    required String datasetName,
    required String sourceModelVersionArn,
    String? clientToken,
    InferenceDataImportStrategy? inferenceDataImportStrategy,
    LabelsInputConfiguration? labelsInputConfiguration,
    String? modelName,
    String? roleArn,
    String? serverSideKmsKeyId,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSLookoutEquipmentFrontendService.ImportModelVersion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatasetName': datasetName,
        'SourceModelVersionArn': sourceModelVersionArn,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (inferenceDataImportStrategy != null)
          'InferenceDataImportStrategy': inferenceDataImportStrategy.toValue(),
        if (labelsInputConfiguration != null)
          'LabelsInputConfiguration': labelsInputConfiguration,
        if (modelName != null) 'ModelName': modelName,
        if (roleArn != null) 'RoleArn': roleArn,
        if (serverSideKmsKeyId != null)
          'ServerSideKmsKeyId': serverSideKmsKeyId,
        if (tags != null) 'Tags': tags,
      },
    );

    return ImportModelVersionResponse.fromJson(jsonResponse.body);
  }

  /// Provides a list of all data ingestion jobs, including dataset name and
  /// ARN, S3 location of the input data, status, and so on.
  ///
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [datasetName] :
  /// The name of the dataset being used for the data ingestion job.
  ///
  /// Parameter [maxResults] :
  /// Specifies the maximum number of data ingestion jobs to list.
  ///
  /// Parameter [nextToken] :
  /// An opaque pagination token indicating where to continue the listing of
  /// data ingestion jobs.
  ///
  /// Parameter [status] :
  /// Indicates the status of the data ingestion job.
  Future<ListDataIngestionJobsResponse> listDataIngestionJobs({
    String? datasetName,
    int? maxResults,
    String? nextToken,
    IngestionJobStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSLookoutEquipmentFrontendService.ListDataIngestionJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (datasetName != null) 'DatasetName': datasetName,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (status != null) 'Status': status.toValue(),
      },
    );

    return ListDataIngestionJobsResponse.fromJson(jsonResponse.body);
  }

  /// Lists all datasets currently available in your account, filtering on the
  /// dataset name.
  ///
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [datasetNameBeginsWith] :
  /// The beginning of the name of the datasets to be listed.
  ///
  /// Parameter [maxResults] :
  /// Specifies the maximum number of datasets to list.
  ///
  /// Parameter [nextToken] :
  /// An opaque pagination token indicating where to continue the listing of
  /// datasets.
  Future<ListDatasetsResponse> listDatasets({
    String? datasetNameBeginsWith,
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
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSLookoutEquipmentFrontendService.ListDatasets'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (datasetNameBeginsWith != null)
          'DatasetNameBeginsWith': datasetNameBeginsWith,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListDatasetsResponse.fromJson(jsonResponse.body);
  }

  /// Lists all inference events that have been found for the specified
  /// inference scheduler.
  ///
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [inferenceSchedulerName] :
  /// The name of the inference scheduler for the inference events listed.
  ///
  /// Parameter [intervalEndTime] :
  /// Returns all the inference events with an end start time equal to or
  /// greater than less than the end time given.
  ///
  /// Parameter [intervalStartTime] :
  /// Lookout for Equipment will return all the inference events with an end
  /// time equal to or greater than the start time given.
  ///
  /// Parameter [maxResults] :
  /// Specifies the maximum number of inference events to list.
  ///
  /// Parameter [nextToken] :
  /// An opaque pagination token indicating where to continue the listing of
  /// inference events.
  Future<ListInferenceEventsResponse> listInferenceEvents({
    required String inferenceSchedulerName,
    required DateTime intervalEndTime,
    required DateTime intervalStartTime,
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
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSLookoutEquipmentFrontendService.ListInferenceEvents'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InferenceSchedulerName': inferenceSchedulerName,
        'IntervalEndTime': unixTimestampToJson(intervalEndTime),
        'IntervalStartTime': unixTimestampToJson(intervalStartTime),
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListInferenceEventsResponse.fromJson(jsonResponse.body);
  }

  /// Lists all inference executions that have been performed by the specified
  /// inference scheduler.
  ///
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [inferenceSchedulerName] :
  /// The name of the inference scheduler for the inference execution listed.
  ///
  /// Parameter [dataEndTimeBefore] :
  /// The time reference in the inferenced dataset before which Amazon Lookout
  /// for Equipment stopped the inference execution.
  ///
  /// Parameter [dataStartTimeAfter] :
  /// The time reference in the inferenced dataset after which Amazon Lookout
  /// for Equipment started the inference execution.
  ///
  /// Parameter [maxResults] :
  /// Specifies the maximum number of inference executions to list.
  ///
  /// Parameter [nextToken] :
  /// An opaque pagination token indicating where to continue the listing of
  /// inference executions.
  ///
  /// Parameter [status] :
  /// The status of the inference execution.
  Future<ListInferenceExecutionsResponse> listInferenceExecutions({
    required String inferenceSchedulerName,
    DateTime? dataEndTimeBefore,
    DateTime? dataStartTimeAfter,
    int? maxResults,
    String? nextToken,
    InferenceExecutionStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSLookoutEquipmentFrontendService.ListInferenceExecutions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InferenceSchedulerName': inferenceSchedulerName,
        if (dataEndTimeBefore != null)
          'DataEndTimeBefore': unixTimestampToJson(dataEndTimeBefore),
        if (dataStartTimeAfter != null)
          'DataStartTimeAfter': unixTimestampToJson(dataStartTimeAfter),
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (status != null) 'Status': status.toValue(),
      },
    );

    return ListInferenceExecutionsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves a list of all inference schedulers currently available for your
  /// account.
  ///
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [inferenceSchedulerNameBeginsWith] :
  /// The beginning of the name of the inference schedulers to be listed.
  ///
  /// Parameter [maxResults] :
  /// Specifies the maximum number of inference schedulers to list.
  ///
  /// Parameter [modelName] :
  /// The name of the machine learning model used by the inference scheduler to
  /// be listed.
  ///
  /// Parameter [nextToken] :
  /// An opaque pagination token indicating where to continue the listing of
  /// inference schedulers.
  ///
  /// Parameter [status] :
  /// Specifies the current status of the inference schedulers.
  Future<ListInferenceSchedulersResponse> listInferenceSchedulers({
    String? inferenceSchedulerNameBeginsWith,
    int? maxResults,
    String? modelName,
    String? nextToken,
    InferenceSchedulerStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSLookoutEquipmentFrontendService.ListInferenceSchedulers'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (inferenceSchedulerNameBeginsWith != null)
          'InferenceSchedulerNameBeginsWith': inferenceSchedulerNameBeginsWith,
        if (maxResults != null) 'MaxResults': maxResults,
        if (modelName != null) 'ModelName': modelName,
        if (nextToken != null) 'NextToken': nextToken,
        if (status != null) 'Status': status.toValue(),
      },
    );

    return ListInferenceSchedulersResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of the label groups.
  ///
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [labelGroupNameBeginsWith] :
  /// The beginning of the name of the label groups to be listed.
  ///
  /// Parameter [maxResults] :
  /// Specifies the maximum number of label groups to list.
  ///
  /// Parameter [nextToken] :
  /// An opaque pagination token indicating where to continue the listing of
  /// label groups.
  Future<ListLabelGroupsResponse> listLabelGroups({
    String? labelGroupNameBeginsWith,
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
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSLookoutEquipmentFrontendService.ListLabelGroups'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (labelGroupNameBeginsWith != null)
          'LabelGroupNameBeginsWith': labelGroupNameBeginsWith,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListLabelGroupsResponse.fromJson(jsonResponse.body);
  }

  /// Provides a list of labels.
  ///
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [labelGroupName] :
  /// Returns the name of the label group.
  ///
  /// Parameter [equipment] :
  /// Lists the labels that pertain to a particular piece of equipment.
  ///
  /// Parameter [faultCode] :
  /// Returns labels with a particular fault code.
  ///
  /// Parameter [intervalEndTime] :
  /// Returns all labels with a start time earlier than the end time given.
  ///
  /// Parameter [intervalStartTime] :
  /// Returns all the labels with a end time equal to or later than the start
  /// time given.
  ///
  /// Parameter [maxResults] :
  /// Specifies the maximum number of labels to list.
  ///
  /// Parameter [nextToken] :
  /// An opaque pagination token indicating where to continue the listing of
  /// label groups.
  Future<ListLabelsResponse> listLabels({
    required String labelGroupName,
    String? equipment,
    String? faultCode,
    DateTime? intervalEndTime,
    DateTime? intervalStartTime,
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
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSLookoutEquipmentFrontendService.ListLabels'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LabelGroupName': labelGroupName,
        if (equipment != null) 'Equipment': equipment,
        if (faultCode != null) 'FaultCode': faultCode,
        if (intervalEndTime != null)
          'IntervalEndTime': unixTimestampToJson(intervalEndTime),
        if (intervalStartTime != null)
          'IntervalStartTime': unixTimestampToJson(intervalStartTime),
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListLabelsResponse.fromJson(jsonResponse.body);
  }

  /// Generates a list of all model versions for a given model, including the
  /// model version, model version ARN, and status. To list a subset of
  /// versions, use the <code>MaxModelVersion</code> and
  /// <code>MinModelVersion</code> fields.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [modelName] :
  /// Then name of the machine learning model for which the model versions are
  /// to be listed.
  ///
  /// Parameter [createdAtEndTime] :
  /// Filter results to return all the model versions created before this time.
  ///
  /// Parameter [createdAtStartTime] :
  /// Filter results to return all the model versions created after this time.
  ///
  /// Parameter [maxModelVersion] :
  /// Specifies the highest version of the model to return in the list.
  ///
  /// Parameter [maxResults] :
  /// Specifies the maximum number of machine learning model versions to list.
  ///
  /// Parameter [minModelVersion] :
  /// Specifies the lowest version of the model to return in the list.
  ///
  /// Parameter [nextToken] :
  /// If the total number of results exceeds the limit that the response can
  /// display, the response returns an opaque pagination token indicating where
  /// to continue the listing of machine learning model versions. Use this token
  /// in the <code>NextToken</code> field in the request to list the next page
  /// of results.
  ///
  /// Parameter [sourceType] :
  /// Filter the results based on the way the model version was generated.
  ///
  /// Parameter [status] :
  /// Filter the results based on the current status of the model version.
  Future<ListModelVersionsResponse> listModelVersions({
    required String modelName,
    DateTime? createdAtEndTime,
    DateTime? createdAtStartTime,
    int? maxModelVersion,
    int? maxResults,
    int? minModelVersion,
    String? nextToken,
    ModelVersionSourceType? sourceType,
    ModelVersionStatus? status,
  }) async {
    _s.validateNumRange(
      'maxModelVersion',
      maxModelVersion,
      1,
      1152921504606846976,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    _s.validateNumRange(
      'minModelVersion',
      minModelVersion,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSLookoutEquipmentFrontendService.ListModelVersions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ModelName': modelName,
        if (createdAtEndTime != null)
          'CreatedAtEndTime': unixTimestampToJson(createdAtEndTime),
        if (createdAtStartTime != null)
          'CreatedAtStartTime': unixTimestampToJson(createdAtStartTime),
        if (maxModelVersion != null) 'MaxModelVersion': maxModelVersion,
        if (maxResults != null) 'MaxResults': maxResults,
        if (minModelVersion != null) 'MinModelVersion': minModelVersion,
        if (nextToken != null) 'NextToken': nextToken,
        if (sourceType != null) 'SourceType': sourceType.toValue(),
        if (status != null) 'Status': status.toValue(),
      },
    );

    return ListModelVersionsResponse.fromJson(jsonResponse.body);
  }

  /// Generates a list of all models in the account, including model name and
  /// ARN, dataset, and status.
  ///
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [datasetNameBeginsWith] :
  /// The beginning of the name of the dataset of the machine learning models to
  /// be listed.
  ///
  /// Parameter [maxResults] :
  /// Specifies the maximum number of machine learning models to list.
  ///
  /// Parameter [modelNameBeginsWith] :
  /// The beginning of the name of the machine learning models being listed.
  ///
  /// Parameter [nextToken] :
  /// An opaque pagination token indicating where to continue the listing of
  /// machine learning models.
  ///
  /// Parameter [status] :
  /// The status of the machine learning model.
  Future<ListModelsResponse> listModels({
    String? datasetNameBeginsWith,
    int? maxResults,
    String? modelNameBeginsWith,
    String? nextToken,
    ModelStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSLookoutEquipmentFrontendService.ListModels'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (datasetNameBeginsWith != null)
          'DatasetNameBeginsWith': datasetNameBeginsWith,
        if (maxResults != null) 'MaxResults': maxResults,
        if (modelNameBeginsWith != null)
          'ModelNameBeginsWith': modelNameBeginsWith,
        if (nextToken != null) 'NextToken': nextToken,
        if (status != null) 'Status': status.toValue(),
      },
    );

    return ListModelsResponse.fromJson(jsonResponse.body);
  }

  /// Lists all retraining schedulers in your account, filtering by model name
  /// prefix and status.
  ///
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// Specifies the maximum number of retraining schedulers to list.
  ///
  /// Parameter [modelNameBeginsWith] :
  /// Specify this field to only list retraining schedulers whose machine
  /// learning models begin with the value you specify.
  ///
  /// Parameter [nextToken] :
  /// If the number of results exceeds the maximum, a pagination token is
  /// returned. Use the token in the request to show the next page of retraining
  /// schedulers.
  ///
  /// Parameter [status] :
  /// Specify this field to only list retraining schedulers whose status matches
  /// the value you specify.
  Future<ListRetrainingSchedulersResponse> listRetrainingSchedulers({
    int? maxResults,
    String? modelNameBeginsWith,
    String? nextToken,
    RetrainingSchedulerStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSLookoutEquipmentFrontendService.ListRetrainingSchedulers'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (modelNameBeginsWith != null)
          'ModelNameBeginsWith': modelNameBeginsWith,
        if (nextToken != null) 'NextToken': nextToken,
        if (status != null) 'Status': status.toValue(),
      },
    );

    return ListRetrainingSchedulersResponse.fromJson(jsonResponse.body);
  }

  /// Lists statistics about the data collected for each of the sensors that
  /// have been successfully ingested in the particular dataset. Can also be
  /// used to retreive Sensor Statistics for a previous ingestion job.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [datasetName] :
  /// The name of the dataset associated with the list of Sensor Statistics.
  ///
  /// Parameter [ingestionJobId] :
  /// The ingestion job id associated with the list of Sensor Statistics. To get
  /// sensor statistics for a particular ingestion job id, both dataset name and
  /// ingestion job id must be submitted as inputs.
  ///
  /// Parameter [maxResults] :
  /// Specifies the maximum number of sensors for which to retrieve statistics.
  ///
  /// Parameter [nextToken] :
  /// An opaque pagination token indicating where to continue the listing of
  /// sensor statistics.
  Future<ListSensorStatisticsResponse> listSensorStatistics({
    required String datasetName,
    String? ingestionJobId,
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
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSLookoutEquipmentFrontendService.ListSensorStatistics'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatasetName': datasetName,
        if (ingestionJobId != null) 'IngestionJobId': ingestionJobId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListSensorStatisticsResponse.fromJson(jsonResponse.body);
  }

  /// Lists all the tags for a specified resource, including key and value.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource (such as the dataset or
  /// model) that is the focus of the <code>ListTagsForResource</code>
  /// operation.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSLookoutEquipmentFrontendService.ListTagsForResource'
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

  /// Creates a resource control policy for a given resource.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource for which the policy is
  /// being created.
  ///
  /// Parameter [resourcePolicy] :
  /// The JSON-formatted resource policy to create.
  ///
  /// Parameter [clientToken] :
  /// A unique identifier for the request. If you do not set the client request
  /// token, Amazon Lookout for Equipment generates one.
  ///
  /// Parameter [policyRevisionId] :
  /// A unique identifier for a revision of the resource policy.
  Future<PutResourcePolicyResponse> putResourcePolicy({
    required String resourceArn,
    required String resourcePolicy,
    String? clientToken,
    String? policyRevisionId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSLookoutEquipmentFrontendService.PutResourcePolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'ResourcePolicy': resourcePolicy,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (policyRevisionId != null) 'PolicyRevisionId': policyRevisionId,
      },
    );

    return PutResourcePolicyResponse.fromJson(jsonResponse.body);
  }

  /// Starts a data ingestion job. Amazon Lookout for Equipment returns the job
  /// status.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [datasetName] :
  /// The name of the dataset being used by the data ingestion job.
  ///
  /// Parameter [ingestionInputConfiguration] :
  /// Specifies information for the input data for the data ingestion job,
  /// including dataset S3 location.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of a role with permission to access the
  /// data source for the data ingestion job.
  ///
  /// Parameter [clientToken] :
  /// A unique identifier for the request. If you do not set the client request
  /// token, Amazon Lookout for Equipment generates one.
  Future<StartDataIngestionJobResponse> startDataIngestionJob({
    required String datasetName,
    required IngestionInputConfiguration ingestionInputConfiguration,
    required String roleArn,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSLookoutEquipmentFrontendService.StartDataIngestionJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatasetName': datasetName,
        'IngestionInputConfiguration': ingestionInputConfiguration,
        'RoleArn': roleArn,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );

    return StartDataIngestionJobResponse.fromJson(jsonResponse.body);
  }

  /// Starts an inference scheduler.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [inferenceSchedulerName] :
  /// The name of the inference scheduler to be started.
  Future<StartInferenceSchedulerResponse> startInferenceScheduler({
    required String inferenceSchedulerName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSLookoutEquipmentFrontendService.StartInferenceScheduler'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InferenceSchedulerName': inferenceSchedulerName,
      },
    );

    return StartInferenceSchedulerResponse.fromJson(jsonResponse.body);
  }

  /// Starts a retraining scheduler.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [modelName] :
  /// The name of the model whose retraining scheduler you want to start.
  Future<StartRetrainingSchedulerResponse> startRetrainingScheduler({
    required String modelName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSLookoutEquipmentFrontendService.StartRetrainingScheduler'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ModelName': modelName,
      },
    );

    return StartRetrainingSchedulerResponse.fromJson(jsonResponse.body);
  }

  /// Stops an inference scheduler.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [inferenceSchedulerName] :
  /// The name of the inference scheduler to be stopped.
  Future<StopInferenceSchedulerResponse> stopInferenceScheduler({
    required String inferenceSchedulerName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSLookoutEquipmentFrontendService.StopInferenceScheduler'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InferenceSchedulerName': inferenceSchedulerName,
      },
    );

    return StopInferenceSchedulerResponse.fromJson(jsonResponse.body);
  }

  /// Stops a retraining scheduler.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [modelName] :
  /// The name of the model whose retraining scheduler you want to stop.
  Future<StopRetrainingSchedulerResponse> stopRetrainingScheduler({
    required String modelName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSLookoutEquipmentFrontendService.StopRetrainingScheduler'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ModelName': modelName,
      },
    );

    return StopRetrainingSchedulerResponse.fromJson(jsonResponse.body);
  }

  /// Associates a given tag to a resource in your account. A tag is a key-value
  /// pair which can be added to an Amazon Lookout for Equipment resource as
  /// metadata. Tags can be used for organizing your resources as well as
  /// helping you to search and filter by tag. Multiple tags can be added to a
  /// resource, either when you create it, or later. Up to 50 tags can be
  /// associated with each resource.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the specific resource to which the tag
  /// should be associated.
  ///
  /// Parameter [tags] :
  /// The tag or tags to be associated with a specific resource. Both the tag
  /// key and value are specified.
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSLookoutEquipmentFrontendService.TagResource'
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

  /// Removes a specific tag from a given resource. The tag is specified by its
  /// key.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to which the tag is
  /// currently associated.
  ///
  /// Parameter [tagKeys] :
  /// Specifies the key of the tag to be removed from a specified resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSLookoutEquipmentFrontendService.UntagResource'
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

  /// Sets the active model version for a given machine learning model.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  ///
  /// Parameter [modelName] :
  /// The name of the machine learning model for which the active model version
  /// is being set.
  ///
  /// Parameter [modelVersion] :
  /// The version of the machine learning model for which the active model
  /// version is being set.
  Future<UpdateActiveModelVersionResponse> updateActiveModelVersion({
    required String modelName,
    required int modelVersion,
  }) async {
    _s.validateNumRange(
      'modelVersion',
      modelVersion,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSLookoutEquipmentFrontendService.UpdateActiveModelVersion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ModelName': modelName,
        'ModelVersion': modelVersion,
      },
    );

    return UpdateActiveModelVersionResponse.fromJson(jsonResponse.body);
  }

  /// Updates an inference scheduler.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [inferenceSchedulerName] :
  /// The name of the inference scheduler to be updated.
  ///
  /// Parameter [dataDelayOffsetInMinutes] :
  /// A period of time (in minutes) by which inference on the data is delayed
  /// after the data starts. For instance, if you select an offset delay time of
  /// five minutes, inference will not begin on the data until the first data
  /// measurement after the five minute mark. For example, if five minutes is
  /// selected, the inference scheduler will wake up at the configured frequency
  /// with the additional five minute delay time to check the customer S3
  /// bucket. The customer can upload data at the same frequency and they don't
  /// need to stop and restart the scheduler when uploading new data.
  ///
  /// Parameter [dataInputConfiguration] :
  /// Specifies information for the input data for the inference scheduler,
  /// including delimiter, format, and dataset location.
  ///
  /// Parameter [dataOutputConfiguration] :
  /// Specifies information for the output results from the inference scheduler,
  /// including the output S3 location.
  ///
  /// Parameter [dataUploadFrequency] :
  /// How often data is uploaded to the source S3 bucket for the input data. The
  /// value chosen is the length of time between data uploads. For instance, if
  /// you select 5 minutes, Amazon Lookout for Equipment will upload the
  /// real-time data to the source bucket once every 5 minutes. This frequency
  /// also determines how often Amazon Lookout for Equipment starts a scheduled
  /// inference on your data. In this example, it starts once every 5 minutes.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of a role with permission to access the
  /// data source for the inference scheduler.
  Future<void> updateInferenceScheduler({
    required String inferenceSchedulerName,
    int? dataDelayOffsetInMinutes,
    InferenceInputConfiguration? dataInputConfiguration,
    InferenceOutputConfiguration? dataOutputConfiguration,
    DataUploadFrequency? dataUploadFrequency,
    String? roleArn,
  }) async {
    _s.validateNumRange(
      'dataDelayOffsetInMinutes',
      dataDelayOffsetInMinutes,
      0,
      60,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSLookoutEquipmentFrontendService.UpdateInferenceScheduler'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InferenceSchedulerName': inferenceSchedulerName,
        if (dataDelayOffsetInMinutes != null)
          'DataDelayOffsetInMinutes': dataDelayOffsetInMinutes,
        if (dataInputConfiguration != null)
          'DataInputConfiguration': dataInputConfiguration,
        if (dataOutputConfiguration != null)
          'DataOutputConfiguration': dataOutputConfiguration,
        if (dataUploadFrequency != null)
          'DataUploadFrequency': dataUploadFrequency.toValue(),
        if (roleArn != null) 'RoleArn': roleArn,
      },
    );
  }

  /// Updates the label group.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [labelGroupName] :
  /// The name of the label group to be updated.
  ///
  /// Parameter [faultCodes] :
  /// Updates the code indicating the type of anomaly associated with the label.
  ///
  /// Data in this field will be retained for service usage. Follow best
  /// practices for the security of your data.
  Future<void> updateLabelGroup({
    required String labelGroupName,
    List<String>? faultCodes,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSLookoutEquipmentFrontendService.UpdateLabelGroup'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LabelGroupName': labelGroupName,
        if (faultCodes != null) 'FaultCodes': faultCodes,
      },
    );
  }

  /// Updates a model in the account.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [modelName] :
  /// The name of the model to update.
  ///
  /// Parameter [modelDiagnosticsOutputConfiguration] :
  /// The Amazon S3 location where you want Amazon Lookout for Equipment to save
  /// the pointwise model diagnostics for the model. You must also specify the
  /// <code>RoleArn</code> request parameter.
  ///
  /// Parameter [roleArn] :
  /// The ARN of the model to update.
  Future<void> updateModel({
    required String modelName,
    LabelsInputConfiguration? labelsInputConfiguration,
    ModelDiagnosticsOutputConfiguration? modelDiagnosticsOutputConfiguration,
    String? roleArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSLookoutEquipmentFrontendService.UpdateModel'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ModelName': modelName,
        if (labelsInputConfiguration != null)
          'LabelsInputConfiguration': labelsInputConfiguration,
        if (modelDiagnosticsOutputConfiguration != null)
          'ModelDiagnosticsOutputConfiguration':
              modelDiagnosticsOutputConfiguration,
        if (roleArn != null) 'RoleArn': roleArn,
      },
    );
  }

  /// Updates a retraining scheduler.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [modelName] :
  /// The name of the model whose retraining scheduler you want to update.
  ///
  /// Parameter [lookbackWindow] :
  /// The number of past days of data that will be used for retraining.
  ///
  /// Parameter [promoteMode] :
  /// Indicates how the service will use new models. In <code>MANAGED</code>
  /// mode, new models will automatically be used for inference if they have
  /// better performance than the current model. In <code>MANUAL</code> mode,
  /// the new models will not be used <a
  /// href="https://docs.aws.amazon.com/lookout-for-equipment/latest/ug/versioning-model.html#model-activation">until
  /// they are manually activated</a>.
  ///
  /// Parameter [retrainingFrequency] :
  /// This parameter uses the <a
  /// href="https://en.wikipedia.org/wiki/ISO_8601#Durations">ISO 8601</a>
  /// standard to set the frequency at which you want retraining to occur in
  /// terms of Years, Months, and/or Days (note: other parameters like Time are
  /// not currently supported). The minimum value is 30 days (P30D) and the
  /// maximum value is 1 year (P1Y). For example, the following values are
  /// valid:
  ///
  /// <ul>
  /// <li>
  /// P3M15D – Every 3 months and 15 days
  /// </li>
  /// <li>
  /// P2M – Every 2 months
  /// </li>
  /// <li>
  /// P150D – Every 150 days
  /// </li>
  /// </ul>
  ///
  /// Parameter [retrainingStartDate] :
  /// The start date for the retraining scheduler. Lookout for Equipment
  /// truncates the time you provide to the nearest UTC day.
  Future<void> updateRetrainingScheduler({
    required String modelName,
    String? lookbackWindow,
    ModelPromoteMode? promoteMode,
    String? retrainingFrequency,
    DateTime? retrainingStartDate,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSLookoutEquipmentFrontendService.UpdateRetrainingScheduler'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ModelName': modelName,
        if (lookbackWindow != null) 'LookbackWindow': lookbackWindow,
        if (promoteMode != null) 'PromoteMode': promoteMode.toValue(),
        if (retrainingFrequency != null)
          'RetrainingFrequency': retrainingFrequency,
        if (retrainingStartDate != null)
          'RetrainingStartDate': unixTimestampToJson(retrainingStartDate),
      },
    );
  }
}

enum AutoPromotionResult {
  modelPromoted,
  modelNotPromoted,
  retrainingInternalError,
  retrainingCustomerError,
  retrainingCancelled,
}

extension AutoPromotionResultValueExtension on AutoPromotionResult {
  String toValue() {
    switch (this) {
      case AutoPromotionResult.modelPromoted:
        return 'MODEL_PROMOTED';
      case AutoPromotionResult.modelNotPromoted:
        return 'MODEL_NOT_PROMOTED';
      case AutoPromotionResult.retrainingInternalError:
        return 'RETRAINING_INTERNAL_ERROR';
      case AutoPromotionResult.retrainingCustomerError:
        return 'RETRAINING_CUSTOMER_ERROR';
      case AutoPromotionResult.retrainingCancelled:
        return 'RETRAINING_CANCELLED';
    }
  }
}

extension AutoPromotionResultFromString on String {
  AutoPromotionResult toAutoPromotionResult() {
    switch (this) {
      case 'MODEL_PROMOTED':
        return AutoPromotionResult.modelPromoted;
      case 'MODEL_NOT_PROMOTED':
        return AutoPromotionResult.modelNotPromoted;
      case 'RETRAINING_INTERNAL_ERROR':
        return AutoPromotionResult.retrainingInternalError;
      case 'RETRAINING_CUSTOMER_ERROR':
        return AutoPromotionResult.retrainingCustomerError;
      case 'RETRAINING_CANCELLED':
        return AutoPromotionResult.retrainingCancelled;
    }
    throw Exception('$this is not known in enum AutoPromotionResult');
  }
}

/// Entity that comprises information on categorical values in data.
class CategoricalValues {
  /// Indicates whether there is a potential data issue related to categorical
  /// values.
  final StatisticalIssueStatus status;

  /// Indicates the number of categories in the data.
  final int? numberOfCategory;

  CategoricalValues({
    required this.status,
    this.numberOfCategory,
  });

  factory CategoricalValues.fromJson(Map<String, dynamic> json) {
    return CategoricalValues(
      status: (json['Status'] as String).toStatisticalIssueStatus(),
      numberOfCategory: json['NumberOfCategory'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final numberOfCategory = this.numberOfCategory;
    return {
      'Status': status.toValue(),
      if (numberOfCategory != null) 'NumberOfCategory': numberOfCategory,
    };
  }
}

/// Entity that comprises information of count and percentage.
class CountPercent {
  /// Indicates the count of occurences of the given statistic.
  final int count;

  /// Indicates the percentage of occurances of the given statistic.
  final double percentage;

  CountPercent({
    required this.count,
    required this.percentage,
  });

  factory CountPercent.fromJson(Map<String, dynamic> json) {
    return CountPercent(
      count: json['Count'] as int,
      percentage: json['Percentage'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    final count = this.count;
    final percentage = this.percentage;
    return {
      'Count': count,
      'Percentage': percentage,
    };
  }
}

class CreateDatasetResponse {
  /// The Amazon Resource Name (ARN) of the dataset being created.
  final String? datasetArn;

  /// The name of the dataset being created.
  final String? datasetName;

  /// Indicates the status of the <code>CreateDataset</code> operation.
  final DatasetStatus? status;

  CreateDatasetResponse({
    this.datasetArn,
    this.datasetName,
    this.status,
  });

  factory CreateDatasetResponse.fromJson(Map<String, dynamic> json) {
    return CreateDatasetResponse(
      datasetArn: json['DatasetArn'] as String?,
      datasetName: json['DatasetName'] as String?,
      status: (json['Status'] as String?)?.toDatasetStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final datasetArn = this.datasetArn;
    final datasetName = this.datasetName;
    final status = this.status;
    return {
      if (datasetArn != null) 'DatasetArn': datasetArn,
      if (datasetName != null) 'DatasetName': datasetName,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

class CreateInferenceSchedulerResponse {
  /// The Amazon Resource Name (ARN) of the inference scheduler being created.
  final String? inferenceSchedulerArn;

  /// The name of inference scheduler being created.
  final String? inferenceSchedulerName;

  /// Provides a quality assessment for a model that uses labels. If Lookout for
  /// Equipment determines that the model quality is poor based on training
  /// metrics, the value is <code>POOR_QUALITY_DETECTED</code>. Otherwise, the
  /// value is <code>QUALITY_THRESHOLD_MET</code>.
  ///
  /// If the model is unlabeled, the model quality can't be assessed and the value
  /// of <code>ModelQuality</code> is <code>CANNOT_DETERMINE_QUALITY</code>. In
  /// this situation, you can get a model quality assessment by adding labels to
  /// the input dataset and retraining the model.
  ///
  /// For information about using labels with your models, see <a
  /// href="https://docs.aws.amazon.com/lookout-for-equipment/latest/ug/understanding-labeling.html">Understanding
  /// labeling</a>.
  ///
  /// For information about improving the quality of a model, see <a
  /// href="https://docs.aws.amazon.com/lookout-for-equipment/latest/ug/best-practices.html">Best
  /// practices with Amazon Lookout for Equipment</a>.
  final ModelQuality? modelQuality;

  /// Indicates the status of the <code>CreateInferenceScheduler</code> operation.
  final InferenceSchedulerStatus? status;

  CreateInferenceSchedulerResponse({
    this.inferenceSchedulerArn,
    this.inferenceSchedulerName,
    this.modelQuality,
    this.status,
  });

  factory CreateInferenceSchedulerResponse.fromJson(Map<String, dynamic> json) {
    return CreateInferenceSchedulerResponse(
      inferenceSchedulerArn: json['InferenceSchedulerArn'] as String?,
      inferenceSchedulerName: json['InferenceSchedulerName'] as String?,
      modelQuality: (json['ModelQuality'] as String?)?.toModelQuality(),
      status: (json['Status'] as String?)?.toInferenceSchedulerStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final inferenceSchedulerArn = this.inferenceSchedulerArn;
    final inferenceSchedulerName = this.inferenceSchedulerName;
    final modelQuality = this.modelQuality;
    final status = this.status;
    return {
      if (inferenceSchedulerArn != null)
        'InferenceSchedulerArn': inferenceSchedulerArn,
      if (inferenceSchedulerName != null)
        'InferenceSchedulerName': inferenceSchedulerName,
      if (modelQuality != null) 'ModelQuality': modelQuality.toValue(),
      if (status != null) 'Status': status.toValue(),
    };
  }
}

class CreateLabelGroupResponse {
  /// The Amazon Resource Name (ARN) of the label group that you have created.
  final String? labelGroupArn;

  /// The name of the label group that you have created. Data in this field will
  /// be retained for service usage. Follow best practices for the security of
  /// your data.
  final String? labelGroupName;

  CreateLabelGroupResponse({
    this.labelGroupArn,
    this.labelGroupName,
  });

  factory CreateLabelGroupResponse.fromJson(Map<String, dynamic> json) {
    return CreateLabelGroupResponse(
      labelGroupArn: json['LabelGroupArn'] as String?,
      labelGroupName: json['LabelGroupName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final labelGroupArn = this.labelGroupArn;
    final labelGroupName = this.labelGroupName;
    return {
      if (labelGroupArn != null) 'LabelGroupArn': labelGroupArn,
      if (labelGroupName != null) 'LabelGroupName': labelGroupName,
    };
  }
}

class CreateLabelResponse {
  /// The ID of the label that you have created.
  final String? labelId;

  CreateLabelResponse({
    this.labelId,
  });

  factory CreateLabelResponse.fromJson(Map<String, dynamic> json) {
    return CreateLabelResponse(
      labelId: json['LabelId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final labelId = this.labelId;
    return {
      if (labelId != null) 'LabelId': labelId,
    };
  }
}

class CreateModelResponse {
  /// The Amazon Resource Name (ARN) of the model being created.
  final String? modelArn;

  /// Indicates the status of the <code>CreateModel</code> operation.
  final ModelStatus? status;

  CreateModelResponse({
    this.modelArn,
    this.status,
  });

  factory CreateModelResponse.fromJson(Map<String, dynamic> json) {
    return CreateModelResponse(
      modelArn: json['ModelArn'] as String?,
      status: (json['Status'] as String?)?.toModelStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final modelArn = this.modelArn;
    final status = this.status;
    return {
      if (modelArn != null) 'ModelArn': modelArn,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

class CreateRetrainingSchedulerResponse {
  /// The ARN of the model that you added the retraining scheduler to.
  final String? modelArn;

  /// The name of the model that you added the retraining scheduler to.
  final String? modelName;

  /// The status of the retraining scheduler.
  final RetrainingSchedulerStatus? status;

  CreateRetrainingSchedulerResponse({
    this.modelArn,
    this.modelName,
    this.status,
  });

  factory CreateRetrainingSchedulerResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateRetrainingSchedulerResponse(
      modelArn: json['ModelArn'] as String?,
      modelName: json['ModelName'] as String?,
      status: (json['Status'] as String?)?.toRetrainingSchedulerStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final modelArn = this.modelArn;
    final modelName = this.modelName;
    final status = this.status;
    return {
      if (modelArn != null) 'ModelArn': modelArn,
      if (modelName != null) 'ModelName': modelName,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// Provides information about a specified data ingestion job, including dataset
/// information, data ingestion configuration, and status.
class DataIngestionJobSummary {
  /// The Amazon Resource Name (ARN) of the dataset used in the data ingestion
  /// job.
  final String? datasetArn;

  /// The name of the dataset used for the data ingestion job.
  final String? datasetName;

  /// Specifies information for the input data for the data inference job,
  /// including data Amazon S3 location parameters.
  final IngestionInputConfiguration? ingestionInputConfiguration;

  /// Indicates the job ID of the data ingestion job.
  final String? jobId;

  /// Indicates the status of the data ingestion job.
  final IngestionJobStatus? status;

  DataIngestionJobSummary({
    this.datasetArn,
    this.datasetName,
    this.ingestionInputConfiguration,
    this.jobId,
    this.status,
  });

  factory DataIngestionJobSummary.fromJson(Map<String, dynamic> json) {
    return DataIngestionJobSummary(
      datasetArn: json['DatasetArn'] as String?,
      datasetName: json['DatasetName'] as String?,
      ingestionInputConfiguration: json['IngestionInputConfiguration'] != null
          ? IngestionInputConfiguration.fromJson(
              json['IngestionInputConfiguration'] as Map<String, dynamic>)
          : null,
      jobId: json['JobId'] as String?,
      status: (json['Status'] as String?)?.toIngestionJobStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final datasetArn = this.datasetArn;
    final datasetName = this.datasetName;
    final ingestionInputConfiguration = this.ingestionInputConfiguration;
    final jobId = this.jobId;
    final status = this.status;
    return {
      if (datasetArn != null) 'DatasetArn': datasetArn,
      if (datasetName != null) 'DatasetName': datasetName,
      if (ingestionInputConfiguration != null)
        'IngestionInputConfiguration': ingestionInputConfiguration,
      if (jobId != null) 'JobId': jobId,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// The configuration is the <code>TargetSamplingRate</code>, which is the
/// sampling rate of the data after post processing by Amazon Lookout for
/// Equipment. For example, if you provide data that has been collected at a 1
/// second level and you want the system to resample the data at a 1 minute rate
/// before training, the <code>TargetSamplingRate</code> is 1 minute.
///
/// When providing a value for the <code>TargetSamplingRate</code>, you must
/// attach the prefix "PT" to the rate you want. The value for a 1 second rate
/// is therefore <i>PT1S</i>, the value for a 15 minute rate is <i>PT15M</i>,
/// and the value for a 1 hour rate is <i>PT1H</i>
class DataPreProcessingConfiguration {
  /// The sampling rate of the data after post processing by Amazon Lookout for
  /// Equipment. For example, if you provide data that has been collected at a 1
  /// second level and you want the system to resample the data at a 1 minute rate
  /// before training, the <code>TargetSamplingRate</code> is 1 minute.
  ///
  /// When providing a value for the <code>TargetSamplingRate</code>, you must
  /// attach the prefix "PT" to the rate you want. The value for a 1 second rate
  /// is therefore <i>PT1S</i>, the value for a 15 minute rate is <i>PT15M</i>,
  /// and the value for a 1 hour rate is <i>PT1H</i>
  final TargetSamplingRate? targetSamplingRate;

  DataPreProcessingConfiguration({
    this.targetSamplingRate,
  });

  factory DataPreProcessingConfiguration.fromJson(Map<String, dynamic> json) {
    return DataPreProcessingConfiguration(
      targetSamplingRate:
          (json['TargetSamplingRate'] as String?)?.toTargetSamplingRate(),
    );
  }

  Map<String, dynamic> toJson() {
    final targetSamplingRate = this.targetSamplingRate;
    return {
      if (targetSamplingRate != null)
        'TargetSamplingRate': targetSamplingRate.toValue(),
    };
  }
}

/// DataQualitySummary gives aggregated statistics over all the sensors about a
/// completed ingestion job. It primarily gives more information about
/// statistics over different incorrect data like MissingCompleteSensorData,
/// MissingSensorData, UnsupportedDateFormats, InsufficientSensorData,
/// DuplicateTimeStamps.
class DataQualitySummary {
  /// Parameter that gives information about duplicate timestamps in the input
  /// data.
  final DuplicateTimestamps duplicateTimestamps;

  /// Parameter that gives information about insufficient data for sensors in the
  /// dataset. This includes information about those sensors that have complete
  /// data missing and those with a short date range.
  final InsufficientSensorData insufficientSensorData;

  /// Parameter that gives information about data that is invalid over all the
  /// sensors in the input data.
  final InvalidSensorData invalidSensorData;

  /// Parameter that gives information about data that is missing over all the
  /// sensors in the input data.
  final MissingSensorData missingSensorData;

  /// Parameter that gives information about unsupported timestamps in the input
  /// data.
  final UnsupportedTimestamps unsupportedTimestamps;

  DataQualitySummary({
    required this.duplicateTimestamps,
    required this.insufficientSensorData,
    required this.invalidSensorData,
    required this.missingSensorData,
    required this.unsupportedTimestamps,
  });

  factory DataQualitySummary.fromJson(Map<String, dynamic> json) {
    return DataQualitySummary(
      duplicateTimestamps: DuplicateTimestamps.fromJson(
          json['DuplicateTimestamps'] as Map<String, dynamic>),
      insufficientSensorData: InsufficientSensorData.fromJson(
          json['InsufficientSensorData'] as Map<String, dynamic>),
      invalidSensorData: InvalidSensorData.fromJson(
          json['InvalidSensorData'] as Map<String, dynamic>),
      missingSensorData: MissingSensorData.fromJson(
          json['MissingSensorData'] as Map<String, dynamic>),
      unsupportedTimestamps: UnsupportedTimestamps.fromJson(
          json['UnsupportedTimestamps'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final duplicateTimestamps = this.duplicateTimestamps;
    final insufficientSensorData = this.insufficientSensorData;
    final invalidSensorData = this.invalidSensorData;
    final missingSensorData = this.missingSensorData;
    final unsupportedTimestamps = this.unsupportedTimestamps;
    return {
      'DuplicateTimestamps': duplicateTimestamps,
      'InsufficientSensorData': insufficientSensorData,
      'InvalidSensorData': invalidSensorData,
      'MissingSensorData': missingSensorData,
      'UnsupportedTimestamps': unsupportedTimestamps,
    };
  }
}

enum DataUploadFrequency {
  pt5m,
  pt10m,
  pt15m,
  pt30m,
  pt1h,
}

extension DataUploadFrequencyValueExtension on DataUploadFrequency {
  String toValue() {
    switch (this) {
      case DataUploadFrequency.pt5m:
        return 'PT5M';
      case DataUploadFrequency.pt10m:
        return 'PT10M';
      case DataUploadFrequency.pt15m:
        return 'PT15M';
      case DataUploadFrequency.pt30m:
        return 'PT30M';
      case DataUploadFrequency.pt1h:
        return 'PT1H';
    }
  }
}

extension DataUploadFrequencyFromString on String {
  DataUploadFrequency toDataUploadFrequency() {
    switch (this) {
      case 'PT5M':
        return DataUploadFrequency.pt5m;
      case 'PT10M':
        return DataUploadFrequency.pt10m;
      case 'PT15M':
        return DataUploadFrequency.pt15m;
      case 'PT30M':
        return DataUploadFrequency.pt30m;
      case 'PT1H':
        return DataUploadFrequency.pt1h;
    }
    throw Exception('$this is not known in enum DataUploadFrequency');
  }
}

/// Provides information about the data schema used with the given dataset.
class DatasetSchema {
  /// The data schema used within the given dataset.
  final Object? inlineDataSchema;

  DatasetSchema({
    this.inlineDataSchema,
  });

  Map<String, dynamic> toJson() {
    final inlineDataSchema = this.inlineDataSchema;
    return {
      if (inlineDataSchema != null)
        'InlineDataSchema': jsonEncode(inlineDataSchema),
    };
  }
}

enum DatasetStatus {
  created,
  ingestionInProgress,
  active,
  importInProgress,
}

extension DatasetStatusValueExtension on DatasetStatus {
  String toValue() {
    switch (this) {
      case DatasetStatus.created:
        return 'CREATED';
      case DatasetStatus.ingestionInProgress:
        return 'INGESTION_IN_PROGRESS';
      case DatasetStatus.active:
        return 'ACTIVE';
      case DatasetStatus.importInProgress:
        return 'IMPORT_IN_PROGRESS';
    }
  }
}

extension DatasetStatusFromString on String {
  DatasetStatus toDatasetStatus() {
    switch (this) {
      case 'CREATED':
        return DatasetStatus.created;
      case 'INGESTION_IN_PROGRESS':
        return DatasetStatus.ingestionInProgress;
      case 'ACTIVE':
        return DatasetStatus.active;
      case 'IMPORT_IN_PROGRESS':
        return DatasetStatus.importInProgress;
    }
    throw Exception('$this is not known in enum DatasetStatus');
  }
}

/// Contains information about the specific data set, including name, ARN, and
/// status.
class DatasetSummary {
  /// The time at which the dataset was created in Amazon Lookout for Equipment.
  final DateTime? createdAt;

  /// The Amazon Resource Name (ARN) of the specified dataset.
  final String? datasetArn;

  /// The name of the dataset.
  final String? datasetName;

  /// Indicates the status of the dataset.
  final DatasetStatus? status;

  DatasetSummary({
    this.createdAt,
    this.datasetArn,
    this.datasetName,
    this.status,
  });

  factory DatasetSummary.fromJson(Map<String, dynamic> json) {
    return DatasetSummary(
      createdAt: timeStampFromJson(json['CreatedAt']),
      datasetArn: json['DatasetArn'] as String?,
      datasetName: json['DatasetName'] as String?,
      status: (json['Status'] as String?)?.toDatasetStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final datasetArn = this.datasetArn;
    final datasetName = this.datasetName;
    final status = this.status;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (datasetArn != null) 'DatasetArn': datasetArn,
      if (datasetName != null) 'DatasetName': datasetName,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

class DescribeDataIngestionJobResponse {
  /// The time at which the data ingestion job was created.
  final DateTime? createdAt;

  /// Indicates the latest timestamp corresponding to data that was successfully
  /// ingested during this specific ingestion job.
  final DateTime? dataEndTime;

  /// Gives statistics about a completed ingestion job. These statistics primarily
  /// relate to quantifying incorrect data such as MissingCompleteSensorData,
  /// MissingSensorData, UnsupportedDateFormats, InsufficientSensorData, and
  /// DuplicateTimeStamps.
  final DataQualitySummary? dataQualitySummary;

  /// Indicates the earliest timestamp corresponding to data that was successfully
  /// ingested during this specific ingestion job.
  final DateTime? dataStartTime;

  /// The Amazon Resource Name (ARN) of the dataset being used in the data
  /// ingestion job.
  final String? datasetArn;

  /// Specifies the reason for failure when a data ingestion job has failed.
  final String? failedReason;

  /// Indicates the size of the ingested dataset.
  final int? ingestedDataSize;
  final IngestedFilesSummary? ingestedFilesSummary;

  /// Specifies the S3 location configuration for the data input for the data
  /// ingestion job.
  final IngestionInputConfiguration? ingestionInputConfiguration;

  /// Indicates the job ID of the data ingestion job.
  final String? jobId;

  /// The Amazon Resource Name (ARN) of an IAM role with permission to access the
  /// data source being ingested.
  final String? roleArn;

  /// The Amazon Resource Name (ARN) of the source dataset from which the data
  /// used for the data ingestion job was imported from.
  final String? sourceDatasetArn;

  /// Indicates the status of the <code>DataIngestionJob</code> operation.
  final IngestionJobStatus? status;

  /// Provides details about status of the ingestion job that is currently in
  /// progress.
  final String? statusDetail;

  DescribeDataIngestionJobResponse({
    this.createdAt,
    this.dataEndTime,
    this.dataQualitySummary,
    this.dataStartTime,
    this.datasetArn,
    this.failedReason,
    this.ingestedDataSize,
    this.ingestedFilesSummary,
    this.ingestionInputConfiguration,
    this.jobId,
    this.roleArn,
    this.sourceDatasetArn,
    this.status,
    this.statusDetail,
  });

  factory DescribeDataIngestionJobResponse.fromJson(Map<String, dynamic> json) {
    return DescribeDataIngestionJobResponse(
      createdAt: timeStampFromJson(json['CreatedAt']),
      dataEndTime: timeStampFromJson(json['DataEndTime']),
      dataQualitySummary: json['DataQualitySummary'] != null
          ? DataQualitySummary.fromJson(
              json['DataQualitySummary'] as Map<String, dynamic>)
          : null,
      dataStartTime: timeStampFromJson(json['DataStartTime']),
      datasetArn: json['DatasetArn'] as String?,
      failedReason: json['FailedReason'] as String?,
      ingestedDataSize: json['IngestedDataSize'] as int?,
      ingestedFilesSummary: json['IngestedFilesSummary'] != null
          ? IngestedFilesSummary.fromJson(
              json['IngestedFilesSummary'] as Map<String, dynamic>)
          : null,
      ingestionInputConfiguration: json['IngestionInputConfiguration'] != null
          ? IngestionInputConfiguration.fromJson(
              json['IngestionInputConfiguration'] as Map<String, dynamic>)
          : null,
      jobId: json['JobId'] as String?,
      roleArn: json['RoleArn'] as String?,
      sourceDatasetArn: json['SourceDatasetArn'] as String?,
      status: (json['Status'] as String?)?.toIngestionJobStatus(),
      statusDetail: json['StatusDetail'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final dataEndTime = this.dataEndTime;
    final dataQualitySummary = this.dataQualitySummary;
    final dataStartTime = this.dataStartTime;
    final datasetArn = this.datasetArn;
    final failedReason = this.failedReason;
    final ingestedDataSize = this.ingestedDataSize;
    final ingestedFilesSummary = this.ingestedFilesSummary;
    final ingestionInputConfiguration = this.ingestionInputConfiguration;
    final jobId = this.jobId;
    final roleArn = this.roleArn;
    final sourceDatasetArn = this.sourceDatasetArn;
    final status = this.status;
    final statusDetail = this.statusDetail;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (dataEndTime != null) 'DataEndTime': unixTimestampToJson(dataEndTime),
      if (dataQualitySummary != null) 'DataQualitySummary': dataQualitySummary,
      if (dataStartTime != null)
        'DataStartTime': unixTimestampToJson(dataStartTime),
      if (datasetArn != null) 'DatasetArn': datasetArn,
      if (failedReason != null) 'FailedReason': failedReason,
      if (ingestedDataSize != null) 'IngestedDataSize': ingestedDataSize,
      if (ingestedFilesSummary != null)
        'IngestedFilesSummary': ingestedFilesSummary,
      if (ingestionInputConfiguration != null)
        'IngestionInputConfiguration': ingestionInputConfiguration,
      if (jobId != null) 'JobId': jobId,
      if (roleArn != null) 'RoleArn': roleArn,
      if (sourceDatasetArn != null) 'SourceDatasetArn': sourceDatasetArn,
      if (status != null) 'Status': status.toValue(),
      if (statusDetail != null) 'StatusDetail': statusDetail,
    };
  }
}

class DescribeDatasetResponse {
  /// Specifies the time the dataset was created in Lookout for Equipment.
  final DateTime? createdAt;

  /// Indicates the latest timestamp corresponding to data that was successfully
  /// ingested during the most recent ingestion of this particular dataset.
  final DateTime? dataEndTime;

  /// Gives statistics associated with the given dataset for the latest successful
  /// associated ingestion job id. These statistics primarily relate to
  /// quantifying incorrect data such as MissingCompleteSensorData,
  /// MissingSensorData, UnsupportedDateFormats, InsufficientSensorData, and
  /// DuplicateTimeStamps.
  final DataQualitySummary? dataQualitySummary;

  /// Indicates the earliest timestamp corresponding to data that was successfully
  /// ingested during the most recent ingestion of this particular dataset.
  final DateTime? dataStartTime;

  /// The Amazon Resource Name (ARN) of the dataset being described.
  final String? datasetArn;

  /// The name of the dataset being described.
  final String? datasetName;

  /// IngestedFilesSummary associated with the given dataset for the latest
  /// successful associated ingestion job id.
  final IngestedFilesSummary? ingestedFilesSummary;

  /// Specifies the S3 location configuration for the data input for the data
  /// ingestion job.
  final IngestionInputConfiguration? ingestionInputConfiguration;

  /// Specifies the time the dataset was last updated, if it was.
  final DateTime? lastUpdatedAt;

  /// The Amazon Resource Name (ARN) of the IAM role that you are using for this
  /// the data ingestion job.
  final String? roleArn;

  /// A JSON description of the data that is in each time series dataset,
  /// including names, column names, and data types.
  final Object? schema;

  /// Provides the identifier of the KMS key used to encrypt dataset data by
  /// Amazon Lookout for Equipment.
  final String? serverSideKmsKeyId;

  /// The Amazon Resource Name (ARN) of the source dataset from which the current
  /// data being described was imported from.
  final String? sourceDatasetArn;

  /// Indicates the status of the dataset.
  final DatasetStatus? status;

  DescribeDatasetResponse({
    this.createdAt,
    this.dataEndTime,
    this.dataQualitySummary,
    this.dataStartTime,
    this.datasetArn,
    this.datasetName,
    this.ingestedFilesSummary,
    this.ingestionInputConfiguration,
    this.lastUpdatedAt,
    this.roleArn,
    this.schema,
    this.serverSideKmsKeyId,
    this.sourceDatasetArn,
    this.status,
  });

  factory DescribeDatasetResponse.fromJson(Map<String, dynamic> json) {
    return DescribeDatasetResponse(
      createdAt: timeStampFromJson(json['CreatedAt']),
      dataEndTime: timeStampFromJson(json['DataEndTime']),
      dataQualitySummary: json['DataQualitySummary'] != null
          ? DataQualitySummary.fromJson(
              json['DataQualitySummary'] as Map<String, dynamic>)
          : null,
      dataStartTime: timeStampFromJson(json['DataStartTime']),
      datasetArn: json['DatasetArn'] as String?,
      datasetName: json['DatasetName'] as String?,
      ingestedFilesSummary: json['IngestedFilesSummary'] != null
          ? IngestedFilesSummary.fromJson(
              json['IngestedFilesSummary'] as Map<String, dynamic>)
          : null,
      ingestionInputConfiguration: json['IngestionInputConfiguration'] != null
          ? IngestionInputConfiguration.fromJson(
              json['IngestionInputConfiguration'] as Map<String, dynamic>)
          : null,
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      roleArn: json['RoleArn'] as String?,
      schema:
          json['Schema'] == null ? null : jsonDecode(json['Schema'] as String),
      serverSideKmsKeyId: json['ServerSideKmsKeyId'] as String?,
      sourceDatasetArn: json['SourceDatasetArn'] as String?,
      status: (json['Status'] as String?)?.toDatasetStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final dataEndTime = this.dataEndTime;
    final dataQualitySummary = this.dataQualitySummary;
    final dataStartTime = this.dataStartTime;
    final datasetArn = this.datasetArn;
    final datasetName = this.datasetName;
    final ingestedFilesSummary = this.ingestedFilesSummary;
    final ingestionInputConfiguration = this.ingestionInputConfiguration;
    final lastUpdatedAt = this.lastUpdatedAt;
    final roleArn = this.roleArn;
    final schema = this.schema;
    final serverSideKmsKeyId = this.serverSideKmsKeyId;
    final sourceDatasetArn = this.sourceDatasetArn;
    final status = this.status;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (dataEndTime != null) 'DataEndTime': unixTimestampToJson(dataEndTime),
      if (dataQualitySummary != null) 'DataQualitySummary': dataQualitySummary,
      if (dataStartTime != null)
        'DataStartTime': unixTimestampToJson(dataStartTime),
      if (datasetArn != null) 'DatasetArn': datasetArn,
      if (datasetName != null) 'DatasetName': datasetName,
      if (ingestedFilesSummary != null)
        'IngestedFilesSummary': ingestedFilesSummary,
      if (ingestionInputConfiguration != null)
        'IngestionInputConfiguration': ingestionInputConfiguration,
      if (lastUpdatedAt != null)
        'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (roleArn != null) 'RoleArn': roleArn,
      if (schema != null) 'Schema': jsonEncode(schema),
      if (serverSideKmsKeyId != null) 'ServerSideKmsKeyId': serverSideKmsKeyId,
      if (sourceDatasetArn != null) 'SourceDatasetArn': sourceDatasetArn,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

class DescribeInferenceSchedulerResponse {
  /// Specifies the time at which the inference scheduler was created.
  final DateTime? createdAt;

  /// A period of time (in minutes) by which inference on the data is delayed
  /// after the data starts. For instance, if you select an offset delay time of
  /// five minutes, inference will not begin on the data until the first data
  /// measurement after the five minute mark. For example, if five minutes is
  /// selected, the inference scheduler will wake up at the configured frequency
  /// with the additional five minute delay time to check the customer S3 bucket.
  /// The customer can upload data at the same frequency and they don't need to
  /// stop and restart the scheduler when uploading new data.
  final int? dataDelayOffsetInMinutes;

  /// Specifies configuration information for the input data for the inference
  /// scheduler, including delimiter, format, and dataset location.
  final InferenceInputConfiguration? dataInputConfiguration;

  /// Specifies information for the output results for the inference scheduler,
  /// including the output S3 location.
  final InferenceOutputConfiguration? dataOutputConfiguration;

  /// Specifies how often data is uploaded to the source S3 bucket for the input
  /// data. This value is the length of time between data uploads. For instance,
  /// if you select 5 minutes, Amazon Lookout for Equipment will upload the
  /// real-time data to the source bucket once every 5 minutes. This frequency
  /// also determines how often Amazon Lookout for Equipment starts a scheduled
  /// inference on your data. In this example, it starts once every 5 minutes.
  final DataUploadFrequency? dataUploadFrequency;

  /// The Amazon Resource Name (ARN) of the inference scheduler being described.
  final String? inferenceSchedulerArn;

  /// The name of the inference scheduler being described.
  final String? inferenceSchedulerName;

  /// Indicates whether the latest execution for the inference scheduler was
  /// Anomalous (anomalous events found) or Normal (no anomalous events found).
  final LatestInferenceResult? latestInferenceResult;

  /// The Amazon Resource Name (ARN) of the machine learning model of the
  /// inference scheduler being described.
  final String? modelArn;

  /// The name of the machine learning model of the inference scheduler being
  /// described.
  final String? modelName;

  /// The Amazon Resource Name (ARN) of a role with permission to access the data
  /// source for the inference scheduler being described.
  final String? roleArn;

  /// Provides the identifier of the KMS key used to encrypt inference scheduler
  /// data by Amazon Lookout for Equipment.
  final String? serverSideKmsKeyId;

  /// Indicates the status of the inference scheduler.
  final InferenceSchedulerStatus? status;

  /// Specifies the time at which the inference scheduler was last updated, if it
  /// was.
  final DateTime? updatedAt;

  DescribeInferenceSchedulerResponse({
    this.createdAt,
    this.dataDelayOffsetInMinutes,
    this.dataInputConfiguration,
    this.dataOutputConfiguration,
    this.dataUploadFrequency,
    this.inferenceSchedulerArn,
    this.inferenceSchedulerName,
    this.latestInferenceResult,
    this.modelArn,
    this.modelName,
    this.roleArn,
    this.serverSideKmsKeyId,
    this.status,
    this.updatedAt,
  });

  factory DescribeInferenceSchedulerResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeInferenceSchedulerResponse(
      createdAt: timeStampFromJson(json['CreatedAt']),
      dataDelayOffsetInMinutes: json['DataDelayOffsetInMinutes'] as int?,
      dataInputConfiguration: json['DataInputConfiguration'] != null
          ? InferenceInputConfiguration.fromJson(
              json['DataInputConfiguration'] as Map<String, dynamic>)
          : null,
      dataOutputConfiguration: json['DataOutputConfiguration'] != null
          ? InferenceOutputConfiguration.fromJson(
              json['DataOutputConfiguration'] as Map<String, dynamic>)
          : null,
      dataUploadFrequency:
          (json['DataUploadFrequency'] as String?)?.toDataUploadFrequency(),
      inferenceSchedulerArn: json['InferenceSchedulerArn'] as String?,
      inferenceSchedulerName: json['InferenceSchedulerName'] as String?,
      latestInferenceResult:
          (json['LatestInferenceResult'] as String?)?.toLatestInferenceResult(),
      modelArn: json['ModelArn'] as String?,
      modelName: json['ModelName'] as String?,
      roleArn: json['RoleArn'] as String?,
      serverSideKmsKeyId: json['ServerSideKmsKeyId'] as String?,
      status: (json['Status'] as String?)?.toInferenceSchedulerStatus(),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final dataDelayOffsetInMinutes = this.dataDelayOffsetInMinutes;
    final dataInputConfiguration = this.dataInputConfiguration;
    final dataOutputConfiguration = this.dataOutputConfiguration;
    final dataUploadFrequency = this.dataUploadFrequency;
    final inferenceSchedulerArn = this.inferenceSchedulerArn;
    final inferenceSchedulerName = this.inferenceSchedulerName;
    final latestInferenceResult = this.latestInferenceResult;
    final modelArn = this.modelArn;
    final modelName = this.modelName;
    final roleArn = this.roleArn;
    final serverSideKmsKeyId = this.serverSideKmsKeyId;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (dataDelayOffsetInMinutes != null)
        'DataDelayOffsetInMinutes': dataDelayOffsetInMinutes,
      if (dataInputConfiguration != null)
        'DataInputConfiguration': dataInputConfiguration,
      if (dataOutputConfiguration != null)
        'DataOutputConfiguration': dataOutputConfiguration,
      if (dataUploadFrequency != null)
        'DataUploadFrequency': dataUploadFrequency.toValue(),
      if (inferenceSchedulerArn != null)
        'InferenceSchedulerArn': inferenceSchedulerArn,
      if (inferenceSchedulerName != null)
        'InferenceSchedulerName': inferenceSchedulerName,
      if (latestInferenceResult != null)
        'LatestInferenceResult': latestInferenceResult.toValue(),
      if (modelArn != null) 'ModelArn': modelArn,
      if (modelName != null) 'ModelName': modelName,
      if (roleArn != null) 'RoleArn': roleArn,
      if (serverSideKmsKeyId != null) 'ServerSideKmsKeyId': serverSideKmsKeyId,
      if (status != null) 'Status': status.toValue(),
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

class DescribeLabelGroupResponse {
  /// The time at which the label group was created.
  final DateTime? createdAt;

  /// Codes indicating the type of anomaly associated with the labels in the
  /// lagbel group.
  final List<String>? faultCodes;

  /// The Amazon Resource Name (ARN) of the label group.
  final String? labelGroupArn;

  /// The name of the label group.
  final String? labelGroupName;

  /// The time at which the label group was updated.
  final DateTime? updatedAt;

  DescribeLabelGroupResponse({
    this.createdAt,
    this.faultCodes,
    this.labelGroupArn,
    this.labelGroupName,
    this.updatedAt,
  });

  factory DescribeLabelGroupResponse.fromJson(Map<String, dynamic> json) {
    return DescribeLabelGroupResponse(
      createdAt: timeStampFromJson(json['CreatedAt']),
      faultCodes: (json['FaultCodes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      labelGroupArn: json['LabelGroupArn'] as String?,
      labelGroupName: json['LabelGroupName'] as String?,
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final faultCodes = this.faultCodes;
    final labelGroupArn = this.labelGroupArn;
    final labelGroupName = this.labelGroupName;
    final updatedAt = this.updatedAt;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (faultCodes != null) 'FaultCodes': faultCodes,
      if (labelGroupArn != null) 'LabelGroupArn': labelGroupArn,
      if (labelGroupName != null) 'LabelGroupName': labelGroupName,
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

class DescribeLabelResponse {
  /// The time at which the label was created.
  final DateTime? createdAt;

  /// The end time of the requested label.
  final DateTime? endTime;

  /// Indicates that a label pertains to a particular piece of equipment.
  final String? equipment;

  /// Indicates the type of anomaly associated with the label.
  ///
  /// Data in this field will be retained for service usage. Follow best practices
  /// for the security of your data.
  final String? faultCode;

  /// The Amazon Resource Name (ARN) of the requested label group.
  final String? labelGroupArn;

  /// The name of the requested label group.
  final String? labelGroupName;

  /// The ID of the requested label.
  final String? labelId;

  /// Metadata providing additional information about the label.
  ///
  /// Data in this field will be retained for service usage. Follow best practices
  /// for the security of your data.
  final String? notes;

  /// Indicates whether a labeled event represents an anomaly.
  final LabelRating? rating;

  /// The start time of the requested label.
  final DateTime? startTime;

  DescribeLabelResponse({
    this.createdAt,
    this.endTime,
    this.equipment,
    this.faultCode,
    this.labelGroupArn,
    this.labelGroupName,
    this.labelId,
    this.notes,
    this.rating,
    this.startTime,
  });

  factory DescribeLabelResponse.fromJson(Map<String, dynamic> json) {
    return DescribeLabelResponse(
      createdAt: timeStampFromJson(json['CreatedAt']),
      endTime: timeStampFromJson(json['EndTime']),
      equipment: json['Equipment'] as String?,
      faultCode: json['FaultCode'] as String?,
      labelGroupArn: json['LabelGroupArn'] as String?,
      labelGroupName: json['LabelGroupName'] as String?,
      labelId: json['LabelId'] as String?,
      notes: json['Notes'] as String?,
      rating: (json['Rating'] as String?)?.toLabelRating(),
      startTime: timeStampFromJson(json['StartTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final endTime = this.endTime;
    final equipment = this.equipment;
    final faultCode = this.faultCode;
    final labelGroupArn = this.labelGroupArn;
    final labelGroupName = this.labelGroupName;
    final labelId = this.labelId;
    final notes = this.notes;
    final rating = this.rating;
    final startTime = this.startTime;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (equipment != null) 'Equipment': equipment,
      if (faultCode != null) 'FaultCode': faultCode,
      if (labelGroupArn != null) 'LabelGroupArn': labelGroupArn,
      if (labelGroupName != null) 'LabelGroupName': labelGroupName,
      if (labelId != null) 'LabelId': labelId,
      if (notes != null) 'Notes': notes,
      if (rating != null) 'Rating': rating.toValue(),
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
    };
  }
}

class DescribeModelResponse {
  /// Indicates the end time of the inference data that has been accumulated.
  final DateTime? accumulatedInferenceDataEndTime;

  /// Indicates the start time of the inference data that has been accumulated.
  final DateTime? accumulatedInferenceDataStartTime;

  /// The name of the model version used by the inference schedular when running a
  /// scheduled inference execution.
  final int? activeModelVersion;

  /// The Amazon Resource Name (ARN) of the model version used by the inference
  /// scheduler when running a scheduled inference execution.
  final String? activeModelVersionArn;

  /// Indicates the time and date at which the machine learning model was created.
  final DateTime? createdAt;

  /// The configuration is the <code>TargetSamplingRate</code>, which is the
  /// sampling rate of the data after post processing by Amazon Lookout for
  /// Equipment. For example, if you provide data that has been collected at a 1
  /// second level and you want the system to resample the data at a 1 minute rate
  /// before training, the <code>TargetSamplingRate</code> is 1 minute.
  ///
  /// When providing a value for the <code>TargetSamplingRate</code>, you must
  /// attach the prefix "PT" to the rate you want. The value for a 1 second rate
  /// is therefore <i>PT1S</i>, the value for a 15 minute rate is <i>PT15M</i>,
  /// and the value for a 1 hour rate is <i>PT1H</i>
  final DataPreProcessingConfiguration? dataPreProcessingConfiguration;

  /// The Amazon Resouce Name (ARN) of the dataset used to create the machine
  /// learning model being described.
  final String? datasetArn;

  /// The name of the dataset being used by the machine learning being described.
  final String? datasetName;

  /// Indicates the time reference in the dataset that was used to end the subset
  /// of evaluation data for the machine learning model.
  final DateTime? evaluationDataEndTime;

  /// Indicates the time reference in the dataset that was used to begin the
  /// subset of evaluation data for the machine learning model.
  final DateTime? evaluationDataStartTime;

  /// If the training of the machine learning model failed, this indicates the
  /// reason for that failure.
  final String? failedReason;

  /// The date and time when the import job was completed. This field appears if
  /// the active model version was imported.
  final DateTime? importJobEndTime;

  /// The date and time when the import job was started. This field appears if the
  /// active model version was imported.
  final DateTime? importJobStartTime;

  /// Specifies configuration information about the labels input, including its S3
  /// location.
  final LabelsInputConfiguration? labelsInputConfiguration;

  /// Indicates the last time the machine learning model was updated. The type of
  /// update is not specified.
  final DateTime? lastUpdatedTime;

  /// Indicates the number of days of data used in the most recent scheduled
  /// retraining run.
  final int? latestScheduledRetrainingAvailableDataInDays;

  /// If the model version was generated by retraining and the training failed,
  /// this indicates the reason for that failure.
  final String? latestScheduledRetrainingFailedReason;

  /// Indicates the most recent model version that was generated by retraining.
  final int? latestScheduledRetrainingModelVersion;

  /// Indicates the start time of the most recent scheduled retraining run.
  final DateTime? latestScheduledRetrainingStartTime;

  /// Indicates the status of the most recent scheduled retraining run.
  final ModelVersionStatus? latestScheduledRetrainingStatus;

  /// The Amazon Resource Name (ARN) of the machine learning model being
  /// described.
  final String? modelArn;

  /// Configuration information for the model's pointwise model diagnostics.
  final ModelDiagnosticsOutputConfiguration?
      modelDiagnosticsOutputConfiguration;

  /// The Model Metrics show an aggregated summary of the model's performance
  /// within the evaluation time range. This is the JSON content of the metrics
  /// created when evaluating the model.
  final Object? modelMetrics;

  /// The name of the machine learning model being described.
  final String? modelName;

  /// Provides a quality assessment for a model that uses labels. If Lookout for
  /// Equipment determines that the model quality is poor based on training
  /// metrics, the value is <code>POOR_QUALITY_DETECTED</code>. Otherwise, the
  /// value is <code>QUALITY_THRESHOLD_MET</code>.
  ///
  /// If the model is unlabeled, the model quality can't be assessed and the value
  /// of <code>ModelQuality</code> is <code>CANNOT_DETERMINE_QUALITY</code>. In
  /// this situation, you can get a model quality assessment by adding labels to
  /// the input dataset and retraining the model.
  ///
  /// For information about using labels with your models, see <a
  /// href="https://docs.aws.amazon.com/lookout-for-equipment/latest/ug/understanding-labeling.html">Understanding
  /// labeling</a>.
  ///
  /// For information about improving the quality of a model, see <a
  /// href="https://docs.aws.amazon.com/lookout-for-equipment/latest/ug/best-practices.html">Best
  /// practices with Amazon Lookout for Equipment</a>.
  final ModelQuality? modelQuality;

  /// The date the active model version was activated.
  final DateTime? modelVersionActivatedAt;

  /// Indicates the date and time that the next scheduled retraining run will
  /// start on. Lookout for Equipment truncates the time you provide to the
  /// nearest UTC day.
  final DateTime? nextScheduledRetrainingStartDate;

  /// Indicates that the asset associated with this sensor has been shut off. As
  /// long as this condition is met, Lookout for Equipment will not use data from
  /// this asset for training, evaluation, or inference.
  final String? offCondition;

  /// The model version that was set as the active model version prior to the
  /// current active model version.
  final int? previousActiveModelVersion;

  /// The ARN of the model version that was set as the active model version prior
  /// to the current active model version.
  final String? previousActiveModelVersionArn;

  /// The date and time when the previous active model version was activated.
  final DateTime? previousModelVersionActivatedAt;

  /// If the model version was retrained, this field shows a summary of the
  /// performance of the prior model on the new training range. You can use the
  /// information in this JSON-formatted object to compare the new model version
  /// and the prior model version.
  final Object? priorModelMetrics;

  /// Indicates the status of the retraining scheduler.
  final RetrainingSchedulerStatus? retrainingSchedulerStatus;

  /// The Amazon Resource Name (ARN) of a role with permission to access the data
  /// source for the machine learning model being described.
  final String? roleArn;

  /// A JSON description of the data that is in each time series dataset,
  /// including names, column names, and data types.
  final Object? schema;

  /// Provides the identifier of the KMS key used to encrypt model data by Amazon
  /// Lookout for Equipment.
  final String? serverSideKmsKeyId;

  /// The Amazon Resource Name (ARN) of the source model version. This field
  /// appears if the active model version was imported.
  final String? sourceModelVersionArn;

  /// Specifies the current status of the model being described. Status describes
  /// the status of the most recent action of the model.
  final ModelStatus? status;

  /// Indicates the time reference in the dataset that was used to end the subset
  /// of training data for the machine learning model.
  final DateTime? trainingDataEndTime;

  /// Indicates the time reference in the dataset that was used to begin the
  /// subset of training data for the machine learning model.
  final DateTime? trainingDataStartTime;

  /// Indicates the time at which the training of the machine learning model was
  /// completed.
  final DateTime? trainingExecutionEndTime;

  /// Indicates the time at which the training of the machine learning model
  /// began.
  final DateTime? trainingExecutionStartTime;

  DescribeModelResponse({
    this.accumulatedInferenceDataEndTime,
    this.accumulatedInferenceDataStartTime,
    this.activeModelVersion,
    this.activeModelVersionArn,
    this.createdAt,
    this.dataPreProcessingConfiguration,
    this.datasetArn,
    this.datasetName,
    this.evaluationDataEndTime,
    this.evaluationDataStartTime,
    this.failedReason,
    this.importJobEndTime,
    this.importJobStartTime,
    this.labelsInputConfiguration,
    this.lastUpdatedTime,
    this.latestScheduledRetrainingAvailableDataInDays,
    this.latestScheduledRetrainingFailedReason,
    this.latestScheduledRetrainingModelVersion,
    this.latestScheduledRetrainingStartTime,
    this.latestScheduledRetrainingStatus,
    this.modelArn,
    this.modelDiagnosticsOutputConfiguration,
    this.modelMetrics,
    this.modelName,
    this.modelQuality,
    this.modelVersionActivatedAt,
    this.nextScheduledRetrainingStartDate,
    this.offCondition,
    this.previousActiveModelVersion,
    this.previousActiveModelVersionArn,
    this.previousModelVersionActivatedAt,
    this.priorModelMetrics,
    this.retrainingSchedulerStatus,
    this.roleArn,
    this.schema,
    this.serverSideKmsKeyId,
    this.sourceModelVersionArn,
    this.status,
    this.trainingDataEndTime,
    this.trainingDataStartTime,
    this.trainingExecutionEndTime,
    this.trainingExecutionStartTime,
  });

  factory DescribeModelResponse.fromJson(Map<String, dynamic> json) {
    return DescribeModelResponse(
      accumulatedInferenceDataEndTime:
          timeStampFromJson(json['AccumulatedInferenceDataEndTime']),
      accumulatedInferenceDataStartTime:
          timeStampFromJson(json['AccumulatedInferenceDataStartTime']),
      activeModelVersion: json['ActiveModelVersion'] as int?,
      activeModelVersionArn: json['ActiveModelVersionArn'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      dataPreProcessingConfiguration: json['DataPreProcessingConfiguration'] !=
              null
          ? DataPreProcessingConfiguration.fromJson(
              json['DataPreProcessingConfiguration'] as Map<String, dynamic>)
          : null,
      datasetArn: json['DatasetArn'] as String?,
      datasetName: json['DatasetName'] as String?,
      evaluationDataEndTime: timeStampFromJson(json['EvaluationDataEndTime']),
      evaluationDataStartTime:
          timeStampFromJson(json['EvaluationDataStartTime']),
      failedReason: json['FailedReason'] as String?,
      importJobEndTime: timeStampFromJson(json['ImportJobEndTime']),
      importJobStartTime: timeStampFromJson(json['ImportJobStartTime']),
      labelsInputConfiguration: json['LabelsInputConfiguration'] != null
          ? LabelsInputConfiguration.fromJson(
              json['LabelsInputConfiguration'] as Map<String, dynamic>)
          : null,
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      latestScheduledRetrainingAvailableDataInDays:
          json['LatestScheduledRetrainingAvailableDataInDays'] as int?,
      latestScheduledRetrainingFailedReason:
          json['LatestScheduledRetrainingFailedReason'] as String?,
      latestScheduledRetrainingModelVersion:
          json['LatestScheduledRetrainingModelVersion'] as int?,
      latestScheduledRetrainingStartTime:
          timeStampFromJson(json['LatestScheduledRetrainingStartTime']),
      latestScheduledRetrainingStatus:
          (json['LatestScheduledRetrainingStatus'] as String?)
              ?.toModelVersionStatus(),
      modelArn: json['ModelArn'] as String?,
      modelDiagnosticsOutputConfiguration:
          json['ModelDiagnosticsOutputConfiguration'] != null
              ? ModelDiagnosticsOutputConfiguration.fromJson(
                  json['ModelDiagnosticsOutputConfiguration']
                      as Map<String, dynamic>)
              : null,
      modelMetrics: json['ModelMetrics'] == null
          ? null
          : jsonDecode(json['ModelMetrics'] as String),
      modelName: json['ModelName'] as String?,
      modelQuality: (json['ModelQuality'] as String?)?.toModelQuality(),
      modelVersionActivatedAt:
          timeStampFromJson(json['ModelVersionActivatedAt']),
      nextScheduledRetrainingStartDate:
          timeStampFromJson(json['NextScheduledRetrainingStartDate']),
      offCondition: json['OffCondition'] as String?,
      previousActiveModelVersion: json['PreviousActiveModelVersion'] as int?,
      previousActiveModelVersionArn:
          json['PreviousActiveModelVersionArn'] as String?,
      previousModelVersionActivatedAt:
          timeStampFromJson(json['PreviousModelVersionActivatedAt']),
      priorModelMetrics: json['PriorModelMetrics'] == null
          ? null
          : jsonDecode(json['PriorModelMetrics'] as String),
      retrainingSchedulerStatus: (json['RetrainingSchedulerStatus'] as String?)
          ?.toRetrainingSchedulerStatus(),
      roleArn: json['RoleArn'] as String?,
      schema:
          json['Schema'] == null ? null : jsonDecode(json['Schema'] as String),
      serverSideKmsKeyId: json['ServerSideKmsKeyId'] as String?,
      sourceModelVersionArn: json['SourceModelVersionArn'] as String?,
      status: (json['Status'] as String?)?.toModelStatus(),
      trainingDataEndTime: timeStampFromJson(json['TrainingDataEndTime']),
      trainingDataStartTime: timeStampFromJson(json['TrainingDataStartTime']),
      trainingExecutionEndTime:
          timeStampFromJson(json['TrainingExecutionEndTime']),
      trainingExecutionStartTime:
          timeStampFromJson(json['TrainingExecutionStartTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final accumulatedInferenceDataEndTime =
        this.accumulatedInferenceDataEndTime;
    final accumulatedInferenceDataStartTime =
        this.accumulatedInferenceDataStartTime;
    final activeModelVersion = this.activeModelVersion;
    final activeModelVersionArn = this.activeModelVersionArn;
    final createdAt = this.createdAt;
    final dataPreProcessingConfiguration = this.dataPreProcessingConfiguration;
    final datasetArn = this.datasetArn;
    final datasetName = this.datasetName;
    final evaluationDataEndTime = this.evaluationDataEndTime;
    final evaluationDataStartTime = this.evaluationDataStartTime;
    final failedReason = this.failedReason;
    final importJobEndTime = this.importJobEndTime;
    final importJobStartTime = this.importJobStartTime;
    final labelsInputConfiguration = this.labelsInputConfiguration;
    final lastUpdatedTime = this.lastUpdatedTime;
    final latestScheduledRetrainingAvailableDataInDays =
        this.latestScheduledRetrainingAvailableDataInDays;
    final latestScheduledRetrainingFailedReason =
        this.latestScheduledRetrainingFailedReason;
    final latestScheduledRetrainingModelVersion =
        this.latestScheduledRetrainingModelVersion;
    final latestScheduledRetrainingStartTime =
        this.latestScheduledRetrainingStartTime;
    final latestScheduledRetrainingStatus =
        this.latestScheduledRetrainingStatus;
    final modelArn = this.modelArn;
    final modelDiagnosticsOutputConfiguration =
        this.modelDiagnosticsOutputConfiguration;
    final modelMetrics = this.modelMetrics;
    final modelName = this.modelName;
    final modelQuality = this.modelQuality;
    final modelVersionActivatedAt = this.modelVersionActivatedAt;
    final nextScheduledRetrainingStartDate =
        this.nextScheduledRetrainingStartDate;
    final offCondition = this.offCondition;
    final previousActiveModelVersion = this.previousActiveModelVersion;
    final previousActiveModelVersionArn = this.previousActiveModelVersionArn;
    final previousModelVersionActivatedAt =
        this.previousModelVersionActivatedAt;
    final priorModelMetrics = this.priorModelMetrics;
    final retrainingSchedulerStatus = this.retrainingSchedulerStatus;
    final roleArn = this.roleArn;
    final schema = this.schema;
    final serverSideKmsKeyId = this.serverSideKmsKeyId;
    final sourceModelVersionArn = this.sourceModelVersionArn;
    final status = this.status;
    final trainingDataEndTime = this.trainingDataEndTime;
    final trainingDataStartTime = this.trainingDataStartTime;
    final trainingExecutionEndTime = this.trainingExecutionEndTime;
    final trainingExecutionStartTime = this.trainingExecutionStartTime;
    return {
      if (accumulatedInferenceDataEndTime != null)
        'AccumulatedInferenceDataEndTime':
            unixTimestampToJson(accumulatedInferenceDataEndTime),
      if (accumulatedInferenceDataStartTime != null)
        'AccumulatedInferenceDataStartTime':
            unixTimestampToJson(accumulatedInferenceDataStartTime),
      if (activeModelVersion != null) 'ActiveModelVersion': activeModelVersion,
      if (activeModelVersionArn != null)
        'ActiveModelVersionArn': activeModelVersionArn,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (dataPreProcessingConfiguration != null)
        'DataPreProcessingConfiguration': dataPreProcessingConfiguration,
      if (datasetArn != null) 'DatasetArn': datasetArn,
      if (datasetName != null) 'DatasetName': datasetName,
      if (evaluationDataEndTime != null)
        'EvaluationDataEndTime': unixTimestampToJson(evaluationDataEndTime),
      if (evaluationDataStartTime != null)
        'EvaluationDataStartTime': unixTimestampToJson(evaluationDataStartTime),
      if (failedReason != null) 'FailedReason': failedReason,
      if (importJobEndTime != null)
        'ImportJobEndTime': unixTimestampToJson(importJobEndTime),
      if (importJobStartTime != null)
        'ImportJobStartTime': unixTimestampToJson(importJobStartTime),
      if (labelsInputConfiguration != null)
        'LabelsInputConfiguration': labelsInputConfiguration,
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (latestScheduledRetrainingAvailableDataInDays != null)
        'LatestScheduledRetrainingAvailableDataInDays':
            latestScheduledRetrainingAvailableDataInDays,
      if (latestScheduledRetrainingFailedReason != null)
        'LatestScheduledRetrainingFailedReason':
            latestScheduledRetrainingFailedReason,
      if (latestScheduledRetrainingModelVersion != null)
        'LatestScheduledRetrainingModelVersion':
            latestScheduledRetrainingModelVersion,
      if (latestScheduledRetrainingStartTime != null)
        'LatestScheduledRetrainingStartTime':
            unixTimestampToJson(latestScheduledRetrainingStartTime),
      if (latestScheduledRetrainingStatus != null)
        'LatestScheduledRetrainingStatus':
            latestScheduledRetrainingStatus.toValue(),
      if (modelArn != null) 'ModelArn': modelArn,
      if (modelDiagnosticsOutputConfiguration != null)
        'ModelDiagnosticsOutputConfiguration':
            modelDiagnosticsOutputConfiguration,
      if (modelMetrics != null) 'ModelMetrics': jsonEncode(modelMetrics),
      if (modelName != null) 'ModelName': modelName,
      if (modelQuality != null) 'ModelQuality': modelQuality.toValue(),
      if (modelVersionActivatedAt != null)
        'ModelVersionActivatedAt': unixTimestampToJson(modelVersionActivatedAt),
      if (nextScheduledRetrainingStartDate != null)
        'NextScheduledRetrainingStartDate':
            unixTimestampToJson(nextScheduledRetrainingStartDate),
      if (offCondition != null) 'OffCondition': offCondition,
      if (previousActiveModelVersion != null)
        'PreviousActiveModelVersion': previousActiveModelVersion,
      if (previousActiveModelVersionArn != null)
        'PreviousActiveModelVersionArn': previousActiveModelVersionArn,
      if (previousModelVersionActivatedAt != null)
        'PreviousModelVersionActivatedAt':
            unixTimestampToJson(previousModelVersionActivatedAt),
      if (priorModelMetrics != null)
        'PriorModelMetrics': jsonEncode(priorModelMetrics),
      if (retrainingSchedulerStatus != null)
        'RetrainingSchedulerStatus': retrainingSchedulerStatus.toValue(),
      if (roleArn != null) 'RoleArn': roleArn,
      if (schema != null) 'Schema': jsonEncode(schema),
      if (serverSideKmsKeyId != null) 'ServerSideKmsKeyId': serverSideKmsKeyId,
      if (sourceModelVersionArn != null)
        'SourceModelVersionArn': sourceModelVersionArn,
      if (status != null) 'Status': status.toValue(),
      if (trainingDataEndTime != null)
        'TrainingDataEndTime': unixTimestampToJson(trainingDataEndTime),
      if (trainingDataStartTime != null)
        'TrainingDataStartTime': unixTimestampToJson(trainingDataStartTime),
      if (trainingExecutionEndTime != null)
        'TrainingExecutionEndTime':
            unixTimestampToJson(trainingExecutionEndTime),
      if (trainingExecutionStartTime != null)
        'TrainingExecutionStartTime':
            unixTimestampToJson(trainingExecutionStartTime),
    };
  }
}

class DescribeModelVersionResponse {
  /// Indicates whether the model version was promoted to be the active version
  /// after retraining or if there was an error with or cancellation of the
  /// retraining.
  final AutoPromotionResult? autoPromotionResult;

  /// Indicates the reason for the <code>AutoPromotionResult</code>. For example,
  /// a model might not be promoted if its performance was worse than the active
  /// version, if there was an error during training, or if the retraining
  /// scheduler was using <code>MANUAL</code> promote mode. The model will be
  /// promoted in <code>MANAGED</code> promote mode if the performance is better
  /// than the previous model.
  final String? autoPromotionResultReason;

  /// Indicates the time and date at which the machine learning model version was
  /// created.
  final DateTime? createdAt;
  final DataPreProcessingConfiguration? dataPreProcessingConfiguration;

  /// The Amazon Resource Name (ARN) of the dataset used to train the model
  /// version.
  final String? datasetArn;

  /// The name of the dataset used to train the model version.
  final String? datasetName;

  /// The date on which the data in the evaluation set began being gathered. If
  /// you imported the version, this is the date that the evaluation set data in
  /// the source version finished being gathered.
  final DateTime? evaluationDataEndTime;

  /// The date on which the data in the evaluation set began being gathered. If
  /// you imported the version, this is the date that the evaluation set data in
  /// the source version began being gathered.
  final DateTime? evaluationDataStartTime;

  /// The failure message if the training of the model version failed.
  final String? failedReason;

  /// The date and time when the import job completed. This field appears if the
  /// model version was imported.
  final DateTime? importJobEndTime;

  /// The date and time when the import job began. This field appears if the model
  /// version was imported.
  final DateTime? importJobStartTime;

  /// The size in bytes of the imported data. This field appears if the model
  /// version was imported.
  final int? importedDataSizeInBytes;
  final LabelsInputConfiguration? labelsInputConfiguration;

  /// Indicates the last time the machine learning model version was updated.
  final DateTime? lastUpdatedTime;

  /// The Amazon Resource Name (ARN) of the parent machine learning model that
  /// this version belong to.
  final String? modelArn;

  /// The Amazon S3 location where Amazon Lookout for Equipment saves the
  /// pointwise model diagnostics for the model version.
  final ModelDiagnosticsOutputConfiguration?
      modelDiagnosticsOutputConfiguration;

  /// The Amazon S3 output prefix for where Lookout for Equipment saves the
  /// pointwise model diagnostics for the model version.
  final S3Object? modelDiagnosticsResultsObject;

  /// Shows an aggregated summary, in JSON format, of the model's performance
  /// within the evaluation time range. These metrics are created when evaluating
  /// the model.
  final String? modelMetrics;

  /// The name of the machine learning model that this version belongs to.
  final String? modelName;

  /// Provides a quality assessment for a model that uses labels. If Lookout for
  /// Equipment determines that the model quality is poor based on training
  /// metrics, the value is <code>POOR_QUALITY_DETECTED</code>. Otherwise, the
  /// value is <code>QUALITY_THRESHOLD_MET</code>.
  ///
  /// If the model is unlabeled, the model quality can't be assessed and the value
  /// of <code>ModelQuality</code> is <code>CANNOT_DETERMINE_QUALITY</code>. In
  /// this situation, you can get a model quality assessment by adding labels to
  /// the input dataset and retraining the model.
  ///
  /// For information about using labels with your models, see <a
  /// href="https://docs.aws.amazon.com/lookout-for-equipment/latest/ug/understanding-labeling.html">Understanding
  /// labeling</a>.
  ///
  /// For information about improving the quality of a model, see <a
  /// href="https://docs.aws.amazon.com/lookout-for-equipment/latest/ug/best-practices.html">Best
  /// practices with Amazon Lookout for Equipment</a>.
  final ModelQuality? modelQuality;

  /// The version of the machine learning model.
  final int? modelVersion;

  /// The Amazon Resource Name (ARN) of the model version.
  final String? modelVersionArn;

  /// Indicates that the asset associated with this sensor has been shut off. As
  /// long as this condition is met, Lookout for Equipment will not use data from
  /// this asset for training, evaluation, or inference.
  final String? offCondition;

  /// If the model version was retrained, this field shows a summary of the
  /// performance of the prior model on the new training range. You can use the
  /// information in this JSON-formatted object to compare the new model version
  /// and the prior model version.
  final String? priorModelMetrics;

  /// Indicates the number of days of data used in the most recent scheduled
  /// retraining run.
  final int? retrainingAvailableDataInDays;

  /// The Amazon Resource Name (ARN) of the role that was used to train the model
  /// version.
  final String? roleArn;

  /// The schema of the data used to train the model version.
  final String? schema;

  /// The identifier of the KMS key key used to encrypt model version data by
  /// Amazon Lookout for Equipment.
  final String? serverSideKmsKeyId;

  /// If model version was imported, then this field is the arn of the source
  /// model version.
  final String? sourceModelVersionArn;

  /// Indicates whether this model version was created by training or by
  /// importing.
  final ModelVersionSourceType? sourceType;

  /// The current status of the model version.
  final ModelVersionStatus? status;

  /// The date on which the training data finished being gathered. If you imported
  /// the version, this is the date that the training data in the source version
  /// finished being gathered.
  final DateTime? trainingDataEndTime;

  /// The date on which the training data began being gathered. If you imported
  /// the version, this is the date that the training data in the source version
  /// began being gathered.
  final DateTime? trainingDataStartTime;

  /// The time when the training of the version completed.
  final DateTime? trainingExecutionEndTime;

  /// The time when the training of the version began.
  final DateTime? trainingExecutionStartTime;

  DescribeModelVersionResponse({
    this.autoPromotionResult,
    this.autoPromotionResultReason,
    this.createdAt,
    this.dataPreProcessingConfiguration,
    this.datasetArn,
    this.datasetName,
    this.evaluationDataEndTime,
    this.evaluationDataStartTime,
    this.failedReason,
    this.importJobEndTime,
    this.importJobStartTime,
    this.importedDataSizeInBytes,
    this.labelsInputConfiguration,
    this.lastUpdatedTime,
    this.modelArn,
    this.modelDiagnosticsOutputConfiguration,
    this.modelDiagnosticsResultsObject,
    this.modelMetrics,
    this.modelName,
    this.modelQuality,
    this.modelVersion,
    this.modelVersionArn,
    this.offCondition,
    this.priorModelMetrics,
    this.retrainingAvailableDataInDays,
    this.roleArn,
    this.schema,
    this.serverSideKmsKeyId,
    this.sourceModelVersionArn,
    this.sourceType,
    this.status,
    this.trainingDataEndTime,
    this.trainingDataStartTime,
    this.trainingExecutionEndTime,
    this.trainingExecutionStartTime,
  });

  factory DescribeModelVersionResponse.fromJson(Map<String, dynamic> json) {
    return DescribeModelVersionResponse(
      autoPromotionResult:
          (json['AutoPromotionResult'] as String?)?.toAutoPromotionResult(),
      autoPromotionResultReason: json['AutoPromotionResultReason'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      dataPreProcessingConfiguration: json['DataPreProcessingConfiguration'] !=
              null
          ? DataPreProcessingConfiguration.fromJson(
              json['DataPreProcessingConfiguration'] as Map<String, dynamic>)
          : null,
      datasetArn: json['DatasetArn'] as String?,
      datasetName: json['DatasetName'] as String?,
      evaluationDataEndTime: timeStampFromJson(json['EvaluationDataEndTime']),
      evaluationDataStartTime:
          timeStampFromJson(json['EvaluationDataStartTime']),
      failedReason: json['FailedReason'] as String?,
      importJobEndTime: timeStampFromJson(json['ImportJobEndTime']),
      importJobStartTime: timeStampFromJson(json['ImportJobStartTime']),
      importedDataSizeInBytes: json['ImportedDataSizeInBytes'] as int?,
      labelsInputConfiguration: json['LabelsInputConfiguration'] != null
          ? LabelsInputConfiguration.fromJson(
              json['LabelsInputConfiguration'] as Map<String, dynamic>)
          : null,
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      modelArn: json['ModelArn'] as String?,
      modelDiagnosticsOutputConfiguration:
          json['ModelDiagnosticsOutputConfiguration'] != null
              ? ModelDiagnosticsOutputConfiguration.fromJson(
                  json['ModelDiagnosticsOutputConfiguration']
                      as Map<String, dynamic>)
              : null,
      modelDiagnosticsResultsObject:
          json['ModelDiagnosticsResultsObject'] != null
              ? S3Object.fromJson(
                  json['ModelDiagnosticsResultsObject'] as Map<String, dynamic>)
              : null,
      modelMetrics: json['ModelMetrics'] as String?,
      modelName: json['ModelName'] as String?,
      modelQuality: (json['ModelQuality'] as String?)?.toModelQuality(),
      modelVersion: json['ModelVersion'] as int?,
      modelVersionArn: json['ModelVersionArn'] as String?,
      offCondition: json['OffCondition'] as String?,
      priorModelMetrics: json['PriorModelMetrics'] as String?,
      retrainingAvailableDataInDays:
          json['RetrainingAvailableDataInDays'] as int?,
      roleArn: json['RoleArn'] as String?,
      schema: json['Schema'] as String?,
      serverSideKmsKeyId: json['ServerSideKmsKeyId'] as String?,
      sourceModelVersionArn: json['SourceModelVersionArn'] as String?,
      sourceType: (json['SourceType'] as String?)?.toModelVersionSourceType(),
      status: (json['Status'] as String?)?.toModelVersionStatus(),
      trainingDataEndTime: timeStampFromJson(json['TrainingDataEndTime']),
      trainingDataStartTime: timeStampFromJson(json['TrainingDataStartTime']),
      trainingExecutionEndTime:
          timeStampFromJson(json['TrainingExecutionEndTime']),
      trainingExecutionStartTime:
          timeStampFromJson(json['TrainingExecutionStartTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final autoPromotionResult = this.autoPromotionResult;
    final autoPromotionResultReason = this.autoPromotionResultReason;
    final createdAt = this.createdAt;
    final dataPreProcessingConfiguration = this.dataPreProcessingConfiguration;
    final datasetArn = this.datasetArn;
    final datasetName = this.datasetName;
    final evaluationDataEndTime = this.evaluationDataEndTime;
    final evaluationDataStartTime = this.evaluationDataStartTime;
    final failedReason = this.failedReason;
    final importJobEndTime = this.importJobEndTime;
    final importJobStartTime = this.importJobStartTime;
    final importedDataSizeInBytes = this.importedDataSizeInBytes;
    final labelsInputConfiguration = this.labelsInputConfiguration;
    final lastUpdatedTime = this.lastUpdatedTime;
    final modelArn = this.modelArn;
    final modelDiagnosticsOutputConfiguration =
        this.modelDiagnosticsOutputConfiguration;
    final modelDiagnosticsResultsObject = this.modelDiagnosticsResultsObject;
    final modelMetrics = this.modelMetrics;
    final modelName = this.modelName;
    final modelQuality = this.modelQuality;
    final modelVersion = this.modelVersion;
    final modelVersionArn = this.modelVersionArn;
    final offCondition = this.offCondition;
    final priorModelMetrics = this.priorModelMetrics;
    final retrainingAvailableDataInDays = this.retrainingAvailableDataInDays;
    final roleArn = this.roleArn;
    final schema = this.schema;
    final serverSideKmsKeyId = this.serverSideKmsKeyId;
    final sourceModelVersionArn = this.sourceModelVersionArn;
    final sourceType = this.sourceType;
    final status = this.status;
    final trainingDataEndTime = this.trainingDataEndTime;
    final trainingDataStartTime = this.trainingDataStartTime;
    final trainingExecutionEndTime = this.trainingExecutionEndTime;
    final trainingExecutionStartTime = this.trainingExecutionStartTime;
    return {
      if (autoPromotionResult != null)
        'AutoPromotionResult': autoPromotionResult.toValue(),
      if (autoPromotionResultReason != null)
        'AutoPromotionResultReason': autoPromotionResultReason,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (dataPreProcessingConfiguration != null)
        'DataPreProcessingConfiguration': dataPreProcessingConfiguration,
      if (datasetArn != null) 'DatasetArn': datasetArn,
      if (datasetName != null) 'DatasetName': datasetName,
      if (evaluationDataEndTime != null)
        'EvaluationDataEndTime': unixTimestampToJson(evaluationDataEndTime),
      if (evaluationDataStartTime != null)
        'EvaluationDataStartTime': unixTimestampToJson(evaluationDataStartTime),
      if (failedReason != null) 'FailedReason': failedReason,
      if (importJobEndTime != null)
        'ImportJobEndTime': unixTimestampToJson(importJobEndTime),
      if (importJobStartTime != null)
        'ImportJobStartTime': unixTimestampToJson(importJobStartTime),
      if (importedDataSizeInBytes != null)
        'ImportedDataSizeInBytes': importedDataSizeInBytes,
      if (labelsInputConfiguration != null)
        'LabelsInputConfiguration': labelsInputConfiguration,
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (modelArn != null) 'ModelArn': modelArn,
      if (modelDiagnosticsOutputConfiguration != null)
        'ModelDiagnosticsOutputConfiguration':
            modelDiagnosticsOutputConfiguration,
      if (modelDiagnosticsResultsObject != null)
        'ModelDiagnosticsResultsObject': modelDiagnosticsResultsObject,
      if (modelMetrics != null) 'ModelMetrics': modelMetrics,
      if (modelName != null) 'ModelName': modelName,
      if (modelQuality != null) 'ModelQuality': modelQuality.toValue(),
      if (modelVersion != null) 'ModelVersion': modelVersion,
      if (modelVersionArn != null) 'ModelVersionArn': modelVersionArn,
      if (offCondition != null) 'OffCondition': offCondition,
      if (priorModelMetrics != null) 'PriorModelMetrics': priorModelMetrics,
      if (retrainingAvailableDataInDays != null)
        'RetrainingAvailableDataInDays': retrainingAvailableDataInDays,
      if (roleArn != null) 'RoleArn': roleArn,
      if (schema != null) 'Schema': schema,
      if (serverSideKmsKeyId != null) 'ServerSideKmsKeyId': serverSideKmsKeyId,
      if (sourceModelVersionArn != null)
        'SourceModelVersionArn': sourceModelVersionArn,
      if (sourceType != null) 'SourceType': sourceType.toValue(),
      if (status != null) 'Status': status.toValue(),
      if (trainingDataEndTime != null)
        'TrainingDataEndTime': unixTimestampToJson(trainingDataEndTime),
      if (trainingDataStartTime != null)
        'TrainingDataStartTime': unixTimestampToJson(trainingDataStartTime),
      if (trainingExecutionEndTime != null)
        'TrainingExecutionEndTime':
            unixTimestampToJson(trainingExecutionEndTime),
      if (trainingExecutionStartTime != null)
        'TrainingExecutionStartTime':
            unixTimestampToJson(trainingExecutionStartTime),
    };
  }
}

class DescribeResourcePolicyResponse {
  /// The time when the resource policy was created.
  final DateTime? creationTime;

  /// The time when the resource policy was last modified.
  final DateTime? lastModifiedTime;

  /// A unique identifier for a revision of the resource policy.
  final String? policyRevisionId;

  /// The resource policy in a JSON-formatted string.
  final String? resourcePolicy;

  DescribeResourcePolicyResponse({
    this.creationTime,
    this.lastModifiedTime,
    this.policyRevisionId,
    this.resourcePolicy,
  });

  factory DescribeResourcePolicyResponse.fromJson(Map<String, dynamic> json) {
    return DescribeResourcePolicyResponse(
      creationTime: timeStampFromJson(json['CreationTime']),
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      policyRevisionId: json['PolicyRevisionId'] as String?,
      resourcePolicy: json['ResourcePolicy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final lastModifiedTime = this.lastModifiedTime;
    final policyRevisionId = this.policyRevisionId;
    final resourcePolicy = this.resourcePolicy;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (policyRevisionId != null) 'PolicyRevisionId': policyRevisionId,
      if (resourcePolicy != null) 'ResourcePolicy': resourcePolicy,
    };
  }
}

class DescribeRetrainingSchedulerResponse {
  /// Indicates the time and date at which the retraining scheduler was created.
  final DateTime? createdAt;

  /// The number of past days of data used for retraining.
  final String? lookbackWindow;

  /// The ARN of the model that the retraining scheduler is attached to.
  final String? modelArn;

  /// The name of the model that the retraining scheduler is attached to.
  final String? modelName;

  /// Indicates how the service uses new models. In <code>MANAGED</code> mode, new
  /// models are used for inference if they have better performance than the
  /// current model. In <code>MANUAL</code> mode, the new models are not used
  /// until they are <a
  /// href="https://docs.aws.amazon.com/lookout-for-equipment/latest/ug/versioning-model.html#model-activation">manually
  /// activated</a>.
  final ModelPromoteMode? promoteMode;

  /// The frequency at which the model retraining is set. This follows the <a
  /// href="https://en.wikipedia.org/wiki/ISO_8601#Durations">ISO 8601</a>
  /// guidelines.
  final String? retrainingFrequency;

  /// The start date for the retraining scheduler. Lookout for Equipment truncates
  /// the time you provide to the nearest UTC day.
  final DateTime? retrainingStartDate;

  /// The status of the retraining scheduler.
  final RetrainingSchedulerStatus? status;

  /// Indicates the time and date at which the retraining scheduler was updated.
  final DateTime? updatedAt;

  DescribeRetrainingSchedulerResponse({
    this.createdAt,
    this.lookbackWindow,
    this.modelArn,
    this.modelName,
    this.promoteMode,
    this.retrainingFrequency,
    this.retrainingStartDate,
    this.status,
    this.updatedAt,
  });

  factory DescribeRetrainingSchedulerResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeRetrainingSchedulerResponse(
      createdAt: timeStampFromJson(json['CreatedAt']),
      lookbackWindow: json['LookbackWindow'] as String?,
      modelArn: json['ModelArn'] as String?,
      modelName: json['ModelName'] as String?,
      promoteMode: (json['PromoteMode'] as String?)?.toModelPromoteMode(),
      retrainingFrequency: json['RetrainingFrequency'] as String?,
      retrainingStartDate: timeStampFromJson(json['RetrainingStartDate']),
      status: (json['Status'] as String?)?.toRetrainingSchedulerStatus(),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final lookbackWindow = this.lookbackWindow;
    final modelArn = this.modelArn;
    final modelName = this.modelName;
    final promoteMode = this.promoteMode;
    final retrainingFrequency = this.retrainingFrequency;
    final retrainingStartDate = this.retrainingStartDate;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (lookbackWindow != null) 'LookbackWindow': lookbackWindow,
      if (modelArn != null) 'ModelArn': modelArn,
      if (modelName != null) 'ModelName': modelName,
      if (promoteMode != null) 'PromoteMode': promoteMode.toValue(),
      if (retrainingFrequency != null)
        'RetrainingFrequency': retrainingFrequency,
      if (retrainingStartDate != null)
        'RetrainingStartDate': unixTimestampToJson(retrainingStartDate),
      if (status != null) 'Status': status.toValue(),
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// Entity that comprises information abount duplicate timestamps in the
/// dataset.
class DuplicateTimestamps {
  /// Indicates the total number of duplicate timestamps.
  final int totalNumberOfDuplicateTimestamps;

  DuplicateTimestamps({
    required this.totalNumberOfDuplicateTimestamps,
  });

  factory DuplicateTimestamps.fromJson(Map<String, dynamic> json) {
    return DuplicateTimestamps(
      totalNumberOfDuplicateTimestamps:
          json['TotalNumberOfDuplicateTimestamps'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final totalNumberOfDuplicateTimestamps =
        this.totalNumberOfDuplicateTimestamps;
    return {
      'TotalNumberOfDuplicateTimestamps': totalNumberOfDuplicateTimestamps,
    };
  }
}

class ImportDatasetResponse {
  /// The Amazon Resource Name (ARN) of the dataset that was imported.
  final String? datasetArn;

  /// The name of the created machine learning dataset.
  final String? datasetName;

  /// A unique identifier for the job of importing the dataset.
  final String? jobId;

  /// The status of the <code>ImportDataset</code> operation.
  final DatasetStatus? status;

  ImportDatasetResponse({
    this.datasetArn,
    this.datasetName,
    this.jobId,
    this.status,
  });

  factory ImportDatasetResponse.fromJson(Map<String, dynamic> json) {
    return ImportDatasetResponse(
      datasetArn: json['DatasetArn'] as String?,
      datasetName: json['DatasetName'] as String?,
      jobId: json['JobId'] as String?,
      status: (json['Status'] as String?)?.toDatasetStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final datasetArn = this.datasetArn;
    final datasetName = this.datasetName;
    final jobId = this.jobId;
    final status = this.status;
    return {
      if (datasetArn != null) 'DatasetArn': datasetArn,
      if (datasetName != null) 'DatasetName': datasetName,
      if (jobId != null) 'JobId': jobId,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

class ImportModelVersionResponse {
  /// The Amazon Resource Name (ARN) of the model being created.
  final String? modelArn;

  /// The name for the machine learning model.
  final String? modelName;

  /// The version of the model being created.
  final int? modelVersion;

  /// The Amazon Resource Name (ARN) of the model version being created.
  final String? modelVersionArn;

  /// The status of the <code>ImportModelVersion</code> operation.
  final ModelVersionStatus? status;

  ImportModelVersionResponse({
    this.modelArn,
    this.modelName,
    this.modelVersion,
    this.modelVersionArn,
    this.status,
  });

  factory ImportModelVersionResponse.fromJson(Map<String, dynamic> json) {
    return ImportModelVersionResponse(
      modelArn: json['ModelArn'] as String?,
      modelName: json['ModelName'] as String?,
      modelVersion: json['ModelVersion'] as int?,
      modelVersionArn: json['ModelVersionArn'] as String?,
      status: (json['Status'] as String?)?.toModelVersionStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final modelArn = this.modelArn;
    final modelName = this.modelName;
    final modelVersion = this.modelVersion;
    final modelVersionArn = this.modelVersionArn;
    final status = this.status;
    return {
      if (modelArn != null) 'ModelArn': modelArn,
      if (modelName != null) 'ModelName': modelName,
      if (modelVersion != null) 'ModelVersion': modelVersion,
      if (modelVersionArn != null) 'ModelVersionArn': modelVersionArn,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum InferenceDataImportStrategy {
  noImport,
  addWhenEmpty,
  overwrite,
}

extension InferenceDataImportStrategyValueExtension
    on InferenceDataImportStrategy {
  String toValue() {
    switch (this) {
      case InferenceDataImportStrategy.noImport:
        return 'NO_IMPORT';
      case InferenceDataImportStrategy.addWhenEmpty:
        return 'ADD_WHEN_EMPTY';
      case InferenceDataImportStrategy.overwrite:
        return 'OVERWRITE';
    }
  }
}

extension InferenceDataImportStrategyFromString on String {
  InferenceDataImportStrategy toInferenceDataImportStrategy() {
    switch (this) {
      case 'NO_IMPORT':
        return InferenceDataImportStrategy.noImport;
      case 'ADD_WHEN_EMPTY':
        return InferenceDataImportStrategy.addWhenEmpty;
      case 'OVERWRITE':
        return InferenceDataImportStrategy.overwrite;
    }
    throw Exception('$this is not known in enum InferenceDataImportStrategy');
  }
}

/// Contains information about the specific inference event, including start and
/// end time, diagnostics information, event duration and so on.
class InferenceEventSummary {
  /// An array which specifies the names and values of all sensors contributing to
  /// an inference event.
  final String? diagnostics;

  /// Indicates the size of an inference event in seconds.
  final int? eventDurationInSeconds;

  /// Indicates the ending time of an inference event.
  final DateTime? eventEndTime;

  /// Indicates the starting time of an inference event.
  final DateTime? eventStartTime;

  /// The Amazon Resource Name (ARN) of the inference scheduler being used for the
  /// inference event.
  final String? inferenceSchedulerArn;

  /// The name of the inference scheduler being used for the inference events.
  final String? inferenceSchedulerName;

  InferenceEventSummary({
    this.diagnostics,
    this.eventDurationInSeconds,
    this.eventEndTime,
    this.eventStartTime,
    this.inferenceSchedulerArn,
    this.inferenceSchedulerName,
  });

  factory InferenceEventSummary.fromJson(Map<String, dynamic> json) {
    return InferenceEventSummary(
      diagnostics: json['Diagnostics'] as String?,
      eventDurationInSeconds: json['EventDurationInSeconds'] as int?,
      eventEndTime: timeStampFromJson(json['EventEndTime']),
      eventStartTime: timeStampFromJson(json['EventStartTime']),
      inferenceSchedulerArn: json['InferenceSchedulerArn'] as String?,
      inferenceSchedulerName: json['InferenceSchedulerName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final diagnostics = this.diagnostics;
    final eventDurationInSeconds = this.eventDurationInSeconds;
    final eventEndTime = this.eventEndTime;
    final eventStartTime = this.eventStartTime;
    final inferenceSchedulerArn = this.inferenceSchedulerArn;
    final inferenceSchedulerName = this.inferenceSchedulerName;
    return {
      if (diagnostics != null) 'Diagnostics': diagnostics,
      if (eventDurationInSeconds != null)
        'EventDurationInSeconds': eventDurationInSeconds,
      if (eventEndTime != null)
        'EventEndTime': unixTimestampToJson(eventEndTime),
      if (eventStartTime != null)
        'EventStartTime': unixTimestampToJson(eventStartTime),
      if (inferenceSchedulerArn != null)
        'InferenceSchedulerArn': inferenceSchedulerArn,
      if (inferenceSchedulerName != null)
        'InferenceSchedulerName': inferenceSchedulerName,
    };
  }
}

enum InferenceExecutionStatus {
  inProgress,
  success,
  failed,
}

extension InferenceExecutionStatusValueExtension on InferenceExecutionStatus {
  String toValue() {
    switch (this) {
      case InferenceExecutionStatus.inProgress:
        return 'IN_PROGRESS';
      case InferenceExecutionStatus.success:
        return 'SUCCESS';
      case InferenceExecutionStatus.failed:
        return 'FAILED';
    }
  }
}

extension InferenceExecutionStatusFromString on String {
  InferenceExecutionStatus toInferenceExecutionStatus() {
    switch (this) {
      case 'IN_PROGRESS':
        return InferenceExecutionStatus.inProgress;
      case 'SUCCESS':
        return InferenceExecutionStatus.success;
      case 'FAILED':
        return InferenceExecutionStatus.failed;
    }
    throw Exception('$this is not known in enum InferenceExecutionStatus');
  }
}

/// Contains information about the specific inference execution, including input
/// and output data configuration, inference scheduling information, status, and
/// so on.
class InferenceExecutionSummary {
  /// The S3 object that the inference execution results were uploaded to.
  final S3Object? customerResultObject;

  /// Indicates the time reference in the dataset at which the inference execution
  /// stopped.
  final DateTime? dataEndTime;

  /// Specifies configuration information for the input data for the inference
  /// scheduler, including delimiter, format, and dataset location.
  final InferenceInputConfiguration? dataInputConfiguration;

  /// Specifies configuration information for the output results from for the
  /// inference execution, including the output Amazon S3 location.
  final InferenceOutputConfiguration? dataOutputConfiguration;

  /// Indicates the time reference in the dataset at which the inference execution
  /// began.
  final DateTime? dataStartTime;

  /// Specifies the reason for failure when an inference execution has failed.
  final String? failedReason;

  /// The Amazon Resource Name (ARN) of the inference scheduler being used for the
  /// inference execution.
  final String? inferenceSchedulerArn;

  /// The name of the inference scheduler being used for the inference execution.
  final String? inferenceSchedulerName;

  /// The Amazon Resource Name (ARN) of the machine learning model used for the
  /// inference execution.
  final String? modelArn;

  /// The name of the machine learning model being used for the inference
  /// execution.
  final String? modelName;

  /// The model version used for the inference execution.
  final int? modelVersion;

  /// The Amazon Resource Number (ARN) of the model version used for the inference
  /// execution.
  final String? modelVersionArn;

  /// Indicates the start time at which the inference scheduler began the specific
  /// inference execution.
  final DateTime? scheduledStartTime;

  /// Indicates the status of the inference execution.
  final InferenceExecutionStatus? status;

  InferenceExecutionSummary({
    this.customerResultObject,
    this.dataEndTime,
    this.dataInputConfiguration,
    this.dataOutputConfiguration,
    this.dataStartTime,
    this.failedReason,
    this.inferenceSchedulerArn,
    this.inferenceSchedulerName,
    this.modelArn,
    this.modelName,
    this.modelVersion,
    this.modelVersionArn,
    this.scheduledStartTime,
    this.status,
  });

  factory InferenceExecutionSummary.fromJson(Map<String, dynamic> json) {
    return InferenceExecutionSummary(
      customerResultObject: json['CustomerResultObject'] != null
          ? S3Object.fromJson(
              json['CustomerResultObject'] as Map<String, dynamic>)
          : null,
      dataEndTime: timeStampFromJson(json['DataEndTime']),
      dataInputConfiguration: json['DataInputConfiguration'] != null
          ? InferenceInputConfiguration.fromJson(
              json['DataInputConfiguration'] as Map<String, dynamic>)
          : null,
      dataOutputConfiguration: json['DataOutputConfiguration'] != null
          ? InferenceOutputConfiguration.fromJson(
              json['DataOutputConfiguration'] as Map<String, dynamic>)
          : null,
      dataStartTime: timeStampFromJson(json['DataStartTime']),
      failedReason: json['FailedReason'] as String?,
      inferenceSchedulerArn: json['InferenceSchedulerArn'] as String?,
      inferenceSchedulerName: json['InferenceSchedulerName'] as String?,
      modelArn: json['ModelArn'] as String?,
      modelName: json['ModelName'] as String?,
      modelVersion: json['ModelVersion'] as int?,
      modelVersionArn: json['ModelVersionArn'] as String?,
      scheduledStartTime: timeStampFromJson(json['ScheduledStartTime']),
      status: (json['Status'] as String?)?.toInferenceExecutionStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final customerResultObject = this.customerResultObject;
    final dataEndTime = this.dataEndTime;
    final dataInputConfiguration = this.dataInputConfiguration;
    final dataOutputConfiguration = this.dataOutputConfiguration;
    final dataStartTime = this.dataStartTime;
    final failedReason = this.failedReason;
    final inferenceSchedulerArn = this.inferenceSchedulerArn;
    final inferenceSchedulerName = this.inferenceSchedulerName;
    final modelArn = this.modelArn;
    final modelName = this.modelName;
    final modelVersion = this.modelVersion;
    final modelVersionArn = this.modelVersionArn;
    final scheduledStartTime = this.scheduledStartTime;
    final status = this.status;
    return {
      if (customerResultObject != null)
        'CustomerResultObject': customerResultObject,
      if (dataEndTime != null) 'DataEndTime': unixTimestampToJson(dataEndTime),
      if (dataInputConfiguration != null)
        'DataInputConfiguration': dataInputConfiguration,
      if (dataOutputConfiguration != null)
        'DataOutputConfiguration': dataOutputConfiguration,
      if (dataStartTime != null)
        'DataStartTime': unixTimestampToJson(dataStartTime),
      if (failedReason != null) 'FailedReason': failedReason,
      if (inferenceSchedulerArn != null)
        'InferenceSchedulerArn': inferenceSchedulerArn,
      if (inferenceSchedulerName != null)
        'InferenceSchedulerName': inferenceSchedulerName,
      if (modelArn != null) 'ModelArn': modelArn,
      if (modelName != null) 'ModelName': modelName,
      if (modelVersion != null) 'ModelVersion': modelVersion,
      if (modelVersionArn != null) 'ModelVersionArn': modelVersionArn,
      if (scheduledStartTime != null)
        'ScheduledStartTime': unixTimestampToJson(scheduledStartTime),
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// Specifies configuration information for the input data for the inference,
/// including Amazon S3 location of input data..
class InferenceInputConfiguration {
  /// Specifies configuration information for the input data for the inference,
  /// including timestamp format and delimiter.
  final InferenceInputNameConfiguration? inferenceInputNameConfiguration;

  /// Indicates the difference between your time zone and Coordinated Universal
  /// Time (UTC).
  final String? inputTimeZoneOffset;

  /// Specifies configuration information for the input data for the inference,
  /// including Amazon S3 location of input data.
  final InferenceS3InputConfiguration? s3InputConfiguration;

  InferenceInputConfiguration({
    this.inferenceInputNameConfiguration,
    this.inputTimeZoneOffset,
    this.s3InputConfiguration,
  });

  factory InferenceInputConfiguration.fromJson(Map<String, dynamic> json) {
    return InferenceInputConfiguration(
      inferenceInputNameConfiguration:
          json['InferenceInputNameConfiguration'] != null
              ? InferenceInputNameConfiguration.fromJson(
                  json['InferenceInputNameConfiguration']
                      as Map<String, dynamic>)
              : null,
      inputTimeZoneOffset: json['InputTimeZoneOffset'] as String?,
      s3InputConfiguration: json['S3InputConfiguration'] != null
          ? InferenceS3InputConfiguration.fromJson(
              json['S3InputConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final inferenceInputNameConfiguration =
        this.inferenceInputNameConfiguration;
    final inputTimeZoneOffset = this.inputTimeZoneOffset;
    final s3InputConfiguration = this.s3InputConfiguration;
    return {
      if (inferenceInputNameConfiguration != null)
        'InferenceInputNameConfiguration': inferenceInputNameConfiguration,
      if (inputTimeZoneOffset != null)
        'InputTimeZoneOffset': inputTimeZoneOffset,
      if (s3InputConfiguration != null)
        'S3InputConfiguration': s3InputConfiguration,
    };
  }
}

/// Specifies configuration information for the input data for the inference,
/// including timestamp format and delimiter.
class InferenceInputNameConfiguration {
  /// Indicates the delimiter character used between items in the data.
  final String? componentTimestampDelimiter;

  /// The format of the timestamp, whether Epoch time, or standard, with or
  /// without hyphens (-).
  final String? timestampFormat;

  InferenceInputNameConfiguration({
    this.componentTimestampDelimiter,
    this.timestampFormat,
  });

  factory InferenceInputNameConfiguration.fromJson(Map<String, dynamic> json) {
    return InferenceInputNameConfiguration(
      componentTimestampDelimiter:
          json['ComponentTimestampDelimiter'] as String?,
      timestampFormat: json['TimestampFormat'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final componentTimestampDelimiter = this.componentTimestampDelimiter;
    final timestampFormat = this.timestampFormat;
    return {
      if (componentTimestampDelimiter != null)
        'ComponentTimestampDelimiter': componentTimestampDelimiter,
      if (timestampFormat != null) 'TimestampFormat': timestampFormat,
    };
  }
}

/// Specifies configuration information for the output results from for the
/// inference, including KMS key ID and output S3 location.
class InferenceOutputConfiguration {
  /// Specifies configuration information for the output results from for the
  /// inference, output S3 location.
  final InferenceS3OutputConfiguration s3OutputConfiguration;

  /// The ID number for the KMS key key used to encrypt the inference output.
  final String? kmsKeyId;

  InferenceOutputConfiguration({
    required this.s3OutputConfiguration,
    this.kmsKeyId,
  });

  factory InferenceOutputConfiguration.fromJson(Map<String, dynamic> json) {
    return InferenceOutputConfiguration(
      s3OutputConfiguration: InferenceS3OutputConfiguration.fromJson(
          json['S3OutputConfiguration'] as Map<String, dynamic>),
      kmsKeyId: json['KmsKeyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3OutputConfiguration = this.s3OutputConfiguration;
    final kmsKeyId = this.kmsKeyId;
    return {
      'S3OutputConfiguration': s3OutputConfiguration,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
    };
  }
}

/// Specifies configuration information for the input data for the inference,
/// including input data S3 location.
class InferenceS3InputConfiguration {
  /// The bucket containing the input dataset for the inference.
  final String bucket;

  /// The prefix for the S3 bucket used for the input data for the inference.
  final String? prefix;

  InferenceS3InputConfiguration({
    required this.bucket,
    this.prefix,
  });

  factory InferenceS3InputConfiguration.fromJson(Map<String, dynamic> json) {
    return InferenceS3InputConfiguration(
      bucket: json['Bucket'] as String,
      prefix: json['Prefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final prefix = this.prefix;
    return {
      'Bucket': bucket,
      if (prefix != null) 'Prefix': prefix,
    };
  }
}

/// Specifies configuration information for the output results from the
/// inference, including output S3 location.
class InferenceS3OutputConfiguration {
  /// The bucket containing the output results from the inference
  final String bucket;

  /// The prefix for the S3 bucket used for the output results from the inference.
  final String? prefix;

  InferenceS3OutputConfiguration({
    required this.bucket,
    this.prefix,
  });

  factory InferenceS3OutputConfiguration.fromJson(Map<String, dynamic> json) {
    return InferenceS3OutputConfiguration(
      bucket: json['Bucket'] as String,
      prefix: json['Prefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final prefix = this.prefix;
    return {
      'Bucket': bucket,
      if (prefix != null) 'Prefix': prefix,
    };
  }
}

enum InferenceSchedulerStatus {
  pending,
  running,
  stopping,
  stopped,
}

extension InferenceSchedulerStatusValueExtension on InferenceSchedulerStatus {
  String toValue() {
    switch (this) {
      case InferenceSchedulerStatus.pending:
        return 'PENDING';
      case InferenceSchedulerStatus.running:
        return 'RUNNING';
      case InferenceSchedulerStatus.stopping:
        return 'STOPPING';
      case InferenceSchedulerStatus.stopped:
        return 'STOPPED';
    }
  }
}

extension InferenceSchedulerStatusFromString on String {
  InferenceSchedulerStatus toInferenceSchedulerStatus() {
    switch (this) {
      case 'PENDING':
        return InferenceSchedulerStatus.pending;
      case 'RUNNING':
        return InferenceSchedulerStatus.running;
      case 'STOPPING':
        return InferenceSchedulerStatus.stopping;
      case 'STOPPED':
        return InferenceSchedulerStatus.stopped;
    }
    throw Exception('$this is not known in enum InferenceSchedulerStatus');
  }
}

/// Contains information about the specific inference scheduler, including data
/// delay offset, model name and ARN, status, and so on.
class InferenceSchedulerSummary {
  /// A period of time (in minutes) by which inference on the data is delayed
  /// after the data starts. For instance, if an offset delay time of five minutes
  /// was selected, inference will not begin on the data until the first data
  /// measurement after the five minute mark. For example, if five minutes is
  /// selected, the inference scheduler will wake up at the configured frequency
  /// with the additional five minute delay time to check the customer S3 bucket.
  /// The customer can upload data at the same frequency and they don't need to
  /// stop and restart the scheduler when uploading new data.
  final int? dataDelayOffsetInMinutes;

  /// How often data is uploaded to the source S3 bucket for the input data. This
  /// value is the length of time between data uploads. For instance, if you
  /// select 5 minutes, Amazon Lookout for Equipment will upload the real-time
  /// data to the source bucket once every 5 minutes. This frequency also
  /// determines how often Amazon Lookout for Equipment starts a scheduled
  /// inference on your data. In this example, it starts once every 5 minutes.
  final DataUploadFrequency? dataUploadFrequency;

  /// The Amazon Resource Name (ARN) of the inference scheduler.
  final String? inferenceSchedulerArn;

  /// The name of the inference scheduler.
  final String? inferenceSchedulerName;

  /// Indicates whether the latest execution for the inference scheduler was
  /// Anomalous (anomalous events found) or Normal (no anomalous events found).
  final LatestInferenceResult? latestInferenceResult;

  /// The Amazon Resource Name (ARN) of the machine learning model used by the
  /// inference scheduler.
  final String? modelArn;

  /// The name of the machine learning model used for the inference scheduler.
  final String? modelName;

  /// Indicates the status of the inference scheduler.
  final InferenceSchedulerStatus? status;

  InferenceSchedulerSummary({
    this.dataDelayOffsetInMinutes,
    this.dataUploadFrequency,
    this.inferenceSchedulerArn,
    this.inferenceSchedulerName,
    this.latestInferenceResult,
    this.modelArn,
    this.modelName,
    this.status,
  });

  factory InferenceSchedulerSummary.fromJson(Map<String, dynamic> json) {
    return InferenceSchedulerSummary(
      dataDelayOffsetInMinutes: json['DataDelayOffsetInMinutes'] as int?,
      dataUploadFrequency:
          (json['DataUploadFrequency'] as String?)?.toDataUploadFrequency(),
      inferenceSchedulerArn: json['InferenceSchedulerArn'] as String?,
      inferenceSchedulerName: json['InferenceSchedulerName'] as String?,
      latestInferenceResult:
          (json['LatestInferenceResult'] as String?)?.toLatestInferenceResult(),
      modelArn: json['ModelArn'] as String?,
      modelName: json['ModelName'] as String?,
      status: (json['Status'] as String?)?.toInferenceSchedulerStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final dataDelayOffsetInMinutes = this.dataDelayOffsetInMinutes;
    final dataUploadFrequency = this.dataUploadFrequency;
    final inferenceSchedulerArn = this.inferenceSchedulerArn;
    final inferenceSchedulerName = this.inferenceSchedulerName;
    final latestInferenceResult = this.latestInferenceResult;
    final modelArn = this.modelArn;
    final modelName = this.modelName;
    final status = this.status;
    return {
      if (dataDelayOffsetInMinutes != null)
        'DataDelayOffsetInMinutes': dataDelayOffsetInMinutes,
      if (dataUploadFrequency != null)
        'DataUploadFrequency': dataUploadFrequency.toValue(),
      if (inferenceSchedulerArn != null)
        'InferenceSchedulerArn': inferenceSchedulerArn,
      if (inferenceSchedulerName != null)
        'InferenceSchedulerName': inferenceSchedulerName,
      if (latestInferenceResult != null)
        'LatestInferenceResult': latestInferenceResult.toValue(),
      if (modelArn != null) 'ModelArn': modelArn,
      if (modelName != null) 'ModelName': modelName,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// Gives statistics about how many files have been ingested, and which files
/// have not been ingested, for a particular ingestion job.
class IngestedFilesSummary {
  /// Indicates the number of files that were successfully ingested.
  final int ingestedNumberOfFiles;

  /// Indicates the total number of files that were submitted for ingestion.
  final int totalNumberOfFiles;

  /// Indicates the number of files that were discarded. A file could be discarded
  /// because its format is invalid (for example, a jpg or pdf) or not readable.
  final List<S3Object>? discardedFiles;

  IngestedFilesSummary({
    required this.ingestedNumberOfFiles,
    required this.totalNumberOfFiles,
    this.discardedFiles,
  });

  factory IngestedFilesSummary.fromJson(Map<String, dynamic> json) {
    return IngestedFilesSummary(
      ingestedNumberOfFiles: json['IngestedNumberOfFiles'] as int,
      totalNumberOfFiles: json['TotalNumberOfFiles'] as int,
      discardedFiles: (json['DiscardedFiles'] as List?)
          ?.whereNotNull()
          .map((e) => S3Object.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final ingestedNumberOfFiles = this.ingestedNumberOfFiles;
    final totalNumberOfFiles = this.totalNumberOfFiles;
    final discardedFiles = this.discardedFiles;
    return {
      'IngestedNumberOfFiles': ingestedNumberOfFiles,
      'TotalNumberOfFiles': totalNumberOfFiles,
      if (discardedFiles != null) 'DiscardedFiles': discardedFiles,
    };
  }
}

/// Specifies configuration information for the input data for the data
/// ingestion job, including input data S3 location.
class IngestionInputConfiguration {
  /// The location information for the S3 bucket used for input data for the data
  /// ingestion.
  final IngestionS3InputConfiguration s3InputConfiguration;

  IngestionInputConfiguration({
    required this.s3InputConfiguration,
  });

  factory IngestionInputConfiguration.fromJson(Map<String, dynamic> json) {
    return IngestionInputConfiguration(
      s3InputConfiguration: IngestionS3InputConfiguration.fromJson(
          json['S3InputConfiguration'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final s3InputConfiguration = this.s3InputConfiguration;
    return {
      'S3InputConfiguration': s3InputConfiguration,
    };
  }
}

enum IngestionJobStatus {
  inProgress,
  success,
  failed,
  importInProgress,
}

extension IngestionJobStatusValueExtension on IngestionJobStatus {
  String toValue() {
    switch (this) {
      case IngestionJobStatus.inProgress:
        return 'IN_PROGRESS';
      case IngestionJobStatus.success:
        return 'SUCCESS';
      case IngestionJobStatus.failed:
        return 'FAILED';
      case IngestionJobStatus.importInProgress:
        return 'IMPORT_IN_PROGRESS';
    }
  }
}

extension IngestionJobStatusFromString on String {
  IngestionJobStatus toIngestionJobStatus() {
    switch (this) {
      case 'IN_PROGRESS':
        return IngestionJobStatus.inProgress;
      case 'SUCCESS':
        return IngestionJobStatus.success;
      case 'FAILED':
        return IngestionJobStatus.failed;
      case 'IMPORT_IN_PROGRESS':
        return IngestionJobStatus.importInProgress;
    }
    throw Exception('$this is not known in enum IngestionJobStatus');
  }
}

/// Specifies S3 configuration information for the input data for the data
/// ingestion job.
class IngestionS3InputConfiguration {
  /// The name of the S3 bucket used for the input data for the data ingestion.
  final String bucket;

  /// The pattern for matching the Amazon S3 files that will be used for
  /// ingestion. If the schema was created previously without any KeyPattern, then
  /// the default KeyPattern {prefix}/{component_name}/* is used to download files
  /// from Amazon S3 according to the schema. This field is required when
  /// ingestion is being done for the first time.
  ///
  /// Valid Values: {prefix}/{component_name}_* | {prefix}/{component_name}/* |
  /// {prefix}/{component_name}[DELIMITER]* (Allowed delimiters : space, dot,
  /// underscore, hyphen)
  final String? keyPattern;

  /// The prefix for the S3 location being used for the input data for the data
  /// ingestion.
  final String? prefix;

  IngestionS3InputConfiguration({
    required this.bucket,
    this.keyPattern,
    this.prefix,
  });

  factory IngestionS3InputConfiguration.fromJson(Map<String, dynamic> json) {
    return IngestionS3InputConfiguration(
      bucket: json['Bucket'] as String,
      keyPattern: json['KeyPattern'] as String?,
      prefix: json['Prefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final keyPattern = this.keyPattern;
    final prefix = this.prefix;
    return {
      'Bucket': bucket,
      if (keyPattern != null) 'KeyPattern': keyPattern,
      if (prefix != null) 'Prefix': prefix,
    };
  }
}

/// Entity that comprises aggregated information on sensors having insufficient
/// data.
class InsufficientSensorData {
  /// Parameter that describes the total number of sensors that have data
  /// completely missing for it.
  final MissingCompleteSensorData missingCompleteSensorData;

  /// Parameter that describes the total number of sensors that have a short date
  /// range of less than 14 days of data overall.
  final SensorsWithShortDateRange sensorsWithShortDateRange;

  InsufficientSensorData({
    required this.missingCompleteSensorData,
    required this.sensorsWithShortDateRange,
  });

  factory InsufficientSensorData.fromJson(Map<String, dynamic> json) {
    return InsufficientSensorData(
      missingCompleteSensorData: MissingCompleteSensorData.fromJson(
          json['MissingCompleteSensorData'] as Map<String, dynamic>),
      sensorsWithShortDateRange: SensorsWithShortDateRange.fromJson(
          json['SensorsWithShortDateRange'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final missingCompleteSensorData = this.missingCompleteSensorData;
    final sensorsWithShortDateRange = this.sensorsWithShortDateRange;
    return {
      'MissingCompleteSensorData': missingCompleteSensorData,
      'SensorsWithShortDateRange': sensorsWithShortDateRange,
    };
  }
}

/// Entity that comprises aggregated information on sensors having insufficient
/// data.
class InvalidSensorData {
  /// Indicates the number of sensors that have at least some invalid values.
  final int affectedSensorCount;

  /// Indicates the total number of invalid values across all the sensors.
  final int totalNumberOfInvalidValues;

  InvalidSensorData({
    required this.affectedSensorCount,
    required this.totalNumberOfInvalidValues,
  });

  factory InvalidSensorData.fromJson(Map<String, dynamic> json) {
    return InvalidSensorData(
      affectedSensorCount: json['AffectedSensorCount'] as int,
      totalNumberOfInvalidValues: json['TotalNumberOfInvalidValues'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final affectedSensorCount = this.affectedSensorCount;
    final totalNumberOfInvalidValues = this.totalNumberOfInvalidValues;
    return {
      'AffectedSensorCount': affectedSensorCount,
      'TotalNumberOfInvalidValues': totalNumberOfInvalidValues,
    };
  }
}

/// Contains information about the label group.
class LabelGroupSummary {
  /// The time at which the label group was created.
  final DateTime? createdAt;

  /// The Amazon Resource Name (ARN) of the label group.
  final String? labelGroupArn;

  /// The name of the label group.
  final String? labelGroupName;

  /// The time at which the label group was updated.
  final DateTime? updatedAt;

  LabelGroupSummary({
    this.createdAt,
    this.labelGroupArn,
    this.labelGroupName,
    this.updatedAt,
  });

  factory LabelGroupSummary.fromJson(Map<String, dynamic> json) {
    return LabelGroupSummary(
      createdAt: timeStampFromJson(json['CreatedAt']),
      labelGroupArn: json['LabelGroupArn'] as String?,
      labelGroupName: json['LabelGroupName'] as String?,
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final labelGroupArn = this.labelGroupArn;
    final labelGroupName = this.labelGroupName;
    final updatedAt = this.updatedAt;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (labelGroupArn != null) 'LabelGroupArn': labelGroupArn,
      if (labelGroupName != null) 'LabelGroupName': labelGroupName,
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

enum LabelRating {
  anomaly,
  noAnomaly,
  neutral,
}

extension LabelRatingValueExtension on LabelRating {
  String toValue() {
    switch (this) {
      case LabelRating.anomaly:
        return 'ANOMALY';
      case LabelRating.noAnomaly:
        return 'NO_ANOMALY';
      case LabelRating.neutral:
        return 'NEUTRAL';
    }
  }
}

extension LabelRatingFromString on String {
  LabelRating toLabelRating() {
    switch (this) {
      case 'ANOMALY':
        return LabelRating.anomaly;
      case 'NO_ANOMALY':
        return LabelRating.noAnomaly;
      case 'NEUTRAL':
        return LabelRating.neutral;
    }
    throw Exception('$this is not known in enum LabelRating');
  }
}

/// Information about the label.
class LabelSummary {
  /// The time at which the label was created.
  final DateTime? createdAt;

  /// The timestamp indicating the end of the label.
  final DateTime? endTime;

  /// Indicates that a label pertains to a particular piece of equipment.
  final String? equipment;

  /// Indicates the type of anomaly associated with the label.
  ///
  /// Data in this field will be retained for service usage. Follow best practices
  /// for the security of your data.
  final String? faultCode;

  /// The Amazon Resource Name (ARN) of the label group.
  final String? labelGroupArn;

  /// The name of the label group.
  final String? labelGroupName;

  /// The ID of the label.
  final String? labelId;

  /// Indicates whether a labeled event represents an anomaly.
  final LabelRating? rating;

  /// The timestamp indicating the start of the label.
  final DateTime? startTime;

  LabelSummary({
    this.createdAt,
    this.endTime,
    this.equipment,
    this.faultCode,
    this.labelGroupArn,
    this.labelGroupName,
    this.labelId,
    this.rating,
    this.startTime,
  });

  factory LabelSummary.fromJson(Map<String, dynamic> json) {
    return LabelSummary(
      createdAt: timeStampFromJson(json['CreatedAt']),
      endTime: timeStampFromJson(json['EndTime']),
      equipment: json['Equipment'] as String?,
      faultCode: json['FaultCode'] as String?,
      labelGroupArn: json['LabelGroupArn'] as String?,
      labelGroupName: json['LabelGroupName'] as String?,
      labelId: json['LabelId'] as String?,
      rating: (json['Rating'] as String?)?.toLabelRating(),
      startTime: timeStampFromJson(json['StartTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final endTime = this.endTime;
    final equipment = this.equipment;
    final faultCode = this.faultCode;
    final labelGroupArn = this.labelGroupArn;
    final labelGroupName = this.labelGroupName;
    final labelId = this.labelId;
    final rating = this.rating;
    final startTime = this.startTime;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (equipment != null) 'Equipment': equipment,
      if (faultCode != null) 'FaultCode': faultCode,
      if (labelGroupArn != null) 'LabelGroupArn': labelGroupArn,
      if (labelGroupName != null) 'LabelGroupName': labelGroupName,
      if (labelId != null) 'LabelId': labelId,
      if (rating != null) 'Rating': rating.toValue(),
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
    };
  }
}

/// Contains the configuration information for the S3 location being used to
/// hold label data.
class LabelsInputConfiguration {
  /// The name of the label group to be used for label data.
  final String? labelGroupName;

  /// Contains location information for the S3 location being used for label data.
  final LabelsS3InputConfiguration? s3InputConfiguration;

  LabelsInputConfiguration({
    this.labelGroupName,
    this.s3InputConfiguration,
  });

  factory LabelsInputConfiguration.fromJson(Map<String, dynamic> json) {
    return LabelsInputConfiguration(
      labelGroupName: json['LabelGroupName'] as String?,
      s3InputConfiguration: json['S3InputConfiguration'] != null
          ? LabelsS3InputConfiguration.fromJson(
              json['S3InputConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final labelGroupName = this.labelGroupName;
    final s3InputConfiguration = this.s3InputConfiguration;
    return {
      if (labelGroupName != null) 'LabelGroupName': labelGroupName,
      if (s3InputConfiguration != null)
        'S3InputConfiguration': s3InputConfiguration,
    };
  }
}

/// The location information (prefix and bucket name) for the s3 location being
/// used for label data.
class LabelsS3InputConfiguration {
  /// The name of the S3 bucket holding the label data.
  final String bucket;

  /// The prefix for the S3 bucket used for the label data.
  final String? prefix;

  LabelsS3InputConfiguration({
    required this.bucket,
    this.prefix,
  });

  factory LabelsS3InputConfiguration.fromJson(Map<String, dynamic> json) {
    return LabelsS3InputConfiguration(
      bucket: json['Bucket'] as String,
      prefix: json['Prefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final prefix = this.prefix;
    return {
      'Bucket': bucket,
      if (prefix != null) 'Prefix': prefix,
    };
  }
}

/// Entity that comprises information on large gaps between consecutive
/// timestamps in data.
class LargeTimestampGaps {
  /// Indicates whether there is a potential data issue related to large gaps in
  /// timestamps.
  final StatisticalIssueStatus status;

  /// Indicates the size of the largest timestamp gap, in days.
  final int? maxTimestampGapInDays;

  /// Indicates the number of large timestamp gaps, if there are any.
  final int? numberOfLargeTimestampGaps;

  LargeTimestampGaps({
    required this.status,
    this.maxTimestampGapInDays,
    this.numberOfLargeTimestampGaps,
  });

  factory LargeTimestampGaps.fromJson(Map<String, dynamic> json) {
    return LargeTimestampGaps(
      status: (json['Status'] as String).toStatisticalIssueStatus(),
      maxTimestampGapInDays: json['MaxTimestampGapInDays'] as int?,
      numberOfLargeTimestampGaps: json['NumberOfLargeTimestampGaps'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final maxTimestampGapInDays = this.maxTimestampGapInDays;
    final numberOfLargeTimestampGaps = this.numberOfLargeTimestampGaps;
    return {
      'Status': status.toValue(),
      if (maxTimestampGapInDays != null)
        'MaxTimestampGapInDays': maxTimestampGapInDays,
      if (numberOfLargeTimestampGaps != null)
        'NumberOfLargeTimestampGaps': numberOfLargeTimestampGaps,
    };
  }
}

enum LatestInferenceResult {
  anomalous,
  normal,
}

extension LatestInferenceResultValueExtension on LatestInferenceResult {
  String toValue() {
    switch (this) {
      case LatestInferenceResult.anomalous:
        return 'ANOMALOUS';
      case LatestInferenceResult.normal:
        return 'NORMAL';
    }
  }
}

extension LatestInferenceResultFromString on String {
  LatestInferenceResult toLatestInferenceResult() {
    switch (this) {
      case 'ANOMALOUS':
        return LatestInferenceResult.anomalous;
      case 'NORMAL':
        return LatestInferenceResult.normal;
    }
    throw Exception('$this is not known in enum LatestInferenceResult');
  }
}

class ListDataIngestionJobsResponse {
  /// Specifies information about the specific data ingestion job, including
  /// dataset name and status.
  final List<DataIngestionJobSummary>? dataIngestionJobSummaries;

  /// An opaque pagination token indicating where to continue the listing of data
  /// ingestion jobs.
  final String? nextToken;

  ListDataIngestionJobsResponse({
    this.dataIngestionJobSummaries,
    this.nextToken,
  });

  factory ListDataIngestionJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListDataIngestionJobsResponse(
      dataIngestionJobSummaries: (json['DataIngestionJobSummaries'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DataIngestionJobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataIngestionJobSummaries = this.dataIngestionJobSummaries;
    final nextToken = this.nextToken;
    return {
      if (dataIngestionJobSummaries != null)
        'DataIngestionJobSummaries': dataIngestionJobSummaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListDatasetsResponse {
  /// Provides information about the specified dataset, including creation time,
  /// dataset ARN, and status.
  final List<DatasetSummary>? datasetSummaries;

  /// An opaque pagination token indicating where to continue the listing of
  /// datasets.
  final String? nextToken;

  ListDatasetsResponse({
    this.datasetSummaries,
    this.nextToken,
  });

  factory ListDatasetsResponse.fromJson(Map<String, dynamic> json) {
    return ListDatasetsResponse(
      datasetSummaries: (json['DatasetSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => DatasetSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final datasetSummaries = this.datasetSummaries;
    final nextToken = this.nextToken;
    return {
      if (datasetSummaries != null) 'DatasetSummaries': datasetSummaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListInferenceEventsResponse {
  /// Provides an array of information about the individual inference events
  /// returned from the <code>ListInferenceEvents</code> operation, including
  /// scheduler used, event start time, event end time, diagnostics, and so on.
  final List<InferenceEventSummary>? inferenceEventSummaries;

  /// An opaque pagination token indicating where to continue the listing of
  /// inference executions.
  final String? nextToken;

  ListInferenceEventsResponse({
    this.inferenceEventSummaries,
    this.nextToken,
  });

  factory ListInferenceEventsResponse.fromJson(Map<String, dynamic> json) {
    return ListInferenceEventsResponse(
      inferenceEventSummaries: (json['InferenceEventSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => InferenceEventSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final inferenceEventSummaries = this.inferenceEventSummaries;
    final nextToken = this.nextToken;
    return {
      if (inferenceEventSummaries != null)
        'InferenceEventSummaries': inferenceEventSummaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListInferenceExecutionsResponse {
  /// Provides an array of information about the individual inference executions
  /// returned from the <code>ListInferenceExecutions</code> operation, including
  /// model used, inference scheduler, data configuration, and so on.
  /// <note>
  /// If you don't supply the <code>InferenceSchedulerName</code> request
  /// parameter, or if you supply the name of an inference scheduler that doesn't
  /// exist, <code>ListInferenceExecutions</code> returns an empty array in
  /// <code>InferenceExecutionSummaries</code>.
  /// </note>
  final List<InferenceExecutionSummary>? inferenceExecutionSummaries;

  /// An opaque pagination token indicating where to continue the listing of
  /// inference executions.
  final String? nextToken;

  ListInferenceExecutionsResponse({
    this.inferenceExecutionSummaries,
    this.nextToken,
  });

  factory ListInferenceExecutionsResponse.fromJson(Map<String, dynamic> json) {
    return ListInferenceExecutionsResponse(
      inferenceExecutionSummaries:
          (json['InferenceExecutionSummaries'] as List?)
              ?.whereNotNull()
              .map((e) =>
                  InferenceExecutionSummary.fromJson(e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final inferenceExecutionSummaries = this.inferenceExecutionSummaries;
    final nextToken = this.nextToken;
    return {
      if (inferenceExecutionSummaries != null)
        'InferenceExecutionSummaries': inferenceExecutionSummaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListInferenceSchedulersResponse {
  /// Provides information about the specified inference scheduler, including data
  /// upload frequency, model name and ARN, and status.
  final List<InferenceSchedulerSummary>? inferenceSchedulerSummaries;

  /// An opaque pagination token indicating where to continue the listing of
  /// inference schedulers.
  final String? nextToken;

  ListInferenceSchedulersResponse({
    this.inferenceSchedulerSummaries,
    this.nextToken,
  });

  factory ListInferenceSchedulersResponse.fromJson(Map<String, dynamic> json) {
    return ListInferenceSchedulersResponse(
      inferenceSchedulerSummaries:
          (json['InferenceSchedulerSummaries'] as List?)
              ?.whereNotNull()
              .map((e) =>
                  InferenceSchedulerSummary.fromJson(e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final inferenceSchedulerSummaries = this.inferenceSchedulerSummaries;
    final nextToken = this.nextToken;
    return {
      if (inferenceSchedulerSummaries != null)
        'InferenceSchedulerSummaries': inferenceSchedulerSummaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListLabelGroupsResponse {
  /// A summary of the label groups.
  final List<LabelGroupSummary>? labelGroupSummaries;

  /// An opaque pagination token indicating where to continue the listing of label
  /// groups.
  final String? nextToken;

  ListLabelGroupsResponse({
    this.labelGroupSummaries,
    this.nextToken,
  });

  factory ListLabelGroupsResponse.fromJson(Map<String, dynamic> json) {
    return ListLabelGroupsResponse(
      labelGroupSummaries: (json['LabelGroupSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => LabelGroupSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final labelGroupSummaries = this.labelGroupSummaries;
    final nextToken = this.nextToken;
    return {
      if (labelGroupSummaries != null)
        'LabelGroupSummaries': labelGroupSummaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListLabelsResponse {
  /// A summary of the items in the label group.
  /// <note>
  /// If you don't supply the <code>LabelGroupName</code> request parameter, or if
  /// you supply the name of a label group that doesn't exist,
  /// <code>ListLabels</code> returns an empty array in
  /// <code>LabelSummaries</code>.
  /// </note>
  final List<LabelSummary>? labelSummaries;

  /// An opaque pagination token indicating where to continue the listing of
  /// datasets.
  final String? nextToken;

  ListLabelsResponse({
    this.labelSummaries,
    this.nextToken,
  });

  factory ListLabelsResponse.fromJson(Map<String, dynamic> json) {
    return ListLabelsResponse(
      labelSummaries: (json['LabelSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => LabelSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final labelSummaries = this.labelSummaries;
    final nextToken = this.nextToken;
    return {
      if (labelSummaries != null) 'LabelSummaries': labelSummaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListModelVersionsResponse {
  /// Provides information on the specified model version, including the created
  /// time, model and dataset ARNs, and status.
  /// <note>
  /// If you don't supply the <code>ModelName</code> request parameter, or if you
  /// supply the name of a model that doesn't exist,
  /// <code>ListModelVersions</code> returns an empty array in
  /// <code>ModelVersionSummaries</code>.
  /// </note>
  final List<ModelVersionSummary>? modelVersionSummaries;

  /// If the total number of results exceeds the limit that the response can
  /// display, the response returns an opaque pagination token indicating where to
  /// continue the listing of machine learning model versions. Use this token in
  /// the <code>NextToken</code> field in the request to list the next page of
  /// results.
  final String? nextToken;

  ListModelVersionsResponse({
    this.modelVersionSummaries,
    this.nextToken,
  });

  factory ListModelVersionsResponse.fromJson(Map<String, dynamic> json) {
    return ListModelVersionsResponse(
      modelVersionSummaries: (json['ModelVersionSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => ModelVersionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final modelVersionSummaries = this.modelVersionSummaries;
    final nextToken = this.nextToken;
    return {
      if (modelVersionSummaries != null)
        'ModelVersionSummaries': modelVersionSummaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListModelsResponse {
  /// Provides information on the specified model, including created time, model
  /// and dataset ARNs, and status.
  final List<ModelSummary>? modelSummaries;

  /// An opaque pagination token indicating where to continue the listing of
  /// machine learning models.
  final String? nextToken;

  ListModelsResponse({
    this.modelSummaries,
    this.nextToken,
  });

  factory ListModelsResponse.fromJson(Map<String, dynamic> json) {
    return ListModelsResponse(
      modelSummaries: (json['ModelSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => ModelSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final modelSummaries = this.modelSummaries;
    final nextToken = this.nextToken;
    return {
      if (modelSummaries != null) 'ModelSummaries': modelSummaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListRetrainingSchedulersResponse {
  /// If the number of results exceeds the maximum, this pagination token is
  /// returned. Use this token in the request to show the next page of retraining
  /// schedulers.
  final String? nextToken;

  /// Provides information on the specified retraining scheduler, including the
  /// model name, model ARN, status, and start date.
  final List<RetrainingSchedulerSummary>? retrainingSchedulerSummaries;

  ListRetrainingSchedulersResponse({
    this.nextToken,
    this.retrainingSchedulerSummaries,
  });

  factory ListRetrainingSchedulersResponse.fromJson(Map<String, dynamic> json) {
    return ListRetrainingSchedulersResponse(
      nextToken: json['NextToken'] as String?,
      retrainingSchedulerSummaries: (json['RetrainingSchedulerSummaries']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              RetrainingSchedulerSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final retrainingSchedulerSummaries = this.retrainingSchedulerSummaries;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (retrainingSchedulerSummaries != null)
        'RetrainingSchedulerSummaries': retrainingSchedulerSummaries,
    };
  }
}

class ListSensorStatisticsResponse {
  /// An opaque pagination token indicating where to continue the listing of
  /// sensor statistics.
  final String? nextToken;

  /// Provides ingestion-based statistics regarding the specified sensor with
  /// respect to various validation types, such as whether data exists, the number
  /// and percentage of missing values, and the number and percentage of duplicate
  /// timestamps.
  final List<SensorStatisticsSummary>? sensorStatisticsSummaries;

  ListSensorStatisticsResponse({
    this.nextToken,
    this.sensorStatisticsSummaries,
  });

  factory ListSensorStatisticsResponse.fromJson(Map<String, dynamic> json) {
    return ListSensorStatisticsResponse(
      nextToken: json['NextToken'] as String?,
      sensorStatisticsSummaries: (json['SensorStatisticsSummaries'] as List?)
          ?.whereNotNull()
          .map((e) =>
              SensorStatisticsSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final sensorStatisticsSummaries = this.sensorStatisticsSummaries;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (sensorStatisticsSummaries != null)
        'SensorStatisticsSummaries': sensorStatisticsSummaries,
    };
  }
}

class ListTagsForResourceResponse {
  /// Any tags associated with the resource.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Entity that comprises information on sensors that have sensor data
/// completely missing.
class MissingCompleteSensorData {
  /// Indicates the number of sensors that have data missing completely.
  final int affectedSensorCount;

  MissingCompleteSensorData({
    required this.affectedSensorCount,
  });

  factory MissingCompleteSensorData.fromJson(Map<String, dynamic> json) {
    return MissingCompleteSensorData(
      affectedSensorCount: json['AffectedSensorCount'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final affectedSensorCount = this.affectedSensorCount;
    return {
      'AffectedSensorCount': affectedSensorCount,
    };
  }
}

/// Entity that comprises aggregated information on sensors having missing data.
class MissingSensorData {
  /// Indicates the number of sensors that have atleast some data missing.
  final int affectedSensorCount;

  /// Indicates the total number of missing values across all the sensors.
  final int totalNumberOfMissingValues;

  MissingSensorData({
    required this.affectedSensorCount,
    required this.totalNumberOfMissingValues,
  });

  factory MissingSensorData.fromJson(Map<String, dynamic> json) {
    return MissingSensorData(
      affectedSensorCount: json['AffectedSensorCount'] as int,
      totalNumberOfMissingValues: json['TotalNumberOfMissingValues'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final affectedSensorCount = this.affectedSensorCount;
    final totalNumberOfMissingValues = this.totalNumberOfMissingValues;
    return {
      'AffectedSensorCount': affectedSensorCount,
      'TotalNumberOfMissingValues': totalNumberOfMissingValues,
    };
  }
}

/// Output configuration information for the pointwise model diagnostics for an
/// Amazon Lookout for Equipment model.
class ModelDiagnosticsOutputConfiguration {
  /// The Amazon S3 location for the pointwise model diagnostics.
  final ModelDiagnosticsS3OutputConfiguration s3OutputConfiguration;

  /// The Amazon Web Services Key Management Service (KMS) key identifier to
  /// encrypt the pointwise model diagnostics files.
  final String? kmsKeyId;

  ModelDiagnosticsOutputConfiguration({
    required this.s3OutputConfiguration,
    this.kmsKeyId,
  });

  factory ModelDiagnosticsOutputConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ModelDiagnosticsOutputConfiguration(
      s3OutputConfiguration: ModelDiagnosticsS3OutputConfiguration.fromJson(
          json['S3OutputConfiguration'] as Map<String, dynamic>),
      kmsKeyId: json['KmsKeyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3OutputConfiguration = this.s3OutputConfiguration;
    final kmsKeyId = this.kmsKeyId;
    return {
      'S3OutputConfiguration': s3OutputConfiguration,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
    };
  }
}

/// The Amazon S3 location for the pointwise model diagnostics for an Amazon
/// Lookout for Equipment model.
class ModelDiagnosticsS3OutputConfiguration {
  /// The name of the Amazon S3 bucket where the pointwise model diagnostics are
  /// located. You must be the owner of the Amazon S3 bucket.
  final String bucket;

  /// The Amazon S3 prefix for the location of the pointwise model diagnostics.
  /// The prefix specifies the folder and evaluation result file name.
  /// (<code>bucket</code>).
  ///
  /// When you call <code>CreateModel</code> or <code>UpdateModel</code>, specify
  /// the path within the bucket that you want Lookout for Equipment to save the
  /// model to. During training, Lookout for Equipment creates the model
  /// evaluation model as a compressed JSON file with the name
  /// <code>model_diagnostics_results.json.gz</code>.
  ///
  /// When you call <code>DescribeModel</code> or
  /// <code>DescribeModelVersion</code>, <code>prefix</code> contains the file
  /// path and filename of the model evaluation file.
  final String? prefix;

  ModelDiagnosticsS3OutputConfiguration({
    required this.bucket,
    this.prefix,
  });

  factory ModelDiagnosticsS3OutputConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ModelDiagnosticsS3OutputConfiguration(
      bucket: json['Bucket'] as String,
      prefix: json['Prefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final prefix = this.prefix;
    return {
      'Bucket': bucket,
      if (prefix != null) 'Prefix': prefix,
    };
  }
}

enum ModelPromoteMode {
  managed,
  manual,
}

extension ModelPromoteModeValueExtension on ModelPromoteMode {
  String toValue() {
    switch (this) {
      case ModelPromoteMode.managed:
        return 'MANAGED';
      case ModelPromoteMode.manual:
        return 'MANUAL';
    }
  }
}

extension ModelPromoteModeFromString on String {
  ModelPromoteMode toModelPromoteMode() {
    switch (this) {
      case 'MANAGED':
        return ModelPromoteMode.managed;
      case 'MANUAL':
        return ModelPromoteMode.manual;
    }
    throw Exception('$this is not known in enum ModelPromoteMode');
  }
}

enum ModelQuality {
  qualityThresholdMet,
  cannotDetermineQuality,
  poorQualityDetected,
}

extension ModelQualityValueExtension on ModelQuality {
  String toValue() {
    switch (this) {
      case ModelQuality.qualityThresholdMet:
        return 'QUALITY_THRESHOLD_MET';
      case ModelQuality.cannotDetermineQuality:
        return 'CANNOT_DETERMINE_QUALITY';
      case ModelQuality.poorQualityDetected:
        return 'POOR_QUALITY_DETECTED';
    }
  }
}

extension ModelQualityFromString on String {
  ModelQuality toModelQuality() {
    switch (this) {
      case 'QUALITY_THRESHOLD_MET':
        return ModelQuality.qualityThresholdMet;
      case 'CANNOT_DETERMINE_QUALITY':
        return ModelQuality.cannotDetermineQuality;
      case 'POOR_QUALITY_DETECTED':
        return ModelQuality.poorQualityDetected;
    }
    throw Exception('$this is not known in enum ModelQuality');
  }
}

enum ModelStatus {
  inProgress,
  success,
  failed,
  importInProgress,
}

extension ModelStatusValueExtension on ModelStatus {
  String toValue() {
    switch (this) {
      case ModelStatus.inProgress:
        return 'IN_PROGRESS';
      case ModelStatus.success:
        return 'SUCCESS';
      case ModelStatus.failed:
        return 'FAILED';
      case ModelStatus.importInProgress:
        return 'IMPORT_IN_PROGRESS';
    }
  }
}

extension ModelStatusFromString on String {
  ModelStatus toModelStatus() {
    switch (this) {
      case 'IN_PROGRESS':
        return ModelStatus.inProgress;
      case 'SUCCESS':
        return ModelStatus.success;
      case 'FAILED':
        return ModelStatus.failed;
      case 'IMPORT_IN_PROGRESS':
        return ModelStatus.importInProgress;
    }
    throw Exception('$this is not known in enum ModelStatus');
  }
}

/// Provides information about the specified machine learning model, including
/// dataset and model names and ARNs, as well as status.
class ModelSummary {
  /// The model version that the inference scheduler uses to run an inference
  /// execution.
  final int? activeModelVersion;

  /// The Amazon Resource Name (ARN) of the model version that is set as active.
  /// The active model version is the model version that the inference scheduler
  /// uses to run an inference execution.
  final String? activeModelVersionArn;

  /// The time at which the specific model was created.
  final DateTime? createdAt;

  /// The Amazon Resource Name (ARN) of the dataset used to create the model.
  final String? datasetArn;

  /// The name of the dataset being used for the machine learning model.
  final String? datasetName;

  /// Indicates the most recent model version that was generated by retraining.
  final int? latestScheduledRetrainingModelVersion;

  /// Indicates the start time of the most recent scheduled retraining run.
  final DateTime? latestScheduledRetrainingStartTime;

  /// Indicates the status of the most recent scheduled retraining run.
  final ModelVersionStatus? latestScheduledRetrainingStatus;

  /// The Amazon Resource Name (ARN) of the machine learning model.
  final String? modelArn;
  final ModelDiagnosticsOutputConfiguration?
      modelDiagnosticsOutputConfiguration;

  /// The name of the machine learning model.
  final String? modelName;

  /// Provides a quality assessment for a model that uses labels. If Lookout for
  /// Equipment determines that the model quality is poor based on training
  /// metrics, the value is <code>POOR_QUALITY_DETECTED</code>. Otherwise, the
  /// value is <code>QUALITY_THRESHOLD_MET</code>.
  ///
  /// If the model is unlabeled, the model quality can't be assessed and the value
  /// of <code>ModelQuality</code> is <code>CANNOT_DETERMINE_QUALITY</code>. In
  /// this situation, you can get a model quality assessment by adding labels to
  /// the input dataset and retraining the model.
  ///
  /// For information about using labels with your models, see <a
  /// href="https://docs.aws.amazon.com/lookout-for-equipment/latest/ug/understanding-labeling.html">Understanding
  /// labeling</a>.
  ///
  /// For information about improving the quality of a model, see <a
  /// href="https://docs.aws.amazon.com/lookout-for-equipment/latest/ug/best-practices.html">Best
  /// practices with Amazon Lookout for Equipment</a>.
  final ModelQuality? modelQuality;

  /// Indicates the date that the next scheduled retraining run will start on.
  /// Lookout for Equipment truncates the time you provide to <a
  /// href="https://docs.aws.amazon.com/https:/docs.aws.amazon.com/cli/latest/userguide/cli-usage-parameters-types.html#parameter-type-timestamp">the
  /// nearest UTC day</a>.
  final DateTime? nextScheduledRetrainingStartDate;

  /// Indicates the status of the retraining scheduler.
  final RetrainingSchedulerStatus? retrainingSchedulerStatus;

  /// Indicates the status of the machine learning model.
  final ModelStatus? status;

  ModelSummary({
    this.activeModelVersion,
    this.activeModelVersionArn,
    this.createdAt,
    this.datasetArn,
    this.datasetName,
    this.latestScheduledRetrainingModelVersion,
    this.latestScheduledRetrainingStartTime,
    this.latestScheduledRetrainingStatus,
    this.modelArn,
    this.modelDiagnosticsOutputConfiguration,
    this.modelName,
    this.modelQuality,
    this.nextScheduledRetrainingStartDate,
    this.retrainingSchedulerStatus,
    this.status,
  });

  factory ModelSummary.fromJson(Map<String, dynamic> json) {
    return ModelSummary(
      activeModelVersion: json['ActiveModelVersion'] as int?,
      activeModelVersionArn: json['ActiveModelVersionArn'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      datasetArn: json['DatasetArn'] as String?,
      datasetName: json['DatasetName'] as String?,
      latestScheduledRetrainingModelVersion:
          json['LatestScheduledRetrainingModelVersion'] as int?,
      latestScheduledRetrainingStartTime:
          timeStampFromJson(json['LatestScheduledRetrainingStartTime']),
      latestScheduledRetrainingStatus:
          (json['LatestScheduledRetrainingStatus'] as String?)
              ?.toModelVersionStatus(),
      modelArn: json['ModelArn'] as String?,
      modelDiagnosticsOutputConfiguration:
          json['ModelDiagnosticsOutputConfiguration'] != null
              ? ModelDiagnosticsOutputConfiguration.fromJson(
                  json['ModelDiagnosticsOutputConfiguration']
                      as Map<String, dynamic>)
              : null,
      modelName: json['ModelName'] as String?,
      modelQuality: (json['ModelQuality'] as String?)?.toModelQuality(),
      nextScheduledRetrainingStartDate:
          timeStampFromJson(json['NextScheduledRetrainingStartDate']),
      retrainingSchedulerStatus: (json['RetrainingSchedulerStatus'] as String?)
          ?.toRetrainingSchedulerStatus(),
      status: (json['Status'] as String?)?.toModelStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final activeModelVersion = this.activeModelVersion;
    final activeModelVersionArn = this.activeModelVersionArn;
    final createdAt = this.createdAt;
    final datasetArn = this.datasetArn;
    final datasetName = this.datasetName;
    final latestScheduledRetrainingModelVersion =
        this.latestScheduledRetrainingModelVersion;
    final latestScheduledRetrainingStartTime =
        this.latestScheduledRetrainingStartTime;
    final latestScheduledRetrainingStatus =
        this.latestScheduledRetrainingStatus;
    final modelArn = this.modelArn;
    final modelDiagnosticsOutputConfiguration =
        this.modelDiagnosticsOutputConfiguration;
    final modelName = this.modelName;
    final modelQuality = this.modelQuality;
    final nextScheduledRetrainingStartDate =
        this.nextScheduledRetrainingStartDate;
    final retrainingSchedulerStatus = this.retrainingSchedulerStatus;
    final status = this.status;
    return {
      if (activeModelVersion != null) 'ActiveModelVersion': activeModelVersion,
      if (activeModelVersionArn != null)
        'ActiveModelVersionArn': activeModelVersionArn,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (datasetArn != null) 'DatasetArn': datasetArn,
      if (datasetName != null) 'DatasetName': datasetName,
      if (latestScheduledRetrainingModelVersion != null)
        'LatestScheduledRetrainingModelVersion':
            latestScheduledRetrainingModelVersion,
      if (latestScheduledRetrainingStartTime != null)
        'LatestScheduledRetrainingStartTime':
            unixTimestampToJson(latestScheduledRetrainingStartTime),
      if (latestScheduledRetrainingStatus != null)
        'LatestScheduledRetrainingStatus':
            latestScheduledRetrainingStatus.toValue(),
      if (modelArn != null) 'ModelArn': modelArn,
      if (modelDiagnosticsOutputConfiguration != null)
        'ModelDiagnosticsOutputConfiguration':
            modelDiagnosticsOutputConfiguration,
      if (modelName != null) 'ModelName': modelName,
      if (modelQuality != null) 'ModelQuality': modelQuality.toValue(),
      if (nextScheduledRetrainingStartDate != null)
        'NextScheduledRetrainingStartDate':
            unixTimestampToJson(nextScheduledRetrainingStartDate),
      if (retrainingSchedulerStatus != null)
        'RetrainingSchedulerStatus': retrainingSchedulerStatus.toValue(),
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum ModelVersionSourceType {
  training,
  retraining,
  import,
}

extension ModelVersionSourceTypeValueExtension on ModelVersionSourceType {
  String toValue() {
    switch (this) {
      case ModelVersionSourceType.training:
        return 'TRAINING';
      case ModelVersionSourceType.retraining:
        return 'RETRAINING';
      case ModelVersionSourceType.import:
        return 'IMPORT';
    }
  }
}

extension ModelVersionSourceTypeFromString on String {
  ModelVersionSourceType toModelVersionSourceType() {
    switch (this) {
      case 'TRAINING':
        return ModelVersionSourceType.training;
      case 'RETRAINING':
        return ModelVersionSourceType.retraining;
      case 'IMPORT':
        return ModelVersionSourceType.import;
    }
    throw Exception('$this is not known in enum ModelVersionSourceType');
  }
}

enum ModelVersionStatus {
  inProgress,
  success,
  failed,
  importInProgress,
  canceled,
}

extension ModelVersionStatusValueExtension on ModelVersionStatus {
  String toValue() {
    switch (this) {
      case ModelVersionStatus.inProgress:
        return 'IN_PROGRESS';
      case ModelVersionStatus.success:
        return 'SUCCESS';
      case ModelVersionStatus.failed:
        return 'FAILED';
      case ModelVersionStatus.importInProgress:
        return 'IMPORT_IN_PROGRESS';
      case ModelVersionStatus.canceled:
        return 'CANCELED';
    }
  }
}

extension ModelVersionStatusFromString on String {
  ModelVersionStatus toModelVersionStatus() {
    switch (this) {
      case 'IN_PROGRESS':
        return ModelVersionStatus.inProgress;
      case 'SUCCESS':
        return ModelVersionStatus.success;
      case 'FAILED':
        return ModelVersionStatus.failed;
      case 'IMPORT_IN_PROGRESS':
        return ModelVersionStatus.importInProgress;
      case 'CANCELED':
        return ModelVersionStatus.canceled;
    }
    throw Exception('$this is not known in enum ModelVersionStatus');
  }
}

/// Contains information about the specific model version.
class ModelVersionSummary {
  /// The time when this model version was created.
  final DateTime? createdAt;

  /// The Amazon Resource Name (ARN) of the model that this model version is a
  /// version of.
  final String? modelArn;

  /// The name of the model that this model version is a version of.
  final String? modelName;

  /// Provides a quality assessment for a model that uses labels. If Lookout for
  /// Equipment determines that the model quality is poor based on training
  /// metrics, the value is <code>POOR_QUALITY_DETECTED</code>. Otherwise, the
  /// value is <code>QUALITY_THRESHOLD_MET</code>.
  ///
  /// If the model is unlabeled, the model quality can't be assessed and the value
  /// of <code>ModelQuality</code> is <code>CANNOT_DETERMINE_QUALITY</code>. In
  /// this situation, you can get a model quality assessment by adding labels to
  /// the input dataset and retraining the model.
  ///
  /// For information about improving the quality of a model, see <a
  /// href="https://docs.aws.amazon.com/lookout-for-equipment/latest/ug/best-practices.html">Best
  /// practices with Amazon Lookout for Equipment</a>.
  final ModelQuality? modelQuality;

  /// The version of the model.
  final int? modelVersion;

  /// The Amazon Resource Name (ARN) of the model version.
  final String? modelVersionArn;

  /// Indicates how this model version was generated.
  final ModelVersionSourceType? sourceType;

  /// The current status of the model version.
  final ModelVersionStatus? status;

  ModelVersionSummary({
    this.createdAt,
    this.modelArn,
    this.modelName,
    this.modelQuality,
    this.modelVersion,
    this.modelVersionArn,
    this.sourceType,
    this.status,
  });

  factory ModelVersionSummary.fromJson(Map<String, dynamic> json) {
    return ModelVersionSummary(
      createdAt: timeStampFromJson(json['CreatedAt']),
      modelArn: json['ModelArn'] as String?,
      modelName: json['ModelName'] as String?,
      modelQuality: (json['ModelQuality'] as String?)?.toModelQuality(),
      modelVersion: json['ModelVersion'] as int?,
      modelVersionArn: json['ModelVersionArn'] as String?,
      sourceType: (json['SourceType'] as String?)?.toModelVersionSourceType(),
      status: (json['Status'] as String?)?.toModelVersionStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final modelArn = this.modelArn;
    final modelName = this.modelName;
    final modelQuality = this.modelQuality;
    final modelVersion = this.modelVersion;
    final modelVersionArn = this.modelVersionArn;
    final sourceType = this.sourceType;
    final status = this.status;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (modelArn != null) 'ModelArn': modelArn,
      if (modelName != null) 'ModelName': modelName,
      if (modelQuality != null) 'ModelQuality': modelQuality.toValue(),
      if (modelVersion != null) 'ModelVersion': modelVersion,
      if (modelVersionArn != null) 'ModelVersionArn': modelVersionArn,
      if (sourceType != null) 'SourceType': sourceType.toValue(),
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// Entity that comprises information on monotonic values in the data.
class MonotonicValues {
  /// Indicates whether there is a potential data issue related to having
  /// monotonic values.
  final StatisticalIssueStatus status;

  /// Indicates the monotonicity of values. Can be INCREASING, DECREASING, or
  /// STATIC.
  final Monotonicity? monotonicity;

  MonotonicValues({
    required this.status,
    this.monotonicity,
  });

  factory MonotonicValues.fromJson(Map<String, dynamic> json) {
    return MonotonicValues(
      status: (json['Status'] as String).toStatisticalIssueStatus(),
      monotonicity: (json['Monotonicity'] as String?)?.toMonotonicity(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final monotonicity = this.monotonicity;
    return {
      'Status': status.toValue(),
      if (monotonicity != null) 'Monotonicity': monotonicity.toValue(),
    };
  }
}

enum Monotonicity {
  decreasing,
  increasing,
  static,
}

extension MonotonicityValueExtension on Monotonicity {
  String toValue() {
    switch (this) {
      case Monotonicity.decreasing:
        return 'DECREASING';
      case Monotonicity.increasing:
        return 'INCREASING';
      case Monotonicity.static:
        return 'STATIC';
    }
  }
}

extension MonotonicityFromString on String {
  Monotonicity toMonotonicity() {
    switch (this) {
      case 'DECREASING':
        return Monotonicity.decreasing;
      case 'INCREASING':
        return Monotonicity.increasing;
      case 'STATIC':
        return Monotonicity.static;
    }
    throw Exception('$this is not known in enum Monotonicity');
  }
}

/// Entity that comprises information on operating modes in data.
class MultipleOperatingModes {
  /// Indicates whether there is a potential data issue related to having multiple
  /// operating modes.
  final StatisticalIssueStatus status;

  MultipleOperatingModes({
    required this.status,
  });

  factory MultipleOperatingModes.fromJson(Map<String, dynamic> json) {
    return MultipleOperatingModes(
      status: (json['Status'] as String).toStatisticalIssueStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'Status': status.toValue(),
    };
  }
}

class PutResourcePolicyResponse {
  /// A unique identifier for a revision of the resource policy.
  final String? policyRevisionId;

  /// The Amazon Resource Name (ARN) of the resource for which the policy was
  /// created.
  final String? resourceArn;

  PutResourcePolicyResponse({
    this.policyRevisionId,
    this.resourceArn,
  });

  factory PutResourcePolicyResponse.fromJson(Map<String, dynamic> json) {
    return PutResourcePolicyResponse(
      policyRevisionId: json['PolicyRevisionId'] as String?,
      resourceArn: json['ResourceArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policyRevisionId = this.policyRevisionId;
    final resourceArn = this.resourceArn;
    return {
      if (policyRevisionId != null) 'PolicyRevisionId': policyRevisionId,
      if (resourceArn != null) 'ResourceArn': resourceArn,
    };
  }
}

enum RetrainingSchedulerStatus {
  pending,
  running,
  stopping,
  stopped,
}

extension RetrainingSchedulerStatusValueExtension on RetrainingSchedulerStatus {
  String toValue() {
    switch (this) {
      case RetrainingSchedulerStatus.pending:
        return 'PENDING';
      case RetrainingSchedulerStatus.running:
        return 'RUNNING';
      case RetrainingSchedulerStatus.stopping:
        return 'STOPPING';
      case RetrainingSchedulerStatus.stopped:
        return 'STOPPED';
    }
  }
}

extension RetrainingSchedulerStatusFromString on String {
  RetrainingSchedulerStatus toRetrainingSchedulerStatus() {
    switch (this) {
      case 'PENDING':
        return RetrainingSchedulerStatus.pending;
      case 'RUNNING':
        return RetrainingSchedulerStatus.running;
      case 'STOPPING':
        return RetrainingSchedulerStatus.stopping;
      case 'STOPPED':
        return RetrainingSchedulerStatus.stopped;
    }
    throw Exception('$this is not known in enum RetrainingSchedulerStatus');
  }
}

/// Provides information about the specified retraining scheduler, including
/// model name, status, start date, frequency, and lookback window.
class RetrainingSchedulerSummary {
  /// The number of past days of data used for retraining.
  final String? lookbackWindow;

  /// The ARN of the model that the retraining scheduler is attached to.
  final String? modelArn;

  /// The name of the model that the retraining scheduler is attached to.
  final String? modelName;

  /// The frequency at which the model retraining is set. This follows the <a
  /// href="https://en.wikipedia.org/wiki/ISO_8601#Durations">ISO 8601</a>
  /// guidelines.
  final String? retrainingFrequency;

  /// The start date for the retraining scheduler. Lookout for Equipment truncates
  /// the time you provide to the nearest UTC day.
  final DateTime? retrainingStartDate;

  /// The status of the retraining scheduler.
  final RetrainingSchedulerStatus? status;

  RetrainingSchedulerSummary({
    this.lookbackWindow,
    this.modelArn,
    this.modelName,
    this.retrainingFrequency,
    this.retrainingStartDate,
    this.status,
  });

  factory RetrainingSchedulerSummary.fromJson(Map<String, dynamic> json) {
    return RetrainingSchedulerSummary(
      lookbackWindow: json['LookbackWindow'] as String?,
      modelArn: json['ModelArn'] as String?,
      modelName: json['ModelName'] as String?,
      retrainingFrequency: json['RetrainingFrequency'] as String?,
      retrainingStartDate: timeStampFromJson(json['RetrainingStartDate']),
      status: (json['Status'] as String?)?.toRetrainingSchedulerStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final lookbackWindow = this.lookbackWindow;
    final modelArn = this.modelArn;
    final modelName = this.modelName;
    final retrainingFrequency = this.retrainingFrequency;
    final retrainingStartDate = this.retrainingStartDate;
    final status = this.status;
    return {
      if (lookbackWindow != null) 'LookbackWindow': lookbackWindow,
      if (modelArn != null) 'ModelArn': modelArn,
      if (modelName != null) 'ModelName': modelName,
      if (retrainingFrequency != null)
        'RetrainingFrequency': retrainingFrequency,
      if (retrainingStartDate != null)
        'RetrainingStartDate': unixTimestampToJson(retrainingStartDate),
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// Contains information about an S3 bucket.
class S3Object {
  /// The name of the specific S3 bucket.
  final String bucket;

  /// The Amazon Web Services Key Management Service (KMS key) key being used to
  /// encrypt the S3 object. Without this key, data in the bucket is not
  /// accessible.
  final String key;

  S3Object({
    required this.bucket,
    required this.key,
  });

  factory S3Object.fromJson(Map<String, dynamic> json) {
    return S3Object(
      bucket: json['Bucket'] as String,
      key: json['Key'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final key = this.key;
    return {
      'Bucket': bucket,
      'Key': key,
    };
  }
}

/// Summary of ingestion statistics like whether data exists, number of missing
/// values, number of invalid values and so on related to the particular sensor.
class SensorStatisticsSummary {
  /// Parameter that describes potential risk about whether data associated with
  /// the sensor is categorical.
  final CategoricalValues? categoricalValues;

  /// Name of the component to which the particular sensor belongs for which the
  /// statistics belong to.
  final String? componentName;

  /// Indicates the time reference to indicate the end of valid data associated
  /// with the sensor that the statistics belong to.
  final DateTime? dataEndTime;

  /// Parameter that indicates whether data exists for the sensor that the
  /// statistics belong to.
  final bool? dataExists;

  /// Indicates the time reference to indicate the beginning of valid data
  /// associated with the sensor that the statistics belong to.
  final DateTime? dataStartTime;

  /// Parameter that describes the total number of duplicate timestamp records
  /// associated with the sensor that the statistics belong to.
  final CountPercent? duplicateTimestamps;

  /// Parameter that describes the total number of invalid date entries associated
  /// with the sensor that the statistics belong to.
  final CountPercent? invalidDateEntries;

  /// Parameter that describes the total number of, and percentage of, values that
  /// are invalid for the sensor that the statistics belong to.
  final CountPercent? invalidValues;

  /// Parameter that describes potential risk about whether data associated with
  /// the sensor contains one or more large gaps between consecutive timestamps.
  final LargeTimestampGaps? largeTimestampGaps;

  /// Parameter that describes the total number of, and percentage of, values that
  /// are missing for the sensor that the statistics belong to.
  final CountPercent? missingValues;

  /// Parameter that describes potential risk about whether data associated with
  /// the sensor is mostly monotonic.
  final MonotonicValues? monotonicValues;

  /// Parameter that describes potential risk about whether data associated with
  /// the sensor has more than one operating mode.
  final MultipleOperatingModes? multipleOperatingModes;

  /// Name of the sensor that the statistics belong to.
  final String? sensorName;

  SensorStatisticsSummary({
    this.categoricalValues,
    this.componentName,
    this.dataEndTime,
    this.dataExists,
    this.dataStartTime,
    this.duplicateTimestamps,
    this.invalidDateEntries,
    this.invalidValues,
    this.largeTimestampGaps,
    this.missingValues,
    this.monotonicValues,
    this.multipleOperatingModes,
    this.sensorName,
  });

  factory SensorStatisticsSummary.fromJson(Map<String, dynamic> json) {
    return SensorStatisticsSummary(
      categoricalValues: json['CategoricalValues'] != null
          ? CategoricalValues.fromJson(
              json['CategoricalValues'] as Map<String, dynamic>)
          : null,
      componentName: json['ComponentName'] as String?,
      dataEndTime: timeStampFromJson(json['DataEndTime']),
      dataExists: json['DataExists'] as bool?,
      dataStartTime: timeStampFromJson(json['DataStartTime']),
      duplicateTimestamps: json['DuplicateTimestamps'] != null
          ? CountPercent.fromJson(
              json['DuplicateTimestamps'] as Map<String, dynamic>)
          : null,
      invalidDateEntries: json['InvalidDateEntries'] != null
          ? CountPercent.fromJson(
              json['InvalidDateEntries'] as Map<String, dynamic>)
          : null,
      invalidValues: json['InvalidValues'] != null
          ? CountPercent.fromJson(json['InvalidValues'] as Map<String, dynamic>)
          : null,
      largeTimestampGaps: json['LargeTimestampGaps'] != null
          ? LargeTimestampGaps.fromJson(
              json['LargeTimestampGaps'] as Map<String, dynamic>)
          : null,
      missingValues: json['MissingValues'] != null
          ? CountPercent.fromJson(json['MissingValues'] as Map<String, dynamic>)
          : null,
      monotonicValues: json['MonotonicValues'] != null
          ? MonotonicValues.fromJson(
              json['MonotonicValues'] as Map<String, dynamic>)
          : null,
      multipleOperatingModes: json['MultipleOperatingModes'] != null
          ? MultipleOperatingModes.fromJson(
              json['MultipleOperatingModes'] as Map<String, dynamic>)
          : null,
      sensorName: json['SensorName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final categoricalValues = this.categoricalValues;
    final componentName = this.componentName;
    final dataEndTime = this.dataEndTime;
    final dataExists = this.dataExists;
    final dataStartTime = this.dataStartTime;
    final duplicateTimestamps = this.duplicateTimestamps;
    final invalidDateEntries = this.invalidDateEntries;
    final invalidValues = this.invalidValues;
    final largeTimestampGaps = this.largeTimestampGaps;
    final missingValues = this.missingValues;
    final monotonicValues = this.monotonicValues;
    final multipleOperatingModes = this.multipleOperatingModes;
    final sensorName = this.sensorName;
    return {
      if (categoricalValues != null) 'CategoricalValues': categoricalValues,
      if (componentName != null) 'ComponentName': componentName,
      if (dataEndTime != null) 'DataEndTime': unixTimestampToJson(dataEndTime),
      if (dataExists != null) 'DataExists': dataExists,
      if (dataStartTime != null)
        'DataStartTime': unixTimestampToJson(dataStartTime),
      if (duplicateTimestamps != null)
        'DuplicateTimestamps': duplicateTimestamps,
      if (invalidDateEntries != null) 'InvalidDateEntries': invalidDateEntries,
      if (invalidValues != null) 'InvalidValues': invalidValues,
      if (largeTimestampGaps != null) 'LargeTimestampGaps': largeTimestampGaps,
      if (missingValues != null) 'MissingValues': missingValues,
      if (monotonicValues != null) 'MonotonicValues': monotonicValues,
      if (multipleOperatingModes != null)
        'MultipleOperatingModes': multipleOperatingModes,
      if (sensorName != null) 'SensorName': sensorName,
    };
  }
}

/// Entity that comprises information on sensors that have shorter date range.
class SensorsWithShortDateRange {
  /// Indicates the number of sensors that have less than 14 days of data.
  final int affectedSensorCount;

  SensorsWithShortDateRange({
    required this.affectedSensorCount,
  });

  factory SensorsWithShortDateRange.fromJson(Map<String, dynamic> json) {
    return SensorsWithShortDateRange(
      affectedSensorCount: json['AffectedSensorCount'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final affectedSensorCount = this.affectedSensorCount;
    return {
      'AffectedSensorCount': affectedSensorCount,
    };
  }
}

class StartDataIngestionJobResponse {
  /// Indicates the job ID of the data ingestion job.
  final String? jobId;

  /// Indicates the status of the <code>StartDataIngestionJob</code> operation.
  final IngestionJobStatus? status;

  StartDataIngestionJobResponse({
    this.jobId,
    this.status,
  });

  factory StartDataIngestionJobResponse.fromJson(Map<String, dynamic> json) {
    return StartDataIngestionJobResponse(
      jobId: json['JobId'] as String?,
      status: (json['Status'] as String?)?.toIngestionJobStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    final status = this.status;
    return {
      if (jobId != null) 'JobId': jobId,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

class StartInferenceSchedulerResponse {
  /// The Amazon Resource Name (ARN) of the inference scheduler being started.
  final String? inferenceSchedulerArn;

  /// The name of the inference scheduler being started.
  final String? inferenceSchedulerName;

  /// The Amazon Resource Name (ARN) of the machine learning model being used by
  /// the inference scheduler.
  final String? modelArn;

  /// The name of the machine learning model being used by the inference
  /// scheduler.
  final String? modelName;

  /// Indicates the status of the inference scheduler.
  final InferenceSchedulerStatus? status;

  StartInferenceSchedulerResponse({
    this.inferenceSchedulerArn,
    this.inferenceSchedulerName,
    this.modelArn,
    this.modelName,
    this.status,
  });

  factory StartInferenceSchedulerResponse.fromJson(Map<String, dynamic> json) {
    return StartInferenceSchedulerResponse(
      inferenceSchedulerArn: json['InferenceSchedulerArn'] as String?,
      inferenceSchedulerName: json['InferenceSchedulerName'] as String?,
      modelArn: json['ModelArn'] as String?,
      modelName: json['ModelName'] as String?,
      status: (json['Status'] as String?)?.toInferenceSchedulerStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final inferenceSchedulerArn = this.inferenceSchedulerArn;
    final inferenceSchedulerName = this.inferenceSchedulerName;
    final modelArn = this.modelArn;
    final modelName = this.modelName;
    final status = this.status;
    return {
      if (inferenceSchedulerArn != null)
        'InferenceSchedulerArn': inferenceSchedulerArn,
      if (inferenceSchedulerName != null)
        'InferenceSchedulerName': inferenceSchedulerName,
      if (modelArn != null) 'ModelArn': modelArn,
      if (modelName != null) 'ModelName': modelName,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

class StartRetrainingSchedulerResponse {
  /// The ARN of the model whose retraining scheduler is being started.
  final String? modelArn;

  /// The name of the model whose retraining scheduler is being started.
  final String? modelName;

  /// The status of the retraining scheduler.
  final RetrainingSchedulerStatus? status;

  StartRetrainingSchedulerResponse({
    this.modelArn,
    this.modelName,
    this.status,
  });

  factory StartRetrainingSchedulerResponse.fromJson(Map<String, dynamic> json) {
    return StartRetrainingSchedulerResponse(
      modelArn: json['ModelArn'] as String?,
      modelName: json['ModelName'] as String?,
      status: (json['Status'] as String?)?.toRetrainingSchedulerStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final modelArn = this.modelArn;
    final modelName = this.modelName;
    final status = this.status;
    return {
      if (modelArn != null) 'ModelArn': modelArn,
      if (modelName != null) 'ModelName': modelName,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum StatisticalIssueStatus {
  potentialIssueDetected,
  noIssueDetected,
}

extension StatisticalIssueStatusValueExtension on StatisticalIssueStatus {
  String toValue() {
    switch (this) {
      case StatisticalIssueStatus.potentialIssueDetected:
        return 'POTENTIAL_ISSUE_DETECTED';
      case StatisticalIssueStatus.noIssueDetected:
        return 'NO_ISSUE_DETECTED';
    }
  }
}

extension StatisticalIssueStatusFromString on String {
  StatisticalIssueStatus toStatisticalIssueStatus() {
    switch (this) {
      case 'POTENTIAL_ISSUE_DETECTED':
        return StatisticalIssueStatus.potentialIssueDetected;
      case 'NO_ISSUE_DETECTED':
        return StatisticalIssueStatus.noIssueDetected;
    }
    throw Exception('$this is not known in enum StatisticalIssueStatus');
  }
}

class StopInferenceSchedulerResponse {
  /// The Amazon Resource Name (ARN) of the inference schedule being stopped.
  final String? inferenceSchedulerArn;

  /// The name of the inference scheduler being stopped.
  final String? inferenceSchedulerName;

  /// The Amazon Resource Name (ARN) of the machine learning model used by the
  /// inference scheduler being stopped.
  final String? modelArn;

  /// The name of the machine learning model used by the inference scheduler being
  /// stopped.
  final String? modelName;

  /// Indicates the status of the inference scheduler.
  final InferenceSchedulerStatus? status;

  StopInferenceSchedulerResponse({
    this.inferenceSchedulerArn,
    this.inferenceSchedulerName,
    this.modelArn,
    this.modelName,
    this.status,
  });

  factory StopInferenceSchedulerResponse.fromJson(Map<String, dynamic> json) {
    return StopInferenceSchedulerResponse(
      inferenceSchedulerArn: json['InferenceSchedulerArn'] as String?,
      inferenceSchedulerName: json['InferenceSchedulerName'] as String?,
      modelArn: json['ModelArn'] as String?,
      modelName: json['ModelName'] as String?,
      status: (json['Status'] as String?)?.toInferenceSchedulerStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final inferenceSchedulerArn = this.inferenceSchedulerArn;
    final inferenceSchedulerName = this.inferenceSchedulerName;
    final modelArn = this.modelArn;
    final modelName = this.modelName;
    final status = this.status;
    return {
      if (inferenceSchedulerArn != null)
        'InferenceSchedulerArn': inferenceSchedulerArn,
      if (inferenceSchedulerName != null)
        'InferenceSchedulerName': inferenceSchedulerName,
      if (modelArn != null) 'ModelArn': modelArn,
      if (modelName != null) 'ModelName': modelName,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

class StopRetrainingSchedulerResponse {
  /// The ARN of the model whose retraining scheduler is being stopped.
  final String? modelArn;

  /// The name of the model whose retraining scheduler is being stopped.
  final String? modelName;

  /// The status of the retraining scheduler.
  final RetrainingSchedulerStatus? status;

  StopRetrainingSchedulerResponse({
    this.modelArn,
    this.modelName,
    this.status,
  });

  factory StopRetrainingSchedulerResponse.fromJson(Map<String, dynamic> json) {
    return StopRetrainingSchedulerResponse(
      modelArn: json['ModelArn'] as String?,
      modelName: json['ModelName'] as String?,
      status: (json['Status'] as String?)?.toRetrainingSchedulerStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final modelArn = this.modelArn;
    final modelName = this.modelName;
    final status = this.status;
    return {
      if (modelArn != null) 'ModelArn': modelArn,
      if (modelName != null) 'ModelName': modelName,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// A tag is a key-value pair that can be added to a resource as metadata.
class Tag {
  /// The key for the specified tag.
  final String key;

  /// The value for the specified tag.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['Key'] as String,
      value: json['Value'] as String,
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

enum TargetSamplingRate {
  pt1s,
  pt5s,
  pt10s,
  pt15s,
  pt30s,
  pt1m,
  pt5m,
  pt10m,
  pt15m,
  pt30m,
  pt1h,
}

extension TargetSamplingRateValueExtension on TargetSamplingRate {
  String toValue() {
    switch (this) {
      case TargetSamplingRate.pt1s:
        return 'PT1S';
      case TargetSamplingRate.pt5s:
        return 'PT5S';
      case TargetSamplingRate.pt10s:
        return 'PT10S';
      case TargetSamplingRate.pt15s:
        return 'PT15S';
      case TargetSamplingRate.pt30s:
        return 'PT30S';
      case TargetSamplingRate.pt1m:
        return 'PT1M';
      case TargetSamplingRate.pt5m:
        return 'PT5M';
      case TargetSamplingRate.pt10m:
        return 'PT10M';
      case TargetSamplingRate.pt15m:
        return 'PT15M';
      case TargetSamplingRate.pt30m:
        return 'PT30M';
      case TargetSamplingRate.pt1h:
        return 'PT1H';
    }
  }
}

extension TargetSamplingRateFromString on String {
  TargetSamplingRate toTargetSamplingRate() {
    switch (this) {
      case 'PT1S':
        return TargetSamplingRate.pt1s;
      case 'PT5S':
        return TargetSamplingRate.pt5s;
      case 'PT10S':
        return TargetSamplingRate.pt10s;
      case 'PT15S':
        return TargetSamplingRate.pt15s;
      case 'PT30S':
        return TargetSamplingRate.pt30s;
      case 'PT1M':
        return TargetSamplingRate.pt1m;
      case 'PT5M':
        return TargetSamplingRate.pt5m;
      case 'PT10M':
        return TargetSamplingRate.pt10m;
      case 'PT15M':
        return TargetSamplingRate.pt15m;
      case 'PT30M':
        return TargetSamplingRate.pt30m;
      case 'PT1H':
        return TargetSamplingRate.pt1h;
    }
    throw Exception('$this is not known in enum TargetSamplingRate');
  }
}

/// Entity that comprises information abount unsupported timestamps in the
/// dataset.
class UnsupportedTimestamps {
  /// Indicates the total number of unsupported timestamps across the ingested
  /// data.
  final int totalNumberOfUnsupportedTimestamps;

  UnsupportedTimestamps({
    required this.totalNumberOfUnsupportedTimestamps,
  });

  factory UnsupportedTimestamps.fromJson(Map<String, dynamic> json) {
    return UnsupportedTimestamps(
      totalNumberOfUnsupportedTimestamps:
          json['TotalNumberOfUnsupportedTimestamps'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final totalNumberOfUnsupportedTimestamps =
        this.totalNumberOfUnsupportedTimestamps;
    return {
      'TotalNumberOfUnsupportedTimestamps': totalNumberOfUnsupportedTimestamps,
    };
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

class UpdateActiveModelVersionResponse {
  /// The version that is currently active of the machine learning model for which
  /// the active model version was set.
  final int? currentActiveVersion;

  /// The Amazon Resource Name (ARN) of the machine learning model version that is
  /// the current active model version.
  final String? currentActiveVersionArn;

  /// The Amazon Resource Name (ARN) of the machine learning model for which the
  /// active model version was set.
  final String? modelArn;

  /// The name of the machine learning model for which the active model version
  /// was set.
  final String? modelName;

  /// The previous version that was active of the machine learning model for which
  /// the active model version was set.
  final int? previousActiveVersion;

  /// The Amazon Resource Name (ARN) of the machine learning model version that
  /// was the previous active model version.
  final String? previousActiveVersionArn;

  UpdateActiveModelVersionResponse({
    this.currentActiveVersion,
    this.currentActiveVersionArn,
    this.modelArn,
    this.modelName,
    this.previousActiveVersion,
    this.previousActiveVersionArn,
  });

  factory UpdateActiveModelVersionResponse.fromJson(Map<String, dynamic> json) {
    return UpdateActiveModelVersionResponse(
      currentActiveVersion: json['CurrentActiveVersion'] as int?,
      currentActiveVersionArn: json['CurrentActiveVersionArn'] as String?,
      modelArn: json['ModelArn'] as String?,
      modelName: json['ModelName'] as String?,
      previousActiveVersion: json['PreviousActiveVersion'] as int?,
      previousActiveVersionArn: json['PreviousActiveVersionArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final currentActiveVersion = this.currentActiveVersion;
    final currentActiveVersionArn = this.currentActiveVersionArn;
    final modelArn = this.modelArn;
    final modelName = this.modelName;
    final previousActiveVersion = this.previousActiveVersion;
    final previousActiveVersionArn = this.previousActiveVersionArn;
    return {
      if (currentActiveVersion != null)
        'CurrentActiveVersion': currentActiveVersion,
      if (currentActiveVersionArn != null)
        'CurrentActiveVersionArn': currentActiveVersionArn,
      if (modelArn != null) 'ModelArn': modelArn,
      if (modelName != null) 'ModelName': modelName,
      if (previousActiveVersion != null)
        'PreviousActiveVersion': previousActiveVersion,
      if (previousActiveVersionArn != null)
        'PreviousActiveVersionArn': previousActiveVersionArn,
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

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
