// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
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

/// Amazon Managed Workflows for Apache Airflow Serverless provides a managed
/// workflow orchestration platform for running Apache Airflow workflows in a
/// serverless environment. You can use Amazon Managed Workflows for Apache
/// Airflow Serverless to create, manage, and run data processing workflows
/// without managing the underlying infrastructure, Airflow clusters, metadata
/// databases, or scheduling overhead. The service provides secure multi-tenant
/// run environments with automatic scaling, comprehensive logging, and
/// integration with multiple Amazon Web Services services for orchestrating
/// complex analytics workloads.
class MwaaServerless {
  final _s.JsonProtocol _protocol;
  MwaaServerless({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'airflow-serverless',
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

  /// Lists all tags that are associated with a specified Amazon Managed
  /// Workflows for Apache Airflow Serverless resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [OperationTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource for which to list tags.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonMWAAServerless.ListTagsForResource'
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

  /// Adds tags to an Amazon Managed Workflows for Apache Airflow Serverless
  /// resource. Tags are key-value pairs that help you organize and categorize
  /// your resources.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [OperationTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to which to add tags.
  ///
  /// Parameter [tags] :
  /// A map of tags to add to the resource. Each tag consists of a key-value
  /// pair.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonMWAAServerless.TagResource'
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

  /// Removes tags from an Amazon Managed Workflows for Apache Airflow
  /// Serverless resource. This operation removes the specified tags from the
  /// resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [OperationTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource from which to remove tags.
  ///
  /// Parameter [tagKeys] :
  /// A list of tag keys to remove from the resource. Only the keys are
  /// required; the values are ignored.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonMWAAServerless.UntagResource'
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

  /// Retrieves detailed information about a specific task instance within a
  /// workflow run. Task instances represent individual tasks that are executed
  /// as part of a workflow in the Amazon Managed Workflows for Apache Airflow
  /// Serverless environment. Each task instance runs in an isolated ECS
  /// container with dedicated resources and security boundaries. The service
  /// tracks task execution state, retry attempts, and provides detailed timing
  /// and error information for troubleshooting and monitoring purposes.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [OperationTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [runId] :
  /// The unique identifier of the workflow run that contains the task instance.
  ///
  /// Parameter [taskInstanceId] :
  /// The unique identifier of the task instance to retrieve.
  ///
  /// Parameter [workflowArn] :
  /// The Amazon Resource Name (ARN) of the workflow that contains the task
  /// instance.
  Future<GetTaskInstanceResponse> getTaskInstance({
    required String runId,
    required String taskInstanceId,
    required String workflowArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonMWAAServerless.GetTaskInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RunId': runId,
        'TaskInstanceId': taskInstanceId,
        'WorkflowArn': workflowArn,
      },
    );

    return GetTaskInstanceResponse.fromJson(jsonResponse.body);
  }

  /// Lists all task instances for a specific workflow run, with optional
  /// pagination support.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [OperationTimeoutException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [runId] :
  /// The unique identifier of the workflow run for which you want a list of
  /// task instances.
  ///
  /// Parameter [workflowArn] :
  /// The Amazon Resource Name (ARN) of the workflow that contains the run.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of task instances to return in a single response.
  ///
  /// Parameter [nextToken] :
  /// The pagination token you need to use to retrieve the next set of results.
  /// This value is returned from a previous call to
  /// <code>ListTaskInstances</code>.
  Future<ListTaskInstancesResponse> listTaskInstances({
    required String runId,
    required String workflowArn,
    int? maxResults,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonMWAAServerless.ListTaskInstances'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RunId': runId,
        'WorkflowArn': workflowArn,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListTaskInstancesResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new workflow in Amazon Managed Workflows for Apache Airflow
  /// Serverless. This operation initializes a workflow with the specified
  /// configuration including the workflow definition, execution role, and
  /// optional settings for encryption, logging, and networking. You must
  /// provide the workflow definition as a YAML file stored in Amazon S3 that
  /// defines the DAG structure using supported Amazon Web Services operators.
  /// Amazon Managed Workflows for Apache Airflow Serverless automatically
  /// creates the first version of the workflow and sets up the necessary
  /// execution environment with multi-tenant isolation and security controls.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [OperationTimeoutException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [definitionS3Location] :
  /// The Amazon S3 location where the workflow definition file is stored. This
  /// must point to a valid YAML file that defines the workflow structure using
  /// supported Amazon Web Services operators and tasks. Amazon Managed
  /// Workflows for Apache Airflow Serverless takes a snapshot of the definition
  /// at creation time, so subsequent changes to the Amazon S3 object will not
  /// affect the workflow unless you create a new version. In your YAML
  /// definition, include task dependencies, scheduling information, and
  /// operator configurations that are compatible with the Amazon Managed
  /// Workflows for Apache Airflow Serverless execution environment.
  ///
  /// Parameter [name] :
  /// The name of the workflow. You must use unique workflow names within your
  /// Amazon Web Services account. The service generates a unique identifier
  /// that is appended to ensure temporal uniqueness across the account
  /// lifecycle.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role that Amazon Managed
  /// Workflows for Apache Airflow Serverless assumes when executing the
  /// workflow. This role must have the necessary permissions to access the
  /// required Amazon Web Services services and resources that your workflow
  /// tasks will interact with. The role is used for task execution in the
  /// isolated, multi-tenant environment and should follow the principle of
  /// least privilege. Amazon Managed Workflows for Apache Airflow Serverless
  /// validates role access during workflow creation but runtime permission
  /// checks are performed by the target services.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. This token prevents duplicate workflow
  /// creation requests.
  ///
  /// Parameter [description] :
  /// An optional description of the workflow that you can use to provide
  /// additional context about the workflow's purpose and functionality.
  ///
  /// Parameter [encryptionConfiguration] :
  /// The configuration for encrypting workflow data at rest and in transit.
  /// Specifies the encryption type and optional KMS key for customer-managed
  /// encryption.
  ///
  /// Parameter [engineVersion] :
  /// The version of the Amazon Managed Workflows for Apache Airflow Serverless
  /// engine that you want to use for this workflow. This determines the feature
  /// set, supported operators, and execution environment capabilities available
  /// to your workflow. Amazon Managed Workflows for Apache Airflow Serverless
  /// maintains backward compatibility across versions while introducing new
  /// features and improvements. Currently supports version 1 with plans for
  /// additional versions as the service evolves.
  ///
  /// Parameter [loggingConfiguration] :
  /// The configuration for workflow logging. Specifies the CloudWatch log group
  /// where workflow execution logs are stored. Amazon Managed Workflows for
  /// Apache Airflow Serverless automatically exports worker logs and task-level
  /// information to the specified log group in your account using remote
  /// logging functionality. This provides comprehensive observability for
  /// debugging and monitoring workflow execution across the distributed,
  /// serverless environment.
  ///
  /// Parameter [networkConfiguration] :
  /// Network configuration for the workflow execution environment, including
  /// VPC security groups and subnets for secure network access. When specified,
  /// Amazon Managed Workflows for Apache Airflow Serverless deploys ECS worker
  /// tasks in your customer VPC to provide secure connectivity to your
  /// resources. If not specified, tasks run in the service's default worker VPC
  /// with network isolation from other customers. This configuration enables
  /// secure access to VPC-only resources like RDS databases or private
  /// endpoints.
  ///
  /// Parameter [tags] :
  /// A map of tags to assign to the workflow resource. Tags are key-value pairs
  /// that are used for resource organization and cost allocation.
  ///
  /// Parameter [triggerMode] :
  /// The trigger mode for the workflow execution.
  Future<CreateWorkflowResponse> createWorkflow({
    required DefinitionS3Location definitionS3Location,
    required String name,
    required String roleArn,
    String? clientToken,
    String? description,
    EncryptionConfiguration? encryptionConfiguration,
    int? engineVersion,
    LoggingConfiguration? loggingConfiguration,
    NetworkConfiguration? networkConfiguration,
    Map<String, String>? tags,
    String? triggerMode,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonMWAAServerless.CreateWorkflow'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DefinitionS3Location': definitionS3Location,
        'Name': name,
        'RoleArn': roleArn,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (description != null) 'Description': description,
        if (encryptionConfiguration != null)
          'EncryptionConfiguration': encryptionConfiguration,
        if (engineVersion != null) 'EngineVersion': engineVersion,
        if (loggingConfiguration != null)
          'LoggingConfiguration': loggingConfiguration,
        if (networkConfiguration != null)
          'NetworkConfiguration': networkConfiguration,
        if (tags != null) 'Tags': tags,
        if (triggerMode != null) 'TriggerMode': triggerMode,
      },
    );

    return CreateWorkflowResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves detailed information about a workflow, including its
  /// configuration, status, and metadata.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [OperationTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [workflowArn] :
  /// The Amazon Resource Name (ARN) of the workflow you want to retrieve.
  ///
  /// Parameter [workflowVersion] :
  /// Optional. The specific version of the workflow to retrieve. If not
  /// specified, the latest version is returned.
  Future<GetWorkflowResponse> getWorkflow({
    required String workflowArn,
    String? workflowVersion,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonMWAAServerless.GetWorkflow'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WorkflowArn': workflowArn,
        if (workflowVersion != null) 'WorkflowVersion': workflowVersion,
      },
    );

    return GetWorkflowResponse.fromJson(jsonResponse.body);
  }

  /// Updates an existing workflow with new configuration settings. This
  /// operation allows you to modify the workflow definition, role, and other
  /// settings. When you update a workflow, Amazon Managed Workflows for Apache
  /// Airflow Serverless automatically creates a new version with the updated
  /// configuration and disables scheduling on all previous versions to ensure
  /// only one version is actively scheduled at a time. The update operation
  /// maintains workflow history while providing a clean transition to the new
  /// configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [OperationTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [definitionS3Location] :
  /// The Amazon S3 location where the updated workflow definition file is
  /// stored.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role that Amazon Managed
  /// Workflows for Apache Airflow Serverless assumes when it executes the
  /// updated workflow.
  ///
  /// Parameter [workflowArn] :
  /// The Amazon Resource Name (ARN) of the workflow you want to update.
  ///
  /// Parameter [description] :
  /// An updated description for the workflow.
  ///
  /// Parameter [engineVersion] :
  /// The version of the Amazon Managed Workflows for Apache Airflow Serverless
  /// engine that you want to use for the updated workflow.
  ///
  /// Parameter [loggingConfiguration] :
  /// Updated logging configuration for the workflow.
  ///
  /// Parameter [networkConfiguration] :
  /// Updated network configuration for the workflow execution environment.
  ///
  /// Parameter [triggerMode] :
  /// The trigger mode for the workflow execution.
  Future<UpdateWorkflowResponse> updateWorkflow({
    required DefinitionS3Location definitionS3Location,
    required String roleArn,
    required String workflowArn,
    String? description,
    int? engineVersion,
    LoggingConfiguration? loggingConfiguration,
    NetworkConfiguration? networkConfiguration,
    String? triggerMode,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonMWAAServerless.UpdateWorkflow'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DefinitionS3Location': definitionS3Location,
        'RoleArn': roleArn,
        'WorkflowArn': workflowArn,
        if (description != null) 'Description': description,
        if (engineVersion != null) 'EngineVersion': engineVersion,
        if (loggingConfiguration != null)
          'LoggingConfiguration': loggingConfiguration,
        if (networkConfiguration != null)
          'NetworkConfiguration': networkConfiguration,
        if (triggerMode != null) 'TriggerMode': triggerMode,
      },
    );

    return UpdateWorkflowResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a workflow and all its versions. This operation permanently
  /// removes the workflow and cannot be undone. Amazon Managed Workflows for
  /// Apache Airflow Serverless ensures that all associated resources are
  /// properly cleaned up, including stopping any running executions, removing
  /// scheduled triggers, and cleaning up execution history. The deletion
  /// process respects the multi-tenant isolation boundaries and ensures that no
  /// residual data or configurations remain that could affect other customers
  /// or workflows.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [OperationTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [workflowArn] :
  /// The Amazon Resource Name (ARN) of the workflow you want to delete.
  ///
  /// Parameter [workflowVersion] :
  /// Optional. The specific version of the workflow to delete. If not
  /// specified, all versions of the workflow are deleted.
  Future<DeleteWorkflowResponse> deleteWorkflow({
    required String workflowArn,
    String? workflowVersion,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonMWAAServerless.DeleteWorkflow'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WorkflowArn': workflowArn,
        if (workflowVersion != null) 'WorkflowVersion': workflowVersion,
      },
    );

    return DeleteWorkflowResponse.fromJson(jsonResponse.body);
  }

  /// Lists all workflows in your account, with optional pagination support.
  /// This operation returns summary information for workflows, showing only the
  /// most recently created version of each workflow. Amazon Managed Workflows
  /// for Apache Airflow Serverless maintains workflow metadata in a highly
  /// available, distributed storage system that enables efficient querying and
  /// filtering. The service implements proper access controls to ensure you can
  /// only view workflows that you have permissions to access, supporting both
  /// individual and team-based workflow management scenarios.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [OperationTimeoutException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of workflows you want to return in a single response.
  ///
  /// Parameter [nextToken] :
  /// The pagination token you need to use to retrieve the next set of results.
  /// This value is returned from a previous call to <code>ListWorkflows</code>.
  Future<ListWorkflowsResponse> listWorkflows({
    int? maxResults,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonMWAAServerless.ListWorkflows'
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

    return ListWorkflowsResponse.fromJson(jsonResponse.body);
  }

  /// Starts a new execution of a workflow. This operation creates a workflow
  /// run that executes the tasks that are defined in the workflow. Amazon
  /// Managed Workflows for Apache Airflow Serverless schedules the workflow
  /// execution across its managed Airflow environment, automatically scaling
  /// ECS worker tasks based on the workload. The service handles task
  /// isolation, dependency resolution, and provides comprehensive monitoring
  /// and logging throughout the execution lifecycle.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [OperationTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [workflowArn] :
  /// The Amazon Resource Name (ARN) of the workflow you want to run.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. This token prevents duplicate workflow run
  /// requests.
  ///
  /// Parameter [overrideParameters] :
  /// Optional parameters to override default workflow parameters for this
  /// specific run. These parameters are passed to the workflow during execution
  /// and can be used to customize behavior without modifying the workflow
  /// definition. Parameters are made available as environment variables to
  /// tasks and you can reference them within the YAML workflow definition using
  /// standard parameter substitution syntax.
  ///
  /// Parameter [workflowVersion] :
  /// Optional. The specific version of the workflow to execute. If not
  /// specified, the latest version is used.
  Future<StartWorkflowRunResponse> startWorkflowRun({
    required String workflowArn,
    String? clientToken,
    Map<String, Document>? overrideParameters,
    String? workflowVersion,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonMWAAServerless.StartWorkflowRun'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WorkflowArn': workflowArn,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (overrideParameters != null)
          'OverrideParameters': overrideParameters,
        if (workflowVersion != null) 'WorkflowVersion': workflowVersion,
      },
    );

    return StartWorkflowRunResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves detailed information about a specific workflow run, including
  /// its status, execution details, and task instances.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [OperationTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [runId] :
  /// The unique identifier of the workflow run to retrieve.
  ///
  /// Parameter [workflowArn] :
  /// The Amazon Resource Name (ARN) of the workflow that contains the run.
  Future<GetWorkflowRunResponse> getWorkflowRun({
    required String runId,
    required String workflowArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonMWAAServerless.GetWorkflowRun'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RunId': runId,
        'WorkflowArn': workflowArn,
      },
    );

    return GetWorkflowRunResponse.fromJson(jsonResponse.body);
  }

  /// Stops a running workflow execution. This operation terminates all running
  /// tasks and prevents new tasks from starting. Amazon Managed Workflows for
  /// Apache Airflow Serverless gracefully shuts down the workflow execution by
  /// stopping task scheduling and terminating active ECS worker containers. The
  /// operation transitions the workflow run to a <code>STOPPING</code> state
  /// and then to <code>STOPPED</code> once all cleanup is complete. In-flight
  /// tasks may complete or be terminated depending on their current execution
  /// state.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [OperationTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [runId] :
  /// The unique identifier of the workflow run to stop.
  ///
  /// Parameter [workflowArn] :
  /// The Amazon Resource Name (ARN) of the workflow that contains the run you
  /// want to stop.
  Future<StopWorkflowRunResponse> stopWorkflowRun({
    required String runId,
    required String workflowArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonMWAAServerless.StopWorkflowRun'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RunId': runId,
        'WorkflowArn': workflowArn,
      },
    );

    return StopWorkflowRunResponse.fromJson(jsonResponse.body);
  }

