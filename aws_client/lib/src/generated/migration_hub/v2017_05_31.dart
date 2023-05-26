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

/// The AWS Migration Hub API methods help to obtain server and application
/// migration status and integrate your resource-specific migration tool by
/// providing a programmatic interface to Migration Hub.
///
/// Remember that you must set your AWS Migration Hub home region before you
/// call any of these APIs, or a <code>HomeRegionNotSetException</code> error
/// will be returned. Also, you must make the API calls while in your home
/// region.
class MigrationHub {
  final _s.JsonProtocol _protocol;
  MigrationHub({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'mgh',
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

  /// Associates a created artifact of an AWS cloud resource, the target
  /// receiving the migration, with the migration task performed by a migration
  /// tool. This API has the following traits:
  ///
  /// <ul>
  /// <li>
  /// Migration tools can call the <code>AssociateCreatedArtifact</code>
  /// operation to indicate which AWS artifact is associated with a migration
  /// task.
  /// </li>
  /// <li>
  /// The created artifact name must be provided in ARN (Amazon Resource Name)
  /// format which will contain information about type and region; for example:
  /// <code>arn:aws:ec2:us-east-1:488216288981:image/ami-6d0ba87b</code>.
  /// </li>
  /// <li>
  /// Examples of the AWS resource behind the created artifact are, AMI's, EC2
  /// instance, or DMS endpoint, etc.
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerError].
  /// May throw [ServiceUnavailableException].
  /// May throw [DryRunOperation].
  /// May throw [UnauthorizedOperation].
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [HomeRegionNotSetException].
  ///
  /// Parameter [createdArtifact] :
  /// An ARN of the AWS resource related to the migration (e.g., AMI, EC2
  /// instance, RDS instance, etc.)
  ///
  /// Parameter [migrationTaskName] :
  /// Unique identifier that references the migration task. <i>Do not store
  /// personal data in this field.</i>
  ///
  /// Parameter [progressUpdateStream] :
  /// The name of the ProgressUpdateStream.
  ///
  /// Parameter [dryRun] :
  /// Optional boolean flag to indicate whether any effect should take place.
  /// Used to test if the caller has permission to make the call.
  Future<void> associateCreatedArtifact({
    required CreatedArtifact createdArtifact,
    required String migrationTaskName,
    required String progressUpdateStream,
    bool? dryRun,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSMigrationHub.AssociateCreatedArtifact'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CreatedArtifact': createdArtifact,
        'MigrationTaskName': migrationTaskName,
        'ProgressUpdateStream': progressUpdateStream,
        if (dryRun != null) 'DryRun': dryRun,
      },
    );
  }

