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

part '2017-05-31.g.dart';

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
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'mgh',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

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
    @_s.required CreatedArtifact createdArtifact,
    @_s.required String migrationTaskName,
    @_s.required String progressUpdateStream,
    bool dryRun,
  }) async {
    ArgumentError.checkNotNull(createdArtifact, 'createdArtifact');
    ArgumentError.checkNotNull(migrationTaskName, 'migrationTaskName');
    _s.validateStringLength(
      'migrationTaskName',
      migrationTaskName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'migrationTaskName',
      migrationTaskName,
      r'''[^:|]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(progressUpdateStream, 'progressUpdateStream');
    _s.validateStringLength(
      'progressUpdateStream',
      progressUpdateStream,
      1,
      50,
      isRequired: true,
    );
    _s.validateStringPattern(
      'progressUpdateStream',
      progressUpdateStream,
      r'''[^/:|\000-\037]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSMigrationHub.AssociateCreatedArtifact'
    };
    final jsonResponse = await _protocol.send(
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

    return AssociateCreatedArtifactResult.fromJson(jsonResponse.body);
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
    @_s.required DiscoveredResource discoveredResource,
    @_s.required String migrationTaskName,
    @_s.required String progressUpdateStream,
    bool dryRun,
  }) async {
    ArgumentError.checkNotNull(discoveredResource, 'discoveredResource');
    ArgumentError.checkNotNull(migrationTaskName, 'migrationTaskName');
    _s.validateStringLength(
      'migrationTaskName',
      migrationTaskName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'migrationTaskName',
      migrationTaskName,
      r'''[^:|]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(progressUpdateStream, 'progressUpdateStream');
    _s.validateStringLength(
      'progressUpdateStream',
      progressUpdateStream,
      1,
      50,
      isRequired: true,
    );
    _s.validateStringPattern(
      'progressUpdateStream',
      progressUpdateStream,
      r'''[^/:|\000-\037]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSMigrationHub.AssociateDiscoveredResource'
    };
    final jsonResponse = await _protocol.send(
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

    return AssociateDiscoveredResourceResult.fromJson(jsonResponse.body);
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
    @_s.required String progressUpdateStreamName,
    bool dryRun,
  }) async {
    ArgumentError.checkNotNull(
        progressUpdateStreamName, 'progressUpdateStreamName');
    _s.validateStringLength(
      'progressUpdateStreamName',
      progressUpdateStreamName,
      1,
      50,
      isRequired: true,
    );
    _s.validateStringPattern(
      'progressUpdateStreamName',
      progressUpdateStreamName,
      r'''[^/:|\000-\037]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSMigrationHub.CreateProgressUpdateStream'
    };
    final jsonResponse = await _protocol.send(
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

    return CreateProgressUpdateStreamResult.fromJson(jsonResponse.body);
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
    @_s.required String progressUpdateStreamName,
    bool dryRun,
  }) async {
    ArgumentError.checkNotNull(
        progressUpdateStreamName, 'progressUpdateStreamName');
    _s.validateStringLength(
      'progressUpdateStreamName',
      progressUpdateStreamName,
      1,
      50,
      isRequired: true,
    );
    _s.validateStringPattern(
      'progressUpdateStreamName',
      progressUpdateStreamName,
      r'''[^/:|\000-\037]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSMigrationHub.DeleteProgressUpdateStream'
    };
    final jsonResponse = await _protocol.send(
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

    return DeleteProgressUpdateStreamResult.fromJson(jsonResponse.body);
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
    @_s.required String applicationId,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    _s.validateStringLength(
      'applicationId',
      applicationId,
      1,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'applicationId',
      applicationId,
      r'''^.{1,1600}$''',
      isRequired: true,
    );
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
    @_s.required String migrationTaskName,
    @_s.required String progressUpdateStream,
  }) async {
    ArgumentError.checkNotNull(migrationTaskName, 'migrationTaskName');
    _s.validateStringLength(
      'migrationTaskName',
      migrationTaskName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'migrationTaskName',
      migrationTaskName,
      r'''[^:|]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(progressUpdateStream, 'progressUpdateStream');
    _s.validateStringLength(
      'progressUpdateStream',
      progressUpdateStream,
      1,
      50,
      isRequired: true,
    );
    _s.validateStringPattern(
      'progressUpdateStream',
      progressUpdateStream,
      r'''[^/:|\000-\037]+''',
      isRequired: true,
    );
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
    @_s.required String createdArtifactName,
    @_s.required String migrationTaskName,
    @_s.required String progressUpdateStream,
    bool dryRun,
  }) async {
    ArgumentError.checkNotNull(createdArtifactName, 'createdArtifactName');
    _s.validateStringLength(
      'createdArtifactName',
      createdArtifactName,
      1,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'createdArtifactName',
      createdArtifactName,
      r'''arn:[a-z-]+:[a-z0-9-]+:(?:[a-z0-9-]+|):(?:[0-9]{12}|):.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(migrationTaskName, 'migrationTaskName');
    _s.validateStringLength(
      'migrationTaskName',
      migrationTaskName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'migrationTaskName',
      migrationTaskName,
      r'''[^:|]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(progressUpdateStream, 'progressUpdateStream');
    _s.validateStringLength(
      'progressUpdateStream',
      progressUpdateStream,
      1,
      50,
      isRequired: true,
    );
    _s.validateStringPattern(
      'progressUpdateStream',
      progressUpdateStream,
      r'''[^/:|\000-\037]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSMigrationHub.DisassociateCreatedArtifact'
    };
    final jsonResponse = await _protocol.send(
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

    return DisassociateCreatedArtifactResult.fromJson(jsonResponse.body);
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
    @_s.required String configurationId,
    @_s.required String migrationTaskName,
    @_s.required String progressUpdateStream,
    bool dryRun,
  }) async {
    ArgumentError.checkNotNull(configurationId, 'configurationId');
    _s.validateStringLength(
      'configurationId',
      configurationId,
      1,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'configurationId',
      configurationId,
      r'''^.{1,1600}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(migrationTaskName, 'migrationTaskName');
    _s.validateStringLength(
      'migrationTaskName',
      migrationTaskName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'migrationTaskName',
      migrationTaskName,
      r'''[^:|]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(progressUpdateStream, 'progressUpdateStream');
    _s.validateStringLength(
      'progressUpdateStream',
      progressUpdateStream,
      1,
      50,
      isRequired: true,
    );
    _s.validateStringPattern(
      'progressUpdateStream',
      progressUpdateStream,
      r'''[^/:|\000-\037]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSMigrationHub.DisassociateDiscoveredResource'
    };
    final jsonResponse = await _protocol.send(
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

    return DisassociateDiscoveredResourceResult.fromJson(jsonResponse.body);
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
    @_s.required String migrationTaskName,
    @_s.required String progressUpdateStream,
    bool dryRun,
  }) async {
    ArgumentError.checkNotNull(migrationTaskName, 'migrationTaskName');
    _s.validateStringLength(
      'migrationTaskName',
      migrationTaskName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'migrationTaskName',
      migrationTaskName,
      r'''[^:|]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(progressUpdateStream, 'progressUpdateStream');
    _s.validateStringLength(
      'progressUpdateStream',
      progressUpdateStream,
      1,
      50,
      isRequired: true,
    );
    _s.validateStringPattern(
      'progressUpdateStream',
      progressUpdateStream,
      r'''[^/:|\000-\037]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSMigrationHub.ImportMigrationTask'
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
        if (dryRun != null) 'DryRun': dryRun,
      },
    );

    return ImportMigrationTaskResult.fromJson(jsonResponse.body);
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
    List<String> applicationIds,
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
    @_s.required String migrationTaskName,
    @_s.required String progressUpdateStream,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(migrationTaskName, 'migrationTaskName');
    _s.validateStringLength(
      'migrationTaskName',
      migrationTaskName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'migrationTaskName',
      migrationTaskName,
      r'''[^:|]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(progressUpdateStream, 'progressUpdateStream');
    _s.validateStringLength(
      'progressUpdateStream',
      progressUpdateStream,
      1,
      50,
      isRequired: true,
    );
    _s.validateStringPattern(
      'progressUpdateStream',
      progressUpdateStream,
      r'''[^/:|\000-\037]+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      10,
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
    @_s.required String migrationTaskName,
    @_s.required String progressUpdateStream,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(migrationTaskName, 'migrationTaskName');
    _s.validateStringLength(
      'migrationTaskName',
      migrationTaskName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'migrationTaskName',
      migrationTaskName,
      r'''[^:|]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(progressUpdateStream, 'progressUpdateStream');
    _s.validateStringLength(
      'progressUpdateStream',
      progressUpdateStream,
      1,
      50,
      isRequired: true,
    );
    _s.validateStringPattern(
      'progressUpdateStream',
      progressUpdateStream,
      r'''[^/:|\000-\037]+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      10,
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
    int maxResults,
    String nextToken,
    String resourceName,
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
    _s.validateStringLength(
      'resourceName',
      resourceName,
      1,
      1600,
    );
    _s.validateStringPattern(
      'resourceName',
      resourceName,
      r'''^.{1,1600}$''',
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
    @_s.required String applicationId,
    @_s.required ApplicationStatus status,
    bool dryRun,
    DateTime updateDateTime,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    _s.validateStringLength(
      'applicationId',
      applicationId,
      1,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'applicationId',
      applicationId,
      r'''^.{1,1600}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(status, 'status');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSMigrationHub.NotifyApplicationState'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationId': applicationId,
        'Status': status?.toValue() ?? '',
        if (dryRun != null) 'DryRun': dryRun,
        if (updateDateTime != null)
          'UpdateDateTime': unixTimestampToJson(updateDateTime),
      },
    );

    return NotifyApplicationStateResult.fromJson(jsonResponse.body);
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
    @_s.required String migrationTaskName,
    @_s.required int nextUpdateSeconds,
    @_s.required String progressUpdateStream,
    @_s.required Task task,
    @_s.required DateTime updateDateTime,
    bool dryRun,
  }) async {
    ArgumentError.checkNotNull(migrationTaskName, 'migrationTaskName');
    _s.validateStringLength(
      'migrationTaskName',
      migrationTaskName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'migrationTaskName',
      migrationTaskName,
      r'''[^:|]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(nextUpdateSeconds, 'nextUpdateSeconds');
    _s.validateNumRange(
      'nextUpdateSeconds',
      nextUpdateSeconds,
      0,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(progressUpdateStream, 'progressUpdateStream');
    _s.validateStringLength(
      'progressUpdateStream',
      progressUpdateStream,
      1,
      50,
      isRequired: true,
    );
    _s.validateStringPattern(
      'progressUpdateStream',
      progressUpdateStream,
      r'''[^/:|\000-\037]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(task, 'task');
    ArgumentError.checkNotNull(updateDateTime, 'updateDateTime');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSMigrationHub.NotifyMigrationTaskState'
    };
    final jsonResponse = await _protocol.send(
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

    return NotifyMigrationTaskStateResult.fromJson(jsonResponse.body);
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
    @_s.required String migrationTaskName,
    @_s.required String progressUpdateStream,
    @_s.required List<ResourceAttribute> resourceAttributeList,
    bool dryRun,
  }) async {
    ArgumentError.checkNotNull(migrationTaskName, 'migrationTaskName');
    _s.validateStringLength(
      'migrationTaskName',
      migrationTaskName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'migrationTaskName',
      migrationTaskName,
      r'''[^:|]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(progressUpdateStream, 'progressUpdateStream');
    _s.validateStringLength(
      'progressUpdateStream',
      progressUpdateStream,
      1,
      50,
      isRequired: true,
    );
    _s.validateStringPattern(
      'progressUpdateStream',
      progressUpdateStream,
      r'''[^/:|\000-\037]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceAttributeList, 'resourceAttributeList');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSMigrationHub.PutResourceAttributes'
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
        'ResourceAttributeList': resourceAttributeList,
        if (dryRun != null) 'DryRun': dryRun,
      },
    );

    return PutResourceAttributesResult.fromJson(jsonResponse.body);
  }
}

