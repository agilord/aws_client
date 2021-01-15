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

part '2012-10-29.g.dart';

/// AWS Data Pipeline configures and manages a data-driven workflow called a
/// pipeline. AWS Data Pipeline handles the details of scheduling and ensuring
/// that data dependencies are met so that your application can focus on
/// processing the data.
///
/// AWS Data Pipeline provides a JAR implementation of a task runner called AWS
/// Data Pipeline Task Runner. AWS Data Pipeline Task Runner provides logic for
/// common data management scenarios, such as performing database queries and
/// running data analysis using Amazon Elastic MapReduce (Amazon EMR). You can
/// use AWS Data Pipeline Task Runner as your task runner, or you can write your
/// own task runner to provide custom data management.
///
/// AWS Data Pipeline implements two main sets of functionality. Use the first
/// set to create a pipeline and define data sources, schedules, dependencies,
/// and the transforms to be performed on the data. Use the second set in your
/// task runner application to receive the next task ready for processing. The
/// logic for performing the task, such as querying the data, running data
/// analysis, or converting the data from one format to another, is contained
/// within the task runner. The task runner performs the task assigned to it by
/// the web service, reporting progress to the web service as it does so. When
/// the task is done, the task runner reports the final success or failure of
/// the task to the web service.
class DataPipeline {
  final _s.JsonProtocol _protocol;
  DataPipeline({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'datapipeline',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Validates the specified pipeline and starts processing pipeline tasks. If
  /// the pipeline does not pass validation, activation fails.
  ///
  /// If you need to pause the pipeline to investigate an issue with a
  /// component, such as a data source or script, call
  /// <a>DeactivatePipeline</a>.
  ///
  /// To activate a finished pipeline, modify the end date for the pipeline and
  /// then activate it.
  ///
  /// May throw [PipelineNotFoundException].
  /// May throw [PipelineDeletedException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [pipelineId] :
  /// The ID of the pipeline.
  ///
  /// Parameter [parameterValues] :
  /// A list of parameter values to pass to the pipeline at activation.
  ///
  /// Parameter [startTimestamp] :
  /// The date and time to resume the pipeline. By default, the pipeline resumes
  /// from the last completed execution.
  Future<void> activatePipeline({
    @_s.required String pipelineId,
    List<ParameterValue> parameterValues,
    DateTime startTimestamp,
  }) async {
    ArgumentError.checkNotNull(pipelineId, 'pipelineId');
    _s.validateStringLength(
      'pipelineId',
      pipelineId,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'pipelineId',
      pipelineId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DataPipeline.ActivatePipeline'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'pipelineId': pipelineId,
        if (parameterValues != null) 'parameterValues': parameterValues,
        if (startTimestamp != null)
          'startTimestamp': unixTimestampToJson(startTimestamp),
      },
    );

    return ActivatePipelineOutput.fromJson(jsonResponse.body);
  }

  /// Adds or modifies tags for the specified pipeline.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [PipelineNotFoundException].
  /// May throw [PipelineDeletedException].
  ///
  /// Parameter [pipelineId] :
  /// The ID of the pipeline.
  ///
  /// Parameter [tags] :
  /// The tags to add, as key/value pairs.
  Future<void> addTags({
    @_s.required String pipelineId,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(pipelineId, 'pipelineId');
    _s.validateStringLength(
      'pipelineId',
      pipelineId,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'pipelineId',
      pipelineId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DataPipeline.AddTags'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'pipelineId': pipelineId,
        'tags': tags,
      },
    );

    return AddTagsOutput.fromJson(jsonResponse.body);
  }

  /// Creates a new, empty pipeline. Use <a>PutPipelineDefinition</a> to
  /// populate the pipeline.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [name] :
  /// The name for the pipeline. You can use the same name for multiple
  /// pipelines associated with your AWS account, because AWS Data Pipeline
  /// assigns each pipeline a unique pipeline identifier.
  ///
  /// Parameter [uniqueId] :
  /// A unique identifier. This identifier is not the same as the pipeline
  /// identifier assigned by AWS Data Pipeline. You are responsible for defining
  /// the format and ensuring the uniqueness of this identifier. You use this
  /// parameter to ensure idempotency during repeated calls to
  /// <code>CreatePipeline</code>. For example, if the first call to
  /// <code>CreatePipeline</code> does not succeed, you can pass in the same
  /// unique identifier and pipeline name combination on a subsequent call to
  /// <code>CreatePipeline</code>. <code>CreatePipeline</code> ensures that if a
  /// pipeline already exists with the same name and unique identifier, a new
  /// pipeline is not created. Instead, you'll receive the pipeline identifier
  /// from the previous attempt. The uniqueness of the name and unique
  /// identifier combination is scoped to the AWS account or IAM user
  /// credentials.
  ///
  /// Parameter [description] :
  /// The description for the pipeline.
  ///
  /// Parameter [tags] :
  /// A list of tags to associate with the pipeline at creation. Tags let you
  /// control access to pipelines. For more information, see <a
  /// href="http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-control-access.html">Controlling
  /// User Access to Pipelines</a> in the <i>AWS Data Pipeline Developer
  /// Guide</i>.
  Future<CreatePipelineOutput> createPipeline({
    @_s.required String name,
    @_s.required String uniqueId,
    String description,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(uniqueId, 'uniqueId');
    _s.validateStringLength(
      'uniqueId',
      uniqueId,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'uniqueId',
      uniqueId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      1024,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DataPipeline.CreatePipeline'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        'uniqueId': uniqueId,
        if (description != null) 'description': description,
        if (tags != null) 'tags': tags,
      },
    );

    return CreatePipelineOutput.fromJson(jsonResponse.body);
  }

  /// Deactivates the specified running pipeline. The pipeline is set to the
  /// <code>DEACTIVATING</code> state until the deactivation process completes.
  ///
  /// To resume a deactivated pipeline, use <a>ActivatePipeline</a>. By default,
  /// the pipeline resumes from the last completed execution. Optionally, you
  /// can specify the date and time to resume the pipeline.
  ///
  /// May throw [PipelineNotFoundException].
  /// May throw [PipelineDeletedException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [pipelineId] :
  /// The ID of the pipeline.
  ///
  /// Parameter [cancelActive] :
  /// Indicates whether to cancel any running objects. The default is true,
  /// which sets the state of any running objects to <code>CANCELED</code>. If
  /// this value is false, the pipeline is deactivated after all running objects
  /// finish.
  Future<void> deactivatePipeline({
    @_s.required String pipelineId,
    bool cancelActive,
  }) async {
    ArgumentError.checkNotNull(pipelineId, 'pipelineId');
    _s.validateStringLength(
      'pipelineId',
      pipelineId,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'pipelineId',
      pipelineId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DataPipeline.DeactivatePipeline'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'pipelineId': pipelineId,
        if (cancelActive != null) 'cancelActive': cancelActive,
      },
    );

    return DeactivatePipelineOutput.fromJson(jsonResponse.body);
  }