  /// Associates a discovered resource ID from Application Discovery Service
  /// with a migration task.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerError].
  /// May throw [ServiceUnavailableException].
  /// May throw [DryRunOperation].
  /// May throw [UnauthorizedOperation].
  /// May throw [InvalidInputException].
  /// May throw [PolicyErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [HomeRegionNotSetException].
  ///
  /// Parameter [discoveredResource] :
  /// Object representing a Resource.
  ///
  /// Parameter [migrationTaskName] :
  /// The identifier given to the MigrationTask. <i>Do not store personal data
  /// in this field.</i>
  ///
  /// Parameter [progressUpdateStream] :
  /// The name of the ProgressUpdateStream.
  ///
  /// Parameter [dryRun] :
  /// Optional boolean flag to indicate whether any effect should take place.
  /// Used to test if the caller has permission to make the call.
  Future<void> associateDiscoveredResource({
    required DiscoveredResource discoveredResource,
    required String migrationTaskName,
    required String progressUpdateStream,
    bool? dryRun,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSMigrationHub.AssociateDiscoveredResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DiscoveredResource': discoveredResource,
        'MigrationTaskName': migrationTaskName,
        'ProgressUpdateStream': progressUpdateStream,
        if (dryRun != null) 'DryRun': dryRun,
      },
    );
  }

  /// Creates a progress update stream which is an AWS resource used for access
  /// control as well as a namespace for migration task names that is implicitly
  /// linked to your AWS account. It must uniquely identify the migration tool
  /// as it is used for all updates made by the tool; however, it does not need
  /// to be unique for each AWS account because it is scoped to the AWS account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerError].
  /// May throw [ServiceUnavailableException].
  /// May throw [DryRunOperation].
  /// May throw [UnauthorizedOperation].
  /// May throw [InvalidInputException].
  /// May throw [HomeRegionNotSetException].
  ///
  /// Parameter [progressUpdateStreamName] :
  /// The name of the ProgressUpdateStream. <i>Do not store personal data in
  /// this field.</i>
  ///
  /// Parameter [dryRun] :
  /// Optional boolean flag to indicate whether any effect should take place.
  /// Used to test if the caller has permission to make the call.
  Future<void> createProgressUpdateStream({
    required String progressUpdateStreamName,
    bool? dryRun,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSMigrationHub.CreateProgressUpdateStream'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProgressUpdateStreamName': progressUpdateStreamName,
        if (dryRun != null) 'DryRun': dryRun,
      },
    );
  }

  /// Deletes a progress update stream, including all of its tasks, which was
  /// previously created as an AWS resource used for access control. This API
  /// has the following traits:
  ///
  /// <ul>
  /// <li>
  /// The only parameter needed for <code>DeleteProgressUpdateStream</code> is
  /// the stream name (same as a <code>CreateProgressUpdateStream</code> call).
  /// </li>
  /// <li>
  /// The call will return, and a background process will asynchronously delete
  /// the stream and all of its resources (tasks, associated resources, resource
  /// attributes, created artifacts).
  /// </li>
  /// <li>
  /// If the stream takes time to be deleted, it might still show up on a
  /// <code>ListProgressUpdateStreams</code> call.
  /// </li>
  /// <li>
  /// <code>CreateProgressUpdateStream</code>, <code>ImportMigrationTask</code>,
  /// <code>NotifyMigrationTaskState</code>, and all Associate[*] APIs related
  /// to the tasks belonging to the stream will throw "InvalidInputException" if
  /// the stream of the same name is in the process of being deleted.
  /// </li>
  /// <li>
  /// Once the stream and all of its resources are deleted,
  /// <code>CreateProgressUpdateStream</code> for a stream of the same name will
  /// succeed, and that stream will be an entirely new logical resource (without
  /// any resources associated with the old stream).
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerError].
  /// May throw [ServiceUnavailableException].
  /// May throw [DryRunOperation].
  /// May throw [UnauthorizedOperation].
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [HomeRegionNotSetException].
  ///
  /// Parameter [progressUpdateStreamName] :
  /// The name of the ProgressUpdateStream. <i>Do not store personal data in
  /// this field.</i>
  ///
  /// Parameter [dryRun] :
  /// Optional boolean flag to indicate whether any effect should take place.
  /// Used to test if the caller has permission to make the call.
  Future<void> deleteProgressUpdateStream({
    required String progressUpdateStreamName,
    bool? dryRun,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSMigrationHub.DeleteProgressUpdateStream'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProgressUpdateStreamName': progressUpdateStreamName,
        if (dryRun != null) 'DryRun': dryRun,
      },
    );
  }

  /// Gets the migration status of an application.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerError].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidInputException].
  /// May throw [PolicyErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [HomeRegionNotSetException].
  ///
  /// Parameter [applicationId] :
  /// The configurationId in Application Discovery Service that uniquely
  /// identifies the grouped application.
  Future<DescribeApplicationStateResult> describeApplicationState({
    required String applicationId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSMigrationHub.DescribeApplicationState'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationId': applicationId,
      },
    );

    return DescribeApplicationStateResult.fromJson(jsonResponse.body);
  }

  /// Retrieves a list of all attributes associated with a specific migration
  /// task.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerError].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [HomeRegionNotSetException].
  ///
  /// Parameter [migrationTaskName] :
  /// The identifier given to the MigrationTask. <i>Do not store personal data
  /// in this field.</i>
  ///
  /// Parameter [progressUpdateStream] :
  /// The name of the ProgressUpdateStream.
  Future<DescribeMigrationTaskResult> describeMigrationTask({
    required String migrationTaskName,
    required String progressUpdateStream,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSMigrationHub.DescribeMigrationTask'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MigrationTaskName': migrationTaskName,
        'ProgressUpdateStream': progressUpdateStream,
      },
    );

    return DescribeMigrationTaskResult.fromJson(jsonResponse.body);
  }

  /// Disassociates a created artifact of an AWS resource with a migration task
  /// performed by a migration tool that was previously associated. This API has
  /// the following traits:
  ///
  /// <ul>
  /// <li>
  /// A migration user can call the <code>DisassociateCreatedArtifacts</code>
  /// operation to disassociate a created AWS Artifact from a migration task.
  /// </li>
  /// <li>
  /// The created artifact name must be provided in ARN (Amazon Resource Name)
  /// format which will contain information about type and region; for example:
  /// <code>arn:aws:ec2:us-east-1:488216288981:image/ami-6d0ba87b</code>.
  /// </li>
  /// <li>
  /// Examples of the AWS resource behind the created artifact are, AMI's, EC2
  /// instance, or RDS instance, etc.
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerError].
  /// May throw [ServiceUnavailableException].
  /// May throw [DryRunOperation].
  /// May throw [UnauthorizedOperation].
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [HomeRegionNotSetException].
  ///
  /// Parameter [createdArtifactName] :
  /// An ARN of the AWS resource related to the migration (e.g., AMI, EC2
  /// instance, RDS instance, etc.)
  ///
  /// Parameter [migrationTaskName] :
  /// Unique identifier that references the migration task to be disassociated
  /// with the artifact. <i>Do not store personal data in this field.</i>
  ///
  /// Parameter [progressUpdateStream] :
  /// The name of the ProgressUpdateStream.
  ///
  /// Parameter [dryRun] :
  /// Optional boolean flag to indicate whether any effect should take place.
  /// Used to test if the caller has permission to make the call.
  Future<void> disassociateCreatedArtifact({
    required String createdArtifactName,
    required String migrationTaskName,
    required String progressUpdateStream,
    bool? dryRun,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSMigrationHub.DisassociateCreatedArtifact'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CreatedArtifactName': createdArtifactName,
        'MigrationTaskName': migrationTaskName,
        'ProgressUpdateStream': progressUpdateStream,
        if (dryRun != null) 'DryRun': dryRun,
      },
    );
  }

  /// Disassociate an Application Discovery Service discovered resource from a
  /// migration task.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerError].
  /// May throw [ServiceUnavailableException].
  /// May throw [DryRunOperation].
  /// May throw [UnauthorizedOperation].
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [HomeRegionNotSetException].
  ///
  /// Parameter [configurationId] :
  /// ConfigurationId of the Application Discovery Service resource to be
  /// disassociated.
  ///
  /// Parameter [migrationTaskName] :
  /// The identifier given to the MigrationTask. <i>Do not store personal data
  /// in this field.</i>
  ///
  /// Parameter [progressUpdateStream] :
  /// The name of the ProgressUpdateStream.
  ///
  /// Parameter [dryRun] :
  /// Optional boolean flag to indicate whether any effect should take place.
  /// Used to test if the caller has permission to make the call.
  Future<void> disassociateDiscoveredResource({
    required String configurationId,
    required String migrationTaskName,
    required String progressUpdateStream,
    bool? dryRun,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSMigrationHub.DisassociateDiscoveredResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConfigurationId': configurationId,
        'MigrationTaskName': migrationTaskName,
        'ProgressUpdateStream': progressUpdateStream,
        if (dryRun != null) 'DryRun': dryRun,
      },
    );
  }

  /// Registers a new migration task which represents a server, database, etc.,
  /// being migrated to AWS by a migration tool.
  ///
  /// This API is a prerequisite to calling the
  /// <code>NotifyMigrationTaskState</code> API as the migration tool must first
  /// register the migration task with Migration Hub.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerError].
  /// May throw [ServiceUnavailableException].
  /// May throw [DryRunOperation].
  /// May throw [UnauthorizedOperation].
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [HomeRegionNotSetException].
  ///
  /// Parameter [migrationTaskName] :
  /// Unique identifier that references the migration task. <i>Do not store
  /// personal data in this field.</i>
  ///
  /// Parameter [progressUpdateStream] :
  /// The name of the ProgressUpdateStream. &gt;
  ///
  /// Parameter [dryRun] :
  /// Optional boolean flag to indicate whether any effect should take place.
  /// Used to test if the caller has permission to make the call.
  Future<void> importMigrationTask({
    required String migrationTaskName,
    required String progressUpdateStream,
    bool? dryRun,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSMigrationHub.ImportMigrationTask'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MigrationTaskName': migrationTaskName,
        'ProgressUpdateStream': progressUpdateStream,
        if (dryRun != null) 'DryRun': dryRun,
      },
    );
  }

  /// Lists all the migration statuses for your applications. If you use the
  /// optional <code>ApplicationIds</code> parameter, only the migration
  /// statuses for those applications will be returned.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerError].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidInputException].
  /// May throw [HomeRegionNotSetException].
  ///
  /// Parameter [applicationIds] :
  /// The configurationIds from the Application Discovery Service that uniquely
  /// identifies your applications.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to be returned per page.
  ///
  /// Parameter [nextToken] :
  /// If a <code>NextToken</code> was returned by a previous call, there are
  /// more results available. To retrieve the next page of results, make the
  /// call again using the returned token in <code>NextToken</code>.
  Future<ListApplicationStatesResult> listApplicationStates({
    List<String>? applicationIds,
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
      'X-Amz-Target': 'AWSMigrationHub.ListApplicationStates'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (applicationIds != null) 'ApplicationIds': applicationIds,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListApplicationStatesResult.fromJson(jsonResponse.body);
  }

  /// Lists the created artifacts attached to a given migration task in an
  /// update stream. This API has the following traits:
  ///
  /// <ul>
  /// <li>
  /// Gets the list of the created artifacts while migration is taking place.
  /// </li>
  /// <li>
  /// Shows the artifacts created by the migration tool that was associated by
  /// the <code>AssociateCreatedArtifact</code> API.
  /// </li>
  /// <li>
  /// Lists created artifacts in a paginated interface.
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerError].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [HomeRegionNotSetException].
  ///
  /// Parameter [migrationTaskName] :
  /// Unique identifier that references the migration task. <i>Do not store
  /// personal data in this field.</i>
  ///
  /// Parameter [progressUpdateStream] :
  /// The name of the ProgressUpdateStream.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to be returned per page.
  ///
  /// Parameter [nextToken] :
  /// If a <code>NextToken</code> was returned by a previous call, there are
  /// more results available. To retrieve the next page of results, make the
  /// call again using the returned token in <code>NextToken</code>.
  Future<ListCreatedArtifactsResult> listCreatedArtifacts({
    required String migrationTaskName,
    required String progressUpdateStream,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      10,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSMigrationHub.ListCreatedArtifacts'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MigrationTaskName': migrationTaskName,
        'ProgressUpdateStream': progressUpdateStream,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListCreatedArtifactsResult.fromJson(jsonResponse.body);
  }

  /// Lists discovered resources associated with the given
  /// <code>MigrationTask</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerError].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [HomeRegionNotSetException].
  ///
  /// Parameter [migrationTaskName] :
  /// The name of the MigrationTask. <i>Do not store personal data in this
  /// field.</i>
  ///
  /// Parameter [progressUpdateStream] :
  /// The name of the ProgressUpdateStream.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results returned per page.
  ///
  /// Parameter [nextToken] :
  /// If a <code>NextToken</code> was returned by a previous call, there are
  /// more results available. To retrieve the next page of results, make the
  /// call again using the returned token in <code>NextToken</code>.
  Future<ListDiscoveredResourcesResult> listDiscoveredResources({
    required String migrationTaskName,
    required String progressUpdateStream,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      10,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSMigrationHub.ListDiscoveredResources'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MigrationTaskName': migrationTaskName,
        'ProgressUpdateStream': progressUpdateStream,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListDiscoveredResourcesResult.fromJson(jsonResponse.body);
  }

  /// Lists all, or filtered by resource name, migration tasks associated with
  /// the user account making this call. This API has the following traits:
  ///
  /// <ul>
  /// <li>
  /// Can show a summary list of the most recent migration tasks.
  /// </li>
  /// <li>
  /// Can show a summary list of migration tasks associated with a given
  /// discovered resource.
  /// </li>
  /// <li>
  /// Lists migration tasks in a paginated interface.
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerError].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidInputException].
  /// May throw [PolicyErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [HomeRegionNotSetException].
  ///
  /// Parameter [maxResults] :
  /// Value to specify how many results are returned per page.
  ///
  /// Parameter [nextToken] :
  /// If a <code>NextToken</code> was returned by a previous call, there are
  /// more results available. To retrieve the next page of results, make the
  /// call again using the returned token in <code>NextToken</code>.
  ///
  /// Parameter [resourceName] :
  /// Filter migration tasks by discovered resource name.
  Future<ListMigrationTasksResult> listMigrationTasks({
    int? maxResults,
    String? nextToken,
    String? resourceName,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSMigrationHub.ListMigrationTasks'
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
        if (resourceName != null) 'ResourceName': resourceName,
      },
    );

    return ListMigrationTasksResult.fromJson(jsonResponse.body);
  }

  /// Lists progress update streams associated with the user account making this
  /// call.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerError].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidInputException].
  /// May throw [HomeRegionNotSetException].
  ///
  /// Parameter [maxResults] :
  /// Filter to limit the maximum number of results to list per page.
  ///
  /// Parameter [nextToken] :
  /// If a <code>NextToken</code> was returned by a previous call, there are
  /// more results available. To retrieve the next page of results, make the
  /// call again using the returned token in <code>NextToken</code>.
  Future<ListProgressUpdateStreamsResult> listProgressUpdateStreams({
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
      'X-Amz-Target': 'AWSMigrationHub.ListProgressUpdateStreams'
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

    return ListProgressUpdateStreamsResult.fromJson(jsonResponse.body);
  }

  /// Sets the migration state of an application. For a given application
  /// identified by the value passed to <code>ApplicationId</code>, its status
  /// is set or updated by passing one of three values to <code>Status</code>:
  /// <code>NOT_STARTED | IN_PROGRESS | COMPLETED</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerError].
  /// May throw [ServiceUnavailableException].
  /// May throw [DryRunOperation].
  /// May throw [UnauthorizedOperation].
  /// May throw [InvalidInputException].
  /// May throw [PolicyErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [HomeRegionNotSetException].
  ///
  /// Parameter [applicationId] :
  /// The configurationId in Application Discovery Service that uniquely
  /// identifies the grouped application.
  ///
  /// Parameter [status] :
  /// Status of the application - Not Started, In-Progress, Complete.
  ///
  /// Parameter [dryRun] :
  /// Optional boolean flag to indicate whether any effect should take place.
  /// Used to test if the caller has permission to make the call.
  ///
  /// Parameter [updateDateTime] :
  /// The timestamp when the application state changed.
  Future<void> notifyApplicationState({
    required String applicationId,
    required ApplicationStatus status,
    bool? dryRun,
    DateTime? updateDateTime,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSMigrationHub.NotifyApplicationState'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationId': applicationId,
        'Status': status.toValue(),
        if (dryRun != null) 'DryRun': dryRun,
        if (updateDateTime != null)
          'UpdateDateTime': unixTimestampToJson(updateDateTime),
      },
    );
  }

  /// Notifies Migration Hub of the current status, progress, or other detail
  /// regarding a migration task. This API has the following traits:
  ///
  /// <ul>
  /// <li>
  /// Migration tools will call the <code>NotifyMigrationTaskState</code> API to
  /// share the latest progress and status.
  /// </li>
  /// <li>
  /// <code>MigrationTaskName</code> is used for addressing updates to the
  /// correct target.
  /// </li>
  /// <li>
  /// <code>ProgressUpdateStream</code> is used for access control and to
  /// provide a namespace for each migration tool.
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerError].
  /// May throw [ServiceUnavailableException].
  /// May throw [DryRunOperation].
  /// May throw [UnauthorizedOperation].
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [HomeRegionNotSetException].
  ///
  /// Parameter [migrationTaskName] :
  /// Unique identifier that references the migration task. <i>Do not store
  /// personal data in this field.</i>
  ///
  /// Parameter [nextUpdateSeconds] :
  /// Number of seconds after the UpdateDateTime within which the Migration Hub
  /// can expect an update. If Migration Hub does not receive an update within
  /// the specified interval, then the migration task will be considered stale.
  ///
  /// Parameter [progressUpdateStream] :
  /// The name of the ProgressUpdateStream.
  ///
  /// Parameter [task] :
  /// Information about the task's progress and status.
  ///
  /// Parameter [updateDateTime] :
  /// The timestamp when the task was gathered.
  ///
  /// Parameter [dryRun] :
  /// Optional boolean flag to indicate whether any effect should take place.
  /// Used to test if the caller has permission to make the call.
  Future<void> notifyMigrationTaskState({
    required String migrationTaskName,
    required int nextUpdateSeconds,
    required String progressUpdateStream,
    required Task task,
    required DateTime updateDateTime,
    bool? dryRun,
  }) async {
    _s.validateNumRange(
      'nextUpdateSeconds',
      nextUpdateSeconds,
      0,
      1152921504606846976,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSMigrationHub.NotifyMigrationTaskState'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MigrationTaskName': migrationTaskName,
        'NextUpdateSeconds': nextUpdateSeconds,
        'ProgressUpdateStream': progressUpdateStream,
        'Task': task,
        'UpdateDateTime': unixTimestampToJson(updateDateTime),
        if (dryRun != null) 'DryRun': dryRun,
      },
    );
  }

  /// Provides identifying details of the resource being migrated so that it can
  /// be associated in the Application Discovery Service repository. This
  /// association occurs asynchronously after <code>PutResourceAttributes</code>
  /// returns.
  /// <important>
  /// <ul>
  /// <li>
  /// Keep in mind that subsequent calls to PutResourceAttributes will override
  /// previously stored attributes. For example, if it is first called with a
  /// MAC address, but later, it is desired to <i>add</i> an IP address, it will
  /// then be required to call it with <i>both</i> the IP and MAC addresses to
  /// prevent overriding the MAC address.
  /// </li>
  /// <li>
  /// Note the instructions regarding the special use case of the <a
  /// href="https://docs.aws.amazon.com/migrationhub/latest/ug/API_PutResourceAttributes.html#migrationhub-PutResourceAttributes-request-ResourceAttributeList">
  /// <code>ResourceAttributeList</code> </a> parameter when specifying any "VM"
  /// related value.
  /// </li>
  /// </ul> </important> <note>
  /// Because this is an asynchronous call, it will always return 200, whether
  /// an association occurs or not. To confirm if an association was found based
  /// on the provided details, call <code>ListDiscoveredResources</code>.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerError].
  /// May throw [ServiceUnavailableException].
  /// May throw [DryRunOperation].
  /// May throw [UnauthorizedOperation].
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [HomeRegionNotSetException].
  ///
  /// Parameter [migrationTaskName] :
  /// Unique identifier that references the migration task. <i>Do not store
  /// personal data in this field.</i>
  ///
  /// Parameter [progressUpdateStream] :
  /// The name of the ProgressUpdateStream.
  ///
  /// Parameter [resourceAttributeList] :
  /// Information about the resource that is being migrated. This data will be
  /// used to map the task to a resource in the Application Discovery Service
  /// repository.
  /// <note>
  /// Takes the object array of <code>ResourceAttribute</code> where the
  /// <code>Type</code> field is reserved for the following values:
  /// <code>IPV4_ADDRESS | IPV6_ADDRESS | MAC_ADDRESS | FQDN | VM_MANAGER_ID |
  /// VM_MANAGED_OBJECT_REFERENCE | VM_NAME | VM_PATH | BIOS_ID |
  /// MOTHERBOARD_SERIAL_NUMBER</code> where the identifying value can be a
  /// string up to 256 characters.
  /// </note> <important>
  /// <ul>
  /// <li>
  /// If any "VM" related value is set for a <code>ResourceAttribute</code>
  /// object, it is required that <code>VM_MANAGER_ID</code>, as a minimum, is
  /// always set. If <code>VM_MANAGER_ID</code> is not set, then all "VM" fields
  /// will be discarded and "VM" fields will not be used for matching the
  /// migration task to a server in Application Discovery Service repository.
  /// See the <a
  /// href="https://docs.aws.amazon.com/migrationhub/latest/ug/API_PutResourceAttributes.html#API_PutResourceAttributes_Examples">Example</a>
  /// section below for a use case of specifying "VM" related values.
  /// </li>
  /// <li>
  /// If a server you are trying to match has multiple IP or MAC addresses, you
  /// should provide as many as you know in separate type/value pairs passed to
  /// the <code>ResourceAttributeList</code> parameter to maximize the chances
  /// of matching.
  /// </li>
  /// </ul> </important>
  ///
  /// Parameter [dryRun] :
  /// Optional boolean flag to indicate whether any effect should take place.
  /// Used to test if the caller has permission to make the call.
  Future<void> putResourceAttributes({
    required String migrationTaskName,
    required String progressUpdateStream,
    required List<ResourceAttribute> resourceAttributeList,
    bool? dryRun,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSMigrationHub.PutResourceAttributes'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MigrationTaskName': migrationTaskName,
        'ProgressUpdateStream': progressUpdateStream,
        'ResourceAttributeList': resourceAttributeList,
        if (dryRun != null) 'DryRun': dryRun,
      },
    );
  }
}