  /// Lists all runs for a specified workflow, with optional pagination and
  /// filtering support.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [OperationTimeoutException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [workflowArn] :
  /// The Amazon Resource Name (ARN) of the workflow for which you want a list
  /// of runs.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of workflow runs to return in a single response.
  ///
  /// Parameter [nextToken] :
  /// The pagination token you need to use to retrieve the next set of results.
  /// This value is returned from a previous call to
  /// <code>ListWorkflowRuns</code>.
  ///
  /// Parameter [workflowVersion] :
  /// Optional. The specific version of the workflow for which you want a list
  /// of runs. If not specified, runs for all versions are returned.
  Future<ListWorkflowRunsResponse> listWorkflowRuns({
    required String workflowArn,
    int? maxResults,
    String? nextToken,
    String? workflowVersion,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonMWAAServerless.ListWorkflowRuns'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WorkflowArn': workflowArn,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (workflowVersion != null) 'WorkflowVersion': workflowVersion,
      },
    );

    return ListWorkflowRunsResponse.fromJson(jsonResponse.body);
  }

  /// Lists all versions of a specified workflow, with optional pagination
  /// support.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [OperationTimeoutException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [workflowArn] :
  /// The Amazon Resource Name (ARN) of the workflow for which you want to list
  /// versions.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of workflow versions to return in a single response.
  ///
  /// Parameter [nextToken] :
  /// The pagination token you need to use to retrieve the next set of results.
  /// This value is returned from a previous call to
  /// <code>ListWorkflowVersions</code>.
  Future<ListWorkflowVersionsResponse> listWorkflowVersions({
    required String workflowArn,
    int? maxResults,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonMWAAServerless.ListWorkflowVersions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WorkflowArn': workflowArn,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListWorkflowVersionsResponse.fromJson(jsonResponse.body);
  }
}