  /// Deletes a pipeline, its pipeline definition, and its run history. AWS Data
  /// Pipeline attempts to cancel instances associated with the pipeline that
  /// are currently being processed by task runners.
  ///
  /// Deleting a pipeline cannot be undone. You cannot query or restore a
  /// deleted pipeline. To temporarily pause a pipeline instead of deleting it,
  /// call <a>SetStatus</a> with the status set to <code>PAUSE</code> on
  /// individual components. Components that are paused by <a>SetStatus</a> can
  /// be resumed.
  ///
  /// May throw [PipelineNotFoundException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [pipelineId] :
  /// The ID of the pipeline.
  Future<void> deletePipeline({
    @_s.required String pipelineId,
  }) async {
    ArgumentError.checkNotNull(pipelineId, 'pipelineId');
    _s.validateStringLength(
      'pipelineId',
      pipelineId,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'pipelineId',
      pipelineId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DataPipeline.DeletePipeline'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'pipelineId': pipelineId,
      },
    );
  }

  /// Gets the object definitions for a set of objects associated with the
  /// pipeline. Object definitions are composed of a set of fields that define
  /// the properties of the object.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [PipelineNotFoundException].
  /// May throw [PipelineDeletedException].
  ///
  /// Parameter [objectIds] :
  /// The IDs of the pipeline objects that contain the definitions to be
  /// described. You can pass as many as 25 identifiers in a single call to
  /// <code>DescribeObjects</code>.
  ///
  /// Parameter [pipelineId] :
  /// The ID of the pipeline that contains the object definitions.
  ///
  /// Parameter [evaluateExpressions] :
  /// Indicates whether any expressions in the object should be evaluated when
  /// the object descriptions are returned.
  ///
  /// Parameter [marker] :
  /// The starting point for the results to be returned. For the first call,
  /// this value should be empty. As long as there are more results, continue to
  /// call <code>DescribeObjects</code> with the marker value from the previous
  /// call to retrieve the next set of results.
  Future<DescribeObjectsOutput> describeObjects({
    @_s.required List<String> objectIds,
    @_s.required String pipelineId,
    bool evaluateExpressions,
    String marker,
  }) async {
    ArgumentError.checkNotNull(objectIds, 'objectIds');
    ArgumentError.checkNotNull(pipelineId, 'pipelineId');
    _s.validateStringLength(
      'pipelineId',
      pipelineId,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'pipelineId',
      pipelineId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'marker',
      marker,
      0,
      1024,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DataPipeline.DescribeObjects'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'objectIds': objectIds,
        'pipelineId': pipelineId,
        if (evaluateExpressions != null)
          'evaluateExpressions': evaluateExpressions,
        if (marker != null) 'marker': marker,
      },
    );

    return DescribeObjectsOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves metadata about one or more pipelines. The information retrieved
  /// includes the name of the pipeline, the pipeline identifier, its current
  /// state, and the user account that owns the pipeline. Using account
  /// credentials, you can retrieve metadata about pipelines that you or your
  /// IAM users have created. If you are using an IAM user account, you can
  /// retrieve metadata about only those pipelines for which you have read
  /// permissions.
  ///
  /// To retrieve the full pipeline definition instead of metadata about the
  /// pipeline, call <a>GetPipelineDefinition</a>.
  ///
  /// May throw [PipelineNotFoundException].
  /// May throw [PipelineDeletedException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [pipelineIds] :
  /// The IDs of the pipelines to describe. You can pass as many as 25
  /// identifiers in a single call. To obtain pipeline IDs, call
  /// <a>ListPipelines</a>.
  Future<DescribePipelinesOutput> describePipelines({
    @_s.required List<String> pipelineIds,
  }) async {
    ArgumentError.checkNotNull(pipelineIds, 'pipelineIds');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DataPipeline.DescribePipelines'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'pipelineIds': pipelineIds,
      },
    );

    return DescribePipelinesOutput.fromJson(jsonResponse.body);
  }

  /// Task runners call <code>EvaluateExpression</code> to evaluate a string in
  /// the context of the specified object. For example, a task runner can
  /// evaluate SQL queries stored in Amazon S3.
  ///
  /// May throw [InternalServiceError].
  /// May throw [TaskNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [PipelineNotFoundException].
  /// May throw [PipelineDeletedException].
  ///
  /// Parameter [expression] :
  /// The expression to evaluate.
  ///
  /// Parameter [objectId] :
  /// The ID of the object.
  ///
  /// Parameter [pipelineId] :
  /// The ID of the pipeline.
  Future<EvaluateExpressionOutput> evaluateExpression({
    @_s.required String expression,
    @_s.required String objectId,
    @_s.required String pipelineId,
  }) async {
    ArgumentError.checkNotNull(expression, 'expression');
    _s.validateStringLength(
      'expression',
      expression,
      0,
      20971520,
      isRequired: true,
    );
    _s.validateStringPattern(
      'expression',
      expression,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(objectId, 'objectId');
    _s.validateStringLength(
      'objectId',
      objectId,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'objectId',
      objectId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(pipelineId, 'pipelineId');
    _s.validateStringLength(
      'pipelineId',
      pipelineId,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'pipelineId',
      pipelineId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DataPipeline.EvaluateExpression'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'expression': expression,
        'objectId': objectId,
        'pipelineId': pipelineId,
      },
    );

    return EvaluateExpressionOutput.fromJson(jsonResponse.body);
  }

  /// Gets the definition of the specified pipeline. You can call
  /// <code>GetPipelineDefinition</code> to retrieve the pipeline definition
  /// that you provided using <a>PutPipelineDefinition</a>.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [PipelineNotFoundException].
  /// May throw [PipelineDeletedException].
  ///
  /// Parameter [pipelineId] :
  /// The ID of the pipeline.
  ///
  /// Parameter [version] :
  /// The version of the pipeline definition to retrieve. Set this parameter to
  /// <code>latest</code> (default) to use the last definition saved to the
  /// pipeline or <code>active</code> to use the last definition that was
  /// activated.
  Future<GetPipelineDefinitionOutput> getPipelineDefinition({
    @_s.required String pipelineId,
    String version,
  }) async {
    ArgumentError.checkNotNull(pipelineId, 'pipelineId');
    _s.validateStringLength(
      'pipelineId',
      pipelineId,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'pipelineId',
      pipelineId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'version',
      version,
      0,
      1024,
    );
    _s.validateStringPattern(
      'version',
      version,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DataPipeline.GetPipelineDefinition'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'pipelineId': pipelineId,
        if (version != null) 'version': version,
      },
    );

    return GetPipelineDefinitionOutput.fromJson(jsonResponse.body);
  }

  /// Lists the pipeline identifiers for all active pipelines that you have
  /// permission to access.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [marker] :
  /// The starting point for the results to be returned. For the first call,
  /// this value should be empty. As long as there are more results, continue to
  /// call <code>ListPipelines</code> with the marker value from the previous
  /// call to retrieve the next set of results.
  Future<ListPipelinesOutput> listPipelines({
    String marker,
  }) async {
    _s.validateStringLength(
      'marker',
      marker,
      0,
      1024,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DataPipeline.ListPipelines'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (marker != null) 'marker': marker,
      },
    );

    return ListPipelinesOutput.fromJson(jsonResponse.body);
  }

  /// Task runners call <code>PollForTask</code> to receive a task to perform
  /// from AWS Data Pipeline. The task runner specifies which tasks it can
  /// perform by setting a value for the <code>workerGroup</code> parameter. The
  /// task returned can come from any of the pipelines that match the
  /// <code>workerGroup</code> value passed in by the task runner and that was
  /// launched using the IAM user credentials specified by the task runner.
  ///
  /// If tasks are ready in the work queue, <code>PollForTask</code> returns a
  /// response immediately. If no tasks are available in the queue,
  /// <code>PollForTask</code> uses long-polling and holds on to a poll
  /// connection for up to a 90 seconds, during which time the first newly
  /// scheduled task is handed to the task runner. To accomodate this, set the
  /// socket timeout in your task runner to 90 seconds. The task runner should
  /// not call <code>PollForTask</code> again on the same
  /// <code>workerGroup</code> until it receives a response, and this can take
  /// up to 90 seconds.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [TaskNotFoundException].
  ///
  /// Parameter [workerGroup] :
  /// The type of task the task runner is configured to accept and process. The
  /// worker group is set as a field on objects in the pipeline when they are
  /// created. You can only specify a single value for <code>workerGroup</code>
  /// in the call to <code>PollForTask</code>. There are no wildcard values
  /// permitted in <code>workerGroup</code>; the string must be an exact,
  /// case-sensitive, match.
  ///
  /// Parameter [hostname] :
  /// The public DNS name of the calling task runner.
  ///
  /// Parameter [instanceIdentity] :
  /// Identity information for the EC2 instance that is hosting the task runner.
  /// You can get this value from the instance using
  /// <code>http://169.254.169.254/latest/meta-data/instance-id</code>. For more
  /// information, see <a
  /// href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AESDG-chapter-instancedata.html">Instance
  /// Metadata</a> in the <i>Amazon Elastic Compute Cloud User Guide.</i>
  /// Passing in this value proves that your task runner is running on an EC2
  /// instance, and ensures the proper AWS Data Pipeline service charges are
  /// applied to your pipeline.
  Future<PollForTaskOutput> pollForTask({
    @_s.required String workerGroup,
    String hostname,
    InstanceIdentity instanceIdentity,
  }) async {
    ArgumentError.checkNotNull(workerGroup, 'workerGroup');
    _s.validateStringLength(
      'workerGroup',
      workerGroup,
      0,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'workerGroup',
      workerGroup,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'hostname',
      hostname,
      1,
      1024,
    );
    _s.validateStringPattern(
      'hostname',
      hostname,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DataPipeline.PollForTask'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'workerGroup': workerGroup,
        if (hostname != null) 'hostname': hostname,
        if (instanceIdentity != null) 'instanceIdentity': instanceIdentity,
      },
    );

    return PollForTaskOutput.fromJson(jsonResponse.body);
  }

  /// Adds tasks, schedules, and preconditions to the specified pipeline. You
  /// can use <code>PutPipelineDefinition</code> to populate a new pipeline.
  ///
  /// <code>PutPipelineDefinition</code> also validates the configuration as it
  /// adds it to the pipeline. Changes to the pipeline are saved unless one of
  /// the following three validation errors exists in the pipeline.
  /// <ol>
  /// <li>An object is missing a name or identifier field.</li>
  /// <li>A string or reference field is empty.</li>
  /// <li>The number of objects in the pipeline exceeds the maximum allowed
  /// objects.</li>
  /// <li>The pipeline is in a FINISHED state.</li> </ol>
  /// Pipeline object definitions are passed to the
  /// <code>PutPipelineDefinition</code> action and returned by the
  /// <a>GetPipelineDefinition</a> action.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [PipelineNotFoundException].
  /// May throw [PipelineDeletedException].
  ///
  /// Parameter [pipelineId] :
  /// The ID of the pipeline.
  ///
  /// Parameter [pipelineObjects] :
  /// The objects that define the pipeline. These objects overwrite the existing
  /// pipeline definition.
  ///
  /// Parameter [parameterObjects] :
  /// The parameter objects used with the pipeline.
  ///
  /// Parameter [parameterValues] :
  /// The parameter values used with the pipeline.
  Future<PutPipelineDefinitionOutput> putPipelineDefinition({
    @_s.required String pipelineId,
    @_s.required List<PipelineObject> pipelineObjects,
    List<ParameterObject> parameterObjects,
    List<ParameterValue> parameterValues,
  }) async {
    ArgumentError.checkNotNull(pipelineId, 'pipelineId');
    _s.validateStringLength(
      'pipelineId',
      pipelineId,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'pipelineId',
      pipelineId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(pipelineObjects, 'pipelineObjects');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DataPipeline.PutPipelineDefinition'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'pipelineId': pipelineId,
        'pipelineObjects': pipelineObjects,
        if (parameterObjects != null) 'parameterObjects': parameterObjects,
        if (parameterValues != null) 'parameterValues': parameterValues,
      },
    );

    return PutPipelineDefinitionOutput.fromJson(jsonResponse.body);
  }

  /// Queries the specified pipeline for the names of objects that match the
  /// specified set of conditions.
  ///
  /// May throw [PipelineNotFoundException].
  /// May throw [PipelineDeletedException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [pipelineId] :
  /// The ID of the pipeline.
  ///
  /// Parameter [sphere] :
  /// Indicates whether the query applies to components or instances. The
  /// possible values are: <code>COMPONENT</code>, <code>INSTANCE</code>, and
  /// <code>ATTEMPT</code>.
  ///
  /// Parameter [limit] :
  /// The maximum number of object names that <code>QueryObjects</code> will
  /// return in a single call. The default value is 100.
  ///
  /// Parameter [marker] :
  /// The starting point for the results to be returned. For the first call,
  /// this value should be empty. As long as there are more results, continue to
  /// call <code>QueryObjects</code> with the marker value from the previous
  /// call to retrieve the next set of results.
  ///
  /// Parameter [query] :
  /// The query that defines the objects to be returned. The <code>Query</code>
  /// object can contain a maximum of ten selectors. The conditions in the query
  /// are limited to top-level String fields in the object. These filters can be
  /// applied to components, instances, and attempts.
  Future<QueryObjectsOutput> queryObjects({
    @_s.required String pipelineId,
    @_s.required String sphere,
    int limit,
    String marker,
    Query query,
  }) async {
    ArgumentError.checkNotNull(pipelineId, 'pipelineId');
    _s.validateStringLength(
      'pipelineId',
      pipelineId,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'pipelineId',
      pipelineId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(sphere, 'sphere');
    _s.validateStringLength(
      'sphere',
      sphere,
      0,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'sphere',
      sphere,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'marker',
      marker,
      0,
      1024,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DataPipeline.QueryObjects'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'pipelineId': pipelineId,
        'sphere': sphere,
        if (limit != null) 'limit': limit,
        if (marker != null) 'marker': marker,
        if (query != null) 'query': query,
      },
    );

    return QueryObjectsOutput.fromJson(jsonResponse.body);
  }

  /// Removes existing tags from the specified pipeline.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [PipelineNotFoundException].
  /// May throw [PipelineDeletedException].
  ///
  /// Parameter [pipelineId] :
  /// The ID of the pipeline.
  ///
  /// Parameter [tagKeys] :
  /// The keys of the tags to remove.
  Future<void> removeTags({
    @_s.required String pipelineId,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(pipelineId, 'pipelineId');
    _s.validateStringLength(
      'pipelineId',
      pipelineId,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'pipelineId',
      pipelineId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DataPipeline.RemoveTags'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'pipelineId': pipelineId,
        'tagKeys': tagKeys,
      },
    );

    return RemoveTagsOutput.fromJson(jsonResponse.body);
  }

  /// Task runners call <code>ReportTaskProgress</code> when assigned a task to
  /// acknowledge that it has the task. If the web service does not receive this
  /// acknowledgement within 2 minutes, it assigns the task in a subsequent
  /// <a>PollForTask</a> call. After this initial acknowledgement, the task
  /// runner only needs to report progress every 15 minutes to maintain its
  /// ownership of the task. You can change this reporting time from 15 minutes
  /// by specifying a <code>reportProgressTimeout</code> field in your pipeline.
  ///
  /// If a task runner does not report its status after 5 minutes, AWS Data
  /// Pipeline assumes that the task runner is unable to process the task and
  /// reassigns the task in a subsequent response to <a>PollForTask</a>. Task
  /// runners should call <code>ReportTaskProgress</code> every 60 seconds.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [TaskNotFoundException].
  /// May throw [PipelineNotFoundException].
  /// May throw [PipelineDeletedException].
  ///
  /// Parameter [taskId] :
  /// The ID of the task assigned to the task runner. This value is provided in
  /// the response for <a>PollForTask</a>.
  ///
  /// Parameter [fields] :
  /// Key-value pairs that define the properties of the ReportTaskProgressInput
  /// object.
  Future<ReportTaskProgressOutput> reportTaskProgress({
    @_s.required String taskId,
    List<Field> fields,
  }) async {
    ArgumentError.checkNotNull(taskId, 'taskId');
    _s.validateStringLength(
      'taskId',
      taskId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'taskId',
      taskId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DataPipeline.ReportTaskProgress'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'taskId': taskId,
        if (fields != null) 'fields': fields,
      },
    );

    return ReportTaskProgressOutput.fromJson(jsonResponse.body);
  }

  /// Task runners call <code>ReportTaskRunnerHeartbeat</code> every 15 minutes
  /// to indicate that they are operational. If the AWS Data Pipeline Task
  /// Runner is launched on a resource managed by AWS Data Pipeline, the web
  /// service can use this call to detect when the task runner application has
  /// failed and restart a new instance.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [taskrunnerId] :
  /// The ID of the task runner. This value should be unique across your AWS
  /// account. In the case of AWS Data Pipeline Task Runner launched on a
  /// resource managed by AWS Data Pipeline, the web service provides a unique
  /// identifier when it launches the application. If you have written a custom
  /// task runner, you should assign a unique identifier for the task runner.
  ///
  /// Parameter [hostname] :
  /// The public DNS name of the task runner.
  ///
  /// Parameter [workerGroup] :
  /// The type of task the task runner is configured to accept and process. The
  /// worker group is set as a field on objects in the pipeline when they are
  /// created. You can only specify a single value for <code>workerGroup</code>.
  /// There are no wildcard values permitted in <code>workerGroup</code>; the
  /// string must be an exact, case-sensitive, match.
  Future<ReportTaskRunnerHeartbeatOutput> reportTaskRunnerHeartbeat({
    @_s.required String taskrunnerId,
    String hostname,
    String workerGroup,
  }) async {
    ArgumentError.checkNotNull(taskrunnerId, 'taskrunnerId');
    _s.validateStringLength(
      'taskrunnerId',
      taskrunnerId,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'taskrunnerId',
      taskrunnerId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'hostname',
      hostname,
      1,
      1024,
    );
    _s.validateStringPattern(
      'hostname',
      hostname,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringLength(
      'workerGroup',
      workerGroup,
      0,
      1024,
    );
    _s.validateStringPattern(
      'workerGroup',
      workerGroup,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DataPipeline.ReportTaskRunnerHeartbeat'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'taskrunnerId': taskrunnerId,
        if (hostname != null) 'hostname': hostname,
        if (workerGroup != null) 'workerGroup': workerGroup,
      },
    );

    return ReportTaskRunnerHeartbeatOutput.fromJson(jsonResponse.body);
  }

  /// Requests that the status of the specified physical or logical pipeline
  /// objects be updated in the specified pipeline. This update might not occur
  /// immediately, but is eventually consistent. The status that can be set
  /// depends on the type of object (for example, DataNode or Activity). You
  /// cannot perform this operation on <code>FINISHED</code> pipelines and
  /// attempting to do so returns <code>InvalidRequestException</code>.
  ///
  /// May throw [PipelineNotFoundException].
  /// May throw [PipelineDeletedException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [objectIds] :
  /// The IDs of the objects. The corresponding objects can be either physical
  /// or components, but not a mix of both types.
  ///
  /// Parameter [pipelineId] :
  /// The ID of the pipeline that contains the objects.
  ///
  /// Parameter [status] :
  /// The status to be set on all the objects specified in
  /// <code>objectIds</code>. For components, use <code>PAUSE</code> or
  /// <code>RESUME</code>. For instances, use <code>TRY_CANCEL</code>,
  /// <code>RERUN</code>, or <code>MARK_FINISHED</code>.
  Future<void> setStatus({
    @_s.required List<String> objectIds,
    @_s.required String pipelineId,
    @_s.required String status,
  }) async {
    ArgumentError.checkNotNull(objectIds, 'objectIds');
    ArgumentError.checkNotNull(pipelineId, 'pipelineId');
    _s.validateStringLength(
      'pipelineId',
      pipelineId,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'pipelineId',
      pipelineId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(status, 'status');
    _s.validateStringLength(
      'status',
      status,
      0,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'status',
      status,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DataPipeline.SetStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'objectIds': objectIds,
        'pipelineId': pipelineId,
        'status': status,
      },
    );
  }

  /// Task runners call <code>SetTaskStatus</code> to notify AWS Data Pipeline
  /// that a task is completed and provide information about the final status. A
  /// task runner makes this call regardless of whether the task was sucessful.
  /// A task runner does not need to call <code>SetTaskStatus</code> for tasks
  /// that are canceled by the web service during a call to
  /// <a>ReportTaskProgress</a>.
  ///
  /// May throw [InternalServiceError].
  /// May throw [TaskNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [PipelineNotFoundException].
  /// May throw [PipelineDeletedException].
  ///
  /// Parameter [taskId] :
  /// The ID of the task assigned to the task runner. This value is provided in
  /// the response for <a>PollForTask</a>.
  ///
  /// Parameter [taskStatus] :
  /// If <code>FINISHED</code>, the task successfully completed. If
  /// <code>FAILED</code>, the task ended unsuccessfully. Preconditions use
  /// false.
  ///
  /// Parameter [errorId] :
  /// If an error occurred during the task, this value specifies the error code.
  /// This value is set on the physical attempt object. It is used to display
  /// error information to the user. It should not start with string "Service_"
  /// which is reserved by the system.
  ///
  /// Parameter [errorMessage] :
  /// If an error occurred during the task, this value specifies a text
  /// description of the error. This value is set on the physical attempt
  /// object. It is used to display error information to the user. The web
  /// service does not parse this value.
  ///
  /// Parameter [errorStackTrace] :
  /// If an error occurred during the task, this value specifies the stack trace
  /// associated with the error. This value is set on the physical attempt
  /// object. It is used to display error information to the user. The web
  /// service does not parse this value.
  Future<void> setTaskStatus({
    @_s.required String taskId,
    @_s.required TaskStatus taskStatus,
    String errorId,
    String errorMessage,
    String errorStackTrace,
  }) async {
    ArgumentError.checkNotNull(taskId, 'taskId');
    _s.validateStringLength(
      'taskId',
      taskId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'taskId',
      taskId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(taskStatus, 'taskStatus');
    _s.validateStringLength(
      'errorId',
      errorId,
      0,
      1024,
    );
    _s.validateStringPattern(
      'errorId',
      errorId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringLength(
      'errorStackTrace',
      errorStackTrace,
      0,
      1024,
    );
    _s.validateStringPattern(
      'errorStackTrace',
      errorStackTrace,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DataPipeline.SetTaskStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'taskId': taskId,
        'taskStatus': taskStatus?.toValue() ?? '',
        if (errorId != null) 'errorId': errorId,
        if (errorMessage != null) 'errorMessage': errorMessage,
        if (errorStackTrace != null) 'errorStackTrace': errorStackTrace,
      },
    );

    return SetTaskStatusOutput.fromJson(jsonResponse.body);
  }

  /// Validates the specified pipeline definition to ensure that it is well
  /// formed and can be run without error.
  ///
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [PipelineNotFoundException].
  /// May throw [PipelineDeletedException].
  ///
  /// Parameter [pipelineId] :
  /// The ID of the pipeline.
  ///
  /// Parameter [pipelineObjects] :
  /// The objects that define the pipeline changes to validate against the
  /// pipeline.
  ///
  /// Parameter [parameterObjects] :
  /// The parameter objects used with the pipeline.
  ///
  /// Parameter [parameterValues] :
  /// The parameter values used with the pipeline.
  Future<ValidatePipelineDefinitionOutput> validatePipelineDefinition({
    @_s.required String pipelineId,
    @_s.required List<PipelineObject> pipelineObjects,
    List<ParameterObject> parameterObjects,
    List<ParameterValue> parameterValues,
  }) async {
    ArgumentError.checkNotNull(pipelineId, 'pipelineId');
    _s.validateStringLength(
      'pipelineId',
      pipelineId,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'pipelineId',
      pipelineId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(pipelineObjects, 'pipelineObjects');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DataPipeline.ValidatePipelineDefinition'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'pipelineId': pipelineId,
        'pipelineObjects': pipelineObjects,
        if (parameterObjects != null) 'parameterObjects': parameterObjects,
        if (parameterValues != null) 'parameterValues': parameterValues,
      },
    );

    return ValidatePipelineDefinitionOutput.fromJson(jsonResponse.body);
  }
}

