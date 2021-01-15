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

part '2020-11-20.g.dart';

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
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
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
  /// <code>DatasetType</code>. of dataset with
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
    @_s.required String datasetType,
    @_s.required String projectName,
    String clientToken,
    DatasetSource datasetSource,
  }) async {
    ArgumentError.checkNotNull(datasetType, 'datasetType');
    _s.validateStringLength(
      'datasetType',
      datasetType,
      1,
      10,
      isRequired: true,
    );
    _s.validateStringPattern(
      'datasetType',
      datasetType,
      r'''train|test''',
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
    _s.validateStringPattern(
      'projectName',
      projectName,
      r'''[a-zA-Z0-9][a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      64,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''^[a-zA-Z0-9-]+$''',
    );
    final headers = <String, String>{};
    clientToken?.let((v) => headers['X-Amzn-Client-Token'] = v.toString());
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
  /// The identifier of the AWS Key Management Service (AWS KMS) customer master
  /// key (CMK) to use for encypting the model. If this parameter is not
  /// specified, the model is encrypted by a key that AWS owns and manages.
  Future<CreateModelResponse> createModel({
    @_s.required OutputConfig outputConfig,
    @_s.required String projectName,
    String clientToken,
    ModelDescription description,
    String kmsKeyId,
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
    _s.validateStringPattern(
      'projectName',
      projectName,
      r'''[a-zA-Z0-9][a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      64,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''^[a-zA-Z0-9-]+$''',
    );
    _s.validateStringLength(
      'kmsKeyId',
      kmsKeyId,
      1,
      2048,
    );
    _s.validateStringPattern(
      'kmsKeyId',
      kmsKeyId,
      r'''^[A-Za-z0-9][A-Za-z0-9:_/+=,@.-]{0,2048}$''',
    );
    final headers = <String, String>{};
    clientToken?.let((v) => headers['X-Amzn-Client-Token'] = v.toString());
    final $payload = <String, dynamic>{
      'OutputConfig': outputConfig,
      if (description != null) 'Description': description,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
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
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [projectName] :
  /// S nsme for the project.
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
    @_s.required String projectName,
    String clientToken,
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
      r'''[a-zA-Z0-9][a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      64,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''^[a-zA-Z0-9-]+$''',
    );
    final headers = <String, String>{};
    clientToken?.let((v) => headers['X-Amzn-Client-Token'] = v.toString());
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
  /// It might take a while to delete the dataset. To check the current status,
  /// check the <code>Status</code> field in the response from a call to
  /// <a>DescribeDataset</a>.
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
    @_s.required String datasetType,
    @_s.required String projectName,
    String clientToken,
  }) async {
    ArgumentError.checkNotNull(datasetType, 'datasetType');
    _s.validateStringLength(
      'datasetType',
      datasetType,
      1,
      10,
      isRequired: true,
    );
    _s.validateStringPattern(
      'datasetType',
      datasetType,
      r'''train|test''',
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
    _s.validateStringPattern(
      'projectName',
      projectName,
      r'''[a-zA-Z0-9][a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      64,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''^[a-zA-Z0-9-]+$''',
    );
    final headers = <String, String>{};
    clientToken?.let((v) => headers['X-Amzn-Client-Token'] = v.toString());
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2020-11-20/projects/${Uri.encodeComponent(projectName)}/datasets/${Uri.encodeComponent(datasetType)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteDatasetResponse.fromJson(response);
  }

  /// Deletes an Amazon Lookout for Vision model. You can't delete a running
  /// model. To stop a running model, use the <a>StopModel</a> operation.
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
    @_s.required String modelVersion,
    @_s.required String projectName,
    String clientToken,
  }) async {
    ArgumentError.checkNotNull(modelVersion, 'modelVersion');
    _s.validateStringLength(
      'modelVersion',
      modelVersion,
      1,
      10,
      isRequired: true,
    );
    _s.validateStringPattern(
      'modelVersion',
      modelVersion,
      r'''([1-9][0-9]*|latest)''',
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
    _s.validateStringPattern(
      'projectName',
      projectName,
      r'''[a-zA-Z0-9][a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      64,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''^[a-zA-Z0-9-]+$''',
    );
    final headers = <String, String>{};
    clientToken?.let((v) => headers['X-Amzn-Client-Token'] = v.toString());
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
  /// The training and test datasets are deleted automatically for you. The
  /// images referenced by the training and test datasets aren't deleted.
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
    @_s.required String projectName,
    String clientToken,
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
      r'''[a-zA-Z0-9][a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      64,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''^[a-zA-Z0-9-]+$''',
    );
    final headers = <String, String>{};
    clientToken?.let((v) => headers['X-Amzn-Client-Token'] = v.toString());
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
    @_s.required String datasetType,
    @_s.required String projectName,
  }) async {
    ArgumentError.checkNotNull(datasetType, 'datasetType');
    _s.validateStringLength(
      'datasetType',
      datasetType,
      1,
      10,
      isRequired: true,
    );
    _s.validateStringPattern(
      'datasetType',
      datasetType,
      r'''train|test''',
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
    _s.validateStringPattern(
      'projectName',
      projectName,
      r'''[a-zA-Z0-9][a-zA-Z0-9_\-]*''',
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
    @_s.required String modelVersion,
    @_s.required String projectName,
  }) async {
    ArgumentError.checkNotNull(modelVersion, 'modelVersion');
    _s.validateStringLength(
      'modelVersion',
      modelVersion,
      1,
      10,
      isRequired: true,
    );
    _s.validateStringPattern(
      'modelVersion',
      modelVersion,
      r'''([1-9][0-9]*|latest)''',
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
    _s.validateStringPattern(
      'projectName',
      projectName,
      r'''[a-zA-Z0-9][a-zA-Z0-9_\-]*''',
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
      r'''[a-zA-Z0-9][a-zA-Z0-9_\-]*''',
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
    @_s.required Uint8List body,
    @_s.required String contentType,
    @_s.required String modelVersion,
    @_s.required String projectName,
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
    _s.validateStringPattern(
      'contentType',
      contentType,
      r'''.*''',
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
    _s.validateStringPattern(
      'modelVersion',
      modelVersion,
      r'''([1-9][0-9]*|latest)''',
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
    _s.validateStringPattern(
      'projectName',
      projectName,
      r'''[a-zA-Z0-9][a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    final headers = <String, String>{};
    contentType?.let((v) => headers['content-type'] = v.toString());
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
    @_s.required String datasetType,
    @_s.required String projectName,
    DateTime afterCreationDate,
    String anomalyClass,
    DateTime beforeCreationDate,
    bool labeled,
    int maxResults,
    String nextToken,
    String sourceRefContains,
  }) async {
    ArgumentError.checkNotNull(datasetType, 'datasetType');
    _s.validateStringLength(
      'datasetType',
      datasetType,
      1,
      10,
      isRequired: true,
    );
    _s.validateStringPattern(
      'datasetType',
      datasetType,
      r'''train|test''',
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
    _s.validateStringPattern(
      'projectName',
      projectName,
      r'''[a-zA-Z0-9][a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'anomalyClass',
      anomalyClass,
      1,
      10,
    );
    _s.validateStringPattern(
      'anomalyClass',
      anomalyClass,
      r'''(normal|anomaly)''',
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[a-zA-Z0-9\/\+\=]{0,2048}$''',
    );
    _s.validateStringLength(
      'sourceRefContains',
      sourceRefContains,
      1,
      2048,
    );
    _s.validateStringPattern(
      'sourceRefContains',
      sourceRefContains,
      r'''.*\S.*''',
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
    @_s.required String projectName,
    int maxResults,
    String nextToken,
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
      r'''[a-zA-Z0-9][a-zA-Z0-9_\-]*''',
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[a-zA-Z0-9\/\+\=]{0,2048}$''',
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
      2048,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[a-zA-Z0-9\/\+\=]{0,2048}$''',
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

  /// Starts the running of the version of an Amazon Lookout for Vision model.
  /// Starting a model takes a while to complete. To check the current state of
  /// the model, use <a>DescribeModel</a>.
  ///
  /// Once the model is running, you can detect custom labels in new images by
  /// calling <a>DetectAnomalies</a>.
  /// <note>
  /// You are charged for the amount of time that the model is running. To stop
  /// a running model, call <a>StopModel</a>.
  /// </note>
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
    @_s.required int minInferenceUnits,
    @_s.required String modelVersion,
    @_s.required String projectName,
    String clientToken,
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
    _s.validateStringPattern(
      'modelVersion',
      modelVersion,
      r'''([1-9][0-9]*|latest)''',
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
    _s.validateStringPattern(
      'projectName',
      projectName,
      r'''[a-zA-Z0-9][a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      64,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''^[a-zA-Z0-9-]+$''',
    );
    final headers = <String, String>{};
    clientToken?.let((v) => headers['X-Amzn-Client-Token'] = v.toString());
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

  /// Stops a running model. The operation might take a while to complete. To
  /// check the current status, call <a>DescribeModel</a>.
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
    @_s.required String modelVersion,
    @_s.required String projectName,
    String clientToken,
  }) async {
    ArgumentError.checkNotNull(modelVersion, 'modelVersion');
    _s.validateStringLength(
      'modelVersion',
      modelVersion,
      1,
      10,
      isRequired: true,
    );
    _s.validateStringPattern(
      'modelVersion',
      modelVersion,
      r'''([1-9][0-9]*|latest)''',
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
    _s.validateStringPattern(
      'projectName',
      projectName,
      r'''[a-zA-Z0-9][a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      64,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''^[a-zA-Z0-9-]+$''',
    );
    final headers = <String, String>{};
    clientToken?.let((v) => headers['X-Amzn-Client-Token'] = v.toString());
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

  /// Adds one or more JSON Line entries to a dataset. A JSON Line includes
  /// information about an image used for training or testing an Amazon Lookout
  /// for Vision model. The following is an example JSON Line.
  ///
  /// Updating a dataset might take a while to complete. To check the current
  /// status, call <a>DescribeDataset</a> and check the <code>Status</code>
  /// field in the response.
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
    @_s.required Uint8List changes,
    @_s.required String datasetType,
    @_s.required String projectName,
    String clientToken,
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
    _s.validateStringPattern(
      'datasetType',
      datasetType,
      r'''train|test''',
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
    _s.validateStringPattern(
      'projectName',
      projectName,
      r'''[a-zA-Z0-9][a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      64,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''^[a-zA-Z0-9-]+$''',
    );
    final headers = <String, String>{};
    clientToken?.let((v) => headers['X-Amzn-Client-Token'] = v.toString());
    final $payload = <String, dynamic>{
      'Changes': changes?.let(base64Encode),
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDatasetResponse {
  /// Information about the dataset.
  @_s.JsonKey(name: 'DatasetMetadata')
  final DatasetMetadata datasetMetadata;

  CreateDatasetResponse({
    this.datasetMetadata,
  });
  factory CreateDatasetResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateDatasetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateModelResponse {
  /// The response from a call to <code>CreateModel</code>.
  @_s.JsonKey(name: 'ModelMetadata')
  final ModelMetadata modelMetadata;

  CreateModelResponse({
    this.modelMetadata,
  });
  factory CreateModelResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateModelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateProjectResponse {
  /// Information about the project.
  @_s.JsonKey(name: 'ProjectMetadata')
  final ProjectMetadata projectMetadata;

  CreateProjectResponse({
    this.projectMetadata,
  });
  factory CreateProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateProjectResponseFromJson(json);
}

/// The description for a dataset. For more information, see
/// <a>DescribeDataset</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DatasetDescription {
  /// The Unix timestamp for the time and date that the dataset was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationTimestamp')
  final DateTime creationTimestamp;

  /// The type of the dataset. The value <code>train</code> represents a training
  /// dataset or single dataset project. The value <code>test</code> represents a
  /// test dataset.
  @_s.JsonKey(name: 'DatasetType')
  final String datasetType;

  /// <p/>
  @_s.JsonKey(name: 'ImageStats')
  final DatasetImageStats imageStats;

  /// The Unix timestamp for the date and time that the dataset was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedTimestamp')
  final DateTime lastUpdatedTimestamp;

  /// The name of the project that contains the dataset.
  @_s.JsonKey(name: 'ProjectName')
  final String projectName;

  /// The status of the dataset.
  @_s.JsonKey(name: 'Status')
  final DatasetStatus status;

  /// The status message for the dataset.
  @_s.JsonKey(name: 'StatusMessage')
  final String statusMessage;

  DatasetDescription({
    this.creationTimestamp,
    this.datasetType,
    this.imageStats,
    this.lastUpdatedTimestamp,
    this.projectName,
    this.status,
    this.statusMessage,
  });
  factory DatasetDescription.fromJson(Map<String, dynamic> json) =>
      _$DatasetDescriptionFromJson(json);
}

/// Location information about a manifest file. You can use a manifest file to
/// create a dataset.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DatasetGroundTruthManifest {
  /// The S3 bucket location for the manifest file.
  @_s.JsonKey(name: 'S3Object')
  final InputS3Object s3Object;

  DatasetGroundTruthManifest({
    this.s3Object,
  });
  Map<String, dynamic> toJson() => _$DatasetGroundTruthManifestToJson(this);
}

/// Statistics about the images in a dataset.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DatasetImageStats {
  /// the total number of images labeled as an anomaly.
  @_s.JsonKey(name: 'Anomaly')
  final int anomaly;

  /// The total number of labeled images.
  @_s.JsonKey(name: 'Labeled')
  final int labeled;

  /// The total number of images labeled as normal.
  @_s.JsonKey(name: 'Normal')
  final int normal;

  /// The total number of images in the dataset.
  @_s.JsonKey(name: 'Total')
  final int total;

  DatasetImageStats({
    this.anomaly,
    this.labeled,
    this.normal,
    this.total,
  });
  factory DatasetImageStats.fromJson(Map<String, dynamic> json) =>
      _$DatasetImageStatsFromJson(json);
}

/// Sumary information for an Amazon Lookout for Vision dataset.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DatasetMetadata {
  /// The Unix timestamp for the date and time that the dataset was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationTimestamp')
  final DateTime creationTimestamp;

  /// The type of the dataset.
  @_s.JsonKey(name: 'DatasetType')
  final String datasetType;

  /// The status for the dataset.
  @_s.JsonKey(name: 'Status')
  final DatasetStatus status;

  /// The status message for the dataset.
  @_s.JsonKey(name: 'StatusMessage')
  final String statusMessage;

  DatasetMetadata({
    this.creationTimestamp,
    this.datasetType,
    this.status,
    this.statusMessage,
  });
  factory DatasetMetadata.fromJson(Map<String, dynamic> json) =>
      _$DatasetMetadataFromJson(json);
}

/// Information about the location of a manifest file that Amazon Lookout for
/// Vision uses to to create a dataset.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DatasetSource {
  /// Location information for the manifest file.
  @_s.JsonKey(name: 'GroundTruthManifest')
  final DatasetGroundTruthManifest groundTruthManifest;

  DatasetSource({
    this.groundTruthManifest,
  });
  Map<String, dynamic> toJson() => _$DatasetSourceToJson(this);
}

enum DatasetStatus {
  @_s.JsonValue('CREATE_IN_PROGRESS')
  createInProgress,
  @_s.JsonValue('CREATE_COMPLETE')
  createComplete,
  @_s.JsonValue('CREATE_FAILED')
  createFailed,
  @_s.JsonValue('UPDATE_IN_PROGRESS')
  updateInProgress,
  @_s.JsonValue('UPDATE_COMPLETE')
  updateComplete,
  @_s.JsonValue('UPDATE_FAILED_ROLLBACK_IN_PROGRESS')
  updateFailedRollbackInProgress,
  @_s.JsonValue('UPDATE_FAILED_ROLLBACK_COMPLETE')
  updateFailedRollbackComplete,
  @_s.JsonValue('DELETE_IN_PROGRESS')
  deleteInProgress,
  @_s.JsonValue('DELETE_COMPLETE')
  deleteComplete,
  @_s.JsonValue('DELETE_FAILED')
  deleteFailed,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteDatasetResponse {
  DeleteDatasetResponse();
  factory DeleteDatasetResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteDatasetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteModelResponse {
  /// The Amazon Resource Name (ARN) of the model that was deleted.
  @_s.JsonKey(name: 'ModelArn')
  final String modelArn;

  DeleteModelResponse({
    this.modelArn,
  });
  factory DeleteModelResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteModelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteProjectResponse {
  /// The Amazon Resource Name (ARN) of the project that was deleted.
  @_s.JsonKey(name: 'ProjectArn')
  final String projectArn;

  DeleteProjectResponse({
    this.projectArn,
  });
  factory DeleteProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteProjectResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDatasetResponse {
  /// The description of the requested dataset.
  @_s.JsonKey(name: 'DatasetDescription')
  final DatasetDescription datasetDescription;

  DescribeDatasetResponse({
    this.datasetDescription,
  });
  factory DescribeDatasetResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeDatasetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeModelResponse {
  /// Contains the description of the model.
  @_s.JsonKey(name: 'ModelDescription')
  final ModelDescription modelDescription;

  DescribeModelResponse({
    this.modelDescription,
  });
  factory DescribeModelResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeModelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeProjectResponse {
  /// The description of the project.
  @_s.JsonKey(name: 'ProjectDescription')
  final ProjectDescription projectDescription;

  DescribeProjectResponse({
    this.projectDescription,
  });
  factory DescribeProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeProjectResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DetectAnomaliesResponse {
  /// The results of the <code>DetectAnomalies</code> operation.
  @_s.JsonKey(name: 'DetectAnomalyResult')
  final DetectAnomalyResult detectAnomalyResult;

  DetectAnomaliesResponse({
    this.detectAnomalyResult,
  });
  factory DetectAnomaliesResponse.fromJson(Map<String, dynamic> json) =>
      _$DetectAnomaliesResponseFromJson(json);
}

/// The prediction results from a call to <a>DetectAnomalies</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DetectAnomalyResult {
  /// The confidence that Amazon Lookout for Vision has in the accuracy of the
  /// prediction.
  @_s.JsonKey(name: 'Confidence')
  final double confidence;

  /// True if the image contains an anomaly, otherwise false.
  @_s.JsonKey(name: 'IsAnomalous')
  final bool isAnomalous;

  /// The source of the image that was analyzed. <code>direct</code> means that
  /// the images was supplied from the local computer. No other values are
  /// supported.
  @_s.JsonKey(name: 'Source')
  final ImageSource source;

  DetectAnomalyResult({
    this.confidence,
    this.isAnomalous,
    this.source,
  });
  factory DetectAnomalyResult.fromJson(Map<String, dynamic> json) =>
      _$DetectAnomalyResultFromJson(json);
}

/// The source for an image.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ImageSource {
  /// The type of the image.
  @_s.JsonKey(name: 'Type')
  final String type;

  ImageSource({
    this.type,
  });
  factory ImageSource.fromJson(Map<String, dynamic> json) =>
      _$ImageSourceFromJson(json);
}

/// Amazon S3 Location information for an input manifest file.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class InputS3Object {
  /// The Amazon S3 bucket that contains the manifest.
  @_s.JsonKey(name: 'Bucket')
  final String bucket;

  /// The name and location of the manifest file withiin the bucket.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The version ID of the bucket.
  @_s.JsonKey(name: 'VersionId')
  final String versionId;

  InputS3Object({
    @_s.required this.bucket,
    @_s.required this.key,
    this.versionId,
  });
  Map<String, dynamic> toJson() => _$InputS3ObjectToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDatasetEntriesResponse {
  /// A list of the entries (JSON Lines) within the dataset.
  @_s.JsonKey(name: 'DatasetEntries')
  final List<String> datasetEntries;

  /// If the response is truncated, Amazon Lookout for Vision returns this token
  /// that you can use in the subsequent request to retrieve the next set
  /// ofdataset entries.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListDatasetEntriesResponse({
    this.datasetEntries,
    this.nextToken,
  });
  factory ListDatasetEntriesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListDatasetEntriesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListModelsResponse {
  /// A list of model versions in the specified project.
  @_s.JsonKey(name: 'Models')
  final List<ModelMetadata> models;

  /// If the response is truncated, Amazon Lookout for Vision returns this token
  /// that you can use in the subsequent request to retrieve the next set of
  /// models.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListModelsResponse({
    this.models,
    this.nextToken,
  });
  factory ListModelsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListModelsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListProjectsResponse {
  /// If the response is truncated, Amazon Lookout for Vision returns this token
  /// that you can use in the subsequent request to retrieve the next set of
  /// projects.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of projects in your AWS account.
  @_s.JsonKey(name: 'Projects')
  final List<ProjectMetadata> projects;

  ListProjectsResponse({
    this.nextToken,
    this.projects,
  });
  factory ListProjectsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListProjectsResponseFromJson(json);
}

/// Describes an Amazon Lookout for Vision model.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ModelDescription {
  /// The unix timestamp for the date and time that the model was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationTimestamp')
  final DateTime creationTimestamp;

  /// The description for the model.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The unix timestamp for the date and time that the evaluation ended.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'EvaluationEndTimestamp')
  final DateTime evaluationEndTimestamp;

  /// The S3 location where Amazon Lookout for Vision saves the manifest file that
  /// was used to test the trained model and generate the performance scores.
  @_s.JsonKey(name: 'EvaluationManifest')
  final OutputS3Object evaluationManifest;

  /// The S3 location where Amazon Lookout for Vision saves the performance
  /// metrics.
  @_s.JsonKey(name: 'EvaluationResult')
  final OutputS3Object evaluationResult;

  /// The identifer for the AWS Key Management Service (AWS KMS) key that was used
  /// to encrypt the model during training.
  @_s.JsonKey(name: 'KmsKeyId')
  final String kmsKeyId;

  /// The Amazon Resource Name (ARN) of the model.
  @_s.JsonKey(name: 'ModelArn')
  final String modelArn;

  /// The version of the model
  @_s.JsonKey(name: 'ModelVersion')
  final String modelVersion;

  /// The S3 location where Amazon Lookout for Vision saves model training files.
  @_s.JsonKey(name: 'OutputConfig')
  final OutputConfig outputConfig;

  /// Performance metrics for the model. Created during training.
  @_s.JsonKey(name: 'Performance')
  final ModelPerformance performance;

  /// The status of the model.
  @_s.JsonKey(name: 'Status')
  final ModelStatus status;

  /// The status message for the model.
  @_s.JsonKey(name: 'StatusMessage')
  final String statusMessage;

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
  factory ModelDescription.fromJson(Map<String, dynamic> json) =>
      _$ModelDescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$ModelDescriptionToJson(this);
}

enum ModelHostingStatus {
  @_s.JsonValue('RUNNING')
  running,
  @_s.JsonValue('STARTING')
  starting,
  @_s.JsonValue('STOPPED')
  stopped,
  @_s.JsonValue('FAILED')
  failed,
}

/// Describes an Amazon Lookout for Vision model.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ModelMetadata {
  /// The unix timestamp for the date and time that the model was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationTimestamp')
  final DateTime creationTimestamp;

  /// The description for the model.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The Amazon Resource Name (ARN) of the model.
  @_s.JsonKey(name: 'ModelArn')
  final String modelArn;

  /// The version of the model.
  @_s.JsonKey(name: 'ModelVersion')
  final String modelVersion;

  /// Performance metrics for the model. Created during training.
  @_s.JsonKey(name: 'Performance')
  final ModelPerformance performance;

  /// The status of the model.
  @_s.JsonKey(name: 'Status')
  final ModelStatus status;

  /// The status message for the model.
  @_s.JsonKey(name: 'StatusMessage')
  final String statusMessage;

  ModelMetadata({
    this.creationTimestamp,
    this.description,
    this.modelArn,
    this.modelVersion,
    this.performance,
    this.status,
    this.statusMessage,
  });
  factory ModelMetadata.fromJson(Map<String, dynamic> json) =>
      _$ModelMetadataFromJson(json);
}

/// Information about the evaluation performance of a trained model.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ModelPerformance {
  /// The overall F1 score metric for the trained model.
  @_s.JsonKey(name: 'F1Score')
  final double f1Score;

  /// The overall precision metric value for the trained model.
  @_s.JsonKey(name: 'Precision')
  final double precision;

  /// The overall recall metric value for the trained model.
  @_s.JsonKey(name: 'Recall')
  final double recall;

  ModelPerformance({
    this.f1Score,
    this.precision,
    this.recall,
  });
  factory ModelPerformance.fromJson(Map<String, dynamic> json) =>
      _$ModelPerformanceFromJson(json);

  Map<String, dynamic> toJson() => _$ModelPerformanceToJson(this);
}

enum ModelStatus {
  @_s.JsonValue('TRAINING')
  training,
  @_s.JsonValue('TRAINED')
  trained,
  @_s.JsonValue('TRAINING_FAILED')
  trainingFailed,
  @_s.JsonValue('STARTING_HOSTING')
  startingHosting,
  @_s.JsonValue('HOSTED')
  hosted,
  @_s.JsonValue('HOSTING_FAILED')
  hostingFailed,
  @_s.JsonValue('STOPPING_HOSTING')
  stoppingHosting,
  @_s.JsonValue('SYSTEM_UPDATING')
  systemUpdating,
  @_s.JsonValue('DELETING')
  deleting,
}

/// The S3 location where Amazon Lookout for Vision saves model training files.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OutputConfig {
  /// The S3 location for the output.
  @_s.JsonKey(name: 'S3Location')
  final S3Location s3Location;

  OutputConfig({
    @_s.required this.s3Location,
  });
  factory OutputConfig.fromJson(Map<String, dynamic> json) =>
      _$OutputConfigFromJson(json);

  Map<String, dynamic> toJson() => _$OutputConfigToJson(this);
}

/// The S3 location where Amazon Lookout for Vision saves training output.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OutputS3Object {
  /// The bucket that contains the training output.
  @_s.JsonKey(name: 'Bucket')
  final String bucket;

  /// The location of the training output in the bucket.
  @_s.JsonKey(name: 'Key')
  final String key;

  OutputS3Object({
    @_s.required this.bucket,
    @_s.required this.key,
  });
  factory OutputS3Object.fromJson(Map<String, dynamic> json) =>
      _$OutputS3ObjectFromJson(json);

  Map<String, dynamic> toJson() => _$OutputS3ObjectToJson(this);
}

/// Describe an Amazon Lookout for Vision project. For more information, see
/// <a>DescribeProject</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProjectDescription {
  /// The unix timestamp for the date and time that the project was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationTimestamp')
  final DateTime creationTimestamp;

  /// A list of datasets in the project.
  @_s.JsonKey(name: 'Datasets')
  final List<DatasetMetadata> datasets;

  /// The Amazon Resource Name (ARN) of the project.
  @_s.JsonKey(name: 'ProjectArn')
  final String projectArn;

  /// The name of the project.
  @_s.JsonKey(name: 'ProjectName')
  final String projectName;

  ProjectDescription({
    this.creationTimestamp,
    this.datasets,
    this.projectArn,
    this.projectName,
  });
  factory ProjectDescription.fromJson(Map<String, dynamic> json) =>
      _$ProjectDescriptionFromJson(json);
}

/// Metadata about an Amazon Lookout for Vision project.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProjectMetadata {
  /// The unix timestamp for the date and time that the project was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationTimestamp')
  final DateTime creationTimestamp;

  /// The Amazon Resource Name (ARN) of the project.
  @_s.JsonKey(name: 'ProjectArn')
  final String projectArn;

  /// The name of the project.
  @_s.JsonKey(name: 'ProjectName')
  final String projectName;

  ProjectMetadata({
    this.creationTimestamp,
    this.projectArn,
    this.projectName,
  });
  factory ProjectMetadata.fromJson(Map<String, dynamic> json) =>
      _$ProjectMetadataFromJson(json);
}

/// Information about the location of a manifest file.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class S3Location {
  /// The S3 bucket that contain the manifest file.
  @_s.JsonKey(name: 'Bucket')
  final String bucket;

  /// The path and name of the manifest file with the S3 bucket.
  @_s.JsonKey(name: 'Prefix')
  final String prefix;

  S3Location({
    @_s.required this.bucket,
    this.prefix,
  });
  factory S3Location.fromJson(Map<String, dynamic> json) =>
      _$S3LocationFromJson(json);

  Map<String, dynamic> toJson() => _$S3LocationToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartModelResponse {
  /// The current running status of the model.
  @_s.JsonKey(name: 'Status')
  final ModelHostingStatus status;

  StartModelResponse({
    this.status,
  });
  factory StartModelResponse.fromJson(Map<String, dynamic> json) =>
      _$StartModelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopModelResponse {
  /// The status of the model.
  @_s.JsonKey(name: 'Status')
  final ModelHostingStatus status;

  StopModelResponse({
    this.status,
  });
  factory StopModelResponse.fromJson(Map<String, dynamic> json) =>
      _$StopModelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDatasetEntriesResponse {
  /// The status of the dataset update.
  @_s.JsonKey(name: 'Status')
  final DatasetStatus status;

  UpdateDatasetEntriesResponse({
    this.status,
  });
  factory UpdateDatasetEntriesResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateDatasetEntriesResponseFromJson(json);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String type, String message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String type, String message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
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

class ValidationException extends _s.GenericAwsException {
  ValidationException({String type, String message})
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