/// The state of an application discovered through Migration Hub import, the AWS
/// Agentless Discovery Connector, or the AWS Application Discovery Agent.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ApplicationState {
  /// The configurationId from the Application Discovery Service that uniquely
  /// identifies an application.
  @_s.JsonKey(name: 'ApplicationId')
  final String applicationId;

  /// The current status of an application.
  @_s.JsonKey(name: 'ApplicationStatus')
  final ApplicationStatus applicationStatus;

  /// The timestamp when the application status was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedTime')
  final DateTime lastUpdatedTime;

  ApplicationState({
    this.applicationId,
    this.applicationStatus,
    this.lastUpdatedTime,
  });
  factory ApplicationState.fromJson(Map<String, dynamic> json) =>
      _$ApplicationStateFromJson(json);
}

enum ApplicationStatus {
  @_s.JsonValue('NOT_STARTED')
  notStarted,
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('COMPLETED')
  completed,
}

extension on ApplicationStatus {
  String toValue() {
    switch (this) {
      case ApplicationStatus.notStarted:
        return 'NOT_STARTED';
      case ApplicationStatus.inProgress:
        return 'IN_PROGRESS';
      case ApplicationStatus.completed:
        return 'COMPLETED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateCreatedArtifactResult {
  AssociateCreatedArtifactResult();
  factory AssociateCreatedArtifactResult.fromJson(Map<String, dynamic> json) =>
      _$AssociateCreatedArtifactResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateDiscoveredResourceResult {
  AssociateDiscoveredResourceResult();
  factory AssociateDiscoveredResourceResult.fromJson(
          Map<String, dynamic> json) =>
      _$AssociateDiscoveredResourceResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateProgressUpdateStreamResult {
  CreateProgressUpdateStreamResult();
  factory CreateProgressUpdateStreamResult.fromJson(
          Map<String, dynamic> json) =>
      _$CreateProgressUpdateStreamResultFromJson(json);
}

/// An ARN of the AWS cloud resource target receiving the migration (e.g., AMI,
/// EC2 instance, RDS instance, etc.).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CreatedArtifact {
  /// An ARN that uniquely identifies the result of a migration task.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// A description that can be free-form text to record additional detail about
  /// the artifact for clarity or for later reference.
  @_s.JsonKey(name: 'Description')
  final String description;

  CreatedArtifact({
    @_s.required this.name,
    this.description,
  });
  factory CreatedArtifact.fromJson(Map<String, dynamic> json) =>
      _$CreatedArtifactFromJson(json);

  Map<String, dynamic> toJson() => _$CreatedArtifactToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteProgressUpdateStreamResult {
  DeleteProgressUpdateStreamResult();
  factory DeleteProgressUpdateStreamResult.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteProgressUpdateStreamResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeApplicationStateResult {
  /// Status of the application - Not Started, In-Progress, Complete.
  @_s.JsonKey(name: 'ApplicationStatus')
  final ApplicationStatus applicationStatus;

  /// The timestamp when the application status was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedTime')
  final DateTime lastUpdatedTime;

  DescribeApplicationStateResult({
    this.applicationStatus,
    this.lastUpdatedTime,
  });
  factory DescribeApplicationStateResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeApplicationStateResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeMigrationTaskResult {
  /// Object encapsulating information about the migration task.
  @_s.JsonKey(name: 'MigrationTask')
  final MigrationTask migrationTask;

  DescribeMigrationTaskResult({
    this.migrationTask,
  });
  factory DescribeMigrationTaskResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeMigrationTaskResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateCreatedArtifactResult {
  DisassociateCreatedArtifactResult();
  factory DisassociateCreatedArtifactResult.fromJson(
          Map<String, dynamic> json) =>
      _$DisassociateCreatedArtifactResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateDiscoveredResourceResult {
  DisassociateDiscoveredResourceResult();
  factory DisassociateDiscoveredResourceResult.fromJson(
          Map<String, dynamic> json) =>
      _$DisassociateDiscoveredResourceResultFromJson(json);
}

/// Object representing the on-premises resource being migrated.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DiscoveredResource {
  /// The configurationId in Application Discovery Service that uniquely
  /// identifies the on-premise resource.
  @_s.JsonKey(name: 'ConfigurationId')
  final String configurationId;

  /// A description that can be free-form text to record additional detail about
  /// the discovered resource for clarity or later reference.
  @_s.JsonKey(name: 'Description')
  final String description;

  DiscoveredResource({
    @_s.required this.configurationId,
    this.description,
  });
  factory DiscoveredResource.fromJson(Map<String, dynamic> json) =>
      _$DiscoveredResourceFromJson(json);

  Map<String, dynamic> toJson() => _$DiscoveredResourceToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ImportMigrationTaskResult {
  ImportMigrationTaskResult();
  factory ImportMigrationTaskResult.fromJson(Map<String, dynamic> json) =>
      _$ImportMigrationTaskResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListApplicationStatesResult {
  /// A list of Applications that exist in Application Discovery Service.
  @_s.JsonKey(name: 'ApplicationStateList')
  final List<ApplicationState> applicationStateList;

  /// If a <code>NextToken</code> was returned by a previous call, there are more
  /// results available. To retrieve the next page of results, make the call again
  /// using the returned token in <code>NextToken</code>.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListApplicationStatesResult({
    this.applicationStateList,
    this.nextToken,
  });
  factory ListApplicationStatesResult.fromJson(Map<String, dynamic> json) =>
      _$ListApplicationStatesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListCreatedArtifactsResult {
  /// List of created artifacts up to the maximum number of results specified in
  /// the request.
  @_s.JsonKey(name: 'CreatedArtifactList')
  final List<CreatedArtifact> createdArtifactList;

  /// If there are more created artifacts than the max result, return the next
  /// token to be passed to the next call as a bookmark of where to start from.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListCreatedArtifactsResult({
    this.createdArtifactList,
    this.nextToken,
  });
  factory ListCreatedArtifactsResult.fromJson(Map<String, dynamic> json) =>
      _$ListCreatedArtifactsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDiscoveredResourcesResult {
  /// Returned list of discovered resources associated with the given
  /// MigrationTask.
  @_s.JsonKey(name: 'DiscoveredResourceList')
  final List<DiscoveredResource> discoveredResourceList;

  /// If there are more discovered resources than the max result, return the next
  /// token to be passed to the next call as a bookmark of where to start from.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListDiscoveredResourcesResult({
    this.discoveredResourceList,
    this.nextToken,
  });
  factory ListDiscoveredResourcesResult.fromJson(Map<String, dynamic> json) =>
      _$ListDiscoveredResourcesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListMigrationTasksResult {
  /// Lists the migration task's summary which includes:
  /// <code>MigrationTaskName</code>, <code>ProgressPercent</code>,
  /// <code>ProgressUpdateStream</code>, <code>Status</code>, and the
  /// <code>UpdateDateTime</code> for each task.
  @_s.JsonKey(name: 'MigrationTaskSummaryList')
  final List<MigrationTaskSummary> migrationTaskSummaryList;

  /// If there are more migration tasks than the max result, return the next token
  /// to be passed to the next call as a bookmark of where to start from.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListMigrationTasksResult({
    this.migrationTaskSummaryList,
    this.nextToken,
  });
  factory ListMigrationTasksResult.fromJson(Map<String, dynamic> json) =>
      _$ListMigrationTasksResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListProgressUpdateStreamsResult {
  /// If there are more streams created than the max result, return the next token
  /// to be passed to the next call as a bookmark of where to start from.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// List of progress update streams up to the max number of results passed in
  /// the input.
  @_s.JsonKey(name: 'ProgressUpdateStreamSummaryList')
  final List<ProgressUpdateStreamSummary> progressUpdateStreamSummaryList;

  ListProgressUpdateStreamsResult({
    this.nextToken,
    this.progressUpdateStreamSummaryList,
  });
  factory ListProgressUpdateStreamsResult.fromJson(Map<String, dynamic> json) =>
      _$ListProgressUpdateStreamsResultFromJson(json);
}

/// Represents a migration task in a migration tool.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MigrationTask {
  /// Unique identifier that references the migration task. <i>Do not store
  /// personal data in this field.</i>
  @_s.JsonKey(name: 'MigrationTaskName')
  final String migrationTaskName;

  /// A name that identifies the vendor of the migration tool being used.
  @_s.JsonKey(name: 'ProgressUpdateStream')
  final String progressUpdateStream;

  /// Information about the resource that is being migrated. This data will be
  /// used to map the task to a resource in the Application Discovery Service
  /// repository.
  @_s.JsonKey(name: 'ResourceAttributeList')
  final List<ResourceAttribute> resourceAttributeList;

  /// Task object encapsulating task information.
  @_s.JsonKey(name: 'Task')
  final Task task;

  /// The timestamp when the task was gathered.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'UpdateDateTime')
  final DateTime updateDateTime;

  MigrationTask({
    this.migrationTaskName,
    this.progressUpdateStream,
    this.resourceAttributeList,
    this.task,
    this.updateDateTime,
  });
  factory MigrationTask.fromJson(Map<String, dynamic> json) =>
      _$MigrationTaskFromJson(json);
}

/// MigrationTaskSummary includes <code>MigrationTaskName</code>,
/// <code>ProgressPercent</code>, <code>ProgressUpdateStream</code>,
/// <code>Status</code>, and <code>UpdateDateTime</code> for each task.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MigrationTaskSummary {
  /// Unique identifier that references the migration task. <i>Do not store
  /// personal data in this field.</i>
  @_s.JsonKey(name: 'MigrationTaskName')
  final String migrationTaskName;

  /// Indication of the percentage completion of the task.
  @_s.JsonKey(name: 'ProgressPercent')
  final int progressPercent;

  /// An AWS resource used for access control. It should uniquely identify the
  /// migration tool as it is used for all updates made by the tool.
  @_s.JsonKey(name: 'ProgressUpdateStream')
  final String progressUpdateStream;

  /// Status of the task.
  @_s.JsonKey(name: 'Status')
  final Status status;

  /// Detail information of what is being done within the overall status state.
  @_s.JsonKey(name: 'StatusDetail')
  final String statusDetail;

  /// The timestamp when the task was gathered.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'UpdateDateTime')
  final DateTime updateDateTime;

  MigrationTaskSummary({
    this.migrationTaskName,
    this.progressPercent,
    this.progressUpdateStream,
    this.status,
    this.statusDetail,
    this.updateDateTime,
  });
  factory MigrationTaskSummary.fromJson(Map<String, dynamic> json) =>
      _$MigrationTaskSummaryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NotifyApplicationStateResult {
  NotifyApplicationStateResult();
  factory NotifyApplicationStateResult.fromJson(Map<String, dynamic> json) =>
      _$NotifyApplicationStateResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NotifyMigrationTaskStateResult {
  NotifyMigrationTaskStateResult();
  factory NotifyMigrationTaskStateResult.fromJson(Map<String, dynamic> json) =>
      _$NotifyMigrationTaskStateResultFromJson(json);
}

/// Summary of the AWS resource used for access control that is implicitly
/// linked to your AWS account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProgressUpdateStreamSummary {
  /// The name of the ProgressUpdateStream. <i>Do not store personal data in this
  /// field.</i>
  @_s.JsonKey(name: 'ProgressUpdateStreamName')
  final String progressUpdateStreamName;

  ProgressUpdateStreamSummary({
    this.progressUpdateStreamName,
  });
  factory ProgressUpdateStreamSummary.fromJson(Map<String, dynamic> json) =>
      _$ProgressUpdateStreamSummaryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutResourceAttributesResult {
  PutResourceAttributesResult();
  factory PutResourceAttributesResult.fromJson(Map<String, dynamic> json) =>
      _$PutResourceAttributesResultFromJson(json);
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ResourceAttribute {
  /// Type of resource.
  @_s.JsonKey(name: 'Type')
  final ResourceAttributeType type;

  /// Value of the resource type.
  @_s.JsonKey(name: 'Value')
  final String value;

  ResourceAttribute({
    @_s.required this.type,
    @_s.required this.value,
  });
  factory ResourceAttribute.fromJson(Map<String, dynamic> json) =>
      _$ResourceAttributeFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceAttributeToJson(this);
}

enum ResourceAttributeType {
  @_s.JsonValue('IPV4_ADDRESS')
  ipv4Address,
  @_s.JsonValue('IPV6_ADDRESS')
  ipv6Address,
  @_s.JsonValue('MAC_ADDRESS')
  macAddress,
  @_s.JsonValue('FQDN')
  fqdn,
  @_s.JsonValue('VM_MANAGER_ID')
  vmManagerId,
  @_s.JsonValue('VM_MANAGED_OBJECT_REFERENCE')
  vmManagedObjectReference,
  @_s.JsonValue('VM_NAME')
  vmName,
  @_s.JsonValue('VM_PATH')
  vmPath,
  @_s.JsonValue('BIOS_ID')
  biosId,
  @_s.JsonValue('MOTHERBOARD_SERIAL_NUMBER')
  motherboardSerialNumber,
}

enum Status {
  @_s.JsonValue('NOT_STARTED')
  notStarted,
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('COMPLETED')
  completed,
}

/// Task object encapsulating task information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Task {
  /// Status of the task - Not Started, In-Progress, Complete.
  @_s.JsonKey(name: 'Status')
  final Status status;

  /// Indication of the percentage completion of the task.
  @_s.JsonKey(name: 'ProgressPercent')
  final int progressPercent;

  /// Details of task status as notified by a migration tool. A tool might use
  /// this field to provide clarifying information about the status that is unique
  /// to that tool or that explains an error state.
  @_s.JsonKey(name: 'StatusDetail')
  final String statusDetail;

  Task({
    @_s.required this.status,
    this.progressPercent,
    this.statusDetail,
  });
  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class DryRunOperation extends _s.GenericAwsException {
  DryRunOperation({String type, String message})
      : super(type: type, code: 'DryRunOperation', message: message);
}

class HomeRegionNotSetException extends _s.GenericAwsException {
  HomeRegionNotSetException({String type, String message})
      : super(type: type, code: 'HomeRegionNotSetException', message: message);
}

class InternalServerError extends _s.GenericAwsException {
  InternalServerError({String type, String message})
      : super(type: type, code: 'InternalServerError', message: message);
}

class InvalidInputException extends _s.GenericAwsException {
  InvalidInputException({String type, String message})
      : super(type: type, code: 'InvalidInputException', message: message);
}

class PolicyErrorException extends _s.GenericAwsException {
  PolicyErrorException({String type, String message})
      : super(type: type, code: 'PolicyErrorException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String type, String message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String type, String message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class UnauthorizedOperation extends _s.GenericAwsException {
  UnauthorizedOperation({String type, String message})
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