class ListTagsForResourceResponse {
  /// A map of tags that are associated with the resource, where each tag consists
  /// of a key-value pair.
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

class GetTaskInstanceResponse {
  /// The unique identifier of the workflow run that contains this task instance.
  final String runId;

  /// The unique identifier of this task instance.
  final String taskInstanceId;

  /// The Amazon Resource Name (ARN) of the workflow that contains this task
  /// instance.
  final String workflowArn;

  /// The attempt number for this task instance.
  final int? attemptNumber;

  /// The duration of the task instance execution in seconds. This value is null
  /// if the task is not complete.
  final int? durationInSeconds;

  /// The timestamp when the task instance completed execution, in ISO 8601
  /// date-time format. This value is null if the task is not complete.
  final DateTime? endedAt;

  /// The error message if the task instance failed. This value is null if the
  /// task completed successfully.
  final String? errorMessage;

  /// The CloudWatch log stream name for this task instance execution.
  final String? logStream;

  /// The timestamp when the task instance was last modified, in ISO 8601
  /// date-time format.
  final DateTime? modifiedAt;

  /// The name of the Apache Airflow operator used for this task instance.
  final String? operatorName;

  /// The timestamp when the task instance started execution, in ISO 8601
  /// date-time format. This value is null if the task has not started.
  final DateTime? startedAt;

  /// The current status of the task instance.
  final TaskInstanceStatus? status;

  /// The unique identifier of the task definition within the workflow.
  final String? taskId;

  /// The version of the workflow that contains this task instance.
  final String? workflowVersion;

  /// Cross-communication data exchanged between tasks in the workflow execution.
  final Map<String, String>? xcom;

  GetTaskInstanceResponse({
    required this.runId,
    required this.taskInstanceId,
    required this.workflowArn,
    this.attemptNumber,
    this.durationInSeconds,
    this.endedAt,
    this.errorMessage,
    this.logStream,
    this.modifiedAt,
    this.operatorName,
    this.startedAt,
    this.status,
    this.taskId,
    this.workflowVersion,
    this.xcom,
  });