/// The state of an application discovered through Migration Hub import, the AWS
/// Agentless Discovery Connector, or the AWS Application Discovery Agent.
class ApplicationState {
  /// The configurationId from the Application Discovery Service that uniquely
  /// identifies an application.
  final String? applicationId;

  /// The current status of an application.
  final ApplicationStatus? applicationStatus;

  /// The timestamp when the application status was last updated.
  final DateTime? lastUpdatedTime;

  ApplicationState({
    this.applicationId,
    this.applicationStatus,
    this.lastUpdatedTime,
  });

  factory ApplicationState.fromJson(Map<String, dynamic> json) {
    return ApplicationState(
      applicationId: json['ApplicationId'] as String?,
      applicationStatus:
          (json['ApplicationStatus'] as String?)?.toApplicationStatus(),
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final applicationStatus = this.applicationStatus;
    final lastUpdatedTime = this.lastUpdatedTime;
    return {
      if (applicationId != null) 'ApplicationId': applicationId,
      if (applicationStatus != null)
        'ApplicationStatus': applicationStatus.toValue(),
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
    };
  }
}

enum ApplicationStatus {
  notStarted,
  inProgress,
  completed,
}

extension ApplicationStatusValueExtension on ApplicationStatus {
  String toValue() {
    switch (this) {
      case ApplicationStatus.notStarted:
        return 'NOT_STARTED';
      case ApplicationStatus.inProgress:
        return 'IN_PROGRESS';
      case ApplicationStatus.completed:
        return 'COMPLETED';
    }
  }
}

extension ApplicationStatusFromString on String {
  ApplicationStatus toApplicationStatus() {
    switch (this) {
      case 'NOT_STARTED':
        return ApplicationStatus.notStarted;
      case 'IN_PROGRESS':
        return ApplicationStatus.inProgress;
      case 'COMPLETED':
        return ApplicationStatus.completed;
    }
    throw Exception('$this is not known in enum ApplicationStatus');
  }
}

class AssociateCreatedArtifactResult {
  AssociateCreatedArtifactResult();