/// Contains the output of ActivatePipeline.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ActivatePipelineOutput {
  ActivatePipelineOutput();
  factory ActivatePipelineOutput.fromJson(Map<String, dynamic> json) =>
      _$ActivatePipelineOutputFromJson(json);
}

/// Contains the output of AddTags.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AddTagsOutput {
  AddTagsOutput();
  factory AddTagsOutput.fromJson(Map<String, dynamic> json) =>
      _$AddTagsOutputFromJson(json);
}

/// Contains the output of CreatePipeline.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreatePipelineOutput {
  /// The ID that AWS Data Pipeline assigns the newly created pipeline. For
  /// example, <code>df-06372391ZG65EXAMPLE</code>.
  @_s.JsonKey(name: 'pipelineId')
  final String pipelineId;

  CreatePipelineOutput({
    @_s.required this.pipelineId,
  });
  factory CreatePipelineOutput.fromJson(Map<String, dynamic> json) =>
      _$CreatePipelineOutputFromJson(json);
}

/// Contains the output of DeactivatePipeline.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeactivatePipelineOutput {
  DeactivatePipelineOutput();
  factory DeactivatePipelineOutput.fromJson(Map<String, dynamic> json) =>
      _$DeactivatePipelineOutputFromJson(json);
}

/// Contains the output of DescribeObjects.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeObjectsOutput {
  /// An array of object definitions.
  @_s.JsonKey(name: 'pipelineObjects')
  final List<PipelineObject> pipelineObjects;

  /// Indicates whether there are more results to return.
  @_s.JsonKey(name: 'hasMoreResults')
  final bool hasMoreResults;

  /// The starting point for the next page of results. To view the next page of
  /// results, call <code>DescribeObjects</code> again with this marker value. If
  /// the value is null, there are no more results.
  @_s.JsonKey(name: 'marker')
  final String marker;

  DescribeObjectsOutput({
    @_s.required this.pipelineObjects,
    this.hasMoreResults,
    this.marker,
  });
  factory DescribeObjectsOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeObjectsOutputFromJson(json);
}