  factory GetTaskInstanceResponse.fromJson(Map<String, dynamic> json) {
    return GetTaskInstanceResponse(
      runId: (json['RunId'] as String?) ?? '',
      taskInstanceId: (json['TaskInstanceId'] as String?) ?? '',
      workflowArn: (json['WorkflowArn'] as String?) ?? '',
      attemptNumber: json['AttemptNumber'] as int?,
      durationInSeconds: json['DurationInSeconds'] as int?,
      endedAt: timeStampFromJson(json['EndedAt']),
      errorMessage: json['ErrorMessage'] as String?,
      logStream: json['LogStream'] as String?,
      modifiedAt: timeStampFromJson(json['ModifiedAt']),
      operatorName: json['OperatorName'] as String?,
      startedAt: timeStampFromJson(json['StartedAt']),
      status: (json['Status'] as String?)?.let(TaskInstanceStatus.fromString),
      taskId: json['TaskId'] as String?,
      workflowVersion: json['WorkflowVersion'] as String?,
      xcom: (json['Xcom'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final runId = this.runId;
    final taskInstanceId = this.taskInstanceId;
    final workflowArn = this.workflowArn;
    final attemptNumber = this.attemptNumber;
    final durationInSeconds = this.durationInSeconds;
    final endedAt = this.endedAt;
    final errorMessage = this.errorMessage;
    final logStream = this.logStream;
    final modifiedAt = this.modifiedAt;
    final operatorName = this.operatorName;
    final startedAt = this.startedAt;
    final status = this.status;
    final taskId = this.taskId;
    final workflowVersion = this.workflowVersion;
    final xcom = this.xcom;
    return {
      'RunId': runId,
      'TaskInstanceId': taskInstanceId,
      'WorkflowArn': workflowArn,
      if (attemptNumber != null) 'AttemptNumber': attemptNumber,
      if (durationInSeconds != null) 'DurationInSeconds': durationInSeconds,
      if (endedAt != null) 'EndedAt': iso8601ToJson(endedAt),
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (logStream != null) 'LogStream': logStream,
      if (modifiedAt != null) 'ModifiedAt': iso8601ToJson(modifiedAt),
      if (operatorName != null) 'OperatorName': operatorName,
      if (startedAt != null) 'StartedAt': iso8601ToJson(startedAt),
      if (status != null) 'Status': status.value,
      if (taskId != null) 'TaskId': taskId,
      if (workflowVersion != null) 'WorkflowVersion': workflowVersion,
      if (xcom != null) 'Xcom': xcom,
    };
  }
}

class ListTaskInstancesResponse {
  /// The pagination token you need to use to retrieve the next set of results.
  /// This value is null if there are no more results.
  final String? nextToken;

  /// A list of task instance summaries for the specified workflow run.
  final List<TaskInstanceSummary>? taskInstances;

  ListTaskInstancesResponse({
    this.nextToken,
    this.taskInstances,
  });

  factory ListTaskInstancesResponse.fromJson(Map<String, dynamic> json) {
    return ListTaskInstancesResponse(
      nextToken: json['NextToken'] as String?,
      taskInstances: (json['TaskInstances'] as List?)
          ?.nonNulls
          .map((e) => TaskInstanceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final taskInstances = this.taskInstances;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (taskInstances != null) 'TaskInstances': taskInstances,
    };
  }
}

class CreateWorkflowResponse {
  /// The Amazon Resource Name (ARN) of the newly created workflow. This ARN
  /// uniquely identifies the workflow resource.
  final String workflowArn;

  /// The timestamp when the workflow was created, in ISO 8601 date-time format.
  final DateTime? createdAt;

  /// A Boolean flag that indicates whether this workflow version is the latest
  /// version of the workflow.
  final bool? isLatestVersion;

  /// A unique identifier for this revision of the workflow configuration. This ID
  /// changes when the workflow is updated and you can use it for optimistic
  /// concurrency control in update operations. The revision ID helps prevent
  /// conflicting updates and ensures that updates are applied to the expected
  /// version of the workflow configuration.
  final String? revisionId;

  /// Warning messages generated during workflow creation.
  final List<String>? warnings;

  /// The current status of the workflow. Possible values are <code>READY</code>
  /// (workflow is ready to run) and <code>DELETING</code> (workflow is being
  /// deleted).
  final WorkflowStatus? workflowStatus;

  /// The version identifier of the workflow. This is a service-generated
  /// alphanumeric string that uniquely identifies this version of the workflow.
  /// Amazon Managed Workflows for Apache Airflow Serverless uses a version-first
  /// approach where each workflow can have multiple immutable versions, which
  /// allows you to maintain different configurations and roll back to previous
  /// versions as needed. The version identifier is used in ARNs and API
  /// operations to reference specific workflow versions.
  final String? workflowVersion;

  CreateWorkflowResponse({
    required this.workflowArn,
    this.createdAt,
    this.isLatestVersion,
    this.revisionId,
    this.warnings,
    this.workflowStatus,
    this.workflowVersion,
  });

  factory CreateWorkflowResponse.fromJson(Map<String, dynamic> json) {
    return CreateWorkflowResponse(
      workflowArn: (json['WorkflowArn'] as String?) ?? '',
      createdAt: timeStampFromJson(json['CreatedAt']),
      isLatestVersion: json['IsLatestVersion'] as bool?,
      revisionId: json['RevisionId'] as String?,
      warnings: (json['Warnings'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      workflowStatus:
          (json['WorkflowStatus'] as String?)?.let(WorkflowStatus.fromString),
      workflowVersion: json['WorkflowVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final workflowArn = this.workflowArn;
    final createdAt = this.createdAt;
    final isLatestVersion = this.isLatestVersion;
    final revisionId = this.revisionId;
    final warnings = this.warnings;
    final workflowStatus = this.workflowStatus;
    final workflowVersion = this.workflowVersion;
    return {
      'WorkflowArn': workflowArn,
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (isLatestVersion != null) 'IsLatestVersion': isLatestVersion,
      if (revisionId != null) 'RevisionId': revisionId,
      if (warnings != null) 'Warnings': warnings,
      if (workflowStatus != null) 'WorkflowStatus': workflowStatus.value,
      if (workflowVersion != null) 'WorkflowVersion': workflowVersion,
    };
  }
}

class GetWorkflowResponse {
  /// The Amazon Resource Name (ARN) of the workflow.
  final String workflowArn;

  /// The timestamp when the workflow was created, in ISO 8601 date-time format.
  final DateTime? createdAt;

  /// The Amazon S3 location of the workflow definition file.
  final DefinitionS3Location? definitionS3Location;

  /// The description of the workflow.
  final String? description;

  /// The encryption configuration for the workflow.
  final EncryptionConfiguration? encryptionConfiguration;

  /// The version of the Amazon Managed Workflows for Apache Airflow Serverless
  /// engine that this workflow uses.
  final int? engineVersion;

  /// The logging configuration for the workflow.
  final LoggingConfiguration? loggingConfiguration;

  /// The timestamp when the workflow was last modified, in ISO 8601 date-time
  /// format.
  final DateTime? modifiedAt;

  /// The name of the workflow.
  final String? name;

  /// The network configuration for the workflow execution environment.
  final NetworkConfiguration? networkConfiguration;

  /// The Amazon Resource Name (ARN) of the IAM role used for workflow execution.
  final String? roleArn;

  /// The schedule configuration for the workflow, including cron expressions for
  /// automated execution. Amazon Managed Workflows for Apache Airflow Serverless
  /// uses EventBridge Scheduler for cost-effective, timezone-aware scheduling.
  /// When a workflow includes schedule information in its YAML definition, the
  /// service automatically configures the appropriate triggers for automated
  /// execution. Only one version of a workflow can have an active schedule at any
  /// given time.
  final ScheduleConfiguration? scheduleConfiguration;

  /// The trigger mode for the workflow execution.
  final String? triggerMode;

  /// The workflow definition content.
  final String? workflowDefinition;

  /// The current status of the workflow.
  final WorkflowStatus? workflowStatus;

  /// The version identifier of the workflow.
  final String? workflowVersion;

  GetWorkflowResponse({
    required this.workflowArn,
    this.createdAt,
    this.definitionS3Location,
    this.description,
    this.encryptionConfiguration,
    this.engineVersion,
    this.loggingConfiguration,
    this.modifiedAt,
    this.name,
    this.networkConfiguration,
    this.roleArn,
    this.scheduleConfiguration,
    this.triggerMode,
    this.workflowDefinition,
    this.workflowStatus,
    this.workflowVersion,
  });

  factory GetWorkflowResponse.fromJson(Map<String, dynamic> json) {
    return GetWorkflowResponse(
      workflowArn: (json['WorkflowArn'] as String?) ?? '',
      createdAt: timeStampFromJson(json['CreatedAt']),
      definitionS3Location: json['DefinitionS3Location'] != null
          ? DefinitionS3Location.fromJson(
              json['DefinitionS3Location'] as Map<String, dynamic>)
          : null,
      description: json['Description'] as String?,
      encryptionConfiguration: json['EncryptionConfiguration'] != null
          ? EncryptionConfiguration.fromJson(
              json['EncryptionConfiguration'] as Map<String, dynamic>)
          : null,
      engineVersion: json['EngineVersion'] as int?,
      loggingConfiguration: json['LoggingConfiguration'] != null
          ? LoggingConfiguration.fromJson(
              json['LoggingConfiguration'] as Map<String, dynamic>)
          : null,
      modifiedAt: timeStampFromJson(json['ModifiedAt']),
      name: json['Name'] as String?,
      networkConfiguration: json['NetworkConfiguration'] != null
          ? NetworkConfiguration.fromJson(
              json['NetworkConfiguration'] as Map<String, dynamic>)
          : null,
      roleArn: json['RoleArn'] as String?,
      scheduleConfiguration: json['ScheduleConfiguration'] != null
          ? ScheduleConfiguration.fromJson(
              json['ScheduleConfiguration'] as Map<String, dynamic>)
          : null,
      triggerMode: json['TriggerMode'] as String?,
      workflowDefinition: json['WorkflowDefinition'] as String?,
      workflowStatus:
          (json['WorkflowStatus'] as String?)?.let(WorkflowStatus.fromString),
      workflowVersion: json['WorkflowVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final workflowArn = this.workflowArn;
    final createdAt = this.createdAt;
    final definitionS3Location = this.definitionS3Location;
    final description = this.description;
    final encryptionConfiguration = this.encryptionConfiguration;
    final engineVersion = this.engineVersion;
    final loggingConfiguration = this.loggingConfiguration;
    final modifiedAt = this.modifiedAt;
    final name = this.name;
    final networkConfiguration = this.networkConfiguration;
    final roleArn = this.roleArn;
    final scheduleConfiguration = this.scheduleConfiguration;
    final triggerMode = this.triggerMode;
    final workflowDefinition = this.workflowDefinition;
    final workflowStatus = this.workflowStatus;
    final workflowVersion = this.workflowVersion;
    return {
      'WorkflowArn': workflowArn,
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (definitionS3Location != null)
        'DefinitionS3Location': definitionS3Location,
      if (description != null) 'Description': description,
      if (encryptionConfiguration != null)
        'EncryptionConfiguration': encryptionConfiguration,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (loggingConfiguration != null)
        'LoggingConfiguration': loggingConfiguration,
      if (modifiedAt != null) 'ModifiedAt': iso8601ToJson(modifiedAt),
      if (name != null) 'Name': name,
      if (networkConfiguration != null)
        'NetworkConfiguration': networkConfiguration,
      if (roleArn != null) 'RoleArn': roleArn,
      if (scheduleConfiguration != null)
        'ScheduleConfiguration': scheduleConfiguration,
      if (triggerMode != null) 'TriggerMode': triggerMode,
      if (workflowDefinition != null) 'WorkflowDefinition': workflowDefinition,
      if (workflowStatus != null) 'WorkflowStatus': workflowStatus.value,
      if (workflowVersion != null) 'WorkflowVersion': workflowVersion,
    };
  }
}

class UpdateWorkflowResponse {
  /// The Amazon Resource Name (ARN) of the updated workflow.
  final String workflowArn;

  /// The timestamp when the workflow was last modified, in ISO 8601 date-time
  /// format.
  final DateTime? modifiedAt;

  /// Warning messages generated during workflow update.
  final List<String>? warnings;

  /// The version identifier of the updated workflow.
  final String? workflowVersion;

  UpdateWorkflowResponse({
    required this.workflowArn,
    this.modifiedAt,
    this.warnings,
    this.workflowVersion,
  });

  factory UpdateWorkflowResponse.fromJson(Map<String, dynamic> json) {
    return UpdateWorkflowResponse(
      workflowArn: (json['WorkflowArn'] as String?) ?? '',
      modifiedAt: timeStampFromJson(json['ModifiedAt']),
      warnings: (json['Warnings'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      workflowVersion: json['WorkflowVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final workflowArn = this.workflowArn;
    final modifiedAt = this.modifiedAt;
    final warnings = this.warnings;
    final workflowVersion = this.workflowVersion;
    return {
      'WorkflowArn': workflowArn,
      if (modifiedAt != null) 'ModifiedAt': iso8601ToJson(modifiedAt),
      if (warnings != null) 'Warnings': warnings,
      if (workflowVersion != null) 'WorkflowVersion': workflowVersion,
    };
  }
}

class DeleteWorkflowResponse {
  /// The Amazon Resource Name (ARN) of the deleted workflow.
  final String workflowArn;

  /// The version of the workflow that was deleted.
  final String? workflowVersion;

  DeleteWorkflowResponse({
    required this.workflowArn,
    this.workflowVersion,
  });

  factory DeleteWorkflowResponse.fromJson(Map<String, dynamic> json) {
    return DeleteWorkflowResponse(
      workflowArn: (json['WorkflowArn'] as String?) ?? '',
      workflowVersion: json['WorkflowVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final workflowArn = this.workflowArn;
    final workflowVersion = this.workflowVersion;
    return {
      'WorkflowArn': workflowArn,
      if (workflowVersion != null) 'WorkflowVersion': workflowVersion,
    };
  }
}

class ListWorkflowsResponse {
  /// A list of workflow summaries for all workflows in your account.
  final List<WorkflowSummary> workflows;

  /// The pagination token you need to use to retrieve the next set of results.
  /// This value is null if there are no more results.
  final String? nextToken;

  ListWorkflowsResponse({
    required this.workflows,
    this.nextToken,
  });

  factory ListWorkflowsResponse.fromJson(Map<String, dynamic> json) {
    return ListWorkflowsResponse(
      workflows: ((json['Workflows'] as List?) ?? const [])
          .nonNulls
          .map((e) => WorkflowSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final workflows = this.workflows;
    final nextToken = this.nextToken;
    return {
      'Workflows': workflows,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class StartWorkflowRunResponse {
  /// The unique identifier of the newly started workflow run.
  final String? runId;

  /// The timestamp when the workflow run was started, in ISO 8601 date-time
  /// format.
  final DateTime? startedAt;

  /// The initial status of the workflow run. This is typically
  /// <code>STARTING</code> when you first create the run.
  final WorkflowRunStatus? status;

  StartWorkflowRunResponse({
    this.runId,
    this.startedAt,
    this.status,
  });

  factory StartWorkflowRunResponse.fromJson(Map<String, dynamic> json) {
    return StartWorkflowRunResponse(
      runId: json['RunId'] as String?,
      startedAt: timeStampFromJson(json['StartedAt']),
      status: (json['Status'] as String?)?.let(WorkflowRunStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final runId = this.runId;
    final startedAt = this.startedAt;
    final status = this.status;
    return {
      if (runId != null) 'RunId': runId,
      if (startedAt != null) 'StartedAt': iso8601ToJson(startedAt),
      if (status != null) 'Status': status.value,
    };
  }
}

class GetWorkflowRunResponse {
  /// Parameters that were overridden for this specific workflow run.
  final Map<String, Document>? overrideParameters;

  /// Detailed information about the workflow run execution, including timing,
  /// status, and task instances.
  final WorkflowRunDetail? runDetail;

  /// The unique identifier of this workflow run.
  final String? runId;

  /// The type of workflow run. Values are <code>ON_DEMAND</code> (manually
  /// triggered) or <code>SCHEDULED</code> (automatically triggered by schedule).
  final RunType? runType;

  /// The Amazon Resource Name (ARN) of the workflow that contains this run.
  final String? workflowArn;

  /// The version of the workflow that is used for this run.
  final String? workflowVersion;

  GetWorkflowRunResponse({
    this.overrideParameters,
    this.runDetail,
    this.runId,
    this.runType,
    this.workflowArn,
    this.workflowVersion,
  });

  factory GetWorkflowRunResponse.fromJson(Map<String, dynamic> json) {
    return GetWorkflowRunResponse(
      overrideParameters: (json['OverrideParameters'] as Map<String, dynamic>?)
          ?.map((k, e) =>
              MapEntry(k, Document.fromJson(e as Map<String, dynamic>))),
      runDetail: json['RunDetail'] != null
          ? WorkflowRunDetail.fromJson(
              json['RunDetail'] as Map<String, dynamic>)
          : null,
      runId: json['RunId'] as String?,
      runType: (json['RunType'] as String?)?.let(RunType.fromString),
      workflowArn: json['WorkflowArn'] as String?,
      workflowVersion: json['WorkflowVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final overrideParameters = this.overrideParameters;
    final runDetail = this.runDetail;
    final runId = this.runId;
    final runType = this.runType;
    final workflowArn = this.workflowArn;
    final workflowVersion = this.workflowVersion;
    return {
      if (overrideParameters != null) 'OverrideParameters': overrideParameters,
      if (runDetail != null) 'RunDetail': runDetail,
      if (runId != null) 'RunId': runId,
      if (runType != null) 'RunType': runType.value,
      if (workflowArn != null) 'WorkflowArn': workflowArn,
      if (workflowVersion != null) 'WorkflowVersion': workflowVersion,
    };
  }
}

class StopWorkflowRunResponse {
  /// The unique identifier of the stopped workflow run.
  final String? runId;

  /// The status of the workflow run after the stop operation. This is typically
  /// <code>STOPPING</code> or <code>STOPPED</code>.
  final WorkflowRunStatus? status;

  /// The Amazon Resource Name (ARN) of the workflow that contains the stopped
  /// run.
  final String? workflowArn;

  /// The version of the workflow that was stopped.
  final String? workflowVersion;

  StopWorkflowRunResponse({
    this.runId,
    this.status,
    this.workflowArn,
    this.workflowVersion,
  });

  factory StopWorkflowRunResponse.fromJson(Map<String, dynamic> json) {
    return StopWorkflowRunResponse(
      runId: json['RunId'] as String?,
      status: (json['Status'] as String?)?.let(WorkflowRunStatus.fromString),
      workflowArn: json['WorkflowArn'] as String?,
      workflowVersion: json['WorkflowVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final runId = this.runId;
    final status = this.status;
    final workflowArn = this.workflowArn;
    final workflowVersion = this.workflowVersion;
    return {
      if (runId != null) 'RunId': runId,
      if (status != null) 'Status': status.value,
      if (workflowArn != null) 'WorkflowArn': workflowArn,
      if (workflowVersion != null) 'WorkflowVersion': workflowVersion,
    };
  }
}

class ListWorkflowRunsResponse {
  /// The pagination token you need to use to retrieve the next set of results.
  /// This value is null if there are no more results.
  final String? nextToken;

  /// A list of workflow run summaries for the specified workflow.
  final List<WorkflowRunSummary>? workflowRuns;

  ListWorkflowRunsResponse({
    this.nextToken,
    this.workflowRuns,
  });

  factory ListWorkflowRunsResponse.fromJson(Map<String, dynamic> json) {
    return ListWorkflowRunsResponse(
      nextToken: json['NextToken'] as String?,
      workflowRuns: (json['WorkflowRuns'] as List?)
          ?.nonNulls
          .map((e) => WorkflowRunSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final workflowRuns = this.workflowRuns;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (workflowRuns != null) 'WorkflowRuns': workflowRuns,
    };
  }
}

class ListWorkflowVersionsResponse {
  /// The pagination token you need to use to retrieve the next set of results.
  /// This value is null if there are no more results.
  final String? nextToken;

  /// A list of workflow version summaries for the specified workflow.
  final List<WorkflowVersionSummary>? workflowVersions;

  ListWorkflowVersionsResponse({
    this.nextToken,
    this.workflowVersions,
  });

  factory ListWorkflowVersionsResponse.fromJson(Map<String, dynamic> json) {
    return ListWorkflowVersionsResponse(
      nextToken: json['NextToken'] as String?,
      workflowVersions: (json['WorkflowVersions'] as List?)
          ?.nonNulls
          .map(
              (e) => WorkflowVersionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final workflowVersions = this.workflowVersions;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (workflowVersions != null) 'WorkflowVersions': workflowVersions,
    };
  }
}

/// Summary information about a workflow version, including identification and
/// configuration details.
class WorkflowVersionSummary {
  /// The Amazon Resource Name (ARN) of the workflow that contains this version.
  final String workflowArn;

  /// The version identifier of the workflow version.
  final String workflowVersion;

  /// The timestamp when the workflow version was created, in ISO 8601 date-time
  /// format.
  final DateTime? createdAt;

  /// The Amazon S3 location of the workflow definition file for this version.
  final DefinitionS3Location? definitionS3Location;

  /// Boolean flag that indicates whether this is the latest version of the
  /// workflow.
  final bool? isLatestVersion;

  /// The timestamp when the workflow version was last modified, in ISO 8601
  /// date-time format.
  final DateTime? modifiedAt;

  /// The schedule configuration for this workflow version.
  final ScheduleConfiguration? scheduleConfiguration;

  /// The trigger mode for the workflow execution.
  final String? triggerMode;

  WorkflowVersionSummary({
    required this.workflowArn,
    required this.workflowVersion,
    this.createdAt,
    this.definitionS3Location,
    this.isLatestVersion,
    this.modifiedAt,
    this.scheduleConfiguration,
    this.triggerMode,
  });

  factory WorkflowVersionSummary.fromJson(Map<String, dynamic> json) {
    return WorkflowVersionSummary(
      workflowArn: (json['WorkflowArn'] as String?) ?? '',
      workflowVersion: (json['WorkflowVersion'] as String?) ?? '',
      createdAt: timeStampFromJson(json['CreatedAt']),
      definitionS3Location: json['DefinitionS3Location'] != null
          ? DefinitionS3Location.fromJson(
              json['DefinitionS3Location'] as Map<String, dynamic>)
          : null,
      isLatestVersion: json['IsLatestVersion'] as bool?,
      modifiedAt: timeStampFromJson(json['ModifiedAt']),
      scheduleConfiguration: json['ScheduleConfiguration'] != null
          ? ScheduleConfiguration.fromJson(
              json['ScheduleConfiguration'] as Map<String, dynamic>)
          : null,
      triggerMode: json['TriggerMode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final workflowArn = this.workflowArn;
    final workflowVersion = this.workflowVersion;
    final createdAt = this.createdAt;
    final definitionS3Location = this.definitionS3Location;
    final isLatestVersion = this.isLatestVersion;
    final modifiedAt = this.modifiedAt;
    final scheduleConfiguration = this.scheduleConfiguration;
    final triggerMode = this.triggerMode;
    return {
      'WorkflowArn': workflowArn,
      'WorkflowVersion': workflowVersion,
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (definitionS3Location != null)
        'DefinitionS3Location': definitionS3Location,
      if (isLatestVersion != null) 'IsLatestVersion': isLatestVersion,
      if (modifiedAt != null) 'ModifiedAt': iso8601ToJson(modifiedAt),
      if (scheduleConfiguration != null)
        'ScheduleConfiguration': scheduleConfiguration,
      if (triggerMode != null) 'TriggerMode': triggerMode,
    };
  }
}

/// Specifies the Amazon S3 location of a workflow definition file. This
/// structure contains the bucket name, object key, and optional version ID for
/// the workflow definition. Amazon Managed Workflows for Apache Airflow
/// Serverless takes a snapshot of the definition file at the time of workflow
/// creation or update, ensuring that the workflow behavior remains consistent
/// even if the source file is modified. The definition must be a valid YAML
/// file that uses supported Amazon Web Services operators and Amazon Managed
/// Workflows for Apache Airflow Serverless syntax.
class DefinitionS3Location {
  /// The name of the Amazon S3 bucket that contains the workflow definition file.
  final String bucket;

  /// The key (name) of the workflow definition file within the S3 bucket.
  final String objectKey;

  /// Optional. The version ID of the workflow definition file in Amazon S3. If
  /// not specified, the latest version is used.
  final String? versionId;

  DefinitionS3Location({
    required this.bucket,
    required this.objectKey,
    this.versionId,
  });

  factory DefinitionS3Location.fromJson(Map<String, dynamic> json) {
    return DefinitionS3Location(
      bucket: (json['Bucket'] as String?) ?? '',
      objectKey: (json['ObjectKey'] as String?) ?? '',
      versionId: json['VersionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final objectKey = this.objectKey;
    final versionId = this.versionId;
    return {
      'Bucket': bucket,
      'ObjectKey': objectKey,
      if (versionId != null) 'VersionId': versionId,
    };
  }
}

/// The configuration to use to schedule automated workflow execution using cron
/// expressions. Amazon Managed Workflows for Apache Airflow Serverless
/// integrates with EventBridge Scheduler to provide cost-effective,
/// timezone-aware scheduling capabilities. The service supports both time-based
/// and event-based scheduling (event-based scheduling available post-GA). When
/// a workflow definition includes scheduling information, Amazon Managed
/// Workflows for Apache Airflow Serverless automatically configures the
/// appropriate triggers and ensures only one version of a workflow has an
/// active schedule at any time.
class ScheduleConfiguration {
  /// A cron expression that defines when the workflow is automatically executed.
  /// Uses standard cron syntax.
  final String? cronExpression;

  ScheduleConfiguration({
    this.cronExpression,
  });

  factory ScheduleConfiguration.fromJson(Map<String, dynamic> json) {
    return ScheduleConfiguration(
      cronExpression: json['CronExpression'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cronExpression = this.cronExpression;
    return {
      if (cronExpression != null) 'CronExpression': cronExpression,
    };
  }
}

/// Summary information about a workflow run, including basic identification and
/// status information.
class WorkflowRunSummary {
  /// Summary details about the workflow run execution.
  final RunDetailSummary? runDetailSummary;

  /// The unique identifier of the workflow run.
  final String? runId;

  /// The type of workflow run.
  final RunType? runType;

  /// The Amazon Resource Name (ARN) of the workflow that contains this run.
  final String? workflowArn;

  /// The version of the workflow used for this run.
  final String? workflowVersion;

  WorkflowRunSummary({
    this.runDetailSummary,
    this.runId,
    this.runType,
    this.workflowArn,
    this.workflowVersion,
  });

  factory WorkflowRunSummary.fromJson(Map<String, dynamic> json) {
    return WorkflowRunSummary(
      runDetailSummary: json['RunDetailSummary'] != null
          ? RunDetailSummary.fromJson(
              json['RunDetailSummary'] as Map<String, dynamic>)
          : null,
      runId: json['RunId'] as String?,
      runType: (json['RunType'] as String?)?.let(RunType.fromString),
      workflowArn: json['WorkflowArn'] as String?,
      workflowVersion: json['WorkflowVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final runDetailSummary = this.runDetailSummary;
    final runId = this.runId;
    final runType = this.runType;
    final workflowArn = this.workflowArn;
    final workflowVersion = this.workflowVersion;
    return {
      if (runDetailSummary != null) 'RunDetailSummary': runDetailSummary,
      if (runId != null) 'RunId': runId,
      if (runType != null) 'RunType': runType.value,
      if (workflowArn != null) 'WorkflowArn': workflowArn,
      if (workflowVersion != null) 'WorkflowVersion': workflowVersion,
    };
  }
}

class RunType {
  static const onDemand = RunType._('ON_DEMAND');
  static const scheduled = RunType._('SCHEDULED');

  final String value;

  const RunType._(this.value);

  static const values = [onDemand, scheduled];

  static RunType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => RunType._(value));

  @override
  bool operator ==(other) => other is RunType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Summary information about a workflow run's execution details, including
/// status and timing information.
class RunDetailSummary {
  /// The timestamp when the workflow run was created, in ISO 8601 date-time
  /// format.
  final DateTime? createdOn;

  /// The timestamp when the workflow run completed execution, in ISO 8601
  /// date-time format. This value is null if the run is not complete.
  final DateTime? endedAt;

  /// The timestamp when the workflow run started execution, in ISO 8601 date-time
  /// format.
  final DateTime? startedAt;

  /// The current status of the workflow run.
  final WorkflowRunStatus? status;

  RunDetailSummary({
    this.createdOn,
    this.endedAt,
    this.startedAt,
    this.status,
  });

  factory RunDetailSummary.fromJson(Map<String, dynamic> json) {
    return RunDetailSummary(
      createdOn: timeStampFromJson(json['CreatedOn']),
      endedAt: timeStampFromJson(json['EndedAt']),
      startedAt: timeStampFromJson(json['StartedAt']),
      status: (json['Status'] as String?)?.let(WorkflowRunStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final createdOn = this.createdOn;
    final endedAt = this.endedAt;
    final startedAt = this.startedAt;
    final status = this.status;
    return {
      if (createdOn != null) 'CreatedOn': iso8601ToJson(createdOn),
      if (endedAt != null) 'EndedAt': iso8601ToJson(endedAt),
      if (startedAt != null) 'StartedAt': iso8601ToJson(startedAt),
      if (status != null) 'Status': status.value,
    };
  }
}

class WorkflowRunStatus {
  static const starting = WorkflowRunStatus._('STARTING');
  static const queued = WorkflowRunStatus._('QUEUED');
  static const running = WorkflowRunStatus._('RUNNING');
  static const success = WorkflowRunStatus._('SUCCESS');
  static const failed = WorkflowRunStatus._('FAILED');
  static const timeout = WorkflowRunStatus._('TIMEOUT');
  static const stopping = WorkflowRunStatus._('STOPPING');
  static const stopped = WorkflowRunStatus._('STOPPED');

  final String value;

  const WorkflowRunStatus._(this.value);

  static const values = [
    starting,
    queued,
    running,
    success,
    failed,
    timeout,
    stopping,
    stopped
  ];

  static WorkflowRunStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => WorkflowRunStatus._(value));

  @override
  bool operator ==(other) => other is WorkflowRunStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Detailed information about a workflow run execution, including timing,
/// status, error information, and associated task instances. This structure
/// provides comprehensive visibility into the workflow execution lifecycle
/// within the Amazon Managed Workflows for Apache Airflow Serverless serverless
/// environment. The service tracks execution across distributed ECS worker
/// tasks and provides detailed timing information, error diagnostics, and task
/// instance relationships to support effective monitoring and troubleshooting
/// of complex workflow executions.
class WorkflowRunDetail {
  /// The timestamp when the workflow run completed execution, in ISO 8601
  /// date-time format. This value is null if the run is not complete.
  final DateTime? completedOn;

  /// The timestamp when the workflow run was created, in ISO 8601 date-time
  /// format.
  final DateTime? createdAt;

  /// The total duration of the workflow run execution in seconds. This value is
  /// null if the run is not complete.
  final int? duration;

  /// The error message if the workflow run failed. This value is null if the run
  /// completed successfully.
  final String? errorMessage;

  /// The timestamp when the workflow run was last modified, in ISO 8601 date-time
  /// format.
  final DateTime? modifiedAt;

  /// The unique identifier of this workflow run.
  final String? runId;

  /// The current execution state of the workflow run.
  final WorkflowRunStatus? runState;

  /// The type of workflow run.
  final RunType? runType;

  /// The timestamp when the workflow run started execution, in ISO 8601 date-time
  /// format.
  final DateTime? startedOn;

  /// A list of task instance IDs that are part of this workflow run.
  final List<String>? taskInstances;

  /// The Amazon Resource Name (ARN) of the workflow that contains this run.
  final String? workflowArn;

  /// The version of the workflow used for this run.
  final String? workflowVersion;

  WorkflowRunDetail({
    this.completedOn,
    this.createdAt,
    this.duration,
    this.errorMessage,
    this.modifiedAt,
    this.runId,
    this.runState,
    this.runType,
    this.startedOn,
    this.taskInstances,
    this.workflowArn,
    this.workflowVersion,
  });

  factory WorkflowRunDetail.fromJson(Map<String, dynamic> json) {
    return WorkflowRunDetail(
      completedOn: timeStampFromJson(json['CompletedOn']),
      createdAt: timeStampFromJson(json['CreatedAt']),
      duration: json['Duration'] as int?,
      errorMessage: json['ErrorMessage'] as String?,
      modifiedAt: timeStampFromJson(json['ModifiedAt']),
      runId: json['RunId'] as String?,
      runState:
          (json['RunState'] as String?)?.let(WorkflowRunStatus.fromString),
      runType: (json['RunType'] as String?)?.let(RunType.fromString),
      startedOn: timeStampFromJson(json['StartedOn']),
      taskInstances: (json['TaskInstances'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      workflowArn: json['WorkflowArn'] as String?,
      workflowVersion: json['WorkflowVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final completedOn = this.completedOn;
    final createdAt = this.createdAt;
    final duration = this.duration;
    final errorMessage = this.errorMessage;
    final modifiedAt = this.modifiedAt;
    final runId = this.runId;
    final runState = this.runState;
    final runType = this.runType;
    final startedOn = this.startedOn;
    final taskInstances = this.taskInstances;
    final workflowArn = this.workflowArn;
    final workflowVersion = this.workflowVersion;
    return {
      if (completedOn != null) 'CompletedOn': iso8601ToJson(completedOn),
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (duration != null) 'Duration': duration,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (modifiedAt != null) 'ModifiedAt': iso8601ToJson(modifiedAt),
      if (runId != null) 'RunId': runId,
      if (runState != null) 'RunState': runState.value,
      if (runType != null) 'RunType': runType.value,
      if (startedOn != null) 'StartedOn': iso8601ToJson(startedOn),
      if (taskInstances != null) 'TaskInstances': taskInstances,
      if (workflowArn != null) 'WorkflowArn': workflowArn,
      if (workflowVersion != null) 'WorkflowVersion': workflowVersion,
    };
  }
}

/// Summary information about a workflow, including basic identification and
/// metadata.
class WorkflowSummary {
  /// The Amazon Resource Name (ARN) of the workflow.
  final String workflowArn;

  /// The timestamp when the workflow was created, in ISO 8601 date-time format.
  final DateTime? createdAt;

  /// The description of the workflow.
  final String? description;

  /// The timestamp when the workflow was last modified, in ISO 8601 date-time
  /// format.
  final DateTime? modifiedAt;

  /// The name of the workflow.
  final String? name;

  /// The trigger mode for the workflow execution.
  final String? triggerMode;

  /// The current status of the workflow.
  final WorkflowStatus? workflowStatus;

  /// The version identifier of the workflow.
  final String? workflowVersion;

  WorkflowSummary({
    required this.workflowArn,
    this.createdAt,
    this.description,
    this.modifiedAt,
    this.name,
    this.triggerMode,
    this.workflowStatus,
    this.workflowVersion,
  });

  factory WorkflowSummary.fromJson(Map<String, dynamic> json) {
    return WorkflowSummary(
      workflowArn: (json['WorkflowArn'] as String?) ?? '',
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      modifiedAt: timeStampFromJson(json['ModifiedAt']),
      name: json['Name'] as String?,
      triggerMode: json['TriggerMode'] as String?,
      workflowStatus:
          (json['WorkflowStatus'] as String?)?.let(WorkflowStatus.fromString),
      workflowVersion: json['WorkflowVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final workflowArn = this.workflowArn;
    final createdAt = this.createdAt;
    final description = this.description;
    final modifiedAt = this.modifiedAt;
    final name = this.name;
    final triggerMode = this.triggerMode;
    final workflowStatus = this.workflowStatus;
    final workflowVersion = this.workflowVersion;
    return {
      'WorkflowArn': workflowArn,
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (description != null) 'Description': description,
      if (modifiedAt != null) 'ModifiedAt': iso8601ToJson(modifiedAt),
      if (name != null) 'Name': name,
      if (triggerMode != null) 'TriggerMode': triggerMode,
      if (workflowStatus != null) 'WorkflowStatus': workflowStatus.value,
      if (workflowVersion != null) 'WorkflowVersion': workflowVersion,
    };
  }
}

class WorkflowStatus {
  static const ready = WorkflowStatus._('READY');
  static const deleting = WorkflowStatus._('DELETING');

  final String value;

  const WorkflowStatus._(this.value);

  static const values = [ready, deleting];

  static WorkflowStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => WorkflowStatus._(value));

  @override
  bool operator ==(other) => other is WorkflowStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration for workflow logging that specifies where you should store
/// your workflow execution logs. Amazon Managed Workflows for Apache Airflow
/// Serverless provides comprehensive logging capabilities that capture workflow
/// execution details, task-level information, and system events. Logs are
/// automatically exported to your specified CloudWatch log group using remote
/// logging functionality, providing centralized observability across the
/// distributed, multi-tenant execution environment. This enables effective
/// debugging, monitoring, and compliance auditing of workflow executions.
class LoggingConfiguration {
  /// The name of the CloudWatch log group where workflow execution logs are
  /// stored.
  final String logGroupName;

  LoggingConfiguration({
    required this.logGroupName,
  });

  factory LoggingConfiguration.fromJson(Map<String, dynamic> json) {
    return LoggingConfiguration(
      logGroupName: (json['LogGroupName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final logGroupName = this.logGroupName;
    return {
      'LogGroupName': logGroupName,
    };
  }
}

/// Network configuration for workflow execution. Specifies VPC security groups
/// and subnets for secure network access. When provided, Amazon Managed
/// Workflows for Apache Airflow Serverless deploys ECS worker tasks in your
/// specified VPC configuration, enabling secure access to VPC-only resources.
/// The service uses a proxy API container architecture where one container
/// handles external communication while the worker container connects to your
/// VPC for task execution. This design provides both security isolation and
/// connectivity flexibility.
class NetworkConfiguration {
  /// A list of VPC security group IDs to associate with the workflow execution
  /// environment.
  final List<String>? securityGroupIds;

  /// A list of VPC subnet IDs where the workflow execution environment is
  /// deployed.
  final List<String>? subnetIds;

  NetworkConfiguration({
    this.securityGroupIds,
    this.subnetIds,
  });

  factory NetworkConfiguration.fromJson(Map<String, dynamic> json) {
    return NetworkConfiguration(
      securityGroupIds: (json['SecurityGroupIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      subnetIds: (json['SubnetIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    return {
      if (securityGroupIds != null) 'SecurityGroupIds': securityGroupIds,
      if (subnetIds != null) 'SubnetIds': subnetIds,
    };
  }
}

/// Configuration for encrypting workflow data at rest and in transit. Amazon
/// Managed Workflows for Apache Airflow Serverless provides comprehensive
/// encryption capabilities to protect sensitive workflow data, parameters, and
/// execution logs. When using customer-managed keys, the service integrates
/// with Amazon Web Services KMS to provide fine-grained access control and
/// audit capabilities. Encryption is applied consistently across the
/// distributed execution environment including task containers, metadata
/// storage, and log streams.
class EncryptionConfiguration {
  /// The type of encryption to use. Values are <code>AWS_MANAGED_KEY</code>
  /// (Amazon Web Services manages the encryption key) or
  /// <code>CUSTOMER_MANAGED_KEY</code> (you provide a KMS key).
  final EncryptionType type;

  /// The ID or ARN of the Amazon Web Services KMS key to use for encryption.
  /// Required when <code>Type</code> is <code>CUSTOMER_MANAGED_KEY</code>.
  final String? kmsKeyId;

  EncryptionConfiguration({
    required this.type,
    this.kmsKeyId,
  });

  factory EncryptionConfiguration.fromJson(Map<String, dynamic> json) {
    return EncryptionConfiguration(
      type: EncryptionType.fromString((json['Type'] as String?) ?? ''),
      kmsKeyId: json['KmsKeyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final kmsKeyId = this.kmsKeyId;
    return {
      'Type': type.value,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
    };
  }
}

class EncryptionType {
  static const awsManagedKey = EncryptionType._('AWS_MANAGED_KEY');
  static const customerManagedKey = EncryptionType._('CUSTOMER_MANAGED_KEY');

  final String value;

  const EncryptionType._(this.value);

  static const values = [awsManagedKey, customerManagedKey];

  static EncryptionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EncryptionType._(value));

  @override
  bool operator ==(other) => other is EncryptionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Summary information about a task instance within a workflow run, including
/// its status and execution details.
class TaskInstanceSummary {
  /// The duration of the task instance execution in seconds. This value is null
  /// if the task is not complete.
  final int? durationInSeconds;

  /// The name of the Apache Airflow operator used for this task instance.
  final String? operatorName;

  /// The unique identifier of the workflow run that contains this task instance.
  final String? runId;

  /// The current status of the task instance.
  final TaskInstanceStatus? status;

  /// The unique identifier of this task instance.
  final String? taskInstanceId;

  /// The Amazon Resource Name (ARN) of the workflow that contains this task
  /// instance.
  final String? workflowArn;

  /// The version of the workflow that contains this task instance.
  final String? workflowVersion;

  TaskInstanceSummary({
    this.durationInSeconds,
    this.operatorName,
    this.runId,
    this.status,
    this.taskInstanceId,
    this.workflowArn,
    this.workflowVersion,
  });

  factory TaskInstanceSummary.fromJson(Map<String, dynamic> json) {
    return TaskInstanceSummary(
      durationInSeconds: json['DurationInSeconds'] as int?,
      operatorName: json['OperatorName'] as String?,
      runId: json['RunId'] as String?,
      status: (json['Status'] as String?)?.let(TaskInstanceStatus.fromString),
      taskInstanceId: json['TaskInstanceId'] as String?,
      workflowArn: json['WorkflowArn'] as String?,
      workflowVersion: json['WorkflowVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final durationInSeconds = this.durationInSeconds;
    final operatorName = this.operatorName;
    final runId = this.runId;
    final status = this.status;
    final taskInstanceId = this.taskInstanceId;
    final workflowArn = this.workflowArn;
    final workflowVersion = this.workflowVersion;
    return {
      if (durationInSeconds != null) 'DurationInSeconds': durationInSeconds,
      if (operatorName != null) 'OperatorName': operatorName,
      if (runId != null) 'RunId': runId,
      if (status != null) 'Status': status.value,
      if (taskInstanceId != null) 'TaskInstanceId': taskInstanceId,
      if (workflowArn != null) 'WorkflowArn': workflowArn,
      if (workflowVersion != null) 'WorkflowVersion': workflowVersion,
    };
  }
}

class TaskInstanceStatus {
  static const queued = TaskInstanceStatus._('QUEUED');
  static const failed = TaskInstanceStatus._('FAILED');
  static const scheduled = TaskInstanceStatus._('SCHEDULED');
  static const running = TaskInstanceStatus._('RUNNING');
  static const success = TaskInstanceStatus._('SUCCESS');
  static const upForReschedule = TaskInstanceStatus._('UP_FOR_RESCHEDULE');
  static const upForRetry = TaskInstanceStatus._('UP_FOR_RETRY');
  static const upstreamFailed = TaskInstanceStatus._('UPSTREAM_FAILED');
  static const removed = TaskInstanceStatus._('REMOVED');
  static const restarting = TaskInstanceStatus._('RESTARTING');
  static const deferred = TaskInstanceStatus._('DEFERRED');
  static const none = TaskInstanceStatus._('NONE');
  static const cancelled = TaskInstanceStatus._('CANCELLED');
  static const timeout = TaskInstanceStatus._('TIMEOUT');

  final String value;

  const TaskInstanceStatus._(this.value);

  static const values = [
    queued,
    failed,
    scheduled,
    running,
    success,
    upForReschedule,
    upForRetry,
    upstreamFailed,
    removed,
    restarting,
    deferred,
    none,
    cancelled,
    timeout
  ];

  static TaskInstanceStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TaskInstanceStatus._(value));

  @override
  bool operator ==(other) =>
      other is TaskInstanceStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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

class OperationTimeoutException extends _s.GenericAwsException {
  OperationTimeoutException({String? type, String? message})
      : super(type: type, code: 'OperationTimeoutException', message: message);
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
  'OperationTimeoutException': (type, message) =>
      OperationTimeoutException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
