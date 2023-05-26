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
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'datapipeline',
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
    required String pipelineId,
    List<ParameterValue>? parameterValues,
    DateTime? startTimestamp,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DataPipeline.ActivatePipeline'
    };
    await _protocol.send(
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
    required String pipelineId,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DataPipeline.AddTags'
    };
    await _protocol.send(
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
    required String name,
    required String uniqueId,
    String? description,
    List<Tag>? tags,
  }) async {
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
    required String pipelineId,
    bool? cancelActive,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DataPipeline.DeactivatePipeline'
    };
    await _protocol.send(
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
    required String pipelineId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DataPipeline.DeletePipeline'
    };
    await _protocol.send(
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
    required List<String> objectIds,
    required String pipelineId,
    bool? evaluateExpressions,
    String? marker,
  }) async {
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
    required List<String> pipelineIds,
  }) async {
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
    required String expression,
    required String objectId,
    required String pipelineId,
  }) async {
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
    required String pipelineId,
    String? version,
  }) async {
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
    String? marker,
  }) async {
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
    required String workerGroup,
    String? hostname,
    InstanceIdentity? instanceIdentity,
  }) async {
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
    required String pipelineId,
    required List<PipelineObject> pipelineObjects,
    List<ParameterObject>? parameterObjects,
    List<ParameterValue>? parameterValues,
  }) async {
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
    required String pipelineId,
    required String sphere,
    int? limit,
    String? marker,
    Query? query,
  }) async {
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
    required String pipelineId,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DataPipeline.RemoveTags'
    };
    await _protocol.send(
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
    required String taskId,
    List<Field>? fields,
  }) async {
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
    required String taskrunnerId,
    String? hostname,
    String? workerGroup,
  }) async {
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
    required List<String> objectIds,
    required String pipelineId,
    required String status,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DataPipeline.SetStatus'
    };
    await _protocol.send(
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
    required String taskId,
    required TaskStatus taskStatus,
    String? errorId,
    String? errorMessage,
    String? errorStackTrace,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'DataPipeline.SetTaskStatus'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'taskId': taskId,
        'taskStatus': taskStatus.toValue(),
        if (errorId != null) 'errorId': errorId,
        if (errorMessage != null) 'errorMessage': errorMessage,
        if (errorStackTrace != null) 'errorStackTrace': errorStackTrace,
      },
    );
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
    required String pipelineId,
    required List<PipelineObject> pipelineObjects,
    List<ParameterObject>? parameterObjects,
    List<ParameterValue>? parameterValues,
  }) async {
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
class ActivatePipelineOutput {
  ActivatePipelineOutput();

  factory ActivatePipelineOutput.fromJson(Map<String, dynamic> _) {
    return ActivatePipelineOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains the output of AddTags.
class AddTagsOutput {
  AddTagsOutput();

  factory AddTagsOutput.fromJson(Map<String, dynamic> _) {
    return AddTagsOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains the output of CreatePipeline.
class CreatePipelineOutput {
  /// The ID that AWS Data Pipeline assigns the newly created pipeline. For
  /// example, <code>df-06372391ZG65EXAMPLE</code>.
  final String pipelineId;

  CreatePipelineOutput({
    required this.pipelineId,
  });

  factory CreatePipelineOutput.fromJson(Map<String, dynamic> json) {
    return CreatePipelineOutput(
      pipelineId: json['pipelineId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final pipelineId = this.pipelineId;
    return {
      'pipelineId': pipelineId,
    };
  }
}

/// Contains the output of DeactivatePipeline.
class DeactivatePipelineOutput {
  DeactivatePipelineOutput();

  factory DeactivatePipelineOutput.fromJson(Map<String, dynamic> _) {
    return DeactivatePipelineOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains the output of DescribeObjects.
class DescribeObjectsOutput {
  /// An array of object definitions.
  final List<PipelineObject> pipelineObjects;

  /// Indicates whether there are more results to return.
  final bool? hasMoreResults;

  /// The starting point for the next page of results. To view the next page of
  /// results, call <code>DescribeObjects</code> again with this marker value. If
  /// the value is null, there are no more results.
  final String? marker;

  DescribeObjectsOutput({
    required this.pipelineObjects,
    this.hasMoreResults,
    this.marker,
  });

  factory DescribeObjectsOutput.fromJson(Map<String, dynamic> json) {
    return DescribeObjectsOutput(
      pipelineObjects: (json['pipelineObjects'] as List)
          .whereNotNull()
          .map((e) => PipelineObject.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasMoreResults: json['hasMoreResults'] as bool?,
      marker: json['marker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final pipelineObjects = this.pipelineObjects;
    final hasMoreResults = this.hasMoreResults;
    final marker = this.marker;
    return {
      'pipelineObjects': pipelineObjects,
      if (hasMoreResults != null) 'hasMoreResults': hasMoreResults,
      if (marker != null) 'marker': marker,
    };
  }
}

/// Contains the output of DescribePipelines.
class DescribePipelinesOutput {
  /// An array of descriptions for the specified pipelines.
  final List<PipelineDescription> pipelineDescriptionList;

  DescribePipelinesOutput({
    required this.pipelineDescriptionList,
  });

  factory DescribePipelinesOutput.fromJson(Map<String, dynamic> json) {
    return DescribePipelinesOutput(
      pipelineDescriptionList: (json['pipelineDescriptionList'] as List)
          .whereNotNull()
          .map((e) => PipelineDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final pipelineDescriptionList = this.pipelineDescriptionList;
    return {
      'pipelineDescriptionList': pipelineDescriptionList,
    };
  }
}

/// Contains the output of EvaluateExpression.
class EvaluateExpressionOutput {
  /// The evaluated expression.
  final String evaluatedExpression;

  EvaluateExpressionOutput({
    required this.evaluatedExpression,
  });

  factory EvaluateExpressionOutput.fromJson(Map<String, dynamic> json) {
    return EvaluateExpressionOutput(
      evaluatedExpression: json['evaluatedExpression'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final evaluatedExpression = this.evaluatedExpression;
    return {
      'evaluatedExpression': evaluatedExpression,
    };
  }
}

/// A key-value pair that describes a property of a pipeline object. The value
/// is specified as either a string value (<code>StringValue</code>) or a
/// reference to another object (<code>RefValue</code>) but not as both.
class Field {
  /// The field identifier.
  final String key;

  /// The field value, expressed as the identifier of another object.
  final String? refValue;

  /// The field value, expressed as a String.
  final String? stringValue;

  Field({
    required this.key,
    this.refValue,
    this.stringValue,
  });

  factory Field.fromJson(Map<String, dynamic> json) {
    return Field(
      key: json['key'] as String,
      refValue: json['refValue'] as String?,
      stringValue: json['stringValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final refValue = this.refValue;
    final stringValue = this.stringValue;
    return {
      'key': key,
      if (refValue != null) 'refValue': refValue,
      if (stringValue != null) 'stringValue': stringValue,
    };
  }
}

/// Contains the output of GetPipelineDefinition.
class GetPipelineDefinitionOutput {
  /// The parameter objects used in the pipeline definition.
  final List<ParameterObject>? parameterObjects;

  /// The parameter values used in the pipeline definition.
  final List<ParameterValue>? parameterValues;

  /// The objects defined in the pipeline.
  final List<PipelineObject>? pipelineObjects;

  GetPipelineDefinitionOutput({
    this.parameterObjects,
    this.parameterValues,
    this.pipelineObjects,
  });

  factory GetPipelineDefinitionOutput.fromJson(Map<String, dynamic> json) {
    return GetPipelineDefinitionOutput(
      parameterObjects: (json['parameterObjects'] as List?)
          ?.whereNotNull()
          .map((e) => ParameterObject.fromJson(e as Map<String, dynamic>))
          .toList(),
      parameterValues: (json['parameterValues'] as List?)
          ?.whereNotNull()
          .map((e) => ParameterValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      pipelineObjects: (json['pipelineObjects'] as List?)
          ?.whereNotNull()
          .map((e) => PipelineObject.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final parameterObjects = this.parameterObjects;
    final parameterValues = this.parameterValues;
    final pipelineObjects = this.pipelineObjects;
    return {
      if (parameterObjects != null) 'parameterObjects': parameterObjects,
      if (parameterValues != null) 'parameterValues': parameterValues,
      if (pipelineObjects != null) 'pipelineObjects': pipelineObjects,
    };
  }
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
class InstanceIdentity {
  /// A description of an EC2 instance that is generated when the instance is
  /// launched and exposed to the instance via the instance metadata service in
  /// the form of a JSON representation of an object.
  final String? document;

  /// A signature which can be used to verify the accuracy and authenticity of the
  /// information provided in the instance identity document.
  final String? signature;

  InstanceIdentity({
    this.document,
    this.signature,
  });

  Map<String, dynamic> toJson() {
    final document = this.document;
    final signature = this.signature;
    return {
      if (document != null) 'document': document,
      if (signature != null) 'signature': signature,
    };
  }
}

/// Contains the output of ListPipelines.
class ListPipelinesOutput {
  /// The pipeline identifiers. If you require additional information about the
  /// pipelines, you can use these identifiers to call <a>DescribePipelines</a>
  /// and <a>GetPipelineDefinition</a>.
  final List<PipelineIdName> pipelineIdList;

  /// Indicates whether there are more results that can be obtained by a
  /// subsequent call.
  final bool? hasMoreResults;

  /// The starting point for the next page of results. To view the next page of
  /// results, call <code>ListPipelinesOutput</code> again with this marker value.
  /// If the value is null, there are no more results.
  final String? marker;

  ListPipelinesOutput({
    required this.pipelineIdList,
    this.hasMoreResults,
    this.marker,
  });

  factory ListPipelinesOutput.fromJson(Map<String, dynamic> json) {
    return ListPipelinesOutput(
      pipelineIdList: (json['pipelineIdList'] as List)
          .whereNotNull()
          .map((e) => PipelineIdName.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasMoreResults: json['hasMoreResults'] as bool?,
      marker: json['marker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final pipelineIdList = this.pipelineIdList;
    final hasMoreResults = this.hasMoreResults;
    final marker = this.marker;
    return {
      'pipelineIdList': pipelineIdList,
      if (hasMoreResults != null) 'hasMoreResults': hasMoreResults,
      if (marker != null) 'marker': marker,
    };
  }
}

/// Contains a logical operation for comparing the value of a field with a
/// specified value.
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
  final OperatorType? type;

  /// The value that the actual field value will be compared with.
  final List<String>? values;

  Operator({
    this.type,
    this.values,
  });

  Map<String, dynamic> toJson() {
    final type = this.type;
    final values = this.values;
    return {
      if (type != null) 'type': type.toValue(),
      if (values != null) 'values': values,
    };
  }
}

enum OperatorType {
  eq,
  refEq,
  le,
  ge,
  between,
}

extension OperatorTypeValueExtension on OperatorType {
  String toValue() {
    switch (this) {
      case OperatorType.eq:
        return 'EQ';
      case OperatorType.refEq:
        return 'REF_EQ';
      case OperatorType.le:
        return 'LE';
      case OperatorType.ge:
        return 'GE';
      case OperatorType.between:
        return 'BETWEEN';
    }
  }
}

extension OperatorTypeFromString on String {
  OperatorType toOperatorType() {
    switch (this) {
      case 'EQ':
        return OperatorType.eq;
      case 'REF_EQ':
        return OperatorType.refEq;
      case 'LE':
        return OperatorType.le;
      case 'GE':
        return OperatorType.ge;
      case 'BETWEEN':
        return OperatorType.between;
    }
    throw Exception('$this is not known in enum OperatorType');
  }
}

/// The attributes allowed or specified with a parameter object.
class ParameterAttribute {
  /// The field identifier.
  final String key;

  /// The field value, expressed as a String.
  final String stringValue;

  ParameterAttribute({
    required this.key,
    required this.stringValue,
  });

  factory ParameterAttribute.fromJson(Map<String, dynamic> json) {
    return ParameterAttribute(
      key: json['key'] as String,
      stringValue: json['stringValue'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final stringValue = this.stringValue;
    return {
      'key': key,
      'stringValue': stringValue,
    };
  }
}

/// Contains information about a parameter object.
class ParameterObject {
  /// The attributes of the parameter object.
  final List<ParameterAttribute> attributes;

  /// The ID of the parameter object.
  final String id;

  ParameterObject({
    required this.attributes,
    required this.id,
  });

  factory ParameterObject.fromJson(Map<String, dynamic> json) {
    return ParameterObject(
      attributes: (json['attributes'] as List)
          .whereNotNull()
          .map((e) => ParameterAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final id = this.id;
    return {
      'attributes': attributes,
      'id': id,
    };
  }
}

/// A value or list of parameter values.
class ParameterValue {
  /// The ID of the parameter value.
  final String id;

  /// The field value, expressed as a String.
  final String stringValue;

  ParameterValue({
    required this.id,
    required this.stringValue,
  });

  factory ParameterValue.fromJson(Map<String, dynamic> json) {
    return ParameterValue(
      id: json['id'] as String,
      stringValue: json['stringValue'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final stringValue = this.stringValue;
    return {
      'id': id,
      'stringValue': stringValue,
    };
  }
}

/// Contains pipeline metadata.
class PipelineDescription {
  /// A list of read-only fields that contain metadata about the pipeline:
  /// @userId, @accountId, and @pipelineState.
  final List<Field> fields;

  /// The name of the pipeline.
  final String name;

  /// The pipeline identifier that was assigned by AWS Data Pipeline. This is a
  /// string of the form <code>df-297EG78HU43EEXAMPLE</code>.
  final String pipelineId;

  /// Description of the pipeline.
  final String? description;

  /// A list of tags to associated with a pipeline. Tags let you control access to
  /// pipelines. For more information, see <a
  /// href="http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-control-access.html">Controlling
  /// User Access to Pipelines</a> in the <i>AWS Data Pipeline Developer
  /// Guide</i>.
  final List<Tag>? tags;

  PipelineDescription({
    required this.fields,
    required this.name,
    required this.pipelineId,
    this.description,
    this.tags,
  });

  factory PipelineDescription.fromJson(Map<String, dynamic> json) {
    return PipelineDescription(
      fields: (json['fields'] as List)
          .whereNotNull()
          .map((e) => Field.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String,
      pipelineId: json['pipelineId'] as String,
      description: json['description'] as String?,
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final fields = this.fields;
    final name = this.name;
    final pipelineId = this.pipelineId;
    final description = this.description;
    final tags = this.tags;
    return {
      'fields': fields,
      'name': name,
      'pipelineId': pipelineId,
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Contains the name and identifier of a pipeline.
class PipelineIdName {
  /// The ID of the pipeline that was assigned by AWS Data Pipeline. This is a
  /// string of the form <code>df-297EG78HU43EEXAMPLE</code>.
  final String? id;

  /// The name of the pipeline.
  final String? name;

  PipelineIdName({
    this.id,
    this.name,
  });

  factory PipelineIdName.fromJson(Map<String, dynamic> json) {
    return PipelineIdName(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final name = this.name;
    return {
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    };
  }
}

/// Contains information about a pipeline object. This can be a logical,
/// physical, or physical attempt pipeline object. The complete set of
/// components of a pipeline defines the pipeline.
class PipelineObject {
  /// Key-value pairs that define the properties of the object.
  final List<Field> fields;

  /// The ID of the object.
  final String id;

  /// The name of the object.
  final String name;

  PipelineObject({
    required this.fields,
    required this.id,
    required this.name,
  });

  factory PipelineObject.fromJson(Map<String, dynamic> json) {
    return PipelineObject(
      fields: (json['fields'] as List)
          .whereNotNull()
          .map((e) => Field.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final fields = this.fields;
    final id = this.id;
    final name = this.name;
    return {
      'fields': fields,
      'id': id,
      'name': name,
    };
  }
}

/// Contains the output of PollForTask.
class PollForTaskOutput {
  /// The information needed to complete the task that is being assigned to the
  /// task runner. One of the fields returned in this object is
  /// <code>taskId</code>, which contains an identifier for the task being
  /// assigned. The calling task runner uses <code>taskId</code> in subsequent
  /// calls to <a>ReportTaskProgress</a> and <a>SetTaskStatus</a>.
  final TaskObject? taskObject;

  PollForTaskOutput({
    this.taskObject,
  });

  factory PollForTaskOutput.fromJson(Map<String, dynamic> json) {
    return PollForTaskOutput(
      taskObject: json['taskObject'] != null
          ? TaskObject.fromJson(json['taskObject'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final taskObject = this.taskObject;
    return {
      if (taskObject != null) 'taskObject': taskObject,
    };
  }
}

/// Contains the output of PutPipelineDefinition.
class PutPipelineDefinitionOutput {
  /// Indicates whether there were validation errors, and the pipeline definition
  /// is stored but cannot be activated until you correct the pipeline and call
  /// <code>PutPipelineDefinition</code> to commit the corrected pipeline.
  final bool errored;

  /// The validation errors that are associated with the objects defined in
  /// <code>pipelineObjects</code>.
  final List<ValidationError>? validationErrors;

  /// The validation warnings that are associated with the objects defined in
  /// <code>pipelineObjects</code>.
  final List<ValidationWarning>? validationWarnings;

  PutPipelineDefinitionOutput({
    required this.errored,
    this.validationErrors,
    this.validationWarnings,
  });

  factory PutPipelineDefinitionOutput.fromJson(Map<String, dynamic> json) {
    return PutPipelineDefinitionOutput(
      errored: json['errored'] as bool,
      validationErrors: (json['validationErrors'] as List?)
          ?.whereNotNull()
          .map((e) => ValidationError.fromJson(e as Map<String, dynamic>))
          .toList(),
      validationWarnings: (json['validationWarnings'] as List?)
          ?.whereNotNull()
          .map((e) => ValidationWarning.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errored = this.errored;
    final validationErrors = this.validationErrors;
    final validationWarnings = this.validationWarnings;
    return {
      'errored': errored,
      if (validationErrors != null) 'validationErrors': validationErrors,
      if (validationWarnings != null) 'validationWarnings': validationWarnings,
    };
  }
}

/// Defines the query to run against an object.
class Query {
  /// List of selectors that define the query. An object must satisfy all of the
  /// selectors to match the query.
  final List<Selector>? selectors;

  Query({
    this.selectors,
  });

  Map<String, dynamic> toJson() {
    final selectors = this.selectors;
    return {
      if (selectors != null) 'selectors': selectors,
    };
  }
}

/// Contains the output of QueryObjects.
class QueryObjectsOutput {
  /// Indicates whether there are more results that can be obtained by a
  /// subsequent call.
  final bool? hasMoreResults;

  /// The identifiers that match the query selectors.
  final List<String>? ids;

  /// The starting point for the next page of results. To view the next page of
  /// results, call <code>QueryObjects</code> again with this marker value. If the
  /// value is null, there are no more results.
  final String? marker;

  QueryObjectsOutput({
    this.hasMoreResults,
    this.ids,
    this.marker,
  });

  factory QueryObjectsOutput.fromJson(Map<String, dynamic> json) {
    return QueryObjectsOutput(
      hasMoreResults: json['hasMoreResults'] as bool?,
      ids: (json['ids'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      marker: json['marker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final hasMoreResults = this.hasMoreResults;
    final ids = this.ids;
    final marker = this.marker;
    return {
      if (hasMoreResults != null) 'hasMoreResults': hasMoreResults,
      if (ids != null) 'ids': ids,
      if (marker != null) 'marker': marker,
    };
  }
}

/// Contains the output of RemoveTags.
class RemoveTagsOutput {
  RemoveTagsOutput();

  factory RemoveTagsOutput.fromJson(Map<String, dynamic> _) {
    return RemoveTagsOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains the output of ReportTaskProgress.
class ReportTaskProgressOutput {
  /// If true, the calling task runner should cancel processing of the task. The
  /// task runner does not need to call <a>SetTaskStatus</a> for canceled tasks.
  final bool canceled;

  ReportTaskProgressOutput({
    required this.canceled,
  });

  factory ReportTaskProgressOutput.fromJson(Map<String, dynamic> json) {
    return ReportTaskProgressOutput(
      canceled: json['canceled'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final canceled = this.canceled;
    return {
      'canceled': canceled,
    };
  }
}

/// Contains the output of ReportTaskRunnerHeartbeat.
class ReportTaskRunnerHeartbeatOutput {
  /// Indicates whether the calling task runner should terminate.
  final bool terminate;

  ReportTaskRunnerHeartbeatOutput({
    required this.terminate,
  });

  factory ReportTaskRunnerHeartbeatOutput.fromJson(Map<String, dynamic> json) {
    return ReportTaskRunnerHeartbeatOutput(
      terminate: json['terminate'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final terminate = this.terminate;
    return {
      'terminate': terminate,
    };
  }
}

/// A comparision that is used to determine whether a query should return this
/// object.
class Selector {
  /// The name of the field that the operator will be applied to. The field name
  /// is the "key" portion of the field definition in the pipeline definition
  /// syntax that is used by the AWS Data Pipeline API. If the field is not set on
  /// the object, the condition fails.
  final String? fieldName;
  final Operator? operator;

  Selector({
    this.fieldName,
    this.operator,
  });

  Map<String, dynamic> toJson() {
    final fieldName = this.fieldName;
    final operator = this.operator;
    return {
      if (fieldName != null) 'fieldName': fieldName,
      if (operator != null) 'operator': operator,
    };
  }
}

/// Contains the output of SetTaskStatus.
class SetTaskStatusOutput {
  SetTaskStatusOutput();

  factory SetTaskStatusOutput.fromJson(Map<String, dynamic> _) {
    return SetTaskStatusOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Tags are key/value pairs defined by a user and associated with a pipeline to
/// control access. AWS Data Pipeline allows you to associate ten tags per
/// pipeline. For more information, see <a
/// href="http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-control-access.html">Controlling
/// User Access to Pipelines</a> in the <i>AWS Data Pipeline Developer
/// Guide</i>.
class Tag {
  /// The key name of a tag defined by a user. For more information, see <a
  /// href="http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-control-access.html">Controlling
  /// User Access to Pipelines</a> in the <i>AWS Data Pipeline Developer
  /// Guide</i>.
  final String key;

  /// The optional value portion of a tag defined by a user. For more information,
  /// see <a
  /// href="http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-control-access.html">Controlling
  /// User Access to Pipelines</a> in the <i>AWS Data Pipeline Developer
  /// Guide</i>.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['key'] as String,
      value: json['value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'key': key,
      'value': value,
    };
  }
}

/// Contains information about a pipeline task that is assigned to a task
/// runner.
class TaskObject {
  /// The ID of the pipeline task attempt object. AWS Data Pipeline uses this
  /// value to track how many times a task is attempted.
  final String? attemptId;

  /// Connection information for the location where the task runner will publish
  /// the output of the task.
  final Map<String, PipelineObject>? objects;

  /// The ID of the pipeline that provided the task.
  final String? pipelineId;

  /// An internal identifier for the task. This ID is passed to the
  /// <a>SetTaskStatus</a> and <a>ReportTaskProgress</a> actions.
  final String? taskId;

  TaskObject({
    this.attemptId,
    this.objects,
    this.pipelineId,
    this.taskId,
  });

  factory TaskObject.fromJson(Map<String, dynamic> json) {
    return TaskObject(
      attemptId: json['attemptId'] as String?,
      objects: (json['objects'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, PipelineObject.fromJson(e as Map<String, dynamic>))),
      pipelineId: json['pipelineId'] as String?,
      taskId: json['taskId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attemptId = this.attemptId;
    final objects = this.objects;
    final pipelineId = this.pipelineId;
    final taskId = this.taskId;
    return {
      if (attemptId != null) 'attemptId': attemptId,
      if (objects != null) 'objects': objects,
      if (pipelineId != null) 'pipelineId': pipelineId,
      if (taskId != null) 'taskId': taskId,
    };
  }
}

enum TaskStatus {
  finished,
  failed,
  $false,
}

extension TaskStatusValueExtension on TaskStatus {
  String toValue() {
    switch (this) {
      case TaskStatus.finished:
        return 'FINISHED';
      case TaskStatus.failed:
        return 'FAILED';
      case TaskStatus.$false:
        return 'FALSE';
    }
  }
}

extension TaskStatusFromString on String {
  TaskStatus toTaskStatus() {
    switch (this) {
      case 'FINISHED':
        return TaskStatus.finished;
      case 'FAILED':
        return TaskStatus.failed;
      case 'FALSE':
        return TaskStatus.$false;
    }
    throw Exception('$this is not known in enum TaskStatus');
  }
}

/// Contains the output of ValidatePipelineDefinition.
class ValidatePipelineDefinitionOutput {
  /// Indicates whether there were validation errors.
  final bool errored;

  /// Any validation errors that were found.
  final List<ValidationError>? validationErrors;

  /// Any validation warnings that were found.
  final List<ValidationWarning>? validationWarnings;

  ValidatePipelineDefinitionOutput({
    required this.errored,
    this.validationErrors,
    this.validationWarnings,
  });

  factory ValidatePipelineDefinitionOutput.fromJson(Map<String, dynamic> json) {
    return ValidatePipelineDefinitionOutput(
      errored: json['errored'] as bool,
      validationErrors: (json['validationErrors'] as List?)
          ?.whereNotNull()
          .map((e) => ValidationError.fromJson(e as Map<String, dynamic>))
          .toList(),
      validationWarnings: (json['validationWarnings'] as List?)
          ?.whereNotNull()
          .map((e) => ValidationWarning.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errored = this.errored;
    final validationErrors = this.validationErrors;
    final validationWarnings = this.validationWarnings;
    return {
      'errored': errored,
      if (validationErrors != null) 'validationErrors': validationErrors,
      if (validationWarnings != null) 'validationWarnings': validationWarnings,
    };
  }
}

/// Defines a validation error. Validation errors prevent pipeline activation.
/// The set of validation errors that can be returned are defined by AWS Data
/// Pipeline.
class ValidationError {
  /// A description of the validation error.
  final List<String>? errors;

  /// The identifier of the object that contains the validation error.
  final String? id;

  ValidationError({
    this.errors,
    this.id,
  });

  factory ValidationError.fromJson(Map<String, dynamic> json) {
    return ValidationError(
      errors: (json['errors'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final id = this.id;
    return {
      if (errors != null) 'errors': errors,
      if (id != null) 'id': id,
    };
  }
}

/// Defines a validation warning. Validation warnings do not prevent pipeline
/// activation. The set of validation warnings that can be returned are defined
/// by AWS Data Pipeline.
class ValidationWarning {
  /// The identifier of the object that contains the validation warning.
  final String? id;

  /// A description of the validation warning.
  final List<String>? warnings;

  ValidationWarning({
    this.id,
    this.warnings,
  });

  factory ValidationWarning.fromJson(Map<String, dynamic> json) {
    return ValidationWarning(
      id: json['id'] as String?,
      warnings: (json['warnings'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final warnings = this.warnings;
    return {
      if (id != null) 'id': id,
      if (warnings != null) 'warnings': warnings,
    };
  }
}

class InternalServiceError extends _s.GenericAwsException {
  InternalServiceError({String? type, String? message})
      : super(type: type, code: 'InternalServiceError', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class PipelineDeletedException extends _s.GenericAwsException {
  PipelineDeletedException({String? type, String? message})
      : super(type: type, code: 'PipelineDeletedException', message: message);
}

class PipelineNotFoundException extends _s.GenericAwsException {
  PipelineNotFoundException({String? type, String? message})
      : super(type: type, code: 'PipelineNotFoundException', message: message);
}

class TaskNotFoundException extends _s.GenericAwsException {
  TaskNotFoundException({String? type, String? message})
      : super(type: type, code: 'TaskNotFoundException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'InternalServiceError': (type, message) =>
      InternalServiceError(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'PipelineDeletedException': (type, message) =>
      PipelineDeletedException(type: type, message: message),
  'PipelineNotFoundException': (type, message) =>
      PipelineNotFoundException(type: type, message: message),
  'TaskNotFoundException': (type, message) =>
      TaskNotFoundException(type: type, message: message),
};
