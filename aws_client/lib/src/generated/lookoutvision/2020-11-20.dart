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

/// This is the Amazon Lookout for Vision API Reference. It provides
/// descriptions of actions, data types, common parameters, and common errors.
///
/// Amazon Lookout for Vision enables you to find visual defects in industrial
/// products, accurately and at scale. It uses computer vision to identify
/// missing components in an industrial product, damage to vehicles or
/// structures, irregularities in production lines, and even minuscule defects
/// in silicon wafers — or any other physical item where quality is important
/// such as a missing capacitor on printed circuit boards.
class LookoutForVision {
  final _s.RestJsonProtocol _protocol;
  LookoutForVision({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'lookoutvision',
            signingName: 'lookoutvision',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Creates a new dataset in an Amazon Lookout for Vision project.
  /// <code>CreateDataset</code> can create a training or a test dataset from a
  /// valid dataset source (<code>DatasetSource</code>).
  ///
  /// If you want a single dataset project, specify <code>train</code> for the
  /// value of <code>DatasetType</code>.
  ///
  /// To have a project with separate training and test datasets, call
  /// <code>CreateDataset</code> twice. On the first call, specify
  /// <code>train</code> for the value of <code>DatasetType</code>. On the
  /// second call, specify <code>test</code> for the value of
  /// <code>DatasetType</code>.
  ///
  /// This operation requires permissions to perform the
  /// <code>lookoutvision:CreateDataset</code> operation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [datasetType] :
  /// The type of the dataset. Specify <code>train</code> for a training
  /// dataset. Specify <code>test</code> for a test dataset.
  ///
  /// Parameter [projectName] :
  /// The name of the project in which you want to create a dataset.
  ///
  /// Parameter [clientToken] :
  /// ClientToken is an idempotency token that ensures a call to
  /// <code>CreateDataset</code> completes only once. You choose the value to
  /// pass. For example, An issue, such as an network outage, might prevent you
  /// from getting a response from <code>CreateDataset</code>. In this case,
  /// safely retry your call to <code>CreateDataset</code> by using the same
  /// <code>ClientToken</code> parameter value. An error occurs if the other
  /// input parameters are not the same as in the first request. Using a
  /// different value for <code>ClientToken</code> is considered a new call to
  /// <code>CreateDataset</code>. An idempotency token is active for 8 hours.
  ///
  /// Parameter [datasetSource] :
  /// The location of the manifest file that Amazon Lookout for Vision uses to
  /// create the dataset.
  ///
  /// If you don't specify <code>DatasetSource</code>, an empty dataset is
  /// created and the operation synchronously returns. Later, you can add JSON
  /// Lines by calling <a>UpdateDatasetEntries</a>.
  ///
  /// If you specify a value for <code>DataSource</code>, the manifest at the S3
  /// location is validated and used to create the dataset. The call to
  /// <code>CreateDataset</code> is asynchronous and might take a while to
  /// complete. To find out the current status, Check the value of
  /// <code>Status</code> returned in a call to <a>DescribeDataset</a>.
  Future<CreateDatasetResponse> createDataset({
    required String datasetType,
    required String projectName,
    String? clientToken,
    DatasetSource? datasetSource,
  }) async {
    ArgumentError.checkNotNull(datasetType, 'datasetType');
    _s.validateStringLength(
      'datasetType',
      datasetType,
      1,
      10,
      isRequired: true,
    );
    ArgumentError.checkNotNull(projectName, 'projectName');
    _s.validateStringLength(
      'projectName',
      projectName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      64,
    );
    final headers = <String, String>{
      if (clientToken != null) 'X-Amzn-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'DatasetType': datasetType,
      if (datasetSource != null) 'DatasetSource': datasetSource,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2020-11-20/projects/${Uri.encodeComponent(projectName)}/datasets',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateDatasetResponse.fromJson(response);
  }

  /// Creates a new version of a model within an an Amazon Lookout for Vision
  /// project. <code>CreateModel</code> is an asynchronous operation in which
  /// Amazon Lookout for Vision trains, tests, and evaluates a new version of a
  /// model.
  ///
  /// To get the current status, check the <code>Status</code> field returned in
  /// the response from <a>DescribeModel</a>.
  ///
  /// If the project has a single dataset, Amazon Lookout for Vision internally
  /// splits the dataset to create a training and a test dataset. If the project
  /// has a training and a test dataset, Lookout for Vision uses the respective
  /// datasets to train and test the model.
  ///
  /// After training completes, the evaluation metrics are stored at the
  /// location specified in <code>OutputConfig</code>.
  ///
  /// This operation requires permissions to perform the
  /// <code>lookoutvision:CreateModel</code> operation. If you want to tag your
  /// model, you also require permission to the
  /// <code>lookoutvision:TagResource</code> operation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [outputConfig] :
  /// The location where Amazon Lookout for Vision saves the training results.
  ///
  /// Parameter [projectName] :
  /// The name of the project in which you want to create a model version.
  ///
  /// Parameter [clientToken] :
  /// ClientToken is an idempotency token that ensures a call to
  /// <code>CreateModel</code> completes only once. You choose the value to
  /// pass. For example, An issue, such as an network outage, might prevent you
  /// from getting a response from <code>CreateModel</code>. In this case,
  /// safely retry your call to <code>CreateModel</code> by using the same
  /// <code>ClientToken</code> parameter value. An error occurs if the other
  /// input parameters are not the same as in the first request. Using a
  /// different value for <code>ClientToken</code> is considered a new call to
  /// <code>CreateModel</code>. An idempotency token is active for 8 hours.
  ///
  /// Parameter [description] :
  /// A description for the version of the model.
  ///
  /// Parameter [kmsKeyId] :
  /// The identifier for your AWS Key Management Service (AWS KMS) customer
  /// master key (CMK). The key is used to encrypt training and test images
  /// copied into the service for model training. Your source images are
  /// unaffected. If this parameter is not specified, the copied images are
  /// encrypted by a key that AWS owns and manages.
  ///
  /// Parameter [tags] :
  /// A set of tags (key-value pairs) that you want to attach to the model.
  Future<CreateModelResponse> createModel({
    required OutputConfig outputConfig,
    required String projectName,
    String? clientToken,
    String? description,
    String? kmsKeyId,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(outputConfig, 'outputConfig');
    ArgumentError.checkNotNull(projectName, 'projectName');
    _s.validateStringLength(
      'projectName',
      projectName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      64,
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      500,
    );
    _s.validateStringLength(
      'kmsKeyId',
      kmsKeyId,
      1,
      2048,
    );
    final headers = <String, String>{
      if (clientToken != null) 'X-Amzn-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'OutputConfig': outputConfig,
      if (description != null) 'Description': description,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2020-11-20/projects/${Uri.encodeComponent(projectName)}/models',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateModelResponse.fromJson(response);
  }

  /// Creates an empty Amazon Lookout for Vision project. After you create the
  /// project, add a dataset by calling <a>CreateDataset</a>.
  ///
  /// This operation requires permissions to perform the
  /// <code>lookoutvision:CreateProject</code> operation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [projectName] :
  /// The name for the project.
  ///
  /// Parameter [clientToken] :
  /// ClientToken is an idempotency token that ensures a call to
  /// <code>CreateProject</code> completes only once. You choose the value to
  /// pass. For example, An issue, such as an network outage, might prevent you
  /// from getting a response from <code>CreateProject</code>. In this case,
  /// safely retry your call to <code>CreateProject</code> by using the same
  /// <code>ClientToken</code> parameter value. An error occurs if the other
  /// input parameters are not the same as in the first request. Using a
  /// different value for <code>ClientToken</code> is considered a new call to
  /// <code>CreateProject</code>. An idempotency token is active for 8 hours.
  Future<CreateProjectResponse> createProject({
    required String projectName,
    String? clientToken,
  }) async {
    ArgumentError.checkNotNull(projectName, 'projectName');
    _s.validateStringLength(
      'projectName',
      projectName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      64,
    );
    final headers = <String, String>{
      if (clientToken != null) 'X-Amzn-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'ProjectName': projectName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2020-11-20/projects',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateProjectResponse.fromJson(response);
  }

  /// Deletes an existing Amazon Lookout for Vision <code>dataset</code>.
  ///
  /// If your the project has a single dataset, you must create a new dataset
  /// before you can create a model.
  ///
  /// If you project has a training dataset and a test dataset consider the
  /// following.
  ///
  /// <ul>
  /// <li>
  /// If you delete the test dataset, your project reverts to a single dataset
  /// project. If you then train the model, Amazon Lookout for Vision internally
  /// splits the remaining dataset into a training and test dataset.
  /// </li>
  /// <li>
  /// If you delete the training dataset, you must create a training dataset
  /// before you can create a model.
  /// </li>
  /// </ul>
  /// This operation requires permissions to perform the
  /// <code>lookoutvision:DeleteDataset</code> operation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [datasetType] :
  /// The type of the dataset to delete. Specify <code>train</code> to delete
  /// the training dataset. Specify <code>test</code> to delete the test
  /// dataset. To delete the dataset in a single dataset project, specify
  /// <code>train</code>.
  ///
  /// Parameter [projectName] :
  /// The name of the project that contains the dataset that you want to delete.
  ///
  /// Parameter [clientToken] :
  /// ClientToken is an idempotency token that ensures a call to
  /// <code>DeleteDataset</code> completes only once. You choose the value to
  /// pass. For example, An issue, such as an network outage, might prevent you
  /// from getting a response from <code>DeleteDataset</code>. In this case,
  /// safely retry your call to <code>DeleteDataset</code> by using the same
  /// <code>ClientToken</code> parameter value. An error occurs if the other
  /// input parameters are not the same as in the first request. Using a
  /// different value for <code>ClientToken</code> is considered a new call to
  /// <code>DeleteDataset</code>. An idempotency token is active for 8 hours.
  Future<void> deleteDataset({
    required String datasetType,
    required String projectName,
    String? clientToken,
  }) async {
    ArgumentError.checkNotNull(datasetType, 'datasetType');
    _s.validateStringLength(
      'datasetType',
      datasetType,
      1,
      10,
      isRequired: true,
    );
    ArgumentError.checkNotNull(projectName, 'projectName');
    _s.validateStringLength(
      'projectName',
      projectName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      64,
    );
    final headers = <String, String>{
      if (clientToken != null) 'X-Amzn-Client-Token': clientToken.toString(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2020-11-20/projects/${Uri.encodeComponent(projectName)}/datasets/${Uri.encodeComponent(datasetType)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an Amazon Lookout for Vision model. You can't delete a running
  /// model. To stop a running model, use the <a>StopModel</a> operation.
  ///
  /// It might take a few seconds to delete a model. To determine if a model has
  /// been deleted, call <a>ListProjects</a> and check if the version of the
  /// model (<code>ModelVersion</code>) is in the <code>Models</code> array.
  ///
  /// This operation requires permissions to perform the
  /// <code>lookoutvision:DeleteModel</code> operation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [modelVersion] :
  /// The version of the model that you want to delete.
  ///
  /// Parameter [projectName] :
  /// The name of the project that contains the model that you want to delete.
  ///
  /// Parameter [clientToken] :
  /// ClientToken is an idempotency token that ensures a call to
  /// <code>DeleteModel</code> completes only once. You choose the value to
  /// pass. For example, An issue, such as an network outage, might prevent you
  /// from getting a response from <code>DeleteModel</code>. In this case,
  /// safely retry your call to <code>DeleteModel</code> by using the same
  /// <code>ClientToken</code> parameter value. An error occurs if the other
  /// input parameters are not the same as in the first request. Using a
  /// different value for <code>ClientToken</code> is considered a new call to
  /// <code>DeleteModel</code>. An idempotency token is active for 8 hours.
  Future<DeleteModelResponse> deleteModel({
    required String modelVersion,
    required String projectName,
    String? clientToken,
  }) async {
    ArgumentError.checkNotNull(modelVersion, 'modelVersion');
    _s.validateStringLength(
      'modelVersion',
      modelVersion,
      1,
      10,
      isRequired: true,
    );
    ArgumentError.checkNotNull(projectName, 'projectName');
    _s.validateStringLength(
      'projectName',
      projectName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      64,
    );
    final headers = <String, String>{
      if (clientToken != null) 'X-Amzn-Client-Token': clientToken.toString(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2020-11-20/projects/${Uri.encodeComponent(projectName)}/models/${Uri.encodeComponent(modelVersion)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteModelResponse.fromJson(response);
  }

  /// Deletes an Amazon Lookout for Vision project.
  ///
  /// To delete a project, you must first delete each version of the model
  /// associated with the project. To delete a model use the <a>DeleteModel</a>
  /// operation.
  ///
  /// You also have to delete the dataset(s) associated with the model. For more
  /// information, see <a>DeleteDataset</a>. The images referenced by the
  /// training and test datasets aren't deleted.
  ///
  /// This operation requires permissions to perform the
  /// <code>lookoutvision:DeleteProject</code> operation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [projectName] :
  /// The name of the project to delete.
  ///
  /// Parameter [clientToken] :
  /// ClientToken is an idempotency token that ensures a call to
  /// <code>DeleteProject</code> completes only once. You choose the value to
  /// pass. For example, An issue, such as an network outage, might prevent you
  /// from getting a response from <code>DeleteProject</code>. In this case,
  /// safely retry your call to <code>DeleteProject</code> by using the same
  /// <code>ClientToken</code> parameter value. An error occurs if the other
  /// input parameters are not the same as in the first request. Using a
  /// different value for <code>ClientToken</code> is considered a new call to
  /// <code>DeleteProject</code>. An idempotency token is active for 8 hours.
  Future<DeleteProjectResponse> deleteProject({
    required String projectName,
    String? clientToken,
  }) async {
    ArgumentError.checkNotNull(projectName, 'projectName');
    _s.validateStringLength(
      'projectName',
      projectName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      64,
    );
    final headers = <String, String>{
      if (clientToken != null) 'X-Amzn-Client-Token': clientToken.toString(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/2020-11-20/projects/${Uri.encodeComponent(projectName)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteProjectResponse.fromJson(response);
  }

  /// Describe an Amazon Lookout for Vision dataset.
  ///
  /// This operation requires permissions to perform the
  /// <code>lookoutvision:DescribeDataset</code> operation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [datasetType] :
  /// The type of the dataset to describe. Specify <code>train</code> to
  /// describe the training dataset. Specify <code>test</code> to describe the
  /// test dataset. If you have a single dataset project, specify
  /// <code>train</code>
  ///
  /// Parameter [projectName] :
  /// The name of the project that contains the dataset that you want to
  /// describe.
  Future<DescribeDatasetResponse> describeDataset({
    required String datasetType,
    required String projectName,
  }) async {
    ArgumentError.checkNotNull(datasetType, 'datasetType');
    _s.validateStringLength(
      'datasetType',
      datasetType,
      1,
      10,
      isRequired: true,
    );
    ArgumentError.checkNotNull(projectName, 'projectName');
    _s.validateStringLength(
      'projectName',
      projectName,
      1,
      255,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2020-11-20/projects/${Uri.encodeComponent(projectName)}/datasets/${Uri.encodeComponent(datasetType)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDatasetResponse.fromJson(response);
  }

  /// Describes a version of an Amazon Lookout for Vision model.
  ///
  /// This operation requires permissions to perform the
  /// <code>lookoutvision:DescribeModel</code> operation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [modelVersion] :
  /// The version of the model that you want to describe.
  ///
  /// Parameter [projectName] :
  /// The project that contains the version of a model that you want to
  /// describe.
  Future<DescribeModelResponse> describeModel({
    required String modelVersion,
    required String projectName,
  }) async {
    ArgumentError.checkNotNull(modelVersion, 'modelVersion');
    _s.validateStringLength(
      'modelVersion',
      modelVersion,
      1,
      10,
      isRequired: true,
    );
    ArgumentError.checkNotNull(projectName, 'projectName');
    _s.validateStringLength(
      'projectName',
      projectName,
      1,
      255,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2020-11-20/projects/${Uri.encodeComponent(projectName)}/models/${Uri.encodeComponent(modelVersion)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeModelResponse.fromJson(response);
  }

  /// Describes an Amazon Lookout for Vision project.
  ///
  /// This operation requires permissions to perform the
  /// <code>lookoutvision:DescribeProject</code> operation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [projectName] :
  /// The name of the project that you want to describe.
  Future<DescribeProjectResponse> describeProject({
    required String projectName,
  }) async {
    ArgumentError.checkNotNull(projectName, 'projectName');
    _s.validateStringLength(
      'projectName',
      projectName,
      1,
      255,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2020-11-20/projects/${Uri.encodeComponent(projectName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeProjectResponse.fromJson(response);
  }

  /// Detects anomalies in an image that you supply.
  ///
  /// The response from <code>DetectAnomalies</code> includes a boolean
  /// prediction that the image contains one or more anomalies and a confidence
  /// value for the prediction.
  /// <note>
  /// Before calling <code>DetectAnomalies</code>, you must first start your
  /// model with the <a>StartModel</a> operation. You are charged for the amount
  /// of time, in minutes, that a model runs and for the number of anomaly
  /// detection units that your model uses. If you are not using a model, use
  /// the <a>StopModel</a> operation to stop your model.
  /// </note>
  /// This operation requires permissions to perform the
  /// <code>lookoutvision:DetectAnomalies</code> operation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [body] :
  /// The unencrypted image bytes that you want to analyze.
  ///
  /// Parameter [contentType] :
  /// The type of the image passed in <code>Body</code>. Valid values are
  /// <code>image/png</code> (PNG format images) and <code>image/jpeg</code>
  /// (JPG format images).
  ///
  /// Parameter [modelVersion] :
  /// The version of the model that you want to use.
  ///
  /// Parameter [projectName] :
  /// The name of the project that contains the model version that you want to
  /// use.
  Future<DetectAnomaliesResponse> detectAnomalies({
    required Uint8List body,
    required String contentType,
    required String modelVersion,
    required String projectName,
  }) async {
    ArgumentError.checkNotNull(body, 'body');
    ArgumentError.checkNotNull(contentType, 'contentType');
    _s.validateStringLength(
      'contentType',
      contentType,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(modelVersion, 'modelVersion');
    _s.validateStringLength(
      'modelVersion',
      modelVersion,
      1,
      10,
      isRequired: true,
    );
    ArgumentError.checkNotNull(projectName, 'projectName');
    _s.validateStringLength(
      'projectName',
      projectName,
      1,
      255,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': contentType.toString(),
    };
    final response = await _protocol.send(
      payload: body,
      method: 'POST',
      requestUri:
          '/2020-11-20/projects/${Uri.encodeComponent(projectName)}/models/${Uri.encodeComponent(modelVersion)}/detect',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return DetectAnomaliesResponse.fromJson(response);
  }

  /// Lists the JSON Lines within a dataset. An Amazon Lookout for Vision JSON
  /// Line contains the anomaly information for a single image, including the
  /// image location and the assigned label.
  ///
  /// This operation requires permissions to perform the
  /// <code>lookoutvision:ListDatasetEntries</code> operation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [datasetType] :
  /// The type of the dataset that you want to list. Specify <code>train</code>
  /// to list the training dataset. Specify <code>test</code> to list the test
  /// dataset. If you have a single dataset project, specify <code>train</code>.
  ///
  /// Parameter [projectName] :
  /// The name of the project that contains the dataset that you want to list.
  ///
  /// Parameter [afterCreationDate] :
  /// Only includes entries after the specified date in the response. For
  /// example, <code>2020-06-23T00:00:00</code>.
  ///
  /// Parameter [anomalyClass] :
  /// Specify <code>normal</code> to include only normal images. Specify
  /// <code>anomaly</code> to only include anomalous entries. If you don't
  /// specify a value, Amazon Lookout for Vision returns normal and anomalous
  /// images.
  ///
  /// Parameter [beforeCreationDate] :
  /// Only includes entries before the specified date in the response. For
  /// example, <code>2020-06-23T00:00:00</code>.
  ///
  /// Parameter [labeled] :
  /// Specify <code>true</code> to include labeled entries, otherwise specify
  /// <code>false</code>. If you don't specify a value, Lookout for Vision
  /// returns all entries.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per paginated call. The largest
  /// value you can specify is 100. If you specify a value greater than 100, a
  /// ValidationException error occurs. The default value is 100.
  ///
  /// Parameter [nextToken] :
  /// If the previous response was incomplete (because there is more data to
  /// retrieve), Amazon Lookout for Vision returns a pagination token in the
  /// response. You can use this pagination token to retrieve the next set of
  /// dataset entries.
  ///
  /// Parameter [sourceRefContains] :
  /// Perform a "contains" search on the values of the <code>source-ref</code>
  /// key within the dataset. For example a value of "IMG_17" returns all JSON
  /// Lines where the <code>source-ref</code> key value matches <i>*IMG_17*</i>.
  Future<ListDatasetEntriesResponse> listDatasetEntries({
    required String datasetType,
    required String projectName,
    DateTime? afterCreationDate,
    String? anomalyClass,
    DateTime? beforeCreationDate,
    bool? labeled,
    int? maxResults,
    String? nextToken,
    String? sourceRefContains,
  }) async {
    ArgumentError.checkNotNull(datasetType, 'datasetType');
    _s.validateStringLength(
      'datasetType',
      datasetType,
      1,
      10,
      isRequired: true,
    );
    ArgumentError.checkNotNull(projectName, 'projectName');
    _s.validateStringLength(
      'projectName',
      projectName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'anomalyClass',
      anomalyClass,
      1,
      10,
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
      2048,
    );
    _s.validateStringLength(
      'sourceRefContains',
      sourceRefContains,
      1,
      2048,
    );
    final $query = <String, List<String>>{
      if (afterCreationDate != null)
        'createdAfter': [_s.iso8601ToJson(afterCreationDate).toString()],
      if (anomalyClass != null) 'anomalyClass': [anomalyClass],
      if (beforeCreationDate != null)
        'createdBefore': [_s.iso8601ToJson(beforeCreationDate).toString()],
      if (labeled != null) 'labeled': [labeled.toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (sourceRefContains != null) 'sourceRefContains': [sourceRefContains],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2020-11-20/projects/${Uri.encodeComponent(projectName)}/datasets/${Uri.encodeComponent(datasetType)}/entries',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDatasetEntriesResponse.fromJson(response);
  }

  /// Lists the versions of a model in an Amazon Lookout for Vision project.
  ///
  /// This operation requires permissions to perform the
  /// <code>lookoutvision:ListModels</code> operation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [projectName] :
  /// The name of the project that contains the model versions that you want to
  /// list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per paginated call. The largest
  /// value you can specify is 100. If you specify a value greater than 100, a
  /// ValidationException error occurs. The default value is 100.
  ///
  /// Parameter [nextToken] :
  /// If the previous response was incomplete (because there is more data to
  /// retrieve), Amazon Lookout for Vision returns a pagination token in the
  /// response. You can use this pagination token to retrieve the next set of
  /// models.
  Future<ListModelsResponse> listModels({
    required String projectName,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(projectName, 'projectName');
    _s.validateStringLength(
      'projectName',
      projectName,
      1,
      255,
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
      2048,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2020-11-20/projects/${Uri.encodeComponent(projectName)}/models',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListModelsResponse.fromJson(response);
  }

  /// Lists the Amazon Lookout for Vision projects in your AWS account.
  ///
  /// This operation requires permissions to perform the
  /// <code>lookoutvision:ListProjects</code> operation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per paginated call. The largest
  /// value you can specify is 100. If you specify a value greater than 100, a
  /// ValidationException error occurs. The default value is 100.
  ///
  /// Parameter [nextToken] :
  /// If the previous response was incomplete (because there is more data to
  /// retrieve), Amazon Lookout for Vision returns a pagination token in the
  /// response. You can use this pagination token to retrieve the next set of
  /// projects.
  Future<ListProjectsResponse> listProjects({
    int? maxResults,
    String? nextToken,
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
      2048,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2020-11-20/projects',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListProjectsResponse.fromJson(response);
  }

  /// Returns a list of tags attached to the specified Amazon Lookout for Vision
  /// model.
  ///
  /// This operation requires permissions to perform the
  /// <code>lookoutvision:ListTagsForResource</code> operation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the model for which you want to list
  /// tags.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1011,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2020-11-20/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Starts the running of the version of an Amazon Lookout for Vision model.
  /// Starting a model takes a while to complete. To check the current state of
  /// the model, use <a>DescribeModel</a>.
  ///
  /// A model is ready to use when its status is <code>HOSTED</code>.
  ///
  /// Once the model is running, you can detect custom labels in new images by
  /// calling <a>DetectAnomalies</a>.
  /// <note>
  /// You are charged for the amount of time that the model is running. To stop
  /// a running model, call <a>StopModel</a>.
  /// </note>
  /// This operation requires permissions to perform the
  /// <code>lookoutvision:StartModel</code> operation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [minInferenceUnits] :
  /// The minimum number of inference units to use. A single inference unit
  /// represents 1 hour of processing and can support up to 5 Transaction Pers
  /// Second (TPS). Use a higher number to increase the TPS throughput of your
  /// model. You are charged for the number of inference units that you use.
  ///
  /// Parameter [modelVersion] :
  /// The version of the model that you want to start.
  ///
  /// Parameter [projectName] :
  /// The name of the project that contains the model that you want to start.
  ///
  /// Parameter [clientToken] :
  /// ClientToken is an idempotency token that ensures a call to
  /// <code>StartModel</code> completes only once. You choose the value to pass.
  /// For example, An issue, such as an network outage, might prevent you from
  /// getting a response from <code>StartModel</code>. In this case, safely
  /// retry your call to <code>StartModel</code> by using the same
  /// <code>ClientToken</code> parameter value. An error occurs if the other
  /// input parameters are not the same as in the first request. Using a
  /// different value for <code>ClientToken</code> is considered a new call to
  /// <code>StartModel</code>. An idempotency token is active for 8 hours.
  Future<StartModelResponse> startModel({
    required int minInferenceUnits,
    required String modelVersion,
    required String projectName,
    String? clientToken,
  }) async {
    ArgumentError.checkNotNull(minInferenceUnits, 'minInferenceUnits');
    _s.validateNumRange(
      'minInferenceUnits',
      minInferenceUnits,
      1,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(modelVersion, 'modelVersion');
    _s.validateStringLength(
      'modelVersion',
      modelVersion,
      1,
      10,
      isRequired: true,
    );
    ArgumentError.checkNotNull(projectName, 'projectName');
    _s.validateStringLength(
      'projectName',
      projectName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      64,
    );
    final headers = <String, String>{
      if (clientToken != null) 'X-Amzn-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'MinInferenceUnits': minInferenceUnits,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2020-11-20/projects/${Uri.encodeComponent(projectName)}/models/${Uri.encodeComponent(modelVersion)}/start',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return StartModelResponse.fromJson(response);
  }

  /// Stops the hosting of a running model. The operation might take a while to
  /// complete. To check the current status, call <a>DescribeModel</a>.
  ///
  /// After the model hosting stops, the <code>Status</code> of the model is
  /// <code>TRAINED</code>.
  ///
  /// This operation requires permissions to perform the
  /// <code>lookoutvision:StopModel</code> operation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [modelVersion] :
  /// The version of the model that you want to stop.
  ///
  /// Parameter [projectName] :
  /// The name of the project that contains the model that you want to stop.
  ///
  /// Parameter [clientToken] :
  /// ClientToken is an idempotency token that ensures a call to
  /// <code>StopModel</code> completes only once. You choose the value to pass.
  /// For example, An issue, such as an network outage, might prevent you from
  /// getting a response from <code>StopModel</code>. In this case, safely retry
  /// your call to <code>StopModel</code> by using the same
  /// <code>ClientToken</code> parameter value. An error occurs if the other
  /// input parameters are not the same as in the first request. Using a
  /// different value for <code>ClientToken</code> is considered a new call to
  /// <code>StopModel</code>. An idempotency token is active for 8 hours.
  Future<StopModelResponse> stopModel({
    required String modelVersion,
    required String projectName,
    String? clientToken,
  }) async {
    ArgumentError.checkNotNull(modelVersion, 'modelVersion');
    _s.validateStringLength(
      'modelVersion',
      modelVersion,
      1,
      10,
      isRequired: true,
    );
    ArgumentError.checkNotNull(projectName, 'projectName');
    _s.validateStringLength(
      'projectName',
      projectName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      64,
    );
    final headers = <String, String>{
      if (clientToken != null) 'X-Amzn-Client-Token': clientToken.toString(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/2020-11-20/projects/${Uri.encodeComponent(projectName)}/models/${Uri.encodeComponent(modelVersion)}/stop',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return StopModelResponse.fromJson(response);
  }

  /// Adds one or more key-value tags to an Amazon Lookout for Vision model. For
  /// more information, see <i>Tagging a model</i> in the <i>Amazon Lookout for
  /// Vision Developer Guide</i>.
  ///
  /// This operation requires permissions to perform the
  /// <code>lookoutvision:TagResource</code> operation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the model to assign the tags.
  ///
  /// Parameter [tags] :
  /// The key-value tags to assign to the model.
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1011,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final $payload = <String, dynamic>{
      'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2020-11-20/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes one or more tags from an Amazon Lookout for Vision model. For more
  /// information, see <i>Tagging a model</i> in the <i>Amazon Lookout for
  /// Vision Developer Guide</i>.
  ///
  /// This operation requires permissions to perform the
  /// <code>lookoutvision:UntagResource</code> operation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the model from which you want to remove
  /// tags.
  ///
  /// Parameter [tagKeys] :
  /// A list of the keys of the tags that you want to remove.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1011,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/2020-11-20/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Adds one or more JSON Line entries to a dataset. A JSON Line includes
  /// information about an image used for training or testing an Amazon Lookout
  /// for Vision model. The following is an example JSON Line.
  ///
  /// Updating a dataset might take a while to complete. To check the current
  /// status, call <a>DescribeDataset</a> and check the <code>Status</code>
  /// field in the response.
  ///
  /// This operation requires permissions to perform the
  /// <code>lookoutvision:UpdateDatasetEntries</code> operation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [changes] :
  /// The entries to add to the dataset.
  ///
  /// Parameter [datasetType] :
  /// The type of the dataset that you want to update. Specify
  /// <code>train</code> to update the training dataset. Specify
  /// <code>test</code> to update the test dataset. If you have a single dataset
  /// project, specify <code>train</code>.
  ///
  /// Parameter [projectName] :
  /// The name of the project that contains the dataset that you want to update.
  ///
  /// Parameter [clientToken] :
  /// ClientToken is an idempotency token that ensures a call to
  /// <code>UpdateDatasetEntries</code> completes only once. You choose the
  /// value to pass. For example, An issue, such as an network outage, might
  /// prevent you from getting a response from
  /// <code>UpdateDatasetEntries</code>. In this case, safely retry your call to
  /// <code>UpdateDatasetEntries</code> by using the same
  /// <code>ClientToken</code> parameter value. An error occurs if the other
  /// input parameters are not the same as in the first request. Using a
  /// different value for <code>ClientToken</code> is considered a new call to
  /// <code>UpdateDatasetEntries</code>. An idempotency token is active for 8
  /// hours.
  Future<UpdateDatasetEntriesResponse> updateDatasetEntries({
    required Uint8List changes,
    required String datasetType,
    required String projectName,
    String? clientToken,
  }) async {
    ArgumentError.checkNotNull(changes, 'changes');
    ArgumentError.checkNotNull(datasetType, 'datasetType');
    _s.validateStringLength(
      'datasetType',
      datasetType,
      1,
      10,
      isRequired: true,
    );
    ArgumentError.checkNotNull(projectName, 'projectName');
    _s.validateStringLength(
      'projectName',
      projectName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      64,
    );
    final headers = <String, String>{
      if (clientToken != null) 'X-Amzn-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'Changes': base64Encode(changes),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/2020-11-20/projects/${Uri.encodeComponent(projectName)}/datasets/${Uri.encodeComponent(datasetType)}/entries',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return UpdateDatasetEntriesResponse.fromJson(response);
  }
}

class CreateDatasetResponse {
  /// Information about the dataset.
  final DatasetMetadata? datasetMetadata;

  CreateDatasetResponse({
    this.datasetMetadata,
  });

  factory CreateDatasetResponse.fromJson(Map<String, dynamic> json) {
    return CreateDatasetResponse(
      datasetMetadata: json['DatasetMetadata'] != null
          ? DatasetMetadata.fromJson(
              json['DatasetMetadata'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final datasetMetadata = this.datasetMetadata;
    return {
      if (datasetMetadata != null) 'DatasetMetadata': datasetMetadata,
    };
  }
}

class CreateModelResponse {
  /// The response from a call to <code>CreateModel</code>.
  final ModelMetadata? modelMetadata;

  CreateModelResponse({
    this.modelMetadata,
  });

  factory CreateModelResponse.fromJson(Map<String, dynamic> json) {
    return CreateModelResponse(
      modelMetadata: json['ModelMetadata'] != null
          ? ModelMetadata.fromJson(
              json['ModelMetadata'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final modelMetadata = this.modelMetadata;
    return {
      if (modelMetadata != null) 'ModelMetadata': modelMetadata,
    };
  }
}

class CreateProjectResponse {
  /// Information about the project.
  final ProjectMetadata? projectMetadata;

  CreateProjectResponse({
    this.projectMetadata,
  });

  factory CreateProjectResponse.fromJson(Map<String, dynamic> json) {
    return CreateProjectResponse(
      projectMetadata: json['ProjectMetadata'] != null
          ? ProjectMetadata.fromJson(
              json['ProjectMetadata'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final projectMetadata = this.projectMetadata;
    return {
      if (projectMetadata != null) 'ProjectMetadata': projectMetadata,
    };
  }
}

/// The description for a dataset. For more information, see
/// <a>DescribeDataset</a>.
class DatasetDescription {
  /// The Unix timestamp for the time and date that the dataset was created.
  final DateTime? creationTimestamp;

  /// The type of the dataset. The value <code>train</code> represents a training
  /// dataset or single dataset project. The value <code>test</code> represents a
  /// test dataset.
  final String? datasetType;

  /// <p/>
  final DatasetImageStats? imageStats;

  /// The Unix timestamp for the date and time that the dataset was last updated.
  final DateTime? lastUpdatedTimestamp;

  /// The name of the project that contains the dataset.
  final String? projectName;

  /// The status of the dataset.
  final DatasetStatus? status;

  /// The status message for the dataset.
  final String? statusMessage;

  DatasetDescription({
    this.creationTimestamp,
    this.datasetType,
    this.imageStats,
    this.lastUpdatedTimestamp,
    this.projectName,
    this.status,
    this.statusMessage,
  });

  factory DatasetDescription.fromJson(Map<String, dynamic> json) {
    return DatasetDescription(
      creationTimestamp: timeStampFromJson(json['CreationTimestamp']),
      datasetType: json['DatasetType'] as String?,
      imageStats: json['ImageStats'] != null
          ? DatasetImageStats.fromJson(
              json['ImageStats'] as Map<String, dynamic>)
          : null,
      lastUpdatedTimestamp: timeStampFromJson(json['LastUpdatedTimestamp']),
      projectName: json['ProjectName'] as String?,
      status: (json['Status'] as String?)?.toDatasetStatus(),
      statusMessage: json['StatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTimestamp = this.creationTimestamp;
    final datasetType = this.datasetType;
    final imageStats = this.imageStats;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final projectName = this.projectName;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      if (creationTimestamp != null)
        'CreationTimestamp': unixTimestampToJson(creationTimestamp),
      if (datasetType != null) 'DatasetType': datasetType,
      if (imageStats != null) 'ImageStats': imageStats,
      if (lastUpdatedTimestamp != null)
        'LastUpdatedTimestamp': unixTimestampToJson(lastUpdatedTimestamp),
      if (projectName != null) 'ProjectName': projectName,
      if (status != null) 'Status': status.toValue(),
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

/// Location information about a manifest file. You can use a manifest file to
/// create a dataset.
class DatasetGroundTruthManifest {
  /// The S3 bucket location for the manifest file.
  final InputS3Object? s3Object;

  DatasetGroundTruthManifest({
    this.s3Object,
  });

  factory DatasetGroundTruthManifest.fromJson(Map<String, dynamic> json) {
    return DatasetGroundTruthManifest(
      s3Object: json['S3Object'] != null
          ? InputS3Object.fromJson(json['S3Object'] as Map<String, dynamic>)
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

/// Statistics about the images in a dataset.
class DatasetImageStats {
  /// the total number of images labeled as an anomaly.
  final int? anomaly;

  /// The total number of labeled images.
  final int? labeled;

  /// The total number of images labeled as normal.
  final int? normal;

  /// The total number of images in the dataset.
  final int? total;

  DatasetImageStats({
    this.anomaly,
    this.labeled,
    this.normal,
    this.total,
  });

  factory DatasetImageStats.fromJson(Map<String, dynamic> json) {
    return DatasetImageStats(
      anomaly: json['Anomaly'] as int?,
      labeled: json['Labeled'] as int?,
      normal: json['Normal'] as int?,
      total: json['Total'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final anomaly = this.anomaly;
    final labeled = this.labeled;
    final normal = this.normal;
    final total = this.total;
    return {
      if (anomaly != null) 'Anomaly': anomaly,
      if (labeled != null) 'Labeled': labeled,
      if (normal != null) 'Normal': normal,
      if (total != null) 'Total': total,
    };
  }
}

/// Sumary information for an Amazon Lookout for Vision dataset.
class DatasetMetadata {
  /// The Unix timestamp for the date and time that the dataset was created.
  final DateTime? creationTimestamp;

  /// The type of the dataset.
  final String? datasetType;

  /// The status for the dataset.
  final DatasetStatus? status;

  /// The status message for the dataset.
  final String? statusMessage;

  DatasetMetadata({
    this.creationTimestamp,
    this.datasetType,
    this.status,
    this.statusMessage,
  });

  factory DatasetMetadata.fromJson(Map<String, dynamic> json) {
    return DatasetMetadata(
      creationTimestamp: timeStampFromJson(json['CreationTimestamp']),
      datasetType: json['DatasetType'] as String?,
      status: (json['Status'] as String?)?.toDatasetStatus(),
      statusMessage: json['StatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTimestamp = this.creationTimestamp;
    final datasetType = this.datasetType;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      if (creationTimestamp != null)
        'CreationTimestamp': unixTimestampToJson(creationTimestamp),
      if (datasetType != null) 'DatasetType': datasetType,
      if (status != null) 'Status': status.toValue(),
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

/// Information about the location of a manifest file that Amazon Lookout for
/// Vision uses to to create a dataset.
class DatasetSource {
  /// Location information for the manifest file.
  final DatasetGroundTruthManifest? groundTruthManifest;

  DatasetSource({
    this.groundTruthManifest,
  });

  factory DatasetSource.fromJson(Map<String, dynamic> json) {
    return DatasetSource(
      groundTruthManifest: json['GroundTruthManifest'] != null
          ? DatasetGroundTruthManifest.fromJson(
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

enum DatasetStatus {
  createInProgress,
  createComplete,
  createFailed,
  updateInProgress,
  updateComplete,
  updateFailedRollbackInProgress,
  updateFailedRollbackComplete,
  deleteInProgress,
  deleteComplete,
  deleteFailed,
}

extension on DatasetStatus {
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
      case DatasetStatus.updateFailedRollbackInProgress:
        return 'UPDATE_FAILED_ROLLBACK_IN_PROGRESS';
      case DatasetStatus.updateFailedRollbackComplete:
        return 'UPDATE_FAILED_ROLLBACK_COMPLETE';
      case DatasetStatus.deleteInProgress:
        return 'DELETE_IN_PROGRESS';
      case DatasetStatus.deleteComplete:
        return 'DELETE_COMPLETE';
      case DatasetStatus.deleteFailed:
        return 'DELETE_FAILED';
    }
  }
}

extension on String {
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
      case 'UPDATE_FAILED_ROLLBACK_IN_PROGRESS':
        return DatasetStatus.updateFailedRollbackInProgress;
      case 'UPDATE_FAILED_ROLLBACK_COMPLETE':
        return DatasetStatus.updateFailedRollbackComplete;
      case 'DELETE_IN_PROGRESS':
        return DatasetStatus.deleteInProgress;
      case 'DELETE_COMPLETE':
        return DatasetStatus.deleteComplete;
      case 'DELETE_FAILED':
        return DatasetStatus.deleteFailed;
    }
    throw Exception('$this is not known in enum DatasetStatus');
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

class DeleteModelResponse {
  /// The Amazon Resource Name (ARN) of the model that was deleted.
  final String? modelArn;

  DeleteModelResponse({
    this.modelArn,
  });

  factory DeleteModelResponse.fromJson(Map<String, dynamic> json) {
    return DeleteModelResponse(
      modelArn: json['ModelArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final modelArn = this.modelArn;
    return {
      if (modelArn != null) 'ModelArn': modelArn,
    };
  }
}

class DeleteProjectResponse {
  /// The Amazon Resource Name (ARN) of the project that was deleted.
  final String? projectArn;

  DeleteProjectResponse({
    this.projectArn,
  });

  factory DeleteProjectResponse.fromJson(Map<String, dynamic> json) {
    return DeleteProjectResponse(
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

class DescribeDatasetResponse {
  /// The description of the requested dataset.
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

class DescribeModelResponse {
  /// Contains the description of the model.
  final ModelDescription? modelDescription;

  DescribeModelResponse({
    this.modelDescription,
  });

  factory DescribeModelResponse.fromJson(Map<String, dynamic> json) {
    return DescribeModelResponse(
      modelDescription: json['ModelDescription'] != null
          ? ModelDescription.fromJson(
              json['ModelDescription'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final modelDescription = this.modelDescription;
    return {
      if (modelDescription != null) 'ModelDescription': modelDescription,
    };
  }
}

class DescribeProjectResponse {
  /// The description of the project.
  final ProjectDescription? projectDescription;

  DescribeProjectResponse({
    this.projectDescription,
  });

  factory DescribeProjectResponse.fromJson(Map<String, dynamic> json) {
    return DescribeProjectResponse(
      projectDescription: json['ProjectDescription'] != null
          ? ProjectDescription.fromJson(
              json['ProjectDescription'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final projectDescription = this.projectDescription;
    return {
      if (projectDescription != null) 'ProjectDescription': projectDescription,
    };
  }
}

class DetectAnomaliesResponse {
  /// The results of the <code>DetectAnomalies</code> operation.
  final DetectAnomalyResult? detectAnomalyResult;

  DetectAnomaliesResponse({
    this.detectAnomalyResult,
  });

  factory DetectAnomaliesResponse.fromJson(Map<String, dynamic> json) {
    return DetectAnomaliesResponse(
      detectAnomalyResult: json['DetectAnomalyResult'] != null
          ? DetectAnomalyResult.fromJson(
              json['DetectAnomalyResult'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final detectAnomalyResult = this.detectAnomalyResult;
    return {
      if (detectAnomalyResult != null)
        'DetectAnomalyResult': detectAnomalyResult,
    };
  }
}

/// The prediction results from a call to <a>DetectAnomalies</a>.
class DetectAnomalyResult {
  /// The confidence that Amazon Lookout for Vision has in the accuracy of the
  /// prediction.
  final double? confidence;

  /// True if the image contains an anomaly, otherwise false.
  final bool? isAnomalous;

  /// The source of the image that was analyzed. <code>direct</code> means that
  /// the images was supplied from the local computer. No other values are
  /// supported.
  final ImageSource? source;

  DetectAnomalyResult({
    this.confidence,
    this.isAnomalous,
    this.source,
  });

  factory DetectAnomalyResult.fromJson(Map<String, dynamic> json) {
    return DetectAnomalyResult(
      confidence: json['Confidence'] as double?,
      isAnomalous: json['IsAnomalous'] as bool?,
      source: json['Source'] != null
          ? ImageSource.fromJson(json['Source'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final confidence = this.confidence;
    final isAnomalous = this.isAnomalous;
    final source = this.source;
    return {
      if (confidence != null) 'Confidence': confidence,
      if (isAnomalous != null) 'IsAnomalous': isAnomalous,
      if (source != null) 'Source': source,
    };
  }
}

/// The source for an image.
class ImageSource {
  /// The type of the image.
  final String? type;

  ImageSource({
    this.type,
  });

  factory ImageSource.fromJson(Map<String, dynamic> json) {
    return ImageSource(
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    return {
      if (type != null) 'Type': type,
    };
  }
}

/// Amazon S3 Location information for an input manifest file.
class InputS3Object {
  /// The Amazon S3 bucket that contains the manifest.
  final String bucket;

  /// The name and location of the manifest file withiin the bucket.
  final String key;

  /// The version ID of the bucket.
  final String? versionId;

  InputS3Object({
    required this.bucket,
    required this.key,
    this.versionId,
  });

  factory InputS3Object.fromJson(Map<String, dynamic> json) {
    return InputS3Object(
      bucket: json['Bucket'] as String,
      key: json['Key'] as String,
      versionId: json['VersionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final key = this.key;
    final versionId = this.versionId;
    return {
      'Bucket': bucket,
      'Key': key,
      if (versionId != null) 'VersionId': versionId,
    };
  }
}

class ListDatasetEntriesResponse {
  /// A list of the entries (JSON Lines) within the dataset.
  final List<String>? datasetEntries;

  /// If the response is truncated, Amazon Lookout for Vision returns this token
  /// that you can use in the subsequent request to retrieve the next set
  /// ofdataset entries.
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

class ListModelsResponse {
  /// A list of model versions in the specified project.
  final List<ModelMetadata>? models;

  /// If the response is truncated, Amazon Lookout for Vision returns this token
  /// that you can use in the subsequent request to retrieve the next set of
  /// models.
  final String? nextToken;

  ListModelsResponse({
    this.models,
    this.nextToken,
  });

  factory ListModelsResponse.fromJson(Map<String, dynamic> json) {
    return ListModelsResponse(
      models: (json['Models'] as List?)
          ?.whereNotNull()
          .map((e) => ModelMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final models = this.models;
    final nextToken = this.nextToken;
    return {
      if (models != null) 'Models': models,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListProjectsResponse {
  /// If the response is truncated, Amazon Lookout for Vision returns this token
  /// that you can use in the subsequent request to retrieve the next set of
  /// projects.
  final String? nextToken;

  /// A list of projects in your AWS account.
  final List<ProjectMetadata>? projects;

  ListProjectsResponse({
    this.nextToken,
    this.projects,
  });

  factory ListProjectsResponse.fromJson(Map<String, dynamic> json) {
    return ListProjectsResponse(
      nextToken: json['NextToken'] as String?,
      projects: (json['Projects'] as List?)
          ?.whereNotNull()
          .map((e) => ProjectMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final projects = this.projects;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (projects != null) 'Projects': projects,
    };
  }
}

class ListTagsForResourceResponse {
  /// A map of tag keys and values attached to the specified model.
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

/// Describes an Amazon Lookout for Vision model.
class ModelDescription {
  /// The unix timestamp for the date and time that the model was created.
  final DateTime? creationTimestamp;

  /// The description for the model.
  final String? description;

  /// The unix timestamp for the date and time that the evaluation ended.
  final DateTime? evaluationEndTimestamp;

  /// The S3 location where Amazon Lookout for Vision saves the manifest file that
  /// was used to test the trained model and generate the performance scores.
  final OutputS3Object? evaluationManifest;

  /// The S3 location where Amazon Lookout for Vision saves the performance
  /// metrics.
  final OutputS3Object? evaluationResult;

  /// The identifer for the AWS Key Management Service (AWS KMS) key that was used
  /// to encrypt the model during training.
  final String? kmsKeyId;

  /// The Amazon Resource Name (ARN) of the model.
  final String? modelArn;

  /// The version of the model
  final String? modelVersion;

  /// The S3 location where Amazon Lookout for Vision saves model training files.
  final OutputConfig? outputConfig;

  /// Performance metrics for the model. Created during training.
  final ModelPerformance? performance;

  /// The status of the model.
  final ModelStatus? status;

  /// The status message for the model.
  final String? statusMessage;

  ModelDescription({
    this.creationTimestamp,
    this.description,
    this.evaluationEndTimestamp,
    this.evaluationManifest,
    this.evaluationResult,
    this.kmsKeyId,
    this.modelArn,
    this.modelVersion,
    this.outputConfig,
    this.performance,
    this.status,
    this.statusMessage,
  });

  factory ModelDescription.fromJson(Map<String, dynamic> json) {
    return ModelDescription(
      creationTimestamp: timeStampFromJson(json['CreationTimestamp']),
      description: json['Description'] as String?,
      evaluationEndTimestamp: timeStampFromJson(json['EvaluationEndTimestamp']),
      evaluationManifest: json['EvaluationManifest'] != null
          ? OutputS3Object.fromJson(
              json['EvaluationManifest'] as Map<String, dynamic>)
          : null,
      evaluationResult: json['EvaluationResult'] != null
          ? OutputS3Object.fromJson(
              json['EvaluationResult'] as Map<String, dynamic>)
          : null,
      kmsKeyId: json['KmsKeyId'] as String?,
      modelArn: json['ModelArn'] as String?,
      modelVersion: json['ModelVersion'] as String?,
      outputConfig: json['OutputConfig'] != null
          ? OutputConfig.fromJson(json['OutputConfig'] as Map<String, dynamic>)
          : null,
      performance: json['Performance'] != null
          ? ModelPerformance.fromJson(
              json['Performance'] as Map<String, dynamic>)
          : null,
      status: (json['Status'] as String?)?.toModelStatus(),
      statusMessage: json['StatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTimestamp = this.creationTimestamp;
    final description = this.description;
    final evaluationEndTimestamp = this.evaluationEndTimestamp;
    final evaluationManifest = this.evaluationManifest;
    final evaluationResult = this.evaluationResult;
    final kmsKeyId = this.kmsKeyId;
    final modelArn = this.modelArn;
    final modelVersion = this.modelVersion;
    final outputConfig = this.outputConfig;
    final performance = this.performance;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      if (creationTimestamp != null)
        'CreationTimestamp': unixTimestampToJson(creationTimestamp),
      if (description != null) 'Description': description,
      if (evaluationEndTimestamp != null)
        'EvaluationEndTimestamp': unixTimestampToJson(evaluationEndTimestamp),
      if (evaluationManifest != null) 'EvaluationManifest': evaluationManifest,
      if (evaluationResult != null) 'EvaluationResult': evaluationResult,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (modelArn != null) 'ModelArn': modelArn,
      if (modelVersion != null) 'ModelVersion': modelVersion,
      if (outputConfig != null) 'OutputConfig': outputConfig,
      if (performance != null) 'Performance': performance,
      if (status != null) 'Status': status.toValue(),
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

enum ModelHostingStatus {
  startingHosting,
  hosted,
  hostingFailed,
  stoppingHosting,
  systemUpdating,
}

extension on ModelHostingStatus {
  String toValue() {
    switch (this) {
      case ModelHostingStatus.startingHosting:
        return 'STARTING_HOSTING';
      case ModelHostingStatus.hosted:
        return 'HOSTED';
      case ModelHostingStatus.hostingFailed:
        return 'HOSTING_FAILED';
      case ModelHostingStatus.stoppingHosting:
        return 'STOPPING_HOSTING';
      case ModelHostingStatus.systemUpdating:
        return 'SYSTEM_UPDATING';
    }
  }
}

extension on String {
  ModelHostingStatus toModelHostingStatus() {
    switch (this) {
      case 'STARTING_HOSTING':
        return ModelHostingStatus.startingHosting;
      case 'HOSTED':
        return ModelHostingStatus.hosted;
      case 'HOSTING_FAILED':
        return ModelHostingStatus.hostingFailed;
      case 'STOPPING_HOSTING':
        return ModelHostingStatus.stoppingHosting;
      case 'SYSTEM_UPDATING':
        return ModelHostingStatus.systemUpdating;
    }
    throw Exception('$this is not known in enum ModelHostingStatus');
  }
}

/// Describes an Amazon Lookout for Vision model.
class ModelMetadata {
  /// The unix timestamp for the date and time that the model was created.
  final DateTime? creationTimestamp;

  /// The description for the model.
  final String? description;

  /// The Amazon Resource Name (ARN) of the model.
  final String? modelArn;

  /// The version of the model.
  final String? modelVersion;

  /// Performance metrics for the model. Not available until training has
  /// successfully completed.
  final ModelPerformance? performance;

  /// The status of the model.
  final ModelStatus? status;

  /// The status message for the model.
  final String? statusMessage;

  ModelMetadata({
    this.creationTimestamp,
    this.description,
    this.modelArn,
    this.modelVersion,
    this.performance,
    this.status,
    this.statusMessage,
  });

  factory ModelMetadata.fromJson(Map<String, dynamic> json) {
    return ModelMetadata(
      creationTimestamp: timeStampFromJson(json['CreationTimestamp']),
      description: json['Description'] as String?,
      modelArn: json['ModelArn'] as String?,
      modelVersion: json['ModelVersion'] as String?,
      performance: json['Performance'] != null
          ? ModelPerformance.fromJson(
              json['Performance'] as Map<String, dynamic>)
          : null,
      status: (json['Status'] as String?)?.toModelStatus(),
      statusMessage: json['StatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTimestamp = this.creationTimestamp;
    final description = this.description;
    final modelArn = this.modelArn;
    final modelVersion = this.modelVersion;
    final performance = this.performance;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      if (creationTimestamp != null)
        'CreationTimestamp': unixTimestampToJson(creationTimestamp),
      if (description != null) 'Description': description,
      if (modelArn != null) 'ModelArn': modelArn,
      if (modelVersion != null) 'ModelVersion': modelVersion,
      if (performance != null) 'Performance': performance,
      if (status != null) 'Status': status.toValue(),
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

/// Information about the evaluation performance of a trained model.
class ModelPerformance {
  /// The overall F1 score metric for the trained model.
  final double? f1Score;

  /// The overall precision metric value for the trained model.
  final double? precision;

  /// The overall recall metric value for the trained model.
  final double? recall;

  ModelPerformance({
    this.f1Score,
    this.precision,
    this.recall,
  });

  factory ModelPerformance.fromJson(Map<String, dynamic> json) {
    return ModelPerformance(
      f1Score: json['F1Score'] as double?,
      precision: json['Precision'] as double?,
      recall: json['Recall'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final f1Score = this.f1Score;
    final precision = this.precision;
    final recall = this.recall;
    return {
      if (f1Score != null) 'F1Score': f1Score,
      if (precision != null) 'Precision': precision,
      if (recall != null) 'Recall': recall,
    };
  }
}

enum ModelStatus {
  training,
  trained,
  trainingFailed,
  startingHosting,
  hosted,
  hostingFailed,
  stoppingHosting,
  systemUpdating,
  deleting,
}

extension on ModelStatus {
  String toValue() {
    switch (this) {
      case ModelStatus.training:
        return 'TRAINING';
      case ModelStatus.trained:
        return 'TRAINED';
      case ModelStatus.trainingFailed:
        return 'TRAINING_FAILED';
      case ModelStatus.startingHosting:
        return 'STARTING_HOSTING';
      case ModelStatus.hosted:
        return 'HOSTED';
      case ModelStatus.hostingFailed:
        return 'HOSTING_FAILED';
      case ModelStatus.stoppingHosting:
        return 'STOPPING_HOSTING';
      case ModelStatus.systemUpdating:
        return 'SYSTEM_UPDATING';
      case ModelStatus.deleting:
        return 'DELETING';
    }
  }
}

extension on String {
  ModelStatus toModelStatus() {
    switch (this) {
      case 'TRAINING':
        return ModelStatus.training;
      case 'TRAINED':
        return ModelStatus.trained;
      case 'TRAINING_FAILED':
        return ModelStatus.trainingFailed;
      case 'STARTING_HOSTING':
        return ModelStatus.startingHosting;
      case 'HOSTED':
        return ModelStatus.hosted;
      case 'HOSTING_FAILED':
        return ModelStatus.hostingFailed;
      case 'STOPPING_HOSTING':
        return ModelStatus.stoppingHosting;
      case 'SYSTEM_UPDATING':
        return ModelStatus.systemUpdating;
      case 'DELETING':
        return ModelStatus.deleting;
    }
    throw Exception('$this is not known in enum ModelStatus');
  }
}

/// The S3 location where Amazon Lookout for Vision saves model training files.
class OutputConfig {
  /// The S3 location for the output.
  final S3Location s3Location;

  OutputConfig({
    required this.s3Location,
  });

  factory OutputConfig.fromJson(Map<String, dynamic> json) {
    return OutputConfig(
      s3Location:
          S3Location.fromJson(json['S3Location'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final s3Location = this.s3Location;
    return {
      'S3Location': s3Location,
    };
  }
}

/// The S3 location where Amazon Lookout for Vision saves training output.
class OutputS3Object {
  /// The bucket that contains the training output.
  final String bucket;

  /// The location of the training output in the bucket.
  final String key;

  OutputS3Object({
    required this.bucket,
    required this.key,
  });

  factory OutputS3Object.fromJson(Map<String, dynamic> json) {
    return OutputS3Object(
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

/// Describe an Amazon Lookout for Vision project. For more information, see
/// <a>DescribeProject</a>.
class ProjectDescription {
  /// The unix timestamp for the date and time that the project was created.
  final DateTime? creationTimestamp;

  /// A list of datasets in the project.
  final List<DatasetMetadata>? datasets;

  /// The Amazon Resource Name (ARN) of the project.
  final String? projectArn;

  /// The name of the project.
  final String? projectName;

  ProjectDescription({
    this.creationTimestamp,
    this.datasets,
    this.projectArn,
    this.projectName,
  });

  factory ProjectDescription.fromJson(Map<String, dynamic> json) {
    return ProjectDescription(
      creationTimestamp: timeStampFromJson(json['CreationTimestamp']),
      datasets: (json['Datasets'] as List?)
          ?.whereNotNull()
          .map((e) => DatasetMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      projectArn: json['ProjectArn'] as String?,
      projectName: json['ProjectName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTimestamp = this.creationTimestamp;
    final datasets = this.datasets;
    final projectArn = this.projectArn;
    final projectName = this.projectName;
    return {
      if (creationTimestamp != null)
        'CreationTimestamp': unixTimestampToJson(creationTimestamp),
      if (datasets != null) 'Datasets': datasets,
      if (projectArn != null) 'ProjectArn': projectArn,
      if (projectName != null) 'ProjectName': projectName,
    };
  }
}

/// Metadata about an Amazon Lookout for Vision project.
class ProjectMetadata {
  /// The unix timestamp for the date and time that the project was created.
  final DateTime? creationTimestamp;

  /// The Amazon Resource Name (ARN) of the project.
  final String? projectArn;

  /// The name of the project.
  final String? projectName;

  ProjectMetadata({
    this.creationTimestamp,
    this.projectArn,
    this.projectName,
  });

  factory ProjectMetadata.fromJson(Map<String, dynamic> json) {
    return ProjectMetadata(
      creationTimestamp: timeStampFromJson(json['CreationTimestamp']),
      projectArn: json['ProjectArn'] as String?,
      projectName: json['ProjectName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTimestamp = this.creationTimestamp;
    final projectArn = this.projectArn;
    final projectName = this.projectName;
    return {
      if (creationTimestamp != null)
        'CreationTimestamp': unixTimestampToJson(creationTimestamp),
      if (projectArn != null) 'ProjectArn': projectArn,
      if (projectName != null) 'ProjectName': projectName,
    };
  }
}

/// Information about the location training output.
class S3Location {
  /// The S3 bucket that contains the training output.
  final String bucket;

  /// The path of the folder, within the S3 bucket, that contains the training
  /// output.
  final String? prefix;

  S3Location({
    required this.bucket,
    this.prefix,
  });

  factory S3Location.fromJson(Map<String, dynamic> json) {
    return S3Location(
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

class StartModelResponse {
  /// The current running status of the model.
  final ModelHostingStatus? status;

  StartModelResponse({
    this.status,
  });

  factory StartModelResponse.fromJson(Map<String, dynamic> json) {
    return StartModelResponse(
      status: (json['Status'] as String?)?.toModelHostingStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'Status': status.toValue(),
    };
  }
}

class StopModelResponse {
  /// The status of the model.
  final ModelHostingStatus? status;

  StopModelResponse({
    this.status,
  });

  factory StopModelResponse.fromJson(Map<String, dynamic> json) {
    return StopModelResponse(
      status: (json['Status'] as String?)?.toModelHostingStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// A key and value pair that is attached to the specified Amazon Lookout for
/// Vision model.
class Tag {
  /// The key of the tag that is attached to the specified model.
  final String key;

  /// The value of the tag that is attached to the specified model.
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
  /// The status of the dataset update.
  final DatasetStatus? status;

  UpdateDatasetEntriesResponse({
    this.status,
  });

  factory UpdateDatasetEntriesResponse.fromJson(Map<String, dynamic> json) {
    return UpdateDatasetEntriesResponse(
      status: (json['Status'] as String?)?.toDatasetStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'Status': status.toValue(),
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