/// Contains the output of DescribePipelines.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribePipelinesOutput {
  /// An array of descriptions for the specified pipelines.
  @_s.JsonKey(name: 'pipelineDescriptionList')
  final List<PipelineDescription> pipelineDescriptionList;

  DescribePipelinesOutput({
    @_s.required this.pipelineDescriptionList,
  });
  factory DescribePipelinesOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribePipelinesOutputFromJson(json);
}

/// Contains the output of EvaluateExpression.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EvaluateExpressionOutput {
  /// The evaluated expression.
  @_s.JsonKey(name: 'evaluatedExpression')
  final String evaluatedExpression;

  EvaluateExpressionOutput({
    @_s.required this.evaluatedExpression,
  });
  factory EvaluateExpressionOutput.fromJson(Map<String, dynamic> json) =>
      _$EvaluateExpressionOutputFromJson(json);
}

/// A key-value pair that describes a property of a pipeline object. The value
/// is specified as either a string value (<code>StringValue</code>) or a
/// reference to another object (<code>RefValue</code>) but not as both.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Field {
  /// The field identifier.
  @_s.JsonKey(name: 'key')
  final String key;

  /// The field value, expressed as the identifier of another object.
  @_s.JsonKey(name: 'refValue')
  final String refValue;

  /// The field value, expressed as a String.
  @_s.JsonKey(name: 'stringValue')
  final String stringValue;

  Field({
    @_s.required this.key,
    this.refValue,
    this.stringValue,
  });
  factory Field.fromJson(Map<String, dynamic> json) => _$FieldFromJson(json);

  Map<String, dynamic> toJson() => _$FieldToJson(this);
}