  factory AssociateCreatedArtifactResult.fromJson(Map<String, dynamic> _) {
    return AssociateCreatedArtifactResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class AssociateDiscoveredResourceResult {
  AssociateDiscoveredResourceResult();

  factory AssociateDiscoveredResourceResult.fromJson(Map<String, dynamic> _) {
    return AssociateDiscoveredResourceResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CreateProgressUpdateStreamResult {
  CreateProgressUpdateStreamResult();

  factory CreateProgressUpdateStreamResult.fromJson(Map<String, dynamic> _) {
    return CreateProgressUpdateStreamResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An ARN of the AWS cloud resource target receiving the migration (e.g., AMI,
/// EC2 instance, RDS instance, etc.).
class CreatedArtifact {
  /// An ARN that uniquely identifies the result of a migration task.
  final String name;

  /// A description that can be free-form text to record additional detail about
  /// the artifact for clarity or for later reference.
  final String? description;

  CreatedArtifact({
    required this.name,
    this.description,
  });

  factory CreatedArtifact.fromJson(Map<String, dynamic> json) {
    return CreatedArtifact(
      name: json['Name'] as String,
      description: json['Description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final description = this.description;
    return {
      'Name': name,
      if (description != null) 'Description': description,
    };
  }
}

class DeleteProgressUpdateStreamResult {
  DeleteProgressUpdateStreamResult();

  factory DeleteProgressUpdateStreamResult.fromJson(Map<String, dynamic> _) {
    return DeleteProgressUpdateStreamResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeApplicationStateResult {
  /// Status of the application - Not Started, In-Progress, Complete.
  final ApplicationStatus? applicationStatus;

  /// The timestamp when the application status was last updated.
  final DateTime? lastUpdatedTime;

  DescribeApplicationStateResult({
    this.applicationStatus,
    this.lastUpdatedTime,
  });

  factory DescribeApplicationStateResult.fromJson(Map<String, dynamic> json) {
    return DescribeApplicationStateResult(
      applicationStatus:
          (json['ApplicationStatus'] as String?)?.toApplicationStatus(),
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationStatus = this.applicationStatus;
    final lastUpdatedTime = this.lastUpdatedTime;
    return {
      if (applicationStatus != null)
        'ApplicationStatus': applicationStatus.toValue(),
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
    };
  }
}

class DescribeMigrationTaskResult {
  /// Object encapsulating information about the migration task.
  final MigrationTask? migrationTask;

  DescribeMigrationTaskResult({
    this.migrationTask,
  });

  factory DescribeMigrationTaskResult.fromJson(Map<String, dynamic> json) {
    return DescribeMigrationTaskResult(
      migrationTask: json['MigrationTask'] != null
          ? MigrationTask.fromJson(
              json['MigrationTask'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final migrationTask = this.migrationTask;
    return {
      if (migrationTask != null) 'MigrationTask': migrationTask,
    };
  }
}

class DisassociateCreatedArtifactResult {
  DisassociateCreatedArtifactResult();

  factory DisassociateCreatedArtifactResult.fromJson(Map<String, dynamic> _) {
    return DisassociateCreatedArtifactResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociateDiscoveredResourceResult {
  DisassociateDiscoveredResourceResult();

  factory DisassociateDiscoveredResourceResult.fromJson(
      Map<String, dynamic> _) {
    return DisassociateDiscoveredResourceResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Object representing the on-premises resource being migrated.
class DiscoveredResource {
  /// The configurationId in Application Discovery Service that uniquely
  /// identifies the on-premise resource.
  final String configurationId;

  /// A description that can be free-form text to record additional detail about
  /// the discovered resource for clarity or later reference.
  final String? description;

  DiscoveredResource({
    required this.configurationId,
    this.description,
  });

  factory DiscoveredResource.fromJson(Map<String, dynamic> json) {
    return DiscoveredResource(
      configurationId: json['ConfigurationId'] as String,
      description: json['Description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configurationId = this.configurationId;
    final description = this.description;
    return {
      'ConfigurationId': configurationId,
      if (description != null) 'Description': description,
    };
  }
}

class ImportMigrationTaskResult {
  ImportMigrationTaskResult();

  factory ImportMigrationTaskResult.fromJson(Map<String, dynamic> _) {
    return ImportMigrationTaskResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ListApplicationStatesResult {
  /// A list of Applications that exist in Application Discovery Service.
  final List<ApplicationState>? applicationStateList;

  /// If a <code>NextToken</code> was returned by a previous call, there are more
  /// results available. To retrieve the next page of results, make the call again
  /// using the returned token in <code>NextToken</code>.
  final String? nextToken;

  ListApplicationStatesResult({
    this.applicationStateList,
    this.nextToken,
  });

  factory ListApplicationStatesResult.fromJson(Map<String, dynamic> json) {
    return ListApplicationStatesResult(
      applicationStateList: (json['ApplicationStateList'] as List?)
          ?.whereNotNull()
          .map((e) => ApplicationState.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationStateList = this.applicationStateList;
    final nextToken = this.nextToken;
    return {
      if (applicationStateList != null)
        'ApplicationStateList': applicationStateList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListCreatedArtifactsResult {
  /// List of created artifacts up to the maximum number of results specified in
  /// the request.
  final List<CreatedArtifact>? createdArtifactList;

  /// If there are more created artifacts than the max result, return the next
  /// token to be passed to the next call as a bookmark of where to start from.
  final String? nextToken;

  ListCreatedArtifactsResult({
    this.createdArtifactList,
    this.nextToken,
  });

  factory ListCreatedArtifactsResult.fromJson(Map<String, dynamic> json) {
    return ListCreatedArtifactsResult(
      createdArtifactList: (json['CreatedArtifactList'] as List?)
          ?.whereNotNull()
          .map((e) => CreatedArtifact.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdArtifactList = this.createdArtifactList;
    final nextToken = this.nextToken;
    return {
      if (createdArtifactList != null)
        'CreatedArtifactList': createdArtifactList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListDiscoveredResourcesResult {
  /// Returned list of discovered resources associated with the given
  /// MigrationTask.
  final List<DiscoveredResource>? discoveredResourceList;

  /// If there are more discovered resources than the max result, return the next
  /// token to be passed to the next call as a bookmark of where to start from.
  final String? nextToken;

  ListDiscoveredResourcesResult({
    this.discoveredResourceList,
    this.nextToken,
  });

  factory ListDiscoveredResourcesResult.fromJson(Map<String, dynamic> json) {
    return ListDiscoveredResourcesResult(
      discoveredResourceList: (json['DiscoveredResourceList'] as List?)
          ?.whereNotNull()
          .map((e) => DiscoveredResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final discoveredResourceList = this.discoveredResourceList;
    final nextToken = this.nextToken;
    return {
      if (discoveredResourceList != null)
        'DiscoveredResourceList': discoveredResourceList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListMigrationTasksResult {
  /// Lists the migration task's summary which includes:
  /// <code>MigrationTaskName</code>, <code>ProgressPercent</code>,
  /// <code>ProgressUpdateStream</code>, <code>Status</code>, and the
  /// <code>UpdateDateTime</code> for each task.
  final List<MigrationTaskSummary>? migrationTaskSummaryList;

  /// If there are more migration tasks than the max result, return the next token
  /// to be passed to the next call as a bookmark of where to start from.
  final String? nextToken;

  ListMigrationTasksResult({
    this.migrationTaskSummaryList,
    this.nextToken,
  });

  factory ListMigrationTasksResult.fromJson(Map<String, dynamic> json) {
    return ListMigrationTasksResult(
      migrationTaskSummaryList: (json['MigrationTaskSummaryList'] as List?)
          ?.whereNotNull()
          .map((e) => MigrationTaskSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final migrationTaskSummaryList = this.migrationTaskSummaryList;
    final nextToken = this.nextToken;
    return {
      if (migrationTaskSummaryList != null)
        'MigrationTaskSummaryList': migrationTaskSummaryList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListProgressUpdateStreamsResult {
  /// If there are more streams created than the max result, return the next token
  /// to be passed to the next call as a bookmark of where to start from.
  final String? nextToken;

  /// List of progress update streams up to the max number of results passed in
  /// the input.
  final List<ProgressUpdateStreamSummary>? progressUpdateStreamSummaryList;

  ListProgressUpdateStreamsResult({
    this.nextToken,
    this.progressUpdateStreamSummaryList,
  });

  factory ListProgressUpdateStreamsResult.fromJson(Map<String, dynamic> json) {
    return ListProgressUpdateStreamsResult(
      nextToken: json['NextToken'] as String?,
      progressUpdateStreamSummaryList: (json['ProgressUpdateStreamSummaryList']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              ProgressUpdateStreamSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final progressUpdateStreamSummaryList =
        this.progressUpdateStreamSummaryList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (progressUpdateStreamSummaryList != null)
        'ProgressUpdateStreamSummaryList': progressUpdateStreamSummaryList,
    };
  }
}

/// Represents a migration task in a migration tool.
class MigrationTask {
  /// Unique identifier that references the migration task. <i>Do not store
  /// personal data in this field.</i>
  final String? migrationTaskName;

  /// A name that identifies the vendor of the migration tool being used.
  final String? progressUpdateStream;

  /// Information about the resource that is being migrated. This data will be
  /// used to map the task to a resource in the Application Discovery Service
  /// repository.
  final List<ResourceAttribute>? resourceAttributeList;

  /// Task object encapsulating task information.
  final Task? task;

  /// The timestamp when the task was gathered.
  final DateTime? updateDateTime;

  MigrationTask({
    this.migrationTaskName,
    this.progressUpdateStream,
    this.resourceAttributeList,
    this.task,
    this.updateDateTime,
  });

  factory MigrationTask.fromJson(Map<String, dynamic> json) {
    return MigrationTask(
      migrationTaskName: json['MigrationTaskName'] as String?,
      progressUpdateStream: json['ProgressUpdateStream'] as String?,
      resourceAttributeList: (json['ResourceAttributeList'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      task: json['Task'] != null
          ? Task.fromJson(json['Task'] as Map<String, dynamic>)
          : null,
      updateDateTime: timeStampFromJson(json['UpdateDateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final migrationTaskName = this.migrationTaskName;
    final progressUpdateStream = this.progressUpdateStream;
    final resourceAttributeList = this.resourceAttributeList;
    final task = this.task;
    final updateDateTime = this.updateDateTime;
    return {
      if (migrationTaskName != null) 'MigrationTaskName': migrationTaskName,
      if (progressUpdateStream != null)
        'ProgressUpdateStream': progressUpdateStream,
      if (resourceAttributeList != null)
        'ResourceAttributeList': resourceAttributeList,
      if (task != null) 'Task': task,
      if (updateDateTime != null)
        'UpdateDateTime': unixTimestampToJson(updateDateTime),
    };
  }
}

/// MigrationTaskSummary includes <code>MigrationTaskName</code>,
/// <code>ProgressPercent</code>, <code>ProgressUpdateStream</code>,
/// <code>Status</code>, and <code>UpdateDateTime</code> for each task.
class MigrationTaskSummary {
  /// Unique identifier that references the migration task. <i>Do not store
  /// personal data in this field.</i>
  final String? migrationTaskName;

  /// Indication of the percentage completion of the task.
  final int? progressPercent;

  /// An AWS resource used for access control. It should uniquely identify the
  /// migration tool as it is used for all updates made by the tool.
  final String? progressUpdateStream;

  /// Status of the task.
  final Status? status;

  /// Detail information of what is being done within the overall status state.
  final String? statusDetail;

  /// The timestamp when the task was gathered.
  final DateTime? updateDateTime;

  MigrationTaskSummary({
    this.migrationTaskName,
    this.progressPercent,
    this.progressUpdateStream,
    this.status,
    this.statusDetail,
    this.updateDateTime,
  });

  factory MigrationTaskSummary.fromJson(Map<String, dynamic> json) {
    return MigrationTaskSummary(
      migrationTaskName: json['MigrationTaskName'] as String?,
      progressPercent: json['ProgressPercent'] as int?,
      progressUpdateStream: json['ProgressUpdateStream'] as String?,
      status: (json['Status'] as String?)?.toStatus(),
      statusDetail: json['StatusDetail'] as String?,
      updateDateTime: timeStampFromJson(json['UpdateDateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final migrationTaskName = this.migrationTaskName;
    final progressPercent = this.progressPercent;
    final progressUpdateStream = this.progressUpdateStream;
    final status = this.status;
    final statusDetail = this.statusDetail;
    final updateDateTime = this.updateDateTime;
    return {
      if (migrationTaskName != null) 'MigrationTaskName': migrationTaskName,
      if (progressPercent != null) 'ProgressPercent': progressPercent,
      if (progressUpdateStream != null)
        'ProgressUpdateStream': progressUpdateStream,
      if (status != null) 'Status': status.toValue(),
      if (statusDetail != null) 'StatusDetail': statusDetail,
      if (updateDateTime != null)
        'UpdateDateTime': unixTimestampToJson(updateDateTime),
    };
  }
}

class NotifyApplicationStateResult {
  NotifyApplicationStateResult();

  factory NotifyApplicationStateResult.fromJson(Map<String, dynamic> _) {
    return NotifyApplicationStateResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class NotifyMigrationTaskStateResult {
  NotifyMigrationTaskStateResult();

  factory NotifyMigrationTaskStateResult.fromJson(Map<String, dynamic> _) {
    return NotifyMigrationTaskStateResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Summary of the AWS resource used for access control that is implicitly
/// linked to your AWS account.
class ProgressUpdateStreamSummary {
  /// The name of the ProgressUpdateStream. <i>Do not store personal data in this
  /// field.</i>
  final String? progressUpdateStreamName;

  ProgressUpdateStreamSummary({
    this.progressUpdateStreamName,
  });

  factory ProgressUpdateStreamSummary.fromJson(Map<String, dynamic> json) {
    return ProgressUpdateStreamSummary(
      progressUpdateStreamName: json['ProgressUpdateStreamName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final progressUpdateStreamName = this.progressUpdateStreamName;
    return {
      if (progressUpdateStreamName != null)
        'ProgressUpdateStreamName': progressUpdateStreamName,
    };
  }
}

class PutResourceAttributesResult {
  PutResourceAttributesResult();

  factory PutResourceAttributesResult.fromJson(Map<String, dynamic> _) {
    return PutResourceAttributesResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Attribute associated with a resource.
///
/// Note the corresponding format required per type listed below:
/// <dl> <dt>IPV4</dt> <dd>
/// <code>x.x.x.x</code>
///
/// <i>where x is an integer in the range [0,255]</i>
/// </dd> <dt>IPV6</dt> <dd>
/// <code>y : y : y : y : y : y : y : y</code>
///
/// <i>where y is a hexadecimal between 0 and FFFF. [0, FFFF]</i>
/// </dd> <dt>MAC_ADDRESS</dt> <dd>
/// <code>^([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})$</code>
/// </dd> <dt>FQDN</dt> <dd>
/// <code>^[^&lt;&gt;{}\\\\/?,=\\p{Cntrl}]{1,256}$</code>
/// </dd> </dl>
class ResourceAttribute {
  /// Type of resource.
  final ResourceAttributeType type;

  /// Value of the resource type.
  final String value;

  ResourceAttribute({
    required this.type,
    required this.value,
  });

  factory ResourceAttribute.fromJson(Map<String, dynamic> json) {
    return ResourceAttribute(
      type: (json['Type'] as String).toResourceAttributeType(),
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

enum ResourceAttributeType {
  ipv4Address,
  ipv6Address,
  macAddress,
  fqdn,
  vmManagerId,
  vmManagedObjectReference,
  vmName,
  vmPath,
  biosId,
  motherboardSerialNumber,
}

extension ResourceAttributeTypeValueExtension on ResourceAttributeType {
  String toValue() {
    switch (this) {
      case ResourceAttributeType.ipv4Address:
        return 'IPV4_ADDRESS';
      case ResourceAttributeType.ipv6Address:
        return 'IPV6_ADDRESS';
      case ResourceAttributeType.macAddress:
        return 'MAC_ADDRESS';
      case ResourceAttributeType.fqdn:
        return 'FQDN';
      case ResourceAttributeType.vmManagerId:
        return 'VM_MANAGER_ID';
      case ResourceAttributeType.vmManagedObjectReference:
        return 'VM_MANAGED_OBJECT_REFERENCE';
      case ResourceAttributeType.vmName:
        return 'VM_NAME';
      case ResourceAttributeType.vmPath:
        return 'VM_PATH';
      case ResourceAttributeType.biosId:
        return 'BIOS_ID';
      case ResourceAttributeType.motherboardSerialNumber:
        return 'MOTHERBOARD_SERIAL_NUMBER';
    }
  }
}

extension ResourceAttributeTypeFromString on String {
  ResourceAttributeType toResourceAttributeType() {
    switch (this) {
      case 'IPV4_ADDRESS':
        return ResourceAttributeType.ipv4Address;
      case 'IPV6_ADDRESS':
        return ResourceAttributeType.ipv6Address;
      case 'MAC_ADDRESS':
        return ResourceAttributeType.macAddress;
      case 'FQDN':
        return ResourceAttributeType.fqdn;
      case 'VM_MANAGER_ID':
        return ResourceAttributeType.vmManagerId;
      case 'VM_MANAGED_OBJECT_REFERENCE':
        return ResourceAttributeType.vmManagedObjectReference;
      case 'VM_NAME':
        return ResourceAttributeType.vmName;
      case 'VM_PATH':
        return ResourceAttributeType.vmPath;
      case 'BIOS_ID':
        return ResourceAttributeType.biosId;
      case 'MOTHERBOARD_SERIAL_NUMBER':
        return ResourceAttributeType.motherboardSerialNumber;
    }
    throw Exception('$this is not known in enum ResourceAttributeType');
  }
}

enum Status {
  notStarted,
  inProgress,
  failed,
  completed,
}

extension StatusValueExtension on Status {
  String toValue() {
    switch (this) {
      case Status.notStarted:
        return 'NOT_STARTED';
      case Status.inProgress:
        return 'IN_PROGRESS';
      case Status.failed:
        return 'FAILED';
      case Status.completed:
        return 'COMPLETED';
    }
  }
}

extension StatusFromString on String {
  Status toStatus() {
    switch (this) {
      case 'NOT_STARTED':
        return Status.notStarted;
      case 'IN_PROGRESS':
        return Status.inProgress;
      case 'FAILED':
        return Status.failed;
      case 'COMPLETED':
        return Status.completed;
    }
    throw Exception('$this is not known in enum Status');
  }
}

/// Task object encapsulating task information.
class Task {
  /// Status of the task - Not Started, In-Progress, Complete.
  final Status status;

  /// Indication of the percentage completion of the task.
  final int? progressPercent;

  /// Details of task status as notified by a migration tool. A tool might use
  /// this field to provide clarifying information about the status that is unique
  /// to that tool or that explains an error state.
  final String? statusDetail;

  Task({
    required this.status,
    this.progressPercent,
    this.statusDetail,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      status: (json['Status'] as String).toStatus(),
      progressPercent: json['ProgressPercent'] as int?,
      statusDetail: json['StatusDetail'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final progressPercent = this.progressPercent;
    final statusDetail = this.statusDetail;
    return {
      'Status': status.toValue(),
      if (progressPercent != null) 'ProgressPercent': progressPercent,
      if (statusDetail != null) 'StatusDetail': statusDetail,
    };
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class DryRunOperation extends _s.GenericAwsException {
  DryRunOperation({String? type, String? message})
      : super(type: type, code: 'DryRunOperation', message: message);
}

class HomeRegionNotSetException extends _s.GenericAwsException {
  HomeRegionNotSetException({String? type, String? message})
      : super(type: type, code: 'HomeRegionNotSetException', message: message);
}

class InternalServerError extends _s.GenericAwsException {
  InternalServerError({String? type, String? message})
      : super(type: type, code: 'InternalServerError', message: message);
}

class InvalidInputException extends _s.GenericAwsException {
  InvalidInputException({String? type, String? message})
      : super(type: type, code: 'InvalidInputException', message: message);
}

class PolicyErrorException extends _s.GenericAwsException {
  PolicyErrorException({String? type, String? message})
      : super(type: type, code: 'PolicyErrorException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class UnauthorizedOperation extends _s.GenericAwsException {
  UnauthorizedOperation({String? type, String? message})
      : super(type: type, code: 'UnauthorizedOperation', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'DryRunOperation': (type, message) =>
      DryRunOperation(type: type, message: message),
  'HomeRegionNotSetException': (type, message) =>
      HomeRegionNotSetException(type: type, message: message),
  'InternalServerError': (type, message) =>
      InternalServerError(type: type, message: message),
  'InvalidInputException': (type, message) =>
      InvalidInputException(type: type, message: message),
  'PolicyErrorException': (type, message) =>
      PolicyErrorException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'UnauthorizedOperation': (type, message) =>
      UnauthorizedOperation(type: type, message: message),
};
