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

/// Amazon EventBridge Pipes connects event sources to targets. Pipes reduces
/// the need for specialized knowledge and integration code when developing
/// event driven architectures. This helps ensures consistency across your
/// company’s applications. With Pipes, the target can be any available
/// EventBridge target. To set up a pipe, you select the event source, add
/// optional event filtering, define optional enrichment, and select the target
/// for the event data.
class EventBridgePipes {
  final _s.RestJsonProtocol _protocol;
  EventBridgePipes({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'pipes',
            signingName: 'pipes',
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

  /// Create a pipe. Amazon EventBridge Pipes connect event sources to targets
  /// and reduces the need for specialized knowledge and integration code.
  ///
  /// May throw [InternalException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [name] :
  /// The name of the pipe.
  ///
  /// Parameter [roleArn] :
  /// The ARN of the role that allows the pipe to send data to the target.
  ///
  /// Parameter [source] :
  /// The ARN of the source resource.
  ///
  /// Parameter [target] :
  /// The ARN of the target resource.
  ///
  /// Parameter [description] :
  /// A description of the pipe.
  ///
  /// Parameter [desiredState] :
  /// The state the pipe should be in.
  ///
  /// Parameter [enrichment] :
  /// The ARN of the enrichment resource.
  ///
  /// Parameter [enrichmentParameters] :
  /// The parameters required to set up enrichment on your pipe.
  ///
  /// Parameter [logConfiguration] :
  /// The logging configuration settings for the pipe.
  ///
  /// Parameter [sourceParameters] :
  /// The parameters required to set up a source for your pipe.
  ///
  /// Parameter [tags] :
  /// The list of key-value pairs to associate with the pipe.
  ///
  /// Parameter [targetParameters] :
  /// The parameters required to set up a target for your pipe.
  ///
  /// For more information about pipe target parameters, including how to use
  /// dynamic path parameters, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-pipes-event-target.html">Target
  /// parameters</a> in the <i>Amazon EventBridge User Guide</i>.
  Future<CreatePipeResponse> createPipe({
    required String name,
    required String roleArn,
    required String source,
    required String target,
    String? description,
    RequestedPipeState? desiredState,
    String? enrichment,
    PipeEnrichmentParameters? enrichmentParameters,
    PipeLogConfigurationParameters? logConfiguration,
    PipeSourceParameters? sourceParameters,
    Map<String, String>? tags,
    PipeTargetParameters? targetParameters,
  }) async {
    final $payload = <String, dynamic>{
      'RoleArn': roleArn,
      'Source': source,
      'Target': target,
      if (description != null) 'Description': description,
      if (desiredState != null) 'DesiredState': desiredState.toValue(),
      if (enrichment != null) 'Enrichment': enrichment,
      if (enrichmentParameters != null)
        'EnrichmentParameters': enrichmentParameters,
      if (logConfiguration != null) 'LogConfiguration': logConfiguration,
      if (sourceParameters != null) 'SourceParameters': sourceParameters,
      if (tags != null) 'Tags': tags,
      if (targetParameters != null) 'TargetParameters': targetParameters,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/pipes/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreatePipeResponse.fromJson(response);
  }

  /// Delete an existing pipe. For more information about pipes, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-pipes.html">Amazon
  /// EventBridge Pipes</a> in the Amazon EventBridge User Guide.
  ///
  /// May throw [InternalException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [name] :
  /// The name of the pipe.
  Future<DeletePipeResponse> deletePipe({
    required String name,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/pipes/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeletePipeResponse.fromJson(response);
  }

  /// Get the information about an existing pipe. For more information about
  /// pipes, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-pipes.html">Amazon
  /// EventBridge Pipes</a> in the Amazon EventBridge User Guide.
  ///
  /// May throw [InternalException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [name] :
  /// The name of the pipe.
  Future<DescribePipeResponse> describePipe({
    required String name,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/pipes/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribePipeResponse.fromJson(response);
  }

  /// Get the pipes associated with this account. For more information about
  /// pipes, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-pipes.html">Amazon
  /// EventBridge Pipes</a> in the Amazon EventBridge User Guide.
  ///
  /// May throw [InternalException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [currentState] :
  /// The state the pipe is in.
  ///
  /// Parameter [desiredState] :
  /// The state the pipe should be in.
  ///
  /// Parameter [limit] :
  /// The maximum number of pipes to include in the response.
  ///
  /// Parameter [namePrefix] :
  /// A value that will return a subset of the pipes associated with this
  /// account. For example, <code>"NamePrefix": "ABC"</code> will return all
  /// endpoints with "ABC" in the name.
  ///
  /// Parameter [nextToken] :
  /// If <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page. Keep all other arguments unchanged. Each pagination token expires
  /// after 24 hours. Using an expired pagination token will return an HTTP 400
  /// InvalidToken error.
  ///
  /// Parameter [sourcePrefix] :
  /// The prefix matching the pipe source.
  ///
  /// Parameter [targetPrefix] :
  /// The prefix matching the pipe target.
  Future<ListPipesResponse> listPipes({
    PipeState? currentState,
    RequestedPipeState? desiredState,
    int? limit,
    String? namePrefix,
    String? nextToken,
    String? sourcePrefix,
    String? targetPrefix,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (currentState != null) 'CurrentState': [currentState.toValue()],
      if (desiredState != null) 'DesiredState': [desiredState.toValue()],
      if (limit != null) 'Limit': [limit.toString()],
      if (namePrefix != null) 'NamePrefix': [namePrefix],
      if (nextToken != null) 'NextToken': [nextToken],
      if (sourcePrefix != null) 'SourcePrefix': [sourcePrefix],
      if (targetPrefix != null) 'TargetPrefix': [targetPrefix],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/pipes',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPipesResponse.fromJson(response);
  }

  /// Displays the tags associated with a pipe.
  ///
  /// May throw [InternalException].
  /// May throw [ValidationException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the pipe for which you want to view tags.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Start an existing pipe.
  ///
  /// May throw [InternalException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [name] :
  /// The name of the pipe.
  Future<StartPipeResponse> startPipe({
    required String name,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/v1/pipes/${Uri.encodeComponent(name)}/start',
      exceptionFnMap: _exceptionFns,
    );
    return StartPipeResponse.fromJson(response);
  }

  /// Stop an existing pipe.
  ///
  /// May throw [InternalException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [name] :
  /// The name of the pipe.
  Future<StopPipeResponse> stopPipe({
    required String name,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/v1/pipes/${Uri.encodeComponent(name)}/stop',
      exceptionFnMap: _exceptionFns,
    );
    return StopPipeResponse.fromJson(response);
  }

  /// Assigns one or more tags (key-value pairs) to the specified pipe. Tags can
  /// help you organize and categorize your resources. You can also use them to
  /// scope user permissions by granting a user permission to access or change
  /// only resources with certain tag values.
  ///
  /// Tags don't have any semantic meaning to Amazon Web Services and are
  /// interpreted strictly as strings of characters.
  ///
  /// You can use the <code>TagResource</code> action with a pipe that already
  /// has tags. If you specify a new tag key, this tag is appended to the list
  /// of tags associated with the pipe. If you specify a tag key that is already
  /// associated with the pipe, the new tag value that you specify replaces the
  /// previous value for that tag.
  ///
  /// You can associate as many as 50 tags with a pipe.
  ///
  /// May throw [InternalException].
  /// May throw [ValidationException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the pipe.
  ///
  /// Parameter [tags] :
  /// The list of key-value pairs associated with the pipe.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes one or more tags from the specified pipes.
  ///
  /// May throw [InternalException].
  /// May throw [ValidationException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the pipe.
  ///
  /// Parameter [tagKeys] :
  /// The list of tag keys to remove from the pipe.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Update an existing pipe. When you call <code>UpdatePipe</code>,
  /// EventBridge only the updates fields you have specified in the request; the
  /// rest remain unchanged. The exception to this is if you modify any Amazon
  /// Web Services-service specific fields in the <code>SourceParameters</code>,
  /// <code>EnrichmentParameters</code>, or <code>TargetParameters</code>
  /// objects. For example, <code>DynamoDBStreamParameters</code> or
  /// <code>EventBridgeEventBusParameters</code>. EventBridge updates the fields
  /// in these objects atomically as one and overrides existing values. This is
  /// by design, and means that if you don't specify an optional field in one of
  /// these <code>Parameters</code> objects, EventBridge sets that field to its
  /// system-default value during the update.
  ///
  /// For more information about pipes, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-pipes.html">
  /// Amazon EventBridge Pipes</a> in the Amazon EventBridge User Guide.
  ///
  /// May throw [InternalException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [name] :
  /// The name of the pipe.
  ///
  /// Parameter [roleArn] :
  /// The ARN of the role that allows the pipe to send data to the target.
  ///
  /// Parameter [description] :
  /// A description of the pipe.
  ///
  /// Parameter [desiredState] :
  /// The state the pipe should be in.
  ///
  /// Parameter [enrichment] :
  /// The ARN of the enrichment resource.
  ///
  /// Parameter [enrichmentParameters] :
  /// The parameters required to set up enrichment on your pipe.
  ///
  /// Parameter [logConfiguration] :
  /// The logging configuration settings for the pipe.
  ///
  /// Parameter [sourceParameters] :
  /// The parameters required to set up a source for your pipe.
  ///
  /// Parameter [target] :
  /// The ARN of the target resource.
  ///
  /// Parameter [targetParameters] :
  /// The parameters required to set up a target for your pipe.
  ///
  /// For more information about pipe target parameters, including how to use
  /// dynamic path parameters, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-pipes-event-target.html">Target
  /// parameters</a> in the <i>Amazon EventBridge User Guide</i>.
  Future<UpdatePipeResponse> updatePipe({
    required String name,
    required String roleArn,
    String? description,
    RequestedPipeState? desiredState,
    String? enrichment,
    PipeEnrichmentParameters? enrichmentParameters,
    PipeLogConfigurationParameters? logConfiguration,
    UpdatePipeSourceParameters? sourceParameters,
    String? target,
    PipeTargetParameters? targetParameters,
  }) async {
    final $payload = <String, dynamic>{
      'RoleArn': roleArn,
      if (description != null) 'Description': description,
      if (desiredState != null) 'DesiredState': desiredState.toValue(),
      if (enrichment != null) 'Enrichment': enrichment,
      if (enrichmentParameters != null)
        'EnrichmentParameters': enrichmentParameters,
      if (logConfiguration != null) 'LogConfiguration': logConfiguration,
      if (sourceParameters != null) 'SourceParameters': sourceParameters,
      if (target != null) 'Target': target,
      if (targetParameters != null) 'TargetParameters': targetParameters,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v1/pipes/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdatePipeResponse.fromJson(response);
  }
}

enum AssignPublicIp {
  enabled,
  disabled,
}

extension AssignPublicIpValueExtension on AssignPublicIp {
  String toValue() {
    switch (this) {
      case AssignPublicIp.enabled:
        return 'ENABLED';
      case AssignPublicIp.disabled:
        return 'DISABLED';
    }
  }
}

extension AssignPublicIpFromString on String {
  AssignPublicIp toAssignPublicIp() {
    switch (this) {
      case 'ENABLED':
        return AssignPublicIp.enabled;
      case 'DISABLED':
        return AssignPublicIp.disabled;
    }
    throw Exception('$this is not known in enum AssignPublicIp');
  }
}

/// This structure specifies the VPC subnets and security groups for the task,
/// and whether a public IP address is to be used. This structure is relevant
/// only for ECS tasks that use the <code>awsvpc</code> network mode.
class AwsVpcConfiguration {
  /// Specifies the subnets associated with the task. These subnets must all be in
  /// the same VPC. You can specify as many as 16 subnets.
  final List<String> subnets;

  /// Specifies whether the task's elastic network interface receives a public IP
  /// address. You can specify <code>ENABLED</code> only when
  /// <code>LaunchType</code> in <code>EcsParameters</code> is set to
  /// <code>FARGATE</code>.
  final AssignPublicIp? assignPublicIp;

  /// Specifies the security groups associated with the task. These security
  /// groups must all be in the same VPC. You can specify as many as five security
  /// groups. If you do not specify a security group, the default security group
  /// for the VPC is used.
  final List<String>? securityGroups;

  AwsVpcConfiguration({
    required this.subnets,
    this.assignPublicIp,
    this.securityGroups,
  });

  factory AwsVpcConfiguration.fromJson(Map<String, dynamic> json) {
    return AwsVpcConfiguration(
      subnets: (json['Subnets'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      assignPublicIp: (json['AssignPublicIp'] as String?)?.toAssignPublicIp(),
      securityGroups: (json['SecurityGroups'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final subnets = this.subnets;
    final assignPublicIp = this.assignPublicIp;
    final securityGroups = this.securityGroups;
    return {
      'Subnets': subnets,
      if (assignPublicIp != null) 'AssignPublicIp': assignPublicIp.toValue(),
      if (securityGroups != null) 'SecurityGroups': securityGroups,
    };
  }
}

/// The array properties for the submitted job, such as the size of the array.
/// The array size can be between 2 and 10,000. If you specify array properties
/// for a job, it becomes an array job. This parameter is used only if the
/// target is an Batch job.
class BatchArrayProperties {
  /// The size of the array, if this is an array batch job.
  final int? size;

  BatchArrayProperties({
    this.size,
  });

  factory BatchArrayProperties.fromJson(Map<String, dynamic> json) {
    return BatchArrayProperties(
      size: json['Size'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final size = this.size;
    return {
      if (size != null) 'Size': size,
    };
  }
}

/// The overrides that are sent to a container.
class BatchContainerOverrides {
  /// The command to send to the container that overrides the default command from
  /// the Docker image or the task definition.
  final List<String>? command;

  /// The environment variables to send to the container. You can add new
  /// environment variables, which are added to the container at launch, or you
  /// can override the existing environment variables from the Docker image or the
  /// task definition.
  /// <note>
  /// Environment variables cannot start with "<code>Batch</code>". This naming
  /// convention is reserved for variables that Batch sets.
  /// </note>
  final List<BatchEnvironmentVariable>? environment;

  /// The instance type to use for a multi-node parallel job.
  /// <note>
  /// This parameter isn't applicable to single-node container jobs or jobs that
  /// run on Fargate resources, and shouldn't be provided.
  /// </note>
  final String? instanceType;

  /// The type and amount of resources to assign to a container. This overrides
  /// the settings in the job definition. The supported resources include
  /// <code>GPU</code>, <code>MEMORY</code>, and <code>VCPU</code>.
  final List<BatchResourceRequirement>? resourceRequirements;

  BatchContainerOverrides({
    this.command,
    this.environment,
    this.instanceType,
    this.resourceRequirements,
  });

  factory BatchContainerOverrides.fromJson(Map<String, dynamic> json) {
    return BatchContainerOverrides(
      command: (json['Command'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      environment: (json['Environment'] as List?)
          ?.whereNotNull()
          .map((e) =>
              BatchEnvironmentVariable.fromJson(e as Map<String, dynamic>))
          .toList(),
      instanceType: json['InstanceType'] as String?,
      resourceRequirements: (json['ResourceRequirements'] as List?)
          ?.whereNotNull()
          .map((e) =>
              BatchResourceRequirement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final command = this.command;
    final environment = this.environment;
    final instanceType = this.instanceType;
    final resourceRequirements = this.resourceRequirements;
    return {
      if (command != null) 'Command': command,
      if (environment != null) 'Environment': environment,
      if (instanceType != null) 'InstanceType': instanceType,
      if (resourceRequirements != null)
        'ResourceRequirements': resourceRequirements,
    };
  }
}

/// The environment variables to send to the container. You can add new
/// environment variables, which are added to the container at launch, or you
/// can override the existing environment variables from the Docker image or the
/// task definition.
/// <note>
/// Environment variables cannot start with "<code>Batch</code>". This naming
/// convention is reserved for variables that Batch sets.
/// </note>
class BatchEnvironmentVariable {
  /// The name of the key-value pair. For environment variables, this is the name
  /// of the environment variable.
  final String? name;

  /// The value of the key-value pair. For environment variables, this is the
  /// value of the environment variable.
  final String? value;

  BatchEnvironmentVariable({
    this.name,
    this.value,
  });

  factory BatchEnvironmentVariable.fromJson(Map<String, dynamic> json) {
    return BatchEnvironmentVariable(
      name: json['Name'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      if (name != null) 'Name': name,
      if (value != null) 'Value': value,
    };
  }
}

/// An object that represents an Batch job dependency.
class BatchJobDependency {
  /// The job ID of the Batch job that's associated with this dependency.
  final String? jobId;

  /// The type of the job dependency.
  final BatchJobDependencyType? type;

  BatchJobDependency({
    this.jobId,
    this.type,
  });

  factory BatchJobDependency.fromJson(Map<String, dynamic> json) {
    return BatchJobDependency(
      jobId: json['JobId'] as String?,
      type: (json['Type'] as String?)?.toBatchJobDependencyType(),
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    final type = this.type;
    return {
      if (jobId != null) 'JobId': jobId,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum BatchJobDependencyType {
  nToN,
  sequential,
}

extension BatchJobDependencyTypeValueExtension on BatchJobDependencyType {
  String toValue() {
    switch (this) {
      case BatchJobDependencyType.nToN:
        return 'N_TO_N';
      case BatchJobDependencyType.sequential:
        return 'SEQUENTIAL';
    }
  }
}

extension BatchJobDependencyTypeFromString on String {
  BatchJobDependencyType toBatchJobDependencyType() {
    switch (this) {
      case 'N_TO_N':
        return BatchJobDependencyType.nToN;
      case 'SEQUENTIAL':
        return BatchJobDependencyType.sequential;
    }
    throw Exception('$this is not known in enum BatchJobDependencyType');
  }
}

/// The type and amount of a resource to assign to a container. The supported
/// resources include <code>GPU</code>, <code>MEMORY</code>, and
/// <code>VCPU</code>.
class BatchResourceRequirement {
  /// The type of resource to assign to a container. The supported resources
  /// include <code>GPU</code>, <code>MEMORY</code>, and <code>VCPU</code>.
  final BatchResourceRequirementType type;

  /// The quantity of the specified resource to reserve for the container. The
  /// values vary based on the <code>type</code> specified.
  /// <dl> <dt>type="GPU"</dt> <dd>
  /// The number of physical GPUs to reserve for the container. Make sure that the
  /// number of GPUs reserved for all containers in a job doesn't exceed the
  /// number of available GPUs on the compute resource that the job is launched
  /// on.
  /// <note>
  /// GPUs aren't available for jobs that are running on Fargate resources.
  /// </note> </dd> <dt>type="MEMORY"</dt> <dd>
  /// The memory hard limit (in MiB) present to the container. This parameter is
  /// supported for jobs that are running on EC2 resources. If your container
  /// attempts to exceed the memory specified, the container is terminated. This
  /// parameter maps to <code>Memory</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.23/#create-a-container"> Create
  /// a container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.23/">Docker Remote API</a> and
  /// the <code>--memory</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/">docker run</a>. You
  /// must specify at least 4 MiB of memory for a job. This is required but can be
  /// specified in several places for multi-node parallel (MNP) jobs. It must be
  /// specified for each node at least once. This parameter maps to
  /// <code>Memory</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.23/#create-a-container"> Create
  /// a container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.23/">Docker Remote API</a> and
  /// the <code>--memory</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/">docker run</a>.
  /// <note>
  /// If you're trying to maximize your resource utilization by providing your
  /// jobs as much memory as possible for a particular instance type, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/memory-management.html">Memory
  /// management</a> in the <i>Batch User Guide</i>.
  /// </note>
  /// For jobs that are running on Fargate resources, then <code>value</code> is
  /// the hard limit (in MiB), and must match one of the supported values and the
  /// <code>VCPU</code> values must be one of the values supported for that memory
  /// value.
  /// <dl> <dt>value = 512</dt> <dd>
  /// <code>VCPU</code> = 0.25
  /// </dd> <dt>value = 1024</dt> <dd>
  /// <code>VCPU</code> = 0.25 or 0.5
  /// </dd> <dt>value = 2048</dt> <dd>
  /// <code>VCPU</code> = 0.25, 0.5, or 1
  /// </dd> <dt>value = 3072</dt> <dd>
  /// <code>VCPU</code> = 0.5, or 1
  /// </dd> <dt>value = 4096</dt> <dd>
  /// <code>VCPU</code> = 0.5, 1, or 2
  /// </dd> <dt>value = 5120, 6144, or 7168</dt> <dd>
  /// <code>VCPU</code> = 1 or 2
  /// </dd> <dt>value = 8192</dt> <dd>
  /// <code>VCPU</code> = 1, 2, 4, or 8
  /// </dd> <dt>value = 9216, 10240, 11264, 12288, 13312, 14336, or 15360</dt>
  /// <dd>
  /// <code>VCPU</code> = 2 or 4
  /// </dd> <dt>value = 16384</dt> <dd>
  /// <code>VCPU</code> = 2, 4, or 8
  /// </dd> <dt>value = 17408, 18432, 19456, 21504, 22528, 23552, 25600, 26624,
  /// 27648, 29696, or 30720</dt> <dd>
  /// <code>VCPU</code> = 4
  /// </dd> <dt>value = 20480, 24576, or 28672</dt> <dd>
  /// <code>VCPU</code> = 4 or 8
  /// </dd> <dt>value = 36864, 45056, 53248, or 61440</dt> <dd>
  /// <code>VCPU</code> = 8
  /// </dd> <dt>value = 32768, 40960, 49152, or 57344</dt> <dd>
  /// <code>VCPU</code> = 8 or 16
  /// </dd> <dt>value = 65536, 73728, 81920, 90112, 98304, 106496, 114688, or
  /// 122880</dt> <dd>
  /// <code>VCPU</code> = 16
  /// </dd> </dl> </dd> <dt>type="VCPU"</dt> <dd>
  /// The number of vCPUs reserved for the container. This parameter maps to
  /// <code>CpuShares</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.23/#create-a-container"> Create
  /// a container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.23/">Docker Remote API</a> and
  /// the <code>--cpu-shares</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/">docker run</a>. Each
  /// vCPU is equivalent to 1,024 CPU shares. For EC2 resources, you must specify
  /// at least one vCPU. This is required but can be specified in several places;
  /// it must be specified for each node at least once.
  ///
  /// The default for the Fargate On-Demand vCPU resource count quota is 6 vCPUs.
  /// For more information about Fargate quotas, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/ecs-service.html#service-quotas-fargate">Fargate
  /// quotas</a> in the <i>Amazon Web Services General Reference</i>.
  ///
  /// For jobs that are running on Fargate resources, then <code>value</code> must
  /// match one of the supported values and the <code>MEMORY</code> values must be
  /// one of the values supported for that <code>VCPU</code> value. The supported
  /// values are 0.25, 0.5, 1, 2, 4, 8, and 16
  /// <dl> <dt>value = 0.25</dt> <dd>
  /// <code>MEMORY</code> = 512, 1024, or 2048
  /// </dd> <dt>value = 0.5</dt> <dd>
  /// <code>MEMORY</code> = 1024, 2048, 3072, or 4096
  /// </dd> <dt>value = 1</dt> <dd>
  /// <code>MEMORY</code> = 2048, 3072, 4096, 5120, 6144, 7168, or 8192
  /// </dd> <dt>value = 2</dt> <dd>
  /// <code>MEMORY</code> = 4096, 5120, 6144, 7168, 8192, 9216, 10240, 11264,
  /// 12288, 13312, 14336, 15360, or 16384
  /// </dd> <dt>value = 4</dt> <dd>
  /// <code>MEMORY</code> = 8192, 9216, 10240, 11264, 12288, 13312, 14336, 15360,
  /// 16384, 17408, 18432, 19456, 20480, 21504, 22528, 23552, 24576, 25600, 26624,
  /// 27648, 28672, 29696, or 30720
  /// </dd> <dt>value = 8</dt> <dd>
  /// <code>MEMORY</code> = 16384, 20480, 24576, 28672, 32768, 36864, 40960,
  /// 45056, 49152, 53248, 57344, or 61440
  /// </dd> <dt>value = 16</dt> <dd>
  /// <code>MEMORY</code> = 32768, 40960, 49152, 57344, 65536, 73728, 81920,
  /// 90112, 98304, 106496, 114688, or 122880
  /// </dd> </dl> </dd> </dl>
  final String value;

  BatchResourceRequirement({
    required this.type,
    required this.value,
  });

  factory BatchResourceRequirement.fromJson(Map<String, dynamic> json) {
    return BatchResourceRequirement(
      type: (json['Type'] as String).toBatchResourceRequirementType(),
      value: json['Value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final value = this.value;
    return {
      'Type': type.toValue(),
      'Value': value,
    };
  }
}

enum BatchResourceRequirementType {
  gpu,
  memory,
  vcpu,
}

extension BatchResourceRequirementTypeValueExtension
    on BatchResourceRequirementType {
  String toValue() {
    switch (this) {
      case BatchResourceRequirementType.gpu:
        return 'GPU';
      case BatchResourceRequirementType.memory:
        return 'MEMORY';
      case BatchResourceRequirementType.vcpu:
        return 'VCPU';
    }
  }
}

extension BatchResourceRequirementTypeFromString on String {
  BatchResourceRequirementType toBatchResourceRequirementType() {
    switch (this) {
      case 'GPU':
        return BatchResourceRequirementType.gpu;
      case 'MEMORY':
        return BatchResourceRequirementType.memory;
      case 'VCPU':
        return BatchResourceRequirementType.vcpu;
    }
    throw Exception('$this is not known in enum BatchResourceRequirementType');
  }
}

/// The retry strategy that's associated with a job. For more information, see
/// <a
/// href="https://docs.aws.amazon.com/batch/latest/userguide/job_retries.html">
/// Automated job retries</a> in the <i>Batch User Guide</i>.
class BatchRetryStrategy {
  /// The number of times to move a job to the <code>RUNNABLE</code> status. If
  /// the value of <code>attempts</code> is greater than one, the job is retried
  /// on failure the same number of attempts as the value.
  final int? attempts;

  BatchRetryStrategy({
    this.attempts,
  });

  factory BatchRetryStrategy.fromJson(Map<String, dynamic> json) {
    return BatchRetryStrategy(
      attempts: json['Attempts'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final attempts = this.attempts;
    return {
      if (attempts != null) 'Attempts': attempts,
    };
  }
}

/// The details of a capacity provider strategy. To learn more, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_CapacityProviderStrategyItem.html">CapacityProviderStrategyItem</a>
/// in the Amazon ECS API Reference.
class CapacityProviderStrategyItem {
  /// The short name of the capacity provider.
  final String capacityProvider;

  /// The base value designates how many tasks, at a minimum, to run on the
  /// specified capacity provider. Only one capacity provider in a capacity
  /// provider strategy can have a base defined. If no value is specified, the
  /// default value of 0 is used.
  final int? base;

  /// The weight value designates the relative percentage of the total number of
  /// tasks launched that should use the specified capacity provider. The weight
  /// value is taken into consideration after the base value, if defined, is
  /// satisfied.
  final int? weight;

  CapacityProviderStrategyItem({
    required this.capacityProvider,
    this.base,
    this.weight,
  });

  factory CapacityProviderStrategyItem.fromJson(Map<String, dynamic> json) {
    return CapacityProviderStrategyItem(
      capacityProvider: json['capacityProvider'] as String,
      base: json['base'] as int?,
      weight: json['weight'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final capacityProvider = this.capacityProvider;
    final base = this.base;
    final weight = this.weight;
    return {
      'capacityProvider': capacityProvider,
      if (base != null) 'base': base,
      if (weight != null) 'weight': weight,
    };
  }
}

/// The Amazon CloudWatch Logs logging configuration settings for the pipe.
class CloudwatchLogsLogDestination {
  /// The Amazon Web Services Resource Name (ARN) for the CloudWatch log group to
  /// which EventBridge sends the log records.
  final String? logGroupArn;

  CloudwatchLogsLogDestination({
    this.logGroupArn,
  });

  factory CloudwatchLogsLogDestination.fromJson(Map<String, dynamic> json) {
    return CloudwatchLogsLogDestination(
      logGroupArn: json['LogGroupArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final logGroupArn = this.logGroupArn;
    return {
      if (logGroupArn != null) 'LogGroupArn': logGroupArn,
    };
  }
}

/// The Amazon CloudWatch Logs logging configuration settings for the pipe.
class CloudwatchLogsLogDestinationParameters {
  /// The Amazon Web Services Resource Name (ARN) for the CloudWatch log group to
  /// which EventBridge sends the log records.
  final String logGroupArn;

  CloudwatchLogsLogDestinationParameters({
    required this.logGroupArn,
  });

  Map<String, dynamic> toJson() {
    final logGroupArn = this.logGroupArn;
    return {
      'LogGroupArn': logGroupArn,
    };
  }
}

class CreatePipeResponse {
  /// The ARN of the pipe.
  final String? arn;

  /// The time the pipe was created.
  final DateTime? creationTime;

  /// The state the pipe is in.
  final PipeState? currentState;

  /// The state the pipe should be in.
  final RequestedPipeState? desiredState;

  /// When the pipe was last updated, in <a
  /// href="https://www.w3.org/TR/NOTE-datetime">ISO-8601 format</a>
  /// (YYYY-MM-DDThh:mm:ss.sTZD).
  final DateTime? lastModifiedTime;

  /// The name of the pipe.
  final String? name;

  CreatePipeResponse({
    this.arn,
    this.creationTime,
    this.currentState,
    this.desiredState,
    this.lastModifiedTime,
    this.name,
  });

  factory CreatePipeResponse.fromJson(Map<String, dynamic> json) {
    return CreatePipeResponse(
      arn: json['Arn'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      currentState: (json['CurrentState'] as String?)?.toPipeState(),
      desiredState: (json['DesiredState'] as String?)?.toRequestedPipeState(),
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final currentState = this.currentState;
    final desiredState = this.desiredState;
    final lastModifiedTime = this.lastModifiedTime;
    final name = this.name;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (currentState != null) 'CurrentState': currentState.toValue(),
      if (desiredState != null) 'DesiredState': desiredState.toValue(),
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (name != null) 'Name': name,
    };
  }
}

/// A <code>DeadLetterConfig</code> object that contains information about a
/// dead-letter queue configuration.
class DeadLetterConfig {
  /// The ARN of the specified target for the dead-letter queue.
  ///
  /// For Amazon Kinesis stream and Amazon DynamoDB stream sources, specify either
  /// an Amazon SNS topic or Amazon SQS queue ARN.
  final String? arn;

  DeadLetterConfig({
    this.arn,
  });

  factory DeadLetterConfig.fromJson(Map<String, dynamic> json) {
    return DeadLetterConfig(
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

class DeletePipeResponse {
  /// The ARN of the pipe.
  final String? arn;

  /// The time the pipe was created.
  final DateTime? creationTime;

  /// The state the pipe is in.
  final PipeState? currentState;

  /// The state the pipe should be in.
  final RequestedPipeStateDescribeResponse? desiredState;

  /// When the pipe was last updated, in <a
  /// href="https://www.w3.org/TR/NOTE-datetime">ISO-8601 format</a>
  /// (YYYY-MM-DDThh:mm:ss.sTZD).
  final DateTime? lastModifiedTime;

  /// The name of the pipe.
  final String? name;

  DeletePipeResponse({
    this.arn,
    this.creationTime,
    this.currentState,
    this.desiredState,
    this.lastModifiedTime,
    this.name,
  });

  factory DeletePipeResponse.fromJson(Map<String, dynamic> json) {
    return DeletePipeResponse(
      arn: json['Arn'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      currentState: (json['CurrentState'] as String?)?.toPipeState(),
      desiredState: (json['DesiredState'] as String?)
          ?.toRequestedPipeStateDescribeResponse(),
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final currentState = this.currentState;
    final desiredState = this.desiredState;
    final lastModifiedTime = this.lastModifiedTime;
    final name = this.name;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (currentState != null) 'CurrentState': currentState.toValue(),
      if (desiredState != null) 'DesiredState': desiredState.toValue(),
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (name != null) 'Name': name,
    };
  }
}

class DescribePipeResponse {
  /// The ARN of the pipe.
  final String? arn;

  /// The time the pipe was created.
  final DateTime? creationTime;

  /// The state the pipe is in.
  final PipeState? currentState;

  /// A description of the pipe.
  final String? description;

  /// The state the pipe should be in.
  final RequestedPipeStateDescribeResponse? desiredState;

  /// The ARN of the enrichment resource.
  final String? enrichment;

  /// The parameters required to set up enrichment on your pipe.
  final PipeEnrichmentParameters? enrichmentParameters;

  /// When the pipe was last updated, in <a
  /// href="https://www.w3.org/TR/NOTE-datetime">ISO-8601 format</a>
  /// (YYYY-MM-DDThh:mm:ss.sTZD).
  final DateTime? lastModifiedTime;

  /// The logging configuration settings for the pipe.
  final PipeLogConfiguration? logConfiguration;

  /// The name of the pipe.
  final String? name;

  /// The ARN of the role that allows the pipe to send data to the target.
  final String? roleArn;

  /// The ARN of the source resource.
  final String? source;

  /// The parameters required to set up a source for your pipe.
  final PipeSourceParameters? sourceParameters;

  /// The reason the pipe is in its current state.
  final String? stateReason;

  /// The list of key-value pairs to associate with the pipe.
  final Map<String, String>? tags;

  /// The ARN of the target resource.
  final String? target;

  /// The parameters required to set up a target for your pipe.
  ///
  /// For more information about pipe target parameters, including how to use
  /// dynamic path parameters, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-pipes-event-target.html">Target
  /// parameters</a> in the <i>Amazon EventBridge User Guide</i>.
  final PipeTargetParameters? targetParameters;

  DescribePipeResponse({
    this.arn,
    this.creationTime,
    this.currentState,
    this.description,
    this.desiredState,
    this.enrichment,
    this.enrichmentParameters,
    this.lastModifiedTime,
    this.logConfiguration,
    this.name,
    this.roleArn,
    this.source,
    this.sourceParameters,
    this.stateReason,
    this.tags,
    this.target,
    this.targetParameters,
  });

  factory DescribePipeResponse.fromJson(Map<String, dynamic> json) {
    return DescribePipeResponse(
      arn: json['Arn'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      currentState: (json['CurrentState'] as String?)?.toPipeState(),
      description: json['Description'] as String?,
      desiredState: (json['DesiredState'] as String?)
          ?.toRequestedPipeStateDescribeResponse(),
      enrichment: json['Enrichment'] as String?,
      enrichmentParameters: json['EnrichmentParameters'] != null
          ? PipeEnrichmentParameters.fromJson(
              json['EnrichmentParameters'] as Map<String, dynamic>)
          : null,
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      logConfiguration: json['LogConfiguration'] != null
          ? PipeLogConfiguration.fromJson(
              json['LogConfiguration'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      roleArn: json['RoleArn'] as String?,
      source: json['Source'] as String?,
      sourceParameters: json['SourceParameters'] != null
          ? PipeSourceParameters.fromJson(
              json['SourceParameters'] as Map<String, dynamic>)
          : null,
      stateReason: json['StateReason'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      target: json['Target'] as String?,
      targetParameters: json['TargetParameters'] != null
          ? PipeTargetParameters.fromJson(
              json['TargetParameters'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final currentState = this.currentState;
    final description = this.description;
    final desiredState = this.desiredState;
    final enrichment = this.enrichment;
    final enrichmentParameters = this.enrichmentParameters;
    final lastModifiedTime = this.lastModifiedTime;
    final logConfiguration = this.logConfiguration;
    final name = this.name;
    final roleArn = this.roleArn;
    final source = this.source;
    final sourceParameters = this.sourceParameters;
    final stateReason = this.stateReason;
    final tags = this.tags;
    final target = this.target;
    final targetParameters = this.targetParameters;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (currentState != null) 'CurrentState': currentState.toValue(),
      if (description != null) 'Description': description,
      if (desiredState != null) 'DesiredState': desiredState.toValue(),
      if (enrichment != null) 'Enrichment': enrichment,
      if (enrichmentParameters != null)
        'EnrichmentParameters': enrichmentParameters,
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (logConfiguration != null) 'LogConfiguration': logConfiguration,
      if (name != null) 'Name': name,
      if (roleArn != null) 'RoleArn': roleArn,
      if (source != null) 'Source': source,
      if (sourceParameters != null) 'SourceParameters': sourceParameters,
      if (stateReason != null) 'StateReason': stateReason,
      if (tags != null) 'Tags': tags,
      if (target != null) 'Target': target,
      if (targetParameters != null) 'TargetParameters': targetParameters,
    };
  }
}

/// Maps source data to a dimension in the target Timestream for LiveAnalytics
/// table.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/timestream/latest/developerguide/concepts.html">Amazon
/// Timestream for LiveAnalytics concepts</a>
class DimensionMapping {
  /// The metadata attributes of the time series. For example, the name and
  /// Availability Zone of an Amazon EC2 instance or the name of the manufacturer
  /// of a wind turbine are dimensions.
  final String dimensionName;

  /// Dynamic path to the dimension value in the source event.
  final String dimensionValue;

  /// The data type of the dimension for the time-series data.
  final DimensionValueType dimensionValueType;

  DimensionMapping({
    required this.dimensionName,
    required this.dimensionValue,
    required this.dimensionValueType,
  });

  factory DimensionMapping.fromJson(Map<String, dynamic> json) {
    return DimensionMapping(
      dimensionName: json['DimensionName'] as String,
      dimensionValue: json['DimensionValue'] as String,
      dimensionValueType:
          (json['DimensionValueType'] as String).toDimensionValueType(),
    );
  }

  Map<String, dynamic> toJson() {
    final dimensionName = this.dimensionName;
    final dimensionValue = this.dimensionValue;
    final dimensionValueType = this.dimensionValueType;
    return {
      'DimensionName': dimensionName,
      'DimensionValue': dimensionValue,
      'DimensionValueType': dimensionValueType.toValue(),
    };
  }
}

enum DimensionValueType {
  varchar,
}

extension DimensionValueTypeValueExtension on DimensionValueType {
  String toValue() {
    switch (this) {
      case DimensionValueType.varchar:
        return 'VARCHAR';
    }
  }
}

extension DimensionValueTypeFromString on String {
  DimensionValueType toDimensionValueType() {
    switch (this) {
      case 'VARCHAR':
        return DimensionValueType.varchar;
    }
    throw Exception('$this is not known in enum DimensionValueType');
  }
}

enum DynamoDBStreamStartPosition {
  trimHorizon,
  latest,
}

extension DynamoDBStreamStartPositionValueExtension
    on DynamoDBStreamStartPosition {
  String toValue() {
    switch (this) {
      case DynamoDBStreamStartPosition.trimHorizon:
        return 'TRIM_HORIZON';
      case DynamoDBStreamStartPosition.latest:
        return 'LATEST';
    }
  }
}

extension DynamoDBStreamStartPositionFromString on String {
  DynamoDBStreamStartPosition toDynamoDBStreamStartPosition() {
    switch (this) {
      case 'TRIM_HORIZON':
        return DynamoDBStreamStartPosition.trimHorizon;
      case 'LATEST':
        return DynamoDBStreamStartPosition.latest;
    }
    throw Exception('$this is not known in enum DynamoDBStreamStartPosition');
  }
}

/// The overrides that are sent to a container. An empty container override can
/// be passed in. An example of an empty container override is
/// <code>{"containerOverrides": [ ] }</code>. If a non-empty container override
/// is specified, the <code>name</code> parameter must be included.
class EcsContainerOverride {
  /// The command to send to the container that overrides the default command from
  /// the Docker image or the task definition. You must also specify a container
  /// name.
  final List<String>? command;

  /// The number of <code>cpu</code> units reserved for the container, instead of
  /// the default value from the task definition. You must also specify a
  /// container name.
  final int? cpu;

  /// The environment variables to send to the container. You can add new
  /// environment variables, which are added to the container at launch, or you
  /// can override the existing environment variables from the Docker image or the
  /// task definition. You must also specify a container name.
  final List<EcsEnvironmentVariable>? environment;

  /// A list of files containing the environment variables to pass to a container,
  /// instead of the value from the container definition.
  final List<EcsEnvironmentFile>? environmentFiles;

  /// The hard limit (in MiB) of memory to present to the container, instead of
  /// the default value from the task definition. If your container attempts to
  /// exceed the memory specified here, the container is killed. You must also
  /// specify a container name.
  final int? memory;

  /// The soft limit (in MiB) of memory to reserve for the container, instead of
  /// the default value from the task definition. You must also specify a
  /// container name.
  final int? memoryReservation;

  /// The name of the container that receives the override. This parameter is
  /// required if any override is specified.
  final String? name;

  /// The type and amount of a resource to assign to a container, instead of the
  /// default value from the task definition. The only supported resource is a
  /// GPU.
  final List<EcsResourceRequirement>? resourceRequirements;

  EcsContainerOverride({
    this.command,
    this.cpu,
    this.environment,
    this.environmentFiles,
    this.memory,
    this.memoryReservation,
    this.name,
    this.resourceRequirements,
  });

  factory EcsContainerOverride.fromJson(Map<String, dynamic> json) {
    return EcsContainerOverride(
      command: (json['Command'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      cpu: json['Cpu'] as int?,
      environment: (json['Environment'] as List?)
          ?.whereNotNull()
          .map(
              (e) => EcsEnvironmentVariable.fromJson(e as Map<String, dynamic>))
          .toList(),
      environmentFiles: (json['EnvironmentFiles'] as List?)
          ?.whereNotNull()
          .map((e) => EcsEnvironmentFile.fromJson(e as Map<String, dynamic>))
          .toList(),
      memory: json['Memory'] as int?,
      memoryReservation: json['MemoryReservation'] as int?,
      name: json['Name'] as String?,
      resourceRequirements: (json['ResourceRequirements'] as List?)
          ?.whereNotNull()
          .map(
              (e) => EcsResourceRequirement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final command = this.command;
    final cpu = this.cpu;
    final environment = this.environment;
    final environmentFiles = this.environmentFiles;
    final memory = this.memory;
    final memoryReservation = this.memoryReservation;
    final name = this.name;
    final resourceRequirements = this.resourceRequirements;
    return {
      if (command != null) 'Command': command,
      if (cpu != null) 'Cpu': cpu,
      if (environment != null) 'Environment': environment,
      if (environmentFiles != null) 'EnvironmentFiles': environmentFiles,
      if (memory != null) 'Memory': memory,
      if (memoryReservation != null) 'MemoryReservation': memoryReservation,
      if (name != null) 'Name': name,
      if (resourceRequirements != null)
        'ResourceRequirements': resourceRequirements,
    };
  }
}

/// A list of files containing the environment variables to pass to a container.
/// You can specify up to ten environment files. The file must have a
/// <code>.env</code> file extension. Each line in an environment file should
/// contain an environment variable in <code>VARIABLE=VALUE</code> format. Lines
/// beginning with <code>#</code> are treated as comments and are ignored. For
/// more information about the environment variable file syntax, see <a
/// href="https://docs.docker.com/compose/env-file/">Declare default environment
/// variables in file</a>.
///
/// If there are environment variables specified using the
/// <code>environment</code> parameter in a container definition, they take
/// precedence over the variables contained within an environment file. If
/// multiple environment files are specified that contain the same variable,
/// they're processed from the top down. We recommend that you use unique
/// variable names. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/taskdef-envfiles.html">Specifying
/// environment variables</a> in the <i>Amazon Elastic Container Service
/// Developer Guide</i>.
///
/// This parameter is only supported for tasks hosted on Fargate using the
/// following platform versions:
///
/// <ul>
/// <li>
/// Linux platform version <code>1.4.0</code> or later.
/// </li>
/// <li>
/// Windows platform version <code>1.0.0</code> or later.
/// </li>
/// </ul>
class EcsEnvironmentFile {
  /// The file type to use. The only supported value is <code>s3</code>.
  final EcsEnvironmentFileType type;

  /// The Amazon Resource Name (ARN) of the Amazon S3 object containing the
  /// environment variable file.
  final String value;

  EcsEnvironmentFile({
    required this.type,
    required this.value,
  });

  factory EcsEnvironmentFile.fromJson(Map<String, dynamic> json) {
    return EcsEnvironmentFile(
      type: (json['type'] as String).toEcsEnvironmentFileType(),
      value: json['value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final value = this.value;
    return {
      'type': type.toValue(),
      'value': value,
    };
  }
}

enum EcsEnvironmentFileType {
  s3,
}

extension EcsEnvironmentFileTypeValueExtension on EcsEnvironmentFileType {
  String toValue() {
    switch (this) {
      case EcsEnvironmentFileType.s3:
        return 's3';
    }
  }
}

extension EcsEnvironmentFileTypeFromString on String {
  EcsEnvironmentFileType toEcsEnvironmentFileType() {
    switch (this) {
      case 's3':
        return EcsEnvironmentFileType.s3;
    }
    throw Exception('$this is not known in enum EcsEnvironmentFileType');
  }
}

/// The environment variables to send to the container. You can add new
/// environment variables, which are added to the container at launch, or you
/// can override the existing environment variables from the Docker image or the
/// task definition. You must also specify a container name.
class EcsEnvironmentVariable {
  /// The name of the key-value pair. For environment variables, this is the name
  /// of the environment variable.
  final String? name;

  /// The value of the key-value pair. For environment variables, this is the
  /// value of the environment variable.
  final String? value;

  EcsEnvironmentVariable({
    this.name,
    this.value,
  });

  factory EcsEnvironmentVariable.fromJson(Map<String, dynamic> json) {
    return EcsEnvironmentVariable(
      name: json['name'] as String?,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      if (name != null) 'name': name,
      if (value != null) 'value': value,
    };
  }
}

/// The amount of ephemeral storage to allocate for the task. This parameter is
/// used to expand the total amount of ephemeral storage available, beyond the
/// default amount, for tasks hosted on Fargate. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/userguide/using_data_volumes.html">Fargate
/// task storage</a> in the <i>Amazon ECS User Guide for Fargate</i>.
/// <note>
/// This parameter is only supported for tasks hosted on Fargate using Linux
/// platform version <code>1.4.0</code> or later. This parameter is not
/// supported for Windows containers on Fargate.
/// </note>
class EcsEphemeralStorage {
  /// The total amount, in GiB, of ephemeral storage to set for the task. The
  /// minimum supported value is <code>21</code> GiB and the maximum supported
  /// value is <code>200</code> GiB.
  final int sizeInGiB;

  EcsEphemeralStorage({
    required this.sizeInGiB,
  });

  factory EcsEphemeralStorage.fromJson(Map<String, dynamic> json) {
    return EcsEphemeralStorage(
      sizeInGiB: json['sizeInGiB'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final sizeInGiB = this.sizeInGiB;
    return {
      'sizeInGiB': sizeInGiB,
    };
  }
}

/// Details on an Elastic Inference accelerator task override. This parameter is
/// used to override the Elastic Inference accelerator specified in the task
/// definition. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/userguide/ecs-inference.html">Working
/// with Amazon Elastic Inference on Amazon ECS</a> in the <i>Amazon Elastic
/// Container Service Developer Guide</i>.
class EcsInferenceAcceleratorOverride {
  /// The Elastic Inference accelerator device name to override for the task. This
  /// parameter must match a <code>deviceName</code> specified in the task
  /// definition.
  final String? deviceName;

  /// The Elastic Inference accelerator type to use.
  final String? deviceType;

  EcsInferenceAcceleratorOverride({
    this.deviceName,
    this.deviceType,
  });

  factory EcsInferenceAcceleratorOverride.fromJson(Map<String, dynamic> json) {
    return EcsInferenceAcceleratorOverride(
      deviceName: json['deviceName'] as String?,
      deviceType: json['deviceType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deviceName = this.deviceName;
    final deviceType = this.deviceType;
    return {
      if (deviceName != null) 'deviceName': deviceName,
      if (deviceType != null) 'deviceType': deviceType,
    };
  }
}

/// The type and amount of a resource to assign to a container. The supported
/// resource types are GPUs and Elastic Inference accelerators. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-gpu.html">Working
/// with GPUs on Amazon ECS</a> or <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-inference.html">Working
/// with Amazon Elastic Inference on Amazon ECS</a> in the <i>Amazon Elastic
/// Container Service Developer Guide</i>
class EcsResourceRequirement {
  /// The type of resource to assign to a container. The supported values are
  /// <code>GPU</code> or <code>InferenceAccelerator</code>.
  final EcsResourceRequirementType type;

  /// The value for the specified resource type.
  ///
  /// If the <code>GPU</code> type is used, the value is the number of physical
  /// <code>GPUs</code> the Amazon ECS container agent reserves for the container.
  /// The number of GPUs that's reserved for all containers in a task can't exceed
  /// the number of available GPUs on the container instance that the task is
  /// launched on.
  ///
  /// If the <code>InferenceAccelerator</code> type is used, the
  /// <code>value</code> matches the <code>deviceName</code> for an
  /// InferenceAccelerator specified in a task definition.
  final String value;

  EcsResourceRequirement({
    required this.type,
    required this.value,
  });

  factory EcsResourceRequirement.fromJson(Map<String, dynamic> json) {
    return EcsResourceRequirement(
      type: (json['type'] as String).toEcsResourceRequirementType(),
      value: json['value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final value = this.value;
    return {
      'type': type.toValue(),
      'value': value,
    };
  }
}

enum EcsResourceRequirementType {
  gpu,
  inferenceAccelerator,
}

extension EcsResourceRequirementTypeValueExtension
    on EcsResourceRequirementType {
  String toValue() {
    switch (this) {
      case EcsResourceRequirementType.gpu:
        return 'GPU';
      case EcsResourceRequirementType.inferenceAccelerator:
        return 'InferenceAccelerator';
    }
  }
}

extension EcsResourceRequirementTypeFromString on String {
  EcsResourceRequirementType toEcsResourceRequirementType() {
    switch (this) {
      case 'GPU':
        return EcsResourceRequirementType.gpu;
      case 'InferenceAccelerator':
        return EcsResourceRequirementType.inferenceAccelerator;
    }
    throw Exception('$this is not known in enum EcsResourceRequirementType');
  }
}

/// The overrides that are associated with a task.
class EcsTaskOverride {
  /// One or more container overrides that are sent to a task.
  final List<EcsContainerOverride>? containerOverrides;

  /// The cpu override for the task.
  final String? cpu;

  /// The ephemeral storage setting override for the task.
  /// <note>
  /// This parameter is only supported for tasks hosted on Fargate that use the
  /// following platform versions:
  ///
  /// <ul>
  /// <li>
  /// Linux platform version <code>1.4.0</code> or later.
  /// </li>
  /// <li>
  /// Windows platform version <code>1.0.0</code> or later.
  /// </li>
  /// </ul> </note>
  final EcsEphemeralStorage? ephemeralStorage;

  /// The Amazon Resource Name (ARN) of the task execution IAM role override for
  /// the task. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_execution_IAM_role.html">Amazon
  /// ECS task execution IAM role</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  final String? executionRoleArn;

  /// The Elastic Inference accelerator override for the task.
  final List<EcsInferenceAcceleratorOverride>? inferenceAcceleratorOverrides;

  /// The memory override for the task.
  final String? memory;

  /// The Amazon Resource Name (ARN) of the IAM role that containers in this task
  /// can assume. All containers in this task are granted the permissions that are
  /// specified in this role. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-iam-roles.html">IAM
  /// Role for Tasks</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  final String? taskRoleArn;

  EcsTaskOverride({
    this.containerOverrides,
    this.cpu,
    this.ephemeralStorage,
    this.executionRoleArn,
    this.inferenceAcceleratorOverrides,
    this.memory,
    this.taskRoleArn,
  });

  factory EcsTaskOverride.fromJson(Map<String, dynamic> json) {
    return EcsTaskOverride(
      containerOverrides: (json['ContainerOverrides'] as List?)
          ?.whereNotNull()
          .map((e) => EcsContainerOverride.fromJson(e as Map<String, dynamic>))
          .toList(),
      cpu: json['Cpu'] as String?,
      ephemeralStorage: json['EphemeralStorage'] != null
          ? EcsEphemeralStorage.fromJson(
              json['EphemeralStorage'] as Map<String, dynamic>)
          : null,
      executionRoleArn: json['ExecutionRoleArn'] as String?,
      inferenceAcceleratorOverrides:
          (json['InferenceAcceleratorOverrides'] as List?)
              ?.whereNotNull()
              .map((e) => EcsInferenceAcceleratorOverride.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      memory: json['Memory'] as String?,
      taskRoleArn: json['TaskRoleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final containerOverrides = this.containerOverrides;
    final cpu = this.cpu;
    final ephemeralStorage = this.ephemeralStorage;
    final executionRoleArn = this.executionRoleArn;
    final inferenceAcceleratorOverrides = this.inferenceAcceleratorOverrides;
    final memory = this.memory;
    final taskRoleArn = this.taskRoleArn;
    return {
      if (containerOverrides != null) 'ContainerOverrides': containerOverrides,
      if (cpu != null) 'Cpu': cpu,
      if (ephemeralStorage != null) 'EphemeralStorage': ephemeralStorage,
      if (executionRoleArn != null) 'ExecutionRoleArn': executionRoleArn,
      if (inferenceAcceleratorOverrides != null)
        'InferenceAcceleratorOverrides': inferenceAcceleratorOverrides,
      if (memory != null) 'Memory': memory,
      if (taskRoleArn != null) 'TaskRoleArn': taskRoleArn,
    };
  }
}

enum EpochTimeUnit {
  milliseconds,
  seconds,
  microseconds,
  nanoseconds,
}

extension EpochTimeUnitValueExtension on EpochTimeUnit {
  String toValue() {
    switch (this) {
      case EpochTimeUnit.milliseconds:
        return 'MILLISECONDS';
      case EpochTimeUnit.seconds:
        return 'SECONDS';
      case EpochTimeUnit.microseconds:
        return 'MICROSECONDS';
      case EpochTimeUnit.nanoseconds:
        return 'NANOSECONDS';
    }
  }
}

extension EpochTimeUnitFromString on String {
  EpochTimeUnit toEpochTimeUnit() {
    switch (this) {
      case 'MILLISECONDS':
        return EpochTimeUnit.milliseconds;
      case 'SECONDS':
        return EpochTimeUnit.seconds;
      case 'MICROSECONDS':
        return EpochTimeUnit.microseconds;
      case 'NANOSECONDS':
        return EpochTimeUnit.nanoseconds;
    }
    throw Exception('$this is not known in enum EpochTimeUnit');
  }
}

/// Filter events using an event pattern. For more information, see <a
/// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-and-event-patterns.html">Events
/// and Event Patterns</a> in the <i>Amazon EventBridge User Guide</i>.
class Filter {
  /// The event pattern.
  final String? pattern;

  Filter({
    this.pattern,
  });

  factory Filter.fromJson(Map<String, dynamic> json) {
    return Filter(
      pattern: json['Pattern'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final pattern = this.pattern;
    return {
      if (pattern != null) 'Pattern': pattern,
    };
  }
}

/// The collection of event patterns used to filter events.
///
/// To remove a filter, specify a <code>FilterCriteria</code> object with an
/// empty array of <code>Filter</code> objects.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-and-event-patterns.html">Events
/// and Event Patterns</a> in the <i>Amazon EventBridge User Guide</i>.
class FilterCriteria {
  /// The event patterns.
  final List<Filter>? filters;

  FilterCriteria({
    this.filters,
  });

  factory FilterCriteria.fromJson(Map<String, dynamic> json) {
    return FilterCriteria(
      filters: (json['Filters'] as List?)
          ?.whereNotNull()
          .map((e) => Filter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final filters = this.filters;
    return {
      if (filters != null) 'Filters': filters,
    };
  }
}

/// The Amazon Data Firehose logging configuration settings for the pipe.
class FirehoseLogDestination {
  /// The Amazon Resource Name (ARN) of the Firehose delivery stream to which
  /// EventBridge delivers the pipe log records.
  final String? deliveryStreamArn;

  FirehoseLogDestination({
    this.deliveryStreamArn,
  });

  factory FirehoseLogDestination.fromJson(Map<String, dynamic> json) {
    return FirehoseLogDestination(
      deliveryStreamArn: json['DeliveryStreamArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deliveryStreamArn = this.deliveryStreamArn;
    return {
      if (deliveryStreamArn != null) 'DeliveryStreamArn': deliveryStreamArn,
    };
  }
}

/// The Amazon Data Firehose logging configuration settings for the pipe.
class FirehoseLogDestinationParameters {
  /// Specifies the Amazon Resource Name (ARN) of the Firehose delivery stream to
  /// which EventBridge delivers the pipe log records.
  final String deliveryStreamArn;

  FirehoseLogDestinationParameters({
    required this.deliveryStreamArn,
  });

  Map<String, dynamic> toJson() {
    final deliveryStreamArn = this.deliveryStreamArn;
    return {
      'DeliveryStreamArn': deliveryStreamArn,
    };
  }
}

enum IncludeExecutionDataOption {
  all,
}

extension IncludeExecutionDataOptionValueExtension
    on IncludeExecutionDataOption {
  String toValue() {
    switch (this) {
      case IncludeExecutionDataOption.all:
        return 'ALL';
    }
  }
}

extension IncludeExecutionDataOptionFromString on String {
  IncludeExecutionDataOption toIncludeExecutionDataOption() {
    switch (this) {
      case 'ALL':
        return IncludeExecutionDataOption.all;
    }
    throw Exception('$this is not known in enum IncludeExecutionDataOption');
  }
}

enum KinesisStreamStartPosition {
  trimHorizon,
  latest,
  atTimestamp,
}

extension KinesisStreamStartPositionValueExtension
    on KinesisStreamStartPosition {
  String toValue() {
    switch (this) {
      case KinesisStreamStartPosition.trimHorizon:
        return 'TRIM_HORIZON';
      case KinesisStreamStartPosition.latest:
        return 'LATEST';
      case KinesisStreamStartPosition.atTimestamp:
        return 'AT_TIMESTAMP';
    }
  }
}

extension KinesisStreamStartPositionFromString on String {
  KinesisStreamStartPosition toKinesisStreamStartPosition() {
    switch (this) {
      case 'TRIM_HORIZON':
        return KinesisStreamStartPosition.trimHorizon;
      case 'LATEST':
        return KinesisStreamStartPosition.latest;
      case 'AT_TIMESTAMP':
        return KinesisStreamStartPosition.atTimestamp;
    }
    throw Exception('$this is not known in enum KinesisStreamStartPosition');
  }
}

enum LaunchType {
  ec2,
  fargate,
  external,
}

extension LaunchTypeValueExtension on LaunchType {
  String toValue() {
    switch (this) {
      case LaunchType.ec2:
        return 'EC2';
      case LaunchType.fargate:
        return 'FARGATE';
      case LaunchType.external:
        return 'EXTERNAL';
    }
  }
}

extension LaunchTypeFromString on String {
  LaunchType toLaunchType() {
    switch (this) {
      case 'EC2':
        return LaunchType.ec2;
      case 'FARGATE':
        return LaunchType.fargate;
      case 'EXTERNAL':
        return LaunchType.external;
    }
    throw Exception('$this is not known in enum LaunchType');
  }
}

class ListPipesResponse {
  /// If <code>nextToken</code> is returned, there are more results available. The
  /// value of <code>nextToken</code> is a unique pagination token for each page.
  /// Make the call again using the returned token to retrieve the next page. Keep
  /// all other arguments unchanged. Each pagination token expires after 24 hours.
  /// Using an expired pagination token will return an HTTP 400 InvalidToken
  /// error.
  final String? nextToken;

  /// The pipes returned by the call.
  final List<Pipe>? pipes;

  ListPipesResponse({
    this.nextToken,
    this.pipes,
  });

  factory ListPipesResponse.fromJson(Map<String, dynamic> json) {
    return ListPipesResponse(
      nextToken: json['NextToken'] as String?,
      pipes: (json['Pipes'] as List?)
          ?.whereNotNull()
          .map((e) => Pipe.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final pipes = this.pipes;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (pipes != null) 'Pipes': pipes,
    };
  }
}

class ListTagsForResourceResponse {
  /// The list of key-value pairs to associate with the pipe.
  final Map<String, String>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'tags': tags,
    };
  }
}

enum LogLevel {
  off,
  error,
  info,
  trace,
}

extension LogLevelValueExtension on LogLevel {
  String toValue() {
    switch (this) {
      case LogLevel.off:
        return 'OFF';
      case LogLevel.error:
        return 'ERROR';
      case LogLevel.info:
        return 'INFO';
      case LogLevel.trace:
        return 'TRACE';
    }
  }
}

extension LogLevelFromString on String {
  LogLevel toLogLevel() {
    switch (this) {
      case 'OFF':
        return LogLevel.off;
      case 'ERROR':
        return LogLevel.error;
      case 'INFO':
        return LogLevel.info;
      case 'TRACE':
        return LogLevel.trace;
    }
    throw Exception('$this is not known in enum LogLevel');
  }
}

/// The Secrets Manager secret that stores your broker credentials.
class MQBrokerAccessCredentials {
  /// The ARN of the Secrets Manager secret.
  final String? basicAuth;

  MQBrokerAccessCredentials({
    this.basicAuth,
  });

  factory MQBrokerAccessCredentials.fromJson(Map<String, dynamic> json) {
    return MQBrokerAccessCredentials(
      basicAuth: json['BasicAuth'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final basicAuth = this.basicAuth;
    return {
      if (basicAuth != null) 'BasicAuth': basicAuth,
    };
  }
}

/// The Secrets Manager secret that stores your stream credentials.
class MSKAccessCredentials {
  /// The ARN of the Secrets Manager secret.
  final String? clientCertificateTlsAuth;

  /// The ARN of the Secrets Manager secret.
  final String? saslScram512Auth;

  MSKAccessCredentials({
    this.clientCertificateTlsAuth,
    this.saslScram512Auth,
  });

  factory MSKAccessCredentials.fromJson(Map<String, dynamic> json) {
    return MSKAccessCredentials(
      clientCertificateTlsAuth: json['ClientCertificateTlsAuth'] as String?,
      saslScram512Auth: json['SaslScram512Auth'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientCertificateTlsAuth = this.clientCertificateTlsAuth;
    final saslScram512Auth = this.saslScram512Auth;
    return {
      if (clientCertificateTlsAuth != null)
        'ClientCertificateTlsAuth': clientCertificateTlsAuth,
      if (saslScram512Auth != null) 'SaslScram512Auth': saslScram512Auth,
    };
  }
}

enum MSKStartPosition {
  trimHorizon,
  latest,
}

extension MSKStartPositionValueExtension on MSKStartPosition {
  String toValue() {
    switch (this) {
      case MSKStartPosition.trimHorizon:
        return 'TRIM_HORIZON';
      case MSKStartPosition.latest:
        return 'LATEST';
    }
  }
}

extension MSKStartPositionFromString on String {
  MSKStartPosition toMSKStartPosition() {
    switch (this) {
      case 'TRIM_HORIZON':
        return MSKStartPosition.trimHorizon;
      case 'LATEST':
        return MSKStartPosition.latest;
    }
    throw Exception('$this is not known in enum MSKStartPosition');
  }
}

enum MeasureValueType {
  double,
  bigint,
  varchar,
  boolean,
  timestamp,
}

extension MeasureValueTypeValueExtension on MeasureValueType {
  String toValue() {
    switch (this) {
      case MeasureValueType.double:
        return 'DOUBLE';
      case MeasureValueType.bigint:
        return 'BIGINT';
      case MeasureValueType.varchar:
        return 'VARCHAR';
      case MeasureValueType.boolean:
        return 'BOOLEAN';
      case MeasureValueType.timestamp:
        return 'TIMESTAMP';
    }
  }
}

extension MeasureValueTypeFromString on String {
  MeasureValueType toMeasureValueType() {
    switch (this) {
      case 'DOUBLE':
        return MeasureValueType.double;
      case 'BIGINT':
        return MeasureValueType.bigint;
      case 'VARCHAR':
        return MeasureValueType.varchar;
      case 'BOOLEAN':
        return MeasureValueType.boolean;
      case 'TIMESTAMP':
        return MeasureValueType.timestamp;
    }
    throw Exception('$this is not known in enum MeasureValueType');
  }
}

/// A mapping of a source event data field to a measure in a Timestream for
/// LiveAnalytics record.
class MultiMeasureAttributeMapping {
  /// Dynamic path to the measurement attribute in the source event.
  final String measureValue;

  /// Data type of the measurement attribute in the source event.
  final MeasureValueType measureValueType;

  /// Target measure name to be used.
  final String multiMeasureAttributeName;

  MultiMeasureAttributeMapping({
    required this.measureValue,
    required this.measureValueType,
    required this.multiMeasureAttributeName,
  });

  factory MultiMeasureAttributeMapping.fromJson(Map<String, dynamic> json) {
    return MultiMeasureAttributeMapping(
      measureValue: json['MeasureValue'] as String,
      measureValueType:
          (json['MeasureValueType'] as String).toMeasureValueType(),
      multiMeasureAttributeName: json['MultiMeasureAttributeName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final measureValue = this.measureValue;
    final measureValueType = this.measureValueType;
    final multiMeasureAttributeName = this.multiMeasureAttributeName;
    return {
      'MeasureValue': measureValue,
      'MeasureValueType': measureValueType.toValue(),
      'MultiMeasureAttributeName': multiMeasureAttributeName,
    };
  }
}

/// Maps multiple measures from the source event to the same Timestream for
/// LiveAnalytics record.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/timestream/latest/developerguide/concepts.html">Amazon
/// Timestream for LiveAnalytics concepts</a>
class MultiMeasureMapping {
  /// Mappings that represent multiple source event fields mapped to measures in
  /// the same Timestream for LiveAnalytics record.
  final List<MultiMeasureAttributeMapping> multiMeasureAttributeMappings;

  /// The name of the multiple measurements per record (multi-measure).
  final String multiMeasureName;

  MultiMeasureMapping({
    required this.multiMeasureAttributeMappings,
    required this.multiMeasureName,
  });

  factory MultiMeasureMapping.fromJson(Map<String, dynamic> json) {
    return MultiMeasureMapping(
      multiMeasureAttributeMappings: (json['MultiMeasureAttributeMappings']
              as List)
          .whereNotNull()
          .map((e) =>
              MultiMeasureAttributeMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
      multiMeasureName: json['MultiMeasureName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final multiMeasureAttributeMappings = this.multiMeasureAttributeMappings;
    final multiMeasureName = this.multiMeasureName;
    return {
      'MultiMeasureAttributeMappings': multiMeasureAttributeMappings,
      'MultiMeasureName': multiMeasureName,
    };
  }
}

/// This structure specifies the network configuration for an Amazon ECS task.
class NetworkConfiguration {
  /// Use this structure to specify the VPC subnets and security groups for the
  /// task, and whether a public IP address is to be used. This structure is
  /// relevant only for ECS tasks that use the <code>awsvpc</code> network mode.
  final AwsVpcConfiguration? awsvpcConfiguration;

  NetworkConfiguration({
    this.awsvpcConfiguration,
  });

  factory NetworkConfiguration.fromJson(Map<String, dynamic> json) {
    return NetworkConfiguration(
      awsvpcConfiguration: json['awsvpcConfiguration'] != null
          ? AwsVpcConfiguration.fromJson(
              json['awsvpcConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final awsvpcConfiguration = this.awsvpcConfiguration;
    return {
      if (awsvpcConfiguration != null)
        'awsvpcConfiguration': awsvpcConfiguration,
    };
  }
}

enum OnPartialBatchItemFailureStreams {
  automaticBisect,
}

extension OnPartialBatchItemFailureStreamsValueExtension
    on OnPartialBatchItemFailureStreams {
  String toValue() {
    switch (this) {
      case OnPartialBatchItemFailureStreams.automaticBisect:
        return 'AUTOMATIC_BISECT';
    }
  }
}

extension OnPartialBatchItemFailureStreamsFromString on String {
  OnPartialBatchItemFailureStreams toOnPartialBatchItemFailureStreams() {
    switch (this) {
      case 'AUTOMATIC_BISECT':
        return OnPartialBatchItemFailureStreams.automaticBisect;
    }
    throw Exception(
        '$this is not known in enum OnPartialBatchItemFailureStreams');
  }
}

/// An object that represents a pipe. Amazon EventBridgePipes connect event
/// sources to targets and reduces the need for specialized knowledge and
/// integration code.
class Pipe {
  /// The ARN of the pipe.
  final String? arn;

  /// The time the pipe was created.
  final DateTime? creationTime;

  /// The state the pipe is in.
  final PipeState? currentState;

  /// The state the pipe should be in.
  final RequestedPipeState? desiredState;

  /// The ARN of the enrichment resource.
  final String? enrichment;

  /// When the pipe was last updated, in <a
  /// href="https://www.w3.org/TR/NOTE-datetime">ISO-8601 format</a>
  /// (YYYY-MM-DDThh:mm:ss.sTZD).
  final DateTime? lastModifiedTime;

  /// The name of the pipe.
  final String? name;

  /// The ARN of the source resource.
  final String? source;

  /// The reason the pipe is in its current state.
  final String? stateReason;

  /// The ARN of the target resource.
  final String? target;

  Pipe({
    this.arn,
    this.creationTime,
    this.currentState,
    this.desiredState,
    this.enrichment,
    this.lastModifiedTime,
    this.name,
    this.source,
    this.stateReason,
    this.target,
  });

  factory Pipe.fromJson(Map<String, dynamic> json) {
    return Pipe(
      arn: json['Arn'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      currentState: (json['CurrentState'] as String?)?.toPipeState(),
      desiredState: (json['DesiredState'] as String?)?.toRequestedPipeState(),
      enrichment: json['Enrichment'] as String?,
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      name: json['Name'] as String?,
      source: json['Source'] as String?,
      stateReason: json['StateReason'] as String?,
      target: json['Target'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final currentState = this.currentState;
    final desiredState = this.desiredState;
    final enrichment = this.enrichment;
    final lastModifiedTime = this.lastModifiedTime;
    final name = this.name;
    final source = this.source;
    final stateReason = this.stateReason;
    final target = this.target;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (currentState != null) 'CurrentState': currentState.toValue(),
      if (desiredState != null) 'DesiredState': desiredState.toValue(),
      if (enrichment != null) 'Enrichment': enrichment,
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (name != null) 'Name': name,
      if (source != null) 'Source': source,
      if (stateReason != null) 'StateReason': stateReason,
      if (target != null) 'Target': target,
    };
  }
}

/// These are custom parameter to be used when the target is an API Gateway REST
/// APIs or EventBridge ApiDestinations. In the latter case, these are merged
/// with any InvocationParameters specified on the Connection, with any values
/// from the Connection taking precedence.
class PipeEnrichmentHttpParameters {
  /// The headers that need to be sent as part of request invoking the API Gateway
  /// REST API or EventBridge ApiDestination.
  final Map<String, String>? headerParameters;

  /// The path parameter values to be used to populate API Gateway REST API or
  /// EventBridge ApiDestination path wildcards ("*").
  final List<String>? pathParameterValues;

  /// The query string keys/values that need to be sent as part of request
  /// invoking the API Gateway REST API or EventBridge ApiDestination.
  final Map<String, String>? queryStringParameters;

  PipeEnrichmentHttpParameters({
    this.headerParameters,
    this.pathParameterValues,
    this.queryStringParameters,
  });

  factory PipeEnrichmentHttpParameters.fromJson(Map<String, dynamic> json) {
    return PipeEnrichmentHttpParameters(
      headerParameters: (json['HeaderParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      pathParameterValues: (json['PathParameterValues'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      queryStringParameters:
          (json['QueryStringParameters'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final headerParameters = this.headerParameters;
    final pathParameterValues = this.pathParameterValues;
    final queryStringParameters = this.queryStringParameters;
    return {
      if (headerParameters != null) 'HeaderParameters': headerParameters,
      if (pathParameterValues != null)
        'PathParameterValues': pathParameterValues,
      if (queryStringParameters != null)
        'QueryStringParameters': queryStringParameters,
    };
  }
}

/// The parameters required to set up enrichment on your pipe.
class PipeEnrichmentParameters {
  /// Contains the HTTP parameters to use when the target is a API Gateway REST
  /// endpoint or EventBridge ApiDestination.
  ///
  /// If you specify an API Gateway REST API or EventBridge ApiDestination as a
  /// target, you can use this parameter to specify headers, path parameters, and
  /// query string keys/values as part of your target invoking request. If you're
  /// using ApiDestinations, the corresponding Connection can also have these
  /// values configured. In case of any conflicting keys, values from the
  /// Connection take precedence.
  final PipeEnrichmentHttpParameters? httpParameters;

  /// Valid JSON text passed to the enrichment. In this case, nothing from the
  /// event itself is passed to the enrichment. For more information, see <a
  /// href="http://www.rfc-editor.org/rfc/rfc7159.txt">The JavaScript Object
  /// Notation (JSON) Data Interchange Format</a>.
  ///
  /// To remove an input template, specify an empty string.
  final String? inputTemplate;

  PipeEnrichmentParameters({
    this.httpParameters,
    this.inputTemplate,
  });

  factory PipeEnrichmentParameters.fromJson(Map<String, dynamic> json) {
    return PipeEnrichmentParameters(
      httpParameters: json['HttpParameters'] != null
          ? PipeEnrichmentHttpParameters.fromJson(
              json['HttpParameters'] as Map<String, dynamic>)
          : null,
      inputTemplate: json['InputTemplate'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final httpParameters = this.httpParameters;
    final inputTemplate = this.inputTemplate;
    return {
      if (httpParameters != null) 'HttpParameters': httpParameters,
      if (inputTemplate != null) 'InputTemplate': inputTemplate,
    };
  }
}

/// The logging configuration settings for the pipe.
class PipeLogConfiguration {
  /// The Amazon CloudWatch Logs logging configuration settings for the pipe.
  final CloudwatchLogsLogDestination? cloudwatchLogsLogDestination;

  /// The Amazon Data Firehose logging configuration settings for the pipe.
  final FirehoseLogDestination? firehoseLogDestination;

  /// Whether the execution data (specifically, the <code>payload</code>,
  /// <code>awsRequest</code>, and <code>awsResponse</code> fields) is included in
  /// the log messages for this pipe.
  ///
  /// This applies to all log destinations for the pipe.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-pipes-logs.html#eb-pipes-logs-execution-data">Including
  /// execution data in logs</a> in the <i>Amazon EventBridge User Guide</i>.
  final List<IncludeExecutionDataOption>? includeExecutionData;

  /// The level of logging detail to include. This applies to all log destinations
  /// for the pipe.
  final LogLevel? level;

  /// The Amazon S3 logging configuration settings for the pipe.
  final S3LogDestination? s3LogDestination;

  PipeLogConfiguration({
    this.cloudwatchLogsLogDestination,
    this.firehoseLogDestination,
    this.includeExecutionData,
    this.level,
    this.s3LogDestination,
  });

  factory PipeLogConfiguration.fromJson(Map<String, dynamic> json) {
    return PipeLogConfiguration(
      cloudwatchLogsLogDestination: json['CloudwatchLogsLogDestination'] != null
          ? CloudwatchLogsLogDestination.fromJson(
              json['CloudwatchLogsLogDestination'] as Map<String, dynamic>)
          : null,
      firehoseLogDestination: json['FirehoseLogDestination'] != null
          ? FirehoseLogDestination.fromJson(
              json['FirehoseLogDestination'] as Map<String, dynamic>)
          : null,
      includeExecutionData: (json['IncludeExecutionData'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toIncludeExecutionDataOption())
          .toList(),
      level: (json['Level'] as String?)?.toLogLevel(),
      s3LogDestination: json['S3LogDestination'] != null
          ? S3LogDestination.fromJson(
              json['S3LogDestination'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudwatchLogsLogDestination = this.cloudwatchLogsLogDestination;
    final firehoseLogDestination = this.firehoseLogDestination;
    final includeExecutionData = this.includeExecutionData;
    final level = this.level;
    final s3LogDestination = this.s3LogDestination;
    return {
      if (cloudwatchLogsLogDestination != null)
        'CloudwatchLogsLogDestination': cloudwatchLogsLogDestination,
      if (firehoseLogDestination != null)
        'FirehoseLogDestination': firehoseLogDestination,
      if (includeExecutionData != null)
        'IncludeExecutionData':
            includeExecutionData.map((e) => e.toValue()).toList(),
      if (level != null) 'Level': level.toValue(),
      if (s3LogDestination != null) 'S3LogDestination': s3LogDestination,
    };
  }
}

/// Specifies the logging configuration settings for the pipe.
///
/// When you call <code>UpdatePipe</code>, EventBridge updates the fields in the
/// <code>PipeLogConfigurationParameters</code> object atomically as one and
/// overrides existing values. This is by design. If you don't specify an
/// optional field in any of the Amazon Web Services service parameters objects
/// (<code>CloudwatchLogsLogDestinationParameters</code>,
/// <code>FirehoseLogDestinationParameters</code>, or
/// <code>S3LogDestinationParameters</code>), EventBridge sets that field to its
/// system-default value during the update.
///
/// For example, suppose when you created the pipe you specified a Firehose
/// stream log destination. You then update the pipe to add an Amazon S3 log
/// destination. In addition to specifying the
/// <code>S3LogDestinationParameters</code> for the new log destination, you
/// must also specify the fields in the
/// <code>FirehoseLogDestinationParameters</code> object in order to retain the
/// Firehose stream log destination.
///
/// For more information on generating pipe log records, see <a
/// href="eventbridge/latest/userguide/eb-pipes-logs.html">Log EventBridge
/// Pipes</a> in the <i>Amazon EventBridge User Guide</i>.
class PipeLogConfigurationParameters {
  /// The level of logging detail to include. This applies to all log destinations
  /// for the pipe.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-pipes-logs.html#eb-pipes-logs-level">Specifying
  /// EventBridge Pipes log level</a> in the <i>Amazon EventBridge User Guide</i>.
  final LogLevel level;

  /// The Amazon CloudWatch Logs logging configuration settings for the pipe.
  final CloudwatchLogsLogDestinationParameters? cloudwatchLogsLogDestination;

  /// The Amazon Data Firehose logging configuration settings for the pipe.
  final FirehoseLogDestinationParameters? firehoseLogDestination;

  /// Specify <code>ALL</code> to include the execution data (specifically, the
  /// <code>payload</code>, <code>awsRequest</code>, and <code>awsResponse</code>
  /// fields) in the log messages for this pipe.
  ///
  /// This applies to all log destinations for the pipe.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-pipes-logs.html#eb-pipes-logs-execution-data">Including
  /// execution data in logs</a> in the <i>Amazon EventBridge User Guide</i>.
  ///
  /// By default, execution data is not included.
  final List<IncludeExecutionDataOption>? includeExecutionData;

  /// The Amazon S3 logging configuration settings for the pipe.
  final S3LogDestinationParameters? s3LogDestination;

  PipeLogConfigurationParameters({
    required this.level,
    this.cloudwatchLogsLogDestination,
    this.firehoseLogDestination,
    this.includeExecutionData,
    this.s3LogDestination,
  });

  Map<String, dynamic> toJson() {
    final level = this.level;
    final cloudwatchLogsLogDestination = this.cloudwatchLogsLogDestination;
    final firehoseLogDestination = this.firehoseLogDestination;
    final includeExecutionData = this.includeExecutionData;
    final s3LogDestination = this.s3LogDestination;
    return {
      'Level': level.toValue(),
      if (cloudwatchLogsLogDestination != null)
        'CloudwatchLogsLogDestination': cloudwatchLogsLogDestination,
      if (firehoseLogDestination != null)
        'FirehoseLogDestination': firehoseLogDestination,
      if (includeExecutionData != null)
        'IncludeExecutionData':
            includeExecutionData.map((e) => e.toValue()).toList(),
      if (s3LogDestination != null) 'S3LogDestination': s3LogDestination,
    };
  }
}

/// The parameters for using an Active MQ broker as a source.
class PipeSourceActiveMQBrokerParameters {
  /// The credentials needed to access the resource.
  final MQBrokerAccessCredentials credentials;

  /// The name of the destination queue to consume.
  final String queueName;

  /// The maximum number of records to include in each batch.
  final int? batchSize;

  /// The maximum length of a time to wait for events.
  final int? maximumBatchingWindowInSeconds;

  PipeSourceActiveMQBrokerParameters({
    required this.credentials,
    required this.queueName,
    this.batchSize,
    this.maximumBatchingWindowInSeconds,
  });

  factory PipeSourceActiveMQBrokerParameters.fromJson(
      Map<String, dynamic> json) {
    return PipeSourceActiveMQBrokerParameters(
      credentials: MQBrokerAccessCredentials.fromJson(
          json['Credentials'] as Map<String, dynamic>),
      queueName: json['QueueName'] as String,
      batchSize: json['BatchSize'] as int?,
      maximumBatchingWindowInSeconds:
          json['MaximumBatchingWindowInSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final credentials = this.credentials;
    final queueName = this.queueName;
    final batchSize = this.batchSize;
    final maximumBatchingWindowInSeconds = this.maximumBatchingWindowInSeconds;
    return {
      'Credentials': credentials,
      'QueueName': queueName,
      if (batchSize != null) 'BatchSize': batchSize,
      if (maximumBatchingWindowInSeconds != null)
        'MaximumBatchingWindowInSeconds': maximumBatchingWindowInSeconds,
    };
  }
}

/// The parameters for using a DynamoDB stream as a source.
class PipeSourceDynamoDBStreamParameters {
  /// (Streams only) The position in a stream from which to start reading.
  final DynamoDBStreamStartPosition startingPosition;

  /// The maximum number of records to include in each batch.
  final int? batchSize;

  /// Define the target queue to send dead-letter queue events to.
  final DeadLetterConfig? deadLetterConfig;

  /// The maximum length of a time to wait for events.
  final int? maximumBatchingWindowInSeconds;

  /// (Streams only) Discard records older than the specified age. The default
  /// value is -1, which sets the maximum age to infinite. When the value is set
  /// to infinite, EventBridge never discards old records.
  final int? maximumRecordAgeInSeconds;

  /// (Streams only) Discard records after the specified number of retries. The
  /// default value is -1, which sets the maximum number of retries to infinite.
  /// When MaximumRetryAttempts is infinite, EventBridge retries failed records
  /// until the record expires in the event source.
  final int? maximumRetryAttempts;

  /// (Streams only) Define how to handle item process failures.
  /// <code>AUTOMATIC_BISECT</code> halves each batch and retry each half until
  /// all the records are processed or there is one failed message left in the
  /// batch.
  final OnPartialBatchItemFailureStreams? onPartialBatchItemFailure;

  /// (Streams only) The number of batches to process concurrently from each
  /// shard. The default value is 1.
  final int? parallelizationFactor;

  PipeSourceDynamoDBStreamParameters({
    required this.startingPosition,
    this.batchSize,
    this.deadLetterConfig,
    this.maximumBatchingWindowInSeconds,
    this.maximumRecordAgeInSeconds,
    this.maximumRetryAttempts,
    this.onPartialBatchItemFailure,
    this.parallelizationFactor,
  });

  factory PipeSourceDynamoDBStreamParameters.fromJson(
      Map<String, dynamic> json) {
    return PipeSourceDynamoDBStreamParameters(
      startingPosition:
          (json['StartingPosition'] as String).toDynamoDBStreamStartPosition(),
      batchSize: json['BatchSize'] as int?,
      deadLetterConfig: json['DeadLetterConfig'] != null
          ? DeadLetterConfig.fromJson(
              json['DeadLetterConfig'] as Map<String, dynamic>)
          : null,
      maximumBatchingWindowInSeconds:
          json['MaximumBatchingWindowInSeconds'] as int?,
      maximumRecordAgeInSeconds: json['MaximumRecordAgeInSeconds'] as int?,
      maximumRetryAttempts: json['MaximumRetryAttempts'] as int?,
      onPartialBatchItemFailure: (json['OnPartialBatchItemFailure'] as String?)
          ?.toOnPartialBatchItemFailureStreams(),
      parallelizationFactor: json['ParallelizationFactor'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final startingPosition = this.startingPosition;
    final batchSize = this.batchSize;
    final deadLetterConfig = this.deadLetterConfig;
    final maximumBatchingWindowInSeconds = this.maximumBatchingWindowInSeconds;
    final maximumRecordAgeInSeconds = this.maximumRecordAgeInSeconds;
    final maximumRetryAttempts = this.maximumRetryAttempts;
    final onPartialBatchItemFailure = this.onPartialBatchItemFailure;
    final parallelizationFactor = this.parallelizationFactor;
    return {
      'StartingPosition': startingPosition.toValue(),
      if (batchSize != null) 'BatchSize': batchSize,
      if (deadLetterConfig != null) 'DeadLetterConfig': deadLetterConfig,
      if (maximumBatchingWindowInSeconds != null)
        'MaximumBatchingWindowInSeconds': maximumBatchingWindowInSeconds,
      if (maximumRecordAgeInSeconds != null)
        'MaximumRecordAgeInSeconds': maximumRecordAgeInSeconds,
      if (maximumRetryAttempts != null)
        'MaximumRetryAttempts': maximumRetryAttempts,
      if (onPartialBatchItemFailure != null)
        'OnPartialBatchItemFailure': onPartialBatchItemFailure.toValue(),
      if (parallelizationFactor != null)
        'ParallelizationFactor': parallelizationFactor,
    };
  }
}

/// The parameters for using a Kinesis stream as a source.
class PipeSourceKinesisStreamParameters {
  /// (Streams only) The position in a stream from which to start reading.
  final KinesisStreamStartPosition startingPosition;

  /// The maximum number of records to include in each batch.
  final int? batchSize;

  /// Define the target queue to send dead-letter queue events to.
  final DeadLetterConfig? deadLetterConfig;

  /// The maximum length of a time to wait for events.
  final int? maximumBatchingWindowInSeconds;

  /// (Streams only) Discard records older than the specified age. The default
  /// value is -1, which sets the maximum age to infinite. When the value is set
  /// to infinite, EventBridge never discards old records.
  final int? maximumRecordAgeInSeconds;

  /// (Streams only) Discard records after the specified number of retries. The
  /// default value is -1, which sets the maximum number of retries to infinite.
  /// When MaximumRetryAttempts is infinite, EventBridge retries failed records
  /// until the record expires in the event source.
  final int? maximumRetryAttempts;

  /// (Streams only) Define how to handle item process failures.
  /// <code>AUTOMATIC_BISECT</code> halves each batch and retry each half until
  /// all the records are processed or there is one failed message left in the
  /// batch.
  final OnPartialBatchItemFailureStreams? onPartialBatchItemFailure;

  /// (Streams only) The number of batches to process concurrently from each
  /// shard. The default value is 1.
  final int? parallelizationFactor;

  /// With <code>StartingPosition</code> set to <code>AT_TIMESTAMP</code>, the
  /// time from which to start reading, in Unix time seconds.
  final DateTime? startingPositionTimestamp;

  PipeSourceKinesisStreamParameters({
    required this.startingPosition,
    this.batchSize,
    this.deadLetterConfig,
    this.maximumBatchingWindowInSeconds,
    this.maximumRecordAgeInSeconds,
    this.maximumRetryAttempts,
    this.onPartialBatchItemFailure,
    this.parallelizationFactor,
    this.startingPositionTimestamp,
  });

  factory PipeSourceKinesisStreamParameters.fromJson(
      Map<String, dynamic> json) {
    return PipeSourceKinesisStreamParameters(
      startingPosition:
          (json['StartingPosition'] as String).toKinesisStreamStartPosition(),
      batchSize: json['BatchSize'] as int?,
      deadLetterConfig: json['DeadLetterConfig'] != null
          ? DeadLetterConfig.fromJson(
              json['DeadLetterConfig'] as Map<String, dynamic>)
          : null,
      maximumBatchingWindowInSeconds:
          json['MaximumBatchingWindowInSeconds'] as int?,
      maximumRecordAgeInSeconds: json['MaximumRecordAgeInSeconds'] as int?,
      maximumRetryAttempts: json['MaximumRetryAttempts'] as int?,
      onPartialBatchItemFailure: (json['OnPartialBatchItemFailure'] as String?)
          ?.toOnPartialBatchItemFailureStreams(),
      parallelizationFactor: json['ParallelizationFactor'] as int?,
      startingPositionTimestamp:
          timeStampFromJson(json['StartingPositionTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final startingPosition = this.startingPosition;
    final batchSize = this.batchSize;
    final deadLetterConfig = this.deadLetterConfig;
    final maximumBatchingWindowInSeconds = this.maximumBatchingWindowInSeconds;
    final maximumRecordAgeInSeconds = this.maximumRecordAgeInSeconds;
    final maximumRetryAttempts = this.maximumRetryAttempts;
    final onPartialBatchItemFailure = this.onPartialBatchItemFailure;
    final parallelizationFactor = this.parallelizationFactor;
    final startingPositionTimestamp = this.startingPositionTimestamp;
    return {
      'StartingPosition': startingPosition.toValue(),
      if (batchSize != null) 'BatchSize': batchSize,
      if (deadLetterConfig != null) 'DeadLetterConfig': deadLetterConfig,
      if (maximumBatchingWindowInSeconds != null)
        'MaximumBatchingWindowInSeconds': maximumBatchingWindowInSeconds,
      if (maximumRecordAgeInSeconds != null)
        'MaximumRecordAgeInSeconds': maximumRecordAgeInSeconds,
      if (maximumRetryAttempts != null)
        'MaximumRetryAttempts': maximumRetryAttempts,
      if (onPartialBatchItemFailure != null)
        'OnPartialBatchItemFailure': onPartialBatchItemFailure.toValue(),
      if (parallelizationFactor != null)
        'ParallelizationFactor': parallelizationFactor,
      if (startingPositionTimestamp != null)
        'StartingPositionTimestamp':
            unixTimestampToJson(startingPositionTimestamp),
    };
  }
}

/// The parameters for using an MSK stream as a source.
class PipeSourceManagedStreamingKafkaParameters {
  /// The name of the topic that the pipe will read from.
  final String topicName;

  /// The maximum number of records to include in each batch.
  final int? batchSize;

  /// The name of the destination queue to consume.
  final String? consumerGroupID;

  /// The credentials needed to access the resource.
  final MSKAccessCredentials? credentials;

  /// The maximum length of a time to wait for events.
  final int? maximumBatchingWindowInSeconds;

  /// (Streams only) The position in a stream from which to start reading.
  final MSKStartPosition? startingPosition;

  PipeSourceManagedStreamingKafkaParameters({
    required this.topicName,
    this.batchSize,
    this.consumerGroupID,
    this.credentials,
    this.maximumBatchingWindowInSeconds,
    this.startingPosition,
  });

  factory PipeSourceManagedStreamingKafkaParameters.fromJson(
      Map<String, dynamic> json) {
    return PipeSourceManagedStreamingKafkaParameters(
      topicName: json['TopicName'] as String,
      batchSize: json['BatchSize'] as int?,
      consumerGroupID: json['ConsumerGroupID'] as String?,
      credentials: json['Credentials'] != null
          ? MSKAccessCredentials.fromJson(
              json['Credentials'] as Map<String, dynamic>)
          : null,
      maximumBatchingWindowInSeconds:
          json['MaximumBatchingWindowInSeconds'] as int?,
      startingPosition:
          (json['StartingPosition'] as String?)?.toMSKStartPosition(),
    );
  }

  Map<String, dynamic> toJson() {
    final topicName = this.topicName;
    final batchSize = this.batchSize;
    final consumerGroupID = this.consumerGroupID;
    final credentials = this.credentials;
    final maximumBatchingWindowInSeconds = this.maximumBatchingWindowInSeconds;
    final startingPosition = this.startingPosition;
    return {
      'TopicName': topicName,
      if (batchSize != null) 'BatchSize': batchSize,
      if (consumerGroupID != null) 'ConsumerGroupID': consumerGroupID,
      if (credentials != null) 'Credentials': credentials,
      if (maximumBatchingWindowInSeconds != null)
        'MaximumBatchingWindowInSeconds': maximumBatchingWindowInSeconds,
      if (startingPosition != null)
        'StartingPosition': startingPosition.toValue(),
    };
  }
}

/// The parameters required to set up a source for your pipe.
class PipeSourceParameters {
  /// The parameters for using an Active MQ broker as a source.
  final PipeSourceActiveMQBrokerParameters? activeMQBrokerParameters;

  /// The parameters for using a DynamoDB stream as a source.
  final PipeSourceDynamoDBStreamParameters? dynamoDBStreamParameters;

  /// The collection of event patterns used to filter events.
  ///
  /// To remove a filter, specify a <code>FilterCriteria</code> object with an
  /// empty array of <code>Filter</code> objects.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-and-event-patterns.html">Events
  /// and Event Patterns</a> in the <i>Amazon EventBridge User Guide</i>.
  final FilterCriteria? filterCriteria;

  /// The parameters for using a Kinesis stream as a source.
  final PipeSourceKinesisStreamParameters? kinesisStreamParameters;

  /// The parameters for using an MSK stream as a source.
  final PipeSourceManagedStreamingKafkaParameters?
      managedStreamingKafkaParameters;

  /// The parameters for using a Rabbit MQ broker as a source.
  final PipeSourceRabbitMQBrokerParameters? rabbitMQBrokerParameters;

  /// The parameters for using a self-managed Apache Kafka stream as a source.
  ///
  /// A <i>self managed</i> cluster refers to any Apache Kafka cluster not hosted
  /// by Amazon Web Services. This includes both clusters you manage yourself, as
  /// well as those hosted by a third-party provider, such as <a
  /// href="https://www.confluent.io/">Confluent Cloud</a>, <a
  /// href="https://www.cloudkarafka.com/">CloudKarafka</a>, or <a
  /// href="https://redpanda.com/">Redpanda</a>. For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-pipes-kafka.html">Apache
  /// Kafka streams as a source</a> in the <i>Amazon EventBridge User Guide</i>.
  final PipeSourceSelfManagedKafkaParameters? selfManagedKafkaParameters;

  /// The parameters for using a Amazon SQS stream as a source.
  final PipeSourceSqsQueueParameters? sqsQueueParameters;

  PipeSourceParameters({
    this.activeMQBrokerParameters,
    this.dynamoDBStreamParameters,
    this.filterCriteria,
    this.kinesisStreamParameters,
    this.managedStreamingKafkaParameters,
    this.rabbitMQBrokerParameters,
    this.selfManagedKafkaParameters,
    this.sqsQueueParameters,
  });

  factory PipeSourceParameters.fromJson(Map<String, dynamic> json) {
    return PipeSourceParameters(
      activeMQBrokerParameters: json['ActiveMQBrokerParameters'] != null
          ? PipeSourceActiveMQBrokerParameters.fromJson(
              json['ActiveMQBrokerParameters'] as Map<String, dynamic>)
          : null,
      dynamoDBStreamParameters: json['DynamoDBStreamParameters'] != null
          ? PipeSourceDynamoDBStreamParameters.fromJson(
              json['DynamoDBStreamParameters'] as Map<String, dynamic>)
          : null,
      filterCriteria: json['FilterCriteria'] != null
          ? FilterCriteria.fromJson(
              json['FilterCriteria'] as Map<String, dynamic>)
          : null,
      kinesisStreamParameters: json['KinesisStreamParameters'] != null
          ? PipeSourceKinesisStreamParameters.fromJson(
              json['KinesisStreamParameters'] as Map<String, dynamic>)
          : null,
      managedStreamingKafkaParameters:
          json['ManagedStreamingKafkaParameters'] != null
              ? PipeSourceManagedStreamingKafkaParameters.fromJson(
                  json['ManagedStreamingKafkaParameters']
                      as Map<String, dynamic>)
              : null,
      rabbitMQBrokerParameters: json['RabbitMQBrokerParameters'] != null
          ? PipeSourceRabbitMQBrokerParameters.fromJson(
              json['RabbitMQBrokerParameters'] as Map<String, dynamic>)
          : null,
      selfManagedKafkaParameters: json['SelfManagedKafkaParameters'] != null
          ? PipeSourceSelfManagedKafkaParameters.fromJson(
              json['SelfManagedKafkaParameters'] as Map<String, dynamic>)
          : null,
      sqsQueueParameters: json['SqsQueueParameters'] != null
          ? PipeSourceSqsQueueParameters.fromJson(
              json['SqsQueueParameters'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final activeMQBrokerParameters = this.activeMQBrokerParameters;
    final dynamoDBStreamParameters = this.dynamoDBStreamParameters;
    final filterCriteria = this.filterCriteria;
    final kinesisStreamParameters = this.kinesisStreamParameters;
    final managedStreamingKafkaParameters =
        this.managedStreamingKafkaParameters;
    final rabbitMQBrokerParameters = this.rabbitMQBrokerParameters;
    final selfManagedKafkaParameters = this.selfManagedKafkaParameters;
    final sqsQueueParameters = this.sqsQueueParameters;
    return {
      if (activeMQBrokerParameters != null)
        'ActiveMQBrokerParameters': activeMQBrokerParameters,
      if (dynamoDBStreamParameters != null)
        'DynamoDBStreamParameters': dynamoDBStreamParameters,
      if (filterCriteria != null) 'FilterCriteria': filterCriteria,
      if (kinesisStreamParameters != null)
        'KinesisStreamParameters': kinesisStreamParameters,
      if (managedStreamingKafkaParameters != null)
        'ManagedStreamingKafkaParameters': managedStreamingKafkaParameters,
      if (rabbitMQBrokerParameters != null)
        'RabbitMQBrokerParameters': rabbitMQBrokerParameters,
      if (selfManagedKafkaParameters != null)
        'SelfManagedKafkaParameters': selfManagedKafkaParameters,
      if (sqsQueueParameters != null) 'SqsQueueParameters': sqsQueueParameters,
    };
  }
}

/// The parameters for using a Rabbit MQ broker as a source.
class PipeSourceRabbitMQBrokerParameters {
  /// The credentials needed to access the resource.
  final MQBrokerAccessCredentials credentials;

  /// The name of the destination queue to consume.
  final String queueName;

  /// The maximum number of records to include in each batch.
  final int? batchSize;

  /// The maximum length of a time to wait for events.
  final int? maximumBatchingWindowInSeconds;

  /// The name of the virtual host associated with the source broker.
  final String? virtualHost;

  PipeSourceRabbitMQBrokerParameters({
    required this.credentials,
    required this.queueName,
    this.batchSize,
    this.maximumBatchingWindowInSeconds,
    this.virtualHost,
  });

  factory PipeSourceRabbitMQBrokerParameters.fromJson(
      Map<String, dynamic> json) {
    return PipeSourceRabbitMQBrokerParameters(
      credentials: MQBrokerAccessCredentials.fromJson(
          json['Credentials'] as Map<String, dynamic>),
      queueName: json['QueueName'] as String,
      batchSize: json['BatchSize'] as int?,
      maximumBatchingWindowInSeconds:
          json['MaximumBatchingWindowInSeconds'] as int?,
      virtualHost: json['VirtualHost'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final credentials = this.credentials;
    final queueName = this.queueName;
    final batchSize = this.batchSize;
    final maximumBatchingWindowInSeconds = this.maximumBatchingWindowInSeconds;
    final virtualHost = this.virtualHost;
    return {
      'Credentials': credentials,
      'QueueName': queueName,
      if (batchSize != null) 'BatchSize': batchSize,
      if (maximumBatchingWindowInSeconds != null)
        'MaximumBatchingWindowInSeconds': maximumBatchingWindowInSeconds,
      if (virtualHost != null) 'VirtualHost': virtualHost,
    };
  }
}

/// The parameters for using a self-managed Apache Kafka stream as a source.
///
/// A <i>self managed</i> cluster refers to any Apache Kafka cluster not hosted
/// by Amazon Web Services. This includes both clusters you manage yourself, as
/// well as those hosted by a third-party provider, such as <a
/// href="https://www.confluent.io/">Confluent Cloud</a>, <a
/// href="https://www.cloudkarafka.com/">CloudKarafka</a>, or <a
/// href="https://redpanda.com/">Redpanda</a>. For more information, see <a
/// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-pipes-kafka.html">Apache
/// Kafka streams as a source</a> in the <i>Amazon EventBridge User Guide</i>.
class PipeSourceSelfManagedKafkaParameters {
  /// The name of the topic that the pipe will read from.
  final String topicName;

  /// An array of server URLs.
  final List<String>? additionalBootstrapServers;

  /// The maximum number of records to include in each batch.
  final int? batchSize;

  /// The name of the destination queue to consume.
  final String? consumerGroupID;

  /// The credentials needed to access the resource.
  final SelfManagedKafkaAccessConfigurationCredentials? credentials;

  /// The maximum length of a time to wait for events.
  final int? maximumBatchingWindowInSeconds;

  /// The ARN of the Secrets Manager secret used for certification.
  final String? serverRootCaCertificate;

  /// (Streams only) The position in a stream from which to start reading.
  final SelfManagedKafkaStartPosition? startingPosition;

  /// This structure specifies the VPC subnets and security groups for the stream,
  /// and whether a public IP address is to be used.
  final SelfManagedKafkaAccessConfigurationVpc? vpc;

  PipeSourceSelfManagedKafkaParameters({
    required this.topicName,
    this.additionalBootstrapServers,
    this.batchSize,
    this.consumerGroupID,
    this.credentials,
    this.maximumBatchingWindowInSeconds,
    this.serverRootCaCertificate,
    this.startingPosition,
    this.vpc,
  });

  factory PipeSourceSelfManagedKafkaParameters.fromJson(
      Map<String, dynamic> json) {
    return PipeSourceSelfManagedKafkaParameters(
      topicName: json['TopicName'] as String,
      additionalBootstrapServers: (json['AdditionalBootstrapServers'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      batchSize: json['BatchSize'] as int?,
      consumerGroupID: json['ConsumerGroupID'] as String?,
      credentials: json['Credentials'] != null
          ? SelfManagedKafkaAccessConfigurationCredentials.fromJson(
              json['Credentials'] as Map<String, dynamic>)
          : null,
      maximumBatchingWindowInSeconds:
          json['MaximumBatchingWindowInSeconds'] as int?,
      serverRootCaCertificate: json['ServerRootCaCertificate'] as String?,
      startingPosition: (json['StartingPosition'] as String?)
          ?.toSelfManagedKafkaStartPosition(),
      vpc: json['Vpc'] != null
          ? SelfManagedKafkaAccessConfigurationVpc.fromJson(
              json['Vpc'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final topicName = this.topicName;
    final additionalBootstrapServers = this.additionalBootstrapServers;
    final batchSize = this.batchSize;
    final consumerGroupID = this.consumerGroupID;
    final credentials = this.credentials;
    final maximumBatchingWindowInSeconds = this.maximumBatchingWindowInSeconds;
    final serverRootCaCertificate = this.serverRootCaCertificate;
    final startingPosition = this.startingPosition;
    final vpc = this.vpc;
    return {
      'TopicName': topicName,
      if (additionalBootstrapServers != null)
        'AdditionalBootstrapServers': additionalBootstrapServers,
      if (batchSize != null) 'BatchSize': batchSize,
      if (consumerGroupID != null) 'ConsumerGroupID': consumerGroupID,
      if (credentials != null) 'Credentials': credentials,
      if (maximumBatchingWindowInSeconds != null)
        'MaximumBatchingWindowInSeconds': maximumBatchingWindowInSeconds,
      if (serverRootCaCertificate != null)
        'ServerRootCaCertificate': serverRootCaCertificate,
      if (startingPosition != null)
        'StartingPosition': startingPosition.toValue(),
      if (vpc != null) 'Vpc': vpc,
    };
  }
}

/// The parameters for using a Amazon SQS stream as a source.
class PipeSourceSqsQueueParameters {
  /// The maximum number of records to include in each batch.
  final int? batchSize;

  /// The maximum length of a time to wait for events.
  final int? maximumBatchingWindowInSeconds;

  PipeSourceSqsQueueParameters({
    this.batchSize,
    this.maximumBatchingWindowInSeconds,
  });

  factory PipeSourceSqsQueueParameters.fromJson(Map<String, dynamic> json) {
    return PipeSourceSqsQueueParameters(
      batchSize: json['BatchSize'] as int?,
      maximumBatchingWindowInSeconds:
          json['MaximumBatchingWindowInSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final batchSize = this.batchSize;
    final maximumBatchingWindowInSeconds = this.maximumBatchingWindowInSeconds;
    return {
      if (batchSize != null) 'BatchSize': batchSize,
      if (maximumBatchingWindowInSeconds != null)
        'MaximumBatchingWindowInSeconds': maximumBatchingWindowInSeconds,
    };
  }
}

enum PipeState {
  running,
  stopped,
  creating,
  updating,
  deleting,
  starting,
  stopping,
  createFailed,
  updateFailed,
  startFailed,
  stopFailed,
  deleteFailed,
  createRollbackFailed,
  deleteRollbackFailed,
  updateRollbackFailed,
}

extension PipeStateValueExtension on PipeState {
  String toValue() {
    switch (this) {
      case PipeState.running:
        return 'RUNNING';
      case PipeState.stopped:
        return 'STOPPED';
      case PipeState.creating:
        return 'CREATING';
      case PipeState.updating:
        return 'UPDATING';
      case PipeState.deleting:
        return 'DELETING';
      case PipeState.starting:
        return 'STARTING';
      case PipeState.stopping:
        return 'STOPPING';
      case PipeState.createFailed:
        return 'CREATE_FAILED';
      case PipeState.updateFailed:
        return 'UPDATE_FAILED';
      case PipeState.startFailed:
        return 'START_FAILED';
      case PipeState.stopFailed:
        return 'STOP_FAILED';
      case PipeState.deleteFailed:
        return 'DELETE_FAILED';
      case PipeState.createRollbackFailed:
        return 'CREATE_ROLLBACK_FAILED';
      case PipeState.deleteRollbackFailed:
        return 'DELETE_ROLLBACK_FAILED';
      case PipeState.updateRollbackFailed:
        return 'UPDATE_ROLLBACK_FAILED';
    }
  }
}

extension PipeStateFromString on String {
  PipeState toPipeState() {
    switch (this) {
      case 'RUNNING':
        return PipeState.running;
      case 'STOPPED':
        return PipeState.stopped;
      case 'CREATING':
        return PipeState.creating;
      case 'UPDATING':
        return PipeState.updating;
      case 'DELETING':
        return PipeState.deleting;
      case 'STARTING':
        return PipeState.starting;
      case 'STOPPING':
        return PipeState.stopping;
      case 'CREATE_FAILED':
        return PipeState.createFailed;
      case 'UPDATE_FAILED':
        return PipeState.updateFailed;
      case 'START_FAILED':
        return PipeState.startFailed;
      case 'STOP_FAILED':
        return PipeState.stopFailed;
      case 'DELETE_FAILED':
        return PipeState.deleteFailed;
      case 'CREATE_ROLLBACK_FAILED':
        return PipeState.createRollbackFailed;
      case 'DELETE_ROLLBACK_FAILED':
        return PipeState.deleteRollbackFailed;
      case 'UPDATE_ROLLBACK_FAILED':
        return PipeState.updateRollbackFailed;
    }
    throw Exception('$this is not known in enum PipeState');
  }
}

/// The parameters for using an Batch job as a target.
class PipeTargetBatchJobParameters {
  /// The job definition used by this job. This value can be one of
  /// <code>name</code>, <code>name:revision</code>, or the Amazon Resource Name
  /// (ARN) for the job definition. If name is specified without a revision then
  /// the latest active revision is used.
  final String jobDefinition;

  /// The name of the job. It can be up to 128 letters long. The first character
  /// must be alphanumeric, can contain uppercase and lowercase letters, numbers,
  /// hyphens (-), and underscores (_).
  final String jobName;

  /// The array properties for the submitted job, such as the size of the array.
  /// The array size can be between 2 and 10,000. If you specify array properties
  /// for a job, it becomes an array job. This parameter is used only if the
  /// target is an Batch job.
  final BatchArrayProperties? arrayProperties;

  /// The overrides that are sent to a container.
  final BatchContainerOverrides? containerOverrides;

  /// A list of dependencies for the job. A job can depend upon a maximum of 20
  /// jobs. You can specify a <code>SEQUENTIAL</code> type dependency without
  /// specifying a job ID for array jobs so that each child array job completes
  /// sequentially, starting at index 0. You can also specify an
  /// <code>N_TO_N</code> type dependency with a job ID for array jobs. In that
  /// case, each index child of this job must wait for the corresponding index
  /// child of each dependency to complete before it can begin.
  final List<BatchJobDependency>? dependsOn;

  /// Additional parameters passed to the job that replace parameter substitution
  /// placeholders that are set in the job definition. Parameters are specified as
  /// a key and value pair mapping. Parameters included here override any
  /// corresponding parameter defaults from the job definition.
  final Map<String, String>? parameters;

  /// The retry strategy to use for failed jobs. When a retry strategy is
  /// specified here, it overrides the retry strategy defined in the job
  /// definition.
  final BatchRetryStrategy? retryStrategy;

  PipeTargetBatchJobParameters({
    required this.jobDefinition,
    required this.jobName,
    this.arrayProperties,
    this.containerOverrides,
    this.dependsOn,
    this.parameters,
    this.retryStrategy,
  });

  factory PipeTargetBatchJobParameters.fromJson(Map<String, dynamic> json) {
    return PipeTargetBatchJobParameters(
      jobDefinition: json['JobDefinition'] as String,
      jobName: json['JobName'] as String,
      arrayProperties: json['ArrayProperties'] != null
          ? BatchArrayProperties.fromJson(
              json['ArrayProperties'] as Map<String, dynamic>)
          : null,
      containerOverrides: json['ContainerOverrides'] != null
          ? BatchContainerOverrides.fromJson(
              json['ContainerOverrides'] as Map<String, dynamic>)
          : null,
      dependsOn: (json['DependsOn'] as List?)
          ?.whereNotNull()
          .map((e) => BatchJobDependency.fromJson(e as Map<String, dynamic>))
          .toList(),
      parameters: (json['Parameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      retryStrategy: json['RetryStrategy'] != null
          ? BatchRetryStrategy.fromJson(
              json['RetryStrategy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final jobDefinition = this.jobDefinition;
    final jobName = this.jobName;
    final arrayProperties = this.arrayProperties;
    final containerOverrides = this.containerOverrides;
    final dependsOn = this.dependsOn;
    final parameters = this.parameters;
    final retryStrategy = this.retryStrategy;
    return {
      'JobDefinition': jobDefinition,
      'JobName': jobName,
      if (arrayProperties != null) 'ArrayProperties': arrayProperties,
      if (containerOverrides != null) 'ContainerOverrides': containerOverrides,
      if (dependsOn != null) 'DependsOn': dependsOn,
      if (parameters != null) 'Parameters': parameters,
      if (retryStrategy != null) 'RetryStrategy': retryStrategy,
    };
  }
}

/// The parameters for using an CloudWatch Logs log stream as a target.
class PipeTargetCloudWatchLogsParameters {
  /// The name of the log stream.
  final String? logStreamName;

  /// The time the event occurred, expressed as the number of milliseconds after
  /// Jan 1, 1970 00:00:00 UTC.
  final String? timestamp;

  PipeTargetCloudWatchLogsParameters({
    this.logStreamName,
    this.timestamp,
  });

  factory PipeTargetCloudWatchLogsParameters.fromJson(
      Map<String, dynamic> json) {
    return PipeTargetCloudWatchLogsParameters(
      logStreamName: json['LogStreamName'] as String?,
      timestamp: json['Timestamp'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final logStreamName = this.logStreamName;
    final timestamp = this.timestamp;
    return {
      if (logStreamName != null) 'LogStreamName': logStreamName,
      if (timestamp != null) 'Timestamp': timestamp,
    };
  }
}

/// The parameters for using an Amazon ECS task as a target.
class PipeTargetEcsTaskParameters {
  /// The ARN of the task definition to use if the event target is an Amazon ECS
  /// task.
  final String taskDefinitionArn;

  /// The capacity provider strategy to use for the task.
  ///
  /// If a <code>capacityProviderStrategy</code> is specified, the
  /// <code>launchType</code> parameter must be omitted. If no
  /// <code>capacityProviderStrategy</code> or launchType is specified, the
  /// <code>defaultCapacityProviderStrategy</code> for the cluster is used.
  final List<CapacityProviderStrategyItem>? capacityProviderStrategy;

  /// Specifies whether to enable Amazon ECS managed tags for the task. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-using-tags.html">Tagging
  /// Your Amazon ECS Resources</a> in the Amazon Elastic Container Service
  /// Developer Guide.
  final bool? enableECSManagedTags;

  /// Whether or not to enable the execute command functionality for the
  /// containers in this task. If true, this enables execute command functionality
  /// on all containers in the task.
  final bool? enableExecuteCommand;

  /// Specifies an Amazon ECS task group for the task. The maximum length is 255
  /// characters.
  final String? group;

  /// Specifies the launch type on which your task is running. The launch type
  /// that you specify here must match one of the launch type (compatibilities) of
  /// the target task. The <code>FARGATE</code> value is supported only in the
  /// Regions where Fargate with Amazon ECS is supported. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/AWS-Fargate.html">Fargate
  /// on Amazon ECS</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  final LaunchType? launchType;

  /// Use this structure if the Amazon ECS task uses the <code>awsvpc</code>
  /// network mode. This structure specifies the VPC subnets and security groups
  /// associated with the task, and whether a public IP address is to be used.
  /// This structure is required if <code>LaunchType</code> is
  /// <code>FARGATE</code> because the <code>awsvpc</code> mode is required for
  /// Fargate tasks.
  ///
  /// If you specify <code>NetworkConfiguration</code> when the target ECS task
  /// does not use the <code>awsvpc</code> network mode, the task fails.
  final NetworkConfiguration? networkConfiguration;

  /// The overrides that are associated with a task.
  final EcsTaskOverride? overrides;

  /// An array of placement constraint objects to use for the task. You can
  /// specify up to 10 constraints per task (including constraints in the task
  /// definition and those specified at runtime).
  final List<PlacementConstraint>? placementConstraints;

  /// The placement strategy objects to use for the task. You can specify a
  /// maximum of five strategy rules per task.
  final List<PlacementStrategy>? placementStrategy;

  /// Specifies the platform version for the task. Specify only the numeric
  /// portion of the platform version, such as <code>1.1.0</code>.
  ///
  /// This structure is used only if <code>LaunchType</code> is
  /// <code>FARGATE</code>. For more information about valid platform versions,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/platform_versions.html">Fargate
  /// Platform Versions</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  final String? platformVersion;

  /// Specifies whether to propagate the tags from the task definition to the
  /// task. If no value is specified, the tags are not propagated. Tags can only
  /// be propagated to the task during task creation. To add tags to a task after
  /// task creation, use the <code>TagResource</code> API action.
  final PropagateTags? propagateTags;

  /// The reference ID to use for the task.
  final String? referenceId;

  /// The metadata that you apply to the task to help you categorize and organize
  /// them. Each tag consists of a key and an optional value, both of which you
  /// define. To learn more, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_RunTask.html#ECS-RunTask-request-tags">RunTask</a>
  /// in the Amazon ECS API Reference.
  final List<Tag>? tags;

  /// The number of tasks to create based on <code>TaskDefinition</code>. The
  /// default is 1.
  final int? taskCount;

  PipeTargetEcsTaskParameters({
    required this.taskDefinitionArn,
    this.capacityProviderStrategy,
    this.enableECSManagedTags,
    this.enableExecuteCommand,
    this.group,
    this.launchType,
    this.networkConfiguration,
    this.overrides,
    this.placementConstraints,
    this.placementStrategy,
    this.platformVersion,
    this.propagateTags,
    this.referenceId,
    this.tags,
    this.taskCount,
  });

  factory PipeTargetEcsTaskParameters.fromJson(Map<String, dynamic> json) {
    return PipeTargetEcsTaskParameters(
      taskDefinitionArn: json['TaskDefinitionArn'] as String,
      capacityProviderStrategy: (json['CapacityProviderStrategy'] as List?)
          ?.whereNotNull()
          .map((e) =>
              CapacityProviderStrategyItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      enableECSManagedTags: json['EnableECSManagedTags'] as bool?,
      enableExecuteCommand: json['EnableExecuteCommand'] as bool?,
      group: json['Group'] as String?,
      launchType: (json['LaunchType'] as String?)?.toLaunchType(),
      networkConfiguration: json['NetworkConfiguration'] != null
          ? NetworkConfiguration.fromJson(
              json['NetworkConfiguration'] as Map<String, dynamic>)
          : null,
      overrides: json['Overrides'] != null
          ? EcsTaskOverride.fromJson(json['Overrides'] as Map<String, dynamic>)
          : null,
      placementConstraints: (json['PlacementConstraints'] as List?)
          ?.whereNotNull()
          .map((e) => PlacementConstraint.fromJson(e as Map<String, dynamic>))
          .toList(),
      placementStrategy: (json['PlacementStrategy'] as List?)
          ?.whereNotNull()
          .map((e) => PlacementStrategy.fromJson(e as Map<String, dynamic>))
          .toList(),
      platformVersion: json['PlatformVersion'] as String?,
      propagateTags: (json['PropagateTags'] as String?)?.toPropagateTags(),
      referenceId: json['ReferenceId'] as String?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      taskCount: json['TaskCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final taskDefinitionArn = this.taskDefinitionArn;
    final capacityProviderStrategy = this.capacityProviderStrategy;
    final enableECSManagedTags = this.enableECSManagedTags;
    final enableExecuteCommand = this.enableExecuteCommand;
    final group = this.group;
    final launchType = this.launchType;
    final networkConfiguration = this.networkConfiguration;
    final overrides = this.overrides;
    final placementConstraints = this.placementConstraints;
    final placementStrategy = this.placementStrategy;
    final platformVersion = this.platformVersion;
    final propagateTags = this.propagateTags;
    final referenceId = this.referenceId;
    final tags = this.tags;
    final taskCount = this.taskCount;
    return {
      'TaskDefinitionArn': taskDefinitionArn,
      if (capacityProviderStrategy != null)
        'CapacityProviderStrategy': capacityProviderStrategy,
      if (enableECSManagedTags != null)
        'EnableECSManagedTags': enableECSManagedTags,
      if (enableExecuteCommand != null)
        'EnableExecuteCommand': enableExecuteCommand,
      if (group != null) 'Group': group,
      if (launchType != null) 'LaunchType': launchType.toValue(),
      if (networkConfiguration != null)
        'NetworkConfiguration': networkConfiguration,
      if (overrides != null) 'Overrides': overrides,
      if (placementConstraints != null)
        'PlacementConstraints': placementConstraints,
      if (placementStrategy != null) 'PlacementStrategy': placementStrategy,
      if (platformVersion != null) 'PlatformVersion': platformVersion,
      if (propagateTags != null) 'PropagateTags': propagateTags.toValue(),
      if (referenceId != null) 'ReferenceId': referenceId,
      if (tags != null) 'Tags': tags,
      if (taskCount != null) 'TaskCount': taskCount,
    };
  }
}

/// The parameters for using an EventBridge event bus as a target.
class PipeTargetEventBridgeEventBusParameters {
  /// A free-form string, with a maximum of 128 characters, used to decide what
  /// fields to expect in the event detail.
  final String? detailType;

  /// The URL subdomain of the endpoint. For example, if the URL for Endpoint is
  /// https://abcde.veo.endpoints.event.amazonaws.com, then the EndpointId is
  /// <code>abcde.veo</code>.
  final String? endpointId;

  /// Amazon Web Services resources, identified by Amazon Resource Name (ARN),
  /// which the event primarily concerns. Any number, including zero, may be
  /// present.
  final List<String>? resources;

  /// The source of the event.
  final String? source;

  /// The time stamp of the event, per <a
  /// href="https://www.rfc-editor.org/rfc/rfc3339.txt">RFC3339</a>. If no time
  /// stamp is provided, the time stamp of the <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_PutEvents.html">PutEvents</a>
  /// call is used.
  final String? time;

  PipeTargetEventBridgeEventBusParameters({
    this.detailType,
    this.endpointId,
    this.resources,
    this.source,
    this.time,
  });

  factory PipeTargetEventBridgeEventBusParameters.fromJson(
      Map<String, dynamic> json) {
    return PipeTargetEventBridgeEventBusParameters(
      detailType: json['DetailType'] as String?,
      endpointId: json['EndpointId'] as String?,
      resources: (json['Resources'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      source: json['Source'] as String?,
      time: json['Time'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final detailType = this.detailType;
    final endpointId = this.endpointId;
    final resources = this.resources;
    final source = this.source;
    final time = this.time;
    return {
      if (detailType != null) 'DetailType': detailType,
      if (endpointId != null) 'EndpointId': endpointId,
      if (resources != null) 'Resources': resources,
      if (source != null) 'Source': source,
      if (time != null) 'Time': time,
    };
  }
}

/// These are custom parameter to be used when the target is an API Gateway REST
/// APIs or EventBridge ApiDestinations.
class PipeTargetHttpParameters {
  /// The headers that need to be sent as part of request invoking the API Gateway
  /// REST API or EventBridge ApiDestination.
  final Map<String, String>? headerParameters;

  /// The path parameter values to be used to populate API Gateway REST API or
  /// EventBridge ApiDestination path wildcards ("*").
  final List<String>? pathParameterValues;

  /// The query string keys/values that need to be sent as part of request
  /// invoking the API Gateway REST API or EventBridge ApiDestination.
  final Map<String, String>? queryStringParameters;

  PipeTargetHttpParameters({
    this.headerParameters,
    this.pathParameterValues,
    this.queryStringParameters,
  });

  factory PipeTargetHttpParameters.fromJson(Map<String, dynamic> json) {
    return PipeTargetHttpParameters(
      headerParameters: (json['HeaderParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      pathParameterValues: (json['PathParameterValues'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      queryStringParameters:
          (json['QueryStringParameters'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final headerParameters = this.headerParameters;
    final pathParameterValues = this.pathParameterValues;
    final queryStringParameters = this.queryStringParameters;
    return {
      if (headerParameters != null) 'HeaderParameters': headerParameters,
      if (pathParameterValues != null)
        'PathParameterValues': pathParameterValues,
      if (queryStringParameters != null)
        'QueryStringParameters': queryStringParameters,
    };
  }
}

enum PipeTargetInvocationType {
  requestResponse,
  fireAndForget,
}

extension PipeTargetInvocationTypeValueExtension on PipeTargetInvocationType {
  String toValue() {
    switch (this) {
      case PipeTargetInvocationType.requestResponse:
        return 'REQUEST_RESPONSE';
      case PipeTargetInvocationType.fireAndForget:
        return 'FIRE_AND_FORGET';
    }
  }
}

extension PipeTargetInvocationTypeFromString on String {
  PipeTargetInvocationType toPipeTargetInvocationType() {
    switch (this) {
      case 'REQUEST_RESPONSE':
        return PipeTargetInvocationType.requestResponse;
      case 'FIRE_AND_FORGET':
        return PipeTargetInvocationType.fireAndForget;
    }
    throw Exception('$this is not known in enum PipeTargetInvocationType');
  }
}

/// The parameters for using a Kinesis stream as a target.
class PipeTargetKinesisStreamParameters {
  /// Determines which shard in the stream the data record is assigned to.
  /// Partition keys are Unicode strings with a maximum length limit of 256
  /// characters for each key. Amazon Kinesis Data Streams uses the partition key
  /// as input to a hash function that maps the partition key and associated data
  /// to a specific shard. Specifically, an MD5 hash function is used to map
  /// partition keys to 128-bit integer values and to map associated data records
  /// to shards. As a result of this hashing mechanism, all data records with the
  /// same partition key map to the same shard within the stream.
  final String partitionKey;

  PipeTargetKinesisStreamParameters({
    required this.partitionKey,
  });

  factory PipeTargetKinesisStreamParameters.fromJson(
      Map<String, dynamic> json) {
    return PipeTargetKinesisStreamParameters(
      partitionKey: json['PartitionKey'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final partitionKey = this.partitionKey;
    return {
      'PartitionKey': partitionKey,
    };
  }
}

/// The parameters for using a Lambda function as a target.
class PipeTargetLambdaFunctionParameters {
  /// Specify whether to invoke the function synchronously or asynchronously.
  ///
  /// <ul>
  /// <li>
  /// <code>REQUEST_RESPONSE</code> (default) - Invoke synchronously. This
  /// corresponds to the <code>RequestResponse</code> option in the
  /// <code>InvocationType</code> parameter for the Lambda <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/API_Invoke.html#API_Invoke_RequestSyntax">Invoke</a>
  /// API.
  /// </li>
  /// <li>
  /// <code>FIRE_AND_FORGET</code> - Invoke asynchronously. This corresponds to
  /// the <code>Event</code> option in the <code>InvocationType</code> parameter
  /// for the Lambda <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/API_Invoke.html#API_Invoke_RequestSyntax">Invoke</a>
  /// API.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-pipes.html#pipes-invocation">Invocation
  /// types</a> in the <i>Amazon EventBridge User Guide</i>.
  final PipeTargetInvocationType? invocationType;

  PipeTargetLambdaFunctionParameters({
    this.invocationType,
  });

  factory PipeTargetLambdaFunctionParameters.fromJson(
      Map<String, dynamic> json) {
    return PipeTargetLambdaFunctionParameters(
      invocationType:
          (json['InvocationType'] as String?)?.toPipeTargetInvocationType(),
    );
  }

  Map<String, dynamic> toJson() {
    final invocationType = this.invocationType;
    return {
      if (invocationType != null) 'InvocationType': invocationType.toValue(),
    };
  }
}

/// The parameters required to set up a target for your pipe.
///
/// For more information about pipe target parameters, including how to use
/// dynamic path parameters, see <a
/// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-pipes-event-target.html">Target
/// parameters</a> in the <i>Amazon EventBridge User Guide</i>.
class PipeTargetParameters {
  /// The parameters for using an Batch job as a target.
  final PipeTargetBatchJobParameters? batchJobParameters;

  /// The parameters for using an CloudWatch Logs log stream as a target.
  final PipeTargetCloudWatchLogsParameters? cloudWatchLogsParameters;

  /// The parameters for using an Amazon ECS task as a target.
  final PipeTargetEcsTaskParameters? ecsTaskParameters;

  /// The parameters for using an EventBridge event bus as a target.
  final PipeTargetEventBridgeEventBusParameters? eventBridgeEventBusParameters;

  /// These are custom parameter to be used when the target is an API Gateway REST
  /// APIs or EventBridge ApiDestinations.
  final PipeTargetHttpParameters? httpParameters;

  /// Valid JSON text passed to the target. In this case, nothing from the event
  /// itself is passed to the target. For more information, see <a
  /// href="http://www.rfc-editor.org/rfc/rfc7159.txt">The JavaScript Object
  /// Notation (JSON) Data Interchange Format</a>.
  ///
  /// To remove an input template, specify an empty string.
  final String? inputTemplate;

  /// The parameters for using a Kinesis stream as a target.
  final PipeTargetKinesisStreamParameters? kinesisStreamParameters;

  /// The parameters for using a Lambda function as a target.
  final PipeTargetLambdaFunctionParameters? lambdaFunctionParameters;

  /// These are custom parameters to be used when the target is a Amazon Redshift
  /// cluster to invoke the Amazon Redshift Data API BatchExecuteStatement.
  final PipeTargetRedshiftDataParameters? redshiftDataParameters;

  /// The parameters for using a SageMaker pipeline as a target.
  final PipeTargetSageMakerPipelineParameters? sageMakerPipelineParameters;

  /// The parameters for using a Amazon SQS stream as a target.
  final PipeTargetSqsQueueParameters? sqsQueueParameters;

  /// The parameters for using a Step Functions state machine as a target.
  final PipeTargetStateMachineParameters? stepFunctionStateMachineParameters;

  /// The parameters for using a Timestream for LiveAnalytics table as a target.
  final PipeTargetTimestreamParameters? timestreamParameters;

  PipeTargetParameters({
    this.batchJobParameters,
    this.cloudWatchLogsParameters,
    this.ecsTaskParameters,
    this.eventBridgeEventBusParameters,
    this.httpParameters,
    this.inputTemplate,
    this.kinesisStreamParameters,
    this.lambdaFunctionParameters,
    this.redshiftDataParameters,
    this.sageMakerPipelineParameters,
    this.sqsQueueParameters,
    this.stepFunctionStateMachineParameters,
    this.timestreamParameters,
  });

  factory PipeTargetParameters.fromJson(Map<String, dynamic> json) {
    return PipeTargetParameters(
      batchJobParameters: json['BatchJobParameters'] != null
          ? PipeTargetBatchJobParameters.fromJson(
              json['BatchJobParameters'] as Map<String, dynamic>)
          : null,
      cloudWatchLogsParameters: json['CloudWatchLogsParameters'] != null
          ? PipeTargetCloudWatchLogsParameters.fromJson(
              json['CloudWatchLogsParameters'] as Map<String, dynamic>)
          : null,
      ecsTaskParameters: json['EcsTaskParameters'] != null
          ? PipeTargetEcsTaskParameters.fromJson(
              json['EcsTaskParameters'] as Map<String, dynamic>)
          : null,
      eventBridgeEventBusParameters:
          json['EventBridgeEventBusParameters'] != null
              ? PipeTargetEventBridgeEventBusParameters.fromJson(
                  json['EventBridgeEventBusParameters'] as Map<String, dynamic>)
              : null,
      httpParameters: json['HttpParameters'] != null
          ? PipeTargetHttpParameters.fromJson(
              json['HttpParameters'] as Map<String, dynamic>)
          : null,
      inputTemplate: json['InputTemplate'] as String?,
      kinesisStreamParameters: json['KinesisStreamParameters'] != null
          ? PipeTargetKinesisStreamParameters.fromJson(
              json['KinesisStreamParameters'] as Map<String, dynamic>)
          : null,
      lambdaFunctionParameters: json['LambdaFunctionParameters'] != null
          ? PipeTargetLambdaFunctionParameters.fromJson(
              json['LambdaFunctionParameters'] as Map<String, dynamic>)
          : null,
      redshiftDataParameters: json['RedshiftDataParameters'] != null
          ? PipeTargetRedshiftDataParameters.fromJson(
              json['RedshiftDataParameters'] as Map<String, dynamic>)
          : null,
      sageMakerPipelineParameters: json['SageMakerPipelineParameters'] != null
          ? PipeTargetSageMakerPipelineParameters.fromJson(
              json['SageMakerPipelineParameters'] as Map<String, dynamic>)
          : null,
      sqsQueueParameters: json['SqsQueueParameters'] != null
          ? PipeTargetSqsQueueParameters.fromJson(
              json['SqsQueueParameters'] as Map<String, dynamic>)
          : null,
      stepFunctionStateMachineParameters:
          json['StepFunctionStateMachineParameters'] != null
              ? PipeTargetStateMachineParameters.fromJson(
                  json['StepFunctionStateMachineParameters']
                      as Map<String, dynamic>)
              : null,
      timestreamParameters: json['TimestreamParameters'] != null
          ? PipeTargetTimestreamParameters.fromJson(
              json['TimestreamParameters'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final batchJobParameters = this.batchJobParameters;
    final cloudWatchLogsParameters = this.cloudWatchLogsParameters;
    final ecsTaskParameters = this.ecsTaskParameters;
    final eventBridgeEventBusParameters = this.eventBridgeEventBusParameters;
    final httpParameters = this.httpParameters;
    final inputTemplate = this.inputTemplate;
    final kinesisStreamParameters = this.kinesisStreamParameters;
    final lambdaFunctionParameters = this.lambdaFunctionParameters;
    final redshiftDataParameters = this.redshiftDataParameters;
    final sageMakerPipelineParameters = this.sageMakerPipelineParameters;
    final sqsQueueParameters = this.sqsQueueParameters;
    final stepFunctionStateMachineParameters =
        this.stepFunctionStateMachineParameters;
    final timestreamParameters = this.timestreamParameters;
    return {
      if (batchJobParameters != null) 'BatchJobParameters': batchJobParameters,
      if (cloudWatchLogsParameters != null)
        'CloudWatchLogsParameters': cloudWatchLogsParameters,
      if (ecsTaskParameters != null) 'EcsTaskParameters': ecsTaskParameters,
      if (eventBridgeEventBusParameters != null)
        'EventBridgeEventBusParameters': eventBridgeEventBusParameters,
      if (httpParameters != null) 'HttpParameters': httpParameters,
      if (inputTemplate != null) 'InputTemplate': inputTemplate,
      if (kinesisStreamParameters != null)
        'KinesisStreamParameters': kinesisStreamParameters,
      if (lambdaFunctionParameters != null)
        'LambdaFunctionParameters': lambdaFunctionParameters,
      if (redshiftDataParameters != null)
        'RedshiftDataParameters': redshiftDataParameters,
      if (sageMakerPipelineParameters != null)
        'SageMakerPipelineParameters': sageMakerPipelineParameters,
      if (sqsQueueParameters != null) 'SqsQueueParameters': sqsQueueParameters,
      if (stepFunctionStateMachineParameters != null)
        'StepFunctionStateMachineParameters':
            stepFunctionStateMachineParameters,
      if (timestreamParameters != null)
        'TimestreamParameters': timestreamParameters,
    };
  }
}

/// These are custom parameters to be used when the target is a Amazon Redshift
/// cluster to invoke the Amazon Redshift Data API BatchExecuteStatement.
class PipeTargetRedshiftDataParameters {
  /// The name of the database. Required when authenticating using temporary
  /// credentials.
  final String database;

  /// The SQL statement text to run.
  final List<String> sqls;

  /// The database user name. Required when authenticating using temporary
  /// credentials.
  final String? dbUser;

  /// The name or ARN of the secret that enables access to the database. Required
  /// when authenticating using Secrets Manager.
  final String? secretManagerArn;

  /// The name of the SQL statement. You can name the SQL statement when you
  /// create it to identify the query.
  final String? statementName;

  /// Indicates whether to send an event back to EventBridge after the SQL
  /// statement runs.
  final bool? withEvent;

  PipeTargetRedshiftDataParameters({
    required this.database,
    required this.sqls,
    this.dbUser,
    this.secretManagerArn,
    this.statementName,
    this.withEvent,
  });

  factory PipeTargetRedshiftDataParameters.fromJson(Map<String, dynamic> json) {
    return PipeTargetRedshiftDataParameters(
      database: json['Database'] as String,
      sqls: (json['Sqls'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      dbUser: json['DbUser'] as String?,
      secretManagerArn: json['SecretManagerArn'] as String?,
      statementName: json['StatementName'] as String?,
      withEvent: json['WithEvent'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final database = this.database;
    final sqls = this.sqls;
    final dbUser = this.dbUser;
    final secretManagerArn = this.secretManagerArn;
    final statementName = this.statementName;
    final withEvent = this.withEvent;
    return {
      'Database': database,
      'Sqls': sqls,
      if (dbUser != null) 'DbUser': dbUser,
      if (secretManagerArn != null) 'SecretManagerArn': secretManagerArn,
      if (statementName != null) 'StatementName': statementName,
      if (withEvent != null) 'WithEvent': withEvent,
    };
  }
}

/// The parameters for using a SageMaker pipeline as a target.
class PipeTargetSageMakerPipelineParameters {
  /// List of Parameter names and values for SageMaker Model Building Pipeline
  /// execution.
  final List<SageMakerPipelineParameter>? pipelineParameterList;

  PipeTargetSageMakerPipelineParameters({
    this.pipelineParameterList,
  });

  factory PipeTargetSageMakerPipelineParameters.fromJson(
      Map<String, dynamic> json) {
    return PipeTargetSageMakerPipelineParameters(
      pipelineParameterList: (json['PipelineParameterList'] as List?)
          ?.whereNotNull()
          .map((e) =>
              SageMakerPipelineParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final pipelineParameterList = this.pipelineParameterList;
    return {
      if (pipelineParameterList != null)
        'PipelineParameterList': pipelineParameterList,
    };
  }
}

/// The parameters for using a Amazon SQS stream as a target.
class PipeTargetSqsQueueParameters {
  /// This parameter applies only to FIFO (first-in-first-out) queues.
  ///
  /// The token used for deduplication of sent messages.
  final String? messageDeduplicationId;

  /// The FIFO message group ID to use as the target.
  final String? messageGroupId;

  PipeTargetSqsQueueParameters({
    this.messageDeduplicationId,
    this.messageGroupId,
  });

  factory PipeTargetSqsQueueParameters.fromJson(Map<String, dynamic> json) {
    return PipeTargetSqsQueueParameters(
      messageDeduplicationId: json['MessageDeduplicationId'] as String?,
      messageGroupId: json['MessageGroupId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final messageDeduplicationId = this.messageDeduplicationId;
    final messageGroupId = this.messageGroupId;
    return {
      if (messageDeduplicationId != null)
        'MessageDeduplicationId': messageDeduplicationId,
      if (messageGroupId != null) 'MessageGroupId': messageGroupId,
    };
  }
}

/// The parameters for using a Step Functions state machine as a target.
class PipeTargetStateMachineParameters {
  /// Specify whether to invoke the Step Functions state machine synchronously or
  /// asynchronously.
  ///
  /// <ul>
  /// <li>
  /// <code>REQUEST_RESPONSE</code> (default) - Invoke synchronously. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/step-functions/latest/apireference/API_StartSyncExecution.html">StartSyncExecution</a>
  /// in the <i>Step Functions API Reference</i>.
  /// <note>
  /// <code>REQUEST_RESPONSE</code> is not supported for <code>STANDARD</code>
  /// state machine workflows.
  /// </note> </li>
  /// <li>
  /// <code>FIRE_AND_FORGET</code> - Invoke asynchronously. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/step-functions/latest/apireference/API_StartExecution.html">StartExecution</a>
  /// in the <i>Step Functions API Reference</i>.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-pipes.html#pipes-invocation">Invocation
  /// types</a> in the <i>Amazon EventBridge User Guide</i>.
  final PipeTargetInvocationType? invocationType;

  PipeTargetStateMachineParameters({
    this.invocationType,
  });

  factory PipeTargetStateMachineParameters.fromJson(Map<String, dynamic> json) {
    return PipeTargetStateMachineParameters(
      invocationType:
          (json['InvocationType'] as String?)?.toPipeTargetInvocationType(),
    );
  }

  Map<String, dynamic> toJson() {
    final invocationType = this.invocationType;
    return {
      if (invocationType != null) 'InvocationType': invocationType.toValue(),
    };
  }
}

/// The parameters for using a Timestream for LiveAnalytics table as a target.
class PipeTargetTimestreamParameters {
  /// Map source data to dimensions in the target Timestream for LiveAnalytics
  /// table.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/timestream/latest/developerguide/concepts.html">Amazon
  /// Timestream for LiveAnalytics concepts</a>
  final List<DimensionMapping> dimensionMappings;

  /// Dynamic path to the source data field that represents the time value for
  /// your data.
  final String timeValue;

  /// 64 bit version value or source data field that represents the version value
  /// for your data.
  ///
  /// Write requests with a higher version number will update the existing measure
  /// values of the record and version. In cases where the measure value is the
  /// same, the version will still be updated.
  ///
  /// Default value is 1.
  ///
  /// Timestream for LiveAnalytics does not support updating partial measure
  /// values in a record.
  ///
  /// Write requests for duplicate data with a higher version number will update
  /// the existing measure value and version. In cases where the measure value is
  /// the same, <code>Version</code> will still be updated. Default value is
  /// <code>1</code>.
  /// <note>
  /// <code>Version</code> must be <code>1</code> or greater, or you will receive
  /// a <code>ValidationException</code> error.
  /// </note>
  final String versionValue;

  /// The granularity of the time units used. Default is
  /// <code>MILLISECONDS</code>.
  ///
  /// Required if <code>TimeFieldType</code> is specified as <code>EPOCH</code>.
  final EpochTimeUnit? epochTimeUnit;

  /// Maps multiple measures from the source event to the same record in the
  /// specified Timestream for LiveAnalytics table.
  final List<MultiMeasureMapping>? multiMeasureMappings;

  /// Mappings of single source data fields to individual records in the specified
  /// Timestream for LiveAnalytics table.
  final List<SingleMeasureMapping>? singleMeasureMappings;

  /// The type of time value used.
  ///
  /// The default is <code>EPOCH</code>.
  final TimeFieldType? timeFieldType;

  /// How to format the timestamps. For example,
  /// <code>YYYY-MM-DDThh:mm:ss.sssTZD</code>.
  ///
  /// Required if <code>TimeFieldType</code> is specified as
  /// <code>TIMESTAMP_FORMAT</code>.
  final String? timestampFormat;

  PipeTargetTimestreamParameters({
    required this.dimensionMappings,
    required this.timeValue,
    required this.versionValue,
    this.epochTimeUnit,
    this.multiMeasureMappings,
    this.singleMeasureMappings,
    this.timeFieldType,
    this.timestampFormat,
  });

  factory PipeTargetTimestreamParameters.fromJson(Map<String, dynamic> json) {
    return PipeTargetTimestreamParameters(
      dimensionMappings: (json['DimensionMappings'] as List)
          .whereNotNull()
          .map((e) => DimensionMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
      timeValue: json['TimeValue'] as String,
      versionValue: json['VersionValue'] as String,
      epochTimeUnit: (json['EpochTimeUnit'] as String?)?.toEpochTimeUnit(),
      multiMeasureMappings: (json['MultiMeasureMappings'] as List?)
          ?.whereNotNull()
          .map((e) => MultiMeasureMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
      singleMeasureMappings: (json['SingleMeasureMappings'] as List?)
          ?.whereNotNull()
          .map((e) => SingleMeasureMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
      timeFieldType: (json['TimeFieldType'] as String?)?.toTimeFieldType(),
      timestampFormat: json['TimestampFormat'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dimensionMappings = this.dimensionMappings;
    final timeValue = this.timeValue;
    final versionValue = this.versionValue;
    final epochTimeUnit = this.epochTimeUnit;
    final multiMeasureMappings = this.multiMeasureMappings;
    final singleMeasureMappings = this.singleMeasureMappings;
    final timeFieldType = this.timeFieldType;
    final timestampFormat = this.timestampFormat;
    return {
      'DimensionMappings': dimensionMappings,
      'TimeValue': timeValue,
      'VersionValue': versionValue,
      if (epochTimeUnit != null) 'EpochTimeUnit': epochTimeUnit.toValue(),
      if (multiMeasureMappings != null)
        'MultiMeasureMappings': multiMeasureMappings,
      if (singleMeasureMappings != null)
        'SingleMeasureMappings': singleMeasureMappings,
      if (timeFieldType != null) 'TimeFieldType': timeFieldType.toValue(),
      if (timestampFormat != null) 'TimestampFormat': timestampFormat,
    };
  }
}

/// An object representing a constraint on task placement. To learn more, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-placement-constraints.html">Task
/// Placement Constraints</a> in the Amazon Elastic Container Service Developer
/// Guide.
class PlacementConstraint {
  /// A cluster query language expression to apply to the constraint. You cannot
  /// specify an expression if the constraint type is
  /// <code>distinctInstance</code>. To learn more, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/cluster-query-language.html">Cluster
  /// Query Language</a> in the Amazon Elastic Container Service Developer Guide.
  final String? expression;

  /// The type of constraint. Use distinctInstance to ensure that each task in a
  /// particular group is running on a different container instance. Use memberOf
  /// to restrict the selection to a group of valid candidates.
  final PlacementConstraintType? type;

  PlacementConstraint({
    this.expression,
    this.type,
  });

  factory PlacementConstraint.fromJson(Map<String, dynamic> json) {
    return PlacementConstraint(
      expression: json['expression'] as String?,
      type: (json['type'] as String?)?.toPlacementConstraintType(),
    );
  }

  Map<String, dynamic> toJson() {
    final expression = this.expression;
    final type = this.type;
    return {
      if (expression != null) 'expression': expression,
      if (type != null) 'type': type.toValue(),
    };
  }
}

enum PlacementConstraintType {
  distinctInstance,
  memberOf,
}

extension PlacementConstraintTypeValueExtension on PlacementConstraintType {
  String toValue() {
    switch (this) {
      case PlacementConstraintType.distinctInstance:
        return 'distinctInstance';
      case PlacementConstraintType.memberOf:
        return 'memberOf';
    }
  }
}

extension PlacementConstraintTypeFromString on String {
  PlacementConstraintType toPlacementConstraintType() {
    switch (this) {
      case 'distinctInstance':
        return PlacementConstraintType.distinctInstance;
      case 'memberOf':
        return PlacementConstraintType.memberOf;
    }
    throw Exception('$this is not known in enum PlacementConstraintType');
  }
}

/// The task placement strategy for a task or service. To learn more, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-placement-strategies.html">Task
/// Placement Strategies</a> in the Amazon Elastic Container Service Service
/// Developer Guide.
class PlacementStrategy {
  /// The field to apply the placement strategy against. For the spread placement
  /// strategy, valid values are instanceId (or host, which has the same effect),
  /// or any platform or custom attribute that is applied to a container instance,
  /// such as attribute:ecs.availability-zone. For the binpack placement strategy,
  /// valid values are cpu and memory. For the random placement strategy, this
  /// field is not used.
  final String? field;

  /// The type of placement strategy. The random placement strategy randomly
  /// places tasks on available candidates. The spread placement strategy spreads
  /// placement across available candidates evenly based on the field parameter.
  /// The binpack strategy places tasks on available candidates that have the
  /// least available amount of the resource that is specified with the field
  /// parameter. For example, if you binpack on memory, a task is placed on the
  /// instance with the least amount of remaining memory (but still enough to run
  /// the task).
  final PlacementStrategyType? type;

  PlacementStrategy({
    this.field,
    this.type,
  });

  factory PlacementStrategy.fromJson(Map<String, dynamic> json) {
    return PlacementStrategy(
      field: json['field'] as String?,
      type: (json['type'] as String?)?.toPlacementStrategyType(),
    );
  }

  Map<String, dynamic> toJson() {
    final field = this.field;
    final type = this.type;
    return {
      if (field != null) 'field': field,
      if (type != null) 'type': type.toValue(),
    };
  }
}

enum PlacementStrategyType {
  random,
  spread,
  binpack,
}

extension PlacementStrategyTypeValueExtension on PlacementStrategyType {
  String toValue() {
    switch (this) {
      case PlacementStrategyType.random:
        return 'random';
      case PlacementStrategyType.spread:
        return 'spread';
      case PlacementStrategyType.binpack:
        return 'binpack';
    }
  }
}

extension PlacementStrategyTypeFromString on String {
  PlacementStrategyType toPlacementStrategyType() {
    switch (this) {
      case 'random':
        return PlacementStrategyType.random;
      case 'spread':
        return PlacementStrategyType.spread;
      case 'binpack':
        return PlacementStrategyType.binpack;
    }
    throw Exception('$this is not known in enum PlacementStrategyType');
  }
}

enum PropagateTags {
  taskDefinition,
}

extension PropagateTagsValueExtension on PropagateTags {
  String toValue() {
    switch (this) {
      case PropagateTags.taskDefinition:
        return 'TASK_DEFINITION';
    }
  }
}

extension PropagateTagsFromString on String {
  PropagateTags toPropagateTags() {
    switch (this) {
      case 'TASK_DEFINITION':
        return PropagateTags.taskDefinition;
    }
    throw Exception('$this is not known in enum PropagateTags');
  }
}

enum RequestedPipeState {
  running,
  stopped,
}

extension RequestedPipeStateValueExtension on RequestedPipeState {
  String toValue() {
    switch (this) {
      case RequestedPipeState.running:
        return 'RUNNING';
      case RequestedPipeState.stopped:
        return 'STOPPED';
    }
  }
}

extension RequestedPipeStateFromString on String {
  RequestedPipeState toRequestedPipeState() {
    switch (this) {
      case 'RUNNING':
        return RequestedPipeState.running;
      case 'STOPPED':
        return RequestedPipeState.stopped;
    }
    throw Exception('$this is not known in enum RequestedPipeState');
  }
}

enum RequestedPipeStateDescribeResponse {
  running,
  stopped,
  deleted,
}

extension RequestedPipeStateDescribeResponseValueExtension
    on RequestedPipeStateDescribeResponse {
  String toValue() {
    switch (this) {
      case RequestedPipeStateDescribeResponse.running:
        return 'RUNNING';
      case RequestedPipeStateDescribeResponse.stopped:
        return 'STOPPED';
      case RequestedPipeStateDescribeResponse.deleted:
        return 'DELETED';
    }
  }
}

extension RequestedPipeStateDescribeResponseFromString on String {
  RequestedPipeStateDescribeResponse toRequestedPipeStateDescribeResponse() {
    switch (this) {
      case 'RUNNING':
        return RequestedPipeStateDescribeResponse.running;
      case 'STOPPED':
        return RequestedPipeStateDescribeResponse.stopped;
      case 'DELETED':
        return RequestedPipeStateDescribeResponse.deleted;
    }
    throw Exception(
        '$this is not known in enum RequestedPipeStateDescribeResponse');
  }
}

/// The Amazon S3 logging configuration settings for the pipe.
class S3LogDestination {
  /// The name of the Amazon S3 bucket to which EventBridge delivers the log
  /// records for the pipe.
  final String? bucketName;

  /// The Amazon Web Services account that owns the Amazon S3 bucket to which
  /// EventBridge delivers the log records for the pipe.
  final String? bucketOwner;

  /// The format EventBridge uses for the log records.
  ///
  /// <ul>
  /// <li>
  /// <code>json</code>: JSON
  /// </li>
  /// <li>
  /// <code>plain</code>: Plain text
  /// </li>
  /// <li>
  /// <code>w3c</code>: <a href="https://www.w3.org/TR/WD-logfile">W3C extended
  /// logging file format</a>
  /// </li>
  /// </ul>
  final S3OutputFormat? outputFormat;

  /// The prefix text with which to begin Amazon S3 log object names.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-prefixes.html">Organizing
  /// objects using prefixes</a> in the <i>Amazon Simple Storage Service User
  /// Guide</i>.
  final String? prefix;

  S3LogDestination({
    this.bucketName,
    this.bucketOwner,
    this.outputFormat,
    this.prefix,
  });

  factory S3LogDestination.fromJson(Map<String, dynamic> json) {
    return S3LogDestination(
      bucketName: json['BucketName'] as String?,
      bucketOwner: json['BucketOwner'] as String?,
      outputFormat: (json['OutputFormat'] as String?)?.toS3OutputFormat(),
      prefix: json['Prefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final bucketOwner = this.bucketOwner;
    final outputFormat = this.outputFormat;
    final prefix = this.prefix;
    return {
      if (bucketName != null) 'BucketName': bucketName,
      if (bucketOwner != null) 'BucketOwner': bucketOwner,
      if (outputFormat != null) 'OutputFormat': outputFormat.toValue(),
      if (prefix != null) 'Prefix': prefix,
    };
  }
}

/// The Amazon S3 logging configuration settings for the pipe.
class S3LogDestinationParameters {
  /// Specifies the name of the Amazon S3 bucket to which EventBridge delivers the
  /// log records for the pipe.
  final String bucketName;

  /// Specifies the Amazon Web Services account that owns the Amazon S3 bucket to
  /// which EventBridge delivers the log records for the pipe.
  final String bucketOwner;

  /// How EventBridge should format the log records.
  ///
  /// <ul>
  /// <li>
  /// <code>json</code>: JSON
  /// </li>
  /// <li>
  /// <code>plain</code>: Plain text
  /// </li>
  /// <li>
  /// <code>w3c</code>: <a href="https://www.w3.org/TR/WD-logfile">W3C extended
  /// logging file format</a>
  /// </li>
  /// </ul>
  final S3OutputFormat? outputFormat;

  /// Specifies any prefix text with which to begin Amazon S3 log object names.
  ///
  /// You can use prefixes to organize the data that you store in Amazon S3
  /// buckets. A prefix is a string of characters at the beginning of the object
  /// key name. A prefix can be any length, subject to the maximum length of the
  /// object key name (1,024 bytes). For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-prefixes.html">Organizing
  /// objects using prefixes</a> in the <i>Amazon Simple Storage Service User
  /// Guide</i>.
  final String? prefix;

  S3LogDestinationParameters({
    required this.bucketName,
    required this.bucketOwner,
    this.outputFormat,
    this.prefix,
  });

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final bucketOwner = this.bucketOwner;
    final outputFormat = this.outputFormat;
    final prefix = this.prefix;
    return {
      'BucketName': bucketName,
      'BucketOwner': bucketOwner,
      if (outputFormat != null) 'OutputFormat': outputFormat.toValue(),
      if (prefix != null) 'Prefix': prefix,
    };
  }
}

enum S3OutputFormat {
  json,
  plain,
  w3c,
}

extension S3OutputFormatValueExtension on S3OutputFormat {
  String toValue() {
    switch (this) {
      case S3OutputFormat.json:
        return 'json';
      case S3OutputFormat.plain:
        return 'plain';
      case S3OutputFormat.w3c:
        return 'w3c';
    }
  }
}

extension S3OutputFormatFromString on String {
  S3OutputFormat toS3OutputFormat() {
    switch (this) {
      case 'json':
        return S3OutputFormat.json;
      case 'plain':
        return S3OutputFormat.plain;
      case 'w3c':
        return S3OutputFormat.w3c;
    }
    throw Exception('$this is not known in enum S3OutputFormat');
  }
}

/// Name/Value pair of a parameter to start execution of a SageMaker Model
/// Building Pipeline.
class SageMakerPipelineParameter {
  /// Name of parameter to start execution of a SageMaker Model Building Pipeline.
  final String name;

  /// Value of parameter to start execution of a SageMaker Model Building
  /// Pipeline.
  final String value;

  SageMakerPipelineParameter({
    required this.name,
    required this.value,
  });

  factory SageMakerPipelineParameter.fromJson(Map<String, dynamic> json) {
    return SageMakerPipelineParameter(
      name: json['Name'] as String,
      value: json['Value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      'Name': name,
      'Value': value,
    };
  }
}

/// The Secrets Manager secret that stores your stream credentials.
class SelfManagedKafkaAccessConfigurationCredentials {
  /// The ARN of the Secrets Manager secret.
  final String? basicAuth;

  /// The ARN of the Secrets Manager secret.
  final String? clientCertificateTlsAuth;

  /// The ARN of the Secrets Manager secret.
  final String? saslScram256Auth;

  /// The ARN of the Secrets Manager secret.
  final String? saslScram512Auth;

  SelfManagedKafkaAccessConfigurationCredentials({
    this.basicAuth,
    this.clientCertificateTlsAuth,
    this.saslScram256Auth,
    this.saslScram512Auth,
  });

  factory SelfManagedKafkaAccessConfigurationCredentials.fromJson(
      Map<String, dynamic> json) {
    return SelfManagedKafkaAccessConfigurationCredentials(
      basicAuth: json['BasicAuth'] as String?,
      clientCertificateTlsAuth: json['ClientCertificateTlsAuth'] as String?,
      saslScram256Auth: json['SaslScram256Auth'] as String?,
      saslScram512Auth: json['SaslScram512Auth'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final basicAuth = this.basicAuth;
    final clientCertificateTlsAuth = this.clientCertificateTlsAuth;
    final saslScram256Auth = this.saslScram256Auth;
    final saslScram512Auth = this.saslScram512Auth;
    return {
      if (basicAuth != null) 'BasicAuth': basicAuth,
      if (clientCertificateTlsAuth != null)
        'ClientCertificateTlsAuth': clientCertificateTlsAuth,
      if (saslScram256Auth != null) 'SaslScram256Auth': saslScram256Auth,
      if (saslScram512Auth != null) 'SaslScram512Auth': saslScram512Auth,
    };
  }
}

/// This structure specifies the VPC subnets and security groups for the stream,
/// and whether a public IP address is to be used.
class SelfManagedKafkaAccessConfigurationVpc {
  /// Specifies the security groups associated with the stream. These security
  /// groups must all be in the same VPC. You can specify as many as five security
  /// groups. If you do not specify a security group, the default security group
  /// for the VPC is used.
  final List<String>? securityGroup;

  /// Specifies the subnets associated with the stream. These subnets must all be
  /// in the same VPC. You can specify as many as 16 subnets.
  final List<String>? subnets;

  SelfManagedKafkaAccessConfigurationVpc({
    this.securityGroup,
    this.subnets,
  });

  factory SelfManagedKafkaAccessConfigurationVpc.fromJson(
      Map<String, dynamic> json) {
    return SelfManagedKafkaAccessConfigurationVpc(
      securityGroup: (json['SecurityGroup'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      subnets: (json['Subnets'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final securityGroup = this.securityGroup;
    final subnets = this.subnets;
    return {
      if (securityGroup != null) 'SecurityGroup': securityGroup,
      if (subnets != null) 'Subnets': subnets,
    };
  }
}

enum SelfManagedKafkaStartPosition {
  trimHorizon,
  latest,
}

extension SelfManagedKafkaStartPositionValueExtension
    on SelfManagedKafkaStartPosition {
  String toValue() {
    switch (this) {
      case SelfManagedKafkaStartPosition.trimHorizon:
        return 'TRIM_HORIZON';
      case SelfManagedKafkaStartPosition.latest:
        return 'LATEST';
    }
  }
}

extension SelfManagedKafkaStartPositionFromString on String {
  SelfManagedKafkaStartPosition toSelfManagedKafkaStartPosition() {
    switch (this) {
      case 'TRIM_HORIZON':
        return SelfManagedKafkaStartPosition.trimHorizon;
      case 'LATEST':
        return SelfManagedKafkaStartPosition.latest;
    }
    throw Exception('$this is not known in enum SelfManagedKafkaStartPosition');
  }
}

/// Maps a single source data field to a single record in the specified
/// Timestream for LiveAnalytics table.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/timestream/latest/developerguide/concepts.html">Amazon
/// Timestream for LiveAnalytics concepts</a>
class SingleMeasureMapping {
  /// Target measure name for the measurement attribute in the Timestream table.
  final String measureName;

  /// Dynamic path of the source field to map to the measure in the record.
  final String measureValue;

  /// Data type of the source field.
  final MeasureValueType measureValueType;

  SingleMeasureMapping({
    required this.measureName,
    required this.measureValue,
    required this.measureValueType,
  });

  factory SingleMeasureMapping.fromJson(Map<String, dynamic> json) {
    return SingleMeasureMapping(
      measureName: json['MeasureName'] as String,
      measureValue: json['MeasureValue'] as String,
      measureValueType:
          (json['MeasureValueType'] as String).toMeasureValueType(),
    );
  }

  Map<String, dynamic> toJson() {
    final measureName = this.measureName;
    final measureValue = this.measureValue;
    final measureValueType = this.measureValueType;
    return {
      'MeasureName': measureName,
      'MeasureValue': measureValue,
      'MeasureValueType': measureValueType.toValue(),
    };
  }
}

class StartPipeResponse {
  /// The ARN of the pipe.
  final String? arn;

  /// The time the pipe was created.
  final DateTime? creationTime;

  /// The state the pipe is in.
  final PipeState? currentState;

  /// The state the pipe should be in.
  final RequestedPipeState? desiredState;

  /// When the pipe was last updated, in <a
  /// href="https://www.w3.org/TR/NOTE-datetime">ISO-8601 format</a>
  /// (YYYY-MM-DDThh:mm:ss.sTZD).
  final DateTime? lastModifiedTime;

  /// The name of the pipe.
  final String? name;

  StartPipeResponse({
    this.arn,
    this.creationTime,
    this.currentState,
    this.desiredState,
    this.lastModifiedTime,
    this.name,
  });

  factory StartPipeResponse.fromJson(Map<String, dynamic> json) {
    return StartPipeResponse(
      arn: json['Arn'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      currentState: (json['CurrentState'] as String?)?.toPipeState(),
      desiredState: (json['DesiredState'] as String?)?.toRequestedPipeState(),
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final currentState = this.currentState;
    final desiredState = this.desiredState;
    final lastModifiedTime = this.lastModifiedTime;
    final name = this.name;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (currentState != null) 'CurrentState': currentState.toValue(),
      if (desiredState != null) 'DesiredState': desiredState.toValue(),
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (name != null) 'Name': name,
    };
  }
}

class StopPipeResponse {
  /// The ARN of the pipe.
  final String? arn;

  /// The time the pipe was created.
  final DateTime? creationTime;

  /// The state the pipe is in.
  final PipeState? currentState;

  /// The state the pipe should be in.
  final RequestedPipeState? desiredState;

  /// When the pipe was last updated, in <a
  /// href="https://www.w3.org/TR/NOTE-datetime">ISO-8601 format</a>
  /// (YYYY-MM-DDThh:mm:ss.sTZD).
  final DateTime? lastModifiedTime;

  /// The name of the pipe.
  final String? name;

  StopPipeResponse({
    this.arn,
    this.creationTime,
    this.currentState,
    this.desiredState,
    this.lastModifiedTime,
    this.name,
  });

  factory StopPipeResponse.fromJson(Map<String, dynamic> json) {
    return StopPipeResponse(
      arn: json['Arn'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      currentState: (json['CurrentState'] as String?)?.toPipeState(),
      desiredState: (json['DesiredState'] as String?)?.toRequestedPipeState(),
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final currentState = this.currentState;
    final desiredState = this.desiredState;
    final lastModifiedTime = this.lastModifiedTime;
    final name = this.name;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (currentState != null) 'CurrentState': currentState.toValue(),
      if (desiredState != null) 'DesiredState': desiredState.toValue(),
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (name != null) 'Name': name,
    };
  }
}

/// A key-value pair associated with an Amazon Web Services resource. In
/// EventBridge, rules and event buses support tagging.
class Tag {
  /// A string you can use to assign a value. The combination of tag keys and
  /// values can help you organize and categorize your resources.
  final String key;

  /// The value for the specified tag key.
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

enum TimeFieldType {
  epoch,
  timestampFormat,
}

extension TimeFieldTypeValueExtension on TimeFieldType {
  String toValue() {
    switch (this) {
      case TimeFieldType.epoch:
        return 'EPOCH';
      case TimeFieldType.timestampFormat:
        return 'TIMESTAMP_FORMAT';
    }
  }
}

extension TimeFieldTypeFromString on String {
  TimeFieldType toTimeFieldType() {
    switch (this) {
      case 'EPOCH':
        return TimeFieldType.epoch;
      case 'TIMESTAMP_FORMAT':
        return TimeFieldType.timestampFormat;
    }
    throw Exception('$this is not known in enum TimeFieldType');
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

class UpdatePipeResponse {
  /// The ARN of the pipe.
  final String? arn;

  /// The time the pipe was created.
  final DateTime? creationTime;

  /// The state the pipe is in.
  final PipeState? currentState;

  /// The state the pipe should be in.
  final RequestedPipeState? desiredState;

  /// When the pipe was last updated, in <a
  /// href="https://www.w3.org/TR/NOTE-datetime">ISO-8601 format</a>
  /// (YYYY-MM-DDThh:mm:ss.sTZD).
  final DateTime? lastModifiedTime;

  /// The name of the pipe.
  final String? name;

  UpdatePipeResponse({
    this.arn,
    this.creationTime,
    this.currentState,
    this.desiredState,
    this.lastModifiedTime,
    this.name,
  });

  factory UpdatePipeResponse.fromJson(Map<String, dynamic> json) {
    return UpdatePipeResponse(
      arn: json['Arn'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      currentState: (json['CurrentState'] as String?)?.toPipeState(),
      desiredState: (json['DesiredState'] as String?)?.toRequestedPipeState(),
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final currentState = this.currentState;
    final desiredState = this.desiredState;
    final lastModifiedTime = this.lastModifiedTime;
    final name = this.name;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (currentState != null) 'CurrentState': currentState.toValue(),
      if (desiredState != null) 'DesiredState': desiredState.toValue(),
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (name != null) 'Name': name,
    };
  }
}

/// The parameters for using an Active MQ broker as a source.
class UpdatePipeSourceActiveMQBrokerParameters {
  /// The credentials needed to access the resource.
  final MQBrokerAccessCredentials credentials;

  /// The maximum number of records to include in each batch.
  final int? batchSize;

  /// The maximum length of a time to wait for events.
  final int? maximumBatchingWindowInSeconds;

  UpdatePipeSourceActiveMQBrokerParameters({
    required this.credentials,
    this.batchSize,
    this.maximumBatchingWindowInSeconds,
  });

  Map<String, dynamic> toJson() {
    final credentials = this.credentials;
    final batchSize = this.batchSize;
    final maximumBatchingWindowInSeconds = this.maximumBatchingWindowInSeconds;
    return {
      'Credentials': credentials,
      if (batchSize != null) 'BatchSize': batchSize,
      if (maximumBatchingWindowInSeconds != null)
        'MaximumBatchingWindowInSeconds': maximumBatchingWindowInSeconds,
    };
  }
}

/// The parameters for using a DynamoDB stream as a source.
class UpdatePipeSourceDynamoDBStreamParameters {
  /// The maximum number of records to include in each batch.
  final int? batchSize;

  /// Define the target queue to send dead-letter queue events to.
  final DeadLetterConfig? deadLetterConfig;

  /// The maximum length of a time to wait for events.
  final int? maximumBatchingWindowInSeconds;

  /// (Streams only) Discard records older than the specified age. The default
  /// value is -1, which sets the maximum age to infinite. When the value is set
  /// to infinite, EventBridge never discards old records.
  final int? maximumRecordAgeInSeconds;

  /// (Streams only) Discard records after the specified number of retries. The
  /// default value is -1, which sets the maximum number of retries to infinite.
  /// When MaximumRetryAttempts is infinite, EventBridge retries failed records
  /// until the record expires in the event source.
  final int? maximumRetryAttempts;

  /// (Streams only) Define how to handle item process failures.
  /// <code>AUTOMATIC_BISECT</code> halves each batch and retry each half until
  /// all the records are processed or there is one failed message left in the
  /// batch.
  final OnPartialBatchItemFailureStreams? onPartialBatchItemFailure;

  /// (Streams only) The number of batches to process concurrently from each
  /// shard. The default value is 1.
  final int? parallelizationFactor;

  UpdatePipeSourceDynamoDBStreamParameters({
    this.batchSize,
    this.deadLetterConfig,
    this.maximumBatchingWindowInSeconds,
    this.maximumRecordAgeInSeconds,
    this.maximumRetryAttempts,
    this.onPartialBatchItemFailure,
    this.parallelizationFactor,
  });

  Map<String, dynamic> toJson() {
    final batchSize = this.batchSize;
    final deadLetterConfig = this.deadLetterConfig;
    final maximumBatchingWindowInSeconds = this.maximumBatchingWindowInSeconds;
    final maximumRecordAgeInSeconds = this.maximumRecordAgeInSeconds;
    final maximumRetryAttempts = this.maximumRetryAttempts;
    final onPartialBatchItemFailure = this.onPartialBatchItemFailure;
    final parallelizationFactor = this.parallelizationFactor;
    return {
      if (batchSize != null) 'BatchSize': batchSize,
      if (deadLetterConfig != null) 'DeadLetterConfig': deadLetterConfig,
      if (maximumBatchingWindowInSeconds != null)
        'MaximumBatchingWindowInSeconds': maximumBatchingWindowInSeconds,
      if (maximumRecordAgeInSeconds != null)
        'MaximumRecordAgeInSeconds': maximumRecordAgeInSeconds,
      if (maximumRetryAttempts != null)
        'MaximumRetryAttempts': maximumRetryAttempts,
      if (onPartialBatchItemFailure != null)
        'OnPartialBatchItemFailure': onPartialBatchItemFailure.toValue(),
      if (parallelizationFactor != null)
        'ParallelizationFactor': parallelizationFactor,
    };
  }
}

/// The parameters for using a Kinesis stream as a source.
class UpdatePipeSourceKinesisStreamParameters {
  /// The maximum number of records to include in each batch.
  final int? batchSize;

  /// Define the target queue to send dead-letter queue events to.
  final DeadLetterConfig? deadLetterConfig;

  /// The maximum length of a time to wait for events.
  final int? maximumBatchingWindowInSeconds;

  /// (Streams only) Discard records older than the specified age. The default
  /// value is -1, which sets the maximum age to infinite. When the value is set
  /// to infinite, EventBridge never discards old records.
  final int? maximumRecordAgeInSeconds;

  /// (Streams only) Discard records after the specified number of retries. The
  /// default value is -1, which sets the maximum number of retries to infinite.
  /// When MaximumRetryAttempts is infinite, EventBridge retries failed records
  /// until the record expires in the event source.
  final int? maximumRetryAttempts;

  /// (Streams only) Define how to handle item process failures.
  /// <code>AUTOMATIC_BISECT</code> halves each batch and retry each half until
  /// all the records are processed or there is one failed message left in the
  /// batch.
  final OnPartialBatchItemFailureStreams? onPartialBatchItemFailure;

  /// (Streams only) The number of batches to process concurrently from each
  /// shard. The default value is 1.
  final int? parallelizationFactor;

  UpdatePipeSourceKinesisStreamParameters({
    this.batchSize,
    this.deadLetterConfig,
    this.maximumBatchingWindowInSeconds,
    this.maximumRecordAgeInSeconds,
    this.maximumRetryAttempts,
    this.onPartialBatchItemFailure,
    this.parallelizationFactor,
  });

  Map<String, dynamic> toJson() {
    final batchSize = this.batchSize;
    final deadLetterConfig = this.deadLetterConfig;
    final maximumBatchingWindowInSeconds = this.maximumBatchingWindowInSeconds;
    final maximumRecordAgeInSeconds = this.maximumRecordAgeInSeconds;
    final maximumRetryAttempts = this.maximumRetryAttempts;
    final onPartialBatchItemFailure = this.onPartialBatchItemFailure;
    final parallelizationFactor = this.parallelizationFactor;
    return {
      if (batchSize != null) 'BatchSize': batchSize,
      if (deadLetterConfig != null) 'DeadLetterConfig': deadLetterConfig,
      if (maximumBatchingWindowInSeconds != null)
        'MaximumBatchingWindowInSeconds': maximumBatchingWindowInSeconds,
      if (maximumRecordAgeInSeconds != null)
        'MaximumRecordAgeInSeconds': maximumRecordAgeInSeconds,
      if (maximumRetryAttempts != null)
        'MaximumRetryAttempts': maximumRetryAttempts,
      if (onPartialBatchItemFailure != null)
        'OnPartialBatchItemFailure': onPartialBatchItemFailure.toValue(),
      if (parallelizationFactor != null)
        'ParallelizationFactor': parallelizationFactor,
    };
  }
}

/// The parameters for using an MSK stream as a source.
class UpdatePipeSourceManagedStreamingKafkaParameters {
  /// The maximum number of records to include in each batch.
  final int? batchSize;

  /// The credentials needed to access the resource.
  final MSKAccessCredentials? credentials;

  /// The maximum length of a time to wait for events.
  final int? maximumBatchingWindowInSeconds;

  UpdatePipeSourceManagedStreamingKafkaParameters({
    this.batchSize,
    this.credentials,
    this.maximumBatchingWindowInSeconds,
  });

  Map<String, dynamic> toJson() {
    final batchSize = this.batchSize;
    final credentials = this.credentials;
    final maximumBatchingWindowInSeconds = this.maximumBatchingWindowInSeconds;
    return {
      if (batchSize != null) 'BatchSize': batchSize,
      if (credentials != null) 'Credentials': credentials,
      if (maximumBatchingWindowInSeconds != null)
        'MaximumBatchingWindowInSeconds': maximumBatchingWindowInSeconds,
    };
  }
}

/// The parameters required to set up a source for your pipe.
class UpdatePipeSourceParameters {
  /// The parameters for using an Active MQ broker as a source.
  final UpdatePipeSourceActiveMQBrokerParameters? activeMQBrokerParameters;

  /// The parameters for using a DynamoDB stream as a source.
  final UpdatePipeSourceDynamoDBStreamParameters? dynamoDBStreamParameters;

  /// The collection of event patterns used to filter events.
  ///
  /// To remove a filter, specify a <code>FilterCriteria</code> object with an
  /// empty array of <code>Filter</code> objects.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-and-event-patterns.html">Events
  /// and Event Patterns</a> in the <i>Amazon EventBridge User Guide</i>.
  final FilterCriteria? filterCriteria;

  /// The parameters for using a Kinesis stream as a source.
  final UpdatePipeSourceKinesisStreamParameters? kinesisStreamParameters;

  /// The parameters for using an MSK stream as a source.
  final UpdatePipeSourceManagedStreamingKafkaParameters?
      managedStreamingKafkaParameters;

  /// The parameters for using a Rabbit MQ broker as a source.
  final UpdatePipeSourceRabbitMQBrokerParameters? rabbitMQBrokerParameters;

  /// The parameters for using a self-managed Apache Kafka stream as a source.
  ///
  /// A <i>self managed</i> cluster refers to any Apache Kafka cluster not hosted
  /// by Amazon Web Services. This includes both clusters you manage yourself, as
  /// well as those hosted by a third-party provider, such as <a
  /// href="https://www.confluent.io/">Confluent Cloud</a>, <a
  /// href="https://www.cloudkarafka.com/">CloudKarafka</a>, or <a
  /// href="https://redpanda.com/">Redpanda</a>. For more information, see <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-pipes-kafka.html">Apache
  /// Kafka streams as a source</a> in the <i>Amazon EventBridge User Guide</i>.
  final UpdatePipeSourceSelfManagedKafkaParameters? selfManagedKafkaParameters;

  /// The parameters for using a Amazon SQS stream as a source.
  final UpdatePipeSourceSqsQueueParameters? sqsQueueParameters;

  UpdatePipeSourceParameters({
    this.activeMQBrokerParameters,
    this.dynamoDBStreamParameters,
    this.filterCriteria,
    this.kinesisStreamParameters,
    this.managedStreamingKafkaParameters,
    this.rabbitMQBrokerParameters,
    this.selfManagedKafkaParameters,
    this.sqsQueueParameters,
  });

  Map<String, dynamic> toJson() {
    final activeMQBrokerParameters = this.activeMQBrokerParameters;
    final dynamoDBStreamParameters = this.dynamoDBStreamParameters;
    final filterCriteria = this.filterCriteria;
    final kinesisStreamParameters = this.kinesisStreamParameters;
    final managedStreamingKafkaParameters =
        this.managedStreamingKafkaParameters;
    final rabbitMQBrokerParameters = this.rabbitMQBrokerParameters;
    final selfManagedKafkaParameters = this.selfManagedKafkaParameters;
    final sqsQueueParameters = this.sqsQueueParameters;
    return {
      if (activeMQBrokerParameters != null)
        'ActiveMQBrokerParameters': activeMQBrokerParameters,
      if (dynamoDBStreamParameters != null)
        'DynamoDBStreamParameters': dynamoDBStreamParameters,
      if (filterCriteria != null) 'FilterCriteria': filterCriteria,
      if (kinesisStreamParameters != null)
        'KinesisStreamParameters': kinesisStreamParameters,
      if (managedStreamingKafkaParameters != null)
        'ManagedStreamingKafkaParameters': managedStreamingKafkaParameters,
      if (rabbitMQBrokerParameters != null)
        'RabbitMQBrokerParameters': rabbitMQBrokerParameters,
      if (selfManagedKafkaParameters != null)
        'SelfManagedKafkaParameters': selfManagedKafkaParameters,
      if (sqsQueueParameters != null) 'SqsQueueParameters': sqsQueueParameters,
    };
  }
}

/// The parameters for using a Rabbit MQ broker as a source.
class UpdatePipeSourceRabbitMQBrokerParameters {
  /// The credentials needed to access the resource.
  final MQBrokerAccessCredentials credentials;

  /// The maximum number of records to include in each batch.
  final int? batchSize;

  /// The maximum length of a time to wait for events.
  final int? maximumBatchingWindowInSeconds;

  UpdatePipeSourceRabbitMQBrokerParameters({
    required this.credentials,
    this.batchSize,
    this.maximumBatchingWindowInSeconds,
  });

  Map<String, dynamic> toJson() {
    final credentials = this.credentials;
    final batchSize = this.batchSize;
    final maximumBatchingWindowInSeconds = this.maximumBatchingWindowInSeconds;
    return {
      'Credentials': credentials,
      if (batchSize != null) 'BatchSize': batchSize,
      if (maximumBatchingWindowInSeconds != null)
        'MaximumBatchingWindowInSeconds': maximumBatchingWindowInSeconds,
    };
  }
}

/// The parameters for using a self-managed Apache Kafka stream as a source.
///
/// A <i>self managed</i> cluster refers to any Apache Kafka cluster not hosted
/// by Amazon Web Services. This includes both clusters you manage yourself, as
/// well as those hosted by a third-party provider, such as <a
/// href="https://www.confluent.io/">Confluent Cloud</a>, <a
/// href="https://www.cloudkarafka.com/">CloudKarafka</a>, or <a
/// href="https://redpanda.com/">Redpanda</a>. For more information, see <a
/// href="https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-pipes-kafka.html">Apache
/// Kafka streams as a source</a> in the <i>Amazon EventBridge User Guide</i>.
class UpdatePipeSourceSelfManagedKafkaParameters {
  /// The maximum number of records to include in each batch.
  final int? batchSize;

  /// The credentials needed to access the resource.
  final SelfManagedKafkaAccessConfigurationCredentials? credentials;

  /// The maximum length of a time to wait for events.
  final int? maximumBatchingWindowInSeconds;

  /// The ARN of the Secrets Manager secret used for certification.
  final String? serverRootCaCertificate;

  /// This structure specifies the VPC subnets and security groups for the stream,
  /// and whether a public IP address is to be used.
  final SelfManagedKafkaAccessConfigurationVpc? vpc;

  UpdatePipeSourceSelfManagedKafkaParameters({
    this.batchSize,
    this.credentials,
    this.maximumBatchingWindowInSeconds,
    this.serverRootCaCertificate,
    this.vpc,
  });

  Map<String, dynamic> toJson() {
    final batchSize = this.batchSize;
    final credentials = this.credentials;
    final maximumBatchingWindowInSeconds = this.maximumBatchingWindowInSeconds;
    final serverRootCaCertificate = this.serverRootCaCertificate;
    final vpc = this.vpc;
    return {
      if (batchSize != null) 'BatchSize': batchSize,
      if (credentials != null) 'Credentials': credentials,
      if (maximumBatchingWindowInSeconds != null)
        'MaximumBatchingWindowInSeconds': maximumBatchingWindowInSeconds,
      if (serverRootCaCertificate != null)
        'ServerRootCaCertificate': serverRootCaCertificate,
      if (vpc != null) 'Vpc': vpc,
    };
  }
}

/// The parameters for using a Amazon SQS stream as a source.
class UpdatePipeSourceSqsQueueParameters {
  /// The maximum number of records to include in each batch.
  final int? batchSize;

  /// The maximum length of a time to wait for events.
  final int? maximumBatchingWindowInSeconds;

  UpdatePipeSourceSqsQueueParameters({
    this.batchSize,
    this.maximumBatchingWindowInSeconds,
  });

  Map<String, dynamic> toJson() {
    final batchSize = this.batchSize;
    final maximumBatchingWindowInSeconds = this.maximumBatchingWindowInSeconds;
    return {
      if (batchSize != null) 'BatchSize': batchSize,
      if (maximumBatchingWindowInSeconds != null)
        'MaximumBatchingWindowInSeconds': maximumBatchingWindowInSeconds,
    };
  }
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalException extends _s.GenericAwsException {
  InternalException({String? type, String? message})
      : super(type: type, code: 'InternalException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String? type, String? message})
      : super(type: type, code: 'NotFoundException', message: message);
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
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalException': (type, message) =>
      InternalException(type: type, message: message),
  'NotFoundException': (type, message) =>
      NotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