/// Contains the output of GetPipelineDefinition.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetPipelineDefinitionOutput {
  /// The parameter objects used in the pipeline definition.
  @_s.JsonKey(name: 'parameterObjects')
  final List<ParameterObject> parameterObjects;

  /// The parameter values used in the pipeline definition.
  @_s.JsonKey(name: 'parameterValues')
  final List<ParameterValue> parameterValues;

  /// The objects defined in the pipeline.
  @_s.JsonKey(name: 'pipelineObjects')
  final List<PipelineObject> pipelineObjects;

  GetPipelineDefinitionOutput({
    this.parameterObjects,
    this.parameterValues,
    this.pipelineObjects,
  });
  factory GetPipelineDefinitionOutput.fromJson(Map<String, dynamic> json) =>
      _$GetPipelineDefinitionOutputFromJson(json);
}

///
/// Identity information for the EC2 instance that is hosting the task runner.
/// You can get this value by calling a metadata URI from the EC2 instance. For
/// more information, see <a
/// href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AESDG-chapter-instancedata.html">Instance
/// Metadata</a> in the <i>Amazon Elastic Compute Cloud User Guide.</i> Passing
/// in this value proves that your task runner is running on an EC2 instance,
/// and ensures the proper AWS Data Pipeline service charges are applied to your
/// pipeline.
///
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class InstanceIdentity {
  /// A description of an EC2 instance that is generated when the instance is
  /// launched and exposed to the instance via the instance metadata service in
  /// the form of a JSON representation of an object.
  @_s.JsonKey(name: 'document')
  final String document;

  /// A signature which can be used to verify the accuracy and authenticity of the
  /// information provided in the instance identity document.
  @_s.JsonKey(name: 'signature')
  final String signature;

  InstanceIdentity({
    this.document,
    this.signature,
  });
  Map<String, dynamic> toJson() => _$InstanceIdentityToJson(this);
}

