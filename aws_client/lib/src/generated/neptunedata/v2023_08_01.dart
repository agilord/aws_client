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

/// The Amazon Neptune data API provides SDK support for more than 40 of
/// Neptune's data operations, including data loading, query execution, data
/// inquiry, and machine learning. It supports the Gremlin and openCypher query
/// languages, and is available in all SDK languages. It automatically signs API
/// requests and greatly simplifies integrating Neptune into your applications.
class NeptuneData {
  final _s.RestJsonProtocol _protocol;
  NeptuneData({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'neptune-db',
            signingName: 'neptune-db',
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

  /// Cancels a Gremlin query. See <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/gremlin-api-status-cancel.html">Gremlin
  /// query cancellation</a> for more information.
  ///
  /// When invoking this operation in a Neptune cluster that has IAM
  /// authentication enabled, the IAM user or role making the request must have
  /// a policy attached that allows the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-dp-actions.html#cancelquery">neptune-db:CancelQuery</a>
  /// IAM action in that cluster.
  ///
  /// May throw [BadRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientTimeoutException].
  /// May throw [IllegalArgumentException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnsupportedOperationException].
  /// May throw [FailureByQueryException].
  /// May throw [PreconditionsFailedException].
  /// May throw [ParsingException].
  /// May throw [ConstraintViolationException].
  /// May throw [TimeLimitExceededException].
  /// May throw [InvalidArgumentException].
  /// May throw [ConcurrentModificationException].
  /// May throw [MissingParameterException].
  ///
  /// Parameter [queryId] :
  /// The unique identifier that identifies the query to be canceled.
  Future<CancelGremlinQueryOutput> cancelGremlinQuery({
    required String queryId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/gremlin/status/${Uri.encodeComponent(queryId)}',
      exceptionFnMap: _exceptionFns,
    );
    return CancelGremlinQueryOutput.fromJson(response);
  }

  /// Cancels a specified load job. This is an HTTP <code>DELETE</code> request.
  /// See <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/load-api-reference-status.htm">Neptune
  /// Loader Get-Status API</a> for more information.
  ///
  /// When invoking this operation in a Neptune cluster that has IAM
  /// authentication enabled, the IAM user or role making the request must have
  /// a policy attached that allows the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-dp-actions.html#cancelloaderjob">neptune-db:CancelLoaderJob</a>
  /// IAM action in that cluster..
  ///
  /// May throw [BadRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [BulkLoadIdNotFoundException].
  /// May throw [ClientTimeoutException].
  /// May throw [LoadUrlAccessDeniedException].
  /// May throw [IllegalArgumentException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnsupportedOperationException].
  /// May throw [InternalFailureException].
  /// May throw [PreconditionsFailedException].
  /// May throw [ConstraintViolationException].
  /// May throw [InvalidArgumentException].
  /// May throw [MissingParameterException].
  ///
  /// Parameter [loadId] :
  /// The ID of the load job to be deleted.
  Future<CancelLoaderJobOutput> cancelLoaderJob({
    required String loadId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/loader/${Uri.encodeComponent(loadId)}',
      exceptionFnMap: _exceptionFns,
    );
    return CancelLoaderJobOutput.fromJson(response);
  }

  /// Cancels a Neptune ML data processing job. See <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/machine-learning-api-dataprocessing.html">The
  /// <code>dataprocessing</code> command</a>.
  ///
  /// When invoking this operation in a Neptune cluster that has IAM
  /// authentication enabled, the IAM user or role making the request must have
  /// a policy attached that allows the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-dp-actions.html#cancelmldataprocessingjob">neptune-db:CancelMLDataProcessingJob</a>
  /// IAM action in that cluster.
  ///
  /// May throw [UnsupportedOperationException].
  /// May throw [BadRequestException].
  /// May throw [MLResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientTimeoutException].
  /// May throw [PreconditionsFailedException].
  /// May throw [ConstraintViolationException].
  /// May throw [InvalidArgumentException].
  /// May throw [MissingParameterException].
  /// May throw [IllegalArgumentException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [id] :
  /// The unique identifier of the data-processing job.
  ///
  /// Parameter [clean] :
  /// If set to <code>TRUE</code>, this flag specifies that all Neptune ML S3
  /// artifacts should be deleted when the job is stopped. The default is
  /// <code>FALSE</code>.
  ///
  /// Parameter [neptuneIamRoleArn] :
  /// The ARN of an IAM role that provides Neptune access to SageMaker and
  /// Amazon S3 resources. This must be listed in your DB cluster parameter
  /// group or an error will occur.
  Future<CancelMLDataProcessingJobOutput> cancelMLDataProcessingJob({
    required String id,
    bool? clean,
    String? neptuneIamRoleArn,
  }) async {
    final $query = <String, List<String>>{
      if (clean != null) 'clean': [clean.toString()],
      if (neptuneIamRoleArn != null) 'neptuneIamRoleArn': [neptuneIamRoleArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/ml/dataprocessing/${Uri.encodeComponent(id)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return CancelMLDataProcessingJobOutput.fromJson(response);
  }

  /// Cancels a Neptune ML model training job. See <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/machine-learning-api-modeltraining.html">Model
  /// training using the <code>modeltraining</code> command</a>.
  ///
  /// When invoking this operation in a Neptune cluster that has IAM
  /// authentication enabled, the IAM user or role making the request must have
  /// a policy attached that allows the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-dp-actions.html#cancelmlmodeltrainingjob">neptune-db:CancelMLModelTrainingJob</a>
  /// IAM action in that cluster.
  ///
  /// May throw [UnsupportedOperationException].
  /// May throw [BadRequestException].
  /// May throw [MLResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientTimeoutException].
  /// May throw [PreconditionsFailedException].
  /// May throw [ConstraintViolationException].
  /// May throw [InvalidArgumentException].
  /// May throw [MissingParameterException].
  /// May throw [IllegalArgumentException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [id] :
  /// The unique identifier of the model-training job to be canceled.
  ///
  /// Parameter [clean] :
  /// If set to <code>TRUE</code>, this flag specifies that all Amazon S3
  /// artifacts should be deleted when the job is stopped. The default is
  /// <code>FALSE</code>.
  ///
  /// Parameter [neptuneIamRoleArn] :
  /// The ARN of an IAM role that provides Neptune access to SageMaker and
  /// Amazon S3 resources. This must be listed in your DB cluster parameter
  /// group or an error will occur.
  Future<CancelMLModelTrainingJobOutput> cancelMLModelTrainingJob({
    required String id,
    bool? clean,
    String? neptuneIamRoleArn,
  }) async {
    final $query = <String, List<String>>{
      if (clean != null) 'clean': [clean.toString()],
      if (neptuneIamRoleArn != null) 'neptuneIamRoleArn': [neptuneIamRoleArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/ml/modeltraining/${Uri.encodeComponent(id)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return CancelMLModelTrainingJobOutput.fromJson(response);
  }

  /// Cancels a specified model transform job. See <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/machine-learning-model-transform.html">Use
  /// a trained model to generate new model artifacts</a>.
  ///
  /// When invoking this operation in a Neptune cluster that has IAM
  /// authentication enabled, the IAM user or role making the request must have
  /// a policy attached that allows the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-dp-actions.html#cancelmlmodeltransformjob">neptune-db:CancelMLModelTransformJob</a>
  /// IAM action in that cluster.
  ///
  /// May throw [UnsupportedOperationException].
  /// May throw [BadRequestException].
  /// May throw [MLResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientTimeoutException].
  /// May throw [PreconditionsFailedException].
  /// May throw [ConstraintViolationException].
  /// May throw [InvalidArgumentException].
  /// May throw [MissingParameterException].
  /// May throw [IllegalArgumentException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [id] :
  /// The unique ID of the model transform job to be canceled.
  ///
  /// Parameter [clean] :
  /// If this flag is set to <code>TRUE</code>, all Neptune ML S3 artifacts
  /// should be deleted when the job is stopped. The default is
  /// <code>FALSE</code>.
  ///
  /// Parameter [neptuneIamRoleArn] :
  /// The ARN of an IAM role that provides Neptune access to SageMaker and
  /// Amazon S3 resources. This must be listed in your DB cluster parameter
  /// group or an error will occur.
  Future<CancelMLModelTransformJobOutput> cancelMLModelTransformJob({
    required String id,
    bool? clean,
    String? neptuneIamRoleArn,
  }) async {
    final $query = <String, List<String>>{
      if (clean != null) 'clean': [clean.toString()],
      if (neptuneIamRoleArn != null) 'neptuneIamRoleArn': [neptuneIamRoleArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/ml/modeltransform/${Uri.encodeComponent(id)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return CancelMLModelTransformJobOutput.fromJson(response);
  }

  /// Cancels a specified openCypher query. See <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/access-graph-opencypher-status.html">Neptune
  /// openCypher status endpoint</a> for more information.
  ///
  /// When invoking this operation in a Neptune cluster that has IAM
  /// authentication enabled, the IAM user or role making the request must have
  /// a policy attached that allows the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-dp-actions.html#cancelquery">neptune-db:CancelQuery</a>
  /// IAM action in that cluster.
  ///
  /// May throw [InvalidNumericDataException].
  /// May throw [BadRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientTimeoutException].
  /// May throw [IllegalArgumentException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnsupportedOperationException].
  /// May throw [FailureByQueryException].
  /// May throw [PreconditionsFailedException].
  /// May throw [ParsingException].
  /// May throw [ConstraintViolationException].
  /// May throw [TimeLimitExceededException].
  /// May throw [InvalidArgumentException].
  /// May throw [ConcurrentModificationException].
  /// May throw [MissingParameterException].
  ///
  /// Parameter [queryId] :
  /// The unique ID of the openCypher query to cancel.
  ///
  /// Parameter [silent] :
  /// If set to <code>TRUE</code>, causes the cancelation of the openCypher
  /// query to happen silently.
  Future<CancelOpenCypherQueryOutput> cancelOpenCypherQuery({
    required String queryId,
    bool? silent,
  }) async {
    final $query = <String, List<String>>{
      if (silent != null) 'silent': [silent.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/opencypher/status/${Uri.encodeComponent(queryId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return CancelOpenCypherQueryOutput.fromJson(response);
  }

  /// Creates a new Neptune ML inference endpoint that lets you query one
  /// specific model that the model-training process constructed. See <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/machine-learning-api-endpoints.html">Managing
  /// inference endpoints using the endpoints command</a>.
  ///
  /// When invoking this operation in a Neptune cluster that has IAM
  /// authentication enabled, the IAM user or role making the request must have
  /// a policy attached that allows the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-dp-actions.html#createmlendpoint">neptune-db:CreateMLEndpoint</a>
  /// IAM action in that cluster.
  ///
  /// May throw [UnsupportedOperationException].
  /// May throw [BadRequestException].
  /// May throw [MLResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientTimeoutException].
  /// May throw [PreconditionsFailedException].
  /// May throw [ConstraintViolationException].
  /// May throw [InvalidArgumentException].
  /// May throw [MissingParameterException].
  /// May throw [IllegalArgumentException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [id] :
  /// A unique identifier for the new inference endpoint. The default is an
  /// autogenerated timestamped name.
  ///
  /// Parameter [instanceCount] :
  /// The minimum number of Amazon EC2 instances to deploy to an endpoint for
  /// prediction. The default is 1
  ///
  /// Parameter [instanceType] :
  /// The type of Neptune ML instance to use for online servicing. The default
  /// is <code>ml.m5.xlarge</code>. Choosing the ML instance for an inference
  /// endpoint depends on the task type, the graph size, and your budget.
  ///
  /// Parameter [mlModelTrainingJobId] :
  /// The job Id of the completed model-training job that has created the model
  /// that the inference endpoint will point to. You must supply either the
  /// <code>mlModelTrainingJobId</code> or the
  /// <code>mlModelTransformJobId</code>.
  ///
  /// Parameter [mlModelTransformJobId] :
  /// The job Id of the completed model-transform job. You must supply either
  /// the <code>mlModelTrainingJobId</code> or the
  /// <code>mlModelTransformJobId</code>.
  ///
  /// Parameter [modelName] :
  /// Model type for training. By default the Neptune ML model is automatically
  /// based on the <code>modelType</code> used in data processing, but you can
  /// specify a different model type here. The default is <code>rgcn</code> for
  /// heterogeneous graphs and <code>kge</code> for knowledge graphs. The only
  /// valid value for heterogeneous graphs is <code>rgcn</code>. Valid values
  /// for knowledge graphs are: <code>kge</code>, <code>transe</code>,
  /// <code>distmult</code>, and <code>rotate</code>.
  ///
  /// Parameter [neptuneIamRoleArn] :
  /// The ARN of an IAM role providing Neptune access to SageMaker and Amazon S3
  /// resources. This must be listed in your DB cluster parameter group or an
  /// error will be thrown.
  ///
  /// Parameter [update] :
  /// If set to <code>true</code>, <code>update</code> indicates that this is an
  /// update request. The default is <code>false</code>. You must supply either
  /// the <code>mlModelTrainingJobId</code> or the
  /// <code>mlModelTransformJobId</code>.
  ///
  /// Parameter [volumeEncryptionKMSKey] :
  /// The Amazon Key Management Service (Amazon KMS) key that SageMaker uses to
  /// encrypt data on the storage volume attached to the ML compute instances
  /// that run the training job. The default is None.
  Future<CreateMLEndpointOutput> createMLEndpoint({
    String? id,
    int? instanceCount,
    String? instanceType,
    String? mlModelTrainingJobId,
    String? mlModelTransformJobId,
    String? modelName,
    String? neptuneIamRoleArn,
    bool? update,
    String? volumeEncryptionKMSKey,
  }) async {
    final $payload = <String, dynamic>{
      if (id != null) 'id': id,
      if (instanceCount != null) 'instanceCount': instanceCount,
      if (instanceType != null) 'instanceType': instanceType,
      if (mlModelTrainingJobId != null)
        'mlModelTrainingJobId': mlModelTrainingJobId,
      if (mlModelTransformJobId != null)
        'mlModelTransformJobId': mlModelTransformJobId,
      if (modelName != null) 'modelName': modelName,
      if (neptuneIamRoleArn != null) 'neptuneIamRoleArn': neptuneIamRoleArn,
      if (update != null) 'update': update,
      if (volumeEncryptionKMSKey != null)
        'volumeEncryptionKMSKey': volumeEncryptionKMSKey,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ml/endpoints',
      exceptionFnMap: _exceptionFns,
    );
    return CreateMLEndpointOutput.fromJson(response);
  }

  /// Cancels the creation of a Neptune ML inference endpoint. See <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/machine-learning-api-endpoints.html">Managing
  /// inference endpoints using the endpoints command</a>.
  ///
  /// When invoking this operation in a Neptune cluster that has IAM
  /// authentication enabled, the IAM user or role making the request must have
  /// a policy attached that allows the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-dp-actions.html#deletemlendpoint">neptune-db:DeleteMLEndpoint</a>
  /// IAM action in that cluster.
  ///
  /// May throw [UnsupportedOperationException].
  /// May throw [BadRequestException].
  /// May throw [MLResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientTimeoutException].
  /// May throw [PreconditionsFailedException].
  /// May throw [ConstraintViolationException].
  /// May throw [InvalidArgumentException].
  /// May throw [MissingParameterException].
  /// May throw [IllegalArgumentException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [id] :
  /// The unique identifier of the inference endpoint.
  ///
  /// Parameter [clean] :
  /// If this flag is set to <code>TRUE</code>, all Neptune ML S3 artifacts
  /// should be deleted when the job is stopped. The default is
  /// <code>FALSE</code>.
  ///
  /// Parameter [neptuneIamRoleArn] :
  /// The ARN of an IAM role providing Neptune access to SageMaker and Amazon S3
  /// resources. This must be listed in your DB cluster parameter group or an
  /// error will be thrown.
  Future<DeleteMLEndpointOutput> deleteMLEndpoint({
    required String id,
    bool? clean,
    String? neptuneIamRoleArn,
  }) async {
    final $query = <String, List<String>>{
      if (clean != null) 'clean': [clean.toString()],
      if (neptuneIamRoleArn != null) 'neptuneIamRoleArn': [neptuneIamRoleArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/ml/endpoints/${Uri.encodeComponent(id)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteMLEndpointOutput.fromJson(response);
  }

  /// Deletes statistics for Gremlin and openCypher (property graph) data.
  ///
  /// When invoking this operation in a Neptune cluster that has IAM
  /// authentication enabled, the IAM user or role making the request must have
  /// a policy attached that allows the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-dp-actions.html#deletestatistics">neptune-db:DeleteStatistics</a>
  /// IAM action in that cluster.
  ///
  /// May throw [BadRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [StatisticsNotAvailableException].
  /// May throw [ClientTimeoutException].
  /// May throw [AccessDeniedException].
  /// May throw [IllegalArgumentException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnsupportedOperationException].
  /// May throw [PreconditionsFailedException].
  /// May throw [ReadOnlyViolationException].
  /// May throw [ConstraintViolationException].
  /// May throw [InvalidArgumentException].
  /// May throw [MissingParameterException].
  Future<DeletePropertygraphStatisticsOutput>
      deletePropertygraphStatistics() async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/propertygraph/statistics',
      exceptionFnMap: _exceptionFns,
    );
    return DeletePropertygraphStatisticsOutput.fromJson(response);
  }

  /// Deletes SPARQL statistics
  ///
  /// When invoking this operation in a Neptune cluster that has IAM
  /// authentication enabled, the IAM user or role making the request must have
  /// a policy attached that allows the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-dp-actions.html#deletestatistics">neptune-db:DeleteStatistics</a>
  /// IAM action in that cluster.
  ///
  /// May throw [BadRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [StatisticsNotAvailableException].
  /// May throw [ClientTimeoutException].
  /// May throw [AccessDeniedException].
  /// May throw [IllegalArgumentException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnsupportedOperationException].
  /// May throw [PreconditionsFailedException].
  /// May throw [ReadOnlyViolationException].
  /// May throw [ConstraintViolationException].
  /// May throw [InvalidArgumentException].
  /// May throw [MissingParameterException].
  Future<DeleteSparqlStatisticsOutput> deleteSparqlStatistics() async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/sparql/statistics',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteSparqlStatisticsOutput.fromJson(response);
  }

  /// The fast reset REST API lets you reset a Neptune graph quicky and easily,
  /// removing all of its data.
  ///
  /// Neptune fast reset is a two-step process. First you call
  /// <code>ExecuteFastReset</code> with <code>action</code> set to
  /// <code>initiateDatabaseReset</code>. This returns a UUID token which you
  /// then include when calling <code>ExecuteFastReset</code> again with
  /// <code>action</code> set to <code>performDatabaseReset</code>. See <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/manage-console-fast-reset.html">Empty
  /// an Amazon Neptune DB cluster using the fast reset API</a>.
  ///
  /// When invoking this operation in a Neptune cluster that has IAM
  /// authentication enabled, the IAM user or role making the request must have
  /// a policy attached that allows the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-dp-actions.html#resetdatabase">neptune-db:ResetDatabase</a>
  /// IAM action in that cluster.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ClientTimeoutException].
  /// May throw [AccessDeniedException].
  /// May throw [IllegalArgumentException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnsupportedOperationException].
  /// May throw [ServerShutdownException].
  /// May throw [PreconditionsFailedException].
  /// May throw [MethodNotAllowedException].
  /// May throw [ReadOnlyViolationException].
  /// May throw [ConstraintViolationException].
  /// May throw [InvalidArgumentException].
  /// May throw [MissingParameterException].
  ///
  /// Parameter [action] :
  /// The fast reset action. One of the following values:
  ///
  /// <ul>
  /// <li>
  /// <b> <code>initiateDatabaseReset</code> </b>   –   This action generates a
  /// unique token needed to actually perform the fast reset.
  /// </li>
  /// <li>
  /// <b> <code>performDatabaseReset</code> </b>   –   This action uses the
  /// token generated by the <code>initiateDatabaseReset</code> action to
  /// actually perform the fast reset.
  /// <p/> </li>
  /// </ul>
  ///
  /// Parameter [token] :
  /// The fast-reset token to initiate the reset.
  Future<ExecuteFastResetOutput> executeFastReset({
    required Action action,
    String? token,
  }) async {
    final $payload = <String, dynamic>{
      'action': action.toValue(),
      if (token != null) 'token': token,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/system',
      exceptionFnMap: _exceptionFns,
    );
    return ExecuteFastResetOutput.fromJson(response);
  }

  /// Executes a Gremlin Explain query.
  ///
  /// Amazon Neptune has added a Gremlin feature named <code>explain</code> that
  /// provides is a self-service tool for understanding the execution approach
  /// being taken by the Neptune engine for the query. You invoke it by adding
  /// an <code>explain</code> parameter to an HTTP call that submits a Gremlin
  /// query.
  ///
  /// The explain feature provides information about the logical structure of
  /// query execution plans. You can use this information to identify potential
  /// evaluation and execution bottlenecks and to tune your query, as explained
  /// in <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/gremlin-traversal-tuning.html">Tuning
  /// Gremlin queries</a>. You can also use query hints to improve query
  /// execution plans.
  ///
  /// When invoking this operation in a Neptune cluster that has IAM
  /// authentication enabled, the IAM user or role making the request must have
  /// a policy attached that allows one of the following IAM actions in that
  /// cluster, depending on the query:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-dp-actions.html#readdataviaquery">neptune-db:ReadDataViaQuery</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-dp-actions.html#writedataviaquery">neptune-db:WriteDataViaQuery</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-dp-actions.html#deletedataviaquery">neptune-db:DeleteDataViaQuery</a>
  /// </li>
  /// </ul>
  /// Note that the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-data-condition-keys.html#iam-neptune-condition-keys">neptune-db:QueryLanguage:Gremlin</a>
  /// IAM condition key can be used in the policy document to restrict the use
  /// of Gremlin queries (see <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-data-condition-keys.html">Condition
  /// keys available in Neptune IAM data-access policy statements</a>).
  ///
  /// May throw [QueryTooLargeException].
  /// May throw [BadRequestException].
  /// May throw [QueryLimitExceededException].
  /// May throw [InvalidParameterException].
  /// May throw [QueryLimitException].
  /// May throw [ClientTimeoutException].
  /// May throw [CancelledByUserException].
  /// May throw [IllegalArgumentException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnsupportedOperationException].
  /// May throw [FailureByQueryException].
  /// May throw [MemoryLimitExceededException].
  /// May throw [PreconditionsFailedException].
  /// May throw [MalformedQueryException].
  /// May throw [ParsingException].
  /// May throw [ConstraintViolationException].
  /// May throw [TimeLimitExceededException].
  /// May throw [InvalidArgumentException].
  /// May throw [ConcurrentModificationException].
  /// May throw [MissingParameterException].
  ///
  /// Parameter [gremlinQuery] :
  /// The Gremlin explain query string.
  Future<ExecuteGremlinExplainQueryOutput> executeGremlinExplainQuery({
    required String gremlinQuery,
  }) async {
    final $payload = <String, dynamic>{
      'gremlin': gremlinQuery,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri: '/gremlin/explain',
      exceptionFnMap: _exceptionFns,
    );
    return ExecuteGremlinExplainQueryOutput(
      output: await response.stream.toBytes(),
    );
  }

  /// Executes a Gremlin Profile query, which runs a specified traversal,
  /// collects various metrics about the run, and produces a profile report as
  /// output. See <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/gremlin-profile-api.html">Gremlin
  /// profile API in Neptune</a> for details.
  ///
  /// When invoking this operation in a Neptune cluster that has IAM
  /// authentication enabled, the IAM user or role making the request must have
  /// a policy attached that allows the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-dp-actions.html#readdataviaquery">neptune-db:ReadDataViaQuery</a>
  /// IAM action in that cluster.
  ///
  /// Note that the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-data-condition-keys.html#iam-neptune-condition-keys">neptune-db:QueryLanguage:Gremlin</a>
  /// IAM condition key can be used in the policy document to restrict the use
  /// of Gremlin queries (see <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-data-condition-keys.html">Condition
  /// keys available in Neptune IAM data-access policy statements</a>).
  ///
  /// May throw [QueryTooLargeException].
  /// May throw [BadRequestException].
  /// May throw [QueryLimitExceededException].
  /// May throw [InvalidParameterException].
  /// May throw [QueryLimitException].
  /// May throw [ClientTimeoutException].
  /// May throw [CancelledByUserException].
  /// May throw [IllegalArgumentException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnsupportedOperationException].
  /// May throw [FailureByQueryException].
  /// May throw [MemoryLimitExceededException].
  /// May throw [PreconditionsFailedException].
  /// May throw [MalformedQueryException].
  /// May throw [ParsingException].
  /// May throw [ConstraintViolationException].
  /// May throw [TimeLimitExceededException].
  /// May throw [InvalidArgumentException].
  /// May throw [ConcurrentModificationException].
  /// May throw [MissingParameterException].
  ///
  /// Parameter [gremlinQuery] :
  /// The Gremlin query string to profile.
  ///
  /// Parameter [chop] :
  /// If non-zero, causes the results string to be truncated at that number of
  /// characters. If set to zero, the string contains all the results.
  ///
  /// Parameter [indexOps] :
  /// If this flag is set to <code>TRUE</code>, the results include a detailed
  /// report of all index operations that took place during query execution and
  /// serialization.
  ///
  /// Parameter [results] :
  /// If this flag is set to <code>TRUE</code>, the query results are gathered
  /// and displayed as part of the profile report. If <code>FALSE</code>, only
  /// the result count is displayed.
  ///
  /// Parameter [serializer] :
  /// If non-null, the gathered results are returned in a serialized response
  /// message in the format specified by this parameter. See <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/gremlin-profile-api.html">Gremlin
  /// profile API in Neptune</a> for more information.
  Future<ExecuteGremlinProfileQueryOutput> executeGremlinProfileQuery({
    required String gremlinQuery,
    int? chop,
    bool? indexOps,
    bool? results,
    String? serializer,
  }) async {
    final $payload = <String, dynamic>{
      'gremlin': gremlinQuery,
      if (chop != null) 'profile.chop': chop,
      if (indexOps != null) 'profile.indexOps': indexOps,
      if (results != null) 'profile.results': results,
      if (serializer != null) 'profile.serializer': serializer,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri: '/gremlin/profile',
      exceptionFnMap: _exceptionFns,
    );
    return ExecuteGremlinProfileQueryOutput(
      output: await response.stream.toBytes(),
    );
  }

  /// This commands executes a Gremlin query. Amazon Neptune is compatible with
  /// Apache TinkerPop3 and Gremlin, so you can use the Gremlin traversal
  /// language to query the graph, as described under <a
  /// href="https://tinkerpop.apache.org/docs/current/reference/#graph">The
  /// Graph</a> in the Apache TinkerPop3 documentation. More details can also be
  /// found in <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/access-graph-gremlin.html">Accessing
  /// a Neptune graph with Gremlin</a>.
  ///
  /// When invoking this operation in a Neptune cluster that has IAM
  /// authentication enabled, the IAM user or role making the request must have
  /// a policy attached that enables one of the following IAM actions in that
  /// cluster, depending on the query:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-dp-actions.html#readdataviaquery">neptune-db:ReadDataViaQuery</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-dp-actions.html#writedataviaquery">neptune-db:WriteDataViaQuery</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-dp-actions.html#deletedataviaquery">neptune-db:DeleteDataViaQuery</a>
  /// </li>
  /// </ul>
  /// Note that the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-data-condition-keys.html#iam-neptune-condition-keys">neptune-db:QueryLanguage:Gremlin</a>
  /// IAM condition key can be used in the policy document to restrict the use
  /// of Gremlin queries (see <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-data-condition-keys.html">Condition
  /// keys available in Neptune IAM data-access policy statements</a>).
  ///
  /// May throw [QueryTooLargeException].
  /// May throw [BadRequestException].
  /// May throw [QueryLimitExceededException].
  /// May throw [InvalidParameterException].
  /// May throw [QueryLimitException].
  /// May throw [ClientTimeoutException].
  /// May throw [CancelledByUserException].
  /// May throw [IllegalArgumentException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnsupportedOperationException].
  /// May throw [FailureByQueryException].
  /// May throw [MemoryLimitExceededException].
  /// May throw [PreconditionsFailedException].
  /// May throw [MalformedQueryException].
  /// May throw [ParsingException].
  /// May throw [ConstraintViolationException].
  /// May throw [TimeLimitExceededException].
  /// May throw [InvalidArgumentException].
  /// May throw [ConcurrentModificationException].
  /// May throw [MissingParameterException].
  ///
  /// Parameter [gremlinQuery] :
  /// Using this API, you can run Gremlin queries in string format much as you
  /// can using the HTTP endpoint. The interface is compatible with whatever
  /// Gremlin version your DB cluster is using (see the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/access-graph-gremlin-client.html#best-practices-gremlin-java-latest">Tinkerpop
  /// client section</a> to determine which Gremlin releases your engine version
  /// supports).
  ///
  /// Parameter [serializer] :
  /// If non-null, the query results are returned in a serialized response
  /// message in the format specified by this parameter. See the <a
  /// href="https://tinkerpop.apache.org/docs/current/reference/#_graphson">GraphSON</a>
  /// section in the TinkerPop documentation for a list of the formats that are
  /// currently supported.
  Future<ExecuteGremlinQueryOutput> executeGremlinQuery({
    required String gremlinQuery,
    String? serializer,
  }) async {
    final headers = <String, String>{
      if (serializer != null) 'accept': serializer.toString(),
    };
    final $payload = <String, dynamic>{
      'gremlin': gremlinQuery,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/gremlin',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ExecuteGremlinQueryOutput.fromJson(response);
  }

  /// Executes an openCypher <code>explain</code> request. See <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/access-graph-opencypher-explain.html">The
  /// openCypher explain feature</a> for more information.
  ///
  /// When invoking this operation in a Neptune cluster that has IAM
  /// authentication enabled, the IAM user or role making the request must have
  /// a policy attached that allows the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-dp-actions.html#readdataviaquery">neptune-db:ReadDataViaQuery</a>
  /// IAM action in that cluster.
  ///
  /// Note that the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-data-condition-keys.html#iam-neptune-condition-keys">neptune-db:QueryLanguage:OpenCypher</a>
  /// IAM condition key can be used in the policy document to restrict the use
  /// of openCypher queries (see <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-data-condition-keys.html">Condition
  /// keys available in Neptune IAM data-access policy statements</a>).
  ///
  /// May throw [QueryTooLargeException].
  /// May throw [InvalidNumericDataException].
  /// May throw [BadRequestException].
  /// May throw [QueryLimitExceededException].
  /// May throw [InvalidParameterException].
  /// May throw [QueryLimitException].
  /// May throw [ClientTimeoutException].
  /// May throw [CancelledByUserException].
  /// May throw [IllegalArgumentException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnsupportedOperationException].
  /// May throw [FailureByQueryException].
  /// May throw [MemoryLimitExceededException].
  /// May throw [PreconditionsFailedException].
  /// May throw [MalformedQueryException].
  /// May throw [ParsingException].
  /// May throw [ConstraintViolationException].
  /// May throw [TimeLimitExceededException].
  /// May throw [InvalidArgumentException].
  /// May throw [ConcurrentModificationException].
  /// May throw [MissingParameterException].
  ///
  /// Parameter [explainMode] :
  /// The openCypher <code>explain</code> mode. Can be one of:
  /// <code>static</code>, <code>dynamic</code>, or <code>details</code>.
  ///
  /// Parameter [openCypherQuery] :
  /// The openCypher query string.
  ///
  /// Parameter [parameters] :
  /// The openCypher query parameters.
  Future<ExecuteOpenCypherExplainQueryOutput> executeOpenCypherExplainQuery({
    required OpenCypherExplainMode explainMode,
    required String openCypherQuery,
    String? parameters,
  }) async {
    final $payload = <String, dynamic>{
      'explain': explainMode.toValue(),
      'query': openCypherQuery,
      if (parameters != null) 'parameters': parameters,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri: '/opencypher/explain',
      exceptionFnMap: _exceptionFns,
    );
    return ExecuteOpenCypherExplainQueryOutput(
      results: await response.stream.toBytes(),
    );
  }

  /// Executes an openCypher query. See <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/access-graph-opencypher.html">Accessing
  /// the Neptune Graph with openCypher</a> for more information.
  ///
  /// Neptune supports building graph applications using openCypher, which is
  /// currently one of the most popular query languages among developers working
  /// with graph databases. Developers, business analysts, and data scientists
  /// like openCypher's declarative, SQL-inspired syntax because it provides a
  /// familiar structure in which to querying property graphs.
  ///
  /// The openCypher language was originally developed by Neo4j, then
  /// open-sourced in 2015 and contributed to the <a
  /// href="https://opencypher.org/">openCypher project</a> under an Apache 2
  /// open-source license.
  ///
  /// Note that when invoking this operation in a Neptune cluster that has IAM
  /// authentication enabled, the IAM user or role making the request must have
  /// a policy attached that allows one of the following IAM actions in that
  /// cluster, depending on the query:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-dp-actions.html#readdataviaquery">neptune-db:ReadDataViaQuery</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-dp-actions.html#writedataviaquery">neptune-db:WriteDataViaQuery</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-dp-actions.html#deletedataviaquery">neptune-db:DeleteDataViaQuery</a>
  /// </li>
  /// </ul>
  /// Note also that the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-data-condition-keys.html#iam-neptune-condition-keys">neptune-db:QueryLanguage:OpenCypher</a>
  /// IAM condition key can be used in the policy document to restrict the use
  /// of openCypher queries (see <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-data-condition-keys.html">Condition
  /// keys available in Neptune IAM data-access policy statements</a>).
  ///
  /// May throw [QueryTooLargeException].
  /// May throw [InvalidNumericDataException].
  /// May throw [BadRequestException].
  /// May throw [QueryLimitExceededException].
  /// May throw [InvalidParameterException].
  /// May throw [QueryLimitException].
  /// May throw [ClientTimeoutException].
  /// May throw [CancelledByUserException].
  /// May throw [IllegalArgumentException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnsupportedOperationException].
  /// May throw [FailureByQueryException].
  /// May throw [MemoryLimitExceededException].
  /// May throw [PreconditionsFailedException].
  /// May throw [MalformedQueryException].
  /// May throw [ParsingException].
  /// May throw [ConstraintViolationException].
  /// May throw [TimeLimitExceededException].
  /// May throw [InvalidArgumentException].
  /// May throw [ConcurrentModificationException].
  /// May throw [MissingParameterException].
  ///
  /// Parameter [openCypherQuery] :
  /// The openCypher query string to be executed.
  ///
  /// Parameter [parameters] :
  /// The openCypher query parameters for query execution. See <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/opencypher-parameterized-queries.html">Examples
  /// of openCypher parameterized queries</a> for more information.
  Future<ExecuteOpenCypherQueryOutput> executeOpenCypherQuery({
    required String openCypherQuery,
    String? parameters,
  }) async {
    final $payload = <String, dynamic>{
      'query': openCypherQuery,
      if (parameters != null) 'parameters': parameters,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/opencypher',
      exceptionFnMap: _exceptionFns,
    );
    return ExecuteOpenCypherQueryOutput.fromJson(response);
  }

  /// Retrieves the status of the graph database on the host.
  ///
  /// When invoking this operation in a Neptune cluster that has IAM
  /// authentication enabled, the IAM user or role making the request must have
  /// a policy attached that allows the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-dp-actions.html#getenginestatus">neptune-db:GetEngineStatus</a>
  /// IAM action in that cluster.
  ///
  /// May throw [UnsupportedOperationException].
  /// May throw [InternalFailureException].
  /// May throw [ClientTimeoutException].
  /// May throw [PreconditionsFailedException].
  /// May throw [ConstraintViolationException].
  /// May throw [InvalidArgumentException].
  /// May throw [IllegalArgumentException].
  /// May throw [TooManyRequestsException].
  Future<GetEngineStatusOutput> getEngineStatus() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/status',
      exceptionFnMap: _exceptionFns,
    );
    return GetEngineStatusOutput.fromJson(response);
  }

  /// Gets the status of a specified Gremlin query.
  ///
  /// When invoking this operation in a Neptune cluster that has IAM
  /// authentication enabled, the IAM user or role making the request must have
  /// a policy attached that allows the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-dp-actions.html#getquerystatus">neptune-db:GetQueryStatus</a>
  /// IAM action in that cluster.
  ///
  /// Note that the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-data-condition-keys.html#iam-neptune-condition-keys">neptune-db:QueryLanguage:Gremlin</a>
  /// IAM condition key can be used in the policy document to restrict the use
  /// of Gremlin queries (see <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-data-condition-keys.html">Condition
  /// keys available in Neptune IAM data-access policy statements</a>).
  ///
  /// May throw [BadRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientTimeoutException].
  /// May throw [AccessDeniedException].
  /// May throw [IllegalArgumentException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnsupportedOperationException].
  /// May throw [FailureByQueryException].
  /// May throw [PreconditionsFailedException].
  /// May throw [ParsingException].
  /// May throw [ReadOnlyViolationException].
  /// May throw [ConstraintViolationException].
  /// May throw [TimeLimitExceededException].
  /// May throw [InvalidArgumentException].
  /// May throw [ConcurrentModificationException].
  /// May throw [MissingParameterException].
  ///
  /// Parameter [queryId] :
  /// The unique identifier that identifies the Gremlin query.
  Future<GetGremlinQueryStatusOutput> getGremlinQueryStatus({
    required String queryId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/gremlin/status/${Uri.encodeComponent(queryId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetGremlinQueryStatusOutput.fromJson(response);
  }

  /// Gets status information about a specified load job. Neptune keeps track of
  /// the most recent 1,024 bulk load jobs, and stores the last 10,000 error
  /// details per job.
  ///
  /// See <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/load-api-reference-status.htm">Neptune
  /// Loader Get-Status API</a> for more information.
  ///
  /// When invoking this operation in a Neptune cluster that has IAM
  /// authentication enabled, the IAM user or role making the request must have
  /// a policy attached that allows the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-dp-actions.html#getloaderjobstatus">neptune-db:GetLoaderJobStatus</a>
  /// IAM action in that cluster..
  ///
  /// May throw [BadRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [BulkLoadIdNotFoundException].
  /// May throw [ClientTimeoutException].
  /// May throw [LoadUrlAccessDeniedException].
  /// May throw [IllegalArgumentException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnsupportedOperationException].
  /// May throw [InternalFailureException].
  /// May throw [PreconditionsFailedException].
  /// May throw [ConstraintViolationException].
  /// May throw [InvalidArgumentException].
  /// May throw [MissingParameterException].
  ///
  /// Parameter [loadId] :
  /// The load ID of the load job to get the status of.
  ///
  /// Parameter [details] :
  /// Flag indicating whether or not to include details beyond the overall
  /// status (<code>TRUE</code> or <code>FALSE</code>; the default is
  /// <code>FALSE</code>).
  ///
  /// Parameter [errors] :
  /// Flag indicating whether or not to include a list of errors encountered
  /// (<code>TRUE</code> or <code>FALSE</code>; the default is
  /// <code>FALSE</code>).
  ///
  /// The list of errors is paged. The <code>page</code> and
  /// <code>errorsPerPage</code> parameters allow you to page through all the
  /// errors.
  ///
  /// Parameter [errorsPerPage] :
  /// The number of errors returned in each page (a positive integer; the
  /// default is <code>10</code>). Only valid when the <code>errors</code>
  /// parameter set to <code>TRUE</code>.
  ///
  /// Parameter [page] :
  /// The error page number (a positive integer; the default is <code>1</code>).
  /// Only valid when the <code>errors</code> parameter is set to
  /// <code>TRUE</code>.
  Future<GetLoaderJobStatusOutput> getLoaderJobStatus({
    required String loadId,
    bool? details,
    bool? errors,
    int? errorsPerPage,
    int? page,
  }) async {
    _s.validateNumRange(
      'errorsPerPage',
      errorsPerPage,
      1,
      1152921504606846976,
    );
    _s.validateNumRange(
      'page',
      page,
      1,
      1152921504606846976,
    );
    final $query = <String, List<String>>{
      if (details != null) 'details': [details.toString()],
      if (errors != null) 'errors': [errors.toString()],
      if (errorsPerPage != null) 'errorsPerPage': [errorsPerPage.toString()],
      if (page != null) 'page': [page.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/loader/${Uri.encodeComponent(loadId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetLoaderJobStatusOutput.fromJson(response);
  }

  /// Retrieves information about a specified data processing job. See <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/machine-learning-api-dataprocessing.html">The
  /// <code>dataprocessing</code> command</a>.
  ///
  /// When invoking this operation in a Neptune cluster that has IAM
  /// authentication enabled, the IAM user or role making the request must have
  /// a policy attached that allows the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-dp-actions.html#getmldataprocessingjobstatus">neptune-db:neptune-db:GetMLDataProcessingJobStatus</a>
  /// IAM action in that cluster.
  ///
  /// May throw [UnsupportedOperationException].
  /// May throw [BadRequestException].
  /// May throw [MLResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientTimeoutException].
  /// May throw [PreconditionsFailedException].
  /// May throw [ConstraintViolationException].
  /// May throw [InvalidArgumentException].
  /// May throw [MissingParameterException].
  /// May throw [IllegalArgumentException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [id] :
  /// The unique identifier of the data-processing job to be retrieved.
  ///
  /// Parameter [neptuneIamRoleArn] :
  /// The ARN of an IAM role that provides Neptune access to SageMaker and
  /// Amazon S3 resources. This must be listed in your DB cluster parameter
  /// group or an error will occur.
  Future<GetMLDataProcessingJobOutput> getMLDataProcessingJob({
    required String id,
    String? neptuneIamRoleArn,
  }) async {
    final $query = <String, List<String>>{
      if (neptuneIamRoleArn != null) 'neptuneIamRoleArn': [neptuneIamRoleArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/ml/dataprocessing/${Uri.encodeComponent(id)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetMLDataProcessingJobOutput.fromJson(response);
  }

  /// Retrieves details about an inference endpoint. See <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/machine-learning-api-endpoints.html">Managing
  /// inference endpoints using the endpoints command</a>.
  ///
  /// When invoking this operation in a Neptune cluster that has IAM
  /// authentication enabled, the IAM user or role making the request must have
  /// a policy attached that allows the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-dp-actions.html#getmlendpointstatus">neptune-db:GetMLEndpointStatus</a>
  /// IAM action in that cluster.
  ///
  /// May throw [UnsupportedOperationException].
  /// May throw [BadRequestException].
  /// May throw [MLResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientTimeoutException].
  /// May throw [PreconditionsFailedException].
  /// May throw [ConstraintViolationException].
  /// May throw [InvalidArgumentException].
  /// May throw [MissingParameterException].
  /// May throw [IllegalArgumentException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [id] :
  /// The unique identifier of the inference endpoint.
  ///
  /// Parameter [neptuneIamRoleArn] :
  /// The ARN of an IAM role that provides Neptune access to SageMaker and
  /// Amazon S3 resources. This must be listed in your DB cluster parameter
  /// group or an error will occur.
  Future<GetMLEndpointOutput> getMLEndpoint({
    required String id,
    String? neptuneIamRoleArn,
  }) async {
    final $query = <String, List<String>>{
      if (neptuneIamRoleArn != null) 'neptuneIamRoleArn': [neptuneIamRoleArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/ml/endpoints/${Uri.encodeComponent(id)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetMLEndpointOutput.fromJson(response);
  }

  /// Retrieves information about a Neptune ML model training job. See <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/machine-learning-api-modeltraining.html">Model
  /// training using the <code>modeltraining</code> command</a>.
  ///
  /// When invoking this operation in a Neptune cluster that has IAM
  /// authentication enabled, the IAM user or role making the request must have
  /// a policy attached that allows the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-dp-actions.html#getmlmodeltrainingjobstatus">neptune-db:GetMLModelTrainingJobStatus</a>
  /// IAM action in that cluster.
  ///
  /// May throw [UnsupportedOperationException].
  /// May throw [BadRequestException].
  /// May throw [MLResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientTimeoutException].
  /// May throw [PreconditionsFailedException].
  /// May throw [ConstraintViolationException].
  /// May throw [InvalidArgumentException].
  /// May throw [MissingParameterException].
  /// May throw [IllegalArgumentException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [id] :
  /// The unique identifier of the model-training job to retrieve.
  ///
  /// Parameter [neptuneIamRoleArn] :
  /// The ARN of an IAM role that provides Neptune access to SageMaker and
  /// Amazon S3 resources. This must be listed in your DB cluster parameter
  /// group or an error will occur.
  Future<GetMLModelTrainingJobOutput> getMLModelTrainingJob({
    required String id,
    String? neptuneIamRoleArn,
  }) async {
    final $query = <String, List<String>>{
      if (neptuneIamRoleArn != null) 'neptuneIamRoleArn': [neptuneIamRoleArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/ml/modeltraining/${Uri.encodeComponent(id)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetMLModelTrainingJobOutput.fromJson(response);
  }

  /// Gets information about a specified model transform job. See <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/machine-learning-model-transform.html">Use
  /// a trained model to generate new model artifacts</a>.
  ///
  /// When invoking this operation in a Neptune cluster that has IAM
  /// authentication enabled, the IAM user or role making the request must have
  /// a policy attached that allows the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-dp-actions.html#getmlmodeltransformjobstatus">neptune-db:GetMLModelTransformJobStatus</a>
  /// IAM action in that cluster.
  ///
  /// May throw [UnsupportedOperationException].
  /// May throw [BadRequestException].
  /// May throw [MLResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientTimeoutException].
  /// May throw [PreconditionsFailedException].
  /// May throw [ConstraintViolationException].
  /// May throw [InvalidArgumentException].
  /// May throw [MissingParameterException].
  /// May throw [IllegalArgumentException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [id] :
  /// The unique identifier of the model-transform job to be reetrieved.
  ///
  /// Parameter [neptuneIamRoleArn] :
  /// The ARN of an IAM role that provides Neptune access to SageMaker and
  /// Amazon S3 resources. This must be listed in your DB cluster parameter
  /// group or an error will occur.
  Future<GetMLModelTransformJobOutput> getMLModelTransformJob({
    required String id,
    String? neptuneIamRoleArn,
  }) async {
    final $query = <String, List<String>>{
      if (neptuneIamRoleArn != null) 'neptuneIamRoleArn': [neptuneIamRoleArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/ml/modeltransform/${Uri.encodeComponent(id)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetMLModelTransformJobOutput.fromJson(response);
  }

  /// Retrieves the status of a specified openCypher query.
  ///
  /// When invoking this operation in a Neptune cluster that has IAM
  /// authentication enabled, the IAM user or role making the request must have
  /// a policy attached that allows the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-dp-actions.html#getquerystatus">neptune-db:GetQueryStatus</a>
  /// IAM action in that cluster.
  ///
  /// Note that the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-data-condition-keys.html#iam-neptune-condition-keys">neptune-db:QueryLanguage:OpenCypher</a>
  /// IAM condition key can be used in the policy document to restrict the use
  /// of openCypher queries (see <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-data-condition-keys.html">Condition
  /// keys available in Neptune IAM data-access policy statements</a>).
  ///
  /// May throw [InvalidNumericDataException].
  /// May throw [BadRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientTimeoutException].
  /// May throw [AccessDeniedException].
  /// May throw [IllegalArgumentException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnsupportedOperationException].
  /// May throw [FailureByQueryException].
  /// May throw [PreconditionsFailedException].
  /// May throw [ParsingException].
  /// May throw [ReadOnlyViolationException].
  /// May throw [ConstraintViolationException].
  /// May throw [TimeLimitExceededException].
  /// May throw [InvalidArgumentException].
  /// May throw [ConcurrentModificationException].
  /// May throw [MissingParameterException].
  ///
  /// Parameter [queryId] :
  /// The unique ID of the openCypher query for which to retrieve the query
  /// status.
  Future<GetOpenCypherQueryStatusOutput> getOpenCypherQueryStatus({
    required String queryId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/opencypher/status/${Uri.encodeComponent(queryId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetOpenCypherQueryStatusOutput.fromJson(response);
  }

  /// Gets property graph statistics (Gremlin and openCypher).
  ///
  /// When invoking this operation in a Neptune cluster that has IAM
  /// authentication enabled, the IAM user or role making the request must have
  /// a policy attached that allows the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-dp-actions.html#getstatisticsstatus">neptune-db:GetStatisticsStatus</a>
  /// IAM action in that cluster.
  ///
  /// May throw [BadRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [StatisticsNotAvailableException].
  /// May throw [ClientTimeoutException].
  /// May throw [AccessDeniedException].
  /// May throw [IllegalArgumentException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnsupportedOperationException].
  /// May throw [PreconditionsFailedException].
  /// May throw [ReadOnlyViolationException].
  /// May throw [ConstraintViolationException].
  /// May throw [InvalidArgumentException].
  /// May throw [MissingParameterException].
  Future<GetPropertygraphStatisticsOutput> getPropertygraphStatistics() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/propertygraph/statistics',
      exceptionFnMap: _exceptionFns,
    );
    return GetPropertygraphStatisticsOutput.fromJson(response);
  }

  /// Gets a stream for a property graph.
  ///
  /// With the Neptune Streams feature, you can generate a complete sequence of
  /// change-log entries that record every change made to your graph data as it
  /// happens. <code>GetPropertygraphStream</code> lets you collect these
  /// change-log entries for a property graph.
  ///
  /// The Neptune streams feature needs to be enabled on your Neptune DBcluster.
  /// To enable streams, set the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/parameters.html#parameters-db-cluster-parameters-neptune_streams">neptune_streams</a>
  /// DB cluster parameter to <code>1</code>.
  ///
  /// See <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/streams.html">Capturing
  /// graph changes in real time using Neptune streams</a>.
  ///
  /// When invoking this operation in a Neptune cluster that has IAM
  /// authentication enabled, the IAM user or role making the request must have
  /// a policy attached that allows the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-dp-actions.html#getstreamrecords">neptune-db:GetStreamRecords</a>
  /// IAM action in that cluster.
  ///
  /// When invoking this operation in a Neptune cluster that has IAM
  /// authentication enabled, the IAM user or role making the request must have
  /// a policy attached that enables one of the following IAM actions, depending
  /// on the query:
  ///
  /// Note that you can restrict property-graph queries using the following IAM
  /// context keys:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-data-condition-keys.html#iam-neptune-condition-keys">neptune-db:QueryLanguage:Gremlin</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-data-condition-keys.html#iam-neptune-condition-keys">neptune-db:QueryLanguage:OpenCypher</a>
  /// </li>
  /// </ul>
  /// See <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-data-condition-keys.html">Condition
  /// keys available in Neptune IAM data-access policy statements</a>).
  ///
  /// May throw [UnsupportedOperationException].
  /// May throw [ExpiredStreamException].
  /// May throw [InvalidParameterException].
  /// May throw [MemoryLimitExceededException].
  /// May throw [StreamRecordsNotFoundException].
  /// May throw [ClientTimeoutException].
  /// May throw [PreconditionsFailedException].
  /// May throw [ThrottlingException].
  /// May throw [ConstraintViolationException].
  /// May throw [InvalidArgumentException].
  /// May throw [IllegalArgumentException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [commitNum] :
  /// The commit number of the starting record to read from the change-log
  /// stream. This parameter is required when <code>iteratorType</code>
  /// is<code>AT_SEQUENCE_NUMBER</code> or <code>AFTER_SEQUENCE_NUMBER</code>,
  /// and ignored when <code>iteratorType</code> is <code>TRIM_HORIZON</code> or
  /// <code>LATEST</code>.
  ///
  /// Parameter [encoding] :
  /// If set to TRUE, Neptune compresses the response using gzip encoding.
  ///
  /// Parameter [iteratorType] :
  /// Can be one of:
  ///
  /// <ul>
  /// <li>
  /// <code>AT_SEQUENCE_NUMBER</code>   –   Indicates that reading should start
  /// from the event sequence number specified jointly by the
  /// <code>commitNum</code> and <code>opNum</code> parameters.
  /// </li>
  /// <li>
  /// <code>AFTER_SEQUENCE_NUMBER</code>   –   Indicates that reading should
  /// start right after the event sequence number specified jointly by the
  /// <code>commitNum</code> and <code>opNum</code> parameters.
  /// </li>
  /// <li>
  /// <code>TRIM_HORIZON</code>   –   Indicates that reading should start at the
  /// last untrimmed record in the system, which is the oldest unexpired (not
  /// yet deleted) record in the change-log stream.
  /// </li>
  /// <li>
  /// <code>LATEST</code>   –   Indicates that reading should start at the most
  /// recent record in the system, which is the latest unexpired (not yet
  /// deleted) record in the change-log stream.
  /// </li>
  /// </ul>
  ///
  /// Parameter [limit] :
  /// Specifies the maximum number of records to return. There is also a size
  /// limit of 10 MB on the response that can't be modified and that takes
  /// precedence over the number of records specified in the <code>limit</code>
  /// parameter. The response does include a threshold-breaching record if the
  /// 10 MB limit was reached.
  ///
  /// The range for <code>limit</code> is 1 to 100,000, with a default of 10.
  ///
  /// Parameter [opNum] :
  /// The operation sequence number within the specified commit to start reading
  /// from in the change-log stream data. The default is <code>1</code>.
  Future<GetPropertygraphStreamOutput> getPropertygraphStream({
    int? commitNum,
    Encoding? encoding,
    IteratorType? iteratorType,
    int? limit,
    int? opNum,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100000,
    );
    final headers = <String, String>{
      if (encoding != null) 'Accept-Encoding': encoding.toValue(),
    };
    final $query = <String, List<String>>{
      if (commitNum != null) 'commitNum': [commitNum.toString()],
      if (iteratorType != null) 'iteratorType': [iteratorType.toValue()],
      if (limit != null) 'limit': [limit.toString()],
      if (opNum != null) 'opNum': [opNum.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/propertygraph/stream',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetPropertygraphStreamOutput.fromJson(response);
  }

  /// Gets a graph summary for a property graph.
  ///
  /// When invoking this operation in a Neptune cluster that has IAM
  /// authentication enabled, the IAM user or role making the request must have
  /// a policy attached that allows the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-dp-actions.html#getgraphsummary">neptune-db:GetGraphSummary</a>
  /// IAM action in that cluster.
  ///
  /// May throw [BadRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [StatisticsNotAvailableException].
  /// May throw [ClientTimeoutException].
  /// May throw [AccessDeniedException].
  /// May throw [IllegalArgumentException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnsupportedOperationException].
  /// May throw [PreconditionsFailedException].
  /// May throw [ReadOnlyViolationException].
  /// May throw [ConstraintViolationException].
  /// May throw [InvalidArgumentException].
  /// May throw [MissingParameterException].
  ///
  /// Parameter [mode] :
  /// Mode can take one of two values: <code>BASIC</code> (the default), and
  /// <code>DETAILED</code>.
  Future<GetPropertygraphSummaryOutput> getPropertygraphSummary({
    GraphSummaryType? mode,
  }) async {
    final $query = <String, List<String>>{
      if (mode != null) 'mode': [mode.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/propertygraph/statistics/summary',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetPropertygraphSummaryOutput.fromJson(response);
  }

  /// Gets a graph summary for an RDF graph.
  ///
  /// When invoking this operation in a Neptune cluster that has IAM
  /// authentication enabled, the IAM user or role making the request must have
  /// a policy attached that allows the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-dp-actions.html#getgraphsummary">neptune-db:GetGraphSummary</a>
  /// IAM action in that cluster.
  ///
  /// May throw [BadRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [StatisticsNotAvailableException].
  /// May throw [ClientTimeoutException].
  /// May throw [AccessDeniedException].
  /// May throw [IllegalArgumentException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnsupportedOperationException].
  /// May throw [PreconditionsFailedException].
  /// May throw [ReadOnlyViolationException].
  /// May throw [ConstraintViolationException].
  /// May throw [InvalidArgumentException].
  /// May throw [MissingParameterException].
  ///
  /// Parameter [mode] :
  /// Mode can take one of two values: <code>BASIC</code> (the default), and
  /// <code>DETAILED</code>.
  Future<GetRDFGraphSummaryOutput> getRDFGraphSummary({
    GraphSummaryType? mode,
  }) async {
    final $query = <String, List<String>>{
      if (mode != null) 'mode': [mode.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/rdf/statistics/summary',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetRDFGraphSummaryOutput.fromJson(response);
  }

  /// Gets RDF statistics (SPARQL).
  ///
  /// May throw [BadRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [StatisticsNotAvailableException].
  /// May throw [ClientTimeoutException].
  /// May throw [AccessDeniedException].
  /// May throw [IllegalArgumentException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnsupportedOperationException].
  /// May throw [PreconditionsFailedException].
  /// May throw [ReadOnlyViolationException].
  /// May throw [ConstraintViolationException].
  /// May throw [InvalidArgumentException].
  /// May throw [MissingParameterException].
  Future<GetSparqlStatisticsOutput> getSparqlStatistics() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/sparql/statistics',
      exceptionFnMap: _exceptionFns,
    );
    return GetSparqlStatisticsOutput.fromJson(response);
  }

  /// Gets a stream for an RDF graph.
  ///
  /// With the Neptune Streams feature, you can generate a complete sequence of
  /// change-log entries that record every change made to your graph data as it
  /// happens. <code>GetSparqlStream</code> lets you collect these change-log
  /// entries for an RDF graph.
  ///
  /// The Neptune streams feature needs to be enabled on your Neptune DBcluster.
  /// To enable streams, set the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/parameters.html#parameters-db-cluster-parameters-neptune_streams">neptune_streams</a>
  /// DB cluster parameter to <code>1</code>.
  ///
  /// See <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/streams.html">Capturing
  /// graph changes in real time using Neptune streams</a>.
  ///
  /// When invoking this operation in a Neptune cluster that has IAM
  /// authentication enabled, the IAM user or role making the request must have
  /// a policy attached that allows the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-dp-actions.html#getstreamrecords">neptune-db:GetStreamRecords</a>
  /// IAM action in that cluster.
  ///
  /// Note that the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-data-condition-keys.html#iam-neptune-condition-keys">neptune-db:QueryLanguage:Sparql</a>
  /// IAM condition key can be used in the policy document to restrict the use
  /// of SPARQL queries (see <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-data-condition-keys.html">Condition
  /// keys available in Neptune IAM data-access policy statements</a>).
  ///
  /// May throw [UnsupportedOperationException].
  /// May throw [ExpiredStreamException].
  /// May throw [InvalidParameterException].
  /// May throw [MemoryLimitExceededException].
  /// May throw [StreamRecordsNotFoundException].
  /// May throw [ClientTimeoutException].
  /// May throw [PreconditionsFailedException].
  /// May throw [ThrottlingException].
  /// May throw [ConstraintViolationException].
  /// May throw [InvalidArgumentException].
  /// May throw [IllegalArgumentException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [commitNum] :
  /// The commit number of the starting record to read from the change-log
  /// stream. This parameter is required when <code>iteratorType</code>
  /// is<code>AT_SEQUENCE_NUMBER</code> or <code>AFTER_SEQUENCE_NUMBER</code>,
  /// and ignored when <code>iteratorType</code> is <code>TRIM_HORIZON</code> or
  /// <code>LATEST</code>.
  ///
  /// Parameter [encoding] :
  /// If set to TRUE, Neptune compresses the response using gzip encoding.
  ///
  /// Parameter [iteratorType] :
  /// Can be one of:
  ///
  /// <ul>
  /// <li>
  /// <code>AT_SEQUENCE_NUMBER</code>   –   Indicates that reading should start
  /// from the event sequence number specified jointly by the
  /// <code>commitNum</code> and <code>opNum</code> parameters.
  /// </li>
  /// <li>
  /// <code>AFTER_SEQUENCE_NUMBER</code>   –   Indicates that reading should
  /// start right after the event sequence number specified jointly by the
  /// <code>commitNum</code> and <code>opNum</code> parameters.
  /// </li>
  /// <li>
  /// <code>TRIM_HORIZON</code>   –   Indicates that reading should start at the
  /// last untrimmed record in the system, which is the oldest unexpired (not
  /// yet deleted) record in the change-log stream.
  /// </li>
  /// <li>
  /// <code>LATEST</code>   –   Indicates that reading should start at the most
  /// recent record in the system, which is the latest unexpired (not yet
  /// deleted) record in the change-log stream.
  /// </li>
  /// </ul>
  ///
  /// Parameter [limit] :
  /// Specifies the maximum number of records to return. There is also a size
  /// limit of 10 MB on the response that can't be modified and that takes
  /// precedence over the number of records specified in the <code>limit</code>
  /// parameter. The response does include a threshold-breaching record if the
  /// 10 MB limit was reached.
  ///
  /// The range for <code>limit</code> is 1 to 100,000, with a default of 10.
  ///
  /// Parameter [opNum] :
  /// The operation sequence number within the specified commit to start reading
  /// from in the change-log stream data. The default is <code>1</code>.
  Future<GetSparqlStreamOutput> getSparqlStream({
    int? commitNum,
    Encoding? encoding,
    IteratorType? iteratorType,
    int? limit,
    int? opNum,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100000,
    );
    final headers = <String, String>{
      if (encoding != null) 'Accept-Encoding': encoding.toValue(),
    };
    final $query = <String, List<String>>{
      if (commitNum != null) 'commitNum': [commitNum.toString()],
      if (iteratorType != null) 'iteratorType': [iteratorType.toValue()],
      if (limit != null) 'limit': [limit.toString()],
      if (opNum != null) 'opNum': [opNum.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/sparql/stream',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetSparqlStreamOutput.fromJson(response);
  }

  /// Lists active Gremlin queries. See <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/gremlin-api-status.html">Gremlin
  /// query status API</a> for details about the output.
  ///
  /// When invoking this operation in a Neptune cluster that has IAM
  /// authentication enabled, the IAM user or role making the request must have
  /// a policy attached that allows the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-dp-actions.html#getquerystatus">neptune-db:GetQueryStatus</a>
  /// IAM action in that cluster.
  ///
  /// Note that the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-data-condition-keys.html#iam-neptune-condition-keys">neptune-db:QueryLanguage:Gremlin</a>
  /// IAM condition key can be used in the policy document to restrict the use
  /// of Gremlin queries (see <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-data-condition-keys.html">Condition
  /// keys available in Neptune IAM data-access policy statements</a>).
  ///
  /// May throw [BadRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientTimeoutException].
  /// May throw [AccessDeniedException].
  /// May throw [IllegalArgumentException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnsupportedOperationException].
  /// May throw [FailureByQueryException].
  /// May throw [PreconditionsFailedException].
  /// May throw [ParsingException].
  /// May throw [ReadOnlyViolationException].
  /// May throw [ConstraintViolationException].
  /// May throw [TimeLimitExceededException].
  /// May throw [InvalidArgumentException].
  /// May throw [ConcurrentModificationException].
  /// May throw [MissingParameterException].
  ///
  /// Parameter [includeWaiting] :
  /// If set to <code>TRUE</code>, the list returned includes waiting queries.
  /// The default is <code>FALSE</code>;
  Future<ListGremlinQueriesOutput> listGremlinQueries({
    bool? includeWaiting,
  }) async {
    final $query = <String, List<String>>{
      if (includeWaiting != null) 'includeWaiting': [includeWaiting.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/gremlin/status',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListGremlinQueriesOutput.fromJson(response);
  }

  /// Retrieves a list of the <code>loadIds</code> for all active loader jobs.
  ///
  /// When invoking this operation in a Neptune cluster that has IAM
  /// authentication enabled, the IAM user or role making the request must have
  /// a policy attached that allows the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-dp-actions.html#listloaderjobs">neptune-db:ListLoaderJobs</a>
  /// IAM action in that cluster..
  ///
  /// May throw [UnsupportedOperationException].
  /// May throw [BadRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [BulkLoadIdNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ClientTimeoutException].
  /// May throw [PreconditionsFailedException].
  /// May throw [ConstraintViolationException].
  /// May throw [InvalidArgumentException].
  /// May throw [LoadUrlAccessDeniedException].
  /// May throw [IllegalArgumentException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [includeQueuedLoads] :
  /// An optional parameter that can be used to exclude the load IDs of queued
  /// load requests when requesting a list of load IDs by setting the parameter
  /// to <code>FALSE</code>. The default value is <code>TRUE</code>.
  ///
  /// Parameter [limit] :
  /// The number of load IDs to list. Must be a positive integer greater than
  /// zero and not more than <code>100</code> (which is the default).
  Future<ListLoaderJobsOutput> listLoaderJobs({
    bool? includeQueuedLoads,
    int? limit,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (includeQueuedLoads != null)
        'includeQueuedLoads': [includeQueuedLoads.toString()],
      if (limit != null) 'limit': [limit.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/loader',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListLoaderJobsOutput.fromJson(response);
  }

  /// Returns a list of Neptune ML data processing jobs. See <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/machine-learning-api-dataprocessing.html#machine-learning-api-dataprocessing-list-jobs">Listing
  /// active data-processing jobs using the Neptune ML dataprocessing
  /// command</a>.
  ///
  /// When invoking this operation in a Neptune cluster that has IAM
  /// authentication enabled, the IAM user or role making the request must have
  /// a policy attached that allows the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-dp-actions.html#listmldataprocessingjobs">neptune-db:ListMLDataProcessingJobs</a>
  /// IAM action in that cluster.
  ///
  /// May throw [UnsupportedOperationException].
  /// May throw [BadRequestException].
  /// May throw [MLResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientTimeoutException].
  /// May throw [PreconditionsFailedException].
  /// May throw [ConstraintViolationException].
  /// May throw [InvalidArgumentException].
  /// May throw [MissingParameterException].
  /// May throw [IllegalArgumentException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [maxItems] :
  /// The maximum number of items to return (from 1 to 1024; the default is 10).
  ///
  /// Parameter [neptuneIamRoleArn] :
  /// The ARN of an IAM role that provides Neptune access to SageMaker and
  /// Amazon S3 resources. This must be listed in your DB cluster parameter
  /// group or an error will occur.
  Future<ListMLDataProcessingJobsOutput> listMLDataProcessingJobs({
    int? maxItems,
    String? neptuneIamRoleArn,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1024,
    );
    final $query = <String, List<String>>{
      if (maxItems != null) 'maxItems': [maxItems.toString()],
      if (neptuneIamRoleArn != null) 'neptuneIamRoleArn': [neptuneIamRoleArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/ml/dataprocessing',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMLDataProcessingJobsOutput.fromJson(response);
  }

  /// Lists existing inference endpoints. See <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/machine-learning-api-endpoints.html">Managing
  /// inference endpoints using the endpoints command</a>.
  ///
  /// When invoking this operation in a Neptune cluster that has IAM
  /// authentication enabled, the IAM user or role making the request must have
  /// a policy attached that allows the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-dp-actions.html#listmlendpoints">neptune-db:ListMLEndpoints</a>
  /// IAM action in that cluster.
  ///
  /// May throw [UnsupportedOperationException].
  /// May throw [BadRequestException].
  /// May throw [MLResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientTimeoutException].
  /// May throw [PreconditionsFailedException].
  /// May throw [ConstraintViolationException].
  /// May throw [InvalidArgumentException].
  /// May throw [MissingParameterException].
  /// May throw [IllegalArgumentException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [maxItems] :
  /// The maximum number of items to return (from 1 to 1024; the default is 10.
  ///
  /// Parameter [neptuneIamRoleArn] :
  /// The ARN of an IAM role that provides Neptune access to SageMaker and
  /// Amazon S3 resources. This must be listed in your DB cluster parameter
  /// group or an error will occur.
  Future<ListMLEndpointsOutput> listMLEndpoints({
    int? maxItems,
    String? neptuneIamRoleArn,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1024,
    );
    final $query = <String, List<String>>{
      if (maxItems != null) 'maxItems': [maxItems.toString()],
      if (neptuneIamRoleArn != null) 'neptuneIamRoleArn': [neptuneIamRoleArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/ml/endpoints',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMLEndpointsOutput.fromJson(response);
  }

  /// Lists Neptune ML model-training jobs. See <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/machine-learning-api-modeltraining.html">Model
  /// training using the <code>modeltraining</code> command</a>.
  ///
  /// When invoking this operation in a Neptune cluster that has IAM
  /// authentication enabled, the IAM user or role making the request must have
  /// a policy attached that allows the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-dp-actions.html#neptune-db:listmlmodeltrainingjobs">neptune-db:neptune-db:ListMLModelTrainingJobs</a>
  /// IAM action in that cluster.
  ///
  /// May throw [UnsupportedOperationException].
  /// May throw [BadRequestException].
  /// May throw [MLResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientTimeoutException].
  /// May throw [PreconditionsFailedException].
  /// May throw [ConstraintViolationException].
  /// May throw [InvalidArgumentException].
  /// May throw [MissingParameterException].
  /// May throw [IllegalArgumentException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [maxItems] :
  /// The maximum number of items to return (from 1 to 1024; the default is 10).
  ///
  /// Parameter [neptuneIamRoleArn] :
  /// The ARN of an IAM role that provides Neptune access to SageMaker and
  /// Amazon S3 resources. This must be listed in your DB cluster parameter
  /// group or an error will occur.
  Future<ListMLModelTrainingJobsOutput> listMLModelTrainingJobs({
    int? maxItems,
    String? neptuneIamRoleArn,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1024,
    );
    final $query = <String, List<String>>{
      if (maxItems != null) 'maxItems': [maxItems.toString()],
      if (neptuneIamRoleArn != null) 'neptuneIamRoleArn': [neptuneIamRoleArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/ml/modeltraining',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMLModelTrainingJobsOutput.fromJson(response);
  }

  /// Returns a list of model transform job IDs. See <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/machine-learning-model-transform.html">Use
  /// a trained model to generate new model artifacts</a>.
  ///
  /// When invoking this operation in a Neptune cluster that has IAM
  /// authentication enabled, the IAM user or role making the request must have
  /// a policy attached that allows the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-dp-actions.html#listmlmodeltransformjobs">neptune-db:ListMLModelTransformJobs</a>
  /// IAM action in that cluster.
  ///
  /// May throw [UnsupportedOperationException].
  /// May throw [BadRequestException].
  /// May throw [MLResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientTimeoutException].
  /// May throw [PreconditionsFailedException].
  /// May throw [ConstraintViolationException].
  /// May throw [InvalidArgumentException].
  /// May throw [MissingParameterException].
  /// May throw [IllegalArgumentException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [maxItems] :
  /// The maximum number of items to return (from 1 to 1024; the default is 10).
  ///
  /// Parameter [neptuneIamRoleArn] :
  /// The ARN of an IAM role that provides Neptune access to SageMaker and
  /// Amazon S3 resources. This must be listed in your DB cluster parameter
  /// group or an error will occur.
  Future<ListMLModelTransformJobsOutput> listMLModelTransformJobs({
    int? maxItems,
    String? neptuneIamRoleArn,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1024,
    );
    final $query = <String, List<String>>{
      if (maxItems != null) 'maxItems': [maxItems.toString()],
      if (neptuneIamRoleArn != null) 'neptuneIamRoleArn': [neptuneIamRoleArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/ml/modeltransform',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMLModelTransformJobsOutput.fromJson(response);
  }

  /// Lists active openCypher queries. See <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/access-graph-opencypher-status.html">Neptune
  /// openCypher status endpoint</a> for more information.
  ///
  /// When invoking this operation in a Neptune cluster that has IAM
  /// authentication enabled, the IAM user or role making the request must have
  /// a policy attached that allows the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-dp-actions.html#getquerystatus">neptune-db:GetQueryStatus</a>
  /// IAM action in that cluster.
  ///
  /// Note that the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-data-condition-keys.html#iam-neptune-condition-keys">neptune-db:QueryLanguage:OpenCypher</a>
  /// IAM condition key can be used in the policy document to restrict the use
  /// of openCypher queries (see <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-data-condition-keys.html">Condition
  /// keys available in Neptune IAM data-access policy statements</a>).
  ///
  /// May throw [InvalidNumericDataException].
  /// May throw [BadRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientTimeoutException].
  /// May throw [AccessDeniedException].
  /// May throw [IllegalArgumentException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnsupportedOperationException].
  /// May throw [FailureByQueryException].
  /// May throw [PreconditionsFailedException].
  /// May throw [ParsingException].
  /// May throw [ReadOnlyViolationException].
  /// May throw [ConstraintViolationException].
  /// May throw [TimeLimitExceededException].
  /// May throw [InvalidArgumentException].
  /// May throw [ConcurrentModificationException].
  /// May throw [MissingParameterException].
  ///
  /// Parameter [includeWaiting] :
  /// When set to <code>TRUE</code> and other parameters are not present, causes
  /// status information to be returned for waiting queries as well as for
  /// running queries.
  Future<ListOpenCypherQueriesOutput> listOpenCypherQueries({
    bool? includeWaiting,
  }) async {
    final $query = <String, List<String>>{
      if (includeWaiting != null) 'includeWaiting': [includeWaiting.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/opencypher/status',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListOpenCypherQueriesOutput.fromJson(response);
  }

  /// Manages the generation and use of property graph statistics.
  ///
  /// When invoking this operation in a Neptune cluster that has IAM
  /// authentication enabled, the IAM user or role making the request must have
  /// a policy attached that allows the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-dp-actions.html#managestatistics">neptune-db:ManageStatistics</a>
  /// IAM action in that cluster.
  ///
  /// May throw [BadRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [StatisticsNotAvailableException].
  /// May throw [ClientTimeoutException].
  /// May throw [AccessDeniedException].
  /// May throw [IllegalArgumentException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnsupportedOperationException].
  /// May throw [PreconditionsFailedException].
  /// May throw [ReadOnlyViolationException].
  /// May throw [ConstraintViolationException].
  /// May throw [InvalidArgumentException].
  /// May throw [MissingParameterException].
  ///
  /// Parameter [mode] :
  /// The statistics generation mode. One of: <code>DISABLE_AUTOCOMPUTE</code>,
  /// <code>ENABLE_AUTOCOMPUTE</code>, or <code>REFRESH</code>, the last of
  /// which manually triggers DFE statistics generation.
  Future<ManagePropertygraphStatisticsOutput> managePropertygraphStatistics({
    StatisticsAutoGenerationMode? mode,
  }) async {
    final $payload = <String, dynamic>{
      if (mode != null) 'mode': mode.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/propertygraph/statistics',
      exceptionFnMap: _exceptionFns,
    );
    return ManagePropertygraphStatisticsOutput.fromJson(response);
  }

  /// Manages the generation and use of RDF graph statistics.
  ///
  /// When invoking this operation in a Neptune cluster that has IAM
  /// authentication enabled, the IAM user or role making the request must have
  /// a policy attached that allows the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-dp-actions.html#managestatistics">neptune-db:ManageStatistics</a>
  /// IAM action in that cluster.
  ///
  /// May throw [BadRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [StatisticsNotAvailableException].
  /// May throw [ClientTimeoutException].
  /// May throw [AccessDeniedException].
  /// May throw [IllegalArgumentException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnsupportedOperationException].
  /// May throw [PreconditionsFailedException].
  /// May throw [ReadOnlyViolationException].
  /// May throw [ConstraintViolationException].
  /// May throw [InvalidArgumentException].
  /// May throw [MissingParameterException].
  ///
  /// Parameter [mode] :
  /// The statistics generation mode. One of: <code>DISABLE_AUTOCOMPUTE</code>,
  /// <code>ENABLE_AUTOCOMPUTE</code>, or <code>REFRESH</code>, the last of
  /// which manually triggers DFE statistics generation.
  Future<ManageSparqlStatisticsOutput> manageSparqlStatistics({
    StatisticsAutoGenerationMode? mode,
  }) async {
    final $payload = <String, dynamic>{
      if (mode != null) 'mode': mode.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/sparql/statistics',
      exceptionFnMap: _exceptionFns,
    );
    return ManageSparqlStatisticsOutput.fromJson(response);
  }

  /// Starts a Neptune bulk loader job to load data from an Amazon S3 bucket
  /// into a Neptune DB instance. See <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/bulk-load.html">Using
  /// the Amazon Neptune Bulk Loader to Ingest Data</a>.
  ///
  /// When invoking this operation in a Neptune cluster that has IAM
  /// authentication enabled, the IAM user or role making the request must have
  /// a policy attached that allows the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-dp-actions.html#startloaderjob">neptune-db:StartLoaderJob</a>
  /// IAM action in that cluster.
  ///
  /// May throw [BadRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [BulkLoadIdNotFoundException].
  /// May throw [ClientTimeoutException].
  /// May throw [LoadUrlAccessDeniedException].
  /// May throw [IllegalArgumentException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnsupportedOperationException].
  /// May throw [InternalFailureException].
  /// May throw [S3Exception].
  /// May throw [PreconditionsFailedException].
  /// May throw [ConstraintViolationException].
  /// May throw [InvalidArgumentException].
  /// May throw [MissingParameterException].
  ///
  /// Parameter [format] :
  /// The format of the data. For more information about data formats for the
  /// Neptune <code>Loader</code> command, see <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/bulk-load-tutorial-format.html">Load
  /// Data Formats</a>.
  /// <p class="title"> <b>Allowed values</b>
  ///
  /// <ul>
  /// <li>
  /// <b> <code>csv</code> </b> for the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/bulk-load-tutorial-format-gremlin.html">Gremlin
  /// CSV data format</a>.
  /// </li>
  /// <li>
  /// <b> <code>opencypher</code> </b> for the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/bulk-load-tutorial-format-opencypher.html">openCypher
  /// CSV data format</a>.
  /// </li>
  /// <li>
  /// <b> <code>ntriples</code> </b> for the <a
  /// href="https://www.w3.org/TR/n-triples/">N-Triples RDF data format</a>.
  /// </li>
  /// <li>
  /// <b> <code>nquads</code> </b> for the <a
  /// href="https://www.w3.org/TR/n-quads/">N-Quads RDF data format</a>.
  /// </li>
  /// <li>
  /// <b> <code>rdfxml</code> </b> for the <a
  /// href="https://www.w3.org/TR/rdf-syntax-grammar/">RDF\XML RDF data
  /// format</a>.
  /// </li>
  /// <li>
  /// <b> <code>turtle</code> </b> for the <a
  /// href="https://www.w3.org/TR/turtle/">Turtle RDF data format</a>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [iamRoleArn] :
  /// The Amazon Resource Name (ARN) for an IAM role to be assumed by the
  /// Neptune DB instance for access to the S3 bucket. The IAM role ARN provided
  /// here should be attached to the DB cluster (see <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/bulk-load-tutorial-IAM-add-role-cluster.html">Adding
  /// the IAM Role to an Amazon Neptune Cluster</a>.
  ///
  /// Parameter [s3BucketRegion] :
  /// The Amazon region of the S3 bucket. This must match the Amazon Region of
  /// the DB cluster.
  ///
  /// Parameter [source] :
  /// The <code>source</code> parameter accepts an S3 URI that identifies a
  /// single file, multiple files, a folder, or multiple folders. Neptune loads
  /// every data file in any folder that is specified.
  ///
  /// The URI can be in any of the following formats.
  ///
  /// <ul>
  /// <li>
  /// <code>s3://(bucket_name)/(object-key-name)</code>
  /// </li>
  /// <li>
  /// <code>https://s3.amazonaws.com/(bucket_name)/(object-key-name)</code>
  /// </li>
  /// <li>
  /// <code>https://s3.us-east-1.amazonaws.com/(bucket_name)/(object-key-name)</code>
  /// </li>
  /// </ul>
  /// The <code>object-key-name</code> element of the URI is equivalent to the
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListObjects.html#API_ListObjects_RequestParameters">prefix</a>
  /// parameter in an S3 <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListObjects.html">ListObjects</a>
  /// API call. It identifies all the objects in the specified S3 bucket whose
  /// names begin with that prefix. That can be a single file or folder, or
  /// multiple files and/or folders.
  ///
  /// The specified folder or folders can contain multiple vertex files and
  /// multiple edge files.
  ///
  /// Parameter [dependencies] :
  /// This is an optional parameter that can make a queued load request
  /// contingent on the successful completion of one or more previous jobs in
  /// the queue.
  ///
  /// Neptune can queue up as many as 64 load requests at a time, if their
  /// <code>queueRequest</code> parameters are set to <code>"TRUE"</code>. The
  /// <code>dependencies</code> parameter lets you make execution of such a
  /// queued request dependent on the successful completion of one or more
  /// specified previous requests in the queue.
  ///
  /// For example, if load <code>Job-A</code> and <code>Job-B</code> are
  /// independent of each other, but load <code>Job-C</code> needs
  /// <code>Job-A</code> and <code>Job-B</code> to be finished before it begins,
  /// proceed as follows:
  /// <ol>
  /// <li>
  /// Submit <code>load-job-A</code> and <code>load-job-B</code> one after
  /// another in any order, and save their load-ids.
  /// </li>
  /// <li>
  /// Submit <code>load-job-C</code> with the load-ids of the two jobs in its
  /// <code>dependencies</code> field:
  /// </li> </ol>
  /// Because of the <code>dependencies</code> parameter, the bulk loader will
  /// not start <code>Job-C</code> until <code>Job-A</code> and
  /// <code>Job-B</code> have completed successfully. If either one of them
  /// fails, Job-C will not be executed, and its status will be set to
  /// <code>LOAD_FAILED_BECAUSE_DEPENDENCY_NOT_SATISFIED</code>.
  ///
  /// You can set up multiple levels of dependency in this way, so that the
  /// failure of one job will cause all requests that are directly or indirectly
  /// dependent on it to be cancelled.
  ///
  /// Parameter [failOnError] :
  /// <b> <code>failOnError</code> </b>   –   A flag to toggle a complete stop
  /// on an error.
  ///
  /// <i>Allowed values</i>: <code>"TRUE"</code>, <code>"FALSE"</code>.
  ///
  /// <i>Default value</i>: <code>"TRUE"</code>.
  ///
  /// When this parameter is set to <code>"FALSE"</code>, the loader tries to
  /// load all the data in the location specified, skipping any entries with
  /// errors.
  ///
  /// When this parameter is set to <code>"TRUE"</code>, the loader stops as
  /// soon as it encounters an error. Data loaded up to that point persists.
  ///
  /// Parameter [mode] :
  /// The load job mode.
  ///
  /// <i>Allowed values</i>: <code>RESUME</code>, <code>NEW</code>,
  /// <code>AUTO</code>.
  ///
  /// <i>Default value</i>: <code>AUTO</code>.
  /// <p class="title"> <b/>
  ///
  /// <ul>
  /// <li>
  /// <code>RESUME</code>   –   In RESUME mode, the loader looks for a previous
  /// load from this source, and if it finds one, resumes that load job. If no
  /// previous load job is found, the loader stops.
  ///
  /// The loader avoids reloading files that were successfully loaded in a
  /// previous job. It only tries to process failed files. If you dropped
  /// previously loaded data from your Neptune cluster, that data is not
  /// reloaded in this mode. If a previous load job loaded all files from the
  /// same source successfully, nothing is reloaded, and the loader returns
  /// success.
  /// </li>
  /// <li>
  /// <code>NEW</code>   –   In NEW mode, the creates a new load request
  /// regardless of any previous loads. You can use this mode to reload all the
  /// data from a source after dropping previously loaded data from your Neptune
  /// cluster, or to load new data available at the same source.
  /// </li>
  /// <li>
  /// <code>AUTO</code>   –   In AUTO mode, the loader looks for a previous load
  /// job from the same source, and if it finds one, resumes that job, just as
  /// in <code>RESUME</code> mode.
  ///
  /// If the loader doesn't find a previous load job from the same source, it
  /// loads all data from the source, just as in <code>NEW</code> mode.
  /// </li>
  /// </ul>
  ///
  /// Parameter [parallelism] :
  /// The optional <code>parallelism</code> parameter can be set to reduce the
  /// number of threads used by the bulk load process.
  ///
  /// <i>Allowed values</i>:
  ///
  /// <ul>
  /// <li>
  /// <code>LOW</code> –   The number of threads used is the number of available
  /// vCPUs divided by 8.
  /// </li>
  /// <li>
  /// <code>MEDIUM</code> –   The number of threads used is the number of
  /// available vCPUs divided by 2.
  /// </li>
  /// <li>
  /// <code>HIGH</code> –   The number of threads used is the same as the number
  /// of available vCPUs.
  /// </li>
  /// <li>
  /// <code>OVERSUBSCRIBE</code> –   The number of threads used is the number of
  /// available vCPUs multiplied by 2. If this value is used, the bulk loader
  /// takes up all available resources.
  ///
  /// This does not mean, however, that the <code>OVERSUBSCRIBE</code> setting
  /// results in 100% CPU utilization. Because the load operation is I/O bound,
  /// the highest CPU utilization to expect is in the 60% to 70% range.
  /// </li>
  /// </ul>
  /// <i>Default value</i>: <code>HIGH</code>
  ///
  /// The <code>parallelism</code> setting can sometimes result in a deadlock
  /// between threads when loading openCypher data. When this happens, Neptune
  /// returns the <code>LOAD_DATA_DEADLOCK</code> error. You can generally fix
  /// the issue by setting <code>parallelism</code> to a lower setting and
  /// retrying the load command.
  ///
  /// Parameter [parserConfiguration] :
  /// <b> <code>parserConfiguration</code> </b>   –   An optional object with
  /// additional parser configuration values. Each of the child parameters is
  /// also optional:
  /// <p class="title"> <b/>
  ///
  /// <ul>
  /// <li>
  /// <b> <code>namedGraphUri</code> </b>   –   The default graph for all RDF
  /// formats when no graph is specified (for non-quads formats and NQUAD
  /// entries with no graph).
  ///
  /// The default is
  /// <code>https://aws.amazon.com/neptune/vocab/v01/DefaultNamedGraph</code>.
  /// </li>
  /// <li>
  /// <b> <code>baseUri</code> </b>   –   The base URI for RDF/XML and Turtle
  /// formats.
  ///
  /// The default is <code>https://aws.amazon.com/neptune/default</code>.
  /// </li>
  /// <li>
  /// <b> <code>allowEmptyStrings</code> </b>   –   Gremlin users need to be
  /// able to pass empty string values("") as node and edge properties when
  /// loading CSV data. If <code>allowEmptyStrings</code> is set to
  /// <code>false</code> (the default), such empty strings are treated as nulls
  /// and are not loaded.
  ///
  /// If <code>allowEmptyStrings</code> is set to <code>true</code>, the loader
  /// treats empty strings as valid property values and loads them accordingly.
  /// </li>
  /// </ul>
  ///
  /// Parameter [queueRequest] :
  /// This is an optional flag parameter that indicates whether the load request
  /// can be queued up or not.
  ///
  /// You don't have to wait for one load job to complete before issuing the
  /// next one, because Neptune can queue up as many as 64 jobs at a time,
  /// provided that their <code>queueRequest</code> parameters are all set to
  /// <code>"TRUE"</code>. The queue order of the jobs will be
  /// first-in-first-out (FIFO).
  ///
  /// If the <code>queueRequest</code> parameter is omitted or set to
  /// <code>"FALSE"</code>, the load request will fail if another load job is
  /// already running.
  ///
  /// <i>Allowed values</i>: <code>"TRUE"</code>, <code>"FALSE"</code>.
  ///
  /// <i>Default value</i>: <code>"FALSE"</code>.
  ///
  /// Parameter [updateSingleCardinalityProperties] :
  /// <code>updateSingleCardinalityProperties</code> is an optional parameter
  /// that controls how the bulk loader treats a new value for
  /// single-cardinality vertex or edge properties. This is not supported for
  /// loading openCypher data.
  ///
  /// <i>Allowed values</i>: <code>"TRUE"</code>, <code>"FALSE"</code>.
  ///
  /// <i>Default value</i>: <code>"FALSE"</code>.
  ///
  /// By default, or when <code>updateSingleCardinalityProperties</code> is
  /// explicitly set to <code>"FALSE"</code>, the loader treats a new value as
  /// an error, because it violates single cardinality.
  ///
  /// When <code>updateSingleCardinalityProperties</code> is set to
  /// <code>"TRUE"</code>, on the other hand, the bulk loader replaces the
  /// existing value with the new one. If multiple edge or single-cardinality
  /// vertex property values are provided in the source file(s) being loaded,
  /// the final value at the end of the bulk load could be any one of those new
  /// values. The loader only guarantees that the existing value has been
  /// replaced by one of the new ones.
  ///
  /// Parameter [userProvidedEdgeIds] :
  /// This parameter is required only when loading openCypher data that contains
  /// relationship IDs. It must be included and set to <code>True</code> when
  /// openCypher relationship IDs are explicitly provided in the load data
  /// (recommended).
  ///
  /// When <code>userProvidedEdgeIds</code> is absent or set to
  /// <code>True</code>, an <code>:ID</code> column must be present in every
  /// relationship file in the load.
  ///
  /// When <code>userProvidedEdgeIds</code> is present and set to
  /// <code>False</code>, relationship files in the load <b>must not</b> contain
  /// an <code>:ID</code> column. Instead, the Neptune loader automatically
  /// generates an ID for each relationship.
  ///
  /// It's useful to provide relationship IDs explicitly so that the loader can
  /// resume loading after error in the CSV data have been fixed, without having
  /// to reload any relationships that have already been loaded. If relationship
  /// IDs have not been explicitly assigned, the loader cannot resume a failed
  /// load if any relationship file has had to be corrected, and must instead
  /// reload all the relationships.
  Future<StartLoaderJobOutput> startLoaderJob({
    required Format format,
    required String iamRoleArn,
    required S3BucketRegion s3BucketRegion,
    required String source,
    List<String>? dependencies,
    bool? failOnError,
    Mode? mode,
    Parallelism? parallelism,
    Map<String, String>? parserConfiguration,
    bool? queueRequest,
    bool? updateSingleCardinalityProperties,
    bool? userProvidedEdgeIds,
  }) async {
    final $payload = <String, dynamic>{
      'format': format.toValue(),
      'iamRoleArn': iamRoleArn,
      'region': s3BucketRegion.toValue(),
      'source': source,
      if (dependencies != null) 'dependencies': dependencies,
      if (failOnError != null) 'failOnError': failOnError,
      if (mode != null) 'mode': mode.toValue(),
      if (parallelism != null) 'parallelism': parallelism.toValue(),
      if (parserConfiguration != null)
        'parserConfiguration': parserConfiguration,
      if (queueRequest != null) 'queueRequest': queueRequest,
      if (updateSingleCardinalityProperties != null)
        'updateSingleCardinalityProperties': updateSingleCardinalityProperties,
      if (userProvidedEdgeIds != null)
        'userProvidedEdgeIds': userProvidedEdgeIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/loader',
      exceptionFnMap: _exceptionFns,
    );
    return StartLoaderJobOutput.fromJson(response);
  }

  /// Creates a new Neptune ML data processing job for processing the graph data
  /// exported from Neptune for training. See <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/machine-learning-api-dataprocessing.html">The
  /// <code>dataprocessing</code> command</a>.
  ///
  /// When invoking this operation in a Neptune cluster that has IAM
  /// authentication enabled, the IAM user or role making the request must have
  /// a policy attached that allows the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-dp-actions.html#startmlmodeldataprocessingjob">neptune-db:StartMLModelDataProcessingJob</a>
  /// IAM action in that cluster.
  ///
  /// May throw [UnsupportedOperationException].
  /// May throw [BadRequestException].
  /// May throw [MLResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientTimeoutException].
  /// May throw [PreconditionsFailedException].
  /// May throw [ConstraintViolationException].
  /// May throw [InvalidArgumentException].
  /// May throw [MissingParameterException].
  /// May throw [IllegalArgumentException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [inputDataS3Location] :
  /// The URI of the Amazon S3 location where you want SageMaker to download the
  /// data needed to run the data processing job.
  ///
  /// Parameter [processedDataS3Location] :
  /// The URI of the Amazon S3 location where you want SageMaker to save the
  /// results of a data processing job.
  ///
  /// Parameter [configFileName] :
  /// A data specification file that describes how to load the exported graph
  /// data for training. The file is automatically generated by the Neptune
  /// export toolkit. The default is
  /// <code>training-data-configuration.json</code>.
  ///
  /// Parameter [id] :
  /// A unique identifier for the new job. The default is an autogenerated UUID.
  ///
  /// Parameter [modelType] :
  /// One of the two model types that Neptune ML currently supports:
  /// heterogeneous graph models (<code>heterogeneous</code>), and knowledge
  /// graph (<code>kge</code>). The default is none. If not specified, Neptune
  /// ML chooses the model type automatically based on the data.
  ///
  /// Parameter [neptuneIamRoleArn] :
  /// The Amazon Resource Name (ARN) of an IAM role that SageMaker can assume to
  /// perform tasks on your behalf. This must be listed in your DB cluster
  /// parameter group or an error will occur.
  ///
  /// Parameter [previousDataProcessingJobId] :
  /// The job ID of a completed data processing job run on an earlier version of
  /// the data.
  ///
  /// Parameter [processingInstanceType] :
  /// The type of ML instance used during data processing. Its memory should be
  /// large enough to hold the processed dataset. The default is the smallest
  /// ml.r5 type whose memory is ten times larger than the size of the exported
  /// graph data on disk.
  ///
  /// Parameter [processingInstanceVolumeSizeInGB] :
  /// The disk volume size of the processing instance. Both input data and
  /// processed data are stored on disk, so the volume size must be large enough
  /// to hold both data sets. The default is 0. If not specified or 0, Neptune
  /// ML chooses the volume size automatically based on the data size.
  ///
  /// Parameter [processingTimeOutInSeconds] :
  /// Timeout in seconds for the data processing job. The default is 86,400 (1
  /// day).
  ///
  /// Parameter [s3OutputEncryptionKMSKey] :
  /// The Amazon Key Management Service (Amazon KMS) key that SageMaker uses to
  /// encrypt the output of the processing job. The default is none.
  ///
  /// Parameter [sagemakerIamRoleArn] :
  /// The ARN of an IAM role for SageMaker execution. This must be listed in
  /// your DB cluster parameter group or an error will occur.
  ///
  /// Parameter [securityGroupIds] :
  /// The VPC security group IDs. The default is None.
  ///
  /// Parameter [subnets] :
  /// The IDs of the subnets in the Neptune VPC. The default is None.
  ///
  /// Parameter [volumeEncryptionKMSKey] :
  /// The Amazon Key Management Service (Amazon KMS) key that SageMaker uses to
  /// encrypt data on the storage volume attached to the ML compute instances
  /// that run the training job. The default is None.
  Future<StartMLDataProcessingJobOutput> startMLDataProcessingJob({
    required String inputDataS3Location,
    required String processedDataS3Location,
    String? configFileName,
    String? id,
    String? modelType,
    String? neptuneIamRoleArn,
    String? previousDataProcessingJobId,
    String? processingInstanceType,
    int? processingInstanceVolumeSizeInGB,
    int? processingTimeOutInSeconds,
    String? s3OutputEncryptionKMSKey,
    String? sagemakerIamRoleArn,
    List<String>? securityGroupIds,
    List<String>? subnets,
    String? volumeEncryptionKMSKey,
  }) async {
    final $payload = <String, dynamic>{
      'inputDataS3Location': inputDataS3Location,
      'processedDataS3Location': processedDataS3Location,
      if (configFileName != null) 'configFileName': configFileName,
      if (id != null) 'id': id,
      if (modelType != null) 'modelType': modelType,
      if (neptuneIamRoleArn != null) 'neptuneIamRoleArn': neptuneIamRoleArn,
      if (previousDataProcessingJobId != null)
        'previousDataProcessingJobId': previousDataProcessingJobId,
      if (processingInstanceType != null)
        'processingInstanceType': processingInstanceType,
      if (processingInstanceVolumeSizeInGB != null)
        'processingInstanceVolumeSizeInGB': processingInstanceVolumeSizeInGB,
      if (processingTimeOutInSeconds != null)
        'processingTimeOutInSeconds': processingTimeOutInSeconds,
      if (s3OutputEncryptionKMSKey != null)
        's3OutputEncryptionKMSKey': s3OutputEncryptionKMSKey,
      if (sagemakerIamRoleArn != null)
        'sagemakerIamRoleArn': sagemakerIamRoleArn,
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
      if (subnets != null) 'subnets': subnets,
      if (volumeEncryptionKMSKey != null)
        'volumeEncryptionKMSKey': volumeEncryptionKMSKey,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ml/dataprocessing',
      exceptionFnMap: _exceptionFns,
    );
    return StartMLDataProcessingJobOutput.fromJson(response);
  }

  /// Creates a new Neptune ML model training job. See <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/machine-learning-api-modeltraining.html">Model
  /// training using the <code>modeltraining</code> command</a>.
  ///
  /// When invoking this operation in a Neptune cluster that has IAM
  /// authentication enabled, the IAM user or role making the request must have
  /// a policy attached that allows the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-dp-actions.html#startmlmodeltrainingjob">neptune-db:StartMLModelTrainingJob</a>
  /// IAM action in that cluster.
  ///
  /// May throw [UnsupportedOperationException].
  /// May throw [BadRequestException].
  /// May throw [MLResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientTimeoutException].
  /// May throw [PreconditionsFailedException].
  /// May throw [ConstraintViolationException].
  /// May throw [InvalidArgumentException].
  /// May throw [MissingParameterException].
  /// May throw [IllegalArgumentException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [dataProcessingJobId] :
  /// The job ID of the completed data-processing job that has created the data
  /// that the training will work with.
  ///
  /// Parameter [trainModelS3Location] :
  /// The location in Amazon S3 where the model artifacts are to be stored.
  ///
  /// Parameter [baseProcessingInstanceType] :
  /// The type of ML instance used in preparing and managing training of ML
  /// models. This is a CPU instance chosen based on memory requirements for
  /// processing the training data and model.
  ///
  /// Parameter [customModelTrainingParameters] :
  /// The configuration for custom model training. This is a JSON object.
  ///
  /// Parameter [enableManagedSpotTraining] :
  /// Optimizes the cost of training machine-learning models by using Amazon
  /// Elastic Compute Cloud spot instances. The default is <code>False</code>.
  ///
  /// Parameter [id] :
  /// A unique identifier for the new job. The default is An autogenerated UUID.
  ///
  /// Parameter [maxHPONumberOfTrainingJobs] :
  /// Maximum total number of training jobs to start for the hyperparameter
  /// tuning job. The default is 2. Neptune ML automatically tunes the
  /// hyperparameters of the machine learning model. To obtain a model that
  /// performs well, use at least 10 jobs (in other words, set
  /// <code>maxHPONumberOfTrainingJobs</code> to 10). In general, the more
  /// tuning runs, the better the results.
  ///
  /// Parameter [maxHPOParallelTrainingJobs] :
  /// Maximum number of parallel training jobs to start for the hyperparameter
  /// tuning job. The default is 2. The number of parallel jobs you can run is
  /// limited by the available resources on your training instance.
  ///
  /// Parameter [neptuneIamRoleArn] :
  /// The ARN of an IAM role that provides Neptune access to SageMaker and
  /// Amazon S3 resources. This must be listed in your DB cluster parameter
  /// group or an error will occur.
  ///
  /// Parameter [previousModelTrainingJobId] :
  /// The job ID of a completed model-training job that you want to update
  /// incrementally based on updated data.
  ///
  /// Parameter [s3OutputEncryptionKMSKey] :
  /// The Amazon Key Management Service (KMS) key that SageMaker uses to encrypt
  /// the output of the processing job. The default is none.
  ///
  /// Parameter [sagemakerIamRoleArn] :
  /// The ARN of an IAM role for SageMaker execution.This must be listed in your
  /// DB cluster parameter group or an error will occur.
  ///
  /// Parameter [securityGroupIds] :
  /// The VPC security group IDs. The default is None.
  ///
  /// Parameter [subnets] :
  /// The IDs of the subnets in the Neptune VPC. The default is None.
  ///
  /// Parameter [trainingInstanceType] :
  /// The type of ML instance used for model training. All Neptune ML models
  /// support CPU, GPU, and multiGPU training. The default is
  /// <code>ml.p3.2xlarge</code>. Choosing the right instance type for training
  /// depends on the task type, graph size, and your budget.
  ///
  /// Parameter [trainingInstanceVolumeSizeInGB] :
  /// The disk volume size of the training instance. Both input data and the
  /// output model are stored on disk, so the volume size must be large enough
  /// to hold both data sets. The default is 0. If not specified or 0, Neptune
  /// ML selects a disk volume size based on the recommendation generated in the
  /// data processing step.
  ///
  /// Parameter [trainingTimeOutInSeconds] :
  /// Timeout in seconds for the training job. The default is 86,400 (1 day).
  ///
  /// Parameter [volumeEncryptionKMSKey] :
  /// The Amazon Key Management Service (KMS) key that SageMaker uses to encrypt
  /// data on the storage volume attached to the ML compute instances that run
  /// the training job. The default is None.
  Future<StartMLModelTrainingJobOutput> startMLModelTrainingJob({
    required String dataProcessingJobId,
    required String trainModelS3Location,
    String? baseProcessingInstanceType,
    CustomModelTrainingParameters? customModelTrainingParameters,
    bool? enableManagedSpotTraining,
    String? id,
    int? maxHPONumberOfTrainingJobs,
    int? maxHPOParallelTrainingJobs,
    String? neptuneIamRoleArn,
    String? previousModelTrainingJobId,
    String? s3OutputEncryptionKMSKey,
    String? sagemakerIamRoleArn,
    List<String>? securityGroupIds,
    List<String>? subnets,
    String? trainingInstanceType,
    int? trainingInstanceVolumeSizeInGB,
    int? trainingTimeOutInSeconds,
    String? volumeEncryptionKMSKey,
  }) async {
    final $payload = <String, dynamic>{
      'dataProcessingJobId': dataProcessingJobId,
      'trainModelS3Location': trainModelS3Location,
      if (baseProcessingInstanceType != null)
        'baseProcessingInstanceType': baseProcessingInstanceType,
      if (customModelTrainingParameters != null)
        'customModelTrainingParameters': customModelTrainingParameters,
      if (enableManagedSpotTraining != null)
        'enableManagedSpotTraining': enableManagedSpotTraining,
      if (id != null) 'id': id,
      if (maxHPONumberOfTrainingJobs != null)
        'maxHPONumberOfTrainingJobs': maxHPONumberOfTrainingJobs,
      if (maxHPOParallelTrainingJobs != null)
        'maxHPOParallelTrainingJobs': maxHPOParallelTrainingJobs,
      if (neptuneIamRoleArn != null) 'neptuneIamRoleArn': neptuneIamRoleArn,
      if (previousModelTrainingJobId != null)
        'previousModelTrainingJobId': previousModelTrainingJobId,
      if (s3OutputEncryptionKMSKey != null)
        's3OutputEncryptionKMSKey': s3OutputEncryptionKMSKey,
      if (sagemakerIamRoleArn != null)
        'sagemakerIamRoleArn': sagemakerIamRoleArn,
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
      if (subnets != null) 'subnets': subnets,
      if (trainingInstanceType != null)
        'trainingInstanceType': trainingInstanceType,
      if (trainingInstanceVolumeSizeInGB != null)
        'trainingInstanceVolumeSizeInGB': trainingInstanceVolumeSizeInGB,
      if (trainingTimeOutInSeconds != null)
        'trainingTimeOutInSeconds': trainingTimeOutInSeconds,
      if (volumeEncryptionKMSKey != null)
        'volumeEncryptionKMSKey': volumeEncryptionKMSKey,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ml/modeltraining',
      exceptionFnMap: _exceptionFns,
    );
    return StartMLModelTrainingJobOutput.fromJson(response);
  }

  /// Creates a new model transform job. See <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/machine-learning-model-transform.html">Use
  /// a trained model to generate new model artifacts</a>.
  ///
  /// When invoking this operation in a Neptune cluster that has IAM
  /// authentication enabled, the IAM user or role making the request must have
  /// a policy attached that allows the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-dp-actions.html#startmlmodeltransformjob">neptune-db:StartMLModelTransformJob</a>
  /// IAM action in that cluster.
  ///
  /// May throw [UnsupportedOperationException].
  /// May throw [BadRequestException].
  /// May throw [MLResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientTimeoutException].
  /// May throw [PreconditionsFailedException].
  /// May throw [ConstraintViolationException].
  /// May throw [InvalidArgumentException].
  /// May throw [MissingParameterException].
  /// May throw [IllegalArgumentException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [modelTransformOutputS3Location] :
  /// The location in Amazon S3 where the model artifacts are to be stored.
  ///
  /// Parameter [baseProcessingInstanceType] :
  /// The type of ML instance used in preparing and managing training of ML
  /// models. This is an ML compute instance chosen based on memory requirements
  /// for processing the training data and model.
  ///
  /// Parameter [baseProcessingInstanceVolumeSizeInGB] :
  /// The disk volume size of the training instance in gigabytes. The default is
  /// 0. Both input data and the output model are stored on disk, so the volume
  /// size must be large enough to hold both data sets. If not specified or 0,
  /// Neptune ML selects a disk volume size based on the recommendation
  /// generated in the data processing step.
  ///
  /// Parameter [customModelTransformParameters] :
  /// Configuration information for a model transform using a custom model. The
  /// <code>customModelTransformParameters</code> object contains the following
  /// fields, which must have values compatible with the saved model parameters
  /// from the training job:
  ///
  /// Parameter [dataProcessingJobId] :
  /// The job ID of a completed data-processing job. You must include either
  /// <code>dataProcessingJobId</code> and a <code>mlModelTrainingJobId</code>,
  /// or a <code>trainingJobName</code>.
  ///
  /// Parameter [id] :
  /// A unique identifier for the new job. The default is an autogenerated UUID.
  ///
  /// Parameter [mlModelTrainingJobId] :
  /// The job ID of a completed model-training job. You must include either
  /// <code>dataProcessingJobId</code> and a <code>mlModelTrainingJobId</code>,
  /// or a <code>trainingJobName</code>.
  ///
  /// Parameter [neptuneIamRoleArn] :
  /// The ARN of an IAM role that provides Neptune access to SageMaker and
  /// Amazon S3 resources. This must be listed in your DB cluster parameter
  /// group or an error will occur.
  ///
  /// Parameter [s3OutputEncryptionKMSKey] :
  /// The Amazon Key Management Service (KMS) key that SageMaker uses to encrypt
  /// the output of the processing job. The default is none.
  ///
  /// Parameter [sagemakerIamRoleArn] :
  /// The ARN of an IAM role for SageMaker execution. This must be listed in
  /// your DB cluster parameter group or an error will occur.
  ///
  /// Parameter [securityGroupIds] :
  /// The VPC security group IDs. The default is None.
  ///
  /// Parameter [subnets] :
  /// The IDs of the subnets in the Neptune VPC. The default is None.
  ///
  /// Parameter [trainingJobName] :
  /// The name of a completed SageMaker training job. You must include either
  /// <code>dataProcessingJobId</code> and a <code>mlModelTrainingJobId</code>,
  /// or a <code>trainingJobName</code>.
  ///
  /// Parameter [volumeEncryptionKMSKey] :
  /// The Amazon Key Management Service (KMS) key that SageMaker uses to encrypt
  /// data on the storage volume attached to the ML compute instances that run
  /// the training job. The default is None.
  Future<StartMLModelTransformJobOutput> startMLModelTransformJob({
    required String modelTransformOutputS3Location,
    String? baseProcessingInstanceType,
    int? baseProcessingInstanceVolumeSizeInGB,
    CustomModelTransformParameters? customModelTransformParameters,
    String? dataProcessingJobId,
    String? id,
    String? mlModelTrainingJobId,
    String? neptuneIamRoleArn,
    String? s3OutputEncryptionKMSKey,
    String? sagemakerIamRoleArn,
    List<String>? securityGroupIds,
    List<String>? subnets,
    String? trainingJobName,
    String? volumeEncryptionKMSKey,
  }) async {
    final $payload = <String, dynamic>{
      'modelTransformOutputS3Location': modelTransformOutputS3Location,
      if (baseProcessingInstanceType != null)
        'baseProcessingInstanceType': baseProcessingInstanceType,
      if (baseProcessingInstanceVolumeSizeInGB != null)
        'baseProcessingInstanceVolumeSizeInGB':
            baseProcessingInstanceVolumeSizeInGB,
      if (customModelTransformParameters != null)
        'customModelTransformParameters': customModelTransformParameters,
      if (dataProcessingJobId != null)
        'dataProcessingJobId': dataProcessingJobId,
      if (id != null) 'id': id,
      if (mlModelTrainingJobId != null)
        'mlModelTrainingJobId': mlModelTrainingJobId,
      if (neptuneIamRoleArn != null) 'neptuneIamRoleArn': neptuneIamRoleArn,
      if (s3OutputEncryptionKMSKey != null)
        's3OutputEncryptionKMSKey': s3OutputEncryptionKMSKey,
      if (sagemakerIamRoleArn != null)
        'sagemakerIamRoleArn': sagemakerIamRoleArn,
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
      if (subnets != null) 'subnets': subnets,
      if (trainingJobName != null) 'trainingJobName': trainingJobName,
      if (volumeEncryptionKMSKey != null)
        'volumeEncryptionKMSKey': volumeEncryptionKMSKey,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ml/modeltransform',
      exceptionFnMap: _exceptionFns,
    );
    return StartMLModelTransformJobOutput.fromJson(response);
  }
}

enum Action {
  initiateDatabaseReset,
  performDatabaseReset,
}

extension ActionValueExtension on Action {
  String toValue() {
    switch (this) {
      case Action.initiateDatabaseReset:
        return 'initiateDatabaseReset';
      case Action.performDatabaseReset:
        return 'performDatabaseReset';
    }
  }
}

extension ActionFromString on String {
  Action toAction() {
    switch (this) {
      case 'initiateDatabaseReset':
        return Action.initiateDatabaseReset;
      case 'performDatabaseReset':
        return Action.performDatabaseReset;
    }
    throw Exception('$this is not known in enum Action');
  }
}

class CancelGremlinQueryOutput {
  /// The status of the cancelation
  final String? status;

  CancelGremlinQueryOutput({
    this.status,
  });

  factory CancelGremlinQueryOutput.fromJson(Map<String, dynamic> json) {
    return CancelGremlinQueryOutput(
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'status': status,
    };
  }
}

class CancelLoaderJobOutput {
  /// The cancellation status.
  final String? status;

  CancelLoaderJobOutput({
    this.status,
  });

  factory CancelLoaderJobOutput.fromJson(Map<String, dynamic> json) {
    return CancelLoaderJobOutput(
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'status': status,
    };
  }
}

class CancelMLDataProcessingJobOutput {
  /// The status of the cancellation request.
  final String? status;

  CancelMLDataProcessingJobOutput({
    this.status,
  });

  factory CancelMLDataProcessingJobOutput.fromJson(Map<String, dynamic> json) {
    return CancelMLDataProcessingJobOutput(
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'status': status,
    };
  }
}

class CancelMLModelTrainingJobOutput {
  /// The status of the cancellation.
  final String? status;

  CancelMLModelTrainingJobOutput({
    this.status,
  });

  factory CancelMLModelTrainingJobOutput.fromJson(Map<String, dynamic> json) {
    return CancelMLModelTrainingJobOutput(
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'status': status,
    };
  }
}

class CancelMLModelTransformJobOutput {
  /// the status of the cancelation.
  final String? status;

  CancelMLModelTransformJobOutput({
    this.status,
  });

  factory CancelMLModelTransformJobOutput.fromJson(Map<String, dynamic> json) {
    return CancelMLModelTransformJobOutput(
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'status': status,
    };
  }
}

class CancelOpenCypherQueryOutput {
  /// The cancelation payload for the openCypher query.
  final bool? payload;

  /// The cancellation status of the openCypher query.
  final String? status;

  CancelOpenCypherQueryOutput({
    this.payload,
    this.status,
  });

  factory CancelOpenCypherQueryOutput.fromJson(Map<String, dynamic> json) {
    return CancelOpenCypherQueryOutput(
      payload: json['payload'] as bool?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final payload = this.payload;
    final status = this.status;
    return {
      if (payload != null) 'payload': payload,
      if (status != null) 'status': status,
    };
  }
}

class CreateMLEndpointOutput {
  /// The ARN for the new inference endpoint.
  final String? arn;

  /// The endpoint creation time, in milliseconds.
  final int? creationTimeInMillis;

  /// The unique ID of the new inference endpoint.
  final String? id;

  CreateMLEndpointOutput({
    this.arn,
    this.creationTimeInMillis,
    this.id,
  });

  factory CreateMLEndpointOutput.fromJson(Map<String, dynamic> json) {
    return CreateMLEndpointOutput(
      arn: json['arn'] as String?,
      creationTimeInMillis: json['creationTimeInMillis'] as int?,
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTimeInMillis = this.creationTimeInMillis;
    final id = this.id;
    return {
      if (arn != null) 'arn': arn,
      if (creationTimeInMillis != null)
        'creationTimeInMillis': creationTimeInMillis,
      if (id != null) 'id': id,
    };
  }
}

/// Contains custom model training parameters. See <a
/// href="https://docs.aws.amazon.com/neptune/latest/userguide/machine-learning-custom-models.html">Custom
/// models in Neptune ML</a>.
class CustomModelTrainingParameters {
  /// The path to the Amazon S3 location where the Python module implementing your
  /// model is located. This must point to a valid existing Amazon S3 location
  /// that contains, at a minimum, a training script, a transform script, and a
  /// <code>model-hpo-configuration.json</code> file.
  final String sourceS3DirectoryPath;

  /// The name of the entry point in your module of a script that performs model
  /// training and takes hyperparameters as command-line arguments, including
  /// fixed hyperparameters. The default is <code>training.py</code>.
  final String? trainingEntryPointScript;

  /// The name of the entry point in your module of a script that should be run
  /// after the best model from the hyperparameter search has been identified, to
  /// compute the model artifacts necessary for model deployment. It should be
  /// able to run with no command-line arguments.The default is
  /// <code>transform.py</code>.
  final String? transformEntryPointScript;

  CustomModelTrainingParameters({
    required this.sourceS3DirectoryPath,
    this.trainingEntryPointScript,
    this.transformEntryPointScript,
  });

  Map<String, dynamic> toJson() {
    final sourceS3DirectoryPath = this.sourceS3DirectoryPath;
    final trainingEntryPointScript = this.trainingEntryPointScript;
    final transformEntryPointScript = this.transformEntryPointScript;
    return {
      'sourceS3DirectoryPath': sourceS3DirectoryPath,
      if (trainingEntryPointScript != null)
        'trainingEntryPointScript': trainingEntryPointScript,
      if (transformEntryPointScript != null)
        'transformEntryPointScript': transformEntryPointScript,
    };
  }
}

/// Contains custom model transform parameters. See <a
/// href="https://docs.aws.amazon.com/neptune/latest/userguide/machine-learning-model-transform.html">Use
/// a trained model to generate new model artifacts</a>.
class CustomModelTransformParameters {
  /// The path to the Amazon S3 location where the Python module implementing your
  /// model is located. This must point to a valid existing Amazon S3 location
  /// that contains, at a minimum, a training script, a transform script, and a
  /// <code>model-hpo-configuration.json</code> file.
  final String sourceS3DirectoryPath;

  /// The name of the entry point in your module of a script that should be run
  /// after the best model from the hyperparameter search has been identified, to
  /// compute the model artifacts necessary for model deployment. It should be
  /// able to run with no command-line arguments. The default is
  /// <code>transform.py</code>.
  final String? transformEntryPointScript;

  CustomModelTransformParameters({
    required this.sourceS3DirectoryPath,
    this.transformEntryPointScript,
  });

  Map<String, dynamic> toJson() {
    final sourceS3DirectoryPath = this.sourceS3DirectoryPath;
    final transformEntryPointScript = this.transformEntryPointScript;
    return {
      'sourceS3DirectoryPath': sourceS3DirectoryPath,
      if (transformEntryPointScript != null)
        'transformEntryPointScript': transformEntryPointScript,
    };
  }
}

class DeleteMLEndpointOutput {
  /// The status of the cancellation.
  final String? status;

  DeleteMLEndpointOutput({
    this.status,
  });

  factory DeleteMLEndpointOutput.fromJson(Map<String, dynamic> json) {
    return DeleteMLEndpointOutput(
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'status': status,
    };
  }
}

class DeletePropertygraphStatisticsOutput {
  /// The deletion payload.
  final DeleteStatisticsValueMap? payload;

  /// The cancel status.
  final String? status;

  /// The HTTP response code: 200 if the delete was successful, or 204 if there
  /// were no statistics to delete.
  final int? statusCode;

  DeletePropertygraphStatisticsOutput({
    this.payload,
    this.status,
    this.statusCode,
  });

  factory DeletePropertygraphStatisticsOutput.fromJson(
      Map<String, dynamic> json) {
    return DeletePropertygraphStatisticsOutput(
      payload: json['payload'] != null
          ? DeleteStatisticsValueMap.fromJson(
              json['payload'] as Map<String, dynamic>)
          : null,
      status: json['status'] as String?,
      statusCode: json['statusCode'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final payload = this.payload;
    final status = this.status;
    final statusCode = this.statusCode;
    return {
      if (payload != null) 'payload': payload,
      if (status != null) 'status': status,
    };
  }
}

class DeleteSparqlStatisticsOutput {
  /// The deletion payload.
  final DeleteStatisticsValueMap? payload;

  /// The cancel status.
  final String? status;

  /// The HTTP response code: 200 if the delete was successful, or 204 if there
  /// were no statistics to delete.
  final int? statusCode;

  DeleteSparqlStatisticsOutput({
    this.payload,
    this.status,
    this.statusCode,
  });

  factory DeleteSparqlStatisticsOutput.fromJson(Map<String, dynamic> json) {
    return DeleteSparqlStatisticsOutput(
      payload: json['payload'] != null
          ? DeleteStatisticsValueMap.fromJson(
              json['payload'] as Map<String, dynamic>)
          : null,
      status: json['status'] as String?,
      statusCode: json['statusCode'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final payload = this.payload;
    final status = this.status;
    final statusCode = this.statusCode;
    return {
      if (payload != null) 'payload': payload,
      if (status != null) 'status': status,
    };
  }
}

/// The payload for DeleteStatistics.
class DeleteStatisticsValueMap {
  /// The current status of the statistics.
  final bool? active;

  /// The ID of the statistics generation run that is currently occurring.
  final String? statisticsId;

  DeleteStatisticsValueMap({
    this.active,
    this.statisticsId,
  });

  factory DeleteStatisticsValueMap.fromJson(Map<String, dynamic> json) {
    return DeleteStatisticsValueMap(
      active: json['active'] as bool?,
      statisticsId: json['statisticsId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final active = this.active;
    final statisticsId = this.statisticsId;
    return {
      if (active != null) 'active': active,
      if (statisticsId != null) 'statisticsId': statisticsId,
    };
  }
}

class Document {
  Document();

  factory Document.fromJson(Map<String, dynamic> _) {
    return Document();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An edge structure.
class EdgeStructure {
  /// The number of edges that have this specific structure.
  final int? count;

  /// A list of edge properties present in this specific structure.
  final List<String>? edgeProperties;

  EdgeStructure({
    this.count,
    this.edgeProperties,
  });

  factory EdgeStructure.fromJson(Map<String, dynamic> json) {
    return EdgeStructure(
      count: json['count'] as int?,
      edgeProperties: (json['edgeProperties'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final count = this.count;
    final edgeProperties = this.edgeProperties;
    return {
      if (count != null) 'count': count,
      if (edgeProperties != null) 'edgeProperties': edgeProperties,
    };
  }
}

enum Encoding {
  gzip,
}

extension EncodingValueExtension on Encoding {
  String toValue() {
    switch (this) {
      case Encoding.gzip:
        return 'gzip';
    }
  }
}

extension EncodingFromString on String {
  Encoding toEncoding() {
    switch (this) {
      case 'gzip':
        return Encoding.gzip;
    }
    throw Exception('$this is not known in enum Encoding');
  }
}

class ExecuteFastResetOutput {
  /// The <code>status</code> is only returned for the
  /// <code>performDatabaseReset</code> action, and indicates whether or not the
  /// fast reset rquest is accepted.
  final String status;

  /// The <code>payload</code> is only returned by the
  /// <code>initiateDatabaseReset</code> action, and contains the unique token to
  /// use with the <code>performDatabaseReset</code> action to make the reset
  /// occur.
  final FastResetToken? payload;

  ExecuteFastResetOutput({
    required this.status,
    this.payload,
  });

  factory ExecuteFastResetOutput.fromJson(Map<String, dynamic> json) {
    return ExecuteFastResetOutput(
      status: json['status'] as String,
      payload: json['payload'] != null
          ? FastResetToken.fromJson(json['payload'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final payload = this.payload;
    return {
      'status': status,
      if (payload != null) 'payload': payload,
    };
  }
}

class ExecuteGremlinExplainQueryOutput {
  /// A text blob containing the Gremlin explain result, as described in <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/gremlin-traversal-tuning.html">Tuning
  /// Gremlin queries</a>.
  final Uint8List? output;

  ExecuteGremlinExplainQueryOutput({
    this.output,
  });

  Map<String, dynamic> toJson() {
    final output = this.output;
    return {
      if (output != null) 'output': base64Encode(output),
    };
  }
}

class ExecuteGremlinProfileQueryOutput {
  /// A text blob containing the Gremlin Profile result. See <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/gremlin-profile-api.html">Gremlin
  /// profile API in Neptune</a> for details.
  final Uint8List? output;

  ExecuteGremlinProfileQueryOutput({
    this.output,
  });

  Map<String, dynamic> toJson() {
    final output = this.output;
    return {
      if (output != null) 'output': base64Encode(output),
    };
  }
}

class ExecuteGremlinQueryOutput {
  /// Metadata about the Gremlin query.
  final Document? meta;

  /// The unique identifier of the Gremlin query.
  final String? requestId;

  /// The Gremlin query output from the server.
  final Document? result;

  /// The status of the Gremlin query.
  final GremlinQueryStatusAttributes? status;

  ExecuteGremlinQueryOutput({
    this.meta,
    this.requestId,
    this.result,
    this.status,
  });

  factory ExecuteGremlinQueryOutput.fromJson(Map<String, dynamic> json) {
    return ExecuteGremlinQueryOutput(
      meta: json['meta'] != null
          ? Document.fromJson(json['meta'] as Map<String, dynamic>)
          : null,
      requestId: json['requestId'] as String?,
      result: json['result'] != null
          ? Document.fromJson(json['result'] as Map<String, dynamic>)
          : null,
      status: json['status'] != null
          ? GremlinQueryStatusAttributes.fromJson(
              json['status'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final meta = this.meta;
    final requestId = this.requestId;
    final result = this.result;
    final status = this.status;
    return {
      if (meta != null) 'meta': meta,
      if (requestId != null) 'requestId': requestId,
      if (result != null) 'result': result,
      if (status != null) 'status': status,
    };
  }
}

class ExecuteOpenCypherExplainQueryOutput {
  /// A text blob containing the openCypher <code>explain</code> results.
  final Uint8List results;

  ExecuteOpenCypherExplainQueryOutput({
    required this.results,
  });

  Map<String, dynamic> toJson() {
    final results = this.results;
    return {
      'results': base64Encode(results),
    };
  }
}

class ExecuteOpenCypherQueryOutput {
  /// The openCypherquery results.
  final Document results;

  ExecuteOpenCypherQueryOutput({
    required this.results,
  });

  factory ExecuteOpenCypherQueryOutput.fromJson(Map<String, dynamic> json) {
    return ExecuteOpenCypherQueryOutput(
      results: Document.fromJson(json['results'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final results = this.results;
    return {
      'results': results,
    };
  }
}

/// A structure containing the fast reset token used to initiate a fast reset.
class FastResetToken {
  /// A UUID generated by the database in the <code>initiateDatabaseReset</code>
  /// action, and then consumed by the <code>performDatabaseReset</code> to reset
  /// the database.
  final String? token;

  FastResetToken({
    this.token,
  });

  factory FastResetToken.fromJson(Map<String, dynamic> json) {
    return FastResetToken(
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final token = this.token;
    return {
      if (token != null) 'token': token,
    };
  }
}

enum Format {
  csv,
  opencypher,
  ntriples,
  nquads,
  rdfxml,
  turtle,
}

extension FormatValueExtension on Format {
  String toValue() {
    switch (this) {
      case Format.csv:
        return 'csv';
      case Format.opencypher:
        return 'opencypher';
      case Format.ntriples:
        return 'ntriples';
      case Format.nquads:
        return 'nquads';
      case Format.rdfxml:
        return 'rdfxml';
      case Format.turtle:
        return 'turtle';
    }
  }
}

extension FormatFromString on String {
  Format toFormat() {
    switch (this) {
      case 'csv':
        return Format.csv;
      case 'opencypher':
        return Format.opencypher;
      case 'ntriples':
        return Format.ntriples;
      case 'nquads':
        return Format.nquads;
      case 'rdfxml':
        return Format.rdfxml;
      case 'turtle':
        return Format.turtle;
    }
    throw Exception('$this is not known in enum Format');
  }
}

class GetEngineStatusOutput {
  /// Set to the Neptune engine version running on your DB cluster. If this engine
  /// version has been manually patched since it was released, the version number
  /// is prefixed by <code>Patch-</code>.
  final String? dbEngineVersion;

  /// Set to <code>enabled</code> if the DFE engine is fully enabled, or to
  /// <code>viaQueryHint</code> (the default) if the DFE engine is only used with
  /// queries that have the <code>useDFE</code> query hint set to
  /// <code>true</code>.
  final String? dfeQueryEngine;

  /// Contains status information about the features enabled on your DB cluster.
  final Map<String, Document>? features;

  /// Contains information about the Gremlin query language available on your
  /// cluster. Specifically, it contains a version field that specifies the
  /// current TinkerPop version being used by the engine.
  final QueryLanguageVersion? gremlin;

  /// Contains Lab Mode settings being used by the engine.
  final Map<String, String>? labMode;

  /// Contains information about the openCypher query language available on your
  /// cluster. Specifically, it contains a version field that specifies the
  /// current operCypher version being used by the engine.
  final QueryLanguageVersion? opencypher;

  /// Set to <code>reader</code> if the instance is a read-replica, or to
  /// <code>writer</code> if the instance is the primary instance.
  final String? role;

  /// If there are transactions being rolled back, this field is set to the number
  /// of such transactions. If there are none, the field doesn't appear at all.
  final int? rollingBackTrxCount;

  /// Set to the start time of the earliest transaction being rolled back. If no
  /// transactions are being rolled back, the field doesn't appear at all.
  final String? rollingBackTrxEarliestStartTime;

  /// Contains information about the current settings on your DB cluster. For
  /// example, contains the current cluster query timeout setting
  /// (<code>clusterQueryTimeoutInMs</code>).
  final Map<String, String>? settings;

  /// Contains information about the SPARQL query language available on your
  /// cluster. Specifically, it contains a version field that specifies the
  /// current SPARQL version being used by the engine.
  final QueryLanguageVersion? sparql;

  /// Set to the UTC time at which the current server process started.
  final String? startTime;

  /// Set to <code>healthy</code> if the instance is not experiencing problems. If
  /// the instance is recovering from a crash or from being rebooted and there are
  /// active transactions running from the latest server shutdown, status is set
  /// to <code>recovery</code>.
  final String? status;

  GetEngineStatusOutput({
    this.dbEngineVersion,
    this.dfeQueryEngine,
    this.features,
    this.gremlin,
    this.labMode,
    this.opencypher,
    this.role,
    this.rollingBackTrxCount,
    this.rollingBackTrxEarliestStartTime,
    this.settings,
    this.sparql,
    this.startTime,
    this.status,
  });

  factory GetEngineStatusOutput.fromJson(Map<String, dynamic> json) {
    return GetEngineStatusOutput(
      dbEngineVersion: json['dbEngineVersion'] as String?,
      dfeQueryEngine: json['dfeQueryEngine'] as String?,
      features: (json['features'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(k, Document.fromJson(e as Map<String, dynamic>))),
      gremlin: json['gremlin'] != null
          ? QueryLanguageVersion.fromJson(
              json['gremlin'] as Map<String, dynamic>)
          : null,
      labMode: (json['labMode'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      opencypher: json['opencypher'] != null
          ? QueryLanguageVersion.fromJson(
              json['opencypher'] as Map<String, dynamic>)
          : null,
      role: json['role'] as String?,
      rollingBackTrxCount: json['rollingBackTrxCount'] as int?,
      rollingBackTrxEarliestStartTime:
          json['rollingBackTrxEarliestStartTime'] as String?,
      settings: (json['settings'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      sparql: json['sparql'] != null
          ? QueryLanguageVersion.fromJson(
              json['sparql'] as Map<String, dynamic>)
          : null,
      startTime: json['startTime'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dbEngineVersion = this.dbEngineVersion;
    final dfeQueryEngine = this.dfeQueryEngine;
    final features = this.features;
    final gremlin = this.gremlin;
    final labMode = this.labMode;
    final opencypher = this.opencypher;
    final role = this.role;
    final rollingBackTrxCount = this.rollingBackTrxCount;
    final rollingBackTrxEarliestStartTime =
        this.rollingBackTrxEarliestStartTime;
    final settings = this.settings;
    final sparql = this.sparql;
    final startTime = this.startTime;
    final status = this.status;
    return {
      if (dbEngineVersion != null) 'dbEngineVersion': dbEngineVersion,
      if (dfeQueryEngine != null) 'dfeQueryEngine': dfeQueryEngine,
      if (features != null) 'features': features,
      if (gremlin != null) 'gremlin': gremlin,
      if (labMode != null) 'labMode': labMode,
      if (opencypher != null) 'opencypher': opencypher,
      if (role != null) 'role': role,
      if (rollingBackTrxCount != null)
        'rollingBackTrxCount': rollingBackTrxCount,
      if (rollingBackTrxEarliestStartTime != null)
        'rollingBackTrxEarliestStartTime': rollingBackTrxEarliestStartTime,
      if (settings != null) 'settings': settings,
      if (sparql != null) 'sparql': sparql,
      if (startTime != null) 'startTime': startTime,
      if (status != null) 'status': status,
    };
  }
}

class GetGremlinQueryStatusOutput {
  /// The evaluation status of the Gremlin query.
  final QueryEvalStats? queryEvalStats;

  /// The ID of the query for which status is being returned.
  final String? queryId;

  /// The Gremlin query string.
  final String? queryString;

  GetGremlinQueryStatusOutput({
    this.queryEvalStats,
    this.queryId,
    this.queryString,
  });

  factory GetGremlinQueryStatusOutput.fromJson(Map<String, dynamic> json) {
    return GetGremlinQueryStatusOutput(
      queryEvalStats: json['queryEvalStats'] != null
          ? QueryEvalStats.fromJson(
              json['queryEvalStats'] as Map<String, dynamic>)
          : null,
      queryId: json['queryId'] as String?,
      queryString: json['queryString'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final queryEvalStats = this.queryEvalStats;
    final queryId = this.queryId;
    final queryString = this.queryString;
    return {
      if (queryEvalStats != null) 'queryEvalStats': queryEvalStats,
      if (queryId != null) 'queryId': queryId,
      if (queryString != null) 'queryString': queryString,
    };
  }
}

class GetLoaderJobStatusOutput {
  /// Status information about the load job, in a layout that could look like
  /// this:
  final Document payload;

  /// The HTTP response code for the request.
  final String status;

  GetLoaderJobStatusOutput({
    required this.payload,
    required this.status,
  });

  factory GetLoaderJobStatusOutput.fromJson(Map<String, dynamic> json) {
    return GetLoaderJobStatusOutput(
      payload: Document.fromJson(json['payload'] as Map<String, dynamic>),
      status: json['status'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final payload = this.payload;
    final status = this.status;
    return {
      'payload': payload,
      'status': status,
    };
  }
}

class GetMLDataProcessingJobOutput {
  /// The unique identifier of this data-processing job.
  final String? id;

  /// Definition of the data processing job.
  final MlResourceDefinition? processingJob;

  /// Status of the data processing job.
  final String? status;

  GetMLDataProcessingJobOutput({
    this.id,
    this.processingJob,
    this.status,
  });

  factory GetMLDataProcessingJobOutput.fromJson(Map<String, dynamic> json) {
    return GetMLDataProcessingJobOutput(
      id: json['id'] as String?,
      processingJob: json['processingJob'] != null
          ? MlResourceDefinition.fromJson(
              json['processingJob'] as Map<String, dynamic>)
          : null,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final processingJob = this.processingJob;
    final status = this.status;
    return {
      if (id != null) 'id': id,
      if (processingJob != null) 'processingJob': processingJob,
      if (status != null) 'status': status,
    };
  }
}

class GetMLEndpointOutput {
  /// The endpoint definition.
  final MlResourceDefinition? endpoint;

  /// The endpoint configuration
  final MlConfigDefinition? endpointConfig;

  /// The unique identifier of the inference endpoint.
  final String? id;

  /// The status of the inference endpoint.
  final String? status;

  GetMLEndpointOutput({
    this.endpoint,
    this.endpointConfig,
    this.id,
    this.status,
  });

  factory GetMLEndpointOutput.fromJson(Map<String, dynamic> json) {
    return GetMLEndpointOutput(
      endpoint: json['endpoint'] != null
          ? MlResourceDefinition.fromJson(
              json['endpoint'] as Map<String, dynamic>)
          : null,
      endpointConfig: json['endpointConfig'] != null
          ? MlConfigDefinition.fromJson(
              json['endpointConfig'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endpoint = this.endpoint;
    final endpointConfig = this.endpointConfig;
    final id = this.id;
    final status = this.status;
    return {
      if (endpoint != null) 'endpoint': endpoint,
      if (endpointConfig != null) 'endpointConfig': endpointConfig,
      if (id != null) 'id': id,
      if (status != null) 'status': status,
    };
  }
}

class GetMLModelTrainingJobOutput {
  /// The HPO job.
  final MlResourceDefinition? hpoJob;

  /// The unique identifier of this model-training job.
  final String? id;

  /// A list of the configurations of the ML models being used.
  final List<MlConfigDefinition>? mlModels;

  /// The model transform job.
  final MlResourceDefinition? modelTransformJob;

  /// The data processing job.
  final MlResourceDefinition? processingJob;

  /// The status of the model training job.
  final String? status;

  GetMLModelTrainingJobOutput({
    this.hpoJob,
    this.id,
    this.mlModels,
    this.modelTransformJob,
    this.processingJob,
    this.status,
  });

  factory GetMLModelTrainingJobOutput.fromJson(Map<String, dynamic> json) {
    return GetMLModelTrainingJobOutput(
      hpoJob: json['hpoJob'] != null
          ? MlResourceDefinition.fromJson(
              json['hpoJob'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      mlModels: (json['mlModels'] as List?)
          ?.whereNotNull()
          .map((e) => MlConfigDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
      modelTransformJob: json['modelTransformJob'] != null
          ? MlResourceDefinition.fromJson(
              json['modelTransformJob'] as Map<String, dynamic>)
          : null,
      processingJob: json['processingJob'] != null
          ? MlResourceDefinition.fromJson(
              json['processingJob'] as Map<String, dynamic>)
          : null,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final hpoJob = this.hpoJob;
    final id = this.id;
    final mlModels = this.mlModels;
    final modelTransformJob = this.modelTransformJob;
    final processingJob = this.processingJob;
    final status = this.status;
    return {
      if (hpoJob != null) 'hpoJob': hpoJob,
      if (id != null) 'id': id,
      if (mlModels != null) 'mlModels': mlModels,
      if (modelTransformJob != null) 'modelTransformJob': modelTransformJob,
      if (processingJob != null) 'processingJob': processingJob,
      if (status != null) 'status': status,
    };
  }
}

class GetMLModelTransformJobOutput {
  /// The base data processing job.
  final MlResourceDefinition? baseProcessingJob;

  /// The unique identifier of the model-transform job to be retrieved.
  final String? id;

  /// A list of the configuration information for the models being used.
  final List<MlConfigDefinition>? models;

  /// The remote model transform job.
  final MlResourceDefinition? remoteModelTransformJob;

  /// The status of the model-transform job.
  final String? status;

  GetMLModelTransformJobOutput({
    this.baseProcessingJob,
    this.id,
    this.models,
    this.remoteModelTransformJob,
    this.status,
  });

  factory GetMLModelTransformJobOutput.fromJson(Map<String, dynamic> json) {
    return GetMLModelTransformJobOutput(
      baseProcessingJob: json['baseProcessingJob'] != null
          ? MlResourceDefinition.fromJson(
              json['baseProcessingJob'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      models: (json['models'] as List?)
          ?.whereNotNull()
          .map((e) => MlConfigDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
      remoteModelTransformJob: json['remoteModelTransformJob'] != null
          ? MlResourceDefinition.fromJson(
              json['remoteModelTransformJob'] as Map<String, dynamic>)
          : null,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final baseProcessingJob = this.baseProcessingJob;
    final id = this.id;
    final models = this.models;
    final remoteModelTransformJob = this.remoteModelTransformJob;
    final status = this.status;
    return {
      if (baseProcessingJob != null) 'baseProcessingJob': baseProcessingJob,
      if (id != null) 'id': id,
      if (models != null) 'models': models,
      if (remoteModelTransformJob != null)
        'remoteModelTransformJob': remoteModelTransformJob,
      if (status != null) 'status': status,
    };
  }
}

class GetOpenCypherQueryStatusOutput {
  /// The openCypher query evaluation status.
  final QueryEvalStats? queryEvalStats;

  /// The unique ID of the query for which status is being returned.
  final String? queryId;

  /// The openCypher query string.
  final String? queryString;

  GetOpenCypherQueryStatusOutput({
    this.queryEvalStats,
    this.queryId,
    this.queryString,
  });

  factory GetOpenCypherQueryStatusOutput.fromJson(Map<String, dynamic> json) {
    return GetOpenCypherQueryStatusOutput(
      queryEvalStats: json['queryEvalStats'] != null
          ? QueryEvalStats.fromJson(
              json['queryEvalStats'] as Map<String, dynamic>)
          : null,
      queryId: json['queryId'] as String?,
      queryString: json['queryString'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final queryEvalStats = this.queryEvalStats;
    final queryId = this.queryId;
    final queryString = this.queryString;
    return {
      if (queryEvalStats != null) 'queryEvalStats': queryEvalStats,
      if (queryId != null) 'queryId': queryId,
      if (queryString != null) 'queryString': queryString,
    };
  }
}

class GetPropertygraphStatisticsOutput {
  /// Statistics for property-graph data.
  final Statistics payload;

  /// The HTTP return code of the request. If the request succeeded, the code is
  /// 200. See <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/neptune-dfe-statistics.html#neptune-dfe-statistics-errors">Common
  /// error codes for DFE statistics request</a> for a list of common errors.
  final String status;

  GetPropertygraphStatisticsOutput({
    required this.payload,
    required this.status,
  });

  factory GetPropertygraphStatisticsOutput.fromJson(Map<String, dynamic> json) {
    return GetPropertygraphStatisticsOutput(
      payload: Statistics.fromJson(json['payload'] as Map<String, dynamic>),
      status: json['status'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final payload = this.payload;
    final status = this.status;
    return {
      'payload': payload,
      'status': status,
    };
  }
}

class GetPropertygraphStreamOutput {
  /// Serialization format for the change records being returned. Currently, the
  /// only supported value is <code>PG_JSON</code>.
  final String format;

  /// Sequence identifier of the last change in the stream response.
  ///
  /// An event ID is composed of two fields: a <code>commitNum</code>, which
  /// identifies a transaction that changed the graph, and an <code>opNum</code>,
  /// which identifies a specific operation within that transaction:
  final Map<String, String> lastEventId;

  /// The time at which the commit for the transaction was requested, in
  /// milliseconds from the Unix epoch.
  final int lastTrxTimestampInMillis;

  /// An array of serialized change-log stream records included in the response.
  final List<PropertygraphRecord> records;

  /// The total number of records in the response.
  final int totalRecords;

  GetPropertygraphStreamOutput({
    required this.format,
    required this.lastEventId,
    required this.lastTrxTimestampInMillis,
    required this.records,
    required this.totalRecords,
  });

  factory GetPropertygraphStreamOutput.fromJson(Map<String, dynamic> json) {
    return GetPropertygraphStreamOutput(
      format: json['format'] as String,
      lastEventId: (json['lastEventId'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
      lastTrxTimestampInMillis: json['lastTrxTimestamp'] as int,
      records: (json['records'] as List)
          .whereNotNull()
          .map((e) => PropertygraphRecord.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalRecords: json['totalRecords'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final format = this.format;
    final lastEventId = this.lastEventId;
    final lastTrxTimestampInMillis = this.lastTrxTimestampInMillis;
    final records = this.records;
    final totalRecords = this.totalRecords;
    return {
      'format': format,
      'lastEventId': lastEventId,
      'lastTrxTimestamp': lastTrxTimestampInMillis,
      'records': records,
      'totalRecords': totalRecords,
    };
  }
}

class GetPropertygraphSummaryOutput {
  /// Payload containing the property graph summary response.
  final PropertygraphSummaryValueMap? payload;

  /// The HTTP return code of the request. If the request succeeded, the code is
  /// 200.
  final int? statusCode;

  GetPropertygraphSummaryOutput({
    this.payload,
    this.statusCode,
  });

  factory GetPropertygraphSummaryOutput.fromJson(Map<String, dynamic> json) {
    return GetPropertygraphSummaryOutput(
      payload: json['payload'] != null
          ? PropertygraphSummaryValueMap.fromJson(
              json['payload'] as Map<String, dynamic>)
          : null,
      statusCode: json['statusCode'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final payload = this.payload;
    final statusCode = this.statusCode;
    return {
      if (payload != null) 'payload': payload,
    };
  }
}

class GetRDFGraphSummaryOutput {
  /// Payload for an RDF graph summary response
  final RDFGraphSummaryValueMap? payload;

  /// The HTTP return code of the request. If the request succeeded, the code is
  /// 200.
  final int? statusCode;

  GetRDFGraphSummaryOutput({
    this.payload,
    this.statusCode,
  });

  factory GetRDFGraphSummaryOutput.fromJson(Map<String, dynamic> json) {
    return GetRDFGraphSummaryOutput(
      payload: json['payload'] != null
          ? RDFGraphSummaryValueMap.fromJson(
              json['payload'] as Map<String, dynamic>)
          : null,
      statusCode: json['statusCode'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final payload = this.payload;
    final statusCode = this.statusCode;
    return {
      if (payload != null) 'payload': payload,
    };
  }
}

class GetSparqlStatisticsOutput {
  /// Statistics for RDF data.
  final Statistics payload;

  /// The HTTP return code of the request. If the request succeeded, the code is
  /// 200. See <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/neptune-dfe-statistics.html#neptune-dfe-statistics-errors">Common
  /// error codes for DFE statistics request</a> for a list of common errors.
  ///
  /// When invoking this operation in a Neptune cluster that has IAM
  /// authentication enabled, the IAM user or role making the request must have a
  /// policy attached that allows the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/iam-dp-actions.html#getstatisticsstatus">neptune-db:GetStatisticsStatus</a>
  /// IAM action in that cluster.
  final String status;

  GetSparqlStatisticsOutput({
    required this.payload,
    required this.status,
  });

  factory GetSparqlStatisticsOutput.fromJson(Map<String, dynamic> json) {
    return GetSparqlStatisticsOutput(
      payload: Statistics.fromJson(json['payload'] as Map<String, dynamic>),
      status: json['status'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final payload = this.payload;
    final status = this.status;
    return {
      'payload': payload,
      'status': status,
    };
  }
}

class GetSparqlStreamOutput {
  /// Serialization format for the change records being returned. Currently, the
  /// only supported value is <code>NQUADS</code>.
  final String format;

  /// Sequence identifier of the last change in the stream response.
  ///
  /// An event ID is composed of two fields: a <code>commitNum</code>, which
  /// identifies a transaction that changed the graph, and an <code>opNum</code>,
  /// which identifies a specific operation within that transaction:
  final Map<String, String> lastEventId;

  /// The time at which the commit for the transaction was requested, in
  /// milliseconds from the Unix epoch.
  final int lastTrxTimestampInMillis;

  /// An array of serialized change-log stream records included in the response.
  final List<SparqlRecord> records;

  /// The total number of records in the response.
  final int totalRecords;

  GetSparqlStreamOutput({
    required this.format,
    required this.lastEventId,
    required this.lastTrxTimestampInMillis,
    required this.records,
    required this.totalRecords,
  });

  factory GetSparqlStreamOutput.fromJson(Map<String, dynamic> json) {
    return GetSparqlStreamOutput(
      format: json['format'] as String,
      lastEventId: (json['lastEventId'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
      lastTrxTimestampInMillis: json['lastTrxTimestamp'] as int,
      records: (json['records'] as List)
          .whereNotNull()
          .map((e) => SparqlRecord.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalRecords: json['totalRecords'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final format = this.format;
    final lastEventId = this.lastEventId;
    final lastTrxTimestampInMillis = this.lastTrxTimestampInMillis;
    final records = this.records;
    final totalRecords = this.totalRecords;
    return {
      'format': format,
      'lastEventId': lastEventId,
      'lastTrxTimestamp': lastTrxTimestampInMillis,
      'records': records,
      'totalRecords': totalRecords,
    };
  }
}

enum GraphSummaryType {
  basic,
  detailed,
}

extension GraphSummaryTypeValueExtension on GraphSummaryType {
  String toValue() {
    switch (this) {
      case GraphSummaryType.basic:
        return 'basic';
      case GraphSummaryType.detailed:
        return 'detailed';
    }
  }
}

extension GraphSummaryTypeFromString on String {
  GraphSummaryType toGraphSummaryType() {
    switch (this) {
      case 'basic':
        return GraphSummaryType.basic;
      case 'detailed':
        return GraphSummaryType.detailed;
    }
    throw Exception('$this is not known in enum GraphSummaryType');
  }
}

/// Captures the status of a Gremlin query (see the <a
/// href="https://docs.aws.amazon.com/neptune/latest/userguide/gremlin-api-status.html">Gremlin
/// query status API</a> page).
class GremlinQueryStatus {
  /// The query statistics of the Gremlin query.
  final QueryEvalStats? queryEvalStats;

  /// The ID of the Gremlin query.
  final String? queryId;

  /// The query string of the Gremlin query.
  final String? queryString;

  GremlinQueryStatus({
    this.queryEvalStats,
    this.queryId,
    this.queryString,
  });

  factory GremlinQueryStatus.fromJson(Map<String, dynamic> json) {
    return GremlinQueryStatus(
      queryEvalStats: json['queryEvalStats'] != null
          ? QueryEvalStats.fromJson(
              json['queryEvalStats'] as Map<String, dynamic>)
          : null,
      queryId: json['queryId'] as String?,
      queryString: json['queryString'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final queryEvalStats = this.queryEvalStats;
    final queryId = this.queryId;
    final queryString = this.queryString;
    return {
      if (queryEvalStats != null) 'queryEvalStats': queryEvalStats,
      if (queryId != null) 'queryId': queryId,
      if (queryString != null) 'queryString': queryString,
    };
  }
}

/// Contains status components of a Gremlin query.
class GremlinQueryStatusAttributes {
  /// Attributes of the Gremlin query status.
  final Document? attributes;

  /// The HTTP response code returned fro the Gremlin query request..
  final int? code;

  /// The status message.
  final String? message;

  GremlinQueryStatusAttributes({
    this.attributes,
    this.code,
    this.message,
  });

  factory GremlinQueryStatusAttributes.fromJson(Map<String, dynamic> json) {
    return GremlinQueryStatusAttributes(
      attributes: json['attributes'] != null
          ? Document.fromJson(json['attributes'] as Map<String, dynamic>)
          : null,
      code: json['code'] as int?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final code = this.code;
    final message = this.message;
    return {
      if (attributes != null) 'attributes': attributes,
      if (code != null) 'code': code,
      if (message != null) 'message': message,
    };
  }
}

enum IteratorType {
  atSequenceNumber,
  afterSequenceNumber,
  trimHorizon,
  latest,
}

extension IteratorTypeValueExtension on IteratorType {
  String toValue() {
    switch (this) {
      case IteratorType.atSequenceNumber:
        return 'AT_SEQUENCE_NUMBER';
      case IteratorType.afterSequenceNumber:
        return 'AFTER_SEQUENCE_NUMBER';
      case IteratorType.trimHorizon:
        return 'TRIM_HORIZON';
      case IteratorType.latest:
        return 'LATEST';
    }
  }
}

extension IteratorTypeFromString on String {
  IteratorType toIteratorType() {
    switch (this) {
      case 'AT_SEQUENCE_NUMBER':
        return IteratorType.atSequenceNumber;
      case 'AFTER_SEQUENCE_NUMBER':
        return IteratorType.afterSequenceNumber;
      case 'TRIM_HORIZON':
        return IteratorType.trimHorizon;
      case 'LATEST':
        return IteratorType.latest;
    }
    throw Exception('$this is not known in enum IteratorType');
  }
}

class ListGremlinQueriesOutput {
  /// The number of queries that have been accepted but not yet completed,
  /// including queries in the queue.
  final int? acceptedQueryCount;

  /// A list of the current queries.
  final List<GremlinQueryStatus>? queries;

  /// The number of Gremlin queries currently running.
  final int? runningQueryCount;

  ListGremlinQueriesOutput({
    this.acceptedQueryCount,
    this.queries,
    this.runningQueryCount,
  });

  factory ListGremlinQueriesOutput.fromJson(Map<String, dynamic> json) {
    return ListGremlinQueriesOutput(
      acceptedQueryCount: json['acceptedQueryCount'] as int?,
      queries: (json['queries'] as List?)
          ?.whereNotNull()
          .map((e) => GremlinQueryStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
      runningQueryCount: json['runningQueryCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final acceptedQueryCount = this.acceptedQueryCount;
    final queries = this.queries;
    final runningQueryCount = this.runningQueryCount;
    return {
      if (acceptedQueryCount != null) 'acceptedQueryCount': acceptedQueryCount,
      if (queries != null) 'queries': queries,
      if (runningQueryCount != null) 'runningQueryCount': runningQueryCount,
    };
  }
}

class ListLoaderJobsOutput {
  /// The requested list of job IDs.
  final LoaderIdResult payload;

  /// Returns the status of the job list request.
  final String status;

  ListLoaderJobsOutput({
    required this.payload,
    required this.status,
  });

  factory ListLoaderJobsOutput.fromJson(Map<String, dynamic> json) {
    return ListLoaderJobsOutput(
      payload: LoaderIdResult.fromJson(json['payload'] as Map<String, dynamic>),
      status: json['status'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final payload = this.payload;
    final status = this.status;
    return {
      'payload': payload,
      'status': status,
    };
  }
}

class ListMLDataProcessingJobsOutput {
  /// A page listing data processing job IDs.
  final List<String>? ids;

  ListMLDataProcessingJobsOutput({
    this.ids,
  });

  factory ListMLDataProcessingJobsOutput.fromJson(Map<String, dynamic> json) {
    return ListMLDataProcessingJobsOutput(
      ids: (json['ids'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final ids = this.ids;
    return {
      if (ids != null) 'ids': ids,
    };
  }
}

class ListMLEndpointsOutput {
  /// A page from the list of inference endpoint IDs.
  final List<String>? ids;

  ListMLEndpointsOutput({
    this.ids,
  });

  factory ListMLEndpointsOutput.fromJson(Map<String, dynamic> json) {
    return ListMLEndpointsOutput(
      ids: (json['ids'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final ids = this.ids;
    return {
      if (ids != null) 'ids': ids,
    };
  }
}

class ListMLModelTrainingJobsOutput {
  /// A page of the list of model training job IDs.
  final List<String>? ids;

  ListMLModelTrainingJobsOutput({
    this.ids,
  });

  factory ListMLModelTrainingJobsOutput.fromJson(Map<String, dynamic> json) {
    return ListMLModelTrainingJobsOutput(
      ids: (json['ids'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final ids = this.ids;
    return {
      if (ids != null) 'ids': ids,
    };
  }
}

class ListMLModelTransformJobsOutput {
  /// A page from the list of model transform IDs.
  final List<String>? ids;

  ListMLModelTransformJobsOutput({
    this.ids,
  });

  factory ListMLModelTransformJobsOutput.fromJson(Map<String, dynamic> json) {
    return ListMLModelTransformJobsOutput(
      ids: (json['ids'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final ids = this.ids;
    return {
      if (ids != null) 'ids': ids,
    };
  }
}

class ListOpenCypherQueriesOutput {
  /// The number of queries that have been accepted but not yet completed,
  /// including queries in the queue.
  final int? acceptedQueryCount;

  /// A list of current openCypher queries.
  final List<GremlinQueryStatus>? queries;

  /// The number of currently running openCypher queries.
  final int? runningQueryCount;

  ListOpenCypherQueriesOutput({
    this.acceptedQueryCount,
    this.queries,
    this.runningQueryCount,
  });

  factory ListOpenCypherQueriesOutput.fromJson(Map<String, dynamic> json) {
    return ListOpenCypherQueriesOutput(
      acceptedQueryCount: json['acceptedQueryCount'] as int?,
      queries: (json['queries'] as List?)
          ?.whereNotNull()
          .map((e) => GremlinQueryStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
      runningQueryCount: json['runningQueryCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final acceptedQueryCount = this.acceptedQueryCount;
    final queries = this.queries;
    final runningQueryCount = this.runningQueryCount;
    return {
      if (acceptedQueryCount != null) 'acceptedQueryCount': acceptedQueryCount,
      if (queries != null) 'queries': queries,
      if (runningQueryCount != null) 'runningQueryCount': runningQueryCount,
    };
  }
}

/// Contains a list of load IDs.
class LoaderIdResult {
  /// A list of load IDs.
  final List<String>? loadIds;

  LoaderIdResult({
    this.loadIds,
  });

  factory LoaderIdResult.fromJson(Map<String, dynamic> json) {
    return LoaderIdResult(
      loadIds: (json['loadIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final loadIds = this.loadIds;
    return {
      if (loadIds != null) 'loadIds': loadIds,
    };
  }
}

class ManagePropertygraphStatisticsOutput {
  /// The HTTP return code of the request. If the request succeeded, the code is
  /// 200.
  final String status;

  /// This is only returned for refresh mode.
  final RefreshStatisticsIdMap? payload;

  ManagePropertygraphStatisticsOutput({
    required this.status,
    this.payload,
  });

  factory ManagePropertygraphStatisticsOutput.fromJson(
      Map<String, dynamic> json) {
    return ManagePropertygraphStatisticsOutput(
      status: json['status'] as String,
      payload: json['payload'] != null
          ? RefreshStatisticsIdMap.fromJson(
              json['payload'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final payload = this.payload;
    return {
      'status': status,
      if (payload != null) 'payload': payload,
    };
  }
}

class ManageSparqlStatisticsOutput {
  /// The HTTP return code of the request. If the request succeeded, the code is
  /// 200.
  final String status;

  /// This is only returned for refresh mode.
  final RefreshStatisticsIdMap? payload;

  ManageSparqlStatisticsOutput({
    required this.status,
    this.payload,
  });

  factory ManageSparqlStatisticsOutput.fromJson(Map<String, dynamic> json) {
    return ManageSparqlStatisticsOutput(
      status: json['status'] as String,
      payload: json['payload'] != null
          ? RefreshStatisticsIdMap.fromJson(
              json['payload'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final payload = this.payload;
    return {
      'status': status,
      if (payload != null) 'payload': payload,
    };
  }
}

/// Contains a Neptune ML configuration.
class MlConfigDefinition {
  /// The ARN for the configuration.
  final String? arn;

  /// The configuration name.
  final String? name;

  MlConfigDefinition({
    this.arn,
    this.name,
  });

  factory MlConfigDefinition.fromJson(Map<String, dynamic> json) {
    return MlConfigDefinition(
      arn: json['arn'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    return {
      if (arn != null) 'arn': arn,
      if (name != null) 'name': name,
    };
  }
}

/// Defines a Neptune ML resource.
class MlResourceDefinition {
  /// The resource ARN.
  final String? arn;

  /// The CloudWatch log URL for the resource.
  final String? cloudwatchLogUrl;

  /// The failure reason, in case of a failure.
  final String? failureReason;

  /// The resource name.
  final String? name;

  /// The output location.
  final String? outputLocation;

  /// The resource status.
  final String? status;

  MlResourceDefinition({
    this.arn,
    this.cloudwatchLogUrl,
    this.failureReason,
    this.name,
    this.outputLocation,
    this.status,
  });

  factory MlResourceDefinition.fromJson(Map<String, dynamic> json) {
    return MlResourceDefinition(
      arn: json['arn'] as String?,
      cloudwatchLogUrl: json['cloudwatchLogUrl'] as String?,
      failureReason: json['failureReason'] as String?,
      name: json['name'] as String?,
      outputLocation: json['outputLocation'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final cloudwatchLogUrl = this.cloudwatchLogUrl;
    final failureReason = this.failureReason;
    final name = this.name;
    final outputLocation = this.outputLocation;
    final status = this.status;
    return {
      if (arn != null) 'arn': arn,
      if (cloudwatchLogUrl != null) 'cloudwatchLogUrl': cloudwatchLogUrl,
      if (failureReason != null) 'failureReason': failureReason,
      if (name != null) 'name': name,
      if (outputLocation != null) 'outputLocation': outputLocation,
      if (status != null) 'status': status,
    };
  }
}

enum Mode {
  resume,
  $new,
  auto,
}

extension ModeValueExtension on Mode {
  String toValue() {
    switch (this) {
      case Mode.resume:
        return 'RESUME';
      case Mode.$new:
        return 'NEW';
      case Mode.auto:
        return 'AUTO';
    }
  }
}

extension ModeFromString on String {
  Mode toMode() {
    switch (this) {
      case 'RESUME':
        return Mode.resume;
      case 'NEW':
        return Mode.$new;
      case 'AUTO':
        return Mode.auto;
    }
    throw Exception('$this is not known in enum Mode');
  }
}

/// A node structure.
class NodeStructure {
  /// Number of nodes that have this specific structure.
  final int? count;

  /// A list of distinct outgoing edge labels present in this specific structure.
  final List<String>? distinctOutgoingEdgeLabels;

  /// A list of the node properties present in this specific structure.
  final List<String>? nodeProperties;

  NodeStructure({
    this.count,
    this.distinctOutgoingEdgeLabels,
    this.nodeProperties,
  });

  factory NodeStructure.fromJson(Map<String, dynamic> json) {
    return NodeStructure(
      count: json['count'] as int?,
      distinctOutgoingEdgeLabels: (json['distinctOutgoingEdgeLabels'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nodeProperties: (json['nodeProperties'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final count = this.count;
    final distinctOutgoingEdgeLabels = this.distinctOutgoingEdgeLabels;
    final nodeProperties = this.nodeProperties;
    return {
      if (count != null) 'count': count,
      if (distinctOutgoingEdgeLabels != null)
        'distinctOutgoingEdgeLabels': distinctOutgoingEdgeLabels,
      if (nodeProperties != null) 'nodeProperties': nodeProperties,
    };
  }
}

enum OpenCypherExplainMode {
  static,
  $dynamic,
  details,
}

extension OpenCypherExplainModeValueExtension on OpenCypherExplainMode {
  String toValue() {
    switch (this) {
      case OpenCypherExplainMode.static:
        return 'static';
      case OpenCypherExplainMode.$dynamic:
        return 'dynamic';
      case OpenCypherExplainMode.details:
        return 'details';
    }
  }
}

extension OpenCypherExplainModeFromString on String {
  OpenCypherExplainMode toOpenCypherExplainMode() {
    switch (this) {
      case 'static':
        return OpenCypherExplainMode.static;
      case 'dynamic':
        return OpenCypherExplainMode.$dynamic;
      case 'details':
        return OpenCypherExplainMode.details;
    }
    throw Exception('$this is not known in enum OpenCypherExplainMode');
  }
}

enum Parallelism {
  low,
  medium,
  high,
  oversubscribe,
}

extension ParallelismValueExtension on Parallelism {
  String toValue() {
    switch (this) {
      case Parallelism.low:
        return 'LOW';
      case Parallelism.medium:
        return 'MEDIUM';
      case Parallelism.high:
        return 'HIGH';
      case Parallelism.oversubscribe:
        return 'OVERSUBSCRIBE';
    }
  }
}

extension ParallelismFromString on String {
  Parallelism toParallelism() {
    switch (this) {
      case 'LOW':
        return Parallelism.low;
      case 'MEDIUM':
        return Parallelism.medium;
      case 'HIGH':
        return Parallelism.high;
      case 'OVERSUBSCRIBE':
        return Parallelism.oversubscribe;
    }
    throw Exception('$this is not known in enum Parallelism');
  }
}

/// A Gremlin or openCypher change record.
class PropertygraphData {
  /// The ID of the Gremlin or openCypher element.
  final String id;

  /// The property name. For element labels, this is <code>label</code>.
  final String key;

  /// The type of this Gremlin or openCypher element. Must be one of:
  ///
  /// <ul>
  /// <li>
  /// <b> <code>v1</code> </b>   -   Vertex label for Gremlin, or node label for
  /// openCypher.
  /// </li>
  /// <li>
  /// <b> <code>vp</code> </b>   -   Vertex properties for Gremlin, or node
  /// properties for openCypher.
  /// </li>
  /// <li>
  /// <b> <code>e</code> </b>   -   Edge and edge label for Gremlin, or
  /// relationship and relationship type for openCypher.
  /// </li>
  /// <li>
  /// <b> <code>ep</code> </b>   -   Edge properties for Gremlin, or relationship
  /// properties for openCypher.
  /// </li>
  /// </ul>
  final String type;

  /// This is a JSON object that contains a value field for the value itself, and
  /// a datatype field for the JSON data type of that value:
  final Document value;

  /// If this is an edge (type = <code>e</code>), the ID of the corresponding
  /// <code>from</code> vertex or source node.
  final String? from;

  /// If this is an edge (type = <code>e</code>), the ID of the corresponding
  /// <code>to</code> vertex or target node.
  final String? to;

  PropertygraphData({
    required this.id,
    required this.key,
    required this.type,
    required this.value,
    this.from,
    this.to,
  });

  factory PropertygraphData.fromJson(Map<String, dynamic> json) {
    return PropertygraphData(
      id: json['id'] as String,
      key: json['key'] as String,
      type: json['type'] as String,
      value: Document.fromJson(json['value'] as Map<String, dynamic>),
      from: json['from'] as String?,
      to: json['to'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final key = this.key;
    final type = this.type;
    final value = this.value;
    final from = this.from;
    final to = this.to;
    return {
      'id': id,
      'key': key,
      'type': type,
      'value': value,
      if (from != null) 'from': from,
      if (to != null) 'to': to,
    };
  }
}

/// Structure of a property graph record.
class PropertygraphRecord {
  /// The time at which the commit for the transaction was requested, in
  /// milliseconds from the Unix epoch.
  final int commitTimestampInMillis;

  /// The serialized Gremlin or openCypher change record.
  final PropertygraphData data;

  /// The sequence identifier of the stream change record.
  final Map<String, String> eventId;

  /// The operation that created the change.
  final String op;

  /// Only present if this operation is the last one in its transaction. If
  /// present, it is set to true. It is useful for ensuring that an entire
  /// transaction is consumed.
  final bool? isLastOp;

  PropertygraphRecord({
    required this.commitTimestampInMillis,
    required this.data,
    required this.eventId,
    required this.op,
    this.isLastOp,
  });

  factory PropertygraphRecord.fromJson(Map<String, dynamic> json) {
    return PropertygraphRecord(
      commitTimestampInMillis: json['commitTimestamp'] as int,
      data: PropertygraphData.fromJson(json['data'] as Map<String, dynamic>),
      eventId: (json['eventId'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
      op: json['op'] as String,
      isLastOp: json['isLastOp'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final commitTimestampInMillis = this.commitTimestampInMillis;
    final data = this.data;
    final eventId = this.eventId;
    final op = this.op;
    final isLastOp = this.isLastOp;
    return {
      'commitTimestamp': commitTimestampInMillis,
      'data': data,
      'eventId': eventId,
      'op': op,
      if (isLastOp != null) 'isLastOp': isLastOp,
    };
  }
}

/// The graph summary API returns a read-only list of node and edge labels and
/// property keys, along with counts of nodes, edges, and properties. See <a
/// href="https://docs.aws.amazon.com/neptune/latest/userguide/neptune-graph-summary.html#neptune-graph-summary-pg-response">Graph
/// summary response for a property graph (PG)</a>.
class PropertygraphSummary {
  /// A list of the distinct edge labels in the graph.
  final List<String>? edgeLabels;

  /// A list of the distinct edge properties in the graph, along with the count of
  /// edges where each property is used.
  final List<Map<String, int>>? edgeProperties;

  /// This field is only present when the requested mode is <code>DETAILED</code>.
  /// It contains a list of edge structures.
  final List<EdgeStructure>? edgeStructures;

  /// A list of the distinct node labels in the graph.
  final List<String>? nodeLabels;

  /// The number of distinct node properties in the graph.
  final List<Map<String, int>>? nodeProperties;

  /// This field is only present when the requested mode is <code>DETAILED</code>.
  /// It contains a list of node structures.
  final List<NodeStructure>? nodeStructures;

  /// The number of distinct edge labels in the graph.
  final int? numEdgeLabels;

  /// The number of distinct edge properties in the graph.
  final int? numEdgeProperties;

  /// The number of edges in the graph.
  final int? numEdges;

  /// The number of distinct node labels in the graph.
  final int? numNodeLabels;

  /// A list of the distinct node properties in the graph, along with the count of
  /// nodes where each property is used.
  final int? numNodeProperties;

  /// The number of nodes in the graph.
  final int? numNodes;

  /// The total number of usages of all edge properties.
  final int? totalEdgePropertyValues;

  /// The total number of usages of all node properties.
  final int? totalNodePropertyValues;

  PropertygraphSummary({
    this.edgeLabels,
    this.edgeProperties,
    this.edgeStructures,
    this.nodeLabels,
    this.nodeProperties,
    this.nodeStructures,
    this.numEdgeLabels,
    this.numEdgeProperties,
    this.numEdges,
    this.numNodeLabels,
    this.numNodeProperties,
    this.numNodes,
    this.totalEdgePropertyValues,
    this.totalNodePropertyValues,
  });

  factory PropertygraphSummary.fromJson(Map<String, dynamic> json) {
    return PropertygraphSummary(
      edgeLabels: (json['edgeLabels'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      edgeProperties: (json['edgeProperties'] as List?)
          ?.whereNotNull()
          .map((e) =>
              (e as Map<String, dynamic>).map((k, e) => MapEntry(k, e as int)))
          .toList(),
      edgeStructures: (json['edgeStructures'] as List?)
          ?.whereNotNull()
          .map((e) => EdgeStructure.fromJson(e as Map<String, dynamic>))
          .toList(),
      nodeLabels: (json['nodeLabels'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nodeProperties: (json['nodeProperties'] as List?)
          ?.whereNotNull()
          .map((e) =>
              (e as Map<String, dynamic>).map((k, e) => MapEntry(k, e as int)))
          .toList(),
      nodeStructures: (json['nodeStructures'] as List?)
          ?.whereNotNull()
          .map((e) => NodeStructure.fromJson(e as Map<String, dynamic>))
          .toList(),
      numEdgeLabels: json['numEdgeLabels'] as int?,
      numEdgeProperties: json['numEdgeProperties'] as int?,
      numEdges: json['numEdges'] as int?,
      numNodeLabels: json['numNodeLabels'] as int?,
      numNodeProperties: json['numNodeProperties'] as int?,
      numNodes: json['numNodes'] as int?,
      totalEdgePropertyValues: json['totalEdgePropertyValues'] as int?,
      totalNodePropertyValues: json['totalNodePropertyValues'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final edgeLabels = this.edgeLabels;
    final edgeProperties = this.edgeProperties;
    final edgeStructures = this.edgeStructures;
    final nodeLabels = this.nodeLabels;
    final nodeProperties = this.nodeProperties;
    final nodeStructures = this.nodeStructures;
    final numEdgeLabels = this.numEdgeLabels;
    final numEdgeProperties = this.numEdgeProperties;
    final numEdges = this.numEdges;
    final numNodeLabels = this.numNodeLabels;
    final numNodeProperties = this.numNodeProperties;
    final numNodes = this.numNodes;
    final totalEdgePropertyValues = this.totalEdgePropertyValues;
    final totalNodePropertyValues = this.totalNodePropertyValues;
    return {
      if (edgeLabels != null) 'edgeLabels': edgeLabels,
      if (edgeProperties != null) 'edgeProperties': edgeProperties,
      if (edgeStructures != null) 'edgeStructures': edgeStructures,
      if (nodeLabels != null) 'nodeLabels': nodeLabels,
      if (nodeProperties != null) 'nodeProperties': nodeProperties,
      if (nodeStructures != null) 'nodeStructures': nodeStructures,
      if (numEdgeLabels != null) 'numEdgeLabels': numEdgeLabels,
      if (numEdgeProperties != null) 'numEdgeProperties': numEdgeProperties,
      if (numEdges != null) 'numEdges': numEdges,
      if (numNodeLabels != null) 'numNodeLabels': numNodeLabels,
      if (numNodeProperties != null) 'numNodeProperties': numNodeProperties,
      if (numNodes != null) 'numNodes': numNodes,
      if (totalEdgePropertyValues != null)
        'totalEdgePropertyValues': totalEdgePropertyValues,
      if (totalNodePropertyValues != null)
        'totalNodePropertyValues': totalNodePropertyValues,
    };
  }
}

/// Payload for the property graph summary response.
class PropertygraphSummaryValueMap {
  /// The graph summary.
  final PropertygraphSummary? graphSummary;

  /// The timestamp, in ISO 8601 format, of the time at which Neptune last
  /// computed statistics.
  final DateTime? lastStatisticsComputationTime;

  /// The version of this graph summary response.
  final String? version;

  PropertygraphSummaryValueMap({
    this.graphSummary,
    this.lastStatisticsComputationTime,
    this.version,
  });

  factory PropertygraphSummaryValueMap.fromJson(Map<String, dynamic> json) {
    return PropertygraphSummaryValueMap(
      graphSummary: json['graphSummary'] != null
          ? PropertygraphSummary.fromJson(
              json['graphSummary'] as Map<String, dynamic>)
          : null,
      lastStatisticsComputationTime:
          timeStampFromJson(json['lastStatisticsComputationTime']),
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final graphSummary = this.graphSummary;
    final lastStatisticsComputationTime = this.lastStatisticsComputationTime;
    final version = this.version;
    return {
      if (graphSummary != null) 'graphSummary': graphSummary,
      if (lastStatisticsComputationTime != null)
        'lastStatisticsComputationTime':
            iso8601ToJson(lastStatisticsComputationTime),
      if (version != null) 'version': version,
    };
  }
}

/// Structure to capture query statistics such as how many queries are running,
/// accepted or waiting and their details.
class QueryEvalStats {
  /// Set to <code>TRUE</code> if the query was cancelled, or FALSE otherwise.
  final bool? cancelled;

  /// The number of milliseconds the query has been running so far.
  final int? elapsed;

  /// The number of subqueries in this query.
  final Document? subqueries;

  /// Indicates how long the query waited, in milliseconds.
  final int? waited;

  QueryEvalStats({
    this.cancelled,
    this.elapsed,
    this.subqueries,
    this.waited,
  });

  factory QueryEvalStats.fromJson(Map<String, dynamic> json) {
    return QueryEvalStats(
      cancelled: json['cancelled'] as bool?,
      elapsed: json['elapsed'] as int?,
      subqueries: json['subqueries'] != null
          ? Document.fromJson(json['subqueries'] as Map<String, dynamic>)
          : null,
      waited: json['waited'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final cancelled = this.cancelled;
    final elapsed = this.elapsed;
    final subqueries = this.subqueries;
    final waited = this.waited;
    return {
      if (cancelled != null) 'cancelled': cancelled,
      if (elapsed != null) 'elapsed': elapsed,
      if (subqueries != null) 'subqueries': subqueries,
      if (waited != null) 'waited': waited,
    };
  }
}

/// Structure for expressing the query language version.
class QueryLanguageVersion {
  /// The version of the query language.
  final String version;

  QueryLanguageVersion({
    required this.version,
  });

  factory QueryLanguageVersion.fromJson(Map<String, dynamic> json) {
    return QueryLanguageVersion(
      version: json['version'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final version = this.version;
    return {
      'version': version,
    };
  }
}

/// The RDF graph summary API returns a read-only list of classes and predicate
/// keys, along with counts of quads, subjects, and predicates.
class RDFGraphSummary {
  /// A list of the classes in the graph.
  final List<String>? classes;

  /// The number of classes in the graph.
  final int? numClasses;

  /// The number of distinct predicates in the graph.
  final int? numDistinctPredicates;

  /// The number of distinct subjects in the graph.
  final int? numDistinctSubjects;

  /// The number of quads in the graph.
  final int? numQuads;

  /// "A list of predicates in the graph, along with the predicate counts.
  final List<Map<String, int>>? predicates;

  /// This field is only present when the request mode is <code>DETAILED</code>.
  /// It contains a list of subject structures.
  final List<SubjectStructure>? subjectStructures;

  RDFGraphSummary({
    this.classes,
    this.numClasses,
    this.numDistinctPredicates,
    this.numDistinctSubjects,
    this.numQuads,
    this.predicates,
    this.subjectStructures,
  });

  factory RDFGraphSummary.fromJson(Map<String, dynamic> json) {
    return RDFGraphSummary(
      classes: (json['classes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      numClasses: json['numClasses'] as int?,
      numDistinctPredicates: json['numDistinctPredicates'] as int?,
      numDistinctSubjects: json['numDistinctSubjects'] as int?,
      numQuads: json['numQuads'] as int?,
      predicates: (json['predicates'] as List?)
          ?.whereNotNull()
          .map((e) =>
              (e as Map<String, dynamic>).map((k, e) => MapEntry(k, e as int)))
          .toList(),
      subjectStructures: (json['subjectStructures'] as List?)
          ?.whereNotNull()
          .map((e) => SubjectStructure.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final classes = this.classes;
    final numClasses = this.numClasses;
    final numDistinctPredicates = this.numDistinctPredicates;
    final numDistinctSubjects = this.numDistinctSubjects;
    final numQuads = this.numQuads;
    final predicates = this.predicates;
    final subjectStructures = this.subjectStructures;
    return {
      if (classes != null) 'classes': classes,
      if (numClasses != null) 'numClasses': numClasses,
      if (numDistinctPredicates != null)
        'numDistinctPredicates': numDistinctPredicates,
      if (numDistinctSubjects != null)
        'numDistinctSubjects': numDistinctSubjects,
      if (numQuads != null) 'numQuads': numQuads,
      if (predicates != null) 'predicates': predicates,
      if (subjectStructures != null) 'subjectStructures': subjectStructures,
    };
  }
}

/// Payload for an RDF graph summary response.
class RDFGraphSummaryValueMap {
  /// The graph summary of an RDF graph. See <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/neptune-graph-summary.html#neptune-graph-summary-rdf-response">Graph
  /// summary response for an RDF graph</a>.
  final RDFGraphSummary? graphSummary;

  /// The timestamp, in ISO 8601 format, of the time at which Neptune last
  /// computed statistics.
  final DateTime? lastStatisticsComputationTime;

  /// The version of this graph summary response.
  final String? version;

  RDFGraphSummaryValueMap({
    this.graphSummary,
    this.lastStatisticsComputationTime,
    this.version,
  });

  factory RDFGraphSummaryValueMap.fromJson(Map<String, dynamic> json) {
    return RDFGraphSummaryValueMap(
      graphSummary: json['graphSummary'] != null
          ? RDFGraphSummary.fromJson(
              json['graphSummary'] as Map<String, dynamic>)
          : null,
      lastStatisticsComputationTime:
          timeStampFromJson(json['lastStatisticsComputationTime']),
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final graphSummary = this.graphSummary;
    final lastStatisticsComputationTime = this.lastStatisticsComputationTime;
    final version = this.version;
    return {
      if (graphSummary != null) 'graphSummary': graphSummary,
      if (lastStatisticsComputationTime != null)
        'lastStatisticsComputationTime':
            iso8601ToJson(lastStatisticsComputationTime),
      if (version != null) 'version': version,
    };
  }
}

/// Statistics for <code>REFRESH</code> mode.
class RefreshStatisticsIdMap {
  /// The ID of the statistics generation run that is currently occurring.
  final String? statisticsId;

  RefreshStatisticsIdMap({
    this.statisticsId,
  });

  factory RefreshStatisticsIdMap.fromJson(Map<String, dynamic> json) {
    return RefreshStatisticsIdMap(
      statisticsId: json['statisticsId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final statisticsId = this.statisticsId;
    return {
      if (statisticsId != null) 'statisticsId': statisticsId,
    };
  }
}

enum S3BucketRegion {
  usEast_1,
  usEast_2,
  usWest_1,
  usWest_2,
  caCentral_1,
  saEast_1,
  euNorth_1,
  euWest_1,
  euWest_2,
  euWest_3,
  euCentral_1,
  meSouth_1,
  afSouth_1,
  apEast_1,
  apNortheast_1,
  apNortheast_2,
  apSoutheast_1,
  apSoutheast_2,
  apSouth_1,
  cnNorth_1,
  cnNorthwest_1,
  usGovWest_1,
  usGovEast_1,
}

extension S3BucketRegionValueExtension on S3BucketRegion {
  String toValue() {
    switch (this) {
      case S3BucketRegion.usEast_1:
        return 'us-east-1';
      case S3BucketRegion.usEast_2:
        return 'us-east-2';
      case S3BucketRegion.usWest_1:
        return 'us-west-1';
      case S3BucketRegion.usWest_2:
        return 'us-west-2';
      case S3BucketRegion.caCentral_1:
        return 'ca-central-1';
      case S3BucketRegion.saEast_1:
        return 'sa-east-1';
      case S3BucketRegion.euNorth_1:
        return 'eu-north-1';
      case S3BucketRegion.euWest_1:
        return 'eu-west-1';
      case S3BucketRegion.euWest_2:
        return 'eu-west-2';
      case S3BucketRegion.euWest_3:
        return 'eu-west-3';
      case S3BucketRegion.euCentral_1:
        return 'eu-central-1';
      case S3BucketRegion.meSouth_1:
        return 'me-south-1';
      case S3BucketRegion.afSouth_1:
        return 'af-south-1';
      case S3BucketRegion.apEast_1:
        return 'ap-east-1';
      case S3BucketRegion.apNortheast_1:
        return 'ap-northeast-1';
      case S3BucketRegion.apNortheast_2:
        return 'ap-northeast-2';
      case S3BucketRegion.apSoutheast_1:
        return 'ap-southeast-1';
      case S3BucketRegion.apSoutheast_2:
        return 'ap-southeast-2';
      case S3BucketRegion.apSouth_1:
        return 'ap-south-1';
      case S3BucketRegion.cnNorth_1:
        return 'cn-north-1';
      case S3BucketRegion.cnNorthwest_1:
        return 'cn-northwest-1';
      case S3BucketRegion.usGovWest_1:
        return 'us-gov-west-1';
      case S3BucketRegion.usGovEast_1:
        return 'us-gov-east-1';
    }
  }
}

extension S3BucketRegionFromString on String {
  S3BucketRegion toS3BucketRegion() {
    switch (this) {
      case 'us-east-1':
        return S3BucketRegion.usEast_1;
      case 'us-east-2':
        return S3BucketRegion.usEast_2;
      case 'us-west-1':
        return S3BucketRegion.usWest_1;
      case 'us-west-2':
        return S3BucketRegion.usWest_2;
      case 'ca-central-1':
        return S3BucketRegion.caCentral_1;
      case 'sa-east-1':
        return S3BucketRegion.saEast_1;
      case 'eu-north-1':
        return S3BucketRegion.euNorth_1;
      case 'eu-west-1':
        return S3BucketRegion.euWest_1;
      case 'eu-west-2':
        return S3BucketRegion.euWest_2;
      case 'eu-west-3':
        return S3BucketRegion.euWest_3;
      case 'eu-central-1':
        return S3BucketRegion.euCentral_1;
      case 'me-south-1':
        return S3BucketRegion.meSouth_1;
      case 'af-south-1':
        return S3BucketRegion.afSouth_1;
      case 'ap-east-1':
        return S3BucketRegion.apEast_1;
      case 'ap-northeast-1':
        return S3BucketRegion.apNortheast_1;
      case 'ap-northeast-2':
        return S3BucketRegion.apNortheast_2;
      case 'ap-southeast-1':
        return S3BucketRegion.apSoutheast_1;
      case 'ap-southeast-2':
        return S3BucketRegion.apSoutheast_2;
      case 'ap-south-1':
        return S3BucketRegion.apSouth_1;
      case 'cn-north-1':
        return S3BucketRegion.cnNorth_1;
      case 'cn-northwest-1':
        return S3BucketRegion.cnNorthwest_1;
      case 'us-gov-west-1':
        return S3BucketRegion.usGovWest_1;
      case 'us-gov-east-1':
        return S3BucketRegion.usGovEast_1;
    }
    throw Exception('$this is not known in enum S3BucketRegion');
  }
}

/// Neptune logs are converted to SPARQL quads in the graph using the Resource
/// Description Framework (RDF) <a
/// href="https://www.w3.org/TR/n-quads/">N-QUADS</a> language defined in the
/// W3C RDF 1.1 N-Quads specification
class SparqlData {
  /// Holds an <a href="https://www.w3.org/TR/n-quads/">N-QUADS</a> statement
  /// expressing the changed quad.
  final String stmt;

  SparqlData({
    required this.stmt,
  });

  factory SparqlData.fromJson(Map<String, dynamic> json) {
    return SparqlData(
      stmt: json['stmt'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final stmt = this.stmt;
    return {
      'stmt': stmt,
    };
  }
}

/// A serialized SPARQL stream record capturing a change-log entry for the RDF
/// graph.
class SparqlRecord {
  /// The time at which the commit for the transaction was requested, in
  /// milliseconds from the Unix epoch.
  final int commitTimestampInMillis;

  /// The serialized SPARQL change record. The serialization formats of each
  /// record are described in more detail in <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/streams-change-formats.html">Serialization
  /// Formats in Neptune Streams</a>.
  final SparqlData data;

  /// The sequence identifier of the stream change record.
  final Map<String, String> eventId;

  /// The operation that created the change.
  final String op;

  /// Only present if this operation is the last one in its transaction. If
  /// present, it is set to true. It is useful for ensuring that an entire
  /// transaction is consumed.
  final bool? isLastOp;

  SparqlRecord({
    required this.commitTimestampInMillis,
    required this.data,
    required this.eventId,
    required this.op,
    this.isLastOp,
  });

  factory SparqlRecord.fromJson(Map<String, dynamic> json) {
    return SparqlRecord(
      commitTimestampInMillis: json['commitTimestamp'] as int,
      data: SparqlData.fromJson(json['data'] as Map<String, dynamic>),
      eventId: (json['eventId'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
      op: json['op'] as String,
      isLastOp: json['isLastOp'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final commitTimestampInMillis = this.commitTimestampInMillis;
    final data = this.data;
    final eventId = this.eventId;
    final op = this.op;
    final isLastOp = this.isLastOp;
    return {
      'commitTimestamp': commitTimestampInMillis,
      'data': data,
      'eventId': eventId,
      'op': op,
      if (isLastOp != null) 'isLastOp': isLastOp,
    };
  }
}

class StartLoaderJobOutput {
  /// Contains a <code>loadId</code> name-value pair that provides an identifier
  /// for the load operation.
  final Map<String, String> payload;

  /// The HTTP return code indicating the status of the load job.
  final String status;

  StartLoaderJobOutput({
    required this.payload,
    required this.status,
  });

  factory StartLoaderJobOutput.fromJson(Map<String, dynamic> json) {
    return StartLoaderJobOutput(
      payload: (json['payload'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
      status: json['status'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final payload = this.payload;
    final status = this.status;
    return {
      'payload': payload,
      'status': status,
    };
  }
}

class StartMLDataProcessingJobOutput {
  /// The ARN of the data processing job.
  final String? arn;

  /// The time it took to create the new processing job, in milliseconds.
  final int? creationTimeInMillis;

  /// The unique ID of the new data processing job.
  final String? id;

  StartMLDataProcessingJobOutput({
    this.arn,
    this.creationTimeInMillis,
    this.id,
  });

  factory StartMLDataProcessingJobOutput.fromJson(Map<String, dynamic> json) {
    return StartMLDataProcessingJobOutput(
      arn: json['arn'] as String?,
      creationTimeInMillis: json['creationTimeInMillis'] as int?,
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTimeInMillis = this.creationTimeInMillis;
    final id = this.id;
    return {
      if (arn != null) 'arn': arn,
      if (creationTimeInMillis != null)
        'creationTimeInMillis': creationTimeInMillis,
      if (id != null) 'id': id,
    };
  }
}

class StartMLModelTrainingJobOutput {
  /// The ARN of the new model training job.
  final String? arn;

  /// The model training job creation time, in milliseconds.
  final int? creationTimeInMillis;

  /// The unique ID of the new model training job.
  final String? id;

  StartMLModelTrainingJobOutput({
    this.arn,
    this.creationTimeInMillis,
    this.id,
  });

  factory StartMLModelTrainingJobOutput.fromJson(Map<String, dynamic> json) {
    return StartMLModelTrainingJobOutput(
      arn: json['arn'] as String?,
      creationTimeInMillis: json['creationTimeInMillis'] as int?,
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTimeInMillis = this.creationTimeInMillis;
    final id = this.id;
    return {
      if (arn != null) 'arn': arn,
      if (creationTimeInMillis != null)
        'creationTimeInMillis': creationTimeInMillis,
      if (id != null) 'id': id,
    };
  }
}

class StartMLModelTransformJobOutput {
  /// The ARN of the model transform job.
  final String? arn;

  /// The creation time of the model transform job, in milliseconds.
  final int? creationTimeInMillis;

  /// The unique ID of the new model transform job.
  final String? id;

  StartMLModelTransformJobOutput({
    this.arn,
    this.creationTimeInMillis,
    this.id,
  });

  factory StartMLModelTransformJobOutput.fromJson(Map<String, dynamic> json) {
    return StartMLModelTransformJobOutput(
      arn: json['arn'] as String?,
      creationTimeInMillis: json['creationTimeInMillis'] as int?,
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTimeInMillis = this.creationTimeInMillis;
    final id = this.id;
    return {
      if (arn != null) 'arn': arn,
      if (creationTimeInMillis != null)
        'creationTimeInMillis': creationTimeInMillis,
      if (id != null) 'id': id,
    };
  }
}

/// Contains statistics information. The DFE engine uses information about the
/// data in your Neptune graph to make effective trade-offs when planning query
/// execution. This information takes the form of statistics that include
/// so-called characteristic sets and predicate statistics that can guide query
/// planning. See <a
/// href="https://docs.aws.amazon.com/neptune/latest/userguide/neptune-dfe-statistics.html">Managing
/// statistics for the Neptune DFE to use</a>.
class Statistics {
  /// Indicates whether or not DFE statistics generation is enabled at all.
  final bool? active;

  /// Indicates whether or not automatic statistics generation is enabled.
  final bool? autoCompute;

  /// The UTC time at which DFE statistics have most recently been generated.
  final DateTime? date;

  /// A note about problems in the case where statistics are invalid.
  final String? note;

  /// A StatisticsSummary structure that contains:
  ///
  /// <ul>
  /// <li>
  /// <code>signatureCount</code> - The total number of signatures across all
  /// characteristic sets.
  /// </li>
  /// <li>
  /// <code>instanceCount</code> - The total number of characteristic-set
  /// instances.
  /// </li>
  /// <li>
  /// <code>predicateCount</code> - The total number of unique predicates.
  /// </li>
  /// </ul>
  final StatisticsSummary? signatureInfo;

  /// Reports the ID of the current statistics generation run. A value of -1
  /// indicates that no statistics have been generated.
  final String? statisticsId;

  Statistics({
    this.active,
    this.autoCompute,
    this.date,
    this.note,
    this.signatureInfo,
    this.statisticsId,
  });

  factory Statistics.fromJson(Map<String, dynamic> json) {
    return Statistics(
      active: json['active'] as bool?,
      autoCompute: json['autoCompute'] as bool?,
      date: timeStampFromJson(json['date']),
      note: json['note'] as String?,
      signatureInfo: json['signatureInfo'] != null
          ? StatisticsSummary.fromJson(
              json['signatureInfo'] as Map<String, dynamic>)
          : null,
      statisticsId: json['statisticsId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final active = this.active;
    final autoCompute = this.autoCompute;
    final date = this.date;
    final note = this.note;
    final signatureInfo = this.signatureInfo;
    final statisticsId = this.statisticsId;
    return {
      if (active != null) 'active': active,
      if (autoCompute != null) 'autoCompute': autoCompute,
      if (date != null) 'date': iso8601ToJson(date),
      if (note != null) 'note': note,
      if (signatureInfo != null) 'signatureInfo': signatureInfo,
      if (statisticsId != null) 'statisticsId': statisticsId,
    };
  }
}

enum StatisticsAutoGenerationMode {
  disableAutoCompute,
  enableAutoCompute,
  refresh,
}

extension StatisticsAutoGenerationModeValueExtension
    on StatisticsAutoGenerationMode {
  String toValue() {
    switch (this) {
      case StatisticsAutoGenerationMode.disableAutoCompute:
        return 'disableAutoCompute';
      case StatisticsAutoGenerationMode.enableAutoCompute:
        return 'enableAutoCompute';
      case StatisticsAutoGenerationMode.refresh:
        return 'refresh';
    }
  }
}

extension StatisticsAutoGenerationModeFromString on String {
  StatisticsAutoGenerationMode toStatisticsAutoGenerationMode() {
    switch (this) {
      case 'disableAutoCompute':
        return StatisticsAutoGenerationMode.disableAutoCompute;
      case 'enableAutoCompute':
        return StatisticsAutoGenerationMode.enableAutoCompute;
      case 'refresh':
        return StatisticsAutoGenerationMode.refresh;
    }
    throw Exception('$this is not known in enum StatisticsAutoGenerationMode');
  }
}

/// Information about the characteristic sets generated in the statistics.
class StatisticsSummary {
  /// The total number of characteristic-set instances.
  final int? instanceCount;

  /// The total number of unique predicates.
  final int? predicateCount;

  /// The total number of signatures across all characteristic sets.
  final int? signatureCount;

  StatisticsSummary({
    this.instanceCount,
    this.predicateCount,
    this.signatureCount,
  });

  factory StatisticsSummary.fromJson(Map<String, dynamic> json) {
    return StatisticsSummary(
      instanceCount: json['instanceCount'] as int?,
      predicateCount: json['predicateCount'] as int?,
      signatureCount: json['signatureCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceCount = this.instanceCount;
    final predicateCount = this.predicateCount;
    final signatureCount = this.signatureCount;
    return {
      if (instanceCount != null) 'instanceCount': instanceCount,
      if (predicateCount != null) 'predicateCount': predicateCount,
      if (signatureCount != null) 'signatureCount': signatureCount,
    };
  }
}

/// A subject structure.
class SubjectStructure {
  /// Number of occurrences of this specific structure.
  final int? count;

  /// A list of predicates present in this specific structure.
  final List<String>? predicates;

  SubjectStructure({
    this.count,
    this.predicates,
  });

  factory SubjectStructure.fromJson(Map<String, dynamic> json) {
    return SubjectStructure(
      count: json['count'] as int?,
      predicates: (json['predicates'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final count = this.count;
    final predicates = this.predicates;
    return {
      if (count != null) 'count': count,
      if (predicates != null) 'predicates': predicates,
    };
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String? type, String? message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class BulkLoadIdNotFoundException extends _s.GenericAwsException {
  BulkLoadIdNotFoundException({String? type, String? message})
      : super(
            type: type, code: 'BulkLoadIdNotFoundException', message: message);
}

class CancelledByUserException extends _s.GenericAwsException {
  CancelledByUserException({String? type, String? message})
      : super(type: type, code: 'CancelledByUserException', message: message);
}

class ClientTimeoutException extends _s.GenericAwsException {
  ClientTimeoutException({String? type, String? message})
      : super(type: type, code: 'ClientTimeoutException', message: message);
}

class ConcurrentModificationException extends _s.GenericAwsException {
  ConcurrentModificationException({String? type, String? message})
      : super(
            type: type,
            code: 'ConcurrentModificationException',
            message: message);
}

class ConstraintViolationException extends _s.GenericAwsException {
  ConstraintViolationException({String? type, String? message})
      : super(
            type: type, code: 'ConstraintViolationException', message: message);
}

class ExpiredStreamException extends _s.GenericAwsException {
  ExpiredStreamException({String? type, String? message})
      : super(type: type, code: 'ExpiredStreamException', message: message);
}

class FailureByQueryException extends _s.GenericAwsException {
  FailureByQueryException({String? type, String? message})
      : super(type: type, code: 'FailureByQueryException', message: message);
}

class IllegalArgumentException extends _s.GenericAwsException {
  IllegalArgumentException({String? type, String? message})
      : super(type: type, code: 'IllegalArgumentException', message: message);
}

class InternalFailureException extends _s.GenericAwsException {
  InternalFailureException({String? type, String? message})
      : super(type: type, code: 'InternalFailureException', message: message);
}

class InvalidArgumentException extends _s.GenericAwsException {
  InvalidArgumentException({String? type, String? message})
      : super(type: type, code: 'InvalidArgumentException', message: message);
}

class InvalidNumericDataException extends _s.GenericAwsException {
  InvalidNumericDataException({String? type, String? message})
      : super(
            type: type, code: 'InvalidNumericDataException', message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String? type, String? message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class LoadUrlAccessDeniedException extends _s.GenericAwsException {
  LoadUrlAccessDeniedException({String? type, String? message})
      : super(
            type: type, code: 'LoadUrlAccessDeniedException', message: message);
}

class MLResourceNotFoundException extends _s.GenericAwsException {
  MLResourceNotFoundException({String? type, String? message})
      : super(
            type: type, code: 'MLResourceNotFoundException', message: message);
}

class MalformedQueryException extends _s.GenericAwsException {
  MalformedQueryException({String? type, String? message})
      : super(type: type, code: 'MalformedQueryException', message: message);
}

class MemoryLimitExceededException extends _s.GenericAwsException {
  MemoryLimitExceededException({String? type, String? message})
      : super(
            type: type, code: 'MemoryLimitExceededException', message: message);
}

class MethodNotAllowedException extends _s.GenericAwsException {
  MethodNotAllowedException({String? type, String? message})
      : super(type: type, code: 'MethodNotAllowedException', message: message);
}

class MissingParameterException extends _s.GenericAwsException {
  MissingParameterException({String? type, String? message})
      : super(type: type, code: 'MissingParameterException', message: message);
}

class ParsingException extends _s.GenericAwsException {
  ParsingException({String? type, String? message})
      : super(type: type, code: 'ParsingException', message: message);
}

class PreconditionsFailedException extends _s.GenericAwsException {
  PreconditionsFailedException({String? type, String? message})
      : super(
            type: type, code: 'PreconditionsFailedException', message: message);
}

class QueryLimitExceededException extends _s.GenericAwsException {
  QueryLimitExceededException({String? type, String? message})
      : super(
            type: type, code: 'QueryLimitExceededException', message: message);
}

class QueryLimitException extends _s.GenericAwsException {
  QueryLimitException({String? type, String? message})
      : super(type: type, code: 'QueryLimitException', message: message);
}

class QueryTooLargeException extends _s.GenericAwsException {
  QueryTooLargeException({String? type, String? message})
      : super(type: type, code: 'QueryTooLargeException', message: message);
}

class ReadOnlyViolationException extends _s.GenericAwsException {
  ReadOnlyViolationException({String? type, String? message})
      : super(type: type, code: 'ReadOnlyViolationException', message: message);
}

class S3Exception extends _s.GenericAwsException {
  S3Exception({String? type, String? message})
      : super(type: type, code: 'S3Exception', message: message);
}

class ServerShutdownException extends _s.GenericAwsException {
  ServerShutdownException({String? type, String? message})
      : super(type: type, code: 'ServerShutdownException', message: message);
}

class StatisticsNotAvailableException extends _s.GenericAwsException {
  StatisticsNotAvailableException({String? type, String? message})
      : super(
            type: type,
            code: 'StatisticsNotAvailableException',
            message: message);
}

class StreamRecordsNotFoundException extends _s.GenericAwsException {
  StreamRecordsNotFoundException({String? type, String? message})
      : super(
            type: type,
            code: 'StreamRecordsNotFoundException',
            message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class TimeLimitExceededException extends _s.GenericAwsException {
  TimeLimitExceededException({String? type, String? message})
      : super(type: type, code: 'TimeLimitExceededException', message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String? type, String? message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

class UnsupportedOperationException extends _s.GenericAwsException {
  UnsupportedOperationException({String? type, String? message})
      : super(
            type: type,
            code: 'UnsupportedOperationException',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
  'BulkLoadIdNotFoundException': (type, message) =>
      BulkLoadIdNotFoundException(type: type, message: message),
  'CancelledByUserException': (type, message) =>
      CancelledByUserException(type: type, message: message),
  'ClientTimeoutException': (type, message) =>
      ClientTimeoutException(type: type, message: message),
  'ConcurrentModificationException': (type, message) =>
      ConcurrentModificationException(type: type, message: message),
  'ConstraintViolationException': (type, message) =>
      ConstraintViolationException(type: type, message: message),
  'ExpiredStreamException': (type, message) =>
      ExpiredStreamException(type: type, message: message),
  'FailureByQueryException': (type, message) =>
      FailureByQueryException(type: type, message: message),
  'IllegalArgumentException': (type, message) =>
      IllegalArgumentException(type: type, message: message),
  'InternalFailureException': (type, message) =>
      InternalFailureException(type: type, message: message),
  'InvalidArgumentException': (type, message) =>
      InvalidArgumentException(type: type, message: message),
  'InvalidNumericDataException': (type, message) =>
      InvalidNumericDataException(type: type, message: message),
  'InvalidParameterException': (type, message) =>
      InvalidParameterException(type: type, message: message),
  'LoadUrlAccessDeniedException': (type, message) =>
      LoadUrlAccessDeniedException(type: type, message: message),
  'MLResourceNotFoundException': (type, message) =>
      MLResourceNotFoundException(type: type, message: message),
  'MalformedQueryException': (type, message) =>
      MalformedQueryException(type: type, message: message),
  'MemoryLimitExceededException': (type, message) =>
      MemoryLimitExceededException(type: type, message: message),
  'MethodNotAllowedException': (type, message) =>
      MethodNotAllowedException(type: type, message: message),
  'MissingParameterException': (type, message) =>
      MissingParameterException(type: type, message: message),
  'ParsingException': (type, message) =>
      ParsingException(type: type, message: message),
  'PreconditionsFailedException': (type, message) =>
      PreconditionsFailedException(type: type, message: message),
  'QueryLimitExceededException': (type, message) =>
      QueryLimitExceededException(type: type, message: message),
  'QueryLimitException': (type, message) =>
      QueryLimitException(type: type, message: message),
  'QueryTooLargeException': (type, message) =>
      QueryTooLargeException(type: type, message: message),
  'ReadOnlyViolationException': (type, message) =>
      ReadOnlyViolationException(type: type, message: message),
  'S3Exception': (type, message) => S3Exception(type: type, message: message),
  'ServerShutdownException': (type, message) =>
      ServerShutdownException(type: type, message: message),
  'StatisticsNotAvailableException': (type, message) =>
      StatisticsNotAvailableException(type: type, message: message),
  'StreamRecordsNotFoundException': (type, message) =>
      StreamRecordsNotFoundException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'TimeLimitExceededException': (type, message) =>
      TimeLimitExceededException(type: type, message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
  'UnsupportedOperationException': (type, message) =>
      UnsupportedOperationException(type: type, message: message),
};