/// An internal service error occurred.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InternalServiceError implements _s.AwsException {
  /// Description of the error message.
  @_s.JsonKey(name: 'message')
  final String message;

  InternalServiceError({
    this.message,
  });
  factory InternalServiceError.fromJson(Map<String, dynamic> json) =>
      _$InternalServiceErrorFromJson(json);
}

/// The request was not valid. Verify that your request was properly formatted,
/// that the signature was generated with the correct credentials, and that you
/// haven't exceeded any of the service limits for your account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InvalidRequestException implements _s.AwsException {
  /// Description of the error message.
  @_s.JsonKey(name: 'message')
  final String message;

  InvalidRequestException({
    this.message,
  });
  factory InvalidRequestException.fromJson(Map<String, dynamic> json) =>
      _$InvalidRequestExceptionFromJson(json);
}

/// Contains the output of ListPipelines.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListPipelinesOutput {
  /// The pipeline identifiers. If you require additional information about the
  /// pipelines, you can use these identifiers to call <a>DescribePipelines</a>
  /// and <a>GetPipelineDefinition</a>.
  @_s.JsonKey(name: 'pipelineIdList')
  final List<PipelineIdName> pipelineIdList;

  /// Indicates whether there are more results that can be obtained by a
  /// subsequent call.
  @_s.JsonKey(name: 'hasMoreResults')
  final bool hasMoreResults;

  /// The starting point for the next page of results. To view the next page of
  /// results, call <code>ListPipelinesOutput</code> again with this marker value.
  /// If the value is null, there are no more results.
  @_s.JsonKey(name: 'marker')
  final String marker;

  ListPipelinesOutput({
    @_s.required this.pipelineIdList,
    this.hasMoreResults,
    this.marker,
  });
  factory ListPipelinesOutput.fromJson(Map<String, dynamic> json) =>
      _$ListPipelinesOutputFromJson(json);
}

/// Contains a logical operation for comparing the value of a field with a
/// specified value.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Operator {
  /// The logical operation to be performed: equal (<code>EQ</code>), equal
  /// reference (<code>REF_EQ</code>), less than or equal (<code>LE</code>),
  /// greater than or equal (<code>GE</code>), or between (<code>BETWEEN</code>).
  /// Equal reference (<code>REF_EQ</code>) can be used only with reference
  /// fields. The other comparison types can be used only with String fields. The
  /// comparison types you can use apply only to certain object fields, as
  /// detailed below.
  ///
  /// The comparison operators EQ and REF_EQ act on the following fields:
  ///
  /// <ul>
  /// <li>name</li>
  /// <li>@sphere</li>
  /// <li>parent</li>
  /// <li>@componentParent</li>
  /// <li>@instanceParent</li>
  /// <li>@status</li>
  /// <li>@scheduledStartTime</li>
  /// <li>@scheduledEndTime</li>
  /// <li>@actualStartTime</li>
  /// <li>@actualEndTime</li>
  /// </ul>
  /// The comparison operators <code>GE</code>, <code>LE</code>, and
  /// <code>BETWEEN</code> act on the following fields:
  ///
  /// <ul>
  /// <li>@scheduledStartTime</li>
  /// <li>@scheduledEndTime</li>
  /// <li>@actualStartTime</li>
  /// <li>@actualEndTime</li>
  /// </ul>
  /// Note that fields beginning with the at sign (@) are read-only and set by the
  /// web service. When you name fields, you should choose names containing only
  /// alpha-numeric values, as symbols may be reserved by AWS Data Pipeline.
  /// User-defined fields that you add to a pipeline should prefix their name with
  /// the string "my".
  @_s.JsonKey(name: 'type')
  final OperatorType type;

  /// The value that the actual field value will be compared with.
  @_s.JsonKey(name: 'values')
  final List<String> values;

  Operator({
    this.type,
    this.values,
  });
  Map<String, dynamic> toJson() => _$OperatorToJson(this);
}

enum OperatorType {
  @_s.JsonValue('EQ')
  eq,
  @_s.JsonValue('REF_EQ')
  refEq,
  @_s.JsonValue('LE')
  le,
  @_s.JsonValue('GE')
  ge,
  @_s.JsonValue('BETWEEN')
  between,
}

/// The attributes allowed or specified with a parameter object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ParameterAttribute {
  /// The field identifier.
  @_s.JsonKey(name: 'key')
  final String key;

  /// The field value, expressed as a String.
  @_s.JsonKey(name: 'stringValue')
  final String stringValue;

  ParameterAttribute({
    @_s.required this.key,
    @_s.required this.stringValue,
  });
  factory ParameterAttribute.fromJson(Map<String, dynamic> json) =>
      _$ParameterAttributeFromJson(json);

  Map<String, dynamic> toJson() => _$ParameterAttributeToJson(this);
}

/// Contains information about a parameter object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ParameterObject {
  /// The attributes of the parameter object.
  @_s.JsonKey(name: 'attributes')
  final List<ParameterAttribute> attributes;

  /// The ID of the parameter object.
  @_s.JsonKey(name: 'id')
  final String id;

  ParameterObject({
    @_s.required this.attributes,
    @_s.required this.id,
  });
  factory ParameterObject.fromJson(Map<String, dynamic> json) =>
      _$ParameterObjectFromJson(json);

  Map<String, dynamic> toJson() => _$ParameterObjectToJson(this);
}

/// A value or list of parameter values.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ParameterValue {
  /// The ID of the parameter value.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The field value, expressed as a String.
  @_s.JsonKey(name: 'stringValue')
  final String stringValue;

  ParameterValue({
    @_s.required this.id,
    @_s.required this.stringValue,
  });
  factory ParameterValue.fromJson(Map<String, dynamic> json) =>
      _$ParameterValueFromJson(json);

  Map<String, dynamic> toJson() => _$ParameterValueToJson(this);
}

/// The specified pipeline has been deleted.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PipelineDeletedException implements _s.AwsException {
  /// Description of the error message.
  @_s.JsonKey(name: 'message')
  final String message;

  PipelineDeletedException({
    this.message,
  });
  factory PipelineDeletedException.fromJson(Map<String, dynamic> json) =>
      _$PipelineDeletedExceptionFromJson(json);
}

/// Contains pipeline metadata.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PipelineDescription {
  /// A list of read-only fields that contain metadata about the pipeline:
  /// @userId, @accountId, and @pipelineState.
  @_s.JsonKey(name: 'fields')
  final List<Field> fields;

  /// The name of the pipeline.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The pipeline identifier that was assigned by AWS Data Pipeline. This is a
  /// string of the form <code>df-297EG78HU43EEXAMPLE</code>.
  @_s.JsonKey(name: 'pipelineId')
  final String pipelineId;

  /// Description of the pipeline.
  @_s.JsonKey(name: 'description')
  final String description;

  /// A list of tags to associated with a pipeline. Tags let you control access to
  /// pipelines. For more information, see <a
  /// href="http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-control-access.html">Controlling
  /// User Access to Pipelines</a> in the <i>AWS Data Pipeline Developer
  /// Guide</i>.
  @_s.JsonKey(name: 'tags')
  final List<Tag> tags;

  PipelineDescription({
    @_s.required this.fields,
    @_s.required this.name,
    @_s.required this.pipelineId,
    this.description,
    this.tags,
  });
  factory PipelineDescription.fromJson(Map<String, dynamic> json) =>
      _$PipelineDescriptionFromJson(json);
}

/// Contains the name and identifier of a pipeline.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PipelineIdName {
  /// The ID of the pipeline that was assigned by AWS Data Pipeline. This is a
  /// string of the form <code>df-297EG78HU43EEXAMPLE</code>.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The name of the pipeline.
  @_s.JsonKey(name: 'name')
  final String name;

  PipelineIdName({
    this.id,
    this.name,
  });
  factory PipelineIdName.fromJson(Map<String, dynamic> json) =>
      _$PipelineIdNameFromJson(json);
}

/// The specified pipeline was not found. Verify that you used the correct user
/// and account identifiers.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PipelineNotFoundException implements _s.AwsException {
  /// Description of the error message.
  @_s.JsonKey(name: 'message')
  final String message;

  PipelineNotFoundException({
    this.message,
  });
  factory PipelineNotFoundException.fromJson(Map<String, dynamic> json) =>
      _$PipelineNotFoundExceptionFromJson(json);
}

/// Contains information about a pipeline object. This can be a logical,
/// physical, or physical attempt pipeline object. The complete set of
/// components of a pipeline defines the pipeline.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PipelineObject {
  /// Key-value pairs that define the properties of the object.
  @_s.JsonKey(name: 'fields')
  final List<Field> fields;

  /// The ID of the object.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The name of the object.
  @_s.JsonKey(name: 'name')
  final String name;

  PipelineObject({
    @_s.required this.fields,
    @_s.required this.id,
    @_s.required this.name,
  });
  factory PipelineObject.fromJson(Map<String, dynamic> json) =>
      _$PipelineObjectFromJson(json);

  Map<String, dynamic> toJson() => _$PipelineObjectToJson(this);
}

/// Contains the output of PollForTask.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PollForTaskOutput {
  /// The information needed to complete the task that is being assigned to the
  /// task runner. One of the fields returned in this object is
  /// <code>taskId</code>, which contains an identifier for the task being
  /// assigned. The calling task runner uses <code>taskId</code> in subsequent
  /// calls to <a>ReportTaskProgress</a> and <a>SetTaskStatus</a>.
  @_s.JsonKey(name: 'taskObject')
  final TaskObject taskObject;

  PollForTaskOutput({
    this.taskObject,
  });
  factory PollForTaskOutput.fromJson(Map<String, dynamic> json) =>
      _$PollForTaskOutputFromJson(json);
}

/// Contains the output of PutPipelineDefinition.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutPipelineDefinitionOutput {
  /// Indicates whether there were validation errors, and the pipeline definition
  /// is stored but cannot be activated until you correct the pipeline and call
  /// <code>PutPipelineDefinition</code> to commit the corrected pipeline.
  @_s.JsonKey(name: 'errored')
  final bool errored;

  /// The validation errors that are associated with the objects defined in
  /// <code>pipelineObjects</code>.
  @_s.JsonKey(name: 'validationErrors')
  final List<ValidationError> validationErrors;

  /// The validation warnings that are associated with the objects defined in
  /// <code>pipelineObjects</code>.
  @_s.JsonKey(name: 'validationWarnings')
  final List<ValidationWarning> validationWarnings;

  PutPipelineDefinitionOutput({
    @_s.required this.errored,
    this.validationErrors,
    this.validationWarnings,
  });
  factory PutPipelineDefinitionOutput.fromJson(Map<String, dynamic> json) =>
      _$PutPipelineDefinitionOutputFromJson(json);
}

/// Defines the query to run against an object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Query {
  /// List of selectors that define the query. An object must satisfy all of the
  /// selectors to match the query.
  @_s.JsonKey(name: 'selectors')
  final List<Selector> selectors;

  Query({
    this.selectors,
  });
  Map<String, dynamic> toJson() => _$QueryToJson(this);
}

/// Contains the output of QueryObjects.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class QueryObjectsOutput {
  /// Indicates whether there are more results that can be obtained by a
  /// subsequent call.
  @_s.JsonKey(name: 'hasMoreResults')
  final bool hasMoreResults;

  /// The identifiers that match the query selectors.
  @_s.JsonKey(name: 'ids')
  final List<String> ids;

  /// The starting point for the next page of results. To view the next page of
  /// results, call <code>QueryObjects</code> again with this marker value. If the
  /// value is null, there are no more results.
  @_s.JsonKey(name: 'marker')
  final String marker;

  QueryObjectsOutput({
    this.hasMoreResults,
    this.ids,
    this.marker,
  });
  factory QueryObjectsOutput.fromJson(Map<String, dynamic> json) =>
      _$QueryObjectsOutputFromJson(json);
}

/// Contains the output of RemoveTags.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RemoveTagsOutput {
  RemoveTagsOutput();
  factory RemoveTagsOutput.fromJson(Map<String, dynamic> json) =>
      _$RemoveTagsOutputFromJson(json);
}

/// Contains the output of ReportTaskProgress.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReportTaskProgressOutput {
  /// If true, the calling task runner should cancel processing of the task. The
  /// task runner does not need to call <a>SetTaskStatus</a> for canceled tasks.
  @_s.JsonKey(name: 'canceled')
  final bool canceled;

  ReportTaskProgressOutput({
    @_s.required this.canceled,
  });
  factory ReportTaskProgressOutput.fromJson(Map<String, dynamic> json) =>
      _$ReportTaskProgressOutputFromJson(json);
}

/// Contains the output of ReportTaskRunnerHeartbeat.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReportTaskRunnerHeartbeatOutput {
  /// Indicates whether the calling task runner should terminate.
  @_s.JsonKey(name: 'terminate')
  final bool terminate;

  ReportTaskRunnerHeartbeatOutput({
    @_s.required this.terminate,
  });
  factory ReportTaskRunnerHeartbeatOutput.fromJson(Map<String, dynamic> json) =>
      _$ReportTaskRunnerHeartbeatOutputFromJson(json);
}

/// A comparision that is used to determine whether a query should return this
/// object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Selector {
  /// The name of the field that the operator will be applied to. The field name
  /// is the "key" portion of the field definition in the pipeline definition
  /// syntax that is used by the AWS Data Pipeline API. If the field is not set on
  /// the object, the condition fails.
  @_s.JsonKey(name: 'fieldName')
  final String fieldName;
  @_s.JsonKey(name: 'operator')
  final Operator operator;

  Selector({
    this.fieldName,
    this.operator,
  });
  Map<String, dynamic> toJson() => _$SelectorToJson(this);
}

/// Contains the output of SetTaskStatus.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SetTaskStatusOutput {
  SetTaskStatusOutput();
  factory SetTaskStatusOutput.fromJson(Map<String, dynamic> json) =>
      _$SetTaskStatusOutputFromJson(json);
}

/// Tags are key/value pairs defined by a user and associated with a pipeline to
/// control access. AWS Data Pipeline allows you to associate ten tags per
/// pipeline. For more information, see <a
/// href="http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-control-access.html">Controlling
/// User Access to Pipelines</a> in the <i>AWS Data Pipeline Developer
/// Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// The key name of a tag defined by a user. For more information, see <a
  /// href="http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-control-access.html">Controlling
  /// User Access to Pipelines</a> in the <i>AWS Data Pipeline Developer
  /// Guide</i>.
  @_s.JsonKey(name: 'key')
  final String key;

  /// The optional value portion of a tag defined by a user. For more information,
  /// see <a
  /// href="http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-control-access.html">Controlling
  /// User Access to Pipelines</a> in the <i>AWS Data Pipeline Developer
  /// Guide</i>.
  @_s.JsonKey(name: 'value')
  final String value;

  Tag({
    @_s.required this.key,
    @_s.required this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

/// The specified task was not found.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TaskNotFoundException implements _s.AwsException {
  /// Description of the error message.
  @_s.JsonKey(name: 'message')
  final String message;

  TaskNotFoundException({
    this.message,
  });
  factory TaskNotFoundException.fromJson(Map<String, dynamic> json) =>
      _$TaskNotFoundExceptionFromJson(json);
}

/// Contains information about a pipeline task that is assigned to a task
/// runner.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TaskObject {
  /// The ID of the pipeline task attempt object. AWS Data Pipeline uses this
  /// value to track how many times a task is attempted.
  @_s.JsonKey(name: 'attemptId')
  final String attemptId;

  /// Connection information for the location where the task runner will publish
  /// the output of the task.
  @_s.JsonKey(name: 'objects')
  final Map<String, PipelineObject> objects;

  /// The ID of the pipeline that provided the task.
  @_s.JsonKey(name: 'pipelineId')
  final String pipelineId;

  /// An internal identifier for the task. This ID is passed to the
  /// <a>SetTaskStatus</a> and <a>ReportTaskProgress</a> actions.
  @_s.JsonKey(name: 'taskId')
  final String taskId;

  TaskObject({
    this.attemptId,
    this.objects,
    this.pipelineId,
    this.taskId,
  });
  factory TaskObject.fromJson(Map<String, dynamic> json) =>
      _$TaskObjectFromJson(json);
}

enum TaskStatus {
  @_s.JsonValue('FINISHED')
  finished,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('FALSE')
  $false,
}

extension on TaskStatus {
  String toValue() {
    switch (this) {
      case TaskStatus.finished:
        return 'FINISHED';
      case TaskStatus.failed:
        return 'FAILED';
      case TaskStatus.$false:
        return 'FALSE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Contains the output of ValidatePipelineDefinition.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ValidatePipelineDefinitionOutput {
  /// Indicates whether there were validation errors.
  @_s.JsonKey(name: 'errored')
  final bool errored;

  /// Any validation errors that were found.
  @_s.JsonKey(name: 'validationErrors')
  final List<ValidationError> validationErrors;

  /// Any validation warnings that were found.
  @_s.JsonKey(name: 'validationWarnings')
  final List<ValidationWarning> validationWarnings;

  ValidatePipelineDefinitionOutput({
    @_s.required this.errored,
    this.validationErrors,
    this.validationWarnings,
  });
  factory ValidatePipelineDefinitionOutput.fromJson(
          Map<String, dynamic> json) =>
      _$ValidatePipelineDefinitionOutputFromJson(json);
}

/// Defines a validation error. Validation errors prevent pipeline activation.
/// The set of validation errors that can be returned are defined by AWS Data
/// Pipeline.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ValidationError {
  /// A description of the validation error.
  @_s.JsonKey(name: 'errors')
  final List<String> errors;

  /// The identifier of the object that contains the validation error.
  @_s.JsonKey(name: 'id')
  final String id;

  ValidationError({
    this.errors,
    this.id,
  });
  factory ValidationError.fromJson(Map<String, dynamic> json) =>
      _$ValidationErrorFromJson(json);
}

/// Defines a validation warning. Validation warnings do not prevent pipeline
/// activation. The set of validation warnings that can be returned are defined
/// by AWS Data Pipeline.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ValidationWarning {
  /// The identifier of the object that contains the validation warning.
  @_s.JsonKey(name: 'id')
  final String id;

  /// A description of the validation warning.
  @_s.JsonKey(name: 'warnings')
  final List<String> warnings;

  ValidationWarning({
    this.id,
    this.warnings,
  });
  factory ValidationWarning.fromJson(Map<String, dynamic> json) =>
      _$ValidationWarningFromJson(json);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'InternalServiceError': (type, message) =>
      InternalServiceError(message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(message: message),
  'PipelineDeletedException': (type, message) =>
      PipelineDeletedException(message: message),
  'PipelineNotFoundException': (type, message) =>
      PipelineNotFoundException(message: message),
  'TaskNotFoundException': (type, message) =>
      TaskNotFoundException(message: message),
};
